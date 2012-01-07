(define (make-mobile left right)
  (list left right))

;;; A branch is constructed from a length (which must be a number) together with
;;; a structure, which may be either a number (repre-senting a simple weight) or
;;; another mobile:
(define (make-branch length structure)
  (list length structure))

;;; Left branch and Right branch selector
(define (left-branch branch)
  (car branch))
(define (right-branch branch)
  (cadr branch))
(define (branch-length x)
  (car x))
(define (branch-structure x)
  (cadr x))
(define x (make-mobile 4 5))

(left-branch x)
(right-branch x)
(define (is-mobile? structure)
  (pair? structure))
(define (total-weight mobile)
  (let ((left (branch-structure (left-branch mobile)))
	(right (branch-structure (right-branch mobile))))
    (+ 	(if (is-mobile? left)
	    (total-weight left)
	    left)
	(if (is-mobile? right)
	    (total-weight right)
	    right))))

(define (balanced? mobile)
  (let ((left (branch-structure (left-branch mobile)))
	(right (branch-structure (right-branch mobile)))
	(left-length (branch-length (left-branch mobile)))
	(right-length (branch-length (right-branch mobile))))
    (and (=	(* left-length 
		   (if (is-mobile? left)
		       (total-weight left)
		       left))
		(* right-length
		   (if (is-mobile? right)
		       (total-weight right)
		       right)))
	 (if (is-mobile? left)
	     (balanced? left)
	     #t)
	 (if (is-mobile? right)
	     (balanced? right)
	     #t))))


(define branch (make-branch 5 4))
(define mobile (make-mobile branch branch))
(define branch-with-mobile (make-branch 6 mobile))

(define mob1 (make-mobile branch branch-with-mobile))
(define mob2 (make-mobile branch-with-mobile branch))
(define branch1 (make-branch 3 mob2))
(define branch2 (make-branch 3 mob2))

(define root (make-mobile branch1 branch2))
(total-weight root)
(balanced? root)
(balanced? mobile)
(balanced? mob2)