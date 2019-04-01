#lang racket
(require racket/trace)

(display "exercise 1.9 - recursion vs iteration\n")

(define (inc a )
  (display (format "inc ~s\n" a))
  (+ a 1)
  )

(define (dec a )
  (display (format "dec ~s\n" a))
  (- a 1)
  )

(define (p1 a b)
  (display (format "p1 ~s ~s\n" a b))
  (if (= a 0)
      b
      (inc (p1 (dec a) b))
      )
  )

(define (p2 a b)
  (display (format "p2 ~s ~s\n" a b))
  (if (= a 0)
      b
      (p2 (dec a) (inc b)))
  )


; The easiest way to spot that the first process is recursive (without writing out the substitution)
; is to note that the "+" procedure calls itself at the end while nested in another expression
; the second calls itself, but as the top expression.

; with trace, can see the depth of the call stack.

(trace inc)
(trace dec)
(trace p1)
(trace p2)

(display "recursive\n")
(p1 4 5)

(display "iterative\n")
(p2 4 5)

