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

SELECT est.nombre, ent.archivo. ent.nota --se seleccionan las columnas cuyos datos se quieren obtener
FROM entregas as ent --se especifica el nombre de la tabla a la que corresponde la primer columna de la sentencia select
JOIN estudiantes as est --se declara el nombre de la tabla que se quiere conectar
    ON est.id = ent.estudiantes_id; --se define la primary key de la tabla incluida en el join con la clave foranea de la tabla incluida en el from. Es decir, se
--especifica separado por un signo de = la clave primaria y foranea que permiten la union entre ambas tablas.
--Opcional: definir alias en las tablas para hacer mas legible la tabla producida por la consulta.

Tipos de Join:
--Left join
SELECT *
FROM table1 as t1
   LEFT JOIN table2 as t2
       ON t1.id = t2.id;
--Right join:
SELECT *
FROM table1 as t1
   RIGHT JOIN table2 as t2
       ON t1.id = t2.id;
--Outer join:
SELECT *
 FROM tablat1 as t1
   FULL OUTER JOIN table2 as t2
       ON t1.id = t2.id;
--Inner join:
SELECT *
FROM tabla1 as t1
    INNER JOIN tabla2 as t2
       ON t1.id = t2.id;

Mostrar la direccion de cada tienda:
SELECT store.store_id, address.address AS address
FROM store
JOIN address
	ON store.address_id = address.address_id
GROUP BY store.store_id, address;

Mostrar una tabla con el nombre, apellido y direccion de cada cliente:
SELECT customer.first_name AS Name, customer.last_name AS Last_Name, address.address AS Address
FROM customers
LEFT JOIN address
	ON customer.address_id = address.address_id
GROUP BY Address;

¿Cual es el nombre y apellido del cliente que vive en la ciudad 'Apeldoorn'?
SELECT customer.first_name AS name, customer.last_name AS last_name
FROM customer
JOIN address
	ON customer.address_id = address.address_id
JOIN city
	ON address.city_id = city.city_id
WHERE city.city = 'Apeldoorn'
GROUP BY name, last_name;

¿Cual es la categoria de la pelicula 'Arabia Dogma'?
SELECT category.name AS category
FROM category
JOIN film_category
	ON category.category_id = film_category.category_id
JOIN film
	ON film.film_id = film_category.film_id
WHERE film.title = 'Arabia Dogma'
GROUP BY category;

¿Que actores (sus nombres y apellidos) participaron en la pelicula 'Interview Liaisons'?
SELECT actor.first_name AS nombre, actor.last_name AS apellido
FROM actor
JOIN film_actor
	ON actor.actor_id = film_actor.actor_id
JOIN film
	ON film.film_id = film_actor.film_id
WHERE film.title = 'Interview Liaisons'
GROUP BY nombre, apellido;

¿Cual es el nombre del miembro del staff que le rento una copia de la pelicula 'Hunchback Impossible' al cliente Kurt Emmons?
SELECT staff.first_name, staff.last_name
FROM staff
JOIN rental
	ON staff.staff_id = rental.staff_id
JOIN inventory 
	ON rental.inventory_id = inventory.inventory_id
JOIN film 
	ON inventory.film_id = film.film_id
JOIN customer 
	ON rental.customer_id = customer.customer_id
WHERE customer.first_name = 'Kurt' AND customer.last_name = 'Emmons' AND film.title = 'Hunchback Impossible';

Cantidad de veces que el cliente Vivian Ruiz rento peliculas:
SELECT COUNT(rental.rental_id) AS cantidad_rentas
FROM rental
JOIN customer
	ON rental.customer_id = customer.customer_id
WHERE customer.first_name = 'Vivian' AND customer.last_name = 'Ruiz';

Mostrar la cantidad de peliculas (items) disponibles en cada tienda:
SELECT store.store_id, COUNT(film.film_id)
FROM store
JOIN inventory
	ON store.store_id = inventory.store_id
JOIN film
	ON inventory.film_id = film.film_id
GROUP BY store.store_id;

Mostrar una tabla con todas las ciudades y su pais al lado:
SELECT city.city AS city, country.country AS country
FROM city
JOIN country
	ON city.country_id = country.country_id
GROUP BY city, country;

Mostrar una tabla con el nombre de los clientes y el monto total de sus pagos realizados en orden descendente:
SELECT customer.customer_id, customer.first_name AS Name, sum(payment.amount) AS Total
FROM customer
LEFT JOIN payment
    ON customer.customer_id = payment.customer_id
GROUP BY customer.customer_id, Name
ORDER BY Total DESC;

Mostrar una tabla con las categorias y la cantidad de peliculas para cada categoria:
SELECT category.name AS Category, COUNT(film_category.film_id) AS Films
FROM category
JOIN film_category
    ON category.category_id = film_category.category_id
GROUP BY Category;

Mostrar una tabla con el id del vendedor, su direccion y su primer nombre:
SELECT store.manager_staff_id AS Staff, address.address AS Address, staff.first_name AS Name
FROM store
JOIN address
    ON store.address_id = address.address_id
JOIN staff
    ON store.store_id = staff.store_id
GROUP BY Staff, Address, Name;

Mostrar una tabla con los nombres de las películas en las que actuó el actor Nick Walhberg:
SELECT film.title AS Title
FROM film
JOIN film_actor
    ON film.film_id = film_actor.film_id
JOIN actor
    ON actor.actor_id = film_actor.actor_id
WHERE actor.actor_id = 2;  --el id 2 corresponde al del actor Nick Walhberg, previamente obtenido con un SELECT

Mostrar una tabla con el id de cada alquiler, el id de la tienda y la direccion de la tienda donde se hizo ese alquiler:
SELECT rental.rental_id, store.store_id, address.address
FROM staff
JOIN rental
    ON staff.staff_id = rental.staff_id
JOIN store
    ON staff.staff_id = store.manager_staff_id
JOIN address
    ON store.address_id = address.address_id
GROUP BY rental.rental_id, store.store_id, address.address;

Buscar y mostrar la pelicula mas alquilada:
SELECT film.title AS Title, COUNT(rental.rental_id) AS Rentals
FROM film
JOIN inventory
    ON film.film_id = inventory.film_id
JOIN rental
    ON inventory.inventory_id = rental.inventory_id
GROUP BY Title
ORDER BY Rentals DESC
LIMIT 1;

Mostrar una tabla con el id de cada cliente mas la direccion y el id de la tienda a la que accedio:
SELECT customer.customer_id, address.address AS address, store.store_id
FROM customer
JOIN store
    ON store.store_id = customer.store_id
JOIN address
    ON address.address_id = store.address_id
GROUP BY customer.customer_id, address, store.store_id;

Obtener una tabla con las categorias de peliculas y la cantidad de veces que fueron rentadas peliculas de cada categoria. Agrupar por nombre de
categoria y ordenar por cantidad de rentas de mayor a menor:
SELECT category.name AS categoria, COUNT(rental.rental_id) AS cantidad_rentas
FROM category
JOIN film_category
	ON category.category_id = film_category.category_id
JOIN inventory
	ON film_category.film_id = inventory.film_id
JOIN rental
	ON inventory.inventory_id = rental.inventory_id
GROUP BY categoria
ORDER BY cantidad_rentas DESC;

Obtener una tabla con las categorias de peliculas y las ganancias de rentas de peliculas para cada categoria. Agrupar por nombre de categoria y 
ordenar por suma de ganancias en orden descendente:
SELECT category.name AS categoria, SUM(payment.amount) AS ganancias
FROM category
JOIN film_category
	ON category.category_id = film_category.category_id
JOIN inventory
	ON film_category.film_id = inventory.film_id
JOIN rental
	ON inventory.inventory_id = rental.inventory_id
JOIN payment
	ON rental.rental_id = payment.rental_id
GROUP BY categoria
ORDER BY ganancias DESC;

Obtener una tabla con el id de cliente, el id de la tienda y la cantidad de dinero gastado en cada tienda:
SELECT payment.customer_id, store.store_id, SUM(amount) AS amount
FROM payment
JOIN staff
	ON staff.staff_id = payment.staff_id
JOIN store
	ON store.store_id = staff.store_id
GROUP BY payment.customer_id, store.store_id
ORDER BY payment.customer_id DESC;

Obtener una tabla con la cantidad de clientes por pais:
SELECT country.country AS pais, COUNT(customer.customer_id) AS cantidad_clientes
FROM country
JOIN city
	ON country.country_id = city.country_id
JOIN address
	ON city.city_id = address.city_id
JOIN customer
	ON address.address_id = customer.address_id
GROUP BY pais
ORDER BY cantidad_clientes DESC;

Obtener una tabla con el nombre de cada cliente, la cantidad de rentas que realizo y la cantidad de dinero gastado. Agrupar por el nombre del cliente y ordenar por
cantidad de rentas:
SELECT customer.first_name AS name, customer.last_name AS last_name, COUNT(rental.rental_id) AS rentas, SUM(payment.amount) AS amount
FROM customer
JOIN rental
	ON customer.customer_id = rental.customer_id
JOIN payment
	ON rental.rental_id = payment.rental_id
GROUP BY name, last_name
ORDER BY rentas DESC;

Obtener cantidad de alquileres por tienda:
SELECT store.store_id AS tienda, COUNT(rental.rental_id) AS cantidad_rentas
FROM store
JOIN staff
	ON store.store_id = staff.store_id
JOIN rental
	ON staff.staff_id = rental.staff_id
GROUP BY tienda;

Obtener ganacias por tienda:
SELECT store.store_id AS tienda, SUM(payment.amount) AS ganancias
FROM store
JOIN staff
	ON store.store_id = staff.store_id
JOIN payment
	ON staff.staff_id = payment.staff_id
GROUP BY tienda;

Obtener la cantidad de clientes que visitaron cada tienda: 
SELECT store.store_id AS numero_tienda, COUNT(customer.customer_id) AS clientes
FROM store
JOIN customer
	ON store.store_id = customer.store_id
GROUP BY numero_tienda;

Obtener una tabla con el pais y la cantidad de clientes por pais, en orden descendente:
SELECT country.country AS pais, COUNT(customer.customer_id) AS cantidad_clientes
FROM country
JOIN city
	ON country.country_id = city.country_id
JOIN address
	ON city.city_id = address.city_id
JOIN customer
	ON address.address_id = customer.address_id
GROUP BY pais
ORDER BY cantidad_clientes DESC;
