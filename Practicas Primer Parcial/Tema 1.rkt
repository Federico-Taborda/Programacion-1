;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname |Tema 1|) (read-case-sensitive #t) (teachpacks ((lib "universe.rkt" "teachpack" "2htdp") (lib "abstraction.rkt" "teachpack" "2htdp") (lib "web-io.rkt" "teachpack" "2htdp") (lib "image.rkt" "teachpack" "2htdp"))) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ((lib "universe.rkt" "teachpack" "2htdp") (lib "abstraction.rkt" "teachpack" "2htdp") (lib "web-io.rkt" "teachpack" "2htdp") (lib "image.rkt" "teachpack" "2htdp")) #f)))
; Ejercicio 1 =========================================================================

; f: String Image Number -> String
; La funcion toma la longitud de un string, el ancho de una imagen y un numero
; devolviendo como resultado el producto de los tres en el tipo de dato string
(define (f x y z)
  (number->string (* z (string-length x) (image-width y))))

(define CIRCULO (circle 2 "solid" "red"))
(check-expect(f "fa" CIRCULO 2) "16")

; g: Number Boolean Number -> Number
; La funcion evalua si el primer argumento es menor a 0 y si el segundo argumento es verdadero
; Si es verdadero devuelve como resultado el tercer argumento sumandole 2
; Si es falso solo devolvera como resultado 1
(define (g a b c)
  (if(and b (< a 0)) (+ c 2) 1))

(check-expect(g -2 #t 2) 4)

; h: Number String Number -> Boolean
; La funcion evalua si el primer argumento es menor a 10, si la suma 10 y del tercer argumento es una string y
; si la longitud del segundo argumento es una imagen
; En el caso de que se cumplan las condiciones devolvera verdadero
; En otro caso devolvera falso (siempre devolvera falso)
(define (h n m p)
  (and (< n 10) (string? (+ 10 p)) (image? (string-length m))))

(check-expect(h 2 2 2) #f)

; Ejercicio 2 =========================================================================

; Representaremos los km con un valor numerico. 1 unidad representara 1km
; Representaremos los litros de combustible con un valor numerico. 1 unidad representara 1l
; Representaremos el grado de la nafta con strings
; Representamos el rendimiento como un valor numerico. 1 unidad representara 1%

(define RUTA 11)
(define CIUDAD 8)
(define CAPACIDAD_TANQUE 58)
(define GRADO_DOS "super")
(define GRADO_TRES "premium")
(define RENDIMIENTO 10)

; autonomia: Number String -> String
; La funcion recibe la candidad de litros restantes y el grado de combustible y calculara
; el rendimiento dependiendo del grado de combustible dado
(define (autonomia litros_restantes clase_combustible)
  (cond[(string=? clase_combustible "super") (calcularSuper litros_restantes)]
       [(string=? clase_combustible "premium") (calcularPremium litros_restantes)]))

; calcularSuper: Number -> String
; La funcion calcula el rendimiento en ciudad y ruta con combustible de grado dos
(define (calcularSuper litros)
  (mensaje (* litros CIUDAD) (* litros RUTA)))

; calcularPremium: Number -> String
; La funcion calcula el rendimiento en ciudad y ruta con combustible de grado tres
(define (calcularPremium litros)
  (mensaje (* litros (porcentaje CIUDAD RENDIMIENTO)) (* litros (porcentaje RUTA RENDIMIENTO))))

; porcentaje: Number Number -> Number
; La funcion calcula el porcentaje de una cantidad y se lo suma al mismo
(define (porcentaje cantidad porcentaje)
  (+ cantidad (/ (* cantidad porcentaje) 100)))

; mensaje: Number Number -> String
; La funcion recibe la autonomia del auto y devuelve como resultado un string en pantalla
(define (mensaje ciudad ruta)
  (string-append "Autonomía en ciudad: " (number->string ciudad) "km. Autonomía en ruta: " (number->string ruta) "km."))

(autonomia 20 GRADO_DOS)
(autonomia 20 GRADO_TRES)
(check-expect (autonomia 20 GRADO_DOS) "Autonomía en ciudad: 160km. Autonomía en ruta: 220km.")

; Ejercicio 3 =========================================================================

; El estado del sistema sera un string, representando asi la primera letra del string
; como el objeto a dibujar y su segunda letra su color

; Posible objetos:
; - Triangulo
; - Circulo

; Posible Colores:
; - Azul
; - Verde

; Representamos el alto y el ancho de la escen como un valor numerico
; Representamos los colores de los objetos con strings
; Representamos el radio del circulo como un valor numerico
; Representamos el lado del triangulo como un valor numerico
; Representamos el timepo como un valor numerico. 1 unidad representara 1 segundo

(define RADIO 20)
(define LADO 20)
(define ALTO 500)
(define ANCHO 500)
(define SEGUNDOS 1)
(define AZUL "blue")
(define VERDE "green")
(define ESCENA (empty-scene ANCHO ALTO))
(define ESTADO_INICIAL "tv")

; dibujar: Estado -> Image
; La funcion recibe el estado y al evaluarlo dibujara un triangulo o un circulo de cierto color
(define (dibujar estado)
  (cond[(string=? estado "tv") (dibujarTriangulo VERDE)]
       [(string=? estado "ta") (dibujarTriangulo AZUL)]
       [(string=? estado "cv") (dibujarCirculo VERDE)]
       [(string=? estado "ca") (dibujarCirculo AZUL)]
       ))

; dibujarTriangulo: String -> Image
; La funcion recibe un color y dibuja un triangulo de ese mismo color
(define (dibujarTriangulo color) (place-image (triangle LADO "solid" color) (random ANCHO) (random ALTO) ESCENA))

; dibujarCirculo: String -> Image
; La funcion recibe un color y dibuja un circulo de ese mismo color
(define (dibujarCirculo color) (place-image (circle RADIO "solid" color) (random ANCHO) (random ALTO) ESCENA))

; manejarRelog: Estado -> Estado
; La funcion recibe el estado y devuelve el estado del color siguiente
(define (manejarRelog estado)
  (cond[(string=? estado "tv") "ta"]
       [(string=? estado "ta") "tv"]
       [(string=? estado "cv") "ca"]
       [(string=? estado "ca") "cv"]
       ))

; manejarTeclado: Estado tecla -> Estado
; La funcion recibe el estado y una tecla presionada y evaluara si
; la tecla presionada es la t, dibujara un triangulo con el color actual
; la tecla presionada es la c, dibujara un circulo con el color actual
(define (manejarTeclado estado tecla)
  (cond[(key=? tecla "t") (string-append tecla (string-ith estado 1))]
       [(key=? tecla "c") (string-append tecla (string-ith estado 1))]
       [else estado]))

; Expresion big-bang
(big-bang ESTADO_INICIAL
         [to-draw dibujar]
         [on-tick manejarRelog SEGUNDOS]
         [on-key manejarTeclado])























