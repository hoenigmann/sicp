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

(define x (make-mobile 4 5))

(left-branch x)
(right-branch x)

