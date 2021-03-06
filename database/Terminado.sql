CREATE TABLE usuarios (
id INT UNSIGNED PRIMARY KEY AUTO_INCREMENT , 
nombre VARCHAR (50) NOT NULL, 
apellido VARCHAR (50) NOT NULL,
mail VARCHAR (200) NOT NULL UNIQUE, 
contraseña VARCHAR (50) NOT NULL, 
telefono INT UNSIGNED NOT NULL UNIQUE,
fecha DATE NOT NULL
);

CREATE TABLE productos (
id INT UNSIGNED PRIMARY KEY AUTO_INCREMENT  , 
image VARCHAR (500) NOT NULL, 
nombre VARCHAR (50) NOT NULL, 
fecha DATE NOT NULL,
descripcion VARCHAR (1000),
user_id INT UNSIGNED,

FOREIGN KEY (user_id) REFERENCES usuarios (id)
);

CREATE TABLE comentarios (
id INT UNSIGNED PRIMARY KEY AUTO_INCREMENT ,
texto VARCHAR (500) NOT NULL, 
user_id INT UNSIGNED NOT NULL, 
product_id INT UNSIGNED NOT NULL, 

FOREIGN KEY (user_id) REFERENCES usuarios (id),
FOREIGN KEY (product_id) REFERENCES productos (id) ON DELETE CASCADE 
);

INSERT INTO usuarios VALUES (default, "Luisa", "Bengolea", "lbengolea@udesa.edu.ar", "Luisa", "1167591509", "2001-10-09");
INSERT INTO usuarios VALUES (default, "Martina", "Pawluk", "mpawluk@udesa.edu.ar","Martina", "1155606574", "2001-01-20");
INSERT INTO usuarios VALUES (default, "Ana", "Gimenez", "gimeneza@udesa.edu.ar","Ana", "1163772273", "2002-06-23");
INSERT INTO usuarios VALUES (default, "Cala", "Ruggeri", "cruggeri@udesa.edu.ar","Cala", "1126445245", "2001-12-26");
INSERT INTO usuarios VALUES (default, "Jacinta", "Valdez", "jvaldez@udesa.edu.ar","Jacinta", "1136164418", "2001-07-08");

SELECT * FROM usuarios;



INSERT INTO productos VALUES (default, "/images/products/alos.jpg", "Alo's", "2020-03-02","Este moderno bistró, que abre para el desayuno, el almuerzo y la cena, se convirtió rápidamente en un éxito por su forma única de transformar los sabores argentinos familiares.", 1);
INSERT INTO productos VALUES (default, "/images/products/chila.jpeg", "Chila", "2020-03-22", "La cocina de este restaurante es en igual medidas coqueto y vanguardista. Está comandada por Pedro Bargero.", 3);
INSERT INTO productos VALUES (default, "/images/products/dabbang.jpg", "Niño Gordo", "2020-05-14","Tal vez uno de los restaurantes de la lista más difíciles de encasillar. La comida tiene mucha influencia de platos y street food asiático, pero no es un restaurante asiático. Se siente bastante argentino.", 2);
INSERT INTO productos VALUES (default, "/images/products/donjulio.jpg", "Don Julio", "2020-02-23", "No es fácil tomar algo tan cotidiano y popular como es la carne a la parrilla, y llevarlo a un nivel de excelencia sin precedentes y no caer en la pretensión o sobre exigencia, pero este restaurant, lo logro.", 4);
INSERT INTO productos VALUES (default, "/images/products/elena.jpg", "Elena", "2020-03-02", "Elena es probablemente el lugar donde más sofisticado te sientas comiendo un bife de chorizo en Buenos Aires.", 3);
INSERT INTO productos VALUES (default, "/images/products/mishiguene.jpg", "Mishiguene", "2020-06-20", "Todos los platos (además de deliciosos) tienen una historia que contar, y en general, esta se relaciona a la vida de Tomas Kalika, el cocinero, y sus raíces judías.", 5);
INSERT INTO productos VALUES (default, "/images/products/mudra.jpg", "Mudra Plant Based", "2020-06-12", "Son pocos los restaurantes que logran colarse en las conversaciones gastronómicas cuando todavía no abrieron sus puertas, Mudrá es una de esas excepciones.", 1);
INSERT INTO productos VALUES (default, "/images/products/nadra.jpg", "Narda Comedor", "2020-08-18", "La atención es cálida y eficiente, los platos son para compartir y el único sello que tienen es el de lo impredecible: tanto en sabores como en origen.", 4);
INSERT INTO productos VALUES (default, "/images/products/proper.jpeg", "Proper", "2020-06-10", "De afuera este garage sobre calle Araoz poco te va a llevar a un restaurante en esta lista, pero todo eso se borra cuando probás el primer plato.", 2);
INSERT INTO productos VALUES (default, "/images/products/tegui.jpg", "Tegui", "2020-09-28", "De afuera este garage sobre calle Araoz poco te va a llevar a un restaurante en esta lista, pero todo eso se borra cuando probás el primer plato.", 5);
INSERT INTO productos VALUES (default, "/images/products/sacro.jpeg", "Sacro", "2020-10-07", "La elegante arquitectura de Sacro, atrae a la multitud vegana y carnívora en busca de platos creativos y sabrosos a base de plantas. El menú de inspiración internacional fue diseñado por el chef ejecutivo Maximiliano Rossi.", 1);
INSERT INTO productos VALUES (default, "/images/products/casacavia.jpeg", "Casa Cavia", "2020-12-28", "El exclusivo restaurante judío del chef Tomás Kalika recrea platos asquenazíes, sefardíes, israelíes y del Medio Oriente utilizando ingredientes frescos y técnicas modernas de una manera que intriga y evoca nostalgia.", 3);



INSERT INTO comentarios VALUES (default, "Increible, volveria una y mil veces mas", 1, 1);
INSERT INTO comentarios VALUES (default, "La comida es espectacular, la atencion ni hablar", 2, 1);
INSERT INTO comentarios VALUES (default, "Muy rico, bastante caro", 3, 1);
INSERT INTO comentarios VALUES (default, "De los mejores restaurantes que comi en BSAS, desde la comida hasta la atencion.", 4, 1);
INSERT INTO comentarios VALUES (default, "Me encanto la ambientacion",  5, 1);

INSERT INTO comentarios VALUES (default, "Increible, volveria una y mil veces mas", 1, 2);
INSERT INTO comentarios VALUES (default, "La comida es espectacular, la atencion ni hablar", 2, 2);
INSERT INTO comentarios VALUES (default, "Muy rico, bastante caro", 3, 2);
INSERT INTO comentarios VALUES (default, "De los mejores restaurantes que comi en BSAS, desde la comida hasta la atencion.", 4, 2);
INSERT INTO comentarios VALUES (default, "Me encanto la ambientacion", 5, 2);

INSERT INTO comentarios VALUES (default, "Increible, volveria una y mil veces mas", 1, 3);
INSERT INTO comentarios VALUES (default, "La comida es espectacular, la atencion ni hablar", 2, 3);
INSERT INTO comentarios VALUES (default, "Muy rico, bastante caro", 3, 3);
INSERT INTO comentarios VALUES (default, "De los mejores restaurantes que comi en BSAS, desde la comida hasta la atencion.",  4, 3);
INSERT INTO comentarios VALUES (default, "Me encanto la ambientacion",  5, 3);

INSERT INTO comentarios VALUES (default, "Increible, volveria una y mil veces mas", 1, 4);
INSERT INTO comentarios VALUES (default, "La comida es espectacular, la atencion ni hablar", 2, 4);
INSERT INTO comentarios VALUES (default, "Muy rico, bastante caro",  3, 4);
INSERT INTO comentarios VALUES (default, "De los mejores restaurantes que comi en BSAS, desde la comida hasta la atencion.", 4, 4);
INSERT INTO comentarios VALUES (default, "Me encanto la ambientacion", 5, 4);

INSERT INTO comentarios VALUES (default, "Increible, volveria una y mil veces mas", 1, 5);
INSERT INTO comentarios VALUES (default, "La comida es espectacular, la atencion ni hablar", 2, 5);
INSERT INTO comentarios VALUES (default, "Muy rico, bastante caro", 3, 5);
INSERT INTO comentarios VALUES (default, "De los mejores restaurantes que comi en BSAS, desde la comida hasta la atencion.", 4, 5);

INSERT INTO comentarios VALUES (default, "Increible, volveria una y mil veces mas",  1, 6);
INSERT INTO comentarios VALUES (default, "La comida es espectacular, la atencion ni hablar",  2, 6);
INSERT INTO comentarios VALUES (default, "Muy rico, bastante caro", 3, 6);
INSERT INTO comentarios VALUES (default, "De los mejores restaurantes que comi en BSAS, desde la comida hasta la atencion." ,4, 6);

INSERT INTO comentarios VALUES (default, "Increible, volveria una y mil veces mas",1, 7);
INSERT INTO comentarios VALUES (default, "La comida es espectacular, la atencion ni hablar", 2, 7);
INSERT INTO comentarios VALUES (default, "Muy rico, bastante caro",  3, 7);
INSERT INTO comentarios VALUES (default, "De los mejores restaurantes que comi en BSAS, desde la comida hasta la atencion.",  4,7 );

INSERT INTO comentarios VALUES (default, "Increible, volveria una y mil veces mas", 1, 8);
INSERT INTO comentarios VALUES (default, "La comida es espectacular, la atencion ni hablar", 2, 8);
INSERT INTO comentarios VALUES (default, "Muy rico, bastante caro", 3, 8);
INSERT INTO comentarios VALUES (default, "De los mejores restaurantes que comi en BSAS, desde la comida hasta la atencion.",  4, 8);

INSERT INTO comentarios VALUES (default, "Increible, volveria una y mil veces mas",1, 9);
INSERT INTO comentarios VALUES (default, "La comida es espectacular, la atencion ni hablar",  2, 9);
INSERT INTO comentarios VALUES (default, "Muy rico, bastante caro", 3, 9);
INSERT INTO comentarios VALUES (default, "De los mejores restaurantes que comi en BSAS, desde la comida hasta la atencion.", 4, 9);

INSERT INTO comentarios VALUES (default, "Increible, volveria una y mil veces mas",  1, 10);
INSERT INTO comentarios VALUES (default, "La comida es espectacular, la atencion ni hablar",2, 10);
INSERT INTO comentarios VALUES (default, "Muy rico, bastante caro", 3, 10);
INSERT INTO comentarios VALUES (default, "De los mejores restaurantes que comi en BSAS, desde la comida hasta la atencion.", 4, 10);

INSERT INTO comentarios VALUES (default, "Increible, volveria una y mil veces mas",  1, 11);
INSERT INTO comentarios VALUES (default, "La comida es espectacular, la atencion ni hablar",  2, 11);
INSERT INTO comentarios VALUES (default, "Muy rico, bastante caro", 3, 11);
INSERT INTO comentarios VALUES (default, "De los mejores restaurantes que comi en BSAS, desde la comida hasta la atencion.",  4, 11);

INSERT INTO comentarios VALUES (default, "Increible, volveria una y mil veces mas",  1, 12);
INSERT INTO comentarios VALUES (default, "La comida es espectacular, la atencion ni hablar",  2, 12);
INSERT INTO comentarios VALUES (default, "Muy rico, bastante caro",  3, 12);
INSERT INTO comentarios VALUES (default, "De los mejores restaurantes que comi en BSAS, desde la comida hasta la atencion.",  4, 12);



-- SELECT * FROM usuarios;
-- SELECT * FROM productos;
-- SELECT * FROM comentarios;


UPDATE productos 
SET image = "/images/products/narda.jpg"
WHERE id = 8;

ALTER TABLE productos
ADD createdAt TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
ADD updatedAt TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP;


ALTER TABLE usuarios
ADD createdAt TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
ADD updatedAt TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP;


ALTER TABLE comentarios
ADD createdAt TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
ADD updatedAt TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP;


ALTER TABLE usuarios 
MODIFY contraseña VARCHAR (300) NOT NULL;


ALTER TABLE usuarios
ADD image VARCHAR (500) NOT NULL;

UPDATE usuarios 
SET image = "/images/users/usuario1.jpg"
WHERE id = 1;

UPDATE usuarios 
SET image = "/images/users/usuario2.jpg"
WHERE id = 2;

UPDATE usuarios 
SET image = "/images/users/usuario3.jpg"
WHERE id = 3;

UPDATE usuarios 
SET image = "/images/users/usuario4.jpg"
WHERE id = 4;

UPDATE usuarios 
SET image = "/images/users/usuario5.jpg"
WHERE id = 5;

