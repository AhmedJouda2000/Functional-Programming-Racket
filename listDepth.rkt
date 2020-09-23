#lang racket
;;2018/19 q4

;;toDepth N L - returns all things in list L that are at depth N or lower, where N=0 is top level of list.
;;base cases:
;;if L is empty then asnwer is '()
;;if N<0 returns '()

;;recursive call + make argument smaller
;;(toDepth N (cdr L))...pretend this works
;; suppose L =  ‘( (a b) (c (d (e))) f)
;;(cdr L) =  ‘((c (d (e))) f) and so (toDepth 1 (cdr L)) = ( (c) f)
;;but I want ‘( (a b) (c) f )

;;so I want to get (toDepth (- N 1) (car L))
;; so (cons (toDepth (- N 1) (car L)) (toDepth N (cdr L)))
;;but this assumes car L is a list..if its not a list?
;;if depth boundary is >0 and car L is not a list, then we just include car L in the answer = (cons (car L) (toDepth N (cdr L))




(define toDepth
  (lambda(N L)
    (cond ( (null? L)      '()        )
          ( (< N 0)        '()        )
          ( (list? (car L))   (cons (toDepth (- N 1) (car L)) (toDepth N (cdr L)))       )
          ( #t    (cons (car L) (toDepth N (cdr L))   ))
    )
  )
)