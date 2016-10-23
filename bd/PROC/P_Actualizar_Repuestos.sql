DELIMITER $$

CREATE PROCEDURE P_Actualizar_Repuesto 
(
	IN _idRepuesto int, 
	IN _descrip varchar(150),
	IN _stock int, 
	IN _precio double(6,2),
	IN _precioPorMayor double(6,2), 
	OUT flag_exitoso int
)

BEGIN
	DECLARE _idProducto INT;
	SET flag_exitoso = 0;
	select idProducto into _idProducto from Repuesto
	where idRepuesto = _idRepuesto limit 1;
	
		START TRANSACTION;
	 		UPDATE Producto SET descripcion = _descrip,
			stock = _stock, precio = _precio, precioPorMayor = _precioPorMayor
	 		WHERE idProducto = _idProducto; 		
			SET flag_exitoso = 1;
		COMMIT;
		
	SELECT flag_exitoso;
END $$

DELIMITER ;