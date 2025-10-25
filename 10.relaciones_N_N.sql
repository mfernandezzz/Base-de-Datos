Para crear relaciones N a N, se debe crear una tabla intermedia que vincule a ambas. Por ejemplo, una tabla usuarios se vincula con la tabla peliculas
a traves de una tabla intermedia llamada Usuarios-Peliculas. De esta forma, se tiene una relacion N a N debido a que N usuarios miran N cantidad de
peliculas y N cantidad de peliculas son vistas por N cantidad de usuarios.

CREATE TABLE usuarios_peliculas (
    id_usuario INT NOT NULL,
    id_pelicula INT NOT NULL,
   
    CONSTRAINT usuarios_peliculas_pkey
        PRIMARY KEY (id_usuario, id_pelicula),

    CONSTRAINT fk_usuarios_peliculas_usuarios
        FOREIGN KEY (id_usuario)
            REFERENCES usuarios(id_usuario),

    CONSTRAINT fk_usuarios_peliculas_peliculas
        FOREIGN KEY (id_pelicula)
            REFERENCES peliculas(id_pelicula)
);
Al ser una tabla intermedia, los valores de las dos columnas seran claves primarias y claves foraneas de la tabla usuarios y peliculas. En la primera
restriccion se especifica entre parentesis que las claves primaria de la tabla seran la clave primaria de usuarios y de peliculas.
En la segunda restriccion, se vincula la tabla usuarios_peliculas con la tabla usuarios, donde se especifica que la clave foranea sera id_usuario y
su referencia sera la tabla usuarios. En la tercera restriccion es el mismo procedimiento anterior pero para la tabla peliculas.

Ejemplo:
CREATE TABLE usuarios_cursos (
    id_usuario INT NOT NULL,
    id_curso INT NOT NULL,

    CONSTRAINT usuarios_cursos_pkey
        PRIMARY KEY (id_usuario, id_curso),

    CONSTRAINT fk_usuarios_cursos_usuarios
        FOREIGN KEY (id_usuario)
            REFERENCES usuarios(id_usuario),

    CONSTRAINT fk_usuarios_cursos_cursos
        FOREIGN KEY (id_curso)
            REFERENCES cursos(id_curso)
); --Un usuario puede cursar N cantidad de cursos, un curso puede ser cursado por N cantidad de usuarios.

Ejemplo:
CREATE TABLE film_actor (
    film_id INT NOT NULL,
    actor_id INT NOT NULL,
	
    CONSTRAINT film_actor_pkey
        PRIMARY KEY (film_id, actor_id),

    CONSTRAINT fk_film_actor_film
		FOREIGN KEY (film_id)
            REFERENCES film(film_id),

    CONSTRAINT fk_film_actor_actor
        FOREIGN KEY (actor_id)
            REFERENCES actor(actor_id)
); --Una pelicula puede tener N cantidad de actores, un actor puede participar en N cantidad de peliculas.

Ejemplo:
CREATE TABLE resultados (
	id_usuario INT NOT NULL,
	id_curso INT NOT NULL,
	nota INT NOT NULL,
	
	CONSTRAINT pk_resultados
		PRIMARY KEY (id_usuario, id_curso),
	
	CONSTRAINT fk_resultados_usuarios
		FOREIGN KEY (id_usuario)
			REFERENCES usuarios(id_usuario),
	
	CONSTRAINT fk_resultados_cursos
		FOREIGN KEY (id_curso)
			REFERENCES cursos(id_curso)
); --Esta tabla intermedia tendra el id del usuario, el id del curso y la nota correspondiente a ese usuario en ese curso.

En muchos casos, una tabla intermedia tendra su propia clave primaria, por lo que a la hora de crear las restricciones solo se estableceran las mismas
para las claves foraneas.
CREATE TABLE order_details (
    id_order_detail SERIAL PRIMARY KEY,
    id_order INT NOT NULL,
    id_product INT NOT NULL,
    quantity INT NOT NULL,

    CONSTRAINT fk_order_details_orders
        FOREIGN KEY (id_order)
            REFERENCES orders(id_order),

    CONSTRAINT fk_order_details_products
        FOREIGN KEY (id_product)
            REFERENCES products(id_product)
);
La tabla order_details sera la intermedia entre la tabla orders y products y tendra su propia clave primaria. En la primera restriccion se especifica que la 
clave foranea sera la clave primaria de la tabla orders. En la segunda restriccion se especifica que la clave foranea sera la clave primaria de la tabla 
products. Se tiene asi una relacion N a N, donde N cantidad de ordenes corresponden a N cantidad de productos y viceversa. Accediendo a la id de la tabla
intermedia, se puede visualizar los detalles de una orden (el id de la orden, el producto y la cantidad).
