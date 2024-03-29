(define (cube-root x)
    (cube-root-iter 1.0 x))

(define (cube-root-iter guess x)
    (if (good-enough? guess x)
        guess
        (cube-root-iter (improve guess x) x)))

(define (good-enough? guess x)
    (< (abs (- guess (improve guess x))) (* 1e-10 guess)))

(define (improve guess x)
    (/ (+ (/ x
             (* guess
                guess))
          (* 2
             guess))
       3))

(display (cube-root 888))

