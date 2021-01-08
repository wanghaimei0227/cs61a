(define (split-at lst n)
  (define (get-first lst n)
    (if (or (eq? lst nil) (= n 0))
        nil
        (cons (car lst) (get-first (cdr lst) (- n 1)))))
  (define (get-rest lst n)
    (cond 
      ((eq? lst nil) nil)
      ((= n 0)       lst)
      (else          (get-rest (cdr lst) (- n 1)))))
  (cons (get-first lst n) (get-rest lst n)))

(define (compose-all funcs)
  (define (composed n)
      (cond
          ((null? funcs) n)
          (else (define n ((car funcs) n)) (set! funcs (cdr funcs)) (composed n)))
    )
  composed)
