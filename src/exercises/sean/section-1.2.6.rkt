#lang racket
(#%require (lib "27.ss" "srfi")) ; for random-integer to get rands bigger than about 4e9

(require "utils-define-sourced-proc.rkt")

; __________________________________
; Searching for divisors

(define-proc (smallest-divisor n)
  (find-divisor n 2))

(define-proc (find-divisor n test-divisor)
  (cond ((> (square test-divisor) n) n)
        ((divides? test-divisor n) test-divisor)
        (else (find-divisor n (+ test-divisor 1) ))
        )
  )

(define (square x)
  (* x x)
  )

(define (divides? a b)
  (= (remainder b a) 0)
  )

(define-proc (prime? n [smallest-divisor_ smallest-divisor])
  (= n (smallest-divisor_ n)
     )
  )

; __________________________________
; The Fermat Test (Fermat's Little Theorem)

; like 'rem base^exp m', using successive squaring for efficiency
(define (expmod base exp m  )
  (cond ( (= exp 0) 1 )
        ( (even? exp) ( remainder ( square (expmod base (/ exp 2) m) ) m  ) )
        (else (remainder (* base (expmod base (- exp 1) m) ) m )  )
        )
  )

(define (fermat-test n)
  (define (try-it a)
    ; like 'rem a^n n'
    (= (expmod a n n) a)
    )

  ; rand 1..n-1
  ; note: random breaks if param > 4294967087 (4e9)
  (try-it (+ 1 (random-integer (- n 1) ) ) )
  )

(define-proc (fast-prime? n [times 10])
  (cond ((= times 0) true)
        ((fermat-test n) (fast-prime? n (- times 1)) )
        (else false)
        )
  )

(provide smallest-divisor prime? find-divisor fast-prime?)
