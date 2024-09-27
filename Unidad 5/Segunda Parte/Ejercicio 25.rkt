;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-intermediate-reader.ss" "lang")((modname |Ejercicio 25|) (read-case-sensitive #t) (teachpacks ((lib "image.rkt" "teachpack" "2htdp") (lib "abstraction.rkt" "teachpack" "2htdp") (lib "universe.rkt" "teachpack" "2htdp") (lib "web-io.rkt" "teachpack" "2htdp"))) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ((lib "image.rkt" "teachpack" "2htdp") (lib "abstraction.rkt" "teachpack" "2htdp") (lib "universe.rkt" "teachpack" "2htdp") (lib "web-io.rkt" "teachpack" "2htdp")) #f)))
(define NUMEROS (list 3 -2 4 0 1 -5))

(define (pos? n) (if(> n 0) #t #f))

; Dada una lista de numeros devuelve una lista de numeros positivos
(define (positivos l) (filter pos? l))

; Dada una lista de numeros devuelve la multiplicacion de todos ellos
(define (mult l) (foldr * 1 l))

; Dada una lista de numeros positivos devuelve la multiplicacion de todos ellos
(define (multpos l) (mult (positivos l)))

(multpos NUMEROS)