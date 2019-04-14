#lang racket
(require sicp)

; __________________________
; gcd (Greatesr Common Divisor)

(define (gcd_ a b)
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
