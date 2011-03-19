;; The sum of the primes below 10 is 2 + 3 + 5 + 7 = 17.

;; Find the sum of all the primes below two million.

(add-load-path ".")
;(use util.primenumber)
;(use srfi-1)

(define two-million 2000000)


;; (sum-of-primes-below two-million)
;; (sum-of-primes-below 10)
;; (define (sum-of-primes-below num)
;;   (define (sum-of-primes-below-iter total iter)
;;     (define next-total
;;       (cond
;;        ((> (* iter 2) num) (print iter) (+ total iter))
;;        (else (print iter (- (* iter 2))) (- (+ total iter) (* iter 2)))))
;;     (if (>= iter num)
;; 	total
;; 	(sum-of-primes-below-iter next-total (+ iter 1))))
;;   (sum-of-primes-below-iter 0 ))


;; (fold + 0 (enum 2 100))
;; (fold + 0 (enum 2 (- two-million 1)))
;; (define (enum from to)
;;   (define (enum-iter iter pool)
;;     (if (< iter from) pool (enum-iter (- iter 1) (cons iter pool))))
;;   (enum-iter to '()))


(use util.stream)
;(sum-primes 1 2)


(define (divisible? number divisor)
  (= (remainder number divisor) 0))

;(sieve (stream-iota -1 2))

(define (sieve stream)
  (stream-cons
   (stream-car stream)
   (sieve (stream-filter
	   (lambda (x)
	     (not (divisible? x (stream-car stream))))
	   (stream-cdr stream)))))


(define (intergers-starting-from n)
  (stream-cons n (intergers-starting-from (+ n 1))))


(define primes (sieve (intergers-starting-from 2)))


(stream-ref primes 2501)