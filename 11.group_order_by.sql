Las funciones de agregacion son utilizadas para obtener, agrupar y ordenar datos de una tabla o tablas conforme a la forma en la que se desee visualizar los datos.
Sentencia GROUP BY: se utiliza para agrupar los datos en base a la columna especificada.
Sentencia ORDER BY: se utiliza para ordenar los datos consultados.
La estructura de una query utilizando ambas funciones es la siguiente:
SELECT ___
FROM ___
WHERE ___
GROUP BY ___ 
ORDER BY ___ ;

Alias: funcion para cambiar el nombre tanto de columnas como de tablas. Con el uso de los alias se simplifica la tarea a la hora de trabajar con muchas tablas o
columnas en consultas mas complejas.
SELECT nota, COUNT(*) AS Cantidad de alumnos
FROM resultados AS R  --la tabla resultados pasa a llamarse R
GROUP BY nota; --El resultado es una tabla de dos columnas con los diferentes valores de nota y al lado la cantidad de estudiantes que obtuvieron dicha nota.

Obtener una tabla con el identificador de cada actor junto con la cantidad de películas que protagonizo:
SELECT actor_id, COUNT(film_id) AS cantidad
FROM film_actor
GROUP BY actor_id
ORDER BY cantidad DESC; --se ordenan las filas en orden descendente de cantidad de peliculas

Obtener una tabla con el identificador de cada cliente junto con la cantidad de alquileres que hizo:
SELECT customer_id, COUNT(rental_id) AS alquileres
FROM rental
GROUP BY customer_id
ORDER BY alquileres DESC;  --se ordenan las filas en base a la cantidad de alquileres, en orden descendente.

Obtener una tabla con los id de categorias de peliculas y la cantidad de películas con esa categoria:
SELECT category_id, COUNT(film_id) AS cantidad
FROM film_category
GROUP BY category_id
ORDER BY cantidad ASC;  --se ordenan las filas en base a la cantidad de peliculas, en orden ascendente.

Obtener una tabla con las edades de los estudiantes y el promedio de notas por edad:
SELECT edad, AVG(nota) AS promedio_nota
FROM estudiantes
GROUP BY edad;
ORDER BY promedio_nota ASC;

Obtener todos los datos de la tabla usuarios agrupados por el id_usuario y ordenar las filas en base al valor de la columna edad en orden descendente:
SELECT *
FROM usuarios
GROUP BY id_usuario
ORDER BY edad DESC;
