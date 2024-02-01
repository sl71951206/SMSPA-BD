CREATE TABLE `empleados` (
  `id_empleado` int(11) NOT NULL PRIMARY KEY AUTO_INCREMENT,
  `nombres` varchar(100) DEFAULT NULL,
  `apellidos` varchar(100) DEFAULT NULL,
  `url_foto` varchar(500) DEFAULT NULL,
  `estado` tinyint(1) DEFAULT NULL
);

INSERT INTO `empleados` (`nombres`, `apellidos`, `url_foto`, `estado`) VALUES
('Luisa', 'Fernandez', 'https://media.gettyimages.com/id/1126310650/es/foto/retrato-de-un-due%C3%B1o-de-negocio-trabajando-en-un-spa.jpg?s=612x612&w=0&k=20&c=pGita07Su5u4H1wtNUXGCl01TK6k69fpEFQNnRajS44=', 1),
('Valeria', 'Quintana', 'https://media.gettyimages.com/id/1329039746/es/foto/recepcionista-feliz-trabajando-en-una-peluquer%C3%ADa-en-la-recepci%C3%B3n.jpg?s=612x612&w=0&k=20&c=NYJgnv_H3MeU4KekeWHoqUO2lic6SA4NWLc-E59xJjM=', 1),
('Martha', 'Cardenas', 'https://media.gettyimages.com/id/1296150604/es/foto/terapeuta-de-belleza-aprendiz.jpg?s=612x612&w=0&k=20&c=Wrne-Xp0EYYZd5a2tvRi5PzS_ycEAvYO8uiGJ8IvVls=', 1),
('Luis', 'Diaz', 'https://media.gettyimages.com/id/1397286352/es/foto/business-manager-verificando-reservas-en-tableta-digital.jpg?s=612x612&w=0&k=20&c=DrqDPhZjSkN78a9nBh4K1dUmun6O-WDGTueHNAsHM2A=', 1),
('Josefina', 'Linares', 'https://media.gettyimages.com/id/904991460/es/foto/smiling-woman-waiting-for-customers-debica-poland.jpg?s=612x612&w=0&k=20&c=h74utqAYnG5Wsywnc_mlNxP7LU93iIyAFTACaxfdGWU=', 1),
('Lizbeth', 'Suarez', 'https://media.gettyimages.com/id/1029003016/es/foto/hermosa-empresaria-de-un-pie-de-sal%C3%B3n-de-pelo-detr%C3%A1s-de-la-recepci%C3%B3n-sonriendo-a-c%C3%A1mara.jpg?s=612x612&w=0&k=20&c=SDupUwGxkP9WMClk9wBjMr5iWxNa2-99McJ9FEs_-fc=', 1);

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
('Tratamiento Facial Hidratante', 'Hidratación profunda para tu rostro. Nuestro tratamiento facial hidratante deja la piel suave y luminosa.', 45, 75.00, 'https://i0.wp.com/qpwebsite.s3.amazonaws.com/uploads/2017/10/b5_faciales.jpg?fit=1200%2C800&ssl=1', 'Belleza', 1, 1),
('Masaje Relajante', 'Experimenta la paz y relajación profunda con nuestro masaje relajante. Nuestros terapeutas expertos te brindarán una experiencia rejuvenecedora.', 60, 80.00, 'https://www.trainingforgold.es/images/easyblog_articles/23/masajes-relajacion-sevilla-fisioterapeuta.jpg', 'Masajes', 1, 1),
('Limpieza Facial Profunda', 'Renueva tu piel con nuestro facial de limpieza profunda. Elimina impurezas y revitaliza tu cutis para una apariencia fresca y saludable.', 45, 100.00, 'https://i0.wp.com/menshealthlatam.com/wp-content/uploads/2023/12/mejor-limpieza-facial.jpg?fit=1200%2C800&ssl=1', 'Belleza', 1, 1),
('Tratamiento Capilar Hidratación', 'Devuelve la vitalidad a tu cabello con nuestro tratamiento capilar de hidratación intensa. Cabello suave, sedoso y lleno de vida.', 30, 70.00, 'https://piellem.com/assets/imagens/Hair-Schedule1200800px.jpg', 'Belleza', 0, 1),
('Exfoliación Corporal Aromaterapia', 'Disfruta de una exfoliación corporal que combina la aromaterapia para una experiencia sensorial única. Deja tu piel suave y radiante.', 40, 90.00, 'https://graziamagazine.com/es/wp-content/uploads/sites/12/2022/05/todo-lo-que-debes-saber-sobre-la-exfoliacion-corporal.jpg?fit=1200%2C800', 'Belleza', 0, 1);

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