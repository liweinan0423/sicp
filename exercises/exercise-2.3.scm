(load "exercise-2.2.scm")

; first representation
(define (make-rect length width) (cons length width))
(define (length rect) (car rect))
(define (width rect) (cdr rect))

; second representation
(define (make-rect2 upper-left bottom-right) (cons upper-left bottom-right))
(define (upper-left rect) (car rect))
(define (bottom-right rect) (cdr rect))
(define (length2 rect) (abs (- (x (bottom-right rect)) (x (upper-left rect)))))
(define (width2 rect) (abs (- (y (bottom-right rect)) (y (upper-left rect)))))

(define (perimeter rect length width)
  (* 2 (+ (length rect) (width rect))))

(define (area rect length width)
  (* (length rect) (width rect)))
