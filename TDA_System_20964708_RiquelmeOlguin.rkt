#lang racket/base
(require racket/date)


; Dominio: System (String)
; Recorrido: New System
; Descripción: Función que crea un nuevo sistema
(define (system nombre)
  (make-system nombre null null (current-date)))



(define make-user(lambda (name)(list name)))


(define (make-system name drive usuarios fecha-creacion)
  (list name drive usuarios fecha-creacion))


;RUN
(define (run sistema comando)(comando sistema))


;;CAPA SELECTORA DEL SYSTEM:
(define get-name car)
(define get-drive cadr)
(define get-usuarios caddr)
(define (get-fecha system)(car (reverse system)))


;CAPA MODIFICADORA DEL DRIVE:
(define (make-drive letra nombre capacidad)
  (list letra nombre capacidad))

(define (login-list name-user)
                    (list name-user))
(define (get-login-list system)
  (login-list system))


(define set-login-list
  (lambda (system login-list)
    (make-system (get-name system)
                 (get-drive system)
                 (get-usuarios system)
                 (current-date)
                 (if (null? login-list) '() login-list))))





(define add-drive
  (lambda (system)
    (lambda (letra nombre capacidad)
      (if (not (member letra (map car (get-drive system))))
          (make-system (get-name system)
                       (cons (make-drive letra nombre capacidad) (get-drive system))
                       (get-usuarios system)
                       (current-date))
          system))))




(define add-user
  (lambda (system)
    (lambda (name-user)
      (if (member name-user (map car (get-usuarios system)))
          (begin
            (display "Usuario ya existe: ")
            (display name-user)
            (display "\n")
            system)
          (make-system (get-name system)
                       (get-drive system)
                       (append (get-usuarios system) (list (make-user name-user)))
                       (current-date))))))



(define login
  (lambda (system)
    (lambda (name-user)
      (if (member name-user (map car(get-usuarios system)))
          (if (null? (get-login-list system))
              (begin
                (run system (set-login-list (get-login-list system) (login-list name-user)))
                (display "Bienvenido, ")
                (display name-user)
                (display "\n"))
              (display "Ya hay un usuario conectado\n"))
          (display "Usuario no existe\n")))))

(define logout
  (lambda (system)
    (run system (set-login-list '()))))








;creando un sistema
(define S0 (system "newSystem"))

;añadiendo unidades. Incluye caso S2 que intenta añadir unidad con una letra que ya existe
(define S1 ((run S0 add-drive) #\C "SO" 1000))
(define S2 ((run S1 add-drive) #\C "SO1" 3000))
(define S3 ((run S2 add-drive) #\D "Util" 2000))

S3

;añadiendo usuarios. Incluye caso S6 que intenta registrar usuario duplicado
(define S4 ((run S3 add-user) "user1"))
(define S5 ((run S4 add-user) "user1"))
(define S6 ((run S5 add-user) "user2"))

;iniciando sesión con usuarios. Incluye caso S8 que intenta iniciar sesión con user2 sin antes haber salido con user1
(define S7 ((run S6 login) "user1"))
(define S8 ((run S7 login) "user2"))















