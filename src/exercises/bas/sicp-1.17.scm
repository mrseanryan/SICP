#lang racket

(define (mult a b)
  (cond ((= b 0) 0)
        ((even? b) (mult (+ a a) (/ b 2)))
        (else (+ a (mult a (- b 1))))))

(mult 4 7)
(mult 7 4)
