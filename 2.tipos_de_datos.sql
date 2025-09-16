VARCHAR: significa 'varying character' y permite almacenar un dato de texto determinando su largo de caracteres. 
nombre VARCHAR(20)  -el nombre del dato, la sentencia y la cantidad de caracteres.
email VARCHAR(30)

TEXT: se determina que el contenido de un dato sera un texto.
descripcion_producto TEXT
descripcion_pelicula TEXT

INT: permite agregar numeros enteros como dato.
edad INT(25)  -se le asigna a edad el dato 25.

REAL: permite agregar numeros decimales.
precio REAL(12.5)

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