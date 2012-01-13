(define (horner-eval x coefficient-sequence)
  (accumulate (lambda (this-coeff higher-terms) (+ this-coeff (* x (horner-eval x (cdr coefficient-sequence))))) 
	      0
	      coefficient-sequence))

(horner-eval 2 (list 1 3 0 5 0 1))