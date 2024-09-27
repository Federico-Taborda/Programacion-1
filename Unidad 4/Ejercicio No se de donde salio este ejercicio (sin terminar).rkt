;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname |Ejercicio 9 (sin terminar)|) (read-case-sensitive #t) (teachpacks ((lib "universe.rkt" "teachpack" "2htdp") (lib "abstraction.rkt" "teachpack" "2htdp") (lib "web-io.rkt" "teachpack" "2htdp") (lib "image.rkt" "teachpack" "2htdp"))) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ((lib "universe.rkt" "teachpack" "2htdp") (lib "abstraction.rkt" "teachpack" "2htdp") (lib "web-io.rkt" "teachpack" "2htdp") (lib "image.rkt" "teachpack" "2htdp")) #f)))
(define-struct Figura [forma tamaño color])
; Figura es (Image, Number, String)
; Intepretación:
; - El primer elemento es el tipo de la figura
; - El segundo elemento es el tamaño de la figura
; - El tercer elemento es el color de la figura

; Representamos el alto y el ancho de la escena como un valor numerico

(define INICIAL (make-Figura "triangulo" 10 "green"))
(define ALTO 500)
(define ANCHO 500)
(define ESCENA (empty-scene ANCHO ALTO))
(define FONDO (empty-scene ANCHO ALTO "black"))

; dibujar: Estado -> Image
; La funcion recibe el estado y lo imprime en la pantalla
(define (dibujar estado)
  (place-image FONDO (/ ANCHO 2) (/ ALTO 2) ESCENA))

; dibujar-figura: Struct -> Image
; La funcion recibe una estructura y dibuja el tipo de figura
(define (dibujar-figura estado x y)
  (place-image (cond[(string=? (Figura-forma estado) "triangulo") (triangle (Figura-tamaño estado) "solid" (Figura-color estado))]
                    [(string=? (Figura-forma estado) "cuadrado") (square (Figura-tamaño estado) "solid" (Figura-color estado))]
                    [(string=? (Figura-forma estado) "estrella") (star (Figura-tamaño estado) "solid" (Figura-color estado))]
                    [(string=? (Figura-forma estado) "circulo") (circle (Figura-tamaño estado) "solid" (Figura-color estado))]
                    [else (Figura-forma estado)])
               x y ESCENA))

; manejar-mouse: Estado Number Number String -> Image
; La funcion determina que figura se dibujara en la pantalla
(define (manejar-mouse estado x y evento)
  (cond[(string=? evento "button-down") (dibujar-figura estado x y)]
       [else estado]))

; manejar-teclado: Estado String -> Image
; La funcion manejara las propiedades de las figuras seleccionadas
(define (manejar-teclado estado tecla)
  (make-Figura (verificar-figura (Figura-forma estado) tecla) (Figura-tamaño estado) (Figura-color estado)))

; verificar-figura: Estado -> String
; Dado una tecla presionada devolvera el tipo de figura seleccionada
(define (verificar-figura figura tecla)
  (cond[(key=? tecla "t") "triangulo"]
       [(key=? tecla "c") "cuadrado"]
       [(key=? tecla "e") "estrella"]
       [(key=? tecla "o") "circulo"]
       [else figura]
       ))
  
; Expresion big-bang

(big-bang INICIAL
  [to-draw dibujar]
  [on-mouse manejar-mouse]
  [on-key manejar-teclado])