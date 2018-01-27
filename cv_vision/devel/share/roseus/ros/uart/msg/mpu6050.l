;; Auto-generated. Do not edit!


(when (boundp 'uart::mpu6050)
  (if (not (find-package "UART"))
    (make-package "UART"))
  (shadow 'mpu6050 (find-package "UART")))
(unless (find-package "UART::MPU6050")
  (make-package "UART::MPU6050"))

(in-package "ROS")
;;//! \htmlinclude mpu6050.msg.html


(defclass uart::mpu6050
  :super ros::object
  :slots (_ax _ay _az _gx _gy _gz ))

(defmethod uart::mpu6050
  (:init
   (&key
    ((:ax __ax) 0)
    ((:ay __ay) 0)
    ((:az __az) 0)
    ((:gx __gx) 0)
    ((:gy __gy) 0)
    ((:gz __gz) 0)
    )
   (send-super :init)
   (setq _ax (round __ax))
   (setq _ay (round __ay))
   (setq _az (round __az))
   (setq _gx (round __gx))
   (setq _gy (round __gy))
   (setq _gz (round __gz))
   self)
  (:ax
   (&optional __ax)
   (if __ax (setq _ax __ax)) _ax)
  (:ay
   (&optional __ay)
   (if __ay (setq _ay __ay)) _ay)
  (:az
   (&optional __az)
   (if __az (setq _az __az)) _az)
  (:gx
   (&optional __gx)
   (if __gx (setq _gx __gx)) _gx)
  (:gy
   (&optional __gy)
   (if __gy (setq _gy __gy)) _gy)
  (:gz
   (&optional __gz)
   (if __gz (setq _gz __gz)) _gz)
  (:serialization-length
   ()
   (+
    ;; int16 _ax
    2
    ;; int16 _ay
    2
    ;; int16 _az
    2
    ;; int16 _gx
    2
    ;; int16 _gy
    2
    ;; int16 _gz
    2
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; int16 _ax
       (write-word _ax s)
     ;; int16 _ay
       (write-word _ay s)
     ;; int16 _az
       (write-word _az s)
     ;; int16 _gx
       (write-word _gx s)
     ;; int16 _gy
       (write-word _gy s)
     ;; int16 _gz
       (write-word _gz s)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; int16 _ax
     (setq _ax (sys::peek buf ptr- :short)) (incf ptr- 2)
   ;; int16 _ay
     (setq _ay (sys::peek buf ptr- :short)) (incf ptr- 2)
   ;; int16 _az
     (setq _az (sys::peek buf ptr- :short)) (incf ptr- 2)
   ;; int16 _gx
     (setq _gx (sys::peek buf ptr- :short)) (incf ptr- 2)
   ;; int16 _gy
     (setq _gy (sys::peek buf ptr- :short)) (incf ptr- 2)
   ;; int16 _gz
     (setq _gz (sys::peek buf ptr- :short)) (incf ptr- 2)
   ;;
   self)
  )

(setf (get uart::mpu6050 :md5sum-) "ee542a682aee2ad96063f7f4b66160ba")
(setf (get uart::mpu6050 :datatype-) "uart/mpu6050")
(setf (get uart::mpu6050 :definition-)
      "int16 ax
int16 ay
int16 az
int16 gx
int16 gy
int16 gz

")



(provide :uart/mpu6050 "ee542a682aee2ad96063f7f4b66160ba")


