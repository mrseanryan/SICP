#lang racket
(require sicp)

(require "ex1.19.rkt")
(require "ex1.13.rkt")

(require "utils-profiling-time.rkt")

; ==========================================
; profiling tests (time taken)

(define (test-fun fun)
  (fun 80)
  )

(define (test-fib-ex1-13)
  (test-fun fib)
  )

(define (test-fib-via-phi)
  (test-fun fib-via-phi)
  )

(define (test-fib-rec)
  (test-fun fib-rec)
  )

(define (test-fib-t)
  (test-fun fib-t)
  )

; fib-via-phi is actually slower than the basic recursive fib!
(time-repeated-fun test-fib-via-phi 10000 "fib - ex1.13 - via phi")
(time-repeated-fun test-fib-ex1-13 10000 "basic fib - ex1.13")

(time-repeated-fun test-fib-rec 10000 "basic fib - recursive (same as e1.13)")
(time-repeated-fun test-fib-t 10000 "fib - iterative")
