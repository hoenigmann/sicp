(define (map proc items)
  (if (null? items)
      '()
      (cons (proc (car items)) (map proc (cdr items)))))


;;; map abstracts the idea of performing something to every item in a list. Or, to every sub structure in the list, if the function
;;; passed to map accounts for and has knowledge of the sub structure.
