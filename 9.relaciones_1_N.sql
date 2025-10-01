Tipo de relacion en la que un dato esta vinculado con muchos datos y, a su vez, muchos datos se vinculan con un dato.
Por ejemplo, en una base de datos de usuarios, el dato de pais esta vinculado a multiples datos de direcciones de usuarios.

Primary Key: Las tablas de una Base de Datos SQL tendran una columna cuyo valor represente un valor unico o Primary Key (clave primaria) para cada una 
de las filas. Algunas tablas tendran dos Primary Key debido a que, en determinados casos, una columna no es suficiente para crear una clave primaria, 
por lo que se precisa otra columna para poder identificar una fila de datos de forma unica.

Foreign Key: clave foránea. Son utilizadas para crear relaciones entre tablas; la clave primaria de una tabla se exporta a otra tabla como Foreign Key
para crear asi la relacion entre ambas tablas.

Ejemplo:
CREATE TABLE usuarios(
    id SERIAL PRIMARY KEY,
    nombre VARCHAR (50) NOT NULL,
    apellido VARCHAR (50) NOT NULL,
    edad INT NOT NULL,
    email VARCHAR (50) NOT NULL
);

CREATE TABLE peliculas(
    id SERIAL  PRIMARY KEY,
    pelicula TEXT NOT NULL,
    género VARCHAR (50) NOT NULL,
    completa BOOLEAN NOT NULL,
    fecha_vista DATE NOT NULL
);

CREATE TABLE dispositivos (
    id SERIAL PRIMARY KEY,
    computadora BOOLEAN,
    smartphone BOOLEAN,
    tablet BOOLEAN
);

CREATE TABLE informacionPagos (
    id SERIAL PRIMARY KEY,
    numeroTarjeta TEXT NOT NULL, -el dato numeroTarjeta se guarda como texto debido a que a pesar de ser un numero, no se realizran operaciones con el.
    nombreCompleto TEXT NOT NULL,
    vencimientoTarjeta DATE NOT NULL,
);

CONSTRAINT fk_informacionPagos_usuarios
    FOREIGN KEY (id)
        REFERENCES usuarios(id);

Con la palabra clave Constraint se crea la restriccion entre tablas con el nombre correspondiente. Luego se especifica cual sera la clave foranea en la
tabla informacion_pagos, que sera la clave primaria de la tabla usuarios. Con la palabra clave references (referencia) se referencia la tabla de donde
proviene la clave foranea y el nombre de la columna que almacena la misma. Asi se crea una relacion 1 a N entre una tabla usuarios y una tabla 
informacion_pagos, donde un usuario puede tener muchos datos de pagos realizados, por lo que la tabla informacion_pagos recibe como clave foranea la id 
del usuario para poder vincular todos los pagos realizados por dicho usuario.

Ejemplo:
CREATE TABLE profesores(
    id_profesor SERIAL PRIMARY KEY,
    nombre_profesor VARCHAR(50) NOT NULL,
    apellido_profesor VARCHAR(50) NOT NULL,
    email_profesor VARCHAR(50) NOT NULL
);

CREATE TABLE cursos(
    id_curso SERIAL PRIMARY KEY,
    nombre_curso VARCHAR(25),
    descripcion TEXT NOT NULL,
    id_profesor int
);

CONSTRAINT fk_cursos_profesores
    FOREIGN KEY (id_profesor)
        REFERENCES profesores(id_profesor)

CREATE TABLE videos(
    id_video SERIAL PRIMARY KEY,
    titulo VARCHAR(50) NOT NULL,
    descripcion TEXT NOT NULL,
    id_curso INT
);

CONSTRAINT fk_videos_cursos
	FOREIGN KEY (id_curso)
        REFERENCES cursos(id_curso);

En la primera restriccion, se asigna como clave foranea a la tabla cursos la clave primaria de la tabla profesores. De esta forma, se tiene una relacion
1 a N, donde un profesor imparte N cantidad de cursos y N cursos son impartidos por un profesor.
En la segunda restriccion, se asigna como clave foranea a la tabla videos la clave primaria de la tabla cursos. De esta forma, se tiene otra relacion 1
a N, donde a un curso le corresponden N cantidad de videos y N videos corresponden a un curso.
