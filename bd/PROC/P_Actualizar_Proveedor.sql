DELIMITER $$

CREATE PROCEDURE P_Actualizar_Proveedor
(
	IN _idProveedor int,
	IN _numeroDocumento varchar(13),
	IN _razonComercial varchar(150),
	IN _direccion varchar(150),
	IN _telefono varchar(10),
	IN _email varchar(100),
	IN _idTipoDocumento int,
	OUT flag_exitoso int
)
BEGIN
	DECLARE _idPersona INT;
	SET flag_exitoso = 0;		
	select idPersona into _idPersona from Proveedor
	where idProveedor = _idProveedor limit 1;
		
		START TRANSACTION;
			UPDATE Persona SET numeroDocumento = _numeroDocumento,
			direccion = _direccion, telefono = _telefono, email = _email,
			idTipoDocumento = _idTipoDocumento WHERE idPersona = _idPersona;
			
			UPDATE Proveedor SET razonComercial = _razonComercial
			WHERE idProveedor = _idProveedor;
			SET flag_exitoso = 1;
		COMMIT;
		
	SELECT flag_exitoso;
END $$

DELIMITER ;