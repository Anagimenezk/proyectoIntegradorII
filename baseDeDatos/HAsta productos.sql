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





INSERT INTO productos VALUES (default, "/images/products/alos.jpg", "Alo's", "2020-03-02", 1);
INSERT INTO productos VALUES (default, "/images/products/chila.jpeg", "Chila", "2020-03-22", 3);
INSERT INTO productos VALUES (default, "/images/products/dabbang.jpg", "Niño Gordo", "2020-05-14", 2);
INSERT INTO productos VALUES (default, "/images/products/donjulio.jpg", "Don Julio", "2020-02-23", 4);
INSERT INTO productos VALUES (default, "/images/products/elena.jpg", "Elena", "2020-03-02", 3);
INSERT INTO productos VALUES (default, "/images/products/mishiguene.jpg", "Mishiguene", "2020-06-20", 5);
INSERT INTO productos VALUES (default, "/images/products/mudra.jpg", "Mudra Plant Based", "2020-06-12", 1);
INSERT INTO productos VALUES (default, "/images/products/nadra.jpg", "Narda Comedor", "2020-08-18", 4);
INSERT INTO productos VALUES (default, "/images/products/proper.jpeg", "Proper", "2020-06-10", 2);
INSERT INTO productos VALUES (default, "/images/products/tegui.jpg", "Tegui", "2020-09-28", 5);