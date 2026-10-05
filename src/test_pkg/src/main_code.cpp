#include <ros/ros.h>

int main(int argc, char** argv) {
    ros::init(argc, argv, "main_code");
    ros::NodeHandle nh;
    //helloworld
    ROS_INFO("Hello World");
    return 0;
}