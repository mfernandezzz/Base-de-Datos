Subconsulta:
SELECT *
FROM estudiantes
WHERE edad = (
	SELECT MAX(edad)
	FROM Estudiantes
);

Cual es el nombre y apellido del cliente que vive en la ciudad 'Apeldoorn'?
SELECT customer.first_name AS name, customer.last_name AS last_name
FROM customer
WHERE address_id in (
	SELECT address_id
	FROM address
	WHERE city_id in (
		SELECT city_id
		FROM city
		WHERE city.city = 'Apeldoorn'
	)
);

Cual es la categoria de la pelicula 'Arabia Dogma'?
SELECT category.name AS category
FROM category
WHERE category_id IN (
	SELECT category_id
	FROM film_category
	WHERE film_id IN (
		SELECT film_id
		FROM film
		WHERE film.title = 'Arabia Dogma'
	)
);

Obtener una tabla con el id de las peliculas donde actuaron los actores que participaron en la pelicula con id = 14:
SELECT film_id
FROM film_actor
WHERE actor_id = 14;

Obtener todos los nombres de peliculas donde hayan participado los actores que participaron en la pelicula con id = 14:
SELECT film.film_id, film.title
FROM film
WHERE film_id in (
	SELECT film_id
	FROM film_actor
	WHERE actor_id = 14
);

Obtener todos los clientes de los que recibio pagos el miembro del staff con id = 1:
SELECT customer.first_name AS name, customer.last_name AS last_name
FROM customer
WHERE customer_id in (
	SELECT customer_id
	FROM payment
	WHERE staff_id in (
		SELECT staff_id
		FROM staff
		WHERE staff_id = 1
	)
);

Obtener todas las peliculas con categoria action:
SELECT film.title AS title
FROM film
WHERE film_id in (
	SELECT film_id
	FROM film_category
	WHERE category_id = 1  --el id de la categoria action, previamente obtenido con un select
);

Obtener todos los clientes del pais numero 10:
SELECT customer.first_name AS name, customer.last_name AS last_name
FROM customer
WHERE address_id in (
	SELECT address_id
	FROM address
	WHERE city_id in (
		SELECT city_id
		FROM city
		WHERE country_id in (
			SELECT country_id
			FROM country
			WHERE country_id = 10
		)
	)
);

Obtener el id de todos los clientes que han visto peliculas en japones:
SELECT customer_id
FROM rental
WHERE inventory_id in (
	SELECT inventory_id
	FROM inventory
	WHERE film_id in (
		SELECT film_id
		FROM film
		WHERE language_id in (
			SELECT language_id
			FROM language
			WHERE language.name = 'Japanese'
		)
	)
);

Obtener la cantidad de rentas que se hicieron para las peliculas de categoria Sci-Fi:
SELECT count(rental.rental_id) AS rentals
FROM rental
WHERE inventory_id in (
	SELECT inventory_id 
	FROM inventory
	WHERE film_id in (
		SELECT film_id
		FROM film_category
		WHERE category_id in (
			SELECT category_id
			FROM category
			WHERE category.name = 'Sci-Fi'
		)
	)
);

Obtener las ganancias que obtuvo la categoria de pelicula Foreign:
SELECT sum(payment.amount) AS total_amount
FROM payment
WHERE rental_id in (
	SELECT rental_id
	FROM rental
	WHERE inventory_id in (
		SELECT inventory_id
		FROM inventory
		WHERE film_id in (
			SELECT film_id
			FROM film_category
			WHERE category_id in (
				SELECT category_id
				FROM category
				WHERE category.name = 'Foreign'
			)
		)
	)
);

Mostrar los nombres de las películas en las que actuó el actor Nick Wahlberg:
SELECT film.title AS peliculas
FROM film
WHERE film_id in (
	SELECT film_id
	FROM film_actor
	WHERE actor_id in (
		SELECT actor_id
		FROM actor
		WHERE actor.first_name = 'Nick' and actor.last_name = 'Wahlberg'
	)
);
