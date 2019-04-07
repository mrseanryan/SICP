#lang racket
(require sicp)

(require "ex1.17-18.rkt")
(require "utils-profiling-time.rkt")

; ==========================================
; profiling tests (time taken)

(define (test-fun fun)
  (fun 10000 10000)
  )

(define (test-basic-iter-mult)
  (test-fun basic-iter-mult)
  )

(define (test-iter-mult)
  (test-fun iter-mult)
  )

(define (test-iter-mult-invariant)
  (test-fun iter-mult-invariant)
  )

; basic iter - much slower (100 times)
(time-repeated-fun test-basic-iter-mult 1000 "basic iter")
(time-repeated-fun test-iter-mult 1000 "iter with less recursion")

; this is the fastest:
(time-repeated-fun test-iter-mult 10000 "iter with less recursion")
(time-repeated-fun test-iter-mult-invariant 10000 "iter with less recursion - invariant quantity")
