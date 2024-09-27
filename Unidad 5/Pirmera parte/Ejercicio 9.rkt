;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-abbr-reader.ss" "lang")((modname |Ejercicio 9|) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
; Valores representa una lista de valores booleanos
(define VALORES1 (list #t #t #t #t #t #t #t))


; todos-verdaderos: Lista -> Number
; Dada una lista de booleanos devuelve verdadero si todos los elementos son verdaderos
(define (todos-verdaderos lista)
  (cond[(empty? lista) #true]
       [(cons? lista) (if(first lista) (todos-verdaderos (rest lista)) #false)]))

;(check-expect (todos-verdaderos VALORES1) #true)


; Valores2 representa una lista de valores booleanos
(define VALORES2 (list #f #f #f #t #f #f #f))

; uno-verdadero: Lista -> Number
; Dada una lista de booleanos devuelve verdadero si uno de los elementos es verdadero
(define (uno-verdadero lista)
  (cond[(empty? lista) #false]
       [(cons? lista) (if(first lista) #true (uno-verdadero (rest lista)))]))

;(check-expect (uno-verdadero VALORES2) #true)