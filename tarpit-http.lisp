(defpackage tarpit-http
  (:use :cl)
  (:export :start))

(in-package :tarpit-http)

(ql:quickload :hunchentoot)

(defun start (port)
  (hunchentoot:start (make-instance 'hunchentoot:easy-acceptor :port port))
  (hunchentoot:define-easy-handler (tarpit :uri "/tarpit") ()
    (setf (hunchentoot:content-type*) "text/plain")
    (let ((remote-ip-address (tbnl:remote-addr*))
          (random-number nil))
      (format t "Connection from: ~a~%" remote-ip-address)
      (loop
       (setf random-number (random 2000000))
       (format nil "~A~C~C" random-number #\return #\linefeed)
       (format t "~a was sent ~a~%" remote-ip-address random-number)
       (sleep 5)))))
