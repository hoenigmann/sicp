(define (deep-reverse items)
  (define (rev-iter items new)
    (cond ((null? items) new)
	  ((not (pair? (car items))) (rev-iter (cdr items) (cons (car items) new)))
	  (else (rev-iter (cdr items) (cons (rev-iter (car items) '()) new)))))
  (trace rev-iter)
  (rev-iter items '()))

(reverse (list 1 2 3))
(reverse (list 1))

(define x (list (list 1 2) (list 3 4)))
   x

(trace reverse)
(deep-reverse x)





