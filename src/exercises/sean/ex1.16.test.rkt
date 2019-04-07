#lang racket
(require sicp)
(require rackunit/chk)

(require "ex1.16.rkt")

(chk
 (fast-expt 1 0) 1
 (fast-expt 2 0) 1
 (fast-expt 10 0) 1

 (fast-expt 1 2) 1
 (fast-expt 2 2) 4
 (fast-expt 10 2) 100

 (fast-expt 1 3) 1
 (fast-expt 2 3) 8
 (fast-expt 10 3) 1000

 )

