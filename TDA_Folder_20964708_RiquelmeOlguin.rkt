#lang racket/base
(provide (all-defined-out))





;representacion: nombre X fecha-creacion X fecha-modificacion X usuario-creador
;X usuarios-compartida X tamano (bytes) X cantidad-archivos X atributos de seguridad
;X contenido-folder


(define (make-folder nombre contenido-folder fecha-creacion fecha-modif creador-user compartidos-user
                     tamano cantidad-archivos seguridad  ubicacion)
         (list nombre contenido-folder fecha-creacion fecha-modif creador-user compartidos-user
                     tamano cantidad-archivos seguridad ubicacion))



;selectores

(define get-nombre-folder(lambda (folder)(car folder)))

(define get-contenido-folder(lambda (folder)(cadr folder)))

(define get-fecha-creacion-folder(lambda (folder)(caddr folder)))

(define get-fecha-modif-folder(lambda (folder)(caddr folder)))

(define get-creador-user-folder(lambda (folder)(cadddr folder)))

(define get-compartidos-user-folder(lambda (folder)(cadddr folder)))

(define get-tamano-folder(lambda (folder)(car (cddddr folder))))

(define get-cantidad-archivos-folder(lambda (folder)(cadr (cddddr folder))))

(define get-seguridad-folder(lambda (folder)(caddr (cddddr folder))))

(define get-ubicacion-folder(lambda (folder)(cddddr (cddddr folder))))

;modificadores

(define set-nombre-folder 
  (lambda (folder nombre)
    (make-folder nombre
                 (get-contenido-folder folder)
                 (get-fecha-creacion-folder folder)
                 (get-fecha-modif-folder folder)
                 (get-creador-user-folder folder)
                 (get-compartidos-user-folder folder)
                 (get-tamano-folder folder)
                 (get-cantidad-archivos-folder folder)
                 (get-seguridad-folder folder)
                 (get-ubicacion-folder folder))))

(define set-contenido-folder 
  (lambda (folder contenido)
    (make-folder (get-nombre-folder folder)
                 (cons contenido(get-contenido-folder folder))
                 (get-fecha-creacion-folder folder)
                 (get-fecha-modif-folder folder)
                 (get-creador-user-folder folder)
                 (get-compartidos-user-folder folder)
                 (get-tamano-folder folder)
                 (get-cantidad-archivos-folder folder)
                 (get-seguridad-folder folder)
                 (get-ubicacion-folder folder))))

(define set-fecha-creacion-folder 
  (lambda (folder fecha)
    (make-folder (get-nombre-folder folder)
                 (get-contenido-folder folder)
                 fecha
                 (get-fecha-modif-folder folder)
                 (get-creador-user-folder folder)
                 (get-compartidos-user-folder folder)
                 (get-tamano-folder folder)
                 (get-cantidad-archivos-folder folder)
                 (get-seguridad-folder folder)
                 (get-ubicacion-folder folder))))

(define set-fecha-modif-folder 
  (lambda (folder fecha)
    (make-folder (get-nombre-folder folder)
                 (get-contenido-folder folder)
                 (get-fecha-creacion-folder folder)
                 fecha
                 (get-creador-user-folder folder)
                 (get-compartidos-user-folder folder)
                 (get-tamano-folder folder)
                 (get-cantidad-archivos-folder folder)
                 (get-seguridad-folder folder)
                 (get-ubicacion-folder folder))))

(define set-creador-user-folder 
  (lambda (folder user)
    (make-folder (get-nombre-folder folder)
                 (get-contenido-folder folder)
                 (get-fecha-creacion-folder folder)
                 (get-fecha-modif-folder folder)
                 user
                 (get-compartidos-user-folder folder)
                 (get-tamano-folder folder)
                 (get-cantidad-archivos-folder folder)
                 (get-seguridad-folder folder)
                 (get-ubicacion-folder folder))))

(define set-compartidos-user-folder 
  (lambda (folder users)
    (make-folder (get-nombre-folder folder)
                 (get-contenido-folder folder)
                 (get-fecha-creacion-folder folder)
                 (get-fecha-modif-folder folder)
                 (get-creador-user-folder folder)
                 users
                 (get-tamano-folder folder)
                 (get-cantidad-archivos-folder folder)
                 (get-seguridad-folder folder)
                 (get-ubicacion-folder folder))))

(define set-tamano-folder 
  (lambda (folder tamano)
    (make-folder (get-nombre-folder folder)
                 (get-contenido-folder folder)
                 (get-fecha-creacion-folder folder)
                 (get-fecha-modif-folder folder)
                 (get-creador-user-folder folder)
                 (get-compartidos-user-folder folder)
                 tamano
                 (get-cantidad-archivos-folder folder)
                 (get-seguridad-folder folder)
                 (get-ubicacion-folder folder))))

(define set-cantidad-archivos-folder 
  (lambda (folder cantidad)
    (make-folder (get-nombre-folder folder)
                 (get-contenido-folder folder)
                 (get-fecha-creacion-folder folder)
                 (get-fecha-modif-folder folder)
                 (get-creador-user-folder folder)
                 (get-compartidos-user-folder folder)
                 (get-tamano-folder folder)
                 cantidad
                 (get-seguridad-folder folder)
                 (get-ubicacion-folder folder))))

(define set-seguridad-folder 
  (lambda (folder seguridad)
    (make-folder (get-nombre-folder folder)
                 (get-contenido-folder folder)
                 (get-fecha-creacion-folder folder)
                 (get-fecha-modif-folder folder)
                 (get-creador-user-folder folder)
                 (get-compartidos-user-folder folder)
                 (get-tamano-folder folder)
                 (get-cantidad-archivos-folder folder)
                 seguridad
                 (get-ubicacion-folder folder))))

(define set-ubicacion-folder 
  (lambda (folder ubicacion)
    (make-folder (get-nombre-folder folder)
                 (get-contenido-folder folder)
                 (get-fecha-creacion-folder folder)
                 (get-fecha-modif-folder folder)
                 (get-creador-user-folder folder)
                 (get-compartidos-user-folder folder)
                 (get-tamano-folder folder)
                 (get-cantidad-archivos-folder folder)
                 (get-seguridad-folder folder)
                 ubicacion)))



















