(define (add-rat x y)
  (make-rat (+ (* (numer x) (denom y))
	       (* (numer y) (denom x)))
	    (* (denom x) (denom y))))

(define x (cons 1 2))
x
(car x)
(cdr x)
(define y (cons 3 4))
y
(define z (cons x y))
z
(car (car z))

(define zero (lambda (a) (lambda (x) x)))
;;; Returns function that returns the identity function.

(define (add-1 n) (lambda (f) (lambda (x) (f ((n f) x)))))
;;; Returns a function that applies its argument inside a function that it returns.

;;; one.
(lambda (f) (lambda (x) (f ((zero f) x))))
(lambda (f) (lambda (x) (f ( x ))))

;;; two.
;;; Think returns a function that returns a function.
(add-1 one)
(add-1 (lambda (a) (lambda (x) (a ( x )))))
((lambda (f) (lambda (x) (f ( x )))))

(define (identity x) x)
(((add-1 zero) identity) 2) 

(define (identity x))


