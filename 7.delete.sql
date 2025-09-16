La sentencia DELETE permite borrar informacion de las tablas.

Eliminar todas las filas de una tabla
DELETE from ESTUDIANTES;

Eliminar una fila de una tabla si contiene los datos especificados
DELETE from director 
    WHERE first_name='Clint' and last_name='Almodóvar';  -se elimina una fila de una tabla si contiene los datos especificados

Eliminar una fila de una tabla en base a su id
DELETE FROM director
    WHERE director_id = 5;

Eliminar una columna de una tabla
ALTER TABLE cars
DROP column year;

Eliminar todos los resultados si una columna contiene el dato especificado
DELETE FROM cars
WHERE brand = 'volvo';

Asi como una tabla puede ser creada tambien puede ser eliminada.
DROP TABLE videoujuegos; 

