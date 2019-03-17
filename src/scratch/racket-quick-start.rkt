#lang slideshow

;__________________________
; racket quick-start
; ref: https://docs.racket-lang.org/quick/index.html

(display "racket quick-start\n\n")

(define (square n)
  (filled-rectangle n n))

(define (filled-circle radius)
         (filled-ellipse radius radius))

(define c (circle 10 #:border-color "red"))
(define cf (filled-ellipse 10 10 #:border-color "red" ))
(define r (rectangle 10 20))
(define s (square 15))

(hc-append 10 c s r s c )

;__________________________
; 5 - local binding
(display "5 - local binding\n")

(define (four p)
  (define two-p (hc-append p p))
  (vc-append two-p two-p))

(four c)

; let
;
; Typically, Racketeers use the let or let* form for local binding (instead of define). 
; An advantage of let is that it can be used in any expression position. 
; Also, it binds many identifiers at once, instead of requiring a separate define for each identifier:
(define (checker p1 p2)
  (let ([p1p2 (hc-append p1 p2)]
        [p2p1 (hc-append p2 p1)])
    (vc-append p1p2 p2p1)))

(checker (colorize s "red")
         (colorize s "yellow"))

; let*
;
; A let form binds many identifiers at the same time,
; so the bindings cannot refer to each other.
; The let* form, in contrast, allows later bindings
; to use earlier bindings
(define (checker-board p)
  (let* ([redp (colorize p "red")]
         [yellowp (colorize p "yellow")]
         [c (checker redp yellowp)]
         [c4 (four c)])
    (four c4)))

(checker-board s)
(checker-board cf)

;__________________________
; 6 - Functions are Values
(display "6 - Functions are Values\n")

(define (series fun)
  (hc-append 4 (fun 5) (fun 10) (fun 15)))

(hc-append 10 (series square) (series circle))

; lambda (annonymous function)
(series (lambda (size) (checker-board (square size))))
(series (lambda (size) (checker-board (filled-circle size))))

;__________________________
; 7 - Lexical Scope
(display "7 - Lexical Scope\n")

; here, 'mk' is available to the contained functions
(define (rgb-series mk)
  (vc-append
   (series (lambda (sz) (colorize (mk sz) "red")))
   (series (lambda (sz) (colorize (mk sz) "green")))
   (series (lambda (sz) (colorize (mk sz) "blue")))))

(rgb-series filled-circle)

; creates and returns a function
(define (rgb-maker mk)
  (lambda (sz)
    (vc-append (colorize (mk sz) "red")
               (colorize (mk sz) "green")
               (colorize (mk sz) "blue")
               )))

(series (rgb-maker filled-circle))

