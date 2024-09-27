;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-abbr-reader.ss" "lang")((modname |Ejercicio 8|) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))

; Montos representa una lista con montos de dinero
(define MONTOS (list 100 100 100 100 100))

; checked-suma: Lista Number -> Number
; Dada una lista de monstos, devuelve la suma de todos ellos
(define (checke-suma lista)
  (cond[(empty? lista) 0]
       [(cons? lista) (+ (first lista) (checked-suma (rest lista)))]))

;(check-expect (suma MONTOS) 200)

;=================================================================

; pos?: Lista -> Number
; Dada una lista de numeros determina si todos sus elementos son numeros positivos

(define (pos? lista)
  (cond[(empty? lista) #true]
       [(cons? lista) (if(> (first lista) 0) (pos? (rest lista)) #false)]))

(check-expect (pos? MONTOS) #t)

; No entendi bien el ejercicio