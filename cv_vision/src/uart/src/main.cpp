#include "ros/ros.h"
#include "std_msgs/String.h"
#include "sensor_msgs/Imu.h"
#include "uart/uart_srv.h"
#include "geometry_msgs/Twist.h"
#include "geometry_msgs/PoseStamped.h"
#include "uart/mpu6050.h"
#include <sstream>
#include <vector>
#include "serial1.h"
#include "std_msgs/UInt8MultiArray.h"
#include "std_msgs/MultiArrayDimension.h"
int fd;


void write_callback(const std_msgs::String &msg) 
{ 
    std::string temp=msg.data;
    char dst[1000];
    strcpy(dst,temp.c_str());
    
    write(fd,dst,temp.length());
    write(fd,"\r\n",2);
} 

void write_callback2(const std_msgs::String &msg) 
{ 
    std::string temp=msg.data;
    int begin = 0;
    begin = temp.find(" ",begin);  //查找空格在str中第一次出现的位置
    while(begin != -1)  //表示字符串中存在空格
        
    {
        temp.replace(begin, 1, "");  // 用空串替换str中从begin开始的1个字符
        begin =temp.find(" ",begin);  //查找空格在替换后的str中第一次出现的位置
    }
    int len =temp.size();
    if (len%2!=0||len<2){
        ROS_INFO("input should be pairs!");
        return;
    }
    unsigned char *temp1=new unsigned char(len/2);
    
    for (int i=0;i<len/2;i++){
        sscanf(temp.substr(0,2).c_str(),"%X",temp1+i);
        temp.erase(0,2);
    }
    write(fd,temp1,len/2);
} 
void array_write(const std_msgs::UInt8MultiArray &msg){
    int size=msg.layout.dim[0].size;
    unsigned char *a = new unsigned char[size];
    for (int i=0;i<size;i++)a[i]=msg.data[i];
    write(fd,a,size);
    delete [] a;
}
bool uart_send(uart::uart_srv::Request  &req,
               uart::uart_srv::Response &res)
{
    std::string temp=req.input;
    char dst[1000];
    strcpy(dst,temp.c_str());
    
    res.output=write(fd,dst,temp.length());
    write(fd,"\r\n",2);
    return true;
}

bool uart_send_byte(uart::uart_srv::Request  &req,
                    uart::uart_srv::Response &res){
    std::string temp=req.input;
    int begin = 0;
    
    begin = temp.find(" ",begin);  //查找空格在str中第一次出现的位置
    while(begin != -1)  //表示字符串中存在空格
        
    {
        temp.replace(begin, 1, "");  // 用空串替换str中从begin开始的1个字符
        begin =temp.find(" ",begin);  //查找空格在替换后的str中第一次出现的位置
    }
    int len =temp.size();
    if (len%2!=0||len<2){
        ROS_INFO("input should be pairs!");
        return false;
    }
    unsigned char *temp1=new unsigned char(len/2);
    
    for (int i=0;i<len/2;i++){
        sscanf(temp.substr(0,2).c_str(),"%X",temp1+i);
        temp.erase(0,2);
    }
    
    res.output=write(fd,temp1,len/2);
    
}



int main(int argc, char **argv)
{
    ros::init(argc, argv, "uart_listener");
    
    ros::NodeHandle n;
    //ros::Publisher pub2 = n.advertise<uart::mpu6050>("mpu6050", 1000);

    ros::Publisher pub2 = n.advertise<std_msgs::UInt8MultiArray>("uartRE", 1000);
    ros::Subscriber write_sub = n.subscribe("uart_write", 1000, write_callback); 
    ros::Subscriber write_sub2 = n.subscribe("uart_byte_write", 1000, write_callback2);
	ros::Subscriber write_array=n.subscribe("array_write",1000,array_write);
    ros::Rate loop_rate(100);
    ros::ServiceServer service = n.advertiseService("string_send", uart_send);
    ros::ServiceServer service2 = n.advertiseService("byte_send", uart_send_byte);
    ROS_INFO("service is ok");
    uart::mpu6050 msg;
//    geometry_msgs::PoseStamped msg;
//    msg.header.frame_id="mpu6050";
   struct timeval time;
    time.tv_sec = 0;
    time.tv_usec = 0;
    fd_set fs_read;
    
    unsigned char buff[512];
    std::list<unsigned char>::iterator it,it1,it2,it3;
    std::list<unsigned char> all;
    unsigned char data[100];
    //short data_out[100];
    unsigned char sum;
    int nread,i;
    int port;
    n.param<int>("portNumber",port,0);
    n.getParam("portNumber",port);
    if((fd=open_port(fd,port))<0)
    {
        perror("open_port error");
        return 0;
    }
    
    if((i=set_opt(fd,115200,8,'N',1))<0)
    {
        perror("set_opt error");
        return 0;
    }
    std_msgs::UInt8MultiArray m;
    m.layout.dim.push_back(std_msgs::MultiArrayDimension());
    m.layout.dim[0].stride = 1;
    m.layout.dim[0].label = "uart";
    while (ros::ok()){
        FD_ZERO(&fs_read);
        FD_SET(fd,&fs_read);
        nread= select(fd+1,&fs_read,NULL,NULL,&time);
        if (nread>0){

               nread=read(fd,buff,512);
               //std_msgs::MultiArrayLayout msg;
               
               m.layout.dim[0].size =nread;
               
               m.data.resize(nread);
               for (int i=0;i<nread;i++){
                   m.data[i]=buff[i];
               }
               pub2.publish(m);
//            for (int i=0;i<nread;i++){
//                all.push_back(buff[i]);
//            }
//            if (all.size()<=4)continue;
//            while (all.size()>4){
//                it=all.begin();
//                it1=it;it1++;
//                it2=it1;it2++;
//                if (*it==0xAA&&*(it1)==0xAA&&*(it2)==0x00){
//                    break;
//                }
//                else {
//                    all.erase(it);
//                }
//            }
//            sum=0;
//            if (all.size()<=4)continue;
//            int len=*(++it2);
//            if (all.size()<len+5)continue;
//            for (int i=0;i<len/2;i++){
//                data[2*i]=*(++it2);
//                data[2*i+1]=*(++it2);
//                data_out[i]=((data[2*i])<<8)|(data[2*i+1]);
//                sum+=data[2*i];
//                sum+=data[2*i+1];
//            }
//            sum+=(2*0xAA+len);
//            if (sum==*(++it2)){
//                                msg.ax=data_out[0];
//                                msg.ay=data_out[1];
//                                msg.az=data_out[2];
//                                msg.gx=data_out[3];
//                                msg.gy=data_out[4];
//                                msg.gz=data_out[5];
//                pub2.publish(msg);
//            }
//            all.erase(all.begin(),++it2);
        }
        ros::spinOnce();
        loop_rate.sleep();
    }
    close(fd);
    return 0;
}
