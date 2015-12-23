(define (average x y)
  (/ (+ x y) 2))

; square root by Newton's method
(define (sqrt1 x)
  (define (sqrt-iter guess x)
    (if (good-enough? guess x)
        guess
        (sqrt-iter (improve guess x) x)))
  (define (good-enough? guess x)
    (< (abs (- (square guess) x)) 0.001))
  (define (improve guess x)
    (average guess (/ x guess)))
  (sqrt-iter 1.0 x))

;square root by fixed point
(define tolerance 1e-5)
(define (fixed-point f first-guess)
  (define (close-enough? v1 v2)
    (< (abs (- v1 v2)) tolerance))
  (define (try guess)
    (let ((next (f guess)))
      (if (close-enough? guess next)
          next
          (try next))))
  (try first-guess))

(define (sqrt2 x)
  (fixed-point (lambda (y) (average y (/ x y))
               1.0)))

; square root by average damping
(define (average-damp f)
  (lambda (x) (average x (f x))))

(define (sqrt3 x)
  (fixed-point (average-damp (lambda (y) (/ x y)))
               1.0))

(define (cube-root x)
  (fixed-point (average-damp (lambda (y) (/ x (square y))))
               1.0))
; generalized Newton's method
(define (deriv g)
  (define dx 1e-5)
  (lambda (x)
    (/ (- (g (+ x dx)) (g x)) dx)))

(define (newton-transform g)
  (lambda (x)
    (- x
       (/ (g x)
          ((deriv g) x)))))
(define (newtons-method g guess)
  (fixed-point (newton-transform g) guess))

; square root by generalized newton's method
(define (sqrt4 x)
  (newtons-method (lambda (y) (- (square y) x))
                  1.0))
; TODO
