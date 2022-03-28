CREATE DATABASE PATITASAPP;
USE PATITASAPP;

CREATE TABLE personas
(
	idpersona	INT AUTO_INCREMENT PRIMARY KEY,
	apellidos	VARCHAR(30)	NOT NULL,
	nombres 		VARCHAR(30)	NOT NULL,
	tipodoc		CHAR(1)		NOT NULL,
	numdoc		CHAR(8)		NOT NULL,
	direccion	VARCHAR(40)	NOT NULL,
	telefono		CHAR(9)		NULL
)ENGINE = INNODB;

INSERT INTO personas (apellidos, nombres, tipodoc, numdoc, direccion, telefono)
VALUES 	('Boada Ramos','Luis Anderson', 'D', 12345678, 'Av España 123', 987654321),
			('Belleza Torres','Anderson David', 'D', 37194023, 'Jr 28 De Julio 123', 972648117),
			('Francia Minaya','Brenda Andrea', 'D', 23950696, 'AV La Molina 160', 964918123),
			('De Luque','Jesus Samuel', 'D', 28493919, 'AV Esperanza 23 ', 962716321);
			
SELECT * FROM personas;

CREATE TABLE usuarios
(
	idusuario		INT AUTO_INCREMENT PRIMARY KEY,
	idpersona		INT 				NOT NULL,
	nombreusuario	VARCHAR(15)		NOT NULL,
	clave				VARCHAR(100)	NOT NULL,
	fechaalta 		DATE   			NOT NULL,	
	fechabaja 		DATE				NULL,		
	estado 			CHAR(1)			NOT NULL,	
	fotografia		VARCHAR(70) 	NULL,
	CONSTRAINT fk_idpersona_per FOREIGN KEY (idpersona) REFERENCES personas(idpersona),
	CONSTRAINT uk_nombreusuario UNIQUE (nombreusuario)
) ENGINE = INNODB;
 	
INSERT INTO usuarios (idpersona, nombreusuario, clave, fechaalta, fechabaja, estado, fotografia) 
VALUES 	(1, 'Luis7','$2y$10$dvgzm2Jmh0u98DerZSGkX.QH5rVqqD/ctSC3UCgYNj4jFh0CgR5mi', CURDATE(), NULL, 'A', NULL),
			(2, 'Anderson','$2y$10$dvgzm2Jmh0u98DerZSGkX.QH5rVqqD/ctSC3UCgYNj4jFh0CgR5mi', CURDATE(), NULL, 'I', NULL),
			(3, 'Brenda','$2y$10$dvgzm2Jmh0u98DerZSGkX.QH5rVqqD/ctSC3UCgYNj4jFh0CgR5mi', CURDATE(), NULL, 'A', NULL);
 
SELECT * FROM usuarios;



CREATE TABLE animales
(
	idanimal	INT AUTO_INCREMENT PRIMARY KEY,
	animal		VARCHAR(30)	NOT NULL,
	CONSTRAINT uk_animal_ani UNIQUE (animal)
) ENGINE = INNODB;

INSERT INTO animales (animal) 
VALUES 	('Perro'),
			('Gato');
 
SELECT * FROM animales;


CREATE TABLE razas 
(
	idraza		INT AUTO_INCREMENT PRIMARY KEY,
	raza		VARCHAR(30)	NOT NULL,
	idanimal	INT 		NOT NULL,
	CONSTRAINT uk_raza_ra UNIQUE (raza),
	CONSTRAINT fk_idanimal_ra FOREIGN KEY (idanimal) REFERENCES animales(idanimal)
)ENGINE = INNODB;

INSERT INTO razas (raza, idanimal) 
VALUES 	('Pastor alemán',1),
			('Común europeo',2),
			('Mestizo',1),
			('Ragdoll',2),
			('Labrador retrieve',1);
 
SELECT * FROM razas;


CREATE TABLE mascotas
(
	idmascota		INT AUTO_INCREMENT PRIMARY KEY,
	idusuario 		INT 		NOT NULL,
	idraza			INT 		NOT NULL,	
	nombremascota		VARCHAR(30)	NOT NULL,
	genero			CHAR(1)		NOT NULL,
	fechanacimiento 	DATE 		NOT NULL,
	observaciones		TEXT		NOT NULL,
	esterilizacion		CHAR(1)		NOT NULL,
	estado			CHAR(1)		NOT NULL,
	vive			CHAR(1)		NOT NULL,
	CONSTRAINT fk_idusuario_mas FOREIGN KEY (idusuario) REFERENCES usuarios(idusuario),
	CONSTRAINT fk_idraza_mas FOREIGN KEY (idraza) REFERENCES razas(idraza)
) ENGINE = INNODB;

INSERT INTO mascotas (idusuario, idraza, nombremascota, genero, fechanacimiento, observaciones, esterilizacion, estado, vive) 
VALUES 	(3, 3, 'Nacho', 'M', '2020-04-12', 'descripcion muchotexto', 'S', 'A', 'S'), -- adoptado
			(1, 2, 'Paco Rex', 'M', '2021-08-17', 'descripcion2', 'N', 'A', 'S'), -- adoptado
			(2, 1, 'Danna', 'H','2021-12-21', 'descripcion3', 'N', 'R', 'N'), -- refugiado
			(1, 2, 'Mishifu', 'H', '2021-07-03', 'descripcion4', 'N', 'A', 'S'); -- refugiado
INSERT INTO mascotas (idusuario, idraza, nombremascota, genero, fechanacimiento, observaciones, esterilizacion, estado, vive) 
VALUES (3, 1, "Nacho2", "M", '2020-04-12', 'descripcion muchotexto', 'S', 'A', 'S'); -- adoptado
INSERT INTO mascotas (idusuario, idraza, nombremascota, genero, fechanacimiento, observaciones, esterilizacion, estado, vive) 
VALUES (3, 1, "Luis", "M", '2020-04-12', 'descripcion muchotexto', 'S', 'R', 'S'), -- refugiado
		(3, 1, "Anderson", "M", '2020-04-12', 'descripcion muchotexto', 'S', 'R', 'S'); -- refugiado


SELECT * FROM mascotas;


CREATE TABLE adopciones
(
	idadopcion		INT AUTO_INCREMENT PRIMARY KEY,
	idpersona		INT 		NOT NULL,
	idmascota		INT 		NOT NULL,
	fechahoraadopcion	DATETIME	NOT NULL,
	fechahoraretorno	DATETIME	NULL,
	CONSTRAINT fk_idpersona_adop FOREIGN KEY (idpersona) REFERENCES personas(idpersona),
	CONSTRAINT fk_idmascota_adop FOREIGN KEY (idmascota) REFERENCES mascotas(idmascota)
) ENGINE = INNODB;

INSERT INTO adopciones (idpersona, idmascota, fechahoraadopcion, fechahoraretorno) 
VALUES 	(1, 4, '2022-01-10', NULL);

SELECT * FROM adopciones;


CREATE TABLE tipoeventos
(	
	idtipoevento		INT AUTO_INCREMENT PRIMARY KEY,
	tipoevento		VARCHAR(20),
	CONSTRAINT uk_evento_tip UNIQUE (tipoevento)
) ENGINE = INNODB;

INSERT INTO tipoeventos (tipoevento) 
VALUES 	('Vacunacion'),
	('Intervencion');

SELECT * FROM tipoeventos;


CREATE TABLE eventos
(
	idevento		INT AUTO_INCREMENT PRIMARY KEY,
	idmascota		INT 		NOT NULL,
	idtipoevento		INT 		NOT NULL,
	fechahora 		DATETIME	NOT NULL,
	informacion		TEXT		NULL,
	CONSTRAINT fk_idmascota_det FOREIGN KEY (idmascota) REFERENCES mascotas(idmascota),
	CONSTRAINT fk_idtipoevento_det FOREIGN KEY (idtipoevento) REFERENCES tipoeventos(idtipoevento)
) ENGINE = INNODB;

INSERT INTO eventos (idmascota, idtipoevento, fechahora, informacion)
VALUES 	(1, 1, '2021-01-15', 'Contra la Rabia'),
			(1, 1, '2022-01-15', 'Contra la Rabia');

SELECT * FROM eventos;


CREATE TABLE fotos
(
	idfoto			INT 		AUTO_INCREMENT PRIMARY KEY,
	idmascota 		INT 		NOT NULL,
	ruta			VARCHAR(100)	NOT NULL,
	comentariofoto		VARCHAR(100)	NOT NULL,
	CONSTRAINT fk_idmascota_fo FOREIGN KEY (idmascota) REFERENCES mascotas(idmascota)
)ENGINE = INNODB;

INSERT INTO fotos (idmascota, ruta, comentariofoto)
VALUES 	(3, 'img/2022/3/perritos.jpg', 'Comentariofotos2'),
			(2, 'ruta112233445566', 'Comentariofotos2');

SELECT * FROM fotos;


CREATE TABLE padrinos
(
	idpadrino 		INT AUTO_INCREMENT PRIMARY KEY,
	idpersona 		INT 		NOT NULL,
	idmascota		INT 		NOT NULL,
	fechaalta		DATETIME	NOT NULL,
	fechabaja		DATETIME	NULL,
	CONSTRAINT fk_idpersona_pad FOREIGN KEY (idpersona) REFERENCES  personas(idpersona),
	CONSTRAINT fk_idmascota_pad FOREIGN KEY (idmascota) REFERENCES mascotas(idmascota)
)ENGINE = INNODB;

INSERT INTO padrinos (idpersona, idmascota, fechaalta, fechabaja)
VALUES 	(4, 4, '2022-02-10', NULL);

SELECT * FROM padrinos;


CREATE TABLE voluntarios
(
	idvoluntario 		INT AUTO_INCREMENT PRIMARY KEY,
	idpersona			INT 			NOT NULL,
	fechahora 			DATETIME 	NOT NULL,
	descripcionvol		TEXT			NOT NULL,
	CONSTRAINT fk_idpersona_vo FOREIGN KEY (idpersona) REFERENCES personas(idpersona)
)ENGINE = INNODB;

INSERT INTO voluntarios (idpersona, fechahora, descripcionvol)
VALUES 	(4, '2022-02-20', 'Apoyo con la limpieza');

SELECT * FROM voluntarios;


CREATE TABLE tipoapoyo
(
	idtipoapoyo 		INT AUTO_INCREMENT PRIMARY KEY,
	tipoapoyo			VARCHAR(20)		NOT NULL
)ENGINE = INNODB;

INSERT INTO tipoapoyo (tipoapoyo) 
VALUES 	('Comida'),
			('Monetario');

SELECT * FROM tipoapoyo;


CREATE TABLE apoyo 
(
	idapoyo				INT AUTO_INCREMENT PRIMARY KEY,
	idpersona			INT 		NOT NULL,
	idtipoapoyo			INT 		NOT NULL,
	fechaapoyo			DATETIME	NOT NULL,
	cantidad				INT		NOT NULL,
	descripcion 		TEXT		NOT NULL,
	CONSTRAINT fk_tipoapoyo_ap FOREIGN KEY (idtipoapoyo) REFERENCES tipoapoyo(idtipoapoyo),
	CONSTRAINT fk_idpersona_ap FOREIGN KEY (idpersona) REFERENCES personas(idpersona)
)ENGINE = INNODB;

INSERT INTO apoyo (idpersona, idtipoapoyo, fechaapoyo, cantidad, descripcion)
VALUES 	(4, 2, '2022-02-25', 100, 'descripcion apoyo');

SELECT * FROM apoyo;