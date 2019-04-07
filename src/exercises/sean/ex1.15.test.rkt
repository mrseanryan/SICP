#lang racket
(require sicp)
(require rackunit/chk)

(require "ex1.15.rkt")

(define (approx x)  
  (round  (* x 10))
  )

(chk
 (sine 0) 0
 (approx(sine 3)) (approx 0.1411)
 (approx(sine 10)) (approx -0.54402111088)

 ; only works for small angles
 ; (sine 45) (/ 1 (sqrt 2))
 ; (sine 90) 1
 )

