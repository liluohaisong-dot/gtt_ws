#!/usr/bin/env python2
#coding=utf-8
 

 
# 导包
import rospy
from std_msgs.msg import String
 
if __name__ == "__main__":
    # 初始化 ROS 节点:命名(唯一)
    rospy.init_node("talker_p")
    # 实例化 发布者 对象
    pub = rospy.Publisher("chatter", String, queue_size=10)
    # 组织被发布的数据，并编写逻辑发布数据
    msg = String() # 创建 msg 对象
    msg_front = "hello 你好"
    count = 0  # 计数器
    # 设置循环频率
    rate = rospy.Rate(1)
    while not rospy.is_shutdown():
        # 拼接字符串
        msg.data = msg_front + str(count)
        pub.publish(msg)
        rate.sleep()
        rospy.loginfo("写出的数据:%s", msg.data)
        count += 1