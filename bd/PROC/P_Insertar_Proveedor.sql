DELIMITER $$

CREATE PROCEDURE P_Insertar_Proveedor
(
	IN _numeroDocumento varchar(13),
	IN _razonComercial varchar(150),
	IN _direccion varchar(150),
	IN _telefono varchar(10),
	IN _email varchar(100),
	IN _idTipoDocumento int,		
	OUT flag_exitoso int
)
BEGIN
	DECLARE contadorPersona INT DEFAULT 0;
	DECLARE contadorProveedor INT DEFAULT 0;
	DECLARE contador_rep INT DEFAULT 0;
	SET flag_exitoso = 0;

	SELECT count(*) into contador_rep from Persona
	WHERE numeroDocumento = _numeroDocumento;
	
	IF (contador_rep != 0) THEN
		SET flag_exitoso = 2;
	ELSE
		START TRANSACTION;
			select idPersona into contadorPersona from Persona order by idPersona desc limit 1;
			select idProveedor into contadorProveedor from Proveedor order by idProveedor desc limit 1;
		
			INSERT INTO Persona(idPersona,numeroDocumento,direccion,telefono,email,idTipoDocumento)
    		VALUES(contadorPersona+1,_numeroDocumento,_direccion,_telefono,_email,_idTipoDocumento);
    		
    		INSERT INTO Proveedor(idProveedor,idPersona, razonComercial)
    		VALUES(contadorProveedor+1,contadorPersona+1, _razonComercial);

			SET flag_exitoso = 1;
		COMMIT;
	END IF;
	SELECT flag_exitoso;
END $$

DELIMITER ;