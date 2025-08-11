-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Servidor: localhost
-- Tiempo de generación: 11-08-2025 a las 13:44:55
-- Versión del servidor: 10.11.0-MariaDB
-- Versión de PHP: 8.3.4

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `cotizadordavid`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `product_renders`
--

CREATE TABLE `product_renders` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `product_id` bigint(20) UNSIGNED NOT NULL,
  `image_1` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `image_2` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `image_3` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `image_4` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `image_5` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `image_6` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `image_7` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `image_8` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `image_9` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `product_renders`
--

INSERT INTO `product_renders` (`id`, `product_id`, `image_1`, `image_2`, `image_3`, `image_4`, `image_5`, `image_6`, `image_7`, `image_8`, `image_9`, `created_at`, `updated_at`) VALUES
(5, 3, NULL, NULL, NULL, NULL, '/render/render_3_5.png', '/render/render_3_6.png', '/render/render_3_7.png', NULL, NULL, '2025-08-08 13:25:35', '2025-08-08 15:17:18'),
(6, 58, NULL, NULL, NULL, NULL, '/render/render_58_5.png', '/render/render_58_6.png', '/render/render_58_7.png', NULL, NULL, '2025-08-08 13:33:44', '2025-08-08 15:05:33'),
(7, 59, NULL, NULL, NULL, NULL, '/render/render_59_5.png', '/render/render_59_6.png', '/render/render_59_7.png', '/render/render_59_8.png', NULL, '2025-08-08 13:34:18', '2025-08-08 15:36:13'),
(8, 60, NULL, NULL, NULL, NULL, '/render/render_60_5.png', '/render/render_60_6.png', '/render/render_60_7.png', '/render/render_60_8.png', NULL, '2025-08-08 13:34:31', '2025-08-08 15:06:02'),
(9, 31, NULL, NULL, NULL, NULL, '/render/render_31_5.png', '/render/render_31_6.png', '/render/render_31_7.png', NULL, NULL, '2025-08-08 13:38:14', '2025-08-08 15:12:21'),
(10, 32, NULL, NULL, NULL, NULL, '/render/render_32_5.png', '/render/render_32_6.png', '/render/render_32_7.png', NULL, NULL, '2025-08-08 13:38:35', '2025-08-08 15:12:35'),
(11, 28, NULL, NULL, NULL, NULL, '/render/render_28_5.png', '/render/render_28_6.png', '/render/render_28_7.png', NULL, NULL, '2025-08-08 13:38:49', '2025-08-08 15:12:53'),
(12, 30, NULL, NULL, NULL, NULL, '/render/render_30_5.png', '/render/render_30_6.png', '/render/render_30_7.png', NULL, NULL, '2025-08-08 13:39:01', '2025-08-08 15:13:07'),
(13, 29, NULL, NULL, NULL, NULL, '/render/render_29_5.png', '/render/render_29_6.png', '/render/render_29_7.png', NULL, NULL, '2025-08-08 13:39:16', '2025-08-08 15:13:18'),
(14, 26, NULL, NULL, NULL, NULL, '/render/render_26_5.png', '/render/render_26_6.png', '/render/render_26_7.png', '/render/render_26_8.png', NULL, '2025-08-08 13:42:30', '2025-08-08 15:14:50'),
(15, 27, NULL, NULL, NULL, NULL, '/render/render_27_5.png', '/render/render_27_6.png', '/render/render_27_7.png', '/render/render_27_8.png', NULL, '2025-08-08 13:42:42', '2025-08-08 15:15:05'),
(16, 23, NULL, NULL, NULL, NULL, '/render/render_23_5.png', '/render/render_23_6.png', '/render/render_23_7.png', NULL, NULL, '2025-08-08 13:42:54', '2025-08-08 15:15:15'),
(17, 25, NULL, NULL, NULL, NULL, '/render/render_25_5.png', '/render/render_25_6.png', '/render/render_25_7.png', NULL, NULL, '2025-08-08 13:43:11', '2025-08-08 15:15:28'),
(18, 24, NULL, NULL, NULL, NULL, '/render/render_24_5.png', '/render/render_24_6.png', '/render/render_24_7.png', NULL, NULL, '2025-08-08 13:43:22', '2025-08-08 15:15:39'),
(19, 4, NULL, NULL, NULL, NULL, '/render/render_4_5.png', '/render/render_4_6.png', '/render/render_4_7.png', NULL, NULL, '2025-08-08 13:46:17', '2025-08-08 15:17:35'),
(20, 5, NULL, NULL, NULL, NULL, '/render/render_5_5.png', '/render/render_5_6.png', '/render/render_5_7.png', NULL, NULL, '2025-08-08 13:46:29', '2025-08-08 15:17:44'),
(21, 6, NULL, NULL, NULL, NULL, '/render/render_6_5.png', '/render/render_6_6.png', '/render/render_6_7.png', NULL, NULL, '2025-08-08 13:46:41', '2025-08-08 15:17:54'),
(22, 7, NULL, NULL, NULL, NULL, '/render/render_7_5.png', '/render/render_7_6.png', '/render/render_7_7.png', NULL, NULL, '2025-08-08 13:46:52', '2025-08-08 15:18:09'),
(23, 8, NULL, NULL, NULL, NULL, '/render/render_8_5.png', '/render/render_8_6.png', '/render/render_8_7.png', NULL, NULL, '2025-08-08 13:47:02', '2025-08-11 10:57:30'),
(24, 51, NULL, NULL, NULL, NULL, '/render/render_51_5.png', '/render/render_51_6.png', '/render/render_51_7.png', NULL, NULL, '2025-08-08 13:48:32', '2025-08-08 15:18:44'),
(25, 52, NULL, NULL, NULL, NULL, '/render/render_52_5.png', '/render/render_52_6.png', '/render/render_52_7.png', NULL, NULL, '2025-08-08 13:48:43', '2025-08-08 15:18:59'),
(26, 53, NULL, NULL, NULL, NULL, '/render/render_53_5.png', '/render/render_53_6.png', NULL, '/render/render_53_8.png', NULL, '2025-08-08 13:48:52', '2025-08-08 15:19:12'),
(27, 54, NULL, NULL, NULL, NULL, '/render/render_54_5.png', '/render/render_54_6.png', '/render/render_54_7.png', NULL, NULL, '2025-08-08 13:49:25', '2025-08-08 15:20:04'),
(28, 55, NULL, NULL, NULL, NULL, '/render/render_55_5.png', '/render/render_55_6.png', '/render/render_55_7.png', NULL, NULL, '2025-08-08 13:49:36', '2025-08-08 15:20:15'),
(29, 56, NULL, NULL, NULL, NULL, '/render/render_56_5.png', '/render/render_56_6.png', '/render/render_56_7.png', '/render/render_56_8.png', NULL, '2025-08-08 13:50:04', '2025-08-08 15:20:26'),
(30, 57, NULL, NULL, NULL, NULL, '/render/render_57_5.png', '/render/render_57_6.png', '/render/render_57_7.png', NULL, NULL, '2025-08-08 13:50:14', '2025-08-08 15:20:44'),
(31, 74, NULL, NULL, NULL, NULL, NULL, NULL, '/render/render_74_7.png', NULL, NULL, '2025-08-08 14:03:38', '2025-08-08 14:03:38'),
(32, 75, NULL, NULL, NULL, NULL, NULL, NULL, '/render/render_75_7.png', NULL, NULL, '2025-08-08 14:19:49', '2025-08-08 14:19:49'),
(33, 76, NULL, NULL, NULL, NULL, NULL, NULL, '/render/render_76_7.png', NULL, NULL, '2025-08-08 14:20:03', '2025-08-08 14:20:03'),
(34, 71, NULL, NULL, NULL, NULL, NULL, '/render/render_71_6.png', '/render/render_71_7.png', NULL, NULL, '2025-08-08 14:20:55', '2025-08-08 15:04:13'),
(35, 72, NULL, NULL, NULL, NULL, NULL, '/render/render_72_6.png', '/render/render_72_7.png', NULL, NULL, '2025-08-08 14:21:08', '2025-08-08 15:04:25'),
(36, 73, NULL, NULL, NULL, NULL, NULL, '/render/render_73_6.png', '/render/render_73_7.png', NULL, NULL, '2025-08-08 14:21:17', '2025-08-08 15:04:35'),
(37, 61, NULL, NULL, NULL, NULL, NULL, '/render/render_61_6.png', '/render/render_61_7.png', NULL, NULL, '2025-08-08 14:33:08', '2025-08-08 15:06:22'),
(38, 62, NULL, NULL, NULL, NULL, NULL, '/render/render_62_6.png', '/render/render_62_7.png', NULL, NULL, '2025-08-08 14:33:19', '2025-08-08 15:06:38'),
(39, 63, NULL, NULL, NULL, NULL, NULL, '/render/render_63_6.png', '/render/render_63_7.png', NULL, NULL, '2025-08-08 14:33:31', '2025-08-08 15:06:54'),
(40, 64, NULL, NULL, NULL, NULL, NULL, '/render/render_64_6.png', '/render/render_64_7.png', NULL, NULL, '2025-08-08 14:33:45', '2025-08-08 15:07:08'),
(41, 16, NULL, NULL, NULL, NULL, NULL, '/render/render_16_6.png', NULL, NULL, NULL, '2025-08-08 15:08:07', '2025-08-08 15:08:07'),
(42, 17, NULL, NULL, NULL, NULL, NULL, '/render/render_17_6.png', NULL, NULL, NULL, '2025-08-08 15:08:22', '2025-08-08 15:08:22'),
(43, 18, NULL, NULL, NULL, NULL, NULL, '/render/render_18_6.png', NULL, NULL, NULL, '2025-08-08 15:08:32', '2025-08-08 15:08:32'),
(44, 13, NULL, NULL, NULL, NULL, NULL, '/render/render_13_6.png', NULL, NULL, NULL, '2025-08-08 15:10:41', '2025-08-08 15:10:41'),
(45, 14, NULL, NULL, NULL, NULL, '/render/render_14_5.png', '/render/render_14_6.png', NULL, NULL, NULL, '2025-08-08 15:10:56', '2025-08-08 15:24:37'),
(46, 15, NULL, NULL, NULL, NULL, NULL, '/render/render_15_6.png', NULL, NULL, NULL, '2025-08-08 15:11:06', '2025-08-08 15:11:06');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `product_renders`
--
ALTER TABLE `product_renders`
  ADD PRIMARY KEY (`id`),
  ADD KEY `product_renders_product_id_foreign` (`product_id`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `product_renders`
--
ALTER TABLE `product_renders`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=47;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `product_renders`
--
ALTER TABLE `product_renders`
  ADD CONSTRAINT `product_renders_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
