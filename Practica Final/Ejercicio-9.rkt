;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-intermediate-reader.ss" "lang")((modname Ejercicio-9) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
(check-expect (subcadena? (list "cadena" "Helena" "casa") "ena") (list "cadena" "Helena"))
(check-expect (subcadena? (list "Hola" "mundo") "eso") '())
(check-expect (subcadena? '() "altos") '())

(define (subcadena? lista s)
  (local [
          (define (contiene? cadena)
            (string-contains? s cadena))
          ] (if(empty? lista) empty (filter contiene? lista))
    ))