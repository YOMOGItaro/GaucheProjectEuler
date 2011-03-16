;; A palindromic number reads the same both ways.
;;  The largest palindrome made from the product of
;;  two 2-digit numbers is 9009 = 91  99.

;; Find the largest palindrome made from the product of two 3-digit numbers.


(palindrome-from-product-of-two-3-digit)
(define (palindrome-from-product-of-two-3-digit)
  (define (pfpot3d-iter pair max)
    (cond
     ((and (>= (car pair) 999) (>= (cdr pair) 999))
      max)
     ((palindromic? (pair-multi pair))
      (pfpot3d-iter (pair-next pair) (pair-multi pair)))
     (else
      (pfpot3d-iter (pair-next pair) max))))
  (pfpot3d-iter '(100 . 100) 10201))


;(palindromic? 123454321)
;(palindromic? 123445321)
(define (palindromic? num)
  (= (num-reverse num) num))


(define (num-reverse num)
  (define (num-reverse-iter ret pool)
    (if (= pool 0)
	ret
	(num-reverse-iter
	 (+ (* ret 10) (remainder pool 10))
	 (quotient pool 10))))
  (num-reverse-iter 0 num))


;(pair-multi '(100 . 101))
(define (pair-multi pair)
  (* (car pair) (cdr pair)))


;(pair-next '(999 . 100))
;(pair-next '(998 . 100))
(define (pair-next pair)
  (cond
   ((>= (car pair) 999) (cons 100 (+ (cdr pair) 1)))
   (else (cons (+ (car pair) 1) (cdr pair)))))

