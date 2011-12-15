(load "square.scm")

(define (inc x)
  (+ x 1))

(define (accumulate combiner null-value term a next b)
  (if (> a b)
      null-value
      (combiner
       (term a)
       (accumulate combiner 1 term (next a) next b))
))


(define (product term a next b)
  (accumulate * 1 term a next b))

(accumulate * 1 square 1 inc 3)
(product square 2 inc 3)

(define (accumulate-iterative combiner null-value term a next b)
  (define (iter a result)
    (if (> a b)
	result
	(iter (next a) (combiner (term a) result))
	)
    )
  (iter a null-value)
)

(accumulate-iterative + 0 square 1 inc 3)
(define (sum term a next b)
  (accumulate-iterative + 0 term a next b))

(sum square 1 inc 4)