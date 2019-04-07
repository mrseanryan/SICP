#lang racket
(require sicp)
(require rackunit/chk)

(require "ex1.14.rkt")

(chk
 1 1
 (count-change 0) 1
 (count-change 11) 4
 (count-change 100) 292
 )

