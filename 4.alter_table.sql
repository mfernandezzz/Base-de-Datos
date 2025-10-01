La sentencia ALTER TABLE permite modificar una tabla con el objetivo de agregar, modificar o eliminar columnas de una tabla.
Tambien puede ser usado para eliminar varias restricciones (constraint) a una tabla existente.

Sintaxis:
ALTER TABLE nombreTabla ADD COLUMN nombreColumna tipodeDato;
ALTER TABLE nombreTabla ADD CONSTRAINT nombre_de_la_restriccion FOREIGN KEY (nombre_columna) REFERENCES tabla(id);

Ejemplo de uso de la sentencia ALTER TABLE para modificar una tabla, agregarle una columna y asignarle una restriccion.
ALTER TABLE film ADD COLUMN director_id INT;
ALTER TABLE film ADD CONSTRAINT fk_film_director FOREIGN KEY(director_id) REFERENCES director(director_id);

Cambiar el tipo de dato de una columna en una tabla 
ALTER TABLE cars
ALTER COLUMN year type VARCHAR(4);  -si el tipo de dato era int, ahora pasara a ser varchar

ALTER TABLE cars

ADD color VARCHAR(50);
