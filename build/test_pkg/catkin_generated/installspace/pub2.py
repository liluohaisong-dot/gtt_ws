#!/usr/bin/env python2
# -*- coding: utf-8 -*-
import rospy
from test_pkg.msg import Work

if __name__ == "__main__":
    # 1.初始化节点
    rospy.init_node("talker_Work_p")
    # 2.创建发布者对象
    pub = rospy.Publisher("chatter_Work", Work, queue_size=10)
    # 3.组织消息数据
    work = Work()
    work.name = "张三"
    work.age = 20
    work.height = 1.75
    # 4.编写发布逻辑并循环发布
    rate = rospy.Rate(1)  # 每秒发一次
    while not rospy.is_shutdown():
        pub.publish(work)
        rospy.loginfo("发布的人的信息:%s, %d, %.2f", work.name, work.age, work.height)
        rate.sleep()