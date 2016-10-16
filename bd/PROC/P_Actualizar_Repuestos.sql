DELIMITER $$
CREATE PROCEDURE P_Actualizar_Repuesto 
(IN _idrepuesto int, 
 IN _descrip varchar(150),
 IN _stock int, 
 IN _precio double(6,2),
 IN _precioPorMayor double(6,2), 
 OUT flag_exitoso int

)

BEGIN
	DECLARE id INT DEFAULT 0;
	DECLARE contador_rep INT DEFAULT 0;
	DECLARE descri varchar(100) DEFAULT NULL;
	SET flag_exitoso = 0;

	SELECT count(*) into contador_rep from Producto
	WHERE descripcion = _descrip;

	SELECT descripcion into descri from Producto
	WHERE descripcion = _descrip;

	IF (contador_rep != 0 and _descrip != descri) THEN
			SET flag_exitoso = 2;
	ELSE
   	select p.idProducto into id from
		Producto as p inner join Repuesto as r
		on p.idProducto = r.idProducto
		where r.idRepuesto = _idrepuesto;
		  		
 		UPDATE Producto SET descripcion = _descrip,
		stock = _stock, precio = _precio, precioPorMayor = _precioPorMayor
 		WHERE idproducto = id;
		SET flag_exitoso = 1;
		
	END IF;
	SELECT flag_exitoso;
END
DELIMITER $$