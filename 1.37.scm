
(define (cont-frac n d k)
  (define (iter i)
    (if (= i k)
	(/ (n i) (d i))
	(/ (n i) (+ (d i) (iter (+ i 1))))))
  (iter 1))

(/ 1.0 (cont-frac (lambda (x) 1.0) (lambda (x) 1.0) 30))
(/ 1 0.618033)

;; Iterative process implementation.
(define (cont-frac-iter n d k)
  (define (iter i result)
    (cond ((= i 1) (/ (n i) (+ (d i) result)))
	  ((= i k) (iter (- i 1) (/ (n i) (d i))))
	  (else (iter (- i 1) (/ (n i) (+ (d i) result))))))
(iter k 0.0))

(/ 1 (cont-frac-iter (lambda (x) 1.0) (lambda (x) 1.0) 11))
;;; It takes k = 11 to get a approximation with 4 decimal places of accuracy.
(RESTART 1)