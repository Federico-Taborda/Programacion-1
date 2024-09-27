;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-abbr-reader.ss" "lang")((modname |Ejercicio 7|) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
; Lista-de-Montos puede ser:
; '()
; (cons Numero-Positivos Lista-de-montos)
; Interpretacion: representa una lista de montos de dinero

; Ejemplos
(define MONTOS1 (list 1 2 3 4 5))
(define MONTOS2 (list 2 4 6 8 10))
(define MONTOS3 (list 1 3 5 7 9))

; suma: Lista Number -> Number
; Dada una lista de monstos, devuelve la suma de todos ellos
(define (suma lista)
  (cond[(empty? lista) 0]
       [(cons? lista) (+ (first lista) (suma (rest lista)))]))

(check-expect (suma MONTOS1) 15)
(check-expect (suma MONTOS2) 30)
(check-expect (suma MONTOS3) 25)

;=================================================================

; longitud: Lista -> Number
; Dada una lista devuelve la cantidad de elementos de esa lista
(define (longitud lista)
  (cond[(empty? lista) 0]
       [(cons? lista) (+ 1 (longitud (rest lista)))]))

;(check-expect (longitud MONTOS) 5)

;=================================================================

; positivos: Lista -> Number
; Dada una lista de numeros devuelve la cantidad de numeros positivos de la misma

(define (positivos lista)
  (cond[(empty? lista) 0]
       [(cons? lista) (if(> (first lista) 0) (+ 1 (positivos (rest lista))) (positivos (rest lista)))]))

;(check-expect (positivos MONTOS) 3)

;=================================================================

; posn: Primer elemento coordenada x, segundo elemento coordenada y
(define-struct p [x y])

; Lista de puntos con sus coordenadas
(define COORDENADAS (list (make-p 1 2) (make-p 3 4) (make-p 5 6)))

; coordenadas-x: Lista -> Lista
; Dada una lista de coordenadas devuelve una lista de coordenadas x de los puntos
(define (coordenadas-x lista)
  (cond[(empty? lista) lista]
       [(cons? lista) (cons (p-x (first lista)) (coordenadas-x (rest lista)))]))

;(check-expect (coordenadas-x COORDENADAS) (list 1 3 5))

