(define-module util.fibonacci
  (export-all))
(select-module util.fibonacci)


(define even-fibpair-first '(2 . 1))


;(sum-of-even-fib four-million)
;(sum-of-even-fib 10)
(define (sum-of-even-fib limitval)
  (define (sum-of-even-fib-iter sum fibpair)
    (if (> (car fibpair) limitval)
	sum
	(sum-of-even-fib-iter (+ sum (car fibpair)) (even-fibpair-next fibpair))))
  (sum-of-even-fib-iter 0 even-fibpair-first))


;(even-fib-next '(2 . 1))
(define (even-fibpair-next fibpair)
  (define (even-fibpair-next-iter fibpair)
    (if (even? (car fibpair))
	fibpair
	(even-fibpair-next (fibpair-next fibpair))))
  (even-fibpair-next-iter (fibpair-next fibpair)))


;(fib-next '(1 . 1))
;(fib-next '(2 . 1))
(define (fibpair-next fibpair)
  (cons (+ (car fibpair) (cdr fibpair)) (car fibpair)))


;(fibonacci 4)
(define (fibonacci num)
  (define (fib-iter now next iter)
    (if (> iter num)
	now
	(fib-iter next (+ now next) (+ iter 1))))
  (fib-iter 1 1 1))


(provide "util.fibonacci")
