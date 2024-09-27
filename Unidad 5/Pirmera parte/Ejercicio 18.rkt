;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-abbr-reader.ss" "lang")((modname |Ejercicio 18|) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
; Una Lista-de-numeros es:
; – '()
; – (cons numero Lista-de-numeros)
; Lista-de-numeros representa una lista de numeros 
(define NUMEROS (list 9 16 4))

; raices :: ListOf Number -> ListOf Number
; Dada una lista de numeros devuelve una lista de las raices cuadradas de sus elementos
(define (raices lista)
  (cond[(empty? lista) lista]
       [(cons? lista) (cons (sqrt (first lista)) (raices (rest lista)))]
       ))

(raices (list 9 16 4))
