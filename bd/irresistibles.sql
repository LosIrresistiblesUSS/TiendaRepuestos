-- phpMyAdmin SQL Dump
-- version 4.4.14
-- http://www.phpmyadmin.net
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 12-09-2016 a las 01:50:41
-- Versión del servidor: 5.6.26
-- Versión de PHP: 5.6.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `irresistibles`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `boleta`
--

CREATE TABLE IF NOT EXISTS `boleta` (
  `idBoleta` int(11) NOT NULL,
  `idComprobanteVenta` int(11) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `boleta`
--

INSERT INTO `boleta` (`idBoleta`, `idComprobanteVenta`) VALUES
(1, 2),
(2, 4),
(3, 6),
(4, 8),
(5, 10),
(6, 12),
(7, 14),
(8, 16),
(9, 18),
(10, 20),
(11, 22),
(12, 23),
(13, 24),
(14, 25),
(15, 26);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `cliente`
--

CREATE TABLE IF NOT EXISTS `cliente` (
  `idCliente` int(11) NOT NULL,
  `idPersona` int(11) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `cliente`
--

INSERT INTO `cliente` (`idCliente`, `idPersona`) VALUES
(1, 2),
(2, 3),
(3, 4),
(4, 5),
(5, 7),
(6, 8),
(7, 11),
(8, 12),
(9, 18),
(10, 20),
(11, 21),
(12, 24),
(13, 27),
(14, 33),
(15, 34),
(16, 35);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `comprobantecompra`
--

CREATE TABLE IF NOT EXISTS `comprobantecompra` (
  `idComprobanteCompra` int(11) NOT NULL,
  `fecha` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `idProveedor` int(11) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `comprobantecompra`
--

INSERT INTO `comprobantecompra` (`idComprobanteCompra`, `fecha`, `idProveedor`) VALUES
(1, '0000-00-00 00:00:00', 5),
(2, '0000-00-00 00:00:00', 9),
(3, '0000-00-00 00:00:00', 10),
(4, '0000-00-00 00:00:00', 15),
(5, '0000-00-00 00:00:00', 4),
(6, '0000-00-00 00:00:00', 9),
(7, '0000-00-00 00:00:00', 3),
(8, '0000-00-00 00:00:00', 1),
(9, '0000-00-00 00:00:00', 12),
(10, '0000-00-00 00:00:00', 16),
(11, '0000-00-00 00:00:00', 2),
(12, '0000-00-00 00:00:00', 6),
(13, '0000-00-00 00:00:00', 7);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `comprobanteventa`
--

CREATE TABLE IF NOT EXISTS `comprobanteventa` (
  `idComprobanteVenta` int(11) NOT NULL,
  `fecha` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `descripcion` varchar(150) DEFAULT NULL,
  `importe` decimal(7,2) DEFAULT NULL
) ENGINE=InnoDB AUTO_INCREMENT=27 DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `comprobanteventa`
--

INSERT INTO `comprobanteventa` (`idComprobanteVenta`, `fecha`, `descripcion`, `importe`) VALUES
(1, '0000-00-00 00:00:00', 'Realizando Ventas', '400.00'),
(2, '0000-00-00 00:00:00', 'Realizando Ventas', '240.00'),
(3, '0000-00-00 00:00:00', 'Realizando Ventas', '240.00'),
(4, '0000-00-00 00:00:00', 'Realizando Ventas', '80.00'),
(5, '0000-00-00 00:00:00', 'Realizando Ventas', '200.00'),
(6, '0000-00-00 00:00:00', 'Realizando Ventas', '880.00'),
(7, '0000-00-00 00:00:00', 'Realizando Ventas', '840.00'),
(8, '0000-00-00 00:00:00', 'Realizando Ventas', '160.00'),
(9, '0000-00-00 00:00:00', 'Realizando Ventas', '440.00'),
(10, '0000-00-00 00:00:00', 'Realizando Ventas', '1300.00'),
(11, '0000-00-00 00:00:00', 'Realizando Ventas', '1240.00'),
(12, '0000-00-00 00:00:00', 'Realizando Ventas', '2500.00'),
(13, '0000-00-00 00:00:00', 'Realizando Ventas', '1400.00'),
(14, '0000-00-00 00:00:00', 'Realizando Ventas', '1280.00'),
(15, '0000-00-00 00:00:00', 'Realizando Ventas', '1400.00'),
(16, '0000-00-00 00:00:00', 'Realizando Ventas', '60.00'),
(17, '0000-00-00 00:00:00', 'Realizando Ventas', '40.00'),
(18, '0000-00-00 00:00:00', 'Realizando Ventas', '160.00'),
(19, '0000-00-00 00:00:00', 'Realizando Ventas', '1180.00'),
(20, '0000-00-00 00:00:00', 'Realizando Ventas', '1140.00'),
(21, '0000-00-00 00:00:00', 'Realizando Ventas', '2000.00'),
(22, '0000-00-00 00:00:00', 'Realizando Ventas', '1240.00'),
(23, '0000-00-00 00:00:00', 'Realizando Ventas', '1240.00'),
(24, '0000-00-00 00:00:00', 'Realizando Ventas', '2320.00'),
(25, '0000-00-00 00:00:00', 'Realizando Ventas', '1320.00'),
(26, '0000-00-00 00:00:00', 'Realizando Ventas', '1320.00');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `detallecompra`
--

CREATE TABLE IF NOT EXISTS `detallecompra` (
  `idDetalleCompra` int(11) NOT NULL,
  `Cantidad` int(11) NOT NULL,
  `MontoTotal` decimal(8,2) NOT NULL,
  `idComprobanteCompra` int(11) NOT NULL,
  `idRepuesto` int(11) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=latin1;

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
(9, 10, '1600.00', 4, 38),
(10, 30, '2400.00', 6, 42),
(11, 50, '1156.00', 8, 65),
(12, 38, '1710.00', 10, 80),
(13, 30, '693.60', 12, 95);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `detalleoperacion`
--

CREATE TABLE IF NOT EXISTS `detalleoperacion` (
  `idDetalleOperacion` int(11) NOT NULL,
  `cantidad` int(11) NOT NULL,
  `precio` decimal(6,2) NOT NULL,
  `subTotal` decimal(7,2) NOT NULL,
  `idOperacion` int(11) NOT NULL,
  `idProducto` int(11) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=27 DEFAULT CHARSET=latin1;

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
(26, 1, '350.00', '350.00', 20, 133);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `detalleventa`
--

CREATE TABLE IF NOT EXISTS `detalleventa` (
  `idDetalleVenta` int(11) NOT NULL,
  `idComprobanteVenta` int(11) NOT NULL,
  `idDetalleOperacion` int(11) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=27 DEFAULT CHARSET=latin1;

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
(26, 26, 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `empleado`
--

CREATE TABLE IF NOT EXISTS `empleado` (
  `idEmpleado` int(11) NOT NULL,
  `idPersona` int(11) NOT NULL,
  `idTipoEmpleado` varchar(6) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `empleado`
--

INSERT INTO `empleado` (`idEmpleado`, `idPersona`, `idTipoEmpleado`) VALUES
(1, 36, 'EMP001'),
(2, 6, 'EMP001'),
(3, 17, 'EMP002'),
(4, 28, 'EMP002'),
(5, 23, 'EMP003');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `factura`
--

CREATE TABLE IF NOT EXISTS `factura` (
  `idFactura` int(11) NOT NULL,
  `idComprobanteVenta` int(11) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `factura`
--

INSERT INTO `factura` (`idFactura`, `idComprobanteVenta`) VALUES
(1, 1),
(2, 3),
(3, 5),
(4, 7),
(5, 9),
(6, 11),
(7, 13),
(8, 15),
(9, 17),
(10, 19),
(11, 21);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `kardex`
--

CREATE TABLE IF NOT EXISTS `kardex` (
  `idKardex` int(11) NOT NULL,
  `detalle` varchar(250) DEFAULT NULL,
  `cantidadIngreso` int(11) DEFAULT NULL,
  `precioIngreso` decimal(6,2) DEFAULT NULL,
  `cantidadSalida` int(11) DEFAULT NULL,
  `precioSalida` decimal(6,2) DEFAULT NULL,
  `idRepuesto` int(11) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=51 DEFAULT CHARSET=latin1;

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
-- Estructura de tabla para la tabla `operacion`
--

CREATE TABLE IF NOT EXISTS `operacion` (
  `idOperacion` int(11) NOT NULL,
  `estado` tinyint(1) NOT NULL,
  `idPersonaCliente` int(11) NOT NULL,
  `idPersonaEmpleado` int(11) NOT NULL,
  `idVehiculo` int(11) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=latin1;

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
(22, 0, 34, 17, 36);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `persona`
--

CREATE TABLE IF NOT EXISTS `persona` (
  `idPersona` int(11) NOT NULL,
  `numeroDocumento` varchar(13) NOT NULL,
  `nombres` varchar(150) NOT NULL,
  `razonSocial` varchar(150) NOT NULL,
  `direccion` varchar(150) NOT NULL,
  `telefono` varchar(10) DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL,
  `idTipoDocumento` int(11) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=38 DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `persona`
--

INSERT INTO `persona` (`idPersona`, `numeroDocumento`, `nombres`, `razonSocial`, `direccion`, `telefono`, `email`, `idTipoDocumento`) VALUES
(1, '20131524545', 'ALCARAZO IBÁÑEZ FREDDY DANIEL', 'MOSTACERO ABANTO ANGHELA YOSHELY S.A.C', 'AV. LARCO # 556', '674226', 'AIBANEZF@crece.uss.edu.pe', 2),
(2, '001157046757', 'AMAYA DIAZ CHRISTIAN OMAR', '', 'JR.JUNIN # 555', '251145', 'ADIAZCHRI@crece.uss.edu.pe', 3),
(3, '45786218', 'ANTONIO SANTAMARIA LUISA LORENA', '', 'AV. NICOLAS DE PIEROLA # 1170', '251621', 'ALUISAL@crece.uss.edu.pe', 1),
(4, '43219865', 'ARBULU CASTILLO PIERRE GIANCARLO', '', 'AV.ESPAÑA # 551', '208210', 'ACASTILLOP@crece.uss.edu.pe', 1),
(5, '49872325', 'BARNUEVO CORNEJO LUIS EDUARDO', '', 'AV.CESAR VALLEJO # 310', '203966', 'BCORNEJOL@crece.uss.edu.pe', 1),
(6, '46110087', 'CANTOS MORANTE AUGUSTO ENRIQUE', '', 'DIEGO DE ALMAGRO # 257', '249381', 'CANTOSMO@crece.uss.edu.pe', 1),
(7, '001416340551', 'CASTILLO CÁRDENAS JOSÉ LEONARDO', '', 'JR.SAN MARTIN # 552', '242723', 'CASTCARDJO@crece.uss.edu.pe', 3),
(8, '001564345985', 'CASTRO TERRONES JHAN CARLOS', '', 'O`DONOVAN 445(FRENTE CUARTEL)', '295076', 'CTERRONESJHAN@crece.uss.edu.pe', 3),
(9, '10088045853', 'DIAZ CASTAÑEDA RUDY SLAYTONW', 'NECIOSUP CABANILLAS JOSE ANTONIO S.A.C', 'AV.MANSICHE # 430', '232951', 'DCASTANEDAR@crece.uss.edu.pe', 2),
(10, '20131543337', 'FLORES TELLO JAIME NICOLAS', 'OMEGA PERU S.A', 'GONZALES PRADA 901, URB.EL SOL', '243915', 'FTELLOJAIME@crece.uss.edu.pe', 2),
(11, '48756294', 'GUEVARA BARRETO JOSÉ ALBERTO', '', 'AV.CESAR VALLEJO # 278', '254731', 'GBARRETOJOSE@crece.uss.edu.pe', 1),
(12, '42136782', 'GUTIERREZ BALCAZAR JOSÉ FRANCISCO', '', 'ISABEL DE BOBADILLA 268 URB EL RECREO', '220861', 'GVALCAZARJ@crece.uss.edu.pe', 1),
(13, '20440229825', 'HERNANDEZ NERIA MARCO ANTONIO', 'ROSASPLANNING EST.S.A', 'Jr.SAN MARTIN Nº256', '222446', 'HNERIAMARCO@crece.uss.edu.pe', 2),
(14, '10178267359', 'LOPEZ BONILLA CESAR ALBERTO', 'POLYSISTEMAS S.A.C', 'AV. ESPAÑA # 2152', '200358', 'LBONILLACA@crece.uss.edu.pe', 2),
(15, '20253604434', 'MARTÍNEZ PANTA VICTOR MANUEL', 'RECONOR S.R.L', 'JR. BOLIVAR # 682-684', '232141', 'MPANTAVICTO@crece.uss.edu.pe', 2),
(16, '20397132847', 'MONJA SANDOVAL ELMER ANTHONY', 'RECORD MULTIMOTRIZ S.A', 'JR. AYACUCHO # 812', '251327', 'MSANDOVALELMER@crece.uss.edu.pe', 2),
(17, '45789234', 'OTERO ARRASCUE DANNY FRANK', '', 'AV. AMERICA SUR # 2269', '262811', 'OARRASCUEDANNYF@crece.uss.edu.pe', 1),
(18, '001179224181', 'PÉREZ SUCLUPE JHON ADDERLY', '', 'JR. ZEPITA # 566 OF.2', '250184', 'PSUCLUPEJ@crece.uss.edu.pe', 3),
(19, '20314512643', 'PISFIL CORONADO JOSÉ LUIS FELIPE GIOVANY', 'SELMA PERU S.R.L', 'DIEGO DE ALMAGRO 746-TRUJILLO', '201818', 'PCORONADOJOSE@crece.uss.edu.pe', 2),
(20, '49736549', 'RAMIREZ RAMOS LUIS ROBERT', '', 'AV. AMERICA NORTE # 967', '246065', 'RRAMOSLUIS@crece.uss.edu.pe', 1),
(21, '49878234', 'REQUEJO MEJIA GUSTAVO ADOLFO', '', 'AV. SIMÓN BOLIVAR # 810', '265966', 'RMEJIAGUA@crece.uss.edu.pe', 1),
(22, '10634875819', 'SANCHEZ ELESCANO CESAR MANUEL', 'SERVICENTRO OCHOA S.R.L', 'DIEGO MARADONA # 347', '267881', 'SELESCANOC@crece.uss.edu.pe', 2),
(23, '46879528', 'SANTISTEBAN AYASTA LEONARDO EULER', '', 'JR. JUNIN # 882', '243943', 'SAYASTALEONA@crece.uss.edu.pe', 1),
(24, '001569964585', 'SANTISTEBAN QUISPE MIGUEL ANGEL', '', 'O`DIVALON 445(FRENTE CUARTEL)', '236776', 'SQUISPEMIGU@crece.uss.edu.pe', 3),
(25, '10890045853', 'SILVA PARRAGUEZ MAXIMO GABRIEL', 'TALLERES GRAFICOS SILVA S.R.L', 'AV. FERREÑAFE # 530', '298651', 'SPARRAGUEZMAXI@crece.uss.edu.pe', 2),
(26, '20994743337', 'VÁSQUEZ CERCADO DARWIN ALAIN', 'TIENDAS EFE S.A', 'GONZALES PRIVADO 991, URB.EL SOL', '287915', 'VCERCADODARWI@crece.uss.edu.pe', 2),
(27, '48993794', 'ZARATE ZARATE ELVER YOEL', '', 'AV.CESAR VALLEJO # 308', '292031', 'ZZARATEELVER@crece.uss.edu.pe', 1),
(28, '42187992', 'ZEÑA ZEÑA EDINSON OMAR', '', 'ISABEL PANTOJA 358 URB EL RECREO', '229871', 'ZZENAEDINS@crece.uss.edu.pe', 1),
(29, '20440988225', 'CARRASCO MANAY JUAN', 'TOTAL ARTEFACTOS S.A', 'Jr.SAN BORJA Nº986', '226896', 'CMANAYJUA@crece.uss.edu.pe', 2),
(30, '10178321659', 'CASTRO ALVITES ANTHONY GIUSEPPE', 'VISUAL DATA COMERCIAL S.A.C', 'AV. MEXICO # 9852', '209638', 'GIUSEPPEAN@crece.uss.edu.pe', 2),
(31, '29953875624', 'CASTRO FERNANDEZ IRVIN GREGORY', 'LIBRERIA BAZAR STOCK S.R.L', 'JR. BOLIVAR # 965', '290041', 'FECASTROIR@CRECE.USS.EDU.PE', 2),
(32, '20397995567', 'CHINGUEL RODRIGUEZ MILAGROS MARIBEL', 'LLANORMED S.A', 'JR. ATAHUALPA # 772', '296027', 'CRODRIGUEZMILAG@crece.uss.edu.pe', 2),
(33, '001196547826', 'MUÑOZ ZUTA MAYRA ALEJANDRA', '', 'AV. AMERICA ESTE # 9852', '260991', 'MAYRAZUTA@crece.uss.edu.pe', 3),
(34, '49982159', 'NERIA COLMENARES JACQUELIN LISET', '', 'AV. AMERICA SUR # 852', '252865', 'NCOLMENARESJ@crece.uss.edu.pe', 1),
(35, '49826500', 'NUÑEZ FERNÁNDEZ NOLBERTO ROMARIO', '', 'AV. SIMÓN # 920', '289366', 'NFERNANDEZNOLBE@crece.uss.edu.pe', 1),
(36, '49858749', 'ACUÑA COTRINA ERICK JOEL', '', 'ULTIMA DE KENEDY # 920', '285996', 'ACOTRINAE@crece.uss.edu.pe', 1),
(37, '18523075819', 'OLANO CHÁVEZ WILFREDO CRISTOBAL', 'MADERERA LOS CEDROS S.R.L', 'DIEGO PELE # 357', '286781', 'OCHAVEZWILFREDC@crece.uss.edu.pe', 2);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `producto`
--

CREATE TABLE IF NOT EXISTS `producto` (
  `idProducto` int(11) NOT NULL,
  `descripcion` varchar(150) DEFAULT NULL,
  `stock` int(11) DEFAULT NULL,
  `precio` decimal(6,2) NOT NULL,
  `precioPorMayor` decimal(6,2) DEFAULT NULL
) ENGINE=InnoDB AUTO_INCREMENT=257 DEFAULT CHARSET=latin1;

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
(73, 'EMBRAGUES', 16, '80.00', '75.00'),
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
(98, 'AROS ZH-125 ', 4, '124.00', '120.00'),
(99, 'LLANATAS MICHELIN Q: 99 mph (159 km/hr) ', 25, '154.00', '150.00'),
(100, 'BOBINAS PLASTICAS BOSCH', 4, '80.56', '77.00'),
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
(140, 'Mantenimieto preventivo de frenos hidraulicos', NULL, '200.00', NULL),
(229, 'Suspensión y direccion', NULL, '300.00', NULL),
(230, 'clutch', NULL, '160.00', NULL),
(231, 'Cambio de aceite', NULL, '50.00', NULL),
(232, 'Afinacion', NULL, '70.00', NULL),
(233, 'Balanceo', NULL, '80.00', NULL),
(234, 'Mantenimiento de frenos', NULL, '30.00', NULL),
(235, 'Llantas', NULL, '30.00', NULL),
(236, 'Amortiguadores', NULL, '70.00', NULL),
(237, 'frenos', NULL, '110.00', NULL),
(238, 'Baterias', NULL, '165.00', NULL),
(239, 'Afinacion', NULL, '46.00', NULL),
(240, 'Sistema de enfriamiento', NULL, '195.00', NULL),
(241, 'Diagnostico por computadoras', NULL, '350.00', NULL),
(242, 'Cambio de aceite', NULL, '50.00', NULL),
(243, 'Afinacion', NULL, '150.00', NULL),
(244, 'Lubricacion', NULL, '120.00', NULL),
(245, 'frenos', NULL, '200.00', NULL),
(246, 'Llantas', NULL, '210.00', NULL),
(247, 'Alineamiento y balanceo', NULL, '300.00', NULL),
(248, 'Direcion hidraulica', NULL, '350.00', NULL),
(249, 'Sistemas de enfriamiento', NULL, '290.00', NULL),
(250, 'Montaje', NULL, '70.00', NULL),
(251, 'Alineacion y reparacion de llantas', NULL, '150.00', NULL),
(252, 'Diagnostico', NULL, '80.00', NULL),
(253, 'Suspensión y frenos', NULL, '60.00', NULL),
(254, 'Sistema de escape', NULL, '110.00', NULL),
(255, 'Mantenimieto preventivo de frenos hidraulicos', NULL, '200.00', NULL),
(256, 'Mantenimiento a Otero', 20, '80.00', '75.50');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `proveedor`
--

CREATE TABLE IF NOT EXISTS `proveedor` (
  `idProveedor` int(11) NOT NULL,
  `idPersona` int(11) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `proveedor`
--

INSERT INTO `proveedor` (`idProveedor`, `idPersona`) VALUES
(1, 1),
(2, 9),
(3, 10),
(4, 13),
(5, 14),
(6, 15),
(7, 16),
(8, 19),
(9, 22),
(10, 25),
(11, 26),
(12, 29),
(13, 30),
(14, 31),
(15, 32),
(16, 37);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `repuesto`
--

CREATE TABLE IF NOT EXISTS `repuesto` (
  `idRepuesto` int(11) NOT NULL,
  `idProducto` int(11) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=101 DEFAULT CHARSET=latin1;

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

CREATE TABLE IF NOT EXISTS `servicio` (
  `idServicio` int(11) NOT NULL,
  `idProducto` int(11) NOT NULL,
  `idTipoServicio` int(11) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=121 DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `servicio`
--

INSERT INTO `servicio` (`idServicio`, `idProducto`, `idTipoServicio`) VALUES
(81, 101, 1),
(82, 102, 1),
(83, 104, 1),
(84, 106, 1),
(85, 108, 2),
(86, 110, 2),
(87, 112, 2),
(88, 114, 2),
(89, 116, 2),
(90, 118, 3),
(91, 120, 3),
(92, 122, 3),
(93, 124, 3),
(94, 126, 3),
(95, 128, 4),
(96, 130, 4),
(97, 132, 4),
(98, 134, 4),
(99, 136, 4),
(100, 138, 4),
(101, 140, 5),
(102, 103, 5),
(103, 105, 5),
(104, 107, 5),
(105, 109, 5),
(106, 111, 5),
(107, 113, 5),
(108, 115, 6),
(109, 117, 6),
(110, 119, 6),
(111, 121, 6),
(112, 123, 6),
(113, 125, 6),
(114, 127, 6),
(115, 129, 7),
(116, 131, 7),
(117, 133, 7),
(118, 135, 7),
(119, 137, 7),
(120, 139, 7);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tipodocumento`
--

CREATE TABLE IF NOT EXISTS `tipodocumento` (
  `idTipoDocumento` int(11) NOT NULL,
  `descripcion` varchar(15) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;

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

CREATE TABLE IF NOT EXISTS `tipoempleado` (
  `idTipoEmpleado` varchar(6) NOT NULL,
  `descripcion` varchar(25) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `tipoempleado`
--

INSERT INTO `tipoempleado` (`idTipoEmpleado`, `descripcion`) VALUES
('EMP001', 'Vendedor'),
('EMP002', 'Mecanico'),
('EMP003', 'Jefe de Almacen');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tiposervicio`
--

CREATE TABLE IF NOT EXISTS `tiposervicio` (
  `idTipoServicio` int(11) NOT NULL,
  `descripcion` varchar(100) DEFAULT NULL
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=latin1;

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

CREATE TABLE IF NOT EXISTS `vehiculo` (
  `idVehiculo` int(11) NOT NULL,
  `placa` varchar(10) NOT NULL,
  `marca` varchar(25) NOT NULL,
  `modelo` varchar(50) NOT NULL,
  `observaciones` varchar(250) DEFAULT NULL,
  `idCliente` int(11) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=70 DEFAULT CHARSET=latin1;

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
-- Indices de la tabla `boleta`
--
ALTER TABLE `boleta`
  ADD PRIMARY KEY (`idBoleta`),
  ADD KEY `fk_ComprobanteVenta_Boleta` (`idComprobanteVenta`);

--
-- Indices de la tabla `cliente`
--
ALTER TABLE `cliente`
  ADD PRIMARY KEY (`idCliente`),
  ADD KEY `fk_Persona_Cliente` (`idPersona`);

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
  ADD PRIMARY KEY (`idComprobanteVenta`);

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
-- Indices de la tabla `factura`
--
ALTER TABLE `factura`
  ADD PRIMARY KEY (`idFactura`),
  ADD KEY `fk_ComprobanteVenta_Factura` (`idComprobanteVenta`);

--
-- Indices de la tabla `kardex`
--
ALTER TABLE `kardex`
  ADD PRIMARY KEY (`idKardex`),
  ADD KEY `fk_Repuesto_Kardex` (`idRepuesto`);

--
-- Indices de la tabla `operacion`
--
ALTER TABLE `operacion`
  ADD PRIMARY KEY (`idOperacion`),
  ADD KEY `fk_PersonaCliente_Operacion` (`idPersonaCliente`),
  ADD KEY `fk_PersonaEmpleado_Operacion` (`idPersonaEmpleado`),
  ADD KEY `fk_Vehiculo_Operacion` (`idVehiculo`);

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
-- AUTO_INCREMENT de la tabla `boleta`
--
ALTER TABLE `boleta`
  MODIFY `idBoleta` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=16;
--
-- AUTO_INCREMENT de la tabla `cliente`
--
ALTER TABLE `cliente`
  MODIFY `idCliente` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=17;
--
-- AUTO_INCREMENT de la tabla `comprobantecompra`
--
ALTER TABLE `comprobantecompra`
  MODIFY `idComprobanteCompra` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=14;
--
-- AUTO_INCREMENT de la tabla `comprobanteventa`
--
ALTER TABLE `comprobanteventa`
  MODIFY `idComprobanteVenta` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=27;
--
-- AUTO_INCREMENT de la tabla `detallecompra`
--
ALTER TABLE `detallecompra`
  MODIFY `idDetalleCompra` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=14;
--
-- AUTO_INCREMENT de la tabla `detalleoperacion`
--
ALTER TABLE `detalleoperacion`
  MODIFY `idDetalleOperacion` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=27;
--
-- AUTO_INCREMENT de la tabla `detalleventa`
--
ALTER TABLE `detalleventa`
  MODIFY `idDetalleVenta` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=27;
--
-- AUTO_INCREMENT de la tabla `empleado`
--
ALTER TABLE `empleado`
  MODIFY `idEmpleado` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=6;
--
-- AUTO_INCREMENT de la tabla `factura`
--
ALTER TABLE `factura`
  MODIFY `idFactura` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=12;
--
-- AUTO_INCREMENT de la tabla `kardex`
--
ALTER TABLE `kardex`
  MODIFY `idKardex` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=51;
--
-- AUTO_INCREMENT de la tabla `operacion`
--
ALTER TABLE `operacion`
  MODIFY `idOperacion` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=23;
--
-- AUTO_INCREMENT de la tabla `persona`
--
ALTER TABLE `persona`
  MODIFY `idPersona` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=38;
--
-- AUTO_INCREMENT de la tabla `producto`
--
ALTER TABLE `producto`
  MODIFY `idProducto` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=257;
--
-- AUTO_INCREMENT de la tabla `proveedor`
--
ALTER TABLE `proveedor`
  MODIFY `idProveedor` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=17;
--
-- AUTO_INCREMENT de la tabla `repuesto`
--
ALTER TABLE `repuesto`
  MODIFY `idRepuesto` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=101;
--
-- AUTO_INCREMENT de la tabla `servicio`
--
ALTER TABLE `servicio`
  MODIFY `idServicio` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=121;
--
-- AUTO_INCREMENT de la tabla `tipodocumento`
--
ALTER TABLE `tipodocumento`
  MODIFY `idTipoDocumento` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT de la tabla `tiposervicio`
--
ALTER TABLE `tiposervicio`
  MODIFY `idTipoServicio` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=9;
--
-- AUTO_INCREMENT de la tabla `vehiculo`
--
ALTER TABLE `vehiculo`
  MODIFY `idVehiculo` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=70;
--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `boleta`
--
ALTER TABLE `boleta`
  ADD CONSTRAINT `fk_ComprobanteVenta_Boleta` FOREIGN KEY (`idComprobanteVenta`) REFERENCES `comprobanteventa` (`idComprobanteVenta`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `cliente`
--
ALTER TABLE `cliente`
  ADD CONSTRAINT `fk_Persona_Cliente` FOREIGN KEY (`idPersona`) REFERENCES `persona` (`idPersona`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `comprobantecompra`
--
ALTER TABLE `comprobantecompra`
  ADD CONSTRAINT `fk_Proveedor_ComprobanteCompra` FOREIGN KEY (`idProveedor`) REFERENCES `proveedor` (`idProveedor`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `detallecompra`
--
ALTER TABLE `detallecompra`
  ADD CONSTRAINT `fk_ComprobanteCompra_DetalleCompra` FOREIGN KEY (`idComprobanteCompra`) REFERENCES `comprobantecompra` (`idComprobanteCompra`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_Repuesto_DetalleCompra` FOREIGN KEY (`idRepuesto`) REFERENCES `repuesto` (`idRepuesto`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `detalleoperacion`
--
ALTER TABLE `detalleoperacion`
  ADD CONSTRAINT `fk_Operacion_DetalleOperacion` FOREIGN KEY (`idOperacion`) REFERENCES `operacion` (`idOperacion`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_Producto_DetalleOperacion` FOREIGN KEY (`idProducto`) REFERENCES `producto` (`idProducto`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `detalleventa`
--
ALTER TABLE `detalleventa`
  ADD CONSTRAINT `fk_ComprobanteVenta_DetalleVenta` FOREIGN KEY (`idComprobanteVenta`) REFERENCES `comprobanteventa` (`idComprobanteVenta`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_DetalleOperacion_DetalleVenta` FOREIGN KEY (`idDetalleOperacion`) REFERENCES `detalleoperacion` (`idDetalleOperacion`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `empleado`
--
ALTER TABLE `empleado`
  ADD CONSTRAINT `fk_Persona_Empleado` FOREIGN KEY (`idPersona`) REFERENCES `persona` (`idPersona`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_TipoEmpleado_Empleado` FOREIGN KEY (`idTipoEmpleado`) REFERENCES `tipoempleado` (`idTipoEmpleado`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `factura`
--
ALTER TABLE `factura`
  ADD CONSTRAINT `fk_ComprobanteVenta_Factura` FOREIGN KEY (`idComprobanteVenta`) REFERENCES `comprobanteventa` (`idComprobanteVenta`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `kardex`
--
ALTER TABLE `kardex`
  ADD CONSTRAINT `fk_Repuesto_Kardex` FOREIGN KEY (`idRepuesto`) REFERENCES `repuesto` (`idRepuesto`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `operacion`
--
ALTER TABLE `operacion`
  ADD CONSTRAINT `fk_PersonaCliente_Operacion` FOREIGN KEY (`idPersonaCliente`) REFERENCES `persona` (`idPersona`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_PersonaEmpleado_Operacion` FOREIGN KEY (`idPersonaEmpleado`) REFERENCES `persona` (`idPersona`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_Vehiculo_Operacion` FOREIGN KEY (`idVehiculo`) REFERENCES `vehiculo` (`idVehiculo`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `persona`
--
ALTER TABLE `persona`
  ADD CONSTRAINT `fk_TipoDocumento_Persona` FOREIGN KEY (`idTipoDocumento`) REFERENCES `tipodocumento` (`idTipoDocumento`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `proveedor`
--
ALTER TABLE `proveedor`
  ADD CONSTRAINT `fk_Persona_Proveedor` FOREIGN KEY (`idPersona`) REFERENCES `persona` (`idPersona`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `repuesto`
--
ALTER TABLE `repuesto`
  ADD CONSTRAINT `fk_Producto_Repuesto` FOREIGN KEY (`idProducto`) REFERENCES `producto` (`idProducto`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `servicio`
--
ALTER TABLE `servicio`
  ADD CONSTRAINT `fk_T_Producto_Servicio` FOREIGN KEY (`idProducto`) REFERENCES `producto` (`idProducto`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_TipoServicio_Servicio` FOREIGN KEY (`idTipoServicio`) REFERENCES `tiposervicio` (`idTipoServicio`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `vehiculo`
--
ALTER TABLE `vehiculo`
  ADD CONSTRAINT `fk_Cliente_Vehiculo` FOREIGN KEY (`idCliente`) REFERENCES `cliente` (`idCliente`) ON DELETE CASCADE ON UPDATE CASCADE;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
