;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-intermediate-reader.ss" "lang")((modname ejercicio3) (read-case-sensitive #t) (teachpacks ((lib "image.rkt" "teachpack" "2htdp") (lib "universe.rkt" "teachpack" "2htdp"))) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ((lib "image.rkt" "teachpack" "2htdp") (lib "universe.rkt" "teachpack" "2htdp")) #f)))
; DEFINICIÓN DE CONSTANTES
....
; lado del triángulo, o radio del círculo a dibujar
(define TAMAÑO 30)

; DISEÑO DE DATOS: ESTADO



; objeto : Estado -> Image
; devuelve el objeto a dibujar. Esta función puede ser útil para la función mostrar.
(check-expect (objeto "tv") (triangle TAMAÑO "solid" "green"))
; COMPLETAR con al menos un caso de test adicional
(define
  (objeto s)
  ; COMPLETAR

; mostrar : Estado -> Image
; dibuja el objeto representado por el estado en una posición aleatoria dentro de la escena
(define
  (mostrar s)
  ; COMPLETAR (la función objeto definida arriba puede ser útil, aunque no obligatoria, para definir esta función.


; teclado:
  ; COMPLETAR el DISEÑO

  
; tick:
  ; COMPLETAR el DISEÑO



; EXPRESIÓN BIG-BANG
(big-bang INICIAL
          ;COMPLETAR
)