;;;----my memo----
;; lcm(abd, acd) -> abcd
;; abd * acd -> aabcdd
;; gcd(abd, acd) -> ad


(define-module util.divisible_numbers
  (export-all))
(select-module util.divisible_numbers)



;(smallest-num-divisible-numbers 10)
;(smallest-num-divisible-numbers 20)
(define (smallest-num-divisible-numbers num)
  (define (sndn-iter total iter)
    (if (<= iter 1)
	total
	(sndn-iter (lcm total iter) (- iter 1))))
  (sndn-iter 1 num))



(provide "util.divisible_numbers")