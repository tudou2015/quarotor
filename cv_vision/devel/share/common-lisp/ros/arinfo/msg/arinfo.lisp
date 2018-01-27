; Auto-generated. Do not edit!


(cl:in-package arinfo-msg)


;//! \htmlinclude arinfo.msg.html

(cl:defclass <arinfo> (roslisp-msg-protocol:ros-message)
  ((header
    :reader header
    :initarg :header
    :type std_msgs-msg:Header
    :initform (cl:make-instance 'std_msgs-msg:Header))
   (pitch
    :reader pitch
    :initarg :pitch
    :type cl:fixnum
    :initform 0)
   (yaw
    :reader yaw
    :initarg :yaw
    :type cl:fixnum
    :initform 0)
   (roll
    :reader roll
    :initarg :roll
    :type cl:fixnum
    :initform 0)
   (height
    :reader height
    :initarg :height
    :type cl:fixnum
    :initform 0)
   (mode
    :reader mode
    :initarg :mode
    :type cl:fixnum
    :initform 0)
   (lock
    :reader lock
    :initarg :lock
    :type cl:fixnum
    :initform 0)
   (state
    :reader state
    :initarg :state
    :type cl:fixnum
    :initform 0))
)

(cl:defclass arinfo (<arinfo>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <arinfo>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'arinfo)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name arinfo-msg:<arinfo> is deprecated: use arinfo-msg:arinfo instead.")))

(cl:ensure-generic-function 'header-val :lambda-list '(m))
(cl:defmethod header-val ((m <arinfo>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader arinfo-msg:header-val is deprecated.  Use arinfo-msg:header instead.")
  (header m))

(cl:ensure-generic-function 'pitch-val :lambda-list '(m))
(cl:defmethod pitch-val ((m <arinfo>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader arinfo-msg:pitch-val is deprecated.  Use arinfo-msg:pitch instead.")
  (pitch m))

(cl:ensure-generic-function 'yaw-val :lambda-list '(m))
(cl:defmethod yaw-val ((m <arinfo>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader arinfo-msg:yaw-val is deprecated.  Use arinfo-msg:yaw instead.")
  (yaw m))

(cl:ensure-generic-function 'roll-val :lambda-list '(m))
(cl:defmethod roll-val ((m <arinfo>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader arinfo-msg:roll-val is deprecated.  Use arinfo-msg:roll instead.")
  (roll m))

(cl:ensure-generic-function 'height-val :lambda-list '(m))
(cl:defmethod height-val ((m <arinfo>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader arinfo-msg:height-val is deprecated.  Use arinfo-msg:height instead.")
  (height m))

(cl:ensure-generic-function 'mode-val :lambda-list '(m))
(cl:defmethod mode-val ((m <arinfo>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader arinfo-msg:mode-val is deprecated.  Use arinfo-msg:mode instead.")
  (mode m))

(cl:ensure-generic-function 'lock-val :lambda-list '(m))
(cl:defmethod lock-val ((m <arinfo>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader arinfo-msg:lock-val is deprecated.  Use arinfo-msg:lock instead.")
  (lock m))

(cl:ensure-generic-function 'state-val :lambda-list '(m))
(cl:defmethod state-val ((m <arinfo>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader arinfo-msg:state-val is deprecated.  Use arinfo-msg:state instead.")
  (state m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <arinfo>) ostream)
  "Serializes a message object of type '<arinfo>"
  (roslisp-msg-protocol:serialize (cl:slot-value msg 'header) ostream)
  (cl:let* ((signed (cl:slot-value msg 'pitch)) (unsigned (cl:if (cl:< signed 0) (cl:+ signed 65536) signed)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) unsigned) ostream)
    )
  (cl:let* ((signed (cl:slot-value msg 'yaw)) (unsigned (cl:if (cl:< signed 0) (cl:+ signed 65536) signed)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) unsigned) ostream)
    )
  (cl:let* ((signed (cl:slot-value msg 'roll)) (unsigned (cl:if (cl:< signed 0) (cl:+ signed 65536) signed)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) unsigned) ostream)
    )
  (cl:let* ((signed (cl:slot-value msg 'height)) (unsigned (cl:if (cl:< signed 0) (cl:+ signed 65536) signed)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) unsigned) ostream)
    )
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'mode)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'lock)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'state)) ostream)
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <arinfo>) istream)
  "Deserializes a message object of type '<arinfo>"
  (roslisp-msg-protocol:deserialize (cl:slot-value msg 'header) istream)
    (cl:let ((unsigned 0))
      (cl:setf (cl:ldb (cl:byte 8 0) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) unsigned) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'pitch) (cl:if (cl:< unsigned 32768) unsigned (cl:- unsigned 65536))))
    (cl:let ((unsigned 0))
      (cl:setf (cl:ldb (cl:byte 8 0) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) unsigned) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'yaw) (cl:if (cl:< unsigned 32768) unsigned (cl:- unsigned 65536))))
    (cl:let ((unsigned 0))
      (cl:setf (cl:ldb (cl:byte 8 0) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) unsigned) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'roll) (cl:if (cl:< unsigned 32768) unsigned (cl:- unsigned 65536))))
    (cl:let ((unsigned 0))
      (cl:setf (cl:ldb (cl:byte 8 0) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) unsigned) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'height) (cl:if (cl:< unsigned 32768) unsigned (cl:- unsigned 65536))))
    (cl:setf (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'mode)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'lock)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'state)) (cl:read-byte istream))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<arinfo>)))
  "Returns string type for a message object of type '<arinfo>"
  "arinfo/arinfo")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'arinfo)))
  "Returns string type for a message object of type 'arinfo"
  "arinfo/arinfo")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<arinfo>)))
  "Returns md5sum for a message object of type '<arinfo>"
  "33a8a6b28d5e090707a6d6c000036a49")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'arinfo)))
  "Returns md5sum for a message object of type 'arinfo"
  "33a8a6b28d5e090707a6d6c000036a49")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<arinfo>)))
  "Returns full string definition for message of type '<arinfo>"
  (cl:format cl:nil "Header header~%int16 pitch~%int16 yaw~%int16 roll~%int16 height~%uint8 mode~%uint8 lock~%uint8 state~%~%================================================================================~%MSG: std_msgs/Header~%# Standard metadata for higher-level stamped data types.~%# This is generally used to communicate timestamped data ~%# in a particular coordinate frame.~%# ~%# sequence ID: consecutively increasing ID ~%uint32 seq~%#Two-integer timestamp that is expressed as:~%# * stamp.sec: seconds (stamp_secs) since epoch (in Python the variable is called 'secs')~%# * stamp.nsec: nanoseconds since stamp_secs (in Python the variable is called 'nsecs')~%# time-handling sugar is provided by the client library~%time stamp~%#Frame this data is associated with~%# 0: no frame~%# 1: global frame~%string frame_id~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'arinfo)))
  "Returns full string definition for message of type 'arinfo"
  (cl:format cl:nil "Header header~%int16 pitch~%int16 yaw~%int16 roll~%int16 height~%uint8 mode~%uint8 lock~%uint8 state~%~%================================================================================~%MSG: std_msgs/Header~%# Standard metadata for higher-level stamped data types.~%# This is generally used to communicate timestamped data ~%# in a particular coordinate frame.~%# ~%# sequence ID: consecutively increasing ID ~%uint32 seq~%#Two-integer timestamp that is expressed as:~%# * stamp.sec: seconds (stamp_secs) since epoch (in Python the variable is called 'secs')~%# * stamp.nsec: nanoseconds since stamp_secs (in Python the variable is called 'nsecs')~%# time-handling sugar is provided by the client library~%time stamp~%#Frame this data is associated with~%# 0: no frame~%# 1: global frame~%string frame_id~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <arinfo>))
  (cl:+ 0
     (roslisp-msg-protocol:serialization-length (cl:slot-value msg 'header))
     2
     2
     2
     2
     1
     1
     1
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <arinfo>))
  "Converts a ROS message object to a list"
  (cl:list 'arinfo
    (cl:cons ':header (header msg))
    (cl:cons ':pitch (pitch msg))
    (cl:cons ':yaw (yaw msg))
    (cl:cons ':roll (roll msg))
    (cl:cons ':height (height msg))
    (cl:cons ':mode (mode msg))
    (cl:cons ':lock (lock msg))
    (cl:cons ':state (state msg))
))
