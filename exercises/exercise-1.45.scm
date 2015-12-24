(load "exercise-1.40.scm")
(load "exercise-1.44.scm")
(define (cube x) (* x x x))
(define (4th-roots x)
  (fixed-point ((repeated average-damp 2) (lambda (y) (/ x (cube y)))) 1.0))

(define (5th-roots x)
  (fixed-point ((repeated average-damp 2) (lambda (y) (/ x (* y y y y)))) 1.0))

(define (nth-roots x n)
  (fixed-point ((repeated average-damp (floor (/ (log n) (log 2))))
                  (lambda (y) (/ x (expt y (- n 1)))))
               1.0))
