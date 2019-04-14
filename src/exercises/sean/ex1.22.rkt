#lang racket
(require racket/trace)

(require "section-1.2.6.rkt")
(require "utils-define-sourced-proc.rkt")
(require "utils-profiling-time.rkt")

(define (prime-test n)
  (display n)
  (if (prime? n)
      (report-is-prime)
      (report-is-not-prime)
      )
  )

(define (report-is-prime)
  (display "* ")
  #t
  )

(define (report-is-not-prime)
  (display " ")
  #f
  )

(define (search-for-primes start [count-to-find 3])
  (search-for-primes-count (next-odd start) count-to-find)
  )

(define (next-odd n)
  (if (even? n)
      (+ n 1)
      n
      )
  )

(define-proc (search-for-primes-count start [count-to-find 3])
  (if (= count-to-find 0)
      #t
      (if (prime-test start) 
          (search-for-primes-count (+ start 2) (- count-to-find 1))
          (search-for-primes-count (+ start 2) count-to-find)
          )
      )
  )

; profile code - repeating to avoid spurious results
(time-repeated-fun (lambda () (prime? 97)) 1000 "prime? - 97")

(define (profile-primes n)
  (time-repeated-fun (lambda () (search-for-primes n)) 10 (format "search-for-primes - ~a" n))
  )

(trace search-for-primes)

(profile-primes 1000)
(profile-primes 10000)
(profile-primes 100000)
(profile-primes 1000000)

; dump code
search-for-primes-count
prime?
