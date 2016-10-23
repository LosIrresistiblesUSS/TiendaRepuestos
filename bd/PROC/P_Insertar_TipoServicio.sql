DELIMITER $$

CREATE PROCEDURE P_Insertar_TipoServicio
(
	IN descrip varchar(100),
	OUT flag_exitoso int
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
		START TRANSACTION;
			select idTipoServicio into contador from TipoServicio order by idTipoServicio desc limit 1;
			INSERT INTO tiposervicio(idTipoServicio, descripcion)
    		VALUES(contador+1, descrip);
			SET flag_exitoso = 1;
		COMMIT;
	END IF;
	SELECT flag_exitoso;
END $$
	
DELIMITER ;