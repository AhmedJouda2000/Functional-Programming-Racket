#lang racket

;; Flatten the lists into one list
(define (flatten L)
    (cond  ((null? L) '()      )     
           ((list?(car L))    (append (car L) (flatten (cdr L))  )         )
           (#t (cons (car L) (flatten (cdr L))))
    )
  )

(flatten '( (1 2 3) (a b c)))
(flatten '( a b (c d) e f))


;; Find position(s) where a certain element occurs, N is the position of the first element (0)
(define (positions N A L) 
  (cond ( (null? L)    '()           )
        ( (if (equal? (car L) A) (cons N  (positions (+ N 1) A (cdr L))) (positions (+ N 1) A (cdr L)) ))
        

  )

)

;;Test
(positions 0 'a '(b a a c))



