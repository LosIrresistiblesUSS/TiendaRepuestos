DELIMITER $$

CREATE PROCEDURE P_Actualizar_TipoEmpleado
(
	IN _id varchar(6),
	IN _descrip varchar(100),
	OUT flag_exitoso int
)
BEGIN
	SET flag_exitoso = 0;
		START TRANSACTION;
			UPDATE TipoEmpleado SET descripcion = _descrip
			WHERE idTipoEmpleado = _id;
			SET flag_exitoso = 1;
		COMMIT;
	SELECT flag_exitoso;
END $$

DELIMITER ;