;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-intermediate-reader.ss" "lang")((modname |Ejercicio 31|) (read-case-sensitive #t) (teachpacks ((lib "image.rkt" "teachpack" "2htdp") (lib "abstraction.rkt" "teachpack" "2htdp") (lib "universe.rkt" "teachpack" "2htdp") (lib "web-io.rkt" "teachpack" "2htdp"))) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ((lib "image.rkt" "teachpack" "2htdp") (lib "abstraction.rkt" "teachpack" "2htdp") (lib "universe.rkt" "teachpack" "2htdp") (lib "web-io.rkt" "teachpack" "2htdp")) #f)))
; Representamos el alto y el ancho de la escena como un valor numerico
; Representamos el color del texto en pantalla como strings

(define AZUL "blue")
(define ROJO "red")
(define ALTO 500)
(define ANCHO 500)
(define ESCENA (empty-scene ANCHO ALTO))

(define-struct Turno [ant act])
; Turno es (List(String), List(String)), donde
; ant es la lista de teclas ingresada por el jugador anterior,
; act es la lista de teclas ingresada por el jugador actual.
 
; El estado del programa es un Turno,
; inicialmente ambas listas son vacías.
(define ESTADO-INICIAL (make-Turno empty empty))

; interpretar :: Estado ListOf Strings -> Image
; Dado una lista de turnos muestra en pantalla un texto representando a quien le toca jugar y una tecla presionada
(define (interpretar estado)
  (place-image
   (cond[(and (empty? (Turno-act estado)) (even? (length (Turno-act estado)))) (mostrarTexto "Turno: Jugador 1" ROJO)]
        [(and (empty? (Turno-act estado)) (odd? (length (Turno-act estado)))) (mostrarTexto "Turno: Jugador 2" AZUL)]
        [(even? (length (Turno-act estado))) (mostrarTexto (string-append "Turno: Jugador 1 - " (first (Turno-act estado))) ROJO)]
        [(odd? (length (Turno-act estado))) (mostrarTexto (string-append "Turno: Jugador 2 - " (first (Turno-act estado))) AZUL)])
   (/ ANCHO 2) (/ ALTO 2) ESCENA))

; mostrarTexto :: String -> Image
; Dado un string, muestra en pantalla un texto
(define (mostrarTexto texto color)
  (text texto 24 color))

; manejarTeclado :: Estado String -> Estado
; Dada una tecla presionada agrega a la lista del estado dicha tecla
(define (manejarTeclado estado tecla)
  (cond[(< (length (Turno-act estado)) 1) (make-Turno empty (verificarTecla estado tecla))]
       [(listasIguales?) (make-Turno empty (verificarTecla estado tecla))]
     ))

; verificarTecla :: String -> String
; Dada una tecla verifica si es una flecha y de ser asi agregara la tecla al estado
(define (verificarTecla estado tecla)
  (cond[(key=? tecla "up") (cons "up" (Turno-act estado))]
       [(key=? tecla "left") (cons "left" (Turno-act estado))]
       [(key=? tecla "right") (cons "right" (Turno-act estado))]
       [(key=? tecla "down") (cons "down" (Turno-act estado))]
       [else (Turno-act estado)]))
  
; listasIguales? :: ListOf Strings ListOf Strings -> Boolean
; Dadas dos listas la funcion determina si las dos listas contienen los mismos elementos
(define (listasIguales? lista1 lista2)
  (cond[(and (empty? lista1) (empty? lista2)) #t]
       [(and (cons? lista1) (cons? lista2)) (if(string=? (first lista1) (first lista2)) (listasIguales? (rest lista1) (rest lista2)) #f)]
       [else 0]
       ))

; finalizar? :: Estado -> Boolean
; La funcion devolvera verdadero si las listas de ambos jugadores son iguales, sino devolvera falso
(define (finalizar? estado)
  (if(and (= (length (Turno-ant estado)) -1) (= (length (Turno-act estado)) -1)) #t #f))

;Expresion big-bang

(big-bang ESTADO-INICIAL
  [to-draw interpretar]
  [on-key manejarTeclado]
  [stop-when finalizar?]
  )