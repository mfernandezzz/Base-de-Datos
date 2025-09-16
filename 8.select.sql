La sentencia SELECT se utiliza para consultar datos de una tabla o tablas. A esta sentencia se le pueden aplicar diferentes operadores logicos para
poder consultar datos mas especificos. 

Seleccionar los datos de la columna nombre y apellido de la tabla estudiantes:
SELECT nombre, apellido
FROM estudiantes;

Seleccionar los datos de la columna nombre y apellido de la tabla estudiantes donde el valor de la columna color_fav sea 'azul':
SELECT nombre, apellido
FROM estudiantes
WHERE color_favorito = 'azul';

Seleccionar todos los datos de una tabla:
SELECT *
FROM estudiantes;

Seleccionar todos los datos de la tabla usuarios donde el valor de la columna id sea 3 o el valor de la columna nombre sea 'Javier':
SELECT *
FROM usuarios
WHERE id=3 OR nombre = 'Javier';

Seleccionar todos los datos de la tabla usuarios donde el valor de la columna nombre sea 'Fernando' y la columna apellido sea 'Villa':
SELECT *
FROM usuarios
WHERE nombre = 'Fernando' AND apellido = 'Villa';

Seleccionar todos los datos de la tabla usuarios donde el valor de la columna edad sea mayor a 20:
SELECT *
FROM usuarios
WHERE edad > 20;

Seleccionar todos los datos de todos los usuarios donde el valor de la columna edad sea menor a 30:
SELECT *
FROM usuarios
WHERE edad < 30;

Seleccionar los datos de la columna film_id de la tabla film_actor donde el valor de la columna actor_id sea 16:
SELECT film_id
FROM film_actor
WHERE actor_id = 16;

Seleccionar los datos de la columna first_name de la tabla staff donde el valor de la columna store_id sea 2:
SELECT first_name
FROM staff
WHERE store_id = 2;

Seleccionar todos los datos de la tabla cars donde el valor de la columna año sea menor a 1970:
SELECT * FROM cars
WHERE year < 1970;

Seleccionar todos los datos de la tabla cars donde el valor de la columna model empiece con la letra 'M';
SELECT * FROM cars
WHERE model like 'M%';

Seleccionar todos los datos de la tabla cars donde el valor de la columna model empiece con la letra 'd' (no se respetan las mayusculas).
SELECT * FROM cars
WHERE model ilike '%d';

Seleccionar todos los datos de la tabla cars donde el valor de la columna brand sea 'Ford' o 'Volvo':
SELECT * FROM cars
WHERE brand = 'Ford' OR brand = 'Volvo';

Seleccionar todos los datos de la tabla cars donde el valor de la columna año este entre 1970 y 1980:
SELECT * FROM cars
WHERE year BETWEEN 1970 AND 1980;

Seleccionar todos los datos de la tabla customers donde el valor de la columna customer_name incluya la letra 'a':
SELECT * customers
WHERE customer_name like '%a%';

Seleccionar todos los datos de la tabla customers donde el valor de la columna country sea 'Norway', 'Sweden', 'Denmark': 
SELECT * customers
WHERE country IN ('Norway', 'Sweden', 'Denmark');

Selecciona todos los datos de la tabla customers donde el valor de la columna country no sea 'Norway', 'Sweden', 'Denmark':
SELECT * customers
WHERE country NOT IN ('Norway', 'Sweden', 'Denmark');

Seleccionar todos los datos de la tabla cars donde el valor de la columna brand sea 'Ford' y el valor de la columna año sea mayor a 1970:
SELECT * FROM cars
WHERE brand = 'Ford' AND year > 1970;

Seleccionar el valor o valores de la columna direction_id de la tabla direcciones donde el codigo postal sea el especificado:
SELECT address_id
FROM address
WHERE postal_code = '35200';

Contar la cantidad de filas de una tabla:
SELECT COUNT(id_estudiante) FROM estudiantes;

Contar todas las filas que tengan una edad asignada:
SELECT COUNT(edad) FROM estudiantes;

Cuando no se especifica que columna se va a contar, se contaran todas las filas que tengan un dato.
SELECT COUNT(*) FROM estudiantes;

Contar la cantidad de alumnos que cursa la materia con id 5:
SELECT COUNT(id_usuario)
FROM alumnos
WHERE id_cursos = 5;

En base a los valores de nota obtenidos por los estudiantes, devolver el dato de promedio de las notas obtenidas:
SELECT AVG(nota)
FROM estudiantes;

Obtener el dato de la maxima nota obtenida:
SELECT MAX(nota) FROM resultados;

Obtener el dato de la minima nota obtenida en el curso con id 3:
SELECT MIN(nota) 
FROM estudiantes 
WHERE id_curso = 3;

Obtener la suma de los valores de una columna precios:
SELECT SUM(precios) FROM productos;

Extraer el dato de la cantidad de alquileres realizados en un año y mes especifico:
SELECT COUNT(*) 
FROM rental 
WHERE EXTRACT (YEAR FROM rental_date) = 2005 AND EXTRACT (MONTH FROM rental_date) = 05;

Seleccionar la cantidad de rentas que se han realizado en total entre todas las tiendas:
SELECT COUNT(rental_id)
FROM rental;