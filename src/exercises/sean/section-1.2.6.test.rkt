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
 ; bigger numbers
 (fun 1000000000) #f ;1e9
 (fun 10000000000) #f ;1e10
 (fun 100000000000) #f ;1e11
 )
)

(chk-fun prime?)
(chk-fun fast-prime?)

; run and show the calling code:
(run+code (prime? 19))
(run+code (fast-prime? 19 10))

(fast-prime? 10000000000) ; breaks random

; dump the source:
prime?
smallest-divisor
find-divisor

fast-prime?
