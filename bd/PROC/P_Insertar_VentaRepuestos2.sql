DELIMITER $$

CREATE PROCEDURE P_Insertar_VentaRepuestos2
(
	IN _cantidad int,
	IN _precio decimal(7,2),
	IN _subtotal decimal(7,2),
	IN _idOperacion int,
	IN _idComprobanteVenta int,
	IN _idRepuesto int,

	OUT flag_exitoso int
)
BEGIN
	DECLARE contadorDetalleOperacion INT DEFAULT 0;
	DECLARE contadorDetalleVenta INT DEFAULT 0;
	
	DECLARE _idProducto INT;

	SET flag_exitoso = 0;

		START TRANSACTION;
			select idDetalleOperacion into contadorDetalleOperacion from DetalleOperacion
			order by idDetalleOperacion desc limit 1;
			
			select idDetalleVenta into contadorDetalleVenta from DetalleVenta
			order by idDetalleVenta desc limit 1;
			
			select r.idProducto into _idProducto from Repuesto as r inner join Producto as p
			on r.idProducto = p.idProducto where r.idRepuesto = _idRepuesto;
		
			
			INSERT INTO DetalleOperacion(idDetalleOperacion,cantidad,precio,subTotal,idOperacion,idProducto)
			VALUES(contadorDetalleOperacion+1,_cantidad,_precio,_subtotal,_idOperacion,_idProducto);
			
			INSERT INTO DetalleVenta(idDetalleVenta,idComprobanteVenta,idDetalleOperacion)
			VALUES(contadorDetalleVenta+1,_idComprobanteVenta,contadorDetalleOperacion+1);
			
			SET flag_exitoso = 1;
		COMMIT;

	SELECT flag_exitoso;

END $$

DELIMITER ;