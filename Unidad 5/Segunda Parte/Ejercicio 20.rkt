;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-intermediate-reader.ss" "lang")((modname |Ejercicio 20|) (read-case-sensitive #t) (teachpacks ((lib "image.rkt" "teachpack" "2htdp") (lib "abstraction.rkt" "teachpack" "2htdp") (lib "universe.rkt" "teachpack" "2htdp") (lib "web-io.rkt" "teachpack" "2htdp"))) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ((lib "image.rkt" "teachpack" "2htdp") (lib "abstraction.rkt" "teachpack" "2htdp") (lib "universe.rkt" "teachpack" "2htdp") (lib "web-io.rkt" "teachpack" "2htdp")) #f)))
(define PUNTOS (list (make-posn 3 5) (make-posn 1 2) (make-posn 0 1) (make-posn 5 6)))

(define (distancia punto)
  (sqrt (+ (expt (- (posn-x punto) 0) 2) (expt (- (posn-y punto) 0) 2))))

(define (lejos l m)
  (local(
         (define (distancia-mayor? n) (if(> (distancia n) m) #t #f))
         ) (filter distancia-mayor? l)))

(lejos PUNTOS 4)