#lang racket
(require sicp)

(require "ex1.16.rkt")
(require "utils-profiling-time.rkt")

; ==========================================
; profiling tests (time taken)

(define (test-expt-basic)
  (basic-iter-expt 10 1000)
  )

(define (test-expt)
  (fast-expt 10 1000)
  )

(define (test-expt-2)
  (fast-expt-2 10 1000)
  )

; basic iter is really slow
(time-repeated-fun test-expt-basic 50 "basic iter")
(time-repeated-fun test-expt 50 "successive squaring iter")

; This one performs slightly faster!
(time-repeated-fun test-expt 100000 "successive squaring iter")
(time-repeated-fun test-expt-2 100000 "successive squaring iter - invariant quantity")
