(define (fringe tree)
  (cond ((null? tree) '())
	((not (pair? tree)) (list tree))
	(else  (append (fringe (car tree)) (fringe (cdr tree))))))

(define x (list (list 1 2) (list (list 6 (list 10 11) 8) 4)))
   (fringe x)

