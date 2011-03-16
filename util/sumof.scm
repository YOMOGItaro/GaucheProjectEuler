(define-module util.sumof
  (export-all))
(select-module util.sumof)


;(diff-of-sumsqu-squsum 100)
(define (diff-of-sumsqu-squsum num)
  (- (sum-of-squares-between num)
     (square-of-sum-between num)))


;(sum-of-squares-between 10)
(define (sum-of-squares-between num)
  (expt (sum-between num) 2))


;(sum-between 10)
;(sum-between 100)
(define (sum-between num)
  (define (sum-between-iter total iter)
    (if (< iter 1)
	total
	(sum-between-iter (+ total iter) (- iter 1))))
  (sum-between-iter 0 num))


;(square-of-sum-between 10)
(define (square-of-sum-between num)
  (define (square-of-sum-between-iter total iter)
    (if (< iter 1)
	total
	(square-of-sum-between-iter (+ total (expt iter 2)) (- iter 1))))
  (square-of-sum-between-iter 0 num))


(provide "util.sumof")