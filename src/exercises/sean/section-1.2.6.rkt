#lang racket
(require sicp)

(require "utils-define-sourced-proc.rkt")

; __________________________________
; Searching for divisors

(define-proc (smallest-divisor n)
  (find-divisor n 2))

(define-proc (find-divisor n test-divisor)
  (cond ((> (square test-divisor) n) n)
        ((divides? test-divisor n) test-divisor)
        (else (find-divisor n (+ test-divisor 1) ))
        )
  )

(define (square x)
  (* x x)
  )

(define (divides? a b)
  (= (remainder b a) 0)
  )

(define-proc (prime? n)
  (= n (smallest-divisor n)
     )
  )

(provide smallest-divisor prime? find-divisor)

