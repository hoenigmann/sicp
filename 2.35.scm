(define (count-leaves tree)
  (accumulate + 0 (map (lambda (sub) 
			 (cond ((null? sub) 0) 
			  ((not (pair? sub)) 1)
			  (else (count-leaves sub)))) tree)))

(define x '(1 (2 (3 (4 (5 (6 7)))))))
(count-leaves x)