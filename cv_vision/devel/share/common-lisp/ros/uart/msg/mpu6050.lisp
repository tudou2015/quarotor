; Auto-generated. Do not edit!


(cl:in-package uart-msg)


;//! \htmlinclude mpu6050.msg.html

(cl:defclass <mpu6050> (roslisp-msg-protocol:ros-message)
  ((ax
    :reader ax
    :initarg :ax
    :type cl:fixnum
    :initform 0)
   (ay
    :reader ay
    :initarg :ay
    :type cl:fixnum
    :initform 0)
   (az
    :reader az
    :initarg :az
    :type cl:fixnum
    :initform 0)
   (gx
    :reader gx
    :initarg :gx
    :type cl:fixnum
    :initform 0)
   (gy
    :reader gy
    :initarg :gy
    :type cl:fixnum
    :initform 0)
   (gz
    :reader gz
    :initarg :gz
    :type cl:fixnum
    :initform 0))
)

(cl:defclass mpu6050 (<mpu6050>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <mpu6050>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'mpu6050)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name uart-msg:<mpu6050> is deprecated: use uart-msg:mpu6050 instead.")))

(cl:ensure-generic-function 'ax-val :lambda-list '(m))
(cl:defmethod ax-val ((m <mpu6050>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader uart-msg:ax-val is deprecated.  Use uart-msg:ax instead.")
  (ax m))

(cl:ensure-generic-function 'ay-val :lambda-list '(m))
(cl:defmethod ay-val ((m <mpu6050>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader uart-msg:ay-val is deprecated.  Use uart-msg:ay instead.")
  (ay m))

(cl:ensure-generic-function 'az-val :lambda-list '(m))
(cl:defmethod az-val ((m <mpu6050>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader uart-msg:az-val is deprecated.  Use uart-msg:az instead.")
  (az m))

(cl:ensure-generic-function 'gx-val :lambda-list '(m))
(cl:defmethod gx-val ((m <mpu6050>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader uart-msg:gx-val is deprecated.  Use uart-msg:gx instead.")
  (gx m))

(cl:ensure-generic-function 'gy-val :lambda-list '(m))
(cl:defmethod gy-val ((m <mpu6050>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader uart-msg:gy-val is deprecated.  Use uart-msg:gy instead.")
  (gy m))

(cl:ensure-generic-function 'gz-val :lambda-list '(m))
(cl:defmethod gz-val ((m <mpu6050>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader uart-msg:gz-val is deprecated.  Use uart-msg:gz instead.")
  (gz m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <mpu6050>) ostream)
  "Serializes a message object of type '<mpu6050>"
  (cl:let* ((signed (cl:slot-value msg 'ax)) (unsigned (cl:if (cl:< signed 0) (cl:+ signed 65536) signed)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) unsigned) ostream)
    )
  (cl:let* ((signed (cl:slot-value msg 'ay)) (unsigned (cl:if (cl:< signed 0) (cl:+ signed 65536) signed)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) unsigned) ostream)
    )
  (cl:let* ((signed (cl:slot-value msg 'az)) (unsigned (cl:if (cl:< signed 0) (cl:+ signed 65536) signed)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) unsigned) ostream)
    )
  (cl:let* ((signed (cl:slot-value msg 'gx)) (unsigned (cl:if (cl:< signed 0) (cl:+ signed 65536) signed)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) unsigned) ostream)
    )
  (cl:let* ((signed (cl:slot-value msg 'gy)) (unsigned (cl:if (cl:< signed 0) (cl:+ signed 65536) signed)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) unsigned) ostream)
    )
  (cl:let* ((signed (cl:slot-value msg 'gz)) (unsigned (cl:if (cl:< signed 0) (cl:+ signed 65536) signed)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) unsigned) ostream)
    )
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <mpu6050>) istream)
  "Deserializes a message object of type '<mpu6050>"
    (cl:let ((unsigned 0))
      (cl:setf (cl:ldb (cl:byte 8 0) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) unsigned) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'ax) (cl:if (cl:< unsigned 32768) unsigned (cl:- unsigned 65536))))
    (cl:let ((unsigned 0))
      (cl:setf (cl:ldb (cl:byte 8 0) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) unsigned) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'ay) (cl:if (cl:< unsigned 32768) unsigned (cl:- unsigned 65536))))
    (cl:let ((unsigned 0))
      (cl:setf (cl:ldb (cl:byte 8 0) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) unsigned) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'az) (cl:if (cl:< unsigned 32768) unsigned (cl:- unsigned 65536))))
    (cl:let ((unsigned 0))
      (cl:setf (cl:ldb (cl:byte 8 0) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) unsigned) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'gx) (cl:if (cl:< unsigned 32768) unsigned (cl:- unsigned 65536))))
    (cl:let ((unsigned 0))
      (cl:setf (cl:ldb (cl:byte 8 0) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) unsigned) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'gy) (cl:if (cl:< unsigned 32768) unsigned (cl:- unsigned 65536))))
    (cl:let ((unsigned 0))
      (cl:setf (cl:ldb (cl:byte 8 0) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) unsigned) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'gz) (cl:if (cl:< unsigned 32768) unsigned (cl:- unsigned 65536))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<mpu6050>)))
  "Returns string type for a message object of type '<mpu6050>"
  "uart/mpu6050")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'mpu6050)))
  "Returns string type for a message object of type 'mpu6050"
  "uart/mpu6050")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<mpu6050>)))
  "Returns md5sum for a message object of type '<mpu6050>"
  "ee542a682aee2ad96063f7f4b66160ba")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'mpu6050)))
  "Returns md5sum for a message object of type 'mpu6050"
  "ee542a682aee2ad96063f7f4b66160ba")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<mpu6050>)))
  "Returns full string definition for message of type '<mpu6050>"
  (cl:format cl:nil "int16 ax~%int16 ay~%int16 az~%int16 gx~%int16 gy~%int16 gz~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'mpu6050)))
  "Returns full string definition for message of type 'mpu6050"
  (cl:format cl:nil "int16 ax~%int16 ay~%int16 az~%int16 gx~%int16 gy~%int16 gz~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <mpu6050>))
  (cl:+ 0
     2
     2
     2
     2
     2
     2
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <mpu6050>))
  "Converts a ROS message object to a list"
  (cl:list 'mpu6050
    (cl:cons ':ax (ax msg))
    (cl:cons ':ay (ay msg))
    (cl:cons ':az (az msg))
    (cl:cons ':gx (gx msg))
    (cl:cons ':gy (gy msg))
    (cl:cons ':gz (gz msg))
))
