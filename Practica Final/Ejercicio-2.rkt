;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-advanced-reader.ss" "lang")((modname Ejercicio-2) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #t #t none #f () #f)))
; El area de un rectangulo de lado 5 y 25 es de 60 = falsa
(= 60 (* 5 25))

; El sexto caracter de la cadena que se obtiene al concatenar "aBC", "dEf", "GhI" es "F" = falsa
(string=? "F" (string-ith (string-append "aBC" "dEf" "GhI") 6))

; El cuarto elemento de la lista (list #t 5 "hola" #f "mundo") es un string.
(define (elemento-lista lista n)
  (cond[(zero? n) (first lista)]
       [else (elemento-lista (rest lista) (sub1 n))]
       ))

(string? (elemento-lista (list #t 5 "hola" #f "mundo") 4))