
(cl:in-package :asdf)

(defsystem "uart-srv"
  :depends-on (:roslisp-msg-protocol :roslisp-utils )
  :components ((:file "_package")
    (:file "uart_srv" :depends-on ("_package_uart_srv"))
    (:file "_package_uart_srv" :depends-on ("_package"))
    (:file "uart_srv2" :depends-on ("_package_uart_srv2"))
    (:file "_package_uart_srv2" :depends-on ("_package"))
  ))