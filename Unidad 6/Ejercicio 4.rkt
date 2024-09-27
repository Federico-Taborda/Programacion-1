;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-intermediate-reader.ss" "lang")((modname |Ejercicio 4|) (read-case-sensitive #t) (teachpacks ((lib "image.rkt" "teachpack" "2htdp") (lib "abstraction.rkt" "teachpack" "2htdp") (lib "universe.rkt" "teachpack" "2htdp") (lib "web-io.rkt" "teachpack" "2htdp"))) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ((lib "image.rkt" "teachpack" "2htdp") (lib "abstraction.rkt" "teachpack" "2htdp") (lib "universe.rkt" "teachpack" "2htdp") (lib "web-io.rkt" "teachpack" "2htdp")) #f)))
; sumnat :: Natural Natural -> Natural
; Dados dos numeros naturales (n, m) la funcion devolvera la suma de ambos

;(check-expect (sumanat 2 2) 4)
;(check-expect (sumanat 0 0) 0)
;(check-expect (sumanat 6 6) 12)

(define (sumanat n m)
  (cond[(zero? m) n]
       [else (sumanat (add1 n) (sub1 m))]
       ))

; multiplicar :: Natural Natural -> Number
; Dados dos numeros naturales (n, m) la funcion devuelve la multiplicacion del primero por el segundo

;(check-expect (multiplicar 3 2) 6)
;(check-expect (multiplicar 4 4) 16)
;(check-expect (multiplicar 0 2) 0)

(define (multiplicar n m)
  (cond[(zero? m) 0]
       [else (sumanat n (multiplicar n (sub1 m)))]
       ))

; facnat :: Natural -> Natural
; Dado un numero natural n la funcion devolvera el factorial de n

(check-expect (facnat 2) 2)
(check-expect (facnat 4) 24)
(check-expect (facnat 1) 1)

(define (facnat n)
  (cond[(zero? n) 1]
       [else (multiplicar n (facnat (sub1 n)))]
       ))