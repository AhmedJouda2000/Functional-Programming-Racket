#lang racket
;; 2016/17 q1
;; What are the base cases?
;; if lists are empty then reutrns empty list
;; if list has 1 number then returns an empty list (no diffs available)

;;recursive case: have to call the function (diffs X) in the recursive case + input has to be smaller than list L that I got.
;; Ill try (diffs (cdr L)) -- >( diffs ‘(1 3 4 1 2) ) then (diffs (cdr L)) returns '(3 4 1 2)
;;pretend the funtion works  and the recusive call gives (-1 3 -1)
;; what I want is (-2 -1 3 -1). Where the first number (-2) is equal to the difference between the 1st 2 elements in L = (-2 = 1 -3)
;;so if I do this recursive call (diffs(cdr L)) and I cons onto that (- (car L) (car cdr L))) - the difference of the 1st 2 numbers and then I get the full answer

(define diffs
  (lambda(L)
    (cond( (null? L)      '()     )
         ( (null? (cdr L)) '()     )
         ( #t (cons (- (car L) (car (cdr L)))  (diffs (cdr L))  )

     )
   )
  ))
 

