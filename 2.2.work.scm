
(define nil '())
(define one-to-four (cons 1 
       (cons 2
	     (cons 3
		   (cons 4 nil)))))

(define list-to-four (list 1 2 3 4))

list-to-four
one-to-four

(equal? list-to-four one-to-four)
;;; why #f?


(define (list-ref items n)
  (if (= n 0)
      (car items)
      (list-ref (cdr items) (- n 1))))

(define squares (list 1 4 9 16 25))

squares
(car squares)
(car (list 1 2 3))
(list-ref squares 3)
car
(caddr squares)
(ge (extend-top-level-environment system-global-environment))
(exit)

(define (length items)
  (if (null? items)
      0
      (+ 1 (length (cdr items)))))

(define (length items)
  (define (iter items count)
    (if (null? items)
	count
	(iter (cdr items) (+ count 1))))
  (iter items 0))
(length squares)

(define (same-parity . z)
  (display z)
  (newline)
  (let (
	(even (lambda (x) (= (remainder x 2) 0)))
	(odd (lambda (x) (= (remainder x 2) 1)))
	(iter (lambda (pick rest new) 
		(cond ((pick (car rest)) (iter pick (cdr rest) (cons new (car rest))))
		      (else (iter pick (cdr rest) new))))))
    (cond ((null? z) z)
	  ((even (car z)) (iter even z '() ))
	  (else (iter odd z '())))))

(RESTART 1)
(same-parity 1 2 3)

(define (same-parity . z)
  (display z)
  (newline)
  (let (
	(even (lambda (x) (= (remainder x 2) 0)))
	(odd (lambda (x) (= (remainder x 2) 1))))
    (define iter (lambda (pick rest) 
		(cond ((null? rest) '() )
		      ((pick (car rest)) (cons (car rest) (iter pick (cdr rest))))
		      (else (iter pick (cdr rest))))))
    (cond ((null? z) z)
	  ((even (car z)) (iter even z))
	  (else (iter odd z)))))

(RESTART 1)
(same-parity 1 2 3)