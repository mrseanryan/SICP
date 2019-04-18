#lang racket

;;;SECTION 1.1.7

(define (sqrt-iter guess x)
  (if (good-enough? guess x)
      guess
      (sqrt-iter (improve guess x)
                 x)))

(define (improve guess x)
  (average guess (/ x guess)))

(define (average x y)
  (/ (+ x y) 2))

(define (square x)
  (* x x))

(define (good-enough? guess x)
  (< (abs (- (square guess) x)) 0.001))

(define (sqrt x)
  (sqrt-iter 1.0 x))

(define (test-sqrt-fun fun x)
  (display "sqrt of ")
  (display x)
  (display " ~= ")
  (display  (fun x))
  (display "\n error = ")
  (display (- x (square (fun x) )))
  (display "\n")
  )

(define (test-sqrt-funs fun)
  (test-sqrt-fun fun 9)
  (test-sqrt-fun fun (+ 100 37))
  (test-sqrt-fun fun (+ (fun 2) (fun 3)))
  (test-sqrt-fun fun 1000)

  (display "small number - the tolerance is too big, relatively\n")
  (test-sqrt-fun fun 0.001)

  (display "big number - the tolerance is too small, relative to the available accuracy at that point on the number line (float?)\n")
  (test-sqrt-fun fun 1e5)
  (test-sqrt-fun fun 1e7)
  (test-sqrt-fun fun 1e11)
  )

(display "____________________\n")
(display "testing original sqrt with fixed tolerance\n")
(test-sqrt-funs sqrt)

(display "\n")

(display "____________________\n")

; 2. attempt at improved version - using ratio not just a fixed tolerance

; Modified version to look at difference between iterations 
(define (good-enough-2? guess x) 
  (< (abs (- (improve guess x) guess)) 
     (calc-tolerance guess x) )) 

(define (calc-tolerance guess x)
  (if (< x 1e3) (* guess 0.001)
      1e-20
      )
  )

(define (sqrt-iter-2 guess x)
  (if (good-enough-2? guess x)
      guess
      (sqrt-iter-2 (improve guess x)
                   x)))

(define (sqrt-2 x)
  (sqrt-iter-2 1.0 x))

(display "2. testing new sqrt with tolerance proportional to guess - good for SMALL numbers\n")
(test-sqrt-funs sqrt-2)

(display "____________________\n")
; 3. iterate until NO change (very good results!)
; ref: http://community.schemewiki.org/?sicp-ex-1.7 by GWB
(define (good-enough-3? guess x)
  ; note: could improve perf by removing call to 'improve' and adding a 'previous-guess' param
  ; limited precision: so eventually stops changing
  (= guess (improve guess x)))

(define (sqrt-iter-3 guess x)
  (if (good-enough-3? guess x)
      guess
      (sqrt-iter-3 (improve guess x)
                   x)))

(define (sqrt-3 x)
  (sqrt-iter-3 1.0 x))

(display "3. testing new sqrt which iterates until guess does not change\n")
(test-sqrt-funs sqrt-3)
