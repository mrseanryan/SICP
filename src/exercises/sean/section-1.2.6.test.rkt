#lang racket
(require rackunit/chk)

(require "section-1.2.6.rkt")
(require "utils-debug.rkt")

(chk
 (prime? 6) #f
 (prime? 17) #t
 (prime? 19) #t
 (prime? 20) #f
 (prime? 21) #f
 (prime? 23) #t
 )

; run and show the calling code:
(run+code (prime? 19))
; dump the source:
prime?
smallest-divisor
find-divisor
