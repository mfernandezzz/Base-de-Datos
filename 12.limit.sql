Con la palabra clave limit se puede indicar la cantidad de filas que se quiere consultar. Esto es util para optimizar la velocidad de una consulta y 
visualizar asi solo las filas de datos necesarias, teniendo en cuenta que una tabla en una base de datos grande pueden llegar a tener miles de filas. 
La estructura de una query usando limit es la siguiente:
SELECT ___
FROM ___
WHERE ___
GROUP BY ___
ORDER BY ___
LIMIT ___;

Seleccionar todos los datos de la tabla estudiantes y limitar las filas a 5:
SELECT * 
FROM estudiantes 
LIMIT 5;

Seleccionar todos los datos del ultimo estudiante adherido a la tabla estudiantes:
SELECT * 
FROM estudiantes 
ORDER BY id DESC 
LIMIT 1;

Obtener todos los datos de la tabla payment, ordenar las filas por el valor de la columna payment_date descendente y limitar los resultados a 5
(ultimos cinco pagos realizados):
SELECT * 
FROM payment 
ORDER BY payment_date DESC 
LIMIT 5;

Obtener todos los datos de la tabla payment, ordenar las filas por orden descendente y limitar los resultados a diez (los diez pagos mas grandes
realizados):
SELECT * 
FROM payment 
ORDER BY amount DESC 
LIMIT 10;

Obtener todos los datos de la tabla customer, ordenar por ultima fecha de modificacion de sus datos descendente y limitar los resultados a 3
(los ultimos tres usuario modificados):
SELECT * 
FROM customer 
ORDER BY last_update DESC 
LIMIT 3;

Obtener todos los datos de la tabla customer, agrupar por customer_id, ordenar por el valor de la columna create_date descendente y limitar los
resultados a 1 (el primer usuario añadido a la tabla customer):
SELECT *
FROM customer
GROUP BY customer_id
ORDER BY create_date DESC
LIMIT 1;

Obtener el dato del pago mas grande realizado:
SELECT *
FROM payment
GROUP BY payment_id
ORDER BY amount DESC
LIMIT 1;