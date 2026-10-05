#!/usr/bin/env python2
#coding=utf-8
 
"""
    需求:
        编写两个节点实现服务通信，客户端节点需要提交两个整数到服务器
        服务器需要解析客户端提交的数据，相加后，将结果响应回客户端，
        客户端再解析
 
    客户端实现:
        1.导包
        2.初始化 ROS 节点
        3.创建请求对象
        4.发送请求
        5.接收并处理响应
 
    优化:
        加入数据的动态获取
"""
 
# 1.导包
import rospy
from topic_pkg.srv import Test, TestRequest
import sys
 
if __name__ == "__main__":
 
    # 优化实现：从命令行参数动态获取数据
    if len(sys.argv) != 3:
        rospy.logerr("请正确提交参数，例如: rosrun test_07 client_p.py 3 4")
        sys.exit(1)
 
    # 2.初始化 ROS 节点
    rospy.init_node("Test_Client_p")
    # 3.创建请求对象
    client = rospy.ServiceProxy("Test", Test)
    # 请求前，等待服务已经就绪
    client.wait_for_service()
    # 4.发送请求，接收并处理响应
    req = TestRequest()
    req.num1 = int(sys.argv[1])
    req.num2 = int(sys.argv[2])
 
    resp = client.call(req)
    rospy.loginfo("响应结果:%d", resp.sum)