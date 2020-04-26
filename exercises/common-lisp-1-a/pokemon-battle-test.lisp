(load "pokemon-battle")
(ql:quickload :fiveam)
(defpackage pokemon-battle-test
  (:use :cl :fiveam :pokemon-battle)
  (:export :run-tests))
(in-package :pokemon-battle-test)

(def-suite pokemon-battle-suite)
(in-suite pokemon-battle-suite)

(import '(pokemon-battle::fire pokemon-battle::grass pokemon-battle::water))

(defun make-test-pokemon (name &optional (type 'fire) (atk 5) (hp 40))
  (make-pokemon :name name :type type :atk atk :hp hp))

(test twin-pokemon "If identical Pokémon are battling, the first always wins"
  (is (equal "A" (battle (make-test-pokemon "A")
                         (make-test-pokemon "B"))))
  (is (equal "A" (battle (make-test-pokemon "A" 'grass)
                         (make-test-pokemon "B" 'grass))))
  (is (equal "A" (battle (make-test-pokemon "A" 'water)
                         (make-test-pokemon "B" 'water)))))

(test different-type-pokemon "If otherwise identical Pokémon with different types are battling, the type with advantage wins"
  (is (equal "A" (battle (make-test-pokemon "A" 'fire)
                         (make-test-pokemon "B" 'grass))))
  (is (equal "B" (battle (make-test-pokemon "A" 'grass)
                         (make-test-pokemon "B" 'fire))))
  (is (equal "A" (battle (make-test-pokemon "A" 'grass)
                         (make-test-pokemon "B" 'water))))
  (is (equal "B" (battle (make-test-pokemon "A" 'water)
                         (make-test-pokemon "B" 'grass))))
  (is (equal "A" (battle (make-test-pokemon "A" 'water)
                         (make-test-pokemon "B" 'fire))))
  (is (equal "B" (battle (make-test-pokemon "A" 'fire)
                         (make-test-pokemon "B" 'water)))))

(defun run-tests (&optional (explain t))
  (let ((tests (run 'pokemon-battle-suite)))
    (if explain (explain! tests) tests)))
