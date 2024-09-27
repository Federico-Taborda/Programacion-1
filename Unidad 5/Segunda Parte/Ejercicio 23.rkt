;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-intermediate-reader.ss" "lang")((modname |Ejercicio 23|) (read-case-sensitive #t) (teachpacks ((lib "image.rkt" "teachpack" "2htdp") (lib "abstraction.rkt" "teachpack" "2htdp") (lib "universe.rkt" "teachpack" "2htdp") (lib "web-io.rkt" "teachpack" "2htdp"))) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ((lib "image.rkt" "teachpack" "2htdp") (lib "abstraction.rkt" "teachpack" "2htdp") (lib "universe.rkt" "teachpack" "2htdp") (lib "web-io.rkt" "teachpack" "2htdp")) #f)))
(define NUMEROS (list 1 2 3 4 5))

; cuadrados :: ListOf Number -> ListOf Number
; Dada una lista de numeros devuelve una lista de los cuadrados de cada elemento
(define (cuadrados l) (map sqr l))

; suma :: ListOf Number -> ListOf Number
; Dada una lista de numeros devuelve una lista de la suma de cada elemento
(define (suma l) (foldr + 0 l))

; cuadrados :: ListOf Number -> ListOf Number
; Dada una lista de numeros devuelve una lista de la suma de los cuadrados de cada elemento
(define (sumacuad l) (suma (cuadrados l)))

(sumacuad NUMEROS)