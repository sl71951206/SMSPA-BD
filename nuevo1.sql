CREATE TABLE `empleados` (
  `id_empleado` int(11) NOT NULL PRIMARY KEY AUTO_INCREMENT,
  `nombres` varchar(100) DEFAULT NULL,
  `apellidos` varchar(100) DEFAULT NULL,
  `url_foto` varchar(500) DEFAULT NULL,
  `estado` tinyint(1) DEFAULT NULL
);

INSERT INTO `empleados` (`nombres`, `apellidos`, `url_foto`, `estado`) VALUES
('Luisa', 'Fernandez', 'images/luisa_fernandez.jpg', 1),
('Valeria', 'Quintana', 'images/valeria_quintana.jpg', 1),
('Martha', 'Cardenas', 'images/martha_cardenas.jpg', 1),
('Luis', 'Diaz', 'images/luis_diaz.jpg', 1),
('Josefina', 'Linares', 'images/josefina_linares.jpg', 1),
('Lizbeth', 'Suarez', 'images/lizbeth_suarez.jpg', 1);

CREATE TABLE `instalaciones` (
  `id_instalacion` int(11) NOT NULL PRIMARY KEY AUTO_INCREMENT,
  `rotulo` varchar(50) DEFAULT NULL,
  `descripcion` varchar(500) DEFAULT NULL,
  `estado` tinyint(1) DEFAULT NULL
);

INSERT INTO `instalaciones` (`rotulo`, `descripcion`, `estado`) VALUES
('15A', 'Primera habitación, primer piso, a la derecha. Dispone de todos los elementos para realizar los masajes.', '1'),
('15B', 'Segundo habitación, primer piso, pasando el pasillo. Dispone de todos los elementos para realizar los masajes.', '1');

CREATE TABLE `servicios` (
  `id_servicio` int(11) NOT NULL PRIMARY KEY AUTO_INCREMENT,
  `nombre` varchar(100) DEFAULT NULL,
  `descripcion` varchar(500) DEFAULT NULL,
  `duracion` int(11) DEFAULT NULL,
  `precio` decimal(10,2) DEFAULT NULL,
  `url_imagen` varchar(500) DEFAULT NULL,
  `categoria` varchar(100) DEFAULT NULL,
  `favorito` tinyint(1) DEFAULT NULL,
  `estado` tinyint(1) DEFAULT NULL
);

INSERT INTO `servicios` (`nombre`, `descripcion`, `duracion`, `precio`, `url_imagen`, `categoria`, `favorito`, `estado`) VALUES
('Tratamiento Facial Hidratante', 'Hidratación profunda para tu rostro. Nuestro tratamiento facial hidratante deja la piel suave y luminosa.', 45, 75.00, 'images/tratamiento_facial_hidratante.webp', 'Belleza', 1, 1),
('Masaje Relajante', 'Experimenta la paz y relajación profunda con nuestro masaje relajante. Nuestros terapeutas expertos te brindarán una experiencia rejuvenecedora.', 60, 80.00, 'images/masaje_relajante.jpg', 'Masajes', 1, 1),
('Limpieza Facial Profunda', 'Renueva tu piel con nuestro facial de limpieza profunda. Elimina impurezas y revitaliza tu cutis para una apariencia fresca y saludable.', 45, 100.00, 'images/limpieza_facial_profunda.webp', 'Belleza', 1, 1),
('Tratamiento Capilar Hidratación', 'Devuelve la vitalidad a tu cabello con nuestro tratamiento capilar de hidratación intensa. Cabello suave, sedoso y lleno de vida.', 30, 70.00, 'images/tratamiento_capilar_hidratacion.jpg', 'Belleza', 0, 1),
('Exfoliación Corporal Aromaterapia', 'Disfruta de una exfoliación corporal que combina la aromaterapia para una experiencia sensorial única. Deja tu piel suave y radiante.', 40, 90.00, 'images/exfoliacion_corporal_aromaterapia.jpg', 'Belleza', 0, 1);

CREATE TABLE `promociones` (
  `id_promocion` int(11) NOT NULL PRIMARY KEY AUTO_INCREMENT,
  `titulo` varchar(100) DEFAULT NULL,
  `descripcion` text DEFAULT NULL,
  `estado` tinyint(1) DEFAULT NULL,
  `fecha_inicio` date DEFAULT NULL,
  `fecha_fin` date DEFAULT NULL,
  `url_imagen` varchar(500) DEFAULT NULL,
  `descuento` int(11) DEFAULT NULL,
  `tipo` varchar(50) DEFAULT NULL,
  `id_servicio` int(11) DEFAULT NULL,
  FOREIGN KEY (`id_servicio`) REFERENCES `servicios`(`id_servicio`)
);

CREATE TABLE `reservas` (
  `id_reserva` int(11) NOT NULL PRIMARY KEY AUTO_INCREMENT,
  `id_servicio` int(11) DEFAULT NULL,
  `fecha` date DEFAULT NULL,
  `hora` time DEFAULT NULL,
  `correo_cliente` varchar(200) DEFAULT NULL,
  `nombres_cliente` varchar(100) DEFAULT NULL,
  `apellidos_cliente` varchar(100) DEFAULT NULL,
  `telefono_cliente` varchar(20) DEFAULT NULL,
  `id_empleado` int(11) DEFAULT NULL,
  `id_instalacion` int(11) DEFAULT NULL,
  `id_promocion` int(11) DEFAULT NULL,
  FOREIGN KEY (`id_servicio`) REFERENCES `servicios`(`id_servicio`),
  FOREIGN KEY (`id_empleado`) REFERENCES `empleados`(`id_empleado`),
  FOREIGN KEY (`id_instalacion`) REFERENCES `instalaciones`(`id_instalacion`),
  FOREIGN KEY (`id_promocion`) REFERENCES `promociones`(`id_promocion`)
);

INSERT INTO `reservas` (`id_servicio`, `fecha`, `hora`, `correo_cliente`, `nombres_cliente`, `apellidos_cliente`, `telefono_cliente`, `id_empleado`, `id_instalacion`, `id_promocion`) VALUES
(1, '2024-01-03', '13:23:01', 'sl71951206@idat.edu.pe', 'Diego', 'Diaz', '+51995128068', 1, 1, NULL);

CREATE TABLE `miscelaneas` (
  `id` int(11) NOT NULL PRIMARY KEY AUTO_INCREMENT,
  `titulo` varchar(200) DEFAULT NULL,
  `contenido` text DEFAULT NULL
);