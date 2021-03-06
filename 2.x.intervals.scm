(define (make-interval x y)
	(cons x y))

(define (lowerbound interval)
	(car interval))

(define (upperbound interval)
	(cdr interval))

(define (add-interval x y)
     (make-interval (+ (lower-bound x) (lower-bound y))
                    (+ (upper-bound x) (upper-bound y))))

(define (mul-interval x y)
     (let ((p1 (* (lower-bound x) (lower-bound y)))
     	   (p2 (* (lower-bound x) (upper-bound y)))
           (p3 (* (upper-bound x) (lower-bound y)))
           (p4 (* (upper-bound x) (upper-bound y))))
       (make-interval (min p1 p2 p3 p4)
                      (max p1 p2 p3 p4))))

(define (div-interval x y)
     (mul-interval x
                   (make-interval (/ 1.0 (upper-bound y))
                                  (/ 1.0 (lower-bound y)))))
(define (sub-interval x y)
	(make-interval
	(- (lowerbound x) (upperbound y))
	(- (upperbound x) (lowerbound y))
	))

;;;2.9
x1 + y1 = a1
x2 + y2 = a2
a2 - a1 = y2 + y1 - (x2 + x1)
(a2 - a1)/2 =  (x1 + y1)/2 - (x2 + y2)/2




