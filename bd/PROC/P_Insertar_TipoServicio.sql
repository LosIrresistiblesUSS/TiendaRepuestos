CREATE PROCEDURE P_Insertar_TipoServicio
(
	IN descrip VARCHAR(100),
	OUT flag_exitoso INT
)
BEGIN
		DECLARE contador INT DEFAULT 0;
		DECLARE contador_rep INT DEFAULT 0;
		SET flag_exitoso = 0;
	
		SELECT count(*) into contador_rep from tiposervicio
		WHERE descripcion = descrip;
		
		IF (contador_rep != 0) THEN
			SET flag_exitoso = 2;
		ELSE
			select idTipoServicio into contador from TipoServicio order by idTipoServicio desc limit 1;
			IF (contador = 0) THEN
				INSERT INTO tiposervicio(idTipoServicio, descripcion)
	    		VALUES(1, descrip);
				SET flag_exitoso = 1;
			ELSE
				INSERT INTO tiposervicio(idTipoServicio, descripcion)
	    		VALUES(contador+1, descrip);
				SET flag_exitoso = 1;
			END IF;
		END IF;
		SELECT flag_exitoso;
	END