#lang racket
(require racket/trace)


(define (cube x)
  (* x x x)
  )

(display "expected integral (cube 0..1): 0.25\n")

(define (error r)
  (abs (- r 0.25))
  )

;________________________________________
(display "integral - error\n")

(define (sum term a next b)
  (if (> a b)
      0
      (+ (term a)
         (sum term (next a) next b)
         )
      )
  )

(define (integral f a b dx)
  (define (add-dx x) (+ x dx))
  (* (sum f (+ a (/ dx 2.0)) add-dx b)
     dx)
  )

(error (integral cube 0 1 0.01))
(error (integral cube 0 1 0.001))

;________________________________________
(display "simpsons-integration - error\n")

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

(error (simpsons-integration cube 0 1 100))
(error (simpsons-integration cube 0 1 1000))
