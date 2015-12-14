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
  (define h (/ (- b a) n))
  (* (sum (lambda (k)
         (cond ((= k 0) (f (+ a (* k h))))
               ((and (odd? k) (> k 0)) (* 4 (f (+ a (* k h)))))
               (else (* 2 (f (+ a (* k h)))))
         )
       )
       0
       inc
       n
     )
     (/ h 3)
  )
)
