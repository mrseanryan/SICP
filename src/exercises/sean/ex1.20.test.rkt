#lang racket
(require sicp)
(require rackunit/chk)

(require "ex1.20.rkt")
(require "utils-debug.rkt")

; __________________________
; gcd (Greates Common Divisor)

(chk
 (gcd_ 9 6) 3
 (gcd_ 48 6) 6
 (gcd_ 206 40) 2
 )

; run and show the calling code:
(run+code (gcd_ 206 40))
; dump the source:
gcd_

; __________________________
; estimating steps required

(display "estimating steps k for (gcd 206 40)\n")

(run+code 
 (/ ( log (* 40 (sqrt 5))  )
    (log phi) )
 )


(display "manual esimate for appicative order: k = 4\n")
(display "manual esimate for normal order: k = 7\n")
