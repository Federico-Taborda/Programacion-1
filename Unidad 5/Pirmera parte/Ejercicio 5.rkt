;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-abbr-reader.ss" "lang")((modname |Ejercicio 5|) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
; Contactos puede ser:
; '()
; (cons Nombre Lista-de-Contactos)
; Interpretacion: representa una lista de contactos con nombres representados por Strings
(define CONTACTOS (list "Federico" "Gabriel" "Pedro" "Ivan"))

; contiene?: Lista String -> Boolean
; Dada una lista de contactos y un string, la funcion verifica si el string es un elemento de esa lista
(define (contiene? lista nombre)
  (cond[(empty? lista) #false] 
       [(cons? lista)
        (if(string=? (first lista) nombre)
                         #true
                         (contiene? (rest lista) nombre))])) 

(check-expect (contiene? CONTACTOS "Gabriel") #true)

; Verifica si el dato es un elemento de la lista
(member? "Federico" CONTACTOS)