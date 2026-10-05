#!/usr/bin/env python2
#coding=utf-8
 

# 导包
import rospy
from std_msgs.msg import String
 
def doMsg(msg):
    rospy.loginfo("I heard:%s", msg.data)
 
if __name__ == "__main__":
    # 初始化 ROS 节点:命名(唯一)
    rospy.init_node("listener_p")
    # 实例化 订阅者 对象
    sub = rospy.Subscriber("chatter", String, doMsg, queue_size=10)
    # 处理订阅的消息(回调函数)
    # 设置循环调用回调函数
    rospy.spin()