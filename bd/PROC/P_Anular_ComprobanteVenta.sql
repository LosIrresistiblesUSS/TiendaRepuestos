DELIMITER $$

CREATE PROCEDURE P_Anular_ComprobanteVenta
(
	IN _idComprobanteVenta int,	
	OUT flag_exitoso int
)
BEGIN
	DECLARE _estado int;
	START TRANSACTION;
		select estado into _estado from ComprobanteVenta where idComprobanteVenta = _idComprobanteVenta;
		
		IF (_estado = true) THEN
			UPDATE ComprobanteVenta set estado = false
			where idComprobanteVenta = _idComprobanteVenta;
		ELSE
			UPDATE ComprobanteVenta set estado = true
			where idComprobanteVenta = _idComprobanteVenta;
		END IF;
	COMMIT;
	SET flag_exitoso = 1;
	SELECT flag_exitoso;		
	END $$

DELIMITER ;