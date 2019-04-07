#lang racket
(require sicp)

(define (p) (p))

(define (test x y)
  (if (= x 0)
    0
    y))

; note this will not terminate, due to applicative ('apply') interpretation:
; (p) is evaluated BEFORE the body of test
(test 0 (p))
