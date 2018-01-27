#include <ros/ros.h>
#include <iostream>
#include <cv_bridge/cv_bridge.h>
#include <sensor_msgs/image_encodings.h>
#include <image_transport/image_transport.h>
#include <opencv2/opencv.hpp>
#include <opencv2/core/core.hpp>
#include <opencv2/highgui/highgui.hpp>
#include <opencv2/imgproc/imgproc.hpp>

class vision2{
	private:
		ros::NodeHandle n;
		image_transport::ImageTransport it;
		image_transport::Subscriber img_sub;
	public:
		vision2():it(n){
			img_sub=it.subscribe("/usb_cam/image_raw",1,&vision2::callback,this);
			cv::namedWindow("origin");
			cv::namedWindow("canny");
			cv::namedWindow("houghp");
//			cv::namedWindow("houghc");
		} 
		~vision2(){
			cv::destroyWindow("origin");
			cv::destroyWindow("canny");
			cv::destroyWindow("houghp");
//			cv::destroyWindow("houghc");
		}
		void callback(const sensor_msgs::ImageConstPtr& msg){
			cv_bridge::CvImagePtr cv_ptr;
			try{
				cv_ptr=cv_bridge::toCvCopy(msg,sensor_msgs::image_encodings::BGR8);
			} 
			catch(cv_bridge::Exception& e){
				ROS_ERROR("cv_bridge exception: %s",e.what());
				return ;
			}
			image_process(cv_ptr->image);
		}
		void image_process(cv::Mat image){
			cv::Mat midImage,distImage;
			cv::cvtColor(image,midImage,CV_BGR2GRAY);
//			cv::blur(midImage,midImage,cv::Size(3,3));
			cv::GaussianBlur(midImage,midImage,cv::Size(9,9),2,2);

			cv::Canny(midImage,midImage,50,200,3);
			cv::cvtColor(midImage,distImage,CV_GRAY2BGR);
			std::vector<cv::Vec4i> lines;
			HoughLinesP(midImage,lines,1,CV_PI/180,80,50,100);
			for(size_t i=0;i<lines.size();i++){
				std::cout<<lines.size()<<std::endl;
				cv::Vec4i l=lines[i];
				cv::line(distImage,cv::Point(l[0],l[1]),cv::Point(l[2],l[3]),cv::Scalar(186,88,255),1,CV_AA);
				std::cout<<"("<<l[0]<<","<<l[1]<<")"<<"("<<l[2]<<","<<l[3]<<")"<<std::endl;
			}

//			std::vector<cv::Vec3f>circles;
//			HoughCircles(midImage,circles,CV_HOUGH_GRADIENT,1.5,10,200,100,0,100);
//			for(size_t i=0;i<circles.size();i++){
//				cv::Point center(cvRound(circles[i][0]),cvRound(circles[i][1]));
//				int radius=cvRound(circles[i][2]);
//				cv::circle(image,center,3,cv::Scalar(0,255,0),-1,8,0);
//				cv::circle(image,center,radius,cv::Scalar(155,50,255),3,8,0);
//			}			

			cv::imshow("origin",image);
			cv::imshow("canny",midImage);
			cv::imshow("houghp",distImage);
//			cv::imshow("houghc",image);
			cv::waitKey(5);
		}
};

int main(int argc,char **argv){
	ros::init(argc,argv,"vision2");
	vision2 obj;
	ros::spin();
	return 0;
}
