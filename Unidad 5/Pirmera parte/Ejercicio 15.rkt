;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-abbr-reader.ss" "lang")((modname |Ejercicio 15|) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
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
(define PUNTOS (list (make-punto 3 5) (make-punto 1 2) (make-punto 0 1) (make-punto 5 6)))

; distancia-origen :: Punto -> Number
; Dados un punto en el plano devuelve la distancia al origen
(define (distancia-origen p) (sqrt (+ (sqr (- (punto-x p) 0) ) (sqr (- (punto-y p) 0)))))

; cerca :: ListOf Puntos -> ListOf Puntos
; Dada una lista de puntos en el plano devuelve otra lista con los puntos con distancia al origen menor a MAX
(define (cerca lista)
  (cond[(empty? lista) '()]
       [(cons? lista) (if(< (distancia-origen (first lista)) MAX)
                         (cons (first lista) (rest lista))
                         (cerca (rest lista)))]
       ))

(cerca PUNTOS)

