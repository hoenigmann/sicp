(define nil '()) 
  
(define (filter predicate sequence) 
  (cond ((null? sequence) nil) 
	((predicate (car sequence)) 
	 (cons (car sequence)  
	       (filter predicate (cdr sequence)))) 
	(else (filter predicate (cdr sequence)))))
  
 (define (accumulate op initial sequence) 
   (if (null? sequence) 
       initial 
       (op (car sequence) 
           (accumulate op initial (cdr sequence))))) 
  
 (define (enumerate-interval low high) 
   (if (> low high) 
       nil 
       (cons low (enumerate-interval (+ low 1) high)))) 
  
 (define (flatmap proc seq) 
   (accumulate append nil (map proc seq)))

(define (square x)
  (* x x)
  (more))
  
 (define (prime? x) 
   (define (test divisor) 
     (cond ((> (* divisor divisor) x) true) 
           ((= 0 (remainder x divisor)) false) 
           (else (test (+ divisor 1))))) 
   (test 2)) 

(define (prime-sum? pair)
  (prime? (+  (car pair) (cadr pair))))
(RESTART 1)
(car (list 1 2))
(prime-sum? (list 3 2))

(define (unique-pairs n)
  (flatmap (lambda (i) (map (lambda (j) (list i j)) (enumerate-interval 1 (- i 1)))) 
	   (enumerate-interval 1 n)))

(enumerate-interval 1 5)
(unique-pairs 5)

(define (make-pair-sum pair)
      (list (car pair) (cadr pair) (+ (car pair) (cadr pair))))

(define (prime-sum-pairs n)
  (map (lambda (pair) (make-pair-sum pair))
   (filter prime-sum? (unique-pairs n))))

(prime-sum-pairs 5)

;;; how would you implement iteration within iteration, or nested iteration naively?
;;; "inner" loop and "outer" loop:

(define (inner-iter count n result)
  (if (< count n)
      (inner-iter (+ count 1) n (cons (cons count n) result))
      result))

(define (iter start stop result)
  (if (<= start stop)
      (iter (+ 1 start) stop (cons (inner-iter 1 start '()) result))
      result))

(iter 1 4 '())
