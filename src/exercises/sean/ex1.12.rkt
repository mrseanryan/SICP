#lang racket
(require sicp)
(require racket/trace)

(define (pascal-recursive column row) 
  (if (or (zero? row) (= column row))
      1
      (+ (pascal-recursive (sub1 column) row)
         (pascal-recursive (sub1 column) (sub1 row))
         )
      )
  )

; ref: https://stackoverflow.com/questions/25096781/tail-recursive-pascal-triangle-in-scheme
;
; notes added by sean
;
; ref: https://stackoverflow.com/questions/34297481/tail-recursion-calling-tail-recursion/34299362#34299362
; pascal triangle has this properties:
;
; 1. First and last item in every line of pascal triangle is '1'
; 2. Second and penultimate is number of line
; 3. Any other elements can be solved by formula:
;       row! / ( column! x (row - column)! )
;
;
(define (pascal-factorial row col)
  (define (factorial from to acc)
    (if (> from to)
        acc
        (factorial (+ 1 from) to (* acc from))))

  ; let* - local variables
  ; x! = x factorial
  ; rmc = row-minus-column
  ; fac-rmc = row-minus-column!
  ; fac-col = column!
  ; fac-row = row!
  (let* ((rmc (- row col))
         (fac-rmc (factorial 1 rmc 1))
         (fac-col (factorial (+ rmc 1) col fac-rmc))
         (fac-row (factorial (+ col 1) row fac-col)))
    (/ fac-row fac-col fac-rmc)
    )
  )

; BEGIN FORMATTING
(define (pow-str num exp)
  (cond ((= exp 0) 1)
        ( (= exp 1) num )
        (else (format "~a^~a" num exp))
        )
  )

; get the binomial expansion
(define (get-exponentials row cell)
  (cond ((= cell 0)  (pow-str "x" row) )
        ((= cell row) (pow-str "y" row) )
        (else
         (format "~a.~a" (pow-str "x" (- row cell)) (pow-str "y" cell) )
         ) 
        )
  )

(define (get-plus row cell)
  (if (< cell row) "+ " "")
  )

(define (no-ones n)
  (if (= n 1) "" n )
  )

(define (format-row-cell row cell pascal-cell-fun)
  (format "~a~a ~a"  (no-ones (pascal-cell-fun row cell)) (get-exponentials row cell) (get-plus row cell)  )
  )

(define (fun-row row cell pascal-cell-fun)  
  (if (< cell row)
      (format "~a~a" (format-row-cell row cell pascal-cell-fun) (fun-row row (+ cell 1) pascal-cell-fun))
      (format-row-cell row cell pascal-cell-fun)
      )
  )
; END FORMATTING

(define (fun row pascal-cell-fun)
  (fun-row row 0 pascal-cell-fun)
  )

(define (format-output func n pascal-cell-fun)
  (display (format "~a = ~a\n" (pow-str "(x + y)" n) (func n pascal-cell-fun)))
  )

(define (test-pascal pascal-cell-fun caller-fun total-rows)
  (let loop ((i 0))
    (if (<= i total-rows)
        (begin
          (caller-fun fun i pascal-cell-fun)
          (loop (add1 i))
          )
        )
    ) 
  )

; Tracing shows that pascal-factorial is not growing its call stack (tail-recursive)
;
;(trace pascal-recursive)
;(trace pascal-factorial)

(display "_____________________________\n")
(display "Pascal's triangle -> binomial expansion \n");
(display "recursive\n")
(test-pascal pascal-recursive format-output 10)

(display "_____________________________\n")
(display "tail-recursive\n")
(test-pascal pascal-factorial format-output 10)

(provide test-pascal pascal-recursive pascal-factorial)
