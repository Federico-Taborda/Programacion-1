;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-intermediate-reader.ss" "lang")((modname |Ejercicio 4|) (read-case-sensitive #t) (teachpacks ((lib "image.rkt" "teachpack" "2htdp") (lib "web-io.rkt" "teachpack" "2htdp") (lib "batch-io.rkt" "teachpack" "2htdp") (lib "abstraction.rkt" "teachpack" "2htdp") (lib "universe.rkt" "teachpack" "2htdp"))) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ((lib "image.rkt" "teachpack" "2htdp") (lib "web-io.rkt" "teachpack" "2htdp") (lib "batch-io.rkt" "teachpack" "2htdp") (lib "abstraction.rkt" "teachpack" "2htdp") (lib "universe.rkt" "teachpack" "2htdp")) #f)))
; Contactos puede ser:
; '()
; (cons Nombre Lista-de-Contactos)
; Interpretacion: representa una lista de contactos con nombres representados por Strings
(define CONTACTOS (list "Eugenia" "Lucia" "Dante" "Federico" "Marcos" "Gabina" "Laura" "Pamela"))


; contiene-marcos? :: ListOf Contactos -> Boolean
; Dada una lista de contactos, determina si el String "Marcos" esta contenido en la lista
(define (contiene-marcos? lista)
  (cond[(empty? lista) #false]
       [(cons? lista) (if(string=? (first lista) "Marcos")
                         #true
                         (contiene-marcos? (rest lista)))]
       ))

(check-expect (contiene-marcos? '()) #f)
(check-expect (contiene-marcos? (list "Laura")) #f)
(check-expect (contiene-marcos? (list "Marcos")) #t)
(check-expect (contiene-marcos? CONTACTOS) #t)