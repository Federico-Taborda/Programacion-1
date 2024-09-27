;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname |2 - Ejercicios|) (read-case-sensitive #t) (teachpacks ((lib "draw.rkt" "teachpack" "htdp") (lib "image.rkt" "teachpack" "2htdp") (lib "abstraction.rkt" "teachpack" "2htdp") (lib "batch-io.rkt" "teachpack" "2htdp") (lib "convert.rkt" "teachpack" "htdp") (lib "itunes.rkt" "teachpack" "2htdp") (lib "elevator.rkt" "teachpack" "htdp"))) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ((lib "draw.rkt" "teachpack" "htdp") (lib "image.rkt" "teachpack" "2htdp") (lib "abstraction.rkt" "teachpack" "2htdp") (lib "batch-io.rkt" "teachpack" "2htdp") (lib "convert.rkt" "teachpack" "htdp") (lib "itunes.rkt" "teachpack" "2htdp") (lib "elevator.rkt" "teachpack" "htdp")) #f)))
; 1
; 1.1

(define (tamaño-imagen alto ancho)
  (if(> alto ancho)
     "Angosta"
     "Ancho"))

;(tamaño-imagen 200 200)


; 1.2

(define (tamaño-imagen2 alto ancho)
  (cond [(> alto ancho) "Angosta"]
      [(< alto ancho) "Ancha"]
      [(= alto ancho) "Cuadrada"]))

;(tamaño-imagen2 200 200)

; 1.3

(define (tipo-triangulo a b c)
  (cond [(= a b c) "Equilatero"]
        [(or (= a b) (= a c) (= b c)) "Isosceles"]
        [(not (= a b c)) "Escaleno"]))

;(tipo-triangulo 60 60 60)
;(tipo-triangulo 90 10 80)
;(tipo-triangulo 30 30 120)

; 1.4

(define (tipo-triangulo2 a b c)
  (if(= (+ a b c) 180)
     (cond [(= a b c) "Equilatero"]
        [(or (= a b) (= a c) (= b c)) "Isosceles"]
        [(not (= a b c)) "Escaleno"])
     
     "La suma de los angulos interios de un triangulo es 180"))

;(tipo-triangulo2 1 1 1)

; 1.5

(define PRECIO-LAPIZ 10)
(define PRECIO-CUADERNO 40)
(define OFERTA-LAPIZ 15)
(define OFERTA-CUADERNO 10)

(define (descuento precio oferta) (- precio (/ (* oferta precio) 100)))
(define (calcular-precio cantidad monto) (* monto cantidad))

(define (precio-lapices cantidad)
  (if (>= cantidad 5)
      (calcular-precio cantidad (descuento PRECIO-LAPIZ OFERTA-LAPIZ) )
      (calcular-precio cantidad PRECIO-LAPIZ)))

(define (precio-cuadernos cantidad)
  (if (>= cantidad 5)
      (calcular-precio cantidad (descuento PRECIO-CUADERNO OFERTA-CUADERNO))
      (calcular-precio cantidad PRECIO-CUADERNO)))

;(precio-lapices 10)
;(precio-cuadernos 10)

; 1.6

(define (precio-lapices2 cantidad)
  (cond [(>= cantidad 10) (calcular-precio cantidad (descuento PRECIO-LAPIZ 18))]
        [(>= cantidad 5) (calcular-precio cantidad (descuento PRECIO-LAPIZ OFERTA-LAPIZ))]
        [else (calcular-precio cantidad PRECIO-LAPIZ)]))

(define (precio-cuadernos2 cantidad)
  (cond [(>= cantidad 10) (calcular-precio cantidad (descuento PRECIO-CUADERNO 18))]
        [(>= cantidad 5) (calcular-precio cantidad (descuento PRECIO-CUADERNO OFERTA-CUADERNO))]
        [else (calcular-precio cantidad PRECIO-CUADERNO)]))

;(precio-lapices2 10)
;(precio-cuadernos2 10)

; 1.7

(define (terna? a b c)
  (if (= (expt c 2) (+ (expt a 2)(expt b 2)))
      #t
      #f))

;(terna? 3 4 5)

; 1.8

(define (terna2? a b c)
  (if (= (expt c 2) (+ (expt a 2)(expt b 2)))
      (string-append"Los numeros " (number->string a) " " (number->string b) " " (number->string c) " forman una terna pitagorica" )
      (string-append"Los numeros " (number->string a) " " (number->string b) " " (number->string c) " no forman una terna pitagorica" )))

;(terna2? 2 4 5)

; 1.9

(define (collatz n)
  (if(> n 0)
     (cond [(integer? (/ n 2)) "Es Par"]
           [(integer? (* 3 (+ n 1))) "Es Impar"])
     "No es un numero natural"))

;(collatz -3)

; 2
; 2.1

(define ESCENA (empty-scene 90 60))

(define (bandera-tres-bandas-verticales a b c) (place-image (rectangle 30 60 "solid" a) 15 30 (place-image (rectangle 30 60 "solid" b) 45 30 (place-image (rectangle 30 60 "solid" c) 75 30 ESCENA))))
(define (bandera-tres-bandas-horizontales a b c) (place-image (rectangle 90 20 "solid" a) 45 10 (place-image (rectangle 90 20 "solid" b) 45 30 (place-image (rectangle 90 20 "solid" c) 45 50 ESCENA))))

(define(dibujar-bandera color1 color2 color3 sentido)
  (cond [(string-ci=? sentido "vertical") (bandera-tres-bandas-verticales color1 color2 color3)]
        [(string-ci=? sentido "horizontal") (bandera-tres-bandas-horizontales color1 color2 color3)]))

(dibujar-bandera "red" "white" "red" "vertical")
(dibujar-bandera "green" "white" "red" "vertical")
(dibujar-bandera "black" "yellow" "red" "vertical")
(dibujar-bandera "blue" "white" "red" "vertical")
(dibujar-bandera "black" "red" "yellow" "horizontal")
(dibujar-bandera "red" "white" "blue" "horizontal")
(dibujar-bandera "green" "white" "green" "vertical")
(dibujar-bandera "red" "yellow" "red" "horizontal")





























