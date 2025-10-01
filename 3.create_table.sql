Las consultas permiten extraer informacion y manipular datos; agregando, eliminando o cambiando lo que queramos.
Nunca se debe poner el mismo nombre a dos bases de datos o a dos tablas.

CREATE TABLE estudiantes(
    id SERIAL PRIMARY KEY,
    nombre VARCHAR(15) NOT NULL,
    apellido VARCHAR(20) NOT NULL,
    edad INT NOT NULL
);

CREATE TABLE director(
    director_id SERIAL PRiMARY KEY,
    first_name VARCHAR(20) NOT NULL,
    last_name VARCHAR(20) NOT NULL 
);

CREATE TABLE videojuegos(
    id_videojuego SERIAL Primary Key,
	Título VARCHAR(30) NOT NULL,
	Consola VARCHAR(15) NOT NULL,
	Descripción VARCHAR(200),
	Costo_de_Cambio INT NOT NULL,
	lenguaje VARCHAR(15) NOT NULL,
	Última_actualización DATE NOT NULL 
);
