USE patitasapp;

DELIMITER $$
CREATE PROCEDURE spu_mascotas_listar()
BEGIN
	SELECT mascotas.nombremascota, razas.raza, 
		CASE
			WHEN genero = 'H' THEN 'Hembra'
			WHEN genero = "M" THEN 'Macho'           
		END 'genero'
	, mascotas.fechanacimiento, mascotas.estado, mascotas.vive, mascotas.esterilizacion 
	FROM mascotas
	INNER JOIN razas ON razas.idraza = mascotas.idraza
	WHERE estado = "R" AND vive = "S";
END $$

CALL spu_mascotas_listar();

DELIMITER $$
CREATE PROCEDURE spu_mascotas_adoptadas_listar()
BEGIN
	SELECT mascotas.nombremascota, razas.raza, 
		CASE
			WHEN genero = 'H' THEN 'Hembra'
			WHEN genero = "M" THEN 'Macho'           
		END 'genero'
	, mascotas.fechanacimiento, mascotas.estado, mascotas.vive, mascotas.esterilizacion 
	FROM mascotas
	INNER JOIN razas ON razas.idraza = mascotas.idraza
	WHERE estado = "A" AND vive = "S";
END $$


DELIMITER $$
CREATE PROCEDURE spu_mascotas_filtros
(

)
BEGIN
	SELECT mascotas.nombremascota, razas.raza, 
		CASE
			WHEN genero = 'H' THEN 'Hembra'
			WHEN genero = "M" THEN 'Macho'           
		END 'genero'
	, mascotas.fechanacimiento, mascotas.estado, mascotas.vive, mascotas.esterilizacion 
	FROM mascotas
	INNER JOIN razas ON razas.idraza = mascotas.idraza
	WHERE estado = "A" AND vive = "S";
END $$


