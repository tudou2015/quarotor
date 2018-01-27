#include <ros/ros.h>
#include <iostream>
#include <cv_bridge/cv_bridge.h>
#include <sensor_msgs/image_encodings.h>
#include <image_transport/image_transport.h>
#include <opencv2/core/core.hpp>
#include <opencv2/highgui/highgui.hpp>
#include <opencv2/imgproc/imgproc.hpp>
//i am not sure use "" or <>

static const std::string INPUT="Input";
static const std::string OUTPUT="Output";

class vision1{
	private:
		ros::NodeHandle n;
		image_transport::ImageTransport it;
		image_transport::Subscriber img_sub;
	public:
		vision1():it(n){
			img_sub=it.subscribe("/usb_cam/image_raw",1,&vision1::callback,this);//topic need to be modified.
			cv::namedWindow(INPUT);
			cv::namedWindow(OUTPUT);
		} 
		~vision1(){
			cv::destroyWindow(INPUT);
			cv::destroyWindow(OUTPUT);
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
			cv::Mat img_out;
			cv::cvtColor(image,img_out,CV_RGB2GRAY);
			cv::imshow(INPUT,image);
			cv::imshow(OUTPUT,img_out);
			cv::waitKey(5);
		}
};

int main(int argc,char **argv){
	ros::init(argc,argv,"vision1");
	vision1 obj;
	ros::spin();
	return 0;
}
