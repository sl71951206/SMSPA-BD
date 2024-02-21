CREATE TABLE `empleados` (
  `id_empleado` int(11) NOT NULL PRIMARY KEY AUTO_INCREMENT,
  `apellidos` varchar(200) NOT NULL,
  `correo` varchar(300) NOT NULL UNIQUE,
  `descripcion` varchar(2000) DEFAULT NULL,
  `estado` bit(1) NOT NULL,
  `nombres` varchar(200) NOT NULL,
  `telefono` varchar(50) NOT NULL UNIQUE,
  `url_foto` varchar(1000) DEFAULT NULL
);

INSERT INTO empleados (apellidos, correo, descripcion, estado, nombres, telefono, url_foto) VALUES
('Gómez', 'gomez@example.com', 'Terapeuta de masajes', 1, 'Laura', '1234567890', 'https://cdn.discordapp.com/attachments/1209921567627411577/1209939889919889448/istockphoto-1126310650-2048x2048.jpg?ex=65e8bf55&is=65d64a55&hm=6bce7f68afc872cc13f4d5fcab47d7cd947d8461a64037c14a8ab1aab0bf2bb1&'),
('Díaz', 'diaz@example.com', 'Esteticista facial', 1, 'Betsy', '9876543210', 'https://cdn.discordapp.com/attachments/1209921567627411577/1209940056085762098/istockphoto-695177136-2048x2048.jpg?ex=65e8bf7c&is=65d64a7c&hm=8b04c8015a2c84a41892b3a63aac5ff2721682152e7fa56932b16fa5b732a918&'),
('Sánchez', 'sanchez@example.com', 'Especialista en aromaterapia', 1, 'Ana', '5555555555', 'https://cdn.discordapp.com/attachments/1209921567627411577/1209940133131059220/istockphoto-695685902-2048x2048.jpg?ex=65e8bf8f&is=65d64a8f&hm=c55fa2d62eabff5ab4e8fc60bbee3633065d022a8e0c789a96981ae09f06b46f&'),
('Torres', 'torres@example.com', 'Recepcionista y atención al cliente', 1, 'María', '9999999999', 'https://cdn.discordapp.com/attachments/1209921567627411577/1209940199661109248/istockphoto-695685912-2048x2048.jpg?ex=65e8bf9f&is=65d64a9f&hm=fd6a446de5126b05852a6bf9dc3a88cd777fcd34128d7945030fdf9833e96e22&'),
('Hernández', 'hernandez@example.com', NULL, 0, 'Luisa', '7777777777', NULL);

CREATE TABLE `instalaciones` (
  `id_instalacion` int(11) NOT NULL PRIMARY KEY AUTO_INCREMENT,
  `color` char(7) DEFAULT NULL,
  `descripcion` varchar(2000) DEFAULT NULL,
  `estado` bit(1) NOT NULL,
  `rotulo` varchar(100) NOT NULL UNIQUE
);

INSERT INTO instalaciones (color, descripcion, estado, rotulo) VALUES
('#FFFFFF', 'Sala de masajes relajantes A', 1, 'Sala de Masajes 1'),
('#C0C0C0', 'Sala de masajes relajantes B', 1, 'Sala de Masajes 2'),
('#FFD700', 'Sala de masajes relajantes C', 1, 'Sala de Masajes 3'),
('#C0C0C0', 'Piscina climatizada', 0, 'Piscina'),
('#FFD700', 'Sauna de vapor', 0, 'Sauna'),
(NULL, NULL, 0, 'Sala de Yoga'),
('#ADD8E6', 'Jacuzzi con hidromasaje', 0, 'Jacuzzi');

CREATE TABLE `promociones` (
  `id_promocion` int(11) NOT NULL PRIMARY KEY AUTO_INCREMENT,
  `descripcion` varchar(3000) DEFAULT NULL,
  `descuento` smallint(6) NOT NULL,
  `estado` bit(1) NOT NULL,
  `fecha_fin` date NOT NULL,
  `fecha_inicio` date NOT NULL,
  `tipo` enum('PORCENTUAL','EFECTIVO') NOT NULL,
  `titulo` varchar(500) NOT NULL UNIQUE,
  `url_imagen` varchar(1000) DEFAULT NULL
);

INSERT INTO promociones (descripcion, descuento, estado, fecha_fin, fecha_inicio, tipo, titulo, url_imagen) VALUES
('¡Relájate al máximo con un 20% de descuento en masajes!', 20, 1, '2024-04-30', '2024-03-01', 'PORCENTUAL', 'Descuento en Masajes', 'https://cdn.discordapp.com/attachments/1209921567627411577/1209943845392089088/01-3760347840.png?ex=65e8c304&is=65d64e04&hm=1e418c6ec0df3a9bf657d209410a5754b427eb352ff28c2e281051d0f0ede11e&'),
('Renueva tu piel con un tratamiento facial y obtén un 15% de descuento', 15, 0, '2024-04-15', '2024-03-01', 'PORCENTUAL', 'Descuento en Tratamiento Facial', NULL),
('Disfruta de un día de spa completo por $12 menos', 12, 1, '2024-04-30', '2024-02-15', 'EFECTIVO', 'Oferta Día de Spa', 'https://cdn.discordapp.com/attachments/1209921567627411577/1209943919131885698/Promocion-especial-de-los-Sabados-en-Spa-Oleo-Salud-Web-Web-3752359945.jpg?ex=65e8c315&is=65d64e15&hm=b1be726e8656c7a53895309dd15c6fca9607161b01705e70c06fdd20ae0032af&'),
('Inicia tu semana con energía: 10% de descuento en clases de yoga', 10, 0, '2024-03-31', '2024-02-01', 'PORCENTUAL', 'Descuento en Clases de Yoga', NULL),
('¡Reserva ahora y obtén un 25% de descuento en cualquier tratamiento!', 25, 0, '2024-02-15', '2024-01-01', 'PORCENTUAL', 'Descuento en Reservas', NULL);

CREATE TABLE `servicios` (
  `id_servicio` int(11) NOT NULL PRIMARY KEY AUTO_INCREMENT,
  `categoria` varchar(100) NOT NULL,
  `descripcion` varchar(2000) DEFAULT NULL,
  `duracion` smallint(6) NOT NULL,
  `estado` bit(1) NOT NULL,
  `favorito` bit(1) NOT NULL,
  `nombre` varchar(200) NOT NULL UNIQUE,
  `precio` decimal(7,2) NOT NULL,
  `url_imagen` varchar(1000) DEFAULT NULL,
  `id_promocion` int(11) DEFAULT NULL,
  FOREIGN KEY (`id_promocion`) REFERENCES `promociones` (`id_promocion`)
);

INSERT INTO servicios (categoria, descripcion, duracion, estado, favorito, nombre, precio, url_imagen, id_promocion) VALUES
('Masajes', 'Masaje relajante de cuerpo completo', 60, 1, 1, 'Masaje Relajante', 50.00, 'https://cdn.discordapp.com/attachments/1209921567627411577/1209978202445848648/th-1273790960.jpeg?ex=65e8e303&is=65d66e03&hm=f4c54eb0b3c049e42fd4cfa754a46b0810d5bd802c7c10d8fce424ee462c8fe7&', NULL),
('Belleza', 'Tratamiento facial rejuvenecedor', 90, 1, 1, 'Tratamiento Facial Rejuvenecedor', 80.00, 'https://cdn.discordapp.com/attachments/1209921567627411577/1209978382788333598/th-3374802766.jpeg?ex=65e8e32e&is=65d66e2e&hm=f934e7db9f3a0277fafd5e0cf88315c20200c3043007e2b3b84f2485e493b1ab&', 2),
('Yoga', 'Clase de yoga para principiantes', 60, 1, 0, 'Clase de Yoga para Principiantes', 20.00, 'https://cdn.discordapp.com/attachments/1209921567627411577/1209978611751460914/th-3349817314.jpeg?ex=65e8e365&is=65d66e65&hm=93d54d915a5b0ec835b0bd27d763fb0c7b13ac75c9d22a59f06aeb29c244b718&', 3),
('Belleza', 'Pedicura spa con masaje de pies', 45, 0, 0, 'Pedicura Spa con Masaje', 35.00, NULL, NULL),
('Masajes', NULL, 30, 0, 0, 'Sesión de Aromaterapia', 40.00, NULL, 1),
('Masajes', 'Masaje terapéutico para aliviar dolores musculares', 75, 0, 0, 'Masaje Terapéutico', 60.00, NULL, 5);

CREATE TABLE `reservas` (
  `id_reserva` int(11) NOT NULL PRIMARY KEY AUTO_INCREMENT,
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
  `id_servicio` int(11) NOT NULL,
  FOREIGN KEY (`id_empleado`) REFERENCES `empleados`(`id_empleado`),
  FOREIGN KEY (`id_instalacion`) REFERENCES `instalaciones`(`id_instalacion`),
  FOREIGN KEY (`id_promocion`) REFERENCES `promociones`(`id_promocion`),
  FOREIGN KEY (`id_servicio`) REFERENCES `servicios`(`id_servicio`)
);

INSERT INTO reservas (apellidos_cliente, correo_cliente, estado, fecha, hora, hora_fin, nombres_cliente, telefono_cliente, id_empleado, id_instalacion, id_servicio) VALUES
('López', 'lopez@example.com', 'CANCELADO', '2024-01-01', '10:00:00', '11:00:00', 'María', '1234567890', 1, 2, 1),
('González', 'gonzalez@example.com', 'IMPAGO', '2024-01-02', '11:00:00', '12:30:00', 'Juan', '9876543210', 2, 3, 4),
('Martínez', 'martinez@example.com', 'REPROGRAMADO', '2024-01-03', '14:00:00', '15:00:00', 'Ana', '5555555555', 3, 1, 2),
('Pérez', 'perez@example.com', 'PAGADO', '2024-01-04', '10:30:00', '12:00:00', 'Carlos', '9999999999', 4, 4, 3),
('Gómez', 'gomez@example.com', 'PAGADO', '2024-01-05', '16:00:00', '17:00:00', 'Laura', '7777777777', 5, 5, 5),
('Díaz', 'diaz@example.com', 'PAGADO', '2024-02-06', '15:00:00', '16:30:00', 'Sofía', '1111111111', 1, 3, 1),
('Sánchez', 'sanchez@example.com', 'PAGADO', '2024-02-07', '13:00:00', '14:00:00', 'Diego', '2222222222', 2, 2, 2),
('Romero', 'romero@example.com', 'PAGADO', '2024-02-08', '12:00:00', '13:00:00', 'Elena', '3333333333', 3, 1, 3),
('Hernández', 'hernandez@example.com', 'PAGADO', '2024-02-09', '09:45:00', '10:30:00', 'Pablo', '4444444444', 4, 4, 4),
('Suárez', 'suarez@example.com', 'PAGADO', '2024-02-10', '17:30:00', '18:30:00', 'Alicia', '5555555555', 5, 5, 5),
('Torres', 'torres@example.com', 'PAGADO', '2024-02-21', '11:30:00', '13:00:00', 'Javier', '6666666666', 1, 3, 1),
('Dominguez', 'dominguez@example.com', 'PAGADO', '2024-02-21', '14:00:00', '15:30:00', 'Marina', '7777777777', 2, 2, 2),
('Ramírez', 'ramirez@example.com', 'PAGADO', '2024-02-21', '10:00:00', '11:00:00', 'Pedro', '8888888888', 3, 1, 3),
('Reyes', 'reyes@example.com', 'PAGADO', '2024-02-22', '16:30:00', '18:00:00', 'Laura', '9999999999', 4, 4, 4),
('Álvarez', 'alvarez@example.com', 'PAGADO', '2024-02-23', '15:00:00', '16:00:00', 'Jorge', '1111111111', 5, 5, 5),
('Vargas', 'vargas@example.com', 'PAGADO', '2024-02-24', '12:30:00', '14:00:00', 'Andrea', '2222222222', 1, 3, 1),
('Guerrero', 'guerrero@example.com', 'PAGADO', '2024-02-25', '09:45:00', '10:30:00', 'Marta', '3333333333', 2, 2, 2),
('Montero', 'montero@example.com', 'REPROGRAMADO', '2024-02-26', '14:00:00', '15:30:00', 'Daniel', '4444444444', 3, 1, 3),
('Castillo', 'castillo@example.com', 'IMPAGO', '2024-02-23', '11:30:00', '13:00:00', 'Sara', '5555555555', 4, 4, 4),
('Ortega', 'ortega@example.com', 'CANCELADO', '2024-02-24', '16:00:00', '17:00:00', 'Roberto', '6666666666', 5, 5, 5);

CREATE TABLE `perfiles` (
  `id_perfil`int(11) NOT NULL PRIMARY KEY AUTO_INCREMENT,
  `usuario` enum('USER','ADMIN') NOT NULL,
  `contrasena` varchar(255) NOT NULL //MEDIR TAMAÑO
);
