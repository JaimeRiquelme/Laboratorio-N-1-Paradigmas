#lang racket/base
(require racket/date)

(require "TDA_Drive_20964708_RiquelmeOlguin.rkt")
(provide (all-defined-out))


;Contructor system
(define (make-system nombre drive usuarios ruta fecha-actual)
  (list nombre drive usuarios ruta fecha-actual))

(define (system nombre)
  (make-system nombre null null null (fecha-actual)))

(define get-nombre (lambda (system) (car system)))

(define get-drive (lambda (system) (cadr system)))

(define get-usuarios (lambda (system) (caddr system)))

(define get-ruta (lambda(system)(cadr(reverse system))))

(define get-fecha (lambda (system) (car (reverse system))))

(define set-nombre-system (lambda (system-nombre nombre)
                            (make-system nombre (get-drive system-nombre)(get-usuarios system-nombre)
                                         (get-ruta system-nombre)(get-fecha system-nombre))))
(define set-drive-system(lambda (system drive)
                          (make-system (get-nombre system) drive
                                       (get-usuarios system) (get-ruta system) (get-fecha system))))

(define set-usuarios-system(lambda (system usuarios)(make-system
                                       (get-nombre system) (get-drive system) usuarios (get-ruta system) (get-fecha system))))

(define set-ruta-system(lambda (system ruta)(make-system (get-nombre system)
                                        (get-drive system) (get-usuarios system) ruta (get-fecha system))))

(define set-fecha-system(lambda (system fecha)(make-system (get-nombre system)
                                        (get-drive system) (get-usuarios system) (get-ruta system) fecha)))

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
                       (get-fecha system))
          system))))

                       




;creando un sistema
(define S0 (system "newSystem"))

;añadiendo unidades. Incluye caso S2 que intenta añadir unidad con una letra que ya existe
(define S1 ((run S0 add-drive) #\C "SO" 1000))
(define S2 ((run S1 add-drive) #\C "SO1" 3000))
(define S3 ((run S2 add-drive) #\D "Util" 2000))

S0
S1
S2
S3












