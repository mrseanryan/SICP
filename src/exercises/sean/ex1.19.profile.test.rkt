#lang racket
(require sicp)

(require "ex1.19.rkt")
(require "utils-profiling-time.rkt")

; ==========================================
; profiling tests (time taken)

(define (test-fun fun)
  (fun 80)
  )

(define (test-fib-rec)
  (test-fun fib-rec)
  )

(define (test-fib)
  (test-fun fib)
  )

(time-repeated-fun test-fib-rec 10000 "basic fib - recursive")
(time-repeated-fun test-fib 10000 "fib - iterative")
