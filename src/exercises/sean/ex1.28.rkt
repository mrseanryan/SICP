#lang racket
(#%require (lib "27.ss" "srfi")) ; for random-integer to get rands bigger than about 4e9
(require racket/trace)

; Exercise 1.28: One variant of the Fermat test that cannot
; be fooled is called the Miller-Rabin test

; Modify the expmod procedure
; to signal if it discovers a nontrivial square root
; of 1, and use this to implement the Miller-Rabin test with
; a procedure analogous to fermat-test.
; Check your procedure by testing various known primes and non-primes.
; Hint: One convenient way to make expmod signal is to have it return 0.

; A “nontrivial square root of 1 modulo n,”
; = a number not equal to 1 or n - 1 whose square is equal to '1 modulo n'
; so b^2 / n has remainder 1
(define (is-non-trivial-root? b n)
  (cond ((= b 1) #f)
        ((= b (- n 1)) #f)
        ( (= (remainder (square b) n) 1) #t)
        (else #f)
        )
  )

(define (square x)
  (* x x)
  )

; __________________________________
; The Fermat Test (Fermat's Little Theorem) modified to use the Miller-Rabin test to detect Carmichael numbers ('false primes')

; like 'rem base^exp m', using successive squaring for efficiency
(define (expmod base exp m)
  (define (miller-or-remainder exp-calc)
    (cond ((is-non-trivial-root? exp-calc m) 0)
          (else (remainder (square exp-calc) m))
          )
    )
  
  (cond ( (= exp 0) 1 )
        ((even? exp) (miller-or-remainder (expmod base (/ exp 2) m) ) )
        (else (remainder (* base (expmod base (- exp 1) m) ) m ) )
        )
  )

(define (fermat-test n)
  (define (try-it a)
    ; expmod is like 'rem a^n n'
    (try-it- a (expmod a n n))
    )

  (define (try-it- a exp)
    (cond ((= exp 0) #f)
          (else  (= exp a))
          )
    )
  
  ; rand 1..n-1
  ; note: random breaks if param > 4294967087 (4e9)
  (try-it (+ 1 (random-integer (- n 1) ) ) )
  )

(define (fast-prime? n [times 10])
  (cond ((= times 0) true)
        ((fermat-test n) (fast-prime? n (- times 1)) )
        (else false)
        )
  )

(provide fast-prime?)
