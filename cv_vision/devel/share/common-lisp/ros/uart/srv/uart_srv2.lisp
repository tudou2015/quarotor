; Auto-generated. Do not edit!


(cl:in-package uart-srv)


;//! \htmlinclude uart_srv2-request.msg.html

(cl:defclass <uart_srv2-request> (roslisp-msg-protocol:ros-message)
  ((input
    :reader input
    :initarg :input
    :type (cl:vector cl:fixnum)
   :initform (cl:make-array 0 :element-type 'cl:fixnum :initial-element 0)))
)

(cl:defclass uart_srv2-request (<uart_srv2-request>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <uart_srv2-request>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'uart_srv2-request)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name uart-srv:<uart_srv2-request> is deprecated: use uart-srv:uart_srv2-request instead.")))

(cl:ensure-generic-function 'input-val :lambda-list '(m))
(cl:defmethod input-val ((m <uart_srv2-request>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader uart-srv:input-val is deprecated.  Use uart-srv:input instead.")
  (input m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <uart_srv2-request>) ostream)
  "Serializes a message object of type '<uart_srv2-request>"
  (cl:let ((__ros_arr_len (cl:length (cl:slot-value msg 'input))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_arr_len) ostream))
  (cl:map cl:nil #'(cl:lambda (ele) (cl:write-byte (cl:ldb (cl:byte 8 0) ele) ostream))
   (cl:slot-value msg 'input))
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <uart_srv2-request>) istream)
  "Deserializes a message object of type '<uart_srv2-request>"
  (cl:let ((__ros_arr_len 0))
    (cl:setf (cl:ldb (cl:byte 8 0) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 8) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 16) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 24) __ros_arr_len) (cl:read-byte istream))
  (cl:setf (cl:slot-value msg 'input) (cl:make-array __ros_arr_len))
  (cl:let ((vals (cl:slot-value msg 'input)))
    (cl:dotimes (i __ros_arr_len)
    (cl:setf (cl:ldb (cl:byte 8 0) (cl:aref vals i)) (cl:read-byte istream)))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<uart_srv2-request>)))
  "Returns string type for a service object of type '<uart_srv2-request>"
  "uart/uart_srv2Request")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'uart_srv2-request)))
  "Returns string type for a service object of type 'uart_srv2-request"
  "uart/uart_srv2Request")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<uart_srv2-request>)))
  "Returns md5sum for a message object of type '<uart_srv2-request>"
  "f3fd65dfbcbf72139f8cc955ff4cf532")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'uart_srv2-request)))
  "Returns md5sum for a message object of type 'uart_srv2-request"
  "f3fd65dfbcbf72139f8cc955ff4cf532")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<uart_srv2-request>)))
  "Returns full string definition for message of type '<uart_srv2-request>"
  (cl:format cl:nil "uint8[] input~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'uart_srv2-request)))
  "Returns full string definition for message of type 'uart_srv2-request"
  (cl:format cl:nil "uint8[] input~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <uart_srv2-request>))
  (cl:+ 0
     4 (cl:reduce #'cl:+ (cl:slot-value msg 'input) :key #'(cl:lambda (ele) (cl:declare (cl:ignorable ele)) (cl:+ 1)))
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <uart_srv2-request>))
  "Converts a ROS message object to a list"
  (cl:list 'uart_srv2-request
    (cl:cons ':input (input msg))
))
;//! \htmlinclude uart_srv2-response.msg.html

(cl:defclass <uart_srv2-response> (roslisp-msg-protocol:ros-message)
  ((output
    :reader output
    :initarg :output
    :type cl:integer
    :initform 0))
)

(cl:defclass uart_srv2-response (<uart_srv2-response>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <uart_srv2-response>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'uart_srv2-response)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name uart-srv:<uart_srv2-response> is deprecated: use uart-srv:uart_srv2-response instead.")))

(cl:ensure-generic-function 'output-val :lambda-list '(m))
(cl:defmethod output-val ((m <uart_srv2-response>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader uart-srv:output-val is deprecated.  Use uart-srv:output instead.")
  (output m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <uart_srv2-response>) ostream)
  "Serializes a message object of type '<uart_srv2-response>"
  (cl:let* ((signed (cl:slot-value msg 'output)) (unsigned (cl:if (cl:< signed 0) (cl:+ signed 4294967296) signed)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) unsigned) ostream)
    )
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <uart_srv2-response>) istream)
  "Deserializes a message object of type '<uart_srv2-response>"
    (cl:let ((unsigned 0))
      (cl:setf (cl:ldb (cl:byte 8 0) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) unsigned) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'output) (cl:if (cl:< unsigned 2147483648) unsigned (cl:- unsigned 4294967296))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<uart_srv2-response>)))
  "Returns string type for a service object of type '<uart_srv2-response>"
  "uart/uart_srv2Response")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'uart_srv2-response)))
  "Returns string type for a service object of type 'uart_srv2-response"
  "uart/uart_srv2Response")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<uart_srv2-response>)))
  "Returns md5sum for a message object of type '<uart_srv2-response>"
  "f3fd65dfbcbf72139f8cc955ff4cf532")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'uart_srv2-response)))
  "Returns md5sum for a message object of type 'uart_srv2-response"
  "f3fd65dfbcbf72139f8cc955ff4cf532")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<uart_srv2-response>)))
  "Returns full string definition for message of type '<uart_srv2-response>"
  (cl:format cl:nil "int32 output~%~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'uart_srv2-response)))
  "Returns full string definition for message of type 'uart_srv2-response"
  (cl:format cl:nil "int32 output~%~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <uart_srv2-response>))
  (cl:+ 0
     4
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <uart_srv2-response>))
  "Converts a ROS message object to a list"
  (cl:list 'uart_srv2-response
    (cl:cons ':output (output msg))
))
(cl:defmethod roslisp-msg-protocol:service-request-type ((msg (cl:eql 'uart_srv2)))
  'uart_srv2-request)
(cl:defmethod roslisp-msg-protocol:service-response-type ((msg (cl:eql 'uart_srv2)))
  'uart_srv2-response)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'uart_srv2)))
  "Returns string type for a service object of type '<uart_srv2>"
  "uart/uart_srv2")