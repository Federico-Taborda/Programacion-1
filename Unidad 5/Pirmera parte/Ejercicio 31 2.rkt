;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-intermediate-reader.ss" "lang")((modname |Ejercicio 31 2|) (read-case-sensitive #t) (teachpacks ((lib "image.rkt" "teachpack" "2htdp") (lib "abstraction.rkt" "teachpack" "2htdp") (lib "universe.rkt" "teachpack" "2htdp") (lib "web-io.rkt" "teachpack" "2htdp"))) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ((lib "image.rkt" "teachpack" "2htdp") (lib "abstraction.rkt" "teachpack" "2htdp") (lib "universe.rkt" "teachpack" "2htdp") (lib "web-io.rkt" "teachpack" "2htdp")) #f)))
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
(define (interpretar l)
  (cond[(empty? (Turno-act l))
        (if(even? (length (Turno-ant l)))
           (mostrarTexto "1" "" ROJO)
           (mostrarTexto "2" "" AZUL))]
       [(cons? (Turno-act l)) (if(even? (length (Turno-ant l)))
                                 (mostrarTexto "1" (first (Turno-act l))  ROJO)
                                 (mostrarTexto "2" (first (Turno-act l))  AZUL))]
       ))

; mostrarTexto :: String -> Image
; Dado un string, muestra en pantalla un texto
(define (mostrarTexto s1 s2 color)
  (place-image (text (if(string=? s1 "1")
                        (string-append "Turno: Jugador 1 " s2)
                        (string-append "Turno: Jugador 2 " s2)) 24 color) (/ ANCHO 2) (/ ALTO 2) ESCENA))

; mostrarFinal :: Estado -> Image
; La funcion muestra el ultimo texto en pantalla
(define (mostrarFinal e)
  (if(even? (length (Turno-ant e)))
     (place-image (text "Ganador: Jugador 1" 24 color) (/ ANCHO 2) (/ ALTO 2) ESCENA)
     (place-image (text "Ganador: Jugador 2" 24 color) (/ ANCHO 2) (/ ALTO 2) ESCENA)))
  
; terminaTurno? :: ListOf Strings -> Boolean
; Dadas dos listas, devolvera verdadero si la primer lista es un elemento mas largo que la otra
; en caso contrario devolvera falso
(define (terminaTurno? l1 l2) (if(= (length l1) (+ (length l2)  1)) #t #f))

; listasIguales? :: ListOf Strings ListOf Strings -> Boolean
; Dadas dos listas la funcion determina si las dos listas contienen los mismos elementos
(define (listasIguales? l1 l2)
  (cond[(and (empty? l1) (empty? l2)) #t]
       [(and (cons? l1) (cons? l2)) 
        (if(string=? (first l1) (first l2))
           (listasIguales? (rest l1) (rest l2))
           #f)]
       [else #t]
       ))

; manejarTeclado :: Estado String -> Estado
; Dada una tecla presionada agrega a la lista del estado dicha tecla
(define (manejarTeclado e k)
  (cond[(empty? (Turno-act e)) (make-Turno (Turno-ant e) (verificarTecla e k))]
       [(terminaTurno? (Turno-act e) (Turno-ant e))
        (if(listasIguales? (Turno-act e) (Turno-ant e))
           (make-Turno (Turno-act e) empty)
           0)]
       [else (make-Turno (Turno-ant e) (verificarTecla e k))]
       ))

; verificarTecla :: String -> String
; Dada una tecla verifica si es una flecha y de ser asi agregara la tecla al estado
(define (verificarTecla e k)
  (cond[(key=? k "up") (cons "Arriba" (Turno-act e))]
       [(key=? k "down") (cons "Abajo" (Turno-act e))]
       [(key=? k "right") (cons "Derecha" (Turno-act e))]
       [(key=? k "left") (cons "Izquierda" (Turno-act e))]
       [else e]
       ))

; finalizar? :: Estado -> Boolean
; La funcion devolvera verdadero si las listas de ambos jugadores son iguales, sino devolvera falso
(define (finalizar? estado)
  (if(= e 0) #t #f))

;Expresion big-bang

(big-bang ESTADO-INICIAL
  [to-draw interpretar]
  [on-key manejarTeclado]
  [stop-when finalizar? mostrarFinal]
  )