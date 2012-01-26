(define nil '())

(define (fold-left op initial sequence)
  (define (iter rest new)
    (if (null? rest)
	new
	(iter (cdr rest) (op new (car rest)))))
  (iter sequence initial))

(define test-list (list 1 2 3 4))

(fold-left list nil test-list)



;;; fold-right combines the first element with the result of elements to the right.
;;; fold-left  combines elements working in the opposite direction.

;;; Give a property that op should satisfy so that fold-left and fold-right will produce the same
;;; value for any sequence.

;;; (op b a) = (op a b)  associative property.