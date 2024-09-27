;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-abbr-reader.ss" "lang")((modname |Ejercicio 14|) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
; Numeros representa una lista de numeros
(define NUMEROS (list 4 6 3 7 5 0))

; mayores: Lista -> Lista
; Dada una lista de numeros devuelve una lista de numeros positivos de la misma
(define (mayores lista numero)
  (cond[(empty? lista) lista]
       [(cons? lista) (if(> (first lista) numero)
                         (cons (first lista) (mayores (rest lista) numero))
                         (mayores (rest lista) numero))]))

(check-expect (mayores NUMEROS 4) (list 6 7 5))