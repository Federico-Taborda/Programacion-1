;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-advanced-reader.ss" "lang")((modname Ejercicio-1) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #t #t none #f () #f)))
(define (fun x y z)
  (cond [(> z (expt x y)) (+ x y z)]
        [(< (expt x z) y) (* x y z)]
        [else x]))

#|

(fun 2 1 4)

== 
(cond [(> 4 (expt 2 1)) (+ 2 1 4)]
        [(< (expt 2 4) 1) (* 2 1 4)]
        [else 2]))
==

(cond [(> 4 2) (+ 2 1 4)]
        [(< (expt 2 4) 1) (* 2 1 4)]
        [else 2]))

==

(cond [#true (+ 2 1 4)]
        [(< (expt 2 4) 1) (* 2 1 4)]
        [else 2]))

==

(+ 2 1 4)

==

7

______________________________________

(fun 6 1 4)

==

(cond [(> 4 (expt 6 1)) (+ 6 1 4)]
        [(< (expt 6 4) 1) (* 6 1 4)]
        [else 6]))

==

(cond [(> 4 6) (+ 6 1 4)]
        [(< (expt 6 4) 1) (* 6 1 4)]
        [else 6]))

==

(cond [#false (+ 6 1 4)]
        [(< (expt 6 4) 1) (* 6 1 4)]
        [else 6]))

==

(cond [(< (expt 6 4) 1) (* 6 1 4)]
      [else 6]))

==

(cond [(< 1296 1) (* 6 1 4)]
      [else 6]))

==

(cond [#false (* 6 1 4)]
      [else 6]))

==

(cond [else 6]))

==

6
























|#