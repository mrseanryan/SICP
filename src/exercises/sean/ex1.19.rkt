#lang racket
(require sicp)

;_____________________________________
; fib via recursion

(define (fib-rec n)
  (fib-rec-iter 1 0 n)
  )

(define (fib-rec-iter a b count)
  (if (= 0 count) b
      (fib-rec-iter (+ a b) a (- count 1))
      )
  )

;_____________________________________
; fib via transform

(define (transform-p p q a b)
  ; p = (bq + aq + ap)
  (+ (* b q) (* a q) (* a p) )
  )

(define (transform-q p q a b)
  ; q = (bp + aq)
  (+ (* b p) (* a q) )
  )

; from paper expansion of Tpq twice (for b which is simpler):
(define (p2 p q a b)
  (+ (* p p ) (* q q) )
  )

(define (q2 p q a b)
  (+
   (* 2 p q) (* q q) )
  )

; from the book p.47:
(define (fib n)
  (fib-iter 1 0 0 1 n)
  )

(define (fib-iter a b p q count)
  (cond ((= count 0) b)
        ( (even? count)
          (fib-iter a
                    b
                    (p2 p q a b)
                    (q2 p q a b)
                    (/ count 2)
                    ))
        (else    (fib-iter
                  (+ (* b q) (* a q) (* a p))
                  (+ (* b p) (* a q))
                  p
                  q
                  (- count 1)
                  ))

          
        )
  )


(provide fib fib-rec)
