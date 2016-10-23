DELIMITER $$

CREATE PROCEDURE P_Insertar_Cliente
(
	IN _numeroDocumento varchar(13),
	IN _nombres varchar(150),
	IN _apellidos varchar(100),
	IN _razonSocial varchar(100),
	IN _direccion varchar(150),
	IN _telefono varchar(10),
	IN _email varchar(100),
	IN _idTipoDocumento int,
	IN _idTipoCliente int,
	OUT flag_exitoso int
)
BEGIN
	DECLARE contadorPersona INT DEFAULT 0;
	DECLARE contadorCliente INT DEFAULT 0;
	DECLARE contador_rep INT DEFAULT 0;
	SET flag_exitoso = 0;

	SELECT count(*) into contador_rep from Persona
	WHERE numeroDocumento = _numeroDocumento;
	
	IF (contador_rep != 0) THEN
		SET flag_exitoso = 2;
	ELSE
		START TRANSACTION;
			select idPersona into contadorPersona from Persona order by idPersona desc limit 1;
			select idCliente into contadorCliente from Cliente order by idCliente desc limit 1;
			
			INSERT INTO Persona(idPersona,numeroDocumento,nombres,direccion,telefono,email,idTipoDocumento)
	 		VALUES(contadorPersona+1,_numeroDocumento,_nombres,_direccion,_telefono,_email,_idTipoDocumento);
	 		
	 		INSERT INTO Cliente(idCliente,apellidos,razonSocial,idPersona,idTipoCliente)
	 		VALUES(contadorCliente+1,_apellidos,_razonSocial,contadorPersona+1,_idTipoCliente);
	 		
			SET flag_exitoso = 1;
		COMMIT;
	END IF;
	SELECT flag_exitoso;
END $$

DELIMITER ;