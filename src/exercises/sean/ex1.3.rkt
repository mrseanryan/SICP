#lang racket
(require sicp)

; solution 1
(display "solution 1\n")
(define (sum-of-squares-2 a b)
  (+ (square a) (square b)))

(define (square a)
  (* a a))

(define (sum-of-squares-3 a b c)
  (cond  ((and (>= a c) (>= b c)) (sum-of-squares-2 a b))
         ((and (>= a b) (>= c b)) (sum-of-squares-2 a c))
         (else (sum-of-squares-2 b c))))

(sum-of-squares-3 1 2 3)
(sum-of-squares-3 1 1 1)
(sum-of-squares-3 1 2 2)
(sum-of-squares-3 1 1 2)

; solution 2
(display "\nsolution 2\n")

; (define (max x y)
;   (if (> x y) x y))

(define (sum-of-squares-3-sol-2 x y z)
  (+
   (square (max x y))
   (square (max z (min x y)))))

(sum-of-squares-3-sol-2 1 2 3)
(sum-of-squares-3-sol-2 1 1 1)
(sum-of-squares-3-sol-2 1 2 2)
(sum-of-squares-3-sol-2 1 1 2)
