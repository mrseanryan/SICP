#lang racket
(require sicp)
(require racket/trace)

; f(n) = n if n<3
; f(n) = f(n-1) + 2f(n-2) + 3f(n-3) if n>=3

(display "_____________________________\n")
(display "recursive \n");

(define (fun n)
  (if (< n 3) n 
      (+
       (fun (- n 1))
       (* 2  (fun (- n 2)) )
       (* 3 (fun (- n 3)) )
       )
      )
  )

(define (test-fun func n)
  (display (format "fun ~s = ~s\n" n (func n)))
  )

(trace fun)

(test-fun fun 0)
(test-fun fun 1)
(test-fun fun 2)
(test-fun fun 3)
(test-fun fun 4)
(test-fun fun 5)
(test-fun fun 6)

(display "_____________________________\n")
(display "iterative - counting down\n");

(define (fun-iter n)
  (fun-iter-inner 0 1 2 n)
  )

(define (fun-iter-inner n3 n2 n1 count)
  (if (= count 0) n3
      (fun-iter-inner n2 n1 (+ n1 (* 2 n2) (* 3 n3) ) (- count 1) ) 
      )
  )

(trace fun-iter-inner)

(test-fun fun-iter 0)
(test-fun fun-iter 1)
(test-fun fun-iter 2)
(test-fun fun-iter 3)
(test-fun fun-iter 4)
(test-fun fun-iter 5)
(test-fun fun-iter 6)

(display "_____________________________\n")
(display "iterative - counting up\n");

(define (fun-iter-up n)

  (define (fun-iter-up-inner n-1 n-2 n-3 count)
    (define (fun-iter-up-n)
      (+ n-1 (* 2 n-2) (* 3 n-3) )
      )

    (if (= count n) (fun-iter-up-n)
        ( fun-iter-up-inner (fun-iter-up-n) n-1 n-2 (+ count 1) )
        )
    )

  (trace fun-iter-up-inner)
  
  (if (< n 3)
      n
      (fun-iter-up-inner 2 1 0 3) ; start at 3, inc up to n        
      )
  )


(test-fun fun-iter-up 0)
(test-fun fun-iter-up 1)
(test-fun fun-iter-up 2)
(test-fun fun-iter-up 3)
(test-fun fun-iter-up 4)
(test-fun fun-iter-up 5)
(test-fun fun-iter-up 6)
