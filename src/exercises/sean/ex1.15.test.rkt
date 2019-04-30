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

 ; works, not only for small angles
 ; (sine 0.7853980) ; 45 deg = (/ 1 (sqrt 2))
 (approx(sine 0.7853980)) (approx (/ 1 (sqrt 2)))
 
 ; (sine 1.57); 1 = 90 deg
 (approx (sine 1.57)) (approx 1.0)
 
 ; (sine 3.14) 0 (pi = 180deg)
 (approx (sine 3.14)) (approx 0.0)
 )

