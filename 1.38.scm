(load "1.37.scm")

(define (euler-term i)
 (cond ((= i 1) 2)
       ((= (modulo (- i 1) 3) 1) (+ (* (/ i 3) 2) 2))
       (else 1)) )
(+ 2 (cont-frac (lambda (x) 1.0) euler-term 30))

;;( 1 2 1 1 4 1 1 6 1 1  8  1  1 10  1  1 12)
;;  0 1 2 3 4 5 6 7 8 9 10 11 12 13 14 15 16