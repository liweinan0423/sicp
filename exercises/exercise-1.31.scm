; recursive product
(define (product term a next b)
  (if (> a b)
      1
      (* (term a) (product term (next a) next b))))

(define (factorial n)
  (product as-is 1 inc n))

(define (as-is x) x)
(define (inc n) (+ n 1))

;; approximating Pi
; pi/4 = (2/3)*(4/3)*(4/5)*(6/5)*(6/7)*(8/7)...

(define (pi n product-procedure)
  (define (pi-term k)
    (/ (* (* 2 k)
          (+ (* 2 k) 2))
               (square (+ (* 2 k) 1))))
  (* (product-procedure pi-term 1 inc n) 4.0))

; iterative product
(define (product-iter term a next b)
  (define (iter a product)
    (if (> a b)
        product
        (iter (next a) (* product (term a)))))
  (iter a 1))
