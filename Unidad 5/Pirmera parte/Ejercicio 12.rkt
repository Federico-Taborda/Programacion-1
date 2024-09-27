;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-abbr-reader.ss" "lang")((modname |Ejercicio 12|) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
; Numeros representa una lista de numeros
(define NUMEROS (list 4 6 3 7 5 0))

; pares: Lista -> Lista
; Dada una lista de numeros devuelve una lista de numeros positivos de la misma
(define (pares lista)
  (cond[(empty? lista) lista]
       [(cons? lista) (if(even? (first lista))
                         (cons (first lista) (pares (rest lista)))
                         (pares (rest lista)))]))

(check-expect (pares NUMEROS) (list 4 6 0))