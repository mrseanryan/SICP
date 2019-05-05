#lang racket

(define (expt b n)
  (loop 1 b n))

(define (loop a b n)
  (cond ((= n 0) a)
        ((even? n) (loop a (* b b) (/ n 2)))
        (else (loop (* a b) b (- n 1)))))

(expt 3 5)
(expt 2 10)
