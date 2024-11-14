-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Servidor: localhost
-- Tiempo de generación: 14-11-2024 a las 06:10:50
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
  `fechaInversion` datetime NOT NULL,
  `fechaRetorno` datetime NOT NULL,
  `status` text CHARACTER SET utf8mb4 COLLATE utf8mb4_spanish_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish_ci;

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
(10, '2034', 'Casa Nueva', 'La casa de tus sueños no necesita una descripcion', '2035-01-01', 'Casa.jpg'),
(11, '2020', 'pelo', 'pelo de el brian limpio', '2026-01-01', 'mil.png');

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
(1, '2darien Alexis Murguia carrillo', '2daniel.armenta1765@alumnos.udg.mx', 'scrypt:32768:8:1$arlH8o6wkmzMaZqh$e36a470a8d80b41c66143069d24737205b1254c3fa9b8859eaa10b0774f4c3681b2177d2c2035ed47238d3544d02c55288b3f20764122005d0f0977113ce9622', '2024-10-30 12:16:26', 'U'),
(2, 'darien Alexis Murguia carrillo', 'keit@gmail.com', 'scrypt:32768:8:1$kJmPTiQGUYXgCg5l$019409d12667762774bf047e275e483bdeb1e1f0e3f3a0c6de89c6d088399ecf1bbe377888ab3359031eaef313fd6972b30f51ae37fefdd94df92e8ae868ab63', '2024-10-30 12:16:46', 'U'),
(3, 'Kanet Sahid Ochoa Guzmán', 'kanet.ochoa1921@alumnos.udg.mx', 'scrypt:32768:8:1$bXUWDjkp7qnb7Uwc$4956b6058541b4b8e99e034b69423646a8c2a11100dd16be526d4c387cfb9e6d18bcc8f94ad6221fb73a4fd4bd194d7f8dd7342fb0ec7e7d573377cf6ef200c0', '2024-10-30 12:20:57', 'A'),
(4, '', '', 'scrypt:32768:8:1$juO46JpCWtKlnZNi$94ba3ba9cc3524360b041d6e981b83363832f25165fcbf92e6f5e307dcf7822d51e6f8e386d443ae6cdece06d3598dd58e923a7ee0d6181e4bdfd25f74d1674e', '2024-11-07 10:54:22', 'A');

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
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

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
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT de la tabla `usuario`
--
ALTER TABLE `usuario`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

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
