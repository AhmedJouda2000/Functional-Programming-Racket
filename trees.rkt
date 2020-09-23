#lang racket

;; double recursion involves 'traversing' lists with sublists, which we can 
;; see as trees.  

(define flat   '(  this is a flat list)   )

(define tree  '(   this is a (very ( very ( very ) ) ) deep list ) )

(define binaryTree '(   (  (a b) (c d) ) ( (e f) (g h) )  ) )



;; some doubly-recursive functions:

;; add up ALL the numbers in the list (no matter how "deep" the number is).
;;   ( addAll   L) 

(define addAll
  (lambda(L) 
     (cond   ( (null? L)                            0                      )
             ( (list? (car L))  (+ (addAll (car L)) (addAll (cdr L)))      )
             ( #t                (+ (car L) (addAll (cdr L))  )            ) 
     ) 
  )
)

;; every double recursion has a case where we ask whether the first element
;; is a list itself.  




;; more complicated: find the maximum depth of a given list.
;; can you figure out where the + 1 comes from here?  

(define max_depth
    (lambda(L) 
       (cond   (   (null? L)                         0                )
               (   (list? (car L)) (max (+ 1 (max_depth (car L)))
                                        (max_depth (cdr L)) )         )
               (   #t                         (max_depth (cdr L))     )
       )
    )
)




;; write a function member*: given an element E and a list  L
;; (with sublists etc), member* returns #t if E is anywhere in L
;; (even in sublists).

;;          E   L
;; (member* 'a '( b c (d (e a)) ) )
;;  #t

(define member*
   (lambda(E L)
      (cond      (   (null? L)                #f                  )
                 (   (equal? (car L) E)       #t                  )
                 (   (list? (car L))  (or (member* E (car L)) 
                                          (member* E (cdr L)))    )
                 (   #t                    (member* E (cdr L))    )
      )
    )
)

;; countAll - counts all 'elements' (not lists) that are in a list
;; even including sublists.  '() is not counted as anything.
;; here's an example of calling countAll:
 
;; (define test1  '( 1 2 (3 4 (5 6)) (7 (8 (9)))) )
;; (countAll test1)
;; 9

;;base case, double recursion case, single recursion case

(define countAll
   (lambda(L)
     (cond   (  (null? L)                          0                        )
             (  (list? (car L))  (+ (countAll (car L)) (countAll (cdr L)))  )
             (  #t                         (+ 1 (countAll (cdr L)))         )
     )
   )
)
