(defpackage common-lisp-1-a
  (:use :cl)
  (:export :make-pokemon :battle))
(in-package :common-lisp-1-a)

(defparameter *matchups*
  '((fire  . grass)
    (grass . water)
    (water . fire)))

(defstruct pokemon name type hp atk)

(defconstant +attack-weakness-factor+ 2)

(defun battle-turn (defender attacker)
  (let* ((dfn-type (pokemon-type defender))
         (atk-type (pokemon-type attacker))
         (dfn-weak (assoc atk-type *matchups*))
         (atk-weak (rassoc dfn-type *matchups*))
         (damage (* (pokemon-atk attacker)
                    (cond ((eql dfn-type (cdr dfn-weak))
                           +attack-weakness-factor+)
                          ((eql dfn-type (cdr atk-weak))
                           (/ +attack-weakness-factor+))
                          (t 1)))))
    (decf (pokemon-hp defender) damage)
    defender))

(defun battle (pkm1 pkm2)
  (loop
    for order = (list pkm2 pkm1) then (reverse order)
    while (and (< 0 (pokemon-hp pkm1))
               (< 0 (pokemon-hp pkm2)))
    do (battle-turn (first order) (second order))
    finally (return
              (pokemon-name
               (first (sort (list pkm1 pkm2)
                            #'>
                            :key #'pokemon-hp))))))
