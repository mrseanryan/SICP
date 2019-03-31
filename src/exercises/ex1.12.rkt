#lang racket
(require sicp)
(require racket/trace)

; Pascal's triangle

(display "_____________________________\n")
(display "first attempt \n");

(define (fun-cell row column)
  (cond ((= row 1) 1)
        ((= row 2) 1)
        ((= column 1) 1)
        ((= column row) 1)

        (else   (+ (fun-cell (- row 1) (- column 1)  )
                   (fun-cell (- row 1) column ) )
                ))
  )

(define (fun-row row cell)
  (display (format "~s " (fun-cell row cell)))

  (if (< cell row) 
      (fun-row row (+ cell 1))
      )    
  )

(define (fun row)
  (fun-row row 1)
  )


(define (test-fun func n)
  (display (format "fun ~s = ~s\n" n (func n)))
  )

(trace fun)

(test-fun fun 1)
(test-fun fun 2)
(test-fun fun 3)
(test-fun fun 4)
(test-fun fun 5)
(test-fun fun 6)
