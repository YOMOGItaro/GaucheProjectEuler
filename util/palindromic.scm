(define-module util.palindromic
  (export-all))
(select-module util.palindromic)


;(palindrome-from-product-of-two-3-digit)
(define (palindrome-from-product-of-two-3-digit)
  (define (pfpot3d-iter pair max)
    (define (pfpot3d-iter-next pmult)
      (cond
       ((and (palindromic? pmult) (< max pmult))
	(pfpot3d-iter (three-digit-pair-next pair) pmult))
       (else
	(pfpot3d-iter (three-digit-pair-next pair) max))))
    (cond
     ((and (>= (car pair) 999) (>= (cdr pair) 999))
      max)
     (else (pfpot3d-iter-next (pair-multi pair)))))
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


;(three-digit-pair-next '(999 . 100))
;(three-digit-pair-next '(998 . 100))
(define (three-digit-pair-next pair)
  (cond
   ((>= (car pair) 999) (cons  (+ (cdr pair) 1) (+ (cdr pair) 1)))
   (else (cons (+ (car pair) 1) (cdr pair)))))


(provide "util.palindromic")