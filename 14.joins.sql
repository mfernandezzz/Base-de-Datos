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

1_ Seleccionar las columnas cuyos datos se quieren obtener.
2_ En el from se especifica la tabla a la que corresponden las columnas anteriores.
3_ En el join se declara el nombre de la tabla que se quiere conectar.
4_ En el on se define la primary key de la tabla incluida en el join con la clave foranea de la tabla incluida en el from. Es decir, se especifica
separado por un signo de = la clave primaria y foranea que permiten la union entre ambas tablas.
5_ Opcional: definir alias en las tablas para hacer mas legible la tabla producida por la consulta.

Consulta usando join y alias:
SELECT est.nombre, ent.archivo. ent.nota
FROM entregas as ent
JOIN estudiantes as est
    ON est.id = ent.estudiantes_id;

--Tipos de Join:
--Left join:
SELECT *
FROM table1 as t1
   LEFT JOIN table2 as t2
       ON t1.id = t2.id;

--Right join:
SELECT *
FROM table1 as t1
   RIGHT JOIN table2 as t2
       ON t1.id = t2.id;

--Outer Join:
SELECT *
 FROM tablat1 as t1
   FULL OUTER JOIN table2 as t2
       ON t1.id = t2.id;

--Inner Join:
SELECT *
FROM tabla1 as t1
    INNER JOIN tabla2 as t2
       ON t1.id = t2.id;


Mostrar una tabla con el nombre, apellido y direccion de cada cliente:
SELECT customer.first_name AS Name, customer.last_name AS Last_Name, address.address AS Address
FROM customers
LEFT JOIN address
	ON customer.address_id = address.address_id
GROUP BY Address;

Mostrar una tabla con la direccion y el id de la tienda a la que corresponde la misma:
SELECT address.address, store.store_id
FROM address
RIGHT JOIN store
	ON address.address_id = store.store_id
GROUP BY store.store_id;

Mostrar una tabla con todas las ciudades y su pais al lado.
SELECT city.city AS City, country.country AS Country
FROM country
FULL OUTER JOIN city
    ON city.country_id = country.country_id
GROUP BY City;

Mostrar una tabla con las peliculas que tengan asociadas algun director y el nombre de dicho director:
SELECT film.title AS Title, director.first_name, director.last_name
FROM film
INNER JOIN director
    ON director.director_id = film.director_id
GROUP BY Title;

Mostrar una tabla con el nombre de los clientes y el monto total de sus pagos realizados en orden descendente:
SELECT customer.customer_id, customer.first_name AS Name, sum(payment.amount) AS Total
FROM customer
LEFT JOIN payment
    ON customer.customer_id = payment.customer_id
GROUP BY customer.customer_id, Name
ORDER BY Total DESC;

Mostrar una tabla con las categorias y la cantidad de peliculas para cada categoria:
SELECT category.name AS Category, count(film_category.film_id) AS Films
FROM category
LEFT JOIN film_category
    ON category.category_id = film_category.category_id
GROUP BY Category;

Mostrar una tabla con el id del vendedor, su direccion y su primer nombre:
SELECT store.manager_staff_id AS Staff, address.address AS Address, staff.first_name AS Name
FROM store
LEFT JOIN address
    ON store.address_id = address.address_id
FULL OUTER JOIN staff
    ON store.store_id = staff.store_id
GROUP BY Staff, Address, Name;

Mostrar una tabla con los nombres de las películas en las que actuó el actor Nick Walhberg:
SELECT film.title AS Title
FROM film
INNER JOIN film_actor
    ON film.film_id = film_actor.film_id
INNER JOIN actor
    ON actor.actor_id = film_actor.actor_id
WHERE actor.actor_id = 2;  --el id 2 corresponde al del actor Nick Walhberg, previamente obtenido con un SELECT

Mostrar una tabla con el id de cada alquiler, el id de la tienda y la direccion de la tienda donde se hizo ese alquiler:
SELECT rental.rental_id, store.store_id, address.address
FROM staff
FULL OUTER JOIN rental
    ON staff.staff_id = rental.staff_id
FULL OUTER JOIN store
    ON staff.staff_id = store.manager_staff_id
LEFT JOIN address
    ON store.address_id = address.address_id
GROUP BY rental.rental_id, store.store_id, address.address;

Buscar y mostrar la pelicula mas alquilada:
SELECT film.title AS Title, count(rental.rental_id) AS Rentals
FROM film
FULL OUTER JOIN inventory
    ON film.film_id = inventory.film_id
FULL OUTER JOIN rental
    ON inventory.inventory_id = rental.inventory_id
GROUP BY Title
ORDER BY Rentals DESC
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

Obtener una tabla con las categorias de peliculas y la cantidad de veces que fueron rentadas peliculas de cada categoria. Agrupar por nombre de
categoria y ordenar por cantidad de rentas de mayor a menor.
SELECT category.name AS categoria, count(rental.rental_id) AS cantidad_rentas
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
ordenar por suma de ganancias en orden descendente.
SELECT category.name as categoria, sum(payment.amount) as ganancias
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

Obtener una tabla con el id de cliente, el id de la tienda y la cantidad de dinero gastado en cada tienda.
SELECT payment.customer_id, store.store_id, sum(amount)
FROM payment
JOIN staff
	ON staff.staff_id = payment.staff_id
JOIN store
	ON store.store_id = staff.store_id
GROUP BY payment.customer_id, store.store_id
ORDER BY payment.customer_id DESC;

Obtener una tabla con la cantidad de clientes por pais.
SELECT country.country as pais, count(customer.customer_id) as cantidad_clientes
FROM country
RIGHT JOIN city
	ON country.country_id = city.country_id
RIGHT JOIN address
	ON city.city_id = address.city_id
INNER JOIN customer
	ON address.address_id = customer.address_id
GROUP BY pais
ORDER BY cantidad_clientes DESC;

Obtener una tabla con el nombre de cada cliente, la cantidad de rentas que realizo y la cantidad de dinero gastado. Agrupar por el nombre del cliente
y ordenar por cantidad de rentas:
SELECT customer.first_name, customer.last_name, count(rental.rental_id) as rentas, sum(payment.amount)
FROM customer
LEFT JOIN rental
	ON customer.customer_id = rental.customer_id
RIGHT JOIN payment
	ON rental.rental_id = payment.rental_id
GROUP BY customer.first_name, customer.last_name
ORDER BY rentas DESC;

Obtener cantidad de alquileres por tienda
SELECT store.store_id as tienda, count(rental.rental_id) as cantidad_rentas
FROM store
RIGHT JOIN staff
	ON store.store_id = staff.store_id
RIGHT JOIN rental
	ON staff.staff_id = rental.staff_id
GROUP BY tienda;

Obtener ganacias por tienda:
SELECT store.store_id as tienda, sum(payment.amount) as ganancias
FROM store
RIGHT JOIN staff
	ON store.store_id = staff.store_id
RIGHT JOIN payment
	ON staff.staff_id = payment.staff_id
GROUP BY tienda;

Obtener la cantidad de clientes que visitaron cada tienda: 
SELECT store.store_id as numero_tienda, count(customer.customer_id)
FROM store
RIGHT JOIN customer
	ON store.store_id = customer.store_id
GROUP BY numero_tienda;

Obtener una tabla con el id de un pais, el pais y la cantidad de clientes por pais:
SELECT country.country_id, country.country as pais, count(customer.customer_id) as cantidad_clientes
FROM country
JOIN city
	ON country.country_id = city.country_id
JOIN address
	ON city.city_id = address.city_id
JOIN customer
	ON address.address_id = customer.address_id
GROUP BY country.country_id
ORDER BY country.country_id ASC;
