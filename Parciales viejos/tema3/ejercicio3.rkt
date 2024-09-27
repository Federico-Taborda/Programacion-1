;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname ejercicio3) (read-case-sensitive #t) (teachpacks ((lib "image.rkt" "teachpack" "2htdp") (lib "universe.rkt" "teachpack" "2htdp"))) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ((lib "image.rkt" "teachpack" "2htdp") (lib "universe.rkt" "teachpack" "2htdp")) #f)))
(require 2htdp/image)
(require 2htdp/universe)

;definiciones constantes, COMPLETE

;DISEÑO DE DATOS, Estado, COMPLETE

; estado inicial (COMPLETE)

;mostrar es la función dedicada a la cláusula to-draw
;completar signatura, declaración de propósito y definición
(define (mostrar ...) ...) 


;tick es el manejador de eventos dedicado a la cláusula on-tick de la expresión big-bang
;completar signatura, declaración de propósito, 2 ejemplos y definición
(define (tick-handler ...) ...)


;key-handler es el handler dedicado a la cláusula on-key de la expresión big-bang
;completar signatura, declaración de propósito, 2 ejemplos y definición
(define (key-handler ...) ...)

; finalizar? es el predicado que determina cuándo el programa debe terminar.
;completar signatura, declaración de propósito, 2 ejemplos y definición
(define (finalizar? ....) ....)

;expresión big-bang para el programa interactivo
(big-bang ...
          [to-draw  ...]        
          [on-tick  ... 1] ; el 1 es para que el manejador se invoque cada un segundo 
          [on-key ...]
          [stop-when ...]
  )
