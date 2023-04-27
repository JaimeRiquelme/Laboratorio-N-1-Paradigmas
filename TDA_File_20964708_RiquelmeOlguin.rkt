#lang racket
(provide (all-defined-out))

; Nombre de la función: make-file
; Dominio: nombre, extensión, contenido-file, fecha-creacion, fecha-modificacion, creador-user, compartidos-user, tamaño, seguridad, ubicacion
; Recorrido: file
; Recursión: no aplica
; Descripción: Esta función crea un archivo con los atributos proporcionados como argumentos, incluyendo nombre, extensión, contenido, fechas de creación y modificación, creador, compartidos, tamaño, seguridad y ubicación.

(define (make-file nombre extencion contenido-file fecha-creacion fecha-modificacion creador-user
                   compartidos-user tamaño seguridad ubicacion)
  (list nombre extencion contenido-file fecha-creacion fecha-modificacion creador-user
                   compartidos-user tamaño seguridad ubicacion))

;selectores

; Nombre de la función: get-nombre-file
; Dominio: file
; Recorrido: nombre del archivo
; Recursión: no aplica
; Descripción: Esta función toma un archivo como argumento y devuelve su nombre.

(define get-nombre-file(lambda (file)(car file)))

; Nombre de la función: get-contenido-file
; Dominio: file
; Recorrido: contenido del archivo
; Recursión: no aplica
; Descripción: Esta función toma un archivo como argumento y devuelve su contenido.

(define get-contenido-file(lambda(file)(caddr file)))

; Nombre de la función: get-extension-file
; Dominio: file
; Recorrido: extensión del archivo
; Recursión: no aplica
; Descripción: Esta función toma un archivo como argumento y devuelve su extensión.


(define get-extension-file(lambda (file)(cadr file)))

; Nombre de la función: get-fecha-creacion-file
; Dominio: file
; Recorrido: fecha de creación del archivo
; Recursión: no aplica
; Descripción: Esta función toma un archivo como argumento y devuelve su fecha de creación.


(define get-fecha-creacion-file(lambda (file)(cadddr file)))

; Nombre de la función: get-fecha-modificacion-file
; Dominio: file
; Recorrido: fecha de modificación del archivo
; Recursión: no aplica
; Descripción: Esta función toma un archivo como argumento y devuelve su fecha de modificación.


(define get-fecha-modificacion-file(lambda (file)(cadr (cdddr file))))

; Nombre de la función: get-creador-user-file
; Dominio: file
; Recorrido: creador del archivo
; Recursión: no aplica
; Descripción: Esta función toma un archivo como argumento y devuelve el usuario creador del archivo.


(define get-creador-user-file(lambda (file)(cadr (cddddr file))))

; Nombre de la función: get-compartidos-user-file
; Dominio: file
; Recorrido: lista de usuarios con los que se comparte el archivo
; Recursión: no aplica
; Descripción: Esta función toma un archivo como argumento y devuelve la lista de usuarios con los que se comparte el archivo.


(define get-compartidos-user-file(lambda (file)(caddr (cddddr file))))

; Nombre de la función: get-tamaño-file
; Dominio: file
; Recorrido: tamaño del archivo
; Recursión: no aplica
; Descripción: Esta función toma un archivo como argumento y devuelve su tamaño.


(define get-tamano-file(lambda (file)(cadddr(cddddr file))))

; Nombre de la función: get-seguridad-file
; Dominio: file
; Recorrido: nivel de seguridad del archivo
; Recursión: no aplica
; Descripción: Esta función toma un archivo como argumento y devuelve su nivel de seguridad.


(define get-seguridad-file(lambda (file)(cadddr (cdr(cddddr file)))))

; Nombre de la función: get-ubicacion-file
; Dominio: file
; Recorrido: ubicación del archivo
; Recursión: no aplica
; Descripción: Esta función toma un archivo como argumento y devuelve su ubicación.


(define get-ubicacion-file (lambda(file)(car(reverse file))))

 ;modificadores

; Nombre de la función: set-nombre-file
; Dominio: file, nombre
; Recorrido: file con el nombre actualizado
; Recursión: no aplica
; Descripción: Esta función toma un archivo y un nombre como argumentos y devuelve un nuevo archivo con el nombre actualizado.


(define set-nombre-file 
  (lambda (file nombre)
    (make-file nombre
               (get-contenido-file file)
               (get-extension-file file)
               (get-fecha-creacion-file file)
               (get-fecha-modificacion-file file)
               (get-creador-user-file file)
               (get-compartidos-user-file file)
               (get-tamano-file file)
               (get-seguridad-file file)
               (get-ubicacion-file file))))

; Nombre de la función: set-contenido-file
; Dominio: file, contenido
; Recorrido: file con el contenido actualizado
; Recursión: no aplica
; Descripción: Esta función toma un archivo y un contenido como argumentos y devuelve un nuevo archivo con el contenido actualizado.


(define set-contenido-file 
  (lambda (file contenido)
    (make-file (get-nombre-file file)
               contenido
               (get-extension-file file)
               (get-fecha-creacion-file file)
               (get-fecha-modificacion-file file)
               (get-creador-user-file file)
               (get-compartidos-user-file file)
               (get-tamano-file file)
               (get-seguridad-file file)
               (get-ubicacion-file file))))

; Nombre de la función: set-extension-file
; Dominio: file, extension
; Recorrido: file con la extensión actualizada
; Recursión: no aplica
; Descripción: Esta función toma un archivo y una extensión como argumentos y devuelve un nuevo archivo con la extensión actualizada.

(define set-extension-file 
  (lambda (file extension)
    (make-file (get-nombre-file file)
               (get-contenido-file file)
               extension
               (get-fecha-creacion-file file)
               (get-fecha-modificacion-file file)
               (get-creador-user-file file)
               (get-compartidos-user-file file)
               (get-tamano-file file)
               (get-seguridad-file file)
               (get-ubicacion-file file))))

; Nombre de la función: set-fecha-creacion-file
; Dominio: file, fecha
; Recorrido: file con la fecha de creación actualizada
; Recursión: no aplica
; Descripción: Esta función toma un archivo y una fecha como argumentos y devuelve un nuevo archivo con la fecha de creación actualizada.

(define set-fecha-creacion-file 
  (lambda (file fecha)
    (make-file (get-nombre-file file)
               (get-contenido-file file)
               (get-extension-file file)
               fecha
               (get-fecha-modificacion-file file)
               (get-creador-user-file file)
               (get-compartidos-user-file file)
               (get-tamano-file file)
               (get-seguridad-file file)
               (get-ubicacion-file file))))

; Nombre de la función: set-fecha-modificacion-file
; Dominio: file, fecha
; Recorrido: file con la fecha de modificación actualizada
; Recursión: no aplica
; Descripción: Esta función toma un archivo y una fecha como argumentos y devuelve un nuevo archivo con la fecha de modificación actualizada.

(define set-fecha-modificacion-file 
  (lambda (file fecha)
    (make-file (get-nombre-file file)
               (get-contenido-file file)
               (get-extension-file file)
               (get-fecha-creacion-file file)
               fecha
               (get-creador-user-file file)
               (get-compartidos-user-file file)
               (get-tamano-file file)
               (get-seguridad-file file)
               (get-ubicacion-file file))))

; Nombre de la función: set-creador-user-file
; Dominio: file, user
; Recorrido: file con el creador actualizado
; Recursión: no aplica
; Descripción: Esta función toma un archivo y un usuario como argumentos y devuelve un nuevo archivo con el creador actualizado.

(define set-creador-user-file 
  (lambda (file user)
    (make-file (get-nombre-file file)
               (get-contenido-file file)
               (get-extension-file file)
               (get-fecha-creacion-file file)
               (get-fecha-modificacion-file file)
               user
               (get-compartidos-user-file file)
               (get-tamano-file file)
               (get-seguridad-file file)
               (get-ubicacion-file file))))

; Nombre de la función: set-compartidos-user-file
; Dominio: file, users
; Recorrido: file con los usuarios compartidos actualizados
; Recursión: no aplica
; Descripción: Esta función toma un archivo y una lista de usuarios como argumentos y devuelve un nuevo archivo con los usuarios compartidos actualizados.

(define set-compartidos-user-file 
  (lambda (file users)
    (make-file (get-nombre-file file)
               (get-contenido-file file)
               (get-extension-file file)
               (get-fecha-creacion-file file)
               (get-fecha-modificacion-file file)
               (get-creador-user-file file)
               users
               (get-tamano-file file)
               (get-seguridad-file file)
               (get-ubicacion-file file))))

; Nombre de la función: set-tamaño-file
; Dominio: file, tamaño
; Recorrido: file con el tamaño actualizado
; Recursión: no aplica
; Descripción: Esta función toma un archivo y un tamaño como argumentos y devuelve un nuevo archivo con el tamaño actualizado.

(define set-tamano-file 
  (lambda (file tamano)
    (make-file (get-nombre-file file)
               (get-contenido-file file)
               (get-extension-file file)
               (get-fecha-creacion-file file)
               (get-fecha-modificacion-file file)
               (get-creador-user-file file)
               (get-compartidos-user-file file)
               tamano
               (get-seguridad-file file)
               (get-ubicacion-file file))))

; Nombre de la función: set-seguridad-file
; Dominio: file, seguridad
; Recorrido: file con la seguridad actualizada
; Recursión: no aplica
; Descripción: Esta función toma un archivo y un valor de seguridad como argumentos y devuelve un nuevo archivo con la seguridad actualizada.

(define set-seguridad-file 
  (lambda (file seguridad)
    (make-file (get-nombre-file file)
               (get-contenido-file file)
               (get-extension-file file)
               (get-fecha-creacion-file file)
               (get-fecha-modificacion-file file)
               (get-creador-user-file file)
               (get-compartidos-user-file file)
               (get-tamano-file file)
               seguridad
               (get-ubicacion-file file))))

; Nombre de la función: set-ubicacion-file
; Dominio: file, ubicacion
; Recorrido: file con la ubicación actualizada
; Recursión: no aplica
; Descripción: Esta función toma un archivo y una ubicación como argumentos y devuelve un nuevo archivo con la ubicación actualizada.


(define set-ubicacion-file 
  (lambda (file ubicacion)
    (make-file (get-nombre-file file)
               (get-contenido-file file)
               (get-extension-file file)
               (get-fecha-creacion-file file)
               (get-fecha-modificacion-file file)
               (get-creador-user-file file)
               (get-compartidos-user-file file)
               (get-tamano-file file)
               (get-seguridad-file file)
               ubicacion)))