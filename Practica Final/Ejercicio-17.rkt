;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-intermediate-reader.ss" "lang")((modname Ejercicio-17) (read-case-sensitive #t) (teachpacks ((lib "universe.rkt" "teachpack" "2htdp") (lib "abstraction.rkt" "teachpack" "2htdp") (lib "image.rkt" "teachpack" "2htdp"))) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ((lib "universe.rkt" "teachpack" "2htdp") (lib "abstraction.rkt" "teachpack" "2htdp") (lib "image.rkt" "teachpack" "2htdp")) #f)))
(check-expect (suma-positivos-es-mayor?
                 (list 5 "abc" 2 #t -3 "def")) #t)
(check-expect (suma-positivos-es-mayor?
                 (list (circle 10 "solid" "red") 12 1 -2 -45)) #f)

(define (positivo n) (and (number? n) (positive? n)))
(define (negativo n) (and (number? n) (negative? n)))
(define (sumar lista) (foldr + 0 lista))

(define (suma-positivos-es-mayor? lista)
  (> (sumar (filter positivo lista)) (abs (sumar(filter negativo lista)))))