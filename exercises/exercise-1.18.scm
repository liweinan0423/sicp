(define (fast-multiply a b)
  (fast-multiply-iter a b 0)
)

(define (fast-multiply-iter a b x)
  (cond
    ((= b 1) (+ a x))
    ((even? b) (fast-multiply-iter (double a) (half b) x))
    (else (fast-multiply-iter a (- b 1) (+ a x)))
  )
)

(define (double n)
  (+ n n)
)

(define (half n)
  (/ n 2)
)




(display (fast-multiply 5 7))
