;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-abbr-reader.ss" "lang")((modname |Ejercicio 1|) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
; Contactos puede ser:
; '()
; (cons Nombre Lista-de-Contactos)
; Interpretacion: Una lista de contactos donde cada nombre se representa con un String

(cons "Federico"
      (cons "Gabriel"
            (cons "Daniel"
                  (cons "Ariel"
                        (cons "Taborda" '())))))