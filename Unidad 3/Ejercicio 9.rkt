;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname |Ejercicio 9|) (read-case-sensitive #t) (teachpacks ((lib "image.rkt" "teachpack" "htdp") (lib "universe.rkt" "teachpack" "2htdp"))) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ((lib "image.rkt" "teachpack" "htdp") (lib "universe.rkt" "teachpack" "2htdp")) #f)))
; El estado del sistema es un string, representando la figura y el color a dibujar

; Posibles figuras:
; - Triangulo
; - Circulo

; Posibles colores:
; - Azul
; - Verde

; Representamos el alto y el ancho de la escena como un valor numerico
; Representamos el color de fondo como un string
; Representamos el tamaño de las figuras como un valor numerico
; Representamos el tiempo en que cambian de color las figuras como un valor numerico

; Estado
(define ESTADO_INICIAL "tg")

(define ALTO 500)
(define ANCHO 500)
(define COLOR_FONDO "black")
(define ESCENA (empty-scene ANCHO ALTO))
(define LADO_TRIANGULO 30)
(define RADIO_CIRCULO 20)
(define TIEMPO 1)

; Posibles colores
(define AZUL "blue")
(define VERDE "green")

; dibujar: Estado -> Image
; La funcion recibe un estado y devuelve una imagen en el canvas segun el color actual de la figura
(define (dibujar estado)
  (cond[(string=? estado "tg") (dibujarTriangulo "green")]
       [(string=? estado "ta") (dibujarTriangulo "blue")]
       [(string=? estado "cg") (dibujarCirculo "green")]
       [(string=? estado "ca") (dibujarCirculo "blue")]))

; dibujarTriangulo: Estado -> Image
; La funcion recibe un estado y devuelve un triangulo en el canvas
(define (dibujarTriangulo color)
  (place-image (triangle LADO_TRIANGULO "solid" color) (random ANCHO) (random ALTO) ESCENA))

; dibujarCirculo: Estado -> Image
; La funcion recibe un estado y devuelve un circulo en el canvas
(define (dibujarCirculo color)
  (place-image (circle RADIO_CIRCULO "solid" color) (random ANCHO) (random ALTO) ESCENA))

; manejadorTeclado: Estado String -> Image
; La funcion recibe un estado y segun la tecla presionada devuelve como resultado:
; - Un circulo
; - Un triangulo
(define (manejadorTeclado estado tecla)
  (cond[(key=? tecla "t") "tg"]
       [(key=? tecla "c") "cg"]
       [else estado]))

; manejadorTiempo: Estado -> Image
; La funcion recibe un estado y por cada segundo devuelve un color diferente en la figura
(define (manejadorTiempo estado)
  (cond[(string=? estado "tg") "ta"]
       [(string=? estado "ta") "tg"]
       [(string=? estado "cg") "ca"]
       [(string=? estado "ca") "cg"]
       [else estado]))

; Expresion big-bang

(big-bang ESTADO_INICIAL
    [to-draw dibujar]
    [on-key manejadorTeclado]
    [on-tick manejadorTiempo TIEMPO])