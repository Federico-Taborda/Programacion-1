;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname |3  Valores de verdad|) (read-case-sensitive #t) (teachpacks ((lib "draw.rkt" "teachpack" "htdp") (lib "image.rkt" "teachpack" "2htdp") (lib "abstraction.rkt" "teachpack" "2htdp") (lib "batch-io.rkt" "teachpack" "2htdp") (lib "convert.rkt" "teachpack" "htdp") (lib "itunes.rkt" "teachpack" "2htdp") (lib "elevator.rkt" "teachpack" "htdp"))) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ((lib "draw.rkt" "teachpack" "htdp") (lib "image.rkt" "teachpack" "2htdp") (lib "abstraction.rkt" "teachpack" "2htdp") (lib "batch-io.rkt" "teachpack" "2htdp") (lib "convert.rkt" "teachpack" "htdp") (lib "itunes.rkt" "teachpack" "2htdp") (lib "elevator.rkt" "teachpack" "htdp")) #f)))
; 4 Valores de verdad

(and #true (or #false (not #false)))

; - Definicion de not
(and #true (or #false #true))

; - Definicion de or
(and #true #true)

; - Definicion de and
#true

(< 3 (+ 2 2))

(not #t)
(or #t #f)
(and #t #f)
(and #t (or #f (not #f) (not #t)))
(or (= 2 (* 1 3)) (< 4 (+ 3 2)))

(and (> pi 3) (= (+ 2 2) 5))