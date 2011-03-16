(define-module util.primefactor
  (export-all))
(select-module util.primefactor)


;(largest-prime-factor 10)
;(largest-prime-factor 600851475143)
(define (largest-prime-factor number)
  (define (largest-prime-factor-iter min now number)
    (cond
     ((>= now number) now)
     ((= (modulo number now) 0) (largest-prime-factor-iter now now (/ number now)))
     (else (largest-prime-factor-iter min (+ now 1) number))))
  (largest-prime-factor-iter 2 2 number))
  

(provide "primefactor")
  