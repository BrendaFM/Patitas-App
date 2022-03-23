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
  `fechahoraadopcion` datetime NOT NULL,
  `fechahoraretorno` datetime DEFAULT NULL,
  PRIMARY KEY (`idadopcion`),
  KEY `fk_idpersona_adop` (`idpersona`),
  KEY `fk_idmascota_adop` (`idmascota`),
  CONSTRAINT `fk_idmascota_adop` FOREIGN KEY (`idmascota`) REFERENCES `mascotas` (`idmascota`),
  CONSTRAINT `fk_idpersona_adop` FOREIGN KEY (`idpersona`) REFERENCES `personas` (`idpersona`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4;

/*Data for the table `adopciones` */

insert  into `adopciones`(`idadopcion`,`idpersona`,`idmascota`,`fechahoraadopcion`,`fechahoraretorno`) values 
(1,1,4,'2022-01-10 00:00:00',NULL);

/*Table structure for table `animales` */

DROP TABLE IF EXISTS `animales`;

CREATE TABLE `animales` (
  `idanimal` int(11) NOT NULL AUTO_INCREMENT,
  `animal` varchar(30) NOT NULL,
  PRIMARY KEY (`idanimal`),
  UNIQUE KEY `uk_animal_ani` (`animal`)
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
  `fechaapoyo` datetime NOT NULL,
  `cantidad` int(11) NOT NULL,
  `descripcion` text NOT NULL,
  PRIMARY KEY (`idapoyo`),
  KEY `fk_tipoapoyo_ap` (`idtipoapoyo`),
  KEY `fk_idpersona_ap` (`idpersona`),
  CONSTRAINT `fk_idpersona_ap` FOREIGN KEY (`idpersona`) REFERENCES `personas` (`idpersona`),
  CONSTRAINT `fk_tipoapoyo_ap` FOREIGN KEY (`idtipoapoyo`) REFERENCES `tipoapoyo` (`idtipoapoyo`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4;

/*Data for the table `apoyo` */

insert  into `apoyo`(`idapoyo`,`idpersona`,`idtipoapoyo`,`fechaapoyo`,`cantidad`,`descripcion`) values 
(1,4,2,'2022-02-25 00:00:00',100,'descripcion apoyo');

/*Table structure for table `eventos` */

DROP TABLE IF EXISTS `eventos`;

CREATE TABLE `eventos` (
  `idevento` int(11) NOT NULL AUTO_INCREMENT,
  `idmascota` int(11) NOT NULL,
  `idtipoevento` int(11) NOT NULL,
  `fechahora` datetime NOT NULL,
  `informacion` text DEFAULT NULL,
  PRIMARY KEY (`idevento`),
  KEY `fk_idmascota_det` (`idmascota`),
  KEY `fk_idtipoevento_det` (`idtipoevento`),
  CONSTRAINT `fk_idmascota_det` FOREIGN KEY (`idmascota`) REFERENCES `mascotas` (`idmascota`),
  CONSTRAINT `fk_idtipoevento_det` FOREIGN KEY (`idtipoevento`) REFERENCES `tipoeventos` (`idtipoevento`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4;

/*Data for the table `eventos` */

insert  into `eventos`(`idevento`,`idmascota`,`idtipoevento`,`fechahora`,`informacion`) values 
(1,1,1,'2021-01-15 00:00:00','Contra la Rabia'),
(2,1,1,'2022-01-15 00:00:00','Contra la Rabia');

/*Table structure for table `fotos` */

DROP TABLE IF EXISTS `fotos`;

CREATE TABLE `fotos` (
  `idfoto` int(11) NOT NULL AUTO_INCREMENT,
  `idmascota` int(11) NOT NULL,
  `ruta` varchar(100) NOT NULL,
  `comentariofoto` varchar(100) NOT NULL,
  PRIMARY KEY (`idfoto`),
  KEY `fk_idmascota_fo` (`idmascota`),
  CONSTRAINT `fk_idmascota_fo` FOREIGN KEY (`idmascota`) REFERENCES `mascotas` (`idmascota`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4;

/*Data for the table `fotos` */

insert  into `fotos`(`idfoto`,`idmascota`,`ruta`,`comentariofoto`) values 
(1,1,'ruta123456','Comentariofotos1'),
(2,2,'ruta112233445566','Comentariofotos2');

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
  PRIMARY KEY (`idmascota`),
  KEY `fk_idusuario_mas` (`idusuario`),
  KEY `fk_idraza_mas` (`idraza`),
  CONSTRAINT `fk_idraza_mas` FOREIGN KEY (`idraza`) REFERENCES `razas` (`idraza`),
  CONSTRAINT `fk_idusuario_mas` FOREIGN KEY (`idusuario`) REFERENCES `usuarios` (`idusuario`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4;

/*Data for the table `mascotas` */

insert  into `mascotas`(`idmascota`,`idusuario`,`idraza`,`nombremascota`,`genero`,`fechanacimiento`,`observaciones`,`esterilizacion`,`estado`,`vive`) values 
(1,3,3,'Nacho','M','2020-04-12','descripcion muchotexto','S','A','S'),
(2,1,2,'Paco Rex','M','2021-08-17','descripcion2','N','A','S'),
(3,2,1,'Danna','H','2021-12-21','descripcion3','N','R','N'),
(4,1,2,'Mishifu','H','2021-07-03','descripcion4','N','A','S');

/*Table structure for table `padrinos` */

DROP TABLE IF EXISTS `padrinos`;

CREATE TABLE `padrinos` (
  `idpadrino` int(11) NOT NULL AUTO_INCREMENT,
  `idpersona` int(11) NOT NULL,
  `idmascota` int(11) NOT NULL,
  `fechaalta` datetime NOT NULL,
  `fechabaja` datetime DEFAULT NULL,
  PRIMARY KEY (`idpadrino`),
  KEY `fk_idpersona_pad` (`idpersona`),
  KEY `fk_idmascota_pad` (`idmascota`),
  CONSTRAINT `fk_idmascota_pad` FOREIGN KEY (`idmascota`) REFERENCES `mascotas` (`idmascota`),
  CONSTRAINT `fk_idpersona_pad` FOREIGN KEY (`idpersona`) REFERENCES `personas` (`idpersona`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4;

/*Data for the table `padrinos` */

insert  into `padrinos`(`idpadrino`,`idpersona`,`idmascota`,`fechaalta`,`fechabaja`) values 
(1,4,4,'2022-02-10 00:00:00',NULL);

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
  PRIMARY KEY (`idpersona`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4;

/*Data for the table `personas` */

insert  into `personas`(`idpersona`,`apellidos`,`nombres`,`tipodoc`,`numdoc`,`direccion`,`telefono`) values 
(1,'Boada Ramos','Luis Anderson','D','12345678','Av España 123','987654321'),
(2,'Belleza Torres','Anderson David','D','37194023','Jr 28 De Julio 123','972648117'),
(3,'Francia Minaya','Brenda Andrea','D','23950696','AV La Molina 160','964918123'),
(4,'De Luque','Jesus Samuel','D','28493919','AV Esperanza 23 ','962716321');

/*Table structure for table `razas` */

DROP TABLE IF EXISTS `razas`;

CREATE TABLE `razas` (
  `idraza` int(11) NOT NULL AUTO_INCREMENT,
  `raza` varchar(30) NOT NULL,
  `idanimal` int(11) NOT NULL,
  PRIMARY KEY (`idraza`),
  UNIQUE KEY `uk_raza_ra` (`raza`),
  KEY `fk_idanimal_ra` (`idanimal`),
  CONSTRAINT `fk_idanimal_ra` FOREIGN KEY (`idanimal`) REFERENCES `animales` (`idanimal`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4;

/*Data for the table `razas` */

insert  into `razas`(`idraza`,`raza`,`idanimal`) values 
(1,'Pastor alemán',1),
(2,'Común europeo',2),
(3,'Mestizo',1),
(4,'Ragdoll',2),
(5,'Labrador retrieve',1);

/*Table structure for table `tipoapoyo` */

DROP TABLE IF EXISTS `tipoapoyo`;

CREATE TABLE `tipoapoyo` (
  `idtipoapoyo` int(11) NOT NULL AUTO_INCREMENT,
  `tipoapoyo` varchar(20) NOT NULL,
  PRIMARY KEY (`idtipoapoyo`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4;

/*Data for the table `tipoapoyo` */

insert  into `tipoapoyo`(`idtipoapoyo`,`tipoapoyo`) values 
(1,'Comida'),
(2,'Monetario');

/*Table structure for table `tipoeventos` */

DROP TABLE IF EXISTS `tipoeventos`;

CREATE TABLE `tipoeventos` (
  `idtipoevento` int(11) NOT NULL AUTO_INCREMENT,
  `tipoevento` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`idtipoevento`),
  UNIQUE KEY `uk_evento_tip` (`tipoevento`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4;

/*Data for the table `tipoeventos` */

insert  into `tipoeventos`(`idtipoevento`,`tipoevento`) values 
(2,'Intervencion'),
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
  `fotografia` varchar(70) DEFAULT NULL,
  PRIMARY KEY (`idusuario`),
  UNIQUE KEY `uk_nombreusuario` (`nombreusuario`),
  KEY `fk_idpersona_per` (`idpersona`),
  CONSTRAINT `fk_idpersona_per` FOREIGN KEY (`idpersona`) REFERENCES `personas` (`idpersona`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4;

/*Data for the table `usuarios` */

insert  into `usuarios`(`idusuario`,`idpersona`,`nombreusuario`,`clave`,`fechaalta`,`fechabaja`,`estado`,`fotografia`) values 
(1,1,'Luis7','$2y$10$dvgzm2Jmh0u98DerZSGkX.QH5rVqqD/ctSC3UCgYNj4jFh0CgR5mi','2022-03-18',NULL,'A',NULL),
(2,2,'Anderson','$2y$10$dvgzm2Jmh0u98DerZSGkX.QH5rVqqD/ctSC3UCgYNj4jFh0CgR5mi','2022-03-18',NULL,'I',NULL),
(3,3,'Brenda','$2y$10$dvgzm2Jmh0u98DerZSGkX.QH5rVqqD/ctSC3UCgYNj4jFh0CgR5mi','2022-03-18',NULL,'A',NULL);

/*Table structure for table `voluntarios` */

DROP TABLE IF EXISTS `voluntarios`;

CREATE TABLE `voluntarios` (
  `idvoluntario` int(11) NOT NULL AUTO_INCREMENT,
  `idpersona` int(11) NOT NULL,
  `fechahora` datetime NOT NULL,
  `descripcionvol` text NOT NULL,
  PRIMARY KEY (`idvoluntario`),
  KEY `fk_idpersona_vo` (`idpersona`),
  CONSTRAINT `fk_idpersona_vo` FOREIGN KEY (`idpersona`) REFERENCES `personas` (`idpersona`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4;

/*Data for the table `voluntarios` */

insert  into `voluntarios`(`idvoluntario`,`idpersona`,`fechahora`,`descripcionvol`) values 
(1,4,'2022-02-20 00:00:00','Apoyo con la limpieza');

/* Procedure structure for procedure `spu_mascotas_listar` */

/*!50003 DROP PROCEDURE IF EXISTS  `spu_mascotas_listar` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `spu_mascotas_listar`()
BEGIN
	SELECT
		mascotas.nombremascota, razas.raza, 
		CASE
			WHEN genero = 'M' THEN 'Macho'
			WHEN genero = 'H' THEN 'Hembra'      
			END 'genero', 
		mascotas.fechanacimiento FROM mascotas
		inner join razas oN razas.idraza = mascotas.idraza;
END */$$
DELIMITER ;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
