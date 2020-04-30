(defpackage common-lisp-1-b
  (:use :cl)
  (:export :make-pokemon :battle))
(in-package :common-lisp-1-b)

(in-package :pokemon-battle)

(defun make-pokemon (&key name type atk hp)
  (list :name name :type type :atk atk :hp hp))

(defun name (pokemon) (getf pokemon :name))
(defun type (pokemon) (getf pokemon :type))
(defun attack (pokemon) (getf pokemon :atk))
(defun hp (pokemon) (getf pokemon :hp))
(defun (setf hp) (value pokemon) (setf (getf pokemon :hp) value))

(let* ((strong-vs '((fire grass) (grass water) (water fire)))
       (type-effectiveness-chart
         `(,@(loop for types in strong-vs collect (cons types 2))
           ,@(loop for types in strong-vs collect (cons (reverse types) 1/2))
           ,@ (loop for type in (mapcar #'car strong-vs) :collect (cons (list type type) 1)))))
  (defun type-modifier (types)
    (cdr (assoc types type-effectiveness-chart :test #'equal))))

(defun battle (attacker defender)
  (cond ((not (plusp (hp attacker))) (name defender))
        ((not (plusp (hp defender))) (name attacker))
        (t (let ((type-modifier
                   (type-modifier (list (type attacker) (type defender)))))
             (decf (hp defender) (* (attack attacker) type-modifier))
             (battle defender attacker)))))
