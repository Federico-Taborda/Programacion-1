;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-intermediate-reader.ss" "lang")((modname |Ejercicio 11|) (read-case-sensitive #t) (teachpacks ((lib "image.rkt" "teachpack" "2htdp") (lib "abstraction.rkt" "teachpack" "2htdp") (lib "universe.rkt" "teachpack" "2htdp") (lib "web-io.rkt" "teachpack" "2htdp"))) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ((lib "image.rkt" "teachpack" "2htdp") (lib "abstraction.rkt" "teachpack" "2htdp") (lib "universe.rkt" "teachpack" "2htdp") (lib "web-io.rkt" "teachpack" "2htdp")) #f)))
; fibnat :: Natural -> Number
; Dado un numero natural n devuelve el elemento de la sucesion fibonacci en la posicion n

;(check-expect (fibnat 0) 1)
;(check-expect (fibnat 1) 1)
;(check-expect (fibnat 2) 2)
;(check-expect (fibnat 4) 5)
;(check-expect (fibnat 7) 21)

(define (fibnat n)
  (cond[(zero? n) 1]
       [(= n 1) 1]
       [else (+ (fibnat (sub1 n)) (fibnat (sub1 (sub1 n))))]
       ))

; intervalo :: Natural -> ListOf Number
; Dado un numero natural n devuelve una lista con los numeros de n a 0

;(check-expect (intervalo 5) (list 5 4 3 2 1 0))
;(check-expect (intervalo 2) (list 2 1 0))
;(check-expect (intervalo 0) (list 0))

(define (intervalo n)
  (cond[(zero? n) (cons 0 '())]
       [else (cons n (intervalo (sub1 n)))]
       ))

; list-fibonacci-map :: Number -> ListOf Number
; Dado un numero n la funcion devolvera una lista con los primeros n valores de la sucesion fibonacci

(check-expect (list-fibonacci-map 4) (list 5 3 2 1 1))
(check-expect (list-fibonacci-map 0) (list 1))

(define (list-fibonacci-map n) (map fibnat (intervalo n)))

; list-fibonacci-rec :: Number -> ListOf Number
; Dado un numero n la funcion devolvera una lista con los primeros n valores de la sucesion fibonacci

(check-expect (list-fibonacci-rec 4) (list 5 3 2 1 1))
(check-expect (list-fibonacci-rec 0) (list 1))

(define (list-fibonacci-rec n)
  (cond[(zero? n) (list 1)]
       [(= n 1) (list 1 1)]
       [else (cons (fibnat n) (list-fibonacci-rec (sub1 n)))]
       ))

(time (list-fibonacci-map 30))
(time (list-fibonacci-rec 30))
