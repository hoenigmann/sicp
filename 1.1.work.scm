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

(define (p) (p))

(define (test x y)
  (if (= (force x) 0)
      0
      y))

(test (delay 0) (p))




(define (test x y)
  (if (= (force x) 0)
      0
      (force y)))

(test (delay 0) (delay (p)))

(define-syntax delay
  (sc-macro-transformer
   (lambda (exp env)
     `(lambda () ,(cadr exp)))))

(define-syntax normal-order-if
  (sc-macro-transformer
   (lambda (exp env)
     (let ((predicate (cadr exp))
	   (true-arm (caddr exp))
	   (false-arm (cadddr exp)))
       (if (eval predicate)
	   (eval true-arm)
	   (eval false-arm))))))

(define-syntax applicative-order-if
  (sc-macro-transformer
   (lambda (exp env)
     (let ((predicate (eval (cadr exp)))
	   (true-arm (eval (caddr exp)))
	   (false-arm (eval (cadddr exp))))
       (if predicate
	   true-arm
	   false-arm)))))

(define (force promise) (promise))

(force (delay (/ 5 0)))

(define (abs x)
  (cond ( (< x 0) (- x)) 
	(else x)))

(define (good-enough? guess x)
  (< (abs (- (* guess guess) x)) 0.001))

(define (average x y)
  (/ (+ x y) 2))

(define (improve-guess guess x)
  (average guess (/ x guess)))

(define (sqrt-iter guess x)
  (if (good-enough? guess x)
      guess
      (square-iter (improve-guess guess x) x)))

(define (sqrt x) (square-iter 1.0 x))

(sqrt 4)

;;; Exercise 1.6
;; The parameters of the then clause and the else clause will both be
;; evaluated for every case of the predicate.  Therefore, for every call
;; to sqrt-iter, another call to sqrt iter will be generated, resulting in
;; infinite recursion, regardless of the guess is good enough.

;;; 1.7 Exercise
;;; For small numbers less than 1 the good-enough? because the absolute value
;;; of the square of the guess converges to a small value very quickly. good-enough?
;;; also makes picking a starting value a pain.  For larger numbers,

;;; 1.8 Exercise
(define (cubert x)
  (define (cubert-iter guess)
    (if (good-enough? guess)
	guess
	(cubert-iter (improve guess))))
  (define (good-enough? guess)
    (< (abs (- (* guess guess guess) x)) 0.0001))
  (define (improve guess)
    (/ (+ (/ x (* guess guess)) (* 2 guess)) 3))
  (cubert-iter 1.0)
)

(cubert 27)

;;; Exercise 1.10
(A 0 n)
f (n) = 2n

(A 1 n)
(A 0 (A 1 (- n 1)))
(* 2 (A 1 (- n 1)))
(* 2 (A 0 (A 1 (- n 2))))
(* 2 (* 2 (A 0 (A 1 (- n 3)))))
(* 2 (* 2 (* 2 (A 0 (A 1 (- n 4))))))
...

g (n) = 2^n 

(A 2 n)
(A 1 (A 2 (- n 1)))
(A 0 (A 1 (- (A 2 (- n 1)) 1)))
(A 0 (A 0 (A 1 (- (A 2 (- n 1)) 1)))) ...

;;; Ackerman is parameter of ackerman

h (n) = 

;;;
( 0 1 2 3 5 8 13 21 34)

;;; Counting Change Example
o(define (first-denom kinds-of-coins)
  (cond ((= kinds-of-coins 1) 1)
        ((= kinds-of-coins 2) 5)
        ((= kinds-of-coins 3) 10)
        ((= kinds-of-coins 4) 25)
        ((= kinds-of-coins 5) 50)))

(define (ways amount)
  (define (count amount kinds-coins)
    (cond  ((= amount 0) 1)
	   ( (or (< amount 0) (= kinds-coins 0)) 0)
	   (else (+
		  (count amount (- kinds-coins 1))
		  (count (- amount (first-denom kinds-coins)) kinds-coins)
		  ))))
  (count amount 5))

(ways 100)
(ways 1)
(ways 2)
(ways 5)
(ways 10)
(ways 11)
(ways 25)
(ways 500)
(ways 600)
(ways 601)


;;; Exercise 1.11
(define (fib3 n)
  (cond ((= 0 n) 0)
	((= 1 n) 1)
	((= 2 n) 2)
	(else
	 (+ (fib3 (- n 1))
	    (fib3 (- n 2))
	    (fib3 (- n 3))
	    )))
)
(fib3 5)

(define (fib n)
   (define (fib-iter a b c n)
     (cond ((= n 0) c)
	   (else 
	    (fib-iter (+ a b c) a b (- n 1)))))
   (fib-iter 2 1 0 n)
)

(fib 8)

;;; Exercise 1.13
;;; Golden Ratio relationship to Fibonacci sequence.


;;; Exercise 1.15b
;;; What is the order of growth in space and number of steps (as a function
;;; a) used by the process generated by the sine procedure when sine a is evaluated?
;;; When a = 12.15
;;; 12/3 = 4, /3= 1.333, /3=.4, /3=.13 /3=.033
;;; a/3/3/3/3/3... =  0.1
;;; a to the x = y, loga(y) = x

(define (sum term a next b)
  (if (> a b) 0
      (+ (term a)
	 (sum term (next a) next b))))

(define (identity x) x)

(define (inc x) (+ x 1))

(define (cube x) (* x x x))

(sum cube 1 inc 10) 



;;; Exercise 1.29
(define (simp f a b n)
   
  (define (next increment)
    (+ a (* increment (/ (- b a) n))))

   (define (iter k) 
     (cond ((> k n) 0) 
	   ((= k 0) (+ (f (next k)) (iter (+ k 1))))
	   ((= k n) (f (next k)))
	   ((= (/ k 2)  0) (+ (iter (+ k 1)) (* 2 (f (next k)))))
	   (else (+ (iter (+ k 1)) (* 4 (f (next k)))))
)
)

    (* (/ (/ (- b a) n) 3) (iter 0))
)

(simp identity 0 5.0 100)
;;;; wrong answer did i at least get the idea....

;;; Exercise 1.30
(define (sum term a next b)
  (define (iter a result)
    (if (> a b)
	result
	(iter (next a) (+ (term a) result))))
  (iter a 0)
)

(define (next a) 
  (+ a 1))

(sum identity 1 next 5)

;;; Exercise 1.31

