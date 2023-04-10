#lang racket


(define (make-file nombre contenido-file extencion fecha-creacion fecha-modificacion creador-user
                   compartidos-user tamaño seguridad)
  (list nombre contenido-file extencion fecha-creacion fecha-modificacion creador-user
                   compartidos-user tamaño seguridad))

(define file
  (lambda (nombre)
    (make-file nombre
               null
               null
               null
               null
               null
               null
               null
               null)))