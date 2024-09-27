;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-advanced-reader.ss" "lang")((modname Ejercicio-6) (read-case-sensitive #t) (teachpacks ((lib "image.rkt" "teachpack" "2htdp"))) (htdp-settings #(#t constructor repeating-decimal #t #t none #f ((lib "image.rkt" "teachpack" "2htdp")) #f)))
(define-struct pedido [nombre menu postre])
; pedido puede ser (String Number Number)
; Interpretacion: Representa un pedido individual donde
; el primer elemento es el nombre de la persona que realizo el pedido
; el segundo elemento es el menu elegido
; el tercer elemento es el postre elegido

(define-struct pedido-final [menu1 menu2 menu3 pos1 pos2])
; pedido-final puede ser (Number Number Number Number)
; Interpretacion: Representa un pedido final donde los tres primeros
; elementos representan la cantidad de menus distintos y los dos ultimos
; elementos representan la cantidad de postres distintos

(define FINAL (make-pedido-final 0 0 0 0 0))

; armar-pedido-final :: ListOf pedido -> pedido-final
; Dada una lista de pedidos la funcion devolvera un pedido final con la cantidad
; de pedidos de cada menu y postre
;(define (armar-pedido-final lista)
;  (foldr ordenar 0 lista))




