(defun myListp (lst)
  (if (null lst)
    nil
    (if (listp (car lst))
      t
      (myListp (cdr lst)))))

(defun mystery (x y)
  (if (null y)
    nil
    (if (eql (car y) x)
      0
      (let ((z (mystery x (cdr y))))
        (and z (+ z 1))))))

(defun myfourth (lst)
  (car (cdr (cdr (cdr lst)))))

(defun greater (a b)
  (if (> a b) a b))

(defpackage :morse
  (:use :common-lisp))

(in-package :morse)

(defparameter *morse-mapping*
  '((#\A ".-")
    (#\B "-...")
    (#\C "-.-.")
    (#\, "--..--")
    (#\? "..--..")))

(defun character-to-morse (character)
  (second (assoc character *morse-mapping* :test #'char-equal)))
