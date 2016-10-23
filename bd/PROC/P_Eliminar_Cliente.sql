DELIMITER $$

CREATE PROCEDURE P_Eliminar_Cliente
(
	IN _idCliente int,	
	OUT flag_exitoso int
)
BEGIN
	DECLARE _idPersona int;
	SET flag_exitoso = 0;

	select idPersona into _idPersona from Cliente
	where idCliente = _idCliente limit 1;
	
	START TRANSACTION;
		DELETE FROM Cliente WHERE idCliente = _idCliente;
		DELETE FROM Persona WHERE idPersona = _idPersona;
		SET flag_exitoso = 1;
	COMMIT;
	SELECT flag_exitoso;		
END $$

DELIMITER ;