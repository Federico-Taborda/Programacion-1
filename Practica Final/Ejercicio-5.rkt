;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-advanced-reader.ss" "lang")((modname Ejercicio-5) (read-case-sensitive #t) (teachpacks ((lib "image.rkt" "teachpack" "2htdp") (lib "abstraction.rkt" "teachpack" "2htdp") (lib "universe.rkt" "teachpack" "2htdp") (lib "web-io.rkt" "teachpack" "2htdp"))) (htdp-settings #(#t constructor repeating-decimal #t #t none #f ((lib "image.rkt" "teachpack" "2htdp") (lib "abstraction.rkt" "teachpack" "2htdp") (lib "universe.rkt" "teachpack" "2htdp") (lib "web-io.rkt" "teachpack" "2htdp")) #f)))
(check-expect (replicar (list 4 6 3 9) 3) (list 4 4 4 6 6 6 3 3 3 9 9 9))
(check-expect (replicar empty 3) empty)
(check-expect (replicar (list 4 6 3 9) 0) (list 4 6 3 9))

; replicar :: (ListOf Number) Number -> ListOf Number
; Dada una lista de numeros y un numero n la funcion devolvera una nueva lista con cada
; elemento repetido n veces de la lista anterior

(define (replicar lista n)
  (local [(define (aux lista m)
            (cond[(empty? lista) empty]
                 [(zero? m) lista]
                 [else (if(= m 1)
                          (cons (first lista) (aux (rest lista) n))
                          (cons (first lista) (aux lista (sub1 m))))])) 
          ](aux lista n)))

(time (replicar (list 4 6 3 9) 3))


; VARIANTE

(check-expect (replicar2 empty 3) empty)
(check-expect (replicar2 (list 4 6 3 9) 0) empty)
(check-expect (replicar2 (list 4 6 3 9) 3) (list 4 4 4 6 6 6 3 3 3 9 9 9))

(define (replicar2 l n)
  (cond [(empty? l) empty]
        [(zero? n) (replicar2 (rest l) n)]
        [else (append (make-list n (first l)) (replicar2 (rest l) n))]))

(time (replicar2 (list 4 6 3 9) 3))
