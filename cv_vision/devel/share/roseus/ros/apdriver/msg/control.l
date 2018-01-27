;; Auto-generated. Do not edit!


(when (boundp 'apdriver::control)
  (if (not (find-package "APDRIVER"))
    (make-package "APDRIVER"))
  (shadow 'control (find-package "APDRIVER")))
(unless (find-package "APDRIVER::CONTROL")
  (make-package "APDRIVER::CONTROL"))

(in-package "ROS")
;;//! \htmlinclude control.msg.html


(defclass apdriver::control
  :super ros::object
  :slots (_pit _rol _thr _yaw ))

(defmethod apdriver::control
  (:init
   (&key
    ((:pit __pit) 0)
    ((:rol __rol) 0)
    ((:thr __thr) 0)
    ((:yaw __yaw) 0)
    )
   (send-super :init)
   (setq _pit (round __pit))
   (setq _rol (round __rol))
   (setq _thr (round __thr))
   (setq _yaw (round __yaw))
   self)
  (:pit
   (&optional __pit)
   (if __pit (setq _pit __pit)) _pit)
  (:rol
   (&optional __rol)
   (if __rol (setq _rol __rol)) _rol)
  (:thr
   (&optional __thr)
   (if __thr (setq _thr __thr)) _thr)
  (:yaw
   (&optional __yaw)
   (if __yaw (setq _yaw __yaw)) _yaw)
  (:serialization-length
   ()
   (+
    ;; int16 _pit
    2
    ;; int16 _rol
    2
    ;; int16 _thr
    2
    ;; int16 _yaw
    2
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; int16 _pit
       (write-word _pit s)
     ;; int16 _rol
       (write-word _rol s)
     ;; int16 _thr
       (write-word _thr s)
     ;; int16 _yaw
       (write-word _yaw s)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; int16 _pit
     (setq _pit (sys::peek buf ptr- :short)) (incf ptr- 2)
   ;; int16 _rol
     (setq _rol (sys::peek buf ptr- :short)) (incf ptr- 2)
   ;; int16 _thr
     (setq _thr (sys::peek buf ptr- :short)) (incf ptr- 2)
   ;; int16 _yaw
     (setq _yaw (sys::peek buf ptr- :short)) (incf ptr- 2)
   ;;
   self)
  )

(setf (get apdriver::control :md5sum-) "38cad1b120b5b9dad758ac9821bfccf0")
(setf (get apdriver::control :datatype-) "apdriver/control")
(setf (get apdriver::control :definition-)
      "int16 pit
int16 rol
int16 thr
int16 yaw

")



(provide :apdriver/control "38cad1b120b5b9dad758ac9821bfccf0")


