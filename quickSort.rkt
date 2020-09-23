#lang racket
(define (lowestHalf key L)
    (KeyLessThan key (/ (apply + (map key L)) (length L)) L)
  
 )
  

(define (KeyLessThan key X L)
  (cond ((null? L) L)
        ((< (car (map key L)) X) (cons (car L) (KeyLessThan key X (cdr L)) ))
        (#t (KeyLessThan key X (cdr L)))
  )
  )

(define (highestHalf key L)
    (KeyMoreThan key (/ (apply + (map key L)) (length L)) L)
  
 )
  

(define (KeyMoreThan key X L)
  (cond ((null? L) L)
        ((>= (car (map key L)) X) (cons (car L) (KeyMoreThan key X (cdr L)) ))
        (#t (KeyMoreThan key X (cdr L)))
  )
  )


(define quickSort
   (lambda(key L)   
     (cond(  (null? L)                         L                           )
          (  (null? (cdr L))                   L                           )
          (  #t           (helper key  (quickSort key (lowestHalf key L))
                                      (quickSort key (highestHalf key L))  )    )
   )
 )
)

(define helper
   (lambda( key S1 S2)
      (cond(  (null? S1)         S2                               )
           (  (null? S2)         S1                               )
           (  (< (key (car S1)) (key (car S2)))
                       (cons (car S1) (helper key (cdr S1) S2))    )
           (   #t      (cons (car S2) (helper key S1 (cdr S2)))    )
       )
    )
)

(define firstHalf
   (lambda(L)
      (cond( (null?  L  )                 '()                )
           ( (null?  (cdr L))              L                 )
           ( #t   (cons (car L) (firstHalf (cdr (cdr L))))   )
  )))

(define secondHalf
  (lambda(L)    (firstHalf (cdr L))))


