(define (cont-frac n d k)
  (if (> k max)
      0
      (/ (n k) (+ (d k) (cont-frac n d (+ k 1))))))

(define (one x) 1.0)
(define (dec k) (- k 1))

(define (cont-frac-iter n d k)
  (define (iter n d product k)
    (if (= k 1)
        product
        (iter n
              d
              (/ (n (dec k))
                 (+ (d (dec k))
                    (/ (n k) (d k))))
              (dec k))))
  (iter n d 0 k))
