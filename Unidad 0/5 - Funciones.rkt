;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname |5 Funciones|) (read-case-sensitive #t) (teachpacks ((lib "draw.rkt" "teachpack" "htdp") (lib "image.rkt" "teachpack" "2htdp") (lib "abstraction.rkt" "teachpack" "2htdp") (lib "batch-io.rkt" "teachpack" "2htdp") (lib "convert.rkt" "teachpack" "htdp") (lib "itunes.rkt" "teachpack" "2htdp") (lib "elevator.rkt" "teachpack" "htdp"))) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ((lib "draw.rkt" "teachpack" "htdp") (lib "image.rkt" "teachpack" "2htdp") (lib "abstraction.rkt" "teachpack" "2htdp") (lib "batch-io.rkt" "teachpack" "2htdp") (lib "convert.rkt" "teachpack" "htdp") (lib "itunes.rkt" "teachpack" "2htdp") (lib "elevator.rkt" "teachpack" "htdp")) #f)))
; Funciones y constantes

(define A 3)

(* A 10)

(define P "Neptuno")
P

(define 1TRES 3)
1TRES

(define CINCO
  (+ 1 (* 2 2)))
CINCO

(define VERDADERO #true)
VERDADERO

(define PUNTOROJO
  (circle 3 "solid" "red"))
PUNTOROJO

(define (f x)
  (+ x 1))

(define (doble x)
  (* x 2))

(define (h x y)
  (< x (* 2 y)))

(define (cuad-azul x)
  (square x "solid" "blue"))

;(cuad-azul (* 2 10))

;(and (h 2 3) (h 3 4))

;(= (f 1) (* 2 1))