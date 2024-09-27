;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-abbr-reader.ss" "lang")((modname |Ejercicios en clase|) (read-case-sensitive #t) (teachpacks ((lib "universe.rkt" "teachpack" "2htdp") (lib "image.rkt" "teachpack" "2htdp"))) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ((lib "universe.rkt" "teachpack" "2htdp") (lib "image.rkt" "teachpack" "2htdp")) #f)))
; Representamos el nombre de una persona como un string

; Contactos es:
; - una lista vacia '() o
; - una expresión del tipo (cons un-nombre-persona Contactos)

; contiene-Marcos? : Contactos -> Booleano
; dada una lista de Contactos, determina si "Marcos" es un elemento de la misma
(define (contiene-marcos? l) (cond [(empty? l) #false]
                                   [(cons? l)
                                    (if(string=? (first l) "Marcos")
                                       #t
                                       (contiene-marcos? (rest l)))]
                                   ))

(define (contiene-marcos2? l) (cond [(empty? l) #false]
                                   [(cons? l)
                                    (or (string=? (first l) "Marcos")
                                        (contiene-marcos? (rest l)))]
                                   ))

;(contiene-marcos? (list "Marcos"))
;(contiene-marcos2? (list "Marcos"))

; contiene: String Contactos -> Boolean
; Dada una lista y una plabra devuelve verdadero o falso si la lista contiene la palabra
(define (contiene? s l) (cond [(empty? l) #false]
                                   [(cons? l)
                                    (if(string=? s "Marcos")
                                       #t
                                       (contiene? s (rest l)))]
                                   ))

;(contiene? "Marcos" (list "Marcos"))


; longitud :: ListOf Any -> Number
; La funcion longitud calcula la cantidad de elementos (sin importar el tipo) de una lista
(define (longitud l) (cond [(empty? l) 0]
                                   [(cons? l) (+ 1 (longitud (rest l)))]
                                   ))

;(longitud (list "Marcos"))

; ===================================================================================
; Ejercicio 7

; Una Lista-de-montos es:
; – '()
; – (cons NumeroPositivo Lista-de-montos)
; Montos representa una lista con montos de dinero
(define MONTOS (list  1 2 3 4 5))

; suma :: ListOf Number -> Number
; Dada una una lista de montos devuelve la suma de todos ellos
(define (suma l) (cond [(empty? l) 0]
                       [(cons? l) (+ (first l) (suma (rest l)))]
                       ))

;(suma MONTOS)

;(check-expect (suma MONTOS) 15)
;(check-expect (suma '()) 0)

; ===================================================================================
; Ejercicio 8

; Una Lista-Numeros-positivos es:
; – '()
; – (cons NumeroPositivo Lista-Numeros-positivos)
; Montos representa una lista con numeros positivos
(define POSITIVOS (list  1 2 3 4 5))

; pos? :: ListOf Number -> Boolean
; Dada una lista de montos devuelve verdadero si todos sus elementos son numeros positivos
(define (pos? l) (cond [(empty? l) #true]
                       [(cons? l) (and (>= (first l) 0) (pos? (rest l)))]
                       ))

(check-expect (pos? POSITIVOS) #true)

; checked-suma :: ListOf Number -> Number
; Dada una lista de montos devuelve la suma de sus elementos si pertenece a la lista montos
(define (checked-suma l) (if (pos? l) (suma l) "Error"))

;(checked-suma POSITIVOS)

; ===================================================================================
; Ejercicio 9

; Una Lista-Booleanos es:
; – '()
; – (cons Booleano Lista-Booleanos)
; Booleanos representa una lista con boleanos
(define BOOLEANOS (list  #t #t #t #t #t))


; todos-verdaderos :: ListOf Number -> Boolean
; Dada una lista de booleanos devuelve verdadero si todos sus elementos son verdaderos
(define (todos-verdaderos l) (cond [(empty? l) #true]
                       [(cons? l) (and (first l) (todos-verdaderos (rest l)))]
                       ))

;(todos-verdaderos BOOLEANOS)

; ===================================================================================
; Ejercicio 9

; uno-verdaderos :: ListOf Number -> Boolean
; Dada una lista de booleanos devuelve verdadero si todos sus elementos son verdaderos
(define (uno-verdaderos l) (cond [(empty? l) #false]
                       [(cons? l) (and (first l) (uno-verdaderos (rest l)))]
                       ))

;(uno-verdaderos BOOLEANOS)

; ===================================================================================
; Ejercicio 11

; promedio :: ListOf Number -> Number
; Dada una lista de numeros devuelve el promedio de ellos
; ESTA FUNCION RECORRE DOS VECES LA LISTA ASI QUE NO ES BUENA OPCION
(define (promedio l)
  (/ (checked-suma l) (length l)))


(check-expect (promedio (list 4 4)) 4)
(check-expect (promedio (list 5 10)) 7.5)
(check-expect (promedio (list 0 0)) 0)

; Recursion de cola (lleva el resultado en los argumentos de la funcion)
(define (promedio_aux m n l)
  (cond[(empty? l) (/ m n)]
       [(cons? l) (promedio_aux
                   (+ (first l) m)
                   (+ 1 m)
                   (rest l))]
       ))

(define (promedio2 l) (cond[(empty? l) 0]
                           [else (promedio_aux 0 0 l)]))

; ===================================================================================
; Ejercicio 12

; pares :: ListOf Number -> ListOf Number
; Dada una lista de numeros devuelve una lista de numeros pares de l
(define (pares l) (cond[(empty? l) l]
                       [(cons? l) (if(even? (first l))
                                  (cons (first l) (pares (rest l)))
                                  (pares (rest l)))]
                       ))

(pares MONTOS)
(pares '())







