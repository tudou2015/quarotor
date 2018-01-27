#include "ros/ros.h"
#include "std_msgs/String.h"
#include "april_pro/camera_pos.h"
#include "common/getopt.h"
//#include "cv_apriltag/camera_pos.h"
#include "std_msgs/Header.h"
#include <cv_bridge/cv_bridge.h>
#include <ros/ros.h>
#include <image_transport/image_transport.h>
#include <stdio.h>
#include <errno.h>
#include "apriltag.h"
#include "tag36h11.h"
#include "tag36h10.h"
#include "tag36artoolkit.h"
#include "tag25h9.h"
#include "tag25h7.h"
#include "common/getopt.h"
#include "common/homography.h"
#include <cmath>
#include <string>
#include <opencv2/core/core.hpp>
#include <opencv2/highgui/highgui.hpp>
#include <opencv2/imgproc/imgproc.hpp>
#include "withrobot_camera.hpp"
#include <iostream>
#include <queue>
#ifndef PI
const double PI = 3.14159265358979323846;
#endif
#define d0 7.50
const double TWOPI = 2.0*PI;
inline double standardRad(double t);
void wRo_to_euler(const matd_t *pose, double& yaw, double& pitch, double& roll);
cv::Mat gray;
bool FLAG=false;
double x_center[300],y_center[300];
void imageCallback(const sensor_msgs::ImageConstPtr& msg){
    cv_bridge::toCvShare(msg, "mono8")->image.copyTo(gray);
    FLAG=true;
}
double abs(double x){
	return (x>0)?x:-x;
}

int main (int argc, char* argv[])
{
    ros::init(argc, argv, "april_pro");
    ros::NodeHandle n;
    ros::Publisher pub = n.advertise<april_pro::camera_pos>("position", 1);
    ros::Rate rate(120);
    april_pro::camera_pos msg;
    double yaw,pitch,roll,an_X,an_Y,an_Z;
    //const double internum[4]={660.3323,655.4458,304.6620,243.3709};
    const double internum[4]={175.1953, 233.7006,164.8640,127.8288};
    matd_t *pose_end,*pose_id_old;
    int id,id_old=-1000;
    bool id_old_flag=false;
    getopt_t *getopt = getopt_create();
    apriltag_family_t *tf = NULL;
    tf = tag36h11_create();
    tf->black_border=1;
    apriltag_detector_t *td = apriltag_detector_create();
    apriltag_detector_add_family(td, tf);
    td->quad_decimate = 1.0;
    td->quad_sigma = 0.0;
    td->nthreads = 8;
    td->debug = false;
    td->refine_edges = false;
    td->refine_decode = false;
    td->refine_pose = false;
    image_transport::ImageTransport it(n);
    image_transport::Subscriber sub = it.subscribe("april_pic/image", 1, imageCallback);
    std::queue<double>x_reco,y_reco;
    std::queue<ros::Time>time_reco;
    double x_old[300],y_old[300];
    for (int i=0;i<300;i++){x_old[i]=-1000;y_old[i]=-1000;}
    for (int i=0;i<49;i++){
                            x_center[i]=(i%7)*d0*3;y_center[i]=i/7*d0*3;
                            x_center[i+49]=(i%7)*d0*3;y_center[i+49]=(i/7)*d0*3+119.9;
                            x_center[i+98]=(i%7)*d0*3+119.9;y_center[i+98]=i/7*d0*3;
                            x_center[i+147]=(i%7)*d0*3+119.9;y_center[i+147]=i/7*d0*3+119.9;
							x_center[i+196]=(i%7)*d0*3+120.0*2;y_center[i+196]=i/7*d0*3;
							x_center[i+245]=(i%7)*d0*3+120.0*2;y_center[i+245]=i/7*d0*3+119.9;

    }
    ros::Time old;
    double x_world=-1000,y_world=-1000,x_world_old=-1000,y_world_old=-1000;
    double pitch_old,roll_old;
    while(ros::ok()){
        if (FLAG){
            FLAG=false;
            image_u8_t im = { .width = gray.cols,
                              .height = gray.rows,
                              .stride = gray.cols,
                              .buf = gray.data
                            };
            zarray_t *detections = apriltag_detector_detect(td, &im);
            for (int i=0;i<zarray_size(detections);i++)
            {
                apriltag_detection_t *det;
                zarray_get(detections, i, &det);
                matd_t *pose=homography_to_pose(det->H,internum[0],internum[1],internum[2],internum[3]);
                pose = matd_inverse(pose);
                if (i==0){
                    pose_end=pose;
                    id=det->id;
                }
                // if (det->id==id_old){
                //     pose_id_old=pose;
                //     id_old_flag=true;
                // }
                if ((pose->data[3]) * (pose->data[3])+(pose->data[7]) * (pose->data[7]) < (pose_end->data[3])*(pose_end->data[3])+(pose_end->data[7])*(pose_end->data[7]))
                {
                    pose_end=pose;
                    id=det->id;
                }
                
                if (i==zarray_size(detections)-1){
      //               if (id_old_flag){
      //                   wRo_to_euler(pose_id_old,yaw,pitch,roll);
      //                   x_world=d0*(pose_id_old->data[3])+*(x_center+id_old);y_world=d0*(pose_id_old->data[7])+*(y_center+id_old);msg.z=(pose_id_old->data[11])*d0;
      //                   msg.x=x_world;msg.y=y_world;
      //                   msg.pitch=pitch;msg.yaw=yaw;msg.roll=roll;
      //                   ros::Time now = ros::Time::now();
      //                   msg.header.stamp=now;
      //                   msg.id=id_old;
      //                   double vx_temp=(x_world-x_world_old )/((now-old).toSec());
      //                   double vy_temp=(y_world-y_world_old )/((now-old).toSec());
      //                   msg.vx=-vy_temp*sin(yaw)-vx_temp*cos(yaw);
      //                   msg.vy=vy_temp*cos(yaw)-vx_temp*sin(yaw);
      //                   msg.v_roll=(roll-roll_old)/((now-old).toSec());
      //                   msg.v_pitch=(pitch-pitch_old)/((now-old).toSec());
      //                   old=now;
      //                   id_old=id;
						// if (abs(msg.v_pitch)<0.2&&abs(msg.v_roll)<0.2)
      //                   pub.publish(msg);
      //                   id_old_flag=false;
      //                   x_world_old=d0*(pose_end->data[3])+*(x_center+id);y_world_old=d0*(pose_end->data[7])+*(y_center+id);
      //                   pitch_old=pitch;roll_old=roll;
      //               }else{


                        wRo_to_euler(pose_end,yaw,pitch,roll);
                        x_world=d0*(pose_end->data[3])+*(x_center+id);y_world=d0*(pose_end->data[7])+*(y_center+id);msg.z=(pose_end->data[11])*d0;
                        msg.x=x_world;msg.y=y_world;

                        msg.pitch=pitch;msg.yaw=(yaw<0)?(yaw + PI):(yaw-PI);msg.roll=roll;
                        ros::Time now = ros::Time::now();
                        msg.header.stamp=now;
                        x_reco.push(x_world);y_reco.push(y_world);
                        time_reco.push(now);
                        msg.id=id;

                        msg.v_roll=(roll-roll_old)/((now-old).toSec());
                        msg.v_pitch=(pitch-pitch_old)/((now-old).toSec());
                        if (x_reco.size()>10){
                        double vx_temp=(x_reco.back()-x_reco.front())/((time_reco.back()-time_reco.front()).toSec());
                         double vy_temp=(y_reco.back()-y_reco.front())/((time_reco.back()-time_reco.front()).toSec());
                         msg.vx=-vy_temp*sin(yaw)-vx_temp*cos(yaw);
                         msg.vy=vy_temp*cos(yaw)-vx_temp*sin(yaw);
                         x_reco.pop();y_reco.pop();time_reco.pop();
                        }
                        else{
                            msg.vx=0.0;msg.vy=0.0;
                        }
                        
                       // x_world_old=x_world;y_world_old=y_world;
                        old=now;
                       // id_old=id;
                        pitch_old=pitch;
                        roll_old=roll;
                        pub.publish(msg);
                  //  }

                }
                
            }
            zarray_destroy(detections);
        }
        ros::spinOnce();
        rate.sleep();
    }
    apriltag_detector_destroy(td);
    tag36h11_destroy(tf);
    getopt_destroy(getopt);
    printf("Done.\n");
    return 0;
}


inline double standardRad(double t) {
    if (t >= 0.) {
        t = fmod(t+PI, TWOPI) - PI;
    } else {
        t = fmod(t-PI, -TWOPI) + PI;
    }
    return t;
}

void wRo_to_euler(const matd_t *pose, double& yaw, double& pitch, double& roll) {
    const double *data = pose->data;
    yaw = standardRad(atan2(data[4], data[0]));
    double c = cos(yaw);
    double s = sin(yaw);
    pitch = standardRad(atan2(-data[8], data[0]*c + data[4]*s));
    roll  = standardRad(atan2(data[2]*s - data[6]*c, -data[1]*s + data[5]*c));
}


