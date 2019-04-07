#lang racket
(require sicp)
(require rackunit/chk)

(require "ex1.19.rkt")

(define (chk-fun fun)
  (chk
   (fun 0) 0
   (fun 1) 1
   (fun 2) 1
   (fun 3) 2
   (fun 4) 3
   (fun 5) 5
   (fun 6) 8
   (fun 7) 13
   (fun 8) 21
   )
  )

(chk-fun fib-rec)
(chk-fun fib-t)
