-- phpMyAdmin SQL Dump
-- version 4.5.1
-- http://www.phpmyadmin.net
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 29-10-2016 a las 00:11:46
-- Versión del servidor: 10.1.13-MariaDB
-- Versión de PHP: 5.6.23

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `irresistibles`
--

DELIMITER $$
--
-- Procedimientos
--
CREATE DEFINER=`root`@`localhost` PROCEDURE `P_Actualizar_Cliente` (IN `_idCliente` INT, IN `_numeroDocumento` VARCHAR(13), IN `_nombres` VARCHAR(150), IN `_apellidos` VARCHAR(100), IN `_razonSocial` VARCHAR(100), IN `_direccion` VARCHAR(150), IN `_telefono` VARCHAR(10), IN `_email` VARCHAR(100), IN `_idTipoDocumento` INT, IN `_idTipoCliente` INT, OUT `flag_exitoso` INT)  BEGIN
	DECLARE _idPersona INT;
	SET flag_exitoso = 0;		
	select idPersona into _idPersona from Cliente
	where idCliente = _idCliente limit 1;
		
		START TRANSACTION;
			UPDATE Persona SET numeroDocumento = _numeroDocumento, nombres = _nombres,
			direccion = _direccion, telefono = _telefono, email = _email,
			idTipoDocumento = _idTipoDocumento WHERE idPersona = _idPersona;
			
			UPDATE Cliente SET apellidos = _apellidos, razonSocial = _razonSocial,
			idTipoCliente = _idTipoCliente WHERE idCliente = _idCliente;
			SET flag_exitoso = 1;
		COMMIT;
		
	SELECT flag_exitoso;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `P_Actualizar_Empleado` (IN `_idEmpleado` INT, IN `_numeroDocumento` VARCHAR(13), IN `_nombres` VARCHAR(100), IN `_apellidos` VARCHAR(100), IN `_direccion` VARCHAR(150), IN `_telefono` VARCHAR(10), IN `_email` VARCHAR(100), IN `_idTipoDocumento` INT, IN `_idTipoEmpleado` VARCHAR(6), OUT `flag_exitoso` INT)  BEGIN
		DECLARE _idPersona INT;
		SET flag_exitoso = 0;		
			select idPersona into _idPersona from Empleado
			where idEmpleado = _idEmpleado limit 1;
			
			START TRANSACTION;
				UPDATE Persona SET numeroDocumento = _numeroDocumento, nombres = _nombres,
				direccion = _direccion, telefono = _telefono, email = _email,
				idTipoDocumento = _idTipoDocumento WHERE idPersona = _idPersona;
				
				UPDATE Empleado SET idTipoEmpleado = _idTipoEmpleado, apellidos = _apellidos
				WHERE idEmpleado = _idEmpleado;
				SET flag_exitoso = 1;
			COMMIT;
		SELECT flag_exitoso;
	END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `P_Actualizar_Proveedor` (IN `_idProveedor` INT, IN `_numeroDocumento` VARCHAR(13), IN `_razonComercial` VARCHAR(150), IN `_direccion` VARCHAR(150), IN `_telefono` VARCHAR(10), IN `_email` VARCHAR(100), IN `_idTipoDocumento` INT, OUT `flag_exitoso` INT)  BEGIN
	DECLARE _idPersona INT;
	SET flag_exitoso = 0;		
	select idPersona into _idPersona from Proveedor
	where idProveedor = _idProveedor limit 1;
		
		START TRANSACTION;
			UPDATE Persona SET numeroDocumento = _numeroDocumento,
			direccion = _direccion, telefono = _telefono, email = _email,
			idTipoDocumento = _idTipoDocumento WHERE idPersona = _idPersona;
			
			UPDATE Proveedor SET razonComercial = _razonComercial
			WHERE idProveedor = _idProveedor;
			SET flag_exitoso = 1;
		COMMIT;
		
	SELECT flag_exitoso;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `P_Actualizar_Repuesto` (IN `_idRepuesto` INT, IN `_descrip` VARCHAR(150), IN `_stock` INT, IN `_precio` DOUBLE(6,2), IN `_precioPorMayor` DOUBLE(6,2), OUT `flag_exitoso` INT)  BEGIN
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
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `P_Actualizar_TipoDocumento` (IN `_id` INT, IN `_descrip` VARCHAR(100), OUT `flag_exitoso` INT)  BEGIN
	SET flag_exitoso = 0;
		START TRANSACTION;
			UPDATE TipoDocumento SET descripcion = _descrip
			WHERE idTipoDocumento = _id;
			SET flag_exitoso = 1;
		COMMIT;
	SELECT flag_exitoso;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `P_Actualizar_TipoEmpleado` (IN `_id` VARCHAR(6), IN `_descrip` VARCHAR(100), OUT `flag_exitoso` INT)  BEGIN
	SET flag_exitoso = 0;
		START TRANSACTION;	
			UPDATE TipoEmpleado SET descripcion = _descrip
			WHERE idTipoEmpleado = _id;
			SET flag_exitoso = 1;
		COMMIT;
	SELECT flag_exitoso;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `P_Actualizar_TipoServicio` (IN `_id` INT, IN `_descrip` VARCHAR(100), OUT `flag_exitoso` INT)  BEGIN
	SET flag_exitoso = 0;
		START TRANSACTION;
			UPDATE TipoServicio SET descripcion = _descrip
			WHERE idTipoServicio = _id;
			SET flag_exitoso = 1;
		COMMIT;
	SELECT flag_exitoso;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `P_Anular_ComprobanteVenta` (IN `_idComprobanteVenta` INT, OUT `flag_exitoso` INT)  BEGIN
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
	END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `P_Eliminar_Cliente` (IN `_idCliente` INT, OUT `flag_exitoso` INT)  BEGIN
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
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `P_Eliminar_Empleado` (IN `_idEmpleado` INT, OUT `flag_exitoso` INT)  BEGIN
	DECLARE _idPersona int;
	SET flag_exitoso = 0;

	select idPersona into _idPersona from Empleado
	where idEmpleado = _idEmpleado limit 1;
	
	START TRANSACTION;
		DELETE FROM Empleado WHERE idEmpleado = _idEmpleado;
		DELETE FROM Persona WHERE idPersona = _idPersona;
		SET flag_exitoso = 1;
	COMMIT;
	SELECT flag_exitoso;		
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `P_Eliminar_Proveedor` (IN `_idProveedor` INT, OUT `flag_exitoso` INT)  BEGIN
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
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `P_Insertar_Cliente` (IN `_numeroDocumento` VARCHAR(13), IN `_nombres` VARCHAR(150), IN `_apellidos` VARCHAR(100), IN `_razonSocial` VARCHAR(100), IN `_direccion` VARCHAR(150), IN `_telefono` VARCHAR(10), IN `_email` VARCHAR(100), IN `_idTipoDocumento` INT, IN `_idTipoCliente` INT, OUT `flag_exitoso` INT)  BEGIN
	DECLARE contadorPersona INT DEFAULT 0;
	DECLARE contadorCliente INT DEFAULT 0;
	DECLARE contador_rep INT DEFAULT 0;
	SET flag_exitoso = 0;

	SELECT count(*) into contador_rep from Persona
	WHERE numeroDocumento = _numeroDocumento;
	
	IF (contador_rep != 0) THEN
		SET flag_exitoso = 2;
	ELSE
		START TRANSACTION;
			select idPersona into contadorPersona from Persona order by idPersona desc limit 1;
			select idCliente into contadorCliente from Cliente order by idCliente desc limit 1;
			
			INSERT INTO Persona(idPersona,numeroDocumento,nombres,direccion,telefono,email,idTipoDocumento)
	 		VALUES(contadorPersona+1,_numeroDocumento,_nombres,_direccion,_telefono,_email,_idTipoDocumento);
	 		
	 		INSERT INTO Cliente(idCliente,apellidos,razonSocial,idPersona,idTipoCliente)
	 		VALUES(contadorCliente+1,_apellidos,_razonSocial,contadorPersona+1,_idTipoCliente);
	 		
			SET flag_exitoso = 1;
		COMMIT;
	END IF;
	SELECT flag_exitoso;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `P_Insertar_Empleado` (IN `_numeroDocumento` VARCHAR(13), IN `_nombres` VARCHAR(150), IN `_apellidos` VARCHAR(150), IN `_direccion` VARCHAR(150), IN `_telefono` VARCHAR(10), IN `_email` VARCHAR(100), IN `_idTipoDocumento` INT, IN `_idTipoEmpleado` VARCHAR(6), OUT `flag_exitoso` INT)  BEGIN
	DECLARE contadorPersona INT DEFAULT 0;
	DECLARE contadorEmpleado INT DEFAULT 0;
	DECLARE contador_rep INT DEFAULT 0;
	SET flag_exitoso = 0;

	SELECT count(*) into contador_rep from Persona
	WHERE numeroDocumento = _numeroDocumento;
	
	IF (contador_rep != 0) THEN
		SET flag_exitoso = 2;
	ELSE
		START TRANSACTION;
			select idPersona into contadorPersona from Persona order by idPersona desc limit 1;
			select idEmpleado into contadorEmpleado from Empleado order by idEmpleado desc limit 1;
			
			INSERT INTO Persona(idPersona,numeroDocumento,nombres,direccion,telefono,email,idTipoDocumento)
	 		VALUES(contadorPersona+1,_numeroDocumento,_nombres,_direccion,_telefono,_email,_idTipoDocumento);
	 		
	 		INSERT INTO Empleado(idEmpleado,apellidos,idPersona,idTipoEmpleado)
	 		VALUES(contadorEmpleado+1,_apellidos,contadorPersona+1,_idTipoEmpleado);
	 		
			SET flag_exitoso = 1;
		COMMIT;
	END IF;
	SELECT flag_exitoso;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `P_Insertar_Proveedor` (IN `_numeroDocumento` VARCHAR(13), IN `_razonComercial` VARCHAR(150), IN `_direccion` VARCHAR(150), IN `_telefono` VARCHAR(10), IN `_email` VARCHAR(100), IN `_idTipoDocumento` INT, OUT `flag_exitoso` INT)  BEGIN
	DECLARE contadorPersona INT DEFAULT 0;
	DECLARE contadorProveedor INT DEFAULT 0;
	DECLARE contador_rep INT DEFAULT 0;
	SET flag_exitoso = 0;

	SELECT count(*) into contador_rep from Persona
	WHERE numeroDocumento = _numeroDocumento;
	
	IF (contador_rep != 0) THEN
		SET flag_exitoso = 2;
	ELSE
		START TRANSACTION;
			select idPersona into contadorPersona from Persona order by idPersona desc limit 1;
			select idProveedor into contadorProveedor from Proveedor order by idProveedor desc limit 1;
		
			INSERT INTO Persona(idPersona,numeroDocumento,direccion,telefono,email,idTipoDocumento)
    		VALUES(contadorPersona+1,_numeroDocumento,_direccion,_telefono,_email,_idTipoDocumento);
    		
    		INSERT INTO Proveedor(idProveedor,idPersona, razonComercial)
    		VALUES(contadorProveedor+1,contadorPersona+1, _razonComercial);

			SET flag_exitoso = 1;
		COMMIT;
	END IF;
	SELECT flag_exitoso;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `P_Insertar_Repuesto` (IN `_descrip` VARCHAR(150), IN `_stock` INT, IN `_precio` DOUBLE(6,2), IN `_precioPorMayor` DOUBLE(6,2), OUT `flag_exitoso` INT)  BEGIN
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
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `P_Insertar_Servicio` (IN `_descrip` VARCHAR(150), IN `_precio` DOUBLE(6,2), IN `_idTipoServico` INT, OUT `flag_exitoso` INT)  BEGIN
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
	END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `P_Insertar_TipoDocumento` (IN `descrip` VARCHAR(100), OUT `flag_exitoso` INT)  BEGIN
	DECLARE contador INT DEFAULT 0;
	DECLARE contador_rep INT DEFAULT 0;
	SET flag_exitoso = 0;

	SELECT count(*) into contador_rep from TipoDocumento
	WHERE descripcion = descrip;
	
	IF (contador_rep != 0) THEN
		SET flag_exitoso = 2;
	ELSE
		START TRANSACTION;
			select idTipoDocumento into contador from TipoDocumento order by idTipoDocumento desc limit 1;
			INSERT INTO TipoDocumento(idTipoDocumento, descripcion)
    		VALUES(contador+1, descrip);
			SET flag_exitoso = 1;
		COMMIT;
	END IF;
	SELECT flag_exitoso;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `P_Insertar_TipoEmpleado` (IN `id` VARCHAR(6), IN `descrip` VARCHAR(100), OUT `flag_exitoso` INT)  BEGIN
	DECLARE contador INT DEFAULT 0;
	DECLARE contador_rep INT DEFAULT 0;
	SET flag_exitoso = 0;

	SELECT count(*) into contador_rep from tipoempleado
	WHERE descripcion = descrip or idTipoEmpleado = id;
	
	IF (contador_rep != 0) THEN
		SET flag_exitoso = 2;
	ELSE
		START TRANSACTION;
			select idTipoEmpleado into contador from TipoEmpleado order by idTipoEmpleado desc limit 1;
			INSERT INTO tipoempleado(idTipoEmpleado, descripcion)
	 		VALUES(id, descrip);
			SET flag_exitoso = 1;
		COMMIT;
	END IF;
	SELECT flag_exitoso;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `P_Insertar_TipoServicio` (IN `descrip` VARCHAR(100), OUT `flag_exitoso` INT)  BEGIN
	DECLARE contador INT DEFAULT 0;
	DECLARE contador_rep INT DEFAULT 0;
	SET flag_exitoso = 0;

	SELECT count(*) into contador_rep from tiposervicio
	WHERE descripcion = descrip;
	
	IF (contador_rep != 0) THEN
		SET flag_exitoso = 2;
	ELSE
		START TRANSACTION;
			select idTipoServicio into contador from TipoServicio order by idTipoServicio desc limit 1;
			INSERT INTO tiposervicio(idTipoServicio, descripcion)
    		VALUES(contador+1, descrip);
			SET flag_exitoso = 1;
		COMMIT;
	END IF;
	SELECT flag_exitoso;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `P_Insertar_VentaRepuestos` (IN `_idOperacion` INT, IN `_idCliente` INT, IN `_idEmpleado` INT, IN `_idComprobanteVenta` INT, IN `_numero` VARCHAR(15), IN `_fecha` TIMESTAMP, IN `_descripcion` VARCHAR(150), IN `_importe` DECIMAL(7,2), IN `_idTipoComprobanteVenta` INT, OUT `flag_exitoso` INT)  BEGIN
	DECLARE contador_rep INT DEFAULT 0;
	DECLARE _idPersonaCliente INT;
	DECLARE _idPersonaEmpleado INT;
	SET flag_exitoso = 0;

	select count(*) into contador_rep from ComprobanteVenta 
	where numero = _numero;

	IF (contador_rep != 0) THEN
		SET flag_exitoso = 2;
	ELSE
		START TRANSACTION;
			SELECT c.idPersona into _idPersonaCliente FROM Cliente as c
			inner join Persona as p on c.idPersona = p.idPersona
			where c.idCliente = _idCliente;
			
			SELECT e.idPersona into _idPersonaEmpleado FROM Empleado as e
			inner join Persona as p on e.idPersona = p.idPersona
			where e.idEmpleado = _idEmpleado;
		
			INSERT INTO ComprobanteVenta(idComprobanteVenta,numero,fecha,descripcion,importe,idTipoComprobanteVenta)
			VALUES(_idComprobanteVenta,_numero,_fecha,_descripcion,_importe,_idTipoComprobanteVenta);
			
			INSERT INTO Operacion(idOperacion,idPersonaCliente,idPersonaEmpleado)
			VALUES(_idOperacion,_idPersonaCliente,_idPersonaEmpleado);
		COMMIT;
	END IF;
	SELECT flag_exitoso;

END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `P_Insertar_VentaRepuestos2` (IN `_cantidad` INT, IN `_precio` DECIMAL(7,2), IN `_subtotal` DECIMAL(7,2), IN `_idOperacion` INT, IN `_idComprobanteVenta` INT, IN `_idRepuesto` INT, OUT `flag_exitoso` INT)  BEGIN
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

END$$

DELIMITER ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `cliente`
--

CREATE TABLE `cliente` (
  `idCliente` int(11) NOT NULL,
  `apellidos` varchar(100) COLLATE utf8_spanish_ci NOT NULL,
  `razonSocial` varchar(150) COLLATE utf8_spanish_ci NOT NULL,
  `idPersona` int(11) NOT NULL,
  `idTipoCliente` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Volcado de datos para la tabla `cliente`
--

INSERT INTO `cliente` (`idCliente`, `apellidos`, `razonSocial`, `idPersona`, `idTipoCliente`) VALUES
(1, 'Amaya Diaz', '', 2, 1),
(2, '', 'Santamaria S.A.', 3, 2),
(3, 'Albulú Castillo', '', 4, 1),
(4, '', 'Barnuevo E.I.R.L', 5, 2),
(5, 'Castillo Cárdenas', '', 7, 1),
(6, '', 'Castro S.A.', 8, 2),
(7, 'Guevara Barreto', '', 11, 1),
(8, '', 'Gutierrez S.A.C', 12, 2),
(9, 'Pérez Suclupe', '', 18, 1),
(10, '', 'Ramos S.A.', 20, 2),
(11, 'Requejo Mejia', '', 21, 1),
(12, '', 'Santisteban E.I.R.L', 24, 2),
(13, 'Zarate Zarate', '', 27, 1),
(14, '', 'Muñoz S.A.', 33, 2),
(15, 'Neria Colmenares', '', 34, 1),
(16, '', 'Nuñez S.A.', 35, 2);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `comprobantecompra`
--

CREATE TABLE `comprobantecompra` (
  `idComprobanteCompra` int(11) NOT NULL,
  `fecha` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `idProveedor` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Volcado de datos para la tabla `comprobantecompra`
--

INSERT INTO `comprobantecompra` (`idComprobanteCompra`, `fecha`, `idProveedor`) VALUES
(1, '2015-05-06 05:00:00', 5),
(2, '2015-05-06 05:00:00', 9),
(3, '2015-05-15 05:00:00', 10),
(5, '2015-05-21 05:00:00', 4),
(6, '2015-05-21 05:00:00', 9),
(7, '2015-06-06 05:00:00', 3),
(8, '2015-06-08 05:00:00', 1),
(9, '2015-06-15 05:00:00', 12),
(10, '2015-06-21 05:00:00', 16),
(11, '2016-06-30 05:00:00', 2),
(12, '2016-07-01 05:00:00', 6),
(13, '2015-07-02 05:00:00', 7);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `comprobanteventa`
--

CREATE TABLE `comprobanteventa` (
  `idComprobanteVenta` int(11) NOT NULL,
  `numero` varchar(15) COLLATE utf8_spanish_ci NOT NULL,
  `fecha` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `descripcion` varchar(150) COLLATE utf8_spanish_ci DEFAULT NULL,
  `importe` decimal(7,2) DEFAULT NULL,
  `estado` bit(1) NOT NULL DEFAULT b'1',
  `idTipoComprobanteVenta` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Volcado de datos para la tabla `comprobanteventa`
--

INSERT INTO `comprobanteventa` (`idComprobanteVenta`, `numero`, `fecha`, `descripcion`, `importe`, `estado`, `idTipoComprobanteVenta`) VALUES
(1, 'F-001-000001', '2016-08-05 05:00:00', 'Realizando Ventas', '400.00', b'1', 2),
(2, 'B-001-000001', '2016-09-05 05:00:00', 'Realizando Ventas', '240.00', b'1', 1),
(3, 'F-001-000002', '2016-05-10 05:00:00', 'Realizando Ventas', '240.00', b'1', 2),
(4, 'B-001-000002', '2016-05-11 05:00:00', 'Realizando Ventas', '80.00', b'1', 1),
(5, 'F-001-000003', '2016-05-12 05:00:00', 'Realizando Ventas', '200.00', b'1', 2),
(6, 'B-001-000003', '2016-05-13 05:00:00', 'Realizando Ventas', '880.00', b'1', 1),
(7, 'F-001-000004', '2016-05-14 05:00:00', 'Realizando Ventas', '840.00', b'1', 2),
(8, 'B-001-000004', '2016-05-15 05:00:00', 'Realizando Ventas', '160.00', b'1', 1),
(9, 'F-001-000005', '2016-05-16 05:00:00', 'Realizando Ventas', '440.00', b'1', 2),
(10, 'B-001-000005', '2016-05-17 05:00:00', 'Realizando Ventas', '1300.00', b'1', 1),
(11, 'F-001-000006', '2016-05-18 05:00:00', 'Realizando Ventas', '1240.00', b'0', 2),
(12, 'B-001-000006', '2016-05-19 05:00:00', 'Realizando Ventas', '2500.00', b'1', 1),
(13, 'F-001-000007', '2016-05-20 05:00:00', 'Realizando Ventas', '1400.00', b'1', 2),
(14, 'B-001-000007', '2016-05-21 05:00:00', 'Realizando Ventas', '1280.00', b'1', 1),
(15, 'F-001-000008', '2016-05-22 05:00:00', 'Realizando Ventas', '1400.00', b'1', 2),
(16, 'B-001-000008', '2016-05-23 05:00:00', 'Realizando Ventas', '60.00', b'1', 1),
(17, 'F-001-000009', '2016-05-24 05:00:00', 'Realizando Ventas', '40.00', b'1', 2),
(18, 'B-001-000009', '2016-05-25 05:00:00', 'Realizando Ventas', '160.00', b'1', 1),
(19, 'F-001-000010', '2016-05-26 05:00:00', 'Realizando Ventas', '1180.00', b'1', 2),
(20, 'B-001-000010', '2016-05-27 05:00:00', 'Realizando Ventas', '1140.00', b'0', 1),
(21, 'F-001-000011', '2016-05-08 05:00:00', 'Realizando Ventas', '2000.00', b'1', 2),
(22, 'B-001-000011', '2016-05-29 05:00:00', 'Realizando Ventas', '1240.00', b'1', 1),
(23, 'F-001-000012', '2016-05-30 05:00:00', 'Realizando Ventas', '1240.00', b'0', 2),
(24, 'B-001-000012', '2016-05-31 05:00:00', 'Realizando Ventas', '2320.00', b'1', 1),
(25, 'F-001-000013', '2016-06-01 05:00:00', 'Realizando Ventas', '1320.00', b'0', 2),
(26, 'B-001-000013', '2016-10-28 05:00:00', '', '151.16', b'1', 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `detallecompra`
--

CREATE TABLE `detallecompra` (
  `idDetalleCompra` int(11) NOT NULL,
  `Cantidad` int(11) NOT NULL,
  `MontoTotal` decimal(8,2) NOT NULL,
  `idComprobanteCompra` int(11) NOT NULL,
  `idRepuesto` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Volcado de datos para la tabla `detallecompra`
--

INSERT INTO `detallecompra` (`idDetalleCompra`, `Cantidad`, `MontoTotal`, `idComprobanteCompra`, `idRepuesto`) VALUES
(1, 50, '2500.00', 1, 1),
(2, 25, '1125.00', 3, 3),
(3, 20, '3600.00', 5, 5),
(4, 15, '3000.00', 7, 7),
(5, 10, '1500.00', 9, 9),
(6, 30, '2400.00', 11, 11),
(7, 18, '1620.00', 13, 13),
(8, 30, '180.00', 2, 25),
(10, 30, '2400.00', 6, 42),
(11, 50, '1156.00', 8, 65),
(12, 38, '1710.00', 10, 80),
(13, 30, '693.60', 12, 95);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `detalleoperacion`
--

CREATE TABLE `detalleoperacion` (
  `idDetalleOperacion` int(11) NOT NULL,
  `cantidad` int(11) NOT NULL,
  `precio` decimal(6,2) NOT NULL,
  `subTotal` decimal(7,2) NOT NULL,
  `idOperacion` int(11) NOT NULL,
  `idProducto` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Volcado de datos para la tabla `detalleoperacion`
--

INSERT INTO `detalleoperacion` (`idDetalleOperacion`, `cantidad`, `precio`, `subTotal`, `idOperacion`, `idProducto`) VALUES
(1, 2, '50.00', '100.00', 1, 1),
(2, 1, '180.00', '180.00', 2, 30),
(3, 2, '180.00', '360.00', 3, 5),
(4, 2, '150.00', '300.00', 4, 9),
(5, 2, '20.00', '40.00', 5, 23),
(6, 1, '145.00', '145.00', 6, 40),
(7, 1, '185.00', '185.00', 7, 60),
(8, 2, '35.00', '70.00', 8, 70),
(9, 2, '23.12', '46.24', 9, 65),
(10, 1, '250.00', '250.00', 10, 43),
(11, 1, '190.00', '180.00', 11, 12),
(12, 2, '80.00', '160.00', 12, 75),
(13, 2, '50.50', '101.00', 14, 82),
(14, 2, '20.20', '40.40', 16, 90),
(15, 1, '89.00', '89.00', 17, 33),
(16, 2, '30.23', '60.46', 20, 95),
(17, 1, '100.00', '100.00', 2, 101),
(18, 1, '40.00', '40.00', 3, 106),
(19, 1, '160.00', '160.00', 6, 115),
(20, 1, '195.00', '195.00', 7, 125),
(21, 1, '70.00', '70.00', 8, 135),
(22, 1, '200.00', '200.00', 9, 140),
(23, 1, '80.00', '80.00', 10, 103),
(24, 1, '30.00', '30.00', 16, 120),
(25, 1, '200.00', '200.00', 17, 130),
(26, 1, '350.00', '350.00', 20, 133),
(27, 1, '70.60', '70.60', 23, 86),
(28, 1, '80.56', '80.56', 23, 100);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `detallepermiso`
--

CREATE TABLE `detallepermiso` (
  `idDetallePermiso` int(11) NOT NULL,
  `idLogin` int(11) NOT NULL,
  `idPermiso` int(11) NOT NULL,
  `accion` char(1) COLLATE utf8_spanish_ci NOT NULL,
  `estado` tinyint(1) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Volcado de datos para la tabla `detallepermiso`
--

INSERT INTO `detallepermiso` (`idDetallePermiso`, `idLogin`, `idPermiso`, `accion`, `estado`) VALUES
(1, 1, 1, 'l', 1),
(2, 1, 1, 'n', 0),
(3, 1, 1, 'a', 0),
(4, 1, 1, 'e', 0),
(5, 1, 2, 'l', 1),
(6, 1, 2, 'n', 0),
(7, 1, 2, 'a', 0),
(8, 1, 2, 'e', 0),
(9, 1, 3, 'l', 1),
(10, 1, 3, 'n', 0),
(11, 1, 3, 'a', 0),
(12, 1, 3, 'e', 0),
(13, 1, 4, 'l', 1),
(14, 1, 4, 'n', 0),
(15, 1, 4, 'a', 0),
(16, 1, 4, 'e', 0),
(17, 2, 1, 'l', 1),
(18, 2, 1, 'n', 0),
(19, 2, 1, 'a', 1),
(20, 2, 1, 'e', 0),
(21, 2, 2, 'l', 1),
(22, 2, 2, 'n', 0),
(23, 2, 2, 'a', 1),
(24, 2, 2, 'e', 0),
(25, 2, 3, 'l', 1),
(26, 2, 3, 'n', 0),
(27, 2, 3, 'a', 1),
(28, 2, 3, 'e', 0),
(29, 2, 4, 'l', 1),
(30, 2, 4, 'n', 0),
(31, 2, 4, 'a', 1),
(32, 2, 4, 'e', 0),
(33, 3, 1, 'l', 1),
(34, 3, 1, 'n', 1),
(35, 3, 1, 'a', 1),
(36, 3, 1, 'e', 1),
(37, 3, 2, 'l', 1),
(38, 3, 2, 'n', 1),
(39, 3, 2, 'a', 1),
(40, 3, 2, 'e', 1),
(41, 3, 3, 'l', 1),
(42, 3, 3, 'n', 1),
(43, 3, 3, 'a', 1),
(44, 3, 3, 'e', 1),
(45, 3, 4, 'l', 1),
(46, 3, 4, 'n', 1),
(47, 3, 4, 'a', 1),
(48, 3, 4, 'e', 1),
(49, 4, 1, 'l', 1),
(50, 4, 1, 'n', 0),
(51, 4, 1, 'a', 1),
(52, 4, 1, 'e', 0),
(53, 4, 2, 'l', 1),
(54, 4, 2, 'n', 0),
(55, 4, 2, 'a', 1),
(56, 4, 2, 'e', 0),
(57, 4, 3, 'l', 1),
(58, 4, 3, 'n', 0),
(59, 4, 3, 'a', 1),
(60, 4, 3, 'e', 0),
(61, 4, 4, 'l', 1),
(62, 4, 4, 'n', 0),
(63, 4, 4, 'a', 1),
(64, 4, 4, 'e', 0),
(65, 5, 1, 'l', 1),
(66, 5, 1, 'n', 1),
(67, 5, 1, 'a', 1),
(68, 5, 1, 'e', 1),
(69, 5, 2, 'l', 1),
(70, 5, 2, 'n', 1),
(71, 5, 2, 'a', 1),
(72, 5, 2, 'e', 1),
(73, 5, 3, 'l', 1),
(74, 5, 3, 'n', 1),
(75, 5, 3, 'a', 1),
(76, 5, 3, 'e', 1),
(77, 5, 4, 'l', 1),
(78, 5, 4, 'n', 1),
(79, 5, 4, 'a', 1),
(80, 5, 4, 'e', 1),
(81, 6, 1, 'l', 1),
(82, 6, 1, 'n', 0),
(83, 6, 1, 'a', 0),
(84, 6, 1, 'e', 0),
(85, 6, 2, 'l', 1),
(86, 6, 2, 'n', 0),
(87, 6, 2, 'a', 0),
(88, 6, 2, 'e', 0),
(89, 6, 3, 'l', 1),
(90, 6, 3, 'n', 0),
(91, 6, 3, 'a', 0),
(92, 6, 3, 'e', 0),
(93, 6, 4, 'l', 1),
(94, 6, 4, 'n', 0),
(95, 6, 4, 'a', 0),
(96, 6, 4, 'e', 0);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `detalleventa`
--

CREATE TABLE `detalleventa` (
  `idDetalleVenta` int(11) NOT NULL,
  `idComprobanteVenta` int(11) NOT NULL,
  `idDetalleOperacion` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Volcado de datos para la tabla `detalleventa`
--

INSERT INTO `detalleventa` (`idDetalleVenta`, `idComprobanteVenta`, `idDetalleOperacion`) VALUES
(1, 1, 2),
(2, 3, 4),
(3, 5, 6),
(4, 7, 8),
(5, 9, 10),
(6, 11, 12),
(7, 13, 14),
(8, 15, 16),
(9, 17, 18),
(10, 19, 20),
(11, 21, 22),
(12, 23, 24),
(13, 25, 26),
(14, 2, 3),
(15, 4, 5),
(16, 6, 7),
(17, 8, 9),
(18, 10, 11),
(19, 12, 13),
(20, 14, 15),
(21, 16, 17),
(22, 18, 19),
(23, 20, 21),
(24, 22, 23),
(25, 24, 25),
(26, 26, 27),
(27, 26, 28);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `empleado`
--

CREATE TABLE `empleado` (
  `idEmpleado` int(11) NOT NULL,
  `apellidos` varchar(100) COLLATE utf8_spanish_ci NOT NULL,
  `idPersona` int(11) NOT NULL,
  `idTipoEmpleado` varchar(6) COLLATE utf8_spanish_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Volcado de datos para la tabla `empleado`
--

INSERT INTO `empleado` (`idEmpleado`, `apellidos`, `idPersona`, `idTipoEmpleado`) VALUES
(1, 'Acuña Cotrina', 36, 'EMP001'),
(2, 'Cantos Morante', 6, 'EMP001'),
(3, 'Otero Arrascue', 17, 'EMP002'),
(4, 'Zeña Zeña', 28, 'EMP002'),
(5, 'Santisteban Ayasta', 23, 'EMP003'),
(6, 'Chinguel Rodriguez', 32, 'EMP004');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `kardex`
--

CREATE TABLE `kardex` (
  `idKardex` int(11) NOT NULL,
  `detalle` varchar(250) COLLATE utf8_spanish_ci DEFAULT NULL,
  `cantidadIngreso` int(11) DEFAULT NULL,
  `precioIngreso` decimal(6,2) DEFAULT NULL,
  `cantidadSalida` int(11) DEFAULT NULL,
  `precioSalida` decimal(6,2) DEFAULT NULL,
  `idRepuesto` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Volcado de datos para la tabla `kardex`
--

INSERT INTO `kardex` (`idKardex`, `detalle`, `cantidadIngreso`, `precioIngreso`, `cantidadSalida`, `precioSalida`, `idRepuesto`) VALUES
(1, 'Manilla', 200, '50.00', 150, '50.00', 1),
(2, 'Manilla interior derecha', 100, '45.00', 50, '45.00', 51),
(3, 'Abrazadera Metalica', 25, '45.00', 12, '45.00', 52),
(4, 'Frenos', 50, '180.00', 15, '180.00', 3),
(5, 'Filtros', 30, '50.00', 10, '50.00', 53),
(6, 'Sistema de Encendidos', 40, '200.00', 15, '200.00', 4),
(7, 'Suspension/Amortiguacion', 15, '100.00', 12, '100.00', 54),
(8, 'Suspension de Ejes', 80, '150.00', 13, '150.00', 5),
(9, 'Guia de Ruedas', 90, '50.00', 14, '50.00', 55),
(10, 'Carroceria', 120, '80.00', 25, '80.00', 6),
(11, 'Sistema Electrico', 236, '180.00', 16, '180.00', 56),
(12, 'Refrigeracion', 12, '90.00', 6, '90.00', 7),
(13, 'Motor', 55, '5000.00', 19, '5000.00', 57),
(14, 'Calefaccion', 45, '202.00', 14, '202.00', 8),
(15, 'Ventilacion', 70, '150.00', 17, '150.00', 58),
(16, 'Alimentacion de Combustible', 78, '150.00', 12, '150.00', 9),
(17, 'Limpieza de Cristales', 98, '100.00', 14, '100.00', 59),
(18, 'Disco de Frenos', 66, '80.00', 45, '80.00', 10),
(19, 'Juego de pastillas de freno', 77, '50.00', 14, '50.00', 60),
(20, 'Disco de Frenos traseros', 88, '20.00', 7, '20.00', 11),
(21, 'Disco de frenos eje delantero', 98, '18.00', 50, '18.00', 61),
(22, 'Juego de pastillas de freno eje delantero', 89, '20.00', 60, '20.00', 12),
(23, 'bombillas para luces intermitentes', 56, '50.00', 25, '50.00', 62),
(24, 'bombillas para luces de marcha atrás', 32, '60.00', 14, '60.00', 13),
(25, 'Capo delantero/Piezas/ Amortiguacion', 45, '80.00', 25, '80.00', 63),
(26, 'Cubiertas/tapas', 15, '90.00', 20, '90.00', 14),
(27, 'Chapa lateral', 25, '18.00', 40, '18.00', 64),
(28, 'Cubierta motor', 30, '20.00', 20, '20.00', 15),
(29, 'FARO/PIEZA INSERTABLE', 50, '180.00', 5, '180.00', 65),
(30, 'LAMPARA PARA FAROS CARRETERA', 258, '20.00', 100, '20.00', 16),
(31, 'LAMPARA PARA LUCES TRASERAS', 45, '50.00', 40, '50.00', 66),
(32, 'LUCES DE LAS PUERTAS', 105, '89.00', 60, '89.00', 17),
(33, 'LUCES TRASERAS', 50, '77.00', 50, '77.00', 67),
(34, 'REVESTIMIENTO', 56, '20.00', 49, '20.00', 18),
(35, 'SPOILER', 20, '178.00', 20, '178.00', 68),
(36, 'INTERMITENTE LATERAL', 50, '190.00', 15, '190.00', 19),
(37, 'LUNAS DE VENTANA', 25, '160.00', 20, '160.00', 69),
(38, 'LAMPARA DE FARO', 74, '123.00', 30, '123.00', 20),
(39, 'GUARDA BARROS/PIEZAS ADOSADAS', 25, '145.00', 14, '145.00', 70),
(40, 'PARACHOQUES/PIEZAS', 156, '50.00', 25, '50.00', 21),
(41, 'MECANISMO/BOMBAS DE DIRECCION', 110, '80.00', 18, '80.00', 71),
(42, 'SUSPENSION DE DIRECCION', 35, '250.00', 19, '250.00', 22),
(43, 'ACEITES', 123, '20.00', 33, '20.00', 72),
(44, 'ESTERILLAS', 145, '50.00', 35, '50.00', 23),
(45, 'CONDENSADOR', 105, '10.00', 36, '10.00', 73),
(46, 'SECADOR', 50, '150.00', 37, '150.00', 24),
(47, 'LUCES DE GALIBO', 90, '189.00', 80, '189.00', 74),
(48, 'CARTER DE LA RUEDA', 50, '78.00', 40, '78.00', 25),
(49, 'FILTRO DE COMBUSTIBLE', 40, '95.00', 35, '95.00', 75),
(50, 'EMBELLECEDORES', 46, '185.00', 25, '185.00', 80);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `login`
--

CREATE TABLE `login` (
  `idLogin` int(11) NOT NULL,
  `idPersona` int(11) NOT NULL,
  `usuario` varchar(25) COLLATE utf8_spanish_ci NOT NULL,
  `pass` varchar(32) COLLATE utf8_spanish_ci NOT NULL,
  `imagen` varchar(100) COLLATE utf8_spanish_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Volcado de datos para la tabla `login`
--

INSERT INTO `login` (`idLogin`, `idPersona`, `usuario`, `pass`, `imagen`) VALUES
(1, 6, 'cantosmo', '7627cf322c11bdfb56c77206118f01cc', 'cantosmo.jpg'),
(2, 17, 'oarrascuedannyf', '76f6779c4cb31dbffdd5fe3b3a73c4df', 'oarrascuedannyf.jpg'),
(3, 23, 'sayastaleona', '717612314c973592d58e447cdd3e8bc2', 'sayastaleona.jpg'),
(4, 28, 'zzenaedins', 'c33ebbf3bc4d4008822f7267d07732a6', 'zzenaedins.jpg'),
(5, 32, 'crodriguezmilag', 'e63bd05bb93ac5000814ce53231c619e', 'crodriguezmilag.jpg'),
(6, 36, 'acotrinae', '42ffc07c053b92629cf3db3d203498d9', 'acotrinae.jpg');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `operacion`
--

CREATE TABLE `operacion` (
  `idOperacion` int(11) NOT NULL,
  `estado` tinyint(1) NOT NULL DEFAULT '1',
  `idPersonaCliente` int(11) NOT NULL,
  `idPersonaEmpleado` int(11) NOT NULL,
  `idVehiculo` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Volcado de datos para la tabla `operacion`
--

INSERT INTO `operacion` (`idOperacion`, `estado`, `idPersonaCliente`, `idPersonaEmpleado`, `idVehiculo`) VALUES
(1, 1, 2, 17, 1),
(2, 1, 3, 17, 2),
(3, 1, 4, 28, 3),
(4, 1, 5, 28, 19),
(5, 1, 7, 28, 13),
(6, 1, 8, 28, 14),
(7, 1, 11, 17, 4),
(8, 1, 12, 28, 5),
(9, 1, 18, 17, 6),
(10, 1, 20, 28, 7),
(11, 1, 21, 17, 8),
(12, 1, 24, 28, 20),
(13, 0, 27, 28, 9),
(14, 1, 33, 17, 10),
(15, 0, 34, 28, 11),
(16, 1, 35, 17, 12),
(17, 1, 11, 17, 33),
(18, 0, 7, 28, 40),
(19, 0, 18, 28, 41),
(20, 1, 27, 28, 37),
(21, 0, 5, 28, 43),
(22, 0, 34, 17, 36),
(23, 1, 33, 36, NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `permiso`
--

CREATE TABLE `permiso` (
  `idPermiso` int(11) NOT NULL,
  `descripcion` varchar(50) COLLATE utf8_spanish_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Volcado de datos para la tabla `permiso`
--

INSERT INTO `permiso` (`idPermiso`, `descripcion`) VALUES
(1, 'empleado'),
(2, 'cliente'),
(3, 'producto'),
(4, 'proveedor');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `persona`
--

CREATE TABLE `persona` (
  `idPersona` int(11) NOT NULL,
  `numeroDocumento` varchar(13) COLLATE utf8_spanish_ci NOT NULL,
  `nombres` varchar(150) COLLATE utf8_spanish_ci DEFAULT NULL,
  `direccion` varchar(150) COLLATE utf8_spanish_ci NOT NULL,
  `telefono` varchar(10) COLLATE utf8_spanish_ci DEFAULT NULL,
  `email` varchar(100) COLLATE utf8_spanish_ci DEFAULT NULL,
  `idTipoDocumento` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Volcado de datos para la tabla `persona`
--

INSERT INTO `persona` (`idPersona`, `numeroDocumento`, `nombres`, `direccion`, `telefono`, `email`, `idTipoDocumento`) VALUES
(1, '20131524545', 'Freddy Daniel', 'Av. Larco #556', '674226', 'aibanezf@crece.uss.edu.pe', 2),
(2, '001157046757', 'Christian Omar', 'Jr. Junin #555', '251145', 'adiazchri@crece.uss.edu.pe', 3),
(3, '45786218', 'Luisa Lorena', 'Av. Nicolas de Pierola #1170', '251621', 'aluisal@crece.uss.edu.pe', 1),
(4, '43219865', 'Pierre Giancarlo', 'Av. España #551', '208210', 'acastillop@crece.uss.edu.pe', 1),
(5, '49872325', 'Luis Eduardo', 'AV. Cesar Vallejo #310', '203966', 'bcornejol@crece.uss.edu.pe', 1),
(6, '46110087', 'Augusto Enrique', 'Diego de Almagro #257', '249381', 'cantosmo@crece.uss.edu.pe', 1),
(7, '001416340551', 'José Leonardo', 'Jr.San Martin #552', '242723', 'castcardjo@crece.uss.edu.pe', 3),
(8, '001564345985', 'Jhan Carlos', 'Donovan #445 (Frente Cuartel)', '295076', 'cterronesjhan@crece.uss.edu.pe', 3),
(9, '10088045853', 'Rudy Slaytonw', 'Av.Mansiche #430', '232951', 'dcastanedar@crece.uss.edu.pe', 2),
(10, '20131543337', 'Jaime Nicolas', 'Gonzales Prada #901, Urb. El Sol', '243915', 'ftellojaime@crece.uss.edu.pe', 2),
(11, '48756294', 'José Alberto', 'Av. Cesar Vallejo #278', '254731', 'gbarrejose@crece.uss.edu.pe', 1),
(12, '42136782', 'José Francisco', 'Isable de Bobadilla #268 Urb. El Recreo', '220861', 'gvalcazarj@crece.uss.edu.pe', 1),
(13, '20440229825', 'Marco Antonio', 'Jr. San Martin #256', '222446', 'hneriamarco@crece.uss.edu.pe', 2),
(14, '10178267359', 'Cesar Alberto', 'Av. España #2152', '200358', 'lbonillaca@crece.uss.edu.pe', 2),
(15, '20253604434', 'Victor Manuel', 'Jr. Bolivar #682-684', '232141', 'mpantavicto@crece.uss.edu.pe', 2),
(16, '20397132847', 'Elmer Anthony', 'Jr. Ayacucho #812', '251327', 'msandovalelmer@crece.uss.edu.pe', 2),
(17, '44085443', 'Danny Frank', 'Av. America Sur #2269', '262811', 'oarrascuedannyf@crece.uss.edu.pe', 1),
(18, '001179224181', 'Jhon Adderly', 'Jr. Zepita #566 Of.2', '250184', 'psuclupej@crece.uss.edu.pe', 3),
(19, '20314512643', 'José Luis Felipe Giovany', 'Diego de Aalmagro #746 - Trujillo', '201818', 'pcoronadojose@crece.uss.edu.pe', 2),
(20, '49736549', 'Luis Robert', 'Av. America Norte #967', '246065', 'rramosluis@crece.uss.edu.pe', 1),
(21, '49878234', 'Gustavo Adolfo', 'Av. Simón Bolivar #810', '265966', 'rmejiagua@crece.uss.edu.pe', 1),
(22, '10634875819', 'Cesar Manuel', 'Diego Maradona #347', '267881', 'selescanoc@crece.uss.edu.pe', 2),
(23, '46879528', 'Leonardo Euler', 'Jr. Junin #882', '243943', 'sayastaleona@crece.uss.edu.pe', 1),
(24, '001569964585', 'Miguel Angel', 'Divalon 445 (Frente Cuartel)', '236776', 'squispemigu@crece.uss.edu.pe', 3),
(25, '10890045853', 'Maximo Gabriel', 'Av. Ferreñafe #530', '298651', 'sparraguezmaxi@crece.uss.edu.pe', 2),
(26, '20994743337', 'Darwin Alain', 'Gonzales Privado 991, Urb. El Sol', '287915', 'vcercadodarwi@crece.uss.edu.pe', 2),
(27, '48993794', 'Elver Yoel', 'Av. Cesar Vallejo #308', '292031', 'zzrateelver@crece.uss.edu.pe', 1),
(28, '45651230', 'Edinson Omar', 'Isable Pantoja #358 Urb. El Recreo', '229871', 'zzenaedins@crece.uss.edu.pe', 1),
(29, '20440988225', 'Juan', 'Jr. San Borja #986', '226896', 'cmanayjua@crece.uss.edu.pe', 2),
(30, '10178321659', 'Anthony Giuseppe', 'Av. Mexico #9852', '209638', 'giuseppean@crece.uss.edu.pe', 2),
(31, '29953875624', 'Irvin Gregory', 'Jr. Bolivar #965', '290041', 'fecastroir@crece.uss.edu.pe', 2),
(32, '77506743', 'Milagros Maribel', 'Jr. Atahualpa #772', '296027', 'crodriguezmilag@crece.uss.edu.pe', 1),
(33, '001196547826', 'Mayra Alejandra', 'Av. America Este #9852', '260991', 'mayrazutaA@crece.uss.edu.pe', 3),
(34, '49982159', 'Jacquelin Liset', 'Av. America Sur #852', '252865', 'ncolmenaresj@crece.uss.edu.pe', 1),
(35, '49826500', 'Nolberto Romario', 'Av. Simón #920', '289366', 'nfernandeznolbe@crece.uss.edu.pe', 1),
(36, '48221945', 'Erick Joel', 'Av.Jhon Kennedy #1792', '966685004', 'acotrinae@crece.uss.edu.pe', 1),
(37, '18523075819', 'Wilfredo Cristobal', 'Diego Pele #357', '286781', 'ochavezwilfredo@crece.uss.edu.pe', 2);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `producto`
--

CREATE TABLE `producto` (
  `idProducto` int(11) NOT NULL,
  `descripcion` varchar(150) COLLATE utf8_spanish_ci DEFAULT NULL,
  `stock` int(11) DEFAULT NULL,
  `precio` decimal(6,2) NOT NULL,
  `precioPorMayor` decimal(6,2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Volcado de datos para la tabla `producto`
--

INSERT INTO `producto` (`idProducto`, `descripcion`, `stock`, `precio`, `precioPorMayor`) VALUES
(1, 'Manilla', 40, '50.00', '45.00'),
(2, 'Manilla interior derecha', 20, '45.00', '40.00'),
(3, 'Manilla interior izquierda', 20, '45.00', '40.00'),
(4, 'Abrazadera Metalica', 20, '45.00', '40.00'),
(5, 'Frenos', 10, '180.00', '170.00'),
(6, 'Filtros', 8, '50.00', '45.00'),
(7, 'Sistema de Encendidos', 20, '200.00', '190.00'),
(8, 'Suspension Amortiguacion', 50, '100.00', '95.00'),
(9, 'Suspension de Ejes', 60, '150.00', '140.00'),
(10, 'Guia de Ruedas', 20, '50.00', '45.00'),
(11, 'Carroceria', 30, '80.00', '75.00'),
(12, 'Sistema Electrico', 52, '180.00', '170.00'),
(13, 'Refrigeracion', 80, '90.00', '85.00'),
(14, 'Motor', 5, '5000.00', '4800.00'),
(15, 'Calefaccion', 20, '202.00', '195.00'),
(16, 'Ventilacion', 35, '150.00', '140.00'),
(17, 'Alimentacion de Combustible', 15, '150.00', '145.00'),
(18, 'Limpieza de Cristales', 18, '100.00', '95.00'),
(19, 'Disco de Frenos', 12, '80.00', '75.00'),
(20, 'Juego de pastillas de freno', 15, '50.00', '45.00'),
(21, 'Disco de Frenos traseros', 15, '20.00', '16.00'),
(22, 'Disco de frenos eje delantero', 18, '18.00', '15.00'),
(23, 'Juego de pastillas de freno eje delantero', 20, '20.00', '16.00'),
(24, 'bombillas para luces intermitentes', 25, '50.00', '45.00'),
(25, 'bombillas para luces de marcha atrás', 35, '60.00', '55.00'),
(26, 'Capo delantero/Piezas/ Amortiguacion', 40, '80.00', '75.00'),
(27, 'Cubiertas/tapas', 50, '90.00', '85.00'),
(28, 'Chapa lateral', 60, '18.00', '14.00'),
(29, 'Cubierta motor', 5, '20.00', '15.00'),
(30, 'FARO/PIEZA INSERTABLE', 120, '180.00', '172.00'),
(31, 'LAMPARA PARA FAROS CARRETERA', 10, '20.00', '16.00'),
(32, 'LAMPARA PARA LUCES TRASERAS', 8, '50.00', '45.00'),
(33, 'LUCES DE LAS PUERTAS', 9, '89.00', '83.00'),
(34, 'LUCES TRASERAS', 25, '77.00', '70.00'),
(35, 'REVESTIMIENTO', 100, '20.00', '16.00'),
(36, 'SPOILER', 20, '178.00', '165.00'),
(37, 'INTERMITENTE LATERAL', 79, '190.00', '175.00'),
(38, 'LUNAS DE VENTANA', 60, '160.00', '150.00'),
(39, 'LAMPARA DE FARO', 20, '123.00', '116.00'),
(40, 'GUARDA BARROS/PIEZAS ADOSADAS', 150, '145.00', '135.00'),
(41, 'PARACHOQUES/PIEZAS', 200, '50.00', '45.00'),
(42, 'MECANISMO/BOMBAS DE DIRECCION', 180, '80.00', '75.00'),
(43, 'SUSPENSION DE DIRECCION', 896, '250.00', '230.00'),
(44, 'ACEITES', 400, '20.00', '16.00'),
(45, 'ESTERILLAS', 150, '50.00', '45.00'),
(46, 'CONDENSADOR', 78, '10.00', '8.00'),
(47, 'SECADOR', 80, '150.00', '135.00'),
(48, 'LUCES DE GALIBO', 60, '189.00', '178.00'),
(49, 'CARTER DE LA RUEDA', 42, '78.00', '72.00'),
(50, 'FILTRO DE COMBUSTIBLE', 80, '95.00', '92.00'),
(51, 'BUJÍAS', 100, '12.00', '10.00'),
(52, 'INYECTORES', 10, '10.50', '8.00'),
(53, 'PISTONES', 80, '10.00', '7.00'),
(54, 'ANILLOS', 18, '20.00', '15.00'),
(55, 'BALANCINES', 100, '35.00', '30.00'),
(56, 'MONOBLOCK', 10, '25.00', '20.00'),
(57, 'LIQUIDO LIMPIA CRISTALES', 10, '21.00', '16.00'),
(58, 'ACEITE DE LIMPIEZA CASTROL 1L', 10, '35.00', '30.00'),
(59, 'JUEGO PASTILLAS DE FRENOS', 18, '54.12', '50.00'),
(60, 'EMBELLECEDORES', 10, '185.00', '170.00'),
(61, 'JUEGO DE BUJIAS', 25, '12.00', '8.00'),
(62, 'CORREO DE DISTRIBUICION', 10, '89.12', '80.00'),
(63, 'JUEGO DE ESCOBILLAS', 12, '23.90', '18.00'),
(64, 'FILTRO DE ACEITE', 40, '12.90', '8.00'),
(65, 'FILTRO DE AIRE', 20, '23.12', '20.00'),
(66, 'MANGUITO', 35, '9.12', '6.00'),
(67, 'LIQUIDO REFRIGERANTE MOTOR', 10, '54.10', '50.00'),
(68, 'BUJÍAS BOSCH IRIDIUM', 100, '20.00', '16.00'),
(69, 'BUJÍAS BOSCH PLATINIUM', 15, '28.00', '25.00'),
(70, 'BUJÍAS NGK', 120, '35.00', '31.00'),
(71, 'SISTEMA DE INYECCION DIESE', 4, '120.00', '115.00'),
(72, 'BUJÍAS BOSCH', 100, '10.00', '8.00'),
(73, 'ENBRAGUES', 100, '80.00', '76.00'),
(74, 'FILTROS DE COMBUSTIBLE', 20, '15.00', '11.00'),
(75, 'FILTROS DE CABINAS BOSCH', 20, '80.00', '79.00'),
(76, 'FILTROS DE CABINAS BOSCH ESTANDAR', 20, '85.00', '81.00'),
(77, 'LIQUIDO FRENOS BOSCH DOT 3', 10, '40.00', '36.00'),
(78, 'LIQUIDO FRENOS BOSCH DOT 4', 40, '60.00', '56.00'),
(79, 'LIQUIDO FRENOS BOSCH DOT 5.1', 30, '70.00', '65.00'),
(80, 'PASTILLAS BOSCH', 20, '45.00', '41.00'),
(81, 'PASTILLAS BOSCH CERAMIC', 20, '55.50', '51.00'),
(82, 'LAMPARAS BOSCH PURE LIGHT', 10, '50.50', '47.00'),
(83, 'Lámparas Bosch Trucklight/Estándar (para bus/camión)', 22, '60.00', '56.00'),
(84, 'Lámparas Bosch Trucklight Maxlife', 5, '70.80', '66.00'),
(85, 'Lámparas Bosch Xenon Blue', 6, '65.30', '62.00'),
(86, 'Lámparas Bosch Xenon Silve', 4, '70.60', '68.00'),
(87, 'LIMPIA PARABRISAS BOSCH ECO', 4, '80.60', '78.00'),
(88, 'LIMPIA PARABRISAS BOSCH AEROFIT', 4, '80.60', '75.00'),
(89, 'LIMPIA PARABRISAS BOSCH AEROTWIN', 4, '80.60', '75.00'),
(90, 'REFRIGERANTES BOSCH X 1 LITRO', 20, '20.20', '18.00'),
(91, 'REFRIGERANTES BOSCH X 5 LITRO', 4, '100.70', '97.00'),
(92, 'REFRIGERANTES BOSCH X 20 LITRO', 4, '400.80', '380.00'),
(93, 'REFRIGERANTES BOSCH X 205 LITRO', 4, '1000.00', '985.00'),
(94, 'LIMPIA PARABRISAS BOSCH AEROTWIN', 4, '80.60', '78.00'),
(95, 'SISTEMAS DE BOBINAS CONVECIONAL CON PLATINO BOSCH', 20, '30.23', '26.00'),
(96, 'SISTEMAS DE BOBINAS ELECTRONICO  BOSCH', 2, '50.23', '48.00'),
(97, 'BOBINAS ASFÁLTICAS', 4, '30.00', '26.00'),
(98, 'AROS ZH 125 ', 4, '124.00', '120.00'),
(99, 'LLANATAS MICHELIN Q 99 mph (159 km/hr) ', 25, '154.00', '150.00'),
(100, 'BOBINAS PLASTICAS - BOSCH', 4, '80.56', '77.00'),
(101, 'Sistema electrico', NULL, '100.00', NULL),
(102, 'Sistema de enfriamiento', NULL, '120.00', NULL),
(103, 'Balanceo', NULL, '80.00', NULL),
(104, 'Transmiciones automaticas', NULL, '150.00', NULL),
(105, 'Lubricacion', NULL, '90.00', NULL),
(106, 'Mantenimiento preventivo de motor', NULL, '40.00', NULL),
(107, 'Direcion hidraulica', NULL, '200.00', NULL),
(108, 'Afinacion', NULL, '300.00', NULL),
(109, 'Mantenimiento preventivo de frenos', NULL, '250.00', NULL),
(110, 'Mantenimiento correctivo de frenos', NULL, '280.00', NULL),
(111, 'Lubricacion', NULL, '350.00', NULL),
(112, 'Mantenimiento gasolina y diesel', NULL, '400.00', NULL),
(113, 'Sistema de escape', NULL, '200.00', NULL),
(114, 'Suspensión y direccion', NULL, '300.00', NULL),
(115, 'clutch', NULL, '160.00', NULL),
(116, 'Cambio de aceite', NULL, '50.00', NULL),
(117, 'Afinacion', NULL, '70.00', NULL),
(118, 'Balanceo', NULL, '80.00', NULL),
(119, 'Mantenimiento de frenos', NULL, '30.00', NULL),
(120, 'Llantas', NULL, '30.00', NULL),
(121, 'Amortiguadores', NULL, '70.00', NULL),
(122, 'frenos', NULL, '110.00', NULL),
(123, 'Baterias', NULL, '165.00', NULL),
(124, 'Afinacion', NULL, '46.00', NULL),
(125, 'Sistema de enfriamiento', NULL, '195.00', NULL),
(126, 'Diagnostico por computadoras', NULL, '350.00', NULL),
(127, 'Cambio de aceite', NULL, '50.00', NULL),
(128, 'Afinacion', NULL, '150.00', NULL),
(129, 'Lubricacion', NULL, '120.00', NULL),
(130, 'frenos', NULL, '200.00', NULL),
(131, 'Llantas', NULL, '210.00', NULL),
(132, 'Alineamiento y balanceo', NULL, '300.00', NULL),
(133, 'Direcion hidraulica', NULL, '350.00', NULL),
(134, 'Sistemas de enfriamiento', NULL, '290.00', NULL),
(135, 'Montaje', NULL, '70.00', NULL),
(136, 'Alineacion y reparacion de llantas', NULL, '150.00', NULL),
(137, 'Diagnostico', NULL, '80.00', NULL),
(138, 'Suspensión y frenos', NULL, '60.00', NULL),
(139, 'Sistema de escape', NULL, '110.00', NULL),
(140, 'Mantenimieto preventivo de frenos hidraulicos', NULL, '200.00', NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `proveedor`
--

CREATE TABLE `proveedor` (
  `idProveedor` int(11) NOT NULL,
  `razonComercial` varchar(150) COLLATE utf8_spanish_ci NOT NULL,
  `idPersona` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Volcado de datos para la tabla `proveedor`
--

INSERT INTO `proveedor` (`idProveedor`, `razonComercial`, `idPersona`) VALUES
(1, 'MOSTACERO ABANTO ANGELA JOSEL S.A.C', 1),
(2, 'NECIOSUP CABANILLAS JOSE ANTONIO S.A.C', 9),
(3, 'OMEGA PERU S.A', 10),
(4, 'ROSAS PLANNING EST S.A', 13),
(5, 'POLISSISTEMAS S.A.C', 14),
(6, 'RECONOR S.R.L', 15),
(7, 'RECORD MULTIMOTRIZ S.A', 16),
(8, 'SELMA PERU S.R.L', 19),
(9, 'SERVICENTRO OCHOA S.R.L', 22),
(10, 'TALLERES GRAFICOS SILVA S.R.L', 25),
(11, 'TIENDAS EFE S.A', 26),
(12, 'TOTAL ARTEFACTOS S.A', 29),
(13, 'VISUAL DATA COMERCIAL S.A.C', 30),
(14, 'LIBRERIA BAZAR STOCK S.R.L', 31),
(16, 'MADERERA LOS CEDROS S.R.L', 37);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `repuesto`
--

CREATE TABLE `repuesto` (
  `idRepuesto` int(11) NOT NULL,
  `idProducto` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Volcado de datos para la tabla `repuesto`
--

INSERT INTO `repuesto` (`idRepuesto`, `idProducto`) VALUES
(1, 1),
(51, 2),
(2, 3),
(52, 4),
(3, 5),
(53, 6),
(4, 7),
(54, 8),
(5, 9),
(55, 10),
(6, 11),
(56, 12),
(7, 13),
(57, 14),
(8, 15),
(58, 16),
(9, 17),
(59, 18),
(10, 19),
(60, 20),
(11, 21),
(61, 22),
(12, 23),
(62, 24),
(13, 25),
(63, 26),
(14, 27),
(64, 28),
(15, 29),
(65, 30),
(16, 31),
(66, 32),
(17, 33),
(67, 34),
(18, 35),
(68, 36),
(19, 37),
(69, 38),
(20, 39),
(70, 40),
(21, 41),
(71, 42),
(22, 43),
(72, 44),
(23, 45),
(73, 46),
(24, 47),
(74, 48),
(25, 49),
(75, 50),
(26, 51),
(76, 52),
(27, 53),
(77, 54),
(28, 55),
(78, 56),
(29, 57),
(79, 58),
(30, 59),
(80, 60),
(31, 61),
(81, 62),
(32, 63),
(82, 64),
(33, 65),
(83, 66),
(34, 67),
(84, 68),
(35, 69),
(85, 70),
(36, 71),
(86, 72),
(37, 73),
(87, 74),
(38, 75),
(88, 76),
(39, 77),
(89, 78),
(40, 79),
(90, 80),
(41, 81),
(91, 82),
(42, 83),
(92, 84),
(43, 85),
(93, 86),
(44, 87),
(94, 88),
(45, 89),
(95, 90),
(46, 91),
(96, 92),
(47, 93),
(97, 94),
(48, 95),
(98, 96),
(49, 97),
(99, 98),
(50, 99),
(100, 100);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `servicio`
--

CREATE TABLE `servicio` (
  `idServicio` int(11) NOT NULL,
  `idProducto` int(11) NOT NULL,
  `idTipoServicio` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Volcado de datos para la tabla `servicio`
--

INSERT INTO `servicio` (`idServicio`, `idProducto`, `idTipoServicio`) VALUES
(1, 101, 1),
(2, 102, 1),
(3, 104, 1),
(4, 106, 1),
(5, 108, 2),
(6, 110, 2),
(7, 112, 2),
(8, 114, 2),
(9, 116, 2),
(10, 118, 3),
(11, 120, 3),
(12, 122, 3),
(13, 124, 3),
(14, 126, 3),
(15, 128, 4),
(16, 130, 4),
(17, 132, 4),
(18, 134, 4),
(19, 136, 4),
(20, 138, 4),
(21, 140, 5),
(22, 103, 5),
(23, 105, 5),
(24, 107, 5),
(25, 109, 5),
(26, 111, 5),
(27, 113, 5),
(28, 115, 6),
(29, 117, 6),
(30, 119, 6),
(31, 121, 6),
(32, 123, 6),
(33, 125, 6),
(34, 127, 6),
(35, 129, 7),
(36, 131, 7),
(37, 133, 7),
(38, 135, 7),
(39, 137, 7),
(40, 139, 7);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tipocliente`
--

CREATE TABLE `tipocliente` (
  `idTipoCliente` int(11) NOT NULL,
  `descripcion` varchar(30) COLLATE utf8_spanish_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Volcado de datos para la tabla `tipocliente`
--

INSERT INTO `tipocliente` (`idTipoCliente`, `descripcion`) VALUES
(1, 'Natural'),
(2, 'Jurídica');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tipocomprobanteventa`
--

CREATE TABLE `tipocomprobanteventa` (
  `idTipoComprobanteVenta` int(11) NOT NULL,
  `descripcion` varchar(30) COLLATE utf8_spanish_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Volcado de datos para la tabla `tipocomprobanteventa`
--

INSERT INTO `tipocomprobanteventa` (`idTipoComprobanteVenta`, `descripcion`) VALUES
(1, 'Boleta'),
(2, 'Factura');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tipodocumento`
--

CREATE TABLE `tipodocumento` (
  `idTipoDocumento` int(11) NOT NULL,
  `descripcion` varchar(15) COLLATE utf8_spanish_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Volcado de datos para la tabla `tipodocumento`
--

INSERT INTO `tipodocumento` (`idTipoDocumento`, `descripcion`) VALUES
(1, 'DNI'),
(2, 'RUC'),
(3, 'PASAPORTE');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tipoempleado`
--

CREATE TABLE `tipoempleado` (
  `idTipoEmpleado` varchar(6) COLLATE utf8_spanish_ci NOT NULL,
  `descripcion` varchar(25) COLLATE utf8_spanish_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Volcado de datos para la tabla `tipoempleado`
--

INSERT INTO `tipoempleado` (`idTipoEmpleado`, `descripcion`) VALUES
('EMP001', 'Vendedor'),
('EMP002', 'Mecanico'),
('EMP003', 'Jefe de Almacen'),
('EMP004', 'Administrador');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tiposervicio`
--

CREATE TABLE `tiposervicio` (
  `idTipoServicio` int(11) NOT NULL,
  `descripcion` varchar(100) COLLATE utf8_spanish_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Volcado de datos para la tabla `tiposervicio`
--

INSERT INTO `tiposervicio` (`idTipoServicio`, `descripcion`) VALUES
(1, 'Servicio preventivo automotriz'),
(2, 'Mantenimiento preventivo'),
(3, 'Servicio preventivo y correctivo automotriz'),
(4, 'Mantenimiento mecanico automotriz'),
(5, 'Servicio de mantenimiento automotriz'),
(6, 'Mantenimiento para automotores de hasta 3.5 toneladas'),
(7, 'Centro de movilidad del grupo michelin');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `vehiculo`
--

CREATE TABLE `vehiculo` (
  `idVehiculo` int(11) NOT NULL,
  `placa` varchar(10) COLLATE utf8_spanish_ci NOT NULL,
  `marca` varchar(25) COLLATE utf8_spanish_ci NOT NULL,
  `modelo` varchar(50) COLLATE utf8_spanish_ci NOT NULL,
  `observaciones` varchar(250) COLLATE utf8_spanish_ci DEFAULT NULL,
  `idCliente` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Volcado de datos para la tabla `vehiculo`
--

INSERT INTO `vehiculo` (`idVehiculo`, `placa`, `marca`, `modelo`, `observaciones`, `idCliente`) VALUES
(1, 'UA-114', 'Abarth', '124 Spide', 'Abolladura traseras', 1),
(2, 'ASD-145', 'Alfa Romero', 'Giulietta', 'Vidrio delantero parcialmente quebrado', 2),
(3, 'FDD-454', 'BYD', 'E6', '', 3),
(4, 'FDC-744', 'Caterham', 'Seven', 'Abolladura traseras', 7),
(5, 'AQQ-120', 'Cadillac', 'CTS', '', 8),
(6, 'FG-0122', 'Aston Martin', 'Rapide', 'Abolladura traseras', 9),
(7, 'GFF-154', 'BMW', 'X3', 'Vidrio delantero parcialmente quebrado', 10),
(8, 'HG-025', 'Honda', 'CR-V', 'Buenas condiciones', 11),
(9, 'HG-122', 'Ford', 'Focus', '', 13),
(10, 'JH-145', 'Fiat', '500X', 'Vidrio delantero parcialmente quebrado', 14),
(11, 'JKK-154', 'Bugatti', 'Chiron', '', 15),
(12, 'QEE-745', 'Jaguar', 'F-Type', 'Abolladuras multiples', 16),
(13, 'JHH-74', 'Volvo', 'XC60', '', 5),
(14, 'KJ-125', 'Volkswagen', 'Golf', 'Vidrio delantero parcialmente quebrado', 6),
(15, 'KLJ-544', 'TATA', 'Vista', '', 7),
(16, 'KL-1245', 'TATA', 'Xenon', '', 7),
(17, 'MM-2545', 'Subaru', 'Forester', 'Vidrio trasero abollado', 3),
(18, 'TTR-7444', 'Tesla', 'Model X', '', 5),
(19, 'RT-455', 'Toyota', 'Prius', 'Abolladuras multiples', 4),
(20, 'WET-122', 'Renault', 'Clio', '', 12),
(21, 'JKN-555', 'Renault', 'Mágane', '', 2),
(22, 'HTT-122', 'Nissan', 'GT-R', 'Abolladuras multiples', 6),
(23, 'JH-257', 'Rolls-Royce', 'Phantom', '', 5),
(24, 'KU-236', 'Audi', 'A5', '', 10),
(25, 'BN-236', 'Audi', 'Q3', 'Abolladuras multiples', 13),
(26, 'MN-3656', 'Ford', 'Fiesta', '', 8),
(27, 'JH-785', 'Ford', 'Mustang', '', 4),
(28, 'RRR-588', 'Mercedes', 'Clase C', '', 1),
(29, 'JHH-287', 'McLaren', '540C', 'Vidrios rajados', 1),
(30, 'JUU-987', 'Maserati', 'Quattrporte', 'Condiciones Medias', 9),
(31, 'KKK-133', 'Lexus', 'IS', '', 3),
(32, 'RRR-7553', 'Jeep', 'Wrangler', '', 16),
(33, 'QWD-36', 'Ferrari', 'FF', 'Abolladuras multiples', 7),
(34, 'BG-369', 'Hyundai', 'i30', '', 11),
(35, 'JYH-123', 'Honda', 'Jazz', '', 16),
(36, 'EW-7889', 'Dacia', 'Duster', '', 15),
(37, 'RT-2366', 'BMW', 'Serie 3', 'Abolladuras minimas', 13),
(38, 'RTW-32', 'Aston Martin', 'DB9', '', 6),
(39, 'NHN-542', 'Fiat', '500X', '', 3),
(40, 'WAS-855', 'DS', 'DS4', '', 5),
(41, 'QWW-855', 'Ferrari', 'FF', '', 9),
(42, 'SS-658', 'Dacia', 'San11dero', '', 5),
(43, 'DFG-789', 'Toyota', 'S60', '', 4),
(44, 'JHU-215', 'Toyota', 'V40', '', 2),
(45, 'JOF-548', 'Volkswagen', 'Beetle', '', 12),
(46, 'QTE-584', 'Volvo', 'XC60', '', 16),
(47, 'BCN-542', 'Seat', 'Leon', '', 4),
(48, 'NV-545', 'Smart', 'ForTwo', '', 2),
(49, 'YE-320', 'Rolls-Royce', 'Phantom', '', 3),
(50, 'OIY-896', 'Seat', 'Ibiza', '', 8),
(51, 'LHK-854', 'Porsche', '911', '', 4),
(52, 'KG-87', 'Nissan', 'Qashqai', '', 12),
(53, 'NV-422', 'Morgan3', 'Wheeler', '', 4),
(54, 'VX-870', 'Morgan Aero', 'Cpupe', '', 7),
(55, 'QTA-879', 'Mazda', 'Mazda6', '', 16),
(56, 'CMJ-852', 'Mercedes', 'Clase C', '', 13),
(57, 'PQO-587', 'Maserati', 'Ghibli', '', 2),
(58, 'OQI-951', 'Mazda', 'CX-5', '', 8),
(59, 'ZAQ-852', 'Land Rover', 'Discovery', '', 7),
(60, 'PTO-456', 'KIA', 'Sportage', '', 9),
(61, 'MCJ-741', 'Jeep', 'Wrangler', '', 6),
(62, 'PQW-985', 'KIA', 'Rio', '', 16),
(63, 'PQO-210', 'Infiniti', 'QX50', '', 2),
(64, 'LO-159', 'Jaguar', 'F-Type', '', 7),
(65, 'POI-120', 'Ferrari', 'FF', '', 1),
(66, 'IJF-854', 'Caterham', 'Seven', '', 16),
(67, 'PQO-854', 'Ferrari', 'California T', '', 7),
(68, 'FHD-812', 'Audi', 'A5', '', 2),
(69, 'AQW-541', 'Bugatti', 'Chiron', '', 8);

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `cliente`
--
ALTER TABLE `cliente`
  ADD PRIMARY KEY (`idCliente`),
  ADD KEY `fk_Persona_Cliente` (`idPersona`),
  ADD KEY `fk_TipoCliente_Cliente` (`idTipoCliente`);

--
-- Indices de la tabla `comprobantecompra`
--
ALTER TABLE `comprobantecompra`
  ADD PRIMARY KEY (`idComprobanteCompra`),
  ADD KEY `fk_Proveedor_ComprobanteCompra` (`idProveedor`);

--
-- Indices de la tabla `comprobanteventa`
--
ALTER TABLE `comprobanteventa`
  ADD PRIMARY KEY (`idComprobanteVenta`),
  ADD KEY `fk_TipoComprovanteVenta_ComprobanteVenta` (`idTipoComprobanteVenta`);

--
-- Indices de la tabla `detallecompra`
--
ALTER TABLE `detallecompra`
  ADD PRIMARY KEY (`idDetalleCompra`),
  ADD KEY `fk_ComprobanteCompra_DetalleCompra` (`idComprobanteCompra`),
  ADD KEY `fk_Repuesto_DetalleCompra` (`idRepuesto`);

--
-- Indices de la tabla `detalleoperacion`
--
ALTER TABLE `detalleoperacion`
  ADD PRIMARY KEY (`idDetalleOperacion`),
  ADD KEY `fk_Operacion_DetalleOperacion` (`idOperacion`),
  ADD KEY `fk_Producto_DetalleOperacion` (`idProducto`);

--
-- Indices de la tabla `detallepermiso`
--
ALTER TABLE `detallepermiso`
  ADD PRIMARY KEY (`idDetallePermiso`),
  ADD KEY `fk_Login_DetallePermiso` (`idLogin`),
  ADD KEY `fk_Permiso_DetallePermiso` (`idPermiso`);

--
-- Indices de la tabla `detalleventa`
--
ALTER TABLE `detalleventa`
  ADD PRIMARY KEY (`idDetalleVenta`),
  ADD KEY `fk_ComprobanteVenta_DetalleVenta` (`idComprobanteVenta`),
  ADD KEY `fk_DetalleOperacion_DetalleVenta` (`idDetalleOperacion`);

--
-- Indices de la tabla `empleado`
--
ALTER TABLE `empleado`
  ADD PRIMARY KEY (`idEmpleado`),
  ADD KEY `fk_TipoEmpleado_Empleado` (`idTipoEmpleado`),
  ADD KEY `fk_Persona_Empleado` (`idPersona`);

--
-- Indices de la tabla `kardex`
--
ALTER TABLE `kardex`
  ADD PRIMARY KEY (`idKardex`),
  ADD KEY `fk_Repuesto_Kardex` (`idRepuesto`);

--
-- Indices de la tabla `login`
--
ALTER TABLE `login`
  ADD PRIMARY KEY (`idLogin`),
  ADD KEY `fk_Persona_Login` (`idPersona`);

--
-- Indices de la tabla `operacion`
--
ALTER TABLE `operacion`
  ADD PRIMARY KEY (`idOperacion`),
  ADD KEY `fk_PersonaCliente_Operacion` (`idPersonaCliente`),
  ADD KEY `fk_PersonaEmpleado_Operacion` (`idPersonaEmpleado`),
  ADD KEY `fk_Vehiculo_Operacion` (`idVehiculo`);

--
-- Indices de la tabla `permiso`
--
ALTER TABLE `permiso`
  ADD PRIMARY KEY (`idPermiso`);

--
-- Indices de la tabla `persona`
--
ALTER TABLE `persona`
  ADD PRIMARY KEY (`idPersona`),
  ADD KEY `fk_TipoDocumento_Persona` (`idTipoDocumento`);

--
-- Indices de la tabla `producto`
--
ALTER TABLE `producto`
  ADD PRIMARY KEY (`idProducto`);

--
-- Indices de la tabla `proveedor`
--
ALTER TABLE `proveedor`
  ADD PRIMARY KEY (`idProveedor`),
  ADD KEY `fk_Persona_Proveedor` (`idPersona`);

--
-- Indices de la tabla `repuesto`
--
ALTER TABLE `repuesto`
  ADD PRIMARY KEY (`idRepuesto`),
  ADD KEY `fk_Producto_Repuesto` (`idProducto`);

--
-- Indices de la tabla `servicio`
--
ALTER TABLE `servicio`
  ADD PRIMARY KEY (`idServicio`),
  ADD KEY `fk_T_Producto_Servicio` (`idProducto`),
  ADD KEY `fk_TipoServicio_Servicio` (`idTipoServicio`);

--
-- Indices de la tabla `tipocliente`
--
ALTER TABLE `tipocliente`
  ADD PRIMARY KEY (`idTipoCliente`);

--
-- Indices de la tabla `tipocomprobanteventa`
--
ALTER TABLE `tipocomprobanteventa`
  ADD PRIMARY KEY (`idTipoComprobanteVenta`);

--
-- Indices de la tabla `tipodocumento`
--
ALTER TABLE `tipodocumento`
  ADD PRIMARY KEY (`idTipoDocumento`);

--
-- Indices de la tabla `tipoempleado`
--
ALTER TABLE `tipoempleado`
  ADD PRIMARY KEY (`idTipoEmpleado`);

--
-- Indices de la tabla `tiposervicio`
--
ALTER TABLE `tiposervicio`
  ADD PRIMARY KEY (`idTipoServicio`);

--
-- Indices de la tabla `vehiculo`
--
ALTER TABLE `vehiculo`
  ADD PRIMARY KEY (`idVehiculo`),
  ADD UNIQUE KEY `placa` (`placa`),
  ADD KEY `fk_Cliente_Vehiculo` (`idCliente`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `cliente`
--
ALTER TABLE `cliente`
  MODIFY `idCliente` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;
--
-- AUTO_INCREMENT de la tabla `comprobantecompra`
--
ALTER TABLE `comprobantecompra`
  MODIFY `idComprobanteCompra` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;
--
-- AUTO_INCREMENT de la tabla `comprobanteventa`
--
ALTER TABLE `comprobanteventa`
  MODIFY `idComprobanteVenta` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=27;
--
-- AUTO_INCREMENT de la tabla `detallecompra`
--
ALTER TABLE `detallecompra`
  MODIFY `idDetalleCompra` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;
--
-- AUTO_INCREMENT de la tabla `detalleoperacion`
--
ALTER TABLE `detalleoperacion`
  MODIFY `idDetalleOperacion` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=30;
--
-- AUTO_INCREMENT de la tabla `detallepermiso`
--
ALTER TABLE `detallepermiso`
  MODIFY `idDetallePermiso` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=97;
--
-- AUTO_INCREMENT de la tabla `detalleventa`
--
ALTER TABLE `detalleventa`
  MODIFY `idDetalleVenta` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=29;
--
-- AUTO_INCREMENT de la tabla `empleado`
--
ALTER TABLE `empleado`
  MODIFY `idEmpleado` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;
--
-- AUTO_INCREMENT de la tabla `kardex`
--
ALTER TABLE `kardex`
  MODIFY `idKardex` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=51;
--
-- AUTO_INCREMENT de la tabla `login`
--
ALTER TABLE `login`
  MODIFY `idLogin` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;
--
-- AUTO_INCREMENT de la tabla `operacion`
--
ALTER TABLE `operacion`
  MODIFY `idOperacion` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=24;
--
-- AUTO_INCREMENT de la tabla `permiso`
--
ALTER TABLE `permiso`
  MODIFY `idPermiso` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
--
-- AUTO_INCREMENT de la tabla `persona`
--
ALTER TABLE `persona`
  MODIFY `idPersona` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=38;
--
-- AUTO_INCREMENT de la tabla `producto`
--
ALTER TABLE `producto`
  MODIFY `idProducto` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=144;
--
-- AUTO_INCREMENT de la tabla `proveedor`
--
ALTER TABLE `proveedor`
  MODIFY `idProveedor` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;
--
-- AUTO_INCREMENT de la tabla `repuesto`
--
ALTER TABLE `repuesto`
  MODIFY `idRepuesto` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=102;
--
-- AUTO_INCREMENT de la tabla `servicio`
--
ALTER TABLE `servicio`
  MODIFY `idServicio` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=41;
--
-- AUTO_INCREMENT de la tabla `tipocliente`
--
ALTER TABLE `tipocliente`
  MODIFY `idTipoCliente` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT de la tabla `tipocomprobanteventa`
--
ALTER TABLE `tipocomprobanteventa`
  MODIFY `idTipoComprobanteVenta` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT de la tabla `tipodocumento`
--
ALTER TABLE `tipodocumento`
  MODIFY `idTipoDocumento` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT de la tabla `tiposervicio`
--
ALTER TABLE `tiposervicio`
  MODIFY `idTipoServicio` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;
--
-- AUTO_INCREMENT de la tabla `vehiculo`
--
ALTER TABLE `vehiculo`
  MODIFY `idVehiculo` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=70;
--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `cliente`
--
ALTER TABLE `cliente`
  ADD CONSTRAINT `fk_Persona_Cliente` FOREIGN KEY (`idPersona`) REFERENCES `persona` (`idPersona`),
  ADD CONSTRAINT `fk_TipoCliente_Cliente` FOREIGN KEY (`idTipoCliente`) REFERENCES `tipocliente` (`idTipoCliente`);

--
-- Filtros para la tabla `comprobantecompra`
--
ALTER TABLE `comprobantecompra`
  ADD CONSTRAINT `fk_Proveedor_ComprobanteCompra` FOREIGN KEY (`idProveedor`) REFERENCES `proveedor` (`idProveedor`);

--
-- Filtros para la tabla `comprobanteventa`
--
ALTER TABLE `comprobanteventa`
  ADD CONSTRAINT `fk_TipoComprovanteVenta_ComprobanteVenta` FOREIGN KEY (`idTipoComprobanteVenta`) REFERENCES `tipocomprobanteventa` (`idTipoComprobanteVenta`);

--
-- Filtros para la tabla `detallecompra`
--
ALTER TABLE `detallecompra`
  ADD CONSTRAINT `fk_ComprobanteCompra_DetalleCompra` FOREIGN KEY (`idComprobanteCompra`) REFERENCES `comprobantecompra` (`idComprobanteCompra`),
  ADD CONSTRAINT `fk_Repuesto_DetalleCompra` FOREIGN KEY (`idRepuesto`) REFERENCES `repuesto` (`idRepuesto`);

--
-- Filtros para la tabla `detalleoperacion`
--
ALTER TABLE `detalleoperacion`
  ADD CONSTRAINT `fk_Operacion_DetalleOperacion` FOREIGN KEY (`idOperacion`) REFERENCES `operacion` (`idOperacion`),
  ADD CONSTRAINT `fk_Producto_DetalleOperacion` FOREIGN KEY (`idProducto`) REFERENCES `producto` (`idProducto`);

--
-- Filtros para la tabla `detallepermiso`
--
ALTER TABLE `detallepermiso`
  ADD CONSTRAINT `fk_Login_DetallePermiso` FOREIGN KEY (`idLogin`) REFERENCES `login` (`idLogin`),
  ADD CONSTRAINT `fk_Permiso_DetallePermiso` FOREIGN KEY (`idPermiso`) REFERENCES `permiso` (`idPermiso`);

--
-- Filtros para la tabla `detalleventa`
--
ALTER TABLE `detalleventa`
  ADD CONSTRAINT `fk_ComprobanteVenta_DetalleVenta` FOREIGN KEY (`idComprobanteVenta`) REFERENCES `comprobanteventa` (`idComprobanteVenta`),
  ADD CONSTRAINT `fk_DetalleOperacion_DetalleVenta` FOREIGN KEY (`idDetalleOperacion`) REFERENCES `detalleoperacion` (`idDetalleOperacion`);

--
-- Filtros para la tabla `empleado`
--
ALTER TABLE `empleado`
  ADD CONSTRAINT `fk_Persona_Empleado` FOREIGN KEY (`idPersona`) REFERENCES `persona` (`idPersona`),
  ADD CONSTRAINT `fk_TipoEmpleado_Empleado` FOREIGN KEY (`idTipoEmpleado`) REFERENCES `tipoempleado` (`idTipoEmpleado`);

--
-- Filtros para la tabla `kardex`
--
ALTER TABLE `kardex`
  ADD CONSTRAINT `fk_Repuesto_Kardex` FOREIGN KEY (`idRepuesto`) REFERENCES `repuesto` (`idRepuesto`);

--
-- Filtros para la tabla `login`
--
ALTER TABLE `login`
  ADD CONSTRAINT `fk_Persona_Login` FOREIGN KEY (`idPersona`) REFERENCES `persona` (`idPersona`);

--
-- Filtros para la tabla `operacion`
--
ALTER TABLE `operacion`
  ADD CONSTRAINT `fk_PersonaCliente_Operacion` FOREIGN KEY (`idPersonaCliente`) REFERENCES `persona` (`idPersona`),
  ADD CONSTRAINT `fk_PersonaEmpleado_Operacion` FOREIGN KEY (`idPersonaEmpleado`) REFERENCES `persona` (`idPersona`),
  ADD CONSTRAINT `fk_Vehiculo_Operacion` FOREIGN KEY (`idVehiculo`) REFERENCES `vehiculo` (`idVehiculo`);

--
-- Filtros para la tabla `persona`
--
ALTER TABLE `persona`
  ADD CONSTRAINT `fk_TipoDocumento_Persona` FOREIGN KEY (`idTipoDocumento`) REFERENCES `tipodocumento` (`idTipoDocumento`);

--
-- Filtros para la tabla `proveedor`
--
ALTER TABLE `proveedor`
  ADD CONSTRAINT `fk_Persona_Proveedor` FOREIGN KEY (`idPersona`) REFERENCES `persona` (`idPersona`);

--
-- Filtros para la tabla `repuesto`
--
ALTER TABLE `repuesto`
  ADD CONSTRAINT `fk_Producto_Repuesto` FOREIGN KEY (`idProducto`) REFERENCES `producto` (`idProducto`);

--
-- Filtros para la tabla `servicio`
--
ALTER TABLE `servicio`
  ADD CONSTRAINT `fk_T_Producto_Servicio` FOREIGN KEY (`idProducto`) REFERENCES `producto` (`idProducto`),
  ADD CONSTRAINT `fk_TipoServicio_Servicio` FOREIGN KEY (`idTipoServicio`) REFERENCES `tiposervicio` (`idTipoServicio`);

--
-- Filtros para la tabla `vehiculo`
--
ALTER TABLE `vehiculo`
  ADD CONSTRAINT `fk_Cliente_Vehiculo` FOREIGN KEY (`idCliente`) REFERENCES `cliente` (`idCliente`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
