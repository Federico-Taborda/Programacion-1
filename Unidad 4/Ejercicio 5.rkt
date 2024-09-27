;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname |Ejercicio 5|) (read-case-sensitive #t) (teachpacks ((lib "universe.rkt" "teachpack" "2htdp") (lib "abstraction.rkt" "teachpack" "2htdp") (lib "web-io.rkt" "teachpack" "2htdp") (lib "image.rkt" "teachpack" "2htdp"))) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ((lib "universe.rkt" "teachpack" "2htdp") (lib "abstraction.rkt" "teachpack" "2htdp") (lib "web-io.rkt" "teachpack" "2htdp") (lib "image.rkt" "teachpack" "2htdp")) #f)))
; El estado del sistema sera una estructura tipo posn, representando las coordenadas del objeto
; Representaremos el alto y el ancho de la escena como un valor numerico
; Representaremos el radio del circulo como un valor numerico
; Representaremos el color del circulo con un string
; Representaremos las unidades que haran subir o bajar el objeto como un valor numerico

(define ALTO 300)
(define ANCHO 300)
(define ESCENA (empty-scene ANCHO ALTO))
(define RADIO 50)
(define COLOR_CIRCULO "red")
(define DELTA 10)

(define-struct objeto [x y])
(define INICIAL (make-objeto (/ ANCHO 2) (/ ALTO 2)))

; interpretar: Estado -> Image
; La funcion recibe una estructura tipo posn y devuelve un circulo en el canvas
(define (interpretar estado)
  (place-image (circle RADIO "solid" COLOR_CIRCULO) (objeto-x estado) (objeto-y estado) ESCENA))

; manejarTeclado: Estado String -> Posn
; La funcion recibe una estructura tipo posn y una tecla presionada
; Si el objeto esta dentro de los limites del canvas, se movera hacia arriba o hacia abajo
; Si no se devuelve el estado incial
(define (manejarTeclado estado tecla)
  (if(and (< (+ (objeto-y estado) RADIO) ALTO) (> (- (objeto-y estado) RADIO) (- ALTO ALTO)))
     (make-objeto (objeto-x estado) (cond[(key=? tecla "up") (- (objeto-y estado) DELTA)]
                                         [(key=? tecla "down") (+ (objeto-y estado) DELTA)]
                                         [(key=? tecla " ") (/ ALTO 2)]
                                         [else (objeto-y estado)]))
     INICIAL))

; Expresion big-bang
(big-bang INICIAL
  [to-draw interpretar]
  [on-key manejarTeclado])