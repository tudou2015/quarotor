#include <iostream>
#include "std_msgs/UInt8MultiArray.h"
#include "std_msgs/Empty.h"
#include "std_msgs/UInt8.h"
#include "std_srvs/Empty.h"
#include "std_srvs/SetBool.h"
#include "ros/ros.h"
#include "apdriver/control.h"
#include "april_pro/camera_pos.h"
#include <string>
#define BYTE0(dwTemp)       ( *( (char *)(&dwTemp)		) )
#define BYTE1(dwTemp)       ( *( (char *)(&dwTemp) + 1) )
#define BYTE2(dwTemp)       ( *( (char *)(&dwTemp) + 2) )
#define BYTE3(dwTemp)       ( *( (char *)(&dwTemp) + 3) )
ros::Publisher pub;
ros::Subscriber sub,sub1,sub2,sub3,sub4;
ros::ServiceServer service,service1,service2,service3;

std_msgs::UInt8MultiArray m;
void apcontrol(const apdriver::control &msg){
	m.layout.dim[0].label = "control";
    m.layout.dim[0].size =21;
    m.data.resize(21);
	m.data[20]=0;
	m.data[0]=0xaa;m.data[1]=0xaf;m.data[2]=0x03;m.data[3]=16;
	m.data[4] = BYTE1(msg.thr);m.data[5] = BYTE0(msg.thr);
	m.data[6] = BYTE1(msg.yaw);m.data[7] = BYTE0(msg.yaw);
	m.data[8] = BYTE1(msg.rol);m.data[9] = BYTE0(msg.rol);
	m.data[10] = BYTE1(msg.pit);m.data[11] = BYTE0(msg.pit);
	for (int i = 12;i < 20;i++) {
		m.data[i] = 0;
	}
	for (int i=0;i<20;i++)m.data[20]+=m.data[i];
	pub.publish(m);
}
void unlock(const std_msgs::Empty &msg){
	m.layout.dim[0].label = "unlock";
    m.layout.dim[0].size =6;
    m.data.resize(6);
    m.data[0]=0xAA;m.data[1]=0xAF;m.data[2]=0x20;m.data[3]=0x01;m.data[4]=0xff;m.data[5]=0x79;
    pub.publish(m);

}
void lock(const std_msgs::Empty &msg){
	m.layout.dim[0].label = "lock";
    m.layout.dim[0].size =6;
    m.data.resize(6);
    m.data[0]=0xAA;m.data[1]=0xAF;m.data[2]=0x21;m.data[3]=0x01;m.data[4]=0xff;m.data[5]=0x7A;
    pub.publish(m);

}
void mode(const std_msgs::UInt8 &msg){
	m.layout.dim[0].label = "mode";
    m.layout.dim[0].size =6;
    m.data.resize(6);
    m.data[0]=0xAA;m.data[1]=0xAF;m.data[2]=0x22;m.data[3]=0x01;
    m.data[4]=msg.data;m.data[5]=0x00;
    for (int i=0;i<5;i++)m.data[5]+=m.data[i];
    pub.publish(m);
}


bool unlock_ser(std_srvs::Empty::Request  &req,
               std_srvs::Empty::Response &res)
{
    m.layout.dim[0].label = "unlock";
    m.layout.dim[0].size =6;
    m.data.resize(6);
    m.data[0]=0xAA;m.data[1]=0xAF;m.data[2]=0x20;m.data[3]=0x01;m.data[4]=0xff;m.data[5]=0x79;
    pub.publish(m);
    return true;
}

bool lock_ser(std_srvs::Empty::Request  &req,
               std_srvs::Empty::Response &res)
{
    m.layout.dim[0].label = "lock";
    m.layout.dim[0].size =6;
    m.data.resize(6);
    m.data[0]=0xAA;m.data[1]=0xAF;m.data[2]=0x21;m.data[3]=0x01;m.data[4]=0xff;m.data[5]=0x7A;
    pub.publish(m);
    return true;
}

bool mode_ser(std_srvs::SetBool::Request  &req,
               std_srvs::SetBool::Response &res)
{
    m.layout.dim[0].label = "mode";
    m.layout.dim[0].size =6;
    m.data.resize(6);
    m.data[0]=0xAA;m.data[1]=0xAF;m.data[2]=0x22;m.data[3]=0x01;
    if (req.data)m.data[4]=3;
    else m.data[4]=1;
    m.data[5]=0x00;
    for (int i=0;i<5;i++)m.data[5]+=m.data[i];
    pub.publish(m);
    return true;
}
void position(const april_pro::camera_pos &msg){
    float vx=(float)(msg.vx*72),vy=(float)(msg.vy*72);
    m.layout.dim[0].label = "speed";
    m.layout.dim[0].size =13;
    m.data.resize(13);
    m.data[0]=0xAA;m.data[1]=0xAF;m.data[2]=0x24;m.data[3]=0x08;
    m.data[4]=BYTE3(vx);m.data[5]=BYTE2(vx);m.data[6]=BYTE1(vx);m.data[7]=BYTE0(vx);
    m.data[8]=BYTE1(vy);m.data[9]=BYTE0(vy);m.data[10]=BYTE0(vy);m.data[11]=BYTE0(vy);
    m.data[12]=0;
    for (int i=0;i<12;i++)m.data[12]+=m.data[i];
    pub.publish(m);
}
int main(int argc,char **argv){
	ros::init(argc, argv, "apdriver");
    ros::NodeHandle n;
    m.layout.dim.push_back(std_msgs::MultiArrayDimension());
    m.layout.dim[0].stride = 1;
    pub = n.advertise<std_msgs::UInt8MultiArray>("array_write", 1000);
    sub = n.subscribe("apcontrol", 1000, &apcontrol);
    sub1 = n.subscribe("unlock", 1000, &unlock);
    sub2 = n.subscribe("lock", 1000, &lock);
    sub3 = n.subscribe("mode",1000,&mode);
 //   sub4 = n.subscribe("position",1000,&position);
    service=n.advertiseService("unlock", unlock_ser);
    service1=n.advertiseService("lock", lock_ser);
    service2=n.advertiseService("mode", mode_ser);
    
    
    while(ros::ok())
    ros::spin();
	return 0;
}
