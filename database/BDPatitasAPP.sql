CREATE DATABASE PATITASAPP;
USE PATITASAPP;

CREATE TABLE personas
(
	idpersona	INT AUTO_INCREMENT PRIMARY KEY,
	apellidos	VARCHAR(30)	NOT NULL,
	nombres 	VARCHAR(30)	NOT NULL,
	tipodoc		CHAR(1)		NOT NULL,
	numdoc		CHAR(8)		NOT NULL,
	direccion	VARCHAR(40)	NOT NULL,
	telefono	CHAR(9)		NULL,
	logeado		CHAR(1)		NOT NULL,
	voluntario 	CHAR(1)		NOT NULL,
	CONSTRAINT uk_numdoc_per UNIQUE (numdoc)
)ENGINE = INNODB;

CREATE TABLE usuarios
(
	idusuario		INT 			AUTO_INCREMENT PRIMARY KEY,
	idpersona		INT 			NOT NULL,
	nombreusuario	VARCHAR(15)		NOT NULL,
	clave			VARCHAR(100)	NOT NULL,
	fechaalta 		DATE   			NOT NULL,	
	fechabaja 		DATE			NULL,		
	estado 			CHAR(1)			NOT NULL,	
	nivelacceso		CHAR(1)		    NOT NULL, -- C: colaborador / U: usuario	
	CONSTRAINT fk_idpersona_user FOREIGN KEY (idpersona) REFERENCES personas(idpersona),
	CONSTRAINT uk_idpersona_user UNIQUE (idpersona), 
	CONSTRAINT uk_nombreusuario_user UNIQUE (nombreusuario)
) ENGINE = INNODB;
 	
CREATE TABLE animales
(
	idanimal	INT AUTO_INCREMENT PRIMARY KEY,
	animal		VARCHAR(30)	NOT NULL,
	CONSTRAINT uk_animal_anim UNIQUE (animal)
) ENGINE = INNODB;

CREATE TABLE razas 
(
	idraza		INT AUTO_INCREMENT PRIMARY KEY,
	raza		VARCHAR(30)	NOT NULL,
	idanimal	INT 		NOT NULL,
	CONSTRAINT uk_raza_rz UNIQUE (raza),
	CONSTRAINT fk_idanimal_rz FOREIGN KEY (idanimal) REFERENCES animales(idanimal)
)ENGINE = INNODB;

CREATE TABLE mascotas
(
	idmascota			INT 		AUTO_INCREMENT PRIMARY KEY,
	idusuario 			INT 		NOT NULL,
	idraza				INT 		NOT NULL,	
	nombremascota			VARCHAR(30)	NOT NULL,
	genero				CHAR(1)		NOT NULL,
	fechanacimiento 		DATE 		NOT NULL,
	observaciones			TEXT		NOT NULL,
	esterilizacion			CHAR(1)		NOT NULL,
	estado				CHAR(1)		NOT NULL,
	vive				CHAR(1)		NOT NULL,
	apadrinado			CHAR(1)		NOT NULL,
	fotografia			VARCHAR(100)	NOT NULL,
	CONSTRAINT fk_idusuario_masc FOREIGN KEY (idusuario) REFERENCES usuarios(idusuario),
	CONSTRAINT fk_idraza_masc FOREIGN KEY (idraza) REFERENCES razas(idraza)
) ENGINE = INNODB;

CREATE TABLE adopciones
(
	idadopcion		INT 	AUTO_INCREMENT PRIMARY KEY,
	idpersona		INT 	NOT NULL,
	idmascota		INT 	NOT NULL,
	fechaadopcion	DATE	NOT NULL,
	fecharetorno	DATE	NULL,
	CONSTRAINT fk_idpersona_adop FOREIGN KEY (idpersona) REFERENCES personas(idpersona),
	CONSTRAINT fk_idmascota_adop FOREIGN KEY (idmascota) REFERENCES mascotas(idmascota)
) ENGINE = INNODB;

CREATE TABLE tipoeventos
(	
	idtipoevento		INT AUTO_INCREMENT PRIMARY KEY,
	tipoevento			VARCHAR(20),
	CONSTRAINT uk_evento_tipo UNIQUE (tipoevento)
) ENGINE = INNODB;

CREATE TABLE eventos
(
	idevento		INT 		AUTO_INCREMENT PRIMARY KEY,
	idmascota		INT 		NOT NULL,
	idtipoevento	INT 		NOT NULL,
	fechahora 		DATE 		NOT NULL,
	informacion		TEXT		NULL,
	CONSTRAINT fk_idmascota_event FOREIGN KEY (idmascota) REFERENCES mascotas(idmascota),
	CONSTRAINT fk_idtipoevento_event FOREIGN KEY (idtipoevento) REFERENCES tipoeventos(idtipoevento)
) ENGINE = INNODB;

CREATE TABLE fotos
(
	idfoto			INT 			AUTO_INCREMENT PRIMARY KEY,
	idmascota 		INT 			NOT NULL,
	ruta			VARCHAR(100)		NOT NULL,
	comentariofoto	VARCHAR(100)	NOT NULL,
	CONSTRAINT fk_idmascota_ft FOREIGN KEY (idmascota) REFERENCES mascotas(idmascota)
)ENGINE = INNODB;

CREATE TABLE padrinos
(
	idpadrino 		INT 		AUTO_INCREMENT PRIMARY KEY,
	idpersona 		INT 		NOT NULL,
	idmascota		INT 		NOT NULL,
	fecha			DATE		NOT NULL,
	CONSTRAINT fk_idpersona_pad FOREIGN KEY (idpersona) REFERENCES  personas(idpersona),
	CONSTRAINT fk_idmascota_pad FOREIGN KEY (idmascota) REFERENCES mascotas(idmascota),
	CONSTRAINT uk_idmascota_pad UNIQUE (idmascota)
)ENGINE = INNODB;

CREATE TABLE voluntarios
(
	idvoluntario 		INT 			AUTO_INCREMENT PRIMARY KEY,
	idpersona		INT 			NOT NULL,
	fechainicio 		DATE 	 		NOT NULL,
	fechafin 		DATE 	 		NOT NULL,
	descripcionvol		TEXT			NOT NULL,
	CONSTRAINT fk_idpersona_vol FOREIGN KEY (idpersona) REFERENCES personas(idpersona)
)ENGINE = INNODB;

CREATE TABLE tipoapoyos
(
	idtipoapoyo 		INT 			AUTO_INCREMENT PRIMARY KEY,
	tipoapoyo			VARCHAR(20)		NOT NULL,
	CONSTRAINT uk_tipoapoyo_tapoyo UNIQUE (tipoapoyo)
)ENGINE = INNODB;

CREATE TABLE donaciones
(
	iddonacion			INT 			AUTO_INCREMENT PRIMARY KEY,
	idpersona			INT 			NOT NULL,
	idtipoapoyo			INT 			NOT NULL,
	fechaapoyo			DATE 			NOT NULL,
	cantidad			DECIMAL(5,2) 	NULL,
	descripcion 		TEXT			NOT NULL,
	CONSTRAINT fk_tipoapoyo_do FOREIGN KEY (idtipoapoyo) REFERENCES tipoapoyos(idtipoapoyo),
	CONSTRAINT fk_idpersona_do FOREIGN KEY (idpersona) REFERENCES personas(idpersona)
)ENGINE = INNODB;

CREATE TABLE mascotasperdidas
(
	idmascotaperdida		INT 		AUTO_INCREMENT PRIMARY KEY,
	idusuario 				INT 		NOT NULL,
	idraza					INT 		NOT NULL,	
	genero					CHAR(1)	NOT NULL,
	observaciones			TEXT		NOT NULL,
	ubicacion				TEXT		NOT NULL,
	fotografia				VARCHAR(100)	NOT NULL,
	fecha 					DATE 		NOT NULL,
	CONSTRAINT fk_idusuario_masp FOREIGN KEY (idusuario) REFERENCES usuarios(idusuario),
	CONSTRAINT fk_idraza_masp FOREIGN KEY (idraza) REFERENCES razas(idraza)
) ENGINE = INNODB;

  