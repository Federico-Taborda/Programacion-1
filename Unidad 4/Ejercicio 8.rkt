;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname |Ejercicio 8|) (read-case-sensitive #t) (teachpacks ((lib "universe.rkt" "teachpack" "2htdp") (lib "abstraction.rkt" "teachpack" "2htdp") (lib "web-io.rkt" "teachpack" "2htdp") (lib "image.rkt" "teachpack" "2htdp"))) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ((lib "universe.rkt" "teachpack" "2htdp") (lib "abstraction.rkt" "teachpack" "2htdp") (lib "web-io.rkt" "teachpack" "2htdp") (lib "image.rkt" "teachpack" "2htdp")) #f)))
(define-struct Texto [cadena color tamaño])
; Texto es (String, Color, Number)
; Intepretación: El primer elemento es la cadena a mostarse, mientras que el segundo y
; el tercero determinan el color y tamaño de la fuente en píxeles respectivamente.

; Representamos el color del texto como un string
; Representamos la fuente del texto como un valor numerico
; Representamos el alto y el ancho de la escena como un valor numerico

(define COLOR "black")
(define FUENTE 20)
(define ESTADO_INICIAL (make-Texto "" COLOR FUENTE))
(define ANCHO 600)
(define ALTO 400)
(define ESCENA (empty-scene ANCHO ALTO))

; define: Estado -> Image
; La funcion recibe el estado y lo imprime en la pantalla
(define (dibujar estado)
  (place-image/align (text (Texto-cadena estado) (Texto-tamaño estado) (Texto-color estado)) 0 0 "left" "top" ESCENA))

; manejadorTeclado: Estado string -> Image
; La funcion recibe el estado y una tecla presionada y concatena el caracter al estado
; Entrada: "asd"; Salida: "asd";
(define (manejadorTeclado estado tecla)
  (cond[(key=? tecla "\b") (borrarLetra estado)]
       [(or (key=? tecla "up") (key=? tecla "down")) (cambiar-tamaño estado tecla)]
       [(key=? tecla "f1") (cambiar-color estado "green")]
       [(key=? tecla "f2") (cambiar-color estado "red")]
       [(key=? tecla "f3") (cambiar-color estado "yellow")]
       [(key=? tecla "f4") (cambiar-color estado "blue")]
       [(key=? tecla "f5") (cambiar-color estado "indigo")]
       [(key=? tecla "f6") (cambiar-color estado "purple")]
       [else (make-Texto (string-append (Texto-cadena estado) tecla) (Texto-color estado) (Texto-tamaño estado))]
       ))

(check-expect (manejadorTeclado (make-Texto "asd" COLOR FUENTE) "f" ) (make-Texto "asdf" COLOR FUENTE))
(check-expect (manejadorTeclado (make-Texto "ASD" COLOR FUENTE) "f" ) (make-Texto "ASDf" COLOR FUENTE))
(check-expect (manejadorTeclado (make-Texto "123" COLOR FUENTE) "f" ) (make-Texto "123f" COLOR FUENTE))

; cambiar-tamaño: Struct String -> Struct
; La funcion recibe el estado y cambia su tamaño
(define (cambiar-tamaño estado tamaño)
  (cond[(and (> (Texto-tamaño estado) 8) (string=? tamaño "down")) (make-Texto (Texto-cadena estado) (Texto-color estado) (- (Texto-tamaño estado) 1))]
       [(and (< (Texto-tamaño estado) 48) (string=? tamaño "up")) (make-Texto (Texto-cadena estado) (Texto-color estado) (+ (Texto-tamaño estado) 1))]
       [else estado]))

; cambiar-color: Struct String -> Struct
; La funcion recibe el estado y cambia su color
(define (cambiar-color estado color) (make-Texto (Texto-cadena estado) color (Texto-tamaño estado)))

; borrarLetra: String -> String
; La funcion recibe un texto y le quita el ultimo caracter
; Entrada: ""; Salidad: "";
; Entrada: "ab"; Salidad: "a";
; Entrada: "Hola s"; Salidad: "Hol";
(define (borrarLetra estado)
  (if(<= (string-length (Texto-cadena estado)) 1)
     (make-Texto "" COLOR FUENTE)
     (make-Texto (remover-caracter (Texto-cadena estado)) (Texto-color estado) (Texto-tamaño estado)
     )))

(check-expect (borrarLetra (make-Texto "" COLOR FUENTE)) (make-Texto "" COLOR FUENTE))
(check-expect (borrarLetra (make-Texto "ab" COLOR FUENTE)) (make-Texto "a" COLOR FUENTE))
(check-expect (borrarLetra (make-Texto "Hola s" COLOR FUENTE)) (make-Texto "Hola " COLOR FUENTE))

; remover-caracter: String -> String
; La funcion elimina el ultimo caracter de un string
(define (remover-caracter string) (substring string 0 (- (string-length string) 1)))

(big-bang ESTADO_INICIAL
    [to-draw dibujar]
    [on-key manejadorTeclado])