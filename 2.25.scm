;;; 2.25 Exercise
(define list225 (list 1 3 (list 5 7) 9))
(car (cdr (car (cdr (cdr list225)))))
(define list225listoflist (list (list 7)))
(car (car list225listoflist))
(define list225lists (list 2 (list 3 (list 4 (list (list 6 7))))))
(car (cdaadr (cadadr list225lists)))