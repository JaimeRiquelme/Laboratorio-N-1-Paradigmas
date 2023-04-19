#lang racket/base
(provide (all-defined-out))


;Nombre de la función: make-drive
;Dominio: letra X nombre X capacidad X contenido
;Recorrido: drive
;Descripción: Esta función toma como argumentos una letra, un nombre, una capacidad y un contenido y retorna una lista que representa un drive.
; La letra representa la letra de la unidad, el nombre el nombre del drive, la capacidad la cantidad de espacio disponible y el contenido es una lista con el contenido del drive.

(define make-drive
  (lambda (letra nombre capacidad contenido)
    (list letra nombre capacidad contenido)))

(define make-currentdrive
  (lambda (drive)
           (list (char-upcase drive))))

;Nombre de la función: drive
;Dominio: letra (string) X nombre (string) X capacidad (number)
;Recorrido: drive
;Descripción: Esta función toma una letra de unidad letra (string), un nombre de drive nombre (string) y una capacidad en bytes capacidad (number) como argumentos.
; Devuelve un drive con la letra, el nombre y la capacidad especificados y sin contenido.

(define (drive letra nombre capacidad)
  (make-drive letra nombre capacidad null))

;Nombre de la función: currentdrive
;Dominio: letra
;Recorrido: letra
;Descripción: Esta función toma una letra de unidad (letra) como argumento y crea una lista con esa letra. Esta lista representa la unidad actual del sistema.
(define currentdrive
  (lambda (drive)(make-currentdrive drive)))

;selectores

; Nombre de la función: get-letra-drive
; Dominio: drive
; Recorrido: letra del drive
; Recursión: no aplica
; Descripción: Esta función toma un objeto drive como argumento y devuelve su letra.

(define get-letra-drive (lambda (drive)(car drive)))

; Nombre de la función: get-nombre-drive
; Dominio: drive
; Recorrido: nombre del drive
; Recursión: no aplica
; Descripción: Esta función toma un objeto drive como argumento y devuelve su nombre.

(define get-nombre-drive (lambda (drive)(cadr drive)))

; Nombre de la función: get-capacidad-drive
; Dominio: drive
; Recorrido: capacidad del drive
; Recursión: no aplica
; Descripción: Esta función toma un objeto drive como argumento y devuelve su capacidad.

(define get-capacidad-drive (lambda (drive)(caddr drive)))

; Nombre de la función: get-contenido-drive
; Dominio: drive
; Recorrido: contenido del drive
; Recursión: no aplica
; Descripción: Esta función toma un objeto drive como argumento y devuelve su contenido.

(define get-contenido-drive (lambda (drive)(car (reverse drive))))

;modificadores

; Nombre de la función: set-nombre-drive
; Dominio: nombre, drive
; Recorrido: nuevo objeto drive
; Recursión: no aplica
; Descripción: Esta función toma un nombre y un objeto drive como argumentos y devuelve un nuevo objeto drive con el nombre actualizado.


(define set-nombre-drive
  (lambda (nombre drive)
    (make-drive (get-letra-drive drive)
                nombre
                (get-contenido-drive drive)
                (get-contenido-drive drive))))

; Nombre de la función: set-contenido-drive
; Dominio: contenido, drive
; Recorrido: nuevo objeto drive
; Recursión: no aplica
; Descripción: Esta función toma un contenido y un objeto drive como argumentos y devuelve un nuevo objeto drive con el contenido añadido al principio de la lista de contenidos existente.


(define set-contenido-drive
  (lambda (contenido drive)
    (make-drive (get-letra-drive drive)
                (get-nombre-drive drive)
                (get-capacidad-drive drive)
                (cons contenido (get-contenido-drive drive)))))

; Nombre de la función: set-contenido-drive2
; Dominio: contenido, drive
; Recorrido: nuevo objeto drive
; Recursión: no aplica
; Descripción: Esta función toma un contenido y un objeto drive como argumentos y devuelve un nuevo objeto drive con el contenido actualizado.


(define set-contenido-drive2
  (lambda (contenido drive)
    (make-drive (get-letra-drive drive)
                (get-nombre-drive drive)
                (get-capacidad-drive drive)
                 contenido)))























