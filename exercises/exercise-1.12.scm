(define (pascal-triangle level place)
  (if (= level 1) 1
      (if (or (= place 1) (= place level)) 1
          (+ (pascal-triangle (- level 1) (- place 1))
             (pascal-triangle (- level 1) place)
          )
      )
  )
)

(display (pascal-triangle 100 20))
