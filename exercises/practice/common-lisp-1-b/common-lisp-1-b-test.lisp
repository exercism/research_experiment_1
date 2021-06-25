(load "common-lisp-1-b")
(ql:quickload :fiveam)
(defpackage common-lisp-1-b-test
  (:use :cl :fiveam :common-lisp-1-b)
  (:export :run-tests))
(in-package :common-lisp-1-b-test)

(def-suite common-lisp-1-b-suite)
(in-suite common-lisp-1-b-suite)

(import '(common-lisp-1-b::fire common-lisp-1-b::grass common-lisp-1-b::water))

(defun make-test-pokemon (name &optional (type 'fire) (atk 5) (hp 40))
  (make-pokemon :name name :type type :atk atk :hp hp))

(test twin-pokemon-1
  (is (equal "A" (battle (make-test-pokemon "A")
                         (make-test-pokemon "B")))))
(test twin-pokemon-2
  (is (equal "A" (battle (make-test-pokemon "A" 'grass)
                         (make-test-pokemon "B" 'grass)))))
(test twin-pokemon-3
  (is (equal "A" (battle (make-test-pokemon "A" 'water)
                         (make-test-pokemon "B" 'water)))))

(test different-atk-pokemon-1
  (is (equal "A" (battle (make-test-pokemon "A" 'fire 10)
                         (make-test-pokemon "B" 'fire 5)))))
(test different-atk-pokemon-2
  (is (equal "B" (battle (make-test-pokemon "A" 'grass 5)
                         (make-test-pokemon "B" 'grass 10)))))

(test different-hp-pokemon-1
  (is (equal "A" (battle (make-test-pokemon "A" 'water 5 40)
                         (make-test-pokemon "B" 'water 5 35)))))
(test different-hp-pokemon-2
  (is (equal "B" (battle (make-test-pokemon "A" 'fire 5 35)
                         (make-test-pokemon "B" 'fire 5 40)))))

(test different-type-pokemon-1
  (is (equal "A" (battle (make-test-pokemon "A" 'fire)
                         (make-test-pokemon "B" 'grass)))))
(test different-type-pokemon-2
  (is (equal "B" (battle (make-test-pokemon "A" 'grass)
                         (make-test-pokemon "B" 'fire)))))
(test different-type-pokemon-3
  (is (equal "A" (battle (make-test-pokemon "A" 'grass)
                         (make-test-pokemon "B" 'water)))))
(test different-type-pokemon-4
  (is (equal "B" (battle (make-test-pokemon "A" 'water)
                         (make-test-pokemon "B" 'grass)))))
(test different-type-pokemon-5
  (is (equal "A" (battle (make-test-pokemon "A" 'water)
                         (make-test-pokemon "B" 'fire)))))
(test different-type-pokemon-6
  (is (equal "B" (battle (make-test-pokemon "A" 'fire)
                         (make-test-pokemon "B" 'water)))))

(test long-battle
  (is (equal "B" (battle (make-test-pokemon "A" 'grass 1 2000000)
                         (make-test-pokemon "B" 'fire 1 1000001)))))

(test short-battle
  (is (equal "A" (battle (make-test-pokemon "A" 'grass 1 1)
                         (make-test-pokemon "B" 'water 5 2)))))

(defun run-tests (&optional (explain t))
  (let ((tests (run 'common-lisp-1-b-suite)))
    (if explain (explain! tests) tests)))
