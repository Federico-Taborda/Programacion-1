;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-abbr-reader.ss" "lang")((modname |Ejercicio 6|) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
; contiene-marcos? :: ListOf Contactos -> Boolean
; Dada una lista de contactos, determina si el String "Marcos" esta contenido en la lista
(define (contiene-marcos? lista)
  (cond[(empty? lista) #false]
       [(cons? lista) (if(string=? (first lista) "Marcos")
                         #true
                         (contiene-marcos? (rest lista)))]
       ))

; Otra manera de definir la funcion
(define (contiene-marcos?2 lista)
  (cond[(empty? lista) #false]
       [(string=? (first lista) "Marcos") #true]
       [else (contiene-marcos?2 (rest lista))]
       ))

(contiene-marcos? (cons "Marcos" (cons "C" '())))
(contiene-marcos? (cons "A"(cons "Marcos" (cons "C" '()))))
(contiene-marcos? (cons "A"(cons "B" (cons "C" '()))))