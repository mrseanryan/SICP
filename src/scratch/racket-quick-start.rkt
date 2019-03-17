#lang slideshow

(define (square n)
  (filled-rectangle n n))

(define c (circle 10 #:border-color "red"))
(define r (rectangle 10 20))
(define s (square 15))

(hc-append 10 c s r s c )
