/************************************************************************
    > File Name: src/main.cpp
    > Author: Luofanming
    > Mail:151190065@smail.nju.edu.cn 
    > Created Time: Fri 14 Jul 2017 05:31:58 AM UTC
 ***********************************************************************/
//#include "main.h"
#include <ros/ros.h>    
#include <iostream>
#include "arinfo/arinfo.h" 
#include "april_pro/camera_pos.h" 
#include "apdriver/control.h"

class control {
	private:
		float argP,argI,argD,output,ILimit,OLimit;
		float limit(float MAX,float MIN,float item){
			if(item>MAX)return MAX;
			if(item<MIN)return MIN;
			return item;
		}
	public:
		control(float p,float i,float d,float ILimit,float OLimit=100.0f,float ref=0.0f):p(p),i(i),d(d),ILimit(ILimit),OLimit(OLimit),ref(ref){
			argP=argI=argD=0;
			fdb=err=err_old=0;
		}

		float pidCal(float T){
			err=ref-fdb;
			argP=err;
			argI+=err*T;
			argI=limit(ILimit,-ILimit,argI);
			argD=(err-err_old)/T;
			output=p*argP+i*argI+d*argD;
			output=limit(OLimit,-OLimit,output);
			err_old=err;
			return output; 
		}
		float ref,fdb,err,err_old;
		float p,i,d;
};

ros::Publisher pub;
apdriver::control con;
//0.34
//#define EXP_ROLL 156.9846
//#define EXP_PITCH 124.7260
#define EXP_ROLL 160
#define EXP_PITCH 120
control my_control_x(0.34f,0.0f,0.20f,200.0f,50.0f,EXP_ROLL);
control my_control_y(0.34f,0.0f,0.20f,200.0f,50.0f,EXP_PITCH);
ros::Time old;

#define ON_PITCH 1515
#define OFF_PITCH 1470
#define ON_ROLL 1530
#define OFF_ROLL 1470
#define DELAY_TIME 3.0
#define BET 5.0
#define PITCH_MID 1500
#define ROLL_MID 1500
#define MY_JU(x,y) ((x)*(x)+(y)*(y))
int my_delay(int times,float length)
{
	static int my_time[20];
	
	my_time[times]++;

	for (int i=0;i<20;i++){
		if (i!=times){
			my_time[i]=0;
		}
	}
	if (my_time[times]>length){
		return 1;
	}else {
		return 0;
	}

}
int GetCircle,GetGrLine,GetHoLine;
int control_delay(int times,float length){

	static int my_time[20];
	
	my_time[times]++;

	for (int i=0;i<20;i++){
		if (i!=times){
			my_time[i]=0;
		}
	}
	if (my_time[times]>length){
		return 1;
	}else {
		return 0;
	}

}
void WingCircle(const april_pro::camera_pos &msg,double T){
	my_control_x.ref=0.0f;
	my_control_y.ref=0.0f;
	my_control_x.fdb=msg.x;
	my_control_y.fdb=msg.y;
	
	con.rol=ROLL_MID+my_control_x.pidCal(T);
	con.pit=PITCH_MID+my_control_y.pidCal(T);
	if (msg.z<20){
		con.rol=ROLL_MID;
		con.pit=PITCH_MID;

	}
	//	con.pit=1500;
	con.yaw=1500;
	con.thr=1000;
	if (msg.vx==1){
		con.rol=ROLL_MID;
		con.pit=PITCH_MID;
	}
	my_control_x.ref=EXP_ROLL;
	my_control_y.ref=EXP_PITCH;
}

void WingCorner(const april_pro::camera_pos &msg,double T){
	my_control_x.fdb=msg.v_roll;
	my_control_y.fdb=msg.v_pitch;
	
	con.rol=ROLL_MID-my_control_x.pidCal(T);
	con.pit=PITCH_MID+my_control_y.pidCal(T);
	con.yaw=1500;
	con.thr=1000;
	if (msg.vx==1){
		con.rol=ROLL_MID;
		con.pit=PITCH_MID;
	}
	my_control_x.ref=EXP_ROLL;
	my_control_y.ref=EXP_PITCH;
}
void StickHoLine(const april_pro::camera_pos &msg,double T){
		my_control_y.fdb=msg.pitch;
		con.pit=PITCH_MID+my_control_y.pidCal(T);
		con.yaw=1500;
		con.thr=1000;
}

void StickGrLine(const april_pro::camera_pos &msg,double T){
		my_control_x.fdb=msg.roll;
		con.rol=ROLL_MID-my_control_x.pidCal(T);
		con.yaw=1500;
		con.thr=1000;
}

void StickLine(const april_pro::camera_pos &msg,double T){
		if(GetGrLine){
		StickGrLine(msg,T);
		}
		if (GetHoLine){
		StickHoLine(msg,T);
		}
		if (msg.vx==1||msg.z<20){
		con.pit=PITCH_MID;
		con.rol=ROLL_MID;
	}
}
void StickCorner(const april_pro::camera_pos &msg,double T){
	if(GetCircle){
		WingCircle(msg,T);
	}
	else if (GetGrLine&&GetGrLine){
		my_control_x.fdb=msg.roll;
		my_control_y.fdb=msg.pitch;
		con.pit=PITCH_MID+my_control_y.pidCal(T);
		con.rol=ROLL_MID-my_control_x.pidCal(T);
		con.yaw=1500;
		con.thr=1000;
	}
	else 
	{

		con.pit=1500;
		con.rol=1500;
		con.yaw=1500;
		con.thr=1000;
		StickLine(msg,T);
		}
	//else {
	//	con.pit=PITCH_MID;
	//	con.rol=ROLL_MID;
	//	on.yaw=1500;
	//	con.thr=1000;
	//}
	if (msg.vx==1||msg.z<20){
		con.pit=PITCH_MID;
		con.rol=ROLL_MID;
	}
}



void posCallback(const april_pro::camera_pos &msg){
	double T = (msg.header.stamp-old).toSec();
	old=msg.header.stamp;
    WingCircle(msg,T);
    /*	GetCircle=(msg.id&0x01),
		GetGrLine=(msg.id&0x02),
		GetHoLine=(msg.id&0x04);
	int state=0;
	static int step=0;
	if (GetHoLine&&GetGrLine){
		if (msg.id&0x80){
			state=1;					//起点圆
		}else if (msg.id&0x08){
			state=2;					//第一个拐角
		}else if (msg.id&0x10){
			state=3;					//第二个拐角 7形状
		}else if (msg.id&0x100){
			state=4;					//第二个圆
		}
		else if (msg.id&0x20){
			state=5;					//第三个拐角F 形
		}else if (msg.id&0x40){
			state=6;					//第四个拐角 L形
		}
	}
	if (step==0){
		con.pit=PITCH_MID;
		con.rol=ROLL_MID;
		con.yaw=1500;
		con.thr=1000;
		if (state==1&&msg.z>20){
			step++;
		}
	}else if (step==1){
		StickCorner(msg,T);
		if (MY_JU(msg.x,msg.y)<400||MY_JU(msg.roll-EXP_ROLL,msg.pitch-EXP_PITCH)<400){
			step++;
		}
	}else if (step==2){
		StickHoLine(msg,T);
		if ((state==1)||(state!=2&&GetHoLine&&GetGrLine)){
			con.rol=ON_ROLL;
		}else{
			con.rol=ROLL_MID;
		}
		if (state==2){
			step++;
		}
	}else if (step==3){
		StickCorner(msg,T);
		if (MY_JU(msg.roll-EXP_ROLL,msg.pitch-EXP_PITCH)<400){
			step++;
		}
	}else if(step==4){
		StickGrLine(msg,T);
		if (state==2||(state!=3&&GetHoLine&&GetGrLine)){
			con.pit=ON_PITCH;
		}else{
			con.pit=PITCH_MID;
		}
		if (state==3){
			step++;
		}
	}else if(step==5){
		StickCorner(msg,T);
		if (MY_JU(msg.roll-EXP_ROLL,msg.pitch-EXP_PITCH)<400){
			step++;
		}
	}else if (step==6){
		StickHoLine(msg,T);
		if ((state==3)||(state!=4&&GetHoLine&&GetGrLine)||(state!=5&&GetHoLine&&GetGrLine)){
			con.rol=OFF_ROLL;
		}else{
			con.rol=ROLL_MID;
		}
		if (state==4||GetCircle){
			step++;
		}
		if (state==5){
			step+=3;
		}
	}else if (step=6){
		StickCorner(msg,T);
		if (MY_JU(msg.x,msg.y)<400||MY_JU(msg.roll-EXP_ROLL,msg.pitch-EXP_PITCH)<400){
			step++;
		}
	}else if (step==7){
		StickHoLine(msg,T);
		if (state==4||(state!=5&&GetHoLine&&GetGrLine)){
			con.rol=OFF_ROLL;
		}else {
			con.rol=ROLL_MID;
		}
		if (state==5){
			step++;
		}
	}else if (step==8){
		StickCorner(msg,T);
		if (MY_JU(msg.roll-EXP_ROLL,msg.pitch-EXP_PITCH)<400){
			step++;
		}
	}else if (step==9){
		StickGrLine(msg,T);
		if (state==5||(state!=6&&GetHoLine&&GetHoLine)){
			con.pit=OFF_PITCH;
		}else {
			con.pit=PITCH_MID;
		}
		if (state==6){
			step++;
		}
	}else if (step==10){
		StickCorner(msg,T);
		if (MY_JU(msg.roll-EXP_ROLL,msg.pitch-EXP_PITCH)<400){
			step++;
		}
	}else if (step==11){
		StickHoLine(msg,T);
		if (state==6||(state!=1&&GetHoLine&&GetHoLine)){
			con.rol=ON_ROLL;
		}else {
			con.rol=ROLL_MID;
		}
		if (state==1){
			step=1;
		}
	}*/
	pub.publish(con);
    /*if (msg.vx!=1){
	std::cout<<" Cicle: "<<GetCircle<<" Gradiant: "<<GetGrLine<<" Horizan: "<< GetHoLine<<" step "<<step<<"\n";
	std::cout<<" pitch: "<<con.pit<<" roll "<<con.rol<<"\n";
	std::cout<<" state: "<<state<<"\n";
	if (GetHoLine){
		std::cout<<"To HoLine "<<msg.pitch<<"\n";
	}
	if (GetGrLine){
		std::cout<<"To GrLine"<<msg.roll<<"\n";
	}
	std::cout<<"\n\n";
	}*/
}

int main(int argc,char**argv)
{
	ros::init(argc,argv,"dsxunji");
	ros::NodeHandle n;
	old=ros::Time::now();
	pub=n.advertise<apdriver::control>("apcontrol",1);
	ros::Subscriber sub=n.subscribe("position",1,posCallback);
	ros::spin();
	return 0;
}
