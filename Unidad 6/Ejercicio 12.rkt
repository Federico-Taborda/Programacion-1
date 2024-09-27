;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-intermediate-reader.ss" "lang")((modname |Ejercicio 12|) (read-case-sensitive #t) (teachpacks ((lib "image.rkt" "teachpack" "2htdp") (lib "abstraction.rkt" "teachpack" "2htdp") (lib "universe.rkt" "teachpack" "2htdp") (lib "web-io.rkt" "teachpack" "2htdp"))) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ((lib "image.rkt" "teachpack" "2htdp") (lib "abstraction.rkt" "teachpack" "2htdp") (lib "universe.rkt" "teachpack" "2htdp") (lib "web-io.rkt" "teachpack" "2htdp")) #f)))
; intervalo :: Natural -> ListOf Number
; Dado un numero natural n devuelve una lista con los numeros de n a 0

;(check-expect (intervalo 5) (list 5 4 3 2 1 0))
;(check-expect (intervalo 2) (list 2 1 0))
;(check-expect (intervalo 0) (list 0))

(define (intervalo n)
  (cond[(zero? n) (cons 0 '())]
       [else (cons n (intervalo (sub1 n)))]
       ))

; cuotas :: Number Number Number -> ListOf Number
; Dado un importe total de un prestamo, un numero n de cuotas y un i de interes, devuelve una lista de cuotas ordenadas de mayor a menor

(check-expect (cuotas 10000 0 18) empty)
(check-expect (cuotas 10000 1 12) (list 10100))
(check-expect (cuotas 30000 3 12) (list 10100 10200 10300))
(check-expect (cuotas 100000 4 18) (list 25375 25750 26125 26500))

(define (cuotas total cuotas interes)
  (local [
          (define (cuota-j-esima j)
            (+ (/ total cuotas) (* (/ total cuotas) (/ interes 1200) j)))
          ]
    (map cuota-j-esima (reverse (filter positive? (intervalo cuotas))))
    ))