#lang racket

(require "TDA_Folder_20964708_RiquelmeOlguin.rkt")


(define (make-file nombre contenido-file extencion fecha-creacion fecha-modificacion creador-user
                   compartidos-user tamaño seguridad)
  (list nombre contenido-file extencion fecha-creacion fecha-modificacion creador-user
                   compartidos-user tamaño seguridad))

;selectores
(define get-nombre-file(lambda (file)(car file)))

(define get-contenido-file(lambda(file)(cadr file)))

(define get-extension-file(lambda (file)(caddr file)))

(define get-fecha-creacion-file(lambda (file)(cadddr file)))

(define get-fecha-modificacion-file(lambda (file)(cadr (cdddr file))))

(define get-creador-user-file(lambda (file)(cadr (cddddr file))))

(define get-compartidos-user-file(lambda (file)(caddr (cddddr file))))

(define get-tamaño-file(lambda (file)(cadddr(cddddr file))))

(define get-seguridad-file(lambda (file)(cadddr (cdr(cddddr file)))))

 ;modificadores

(define set-nombre-file 
  (lambda (file nombre)
    (make-file nombre
               (get-contenido-file file)
               (get-extension-file file)
               (get-fecha-creacion-file file)
               (get-fecha-modificacion-file file)
               (get-creador-user-file file)
               (get-compartidos-user-file file)
               (get-tamaño-file file)
               (get-seguridad-file file))))

(define set-contenido-file 
  (lambda (file contenido)
    (make-file (get-nombre-file file)
               contenido
               (get-extension-file file)
               (get-fecha-creacion-file file)
               (get-fecha-modificacion-file file)
               (get-creador-user-file file)
               (get-compartidos-user-file file)
               (get-tamaño-file file)
               (get-seguridad-file file))))

(define set-extension-file 
  (lambda (file extension)
    (make-file (get-nombre-file file)
               (get-contenido-file file)
               extension
               (get-fecha-creacion-file file)
               (get-fecha-modificacion-file file)
               (get-creador-user-file file)
               (get-compartidos-user-file file)
               (get-tamaño-file file)
               (get-seguridad-file file))))

(define set-fecha-creacion-file 
  (lambda (file fecha)
    (make-file (get-nombre-file file)
               (get-contenido-file file)
               (get-extension-file file)
               fecha
               (get-fecha-modificacion-file file)
               (get-creador-user-file file)
               (get-compartidos-user-file file)
               (get-tamaño-file file)
               (get-seguridad-file file))))

(define set-fecha-modificacion-file 
  (lambda (file fecha)
    (make-file (get-nombre-file file)
               (get-contenido-file file)
               (get-extension-file file)
               (get-fecha-creacion-file file)
               fecha
               (get-creador-user-file file)
               (get-compartidos-user-file file)
               (get-tamaño-file file)
               (get-seguridad-file file))))

(define set-creador-user-file 
  (lambda (file user)
    (make-file (get-nombre-file file)
               (get-contenido-file file)
               (get-extension-file file)
               (get-fecha-creacion-file file)
               (get-fecha-modificacion-file file)
               user
               (get-compartidos-user-file file)
               (get-tamaño-file file)
               (get-seguridad-file file))))

(define set-compartidos-user-file 
  (lambda (file users)
    (make-file (get-nombre-file file)
               (get-contenido-file file)
               (get-extension-file file)
               (get-fecha-creacion-file file)
               (get-fecha-modificacion-file file)
               (get-creador-user-file file)
               users
               (get-tamaño-file file)
               (get-seguridad-file file))))

(define set-tamaño-file 
  (lambda (file tamaño)
    (make-file (get-nombre-file file)
               (get-contenido-file file)
               (get-extension-file file)
               (get-fecha-creacion-file file)
               (get-fecha-modificacion-file file)
               (get-creador-user-file file)
               (get-compartidos-user-file file)
               tamaño
               (get-seguridad-file file))))
(define set-seguridad-file 
  (lambda (file seguridad)
    (make-file (get-nombre-file file)
               (get-contenido-file file)
               (get-extension-file file)
               (get-fecha-creacion-file file)
               (get-fecha-modificacion-file file)
               (get-creador-user-file file)
               (get-compartidos-user-file file)
               (get-tamaño-file file)
               seguridad)))