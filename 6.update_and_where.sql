La propiedad UPDATE puede ser utilizado tanto para modificar algún dato como agregar informacion nueva a una tabla, especificando su nombre. Con SET 
se establece el nombre de la columna y su respectivo valor. Con WHERE se puede indicar el id para identificar la fila correcta donde se modificara 
dicho valor.

UPDATE estudiantes
SET color_favorito='naranja'
WHERE id=2;

UPDATE usuarios
SET edad=20
WHERE id=2;

UPDATE estudiantes
SET color_favorito='naranja'
WHERE nombre='Punku' AND apellido='Nose'; 
Se puede utilizar el operador condicional AND para identificar la fila donde se va a modificar un dato en base al valor de dos columnas. 

UPDATE estudiantes
SET color_favorito='naranja'
WHERE nombre='Punku' OR apellido='Diaz';  
En este caso se utiliza el operador condicional OR para indicar que se quiere modificar el valor de una columna en aquellas filas donde la columna
nombre y apellido tengan los valores correspondientes. Esto permite cambiar el dato de una columna para muchas filas de datos.

UPDATE store
SET address_id = '6'
WHERE store_id = '1';

Se puede modificar el valor a mas de una columna.
Si se omite la clausula WHERE, todas las filas de la tabla veran cambiado el dato introducido.

Modificar la tabla cars el valor de la columna color por 'blue' y año por 1970 donde la columna brand sea 'Toyota'.
UPDATE cars
SET color = 'blue', year = 1970
WHERE brand = 'Toyota';

Asignar el modelo bronco a todos los elementos que tengan la marca 'Toyota'
UPDATE cars
SET model = 'Bronco'
WHERE brand = 'Toyota';
