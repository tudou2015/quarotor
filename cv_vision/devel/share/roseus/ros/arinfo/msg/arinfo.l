;; Auto-generated. Do not edit!


(when (boundp 'arinfo::arinfo)
  (if (not (find-package "ARINFO"))
    (make-package "ARINFO"))
  (shadow 'arinfo (find-package "ARINFO")))
(unless (find-package "ARINFO::ARINFO")
  (make-package "ARINFO::ARINFO"))

(in-package "ROS")
;;//! \htmlinclude arinfo.msg.html
(if (not (find-package "STD_MSGS"))
  (ros::roseus-add-msgs "std_msgs"))


(defclass arinfo::arinfo
  :super ros::object
  :slots (_header _pitch _yaw _roll _height _mode _lock _state ))

(defmethod arinfo::arinfo
  (:init
   (&key
    ((:header __header) (instance std_msgs::Header :init))
    ((:pitch __pitch) 0)
    ((:yaw __yaw) 0)
    ((:roll __roll) 0)
    ((:height __height) 0)
    ((:mode __mode) 0)
    ((:lock __lock) 0)
    ((:state __state) 0)
    )
   (send-super :init)
   (setq _header __header)
   (setq _pitch (round __pitch))
   (setq _yaw (round __yaw))
   (setq _roll (round __roll))
   (setq _height (round __height))
   (setq _mode (round __mode))
   (setq _lock (round __lock))
   (setq _state (round __state))
   self)
  (:header
   (&rest __header)
   (if (keywordp (car __header))
       (send* _header __header)
     (progn
       (if __header (setq _header (car __header)))
       _header)))
  (:pitch
   (&optional __pitch)
   (if __pitch (setq _pitch __pitch)) _pitch)
  (:yaw
   (&optional __yaw)
   (if __yaw (setq _yaw __yaw)) _yaw)
  (:roll
   (&optional __roll)
   (if __roll (setq _roll __roll)) _roll)
  (:height
   (&optional __height)
   (if __height (setq _height __height)) _height)
  (:mode
   (&optional __mode)
   (if __mode (setq _mode __mode)) _mode)
  (:lock
   (&optional __lock)
   (if __lock (setq _lock __lock)) _lock)
  (:state
   (&optional __state)
   (if __state (setq _state __state)) _state)
  (:serialization-length
   ()
   (+
    ;; std_msgs/Header _header
    (send _header :serialization-length)
    ;; int16 _pitch
    2
    ;; int16 _yaw
    2
    ;; int16 _roll
    2
    ;; int16 _height
    2
    ;; uint8 _mode
    1
    ;; uint8 _lock
    1
    ;; uint8 _state
    1
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; std_msgs/Header _header
       (send _header :serialize s)
     ;; int16 _pitch
       (write-word _pitch s)
     ;; int16 _yaw
       (write-word _yaw s)
     ;; int16 _roll
       (write-word _roll s)
     ;; int16 _height
       (write-word _height s)
     ;; uint8 _mode
       (write-byte _mode s)
     ;; uint8 _lock
       (write-byte _lock s)
     ;; uint8 _state
       (write-byte _state s)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; std_msgs/Header _header
     (send _header :deserialize buf ptr-) (incf ptr- (send _header :serialization-length))
   ;; int16 _pitch
     (setq _pitch (sys::peek buf ptr- :short)) (incf ptr- 2)
   ;; int16 _yaw
     (setq _yaw (sys::peek buf ptr- :short)) (incf ptr- 2)
   ;; int16 _roll
     (setq _roll (sys::peek buf ptr- :short)) (incf ptr- 2)
   ;; int16 _height
     (setq _height (sys::peek buf ptr- :short)) (incf ptr- 2)
   ;; uint8 _mode
     (setq _mode (sys::peek buf ptr- :char)) (incf ptr- 1)
   ;; uint8 _lock
     (setq _lock (sys::peek buf ptr- :char)) (incf ptr- 1)
   ;; uint8 _state
     (setq _state (sys::peek buf ptr- :char)) (incf ptr- 1)
   ;;
   self)
  )

(setf (get arinfo::arinfo :md5sum-) "33a8a6b28d5e090707a6d6c000036a49")
(setf (get arinfo::arinfo :datatype-) "arinfo/arinfo")
(setf (get arinfo::arinfo :definition-)
      "Header header
int16 pitch
int16 yaw
int16 roll
int16 height
uint8 mode
uint8 lock
uint8 state

================================================================================
MSG: std_msgs/Header
# Standard metadata for higher-level stamped data types.
# This is generally used to communicate timestamped data 
# in a particular coordinate frame.
# 
# sequence ID: consecutively increasing ID 
uint32 seq
#Two-integer timestamp that is expressed as:
# * stamp.sec: seconds (stamp_secs) since epoch (in Python the variable is called 'secs')
# * stamp.nsec: nanoseconds since stamp_secs (in Python the variable is called 'nsecs')
# time-handling sugar is provided by the client library
time stamp
#Frame this data is associated with
# 0: no frame
# 1: global frame
string frame_id

")



(provide :arinfo/arinfo "33a8a6b28d5e090707a6d6c000036a49")


