(define-module util.primenumber
  (use srfi-27) ;for random
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


;; (define (prime? num)
;;   (= num (smallest-divisor num)))


(define (smallest-divisor num)
  (find-divisor num 2))


(define (find-divisor num divnum)
  (if (divides? num divnum)
      divnum
      (find-divisor num (+ divnum 1))))


(define (divides? num divnum)
  (= (remainder num divnum) 0))


(define (prime? num)
  (fast-prime? num 1000))


;(fast-prime? 17 10)
(define (fast-prime? num times)
  (cond
   ((= times 0) #t)
   ((fermat-test num) (fast-prime? num (- times 1)))
   (else #f)))


(define (fermat-test num)
  (define (try-it a)
    (= (expmod a num num) a))
  (try-it (+ (random-integer (- num 1)) 1)))


;(expmod 1 2 3)
(define (expmod base exp m)
  (cond
   ((= exp 0) 1)
   ((even? exp)
    (remainder (square (expmod base (/ exp 2) m))
	       m))
    (else
    (remainder (* base (expmod base(- exp 1) m))
	       m))))


(define (square num)
  (* num num))



(provide "util.primenumber")