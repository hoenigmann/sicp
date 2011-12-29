;;; 1.16 
(define (identity x))
(define (expt b n)
  (if (= n 0)
      1
      (* b (expt b (- n 1)))))

(expt 2 5)

(define (even? n)
  (= (remainder n 2) 0))

(define (fast-expt b n a)
  (cond ((= n 0) a)
	((even? n) (fast-expt (* b b) (/ n 2) a))
            (else (fast-expt b (- n 1) (* a b)))))

(fast-expt 3 4 1)
(fast-expt 2 5 1)