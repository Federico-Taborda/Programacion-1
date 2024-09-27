;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-intermediate-reader.ss" "lang")((modname |Ejercicio 6|) (read-case-sensitive #t) (teachpacks ((lib "image.rkt" "teachpack" "2htdp") (lib "abstraction.rkt" "teachpack" "2htdp") (lib "universe.rkt" "teachpack" "2htdp") (lib "web-io.rkt" "teachpack" "2htdp"))) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ((lib "image.rkt" "teachpack" "2htdp") (lib "abstraction.rkt" "teachpack" "2htdp") (lib "universe.rkt" "teachpack" "2htdp") (lib "web-io.rkt" "teachpack" "2htdp")) #f)))
; Un Natural es:
; 0
; (add1 Natural)
; Interpretacion: Natural representa a los numeros naturales

; sigma :: Natural (Natural -> Number) -> Number
; Dados un numero natural n y una funcion f, devuelve la sumatoria de f para los valores de 0 a n

(check-expect (sigma 4 sqr) 30)
(check-expect (sigma 10 identity) 55)

(define (sigma n f)
  (cond[(zero? n) 0]
       (else (+ (f n) (sigma (sub1 n) f)))
       ))