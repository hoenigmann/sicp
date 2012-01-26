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
  
 (define (prime? x) 
   (define (test divisor) 
     (cond ((> (* divisor divisor) x) true) 
           ((= 0 (remainder x divisor)) false) 
           (else (test (+ divisor 1))))) 
   (test 2)) 

(define (prime-sum? pair)
  (prime? (+  (car pair) (cadr pair))))

(define (unique-pairs n)
  (flatmap (lambda (i) (map (lambda (j) (list i j)) (enumerate-interval 1 (- i 1)))) 
	   (enumerate-interval 1 n)))

(define (make-pair-sum pair)
      (list (car pair) (cadr pair) (+ (car pair) (cadr pair))))

(define (prime-sum-pairs n)
  (map (lambda (pair) (make-pair-sum pair))
   (filter prime-sum? (unique-pairs n))))

(define (triple-to-n-sum n s)
  (define (less-than-sum? triple)
    (< (+ (car triple) (cadr triple) (caddr triple)) s))
  (filter less-than-sum? (flatmap (lambda (i) 
	      (map (lambda (j) 
		     (map (lambda (k) (list i j k))
			  (enumerate-interval 1 (- j 1)))) 
		   (enumerate-interval 2 (- i 1)))) 
	    (enumerate-interval 3 n))))

;;; clearer and concise second attempt
(define (triple-to-n-sum n s)
  (define (less-than-sum? triple)
    (< (+ (car triple) (cadr triple) (caddr triple)) s))
  (filter less-than-sum? (flatmap (lambda (i) (map (lambda (pair) (list i (car pair) (cadr pair)))
						   (unique-pairs (- i 1))))
				  (enumerate-interval 3 n))))

;;; This attempt works because nested flatmaps are used.  One flatmap used inside the function and one used
;;; inside the function: unique-pairs (combine to get rid of empty lists?)
(triple-to-n-sum 9 10)




