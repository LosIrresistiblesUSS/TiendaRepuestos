DELIMITER $$

CREATE PROCEDURE P_Actualizar_TipoDocumento
(
	IN _id int,
	IN _descrip varchar(100),
	OUT flag_exitoso INT
)
BEGIN
	SET flag_exitoso = 0;
		START TRANSACTION;
			UPDATE TipoDocumento SET descripcion = _descrip
			WHERE idTipoDocumento = _id;
			SET flag_exitoso = 1;
		COMMIT;
	SELECT flag_exitoso;
END $$
	
DELIMITER ;