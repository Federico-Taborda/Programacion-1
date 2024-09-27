;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-intermediate-reader.ss" "lang")((modname |Ejercicio 9|) (read-case-sensitive #t) (teachpacks ((lib "image.rkt" "teachpack" "2htdp") (lib "abstraction.rkt" "teachpack" "2htdp") (lib "universe.rkt" "teachpack" "2htdp") (lib "web-io.rkt" "teachpack" "2htdp"))) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ((lib "image.rkt" "teachpack" "2htdp") (lib "abstraction.rkt" "teachpack" "2htdp") (lib "universe.rkt" "teachpack" "2htdp") (lib "web-io.rkt" "teachpack" "2htdp")) #f)))
; intervalo :: Natural -> ListOf Number
; Dado un numero natural n devuelve una lista con los numeros de n a 0

(check-expect (intervalo 5) (list 5 4 3 2 1 0))
(check-expect (intervalo 2) (list 2 1 0))
(check-expect (intervalo 0) (list 0))

(define (intervalo n)
  (cond[(zero? n) (cons 0 '())]
       [else (cons n (intervalo (sub1 n)))]
       ))