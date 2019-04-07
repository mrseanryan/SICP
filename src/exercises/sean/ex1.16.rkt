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

(provide fast-expt)


;(trace sine)
;(trace p)
;
;(sine 12.15)
