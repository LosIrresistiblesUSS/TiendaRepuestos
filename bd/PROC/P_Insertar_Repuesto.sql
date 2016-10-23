DELIMITER $$

CREATE PROCEDURE P_Insertar_Repuesto
(
    IN _descrip varchar(150),
    IN _stock int,
    IN _precio double(6,2),
    IN _precioPorMayor double(6,2),
    OUT flag_exitoso int
)
BEGIN
	DECLARE contadorProducto INT DEFAULT 0;
	DECLARE contadorRepuesto INT DEFAULT 0;
	DECLARE contador_rep INT DEFAULT 0;
	SET flag_exitoso = 0;

	SELECT count(*) into contador_rep from Producto
	WHERE descripcion = _descrip;
	
	IF (contador_rep != 0) THEN
		SET flag_exitoso = 2;
	ELSE
		START TRANSACTION;		
			select idProducto into contadorProducto from Producto order by idProducto desc limit 1;
			select idRepuesto into contadorRepuesto from Repuesto order by idRepuesto desc limit 1;

			INSERT INTO Producto(idProducto,descripcion,stock,precio,precioPorMayor)
    		VALUES(contadorProducto+1, _descrip, _stock, _precio, _precioPorMayor);
    		
    		INSERT INTO Repuesto(idRepuesto, idProducto)
    		VALUES(contadorRepuesto+1, contadorProducto+1);
    		
			SET flag_exitoso = 1;
 		COMMIT;			
	END IF;
	SELECT flag_exitoso;
END $$

DELIMITER ;