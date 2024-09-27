;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-advanced-reader.ss" "lang")((modname Ejercicio-3) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #t #t none #f () #f)))
; f :: Number Number Boolean -> Number
; Dados dos numeros (n, m) y un booleano la funcion devolvera:
; - n+m si: m+2 es igual a n
; - n+m+3 si: n es menor que m y b es verdadero
; - 2*n si: no se cumplen ninguna de las anteriores


(define (f n m b) (cond [(= n (+ m 2)) (+ n m)]
                        [(and (< n m) b) (+ n m 3)]
                        [else (* 2 n)]))

;  (fun 4 2 #t) y (fun 5 6 #f).

#|

(fun 4 2 #t)

==

(cond [(= 4 (+ 2 2)) (+ 4 2)]
      [(and (< 4 2) #t) (+ 4 2 3)]
      [else (* 2 4)]))

==

(cond [(= 4 4) (+ 4 2)]
      [(and (< 4 2) #t) (+ 4 2 3)]
      [else (* 2 4)]))

==

(cond [#true (+ 4 2)]
      [(and (< 4 2) #t) (+ 4 2 3)]
      [else (* 2 4)]))

==

(+ 4 2)

==

6
_______________________________________________

(fun 5 6 #f)

==

(cond [(= 5 (+ 6 2)) (+ 5 6)]
      [(and (< 5 6) #f) (+ 5 6 3)]
      [else (* 2 5)]))

==

(cond [(= 5 8) (+ 5 6)]
      [(and (< 5 6) #f) (+ 5 6 3)]
      [else (* 2 5)]))

==

(cond [#false (+ 5 6)]
      [(and (< 5 6) #F) (+ 5 6 3)]
      [else (* 2 5)]))

==

(cond [(and (< 5 6) #f) (+ 5 6 3)]
      [else (* 2 5)]))

==

(cond [(and #t #f) (+ 5 6 3)]
      [else (* 2 5)]))

==

(cond [#false (+ 5 6 3)]
      [else (* 2 5)]))

==

(cond [else (* 2 5)]))

==

(* 2 5)

==

10

|#
