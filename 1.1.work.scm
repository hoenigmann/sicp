;;; a compound procedure
;;; (define (<name> <formal parameters>) <body>)
(define (square x) (* x x))
(square 2)

(define (sum-of-squares x y) 
  (+
   (square x) 
   (square y)))
(sum-of-squares 4 5)
(define (f a)
  (sum-of-squares a a))
(f 4)

;;; The substitution model for procedure application.
;;;Evaluate the operator to get the procedure to be applied.
;;; Evaluate the operands to get the arguments to substitute for the formal parameters.
