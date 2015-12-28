(define (cons a b)
  (* (expt 2 a) (expt 3 b)))

(define (iter x counter divider)
  (if (= (remainder x divider) 0)
      (iter (quotient x divider) (+ counter 1) divider)
      counter))

(define (car z)
  (iter z 0 2))

(define (cdr z)
  (iter z 0 3))
