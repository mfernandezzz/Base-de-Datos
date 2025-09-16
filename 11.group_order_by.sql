Las funciones de agregacion son utilizadas para obtener, agrupar y ordenar datos de una tabla o tablas conforme a la forma en la que se desee 
visualizar los datos.

Sentencia GROUP BY: se utiliza para agrupar los datos en base a la columna especificada. Su estructura es:
SELECT ___
FROM ___
WHERE ___
GROUP BY ___ ;

El siguiente ejemplo de group by mostrara una tabla compuesta por una columna con todos los valores de nota que se tenga registro (puede ser 1 a 12) y 
otra columna con la cantidad de veces que se obtuvo dicha nota: 
SELECT nota, COUNT(*)
FROM estudiantes
GROUP BY nota;

Obtener una tabla con el identificador de cada actor junto con la cantidad de películas que protagonizo:
SELECT COUNT(film_id)
FROM film_actor
GROUP BY actor_id;

Obtener una tabla con el identificador de cada cliente junto con la cantidad de alquileres que hizo:
SELECT COUNT(rental_id)
FROM rental
GROUP BY customer_id;

Obtener una tabla con el identificador de cada categoria junto con la cantidad de películas con esa categoria:
SELECT COUNT(film_id)
FROM film_category
GROUP BY category_id;

Obtener una tabla con las edades de los estudiantes y el promedio de notas por edad:
SELECT edad, AVG(nota)
FROM ESTUDIANTES
GROUP BY edad;


Sentencia ORDER BY: se utiliza para ordenar los datos consultados. Su estructura es la siguiente:
SELECT ___
FROM ___
WHERE ___
GROUP BY ___ 
ORDER BY ___ ;

Obtener una tabla con todas las notas obtenidas junto con la cantidad, en orden descendente:
SELECT nota, COUNT(*)
FROM estudiantes
GROUP BY nota
ORDER BY nota DESC;

Obtener el dato de la pelicula con la duracion de renta mas larga:
SELECT max(rental_duration)
FROM film
GROUP BY rental_duration
ORDER BY rental_duration DESC;

Obtener el conteo de las notas obtenidas por los estudiantes en orden ascendente:
SELECT nota, COUNT(*)
FROM estudiantes
GROUP BY nota
ORDER BY nota ASC;

Obtener una tabla con los cursos ordenados en forma descendente basado en el promedio de notas:
SELECT avg(nota)
FROM resultados 
GROUP BY id_curso 
ORDER BY id_curso DESC; -probar

Obtener la cantidad de notas por curso y ordenar los cursos por su id en orden descendente:
SELECT count(nota)
FROM resultados
GROUP BY id_curso
ORDER BY id_curso DESC;  -cantidad de notas por curso.

Obtener todos los datos de la tabla usuarios agrupados por el id_usuario y ordenar las filas en base al valor de la columna edad en orden descendente:
SELECT *
FROM usuarios
GROUP BY id
ORDER BY edad DESC;