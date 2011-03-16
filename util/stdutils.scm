(define-module util.stdutils
  (export-all))
(select-module util.stdutils)


(define nil '())


(define (superior arg1 arg2)
  (if (> arg1 arg2) arg1 arg2))


(provide "util.stdutils")