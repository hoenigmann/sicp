10

(+ 5 4 3)
;;; To run in the open scheme buffer ctrl-x ctrl-e
;;; ctrl-h then b will show you what the bindings are for the major/minor mode

(define (foo) 2)

(define (foo) 3)

(define (bar) (+ (foo) 2))

(bar)

(and #f (/ 5 0))
;;; difference between macro and a function
;;; macros let you define new control structures and 
;;; lazy evaluation on macros
;;; promise/force

(force (delay (/ 5 0)))

(delay (/ 5 0))
;;; M-( will take care of paren on other side

(define a 3)

(define (a) 4)

(a)

(define (a lambda() 4 ))

(define a 3)
(define b (+ a 1))



