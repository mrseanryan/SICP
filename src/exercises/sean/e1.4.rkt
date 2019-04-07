#lang racket
(require sicp)

(define
  (a-plus-abs-b a b)
  ((if (> b 0) + -) a b))

(a-plus-abs-b 1 1)
(a-plus-abs-b 1 0)
(a-plus-abs-b 1 -1)
