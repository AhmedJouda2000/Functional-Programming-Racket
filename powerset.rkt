#lang racket
(define consToAll (lambda (e L)
(if (null? L) L
(cons
(cons e (car L))
(consToAll e (cdr L)))
)
))


(define (powerset set)
(if (null? set) '(())
(append (powerset (cdr set)) (consToAll (car set)

(powerset (cdr set)))

)
)
)