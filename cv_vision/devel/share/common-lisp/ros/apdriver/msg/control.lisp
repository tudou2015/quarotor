; Auto-generated. Do not edit!


(cl:in-package apdriver-msg)


;//! \htmlinclude control.msg.html

(cl:defclass <control> (roslisp-msg-protocol:ros-message)
  ((pit
    :reader pit
    :initarg :pit
    :type cl:fixnum
    :initform 0)
   (rol
    :reader rol
    :initarg :rol
    :type cl:fixnum
    :initform 0)
   (thr
    :reader thr
    :initarg :thr
    :type cl:fixnum
    :initform 0)
   (yaw
    :reader yaw
    :initarg :yaw
    :type cl:fixnum
    :initform 0))
)

(cl:defclass control (<control>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <control>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'control)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name apdriver-msg:<control> is deprecated: use apdriver-msg:control instead.")))

(cl:ensure-generic-function 'pit-val :lambda-list '(m))
(cl:defmethod pit-val ((m <control>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader apdriver-msg:pit-val is deprecated.  Use apdriver-msg:pit instead.")
  (pit m))

(cl:ensure-generic-function 'rol-val :lambda-list '(m))
(cl:defmethod rol-val ((m <control>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader apdriver-msg:rol-val is deprecated.  Use apdriver-msg:rol instead.")
  (rol m))

(cl:ensure-generic-function 'thr-val :lambda-list '(m))
(cl:defmethod thr-val ((m <control>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader apdriver-msg:thr-val is deprecated.  Use apdriver-msg:thr instead.")
  (thr m))

(cl:ensure-generic-function 'yaw-val :lambda-list '(m))
(cl:defmethod yaw-val ((m <control>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader apdriver-msg:yaw-val is deprecated.  Use apdriver-msg:yaw instead.")
  (yaw m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <control>) ostream)
  "Serializes a message object of type '<control>"
  (cl:let* ((signed (cl:slot-value msg 'pit)) (unsigned (cl:if (cl:< signed 0) (cl:+ signed 65536) signed)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) unsigned) ostream)
    )
  (cl:let* ((signed (cl:slot-value msg 'rol)) (unsigned (cl:if (cl:< signed 0) (cl:+ signed 65536) signed)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) unsigned) ostream)
    )
  (cl:let* ((signed (cl:slot-value msg 'thr)) (unsigned (cl:if (cl:< signed 0) (cl:+ signed 65536) signed)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) unsigned) ostream)
    )
  (cl:let* ((signed (cl:slot-value msg 'yaw)) (unsigned (cl:if (cl:< signed 0) (cl:+ signed 65536) signed)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) unsigned) ostream)
    )
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <control>) istream)
  "Deserializes a message object of type '<control>"
    (cl:let ((unsigned 0))
      (cl:setf (cl:ldb (cl:byte 8 0) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) unsigned) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'pit) (cl:if (cl:< unsigned 32768) unsigned (cl:- unsigned 65536))))
    (cl:let ((unsigned 0))
      (cl:setf (cl:ldb (cl:byte 8 0) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) unsigned) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'rol) (cl:if (cl:< unsigned 32768) unsigned (cl:- unsigned 65536))))
    (cl:let ((unsigned 0))
      (cl:setf (cl:ldb (cl:byte 8 0) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) unsigned) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'thr) (cl:if (cl:< unsigned 32768) unsigned (cl:- unsigned 65536))))
    (cl:let ((unsigned 0))
      (cl:setf (cl:ldb (cl:byte 8 0) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) unsigned) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'yaw) (cl:if (cl:< unsigned 32768) unsigned (cl:- unsigned 65536))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<control>)))
  "Returns string type for a message object of type '<control>"
  "apdriver/control")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'control)))
  "Returns string type for a message object of type 'control"
  "apdriver/control")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<control>)))
  "Returns md5sum for a message object of type '<control>"
  "38cad1b120b5b9dad758ac9821bfccf0")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'control)))
  "Returns md5sum for a message object of type 'control"
  "38cad1b120b5b9dad758ac9821bfccf0")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<control>)))
  "Returns full string definition for message of type '<control>"
  (cl:format cl:nil "int16 pit~%int16 rol~%int16 thr~%int16 yaw~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'control)))
  "Returns full string definition for message of type 'control"
  (cl:format cl:nil "int16 pit~%int16 rol~%int16 thr~%int16 yaw~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <control>))
  (cl:+ 0
     2
     2
     2
     2
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <control>))
  "Converts a ROS message object to a list"
  (cl:list 'control
    (cl:cons ':pit (pit msg))
    (cl:cons ':rol (rol msg))
    (cl:cons ':thr (thr msg))
    (cl:cons ':yaw (yaw msg))
))
