;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-abbr-reader.ss" "lang")((modname |Ejercicio 19|) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
; Representamos la coordenadas (x, y) de un punto en plano como un valor numerico
; Representamos la distancia maxima al origen como un valor numerico

(define MAX 5)

(define-struct punto [x y])
 ; posn es (Number , Number)
 ; interpretación: un elemento en posn representa un punto en el plano cartesiano

; Una Lista-de-puntos es:
; – '()
; – (cons Punto Lista-de-puntos)
; Lista-de-puntos representa una lista con puntos del plano cartesiano
(define PUNTOS (list (make-punto 3 4) (make-punto 0 4) (make-punto 12 5)))

; distancia-origen :: Punto -> Number
; Dados un punto en el plano devuelve la distancia al origen
(define (distancia-origen p) (sqrt (+ (sqr (- (punto-x p) 0) ) (sqr (- (punto-y p) 0)))))

; distancias :: ListOf Puntos -> ListOf Puntos
; Dada una lista de puntos en el plano devuelve otra lista con las distancias de los puntos al origen
(define (distancias lista)
  (cond[(empty? lista) '()]
       [(cons? lista) (cons (distancia-origen (first lista)) (distancias (rest lista)))]
       ))

(distancias PUNTOS)

