(define-module util.multiples
  (use util.stdutils)
  (export-all))
(select-module util.multiples)



;(sum-of-multiples '(3 5) 1000)
(define (sum-of-multiples mulsargs max)
    (fold + 0 (multiples-list mulsargs max)))


(define (multiples-list mulsargs max)
  (define (muls-iter ret iter)
    (if (>= iter max)
	ret
	(muls-iter (cons iter ret) (muls-next iter mulsargs))))  
  (muls-iter nil 0))


;(muls-next 6 '(5 3))
(define (muls-next now mulsargs)
  (define (muls-next-iter iter)
    (if (multiples-of-args? iter mulsargs)
	iter
	(muls-next iter mulsargs)))
  (muls-next-iter (+ now 1)))


;(multiples-of-args? 2 '(4 5))
(define (multiples-of-args? val mulsargs)  
  (define (multiples-of-args?-iter remainder)
    (cond 
     ((null? remainder) #f)
     ((multiple? val (car remainder)) #t)
     (else (multiples-of-args? val (cdr remainder)))))
    (multiples-of-args?-iter mulsargs))


;(multiple? 2 5) 
(define (multiple? val muls)
  (= (modulo val muls) 0))



(provide "util.multiples")