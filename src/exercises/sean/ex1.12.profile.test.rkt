#lang racket
(require sicp)

(require "ex1.12.rkt")
(require "utils-profiling-time.rkt")

; ==========================================
; profiling tests (time taken)

(define (minimal-output func n pascal-cell-fun)
  (for ([x (in-range 0 n)])
    (for ([y (in-range 0 (add1 x))])
      (pascal-cell-fun x y))
    )
  )

(define (test-pascal-fun pascal-fun n)
  (test-pascal pascal-fun minimal-output n)
  )

(define (profile-pascal pascal-fun description)
  (time-repeated-fun (lambda () (test-pascal-fun pascal-fun 20) ) 10 description)
  )

; recursive: 2.2s on i7 laptop
(profile-pascal pascal-recursive "recursive")

; tail-recursive: 0.01s on i7 laptop
(profile-pascal pascal-factorial "tail-recursive")
