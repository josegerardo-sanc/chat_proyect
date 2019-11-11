-- phpMyAdmin SQL Dump
-- version 4.7.4
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 11-11-2019 a las 16:24:44
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
-- Estructura de tabla para la tabla `chat_message`
--

CREATE TABLE `chat_message` (
  `chat_message_id` int(11) NOT NULL,
  `to_user_id` int(11) NOT NULL,
  `from_user_id` int(11) NOT NULL,
  `chat_message` text COLLATE utf8mb4_bin NOT NULL,
  `timestamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `status` int(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

--
-- Volcado de datos para la tabla `chat_message`
--

INSERT INTO `chat_message` (`chat_message_id`, `to_user_id`, `from_user_id`, `chat_message`, `timestamp`, `status`) VALUES
(1, 1, 6, 'que onda', '2019-11-09 07:04:18', 0),
(2, 1, 6, 'que onda we', '2019-11-09 07:07:00', 0),
(3, 4, 6, 'euu', '2019-11-09 07:07:21', 0),
(4, 6, 1, 'we', '2019-11-09 07:07:40', 0),
(5, 6, 1, 'que onda', '2019-11-09 07:37:19', 0),
(6, 6, 1, 'we', '2019-11-09 07:55:08', 0),
(7, 6, 1, 'we', '2019-11-09 07:55:15', 0),
(8, 6, 1, '23', '2019-11-09 07:55:23', 0),
(9, 6, 1, 'addasd', '2019-11-09 07:55:34', 0),
(10, 6, 1, 'dadadsd', '2019-11-09 07:55:37', 0),
(11, 6, 1, 'sdsadasdas', '2019-11-09 07:55:42', 0),
(12, 6, 1, 'sdasdasd', '2019-11-09 07:55:50', 0),
(13, 6, 1, 'we como estamos', '2019-11-09 07:56:35', 0),
(14, 6, 1, 'we que onda que haces', '2019-11-09 08:25:37', 0),
(15, 1, 6, 'we', '2019-11-09 08:27:28', 0),
(16, 1, 6, 'we', '2019-11-09 08:32:09', 0),
(17, 1, 6, 'que haces', '2019-11-09 08:32:32', 0),
(18, 1, 6, 'que vamos hacer en la noche', '2019-11-09 08:32:58', 0),
(19, 1, 6, 'we contesta parecer que ya salieron los mensajes', '2019-11-09 08:33:16', 0),
(20, 1, 6, 'pp', '2019-11-09 08:34:51', 0),
(21, 1, 6, 'wee que pex', '2019-11-09 08:35:28', 0),
(22, 6, 1, 'que onda we', '2019-11-10 04:40:05', 0),
(23, 6, 1, 'que pex que vamos hacer en la noches we', '2019-11-10 04:40:35', 0),
(24, 6, 1, 'que onda', '2019-11-10 04:43:32', 0),
(25, 6, 1, 'que onda', '2019-11-10 04:46:18', 0),
(26, 6, 1, 'we', '2019-11-10 04:53:04', 0),
(27, 6, 3, 'hola miguel como estas', '2019-11-10 04:54:45', 0),
(28, 6, 3, 'eee', '2019-11-10 04:55:44', 0),
(29, 6, 3, 'we', '2019-11-10 04:59:14', 0),
(30, 6, 3, 'como esyas', '2019-11-10 04:59:33', 0),
(31, 6, 3, 'que ond auqe haces', '2019-11-10 04:59:44', 0),
(32, 6, 3, 'como estamos w', '2019-11-10 04:59:53', 0),
(33, 1, 6, 'weee', '2019-11-10 05:08:18', 0),
(34, 6, 1, 'conectate', '2019-11-10 05:08:50', 0),
(35, 1, 6, 'eja', '2019-11-10 05:09:05', 0),
(36, 6, 1, 'eja', '2019-11-10 05:09:14', 0),
(37, 4, 6, 'kkkkkk', '2019-11-10 09:01:20', 0),
(38, 4, 3, 'que onda we', '2019-11-10 09:20:13', 0),
(39, 3, 4, 'hola', '2019-11-10 09:21:36', 0),
(40, 3, 6, 'wuera', '2019-11-10 09:23:09', 0),
(41, 6, 1, 'hola', '2019-11-11 01:39:25', 0),
(42, 1, 6, 'euu', '2019-11-11 01:43:00', 0),
(43, 6, 1, 'hola como estamos we', '2019-11-11 01:44:06', 0),
(44, 6, 1, 'weee', '2019-11-11 01:44:18', 0),
(45, 1, 6, 'qmfmfmdfmdmff', '2019-11-11 01:45:38', 0),
(46, 6, 1, 'que pedos we que vamos hacer en la noche?', '2019-11-11 01:47:33', 0),
(47, 1, 6, 'que onda dime que paso', '2019-11-11 01:48:12', 0),
(48, 6, 1, 'hola como estamos', '2019-11-11 02:41:51', 0),
(49, 1, 6, 'que onda que nadas haceno we', '2019-11-11 02:42:57', 0),
(50, 6, 1, 'nada todo tranquilo y tu qie onda', '2019-11-11 02:43:12', 0),
(51, 6, 1, 'que pedos que vamos hacer', '2019-11-11 02:43:33', 0),
(52, 1, 6, 'euu we', '2019-11-11 02:43:52', 0),
(53, 1, 6, 'que vamos hacer con la tarea??', '2019-11-11 02:44:02', 0),
(54, 1, 6, 'hay que checarlo pero yaaa', '2019-11-11 02:44:12', 0),
(55, 6, 1, 'simon we  tu tranquis montes', '2019-11-11 02:44:31', 0),
(56, 1, 6, 'que  onda', '2019-11-11 02:48:00', 0),
(57, 1, 6, 'que onda', '2019-11-11 02:48:55', 0),
(58, 6, 1, 'QUE ONDA', '2019-11-11 02:57:45', 0),
(59, 1, 6, 'QUE ONDA WE COMO ESTAMOS HEE??', '2019-11-11 02:58:01', 0),
(60, 1, 6, 'WE ESTOY PROBANDO TU CONEXON', '2019-11-11 03:05:41', 0),
(61, 1, 6, 'que odna vamps a seguir aqui?', '2019-11-11 03:07:06', 0),
(62, 6, 1, 'que onda we ?', '2019-11-11 03:07:27', 0),
(63, 1, 6, 'wuuuuuu', '2019-11-11 03:08:35', 0),
(64, 6, 1, 'que ond😣a we', '2019-11-11 03:09:01', 0),
(65, 6, 1, 'que ond aperro sigo probando y esta genial', '2019-11-11 03:09:25', 0),
(66, 6, 1, 'que onda', '2019-11-11 03:12:13', 0),
(67, 1, 6, 'que onda', '2019-11-11 03:15:27', 0),
(68, 1, 6, 'que onda we como estamos', '2019-11-11 03:24:05', 0),
(69, 6, 1, 'que onda we', '2019-11-11 03:25:04', 0),
(70, 1, 6, 'que onda we que paso?', '2019-11-11 03:25:19', 0),
(71, 6, 1, 'no nada todo tranquilo por aca we!!!!', '2019-11-11 03:25:38', 0),
(72, 1, 6, 'que bueno la verdad!!!', '2019-11-11 03:25:50', 0),
(73, 6, 1, 'lo sssdndd🤣', '2019-11-11 03:26:02', 0),
(74, 1, 3, 'que onda como estamos we', '2019-11-11 03:42:27', 0),
(75, 6, 3, 'que pedos we', '2019-11-11 03:42:42', 0),
(76, 1, 3, 'que onda compa que vamos hacer??', '2019-11-11 03:43:18', 0),
(77, 6, 1, 'eja carnal', '2019-11-11 03:43:34', 0),
(78, 3, 1, 'que onda xamudio', '2019-11-11 03:44:00', 0),
(79, 1, 3, 'we que vamos  para la posada??', '2019-11-11 03:44:19', 0),
(80, 6, 3, 'we que onda como estamos', '2019-11-11 05:28:17', 0),
(81, 6, 3, '????????', '2019-11-11 05:28:21', 0),
(82, 6, 3, 'que ond aperro responde', '2019-11-11 05:28:27', 0),
(83, 6, 3, 'eja we', '2019-11-11 05:28:31', 0),
(84, 6, 3, 'vas arespoder??', '2019-11-11 05:28:38', 0),
(85, 6, 3, 'eja we', '2019-11-11 05:29:05', 0),
(86, 6, 3, '☺', '2019-11-11 05:29:14', 0),
(87, 6, 3, 'que onda we como estamos !!!!', '2019-11-11 05:39:12', 0),
(88, 6, 1, 'n,n,n', '2019-11-11 06:23:58', 0),
(89, 1, 6, 'que onda we como has estadp', '2019-11-11 06:36:38', 0),
(90, 6, 1, 'que onda como has estado we\nbien y tu que onfa donde estas???', '2019-11-11 06:37:30', 0),
(91, 6, 4, 'hola como estas', '2019-11-11 06:47:41', 0),
(92, 6, 4, 'ollesyes', '2019-11-11 06:49:42', 0),
(93, 4, 3, 'olles jos eque vamo hacer mañana?', '2019-11-11 06:50:23', 0),
(94, 4, 6, 'hola como estamos', '2019-11-11 06:58:44', 1),
(95, 4, 6, 'olis', '2019-11-11 07:03:06', 1),
(96, 3, 1, 'que onda we', '2019-11-11 15:07:56', 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `is_writing`
--

CREATE TABLE `is_writing` (
  `id_writing` int(11) NOT NULL,
  `from_user_id` int(11) NOT NULL,
  `to_user_id` int(11) NOT NULL,
  `is_type` enum('no','yes') COLLATE utf8mb4_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

--
-- Volcado de datos para la tabla `is_writing`
--

INSERT INTO `is_writing` (`id_writing`, `from_user_id`, `to_user_id`, `is_type`) VALUES
(3, 6, 4, 'no'),
(4, 6, 1, 'yes'),
(5, 6, 3, 'no'),
(6, 6, 1, 'yes'),
(7, 4, 6, 'no'),
(8, 6, 4, 'no'),
(9, 4, 6, 'no'),
(10, 3, 4, 'no'),
(11, 4, 3, 'no'),
(12, 3, 6, 'no'),
(13, 6, 3, 'no'),
(14, 6, 1, 'no'),
(15, 1, 6, 'no'),
(16, 1, 4, 'yes'),
(17, 6, 1, 'no'),
(18, 6, 1, 'no'),
(19, 6, 1, 'no'),
(20, 3, 1, 'no'),
(21, 3, 6, 'no'),
(22, 1, 6, 'no'),
(23, 1, 3, 'no'),
(24, 6, 1, 'no'),
(25, 3, 6, 'no'),
(26, 6, 4, 'no'),
(27, 1, 3, 'no'),
(28, 6, 1, 'no'),
(29, 3, 6, 'yes'),
(30, 6, 3, 'yes'),
(31, 4, 6, 'no'),
(32, 4, 3, 'no'),
(33, 3, 4, 'no'),
(34, 6, 4, 'no'),
(35, 1, 3, 'no'),
(36, 3, 1, 'no'),
(37, 1, 6, 'yes');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `login`
--

CREATE TABLE `login` (
  `id` int(10) NOT NULL,
  `usuario` varchar(50) COLLATE utf8_bin NOT NULL,
  `pass` varchar(50) COLLATE utf8_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Volcado de datos para la tabla `login`
--

INSERT INTO `login` (`id`, `usuario`, `pass`) VALUES
(1, 'gerardo', '12345'),
(3, 'maria', '12345'),
(4, 'wuliams', '12345'),
(6, 'maguel', '12345');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `login_details`
--

CREATE TABLE `login_details` (
  `login_details_id` int(11) NOT NULL,
  `user_id` int(10) NOT NULL,
  `last_activity` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `is_type` enum('no','yes') NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `login_details`
--

INSERT INTO `login_details` (`login_details_id`, `user_id`, `last_activity`, `is_type`) VALUES
(1, 6, '2019-11-09 06:49:33', 'no'),
(2, 1, '2019-11-09 06:31:00', 'no'),
(3, 1, '2019-11-09 07:58:33', 'no'),
(4, 6, '2019-11-09 07:58:25', 'no'),
(5, 1, '2019-11-09 08:49:02', 'no'),
(6, 6, '2019-11-09 08:49:08', 'no'),
(7, 1, '2019-11-10 03:29:00', 'no'),
(8, 6, '2019-11-10 03:28:56', 'no'),
(9, 6, '2019-11-10 04:36:59', 'no'),
(10, 6, '2019-11-10 04:45:42', 'no'),
(11, 1, '2019-11-10 04:45:33', 'no'),
(12, 6, '2019-11-10 05:03:55', 'no'),
(13, 1, '2019-11-10 04:54:10', 'no'),
(14, 3, '2019-11-10 05:00:00', 'no'),
(15, 6, '2019-11-10 05:08:24', 'no'),
(16, 1, '2019-11-10 05:53:10', 'no'),
(17, 6, '2019-11-10 05:53:02', 'no'),
(18, 4, '2019-11-10 08:58:29', 'no'),
(19, 6, '2019-11-10 09:19:25', 'no'),
(20, 1, '2019-11-10 06:23:10', 'yes'),
(21, 6, '2019-11-10 06:23:35', 'no'),
(22, 6, '2019-11-10 07:29:42', 'no'),
(23, 6, '2019-11-10 07:31:15', 'no'),
(24, 6, '2019-11-10 07:37:48', 'no'),
(25, 6, '2019-11-10 07:46:08', 'no'),
(26, 6, '2019-11-10 08:24:45', 'no'),
(27, 6, '2019-11-10 09:24:01', 'no'),
(28, 4, '2019-11-10 09:12:50', 'no'),
(29, 4, '2019-11-10 09:23:54', 'no'),
(30, 3, '2019-11-10 09:19:42', 'no'),
(31, 3, '2019-11-10 09:23:53', 'no'),
(32, 1, '2019-11-10 20:01:40', 'no'),
(33, 1, '2019-11-11 00:50:34', 'no'),
(34, 6, '2019-11-11 00:58:42', 'no'),
(35, 6, '2019-11-11 00:57:37', 'no'),
(36, 1, '2019-11-11 03:26:08', 'no'),
(37, 6, '2019-11-11 02:49:07', 'no'),
(38, 6, '2019-11-11 02:58:16', 'no'),
(39, 6, '2019-11-11 03:05:45', 'no'),
(40, 6, '2019-11-11 03:54:35', 'no'),
(41, 1, '2019-11-11 03:45:22', 'no'),
(42, 3, '2019-11-11 03:44:57', 'no'),
(43, 6, '2019-11-11 05:22:12', 'no'),
(44, 6, '2019-11-11 06:36:07', 'no'),
(45, 3, '2019-11-11 05:54:07', 'no'),
(46, 1, '2019-11-11 06:43:08', 'no'),
(47, 6, '2019-11-11 07:37:26', 'no'),
(48, 3, '2019-11-11 06:52:26', 'no'),
(49, 4, '2019-11-11 06:51:48', 'no'),
(50, 1, '2019-11-11 08:03:29', 'no'),
(51, 1, '2019-11-11 15:24:07', 'no'),
(52, 3, '2019-11-11 15:08:12', 'no');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `chat_message`
--
ALTER TABLE `chat_message`
  ADD PRIMARY KEY (`chat_message_id`);

--
-- Indices de la tabla `is_writing`
--
ALTER TABLE `is_writing`
  ADD PRIMARY KEY (`id_writing`);

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
  ADD PRIMARY KEY (`login_details_id`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `chat_message`
--
ALTER TABLE `chat_message`
  MODIFY `chat_message_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=97;

--
-- AUTO_INCREMENT de la tabla `is_writing`
--
ALTER TABLE `is_writing`
  MODIFY `id_writing` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=38;

--
-- AUTO_INCREMENT de la tabla `login`
--
ALTER TABLE `login`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT de la tabla `login_details`
--
ALTER TABLE `login_details`
  MODIFY `login_details_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=53;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
