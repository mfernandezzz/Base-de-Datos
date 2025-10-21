La sentencia DELETE permite borrar informacion de una tabla.

DELETE FROM ESTUDIANTES;  --elimina todas las filas de una tabla

DELETE FROM director 
WHERE first_name='Clint' and last_name='Almodóvar';  --eliminar una fila de una tabla si contiene los datos especificados

ALTER TABLE cars
DROP COLUMN year;  --se elimina la coumna year de la tabla cars

DELETE FROM cars
WHERE brand = 'volvo';  --se eliminan todas las filas de la tabla donde la columna brand tenga el valor 'Volvo'

DROP TABLE videoujuegos;  --se elimina la tabla videojuegos

--Eliminar una fila de una tabla en base a su id (mala practica):
--DELETE FROM director
--WHERE director_id = 5;
