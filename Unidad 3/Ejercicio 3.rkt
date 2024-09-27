;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname |Ejercicio 3|) (read-case-sensitive #t) (teachpacks ((lib "image.rkt" "teachpack" "htdp") (lib "universe.rkt" "teachpack" "2htdp"))) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ((lib "image.rkt" "teachpack" "htdp") (lib "universe.rkt" "teachpack" "2htdp")) #f)))
; El estado es un string, representando el color de circulo
; Posibles Valores:
; "red"
; "yellow"
; "green"
; El estado es un numero; representando el radio del circulo
; Posibles Valores:
; [0 <= radio <= 150]

; Mezcle dos ejercicios. No hay ejercicios con mas de un estado(por ahora)

(define INICIAL "red")
(define ESCENA (empty-scene 300 300))
(define RADIO 20)
(define COLOR "blue")

; dibujar : Imagen -> Imagen
; Dado una imagen la dibuja dentro de una escena
(define (dibujar radio color) (place-image (circle radio "solid" color) 150 150 ESCENA))

; circulo : Number -> Image
; Transforma el estado del sistema en una imagen a mostrar a traves de la clausula to-draw
(define (circulo radio)
  (cond[(and (>= radio 0) (<= radio 50)) (dibujar radio "yellow")]
       [(and (>= radio 51) (<= radio 100)) (dibujar radio "red")]
       [(>= radio 100) (dibujar radio "green")]))

; decrementar : Number -> Number
; Devuelve el predecesor de un numero positivo
; Si el numero es 0, devuelve 100
; Entrada: 0; Salida: 100;
; Entrada: 100; Salida: 99;
; Entrada: 50; Salida: 49;
(define (decrementar n)
  (if (= n 0) 100 (- n 1)))

(check-expect(decrementar 0) 100)
(check-expect(decrementar 100) 99)
(check-expect(decrementar 50) 49)

; terminar? : Number -> Boolean
; Devuelve verdadero o falso si cumple o no la condicion
; Verdadero si n es mayor a 110 o menor a 10 sino es Falso
; Entrada: 50; Salida: false;
; Entrada: 111; Salida: true;
; Entrada: 8; Salida: false;
(define (terminar? n) (or (> n 110) (< n 10)))

(check-expect(terminar? 50) #f)
(check-expect(terminar? 111) #t)
(check-expect(terminar? 8) #t)

; incrementar : Number -> Number
; Le suma uno a un numero
; Entrada: 1; Salida: 2;
; Entrada: 3; Salida: 4;
; Entrada: 5; Salida: 6;
(define (incrementar n)
  (if(>= n 150) 0 (+ n 1)))

(check-expect(incrementar 1) 2)
(check-expect(incrementar 2) 3)
(check-expect(incrementar 3) 4)

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
