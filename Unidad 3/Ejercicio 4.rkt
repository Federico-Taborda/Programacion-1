;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname |Ejercicio 4|) (read-case-sensitive #t) (teachpacks ((lib "image.rkt" "teachpack" "htdp") (lib "universe.rkt" "teachpack" "2htdp"))) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ((lib "image.rkt" "teachpack" "htdp") (lib "universe.rkt" "teachpack" "2htdp")) #f)))
; Representamos el estado del circulo que es su posicion vertical como un valor numerico
; Representamos el alto y el ancho de la escena como un valor numerico
; Representamos el radio del circulo como un valor numerico

(define ALTO 300)
(define ANCHO 300)
(define RADIO 20)
(define DELTA 10)
(define ESCENA (empty-scene ANCHO ALTO))
(define INICIAL (/ ALTO 2))
(define CIRCULO (circle RADIO "solid" "red"))

; dibujar: Number -> Image
; Recibe el estado y devuelve la imagen de un circulo en la posicion del estado
(define (dibujar y) (place-image CIRCULO (/ ANCHO 2) y ESCENA))

; tecla?: Numero String -> Number
; Recibe el estado y una tecla presionada y devuelve como resultado el nuevo estado en caso de presionar o no una flecha
(define (tecla? estado tecla)
  (if(and (> (- estado RADIO) (- ALTO ALTO)) (< (+ estado RADIO) ALTO))
     (cond[(key=? tecla "up") (- estado DELTA)]
       [(key=? tecla "down") (+ estado DELTA)]
       [(key=? tecla " ") INICIAL]
       [else estado])
     INICIAL))

; manejadorMouse: Number Number Number String -> Number
; Recibe el estado, la posicion del mouse(x, y) y el evento que ocurre del mouse,
; y en caso de que se presione el mouse devolvera el estado en la posicion vertical del mouse
; en caso contrario devolvera el estado
(define (manejadorMouse estado x y event)
  (cond[(string=? event "button-down") y]
       [else estado]))

(big-bang INICIAL
  [to-draw dibujar]
  [on-mouse manejadorMouse]
  [on-key tecla?])