;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-abbr-reader.ss" "lang")((modname |Ejercicio 10|) (read-case-sensitive #t) (teachpacks ((lib "abstraction.rkt" "teachpack" "2htdp") (lib "image.rkt" "teachpack" "2htdp") (lib "universe.rkt" "teachpack" "2htdp"))) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ((lib "abstraction.rkt" "teachpack" "2htdp") (lib "image.rkt" "teachpack" "2htdp") (lib "universe.rkt" "teachpack" "2htdp")) #f)))
(define-struct Alumno [nombre calificaciones asistencia])
; Alumno es (String Number Number)
; interpretacion: Representara a un alumno
; - El primer elemento representa el nombre del alumno
; - El segundo elemento representa el promedio de las calificaciones del alumno
; - El tercer elemento representa el promedio de las asistencias del alumno

; Representaremos el porcentaje de asistencia como un valor numerico. 1% sera igual a 1 unidad.

(define ASISTENCIA-MIN 40)

; condicion :: Alumno -> String
; Dado un alumno la funcion devolvera como resultado la condicion del mismo
; Posibles condiciones: Libre, Regular, Promovido
(define (condicion alumno)
  (if(Alumno? alumno)
     (cond[(calcular-asistencia (Alumno-asistencia alumno)) "Libre"]
          [(< (Alumno-calificaciones alumno) 6) "Libre"]
          [(and (>= (Alumno-calificaciones alumno) 6) (< (Alumno-calificaciones alumno) 8)) "Regular"]
          [(>= (Alumno-calificaciones alumno) 8) "Promovido"]
          )
     "Tipo de dato invalido"))

(check-expect (condicion (make-Alumno "Federico" 6 39)) "Libre")
(check-expect (condicion (make-Alumno "Federico" 6 41)) "Regular")
(check-expect (condicion (make-Alumno "Federico" 3 41)) "Libre")
(check-expect (condicion (make-Alumno "Federico" 7 41)) "Regular")
(check-expect (condicion (make-Alumno "Federico" 8 39)) "Libre")
(check-expect (condicion (make-Alumno "Federico" 8 41)) "Promovido")

; calcular-asistencia :: Number -> Boolean
; La funcion calcula el porcentaje de asistencias devolviendo como resultado
; - Verdadero si la asistencia es menor a la indicada
; - Falso si la asistencia es mayor a la indicada
(define (calcular-asistencia asistencia) (if(> asistencia ASISTENCIA-MIN) #f #t))

(check-expect (calcular-asistencia 39) #t)
(check-expect (calcular-asistencia 40) #t)
(check-expect (calcular-asistencia 41) #f)