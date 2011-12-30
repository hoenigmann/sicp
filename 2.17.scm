(define (last-pair items)
  (if (null? (cdr items))
      items
      (last-pair (cdr items))))

(last-pair (list 1 3 4))
(last-pair (list 1))
