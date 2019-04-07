#lang racket
(require sicp)
(require racket/trace)

(require "ex1.13.rkt")

(display "_____________________________\n")
(display "Prove Fib(n) is the closest integer to phi^n/sqrt(5) \n");

; Induction: f(0), f(n), f(n+1) -> proven for all n natural numbers.

;___________________________
; test

(define (test-fun name func n)
  (display (format "~a(~a) = ~a\n" name n (func n)))
  )

(define (fib-test n)
  (test-fun "fib" fib n)
  (test-fun "fib-via-phi" fib-via-phi n)
  )

;(trace fun)

; __________________________
; INDUCTION

; n = 0
(fib-test 0)

; n = 1
(fib-test 1)
; n = 2
(fib-test 2)
(fib-test 3)
(fib-test 4)
(fib-test 5)
(fib-test 6)

(display "__________________________\n")
(display "Experiments with golden ratio (phi)\n")

(display (format "phi^2 = ~a = phi + 1 = ~a\n" (* phi phi) (+ 1 phi) ))

(define (phi-via-fib n)
  (* (sqrt 5) (fib n))
  )

(define (phi-to-pow n)
  (pow phi n)
  )

(define (phi-test n)
  (test-fun "phi-to-pow" phi-to-pow n)
  (test-fun "phi-via-fib" phi-via-fib n)
  )

(phi-test 1)
(phi-test 2)
(phi-test 3)
(phi-test 4)
(phi-test 5)
(phi-test 6)
