DELIMITER $$

	CREATE PROCEDURE P_Actualizar_Empleado
	(
		IN _idEmpleado int,
		IN _numeroDocumento varchar(13),
		IN _nombres varchar(150),
		IN _direccion varchar(150),
		IN _telefono varchar(10),
		IN _email varchar(100),
		IN _idTipoDocumento int,
		IN _idTipoEmpleado varchar(6),		
		OUT flag_exitoso int
	)
	BEGIN
		DECLARE contador_rep INT DEFAULT 0;
		DECLARE _idPersona INT;
		DECLARE docu varchar(13);
		SET flag_exitoso = 0;
		
		select count(*) into contador_rep
		from Persona as p inner join Empleado as e
		on p.idPersona = e.idPersona
		where p.numeroDocumento = _numeroDocumento;

		IF (contador_rep = 2) THEN
			SET flag_exitoso = 2;
		ELSE
			select idPersona into _idPersona from Empleado
			where idEmpleado = _idEmpleado limit 1;
			
			UPDATE Persona SET numeroDocumento = _numeroDocumento, nombres = _nombres,
			direccion = _direccion, telefono = _telefono, email = _email,
			idTipoDocumento = _idTipoDocumento WHERE idPersona = _idPersona;
			
			UPDATE Empleado SET idTipoEmpleado = _idTipoEmpleado
			WHERE idEmpleado = _idEmpleado;
			SET flag_exitoso = 1;
		END IF;
		SELECT flag_exitoso;
	END $$
	
DELIMITER ;