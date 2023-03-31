#lang racket/base
(require racket/date)

(require "TDA_Drive_20964708_RiquelmeOlguin.rkt")
(require "TDA_User_20964708_RiquelmeOlguin.rkt")
(provide (all-defined-out))


;Contructor system
(define (make-system nombre drive usuarios ruta fecha-actual logeado)
  (list nombre drive usuarios ruta fecha-actual logeado))

(define (system nombre)
  (make-system nombre '() '() "/ruta/default" (fecha-actual) '()))

(define get-nombre (lambda (system) (car system)))

(define get-drive (lambda (system) (cadr system)))

(define get-usuarios (lambda (system) (caddr system)))

(define get-ruta (lambda(system)(caddr(reverse system))))

(define get-fecha (lambda (system) (cadr (reverse system))))

(define get-login (lambda(system)(car(reverse system))))

(define set-nombre-system (lambda (system-nombre nombre)(make-system nombre (get-drive system-nombre) (get-usuarios system-nombre)
                 (get-ruta system-nombre) (get-fecha system-nombre) (get-login system-nombre))))

(define set-drive-system(lambda (system drive)(make-system (get-nombre system) drive (get-usuarios system) (get-ruta system)
                 (get-fecha system) (get-login system))))

(define set-usuarios-system(lambda (system usuarios)(make-system (get-nombre system) (get-drive system) usuarios (get-ruta system)
                 (get-fecha system) (get-login system))))

(define set-ruta-system(lambda (system ruta)(make-system (get-nombre system) (get-drive system) (get-usuarios system) ruta
                 (get-fecha system) (get-login system))))

(define set-fecha-system(lambda (system fecha)(make-system (get-nombre system) (get-drive system) (get-usuarios system) (get-ruta system)
                 fecha (get-login system))))

(define (set-logeado system user)(make-system(get-nombre system)(get-drive system)(get-usuarios system)(get-ruta system)(get-fecha system)user))




(define (fecha-actual)(define fecha (current-date))
        (list (date-day fecha)
               (date-month fecha)
               (date-year fecha)
               (string-append (number->string (date-hour fecha))
                       ":"
                (number->string (date-minute fecha)))))


;RUN
;Dominio: Comando
;recorrido: Run comando
;Descripcion: Funcion que ejecuta comandos enviados al sistema.
(define run(lambda (system comando)(comando system)))





;RUN
;Dominio: System
;recorrido: Sytem con un nuevo drive
;Descripcion: Funcion que ejecuta comandos enviados al sistema.
(define add-drive
  (lambda (system)
    (lambda (letra nombre capacidad)
      (if (not (member letra (map car (get-drive system))))
          (make-system (get-nombre system)
                       (cons (make-drive letra nombre capacidad) (get-drive system))
                       (get-usuarios system)
                       (get-ruta system)
                       (get-fecha system)
                       (get-login system)) ; Agregar el usuario logeado actualmente en el sistema
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
          (make-system (get-nombre system)
                       (get-drive system)
                       (append (get-usuarios system) (list (make-user name-user)))
                       (get-ruta system)
                       (fecha-actual)
                       (get-login system))))))


(define login
  (lambda (system)
    (lambda (name-user)
      (if (member name-user (map car (get-usuarios system)))
          (if (null? (get-usuarios system))
              (begin
                (set-usuarios-system (set-usuarios-system system (append (get-usuarios system) (list (make-user name-user)))))
                (set-logeado (set-usuarios-system system name-user) #t)
                (display "Usuario conectado\n"))
              (display "Ya hay un usuario conectado\n"))
          (display "Usuario no existe\n"))
      (set-usuarios-system system (get-usuarios system)))))













;creando un sistema
(define S0 (system "newSystem"))

;añadiendo unidades. Incluye caso S2 que intenta añadir unidad con una letra que ya existe
(define S1 ((run S0 add-drive) #\C "SO" 1000))
(define S2 ((run S1 add-drive) #\C "SO1" 3000))
(define S3 ((run S2 add-drive) #\D "Util" 2000))

;añadiendo usuarios. Incluye caso S6 que intenta registrar usuario duplicado
(define S4 ((run S3 add-user) "user1"))
(define S5 ((run S4 add-user) "user1"))
(define S6 ((run S5 add-user) "user2"))

;iniciando sesión con usuarios. Incluye caso S8 que intenta iniciar sesión con user2 sin antes haber salido con user1
(define S7 ((run S6 login) "user1"))
(define S8 ((run S7 login) "user2"))


S0
S1
S2
S3
S4
S5
S6
S7
S8












