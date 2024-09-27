;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-intermediate-reader.ss" "lang")((modname |Ejercicio 1|) (read-case-sensitive #t) (teachpacks ((lib "image.rkt" "teachpack" "2htdp") (lib "abstraction.rkt" "teachpack" "2htdp") (lib "universe.rkt" "teachpack" "2htdp") (lib "web-io.rkt" "teachpack" "2htdp"))) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ((lib "image.rkt" "teachpack" "2htdp") (lib "abstraction.rkt" "teachpack" "2htdp") (lib "universe.rkt" "teachpack" "2htdp") (lib "web-io.rkt" "teachpack" "2htdp")) #f)))
; sumnat :: Natural Natural -> Natural
; Dados dos numeros naturales (n, m) la funcion devolvera la suma de ambos

(check-expect (sumanat 2 2) 4)
(check-expect (sumanat 0 0) 0)
(check-expect (sumanat 6 6) 12)

(define (sumanat n m)
  (cond[(zero? m) n]
       [else (sumanat (add1 n) (sub1 m))]
       ))
