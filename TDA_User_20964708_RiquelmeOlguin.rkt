#lang racket/base
(provide (all-defined-out))

; Nombre de la función: make-user
; Dominio: nombre
; Recorrido: ninguno
; Recursión: ninguna
; Descripción: Esta función toma un nombre de usuario 'name' como argumento.
;              Crea y devuelve una lista con el nombre de usuario 'name' como único elemento.
;              Esta función no tiene un recorrido ya que solo crea y devuelve la lista con el nombre de usuario.


(define make-user (lambda (name)(list name)))

; Nombre de la función: get-user
; Dominio: usuario
; Recorrido: lista de usuario
; Recursión: ninguna
; Descripción: Esta función toma una lista de usuario 'user' como argumento.
;              Devuelve el nombre de usuario contenido en la lista.
;              Esta función recorre la lista de usuario y devuelve el primer elemento de la lista, que es el nombre de usuario.

(define get-user
  (lambda (user)
    (car user)))

; Nombre de la función: set-user
; Dominio: lista de usuario X nombre
; Recorrido: lista de usuario
; Recursión: ninguna
; Descripción: Esta función toma una lista de usuario 'user' y un nombre de usuario 'nombre' como argumentos.
;              Crea una nueva lista con el nombre de usuario 'nombre' como único elemento y la devuelve.
;              Esta función no tiene un recorrido ya que simplemente crea una nueva lista con el nombre de usuario actualizado.



(define set-user(lambda (user nombre)(make-user nombre)))






