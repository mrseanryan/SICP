; imports the module 'slideshow'
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

;__________________________
; 8 - Lists
(display "8 - Lists\n")

(list "red" "green" "blue")
(list (circle 10) (square 10) (filled-circle 15))

(define (rainbow p)
  (map (lambda (color)
         (colorize p color))
       (list "red" "orange" "yellow" "green" "blue" "purple" "violet")))

(rainbow (filled-circle 10))

; The apply function bridges the gap between a function that wants many arguments and a list of those arguments as a single value.
; so it 'destructures'
(apply vc-append 5 (rainbow (square 5)))


;__________________________
; 9 - Modules
(display "9 - Modules\n")
; module 'pict', file 'flash'
(require pict/flash)

; filled-flash width height n-points spike-fraction rotation
(filled-flash 40 30 12)
(filled-flash 40 30 8)
(filled-flash 40 30 5)
(filled-flash 40 30 5 0.2)
(filled-flash 40 30 5 0.2 45)
(filled-flash 40 30 5 2)

; export
(provide rainbow square filled-circle)

;__________________________
; 10 - Macros
(display "10 - Macros\n")

(require slideshow/code)
; writes out the given code
(code (circle 10))

(define-syntax pict+code
  (syntax-rules ()
    ; a macro:
    [(pict+code expr)
     ; macro instance is replaced with:
     (hc-append 10
                expr
                (code expr))]))

(pict+code (circle 10))

;__________________________
; 11 - Objects (!)
(display "11 - Objects (!)\n")

; The class system itself is implemented by the racket/class library, and the racket/gui/base library provides the GUI and drawing classes. By convention, the classes are given names that end with %:

(require racket/class
         racket/gui/base)
(define f (new frame% [label "My Art"]
                      [width 300]
                      [height 300]
                      [alignment '(center center)]))

; send a message 'show' to object 'f', with param #t (true)
(send f show #t)

(define (add-drawing p)
  (let ([drawer (make-pict-drawer p)])
    (new canvas% [parent f]
                 [style '(border)]
                 [paint-callback (lambda (self dc)
                                   (drawer dc 0 0))])))
 
(add-drawing (pict+code (circle 10)))

(add-drawing (colorize (filled-flash 50 30) "orange"))
