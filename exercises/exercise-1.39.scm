
(define (dec x) (- x 1))


(define (cont-frac-iter n d k)
  (define (iter product k)
    (if (= k 0)
        product
        (iter (/ (n k) (+ (d k) product)) (dec k))))
  (iter (/ (n k) (d k)) (dec k)))

(define (tan-cf x k)
  (define (n k)
    (if (= k 1) x (- (* x x))))
  (define (d n) (- (* 2.0 n) 1))
  (cont-frac-iter n d k))
