;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-intermediate-reader.ss" "lang")((modname |Ejercicio 10|) (read-case-sensitive #t) (teachpacks ((lib "image.rkt" "teachpack" "2htdp") (lib "abstraction.rkt" "teachpack" "2htdp") (lib "universe.rkt" "teachpack" "2htdp") (lib "web-io.rkt" "teachpack" "2htdp"))) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ((lib "image.rkt" "teachpack" "2htdp") (lib "abstraction.rkt" "teachpack" "2htdp") (lib "universe.rkt" "teachpack" "2htdp") (lib "web-io.rkt" "teachpack" "2htdp")) #f)))
; multiplos :: Natural Natural -> ListOf Numbers
; Dados dos numeros naturales (n, m) la funcion devolvera una lista con los primeros n multiplos positivos de m

(check-expect (multiplos 4 7) (list 28 21 14 7))
(check-expect (multiplos 0 1) empty)

(define (multiplos n m)
  (cond[(zero? n) empty]
       [else (if(= (modulo (* n m) m) 0)
                (cons (* n m) (multiplos (sub1 n) m))
                (multiplos (sub1 n) m))]
       ))