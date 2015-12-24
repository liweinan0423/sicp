(define (double f)
  (lambda (x)
    (f (f x))))

(define (inc x)
  (+ x 1))

(((double (double double)) inc) 5)

(double (double double))
;->
(double
  (lambda (x) (double (double x))))
;->
(lambda (x)
  ((lambda (x) (double (double x))) ((lambda (x) (double (double x))) x)))
;->
((double (double double)) inc)
;->
((lambda (x) (double (double x))) ((lambda (x) (double (double x))) inc))
;->
((lambda (x) (double (double x))) (double (double inc)))
;->
(double (double (double (double inc))))
;->
(inc (inc (inc (inc (inc (inc (inc (inc (inc (inc (inc (inc inc (inc (inc (inc 5)))))))))))))))
;->
21
