;; Auto-generated. Do not edit!


(when (boundp 'uart::uart_srv)
  (if (not (find-package "UART"))
    (make-package "UART"))
  (shadow 'uart_srv (find-package "UART")))
(unless (find-package "UART::UART_SRV")
  (make-package "UART::UART_SRV"))
(unless (find-package "UART::UART_SRVREQUEST")
  (make-package "UART::UART_SRVREQUEST"))
(unless (find-package "UART::UART_SRVRESPONSE")
  (make-package "UART::UART_SRVRESPONSE"))

(in-package "ROS")





(defclass uart::uart_srvRequest
  :super ros::object
  :slots (_input ))

(defmethod uart::uart_srvRequest
  (:init
   (&key
    ((:input __input) "")
    )
   (send-super :init)
   (setq _input (string __input))
   self)
  (:input
   (&optional __input)
   (if __input (setq _input __input)) _input)
  (:serialization-length
   ()
   (+
    ;; string _input
    4 (length _input)
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; string _input
       (write-long (length _input) s) (princ _input s)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; string _input
     (let (n) (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4) (setq _input (subseq buf ptr- (+ ptr- n))) (incf ptr- n))
   ;;
   self)
  )

(defclass uart::uart_srvResponse
  :super ros::object
  :slots (_output ))

(defmethod uart::uart_srvResponse
  (:init
   (&key
    ((:output __output) 0)
    )
   (send-super :init)
   (setq _output (round __output))
   self)
  (:output
   (&optional __output)
   (if __output (setq _output __output)) _output)
  (:serialization-length
   ()
   (+
    ;; int32 _output
    4
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; int32 _output
       (write-long _output s)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; int32 _output
     (setq _output (sys::peek buf ptr- :integer)) (incf ptr- 4)
   ;;
   self)
  )

(defclass uart::uart_srv
  :super ros::object
  :slots ())

(setf (get uart::uart_srv :md5sum-) "4419faef08a11bbf3149cc3c8450f3a1")
(setf (get uart::uart_srv :datatype-) "uart/uart_srv")
(setf (get uart::uart_srv :request) uart::uart_srvRequest)
(setf (get uart::uart_srv :response) uart::uart_srvResponse)

(defmethod uart::uart_srvRequest
  (:response () (instance uart::uart_srvResponse :init)))

(setf (get uart::uart_srvRequest :md5sum-) "4419faef08a11bbf3149cc3c8450f3a1")
(setf (get uart::uart_srvRequest :datatype-) "uart/uart_srvRequest")
(setf (get uart::uart_srvRequest :definition-)
      "string input
---
int32 output

")

(setf (get uart::uart_srvResponse :md5sum-) "4419faef08a11bbf3149cc3c8450f3a1")
(setf (get uart::uart_srvResponse :datatype-) "uart/uart_srvResponse")
(setf (get uart::uart_srvResponse :definition-)
      "string input
---
int32 output

")



(provide :uart/uart_srv "4419faef08a11bbf3149cc3c8450f3a1")


