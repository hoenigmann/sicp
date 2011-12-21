(define (search f neg-point pos-point)
  (define (close-enough? x y)
    (< (abs (- x y)) 0.001))

  (let ((midpoint (/ (+ pos-point neg-point) 2)))
    (if (close-enough? neg-point pos-point)
	midpoint
	(let ((test-value (f midpoint)))
	  (cond ((positive? test-value) 
		 (search f neg-point midpoint))
		((negative? test-value) 
		 (search f midpoint pos-point))
		(else midpoint))))))

(search (lambda (x) (- (* x x) 2)) -4.0 4.0)




;;; What if we would have used functions in place of the let...
;;; Why not "let", haha midpoint be a function? let allows a closer scope?