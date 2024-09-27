;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname |Unidad 3 Primer ejercicio|) (read-case-sensitive #t) (teachpacks ((lib "image.rkt" "teachpack" "2htdp") (lib "universe.rkt" "teachpack" "2htdp"))) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ((lib "image.rkt" "teachpack" "2htdp") (lib "universe.rkt" "teachpack" "2htdp")) #f)))
; Estado es un string, que representa el color del círculo a dibujar en pantalla.
; Posibles valores:
; - "blue"
; - "red"
; - "green"

(define ESTADO_INICIAL "blue")
(define ROJO "red")
(define VERDE "green")
(define NEGRO "black")

; interpretar: Estado -> Image
; Dado un estado, devuelve la imagen a mostrar por el programa
; Entrada: ; Salida:
; Entrada: ; Salida:
; Entrada: ; Salida:

(define
   (interpretar s)
   (place-image (circle 10 "solid" s) 100 100 (empty-scene 200 200)))

; manejarTeclado: Estado String -> Estado
; Dado un estado y una tecla y devuelve como resultado otro estado dependiendo de la tecla presionada
; Entrada: ; Salida: ;
; Entrada: ; Salida: ;
; Entrada: ; Salida: ;
(define (manejarTeclado s k) (cond [(key=? k "a") ESTADO_INICIAL]
                                   [(key=? k "r") ROJO]
                                   [(key=? k "v") VERDE]
                                   [(key=? k "n") NEGRO]
                                   [(key=? k " ") ESTADO_INICIAL]
                                   [else s]))

(big-bang ESTADO_INICIAL                   
          [to-draw interpretar]    
          [on-key manejarTeclado])

