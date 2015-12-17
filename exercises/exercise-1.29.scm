(define (integral f a b dx)
  (define (add-dx x) (+ x dx))
  (* (sum f (+ a (/ dx 2.0)) add-dx b) dx)
)

(define (sum term a next b)
  (if (> a b)
      0
      (+
        (term a)
        (sum term (next a) next b)
      )
  )
)

(define (as-is x) x)
(define (inc n
  ) (+ n 1))


(define (simpson-integral f a b n)
  (define h (/ n (- b a)))
  (define (y k) (f (+ a (* k h))))
  (define (simpson-term k)
    (lambda (k)
           (cond ((or (= k n) (= k 0)) (y k))
                 ((and (odd? k) (> k 0)) (* 4 (y k)))
                 (else (* 2 (y k))))))
  (* (/ h 3.0) (sum simpson-term 0 inc n)))
