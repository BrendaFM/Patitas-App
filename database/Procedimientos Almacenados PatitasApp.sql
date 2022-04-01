USE patitasapp;

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

CALL spu_mascotas_listar();

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

CALL spu_mascotas_tipo(2);

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

CALL spu_mascotas_genero("H");

DELIMITER $$ 
CREATE PROCEDURE spu_mascotas_esterilizado
(
    IN _esterilizado         CHAR(1)
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
    WHERE esterilizacion = _esterilizado; 
END $$

CALL spu_mascotas_esterilizado("N");
/*DELIMITER $$
CREATE PROCEDURE spu_mascotas_genero
(
    IN _animal        		INT,
    IN _genero	    		CHAR(1)
)
BEGIN
    -- 3 
	IF _animal = 1 and _genero ="M" then SELECT * FROM mascotas
    INNER JOIN razas ON razas.idraza = mascotas.idraza
    WHERE idanimal = 1 AND genero = "M"; END IF;
    -- 4
    IF _animal = 2 AND _genero = "M" THEN SELECT * FROM mascotas
    INNER JOIN razas ON razas.idraza = mascotas.idraza
    WHERE idanimal = 2 AND genero = "M"; END IF;
    -- 5
    IF _animal = 1 AND _genero = "H" THEN SELECT * FROM mascotas
    INNER JOIN razas ON razas.idraza = mascotas.idraza
    WHERE idanimal = 1 AND genero = "H"; END IF;
    -- 6
    IF _animal = 2 AND _genero= "H" THEN SELECT * FROM mascotas
    INNER JOIN razas ON razas.idraza = mascotas.idraza
    WHERE idanimal = 2 AND genero = "H"; END IF;
END $$

CALL spu_mascotas_genero(1,"M");

DELIMITER $$
CREATE PROCEDURE spu_mascotas_esterizacion
(
    IN _animal        		INT,
    IN _esterilizacion	    CHAR(1)
)
BEGIN
    -- 3 
	IF _animal = 1 AND _esterilizacion ="S" THEN SELECT * FROM mascotas
    INNER JOIN razas ON razas.idraza = mascotas.idraza
    WHERE idanimal = 1 AND esterilizacion = "S"; END IF;
    -- 4
    IF _animal = 2 AND _esterilizacion = "S" THEN SELECT * FROM mascotas
    INNER JOIN razas ON razas.idraza = mascotas.idraza
    WHERE idanimal = 2 AND esterilizacion = "S"; END IF;
END $$

CALL spu_mascotas_esterizacion(2, "S");
*/

