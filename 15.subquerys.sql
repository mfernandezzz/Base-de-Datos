Subconsulta
SELECT MAX(edad)
FROM Estudiantes;

Consulta
SELECT *
FROM estudiantes
WHERE edad = (
	SELECT MAX(edad)
	FROM Estudiantes
);

Obtener una tabla con el id de las peliculas donde actuaron los actores que participaron en la pelicula con id = 14.
SELECT film_id
FROM film_actor
WHERE actor_id = 14;


Obtener todos los nombres de peliculas donde hayan participado los actores que participaron en la pelicula con id = 14.
SELECT film.film_id, film.title
FROM film
WHERE film_id in (
	SELECT film_id
	FROM film_actor
	WHERE actor_id = 14
);


Obtener todos los clientes de los que recibio pagos el miembro del staff con id = 1.
SELECT customer.first_name, customer.last_name
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


Obtener todas las peliculas con categoria action.
SELECT film.title
FROM film
WHERE film_id in (
	SELECT film_id
	FROM film_category
	WHERE category_id = 1
);

SELECT film.title, category.name
FROM film
RIGHT JOIN film_category
	ON film.film_id = film_category.film_id
INNER JOIN category
	ON category.category_id = film_category.category_id
WHERE category.name = 'Action';


Obtener todos los clientes del pais numero 10:
SELECT customer.first_name, customer.last_name
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


Obtener todos los clientes que han visto peliculas en japones:
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
SELECT count(rental.rental_id)
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
SELECT sum(payment.amount)
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
SELECT film.title as peliculas
FROM film
WHERE film_id in (
	SELECT film_id
	FROM film_actor
	WHERE actor_id in (
		select actor_id
		from actor
		where actor.first_name = 'Nick' and actor.last_name = 'Wahlberg'
	)
);