DELIMITER $$
CREATE PROCEDURE P_Actualizar_TipoEmpleado
(
	IN id varchar(6),
	IN descrip varchar(100),
	OUT flag_exitoso int
)
BEGIN
	DECLARE contador_rep INT DEFAULT 0;
	SET flag_exitoso = 0;
	
	SELECT count(*) into contador_rep from tipoempleado
	WHERE descripcion = descrip;
	
	IF (contador_rep != 0) THEN
		SET flag_exitoso = 2;
	ELSE
		UPDATE TipoEmpleado SET descripcion = descrip
		WHERE idTipoEmpleado = id;
		SET flag_exitoso = 1;
	END IF;
	SELECT flag_exitoso;
END
DELIMITER $$