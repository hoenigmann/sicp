
(define (adjoin-position row col safes)
  (cons row safes))

(define (empty-board)
  '())

(define (safe? col positions)
  (define (diag-safe? col positions)
    (let ((first (car positions)))
      (map
       (lambda (x) (= (+  ) (+  ))))))
  (diag-safe? col positions))

(define (queens board-size)
  (define (queen-cols k)
    (if (= k 0)
        (list empty-board)
        (filter
         (lambda (positions) (safe? k positions))
         (flatmap
          (lambda (rest-of-queens)
            (map (lambda (new-row)
                   (adjoin-position new-row
                                    k
                                    rest-of-queens))
                 (enumerate-interval 1 board-size)))  
          (queen-cols (- k 1))))))
  (queen-cols board-size))

(define (flatmap proc seq)
        (accumulate append nil (map proc seq)))

;;; rest-of-queens is a way to place k − 1 queens in the first k − 1 columns
