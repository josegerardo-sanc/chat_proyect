-- phpMyAdmin SQL Dump
-- version 4.7.4
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 21-11-2019 a las 16:23:28
-- Versión del servidor: 10.1.26-MariaDB
-- Versión de PHP: 7.1.9

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `chat`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `anonimo`
--

CREATE TABLE `anonimo` (
  `id_anonimo` int(11) NOT NULL,
  `status` int(1) NOT NULL,
  `id_user` int(11) NOT NULL,
  `nombre` varchar(50) COLLATE utf8mb4_bin NOT NULL,
  `apellido_p` varchar(30) COLLATE utf8mb4_bin NOT NULL,
  `apellido_m` varchar(30) COLLATE utf8mb4_bin NOT NULL,
  `correo` varchar(100) COLLATE utf8mb4_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

--
-- Volcado de datos para la tabla `anonimo`
--

INSERT INTO `anonimo` (`id_anonimo`, `status`, `id_user`, `nombre`, `apellido_p`, `apellido_m`, `correo`) VALUES
(2, 1, 6, 'jose', 'jose', 'jose', 'sanchezalvaradojose0@gmail.com'),
(3, 2, 1, 'jose j', 'jose', 'jose', 'jose@gmail.com'),
(4, 2, 1, 'miguelon', 'sanch', 'sanch', 'miguelAngel@gmail.com'),
(5, 2, 6, 'incognitp', 'sancH', 'SANCH', 'incognito@gmail.com'),
(6, 2, 1, 'PRUEBA', 'PRUEBA', 'PREB', 'PRUEBA@GMAIL.COM'),
(7, 2, 1, 'nuevo', 'sanch', 'sanc', 'nuevo@gmail.com'),
(8, 2, 1, 'cristian', 'sanch', 'sanch', 'crisian@gmail.com'),
(9, 2, 1, 'funciono', 'sanch', 'sanch', 'funciono2@gmail.com'),
(10, 2, 1, 'carlos', 'carlitos', 'carlotes', 'mimi@gmail.com'),
(11, 2, 1, 'jose gerardo', 'sanchez', 'alvarado', 'sanchezalvaradojose0@gmail.com'),
(12, 2, 1, 'jose gerardo', 'sanchez', 'alvarado', 'sanchezalvaradojose0@gmail.com'),
(13, 2, 1, 'miguel', 'garcia', 'cortez', 'sanchezalvaradojose0@gmail.com'),
(14, 2, 1, 'luis', 'perez', 'asencio', 'luis@gmail.com'),
(15, 0, 0, 'jose', 'sanch', 'sanch', 'sanchezalvaradojose0@gmail.com'),
(16, 0, 0, 'geremias', 'geremias', 'geremias', 'geremias@gmail.com');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `chat_message`
--

CREATE TABLE `chat_message` (
  `chat_message_id` int(11) NOT NULL,
  `to_user_id` int(11) NOT NULL,
  `from_user_id` int(11) NOT NULL,
  `chat_message` text COLLATE utf8mb4_bin NOT NULL,
  `timestamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `status` int(1) NOT NULL,
  `type_conversacion` int(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

--
-- Volcado de datos para la tabla `chat_message`
--

INSERT INTO `chat_message` (`chat_message_id`, `to_user_id`, `from_user_id`, `chat_message`, `timestamp`, `status`, `type_conversacion`) VALUES
(6, 13, 1, 'hola como estas?', '2019-11-21 09:05:07', 1, 2),
(7, 13, 1, 'hola como esta shee!!', '2019-11-21 09:42:15', 1, 2),
(8, 1, 13, 'que onda como estas we', '2019-11-21 10:02:05', 1, 2),
(9, 13, 1, 'que onda miguel cual es tu problema?', '2019-11-21 10:02:24', 1, 2),
(10, 1, 13, 'gracias seria todo!!', '2019-11-21 10:03:17', 1, 2),
(11, 12, 1, 'que onda como estamos we', '2019-11-21 10:08:22', 0, 2),
(12, 14, 1, 'hola luis bienvenido a empresa bars!\nen que puedo ayudarte?!', '2019-11-21 10:09:13', 1, 2),
(13, 14, 1, '😁', '2019-11-21 10:09:21', 1, 2),
(14, 1, 14, 'hola gerardo necesiot su ayuda', '2019-11-21 10:09:36', 1, 2),
(15, 3, 1, 'hola mary como estamos?', '2019-11-21 10:12:55', 1, 0),
(16, 2, 1, 'que onda a todos como estamos???', '2019-11-21 10:13:36', 0, 1),
(17, 2, 1, 'reportence!!', '2019-11-21 10:13:43', 0, 1),
(18, 2, 3, 'que onda nuevo grupo?!', '2019-11-21 10:16:14', 0, 1),
(19, 1, 3, 'que onda gerardo  y eso q creaste un grupo?', '2019-11-21 10:16:35', 1, 0),
(20, 1, 3, '?????', '2019-11-21 10:16:43', 1, 0);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `datospersonales`
--

CREATE TABLE `datospersonales` (
  `id_datos_personal` int(11) NOT NULL,
  `nombre` varchar(30) COLLATE utf8mb4_bin NOT NULL,
  `ap_paterno` varchar(30) COLLATE utf8mb4_bin NOT NULL,
  `ap_materno` varchar(30) COLLATE utf8mb4_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

--
-- Volcado de datos para la tabla `datospersonales`
--

INSERT INTO `datospersonales` (`id_datos_personal`, `nombre`, `ap_paterno`, `ap_materno`) VALUES
(1, 'jose gerardo ', 'sanchez', 'alvarado'),
(2, 'miguel lopez', 'sanchez', 'alvarado'),
(3, 'luis angel', 'hernandez', 'alvarado'),
(4, 'eliud', 'gonzeles', 'alvarado'),
(5, 'wiliam jesus ', 'perez', 'ortiz'),
(6, 'maria del carmen', 'zamudio', 'herrera');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `is_writing`
--

CREATE TABLE `is_writing` (
  `id_writing` int(11) NOT NULL,
  `from_user_id` int(11) NOT NULL,
  `to_user_id` int(11) NOT NULL,
  `is_type` enum('no','yes') COLLATE utf8mb4_bin NOT NULL,
  `type_conversacion` int(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

--
-- Volcado de datos para la tabla `is_writing`
--

INSERT INTO `is_writing` (`id_writing`, `from_user_id`, `to_user_id`, `is_type`, `type_conversacion`) VALUES
(2, 1, 13, 'no', 2),
(3, 1, 3, 'no', 0),
(4, 13, 1, 'no', 0),
(5, 1, 13, 'no', 2),
(6, 1, 13, 'no', 2),
(7, 1, 12, 'no', 2),
(8, 1, 14, 'no', 2),
(9, 1, 3, 'no', 0),
(10, 3, 1, 'no', 0);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `login`
--

CREATE TABLE `login` (
  `id` int(10) NOT NULL,
  `id_datos_personal` int(11) NOT NULL,
  `usuario` varchar(50) COLLATE utf8_bin NOT NULL,
  `pass` varchar(50) COLLATE utf8_bin NOT NULL,
  `type_user` int(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Volcado de datos para la tabla `login`
--

INSERT INTO `login` (`id`, `id_datos_personal`, `usuario`, `pass`, `type_user`) VALUES
(1, 1, 'gerardo@gmail.com', '12345', 1),
(3, 6, 'maria@gmail.com', '12345', 3),
(4, 5, 'wiliam@gmail.com', '12345', 3),
(6, 2, 'miguel@gmail.com', '12345', 2);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `login_details`
--

CREATE TABLE `login_details` (
  `login_details_id` int(11) NOT NULL,
  `user_id` int(10) NOT NULL,
  `last_activity` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `type_user` int(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `login_details`
--

INSERT INTO `login_details` (`login_details_id`, `user_id`, `last_activity`, `type_user`) VALUES
(1, 13, '2019-11-21 10:03:44', 2),
(2, 1, '2019-11-21 08:36:06', 0),
(3, 1, '2019-11-21 08:53:31', 0),
(4, 1, '2019-11-21 15:23:20', 0),
(5, 14, '2019-11-21 10:11:47', 2),
(6, 15, '2019-11-21 10:21:02', 2),
(7, 16, '2019-11-21 10:15:38', 2),
(8, 3, '2019-11-21 10:17:07', 0);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `newgrupo`
--

CREATE TABLE `newgrupo` (
  `id_grupo` int(11) NOT NULL,
  `nombregrupo` varchar(50) COLLATE utf8mb4_bin NOT NULL,
  `id_user` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

--
-- Volcado de datos para la tabla `newgrupo`
--

INSERT INTO `newgrupo` (`id_grupo`, `nombregrupo`, `id_user`) VALUES
(1, 'Esperezansa', 1),
(2, 'Nuevo Grupo', 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `participantes`
--

CREATE TABLE `participantes` (
  `id_participantes` int(11) NOT NULL,
  `id_user` int(11) NOT NULL,
  `id_grupo` int(11) NOT NULL,
  `status` int(1) NOT NULL,
  `count_msj` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

--
-- Volcado de datos para la tabla `participantes`
--

INSERT INTO `participantes` (`id_participantes`, `id_user`, `id_grupo`, `status`, `count_msj`) VALUES
(1, 3, 1, 0, 0),
(2, 6, 1, 0, 0),
(3, 4, 1, 0, 0),
(4, 1, 1, 1, 0),
(5, 3, 2, 1, 2),
(6, 6, 2, 0, 0),
(7, 4, 2, 0, 0),
(8, 1, 2, 1, 1);

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `anonimo`
--
ALTER TABLE `anonimo`
  ADD PRIMARY KEY (`id_anonimo`),
  ADD KEY `idx_id_user` (`id_user`);

--
-- Indices de la tabla `chat_message`
--
ALTER TABLE `chat_message`
  ADD PRIMARY KEY (`chat_message_id`),
  ADD KEY `idx_from_user_id` (`from_user_id`),
  ADD KEY `idx_to_user_id` (`to_user_id`),
  ADD KEY `idx_status` (`status`);

--
-- Indices de la tabla `datospersonales`
--
ALTER TABLE `datospersonales`
  ADD PRIMARY KEY (`id_datos_personal`),
  ADD KEY `idx_id_datos_personal` (`id_datos_personal`);

--
-- Indices de la tabla `is_writing`
--
ALTER TABLE `is_writing`
  ADD PRIMARY KEY (`id_writing`),
  ADD KEY `idx_from_user_id` (`from_user_id`),
  ADD KEY `idx_to_user_id` (`to_user_id`),
  ADD KEY `idx_is_type` (`is_type`);

--
-- Indices de la tabla `login`
--
ALTER TABLE `login`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx_usuario` (`usuario`);

--
-- Indices de la tabla `login_details`
--
ALTER TABLE `login_details`
  ADD PRIMARY KEY (`login_details_id`),
  ADD KEY `idx_login_details_id` (`login_details_id`),
  ADD KEY `idx_type_user` (`type_user`);

--
-- Indices de la tabla `newgrupo`
--
ALTER TABLE `newgrupo`
  ADD PRIMARY KEY (`id_grupo`),
  ADD KEY `idx_id_grupo` (`id_grupo`);

--
-- Indices de la tabla `participantes`
--
ALTER TABLE `participantes`
  ADD PRIMARY KEY (`id_participantes`),
  ADD KEY `idx_id_user` (`id_user`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `anonimo`
--
ALTER TABLE `anonimo`
  MODIFY `id_anonimo` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT de la tabla `chat_message`
--
ALTER TABLE `chat_message`
  MODIFY `chat_message_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT de la tabla `datospersonales`
--
ALTER TABLE `datospersonales`
  MODIFY `id_datos_personal` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT de la tabla `is_writing`
--
ALTER TABLE `is_writing`
  MODIFY `id_writing` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT de la tabla `login`
--
ALTER TABLE `login`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT de la tabla `login_details`
--
ALTER TABLE `login_details`
  MODIFY `login_details_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT de la tabla `newgrupo`
--
ALTER TABLE `newgrupo`
  MODIFY `id_grupo` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `participantes`
--
ALTER TABLE `participantes`
  MODIFY `id_participantes` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
