DELIMITER $$

	CREATE PROCEDURE P_Actualizar_TipoServicio
	(
		IN id INT,
		IN descrip VARCHAR(100),
		OUT flag_exitoso INT
	)
	BEGIN
		DECLARE contador_rep INT DEFAULT 0;
		SET flag_exitoso = 0;
		
		SELECT count(*) into contador_rep from tiposervicio
		WHERE descripcion = descrip;
		
		IF (contador_rep != 0) THEN
			SET flag_exitoso = 2;
		ELSE
			UPDATE TipoServicio SET descripcion = descrip
			WHERE idTipoServicio = id;
			SET flag_exitoso = 1;
		END IF;
		SELECT flag_exitoso;
	END $$
	
DELIMITER