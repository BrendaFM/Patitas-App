USE patitasapp;

-- ------------------------------------------------------------
-- MASCOTAS
-- ------------------------------------------------------------
DELIMITER $$
CREATE PROCEDURE spu_mascotas_listar()
BEGIN
	SELECT mascotas.nombremascota, razas.raza, animales.animal,
		CASE
			WHEN genero = 'H' THEN 'Hembra'
			WHEN genero = "M" THEN 'Macho'           
		END 'genero'
	, mascotas.fechanacimiento, mascotas.estado, mascotas.vive, 
	CASE
			WHEN esterilizacion = 'S' THEN 'Esterilizado'
			WHEN esterilizacion = "N" THEN 'No esterilizado'           
	END 'esterilizacion' 
	FROM mascotas
	INNER JOIN razas ON razas.idraza = mascotas.idraza
	INNER JOIN animales ON animales.idanimal = razas.idanimal
	WHERE estado = "R" AND vive = "S";
END $$

DELIMITER $$
CREATE PROCEDURE spu_mascotas_adoptadas_listar()
BEGIN
	SELECT mascotas.nombremascota, razas.raza, animales.animal,
		CASE
			WHEN genero = 'H' THEN 'Hembra'
			WHEN genero = "M" THEN 'Macho'           
		END 'genero'
	, mascotas.fechanacimiento, mascotas.estado, mascotas.vive, 
	CASE
			WHEN esterilizacion = 'S' THEN 'Esterilizado'
			WHEN esterilizacion = "N" THEN 'No esterilizado'           
	END 'esterilizacion' 
	FROM mascotas
	INNER JOIN razas ON razas.idraza = mascotas.idraza
	INNER JOIN animales ON animales.idanimal = razas.idanimal
	WHERE estado = "A" AND vive = "S";
END $$

DELIMITER $$ 
CREATE PROCEDURE spu_mascotas_tipo
(
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
			WHEN esterilizacion = 'S' THEN 'Esterilizado'
			WHEN esterilizacion = "N" THEN 'No esterilizado'           
	END 'esterilizacion' 
	FROM mascotas
    INNER JOIN razas ON razas.idraza = mascotas.idraza
    WHERE idanimal = _idanimal; 
END $$

DELIMITER $$ 
CREATE PROCEDURE spu_mascotas_genero
(
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
			WHEN esterilizacion = 'S' THEN 'Esterilizado'
			WHEN esterilizacion = "N" THEN 'No esterilizado'           
	END 'esterilizacion' 
	FROM mascotas
    INNER JOIN razas ON razas.idraza = mascotas.idraza
    WHERE genero = _genero; 
END $$

DELIMITER $$ 
CREATE PROCEDURE spu_mascotas_esterilizacion
(
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
			WHEN esterilizacion = 'S' THEN 'Esterilizado'
			WHEN esterilizacion = "N" THEN 'No esterilizado'           
	END 'esterilizacion' 
	FROM mascotas
    INNER JOIN razas ON razas.idraza = mascotas.idraza
    WHERE esterilizacion = _esterilizacion; 
END $$
