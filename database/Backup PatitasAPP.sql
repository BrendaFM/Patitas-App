/*
SQLyog Ultimate v12.5.1 (64 bit)
MySQL - 10.4.22-MariaDB : Database - patitasapp
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`patitasapp` /*!40100 DEFAULT CHARACTER SET utf8mb4 */;

USE `patitasapp`;

/*Table structure for table `adopciones` */

DROP TABLE IF EXISTS `adopciones`;

CREATE TABLE `adopciones` (
  `idadopcion` int(11) NOT NULL AUTO_INCREMENT,
  `idpersona` int(11) NOT NULL,
  `idmascota` int(11) NOT NULL,
  `fechaadopcion` date NOT NULL,
  `fecharetorno` date DEFAULT NULL,
  PRIMARY KEY (`idadopcion`),
  KEY `fk_idpersona_adop` (`idpersona`),
  KEY `fk_idmascota_adop` (`idmascota`),
  CONSTRAINT `fk_idmascota_adop` FOREIGN KEY (`idmascota`) REFERENCES `mascotas` (`idmascota`),
  CONSTRAINT `fk_idpersona_adop` FOREIGN KEY (`idpersona`) REFERENCES `personas` (`idpersona`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4;

/*Data for the table `adopciones` */

insert  into `adopciones`(`idadopcion`,`idpersona`,`idmascota`,`fechaadopcion`,`fecharetorno`) values 
(1,3,1,'2022-02-10',NULL),
(2,5,4,'2018-04-01',NULL),
(3,5,5,'2019-08-15',NULL),
(4,1,11,'2021-07-10',NULL),
(5,10,15,'2022-01-15',NULL),
(6,8,20,'2022-03-01',NULL),
(7,6,22,'2022-03-27',NULL),
(8,1,3,'2022-04-11',NULL),
(10,8,23,'2022-04-11',NULL);

/*Table structure for table `animales` */

DROP TABLE IF EXISTS `animales`;

CREATE TABLE `animales` (
  `idanimal` int(11) NOT NULL AUTO_INCREMENT,
  `animal` varchar(30) NOT NULL,
  PRIMARY KEY (`idanimal`),
  UNIQUE KEY `uk_animal_anim` (`animal`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4;

/*Data for the table `animales` */

insert  into `animales`(`idanimal`,`animal`) values 
(2,'Gato'),
(1,'Perro');

/*Table structure for table `apoyo` */

DROP TABLE IF EXISTS `apoyo`;

CREATE TABLE `apoyo` (
  `idapoyo` int(11) NOT NULL AUTO_INCREMENT,
  `idpersona` int(11) NOT NULL,
  `idtipoapoyo` int(11) NOT NULL,
  `fechaapoyo` date NOT NULL,
  `cantidad` decimal(5,2) DEFAULT NULL,
  `descripcion` text NOT NULL,
  PRIMARY KEY (`idapoyo`),
  KEY `fk_tipoapoyo_ap` (`idtipoapoyo`),
  KEY `fk_idpersona_ap` (`idpersona`),
  CONSTRAINT `fk_idpersona_ap` FOREIGN KEY (`idpersona`) REFERENCES `personas` (`idpersona`),
  CONSTRAINT `fk_tipoapoyo_ap` FOREIGN KEY (`idtipoapoyo`) REFERENCES `tipoapoyos` (`idtipoapoyo`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8mb4;

/*Data for the table `apoyo` */

insert  into `apoyo`(`idapoyo`,`idpersona`,`idtipoapoyo`,`fechaapoyo`,`cantidad`,`descripcion`) values 
(1,10,1,'2017-09-12',250.00,'Comida para perros del albergue / ONGVIDA'),
(2,5,2,'2017-09-29',100.00,'apoyo de dinero'),
(3,5,3,'2018-01-12',NULL,'Medicamentos para perros'),
(4,3,2,'2018-06-01',300.00,'Apoyo económico'),
(5,7,3,'2018-11-11',NULL,'medicinas para las mascotas'),
(6,13,1,'2019-06-12',30.00,'apoyo de comida'),
(7,11,3,'2019-10-30',NULL,'abrigos para las mascotas'),
(8,13,1,'2020-08-30',100.00,'Comida para gatos - Niurka Castilla'),
(9,5,3,'2020-10-18',NULL,'Ayudar en campaña para Esterilizar perros - Veterinario'),
(10,7,2,'2020-04-26',150.00,'apoyo de dinero'),
(11,5,2,'2021-12-12',500.00,'Apoyo Económico'),
(12,9,3,'2022-01-05',NULL,'colaboracion de veterinario para tratamiendo de las macotas'),
(13,3,1,'2022-04-09',20.00,'comida para perro'),
(14,1,1,'2022-04-09',40.00,'comida para gatos'),
(15,2,2,'2022-04-09',100.00,'dinero para esterilizaciones.');

/*Table structure for table `eventos` */

DROP TABLE IF EXISTS `eventos`;

CREATE TABLE `eventos` (
  `idevento` int(11) NOT NULL AUTO_INCREMENT,
  `idmascota` int(11) NOT NULL,
  `idtipoevento` int(11) NOT NULL,
  `fechahora` date NOT NULL,
  `informacion` text DEFAULT NULL,
  PRIMARY KEY (`idevento`),
  KEY `fk_idmascota_event` (`idmascota`),
  KEY `fk_idtipoevento_event` (`idtipoevento`),
  CONSTRAINT `fk_idmascota_event` FOREIGN KEY (`idmascota`) REFERENCES `mascotas` (`idmascota`),
  CONSTRAINT `fk_idtipoevento_event` FOREIGN KEY (`idtipoevento`) REFERENCES `tipoeventos` (`idtipoevento`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4;

/*Data for the table `eventos` */

insert  into `eventos`(`idevento`,`idmascota`,`idtipoevento`,`fechahora`,`informacion`) values 
(1,1,4,'2016-01-15','Operación'),
(2,2,1,'2017-01-15','Contra la Rabia'),
(3,2,2,'2018-01-15','Visita al veterinario'),
(4,5,1,'2017-01-15','Vacuna por resfrío'),
(5,9,4,'2019-01-15','Operación'),
(6,9,3,'2020-01-15','Medicacion para la desparasitacion'),
(7,11,4,'2020-01-15','Operación'),
(8,12,1,'2020-01-15','Vacuna Polivalente'),
(9,3,4,'2022-04-09','Fractura en la pierna.');

/*Table structure for table `fotos` */

DROP TABLE IF EXISTS `fotos`;

CREATE TABLE `fotos` (
  `idfoto` int(11) NOT NULL AUTO_INCREMENT,
  `idmascota` int(11) NOT NULL,
  `ruta` varchar(100) NOT NULL,
  `comentariofoto` varchar(100) NOT NULL,
  PRIMARY KEY (`idfoto`),
  KEY `fk_idmascota_ft` (`idmascota`),
  CONSTRAINT `fk_idmascota_ft` FOREIGN KEY (`idmascota`) REFERENCES `mascotas` (`idmascota`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

/*Data for the table `fotos` */

/*Table structure for table `mascotas` */

DROP TABLE IF EXISTS `mascotas`;

CREATE TABLE `mascotas` (
  `idmascota` int(11) NOT NULL AUTO_INCREMENT,
  `idusuario` int(11) NOT NULL,
  `idraza` int(11) NOT NULL,
  `nombremascota` varchar(30) NOT NULL,
  `genero` char(1) NOT NULL,
  `fechanacimiento` date NOT NULL,
  `observaciones` text NOT NULL,
  `esterilizacion` char(1) NOT NULL,
  `estado` char(1) NOT NULL,
  `vive` char(1) NOT NULL,
  `apadrinado` char(1) NOT NULL,
  PRIMARY KEY (`idmascota`),
  KEY `fk_idusuario_masc` (`idusuario`),
  KEY `fk_idraza_masc` (`idraza`),
  CONSTRAINT `fk_idraza_masc` FOREIGN KEY (`idraza`) REFERENCES `razas` (`idraza`),
  CONSTRAINT `fk_idusuario_masc` FOREIGN KEY (`idusuario`) REFERENCES `usuarios` (`idusuario`)
) ENGINE=InnoDB AUTO_INCREMENT=24 DEFAULT CHARSET=utf8mb4;

/*Data for the table `mascotas` */

insert  into `mascotas`(`idmascota`,`idusuario`,`idraza`,`nombremascota`,`genero`,`fechanacimiento`,`observaciones`,`esterilizacion`,`estado`,`vive`,`apadrinado`) values 
(1,1,1,'Nacho','M','2016-04-12','descripcion','S','A','S','S'),
(2,1,31,'Alex','M','2016-08-17','descripcion','N','R','S','N'),
(3,2,31,'Danna','H','2017-12-21','descripcion','N','A','S','S'),
(4,1,6,'Copita','H','2017-07-03','descripcion','N','A','S','N'),
(5,2,8,'Bronko','M','2017-04-12','descripcion','S','A','S','S'),
(6,3,31,'Charlie','M','2018-04-12','descripcion','S','R','S','S'),
(7,2,1,'Rocky','M','2018-04-12','descripcion','S','R','S','N'),
(8,3,34,'Bella','H','2019-04-12','descripcion','N','R','S','S'),
(9,3,1,'Lola','H','2019-04-12','descripcion','S','R','N','N'),
(10,2,1,'Blanca','H','2020-04-12','descripcion','N','R','S','S'),
(11,1,31,'Mia','H','2020-04-12','descripcion','S','A','S','N'),
(12,3,1,'Balto','M','2020-04-12','descripcion','S','R','S','S'),
(13,1,1,'Peluchin','M','2020-08-17','descripcion','N','R','S','S'),
(14,2,31,'Lisa','H','2020-12-21','descripcion','N','R','S','N'),
(15,1,1,'Any','H','2020-07-03','descripcion','N','A','S','S'),
(16,3,60,'Cosmo','M','2021-04-12','descripcion','S','R','S','N'),
(17,3,1,'Mané','M','2021-04-12','descripcion','S','R','S','N'),
(18,2,60,'Max','M','2021-04-12','descripcion','S','R','N','S'),
(19,3,31,'Misha','H','2022-01-10','descripcion','S','R','S','N'),
(20,1,8,'Polita','H','2022-01-11','descripcion','S','A','S','S'),
(21,2,31,'Frida','H','2022-02-02','descripcion','N','R','S','S'),
(22,2,1,'Nina','H','2022-02-10','descripcion','S','A','S','N'),
(23,2,1,'Paco','M','2020-09-01','lo encontramos en el mercado.','N','A','S','N');

/*Table structure for table `padrinos` */

DROP TABLE IF EXISTS `padrinos`;

CREATE TABLE `padrinos` (
  `idpadrino` int(11) NOT NULL AUTO_INCREMENT,
  `idpersona` int(11) NOT NULL,
  `idmascota` int(11) NOT NULL,
  `fecha` date NOT NULL,
  PRIMARY KEY (`idpadrino`),
  UNIQUE KEY `uk_idmascota_pad` (`idmascota`),
  KEY `fk_idpersona_pad` (`idpersona`),
  CONSTRAINT `fk_idmascota_pad` FOREIGN KEY (`idmascota`) REFERENCES `mascotas` (`idmascota`),
  CONSTRAINT `fk_idpersona_pad` FOREIGN KEY (`idpersona`) REFERENCES `personas` (`idpersona`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4;

/*Data for the table `padrinos` */

insert  into `padrinos`(`idpadrino`,`idpersona`,`idmascota`,`fecha`) values 
(1,5,6,'2017-02-02'),
(2,8,3,'2018-01-19'),
(3,14,13,'2018-02-12'),
(4,14,8,'2019-01-10'),
(5,6,12,'2019-01-11'),
(6,8,20,'2020-03-17'),
(7,10,10,'2021-02-14'),
(8,11,15,'2021-03-14'),
(9,5,5,'2022-03-12'),
(10,3,1,'2022-04-09');

/*Table structure for table `personas` */

DROP TABLE IF EXISTS `personas`;

CREATE TABLE `personas` (
  `idpersona` int(11) NOT NULL AUTO_INCREMENT,
  `apellidos` varchar(30) NOT NULL,
  `nombres` varchar(30) NOT NULL,
  `tipodoc` char(1) NOT NULL,
  `numdoc` char(8) NOT NULL,
  `direccion` varchar(40) NOT NULL,
  `telefono` char(9) DEFAULT NULL,
  `logeado` char(1) NOT NULL,
  PRIMARY KEY (`idpersona`),
  UNIQUE KEY `uk_numdoc_per` (`numdoc`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8mb4;

/*Data for the table `personas` */

insert  into `personas`(`idpersona`,`apellidos`,`nombres`,`tipodoc`,`numdoc`,`direccion`,`telefono`,`logeado`) values 
(1,'Boada Ramos','Luis Anderson','D','12345678','Av España 123','987654321','S'),
(2,'Belleza Torres','Anderson David','D','37194023','Jr 28 De Julio 123','972648117','S'),
(3,'Francia Minaya','Brenda Andrea','D','74720939','Av Artemio Molina 454','964918123','S'),
(4,'Francia Minaya','Jhon Edward','D','22244400','Chincha Alta','999000333','S'),
(5,'Roberto Carlos','Rey Sanches','D','39581934','Jr 28 De Julio 18','978195723','N'),
(6,'Juan Fernando','Quispe Guerra','C','81571482','Los Cedros 134','961841923','N'),
(7,'Adriana Carolina','De la Cruz','D','28195012','Leoncio Prado 186','946172931','N'),
(8,'Efraín Marcelo','Gonzales Perez','C','12481593','Av. Salaverry 359','989548933','N'),
(9,'Jesus Antonio','Navarro Hernandez','D','61306814','Jr Bolivar 115','917246237','N'),
(10,'Flavio','Torres Boada','C','12121233','San Antonio de Salas - Chincha Baja','975542123','N'),
(11,'Junior','Roque Montes','D','33212121','San Antonio de Salas - Chincha Baja','945454578','N'),
(12,'Nestor','Tasayco Torres','C','44221133','Chincha Alta','955575321','N'),
(13,'Niurka','Castilla','C','55778899','Santa Luisa - Chincha Baja','964522145','N'),
(14,'Maryory','Mendoza Matias','D','22145533','Lomo Largo - Sunampe','957575753','N'),
(15,'Boada Belleza','Anderson Luis','D','75464554','Plaza de Armas de Chincha Alta','989685641','N');

/*Table structure for table `razas` */

DROP TABLE IF EXISTS `razas`;

CREATE TABLE `razas` (
  `idraza` int(11) NOT NULL AUTO_INCREMENT,
  `raza` varchar(30) NOT NULL,
  `idanimal` int(11) NOT NULL,
  PRIMARY KEY (`idraza`),
  UNIQUE KEY `uk_raza_rz` (`raza`),
  KEY `fk_idanimal_rz` (`idanimal`),
  CONSTRAINT `fk_idanimal_rz` FOREIGN KEY (`idanimal`) REFERENCES `animales` (`idanimal`)
) ENGINE=InnoDB AUTO_INCREMENT=61 DEFAULT CHARSET=utf8mb4;

/*Data for the table `razas` */

insert  into `razas`(`idraza`,`raza`,`idanimal`) values 
(1,'Perro mestizo',1),
(2,'Bull terrier',1),
(3,'Bulldog americano',1),
(4,'Bulldog frances',1),
(5,'Bulldog inglés',1),
(6,'Chihuahua',1),
(7,'Cocker',1),
(8,'Dalmata',1),
(9,'Dóberman',1),
(10,'Dogo argentino',1),
(11,'Dogo de burdeos',1),
(12,'Fox terrier',1),
(13,'French poodle',1),
(14,'Gran dánes',1),
(15,'Husky siberiano',1),
(16,'Labrador retriever',1),
(17,'Mastín español',1),
(18,'Mastín inglés',1),
(19,'Mastín tibetano',1),
(20,'Paston alemán',1),
(21,'Pekinés',1),
(22,'Perro salchicha',1),
(23,'Pinscher',1),
(24,'Rottweiler',1),
(25,'Schipperke',1),
(26,'Schnauzer',1),
(27,'Shar pei',1),
(28,'Terrier alemán',1),
(29,'Shiba inu',1),
(30,'Shih tzu',1),
(31,'Gato Mestizo',2),
(32,'Americano de pelo corto',2),
(33,'Angora turco',2),
(34,'Azul ruso',2),
(35,'Balinés',2),
(36,'Bengala',2),
(37,'Birmano',2),
(38,'Bombay',2),
(39,'Bosque de Noruega',2),
(40,'Británico de pelo largo',2),
(41,'British Shorthair',2),
(42,'Burmés',2),
(43,'Chartreux',2),
(44,'Curl americano',2),
(45,'Don Sphynx',2),
(46,'Esfinge',2),
(47,'Europeo de pelo corto',2),
(48,'Exótico',2),
(49,'Fold escocés',2),
(50,'Habana brown',2),
(51,'Himalayoo',2),
(52,'Kinkalow',2),
(53,'Maine Coon',2),
(54,'Manx',2),
(55,'Munchkin',2),
(56,'Oriental',2),
(57,'Persa',2),
(58,'Ragamuffin',2),
(59,'Savannah',2),
(60,'Siames',2);

/*Table structure for table `tipoapoyos` */

DROP TABLE IF EXISTS `tipoapoyos`;

CREATE TABLE `tipoapoyos` (
  `idtipoapoyo` int(11) NOT NULL AUTO_INCREMENT,
  `tipoapoyo` varchar(20) NOT NULL,
  PRIMARY KEY (`idtipoapoyo`),
  UNIQUE KEY `uk_tipoapoyo_tapoyo` (`tipoapoyo`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4;

/*Data for the table `tipoapoyos` */

insert  into `tipoapoyos`(`idtipoapoyo`,`tipoapoyo`) values 
(1,'Comida'),
(2,'Monetario'),
(3,'Otros');

/*Table structure for table `tipoeventos` */

DROP TABLE IF EXISTS `tipoeventos`;

CREATE TABLE `tipoeventos` (
  `idtipoevento` int(11) NOT NULL AUTO_INCREMENT,
  `tipoevento` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`idtipoevento`),
  UNIQUE KEY `uk_evento_tipo` (`tipoevento`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4;

/*Data for the table `tipoeventos` */

insert  into `tipoeventos`(`idtipoevento`,`tipoevento`) values 
(2,'Chequeo de rutina'),
(3,'Desparasitación'),
(4,'Intervencion'),
(5,'Otros'),
(1,'Vacunacion');

/*Table structure for table `usuarios` */

DROP TABLE IF EXISTS `usuarios`;

CREATE TABLE `usuarios` (
  `idusuario` int(11) NOT NULL AUTO_INCREMENT,
  `idpersona` int(11) NOT NULL,
  `nombreusuario` varchar(15) NOT NULL,
  `clave` varchar(100) NOT NULL,
  `fechaalta` date NOT NULL,
  `fechabaja` date DEFAULT NULL,
  `estado` char(1) NOT NULL,
  `nivelacceso` char(1) NOT NULL,
  PRIMARY KEY (`idusuario`),
  UNIQUE KEY `uk_idpersona_user` (`idpersona`),
  UNIQUE KEY `uk_nombreusuario_user` (`nombreusuario`),
  CONSTRAINT `fk_idpersona_user` FOREIGN KEY (`idpersona`) REFERENCES `personas` (`idpersona`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4;

/*Data for the table `usuarios` */

insert  into `usuarios`(`idusuario`,`idpersona`,`nombreusuario`,`clave`,`fechaalta`,`fechabaja`,`estado`,`nivelacceso`) values 
(1,1,'Luis','$2y$10$dvgzm2Jmh0u98DerZSGkX.QH5rVqqD/ctSC3UCgYNj4jFh0CgR5mi','2022-04-09',NULL,'A','C'),
(2,2,'Anderson','$2y$10$dvgzm2Jmh0u98DerZSGkX.QH5rVqqD/ctSC3UCgYNj4jFh0CgR5mi','2022-04-09',NULL,'A','C'),
(3,3,'Brenda','$2y$10$dvgzm2Jmh0u98DerZSGkX.QH5rVqqD/ctSC3UCgYNj4jFh0CgR5mi','2022-04-09',NULL,'A','C'),
(4,4,'Jhon','$2y$10$dvgzm2Jmh0u98DerZSGkX.QH5rVqqD/ctSC3UCgYNj4jFh0CgR5mi','2022-04-09',NULL,'A','U');

/*Table structure for table `voluntarios` */

DROP TABLE IF EXISTS `voluntarios`;

CREATE TABLE `voluntarios` (
  `idvoluntario` int(11) NOT NULL AUTO_INCREMENT,
  `idpersona` int(11) NOT NULL,
  `fechahora` date NOT NULL,
  `descripcionvol` text NOT NULL,
  PRIMARY KEY (`idvoluntario`),
  KEY `fk_idpersona_vol` (`idpersona`),
  CONSTRAINT `fk_idpersona_vol` FOREIGN KEY (`idpersona`) REFERENCES `personas` (`idpersona`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4;

/*Data for the table `voluntarios` */

insert  into `voluntarios`(`idvoluntario`,`idpersona`,`fechahora`,`descripcionvol`) values 
(1,6,'2017-11-23','Ayudo con la limpieza'),
(2,9,'2018-04-17','Cambio de cama de mascotas'),
(3,12,'2018-09-12','Construir casa para las mascotas'),
(4,6,'2019-05-09','Baños a las mascotas'),
(5,7,'2020-03-15','Cambio de cama de mascotas'),
(6,11,'2020-08-19','Ayudo con la limpieza'),
(7,13,'2011-04-05','Construir casa para las mascotas'),
(8,6,'2021-12-16','Baños a las mascotas'),
(9,13,'2022-08-29','Ayudo con la limpieza'),
(10,9,'2022-10-30','Construir casa para las mascotas'),
(11,10,'2022-04-09','Limpieza.'),
(12,14,'2022-04-11','Paseo a los perros');

/* Procedure structure for procedure `spu_adopciones_eliminar` */

/*!50003 DROP PROCEDURE IF EXISTS  `spu_adopciones_eliminar` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `spu_adopciones_eliminar`(
    IN _idmascota            INT
)
BEGIN
        DELETE FROM adopciones
        WHERE idmascota = _idmascota;

        UPDATE mascotas SET
        estado = 'R'
        WHERE idmascota = _idmascota;
END */$$
DELIMITER ;

/* Procedure structure for procedure `spu_adopciones_registrar` */

/*!50003 DROP PROCEDURE IF EXISTS  `spu_adopciones_registrar` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `spu_adopciones_registrar`(
	IN _idpersona			INT,
	IN _idmascota			INT
)
BEGIN
		INSERT INTO adopciones(idpersona, idmascota, fechaadopcion, fecharetorno)
			VALUES (_idpersona, _idmascota, CURDATE(), NULL);
			
		UPDATE mascotas SET
		estado = 'A'
		WHERE idmascota = _idmascota;
END */$$
DELIMITER ;

/* Procedure structure for procedure `spu_adopcion_listar_tabla` */

/*!50003 DROP PROCEDURE IF EXISTS  `spu_adopcion_listar_tabla` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `spu_adopcion_listar_tabla`()
BEGIN
    SELECT mascotas.idmascota , mascotas.nombremascota, personas.apellidos, personas.nombres, fechaadopcion, fecharetorno, mascotas.estado FROM adopciones
    INNER JOIN personas ON personas.idpersona = adopciones.idpersona
    INNER JOIN mascotas ON mascotas.idmascota = adopciones.idmascota
    WHERE estado = 'A';
END */$$
DELIMITER ;

/* Procedure structure for procedure `spu_apoyo_listar` */

/*!50003 DROP PROCEDURE IF EXISTS  `spu_apoyo_listar` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `spu_apoyo_listar`()
BEGIN
	SELECT personas.idpersona, personas.apellidos, personas.nombres, apoyo.fechaapoyo, apoyo.cantidad, apoyo.descripcion
	FROM apoyo
		INNER JOIN personas ON personas.idpersona = apoyo.idpersona;
END */$$
DELIMITER ;

/* Procedure structure for procedure `spu_apoyo_registrar` */

/*!50003 DROP PROCEDURE IF EXISTS  `spu_apoyo_registrar` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `spu_apoyo_registrar`(
	IN _idpersona		INT,
	IN _idtipoapoyo 	INT,
	IN _cantidad 		INT,
	IN _descripcion		TEXT
)
BEGIN
	INSERT INTO apoyo (idpersona, idtipoapoyo, fechaapoyo, cantidad, descripcion)
		VALUES (_idpersona, _idtipoapoyo, CURDATE(), _cantidad, _descripcion);
END */$$
DELIMITER ;

/* Procedure structure for procedure `spu_colaborador_registro` */

/*!50003 DROP PROCEDURE IF EXISTS  `spu_colaborador_registro` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `spu_colaborador_registro`(
	IN _idpersona INT, 
	IN _nombreusuario VARCHAR(15), 
	IN _clave VARCHAR(100)
)
BEGIN
	INSERT INTO usuarios (idpersona, nombreusuario, clave, fechaalta, fechabaja, estado, nivelusuario)
		VALUES (_idpersona, _nombreusuario, _clave, CURDATE(), NULL, 'A', 'C');
	
	UPDATE personas SET
		logeado = 'S'
	WHERE idpersona = _idpersona;
END */$$
DELIMITER ;

/* Procedure structure for procedure `spu_esterilizar_mascota` */

/*!50003 DROP PROCEDURE IF EXISTS  `spu_esterilizar_mascota` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `spu_esterilizar_mascota`(
    IN _idmascota INT
)
BEGIN
    UPDATE mascotas SET
        esterilizacion = 'S'
    WHERE idmascota = _idmascota;
END */$$
DELIMITER ;

/* Procedure structure for procedure `spu_eventos_listar` */

/*!50003 DROP PROCEDURE IF EXISTS  `spu_eventos_listar` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `spu_eventos_listar`()
BEGIN
	SELECT idevento, mascotas.nombremascota, tipoeventos.tipoevento, fechahora, informacion FROM eventos
	INNER JOIN tipoeventos ON tipoeventos.idtipoevento = eventos.idtipoevento
	INNER JOIN mascotas ON mascotas.idmascota = eventos.idmascota;
END */$$
DELIMITER ;

/* Procedure structure for procedure `spu_eventos_registrar` */

/*!50003 DROP PROCEDURE IF EXISTS  `spu_eventos_registrar` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `spu_eventos_registrar`(
	IN _idmascota 		INT,
	IN _idtipoevento	INT,
	IN _informacion		TEXT
)
BEGIN
	INSERT INTO eventos (idmascota, idtipoevento, fechahora ,informacion)
		VALUES (_idmascota, _idtipoevento, CURDATE() ,_informacion);
END */$$
DELIMITER ;

/* Procedure structure for procedure `spu_grafico_adoptados` */

/*!50003 DROP PROCEDURE IF EXISTS  `spu_grafico_adoptados` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `spu_grafico_adoptados`()
BEGIN
SELECT COUNT(animales.animal) AS "Total Adoptados", YEAR(fechaadopcion) AS "Año"
        FROM adopciones
    INNER JOIN mascotas ON mascotas.idmascota = adopciones.idmascota
    INNER JOIN razas ON razas.idraza = mascotas.idraza
    INNER JOIN animales ON animales.idanimal = razas.idanimal
    GROUP BY YEAR(fechaadopcion);
END */$$
DELIMITER ;

/* Procedure structure for procedure `spu_grafico_adoptados_meses` */

/*!50003 DROP PROCEDURE IF EXISTS  `spu_grafico_adoptados_meses` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `spu_grafico_adoptados_meses`()
BEGIN
SELECT
    CASE
        WHEN MONTH(fechaadopcion) = '1' THEN 'Enero'
        WHEN MONTH(fechaadopcion) = '2' THEN 'Febrero'
        WHEN MONTH(fechaadopcion) = '3' THEN 'Marzo'
        WHEN MONTH(fechaadopcion) = '4' THEN 'Abril'
        WHEN MONTH(fechaadopcion) = '5' THEN 'Mayo'
        WHEN MONTH(fechaadopcion) = '6' THEN 'Junio'
        WHEN MONTH(fechaadopcion) = '7' THEN 'Julio'
        WHEN MONTH(fechaadopcion) = '8' THEN 'Agosto'
        WHEN MONTH(fechaadopcion) = '9' THEN 'Septiembre'
        WHEN MONTH(fechaadopcion) = '10' THEN 'Octubre'
        WHEN MONTH(fechaadopcion) = '11' THEN 'Noviembre'
        WHEN MONTH(fechaadopcion) = '12' THEN 'Diciembre'
        END 'Mes'
    ,COUNT(animales.animal) AS "Total Adoptados"
        FROM adopciones 
    INNER JOIN mascotas ON mascotas.idmascota = adopciones.idmascota
    INNER JOIN razas ON razas.idraza = mascotas.idraza
    INNER JOIN animales ON animales.idanimal = razas.idanimal
    WHERE YEAR(fechaadopcion) = YEAR(CURRENT_DATE())
    GROUP BY MONTH(fechaadopcion)
    ORDER BY fechaadopcion;
END */$$
DELIMITER ;

/* Procedure structure for procedure `spu_grafico_kilogramos` */

/*!50003 DROP PROCEDURE IF EXISTS  `spu_grafico_kilogramos` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `spu_grafico_kilogramos`()
BEGIN
SELECT  tipoapoyos.tipoapoyo, SUM(cantidad) AS "Total Kg." , YEAR(fechaapoyo) AS "AÑO"
        FROM apoyo
    INNER JOIN tipoapoyos ON tipoapoyos.idtipoapoyo = apoyo.idtipoapoyo
    WHERE tipoapoyo = "Comida"
    GROUP BY YEAR(fechaapoyo);
END */$$
DELIMITER ;

/* Procedure structure for procedure `spu_grafico_soles` */

/*!50003 DROP PROCEDURE IF EXISTS  `spu_grafico_soles` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `spu_grafico_soles`()
BEGIN
SELECT  tipoapoyos.tipoapoyo, SUM(cantidad) AS "Total Soles" , YEAR(fechaapoyo) AS "AÑO"
        FROM apoyo
    INNER JOIN tipoapoyos ON tipoapoyos.idtipoapoyo = apoyo.idtipoapoyo
    WHERE tipoapoyo = "Monetario"
    GROUP BY YEAR(fechaapoyo);
END */$$
DELIMITER ;

/* Procedure structure for procedure `spu_mascotas_adoptadas_listar` */

/*!50003 DROP PROCEDURE IF EXISTS  `spu_mascotas_adoptadas_listar` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `spu_mascotas_adoptadas_listar`()
BEGIN
	SELECT mascotas.nombremascota, razas.raza, animales.animal,
		CASE
			WHEN genero = 'H' THEN 'Hembra'
			WHEN genero = "M" THEN 'Macho'           
		END 'genero'
	, mascotas.fechanacimiento, mascotas.estado, mascotas.vive, 
	CASE
			WHEN esterilizacion = 'S' THEN 'Sí'
			WHEN esterilizacion = "N" THEN 'No'           
	END 'esterilizacion' 
	FROM mascotas
	INNER JOIN razas ON razas.idraza = mascotas.idraza
	INNER JOIN animales ON animales.idanimal = razas.idanimal
	WHERE estado = "A" AND vive = "S";
END */$$
DELIMITER ;

/* Procedure structure for procedure `spu_mascotas_cargar_adopciones` */

/*!50003 DROP PROCEDURE IF EXISTS  `spu_mascotas_cargar_adopciones` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `spu_mascotas_cargar_adopciones`()
BEGIN
    SELECT * 
        FROM mascotas 
        INNER JOIN razas ON razas.idraza = mascotas.idraza
        INNER JOIN animales ON animales.idanimal = razas.idanimal
        WHERE estado = "R" ORDER BY animales.animal;
END */$$
DELIMITER ;

/* Procedure structure for procedure `spu_mascotas_cargar_eventos` */

/*!50003 DROP PROCEDURE IF EXISTS  `spu_mascotas_cargar_eventos` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `spu_mascotas_cargar_eventos`()
BEGIN
	SELECT * 
		FROM mascotas 
		INNER JOIN razas ON razas.idraza = mascotas.idraza
		INNER JOIN animales ON animales.idanimal = razas.idanimal
		order by animales.animal; 
END */$$
DELIMITER ;

/* Procedure structure for procedure `spu_mascotas_cargar_padrinos` */

/*!50003 DROP PROCEDURE IF EXISTS  `spu_mascotas_cargar_padrinos` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `spu_mascotas_cargar_padrinos`()
BEGIN
	select * 
		from mascotas 
		inner join razas on razas.idraza = mascotas.idraza
		inner join animales ON animales.idanimal = razas.idanimal 
		where apadrinado = "N" order by animales.animal; 
end */$$
DELIMITER ;

/* Procedure structure for procedure `spu_mascotas_eliminar` */

/*!50003 DROP PROCEDURE IF EXISTS  `spu_mascotas_eliminar` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `spu_mascotas_eliminar`(
	IN _idmascota			INT
)
BEGIN
		UPDATE mascotas SET
		vive = "N" 
		WHERE idmascota = _idmascota;		
END */$$
DELIMITER ;

/* Procedure structure for procedure `spu_mascotas_esterilizacion` */

/*!50003 DROP PROCEDURE IF EXISTS  `spu_mascotas_esterilizacion` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `spu_mascotas_esterilizacion`(
    IN _esterilizacion         CHAR(1)
)
BEGIN
    SELECT mascotas.nombremascota, razas.raza, 
    CASE
			WHEN idanimal = 1 THEN 'Perro'
			WHEN idanimal = 2 THEN 'Gato'           
		END 'idanimal'
    ,
		CASE
			WHEN genero = 'H' THEN 'Hembra'
			WHEN genero = "M" THEN 'Macho'           
		END 'genero'
	, mascotas.fechanacimiento, mascotas.estado, mascotas.vive, 
	CASE
			WHEN esterilizacion = 'S' THEN 'Sí'
			WHEN esterilizacion = "N" THEN 'No'           
	END 'esterilizacion' 
	FROM mascotas
    INNER JOIN razas ON razas.idraza = mascotas.idraza
    WHERE esterilizacion = _esterilizacion; 
END */$$
DELIMITER ;

/* Procedure structure for procedure `spu_mascotas_genero` */

/*!50003 DROP PROCEDURE IF EXISTS  `spu_mascotas_genero` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `spu_mascotas_genero`(
    IN _genero         CHAR(1)
)
BEGIN
    SELECT mascotas.nombremascota, razas.raza, 
    CASE
			WHEN idanimal = 1 THEN 'Perro'
			WHEN idanimal = 2 THEN 'Gato'           
		END 'idanimal'
    ,
		CASE
			WHEN genero = 'H' THEN 'Hembra'
			WHEN genero = "M" THEN 'Macho'           
		END 'genero'
	, mascotas.fechanacimiento, mascotas.estado, mascotas.vive, 
	CASE
			WHEN esterilizacion = 'S' THEN 'Sí'
			WHEN esterilizacion = "N" THEN 'No'           
	END 'esterilizacion' 
	FROM mascotas
    INNER JOIN razas ON razas.idraza = mascotas.idraza
    WHERE genero = _genero; 
END */$$
DELIMITER ;

/* Procedure structure for procedure `spu_mascotas_listar` */

/*!50003 DROP PROCEDURE IF EXISTS  `spu_mascotas_listar` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `spu_mascotas_listar`()
BEGIN
	SELECT idmascota, mascotas.nombremascota, razas.raza, animales.animal,
		CASE
			WHEN genero = 'H' THEN 'Hembra'
			WHEN genero = "M" THEN 'Macho'           
		END 'genero'
	, mascotas.fechanacimiento, mascotas.estado, mascotas.vive, 
	CASE
			WHEN esterilizacion = 'S' THEN 'Sí'
			WHEN esterilizacion = "N" THEN 'No'           
	END 'esterilizacion' 
	FROM mascotas
	INNER JOIN razas ON razas.idraza = mascotas.idraza
	INNER JOIN animales ON animales.idanimal = razas.idanimal
	WHERE estado = "R" AND vive = "S" ORDER BY nombremascota;
END */$$
DELIMITER ;

/* Procedure structure for procedure `spu_mascotas_registro` */

/*!50003 DROP PROCEDURE IF EXISTS  `spu_mascotas_registro` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `spu_mascotas_registro`(
	IN _idusuario 			INT,
	IN _idraza 				INT,
	IN _nombremascota		VARCHAR(30),
	IN _genero				CHAR(1),
	IN _fechanacimiento		DATE,
	IN _observaciones		TEXT,
	IN _esterilizacion 		CHAR(1)
)
BEGIN
	INSERT INTO mascotas (idusuario, idraza, nombremascota, genero, fechanacimiento, observaciones, esterilizacion, estado, vive, apadrinado)
		VALUES (_idusuario, _idraza, _nombremascota, _genero, _fechanacimiento, _observaciones, _esterilizacion, "R", "S", "N");
END */$$
DELIMITER ;

/* Procedure structure for procedure `spu_mascotas_tipo` */

/*!50003 DROP PROCEDURE IF EXISTS  `spu_mascotas_tipo` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `spu_mascotas_tipo`(
    IN _idanimal         INT
)
BEGIN
    SELECT mascotas.nombremascota, razas.raza, 
    CASE
			WHEN idanimal = 1 THEN 'Perro'
			WHEN idanimal = 2 THEN 'Gato'           
		END 'idanimal'
    ,
		CASE
			WHEN genero = 'H' THEN 'Hembra'
			WHEN genero = "M" THEN 'Macho'           
		END 'genero'
	, mascotas.fechanacimiento, mascotas.estado, mascotas.vive, 
	CASE
			WHEN esterilizacion = 'S' THEN 'Sí'
			WHEN esterilizacion = "N" THEN 'No'           
	END 'esterilizacion' 
	FROM mascotas
    INNER JOIN razas ON razas.idraza = mascotas.idraza
    WHERE idanimal = _idanimal; 
END */$$
DELIMITER ;

/* Procedure structure for procedure `spu_padrinos_listar` */

/*!50003 DROP PROCEDURE IF EXISTS  `spu_padrinos_listar` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `spu_padrinos_listar`()
BEGIN
	SELECT  idpadrino, fecha, 
	CASE
		WHEN mascotas.vive = "S" THEN 'Sí'
		WHEN  mascotas.vive= "N" THEN 'No'           
	END 'vive',
	 personas.idpersona,personas.apellidos, animales.animal, personas.nombres, personas.telefono, mascotas.nombremascota
	FROM padrinos
		INNER JOIN personas ON personas.idpersona = padrinos.idpersona
		INNER JOIN mascotas ON mascotas.idmascota = padrinos.idmascota
		INNER join razas ON razas.idraza = mascotas.idraza
		inner join animales on animales.idanimal = razas.idanimal
	order by personas.apellidos;
END */$$
DELIMITER ;

/* Procedure structure for procedure `spu_padrinos_registrar` */

/*!50003 DROP PROCEDURE IF EXISTS  `spu_padrinos_registrar` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `spu_padrinos_registrar`(
	IN _idpersona		INT,
	IN _idmascota 		INT
)
BEGIN
	UPDATE mascotas SET
		apadrinado = 'S'
	WHERE idmascota = _idmascota;
	
	INSERT INTO padrinos (idpersona, idmascota, fecha)
		VALUES (_idpersona, _idmascota, CURDATE());
END */$$
DELIMITER ;

/* Procedure structure for procedure `spu_padrino_eliminar` */

/*!50003 DROP PROCEDURE IF EXISTS  `spu_padrino_eliminar` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `spu_padrino_eliminar`(
	IN _idpadrino INT
)
BEGIN
	DELETE FROM padrinos WHERE idpadrino = _idpadrino;
END */$$
DELIMITER ;

/* Procedure structure for procedure `spu_personas_cargar` */

/*!50003 DROP PROCEDURE IF EXISTS  `spu_personas_cargar` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `spu_personas_cargar`()
BEGIN
	SELECT * FROM personas
	ORDER BY apellidos;
END */$$
DELIMITER ;

/* Procedure structure for procedure `spu_personas_listar` */

/*!50003 DROP PROCEDURE IF EXISTS  `spu_personas_listar` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `spu_personas_listar`()
BEGIN
	SELECT * FROM personas
	WHERE logeado = "N"
	ORDER BY apellidos;
END */$$
DELIMITER ;

/* Procedure structure for procedure `spu_personas_registro` */

/*!50003 DROP PROCEDURE IF EXISTS  `spu_personas_registro` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `spu_personas_registro`(
	IN _apellidos 	VARCHAR(30),
	IN _nombres		VARCHAR(30),
	IN _tipodoc		CHAR(1),
	IN _numdoc		CHAR(8),
	IN _direccion	VARCHAR(40),
	IN _telefono	CHAR(9)
)
BEGIN
	INSERT INTO personas(apellidos, nombres, tipodoc, numdoc, direccion, telefono, logeado)VALUES
			(_apellidos, _nombres, _tipodoc, _numdoc, _direccion, _telefono, "N");
END */$$
DELIMITER ;

/* Procedure structure for procedure `spu_razas_listar` */

/*!50003 DROP PROCEDURE IF EXISTS  `spu_razas_listar` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `spu_razas_listar`(IN _idanimal INT)
BEGIN
    SELECT * FROM razas
    WHERE idanimal = _idanimal;
END */$$
DELIMITER ;

/* Procedure structure for procedure `spu_usuarios_login` */

/*!50003 DROP PROCEDURE IF EXISTS  `spu_usuarios_login` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `spu_usuarios_login`(
	IN _nombreusuario 	VARCHAR(15)
)
BEGIN
	SELECT * 
		FROM usuarios
	WHERE nombreusuario = _nombreusuario;
END */$$
DELIMITER ;

/* Procedure structure for procedure `spu_usuarios_registro` */

/*!50003 DROP PROCEDURE IF EXISTS  `spu_usuarios_registro` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `spu_usuarios_registro`(
	IN _idpersona INT, 
	IN _nombreusuario VARCHAR(15), 
	IN _clave VARCHAR(100)
)
BEGIN
	INSERT INTO usuarios (idpersona, nombreusuario, clave, fechaalta, fechabaja, estado, nivelusuario)
		VALUES (_idpersona, _nombreusuario, _clave, CURDATE(), NULL, 'A', 'U');
		
	UPDATE personas SET
		logeado = 'S'
	WHERE idpersona = _idpersona;
END */$$
DELIMITER ;

/* Procedure structure for procedure `spu_voluntarios_listar` */

/*!50003 DROP PROCEDURE IF EXISTS  `spu_voluntarios_listar` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `spu_voluntarios_listar`()
BEGIN
	SELECT personas.idpersona, personas.apellidos, personas.nombres, voluntarios.descripcionvol, voluntarios.fechahora
	FROM voluntarios
		INNER JOIN personas ON personas.idpersona = voluntarios.idpersona;
END */$$
DELIMITER ;

/* Procedure structure for procedure `spu_voluntarios_registrar` */

/*!50003 DROP PROCEDURE IF EXISTS  `spu_voluntarios_registrar` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `spu_voluntarios_registrar`(
	IN _idpersona			INT,
	IN _descripcionvol 		TEXT
)
BEGIN
	INSERT INTO voluntarios (idpersona, fechahora, descripcionvol)
		VALUES (_idpersona, CURDATE(), _descripcionvol);
END */$$
DELIMITER ;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
