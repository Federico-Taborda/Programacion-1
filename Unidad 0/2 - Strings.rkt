;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname |2  Strings|) (read-case-sensitive #t) (teachpacks ((lib "draw.rkt" "teachpack" "htdp") (lib "image.rkt" "teachpack" "2htdp") (lib "abstraction.rkt" "teachpack" "2htdp") (lib "batch-io.rkt" "teachpack" "2htdp") (lib "convert.rkt" "teachpack" "htdp") (lib "itunes.rkt" "teachpack" "2htdp") (lib "elevator.rkt" "teachpack" "htdp"))) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ((lib "draw.rkt" "teachpack" "htdp") (lib "image.rkt" "teachpack" "2htdp") (lib "abstraction.rkt" "teachpack" "2htdp") (lib "batch-io.rkt" "teachpack" "2htdp") (lib "convert.rkt" "teachpack" "htdp") (lib "itunes.rkt" "teachpack" "2htdp") (lib "elevator.rkt" "teachpack" "htdp")) #f)))
; 3 Strings

"yaguarete"
"b"
"45"
"Pueblo que se somete, perece."

(string-append "Program" "ar")
(string-append "El " "oso " "sala " "la " "sopa.")
(string-length "Primer año")
(number->string 42)

(string-append "Hola" "mundo")
(string-append "Pro" "gra" "ma.")
(number->string 1357)
(string-append "La respuesta es " (number->string (+ 21 21)))
(* (string-length "Hola") (string-length "Chau"))

(string-ith "Mi nombre" 1)
(substring "Programar" 2 6)
