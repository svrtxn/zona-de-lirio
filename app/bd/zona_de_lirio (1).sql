-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 06-09-2024 a las 05:21:47
-- Versión del servidor: 10.4.32-MariaDB
-- Versión de PHP: 8.0.30

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `zona_de_lirio`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `categories`
--

CREATE TABLE `categories` (
  `category_id` int(11) NOT NULL,
  `name` varchar(45) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `categories`
--

INSERT INTO `categories` (`category_id`, `name`) VALUES
(92, 'Acción'),
(113, 'Amor Escolar'),
(115, 'Amor Prohibido'),
(93, 'Artes Marciales'),
(97, 'Aventura'),
(96, 'Aventuras'),
(167, 'Aventuras en Universos Alternativos'),
(95, 'Batallas Épicas'),
(141, 'Biografías'),
(101, 'Búsqueda de Tesoro'),
(136, 'Casas Embrujadas'),
(122, 'Ciencia Ficción'),
(102, 'Comedia'),
(104, 'Comedia Romántica'),
(176, 'Competencias Musicales'),
(144, 'Competencias y Torneos'),
(109, 'Conflictos Internos'),
(163, 'Contenido Adulto Explícito'),
(159, 'Contenido Sugestivo'),
(119, 'Criaturas Mágicas'),
(142, 'Deportes'),
(143, 'Deportes en General'),
(111, 'Desarrollo de Personajes'),
(150, 'Desarrollo Personal'),
(107, 'Drama'),
(140, 'Dramas de Época'),
(154, 'Dramas y Comedias BL'),
(157, 'Dramas y Comedias GL'),
(158, 'Ecchi'),
(130, 'Enigmas y Puzzles'),
(146, 'Entrenamiento y Desarrollo'),
(171, 'Escenas Fuertemente Sangrientas'),
(151, 'Experiencias Diarias'),
(98, 'Exploración'),
(117, 'Fantasia'),
(123, 'Futuro Distópico'),
(169, 'Gore'),
(162, 'Hentai'),
(137, 'Historia'),
(175, 'Historia Basada en la Música'),
(145, 'Historia de Equipos'),
(132, 'Horror'),
(103, 'Humor Cotidiano'),
(161, 'Humor Sexy'),
(172, 'Impacto Visual'),
(126, 'Inteligencia Artificial'),
(128, 'Investigación de Crímenes'),
(165, 'Isekai'),
(118, 'Magia y Hechicería'),
(127, 'Misterio/Thriller'),
(134, 'Monstruos y Demonios'),
(100, 'Mundos Fantásticos'),
(173, 'Musical'),
(105, 'Parodia'),
(174, 'Performances y Conciertos'),
(138, 'Periodos Históricos Reales'),
(168, 'Poderes en Nuevos Mundos'),
(121, 'Poderes Sobrenaturales'),
(166, 'Reencarnación en Otro Mundo'),
(139, 'Reimaginaciones Históricas'),
(120, 'Reinos Mágicos'),
(114, 'Relaciones Adultas'),
(149, 'Relaciones Interpersonales'),
(108, 'Relatos Realistas'),
(112, 'Romance'),
(153, 'Romance entre Hombres'),
(156, 'Romance entre Mujeres'),
(160, 'Situaciones Picantes'),
(106, 'Slapstick'),
(147, 'Slice of Life (Corte de Vida)'),
(133, 'Sobrenatural'),
(94, 'Superhéroes'),
(129, 'Suspense Psicológico'),
(124, 'Tecnología Avanzada'),
(164, 'Temas Sexualizados'),
(135, 'Terror Psicológico'),
(110, 'Tragedia'),
(131, 'Tramas Intrigantes'),
(116, 'Triángulos Amorosos'),
(99, 'Viajes en el Tiempo'),
(125, 'Viajes Espaciales'),
(148, 'Vida Cotidiana'),
(170, 'Violencia Gráfica'),
(152, 'Yaoi/Boys\' Love (BL)'),
(155, 'Yuri/Girls\' Love (GL)');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `chapters`
--

CREATE TABLE `chapters` (
  `chapter_id` int(11) NOT NULL,
  `project_id` int(11) NOT NULL,
  `number` int(11) NOT NULL,
  `title` varchar(45) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `groups`
--

CREATE TABLE `groups` (
  `group_id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `leader` varchar(255) NOT NULL,
  `contact` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `groups`
--

INSERT INTO `groups` (`group_id`, `name`, `leader`, `contact`) VALUES
(1, 'SrChofli', 'SrChofli', 'Señor Chofli');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `images`
--

CREATE TABLE `images` (
  `image_id` int(11) NOT NULL,
  `chapter_id` int(11) NOT NULL,
  `image_path` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `projects`
--

CREATE TABLE `projects` (
  `project_id` int(11) NOT NULL,
  `name` varchar(45) NOT NULL,
  `secondary_name` varchar(255) NOT NULL,
  `description` varchar(255) NOT NULL,
  `author` varchar(255) NOT NULL,
  `published_by` varchar(255) NOT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `covered` varchar(45) NOT NULL,
  `status` int(11) NOT NULL,
  `group_id` int(11) DEFAULT NULL,
  `type` enum('manga','manhwa','manhua') NOT NULL,
  `rating` enum('+18','Para todas las edades') NOT NULL,
  `evaluation` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `projects`
--

INSERT INTO `projects` (`project_id`, `name`, `secondary_name`, `description`, `author`, `published_by`, `created_at`, `updated_at`, `covered`, `status`, `group_id`, `type`, `rating`, `evaluation`) VALUES
(1, 'Implacable', '', '2024-09-01 23:25:15', '', '', '2024-09-01 00:22:12', '2024-09-01 00:22:12', 'rO3KdPGK20mYclpN73sY.png', 1, NULL, 'manga', '+18', 0),
(2, 'Sombras del corazón', '', 'ekisdep', '', '', '2024-09-01 00:31:35', '2024-09-01 00:31:35', 'MRr0T1k4piaRyyRRKTXs.webp', 2, NULL, 'manga', '+18', 0),
(3, 'Ejemplo titulo', '', 'Ejemplo de la descripción ', '', '', '2024-09-01 00:43:11', '2024-09-01 00:43:11', 'Eroryb8MvGuetzZR_FnT.png', 2, NULL, 'manga', '+18', 0),
(4, 'Ejemplo 1', 'Ejemplo uno', 'Ejemplo uno de agregar proyecto', 'Steffi Ryser', '', '2024-09-02 16:53:28', '2024-09-02 16:53:28', '0tr7JXI5EmDZh09ie7TW.png', 2, 1, 'manhua', 'Para todas las edades', 0);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `project_categories`
--

CREATE TABLE `project_categories` (
  `project_id` int(11) NOT NULL,
  `category_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `roles`
--

CREATE TABLE `roles` (
  `role_id` int(11) NOT NULL,
  `role_name` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `roles`
--

INSERT INTO `roles` (`role_id`, `role_name`) VALUES
(1, 'Admin'),
(2, 'Moderator'),
(3, 'User');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `users`
--

CREATE TABLE `users` (
  `user_id` int(11) NOT NULL,
  `username` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `role_id` int(11) NOT NULL,
  `created_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `users`
--

INSERT INTO `users` (`user_id`, `username`, `email`, `password`, `role_id`, `created_at`) VALUES
(2, 'moderador', 'moderador@mail.cl', 'moderador', 2, '2024-09-01 00:16:16'),
(3, 'user', 'user@mail.cl', 'user', 3, '2024-09-01 00:16:16'),
(4, 'admin', 'admin@mail.cl', 'scrypt:32768:8:1$HXQxfBWfbYaTLT62$bf5a63ccf115d5ea2315d10f83912f326cc7a526a485e9430bab2ee97176e4bb8297d19b5e514094a722e637d25dd3ec336462998ada910e60067b281bab46e8', 1, '2024-09-01 00:17:26');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`category_id`),
  ADD UNIQUE KEY `name` (`name`);

--
-- Indices de la tabla `chapters`
--
ALTER TABLE `chapters`
  ADD PRIMARY KEY (`chapter_id`),
  ADD KEY `project_id` (`project_id`);

--
-- Indices de la tabla `groups`
--
ALTER TABLE `groups`
  ADD PRIMARY KEY (`group_id`),
  ADD UNIQUE KEY `name` (`name`);

--
-- Indices de la tabla `images`
--
ALTER TABLE `images`
  ADD PRIMARY KEY (`image_id`),
  ADD KEY `chapter_id` (`chapter_id`);

--
-- Indices de la tabla `projects`
--
ALTER TABLE `projects`
  ADD PRIMARY KEY (`project_id`),
  ADD KEY `projects_ibfk_1` (`group_id`);

--
-- Indices de la tabla `project_categories`
--
ALTER TABLE `project_categories`
  ADD PRIMARY KEY (`project_id`,`category_id`),
  ADD KEY `category_id` (`category_id`);

--
-- Indices de la tabla `roles`
--
ALTER TABLE `roles`
  ADD PRIMARY KEY (`role_id`),
  ADD UNIQUE KEY `role_name` (`role_name`);

--
-- Indices de la tabla `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`user_id`),
  ADD UNIQUE KEY `username` (`username`),
  ADD UNIQUE KEY `email` (`email`),
  ADD KEY `role_id` (`role_id`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `categories`
--
ALTER TABLE `categories`
  MODIFY `category_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=177;

--
-- AUTO_INCREMENT de la tabla `chapters`
--
ALTER TABLE `chapters`
  MODIFY `chapter_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `groups`
--
ALTER TABLE `groups`
  MODIFY `group_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de la tabla `images`
--
ALTER TABLE `images`
  MODIFY `image_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `projects`
--
ALTER TABLE `projects`
  MODIFY `project_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de la tabla `roles`
--
ALTER TABLE `roles`
  MODIFY `role_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de la tabla `users`
--
ALTER TABLE `users`
  MODIFY `user_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `chapters`
--
ALTER TABLE `chapters`
  ADD CONSTRAINT `chapters_ibfk_1` FOREIGN KEY (`project_id`) REFERENCES `projects` (`project_id`) ON DELETE CASCADE;

--
-- Filtros para la tabla `images`
--
ALTER TABLE `images`
  ADD CONSTRAINT `images_ibfk_1` FOREIGN KEY (`chapter_id`) REFERENCES `chapters` (`chapter_id`) ON DELETE CASCADE;

--
-- Filtros para la tabla `projects`
--
ALTER TABLE `projects`
  ADD CONSTRAINT `projects_ibfk_1` FOREIGN KEY (`group_id`) REFERENCES `groups` (`group_id`) ON DELETE SET NULL;

--
-- Filtros para la tabla `project_categories`
--
ALTER TABLE `project_categories`
  ADD CONSTRAINT `project_categories_ibfk_1` FOREIGN KEY (`project_id`) REFERENCES `projects` (`project_id`) ON DELETE CASCADE,
  ADD CONSTRAINT `project_categories_ibfk_2` FOREIGN KEY (`category_id`) REFERENCES `categories` (`category_id`) ON DELETE CASCADE;

--
-- Filtros para la tabla `users`
--
ALTER TABLE `users`
  ADD CONSTRAINT `fk_role_id` FOREIGN KEY (`role_id`) REFERENCES `roles` (`role_id`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
