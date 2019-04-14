#lang racket
(require sicp)

(require "utils-define-sourced-proc.rkt")

; __________________________
; gcd (Greatesr Common Divisor)

; define-proc means the function source can be dumped

(define-proc (gcd_ a b)
  (if (= b 0) a
      (gcd_ b (remainder a b))
      )
  )

; __________________________
; phi defined

(define phi
  (/ (+ 1 (sqrt 5) )
     2
     )
  )

(provide gcd_ phi)
