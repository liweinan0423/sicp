(define tolerance 1e-6)
(define (average x y) (/ (+ x y) 2))

(define (iterative-improve good-enough? improve)
  (define (iter guess)
    (if (good-enough? guess)
        guess
        (iter (improve guess))))
  iter)

(define (sqrt x)
  (define (good-enough? guess)
    (< (abs (- (improve guess) guess)) (* guess tolerance)))
  (define (improve guess)
    (average guess (/ x guess)))
  ((iterative-improve good-enough? improve) 1.0))


(define (fixed-point f start-point)
  (define (good-enough? guess)
    (< (abs (- guess (f guess))) tolerance))
  (define (improve guess)
    (f guess))
  ((iterative-improve good-enough? improve) start-point))

(define (average-damp f)
  (lambda (x) (average x (f x))))

(define (sqrt2 x)
  (fixed-point (average-damp (lambda (y) (/ x y))) 1.0))
