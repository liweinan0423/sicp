(define dx 1e-5)
(define (smooth f)
  (lambda (x)
    (average (f (- x dx)) (f x) (f (+ x dx)))))
(define (n-fold-smooth f n)
  ((repeated smooth n) f))

(define (repeated f n)
  (if (= n 1)
      f
      (compose f (repeated f (- n 1)))))
(define (compose f g)
  (lambda (x)
    (f (g x))))
