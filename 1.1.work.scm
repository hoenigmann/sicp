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

;;; Conditional Expressions and Predicates
;;; A Clause has a predicate and a consequent expression as the value of the clause
;;; A Predicate evaluates to true or false. 
(define (abs x)
  (cond ((> x 0) x)
	((= x 0) 0)
	((< x 0) (- x))))

(abs -3)

(define (abs x)
  (cond ((< x 0) (- x))
	(else x)))
(abs -4)

(define (abs x) 
  (if (< x 0)
      (- x)
      x))
(abs -5)

(and (> 7 5) (< 7 10))
(define (>= x y)
  (or (> x y) (= x y)))

(>= 5 4)
(>= 4 5)

;;; Exercise 1.3
(/ (+ 5 4 (- 2 (- 3 (+ 6 (/ 4 5)))))
   (* 3 (- 6 2) (- 2 7))
)

;;; Exercise 1.4
(define (aplusabsb a b)
 ((if (> b 0) + -) a b))
(aplusabsb 5 -4)

;;; Exercise 1.5
;;; The behavior with applicative 
;;; order observed will be that the call to p will be evaluated before the call to test
;;; resulting in a infinite loop to evaluating p.
;;; The behavior with normal order will produce a expansion with p not evaluated at the end point
;;; the expansion.  When the evaluation is is carried out and the if predicate is found to be true
;;; only the true consquent will be evaluated.






