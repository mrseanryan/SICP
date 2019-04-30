#lang racket
(require sicp)
(require racket/trace)

(define (cube x)
  (* x x x)
  )

(define (p x)
  (- (* 3 x) (* 4 (cube x)) )
  )

(define (sine angle)
  (if (not (> (abs angle) 0.1 ))
      angle
      (p (sine (/ angle 3.0) ))
      )
  )

(provide sine)

; Testing different thresholds:
; 0.01 = p called 7 times, val -= -0.40438666 (google says -0.40444382284)
; 0.1 = p called 5 times, val = -0.3998
; 0.3 = p called 4 times, val = -0.361932886586251
;
; so using 0.1 as opposed to 0.01 might not be worth the saving in time, unless repeated often?

;(trace sine)
;(trace p)
;
;(sine 12.15)

; Orders of Growth:
; ref: http://community.schemewiki.org/?sicp-ex-1.15
;
; from the output, procedure p is applied five times
;
; The angle a is divided by 3 each time the procedure p is applied. Expressing this differently, we can say that p is applied 
; once for each complete power of 3 contained within the angle a. 
; -> base 3 logarithm -> O(log n) order of growth.
