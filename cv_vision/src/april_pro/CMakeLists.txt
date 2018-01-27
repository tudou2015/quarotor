cmake_minimum_required(VERSION 2.8.3)
project(april_pro)

## Find catkin macros and libraries
## if COMPONENTS list like find_package(catkin REQUIRED COMPONENTS xyz)
## is used, also find other catkin packages



find_package(catkin REQUIRED COMPONENTS
  dynamic_reconfigure
cv_bridge
camera_info_manager
  geometry_msgs
  message_generation
  roscpp
image_transport
  sensor_msgs
  std_msgs
nodelet
  std_srvs
)
find_package(Threads REQUIRED)
link_libraries(/usr/local/lib/libcam.so /usr/local/lib/libapriltag.so)
 add_message_files(
   FILES

camera_pos.msg
 )

generate_messages(
   DEPENDENCIES
std_msgs
 )
 
catkin_package(
INCLUDE_DIRS ./
)

 INCLUDE_DIRECTORIES(   
  ${catkin_INCLUDE_DIRS}                       #相关头文件的目录
     /usr/local/include
      /usr/local/include/ocam
	/usr/local/include/apriltag
     ${PROJET_SOURCE_DIR}
     )

add_executable(process src/opencv_demo.cc)
#add_executable(circle src/circle.cpp)

TARGET_LINK_LIBRARIES (process cam ${CMAKE_THREAD_LIBS_INIT} ${OpenCV_LIBS} ${catkin_LIBRARIES})
