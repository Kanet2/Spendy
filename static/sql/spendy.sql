-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Servidor: localhost
-- Tiempo de generación: 29-11-2024 a las 04:05:26
-- Versión del servidor: 8.0.40
-- Versión de PHP: 8.1.30

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `spendy`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `inversiones`
--

CREATE TABLE `inversiones` (
  `id` int NOT NULL,
  `userId` int NOT NULL,
  `amount` int NOT NULL,
  `plazo` int NOT NULL,
  `fechaInversion` date NOT NULL,
  `status` varchar(1) COLLATE utf8mb4_spanish_ci NOT NULL DEFAULT 'I'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish_ci;

--
-- Volcado de datos para la tabla `inversiones`
--

INSERT INTO `inversiones` (`id`, `userId`, `amount`, `plazo`, `fechaInversion`, `status`) VALUES
(444, 4, 200332, 4, '2024-11-01', 'A'),
(445, 24, 700, 1, '2024-11-28', 'I');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `opcionesdeinversion`
--

CREATE TABLE `opcionesdeinversion` (
  `id` int NOT NULL,
  `cantidadMinima` int NOT NULL,
  `cantidadMaxima` int NOT NULL,
  `tasaDeInteres` int NOT NULL,
  `tiempoPlazo` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `retornos`
--

CREATE TABLE `retornos` (
  `id` int NOT NULL,
  `inversionesId` int NOT NULL,
  `cantidadRetorno` int NOT NULL,
  `fechaRetorno` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `rifasanuales`
--

CREATE TABLE `rifasanuales` (
  `id` int NOT NULL,
  `anio` year NOT NULL,
  `premio` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_spanish_ci NOT NULL,
  `descripcion` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_spanish_ci NOT NULL,
  `fechaEntrega` date NOT NULL,
  `imag` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_spanish_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish_ci;

--
-- Volcado de datos para la tabla `rifasanuales`
--

INSERT INTO `rifasanuales` (`id`, `anio`, `premio`, `descripcion`, `fechaEntrega`, `imag`) VALUES
(1, '2025', 'Mil Pesos', 'Mil pesos Mexicanos en efectivo.', '2026-01-01', 'mil.png'),
(2, '2026', 'Xbox Series S', 'Una Xbox Series S totalmente Nueva.', '2027-01-01', 'Xbox.jpg'),
(3, '2027', 'Bicicleta', 'Bicicleta nueva color naranja de buena calidad.', '2028-01-01', 'Bici.jpg'),
(4, '2028', 'Moto Nueva', 'Moto Yamaha con 0km, y con papeles listos.', '2029-01-01', 'Moto.jpg'),
(5, '2029', '25Mil Pesos', 'VeinticicoMil pesos Mexicanos en efectivo.', '2030-01-01', 'mil.png'),
(6, '2030', 'IPhone 20', 'El IPhone mas nuevo hasta el dia de hoy.', '2031-01-01', 'IPhone.jpeg'),
(7, '2031', 'Tsuru Tuneado', 'Tsuru tuneado dportivo nuevo del año 2029.', '2032-01-01', 'Tsuru.jpg'),
(8, '2032', '100Mil Pesos', 'CienMil pesos Mexicanos en efectivo.', '2033-01-01', 'mil.png'),
(9, '2033', '500Mil Pesos', 'QuinientosMil pesos Mexicanos en efectivo.', '2034-01-01', 'mil.png'),
(10, '2032', 'Casa Nuevas', 'Tus sueños no necesita una desc.', '2035-01-05', 'Casa.jpg'),
(14, '2032', 'chupones de fierro', 'un chupoong aca bien filoosmn', '2017-01-09', 'Xbox.jpg');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuario`
--

CREATE TABLE `usuario` (
  `id` int NOT NULL,
  `nombre` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_spanish_ci NOT NULL,
  `correo` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_spanish_ci NOT NULL,
  `clave` varchar(200) CHARACTER SET utf8mb3 COLLATE utf8mb3_spanish_ci NOT NULL,
  `fechareg` datetime NOT NULL,
  `perfil` char(1) CHARACTER SET utf8mb3 COLLATE utf8mb3_spanish_ci NOT NULL DEFAULT 'U'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_spanish_ci;

--
-- Volcado de datos para la tabla `usuario`
--

INSERT INTO `usuario` (`id`, `nombre`, `correo`, `clave`, `fechareg`, `perfil`) VALUES
(3, 'Kanet Sahid Ochoa Guzmán', 'kanet.ochoa1921@alumnos.udg.mx', 'scrypt:32768:8:1$jUVM8uz0JwrXfxbc$6a7fc0e8ca07e7e025da56692110269ae892ca489ffea63c99c1d45b5fecf7ac734e01b5337dddf0e45e33bdaa0808279d97c5f167763acde7dec087d857b453', '2024-11-25 18:17:03', 'A'),
(4, '', '', 'scrypt:32768:8:1$plKxNF9awDUC6WLm$50343bae1dc630bbf6134d5e7f8b4537b5f9f427c8c346e43cbf29b7966bd63caf4e6da6450c163d49595475c09818387f28370607f207badd34cfb19fc2ad18', '2024-11-20 21:20:02', 'A'),
(6, 'Kanet Sahid', 'tilinesaf@gmail.com', 'scrypt:32768:8:1$UslMP2Eg5KOStIbG$1fc93c0f748d984facfb66ae8330de9fe60f5636f4cabfa8654f000dea5a87b230d071163496590c04590051679c7dbc1ee2b6cb723a1a6000be74ec3612a31b', '2024-11-21 19:13:22', 'U'),
(8, 'Kanet Sahid', 'tilinesaddf@gmail.com', 'scrypt:32768:8:1$18ugITcyeU4MIuWL$cab13c37be6bdbb86f8a042f4bf303a4b83a0ffe4359af103446891eb00830295ae3619b41a8deb3a1acad9fd68eb041473fa9c88c6dbc31765a450119c67601', '2024-11-21 19:14:13', 'U'),
(10, 'Kanet Sahid', 'tilinesadafdf@gmail.com', 'scrypt:32768:8:1$PJkxwjLCFtPqMolH$d136e026790f2e8eae90eb9eb3e5b573c30d7d17c7a00748bb0ff821553dc09e549da691613ae83cb91dbd8024a4b55d3368723ee124db997f16aebcb24f3564', '2024-11-21 19:16:16', 'U'),
(15, 'knet', 'kanet.ochoa19221@alumnos.udg.mx', 'scrypt:32768:8:1$4zN1Vaqvw75fALHA$af7b8b18f040ad979383fdcbb0ad63518624ab90000fb8731770ede35b988e3ec55fa4046bd350e2b3541460c9c68b6789ed5c54ca49938904f7d5bb8d3b8756', '2024-11-25 18:11:45', 'U'),
(17, 'pipi', 'angelasilva@gmail.com', 'scrypt:32768:8:1$8iuW1jwYTwFAzbtj$12e25564c6fed6cf5d13451530a1ca33be70bfb4299a25623ac631d033b2be44c881e7c7c6c521aa958ba3c60940113df23e54fe585cc19b088004873925a16b', '2024-11-25 18:16:33', 'U'),
(24, 'Kanet Sahidssss', 'kanetsahid@gmail.com', 'scrypt:32768:8:1$j4Hn1VUeu1aFdO0R$ce998f3a326097fcc66941ae354537c3cb52d47aeb6f7ffaf7a7be3826694f0febcda07bc579df23947403a4fc66daa2d6a5f2ab8c4a936cd8ea18a57f444e43', '2024-11-28 21:36:29', 'U');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `inversiones`
--
ALTER TABLE `inversiones`
  ADD PRIMARY KEY (`id`),
  ADD KEY `userId` (`userId`);

--
-- Indices de la tabla `opcionesdeinversion`
--
ALTER TABLE `opcionesdeinversion`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `retornos`
--
ALTER TABLE `retornos`
  ADD PRIMARY KEY (`id`),
  ADD KEY `inversionesId` (`inversionesId`);

--
-- Indices de la tabla `rifasanuales`
--
ALTER TABLE `rifasanuales`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `usuario`
--
ALTER TABLE `usuario`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `correo_2` (`correo`),
  ADD KEY `correo` (`correo`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `inversiones`
--
ALTER TABLE `inversiones`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=446;

--
-- AUTO_INCREMENT de la tabla `opcionesdeinversion`
--
ALTER TABLE `opcionesdeinversion`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `retornos`
--
ALTER TABLE `retornos`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `rifasanuales`
--
ALTER TABLE `rifasanuales`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT de la tabla `usuario`
--
ALTER TABLE `usuario`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=26;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `inversiones`
--
ALTER TABLE `inversiones`
  ADD CONSTRAINT `inversiones_ibfk_1` FOREIGN KEY (`userId`) REFERENCES `usuario` (`id`) ON UPDATE CASCADE;

--
-- Filtros para la tabla `retornos`
--
ALTER TABLE `retornos`
  ADD CONSTRAINT `retornos_ibfk_1` FOREIGN KEY (`inversionesId`) REFERENCES `inversiones` (`id`) ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
