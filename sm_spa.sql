-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 21-02-2024 a las 18:43:45
-- Versión del servidor: 10.4.28-MariaDB
-- Versión de PHP: 8.2.4

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `sm_spa`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `empleados`
--

CREATE TABLE `empleados` (
  `id_empleado` int(11) NOT NULL,
  `apellidos` varchar(200) NOT NULL,
  `correo` varchar(300) NOT NULL,
  `descripcion` varchar(2000) DEFAULT NULL,
  `estado` bit(1) NOT NULL,
  `nombres` varchar(200) NOT NULL,
  `telefono` varchar(50) NOT NULL,
  `url_foto` varchar(1000) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `instalaciones`
--

CREATE TABLE `instalaciones` (
  `id_instalacion` int(11) NOT NULL,
  `color` char(7) DEFAULT NULL,
  `descripcion` varchar(2000) DEFAULT NULL,
  `estado` bit(1) NOT NULL,
  `rotulo` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `perfiles`
--

CREATE TABLE `perfiles` (
  `id_perfil` int(11) NOT NULL,
  `contrasena` varchar(255) NOT NULL,
  `usuario` enum('USER','ADMIN') NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `promociones`
--

CREATE TABLE `promociones` (
  `id_promocion` int(11) NOT NULL,
  `descripcion` varchar(3000) DEFAULT NULL,
  `descuento` smallint(6) NOT NULL,
  `estado` bit(1) NOT NULL,
  `fecha_fin` date NOT NULL,
  `fecha_inicio` date NOT NULL,
  `tipo` enum('EFECTIVO','PORCENTUAL') NOT NULL,
  `titulo` varchar(500) NOT NULL,
  `url_imagen` varchar(1000) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `reservas`
--

CREATE TABLE `reservas` (
  `id_reserva` int(11) NOT NULL,
  `apellidos_cliente` varchar(200) NOT NULL,
  `correo_cliente` varchar(300) NOT NULL,
  `estado` enum('CANCELADO','IMPAGO','PAGADO','REPROGRAMADO') NOT NULL,
  `fecha` date NOT NULL,
  `hora` time NOT NULL,
  `hora_fin` time NOT NULL,
  `nombres_cliente` varchar(200) NOT NULL,
  `telefono_cliente` varchar(50) NOT NULL,
  `id_empleado` int(11) NOT NULL,
  `id_instalacion` int(11) NOT NULL,
  `id_promocion` int(11) DEFAULT NULL,
  `id_servicio` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `servicios`
--

CREATE TABLE `servicios` (
  `id_servicio` int(11) NOT NULL,
  `categoria` varchar(100) NOT NULL,
  `descripcion` varchar(2000) DEFAULT NULL,
  `duracion` smallint(6) NOT NULL,
  `estado` bit(1) NOT NULL,
  `favorito` bit(1) NOT NULL,
  `nombre` varchar(200) NOT NULL,
  `precio` decimal(7,2) NOT NULL,
  `url_imagen` varchar(1000) DEFAULT NULL,
  `id_promocion` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `empleados`
--
ALTER TABLE `empleados`
  ADD PRIMARY KEY (`id_empleado`),
  ADD UNIQUE KEY `UK_h1yoynfig4dn2d3vff3luwyj` (`correo`),
  ADD UNIQUE KEY `UK_iik9xxjtgmft5hfuh7nx4whcp` (`telefono`);

--
-- Indices de la tabla `instalaciones`
--
ALTER TABLE `instalaciones`
  ADD PRIMARY KEY (`id_instalacion`),
  ADD UNIQUE KEY `UK_fdpr7lqdqo4xpa4clror4rpq3` (`rotulo`);

--
-- Indices de la tabla `perfiles`
--
ALTER TABLE `perfiles`
  ADD PRIMARY KEY (`id_perfil`);

--
-- Indices de la tabla `promociones`
--
ALTER TABLE `promociones`
  ADD PRIMARY KEY (`id_promocion`),
  ADD UNIQUE KEY `UK_lljj6r5d6itrrbp6k6d8skvhe` (`titulo`);

--
-- Indices de la tabla `reservas`
--
ALTER TABLE `reservas`
  ADD PRIMARY KEY (`id_reserva`),
  ADD KEY `FKol1of3eey7mg2dww0dfpj13bx` (`id_empleado`),
  ADD KEY `FKe8ssyctibtie036e8eu696tc6` (`id_instalacion`),
  ADD KEY `FKruk66ryywymrkhyyni9xddi3w` (`id_promocion`),
  ADD KEY `FK2owpd8tl1b57k4cmqhuttlu2e` (`id_servicio`);

--
-- Indices de la tabla `servicios`
--
ALTER TABLE `servicios`
  ADD PRIMARY KEY (`id_servicio`),
  ADD UNIQUE KEY `UK_lu7evqbgflb102gqcmbg8y8mf` (`nombre`),
  ADD KEY `FK4mgseh68bpfpavtco8pciuug5` (`id_promocion`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `empleados`
--
ALTER TABLE `empleados`
  MODIFY `id_empleado` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `instalaciones`
--
ALTER TABLE `instalaciones`
  MODIFY `id_instalacion` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `perfiles`
--
ALTER TABLE `perfiles`
  MODIFY `id_perfil` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `promociones`
--
ALTER TABLE `promociones`
  MODIFY `id_promocion` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `reservas`
--
ALTER TABLE `reservas`
  MODIFY `id_reserva` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `servicios`
--
ALTER TABLE `servicios`
  MODIFY `id_servicio` int(11) NOT NULL AUTO_INCREMENT;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `reservas`
--
ALTER TABLE `reservas`
  ADD CONSTRAINT `FK2owpd8tl1b57k4cmqhuttlu2e` FOREIGN KEY (`id_servicio`) REFERENCES `servicios` (`id_servicio`),
  ADD CONSTRAINT `FKe8ssyctibtie036e8eu696tc6` FOREIGN KEY (`id_instalacion`) REFERENCES `instalaciones` (`id_instalacion`),
  ADD CONSTRAINT `FKol1of3eey7mg2dww0dfpj13bx` FOREIGN KEY (`id_empleado`) REFERENCES `empleados` (`id_empleado`),
  ADD CONSTRAINT `FKruk66ryywymrkhyyni9xddi3w` FOREIGN KEY (`id_promocion`) REFERENCES `promociones` (`id_promocion`);

--
-- Filtros para la tabla `servicios`
--
ALTER TABLE `servicios`
  ADD CONSTRAINT `FK4mgseh68bpfpavtco8pciuug5` FOREIGN KEY (`id_promocion`) REFERENCES `promociones` (`id_promocion`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
