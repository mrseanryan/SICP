#lang racket
(require sicp)
(require rackunit/chk)

(require "ex1.16.rkt")

(define (chk-fun fun)
  (chk
   (fun 1 0) 1
   (fun 2 0) 1
   (fun 10 0) 1

   (fun 1 2) 1
   (fun 2 2) 4
   (fun 10 2) 100

   (fun 1 3) 1
   (fun 2 3) 8
   (fun 10 3) 1000
   )
  )

(chk-fun basic-iter-expt)
(chk-fun fast-expt)
(chk-fun fast-expt-2)
