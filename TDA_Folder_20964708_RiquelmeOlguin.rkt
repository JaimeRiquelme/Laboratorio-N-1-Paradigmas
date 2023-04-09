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

(define get-fecha-creacion-folder(lambda (folder)(cadr folder)))

(define get-fecha-modif-folder(lambda (folder)(caddr folder)))

(define get-creador-user-folder(lambda (folder)(cadddr folder)))

(define get-compartidos-user-folder(lambda (folder)(cadddr folder)))

(define get-tamano-folder(lambda (folder)(car (cddddr folder))))

(define get-cantidad-archivos-folder(lambda (folder)(cadr (cddddr folder))))

(define get-seguridad-folder(lambda (folder)(caddr (cddddr folder))))

(define get-contenido-folder(lambda (folder)(cadddr (cddddr folder))))

(define get-ubicacion-folder(lambda (folder)(cddddr (cddddr folder))))
















