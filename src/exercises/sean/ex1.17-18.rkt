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
; 1.17 basic iter solution
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
; 1.17 iter solution - logarithmic number of steps

(define (iter-mult a b)
  (cond ((= b 0) 0)
        (  (even b) (double (iter-mult a (halve b))) )
        (else (+ a (iter-mult a (- b 1) ) ) )       
        )
  )

; ___________________________________________
; 1.18 iter solution - logarithmic number of steps - invariant quantity

(define (iter-mult-inv a b c)
  (cond ((= b 0) c)
        (  (even b) (iter-mult-inv (double a) (halve b) c) )
        (else (iter-mult-inv a (- b 1) (+ c a) ) )    
        )
  )

(define (iter-mult-invariant a b)
  (iter-mult-inv a b 0)
  )

(provide basic-iter-mult iter-mult iter-mult-invariant)
