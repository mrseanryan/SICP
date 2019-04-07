#lang racket
(require sicp)
(require racket/trace)

(define (square x)
  (* x x)
  )

; ___________________________________________
; basic iter solution
(define (basic-iter-expt b n)
  (define (basic-iter-expt-inner b_ counter product)
    (if (= counter 0)
        product
        (basic-iter-expt-inner b_
                               (- counter 1)
                               (* b_ product)
                               )
        )
    )

  (basic-iter-expt-inner b n 1)
  )

; ___________________________________________
; fast iter solution - successive squares
(define (fast-expt b n)
  (cond (( = n 0) 1)
        ( (even? n) (square (fast-expt b (/ n 2)  )  ) )
        (else (* b (fast-expt b (- n 1) )  ) )
        )
  )

; ___________________________________________
; fast iter solution 2 - successive squares with invariant quantity
(define (fast-expt-2-inner b n a)
  (cond (( = n 0) a)
        ( (even? n)
          ;(square (fast-expt-2 b (/ n 2)  )  )
          ; = B^2 ^ n/2
          (fast-expt-2-inner  (square b) (/ n 2) a)
          )
        ; (else (* b (fast-expt b (- n 1) )  ) )
        (else (fast-expt-2-inner b (- n 1)  (* a b) ) )
        )
  )

(define (fast-expt-2 b n)
  (fast-expt-2-inner b n 1)
  )

(provide basic-iter-expt fast-expt fast-expt-2)
