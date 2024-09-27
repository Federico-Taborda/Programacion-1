;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-abbr-reader.ss" "lang")((modname |Ejercicio 13|) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
; Palabras representa una lista de palabras
(define PALABRAS (list "Lista" "de" "palabras" "sin" "sentido"))

; cortas: Lista -> Lista
; Dada una lista de palabra devuelve una lista de palabras con longitud menor a 5
(define (cortas lista)
  (cond[(empty? lista) lista]
       [(cons? lista) (if(< (string-length (first lista)) 5)
                         (cons (first lista) (cortas (rest lista)))
                         (cortas (rest lista)))]))

(check-expect (cortas PALABRAS) (list "de" "sin"))