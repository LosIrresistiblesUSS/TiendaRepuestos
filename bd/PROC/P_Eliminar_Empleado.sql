DELIMITER $$

CREATE PROCEDURE P_Eliminar_Empleado
(
	IN _idEmpleado int,	
	OUT flag_exitoso int
)
BEGIN
	DECLARE _idPersona int;
	SET flag_exitoso = 0;

	select idPersona into _idPersona from Empleado
	where idEmpleado = _idEmpleado limit 1;
	
	START TRANSACTION;
		DELETE FROM Empleado WHERE idEmpleado = _idEmpleado;
		DELETE FROM Persona WHERE idPersona = _idPersona;
		SET flag_exitoso = 1;
	ROLLBACK;
	SELECT flag_exitoso;		
END $$

DELIMITER ;