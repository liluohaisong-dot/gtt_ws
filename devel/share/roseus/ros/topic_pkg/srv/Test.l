;; Auto-generated. Do not edit!


(when (boundp 'topic_pkg::Test)
  (if (not (find-package "TOPIC_PKG"))
    (make-package "TOPIC_PKG"))
  (shadow 'Test (find-package "TOPIC_PKG")))
(unless (find-package "TOPIC_PKG::TEST")
  (make-package "TOPIC_PKG::TEST"))
(unless (find-package "TOPIC_PKG::TESTREQUEST")
  (make-package "TOPIC_PKG::TESTREQUEST"))
(unless (find-package "TOPIC_PKG::TESTRESPONSE")
  (make-package "TOPIC_PKG::TESTRESPONSE"))

(in-package "ROS")





(defclass topic_pkg::TestRequest
  :super ros::object
  :slots (_num1 _num2 ))

(defmethod topic_pkg::TestRequest
  (:init
   (&key
    ((:num1 __num1) 0)
    ((:num2 __num2) 0)
    )
   (send-super :init)
   (setq _num1 (round __num1))
   (setq _num2 (round __num2))
   self)
  (:num1
   (&optional __num1)
   (if __num1 (setq _num1 __num1)) _num1)
  (:num2
   (&optional __num2)
   (if __num2 (setq _num2 __num2)) _num2)
  (:serialization-length
   ()
   (+
    ;; int32 _num1
    4
    ;; int32 _num2
    4
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; int32 _num1
       (write-long _num1 s)
     ;; int32 _num2
       (write-long _num2 s)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; int32 _num1
     (setq _num1 (sys::peek buf ptr- :integer)) (incf ptr- 4)
   ;; int32 _num2
     (setq _num2 (sys::peek buf ptr- :integer)) (incf ptr- 4)
   ;;
   self)
  )

(defclass topic_pkg::TestResponse
  :super ros::object
  :slots (_sum ))

(defmethod topic_pkg::TestResponse
  (:init
   (&key
    ((:sum __sum) 0)
    )
   (send-super :init)
   (setq _sum (round __sum))
   self)
  (:sum
   (&optional __sum)
   (if __sum (setq _sum __sum)) _sum)
  (:serialization-length
   ()
   (+
    ;; int32 _sum
    4
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; int32 _sum
       (write-long _sum s)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; int32 _sum
     (setq _sum (sys::peek buf ptr- :integer)) (incf ptr- 4)
   ;;
   self)
  )

(defclass topic_pkg::Test
  :super ros::object
  :slots ())

(setf (get topic_pkg::Test :md5sum-) "4781436a0c2affec8025955a6041e481")
(setf (get topic_pkg::Test :datatype-) "topic_pkg/Test")
(setf (get topic_pkg::Test :request) topic_pkg::TestRequest)
(setf (get topic_pkg::Test :response) topic_pkg::TestResponse)

(defmethod topic_pkg::TestRequest
  (:response () (instance topic_pkg::TestResponse :init)))

(setf (get topic_pkg::TestRequest :md5sum-) "4781436a0c2affec8025955a6041e481")
(setf (get topic_pkg::TestRequest :datatype-) "topic_pkg/TestRequest")
(setf (get topic_pkg::TestRequest :definition-)
      "# 客户端请求时发送的两个数字
int32 num1
int32 num2
---
# 服务器响应发送的数据
int32 sum

")

(setf (get topic_pkg::TestResponse :md5sum-) "4781436a0c2affec8025955a6041e481")
(setf (get topic_pkg::TestResponse :datatype-) "topic_pkg/TestResponse")
(setf (get topic_pkg::TestResponse :definition-)
      "# 客户端请求时发送的两个数字
int32 num1
int32 num2
---
# 服务器响应发送的数据
int32 sum

")



(provide :topic_pkg/Test "4781436a0c2affec8025955a6041e481")


