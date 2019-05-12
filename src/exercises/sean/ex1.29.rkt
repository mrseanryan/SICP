#lang racket
(require racket/trace)

(define (simpsons-integration f a b n)
  (define (h)
    (/ (- b a) n)
    )
  
  (define (y k)
    (f (+ a (* k (h))))
    )

  ; tail-recursive (add-for-k call is at top level) with accumulator
  (define (add-for-k k accum)
    (if (= k n) (+ accum (calc-y-term k))
        (add-for-k (+ k 1) (+ accum (calc-y-term k)))
        )    
    )
  
  (define (calc-y-term k)
    (cond
      ((or (= k 0) (= k n)) (y k))
      (else (* (calc-y-coeff k) (y k)) )      
      )    
    )

  (define (calc-y-coeff k)
    (define (odd)
      (= (remainder k 2) 1)
      )
    (if (odd) 4
        2
        )
    )
  
  (* (/ (h) 3.0) (add-for-k 0 0) )
  )

(define (cube x)
  (* x x x)
  )

(display "expected: 0.25\n")
(simpsons-integration cube 0 1 100)
(simpsons-integration cube 0 1 1000)
