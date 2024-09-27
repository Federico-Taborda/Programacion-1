;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-abbr-reader.ss" "lang")((modname |Ejercicio 17|) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
; Una Lista-de-numeros es:
; – '()
; – (cons numero Lista-de-numeros)
; Lista-de-numeros representa una lista de numeros 
(define NUMEROS (list -1 4 6 4 3 4 7 5 0 4 -2 ))

; eliminar :: Number ListOf Number -> ListOf Number
; Dada una lista de numeros y un numero n devuelve una lista de numeros eliminando todas las ocurrencias de n en la lista
(define (eliminar lista numero)
  (cond[(empty? lista) lista]
       [(cons? lista) (if(= (first lista) numero)
                         (eliminar (rest lista) numero)
                         (cons (first lista) (eliminar (rest lista) numero)))
                         ]))

(check-expect (eliminar NUMEROS 4) (list -1 6 3 7 5 0 -2 ))