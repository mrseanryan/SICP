#lang racket
(#%require (lib "27.ss" "srfi")) ; for random-integer to get rands bigger than about 4e9
(require racket/trace)

(require "section-1.2.6.rkt")
(require "ex1.24.rkt")
(require "utils-profiling-time.rkt")

; for fast-expt
(require "ex1.16.rkt")

; __________________________________
; The Fermat Test (Fermat's Little Theorem)

; naive implementation of expmod
; MUCH slower!
(define (expmod-naive base exp m)
    (remainder (fast-expt base exp) m))

(define (fermat-test n)
  (define (try-it a)
    ; like 'rem a^n n'
    (= (expmod-naive a n n) a)
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

; search for primes

                            
(define (prime-test? n)
  (if (fast-prime? n)
      (report-is-prime n)
      (report-is-not-prime)
      )
  )

(define (report-is-prime n)
  (display (format "~a* " n))
  #t
  )

(define (report-is-not-prime)
  #f
  )

(define (search-for-primes start [count-to-find 3])
  (search-for-primes-count (next-odd start) count-to-find)
  )

(trace search-for-primes)

(define (next-odd n)
  (if (even? n)
      (+ n 1)
      n
      )
  )

(define (search-for-primes-count start [count-to-find 3])
  (if (= count-to-find 0)
      #t
      (if (prime-test? start) 
          (search-for-primes-count (+ start 2) (- count-to-find 1))
          (search-for-primes-count (+ start 2) count-to-find)
          )
      )
  )

; dump code
search-for-primes-count
fast-prime?

(provide search-for-primes)
