#!/usr/bin/env python2
#coding=utf-8
import rospy
from test_pkg.msg import Work

def doWork(p):
    rospy.loginfo("接收到的人的信息:%s, %d, %.2f",p.name, p.age, p.height)

if __name__ == "__main__":
    #1.初始化节点
    rospy.init_node("listener_Work_p")
    #2.创建订阅者对象
    sub = rospy.Subscriber("chatter_Work",Work,doWork,queue_size=10)
    rospy.spin() #4.循环