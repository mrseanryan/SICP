#lang racket

(require "ex1.28.search.rkt")
(require "utils-profiling-time.rkt")
                            
; profile code - repeating to avoid spurious results (e.g. due to CPU or disk contention)
(time-repeated-fun (lambda () (fast-prime? 97)) 1000 "fast-prime? - 97")

(define (profile-primes n [times 10])
  (time-repeated-fun (lambda () (search-for-primes n)) times (format "search-for-primes - ~a" n))
  )

(display "small numbers growing by 10\n")
(profile-primes 1000)
(profile-primes 10000)
(profile-primes 100000)
(profile-primes 1000000)

(display "_________________________\n")
(display "bigger numbers\n")
(profile-primes 1000000000 3) ; 1e9 = 50ms
(profile-primes 1000000000000000000 3) ; 1e18 = 100ms
(profile-primes 1000000000000000000000000000000000000 3) ; 1e36 = 200ms
(profile-primes 1000000000000000000000000000000000000000000000000000000000000000000000000 3) ; 1e72 = 1400ms

(display "logarithmic growth: 2 x digts -> 2 x duration\n")
(display " - on Acer tablet roughly holds true for 1e9..1e36\n")
(display " but 1e72 is 1e36 x 7: overhead of number size, and display?\n")
(display " for smaller numbers, factors other than the number size seem to hold (so, for smaller numbers, the number size does not matter)\n")
; ref: http://community.schemewiki.org/?sicp-ex-1.24
(display "  quote: operations on large integers (above the normal 32/64-bit limit) are not constant in time, but functions of the number's size*, as mentioned by torinmr.\n" )
