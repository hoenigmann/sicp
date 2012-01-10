(load "signals.scm")
(define (map p sequence)
  (accumulate (lambda (x y) (cons (p x) y)) '() sequence))

(define (append seq1 seq2) (accumulate cons seq2 seq1))
(define (length sequence) 
  (accumulgate (lambda (x y) (+ 1 y)) 0 sequence))

(define z (list 1 2 3))
(define incra (lambda (x) (+ x 1)))

(map incra z)
(append z z)
(length z)