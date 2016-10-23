DELIMITER $$

CREATE PROCEDURE P_Actualizar_Empleado
(
	IN _idEmpleado int,
	IN _numeroDocumento varchar(13),
	IN _nombres varchar(100),
	IN _apellidos varchar(100),
	IN _direccion varchar(150),
	IN _telefono varchar(10),
	IN _email varchar(100),
	IN _idTipoDocumento int,
	IN _idTipoEmpleado varchar(6),		
	OUT flag_exitoso int
)
BEGIN
	DECLARE _idPersona INT;
	SET flag_exitoso = 0;		
	select idPersona into _idPersona from Empleado
	where idEmpleado = _idEmpleado limit 1;
		
		START TRANSACTION;
			UPDATE Persona SET numeroDocumento = _numeroDocumento, nombres = _nombres,
			direccion = _direccion, telefono = _telefono, email = _email,
			idTipoDocumento = _idTipoDocumento WHERE idPersona = _idPersona;
			
			UPDATE Empleado SET idTipoEmpleado = _idTipoEmpleado, apellidos = _apellidos
			WHERE idEmpleado = _idEmpleado;
			SET flag_exitoso = 1;
		COMMIT;
		
	SELECT flag_exitoso;
END $$

DELIMITER ;