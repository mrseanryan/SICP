#lang racket
(require rackunit/chk)
(require racket/trace)

(require "section-1.2.6.rkt")
(require "ex1.24.rkt")

; for fast-expt
(require "ex1.16.rkt")

; Exercise 1.27: Demonstrate that the Carmichael numbers
; listed in Footnote 1.47 really do fool the Fermat test. That is,
; write a procedure that takes an integer n and tests whether
; a^n is congruent to a modulo n for every a < n, and try your
; procedure on the given Carmichael numbers.

; footnote 1.47
; Numbers that fool the Fermat test are called Carmichael numbers, and little is
; known about them other than that they are extremely rare. There are 255 Carmichael
; numbers below 100,000,000. The smallest few are 561, 1105, 1729, 2465, 2821, and 6601
(define (chk-is-prime fun)
  (chk
   (fun 3) #t
   (fun 17) #t
   (fun 21) #f
   ; Carmichael numbers: all of these are NOT actually prime,
   ; so the #t is only because Fermat Test is being fooled.
   (fun 561) #t
   (fun 1105) #t
   (fun 1729) #t
   (fun 2465) #t
   (fun 2821) #t
   (fun 6601) #t 
   )
  )

(chk-is-prime fast-prime?)

; Check if number is a Carmichael number.
(define (is-carmichael? n)
  (is-carmichael-? n 2)
  )

; Check if number is a Carmichael number.
;
; Takes an integer n and tests whether
; a^n is congruent to a modulo n for every a < n
(define (is-carmichael-? n a)
  (cond ((= n a) #t) 
        ((is-congruent? a n) (is-carmichael-? n (+ a 1)))
        (else #f)
        )
  )

; tests if remainder of a^n mod n == a
(define (is-congruent? a n)
  (= (remainder (fast-expt a n) n) a)
  )

;(trace is-carmichael?)
;(trace is-carmichael-?)
;(trace is-congruent?)

(define (chk-is-carmichael fun)
  (chk
   (fun 3) #t
   (fun 17) #t 
   (fun 21) #f
   ; Carmichael numbers: (all of these are NOT actually prime)
   (fun 561) #t
   (fun 1105) #t
   (fun 1729) #t
   (fun 2465) #t
   (fun 2821) #t
   (fun 6601) #t 
   )
  )

(chk-is-carmichael is-carmichael?)
