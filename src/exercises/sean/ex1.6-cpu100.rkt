#lang racket

;;;SECTION 1.1.7

(define (sqrt-iter guess x)
  (if (good-enough? guess x)
      guess
      (sqrt-iter (improve guess x)
                 x)))

(define (improve guess x)
  (average guess (/ x guess)))

(define (average x y)
  (/ (+ x y) 2))

(define (square x)
  (* x x))

(define (good-enough? guess x)
  (< (abs (- (square guess) x)) 0.001))

(define (sqrt x)
  (sqrt-iter 1.0 x))

(sqrt 9)
(sqrt (+ 100 37))
(sqrt (+ (sqrt 2) (sqrt 3)))
(square (sqrt 1000))

; ex 1.6 - new-if that does not terminate
; reason: applicative interpreter, so both then AND else clauses are evaluated -> infinite recursion
(define (new-if predicate then-clause else-clause)
  (cond (predicate then-clause)
        (else else-clause)))
 
(new-if (= 2 3) 0 5)

(new-if (= 1 1) 0 5)

(define (sqrt-iter-2 guess x)
  (new-if (good-enough? guess x)
          guess
          (sqrt-iter-2 (improve guess x)
                       x)))

(define (sqrt-2 x)
  (sqrt-iter-2 1.0 x))

(sqrt-2 9)
(sqrt-2 (+ 100 37))
(sqrt-2 (+ (sqrt-2 2) (sqrt-2 3)))
(square (sqrt-2 1000))

; ==================

