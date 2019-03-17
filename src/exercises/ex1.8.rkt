#lang racket

; ex1.8 - cube root

(define (improve guess x) 
  (/ (+ (/ x (square guess)) (* 2 guess)) 3)) 

; simple check against fixed tolerance
(define (good-enough? guess x) 
  (< (abs (- (cube guess) x)) 0.001)) 

(define (cube-root-iter guess x) 
  (if (good-enough? guess x) 
      guess 
      (cube-root-iter (improve guess x) 
                      x))) 

(define (square x)
  (* x x))

(define (cube x)
  (* x x x))

(define (cube-rt x)
  (cube-root-iter 1.0 x))

(define (test-cube-rt-fun fun x)
  (display "cubed root of ")
  (display x)
  (display " ~= ")
  (display  (fun x))
  (display "\n error = ")
  (display (- x (cube (fun x) )))
  (display "\n")
  )

(define (test-cube-rt-funs fun)
  (test-cube-rt-fun fun 8)
  (test-cube-rt-fun fun 27)

  (test-cube-rt-fun fun 2)
  (test-cube-rt-fun fun 9)
  (test-cube-rt-fun fun (+ 100 37))
  (test-cube-rt-fun fun (+ (fun 2) (fun 3)))
  (test-cube-rt-fun fun 1000)

  (display "small number - the tolerance is too big, relatively\n")
  (test-cube-rt-fun fun 0.001)

  (display "big number - the tolerance is too small, relative to the available accuracy at that point on the number line (float?)\n")
  (test-cube-rt-fun fun 1e5)
  (test-cube-rt-fun fun 1e7)
  (test-cube-rt-fun fun 1e11)
  )

(display "____________________\n")

(display "1. testing cube-rt with fixed tolerance\n")
(test-cube-rt-funs cube-rt)


(display "____________________\n")

(define (good-enough-2? guess x) 
  (= guess (improve guess x))
     ) 


(define (cube-root-iter-2 guess x) 
  (if (good-enough-2? guess x) 
      guess 
      (cube-root-iter-2 (improve guess x) 
                        x))) 

(define (cube-rt-2 x)
  (cube-root-iter-2 1.0 x)
  )

(display "2. testing cube-rt - iterate until guess stops changing - GOOD results!\n")
(test-cube-rt-funs cube-rt-2)
