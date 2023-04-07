#lang racket/base
(provide (all-defined-out))


;DRIVE Contructor

(define make-drive
  (lambda (letra nombre capacidad contenido)
    (list letra nombre capacidad)))

(define make-currentdrive
  (lambda (drive)
           (list drive)))

(define (drive letra nombre capacidad)
  (make-drive letra nombre capacidad null))

(define currentdrive
  (lambda (drive)(make-currentdrive drive)))

;selectores

(define get-letra (lambda (drive)(car drive)))
(define get-nombre (lambda (drive)(cadr drive)))
(define get-capacidad (lambda (drive)(caddr drive)))
(define get-contenido (lambda (drive)(cadddr drive)))

;modificadores

(define set-nombre-drive
  (lambda (nombre drive)
    (make-drive (get-letra drive)
                nombre
                (get-capacidad drive)
                (get-contenido drive))))

(define set-contenido-drive
  (lambda (contenido)
    (make-drive (get-letra)
                (get-nombre)
                (get-capacidad)
                contenido)))









