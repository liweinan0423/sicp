(load "common.scm")
(define (make-segment start end)
  (cons start end))
(define (start-point segment)
  (car segment))
(define (end-point segment)
  (cdr segment))

(define (make-point x y)
  (cons x y))

(define (x point)
  (car point))

(define (y point)
  (cdr point))

(define (print-point point)
  (newline)
  (display "(")
  (display (x point))
  (display ",")
  (display (y point))
  (display ")"))

(define (mid-point segment)
  (make-point (average (x (start-point segment)) (x (end-point segment)))
              (average (y (start-point segment)) (y (end-point segment)))))
