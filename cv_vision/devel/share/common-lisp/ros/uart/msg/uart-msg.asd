
(cl:in-package :asdf)

(defsystem "uart-msg"
  :depends-on (:roslisp-msg-protocol :roslisp-utils )
  :components ((:file "_package")
    (:file "mpu6050" :depends-on ("_package_mpu6050"))
    (:file "_package_mpu6050" :depends-on ("_package"))
  ))