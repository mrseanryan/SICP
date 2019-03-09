
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
