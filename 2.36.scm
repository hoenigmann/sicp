(load "accumulate-book.scm")

(define (accumulate-n op init seqs)
  (if (null? (car seqs)) 
      '()
      (cons (accumulate-book op init (map car seqs))
	    (accumulate-n op init (map cdr seqs)))))