(define-module util.productlist
  (use util.stdutils)
  (export-all))
(select-module util.productlist)



(define testlist '(1 2 3 4 5 6 3))


;(greatest-product-five-consecutive-digits testlist)
;(greatest-product-five-consecutive-digits problemlist)
(define (greatest-product-five-consecutive-digits srclist)
  (define (gpfcd-iter max pool)
    (if (< (length pool) 5)
	max
	(gpfcd-iter (superior max (product-front-five pool)) (cdr pool))))
  (gpfcd-iter 0 srclist))


(define (product-front-five pool)
  (define (product-front-five-iter total iter pool)
    (if (< 5 iter)
	total
	(product-front-five-iter
	 (* total (car pool)) (+ iter 1) (cdr pool))))
  (product-front-five-iter 1 1 pool))



(provide "util.productlist")