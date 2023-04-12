#lang racket/base
(require racket/date)
(require racket/string)

(require "TDA_Drive_20964708_RiquelmeOlguin.rkt")
(require "TDA_User_20964708_RiquelmeOlguin.rkt")
(require "TDA_Folder_20964708_RiquelmeOlguin.rkt")

(provide (all-defined-out))


;Contructor system
(define (make-system nombre drive usuarios ruta fecha-actual logeado current-drive)
  (list nombre drive usuarios ruta fecha-actual logeado current-drive))



(define (system nombre)
  (make-system nombre '() '() "" (fecha-actual) '() null ))

(define get-nombre-system (lambda (system) (car system)))

(define get-drive-system (lambda (system) (cadr system)))

(define get-usuarios-system (lambda (system) (caddr system)))

(define get-ruta-system (lambda(system)(cadddr(reverse system))))

(define get-fecha-system (lambda (system) (caddr (reverse system))))

(define get-logeado-system (lambda(system)(cadr(reverse system))))

(define get-current-drive-system (lambda (system)(car(reverse system))))

(define set-nombre-system (lambda (system-nombre nombre)(make-system nombre (get-drive-system system-nombre) (get-usuarios-system system-nombre)
                 (get-ruta-system system-nombre) (get-fecha-system system-nombre) (get-logeado-system system-nombre)(get-current-drive-system system))))

(define set-drive-system(lambda (system drive)(make-system (get-nombre-system system) drive (get-usuarios-system system) (get-ruta-system system)
                 (get-fecha-system system) (get-logeado-system system)(get-current-drive-system system))))

(define set-usuarios-system(lambda (system usuarios)(make-system (get-nombre-system system) (get-drive-system system) usuarios (get-ruta-system system)
                 (get-fecha-system system) (get-logeado-system system)(get-current-drive-system system))))

(define set-ruta-system(lambda (system ruta)(make-system (get-nombre-system system) (get-drive-system system) (get-usuarios-system system) ruta
                 (get-fecha-system system) (get-logeado-system system)(get-current-drive-system system))))

(define set-fecha-system(lambda (system fecha)(make-system (get-nombre-system system) (get-drive-system system) (get-usuarios-system system) (get-ruta-system system)
                 fecha (get-logeado-system system)(get-current-drive-system system))))

(define set-logeado(lambda (system user)(make-system (get-nombre-system system)(get-drive-system system)(get-usuarios-system system)(get-ruta-system system)
                 (get-fecha-system system)user(get-current-drive-system system))))
                 

(define set-current-drive(lambda (system current-drive)(make-system (get-nombre-system system)(get-drive-system system)(get-usuarios-system system)(get-ruta-system system)
                 (get-fecha-system system)(get-logeado-system system) current-drive)))







;RUN
;Dominio: Comando
;recorrido: Run comando
;Descripcion: Funcion que ejecuta comandos enviados al sistema.
(define run(lambda (system comando)(comando system)))





;add-drive
;Dominio: System
;recorrido: Sytem con un nuevo drive
;Descripcion: Funcion que ejecuta comandos enviados al sistema.
(define add-drive
  (lambda (system)
    (lambda (letra nombre capacidad)
      (if (not (member letra (map car (get-drive-system system))))
          (make-system (get-nombre-system system)
                       (cons (drive letra nombre capacidad) (get-drive-system system))
                       (get-usuarios-system system)
                       (if (null? (get-drive-system system))
                           (string-append (string letra)":/" (get-ruta-system system))
                           (get-ruta-system system))
                       (get-fecha-system system)
                       (get-logeado-system system)
                       (if(null? (get-current-drive-system system))
                          (list letra)
                          (get-current-drive-system system)))
          system))))



;add-user o Registro
;Dominio: Usuario
;recorrido: lista con usuarios
;Descripcion: Funcion para registrar o añadir usuarios a un systema, para posteriormente registrarse con ellos.
(define add-user
  (lambda (system)
    (lambda (name-user)
      (if (member name-user (map car (get-usuarios-system system)))
          system
          (make-system (get-nombre-system system)
                       (get-drive-system system)
                       (append (get-usuarios-system system) (list (make-user name-user)))
                       (get-ruta-system system)
                       (fecha-actual)
                       (get-logeado-system system)
                       (get-current-drive-system system))))))





;login
;Dominio: System X string
;recorrido: System con el usuario logeado
;Descripcion: Funcion para logear un usuario dentro del sistema


(define login
  (lambda (system)
    (lambda (name-user)
      (if (member name-user (map car (get-usuarios-system system)))
          (if (null? (get-logeado-system system))
              (set-logeado system name-user)
              system)
          system))))


;Logout
;Dominio: system
;recorrido: system sin ningun usuario logeado
;Descripcion: Funcion para "cerrar secion" o salir de un usuario que está en un sistema.

(define logout
  (lambda (system)
    (if (not (get-logeado-system system))
        system
        (set-logeado-path system '()))))

;Switch Drive
;Dominio: system
;recorrido: system sin ningun usuario logeado
;Descripcion: Funcion para "cerrar secion" o salir de un usuario que está en un sistema.

(define switch-drive
  (lambda (system)
    (lambda (drive)
      (if (drive-Lista? drive system)
          (if (not (null? (get-logeado-system system)))
              (make-system (get-nombre-system system)
                           (get-drive-system system)
                           (get-usuarios-system system)
                           (string-append (string drive)":/")
                           (get-fecha-system system)
                           (get-logeado-system system)
                           (currentdrive drive))
              
              (make-system (get-nombre-system system)
                           (get-drive-system system)
                           (get-usuarios-system system)
                           (get-ruta-system system)
                           (get-fecha-system system)
                           (get-logeado-system system)
                           (get-current-drive-system system)))
          
              (make-system (get-nombre-system system)
                           (get-drive-system system)
                           (get-usuarios-system system)
                           (get-ruta-system system)
                           (get-fecha-system system)
                           (get-logeado-system system)
                           (get-current-drive-system system))))))

;md (make directory)
;Dominio: system X name(string)
;recorrido: system con directorios creados dentro de drive
;Descripcion: Funcion que actualiza contenido de drive, creando nuevos directorios y guardandolos dentro de contenido.

(define md
  (lambda (system)
    (lambda(nombre)
      (set-drive-system system (SyMDrive system (string (car (get-current-drive-system system)))
                                         nombre)))))

;folder (otras funciones)
;Dominio: system X name(string)
;recorrido: folder
;Descripcion: Funcion que crea nuevos directorios
(define folder
  (lambda (system nombre)
      (let ((fecha (fecha-actual)))
        (make-folder nombre
                     null
                     fecha
                     fecha
                     (get-logeado-system system)
                     null
                     null
                     null
                     null
                     (get-ruta-system system)))))









;SyMDrive (otras funciones)
;Dominio: system X Letra drive X name(string)
;recorrido: lista con drives actualizados con nuevo contenido
;Descripcion: Funcion que crea nuevos directorios

(define SyMDrive
  (lambda (system letra nombre)
    (define buscador
      (lambda (drives lista)
        (if (null? drives)
            lista
            (if (equal? (string (get-letra-drive (car drives))) letra)
                (if (member nombre (map car(cadddr (car drives))))
                    (buscador (cdr drives) (append lista (list (car drives))))
                    (let ((new-drive (set-contenido-drive (folder system nombre) (car drives))))
                      (buscador (cdr drives) (append lista (list new-drive)))))
                (buscador (cdr drives) (append lista (list (car drives))))))))
    (buscador (cadr system) '())))






;cd (change directory) 
;Dominio: system X Letra drive X name(string)
;recorrido: system
;Descripcion: Funcion que crea nuevos directorios
(define cd
  (lambda (system)
    (lambda (nuevaruta)
      (if (not (null? (get-ruta-system system)))
          (if(equal? "/" nuevaruta)
             (set-ruta-system system (string-append (string (car(get-current-drive-system system))) ":/" ))
             (if(equal? ".." nuevaruta)
                (set-ruta-system system (cdpunto (get-ruta-system system)))
                (if (SyMDrive2 system (string (car (get-current-drive-system system))) nuevaruta)
                 (set-ruta-system system (string-append (get-ruta-system system) nuevaruta "/"))               
                  system)))          
          system))))


;format
;Dominio: system X Letra drive X name(string)
;recorrido: system
;Descripcion: Funcion que permite formatear una unidad.

(define format
  (lambda (system)
    (lambda (letra nombre)
      (make-system (get-nombre-system system) (buscarformat system letra nombre) (get-usuarios-system system) (string-append (string letra)":/")
                 (get-fecha-system system) (get-logeado-system system)(get-current-drive-system system)))))




;-----------------OTRAS-FUNCIONES-------------------;

(define (fecha-actual)(define fecha (current-date))
        (list (date-day fecha)
               (date-month fecha)
               (date-year fecha)
               (string-append (number->string (date-hour fecha))
                       ":"
                (number->string (date-minute fecha)))))
(define drive-Lista?
  (lambda(drive system)
    (member drive (map car(get-drive-system system))))) 


(define make-ruta
  (lambda (ruta)(list ruta)))

(define Ruta
  (lambda(system)
    ((string-append (string(car (get-current-drive-system system)))":/" (get-ruta-system system)))))

(define set-logeado-path(lambda (system user)(make-system (get-nombre-system system)(get-drive-system system)(get-usuarios-system system)
                  (string-append (string(car (get-current-drive-system system)))":/")
                 (get-fecha-system system)user(get-current-drive-system system))))


(define SyMDrive2
  (lambda (system letra nombre)
    (define buscador
      (lambda (drives lista)
        (if (null? drives)
            #f
            (if (equal? (string (get-letra-drive (car drives))) letra)
                (buscarfolder (cadddr(car drives)) nombre)                
                (buscador (cdr drives) (append lista (list (car drives))))))))
    (buscador (cadr system) '())))


(define buscarfolder
  (lambda (folders nombre )
    (if (null? folders)
        #f
        (let ((folder (car folders)))
          (if (equal? (get-nombre-folder folder) nombre)
              #t
              (buscarfolder (cdr folders) nombre))))))

(define cdpunto
  (lambda (string)
    (string-append(string-join (reverse(cdr(reverse(string-split string "/")))) "/")"/")))

(define stringprueba "C:/folder1/folder2")



(define buscarformat
  (lambda (system letra nombre)
    (define buscador
      (lambda (drives lista)
        (if (null? drives)
            lista
            (if (equal? (string (get-letra-drive (car drives))) (string letra))
                (append lista
                        (make-drive (get-letra-drive (car drives))
                                    nombre
                                    (get-capacidad-drive (car drives))
                                    '())
                        (cdr drives))
                (buscador (cdr drives) (append lista (car drives)))))))
    (buscador (cadr system) '())))






































