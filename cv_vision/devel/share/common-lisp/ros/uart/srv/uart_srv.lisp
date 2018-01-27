; Auto-generated. Do not edit!


(cl:in-package uart-srv)


;//! \htmlinclude uart_srv-request.msg.html

(cl:defclass <uart_srv-request> (roslisp-msg-protocol:ros-message)
  ((input
    :reader input
    :initarg :input
    :type cl:string
    :initform ""))
)

(cl:defclass uart_srv-request (<uart_srv-request>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <uart_srv-request>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'uart_srv-request)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name uart-srv:<uart_srv-request> is deprecated: use uart-srv:uart_srv-request instead.")))

(cl:ensure-generic-function 'input-val :lambda-list '(m))
(cl:defmethod input-val ((m <uart_srv-request>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader uart-srv:input-val is deprecated.  Use uart-srv:input instead.")
  (input m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <uart_srv-request>) ostream)
  "Serializes a message object of type '<uart_srv-request>"
  (cl:let ((__ros_str_len (cl:length (cl:slot-value msg 'input))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_str_len) ostream))
  (cl:map cl:nil #'(cl:lambda (c) (cl:write-byte (cl:char-code c) ostream)) (cl:slot-value msg 'input))
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <uart_srv-request>) istream)
  "Deserializes a message object of type '<uart_srv-request>"
    (cl:let ((__ros_str_len 0))
      (cl:setf (cl:ldb (cl:byte 8 0) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'input) (cl:make-string __ros_str_len))
      (cl:dotimes (__ros_str_idx __ros_str_len msg)
        (cl:setf (cl:char (cl:slot-value msg 'input) __ros_str_idx) (cl:code-char (cl:read-byte istream)))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<uart_srv-request>)))
  "Returns string type for a service object of type '<uart_srv-request>"
  "uart/uart_srvRequest")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'uart_srv-request)))
  "Returns string type for a service object of type 'uart_srv-request"
  "uart/uart_srvRequest")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<uart_srv-request>)))
  "Returns md5sum for a message object of type '<uart_srv-request>"
  "4419faef08a11bbf3149cc3c8450f3a1")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'uart_srv-request)))
  "Returns md5sum for a message object of type 'uart_srv-request"
  "4419faef08a11bbf3149cc3c8450f3a1")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<uart_srv-request>)))
  "Returns full string definition for message of type '<uart_srv-request>"
  (cl:format cl:nil "string input~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'uart_srv-request)))
  "Returns full string definition for message of type 'uart_srv-request"
  (cl:format cl:nil "string input~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <uart_srv-request>))
  (cl:+ 0
     4 (cl:length (cl:slot-value msg 'input))
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <uart_srv-request>))
  "Converts a ROS message object to a list"
  (cl:list 'uart_srv-request
    (cl:cons ':input (input msg))
))
;//! \htmlinclude uart_srv-response.msg.html

(cl:defclass <uart_srv-response> (roslisp-msg-protocol:ros-message)
  ((output
    :reader output
    :initarg :output
    :type cl:integer
    :initform 0))
)

(cl:defclass uart_srv-response (<uart_srv-response>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <uart_srv-response>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'uart_srv-response)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name uart-srv:<uart_srv-response> is deprecated: use uart-srv:uart_srv-response instead.")))

(cl:ensure-generic-function 'output-val :lambda-list '(m))
(cl:defmethod output-val ((m <uart_srv-response>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader uart-srv:output-val is deprecated.  Use uart-srv:output instead.")
  (output m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <uart_srv-response>) ostream)
  "Serializes a message object of type '<uart_srv-response>"
  (cl:let* ((signed (cl:slot-value msg 'output)) (unsigned (cl:if (cl:< signed 0) (cl:+ signed 4294967296) signed)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) unsigned) ostream)
    )
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <uart_srv-response>) istream)
  "Deserializes a message object of type '<uart_srv-response>"
    (cl:let ((unsigned 0))
      (cl:setf (cl:ldb (cl:byte 8 0) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) unsigned) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'output) (cl:if (cl:< unsigned 2147483648) unsigned (cl:- unsigned 4294967296))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<uart_srv-response>)))
  "Returns string type for a service object of type '<uart_srv-response>"
  "uart/uart_srvResponse")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'uart_srv-response)))
  "Returns string type for a service object of type 'uart_srv-response"
  "uart/uart_srvResponse")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<uart_srv-response>)))
  "Returns md5sum for a message object of type '<uart_srv-response>"
  "4419faef08a11bbf3149cc3c8450f3a1")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'uart_srv-response)))
  "Returns md5sum for a message object of type 'uart_srv-response"
  "4419faef08a11bbf3149cc3c8450f3a1")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<uart_srv-response>)))
  "Returns full string definition for message of type '<uart_srv-response>"
  (cl:format cl:nil "int32 output~%~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'uart_srv-response)))
  "Returns full string definition for message of type 'uart_srv-response"
  (cl:format cl:nil "int32 output~%~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <uart_srv-response>))
  (cl:+ 0
     4
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <uart_srv-response>))
  "Converts a ROS message object to a list"
  (cl:list 'uart_srv-response
    (cl:cons ':output (output msg))
))
(cl:defmethod roslisp-msg-protocol:service-request-type ((msg (cl:eql 'uart_srv)))
  'uart_srv-request)
(cl:defmethod roslisp-msg-protocol:service-response-type ((msg (cl:eql 'uart_srv)))
  'uart_srv-response)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'uart_srv)))
  "Returns string type for a service object of type '<uart_srv>"
  "uart/uart_srv")