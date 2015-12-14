(define (smallest-divisor n)
  (find-smallest-divisor n 2)
)

(define (find-smallest-divisor n test-divisor)
  (cond
    ((> (square test-divisor) n) n)
    ((divides? test-divisor n) test-divisor)
    (else (find-smallest-divisor n (next test-divisor)))
  )
)

(define (next n)
  (if (= n 2)
      3
      (+ n 2)
  )
)

(define (square n)
  (* n n)
)

(define (divides? test-divisor n)
  (= 0 (remainder n test-divisor))
)


(define (prime? n)
  (= (smallest-divisor n) n)
)

(define (timed-prime-test n)
  (start-prime-test n (runtime))
)

(define (start-prime-test n start-time)
  (if (prime? n)
      (report-time n (- (runtime) start-time))
  )
  (prime? n)
)

(define (report-time n elapsed-time)
  (newline)
  (display n)
  (display "***")
  (display elapsed-time)
)


(define (search-for-primes start end limit)
  (search-for-primes-with-limit start end 0 limit)
)

(define (search-for-primes-with-limit start end found limit)
  (if (= found limit) (and (newline) (display "done"))
      (if (timed-prime-test start) (search-for-primes-with-limit (next-odd start) end (+ found 1) limit)
          (search-for-primes-with-limit (next-odd start) end found limit)
      )
  )
)

(define (next-odd n)
  (if (odd? n)
      (+ n 2)
      (+ n 1)
  )
)
