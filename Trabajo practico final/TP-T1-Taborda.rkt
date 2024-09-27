;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-advanced-reader.ss" "lang")((modname TP-T1-Taborda) (read-case-sensitive #t) (teachpacks ((lib "image.rkt" "teachpack" "2htdp") (lib "abstraction.rkt" "teachpack" "2htdp") (lib "universe.rkt" "teachpack" "2htdp") (lib "web-io.rkt" "teachpack" "2htdp"))) (htdp-settings #(#t constructor repeating-decimal #t #t none #f ((lib "image.rkt" "teachpack" "2htdp") (lib "abstraction.rkt" "teachpack" "2htdp") (lib "universe.rkt" "teachpack" "2htdp") (lib "web-io.rkt" "teachpack" "2htdp")) #f)))
;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
;#reader(lib "htdp-advanced-reader.ss" "lang")((modname TP-T2-Apellido1-Apellido2) (read-case-sensitive #t) (teachpacks ((lib "image.rkt" "teachpack" "2htdp") (lib "batch-io.rkt" "teachpack" "2htdp"))) (htdp-settings #(#t constructor repeating-decimal #t #t none #f ((lib "image.rkt" "teachpack" "2htdp") (lib "batch-io.rkt" "teachpack" "2htdp")) #f)))
#| Trabajo Práctico Final - Tema 1

Integrantes:
- [Taborda, Federico]
|#
;;;;;;;; Ejercicio 1

; implica :: Boolean Boolean -> Boolean
; Dados dos valores boleanos (p, q) donde el p sera la hipotesis y q la conclusion, la funcion devolvera como resultado
; los valores de verdad de la implicacion
; Entrada: #t #t; Salida: #t
; Entrada: #t #f; Salida: #f
; Entrada: #f #t; Salida: #t
; Entrada: #t #f; Salida: #t

(define (implica p q)
  (or (not p) q))

(check-expect (implica #t #t) #t)
(check-expect (implica #t #f) #f)
(check-expect (implica #f #t) #t)
(check-expect (implica #f #f) #t)

; equivalente :: Boolean Boolean -> Boolean
; Dados dos valores boleanos (p, q) la funcion devolvera como resultado los valores de verdad de la implicacion
; Entrada: #t #t; Salida: #t
; Entrada: #t #f; Salida: #f
; Entrada: #f #t; Salida: #f
; Entrada: #t #f; Salida: #t

(define (equivalente p q)
  (or (and p q)
      (and (not p) (not q))))

(check-expect (equivalente #t #t) #t)
(check-expect (equivalente #t #f) #f)
(check-expect (equivalente #f #t) #f)
(check-expect (equivalente #f #f) #t)

;;;;;;;; Ejercicio 2

; numero-binario :: Natural -> ListOf Number
; Dado un numero natural n la funcion devolvera su equivalente binario en una lista donde cada
; elemento sera el bit que le corresponda al numero en binario
; Entrada: 2 #f; Salida: (list 1 0)
; Entrada: 1 #f; Salida: (list 1)
; Entrada: 5 #f; Salida: (list 1 0 1)
(define (numero-binario n)
  (cond[(= n 0) empty]
       [else (append (numero-binario (quotient n 2)) (list (remainder n 2)))]
       ))

(check-expect (numero-binario 2) (list 1 0))
(check-expect (numero-binario 1) (list 1))
(check-expect (numero-binario 5) (list 1 0 1))

; bits-nesecesarios :: ListOf Number ListOf Number -> Number
; Dados un numero m y un numero n la funcion determinara cuantos bits de m son necesesarios
; para completar n en su formato binario
; Entrada: 1 1; Salida: 0
; Entrada: 4 1; Salida: 2
; Entrada: 8 5; Salida: 1
(define (bits-necesarios m n)
  (- (length (numero-binario m)) (length (numero-binario n))))

(check-expect (bits-necesarios 1 1) 0)
(check-expect (bits-necesarios 4 1) 2)
(check-expect (bits-necesarios 8 5) 1)

; completar-bits :: (ListOf Number) Natural -> ListOf Number
; Dada una lista que representa un numero binario y una cantidad de bits la funcion devolvera el binario
; con la cantidad de bits faltantes agregadas
; Entrada: (list 0 1) 2; Salida: (list 0 0 0 1)
; Entrada: (list 1 0) 1; Salida: (list 0 1 0)
; Entrada: (list 1 1) 0); Salida: (list 1 1)
(define (completar-bits binario bits)
  (cond[(zero? bits) binario]
       [else (cons 0 (completar-bits binario (sub1 bits)))]
       ))

(check-expect (completar-bits (list 0 1) 2) (list 0 0 0 1))
(check-expect (completar-bits (list 1 0) 1) (list 0 1 0))
(check-expect (completar-bits (list 1 1) 0) (list 1 1))

; binario-booleano :: ListOf Number -> ListOf Boolean
; Dado una lista que representa a un numero en binario la funcion devolvera una lista convirtiendo
; cada bit de la lista a un booleano:
; true - si es impar
; false - si es par
; Entrada: (list 0 0 0 0); Salida: (list #f #f #f #f)
; Entrada: (list 0 0 0 1); Salida: (list #f #f #f #t)
; Entrada: (list 0 0 1 1); Salida: (list #f #f #t #t)
(define (binario-booleano lista) (map odd? lista))

(check-expect (binario-booleano (list 0 0 0 0)) (list #f #f #f #f))
(check-expect (binario-booleano (list 0 0 0 1)) (list #f #f #f #t))
(check-expect (binario-booleano (list 0 0 1 1)) (list #f #f #t #t))

; valuaciones :: Natural -> ListOf (ListOf Boolean)
; Dado un numero natural n la funcion devolvera todas las posibles valuaciones que existen
; con n variables proposicionales
(define (valuaciones n)
  (local [
          ; lista-binarios :: Number Number -> ListOf (ListOf Number)
          ; Dado un numero m y un numero auxiliar la funcion devolvera una lista con m elementos siendo cada uno
          ; una lista que representara un numero en su formato binario
          (define (lista-binarios m aux)
            (cond[(< m aux) empty]
                 [else (cons (completar-bits (numero-binario aux) (bits-necesarios (- (expt 2 n) 1) aux)) (lista-binarios m (add1 aux)))]))
          ] (map binario-booleano (lista-binarios (- (expt 2 n) 1) 0))
    ))

(check-expect (valuaciones 1) (list (list #f) (list #t)))

(check-expect (valuaciones 2) (list
                               (list #f #f)
                               (list #f #t)
                               (list #t #f)
                               (list #t #t)))

(check-expect (valuaciones 3) (list
                               (list #f #f #f)
                               (list #f #f #t)
                               (list #f #t #f)
                               (list #f #t #t)
                               (list #t #f #f)
                               (list #t #f #t)
                               (list #t #t #f)
                               (list #t #t #t)))

;;;;;;;; Ejercicio 3

; A : List(Boolean) -> Boolean
(define
  (A l)
  (let ([p1 (first l)]
        [p2 (second l)]
        [p3 (third l)])
  (equivalente (and (implica p1 p3)
                    (implica p2 p3))
               (implica (or p1 p2)
                        p3))))

; B : List(Boolean) -> Boolean
(define (B l)
  (let ([p1 (first l)]
        [p2 (second l)]
        [p3 (third l)])
  (equivalente (implica (and p1 p2) p3)
               (and (implica p1 p3) (implica p2 p3)))))

(check-expect (B (list #t #t #f)) #t)
(check-expect (B (list #f #f #f)) #t)
(check-expect (B (list #t #t #t)) #t)

; C : List(Boolean) -> Boolean
(define (C l)
  (let ([p1 (first l)]
        [p2 (second l)])
  (equivalente (or (not p1) (not p2))
               (and p1 p2))))

(check-expect (C (list #t #f)) #f)
(check-expect (C (list #f #t)) #f)
(check-expect (C (list #f #f)) #f)
(check-expect (C (list #t #t)) #f)

;;;;;;;; Ejercicio 4

; evaluar :: P (ListOf Boolean -> Boolean) Number -> ListOf Boolean
; Dada una formula proposicional P y una n cantidad de variables que utiliza P la funcion devolvera
; una lista de 2 a la n booleanos que son el resultado de evaluar P en cada una de las valuaciones
; posibles
(define (evaluar P n)
  (map P (valuaciones n)))

(check-expect (evaluar proposicion-1 3) (list #t #t #t #t #t #t #t #t))
(check-expect (evaluar proposicion-2 2) (list #t #t #t #t))
(check-expect (evaluar proposicion-3 2) (list #f #t #f #f))

; Ejemplos de proposiciones para casos de prueba

(define (proposicion-1 l)
  (let ([p1 (first l)]
        [p2 (second l)]
        [p3 (third l)])
  (implica (implica p1 (implica p2 p3)) (implica (implica p1 p2) (implica p1 p3)))
    ))

(define (proposicion-2 l)
  (let ([p1 (first l)]
        [p2 (second l)])
    (implica (not (or p1 (not p2))) (not p1))
    ))

(define (proposicion-3 l)
  (let ([p1 (first l)]
        [p2 (second l)])
    (equivalente p2 (or (not p1) (not p2)))
    ))


;;;;;;;; Ejercicio 5

; verdadero? :: Boolean Boolean -> Boolean
; Dados dos valores booleanos la funcion devolvera verdadero si ambos resultan ser true
; Entrada: #t #t; Salida: #t
; Entrada: #t #f; Salida: #f
; Entrada: #f #f; Salida: #f
(define (verdadero? p q) (and p q))

(check-expect (verdadero? #t #t) #t)
(check-expect (verdadero? #t #f) #f)
(check-expect (verdadero? #f #f) #f)

; falso? :: Boolean Boolean -> Boolean
; Dados dos valores booleanos la funcion devolvera falso si uno es falso
; Entrada: #t #t; Salida: #t
; Entrada: #t #f; Salida: #f
; Entrada: #f #f; Salida: #f
(define (falso? p q) (and (not p) q))

(check-expect (falso? #t #f) #f)
(check-expect (falso? #f #f) #f)

; uno-verdadero? :: Boolean Boolean -> Boolean
; Dados dos valores booleanos la funcion devolvera verdadero si uno es verdadero
; Entrada: #t #t; Salida: #t
; Entrada: #t #f; Salida: #t
; Entrada: #f #f; Salida: #f
(define (uno-verdadero? p q) (or p q))

(check-expect (uno-verdadero? #t #t) #t)
(check-expect (uno-verdadero? #f #f) #f)
(check-expect (uno-verdadero? #t #f) #t)

; tautologia? :: ListOf Boolean -> Boolean
; Dada una lista de booleanos que representa la ultima tabla de verdad de una formula propocional
; la funcion devolvera verdadero si esta es una tautologia
(define (tautología? P n) (foldr verdadero? true (evaluar P n)))

(check-expect (tautología? proposicion-1 3) #t)
(check-expect (tautología? proposicion-2 2) #t)
(check-expect (tautología? proposicion-3 2) #f)

; contradicción? :: ListOf Boolean -> Boolean
; Dada una lista de booleanos que representa la ultima tabla de verdad de una formula propocional
; la funcion devolvera falso si esta es una contradiccion
(define (contradicción? P n) (foldr falso? true (evaluar P n)))

(check-expect (contradicción? proposicion-1 3) #f)
(check-expect (contradicción? proposicion-2 2) #f)
(check-expect (contradicción? proposicion-3 2) #f)

; satisfactible? :: ListOf Boolean -> Boolean
; Dada una lista de booleanos que representa la ultima tabla de verdad de una formula propocional
; la funcion devolvera verdaderio si almenos un elemento de la lista es satisfactible
(define (satisfactible? P n) (foldr uno-verdadero? false (evaluar P n)))

;;;;;;;; Ejercicio 6

;;;; Ejemplos de fórmulas proposicionales

; D : List(Boolean) -> Boolean
; D representa la fórmula proposicional p
(define
  (D l)
  (first l))

; E : List(Boolean) -> Boolean
; E representa la fórmula proposicional p \/ ~p 
(define
  (E l)
  (let ([p (first l)])
  (or p (not p))))

; F : List(Boolean) -> Boolean
; F representa la fórmula proposicional p /\ ~p 
(define
  (F l)
  (let ([p (first l)])
  (and p (not p))))

; MP : List(Boolean) -> Boolean
; MP representa la fórmula proposicional ((p -> q) /\ p) -> q
; conocida como modus ponens.
(define
  (MP l)
  (let ([p (first l)]
        [q (second l)])
  (implica (and (implica p q) p) q)))

; MT : List(Boolean) -> Boolean
; MT representa la fórmula proposicional ((p -> q) /\ ~q) -> ~p
; conocida como modus tollens.
(define
  (MT l)
  (let ([p (first l)]
        [q (second l)])
  (implica (and (implica p q) (not q)) (not p))))

; DM1 : List(Boolean) -> Boolean
; DM1 representa la fórmula proposicional ~(p \/ q) <-> (~p /\ ~q)
; que constituye una de las leyes de morgan.
(define
  (DM1 l)
  (let ([p (first l)]
        [q (second l)])
  (equivalente (not (or p q))
               (and (not p) (not q)))))

; G : List(Boolean) -> Boolean
; G representa la fórmula proposicional p1 /\ ~ p2 /\ (p1 -> ~p4) /\ (p2 \/ p3) /\ (p3 -> p4)
(define
  (G l)
  (let ([p1 (first l)]
        [p2 (second l)]
        [p3 (third l)]
        [p4 (fourth l)])
  (and p1
       (not p2)
       (implica p1 (not p4))
       (or p2 p3)
       (implica p3 p4))))

; H : List(Boolean) -> Boolean
; H representa la fórmula proposicional ((p1 \/ p2) -> p3) /\ (~p3 \/ ~p4)
(define
  (H l)
  (let ([p1 (first l)]
        [p2 (second l)]
        [p3 (third l)]
        [p4 (fourth l)])
  (and (implica (or p1 p2) p3)
       (or (not p3) (not p4)))))

; I : List(Boolean) -> Boolean
; I representa la fórmula proposicional
; ((p1 \/ ~p2) -> (p5 \/ (p1 /\ p3 /\ ~p4))) <-> (~(~p1 \/ ~p3 \/ p4 \/ p5) -> (~p1 \/ ~p2))
(define
  (I l)
  (let ([p1 (first l)]
        [p2 (second l)]
        [p3 (third l)]
        [p4 (fourth l)]
        [p5 (fifth l)])
  (equivalente
    (implica (or p1 (not p2))
             (or p5 (and p1 p3 (not p4))))
    (implica (not (or (not p1) (not p3) p4 p5))
             (or (not p1) (not p2))))))

;;;; Tests para ejercicio 4

; ocurrencias : List(X) X -> Natural
; Dados una lista l de elementos de tipo X y un elemento v de tipo
; X, devuelve la cantidad de veces que v aparece en l.
(define
  (ocurrencias l v)
  (length (filter (lambda (x) (equal? x v)) l)))

(check-expect (ocurrencias (evaluar A 3) #t) 8)
(check-expect (ocurrencias (evaluar A 3) #f) 0)
(check-expect (ocurrencias (evaluar B 3) #t) 6)
(check-expect (ocurrencias (evaluar B 3) #f) 2)
(check-expect (ocurrencias (evaluar C 2) #t) 0)
(check-expect (ocurrencias (evaluar C 2) #f) 4)
(check-expect (ocurrencias (evaluar D 1) #t) 1)
(check-expect (ocurrencias (evaluar D 1) #f) 1)
(check-expect (ocurrencias (evaluar E 1) #t) 2)
(check-expect (ocurrencias (evaluar E 1) #f) 0)
(check-expect (ocurrencias (evaluar F 1) #t) 0)
(check-expect (ocurrencias (evaluar F 1) #f) 2)
(check-expect (ocurrencias (evaluar MP 2) #t) 4)
(check-expect (ocurrencias (evaluar MP 2) #f) 0)
(check-expect (ocurrencias (evaluar MT 2) #t) 4)
(check-expect (ocurrencias (evaluar MT 2) #f) 0)
(check-expect (ocurrencias (evaluar DM1 2) #t) 4)
(check-expect (ocurrencias (evaluar DM1 2) #f) 0)
(check-expect (ocurrencias (evaluar G 4) #t) 0)
(check-expect (ocurrencias (evaluar G 4) #f) 16)
(check-expect (ocurrencias (evaluar H 4) #t) 6)
(check-expect (ocurrencias (evaluar H 4) #f) 10)
(check-expect (ocurrencias (evaluar I 5) #t) 21)
(check-expect (ocurrencias (evaluar I 5) #f) 11)

;;;; Tests para ejercicio 5

(check-expect (tautología? A 3) #t)
(check-expect (tautología? B 3) #f)
(check-expect (tautología? C 2) #f)
(check-expect (tautología? D 1) #f)
(check-expect (tautología? E 1) #t)
(check-expect (tautología? F 1) #f)
(check-expect (tautología? MP 2) #t)
(check-expect (tautología? MT 2) #t)
(check-expect (tautología? DM1 2) #t)
(check-expect (tautología? G 4) #f)
(check-expect (tautología? H 4) #f)
(check-expect (tautología? I 5) #f)

(check-expect (contradicción? A 3) #f)
(check-expect (contradicción? B 3) #f)
(check-expect (contradicción? C 2) #t)
(check-expect (contradicción? D 1) #f)
(check-expect (contradicción? E 1) #f)
(check-expect (contradicción? F 1) #t)
(check-expect (contradicción? MP 2) #f)
(check-expect (contradicción? MT 2) #f)
(check-expect (contradicción? DM1 2) #f)
(check-expect (contradicción? G 4) #t)
(check-expect (contradicción? H 4) #f)
(check-expect (contradicción? I 5) #f)

(check-expect (satisfactible? A 3) #t)
(check-expect (satisfactible? B 3) #t)
(check-expect (satisfactible? C 2) #f)
(check-expect (satisfactible? D 2) #t)
(check-expect (satisfactible? E 1) #t)
(check-expect (satisfactible? F 1) #f)
(check-expect (satisfactible? MP 2) #t)
(check-expect (satisfactible? MT 2) #t)
(check-expect (satisfactible? DM1 2) #t)
(check-expect (satisfactible? G 4) #f)
(check-expect (satisfactible? H 4) #t)
(check-expect (satisfactible? I 5) #t)