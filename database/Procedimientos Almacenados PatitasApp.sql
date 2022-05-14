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
	INSERT INTO personas(apellidos, nombres, tipodoc, numdoc, direccion, telefono, logeado, voluntario)VALUES
			(_apellidos, _nombres, _tipodoc, _numdoc, _direccion, _telefono, "N", "N");
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
	INSERT INTO usuarios (idpersona, nombreusuario, clave, fechaalta, fechabaja, estado, nivelacceso)
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
	INSERT INTO usuarios (idpersona, nombreusuario, clave, fechaalta, fechabaja, estado, nivelacceso)
		VALUES (_idpersona, _nombreusuario, _clave, CURDATE(), NULL, 'A', 'U');
		
	UPDATE personas SET
		logeado = 'S'
	WHERE idpersona = _idpersona;
END $$

DELIMITER $$
CREATE PROCEDURE spu_usuarios_actualizarclave
(
	IN _idusuario INT,
	IN _clave	VARCHAR(100)
)
BEGIN
	UPDATE usuarios SET clave = _clave WHERE idusuario = _idusuario;
END $$

DELIMITER $$
CREATE PROCEDURE spu_actualizar_a_colaborador(IN _idusuario INT)
BEGIN
	UPDATE usuarios SET
		nivelacceso = 'C'
	WHERE idusuario = _idusuario;
END $$

DELIMITER $$
CREATE PROCEDURE spu_listausuarios_registrados()
BEGIN
	SELECT idusuario, personas.apellidos, personas.nombres, fechaalta, nivelacceso
		FROM usuarios
		INNER JOIN personas ON personas.idpersona = usuarios.idpersona
		WHERE nivelacceso = 'U';
END $$
SELECT * FROM usuarios;
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
SELECT * FROM mascotas;

DELIMITER $$
CREATE PROCEDURE spu_mascotas_registro
(
	IN _idusuario 			INT,
	IN _idraza 			INT,
	IN _nombremascota		VARCHAR(30),
	IN _genero			CHAR(1),
	IN _fechanacimiento		DATE,
	IN _observaciones		TEXT,
	IN _esterilizacion 		CHAR(1),
	IN _fotografia			VARCHAR(100)
)
BEGIN
	INSERT INTO mascotas (idusuario, idraza, nombremascota, genero, fechanacimiento, observaciones, esterilizacion, estado, vive, apadrinado, fotografia)
		VALUES (_idusuario, _idraza, _nombremascota, _genero, _fechanacimiento, _observaciones, _esterilizacion, "R", "S", "N", _fotografia);
END $$

DELIMITER $$
CREATE PROCEDURE spu_mascotas_registro_perdidos
(
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
END $$

DELIMITER $$
CREATE PROCEDURE spu_mascotas_listar()
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
		WHERE apadrinado = "N" AND estado = "R" ORDER BY animales.animal; 
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

DELIMITER $$
CREATE PROCEDURE spu_mascotasperdidas_listar()
BEGIN
	SELECT CASE
			WHEN genero = 'H' THEN 'Hembra'
			WHEN genero = "M" THEN 'Macho'           
		END 'genero', animales.animal, idmascotaperdida, fecha, ubicacion, fotografia, nombretemp
		FROM mascotasperdidas
	INNER JOIN razas ON razas.idraza = mascotasperdidas.idraza
		INNER JOIN animales ON animales.idanimal = razas.idanimal
		WHERE recuperado= "N";
END $$

DELIMITER $$
CREATE PROCEDURE spu_mascotasperdidas_eliminar
(
_idmascotaperdida INT
)
BEGIN
	DELETE FROM mascotasperdidas WHERE idmascotaperdida = _idmascotaperdida;
END $$

DELIMITER $$
CREATE PROCEDURE spu_mascotas_general()
BEGIN
	SELECT idmascota, mascotas.nombremascota, animales.animal, fotografia,
		CASE
			WHEN genero = 'H' THEN 'Hembra'
			WHEN genero = "M" THEN 'Macho'           
		END 'genero'
	FROM mascotas
	INNER JOIN razas ON razas.idraza = mascotas.idraza
	INNER JOIN animales ON animales.idanimal = razas.idanimal;
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
END $$

DELIMITER $$ 
CREATE PROCEDURE spu_mascotas_genero
(
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
END $$

DELIMITER $$ 
CREATE PROCEDURE spu_mascotas_esterilizacion
(
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
END $$

DELIMITER $$
CREATE PROCEDURE spu_mascotas_adoptadas_listar()
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
END $$
-- ------------------------------------------------------------
-- ADOPCIONES
-- ------------------------------------------------------------

DELIMITER $$
CREATE PROCEDURE spu_adopcion_listar_tabla()
BEGIN
    SELECT animales.animal, mascotas.idmascota , mascotas.nombremascota, personas.apellidos, personas.nombres, fechaadopcion, fecharetorno, mascotas.estado 
		FROM adopciones
    INNER JOIN personas ON personas.idpersona = adopciones.idpersona
    INNER JOIN mascotas ON mascotas.idmascota = adopciones.idmascota
    INNER JOIN razas ON razas.idraza = mascotas.idraza
    INNER JOIN animales ON animales.idanimal = razas.idanimal
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
-- TIPO DE EVENTOS
-- ------------------------------------------------------------

DELIMITER $$
CREATE PROCEDURE spu_tipoeventos_registrar
(
	IN _tipoevento	VARCHAR(100)
)
BEGIN
	INSERT INTO tipoeventos (tipoevento, fechainicio, fechatermino)
		VALUES (_tipoevento, CURDATE() , NULL);
END $$

CALL spu_tipoeventos_registrar("Campaña de esterilización 'Mascotas Felices'")

DELIMITER $$
CREATE PROCEDURE spu_tipoeventos_listar()
BEGIN
	SELECT * FROM tipoeventos WHERE fechatermino IS NULL;
END $$

DELIMITER $$
CREATE PROCEDURE spu_tipoeventos_terminados_listar()
BEGIN
	SELECT * FROM tipoeventos WHERE fechatermino IS NOT NULL;
END $$

DELIMITER $$
CREATE PROCEDURE spu_tipoeventos_terminar
(
	IN _idtipoevento INT
)
BEGIN
	UPDATE tipoeventos SET 
		fechatermino = CURDATE()
	WHERE idtipoevento = _idtipoevento;
END $$

DELIMITER $$
CREATE PROCEDURE spu_tipoeventos_listar_todo()
BEGIN
	SELECT * FROM tipoeventos ORDER BY tipoevento;
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
	SELECT idevento, animales.animal, mascotas.nombremascota, tipoeventos.tipoevento, fechahora, informacion FROM eventos
	INNER JOIN tipoeventos ON tipoeventos.idtipoevento = eventos.idtipoevento
	INNER JOIN mascotas ON mascotas.idmascota = eventos.idmascota
	INNER JOIN razas ON razas.idraza = mascotas.idraza
	INNER JOIN animales ON animales.idanimal = razas.idanimal;
END $$

DELIMITER $$
CREATE PROCEDURE spu_eventos_filtro_tipoeventos(IN _idtipoevento INT)
BEGIN
SELECT idevento, animales.animal, mascotas.nombremascota, tipoeventos.tipoevento, fechahora, informacion
	FROM eventos
		INNER JOIN tipoeventos ON tipoeventos.idtipoevento = eventos.idtipoevento
		INNER JOIN mascotas ON mascotas.idmascota = eventos.idmascota
		INNER JOIN razas ON razas.idraza = mascotas.idraza
		INNER JOIN animales ON animales.idanimal = razas.idanimal
	WHERE tipoeventos.idtipoevento = _idtipoevento;  
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
	INSERT INTO voluntarios (idpersona, fechainicio, fechafin, descripcionvol)
		VALUES (_idpersona, CURDATE(), NULL , _descripcionvol);
	
	UPDATE personas SET
		voluntario = "S"
	WHERE idpersona = _idpersona;
END $$

DELIMITER $$
CREATE PROCEDURE spu_voluntarios_listar()
BEGIN
	SELECT idvoluntario, personas.idpersona, personas.apellidos, personas.nombres, voluntarios.fechainicio, voluntarios.fechafin, voluntarios.descripcionvol, personas.voluntario
		FROM voluntarios
		INNER JOIN personas ON personas.idpersona = voluntarios.idpersona
		WHERE fechafin IS NULL
	ORDER BY fechainicio DESC;
END $$

DELIMITER $$
CREATE PROCEDURE spu_voluntarios_archivados()
BEGIN
	SELECT idvoluntario, personas.idpersona, personas.apellidos, personas.nombres, voluntarios.fechainicio, voluntarios.fechafin, voluntarios.descripcionvol, personas.voluntario
		FROM voluntarios
		INNER JOIN personas ON personas.idpersona = voluntarios.idpersona
		WHERE fechafin IS NOT NULL
	ORDER BY fechainicio DESC;
END $$

DELIMITER $$
CREATE PROCEDURE spu_voluntarios_terminar
(
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
END $$

DELIMITER $$
CREATE PROCEDURE spu_voluntarios_devolver
(
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
END $$


DELIMITER $$
CREATE PROCEDURE spu_voluntarios_cargar()
BEGIN
	SELECT * FROM personas WHERE voluntario = "N";
END $$

-- ------------------------------------------------------------
-- DONACIONES
-- ------------------------------------------------------------

DELIMITER $$
CREATE PROCEDURE spu_donaciones_registrar
(
	IN _idpersona		INT,
	IN _idtipoapoyo 	INT,
	IN _cantidad 		INT,
	IN _descripcion		TEXT
)
BEGIN
	INSERT INTO donaciones (idpersona, idtipoapoyo, fechaapoyo, cantidad, descripcion)
		VALUES (_idpersona, _idtipoapoyo, CURDATE(), _cantidad, _descripcion);
END $$

DELIMITER $$
CREATE PROCEDURE spu_donaciones_otrasdonaciones()
BEGIN 
    SELECT  personas.apellidos, personas.nombres, tipoapoyos.tipoapoyo, fechaapoyo, descripcion 
        FROM donaciones
        INNER JOIN personas ON personas.idpersona = donaciones.idpersona
        INNER JOIN tipoapoyos ON tipoapoyos.idtipoapoyo = donaciones.idtipoapoyo
        WHERE tipoapoyo = 'Otros';
END $$

-- -------------------------------------------------------------
-- GRÁFICOS
-- -------------------------------------------------------------

DELIMITER $$
CREATE PROCEDURE spu_grafico_kilogramos()
BEGIN
SELECT  tipoapoyos.tipoapoyo, SUM(cantidad) AS "Total Kg." , YEAR(fechaapoyo) AS "AÑO"
        FROM donaciones
    INNER JOIN tipoapoyos ON tipoapoyos.idtipoapoyo = donaciones.idtipoapoyo
    WHERE tipoapoyo = "Comida"
    GROUP BY YEAR(fechaapoyo);
END $$

DELIMITER $$
CREATE PROCEDURE spu_grafico_soles()
BEGIN
SELECT  tipoapoyos.tipoapoyo, SUM(cantidad) AS "Total Soles" , YEAR(fechaapoyo) AS "AÑO"
        FROM donaciones
    INNER JOIN tipoapoyos ON tipoapoyos.idtipoapoyo = donaciones.idtipoapoyo
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

DELIMITER $$
CREATE PROCEDURE spu_grafico_adoptados_meses()
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
END $$

SELECT * FROM adopciones;

-- ---------- ---------------
--  DONACIONES COMIDA   --
-- ---------- ---------------

DELIMITER $$
CREATE PROCEDURE spu_donaciones_comida()
BEGIN
SELECT  personas.apellidos, personas.nombres, tipoapoyos.tipoapoyo, fechaapoyo, cantidad, descripcion
        FROM donaciones
    INNER JOIN tipoapoyos ON tipoapoyos.idtipoapoyo = donaciones.idtipoapoyo
    INNER JOIN personas ON personas.idpersona = donaciones.idpersona 
    WHERE tipoapoyo = "Comida";
END $$
 
DELIMITER $$
CREATE PROCEDURE spu_donaciones_comida_total()
BEGIN
SELECT SUM(cantidad) AS preciototal 
    FROM donaciones
    INNER JOIN tipoapoyos ON tipoapoyos.idtipoapoyo = donaciones.idtipoapoyo
    WHERE tipoapoyo = "Comida";
END $$

DELIMITER $$
CREATE PROCEDURE spu_donaciones_comida_mayor()
BEGIN
SELECT personas.apellidos, personas.nombres, tipoapoyos.tipoapoyo, SUM(cantidad) AS cantidad
    FROM donaciones
    INNER JOIN tipoapoyos ON tipoapoyos.idtipoapoyo = donaciones.idtipoapoyo
    INNER JOIN personas ON personas.idpersona = donaciones.idpersona 
    WHERE tipoapoyo = "Comida"
    GROUP BY personas.apellidos
    ORDER BY cantidad DESC
    LIMIT 3;
END $$

-- ---------- ---------------
--  DONACIONES DINERO   --
-- ---------- ---------------

DELIMITER $$
CREATE PROCEDURE spu_donaciones_dinero()
BEGIN
SELECT  personas.apellidos, personas.nombres, fechaapoyo, cantidad, descripcion
        FROM donaciones
    INNER JOIN tipoapoyos ON tipoapoyos.idtipoapoyo = donaciones.idtipoapoyo
    INNER JOIN personas ON personas.idpersona = donaciones.idpersona 
    WHERE tipoapoyo = "Monetario";
END $$

DELIMITER $$
CREATE PROCEDURE spu_donaciones_dinero_total()
BEGIN
SELECT SUM(cantidad) AS preciototal 
    FROM donaciones
    INNER JOIN tipoapoyos ON tipoapoyos.idtipoapoyo = donaciones.idtipoapoyo
    WHERE tipoapoyo = "Monetario";
END $$

DELIMITER $$
CREATE PROCEDURE spu_donaciones_dinero_mayor()
BEGIN
SELECT personas.apellidos, personas.nombres, tipoapoyos.tipoapoyo, SUM(cantidad) AS cantidad
    FROM donaciones
    INNER JOIN tipoapoyos ON tipoapoyos.idtipoapoyo = donaciones.idtipoapoyo
    INNER JOIN personas ON personas.idpersona = donaciones.idpersona 
    WHERE tipoapoyo = "Monetario"
    GROUP BY personas.apellidos
    ORDER BY cantidad DESC
    LIMIT 3;
END $$

-- ---------- ---------------
--  GASTOS   --
-- ---------- ---------------

DELIMITER $$
CREATE PROCEDURE spu_gastos_registrar
(
    IN _idusuario       INT,
    IN _idtipoapoyo     INT,
    IN _cantidadsalida  INT,
    IN _descripcion    	TEXT
)
BEGIN
    INSERT INTO gastos (idusuario, idtipoapoyo, fecha, cantidadsalida, descripcion)
        VALUES (_idusuario, _idtipoapoyo, NOW(), _cantidadsalida, _descripcion);
END $$

CALL spu_gastos_registrar(1, 1, 30.00, "Desayuno");
CALL spu_gastos_registrar(2, 1, 30.00, "Almuerzo");
CALL spu_gastos_registrar(3, 1, 30.00, "Cena");
CALL spu_gastos_registrar(2, 1, 1.00, "Para perrito rescatado");
CALL spu_gastos_registrar(1, 1, 1.00, "Para 3 gatos rescatados");
CALL spu_gastos_registrar(1, 2, 50.00, "Platos para comida");
CALL spu_gastos_registrar(2, 2, 100.00, "Cama para perro");
CALL spu_gastos_registrar(3, 2, 120.00, "Medicinas para perros adultos");
CALL spu_gastos_registrar(2, 2, 150.00, "Casas para gatos");
CALL spu_gastos_registrar(1, 2, 200.00, "Cirugia para gato");

SELECT * FROM gastos

DELIMITER $$
CREATE PROCEDURE spu_gastos_comida()
BEGIN
SELECT  personas.apellidos, personas.nombres, tipoapoyos.tipoapoyo, fecha, cantidadsalida, descripcion
        FROM gastos
    INNER JOIN tipoapoyos ON tipoapoyos.idtipoapoyo = gastos.idtipoapoyo
    INNER JOIN usuarios ON usuarios.idusuario = gastos.idusuario
    INNER JOIN personas ON personas.idpersona = usuarios.idpersona 
    WHERE tipoapoyo = "Comida";
END $$
 
DELIMITER $$
CREATE PROCEDURE spu_gastos_comida_total()
BEGIN
SELECT SUM(cantidadsalida) AS gastototal 
    FROM gastos
    INNER JOIN tipoapoyos ON tipoapoyos.idtipoapoyo = gastos.idtipoapoyo
    WHERE tipoapoyo = "Comida";
END $$

DELIMITER $$
CREATE PROCEDURE spu_gastos_dinero()
BEGIN
SELECT  personas.apellidos, personas.nombres, tipoapoyos.tipoapoyo, fecha, cantidadsalida, descripcion
        FROM gastos
    INNER JOIN tipoapoyos ON tipoapoyos.idtipoapoyo = gastos.idtipoapoyo
    INNER JOIN usuarios ON usuarios.idusuario = gastos.idusuario
    INNER JOIN personas ON personas.idpersona = usuarios.idpersona 
    WHERE tipoapoyo = "Monetario";
END $$

DELIMITER $$
CREATE PROCEDURE spu_gastos_dinero_total()
BEGIN
SELECT SUM(cantidadsalida) AS gastototal 
    FROM gastos
    INNER JOIN tipoapoyos ON tipoapoyos.idtipoapoyo = gastos.idtipoapoyo
    WHERE tipoapoyo = "Monetario";
END $$

-- ------------------------------------------------------------
-- dueño encontrado
-- ------------------------------------------------------------

DELIMITER $$
CREATE PROCEDURE spu_duenoencontrado_registrar
(
    IN _idpersona                INT,
    IN _idmascotaperdida     INT
)
BEGIN
    INSERT INTO duenoencontrado (idpersona, idmascotaperdida, fecha)
        VALUES (_idpersona, _idmascotaperdida, CURDATE());

    UPDATE mascotasperdidas SET
        recuperado = "S"
    WHERE idmascotaperdida = _idmascotaperdida;
END $$

DELIMITER $$
CREATE PROCEDURE spu_duenoencontrado_cargar()
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
END $$

DELIMITER $$
CREATE PROCEDURE spu_duenoencontrado_listar()
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
END $$