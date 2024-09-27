;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-intermediate-reader.ss" "lang")((modname |Ejercicio 13|) (read-case-sensitive #t) (teachpacks ((lib "image.rkt" "teachpack" "2htdp") (lib "abstraction.rkt" "teachpack" "2htdp") (lib "universe.rkt" "teachpack" "2htdp") (lib "web-io.rkt" "teachpack" "2htdp"))) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ((lib "image.rkt" "teachpack" "2htdp") (lib "abstraction.rkt" "teachpack" "2htdp") (lib "universe.rkt" "teachpack" "2htdp") (lib "web-io.rkt" "teachpack" "2htdp")) #f)))

(define ALTO 400)
(define ANCHO 400)
(define ESCENA (empty-scene ANCHO ALTO))

(define (circulo m) (circle m "outline" "blue"))
(define (cuadrado m) (square (* 2 (sqr m)) "outline" "black"))

(define (dibujar imagen escena) (place-image imagen (/ ANCHO 2) (/ ALTO 2) escena))

; circulos :: Natural -> Image
; Dado un numero natural m la funcion devuelve una imagen cuadrada de lado 2*m a la 2 con m circulos azules y radios m a la 2
(define (circulos m)
  (local [(define (lista-circulos m)
            (cond[(zero? m) empty]
                 [else (cons (circulo (sqr m)) (lista-circulos (sub1 m)))]))]
  (foldr dibujar ESCENA (cons (cuadrado m) (lista-circulos m)))))

(circulos 14)
