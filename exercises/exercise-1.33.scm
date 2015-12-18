(load "./exercise-1.21-23.scm")

(define (inc n) (+ n 1))
(define (identity x) x)

(define (filtered-accumulate combiner null-value term a next b filter)
  (if (> a b)
      null-value
      (if (filter a)
          (combiner (term a)
                    (filtered-accumulate combiner null-value term (next a) next b filter))
          (filtered-accumulate combiner null-value term (next a) next b filter))))

(define (sum-of-square-of-prime a b)
  (filtered-accumulate + 0 square a identity b prime?))

(define (product-of-relative-prime n)
  (filtered-accumulate * 1 identity 1 inc (- n 1) (lambda (i) (= (gcd i n) 1))))
