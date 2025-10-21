CREATE TABLE estudiantes (
    id SERIAL PRIMARY KEY,
    nombre VARCHAR(50) NOT NULL,
    apellido VARCHAR(50) NOT NULL,
    edad INT NOT NULL
);

CREATE TABLE director (
    director_id SERIAL PRIMARY KEY,
    first_name VARCHAR(50) NOT NULL,
    last_name VARCHAR(50) NOT NULL 
);

CREATE TABLE videojuegos(
    id_videojuego SERIAL PRIMARY KEY,
	Título VARCHAR(30) NOT NULL,
	Consola VARCHAR(15) NOT NULL,
	Descripción VARCHAR(200),
	Costo_de_Cambio INT NOT NULL,
	lenguaje VARCHAR(15) NOT NULL,
	Última_actualización DATE NOT NULL 
);
