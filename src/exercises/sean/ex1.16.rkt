#lang racket
(require sicp)
(require racket/trace)

(define (square x)
  (* x x)
  )

(define (fast-expt b n)
  (cond (( = n 0) 1)
        ( (even? n) (square (fast-expt b (/ n 2)  )  ) )
        (else (* b (fast-expt b (- n 1) )  ) )
        )
  )

 
(define (fast-expt-2 b n a)
  (cond (( = n 0) a)
        ( (even? n)
          ;(square (fast-expt-2 b (/ n 2)  )  )
          ; = B^2 ^ n/2
          (fast-expt-2  (square b) (/ n 2) a)
          )
        ; (else (* b (fast-expt b (- n 1) )  ) )
        (else (fast-expt-2 b (- n 1)  (* a b) ) )
        )
  )


(define (my-expt b n)
  (fast-expt-2 b n 1)
  )

(provide my-expt)


;(trace sine)
;(trace p)
;
;(sine 12.15)
