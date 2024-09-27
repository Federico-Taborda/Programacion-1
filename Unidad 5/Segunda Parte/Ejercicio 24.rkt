;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-intermediate-reader.ss" "lang")((modname |Ejercicio 24|) (read-case-sensitive #t) (teachpacks ((lib "image.rkt" "teachpack" "2htdp") (lib "abstraction.rkt" "teachpack" "2htdp") (lib "universe.rkt" "teachpack" "2htdp") (lib "web-io.rkt" "teachpack" "2htdp"))) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ((lib "image.rkt" "teachpack" "2htdp") (lib "abstraction.rkt" "teachpack" "2htdp") (lib "universe.rkt" "teachpack" "2htdp") (lib "web-io.rkt" "teachpack" "2htdp")) #f)))
(define PUNTOS(list (make-posn 3 4) (make-posn 0 3)))

(define (distancia punto)
  (sqrt (+ (expt (- (posn-x punto) 0) 2) (expt (- (posn-y punto) 0) 2))))

; Dada una lista de puntos devuelve una lista de distancias al origen de cada punto
(define (distancias l) (map distancia l))

; Dada una lista de numeros devuelve la suma de ellos
(define (suma l) (foldr + 0 l))

; Dada una lista de puntos devuelve la suma de sus distancias al origen
(define (sumadist l) (suma (distancias l)))

(sumadist PUNTOS)