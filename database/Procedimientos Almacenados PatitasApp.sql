USE patitasapp;
-- ------------------------------------------------------------
-- PERSONAS
-- ------------------------------------------------------------
DELIMITER $$
CREATE PROCEDURE spu_personas_registro
(
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
END $$

DELIMITER $$
CREATE PROCEDURE spu_personas_listar()
BEGIN
	SELECT * FROM personas
	WHERE logeado = "N"
	ORDER BY apellidos;
END $$

DELIMITER $$
CREATE PROCEDURE spu_personas_cargar()
BEGIN
	SELECT * FROM personas
	ORDER BY apellidos;
END $$

-- ------------------------------------------------------------
-- INICIO DE SESIÓN
-- ------------------------------------------------------------

DELIMITER $$
CREATE PROCEDURE spu_usuarios_login
(
	IN _nombreusuario 	VARCHAR(15)
)
BEGIN
	SELECT * 
		FROM usuarios
	WHERE nombreusuario = _nombreusuario;
END $$

DELIMITER $$
CREATE PROCEDURE spu_colaborador_registro
(
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
END $$

DELIMITER $$
CREATE PROCEDURE spu_usuarios_registro
(
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
END $$

-- ------------------------------------------------------------
-- RAZAS
-- ------------------------------------------------------------

DELIMITER $$
CREATE PROCEDURE spu_razas_listar(IN _idanimal INT)
BEGIN
    SELECT * FROM razas
    WHERE idanimal = _idanimal;
END $$

-- ------------------------------------------------------------
-- MASCOTAS
-- ------------------------------------------------------------

DELIMITER $$
CREATE PROCEDURE spu_mascotas_registro
(
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
END $$

DELIMITER $$
CREATE PROCEDURE spu_mascotas_listar()
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
END $$

DELIMITER $$
CREATE PROCEDURE spu_mascotas_eliminar
(
	IN _idmascota			INT
)
BEGIN
		UPDATE mascotas SET
		vive = "N" 
		WHERE idmascota = _idmascota;		
END $$

DELIMITER $$
CREATE PROCEDURE spu_mascotas_cargar_padrinos()
BEGIN
	SELECT * 
		FROM mascotas 
		INNER JOIN razas ON razas.idraza = mascotas.idraza
		INNER JOIN animales ON animales.idanimal = razas.idanimal 
		WHERE apadrinado = "N" ORDER BY animales.animal; 
END $$

DELIMITER $$
CREATE PROCEDURE spu_mascotas_cargar_eventos()
BEGIN
	SELECT * 
		FROM mascotas 
		INNER JOIN razas ON razas.idraza = mascotas.idraza
		INNER JOIN animales ON animales.idanimal = razas.idanimal
		ORDER BY animales.animal; 
END $$

DELIMITER $$
CREATE PROCEDURE spu_esterilizar_mascota
(
    IN _idmascota INT
)
BEGIN
    UPDATE mascotas SET
        esterilizacion = 'S'
    WHERE idmascota = _idmascota;
END $$

-- ------------------------------------------------------------
-- FILTROS DE MASCOTAS
-- ------------------------------------------------------------

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
			WHEN esterilizacion = 'S' THEN 'Sí'
			WHEN esterilizacion = "N" THEN 'No'           
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
			WHEN esterilizacion = 'S' THEN 'Sí'
			WHEN esterilizacion = "N" THEN 'No'           
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
			WHEN esterilizacion = 'S' THEN 'Sí'
			WHEN esterilizacion = "N" THEN 'No'           
	END 'esterilizacion' 
	FROM mascotas
    INNER JOIN razas ON razas.idraza = mascotas.idraza
    WHERE esterilizacion = _esterilizacion; 
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
			WHEN esterilizacion = 'S' THEN 'Sí'
			WHEN esterilizacion = "N" THEN 'No'           
	END 'esterilizacion' 
	FROM mascotas
	INNER JOIN razas ON razas.idraza = mascotas.idraza
	INNER JOIN animales ON animales.idanimal = razas.idanimal
	WHERE estado = "A" AND vive = "S";
END $$
-- ------------------------------------------------------------
-- ADOPCIONES
-- ------------------------------------------------------------

DELIMITER $$
CREATE PROCEDURE spu_adopcion_listar_tabla()
BEGIN
    SELECT mascotas.idmascota , mascotas.nombremascota, personas.apellidos, personas.nombres, fechaadopcion, fecharetorno, mascotas.estado FROM adopciones
    INNER JOIN personas ON personas.idpersona = adopciones.idpersona
    INNER JOIN mascotas ON mascotas.idmascota = adopciones.idmascota
    WHERE estado = 'A';
END $$

DELIMITER $$
CREATE PROCEDURE spu_adopciones_registrar
(
	IN _idpersona			INT,
	IN _idmascota			INT
)
BEGIN
		INSERT INTO adopciones(idpersona, idmascota, fechaadopcion, fecharetorno)
			VALUES (_idpersona, _idmascota, CURDATE(), NULL);
			
		UPDATE mascotas SET
		estado = 'A'
		WHERE idmascota = _idmascota;
END $$

DELIMITER $$
CREATE PROCEDURE spu_adopciones_eliminar
(
    IN _idmascota            INT
)
BEGIN
        DELETE FROM adopciones
        WHERE idmascota = _idmascota;

        UPDATE mascotas SET
        estado = 'R'
        WHERE idmascota = _idmascota;
END $$

DELIMITER $$
CREATE PROCEDURE spu_mascotas_cargar_adopciones()
BEGIN
    SELECT * 
        FROM mascotas 
        INNER JOIN razas ON razas.idraza = mascotas.idraza
        INNER JOIN animales ON animales.idanimal = razas.idanimal
        WHERE estado = "R" ORDER BY animales.animal;
END $$

-- ------------------------------------------------------------
-- EVENTOS
-- ------------------------------------------------------------

DELIMITER $$
CREATE PROCEDURE spu_eventos_registrar
(
	IN _idmascota 		INT,
	IN _idtipoevento	INT,
	IN _informacion		TEXT
)
BEGIN
	INSERT INTO eventos (idmascota, idtipoevento, fechahora ,informacion)
		VALUES (_idmascota, _idtipoevento, CURDATE() ,_informacion);
END $$

DELIMITER $$
CREATE PROCEDURE spu_eventos_listar()
BEGIN
	SELECT idevento, mascotas.nombremascota, tipoeventos.tipoevento, fechahora, informacion FROM eventos
	INNER JOIN tipoeventos ON tipoeventos.idtipoevento = eventos.idtipoevento
	INNER JOIN mascotas ON mascotas.idmascota = eventos.idmascota;
END $$

-- ------------------------------------------------------------
-- PADRINOS
-- ------------------------------------------------------------

DELIMITER $$
CREATE PROCEDURE spu_padrinos_registrar
(
	IN _idpersona		INT,
	IN _idmascota 		INT
)
BEGIN
	UPDATE mascotas SET
		apadrinado = 'S'
	WHERE idmascota = _idmascota;
	
	INSERT INTO padrinos (idpersona, idmascota, fecha)
		VALUES (_idpersona, _idmascota, CURDATE());
END $$

DELIMITER $$
CREATE PROCEDURE spu_padrinos_listar()
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
		INNER JOIN razas ON razas.idraza = mascotas.idraza
		INNER JOIN animales ON animales.idanimal = razas.idanimal
	ORDER BY personas.apellidos;
END $$

DELIMITER $$
CREATE PROCEDURE spu_padrino_eliminar
(
	IN _idpadrino INT
)
BEGIN
	DELETE FROM padrinos WHERE idpadrino = _idpadrino;
END $$

-- ------------------------------------------------------------
-- VOLUNTARIOS
-- ------------------------------------------------------------

DELIMITER $$
CREATE PROCEDURE spu_voluntarios_registrar
(
	IN _idpersona			INT,
	IN _descripcionvol 		TEXT
)
BEGIN
	INSERT INTO voluntarios (idpersona, fechahora, descripcionvol)
		VALUES (_idpersona, CURDATE(), _descripcionvol);
END $$

DELIMITER $$
CREATE PROCEDURE spu_voluntarios_listar()
BEGIN
	SELECT personas.idpersona, personas.apellidos, personas.nombres, voluntarios.descripcionvol, voluntarios.fechahora
	FROM voluntarios
		INNER JOIN personas ON personas.idpersona = voluntarios.idpersona;
END $$

-- ------------------------------------------------------------
-- APOYO
-- ------------------------------------------------------------

DELIMITER $$
CREATE PROCEDURE spu_apoyo_registrar
(
	IN _idpersona		INT,
	IN _idtipoapoyo 	INT,
	IN _cantidad 		INT,
	IN _descripcion		TEXT
)
BEGIN
	INSERT INTO apoyo (idpersona, idtipoapoyo, fechaapoyo, cantidad, descripcion)
		VALUES (_idpersona, _idtipoapoyo, CURDATE(), _cantidad, _descripcion);
END $$

DELIMITER $$
CREATE PROCEDURE spu_apoyo_listar()
BEGIN
	SELECT personas.idpersona, personas.apellidos, personas.nombres, apoyo.fechaapoyo, apoyo.cantidad, apoyo.descripcion
	FROM apoyo
		INNER JOIN personas ON personas.idpersona = apoyo.idpersona;
END $$

-- -------------------------------------------------------------
-- GRÁFICOS
-- -------------------------------------------------------------

DELIMITER $$
CREATE PROCEDURE spu_grafico_kilogramos()
BEGIN
SELECT  tipoapoyos.tipoapoyo, SUM(cantidad) AS "Total Kg." , YEAR(fechaapoyo) AS "AÑO"
        FROM apoyo
    INNER JOIN tipoapoyos ON tipoapoyos.idtipoapoyo = apoyo.idtipoapoyo
    WHERE tipoapoyo = "Comida"
    GROUP BY YEAR(fechaapoyo);
END $$

DELIMITER $$
CREATE PROCEDURE spu_grafico_soles()
BEGIN
SELECT  tipoapoyos.tipoapoyo, SUM(cantidad) AS "Total Soles" , YEAR(fechaapoyo) AS "AÑO"
        FROM apoyo
    INNER JOIN tipoapoyos ON tipoapoyos.idtipoapoyo = apoyo.idtipoapoyo
    WHERE tipoapoyo = "Monetario"
    GROUP BY YEAR(fechaapoyo);
END $$

DELIMITER $$
CREATE PROCEDURE spu_grafico_adoptados()
BEGIN
SELECT COUNT(animales.animal) AS "Total Adoptados", YEAR(fechaadopcion) AS "Año"
        FROM adopciones
    INNER JOIN mascotas ON mascotas.idmascota = adopciones.idmascota
    INNER JOIN razas ON razas.idraza = mascotas.idraza
    INNER JOIN animales ON animales.idanimal = razas.idanimal
    GROUP BY YEAR(fechaadopcion);
END $$
