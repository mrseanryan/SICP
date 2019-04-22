#lang racket

(require "section-1.2.6.rkt")
(require "ex1.25.rkt")
(require "utils-profiling-time.rkt")
                            
; profile code - repeating to avoid spurious results (e.g. due to CPU or disk contention)
(time-repeated-fun (lambda () (fast-prime? 97)) 1000 "fast-prime? - 97")

(define (profile-primes n [times 10])
  (time-repeated-fun (lambda () (search-for-primes n)) times (format "search-for-primes - ~a" n))
  )

(display "small numbers growing by 10\n")
(profile-primes 1000)
(profile-primes 10000)

(display "naive version of expmod is MUCH slower - even 10^5 is very slow (on Acer tablet)\n")
(display " - whereas with fast expmod, can easily compute ; 10^72")
