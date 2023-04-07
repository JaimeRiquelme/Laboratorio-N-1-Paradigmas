#lang racket/base
(require "TDA_System_20964708_RiquelmeOlguin.rkt")


;representacion: nombre X fecha-creacion X fecha-modificacion X usuario-creador
;X usuarios-compartida X tamano (bytes) X cantidad-archivos X atributos de seguridad
;X contenido-folder


(define (make-folder nombre fecha-creacion fecha-modif creador-user compartidos-user
                     tamano cantidad-archivos seguridad contenido-folder ubicacion)
         (list nombre fecha-creacion fecha-modif creador-user compartidos-user
                     tamano cantidad-archivos seguridad))

(define folder
  (lambda (nombre fecha-creacion fecha-modif creador-user compartidos-user
                     tamano cantidad-archivos seguridad contenido-folder ubicacion)
    (make-folder nombre
                 (fecha-actual)
                 (fecha-actual)
                 (get-logeado system)
                 null
                 null
                 null
                 null
                 null
                 (get-ruta system ))))
