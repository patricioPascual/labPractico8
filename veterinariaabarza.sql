-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 17-09-2025 a las 01:08:20
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
-- Base de datos: `veterinariaabarza`
--
CREATE DATABASE IF NOT EXISTS `veterinariaabarza` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
USE `veterinariaabarza`;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `cliente`
--

CREATE TABLE `cliente` (
  `idCliente` int(11) NOT NULL,
  `nombre` varchar(30) DEFAULT NULL,
  `apellido` varchar(30) DEFAULT NULL,
  `telefono` bigint(20) DEFAULT NULL,
  `direccion` varchar(50) DEFAULT NULL,
  `contactoAlternativo` bigint(20) DEFAULT NULL,
  `activo` tinyint(1) DEFAULT NULL,
  `dni` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `cliente`
--

INSERT INTO `cliente` (`idCliente`, `nombre`, `apellido`, `telefono`, `direccion`, `contactoAlternativo`, `activo`, `dni`) VALUES
(1001, 'Emiliano', 'Martinez', 2664100100, 'los lapachos 101', 476130, 1, 11770556),
(1002, 'juan', 'Lopez', 2665222333, 'marte 443', 3544332233, 1, 45003334),
(1003, 'Manuel', 'Muñoz', 266523433, 'San Martin', 3544336677, 1, 33444555),
(1004, 'Lionel', 'Messi', 2664595057, 'olivos 332', 2665343333, 1, 34543544),
(1005, 'Rodrigo', 'De Paul', 2664440776, 'san juan 11', 11343556, 1, 11877432);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `mascotas`
--

CREATE TABLE `mascotas` (
  `idMascota` int(11) NOT NULL,
  `alias` varchar(30) DEFAULT NULL,
  `sexo` varchar(30) DEFAULT NULL,
  `especie` varchar(30) DEFAULT NULL,
  `raza` varchar(30) DEFAULT NULL,
  `colorPelo` varchar(50) DEFAULT NULL,
  `fechaNac` date DEFAULT NULL,
  `idCliente` int(11) DEFAULT NULL,
  `activo` tinyint(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `mascotas`
--

INSERT INTO `mascotas` (`idMascota`, `alias`, `sexo`, `especie`, `raza`, `colorPelo`, `fechaNac`, `idCliente`, `activo`) VALUES
(1, 'coquito', 'macho', 'canino', 'salchicha', 'marron', '0000-00-00', 1002, 1),
(2, 'roko', 'macho', 'canino', 'Pastor', 'negro', '0000-00-00', 1001, 1),
(3, 'michi', 'hembra', 'felino', 'siames', ' beige', '0000-00-00', 1004, 1),
(4, 'pepe', 'macho', 'ave', 'Papagayo', 'verde', '0000-00-00', 1003, 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tratamiento`
--

CREATE TABLE `tratamiento` (
  `idTratamiento` int(11) NOT NULL,
  `descripcion` varchar(70) DEFAULT NULL,
  `medicamento` varchar(50) DEFAULT NULL,
  `importe` double DEFAULT NULL,
  `tipoTratamiento` varchar(30) DEFAULT NULL,
  `activo` tinyint(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `tratamiento`
--

INSERT INTO `tratamiento` (`idTratamiento`, `descripcion`, `medicamento`, `importe`, `tipoTratamiento`, `activo`) VALUES
(200, 'antibiotico', 'xalopram', 15000, 'consulta', 1),
(300, 'limpieza herida', 'pervinox y curabichero', 25000, 'urgencia', 1),
(400, 'desparasitario', 'deparasitix', 12000, 'consulta', 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `visita`
--

CREATE TABLE `visita` (
  `idVisita` int(11) NOT NULL,
  `idMascota` int(11) DEFAULT NULL,
  `fechaVisita` date DEFAULT NULL,
  `detalle` varchar(50) DEFAULT NULL,
  `peso` double DEFAULT NULL,
  `idTratamiento` int(11) DEFAULT NULL,
  `activo` tinyint(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `visita`
--

INSERT INTO `visita` (`idVisita`, `idMascota`, `fechaVisita`, `detalle`, `peso`, `idTratamiento`, `activo`) VALUES
(1, 3, '2025-05-10', 'desparasitar', 15, 400, 1),
(2, 1, '2024-09-25', 'limpieza de herida por pelea', 10, 300, 1);

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `cliente`
--
ALTER TABLE `cliente`
  ADD PRIMARY KEY (`idCliente`),
  ADD UNIQUE KEY `dni` (`dni`);

--
-- Indices de la tabla `mascotas`
--
ALTER TABLE `mascotas`
  ADD PRIMARY KEY (`idMascota`),
  ADD KEY `idCliente` (`idCliente`);

--
-- Indices de la tabla `tratamiento`
--
ALTER TABLE `tratamiento`
  ADD PRIMARY KEY (`idTratamiento`);

--
-- Indices de la tabla `visita`
--
ALTER TABLE `visita`
  ADD PRIMARY KEY (`idVisita`),
  ADD KEY `idMascota` (`idMascota`),
  ADD KEY `fk_visita_tratamiento` (`idTratamiento`);

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `mascotas`
--
ALTER TABLE `mascotas`
  ADD CONSTRAINT `mascotas_ibfk_1` FOREIGN KEY (`idCliente`) REFERENCES `cliente` (`idCliente`);

--
-- Filtros para la tabla `visita`
--
ALTER TABLE `visita`
  ADD CONSTRAINT `fk_visita_tratamiento` FOREIGN KEY (`idTratamiento`) REFERENCES `tratamiento` (`idTratamiento`),
  ADD CONSTRAINT `visita_ibfk_1` FOREIGN KEY (`idMascota`) REFERENCES `mascotas` (`idMascota`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
