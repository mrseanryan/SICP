#lang racket
(require sicp)
(require racket/trace)

(display "_____________________________\n")
(display "Pascal's triangle -> binomial expansion \n");

(define (fun-cell row column)
  (cond ((= row 1) 1)
        ((= row 2) 1)
        ((= column 1) 1)
        ((= column row) 1)

        (else   (+ (fun-cell (- row 1) (- column 1)  )
                   (fun-cell (- row 1) column ) )
                ))
  )

; BEGIN FORMATTING
(define (pow-str num exp)
  (cond ((= exp 0) 1)
        ( (= exp 1) num )
        (else (format "~a^~a" num exp))
        )
  )

(define (pow num exp)
  (pow-str num (- exp 1))
  )

; get the binomial expansion
(define (get-exponentials row cell)
  (cond ((= cell 1)  (pow "x" row) )
        ((= cell row) (pow "y" row) )
        (else
         (format "~a.~a" (pow "x" (inc (- row cell))) (pow "y" cell) )
         ) 
        )
  )

(define (get-plus row cell)
  (if (< cell row) "+ " "")
  )

(define (no-ones n)
  (if (= n 1) "" n )
  )

(define (format-row-cell row cell)
  (format "~a~a ~a"  (no-ones (fun-cell row cell)) (get-exponentials row cell) (get-plus row cell)  )
  )

(define (fun-row row cell)  
  (if (< cell row)
      (format "~a~a" (format-row-cell row cell) (fun-row row (+ cell 1)))
      (format-row-cell row cell)
      )
  )
; END FORMATTING

(define (fun row)
  (fun-row row 1)
  )


(define (test-fun func n)
  (display (format "~a = ~a\n" (pow "(x + y)" n) (func n)))
  )

;(trace fun)

(test-fun fun 1)
(test-fun fun 2)
(test-fun fun 3)
(test-fun fun 4)
(test-fun fun 5)
(test-fun fun 6)
(test-fun fun 7)
(test-fun fun 8)
(test-fun fun 9)
(test-fun fun 10)
