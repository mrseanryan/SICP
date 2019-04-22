#lang racket
(require racket/trace)

(require "ex1.28.rkt")

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

(provide fast-prime? search-for-primes search-for-primes-count)
