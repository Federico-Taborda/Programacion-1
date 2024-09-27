;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-intermediate-reader.ss" "lang")((modname |Ejercicio 5|) (read-case-sensitive #t) (teachpacks ((lib "image.rkt" "teachpack" "2htdp") (lib "abstraction.rkt" "teachpack" "2htdp") (lib "universe.rkt" "teachpack" "2htdp") (lib "web-io.rkt" "teachpack" "2htdp"))) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ((lib "image.rkt" "teachpack" "2htdp") (lib "abstraction.rkt" "teachpack" "2htdp") (lib "universe.rkt" "teachpack" "2htdp") (lib "web-io.rkt" "teachpack" "2htdp")) #f)))
; fibnat :: Natural -> Number
; Dado un numero natural n devuelve el elemento de la sucesion fibonacci en la posicion n

(check-expect (fibnat 0) 1)
(check-expect (fibnat 1) 1)
(check-expect (fibnat 2) 2)
(check-expect (fibnat 4) 5)
(check-expect (fibnat 7) 21)

(define (fibnat n)
  (cond[(zero? n) 1]
       [(= n 1) 1]
       [else (+ (fibnat (sub1 n)) (fibnat (sub1 (sub1 n))))]
       ))