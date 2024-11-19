-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 08-11-2024 a las 20:20:10
-- Versión del servidor: 10.4.32-MariaDB
-- Versión de PHP: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `junta_de_agua`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `configuracion`
--

CREATE TABLE `configuracion` (
  `id` int(11) NOT NULL,
  `parametro` varchar(50) NOT NULL,
  `valor` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `configuracion`
--

INSERT INTO `configuracion` (`id`, `parametro`, `valor`) VALUES
(1, 'tarifa', 'Tarifa mensual estándar'),
(2, 'periodo de pago', 'mes');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `contribuyentes`
--

CREATE TABLE `contribuyentes` (
  `id` int(11) NOT NULL,
  `nombre` varchar(100) NOT NULL,
  `apellido` varchar(100) NOT NULL,
  `direccion` varchar(255) NOT NULL,
  `telefono` varchar(20) NOT NULL,
  `correo_electronico` varchar(100) DEFAULT NULL,
  `estado` enum('activo','inactivo') CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT 'activo'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `contribuyentes`
--

INSERT INTO `contribuyentes` (`id`, `nombre`, `apellido`, `direccion`, `telefono`, `correo_electronico`, `estado`) VALUES
(1, 'juan', 'pere', 'calle 123, ciudad x', '34343434', 'juan.perez@example.com', 'activo'),
(2, 'maria', 'soto', 'av. principal 456, ciudad y', '555-5678', 'maria.soto@example.com', 'activo'),
(3, 'carlos', 'diaz', 'barrio norte 789, ciudad z', '555-9012', NULL, 'inactivo');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pagos`
--

CREATE TABLE `pagos` (
  `id` int(11) NOT NULL,
  `id_contribuyente` int(11) NOT NULL,
  `monto_pago` decimal(10,2) NOT NULL,
  `fecha_pago` date NOT NULL,
  `periodo_pago` enum('mes','trimestre','semestre','anual') NOT NULL,
  `fecha_vencimiento` date NOT NULL,
  `id_tarifa` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `pagos`
--

INSERT INTO `pagos` (`id`, `id_contribuyente`, `monto_pago`, `fecha_pago`, `periodo_pago`, `fecha_vencimiento`, `id_tarifa`) VALUES
(1, 1, 100.00, '2024-01-15', 'mes', '2024-02-15', 1),
(2, 2, 270.00, '2024-01-10', 'trimestre', '2024-04-10', 2),
(3, 3, 1000.00, '2024-01-05', 'anual', '2025-01-05', 3),
(5, 1, 100.00, '2024-10-01', 'mes', '2024-10-31', 1),
(6, 1, 100.00, '2024-10-01', 'mes', '2024-10-30', 1),
(7, 1, 100.00, '2024-10-01', 'mes', '2024-10-30', 1),
(9, 1, 100.00, '2024-11-01', 'mes', '2024-11-07', 1),
(10, 1, 270.00, '2024-11-01', 'trimestre', '2024-11-03', 2),
(11, 1, 100.00, '2024-11-02', 'mes', '2024-11-03', 1),
(12, 1, 100.00, '2024-11-01', 'mes', '2024-11-22', 1),
(13, 1, 270.00, '2024-11-01', 'trimestre', '2024-11-22', 2);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `registro_de_usuarios`
--

CREATE TABLE `registro_de_usuarios` (
  `nombre_usuario` varchar(100) NOT NULL,
  `sector` varchar(200) NOT NULL,
  `telefono` varchar(30) NOT NULL,
  `email` varchar(40) NOT NULL,
  `lote` varchar(400) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tarifas`
--

CREATE TABLE `tarifas` (
  `id` int(11) NOT NULL,
  `descripcion` varchar(255) NOT NULL,
  `monto_tarifa` decimal(10,2) NOT NULL,
  `periodo_pago` enum('mes','trimestre','semestre','anual') NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `tarifas`
--

INSERT INTO `tarifas` (`id`, `descripcion`, `monto_tarifa`, `periodo_pago`) VALUES
(1, 'Tarifa mensual estandar', 100.00, 'mes'),
(2, 'Tarifa trimestral premium', 270.00, 'trimestre'),
(3, 'Tarifa anual con descuento', 1000.00, 'anual');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuarios`
--

CREATE TABLE `usuarios` (
  `id` int(11) NOT NULL,
  `nombre_usuario` varchar(50) NOT NULL,
  `sector` varchar(100) NOT NULL,
  `telefono` varchar(100) NOT NULL,
  `email` varchar(100) NOT NULL,
  `lote` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `usuarios`
--

INSERT INTO `usuarios` (`id`, `nombre_usuario`, `sector`, `telefono`, `email`, `lote`) VALUES
(1, 'admin', '', '', '', ''),
(2, 'encargado', '', '', '', '');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `configuracion`
--
ALTER TABLE `configuracion`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `contribuyentes`
--
ALTER TABLE `contribuyentes`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `pagos`
--
ALTER TABLE `pagos`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_contribuyente` (`id_contribuyente`),
  ADD KEY `id_tarifa` (`id_tarifa`);

--
-- Indices de la tabla `registro_de_usuarios`
--
ALTER TABLE `registro_de_usuarios`
  ADD PRIMARY KEY (`lote`);

--
-- Indices de la tabla `tarifas`
--
ALTER TABLE `tarifas`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `usuarios`
--
ALTER TABLE `usuarios`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `configuracion`
--
ALTER TABLE `configuracion`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `contribuyentes`
--
ALTER TABLE `contribuyentes`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de la tabla `pagos`
--
ALTER TABLE `pagos`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT de la tabla `tarifas`
--
ALTER TABLE `tarifas`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de la tabla `usuarios`
--
ALTER TABLE `usuarios`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `pagos`
--
ALTER TABLE `pagos`
  ADD CONSTRAINT `pagos_ibfk_1` FOREIGN KEY (`id_contribuyente`) REFERENCES `contribuyentes` (`id`),
  ADD CONSTRAINT `pagos_ibfk_2` FOREIGN KEY (`id_tarifa`) REFERENCES `tarifas` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
