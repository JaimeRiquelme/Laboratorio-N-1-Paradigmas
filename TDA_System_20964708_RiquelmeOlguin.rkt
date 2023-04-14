#lang racket/base
(require racket/date)
(require racket/string)

(require "TDA_Drive_20964708_RiquelmeOlguin.rkt")
(require "TDA_User_20964708_RiquelmeOlguin.rkt")
(require "TDA_Folder_20964708_RiquelmeOlguin.rkt")

(provide (all-defined-out))


;Nombre de la función: make-system
;Dominio: string X list X list X string X list X user X list
;Recorrido: system
;Descripción: Esta función toma un nombre de sistema nombre, una lista de drives drive, una lista de usuarios usuarios,
; una ruta actual de sistema ruta, la fecha actual fecha-actual, el usuario logeado en el sistema logeado y la letra de unidad
;actual current-drive. Retorna una lista que representa un sistema con la información proporcionada.
(define (make-system nombre drive usuarios ruta fecha-actual logeado current-drive)
  (list nombre drive usuarios ruta fecha-actual logeado current-drive))


;Nombre de la función: system
;Dominio: nombre (string)
;Recorrido: system
;Descripción: Esta función toma un nombre como argumento y devuelve un sistema vacío con ese nombre.
; El sistema vacío no tiene drives, usuarios, ruta actual, fecha actual, usuario logeado o unidad de drive actual.
(define (system nombre)
  (make-system nombre '() '() "" (fecha-actual) '() null ))
;Nombre de la función: get-nombre-system
;Dominio: system
;Recorrido: system
;Descripción: Esta función toma un sistema system como argumento y devuelve el nombre del sistema.

(define get-nombre-system (lambda (system) (car system)))

;Nombre del selector: get-drive-system
;Dominio: system
;Recorrido: lista de drives
;Descripción: Esta función toma un sistema system como argumento y devuelve la lista de drives del sistema.

(define get-drive-system (lambda (system) (cadr system)))

;Nombre del selector: get-usuarios-system
;Dominio: system
;Recorrido: lista de usuarios
;Descripción: Esta función toma un sistema system como argumento y devuelve la lista de usuarios del sistema.

(define get-usuarios-system (lambda (system) (caddr system)))

;Nombre del selector: get-ruta-system
;Dominio: system
;Recorrido: ruta actual del sistema
;Descripción: Esta función toma un sistema system como argumento y devuelve la ruta actual del sistema.

(define get-ruta-system (lambda(system)(cadddr(reverse system))))

;Nombre del selector: get-fecha-system
;Dominio: system
;Recorrido: fecha actual del sistema
;Descripción: Esta función toma un sistema system como argumento y devuelve la fecha actual del sistema.

(define get-fecha-system (lambda (system) (caddr (reverse system))))

;Nombre del selector: get-logeado-system
;Dominio: system
;Recorrido: usuario logeado en el sistema
;Descripción: Esta función toma un sistema system como argumento y devuelve el usuario logeado en el sistema.

(define get-logeado-system (lambda(system)(cadr(reverse system))))

;Nombre del selector: get-current-drive-system
;Dominio: system
;Recorrido: letra de unidad actual del sistema
;Descripción: Esta función toma un sistema system como argumento y devuelve la letra de unidad actual del sistema.

(define get-current-drive-system (lambda (system)(car(reverse system))))

;Nombre del modificador: set-nombre-system
;Dominio: system-nombre, nombre
;Recorrido: system-nombre
;Descripción: Esta función toma dos argumentos, un sistema system-nombre y un nombre. Devuelve un nuevo sistema con el mismo drive-system, usuarios-system,
;ruta-system, fecha-system, logeado-system y current-drive-system que system-nombre, pero con el nombre cambiado a nombre.

(define set-nombre-system (lambda (system-nombre nombre)(make-system nombre (get-drive-system system-nombre) (get-usuarios-system system-nombre)
                 (get-ruta-system system-nombre) (get-fecha-system system-nombre) (get-logeado-system system-nombre)(get-current-drive-system system))))

;Nombre del modificador: set-drive-system
;Dominio: system y drive
;Recorrido: system y drive
;Descripción: Esta función toma un sistema system y un drive drive como argumentos, y devuelve un nuevo sistema que tiene la lista de unidades actualizada.

(define set-drive-system(lambda (system drive)(make-system (get-nombre-system system) drive (get-usuarios-system system) (get-ruta-system system)
                 (get-fecha-system system) (get-logeado-system system)(get-current-drive-system system))))

;Nombre del modificador: set-usuarios-system
;Dominio: system
;Recorrido: system
;Descripción: Esta función toma un sistema system y una lista de usuarios como argumentos, y devuelve un nuevo sistema con la lista de usuarios actualizada.

(define set-usuarios-system(lambda (system usuarios)(make-system (get-nombre-system system) (get-drive-system system) usuarios (get-ruta-system system)
                 (get-fecha-system system) (get-logeado-system system)(get-current-drive-system system))))

;Nombre del modificador: set-ruta-system
;Dominio: system
;Recorrido: system
;Descripción: Esta función toma un sistema system y una ruta como argumentos y devuelve un nuevo sistema con la ruta actualizada.

(define set-ruta-system(lambda (system ruta)(make-system (get-nombre-system system) (get-drive-system system) (get-usuarios-system system) ruta
                 (get-fecha-system system) (get-logeado-system system)(get-current-drive-system system))))

;Nombre del modificador: set-fecha-system
;Dominio: system
;Recorrido: fecha actual del sistema
;Descripción: Esta función toma un sistema system y una fecha como argumentos, y devuelve un nuevo sistema con la fecha actualizada.
;La función accede a la fecha actual del sistema mediante el selector get-fecha-system y reemplaza su valor por el nuevo valor pasado como argumento.

(define set-fecha-system(lambda (system fecha)(make-system (get-nombre-system system) (get-drive-system system) (get-usuarios-system system) (get-ruta-system system)
                 fecha (get-logeado-system system)(get-current-drive-system system))))

(define set-logeado(lambda (system user)(make-system (get-nombre-system system)(get-drive-system system)(get-usuarios-system system)(get-ruta-system system)
                 (get-fecha-system system)user(get-current-drive-system system))))
                 

(define set-current-drive(lambda (system current-drive)(make-system (get-nombre-system system)(get-drive-system system)(get-usuarios-system system)(get-ruta-system system)
                 (get-fecha-system system)(get-logeado-system system) current-drive)))







;Nombre de la función: run
;Dominio: sistema X comando
;Recorrido: resultado del comando aplicado al sistema
;Descripción: Esta función toma un sistema system y un comando como argumentos.
; El comando debe ser una función que toma el sistema como argumento y devuelve un resultado.
; La función run aplica el comando al sistema y devuelve el resultado obtenido.
(define run(lambda (system comando)(comando system)))





;Nombre de la función: add-drive
;Dominio: sistema X letra (string) X nombre (string) X capacidad (number)
;Recorrido: sistema actualizado con la unidad de disco añadida
;Descripción: Esta función toma un sistema system, una letra de unidad letra, un nombre nombre y una capacidad capacidad como argumentos.
; Si la letra de unidad letra no está en la lista de unidades de disco del sistema system, la función crea una nueva unidad de disco con la letra letra, el nombre nombre y la capacidad capacidad.
; Luego, actualiza la lista de unidades de disco del sistema system con la nueva unidad de disco y devuelve el sistema actualizado. Si la letra de unidad ya existe, devuelve el sistema sin modificar.
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



; add-user
; Dominio: system X name-user (string)
; Recorrido: system
; Descripción: Función para agregar un nuevo usuario al sistema. Toma un sistema system y un nombre de usuario name-user como argumentos.
; Si el nombre de usuario ya existe en el sistema, devuelve el mismo sistema sin cambios.
; Si el nombre de usuario no existe en el sistema, crea un nuevo usuario con el nombre especificado y lo agrega a la lista de usuarios del sistema.
; Devuelve el sistema actualizado con el nuevo usuario agregado.
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





;Nombre de la función: login
;Dominio: system X nombre de usuario (string)
;Recorrido: usuarios del sistema
;Recursión: no utiliza recursión
;Descripción: Esta función toma un sistema system y un nombre de usuario name-user como argumentos.
; Si el nombre de usuario se encuentra en la lista de usuarios del sistema, la función verifica si el usuario ya se ha logeado previamente.
; Si el usuario no se ha logeado previamente, la función llama a la función set-logeado para establecerlo como usuario logeado y devuelve el sistema actualizado.
; Si el usuario ya se ha logeado previamente, la función devuelve el sistema sin modificar. Si el nombre de usuario no se encuentra en la lista de usuarios del sistema, la función devuelve el sistema sin modificar.


(define login
  (lambda (system)
    (lambda (name-user)
      (if (member name-user (map car (get-usuarios-system system)))
          (if (null? (get-logeado-system system))
              (set-logeado system name-user)
              system)
          system))))


;Nombre de la función: logout
;Dominio: system
;Recorrido: system
;Descripción: Esta función toma un sistema system como argumento y verifica si hay algún usuario logeado en el sistema.
; Si hay un usuario logeado, entonces llama a la función set-logeado-path con el argumento de una lista vacía.
; Si no hay ningún usuario logeado, devuelve el sistema sin cambios.

(define logout
  (lambda (system)
    (if (not (get-logeado-system system))
        system
        (set-logeado-path system '()))))

;Nombre de la función: switch-drive
;Dominio: system X drive (string)
;Recorrido: system
;Descripción: Esta función toma un sistema system y una letra de unidad drive como argumentos.
; Verifica si la letra de unidad existe en la lista de drives del sistema utilizando la función drive-Lista?
; Si existe, verifica si hay un usuario logeado en el sistema utilizando la función get-logeado-system.
; Si hay un usuario logeado, llama a la función make-system para crear un nuevo sistema con la letra de unidad actualizada, la ruta cambiada a la raíz de la nueva unidad, el usuario logeado y el valor de la unidad actualizado utilizando la función currentdrive.
; Si no hay un usuario logeado, llama a la función make-system para crear un nuevo sistema con la letra de unidad actualizada y los otros valores del sistema sin cambios.
; Si la letra de unidad no existe, devuelve el sistema sin cambios.

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

;Nombre de la función: md (make directory)
;Dominio: system X name (string)
;Recorrido: system
;Descripción: Esta función toma un sistema system y un nombre nombre como argumentos,
;             crea un nuevo directorio con el nombre proporcionado nombre en el directorio actual del usuario en el sistema
;             y devuelve el sistema actualizado con los nuevos drives.

(define md
  (lambda (system)
    (lambda(nombre)
      (set-drive-system system (SyMDrive system (string (car (get-current-drive-system system)))
                                         nombre)))))

;Nombre de la función: folder
;Dominio: system X name (string)
;Recorrido: folder
;Descripción: Esta función toma un sistema system y un nombre nombre como argumentos, crea una nueva carpeta con el nombre
;proporcionado nombre en la ruta actual del usuario en el sistema, y devuelve la carpeta recién creada.
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












;Nombre de la función: add-file
;Dominio: system X filecreado
;Recorrido: Lista de drives actualizada
;Descripción: Esta función toma un sistema system y un archivo filecreado como argumentos.
; Utiliza la función anónima SyMDrive3 para buscar la unidad correspondiente al archivo y actualizar la lista de drives.
; Devuelve la lista de drives actualizada con el archivo agregado.
(define add-file
  (lambda (system)
    (lambda (filecreado)
      (set-drive-system system (SyMDrive3 system filecreado )))))








;Nombre de la función: cd
;Dominio: system X nuevaruta
;Recorrido: sistema actualizado
;Recursión: ninguna
;Descripción: Esta función toma un sistema system y una nueva ruta nuevaruta como argumentos.
; Si la ruta actual no está vacía, la función evalúa la nueva ruta y la actualiza en el sistema en consecuencia.
; Si la nueva ruta es "/" (la raíz del sistema), la función actualiza la ruta con la letra de la unidad actual.
; Si la nueva ruta es ".." (regresar un nivel en el sistema), la función utiliza la función cdpunto para actualizar la ruta.
; Si la nueva ruta es una ruta válida, la función actualiza la unidad de disco actual y la ruta del sistema en consecuencia.
; Si la nueva ruta no es válida, la función intenta actualizar la unidad de disco actual utilizando la función anónima SyMDrive2.
; La función devuelve el sistema actualizado con la ruta y la unidad de disco actualizadas.
(define cd
  (lambda (system)
    (lambda (nuevaruta)
      (if (not (null? (get-ruta-system system)))
             (if(equal? "/" nuevaruta)
                (set-ruta-system system (string-append (string (car(get-current-drive-system system))) ":/" ))
                (if(equal? ".." nuevaruta)
                   (set-ruta-system system (cdpunto (get-ruta-system system)))
                   (if(ispath? system nuevaruta)
                      (make-system (get-nombre-system system) (get-drive-system system) (get-usuarios-system system) nuevaruta
                                   (get-fecha-system system) (get-logeado-system system)(string-ref (car (string-split nuevaruta ":"))0))
                      (if (SyMDrive2 system (string (car (get-current-drive-system system))) nuevaruta)
                          (set-ruta-system system (string-append (get-ruta-system system) nuevaruta "/"))               
                       system))))          
          system))))

;Nombre de la función: format
;Dominio: system X letra X nombre
;Recorrido: sistema actualizado
;Recursión: ninguna
;Descripción: Esta función toma un sistema system, una letra de unidad letra y un nombre de unidad nombre como argumentos.
; Utiliza la función buscarformat para buscar la unidad correspondiente al formato solicitado y actualizar el sistema en consecuencia.
; La función devuelve el sistema actualizado con la unidad de disco formateada.

(define format
  (lambda (system)
    (lambda (letra nombre)
      (make-system (get-nombre-system system) (buscarformat system letra nombre) (get-usuarios-system system) (get-ruta-system system)
                 (get-fecha-system system) (get-logeado-system system)(get-current-drive-system system)))))






;-----------------OTRAS-FUNCIONES-------------------;
;Nombre de la función: file
;Dominio: system X nombre X extensión X contenido X seguridad (opcional)
;Recorrido: archivo creado
;Recursión: ninguna
;Descripción: Esta función toma un nombre de archivo nombre, una extensión de archivo extensión, un contenido de archivo contenido y una seguridad opcional seguridad como argumentos.
; Utiliza la función make-folder para crear un archivo con los parámetros entregados.
; La función devuelve el archivo creado.
(define file
  (lambda (nombre extencion contenido . seguridad)
      (let ((fecha (fecha-actual)))
        (make-folder nombre
                     extencion
                     contenido
                     fecha
                     fecha
                     null
                     null
                     null
                     seguridad                   
                     null))))

;Nombre de la función: ispath?
;Dominio: system X ruta
;Recorrido: booleano (verdadero o falso)
;Recursión: ninguna
;Descripción: Esta función toma un sistema system y una ruta ruta como argumentos.
; Utiliza la función get-drive-system para obtener la lista de unidades de disco en el sistema y compara la primera parte de la ruta con los nombres de las unidades de disco.
; La función devuelve verdadero si la ruta es una ruta válida en el sistema y falso en caso contrario.

(define ispath?
  (lambda (system path)
      (if (member (car (string-split path ":")) (map string (map car (get-drive-system system))))
          #t
          #f)))

;Nombre de la función: fecha-actual
;Dominio: ningún argumento
;Recorrido: lista de fecha y hora actual
;Recursión: ninguna
;Descripción: Esta función no toma argumentos y devuelve la fecha y hora actuales como una lista con el siguiente formato:
; (día mes año hora:minuto). La hora y el minuto se presentan como una cadena de dos dígitos separados por dos puntos.

(define (fecha-actual)(define fecha (current-date))
        (list (date-day fecha)
               (date-month fecha)
               (date-year fecha)
               (string-append (number->string (date-hour fecha))
                       ":"
                (number->string (date-minute fecha)))))

;Nombre de la función: drive-Lista?
;Dominio: unidad de disco X sistema
;Recorrido: booleano (verdadero o falso)
;Recursión: ninguna
;Descripción: Esta función toma una unidad de disco drive y un sistema system como argumentos.
; Utiliza la función get-drive-system para obtener la lista de unidades de disco en el sistema y busca la unidad drive en la lista.
; La función devuelve verdadero si la unidad drive está presente en la lista y falso en caso contrario.
(define drive-Lista?
  (lambda(drive system)
    (member drive (map car(get-drive-system system))))) 




;Nombre de la función: set-logeado-path
;Dominio: sistema X usuario
;Recorrido: sistema actualizado con el usuario logueado
;Recursión: ninguna
;Descripción: Esta función toma un sistema system y un usuario logueado user como argumentos.
; Utiliza la función get-current-drive-system para obtener la unidad de disco actual en el sistema, y utiliza string-append para construir una ruta que comienza con la letra de la unidad de disco y termina con un slash.
; Luego utiliza la función make-system para crear un nuevo sistema con la misma información que system, pero con la ruta actualizada con la ruta construida anteriormente y el usuario logueado actualizado con user.
; La función devuelve el sistema actualizado.

(define set-logeado-path(lambda (system user)(make-system (get-nombre-system system)(get-drive-system system)(get-usuarios-system system)
                  (string-append (string(car (get-current-drive-system system)))":/")
                 (get-fecha-system system)user(get-current-drive-system system))))


;Nombre de la función: SyMDrive
;Dominio: system X letra (string) X nombre (string)
;Recorrido: lista de drives
;recursion: recursion de cola
;Descripción: Esta función toma un sistema system, una letra de unidad letra y un nombre de carpeta nombre como argumentos.
; Busca la letra de unidad letra en la lista de drives del sistema y si la encuentra, busca si ya existe una carpeta con el nombre nombre en la unidad correspondiente.
; Si existe, devuelve la lista de drives sin modificar.
; Si no existe, crea una nueva carpeta con el nombre nombre y actualiza la unidad correspondiente con la nueva carpeta.
; Devuelve la lista de drives actualizada.


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

;Nombre de la función: SyMDrive2
;Dominio: sistema X letra de unidad (cadena de caracteres) X nombre de carpeta (cadena de caracteres)
;Recorrido: Carpeta correspondiente si existe, falso en caso contrario
;Recursión: ninguna
;Descripción: Esta función toma un sistema system, una letra de unidad de disco letra y un nombre de carpeta nombre como argumentos.
; Utiliza la función get-drive-system para obtener la lista de unidades de disco en el sistema y busca la unidad correspondiente a la letra letra.
; Si encuentra la unidad de disco, busca la carpeta correspondiente al nombre nombre en la lista de carpetas de la unidad de disco utilizando la función buscarfolder.
; La función devuelve la carpeta correspondiente si existe, y falso en caso contrario.

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


;Nombre de la función: buscarfolder
;Dominio: lista de folders X nombre (cadena de caracteres)
;Recorrido: valor booleano (true/false)
;Descripción: Esta función toma una lista de folders folders y un nombre de carpeta nombre como argumentos.
; Utiliza recursión para buscar en la lista de folders la carpeta con el nombre especificado.
; Si se encuentra la carpeta, la función devuelve true, de lo contrario devuelve false.
(define buscarfolder
  (lambda (folders nombre )
    (if (null? folders)
        #f
        (let ((folder (car folders)))
          (if (equal? (get-nombre-folder folder) nombre)
              #t
              (buscarfolder (cdr folders) nombre))))))


;Nombre de la función: cdpunto
;Dominio: ruta (cadena de caracteres)
;Recorrido: ruta actualizada a la ruta anterior (subiendo un nivel)
;Recursión: ninguna
;Descripción: Esta función toma una ruta en formato de cadena de caracteres string como argumento.
; Utiliza la función string-split para separar la ruta por las barras diagonales y obtiene una lista de las partes de la ruta.
; Utiliza reverse para invertir el orden de la lista, elimina el último elemento (que corresponde al nombre del directorio actual) utilizando cdr, y vuelve a invertir la lista y la convierte en una cadena de caracteres utilizando string-join.
; Finalmente, utiliza string-append para agregar una barra diagonal al final de la ruta y devuelve la ruta actualizada a la ruta anterior (subiendo un nivel).
(define cdpunto
  (lambda (string)
    (string-append(string-join (reverse(cdr(reverse(string-split string "/")))) "/")"/")))



;Nombre de la función: buscarformat
;Dominio: sistema X letra de unidad (cadena de caracteres) X nombre de carpeta (cadena de caracteres)
;Recorrido: lista de unidades de disco con la unidad correspondiente actualizada
;Recursión: recursión de cola
;Descripción: Esta función toma un sistema system, una letra de unidad de disco letra y un nombre de carpeta nombre como argumentos.
; Utiliza la función get-drive-system para obtener la lista de unidades de disco en el sistema y busca la unidad correspondiente a la letra letra.
; Si encuentra la unidad de disco, utiliza cons para agregar una nueva unidad de disco con el nombre nombre y sin contenido a la lista de unidades de disco.
; La función devuelve la lista de unidades de disco con la unidad correspondiente actualizada.
; Utiliza la recursión de cola para buscar la unidad correspondiente.

(define buscarformat
  (lambda (system letra nombre)
    (define buscador
      (lambda (drives lista)
        (if (null? drives)
            lista
            (if (equal? (string (get-letra-drive (car drives))) (string letra))
                (buscador (cdr drives)
                          (cons (make-drive (get-letra-drive (car drives))
                                            nombre
                                            (get-capacidad-drive (car drives))
                                            '())
                                lista))
                (buscador (cdr drives) (cons (car drives) lista))))))
    (buscador (cadr system) '())))


;Nombre de la función: carpetactual
;Dominio: sistema
;Recorrido: cadena de caracteres que representa el nombre de la carpeta actual
;Descripción: Esta función toma un sistema system como argumento y utiliza get-ruta-system para obtener la ruta actual del sistema.
; Luego, utiliza string-split para dividir la ruta en una lista de cadenas de caracteres separadas por "/".
; Finalmente, utiliza car y reverse para obtener el último elemento de la lista que representa el nombre de la carpeta actual.
; La función devuelve una cadena de caracteres que representa el nombre de la carpeta actual.

(define carpetactual
  (lambda (system)
    (let ((ruta (get-ruta-system system)))
      (car (reverse (string-split (list->string (string->list ruta)) "/"))))))


;Nombre de la función: esactual?
;Dominio: sistema X nombre (cadena de caracteres)
;Recorrido: valor booleano (true/false)
;Descripción: Esta función toma un sistema system y un nombre de carpeta nombre como argumentos.
; Utiliza la función carpetactual para obtener el nombre de la carpeta actual del sistema y compara este nombre con el nombre proporcionado.
; La función devuelve true si el nombre proporcionado coincide con el nombre de la carpeta actual y false en caso contrario.
(define esactual?
  (lambda(system nombre)(equal?(carpetactual system)nombre)))



;Nombre de la función: SyMDrive3
;Dominio: system X filecreado
;Recorrido: lista de drives
;Recursión: Recursión de cola
;Descripción: Esta función toma un sistema system y un archivo filecreado como argumentos.
; Utiliza una función anónima buscador para buscar la letra de unidad correspondiente al archivo en la lista de drives del sistema y actualizar la lista de drives.
; La función utiliza una recursión de cola para buscar la letra de unidad y actualizar la lista de drives.
; Devuelve la lista de drives actualizada con el archivo agregado.
(define SyMDrive3
  (lambda (system filecreado)
    (define buscador
      (lambda (drives lista)
        (if (null? drives)
            lista
            (if (equal? (string (get-letra-drive (car drives))) (string(get-current-drive-system system)))
                (buscador (cdr drives) (append lista (list (set-contenido-drive2 (SyMFolder system filecreado (car drives)) (car drives)))))
                (buscador (cdr drives) (append lista (list (car drives))))))))
    (buscador (cadr system) '())))


;Nombre de la función: SyMFolder
;Dominio: system X filecreado X drive
;Recorrido: lista de carpetas
;Recursión: Recursión de cola
;Descripción: Esta función toma un sistema system, un archivo filecreado y una unidad de disco drive como argumentos.
; Utiliza la función anónima buscar para buscar la carpeta actual en el sistema y actualizar su contenido con el archivo filecreado.
; La función utiliza una recursión de cola para buscar la carpeta actual y actualizar su contenido.
; Devuelve la lista de carpetas actualizada con el archivo filecreado agregado.

(define SyMFolder
  (lambda(system filecreado drive)
    (define buscar
      (lambda(folders lista)
        (if(null? folders)
           lista
           (if(equal? (get-nombre-folder(car folders))(carpetactual system))
                 (buscar (cdr folders)(append lista(list(set-contenido-folder (car folders) filecreado))))
                 (buscar (cdr folders)(append lista(list(car folders))))))))
    (buscar (get-contenido-drive drive) '())))


;funcion que recibe un nombre o un path, retorna o el nombre de la carpeta o el nombre de la carpeta ultima de la direccion path.
(define rdcarpeta
  (lambda (system)
    (lambda (nombrecarpeta)
      (if(ispath? system nombrecarpeta)
         (car(reverse(string-split nombrecarpeta "/")))
         nombrecarpeta))))




























