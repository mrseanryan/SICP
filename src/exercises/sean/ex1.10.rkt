#lang slideshow
(require racket/trace)
(require slideshow/code)

(require "utils-debug.rkt")

(display "exercise 1.10 - output of a complex function\n")

; Ackermann's function
(define (A x y)
  (cond  (  (= y 0) 0 )
         ( (= x 0) (* 2 y))
         ( (= y 1) 2 )
         ( else (A (- x 1) (A x ( - y 1 ))
                   )
                )
         )
  )

(trace A)

(run+code (A 1 10))
(run+code (A 2 4))
(run+code (A 3 3))

; 2 * n
(define (f n) (A 0 n))

; 2 ^ n
(define (g n) (A 1 n))

; 2^2 (repeated n times), h(0) = 0
;
; h(1) -> 2
; h(2) -> 2^2 = 4
; h(3) -> 2^(2^2) = 2 ^ 4 = 16
; h(4) -> 2^(2^(2^2)) = 2 ^ 16 = 65536
;
(define (h n) (A 2 n))

; 5 n^2
(define (k n) (* 5 n n))

(trace f g h k)

(run+code (f 1))
(run+code (f 2))
(run+code (f 3))

(run+code (g 1))
(run+code (g 2))
(run+code (g 3))

(run+code (h 0)) ; = 0
(run+code (h 1)) ; = 2 = 2
(run+code (h 2)) ; = 4 = 2 ^ 2
(run+code (h 3)) ; = 16 = 2 ^ 4
(display (format "(h 4) = ~s\n"
                 (h 4) )) ; = 65536 = 2 ^ 16 = 2 ^ (h (n-1))

(run+code (k 1))
(run+code (k 2))
(run+code (k 3))
