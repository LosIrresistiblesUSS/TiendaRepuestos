DELIMITER $$

CREATE PROCEDURE P_Actualizar_Cliente
(
	IN _idCliente int,
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
	DECLARE _idPersona INT;
	SET flag_exitoso = 0;		
	select idPersona into _idPersona from Cliente
	where idCliente = _idCliente limit 1;
		
		START TRANSACTION;
			UPDATE Persona SET numeroDocumento = _numeroDocumento, nombres = _nombres,
			direccion = _direccion, telefono = _telefono, email = _email,
			idTipoDocumento = _idTipoDocumento WHERE idPersona = _idPersona;
			
			UPDATE Cliente SET apellidos = _apellidos, razonSocial = _razonSocial,
			idTipoCliente = _idTipoCliente WHERE idCliente = _idCliente;
			SET flag_exitoso = 1;
		COMMIT;
		
	SELECT flag_exitoso;
END $$

DELIMITER ;