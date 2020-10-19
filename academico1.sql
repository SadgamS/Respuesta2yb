-- phpMyAdmin SQL Dump
-- version 4.8.5
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 19-10-2020 a las 23:30:34
-- Versión del servidor: 10.1.38-MariaDB
-- Versión de PHP: 7.3.4

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `academico1`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `identificador`
--

CREATE TABLE `identificador` (
  `ci` int(11) NOT NULL,
  `nombre_c` varchar(50) DEFAULT NULL,
  `fecha_nac` date DEFAULT NULL,
  `lugar_red` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `identificador`
--

INSERT INTO `identificador` (`ci`, `nombre_c`, `fecha_nac`, `lugar_red`) VALUES
(1233, 'Marta HH', '2000-12-11', '05'),
(13211, 'Marco FF', '2012-04-21', '09'),
(15312, 'Juana GG', '2011-12-21', '04'),
(15531, 'Juan Perez', '2001-06-21', '02'),
(34123, 'Pablo Ma.', '2004-05-18', '03'),
(34312, 'Pablo Ma.', '1999-11-12', '03'),
(65423, 'Mario AA', '2006-06-21', '04'),
(66431, 'Mario AA', '2013-01-05', '04'),
(75323, 'Ana BB', '2006-03-14', '02'),
(75456, 'Marta BB', '2005-01-21', '05'),
(82341, 'Rosa CC', '2004-04-18', '03'),
(84231, 'Rocio CC', '2004-02-21', '06'),
(97655, 'Pedro DD', '2002-05-21', '07'),
(104312, 'Judas EE', '2001-02-21', '08');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `notas`
--

CREATE TABLE `notas` (
  `id` int(11) NOT NULL,
  `ci` int(11) DEFAULT NULL,
  `materia` varchar(20) DEFAULT NULL,
  `nota` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `notas`
--

INSERT INTO `notas` (`id`, `ci`, `materia`, `nota`) VALUES
(2, 15531, 'INF-317', 51),
(3, 34312, 'INF-324', 40),
(4, 66431, 'INF-121', 41),
(5, 75323, 'INF-111', 67),
(6, 82341, 'INF-281', 80),
(7, 34123, 'INF-131', 38),
(8, 65423, 'INF-111', 80),
(9, 75456, 'INF-151', 56),
(10, 84231, 'INF-121', 58),
(11, 97655, 'MAT-114', 31),
(12, 104312, 'MAT-115', 59),
(13, 13211, 'INF-111', 85),
(14, 15312, 'INF-331', 70),
(15, 1233, 'INF-324', 60);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuario`
--

CREATE TABLE `usuario` (
  `id` int(11) NOT NULL,
  `ci` int(11) DEFAULT NULL,
  `clave` varchar(50) DEFAULT NULL,
  `login` varchar(20) DEFAULT NULL,
  `color` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `identificador`
--
ALTER TABLE `identificador`
  ADD PRIMARY KEY (`ci`);

--
-- Indices de la tabla `notas`
--
ALTER TABLE `notas`
  ADD PRIMARY KEY (`id`),
  ADD KEY `ci` (`ci`);

--
-- Indices de la tabla `usuario`
--
ALTER TABLE `usuario`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `ci` (`ci`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `notas`
--
ALTER TABLE `notas`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT de la tabla `usuario`
--
ALTER TABLE `usuario`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `notas`
--
ALTER TABLE `notas`
  ADD CONSTRAINT `notas_ibfk_1` FOREIGN KEY (`ci`) REFERENCES `identificador` (`ci`);

--
-- Filtros para la tabla `usuario`
--
ALTER TABLE `usuario`
  ADD CONSTRAINT `usuario_ibfk_1` FOREIGN KEY (`ci`) REFERENCES `identificador` (`ci`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
