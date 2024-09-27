;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-intermediate-reader.ss" "lang")((modname |Ejercicio 14|) (read-case-sensitive #t) (teachpacks ((lib "image.rkt" "teachpack" "2htdp") (lib "abstraction.rkt" "teachpack" "2htdp") (lib "universe.rkt" "teachpack" "2htdp") (lib "web-io.rkt" "teachpack" "2htdp"))) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ((lib "image.rkt" "teachpack" "2htdp") (lib "abstraction.rkt" "teachpack" "2htdp") (lib "universe.rkt" "teachpack" "2htdp") (lib "web-io.rkt" "teachpack" "2htdp")) #f)))
(define-struct Cuadrado [img ang])
; Cuadrado puede ser (Image Number)
; Interpretacion: Representa una imagen de un cuadrado donde:
; - img la imagen que lo representa
; - ang su angulo de rotacion

(define ALTO 400)
(define ANCHO 400)
(define ESCENA (empty-scene ANCHO ALTO))

(define (cuadrado m) (square (* 2 (sqr m)) "outline" "black"))

(define (dibujar imagen escena) (place-image imagen (/ ANCHO 2) (/ ALTO 2) escena))

(define (rotar c) (rotate (Cuadrado-ang c) (Cuadrado-img c) ))

; cuadrados :: Natural Number -> Image
; Dado un numero natural y un angulo de rotacion la funcion devolvera una imagen cuadrada de lado 200 con m cuadrados
; azules centrados de tamaño m a la 2. El angulo de rotacion cada cuadrado sera de 20 grados mayor que el anterior
; para cualquier valor de m mayor o igual a 1

(define (cuadrados m)
  (local [(define (lista-cuadrados ang m)
            (cond[(zero? m) empty]
                 [else (cons (make-Cuadrado (cuadrado m) ang) (lista-cuadrados (+ ang 20) (sub1 m)))]
                 ))]
    (foldr dibujar ESCENA (map rotar (lista-cuadrados 20 m)))))

(cuadrados 10)
