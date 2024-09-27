;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname |Ejercicio 8|) (read-case-sensitive #t) (teachpacks ((lib "image.rkt" "teachpack" "2htdp") (lib "universe.rkt" "teachpack" "2htdp") (lib "abstraction.rkt" "teachpack" "2htdp") (lib "web-io.rkt" "teachpack" "2htdp") (lib "itunes.rkt" "teachpack" "2htdp") (lib "batch-io.rkt" "teachpack" "2htdp"))) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ((lib "image.rkt" "teachpack" "2htdp") (lib "universe.rkt" "teachpack" "2htdp") (lib "abstraction.rkt" "teachpack" "2htdp") (lib "web-io.rkt" "teachpack" "2htdp") (lib "itunes.rkt" "teachpack" "2htdp") (lib "batch-io.rkt" "teachpack" "2htdp")) #f)))
; El estado del sistema sera una imagen, repesentando el cielo
; Representamos las estrellas con imagenes
; Representamos el alto y el ancho del cielo con valores numericos
; Representamos el color del cielo y las estrellas con strings

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

; dibujar: Estado -> Image
; Recibe el estado y devuelve una imagen vacia
(define (dibujar estado)
  (place-image estado (/ ANCHO 2) (/ ALTO 2) FONDO))

; manejadorTeclado: Estado String -> Image
; La funcion evalua si se presiona la barra espaciadora, de ser asi devuelve el canvas vacio.
(define (manejadorTeclado estado tecla)
  (if(key=? tecla " ") FONDO estado))

; manejadorMouse: Estado Number Number String -> Image
; La funcion verifica el evento del mouse y si es el correcto dibuja una estrella en el canvas
(define (manejadorMouse estado x y evento)
  (cond[(string=? evento "button-down") (posicionEstrella estado x y)]
       ;[(string=? evento "move")]
       [else estado]))

; posicionEstrella: Estado Number Number -> Image
; La funcion recibe el estado y la posicion de la estrella y calcula si la estrella esta mas alla de los bordes
(define (posicionEstrella estado x y)
  (cond[(or (> (+ x TAMAÑO_ESTRELLA) ANCHO) (< (- x TAMAÑO_ESTRELLA) 0)) estado]
       [(or (> (+ y TAMAÑO_ESTRELLA) ALTO) (< (- y TAMAÑO_ESTRELLA) 0)) estado]
       [else (dibujarEstrella estado x y)]))

; dibujarEstrella: Estado Number Number -> Image
(define (dibujarEstrella estado x y)
  (place-image (star TAMAÑO_ESTRELLA "solid" COLOR_ESTRELLA) x y estado)) 

; Expresion Big-Bang
(big-bang FONDO
  [to-draw dibujar]
  [on-key manejadorTeclado]
  [on-mouse manejadorMouse])