(define (f g)
  (g 2))

;then
;(f f) => (f 2) => (2 2) => error! 2 is not a procedure
