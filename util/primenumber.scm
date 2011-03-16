(define-module util.primenumber
  (export-all))
(select-module util.primenumber)



(define first-prime-number 2)


;(prime-order 6)
;(prime-order 10001)
(define (prime-order num)
  (define (prime-order-iter now iter)
    (if (= iter num)
	now
	(prime-order-iter (next-prime now) (+ iter 1))))
  (prime-order-iter 2 1))


(define (next-prime now)
  (define (next-prime-iter iter)
    (if (prime? iter)
	iter
	(next-prime-iter (+ iter 1))))
  (next-prime-iter (+ now 1)))


(define (prime? num)
  (= num (smallest-divisor num)))


(define (smallest-divisor num)
  (find-divisor num 2))


(define (find-divisor num divnum)
  (if (divides? num divnum)
      divnum
      (find-divisor num (+ divnum 1))))


(define (divides? num divnum)
  (= (remainder num divnum) 0))



(provide "util.primenumber")