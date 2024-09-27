;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname |1 - Condicionales multiples|) (read-case-sensitive #t) (teachpacks ((lib "draw.rkt" "teachpack" "htdp") (lib "image.rkt" "teachpack" "2htdp") (lib "abstraction.rkt" "teachpack" "2htdp") (lib "batch-io.rkt" "teachpack" "2htdp") (lib "convert.rkt" "teachpack" "htdp") (lib "itunes.rkt" "teachpack" "2htdp") (lib "elevator.rkt" "teachpack" "htdp"))) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ((lib "draw.rkt" "teachpack" "htdp") (lib "image.rkt" "teachpack" "2htdp") (lib "abstraction.rkt" "teachpack" "2htdp") (lib "batch-io.rkt" "teachpack" "2htdp") (lib "convert.rkt" "teachpack" "htdp") (lib "itunes.rkt" "teachpack" "2htdp") (lib "elevator.rkt" "teachpack" "htdp")) #f)))
; 1 Condicionales multiples

(define (sgn1 x)
  (if (< x 0) -1 (if (= x 0) 0 1)))

;(sgn1 -1)

;(cond [(< 0 0) -1]
;      [(= 0 0) 0]
;      [(> 0 0) 1])

(define (tamaño-imagen alto ancho)
  (cond [(= alto ancho) "Cuadrada"]
        [(>= ancho (* 2 alto)) "Muy ancha"]
        [(> ancho alto) "Ancha"]
        [(> alto ancho) "Muy angosta"]
        [(>= ancho (* 2 alto)) "Angosta"]))

;(tamaño-imagen 15 15)

(define (clasificar t) (cond [(<= t 0) "Muy frío (MF)"]
                             [(and (> t 0) (<= t 15)) "Frío (F)"]
                             [(and (>= t 15) (< t 25)) "Agradable (A)"]
                             [(> t 25) "Caluroso (C)"]))

(clasificar 15)

; 2 Predicados

(string? "Hola")
(string? 23)
(number? -4)
(number? (sqrt 2))
(number? "23")
(boolean? 0)
(string? (number->string 23))