;; (define (same-parity first . rest)
;;   ...)

;;; Recursive iteration with reverse
(define (same-parity first . rest)
  (define even? (lambda (x) (= (remainder x 2) 0)))
  (define odd? (lambda (x) (= (remainder x 2) 1)))
  (define pick? (if (even? first)
		    even?
		    odd?))
  (let iter ((rest (cons first rest)))
    (if (null? rest)
	'()
	(if (pick? (car rest))
	    ;; O(n^2):
	    ;;(iter (cdr rest) (cons acc-same (car rest)))
	    ;;(iter (cdr rest) (cons (car rest) acc-same))
	    ;;(iter (cdr rest) acc-same)
	    ;; Recursive "cons" call.
	    (cons (car rest) (iter (cdr rest)))
	    (iter (cdr rest))))))
(same-parity 1 2 3 4 5)

(define (same-parity first . rest)
  (define even? (lambda (x) (= (remainder x 2) 0)))
  (define odd? (lambda (x) (= (remainder x 2) 1)))
  (define pick? (if (even? first)
		    even?
		    odd?))
  ;; O(n)
  (let iter ((rest rest)
	     (acc-same (list first)))
    (if (null? rest)
	;; O(2n) = O(n)
	(reverse acc-same)
	(iter (cdr rest)
	      (if (pick? (car rest))
		  ;; O(1)
		  (cons (car rest) acc-same)
		  acc-same)))))
;;; (cons 3 (cons 1 ()'))

(trace same-parity)
(same-parity 1 2 3)

;;; Quasiquote
(let ((letter 'x))
  ;; => (a b c x y z)
  `(a b c ,letter y z))

;;; Quoting symbols
(let ((letter 'x))
  ;; => (a b c x y z)
  (list 'a 'b 'c letter 'y 'z))

;;; Regular quotes
(let ((letter 'x))
  ;; => (a b c letter y z)
  '(a b c letter y z))
