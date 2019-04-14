#lang racket
(require rackunit/chk)

(require "section-1.2.6.rkt")
(require "utils-debug.rkt")

(define (chk-fun fun)
(chk
 (fun 6) #f
 (fun 17) #t
 (fun 19) #t
 (fun 20) #f
 (fun 21) #f
 (fun 23) #t
 )
)

(chk-fun prime?)
(chk-fun fast-prime?)

; run and show the calling code:
(run+code (prime? 19))
(run+code (fast-prime? 19 10))

; dump the source:
prime?
smallest-divisor
find-divisor

fast-prime?
