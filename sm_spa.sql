-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 12-03-2024 a las 23:14:12
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

--
-- Volcado de datos para la tabla `empleados`
--

INSERT INTO `empleados` (`id_empleado`, `apellidos`, `correo`, `descripcion`, `estado`, `nombres`, `telefono`, `url_foto`) VALUES
(1, 'Gómez', 'gomez@example.com', 'Terapeuta de masajes', b'1', 'Laura', '1234567890', 'empleado-laura_gomez.jpg'),
(2, 'Díaz', 'diaz@example.com', 'Esteticista facial', b'1', 'Betsy', '9876543210', 'empleado-betsy_diaz.jpg'),
(3, 'Sánchez', 'sanchez@example.com', 'Especialista en aromaterapia', b'1', 'Ana', '5555555555', 'empleado-ana_sanchez.jpg'),
(4, 'Torres', 'torres@example.com', 'Recepcionista y atención al cliente', b'1', 'María', '9999999999', 'empleado-maria_torres.jpg'),
(5, 'Hernández', 'hernandez@example.com', NULL, b'0', 'Luisa', '7777777777', NULL);

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

--
-- Volcado de datos para la tabla `instalaciones`
--

INSERT INTO `instalaciones` (`id_instalacion`, `color`, `descripcion`, `estado`, `rotulo`) VALUES
(1, '#FFFFFF', 'Sala de masajes relajantes A', b'1', 'Sala de Masajes 1'),
(2, '#C0C0C0', 'Sala de masajes relajantes B', b'1', 'Sala de Masajes 2'),
(3, '#FFD700', 'Sala de masajes relajantes C', b'1', 'Sala de Masajes 3'),
(4, '#C0C0C0', 'Piscina climatizada', b'0', 'Piscina'),
(5, '#FFD700', 'Sauna de vapor', b'0', 'Sauna'),
(6, NULL, NULL, b'0', 'Sala de Yoga'),
(7, '#ADD8E6', 'Jacuzzi con hidromasaje', b'0', 'Jacuzzi');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `perfiles`
--

CREATE TABLE `perfiles` (
  `id_perfil` int(11) NOT NULL,
  `contrasena` varchar(255) NOT NULL,
  `usuario` enum('USER','ADMIN') NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `perfiles`
--

INSERT INTO `perfiles` (`id_perfil`, `contrasena`, `usuario`) VALUES
(1, 'verde', 'USER'),
(2, 'admin', 'ADMIN');

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

--
-- Volcado de datos para la tabla `promociones`
--

INSERT INTO `promociones` (`id_promocion`, `descripcion`, `descuento`, `estado`, `fecha_fin`, `fecha_inicio`, `tipo`, `titulo`, `url_imagen`) VALUES
(1, '¡Relájate al máximo con un 20% de descuento en masajes!', 20, b'1', '2024-04-30', '2024-03-01', 'PORCENTUAL', 'Descuento en Masajes', 'promocion-20_porciento.png'),
(2, 'Renueva tu piel con un tratamiento facial y obtén un 15% de descuento', 15, b'1', '2024-04-15', '2024-03-01', 'PORCENTUAL', 'Descuento en Tratamiento Facial', 'promocion-tratamiento_facial.jpg'),
(3, 'Disfruta de un día de spa completo por $12 menos', 12, b'1', '2024-04-30', '2024-02-15', 'EFECTIVO', 'Oferta Día de Spa', 'promocion-12_soles.jpg'),
(4, 'Inicia tu semana con energía: 10% de descuento en clases de yoga', 10, b'0', '2024-03-31', '2024-02-01', 'PORCENTUAL', 'Descuento en Clases de Yoga', NULL),
(5, '¡Reserva ahora y obtén un 25% de descuento en cualquier tratamiento!', 25, b'0', '2024-02-15', '2024-01-01', 'PORCENTUAL', 'Descuento en Reservas', 'promocion-masajes_25_porciento.jpg'),
(6, '', 10, b'0', '2024-03-22', '2024-03-11', 'PORCENTUAL', 'Promociones abiertas', NULL);

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

--
-- Volcado de datos para la tabla `reservas`
--

INSERT INTO `reservas` (`id_reserva`, `apellidos_cliente`, `correo_cliente`, `estado`, `fecha`, `hora`, `hora_fin`, `nombres_cliente`, `telefono_cliente`, `id_empleado`, `id_instalacion`, `id_promocion`, `id_servicio`) VALUES
(1, 'López', 'lopez@example.com', 'CANCELADO', '2024-01-01', '10:00:00', '11:00:00', 'María', '1234567890', 1, 2, NULL, 1),
(2, 'González', 'gonzalez@example.com', 'IMPAGO', '2024-01-02', '11:00:00', '12:30:00', 'Juan', '9876543210', 2, 3, NULL, 4),
(3, 'Martínez', 'martinez@example.com', 'REPROGRAMADO', '2024-01-03', '14:00:00', '15:00:00', 'Ana', '5555555555', 3, 1, NULL, 2),
(4, 'Pérez', 'perez@example.com', 'PAGADO', '2024-01-04', '10:30:00', '12:00:00', 'Carlos', '9999999999', 4, 4, NULL, 3),
(5, 'Gómez', 'gomez@example.com', 'PAGADO', '2024-01-05', '16:00:00', '17:00:00', 'Laura', '7777777777', 5, 5, NULL, 5),
(6, 'Díaz', 'diaz@example.com', 'PAGADO', '2024-02-06', '15:00:00', '16:30:00', 'Sofía', '1111111111', 1, 3, NULL, 1),
(7, 'Sánchez', 'sanchez@example.com', 'PAGADO', '2024-02-07', '13:00:00', '14:00:00', 'Diego', '2222222222', 2, 2, NULL, 2),
(8, 'Romero', 'romero@example.com', 'PAGADO', '2024-02-08', '12:00:00', '13:00:00', 'Elena', '3333333333', 3, 1, NULL, 3),
(9, 'Hernández', 'hernandez@example.com', 'PAGADO', '2024-02-09', '09:45:00', '10:30:00', 'Pablo', '4444444444', 4, 4, NULL, 4),
(10, 'Suárez', 'suarez@example.com', 'PAGADO', '2024-02-10', '17:30:00', '18:30:00', 'Alicia', '5555555555', 5, 5, NULL, 5),
(11, 'Torres', 'torres@example.com', 'PAGADO', '2024-02-21', '11:30:00', '13:00:00', 'Javier', '6666666666', 1, 3, NULL, 1),
(12, 'Dominguez', 'dominguez@example.com', 'PAGADO', '2024-02-21', '14:00:00', '15:30:00', 'Marina', '7777777777', 2, 2, NULL, 2),
(13, 'Ramírez', 'ramirez@example.com', 'PAGADO', '2024-02-21', '10:00:00', '11:00:00', 'Pedro', '8888888888', 3, 1, NULL, 3),
(14, 'Reyes', 'reyes@example.com', 'PAGADO', '2024-02-22', '16:30:00', '18:00:00', 'Laura', '9999999999', 4, 4, NULL, 4),
(15, 'Álvarez', 'alvarez@example.com', 'PAGADO', '2024-02-23', '15:00:00', '16:00:00', 'Jorge', '1111111111', 5, 5, NULL, 5),
(16, 'Vargas', 'vargas@example.com', 'PAGADO', '2024-02-24', '12:30:00', '14:00:00', 'Andrea', '2222222222', 1, 3, NULL, 1),
(17, 'Guerrero', 'guerrero@example.com', 'PAGADO', '2024-02-25', '09:45:00', '10:30:00', 'Marta', '3333333333', 2, 2, NULL, 2),
(18, 'Montero', 'montero@example.com', 'REPROGRAMADO', '2024-02-26', '14:00:00', '15:30:00', 'Daniel', '4444444444', 3, 1, NULL, 3),
(19, 'Castillo', 'castillo@example.com', 'IMPAGO', '2024-02-23', '11:30:00', '13:00:00', 'Sara', '5555555555', 4, 4, NULL, 4),
(20, 'Ortega', 'ortega@example.com', 'CANCELADO', '2024-02-24', '16:00:00', '17:00:00', 'Roberto', '6666666666', 5, 5, NULL, 5),
(21, 'Perez', 'sl71951206@idat.edu.pe', 'PAGADO', '2024-03-23', '14:15:00', '15:15:00', 'Ana', '23490823490', 1, 1, NULL, 3),
(22, 'Dwayne', 'sl71951206@idat.edu.pe', 'PAGADO', '2024-03-23', '14:45:00', '16:15:00', 'Arthur', '023482940', 2, 2, 2, 2),
(23, 'Selmy', 'sl71951206@idat.edu.pe', 'PAGADO', '2024-03-19', '13:00:00', '14:00:00', 'Baaristan', '23434789', 1, 1, NULL, 1),
(24, 'Dondarrion', 'sl71951206@idat.edu.pe', 'PAGADO', '2024-03-19', '12:45:00', '13:45:00', 'Berric', '0938423904', 2, 2, NULL, 1),
(25, 'Swann', 'sl71951206@idat.edu.pe', 'PAGADO', '2024-03-15', '12:45:00', '13:45:00', 'Elizabeth', '23904823904', 1, 1, NULL, 1),
(26, 'Kettleblack', 'sl71951206@idat.edu.pe', 'PAGADO', '2024-03-19', '12:45:00', '13:45:00', 'Oswell', '4892349', 3, 3, NULL, 1),
(27, 'Tully', 'sl71951206@idat.edu.pe', 'PAGADO', '2024-03-19', '09:30:00', '10:30:00', 'Catelyn', '2349083094', 4, 1, NULL, 1),
(28, 'Stark', 'sl71951206@idat.edu.pe', 'PAGADO', '2024-03-23', '13:00:00', '14:30:00', 'Ned', '08402394', 3, 3, 2, 2);

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
-- Volcado de datos para la tabla `servicios`
--

INSERT INTO `servicios` (`id_servicio`, `categoria`, `descripcion`, `duracion`, `estado`, `favorito`, `nombre`, `precio`, `url_imagen`, `id_promocion`) VALUES
(1, 'Masajes', 'Masaje relajante de cuerpo completo', 60, b'1', b'1', 'Masaje Relajante', 50.00, 'servicio-masaje_relajante.jpeg', NULL),
(2, 'Belleza', 'Tratamiento facial rejuvenecedor', 90, b'1', b'1', 'Tratamiento Facial Rejuvenecedor', 80.00, 'servicio-tratamiento_facial_rejuvenecedor.jpeg', 2),
(3, 'Yoga', 'Clase de yoga para principiantes dictada en el salón oval', 60, b'1', b'0', 'Clase de Yoga para Principiantes', 20.00, 'servicio-clase_de_yoga_para_principiantes.jpeg', NULL),
(4, 'Belleza', 'Pedicura spa con masaje de pies', 45, b'1', b'1', 'Pedicura Spa con Masaje', 35.00, 'servicio-pedicura_spa_con_masaje.jpg', NULL),
(5, 'Masajes', '', 30, b'0', b'0', 'Sesión de Aromaterapia', 40.00, NULL, NULL),
(6, 'Masajes', 'Masaje terapéutico para aliviar dolores musculares', 75, b'0', b'0', 'Masaje Terapéutico', 60.00, NULL, 5),
(7, 'Masajes', 'Masaje bañado por el oro de los incas', 60, b'0', b'0', 'Masaje peruano', 100.00, 'desierto.jpeg', NULL);

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
  MODIFY `id_empleado` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT de la tabla `instalaciones`
--
ALTER TABLE `instalaciones`
  MODIFY `id_instalacion` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT de la tabla `perfiles`
--
ALTER TABLE `perfiles`
  MODIFY `id_perfil` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `promociones`
--
ALTER TABLE `promociones`
  MODIFY `id_promocion` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT de la tabla `reservas`
--
ALTER TABLE `reservas`
  MODIFY `id_reserva` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=29;

--
-- AUTO_INCREMENT de la tabla `servicios`
--
ALTER TABLE `servicios`
  MODIFY `id_servicio` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

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
