DELIMITER $$

CREATE PROCEDURE P_Insertar_TipoDocumento
(
	IN descrip varchar(100),
	OUT flag_exitoso int
)
BEGIN
	DECLARE contador INT DEFAULT 0;
	DECLARE contador_rep INT DEFAULT 0;
	SET flag_exitoso = 0;

	SELECT count(*) into contador_rep from TipoDocumento
	WHERE descripcion = descrip;
	
	IF (contador_rep != 0) THEN
		SET flag_exitoso = 2;
	ELSE
		START TRANSACTION;
			select idTipoDocumento into contador from TipoDocumento order by idTipoDocumento desc limit 1;
			INSERT INTO TipoDocumento(idTipoDocumento, descripcion)
    		VALUES(contador+1, descrip);
			SET flag_exitoso = 1;
		COMMIT;
	END IF;
	SELECT flag_exitoso;
END $$
	
DELIMITER ;