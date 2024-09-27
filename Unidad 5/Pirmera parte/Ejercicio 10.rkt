;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-abbr-reader.ss" "lang")((modname |Ejercicio 10|) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
; Montos representa una lista con montos de dinero
(define MONTOS (list -100 100 100 -100 100))


; longitud: Lista -> Number
; Dada una lista devuelve la cantidad de elementos de esa lista
(define (longitud lista)
  (cond[(empty? lista) 0]
       [(cons? lista) (+ 1 (longitud (rest lista)))]))

(check-expect (longitud MONTOS) 5)
