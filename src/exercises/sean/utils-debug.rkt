#lang racket
(require slideshow/code)

(define-syntax run+code
  (syntax-rules ()
    ; a macro:
    [(run+code expr)
     ; macro instance is replaced with:
     (append 
      (list (code expr))
      expr)
     ])
  )

(provide run+code)
