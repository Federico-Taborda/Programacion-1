;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname |Practica 0|) (read-case-sensitive #t) (teachpacks ((lib "draw.rkt" "teachpack" "htdp") (lib "image.rkt" "teachpack" "2htdp") (lib "abstraction.rkt" "teachpack" "2htdp") (lib "batch-io.rkt" "teachpack" "2htdp") (lib "convert.rkt" "teachpack" "htdp") (lib "itunes.rkt" "teachpack" "2htdp") (lib "elevator.rkt" "teachpack" "htdp"))) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ((lib "draw.rkt" "teachpack" "htdp") (lib "image.rkt" "teachpack" "2htdp") (lib "abstraction.rkt" "teachpack" "2htdp") (lib "batch-io.rkt" "teachpack" "2htdp") (lib "convert.rkt" "teachpack" "htdp") (lib "itunes.rkt" "teachpack" "2htdp") (lib "elevator.rkt" "teachpack" "htdp")) #f)))
; Funcion que recibe dos numeros x e y, y devuelve la distancia al origen de punto (x, y)
(define (distanciaAlOrigen x y)
  (sqrt (+ (expt x 2) (expt y 2))))
;(distanciaAlOrigen 5 10)

; Funcion que recibe cuatro numeros x1 y1 x2 y2 y devuelve la distancia entre los puntos (x1, y1) (x2, y2)
(define (distanciaEntreDosPuntos x1 y1 x2 y2)
  (sqr(+ (expt (- x2 x1) 2) (expt (- y2 y1) 2))))
;(distanciaEntreDosPuntos 4 2 7 3)

; Funcion que recibe la longitud de la arista de un cubp y calcula su area
(define (area-cubo aristaLongitud)
  (* 6 (expt aristaLongitud 2)))
;(area-cubo 3)

; Funcion que recibe una longitud expresada en metros devuelva su equivalente en pies
(define(metro-pie longitud)
  (/ longitud 0.3048))
;(metro-pie 10)

; Funcion que recibe una medida en celcius y la convierte a fahrenheit
(define (cel-far celcius)
  (+ (/ (* celcius 9) 5) 32))
;(cel-far 60)

; Funcion que recibe tres numero positivos (a, b, c) y comprueba que se pueda construir un triangulo de lado (a, b, c)
(define (positivos? a b c)
  (if(and (> a 0) (> b 0) (> c 0))
     #true
     "Los numeros no son positivos"))

(define (triangulo? a b c)
  (and (> (+ a b) c) (> (+ b c) a) (> (+ a c) b)))

(define (posible? a b c)
  (if (and (positivos? a b c) (triangulo? a b c))
      #true
      #false))

(posible? 1 3 3)

; Funcion que recibe tres numeros y devuelve true o false si estos forman o no una terna pitagorica

(define (terna? a b c)
  (if (= (expt c 2) (+ (expt a 2)(expt b 2)))
      #t
      #f))

(terna? 3 4 5)

; Funcion que recibe dos strings y devuelve la suma de su longitud de caracteres
(define (longitudPalabra palabra)
  (string-length palabra))

(define (suma-long palabra1 palabra2)
  (+ (longitudPalabra palabra1) (longitudPalabra palabra2)))

(suma-long "a" "bc")

; Funcion que recibe un string y devuelve true si la palabra empieza con "A"

(define (comienzaA? palabra)
  (if (string=? (substring palabra 0 1) "A")
      #true
      #false))

(comienzaA? "Arbol")

; Funcion que recibe un string y un numero i e inserta un "." en la posicion i-esima
(define (dividirPalabra str num1 num2)
  (substring str num1 num2))


(define (poner- str num)
  (string-append (dividirPalabra str 0 num) "." (dividirPalabra str (+ num 1) (string-length str))))

(poner- "Programar" 6)
