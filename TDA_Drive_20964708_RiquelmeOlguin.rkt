#lang racket/base
(provide (all-defined-out))


;DRIVE Contructor

(define make-drive
  (lambda (letra nombre capacidad contenido)
    (list letra nombre capacidad contenido)))

(define make-currentdrive
  (lambda (drive)
           (list drive)))

(define (drive letra nombre capacidad)
  (make-drive letra nombre capacidad null))

(define currentdrive
  (lambda (drive)(make-currentdrive drive)))

;selectores

(define get-letra-drive (lambda (drive)(car drive)))
(define get-nombre-drive (lambda (drive)(cadr drive)))
(define get-capacidad-drive (lambda (drive)(caddr drive)))
(define get-contenido-drive (lambda (drive)(cadddr drive)))

;modificadores

(define set-nombre-drive
  (lambda (nombre drive)
    (make-drive (get-letra-drive drive)
                nombre
                (get-contenido-drive drive)
                (get-contenido-drive drive))))

(define set-contenido-drive
  (lambda (contenido drive)
    (make-drive (get-letra-drive drive)
                (get-nombre-drive drive)
                (get-capacidad-drive drive)
                (cons contenido (get-contenido-drive drive)))))























