DELIMITER $$

CREATE PROCEDURE P_Eliminar_Proveedor
(
	IN _idProveedor int,	
	OUT flag_exitoso int
)
BEGIN
	DECLARE _idPersona int;
	SET flag_exitoso = 0;

	select idPersona into _idPersona from Proveedor
	where idProveedor = _idProveedor limit 1;
	
	START TRANSACTION;
		DELETE FROM Proveedor WHERE idProveedor = _idProveedor;
		DELETE FROM Persona WHERE idPersona = _idPersona;
		SET flag_exitoso = 1;
	COMMIT;
	SELECT flag_exitoso;		
END $$

DELIMITER ;