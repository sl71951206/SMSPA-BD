-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 30-01-2024 a las 22:56:16
-- Versión del servidor: 10.4.24-MariaDB
-- Versión de PHP: 8.1.6

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
-- Estructura de tabla para la tabla `empleado`
--

CREATE TABLE `empleado` (
  `id_empleado` int(11) NOT NULL,
  `nombre` varchar(100) DEFAULT NULL,
  `especialidad_id` int(11) DEFAULT NULL,
  `horario_trabajo` varchar(100) DEFAULT NULL,
  `url_foto` varchar(500) DEFAULT NULL,
  `estado` tinyint(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `empleado`
--

INSERT INTO `empleado` (`id_empleado`, `nombre`, `especialidad_id`, `horario_trabajo`, `url_foto`, `estado`) VALUES
(1, 'Luisa Fernández', 1, '9:30 - 18:00', 'https://media.gettyimages.com/id/1126310650/es/foto/retrato-de-un-due%C3%B1o-de-negocio-trabajando-en-un-spa.jpg?s=612x612&w=0&k=20&c=pGita07Su5u4H1wtNUXGCl01TK6k69fpEFQNnRajS44=', 1),
(2, 'Valeria Quintana', 1, '9:30 - 18:00', 'https://media.gettyimages.com/id/1329039746/es/foto/recepcionista-feliz-trabajando-en-una-peluquer%C3%ADa-en-la-recepci%C3%B3n.jpg?s=612x612&w=0&k=20&c=NYJgnv_H3MeU4KekeWHoqUO2lic6SA4NWLc-E59xJjM=', 1),
(3, 'Martha Cardenas', 2, '9:30 - 18:00', 'https://media.gettyimages.com/id/1296150604/es/foto/terapeuta-de-belleza-aprendiz.jpg?s=612x612&w=0&k=20&c=Wrne-Xp0EYYZd5a2tvRi5PzS_ycEAvYO8uiGJ8IvVls=', 1),
(4, 'Luis Díaz', 2, '9:30 - 18:00', 'https://media.gettyimages.com/id/1397286352/es/foto/business-manager-verificando-reservas-en-tableta-digital.jpg?s=612x612&w=0&k=20&c=DrqDPhZjSkN78a9nBh4K1dUmun6O-WDGTueHNAsHM2A=', 1),
(5, 'Josefina Linares', 3, '9:30 - 18:00', 'https://media.gettyimages.com/id/904991460/es/foto/smiling-woman-waiting-for-customers-debica-poland.jpg?s=612x612&w=0&k=20&c=h74utqAYnG5Wsywnc_mlNxP7LU93iIyAFTACaxfdGWU=', 1),
(6, 'Lizbeth Suárez', 3, '9:30 - 18:00', 'https://media.gettyimages.com/id/1029003016/es/foto/hermosa-empresaria-de-un-pie-de-sal%C3%B3n-de-pelo-detr%C3%A1s-de-la-recepci%C3%B3n-sonriendo-a-c%C3%A1mara.jpg?s=612x612&w=0&k=20&c=SDupUwGxkP9WMClk9wBjMr5iWxNa2-99McJ9FEs_-fc=', 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `instalacion`
--

CREATE TABLE `instalacion` (
  `id_instalacion` int(11) NOT NULL,
  `nombre` varchar(100) DEFAULT NULL,
  `descripcion` text DEFAULT NULL,
  `estado` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `instalacion`
--

INSERT INTO `instalacion` (`id_instalacion`, `nombre`, `descripcion`, `estado`) VALUES
(1, 'BAÑO', 'TUBAÑO', 'Activo');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `promociones`
--

CREATE TABLE `promociones` (
  `id_promocion` int(11) NOT NULL,
  `titulo` varchar(100) DEFAULT NULL,
  `descripcion` varchar(255) DEFAULT NULL,
  `estado` tinyint(1) DEFAULT NULL,
  `fecha_inicio` date DEFAULT NULL,
  `fecha_fin` date DEFAULT NULL,
  `url_imagen_promocion` varchar(500) DEFAULT NULL,
  `descuento` int(11) DEFAULT NULL,
  `tipo` varchar(50) DEFAULT NULL,
  `servicio_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `promociones`
--

INSERT INTO `promociones` (`id_promocion`, `titulo`, `descripcion`, `estado`, `fecha_inicio`, `fecha_fin`, `url_imagen_promocion`, `descuento`, `tipo`, `servicio_id`) VALUES
(1, 'El Tercer Masaje con 50% descuento', 'Después de haber reservado 2 veces el Servicio de Masajes , la tercera reserva tiene un descuento del 50%. Revise las condiciones en la imagen mostrada.', 1, '2024-01-11', '2024-01-27', 'SASDASDASDASD', 50, '1', 2),
(2, 'El Tercer Baño Termal con 50% descuento ', 'Después de haber reservado 2 veces el Servicio de Baño Termal, la tercera reserva tiene un descuento del 50%. Revise las condiciones en la imagen mostrada.', 1, '2024-01-02', '2024-01-10', 'assadasdasd', 50, '1', 7),
(3, 'PROMO 3', 'NUEVA DESC', 0, '2024-01-02', '2024-01-10', 'assadasdasd', 50, 'asdsda', 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `reservas`
--

CREATE TABLE `reservas` (
  `id_reserva` int(11) NOT NULL,
  `servicio` int(11) DEFAULT NULL,
  `fecha` date DEFAULT NULL,
  `hora` time DEFAULT NULL,
  `correo_cliente` varchar(100) DEFAULT NULL,
  `nombre_cliente` varchar(50) DEFAULT NULL,
  `apellido_cliente` varchar(50) DEFAULT NULL,
  `telefono_cliente` varchar(15) DEFAULT NULL,
  `empleado` int(11) DEFAULT NULL,
  `instalacion` int(11) DEFAULT NULL,
  `promocion` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `reservas`
--

INSERT INTO `reservas` (`id_reserva`, `servicio`, `fecha`, `hora`, `correo_cliente`, `nombre_cliente`, `apellido_cliente`, `telefono_cliente`, `empleado`, `instalacion`, `promocion`) VALUES
(1, 1, '2024-01-03', '13:23:01', 'DASDASD@GMAIL.COM', 'LUCHO', 'PEDRAZA', '94613817', 1, 1, 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `servicio`
--

CREATE TABLE `servicio` (
  `id_servicio` int(11) NOT NULL,
  `nombre` varchar(100) DEFAULT NULL,
  `descripcion` varchar(500) DEFAULT NULL,
  `duracion` int(11) DEFAULT NULL,
  `precio` decimal(10,2) DEFAULT NULL,
  `url_imagen` varchar(500) DEFAULT NULL,
  `categoria` varchar(50) DEFAULT NULL,
  `favorito` tinyint(1) NOT NULL,
  `estado` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `servicio`
--

INSERT INTO `servicio` (`id_servicio`, `nombre`, `descripcion`, `duracion`, `precio`, `url_imagen`, `categoria`, `favorito`, `estado`) VALUES
(1, 'Tratamiento Facial Hidratante', 'Hidratación profunda para tu rostro. Nuestro tratamiento facial hidratante deja la piel suave y luminosa.', 45, '75.00', 'https://i0.wp.com/qpwebsite.s3.amazonaws.com/uploads/2017/10/b5_faciales.jpg?fit=1200%2C800&ssl=1', '1', 1, 1),
(2, 'Masaje Relajante', 'Experimenta la paz y relajación profunda con nuestro masaje relajante. Nuestros terapeutas expertos te brindarán una experiencia rejuvenecedora.', 60, '80.00', 'https://www.trainingforgold.es/images/easyblog_articles/23/masajes-relajacion-sevilla-fisioterapeuta.jpg', '1', 1, 1),
(3, 'Limpieza Facial Profunda', 'Renueva tu piel con nuestro facial de limpieza profunda. Elimina impurezas y revitaliza tu cutis para una apariencia fresca y saludable.', 45, '100.00', 'https://i0.wp.com/menshealthlatam.com/wp-content/uploads/2023/12/mejor-limpieza-facial.jpg?fit=1200%2C800&ssl=1', '1', 1, 1),
(4, 'Tratamiento Capilar Hidratación', 'Devuelve la vitalidad a tu cabello con nuestro tratamiento capilar de hidratación intensa. Cabello suave, sedoso y lleno de vida.', 30, '70.00', 'https://piellem.com/assets/imagens/Hair-Schedule1200800px.jpg', '2', 0, 1),
(5, 'Exfoliación Corporal Aromaterapia', 'Disfruta de una exfoliación corporal que combina la aromaterapia para una experiencia sensorial única. Deja tu piel suave y radiante.', 40, '90.00', 'https://graziamagazine.com/es/wp-content/uploads/sites/12/2022/05/todo-lo-que-debes-saber-sobre-la-exfoliacion-corporal.jpg?fit=1200%2C800', '2', 0, 1),
(6, 'Manicura y Pedicura Hecho en Gel', 'Embellece tus manos y pies con nuestra manicura y pedicura spa. Un cuidado completo para uñas y cutículas.', 60, '50.00', 'https://www.google.com/url?sa=i&url=https%3A%2F%2Fnoticias.tendenzias.com%2Ftrendy%2Funas-gel&psig=AOvVaw1_d_uZF0KJvBi65yequfyL&ust=1706482869887000&source=images&cd=vfe&opi=89978449&ved=0CBIQjRxqFwoTCODjrbzW_oMDFQAAAAAdAAAAABB3', '3', 0, 0),
(7, 'Baños Termales Rejuvenecedores', 'Sumérgete en la relajación total con nuestros baños termales. Una experiencia rejuvenecedora para su cuerpo, pero también para la mente.', 120, '120.00', 'https://estaticos-cdn.prensaiberica.es/clip/72082620-f68b-46bb-aa25-cc18a8c70fc2_woman-libre-1200_default_0.jpg', '4', 1, 1);

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `empleado`
--
ALTER TABLE `empleado`
  ADD PRIMARY KEY (`id_empleado`),
  ADD KEY `especialidad_id` (`especialidad_id`);

--
-- Indices de la tabla `instalacion`
--
ALTER TABLE `instalacion`
  ADD PRIMARY KEY (`id_instalacion`);

--
-- Indices de la tabla `promociones`
--
ALTER TABLE `promociones`
  ADD PRIMARY KEY (`id_promocion`),
  ADD KEY `servicio_id` (`servicio_id`);

--
-- Indices de la tabla `reservas`
--
ALTER TABLE `reservas`
  ADD PRIMARY KEY (`id_reserva`),
  ADD KEY `servicio` (`servicio`),
  ADD KEY `empleado` (`empleado`),
  ADD KEY `instalacion` (`instalacion`),
  ADD KEY `promocion` (`promocion`);

--
-- Indices de la tabla `servicio`
--
ALTER TABLE `servicio`
  ADD PRIMARY KEY (`id_servicio`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `empleado`
--
ALTER TABLE `empleado`
  MODIFY `id_empleado` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT de la tabla `instalacion`
--
ALTER TABLE `instalacion`
  MODIFY `id_instalacion` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de la tabla `promociones`
--
ALTER TABLE `promociones`
  MODIFY `id_promocion` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de la tabla `reservas`
--
ALTER TABLE `reservas`
  MODIFY `id_reserva` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de la tabla `servicio`
--
ALTER TABLE `servicio`
  MODIFY `id_servicio` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `empleado`
--
ALTER TABLE `empleado`
  ADD CONSTRAINT `empleado_ibfk_1` FOREIGN KEY (`especialidad_id`) REFERENCES `servicio` (`id_servicio`);

--
-- Filtros para la tabla `promociones`
--
ALTER TABLE `promociones`
  ADD CONSTRAINT `promociones_ibfk_1` FOREIGN KEY (`servicio_id`) REFERENCES `servicio` (`id_servicio`);

--
-- Filtros para la tabla `reservas`
--
ALTER TABLE `reservas`
  ADD CONSTRAINT `reservas_ibfk_1` FOREIGN KEY (`servicio`) REFERENCES `servicio` (`id_servicio`),
  ADD CONSTRAINT `reservas_ibfk_2` FOREIGN KEY (`empleado`) REFERENCES `empleado` (`id_empleado`),
  ADD CONSTRAINT `reservas_ibfk_3` FOREIGN KEY (`instalacion`) REFERENCES `instalacion` (`id_instalacion`),
  ADD CONSTRAINT `reservas_ibfk_4` FOREIGN KEY (`promocion`) REFERENCES `promociones` (`id_promocion`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
