-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 18-09-2025 a las 23:00:36
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
  `dni` int(11) NOT NULL,
  `nombre` varchar(30) NOT NULL,
  `apellido` varchar(30) NOT NULL,
  `telefono` bigint(20) DEFAULT NULL,
  `direccion` varchar(50) NOT NULL,
  `contactoAlternativo` bigint(20) DEFAULT NULL,
  `activo` tinyint(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `cliente`
--

INSERT INTO `cliente` (`idCliente`, `dni`, `nombre`, `apellido`, `telefono`, `direccion`, `contactoAlternativo`, `activo`) VALUES
(1, 30111222, 'Juan', 'Pérez', 1122334455, 'Av. Siempre Viva 123', 1198765432, 1),
(2, 30111333, 'María', 'López', 1133445566, 'Calle Falsa 456', 1187654321, 1),
(3, 30111444, 'Carlos', 'Gómez', 1144556677, 'Av. Rivadavia 789', 1176543210, 1),
(4, 30111555, 'Laura', 'Martínez', 1155667788, 'Belgrano 234', 1165432109, 1),
(5, 30111666, 'Pedro', 'Fernández', 1166778899, 'San Martín 987', 1154321098, 1),
(6, 30111777, 'Ana', 'Torres', 1177889900, 'Mitre 654', 1143210987, 1),
(7, 30111888, 'José', 'Díaz', 1188990011, 'Laprida 321', 1132109876, 1),
(8, 30111999, 'Lucía', 'Suárez', 1199001122, 'Lavalle 741', 1121098765, 1),
(9, 30112000, 'Sofía', 'Ramírez', 1100112233, 'Moreno 852', 1110987654, 1),
(10, 30112111, 'Diego', 'Álvarez', 1111223344, 'Castro Barros 963', 1109876543, 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `mascota`
--

CREATE TABLE `mascota` (
  `idMascota` int(11) NOT NULL,
  `alias` varchar(30) NOT NULL,
  `sexo` varchar(30) NOT NULL,
  `especie` varchar(30) NOT NULL,
  `raza` varchar(30) NOT NULL,
  `colorPelo` varchar(50) NOT NULL,
  `fechaNac` date NOT NULL,
  `activo` tinyint(1) NOT NULL,
  `idCliente` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `mascota`
--

INSERT INTO `mascota` (`idMascota`, `alias`, `sexo`, `especie`, `raza`, `colorPelo`, `fechaNac`, `activo`, `idCliente`) VALUES
(1, 'Firulais', 'Macho', 'Perro', 'Labrador', 'Marrón', '2020-05-01', 1, 1),
(2, 'Mishi', 'Hembra', 'Gato', 'Siames', 'Gris', '2019-03-15', 1, 2),
(3, 'Rocky', 'Macho', 'Perro', 'Bulldog', 'Blanco', '2021-01-20', 1, 3),
(4, 'Luna', 'Hembra', 'Perro', 'Caniche', 'Negro', '2018-09-10', 1, 4),
(5, 'Nube', 'Macho', 'Gato', 'Persa', 'Blanco', '2020-07-25', 1, 5),
(6, 'Toby', 'Macho', 'Perro', 'Pastor Alemán', 'Negro', '2019-11-11', 1, 6),
(7, 'Kira', 'Hembra', 'Gato', 'Mestizo', 'Atigrado', '2021-06-05', 1, 7),
(8, 'Simba', 'Macho', 'Perro', 'Golden Retriever', 'Dorado', '2020-02-14', 1, 8),
(9, 'Nala', 'Hembra', 'Gato', 'Bengalí', 'Naranja', '2019-12-01', 1, 9),
(10, 'Max', 'Macho', 'Perro', 'Beagle', 'Tricolor', '2021-04-18', 1, 10);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tratamiento`
--

CREATE TABLE `tratamiento` (
  `idTratamiento` int(11) NOT NULL,
  `descripcion` varchar(70) NOT NULL,
  `medicamento` varchar(50) NOT NULL,
  `importe` double NOT NULL,
  `tipoTratamiento` varchar(30) NOT NULL,
  `activo` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `tratamiento`
--

INSERT INTO `tratamiento` (`idTratamiento`, `descripcion`, `medicamento`, `importe`, `tipoTratamiento`, `activo`) VALUES
(1, 'Vacunación antirrábica', 'Vacuna Rabia', 1500, 'Vacunación', 1),
(2, 'Desparasitación interna', 'Antiparasitario', 1200, 'Desparasitación', 1),
(3, 'Control general', 'Vitaminas', 1000, 'Chequeo', 1),
(4, 'Tratamiento alergias', 'Antihistamínico', 2000, 'Alergia', 1),
(5, 'Curación heridas', 'Antibióticos', 2500, 'Cirugía menor', 1),
(6, 'Esterilización', 'Anestesia', 5000, 'Cirugía', 1),
(7, 'Tratamiento otitis', 'Gotas óticas', 1800, 'Otitis', 1),
(8, 'Limpieza dental', 'Anestesia ligera', 3000, 'Odontología', 1),
(9, 'Control obesidad', 'Balanceado especial', 2200, 'Nutrición', 1),
(10, 'Tratamiento piel', 'Shampoo medicado', 1600, 'Dermatología', 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `visita`
--

CREATE TABLE `visita` (
  `idVisita` int(11) NOT NULL,
  `idMascota` int(11) NOT NULL,
  `fechaVisita` date NOT NULL,
  `detalle` varchar(50) NOT NULL,
  `peso` double NOT NULL,
  `idTratamiento` int(11) NOT NULL,
  `activo` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `visita`
--

INSERT INTO `visita` (`idVisita`, `idMascota`, `fechaVisita`, `detalle`, `peso`, `idTratamiento`, `activo`) VALUES
(1, 1, '2023-01-10', 'Vacunación anual', 25.5, 1, 1),
(2, 2, '2023-02-15', 'Desparasitación', 4.2, 2, 1),
(3, 3, '2023-03-20', 'Chequeo de rutina', 18, 3, 1),
(4, 4, '2023-04-12', 'Tratamiento alergia', 7.5, 4, 1),
(5, 5, '2023-05-25', 'Curación de herida', 3.8, 5, 1),
(6, 6, '2023-06-08', 'Esterilización', 30, 6, 1),
(7, 7, '2023-07-14', 'Otitis leve', 4, 7, 1),
(8, 8, '2023-08-21', 'Limpieza dental', 28.3, 8, 1),
(9, 9, '2023-09-05', 'Plan nutricional', 5.1, 9, 1),
(10, 10, '2023-10-11', 'Tratamiento piel', 12.6, 10, 1);

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `cliente`
--
ALTER TABLE `cliente`
  ADD PRIMARY KEY (`idCliente`);

--
-- Indices de la tabla `mascota`
--
ALTER TABLE `mascota`
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
  ADD KEY `idTratamiento` (`idTratamiento`);

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `mascota`
--
ALTER TABLE `mascota`
  ADD CONSTRAINT `idCliente` FOREIGN KEY (`idCliente`) REFERENCES `cliente` (`idCliente`);

--
-- Filtros para la tabla `visita`
--
ALTER TABLE `visita`
  ADD CONSTRAINT `idMascota` FOREIGN KEY (`idMascota`) REFERENCES `mascota` (`idMascota`),
  ADD CONSTRAINT `idTratamiento` FOREIGN KEY (`idTratamiento`) REFERENCES `tratamiento` (`idTratamiento`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
