#lang racket/base
(provide (all-defined-out))





; Nombre de la función: make-folder
; Dominio: nombre X contenido-folder X fecha-creacion X fecha-modif X creador-user X compartidos-user X tamano X cantidad-archivos X seguridad X ubicacion
; Recorrido: folder
; Recursión: no aplica
; Descripción: Esta función toma varios argumentos relacionados con un folder y devuelve un folder como una lista.



(define (make-folder nombre contenido-folder fecha-creacion fecha-modif creador-user compartidos-user
                     tamano cantidad-archivos seguridad  ubicacion)
         (list nombre contenido-folder fecha-creacion fecha-modif creador-user compartidos-user
                     tamano cantidad-archivos seguridad ubicacion))



;----------------selectores--------------------------
; Nombre de la función: get-nombre-folder
; Dominio: folder
; Recorrido: nombre del folder
; Recursión: no aplica
; Descripción: Esta función toma un folder como argumento y devuelve el nombre del folder.

(define get-nombre-folder(lambda (folder)(car folder)))

; Nombre de la función: get-contenido-folder
; Dominio: folder
; Recorrido: contenido del folder
; Recursión: no aplica
; Descripción: Esta función toma un folder como argumento y devuelve el contenido del folder.


(define get-contenido-folder(lambda (folder)(cadr folder)))

; Nombre de la función: get-fecha-creacion-folder
; Dominio: folder
; Recorrido: fecha de creación del folder
; Recursión: no aplica
; Descripción: Esta función toma un folder como argumento y devuelve la fecha de creación del folder.


(define get-fecha-creacion-folder(lambda (folder)(caddr folder)))

; Nombre de la función: get-fecha-modif-folder
; Dominio: folder
; Recorrido: fecha de modificación del folder
; Recursión: no aplica
; Descripción: Esta función toma un folder como argumento y devuelve la fecha de modificación del folder.


(define get-fecha-modif-folder(lambda (folder)(cadddr folder)))

; Nombre de la función: get-creador-user-folder
; Dominio: folder
; Recorrido: usuario creador del folder
; Recursión: no aplica
; Descripción: Esta función toma un folder como argumento y devuelve el usuario creador del folder.


(define get-creador-user-folder(lambda (folder)(cadr(cdddr folder))))

; Nombre de la función: get-compartidos-user-folder
; Dominio: folder
; Recorrido: lista de usuarios con los que se comparte el folder
; Recursión: no aplica
; Descripción: Esta función toma un folder como argumento y devuelve la lista de usuarios con los que se comparte el folder.


(define get-compartidos-user-folder(lambda (folder)(caddr(cdddr folder))))

; Nombre de la función: get-tamano-folder
; Dominio: folder
; Recorrido: tamaño del folder
; Recursión: no aplica
; Descripción: Esta función toma un folder como argumento y devuelve el tamaño del folder.


(define get-tamano-folder(lambda (folder)(caddr (cddddr folder))))

; Nombre de la función: get-cantidad-archivos-folder
; Dominio: folder
; Recorrido: cantidad de archivos en el folder
; Recursión: no aplica
; Descripción: Esta función toma un folder como argumento y devuelve la cantidad de archivos en el folder.


(define get-cantidad-archivos-folder(lambda (folder)(caddr (reverse folder))))

; Nombre de la función: get-seguridad-folder
; Dominio: folder
; Recorrido: nivel de seguridad del folder
; Recursión: no aplica
; Descripción: Esta función toma un folder como argumento y devuelve el nivel de seguridad del folder.


(define get-seguridad-folder(lambda (folder)(cadr (reverse folder))))

; Nombre de la función: get-ubicacion-folder
; Dominio: folder
; Recorrido: ubicación del folder
; Recursión: no aplica
; Descripción: Esta función toma un folder como



(define get-ubicacion-folder(lambda (folder)(car (reverse folder))))

;---------------------------modificadores---------------------------

; Nombre de la función: set-nombre-folder
; Dominio: folder, nombre
; Recorrido: folder actualizado
; Recursión: no aplica
; Descripción: Esta función toma un folder y un nombre como argumentos, y devuelve un nuevo folder con el nombre actualizado.


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

; Nombre de la función: set-contenido-folder
; Dominio: folder, contenido
; Recorrido: folder actualizado
; Recursión: no aplica
; Descripción: Esta función toma un folder y un contenido como argumentos, y devuelve un nuevo folder con el contenido actualizado.


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

; Nombre de la función: set-contenido-folder2
; Dominio: folder, contenido
; Recorrido: folder actualizado
; Recursión: no aplica
; Descripción: Esta función toma un folder y un contenido como argumentos, y devuelve un nuevo folder con el contenido actualizado, reemplazando el contenido existente en lugar de agregarlo al contenido actual.


(define set-contenido-folder2 
  (lambda (folder contenido)
    (make-folder (get-nombre-folder folder)
                 contenido
                 (get-fecha-creacion-folder folder)
                 (get-fecha-modif-folder folder)
                 (get-creador-user-folder folder)
                 (get-compartidos-user-folder folder)
                 (get-tamano-folder folder)
                 (get-cantidad-archivos-folder folder)
                 (get-seguridad-folder folder)
                 (get-ubicacion-folder folder))))

; Nombre de la función: set-fecha-creacion-folder
; Dominio: folder, fecha
; Recorrido: folder actualizado
; Recursión: no aplica
; Descripción: Esta función toma un folder y una fecha como argumentos, y devuelve un nuevo folder con la fecha de creación actualizada.

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

; Nombre de la función: set-fecha-modif-folder
; Dominio: folder, fecha
; Recorrido: folder actualizado
; Recursión: no aplica
; Descripción: Esta función toma un folder y una fecha como argumentos, y devuelve un nuevo folder con la fecha de modificación actualizada.


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

; Nombre de la función: set-creador-user-folder
; Dominio: folder, user
; Recorrido: folder actualizado
; Recursión: no aplica
; Descripción: Esta función toma un folder y un usuario como argumentos, y devuelve un nuevo folder con el usuario creador actualizado.


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

; Nombre de la función: set-compartidos-user-folder
; Dominio: folder, users
; Recorrido: folder actualizado
; Recursión: no aplica
; Descripción: Esta función toma un folder y una lista de usuarios como argumentos, y devuelve un nuevo folder con la lista de usuarios con los que se comparte el folder actualizada.


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

; Nombre de la función: set-tamano-folder
; Dominio: folder, tamaño
; Recorrido: folder actualizado
; Recursión: no aplica
; Descripción: Esta función toma un folder y un tamaño como argumentos, y devuelve un nuevo folder con el tamaño actualizado.


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

; Nombre de la función: set-cantidad-archivos-folder
; Dominio: folder, cantidad
; Recorrido: folder actualizado
; Recursión: no aplica
; Descripción: Esta función


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

; Nombre de la función: set-seguridad-folder
; Dominio: folder, seguridad
; Recorrido: folder actualizado
; Recursión: no aplica
; Descripción: Esta función toma un folder y un nivel de seguridad como argumentos, y devuelve un nuevo folder con el nivel de seguridad actualizado.


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

; Nombre de la función: set-ubicacion-folder
; Dominio: folder, ubicación
; Recorrido: folder actualizado
; Recursión: no aplica
; Descripción: Esta función toma un folder y una ubicación como argumentos, y devuelve un nuevo folder con la ubicación actualizada.


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


; Nombre de la función: contenido?
; Dominio: folder
; Recorrido: booleano
; Recursión: no aplica
; Descripción: Esta función toma un folder como argumento.
;              Verifica si el contenido del folder está vacío.
;              Devuelve #t si el folder está vacío, #f en caso contrario.

(define contenido?
  (lambda(folder)(null?(get-contenido-folder folder))))















