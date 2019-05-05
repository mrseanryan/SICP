#lang racket

(define (mult a b)
  (loop 0 a b))

(define (loop acc a b)
  (cond ((= b 0) acc)
        ((even? b) (loop acc (+ a a) (/ b 2)))
        (else (loop (+ acc a) a (- b 1)))))

(mult 4 7)
(mult 7 4)
