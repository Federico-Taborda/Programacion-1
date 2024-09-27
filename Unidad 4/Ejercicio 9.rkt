;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname |Ejercicio 10|) (read-case-sensitive #t) (teachpacks ((lib "universe.rkt" "teachpack" "2htdp") (lib "abstraction.rkt" "teachpack" "2htdp") (lib "web-io.rkt" "teachpack" "2htdp") (lib "image.rkt" "teachpack" "2htdp"))) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ((lib "universe.rkt" "teachpack" "2htdp") (lib "abstraction.rkt" "teachpack" "2htdp") (lib "web-io.rkt" "teachpack" "2htdp") (lib "image.rkt" "teachpack" "2htdp")) #f)))
(define-struct Auto [modelo años combustible rendimiento])
; Auto es (String, Number, String, Number)
; Intepretación:
; - El primer elemento representa el modelo del auto
; - El segundo elemento representa los años del auto
; - El tercer elemento representa el tipo de combustible del auto
; - El cuarto elemento representa el rendimiento optimo del auto

; Representamos el precio de la nafta y el diesel como un valor numerico
; Representamos el precio del peaje como un valor numerico

(define GOL (make-Auto 2013 4 "nafta" 13))
(define PRECIO_NAFTA 19)
(define PRECIO_DIESEL 17)
(define PRECIO_PEAJE 50)

; costo-viaje: Struct Number -> String
; La funcion calculara el costo del viaje en base de las caracteristicas del auto
(define (costo-viaje auto km)
  (if(Auto? auto)
     (dolarizar (+ (* (/ km (calcular-rendimiento auto)) (cantidad-litros auto)) (cantidad-peajes km)))
     "No es una estructura valida"))

(define (calcular-rendimiento auto)
  (cond[(and (> (Auto-años auto) 1) (< (Auto-años auto) 5)) (calcular-porcentaje 2 (Auto-rendimiento auto))]
       [(and (> (Auto-años auto) 6) (< (Auto-años auto) 10)) (calcular-porcentaje 6 (Auto-rendimiento auto))]
       [(and (> (Auto-años auto) 10) (< (Auto-años auto) 15)) (calcular-porcentaje 10 (Auto-rendimiento auto))]
       [(> (Auto-años auto) 15) (calcular-porcentaje 15 (Auto-rendimiento auto))]))

(check-expect (costo-viaje GOL 450) "$871")

(define (calcular-porcentaje porcentaje numero)
  (- numero (* (/ numero 100) porcentaje)))

;(check-expect (calcular-porcentaje 2 13) 12.74)

(define (cantidad-litros auto)
  (if(string=? (Auto-combustible auto) "nafta")
     PRECIO_NAFTA
     PRECIO_DIESEL))

(define (cantidad-peajes km) (* (floor (/ km 100)) PRECIO_PEAJE))

;(check-expect (cantidad-peajes 450) 200)

(define (dolarizar precio) (string-append "$" (number->string precio)))