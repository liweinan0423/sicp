(define (fast-expt-iter b n a)
  (cond
    ((= n 0) a)
    ((even? n) (fast-expt-iter (square b) (/ n 2) a))
    (else (fast-expt-iter b (- n 1) (* a b)))
  )
)

(define (square x) (* x x))
(define (even? x) (= 0 (remainder x 2)))
(define (remainder x y) (mod x y))

(define (fast-expt b n)
  (fast-expt-iter b n 1)
)

(define (fast-expt2 b n)
  (cond
    ((= n 1) b)
    ((even? n) (fast-expt2 (square b) (/ n 2)))
    (else (* b (fast-expt2 b (- n 1))))
  )
)
