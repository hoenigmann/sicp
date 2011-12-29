(define (cons x y)
         (lambda (m) (m x y)))
(define (car z)
         (z (lambda (p q) p)))
(define (cdr z)
  (z (lambda (p q) q)))

(define  first (cons 1 2))
(define sec (cons first 3))

(cdr sec)


;;; verify using substitution model
(car (cons 3 4))
(car (lambda (m) (m 3 4)))
( (lambda (m) (m 3 4)) (lambda (p q) p) )
( (lambda (p q) p) 3 4 )
( (lambda (3 4) 3))
3