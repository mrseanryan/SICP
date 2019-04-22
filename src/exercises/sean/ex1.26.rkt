#lang racket

; Exercise 1.26: 
; explicit multiplication, rather than calling square:
;
; calls to expmod are roughly doubled -> much less efficient
;
; O(log n) -> 2 x O(log n) == O(n)

(define (expmod base exp m)
  (cond ((= exp 0) 1)
        ((even? exp)
         (remainder (* (expmod base (/ exp 2) m)
                       (expmod base (/ exp 2) m))
                    m))
        (else
         (remainder (* base
                       (expmod base (- exp 1) m))
                    m))))

