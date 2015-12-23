(define (one x) 1.0)
(define (d x)
  (if (= (remainder (+ x 1) 3) 0)
      (* (quotient (+ x 1) 3) 2)
      1))
(define (dec x) (- x 1))

(define (cont-frac n d k)
  (define (iter product k)
    (if (= k 0)
        product
        (iter (/ (n k) (+ (d k) product)) (dec k))))
  (iter (/ (n k) (d k)) (dec k)))

(define (e k)
  (+ (cont-frac one d k) 2))
