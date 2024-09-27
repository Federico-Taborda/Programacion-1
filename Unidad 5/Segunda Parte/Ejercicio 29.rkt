;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-intermediate-reader.ss" "lang")((modname |Ejercicio 29|) (read-case-sensitive #t) (teachpacks ((lib "image.rkt" "teachpack" "2htdp") (lib "abstraction.rkt" "teachpack" "2htdp") (lib "universe.rkt" "teachpack" "2htdp") (lib "web-io.rkt" "teachpack" "2htdp"))) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ((lib "image.rkt" "teachpack" "2htdp") (lib "abstraction.rkt" "teachpack" "2htdp") (lib "universe.rkt" "teachpack" "2htdp") (lib "web-io.rkt" "teachpack" "2htdp")) #f)))
(define LISTA (list (list 1 3 -4 -2) (list 1 2 3 -5) (list 4 -9 -7 8 -3)))

; Suma los elementos de la lista
(define (suma l) (foldr + 0 l))

; Suma las sublistas
(define (sumarSubListas l) (map suma l))

; Verifica si uno de dos numeros es positivo
(define (pos?1 n1 n2) (if(or (> n1 0) (> n2 0)) #t #f))

; Verifica si el numero es positivo
(define (pos?2 n) (if(> n 0) #t #f))

; Filtra todos los numeros positivos de una lista
(define (positivos l) (filter pos?2 l))

; Verifica si algun elemento de la lista es positivo
(define (algun-pos l) (if(foldr pos?1 #f (positivos (sumarSubListas l))) #t #f))


; Casos de prueba
(algun-pos (list (list 1 3 -4 -2) (list 1 2 3 -5) (list 4 -9 -7 8 -3)))
; #true

;(algun-pos (list empty (list 1 2 3)))
; #true

;(algun-pos (list (list -1 2 -3 4 -5) empty (list -3 -4)))
; #false
