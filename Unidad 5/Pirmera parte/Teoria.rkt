;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-intermediate-reader.ss" "lang")((modname Teoria) (read-case-sensitive #t) (teachpacks ((lib "image.rkt" "teachpack" "2htdp") (lib "web-io.rkt" "teachpack" "2htdp") (lib "batch-io.rkt" "teachpack" "2htdp") (lib "abstraction.rkt" "teachpack" "2htdp") (lib "universe.rkt" "teachpack" "2htdp"))) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ((lib "image.rkt" "teachpack" "2htdp") (lib "web-io.rkt" "teachpack" "2htdp") (lib "batch-io.rkt" "teachpack" "2htdp") (lib "abstraction.rkt" "teachpack" "2htdp") (lib "universe.rkt" "teachpack" "2htdp")) #f)))
; Expresion
'() ; Es un valor tipo lista

; Agrega un elemento a la lista, de esta manera se construye una nueva lista
(cons "Federico" '())

; Si queremos agregar mas de un elemento a la lista solo hay que aplicar el constructor dos veces
(cons "Federico" (cons "Gabriel" '())) ; De esta manera agregamos cuantos elemento queramos

; Definir una lista de nombres de personas

; Contactos es:
; una lista vacia '() o
; una expresion del tipo (cons un-nombre-de-persona Contactos)
; Contactos representa una lista de nombres de personas, donde el nombre sera de tipo String


; ==============================
; Operador        Tipo de operador        Funcion
;'()              Constructor             Representa la lista vacia
;empty?           Predicado               Verifica si una lista es vacia
;cons             Constructor             Agrega un elemento a la lista
;first            Selector                Devuelve el primer elemento de la lista
;rest             Selector                Devuelve la lista sin su primer elemento
;cons?            Predicado               Verifica si una lista tien elementos
;member?          Predicado               Verifica si el dato es un elemento de la lista

; empty - Representa a '() una lista vacia
; list - Es un operador que nos sirve para simplificar la escritura de listas

