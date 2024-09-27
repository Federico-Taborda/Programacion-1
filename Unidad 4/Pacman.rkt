;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-intermediate-reader.ss" "lang")((modname Pacman) (read-case-sensitive #t) (teachpacks ((lib "image.rkt" "teachpack" "2htdp") (lib "web-io.rkt" "teachpack" "2htdp") (lib "batch-io.rkt" "teachpack" "2htdp") (lib "abstraction.rkt" "teachpack" "2htdp") (lib "universe.rkt" "teachpack" "2htdp"))) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ((lib "image.rkt" "teachpack" "2htdp") (lib "web-io.rkt" "teachpack" "2htdp") (lib "batch-io.rkt" "teachpack" "2htdp") (lib "abstraction.rkt" "teachpack" "2htdp") (lib "universe.rkt" "teachpack" "2htdp")) #f)))
; El estado del sistema sera sera una estructura que representara el Pacman

; Representamos el alto y el ancho de la escena como un valor numerico
; Representamos el radio del pacman como un valor numerico
; Representamos las unidades que avanzara el pacman como un valor numerico
; Representamos los limites superior, inferior, izquierdo y derecho como un valor numerico

(define-struct Pacman [x y direccion])
; interpretacion: Pacman es (Number Number String)
; La estructura representara el pacman siendo:
; - Primer elemento su coordenada x
; - Segundo elemento su coordenada y
; - Tercer elemento su direccion el cual puede ser "derecha", "izquierda", "arriba" y "abajo"

(define DELTA 25)
(define ANCHO 500)
(define ALTO 500)
(define RADIO 30)
(define LIMITE_SUPERIOR (+ 0 RADIO))
(define LIMITE_INFERIOR (- ALTO RADIO))
(define LIMITE_IZQUIERDO (+ 0 RADIO))
(define LIMITE_DERECHO (- ANCHO RADIO))
(define ESCENA (empty-scene ANCHO ALTO))

(define INICIAL (make-Pacman (/ ANCHO 2) (/ ALTO 2) "derecha"))

; interpretar :: Estado -> Image
; Dado un estado la funcion devolvera como resultado una imagen
(define (interpretar estado)
  (place-image (rotate (grados (Pacman-direccion estado)) (wedge RADIO 300 "solid" "gold"))
               (Pacman-x estado) (Pacman-y estado) ESCENA))

; grados :: String -> Number
; Dado un sentido la funcion devolvera la rotacion del pacman
(define (grados direccion)
  (cond[(string=? direccion "derecha") 30]
       [(string=? direccion "izquierda") 210]
       [(string=? direccion "arriba") 120]
       [(string=? direccion "abajo") 300]
       ))

; limite? :: Pacman -> Boolean
; Dada una estructura del tipo pacman devolvera:
; - verdadero si esta dentro del limite
; - falso si no esta dentro del limite
(define (limite? pac)
  (and (> (Pacman-y pac) LIMITE_SUPERIOR)
       (< (Pacman-y pac) LIMITE_INFERIOR)
       (> (Pacman-x pac) LIMITE_IZQUIERDO)
       (< (Pacman-x pac) LIMITE_DERECHO)
       ))

; manejarTeclado :: Estado String -> Estado
; Dada una flecha presionada el pacman cambiara de direccion y avanzara DELTA unidades
(define (manejarTeclado estado tecla)
  (if(limite? estado)
     (cond[(key=? tecla "up") (make-Pacman (Pacman-x estado) (- (Pacman-y estado) DELTA) "arriba")]
       [(key=? tecla "down") (make-Pacman (Pacman-x estado) (+ (Pacman-y estado) DELTA) "abajo")]
       [(key=? tecla "left") (make-Pacman (- (Pacman-x estado) DELTA) (Pacman-y estado) "izquierda")]
       [(key=? tecla "right") (make-Pacman (+ (Pacman-x estado) DELTA) (Pacman-y estado) "derecha")]
       [else estado] 
       )
     INICIAL)
  )

; Expresion big-bang
(big-bang INICIAL
  [to-draw interpretar]
  [on-key manejarTeclado]
  )

