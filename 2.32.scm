(define (subsets s)
         (if (null? s)
             (list '())
             (let ((rest (subsets (cdr s))))
	       (append rest (map 
			     (lambda (x) (append x (list (car s)))) rest)))))

;;; (define x (list 1 2 3 ))
;;; (trace subsets)
;;; (subsets x)
;;; (map (lambda (x) (cons x 5)) x)

