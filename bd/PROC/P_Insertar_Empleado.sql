DELIMITER $$

CREATE PROCEDURE P_Insertar_Empleado
(
	IN _numeroDocumento varchar(13),
	IN _nombres varchar(150),
	IN _apellidos varchar(150),	
	IN _direccion varchar(150),
	IN _telefono varchar(10),
	IN _email varchar(100),
	IN _idTipoDocumento int,
	IN _idTipoEmpleado varchar(6),		
	OUT flag_exitoso int
)
BEGIN
	DECLARE contadorPersona INT DEFAULT 0;
	DECLARE contadorEmpleado INT DEFAULT 0;
	DECLARE contador_rep INT DEFAULT 0;
	SET flag_exitoso = 0;

	SELECT count(*) into contador_rep from Persona
	WHERE numeroDocumento = _numeroDocumento;
	
	IF (contador_rep != 0) THEN
		SET flag_exitoso = 2;
	ELSE
		START TRANSACTION;
			select idPersona into contadorPersona from Persona order by idPersona desc limit 1;
			select idEmpleado into contadorEmpleado from Empleado order by idEmpleado desc limit 1;
			
			INSERT INTO Persona(idPersona,numeroDocumento,nombres,direccion,telefono,email,idTipoDocumento)
	 		VALUES(contadorPersona+1,_numeroDocumento,_nombres,_direccion,_telefono,_email,_idTipoDocumento);
	 		
	 		INSERT INTO Empleado(idEmpleado,apellidos,idPersona,idTipoEmpleado)
	 		VALUES(contadorEmpleado+1,_apellidos,contadorPersona+1,_idTipoEmpleado);
	 		
			SET flag_exitoso = 1;
		COMMIT;
	END IF;
	SELECT flag_exitoso;
END $$

DELIMITER ;