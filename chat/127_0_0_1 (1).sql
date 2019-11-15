-- phpMyAdmin SQL Dump
-- version 4.7.4
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 15-11-2019 a las 06:47:10
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
-- Base de datos: `caja_ahorro`
--
CREATE DATABASE IF NOT EXISTS `caja_ahorro` DEFAULT CHARACTER SET latin1 COLLATE latin1_swedish_ci;
USE `caja_ahorro`;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `operaciones`
--

CREATE TABLE `operaciones` (
  `Id_Operacion` int(10) NOT NULL,
  `Id_Socio` varchar(20) NOT NULL,
  `Id_Personal` varchar(20) NOT NULL,
  `Abono` int(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `operaciones`
--

INSERT INTO `operaciones` (`Id_Operacion`, `Id_Socio`, `Id_Personal`, `Abono`) VALUES
(2, 'HEAB870918123', '1', 1000),
(3, 'BECC980718', '1', 8000),
(4, 'PEMG980912', '1', 10000),
(5, 'GAPY981005', '1', 6000);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `personal`
--

CREATE TABLE `personal` (
  `Id_Personal` int(10) NOT NULL,
  `Nombre_Personal` varchar(20) NOT NULL,
  `A_Paterno` varchar(10) NOT NULL,
  `A_Materno` varchar(10) NOT NULL,
  `RFC` varchar(20) NOT NULL,
  `Curp` varchar(20) NOT NULL,
  `Edad` int(5) NOT NULL,
  `Direccion` varchar(20) NOT NULL,
  `Correo` varchar(15) NOT NULL,
  `Clave` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `personal`
--

INSERT INTO `personal` (`Id_Personal`, `Nombre_Personal`, `A_Paterno`, `A_Materno`, `RFC`, `Curp`, `Edad`, `Direccion`, `Correo`, `Clave`) VALUES
(1, 'Maria Del Carmen', 'Zamudio', 'Herrera', 'ZAAH960926123', 'ZAAH960926HTCNLR07', 23, 'Esquipulas', 'chela@gmail.com', '79bd9632c137838bb39984fa402c6505'),
(3, 'Zuleyma', 'Cotazar', 'Acopa', 'ZUUC930123HTCNL345', 'ZUUC930123HTCNLR07', 34, 'Esquipulas Calle San', 'chela_@gmail.co', '23cd0c40aba8de7489a8fdceac39140c');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `prestamos`
--

CREATE TABLE `prestamos` (
  `Id_Prestamos` int(10) NOT NULL,
  `Id_Socio` varchar(20) NOT NULL,
  `M_prestamo` varchar(10) NOT NULL,
  `Tasa` double NOT NULL,
  `M_total` double(10,2) NOT NULL,
  `M_pago` double(10,2) NOT NULL,
  `Saldo` double(10,2) NOT NULL,
  `Fecha` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `prestamos`
--

INSERT INTO `prestamos` (`Id_Prestamos`, `Id_Socio`, `M_prestamo`, `Tasa`, `M_total`, `M_pago`, `Saldo`, `Fecha`) VALUES
(3, 'HEAB870918123', '10000', 0.08, 10830.00, 902.50, 0.00, '2019-07-23'),
(4, 'PEMG980912', '10000', 0.08, 10830.00, 902.50, 4830.00, '2019-07-25'),
(5, 'BECC980718', '700', 0.08, 758.10, 63.17, 100.00, '2019-07-18'),
(6, 'GAPY981005', '900', 0.08, 974.70, 81.22, 0.00, '2019-07-21');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `socio`
--

CREATE TABLE `socio` (
  `Id_Socio` int(10) NOT NULL,
  `RFC` varchar(20) NOT NULL,
  `Nombre` varchar(20) NOT NULL,
  `Apellido_Paterno` varchar(15) NOT NULL,
  `Apellido_Materno` varchar(15) NOT NULL,
  `Curp` varchar(20) NOT NULL,
  `Edad` int(5) NOT NULL,
  `Telefono` int(15) NOT NULL,
  `Direccion` varchar(20) NOT NULL,
  `Ahorro_Actual` double(20,2) NOT NULL,
  `Id_Personal` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `socio`
--

INSERT INTO `socio` (`Id_Socio`, `RFC`, `Nombre`, `Apellido_Paterno`, `Apellido_Materno`, `Curp`, `Edad`, `Telefono`, `Direccion`, `Ahorro_Actual`, `Id_Personal`) VALUES
(1, 'HEAB870918123', 'Beatriz', 'Herrera', 'Aguilar', 'HEAB870918HTCNLR07', 23, 2147483647, 'Esquipulas Calle San', 170.00, 'ZUUC930123HTCNL345'),
(2, 'BECC980718', 'CLODOMIRO', 'BENITES', 'CANO', 'BECC980718HTC', 21, 2147483647, 'NAVA', 3341.90, 'GAPY981005'),
(3, 'PEMG980912', 'GIOVANNA', 'PEREZ', 'MAGAÑA', 'PEMG980912MTCRGV07', 20, 2147483647, 'VILLA JUAN ALDAMA', 0.00, 'ZAAH960926123'),
(4, 'GAPY981005', 'YESENIA', 'GARCIA', 'PECH', 'GAPY981005MTCRCS01', 20, 2147483647, 'ABASOLITO', 10225.30, 'ZUUC930123HTCNL345');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `operaciones`
--
ALTER TABLE `operaciones`
  ADD PRIMARY KEY (`Id_Operacion`);

--
-- Indices de la tabla `personal`
--
ALTER TABLE `personal`
  ADD PRIMARY KEY (`Id_Personal`);

--
-- Indices de la tabla `prestamos`
--
ALTER TABLE `prestamos`
  ADD PRIMARY KEY (`Id_Prestamos`);

--
-- Indices de la tabla `socio`
--
ALTER TABLE `socio`
  ADD PRIMARY KEY (`Id_Socio`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `operaciones`
--
ALTER TABLE `operaciones`
  MODIFY `Id_Operacion` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT de la tabla `personal`
--
ALTER TABLE `personal`
  MODIFY `Id_Personal` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de la tabla `prestamos`
--
ALTER TABLE `prestamos`
  MODIFY `Id_Prestamos` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT de la tabla `socio`
--
ALTER TABLE `socio`
  MODIFY `Id_Socio` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
--
-- Base de datos: `chat`
--
CREATE DATABASE IF NOT EXISTS `chat` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_bin;
USE `chat`;

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
(1, 3, 1, 'que onda maria como estas tu!!?😍', '2019-11-15 04:31:18', 0, 0),
(2, 3, 1, 'que onda mary', '2019-11-15 04:32:18', 0, 0),
(3, 1, 4, 'que onda gerardo como estas we?', '2019-11-15 04:33:31', 1, 0),
(4, 4, 3, 'que onda wiliam que haces?', '2019-11-15 04:33:51', 1, 0),
(5, 1, 1, 'soy gerardo#1', '2019-11-15 04:35:35', 0, 1),
(6, 1, 4, 'soy wiliam#1', '2019-11-15 04:36:22', 1, 1),
(7, 2, 1, 'grupo#2', '2019-11-15 04:37:26', 0, 1),
(8, 2, 1, 'gerardo#2', '2019-11-15 04:37:53', 0, 1),
(9, 3, 4, 'que onda carmen como estas!!!', '2019-11-15 04:38:42', 0, 0),
(10, 2, 4, 'que onda como estamos!', '2019-11-15 04:43:53', 0, 1),
(11, 2, 1, 'que onda we como estamos', '2019-11-15 05:25:58', 0, 1),
(12, 2, 1, 'que onda loco como estamos!!', '2019-11-15 05:26:34', 0, 1),
(13, 1, 1, 'grupo#1', '2019-11-15 05:28:10', 0, 1),
(14, 1, 1, 'grupo#1', '2019-11-15 05:28:19', 0, 1),
(15, 3, 1, 'grupo #3', '2019-11-15 05:30:46', 0, 1),
(16, 1, 4, 'que onda gerardo como estas tu we?', '2019-11-15 05:31:56', 1, 0);

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
(2, 'miguel angel', 'sanchez', 'alvarado'),
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
  `is_type` enum('no','yes') COLLATE utf8mb4_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

--
-- Volcado de datos para la tabla `is_writing`
--

INSERT INTO `is_writing` (`id_writing`, `from_user_id`, `to_user_id`, `is_type`) VALUES
(1, 1, 3, 'no'),
(2, 4, 1, 'no'),
(3, 3, 4, 'no'),
(4, 4, 3, 'no');

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
  `last_activity` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `login_details`
--

INSERT INTO `login_details` (`login_details_id`, `user_id`, `last_activity`) VALUES
(1, 1, '2019-11-15 04:32:24'),
(2, 3, '2019-11-15 05:32:24'),
(3, 4, '2019-11-15 05:32:19'),
(4, 1, '2019-11-15 05:47:09');

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
(1, 'Grupo De Supervisores Y Usuarios!!', 1),
(2, 'Grupo#2', 1),
(3, 'Grupo#3', 1);

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
(1, 3, 1, 1, 2),
(2, 4, 1, 1, 1),
(3, 1, 1, 1, 1),
(4, 3, 2, 1, 2),
(5, 4, 2, 1, 2),
(6, 6, 2, 0, 0),
(7, 1, 2, 1, 1),
(8, 4, 3, 0, 0),
(9, 3, 3, 0, 0),
(10, 6, 3, 0, 0),
(11, 1, 3, 1, 0);

--
-- Índices para tablas volcadas
--

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
  ADD KEY `idx_login_details_id` (`login_details_id`);

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
-- AUTO_INCREMENT de la tabla `chat_message`
--
ALTER TABLE `chat_message`
  MODIFY `chat_message_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT de la tabla `datospersonales`
--
ALTER TABLE `datospersonales`
  MODIFY `id_datos_personal` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT de la tabla `is_writing`
--
ALTER TABLE `is_writing`
  MODIFY `id_writing` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de la tabla `login`
--
ALTER TABLE `login`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT de la tabla `login_details`
--
ALTER TABLE `login_details`
  MODIFY `login_details_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de la tabla `newgrupo`
--
ALTER TABLE `newgrupo`
  MODIFY `id_grupo` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de la tabla `participantes`
--
ALTER TABLE `participantes`
  MODIFY `id_participantes` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;
--
-- Base de datos: `phpmyadmin`
--
CREATE DATABASE IF NOT EXISTS `phpmyadmin` DEFAULT CHARACTER SET utf8 COLLATE utf8_bin;
USE `phpmyadmin`;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pma__bookmark`
--

CREATE TABLE `pma__bookmark` (
  `id` int(11) NOT NULL,
  `dbase` varchar(255) COLLATE utf8_bin NOT NULL DEFAULT '',
  `user` varchar(255) COLLATE utf8_bin NOT NULL DEFAULT '',
  `label` varchar(255) CHARACTER SET utf8 NOT NULL DEFAULT '',
  `query` text COLLATE utf8_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Bookmarks';

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pma__central_columns`
--

CREATE TABLE `pma__central_columns` (
  `db_name` varchar(64) COLLATE utf8_bin NOT NULL,
  `col_name` varchar(64) COLLATE utf8_bin NOT NULL,
  `col_type` varchar(64) COLLATE utf8_bin NOT NULL,
  `col_length` text COLLATE utf8_bin,
  `col_collation` varchar(64) COLLATE utf8_bin NOT NULL,
  `col_isNull` tinyint(1) NOT NULL,
  `col_extra` varchar(255) COLLATE utf8_bin DEFAULT '',
  `col_default` text COLLATE utf8_bin
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Central list of columns';

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pma__column_info`
--

CREATE TABLE `pma__column_info` (
  `id` int(5) UNSIGNED NOT NULL,
  `db_name` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `table_name` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `column_name` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `comment` varchar(255) CHARACTER SET utf8 NOT NULL DEFAULT '',
  `mimetype` varchar(255) CHARACTER SET utf8 NOT NULL DEFAULT '',
  `transformation` varchar(255) COLLATE utf8_bin NOT NULL DEFAULT '',
  `transformation_options` varchar(255) COLLATE utf8_bin NOT NULL DEFAULT '',
  `input_transformation` varchar(255) COLLATE utf8_bin NOT NULL DEFAULT '',
  `input_transformation_options` varchar(255) COLLATE utf8_bin NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Column information for phpMyAdmin';

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pma__designer_settings`
--

CREATE TABLE `pma__designer_settings` (
  `username` varchar(64) COLLATE utf8_bin NOT NULL,
  `settings_data` text COLLATE utf8_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Settings related to Designer';

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pma__export_templates`
--

CREATE TABLE `pma__export_templates` (
  `id` int(5) UNSIGNED NOT NULL,
  `username` varchar(64) COLLATE utf8_bin NOT NULL,
  `export_type` varchar(10) COLLATE utf8_bin NOT NULL,
  `template_name` varchar(64) COLLATE utf8_bin NOT NULL,
  `template_data` text COLLATE utf8_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Saved export templates';

--
-- Volcado de datos para la tabla `pma__export_templates`
--

INSERT INTO `pma__export_templates` (`id`, `username`, `export_type`, `template_name`, `template_data`) VALUES
(1, 'root', 'database', 'quesosbravo', '{\"quick_or_custom\":\"quick\",\"what\":\"sql\",\"structure_or_data_forced\":\"0\",\"table_select[]\":[\"detalle_precompras\",\"detalle_ventas\",\"migrations\",\"password_resets\",\"precompras\",\"productos\",\"reabastecers\",\"users\",\"ventas\"],\"table_structure[]\":[\"detalle_precompras\",\"detalle_ventas\",\"migrations\",\"password_resets\",\"precompras\",\"productos\",\"reabastecers\",\"users\",\"ventas\"],\"table_data[]\":[\"detalle_precompras\",\"detalle_ventas\",\"migrations\",\"password_resets\",\"precompras\",\"productos\",\"reabastecers\",\"users\",\"ventas\"],\"aliases_new\":\"\",\"output_format\":\"sendit\",\"filename_template\":\"@DATABASE@\",\"remember_template\":\"on\",\"charset\":\"utf-8\",\"compression\":\"none\",\"maxsize\":\"\",\"codegen_structure_or_data\":\"data\",\"codegen_format\":\"0\",\"csv_separator\":\",\",\"csv_enclosed\":\"\\\"\",\"csv_escaped\":\"\\\"\",\"csv_terminated\":\"AUTO\",\"csv_null\":\"NULL\",\"csv_structure_or_data\":\"data\",\"excel_null\":\"NULL\",\"excel_columns\":\"something\",\"excel_edition\":\"win\",\"excel_structure_or_data\":\"data\",\"htmlword_structure_or_data\":\"structure_and_data\",\"htmlword_null\":\"NULL\",\"json_structure_or_data\":\"data\",\"latex_caption\":\"something\",\"latex_structure_or_data\":\"structure_and_data\",\"latex_structure_caption\":\"Estructura de la tabla @TABLE@\",\"latex_structure_continued_caption\":\"Estructura de la tabla @TABLE@ (continÃºa)\",\"latex_structure_label\":\"tab:@TABLE@-structure\",\"latex_relation\":\"something\",\"latex_comments\":\"something\",\"latex_mime\":\"something\",\"latex_columns\":\"something\",\"latex_data_caption\":\"Contenido de la tabla @TABLE@\",\"latex_data_continued_caption\":\"Contenido de la tabla @TABLE@ (continÃºa)\",\"latex_data_label\":\"tab:@TABLE@-data\",\"latex_null\":\"\\\\textit{NULL}\",\"mediawiki_structure_or_data\":\"structure_and_data\",\"mediawiki_caption\":\"something\",\"mediawiki_headers\":\"something\",\"ods_null\":\"NULL\",\"ods_structure_or_data\":\"data\",\"odt_structure_or_data\":\"structure_and_data\",\"odt_relation\":\"something\",\"odt_comments\":\"something\",\"odt_mime\":\"something\",\"odt_columns\":\"something\",\"odt_null\":\"NULL\",\"pdf_report_title\":\"\",\"pdf_structure_or_data\":\"structure_and_data\",\"phparray_structure_or_data\":\"data\",\"sql_include_comments\":\"something\",\"sql_header_comment\":\"\",\"sql_use_transaction\":\"something\",\"sql_compatibility\":\"NONE\",\"sql_structure_or_data\":\"structure_and_data\",\"sql_create_table\":\"something\",\"sql_auto_increment\":\"something\",\"sql_create_view\":\"something\",\"sql_procedure_function\":\"something\",\"sql_create_trigger\":\"something\",\"sql_backquotes\":\"something\",\"sql_type\":\"INSERT\",\"sql_insert_syntax\":\"both\",\"sql_max_query_size\":\"50000\",\"sql_hex_for_binary\":\"something\",\"sql_utc_time\":\"something\",\"texytext_structure_or_data\":\"structure_and_data\",\"texytext_null\":\"NULL\",\"xml_structure_or_data\":\"data\",\"xml_export_events\":\"something\",\"xml_export_functions\":\"something\",\"xml_export_procedures\":\"something\",\"xml_export_tables\":\"something\",\"xml_export_triggers\":\"something\",\"xml_export_views\":\"something\",\"xml_export_contents\":\"something\",\"yaml_structure_or_data\":\"data\",\"\":null,\"lock_tables\":null,\"as_separate_files\":null,\"csv_removeCRLF\":null,\"csv_columns\":null,\"excel_removeCRLF\":null,\"htmlword_columns\":null,\"json_pretty_print\":null,\"ods_columns\":null,\"sql_dates\":null,\"sql_relation\":null,\"sql_mime\":null,\"sql_disable_fk\":null,\"sql_views_as_tables\":null,\"sql_metadata\":null,\"sql_create_database\":null,\"sql_drop_table\":null,\"sql_if_not_exists\":null,\"sql_truncate\":null,\"sql_delayed\":null,\"sql_ignore\":null,\"texytext_columns\":null}');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pma__favorite`
--

CREATE TABLE `pma__favorite` (
  `username` varchar(64) COLLATE utf8_bin NOT NULL,
  `tables` text COLLATE utf8_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Favorite tables';

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pma__history`
--

CREATE TABLE `pma__history` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `username` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `db` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `table` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `timevalue` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `sqlquery` text COLLATE utf8_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='SQL history for phpMyAdmin';

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pma__navigationhiding`
--

CREATE TABLE `pma__navigationhiding` (
  `username` varchar(64) COLLATE utf8_bin NOT NULL,
  `item_name` varchar(64) COLLATE utf8_bin NOT NULL,
  `item_type` varchar(64) COLLATE utf8_bin NOT NULL,
  `db_name` varchar(64) COLLATE utf8_bin NOT NULL,
  `table_name` varchar(64) COLLATE utf8_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Hidden items of navigation tree';

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pma__pdf_pages`
--

CREATE TABLE `pma__pdf_pages` (
  `db_name` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `page_nr` int(10) UNSIGNED NOT NULL,
  `page_descr` varchar(50) CHARACTER SET utf8 NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='PDF relation pages for phpMyAdmin';

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pma__recent`
--

CREATE TABLE `pma__recent` (
  `username` varchar(64) COLLATE utf8_bin NOT NULL,
  `tables` text COLLATE utf8_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Recently accessed tables';

--
-- Volcado de datos para la tabla `pma__recent`
--

INSERT INTO `pma__recent` (`username`, `tables`) VALUES
('root', '[{\"db\":\"chat\",\"table\":\"login\"},{\"db\":\"chat\",\"table\":\"chat_message\"},{\"db\":\"chat\",\"table\":\"participantes\"},{\"db\":\"chat\",\"table\":\"newgrupo\"},{\"db\":\"chat\",\"table\":\"is_writing\"},{\"db\":\"chat\",\"table\":\"datospersonales\"},{\"db\":\"chat\",\"table\":\"login_details\"},{\"db\":\"chat\",\"table\":\"datosPersonales\"},{\"db\":\"quesosbravo\",\"table\":\"productos\"},{\"db\":\"quesosbravo\",\"table\":\"precompras\"}]');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pma__relation`
--

CREATE TABLE `pma__relation` (
  `master_db` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `master_table` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `master_field` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `foreign_db` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `foreign_table` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `foreign_field` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Relation table';

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pma__savedsearches`
--

CREATE TABLE `pma__savedsearches` (
  `id` int(5) UNSIGNED NOT NULL,
  `username` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `db_name` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `search_name` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `search_data` text COLLATE utf8_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Saved searches';

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pma__table_coords`
--

CREATE TABLE `pma__table_coords` (
  `db_name` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `table_name` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `pdf_page_number` int(11) NOT NULL DEFAULT '0',
  `x` float UNSIGNED NOT NULL DEFAULT '0',
  `y` float UNSIGNED NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Table coordinates for phpMyAdmin PDF output';

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pma__table_info`
--

CREATE TABLE `pma__table_info` (
  `db_name` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `table_name` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `display_field` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Table information for phpMyAdmin';

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pma__table_uiprefs`
--

CREATE TABLE `pma__table_uiprefs` (
  `username` varchar(64) COLLATE utf8_bin NOT NULL,
  `db_name` varchar(64) COLLATE utf8_bin NOT NULL,
  `table_name` varchar(64) COLLATE utf8_bin NOT NULL,
  `prefs` text COLLATE utf8_bin NOT NULL,
  `last_update` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Tables'' UI preferences';

--
-- Volcado de datos para la tabla `pma__table_uiprefs`
--

INSERT INTO `pma__table_uiprefs` (`username`, `db_name`, `table_name`, `prefs`, `last_update`) VALUES
('root', 'caja_ahorro', 'socio', '[]', '2019-07-23 09:18:40');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pma__tracking`
--

CREATE TABLE `pma__tracking` (
  `db_name` varchar(64) COLLATE utf8_bin NOT NULL,
  `table_name` varchar(64) COLLATE utf8_bin NOT NULL,
  `version` int(10) UNSIGNED NOT NULL,
  `date_created` datetime NOT NULL,
  `date_updated` datetime NOT NULL,
  `schema_snapshot` text COLLATE utf8_bin NOT NULL,
  `schema_sql` text COLLATE utf8_bin,
  `data_sql` longtext COLLATE utf8_bin,
  `tracking` set('UPDATE','REPLACE','INSERT','DELETE','TRUNCATE','CREATE DATABASE','ALTER DATABASE','DROP DATABASE','CREATE TABLE','ALTER TABLE','RENAME TABLE','DROP TABLE','CREATE INDEX','DROP INDEX','CREATE VIEW','ALTER VIEW','DROP VIEW') COLLATE utf8_bin DEFAULT NULL,
  `tracking_active` int(1) UNSIGNED NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Database changes tracking for phpMyAdmin';

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pma__userconfig`
--

CREATE TABLE `pma__userconfig` (
  `username` varchar(64) COLLATE utf8_bin NOT NULL,
  `timevalue` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `config_data` text COLLATE utf8_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='User preferences storage for phpMyAdmin';

--
-- Volcado de datos para la tabla `pma__userconfig`
--

INSERT INTO `pma__userconfig` (`username`, `timevalue`, `config_data`) VALUES
('root', '2019-07-15 11:33:06', '{\"lang\":\"es\",\"collation_connection\":\"utf8mb4_unicode_ci\"}');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pma__usergroups`
--

CREATE TABLE `pma__usergroups` (
  `usergroup` varchar(64) COLLATE utf8_bin NOT NULL,
  `tab` varchar(64) COLLATE utf8_bin NOT NULL,
  `allowed` enum('Y','N') COLLATE utf8_bin NOT NULL DEFAULT 'N'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='User groups with configured menu items';

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pma__users`
--

CREATE TABLE `pma__users` (
  `username` varchar(64) COLLATE utf8_bin NOT NULL,
  `usergroup` varchar(64) COLLATE utf8_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Users and their assignments to user groups';

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `pma__bookmark`
--
ALTER TABLE `pma__bookmark`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `pma__central_columns`
--
ALTER TABLE `pma__central_columns`
  ADD PRIMARY KEY (`db_name`,`col_name`);

--
-- Indices de la tabla `pma__column_info`
--
ALTER TABLE `pma__column_info`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `db_name` (`db_name`,`table_name`,`column_name`);

--
-- Indices de la tabla `pma__designer_settings`
--
ALTER TABLE `pma__designer_settings`
  ADD PRIMARY KEY (`username`);

--
-- Indices de la tabla `pma__export_templates`
--
ALTER TABLE `pma__export_templates`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `u_user_type_template` (`username`,`export_type`,`template_name`);

--
-- Indices de la tabla `pma__favorite`
--
ALTER TABLE `pma__favorite`
  ADD PRIMARY KEY (`username`);

--
-- Indices de la tabla `pma__history`
--
ALTER TABLE `pma__history`
  ADD PRIMARY KEY (`id`),
  ADD KEY `username` (`username`,`db`,`table`,`timevalue`);

--
-- Indices de la tabla `pma__navigationhiding`
--
ALTER TABLE `pma__navigationhiding`
  ADD PRIMARY KEY (`username`,`item_name`,`item_type`,`db_name`,`table_name`);

--
-- Indices de la tabla `pma__pdf_pages`
--
ALTER TABLE `pma__pdf_pages`
  ADD PRIMARY KEY (`page_nr`),
  ADD KEY `db_name` (`db_name`);

--
-- Indices de la tabla `pma__recent`
--
ALTER TABLE `pma__recent`
  ADD PRIMARY KEY (`username`);

--
-- Indices de la tabla `pma__relation`
--
ALTER TABLE `pma__relation`
  ADD PRIMARY KEY (`master_db`,`master_table`,`master_field`),
  ADD KEY `foreign_field` (`foreign_db`,`foreign_table`);

--
-- Indices de la tabla `pma__savedsearches`
--
ALTER TABLE `pma__savedsearches`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `u_savedsearches_username_dbname` (`username`,`db_name`,`search_name`);

--
-- Indices de la tabla `pma__table_coords`
--
ALTER TABLE `pma__table_coords`
  ADD PRIMARY KEY (`db_name`,`table_name`,`pdf_page_number`);

--
-- Indices de la tabla `pma__table_info`
--
ALTER TABLE `pma__table_info`
  ADD PRIMARY KEY (`db_name`,`table_name`);

--
-- Indices de la tabla `pma__table_uiprefs`
--
ALTER TABLE `pma__table_uiprefs`
  ADD PRIMARY KEY (`username`,`db_name`,`table_name`);

--
-- Indices de la tabla `pma__tracking`
--
ALTER TABLE `pma__tracking`
  ADD PRIMARY KEY (`db_name`,`table_name`,`version`);

--
-- Indices de la tabla `pma__userconfig`
--
ALTER TABLE `pma__userconfig`
  ADD PRIMARY KEY (`username`);

--
-- Indices de la tabla `pma__usergroups`
--
ALTER TABLE `pma__usergroups`
  ADD PRIMARY KEY (`usergroup`,`tab`,`allowed`);

--
-- Indices de la tabla `pma__users`
--
ALTER TABLE `pma__users`
  ADD PRIMARY KEY (`username`,`usergroup`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `pma__bookmark`
--
ALTER TABLE `pma__bookmark`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `pma__column_info`
--
ALTER TABLE `pma__column_info`
  MODIFY `id` int(5) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `pma__export_templates`
--
ALTER TABLE `pma__export_templates`
  MODIFY `id` int(5) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de la tabla `pma__history`
--
ALTER TABLE `pma__history`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `pma__pdf_pages`
--
ALTER TABLE `pma__pdf_pages`
  MODIFY `page_nr` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `pma__savedsearches`
--
ALTER TABLE `pma__savedsearches`
  MODIFY `id` int(5) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- Base de datos: `quesosbravo`
--
CREATE DATABASE IF NOT EXISTS `quesosbravo` DEFAULT CHARACTER SET utf8 COLLATE utf8_bin;
USE `quesosbravo`;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `clientes`
--

CREATE TABLE `clientes` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `cliente` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `direccion_p` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `img_cliente` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `negocio` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `direccion_n` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `img_negocio` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `detalle_precompras`
--

CREATE TABLE `detalle_precompras` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `id_producto` bigint(20) UNSIGNED NOT NULL,
  `id_precompra` bigint(20) UNSIGNED NOT NULL,
  `cantidad` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `detalle_precompras`
--

INSERT INTO `detalle_precompras` (`id`, `id_producto`, `id_precompra`, `cantidad`, `created_at`, `updated_at`) VALUES
(1, 2, 1, '10', '2019-11-13 00:41:57', '2019-11-13 00:42:25');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `detalle_ventas`
--

CREATE TABLE `detalle_ventas` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `id_producto` bigint(20) UNSIGNED NOT NULL,
  `id_venta` bigint(20) UNSIGNED NOT NULL,
  `cantidad` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `precio` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(17, '2014_10_12_000000_create_users_table', 1),
(18, '2014_10_12_100000_create_password_resets_table', 1),
(19, '2019_10_08_121022_create_productos_table', 1),
(20, '2019_10_11_215004_create_reabastecers_table', 1),
(21, '2019_10_15_234509_create_ventas_table', 1),
(22, '2019_10_18_053107_create_precompras_table', 1),
(23, '2019_10_18_053301_create_detalle_precompras_table', 1),
(24, '2019_10_19_054621_create_detalle_ventas_table', 1),
(25, '2019_11_01_100031_create_clientes_table', 2);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `password_resets`
--

CREATE TABLE `password_resets` (
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `precompras`
--

CREATE TABLE `precompras` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `numeroFactura` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `fecha` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `precompras`
--

INSERT INTO `precompras` (`id`, `numeroFactura`, `fecha`) VALUES
(1, 'JVCOPF3D11', '2019-11-12 18:51:57');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `productos`
--

CREATE TABLE `productos` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `image_producto` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `nombre` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `local` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `negocio` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `presentacion` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `cantidad` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `stock` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `pedido` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `productos`
--

INSERT INTO `productos` (`id`, `image_producto`, `nombre`, `local`, `negocio`, `presentacion`, `cantidad`, `stock`, `pedido`, `created_at`, `updated_at`) VALUES
(1, 'upload/ACXwTA07WDrjvqyZgN4AXspfhg4CjyNROoDzgn6L.jpeg', 'Queso Hebra', '100', '84', '1kg', '0', '80', '0', NULL, '2019-10-29 00:22:08'),
(2, 'upload/sqtvLVDOaYSN1J85556X6dzqWNutufu6u2CE8FQ0.jpeg', 'lechita', '15', '12', '300ml', '10', '50', '10', NULL, '2019-11-13 00:42:26');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `reabastecers`
--

CREATE TABLE `reabastecers` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `id_producto` bigint(20) UNSIGNED NOT NULL,
  `cantidad` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `fecha` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email_verified_at` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `password` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `ventas`
--

CREATE TABLE `ventas` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `numerofactura` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `fecha` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `importe` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `clientes`
--
ALTER TABLE `clientes`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `detalle_precompras`
--
ALTER TABLE `detalle_precompras`
  ADD PRIMARY KEY (`id`),
  ADD KEY `detalle_precompras_id_producto_foreign` (`id_producto`),
  ADD KEY `detalle_precompras_id_precompra_foreign` (`id_precompra`);

--
-- Indices de la tabla `detalle_ventas`
--
ALTER TABLE `detalle_ventas`
  ADD PRIMARY KEY (`id`),
  ADD KEY `detalle_ventas_id_producto_foreign` (`id_producto`),
  ADD KEY `detalle_ventas_id_venta_foreign` (`id_venta`);

--
-- Indices de la tabla `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `password_resets`
--
ALTER TABLE `password_resets`
  ADD KEY `password_resets_email_index` (`email`);

--
-- Indices de la tabla `precompras`
--
ALTER TABLE `precompras`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `productos`
--
ALTER TABLE `productos`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `reabastecers`
--
ALTER TABLE `reabastecers`
  ADD PRIMARY KEY (`id`),
  ADD KEY `reabastecers_id_producto_foreign` (`id_producto`);

--
-- Indices de la tabla `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`);

--
-- Indices de la tabla `ventas`
--
ALTER TABLE `ventas`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `clientes`
--
ALTER TABLE `clientes`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `detalle_precompras`
--
ALTER TABLE `detalle_precompras`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de la tabla `detalle_ventas`
--
ALTER TABLE `detalle_ventas`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=26;

--
-- AUTO_INCREMENT de la tabla `precompras`
--
ALTER TABLE `precompras`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de la tabla `productos`
--
ALTER TABLE `productos`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `reabastecers`
--
ALTER TABLE `reabastecers`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `ventas`
--
ALTER TABLE `ventas`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `detalle_precompras`
--
ALTER TABLE `detalle_precompras`
  ADD CONSTRAINT `detalle_precompras_id_precompra_foreign` FOREIGN KEY (`id_precompra`) REFERENCES `precompras` (`id`),
  ADD CONSTRAINT `detalle_precompras_id_producto_foreign` FOREIGN KEY (`id_producto`) REFERENCES `productos` (`id`);

--
-- Filtros para la tabla `detalle_ventas`
--
ALTER TABLE `detalle_ventas`
  ADD CONSTRAINT `detalle_ventas_id_producto_foreign` FOREIGN KEY (`id_producto`) REFERENCES `productos` (`id`),
  ADD CONSTRAINT `detalle_ventas_id_venta_foreign` FOREIGN KEY (`id_venta`) REFERENCES `ventas` (`id`);

--
-- Filtros para la tabla `reabastecers`
--
ALTER TABLE `reabastecers`
  ADD CONSTRAINT `reabastecers_id_producto_foreign` FOREIGN KEY (`id_producto`) REFERENCES `productos` (`id`);
--
-- Base de datos: `test`
--
CREATE DATABASE IF NOT EXISTS `test` DEFAULT CHARACTER SET latin1 COLLATE latin1_swedish_ci;
USE `test`;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `producto`
--

CREATE TABLE `producto` (
  `codigo` int(11) NOT NULL,
  `nombre` varchar(50) NOT NULL,
  `precio` varchar(5) NOT NULL,
  `modelo` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `producto`
--

INSERT INTO `producto` (`codigo`, `nombre`, `precio`, `modelo`) VALUES
(1, 'mesa', '802', 'otra marca'),
(2, 'leche', '590', 'scrib'),
(3, 'leche', '300', 'tenda'),
(4, 'mesa', '923', 'baby olor'),
(5, 'sabrita', '590', 'scrib'),
(6, 'mesa', '860', 'baby olor'),
(7, 'sabrita', '184', 'baby olor'),
(8, 'jabon', '743', 'tenda'),
(9, 'papel', '846', 'tenda'),
(10, 'papel', '49', 'tenda'),
(11, 'leche', '667', 'baby olor'),
(12, 'cable', '101', 'mabe'),
(13, 'jabon', '352', 'otra marca'),
(14, 'sabrita', '514', 'tenda'),
(15, 'jabon', '666', 'scrib'),
(16, 'jabon', '191', 'scrib'),
(17, 'clima', '748', 'tenda'),
(18, 'sabrita', '272', 'baby olor'),
(19, 'leche', '248', 'tenda'),
(20, 'mesa', '32', 'mabe'),
(21, 'papel', '571', 'mabe'),
(22, 'ventilador', '433', 'baby olor'),
(23, 'jabon', '440', 'mabe'),
(24, 'leche', '79', 'tenda'),
(25, 'papel', '465', 'otra marca'),
(26, 'mesa', '897', 'mabe'),
(27, 'cable', '642', 'mabe'),
(28, 'jabon', '563', 'tenda'),
(29, 'papel', '284', 'scrib'),
(30, 'cable', '617', 'mabe'),
(31, 'papel', '308', 'mabe'),
(32, 'clima', '556', 'tenda'),
(33, 'cable', '37', 'mabe'),
(34, 'sabrita', '711', 'tenda'),
(35, 'jabon', '180', 'baby olor'),
(36, 'papel', '357', 'scrib'),
(37, 'papel', '492', 'otra marca'),
(38, 'leche', '584', 'scrib'),
(39, 'papel', '424', 'otra marca'),
(40, 'ventilador', '977', 'mabe'),
(41, 'mesa', '640', 'tenda'),
(42, 'jabon', '175', 'baby olor'),
(43, 'mesa', '809', 'mabe'),
(44, 'ventilador', '899', 'scrib'),
(45, 'papel', '646', 'scrib'),
(46, 'clima', '790', 'scrib'),
(47, 'cable', '295', 'mabe'),
(48, 'clima', '858', 'tenda'),
(49, 'mesa', '262', 'mabe'),
(50, 'leche', '360', 'mabe'),
(51, 'cable', '531', 'tenda'),
(52, 'ventilador', '371', 'baby olor'),
(53, 'papel', '457', 'tenda'),
(54, 'jabon', '756', 'scrib'),
(55, 'mesa', '499', 'scrib'),
(56, 'clima', '61', 'baby olor'),
(57, 'clima', '79', 'baby olor'),
(58, 'leche', '709', 'mabe'),
(59, 'cable', '508', 'scrib'),
(60, 'sabrita', '721', 'baby olor'),
(61, 'papel', '694', 'baby olor'),
(62, 'leche', '873', 'tenda'),
(63, 'cable', '825', 'otra marca'),
(64, 'sabrita', '232', 'scrib'),
(65, 'cable', '169', 'scrib'),
(66, 'sabrita', '276', 'tenda'),
(67, 'papel', '730', 'otra marca'),
(68, 'clima', '702', 'scrib'),
(69, 'clima', '368', 'mabe'),
(70, 'cable', '653', 'otra marca'),
(71, 'cable', '550', 'baby olor'),
(72, 'mesa', '963', 'scrib'),
(73, 'ventilador', '538', 'tenda'),
(74, 'cable', '545', 'mabe'),
(75, 'ventilador', '41', 'mabe'),
(76, 'cable', '892', 'otra marca'),
(77, 'jabon', '317', 'otra marca'),
(78, 'jabon', '745', 'baby olor'),
(79, 'cable', '315', 'tenda'),
(80, 'sabrita', '490', 'tenda'),
(81, 'mesa', '74', 'baby olor'),
(82, 'mesa', '643', 'baby olor'),
(83, 'jabon', '228', 'otra marca'),
(84, 'leche', '365', 'baby olor'),
(85, 'cable', '29', 'baby olor'),
(86, 'leche', '524', 'otra marca'),
(87, 'jabon', '957', 'scrib'),
(88, 'ventilador', '449', 'scrib'),
(89, 'papel', '249', 'otra marca'),
(90, 'sabrita', '852', 'tenda'),
(91, 'sabrita', '978', 'tenda'),
(92, 'sabrita', '719', 'mabe'),
(93, 'ventilador', '177', 'tenda'),
(94, 'ventilador', '176', 'otra marca'),
(95, 'papel', '653', 'mabe'),
(96, 'papel', '978', 'tenda'),
(97, 'clima', '444', 'tenda'),
(98, 'mesa', '201', 'otra marca'),
(99, 'leche', '16', 'tenda'),
(100, 'leche', '751', 'scrib'),
(101, 'jabon', '230', 'tenda'),
(102, 'leche', '586', 'baby olor'),
(103, 'ventilador', '544', 'otra marca'),
(104, 'papel', '554', 'scrib'),
(105, 'ventilador', '930', 'baby olor'),
(106, 'cable', '343', 'otra marca'),
(107, 'cable', '249', 'scrib'),
(108, 'leche', '945', 'baby olor'),
(109, 'mesa', '992', 'mabe'),
(110, 'clima', '828', 'baby olor'),
(111, 'papel', '366', 'tenda'),
(112, 'mesa', '451', 'otra marca'),
(113, 'jabon', '668', 'tenda'),
(114, 'clima', '407', 'otra marca'),
(115, 'jabon', '593', 'otra marca'),
(116, 'sabrita', '610', 'tenda'),
(117, 'jabon', '494', 'tenda'),
(118, 'cable', '662', 'tenda'),
(119, 'papel', '252', 'baby olor'),
(120, 'mesa', '324', 'baby olor'),
(121, 'mesa', '352', 'baby olor'),
(122, 'papel', '150', 'baby olor'),
(123, 'leche', '939', 'tenda'),
(124, 'leche', '236', 'tenda'),
(125, 'ventilador', '976', 'scrib'),
(126, 'ventilador', '24', 'mabe'),
(127, 'clima', '396', 'tenda'),
(128, 'clima', '469', 'mabe'),
(129, 'ventilador', '723', 'otra marca'),
(130, 'cable', '912', 'baby olor'),
(131, 'sabrita', '738', 'mabe'),
(132, 'papel', '255', 'otra marca'),
(133, 'leche', '303', 'otra marca'),
(134, 'cable', '251', 'otra marca'),
(135, 'cable', '950', 'baby olor'),
(136, 'clima', '366', 'tenda'),
(137, 'papel', '724', 'tenda'),
(138, 'leche', '965', 'mabe'),
(139, 'clima', '639', 'mabe'),
(140, 'cable', '206', 'scrib'),
(141, 'clima', '394', 'tenda'),
(142, 'cable', '548', 'tenda'),
(143, 'papel', '744', 'tenda'),
(144, 'sabrita', '937', 'tenda'),
(145, 'cable', '989', 'scrib'),
(146, 'jabon', '597', 'otra marca'),
(147, 'clima', '313', 'scrib'),
(148, 'mesa', '817', 'baby olor'),
(149, 'papel', '636', 'baby olor'),
(150, 'papel', '739', 'otra marca'),
(151, 'mesa', '477', 'baby olor'),
(152, 'cable', '548', 'mabe'),
(153, 'cable', '7', 'mabe'),
(154, 'leche', '614', 'otra marca'),
(155, 'jabon', '29', 'baby olor'),
(156, 'mesa', '371', 'scrib');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `producto`
--
ALTER TABLE `producto`
  ADD PRIMARY KEY (`codigo`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `producto`
--
ALTER TABLE `producto`
  MODIFY `codigo` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=157;
--
-- Base de datos: `tienda`
--
CREATE DATABASE IF NOT EXISTS `tienda` DEFAULT CHARACTER SET latin1 COLLATE latin1_swedish_ci;
USE `tienda`;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `productos`
--

CREATE TABLE `productos` (
  `id_producto` int(11) NOT NULL,
  `nombre` varchar(30) NOT NULL,
  `marca` varchar(20) NOT NULL,
  `unidad_medida` varchar(15) NOT NULL,
  `precio_vta` float NOT NULL,
  `precio_compra` float NOT NULL,
  `existencia` int(11) NOT NULL,
  `demanda_promedio` float NOT NULL,
  `costo_produccion` float NOT NULL,
  `costo_almacenamiento` float NOT NULL,
  `costo_individual` float NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `productos`
--

INSERT INTO `productos` (`id_producto`, `nombre`, `marca`, `unidad_medida`, `precio_vta`, `precio_compra`, `existencia`, `demanda_promedio`, `costo_produccion`, `costo_almacenamiento`, `costo_individual`) VALUES
(3, 'frijol', 'zulka', 'kg', 15, 12, 60, 34, 10, 13, 3);

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `productos`
--
ALTER TABLE `productos`
  ADD PRIMARY KEY (`id_producto`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `productos`
--
ALTER TABLE `productos`
  MODIFY `id_producto` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
