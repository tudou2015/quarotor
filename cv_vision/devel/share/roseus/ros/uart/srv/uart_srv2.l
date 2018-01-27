;; Auto-generated. Do not edit!


(when (boundp 'uart::uart_srv2)
  (if (not (find-package "UART"))
    (make-package "UART"))
  (shadow 'uart_srv2 (find-package "UART")))
(unless (find-package "UART::UART_SRV2")
  (make-package "UART::UART_SRV2"))
(unless (find-package "UART::UART_SRV2REQUEST")
  (make-package "UART::UART_SRV2REQUEST"))
(unless (find-package "UART::UART_SRV2RESPONSE")
  (make-package "UART::UART_SRV2RESPONSE"))

(in-package "ROS")





(defclass uart::uart_srv2Request
  :super ros::object
  :slots (_input ))

(defmethod uart::uart_srv2Request
  (:init
   (&key
    ((:input __input) (make-array 0 :initial-element 0 :element-type :char))
    )
   (send-super :init)
   (setq _input __input)
   self)
  (:input
   (&optional __input)
   (if __input (setq _input __input)) _input)
  (:serialization-length
   ()
   (+
    ;; uint8[] _input
    (* 1    (length _input)) 4
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; uint8[] _input
     (write-long (length _input) s)
     (princ _input s)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; uint8[] _input
   (let ((n (sys::peek buf ptr- :integer))) (incf ptr- 4)
     (setq _input (make-array n :element-type :char))
     (replace _input buf :start2 ptr-) (incf ptr- n))
   ;;
   self)
  )

(defclass uart::uart_srv2Response
  :super ros::object
  :slots (_output ))

(defmethod uart::uart_srv2Response
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

(defclass uart::uart_srv2
  :super ros::object
  :slots ())

(setf (get uart::uart_srv2 :md5sum-) "f3fd65dfbcbf72139f8cc955ff4cf532")
(setf (get uart::uart_srv2 :datatype-) "uart/uart_srv2")
(setf (get uart::uart_srv2 :request) uart::uart_srv2Request)
(setf (get uart::uart_srv2 :response) uart::uart_srv2Response)

(defmethod uart::uart_srv2Request
  (:response () (instance uart::uart_srv2Response :init)))

(setf (get uart::uart_srv2Request :md5sum-) "f3fd65dfbcbf72139f8cc955ff4cf532")
(setf (get uart::uart_srv2Request :datatype-) "uart/uart_srv2Request")
(setf (get uart::uart_srv2Request :definition-)
      "uint8[] input
---
int32 output

")

(setf (get uart::uart_srv2Response :md5sum-) "f3fd65dfbcbf72139f8cc955ff4cf532")
(setf (get uart::uart_srv2Response :datatype-) "uart/uart_srv2Response")
(setf (get uart::uart_srv2Response :definition-)
      "uint8[] input
---
int32 output

")



(provide :uart/uart_srv2 "f3fd65dfbcbf72139f8cc955ff4cf532")


