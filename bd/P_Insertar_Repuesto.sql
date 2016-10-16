DELIMITER $$

	CREATE PROCEDURE P_Insertar_Repuesto
	(
		 IN _idProducto int,
	    IN _descrip varchar(150),
       IN _stock int,
	    IN _precio double(6,2),
	    IN _precioPorMayor double(6,2),
	    OUT flag_exitoso int
	)
	BEGIN
		DECLARE contador INT DEFAULT 0;
		DECLARE contador_rep INT DEFAULT 0;
		SET flag_exitoso = 0;
	
		SELECT count(*) into contador_rep from Producto
		WHERE idProducto = _idProducto or descripcion = _descrip;
		
		IF (contador_rep != 0) THEN
			SET flag_exitoso = 2;
		ELSE
			select idRepuesto into contador from Repuesto order by idRepuesto desc limit 1;
			IF (contador = 0) THEN
				INSERT INTO Producto(idProducto, descripcion,stock,precio,precioPorMayor)
	    		VALUES(_idProducto, _descrip, _stock, _precio, _precioPorMayor);
	    		
	    		INSERT INTO Repuesto(idRepuesto, idProducto)
	    		VALUES(1, _idProducto);
	    		
				SET flag_exitoso = 1;
			ELSE
				INSERT INTO Producto(idProducto, descripcion,stock,precio,precioPorMayor)
	    		VALUES(_idProducto, _descrip, _stock, _precio, _precioPorMayor);

				INSERT INTO Repuesto(idRepuesto, idProducto)
	    		VALUES(contador+1, _idProducto);

				SET flag_exitoso = 1;
			END IF;
		END IF;
		SELECT flag_exitoso;
	END $$

DELIMITER ;