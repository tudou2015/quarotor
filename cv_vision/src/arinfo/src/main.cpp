/*************************************************************************
    > File Name: main.cpp
    > Author: FanMing Luo
    > Mail: 151190065@smail.nju.edu.cn 
    > Created Time: 2017年01月12日 星期四 20时43分36秒
 ************************************************************************/

#include <iostream>
#include "ros/ros.h"
#include "std_msgs/UInt8MultiArray.h"
#include "std_msgs/MultiArrayDimension.h"
#include "arinfo/arinfo.h"
#include <queue>
#include <assert.h>
ros::Publisher pub;
arinfo::arinfo msg1;
std::queue <unsigned char> all;
void info (const std_msgs::UInt8MultiArray &msg){
for (int i=0;i<msg.layout.dim[0].size ;i++)all.push(msg.data[i]);
if (all.size()<19)return;
int step=0;
while (all.size()>0){
	switch (step){
		case 0:{
			if (all.front()==170){step=1;}
			else{step=0;}
			break;
		}
		case 1:{
			if (all.front()==170){step=2;}
			else{step=0;}

			break;
		}
		case 2:{
			if (all.front()==1){step=3;}
			else{step=0;}
			break;
		}
		case 3:{
			if (all.front()==14){step=4;}
			else{step=0;}
			break;
		}
		case 4:{
			if (all.size()<15) return;
			else {unsigned char temp1=all.front();all.pop();
				unsigned char temp2=all.front();all.pop();
				msg1.roll=(short)((temp1<<8)|temp2);
				temp1=all.front();all.pop();temp2=all.front();all.pop();
				msg1.pitch=(short)((temp1<<8)|temp2);
				temp1=all.front();all.pop();temp2=all.front();all.pop();
				msg1.yaw=(short)((temp1<<8)|temp2);
				for (int i=0;i<3;i++)all.pop();
                msg1.state=all.front();all.pop();
				msg1.mode=all.front();all.pop();
				msg1.lock = 1-all.front();all.pop();
				temp1=all.front();all.pop();temp2=all.front();all.pop();
				msg1.height=(short)((temp1<<8)|temp2);
				all.pop();
				msg1.header.stamp=ros::Time::now();
				pub.publish(msg1);
				step=0;
				if (all.size()<19)return ;
				

			}
		}

	}
	all.pop();

}
}

int main(int argc, char **argv){
	ros::init(argc, argv, "arinfo");
    ros::NodeHandle n;
    pub = n.advertise<arinfo::arinfo>("arinfo", 1000);
	ros::Subscriber sub = n.subscribe("/uartRE", 1000, &info); 
	ros::spin();

	return 0;
}
