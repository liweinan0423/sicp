; let -(a, b) = (-b, -a)
; then x - y = x + (-y)
; [a, b] - [c, d] = [a, b] + [-d, -c] = [a - d, b - c]
(define (sub-interval x y)
  (make-interval (- (lower-bound x) (upper-bound y))
                 (- (upper-bound x) (lower-bound y))))
