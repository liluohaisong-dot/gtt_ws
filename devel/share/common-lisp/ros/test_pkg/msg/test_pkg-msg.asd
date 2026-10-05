
(cl:in-package :asdf)

(defsystem "test_pkg-msg"
  :depends-on (:roslisp-msg-protocol :roslisp-utils )
  :components ((:file "_package")
    (:file "Work" :depends-on ("_package_Work"))
    (:file "_package_Work" :depends-on ("_package"))
  ))