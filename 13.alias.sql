Funcion para cambiar el nombre tanto de columnas como de tablas. Con el uso de los alias se simplifica la tarea a la hora de trabajar con muchas
tablas o columnas en consultas mas complejas.

SELECT nota, count(*) AS "Cantidad de alumnos"
FROM resultados
GROUP BY nota;
El resultado es una tabla de dos columnas con los diferentes valores de nota y al lado la cantidad de estudiantes que obtuvieron dicha nota.

SELECT nota, count(*) AS "Cantidad de Estudiantes"
FROM resultados AS "R" 
GROUP BY nota;  -la tabla resultados pasa a llamarse "R".
		
De esta forma la columna count que contenía la cantidad de estudiantes pasa a llamarse "Cantidad de estudiantes", y 
la tabla resultados se llamará solo "R". 