Para crear relaciones N a N, se debe crear una tabla intermedia que vincule a ambas. Por ejemplo, una tabla USUARIOS se vincula con la tabla PELICULAS
a traves de una tabla intermedia llamada Usuarios-Peliculas. De esta forma, se tiene una relacion N a N debido a que N usuarios miran N cantidad de
peliculas y N cantidad de peliculas son vistas por N cantidad de usuarios.

CREATE TABLE usuarios_peliculas (
    id_usuarios INT NOT NULL,
    id_peliculas INT NOT NULL,
   
    CONSTRAINT usuarios_peliculas_pkey
        PRIMARY KEY (id_usuarios, id_peliculas),

    CONSTRAINT fk_usuarios_peliculas_usuarios
        FOREIGN KEY (id_usuarios)
            REFERENCES usuarios(id),

    CONSTRAINT fk_usuarios_peliculas_peliculas
        FOREIGN KEY (id_peliculas)
            REFERENCES peliculas(id)
);
Al ser una tabla intermedia, los valores de las dos columnas seran claves primarias y claves foraneas de la tabla usuarios y peliculas. En la primera
restriccion se especifica entre parentesis que la clave primaria de las dos columnas de la tabla seran la clave primaria de usuarios y de peliculas.
En la segunda restriccion, se vincula la tabla usuarios_peliculas con la tabla usuarios, donde se especifica que la clave foranea sera id_usuarios y
su referencia sera la tabla usuarios.
En la tercera restriccion es el mismo procedimiento anterior pero para la tabla peliculas.


Ejemplo:
CREATE TABLE profesores (
    id_usuario INT NOT NULL,
    id_curso INT NOT NULL,

    CONSTRAINT profesores_pkey
        PRIMARY KEY (id_usuario, id_curso),

    CONSTRAINT fk_profesores_usuarios
        FOREIGN KEY (id_usuario)
            REFERENCES usuarios(id_usuario),

    CONSTRAINT fk_profesores_cursos
        FOREIGN KEY (id_curso)
            REFERENCES cursos(id_curso)
); La tabla profesores es la intermedia entre usuarios y cursos.

Ingreso de datos en la tabla intermedia profesores:
INSERT INTO profesores
(id_cursos, id_usuarios)
VALUES
(1, 1),
(3, 1),
(5, 1),
(2, 3),
(3, 4),
(4, 4);


Ejemplo:
CREATE TABLE alumnos (
    id_cursos INT NOT NULL,
    id_usuarios INT NOT NULL,
	
    CONSTRAINT alumnos_pk
        PRIMARY KEY (id_curso, id_usuario),

    CONSTRAINT fk_alumnos_cursos
		FOREIGN KEY (id_curso)
            REFERENCES cursos(id_curso),

    CONSTRAINT fk_alumnos_usuarios
        FOREIGN KEY (id_usuario)
            REFERENCES usuarios(id_usuario)
); La tabla alumnos es la intermedia entre usuarios y cursos.

Ingreso de datos en la tabla intermedia alumnos:
INSERT INTO alumnos 
(id_usuario, id_curso)
VALUES
(2, 1),
(2, 2 ),
(4, 1),
(5, 1),
(6, 2),
(7, 2),
(8, 3);


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
);

En muchos casos, una tabla intermedia tendra su propia clave primaria, por lo que a la hora de crear las restricciones solo se estableceran las mismas
para las claves foraneas.

Ejemplo:
CREATE TABLE order_details (
    id_order_detail SERIAL PRIMARY KEY,
    id_order INT,
    id_product INT,
    quantity INT,

    CONSTRAINT fk_order_details_orders
        FOREIGN KEY (id_order)
            REFERENCES orders(id_order),

    CONSTRAINT fk_order_details_products
        FOREIGN KEY (id_product)
            REFERENCES products(id_product)
);
La tabla order_details sera la intermedia entre la tabla orders y products y tendra su propia clave primaria. 
En la primera restriccion se especifica que la clave foranea sera la clave primaria de la tabla orders.
En la segunda restriccion se especifica que la clave foranea sera la clave primaria de la tabla products.
Se tiene asi una relacion N a N, donde N cantidad de ordenes corresponden a N cantidad de productos y viceversa. Accediendo a la id de la tabla
intermedia, se puede visualizar los detalles de una orden (el id de la orden, el producto y la cantidad).