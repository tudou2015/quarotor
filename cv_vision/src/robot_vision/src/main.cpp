/*************************************************************************
    > File Name: main.cpp
    > Author: FanMing Luo
    > Mail: 151190065@smail.nju.edu.cn
    > Created Time: 2017年01月09日 星期一 13时50分10秒
 ************************************************************************/
#include "unistd.h"
#include <iostream>
#include "std_msgs/UInt8MultiArray.h"
#include "std_msgs/UInt8.h"
#include "std_msgs/Empty.h"
#include "apdriver/control.h"
#include "april_pro/camera_pos.h"
#include "ros/ros.h"
#include "geometry_msgs/Twist.h"
#include "std_srvs/Empty.h"
#include <string>
#define position_offset 0
#include <cstdlib>
#include <math.h>
#define LPF_1(hz,t,in,out) ((out) += ( 1 / ( 1 + 1 / ( (hz) *6.28f *(t) ) ) ) *( (in) - (out) ))
void Moving_Average(float movearray[], int16_t len, int16_t *fil_cnt, float in,float *out);
float To_180_degrees(float x);
int16_t limit(int16_t x, int16_t min, int16_t max);
int16_t absint(int16_t x);
april_pro::camera_pos pos_filter,pos_filter2;
struct Target
{
    float x1;   
    float y1;
    float yaw1;
    float x2;
    float y2;
    float yaw2;
}target{0,0,0,0,0,0};

struct Pos
{
    float x;    //mm
    float y;    //mmj
    float yaw;
    float x_sp;
    float y_sp;
    float dist;
}currentPos{0,0,0,0,0,0},errPos,oldPos,relativePos,output;

struct para
{
    float P;
    float D;
    float feedback_d;
	float I;
	float I_limit;
	float err_ix;
	float err_iy;
}arg = { 0.10,0.14,0.1,0.01,30.0,0.0,0.0},
arg1 = { 0.22,0.24,0.1,0.03,30.0,0.0,0.0};
int Calc_PID(float interval);
Pos Calc_Pos(float interval,float coordinate_x,float coordinate_y,float yaw);
int16_t Pitch, Roll, Yaw;
float final_sp_x,final_sp_y;
float position_x[15],position_y[15];
int16_t fill_cnt_x,fill_cnt_y;
int16_t fill_cnt_vx,fill_cnt_vy;
float position_vx[15],position_vy[15];
float rad2degree=180.0/3.141592653;
apdriver::control control_msg;
ros::Publisher control;
ros::Publisher unlock;
ros::Publisher pub_filter;
#define d0 7.50
bool yaw_flag=false,speed_flag=false,vx_en=false,vy_en=false;
double x_s=-100.0,y_s=-100.0;
double x_old[120],y_old[120];
double x_center[120],y_center[120];
void simcallback(const geometry_msgs::Twist &msg){
    if (msg.linear.x>0)control_msg.pit=1700;
    else if (msg.linear.x<0)control_msg.pit=1300;
    if (msg.angular.z>0)control_msg.rol=1300;
    else if (msg.angular.z<0)control_msg.rol=1700;

}
int sec=100;
double abs(double x){
    return (x>0)?x:-x;
}

double vx_old=-1000,vy_old=-1000;
int num_vx=0,num_vy=0,step=0;
double vx_aver=0,vy_aver=0,vx_all=0,vy_all=0;
bool start_flag=true,control_flag=true,control_flag2=true;
float x_sendold,y_sendold;
ros::Time old;

void april_anl_s(const april_pro::camera_pos &msg)
{
	static int START_FLAG=0;
	//control_msg.pit = 1500;
	//control_msg.rol = 1500;
	//control_msg.yaw = 1500;
	//control_msg.thr = 1000;
	float interval = (msg.header.stamp-old).toSec();
	if (interval>1.0f){old=msg.header.stamp; return;}
	old = msg.header.stamp;
	Calc_Pos(interval,10*msg.x,10*msg.y,msg.yaw);
	Calc_PID(interval);
	if (START_FLAG<7){
		START_FLAG++;
		return;
	}
	pos_filter = msg;
	pos_filter.x = currentPos.x/10;
	pos_filter.y = currentPos.y/10;

	pos_filter2.vx = target.x1/10;
	pos_filter2.vy = target.y1/10;
	LPF_1(0.1, interval, pos_filter.x, pos_filter2.x);
	LPF_1(0.1, interval, pos_filter.y, pos_filter2.y);
//	if (abs(x_sendold-pos_filter2.x)<4&&abs(y_sendold-pos_filter2.y)<4)
	//LPF_1(10, interval, pos_filter.vx, pos_filter2.vx);
	//LPF_1(10, interval, pos_filter.vy, pos_filter2.vy);

	pub_filter.publish(pos_filter2);
	x_sendold = pos_filter2.x;
	y_sendold = pos_filter2.y;

	control_msg.pit+=(int)(Pitch-1500);
        control_msg.rol+=(int)(Roll-1500);
	control_msg.yaw+=(int)(Yaw-1500);
	std::cout<<"x = "<<msg.x*10.0<<std::endl;
	std::cout<<"y = "<<msg.y*10.0<<std::endl;
	std::cout<<"CX = "<<currentPos.x<<std::endl;
	std::cout<<"CY = "<<currentPos.y<<std::endl;
	std::cout<<"Rx="<<relativePos.x<<std::endl;
	std::cout<<"Ry="<<relativePos.y<<std::endl;
	std::cout<<"old_x="<<oldPos.x<<std::endl;
	std::cout<<"old_y="<<oldPos.y<<std::endl;
	std::cout<<"old_xsp="<<oldPos.x_sp<<std::endl;
	std::cout<<"old_ysp="<<oldPos.y_sp<<std::endl;
    std::cout<<"out_x="<<output.x<<std::endl;
    std::cout<<"out_y="<<output.y<<std::endl;
	std::cout<<"out_x_sp="<<output.x_sp<<std::endl;
	std::cout<<"out_y_sp="<<output.y_sp<<std::endl;
    //std::cout<<"x_R"<<currentPos.x*cos(currentPos.yaw) + currentPos.y*sin(currentPos.yaw)<<std::endl;
	std::cout<<"vx="<<final_sp_x<<std::endl;
	std::cout<<"vy="<<final_sp_y<<std::endl;
	std::cout<<"yaw="<<msg.yaw/3.1415*180<<"\n\n";


}

void april_anl(const april_pro::camera_pos &msg){
    int change=150.0,change2=120.0;
    bool su_flag=false,ji_flag=false;
    double con=6.0f,wei=20.0,bei=8.0f,con_max=20.0f,bei2=1.2f;
    double delta_y=msg.y-y_s,delta_x=msg.x-x_s;
    double change_x=-delta_x*cos(msg.yaw)-delta_y*sin(msg.yaw),
            change_y=delta_y*cos(msg.yaw)-delta_x*sin(msg.yaw);
    int time_max=180,time_max2=120;
    std::cout<<std::endl<<"x="<<change_x<<" ,y="<<change_y<<std::endl;
    std::cout<<"vx="<<msg.vx<<" ,vy="<<msg.vy<<std::endl;
    std::cout<<"v_roll="<<msg.v_roll<<" ,v_pitch="<<msg.v_pitch<<std::endl;
//    vx_en=(abs(msg.v_roll)<0.1f);
//    vy_en=(abs(msg.v_pitch)<0.1f);
    double v_all=sqrt(msg.vy*msg.vy+msg.vx*msg.vx),move_all=sqrt(change_x*change_x+change_y*change_y);
    switch (step) {
    case 0:
        if (move_all<wei){step=3;break;}
        control_msg.pit-=(int)((change_y/move_all)*change2);
        control_msg.rol-=(int)((change_x/move_all)*change2);
        sec=120;
        old=ros::Time::now();
        step=1;
        break;
    case 1:
        if ((msg.header.stamp-old).toSec()>1.0f||move_all<wei){
            step=2;
        }
        break;
    case 2:
        sec=(int)(v_all*bei);
        control_msg.pit-=(int)((msg.vy/v_all)*change);
        control_msg.rol-=(int)((msg.vx/v_all)*change);
        old=ros::Time::now();
        step=0;
        break;
    case 3:
        if ((msg.header.stamp-old).toSec()>1.0f)
                step=2;
        break;
    default:
        break;
    }
    }

void path(const april_pro::camera_pos &msg){
target.x1 = msg.x;
target.y1 = msg.y;
	
}

int main(int argc, char **argv){
    ros::init(argc, argv, "april_bridge");
    ros::NodeHandle n;
    unlock = n.advertise<std_msgs::Empty>("unlock", 1);
    ros::Publisher lock = n.advertise<std_msgs::Empty>("lock",1);
    ros::Publisher mode = n.advertise<std_msgs::UInt8>("mode",1);
	pub_filter = n.advertise<april_pro::camera_pos>("position_filter",1000);
    control = n.advertise<apdriver::control>("apcontrol",1);
    std_msgs::Empty empty_msg;
    std_msgs::UInt8 mode_msg;
    control_msg.pit=1500;
    control_msg.rol=1500;
    control_msg.yaw=1500;
    control_msg.thr=1000;

    ros::Rate loop_rate(30);
	//ros::Rate loop_rate(3);
    mode_msg.data=3;
    for (int i=0;i<49;i++){
        x_center[i]=(i%7)*d0*3;
        y_center[i]=i/7*d0*3+120.37;
    }
    for (int i=0;i<49;i++){
        x_center[i+49]=(i%7)*d0*3;
        y_center[i+49]=(i/7)*d0*3;
    }
    x_s=*(x_center+3);y_s=*(y_center+3);
    ros::Subscriber sub2=n.subscribe("/position",1,&april_anl_s);
	ros::Subscriber sub3=n.subscribe("target",1000,&path);
//	for (int i = 0;i<15;i++){
//		position_x[i]=1500;
//		position_y[i]=1500;
//	}
	old=ros::Time::now();
    //ros::ServiceServer service = n.advertiseService("unlock", &unlock);
    while (ros::ok()){
		
        control_msg.pit=1500;control_msg.rol=1500;
        control_msg.yaw=1500;control_msg.thr=1000;
			
        ros::spinOnce();
		control.publish(control_msg);
	loop_rate.sleep();
    }


    return 0;
}




void Moving_Average(float movearray[], int16_t len, int16_t *fil_cnt, float in,float *out)
{
    int16_t width_num = len;
    float last;

    if (++*fil_cnt >= width_num)
        *fil_cnt = 0; //now

    last = movearray[*fil_cnt];
    movearray[*fil_cnt] = in;
    *out += (in - (last)) / (float)(width_num);
}

float To_180_degrees(float x)
{
    return (x>180 ? (x - 360) : (x<-180 ? (x + 360) : x));
}
int16_t limit(int16_t x, int16_t min, int16_t max)
{
    if (x < min)
        return min;
    if (x > max)
        return max;
    return x;
}
float limitfloat(float x, float min, float max)
{
    if (x < min)
        return min;
    if (x > max)
        return max;
    return x;
}
int16_t absint(int16_t x)
{
    if(x > 0)
        return x;
    else
        return -x;
}

//yaw~[-180,180]
Pos Calc_Pos(float interval,float coordinate_x,float coordinate_y,float yaw)
{

    oldPos = currentPos;
//	if (abs(oldPos.x-coordinate_x)>100||abs(oldPos.y-coordinate_y)>100)
//		coordinate_x=oldPos.x,coordinate_y=oldPos.y;
    Moving_Average(position_y, 3, &fill_cnt_y, coordinate_y, &currentPos.y);
    Moving_Average(position_x,3,&fill_cnt_x,coordinate_x, &currentPos.x);
	
   //LPF_1(15,interval,coordinate_x,currentPos.x);
//LPF_1(15,interval,coordinate_y,currentPos.y);
	currentPos.yaw = 0.75*currentPos.yaw +0.25*yaw;
    currentPos.x_sp = 0.90*(currentPos.x - oldPos.x) / interval + 0.10*oldPos.x_sp;// cm/s
    currentPos.y_sp = 0.90*(currentPos.y - oldPos.y) / interval + 0.10*oldPos.y_sp;
    currentPos.yaw = To_180_degrees(yaw);
    currentPos.dist = sqrt(currentPos.y*currentPos.y + currentPos.x*currentPos.x);
}

int Calc_PID(float interval)
{
	Yaw = 1500;
//    Yaw = 1.5*(rad2degree*currentPos.yaw - target.yaw1);
//	if (absint(Yaw)<20&&Yaw!=0)Yaw = (Yaw>0)?20:-20;
 //   Yaw = (rad2degree*currentPos.yaw - target.yaw1)>0?150:-150;
 //   Yaw = limit(-Yaw+1500, 1300, 1700);
//	std::cout<<"dist="<<currentPos.dist<<"\n";
    relativePos.x = (currentPos.x - target.x1)*cos(currentPos.yaw) + (currentPos.y-target.y1)*sin(currentPos.yaw);
    relativePos.x_sp = currentPos.x_sp*cos(currentPos.yaw) + currentPos.y_sp*sin(currentPos.yaw);
    relativePos.y = (currentPos.x - target.x1)*sin(currentPos.yaw) -  (currentPos.y-target.y1)*cos(currentPos.yaw);
    relativePos.y_sp = currentPos.x_sp*sin(currentPos.yaw) - currentPos.y_sp*cos(currentPos.yaw);
	relativePos.dist = sqrt(relativePos.x*relativePos.x+relativePos.y*relativePos.y);

    LPF_1(6,interval,relativePos.x,output.x);
    LPF_1(6,interval,relativePos.y,output.y);
    LPF_1(10,interval,relativePos.x_sp,output.x_sp);
    LPF_1(10,interval,relativePos.y_sp,output.y_sp);
//	if (relativePos.dist < 150) //距离小于10cm，不调节pitch，roll
        if (absint(target.yaw1 - rad2degree*(currentPos.yaw)) > 5)
        {
    Yaw = 1.5*(rad2degree*currentPos.yaw - target.yaw1);
	
	//Pitch = 1500; Roll = 1500;
//			std::cout<<"Yaw="<<Yaw<<"\n\n";
    Yaw = limit(-Yaw+1500, 1300, 1700);
	//return 0;
  //          return 0;//不调节
        }

      //  else
      //  {
    //        Pitch = 1500; Roll = 1500;
     //       return 1;//只调节yaw
      //  }
            
    //target coordinate should be transformed too!

   // Moving_Average(position_vx,3,&fill_cnt_vx,output.x_sp, &final_sp_x);
   // Moving_Average(position_vy,3,&fill_cnt_vy,output.y_sp, &final_sp_y);
	
	
	double error_x = (currentPos.x - oldPos.x)*cos(currentPos.yaw) + (currentPos.y - oldPos.y)*sin(currentPos.yaw),
		error_y = (currentPos.x - oldPos.x)*sin(currentPos.yaw) - (currentPos.y - oldPos.y)*cos(currentPos.yaw);

//	if (abs(error_x) < 100) {
		arg.err_ix += relativePos.x*interval;
		arg.err_ix = limitfloat(arg.err_ix, -arg.I_limit, arg.I_limit);
	
		arg1.err_ix += relativePos.x*interval;
		arg1.err_ix = limitfloat(arg1.err_ix, -arg1.I_limit, arg1.I_limit);
		
		arg.err_iy += relativePos.y*interval;
		arg.err_iy = limitfloat(arg.err_iy, -arg.I_limit, arg.I_limit);
		
		arg1.err_iy += relativePos.y*interval;
		arg1.err_iy = limitfloat(arg1.err_iy, -arg1.I_limit, arg1.I_limit);
	if(relativePos.dist>150){


		Pitch = arg.P*(output.y) + arg.D*(output.y_sp) + arg.I*arg.err_iy;
Roll = arg.P*(output.x) + arg.D*(output.x_sp) + arg.I*arg.err_ix;
	}
else{
Roll = arg1.P*(output.x) + arg1.D*(output.x_sp) + arg1.I*arg1.err_ix;


		Pitch = arg1.P*(output.y) + arg1.D*(output.y_sp) + arg1.I*arg1.err_iy;
}
/*if (error_y>100){
		Pitch = arg.P*(output.y) + arg.D*(output.y_sp) + arg.I*arg.err_iy;

}else{
		Pitch = arg1.P*(output.y) + arg1.D*(output.y_sp) + arg1.I*arg1.err_iy;

}*/
		Roll = limit(1500 - Roll, 1400, 1600);
    
		Pitch = limit(1500 - Pitch, 1400, 1600);
	
    
          //200;120 for pos ,80 for sp 
    
    return 2;
}



