;; The sum of the primes below 10 is 2 + 3 + 5 + 7 = 17.

;; Find the sum of all the primes below two million.

(add-load-path ".")
(use util.primenumber)
(use srfi-1)

(define two-million 2000000)


(sum-of-primes-below two-million)
(define (sum-of-primes-below num)
  (print (fold + 0 (prime-list num))))


(prime-list 100000)
;(prime-list 10)
;(prime-list two-million)
(define (prime-list num)
  (define (prime-list-iter iter pool)
    (print iter)
    (if (> iter num)
	pool
	(prime-list-iter (+ iter 1) (delete-product iter num pool))))
  (prime-list-iter 2 (enum 2 num)))


(define (delete-product num max pool)
  (define (delete-product-iter iter pool)
    (if (> iter max)
	pool
	(delete-product-iter (+ iter num) (delete iter pool))))
  (delete-product-iter (+ num num) pool))


(car (enum 2 two-million))
(define (enum prime last)
  (define (enum-iter lis iter)
    (if (< iter prime)
	lis
	(enum-iter (cons iter lis) (- iter 1))))
  (enum-iter '() last))