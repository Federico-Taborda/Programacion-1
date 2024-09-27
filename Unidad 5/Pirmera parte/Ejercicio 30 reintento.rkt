;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-intermediate-reader.ss" "lang")((modname |Ejercicio 30 (reintento)|) (read-case-sensitive #t) (teachpacks ((lib "image.rkt" "teachpack" "2htdp") (lib "universe.rkt" "teachpack" "2htdp"))) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ((lib "image.rkt" "teachpack" "2htdp") (lib "universe.rkt" "teachpack" "2htdp")) #f)))
; Dos jugadores
; Anunciar la flecha tecleada
; Jugador 1 presiona una tecla
; Jugador 2 repite la flecha y agrega una nueva
; Jugador 1 repite y agrega una nueva
; El que se equivoca pierde

; Representamos el alto y el ancho de la escena como un valor numerico
; Representamos el color de los texto como strings
; Representamos el texto de los jugadores como strings

(define-struct Turno [ant act])
; Turno es (List(String), List(String)), donde
; ant es la lista de teclas ingresada por el jugador anterior,
; act es la lista de teclas ingresada por el jugador actual.
 
; El estado del programa es un Turno, inicialmente ambas listas son vacías.
(define ESTADO-INICIAL (make-Turno empty empty))

(define ALTO 500)
(define ANCHO 500)
(define ESCENA (empty-scene ANCHO ALTO))

(define J1 "Jugador 1: ")
(define J2 "Jugador 2: ")

(define AZUL "blue")
(define ROJO "red")

(define PRIMER-TURNO (make-Turno empty (list "up")))

; interpretar :: Estado -> Image
; Dada una lista como estado muestra el turno del jugador actual
(define (interpretar estado)
  (cond[(empty? (Turno-act estado)) (dibujar-imagen ESCENA)]
       [(cons? (Turno-act estado)) (if(turno? estado)
                          (dibujar-imagen (dibujarTexto J1 (first (Turno-act estado)) ROJO))
                          (dibujar-imagen (dibujarTexto J2 (first (Turno-act estado)) AZUL)))]
       ))

; insertar-imagen :: Image -> Image
; Dada una imagen la imprime en el canvas
(define (dibujar-imagen img) (place-image img (/ ANCHO 2) (/ ALTO 2) ESCENA))

; dibujarTexto :: String String -> Image
; Dado dos textos y un color la funcion imprime una imagen con el texto del color asignado
(define (dibujarTexto texto1 texto2 color) (text (string-append texto1 texto2) 25 color))

; turno? :: Estado -> Boolean
; Dado un turno devulve como resultado:
; - verdadero si el turno del jugador 1
; - falso si el turno del jugador 2
(define (turno? t) (even? (length (Turno-act t))))

; termina? :: Estado -> Boolean
; Dado un estado determina si el turno termina o no
(define (termina? turno) (> (length (Turno-act turno)) (length (Turno-ant turno))))

; agregar-tecla :: String -> Estado
; Dado una tecla presionada y un turno agrega la misma al turno actual
(define (agregar-tecla estado string ) (make-Turno (Turno-ant estado) (cons string (Turno-act estado))))

; manejar-teclado :: Estado String -> Estado
; Dado un estado actual verifica la flecha tecleada y la agrega al turno actual
(define (manejar-teclado estado tecla)
  (cond[(or (key=? tecla "left")
            (key=? tecla "right")
            (key=? tecla "up")
            (key=? tecla "down")) (if(termina? estado)
                                     (make-Turno (Turno-act estado) empty)
                                     (agregar-tecla estado tecla))]
       [else estado]
       ))
  
; Expresion big-bang
(big-bang ESTADO-INICIAL
  [to-draw interpretar]
  [on-key manejar-teclado]
  )