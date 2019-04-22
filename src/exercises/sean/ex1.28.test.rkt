#lang racket
(require rackunit/chk)

(require "ex1.28.rkt")

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
   ; but they fool the Fermat Test. 
   ; With the Rabin-Miller check, we can handle that.
   (fun 561) #f
   (fun 1105) #f
   (fun 1729) #f
   (fun 2465) #f
   (fun 2821) #f
   (fun 6601) #f
   ; Bigger Prime numbers
   (fun 1009) #t
   (fun 1019) #t
   (fun 1000003) #t
   )
  )

(chk-is-prime fast-prime?)
