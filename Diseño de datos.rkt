;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-abbr-reader.ss" "lang")((modname |Diseño de datos|) (read-case-sensitive #t) (teachpacks ((lib "abstraction.rkt" "teachpack" "2htdp") (lib "image.rkt" "teachpack" "2htdp") (lib "universe.rkt" "teachpack" "2htdp"))) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ((lib "abstraction.rkt" "teachpack" "2htdp") (lib "image.rkt" "teachpack" "2htdp") (lib "universe.rkt" "teachpack" "2htdp")) #f)))
; Diseño de datos de estructura

(define-struct Estrella [x y])
; estrella es (Number , Number)
; interpretación: representa una estrella en el cielo
; - El primer elemento corresponde a la coordenada x
; - El segundo elemento corresponde a la coordenada y

; mi-funcion :: Estado -> Number
; Dado un estado la funcion devolvera como resultado un numero


; Diseño de datos de listas

; Una Lista-de-estrellas es:
; – '()
; – (cons Estrella Lista-de-estrellas)
; Lista-de-estrellas representa una lista de coordenadas de cada estrella
(define ESTRELLAS '())

; mi-funcion :: ListOf Estrellas -> Number
; Dado una lista de estrellas la funcion devolvera como resultado un numero


