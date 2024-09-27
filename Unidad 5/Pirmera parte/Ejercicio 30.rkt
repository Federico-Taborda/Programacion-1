;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-abbr-reader.ss" "lang")((modname |Ejercicio 30|) (read-case-sensitive #t) (teachpacks ((lib "abstraction.rkt" "teachpack" "2htdp") (lib "image.rkt" "teachpack" "2htdp") (lib "universe.rkt" "teachpack" "2htdp"))) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ((lib "abstraction.rkt" "teachpack" "2htdp") (lib "image.rkt" "teachpack" "2htdp") (lib "universe.rkt" "teachpack" "2htdp")) #f)))
; Representamos las estrellas con estructuras posn
; Representamos el alto y el ancho del cielo con valores numericos
; Representamos el color del cielo y las estrellas con strings

(define-struct Estrella [x y])
; estrella es (Number , Number)
; interpretación: representa una estrella en el cielo

; Una Lista-de-estrellas es:
; – '()
; – (cons Estrella Lista-de-estrellas)
; Lista-de-estrellas representa una lista de coordenadas de cada estrella
(define INICIAL '())

; Dimensiones del cielo
(define ALTO 300)
(define ANCHO 300)

; Escena vacia
(define COLOR_CIELO "black")
(define FONDO (empty-scene ANCHO ALTO COLOR_CIELO))

; Estrella
(define TAMAÑO_ESTRELLA 20)
(define COLOR_ESTRELLA "white")
(define ESTRELLA (star TAMAÑO_ESTRELLA "solid" COLOR_ESTRELLA))

; interpretar :: Estado ListOf Estrella -> Image
; Dado una lista, si la lista es vacia dibujara un cielo vacio, sino dibujara todas las estrellas de la lista
(define (interpretar estado)
  (cond[(empty? estado) FONDO]
       [(and (cons? estado) (posicionEstrella (Estrella-x (first estado)) (Estrella-y (first estado))))
        (place-image ESTRELLA (Estrella-x (first estado)) (Estrella-y (first estado)) (interpretar (rest estado)))]
       [else (interpretar (rest estado))]
       ))

; borrarEstrella:: ListOf Estrellas -> ListOf Estrellas
; Dada una lista de estrellas devuelve la misma lista sin el primer elemento si es que esta no es vacia. De ser asi devolvera una lista vacia
(define (borrarEstrella estado )
  (cond[(empty? estado) '()]
       [(cons? estado) (rest estado)]))

; manejadorTeclado :: ListOf Estrellas String -> Image
; La funcion evalua si se presiona la barra espaciadora, de ser asi devuelve el canvas vacio.
(define (manejadorTeclado estado tecla)
  (cond[(key=? tecla " ") '()]
       [(key=? tecla "\b") (borrarEstrella estado)]
       [else estado]))

; manejadorMouse :: ListOf Estrellas Number Number String -> ListOf Estrellas
; Dado un evento la funcion agregara como elemento al estado una nueva posicion para un estrella
(define (manejadorMouse estado x y evento)
  (cond[(string=? evento "button-down") (cons (make-Estrella x y) estado)]
       [else estado]))

; posicionEstrella :: Number Number -> Image
; La funcion recibe la posicion (x, y) de la estrella y devuelve como resultado
; - Verdadero si la estrella se encuentra dentro del canvas
; - Falso si la estrella no se encuentra dentro del canvas
(define (posicionEstrella x y)
  (cond[(or (> (+ x TAMAÑO_ESTRELLA) ANCHO) (< (- x TAMAÑO_ESTRELLA) 0)) #f]
       [(or (> (+ y TAMAÑO_ESTRELLA) ALTO) (< (- y TAMAÑO_ESTRELLA) 0)) #f]
       [else #t]))


; Expresion Big-Bang
(big-bang INICIAL
  [to-draw interpretar]
  [on-key manejadorTeclado]
  [on-mouse manejadorMouse])