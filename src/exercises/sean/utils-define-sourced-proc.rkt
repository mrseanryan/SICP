; defined a sourced procedure, where the code can be seen side-by-side with the output
;
; ref: https://stackoverflow.com/questions/20349543/how-do-you-return-the-description-of-a-procedure-in-scheme/20362858#20362858

#lang racket

(require (for-syntax racket/syntax))

;; Optional: Just for nicer output
(define (write-sourced x port mode)
  (define f (case mode
              [(#t) write]
              [(#f) display]
              [else pretty-print])) ;nicer than `print` for big sexprs
  (f (sourced-sexpr x) port))

(struct sourced (proc sexpr)
        #:property prop:procedure (struct-field-index proc)
        ;; Optional: Just to make cleaner output
        #:methods gen:custom-write
        [(define write-proc write-sourced)])

;; A macro to make it easier to use the `sourced` struct
(define-syntax (define-proc stx)
  (syntax-case stx ()
    [(_ (id arg ...) expr ...)
     #'(define id (sourced (lambda (arg ...) expr ...)
                           '(lambda (arg ...) expr ...)))]))

(provide define-proc)
