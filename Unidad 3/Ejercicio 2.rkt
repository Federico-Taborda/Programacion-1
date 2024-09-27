;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname |Unidad 3 ejercicio 2|) (read-case-sensitive #t) (teachpacks ((lib "image.rkt" "teachpack" "2htdp") (lib "universe.rkt" "teachpack" "2htdp"))) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ((lib "image.rkt" "teachpack" "2htdp") (lib "universe.rkt" "teachpack" "2htdp")) #f)))
; Dado un estado de tipo string, representara el radio del circulo
(define ESTADO_INICIAL 50)

(define ESCENA (empty-scene 300 300))

; interpretar : Estado -> Image
; Transforma el estado del sistema en una imagen a mostrar a través de la cláusula to-draw
(define
   (interpretar n)
   (place-image (circle ESTADO_INICIAL "solid" "red") 150 150 ESCENA))

; decrementar : Number -> Number
; Devuelve el predecesor de un número positivo. Si el número es 0, devuelve 100. 
  (define (decrementar n)
    (if(<= n 0) 100 (- n 10)))

; incrementar : Number -> Number
; Suma uno a su argumento
 (define (incrementar n) (+ n 1))

(big-bang ESTADO_INICIAL                 
          [to-draw interpretar]
          [on-tick decrementar 0.5])