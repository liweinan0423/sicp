(define (compose f g)
  (lambda (x)
    (f (g x))))
(define (inc x) (+ x 1))

((compose square inc) 6)
;->
((lambda (x) (square (inc x))) 6)
;->
(square (inc 6))
;->
(square 7)
;->
49
