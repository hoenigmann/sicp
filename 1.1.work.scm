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
;;; Evaluate the operator to get the procedure to be applied.
;;; Evaluate the operands to get the arguments to substitute for the formal parameters.
;;; Model that determines "meaning" of the procedure application.
;;; Typical interpreter won't substitute values for formal parameters.

;;; Applicative vs. Normal Order
;;; Fully Expand then follow by a series of reductions
;;; is Normal Order Evaluation, possibly evaluating same expression
;;; twice or more...
;;; Evaluate Arguments then apply is Applicative Order Evaluation. Lisp uses this.
;;; It can be shown that applicative order and normal order evaluation produce the same values.

;;; Eager vs lazy, the order in which the substitution takes place, applicative or normal.
;;; Ich hab etwas gefeunden...

(define isi 15)
isi
