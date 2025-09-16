Los diferentes tipos de join son las sentencias o funciones que permite consultar datos de varias tablas a la vez. Significa "unir en" y determina que 
tablas deben unirse a la query y como deben hacerlo. 

Estructura de una query con join:
SELECT ___
FROM ___
JOIN ___
    ON ___
WHERE ___
GROUP BY ___
ORDER BY ___
LIMIT ___;

SELECT estudiantes.nombre, entregas.archivo, entregas.nota
FROM entregas
JOIN estudiantes
    ON estudiantes.id = entregas.estudiantes_id;

1_ Seleccionar las columnas cuyos datos se quieren Obtener
2_ En el from se especifica la tabla a la que corresponden las columnas anteriores
3_ En el join se declara el nombre de la tabla que se quiere conectar
4_ En el on se define la primary key de la tabla incluida en el join con la clave foranea de la tabla incluida en el from. Es decir, se especifica
separado por un signo de = la clave primaria y foranea que permiten la union entre ambas tablas.
5_ Opcional: definir alias en las tablas para hacer mas legible la tabla producida por la consulta.

Consulta usando join y alias:
SELECT est.nombre, ent.archivo. ent.nota
FROM entregas as "ent"
JOIN estudiantes as "est"
    ON est.id = ent.estudiantes_id;

Left join:
SELECT *
FROM table1 as t1
   LEFT JOIN table2 as t2
       ON t1.id = t2.id;

Right join:
SELECT *
FROM table1 as t1
   RIGHT JOIN table2 as t2
       ON t1.id = t2.id;

Outer Join:
SELECT *
 FROM tablat1 as t1
   FULL OUTER JOIN table2 as t2
       ON t1.id = t2.id;

INNER JOIN:
SELECT *
FROM tabla1 as t1
    INNER JOIN tabla2 as t2
       ON t1.id = t2.id;

Mostrar una tabla con los nombres de los usuarios y el nombre del curso donde esta inscripto cada alumno:
SELECT usuarios.nombre, apellido, cursos.nombre_curso 
	FROM usuarios
	LEFT JOIN alumnos ON usuarios.id = alumnos.id_usuarios
		LEFT JOIN cursos ON cursos.id = alumnos.id_cursos;

Mostrar una tabla con el nombre, apellido y direccion de cada cliente:
SELECT customer.first_name, last_name, address.address
FROM customers
LEFT JOIN address
	ON customer.address_id = address.address_id;

Mostrar una tabla con la direccion y el id de la tienda a la que corresponde la misma:
SELECT address.address, store.store_id
FROM address
RIGHT JOIN store
	ON address.address_id = store.store_id;

Mostrar una tabla con todas las ciudades y su pais al lado.
SELECT city.city, country.country
FROM country
FULL OUTER JOIN city
    ON city.country_id = country.country_id;

Mostrar una tabla con las peliculas que tengan asociadas algun director y el nombre de dicho director:
SELECT film.title, director.first_name, last_name
FROM film
INNER JOIN director
    ON director.director_id = film.director_id;

Mostrar una tabla con el nombre de los clientes y el monto total de sus pagos realizados en orden descendente:
SELECT customer.customer_id, customer.first_name, sum(payment.amount)
FROM customer
LEFT JOIN payment
    ON customer.customer_id = payment.customer_id
GROUP BY customer.customer_id, customer.first_name
ORDER BY sum DESC;

Mostrar una tabla con las categorias y la cantidad de peliculas para cada categoria:
SELECT category.name, count(film_category.film_id)
FROM category
LEFT JOIN film_category
    ON category.category_id = film_category.category_id
GROUP BY category.name;

Mostrar una tabla con el id del vendedor, su direccion y su primer nombre:
SELECT store.manager_staff_id, address.address, staff.first_name
FROM store
LEFT JOIN address
    ON store.address_id = address.address_id
FULL OUTER JOIN staff
    ON store.store_id = staff.store_id
GROUP BY store.manager_staff_id, address.address, staff.first_name;

Mostrar una tabla con los nombres de las películas en las que actuó el actor Nick Walhberg:
SELECT film.title, actor.first_name, last_name
FROM film
INNER JOIN film_actor
    ON film.film_id = film_actor.film_id
INNER JOIN actor
    ON actor.actor_id = film_actor.actor_id
WHERE actor.actor_id = 2;

Mostrar una tabla con el id de cada alquiler, el id de la tienda y la direccion de la tienda donde se hizo ese alquiler:
SELECT rental.rental_id, store.store_id, address.address
FROM staff
FULL OUTER JOIN rental
    ON staff.staff_id = rental.staff_id
FULL OUTER JOIN store
    ON staff.staff_id = store.manager_staff_id
LEFT JOIN address
    ON store.address_id = address.address_id;

Buscar y mostrar la pelicula mas alquilada:
SELECT film.title, count(rental.rental_id)
FROM film
FULL OUTER JOIN inventory
    ON film.film_id = inventory.film_id
FULL OUTER JOIN rental
    ON inventory.inventory_id = rental.inventory_id
GROUP BY film.title
ORDER BY count(rental.rental_id) DESC
LIMIT 1;

Mostrar una tabla con el id de cada cliente mas la direccion y el id de la tienda a la que accedio:
SELECT customer.customer_id, address.address, store.store_id
FROM customer
INNER JOIN store
    ON store.store_id = customer.store_id
INNER JOIN address
    ON address.address_id = store.address_id
GROUP BY customer.customer_id, address.address, store.store_id
ORDER BY customer.customer_id DESC;
