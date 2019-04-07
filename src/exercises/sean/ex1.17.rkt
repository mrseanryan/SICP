#lang racket
(require sicp)
(require racket/trace)

(define (double x)
  (* x 2)
  )

(define (halve x)
  (/ x 2)
  )

(define (even x)
  (= (/ x 2) (round (/ x 2)) )
  )

; ___________________________________________
; basic iter solution
(define (basic-iter-mult b n)
  (define (basic-iter-mult-inner b_ counter result)
    (if (= counter 0)
        result
        (basic-iter-mult-inner b_
                               (- counter 1)
                               (+ b_ result)
                               )
        )
    )

  (basic-iter-mult-inner b n 0)
  )

; ___________________________________________
; iter solution - logarithmic number of steps

(define (iter-mult a b)
  (cond ((= b 0) 0)
        ((= b 1) a)
        (  (even b) (double (iter-mult a (halve b))) )
        (else (+ a (iter-mult a (- b 1) ) ) )       
        )
  )

(provide basic-iter-mult iter-mult)
