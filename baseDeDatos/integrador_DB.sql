CREATE TABLE usuarios (
id INT PRIMARY KEY AUTO_INCREMENT,
nombre VARCHAR(100),
fecha_nac DATE,
edad TINYINT
);

CREATE TABLE productos (
id INT PRIMARY KEY AUTO_INCREMENT,
nombre VARCHAR(200),
usuario_id INT,
url VARCHAR(500),
fecha_creacion DATE,

FOREIGN KEY (usuario_id) REFERENCES usuarios(id)
);

CREATE TABLE comentarios (
id INT PRIMARY KEY AUTO_INCREMENT,
usuario_id INT,
producto_id INT,
comentario VARCHAR(300),
fecha_comentario DATE,

FOREIGN KEY (usuario_id) REFERENCES usuarios(id),
FOREIGN KEY (producto_id) REFERENCES productos(id)
);

INSERT INTO usuarios (nombre) VALUES ('Jonah Hill');
INSERT INTO usuarios (nombre) VALUES ('Michaerl Cera');
INSERT INTO usuarios (nombre) VALUES ('Seth Rogen');
INSERT INTO usuarios (nombre) VALUES ('Christopher Mintz-Plasse');
INSERT INTO usuarios (nombre) VALUES ('Dave Franco');

SELECT * FROM usuarios;

INSERT INTO usuarios (fecha_nac) VALUES ('1983-12-20');
INSERT INTO usuarios (fecha_nac) VALUES ('1988-7-7');
INSERT INTO usuarios (fecha_nac) VALUES ('1982-4-15');
INSERT INTO usuarios (fecha_nac) VALUES ('1989-6-20');
INSERT INTO usuarios (fecha_nac) VALUES ('1985-6-12');

SELECT * FROM usuarios;

DELETE FROM usuarios WHERE id=1;
DELETE FROM usuarios WHERE id=2;
DELETE FROM usuarios WHERE id=3;
DELETE FROM usuarios WHERE id=4;
DELETE FROM usuarios WHERE id=5;
DELETE FROM usuarios WHERE id=6;
DELETE FROM usuarios WHERE id=7;
DELETE FROM usuarios WHERE id=8;
DELETE FROM usuarios WHERE id=9;
DELETE FROM usuarios WHERE id=11;

SELECT * FROM usuarios;

INSERT INTO usuarios (nombre, fecha_nac, edad) VALUES ('Jonah Hill', '1983-12-20', '37');
INSERT INTO usuarios (nombre, fecha_nac, edad) VALUES ('Michaerl Cera', '1988-7-7', '32');
INSERT INTO usuarios (nombre, fecha_nac, edad) VALUES ('Seth Rogen', '1982-4-15', '39');
INSERT INTO usuarios (nombre, fecha_nac, edad) VALUES ('Christopher Mintz-Plasse', '1989-6-20', '31');
INSERT INTO usuarios (nombre, fecha_nac, edad) VALUES ('Dave Franco', '1985-6-12', '35');

INSERT INTO productos (nombre, usuario_id, url, fecha_creacion) VALUES ('Nike Air Joran 1 Mid Red', 11,'https://www.google.com/imgres?imgurl=https%3A%2F%2Fassets.adidas.com%2Fimages%2Fw_600%2Cf_auto%2Cq_auto%2F7e03ecef81a64126bcecab58011051d8_9366%2FZapatillas_Superstar_Bold_Mujer_Blanco_FV3336_01_standard.jpg&imgrefurl=https%3A%2F%2Fwww.adidas.com.ar%2Fzapatillas-superstar-bold-mujer%2FFV3336.html&tbnid=Owe4MAQr14tRlM&vet=12ahUKEwiD8-mMi5LwAhXKrpUCHeXNBo0QMygAegUIARDdAg..i&docid=JpoLlOD2t-R7HM&w=600&h=600&q=zapatillas&safe=active&client=safari&ved=2ahUKEwiD8-mMi5LwAhXKrpUCHeXNBo0QMygAegUIARDdAg' ,'2021_04_21');
INSERT INTO productos (nombre, usuario_id, url, fecha_creacion) VALUES ('Adidas Yeezy 350 Zebra', 13,'https://www.google.com/imgres?imgurl=https%3A%2F%2Fassets.adidas.com%2Fimages%2Fw_600%2Cf_auto%2Cq_auto%2F7e03ecef81a64126bcecab58011051d8_9366%2FZapatillas_Superstar_Bold_Mujer_Blanco_FV3336_01_standard.jpg&imgrefurl=https%3A%2F%2Fwww.adidas.com.ar%2Fzapatillas-superstar-bold-mujer%2FFV3336.html&tbnid=Owe4MAQr14tRlM&vet=12ahUKEwiD8-mMi5LwAhXKrpUCHeXNBo0QMygAegUIARDdAg..i&docid=JpoLlOD2t-R7HM&w=600&h=600&q=zapatillas&safe=active&client=safari&ved=2ahUKEwiD8-mMi5LwAhXKrpUCHeXNBo0QMygAegUIARDdAg' , '2021_04_22');
INSERT INTO productos (nombre, usuario_id, url, fecha_creacion) VALUES ('Dr.Martens Black', 15,'https://www.google.com/imgres?imgurl=https%3A%2F%2Fassets.adidas.com%2Fimages%2Fw_600%2Cf_auto%2Cq_auto%2F7e03ecef81a64126bcecab58011051d8_9366%2FZapatillas_Superstar_Bold_Mujer_Blanco_FV3336_01_standard.jpg&imgrefurl=https%3A%2F%2Fwww.adidas.com.ar%2Fzapatillas-superstar-bold-mujer%2FFV3336.html&tbnid=Owe4MAQr14tRlM&vet=12ahUKEwiD8-mMi5LwAhXKrpUCHeXNBo0QMygAegUIARDdAg..i&docid=JpoLlOD2t-R7HM&w=600&h=600&q=zapatillas&safe=active&client=safari&ved=2ahUKEwiD8-mMi5LwAhXKrpUCHeXNBo0QMygAegUIARDdAg' , '2021_04_23');
INSERT INTO productos (nombre, usuario_id, url, fecha_creacion) VALUES ('Adidas Ojotas Adilette Black', 14, 'https://www.google.com/imgres?imgurl=https%3A%2F%2Fassets.adidas.com%2Fimages%2Fw_600%2Cf_auto%2Cq_auto%2F7e03ecef81a64126bcecab58011051d8_9366%2FZapatillas_Superstar_Bold_Mujer_Blanco_FV3336_01_standard.jpg&imgrefurl=https%3A%2F%2Fwww.adidas.com.ar%2Fzapatillas-superstar-bold-mujer%2FFV3336.html&tbnid=Owe4MAQr14tRlM&vet=12ahUKEwiD8-mMi5LwAhXKrpUCHeXNBo0QMygAegUIARDdAg..i&docid=JpoLlOD2t-R7HM&w=600&h=600&q=zapatillas&safe=active&client=safari&ved=2ahUKEwiD8-mMi5LwAhXKrpUCHeXNBo0QMygAegUIARDdAg' ,'2021_04_24');
INSERT INTO productos (nombre, usuario_id, url, fecha_creacion) VALUES ('Vans Old Skool', 12,'https://www.google.com/imgres?imgurl=https%3A%2F%2Fassets.adidas.com%2Fimages%2Fw_600%2Cf_auto%2Cq_auto%2F7e03ecef81a64126bcecab58011051d8_9366%2FZapatillas_Superstar_Bold_Mujer_Blanco_FV3336_01_standard.jpg&imgrefurl=https%3A%2F%2Fwww.adidas.com.ar%2Fzapatillas-superstar-bold-mujer%2FFV3336.html&tbnid=Owe4MAQr14tRlM&vet=12ahUKEwiD8-mMi5LwAhXKrpUCHeXNBo0QMygAegUIARDdAg..i&docid=JpoLlOD2t-R7HM&w=600&h=600&q=zapatillas&safe=active&client=safari&ved=2ahUKEwiD8-mMi5LwAhXKrpUCHeXNBo0QMygAegUIARDdAg' , '2021_04_25');
INSERT INTO productos (nombre, usuario_id, url, fecha_creacion) VALUES ('Converse Chuck Taylor All-Star', 14,'https://www.google.com/imgres?imgurl=https%3A%2F%2Fassets.adidas.com%2Fimages%2Fw_600%2Cf_auto%2Cq_auto%2F7e03ecef81a64126bcecab58011051d8_9366%2FZapatillas_Superstar_Bold_Mujer_Blanco_FV3336_01_standard.jpg&imgrefurl=https%3A%2F%2Fwww.adidas.com.ar%2Fzapatillas-superstar-bold-mujer%2FFV3336.html&tbnid=Owe4MAQr14tRlM&vet=12ahUKEwiD8-mMi5LwAhXKrpUCHeXNBo0QMygAegUIARDdAg..i&docid=JpoLlOD2t-R7HM&w=600&h=600&q=zapatillas&safe=active&client=safari&ved=2ahUKEwiD8-mMi5LwAhXKrpUCHeXNBo0QMygAegUIARDdAg' , '2021_04_26');
INSERT INTO productos (nombre, usuario_id, url, fecha_creacion) VALUES ('Botines Nike Superfly 7 Blue', 13,'https://www.google.com/imgres?imgurl=https%3A%2F%2Fassets.adidas.com%2Fimages%2Fw_600%2Cf_auto%2Cq_auto%2F7e03ecef81a64126bcecab58011051d8_9366%2FZapatillas_Superstar_Bold_Mujer_Blanco_FV3336_01_standard.jpg&imgrefurl=https%3A%2F%2Fwww.adidas.com.ar%2Fzapatillas-superstar-bold-mujer%2FFV3336.html&tbnid=Owe4MAQr14tRlM&vet=12ahUKEwiD8-mMi5LwAhXKrpUCHeXNBo0QMygAegUIARDdAg..i&docid=JpoLlOD2t-R7HM&w=600&h=600&q=zapatillas&safe=active&client=safari&ved=2ahUKEwiD8-mMi5LwAhXKrpUCHeXNBo0QMygAegUIARDdAg' , '2021_04_26');
INSERT INTO productos (nombre, usuario_id, url, fecha_creacion) VALUES ('Alpargatas Stripes', 12,'https://www.google.com/imgres?imgurl=https%3A%2F%2Fassets.adidas.com%2Fimages%2Fw_600%2Cf_auto%2Cq_auto%2F7e03ecef81a64126bcecab58011051d8_9366%2FZapatillas_Superstar_Bold_Mujer_Blanco_FV3336_01_standard.jpg&imgrefurl=https%3A%2F%2Fwww.adidas.com.ar%2Fzapatillas-superstar-bold-mujer%2FFV3336.html&tbnid=Owe4MAQr14tRlM&vet=12ahUKEwiD8-mMi5LwAhXKrpUCHeXNBo0QMygAegUIARDdAg..i&docid=JpoLlOD2t-R7HM&w=600&h=600&q=zapatillas&safe=active&client=safari&ved=2ahUKEwiD8-mMi5LwAhXKrpUCHeXNBo0QMygAegUIARDdAg' , '2021_04_27');
INSERT INTO productos (nombre, usuario_id, url, fecha_creacion) VALUES ('Nike Air Joran 1 Mid Red', 11,'https://www.google.com/imgres?imgurl=https%3A%2F%2Fassets.adidas.com%2Fimages%2Fw_600%2Cf_auto%2Cq_auto%2F7e03ecef81a64126bcecab58011051d8_9366%2FZapatillas_Superstar_Bold_Mujer_Blanco_FV3336_01_standard.jpg&imgrefurl=https%3A%2F%2Fwww.adidas.com.ar%2Fzapatillas-superstar-bold-mujer%2FFV3336.html&tbnid=Owe4MAQr14tRlM&vet=12ahUKEwiD8-mMi5LwAhXKrpUCHeXNBo0QMygAegUIARDdAg..i&docid=JpoLlOD2t-R7HM&w=600&h=600&q=zapatillas&safe=active&client=safari&ved=2ahUKEwiD8-mMi5LwAhXKrpUCHeXNBo0QMygAegUIARDdAg' , '2021_04_28');
INSERT INTO productos (nombre, usuario_id, url, fecha_creacion) VALUES ('Adidas Yeezy 350 Zebra', 12,'https://www.google.com/imgres?imgurl=https%3A%2F%2Fassets.adidas.com%2Fimages%2Fw_600%2Cf_auto%2Cq_auto%2F7e03ecef81a64126bcecab58011051d8_9366%2FZapatillas_Superstar_Bold_Mujer_Blanco_FV3336_01_standard.jpg&imgrefurl=https%3A%2F%2Fwww.adidas.com.ar%2Fzapatillas-superstar-bold-mujer%2FFV3336.html&tbnid=Owe4MAQr14tRlM&vet=12ahUKEwiD8-mMi5LwAhXKrpUCHeXNBo0QMygAegUIARDdAg..i&docid=JpoLlOD2t-R7HM&w=600&h=600&q=zapatillas&safe=active&client=safari&ved=2ahUKEwiD8-mMi5LwAhXKrpUCHeXNBo0QMygAegUIARDdAg' , '2021_04_29');

SELECT * FROM productos;

INSERT INTO comentarios (usuario_id,producto_id,comentario,fecha_comentario) VALUES (11,1,'Las <%= zapatillas.nombre %> son las mejores zapatillas del mundo','2021_04_03');
INSERT INTO comentarios (usuario_id,producto_id,comentario,fecha_comentario) VALUES (12,1,'No me saco mas las <%= zapatillas.nombre %>','2021_04_03');
INSERT INTO comentarios (usuario_id,producto_id,comentario,fecha_comentario) VALUES (13,1,'Take my money, just give me the <%= zapatillas.nombre %>','2021_04_03');
INSERT INTO comentarios (usuario_id,producto_id,comentario,fecha_comentario) VALUES (14,1,'Juro tener 21 para comprar las <%= zapatillas.nombre %>','2021_04_03');

INSERT INTO comentarios (usuario_id,producto_id,comentario,fecha_comentario) VALUES (11,2,'Las <%= zapatillas.nombre %> son las mejores zapatillas del mundo','2021_04_03');
INSERT INTO comentarios (usuario_id,producto_id,comentario,fecha_comentario) VALUES (12,2,'No me saco mas las <%= zapatillas.nombre %>','2021_04_03');
INSERT INTO comentarios (usuario_id,producto_id,comentario,fecha_comentario) VALUES (13,2,'Take my money, just give me the <%= zapatillas.nombre %>','2021_04_03');
INSERT INTO comentarios (usuario_id,producto_id,comentario,fecha_comentario) VALUES (14,2,'Juro tener 21 para comprar las <%= zapatillas.nombre %>','2021_04_03');

INSERT INTO comentarios (usuario_id,producto_id,comentario,fecha_comentario) VALUES (11,3,'Las <%= zapatillas.nombre %> son las mejores zapatillas del mundo','2021_04_03');
INSERT INTO comentarios (usuario_id,producto_id,comentario,fecha_comentario) VALUES (12,3,'No me saco mas las <%= zapatillas.nombre %>','2021_04_03');
INSERT INTO comentarios (usuario_id,producto_id,comentario,fecha_comentario) VALUES (13,3,'Take my money, just give me the <%= zapatillas.nombre %>','2021_04_03');
INSERT INTO comentarios (usuario_id,producto_id,comentario,fecha_comentario) VALUES (14,3,'Juro tener 21 para comprar las <%= zapatillas.nombre %>','2021_04_03');

INSERT INTO comentarios (usuario_id,producto_id,comentario,fecha_comentario) VALUES (11,4,'Las <%= zapatillas.nombre %> son las mejores zapatillas del mundo','2021_04_03');
INSERT INTO comentarios (usuario_id,producto_id,comentario,fecha_comentario) VALUES (12,4,'No me saco mas las <%= zapatillas.nombre %>','2021_04_03');
INSERT INTO comentarios (usuario_id,producto_id,comentario,fecha_comentario) VALUES (13,4,'Take my money, just give me the <%= zapatillas.nombre %>','2021_04_03');
INSERT INTO comentarios (usuario_id,producto_id,comentario,fecha_comentario) VALUES (14,4,'Juro tener 21 para comprar las <%= zapatillas.nombre %>','2021_04_03');

INSERT INTO comentarios (usuario_id,producto_id,comentario,fecha_comentario) VALUES (11,5,'Las <%= zapatillas.nombre %> son las mejores zapatillas del mundo','2021_04_03');
INSERT INTO comentarios (usuario_id,producto_id,comentario,fecha_comentario) VALUES (12,5,'No me saco mas las <%= zapatillas.nombre %>','2021_04_03');
INSERT INTO comentarios (usuario_id,producto_id,comentario,fecha_comentario) VALUES (13,5,'Take my money, just give me the <%= zapatillas.nombre %>','2021_04_03');
INSERT INTO comentarios (usuario_id,producto_id,comentario,fecha_comentario) VALUES (14,5,'Juro tener 21 para comprar las <%= zapatillas.nombre %>','2021_04_03');
INSERT INTO comentarios (usuario_id,producto_id,comentario,fecha_comentario) VALUES (11,6,'Las <%= zapatillas.nombre %> son las mejores zapatillas del mundo','2021_04_03');
INSERT INTO comentarios (usuario_id,producto_id,comentario,fecha_comentario) VALUES (12,6,'No me saco mas las <%= zapatillas.nombre %>','2021_04_03');
INSERT INTO comentarios (usuario_id,producto_id,comentario,fecha_comentario) VALUES (13,6,'Take my money, just give me the <%= zapatillas.nombre %>','2021_04_03');
INSERT INTO comentarios (usuario_id,producto_id,comentario,fecha_comentario) VALUES (14,6,'Juro tener 21 para comprar las <%= zapatillas.nombre %>','2021_04_03');

INSERT INTO comentarios (usuario_id,producto_id,comentario,fecha_comentario) VALUES (11,7,'Las <%= zapatillas.nombre %> son las mejores zapatillas del mundo','2021_04_03');
INSERT INTO comentarios (usuario_id,producto_id,comentario,fecha_comentario) VALUES (12,7,'No me saco mas las <%= zapatillas.nombre %>','2021_04_03');
INSERT INTO comentarios (usuario_id,producto_id,comentario,fecha_comentario) VALUES (13,7,'Take my money, just give me the <%= zapatillas.nombre %>','2021_04_03');
INSERT INTO comentarios (usuario_id,producto_id,comentario,fecha_comentario) VALUES (14,7,'Juro tener 21 para comprar las <%= zapatillas.nombre %>','2021_04_03');

INSERT INTO comentarios (usuario_id,producto_id,comentario,fecha_comentario) VALUES (11,8,'Las <%= zapatillas.nombre %> son las mejores zapatillas del mundo','2021_04_03');
INSERT INTO comentarios (usuario_id,producto_id,comentario,fecha_comentario) VALUES (12,8,'No me saco mas las <%= zapatillas.nombre %>','2021_04_03');
INSERT INTO comentarios (usuario_id,producto_id,comentario,fecha_comentario) VALUES (13,8,'Take my money, just give me the <%= zapatillas.nombre %>','2021_04_03');
INSERT INTO comentarios (usuario_id,producto_id,comentario,fecha_comentario) VALUES (14,8,'Juro tener 21 para comprar las <%= zapatillas.nombre %>','2021_04_03');

INSERT INTO comentarios (usuario_id,producto_id,comentario,fecha_comentario) VALUES (11,9,'Las <%= zapatillas.nombre %> son las mejores zapatillas del mundo','2021_04_03');
INSERT INTO comentarios (usuario_id,producto_id,comentario,fecha_comentario) VALUES (12,9,'No me saco mas las <%= zapatillas.nombre %>','2021_04_03');
INSERT INTO comentarios (usuario_id,producto_id,comentario,fecha_comentario) VALUES (13,9,'Take my money, just give me the <%= zapatillas.nombre %>','2021_04_03');
INSERT INTO comentarios (usuario_id,producto_id,comentario,fecha_comentario) VALUES (14,9,'Juro tener 21 para comprar las <%= zapatillas.nombre %>','2021_04_03');

INSERT INTO comentarios (usuario_id,producto_id,comentario,fecha_comentario) VALUES (11,10,'Las <%= zapatillas.nombre %> son las mejores zapatillas del mundo','2021_04_03');
INSERT INTO comentarios (usuario_id,producto_id,comentario,fecha_comentario) VALUES (12,10,'No me saco mas las <%= zapatillas.nombre %>','2021_04_03');
INSERT INTO comentarios (usuario_id,producto_id,comentario,fecha_comentario) VALUES (13,10,'Take my money, just give me the <%= zapatillas.nombre %>','2021_04_03');
INSERT INTO comentarios (usuario_id,producto_id,comentario,fecha_comentario) VALUES (14,10,'Juro tener 21 para comprar las <%= zapatillas.nombre %>','2021_04_03');

SELECT * FROM comentarios;