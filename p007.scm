;; By listing the first six prime numbers: 2, 3, 5, 7, 11, and 13,
;;  we can see that the 6th prime is 13.

;; What is the 10001st prime number?

;;;----memo----
;; GEKIOMO
;104743

(add-load-path ".")
(use util.primenumber)


(prime-order 10001)