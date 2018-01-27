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
int detect_lines(Mat src);
int detect_circles_center(Mat src);
void infoCallback(const arinfo::arinfo msg){
	pos.z=msg.height;
        pos.vx=msg.lock;
}
void imageCallback(const sensor_msgs::ImageConstPtr& msg){
	//printf("%d %d\n", msg->height, msg->width);
	//printf("%d\n", msg->data.size());
	//for (int i = 0; i < msg->data.size(); i++) printf("%d ", msg->data[i]);
	//printf("\n");
	cv::Mat gray(msg->height, msg->width, CV_8UC1, cv::Scalar(255));
	int size = msg->data.size();
	for (int i = 0; i < size; i++) {
		int rows = i / msg->width;
		int cols = i % msg->width;
		gray.at<uchar>(rows, cols) = msg->data[i];
		//printf("%d\n", msg->data[i]);
	}
//	cv::namedWindow("demo", CV_WINDOW_AUTOSIZE);
//	cv::imshow("demo", gray);
	cv::waitKey(16);
	/*for (int i = 0; i < msg->height; i++) { 
		for (int j = 0; j < msg->width; j++) 
			cout << (int)gray.at<uchar>(i, j) << ' ';
		cout << endl;
	}
	cv::imshow("demo", gray);
	cv::waitKey(16);*/
	//gray=cv_bridge::toCvCopy(msg,sensor_msgs::image_encodings::BGR8);
	detect_circle(gray);
	pos.header.stamp=ros::Time::now();
	pub.publish(pos);
}
int main(int argc,char **argv)
{
	ros::init(argc,argv,"circle");
	ros::NodeHandle n;
        pub=n.advertise<april_pro::camera_pos>("position",1);
        image_transport::ImageTransport it(n);
        image_transport::Subscriber sub=it.subscribe("april_pic/image",1,imageCallback);
        ros::Subscriber sub2=n.subscribe("arinfo",1,infoCallback);
        ros::spin();
        //VideoCapture capture(0);
/*	char commend;
	while(1)
	{
		Mat frame;
		capture>>frame;
        detect_circle(frame);
        waitKey(20);
	}
*/
	return 0;
}

int cnt = 0;
cv::Mat global;
string tostr(int x) {
	if (x == 0) return "0";
	string st = "";
	while (x) {
		st = (char)(x % 10 + '0') + st;
		x /= 10;
	}
	return st;
}
void onMouse(int event, int x, int y, int flags, void *param) {
    	if (event == CV_EVENT_LBUTTONDOWN) {
		printf("Click\n");
		string path = "~/data/pic" + tostr(cnt) + ".jpg";
		cv::imwrite(path.c_str(), global);
		cnt++;	
		printf("%s\n", path.c_str());
	}
}

//霍夫变换检测0
bool ok(const Mat &src, Point center, int radius) {
    int Left = max(0, center.x - radius);
    int Right = min(src.cols - 1, center.x + radius);
    int Up = max(0, center.y - radius);
    int Down = min(src.rows - 1, center.y + radius);

    int cnt = 0;
    for (int i = Up; i <= Down; i++) 
        for (int j = Left; j <= Right; j++) {
            if ((i - center.y) * (i - center.y) + (j - center.x) * (j - center.x) <= radius * radius) {
                cnt += src.at<uchar>(i, j);
            }
        }
    double ratio = 1.0 * cnt / (radius * radius * 3.14159);
    //cout << ratio << endl;
    if (ratio <= 70) return true;
    return false;
}

int detect_circle(cv::Mat src)
{
    Mat  src_gray;
    if( !src.data )
    { return -1; }
    //cvtColor( src, src_gray, CV_BGR2GRAY );
    //cv::threshold(src, src, 100, 255, 0);
    //GaussianBlur( src, src, Size(9, 9), 2, 2 );
    global = src.clone();
    std::vector<Vec3f> circles;
    /// Apply the Hough Transform to find the circles
    HoughCircles( src, circles, CV_HOUGH_GRADIENT, 1, src.rows/8, 80, 40, 0, 0 );
    //HoughCircles( src, circles, CV_HOUGH_GRADIENT, 1, src.rows/20);
    //cout<<circles.size()<<endl;
    int r=0;
    for( size_t i = 0; i < circles.size(); i++ )
    {
        Point center(cvRound(circles[i][0]), cvRound(circles[i][1]));
        int radius = cvRound(circles[i][2]);
        if (!ok(src, center, radius)) continue;
        if(radius<r)continue;
        r=radius;
      	pos.x=-(circles[i][0]-(src.cols/2));
		pos.y=circles[i][1]-(src.rows/2);

        //circle( src, center, 3, Scalar(0,255,0), -1, 8, 0 );
        //circle( src, center, radius, Scalar(0,0,255), 3, 8, 0 );
    }
    //namedWindow( "Demo", CV_WINDOW_AUTOSIZE );
    //imshow( "Demo", src );
    //cv::setMouseCallback("Demo", onMouse);
//    int r=0;
//    for(size_t i=0;i<circles.size();i++){
//	if(circles[i][2]>r){
//		pos.x=-(circles[i][0]-(src.cols/2));
//		pos.y=circles[i][1]-(src.rows/2);
//		r=circles[i][2];
//	}
//    }
//    pos.id=0x100;
    return 0;
}
//霍夫变换圆形检测
int detect_lines(Mat src)
{
    
    Mat dst, cdst;
    /*采用 Canny 算法做边缘检测
     //void cvCanny( const CvArr* image, CvArr* edges, double threshold1,
     //double threshold2, int aperture_size=3 );
     //threshold1 第一个阈值
     //threshold2 第二个阈值
     //aperture_size Sobel 算子内核大小 (见 cvSobel).
     //函数 cvCanny 采用 CANNY 算法发现输入图像的边缘而且在输出图像中标识这些边缘。
     //threshold1和threshold2 当中的小阈值用来控制边缘连接，大的阈值用来控制强边缘的初始分割。*/
    Canny(src, dst, 50, 200, 3);
    cvtColor(dst, cdst, CV_GRAY2BGR);//灰度化
#if 1
	vector<Vec2f> lines;
    /*利用 Hough 变换在二值图像中找到直线
     CvSeq* cvHoughLines2( CvArr* image, void* line_storage, int method,
     double rho, double theta, int threshold,
     double param1=0, double param2=0 );
     line_storage :检测到的线段存储仓.
     Hough 变换变量，是下面变量的其中之一：
     CV_HOUGH_STANDARD - 传统或标准 Hough 变换. 每一个线段由两个浮点数 (ρ, θ) 表示，
     其中 ρ 是直线与原点 (0,0) 之间的距离，θ 线段与 x-轴之间的夹角。因此，矩阵类
     型必须是 CV_32FC2 type.
     CV_HOUGH_PROBABILISTIC - 概率 Hough 变换(如果图像包含一些长的线性分割，则效率更高).
     它返回线段分割而不是整个线段。每个分割用起点和终点来表示，所以矩阵（或创建的序列）
     类型是 CV_32SC4.
     CV_HOUGH_MULTI_SCALE - 传统 Hough 变换的多尺度变种。
     线段的编码方式与 CV_HOUGH_STANDARD 的一致。
     rho 与象素相关单位的距离精度。
     theta 弧度测量的角度精度。*/
    HoughLines(dst, lines, 1, CV_PI/180, 250, 0, 0 );
    
    for( size_t i = 0; i < lines.size(); i++ )//将求得的线条画出来
    {
        float rho = lines[i][0], theta = lines[i][1];
        Point pt1, pt2;
        double a = cos(theta), b = sin(theta);
        double x0 = a*rho, y0 = b*rho;
        pt1.x = cvRound(x0 + 1000*(-b));
        pt1.y = cvRound(y0 + 1000*(a));
        pt2.x = cvRound(x0 - 1000*(-b));
        pt2.y = cvRound(y0 - 1000*(a));
        line( cdst, pt1, pt2, Scalar(0,0,255), 3, CV_AA);
    }
#else
    vector<Vec4i> lines;
    HoughLinesP(dst, lines, 1, CV_PI/180, 300, 50, 10 );
    for( size_t i = 0; i < lines.size(); i++ )
    {
        Vec4i l = lines[i];
        line( cdst, Point(l[0], l[1]), Point(l[2], l[3]), Scalar(0,0,255), 3, CV_AA);
    }
#endif
    imshow("source", src);
    imshow("detected lines", cdst);
    return 0;
}


//霍夫变换圆心检测
int detect_circles_center(Mat src)
{
    Mat  src_gray;
    if( !src.data )
    { return -1; }
    cvtColor( src, src_gray, CV_BGR2GRAY );
    GaussianBlur( src_gray, src_gray, Size(9, 9), 2, 2 );
    vector<Vec3f> circles;
    /// Apply the Hough Transform to find the circles
    HoughCircles( src_gray, circles, CV_HOUGH_GRADIENT, 1, src_gray.rows/8, 150, 75, 0, 0 );
    int r=0;
    int x=0;
    int y=0;
    for( size_t i = 0; i < circles.size(); i++ )
    {
      if(circles[i][2]>r)
      {
          x=-(circles[i][0]-(src.cols/2));
          y=circles[i][1]-(src.rows/2);
      }
          
    }
    return 0;
}

