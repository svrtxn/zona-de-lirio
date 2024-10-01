-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 01-10-2024 a las 20:36:17
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
  `title` varchar(45) NOT NULL,
  `date` date NOT NULL DEFAULT curdate()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `chapters`
--

INSERT INTO `chapters` (`chapter_id`, `project_id`, `number`, `title`, `date`) VALUES
(21, 8, 1, 'Capitulo 1', '2024-09-12'),
(22, 9, 50, 'Capitulo 50.1', '2024-09-12');

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

--
-- Volcado de datos para la tabla `images`
--

INSERT INTO `images` (`image_id`, `chapter_id`, `image_path`) VALUES
(66, 21, 'assets/capitulos/proyecto_8/capitulo_1/13c83bda64714d17886ee3583fefcd02850420428c924cf5b62b9780421d70ef.jpg'),
(67, 21, 'assets/capitulos/proyecto_8/capitulo_1/91b18f1bc0c6406488e7a71b6f7335ffcf693bb94508490e94e2ec4332c09384.jpg'),
(68, 21, 'assets/capitulos/proyecto_8/capitulo_1/1918489d309e40fa9f4f501aa1984c5cc654e9bd069a49089b9b75b978d63399.jpg'),
(69, 21, 'assets/capitulos/proyecto_8/capitulo_1/34277875a757406bb3f7aa09012f9edb6027f2b088f84478a7b48418c2125643.jpg'),
(70, 21, 'assets/capitulos/proyecto_8/capitulo_1/336dec6a1b1945ec8049d3ccfa8c0fc9c3a442b850f44333b713d1c4a111d811.jpg'),
(71, 21, 'assets/capitulos/proyecto_8/capitulo_1/45ea03412d294fd4aa72efa6da06363adc1c827c1fbd42cdb93fa2f1a7a79971.jpg'),
(72, 22, 'assets/capitulos/proyecto_9/capitulo_50.1/649cbd5ad0654d5ca5d2f0c19c37ccfe79af04c8db5c4b6dbb6e9156d90d9c34.jpg'),
(73, 22, 'assets/capitulos/proyecto_9/capitulo_50.1/9d51dca7f564446ab82bba6b317e28518c7839ae72214e09a365af49d7444d45.jpg'),
(74, 22, 'assets/capitulos/proyecto_9/capitulo_50.1/964d02fee83c4ff18b8aa50e9bdbf16cdf60e94ce207468783c73131222d2e53.jpg'),
(75, 22, 'assets/capitulos/proyecto_9/capitulo_50.1/789ff51e92de443691171cb4f6fd7504757fbf449a704e4a94016b513fd50f59.jpg'),
(76, 22, 'assets/capitulos/proyecto_9/capitulo_50.1/0d89972fbf2b4c74a04c0f98794e60e5f9c5943fc6d54f128f662080f4a87817.jpg'),
(77, 22, 'assets/capitulos/proyecto_9/capitulo_50.1/92e8e97a97e44deca6172aad5866e4f18e32544eacda423cb9a2c0cd977b3b7d.jpg'),
(78, 22, 'assets/capitulos/proyecto_9/capitulo_50.1/0faf2d9cac204accb98fc3ea1b0473cd3b4f264c2ee74c4e976a2c215b3b497c.jpg'),
(79, 22, 'assets/capitulos/proyecto_9/capitulo_50.1/ed8be52f6f8b42ff8aff47acfd30332a9127a9d8c4c5446c8e9978b1eda76fd7.jpg'),
(80, 22, 'assets/capitulos/proyecto_9/capitulo_50.1/2a491cfee06c42159f5dccb8d1c8a09ec881af0cb565487497c12d8c4aec3032.jpg'),
(81, 22, 'assets/capitulos/proyecto_9/capitulo_50.1/581c5822d273430d8c4bfb15fa9b980a1fffd7871a1b4b6d95c8647c862e8f07.jpg'),
(82, 22, 'assets/capitulos/proyecto_9/capitulo_50.1/f5c3ec378d9742aead5b1d3b3b73bb8c4b46ffb10ce9449aab971c7bb0ca2cd8.jpg'),
(83, 22, 'assets/capitulos/proyecto_9/capitulo_50.1/483c914005ef42baa4b9dadc4a2be79e225e5c5f16394e77a6407e465dc8bcec.jpg'),
(84, 22, 'assets/capitulos/proyecto_9/capitulo_50.1/3f5ce2ca7f214deb88a6297e2951b12d24ab9cc3e4da46efac1282869663d6c1.jpg'),
(85, 22, 'assets/capitulos/proyecto_9/capitulo_50.1/dc8c8219efdd4867b63a1f6528e485d5333f0c2622fd4aecb0ed0312c1ac8489.jpg'),
(86, 22, 'assets/capitulos/proyecto_9/capitulo_50.1/cac9ece0891248d7b2615ad72ed33e12bef46cda43714c0c9a45b9c97311ebf0.jpg'),
(87, 22, 'assets/capitulos/proyecto_9/capitulo_50.1/01df13d939c74716ab1cca2065f2d655e227220436ab4e239102e73dcf351a00.jpg'),
(88, 22, 'assets/capitulos/proyecto_9/capitulo_50.1/77be38017e2a4438ba6d31c9cd3091c53c6a8ee47d714fec83a75d7a74820e67.jpg'),
(89, 22, 'assets/capitulos/proyecto_9/capitulo_50.1/03a786ff16b44eb6b3c36b15c9b41047b2959383854349d89a4400fd8c7c61ff.jpg'),
(90, 22, 'assets/capitulos/proyecto_9/capitulo_50.1/cb9ce2795d694b849286b9dcdf43b826407f22acf7d74bed8fff8245e6edb0d3.jpg'),
(91, 22, 'assets/capitulos/proyecto_9/capitulo_50.1/7a0a647130f84357b63736b53c6bcb614a99d0b3d0a44dcbacac64f6c241d3b9.jpg'),
(92, 22, 'assets/capitulos/proyecto_9/capitulo_50.1/de67ca7aa94d4f51ba841f3914f11ea562e0522a778e4def9a252267396325cf.jpg'),
(93, 22, 'assets/capitulos/proyecto_9/capitulo_50.1/f6870b8029ec4627b902c95100151a30ee6d28c366004af8b311c13f48632a77.jpg'),
(94, 22, 'assets/capitulos/proyecto_9/capitulo_50.1/836ae6f8792142f68abe419cf178a07938e061186a9947d28e6b4be5ac5e1e6d.jpg'),
(95, 22, 'assets/capitulos/proyecto_9/capitulo_50.1/66e499ef1d97494991f35afe4d1ebae1a3ffddfb1f7d46e2a89453defcf3fe19.jpg'),
(96, 22, 'assets/capitulos/proyecto_9/capitulo_50.1/8ae0047719f44ba5bca15b5b54de2abcab09750ca9fb432d960c6a1b0a6380da.jpg'),
(97, 22, 'assets/capitulos/proyecto_9/capitulo_50.1/36c31b19355b425a9481f33a50874dc149525f6f3af74d13a1a9e2c053e75d7b.jpg'),
(98, 22, 'assets/capitulos/proyecto_9/capitulo_50.1/bfa01cd94b0846b99edc4cb372f238ef956676cb37524ff9aaf5fdbba112c0eb.jpg'),
(99, 22, 'assets/capitulos/proyecto_9/capitulo_50.1/cf67e91d0e0d454aac73bf9c34ae2e284dc5eb7c9eb148b4a5dd14caf42e6b08.jpg'),
(100, 22, 'assets/capitulos/proyecto_9/capitulo_50.1/7742915c5f064806af973d12398f091e16cffbad921c4ebda1f162c063a967b1.jpg'),
(101, 22, 'assets/capitulos/proyecto_9/capitulo_50.1/b6101fa173744e63b84543627472fd7e0806fe10ce4d48f88f7771a192a2b833.jpg'),
(102, 22, 'assets/capitulos/proyecto_9/capitulo_50.1/08b03c2dcfc34f0cbb6add3108c756a02902f49a9759447dada61d0b171f7562.jpg'),
(103, 22, 'assets/capitulos/proyecto_9/capitulo_50.1/515fec6d3b184cb19cd098208b2346dc8dae0ea98bf549f4b1fb57f989e64474.jpg'),
(104, 22, 'assets/capitulos/proyecto_9/capitulo_50.1/13f2757a0d544ffcaac8899625d05de6192f7b5215304254a31c0606e05c56da.jpg'),
(105, 22, 'assets/capitulos/proyecto_9/capitulo_50.1/8af99b219fe94603adc08df37eae5e3fee66b08a58b04b05b029341ce4379285.jpg'),
(106, 22, 'assets/capitulos/proyecto_9/capitulo_50.1/68cc71c6e7ac4a33b2bf4ae1e9496c069b0368d254f9484aab4078e830cf753a.jpg'),
(107, 22, 'assets/capitulos/proyecto_9/capitulo_50.1/b4affcfab77e4260ae7185bdc382332d0dee1be8f19342c0a28263346edfa655.jpg'),
(108, 22, 'assets/capitulos/proyecto_9/capitulo_50.1/d174dd2373c74827ba1b538152edbbf950a762aba3fc42088df48ab048b2f832.jpg'),
(109, 22, 'assets/capitulos/proyecto_9/capitulo_50.1/7f26636a6cb84222b5f9274782248adead1c6b97aea6436caef368c87173af93.jpg'),
(110, 22, 'assets/capitulos/proyecto_9/capitulo_50.1/9147c1acf52d48ae9ecd606251d9c1fb39ab549f8cca4854ac679e75de2ff807.jpg'),
(111, 22, 'assets/capitulos/proyecto_9/capitulo_50.1/822edbf5e5404d6da6c927edd3021baf33e82db3d824465bb0134cee4029122c.jpg'),
(112, 22, 'assets/capitulos/proyecto_9/capitulo_50.1/6f6814faec8d456695b5d7fef2129d2088a80b5855974df0b5eb1d35cc606dfa.jpg'),
(113, 22, 'assets/capitulos/proyecto_9/capitulo_50.1/77bdd5cacb5542c18b3fcb966308a8c3b5e551aea11345909440a2a4c616c0f1.jpg'),
(114, 22, 'assets/capitulos/proyecto_9/capitulo_50.1/11c22ca9aa614815bbdceb69def921280703824c559a49509fc4adfc3736d316.jpg'),
(115, 22, 'assets/capitulos/proyecto_9/capitulo_50.1/b4b3433127e54ec8b7631073f4cb000764ede0e27c434854b2c1d1dfd3c616ac.jpg'),
(116, 22, 'assets/capitulos/proyecto_9/capitulo_50.1/7749cfde9ea7454ab0eac8320eccbaad57f02b4f4d9b43bfab8495144f98e3b1.jpg'),
(117, 22, 'assets/capitulos/proyecto_9/capitulo_50.1/750049ebfce94ac3baa4a30fbb8e395725a9ace56d65417582c98c072a9464da.jpg'),
(118, 22, 'assets/capitulos/proyecto_9/capitulo_50.1/afe985ba275a4d899603dcd9faebfa223f6148206ec8405982042caf3ed3a7b3.jpg'),
(119, 22, 'assets/capitulos/proyecto_9/capitulo_50.1/38915939b3eb407d8b0b39616e8f9157fd6772fdab2b4ce98e55012b252e62c6.jpg'),
(120, 22, 'assets/capitulos/proyecto_9/capitulo_50.1/eab01fab38ef48dca4235b759f6b8fea0b15a6d9f2164c7d908c0574b21f193f.jpg'),
(121, 22, 'assets/capitulos/proyecto_9/capitulo_50.1/485101c23b7e42d7942d1300f6ff6f0bcdb3c97f399046479738ef98ad013a66.jpg'),
(122, 22, 'assets/capitulos/proyecto_9/capitulo_50.1/1287d2da7c1448e2a6f50299ff89eb45c81c89d553014614abcf1fab518c827e.jpg'),
(123, 22, 'assets/capitulos/proyecto_9/capitulo_50.1/bffa2e5c528641ecaa373ca919c34039a1854f8664b44dadabec74ced5d113f6.jpg'),
(124, 22, 'assets/capitulos/proyecto_9/capitulo_50.1/692ff5e1a4084d29ad324cbf84a69eaf88413a02c25e4486bc95324cf838a494.jpg'),
(125, 22, 'assets/capitulos/proyecto_9/capitulo_50.1/41badb2a913e43b4a2909327b4dbaa7f07b832fcf9ca4e31b077d1c0d18a3968.jpg'),
(126, 22, 'assets/capitulos/proyecto_9/capitulo_50.1/74b1cf6a229747c8bd941d39ba439336c35eec2242f6433cbc8ed571e7cf781a.jpg'),
(127, 22, 'assets/capitulos/proyecto_9/capitulo_50.1/9d8b5e8097eb432f961d9698b9ddde78754ff2459ea14492bb43e1ee9192d54c.jpg'),
(128, 22, 'assets/capitulos/proyecto_9/capitulo_50.1/5bdf53f42d5f4aedb9550116906733a4ffae21d5dba84e028c8ee86475fab4d8.jpg'),
(129, 22, 'assets/capitulos/proyecto_9/capitulo_50.1/82549be4f69a4683aa6cc8a30841d9e59132fd4d00804a65b63f60701f47a0b1.jpg'),
(130, 22, 'assets/capitulos/proyecto_9/capitulo_50.1/fd2a53d7e8be4b62813e4efa2ac09e00dc925e6c9d7a4557a5e1b9c857e72e58.jpg'),
(131, 22, 'assets/capitulos/proyecto_9/capitulo_50.1/9fbfeb65b0e94bebbc446ac87a4b46abaf95d1d3718b468cb1ae8c96fc7a14c8.jpg'),
(132, 22, 'assets/capitulos/proyecto_9/capitulo_50.1/5f2e1cdb54d54ad5a083992316d2401795f295dd92c74ca0b843ea0f67284085.jpg'),
(133, 22, 'assets/capitulos/proyecto_9/capitulo_50.1/dd35a45415d443b7ad50258129f99c548c01ecde01e44c4382c87c4e93346c47.jpg'),
(134, 22, 'assets/capitulos/proyecto_9/capitulo_50.1/923a069ae3c345e4899722e89b34fb144d6df098eab7487885b2b3e3f8b9e910.jpg'),
(135, 22, 'assets/capitulos/proyecto_9/capitulo_50.1/0b9a6d884b614e25b2a937fe60a6934fa82d04451aad48b6ad8a2edbe258c12b.jpg'),
(136, 22, 'assets/capitulos/proyecto_9/capitulo_50.1/6414564c477942899ec198a22ccb29bd036721fb040d405b868c9b4312da10a1.jpg'),
(137, 22, 'assets/capitulos/proyecto_9/capitulo_50.1/3e40db8f20264e65998503aa9ac8f5b2a6a46ebdc20e464ba3988c3049bc2885.jpg'),
(138, 22, 'assets/capitulos/proyecto_9/capitulo_50.1/b8fc2ef7ea0b4884a87765e19c3a81d578fb21289a1d4dd6892c7d60fbe87663.jpg'),
(139, 22, 'assets/capitulos/proyecto_9/capitulo_50.1/57ecd6c0e1244a6c99dd30b8e6ea561a8c89c5b2770c44698be8359d75e0ce33.jpg'),
(140, 22, 'assets/capitulos/proyecto_9/capitulo_50.1/c0155b64db464430bf29c0e66be57792e0dbbe51b78c4f46ac911fdadfceec5e.jpg'),
(141, 22, 'assets/capitulos/proyecto_9/capitulo_50.1/8de95cc8403e4c9591bb58d0e102f388ac285862cc93412fb9b3bf8db1d9c58a.jpg'),
(142, 22, 'assets/capitulos/proyecto_9/capitulo_50.1/614a267a34d14b38acf613b0d26c93cd272469b3d77a40ceb5ac6dead0058f3c.jpg'),
(143, 22, 'assets/capitulos/proyecto_9/capitulo_50.1/e8016f53032947cbbbfc21ec8628a8fac4286de413b54875be908f3c2cd08e94.jpg'),
(144, 22, 'assets/capitulos/proyecto_9/capitulo_50.1/657d2ffa288542f5bb51abec3daa4008563ecd721ef84556a56bb0c2ae66775a.jpg'),
(145, 22, 'assets/capitulos/proyecto_9/capitulo_50.1/32ebc99bfccc45a09b07a40e22e546d7ad4099e871c74a6db2f55b5cacbdc5f5.jpg'),
(146, 22, 'assets/capitulos/proyecto_9/capitulo_50.1/c4f94c0dec704411b572e3db5d68641d62013b2cab424fb997171192c6915573.jpg'),
(147, 22, 'assets/capitulos/proyecto_9/capitulo_50.1/b3438d1de9d9466d99d4a971a8fd3db06725e508359c4ecc97a9c9897fe975c0.jpg'),
(148, 22, 'assets/capitulos/proyecto_9/capitulo_50.1/4c1c5b679a2143c184ee239bc7f53e380c344e2dcfaa411ea513c54b24543731.jpg'),
(149, 22, 'assets/capitulos/proyecto_9/capitulo_50.1/9dd8a78e77f24ec6afc50b5fdaca419b0f862a123b2c4fda8f4c75bfcc973533.jpg'),
(150, 22, 'assets/capitulos/proyecto_9/capitulo_50.1/2b31dd3227894c8fa53f997030f6e4a32d7a295e331947c684352cc661583ed0.jpg'),
(151, 22, 'assets/capitulos/proyecto_9/capitulo_50.1/daf8429bda664e45b0d59e9a759493c35b2ff4b1ebb04051b9a404383e267549.jpg'),
(152, 22, 'assets/capitulos/proyecto_9/capitulo_50.1/bb4e072e6df14ae49bc5c66ef669ed95020285cbf7f54cfba1e999641e3a0759.jpg'),
(153, 22, 'assets/capitulos/proyecto_9/capitulo_50.1/354db44f4b2949bf8fd1ece1d230d134182b8da39b8f4ae0b063fb2000017e6d.jpg'),
(154, 22, 'assets/capitulos/proyecto_9/capitulo_50.1/1ae4cf81982240d29ead629fcb6b6bfae7a500d0b5b7400191ebe217aaba0f76.jpg'),
(155, 22, 'assets/capitulos/proyecto_9/capitulo_50.1/ded25e5090bf4d8a86ebfd61bd75823175a71ae0ce7d438fa9667d756654ea7e.jpg'),
(156, 22, 'assets/capitulos/proyecto_9/capitulo_50.1/bbc8b57b0ba64814a9d997b96a99dc7605ac3385f6bf423eaecc577067bbc509.jpg'),
(157, 22, 'assets/capitulos/proyecto_9/capitulo_50.1/31db3fe3d86042c2b7bb0a3cecf015d082a573244717472b8655e883739e6f13.jpg'),
(158, 22, 'assets/capitulos/proyecto_9/capitulo_50.1/96e17009eb8147a591a17787416e2055a4d290b4583945c19d32bcb9bf737ed9.jpg'),
(159, 22, 'assets/capitulos/proyecto_9/capitulo_50.1/778aff4d5adf41bc82319fd8445196fbe9a968481ea24358b9ff8272a5af6b5f.jpg'),
(160, 22, 'assets/capitulos/proyecto_9/capitulo_50.1/b7bf92f48186409ab973f561aa31ea53a74aa589eb704e0d84cd7a83440083e6.jpg'),
(161, 22, 'assets/capitulos/proyecto_9/capitulo_50.1/d5343b3e2b5e4531b7abdab02927e6bb4bc674bd9fe545078955ba0edf112c82.jpg'),
(162, 22, 'assets/capitulos/proyecto_9/capitulo_50.1/045f2e591c304f05a9201d4659e67b09e5c2fbce813848e1a72cacb67ffb2b6d.jpg'),
(163, 22, 'assets/capitulos/proyecto_9/capitulo_50.1/6b61f643288c4b28ad3165be67c5800f9153fe422f2b474aac5764f40667556c.jpg'),
(164, 22, 'assets/capitulos/proyecto_9/capitulo_50.1/8a455defc313468897fc7d552479acf759a556891a3e48389ade3623f2003730.jpg');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `projects`
--

CREATE TABLE `projects` (
  `project_id` int(11) NOT NULL,
  `name` varchar(45) NOT NULL,
  `secondary_name` varchar(255) NOT NULL,
  `description` text NOT NULL,
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
(6, 'Proyecto 2', 'Ejemplo', 'Ejemplo de prouyecto para biblioteca d eusuairo', 'Steffi', '', '2024-09-12 00:45:53', '2024-09-12 00:45:53', 'EcK_fltqBXp0_89eHSYK.png', 2, 1, 'manhua', 'Para todas las edades', 0),
(7, 'otro proyecto m-as ', 'asdasd', 'asdasdasd', 'Sarten', '', '2024-09-12 00:46:17', '2024-09-12 00:46:17', 'BdBbMaaZGUdRtU8U8fXh.jpg', 3, 1, 'manga', 'Para todas las edades', 0),
(8, 'Steffi', 'svrtxn', 'Ssdasdasdadadasdsadasda', 'steeffi', '', '2024-09-12 11:53:37', '2024-09-12 11:53:37', 'gTosuokekivQ1eew39sY.jpg', 2, 1, 'manhwa', 'Para todas las edades', 0),
(9, 'Ryser', 'raizer', 'Proyecto jajas', 'sarten', '', '2024-09-12 12:10:47', '2024-09-12 12:10:47', 'rsDYteoVSJzEHB5WM42y.png', 1, 1, 'manhua', '+18', 0),
(10, 'w', 'w', 'ww', 'yo', '', '2024-09-13 21:58:57', '2024-09-13 21:58:57', 'fjSiw8nu8NPEPOzAPPEN.png', 3, 1, 'manga', 'Para todas las edades', 0),
(11, 'Proyecto Prueba Catg', 'Categorias', '@projects_routes.route(\'/admin/biblioteca\', methods=[\'GET\', \'POST\'])\r\ndef formAddProjects():\r\n    if request.method == \'POST\':\r\n        # Obtener datos del formulario\r\n        name = request.form[\'name\']\r\n        secondary_name = request.form[\'secondary_name\']\r\n        description = request.form[\'description\']\r\n        author = request.form[\'author\']\r\n        created_at = datetime.now()\r\n        updated_at = datetime.now()\r\n        status = request.form[\'status\']\r\n        type = request.form[\'type\']\r\n        rating = request.form[\'rating\']\r\n        \r\n        # Obtener las categorías seleccionadas\r\n        categories = request.form.getlist(\'categories\')\r\n\r\n        # Manejo del archivo de portada\r\n        file = request.files.get(\'covered\')\r\n        if file and file.filename:\r\n            nuevoNombre = recibe_file(file)\r\n        else:\r\n            return render_template(\'admin/pages/projects/biblioteca.html\', msjAlert=\'Debe seleccionar una portada.\', typeAlert=0)\r\n\r\n        # Registrar el proyecto\r\n        result, project_id = registrar_proyecto(name, secondary_name, description, author, \'\', created_at, updated_at, nuevoNombre, status, 1, type, rating, 0)\r\n        if result == 1:\r\n            # Registrar las categorías en una función separada\r\n            if categories:\r\n                registrar_categorias_proyecto(project_id, categories)\r\n\r\n            return redirect(url_for(\'projects.formAddProjects\'))\r\n        else:\r\n            return render_template(\'admin/pages/projects/biblioteca.html\', msjAlert=\'Error al subir la portada.\', typeAlert=0)\r\n\r\n    projects = list_projects()\r\n    return render_template(\'admin/pages/projects/biblioteca.html\', miData=projects)\r\n@projects_routes.route(\'/admin/biblioteca\', methods=[\'GET\', \'POST\'])\r\ndef formAddProjects():\r\n    if request.method == \'POST\':\r\n        # Obtener datos del formulario\r\n        name = request.form[\'name\']\r\n        secondary_name = request.form[\'secondary_name\']\r\n        description = request.form[\'description\']\r\n        author = request.form[\'author\']\r\n        created_at = datetime.now()\r\n        updated_at = datetime.now()\r\n        status = request.form[\'status\']\r\n        type = request.form[\'type\']\r\n        rating = request.form[\'rating\']\r\n        \r\n        # Obtener las categorías seleccionadas\r\n        categories = request.form.getlist(\'categories\')\r\n\r\n        # Manejo del archivo de portada\r\n        file = request.files.get(\'covered\')\r\n        if file and file.filename:\r\n            nuevoNombre = recibe_file(file)\r\n        else:\r\n            return render_template(\'admin/pages/projects/biblioteca.html\', msjAlert=\'Debe seleccionar una portada.\', typeAlert=0)\r\n\r\n        # Registrar el proyecto\r\n        result, project_id = registrar_proyecto(name, secondary_name, description, author, \'\', created_at, updated_at, nuevoNombre, status, 1, type, rating, 0)\r\n        if result == 1:\r\n            # Registrar las categorías en una función separada\r\n            if categories:\r\n                registrar_categorias_proyecto(project_id, categories)\r\n\r\n            return redirect(url_for(\'projects.formAddProjects\'))\r\n        else:\r\n            return render_template(\'admin/pages/projects/biblioteca.html\', msjAlert=\'Error al subir la portada.\', typeAlert=0)\r\n\r\n    projects = list_projects()\r\n    return render_template(\'admin/pages/projects/biblioteca.html\', miData=projects)\r\n', 'YO', '', '2024-09-13 23:00:19', '2024-09-13 23:00:19', 'hngGvtSKBunRv1Q1Dp5t.jpg', 1, 1, 'manga', '+18', 0),
(12, 'sdbnmmm', 'mmmm', 'mmmmmmmmm@projects_routes.route(\'/admin/biblioteca\', methods=[\'GET\', \'POST\'])\r\ndef formAddProjects():\r\n    if request.method == \'POST\':\r\n        # Obtener datos del formulario\r\n        name = request.form[\'name\']\r\n        secondary_name = request.form[\'secondary_name\']\r\n        description = request.form[\'description\']\r\n        author = request.form[\'author\']\r\n        created_at = datetime.now()\r\n        updated_at = datetime.now()\r\n        status = request.form[\'status\']\r\n        type = request.form[\'type\']\r\n        rating = request.form[\'rating\']\r\n        \r\n        # Obtener las categorías seleccionadas\r\n        categories = request.form.getlist(\'categories\')\r\n\r\n        # Manejo del archivo de portada\r\n        file = request.files.get(\'covered\')\r\n        if file and file.filename:\r\n            nuevoNombre = recibe_file(file)\r\n        else:\r\n            return render_template(\'admin/pages/projects/biblioteca.html\', msjAlert=\'Debe seleccionar una portada.\', typeAlert=0)\r\n\r\n        # Registrar el proyecto\r\n        result, project_id = registrar_proyecto(name, secondary_name, description, author, \'\', created_at, updated_at, nuevoNombre, status, 1, type, rating, 0)\r\n        if result == 1:\r\n            # Registrar las categorías en una función separada\r\n            if categories:\r\n                registrar_categorias_proyecto(project_id, categories)\r\n\r\n            return redirect(url_for(\'projects.formAddProjects\'))\r\n        else:\r\n            return render_template(\'admin/pages/projects/biblioteca.html\', msjAlert=\'Error al subir la portada.\', typeAlert=0)\r\n\r\n    projects = list_projects()\r\n    return render_template(\'admin/pages/projects/biblioteca.html\', miData=projects)\r\n', 'mmmmm', '', '2024-09-13 23:02:50', '2024-09-13 23:02:50', 'SncxkTf5QgyYPmI1FjFS.jpg', 1, 1, 'manga', '+18', 0),
(13, 'sdbnmmm', 'mmmm', 'mmmmmmmmm@projects_routes.route(\'/admin/biblioteca\', methods=[\'GET\', \'POST\'])\r\ndef formAddProjects():\r\n    if request.method == \'POST\':\r\n        # Obtener datos del formulario\r\n        name = request.form[\'name\']\r\n        secondary_name = request.form[\'secondary_name\']\r\n        description = request.form[\'description\']\r\n        author = request.form[\'author\']\r\n        created_at = datetime.now()\r\n        updated_at = datetime.now()\r\n        status = request.form[\'status\']\r\n        type = request.form[\'type\']\r\n        rating = request.form[\'rating\']\r\n        \r\n        # Obtener las categorías seleccionadas\r\n        categories = request.form.getlist(\'categories\')\r\n\r\n        # Manejo del archivo de portada\r\n        file = request.files.get(\'covered\')\r\n        if file and file.filename:\r\n            nuevoNombre = recibe_file(file)\r\n        else:\r\n            return render_template(\'admin/pages/projects/biblioteca.html\', msjAlert=\'Debe seleccionar una portada.\', typeAlert=0)\r\n\r\n        # Registrar el proyecto\r\n        result, project_id = registrar_proyecto(name, secondary_name, description, author, \'\', created_at, updated_at, nuevoNombre, status, 1, type, rating, 0)\r\n        if result == 1:\r\n            # Registrar las categorías en una función separada\r\n            if categories:\r\n                registrar_categorias_proyecto(project_id, categories)\r\n\r\n            return redirect(url_for(\'projects.formAddProjects\'))\r\n        else:\r\n            return render_template(\'admin/pages/projects/biblioteca.html\', msjAlert=\'Error al subir la portada.\', typeAlert=0)\r\n\r\n    projects = list_projects()\r\n    return render_template(\'admin/pages/projects/biblioteca.html\', miData=projects)\r\n', 'mmmmm', '', '2024-09-13 23:03:20', '2024-09-13 23:03:20', 'BkpKK1murs4pX_H4kS2d.jpg', 1, 1, 'manga', '+18', 0),
(14, 'a', 'a', 'a', 'a', '', '2024-09-13 23:04:48', '2024-09-13 23:04:48', '6rF2122I_vFbDV_v79Oj.jpg', 1, 1, 'manga', '+18', 0);

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
(8, 'adminZonaDeLirio', 'steffi.ryser.t@gmail.com', 'scrypt:32768:8:1$s42fRIAyeTgjaWmP$5a7ab556a54d7ffa5d3847b72733f17625ebcc1007bcc79737549c175f2ec3e8fd27cce1a6a74faf455eea556d20635616c14288e5f10a5bbec1ae34db4c38c4', 1, '2024-10-01 15:28:15');

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
  MODIFY `chapter_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=23;

--
-- AUTO_INCREMENT de la tabla `groups`
--
ALTER TABLE `groups`
  MODIFY `group_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de la tabla `images`
--
ALTER TABLE `images`
  MODIFY `image_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=165;

--
-- AUTO_INCREMENT de la tabla `projects`
--
ALTER TABLE `projects`
  MODIFY `project_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT de la tabla `roles`
--
ALTER TABLE `roles`
  MODIFY `role_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de la tabla `users`
--
ALTER TABLE `users`
  MODIFY `user_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
