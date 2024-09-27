;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname Ejercicios) (read-case-sensitive #t) (teachpacks ((lib "image.rkt" "teachpack" "htdp") (lib "universe.rkt" "teachpack" "2htdp"))) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ((lib "image.rkt" "teachpack" "htdp") (lib "universe.rkt" "teachpack" "2htdp")) #f)))
(define INICIAL "red")
(define ESCENA (empty-scene 300 300))
(define RADIO 20)
(define COLOR "blue")

; dibujar : Imagen -> Imagen
; Dado una imagen la dibuja dentro de una escena
(define (dibujar imagen) (place-image imagen 150 150 ESCENA))

; circulo : Number -> Image
; Transforma el estado del sistema en una imagen a mostrar a traves de la clausula to-draw

(define (circulo r)
  (cond[(and (>= r 0) (<= r 50)) (dibujar (circle r "solid" "yellow"))]
       [(and (>= r 51) (<= r 100)) (dibujar (circle r "solid" "red"))]
       [(>= r 100) (dibujar (circle r "solid" "green"))]))

; decrementar : Number -> Number
; Devuelve el predecesor de un numero positivo
; Si el numero es 0, devuelve 100

(define (decrementar n)
  (if (= n 0) 100 (- n 1)))

; terminar? : Number -> Boolean
; Devuelve verdadero si el estado cumple la condicion y falso si no la cumple
(define (terminar? n)
  (cond[(or (> n 110) (< n 10)) #t]
       [else #f]))

; incrementar : Number -> Number
; Incrementa en 1 el valor del estado si el circulo cabe en toda la pantalla
(define (incrementar n)
  (if(>= n 150) 0 (+ n 1)))

; manejarTeclado : Number -> Number
; Maneja el evento de teclado. Si cumple la condicion multiplica el estado por 2
(define (manejarTeclado s k)
  (cond [(key=? k "d") (* 2 s)]
        [else s]))

(big-bang RADIO
  [to-draw circulo]
  [on-key manejarTeclado]
  [on-tick incrementar]
  [stop-when terminar?])
