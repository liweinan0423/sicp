(define (sqrt x)
    (sqrt-iter 1.0 x))

(define (sqrt-iter guess x)
    (if (good-enough? guess x)
        guess
        (sqrt-iter (improve guess x) x)))

(define (good-enough? guess x)
    (< (abs (- (improve guess x) guess))
       (* 1e-3 guess)))

(define (square x)
    (* x x))

(define (improve guess x)
    (average guess (/ x guess)))

(define (average x y)
    (/ (+ x y) 2))

(display (sqrt 8888888888888))
