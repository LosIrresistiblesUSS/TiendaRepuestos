DELIMITER $$

CREATE PROCEDURE P_Insertar_TipoEmpleado
(
IN id varchar(6),
IN descrip varchar(100),
OUT flag_exitoso int
)
BEGIN
	DECLARE contador INT DEFAULT 0;
	DECLARE contador_rep INT DEFAULT 0;
	SET flag_exitoso = 0;

	SELECT count(*) into contador_rep from tipoempleado
	WHERE descripcion = descrip or idTipoEmpleado = id;
	
	IF (contador_rep != 0) THEN
		SET flag_exitoso = 2;
	ELSE
		START TRANSACTION;
			select idTipoEmpleado into contador from TipoEmpleado order by idTipoEmpleado desc limit 1;
			INSERT INTO tipoempleado(idTipoEmpleado, descripcion)
	 		VALUES(id, descrip);
			SET flag_exitoso = 1;
		COMMIT;
	END IF;
	SELECT flag_exitoso;
END $$
	
DELIMITER ;