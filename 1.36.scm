(define (fixed-point f first-guess)
  (define (close-enough a b)
    (< (abs (- a b)) 0.00000001))

  (define (try guess)
    (display guess)
    (newline)
    (let ((next (f guess)))
      (if (close-enough guess next)
	  guess
	  (try next))))
  (try first-guess)
)

(fixed-point (lambda (x)
	       (/
		(/ (log 1000) (log 10))
		(/ (log x) (log 10))))
	     1.1)

(fixed-point (lambda (x)
	       (/
		(+ x
		   (/
		    (/ (log 1000) (log 10))
		    (/ (log x) (log 10))))
		2)) 
	     1.1)

(* 4.555 4.5 4.555 4.555 2.13)
(* 2.129 2.129)
;;; 905. close enough ?