DELIMITER $$

CREATE PROCEDURE P_Insertar_VentaRepuestos
(
	IN _idOperacion int,
	IN _idCliente int,
	IN _idEmpleado int,
	
	IN _idComprobanteVenta int,
	IN _numero varchar(15),
	IN _fecha timestamp,
	IN _descripcion varchar(150),
	IN _importe decimal(7,2),
	IN _idTipoComprobanteVenta int,
	
	OUT flag_exitoso int
)
BEGIN
	DECLARE contador_rep INT DEFAULT 0;
	DECLARE _idPersonaCliente INT;
	DECLARE _idPersonaEmpleado INT;
	SET flag_exitoso = 0;

	select count(*) into contador_rep from ComprobanteVenta 
	where numero = _numero;

	IF (contador_rep != 0) THEN
		SET flag_exitoso = 2;
	ELSE
		START TRANSACTION;
			SELECT c.idPersona into _idPersonaCliente FROM Cliente as c
			inner join Persona as p on c.idPersona = p.idPersona
			where c.idCliente = _idCliente;
			
			SELECT e.idPersona into _idPersonaEmpleado FROM Empleado as e
			inner join Persona as p on e.idPersona = p.idPersona
			where e.idEmpleado = _idEmpleado;
		
			INSERT INTO ComprobanteVenta(idComprobanteVenta,numero,fecha,descripcion,importe,idTipoComprobanteVenta)
			VALUES(_idComprobanteVenta,_numero,_fecha,_descripcion,_importe,_idTipoComprobanteVenta);
			
			INSERT INTO Operacion(idOperacion,idPersonaCliente,idPersonaEmpleado)
			VALUES(_idOperacion,_idPersonaCliente,_idPersonaEmpleado);
			
			SET flag_exitoso = 1;
		COMMIT;
	END IF;
	SELECT flag_exitoso;

END $$

DELIMITER ;