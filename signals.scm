(define (filter predicate sequence)
     (cond ((null? sequence) nil)
           ((predicate (car sequence))
            (cons (car sequence)
                  (filter predicate (cdr sequence))))
           (else (filter predicate (cdr sequence)))))

(define (accumulate op initial sequence)
     (if (null? sequence)
         initial
         (op (car sequence)
             (accumulate op initial (cdr sequence)))))

(define (map proc items)
  (if (null? items)
      '()
      (cons (proc (car items)) (map proc (cdr items)))))

(define (enumerate-interval low high)
      (if (> low high)
          nil
          (cons low (enumerate-interval (+ low 1) high))))

(define (enumerate-tree tree)
      (cond ((null? tree) nil)
            ((not (pair? tree)) (list tree))
            (else (append (enumerate-tree (car tree))
                          (enumerate-tree (cdr tree))))))

;;; Maybe append should be placed here as well?
;;; No, append is a special case of accumulate, where initial is the list to append to, and sequence is the list of items to be appended to initial.
;;; Exercise 2.33 confirms the append can be defined in terms of accumulate.