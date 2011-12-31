(load "2.17.scm")
(define (reverse items)
  (if (null? (cdr items))
      (car items)
      (cons (reverse (cdr items)) (car items))))

(reverse (list 1 3 4 5))
;;;  (((5 . 4) . 3) . 1) 
;;; This result is instructive, why the dots?
;;; How would you cons the reverse mechanically?
(cons 5 (cons 4 (cons 3 (cons 1 '() ))))

;;; Second attempt:
(define (reverse items)
  (if (null? (cdr items))
      (cons (car items) '() )
      (cons (car items) (reverse (cdr items)))))


;;; Third attempt:
(define (reverse items)
  (define (rev-iter items new)
    (if (null? items)
	new
	(rev-iter (cdr items) (cons (car items) new) )))
  (rev-iter items '()))

(reverse (list 1 2 3))
(reverse (list 1))