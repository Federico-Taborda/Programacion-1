;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-advanced-reader.ss" "lang")((modname Ejercicio-8) (read-case-sensitive #t) (teachpacks ((lib "image.rkt" "teachpack" "2htdp"))) (htdp-settings #(#t constructor repeating-decimal #t #t none #f ((lib "image.rkt" "teachpack" "2htdp")) #f)))
(define-struct trabajador [nombre estado-civil cant-hijos sueldo])

(define (soltero? obrero) (string=? (trabajador-estado-civil obrero) "Soltero"))

(define (casado? obrero) (string=? (trabajador-estado-civil obrero) "Casado"))

(define (impuesto obrero)
  (let [(sueldo (trabajador-sueldo obrero))
        (hijos (trabajador-cant-hijos obrero))
        ]
    (cond[(not (trabajador? obrero)) "Tipo de dato invalido"]
         [(and (soltero? obrero) (<= sueldo 15000)) 0]
         [(and (casado? obrero) ((<= sueldo 18000))) 0]
         [(and (= 1 hijos) (soltero? obrero) (>= sueldo 16000)) (- sueldo 1000)]
         [(and (= 1 hijos) (casado? obrero) (>= sueldo 19000)) (- sueldo 1000)]
         [(and (= 2 hijos) (soltero? obrero) (>= sueldo 17000)) (- sueldo 2000)]
         [(and (= 2 hijos) (casado? obrero) (>= sueldo 20000)) (- sueldo 2000)]
         [(> hijos 3) 0]
         )))

(check-expect (impuesto (make-trabajador "fede" "Soltero" 0 10000)) 0)
(check-expect (impuesto (make-trabajador "fede" "Soltero" 4 290800)) 0)