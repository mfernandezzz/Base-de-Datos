La sentencia INSERT permite el ingreso de datos a una tabla. Se especifica el nombre de la tabla, sus columnas entre parentesis, la palabra clave VALUES y
debajo los valores para cada columna tambien entre parentesis.

INSERT INTO estudiantes
(nombre, apellido, edad, color_favorito)
VALUES
('Bruno', 'Diaz', 32, 'negro');

INSERT INTO usuarios 
(nombre, apellido, edad)
VALUES
('Punku', 'Nose', 31 ),
('Paula', 'Rodriguez', 25 );

INSERT INTO staff
(first_name, last_name, address_id, email, store_id, active, username)
VALUES
('Punku', 'Nose', 5, 'punkurules@lumetrio.com', 1, 'True', 'Punku');
