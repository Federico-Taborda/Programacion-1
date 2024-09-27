;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname |Practica estructura posn|) (read-case-sensitive #t) (teachpacks ((lib "universe.rkt" "teachpack" "2htdp") (lib "abstraction.rkt" "teachpack" "2htdp") (lib "web-io.rkt" "teachpack" "2htdp") (lib "image.rkt" "teachpack" "2htdp"))) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ((lib "universe.rkt" "teachpack" "2htdp") (lib "abstraction.rkt" "teachpack" "2htdp") (lib "web-io.rkt" "teachpack" "2htdp") (lib "image.rkt" "teachpack" "2htdp")) #f)))
(define-struct punto [x y])
; punto es (Number, Number)
; interpretacion: un elemento en punto representa una posicion en coordenadas cartesianas

; Crea dos puntos y los guarda en constantes
(define P (make-punto 7 4))
(define Q (make-punto 1 2))

; Accede a las componentes de los puntos
;(punto-x P)
;(punto-y P)
;(punto-x Q)
;(punto-y Q)

; Verifica si la entrada es una estructura del tipo punto
;(punto? Q)
;(punto? P)

; distancia-origen: Number Number -> Number
; La funcion recibe las coordenadas (x, y) de un punto y devuelve la distancia al origen
(define (distancia-origen x y)
  (sqrt(+ (sqr(- 0 x)) (sqr(- 0 y)))))

; distancia-entre-puntos: Number Number Number Numbner -> Number
; La funcion recibe dos puntos en el plano y devuelve la distancia entre ellos
(define (distancia-entre-puntos p q)
  (if(and (punto? p) (punto? q))
     (sqrt(+ (sqr(- (punto-x p) (punto-x q))) (sqr(- (punto-y p) (punto-x q)))))
      "Tipos incorrectos para la función."))

;(distancia-origen (punto-x P) (punto-y P))
;(distancia-entre-puntos P Q)

; simetrico: posn -> posn
; La funcion recibe un punto y devuelve el simetrico al origen
(define (simetrico p)
  (if(> (punto-y p) 0)
     (make-punto (punto-x p) (- 0 (punto-y p)))
     (make-punto (punto-x p) (abs (punto-y p)))))

;(simetrico P)
