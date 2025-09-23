-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 19-09-2025 a las 01:43:34
-- Versión del servidor: 10.4.32-MariaDB
-- Versión de PHP: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `pedidosnow`
--
CREATE DATABASE IF NOT EXISTS `pedidosnow` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
USE `pedidosnow`;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `carrito`
--

CREATE TABLE `carrito` (
  `idPedido` int(11) NOT NULL,
  `idProducto` int(11) NOT NULL,
  `cantidad` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `carrito`
--

INSERT INTO `carrito` (`idPedido`, `idProducto`, `cantidad`) VALUES
(1, 2033, 1),
(1, 2057, 2),
(2, 2057, 3),
(2, 2901, 2),
(3, 2033, 1),
(3, 2901, 2),
(3, 3024, 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `cliente`
--

CREATE TABLE `cliente` (
  `idCliente` int(11) NOT NULL,
  `nombre` varchar(30) NOT NULL,
  `apellido` varchar(30) NOT NULL,
  `direccion` varchar(50) NOT NULL,
  `mail` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `cliente`
--

INSERT INTO `cliente` (`idCliente`, `nombre`, `apellido`, `direccion`, `mail`) VALUES
(1, 'Azul', 'De la Hoz', 'av 123', 'luza@gmail.com'),
(2, 'Franco', 'Silva', 'av 456', 'franco@gmail.com'),
(3, 'Lautaro', 'Comino', 'av 789', 'comino@gmail.com'),
(4, 'Leandro', 'Leyes', 'av 111', 'leandroleyes60@gmail.com'),
(5, 'Patricio', 'Pascual', 'av 222', 'patricio@gmail.com'),
(6, 'Tiago', 'Gil', 'av 333', 'tiago@gmail.com');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pedido`
--

CREATE TABLE `pedido` (
  `idPedido` int(20) NOT NULL,
  `idCliente` int(20) NOT NULL,
  `fecha` date NOT NULL,
  `estado` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `pedido`
--

INSERT INTO `pedido` (`idPedido`, `idCliente`, `fecha`, `estado`) VALUES
(1, 1, '2024-01-15', 1),
(2, 3, '2024-03-20', 0),
(3, 4, '2025-10-07', 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `producto`
--

CREATE TABLE `producto` (
  `idProducto` int(20) NOT NULL,
  `nombre` varchar(50) NOT NULL,
  `descripcion` varchar(50) NOT NULL,
  `precio` double NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `producto`
--

INSERT INTO `producto` (`idProducto`, `nombre`, `descripcion`, `precio`) VALUES
(2033, 'Pava Electrica', '1.7L', 40000),
(2057, 'TV LED 50\" ', 'Samsung', 500000),
(2901, 'Microondas', 'LG', 45000),
(3024, 'Plancha de Pelo', 'Philips', 100000);

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `carrito`
--
ALTER TABLE `carrito`
  ADD PRIMARY KEY (`idPedido`,`idProducto`),
  ADD KEY `idProducto` (`idProducto`);

--
-- Indices de la tabla `cliente`
--
ALTER TABLE `cliente`
  ADD PRIMARY KEY (`idCliente`);

--
-- Indices de la tabla `pedido`
--
ALTER TABLE `pedido`
  ADD PRIMARY KEY (`idPedido`),
  ADD KEY `idCliente` (`idCliente`);

--
-- Indices de la tabla `producto`
--
ALTER TABLE `producto`
  ADD PRIMARY KEY (`idProducto`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `cliente`
--
ALTER TABLE `cliente`
  MODIFY `idCliente` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT de la tabla `pedido`
--
ALTER TABLE `pedido`
  MODIFY `idPedido` int(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `carrito`
--
ALTER TABLE `carrito`
  ADD CONSTRAINT `carrito_ibfk_1` FOREIGN KEY (`idPedido`) REFERENCES `pedido` (`idPedido`),
  ADD CONSTRAINT `carrito_ibfk_2` FOREIGN KEY (`idProducto`) REFERENCES `producto` (`idProducto`);

--
-- Filtros para la tabla `pedido`
--
ALTER TABLE `pedido`
  ADD CONSTRAINT `pedido_ibfk_1` FOREIGN KEY (`idCliente`) REFERENCES `cliente` (`idCliente`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
