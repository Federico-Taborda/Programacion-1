;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-intermediate-reader.ss" "lang")((modname |Ejercicio 4|) (read-case-sensitive #t) (teachpacks ((lib "image.rkt" "teachpack" "2htdp") (lib "abstraction.rkt" "teachpack" "2htdp") (lib "universe.rkt" "teachpack" "2htdp") (lib "web-io.rkt" "teachpack" "2htdp"))) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ((lib "image.rkt" "teachpack" "2htdp") (lib "abstraction.rkt" "teachpack" "2htdp") (lib "universe.rkt" "teachpack" "2htdp") (lib "web-io.rkt" "teachpack" "2htdp")) #f)))
(define PUNTOS (list (make-posn 3 5) (make-posn 1 2) (make-posn 0 1) (make-posn 5 6)))

(define MAX 5)

(define (distancia x1 y1)
  (sqrt (+ (expt (- x1 0) 2) (expt (- y1 0) 2))))

(define (cerca l) (if(< (distancia (posn-x l) (posn-y l)) MAX) #t #f))

(filter cerca PUNTOS)
