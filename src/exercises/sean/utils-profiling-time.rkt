#lang racket
(require sicp)

; ==========================================
; profiling tests (time taken)

(define (repeat-fun fun count result)
  (cond ((= count 0) 0)
        (else 
         (repeat-fun fun (- count 1) (fun) )
         )
        )
  )

(define (time-repeated-fun fun times description)
  (display (format "~a x ~a\n" description times))
  (time (repeat-fun fun times 0))
  )

(provide time-repeated-fun)
