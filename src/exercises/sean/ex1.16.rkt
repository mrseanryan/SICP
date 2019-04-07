#lang racket
(require sicp)
(require racket/trace)

(define (square x)
  (* x x)
  )

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

(define (fast-expt b n)
  (cond (( = n 0) 1)
        ( (even? n) (square (fast-expt b (/ n 2)  )  ) )
        (else (* b (fast-expt b (- n 1) )  ) )
        )
  )

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

(define (my-expt b n)
  (fast-expt-2 b n)
  )

(provide my-expt)

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

(define (test-expt-basic)
  (basic-iter-expt 10 1000)
  )

(define (test-expt)
  (fast-expt 10 1000)
  )

(define (test-expt-2)
  (fast-expt-2 10 1000)
  )

; basic iter is really slow
(time-repeated-fun test-expt-basic 50 "basic iter")
(time-repeated-fun test-expt 50 "successive squaring iter")

; This one performs slightly faster!
(time-repeated-fun test-expt 100000 "successive squaring iter")
(time-repeated-fun test-expt-2 100000 "successive squaring iter - invariant quantity")
