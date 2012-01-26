(define nil '())

(define (accumulate op initial sequence)
  (if (null? sequence)
      initial
      (op (car sequence) (accumulate op initial (cdr sequence)))))

(define (fold-right op initial sequence)
  (accumulate op initial sequence))

(define (fold-left op initial sequence)
  (define (iter rest new)
    (if (null? rest)
	new
	(iter (cdr rest) (op new (car rest)))))
  (iter sequence initial))

(define test-list (list 1 2 3 4))

(fold-right list nil test-list)
(fold-left list nil test-list)

test-list
(define (reverse sequence)
  (fold-right (lambda (x y) (append y (list x))  ) nil sequence))

(define (reverse sequence)
  (fold-left (lambda (x y) (cons y x)) nil sequence))
(reverse test-list)