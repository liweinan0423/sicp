(define (count-change amount)
    (cc amount 5))

(define (cc amount kinds-of-coins)
  (cond ((= amount 0) 1)
        ((or (< amount 0) (= kinds-of-coins 0)) 0)
        (else (+ (cc amount (- kinds-of-coins 1))
                 (cc (- amount (value-of-first-kinds-of-coin kinds-of-coins)) kinds-of-coins)
              )

        )
  )
)

(define (value-of-first-kinds-of-coin kinds-of-coin)
    (cond ((= kinds-of-coin 1) 1)
          ((= kinds-of-coin 2) 5)
          ((= kinds-of-coin 3) 10)
          ((= kinds-of-coin 4) 25)
          ((= kinds-of-coin 5) 50)))

(display (count-change 11))
