(define (cont-frac n d k)
  (define (internal i)
    (if (> i k)
        0
        (/ (n i)
           (+ (d i)
              (internal (+ i 1))))))
  (internal 1))

(define (one x) 1.0)
(define (dec k) (- k 1))

(define (cont-frac-iter n d k)
  (define (iter product k)
    (if (= k 0)
        product
        (iter (/ (n k) (+ (d k) product)) (dec k))))
  (iter (/ (n k) (d k)) (dec k)))
