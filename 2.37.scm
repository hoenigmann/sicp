(define (accumulate op initial sequence) 
  (if (null? sequence) 
      initial 
      (op (car sequence) 
	  (accumulate op initial (cdr sequence))))) 

(define (accumulate-n op init sequence) 
  (define nil '()) 
  (if (null? (car sequence)) 
      nil 
      (cons (accumulate op init (map car sequence)) 
	    (accumulate-n op init (map cdr sequence))))) 


(define (dot-product v w)
  (accumulate + 0 (map * v w)))

(define (matrix-*-vector m v)
  (map (lambda (x) (dot-product x v)) m))

(define (transpose m)
  (accumulate-n cons '() m))

(define (matrix-*-matrix m n) 
  (let ((cols (transpose n)))
    (map (lambda (x) matrix-*-vector m x) cols)))


(define matrix1 (list (list 1 2) (list 1 2) (list 1 2) (list 1 2)))
(matrix-*vector matrix1 (list 3 4))

(matrix-*-matrix matrix1 matrix1)

(transpose matrix1)
