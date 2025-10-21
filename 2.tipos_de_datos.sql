Las Bases de Datos (SQL: Structured Query Languaje) es un conjunto de datos pertenecientes a un mismo contexto y almacenados sistematicamente para su
posterior uso. En las bases de datos se guardara información la cual podra ser usada posteriormente; pero para ello deberá ser guardada como un dato de forma
ordenada y estructurada.
  
Para trabajar con una Base de Datos, se debe tener instalado tanto el motor (PostgreSQL) como el administrador de la misma (pgAdmin).
  
Las Bases de Datos estan compuestas de tablas relacionadas entre si. Cada tabla contiene datos acerca de algo. Las tablas se relacionan mediante columnas de
identificacion, cuyo objetivo es almacenar los id necesarios para, por ejemplo, identificar de forma unica a una persona para asi vincularla con otro dato
de otra tabla.

En las Bases de Datos se pueden almacenar diferentes tipos de datos: 
Datos de texto (nombres, apellidos)
Datos numericos (edad, estatura) 
Datos de fecha (dia de registro, dia de nacimiento)
Datos booleanos (valores true o false)

VARCHAR: significa 'varying character' y permite almacenar un dato de texto determinando su largo de caracteres. 
nombre VARCHAR(50)
email VARCHAR(50)

TEXT: se determina que el contenido de un dato sera un texto.
descripcion_producto TEXT
descripcion_pelicula TEXT

INT: permite agregar numeros enteros como dato.
edad INT

REAL: permite agregar numeros decimales.
precio REAL

DATE: permite agregar fechas en formato YYYY-MM-DD
fecha DATE 2024-04-19

DATETIME: permite almacenar una fecha y la hora.
fecha DATETIME 2024-05-20 11:45:10

BOOLEAN: tipos de datos que solo almacenaran dos valores, verdadero o falso.
email_validation BOOLEAN TRUE
curso_terminado BOOLEAN FALSE

SERIAL: sirve para crear identificadores secuenciales en las tablas de datos, es decir, se generara un numero por cada fila en la tabla desde el uno 
hasta el final.
ID SERIAL

SMALLINT: es una variacion de INT, la diferencia es que se utiliza para almacenar numeros mas pequeños, admitiendo un numero maximo de 32768.

BIGINT: variacion de INT que permite almacenar numeros muy grandes.

La existencia de ambos se debe a que, dependiendo el caso, se optara por uno en base al tamaño de la base de datos con el objetivo de no utilizar mas
espacio de memoria del necesario.

