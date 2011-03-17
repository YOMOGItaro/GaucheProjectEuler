;; A Pythagorean triplet is a set of three natural numbers, a  b  c, for which,

;; a2 + b2 = c2
;; For example, 32 + 42 = 9 + 16 = 25 = 52.

;; There exists exactly one Pythagorean triplet for which a + b + c = 1000.
;; Find the product abc.


;(product-of-pythagorean-triplet-for 12)
(product-of-pythagorean-triplet-for 1000)
(define (product-of-pythagorean-triplet-for num)
  (define (product-of-pythagorean-triplet-for-iter triplet)
    (if (pythagorean-triplet? triplet)
	(* (car triplet) (cadr triplet) (caddr triplet))
	(product-of-pythagorean-triplet-for-iter (next-triplet triplet))))
  (define (next-triplet triplet)
    (limited-triplet-next triplet num))
  (product-of-pythagorean-triplet-for-iter (list 1 1 (- num 2))))


; (pythagorean-triplet? (list 3 4 5))
; (pythagorean-triplet? (list 3 3 5))
(define (pythagorean-triplet? triplet)
  (= (+ (expt (car triplet) 2) (expt (cadr triplet) 2))
	      (expt (caddr triplet) 2)))


;(limited-triplet-next '(1 1 8) 10)
;(limited-triplet-next '(2 7 1) 10)
(define (limited-triplet-next triplet limit)
  (define (limited-triplet-next-iter triplet)
    (cond
     ((= (caddr triplet) 0)
      (limited-triplet-next-iter
       (list (+ (car triplet) 1) 1 (- limit (car triplet) 2))))
     (else
      triplet)))
  (limited-triplet-next-iter
   (list (car triplet) (+ (cadr triplet) 1) (- (caddr triplet) 1))))
   

