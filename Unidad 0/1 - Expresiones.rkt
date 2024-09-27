;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname |1 Expresiones|) (read-case-sensitive #t) (teachpacks ((lib "draw.rkt" "teachpack" "htdp") (lib "image.rkt" "teachpack" "2htdp") (lib "abstraction.rkt" "teachpack" "2htdp") (lib "batch-io.rkt" "teachpack" "2htdp") (lib "convert.rkt" "teachpack" "htdp") (lib "itunes.rkt" "teachpack" "2htdp") (lib "elevator.rkt" "teachpack" "htdp"))) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ((lib "draw.rkt" "teachpack" "htdp") (lib "image.rkt" "teachpack" "2htdp") (lib "abstraction.rkt" "teachpack" "2htdp") (lib "batch-io.rkt" "teachpack" "2htdp") (lib "convert.rkt" "teachpack" "htdp") (lib "itunes.rkt" "teachpack" "2htdp") (lib "elevator.rkt" "teachpack" "htdp")) #f)))
; 1 Expresiones

(+ 2 3)
(+ 2 (* 3 4))

; 2 Expresiones Aritmeticas

(- (* 12 5) (* 7 6))
(- (* 3 5) (/ (* 7 4) (/ (+ 14 3) 1)))
(+ (+ (cos 0.8) (/ 1 5)) (* (sin 0.5) 3))

(/ 1 (sin (sqrt 3)))
(* (sqrt 2) (sin 3))
;(+ 3 (sqrt (-4))) Se espera una funcion
(* (sqrt 5) (sqrt (/ 3 (cos pi))))
;(/ (sqrt 5) (sin (* 3 0))) Division por cero
;(/ (+ 3) (* 2 4)) Se esperan al menos dos argumentos
(* 1 2 3 4 5 6 7 8)
(/ 120 2 3 2 2 5)