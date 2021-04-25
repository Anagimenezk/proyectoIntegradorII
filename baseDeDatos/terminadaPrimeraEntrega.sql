CREATE TABLE usuarios (
id INT UNSIGNED PRIMARY KEY AUTO_INCREMENT , 
nombre VARCHAR (50) NOT NULL, 
apellido VARCHAR (50) NOT NULL,
mail VARCHAR (200) NOT NULL,  
telefono INT(10) NOT NULL,
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
creacion DATE NOT NULL, 
user_id INT UNSIGNED NOT NULL, 
product_id INT UNSIGNED NOT NULL, 

FOREIGN KEY (user_id) REFERENCES usuarios (id),
FOREIGN KEY (product_id) REFERENCES productos (id)
);

INSERT INTO usuarios VALUES (default, "Luisa", "Bengolea", "lbengolea@udesa.edu.ar", "1167591509", "2001-10-09");
INSERT INTO usuarios VALUES (default, "Martina", "Pawluk", "mpawluk@udesa.edu.ar", "1155606574", "2001-01-20");
INSERT INTO usuarios VALUES (default, "Ana", "Gimenez", "gimeneza@udesa.edu.ar", "1163772273", "2002-06-23");
INSERT INTO usuarios VALUES (default, "Cala", "Ruggeri", "cruggeri@udesa.edu.ar", "1126445245", "2001-12-26");
INSERT INTO usuarios VALUES (default, "Jacinta", "Valdez", "jvaldez@udesa.edu.ar", "1136164418", "2001-07-08");

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

INSERT INTO comentarios VALUES (default, "Increible, volveria una y mil veces mas", "2020-12-20", 1, 1);
INSERT INTO comentarios VALUES (default, "La comida es espectacular, la atencion ni hablar", "2020-12-24", 2, 1);
INSERT INTO comentarios VALUES (default, "Muy rico, bastante caro", "2020-12-20", 3, 1);
INSERT INTO comentarios VALUES (default, "De los mejores restaurantes que comi en BSAS, desde la comida hasta la atencion.", "2021-01-05", 4, 1);
INSERT INTO comentarios VALUES (default, "Me encanto la ambientacion", "2021-01-20", 5, 1);

INSERT INTO comentarios VALUES (default, "Increible, volveria una y mil veces mas", "2020-12-20", 1, 2);
INSERT INTO comentarios VALUES (default, "La comida es espectacular, la atencion ni hablar", "2020-12-24", 2, 2);
INSERT INTO comentarios VALUES (default, "Muy rico, bastante caro", "2020-12-20", 3, 2);
INSERT INTO comentarios VALUES (default, "De los mejores restaurantes que comi en BSAS, desde la comida hasta la atencion.", "2021-01-05", 4, 2);
INSERT INTO comentarios VALUES (default, "Me encanto la ambientacion", "2021-01-20", 5, 2);

INSERT INTO comentarios VALUES (default, "Increible, volveria una y mil veces mas", "2020-12-20", 1, 3);
INSERT INTO comentarios VALUES (default, "La comida es espectacular, la atencion ni hablar", "2020-12-24", 2, 3);
INSERT INTO comentarios VALUES (default, "Muy rico, bastante caro", "2020-12-20", 3, 3);
INSERT INTO comentarios VALUES (default, "De los mejores restaurantes que comi en BSAS, desde la comida hasta la atencion.", "2021-01-05", 4, 3);
INSERT INTO comentarios VALUES (default, "Me encanto la ambientacion", "2021-01-20", 5, 3);

INSERT INTO comentarios VALUES (default, "Increible, volveria una y mil veces mas", "2020-12-20", 1, 4);
INSERT INTO comentarios VALUES (default, "La comida es espectacular, la atencion ni hablar", "2020-12-24", 2, 4);
INSERT INTO comentarios VALUES (default, "Muy rico, bastante caro", "2020-12-20", 3, 4);
INSERT INTO comentarios VALUES (default, "De los mejores restaurantes que comi en BSAS, desde la comida hasta la atencion.", "2021-01-05", 4, 4);
INSERT INTO comentarios VALUES (default, "Me encanto la ambientacion", "2021-01-20", 5, 4);

INSERT INTO comentarios VALUES (default, "Increible, volveria una y mil veces mas", "2020-12-20", 1, 5);
INSERT INTO comentarios VALUES (default, "La comida es espectacular, la atencion ni hablar", "2020-12-24", 2, 5);
INSERT INTO comentarios VALUES (default, "Muy rico, bastante caro", "2020-12-20", 3, 5);
INSERT INTO comentarios VALUES (default, "De los mejores restaurantes que comi en BSAS, desde la comida hasta la atencion.", "2021-01-05", 4, 5);

INSERT INTO comentarios VALUES (default, "Increible, volveria una y mil veces mas", "2020-12-20", 1, 6);
INSERT INTO comentarios VALUES (default, "La comida es espectacular, la atencion ni hablar", "2020-12-24", 2, 6);
INSERT INTO comentarios VALUES (default, "Muy rico, bastante caro", "2020-12-20", 3, 6);
INSERT INTO comentarios VALUES (default, "De los mejores restaurantes que comi en BSAS, desde la comida hasta la atencion.", "2021-01-05", 4, 6);

INSERT INTO comentarios VALUES (default, "Increible, volveria una y mil veces mas", "2020-12-20", 1, 7);
INSERT INTO comentarios VALUES (default, "La comida es espectacular, la atencion ni hablar", "2020-12-24", 2, 7);
INSERT INTO comentarios VALUES (default, "Muy rico, bastante caro", "2020-12-20", 3, 7);
INSERT INTO comentarios VALUES (default, "De los mejores restaurantes que comi en BSAS, desde la comida hasta la atencion.", "2021-01-05", 4,7 );

INSERT INTO comentarios VALUES (default, "Increible, volveria una y mil veces mas", "2020-12-20", 1, 8);
INSERT INTO comentarios VALUES (default, "La comida es espectacular, la atencion ni hablar", "2020-12-24", 2, 8);
INSERT INTO comentarios VALUES (default, "Muy rico, bastante caro", "2020-12-20", 3, 8);
INSERT INTO comentarios VALUES (default, "De los mejores restaurantes que comi en BSAS, desde la comida hasta la atencion.", "2021-01-05", 4, 8);

INSERT INTO comentarios VALUES (default, "Increible, volveria una y mil veces mas", "2020-12-20", 1, 9);
INSERT INTO comentarios VALUES (default, "La comida es espectacular, la atencion ni hablar", "2020-12-24", 2, 9);
INSERT INTO comentarios VALUES (default, "Muy rico, bastante caro", "2020-12-20", 3, 9);
INSERT INTO comentarios VALUES (default, "De los mejores restaurantes que comi en BSAS, desde la comida hasta la atencion.", "2021-01-05", 4, 9);

INSERT INTO comentarios VALUES (default, "Increible, volveria una y mil veces mas", "2020-12-20", 1, 10);
INSERT INTO comentarios VALUES (default, "La comida es espectacular, la atencion ni hablar", "2020-12-24", 2, 10);
INSERT INTO comentarios VALUES (default, "Muy rico, bastante caro", "2020-12-20", 3, 10);
INSERT INTO comentarios VALUES (default, "De los mejores restaurantes que comi en BSAS, desde la comida hasta la atencion.", "2021-01-05", 4, 10);

INSERT INTO comentarios VALUES (default, "Increible, volveria una y mil veces mas", "2020-12-20", 1, 11);
INSERT INTO comentarios VALUES (default, "La comida es espectacular, la atencion ni hablar", "2020-12-24", 2, 11);
INSERT INTO comentarios VALUES (default, "Muy rico, bastante caro", "2020-12-20", 3, 11);
INSERT INTO comentarios VALUES (default, "De los mejores restaurantes que comi en BSAS, desde la comida hasta la atencion.", "2021-01-05", 4, 11);

INSERT INTO comentarios VALUES (default, "Increible, volveria una y mil veces mas", "2020-12-20", 1, 12);
INSERT INTO comentarios VALUES (default, "La comida es espectacular, la atencion ni hablar", "2020-12-24", 2, 12);
INSERT INTO comentarios VALUES (default, "Muy rico, bastante caro", "2020-12-20", 3, 12);
INSERT INTO comentarios VALUES (default, "De los mejores restaurantes que comi en BSAS, desde la comida hasta la atencion.", "2021-01-05", 4, 12);



SELECT * FROM usuarios;
SELECT * FROM productos;
SELECT * FROM comentarios;