#include <opencv2/opencv.hpp>
#include <opencv2/highgui/highgui.hpp>
#include <opencv2/imgproc/imgproc.hpp>
#include <opencv2/core/core.hpp>
#include <iostream>
#include <stdio.h>
#include <ros/ros.h>
#include <cv_bridge/cv_bridge.h>
#include <image_transport/image_transport.h>
#include "april_pro/camera_pos.h"
#include "arinfo/arinfo.h"
#include <stdlib.h>
using namespace std;
using namespace cv;
april_pro::camera_pos pos;
ros::Publisher pub;
int detect_circle(Mat src);
void infoCallback(const arinfo::arinfo msg){
	pos.z=msg.height;
        pos.vx=msg.lock;
}
/*void imageCallback(const sensor_msgs::ImageConstPtr& msg){
	cv::Mat gray;
	cout<<"callback"<<endl;
	cv_bridge::toCvShare(msg,"mono8")->image.copyTo(gray);
	detect_circle(gray);
	pos.header.stamp=ros::Time::now();
	pub.publish(pos);
}
*/
int main(int argc,char **argv)
{
	ros::init(argc,argv,"circle");
	ros::NodeHandle n;
        pub=n.advertise<april_pro::camera_pos>("position",1);
//        image_transport::ImageTransport it(n);
 //       image_transport::Subscriber sub=it.subscribe("april_pic/image",1,imageCallback);
        ros::Subscriber sub2=n.subscribe("arinfo",1,infoCallback);
//        ros::spinOnce();
        VideoCapture capture(0);
	char commend;
	while(1)
	{
		Mat frame;
		capture>>frame;
        detect_circle(frame);
        waitKey(20);
	ros::spinOnce();
	}

	return 0;
}

//霍夫变换直线检测
int detect_circle(cv::Mat src)
{
    Mat  src_gray;
    if( !src.data )
    { return -1; }
    cvtColor( src, src_gray, CV_BGR2GRAY );
    GaussianBlur( src_gray, src_gray, Size(9, 9), 2, 2 );
    std::vector<Vec3f> circles;
    /// Apply the Hough Transform to find the circles
    HoughCircles( src_gray, circles, CV_HOUGH_GRADIENT, 1, src.rows/8, 150, 75, 0, 0 );
//    cout<<circles.size()<<endl;
    namedWindow( "Hough Circle Transform Demo", CV_WINDOW_AUTOSIZE );
    imshow( "Hough Circle Transform Demo", src_gray );
    for( size_t i = 0; i < circles.size(); i++ )
    {
        Point center(cvRound(circles[i][0]), cvRound(circles[i][1]));
        int radius = cvRound(circles[i][2]);
        circle( src, center, 3, Scalar(0,255,0), -1, 8, 0 );
        circle( src, center, radius, Scalar(0,0,255), 3, 8, 0 );
    }
    int r=0;
    for(size_t i=0;i<circles.size();i++){
	if(circles[i][2]>r){
		pos.x=-(circles[i][0]-(src.cols/2));
		pos.y=circles[i][1]-(src.rows/2);
		r=circles[i][2];
	}
    }
    pos.id=0x100;
    pos.header.stamp=ros::Time::now();
    pub.publish(pos);
    return 0;
}
//霍夫变换圆形检测
  
