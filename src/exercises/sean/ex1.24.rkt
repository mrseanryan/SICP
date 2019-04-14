#lang racket
(require racket/trace)

(require "section-1.2.6.rkt")
(require "utils-define-sourced-proc.rkt")
(require "utils-profiling-time.rkt")
                            
(define (prime-test n)
  (display n)
  (if (fast-prime? n)
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

; profile code - repeating to avoid spurious results (e.g. due to CPU or disk contention)
(time-repeated-fun (lambda () (fast-prime? 97)) 1000 "fast-prime? - 97")

(define (profile-primes n)
  (time-repeated-fun (lambda () (search-for-primes n)) 10 (format "search-for-primes - ~a" n))
  )

(trace search-for-primes)

(display "small numbers growing by 10\n")
(profile-primes 1000)
(profile-primes 10000)
(profile-primes 100000)
(profile-primes 1000000)

(display "bigger numbers\n")
(profile-primes 1000000000) ; 1e9
;(profile-primes 10000000000) ; 1e10 - too big for random
;(profile-primes 1e11) ;1e11 - too big for random

(display "note: 100000 x input increase -> 2 x duration\n")
(display "logarithmic growth: 2 x digts -> 2 x duration\n")
; ref: http://community.schemewiki.org/?sicp-ex-1.24
(display "  quote: operations on large integers (above the normal 32/64-bit limit) are not constant in time, but functions of the number's size*, as mentioned by torinmr.\n" )
;100000000000 612 - 10e11
;10000 357 - 10e4

; dump code
search-for-primes-count
prime?
