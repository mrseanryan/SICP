#lang racket
(require sicp)
(require racket/trace)

(display "_____________________________\n")
(display "count-change \n");


(define (count-change amount)
  (cc amount 5))

(define (cc amount kinds-of-coins)
  (cond ( (= amount 0) 1)
        ((or (< amount 0) (= kinds-of-coins 0) )  0)
        (else (+ (cc amount
                     (- kinds-of-coins 1))
                 (cc (- amount (first-denomination kinds-of-coins)
                        )
                     kinds-of-coins
                     )
                 )

              )

        )
  )

(define (first-denomination kinds-of-coins)
  (cond ((= kinds-of-coins 1) 1)
        ((= kinds-of-coins 2) 5)
        ((= kinds-of-coins 3) 10)
        ((= kinds-of-coins 4) 25)
        ((= kinds-of-coins 5) 50)
        )
  )

;(trace count-change)
;(trace cc)

(provide count-change cc)

; TODO optimize - p.41 -> via memoization - ex 3.27 p. 272

; Orders of Growth:
; ref: http://community.schemewiki.org/?sicp-ex-1.14
;
; Space required (maximum height of the call tree) grows linearly with the amount, 
; as it is determined by the number of times the smallest denomination divides into the amount. i.e. O(a)
; Time required (number of operations) grows in relation to O(a^n). 
; i.e. O(a * a * a * ...) since the 2nd branch is O(a), and the first branch is called O(n) times.
;
; count-change space order of growth:
; O(n) because max depth is n
;
; count-change time order of growth:
; cc(n, 1) = O(n)
; cc(n, 2) = cc(n, 1) + cc(n-5, 2)
; each 2. step is O(n) and there are roughly n/5 such steps
; so we have O(n^2)
; by analogue we get O(n^k) (k currencies) for cc(n, k)
