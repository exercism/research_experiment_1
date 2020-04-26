(defpackage pokemon-battle
  (:use :cl)
  (:export :make-pokemon :battle))
(in-package :pokemon-battle)

(defstruct (pokemon) name type atk hp)

(defmethod tm ((a (eql 'fire))  (b (eql 'grass))) 2)
(defmethod tm ((a (eql 'grass)) (b (eql 'water))) 2)
(defmethod tm ((a (eql 'water)) (b (eql 'fire))) 2)
(defmethod tm (a b) (if (eq a b) 1 0.5))

(defmacro attack (a b)
  `(let ((type-modifier (tm (pokemon-type ,a) (pokemon-type ,b))))
     (decf (pokemon-hp ,b) (* (pokemon-atk ,a) type-modifier))
     (when (< (pokemon-hp ,b) 1) (return (pokemon-name ,a)))))

(defun battle (a b)
  (loop (attack a b) (attack b a)))
