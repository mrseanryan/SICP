#lang racket
(require sicp)
(require rackunit/chk)

(require "ex1.17.rkt")

(define (chk-fun fun)
  (chk
   (fun 1 0) 0
   (fun 2 0) 0
   (fun 10 0) 0

   (fun 1 2) 2
   (fun 2 2) 4
   (fun 10 2) 20

   (fun 1 3) 3
   (fun 2 3) 6
   (fun 10 3) 30
   )
  )

(chk-fun basic-iter-mult)
(chk-fun iter-mult)
