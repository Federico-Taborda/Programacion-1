;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-intermediate-reader.ss" "lang")((modname |EJercicio papel clase|) (read-case-sensitive #t) (teachpacks ((lib "image.rkt" "teachpack" "2htdp") (lib "universe.rkt" "teachpack" "2htdp"))) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ((lib "image.rkt" "teachpack" "2htdp") (lib "universe.rkt" "teachpack" "2htdp")) #f)))
; Ejercicio 4 papel

;sumNumericos: List(String) ->Number
;Recibe una lista de Strings y devuelve la suma todos aquellos que son enteros no negativos.

(check-expect (sumNumericos (list "12-9" "12" "sol" "1nos" "33.5" "10")) 22)
(check-expect (sumNumericos (list "-12" "sol" "33.5")) 0)
(check-expect (sumNumericos empty) 0)

(define (pos-and-inter? n)
     (and (number? n) (positive? n) (integer? n))
  )

(define (sumar n m) (+ n m))

(define (convertir n) (string->number n))

(define (sumNumericos lista)
  (foldr sumar 0 (filter pos-and-inter? (map convertir lista))))

; =====================================

; Ejercicio 5

;infAn: List(Number) Number ->List(Number)
;infAn recibe una lista de números y un número n; y devuelve la lista de números inferiores a n.

(check-expect (infAn (list 1 2 3 4) 3) (list 1 2))
(check-expect (infAn (list 1 2 3 4) 1) empty)

(define (infAn lista n)
  (local((define (mayor? m) (> n m)))
    (filter mayor? lista))
  )


; =====================================

; Ejercicio 6

;minimo: List(Number) ->Number
;Esta función recibe una lista NO vacía de números cualesquiera y devuelve el menor.
(check-expect (minimo (list -1.6 5 3 -80 6 57.9 0)) -80)

(define (minimo lista)
  (foldr min 0 lista))


; =====================================

; Ejercicio 7

;primeroPares: List(Number) ->List(Number)
;Esta función recibe una lista NO vacía de enteros y los ordena ubicando primer los pares y luego los impares.

(define LISTA1 (list 6 -2 8 0 12 100 9 -5 3 7))

(check-expect (primeroPares (list 9 -5 6 3 -2 8 0 12 100 7)) LISTA1)

(define (primeroPares lista)
  (foldr cons (filter odd? lista) (filter even? lista)))












