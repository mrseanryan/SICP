#lang racket

(require "section-1.2.6.rkt")
(require "utils-debug.rkt")

; run and show the calling code:
(run+code (smallest-divisor 199))
(run+code (smallest-divisor 1999))
(run+code (smallest-divisor 19999))

; dump the source:
smallest-divisor
