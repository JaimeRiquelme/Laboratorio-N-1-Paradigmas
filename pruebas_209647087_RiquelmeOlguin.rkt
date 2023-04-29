#lang racket/base
(require racket/string)
(require "TDA_System_20964708_RiquelmeOlguin.rkt")
(require "TDA_Folder_20964708_RiquelmeOlguin.rkt")
(require "TDA_Drive_20964708_RiquelmeOlguin.rkt")
(require "TDA_User_20964708_RiquelmeOlguin.rkt")
(require "TDA_File_20964708_RiquelmeOlguin.rkt")

;creando un sistema
(define S0 (system "newSystem"))

;añadiendo unidades. Incluye caso S2 que intenta añadir unidad con una letra que ya existe
(define S1 ((run S0 add-drive) #\C "SO" 1000))
(define S2 ((run S1 add-drive) #\C "SO1" 3000))
(define S3 ((run S2 add-drive) #\D "Util" 2000))
;añadiendo usuarios. Incluye caso S6 que intenta registrar usuario duplicado
(define S4 ((run S3 register) "user1"))
(define S5 ((run S4 register) "user1"))
(define S6 ((run S5 register) "user2"))
;iniciando sesión con usuarios. Incluye caso S8 que intenta iniciar sesión con user2 sin antes haber salido con user1
(define S7 ((run S6 login) "user1"))
(define S8 ((run S7 login) "user2"))
;cerrando sesión user1 e iniciando con user2
(define S9 (run S8 logout))
(define S10 ((run S9 login) "user2"))
;cambios de unidad, incluyendo unidad inexistente K
(define S11 ((run S10 switch-drive) #\K))
(define S12 ((run S11 switch-drive) #\C))
;añadiendo carpetas. Incluye casos de carpetas duplicadas.
(define S13 ((run S12 md) "folder1"))
(define S14 ((run S13 md) "folder2"))
(define S15 ((run S14 md) "folder2"))
(define S16 ((run S15 md) "folder3"))
;ingresa a carpeta folder2
(define S17 ((run S16 cd) "folder2"))
;crea subcarpeta folder21 dentro de folder2 (incluye caso S19 de carpeta con nombre duplicado)
(define S18 ((run S17 md) "folder21"))
(define S19 ((run S18 md) "folder21"))
;ingresa a subcarpeta e intenta ingresar a subcarpeta inexistente S21
(define S20 ((run S19 cd) "folder21"))
(define S21 ((run S20 cd) "folder22"))
;vuelve a carpeta anterior
(define S22 ((run S21 cd) ".."))
;vuelve a ingresar folder21
(define S23 ((run S22 cd) "folder21"))
;crea subcarpeta folder211 e ingresa
(define S24 ((run S23 md) "folder211"))
(define S25 ((run S24 cd) "folder211"))
;vuelve a la raíz de la unidad c:/
(define S26 ((run S25 cd) "/"))
;se cambia de unidad
(define S27 ((run S26 switch-drive) #\D))
;crea carpeta e ingresa a carpeta
(define S28 ((run S27 md) "folder5"))
(define S29 ((run S28 cd) "folder5"))
;se cambia de carpeta en base a la ruta especificada
(define S30 ((run S29 cd) "C:/folder1/"))
;formateando drive D:
(define S31 ((run S30 format) #\D "newD"))
;añadiendo archivos
(define S32 ((run S31 add-file) (file "foo1.txt" "txt" "hello world 1")))
(define S33 ((run S32 add-file) (file "foo2.txt" "txt" "hello world 2")))
(define S34 ((run S33 add-file) (file "foo3.docx" "docx" "hello world 3")))
(define S35 ((run S34 add-file) (file "goo4.docx" "docx" "hello world 4" #\h #\r)))
;eliminando archivos
(define S36 ((run S35 del) "*.txt"))
(define S37 ((run S35 del) "f*.docx"))
(define S38 ((run S35 del) "goo4.docx"))
(define S39 ((run S35 cd) ".."))
(define S40 ((run S35 del) "folder1"))
;borrando una carpeta
(define S41 ((run S39 rd) "folder1"))  ;no debería borrarla, pues tiene archivos
(define S42 ((run S41 cd) "folder1"))
(define S43 ((run S42 del) "*.*"))
(define S44 ((run S43 cd) ".."))
(define S45 ((run S44 rd) "folder1"))
;copiando carpetas y archivos
(define S46 ((run S35 copy) "foo1.txt" "c:/folder3/"))
(define S47 ((run S46 cd) ".."))
(define S48 ((run S47 copy) "folder1" "d:/"))
;moviendo carpetas y archivos
(define S49 ((run S48 move) "folder3" "d:/"))
(define S50 ((run S49 cd) "folder1"))
(define S51 ((run S50 move) "foo3.docx" "d:/folder3/"))
;renombrando carpetas y archivos
(define S52 ((run S51 ren) "foo1.txt" "newFoo1.txt"))
(define S53 ((run S52 ren) "foo2.txt" "newFoo1.txt")) ;no debería efectuar cambios pues ya existe archivo con este nombre
(define S54 ((run S53 cd) ".."))
(define S55 ((run S54 ren) "folder1" "newFolder1"))
;listando la información
(display (run S16 dir))
(display (run S55 dir))

;(display ((run S55 dir) "/s"))
#|;muestra carpetas y subcarpetas de la unidad C
(display ((run S55 dir) "/s /a")) ;muestra todo el contenido de carpetas y subcarpetas de la unidad C incluyendo archivo oculto goo4.docx

;encriptando archivos y carpetas
(define S56 ((run S55 encrypt) plus-one minus-one "1234" "newFolder1"))
(define S57 ((run S56 switch-drive) \#D))
(define S58 ((run S57 cd) "folder3"))
(define S59 ((run S58 encrypt) plus-one minus-one "4321" "foo3.docx"))

;desencriptando archivos y carpetas
(define S60 ((run S59 decrypt) "1234" "foo3.docx")) ;no logra desencriptar por clave incorrecta
(define S61 ((run S60 decrypt) "4321" "foo3.docx"))
(define S62 ((run S61 switch-drive) \#C))
(define S63 ((run S62 decrypt) "1234" "newFolder1"))

;;buscando contenido
(define S64 ((run S63 cd) "newFolder1"))
(display ((run S64 grep) "hello" "newFoo1.txt"))
(display ((run S64 grep) "hello" "*.*"))

;viendo la papelera
(display (run S45 viewTrash))

;restaurando
(define S65 ((run S45 restore) "folder1"))|#



;--------------------------------- Scrip de prueba adicional--------------------------------------------------------------




(define S0a (system 123));se intenta crear un sistema de nombre 123 (int), este no es un nombre correcto por lo cual no crea un sistema
(define S0b (system #\C));se intenta crear un sistema de nombre #\C (char), este no es un nombre correcto por lo cual no crea un sistema
(define S0c (system "123")); se crea un sistema de nombre "123" (string) creandolo sin problemas.


(define S3a ((run S3 add-drive) #\f "Drive1" 10000000));creando un drive con letra en minuscula -> lo crea en mayuscula respectando que no sea case sensitive
(define S3b ((run S3 add-drive) 123 "hola" 2));no deberia crear ya que se pasa un int en vez de un char
(define S3c ((run S3 add-drive) "letra" "Drive2" #\C));no deberia crear, se pasa un string en vez de un char, además de un char donde deberia tener un int

(define S6a ((run S6 register) #\c)); intenta crear un usuario ingresando un char, no deberia crearlo.
(define S6b ((run S6 register) "USER1"));intenta crear un usuario ingresando el nombre en mayuscula respetando que no sea case sensitive. no deberia registrarlo, ya que ya existe user1
(define S6c ((run S6 register) 12345)); intenta crear un usuario con numeros, en este caso es un int. no deberia crearlo.

(define S8a ((run S6 login) "user4"));intenta ingresar con un usuario inexistente.
(define S8b ((run S6 login) #\C));intenta ingresar, ingresando con un char.
(define S8c ((run S6 login) "USER1")); ingresa con un usuario en mayusculas.

(define S10a (run S10 logout));realiza un logout
(define S10b (run S10a logout));realiza un segundo logout despues del anterior sin errores.
(define S10c ((run S10b login) "UsEr2")); se logea user 2 ingresandolo con variantes entre mayuscula y minuscula.
(define S10d (run S10c logout));realiza un tercer logout despues del anterior sin errores.

(define S12a ((run S12 switch-drive) #\d));cambia a la unidad D ingresando la letra de la unidad en minuscula.
(define S12b ((run S12 switch-drive) "hola"));Intenta cambiar a una unidad que no existe, además que es un string y no un char.
(define S12c ((run S12 switch-drive) #\p));Intenta cambiar a una unidad inexistente, además de ingresada en minuscula.

(define S16a ((run S16 md) #\C));intenta crear una carpeta con nombre char
(define S16b ((run S16 md) "FoLdEr1"));intenta crear una carpeta que ya existe, probando el case sensitive. no deberia crearla
(define S16c ((run S16 md) 12345)); intenta crear una carpeta ingresando un entero en vez de un nombre valido.
(define S16d ((run S16 md) "FoLdEr4"));crea una carpeta respetando que esta misma se cree en mayusculas.
(define S16e ((run S16 cd) "folder2"));entra a folder2
(define S16f ((run S16e md) "folder2"));crea una carpeta con el mismo nombre que su ubicacion (folder2), se crea folder2 dentro de folder2, lo cual el sistema lo admite.


(define S26a ((run S26 cd) "/")); se utiliza el "/" ya estando en la raiz.
(define S26b ((run S26 cd) ".."));intenta realizar un .. estando en la raiz. no deberia de actuar y seguir en la raiz.
(define S26c ((run S26 cd) "FoLdEr2"));ingresa a folder 2 verificando que el sistema no es case sensitive.
(define S26d ((run S26 cd) 12345));intenta ingresar un int, en vez de una ruta o un nombre.
(define S26e ((run S26 cd) #\C));intenta ingresar un char, en vez de una ruta o un nombre.

(define S31a ((run S30 format) "D" "newD"));intenta formatear la unidad "D", pero no se puede ya que se debe ingresar el char.
(define S31b ((run S30 format) #\D "NEWD2"));formatea por segunda vez la unidad D.
(define S31c ((run S30 format) #\C #\D));intenta formatear la unidad C, ingresando erroneamente un nombre.

(define S35a ((run S35 add-file) (file "file4.docx" "docx" "hello world 4" #\h )));crea un folder con solamente el atributo de seguridad #\h, además de ingresando el nombre en minuscula.
(define S35b ((run S35 add-file) (file 123456 "docx" "hello world 4" )));intenta crear un folder con nombre invalido ya que recibe un int.
(define S35c ((run S35 add-file) (file "file5.txt" "txt" 12345 )));intenta crear un folder con contenido invalido.
(define S35d ((run S35 add-file) (file "ArChIvo6.txt" "txt" "contenido" #\r )));crea un archivo con mayuscula y minuscula para probar el case sensitive, además solo se agrega el atributo #\r
(define S35e ((run S35 add-file) (file "FOO2.txt" "txt" "contenido" )));intenta crear un archivo con el nombre ya existente. además de este en mayuscula.

(define S40a ((run S40 del) "folder1"));Se intenta eliminar un folder que no existe, por lo cual no añade nada a papelera.
(define S40b ((run S40 del) "FoLdEr2"));Se elimina la carpeta folder2 , ingresando el nombre comprobando el case sensitive.
(define S40c ((run S40 del) #\C));se ingresa un drive como nombre a eliminar, como no es un nombre de folder o file, este no realiza ningun cambio.
(define S40d ((run S40 cd) "/"));vuelve a la raiz
(define S40e ((run S40 del) "*.*"));elimina todo el contenido del drive posicionado. (no es un format ya que no se actualiza el nombre)

(define S45a ((run S45 rd) "folder1"));intento de eliminar un archivo inexistente, no realiza ningun cambio ya que este no existe.
(define S45b ((run S45 rd) #\C));intento de eliminar un archivo de nombre char, no realiza ningun cambio ya que se debe ingresar un nombre valido.
(define S45c ((run S40 cd) "C:/FOLDER2/FOLDER21/"))
(define S45d ((run S45 rd) "FoLdEr211"));se elimina la carpeta Folder221, contenida dentro de folder21, ingresando el nombre en mayuscula y minuscula para probar el case sensitive.

(define S48a ((run S35 copy) "foo12.txt" "c:/folder3/"));se intenta copiar una carpeta inexistente.
(define S48b ((run S48a copy) "foo1.txt" "c:/"));se copia un file en la raiz C.
(define S48c ((run S48b copy) "foo1.txt" "folder3"));se intenta copiar un file, ingresando un nombre en la direccion en vez de una ruta especifica.
(define S48e ((run S48c copy) 12345 "d:/"));se ingresa un nombre erroneo en este caso un int, en lugar de un string que deberia ser el nombre del archivo a copiar.

(define S51a ((run S51 move) "foo3.docx" "d:/folder3/"));se intenta mover nuevamente el archivo a la ruta especificada, en esta instancia el archivo ya no existe en la ruta actual, por lo cual no deberia mover nada.
(define S51b ((run S51a move) "ARRCHIVO4.docx" "d:/"));se intenta mover un archivo inexistente a la direccion de la raiz de D.
(define S51c ((run S51b move) #\C "d:/"));se ingresa un char en lugar del nombre del archivo a mover, este no deberia realizar ningun cambio.
(define S51d ((run S51c move) "foo3.docx" "folder2")); se ingresa el nombre de un folder en lugar de la ruta destino. no deberia realizar cambios.

(define S55a ((run S55 ren) "folder65" "newFolder1"));se intenta renombrar un archivo que no existe.
(define S55b ((run S55a switch-drive) #\d));cambiamos de drive
(define S55c ((run S55b ren) "FoLdEr1" "newFolder1D"));renombramos el folder1 de la unidad D.
(define S55d ((run S55c ren) #\c "newFolder1")); se intenta renombrar ingresando un nombre erroneo. no realiza cambios.
(define S55e ((run S55d cd) "fOlDer3"));ingreso a folder3 unidad D.
(define S55f ((run S55e ren) "fOo3.doCX" "newFile3"));se renombra foo3 que lo contiene folder3.
(define S55g ((run S55f ren) "newFile3" 12345));se intenta modificar newFile3 ingresando un nombre invalido. no realiza cambios.













(define listaa '('("FOLDER3" () (27 4 2023 "18:12") (27 4 2023 "18:12") "USER2" () () () () "C:/")
    '("FOLDER2" () (27 4 2023 "18:12") (27 4 2023 "18:12") "USER2" () () () () "C:/")
     '("FOLDER1" () (27 4 2023 "18:12") (27 4 2023 "18:12") "USER2" () () () () "C:/")))



(define drives (cadr(cadr S17)))






