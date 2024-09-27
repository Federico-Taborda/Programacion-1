;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-intermediate-reader.ss" "lang")((modname a) (read-case-sensitive #t) (teachpacks ((lib "image.rkt" "teachpack" "2htdp") (lib "abstraction.rkt" "teachpack" "2htdp") (lib "universe.rkt" "teachpack" "2htdp") (lib "web-io.rkt" "teachpack" "2htdp"))) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ((lib "image.rkt" "teachpack" "2htdp") (lib "abstraction.rkt" "teachpack" "2htdp") (lib "universe.rkt" "teachpack" "2htdp") (lib "web-io.rkt" "teachpack" "2htdp")) #f)))
(define (implica p q)
  (or (not p) q))

(define (equivalente p q)
  (or (and p q)
      (and (not p) (not q))))

; numero-binario :: Natural -> ListOf Number
; Dado un numero natural n la funcion devolvera su equivalente en binario en una lista donde cada
; elemento sera el bit que le corresponda al numero en binario
(define (numero-binario n)
  (cond[(= n 0) empty]
       [else (cons (remainder n 2) (numero-binario (quotient n 2)))]
       ))

#|(check-expect (numero-binario 2) (list 0 1))
(check-expect (numero-binario 1) (list 1 ))
(check-expect (numero-binario 5) (list 1 0 1))|#

; bits-nesecesarios :: ListOf Number ListOf Number -> Number
; Dados un numero maximo y un numero n la funcion determinara cuantos bits son nesecesarios para
; completar un binario
(define (bits-necesarios max n)
  (- (length (numero-binario max)) (length (numero-binario n))))

; completar-bits :: ListOf Number Natural -> ListOf Number
; Dado lista que representa un numero binario y una cantidad de bits la funcion devolvera el binario
; con la cantidad de bits maximo asignado
(define (completar-bits binario bits)
  (cond[(zero? bits) binario]
       [else (cons 0 (completar-bits binario (sub1 bits)))]
       ))

; binario-booleano :: ListOf Number -> ListOf Boolean
; Dado una lista que representa a un numero en binario la funcion devolvera una lista convirtiendo
; cada bit de la lista a un booleano:
; true - si es impar
; false - si es par
(define (binario-booleano lista) (map odd? lista))

#|(check-expect (binario-booleano (list 0 0 0 0)) (list #f #f #f #f))
(check-expect (binario-booleano (list 0 0 0 1)) (list #f #f #f #t))
(check-expect (binario-booleano (list 0 0 1 1)) (list #f #f #t #t))|#

; valuaciones :: Natural -> ListOf (ListOf Boolean)
; Dado un numero natural n la funcion devolvera todas las posibles valuaciones que existen
; con n variables proposicionales
(define (valuaciones n)
  (local [(define (lista m)
            (cond[(< m 0) empty]
                 [else (cons (completar-bits (numero-binario m) (bits-necesarios (- (expt 2 n) 1) m)) (lista (sub1 m)))]))
          ](map binario-booleano (lista (- (expt 2 n) 1)))
    ))

; B : List(Boolean) -> Boolean
(define (B l)
  (let ([p1 (first l)]
        [p2 (second l)]
        [p3 (third l)])
  (equivalente (implica (and p1 p2) p3)
               (and (implica p1 p3) (implica p2 p3)))))

; C : List(Boolean) -> Boolean
(define (C l)
  (let ([p1 (first l)]
        [p2 (second l)])
  (equivalente (or (not p1) (not p2))
               (and p1 p2))))


; evaluar :: P (ListOf Boolean -> Boolean) Number -> ListOf Boolean
; Dada una formula proposicional P y una n cantidad de variables que utiliza P la funcion devolvera
; una lista de 2 a la n booleanos que son el resultado de evaluar P en cada una de las valuaciones
; posibles
(define (evaluar P n)
  (map P (valuaciones n)))


;(valuaciones n)
(evaluar B 3)

#|(check-expect (valuaciones 1) (list (list #t) (list #f)))

(check-expect (valuaciones 2) (list
 (list #true #true)
 (list #false #true)
 (list #false #true)
 (list #false #false)))

(check-expect (valuaciones 3) (list
 (list #true #true #true)
 (list #false #true #true)
 (list #true #false #true)
 (list #false #false #true)
 (list #false #true #true)
 (list #false #false #true)
 (list #false #false #true)
 (list #false #false #false)))|#
