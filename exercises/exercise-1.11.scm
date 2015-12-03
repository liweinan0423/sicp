; f(n) = n if n < 3
; f(n) = f(n-1) + 2f(n-2) + 3f(n-3) if n >=3

; Recursive Prodecure

(define (f-recursive n)
  (if (< n 3) n
      (+ (f-recursive (- n 1))
         (* 2 (f-recursive (- n 2)))
         (* 3 (f-recursive (- n 3)))
      )
  )
)


(define (f-iterative n)
  (if (< n 3) n
    (f-internal 2 1 0 n)
  )
)

(define (f-internal a b c counter)
  (if (= counter 0) c
      (f-internal (+ a (* 2 b) (* 3 c))
                 a
                 b
                 (- counter 1)
      )
  )
)
