cmake_minimum_required(VERSION 2.8.3)
project(april_pic)

## Find catkin macros and libraries
## if COMPONENTS list like find_package(catkin REQUIRED COMPONENTS xyz)
## is used, also find other catkin packages
   FIND_PACKAGE(OpenCV REQUIRED)

find_package(Threads REQUIRED)
link_libraries(/usr/local/lib/libcam.so)

find_package(catkin REQUIRED COMPONENTS
  camera_info_manager
  cv_bridge
  dynamic_reconfigure
  image_transport
  message_generation
  nodelet
  roscpp
  sensor_msgs
  std_msgs
)

catkin_package(
DEPENDS opencv2
)
include_directories(
  ${catkin_INCLUDE_DIRS}
${PROJET_SOURCE_DIR}
/usr/local/include
./include
/usr/local/include/ocam
)


add_executable(send_pic src/main.cpp)
TARGET_LINK_LIBRARIES (send_pic cam ${CMAKE_THREAD_LIBS_INIT} ${OpenCV_LIBS} ${catkin_LIBRARIES})
