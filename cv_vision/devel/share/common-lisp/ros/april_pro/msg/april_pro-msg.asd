
(cl:in-package :asdf)

(defsystem "april_pro-msg"
  :depends-on (:roslisp-msg-protocol :roslisp-utils :std_msgs-msg
)
  :components ((:file "_package")
    (:file "camera_pos" :depends-on ("_package_camera_pos"))
    (:file "_package_camera_pos" :depends-on ("_package"))
  ))