#lang racket
(require sicp)
(require rackunit/chk)

(require "ex1.16.rkt")

(chk
 (my-expt 1 0) 1
 (my-expt 2 0) 1
 (my-expt 10 0) 1

 (my-expt 1 2) 1
 (my-expt 2 2) 4
 (my-expt 10 2) 100

 (my-expt 1 3) 1
 (my-expt 2 3) 8
 (my-expt 10 3) 1000

 )

