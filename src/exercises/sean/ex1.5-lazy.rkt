#lang racket
(require sicp)

(define (p) (p))

(define (test x fun-y)
  (if (= x 0)
    0
    (fun-y) ))

; note this WILL terminate, even with applicative ('apply') interpretation:
; p is a function passed by value, and is 'lazily' evaluated
(test 0 p)

; this will NOT terminate
;(test 1 p)
