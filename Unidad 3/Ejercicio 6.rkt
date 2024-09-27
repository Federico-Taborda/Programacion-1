;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname |6|) (read-case-sensitive #t) (teachpacks ((lib "image.rkt" "teachpack" "2htdp") (lib "universe.rkt" "teachpack" "2htdp"))) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ((lib "image.rkt" "teachpack" "2htdp") (lib "universe.rkt" "teachpack" "2htdp")) #f)))
; El estado es un string, representando el texto que aparece en pantalla
(define ESTADO_INICIAL "")
(define ESCENA (empty-scene 600 400))

(define (dibujar texto) (place-image/align (text texto 20 "indigo") 0 0 "left" "top" ESCENA))

; manejadorTeclado: Estado string -> Image
; La funcion recibe el estado y una tecla presionada y concatena el caracter al estado
; Entrada: "asd"; Salida: "asd";
(define (manejadorTeclado estado tecla)
  (if(key=? tecla "\b") (borrarLetra estado) (string-append estado tecla)))

(check-expect (manejadorTeclado "asd" "f" ) "asdf")
(check-expect (manejadorTeclado "ASD" "f" ) "ASDf")
(check-expect (manejadorTeclado "123" "f" ) "123f")

; borrarLetra: String -> String
; La funcion recibe un texto y le quita el ultimo caracter
; Entrada: ""; Salidad: "";
; Entrada: "ab"; Salidad: "a";
; Entrada: "Hola s"; Salidad: "Hol";
(define (borrarLetra texto)
  (if(<= (string-length texto) 0) "" (substring texto 0 (- (string-length texto) 1))))

(check-expect (borrarLetra "") "")
(check-expect (borrarLetra "ab") "a")
(check-expect (borrarLetra "Hola s") "Hola ")

(big-bang ESTADO_INICIAL
    [to-draw dibujar]
    [on-key manejadorTeclado])