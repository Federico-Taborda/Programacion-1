;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-advanced-reader.ss" "lang")((modname Ejercicio-4) (read-case-sensitive #t) (teachpacks ((lib "image.rkt" "teachpack" "2htdp"))) (htdp-settings #(#t constructor repeating-decimal #t #t none #f ((lib "image.rkt" "teachpack" "2htdp")) #f)))
; f :: Number String Boolean Image -> Number
; Dados un numero a, un string b, un booleano c y una imagen d la funcion devolvera:
; - si c es verdadero: (3 - a) + 1 + el ancho de d
; - si c es falso: (3 - a) + la longitud de b + el ancho de d
(define (f a b c d)
          (+ (- 3 a) (if c 1 (string-length b)) (image-width d)))

(check-expect (f 2 "a" #t (circle 5 "solid" "red")) 12)
(check-expect (f 4 "aa" #f (circle 2 "solid" "red")) 5)
(check-expect (f 6 "aaa" #f (circle 10 "solid" "red")) 20)


; g :: Number String Number -> Number || String
(define (g x y z)
        (if (> x (string-length y))
            (if (> 3 z) (+ x 24) 13)
            (if (= (string-length y) 4) z "Error")))

(define (g2 x y z)
  (cond[(and (> x (string-length y)) (> 3 z)) (+ x 24)]
       [(> x (string-length y)) 13]
       [(= (string-length y) 4) z]
       [else "Error"]))

(check-expect (g 1 "a" 1) "Error")
(check-expect (g 2 "aaaa" 1) 1)
(check-expect (g 3 "aa" 1) 27)
(check-expect (g 3 "aa" 4) 13)

(check-expect (g2 1 "a" 1) "Error")
(check-expect (g2 2 "aaaa" 1) 1)
(check-expect (g2 3 "aa" 1) 27)
(check-expect (g2 3 "aa" 4) 13)
