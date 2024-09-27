;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-intermediate-reader.ss" "lang")((modname |Ejercicio 8|) (read-case-sensitive #t) (teachpacks ((lib "image.rkt" "teachpack" "2htdp") (lib "abstraction.rkt" "teachpack" "2htdp") (lib "universe.rkt" "teachpack" "2htdp") (lib "web-io.rkt" "teachpack" "2htdp"))) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ((lib "image.rkt" "teachpack" "2htdp") (lib "abstraction.rkt" "teachpack" "2htdp") (lib "universe.rkt" "teachpack" "2htdp") (lib "web-io.rkt" "teachpack" "2htdp")) #f)))
; componer :: (Number -> Number) Natural Number -> Number
; Dados una funcion f, un natural n y un numero x, devuelva como resultado de aplicar f a x unas n veces

(check-expect (componer sqr 2 5) 625)
(check-expect (componer sqr 2 2) 16)

(define (componer f n x)
  (cond[(zero? n) x]
       [else (f (componer f (sub1 n) x))]
       ))