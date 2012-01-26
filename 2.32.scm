(define (subsets s)
         (if (null? s)
             (list '())
             (let ((rest (subsets (cdr s))))
	       (append rest (map 
			     (lambda (x) (cons (car s) x)) rest)))))

(define x (list 1 2 3 ))
(trace subsets)
(subsets x)
(map (lambda (x) (cons x 5)) x)

;;; Use trace to assist in a run time analysis that does not consider
;;; the size of the output.

