
(cl:in-package :asdf)

(defsystem "arinfo-msg"
  :depends-on (:roslisp-msg-protocol :roslisp-utils :std_msgs-msg
)
  :components ((:file "_package")
    (:file "arinfo" :depends-on ("_package_arinfo"))
    (:file "_package_arinfo" :depends-on ("_package"))
  ))