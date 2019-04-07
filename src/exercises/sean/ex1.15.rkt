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


;(trace sine)
;(trace p)
;
;(sine 12.15)
