Parte 1: Analisis
Realizar una consulta que muestre el monto total facturado por cada local:
SELECT store.store_id, SUM(payment.amount) AS total_amount
FROM payment
LEFT JOIN staff
    ON payment.staff_id = staff.staff_id
INNER JOIN store
    ON staff.store_id = store.store_id
GROUP BY store.store_id;

Realizar una consulta para visualizar las ventas por mes para todo el periodo. La consulta debe tener el monto total para cada mes del periodo que se
tenga datos. Ordenar por recaudacion de mayor a menor.
SELECT to_char(rental.rental_date, 'YYYY-MM') AS month, sum(payment.amount) AS ganancias
FROM rental
INNER JOIN payment
    ON rental.rental_id = payment.rental_id
WHERE rental.rental_date BETWEEN '2005-05-24' AND '2006-03-14'
GROUP BY month
ORDER BY ganancias DESC;

Obtener una tabla con todas las categorias de peliculas, la cantidad de rentas por categoria, las ganancias por categoria y el porcentaje que
represento lo recaudado por categoria respecto de la recaudacion total. Ordenar por ganancia de mayor a menor.
SELECT category.name AS category, COUNT(rental.rental_id) AS rentals, SUM(payment.amount) AS ganancias, ROUND(SUM(payment.amount) * 100 / 61312.04) AS porcentaje_recaudacion
FROM category
LEFT JOIN film_category
	ON category.category_id = film_category.category_id
LEFT JOIN inventory
	ON film_category.film_id = inventory.film_id
LEFT JOIN rental
	ON inventory.inventory_id = rental.inventory_id
LEFT JOIN payment
	ON rental.rental_id = payment.rental_id
GROUP BY category
ORDER BY ganancias DESC;

Obtener una tabla con las categorias de peliculas, la cantidad de rentas por categoria y el porcentaje de rentas para cada categoria con respecto de
la cantidad maxima de rentas. Ordenar por cantidad de rentas de mayor a menor.
SELECT category.name AS category, COUNT(rental.rental_id) AS rentals, (COUNT(rental.rental_id) * 100 / 16044) AS porcentaje_rentas
FROM category
LEFT JOIN film_category
	ON category.category_id = film_category.category_id
LEFT JOIN inventory
	ON film_category.film_id = inventory.film_id
LEFT JOIN rental
	ON inventory.inventory_id = rental.inventory_id
GROUP BY category
ORDER BY rentals DESC;

Identificar los 3 actores cuyas peliculas son las mas alquiladas en cantidad de rentas y recaudacion lograda:
SELECT actor.first_name AS nombre, actor.last_name AS apellido, COUNT(rental.rental_id) AS cantidad_rentas, SUM(payment.amount) AS ganancias
FROM actor
LEFT JOIN film_actor
	ON actor.actor_id = film_actor.actor_id
LEFT JOIN inventory
	ON film_actor.film_id = inventory.film_id
LEFT JOIN rental
	ON inventory.inventory_id = rental.inventory_id
LEFT JOIN payment
	ON rental.rental_id = payment.rental_id
GROUP BY nombre, apellido
ORDER BY ganancias DESC
LIMIT 3;

Obtener el top 6 de clientes que mas dinero gastaron:
SELECT customer.first_name AS nombre, customer.last_name AS apellido, SUM(payment.amount) AS dinero_gastado
FROM customer
LEFT JOIN payment
    ON customer.customer_id = payment.customer_id
GROUP BY nombre, apellido
ORDER BY dinero_gastado DESC
LIMIT 6;


Parte 2: Creacion
Agregar nuevo empleado al local 1: 
Nombre y apellido: "Punku Nose"
Dirección: “1913 Hanoi Way” código postal “35200”
Email: punkurules@lumetrio.com

SELECT address_id
FROM address
WHERE postal_code = '35200';

INSERT INTO staff
(first_name, last_name, address_id, email, store_id, username)
VALUES
('Punku', 'Nose', 5, 'punkurules@lumetrio.com', 1, 'Punku');

Agregar nuevo empleado al local 2:
Nombre y apellido: Luigi Bros
Dirección: “1795 Santiago de Compostela Way” código postal “18743”
Email: hermanodemario@lumetrio.com

SELECT address_id
FROM address
WHERE postal_code = '18743';

INSERT INTO staff
(first_name, last_name, address_id, email, store_id, username)
VALUES
('Luigi', 'Bros', 10, 'hermanodemario@lumetrio.com', 2, 'Luigi');

Cambiar la direccion del local principal a “1121 Loja Avenue”, con el código postal “17886”:
SELECT address_id
FROM address
WHERE postal_code = '17886';

UPDATE store
SET address_id = 6
WHERE store_id = 1;

Crear tabla "videojuegos" y asignarle la siguiente informacion: game_id, game_title, console, description, replacement_cost, language, store_id, last_update
CREATE TABLE videogame (
    game_id SERIAL PRIMARY KEY,
    game_title VARCHAR(50) NOT NULL,
    console VARCHAR(25) NOT NULL,
    description VARCHAR(150) NOT NULL,
    replacement_cost INT,
    language VARCHAR(20) NOT NULL,
    store_id SMALLINT NOT NULL,
    last_update DATE,
    rental_rate REAL NOT NULL
);

Agregar los siguientes datos a la tabla videogame: 
game_title 'Asdrubal Ganso Pro skater 2'
console: Juegosfera
description: 'Juego de andar en patines y skate, no vas a ir muy rápido porque te podes marear pero al menos podes ver los paisajes.'
language: Spanish
store_id: 1
rental_rate: 5.99

INSERT INTO videogame
(game_title, console, description, language, store_id, rental_rate)
values
('Asdrubal Ganso Pro skater 2', 'Juegosfera', 'Juego de andar en patines y skate, no vas a ir muy rápido porque te podes marear pero al menos podes ver los paisajes.', 'Spanish', 1, 5.99);
