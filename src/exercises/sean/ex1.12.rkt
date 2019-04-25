#lang racket
(require sicp)
(require racket/trace)

(display "_____________________________\n")
(display "Pascal's triangle -> binomial expansion \n");

(define (pascal-recursive column row) 
  (if (or (zero? row) (= column row))
      1
      (+ (pascal-recursive (sub1 column) row)
         (pascal-recursive (sub1 column) (sub1 row))
         )
      )
  )

; ref: https://stackoverflow.com/questions/25096781/tail-recursive-pascal-triangle-in-scheme
;(define (pascal x y) 
;(if (or (zero? y) (= x y))
;1
;(+ (pascal (sub1 x) y)
;(pascal (sub1 x) (sub1 y)))))

; ref: https://stackoverflow.com/questions/25096781/tail-recursive-pascal-triangle-in-scheme
(define (pascal-factorial row col)
  (define (factorial from to acc)
    (if (> from to)
        acc
        (factorial (+ 1 from) to (* acc from))))

  (let* ((rmc (- row col))
         (fac-rmc (factorial 1 rmc 1))
         (fac-pos (factorial (+ rmc 1) col fac-rmc))
         (fac-row (factorial (+ col 1) row fac-pos)))
    (/ fac-row fac-pos fac-rmc)))

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


(define (test-fun func n pascal-cell-fun)
  (display (format "~a = ~a\n" (pow-str "(x + y)" n) (func n pascal-cell-fun)))
  )

;(trace fun)

(define (test-pascal pascal-cell-fun)
  (let loop ((i 0))
    (if (<= i 10)
        (begin
          (test-fun fun i pascal-cell-fun)
          (loop (add1 i))
          )
        )
    ) 
  )

(test-pascal pascal-recursive)
(test-pascal pascal-factorial)
