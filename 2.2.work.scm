
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



