/*
SQLyog Ultimate v12.5.1 (64 bit)
MySQL - 10.4.20-MariaDB : Database - patitasapp
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
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4;

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
(10,8,23,'2022-04-11',NULL),
(11,3,27,'2022-05-13',NULL);

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

/*Table structure for table `donaciones` */

DROP TABLE IF EXISTS `donaciones`;

CREATE TABLE `donaciones` (
  `iddonacion` int(11) NOT NULL AUTO_INCREMENT,
  `idpersona` int(11) NOT NULL,
  `idtipoapoyo` int(11) NOT NULL,
  `fechaapoyo` date NOT NULL,
  `cantidad` decimal(5,2) DEFAULT NULL,
  `descripcion` text NOT NULL,
  PRIMARY KEY (`iddonacion`),
  KEY `fk_tipoapoyo_do` (`idtipoapoyo`),
  KEY `fk_idpersona_do` (`idpersona`),
  CONSTRAINT `fk_idpersona_ap` FOREIGN KEY (`idpersona`) REFERENCES `personas` (`idpersona`),
  CONSTRAINT `fk_tipoapoyo_ap` FOREIGN KEY (`idtipoapoyo`) REFERENCES `tipoapoyos` (`idtipoapoyo`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8mb4;

/*Data for the table `donaciones` */

insert  into `donaciones`(`iddonacion`,`idpersona`,`idtipoapoyo`,`fechaapoyo`,`cantidad`,`descripcion`) values 
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
(15,2,2,'2022-04-09',100.00,'dinero para esterilizaciones.'),
(16,13,1,'2022-04-19',200.00,'Comida para perro'),
(17,1,2,'2022-05-09',100.00,'Dono 100 soles'),
(18,7,2,'2022-05-09',200.00,'Dono 200 soles');

/*Table structure for table `duenoencontrado` */

DROP TABLE IF EXISTS `duenoencontrado`;

CREATE TABLE `duenoencontrado` (
  `iddueno` int(11) NOT NULL AUTO_INCREMENT,
  `idpersona` int(11) NOT NULL,
  `idmascotaperdida` int(11) NOT NULL,
  `fecha` date NOT NULL,
  PRIMARY KEY (`iddueno`),
  KEY `fk_idpersona_due` (`idpersona`),
  KEY `fk_idmascotaperdida_due` (`idmascotaperdida`),
  CONSTRAINT `fk_idmascotaperdida_due` FOREIGN KEY (`idmascotaperdida`) REFERENCES `mascotasperdidas` (`idmascotaperdida`),
  CONSTRAINT `fk_idpersona_due` FOREIGN KEY (`idpersona`) REFERENCES `personas` (`idpersona`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4;

/*Data for the table `duenoencontrado` */

insert  into `duenoencontrado`(`iddueno`,`idpersona`,`idmascotaperdida`,`fecha`) values 
(1,8,2,'2022-05-09'),
(2,8,5,'2022-05-09'),
(3,2,9,'2022-05-09');

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
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4;

/*Data for the table `eventos` */

insert  into `eventos`(`idevento`,`idmascota`,`idtipoevento`,`fechahora`,`informacion`) values 
(1,1,2,'2022-05-10','Estuvo tranquilo al ser vacunado.'),
(2,10,2,'2022-05-10','Estuvo agresiva pero luego se calmó.'),
(3,20,3,'2022-05-10','Estuvo calmada en todo momento.');

/*Table structure for table `gastos` */

DROP TABLE IF EXISTS `gastos`;

CREATE TABLE `gastos` (
  `idgastos` int(11) NOT NULL AUTO_INCREMENT,
  `idusuario` int(11) NOT NULL,
  `idtipoapoyo` int(11) NOT NULL,
  `fecha` date NOT NULL,
  `cantidadsalida` decimal(5,2) DEFAULT NULL,
  `descripcion` text NOT NULL,
  PRIMARY KEY (`idgastos`),
  KEY `fk_tipoapoyo_gas` (`idtipoapoyo`),
  KEY `fk_idusuario_gas` (`idusuario`),
  CONSTRAINT `fk_idusuario_gas` FOREIGN KEY (`idusuario`) REFERENCES `usuarios` (`idusuario`),
  CONSTRAINT `fk_tipoapoyo_gas` FOREIGN KEY (`idtipoapoyo`) REFERENCES `tipoapoyos` (`idtipoapoyo`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4;

/*Data for the table `gastos` */

insert  into `gastos`(`idgastos`,`idusuario`,`idtipoapoyo`,`fecha`,`cantidadsalida`,`descripcion`) values 
(1,1,1,'2022-05-10',30.00,'Desayuno'),
(2,2,1,'2022-05-10',30.00,'Almuerzo'),
(3,3,1,'2022-05-10',30.00,'Cena'),
(4,2,1,'2022-05-10',1.00,'Para perrito rescatado'),
(5,1,1,'2022-05-10',1.00,'Para 3 gatos rescatados'),
(6,1,2,'2022-05-10',50.00,'Platos para comida'),
(7,2,2,'2022-05-10',100.00,'Cama para perro'),
(8,3,2,'2022-05-10',120.00,'Medicinas para perros adultos'),
(9,2,2,'2022-05-10',150.00,'Casas para gatos'),
(10,1,2,'2022-05-10',200.00,'Cirugia para gato'),
(11,3,2,'2022-05-10',40.00,'Madera para casa de perro.');

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
  `fotografia` varchar(100) NOT NULL,
  PRIMARY KEY (`idmascota`),
  KEY `fk_idusuario_masc` (`idusuario`),
  KEY `fk_idraza_masc` (`idraza`),
  CONSTRAINT `fk_idraza_masc` FOREIGN KEY (`idraza`) REFERENCES `razas` (`idraza`),
  CONSTRAINT `fk_idusuario_masc` FOREIGN KEY (`idusuario`) REFERENCES `usuarios` (`idusuario`)
) ENGINE=InnoDB AUTO_INCREMENT=28 DEFAULT CHARSET=utf8mb4;

/*Data for the table `mascotas` */

insert  into `mascotas`(`idmascota`,`idusuario`,`idraza`,`nombremascota`,`genero`,`fechanacimiento`,`observaciones`,`esterilizacion`,`estado`,`vive`,`apadrinado`,`fotografia`) values 
(1,1,1,'Nacho','M','2016-04-12','descripcion','S','A','S','N','20220425072330.jpg'),
(2,1,31,'Alex','M','2016-08-17','descripcion','S','R','S','N','20220425072331.jpg'),
(3,2,31,'Danna','H','2017-12-21','descripcion','N','A','S','N','20220425072332.jpg'),
(4,1,6,'Copita','H','2017-07-03','descripcion','N','A','S','N','20220425072333.jpg'),
(5,2,8,'Bronko','M','2017-04-12','descripcion','S','A','S','N','20220425072334.jpg'),
(6,3,31,'Charlie','M','2018-04-12','descripcion','S','R','S','S','20220425072335.jpg'),
(7,2,1,'Rocky','M','2022-03-12','descripcion','S','R','S','N','20220425072336.jpg'),
(8,3,34,'Bella','H','2019-04-12','descripcion','N','R','S','S','20220425072337.jpg'),
(9,3,1,'Lola','H','2019-04-12','descripcion','S','R','N','N','20220425072338.jpg'),
(10,2,1,'Blanca','H','2020-04-12','descripcion','N','R','S','S','20220425072339.jpg'),
(11,1,31,'Mia','H','2020-04-12','descripcion','S','A','S','N','20220425072340.jpg'),
(12,3,1,'Balto','M','2020-04-12','descripcion','S','R','S','S','20220425072341.jpg'),
(13,1,1,'Peluchin','M','2020-08-17','descripcion','N','R','S','S','20220425072342.jpg'),
(14,2,31,'Lisa','H','2020-12-21','descripcion','N','R','S','N','20220425072343.jpg'),
(15,1,1,'Any','H','2020-07-03','descripcion','N','A','S','N','20220425072344.jpg'),
(16,3,60,'Cosmo','M','2021-04-12','descripcion','S','R','S','N','20220425072345.jpg'),
(17,3,1,'Mané','M','2021-04-12','descripcion','S','R','S','N','20220425072346.jpg'),
(18,2,60,'Max','M','2021-04-12','descripcion','S','R','N','S','20220425072347.jpg'),
(19,3,31,'Misha','H','2022-01-10','descripcion','S','R','S','N','20220425072348.jpg'),
(20,1,8,'Polita','H','2022-01-11','descripcion','S','A','S','N','20220425072349.jpg'),
(21,2,31,'Frida','H','2022-02-02','descripcion','N','R','S','S','20220425072350.jpg'),
(22,2,1,'Nina','H','2022-02-10','descripcion','S','A','S','N','20220425072351.jpg'),
(23,2,1,'Paco','M','2020-09-01','lo encontramos en el mercado.','N','A','S','N','20220425072352.jpg'),
(24,1,4,'Iron-man','M','2022-01-05','Jugueton','N','R','S','S','20220425072353.jpg'),
(25,2,1,'Peluche','M','2022-01-06','Prueba','N','R','S','N','20220425072354.jpg'),
(26,1,31,'Cleopatra','H','2021-08-17','se duerme mucho','N','R','S','N','20220427061845.jpg'),
(27,1,31,'Cremita','H','2022-01-03','gato pequeño','N','A','S','N','20220513061843.jpg');

/*Table structure for table `mascotasperdidas` */

DROP TABLE IF EXISTS `mascotasperdidas`;

CREATE TABLE `mascotasperdidas` (
  `idmascotaperdida` int(11) NOT NULL AUTO_INCREMENT,
  `idusuario` int(11) NOT NULL,
  `idraza` int(11) NOT NULL,
  `nombretemp` varchar(30) NOT NULL,
  `genero` char(1) NOT NULL,
  `observaciones` text NOT NULL,
  `ubicacion` text NOT NULL,
  `fotografia` varchar(100) NOT NULL,
  `fecha` date NOT NULL,
  `recuperado` char(1) NOT NULL,
  PRIMARY KEY (`idmascotaperdida`),
  KEY `fk_idusuario_masp` (`idusuario`),
  KEY `fk_idraza_masp` (`idraza`),
  CONSTRAINT `fk_idraza_masp` FOREIGN KEY (`idraza`) REFERENCES `razas` (`idraza`),
  CONSTRAINT `fk_idusuario_masp` FOREIGN KEY (`idusuario`) REFERENCES `usuarios` (`idusuario`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4;

/*Data for the table `mascotasperdidas` */

insert  into `mascotasperdidas`(`idmascotaperdida`,`idusuario`,`idraza`,`nombretemp`,`genero`,`observaciones`,`ubicacion`,`fotografia`,`fecha`,`recuperado`) values 
(2,1,1,'Paco','M','Esta lastimado de la patita','https://goo.gl/maps/5X4egvfJTsT3bj4i7','20220425041631.jpg','2022-04-25','S'),
(5,2,1,'Firulais','M','El perro se ve desorientado','https://goo.gl/maps/wKY2Wo2KUsxC19ZTA','20220425061847.jpg','2022-04-25','S'),
(6,2,1,'Dog','M','Encontrado en el parque y tenia un collar con el nombre del dueño. ','https://www.google.com.pe/maps/@-13.526422,-76.1315688,15.21z/data=!4m2!7m1!2e1?hl=es-419','20220504021405.jpg','2022-05-04','N'),
(8,1,39,'Gris','M','Se encontro en la plaza de armas de Grocio Prado','https://goo.gl/maps/jZcgrQM3DV7rPm266','20220509051700.jpg','2022-05-09','N'),
(9,1,31,'Pelusa','H','Se encontro en la Plaza de Armas de Grocio Prado','https://goo.gl/maps/jZcgrQM3DV7rPm266','20220509051741.jpg','2022-05-09','S'),
(10,1,31,'Cat','H','Se encontro en Grocio Prado','https://goo.gl/maps/jZcgrQM3DV7rPm266','20220509051724.jpg','2022-05-09','N'),
(11,1,1,'Negro','M','estaba deambulando cerca de la parroquia','https://goo.gl/maps/PgLHKyWU3qWqFV8f7','20220513061832.jpg','2022-05-13','N');

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
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8mb4;

/*Data for the table `padrinos` */

insert  into `padrinos`(`idpadrino`,`idpersona`,`idmascota`,`fecha`) values 
(1,5,6,'2017-02-02'),
(3,14,13,'2018-02-12'),
(4,14,8,'2019-01-10'),
(5,6,12,'2019-01-11'),
(6,8,20,'2020-03-17'),
(7,10,10,'2021-02-14'),
(8,11,15,'2021-03-14'),
(9,5,5,'2022-03-12');

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
  `voluntario` char(1) NOT NULL,
  PRIMARY KEY (`idpersona`),
  UNIQUE KEY `uk_numdoc_per` (`numdoc`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8mb4;

/*Data for the table `personas` */

insert  into `personas`(`idpersona`,`apellidos`,`nombres`,`tipodoc`,`numdoc`,`direccion`,`telefono`,`logeado`,`voluntario`) values 
(1,'Boada Ramos','Luis Anderson','D','12345678','Av España 123','987654321','S','S'),
(2,'Belleza Torres','Anderson David','D','37194023','Jr 28 De Julio 123','972648117','S','N'),
(3,'Francia Minaya','Brenda Andrea','D','74720939','Av Artemio Molina 454','964918123','S','N'),
(4,'Francia Minaya','Jhon Edward','D','22244400','Chincha Alta','999000333','S','N'),
(5,'Roberto Carlos','Rey Sanches','D','39581934','Jr 28 De Julio 18','978195723','N','N'),
(6,'Juan Fernando','Quispe Guerra','C','81571482','Los Cedros 134','961841923','N','S'),
(7,'Adriana Carolina','De la Cruz','D','28195012','Leoncio Prado 186','946172931','S','N'),
(8,'Efraín Marcelo','Gonzales Perez','C','12481593','Av. Salaverry 359','989548933','S','N'),
(9,'Jesus Antonio','Navarro Hernandez','D','61306814','Jr Bolivar 115','917246237','S','N'),
(10,'Flavio','Torres Boada','C','12121233','San Antonio de Salas - Chincha Baja','975542123','N','N'),
(11,'Junior','Roque Montes','D','33212121','San Antonio de Salas - Chincha Baja','945454578','N','N'),
(12,'Nestor','Tasayco Torres','C','44221133','Chincha Alta','955575321','S','N'),
(13,'Niurka','Castilla','C','55778899','Santa Luisa - Chincha Baja','964522145','S','S'),
(14,'Maryory','Mendoza Matias','D','22145533','Lomo Largo - Sunampe','957575753','S','N');

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
  `tipoevento` varchar(100) NOT NULL,
  `fechainicio` date NOT NULL,
  `fechatermino` date DEFAULT NULL,
  PRIMARY KEY (`idtipoevento`),
  UNIQUE KEY `uk_evento_tipo` (`tipoevento`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4;

/*Data for the table `tipoeventos` */

insert  into `tipoeventos`(`idtipoevento`,`tipoevento`,`fechainicio`,`fechatermino`) values 
(1,'Luchemos contra la rabia canina','2020-10-08','2022-05-10'),
(2,'Campaña de vacunación \"Parvovirus nunca más\"','2022-05-10',NULL),
(3,'Campaña de vacunación \"Juntos contra la rabia canina\"','2022-05-10',NULL);

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
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4;

/*Data for the table `usuarios` */

insert  into `usuarios`(`idusuario`,`idpersona`,`nombreusuario`,`clave`,`fechaalta`,`fechabaja`,`estado`,`nivelacceso`) values 
(1,1,'Luis','$2y$10$dvgzm2Jmh0u98DerZSGkX.QH5rVqqD/ctSC3UCgYNj4jFh0CgR5mi','2022-04-09',NULL,'A','C'),
(2,2,'Anderson','$2y$10$1RGse/lmJg0AiQJ2DPimyu4H3Lnz8mYLDV6KqYJ/jIldP71uyQUTK','2022-04-09',NULL,'A','C'),
(3,3,'Brenda','$2y$10$dvgzm2Jmh0u98DerZSGkX.QH5rVqqD/ctSC3UCgYNj4jFh0CgR5mi','2022-04-09',NULL,'A','C'),
(4,4,'Jhon','$2y$10$dvgzm2Jmh0u98DerZSGkX.QH5rVqqD/ctSC3UCgYNj4jFh0CgR5mi','2022-04-09',NULL,'A','U'),
(5,14,'Maryory','$2y$10$dvgzm2Jmh0u98DerZSGkX.QH5rVqqD/ctSC3UCgYNj4jFh0CgR5mi','2022-04-28',NULL,'A','C'),
(6,13,'Niurka','$2y$10$XuwgTJwj.H5SI7XfQqd8keDvgAlkWVOl8amJl6nqxrFjEbW42w4.u','2022-04-28',NULL,'A','U'),
(7,12,'Nestor','$2y$10$aCB1lbGGRD.6lwd63tvAGuL7LqlL/NW.1uIkly90ygttmyE4T9Hle','2022-04-28',NULL,'A','C'),
(8,7,'Adriana','$2y$10$QplUuNVAGp1p8SMV/N0t1Oj3XhZKtabTBD905IqfJLNejviLrx1M6','2022-04-28',NULL,'A','U'),
(9,8,'Efrain','$2y$10$Mmh/kWH9TRYvzYKyYelr7OTV2HMQnSEFGBPTgZXkQxKmZnvGuEEHa','2022-05-09',NULL,'A','C'),
(10,9,'jesus','$2y$10$dQsm0jNxKIVTghCQZcs2MeEDJFut2vSaohi8uiC6jvysuLs7q61ua','2022-05-13',NULL,'A','U');

/*Table structure for table `voluntarios` */

DROP TABLE IF EXISTS `voluntarios`;

CREATE TABLE `voluntarios` (
  `idvoluntario` int(11) NOT NULL AUTO_INCREMENT,
  `idpersona` int(11) NOT NULL,
  `fechainicio` date NOT NULL,
  `fechafin` date DEFAULT NULL,
  `descripcionvol` text NOT NULL,
  PRIMARY KEY (`idvoluntario`),
  KEY `fk_idpersona_vol` (`idpersona`),
  CONSTRAINT `fk_idpersona_vol` FOREIGN KEY (`idpersona`) REFERENCES `personas` (`idpersona`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8mb4;

/*Data for the table `voluntarios` */

insert  into `voluntarios`(`idvoluntario`,`idpersona`,`fechainicio`,`fechafin`,`descripcionvol`) values 
(1,6,'2022-05-10',NULL,'Ayudo con la limpieza'),
(2,9,'2018-04-17','2018-04-30','Cambio de cama de mascotas'),
(3,12,'2018-09-12','2018-09-13','Construir casa para las mascotas'),
(4,6,'2022-05-10',NULL,'Baños a las mascotas'),
(5,7,'2020-03-15','2022-04-20','Cambio de cama de mascotas'),
(6,11,'2020-08-19','2022-04-20','Ayudo con la limpieza'),
(7,13,'2022-05-10',NULL,'Construir casa para las mascotas'),
(8,6,'2022-05-09',NULL,'Baños a las mascotas'),
(9,13,'2021-08-29','2022-04-20','Ayudo con la limpieza'),
(10,9,'2021-10-30','2022-04-20','Construir casa para las mascotas'),
(11,10,'2022-04-09',NULL,'Limpieza.'),
(12,14,'2022-04-11',NULL,'Paseo a los perros'),
(13,1,'2022-05-09','2022-05-13','Limpieza en el albergue.'),
(14,14,'2022-04-20','2022-05-09','Bañado de perros'),
(15,1,'2022-04-20','2022-04-25','Paseo a los perros.'),
(16,4,'2022-04-20','2022-04-20','Limpieza de interior del albergue.'),
(17,1,'2022-05-13',NULL,'Construccion de casa para perritos');

/* Procedure structure for procedure `spu_actualizar_a_colaborador` */

/*!50003 DROP PROCEDURE IF EXISTS  `spu_actualizar_a_colaborador` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `spu_actualizar_a_colaborador`(in _idusuario int)
begin
	update usuarios set
		nivelacceso = 'C'
	WHERE idusuario = _idusuario;
end */$$
DELIMITER ;

/* Procedure structure for procedure `spu_actualizar_a_usuario` */

/*!50003 DROP PROCEDURE IF EXISTS  `spu_actualizar_a_usuario` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `spu_actualizar_a_usuario`(IN _idusuario INT)
BEGIN
	UPDATE usuarios SET
		nivelacceso = 'U'
	WHERE idusuario = _idusuario;
END */$$
DELIMITER ;

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
    SELECT animales.animal, mascotas.idmascota , mascotas.nombremascota, personas.apellidos, personas.nombres, fechaadopcion, fecharetorno, mascotas.estado 
		FROM adopciones
    INNER JOIN personas ON personas.idpersona = adopciones.idpersona
    INNER JOIN mascotas ON mascotas.idmascota = adopciones.idmascota
    inner join razas on razas.idraza = mascotas.idraza
    inner join animales on animales.idanimal = razas.idanimal
    WHERE estado = 'A';
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
	INSERT INTO usuarios (idpersona, nombreusuario, clave, fechaalta, fechabaja, estado, nivelacceso)
		VALUES (_idpersona, _nombreusuario, _clave, CURDATE(), NULL, 'A', 'C');
	
	UPDATE personas SET
		logeado = 'S'
	WHERE idpersona = _idpersona;
END */$$
DELIMITER ;

/* Procedure structure for procedure `spu_donaciones_comida` */

/*!50003 DROP PROCEDURE IF EXISTS  `spu_donaciones_comida` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `spu_donaciones_comida`()
BEGIN
SELECT  personas.apellidos, personas.nombres, tipoapoyos.tipoapoyo, fechaapoyo, cantidad, descripcion
        FROM donaciones
    INNER JOIN tipoapoyos ON tipoapoyos.idtipoapoyo = donaciones.idtipoapoyo
    INNER JOIN personas ON personas.idpersona = donaciones.idpersona 
    WHERE tipoapoyo = "Comida";
END */$$
DELIMITER ;

/* Procedure structure for procedure `spu_donaciones_comida_mayor` */

/*!50003 DROP PROCEDURE IF EXISTS  `spu_donaciones_comida_mayor` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `spu_donaciones_comida_mayor`()
BEGIN
SELECT personas.apellidos, personas.nombres, tipoapoyos.tipoapoyo, SUM(cantidad) AS cantidad
    FROM donaciones
    INNER JOIN tipoapoyos ON tipoapoyos.idtipoapoyo = donaciones.idtipoapoyo
    INNER JOIN personas ON personas.idpersona = donaciones.idpersona 
    WHERE tipoapoyo = "Comida"
    GROUP BY personas.apellidos
    ORDER BY cantidad DESC
    LIMIT 3;
END */$$
DELIMITER ;

/* Procedure structure for procedure `spu_donaciones_comida_total` */

/*!50003 DROP PROCEDURE IF EXISTS  `spu_donaciones_comida_total` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `spu_donaciones_comida_total`()
BEGIN
SELECT SUM(cantidad) AS preciototal 
    FROM donaciones
    INNER JOIN tipoapoyos ON tipoapoyos.idtipoapoyo = donaciones.idtipoapoyo
    WHERE tipoapoyo = "Comida";
END */$$
DELIMITER ;

/* Procedure structure for procedure `spu_donaciones_dinero` */

/*!50003 DROP PROCEDURE IF EXISTS  `spu_donaciones_dinero` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `spu_donaciones_dinero`()
BEGIN
SELECT  personas.apellidos, personas.nombres, fechaapoyo, cantidad, descripcion
        FROM donaciones
    INNER JOIN tipoapoyos ON tipoapoyos.idtipoapoyo = donaciones.idtipoapoyo
    INNER JOIN personas ON personas.idpersona = donaciones.idpersona 
    WHERE tipoapoyo = "Monetario";
END */$$
DELIMITER ;

/* Procedure structure for procedure `spu_donaciones_dinero_mayor` */

/*!50003 DROP PROCEDURE IF EXISTS  `spu_donaciones_dinero_mayor` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `spu_donaciones_dinero_mayor`()
BEGIN
SELECT personas.apellidos, personas.nombres, tipoapoyos.tipoapoyo, SUM(cantidad) AS cantidad
    FROM donaciones
    INNER JOIN tipoapoyos ON tipoapoyos.idtipoapoyo = donaciones.idtipoapoyo
    INNER JOIN personas ON personas.idpersona = donaciones.idpersona 
    WHERE tipoapoyo = "Monetario"
    GROUP BY personas.apellidos
    ORDER BY cantidad DESC
    LIMIT 3;
END */$$
DELIMITER ;

/* Procedure structure for procedure `spu_donaciones_dinero_total` */

/*!50003 DROP PROCEDURE IF EXISTS  `spu_donaciones_dinero_total` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `spu_donaciones_dinero_total`()
BEGIN
SELECT SUM(cantidad) AS preciototal 
    FROM donaciones
    INNER JOIN tipoapoyos ON tipoapoyos.idtipoapoyo = donaciones.idtipoapoyo
    WHERE tipoapoyo = "Monetario";
END */$$
DELIMITER ;

/* Procedure structure for procedure `spu_donaciones_otrasdonaciones` */

/*!50003 DROP PROCEDURE IF EXISTS  `spu_donaciones_otrasdonaciones` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `spu_donaciones_otrasdonaciones`()
BEGIN 
    SELECT  personas.apellidos, personas.nombres, tipoapoyos.tipoapoyo, fechaapoyo, descripcion 
        FROM donaciones
        INNER JOIN personas ON personas.idpersona = donaciones.idpersona
        INNER JOIN tipoapoyos ON tipoapoyos.idtipoapoyo = donaciones.idtipoapoyo
        WHERE tipoapoyo = 'Otros';
END */$$
DELIMITER ;

/* Procedure structure for procedure `spu_donaciones_registrar` */

/*!50003 DROP PROCEDURE IF EXISTS  `spu_donaciones_registrar` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `spu_donaciones_registrar`(
	IN _idpersona		INT,
	IN _idtipoapoyo 	INT,
	IN _cantidad 		INT,
	IN _descripcion		TEXT
)
BEGIN
	INSERT INTO donaciones (idpersona, idtipoapoyo, fechaapoyo, cantidad, descripcion)
		VALUES (_idpersona, _idtipoapoyo, CURDATE(), _cantidad, _descripcion);
END */$$
DELIMITER ;

/* Procedure structure for procedure `spu_duenoencontrado_cargar` */

/*!50003 DROP PROCEDURE IF EXISTS  `spu_duenoencontrado_cargar` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `spu_duenoencontrado_cargar`()
BEGIN
    SELECT idmascotaperdida, animales.animal, razas.raza, fecha,
    CASE
            WHEN genero = 'H' THEN 'Hembra'
            WHEN genero = "M" THEN 'Macho'
        END 'genero', nombretemp
    FROM mascotasperdidas
    INNER JOIN razas ON razas.idraza = mascotasperdidas.idraza
    INNER JOIN animales ON animales.idanimal = razas.idanimal
    WHERE recuperado = "N";
END */$$
DELIMITER ;

/* Procedure structure for procedure `spu_duenoencontrado_listar` */

/*!50003 DROP PROCEDURE IF EXISTS  `spu_duenoencontrado_listar` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `spu_duenoencontrado_listar`()
BEGIN
    SELECT iddueno, CONCAT(personas.apellidos, ' ', personas.nombres) AS dueno, personas.telefono, animales.animal, 
    CASE
            WHEN mascotasperdidas.genero = 'H' THEN 'Hembra'
            WHEN mascotasperdidas.genero = "M" THEN 'Macho'
        END 'genero', duenoencontrado.fecha, mascotasperdidas.nombretemp
    FROM duenoencontrado
    INNER JOIN personas ON personas.idpersona = duenoencontrado.idpersona
    INNER JOIN mascotasperdidas ON mascotasperdidas.idmascotaperdida = duenoencontrado.idmascotaperdida
    INNER JOIN razas ON razas.idraza = mascotasperdidas.idraza
    INNER JOIN animales ON animales.idanimal = razas.idanimal
    WHERE recuperado = "S";
END */$$
DELIMITER ;

/* Procedure structure for procedure `spu_duenoencontrado_registrar` */

/*!50003 DROP PROCEDURE IF EXISTS  `spu_duenoencontrado_registrar` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `spu_duenoencontrado_registrar`(
	IN _idpersona				INT,
	IN _idmascotaperdida 	INT
)
BEGIN
	INSERT INTO duenoencontrado (idpersona, idmascotaperdida, fecha)
		VALUES (_idpersona, _idmascotaperdida, curdate());
	
	UPDATE mascotasperdidas SET
		recuperado = "S"
	WHERE idmascotaperdida = _idmascotaperdida;
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

/* Procedure structure for procedure `spu_eventos_filtro_tipoeventos` */

/*!50003 DROP PROCEDURE IF EXISTS  `spu_eventos_filtro_tipoeventos` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `spu_eventos_filtro_tipoeventos`(IN _idtipoevento INT)
BEGIN
SELECT idevento, animales.animal, mascotas.nombremascota, tipoeventos.tipoevento, fechahora, informacion
	FROM eventos
		INNER JOIN tipoeventos ON tipoeventos.idtipoevento = eventos.idtipoevento
		INNER JOIN mascotas ON mascotas.idmascota = eventos.idmascota
		INNER JOIN razas ON razas.idraza = mascotas.idraza
		INNER JOIN animales ON animales.idanimal = razas.idanimal
	WHERE tipoeventos.idtipoevento = _idtipoevento;  
END */$$
DELIMITER ;

/* Procedure structure for procedure `spu_eventos_listar` */

/*!50003 DROP PROCEDURE IF EXISTS  `spu_eventos_listar` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `spu_eventos_listar`()
BEGIN
	SELECT idevento, animales.animal, mascotas.nombremascota, tipoeventos.tipoevento, fechahora, informacion FROM eventos
	INNER JOIN tipoeventos ON tipoeventos.idtipoevento = eventos.idtipoevento
	INNER JOIN mascotas ON mascotas.idmascota = eventos.idmascota
	INNER JOIN razas ON razas.idraza = mascotas.idraza
	INNER JOIN animales ON animales.idanimal = razas.idanimal;
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

/* Procedure structure for procedure `spu_gastos_comida` */

/*!50003 DROP PROCEDURE IF EXISTS  `spu_gastos_comida` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `spu_gastos_comida`()
BEGIN
SELECT  personas.apellidos, personas.nombres, tipoapoyos.tipoapoyo, fecha, cantidadsalida, descripcion
        FROM gastos
    INNER JOIN tipoapoyos ON tipoapoyos.idtipoapoyo = gastos.idtipoapoyo
    INNER JOIN usuarios ON usuarios.idusuario = gastos.idusuario
    INNER JOIN personas ON personas.idpersona = usuarios.idpersona 
    WHERE tipoapoyo = "Comida";
END */$$
DELIMITER ;

/* Procedure structure for procedure `spu_gastos_comida_total` */

/*!50003 DROP PROCEDURE IF EXISTS  `spu_gastos_comida_total` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `spu_gastos_comida_total`()
BEGIN
SELECT SUM(cantidadsalida) AS gastototal 
    FROM gastos
    INNER JOIN tipoapoyos ON tipoapoyos.idtipoapoyo = gastos.idtipoapoyo
    WHERE tipoapoyo = "Comida";
END */$$
DELIMITER ;

/* Procedure structure for procedure `spu_gastos_dinero` */

/*!50003 DROP PROCEDURE IF EXISTS  `spu_gastos_dinero` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `spu_gastos_dinero`()
BEGIN
SELECT  personas.apellidos, personas.nombres, tipoapoyos.tipoapoyo, fecha, cantidadsalida, descripcion
        FROM gastos
    INNER JOIN tipoapoyos ON tipoapoyos.idtipoapoyo = gastos.idtipoapoyo
    INNER JOIN usuarios ON usuarios.idusuario = gastos.idusuario
    INNER JOIN personas ON personas.idpersona = usuarios.idpersona 
    WHERE tipoapoyo = "Monetario";
END */$$
DELIMITER ;

/* Procedure structure for procedure `spu_gastos_dinero_total` */

/*!50003 DROP PROCEDURE IF EXISTS  `spu_gastos_dinero_total` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `spu_gastos_dinero_total`()
BEGIN
SELECT SUM(cantidadsalida) AS gastototal 
    FROM gastos
    INNER JOIN tipoapoyos ON tipoapoyos.idtipoapoyo = gastos.idtipoapoyo
    WHERE tipoapoyo = "Monetario";
END */$$
DELIMITER ;

/* Procedure structure for procedure `spu_gastos_registrar` */

/*!50003 DROP PROCEDURE IF EXISTS  `spu_gastos_registrar` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `spu_gastos_registrar`(
    IN _idusuario       INT,
    IN _idtipoapoyo     INT,
    IN _cantidadsalida  INT,
    IN _descripcion    	TEXT
)
BEGIN
    INSERT INTO gastos (idusuario, idtipoapoyo, fecha, cantidadsalida, descripcion)
        VALUES (_idusuario, _idtipoapoyo, NOW(), _cantidadsalida, _descripcion);
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
        FROM donaciones
    INNER JOIN tipoapoyos ON tipoapoyos.idtipoapoyo = donaciones.idtipoapoyo
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
        FROM donaciones
    INNER JOIN tipoapoyos ON tipoapoyos.idtipoapoyo = donaciones.idtipoapoyo
    WHERE tipoapoyo = "Monetario"
    GROUP BY YEAR(fechaapoyo);
END */$$
DELIMITER ;

/* Procedure structure for procedure `spu_listacolaboradores_registrados` */

/*!50003 DROP PROCEDURE IF EXISTS  `spu_listacolaboradores_registrados` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `spu_listacolaboradores_registrados`()
BEGIN
	SELECT idusuario, personas.apellidos, personas.nombres, nombreusuario, nivelacceso
		FROM usuarios
		INNER JOIN personas ON personas.idpersona = usuarios.idpersona
		WHERE nivelacceso = 'C';
END */$$
DELIMITER ;

/* Procedure structure for procedure `spu_listausuarios_registrados` */

/*!50003 DROP PROCEDURE IF EXISTS  `spu_listausuarios_registrados` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `spu_listausuarios_registrados`()
BEGIN
	select idusuario, personas.apellidos, personas.nombres, fechaalta, nivelacceso
		from usuarios
		inner join personas on personas.idpersona = usuarios.idpersona
		where nivelacceso = 'U';
END */$$
DELIMITER ;

/* Procedure structure for procedure `spu_mascotasperdidas_listar` */

/*!50003 DROP PROCEDURE IF EXISTS  `spu_mascotasperdidas_listar` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `spu_mascotasperdidas_listar`()
BEGIN
	SELECT CASE
			WHEN genero = 'H' THEN 'Hembra'
			WHEN genero = "M" THEN 'Macho'           
		END 'genero', animales.animal, idmascotaperdida, fecha, ubicacion, fotografia, nombretemp
		FROM mascotasperdidas
	INNER JOIN razas ON razas.idraza = mascotasperdidas.idraza
		INNER JOIN animales ON animales.idanimal = razas.idanimal
		WHERE recuperado= "N";
END */$$
DELIMITER ;

/* Procedure structure for procedure `spu_mascotas_adoptadas_listar` */

/*!50003 DROP PROCEDURE IF EXISTS  `spu_mascotas_adoptadas_listar` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `spu_mascotas_adoptadas_listar`()
BEGIN
	SELECT mascotas.nombremascota, razas.raza, animales.animal, fotografia,
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
	SELECT * 
		FROM mascotas 
		INNER JOIN razas ON razas.idraza = mascotas.idraza
		INNER JOIN animales ON animales.idanimal = razas.idanimal 
		WHERE apadrinado = "N" and estado = "R" ORDER BY animales.animal; 
END */$$
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
    SELECT mascotas.nombremascota, razas.raza,  fotografia,
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

/* Procedure structure for procedure `spu_mascotas_general` */

/*!50003 DROP PROCEDURE IF EXISTS  `spu_mascotas_general` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `spu_mascotas_general`()
BEGIN
	SELECT idmascota, mascotas.nombremascota, animales.animal, fotografia,
		CASE
			WHEN genero = 'H' THEN 'Hembra'
			WHEN genero = "M" THEN 'Macho'           
		END 'genero'
	FROM mascotas
	INNER JOIN razas ON razas.idraza = mascotas.idraza
	INNER JOIN animales ON animales.idanimal = razas.idanimal;
END */$$
DELIMITER ;

/* Procedure structure for procedure `spu_mascotas_genero` */

/*!50003 DROP PROCEDURE IF EXISTS  `spu_mascotas_genero` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `spu_mascotas_genero`(
    IN _genero         CHAR(1)
)
BEGIN
    SELECT mascotas.nombremascota, razas.raza, fotografia,
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
	SELECT idmascota, mascotas.nombremascota, razas.raza, animales.animal, fotografia,
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
	IN _idraza 			INT,
	IN _nombremascota		VARCHAR(30),
	IN _genero			CHAR(1),
	IN _fechanacimiento		DATE,
	IN _observaciones		TEXT,
	IN _esterilizacion 		CHAR(1),
	in _fotografia			VARCHAR(100)
)
BEGIN
	INSERT INTO mascotas (idusuario, idraza, nombremascota, genero, fechanacimiento, observaciones, esterilizacion, estado, vive, apadrinado, fotografia)
		VALUES (_idusuario, _idraza, _nombremascota, _genero, _fechanacimiento, _observaciones, _esterilizacion, "R", "S", "N", _fotografia);
END */$$
DELIMITER ;

/* Procedure structure for procedure `spu_mascotas_registro_perdidos` */

/*!50003 DROP PROCEDURE IF EXISTS  `spu_mascotas_registro_perdidos` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `spu_mascotas_registro_perdidos`(
	IN _idusuario 			INT,
	IN _idraza 			INT,
	IN _nombretemp		VARCHAR(30),
	IN _genero			CHAR(1),
	IN _observaciones		TEXT,
	IN _ubicacion		TEXT,
	IN _fotografia			VARCHAR(100)
)
BEGIN
	INSERT INTO mascotasperdidas (idusuario, idraza, nombretemp, genero, observaciones, ubicacion, fotografia, fecha, recuperado)
		VALUES (_idusuario, _idraza, _nombretemp, _genero, _observaciones, _ubicacion, _fotografia, CURDATE(), "N");
END */$$
DELIMITER ;

/* Procedure structure for procedure `spu_mascotas_tipo` */

/*!50003 DROP PROCEDURE IF EXISTS  `spu_mascotas_tipo` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `spu_mascotas_tipo`(
    IN _idanimal         INT
)
BEGIN
    SELECT mascotas.nombremascota, razas.raza, fotografia,
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
	SELECT  idpadrino, mascotas.idmascota, fecha, 
	CASE
		WHEN mascotas.vive = "S" THEN 'Sí'
		WHEN  mascotas.vive= "N" THEN 'No'           
	END 'vive',
	 personas.idpersona,personas.apellidos, animales.animal, personas.nombres, personas.telefono, mascotas.nombremascota
	FROM padrinos
		INNER JOIN personas ON personas.idpersona = padrinos.idpersona
		INNER JOIN mascotas ON mascotas.idmascota = padrinos.idmascota
		INNER JOIN razas ON razas.idraza = mascotas.idraza
		INNER JOIN animales ON animales.idanimal = razas.idanimal
	ORDER BY personas.apellidos;
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
	IN _idpadrino INT,
	IN _idmascota INT
)
BEGIN	
	DELETE FROM padrinos WHERE idpadrino = _idpadrino;
	
	UPDATE mascotas SET
		apadrinado = 'N'
	WHERE idmascota = _idmascota;
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
	INSERT INTO personas(apellidos, nombres, tipodoc, numdoc, direccion, telefono, logeado, voluntario)VALUES
			(_apellidos, _nombres, _tipodoc, _numdoc, _direccion, _telefono, "N", "N");
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

/* Procedure structure for procedure `spu_tipoeventos_listar` */

/*!50003 DROP PROCEDURE IF EXISTS  `spu_tipoeventos_listar` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `spu_tipoeventos_listar`()
BEGIN
	Select * from tipoeventos where fechatermino is null;
END */$$
DELIMITER ;

/* Procedure structure for procedure `spu_tipoeventos_listar_todo` */

/*!50003 DROP PROCEDURE IF EXISTS  `spu_tipoeventos_listar_todo` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `spu_tipoeventos_listar_todo`()
BEGIN
	SELECT * FROM tipoeventos order by tipoevento;
END */$$
DELIMITER ;

/* Procedure structure for procedure `spu_tipoeventos_registrar` */

/*!50003 DROP PROCEDURE IF EXISTS  `spu_tipoeventos_registrar` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `spu_tipoeventos_registrar`(
	IN _tipoevento	VARCHAR(100)
)
BEGIN
	INSERT INTO tipoeventos (tipoevento, fechainicio, fechatermino)
		VALUES (_tipoevento, CURDATE() , NULL);
END */$$
DELIMITER ;

/* Procedure structure for procedure `spu_tipoeventos_terminados_listar` */

/*!50003 DROP PROCEDURE IF EXISTS  `spu_tipoeventos_terminados_listar` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `spu_tipoeventos_terminados_listar`()
BEGIN
	SELECT * FROM tipoeventos WHERE fechatermino IS NOT NULL;
END */$$
DELIMITER ;

/* Procedure structure for procedure `spu_tipoeventos_terminar` */

/*!50003 DROP PROCEDURE IF EXISTS  `spu_tipoeventos_terminar` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `spu_tipoeventos_terminar`(
	IN _idtipoevento INT
)
BEGIN
	UPDATE tipoeventos SET 
		fechatermino = CURDATE()
	WHERE idtipoevento = _idtipoevento;
END */$$
DELIMITER ;

/* Procedure structure for procedure `spu_usuarios_actualizarclave` */

/*!50003 DROP PROCEDURE IF EXISTS  `spu_usuarios_actualizarclave` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `spu_usuarios_actualizarclave`(
	IN _idusuario INT,
	IN _clave	varchar(100)
)
begin
	UPDATE usuarios set clave = _clave where idusuario = _idusuario;
end */$$
DELIMITER ;

/* Procedure structure for procedure `spu_usuarios_login` */

/*!50003 DROP PROCEDURE IF EXISTS  `spu_usuarios_login` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `spu_usuarios_login`(
	IN _nombreusuario 	VARCHAR(15)
)
BEGIN
	SELECT	usuarios.idusuario, personas.apellidos, personas.nombres,
				usuarios.nombreusuario, usuarios.clave, usuarios.nivelacceso
		FROM usuarios 
		INNER JOIN personas ON personas.idpersona = usuarios.idpersona
	WHERE nombreusuario = _nombreusuario AND estado = 'A'; -- A = Activo & I = Inactivo --
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
	INSERT INTO usuarios (idpersona, nombreusuario, clave, fechaalta, fechabaja, estado, nivelacceso)
		VALUES (_idpersona, _nombreusuario, _clave, CURDATE(), NULL, 'A', 'U');
		
	UPDATE personas SET
		logeado = 'S'
	WHERE idpersona = _idpersona;
END */$$
DELIMITER ;

/* Procedure structure for procedure `spu_voluntarios_archivados` */

/*!50003 DROP PROCEDURE IF EXISTS  `spu_voluntarios_archivados` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `spu_voluntarios_archivados`()
BEGIN
	SELECT idvoluntario, personas.idpersona, personas.apellidos, personas.nombres, voluntarios.fechainicio, voluntarios.fechafin, voluntarios.descripcionvol, personas.voluntario
		FROM voluntarios
		INNER JOIN personas ON personas.idpersona = voluntarios.idpersona
		WHERE fechafin IS NOT NULL
	ORDER BY fechainicio DESC;
END */$$
DELIMITER ;

/* Procedure structure for procedure `spu_voluntarios_cargar` */

/*!50003 DROP PROCEDURE IF EXISTS  `spu_voluntarios_cargar` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `spu_voluntarios_cargar`()
BEGIN
	SELECT * FROM personas where voluntario = "N";
END */$$
DELIMITER ;

/* Procedure structure for procedure `spu_voluntarios_devolver` */

/*!50003 DROP PROCEDURE IF EXISTS  `spu_voluntarios_devolver` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `spu_voluntarios_devolver`(
	IN _idvoluntario INT,
	IN _idpersona INT
	
)
BEGIN
	UPDATE voluntarios SET
		fechainicio = CURDATE(),
		fechafin = NULL
	WHERE idvoluntario = _idvoluntario;
	
	UPDATE personas SET
		voluntario = "S"
	WHERE idpersona = _idpersona;
END */$$
DELIMITER ;

/* Procedure structure for procedure `spu_voluntarios_listar` */

/*!50003 DROP PROCEDURE IF EXISTS  `spu_voluntarios_listar` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `spu_voluntarios_listar`()
BEGIN
	SELECT idvoluntario, personas.idpersona, personas.apellidos, personas.nombres, voluntarios.fechainicio, voluntarios.fechafin, voluntarios.descripcionvol, personas.voluntario
		FROM voluntarios
		INNER JOIN personas ON personas.idpersona = voluntarios.idpersona
		where fechafin is null
	ORDER BY fechainicio desc;
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
	INSERT INTO voluntarios (idpersona, fechainicio, fechafin, descripcionvol)
		VALUES (_idpersona, CURDATE(), null , _descripcionvol);
	
	UPDATE personas SET
		voluntario = "S"
	where idpersona = _idpersona;
END */$$
DELIMITER ;

/* Procedure structure for procedure `spu_voluntarios_terminar` */

/*!50003 DROP PROCEDURE IF EXISTS  `spu_voluntarios_terminar` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `spu_voluntarios_terminar`(
	IN _idvoluntario INT,
	IN _idpersona INT
	
)
BEGIN
	UPDATE voluntarios SET 
		fechafin = CURDATE()
	WHERE idvoluntario = _idvoluntario;
	
	UPDATE personas SET
		voluntario = "N"
	WHERE idpersona = _idpersona;
END */$$
DELIMITER ;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
