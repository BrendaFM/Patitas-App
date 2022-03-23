USE patitasapp;

DELIMITER $$
DROP PROCEDURE spu_mascotas_listar()
BEGIN
	SELECT mascotas.nombremascota, razas.raza, mascotas.genero, mascotas.fechanacimiento FROM mascotas
	INNER JOIN razas ON razas.idraza = mascotas.idraza;
END $$

CALL spu_mascotas_listar();