;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname |Práctica unida 2|) (read-case-sensitive #t) (teachpacks ((lib "draw.rkt" "teachpack" "htdp") (lib "image.rkt" "teachpack" "2htdp") (lib "abstraction.rkt" "teachpack" "2htdp") (lib "batch-io.rkt" "teachpack" "2htdp") (lib "convert.rkt" "teachpack" "htdp") (lib "itunes.rkt" "teachpack" "2htdp") (lib "elevator.rkt" "teachpack" "htdp"))) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ((lib "draw.rkt" "teachpack" "htdp") (lib "image.rkt" "teachpack" "2htdp") (lib "abstraction.rkt" "teachpack" "2htdp") (lib "batch-io.rkt" "teachpack" "2htdp") (lib "convert.rkt" "teachpack" "htdp") (lib "itunes.rkt" "teachpack" "2htdp") (lib "elevator.rkt" "teachpack" "htdp")) #f)))
; Diseño de programas - La receta

; 1 - Diseño de datos
; Representar la informacion como datos

; 2 - Signatura y declaracion de proposito
; La signatura indica los datos que se consume, la cantidad y que tipo, y que datos devuelve
; La declaracion de proposito es una breve descripcion del comportamiento de la funcion

; 3 - Ejemplos
; Podemos predecir el comportamiento de la funcion para algunas entradas dadas

; 4 - Definicion de la funcion
; Escribimos el codigo que creemos resuelve el problema

; 5 - Evaluar el codigo en ejemplos
; Una vez que contamos con el codigo de la funcion, ejecutamos los ejemplos propuestos para verificar que almenos funciona para las entradas dadas

; 6 - Realizar modificaciones en caso de errores
; Si existen diferencias entre las respuestas esperadas y las obtenidas al ejecutar la funcion, debemos buscar la fuente del error.


; 1.3 Ejercicios

; 1. Funcion "distancia-origen" que recibe dos numeros x e y devolviendo como resultado la distancia al origen del punto (x,y)

; Representamos coordenadas mediante dos numeros
; Representamos la distancia como un valor numerico

; distancia-origen : Number Number -> Number
; Recibe dos numeros un punto en el plano (x, y), y devuelve como resultado la distancia al origen
; Entrada: 0 0; Salida: 0
; Entrada: 1 1; Salida: (sqrt 2)
; Entrada: -3 -4; Salida: 5
; Entrada: 3 -4; Salida: 5
; Entrada: 3 4; Salida: 5

(define (distancia-origen x y )
  (sqrt (+ (expt x 2) (expt y 2))))

;(check-expect (distancia-origen 6 8) 10)
;(check-expect (distancia-origen 3 4) 5)
;(check-expect (distancia-origen 0 0) 0)
;(check-expect (distancia-origen 1 1) (sqrt 2))

; 2. Funcion "distancia-puntos" que recibe 4 numeros x1, y1, x2, y2 y devuelve la distancia entre los puntos (x1, y1)(x2, y2)

; Representamos las coordenadas mediante cuatro numeros
; Representamos la distancia como un valor numerico

; distancia-puntos: Number Number Number Number -> Number
; Recibe 2 puntos en el plano p1(x1, y1), p2(x2, y2) y devuelve como resultado la distancia entre los dos puntos
; Entrada: 1 2 1 -3; Salida: 5
; Entrada: 1 2 4 6; Salida: 5
; Entrada: 1 2 1 7; Salida: 5

(define (distancia-puntos x1 y1 x2 y2)
  (sqrt (+ (expt (- y2 y1) 2) (expt (- x2 x1) 2))))

;(check-expect (distancia-puntos 1 2 1 -3) 5)
;(check-expect (distancia-puntos 1 2 4 6) 5)
;(check-expect (distancia-puntos 1 2 1 7) 5)

; 3. Funcion "vol-cubo" que recibe una longitud de la arista de un cubo y calcula su volumen

; Representamos las medidas mediante numeros
; Representamos el volumen del cubo mediante un valor numerico

; vol-cubo: Number -> Number
; Recibe la longitud de la arista y devuelve como resultado el volumen de un cubo
; Entrada: 2; Salida: 8;
; Entrada: 3; Salida: 27;

(define (vol-cubo longitud-arista)
  (expt longitud-arista 3))

;(check-expect (vol-cubo 2) 8)
;(check-expect (vol-cubo 3) 27)

; 4. Funcion "area-cubo" que recibe la longitud de la arista de un cubo y calcula su area

; Representamos las medidas mediante numeros
; Representamos el area del cubo mediante un valor numerico

; area-cubo: Number -> Number
; Recibe la longitud de la arista y devuelve como resultado el area de un cubo
; Entrada: 1; Salida: 6;
; Entrada: 2; Salida: 24;
; Entrada: 3; Salida: 54;

(define (area-cubo longitud-arista)
  (* 6 (expt longitud-arista 2)))

;(check-expect (area-cubo 1) 6)
;(check-expect (area-cubo 2) 24)
;(check-expect (area-cubo 3) 54)

; 5. Funcion "string-insert" que consume un string y un numero e insterta "-" en la posicion i-esima del string
; Esta funcion no reemplaza si no que inserta el caracter "-"
; Representamos las palabras con strings y la posicion con numeros
; Representamos la palabra resultado como un string

; string-insert: String Number -> String
; Recibe un una palabra, una posicion y devuelve una palabra con el caracter "-" insertado en la posicion dada 

; Entrada: "Casa" 2 ; Salida: "Ca-a";
; Entrada: "Programacion" 4 ; Salida: "Prog-amacion";
; Entrada: "Matematica" 0 ; Salida: "-atematica";

(define (string-insert palabra numero)
  (string-append (substring palabra 0 numero) "-" (substring palabra (+ numero 1))))

;(check-expect (string-insert "Casa" 2) "Ca-a")
;(check-expect (string-insert "Programacion" 4) "Prog-amacion")
;(check-expect (string-insert "Matematica" 0) "-atematica")

; 6. Funcion "string-last" que estrae el ultimo caracter de una cadena no vacia

; Representamos las palabras con strings
; Representamos el ultimo caracter con un string

; string-last: String -> String
; Recibe una cadena no vacia y devuelve como resultado  su ultimo caracter
; Entrada: ""; Salida: "La cadena es un string vacio";
; Entrada: "Programacion"; Salida: "n";
; Entrada: "Algebra"; Salida: "a";

(define (string-last palabra)
  (if(not(string=? palabra ""))
         (string-ith palabra (- (string-length palabra) 1))
         "La cadena es un string vacio"))

;(check-expect (string-last "") "La cadena es un string vacio")
;(check-expect (string-last "Programacion") "n")
;(check-expect (string-last "Analisis") "s")
;(check-expect (string-last "Algebra") "a")

; 7. Funcion "string-remove" que recibe una cadena y devuelve la misma cadena sin el ultimo caracter

; Representamos las palabras con strings
; Representamos representamos las palabras sin su ultimo caracter con strings

; string-remove: String -> String
; Recibe una palabra y devuelve como resultado la misma palabra sin su ultimo string
; Entrada: "Programacion"; Salida: "Programacio";
; Entrada: "Analisis"; Salida: "Analisi";
; Entrada: "Algebra"; Salida: "Algebr";

(define (string-remove palabra)
  (substring palabra 0 (- (string-length palabra) 1)))

;(check-expect (string-remove "Programacion") "Programacio")
;(check-expect (string-remove "Analisis") "Analisi")
;(check-expect (string-remove "Algebra") "Algebr")

; 8. Reemplazar para cada una de las funciones diseñadas los comentarios de entrada y salida esperados por los casos de prueba automatizados

; 1.5

; 9. Funcion "monto-persona" recibe la cantidad de personas que se anotan y la cantidad
; de meses que abonan y devuelve el monto que el instituto debe pagar a cada uno

; Promociones del instituto
; 2 amigos -> Descuento = 10% cada uno
; 3 amigos o mas -> Descuento = 20% cada uno
; 2 meses -> Descuento = 15%
; 3 meses o mas -> Descuento = 25%

; Promociones combinables pero no mas de 35% de descuento
; Cuota mensual = $650

; Representamos las personas y los meses como un valor numerico
; Representamos los montos a abonar como un valor numerico


(define CUOTA-MENSUAL 650)

; descuento: Number Number -> Number
; Recibe la cuota mensual, el descuento y devuelve el valor de la cuota ya descontado
; Entrada: ; Salida: ;
; Entrada: ; Salida: ;
; Entrada: ; Salida: ;
(define (descuento valor oferta)
  (- valor (* valor (/ oferta 100))))

; valor-cuota: Number Number Number -> Number
; Recibe el descuento, la cantidad de personas y la cantidad de meses
; y devuelve el valor de la cuota por la cantidad de personas y meses
; Entrada: ; Salida: ;
; Entrada: ; Salida: ;
; Entrada: ; Salida: ;
(define (valor-cuota oferta personas meses)
  (* (* (descuento CUOTA-MENSUAL oferta) personas) meses))

; monto-persona: Number Number -> Number
; Recibe el numero de personas, la cantidad de meses y devuelve el valor de la cuota dependiendo de los parametros
; Entrada: 1 5; Salida: 2437.5;
; Entrada: 1 1; Salida: 650;
; Entrada: (/ (monto-persona 2 2) 2) 975); Salida: 975;
(define (monto-persona cantidad-personas cantidad-meses)
  (cond[(and (= cantidad-personas 1) (< cantidad-meses 2)) (valor-cuota 0 cantidad-personas cantidad-meses)]
       [(and (= cantidad-personas 1) (= cantidad-meses 2)) (valor-cuota 15 cantidad-personas cantidad-meses)]
       [(and (= cantidad-personas 1) (> cantidad-meses 2)) (valor-cuota 25 cantidad-personas cantidad-meses)]
       [(and (>= cantidad-personas 2) (< cantidad-meses 2)) (valor-cuota 10 cantidad-personas cantidad-meses)]
       [(and (>= cantidad-personas 2) (= cantidad-meses 2)) (valor-cuota 25 cantidad-personas cantidad-meses)]
       [(and (>= cantidad-personas 3) (< cantidad-meses 3)) (valor-cuota 20 cantidad-personas cantidad-meses)]
       [(and (>= cantidad-personas 3) (>= cantidad-meses 3)) (valor-cuota 35 cantidad-personas cantidad-meses)]))
 
;(check-expect (monto-persona 1 5) 2437.5)
;(check-expect (monto-persona 1 1) 650)
;(check-expect (/ (monto-persona 2 2) 2) 975)
;(check-expect (/ (monto-persona 3 3) 3) 1267.5)

; 10. Funcion "anemia" que recibe la edad de una persona expresada en meses y la
; hemoglobina en sangre en g/dl devuelva #true si la persona esta anemica, #false en caso contrario

; Representamos la edad de persona expresada en meses como un valor numerico
; Representamos la hemoglobina como un valor numerico. Una unidad de hemoglobina se representa con el numero 1
; Representamos el resultado del analisis con un valor booleano

; anemia: Number Number -> Boolean
; Recibe la edad de la persona expresada en meses, la cantidad de hemoglobina en sangre y devuelve verdadero
; si el analisis es positivo o falso si el analisis en negativo
; Entrada: 1 13.1; Salida: #f;
; Entrada: 1 12.9; Salida: #t;
; Entrada: ; Salida: ;

(define (anemia edad hemoglobina)
  (cond[(and (<= edad 1) (< hemoglobina 13)) #true]
       [(and (> edad 1) (<= edad 6) (> hemoglobina 10)) #true]
       [(and (> edad 6) (<= edad 12)(> hemoglobina 11)) #true]
       [(and (> edad 12) (<= edad (* 12 5))(> hemoglobina 11.5)) #true]
       [(and (> edad (* 12 5)) (<= edad (* 12 10)) (> hemoglobina 12.6)) #true]
       [(and (> edad (* 12 10)) (< hemoglobina 13)) false]
       [else #false]))

;(check-expect (anemia 1 13.1) #f)
;(check-expect (anemia 1 12.9) #t)

; 11. Funcion que dados tres numeros, devuelva el producto de ellos en
; caso que formen una terna autopromediable, y la suma de ellos en caso contrario

; Representamos el producto de tres numeros como un valor numerico
; Representamos la suma de de tres numeros como un valor numerico
; Representamos los casos como un valor booleano

; promedio: Number Number Number-> Boolean
; Recibe tres numeros y devuelve como resultado verdadero si es una terna autopromediable o falso en caso contrario
; Entrada: 1 2 3 ; Salida: ;
; Entrada: ; Salida: ;
; Entrada: ; Salida: ;
(define (promedio a b c)
  (cond[(or (and (> a b) (< a c))
            (and (> a c) (< a b))
            (and (> b a) (< b c))
            (and (> b c) (< b a))
            (and (> c a) (< c b))
            (and (> c b) (< c a))) #true]
       [else #false]))

; autopromediable: Number Number Number -> Number
; Recibe tres numeros y devuelve como resultado el producto o la suma de ellos en caso de ser autopromediable o no
; Entrada: 1 2 3 ; Salida: ;
; Entrada: ; Salida: ;
; Entrada: ; Salida: ;
(define (autopromediable a b c)
  (cond[(promedio a b c) (* a b c)]
       [else (+ a b c)]))

;(check-expect (autopromediable 1 2 3))

; 12. Funcion "autonomia" que dados los siguiente parametros:
; a. cantidad de litros restantes en el tanque
; b. clase de combustible que se esta utilizando
; Devuelva un string indicando la autonomia del auto, tanto en ciudad como en ruta

; Representamos la cantidad de litros como un valor numerico. Una unidad en litros la representamos con el numero 1
; Representamos el rendimiento como un valor numerico. Un unidad en porcentaje la representamos con el numero 1
; Representamos la clase de combustible como un string
; Representamos la autonomia del auto como un string

(define CIUDAD 8)
(define RUTA 11)
(define SUPER "super")
(define PREMIUM "premium")

; concatenar: String Number -> String
; Recibe una cadena y un numero y los concatena devolviendo como resultado otro string
; Entrada: ; Salida: ;
; Entrada: ; Salida: ;
; Entrada: ; Salida: ;
(define (concatenar ciudad ruta)
  (string-append "Autonomia en ciudad: " (number->string ciudad) "km. Autonomia en ruta: " (number->string ruta)"km."))

; rendimiento: Number Number -> Number
; Recibe la cantidad de litros y el porcentaje del rendimiento y devuelve como resultado cuanto rinde 
; Entrada: ; Salida: ;
; Entrada: ; Salida: ;
; Entrada: ; Salida: ;
(define (rendimiento litros porcentaje)
  (if(and(>= litros 0) (>= porcentaje 0))
     (+ litros (* litros (/ porcentaje 100)))
     0))

; autonomia: Number Number -> String
; Recibe la cantidad de litros y el tipo de combustible, y devuelve como resultado su autonomia tanto ciudad como en ruta
; Entrada: 20 "super" ; Salida: "Autonomia en ciudad: 160km. Autonomia en ruta: 220km.";
; Entrada: 20 "premium"; Salida: "Autonomia en ciudad: 176km. Autonomia en ruta: 242km.";
; Entrada: 0 "super"; Salida: "Autonomia en ciudad: 0km. Autonomia en ruta: 0km.";
; Entrada: 0 "premium"; Salida: "Autonomia en ciudad: 0km. Autonomia en ruta: 0km.";
; Entrada: -1 "super"; Salida: "Autonomia en ciudad: 0km. Autonomia en ruta: 0km.";
; Entrada: -3 "premium"; Salida: "Autonomia en ciudad: 0km. Autonomia en ruta: 0km.";
(define (autonomia litros combustible)
  (if(string=? combustible "premium")
     (concatenar (* CIUDAD(rendimiento litros 10)) (* RUTA(rendimiento litros 10)))
     (concatenar (* CIUDAD litros) (* RUTA litros))))

(define PRUEBA1 "Autonomia en ciudad: 160km. Autonomia en ruta: 220km.")
(define PRUEBA2 "Autonomia en ciudad: 176km. Autonomia en ruta: 242km.")

(autonomia -1 "super")
;(check-expect (autonomia 20 "super") PRUEBA1)
;(check-expect (autonomia 20 "premium") PRUEBA2)























