#lang racket
(require sicp)

(require "ex1.16.rkt")
(require "utils-profiling-time.rkt")

; ==========================================
; profiling tests (time taken)

(define (test-expt-basic)
  (basic-iter-expt 10 10000)
  )

(define (test-expt-10000)
  (fast-expt 10 10000)
  )

(define (test-expt)
  (fast-expt 10000 20000)
  )

(define (test-expt-2)
  (fast-expt-2 10000 20000)
  )

; basic iter is really slow
(time-repeated-fun test-expt-basic 50 "basic iter")
(time-repeated-fun test-expt-10000 50 "successive squaring iter")

; even with bigger exponents, the successive-squaring performs the best
(time-repeated-fun test-expt 10000 "successive squaring iter")
(time-repeated-fun test-expt-2 10000 "successive squaring iter - invariant quantity")
