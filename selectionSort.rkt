#lang racket
(define minKey(lambda(key L)
(cond
((null? (cdr L)) (car L))
((<=(key (car L))
(key (minKey key (cdr L)))) (car L))
(#t (minKey key (cdr L))) )))

(define removeFirst (lambda(A L)
(cond
((null? L ) '() )
((equal? A (car L)) (cdr L))
(#t (cons (car L) (removeFirst A (cdr L))))
)
))

(define removeMinKey (lambda( key L)
(removeFirst(minKey key L) L)
))

(define selectionSort
	(lambda (key L)
		(cond	((null? (cdr L)) L)
				(#t
					(cons
						(minKey key L)
						(selectionSort key (removeMinKey key L))
					)
				)
		)
		)
		)