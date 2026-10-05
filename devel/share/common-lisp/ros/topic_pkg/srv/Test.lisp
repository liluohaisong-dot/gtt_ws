; Auto-generated. Do not edit!


(cl:in-package topic_pkg-srv)


;//! \htmlinclude Test-request.msg.html

(cl:defclass <Test-request> (roslisp-msg-protocol:ros-message)
  ((num1
    :reader num1
    :initarg :num1
    :type cl:integer
    :initform 0)
   (num2
    :reader num2
    :initarg :num2
    :type cl:integer
    :initform 0))
)

(cl:defclass Test-request (<Test-request>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <Test-request>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'Test-request)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name topic_pkg-srv:<Test-request> is deprecated: use topic_pkg-srv:Test-request instead.")))

(cl:ensure-generic-function 'num1-val :lambda-list '(m))
(cl:defmethod num1-val ((m <Test-request>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader topic_pkg-srv:num1-val is deprecated.  Use topic_pkg-srv:num1 instead.")
  (num1 m))

(cl:ensure-generic-function 'num2-val :lambda-list '(m))
(cl:defmethod num2-val ((m <Test-request>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader topic_pkg-srv:num2-val is deprecated.  Use topic_pkg-srv:num2 instead.")
  (num2 m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <Test-request>) ostream)
  "Serializes a message object of type '<Test-request>"
  (cl:let* ((signed (cl:slot-value msg 'num1)) (unsigned (cl:if (cl:< signed 0) (cl:+ signed 4294967296) signed)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) unsigned) ostream)
    )
  (cl:let* ((signed (cl:slot-value msg 'num2)) (unsigned (cl:if (cl:< signed 0) (cl:+ signed 4294967296) signed)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) unsigned) ostream)
    )
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <Test-request>) istream)
  "Deserializes a message object of type '<Test-request>"
    (cl:let ((unsigned 0))
      (cl:setf (cl:ldb (cl:byte 8 0) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) unsigned) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'num1) (cl:if (cl:< unsigned 2147483648) unsigned (cl:- unsigned 4294967296))))
    (cl:let ((unsigned 0))
      (cl:setf (cl:ldb (cl:byte 8 0) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) unsigned) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'num2) (cl:if (cl:< unsigned 2147483648) unsigned (cl:- unsigned 4294967296))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<Test-request>)))
  "Returns string type for a service object of type '<Test-request>"
  "topic_pkg/TestRequest")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'Test-request)))
  "Returns string type for a service object of type 'Test-request"
  "topic_pkg/TestRequest")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<Test-request>)))
  "Returns md5sum for a message object of type '<Test-request>"
  "4781436a0c2affec8025955a6041e481")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'Test-request)))
  "Returns md5sum for a message object of type 'Test-request"
  "4781436a0c2affec8025955a6041e481")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<Test-request>)))
  "Returns full string definition for message of type '<Test-request>"
  (cl:format cl:nil "# 客户端请求时发送的两个数字~%int32 num1~%int32 num2~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'Test-request)))
  "Returns full string definition for message of type 'Test-request"
  (cl:format cl:nil "# 客户端请求时发送的两个数字~%int32 num1~%int32 num2~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <Test-request>))
  (cl:+ 0
     4
     4
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <Test-request>))
  "Converts a ROS message object to a list"
  (cl:list 'Test-request
    (cl:cons ':num1 (num1 msg))
    (cl:cons ':num2 (num2 msg))
))
;//! \htmlinclude Test-response.msg.html

(cl:defclass <Test-response> (roslisp-msg-protocol:ros-message)
  ((sum
    :reader sum
    :initarg :sum
    :type cl:integer
    :initform 0))
)

(cl:defclass Test-response (<Test-response>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <Test-response>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'Test-response)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name topic_pkg-srv:<Test-response> is deprecated: use topic_pkg-srv:Test-response instead.")))

(cl:ensure-generic-function 'sum-val :lambda-list '(m))
(cl:defmethod sum-val ((m <Test-response>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader topic_pkg-srv:sum-val is deprecated.  Use topic_pkg-srv:sum instead.")
  (sum m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <Test-response>) ostream)
  "Serializes a message object of type '<Test-response>"
  (cl:let* ((signed (cl:slot-value msg 'sum)) (unsigned (cl:if (cl:< signed 0) (cl:+ signed 4294967296) signed)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) unsigned) ostream)
    )
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <Test-response>) istream)
  "Deserializes a message object of type '<Test-response>"
    (cl:let ((unsigned 0))
      (cl:setf (cl:ldb (cl:byte 8 0) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) unsigned) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'sum) (cl:if (cl:< unsigned 2147483648) unsigned (cl:- unsigned 4294967296))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<Test-response>)))
  "Returns string type for a service object of type '<Test-response>"
  "topic_pkg/TestResponse")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'Test-response)))
  "Returns string type for a service object of type 'Test-response"
  "topic_pkg/TestResponse")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<Test-response>)))
  "Returns md5sum for a message object of type '<Test-response>"
  "4781436a0c2affec8025955a6041e481")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'Test-response)))
  "Returns md5sum for a message object of type 'Test-response"
  "4781436a0c2affec8025955a6041e481")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<Test-response>)))
  "Returns full string definition for message of type '<Test-response>"
  (cl:format cl:nil "# 服务器响应发送的数据~%int32 sum~%~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'Test-response)))
  "Returns full string definition for message of type 'Test-response"
  (cl:format cl:nil "# 服务器响应发送的数据~%int32 sum~%~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <Test-response>))
  (cl:+ 0
     4
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <Test-response>))
  "Converts a ROS message object to a list"
  (cl:list 'Test-response
    (cl:cons ':sum (sum msg))
))
(cl:defmethod roslisp-msg-protocol:service-request-type ((msg (cl:eql 'Test)))
  'Test-request)
(cl:defmethod roslisp-msg-protocol:service-response-type ((msg (cl:eql 'Test)))
  'Test-response)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'Test)))
  "Returns string type for a service object of type '<Test>"
  "topic_pkg/Test")