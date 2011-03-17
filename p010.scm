;; The sum of the primes below 10 is 2 + 3 + 5 + 7 = 17.

;; Find the sum of all the primes below two million.

(add-load-path ".")
(use util.primenumber)


(define two-million 2000000)


(define (sum-of-primes-below num)
  (define (sum-of-primes-below-iter total now)
    (print now)
    (if (>= now num)
	total
	(sum-of-primes-below-iter
	 (+ total now)
	 (next-prime now))))
  (sum-of-primes-below-iter 0 first-prime-number))

(sum-of-primes-below 10)
(sum-of-primes-below two-million)