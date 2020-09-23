#lang racket

;; (removeFirst A L)

(define removeFirst
  (lambda ( A L)
    (cond  ((null? L)                   '()                    )
           ((equal?  A (car L))      (cdr L)                   )
           ( #t                    (cons (car L) (removeFirst A (cdr L))))
    )
    )
  )

;; (remove A L)

(define remove
  (lambda (A L)
    (cond   ((null? L)             '()            )
            ((equal? A(car L))     (remove A (cdr L)))
            ( #t                   (cons (car L)(remove A (cdr L))))
     )
   )
 )

;; (removeAll A L)

(define removeAll
  (lambda (A L)
    (cond   ((null? L)     '()                )
           
            
             ((list? (car L))       (cons (removeAll A (car L))(removeAll A (cdr L))))
             ((equal? A(car L))     (removeAll A (cdr L)))
            (#t                     (cons (car L)(removeAll A (cdr L))))
     )
    )
  )
             

