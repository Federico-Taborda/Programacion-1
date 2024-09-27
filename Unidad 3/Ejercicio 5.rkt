;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname |5|) (read-case-sensitive #t) (teachpacks ((lib "image.rkt" "teachpack" "2htdp") (lib "universe.rkt" "teachpack" "2htdp"))) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ((lib "image.rkt" "teachpack" "2htdp") (lib "universe.rkt" "teachpack" "2htdp")) #f)))
; El estado es un string, que representa el color del circulo
; Posibles valores:
; "yellow"
; "red"
; "green"
; "blue"
; Representamos el alto y el ancho de la escena como un valor numerico
; Representamos el radio del circulo como un valor numerico
; Representamos el tiempo como un valor numerico

(define AMARILLO "yellow")
(define ROJO "red")
(define VERDE "green")
(define AZUL "blue")
(define TIEMPO 0.5)

(define ALTO 300)
(define ANCHO 300)
(define RADIO 50)
(define ESCENA (empty-scene ALTO ANCHO))
(define CIRCULO (circle RADIO "solid" AMARILLO))

; dibujar: String -> Image
; Recibe un color del estado y devuelve como resultado la imagen con ese color
(define (circulo color)
  (place-image (circle RADIO "solid" color) (/ ANCHO 2) (/ ALTO 2) ESCENA))

; cambiar-color: Estado -> String
; Dado un estado, comprueba el estado y devuelve el siguiente en el orden pedido
; Entrada "yellow"; Salida: "red" ;
; Entrada "red"; Salida: "green";
; Entrada "green"; Salida: "blue";
; Entrada "blue"; Salida: yellow;
(define (cambiar-color estado)
  (cond[(string=? estado AMARILLO) ROJO]
       [(string=? estado ROJO) VERDE]
       [(string=? estado VERDE) AZUL]
       [(string=? estado AZUL) AMARILLO]))

(check-expect (cambiar-color "yellow") "red")
(check-expect (cambiar-color "red") "green")
(check-expect (cambiar-color "green") "blue")
(check-expect (cambiar-color "blue") "yellow")

(big-bang AMARILLO
  [to-draw circulo]
  [on-tick cambiar-color TIEMPO])