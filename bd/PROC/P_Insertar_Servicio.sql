DELIMITER $$

CREATE PROCEDURE P_Insertar_Servicio
(
    IN _descrip varchar(150),
    IN _precio double(6,2),
	 IN _idTipoServico int,
    OUT flag_exitoso int
)
BEGIN
	DECLARE contadorProducto INT DEFAULT 0;
	DECLARE contadorServicio INT DEFAULT 0;
	DECLARE contador_rep INT DEFAULT 0;
	SET flag_exitoso = 0;

	SELECT count(*) into contador_rep from Producto
	WHERE descripcion = _descrip;
	
	IF (contador_rep != 0) THEN
		SET flag_exitoso = 2;
	ELSE
		START TRANSACTION;
			select idProducto into contadorProducto from Producto order by idProducto desc limit 1;
			select idServicio into contadorServicio from Servicio order by idServicio desc limit 1;
		
			INSERT INTO Producto(idProducto,descripcion,precio)
    		VALUES(contadorProducto+1, _descrip, _precio);
    		
    		INSERT INTO Servicio(idServicio, idProducto,idTipoServicio)
    		VALUES(contadorServicio+1, contadorProducto+1,_idTipoServico);
    		
    		SET flag_exitoso = 1;
 		COMMIT;
	END IF;
	SELECT flag_exitoso;
END $$

DELIMITER ;