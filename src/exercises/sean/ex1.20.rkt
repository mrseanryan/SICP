#lang racket
(require sicp)
(require racket/trace)

(require "utils-debug.rkt")

; __________________________
; phi function

(define phi
  (/ (+ 1 (sqrt 5) )
     2
     )
  )

(display "estimating steps k for (gcd 206 40)\n")

(run+code 
 (/ ( log (* 40 (sqrt 5))  )
    (log phi) )
 )


(display "manual esimate for appicative order: k = 4\n")
(display "manual esimate for normal order: k = 7\n")
