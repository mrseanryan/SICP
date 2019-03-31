#lang racket
(require sicp)
(require racket/trace)

(display "_____________________________\n")
(display "Prove Fib(n) is the closest integer to theta^n//sqrt(5) \n");

; Induction: f(0), f(n), f(n+1) -> proven for all n natural numbers.




(define (fib n)
  (fib-iter 1 0 n)
  )

(define (fib-iter a b count)
  (if (= 0 count) b
      (fib-iter (+ a b) a (- count 1))
      )
  )


(define (test-fun func n)
  (display (format "fib(~a) = ~a\n" n (func n)))
  )
  

;(trace fun)

(test-fun fib 1)
(test-fun fib 2)
(test-fun fib 3)
(test-fun fib 4)
(test-fun fib 5)
(test-fun fib 6)
