-- phpMyAdmin SQL Dump
-- version 5.2.2
-- https://www.phpmyadmin.net/
--
-- Servidor: localhost
-- Tiempo de generación: 23-09-2025 a las 21:07:29
-- Versión del servidor: 8.0.43-34
-- Versión de PHP: 8.2.29

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `dbhz5rtdbo0sgk`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `base_images`
--

CREATE TABLE `base_images` (
  `id` bigint UNSIGNED NOT NULL,
  `style` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `path` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `overlay` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `order` int NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `base_images`
--

INSERT INTO `base_images` (`id`, `style`, `path`, `overlay`, `order`, `created_at`, `updated_at`) VALUES
(1, 'Minimalista', '/baseMinimalista/fachadaA/01-F.jpg', NULL, 1, NULL, NULL),
(2, 'Minimalista', '/baseMinimalista/fachadaA/02-R.jpg', NULL, 2, NULL, NULL),
(3, 'Minimalista', '/baseMinimalista/fachadaA/03L.jpg', NULL, 3, NULL, NULL),
(4, 'Minimalista', '/baseMinimalista/fachadaA/04-B.jpg', NULL, 4, NULL, NULL),
(5, 'Minimalista', '/baseMinimalista/MINIMALISTA-SALA-BASE.jpg', 'baseMinimalista/PISOS/Cocina/COCINA-M01.png', 5, NULL, NULL),
(6, 'Minimalista', '/baseMinimalista/MINIMALISTA-COCINA-BASE.jpg', 'baseMinimalista/PISOS/Recamara/CUARTO-M01.png', 6, NULL, NULL),
(7, 'Minimalista', '/baseMinimalista/MINIMALISTA-RECAMARA-BASE.jpg', 'baseMinimalista/PISOS/Sala/SALA-M01.png', 7, NULL, NULL),
(8, 'Minimalista', '/baseMinimalista/MINIMALISTA-Bano-BASE.jpg', 'baseMinimalista/PISOS/Sala/SALA-M01.png', 8, NULL, NULL),
(9, 'Mexicano', '/bases/01-MEX-Frontal-BASE.jpg', NULL, 1, NULL, NULL),
(10, 'Mexicano', '/bases/02-MEX-Derecha-BASE.jpg', NULL, 2, NULL, NULL),
(11, 'Mexicano', '/bases/04-MEX-izquierda-BASE.jpg', NULL, 3, NULL, NULL),
(12, 'Mexicano', '/bases/03-Mex-Trasera-BASE.jpg', NULL, 4, NULL, NULL),
(13, 'Mexicano', '/bases/05-MEX-Sala.webp', NULL, 5, NULL, NULL),
(14, 'Mexicano', '/bases/06-MEX-Cocina.webp', NULL, 6, NULL, NULL),
(15, 'Mexicano', '/bases/07-MEX-Recamara-Base.webp', NULL, 7, NULL, NULL),
(16, 'Mexicano', '/bases/08-MEX-Baño-Base.webp', NULL, 8, NULL, NULL),
(17, 'Tulum', '/bases/01-MEX-Frontal-BASE.jpg', NULL, 1, NULL, NULL),
(18, 'Tulum', '/bases/02-MEX-Derecha-BASE.jpg', NULL, 2, NULL, NULL),
(19, 'Tulum', '/bases/04-MEX-izquierda-BASE.jpg', NULL, 3, NULL, NULL),
(20, 'Tulum', '/bases/03-Mex-Trasera-BASE.jpg', NULL, 4, NULL, NULL),
(21, 'Tulum', '/bases/05-tulum.webp', NULL, 5, NULL, NULL),
(22, 'Tulum', '/bases/06-tulum.webp', NULL, 6, NULL, NULL),
(23, 'Tulum', '/bases/07-tulum.webp', NULL, 7, NULL, NULL),
(24, 'Tulum', '/bases/08-tulum.webp', NULL, 8, NULL, NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `base_prices`
--

CREATE TABLE `base_prices` (
  `id` bigint UNSIGNED NOT NULL,
  `style` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `price` decimal(12,2) NOT NULL,
  `image_url` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `cache`
--

CREATE TABLE `cache` (
  `key` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `value` mediumtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `expiration` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `cache_locks`
--

CREATE TABLE `cache_locks` (
  `key` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `owner` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `expiration` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `categories`
--

CREATE TABLE `categories` (
  `id` bigint UNSIGNED NOT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `style` enum('Minimalista','Tulum','Mexicano') CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `orden` int NOT NULL DEFAULT '0',
  `is_active` tinyint(1) NOT NULL DEFAULT '1',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `categories`
--

INSERT INTO `categories` (`id`, `name`, `style`, `orden`, `is_active`, `created_at`, `updated_at`) VALUES
(1, 'Fachada', 'Tulum', 1, 1, '2025-08-08 07:25:06', '2025-08-08 07:25:06'),
(2, 'Pisos Interiores', 'Tulum', 6, 1, '2025-08-08 07:25:06', '2025-08-08 07:25:06'),
(3, 'Pisos Regaderas', 'Tulum', 16, 1, '2025-08-08 07:25:06', '2025-08-08 07:25:06'),
(4, 'Meseta Cocina', 'Tulum', 11, 1, '2025-08-08 07:25:06', '2025-08-08 07:25:06'),
(5, 'Mesetas Baños', 'Tulum', 17, 1, '2025-08-08 07:25:06', '2025-08-08 07:25:06'),
(6, 'Muros Regaderas', 'Tulum', 18, 1, '2025-08-08 07:25:06', '2025-08-08 07:25:06'),
(7, 'Muros Interiores Base', 'Tulum', 7, 1, '2025-08-08 07:25:06', '2025-08-08 07:25:06'),
(8, 'Muros Interiores Acento', 'Tulum', 8, 1, '2025-08-08 07:25:06', '2025-08-08 07:25:06'),
(9, 'Muros Exterior Base', 'Tulum', 2, 1, '2025-08-08 07:25:06', '2025-08-08 07:25:06'),
(10, 'Muros Exteriores Acento 01', 'Tulum', 3, 1, '2025-08-08 07:25:06', '2025-08-08 07:25:06'),
(11, 'Muros Exteriores Acento 02', 'Tulum', 4, 1, '2025-08-08 07:25:06', '2025-08-08 07:25:06'),
(12, 'Basamento', 'Tulum', 5, 1, '2025-08-08 07:25:06', '2025-08-08 07:25:06'),
(13, 'Plafones', 'Tulum', 9, 1, '2025-08-08 07:25:06', '2025-08-08 07:25:06'),
(14, 'Puertas', 'Tulum', 12, 1, '2025-08-08 07:25:06', '2025-08-08 07:25:06'),
(15, 'Cancelería', 'Tulum', 10, 1, '2025-08-08 07:25:06', '2025-08-08 07:25:06'),
(16, 'Carpintería', 'Tulum', 14, 1, '2025-08-08 07:25:06', '2025-08-08 07:25:06'),
(17, 'Grifería y accesorios de baño', 'Tulum', 19, 1, '2025-08-08 07:25:06', '2025-08-08 07:25:06'),
(18, 'Accesorios Eléctricos', 'Tulum', 20, 1, '2025-08-08 07:25:06', '2025-08-08 07:25:06'),
(19, 'Accesorios Puertas', 'Tulum', 13, 1, '2025-08-08 07:25:06', '2025-08-08 07:25:06'),
(20, 'Accesorio Closets', 'Tulum', 15, 1, '2025-08-08 07:25:06', '2025-08-08 07:25:06'),
(21, 'Fachada', 'Minimalista', 1, 1, '2025-08-08 07:25:06', '2025-08-08 07:25:06'),
(22, 'Pisos Interiores', 'Minimalista', 5, 1, '2025-08-08 07:25:06', '2025-08-08 07:25:06'),
(23, 'Pisos Regaderas', 'Minimalista', 15, 1, '2025-08-08 07:25:06', '2025-08-08 07:25:06'),
(24, 'Meseta Cocina', 'Minimalista', 10, 1, '2025-08-08 07:25:06', '2025-08-08 07:25:06'),
(25, 'Mesetas Baños', 'Minimalista', 16, 1, '2025-08-08 07:25:06', '2025-08-08 07:25:06'),
(26, 'Muros Regaderas', 'Minimalista', 17, 1, '2025-08-08 07:25:06', '2025-08-08 07:25:06'),
(27, 'Muros Interiores Base', 'Minimalista', 6, 1, '2025-08-08 07:25:06', '2025-08-08 07:25:06'),
(28, 'Muros Interiores Acento', 'Minimalista', 7, 1, '2025-08-08 07:25:06', '2025-08-08 07:25:06'),
(29, 'Muros Exterior Base', 'Minimalista', 2, 1, '2025-08-08 07:25:06', '2025-08-08 07:25:06'),
(30, 'Muros Exteriores Acento 01', 'Minimalista', 3, 1, '2025-08-08 07:25:06', '2025-08-08 07:25:06'),
(31, 'Muros Exteriores Acento 02', 'Minimalista', 4, 1, '2025-08-08 07:25:06', '2025-08-08 07:25:06'),
(32, 'Plafones', 'Minimalista', 8, 1, '2025-08-08 07:25:06', '2025-08-08 07:25:06'),
(33, 'Puertas', 'Minimalista', 11, 1, '2025-08-08 07:25:06', '2025-08-08 07:25:06'),
(34, 'Cancelería', 'Minimalista', 9, 1, '2025-08-08 07:25:06', '2025-08-08 07:25:06'),
(35, 'Carpintería', 'Minimalista', 13, 1, '2025-08-08 07:25:06', '2025-08-08 07:25:06'),
(36, 'Griferia y Accesorios de Baño', 'Minimalista', 18, 1, '2025-08-08 07:25:06', '2025-08-08 07:25:06'),
(37, 'Accesorios Eléctricos', 'Minimalista', 19, 1, '2025-08-08 07:25:06', '2025-08-08 07:25:06'),
(38, 'Accesorios Puertas', 'Minimalista', 12, 1, '2025-08-08 07:25:06', '2025-08-08 07:25:06'),
(39, 'Accesorio Closets', 'Minimalista', 14, 1, '2025-08-08 07:25:06', '2025-08-08 07:25:06'),
(40, 'Pisos Interiores', 'Mexicano', 4, 1, '2025-08-26 12:08:14', '2025-08-26 12:08:14'),
(41, 'Pisos Regaderas', 'Mexicano', 14, 1, '2025-08-26 12:08:15', '2025-08-26 12:08:15'),
(42, 'Meseta Cocina', 'Mexicano', 9, 1, '2025-08-26 12:08:15', '2025-08-26 12:08:15'),
(43, 'Mesetas Baños', 'Mexicano', 15, 1, '2025-08-26 12:08:15', '2025-08-26 12:08:15'),
(44, 'Muros Regaderas', 'Mexicano', 16, 1, '2025-08-26 12:08:15', '2025-08-26 12:08:15'),
(45, 'Muros Interiores Base', 'Mexicano', 5, 1, '2025-08-26 12:08:15', '2025-08-26 12:08:15'),
(46, 'Muros Interiores Acento', 'Mexicano', 6, 1, '2025-08-26 12:08:15', '2025-08-26 12:08:15'),
(47, 'Muros Exterior Base', 'Mexicano', 2, 1, '2025-08-26 12:08:15', '2025-08-26 12:08:15'),
(48, 'Muros Exterior Acento 01', 'Mexicano', 3, 1, '2025-08-26 12:08:15', '2025-08-26 12:08:15'),
(49, 'Plafones', 'Mexicano', 7, 1, '2025-08-26 12:08:15', '2025-08-26 12:08:15'),
(50, 'Puertas', 'Mexicano', 10, 1, '2025-08-26 12:08:15', '2025-08-26 12:08:15'),
(51, 'Cancelería', 'Mexicano', 8, 1, '2025-08-26 12:08:15', '2025-08-26 12:08:15'),
(52, 'Cocinas, Closet y Muebles Bajo Cubierta', 'Mexicano', 13, 0, '2025-08-26 12:08:15', '2025-08-26 12:08:15'),
(53, 'Grifería y Accesorios de Baño', 'Mexicano', 17, 1, '2025-08-26 12:08:15', '2025-08-26 12:08:15'),
(54, 'Accesorios Eléctricos', 'Mexicano', 18, 1, '2025-08-26 12:08:15', '2025-08-26 12:08:15'),
(55, 'Accesorios Puertas', 'Mexicano', 11, 1, '2025-08-26 12:08:15', '2025-08-26 12:08:15'),
(56, 'Accesorios Closets', 'Mexicano', 13, 1, '2025-08-26 12:08:15', '2025-08-26 12:08:15'),
(57, 'Carpintería', 'Mexicano', 12, 1, '2025-09-10 04:38:40', '2025-09-10 04:38:40'),
(58, 'Fachada', 'Mexicano', 1, 1, '2025-09-03 06:46:52', '2025-09-05 06:46:52');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `failed_jobs`
--

CREATE TABLE `failed_jobs` (
  `id` bigint UNSIGNED NOT NULL,
  `uuid` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `connection` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `house_configurations`
--

CREATE TABLE `house_configurations` (
  `id` char(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` bigint UNSIGNED NOT NULL,
  `configuration` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  `status` enum('Guardada','Solicitada') CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'Guardada',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ;

--
-- Volcado de datos para la tabla `house_configurations`
--

INSERT INTO `house_configurations` (`id`, `user_id`, `configuration`, `status`, `created_at`, `updated_at`) VALUES
('1c979d69-dfba-40fc-a91d-fe61159ad719', 1, '{\"Habitaciones\":{\"id\":\"1Recamara\",\"categoria\":\"Habitaciones\",\"valor\":\"1 Rec\\u00e1mara\",\"precio\":0},\"collapse-21\":{\"categoria\":\"Fachada\",\"id\":\"1\",\"renders\":\"null\",\"valor\":\"Fachada A\",\"precio\":544,\"pre_code\":\"FAC01\",\"variant_code\":\"FA01\"},\"collapse-22\":{\"categoria\":\"Pisos Interiores\",\"id\":\"8\",\"renders\":\"{\\\"id\\\":23,\\\"product_id\\\":8,\\\"image_1\\\":null,\\\"image_2\\\":null,\\\"image_3\\\":null,\\\"image_4\\\":null,\\\"image_5\\\":\\\"\\\\\\/render\\\\\\/render_8_5.webp\\\",\\\"image_6\\\":null,\\\"image_7\\\":\\\"\\\\\\/render\\\\\\/render_8_7.webp\\\",\\\"image_8\\\":\\\"\\\\\\/render\\\\\\/render_8_8.webp\\\",\\\"image_9\\\":null,\\\"created_at\\\":\\\"2025-08-08T12:47:02.000000Z\\\",\\\"updated_at\\\":\\\"2025-08-12T08:04:25.000000Z\\\"}\",\"valor\":\"CER\\u00c1MICO TIPO CEMENTO MODELO CREATO COLOR GRAFITO. FORMATO 60X120\",\"precio\":359,\"pre_code\":\"PIN01\",\"variant_code\":\"M06\"},\"collapse-27\":{\"categoria\":\"Muros Interiores Base\",\"id\":\"25\",\"renders\":\"{\\\"id\\\":17,\\\"product_id\\\":25,\\\"image_1\\\":null,\\\"image_2\\\":null,\\\"image_3\\\":null,\\\"image_4\\\":null,\\\"image_5\\\":\\\"\\\\\\/render\\\\\\/render_25_5.webp\\\",\\\"image_6\\\":\\\"\\\\\\/render\\\\\\/render_25_6.webp\\\",\\\"image_7\\\":\\\"\\\\\\/render\\\\\\/render_25_7.webp\\\",\\\"image_8\\\":\\\"\\\\\\/render\\\\\\/render_25_8.webp\\\",\\\"image_9\\\":null,\\\"created_at\\\":\\\"2025-08-08T12:43:11.000000Z\\\",\\\"updated_at\\\":\\\"2025-08-12T08:01:32.000000Z\\\"}\",\"valor\":\"PLASTER BLANCO SASCAB\",\"precio\":50,\"pre_code\":\"MIB01\",\"variant_code\":\"T04\"},\"collapse-28\":{\"categoria\":\"Muros Interiores Acento\",\"id\":\"29\",\"renders\":\"{\\\"id\\\":13,\\\"product_id\\\":29,\\\"image_1\\\":null,\\\"image_2\\\":null,\\\"image_3\\\":null,\\\"image_4\\\":null,\\\"image_5\\\":\\\"\\\\\\/render\\\\\\/render_29_5.webp\\\",\\\"image_6\\\":\\\"\\\\\\/render\\\\\\/render_29_6.webp\\\",\\\"image_7\\\":\\\"\\\\\\/render\\\\\\/render_29_7.webp\\\",\\\"image_8\\\":null,\\\"image_9\\\":null,\\\"created_at\\\":\\\"2025-08-08T12:39:16.000000Z\\\",\\\"updated_at\\\":\\\"2025-08-08T14:13:18.000000Z\\\"}\",\"valor\":\"PLASTER CONCRETO APARENTE\",\"precio\":50,\"pre_code\":\"MIA01\",\"variant_code\":\"T05\"},\"collapse-32\":{\"categoria\":\"Plafones\",\"id\":\"52\",\"renders\":\"{\\\"id\\\":25,\\\"product_id\\\":52,\\\"image_1\\\":null,\\\"image_2\\\":null,\\\"image_3\\\":null,\\\"image_4\\\":null,\\\"image_5\\\":\\\"\\\\\\/render\\\\\\/render_52_5.webp\\\",\\\"image_6\\\":\\\"\\\\\\/render\\\\\\/render_52_6.webp\\\",\\\"image_7\\\":\\\"\\\\\\/render\\\\\\/render_52_7.webp\\\",\\\"image_8\\\":\\\"\\\\\\/render\\\\\\/render_52_8.webp\\\",\\\"image_9\\\":null,\\\"created_at\\\":\\\"2025-08-08T12:48:43.000000Z\\\",\\\"updated_at\\\":\\\"2025-08-12T08:05:40.000000Z\\\"}\",\"valor\":\"Plaster Concreto Aparente\",\"precio\":290,\"pre_code\":\"PLA01\",\"variant_code\":\"T02\"},\"collapse-34\":{\"categoria\":\"Canceler\\u00eda\",\"id\":\"58\",\"renders\":\"{\\\"id\\\":6,\\\"product_id\\\":58,\\\"image_1\\\":null,\\\"image_2\\\":null,\\\"image_3\\\":null,\\\"image_4\\\":null,\\\"image_5\\\":\\\"\\\\\\/render\\\\\\/render_58_5.webp\\\",\\\"image_6\\\":\\\"\\\\\\/render\\\\\\/render_58_6.webp\\\",\\\"image_7\\\":\\\"\\\\\\/render\\\\\\/render_58_7.webp\\\",\\\"image_8\\\":\\\"\\\\\\/render\\\\\\/render_58_8.webp\\\",\\\"image_9\\\":null,\\\"created_at\\\":\\\"2025-08-08T12:33:44.000000Z\\\",\\\"updated_at\\\":\\\"2025-08-12T07:59:06.000000Z\\\"}\",\"valor\":\"Perfil de Aluminio Color Negro\",\"precio\":0,\"pre_code\":\"CAN01\",\"variant_code\":\"T01\"},\"collapse-24\":{\"categoria\":\"Meseta Cocina\",\"id\":\"13\",\"renders\":\"{\\\"id\\\":44,\\\"product_id\\\":13,\\\"image_1\\\":null,\\\"image_2\\\":null,\\\"image_3\\\":null,\\\"image_4\\\":null,\\\"image_5\\\":null,\\\"image_6\\\":\\\"\\\\\\/render\\\\\\/render_13_6.webp\\\",\\\"image_7\\\":null,\\\"image_8\\\":null,\\\"image_9\\\":null,\\\"created_at\\\":\\\"2025-08-08T14:10:41.000000Z\\\",\\\"updated_at\\\":\\\"2025-08-08T14:10:41.000000Z\\\"}\",\"valor\":\"Granito Itaunas Pulido\",\"precio\":675,\"pre_code\":\"MCO01\",\"variant_code\":\"T01\"},\"collapse-33\":{\"categoria\":\"Puertas\",\"id\":\"54\",\"renders\":\"{\\\"id\\\":27,\\\"product_id\\\":54,\\\"image_1\\\":null,\\\"image_2\\\":null,\\\"image_3\\\":null,\\\"image_4\\\":null,\\\"image_5\\\":\\\"\\\\\\/render\\\\\\/render_54_5.webp\\\",\\\"image_6\\\":\\\"\\\\\\/render\\\\\\/render_54_6.webp\\\",\\\"image_7\\\":\\\"\\\\\\/render\\\\\\/render_54_7.webp\\\",\\\"image_8\\\":\\\"\\\\\\/render\\\\\\/render_54_8.webp\\\",\\\"image_9\\\":null,\\\"created_at\\\":\\\"2025-08-08T12:49:25.000000Z\\\",\\\"updated_at\\\":\\\"2025-08-12T08:06:51.000000Z\\\"}\",\"valor\":\"Tambor de Triplay de Encino Nogal\",\"precio\":7300,\"pre_code\":\"PUE01\",\"variant_code\":\"T01\"},\"collapse-38\":{\"categoria\":\"Accesorios Puertas\",\"id\":\"71\",\"renders\":\"{\\\"id\\\":34,\\\"product_id\\\":71,\\\"image_1\\\":null,\\\"image_2\\\":null,\\\"image_3\\\":null,\\\"image_4\\\":null,\\\"image_5\\\":null,\\\"image_6\\\":\\\"\\\\\\/render\\\\\\/render_71_6.webp\\\",\\\"image_7\\\":\\\"\\\\\\/render\\\\\\/render_71_7.webp\\\",\\\"image_8\\\":\\\"\\\\\\/render\\\\\\/render_71_8.webp\\\",\\\"image_9\\\":null,\\\"created_at\\\":\\\"2025-08-08T13:20:55.000000Z\\\",\\\"updated_at\\\":\\\"2025-08-12T07:55:40.000000Z\\\"}\",\"valor\":\"Acabado Aluminio Satinado\",\"precio\":0,\"pre_code\":\"APU01\",\"variant_code\":\"T01\"},\"collapse-35\":{\"categoria\":\"Carpinter\\u00eda\",\"id\":\"61\",\"renders\":\"{\\\"id\\\":37,\\\"product_id\\\":61,\\\"image_1\\\":null,\\\"image_2\\\":null,\\\"image_3\\\":null,\\\"image_4\\\":null,\\\"image_5\\\":null,\\\"image_6\\\":\\\"\\\\\\/render\\\\\\/render_61_6.webp\\\",\\\"image_7\\\":\\\"\\\\\\/render\\\\\\/render_61_7.webp\\\",\\\"image_8\\\":\\\"\\\\\\/render\\\\\\/render_61_8.webp\\\",\\\"image_9\\\":null,\\\"created_at\\\":\\\"2025-08-08T13:33:08.000000Z\\\",\\\"updated_at\\\":\\\"2025-08-12T07:59:56.000000Z\\\"}\",\"valor\":\"Tablero de MDF o MDP Laminado Tipo Roble\",\"precio\":0,\"pre_code\":\"CAR01\",\"variant_code\":\"T02\"},\"collapse-39\":{\"categoria\":\"Accesorio Closets\",\"id\":\"74\",\"renders\":\"{\\\"id\\\":31,\\\"product_id\\\":74,\\\"image_1\\\":null,\\\"image_2\\\":null,\\\"image_3\\\":null,\\\"image_4\\\":null,\\\"image_5\\\":null,\\\"image_6\\\":null,\\\"image_7\\\":\\\"\\\\\\/render\\\\\\/render_74_7.webp\\\",\\\"image_8\\\":null,\\\"image_9\\\":null,\\\"created_at\\\":\\\"2025-08-08T13:03:38.000000Z\\\",\\\"updated_at\\\":\\\"2025-08-08T13:03:38.000000Z\\\"}\",\"valor\":\"Acabado Aluminio Satinado\",\"precio\":0,\"pre_code\":\"ACL01\",\"variant_code\":\"T01\"},\"collapse-23\":{\"categoria\":\"Pisos Regaderas\",\"id\":\"9\",\"renders\":\"{\\\"id\\\":54,\\\"product_id\\\":9,\\\"image_1\\\":null,\\\"image_2\\\":null,\\\"image_3\\\":null,\\\"image_4\\\":null,\\\"image_5\\\":null,\\\"image_6\\\":null,\\\"image_7\\\":null,\\\"image_8\\\":\\\"\\\\\\/render\\\\\\/render_9_8.webp\\\",\\\"image_9\\\":null,\\\"created_at\\\":\\\"2025-08-12T08:04:40.000000Z\\\",\\\"updated_at\\\":\\\"2025-08-12T08:04:40.000000Z\\\"}\",\"valor\":\"Marmol Blanco Arena Aventejado Mate\",\"precio\":439,\"pre_code\":\"PRE01\",\"variant_code\":\"T01\"},\"collapse-25\":{\"categoria\":\"Mesetas Ba\\u00f1os\",\"id\":\"16\",\"renders\":\"{\\\"id\\\":41,\\\"product_id\\\":16,\\\"image_1\\\":null,\\\"image_2\\\":null,\\\"image_3\\\":null,\\\"image_4\\\":null,\\\"image_5\\\":null,\\\"image_6\\\":null,\\\"image_7\\\":null,\\\"image_8\\\":\\\"\\\\\\/render\\\\\\/render_16_8.webp\\\",\\\"image_9\\\":null,\\\"created_at\\\":\\\"2025-08-08T14:08:07.000000Z\\\",\\\"updated_at\\\":\\\"2025-08-12T05:45:30.000000Z\\\"}\",\"valor\":\"Granito Itaunas Pulido\",\"precio\":675,\"pre_code\":\"MES02\",\"variant_code\":\"T01\"},\"collapse-26\":{\"categoria\":\"Muros Regaderas\",\"id\":\"19\",\"renders\":\"{\\\"id\\\":50,\\\"product_id\\\":19,\\\"image_1\\\":null,\\\"image_2\\\":null,\\\"image_3\\\":null,\\\"image_4\\\":null,\\\"image_5\\\":null,\\\"image_6\\\":null,\\\"image_7\\\":null,\\\"image_8\\\":\\\"\\\\\\/render\\\\\\/render_19_8.webp\\\",\\\"image_9\\\":null,\\\"created_at\\\":\\\"2025-08-12T08:02:06.000000Z\\\",\\\"updated_at\\\":\\\"2025-08-12T08:02:06.000000Z\\\"}\",\"valor\":\"M\\u00c1RMOL BLANCO ARENA PULIDO MATE. FORMATO 30 cm X LARGOS LIBRES\",\"precio\":525,\"pre_code\":\"MRE01\",\"variant_code\":\"T01\"},\"collapse-36\":{\"categoria\":\"Griferia y Accesorios de Ba\\u00f1o\",\"id\":\"65\",\"renders\":\"{\\\"id\\\":47,\\\"product_id\\\":65,\\\"image_1\\\":null,\\\"image_2\\\":null,\\\"image_3\\\":null,\\\"image_4\\\":null,\\\"image_5\\\":null,\\\"image_6\\\":null,\\\"image_7\\\":null,\\\"image_8\\\":\\\"\\\\\\/render\\\\\\/render_65_8.webp\\\",\\\"image_9\\\":null,\\\"created_at\\\":\\\"2025-08-12T07:51:44.000000Z\\\",\\\"updated_at\\\":\\\"2025-08-12T07:51:44.000000Z\\\"}\",\"valor\":\"Grifer\\u00eda y Accesorios Acabado Cromo\",\"precio\":0,\"pre_code\":\"BAN01\",\"variant_code\":\"T01\"},\"collapse-37\":{\"categoria\":\"Accesorios El\\u00e9ctricos\",\"id\":\"68\",\"renders\":\"null\",\"valor\":\"Acabado Satinado\",\"precio\":0,\"pre_code\":\"AEL01\",\"variant_code\":\"T01\"},\"collapse-29\":{\"categoria\":\"Muros Exterior Base\",\"id\":\"33\",\"renders\":\"null\",\"valor\":\"Pintura Blanco Clara\",\"precio\":0,\"pre_code\":\"MEB01\",\"variant_code\":\"T04\"},\"collapse-30\":{\"categoria\":\"Muros Exteriores Acento 01\",\"id\":\"39\",\"renders\":\"null\",\"valor\":\"Pintura Blanco Clara\",\"precio\":0,\"pre_code\":\"MEA01\",\"variant_code\":\"T04\"},\"collapse-31\":{\"categoria\":\"Muros Exteriores Acento 02\",\"id\":\"45\",\"renders\":\"null\",\"valor\":\"Pintura Blanco Clara\",\"precio\":0,\"pre_code\":\"MEA02\",\"variant_code\":\"T04\"}}', 'Guardada', '2025-09-10 08:10:11', '2025-09-10 08:10:11');
INSERT INTO `house_configurations` (`id`, `user_id`, `configuration`, `status`, `created_at`, `updated_at`) VALUES
('4789f303-45f9-43ea-a7d7-35d1631d8085', 2, '{\"Habitaciones\":{\"id\":\"1Recamara\",\"categoria\":\"Habitaciones\",\"valor\":\"1 Rec\\u00e1mara\",\"precio\":0},\"collapse-21\":{\"categoria\":\"Fachada\",\"id\":\"1\",\"renders\":\"null\",\"fachada_renders\":\"[]\",\"valor\":\"Fachada A\",\"precio\":544,\"pre_code\":\"FAC01\",\"variant_code\":\"FA01\"},\"collapse-29\":{\"categoria\":\"Muros Exterior Base\",\"id\":\"36\",\"renders\":\"{\\\"id\\\":123,\\\"product_id\\\":36,\\\"image_1\\\":null,\\\"image_2\\\":null,\\\"image_3\\\":null,\\\"image_4\\\":null,\\\"image_5\\\":null,\\\"image_6\\\":null,\\\"image_7\\\":null,\\\"image_8\\\":null,\\\"image_9\\\":null,\\\"created_at\\\":\\\"2025-09-11T05:17:56.000000Z\\\",\\\"updated_at\\\":\\\"2025-09-11T05:17:56.000000Z\\\"}\",\"fachada_renders\":\"{\\\"Fachada A\\\":{\\\"id\\\":184,\\\"product_id\\\":36,\\\"fachada\\\":\\\"Fachada A\\\",\\\"base_image_1\\\":\\\"\\\\\\/render\\\\\\/render_36_Fachada A_1.webp\\\",\\\"base_image_2\\\":\\\"\\\\\\/render\\\\\\/render_36_Fachada A_2.webp\\\",\\\"base_image_3\\\":\\\"\\\\\\/render\\\\\\/render_36_Fachada A_3.webp\\\",\\\"base_image_4\\\":\\\"\\\\\\/render\\\\\\/render_36_Fachada A_4.png\\\",\\\"created_at\\\":\\\"2025-09-15T06:20:51.000000Z\\\",\\\"updated_at\\\":\\\"2025-09-19T03:00:14.000000Z\\\",\\\"product\\\":{\\\"id\\\":36,\\\"category_id\\\":29,\\\"style\\\":\\\"Minimalista\\\",\\\"pre_code\\\":\\\"MEB01\\\",\\\"variant_code\\\":\\\"M04\\\",\\\"version\\\":\\\"00\\\",\\\"title\\\":\\\"Masilla Concreto Estriado\\\",\\\"description\\\":null,\\\"brand\\\":\\\"KIMIKOLOR\\\",\\\"base_price\\\":0,\\\"image_url\\\":\\\"Minimalista\\\\\\/8 Muros Exterior Base\\\\\\/Masilla Concreto Estriado.png\\\",\\\"product_url\\\":null,\\\"one_bedroom_price\\\":0,\\\"two_bedroom_price\\\":0,\\\"three_bedroom_price\\\":0,\\\"four_bedroom_price\\\":0,\\\"created_at\\\":\\\"2025-08-08T02:25:06.000000Z\\\",\\\"updated_at\\\":\\\"2025-09-16T05:31:11.000000Z\\\"}},\\\"Fachada B\\\":{\\\"id\\\":199,\\\"product_id\\\":36,\\\"fachada\\\":\\\"Fachada B\\\",\\\"base_image_1\\\":\\\"\\\\\\/render\\\\\\/render_36_Fachada B_1.webp\\\",\\\"base_image_2\\\":\\\"\\\\\\/render\\\\\\/render_36_Fachada B_2.webp\\\",\\\"base_image_3\\\":\\\"\\\\\\/render\\\\\\/render_36_Fachada B_3.webp\\\",\\\"base_image_4\\\":\\\"\\\\\\/render\\\\\\/render_36_Fachada B_4.webp\\\",\\\"created_at\\\":\\\"2025-09-15T06:41:12.000000Z\\\",\\\"updated_at\\\":\\\"2025-09-15T07:04:12.000000Z\\\",\\\"product\\\":{\\\"id\\\":36,\\\"category_id\\\":29,\\\"style\\\":\\\"Minimalista\\\",\\\"pre_code\\\":\\\"MEB01\\\",\\\"variant_code\\\":\\\"M04\\\",\\\"version\\\":\\\"00\\\",\\\"title\\\":\\\"Masilla Concreto Estriado\\\",\\\"description\\\":null,\\\"brand\\\":\\\"KIMIKOLOR\\\",\\\"base_price\\\":0,\\\"image_url\\\":\\\"Minimalista\\\\\\/8 Muros Exterior Base\\\\\\/Masilla Concreto Estriado.png\\\",\\\"product_url\\\":null,\\\"one_bedroom_price\\\":0,\\\"two_bedroom_price\\\":0,\\\"three_bedroom_price\\\":0,\\\"four_bedroom_price\\\":0,\\\"created_at\\\":\\\"2025-08-08T02:25:06.000000Z\\\",\\\"updated_at\\\":\\\"2025-09-16T05:31:11.000000Z\\\"}},\\\"Fachada 2A\\\":{\\\"id\\\":221,\\\"product_id\\\":36,\\\"fachada\\\":\\\"Fachada 2A\\\",\\\"base_image_1\\\":\\\"\\\\\\/render\\\\\\/render_36_Fachada 2A_1.webp\\\",\\\"base_image_2\\\":\\\"\\\\\\/render\\\\\\/render_36_Fachada 2A_2.webp\\\",\\\"base_image_3\\\":\\\"\\\\\\/render\\\\\\/render_36_Fachada 2A_3.webp\\\",\\\"base_image_4\\\":\\\"\\\\\\/render\\\\\\/render_36_Fachada 2A_4.webp\\\",\\\"created_at\\\":\\\"2025-09-15T07:09:22.000000Z\\\",\\\"updated_at\\\":\\\"2025-09-15T07:31:36.000000Z\\\",\\\"product\\\":{\\\"id\\\":36,\\\"category_id\\\":29,\\\"style\\\":\\\"Minimalista\\\",\\\"pre_code\\\":\\\"MEB01\\\",\\\"variant_code\\\":\\\"M04\\\",\\\"version\\\":\\\"00\\\",\\\"title\\\":\\\"Masilla Concreto Estriado\\\",\\\"description\\\":null,\\\"brand\\\":\\\"KIMIKOLOR\\\",\\\"base_price\\\":0,\\\"image_url\\\":\\\"Minimalista\\\\\\/8 Muros Exterior Base\\\\\\/Masilla Concreto Estriado.png\\\",\\\"product_url\\\":null,\\\"one_bedroom_price\\\":0,\\\"two_bedroom_price\\\":0,\\\"three_bedroom_price\\\":0,\\\"four_bedroom_price\\\":0,\\\"created_at\\\":\\\"2025-08-08T02:25:06.000000Z\\\",\\\"updated_at\\\":\\\"2025-09-16T05:31:11.000000Z\\\"}},\\\"Fachada 2B\\\":{\\\"id\\\":249,\\\"product_id\\\":36,\\\"fachada\\\":\\\"Fachada 2B\\\",\\\"base_image_1\\\":\\\"\\\\\\/render\\\\\\/render_36_Fachada 2B_1.webp\\\",\\\"base_image_2\\\":\\\"\\\\\\/render\\\\\\/render_36_Fachada 2B_2.webp\\\",\\\"base_image_3\\\":\\\"\\\\\\/render\\\\\\/render_36_Fachada 2B_3.webp\\\",\\\"base_image_4\\\":\\\"\\\\\\/render\\\\\\/render_36_Fachada 2B_4.webp\\\",\\\"created_at\\\":\\\"2025-09-15T08:34:32.000000Z\\\",\\\"updated_at\\\":\\\"2025-09-15T08:53:30.000000Z\\\",\\\"product\\\":{\\\"id\\\":36,\\\"category_id\\\":29,\\\"style\\\":\\\"Minimalista\\\",\\\"pre_code\\\":\\\"MEB01\\\",\\\"variant_code\\\":\\\"M04\\\",\\\"version\\\":\\\"00\\\",\\\"title\\\":\\\"Masilla Concreto Estriado\\\",\\\"description\\\":null,\\\"brand\\\":\\\"KIMIKOLOR\\\",\\\"base_price\\\":0,\\\"image_url\\\":\\\"Minimalista\\\\\\/8 Muros Exterior Base\\\\\\/Masilla Concreto Estriado.png\\\",\\\"product_url\\\":null,\\\"one_bedroom_price\\\":0,\\\"two_bedroom_price\\\":0,\\\"three_bedroom_price\\\":0,\\\"four_bedroom_price\\\":0,\\\"created_at\\\":\\\"2025-08-08T02:25:06.000000Z\\\",\\\"updated_at\\\":\\\"2025-09-16T05:31:11.000000Z\\\"}},\\\"Fachada 3A\\\":{\\\"id\\\":278,\\\"product_id\\\":36,\\\"fachada\\\":\\\"Fachada 3A\\\",\\\"base_image_1\\\":\\\"\\\\\\/render\\\\\\/render_36_Fachada 3A_1.webp\\\",\\\"base_image_2\\\":\\\"\\\\\\/render\\\\\\/render_36_Fachada 3A_2.webp\\\",\\\"base_image_3\\\":\\\"\\\\\\/render\\\\\\/render_36_Fachada 3A_3.webp\\\",\\\"base_image_4\\\":\\\"\\\\\\/render\\\\\\/render_36_Fachada 3A_4.webp\\\",\\\"created_at\\\":\\\"2025-09-17T03:34:35.000000Z\\\",\\\"updated_at\\\":\\\"2025-09-17T03:34:35.000000Z\\\",\\\"product\\\":{\\\"id\\\":36,\\\"category_id\\\":29,\\\"style\\\":\\\"Minimalista\\\",\\\"pre_code\\\":\\\"MEB01\\\",\\\"variant_code\\\":\\\"M04\\\",\\\"version\\\":\\\"00\\\",\\\"title\\\":\\\"Masilla Concreto Estriado\\\",\\\"description\\\":null,\\\"brand\\\":\\\"KIMIKOLOR\\\",\\\"base_price\\\":0,\\\"image_url\\\":\\\"Minimalista\\\\\\/8 Muros Exterior Base\\\\\\/Masilla Concreto Estriado.png\\\",\\\"product_url\\\":null,\\\"one_bedroom_price\\\":0,\\\"two_bedroom_price\\\":0,\\\"three_bedroom_price\\\":0,\\\"four_bedroom_price\\\":0,\\\"created_at\\\":\\\"2025-08-08T02:25:06.000000Z\\\",\\\"updated_at\\\":\\\"2025-09-16T05:31:11.000000Z\\\"}},\\\"Fachada 3B\\\":{\\\"id\\\":279,\\\"product_id\\\":36,\\\"fachada\\\":\\\"Fachada 3B\\\",\\\"base_image_1\\\":\\\"\\\\\\/render\\\\\\/render_36_Fachada 3B_1.webp\\\",\\\"base_image_2\\\":\\\"\\\\\\/render\\\\\\/render_36_Fachada 3B_2.webp\\\",\\\"base_image_3\\\":\\\"\\\\\\/render\\\\\\/render_36_Fachada 3B_3.webp\\\",\\\"base_image_4\\\":\\\"\\\\\\/render\\\\\\/render_36_Fachada 3B_4.webp\\\",\\\"created_at\\\":\\\"2025-09-17T03:34:35.000000Z\\\",\\\"updated_at\\\":\\\"2025-09-17T03:34:35.000000Z\\\",\\\"product\\\":{\\\"id\\\":36,\\\"category_id\\\":29,\\\"style\\\":\\\"Minimalista\\\",\\\"pre_code\\\":\\\"MEB01\\\",\\\"variant_code\\\":\\\"M04\\\",\\\"version\\\":\\\"00\\\",\\\"title\\\":\\\"Masilla Concreto Estriado\\\",\\\"description\\\":null,\\\"brand\\\":\\\"KIMIKOLOR\\\",\\\"base_price\\\":0,\\\"image_url\\\":\\\"Minimalista\\\\\\/8 Muros Exterior Base\\\\\\/Masilla Concreto Estriado.png\\\",\\\"product_url\\\":null,\\\"one_bedroom_price\\\":0,\\\"two_bedroom_price\\\":0,\\\"three_bedroom_price\\\":0,\\\"four_bedroom_price\\\":0,\\\"created_at\\\":\\\"2025-08-08T02:25:06.000000Z\\\",\\\"updated_at\\\":\\\"2025-09-16T05:31:11.000000Z\\\"}},\\\"Fachada 4A\\\":{\\\"id\\\":280,\\\"product_id\\\":36,\\\"fachada\\\":\\\"Fachada 4A\\\",\\\"base_image_1\\\":\\\"\\\\\\/render\\\\\\/render_36_Fachada 4A_1.webp\\\",\\\"base_image_2\\\":\\\"\\\\\\/render\\\\\\/render_36_Fachada 4A_2.webp\\\",\\\"base_image_3\\\":\\\"\\\\\\/render\\\\\\/render_36_Fachada 4A_3.webp\\\",\\\"base_image_4\\\":\\\"\\\\\\/render\\\\\\/render_36_Fachada 4A_4.webp\\\",\\\"created_at\\\":\\\"2025-09-17T03:34:35.000000Z\\\",\\\"updated_at\\\":\\\"2025-09-17T03:34:35.000000Z\\\",\\\"product\\\":{\\\"id\\\":36,\\\"category_id\\\":29,\\\"style\\\":\\\"Minimalista\\\",\\\"pre_code\\\":\\\"MEB01\\\",\\\"variant_code\\\":\\\"M04\\\",\\\"version\\\":\\\"00\\\",\\\"title\\\":\\\"Masilla Concreto Estriado\\\",\\\"description\\\":null,\\\"brand\\\":\\\"KIMIKOLOR\\\",\\\"base_price\\\":0,\\\"image_url\\\":\\\"Minimalista\\\\\\/8 Muros Exterior Base\\\\\\/Masilla Concreto Estriado.png\\\",\\\"product_url\\\":null,\\\"one_bedroom_price\\\":0,\\\"two_bedroom_price\\\":0,\\\"three_bedroom_price\\\":0,\\\"four_bedroom_price\\\":0,\\\"created_at\\\":\\\"2025-08-08T02:25:06.000000Z\\\",\\\"updated_at\\\":\\\"2025-09-16T05:31:11.000000Z\\\"}}}\",\"valor\":\"Masilla Concreto Estriado\",\"precio\":0,\"pre_code\":\"MEB01\",\"variant_code\":\"M04\"},\"collapse-30\":{\"categoria\":\"Muros Exteriores Acento 01\",\"id\":\"40\",\"renders\":\"null\",\"fachada_renders\":\"{\\\"Fachada A\\\":{\\\"id\\\":191,\\\"product_id\\\":40,\\\"fachada\\\":\\\"Fachada A\\\",\\\"base_image_1\\\":\\\"\\\\\\/render\\\\\\/render_40_Fachada A_1.webp\\\",\\\"base_image_2\\\":\\\"\\\\\\/render\\\\\\/render_40_Fachada A_2.webp\\\",\\\"base_image_3\\\":\\\"\\\\\\/render\\\\\\/render_40_Fachada A_3.webp\\\",\\\"base_image_4\\\":null,\\\"created_at\\\":\\\"2025-09-15T06:23:35.000000Z\\\",\\\"updated_at\\\":\\\"2025-09-15T06:34:00.000000Z\\\",\\\"product\\\":{\\\"id\\\":40,\\\"category_id\\\":30,\\\"style\\\":\\\"Minimalista\\\",\\\"pre_code\\\":\\\"MEA01\\\",\\\"variant_code\\\":\\\"T03\\\",\\\"version\\\":\\\"00\\\",\\\"title\\\":\\\"Plaster Concreto Aparente\\\",\\\"description\\\":null,\\\"brand\\\":\\\"KIMIKOLOR\\\",\\\"base_price\\\":0,\\\"image_url\\\":\\\"Minimalista\\\\\\/9 Muros Exterior Acento 01\\\\\\/Plaster Concreto Aparente.png\\\",\\\"product_url\\\":null,\\\"one_bedroom_price\\\":0,\\\"two_bedroom_price\\\":0,\\\"three_bedroom_price\\\":0,\\\"four_bedroom_price\\\":0,\\\"created_at\\\":\\\"2025-08-08T02:25:06.000000Z\\\",\\\"updated_at\\\":\\\"2025-08-08T02:25:06.000000Z\\\"}},\\\"Fachada B\\\":{\\\"id\\\":213,\\\"product_id\\\":40,\\\"fachada\\\":\\\"Fachada B\\\",\\\"base_image_1\\\":\\\"\\\\\\/render\\\\\\/render_40_Fachada B_1.webp\\\",\\\"base_image_2\\\":\\\"\\\\\\/render\\\\\\/render_40_Fachada B_2.webp\\\",\\\"base_image_3\\\":\\\"\\\\\\/render\\\\\\/render_40_Fachada B_3.webp\\\",\\\"base_image_4\\\":\\\"\\\\\\/render\\\\\\/render_40_Fachada B_4.webp\\\",\\\"created_at\\\":\\\"2025-09-15T06:45:56.000000Z\\\",\\\"updated_at\\\":\\\"2025-09-15T07:05:38.000000Z\\\",\\\"product\\\":{\\\"id\\\":40,\\\"category_id\\\":30,\\\"style\\\":\\\"Minimalista\\\",\\\"pre_code\\\":\\\"MEA01\\\",\\\"variant_code\\\":\\\"T03\\\",\\\"version\\\":\\\"00\\\",\\\"title\\\":\\\"Plaster Concreto Aparente\\\",\\\"description\\\":null,\\\"brand\\\":\\\"KIMIKOLOR\\\",\\\"base_price\\\":0,\\\"image_url\\\":\\\"Minimalista\\\\\\/9 Muros Exterior Acento 01\\\\\\/Plaster Concreto Aparente.png\\\",\\\"product_url\\\":null,\\\"one_bedroom_price\\\":0,\\\"two_bedroom_price\\\":0,\\\"three_bedroom_price\\\":0,\\\"four_bedroom_price\\\":0,\\\"created_at\\\":\\\"2025-08-08T02:25:06.000000Z\\\",\\\"updated_at\\\":\\\"2025-08-08T02:25:06.000000Z\\\"}},\\\"Fachada 2A\\\":{\\\"id\\\":232,\\\"product_id\\\":40,\\\"fachada\\\":\\\"Fachada 2A\\\",\\\"base_image_1\\\":\\\"\\\\\\/render\\\\\\/render_40_Fachada 2A_1.webp\\\",\\\"base_image_2\\\":\\\"\\\\\\/render\\\\\\/render_40_Fachada 2A_2.webp\\\",\\\"base_image_3\\\":\\\"\\\\\\/render\\\\\\/render_40_Fachada 2A_3.webp\\\",\\\"base_image_4\\\":\\\"\\\\\\/render\\\\\\/render_40_Fachada 2A_4.webp\\\",\\\"created_at\\\":\\\"2025-09-15T07:13:00.000000Z\\\",\\\"updated_at\\\":\\\"2025-09-17T03:50:35.000000Z\\\",\\\"product\\\":{\\\"id\\\":40,\\\"category_id\\\":30,\\\"style\\\":\\\"Minimalista\\\",\\\"pre_code\\\":\\\"MEA01\\\",\\\"variant_code\\\":\\\"T03\\\",\\\"version\\\":\\\"00\\\",\\\"title\\\":\\\"Plaster Concreto Aparente\\\",\\\"description\\\":null,\\\"brand\\\":\\\"KIMIKOLOR\\\",\\\"base_price\\\":0,\\\"image_url\\\":\\\"Minimalista\\\\\\/9 Muros Exterior Acento 01\\\\\\/Plaster Concreto Aparente.png\\\",\\\"product_url\\\":null,\\\"one_bedroom_price\\\":0,\\\"two_bedroom_price\\\":0,\\\"three_bedroom_price\\\":0,\\\"four_bedroom_price\\\":0,\\\"created_at\\\":\\\"2025-08-08T02:25:06.000000Z\\\",\\\"updated_at\\\":\\\"2025-08-08T02:25:06.000000Z\\\"}},\\\"Fachada 2B\\\":{\\\"id\\\":263,\\\"product_id\\\":40,\\\"fachada\\\":\\\"Fachada 2B\\\",\\\"base_image_1\\\":\\\"\\\\\\/render\\\\\\/render_40_Fachada 2B_1.webp\\\",\\\"base_image_2\\\":\\\"\\\\\\/render\\\\\\/render_40_Fachada 2B_2.webp\\\",\\\"base_image_3\\\":\\\"\\\\\\/render\\\\\\/render_40_Fachada 2B_3.webp\\\",\\\"base_image_4\\\":\\\"\\\\\\/render\\\\\\/render_40_Fachada 2B_4.webp\\\",\\\"created_at\\\":\\\"2025-09-15T08:37:51.000000Z\\\",\\\"updated_at\\\":\\\"2025-09-15T08:51:45.000000Z\\\",\\\"product\\\":{\\\"id\\\":40,\\\"category_id\\\":30,\\\"style\\\":\\\"Minimalista\\\",\\\"pre_code\\\":\\\"MEA01\\\",\\\"variant_code\\\":\\\"T03\\\",\\\"version\\\":\\\"00\\\",\\\"title\\\":\\\"Plaster Concreto Aparente\\\",\\\"description\\\":null,\\\"brand\\\":\\\"KIMIKOLOR\\\",\\\"base_price\\\":0,\\\"image_url\\\":\\\"Minimalista\\\\\\/9 Muros Exterior Acento 01\\\\\\/Plaster Concreto Aparente.png\\\",\\\"product_url\\\":null,\\\"one_bedroom_price\\\":0,\\\"two_bedroom_price\\\":0,\\\"three_bedroom_price\\\":0,\\\"four_bedroom_price\\\":0,\\\"created_at\\\":\\\"2025-08-08T02:25:06.000000Z\\\",\\\"updated_at\\\":\\\"2025-08-08T02:25:06.000000Z\\\"}},\\\"Fachada 3A\\\":{\\\"id\\\":299,\\\"product_id\\\":40,\\\"fachada\\\":\\\"Fachada 3A\\\",\\\"base_image_1\\\":\\\"\\\\\\/render\\\\\\/render_40_Fachada 3A_1.webp\\\",\\\"base_image_2\\\":\\\"\\\\\\/render\\\\\\/render_40_Fachada 3A_2.webp\\\",\\\"base_image_3\\\":\\\"\\\\\\/render\\\\\\/render_40_Fachada 3A_3.webp\\\",\\\"base_image_4\\\":null,\\\"created_at\\\":\\\"2025-09-17T03:50:35.000000Z\\\",\\\"updated_at\\\":\\\"2025-09-17T03:50:35.000000Z\\\",\\\"product\\\":{\\\"id\\\":40,\\\"category_id\\\":30,\\\"style\\\":\\\"Minimalista\\\",\\\"pre_code\\\":\\\"MEA01\\\",\\\"variant_code\\\":\\\"T03\\\",\\\"version\\\":\\\"00\\\",\\\"title\\\":\\\"Plaster Concreto Aparente\\\",\\\"description\\\":null,\\\"brand\\\":\\\"KIMIKOLOR\\\",\\\"base_price\\\":0,\\\"image_url\\\":\\\"Minimalista\\\\\\/9 Muros Exterior Acento 01\\\\\\/Plaster Concreto Aparente.png\\\",\\\"product_url\\\":null,\\\"one_bedroom_price\\\":0,\\\"two_bedroom_price\\\":0,\\\"three_bedroom_price\\\":0,\\\"four_bedroom_price\\\":0,\\\"created_at\\\":\\\"2025-08-08T02:25:06.000000Z\\\",\\\"updated_at\\\":\\\"2025-08-08T02:25:06.000000Z\\\"}},\\\"Fachada 3B\\\":{\\\"id\\\":300,\\\"product_id\\\":40,\\\"fachada\\\":\\\"Fachada 3B\\\",\\\"base_image_1\\\":\\\"\\\\\\/render\\\\\\/render_40_Fachada 3B_1.webp\\\",\\\"base_image_2\\\":\\\"\\\\\\/render\\\\\\/render_40_Fachada 3B_2.webp\\\",\\\"base_image_3\\\":\\\"\\\\\\/render\\\\\\/render_40_Fachada 3B_3.webp\\\",\\\"base_image_4\\\":\\\"\\\\\\/render\\\\\\/render_40_Fachada 3B_4.webp\\\",\\\"created_at\\\":\\\"2025-09-17T03:50:35.000000Z\\\",\\\"updated_at\\\":\\\"2025-09-17T03:50:35.000000Z\\\",\\\"product\\\":{\\\"id\\\":40,\\\"category_id\\\":30,\\\"style\\\":\\\"Minimalista\\\",\\\"pre_code\\\":\\\"MEA01\\\",\\\"variant_code\\\":\\\"T03\\\",\\\"version\\\":\\\"00\\\",\\\"title\\\":\\\"Plaster Concreto Aparente\\\",\\\"description\\\":null,\\\"brand\\\":\\\"KIMIKOLOR\\\",\\\"base_price\\\":0,\\\"image_url\\\":\\\"Minimalista\\\\\\/9 Muros Exterior Acento 01\\\\\\/Plaster Concreto Aparente.png\\\",\\\"product_url\\\":null,\\\"one_bedroom_price\\\":0,\\\"two_bedroom_price\\\":0,\\\"three_bedroom_price\\\":0,\\\"four_bedroom_price\\\":0,\\\"created_at\\\":\\\"2025-08-08T02:25:06.000000Z\\\",\\\"updated_at\\\":\\\"2025-08-08T02:25:06.000000Z\\\"}},\\\"Fachada 4A\\\":{\\\"id\\\":301,\\\"product_id\\\":40,\\\"fachada\\\":\\\"Fachada 4A\\\",\\\"base_image_1\\\":\\\"\\\\\\/render\\\\\\/render_40_Fachada 4A_1.webp\\\",\\\"base_image_2\\\":\\\"\\\\\\/render\\\\\\/render_40_Fachada 4A_2.webp\\\",\\\"base_image_3\\\":\\\"\\\\\\/render\\\\\\/render_40_Fachada 4A_3.webp\\\",\\\"base_image_4\\\":\\\"\\\\\\/render\\\\\\/render_40_Fachada 4A_4.webp\\\",\\\"created_at\\\":\\\"2025-09-17T03:50:35.000000Z\\\",\\\"updated_at\\\":\\\"2025-09-17T03:50:35.000000Z\\\",\\\"product\\\":{\\\"id\\\":40,\\\"category_id\\\":30,\\\"style\\\":\\\"Minimalista\\\",\\\"pre_code\\\":\\\"MEA01\\\",\\\"variant_code\\\":\\\"T03\\\",\\\"version\\\":\\\"00\\\",\\\"title\\\":\\\"Plaster Concreto Aparente\\\",\\\"description\\\":null,\\\"brand\\\":\\\"KIMIKOLOR\\\",\\\"base_price\\\":0,\\\"image_url\\\":\\\"Minimalista\\\\\\/9 Muros Exterior Acento 01\\\\\\/Plaster Concreto Aparente.png\\\",\\\"product_url\\\":null,\\\"one_bedroom_price\\\":0,\\\"two_bedroom_price\\\":0,\\\"three_bedroom_price\\\":0,\\\"four_bedroom_price\\\":0,\\\"created_at\\\":\\\"2025-08-08T02:25:06.000000Z\\\",\\\"updated_at\\\":\\\"2025-08-08T02:25:06.000000Z\\\"}}}\",\"valor\":\"Plaster Concreto Aparente\",\"precio\":0,\"pre_code\":\"MEA01\",\"variant_code\":\"T03\"},\"collapse-31\":{\"categoria\":\"Muros Exteriores Acento 02\",\"id\":\"45\",\"renders\":\"null\",\"fachada_renders\":\"{\\\"Fachada 2A\\\":{\\\"id\\\":237,\\\"product_id\\\":45,\\\"fachada\\\":\\\"Fachada 2A\\\",\\\"base_image_1\\\":\\\"\\\\\\/render\\\\\\/render_45_Fachada 2A_1.png\\\",\\\"base_image_2\\\":\\\"\\\\\\/render\\\\\\/render_45_Fachada 2A_2.webp\\\",\\\"base_image_3\\\":\\\"\\\\\\/render\\\\\\/render_45_Fachada 2A_3.webp\\\",\\\"base_image_4\\\":\\\"\\\\\\/render\\\\\\/render_45_Fachada 2A_4.webp\\\",\\\"created_at\\\":\\\"2025-09-15T07:13:47.000000Z\\\",\\\"updated_at\\\":\\\"2025-09-16T23:02:53.000000Z\\\",\\\"product\\\":{\\\"id\\\":45,\\\"category_id\\\":31,\\\"style\\\":\\\"Minimalista\\\",\\\"pre_code\\\":\\\"MEA02\\\",\\\"variant_code\\\":\\\"T04\\\",\\\"version\\\":\\\"00\\\",\\\"title\\\":\\\"Pintura Blanco Clara\\\",\\\"description\\\":null,\\\"brand\\\":\\\"COMEX\\\",\\\"base_price\\\":0,\\\"image_url\\\":\\\"Minimalista\\\\\\/10 Muros Exterior Acento 02\\\\\\/Pintura Blanco Clara.png\\\",\\\"product_url\\\":null,\\\"one_bedroom_price\\\":0,\\\"two_bedroom_price\\\":0,\\\"three_bedroom_price\\\":0,\\\"four_bedroom_price\\\":0,\\\"created_at\\\":\\\"2025-08-08T02:25:06.000000Z\\\",\\\"updated_at\\\":\\\"2025-08-08T02:25:06.000000Z\\\"}},\\\"Fachada 3A\\\":{\\\"id\\\":335,\\\"product_id\\\":45,\\\"fachada\\\":\\\"Fachada 3A\\\",\\\"base_image_1\\\":\\\"\\\\\\/render\\\\\\/render_45_Fachada 3A_1.webp\\\",\\\"base_image_2\\\":\\\"\\\\\\/render\\\\\\/render_45_Fachada 3A_2.webp\\\",\\\"base_image_3\\\":\\\"\\\\\\/render\\\\\\/render_45_Fachada 3A_3.webp\\\",\\\"base_image_4\\\":\\\"\\\\\\/render\\\\\\/render_45_Fachada 3A_4.webp\\\",\\\"created_at\\\":\\\"2025-09-17T04:09:23.000000Z\\\",\\\"updated_at\\\":\\\"2025-09-17T04:09:23.000000Z\\\",\\\"product\\\":{\\\"id\\\":45,\\\"category_id\\\":31,\\\"style\\\":\\\"Minimalista\\\",\\\"pre_code\\\":\\\"MEA02\\\",\\\"variant_code\\\":\\\"T04\\\",\\\"version\\\":\\\"00\\\",\\\"title\\\":\\\"Pintura Blanco Clara\\\",\\\"description\\\":null,\\\"brand\\\":\\\"COMEX\\\",\\\"base_price\\\":0,\\\"image_url\\\":\\\"Minimalista\\\\\\/10 Muros Exterior Acento 02\\\\\\/Pintura Blanco Clara.png\\\",\\\"product_url\\\":null,\\\"one_bedroom_price\\\":0,\\\"two_bedroom_price\\\":0,\\\"three_bedroom_price\\\":0,\\\"four_bedroom_price\\\":0,\\\"created_at\\\":\\\"2025-08-08T02:25:06.000000Z\\\",\\\"updated_at\\\":\\\"2025-08-08T02:25:06.000000Z\\\"}}}\",\"valor\":\"Pintura Blanco Clara\",\"precio\":0,\"pre_code\":\"MEA02\",\"variant_code\":\"T04\"},\"collapse-22\":{\"categoria\":\"Pisos Interiores\",\"id\":\"4\",\"renders\":\"{\\\"id\\\":19,\\\"product_id\\\":4,\\\"image_1\\\":null,\\\"image_2\\\":null,\\\"image_3\\\":null,\\\"image_4\\\":null,\\\"image_5\\\":\\\"\\\\\\/render\\\\\\/render_4_5.webp\\\",\\\"image_6\\\":\\\"\\\\\\/render\\\\\\/render_4_6.webp\\\",\\\"image_7\\\":\\\"\\\\\\/render\\\\\\/render_4_7.webp\\\",\\\"image_8\\\":\\\"\\\\\\/render\\\\\\/render_4_8.webp\\\",\\\"image_9\\\":null,\\\"created_at\\\":\\\"2025-08-08T12:46:17.000000Z\\\",\\\"updated_at\\\":\\\"2025-08-12T08:03:43.000000Z\\\"}\",\"fachada_renders\":\"[]\",\"valor\":\"MARMOL SANTO TOM\\u00c1S PULIDO MATE. FORMATO 30 cm x LARGOS LIBRES\",\"precio\":530,\"pre_code\":\"PIN01\",\"variant_code\":\"M02\"},\"collapse-27\":{\"categoria\":\"Muros Interiores Base\",\"id\":\"23\",\"renders\":\"{\\\"id\\\":16,\\\"product_id\\\":23,\\\"image_1\\\":null,\\\"image_2\\\":null,\\\"image_3\\\":null,\\\"image_4\\\":null,\\\"image_5\\\":\\\"\\\\\\/render\\\\\\/render_23_5.webp\\\",\\\"image_6\\\":\\\"\\\\\\/render\\\\\\/render_23_6.webp\\\",\\\"image_7\\\":\\\"\\\\\\/render\\\\\\/render_23_7.webp\\\",\\\"image_8\\\":\\\"\\\\\\/render\\\\\\/render_23_8.webp\\\",\\\"image_9\\\":null,\\\"created_at\\\":\\\"2025-08-08T12:42:54.000000Z\\\",\\\"updated_at\\\":\\\"2025-09-19T03:15:56.000000Z\\\"}\",\"fachada_renders\":\"[]\",\"valor\":\"PINTURA BLANCO CLARA\",\"precio\":35,\"pre_code\":\"MIB01\",\"variant_code\":\"T03\"},\"collapse-28\":{\"categoria\":\"Muros Interiores Acento\",\"id\":\"29\",\"renders\":\"{\\\"id\\\":13,\\\"product_id\\\":29,\\\"image_1\\\":null,\\\"image_2\\\":null,\\\"image_3\\\":null,\\\"image_4\\\":null,\\\"image_5\\\":\\\"\\\\\\/render\\\\\\/render_29_5.webp\\\",\\\"image_6\\\":\\\"\\\\\\/render\\\\\\/render_29_6.webp\\\",\\\"image_7\\\":\\\"\\\\\\/render\\\\\\/render_29_7.webp\\\",\\\"image_8\\\":null,\\\"image_9\\\":null,\\\"created_at\\\":\\\"2025-08-08T12:39:16.000000Z\\\",\\\"updated_at\\\":\\\"2025-08-08T14:13:18.000000Z\\\"}\",\"fachada_renders\":\"[]\",\"valor\":\"PLASTER CONCRETO APARENTE\",\"precio\":50,\"pre_code\":\"MIA01\",\"variant_code\":\"T05\"},\"collapse-32\":{\"categoria\":\"Plafones\",\"id\":\"53\",\"renders\":\"{\\\"id\\\":26,\\\"product_id\\\":53,\\\"image_1\\\":null,\\\"image_2\\\":null,\\\"image_3\\\":null,\\\"image_4\\\":null,\\\"image_5\\\":\\\"\\\\\\/render\\\\\\/render_53_5.webp\\\",\\\"image_6\\\":\\\"\\\\\\/render\\\\\\/render_53_6.webp\\\",\\\"image_7\\\":\\\"\\\\\\/render\\\\\\/render_53_7.webp\\\",\\\"image_8\\\":\\\"\\\\\\/render\\\\\\/render_53_8.webp\\\",\\\"image_9\\\":null,\\\"created_at\\\":\\\"2025-08-08T12:48:52.000000Z\\\",\\\"updated_at\\\":\\\"2025-08-12T08:06:18.000000Z\\\"}\",\"fachada_renders\":\"[]\",\"valor\":\"Plaster Blanco Sascab\",\"precio\":290,\"pre_code\":\"PLA01\",\"variant_code\":\"T03\"},\"collapse-34\":{\"categoria\":\"Canceler\\u00eda\",\"id\":\"59\",\"renders\":\"{\\\"id\\\":7,\\\"product_id\\\":59,\\\"image_1\\\":null,\\\"image_2\\\":null,\\\"image_3\\\":null,\\\"image_4\\\":null,\\\"image_5\\\":\\\"\\\\\\/render\\\\\\/render_59_5.webp\\\",\\\"image_6\\\":\\\"\\\\\\/render\\\\\\/render_59_6.webp\\\",\\\"image_7\\\":\\\"\\\\\\/render\\\\\\/render_59_7.webp\\\",\\\"image_8\\\":\\\"\\\\\\/render\\\\\\/render_59_8.webp\\\",\\\"image_9\\\":null,\\\"created_at\\\":\\\"2025-08-08T12:34:18.000000Z\\\",\\\"updated_at\\\":\\\"2025-08-08T14:36:13.000000Z\\\"}\",\"fachada_renders\":\"{\\\"Fachada A\\\":{\\\"id\\\":188,\\\"product_id\\\":59,\\\"fachada\\\":\\\"Fachada A\\\",\\\"base_image_1\\\":\\\"\\\\\\/render\\\\\\/render_59_Fachada A_1.webp\\\",\\\"base_image_2\\\":\\\"\\\\\\/render\\\\\\/render_59_Fachada A_2.webp\\\",\\\"base_image_3\\\":\\\"\\\\\\/render\\\\\\/render_59_Fachada A_3.webp\\\",\\\"base_image_4\\\":\\\"\\\\\\/render\\\\\\/render_59_Fachada A_4.webp\\\",\\\"created_at\\\":\\\"2025-09-15T06:22:20.000000Z\\\",\\\"updated_at\\\":\\\"2025-09-15T06:37:41.000000Z\\\",\\\"product\\\":{\\\"id\\\":59,\\\"category_id\\\":34,\\\"style\\\":\\\"Minimalista\\\",\\\"pre_code\\\":\\\"CAN01\\\",\\\"variant_code\\\":\\\"T02\\\",\\\"version\\\":\\\"00\\\",\\\"title\\\":\\\"Perfil de Aluminio Color Blanco\\\",\\\"description\\\":null,\\\"brand\\\":\\\"\\\",\\\"base_price\\\":0,\\\"image_url\\\":\\\"Minimalista\\\\\\/13 Canceler\\\\u00eda\\\\\\/Perfil de Aluminio Color Blanco.png\\\",\\\"product_url\\\":null,\\\"one_bedroom_price\\\":0,\\\"two_bedroom_price\\\":0,\\\"three_bedroom_price\\\":0,\\\"four_bedroom_price\\\":0,\\\"created_at\\\":\\\"2025-08-08T02:25:06.000000Z\\\",\\\"updated_at\\\":\\\"2025-08-08T02:25:06.000000Z\\\"}},\\\"Fachada B\\\":{\\\"id\\\":203,\\\"product_id\\\":59,\\\"fachada\\\":\\\"Fachada B\\\",\\\"base_image_1\\\":\\\"\\\\\\/render\\\\\\/render_59_Fachada B_1.webp\\\",\\\"base_image_2\\\":\\\"\\\\\\/render\\\\\\/render_59_Fachada B_2.webp\\\",\\\"base_image_3\\\":\\\"\\\\\\/render\\\\\\/render_59_Fachada B_3.webp\\\",\\\"base_image_4\\\":\\\"\\\\\\/render\\\\\\/render_59_Fachada B_4.webp\\\",\\\"created_at\\\":\\\"2025-09-15T06:42:50.000000Z\\\",\\\"updated_at\\\":\\\"2025-09-15T07:04:45.000000Z\\\",\\\"product\\\":{\\\"id\\\":59,\\\"category_id\\\":34,\\\"style\\\":\\\"Minimalista\\\",\\\"pre_code\\\":\\\"CAN01\\\",\\\"variant_code\\\":\\\"T02\\\",\\\"version\\\":\\\"00\\\",\\\"title\\\":\\\"Perfil de Aluminio Color Blanco\\\",\\\"description\\\":null,\\\"brand\\\":\\\"\\\",\\\"base_price\\\":0,\\\"image_url\\\":\\\"Minimalista\\\\\\/13 Canceler\\\\u00eda\\\\\\/Perfil de Aluminio Color Blanco.png\\\",\\\"product_url\\\":null,\\\"one_bedroom_price\\\":0,\\\"two_bedroom_price\\\":0,\\\"three_bedroom_price\\\":0,\\\"four_bedroom_price\\\":0,\\\"created_at\\\":\\\"2025-08-08T02:25:06.000000Z\\\",\\\"updated_at\\\":\\\"2025-08-08T02:25:06.000000Z\\\"}},\\\"Fachada 2A\\\":{\\\"id\\\":244,\\\"product_id\\\":59,\\\"fachada\\\":\\\"Fachada 2A\\\",\\\"base_image_1\\\":null,\\\"base_image_2\\\":\\\"\\\\\\/render\\\\\\/render_59_Fachada 2A_2.webp\\\",\\\"base_image_3\\\":\\\"\\\\\\/render\\\\\\/render_59_Fachada 2A_3.webp\\\",\\\"base_image_4\\\":\\\"\\\\\\/render\\\\\\/render_59_Fachada 2A_4.webp\\\",\\\"created_at\\\":\\\"2025-09-15T07:20:03.000000Z\\\",\\\"updated_at\\\":\\\"2025-09-15T07:32:44.000000Z\\\",\\\"product\\\":{\\\"id\\\":59,\\\"category_id\\\":34,\\\"style\\\":\\\"Minimalista\\\",\\\"pre_code\\\":\\\"CAN01\\\",\\\"variant_code\\\":\\\"T02\\\",\\\"version\\\":\\\"00\\\",\\\"title\\\":\\\"Perfil de Aluminio Color Blanco\\\",\\\"description\\\":null,\\\"brand\\\":\\\"\\\",\\\"base_price\\\":0,\\\"image_url\\\":\\\"Minimalista\\\\\\/13 Canceler\\\\u00eda\\\\\\/Perfil de Aluminio Color Blanco.png\\\",\\\"product_url\\\":null,\\\"one_bedroom_price\\\":0,\\\"two_bedroom_price\\\":0,\\\"three_bedroom_price\\\":0,\\\"four_bedroom_price\\\":0,\\\"created_at\\\":\\\"2025-08-08T02:25:06.000000Z\\\",\\\"updated_at\\\":\\\"2025-08-08T02:25:06.000000Z\\\"}},\\\"Fachada 2B\\\":{\\\"id\\\":253,\\\"product_id\\\":59,\\\"fachada\\\":\\\"Fachada 2B\\\",\\\"base_image_1\\\":\\\"\\\\\\/render\\\\\\/render_59_Fachada 2B_1.webp\\\",\\\"base_image_2\\\":\\\"\\\\\\/render\\\\\\/render_59_Fachada 2B_2.webp\\\",\\\"base_image_3\\\":\\\"\\\\\\/render\\\\\\/render_59_Fachada 2B_3.webp\\\",\\\"base_image_4\\\":\\\"\\\\\\/render\\\\\\/render_59_Fachada 2B_4.webp\\\",\\\"created_at\\\":\\\"2025-09-15T08:35:41.000000Z\\\",\\\"updated_at\\\":\\\"2025-09-15T08:51:16.000000Z\\\",\\\"product\\\":{\\\"id\\\":59,\\\"category_id\\\":34,\\\"style\\\":\\\"Minimalista\\\",\\\"pre_code\\\":\\\"CAN01\\\",\\\"variant_code\\\":\\\"T02\\\",\\\"version\\\":\\\"00\\\",\\\"title\\\":\\\"Perfil de Aluminio Color Blanco\\\",\\\"description\\\":null,\\\"brand\\\":\\\"\\\",\\\"base_price\\\":0,\\\"image_url\\\":\\\"Minimalista\\\\\\/13 Canceler\\\\u00eda\\\\\\/Perfil de Aluminio Color Blanco.png\\\",\\\"product_url\\\":null,\\\"one_bedroom_price\\\":0,\\\"two_bedroom_price\\\":0,\\\"three_bedroom_price\\\":0,\\\"four_bedroom_price\\\":0,\\\"created_at\\\":\\\"2025-08-08T02:25:06.000000Z\\\",\\\"updated_at\\\":\\\"2025-08-08T02:25:06.000000Z\\\"}},\\\"Fachada 3A\\\":{\\\"id\\\":290,\\\"product_id\\\":59,\\\"fachada\\\":\\\"Fachada 3A\\\",\\\"base_image_1\\\":null,\\\"base_image_2\\\":\\\"\\\\\\/render\\\\\\/render_59_Fachada 3A_2.webp\\\",\\\"base_image_3\\\":\\\"\\\\\\/render\\\\\\/render_59_Fachada 3A_3.webp\\\",\\\"base_image_4\\\":\\\"\\\\\\/render\\\\\\/render_59_Fachada 3A_4.webp\\\",\\\"created_at\\\":\\\"2025-09-17T03:44:07.000000Z\\\",\\\"updated_at\\\":\\\"2025-09-17T03:44:07.000000Z\\\",\\\"product\\\":{\\\"id\\\":59,\\\"category_id\\\":34,\\\"style\\\":\\\"Minimalista\\\",\\\"pre_code\\\":\\\"CAN01\\\",\\\"variant_code\\\":\\\"T02\\\",\\\"version\\\":\\\"00\\\",\\\"title\\\":\\\"Perfil de Aluminio Color Blanco\\\",\\\"description\\\":null,\\\"brand\\\":\\\"\\\",\\\"base_price\\\":0,\\\"image_url\\\":\\\"Minimalista\\\\\\/13 Canceler\\\\u00eda\\\\\\/Perfil de Aluminio Color Blanco.png\\\",\\\"product_url\\\":null,\\\"one_bedroom_price\\\":0,\\\"two_bedroom_price\\\":0,\\\"three_bedroom_price\\\":0,\\\"four_bedroom_price\\\":0,\\\"created_at\\\":\\\"2025-08-08T02:25:06.000000Z\\\",\\\"updated_at\\\":\\\"2025-08-08T02:25:06.000000Z\\\"}},\\\"Fachada 3B\\\":{\\\"id\\\":291,\\\"product_id\\\":59,\\\"fachada\\\":\\\"Fachada 3B\\\",\\\"base_image_1\\\":\\\"\\\\\\/render\\\\\\/render_59_Fachada 3B_1.webp\\\",\\\"base_image_2\\\":\\\"\\\\\\/render\\\\\\/render_59_Fachada 3B_2.webp\\\",\\\"base_image_3\\\":\\\"\\\\\\/render\\\\\\/render_59_Fachada 3B_3.webp\\\",\\\"base_image_4\\\":\\\"\\\\\\/render\\\\\\/render_59_Fachada 3B_4.webp\\\",\\\"created_at\\\":\\\"2025-09-17T03:44:07.000000Z\\\",\\\"updated_at\\\":\\\"2025-09-17T03:44:07.000000Z\\\",\\\"product\\\":{\\\"id\\\":59,\\\"category_id\\\":34,\\\"style\\\":\\\"Minimalista\\\",\\\"pre_code\\\":\\\"CAN01\\\",\\\"variant_code\\\":\\\"T02\\\",\\\"version\\\":\\\"00\\\",\\\"title\\\":\\\"Perfil de Aluminio Color Blanco\\\",\\\"description\\\":null,\\\"brand\\\":\\\"\\\",\\\"base_price\\\":0,\\\"image_url\\\":\\\"Minimalista\\\\\\/13 Canceler\\\\u00eda\\\\\\/Perfil de Aluminio Color Blanco.png\\\",\\\"product_url\\\":null,\\\"one_bedroom_price\\\":0,\\\"two_bedroom_price\\\":0,\\\"three_bedroom_price\\\":0,\\\"four_bedroom_price\\\":0,\\\"created_at\\\":\\\"2025-08-08T02:25:06.000000Z\\\",\\\"updated_at\\\":\\\"2025-08-08T02:25:06.000000Z\\\"}},\\\"Fachada 4A\\\":{\\\"id\\\":292,\\\"product_id\\\":59,\\\"fachada\\\":\\\"Fachada 4A\\\",\\\"base_image_1\\\":\\\"\\\\\\/render\\\\\\/render_59_Fachada 4A_1.webp\\\",\\\"base_image_2\\\":\\\"\\\\\\/render\\\\\\/render_59_Fachada 4A_2.webp\\\",\\\"base_image_3\\\":\\\"\\\\\\/render\\\\\\/render_59_Fachada 4A_3.webp\\\",\\\"base_image_4\\\":\\\"\\\\\\/render\\\\\\/render_59_Fachada 4A_4.webp\\\",\\\"created_at\\\":\\\"2025-09-17T03:44:07.000000Z\\\",\\\"updated_at\\\":\\\"2025-09-17T03:44:07.000000Z\\\",\\\"product\\\":{\\\"id\\\":59,\\\"category_id\\\":34,\\\"style\\\":\\\"Minimalista\\\",\\\"pre_code\\\":\\\"CAN01\\\",\\\"variant_code\\\":\\\"T02\\\",\\\"version\\\":\\\"00\\\",\\\"title\\\":\\\"Perfil de Aluminio Color Blanco\\\",\\\"description\\\":null,\\\"brand\\\":\\\"\\\",\\\"base_price\\\":0,\\\"image_url\\\":\\\"Minimalista\\\\\\/13 Canceler\\\\u00eda\\\\\\/Perfil de Aluminio Color Blanco.png\\\",\\\"product_url\\\":null,\\\"one_bedroom_price\\\":0,\\\"two_bedroom_price\\\":0,\\\"three_bedroom_price\\\":0,\\\"four_bedroom_price\\\":0,\\\"created_at\\\":\\\"2025-08-08T02:25:06.000000Z\\\",\\\"updated_at\\\":\\\"2025-08-08T02:25:06.000000Z\\\"}}}\",\"valor\":\"Perfil de Aluminio Color Blanco\",\"precio\":0,\"pre_code\":\"CAN01\",\"variant_code\":\"T02\"},\"collapse-24\":{\"categoria\":\"Meseta Cocina\",\"id\":\"14\",\"renders\":\"{\\\"id\\\":45,\\\"product_id\\\":14,\\\"image_1\\\":null,\\\"image_2\\\":null,\\\"image_3\\\":null,\\\"image_4\\\":null,\\\"image_5\\\":\\\"\\\\\\/render\\\\\\/render_14_5.webp\\\",\\\"image_6\\\":\\\"\\\\\\/render\\\\\\/render_14_6.webp\\\",\\\"image_7\\\":null,\\\"image_8\\\":null,\\\"image_9\\\":null,\\\"created_at\\\":\\\"2025-08-08T14:10:56.000000Z\\\",\\\"updated_at\\\":\\\"2025-08-08T14:24:37.000000Z\\\"}\",\"fachada_renders\":\"[]\",\"valor\":\"Granito San Gabriel Leather\",\"precio\":675,\"pre_code\":\"MCO01\",\"variant_code\":\"T02\"},\"collapse-33\":{\"categoria\":\"Puertas\",\"id\":\"57\",\"renders\":\"{\\\"id\\\":30,\\\"product_id\\\":57,\\\"image_1\\\":null,\\\"image_2\\\":null,\\\"image_3\\\":null,\\\"image_4\\\":null,\\\"image_5\\\":\\\"\\\\\\/render\\\\\\/render_57_5.webp\\\",\\\"image_6\\\":\\\"\\\\\\/render\\\\\\/render_57_6.webp\\\",\\\"image_7\\\":\\\"\\\\\\/render\\\\\\/render_57_7.webp\\\",\\\"image_8\\\":\\\"\\\\\\/render\\\\\\/render_57_8.webp\\\",\\\"image_9\\\":null,\\\"created_at\\\":\\\"2025-08-08T12:50:14.000000Z\\\",\\\"updated_at\\\":\\\"2025-08-12T08:07:18.000000Z\\\"}\",\"fachada_renders\":\"{\\\"Fachada B\\\":{\\\"id\\\":208,\\\"product_id\\\":57,\\\"fachada\\\":\\\"Fachada B\\\",\\\"base_image_1\\\":\\\"\\\\\\/render\\\\\\/render_57_Fachada B_1.webp\\\",\\\"base_image_2\\\":\\\"\\\\\\/render\\\\\\/render_57_Fachada B_2.webp\\\",\\\"base_image_3\\\":\\\"\\\\\\/render\\\\\\/render_57_Fachada B_3.webp\\\",\\\"base_image_4\\\":null,\\\"created_at\\\":\\\"2025-09-15T06:44:17.000000Z\\\",\\\"updated_at\\\":\\\"2025-09-15T06:58:55.000000Z\\\",\\\"product\\\":{\\\"id\\\":57,\\\"category_id\\\":33,\\\"style\\\":\\\"Minimalista\\\",\\\"pre_code\\\":\\\"PUE01\\\",\\\"variant_code\\\":\\\"T01\\\",\\\"version\\\":\\\"00\\\",\\\"title\\\":\\\"Tambor de Triplay de Encino Acabado Negro Mate Poreado\\\",\\\"description\\\":null,\\\"brand\\\":\\\"BETA STUDIO\\\",\\\"base_price\\\":7300,\\\"image_url\\\":\\\"Minimalista\\\\\\/12 Puertas\\\\\\/Tambor de Triplay de Encino Acabado Negro Mate Poreado.png\\\",\\\"product_url\\\":null,\\\"one_bedroom_price\\\":0,\\\"two_bedroom_price\\\":0,\\\"three_bedroom_price\\\":0,\\\"four_bedroom_price\\\":0,\\\"created_at\\\":\\\"2025-08-08T02:25:06.000000Z\\\",\\\"updated_at\\\":\\\"2025-08-08T02:25:06.000000Z\\\"}},\\\"Fachada 2A\\\":{\\\"id\\\":227,\\\"product_id\\\":57,\\\"fachada\\\":\\\"Fachada 2A\\\",\\\"base_image_1\\\":\\\"\\\\\\/render\\\\\\/render_57_Fachada 2A_1.webp\\\",\\\"base_image_2\\\":\\\"\\\\\\/render\\\\\\/render_57_Fachada 2A_2.webp\\\",\\\"base_image_3\\\":\\\"\\\\\\/render\\\\\\/render_57_Fachada 2A_3.webp\\\",\\\"base_image_4\\\":\\\"\\\\\\/render\\\\\\/render_57_Fachada 2A_4.webp\\\",\\\"created_at\\\":\\\"2025-09-15T07:11:26.000000Z\\\",\\\"updated_at\\\":\\\"2025-09-15T08:03:54.000000Z\\\",\\\"product\\\":{\\\"id\\\":57,\\\"category_id\\\":33,\\\"style\\\":\\\"Minimalista\\\",\\\"pre_code\\\":\\\"PUE01\\\",\\\"variant_code\\\":\\\"T01\\\",\\\"version\\\":\\\"00\\\",\\\"title\\\":\\\"Tambor de Triplay de Encino Acabado Negro Mate Poreado\\\",\\\"description\\\":null,\\\"brand\\\":\\\"BETA STUDIO\\\",\\\"base_price\\\":7300,\\\"image_url\\\":\\\"Minimalista\\\\\\/12 Puertas\\\\\\/Tambor de Triplay de Encino Acabado Negro Mate Poreado.png\\\",\\\"product_url\\\":null,\\\"one_bedroom_price\\\":0,\\\"two_bedroom_price\\\":0,\\\"three_bedroom_price\\\":0,\\\"four_bedroom_price\\\":0,\\\"created_at\\\":\\\"2025-08-08T02:25:06.000000Z\\\",\\\"updated_at\\\":\\\"2025-08-08T02:25:06.000000Z\\\"}},\\\"Fachada 2B\\\":{\\\"id\\\":258,\\\"product_id\\\":57,\\\"fachada\\\":\\\"Fachada 2B\\\",\\\"base_image_1\\\":\\\"\\\\\\/render\\\\\\/render_57_Fachada 2B_1.webp\\\",\\\"base_image_2\\\":\\\"\\\\\\/render\\\\\\/render_57_Fachada 2B_2.webp\\\",\\\"base_image_3\\\":\\\"\\\\\\/render\\\\\\/render_57_Fachada 2B_3.webp\\\",\\\"base_image_4\\\":null,\\\"created_at\\\":\\\"2025-09-15T08:36:55.000000Z\\\",\\\"updated_at\\\":\\\"2025-09-15T08:48:16.000000Z\\\",\\\"product\\\":{\\\"id\\\":57,\\\"category_id\\\":33,\\\"style\\\":\\\"Minimalista\\\",\\\"pre_code\\\":\\\"PUE01\\\",\\\"variant_code\\\":\\\"T01\\\",\\\"version\\\":\\\"00\\\",\\\"title\\\":\\\"Tambor de Triplay de Encino Acabado Negro Mate Poreado\\\",\\\"description\\\":null,\\\"brand\\\":\\\"BETA STUDIO\\\",\\\"base_price\\\":7300,\\\"image_url\\\":\\\"Minimalista\\\\\\/12 Puertas\\\\\\/Tambor de Triplay de Encino Acabado Negro Mate Poreado.png\\\",\\\"product_url\\\":null,\\\"one_bedroom_price\\\":0,\\\"two_bedroom_price\\\":0,\\\"three_bedroom_price\\\":0,\\\"four_bedroom_price\\\":0,\\\"created_at\\\":\\\"2025-08-08T02:25:06.000000Z\\\",\\\"updated_at\\\":\\\"2025-08-08T02:25:06.000000Z\\\"}},\\\"Fachada 3A\\\":{\\\"id\\\":323,\\\"product_id\\\":57,\\\"fachada\\\":\\\"Fachada 3A\\\",\\\"base_image_1\\\":\\\"\\\\\\/render\\\\\\/render_57_Fachada 3A_1.webp\\\",\\\"base_image_2\\\":\\\"\\\\\\/render\\\\\\/render_57_Fachada 3A_2.webp\\\",\\\"base_image_3\\\":\\\"\\\\\\/render\\\\\\/render_57_Fachada 3A_3.webp\\\",\\\"base_image_4\\\":null,\\\"created_at\\\":\\\"2025-09-17T03:59:33.000000Z\\\",\\\"updated_at\\\":\\\"2025-09-17T03:59:33.000000Z\\\",\\\"product\\\":{\\\"id\\\":57,\\\"category_id\\\":33,\\\"style\\\":\\\"Minimalista\\\",\\\"pre_code\\\":\\\"PUE01\\\",\\\"variant_code\\\":\\\"T01\\\",\\\"version\\\":\\\"00\\\",\\\"title\\\":\\\"Tambor de Triplay de Encino Acabado Negro Mate Poreado\\\",\\\"description\\\":null,\\\"brand\\\":\\\"BETA STUDIO\\\",\\\"base_price\\\":7300,\\\"image_url\\\":\\\"Minimalista\\\\\\/12 Puertas\\\\\\/Tambor de Triplay de Encino Acabado Negro Mate Poreado.png\\\",\\\"product_url\\\":null,\\\"one_bedroom_price\\\":0,\\\"two_bedroom_price\\\":0,\\\"three_bedroom_price\\\":0,\\\"four_bedroom_price\\\":0,\\\"created_at\\\":\\\"2025-08-08T02:25:06.000000Z\\\",\\\"updated_at\\\":\\\"2025-08-08T02:25:06.000000Z\\\"}},\\\"Fachada 3B\\\":{\\\"id\\\":324,\\\"product_id\\\":57,\\\"fachada\\\":\\\"Fachada 3B\\\",\\\"base_image_1\\\":\\\"\\\\\\/render\\\\\\/render_57_Fachada 3B_1.webp\\\",\\\"base_image_2\\\":\\\"\\\\\\/render\\\\\\/render_57_Fachada 3B_2.webp\\\",\\\"base_image_3\\\":null,\\\"base_image_4\\\":null,\\\"created_at\\\":\\\"2025-09-17T03:59:33.000000Z\\\",\\\"updated_at\\\":\\\"2025-09-17T03:59:33.000000Z\\\",\\\"product\\\":{\\\"id\\\":57,\\\"category_id\\\":33,\\\"style\\\":\\\"Minimalista\\\",\\\"pre_code\\\":\\\"PUE01\\\",\\\"variant_code\\\":\\\"T01\\\",\\\"version\\\":\\\"00\\\",\\\"title\\\":\\\"Tambor de Triplay de Encino Acabado Negro Mate Poreado\\\",\\\"description\\\":null,\\\"brand\\\":\\\"BETA STUDIO\\\",\\\"base_price\\\":7300,\\\"image_url\\\":\\\"Minimalista\\\\\\/12 Puertas\\\\\\/Tambor de Triplay de Encino Acabado Negro Mate Poreado.png\\\",\\\"product_url\\\":null,\\\"one_bedroom_price\\\":0,\\\"two_bedroom_price\\\":0,\\\"three_bedroom_price\\\":0,\\\"four_bedroom_price\\\":0,\\\"created_at\\\":\\\"2025-08-08T02:25:06.000000Z\\\",\\\"updated_at\\\":\\\"2025-08-08T02:25:06.000000Z\\\"}},\\\"Fachada 4A\\\":{\\\"id\\\":325,\\\"product_id\\\":57,\\\"fachada\\\":\\\"Fachada 4A\\\",\\\"base_image_1\\\":\\\"\\\\\\/render\\\\\\/render_57_Fachada 4A_1.webp\\\",\\\"base_image_2\\\":\\\"\\\\\\/render\\\\\\/render_57_Fachada 4A_2.webp\\\",\\\"base_image_3\\\":null,\\\"base_image_4\\\":null,\\\"created_at\\\":\\\"2025-09-17T03:59:33.000000Z\\\",\\\"updated_at\\\":\\\"2025-09-17T03:59:33.000000Z\\\",\\\"product\\\":{\\\"id\\\":57,\\\"category_id\\\":33,\\\"style\\\":\\\"Minimalista\\\",\\\"pre_code\\\":\\\"PUE01\\\",\\\"variant_code\\\":\\\"T01\\\",\\\"version\\\":\\\"00\\\",\\\"title\\\":\\\"Tambor de Triplay de Encino Acabado Negro Mate Poreado\\\",\\\"description\\\":null,\\\"brand\\\":\\\"BETA STUDIO\\\",\\\"base_price\\\":7300,\\\"image_url\\\":\\\"Minimalista\\\\\\/12 Puertas\\\\\\/Tambor de Triplay de Encino Acabado Negro Mate Poreado.png\\\",\\\"product_url\\\":null,\\\"one_bedroom_price\\\":0,\\\"two_bedroom_price\\\":0,\\\"three_bedroom_price\\\":0,\\\"four_bedroom_price\\\":0,\\\"created_at\\\":\\\"2025-08-08T02:25:06.000000Z\\\",\\\"updated_at\\\":\\\"2025-08-08T02:25:06.000000Z\\\"}}}\",\"valor\":\"Tambor de Triplay de Encino Acabado Negro Mate Poreado\",\"precio\":7300,\"pre_code\":\"PUE01\",\"variant_code\":\"T01\"},\"collapse-38\":{\"categoria\":\"Accesorios Puertas\",\"id\":\"71\",\"renders\":\"{\\\"id\\\":34,\\\"product_id\\\":71,\\\"image_1\\\":null,\\\"image_2\\\":null,\\\"image_3\\\":null,\\\"image_4\\\":null,\\\"image_5\\\":null,\\\"image_6\\\":\\\"\\\\\\/render\\\\\\/render_71_6.webp\\\",\\\"image_7\\\":\\\"\\\\\\/render\\\\\\/render_71_7.webp\\\",\\\"image_8\\\":\\\"\\\\\\/render\\\\\\/render_71_8.webp\\\",\\\"image_9\\\":null,\\\"created_at\\\":\\\"2025-08-08T13:20:55.000000Z\\\",\\\"updated_at\\\":\\\"2025-08-12T07:55:40.000000Z\\\"}\",\"fachada_renders\":\"{\\\"Fachada B\\\":{\\\"id\\\":209,\\\"product_id\\\":71,\\\"fachada\\\":\\\"Fachada B\\\",\\\"base_image_1\\\":\\\"\\\\\\/render\\\\\\/render_71_Fachada B_1.webp\\\",\\\"base_image_2\\\":\\\"\\\\\\/render\\\\\\/render_71_Fachada B_2.webp\\\",\\\"base_image_3\\\":\\\"\\\\\\/render\\\\\\/render_71_Fachada B_3.webp\\\",\\\"base_image_4\\\":null,\\\"created_at\\\":\\\"2025-09-15T06:45:08.000000Z\\\",\\\"updated_at\\\":\\\"2025-09-15T06:59:18.000000Z\\\",\\\"product\\\":{\\\"id\\\":71,\\\"category_id\\\":38,\\\"style\\\":\\\"Minimalista\\\",\\\"pre_code\\\":\\\"APU01\\\",\\\"variant_code\\\":\\\"T01\\\",\\\"version\\\":\\\"00\\\",\\\"title\\\":\\\"Acabado Aluminio Satinado\\\",\\\"description\\\":null,\\\"brand\\\":\\\"\\\",\\\"base_price\\\":0,\\\"image_url\\\":\\\"Minimalista\\\\\\/17 Accesorio Puertas\\\\\\/Acabado Aluminio Satinado.png\\\",\\\"product_url\\\":null,\\\"one_bedroom_price\\\":0,\\\"two_bedroom_price\\\":0,\\\"three_bedroom_price\\\":0,\\\"four_bedroom_price\\\":0,\\\"created_at\\\":\\\"2025-08-08T02:25:06.000000Z\\\",\\\"updated_at\\\":\\\"2025-08-08T02:25:06.000000Z\\\"}},\\\"Fachada 2A\\\":{\\\"id\\\":228,\\\"product_id\\\":71,\\\"fachada\\\":\\\"Fachada 2A\\\",\\\"base_image_1\\\":\\\"\\\\\\/render\\\\\\/render_71_Fachada 2A_1.webp\\\",\\\"base_image_2\\\":\\\"\\\\\\/render\\\\\\/render_71_Fachada 2A_2.webp\\\",\\\"base_image_3\\\":\\\"\\\\\\/render\\\\\\/render_71_Fachada 2A_3.webp\\\",\\\"base_image_4\\\":null,\\\"created_at\\\":\\\"2025-09-15T07:12:04.000000Z\\\",\\\"updated_at\\\":\\\"2025-09-15T07:27:42.000000Z\\\",\\\"product\\\":{\\\"id\\\":71,\\\"category_id\\\":38,\\\"style\\\":\\\"Minimalista\\\",\\\"pre_code\\\":\\\"APU01\\\",\\\"variant_code\\\":\\\"T01\\\",\\\"version\\\":\\\"00\\\",\\\"title\\\":\\\"Acabado Aluminio Satinado\\\",\\\"description\\\":null,\\\"brand\\\":\\\"\\\",\\\"base_price\\\":0,\\\"image_url\\\":\\\"Minimalista\\\\\\/17 Accesorio Puertas\\\\\\/Acabado Aluminio Satinado.png\\\",\\\"product_url\\\":null,\\\"one_bedroom_price\\\":0,\\\"two_bedroom_price\\\":0,\\\"three_bedroom_price\\\":0,\\\"four_bedroom_price\\\":0,\\\"created_at\\\":\\\"2025-08-08T02:25:06.000000Z\\\",\\\"updated_at\\\":\\\"2025-08-08T02:25:06.000000Z\\\"}},\\\"Fachada 2B\\\":{\\\"id\\\":259,\\\"product_id\\\":71,\\\"fachada\\\":\\\"Fachada 2B\\\",\\\"base_image_1\\\":\\\"\\\\\\/render\\\\\\/render_71_Fachada 2B_1.webp\\\",\\\"base_image_2\\\":\\\"\\\\\\/render\\\\\\/render_71_Fachada 2B_2.webp\\\",\\\"base_image_3\\\":\\\"\\\\\\/render\\\\\\/render_71_Fachada 2B_3.webp\\\",\\\"base_image_4\\\":null,\\\"created_at\\\":\\\"2025-09-15T08:37:12.000000Z\\\",\\\"updated_at\\\":\\\"2025-09-15T08:48:36.000000Z\\\",\\\"product\\\":{\\\"id\\\":71,\\\"category_id\\\":38,\\\"style\\\":\\\"Minimalista\\\",\\\"pre_code\\\":\\\"APU01\\\",\\\"variant_code\\\":\\\"T01\\\",\\\"version\\\":\\\"00\\\",\\\"title\\\":\\\"Acabado Aluminio Satinado\\\",\\\"description\\\":null,\\\"brand\\\":\\\"\\\",\\\"base_price\\\":0,\\\"image_url\\\":\\\"Minimalista\\\\\\/17 Accesorio Puertas\\\\\\/Acabado Aluminio Satinado.png\\\",\\\"product_url\\\":null,\\\"one_bedroom_price\\\":0,\\\"two_bedroom_price\\\":0,\\\"three_bedroom_price\\\":0,\\\"four_bedroom_price\\\":0,\\\"created_at\\\":\\\"2025-08-08T02:25:06.000000Z\\\",\\\"updated_at\\\":\\\"2025-08-08T02:25:06.000000Z\\\"}},\\\"Fachada 3A\\\":{\\\"id\\\":326,\\\"product_id\\\":71,\\\"fachada\\\":\\\"Fachada 3A\\\",\\\"base_image_1\\\":\\\"\\\\\\/render\\\\\\/render_71_Fachada 3A_1.webp\\\",\\\"base_image_2\\\":\\\"\\\\\\/render\\\\\\/render_71_Fachada 3A_2.webp\\\",\\\"base_image_3\\\":\\\"\\\\\\/render\\\\\\/render_71_Fachada 3A_3.webp\\\",\\\"base_image_4\\\":null,\\\"created_at\\\":\\\"2025-09-17T04:01:45.000000Z\\\",\\\"updated_at\\\":\\\"2025-09-17T04:01:45.000000Z\\\",\\\"product\\\":{\\\"id\\\":71,\\\"category_id\\\":38,\\\"style\\\":\\\"Minimalista\\\",\\\"pre_code\\\":\\\"APU01\\\",\\\"variant_code\\\":\\\"T01\\\",\\\"version\\\":\\\"00\\\",\\\"title\\\":\\\"Acabado Aluminio Satinado\\\",\\\"description\\\":null,\\\"brand\\\":\\\"\\\",\\\"base_price\\\":0,\\\"image_url\\\":\\\"Minimalista\\\\\\/17 Accesorio Puertas\\\\\\/Acabado Aluminio Satinado.png\\\",\\\"product_url\\\":null,\\\"one_bedroom_price\\\":0,\\\"two_bedroom_price\\\":0,\\\"three_bedroom_price\\\":0,\\\"four_bedroom_price\\\":0,\\\"created_at\\\":\\\"2025-08-08T02:25:06.000000Z\\\",\\\"updated_at\\\":\\\"2025-08-08T02:25:06.000000Z\\\"}},\\\"Fachada 3B\\\":{\\\"id\\\":327,\\\"product_id\\\":71,\\\"fachada\\\":\\\"Fachada 3B\\\",\\\"base_image_1\\\":\\\"\\\\\\/render\\\\\\/render_71_Fachada 3B_1.webp\\\",\\\"base_image_2\\\":\\\"\\\\\\/render\\\\\\/render_71_Fachada 3B_2.webp\\\",\\\"base_image_3\\\":null,\\\"base_image_4\\\":null,\\\"created_at\\\":\\\"2025-09-17T04:01:45.000000Z\\\",\\\"updated_at\\\":\\\"2025-09-17T04:01:45.000000Z\\\",\\\"product\\\":{\\\"id\\\":71,\\\"category_id\\\":38,\\\"style\\\":\\\"Minimalista\\\",\\\"pre_code\\\":\\\"APU01\\\",\\\"variant_code\\\":\\\"T01\\\",\\\"version\\\":\\\"00\\\",\\\"title\\\":\\\"Acabado Aluminio Satinado\\\",\\\"description\\\":null,\\\"brand\\\":\\\"\\\",\\\"base_price\\\":0,\\\"image_url\\\":\\\"Minimalista\\\\\\/17 Accesorio Puertas\\\\\\/Acabado Aluminio Satinado.png\\\",\\\"product_url\\\":null,\\\"one_bedroom_price\\\":0,\\\"two_bedroom_price\\\":0,\\\"three_bedroom_price\\\":0,\\\"four_bedroom_price\\\":0,\\\"created_at\\\":\\\"2025-08-08T02:25:06.000000Z\\\",\\\"updated_at\\\":\\\"2025-08-08T02:25:06.000000Z\\\"}},\\\"Fachada 4A\\\":{\\\"id\\\":328,\\\"product_id\\\":71,\\\"fachada\\\":\\\"Fachada 4A\\\",\\\"base_image_1\\\":\\\"\\\\\\/render\\\\\\/render_71_Fachada 4A_1.webp\\\",\\\"base_image_2\\\":\\\"\\\\\\/render\\\\\\/render_71_Fachada 4A_2.webp\\\",\\\"base_image_3\\\":null,\\\"base_image_4\\\":null,\\\"created_at\\\":\\\"2025-09-17T04:01:45.000000Z\\\",\\\"updated_at\\\":\\\"2025-09-17T04:01:45.000000Z\\\",\\\"product\\\":{\\\"id\\\":71,\\\"category_id\\\":38,\\\"style\\\":\\\"Minimalista\\\",\\\"pre_code\\\":\\\"APU01\\\",\\\"variant_code\\\":\\\"T01\\\",\\\"version\\\":\\\"00\\\",\\\"title\\\":\\\"Acabado Aluminio Satinado\\\",\\\"description\\\":null,\\\"brand\\\":\\\"\\\",\\\"base_price\\\":0,\\\"image_url\\\":\\\"Minimalista\\\\\\/17 Accesorio Puertas\\\\\\/Acabado Aluminio Satinado.png\\\",\\\"product_url\\\":null,\\\"one_bedroom_price\\\":0,\\\"two_bedroom_price\\\":0,\\\"three_bedroom_price\\\":0,\\\"four_bedroom_price\\\":0,\\\"created_at\\\":\\\"2025-08-08T02:25:06.000000Z\\\",\\\"updated_at\\\":\\\"2025-08-08T02:25:06.000000Z\\\"}}}\",\"valor\":\"Acabado Aluminio Satinado\",\"precio\":0,\"pre_code\":\"APU01\",\"variant_code\":\"T01\"},\"collapse-35\":{\"categoria\":\"Carpinter\\u00eda\",\"id\":\"61\",\"renders\":\"{\\\"id\\\":37,\\\"product_id\\\":61,\\\"image_1\\\":null,\\\"image_2\\\":null,\\\"image_3\\\":null,\\\"image_4\\\":null,\\\"image_5\\\":null,\\\"image_6\\\":\\\"\\\\\\/render\\\\\\/render_61_6.webp\\\",\\\"image_7\\\":\\\"\\\\\\/render\\\\\\/render_61_7.webp\\\",\\\"image_8\\\":\\\"\\\\\\/render\\\\\\/render_61_8.webp\\\",\\\"image_9\\\":null,\\\"created_at\\\":\\\"2025-08-08T13:33:08.000000Z\\\",\\\"updated_at\\\":\\\"2025-08-12T07:59:56.000000Z\\\"}\",\"fachada_renders\":\"[]\",\"valor\":\"Tablero de MDF o MDP Laminado Tipo Roble\",\"precio\":0,\"pre_code\":\"CAR01\",\"variant_code\":\"T02\"},\"collapse-39\":{\"categoria\":\"Accesorio Closets\",\"id\":\"74\",\"renders\":\"{\\\"id\\\":31,\\\"product_id\\\":74,\\\"image_1\\\":null,\\\"image_2\\\":null,\\\"image_3\\\":null,\\\"image_4\\\":null,\\\"image_5\\\":null,\\\"image_6\\\":null,\\\"image_7\\\":\\\"\\\\\\/render\\\\\\/render_74_7.webp\\\",\\\"image_8\\\":null,\\\"image_9\\\":null,\\\"created_at\\\":\\\"2025-08-08T13:03:38.000000Z\\\",\\\"updated_at\\\":\\\"2025-08-08T13:03:38.000000Z\\\"}\",\"fachada_renders\":\"[]\",\"valor\":\"Acabado Aluminio Satinado\",\"precio\":0,\"pre_code\":\"ACL01\",\"variant_code\":\"T01\"},\"collapse-23\":{\"categoria\":\"Pisos Regaderas\",\"id\":\"9\",\"renders\":\"{\\\"id\\\":54,\\\"product_id\\\":9,\\\"image_1\\\":null,\\\"image_2\\\":null,\\\"image_3\\\":null,\\\"image_4\\\":null,\\\"image_5\\\":null,\\\"image_6\\\":null,\\\"image_7\\\":null,\\\"image_8\\\":\\\"\\\\\\/render\\\\\\/render_9_8.webp\\\",\\\"image_9\\\":null,\\\"created_at\\\":\\\"2025-08-12T08:04:40.000000Z\\\",\\\"updated_at\\\":\\\"2025-08-12T08:04:40.000000Z\\\"}\",\"fachada_renders\":\"[]\",\"valor\":\"Marmol Blanco Arena Aventejado Mate\",\"precio\":439,\"pre_code\":\"PRE01\",\"variant_code\":\"T01\"},\"collapse-25\":{\"categoria\":\"Mesetas Ba\\u00f1os\",\"id\":\"16\",\"renders\":\"{\\\"id\\\":41,\\\"product_id\\\":16,\\\"image_1\\\":null,\\\"image_2\\\":null,\\\"image_3\\\":null,\\\"image_4\\\":null,\\\"image_5\\\":null,\\\"image_6\\\":null,\\\"image_7\\\":null,\\\"image_8\\\":\\\"\\\\\\/render\\\\\\/render_16_8.webp\\\",\\\"image_9\\\":null,\\\"created_at\\\":\\\"2025-08-08T14:08:07.000000Z\\\",\\\"updated_at\\\":\\\"2025-08-12T05:45:30.000000Z\\\"}\",\"fachada_renders\":\"[]\",\"valor\":\"Granito Itaunas Pulido\",\"precio\":675,\"pre_code\":\"MES02\",\"variant_code\":\"T01\"},\"collapse-26\":{\"categoria\":\"Muros Regaderas\",\"id\":\"19\",\"renders\":\"{\\\"id\\\":50,\\\"product_id\\\":19,\\\"image_1\\\":null,\\\"image_2\\\":null,\\\"image_3\\\":null,\\\"image_4\\\":null,\\\"image_5\\\":null,\\\"image_6\\\":null,\\\"image_7\\\":null,\\\"image_8\\\":\\\"\\\\\\/render\\\\\\/render_19_8.webp\\\",\\\"image_9\\\":null,\\\"created_at\\\":\\\"2025-08-12T08:02:06.000000Z\\\",\\\"updated_at\\\":\\\"2025-08-12T08:02:06.000000Z\\\"}\",\"fachada_renders\":\"[]\",\"valor\":\"M\\u00c1RMOL BLANCO ARENA PULIDO MATE. FORMATO 30 cm X LARGOS LIBRES\",\"precio\":525,\"pre_code\":\"MRE01\",\"variant_code\":\"T01\"},\"collapse-36\":{\"categoria\":\"Griferia y Accesorios de Ba\\u00f1o\",\"id\":\"65\",\"renders\":\"{\\\"id\\\":47,\\\"product_id\\\":65,\\\"image_1\\\":null,\\\"image_2\\\":null,\\\"image_3\\\":null,\\\"image_4\\\":null,\\\"image_5\\\":null,\\\"image_6\\\":null,\\\"image_7\\\":null,\\\"image_8\\\":\\\"\\\\\\/render\\\\\\/render_65_8.webp\\\",\\\"image_9\\\":null,\\\"created_at\\\":\\\"2025-08-12T07:51:44.000000Z\\\",\\\"updated_at\\\":\\\"2025-08-12T07:51:44.000000Z\\\"}\",\"fachada_renders\":\"[]\",\"valor\":\"Grifer\\u00eda y Accesorios Acabado Cromo\",\"precio\":0,\"pre_code\":\"BAN01\",\"variant_code\":\"T01\"},\"collapse-37\":{\"categoria\":\"Accesorios El\\u00e9ctricos\",\"id\":\"68\",\"renders\":\"null\",\"fachada_renders\":\"[]\",\"valor\":\"Acabado Satinado\",\"precio\":0,\"pre_code\":\"AEL01\",\"variant_code\":\"T01\"},\"opciones-casas\":{\"id\":\"generalMinimalista\",\"categoria\":\"Estilo\",\"valor\":\"Minimalista\"}}', 'Guardada', '2025-09-19 09:10:00', '2025-09-19 09:10:00');
INSERT INTO `house_configurations` (`id`, `user_id`, `configuration`, `status`, `created_at`, `updated_at`) VALUES
('74aafe53-71a8-4b2e-a804-38452c2ce4a7', 2, '{\"opciones-casas\":{\"id\":\"generalMinimalista\",\"valor\":\"Minimalista\",\"categoria\":null,\"precio\":0},\"collapse-21\":{\"id\":\"1\",\"valor\":\"Fachada A\",\"categoria\":\"fachada\",\"precio\":544},\"Habitaciones\":{\"id\":\"1Recamara\",\"valor\":\"1 Rec\\u00e1mara\",\"categoria\":null,\"precio\":0}}', 'Guardada', '2025-08-13 00:47:17', '2025-08-13 00:47:17'),
('bf643cf9-6889-45e1-969b-ffcaa8c3b495', 2, '{\"opciones-casas\":\"generalMinimalista\"}', 'Guardada', '2025-08-08 09:48:50', '2025-08-08 09:48:50'),
('dc171b9f-4464-4984-9313-49b64067c34b', 2, '{\"opciones-casas\":\"generalMinimalista\",\"Habitaciones\":\"2Habitaciones\",\"collapse-21\":\"1\",\"collapse-22\":\"4\",\"collapse-23\":\"10\",\"collapse-24\":\"14\",\"collapse-27\":\"24\",\"collapse-31\":\"45\",\"collapse-32\":\"52\",\"collapse-34\":\"59\",\"collapse-37\":\"70\",\"collapse-38\":\"72\",\"collapse-35\":\"63\",\"collapse-33\":\"57\"}', 'Guardada', '2025-08-08 09:23:18', '2025-08-08 09:23:18'),
('fa916119-f1eb-497e-bd62-95cf375dda43', 2, '{\"Estilos\":{\"id\":\"generalMinimalista\",\"valor\":\"Minimalista\",\"categoria\":\"Estilo\",\"precio\":0},\"Habitaciones\":{\"id\":\"1Recamara\",\"valor\":\"1 Rec\\u00e1mara\",\"categoria\":\"Habitaciones\",\"precio\":0},\"collapse-21\":{\"id\":\"1\",\"valor\":\"Fachada A\",\"categoria\":\"Fachada\",\"precio\":544},\"collapse-22\":{\"id\":\"3\",\"valor\":\"MARMOL BLANCO ARENA PULIDO MATE. FORMATO 30 cm X LARGOS LIBRES\",\"categoria\":\"Pisos Interiores\",\"precio\":544},\"collapse-27\":{\"id\":\"23\",\"valor\":\"PINTURA BLANCO CLARA\",\"categoria\":\"Muros Interiores Base\",\"precio\":35},\"collapse-28\":{\"id\":\"28\",\"valor\":\"PINTURA BLANCO CLARA\",\"categoria\":\"Muros Interiores Acento\",\"precio\":35},\"collapse-32\":{\"id\":\"51\",\"valor\":\"PINTURA BLANCO CLARA 020-01\",\"categoria\":\"Plafones\",\"precio\":0},\"collapse-34\":{\"id\":\"58\",\"valor\":\"Perfil de Aluminio Color Negro\",\"categoria\":\"Canceler\\u00eda\",\"precio\":0},\"collapse-24\":{\"id\":\"13\",\"valor\":\"Granito Itaunas Pulido\",\"categoria\":\"Meseta Cocina\",\"precio\":675},\"collapse-33\":{\"id\":\"54\",\"valor\":\"Tambor de Triplay de Encino Nogal\",\"categoria\":\"Puertas\",\"precio\":7300},\"collapse-38\":{\"id\":\"71\",\"valor\":\"Acabado Aluminio Satinado\",\"categoria\":\"Accesorios Puertas\",\"precio\":0},\"collapse-35\":{\"id\":\"61\",\"valor\":\"Tablero de MDF o MDP Laminado Tipo Roble\",\"categoria\":\"Carpinter\\u00eda\",\"precio\":0},\"collapse-39\":{\"id\":\"74\",\"valor\":\"Acabado Aluminio Satinado\",\"categoria\":\"Accesorio Closets\",\"precio\":0},\"collapse-23\":{\"id\":\"9\",\"valor\":\"Marmol Blanco Arena Aventejado Mate\",\"categoria\":\"Pisos Regaderas\",\"precio\":439},\"collapse-25\":{\"id\":\"16\",\"valor\":\"Granito Itaunas Pulido\",\"categoria\":\"Mesetas Ba\\u00f1os\",\"precio\":675},\"collapse-26\":{\"id\":\"19\",\"valor\":\"M\\u00c1RMOL BLANCO ARENA PULIDO MATE. FORMATO 30 cm X LARGOS LIBRES\",\"categoria\":\"Muros Regaderas\",\"precio\":525},\"collapse-36\":{\"id\":\"65\",\"valor\":\"Grifer\\u00eda y Accesorios Acabado Cromo\",\"categoria\":\"Griferia y Accesorios de Ba\\u00f1o\",\"precio\":0},\"collapse-37\":{\"id\":\"68\",\"valor\":\"Acabado Satinado\",\"categoria\":\"Accesorios El\\u00e9ctricos\",\"precio\":0},\"collapse-29\":{\"id\":\"33\",\"valor\":\"Pintura Blanco Clara\",\"categoria\":\"Muros Exterior Base\",\"precio\":0},\"collapse-30\":{\"id\":\"39\",\"valor\":\"Pintura Blanco Clara\",\"categoria\":\"Muros Exteriores Acento 01\",\"precio\":0},\"collapse-31\":{\"id\":\"45\",\"valor\":\"Pintura Blanco Clara\",\"categoria\":\"Muros Exteriores Acento 02\",\"precio\":0}}', 'Guardada', '2025-08-13 10:13:18', '2025-08-13 10:13:18');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `jobs`
--

CREATE TABLE `jobs` (
  `id` bigint UNSIGNED NOT NULL,
  `queue` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `attempts` tinyint UNSIGNED NOT NULL,
  `reserved_at` int UNSIGNED DEFAULT NULL,
  `available_at` int UNSIGNED NOT NULL,
  `created_at` int UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `job_batches`
--

CREATE TABLE `job_batches` (
  `id` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `total_jobs` int NOT NULL,
  `pending_jobs` int NOT NULL,
  `failed_jobs` int NOT NULL,
  `failed_job_ids` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `options` mediumtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `cancelled_at` int DEFAULT NULL,
  `created_at` int NOT NULL,
  `finished_at` int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `migrations`
--

CREATE TABLE `migrations` (
  `id` int UNSIGNED NOT NULL,
  `migration` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '0001_01_01_000000_create_users_table', 1),
(2, '0001_01_01_000001_create_cache_table', 1),
(3, '0001_01_01_000002_create_jobs_table', 1),
(4, '2025_06_12_052847_create_house_configurations_table', 1),
(5, '2025_07_13_233816_create_categories_table', 1),
(6, '2025_07_13_233817_create_products_table', 1),
(7, '2025_07_16_014216_create_base_prices_table', 1),
(8, '2025_08_07_201441_create_product_renders_table', 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `password_reset_tokens`
--

CREATE TABLE `password_reset_tokens` (
  `email` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `products`
--

CREATE TABLE `products` (
  `id` bigint UNSIGNED NOT NULL,
  `category_id` bigint UNSIGNED NOT NULL,
  `style` enum('Minimalista','Tulum','Mexicano') CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `pre_code` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `variant_code` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `version` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `title` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `brand` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `base_price` decimal(10,2) NOT NULL,
  `image_url` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `product_url` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `one_bedroom_price` decimal(10,2) NOT NULL DEFAULT '0.00',
  `two_bedroom_price` decimal(10,2) NOT NULL DEFAULT '0.00',
  `three_bedroom_price` decimal(10,2) NOT NULL DEFAULT '0.00',
  `four_bedroom_price` decimal(10,2) NOT NULL DEFAULT '0.00',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `products`
--

INSERT INTO `products` (`id`, `category_id`, `style`, `pre_code`, `variant_code`, `version`, `title`, `description`, `brand`, `base_price`, `image_url`, `product_url`, `one_bedroom_price`, `two_bedroom_price`, `three_bedroom_price`, `four_bedroom_price`, `created_at`, `updated_at`) VALUES
(1, 21, 'Minimalista', 'FAC01', 'FA01', '00', 'Fachada A', NULL, '', 544.00, 'producto/1757786523_min01-01-A.webp', NULL, 0.00, 0.00, 0.00, 0.00, '2025-08-08 07:25:06', '2025-09-13 23:02:03'),
(2, 21, 'Minimalista', 'FAC01', 'FA01', '00', 'Fachada B', NULL, '', 544.00, 'producto/1757786578_BASE.webp', NULL, 0.00, 0.00, 0.00, 0.00, '2025-08-08 07:25:06', '2025-09-13 23:02:58'),
(3, 22, 'Minimalista', 'PIN01', 'M01', '00', 'MARMOL BLANCO ARENA PULIDO MATE. FORMATO 30 cm X LARGOS LIBRES', NULL, 'MIDO', 544.00, 'Minimalista/1 Pisos Interiores/Marmol Blanco Arena Pulido Mate.png', NULL, 0.00, 0.00, 0.00, 0.00, '2025-08-08 07:25:06', '2025-08-08 07:25:06'),
(4, 22, 'Minimalista', 'PIN01', 'M02', '00', 'MARMOL SANTO TOMÁS PULIDO MATE. FORMATO 30 cm x LARGOS LIBRES', NULL, 'MIDO', 530.00, 'Minimalista/1 Pisos Interiores/Marmol Santo Tomás Pulido Mate.png', NULL, 0.00, 0.00, 0.00, 0.00, '2025-08-08 07:25:06', '2025-08-08 07:25:06'),
(5, 22, 'Minimalista', 'PIN01', 'M03', '00', 'CERÁMICO TIPO CONCRETO MOD. CITYLINE COLOR LIGHT GRAY. FORMATO 60X60', NULL, 'INTERCERAMIC', 269.00, 'Minimalista/1 Pisos Interiores/Ceramico Tipo Concreto Color Light.png', NULL, 0.00, 0.00, 0.00, 0.00, '2025-08-08 07:25:06', '2025-08-08 07:25:06'),
(6, 22, 'Minimalista', 'PIN01', 'M04', '00', 'CERÁMICO TIPO CONCRETO MOD. CITYLINE COLOR DARK GRAY. FORMATO 60X60', NULL, 'INTERCERAMIC', 269.00, 'Minimalista/1 Pisos Interiores/Ceramico Tipo Concreto Color Dark Gray.png', NULL, 0.00, 0.00, 0.00, 0.00, '2025-08-08 07:25:06', '2025-08-08 07:25:06'),
(7, 22, 'Minimalista', 'PIN01', 'M05', '00', 'CERÁMICO TIPO CEMENTO MODELO CREATO COLOR IVORY. FORMATO 60X120', NULL, 'INTERCERAMIC', 359.00, 'Minimalista/1 Pisos Interiores/Cerámico Tipo Cemento Ivory.png', NULL, 0.00, 0.00, 0.00, 0.00, '2025-08-08 07:25:06', '2025-08-08 07:25:06'),
(8, 22, 'Minimalista', 'PIN01', 'M06', '00', 'CERÁMICO TIPO CEMENTO MODELO CREATO COLOR GRAFITO. FORMATO 60X120', NULL, 'INTERCERAMIC', 359.00, 'Minimalista/1 Pisos Interiores/Ceramico Tipo Cemento Color Grafito.png', NULL, 0.00, 0.00, 0.00, 0.00, '2025-08-08 07:25:06', '2025-08-08 07:25:06'),
(9, 23, 'Minimalista', 'PRE01', 'T01', '00', 'Marmol Blanco Arena Aventejado Mate', NULL, 'MIDO', 439.00, 'Minimalista/2 Pisos Regaderas/Marmol Blanco Arena Aventejado Mate.png', NULL, 0.00, 0.00, 0.00, 0.00, '2025-08-08 07:25:06', '2025-08-08 07:25:06'),
(10, 23, 'Minimalista', 'PRE01', 'T02', '00', 'Marmol Santo Tomás  Avejentado', NULL, 'MIDO', 544.00, 'Minimalista/2 Pisos Regaderas/Marmol Santo Tomás  Avejentado.png', NULL, 0.00, 0.00, 0.00, 0.00, '2025-08-08 07:25:06', '2025-08-08 07:25:06'),
(11, 23, 'Minimalista', 'PRE01', 'T03', '00', 'Ceramico Tipo Piedra Grigio', NULL, 'INTERCERAMIC', 289.00, 'Minimalista/2 Pisos Regaderas/Ceramico Tipo Piedra Grigio.png', NULL, 0.00, 0.00, 0.00, 0.00, '2025-08-08 07:25:06', '2025-08-08 07:25:06'),
(12, 23, 'Minimalista', 'PRE01', 'T04', '00', 'Ceramico Tipo Piedra Grafite', NULL, 'INTERCERAMIC', 289.00, 'Minimalista/2 Pisos Regaderas/Ceramico Tipo Piedra Grafite.png', NULL, 0.00, 0.00, 0.00, 0.00, '2025-08-08 07:25:06', '2025-08-08 07:25:06'),
(13, 24, 'Minimalista', 'MCO01', 'T01', '00', 'Granito Itaunas Pulido', NULL, 'MIDO', 675.00, 'Minimalista/3 Meseta Cocina/Granito Itaunas Pulido.png', NULL, 0.00, 0.00, 0.00, 0.00, '2025-08-08 07:25:06', '2025-08-08 07:25:06'),
(14, 24, 'Minimalista', 'MCO01', 'T02', '00', 'Granito San Gabriel Leather', NULL, 'MIDO', 675.00, 'Minimalista/3 Meseta Cocina/Granito San Gabriel Leather.png', NULL, 0.00, 0.00, 0.00, 0.00, '2025-08-08 07:25:06', '2025-08-08 07:25:06'),
(15, 24, 'Minimalista', 'MCO01', 'T03', '00', 'Granito Bahamas White', NULL, 'MIDO', 725.00, 'Minimalista/3 Meseta Cocina/Granito Bahamas White.png', NULL, 0.00, 0.00, 0.00, 0.00, '2025-08-08 07:25:06', '2025-08-08 07:25:06'),
(16, 25, 'Minimalista', 'MES02', 'T01', '00', 'Granito Itaunas Pulido', NULL, 'MIDO', 675.00, 'Minimalista/4 Meseta Baños/Granito Itaunas Pulido.png', NULL, 0.00, 0.00, 0.00, 0.00, '2025-08-08 07:25:06', '2025-08-08 07:25:06'),
(17, 25, 'Minimalista', 'MES02', 'T02', '00', 'Granito San Gabriel Leather', NULL, 'MIDO', 675.00, 'Minimalista/4 Meseta Baños/Granito San Gabriel Leather.png', NULL, 0.00, 0.00, 0.00, 0.00, '2025-08-08 07:25:06', '2025-08-08 07:25:06'),
(18, 25, 'Minimalista', 'MES02', 'T03', '00', 'Granito Bahamas White', NULL, 'MIDO', 725.00, 'Minimalista/4 Meseta Baños/Granito Bahamas White.png', NULL, 0.00, 0.00, 0.00, 0.00, '2025-08-08 07:25:06', '2025-08-08 07:25:06'),
(19, 26, 'Minimalista', 'MRE01', 'T01', '00', 'MÁRMOL BLANCO ARENA PULIDO MATE. FORMATO 30 cm X LARGOS LIBRES', NULL, 'MIDO', 525.00, 'Minimalista/5 Muros Regaderas/Marmol Blanco Arena Pulido Mate.png', NULL, 0.00, 0.00, 0.00, 0.00, '2025-08-08 07:25:06', '2025-08-08 07:25:06'),
(20, 26, 'Minimalista', 'MRE01', 'T02', '00', 'MÁRMOL SANTO TOMÁS PULIDO AVEJENTADO. FORMATO 30 cm X LARGOS LIBRES', NULL, 'MIDO', 544.00, 'Minimalista/5 Muros Regaderas/Marmol Santo Tomás Pulido Avejentado.png', NULL, 0.00, 0.00, 0.00, 0.00, '2025-08-08 07:25:06', '2025-08-08 07:25:06'),
(21, 26, 'Minimalista', 'MRE01', 'T03', '00', 'CERÁMICO TIPO PIEDRA MOD. MATERIA COLOR GRIGIO. FORMATO 60X60', NULL, 'INTERCERAMIC', 289.00, 'Minimalista/5 Muros Regaderas/Ceramico Tipo Piedra Grigio.png', NULL, 0.00, 0.00, 0.00, 0.00, '2025-08-08 07:25:06', '2025-08-08 07:25:06'),
(22, 26, 'Minimalista', 'MRE01', 'T04', '00', 'CERÁMICO TIPO PIEDRA MOD. MATERIA COLOR GRAFITE. FORMATO 60X60', NULL, 'INTERCERAMIC', 289.00, 'Minimalista/5 Muros Regaderas/Ceramico Tipo Piedra Grafite.png', NULL, 0.00, 0.00, 0.00, 0.00, '2025-08-08 07:25:06', '2025-08-08 07:25:06'),
(23, 27, 'Minimalista', 'MIB01', 'T03', '00', 'PINTURA BLANCO CLARA', NULL, 'MIDO', 35.00, 'Minimalista/6 Muros Interiores Base/Pintura Blanco Clara.png', NULL, 0.00, 0.00, 0.00, 0.00, '2025-08-08 07:25:06', '2025-08-08 07:25:06'),
(24, 27, 'Minimalista', 'MIB01', 'T05', '00', 'PLASTER CONCRETO APARENTE', NULL, 'MIDO', 50.00, 'Minimalista/6 Muros Interiores Base/Plaster Concreto Aparente.png', NULL, 0.00, 0.00, 0.00, 0.00, '2025-08-08 07:25:06', '2025-08-08 07:25:06'),
(25, 27, 'Minimalista', 'MIB01', 'T04', '00', 'PLASTER BLANCO SASCAB', NULL, 'MIDO', 50.00, 'Minimalista/6 Muros Interiores Base/Plaster Blanco Sascab.png', NULL, 0.00, 0.00, 0.00, 0.00, '2025-08-08 07:25:06', '2025-08-08 07:25:06'),
(26, 27, 'Minimalista', 'MIB01', 'T01', '00', 'GRIS ESPÁTULA', NULL, 'MIDO', 45.00, 'Minimalista/6 Muros Interiores Base/Gris Espátula.png', NULL, 0.00, 0.00, 0.00, 0.00, '2025-08-08 07:25:06', '2025-08-08 07:25:06'),
(27, 27, 'Minimalista', 'MIB01', 'T02', '00', 'NEUTRO MUSEO', NULL, 'MIDO', 40.00, 'Minimalista/6 Muros Interiores Base/Neutro Museo.png', NULL, 0.00, 0.00, 0.00, 0.00, '2025-08-08 07:25:06', '2025-08-08 07:25:06'),
(28, 28, 'Minimalista', 'MIA01', 'T03', '00', 'PINTURA BLANCO CLARA', NULL, 'MIDO', 35.00, 'Minimalista/7 Muros Interiores Acento/Pintura Blanco Clara.png', NULL, 0.00, 0.00, 0.00, 0.00, '2025-08-08 07:25:06', '2025-08-08 07:25:06'),
(29, 28, 'Minimalista', 'MIA01', 'T05', '00', 'PLASTER CONCRETO APARENTE', NULL, 'MIDO', 50.00, 'Minimalista/7 Muros Interiores Acento/Plaster Concreto Aparente.png', NULL, 0.00, 0.00, 0.00, 0.00, '2025-08-08 07:25:06', '2025-08-08 07:25:06'),
(30, 28, 'Minimalista', 'MIA01', 'T04', '00', 'PLASTER BLANCO SASCAB', NULL, 'MIDO', 50.00, 'Minimalista/7 Muros Interiores Acento/Plaster Blanco Sascab.png', NULL, 0.00, 0.00, 0.00, 0.00, '2025-08-08 07:25:06', '2025-08-08 07:25:06'),
(31, 28, 'Minimalista', 'MIA01', 'T01', '00', 'GRIS ESPÁTULA', NULL, 'MIDO', 45.00, 'Minimalista/7 Muros Interiores Acento/Gris Espátula.png', NULL, 0.00, 0.00, 0.00, 0.00, '2025-08-08 07:25:06', '2025-08-08 07:25:06'),
(32, 28, 'Minimalista', 'MIA01', 'T02', '00', 'NEUTRO MUSEO', NULL, 'MIDO', 40.00, 'Minimalista/7 Muros Interiores Acento/Neutro Museo.png', NULL, 0.00, 0.00, 0.00, 0.00, '2025-08-08 07:25:06', '2025-08-08 07:25:06'),
(33, 29, 'Minimalista', 'MEB01', 'M01', '00', 'Pintura Blanco Clara', NULL, 'COMEX', 0.00, 'Minimalista/8 Muros Exterior Base/Pintura Blanco Clara.png', NULL, 0.00, 0.00, 0.00, 0.00, '2025-08-08 07:25:06', '2025-09-16 10:30:28'),
(34, 29, 'Minimalista', 'MEB01', 'M02', '00', 'Plaster Concreto Aparente', NULL, 'KIMIKOLOR', 0.00, 'Minimalista/8 Muros Exterior Base/Plaster Concreto Aparente.png', NULL, 0.00, 0.00, 0.00, 0.00, '2025-08-08 07:25:06', '2025-09-16 10:30:50'),
(35, 29, 'Minimalista', 'MEB01', 'M03', '00', 'Plaster Blanco Sascab', NULL, 'KIMIKOLOR', 0.00, 'Minimalista/8 Muros Exterior Base/Plaster Blanco Sascab.png', NULL, 0.00, 0.00, 0.00, 0.00, '2025-08-08 07:25:06', '2025-09-16 10:31:01'),
(36, 29, 'Minimalista', 'MEB01', 'M04', '00', 'Masilla Concreto Estriado', NULL, 'KIMIKOLOR', 0.00, 'Minimalista/8 Muros Exterior Base/Masilla Concreto Estriado.png', NULL, 0.00, 0.00, 0.00, 0.00, '2025-08-08 07:25:06', '2025-09-16 10:31:11'),
(37, 29, 'Minimalista', 'MEB01', 'M05', '00', 'Gris Espátula', NULL, 'COMEX', 0.00, 'Minimalista/8 Muros Exterior Base/Gris Espátula.png', NULL, 0.00, 0.00, 0.00, 0.00, '2025-08-08 07:25:06', '2025-09-16 10:31:21'),
(38, 29, 'Minimalista', 'MEB01', 'M06', '00', 'Neutro Museo', NULL, 'COMEX', 0.00, 'Minimalista/8 Muros Exterior Base/Neutro Museo.png', NULL, 0.00, 0.00, 0.00, 0.00, '2025-08-08 07:25:06', '2025-09-16 10:31:34'),
(39, 30, 'Minimalista', 'MEA01', 'T04', '00', 'Pintura Blanco Clara', NULL, 'COMEX', 0.00, 'Minimalista/9 Muros Exterior Acento 01/Pintura Blanco Clara.png', NULL, 0.00, 0.00, 0.00, 0.00, '2025-08-08 07:25:06', '2025-08-08 07:25:06'),
(40, 30, 'Minimalista', 'MEA01', 'T03', '00', 'Plaster Concreto Aparente', NULL, 'KIMIKOLOR', 0.00, 'Minimalista/9 Muros Exterior Acento 01/Plaster Concreto Aparente.png', NULL, 0.00, 0.00, 0.00, 0.00, '2025-08-08 07:25:06', '2025-08-08 07:25:06'),
(41, 30, 'Minimalista', 'MEA01', 'T01', '00', 'Plaster Blanco Sascab', NULL, 'KIMIKOLOR', 0.00, 'Minimalista/9 Muros Exterior Acento 01/Plaster Blanco Sascab.png', NULL, 0.00, 0.00, 0.00, 0.00, '2025-08-08 07:25:06', '2025-08-08 07:25:06'),
(42, 30, 'Minimalista', 'MEA01', 'T02', '00', 'Masilla Concreto Estriado', NULL, 'KIMIKOLOR', 0.00, 'Minimalista/9 Muros Exterior Acento 01/Masilla Concreto Estriado.png', NULL, 0.00, 0.00, 0.00, 0.00, '2025-08-08 07:25:06', '2025-08-08 07:25:06'),
(43, 30, 'Minimalista', 'MEA01', 'T05', '00', 'Gris Espátula', NULL, 'COMEX', 0.00, 'Minimalista/9 Muros Exterior Acento 01/Gris Espátula.png', NULL, 0.00, 0.00, 0.00, 0.00, '2025-08-08 07:25:06', '2025-08-08 07:25:06'),
(44, 30, 'Minimalista', 'MEA01', 'T06', '00', 'Neutro Museo', NULL, 'COMEX', 0.00, 'Minimalista/9 Muros Exterior Acento 01/Neutro Museo.png', NULL, 0.00, 0.00, 0.00, 0.00, '2025-08-08 07:25:06', '2025-08-08 07:25:06'),
(45, 31, 'Minimalista', 'MEA02', 'T04', '00', 'Pintura Blanco Clara', NULL, 'COMEX', 0.00, 'Minimalista/10 Muros Exterior Acento 02/Pintura Blanco Clara.png', NULL, 0.00, 0.00, 0.00, 0.00, '2025-08-08 07:25:06', '2025-08-08 07:25:06'),
(46, 31, 'Minimalista', 'MEA02', 'T03', '00', 'Plaster Concreto Aparente', NULL, 'KIMIKOLOR', 0.00, 'Minimalista/10 Muros Exterior Acento 02/Plaster Concreto Aparente.png', NULL, 0.00, 0.00, 0.00, 0.00, '2025-08-08 07:25:06', '2025-08-08 07:25:06'),
(47, 31, 'Minimalista', 'MEA02', 'T01', '00', 'Plaster Blanco Sascab', NULL, 'KIMIKOLOR', 0.00, 'Minimalista/10 Muros Exterior Acento 02/Plaster Blanco Sascab.png', NULL, 0.00, 0.00, 0.00, 0.00, '2025-08-08 07:25:06', '2025-08-08 07:25:06'),
(48, 31, 'Minimalista', 'MEA02', 'T02', '00', 'Masilla Concreto Estriado', NULL, 'KIMIKOLOR', 0.00, 'Minimalista/10 Muros Exterior Acento 02/Masilla Concreto Estriado.png', NULL, 0.00, 0.00, 0.00, 0.00, '2025-08-08 07:25:06', '2025-08-08 09:43:33'),
(49, 31, 'Minimalista', 'MEA02', 'T05', '00', 'Gris Espátula', NULL, 'COMEX', 0.00, 'Minimalista/10 Muros Exterior Acento 02/Gris Espátula.png', NULL, 0.00, 0.00, 0.00, 0.00, '2025-08-08 07:25:06', '2025-08-08 07:25:06'),
(50, 31, 'Minimalista', 'MEA02', 'T06', '00', 'Neutro Museo', NULL, 'COMEX', 0.00, 'Minimalista/10 Muros Exterior Acento 02/Neutro Museo.png', NULL, 0.00, 0.00, 0.00, 0.00, '2025-08-08 07:25:06', '2025-08-08 07:25:06'),
(51, 32, 'Minimalista', 'PLA01', 'T01', '00', 'PINTURA BLANCO CLARA 020-01', NULL, 'COMEX', 0.00, 'Minimalista/11 Plafones/Blanco Clara.png', NULL, 0.00, 0.00, 0.00, 0.00, '2025-08-08 07:25:06', '2025-08-08 07:25:06'),
(52, 32, 'Minimalista', 'PLA01', 'T02', '00', 'Plaster Concreto Aparente', NULL, 'KIMIKOLOR', 290.00, 'Minimalista/11 Plafones/Plaster Concreto Aparente.png', NULL, 0.00, 0.00, 0.00, 0.00, '2025-08-08 07:25:06', '2025-08-08 07:25:06'),
(53, 32, 'Minimalista', 'PLA01', 'T03', '00', 'Plaster Blanco Sascab', NULL, '', 290.00, 'Minimalista/11 Plafones/Plaster Blanco Sascab.png', NULL, 0.00, 0.00, 0.00, 0.00, '2025-08-08 07:25:06', '2025-08-08 07:25:06'),
(54, 33, 'Minimalista', 'PUE01', 'T01', '00', 'Tambor de Triplay de Encino Nogal', NULL, 'BETA STUDIO', 7300.00, 'Minimalista/12 Puertas/Tambor de Triplay de Encino Nogal.png', NULL, 0.00, 0.00, 0.00, 0.00, '2025-08-08 07:25:06', '2025-08-08 07:25:06'),
(55, 33, 'Minimalista', 'PUE01', 'T02', '00', 'Tambor de Triplay de Encino Maple', NULL, 'BETA STUDIO', 8000.00, 'Minimalista/12 Puertas/Tambor de Triplay de Encino Maple.png', NULL, 0.00, 0.00, 0.00, 0.00, '2025-08-08 07:25:06', '2025-08-08 07:25:06'),
(56, 33, 'Minimalista', 'PUE01', 'T01', '00', 'Tambor de Triplay de Encino Acabado Blanco Mate Poreado', NULL, 'BETA STUDIO', 7300.00, 'Minimalista/12 Puertas/Tambor de Triplay de Encino Acabado Blanco Mate Poreado.png', NULL, 0.00, 0.00, 0.00, 0.00, '2025-08-08 07:25:06', '2025-08-08 07:25:06'),
(57, 33, 'Minimalista', 'PUE01', 'T01', '00', 'Tambor de Triplay de Encino Acabado Negro Mate Poreado', NULL, 'BETA STUDIO', 7300.00, 'Minimalista/12 Puertas/Tambor de Triplay de Encino Acabado Negro Mate Poreado.png', NULL, 0.00, 0.00, 0.00, 0.00, '2025-08-08 07:25:06', '2025-08-08 07:25:06'),
(58, 34, 'Minimalista', 'CAN01', 'T01', '00', 'Perfil de Aluminio Color Negro', NULL, '', 0.00, 'Minimalista/13 Cancelería/Perfil de Aluminio Color Negro.png', NULL, 0.00, 0.00, 0.00, 0.00, '2025-08-08 07:25:06', '2025-08-08 07:25:06'),
(59, 34, 'Minimalista', 'CAN01', 'T02', '00', 'Perfil de Aluminio Color Blanco', NULL, '', 0.00, 'Minimalista/13 Cancelería/Perfil de Aluminio Color Blanco.png', NULL, 0.00, 0.00, 0.00, 0.00, '2025-08-08 07:25:06', '2025-08-08 07:25:06'),
(60, 34, 'Minimalista', 'CAN01', 'T03', '00', 'Perfil de Aluminio Color Natural', NULL, '', 0.00, 'Minimalista/13 Cancelería/Perfil de Aluminio Color Natural.png', NULL, 0.00, 0.00, 0.00, 0.00, '2025-08-08 07:25:06', '2025-08-08 07:25:06'),
(61, 35, 'Minimalista', 'CAR01', 'T02', '00', 'Tablero de MDF o MDP Laminado Tipo Roble', NULL, '', 0.00, 'Minimalista/14 Carpintería/Tablero de MDF o MDP Laminado Tipo Roble.png', NULL, 0.00, 0.00, 0.00, 0.00, '2025-08-08 07:25:06', '2025-08-08 07:25:06'),
(62, 35, 'Minimalista', 'CAR01', 'T03', '00', 'Tablero de MDF o MDP Laminado Tipo Beige Mate Liso', NULL, '', 0.00, 'Minimalista/14 Carpintería/Tablero de MDF o MDP Laminado Tipo Beige Mate Liso.png', NULL, 0.00, 0.00, 0.00, 0.00, '2025-08-08 07:25:06', '2025-08-08 07:25:06'),
(63, 35, 'Minimalista', 'CAR01', 'T04', '00', 'Tablero de MDF o MDP Laminado Tipo Grafito Mate', NULL, '', 0.00, 'Minimalista/14 Carpintería/Tablero de MDF o MDP Laminado Tipo Grafito Mate.png', NULL, 0.00, 0.00, 0.00, 0.00, '2025-08-08 07:25:06', '2025-08-08 07:25:06'),
(64, 35, 'Minimalista', 'CAR01', 'T04', '00', 'Tablero de MDF o MDP Laminado Tipo Blanco Mate Liso', NULL, '', 0.00, 'Minimalista/14 Carpintería/Tablero de MDF o MDP Laminado Tipo Blanco Mate Liso.png', NULL, 0.00, 0.00, 0.00, 0.00, '2025-08-08 07:25:06', '2025-08-08 07:25:06'),
(65, 36, 'Minimalista', 'BAN01', 'T01', '00', 'Grifería y Accesorios Acabado Cromo', NULL, '', 0.00, 'Minimalista/15 Baños/Grifería y Accesorios Acabado Cromo.png', NULL, 0.00, 0.00, 0.00, 0.00, '2025-08-08 07:25:06', '2025-08-08 07:25:06'),
(66, 36, 'Minimalista', 'BAN01', 'T02', '00', 'Grifería y Accesorios Acabado Dorado', NULL, '', 0.00, 'Minimalista/15 Baños/Grifería y Accesorios Acabado Dorado.png', NULL, 0.00, 0.00, 0.00, 0.00, '2025-08-08 07:25:06', '2025-08-08 07:25:06'),
(67, 36, 'Minimalista', 'BAN01', 'T03', '00', 'Grifería y Accesorios Acabado Negro Mate', NULL, '', 0.00, 'Minimalista/15 Baños/Grifería y Accesorios Acabado Negro Mate.png', NULL, 0.00, 0.00, 0.00, 0.00, '2025-08-08 07:25:06', '2025-08-08 07:25:06'),
(68, 37, 'Minimalista', 'AEL01', 'T01', '00', 'Acabado Satinado', NULL, '', 0.00, 'Minimalista/16 Accesorios Eléctricos/Acabado Satinado.png', NULL, 0.00, 0.00, 0.00, 0.00, '2025-08-08 07:25:06', '2025-08-08 07:25:06'),
(69, 37, 'Minimalista', 'AEL01', 'T02', '00', 'Acabado Blanco', NULL, '', 0.00, 'Minimalista/16 Accesorios Eléctricos/Acabado Blanco.png', NULL, 0.00, 0.00, 0.00, 0.00, '2025-08-08 07:25:06', '2025-08-08 07:25:06'),
(70, 37, 'Minimalista', 'AEL01', 'T03', '00', 'Acabado Negro Mate', NULL, '', 0.00, 'Minimalista/16 Accesorios Eléctricos/Acabado Negro Mate.png', NULL, 0.00, 0.00, 0.00, 0.00, '2025-08-08 07:25:06', '2025-08-08 07:25:06'),
(71, 38, 'Minimalista', 'APU01', 'T01', '00', 'Acabado Aluminio Satinado', NULL, '', 0.00, 'Minimalista/17 Accesorio Puertas/Acabado Aluminio Satinado.png', NULL, 0.00, 0.00, 0.00, 0.00, '2025-08-08 07:25:06', '2025-08-08 07:25:06'),
(72, 38, 'Minimalista', 'APU01', 'T02', '00', 'Acabado Dorado', NULL, '', 0.00, 'Minimalista/17 Accesorio Puertas/Acabado Dorado.png', NULL, 0.00, 0.00, 0.00, 0.00, '2025-08-08 07:25:06', '2025-08-08 07:25:06'),
(73, 38, 'Minimalista', 'APU01', 'T03', '00', 'Acabado Negro Mate', NULL, '', 0.00, 'Minimalista/17 Accesorio Puertas/Acabado Negro Mate.png', NULL, 0.00, 0.00, 0.00, 0.00, '2025-08-08 07:25:06', '2025-08-08 07:25:06'),
(74, 39, 'Minimalista', 'ACL01', 'T01', '00', 'Acabado Aluminio Satinado', NULL, '', 0.00, 'Minimalista/18 Accesorio Closets/Acabado Aluminio Satinado.png', NULL, 0.00, 0.00, 0.00, 0.00, '2025-08-08 07:25:06', '2025-08-08 07:25:06'),
(75, 39, 'Minimalista', 'ACL01', 'T02', '00', 'Acabado Dorado', NULL, '', 0.00, 'Minimalista/18 Accesorio Closets/Acabado Dorado.png', NULL, 0.00, 0.00, 0.00, 0.00, '2025-08-08 07:25:06', '2025-08-08 07:25:06'),
(76, 39, 'Minimalista', 'ACL01', 'T03', '00', 'Acabado Negro Mate', NULL, '', 0.00, 'Minimalista/18 Accesorio Closets/Acabado Negro Mate.png', NULL, 0.00, 0.00, 0.00, 0.00, '2025-08-08 07:25:06', '2025-08-08 07:25:06'),
(77, 2, 'Tulum', 'PIN01', 'T01', '00', 'TRAVERTINO PUEBLA FIORITO PULIDO MATE. FORMATO 30 cm x LARGOS LIBRES', NULL, 'MIDO', 418.00, 'producto/1757478646_Image (49).png', NULL, 0.00, 0.00, 0.00, 0.00, '2025-08-26 08:17:26', '2025-09-10 09:30:46'),
(78, 2, 'Tulum', 'PIN01', 'T02', '00', 'MARMOL SANTO TOMÁS PULIDO MATE. FORMATO 30 cm x LARGOS LIBRES', NULL, 'MIDO', 530.00, 'producto/1756186433_Image (2).png', NULL, 0.00, 0.00, 0.00, 0.00, '2025-08-26 08:17:26', '2025-08-26 10:33:53'),
(79, 2, 'Tulum', 'PIN01', 'T03', '00', 'CERÁMICO TIPO MADERA. MOD. RAINFOREST COLOR TAUPE. FORMATO 20X60', NULL, 'INTERCERAMIC', 269.00, 'producto/1757478671_Image (50).png', NULL, 0.00, 0.00, 0.00, 0.00, '2025-08-26 08:17:26', '2025-09-10 09:31:11'),
(80, 2, 'Tulum', 'PIN01', 'T04', '00', 'CERÁMICO TIPO MADERA. MOD. RAINFOREST COLOR NOGAL. FORMATO 20X60', NULL, 'INTERCERAMIC', 269.00, 'producto/1757478697_Image (51).png', NULL, 0.00, 0.00, 0.00, 0.00, '2025-08-26 08:17:26', '2025-09-10 09:31:37'),
(81, 2, 'Tulum', 'PIN01', 'T05', '00', 'CERÁMICO TIPO CEMENTO MODELO CREATO COLOR TAUPE. FORMATO 60X120', NULL, 'INTERCERAMIC', 359.00, 'producto/1756186576_Image (5).png', NULL, 0.00, 0.00, 0.00, 0.00, '2025-08-26 08:17:26', '2025-08-26 10:36:16'),
(82, 2, 'Tulum', 'PIN01', 'T06', '00', 'CERÁMICO TIPO PIEDRA MODELO ACADIA COLOR TREMONT BROWN. FORMATO 60X60', NULL, 'INTERCERAMIC', 299.00, 'producto/1757478715_Image (52).png', NULL, 0.00, 0.00, 0.00, 0.00, '2025-08-26 08:17:26', '2025-09-10 09:31:55'),
(83, 3, 'Tulum', 'PRE01', 'T01', '00', 'TRAVERTINO PUEBLA FIORITO AVEJENTADO. FORMATO 30 cm x LARGOS LIBRES', NULL, 'MIDO', 439.00, 'producto/1757478808_Image (53).png', NULL, 0.00, 0.00, 0.00, 0.00, '2025-08-26 08:17:26', '2025-09-10 09:33:28'),
(84, 3, 'Tulum', 'PRE01', 'T02', '00', 'MÁRMOL SANTO TOMÁS PULIDO AVEJENTADO. FORMATO 30 cm x LARGOS LIBRES', NULL, 'MIDO', 544.00, 'producto/1757478832_Image (54).png', NULL, 0.00, 0.00, 0.00, 0.00, '2025-08-26 08:17:26', '2025-09-10 09:33:52'),
(85, 3, 'Tulum', 'PRE01', 'T03', '00', 'CERÁMICO TIPO PIEDRA MOD. MATERIA COLOR TAUPE. FORMATO 60X60', NULL, 'INTERCERAMIC', 289.00, 'producto/1756186731_Image (9).png', NULL, 0.00, 0.00, 0.00, 0.00, '2025-08-26 08:17:26', '2025-08-26 10:38:51'),
(86, 3, 'Tulum', 'PRE01', 'T04', '00', 'CERÁMICO TIPO PIEDRA MOD. MATERIA COLOR MARRONE. FORMATO 60X60', NULL, 'INTERCERAMIC', 289.00, 'producto/1756186772_Image (10).png', NULL, 0.00, 0.00, 0.00, 0.00, '2025-08-26 08:17:26', '2025-08-26 10:39:32'),
(87, 4, 'Tulum', 'MES01', 'T01', '00', 'GRANITO ITAUNAS PULIDO', NULL, 'MIDO', 80.00, 'producto/1756186859_Image (11).png', NULL, 0.00, 0.00, 0.00, 0.00, '2025-08-26 08:17:26', '2025-08-26 10:40:59'),
(88, 4, 'Tulum', 'MES01', 'T02', '00', 'GRANITO SAN GABRIEL LEATHER', NULL, 'MIDO', 95.00, 'producto/1756186896_Image (12).png', NULL, 0.00, 0.00, 0.00, 0.00, '2025-08-26 08:17:26', '2025-08-26 10:41:36'),
(89, 4, 'Tulum', 'MES01', 'T03', '00', 'GRANITO SANTA CECILIA', NULL, 'MIDO', 65.00, 'producto/1757478876_Image (55).png', NULL, 0.00, 0.00, 0.00, 0.00, '2025-08-26 08:17:26', '2025-09-10 09:34:36'),
(90, 5, 'Tulum', 'MES02', 'T01', '00', 'GRANITO ITAUNAS PULIDO', NULL, 'MIDO', 80.00, 'producto/1756186866_Image (11).png', NULL, 0.00, 0.00, 0.00, 0.00, '2025-08-26 08:17:26', '2025-08-26 10:41:06'),
(91, 5, 'Tulum', 'MES02', 'T02', '00', 'GRANITO SAN GABRIEL LEATHER', NULL, 'MIDO', 95.00, 'producto/1756186903_Image (12).png', NULL, 0.00, 0.00, 0.00, 0.00, '2025-08-26 08:17:26', '2025-08-26 10:41:43'),
(92, 5, 'Tulum', 'MES02', 'T03', '00', 'GRANITO SANTA CECILIA', NULL, 'MIDO', 65.00, 'producto/1757478884_Image (55).png', NULL, 0.00, 0.00, 0.00, 0.00, '2025-08-26 08:17:26', '2025-09-10 09:34:44'),
(93, 6, 'Tulum', 'MRE01', 'T01', '00', 'TRAVERTINO PUEBLA FIORITO AVEJENTADO. FORMATO 30 cm x LARGOS LIBRES', NULL, 'MIDO', 439.00, 'producto/1757478814_Image (53).png', NULL, 0.00, 0.00, 0.00, 0.00, '2025-08-26 08:17:26', '2025-09-10 09:33:34'),
(94, 6, 'Tulum', 'MRE01', 'T02', '00', 'MARMOL SANTO TOMÁS PULIDO AVEJENTADO. FORMATO 30 cm x LARGOS LIBRES', NULL, 'MIDO', 544.00, 'producto/1756186681_Image (8).png', NULL, 0.00, 0.00, 0.00, 0.00, '2025-08-26 08:17:26', '2025-08-26 10:38:01'),
(95, 6, 'Tulum', 'MRE01', 'T03', '00', 'CERÁMICO TIPO PIEDRA MOD. MATERIA COLOR TAUPE. FORMATO 60X60', NULL, 'INTERCERAMIC', 289.00, 'producto/1756186737_Image (9).png', NULL, 0.00, 0.00, 0.00, 0.00, '2025-08-26 08:17:26', '2025-08-26 10:38:57'),
(96, 6, 'Tulum', 'MRE01', 'T04', '00', 'CERÁMICO TIPO PIEDRA MOD. MATERIA COLOR MARRONE. FORMATO 60X60', NULL, 'INTERCERAMIC', 289.00, 'producto/1756186786_Image (10).png', NULL, 0.00, 0.00, 0.00, 0.00, '2025-08-26 08:17:26', '2025-08-26 10:39:46'),
(97, 7, 'Tulum', 'MIB01', 'T01', '00', 'PINTURA BLANCO CLARA 020-01', NULL, 'COMEX', 0.00, 'producto/1756187022_Image (15).png', NULL, 0.00, 0.00, 0.00, 0.00, '2025-08-26 08:17:26', '2025-08-26 10:43:42'),
(98, 7, 'Tulum', 'MIB01', 'T02', '00', 'PLASTER CHUKUM', NULL, 'KIMIKOLOR', 0.00, 'producto/1757479996_Image (56).png', NULL, 0.00, 0.00, 0.00, 0.00, '2025-08-26 08:17:26', '2025-09-10 09:53:16'),
(99, 7, 'Tulum', 'MIB01', 'T03', '00', 'PLASTER NARANJA TICUL', NULL, 'KIMIKOLOR', 0.00, 'producto/1756187451_Image (22).png', NULL, 0.00, 0.00, 0.00, 0.00, '2025-08-26 08:17:26', '2025-08-26 10:50:51'),
(100, 7, 'Tulum', 'MIB01', 'T04', '00', 'PLASTER CAFÉ MOTUL', NULL, 'KIMIKOLOR', 0.00, 'producto/1757480051_Image (57).png', NULL, 0.00, 0.00, 0.00, 0.00, '2025-08-26 08:17:26', '2025-09-10 09:54:11'),
(101, 7, 'Tulum', 'MIB01', 'T05', '00', 'PINTURA AMARILLO TURRÓN I4-05', NULL, 'COMEX', 0.00, 'producto/1757480105_Image (58).png', NULL, 0.00, 0.00, 0.00, 0.00, '2025-08-26 08:17:26', '2025-09-10 09:55:05'),
(102, 7, 'Tulum', 'MIB01', 'T06', '00', 'PINTURA COLOR NEUTRO YUCA 269-04', NULL, 'COMEX', 0.00, 'producto/1757480158_Image (59).png', NULL, 0.00, 0.00, 0.00, 0.00, '2025-08-26 08:17:26', '2025-09-10 09:55:58'),
(103, 7, 'Tulum', 'MIB01', 'T07', '00', 'PINTURA NARANJA INCIENSO H3-09', NULL, 'COMEX', 0.00, 'producto/1756187613_Image (26).png', NULL, 0.00, 0.00, 0.00, 0.00, '2025-08-26 08:17:26', '2025-08-26 10:53:33'),
(104, 8, 'Tulum', 'MIA01', 'T01', '00', 'PINTURA BLANCO CLARA 020-01', NULL, 'COMEX', 0.00, 'producto/1756187014_Image (15).png', NULL, 0.00, 0.00, 0.00, 0.00, '2025-08-26 08:17:26', '2025-08-26 10:43:34'),
(105, 8, 'Tulum', 'MIA01', 'T02', '00', 'PLASTER CHUKUM', NULL, 'KIMIKOLOR', 0.00, 'producto/1757480003_Image (56).png', NULL, 0.00, 0.00, 0.00, 0.00, '2025-08-26 08:17:26', '2025-09-10 09:53:23'),
(106, 8, 'Tulum', 'MIA01', 'T03', '00', 'PLASTER NARANJA TICUL', NULL, 'KIMIKOLOR', 0.00, 'producto/1756187458_Image (22).png', NULL, 0.00, 0.00, 0.00, 0.00, '2025-08-26 08:17:26', '2025-08-26 10:50:58'),
(107, 8, 'Tulum', 'MIA01', 'T04', '00', 'PLASTER CAFÉ MOTUL', NULL, 'KIMIKOLOR', 0.00, 'producto/1757480057_Image (57).png', NULL, 0.00, 0.00, 0.00, 0.00, '2025-08-26 08:17:26', '2025-09-10 09:54:17'),
(108, 8, 'Tulum', 'MIA01', 'T05', '00', 'PINTURA AMARILLO TURRÓN I4-05', NULL, 'COMEX', 0.00, 'producto/1757480110_Image (58).png', NULL, 0.00, 0.00, 0.00, 0.00, '2025-08-26 08:17:26', '2025-09-10 09:55:10'),
(109, 8, 'Tulum', 'MIA01', 'T06', '00', 'PINTURA COLOR NEUTRO YUCA 269-04', NULL, 'COMEX', 0.00, 'producto/1757480163_Image (59).png', NULL, 0.00, 0.00, 0.00, 0.00, '2025-08-26 08:17:26', '2025-09-10 09:56:03'),
(110, 8, 'Tulum', 'MIA01', 'T07', '00', 'PINTURA NARANJA INCIENSO H3-09', NULL, 'COMEX', 0.00, 'producto/1756187618_Image (26).png', NULL, 0.00, 0.00, 0.00, 0.00, '2025-08-26 08:17:26', '2025-08-26 10:53:38'),
(111, 10, 'Tulum', 'MEA01', 'T01', '00', 'LAMBRÍN MADERA ARKOWOOD EP22 TEKA', NULL, 'ARKOS', 950.00, 'producto/1757480280_Image (60).png', NULL, 0.00, 0.00, 0.00, 0.00, '2025-08-26 08:17:26', '2025-09-10 09:58:00'),
(112, 10, 'Tulum', 'MEA01', 'T02', '00', 'CHAPA LAJA CREMA MAYA IRREGULAR', NULL, '', 0.00, 'producto/1757480302_Image (61).png', NULL, 0.00, 0.00, 0.00, 0.00, '2025-08-26 08:17:26', '2025-09-10 09:58:22'),
(113, 10, 'Tulum', 'MEA01', 'T03', '00', 'PLASTER CHUKUM', NULL, 'KIMIKOLOR', 290.00, 'producto/1757480009_Image (56).png', NULL, 0.00, 0.00, 0.00, 0.00, '2025-08-26 08:17:26', '2025-09-10 09:53:29'),
(114, 10, 'Tulum', 'MEA01', 'T04', '00', 'PLASTER CAFÉ MOTUL', NULL, 'KIMIKOLOR', 290.00, 'producto/1757480063_Image (57).png', NULL, 0.00, 0.00, 0.00, 0.00, '2025-08-26 08:17:26', '2025-09-10 09:54:23'),
(115, 10, 'Tulum', 'MEA01', 'T05', '00', 'PLASTER NARANJA TICUL', NULL, 'KIMIKOLOR', 290.00, 'producto/1756187464_Image (22).png', NULL, 0.00, 0.00, 0.00, 0.00, '2025-08-26 08:17:26', '2025-08-26 10:51:04'),
(116, 10, 'Tulum', 'MEA01', 'T06', '00', 'PINTURA AMARILLO TURRÓN I4-05', NULL, 'COMEX', 0.00, 'producto/1757480117_Image (58).png', NULL, 0.00, 0.00, 0.00, 0.00, '2025-08-26 08:17:26', '2025-09-10 09:55:17'),
(117, 10, 'Tulum', 'MEA01', 'T07', '00', 'PINTURA COLOR NEUTRO YUCA 269-04', NULL, 'COMEX', 0.00, 'producto/1757480168_Image (59).png', NULL, 0.00, 0.00, 0.00, 0.00, '2025-08-26 08:17:26', '2025-09-10 09:56:08'),
(118, 10, 'Tulum', 'MEA01', 'T08', '00', 'PINTURA NARANJA INCIENSO H3-09', NULL, 'COMEX', 0.00, 'producto/1756187624_Image (26).png', NULL, 0.00, 0.00, 0.00, 0.00, '2025-08-26 08:17:26', '2025-08-26 10:53:44'),
(119, 11, 'Tulum', 'MEA02', 'T01', '00', 'LAMBRÍN MADERA ARKOWOOD EP22 TEKA', NULL, 'ARKOS', 950.00, 'producto/1757480286_Image (60).png', NULL, 0.00, 0.00, 0.00, 0.00, '2025-08-26 08:17:26', '2025-09-10 09:58:06'),
(120, 11, 'Tulum', 'MEA02', 'T02', '00', 'CHAPA LAJA CREMA MAYA IRREGULAR', NULL, '', 0.00, 'producto/1757480307_Image (61).png', NULL, 0.00, 0.00, 0.00, 0.00, '2025-08-26 08:17:26', '2025-09-10 09:58:27'),
(121, 11, 'Tulum', 'MEA02', 'T03', '00', 'PLASTER CHUKUM', NULL, 'KIMIKOLOR', 290.00, 'producto/1757480019_Image (56).png', NULL, 0.00, 0.00, 0.00, 0.00, '2025-08-26 08:17:26', '2025-09-10 09:53:39'),
(122, 11, 'Tulum', 'MEA02', 'T04', '00', 'PLASTER CAFÉ MOTUL', NULL, 'KIMIKOLOR', 290.00, 'producto/1757480069_Image (57).png', NULL, 0.00, 0.00, 0.00, 0.00, '2025-08-26 08:17:26', '2025-09-10 09:54:29'),
(123, 11, 'Tulum', 'MEA02', 'T05', '00', 'PLASTER NARANJA TICUL', NULL, 'KIMIKOLOR', 290.00, 'producto/1756187470_Image (22).png', NULL, 0.00, 0.00, 0.00, 0.00, '2025-08-26 08:17:26', '2025-08-26 10:51:10'),
(124, 11, 'Tulum', 'MEA02', 'T06', '00', 'PINTURA AMARILLO TURRÓN I4-05', NULL, 'COMEX', 0.00, 'producto/1757480123_Image (58).png', NULL, 0.00, 0.00, 0.00, 0.00, '2025-08-26 08:17:26', '2025-09-10 09:55:23'),
(125, 11, 'Tulum', 'MEA02', 'T07', '00', 'PINTURA COLOR NEUTRO YUCA 269-04', NULL, 'COMEX', 0.00, 'producto/1757480174_Image (59).png', NULL, 0.00, 0.00, 0.00, 0.00, '2025-08-26 08:17:26', '2025-09-10 09:56:14'),
(126, 11, 'Tulum', 'MEA02', 'T08', '00', 'PINTURA NARANJA INCIENSO H3-09', NULL, 'COMEX', 0.00, 'producto/1756187629_Image (26).png', NULL, 0.00, 0.00, 0.00, 0.00, '2025-08-26 08:17:26', '2025-08-26 10:53:49'),
(127, 12, 'Tulum', 'BAS01', 'T01', '00', 'CHAPA LAJA CREMA MAYA IRREGULAR', NULL, '', 0.00, 'producto/1757480312_Image (61).png', NULL, 0.00, 0.00, 0.00, 0.00, '2025-08-26 08:17:26', '2025-09-10 09:58:32'),
(128, 12, 'Tulum', 'BAS01', 'T02', '00', 'PLASTER CHUKUM', NULL, 'KIMIKOLOR', 290.00, 'producto/1757480027_Image (56).png', NULL, 0.00, 0.00, 0.00, 0.00, '2025-08-26 08:17:26', '2025-09-10 09:53:47'),
(129, 12, 'Tulum', 'BAS01', 'T03', '00', 'PLASTER CAFÉ MOTUL', NULL, 'KIMIKOLOR', 290.00, 'producto/1757480074_Image (57).png', NULL, 0.00, 0.00, 0.00, 0.00, '2025-08-26 08:17:26', '2025-09-10 09:54:34'),
(130, 12, 'Tulum', 'BAS01', 'T04', '00', 'PLASTER NARANJA TICUL', NULL, 'KIMIKOLOR', 290.00, 'producto/1756187476_Image (22).png', NULL, 0.00, 0.00, 0.00, 0.00, '2025-08-26 08:17:26', '2025-08-26 10:51:16'),
(131, 12, 'Tulum', 'BAS01', 'T05', '00', 'PINTURA AMARILLO TURRÓN I4-05', NULL, 'COMEX', 0.00, 'producto/1757480128_Image (58).png', NULL, 0.00, 0.00, 0.00, 0.00, '2025-08-26 08:17:26', '2025-09-10 09:55:28'),
(132, 12, 'Tulum', 'BAS01', 'T06', '00', 'PINTURA COLOR NEUTRO YUCA 269-04', NULL, 'COMEX', 0.00, 'producto/1757480179_Image (59).png', NULL, 0.00, 0.00, 0.00, 0.00, '2025-08-26 08:17:26', '2025-09-10 09:56:19'),
(133, 12, 'Tulum', 'BAS01', 'T07', '00', 'PINTURA NARANJA INCIENSO H3-09', NULL, 'COMEX', 0.00, 'producto/1756187635_Image (26).png', NULL, 0.00, 0.00, 0.00, 0.00, '2025-08-26 08:17:26', '2025-08-26 10:53:55'),
(134, 13, 'Tulum', 'PLA01', 'T01', '00', 'PINTURA BLANCO CLARA 020-01', NULL, 'COMEX', 0.00, 'producto/1756187006_Image (15).png', NULL, 0.00, 0.00, 0.00, 0.00, '2025-08-26 08:17:26', '2025-08-26 10:43:26'),
(135, 13, 'Tulum', 'PLA01', 'T02', '00', 'PLASTER CHUKUM', NULL, 'KIMIKOLOR', 290.00, 'producto/1757480033_Image (56).png', NULL, 0.00, 0.00, 0.00, 0.00, '2025-08-26 08:17:26', '2025-09-10 09:53:53'),
(136, 13, 'Tulum', 'PLA01', 'T03', '00', 'PLASTER CAFÉ MOTUL', NULL, 'KIMIKOLOR', 290.00, 'producto/1757480080_Image (57).png', NULL, 0.00, 0.00, 0.00, 0.00, '2025-08-26 08:17:26', '2025-09-10 09:54:40'),
(137, 14, 'Tulum', 'PUE01', 'T01', '00', 'TAMBOR DE TRIPLAY DE CAOBILLA NATURAL', NULL, 'BETA STUDIO', 7300.00, 'producto/1756187766_Image (30).png', NULL, 0.00, 0.00, 0.00, 0.00, '2025-08-26 08:17:26', '2025-08-26 10:56:06'),
(138, 14, 'Tulum', 'PUE01', 'T02', '00', 'TAMBOR DE TRIPLAY DE TZALAM NATURAL', NULL, 'BETA STUDIO', 8000.00, 'producto/1757480351_Image (62).png', NULL, 0.00, 0.00, 0.00, 0.00, '2025-08-26 08:17:26', '2025-09-10 09:59:11'),
(139, 15, 'Tulum', 'CAN01', 'T01', '00', 'PERFIL DE ALUMINIO SERIE 70 DE EUROVENT COLOR NEGRO', NULL, '', 0.00, 'producto/1756219826_Image (9).png', NULL, 0.00, 0.00, 0.00, 0.00, '2025-08-26 08:17:26', '2025-08-26 19:50:26'),
(140, 15, 'Tulum', 'CAN01', 'T02', '00', 'PERFIL DE ALUMINIO SERIE 70 DE EUROVENT COLOR CHAMPAGNE', NULL, '', 0.00, 'producto/1757480449_Image (63).png', NULL, 0.00, 0.00, 0.00, 0.00, '2025-08-26 08:17:26', '2025-09-10 10:00:49'),
(141, 15, 'Tulum', 'CAN01', 'T03', '00', 'PERFIL DE ALUMINIO SERIE 70 DE EUROVENT COLOR MADERA', NULL, '', 0.00, 'producto/1756219854_Image (10).png', NULL, 0.00, 0.00, 0.00, 0.00, '2025-08-26 08:17:26', '2025-08-26 19:50:54'),
(142, 16, 'Tulum', 'CAR01', 'T01', '00', 'TABLERO DE MDF O MDP LAMINADO TIPO NOGAL', NULL, '', 0.00, 'producto/1757480473_Image (64).png', NULL, 0.00, 0.00, 0.00, 0.00, '2025-08-26 08:17:26', '2025-09-10 10:01:13'),
(143, 16, 'Tulum', 'CAR01', 'T02', '00', 'TABLERO DE MDF O MDP LAMINADO TIPO BEIGE MATE LISO', NULL, '', 0.00, 'producto/1757478014_Image (36).png', NULL, 0.00, 0.00, 0.00, 0.00, '2025-08-26 08:17:26', '2025-09-10 09:20:14'),
(144, 16, 'Tulum', 'CAR01', 'T03', '00', 'TABLERO DE MDF O MDP LAMINADO TIPO ROBLE', NULL, '', 0.00, 'producto/1757477955_Image (35).png', NULL, 0.00, 0.00, 0.00, 0.00, '2025-08-26 08:17:26', '2025-09-10 09:19:15'),
(145, 16, 'Tulum', 'CAR01', 'T04', '00', 'TABLERO DE MDF O MDP LAMINADO TIPO BLANCO MATE LISO', NULL, '', 0.00, 'producto/1757478069_Image (38).png', NULL, 0.00, 0.00, 0.00, 0.00, '2025-08-26 08:17:26', '2025-09-10 09:21:09'),
(146, 17, 'Tulum', 'BAN01', 'T01', '00', 'GRIFERÍA Y ACCESORIOS ACABADO CROMO', NULL, '', 0.00, 'producto/1757478099_Image (39).png', NULL, 0.00, 0.00, 0.00, 0.00, '2025-08-26 08:17:26', '2025-09-10 09:21:39'),
(147, 17, 'Tulum', 'BAN01', 'T02', '00', 'GRIFERÍA Y ACCESORIOS ACABADO DORADO', NULL, '', 0.00, 'producto/1757478123_Image (40).png', NULL, 0.00, 0.00, 0.00, 0.00, '2025-08-26 08:17:26', '2025-09-10 09:22:03'),
(148, 17, 'Tulum', 'BAN01', 'T03', '00', 'GRIFERÍA Y ACCESORIOS ACABADO NEGRO MATE', NULL, '', 0.00, 'producto/1757478229_Image (42).png', NULL, 0.00, 0.00, 0.00, 0.00, '2025-08-26 08:17:26', '2025-09-10 09:23:49'),
(149, 18, 'Tulum', 'AEL01', 'T01', '00', 'ACCESORIOS ELÉCTRICOS Y LUMINARIAS ACABADO SATINADO', NULL, '', 0.00, 'producto/1757478254_Image (43).png', NULL, 0.00, 0.00, 0.00, 0.00, '2025-08-26 08:17:26', '2025-09-10 09:24:14'),
(150, 18, 'Tulum', 'AEL01', 'T02', '00', 'ACCESORIOS ELÉCTRICOS Y LUMINARIAS ACABADO BLANCO', NULL, '', 0.00, 'producto/1757478279_Image (44).png', NULL, 0.00, 0.00, 0.00, 0.00, '2025-08-26 08:17:26', '2025-09-10 09:24:39'),
(151, 18, 'Tulum', 'AEL01', 'T03', '00', 'ACCESORIOS ELÉCTRICOS Y LUMINARIAS ACABADO NEGRO MATE', NULL, '', 0.00, 'producto/1757478301_Image (45).png', NULL, 0.00, 0.00, 0.00, 0.00, '2025-08-26 08:17:26', '2025-09-10 09:25:01'),
(152, 19, 'Tulum', 'APU01', 'T01', '00', 'ACCESORIOS DE PUERTAS ACABADO ALUMINIO SATINADO', NULL, '', 0.00, 'producto/1757478352_Image (46).png', NULL, 0.00, 0.00, 0.00, 0.00, '2025-08-26 08:17:26', '2025-09-10 09:25:52'),
(153, 19, 'Tulum', 'APU01', 'T02', '00', 'ACCESORIOS DE PUERTAS ACABADO DORADO', NULL, '', 0.00, 'producto/1757478478_Image (47).png', NULL, 0.00, 0.00, 0.00, 0.00, '2025-08-26 08:17:26', '2025-09-10 09:27:58'),
(154, 19, 'Tulum', 'APU01', 'T03', '00', 'ACCESORIOS DE PUERTAS ACABADO NEGRO MATE', NULL, '', 0.00, 'producto/1757478529_Image (48).png', NULL, 0.00, 0.00, 0.00, 0.00, '2025-08-26 08:17:26', '2025-09-10 09:28:49'),
(155, 40, 'Mexicano', 'PIN01', 'X01', '00', 'Marmol Blanco Arena Pulido Mate', 'Formato 30cm x largos libres', 'MIDO', 544.00, 'producto/1756186322_Image (1).png', NULL, 0.00, 0.00, 0.00, 0.00, '2025-08-26 12:08:15', '2025-08-26 10:32:02'),
(156, 40, 'Mexicano', 'PIN01', 'X02', '00', 'MARMOL SANTO TOMÁS PULIDO MATE. FORMATO 30 cm x LARGOS LIBRES', NULL, 'MIDO', 530.00, 'producto/1756186407_Image (2).png', NULL, 0.00, 0.00, 0.00, 0.00, '2025-08-26 12:08:15', '2025-08-26 10:33:27'),
(157, 40, 'Mexicano', 'PIN01', 'X03', '00', 'CERÁMICO TIPO PIEDRA MOD. SANTA MÓNICA COLOR PIÑON. FORMATO 40X40', NULL, 'INTERCERAMIC', 195.00, 'producto/1756186491_Image (3).png', NULL, 0.00, 0.00, 0.00, 0.00, '2025-08-26 12:08:15', '2025-08-26 10:34:51'),
(158, 40, 'Mexicano', 'PIN01', 'X04', '00', 'CERÁMICO TIPO PIEDRA MOD. SANTA MÓNICA COLOR GRAFITO. FORMATO 40X40', NULL, 'INTERCERAMIC', 195.00, 'producto/1756186531_Image (4).png', NULL, 0.00, 0.00, 0.00, 0.00, '2025-08-26 12:08:15', '2025-08-26 10:35:31'),
(159, 40, 'Mexicano', 'PIN01', 'X05', '00', 'CERÁMICO TIPO CEMENTO MODELO CREATO COLOR TAUPE. FORMATO 60X120', NULL, 'INTERCERAMIC', 359.00, 'producto/1756186569_Image (5).png', NULL, 0.00, 0.00, 0.00, 0.00, '2025-08-26 12:08:15', '2025-08-26 10:36:09'),
(160, 40, 'Mexicano', 'PIN01', 'X06', '00', 'CERÁMICO TIPO CEMENTO MODELO CREATO COLOR TERRACOTA. FORMATO 60X120', NULL, 'INTERCERAMIC', 359.00, 'producto/1756186594_Image (6).png', NULL, 0.00, 0.00, 0.00, 0.00, '2025-08-26 12:08:15', '2025-08-26 10:36:34'),
(161, 41, 'Mexicano', 'PRE01', 'X01', '00', 'MARMOL BLANCO ARENA AVEJENTADO MATE. FORMATO 30 cm X LARGOS LIBRES', NULL, 'MIDO', 439.00, 'producto/1756186647_Image (7).png', NULL, 0.00, 0.00, 0.00, 0.00, '2025-08-26 12:08:15', '2025-08-26 10:37:27'),
(162, 41, 'Mexicano', 'PRE01', 'X02', '00', 'MARMOL SANTO TOMÁS PULIDO AVEJENTADO. FORMATO 30 cm x LARGOS LIBRES', NULL, 'MIDO', 544.00, 'producto/1756186674_Image (8).png', NULL, 0.00, 0.00, 0.00, 0.00, '2025-08-26 12:08:15', '2025-08-26 10:37:54'),
(163, 41, 'Mexicano', 'PRE01', 'X03', '00', 'CERÁMICO TIPO PIEDRA MOD. MATERIA COLOR TAUPE. FORMATO 60X60', NULL, 'INTERCERAMIC', 289.00, 'producto/1756186716_Image (9).png', NULL, 0.00, 0.00, 0.00, 0.00, '2025-08-26 12:08:15', '2025-08-26 10:38:36'),
(164, 41, 'Mexicano', 'PRE01', 'X04', '00', 'CERÁMICO TIPO PIEDRA MOD. MATERIA COLOR MARRONE. FORMATO 60X60', NULL, 'INTERCERAMIC', 289.00, 'producto/1756186759_Image (10).png', NULL, 0.00, 0.00, 0.00, 0.00, '2025-08-26 12:08:15', '2025-08-26 10:39:19'),
(165, 41, 'Mexicano', 'PRE01', 'X05', '00', 'CERÁMICO TIPO PIEDRA MOD. SANTA MÓNICA COLOR PIÑON. FORMATO 40X40', NULL, 'INTERCERAMIC', 195.00, 'producto/1756186497_Image (3).png', NULL, 0.00, 0.00, 0.00, 0.00, '2025-08-26 12:08:15', '2025-08-26 10:34:57'),
(166, 41, 'Mexicano', 'PRE01', 'X06', '00', 'CERÁMICO TIPO PIEDRA MOD. SANTA MÓNICA COLOR GRAFITO. FORMATO 40X40', NULL, 'INTERCERAMIC', 195.00, 'producto/1756186540_Image (4).png', NULL, 0.00, 0.00, 0.00, 0.00, '2025-08-26 12:08:15', '2025-08-26 10:35:40'),
(167, 42, 'Mexicano', 'MES01', 'X01', '00', 'GRANITO ITAUNAS PULIDO', NULL, 'MIDO', 80.00, 'producto/1756186845_Image (11).png', NULL, 0.00, 0.00, 0.00, 0.00, '2025-08-26 12:08:15', '2025-08-26 10:40:45'),
(168, 42, 'Mexicano', 'MES01', 'X02', '00', 'GRANITO SAN GABRIEL LEATHER', NULL, 'MIDO', 95.00, 'producto/1756186882_Image (12).png', NULL, 0.00, 0.00, 0.00, 0.00, '2025-08-26 12:08:15', '2025-08-26 10:41:22'),
(169, 42, 'Mexicano', 'MES01', 'X03', '00', 'GRANITO WHITE ROMANO', NULL, 'MIDO', 100.00, 'producto/1756186919_Image (13).png', NULL, 0.00, 0.00, 0.00, 0.00, '2025-08-26 12:08:15', '2025-08-26 10:41:59'),
(170, 43, 'Mexicano', 'MES02', 'X01', '00', 'GRANITO ITAUNAS PULIDO', NULL, 'MIDO', 80.00, 'producto/1756186853_Image (11).png', NULL, 0.00, 0.00, 0.00, 0.00, '2025-08-26 12:08:15', '2025-08-26 10:40:53'),
(171, 43, 'Mexicano', 'MES02', 'X02', '00', 'GRANITO SAN GABRIEL LEATHER', NULL, 'MIDO', 95.00, 'producto/1756186890_Image (12).png', NULL, 0.00, 0.00, 0.00, 0.00, '2025-08-26 12:08:15', '2025-08-26 10:41:30'),
(172, 43, 'Mexicano', 'MES02', 'X03', '00', 'GRANITO WHITE ROMANO', NULL, 'MIDO', 100.00, 'producto/1756186926_Image (13).png', NULL, 0.00, 0.00, 0.00, 0.00, '2025-08-26 12:08:15', '2025-08-26 10:42:06'),
(173, 44, 'Mexicano', 'MRE01', 'X01', '00', 'MARMOL BLANCO ARENA PULIDO MATE. FORMATO 30 cm X LARGOS LIBRES', NULL, 'MIDO', 544.00, 'producto/1756186973_Image (14).png', NULL, 0.00, 0.00, 0.00, 0.00, '2025-08-26 12:08:15', '2025-08-26 10:42:53'),
(174, 44, 'Mexicano', 'MRE01', 'X02', '00', 'MARMOL SANTO TOMÁS PULIDO MATE. FORMATO 30 cm x LARGOS LIBRES', NULL, 'MIDO', 544.00, 'producto/1756186422_Image (2).png', NULL, 0.00, 0.00, 0.00, 0.00, '2025-08-26 12:08:15', '2025-08-26 10:33:42'),
(175, 44, 'Mexicano', 'MRE01', 'X03', '00', 'CERÁMICO TIPO PIEDRA MOD. MATERIA COLOR TAUPE. FORMATO 60X60', NULL, 'INTERCERAMIC', 289.00, 'producto/1756186724_Image (9).png', NULL, 0.00, 0.00, 0.00, 0.00, '2025-08-26 12:08:15', '2025-08-26 10:38:44'),
(176, 44, 'Mexicano', 'MRE01', 'X04', '00', 'CERÁMICO TIPO PIEDRA MOD. MATERIA COLOR MARRONE. FORMATO 60X60', NULL, 'INTERCERAMIC', 289.00, 'producto/1756186765_Image (10).png', NULL, 0.00, 0.00, 0.00, 0.00, '2025-08-26 12:08:15', '2025-08-26 10:39:25'),
(177, 44, 'Mexicano', 'MRE01', 'X05', '00', 'CERÁMICO TIPO PIEDRA MOD. SANTA MÓNICA COLOR PIÑON. FORMATO 40X40', NULL, 'INTERCERAMIC', 195.00, 'producto/1756186503_Image (3).png', NULL, 0.00, 0.00, 0.00, 0.00, '2025-08-26 12:08:15', '2025-08-26 10:35:03'),
(178, 44, 'Mexicano', 'MRE01', 'X06', '00', 'CERÁMICO TIPO PIEDRA MOD. SANTA MÓNICA COLOR GRAFITO. FORMATO 40X40', NULL, 'INTERCERAMIC', 195.00, 'producto/1756186546_Image (4).png', NULL, 0.00, 0.00, 0.00, 0.00, '2025-08-26 12:08:15', '2025-08-26 10:35:46'),
(179, 45, 'Mexicano', 'MIB01', 'X01', '00', 'PINTURA BLANCO CLARA 020-01', NULL, 'COMEX', 0.00, 'producto/1756187059_Image (15).png', NULL, 0.00, 0.00, 0.00, 0.00, '2025-08-26 12:08:15', '2025-08-26 10:44:19'),
(180, 45, 'Mexicano', 'MIB01', 'X02', '00', 'PLASTER CONCRETO APARENTE', NULL, 'KIMIKOLOR', 0.00, 'producto/1756187075_Image (16).png', NULL, 0.00, 0.00, 0.00, 0.00, '2025-08-26 12:08:15', '2025-08-26 10:44:35'),
(181, 45, 'Mexicano', 'MIB01', 'X03', '00', 'PLASTER BLANCO SASCAB', NULL, 'KIMIKOLOR', 0.00, 'producto/1756187133_Image (17).png', NULL, 0.00, 0.00, 0.00, 0.00, '2025-08-26 12:08:15', '2025-08-26 10:45:33'),
(182, 45, 'Mexicano', 'MIB01', 'X04', '00', 'PINTURA GRIS ESPÁTULA 312-02', NULL, 'COMEX', 0.00, 'producto/1756187183_Image (18).png', NULL, 0.00, 0.00, 0.00, 0.00, '2025-08-26 12:08:15', '2025-08-26 10:46:23'),
(183, 45, 'Mexicano', 'MIB01', 'X05', '00', 'PINTURA NEUTRO MUSEO 276-01', NULL, 'COMEX', 0.00, 'producto/1756187220_Image (19).png', NULL, 0.00, 0.00, 0.00, 0.00, '2025-08-26 12:08:15', '2025-08-26 10:47:00'),
(184, 46, 'Mexicano', 'MIA01', 'X01', '00', 'PINTURA BLANCO CLARA 020-01', NULL, 'COMEX', 0.00, 'producto/1756187052_Image (15).png', NULL, 0.00, 0.00, 0.00, 0.00, '2025-08-26 12:08:15', '2025-08-26 10:44:12'),
(185, 46, 'Mexicano', 'MIA01', 'X02', '00', 'PLASTER CONCRETO APARENTE', NULL, 'KIMIKOLOR', 0.00, 'producto/1756187082_Image (16).png', NULL, 0.00, 0.00, 0.00, 0.00, '2025-08-26 12:08:15', '2025-08-26 10:44:42'),
(186, 46, 'Mexicano', 'MIA01', 'X03', '00', 'PLASTER BLANCO SASCAB', NULL, 'KIMIKOLOR', 0.00, 'producto/1756187139_Image (17).png', NULL, 0.00, 0.00, 0.00, 0.00, '2025-08-26 12:08:15', '2025-08-26 10:45:39'),
(187, 46, 'Mexicano', 'MIA01', 'X04', '00', 'PLASTER ROSA', NULL, 'KIMIKOLOR', 0.00, 'producto/1756187359_Image (20).png', NULL, 0.00, 0.00, 0.00, 0.00, '2025-08-26 12:08:15', '2025-08-26 10:49:19'),
(188, 46, 'Mexicano', 'MIA01', 'X05', '00', 'PLASTER AZUL', NULL, 'KIMIKOLOR', 0.00, 'producto/1756187397_Image (21).png', NULL, 0.00, 0.00, 0.00, 0.00, '2025-08-26 12:08:15', '2025-08-26 10:49:57'),
(189, 46, 'Mexicano', 'MIA01', 'X06', '00', 'PLASTER NARANJA TICUL', NULL, 'KIMIKOLOR', 0.00, 'producto/1756187432_Image (22).png', NULL, 0.00, 0.00, 0.00, 0.00, '2025-08-26 12:08:15', '2025-08-26 10:50:32'),
(190, 46, 'Mexicano', 'MIA01', 'X07', '00', 'PLASTER ROJO CONKAL', NULL, 'KIMIKOLOR', 0.00, 'producto/1756187500_Image (23).png', NULL, 0.00, 0.00, 0.00, 0.00, '2025-08-26 12:08:15', '2025-08-26 10:51:40'),
(191, 46, 'Mexicano', 'MIA01', 'X08', '00', 'PINTURA GRIS ESPÁTULA 312-02', NULL, 'COMEX', 0.00, 'producto/1756187188_Image (18).png', NULL, 0.00, 0.00, 0.00, 0.00, '2025-08-26 12:08:15', '2025-08-26 10:46:28'),
(192, 46, 'Mexicano', 'MIA01', 'X09', '00', 'PINTURA NEUTRO MUSEO 276-01', NULL, 'COMEX', 0.00, 'producto/1756187227_Image (19).png', NULL, 0.00, 0.00, 0.00, 0.00, '2025-08-26 12:08:15', '2025-08-26 10:47:07'),
(193, 46, 'Mexicano', 'MIA01', 'X10', '00', 'PINTURA ROJO AJIJIC 083-03', NULL, 'COMEX', 0.00, 'producto/1756187524_Image (24).png', NULL, 0.00, 0.00, 0.00, 0.00, '2025-08-26 12:08:15', '2025-08-26 10:52:04'),
(194, 46, 'Mexicano', 'MIA01', 'X11', '00', 'PINTURA AZUL SURF 176-03', NULL, 'COMEX', 0.00, 'producto/1756187553_Image (25).png', NULL, 0.00, 0.00, 0.00, 0.00, '2025-08-26 12:08:15', '2025-08-26 10:52:33'),
(195, 46, 'Mexicano', 'MIA01', 'X12', '00', 'PINTURA NARANJA INCIENSO H3-09', NULL, 'COMEX', 0.00, 'producto/1756187597_Image (26).png', NULL, 0.00, 0.00, 0.00, 0.00, '2025-08-26 12:08:15', '2025-08-26 10:53:17'),
(196, 46, 'Mexicano', 'MIA01', 'X13', '00', 'PINTURA MORADO ANTICA A4-08', NULL, 'COMEX', 0.00, 'producto/1756187650_Image (27).png', NULL, 0.00, 0.00, 0.00, 0.00, '2025-08-26 12:08:15', '2025-08-26 10:54:10'),
(197, 46, 'Mexicano', 'MIA01', 'X14', '00', 'PINTURA ROJO AMAPOLA D2-14', NULL, 'COMEX', 0.00, 'producto/1756187677_Image (28).png', NULL, 0.00, 0.00, 0.00, 0.00, '2025-08-26 12:08:15', '2025-08-26 10:54:37'),
(198, 47, 'Mexicano', 'MEB01', 'X01', '00', 'PINTURA BLANCO CLARA 020-01', NULL, 'COMEX', 0.00, 'producto/1756187045_Image (15).png', NULL, 0.00, 0.00, 0.00, 0.00, '2025-08-26 12:08:15', '2025-08-26 10:44:05'),
(199, 47, 'Mexicano', 'MEB01', 'X02', '00', 'PLASTER CONCRETO APARENTE', NULL, 'KIMIKOLOR', 0.00, 'producto/1756187088_Image (16).png', NULL, 0.00, 0.00, 0.00, 0.00, '2025-08-26 12:08:15', '2025-08-26 10:44:48'),
(200, 47, 'Mexicano', 'MEB01', 'X03', '00', 'PLASTER BLANCO SASCAB', NULL, 'KIMIKOLOR', 0.00, 'producto/1756187145_Image (17).png', NULL, 0.00, 0.00, 0.00, 0.00, '2025-08-26 12:08:15', '2025-08-26 10:45:45'),
(201, 47, 'Mexicano', 'MEB01', 'X04', '00', 'PLASTER ROSA', NULL, 'KIMIKOLOR', 0.00, 'producto/1756187365_Image (20).png', NULL, 0.00, 0.00, 0.00, 0.00, '2025-08-26 12:08:15', '2025-08-26 10:49:25'),
(202, 47, 'Mexicano', 'MEB01', 'X05', '00', 'PLASTER AZUL', NULL, 'KIMIKOLOR', 0.00, 'producto/1756187404_Image (21).png', NULL, 0.00, 0.00, 0.00, 0.00, '2025-08-26 12:08:15', '2025-08-26 10:50:04'),
(203, 47, 'Mexicano', 'MEB01', 'X06', '00', 'PLASTER NARANJA TICUL', NULL, 'KIMIKOLOR', 0.00, 'producto/1756187439_Image (22).png', NULL, 0.00, 0.00, 0.00, 0.00, '2025-08-26 12:08:15', '2025-08-26 10:50:39'),
(204, 47, 'Mexicano', 'MEB01', 'X07', '00', 'PLASTER ROJO', NULL, 'KIMIKOLOR', 0.00, 'producto/1756187729_Image (29).png', NULL, 0.00, 0.00, 0.00, 0.00, '2025-08-26 12:08:15', '2025-08-26 10:55:29'),
(205, 47, 'Mexicano', 'MEB01', 'X08', '00', 'PINTURA GRIS ESPÁTULA 312-02', NULL, 'COMEX', 0.00, 'producto/1756187195_Image (18).png', NULL, 0.00, 0.00, 0.00, 0.00, '2025-08-26 12:08:15', '2025-08-26 10:46:35'),
(206, 47, 'Mexicano', 'MEB01', 'X09', '00', 'PINTURA NEUTRO MUSEO 276-01', NULL, 'COMEX', 0.00, 'producto/1756187234_Image (19).png', NULL, 0.00, 0.00, 0.00, 0.00, '2025-08-26 12:08:15', '2025-08-26 10:47:14'),
(207, 47, 'Mexicano', 'MEB01', 'X10', '00', 'PINTURA ROJO AJIJIC 083-03', NULL, 'COMEX', 0.00, 'producto/1756187529_Image (24).png', NULL, 0.00, 0.00, 0.00, 0.00, '2025-08-26 12:08:15', '2025-08-26 10:52:09'),
(208, 47, 'Mexicano', 'MEB01', 'X11', '00', 'PINTURA AZUL SURF 176-03', NULL, 'COMEX', 0.00, 'producto/1756187558_Image (25).png', NULL, 0.00, 0.00, 0.00, 0.00, '2025-08-26 12:08:15', '2025-08-26 10:52:38'),
(209, 47, 'Mexicano', 'MEB01', 'X12', '00', 'PINTURA NARANJA INCIENSO H3-09', NULL, 'COMEX', 0.00, 'producto/1756187602_Image (26).png', NULL, 0.00, 0.00, 0.00, 0.00, '2025-08-26 12:08:15', '2025-08-26 10:53:22'),
(210, 47, 'Mexicano', 'MEB01', 'X13', '00', 'PINTURA MORADO ANTICA A4-08', NULL, 'COMEX', 0.00, 'producto/1756187658_Image (27).png', NULL, 0.00, 0.00, 0.00, 0.00, '2025-08-26 12:08:15', '2025-08-26 10:54:18'),
(211, 47, 'Mexicano', 'MEB01', 'X14', '00', 'PINTURA ROJO AMAPOLA D2-14', NULL, 'COMEX', 0.00, 'producto/1756187683_Image (28).png', NULL, 0.00, 0.00, 0.00, 0.00, '2025-08-26 12:08:15', '2025-08-26 10:54:43'),
(212, 48, 'Mexicano', 'MEA01', 'X01', '00', 'PINTURA BLANCO CLARA 020-01', NULL, 'COMEX', 0.00, 'producto/1756187036_Image (15).png', NULL, 0.00, 0.00, 0.00, 0.00, '2025-08-26 12:08:15', '2025-08-26 10:43:56'),
(213, 48, 'Mexicano', 'MEA01', 'X02', '00', 'PLASTER CONCRETO APARENTE', NULL, 'KIMIKOLOR', 0.00, 'producto/1756187095_Image (16).png', NULL, 0.00, 0.00, 0.00, 0.00, '2025-08-26 12:08:15', '2025-08-26 10:44:55'),
(214, 48, 'Mexicano', 'MEA01', 'X03', '00', 'PLASTER BLANCO SASCAB', NULL, 'KIMIKOLOR', 0.00, 'producto/1756187127_Image (17).png', NULL, 0.00, 0.00, 0.00, 0.00, '2025-08-26 12:08:15', '2025-08-26 10:45:27'),
(215, 48, 'Mexicano', 'MEA01', 'X04', '00', 'PLASTER ROSA', NULL, 'KIMIKOLOR', 0.00, 'producto/1756187371_Image (20).png', NULL, 0.00, 0.00, 0.00, 0.00, '2025-08-26 12:08:15', '2025-08-26 10:49:31'),
(216, 48, 'Mexicano', 'MEA01', 'X05', '00', 'PLASTER AZUL', NULL, 'KIMIKOLOR', 0.00, 'producto/1756187411_Image (21).png', NULL, 0.00, 0.00, 0.00, 0.00, '2025-08-26 12:08:15', '2025-08-26 10:50:11'),
(217, 48, 'Mexicano', 'MEA01', 'X06', '00', 'PLASTER NARANJA TICUL', NULL, 'KIMIKOLOR', 0.00, 'producto/1756187444_Image (22).png', NULL, 0.00, 0.00, 0.00, 0.00, '2025-08-26 12:08:15', '2025-08-26 10:50:44'),
(218, 48, 'Mexicano', 'MEA01', 'X07', '00', 'PLASTER ROJO CONKAL', NULL, 'KIMIKOLOR', 0.00, 'producto/1756187506_Image (23).png', NULL, 0.00, 0.00, 0.00, 0.00, '2025-08-26 12:08:15', '2025-08-26 10:51:46'),
(219, 48, 'Mexicano', 'MEA01', 'X08', '00', 'PINTURA GRIS ESPÁTULA 312-02', NULL, 'COMEX', 0.00, 'producto/1756187201_Image (18).png', NULL, 0.00, 0.00, 0.00, 0.00, '2025-08-26 12:08:15', '2025-08-26 10:46:41'),
(220, 48, 'Mexicano', 'MEA01', 'X09', '00', 'PINTURA NEUTRO MUSEO 276-01', NULL, 'COMEX', 0.00, 'producto/1756187239_Image (19).png', NULL, 0.00, 0.00, 0.00, 0.00, '2025-08-26 12:08:15', '2025-08-26 10:47:19');
INSERT INTO `products` (`id`, `category_id`, `style`, `pre_code`, `variant_code`, `version`, `title`, `description`, `brand`, `base_price`, `image_url`, `product_url`, `one_bedroom_price`, `two_bedroom_price`, `three_bedroom_price`, `four_bedroom_price`, `created_at`, `updated_at`) VALUES
(221, 48, 'Mexicano', 'MEA01', 'X10', '00', 'PINTURA ROJO AJIJIC 083-03', NULL, 'COMEX', 0.00, 'producto/1756187535_Image (24).png', NULL, 0.00, 0.00, 0.00, 0.00, '2025-08-26 12:08:15', '2025-08-26 10:52:15'),
(222, 48, 'Mexicano', 'MEA01', 'X11', '00', 'PINTURA AZUL SURF 176-03', NULL, 'COMEX', 0.00, 'producto/1756187576_Image (25).png', NULL, 0.00, 0.00, 0.00, 0.00, '2025-08-26 12:08:15', '2025-08-26 10:52:56'),
(223, 48, 'Mexicano', 'MEA01', 'X12', '00', 'PINTURA NARANJA INCIENSO H3-09', NULL, 'COMEX', 0.00, 'producto/1756187607_Image (26).png', NULL, 0.00, 0.00, 0.00, 0.00, '2025-08-26 12:08:15', '2025-08-26 10:53:27'),
(224, 48, 'Mexicano', 'MEA01', 'X13', '00', 'PINTURA MORADO ANTICA A4-08', NULL, 'COMEX', 0.00, 'producto/1756187664_Image (27).png', NULL, 0.00, 0.00, 0.00, 0.00, '2025-08-26 12:08:15', '2025-08-26 10:54:24'),
(225, 48, 'Mexicano', 'MEA01', 'X14', '00', 'PINTURA ROJO AMAPOLA D2-14', NULL, 'COMEX', 0.00, 'producto/1756187688_Image (28).png', NULL, 0.00, 0.00, 0.00, 0.00, '2025-08-26 12:08:15', '2025-08-26 10:54:48'),
(226, 49, 'Mexicano', 'PLA01', 'X01', '00', 'PINTURA BLANCO CLARA 020-01', NULL, 'COMEX', 0.00, 'producto/1756187029_Image (15).png', NULL, 0.00, 0.00, 0.00, 0.00, '2025-08-26 12:08:15', '2025-08-26 10:43:49'),
(227, 49, 'Mexicano', 'PLA01', 'X02', '00', 'PLASTER CONCRETO APARENTE', NULL, 'KIMIKOLOR', 0.00, 'producto/1756187101_Image (16).png', NULL, 0.00, 0.00, 0.00, 0.00, '2025-08-26 12:08:15', '2025-08-26 10:45:01'),
(228, 49, 'Mexicano', 'PLA01', 'X03', '00', 'PLASTER BLANCO SASCAB', NULL, 'KIMIKOLOR', 0.00, 'producto/1756187120_Image (17).png', NULL, 0.00, 0.00, 0.00, 0.00, '2025-08-26 12:08:15', '2025-08-26 10:45:20'),
(229, 50, 'Mexicano', 'PUE01', 'X01', '00', 'TAMBOR DE TRIPLAY DE CAOBILLA NATURAL', NULL, 'BETA STUDIO', 7300.00, 'producto/1756187760_Image (30).png', NULL, 0.00, 0.00, 0.00, 0.00, '2025-08-26 12:08:15', '2025-08-26 10:56:00'),
(230, 50, 'Mexicano', 'PUE01', 'X02', '00', 'TAMBOR DE TRIPLAY DE ENCINO ENTINTADO NOGAL', NULL, 'BETA STUDIO', 7700.00, 'producto/1756187783_Image (31).png', NULL, 0.00, 0.00, 0.00, 0.00, '2025-08-26 12:08:15', '2025-08-26 10:56:23'),
(231, 50, 'Mexicano', 'PUE01', 'X03', '00', 'TAMBOR DE TRIPLAY DE ENCINO ENTINTADO CEDRO', NULL, 'BETA STUDIO', 7700.00, 'producto/1756188610_Image (32).png', NULL, 0.00, 0.00, 0.00, 0.00, '2025-08-26 12:08:15', '2025-08-26 11:10:10'),
(232, 51, 'Mexicano', 'CAN01', 'X01', '00', 'PERFIL DE ALUMINIO SERIE 70 DE EUROVENT COLOR NEGRO', NULL, '', 0.00, 'producto/1756219819_Image (9).png', NULL, 0.00, 0.00, 0.00, 0.00, '2025-08-26 12:08:15', '2025-08-26 19:50:19'),
(233, 51, 'Mexicano', 'CAN01', 'X02', '00', 'PERFIL DE ALUMINIO SERIE 70 DE EUROVENT COLOR CHAMPAGNE', NULL, '', 0.00, 'producto/Image34.png', NULL, 0.00, 0.00, 0.00, 0.00, '2025-08-26 12:08:15', '2025-08-26 12:08:15'),
(234, 51, 'Mexicano', 'CAN01', 'X03', '00', 'PERFIL DE ALUMINIO SERIE 70 DE EUROVENT COLOR MADERA', NULL, '', 0.00, 'producto/1756219847_Image (10).png', NULL, 0.00, 0.00, 0.00, 0.00, '2025-08-26 12:08:15', '2025-08-26 19:50:47'),
(235, 51, 'Mexicano', 'CAN01', 'X04', '00', 'PERFIL DE ALUMINIO SERIE 70 DE EUROVENT COLOR BLANCO', NULL, '', 0.00, 'producto/1756219869_Image (11).png', NULL, 0.00, 0.00, 0.00, 0.00, '2025-08-26 12:08:15', '2025-08-26 19:51:09'),
(236, 52, 'Mexicano', 'CAR01', 'X01', '00', 'TABLERO DE MDF O MDP LAMINADO TIPO ROBLE', NULL, '', 0.00, 'producto/1757477945_Image (35).png', NULL, 0.00, 0.00, 0.00, 0.00, '2025-08-26 12:08:15', '2025-09-10 09:19:05'),
(237, 52, 'Mexicano', 'CAR01', 'X02', '00', 'TABLERO DE MDF O MDP LAMINADO TIPO BEIGE MATE LISO', NULL, '', 0.00, 'producto/1757478007_Image (36).png', NULL, 0.00, 0.00, 0.00, 0.00, '2025-08-26 12:08:15', '2025-09-10 09:20:07'),
(238, 52, 'Mexicano', 'CAR01', 'X03', '00', 'TABLERO DE MDF O MDP LAMINADO TIPO CEDRO', NULL, '', 0.00, 'producto/1757478041_Image (37).png', NULL, 0.00, 0.00, 0.00, 0.00, '2025-08-26 12:08:15', '2025-09-10 09:20:41'),
(239, 52, 'Mexicano', 'CAR01', 'X04', '00', 'TABLERO DE MDF O MDP LAMINADO TIPO BLANCO MATE LISO', NULL, '', 0.00, 'producto/1757478062_Image (38).png', NULL, 0.00, 0.00, 0.00, 0.00, '2025-08-26 12:08:15', '2025-09-10 09:21:02'),
(240, 53, 'Mexicano', 'BAN01', 'X01', '00', 'GRIFERÍA Y ACCESORIOS ACABADO CROMO', NULL, '', 0.00, 'producto/1757478092_Image (39).png', NULL, 0.00, 0.00, 0.00, 0.00, '2025-08-26 12:08:15', '2025-09-10 09:21:32'),
(241, 53, 'Mexicano', 'BAN01', 'X02', '00', 'GRIFERÍA Y ACCESORIOS ACABADO DORADO', NULL, '', 0.00, 'producto/1757478116_Image (40).png', NULL, 0.00, 0.00, 0.00, 0.00, '2025-08-26 12:08:15', '2025-09-10 09:21:56'),
(242, 53, 'Mexicano', 'BAN01', 'X03', '00', 'GRIFERÍA Y ACCESORIOS ACABADO NEGRO MATE', NULL, '', 0.00, 'producto/1757478223_Image (42).png', NULL, 0.00, 0.00, 0.00, 0.00, '2025-08-26 12:08:15', '2025-09-10 09:23:43'),
(243, 54, 'Mexicano', 'AEL01', 'X01', '00', 'ACCESORIOS ELÉCTRICOS Y LUMINARIAS ACABADO SATINADO', NULL, '', 0.00, 'producto/1757478248_Image (43).png', NULL, 0.00, 0.00, 0.00, 0.00, '2025-08-26 12:08:15', '2025-09-10 09:24:08'),
(244, 54, 'Mexicano', 'AEL01', 'X02', '00', 'ACCESORIOS ELÉCTRICOS Y LUMINARIAS ACABADO BLANCO', NULL, '', 0.00, 'producto/1757478272_Image (44).png', NULL, 0.00, 0.00, 0.00, 0.00, '2025-08-26 12:08:15', '2025-09-10 09:24:32'),
(245, 54, 'Mexicano', 'AEL01', 'X03', '00', 'ACCESORIOS ELÉCTRICOS Y LUMINARIAS ACABADO NEGRO MATE', NULL, '', 0.00, 'producto/1757478295_Image (45).png', NULL, 0.00, 0.00, 0.00, 0.00, '2025-08-26 12:08:15', '2025-09-10 09:24:55'),
(246, 55, 'Mexicano', 'APU01', 'X01', '00', 'ACCESORIOS DE PUERTAS ACABADO ALUMINIO SATINADO', NULL, '', 0.00, 'producto/1757478331_Image (46).png', NULL, 0.00, 0.00, 0.00, 0.00, '2025-08-26 12:08:15', '2025-09-10 09:25:31'),
(247, 55, 'Mexicano', 'APU01', 'X02', '00', 'ACCESORIOS DE PUERTAS ACABADO DORADO', NULL, '', 0.00, 'producto/1757478467_Image (47).png', NULL, 0.00, 0.00, 0.00, 0.00, '2025-08-26 12:08:15', '2025-09-10 09:27:47'),
(248, 55, 'Mexicano', 'APU01', 'X03', '00', 'ACCESORIOS DE PUERTAS ACABADO NEGRO MATE', NULL, '', 0.00, 'producto/1757478516_Image (48).png', NULL, 0.00, 0.00, 0.00, 0.00, '2025-08-26 12:08:15', '2025-09-10 09:28:36'),
(249, 56, 'Mexicano', 'ACL01', 'X01', '00', 'ACCESORIOS DE PUERTAS ACABADO ALUMINIO SATINADO', NULL, '', 0.00, 'producto/1757478339_Image (46).png', NULL, 0.00, 0.00, 0.00, 0.00, '2025-08-26 12:08:15', '2025-09-10 09:25:39'),
(250, 56, 'Mexicano', 'ACL01', 'X02', '00', 'ACCESORIOS DE PUERTAS ACABADO DORADO', NULL, '', 0.00, 'producto/1757478473_Image (47).png', NULL, 0.00, 0.00, 0.00, 0.00, '2025-08-26 12:08:15', '2025-09-10 09:27:53'),
(251, 56, 'Mexicano', 'ACL01', 'X03', '00', 'ACCESORIOS DE PUERTAS ACABADO NEGRO MATE', NULL, '', 0.00, 'producto/1757478523_Image (48).png', NULL, 0.00, 0.00, 0.00, 0.00, '2025-08-26 12:08:15', '2025-09-10 09:28:43'),
(252, 57, 'Mexicano', 'CAR01', 'T01', '00', 'Tablero de MDF o MDP Laminado Tipo Roble', NULL, '', 0.00, 'Minimalista/14 Carpintería/Tablero de MDF o MDP Laminado Tipo Roble.png', NULL, 0.00, 0.00, 0.00, 0.00, '2025-08-08 12:25:06', '2025-08-08 12:25:06'),
(253, 57, 'Mexicano', 'CAR01', 'T02', '00', 'Tablero de MDF o MDP Laminado Tipo Beige Mate Liso', NULL, '', 0.00, 'producto/1757483233_Image (65).png', NULL, 0.00, 0.00, 0.00, 0.00, '2025-08-08 12:25:06', '2025-09-10 10:47:13'),
(254, 57, 'Mexicano', 'CAR01', 'T03', '00', 'Tablero de MDF o MDP Laminado Tipo Cedro', NULL, '', 0.00, 'producto/1757483251_Image (66).png', NULL, 0.00, 0.00, 0.00, 0.00, '2025-08-08 12:25:06', '2025-09-10 10:47:31'),
(255, 57, 'Mexicano', 'CAR01', 'T04', '00', 'Tablero de MDF o MDP Laminado Tipo Blanco Mate Liso', NULL, '', 0.00, 'producto/1757483270_Image (67).png', NULL, 0.00, 0.00, 0.00, 0.00, '2025-08-08 12:25:06', '2025-09-10 10:47:50'),
(256, 21, 'Minimalista', 'FAC02', 'FA02', '00', 'Fachada 2A', NULL, '', 544.00, 'producto/1757787324_BASE.webp', NULL, 0.00, 0.00, 0.00, 0.00, '2025-08-08 12:25:06', '2025-09-13 23:15:24'),
(257, 21, 'Minimalista', 'FAC02', 'FA02', '00', 'Fachada 2B', NULL, 'MIDO', 544.00, 'producto/1757787342_BASE.webp', NULL, 0.00, 0.00, 0.00, 0.00, '2025-08-08 12:25:06', '2025-09-13 23:15:42'),
(258, 21, 'Minimalista', 'FAC03', 'FA03', '00', 'Fachada 3A', NULL, '', 544.00, 'producto/1757787356_BASE.webp', NULL, 0.00, 0.00, 0.00, 0.00, '2025-08-08 12:25:06', '2025-09-13 23:15:56'),
(259, 21, 'Minimalista', 'FAC03', 'FA03', '00', 'Fachada 3B', NULL, 'MIDO', 544.00, 'producto/1757787372_BASE.webp', NULL, 0.00, 0.00, 0.00, 0.00, '2025-08-08 12:25:06', '2025-09-13 23:16:12'),
(260, 21, 'Minimalista', 'FAC04', 'FA04', '00', 'Fachada 4A', NULL, '', 544.00, 'producto/1757787403_BASE.webp', NULL, 0.00, 0.00, 0.00, 0.00, '2025-08-08 12:25:06', '2025-09-13 23:16:43'),
(261, 1, 'Tulum', 'FAC01', 'FA01', '00', 'Fachada A', NULL, '', 544.00, 'producto/1757923602_BASE.webp', NULL, 0.00, 0.00, 0.00, 0.00, '2025-08-08 12:25:06', '2025-09-15 13:06:42'),
(262, 1, 'Tulum', 'FAC01', 'FA01', '00', 'Fachada B', NULL, '', 544.00, 'producto/1757923623_BASE.webp', NULL, 0.00, 0.00, 0.00, 0.00, '2025-08-08 12:25:06', '2025-09-15 13:07:03'),
(263, 1, 'Tulum', 'FAC02', 'FA01', '00', 'Fachada 2A', NULL, '', 544.00, 'producto/1757923653_BASE.webp', NULL, 0.00, 0.00, 0.00, 0.00, '2025-08-08 12:25:06', '2025-09-15 13:07:33'),
(264, 1, 'Tulum', 'FAC02', 'FA01', '00', 'Fachada 2B', NULL, '', 544.00, 'producto/1757923667_BASE.webp', NULL, 0.00, 0.00, 0.00, 0.00, '2025-08-08 12:25:06', '2025-09-15 13:07:47'),
(265, 1, 'Tulum', 'FAC03', 'FA01', '00', 'Fachada 3A', NULL, '', 544.00, 'producto/1757923683_BASE.webp', NULL, 0.00, 0.00, 0.00, 0.00, '2025-08-08 12:25:06', '2025-09-15 13:08:03'),
(266, 1, 'Tulum', 'FAC03', 'FA01', '00', 'Fachada 3B', NULL, '', 544.00, 'producto/1757923696_BASE.webp', NULL, 0.00, 0.00, 0.00, 0.00, '2025-08-08 12:25:06', '2025-09-15 13:08:16'),
(267, 1, 'Tulum', 'FAC04', 'FA01', '00', 'Fachada 4A', NULL, '', 544.00, 'producto/1757923708_BASE.webp', NULL, 0.00, 0.00, 0.00, 0.00, '2025-08-08 12:25:06', '2025-09-15 13:08:28'),
(268, 58, 'Mexicano', 'FAC01', 'FA01', '00', 'Fachada A', NULL, '', 544.00, 'producto/1757926727_1A-MEX-Frontal-BASE.webp', NULL, 0.00, 0.00, 0.00, 0.00, '2025-08-08 12:25:06', '2025-09-15 13:58:47'),
(269, 58, 'Mexicano', 'FAC01', 'FA01', '00', 'Fachada B', NULL, '', 544.00, 'producto/1757926739_1B-Mex-Frontal-BASE.webp', NULL, 0.00, 0.00, 0.00, 0.00, '2025-08-08 12:25:06', '2025-09-15 13:58:59'),
(270, 58, 'Mexicano', 'FAC02', 'FA01', '00', 'Fachada 2A', NULL, '', 544.00, 'producto/1757926765_2A-Mex-Frontal-BASE.webp', NULL, 0.00, 0.00, 0.00, 0.00, '2025-08-08 12:25:06', '2025-09-15 13:59:25'),
(271, 58, 'Mexicano', 'FAC02', 'FA01', '00', 'Fachada 2B', NULL, '', 544.00, 'producto/1757926777_2B-Mex-Frontal-BASE.webp', NULL, 0.00, 0.00, 0.00, 0.00, '2025-08-08 12:25:06', '2025-09-15 13:59:37'),
(272, 58, 'Mexicano', 'FAC03', 'FA01', '00', 'Fachada 3A', NULL, '', 544.00, 'producto/1757926789_3A-Mex-Frontal-BASE.webp', NULL, 0.00, 0.00, 0.00, 0.00, '2025-08-08 12:25:06', '2025-09-15 13:59:49'),
(273, 58, 'Mexicano', 'FAC03', 'FA01', '00', 'Fachada 3B', NULL, '', 544.00, 'producto/1757926800_3B-Mex-Frontal-BASE.webp', NULL, 0.00, 0.00, 0.00, 0.00, '2025-08-08 12:25:06', '2025-09-15 14:00:00'),
(274, 58, 'Mexicano', 'FAC04', 'FA01', '00', 'Fachada 4A', NULL, '', 544.00, 'producto/1757926811_4A-Mex-Frontal-BASE.webp', NULL, 0.00, 0.00, 0.00, 0.00, '2025-08-08 12:25:06', '2025-09-15 14:00:11'),
(275, 9, 'Tulum', 'MEB01', 'T01', '00', 'Plaster Chukum', NULL, 'KIMIKOLOR', 0.00, 'producto/1758514181_Image (68).png', NULL, 290.00, 390.00, 490.00, 490.00, '2025-09-18 05:24:58', '2025-09-22 09:09:41'),
(276, 9, 'Tulum', 'MEB01', 'T02', '00', 'Plaster Café Motul', NULL, 'KIMIKOLOR', 0.00, 'producto/1758514215_Image (69).png', NULL, 290.00, 390.00, 490.00, 490.00, '2025-09-18 05:24:58', '2025-09-22 09:10:15'),
(277, 9, 'Tulum', 'MEB01', 'T03', '00', 'Plaster Naranja Ticul', NULL, 'KIMIKOLOR', 0.00, 'producto/1758514232_Image (70).png', NULL, 290.00, 390.00, 490.00, 490.00, '2025-09-18 05:24:58', '2025-09-22 09:10:32'),
(278, 9, 'Tulum', 'MEB01', 'T04', '00', 'Pintura Amarillo Turrón I4-05', NULL, 'COMEX', 0.00, 'producto/1758514248_Image (71).png', NULL, 0.00, 0.00, 0.00, 0.00, '2025-09-18 05:24:58', '2025-09-22 09:10:48'),
(279, 9, 'Tulum', 'MEB01', 'T05', '00', 'Pintura Color Neutro Yuca 269-04', NULL, 'COMEX', 0.00, 'producto/1758514264_Image (72).png', NULL, 0.00, 0.00, 0.00, 0.00, '2025-09-18 05:24:58', '2025-09-22 09:11:04'),
(280, 9, 'Tulum', 'MEB01', 'T06', '00', 'Pintura Naranja Incienso H3-09', NULL, 'COMEX', 0.00, 'producto/1758514278_Image (73).png', NULL, 0.00, 0.00, 0.00, 0.00, '2025-09-18 05:24:58', '2025-09-22 09:11:18');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `product_fachada_renders`
--

CREATE TABLE `product_fachada_renders` (
  `id` bigint UNSIGNED NOT NULL,
  `product_id` bigint UNSIGNED NOT NULL,
  `fachada` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `base_image_1` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `base_image_2` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `base_image_3` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `base_image_4` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `product_fachada_renders`
--

INSERT INTO `product_fachada_renders` (`id`, `product_id`, `fachada`, `base_image_1`, `base_image_2`, `base_image_3`, `base_image_4`, `created_at`, `updated_at`) VALUES
(181, 33, 'Fachada A', '/render/render_33_Fachada A_1.webp', '/render/render_33_Fachada A_2.png', '/render/render_33_Fachada A_3.png', '/render/render_33_Fachada A_4.webp', '2025-09-15 11:16:30', '2025-09-17 08:24:39'),
(182, 34, 'Fachada A', '/render/render_34_Fachada A_1.webp', '/render/render_34_Fachada A_2.webp', '/render/render_34_Fachada A_3.webp', '/render/render_34_Fachada A_4.webp', '2025-09-15 11:18:32', '2025-09-15 11:35:28'),
(183, 35, 'Fachada A', '/render/render_35_Fachada A_1.webp', '/render/render_35_Fachada A_2.webp', '/render/render_35_Fachada A_3.webp', '/render/render_35_Fachada A_4.webp', '2025-09-15 11:20:33', '2025-09-15 11:35:36'),
(184, 36, 'Fachada A', '/render/render_36_Fachada A_1.webp', '/render/render_36_Fachada A_2.webp', '/render/render_36_Fachada A_3.webp', '/render/render_36_Fachada A_4.png', '2025-09-15 11:20:51', '2025-09-19 08:00:14'),
(185, 37, 'Fachada A', '/render/render_37_Fachada A_1.webp', '/render/render_37_Fachada A_2.webp', '/render/render_37_Fachada A_3.webp', '/render/render_37_Fachada A_4.webp', '2025-09-15 11:20:59', '2025-09-15 11:35:49'),
(186, 38, 'Fachada A', '/render/render_38_Fachada A_1.webp', '/render/render_38_Fachada A_2.webp', '/render/render_38_Fachada A_3.webp', '/render/render_38_Fachada A_4.webp', '2025-09-15 11:21:07', '2025-09-15 11:35:55'),
(187, 58, 'Fachada A', '/render/render_58_Fachada A_1.webp', '/render/render_58_Fachada A_2.webp', '/render/render_58_Fachada A_3.webp', '/render/render_58_Fachada A_4.webp', '2025-09-15 11:22:14', '2025-09-15 11:37:35'),
(188, 59, 'Fachada A', '/render/render_59_Fachada A_1.webp', '/render/render_59_Fachada A_2.webp', '/render/render_59_Fachada A_3.webp', '/render/render_59_Fachada A_4.webp', '2025-09-15 11:22:20', '2025-09-15 11:37:41'),
(189, 60, 'Fachada A', '/render/render_60_Fachada A_1.webp', '/render/render_60_Fachada A_2.webp', '/render/render_60_Fachada A_3.webp', '/render/render_60_Fachada A_4.webp', '2025-09-15 11:22:26', '2025-09-15 11:37:48'),
(190, 39, 'Fachada A', '/render/render_39_Fachada A_1.webp', '/render/render_39_Fachada A_2.webp', '/render/render_39_Fachada A_3.webp', NULL, '2025-09-15 11:23:30', '2025-09-15 11:33:54'),
(191, 40, 'Fachada A', '/render/render_40_Fachada A_1.webp', '/render/render_40_Fachada A_2.webp', '/render/render_40_Fachada A_3.webp', NULL, '2025-09-15 11:23:35', '2025-09-15 11:34:00'),
(192, 41, 'Fachada A', '/render/render_41_Fachada A_1.webp', '/render/render_41_Fachada A_2.webp', '/render/render_41_Fachada A_3.webp', NULL, '2025-09-15 11:23:42', '2025-09-15 11:34:06'),
(193, 42, 'Fachada A', '/render/render_42_Fachada A_1.webp', '/render/render_42_Fachada A_2.webp', '/render/render_42_Fachada A_3.webp', NULL, '2025-09-15 11:23:50', '2025-09-15 11:34:12'),
(194, 43, 'Fachada A', '/render/render_43_Fachada A_1.webp', '/render/render_43_Fachada A_2.webp', '/render/render_43_Fachada A_3.png', NULL, '2025-09-15 11:24:01', '2025-09-19 07:49:15'),
(195, 44, 'Fachada A', '/render/render_44_Fachada A_1.webp', '/render/render_44_Fachada A_2.webp', '/render/render_44_Fachada A_3.webp', NULL, '2025-09-15 11:24:11', '2025-09-15 11:34:25'),
(196, 33, 'Fachada B', '/render/render_33_Fachada B_1.webp', '/render/render_33_Fachada B_2.webp', '/render/render_33_Fachada B_3.webp', '/render/render_33_Fachada B_4.webp', '2025-09-15 11:40:34', '2025-09-15 12:03:53'),
(197, 34, 'Fachada B', '/render/render_34_Fachada B_1.webp', '/render/render_34_Fachada B_2.webp', '/render/render_34_Fachada B_3.webp', '/render/render_34_Fachada B_4.webp', '2025-09-15 11:40:44', '2025-09-15 12:04:00'),
(198, 35, 'Fachada B', '/render/render_35_Fachada B_1.webp', '/render/render_35_Fachada B_2.webp', '/render/render_35_Fachada B_3.webp', '/render/render_35_Fachada B_4.webp', '2025-09-15 11:40:52', '2025-09-15 12:04:06'),
(199, 36, 'Fachada B', '/render/render_36_Fachada B_1.webp', '/render/render_36_Fachada B_2.webp', '/render/render_36_Fachada B_3.webp', '/render/render_36_Fachada B_4.webp', '2025-09-15 11:41:12', '2025-09-15 12:04:12'),
(200, 37, 'Fachada B', '/render/render_37_Fachada B_1.webp', '/render/render_37_Fachada B_2.webp', '/render/render_37_Fachada B_3.webp', '/render/render_37_Fachada B_4.webp', '2025-09-15 11:41:26', '2025-09-15 12:04:18'),
(201, 38, 'Fachada B', '/render/render_38_Fachada B_1.webp', '/render/render_38_Fachada B_2.webp', '/render/render_38_Fachada B_3.webp', '/render/render_38_Fachada B_4.webp', '2025-09-15 11:41:34', '2025-09-15 12:04:24'),
(202, 58, 'Fachada B', '/render/render_58_Fachada B_1.webp', '/render/render_58_Fachada B_2.webp', '/render/render_58_Fachada B_3.webp', '/render/render_58_Fachada B_4.webp', '2025-09-15 11:42:40', '2025-09-15 12:04:38'),
(203, 59, 'Fachada B', '/render/render_59_Fachada B_1.webp', '/render/render_59_Fachada B_2.webp', '/render/render_59_Fachada B_3.webp', '/render/render_59_Fachada B_4.webp', '2025-09-15 11:42:50', '2025-09-15 12:04:45'),
(204, 60, 'Fachada B', '/render/render_60_Fachada B_1.webp', '/render/render_60_Fachada B_2.webp', '/render/render_60_Fachada B_3.webp', '/render/render_60_Fachada B_4.webp', '2025-09-15 11:42:56', '2025-09-15 12:04:51'),
(205, 54, 'Fachada B', '/render/render_54_Fachada B_1.webp', '/render/render_54_Fachada B_2.webp', '/render/render_54_Fachada B_3.webp', NULL, '2025-09-15 11:43:54', '2025-09-15 11:58:31'),
(206, 55, 'Fachada B', '/render/render_55_Fachada B_1.webp', '/render/render_55_Fachada B_2.webp', '/render/render_55_Fachada B_3.webp', NULL, '2025-09-15 11:44:01', '2025-09-15 11:58:39'),
(207, 56, 'Fachada B', '/render/render_56_Fachada B_1.webp', '/render/render_56_Fachada B_2.webp', '/render/render_56_Fachada B_3.webp', NULL, '2025-09-15 11:44:09', '2025-09-15 11:58:47'),
(208, 57, 'Fachada B', '/render/render_57_Fachada B_1.webp', '/render/render_57_Fachada B_2.webp', '/render/render_57_Fachada B_3.webp', NULL, '2025-09-15 11:44:17', '2025-09-15 11:58:55'),
(209, 71, 'Fachada B', '/render/render_71_Fachada B_1.webp', '/render/render_71_Fachada B_2.webp', '/render/render_71_Fachada B_3.webp', NULL, '2025-09-15 11:45:08', '2025-09-15 11:59:18'),
(210, 72, 'Fachada B', '/render/render_72_Fachada B_1.webp', '/render/render_72_Fachada B_2.webp', '/render/render_72_Fachada B_3.webp', NULL, '2025-09-15 11:45:16', '2025-09-15 11:59:39'),
(211, 73, 'Fachada B', '/render/render_73_Fachada B_1.webp', '/render/render_73_Fachada B_2.webp', '/render/render_73_Fachada B_3.webp', NULL, '2025-09-15 11:45:24', '2025-09-15 11:59:46'),
(212, 39, 'Fachada B', '/render/render_39_Fachada B_1.webp', '/render/render_39_Fachada B_2.webp', '/render/render_39_Fachada B_3.webp', '/render/render_39_Fachada B_4.webp', '2025-09-15 11:45:50', '2025-09-15 12:05:32'),
(213, 40, 'Fachada B', '/render/render_40_Fachada B_1.webp', '/render/render_40_Fachada B_2.webp', '/render/render_40_Fachada B_3.webp', '/render/render_40_Fachada B_4.webp', '2025-09-15 11:45:56', '2025-09-15 12:05:38'),
(214, 41, 'Fachada B', '/render/render_41_Fachada B_1.webp', '/render/render_41_Fachada B_2.webp', '/render/render_41_Fachada B_3.webp', '/render/render_41_Fachada B_4.webp', '2025-09-15 11:46:04', '2025-09-15 12:05:52'),
(215, 42, 'Fachada B', '/render/render_42_Fachada B_1.webp', '/render/render_42_Fachada B_2.webp', '/render/render_42_Fachada B_3.webp', '/render/render_42_Fachada B_4.webp', '2025-09-15 11:46:12', '2025-09-15 12:05:58'),
(216, 43, 'Fachada B', '/render/render_43_Fachada B_1.webp', '/render/render_43_Fachada B_2.webp', '/render/render_43_Fachada B_3.webp', '/render/render_43_Fachada B_4.webp', '2025-09-15 11:46:37', '2025-09-15 12:06:09'),
(217, 44, 'Fachada B', '/render/render_44_Fachada B_1.webp', '/render/render_44_Fachada B_2.webp', '/render/render_44_Fachada B_3.webp', '/render/render_44_Fachada B_4.webp', '2025-09-15 11:46:44', '2025-09-15 12:06:18'),
(218, 33, 'Fachada 2A', '/render/render_33_Fachada 2A_1.webp', '/render/render_33_Fachada 2A_2.webp', '/render/render_33_Fachada 2A_3.webp', '/render/render_33_Fachada 2A_4.webp', '2025-09-15 12:09:02', '2025-09-15 12:31:16'),
(219, 34, 'Fachada 2A', '/render/render_34_Fachada 2A_1.webp', '/render/render_34_Fachada 2A_2.webp', '/render/render_34_Fachada 2A_3.webp', '/render/render_34_Fachada 2A_4.webp', '2025-09-15 12:09:10', '2025-09-17 08:31:36'),
(220, 35, 'Fachada 2A', '/render/render_35_Fachada 2A_1.webp', '/render/render_35_Fachada 2A_2.webp', '/render/render_35_Fachada 2A_3.webp', '/render/render_35_Fachada 2A_4.webp', '2025-09-15 12:09:15', '2025-09-15 12:31:29'),
(221, 36, 'Fachada 2A', '/render/render_36_Fachada 2A_1.webp', '/render/render_36_Fachada 2A_2.webp', '/render/render_36_Fachada 2A_3.webp', '/render/render_36_Fachada 2A_4.webp', '2025-09-15 12:09:22', '2025-09-15 12:31:36'),
(222, 37, 'Fachada 2A', '/render/render_37_Fachada 2A_1.webp', '/render/render_37_Fachada 2A_2.webp', '/render/render_37_Fachada 2A_3.webp', '/render/render_37_Fachada 2A_4.webp', '2025-09-15 12:09:33', '2025-09-15 12:31:43'),
(223, 38, 'Fachada 2A', '/render/render_38_Fachada 2A_1.webp', '/render/render_38_Fachada 2A_2.webp', '/render/render_38_Fachada 2A_3.webp', '/render/render_38_Fachada 2A_4.webp', '2025-09-15 12:09:39', '2025-09-15 12:31:51'),
(224, 54, 'Fachada 2A', '/render/render_54_Fachada 2A_1.webp', '/render/render_54_Fachada 2A_2.webp', '/render/render_54_Fachada 2A_3.webp', '/render/render_54_Fachada 2A_4.webp', '2025-09-15 12:10:36', '2025-09-15 13:03:28'),
(225, 55, 'Fachada 2A', '/render/render_55_Fachada 2A_1.webp', '/render/render_55_Fachada 2A_2.webp', '/render/render_55_Fachada 2A_3.webp', '/render/render_55_Fachada 2A_4.webp', '2025-09-15 12:11:09', '2025-09-15 13:03:40'),
(226, 56, 'Fachada 2A', '/render/render_56_Fachada 2A_1.webp', '/render/render_56_Fachada 2A_2.webp', '/render/render_56_Fachada 2A_3.webp', '/render/render_56_Fachada 2A_4.webp', '2025-09-15 12:11:18', '2025-09-15 13:03:46'),
(227, 57, 'Fachada 2A', '/render/render_57_Fachada 2A_1.webp', '/render/render_57_Fachada 2A_2.webp', '/render/render_57_Fachada 2A_3.webp', '/render/render_57_Fachada 2A_4.webp', '2025-09-15 12:11:26', '2025-09-15 13:03:54'),
(228, 71, 'Fachada 2A', '/render/render_71_Fachada 2A_1.webp', '/render/render_71_Fachada 2A_2.webp', '/render/render_71_Fachada 2A_3.webp', NULL, '2025-09-15 12:12:04', '2025-09-15 12:27:42'),
(229, 72, 'Fachada 2A', '/render/render_72_Fachada 2A_1.webp', '/render/render_72_Fachada 2A_2.webp', '/render/render_72_Fachada 2A_3.webp', NULL, '2025-09-15 12:12:14', '2025-09-15 12:27:48'),
(230, 73, 'Fachada 2A', '/render/render_73_Fachada 2A_1.webp', '/render/render_73_Fachada 2A_2.webp', '/render/render_73_Fachada 2A_3.webp', NULL, '2025-09-15 12:12:20', '2025-09-15 12:27:54'),
(231, 39, 'Fachada 2A', '/render/render_39_Fachada 2A_1.webp', '/render/render_39_Fachada 2A_2.webp', '/render/render_39_Fachada 2A_3.webp', '/render/render_39_Fachada 2A_4.webp', '2025-09-15 12:12:53', '2025-09-17 08:49:18'),
(232, 40, 'Fachada 2A', '/render/render_40_Fachada 2A_1.webp', '/render/render_40_Fachada 2A_2.webp', '/render/render_40_Fachada 2A_3.webp', '/render/render_40_Fachada 2A_4.webp', '2025-09-15 12:13:00', '2025-09-17 08:50:35'),
(233, 41, 'Fachada 2A', '/render/render_41_Fachada 2A_1.webp', '/render/render_41_Fachada 2A_2.webp', '/render/render_41_Fachada 2A_3.webp', '/render/render_41_Fachada 2A_4.webp', '2025-09-15 12:13:06', '2025-09-17 08:51:33'),
(234, 42, 'Fachada 2A', '/render/render_42_Fachada 2A_1.webp', '/render/render_42_Fachada 2A_2.webp', '/render/render_42_Fachada 2A_3.webp', '/render/render_42_Fachada 2A_4.webp', '2025-09-15 12:13:12', '2025-09-17 08:52:30'),
(235, 43, 'Fachada 2A', '/render/render_43_Fachada 2A_1.webp', '/render/render_43_Fachada 2A_2.webp', '/render/render_43_Fachada 2A_3.webp', '/render/render_43_Fachada 2A_4.webp', '2025-09-15 12:13:19', '2025-09-17 08:53:23'),
(236, 44, 'Fachada 2A', '/render/render_44_Fachada 2A_1.webp', '/render/render_44_Fachada 2A_2.webp', '/render/render_44_Fachada 2A_3.webp', '/render/render_44_Fachada 2A_4.webp', '2025-09-15 12:13:26', '2025-09-17 08:54:14'),
(237, 45, 'Fachada 2A', '/render/render_45_Fachada 2A_1.png', '/render/render_45_Fachada 2A_2.webp', '/render/render_45_Fachada 2A_3.webp', '/render/render_45_Fachada 2A_4.webp', '2025-09-15 12:13:47', '2025-09-17 04:02:53'),
(238, 46, 'Fachada 2A', '/render/render_46_Fachada 2A_1.png', '/render/render_46_Fachada 2A_2.webp', '/render/render_46_Fachada 2A_3.webp', '/render/render_46_Fachada 2A_4.webp', '2025-09-15 12:14:02', '2025-09-17 04:01:54'),
(239, 47, 'Fachada 2A', '/render/render_47_Fachada 2A_1.png', '/render/render_47_Fachada 2A_2.webp', '/render/render_47_Fachada 2A_3.webp', '/render/render_47_Fachada 2A_4.webp', '2025-09-15 12:14:10', '2025-09-17 04:03:04'),
(240, 48, 'Fachada 2A', '/render/render_48_Fachada 2A_1.png', '/render/render_48_Fachada 2A_2.webp', '/render/render_48_Fachada 2A_3.webp', '/render/render_48_Fachada 2A_4.webp', '2025-09-15 12:14:18', '2025-09-17 04:03:13'),
(241, 49, 'Fachada 2A', '/render/render_49_Fachada 2A_1.png', '/render/render_49_Fachada 2A_2.webp', '/render/render_49_Fachada 2A_3.webp', '/render/render_49_Fachada 2A_4.webp', '2025-09-15 12:14:33', '2025-09-17 04:03:19'),
(242, 50, 'Fachada 2A', '/render/render_50_Fachada 2A_1.png', '/render/render_50_Fachada 2A_2.webp', '/render/render_50_Fachada 2A_3.webp', '/render/render_50_Fachada 2A_4.webp', '2025-09-15 12:14:40', '2025-09-17 04:03:25'),
(243, 58, 'Fachada 2A', NULL, '/render/render_58_Fachada 2A_2.webp', '/render/render_58_Fachada 2A_3.webp', '/render/render_58_Fachada 2A_4.webp', '2025-09-15 12:19:57', '2025-09-15 12:32:37'),
(244, 59, 'Fachada 2A', NULL, '/render/render_59_Fachada 2A_2.webp', '/render/render_59_Fachada 2A_3.webp', '/render/render_59_Fachada 2A_4.webp', '2025-09-15 12:20:03', '2025-09-15 12:32:44'),
(245, 60, 'Fachada 2A', NULL, '/render/render_60_Fachada 2A_2.webp', '/render/render_60_Fachada 2A_3.webp', '/render/render_60_Fachada 2A_4.webp', '2025-09-15 12:20:09', '2025-09-15 12:32:53'),
(246, 33, 'Fachada 2B', '/render/render_33_Fachada 2B_1.webp', '/render/render_33_Fachada 2B_2.webp', '/render/render_33_Fachada 2B_3.webp', '/render/render_33_Fachada 2B_4.webp', '2025-09-15 13:34:05', '2025-09-17 08:29:12'),
(247, 34, 'Fachada 2B', '/render/render_34_Fachada 2B_1.webp', '/render/render_34_Fachada 2B_2.webp', '/render/render_34_Fachada 2B_3.webp', '/render/render_34_Fachada 2B_4.webp', '2025-09-15 13:34:12', '2025-09-15 13:50:24'),
(248, 35, 'Fachada 2B', '/render/render_35_Fachada 2B_1.webp', '/render/render_35_Fachada 2B_2.webp', '/render/render_35_Fachada 2B_3.webp', '/render/render_35_Fachada 2B_4.webp', '2025-09-15 13:34:26', '2025-09-15 13:50:43'),
(249, 36, 'Fachada 2B', '/render/render_36_Fachada 2B_1.webp', '/render/render_36_Fachada 2B_2.webp', '/render/render_36_Fachada 2B_3.webp', '/render/render_36_Fachada 2B_4.webp', '2025-09-15 13:34:32', '2025-09-15 13:53:30'),
(250, 37, 'Fachada 2B', '/render/render_37_Fachada 2B_1.webp', '/render/render_37_Fachada 2B_2.webp', '/render/render_37_Fachada 2B_3.webp', '/render/render_37_Fachada 2B_4.webp', '2025-09-15 13:34:39', '2025-09-15 13:50:50'),
(251, 38, 'Fachada 2B', '/render/render_38_Fachada 2B_1.webp', '/render/render_38_Fachada 2B_2.webp', '/render/render_38_Fachada 2B_3.webp', '/render/render_38_Fachada 2B_4.webp', '2025-09-15 13:34:46', '2025-09-15 13:50:57'),
(252, 58, 'Fachada 2B', '/render/render_58_Fachada 2B_1.webp', '/render/render_58_Fachada 2B_2.webp', '/render/render_58_Fachada 2B_3.webp', '/render/render_58_Fachada 2B_4.webp', '2025-09-15 13:35:34', '2025-09-15 13:51:09'),
(253, 59, 'Fachada 2B', '/render/render_59_Fachada 2B_1.webp', '/render/render_59_Fachada 2B_2.webp', '/render/render_59_Fachada 2B_3.webp', '/render/render_59_Fachada 2B_4.webp', '2025-09-15 13:35:41', '2025-09-15 13:51:16'),
(254, 60, 'Fachada 2B', '/render/render_60_Fachada 2B_1.webp', '/render/render_60_Fachada 2B_2.webp', '/render/render_60_Fachada 2B_3.webp', '/render/render_60_Fachada 2B_4.webp', '2025-09-15 13:35:47', '2025-09-15 13:51:22'),
(255, 54, 'Fachada 2B', '/render/render_54_Fachada 2B_1.webp', '/render/render_54_Fachada 2B_2.webp', '/render/render_54_Fachada 2B_3.webp', NULL, '2025-09-15 13:36:30', '2025-09-15 13:47:57'),
(256, 55, 'Fachada 2B', '/render/render_55_Fachada 2B_1.webp', '/render/render_55_Fachada 2B_2.webp', '/render/render_55_Fachada 2B_3.webp', NULL, '2025-09-15 13:36:38', '2025-09-15 13:48:03'),
(257, 56, 'Fachada 2B', '/render/render_56_Fachada 2B_1.webp', '/render/render_56_Fachada 2B_2.webp', '/render/render_56_Fachada 2B_3.webp', NULL, '2025-09-15 13:36:47', '2025-09-15 13:48:09'),
(258, 57, 'Fachada 2B', '/render/render_57_Fachada 2B_1.webp', '/render/render_57_Fachada 2B_2.webp', '/render/render_57_Fachada 2B_3.webp', NULL, '2025-09-15 13:36:55', '2025-09-15 13:48:16'),
(259, 71, 'Fachada 2B', '/render/render_71_Fachada 2B_1.webp', '/render/render_71_Fachada 2B_2.webp', '/render/render_71_Fachada 2B_3.webp', NULL, '2025-09-15 13:37:12', '2025-09-15 13:48:36'),
(260, 72, 'Fachada 2B', '/render/render_72_Fachada 2B_1.webp', '/render/render_72_Fachada 2B_2.webp', NULL, NULL, '2025-09-15 13:37:19', '2025-09-15 13:43:22'),
(261, 73, 'Fachada 2B', '/render/render_73_Fachada 2B_1.webp', '/render/render_73_Fachada 2B_2.webp', '/render/render_73_Fachada 2B_3.webp', NULL, '2025-09-15 13:37:25', '2025-09-15 13:48:48'),
(262, 39, 'Fachada 2B', '/render/render_39_Fachada 2B_1.webp', '/render/render_39_Fachada 2B_2.webp', '/render/render_39_Fachada 2B_3.webp', '/render/render_39_Fachada 2B_4.webp', '2025-09-15 13:37:45', '2025-09-15 13:51:39'),
(263, 40, 'Fachada 2B', '/render/render_40_Fachada 2B_1.webp', '/render/render_40_Fachada 2B_2.webp', '/render/render_40_Fachada 2B_3.webp', '/render/render_40_Fachada 2B_4.webp', '2025-09-15 13:37:51', '2025-09-15 13:51:45'),
(264, 41, 'Fachada 2B', '/render/render_41_Fachada 2B_1.webp', '/render/render_41_Fachada 2B_2.webp', '/render/render_41_Fachada 2B_3.webp', '/render/render_41_Fachada 2B_4.webp', '2025-09-15 13:37:59', '2025-09-15 13:51:51'),
(265, 42, 'Fachada 2B', '/render/render_42_Fachada 2B_1.webp', '/render/render_42_Fachada 2B_2.webp', '/render/render_42_Fachada 2B_3.webp', '/render/render_42_Fachada 2B_4.webp', '2025-09-15 13:38:07', '2025-09-15 13:51:58'),
(266, 43, 'Fachada 2B', '/render/render_43_Fachada 2B_1.webp', '/render/render_43_Fachada 2B_2.webp', '/render/render_43_Fachada 2B_3.webp', '/render/render_43_Fachada 2B_4.webp', '2025-09-15 13:38:16', '2025-09-15 13:52:06'),
(267, 44, 'Fachada 2B', '/render/render_44_Fachada 2B_1.webp', '/render/render_44_Fachada 2B_2.webp', '/render/render_44_Fachada 2B_3.webp', '/render/render_44_Fachada 2B_4.webp', '2025-09-15 13:38:22', '2025-09-15 13:52:12'),
(268, 72, 'Fachada A', NULL, NULL, '/render/render_72_Fachada A_3.webp', NULL, '2025-09-15 13:48:42', '2025-09-15 13:48:42'),
(269, 33, 'Fachada 3A', '/render/render_33_Fachada 3A_1.webp', '/render/render_33_Fachada 3A_2.webp', '/render/render_33_Fachada 3A_3.webp', '/render/render_33_Fachada 3A_4.webp', '2025-09-17 08:21:26', '2025-09-17 08:29:12'),
(270, 33, 'Fachada 3B', '/render/render_33_Fachada 3B_1.webp', '/render/render_33_Fachada 3B_2.webp', '/render/render_33_Fachada 3B_3.webp', '/render/render_33_Fachada 3B_4.webp', '2025-09-17 08:21:26', '2025-09-17 08:29:12'),
(271, 33, 'Fachada 4A', '/render/render_33_Fachada 4A_1.webp', '/render/render_33_Fachada 4A_2.webp', '/render/render_33_Fachada 4A_3.webp', '/render/render_33_Fachada 4A_4.webp', '2025-09-17 08:21:26', '2025-09-17 08:29:12'),
(272, 34, 'Fachada 3A', '/render/render_34_Fachada 3A_1.webp', '/render/render_34_Fachada 3A_2.webp', '/render/render_34_Fachada 3A_3.webp', '/render/render_34_Fachada 3A_4.webp', '2025-09-17 08:31:36', '2025-09-17 08:31:36'),
(273, 34, 'Fachada 3B', '/render/render_34_Fachada 3B_1.webp', '/render/render_34_Fachada 3B_2.webp', '/render/render_34_Fachada 3B_3.webp', '/render/render_34_Fachada 3B_4.webp', '2025-09-17 08:31:36', '2025-09-17 08:31:36'),
(274, 34, 'Fachada 4A', '/render/render_34_Fachada 4A_1.webp', '/render/render_34_Fachada 4A_2.webp', '/render/render_34_Fachada 4A_3.webp', '/render/render_34_Fachada 4A_4.webp', '2025-09-17 08:31:36', '2025-09-17 08:31:36'),
(275, 35, 'Fachada 3A', '/render/render_35_Fachada 3A_1.webp', '/render/render_35_Fachada 3A_2.webp', '/render/render_35_Fachada 3A_3.webp', '/render/render_35_Fachada 3A_4.webp', '2025-09-17 08:33:30', '2025-09-17 08:33:30'),
(276, 35, 'Fachada 3B', '/render/render_35_Fachada 3B_1.webp', '/render/render_35_Fachada 3B_2.webp', '/render/render_35_Fachada 3B_3.webp', '/render/render_35_Fachada 3B_4.webp', '2025-09-17 08:33:30', '2025-09-17 08:33:30'),
(277, 35, 'Fachada 4A', '/render/render_35_Fachada 4A_1.webp', '/render/render_35_Fachada 4A_2.webp', '/render/render_35_Fachada 4A_3.webp', '/render/render_35_Fachada 4A_4.webp', '2025-09-17 08:33:30', '2025-09-17 08:33:30'),
(278, 36, 'Fachada 3A', '/render/render_36_Fachada 3A_1.webp', '/render/render_36_Fachada 3A_2.webp', '/render/render_36_Fachada 3A_3.webp', '/render/render_36_Fachada 3A_4.webp', '2025-09-17 08:34:35', '2025-09-17 08:34:35'),
(279, 36, 'Fachada 3B', '/render/render_36_Fachada 3B_1.webp', '/render/render_36_Fachada 3B_2.webp', '/render/render_36_Fachada 3B_3.webp', '/render/render_36_Fachada 3B_4.webp', '2025-09-17 08:34:35', '2025-09-17 08:34:35'),
(280, 36, 'Fachada 4A', '/render/render_36_Fachada 4A_1.webp', '/render/render_36_Fachada 4A_2.webp', '/render/render_36_Fachada 4A_3.webp', '/render/render_36_Fachada 4A_4.webp', '2025-09-17 08:34:35', '2025-09-17 08:34:35'),
(281, 37, 'Fachada 3A', '/render/render_37_Fachada 3A_1.webp', '/render/render_37_Fachada 3A_2.webp', '/render/render_37_Fachada 3A_3.webp', '/render/render_37_Fachada 3A_4.webp', '2025-09-17 08:37:42', '2025-09-17 08:37:42'),
(282, 37, 'Fachada 3B', '/render/render_37_Fachada 3B_1.webp', '/render/render_37_Fachada 3B_2.webp', '/render/render_37_Fachada 3B_3.webp', '/render/render_37_Fachada 3B_4.webp', '2025-09-17 08:37:42', '2025-09-17 08:37:42'),
(283, 37, 'Fachada 4A', '/render/render_37_Fachada 4A_1.webp', '/render/render_37_Fachada 4A_2.webp', '/render/render_37_Fachada 4A_3.webp', '/render/render_37_Fachada 4A_4.webp', '2025-09-17 08:37:42', '2025-09-17 08:37:42'),
(284, 38, 'Fachada 3A', '/render/render_38_Fachada 3A_1.webp', '/render/render_38_Fachada 3A_2.webp', '/render/render_38_Fachada 3A_3.webp', '/render/render_38_Fachada 3A_4.webp', '2025-09-17 08:38:41', '2025-09-17 08:38:41'),
(285, 38, 'Fachada 3B', '/render/render_38_Fachada 3B_1.webp', '/render/render_38_Fachada 3B_2.webp', '/render/render_38_Fachada 3B_3.webp', '/render/render_38_Fachada 3B_4.webp', '2025-09-17 08:38:41', '2025-09-17 08:38:41'),
(286, 38, 'Fachada 4A', '/render/render_38_Fachada 4A_1.webp', '/render/render_38_Fachada 4A_2.webp', '/render/render_38_Fachada 4A_3.webp', '/render/render_38_Fachada 4A_4.webp', '2025-09-17 08:38:41', '2025-09-17 08:38:41'),
(287, 58, 'Fachada 3A', NULL, '/render/render_58_Fachada 3A_2.webp', '/render/render_58_Fachada 3A_3.webp', '/render/render_58_Fachada 3A_4.webp', '2025-09-17 08:43:15', '2025-09-17 08:43:15'),
(288, 58, 'Fachada 3B', '/render/render_58_Fachada 3B_1.webp', '/render/render_58_Fachada 3B_2.webp', '/render/render_58_Fachada 3B_3.webp', '/render/render_58_Fachada 3B_4.webp', '2025-09-17 08:43:15', '2025-09-17 08:43:15'),
(289, 58, 'Fachada 4A', '/render/render_58_Fachada 4A_1.webp', '/render/render_58_Fachada 4A_2.webp', '/render/render_58_Fachada 4A_3.webp', '/render/render_58_Fachada 4A_4.webp', '2025-09-17 08:43:15', '2025-09-17 08:43:15'),
(290, 59, 'Fachada 3A', NULL, '/render/render_59_Fachada 3A_2.webp', '/render/render_59_Fachada 3A_3.webp', '/render/render_59_Fachada 3A_4.webp', '2025-09-17 08:44:07', '2025-09-17 08:44:07'),
(291, 59, 'Fachada 3B', '/render/render_59_Fachada 3B_1.webp', '/render/render_59_Fachada 3B_2.webp', '/render/render_59_Fachada 3B_3.webp', '/render/render_59_Fachada 3B_4.webp', '2025-09-17 08:44:07', '2025-09-17 08:44:07'),
(292, 59, 'Fachada 4A', '/render/render_59_Fachada 4A_1.webp', '/render/render_59_Fachada 4A_2.webp', '/render/render_59_Fachada 4A_3.webp', '/render/render_59_Fachada 4A_4.webp', '2025-09-17 08:44:07', '2025-09-17 08:44:07'),
(293, 60, 'Fachada 3A', NULL, '/render/render_60_Fachada 3A_2.webp', '/render/render_60_Fachada 3A_3.webp', '/render/render_60_Fachada 3A_4.webp', '2025-09-17 08:45:02', '2025-09-17 08:45:02'),
(294, 60, 'Fachada 3B', '/render/render_60_Fachada 3B_1.webp', '/render/render_60_Fachada 3B_2.webp', '/render/render_60_Fachada 3B_3.webp', '/render/render_60_Fachada 3B_4.webp', '2025-09-17 08:45:02', '2025-09-17 08:45:02'),
(295, 60, 'Fachada 4A', '/render/render_60_Fachada 4A_1.webp', '/render/render_60_Fachada 4A_2.webp', '/render/render_60_Fachada 4A_3.webp', '/render/render_60_Fachada 4A_4.webp', '2025-09-17 08:45:02', '2025-09-17 08:45:02'),
(296, 39, 'Fachada 3A', '/render/render_39_Fachada 3A_1.webp', '/render/render_39_Fachada 3A_2.webp', '/render/render_39_Fachada 3A_3.webp', NULL, '2025-09-17 08:49:18', '2025-09-17 08:49:18'),
(297, 39, 'Fachada 3B', '/render/render_39_Fachada 3B_1.webp', '/render/render_39_Fachada 3B_2.webp', '/render/render_39_Fachada 3B_3.webp', '/render/render_39_Fachada 3B_4.webp', '2025-09-17 08:49:18', '2025-09-17 08:49:18'),
(298, 39, 'Fachada 4A', '/render/render_39_Fachada 4A_1.webp', '/render/render_39_Fachada 4A_2.webp', '/render/render_39_Fachada 4A_3.webp', '/render/render_39_Fachada 4A_4.webp', '2025-09-17 08:49:18', '2025-09-17 08:49:18'),
(299, 40, 'Fachada 3A', '/render/render_40_Fachada 3A_1.webp', '/render/render_40_Fachada 3A_2.webp', '/render/render_40_Fachada 3A_3.webp', NULL, '2025-09-17 08:50:35', '2025-09-17 08:50:35'),
(300, 40, 'Fachada 3B', '/render/render_40_Fachada 3B_1.webp', '/render/render_40_Fachada 3B_2.webp', '/render/render_40_Fachada 3B_3.webp', '/render/render_40_Fachada 3B_4.webp', '2025-09-17 08:50:35', '2025-09-17 08:50:35'),
(301, 40, 'Fachada 4A', '/render/render_40_Fachada 4A_1.webp', '/render/render_40_Fachada 4A_2.webp', '/render/render_40_Fachada 4A_3.webp', '/render/render_40_Fachada 4A_4.webp', '2025-09-17 08:50:35', '2025-09-17 08:50:35'),
(302, 41, 'Fachada 3A', '/render/render_41_Fachada 3A_1.webp', '/render/render_41_Fachada 3A_2.webp', '/render/render_41_Fachada 3A_3.webp', NULL, '2025-09-17 08:51:33', '2025-09-17 08:51:33'),
(303, 41, 'Fachada 3B', '/render/render_41_Fachada 3B_1.webp', '/render/render_41_Fachada 3B_2.webp', '/render/render_41_Fachada 3B_3.webp', '/render/render_41_Fachada 3B_4.webp', '2025-09-17 08:51:33', '2025-09-17 08:51:33'),
(304, 41, 'Fachada 4A', '/render/render_41_Fachada 4A_1.webp', '/render/render_41_Fachada 4A_2.webp', '/render/render_41_Fachada 4A_3.webp', '/render/render_41_Fachada 4A_4.webp', '2025-09-17 08:51:33', '2025-09-17 08:51:33'),
(305, 42, 'Fachada 3A', '/render/render_42_Fachada 3A_1.webp', '/render/render_42_Fachada 3A_2.webp', '/render/render_42_Fachada 3A_3.webp', NULL, '2025-09-17 08:52:30', '2025-09-17 08:52:30'),
(306, 42, 'Fachada 3B', '/render/render_42_Fachada 3B_1.webp', '/render/render_42_Fachada 3B_2.webp', '/render/render_42_Fachada 3B_3.webp', '/render/render_42_Fachada 3B_4.webp', '2025-09-17 08:52:30', '2025-09-17 08:52:30'),
(307, 42, 'Fachada 4A', '/render/render_42_Fachada 4A_1.webp', '/render/render_42_Fachada 4A_2.webp', '/render/render_42_Fachada 4A_3.webp', '/render/render_42_Fachada 4A_4.webp', '2025-09-17 08:52:30', '2025-09-17 08:52:30'),
(308, 43, 'Fachada 3A', '/render/render_43_Fachada 3A_1.webp', '/render/render_43_Fachada 3A_2.webp', '/render/render_43_Fachada 3A_3.webp', NULL, '2025-09-17 08:53:23', '2025-09-17 08:53:23'),
(309, 43, 'Fachada 3B', '/render/render_43_Fachada 3B_1.webp', '/render/render_43_Fachada 3B_2.webp', '/render/render_43_Fachada 3B_3.webp', '/render/render_43_Fachada 3B_4.webp', '2025-09-17 08:53:23', '2025-09-17 08:53:23'),
(310, 43, 'Fachada 4A', '/render/render_43_Fachada 4A_1.webp', '/render/render_43_Fachada 4A_2.webp', '/render/render_43_Fachada 4A_3.webp', '/render/render_43_Fachada 4A_4.webp', '2025-09-17 08:53:23', '2025-09-17 08:53:23'),
(311, 44, 'Fachada 3A', '/render/render_44_Fachada 3A_1.webp', '/render/render_44_Fachada 3A_2.webp', '/render/render_44_Fachada 3A_3.webp', NULL, '2025-09-17 08:54:14', '2025-09-17 08:54:14'),
(312, 44, 'Fachada 3B', '/render/render_44_Fachada 3B_1.webp', '/render/render_44_Fachada 3B_2.webp', '/render/render_44_Fachada 3B_3.webp', '/render/render_44_Fachada 3B_4.webp', '2025-09-17 08:54:14', '2025-09-17 08:54:14'),
(313, 44, 'Fachada 4A', '/render/render_44_Fachada 4A_1.webp', '/render/render_44_Fachada 4A_2.webp', '/render/render_44_Fachada 4A_3.webp', '/render/render_44_Fachada 4A_4.webp', '2025-09-17 08:54:14', '2025-09-17 08:54:14'),
(314, 54, 'Fachada 3A', '/render/render_54_Fachada 3A_1.webp', '/render/render_54_Fachada 3A_2.webp', '/render/render_54_Fachada 3A_3.webp', NULL, '2025-09-17 08:57:16', '2025-09-17 08:57:16'),
(315, 54, 'Fachada 3B', '/render/render_54_Fachada 3B_1.webp', '/render/render_54_Fachada 3B_2.webp', NULL, NULL, '2025-09-17 08:57:16', '2025-09-17 08:57:16'),
(316, 54, 'Fachada 4A', '/render/render_54_Fachada 4A_1.webp', '/render/render_54_Fachada 4A_2.webp', NULL, NULL, '2025-09-17 08:57:16', '2025-09-17 08:57:16'),
(317, 55, 'Fachada 3A', '/render/render_55_Fachada 3A_1.webp', '/render/render_55_Fachada 3A_2.webp', '/render/render_55_Fachada 3A_3.webp', NULL, '2025-09-17 08:58:08', '2025-09-17 08:58:08'),
(318, 55, 'Fachada 3B', '/render/render_55_Fachada 3B_1.webp', '/render/render_55_Fachada 3B_2.webp', NULL, NULL, '2025-09-17 08:58:08', '2025-09-17 08:58:08'),
(319, 55, 'Fachada 4A', '/render/render_55_Fachada 4A_1.webp', '/render/render_55_Fachada 4A_2.webp', NULL, NULL, '2025-09-17 08:58:08', '2025-09-17 08:58:08'),
(320, 56, 'Fachada 3A', '/render/render_56_Fachada 3A_1.webp', '/render/render_56_Fachada 3A_2.webp', '/render/render_56_Fachada 3A_3.webp', NULL, '2025-09-17 08:58:48', '2025-09-17 08:58:48'),
(321, 56, 'Fachada 3B', '/render/render_56_Fachada 3B_1.webp', '/render/render_56_Fachada 3B_2.webp', NULL, NULL, '2025-09-17 08:58:48', '2025-09-17 08:58:48'),
(322, 56, 'Fachada 4A', '/render/render_56_Fachada 4A_1.webp', '/render/render_56_Fachada 4A_2.webp', NULL, NULL, '2025-09-17 08:58:48', '2025-09-17 08:58:48'),
(323, 57, 'Fachada 3A', '/render/render_57_Fachada 3A_1.webp', '/render/render_57_Fachada 3A_2.webp', '/render/render_57_Fachada 3A_3.webp', NULL, '2025-09-17 08:59:33', '2025-09-17 08:59:33'),
(324, 57, 'Fachada 3B', '/render/render_57_Fachada 3B_1.webp', '/render/render_57_Fachada 3B_2.webp', NULL, NULL, '2025-09-17 08:59:33', '2025-09-17 08:59:33'),
(325, 57, 'Fachada 4A', '/render/render_57_Fachada 4A_1.webp', '/render/render_57_Fachada 4A_2.webp', NULL, NULL, '2025-09-17 08:59:33', '2025-09-17 08:59:33'),
(326, 71, 'Fachada 3A', '/render/render_71_Fachada 3A_1.webp', '/render/render_71_Fachada 3A_2.webp', '/render/render_71_Fachada 3A_3.webp', NULL, '2025-09-17 09:01:45', '2025-09-17 09:01:45'),
(327, 71, 'Fachada 3B', '/render/render_71_Fachada 3B_1.webp', '/render/render_71_Fachada 3B_2.webp', NULL, NULL, '2025-09-17 09:01:45', '2025-09-17 09:01:45'),
(328, 71, 'Fachada 4A', '/render/render_71_Fachada 4A_1.webp', '/render/render_71_Fachada 4A_2.webp', NULL, NULL, '2025-09-17 09:01:45', '2025-09-17 09:01:45'),
(329, 72, 'Fachada 3A', '/render/render_72_Fachada 3A_1.webp', '/render/render_72_Fachada 3A_2.webp', '/render/render_72_Fachada 3A_3.webp', NULL, '2025-09-17 09:02:51', '2025-09-17 09:02:51'),
(330, 72, 'Fachada 3B', '/render/render_72_Fachada 3B_1.webp', '/render/render_72_Fachada 3B_2.webp', NULL, NULL, '2025-09-17 09:02:51', '2025-09-17 09:02:51'),
(331, 72, 'Fachada 4A', '/render/render_72_Fachada 4A_1.webp', '/render/render_72_Fachada 4A_2.webp', NULL, NULL, '2025-09-17 09:02:51', '2025-09-17 09:02:51'),
(332, 73, 'Fachada 3A', '/render/render_73_Fachada 3A_1.webp', '/render/render_73_Fachada 3A_2.webp', '/render/render_73_Fachada 3A_3.webp', NULL, '2025-09-17 09:03:26', '2025-09-17 09:03:26'),
(333, 73, 'Fachada 3B', '/render/render_73_Fachada 3B_1.webp', '/render/render_73_Fachada 3B_2.webp', NULL, NULL, '2025-09-17 09:03:26', '2025-09-17 09:03:26'),
(334, 73, 'Fachada 4A', '/render/render_73_Fachada 4A_1.webp', '/render/render_73_Fachada 4A_2.webp', NULL, NULL, '2025-09-17 09:03:26', '2025-09-17 09:03:26'),
(335, 45, 'Fachada 3A', '/render/render_45_Fachada 3A_1.webp', '/render/render_45_Fachada 3A_2.webp', '/render/render_45_Fachada 3A_3.webp', '/render/render_45_Fachada 3A_4.webp', '2025-09-17 09:09:23', '2025-09-17 09:09:23'),
(336, 46, 'Fachada 3A', '/render/render_46_Fachada 3A_1.webp', '/render/render_46_Fachada 3A_2.webp', '/render/render_46_Fachada 3A_3.webp', '/render/render_46_Fachada 3A_4.webp', '2025-09-17 09:09:57', '2025-09-17 09:09:57'),
(337, 47, 'Fachada 3A', '/render/render_47_Fachada 3A_1.webp', '/render/render_47_Fachada 3A_2.webp', '/render/render_47_Fachada 3A_3.webp', '/render/render_47_Fachada 3A_4.webp', '2025-09-17 09:10:25', '2025-09-17 09:10:25'),
(338, 48, 'Fachada 3A', '/render/render_48_Fachada 3A_1.webp', '/render/render_48_Fachada 3A_2.webp', '/render/render_48_Fachada 3A_3.webp', '/render/render_48_Fachada 3A_4.webp', '2025-09-17 09:10:49', '2025-09-17 09:10:49'),
(339, 49, 'Fachada 3A', '/render/render_49_Fachada 3A_1.webp', '/render/render_49_Fachada 3A_2.webp', '/render/render_49_Fachada 3A_3.webp', '/render/render_49_Fachada 3A_4.webp', '2025-09-17 09:11:15', '2025-09-17 09:11:15'),
(340, 50, 'Fachada 3A', '/render/render_50_Fachada 3A_1.webp', '/render/render_50_Fachada 3A_2.webp', '/render/render_50_Fachada 3A_3.webp', '/render/render_50_Fachada 3A_4.webp', '2025-09-17 09:11:35', '2025-09-17 09:11:35'),
(341, 198, 'Fachada A', '/render/render_198_Fachada A_1.webp', '/render/render_198_Fachada A_2.webp', '/render/render_198_Fachada A_3.webp', '/render/render_198_Fachada A_4.webp', '2025-09-17 09:24:52', '2025-09-17 09:24:52'),
(342, 198, 'Fachada B', '/render/render_198_Fachada B_1.webp', '/render/render_198_Fachada B_2.webp', '/render/render_198_Fachada B_3.webp', '/render/render_198_Fachada B_4.webp', '2025-09-17 09:24:52', '2025-09-17 09:24:52'),
(343, 198, 'Fachada 2A', '/render/render_198_Fachada 2A_1.webp', '/render/render_198_Fachada 2A_2.webp', '/render/render_198_Fachada 2A_3.webp', '/render/render_198_Fachada 2A_4.webp', '2025-09-17 09:24:52', '2025-09-17 09:24:52'),
(344, 198, 'Fachada 2B', '/render/render_198_Fachada 2B_1.webp', '/render/render_198_Fachada 2B_2.webp', '/render/render_198_Fachada 2B_3.webp', '/render/render_198_Fachada 2B_4.webp', '2025-09-17 09:24:52', '2025-09-17 09:24:52'),
(345, 198, 'Fachada 3A', '/render/render_198_Fachada 3A_1.webp', '/render/render_198_Fachada 3A_2.webp', '/render/render_198_Fachada 3A_3.webp', '/render/render_198_Fachada 3A_4.webp', '2025-09-17 09:24:52', '2025-09-17 09:24:52'),
(346, 198, 'Fachada 3B', '/render/render_198_Fachada 3B_1.webp', '/render/render_198_Fachada 3B_2.webp', '/render/render_198_Fachada 3B_3.webp', '/render/render_198_Fachada 3B_4.webp', '2025-09-17 09:26:27', '2025-09-17 09:26:27'),
(347, 198, 'Fachada 4A', '/render/render_198_Fachada 4A_1.webp', '/render/render_198_Fachada 4A_2.webp', '/render/render_198_Fachada 4A_3.webp', '/render/render_198_Fachada 4A_4.webp', '2025-09-17 09:26:27', '2025-09-17 09:26:27'),
(348, 199, 'Fachada A', '/render/render_199_Fachada A_1.webp', '/render/render_199_Fachada A_2.webp', '/render/render_199_Fachada A_3.webp', '/render/render_199_Fachada A_4.webp', '2025-09-17 09:28:14', '2025-09-17 09:28:14'),
(349, 199, 'Fachada B', '/render/render_199_Fachada B_1.webp', '/render/render_199_Fachada B_2.webp', '/render/render_199_Fachada B_3.webp', '/render/render_199_Fachada B_4.webp', '2025-09-17 09:28:14', '2025-09-17 09:28:14'),
(350, 199, 'Fachada 2A', '/render/render_199_Fachada 2A_1.webp', '/render/render_199_Fachada 2A_2.webp', '/render/render_199_Fachada 2A_3.webp', '/render/render_199_Fachada 2A_4.webp', '2025-09-17 09:28:14', '2025-09-17 09:28:14'),
(351, 199, 'Fachada 2B', '/render/render_199_Fachada 2B_1.webp', '/render/render_199_Fachada 2B_2.webp', '/render/render_199_Fachada 2B_3.webp', '/render/render_199_Fachada 2B_4.webp', '2025-09-17 09:28:14', '2025-09-17 09:28:14'),
(352, 199, 'Fachada 3A', '/render/render_199_Fachada 3A_1.webp', '/render/render_199_Fachada 3A_2.webp', '/render/render_199_Fachada 3A_3.webp', '/render/render_199_Fachada 3A_4.webp', '2025-09-17 09:28:14', '2025-09-17 09:28:14'),
(353, 199, 'Fachada 3B', '/render/render_199_Fachada 3B_1.webp', '/render/render_199_Fachada 3B_2.webp', '/render/render_199_Fachada 3B_3.webp', '/render/render_199_Fachada 3B_4.webp', '2025-09-17 09:28:53', '2025-09-17 09:28:53'),
(354, 199, 'Fachada 4A', '/render/render_199_Fachada 4A_1.webp', '/render/render_199_Fachada 4A_2.webp', '/render/render_199_Fachada 4A_3.webp', '/render/render_199_Fachada 4A_4.webp', '2025-09-17 09:28:53', '2025-09-17 09:28:53'),
(355, 200, 'Fachada A', '/render/render_200_Fachada A_1.webp', '/render/render_200_Fachada A_2.webp', '/render/render_200_Fachada A_3.webp', '/render/render_200_Fachada A_4.webp', '2025-09-17 09:30:12', '2025-09-17 09:30:12'),
(356, 200, 'Fachada B', '/render/render_200_Fachada B_1.webp', '/render/render_200_Fachada B_2.webp', '/render/render_200_Fachada B_3.webp', '/render/render_200_Fachada B_4.webp', '2025-09-17 09:30:12', '2025-09-17 09:30:12'),
(357, 200, 'Fachada 2A', '/render/render_200_Fachada 2A_1.webp', '/render/render_200_Fachada 2A_2.webp', '/render/render_200_Fachada 2A_3.webp', '/render/render_200_Fachada 2A_4.webp', '2025-09-17 09:30:12', '2025-09-17 09:30:12'),
(358, 200, 'Fachada 2B', '/render/render_200_Fachada 2B_1.webp', '/render/render_200_Fachada 2B_2.webp', '/render/render_200_Fachada 2B_3.webp', '/render/render_200_Fachada 2B_4.webp', '2025-09-17 09:30:12', '2025-09-17 09:30:12'),
(359, 200, 'Fachada 3A', '/render/render_200_Fachada 3A_1.webp', '/render/render_200_Fachada 3A_2.webp', '/render/render_200_Fachada 3A_3.webp', '/render/render_200_Fachada 3A_4.webp', '2025-09-17 09:30:12', '2025-09-17 09:30:12'),
(360, 200, 'Fachada 3B', '/render/render_200_Fachada 3B_1.webp', '/render/render_200_Fachada 3B_2.webp', '/render/render_200_Fachada 3B_3.webp', '/render/render_200_Fachada 3B_4.webp', '2025-09-17 09:30:50', '2025-09-17 09:30:50'),
(361, 200, 'Fachada 4A', '/render/render_200_Fachada 4A_1.webp', '/render/render_200_Fachada 4A_2.webp', '/render/render_200_Fachada 4A_3.webp', '/render/render_200_Fachada 4A_4.webp', '2025-09-17 09:30:50', '2025-09-17 09:30:50'),
(362, 201, 'Fachada A', '/render/render_201_Fachada A_1.webp', '/render/render_201_Fachada A_2.webp', '/render/render_201_Fachada A_3.webp', '/render/render_201_Fachada A_4.webp', '2025-09-17 09:32:48', '2025-09-17 09:32:48'),
(363, 201, 'Fachada B', '/render/render_201_Fachada B_1.webp', '/render/render_201_Fachada B_2.webp', '/render/render_201_Fachada B_3.webp', '/render/render_201_Fachada B_4.webp', '2025-09-17 09:32:48', '2025-09-17 09:32:48'),
(364, 201, 'Fachada 2A', '/render/render_201_Fachada 2A_1.webp', '/render/render_201_Fachada 2A_2.webp', '/render/render_201_Fachada 2A_3.webp', '/render/render_201_Fachada 2A_4.webp', '2025-09-17 09:32:48', '2025-09-17 09:32:48'),
(365, 201, 'Fachada 2B', '/render/render_201_Fachada 2B_1.webp', '/render/render_201_Fachada 2B_2.webp', '/render/render_201_Fachada 2B_3.webp', '/render/render_201_Fachada 2B_4.webp', '2025-09-17 09:32:48', '2025-09-17 09:32:48'),
(366, 201, 'Fachada 3A', '/render/render_201_Fachada 3A_1.webp', '/render/render_201_Fachada 3A_2.webp', '/render/render_201_Fachada 3A_3.webp', '/render/render_201_Fachada 3A_4.webp', '2025-09-17 09:32:48', '2025-09-17 09:32:48'),
(367, 201, 'Fachada 3B', '/render/render_201_Fachada 3B_1.webp', '/render/render_201_Fachada 3B_2.webp', '/render/render_201_Fachada 3B_3.webp', '/render/render_201_Fachada 3B_4.webp', '2025-09-17 09:33:49', '2025-09-17 09:33:49'),
(368, 201, 'Fachada 4A', '/render/render_201_Fachada 4A_1.webp', '/render/render_201_Fachada 4A_2.webp', '/render/render_201_Fachada 4A_3.webp', '/render/render_201_Fachada 4A_4.webp', '2025-09-17 09:33:49', '2025-09-17 09:33:49'),
(369, 202, 'Fachada A', '/render/render_202_Fachada A_1.webp', '/render/render_202_Fachada A_2.webp', '/render/render_202_Fachada A_3.webp', '/render/render_202_Fachada A_4.webp', '2025-09-17 09:37:57', '2025-09-17 09:37:57'),
(370, 202, 'Fachada B', '/render/render_202_Fachada B_1.webp', '/render/render_202_Fachada B_2.webp', '/render/render_202_Fachada B_3.webp', '/render/render_202_Fachada B_4.webp', '2025-09-17 09:37:57', '2025-09-17 09:37:57'),
(371, 202, 'Fachada 2A', '/render/render_202_Fachada 2A_1.webp', '/render/render_202_Fachada 2A_2.webp', '/render/render_202_Fachada 2A_3.webp', '/render/render_202_Fachada 2A_4.webp', '2025-09-17 09:37:57', '2025-09-17 09:37:57'),
(372, 202, 'Fachada 2B', '/render/render_202_Fachada 2B_1.webp', '/render/render_202_Fachada 2B_2.webp', '/render/render_202_Fachada 2B_3.webp', '/render/render_202_Fachada 2B_4.webp', '2025-09-17 09:37:57', '2025-09-17 09:37:57'),
(373, 202, 'Fachada 3A', '/render/render_202_Fachada 3A_1.webp', '/render/render_202_Fachada 3A_2.webp', '/render/render_202_Fachada 3A_3.webp', '/render/render_202_Fachada 3A_4.webp', '2025-09-17 09:37:57', '2025-09-17 09:37:57'),
(374, 202, 'Fachada 3B', '/render/render_202_Fachada 3B_1.webp', '/render/render_202_Fachada 3B_2.webp', '/render/render_202_Fachada 3B_3.webp', '/render/render_202_Fachada 3B_4.webp', '2025-09-17 09:38:38', '2025-09-17 09:38:38'),
(375, 202, 'Fachada 4A', '/render/render_202_Fachada 4A_1.webp', '/render/render_202_Fachada 4A_2.webp', '/render/render_202_Fachada 4A_3.webp', '/render/render_202_Fachada 4A_4.webp', '2025-09-17 09:38:38', '2025-09-17 09:38:38'),
(376, 203, 'Fachada A', '/render/render_203_Fachada A_1.webp', '/render/render_203_Fachada A_2.webp', '/render/render_203_Fachada A_3.webp', '/render/render_203_Fachada A_4.webp', '2025-09-17 09:40:05', '2025-09-17 09:40:05'),
(377, 203, 'Fachada B', '/render/render_203_Fachada B_1.webp', '/render/render_203_Fachada B_2.webp', '/render/render_203_Fachada B_3.webp', '/render/render_203_Fachada B_4.webp', '2025-09-17 09:40:05', '2025-09-17 09:40:05'),
(378, 203, 'Fachada 2A', '/render/render_203_Fachada 2A_1.webp', '/render/render_203_Fachada 2A_2.webp', '/render/render_203_Fachada 2A_3.webp', '/render/render_203_Fachada 2A_4.webp', '2025-09-17 09:40:05', '2025-09-17 09:40:05'),
(379, 203, 'Fachada 2B', '/render/render_203_Fachada 2B_1.webp', '/render/render_203_Fachada 2B_2.webp', '/render/render_203_Fachada 2B_3.webp', '/render/render_203_Fachada 2B_4.webp', '2025-09-17 09:40:05', '2025-09-17 09:40:05'),
(380, 203, 'Fachada 3A', '/render/render_203_Fachada 3A_1.webp', '/render/render_203_Fachada 3A_2.webp', '/render/render_203_Fachada 3A_3.webp', '/render/render_203_Fachada 3A_4.webp', '2025-09-17 09:40:05', '2025-09-17 09:40:05'),
(381, 203, 'Fachada 3B', '/render/render_203_Fachada 3B_1.webp', '/render/render_203_Fachada 3B_2.webp', '/render/render_203_Fachada 3B_3.webp', '/render/render_203_Fachada 3B_4.webp', '2025-09-17 09:40:49', '2025-09-17 09:40:49'),
(382, 203, 'Fachada 4A', '/render/render_203_Fachada 4A_1.webp', '/render/render_203_Fachada 4A_2.webp', '/render/render_203_Fachada 4A_3.webp', '/render/render_203_Fachada 4A_4.webp', '2025-09-17 09:40:49', '2025-09-17 09:40:49'),
(383, 204, 'Fachada A', '/render/render_204_Fachada A_1.webp', '/render/render_204_Fachada A_2.webp', '/render/render_204_Fachada A_3.webp', '/render/render_204_Fachada A_4.webp', '2025-09-17 09:42:15', '2025-09-17 09:42:15'),
(384, 204, 'Fachada B', '/render/render_204_Fachada B_1.webp', '/render/render_204_Fachada B_2.webp', '/render/render_204_Fachada B_3.webp', '/render/render_204_Fachada B_4.webp', '2025-09-17 09:42:15', '2025-09-17 09:42:15'),
(385, 204, 'Fachada 2A', '/render/render_204_Fachada 2A_1.webp', '/render/render_204_Fachada 2A_2.webp', '/render/render_204_Fachada 2A_3.webp', '/render/render_204_Fachada 2A_4.webp', '2025-09-17 09:42:15', '2025-09-17 09:42:15'),
(386, 204, 'Fachada 2B', '/render/render_204_Fachada 2B_1.webp', '/render/render_204_Fachada 2B_2.webp', '/render/render_204_Fachada 2B_3.webp', '/render/render_204_Fachada 2B_4.webp', '2025-09-17 09:42:15', '2025-09-17 09:42:15'),
(387, 204, 'Fachada 3A', '/render/render_204_Fachada 3A_1.webp', '/render/render_204_Fachada 3A_2.webp', '/render/render_204_Fachada 3A_3.webp', '/render/render_204_Fachada 3A_4.webp', '2025-09-17 09:42:15', '2025-09-17 09:42:15'),
(388, 204, 'Fachada 3B', '/render/render_204_Fachada 3B_1.webp', '/render/render_204_Fachada 3B_2.webp', '/render/render_204_Fachada 3B_3.webp', '/render/render_204_Fachada 3B_4.webp', '2025-09-17 09:42:56', '2025-09-17 09:42:56'),
(389, 204, 'Fachada 4A', '/render/render_204_Fachada 4A_1.webp', '/render/render_204_Fachada 4A_2.webp', '/render/render_204_Fachada 4A_3.webp', '/render/render_204_Fachada 4A_4.webp', '2025-09-17 09:42:56', '2025-09-17 09:42:56'),
(390, 205, 'Fachada A', '/render/render_205_Fachada A_1.webp', '/render/render_205_Fachada A_2.webp', '/render/render_205_Fachada A_3.webp', '/render/render_205_Fachada A_4.webp', '2025-09-17 09:44:34', '2025-09-17 09:44:34'),
(391, 205, 'Fachada B', '/render/render_205_Fachada B_1.webp', '/render/render_205_Fachada B_2.webp', '/render/render_205_Fachada B_3.webp', '/render/render_205_Fachada B_4.webp', '2025-09-17 09:44:34', '2025-09-17 09:44:34'),
(392, 205, 'Fachada 2A', '/render/render_205_Fachada 2A_1.webp', '/render/render_205_Fachada 2A_2.webp', '/render/render_205_Fachada 2A_3.webp', '/render/render_205_Fachada 2A_4.webp', '2025-09-17 09:44:34', '2025-09-17 09:44:34'),
(393, 205, 'Fachada 2B', '/render/render_205_Fachada 2B_1.webp', '/render/render_205_Fachada 2B_2.webp', '/render/render_205_Fachada 2B_3.webp', '/render/render_205_Fachada 2B_4.webp', '2025-09-17 09:44:34', '2025-09-17 09:44:34'),
(394, 205, 'Fachada 3A', '/render/render_205_Fachada 3A_1.webp', '/render/render_205_Fachada 3A_2.webp', '/render/render_205_Fachada 3A_3.webp', '/render/render_205_Fachada 3A_4.webp', '2025-09-17 09:44:34', '2025-09-17 09:44:34'),
(395, 205, 'Fachada 3B', '/render/render_205_Fachada 3B_1.webp', '/render/render_205_Fachada 3B_2.webp', '/render/render_205_Fachada 3B_3.webp', '/render/render_205_Fachada 3B_4.webp', '2025-09-17 09:45:23', '2025-09-17 09:45:23'),
(396, 205, 'Fachada 4A', '/render/render_205_Fachada 4A_1.webp', '/render/render_205_Fachada 4A_2.webp', '/render/render_205_Fachada 4A_3.webp', '/render/render_205_Fachada 4A_4.webp', '2025-09-17 09:45:23', '2025-09-17 09:45:23'),
(397, 206, 'Fachada A', '/render/render_206_Fachada A_1.webp', '/render/render_206_Fachada A_2.webp', '/render/render_206_Fachada A_3.webp', '/render/render_206_Fachada A_4.webp', '2025-09-17 09:47:07', '2025-09-17 09:47:07'),
(398, 206, 'Fachada B', '/render/render_206_Fachada B_1.webp', '/render/render_206_Fachada B_2.webp', '/render/render_206_Fachada B_3.webp', '/render/render_206_Fachada B_4.webp', '2025-09-17 09:47:07', '2025-09-17 09:47:07'),
(399, 206, 'Fachada 2A', '/render/render_206_Fachada 2A_1.webp', '/render/render_206_Fachada 2A_2.webp', '/render/render_206_Fachada 2A_3.webp', '/render/render_206_Fachada 2A_4.webp', '2025-09-17 09:47:07', '2025-09-17 09:47:07'),
(400, 206, 'Fachada 2B', '/render/render_206_Fachada 2B_1.webp', '/render/render_206_Fachada 2B_2.webp', '/render/render_206_Fachada 2B_3.webp', '/render/render_206_Fachada 2B_4.webp', '2025-09-17 09:47:07', '2025-09-17 09:47:07'),
(401, 206, 'Fachada 3A', '/render/render_206_Fachada 3A_1.webp', '/render/render_206_Fachada 3A_2.webp', '/render/render_206_Fachada 3A_3.webp', '/render/render_206_Fachada 3A_4.webp', '2025-09-17 09:47:07', '2025-09-17 09:47:07'),
(402, 206, 'Fachada 3B', '/render/render_206_Fachada 3B_1.webp', '/render/render_206_Fachada 3B_2.webp', '/render/render_206_Fachada 3B_3.webp', '/render/render_206_Fachada 3B_4.webp', '2025-09-17 09:47:47', '2025-09-17 09:47:47'),
(403, 206, 'Fachada 4A', '/render/render_206_Fachada 4A_1.webp', '/render/render_206_Fachada 4A_2.webp', '/render/render_206_Fachada 4A_3.webp', '/render/render_206_Fachada 4A_4.webp', '2025-09-17 09:47:47', '2025-09-17 09:47:47'),
(404, 207, 'Fachada A', '/render/render_207_Fachada A_1.webp', '/render/render_207_Fachada A_2.webp', '/render/render_207_Fachada A_3.webp', '/render/render_207_Fachada A_4.webp', '2025-09-17 09:49:01', '2025-09-17 09:49:01'),
(405, 207, 'Fachada B', '/render/render_207_Fachada B_1.webp', '/render/render_207_Fachada B_2.webp', '/render/render_207_Fachada B_3.webp', '/render/render_207_Fachada B_4.webp', '2025-09-17 09:49:01', '2025-09-17 09:49:01'),
(406, 207, 'Fachada 2A', '/render/render_207_Fachada 2A_1.webp', '/render/render_207_Fachada 2A_2.webp', '/render/render_207_Fachada 2A_3.webp', '/render/render_207_Fachada 2A_4.webp', '2025-09-17 09:49:01', '2025-09-17 09:49:01'),
(407, 207, 'Fachada 2B', '/render/render_207_Fachada 2B_1.webp', '/render/render_207_Fachada 2B_2.webp', '/render/render_207_Fachada 2B_3.webp', '/render/render_207_Fachada 2B_4.webp', '2025-09-17 09:49:01', '2025-09-17 09:49:01'),
(408, 207, 'Fachada 3A', '/render/render_207_Fachada 3A_1.webp', '/render/render_207_Fachada 3A_2.webp', '/render/render_207_Fachada 3A_3.webp', '/render/render_207_Fachada 3A_4.webp', '2025-09-17 09:49:01', '2025-09-17 09:49:01'),
(409, 207, 'Fachada 3B', '/render/render_207_Fachada 3B_1.webp', '/render/render_207_Fachada 3B_2.webp', '/render/render_207_Fachada 3B_3.webp', '/render/render_207_Fachada 3B_4.webp', '2025-09-17 09:50:06', '2025-09-17 09:50:06'),
(410, 207, 'Fachada 4A', '/render/render_207_Fachada 4A_1.webp', '/render/render_207_Fachada 4A_2.webp', '/render/render_207_Fachada 4A_3.webp', '/render/render_207_Fachada 4A_4.webp', '2025-09-17 09:50:06', '2025-09-17 09:50:06'),
(411, 208, 'Fachada A', '/render/render_208_Fachada A_1.webp', '/render/render_208_Fachada A_2.webp', '/render/render_208_Fachada A_3.webp', '/render/render_208_Fachada A_4.webp', '2025-09-17 09:52:25', '2025-09-17 09:52:25'),
(412, 208, 'Fachada B', '/render/render_208_Fachada B_1.webp', '/render/render_208_Fachada B_2.webp', '/render/render_208_Fachada B_3.webp', '/render/render_208_Fachada B_4.webp', '2025-09-17 09:52:25', '2025-09-17 09:52:25');
INSERT INTO `product_fachada_renders` (`id`, `product_id`, `fachada`, `base_image_1`, `base_image_2`, `base_image_3`, `base_image_4`, `created_at`, `updated_at`) VALUES
(413, 208, 'Fachada 2A', '/render/render_208_Fachada 2A_1.webp', '/render/render_208_Fachada 2A_2.webp', '/render/render_208_Fachada 2A_3.webp', '/render/render_208_Fachada 2A_4.webp', '2025-09-17 09:52:25', '2025-09-17 09:52:25'),
(414, 208, 'Fachada 2B', '/render/render_208_Fachada 2B_1.webp', '/render/render_208_Fachada 2B_2.webp', '/render/render_208_Fachada 2B_3.webp', '/render/render_208_Fachada 2B_4.webp', '2025-09-17 09:52:25', '2025-09-17 09:52:25'),
(415, 208, 'Fachada 3A', '/render/render_208_Fachada 3A_1.webp', '/render/render_208_Fachada 3A_2.webp', '/render/render_208_Fachada 3A_3.webp', '/render/render_208_Fachada 3A_4.webp', '2025-09-17 09:52:25', '2025-09-17 09:52:25'),
(416, 208, 'Fachada 3B', '/render/render_208_Fachada 3B_1.webp', '/render/render_208_Fachada 3B_2.webp', '/render/render_208_Fachada 3B_3.webp', '/render/render_208_Fachada 3B_4.webp', '2025-09-17 09:53:15', '2025-09-17 09:53:15'),
(417, 208, 'Fachada 4A', '/render/render_208_Fachada 4A_1.webp', '/render/render_208_Fachada 4A_2.webp', '/render/render_208_Fachada 4A_3.webp', '/render/render_208_Fachada 4A_4.webp', '2025-09-17 09:53:15', '2025-09-17 09:53:15'),
(418, 209, 'Fachada A', '/render/render_209_Fachada A_1.webp', '/render/render_209_Fachada A_2.webp', '/render/render_209_Fachada A_3.webp', '/render/render_209_Fachada A_4.webp', '2025-09-17 09:54:22', '2025-09-17 09:54:22'),
(419, 209, 'Fachada B', '/render/render_209_Fachada B_1.webp', '/render/render_209_Fachada B_2.webp', '/render/render_209_Fachada B_3.webp', '/render/render_209_Fachada B_4.webp', '2025-09-17 09:54:22', '2025-09-17 09:54:22'),
(420, 209, 'Fachada 2A', '/render/render_209_Fachada 2A_1.webp', '/render/render_209_Fachada 2A_2.webp', '/render/render_209_Fachada 2A_3.webp', '/render/render_209_Fachada 2A_4.webp', '2025-09-17 09:54:22', '2025-09-17 09:54:22'),
(421, 209, 'Fachada 2B', '/render/render_209_Fachada 2B_1.webp', '/render/render_209_Fachada 2B_2.webp', '/render/render_209_Fachada 2B_3.webp', '/render/render_209_Fachada 2B_4.webp', '2025-09-17 09:54:22', '2025-09-17 09:54:22'),
(422, 209, 'Fachada 3A', '/render/render_209_Fachada 3A_1.webp', '/render/render_209_Fachada 3A_2.webp', '/render/render_209_Fachada 3A_3.webp', '/render/render_209_Fachada 3A_4.webp', '2025-09-17 09:54:22', '2025-09-17 09:54:22'),
(423, 209, 'Fachada 3B', '/render/render_209_Fachada 3B_1.webp', '/render/render_209_Fachada 3B_2.webp', '/render/render_209_Fachada 3B_3.webp', '/render/render_209_Fachada 3B_4.webp', '2025-09-17 09:54:53', '2025-09-17 09:54:53'),
(424, 209, 'Fachada 4A', '/render/render_209_Fachada 4A_1.webp', '/render/render_209_Fachada 4A_2.webp', '/render/render_209_Fachada 4A_3.webp', '/render/render_209_Fachada 4A_4.webp', '2025-09-17 09:54:53', '2025-09-17 09:54:53'),
(425, 210, 'Fachada A', '/render/render_210_Fachada A_1.webp', '/render/render_210_Fachada A_2.webp', '/render/render_210_Fachada A_3.webp', '/render/render_210_Fachada A_4.webp', '2025-09-17 09:56:13', '2025-09-17 09:56:13'),
(426, 210, 'Fachada B', '/render/render_210_Fachada B_1.webp', '/render/render_210_Fachada B_2.webp', '/render/render_210_Fachada B_3.webp', '/render/render_210_Fachada B_4.webp', '2025-09-17 09:56:13', '2025-09-17 09:56:13'),
(427, 210, 'Fachada 2A', '/render/render_210_Fachada 2A_1.webp', '/render/render_210_Fachada 2A_2.webp', '/render/render_210_Fachada 2A_3.webp', '/render/render_210_Fachada 2A_4.webp', '2025-09-17 09:56:13', '2025-09-17 09:56:13'),
(428, 210, 'Fachada 2B', '/render/render_210_Fachada 2B_1.webp', '/render/render_210_Fachada 2B_2.webp', '/render/render_210_Fachada 2B_3.webp', '/render/render_210_Fachada 2B_4.webp', '2025-09-17 09:56:13', '2025-09-17 09:56:13'),
(429, 210, 'Fachada 3A', '/render/render_210_Fachada 3A_1.webp', '/render/render_210_Fachada 3A_2.webp', '/render/render_210_Fachada 3A_3.webp', '/render/render_210_Fachada 3A_4.webp', '2025-09-17 09:56:13', '2025-09-17 09:56:13'),
(430, 210, 'Fachada 3B', '/render/render_210_Fachada 3B_1.webp', '/render/render_210_Fachada 3B_2.webp', '/render/render_210_Fachada 3B_3.webp', '/render/render_210_Fachada 3B_4.webp', '2025-09-17 09:56:45', '2025-09-17 09:56:45'),
(431, 210, 'Fachada 4A', '/render/render_210_Fachada 4A_1.webp', '/render/render_210_Fachada 4A_2.webp', '/render/render_210_Fachada 4A_3.webp', '/render/render_210_Fachada 4A_4.webp', '2025-09-17 09:56:45', '2025-09-17 09:56:45'),
(432, 211, 'Fachada A', '/render/render_211_Fachada A_1.webp', '/render/render_211_Fachada A_2.webp', '/render/render_211_Fachada A_3.webp', '/render/render_211_Fachada A_4.webp', '2025-09-17 09:57:55', '2025-09-17 09:57:55'),
(433, 211, 'Fachada B', '/render/render_211_Fachada B_1.webp', '/render/render_211_Fachada B_2.webp', '/render/render_211_Fachada B_3.webp', '/render/render_211_Fachada B_4.webp', '2025-09-17 09:57:55', '2025-09-17 09:57:55'),
(434, 211, 'Fachada 2A', '/render/render_211_Fachada 2A_1.webp', '/render/render_211_Fachada 2A_2.webp', '/render/render_211_Fachada 2A_3.webp', '/render/render_211_Fachada 2A_4.webp', '2025-09-17 09:57:55', '2025-09-17 09:57:55'),
(435, 211, 'Fachada 2B', '/render/render_211_Fachada 2B_1.webp', '/render/render_211_Fachada 2B_2.webp', '/render/render_211_Fachada 2B_3.webp', '/render/render_211_Fachada 2B_4.webp', '2025-09-17 09:57:55', '2025-09-17 09:57:55'),
(436, 211, 'Fachada 3A', '/render/render_211_Fachada 3A_1.webp', '/render/render_211_Fachada 3A_2.webp', '/render/render_211_Fachada 3A_3.webp', '/render/render_211_Fachada 3A_4.webp', '2025-09-17 09:57:55', '2025-09-17 09:57:55'),
(437, 211, 'Fachada 3B', '/render/render_211_Fachada 3B_1.webp', '/render/render_211_Fachada 3B_2.webp', '/render/render_211_Fachada 3B_3.webp', '/render/render_211_Fachada 3B_4.webp', '2025-09-17 09:58:27', '2025-09-17 09:58:27'),
(438, 211, 'Fachada 4A', '/render/render_211_Fachada 4A_1.webp', '/render/render_211_Fachada 4A_2.webp', '/render/render_211_Fachada 4A_3.webp', '/render/render_211_Fachada 4A_4.webp', '2025-09-17 09:58:27', '2025-09-17 09:58:27'),
(439, 232, 'Fachada A', '/render/render_232_Fachada A_1.webp', '/render/render_232_Fachada A_2.webp', '/render/render_232_Fachada A_3.webp', '/render/render_232_Fachada A_4.webp', '2025-09-17 10:02:27', '2025-09-17 10:02:27'),
(440, 232, 'Fachada B', '/render/render_232_Fachada B_1.webp', '/render/render_232_Fachada B_2.webp', '/render/render_232_Fachada B_3.webp', '/render/render_232_Fachada B_4.webp', '2025-09-17 10:02:27', '2025-09-17 10:02:27'),
(441, 232, 'Fachada 2A', '/render/render_232_Fachada 2A_1.webp', '/render/render_232_Fachada 2A_2.webp', '/render/render_232_Fachada 2A_3.webp', '/render/render_232_Fachada 2A_4.webp', '2025-09-17 10:02:27', '2025-09-17 10:02:27'),
(442, 232, 'Fachada 2B', '/render/render_232_Fachada 2B_1.webp', '/render/render_232_Fachada 2B_2.webp', '/render/render_232_Fachada 2B_3.webp', '/render/render_232_Fachada 2B_4.webp', '2025-09-17 10:02:27', '2025-09-17 10:02:27'),
(443, 232, 'Fachada 3A', '/render/render_232_Fachada 3A_1.webp', '/render/render_232_Fachada 3A_2.webp', '/render/render_232_Fachada 3A_3.webp', '/render/render_232_Fachada 3A_4.webp', '2025-09-17 10:02:27', '2025-09-17 10:02:27'),
(444, 232, 'Fachada 3B', '/render/render_232_Fachada 3B_1.webp', '/render/render_232_Fachada 3B_2.webp', '/render/render_232_Fachada 3B_3.webp', '/render/render_232_Fachada 3B_4.webp', '2025-09-17 10:02:56', '2025-09-17 10:02:56'),
(445, 232, 'Fachada 4A', '/render/render_232_Fachada 4A_1.webp', '/render/render_232_Fachada 4A_2.webp', '/render/render_232_Fachada 4A_3.webp', '/render/render_232_Fachada 4A_4.webp', '2025-09-17 10:02:56', '2025-09-17 10:02:56'),
(446, 233, 'Fachada A', '/render/render_233_Fachada A_1.webp', '/render/render_233_Fachada A_2.webp', '/render/render_233_Fachada A_3.webp', '/render/render_233_Fachada A_4.webp', '2025-09-17 10:04:02', '2025-09-17 10:04:02'),
(447, 233, 'Fachada B', '/render/render_233_Fachada B_1.webp', '/render/render_233_Fachada B_2.webp', '/render/render_233_Fachada B_3.webp', '/render/render_233_Fachada B_4.webp', '2025-09-17 10:04:02', '2025-09-17 10:04:02'),
(448, 233, 'Fachada 2A', '/render/render_233_Fachada 2A_1.webp', '/render/render_233_Fachada 2A_2.webp', '/render/render_233_Fachada 2A_3.webp', '/render/render_233_Fachada 2A_4.webp', '2025-09-17 10:04:02', '2025-09-17 10:04:02'),
(449, 233, 'Fachada 2B', '/render/render_233_Fachada 2B_1.webp', '/render/render_233_Fachada 2B_2.webp', '/render/render_233_Fachada 2B_3.webp', '/render/render_233_Fachada 2B_4.webp', '2025-09-17 10:04:02', '2025-09-17 10:04:02'),
(450, 233, 'Fachada 3A', '/render/render_233_Fachada 3A_1.webp', '/render/render_233_Fachada 3A_2.webp', '/render/render_233_Fachada 3A_3.webp', '/render/render_233_Fachada 3A_4.webp', '2025-09-17 10:04:02', '2025-09-17 10:04:02'),
(451, 233, 'Fachada 3B', '/render/render_233_Fachada 3B_1.webp', '/render/render_233_Fachada 3B_2.webp', '/render/render_233_Fachada 3B_3.webp', '/render/render_233_Fachada 3B_4.webp', '2025-09-17 10:04:35', '2025-09-17 10:04:35'),
(452, 233, 'Fachada 4A', '/render/render_233_Fachada 4A_1.webp', '/render/render_233_Fachada 4A_2.webp', '/render/render_233_Fachada 4A_3.webp', '/render/render_233_Fachada 4A_4.webp', '2025-09-17 10:04:35', '2025-09-17 10:04:35'),
(453, 234, 'Fachada A', '/render/render_234_Fachada A_1.webp', '/render/render_234_Fachada A_2.webp', '/render/render_234_Fachada A_3.webp', '/render/render_234_Fachada A_4.webp', '2025-09-17 10:05:51', '2025-09-17 10:05:51'),
(454, 234, 'Fachada B', '/render/render_234_Fachada B_1.webp', '/render/render_234_Fachada B_2.webp', '/render/render_234_Fachada B_3.webp', '/render/render_234_Fachada B_4.webp', '2025-09-17 10:05:51', '2025-09-17 10:05:51'),
(455, 234, 'Fachada 2A', '/render/render_234_Fachada 2A_1.webp', '/render/render_234_Fachada 2A_2.webp', '/render/render_234_Fachada 2A_3.webp', '/render/render_234_Fachada 2A_4.webp', '2025-09-17 10:05:51', '2025-09-17 10:05:51'),
(456, 234, 'Fachada 2B', '/render/render_234_Fachada 2B_1.webp', '/render/render_234_Fachada 2B_2.webp', '/render/render_234_Fachada 2B_3.webp', '/render/render_234_Fachada 2B_4.webp', '2025-09-17 10:05:51', '2025-09-17 10:05:51'),
(457, 234, 'Fachada 3A', '/render/render_234_Fachada 3A_1.webp', '/render/render_234_Fachada 3A_2.webp', '/render/render_234_Fachada 3A_3.webp', '/render/render_234_Fachada 3A_4.webp', '2025-09-17 10:05:51', '2025-09-17 10:05:51'),
(458, 234, 'Fachada 3B', '/render/render_234_Fachada 3B_1.webp', '/render/render_234_Fachada 3B_2.webp', '/render/render_234_Fachada 3B_3.webp', '/render/render_234_Fachada 3B_4.webp', '2025-09-17 10:06:24', '2025-09-17 10:06:24'),
(459, 234, 'Fachada 4A', '/render/render_234_Fachada 4A_1.webp', '/render/render_234_Fachada 4A_2.webp', '/render/render_234_Fachada 4A_3.webp', '/render/render_234_Fachada 4A_4.webp', '2025-09-17 10:06:24', '2025-09-17 10:06:24'),
(460, 235, 'Fachada A', '/render/render_235_Fachada A_1.webp', '/render/render_235_Fachada A_2.webp', '/render/render_235_Fachada A_3.webp', '/render/render_235_Fachada A_4.webp', '2025-09-17 10:07:38', '2025-09-17 10:07:38'),
(461, 235, 'Fachada B', '/render/render_235_Fachada B_1.webp', '/render/render_235_Fachada B_2.webp', '/render/render_235_Fachada B_3.webp', '/render/render_235_Fachada B_4.webp', '2025-09-17 10:07:38', '2025-09-17 10:07:38'),
(462, 235, 'Fachada 2A', '/render/render_235_Fachada 2A_1.webp', '/render/render_235_Fachada 2A_2.webp', '/render/render_235_Fachada 2A_3.webp', '/render/render_235_Fachada 2A_4.webp', '2025-09-17 10:07:38', '2025-09-17 10:07:38'),
(463, 235, 'Fachada 2B', '/render/render_235_Fachada 2B_1.webp', '/render/render_235_Fachada 2B_2.webp', '/render/render_235_Fachada 2B_3.webp', '/render/render_235_Fachada 2B_4.webp', '2025-09-17 10:07:38', '2025-09-17 10:07:38'),
(464, 235, 'Fachada 3A', '/render/render_235_Fachada 3A_1.webp', '/render/render_235_Fachada 3A_2.webp', '/render/render_235_Fachada 3A_3.webp', '/render/render_235_Fachada 3A_4.webp', '2025-09-17 10:07:38', '2025-09-17 10:07:38'),
(465, 235, 'Fachada 3B', '/render/render_235_Fachada 3B_1.webp', '/render/render_235_Fachada 3B_2.webp', '/render/render_235_Fachada 3B_3.webp', '/render/render_235_Fachada 3B_4.webp', '2025-09-17 10:08:08', '2025-09-17 10:08:08'),
(466, 235, 'Fachada 4A', '/render/render_235_Fachada 4A_1.webp', '/render/render_235_Fachada 4A_2.webp', '/render/render_235_Fachada 4A_3.webp', '/render/render_235_Fachada 4A_4.webp', '2025-09-17 10:08:08', '2025-09-17 10:08:08'),
(467, 229, 'Fachada A', '/render/render_229_Fachada A_1.webp', '/render/render_229_Fachada A_2.webp', '/render/render_229_Fachada A_3.webp', NULL, '2025-09-17 10:11:18', '2025-09-17 10:11:18'),
(468, 229, 'Fachada B', '/render/render_229_Fachada B_1.webp', '/render/render_229_Fachada B_2.webp', NULL, NULL, '2025-09-17 10:11:18', '2025-09-17 10:11:18'),
(469, 229, 'Fachada 2A', '/render/render_229_Fachada 2A_1.webp', '/render/render_229_Fachada 2A_2.webp', NULL, NULL, '2025-09-17 10:11:18', '2025-09-17 10:11:18'),
(470, 229, 'Fachada 2B', '/render/render_229_Fachada 2B_1.webp', '/render/render_229_Fachada 2B_2.webp', '/render/render_229_Fachada 2B_3.webp', '/render/render_229_Fachada 2B_4.webp', '2025-09-17 10:11:18', '2025-09-17 10:11:18'),
(471, 229, 'Fachada 3A', '/render/render_229_Fachada 3A_1.webp', '/render/render_229_Fachada 3A_2.webp', NULL, NULL, '2025-09-17 10:11:18', '2025-09-17 10:11:18'),
(472, 229, 'Fachada 3B', '/render/render_229_Fachada 3B_1.webp', '/render/render_229_Fachada 3B_2.webp', NULL, NULL, '2025-09-17 10:11:18', '2025-09-17 10:11:18'),
(473, 229, 'Fachada 4A', '/render/render_229_Fachada 4A_1.webp', '/render/render_229_Fachada 4A_2.webp', '/render/render_229_Fachada 4A_3.webp', NULL, '2025-09-17 10:11:18', '2025-09-17 10:11:18'),
(474, 230, 'Fachada A', '/render/render_230_Fachada A_1.webp', '/render/render_230_Fachada A_2.webp', '/render/render_230_Fachada A_3.webp', NULL, '2025-09-17 10:12:36', '2025-09-17 10:12:36'),
(475, 230, 'Fachada B', '/render/render_230_Fachada B_1.webp', '/render/render_230_Fachada B_2.webp', NULL, NULL, '2025-09-17 10:12:36', '2025-09-17 10:12:36'),
(476, 230, 'Fachada 2A', '/render/render_230_Fachada 2A_1.webp', '/render/render_230_Fachada 2A_2.webp', NULL, NULL, '2025-09-17 10:12:36', '2025-09-17 10:12:36'),
(477, 230, 'Fachada 2B', '/render/render_230_Fachada 2B_1.webp', '/render/render_230_Fachada 2B_2.webp', '/render/render_230_Fachada 2B_3.webp', '/render/render_230_Fachada 2B_4.webp', '2025-09-17 10:12:36', '2025-09-17 10:12:36'),
(478, 230, 'Fachada 3A', '/render/render_230_Fachada 3A_1.webp', '/render/render_230_Fachada 3A_2.webp', NULL, NULL, '2025-09-17 10:12:36', '2025-09-17 10:12:36'),
(479, 230, 'Fachada 3B', '/render/render_230_Fachada 3B_1.webp', '/render/render_230_Fachada 3B_2.webp', NULL, NULL, '2025-09-17 10:12:36', '2025-09-17 10:12:36'),
(480, 230, 'Fachada 4A', '/render/render_230_Fachada 4A_1.webp', '/render/render_230_Fachada 4A_2.webp', '/render/render_230_Fachada 4A_3.webp', NULL, '2025-09-17 10:12:36', '2025-09-17 10:12:36'),
(481, 231, 'Fachada A', '/render/render_231_Fachada A_1.webp', '/render/render_231_Fachada A_2.webp', '/render/render_231_Fachada A_3.webp', NULL, '2025-09-17 10:13:51', '2025-09-17 10:13:51'),
(482, 231, 'Fachada B', '/render/render_231_Fachada B_1.webp', '/render/render_231_Fachada B_2.webp', NULL, NULL, '2025-09-17 10:13:51', '2025-09-17 10:13:51'),
(483, 231, 'Fachada 2A', '/render/render_231_Fachada 2A_1.webp', '/render/render_231_Fachada 2A_2.webp', NULL, NULL, '2025-09-17 10:13:51', '2025-09-17 10:13:51'),
(484, 231, 'Fachada 2B', '/render/render_231_Fachada 2B_1.webp', '/render/render_231_Fachada 2B_2.webp', '/render/render_231_Fachada 2B_3.webp', '/render/render_231_Fachada 2B_4.webp', '2025-09-17 10:13:51', '2025-09-17 10:13:51'),
(485, 231, 'Fachada 3A', '/render/render_231_Fachada 3A_1.webp', '/render/render_231_Fachada 3A_2.webp', NULL, NULL, '2025-09-17 10:13:51', '2025-09-17 10:13:51'),
(486, 231, 'Fachada 3B', '/render/render_231_Fachada 3B_1.webp', '/render/render_231_Fachada 3B_2.webp', NULL, NULL, '2025-09-17 10:13:51', '2025-09-17 10:13:51'),
(487, 231, 'Fachada 4A', '/render/render_231_Fachada 4A_1.webp', '/render/render_231_Fachada 4A_2.webp', '/render/render_231_Fachada 4A_3.webp', NULL, '2025-09-17 10:13:51', '2025-09-17 10:13:51'),
(488, 246, 'Fachada A', '/render/render_246_Fachada A_1.webp', '/render/render_246_Fachada A_2.webp', '/render/render_246_Fachada A_3.webp', NULL, '2025-09-17 10:18:30', '2025-09-17 10:18:30'),
(489, 246, 'Fachada B', '/render/render_246_Fachada B_1.webp', '/render/render_246_Fachada B_2.webp', NULL, NULL, '2025-09-17 10:18:30', '2025-09-17 10:18:30'),
(490, 246, 'Fachada 2A', '/render/render_246_Fachada 2A_1.webp', '/render/render_246_Fachada 2A_2.webp', NULL, NULL, '2025-09-17 10:18:30', '2025-09-17 10:18:30'),
(491, 246, 'Fachada 2B', '/render/render_246_Fachada 2B_1.webp', '/render/render_246_Fachada 2B_2.webp', '/render/render_246_Fachada 2B_3.webp', '/render/render_246_Fachada 2B_4.webp', '2025-09-17 10:18:30', '2025-09-17 10:18:30'),
(492, 246, 'Fachada 3A', '/render/render_246_Fachada 3A_1.webp', '/render/render_246_Fachada 3A_2.webp', NULL, NULL, '2025-09-17 10:18:30', '2025-09-17 10:18:30'),
(493, 246, 'Fachada 3B', '/render/render_246_Fachada 3B_1.webp', '/render/render_246_Fachada 3B_2.webp', NULL, NULL, '2025-09-17 10:18:30', '2025-09-17 10:18:30'),
(494, 246, 'Fachada 4A', '/render/render_246_Fachada 4A_1.webp', '/render/render_246_Fachada 4A_2.webp', '/render/render_246_Fachada 4A_3.webp', NULL, '2025-09-17 10:18:30', '2025-09-17 10:18:30'),
(495, 247, 'Fachada A', '/render/render_247_Fachada A_1.webp', '/render/render_247_Fachada A_2.webp', '/render/render_247_Fachada A_3.webp', NULL, '2025-09-17 10:19:41', '2025-09-17 10:19:41'),
(496, 247, 'Fachada B', '/render/render_247_Fachada B_1.webp', '/render/render_247_Fachada B_2.webp', NULL, NULL, '2025-09-17 10:19:41', '2025-09-17 10:19:41'),
(497, 247, 'Fachada 2A', '/render/render_247_Fachada 2A_1.webp', '/render/render_247_Fachada 2A_2.webp', NULL, NULL, '2025-09-17 10:19:41', '2025-09-17 10:19:41'),
(498, 247, 'Fachada 2B', '/render/render_247_Fachada 2B_1.webp', '/render/render_247_Fachada 2B_2.webp', '/render/render_247_Fachada 2B_3.webp', '/render/render_247_Fachada 2B_4.webp', '2025-09-17 10:19:41', '2025-09-17 10:19:41'),
(499, 247, 'Fachada 3A', '/render/render_247_Fachada 3A_1.webp', '/render/render_247_Fachada 3A_2.webp', NULL, NULL, '2025-09-17 10:19:41', '2025-09-17 10:19:41'),
(500, 247, 'Fachada 3B', '/render/render_247_Fachada 3B_1.webp', '/render/render_247_Fachada 3B_2.webp', NULL, NULL, '2025-09-17 10:19:41', '2025-09-17 10:19:41'),
(501, 247, 'Fachada 4A', '/render/render_247_Fachada 4A_1.webp', '/render/render_247_Fachada 4A_2.webp', '/render/render_247_Fachada 4A_3.webp', NULL, '2025-09-17 10:19:41', '2025-09-17 10:19:41'),
(502, 248, 'Fachada A', '/render/render_248_Fachada A_1.webp', '/render/render_248_Fachada A_2.webp', '/render/render_248_Fachada A_3.webp', NULL, '2025-09-17 10:20:49', '2025-09-17 10:20:49'),
(503, 248, 'Fachada B', '/render/render_248_Fachada B_1.webp', '/render/render_248_Fachada B_2.webp', NULL, NULL, '2025-09-17 10:20:49', '2025-09-17 10:20:49'),
(504, 248, 'Fachada 2A', '/render/render_248_Fachada 2A_1.webp', '/render/render_248_Fachada 2A_2.webp', NULL, NULL, '2025-09-17 10:20:49', '2025-09-17 10:20:49'),
(505, 248, 'Fachada 2B', '/render/render_248_Fachada 2B_1.webp', '/render/render_248_Fachada 2B_2.webp', '/render/render_248_Fachada 2B_3.webp', '/render/render_248_Fachada 2B_4.webp', '2025-09-17 10:20:49', '2025-09-17 10:20:49'),
(506, 248, 'Fachada 3A', '/render/render_248_Fachada 3A_1.webp', '/render/render_248_Fachada 3A_2.webp', NULL, NULL, '2025-09-17 10:20:49', '2025-09-17 10:20:49'),
(507, 248, 'Fachada 3B', '/render/render_248_Fachada 3B_1.webp', '/render/render_248_Fachada 3B_2.webp', NULL, NULL, '2025-09-17 10:20:49', '2025-09-17 10:20:49'),
(508, 248, 'Fachada 4A', '/render/render_248_Fachada 4A_1.webp', '/render/render_248_Fachada 4A_2.webp', '/render/render_248_Fachada 4A_3.webp', NULL, '2025-09-17 10:20:49', '2025-09-17 10:20:49'),
(509, 212, 'Fachada A', '/render/render_212_Fachada A_1.webp', '/render/render_212_Fachada A_2.webp', '/render/render_212_Fachada A_3.webp', NULL, '2025-09-17 10:24:27', '2025-09-17 10:24:27'),
(510, 212, 'Fachada B', '/render/render_212_Fachada B_1.webp', '/render/render_212_Fachada B_2.webp', '/render/render_212_Fachada B_3.webp', '/render/render_212_Fachada B_4.webp', '2025-09-17 10:24:27', '2025-09-17 10:24:27'),
(511, 212, 'Fachada 2A', '/render/render_212_Fachada 2A_1.webp', '/render/render_212_Fachada 2A_2.webp', '/render/render_212_Fachada 2A_3.webp', '/render/render_212_Fachada 2A_4.webp', '2025-09-17 10:24:27', '2025-09-17 10:24:27'),
(512, 212, 'Fachada 2B', '/render/render_212_Fachada 2B_1.webp', '/render/render_212_Fachada 2B_2.webp', '/render/render_212_Fachada 2B_3.webp', '/render/render_212_Fachada 2B_4.webp', '2025-09-17 10:24:27', '2025-09-17 10:24:27'),
(513, 212, 'Fachada 3A', '/render/render_212_Fachada 3A_1.webp', '/render/render_212_Fachada 3A_2.webp', '/render/render_212_Fachada 3A_3.webp', '/render/render_212_Fachada 3A_4.webp', '2025-09-17 10:24:27', '2025-09-17 10:24:27'),
(514, 212, 'Fachada 3B', '/render/render_212_Fachada 3B_1.webp', '/render/render_212_Fachada 3B_2.webp', '/render/render_212_Fachada 3B_3.webp', '/render/render_212_Fachada 3B_4.webp', '2025-09-17 10:24:58', '2025-09-17 10:24:58'),
(515, 212, 'Fachada 4A', '/render/render_212_Fachada 4A_1.webp', '/render/render_212_Fachada 4A_2.webp', '/render/render_212_Fachada 4A_3.webp', '/render/render_212_Fachada 4A_4.webp', '2025-09-17 10:24:58', '2025-09-17 10:24:58'),
(516, 213, 'Fachada A', '/render/render_213_Fachada A_1.webp', '/render/render_213_Fachada A_2.webp', '/render/render_213_Fachada A_3.webp', NULL, '2025-09-17 10:26:16', '2025-09-17 10:26:16'),
(517, 213, 'Fachada B', '/render/render_213_Fachada B_1.webp', '/render/render_213_Fachada B_2.webp', '/render/render_213_Fachada B_3.webp', '/render/render_213_Fachada B_4.webp', '2025-09-17 10:26:16', '2025-09-17 10:26:16'),
(518, 213, 'Fachada 2A', '/render/render_213_Fachada 2A_1.webp', '/render/render_213_Fachada 2A_2.webp', '/render/render_213_Fachada 2A_3.webp', '/render/render_213_Fachada 2A_4.webp', '2025-09-17 10:26:16', '2025-09-17 10:26:16'),
(519, 213, 'Fachada 2B', '/render/render_213_Fachada 2B_1.webp', '/render/render_213_Fachada 2B_2.webp', '/render/render_213_Fachada 2B_3.webp', '/render/render_213_Fachada 2B_4.webp', '2025-09-17 10:26:16', '2025-09-17 10:26:16'),
(520, 213, 'Fachada 3A', '/render/render_213_Fachada 3A_1.webp', '/render/render_213_Fachada 3A_2.webp', '/render/render_213_Fachada 3A_3.webp', '/render/render_213_Fachada 3A_4.webp', '2025-09-17 10:26:16', '2025-09-17 10:26:16'),
(521, 213, 'Fachada 3B', '/render/render_213_Fachada 3B_1.webp', '/render/render_213_Fachada 3B_2.webp', '/render/render_213_Fachada 3B_3.webp', '/render/render_213_Fachada 3B_4.webp', '2025-09-17 10:26:51', '2025-09-17 10:26:51'),
(522, 213, 'Fachada 4A', '/render/render_213_Fachada 4A_1.webp', '/render/render_213_Fachada 4A_2.webp', '/render/render_213_Fachada 4A_3.webp', '/render/render_213_Fachada 4A_4.webp', '2025-09-17 10:26:51', '2025-09-17 10:26:51'),
(523, 214, 'Fachada A', '/render/render_214_Fachada A_1.webp', '/render/render_214_Fachada A_2.webp', '/render/render_214_Fachada A_3.webp', NULL, '2025-09-17 10:27:57', '2025-09-17 10:27:57'),
(524, 214, 'Fachada B', '/render/render_214_Fachada B_1.webp', '/render/render_214_Fachada B_2.webp', '/render/render_214_Fachada B_3.webp', '/render/render_214_Fachada B_4.webp', '2025-09-17 10:27:57', '2025-09-17 10:27:57'),
(525, 214, 'Fachada 2A', '/render/render_214_Fachada 2A_1.webp', '/render/render_214_Fachada 2A_2.webp', '/render/render_214_Fachada 2A_3.webp', '/render/render_214_Fachada 2A_4.webp', '2025-09-17 10:27:57', '2025-09-17 10:27:57'),
(526, 214, 'Fachada 2B', '/render/render_214_Fachada 2B_1.webp', '/render/render_214_Fachada 2B_2.webp', '/render/render_214_Fachada 2B_3.webp', '/render/render_214_Fachada 2B_4.webp', '2025-09-17 10:27:57', '2025-09-17 10:27:57'),
(527, 214, 'Fachada 3A', '/render/render_214_Fachada 3A_1.webp', '/render/render_214_Fachada 3A_2.webp', '/render/render_214_Fachada 3A_3.webp', '/render/render_214_Fachada 3A_4.webp', '2025-09-17 10:27:57', '2025-09-17 10:27:57'),
(528, 214, 'Fachada 3B', '/render/render_214_Fachada 3B_1.webp', '/render/render_214_Fachada 3B_2.webp', '/render/render_214_Fachada 3B_3.webp', '/render/render_214_Fachada 3B_4.webp', '2025-09-17 10:28:36', '2025-09-17 10:28:36'),
(529, 214, 'Fachada 4A', '/render/render_214_Fachada 4A_1.webp', '/render/render_214_Fachada 4A_2.webp', '/render/render_214_Fachada 4A_3.webp', '/render/render_214_Fachada 4A_4.webp', '2025-09-17 10:28:36', '2025-09-17 10:28:36'),
(530, 275, 'Fachada A', '/render/render_275_Fachada A_1.webp', '/render/render_275_Fachada A_2.webp', '/render/render_275_Fachada A_3.webp', '/render/render_275_Fachada A_4.webp', '2025-09-18 10:30:54', '2025-09-18 10:30:54'),
(531, 275, 'Fachada B', '/render/render_275_Fachada B_1.webp', '/render/render_275_Fachada B_2.webp', '/render/render_275_Fachada B_3.webp', '/render/render_275_Fachada B_4.webp', '2025-09-18 10:30:54', '2025-09-18 10:30:54'),
(532, 275, 'Fachada 2A', '/render/render_275_Fachada 2A_1.png', '/render/render_275_Fachada 2A_2.png', '/render/render_275_Fachada 2A_3.webp', '/render/render_275_Fachada 2A_4.webp', '2025-09-18 10:30:54', '2025-09-18 10:30:54'),
(533, 275, 'Fachada 2B', '/render/render_275_Fachada 2B_1.png', '/render/render_275_Fachada 2B_2.png', '/render/render_275_Fachada 2B_3.png', '/render/render_275_Fachada 2B_4.webp', '2025-09-18 10:30:54', '2025-09-18 10:30:54'),
(534, 275, 'Fachada 3A', '/render/render_275_Fachada 3A_1.png', '/render/render_275_Fachada 3A_2.webp', '/render/render_275_Fachada 3A_3.webp', '/render/render_275_Fachada 3A_4.webp', '2025-09-18 10:30:54', '2025-09-18 10:30:54'),
(535, 275, 'Fachada 4A', '/render/render_275_Fachada 4A_1.webp', '/render/render_275_Fachada 4A_2.webp', '/render/render_275_Fachada 4A_3.webp', '/render/render_275_Fachada 4A_4.webp', '2025-09-18 10:34:14', '2025-09-18 10:34:14'),
(536, 276, 'Fachada A', '/render/render_276_Fachada A_1.webp', '/render/render_276_Fachada A_2.webp', '/render/render_276_Fachada A_3.webp', '/render/render_276_Fachada A_4.webp', '2025-09-18 10:39:30', '2025-09-18 10:39:30'),
(537, 276, 'Fachada B', '/render/render_276_Fachada B_1.webp', '/render/render_276_Fachada B_2.webp', '/render/render_276_Fachada B_3.webp', '/render/render_276_Fachada B_4.webp', '2025-09-18 10:39:30', '2025-09-18 10:39:30'),
(538, 276, 'Fachada 2A', '/render/render_276_Fachada 2A_1.webp', '/render/render_276_Fachada 2A_2.webp', '/render/render_276_Fachada 2A_3.webp', '/render/render_276_Fachada 2A_4.webp', '2025-09-18 10:39:30', '2025-09-18 10:39:30'),
(539, 276, 'Fachada 2B', '/render/render_276_Fachada 2B_1.webp', '/render/render_276_Fachada 2B_2.webp', '/render/render_276_Fachada 2B_3.webp', '/render/render_276_Fachada 2B_4.webp', '2025-09-18 10:39:30', '2025-09-18 10:39:30'),
(540, 276, 'Fachada 3A', '/render/render_276_Fachada 3A_1.webp', '/render/render_276_Fachada 3A_2.webp', '/render/render_276_Fachada 3A_3.webp', '/render/render_276_Fachada 3A_4.webp', '2025-09-18 10:39:30', '2025-09-18 10:39:30'),
(541, 276, 'Fachada 4A', '/render/render_276_Fachada 4A_1.webp', '/render/render_276_Fachada 4A_2.webp', '/render/render_276_Fachada 4A_3.webp', '/render/render_276_Fachada 4A_4.webp', '2025-09-18 10:40:06', '2025-09-18 10:40:06'),
(542, 277, 'Fachada A', '/render/render_277_Fachada A_1.webp', '/render/render_277_Fachada A_2.webp', '/render/render_277_Fachada A_3.webp', '/render/render_277_Fachada A_4.webp', '2025-09-18 10:42:33', '2025-09-18 10:42:33'),
(543, 277, 'Fachada B', '/render/render_277_Fachada B_1.webp', '/render/render_277_Fachada B_2.webp', '/render/render_277_Fachada B_3.webp', '/render/render_277_Fachada B_4.webp', '2025-09-18 10:42:33', '2025-09-18 10:42:33'),
(544, 277, 'Fachada 2A', '/render/render_277_Fachada 2A_1.webp', '/render/render_277_Fachada 2A_2.webp', '/render/render_277_Fachada 2A_3.webp', '/render/render_277_Fachada 2A_4.webp', '2025-09-18 10:42:33', '2025-09-18 10:42:33'),
(545, 277, 'Fachada 2B', '/render/render_277_Fachada 2B_1.webp', '/render/render_277_Fachada 2B_2.webp', '/render/render_277_Fachada 2B_3.webp', '/render/render_277_Fachada 2B_4.webp', '2025-09-18 10:42:33', '2025-09-18 10:42:33'),
(546, 277, 'Fachada 3A', '/render/render_277_Fachada 3A_1.webp', '/render/render_277_Fachada 3A_2.webp', '/render/render_277_Fachada 3A_3.webp', '/render/render_277_Fachada 3A_4.webp', '2025-09-18 10:42:33', '2025-09-18 10:42:33'),
(547, 277, 'Fachada 4A', '/render/render_277_Fachada 4A_1.webp', '/render/render_277_Fachada 4A_2.webp', '/render/render_277_Fachada 4A_3.webp', '/render/render_277_Fachada 4A_4.webp', '2025-09-18 10:43:20', '2025-09-18 10:43:20'),
(548, 278, 'Fachada A', '/render/render_278_Fachada A_1.webp', '/render/render_278_Fachada A_2.webp', '/render/render_278_Fachada A_3.webp', '/render/render_278_Fachada A_4.webp', '2025-09-18 10:46:15', '2025-09-18 10:46:15'),
(549, 278, 'Fachada B', '/render/render_278_Fachada B_1.webp', '/render/render_278_Fachada B_2.webp', '/render/render_278_Fachada B_3.webp', '/render/render_278_Fachada B_4.webp', '2025-09-18 10:46:15', '2025-09-18 10:46:15'),
(550, 278, 'Fachada 2A', '/render/render_278_Fachada 2A_1.webp', '/render/render_278_Fachada 2A_2.webp', '/render/render_278_Fachada 2A_3.webp', '/render/render_278_Fachada 2A_4.webp', '2025-09-18 10:46:15', '2025-09-18 10:46:15'),
(551, 278, 'Fachada 2B', '/render/render_278_Fachada 2B_1.webp', '/render/render_278_Fachada 2B_2.webp', '/render/render_278_Fachada 2B_3.webp', '/render/render_278_Fachada 2B_4.webp', '2025-09-18 10:46:15', '2025-09-18 10:46:15'),
(552, 278, 'Fachada 3A', '/render/render_278_Fachada 3A_1.webp', '/render/render_278_Fachada 3A_2.webp', '/render/render_278_Fachada 3A_3.webp', '/render/render_278_Fachada 3A_4.webp', '2025-09-18 10:46:15', '2025-09-18 10:46:15'),
(553, 278, 'Fachada 4A', '/render/render_278_Fachada 4A_1.webp', '/render/render_278_Fachada 4A_2.webp', '/render/render_278_Fachada 4A_3.webp', '/render/render_278_Fachada 4A_4.webp', '2025-09-18 10:47:01', '2025-09-18 10:47:01'),
(554, 279, 'Fachada A', '/render/render_279_Fachada A_1.webp', '/render/render_279_Fachada A_2.webp', '/render/render_279_Fachada A_3.webp', '/render/render_279_Fachada A_4.webp', '2025-09-18 10:49:51', '2025-09-18 10:49:51'),
(555, 279, 'Fachada B', '/render/render_279_Fachada B_1.webp', '/render/render_279_Fachada B_2.webp', '/render/render_279_Fachada B_3.webp', '/render/render_279_Fachada B_4.webp', '2025-09-18 10:49:51', '2025-09-18 10:49:51'),
(556, 279, 'Fachada 2A', '/render/render_279_Fachada 2A_1.webp', '/render/render_279_Fachada 2A_2.webp', '/render/render_279_Fachada 2A_3.webp', '/render/render_279_Fachada 2A_4.webp', '2025-09-18 10:49:51', '2025-09-18 10:49:51'),
(557, 279, 'Fachada 2B', '/render/render_279_Fachada 2B_1.webp', '/render/render_279_Fachada 2B_2.webp', '/render/render_279_Fachada 2B_3.webp', '/render/render_279_Fachada 2B_4.webp', '2025-09-18 10:49:51', '2025-09-18 10:49:51'),
(558, 279, 'Fachada 3A', '/render/render_279_Fachada 3A_1.webp', '/render/render_279_Fachada 3A_2.webp', '/render/render_279_Fachada 3A_3.webp', '/render/render_279_Fachada 3A_4.webp', '2025-09-18 10:49:51', '2025-09-18 10:49:51'),
(559, 279, 'Fachada 4A', '/render/render_279_Fachada 4A_1.webp', '/render/render_279_Fachada 4A_2.webp', '/render/render_279_Fachada 4A_3.webp', '/render/render_279_Fachada 4A_4.webp', '2025-09-18 10:50:19', '2025-09-18 10:50:19'),
(560, 280, 'Fachada A', '/render/render_280_Fachada A_1.webp', '/render/render_280_Fachada A_2.webp', '/render/render_280_Fachada A_3.webp', '/render/render_280_Fachada A_4.webp', '2025-09-18 10:52:32', '2025-09-18 10:52:32'),
(561, 280, 'Fachada B', '/render/render_280_Fachada B_1.webp', '/render/render_280_Fachada B_2.webp', '/render/render_280_Fachada B_3.webp', '/render/render_280_Fachada B_4.webp', '2025-09-18 10:52:32', '2025-09-18 10:52:32'),
(562, 280, 'Fachada 2A', '/render/render_280_Fachada 2A_1.webp', '/render/render_280_Fachada 2A_2.webp', '/render/render_280_Fachada 2A_3.webp', '/render/render_280_Fachada 2A_4.webp', '2025-09-18 10:52:32', '2025-09-18 10:52:32'),
(563, 280, 'Fachada 2B', '/render/render_280_Fachada 2B_1.webp', '/render/render_280_Fachada 2B_2.webp', '/render/render_280_Fachada 2B_3.webp', '/render/render_280_Fachada 2B_4.webp', '2025-09-18 10:52:32', '2025-09-18 10:52:32'),
(564, 280, 'Fachada 3A', '/render/render_280_Fachada 3A_1.webp', '/render/render_280_Fachada 3A_2.webp', '/render/render_280_Fachada 3A_3.webp', '/render/render_280_Fachada 3A_4.webp', '2025-09-18 10:52:32', '2025-09-18 10:52:32'),
(565, 280, 'Fachada 4A', '/render/render_280_Fachada 4A_1.webp', '/render/render_280_Fachada 4A_2.webp', '/render/render_280_Fachada 4A_3.webp', '/render/render_280_Fachada 4A_4.webp', '2025-09-18 10:52:59', '2025-09-18 10:52:59'),
(566, 139, 'Fachada A', '/render/render_139_Fachada A_1.webp', '/render/render_139_Fachada A_2.webp', '/render/render_139_Fachada A_3.webp', '/render/render_139_Fachada A_4.webp', '2025-09-18 10:58:35', '2025-09-18 10:58:35'),
(567, 139, 'Fachada B', '/render/render_139_Fachada B_1.webp', '/render/render_139_Fachada B_2.webp', '/render/render_139_Fachada B_3.webp', '/render/render_139_Fachada B_4.webp', '2025-09-18 10:58:35', '2025-09-18 10:58:35'),
(568, 139, 'Fachada 2A', '/render/render_139_Fachada 2A_1.webp', '/render/render_139_Fachada 2A_2.webp', '/render/render_139_Fachada 2A_3.webp', '/render/render_139_Fachada 2A_4.webp', '2025-09-18 10:58:35', '2025-09-18 10:58:35'),
(569, 139, 'Fachada 2B', '/render/render_139_Fachada 2B_1.webp', '/render/render_139_Fachada 2B_2.webp', '/render/render_139_Fachada 2B_3.webp', '/render/render_139_Fachada 2B_4.webp', '2025-09-18 10:58:35', '2025-09-18 10:58:35'),
(570, 139, 'Fachada 3A', '/render/render_139_Fachada 3A_1.webp', '/render/render_139_Fachada 3A_2.webp', '/render/render_139_Fachada 3A_3.webp', '/render/render_139_Fachada 3A_4.webp', '2025-09-18 10:58:35', '2025-09-18 10:58:35'),
(571, 139, 'Fachada 4A', '/render/render_139_Fachada 4A_1.webp', '/render/render_139_Fachada 4A_2.webp', '/render/render_139_Fachada 4A_3.webp', '/render/render_139_Fachada 4A_4.webp', '2025-09-18 10:59:19', '2025-09-18 10:59:19'),
(572, 140, 'Fachada A', '/render/render_140_Fachada A_1.webp', '/render/render_140_Fachada A_2.webp', '/render/render_140_Fachada A_3.webp', '/render/render_140_Fachada A_4.webp', '2025-09-18 11:02:25', '2025-09-18 11:02:25'),
(573, 140, 'Fachada B', '/render/render_140_Fachada B_1.webp', '/render/render_140_Fachada B_2.webp', '/render/render_140_Fachada B_3.webp', '/render/render_140_Fachada B_4.webp', '2025-09-18 11:02:25', '2025-09-18 11:02:25'),
(574, 140, 'Fachada 2A', '/render/render_140_Fachada 2A_1.webp', '/render/render_140_Fachada 2A_2.webp', '/render/render_140_Fachada 2A_3.webp', '/render/render_140_Fachada 2A_4.webp', '2025-09-18 11:02:25', '2025-09-18 11:02:25'),
(575, 140, 'Fachada 2B', '/render/render_140_Fachada 2B_1.webp', '/render/render_140_Fachada 2B_2.webp', '/render/render_140_Fachada 2B_3.webp', '/render/render_140_Fachada 2B_4.webp', '2025-09-18 11:02:25', '2025-09-18 11:02:25'),
(576, 140, 'Fachada 3A', '/render/render_140_Fachada 3A_1.webp', '/render/render_140_Fachada 3A_2.webp', '/render/render_140_Fachada 3A_3.webp', '/render/render_140_Fachada 3A_4.webp', '2025-09-18 11:02:25', '2025-09-18 11:02:25'),
(577, 140, 'Fachada 4A', '/render/render_140_Fachada 4A_1.webp', '/render/render_140_Fachada 4A_2.webp', '/render/render_140_Fachada 4A_3.webp', '/render/render_140_Fachada 4A_4.webp', '2025-09-18 11:02:53', '2025-09-18 11:02:53'),
(578, 141, 'Fachada A', '/render/render_141_Fachada A_1.webp', '/render/render_141_Fachada A_2.webp', '/render/render_141_Fachada A_3.webp', '/render/render_141_Fachada A_4.webp', '2025-09-18 11:04:27', '2025-09-18 11:04:27'),
(579, 141, 'Fachada B', '/render/render_141_Fachada B_1.webp', '/render/render_141_Fachada B_2.webp', '/render/render_141_Fachada B_3.webp', '/render/render_141_Fachada B_4.webp', '2025-09-18 11:04:27', '2025-09-18 11:04:27'),
(580, 141, 'Fachada 2A', '/render/render_141_Fachada 2A_1.webp', '/render/render_141_Fachada 2A_2.webp', '/render/render_141_Fachada 2A_3.webp', '/render/render_141_Fachada 2A_4.webp', '2025-09-18 11:04:27', '2025-09-18 11:04:27'),
(581, 141, 'Fachada 2B', '/render/render_141_Fachada 2B_1.webp', '/render/render_141_Fachada 2B_2.webp', '/render/render_141_Fachada 2B_3.webp', '/render/render_141_Fachada 2B_4.webp', '2025-09-18 11:04:27', '2025-09-18 11:04:27'),
(582, 141, 'Fachada 3A', '/render/render_141_Fachada 3A_1.webp', '/render/render_141_Fachada 3A_2.webp', '/render/render_141_Fachada 3A_3.webp', '/render/render_141_Fachada 3A_4.webp', '2025-09-18 11:04:27', '2025-09-18 11:04:27'),
(583, 141, 'Fachada 4A', '/render/render_141_Fachada 4A_1.webp', '/render/render_141_Fachada 4A_2.webp', '/render/render_141_Fachada 4A_3.webp', '/render/render_141_Fachada 4A_4.webp', '2025-09-18 11:04:48', '2025-09-18 11:04:48'),
(584, 215, 'Fachada A', '/render/render_215_Fachada A_1.webp', '/render/render_215_Fachada A_2.webp', '/render/render_215_Fachada A_3.webp', NULL, '2025-09-19 03:09:15', '2025-09-19 03:09:15'),
(585, 215, 'Fachada B', '/render/render_215_Fachada B_1.webp', '/render/render_215_Fachada B_2.webp', '/render/render_215_Fachada B_3.webp', '/render/render_215_Fachada B_4.webp', '2025-09-19 03:09:15', '2025-09-19 03:09:15'),
(586, 215, 'Fachada 2A', '/render/render_215_Fachada 2A_1.webp', '/render/render_215_Fachada 2A_2.webp', '/render/render_215_Fachada 2A_3.webp', '/render/render_215_Fachada 2A_4.webp', '2025-09-19 03:09:15', '2025-09-19 03:09:15'),
(587, 215, 'Fachada 2B', '/render/render_215_Fachada 2B_1.webp', '/render/render_215_Fachada 2B_2.webp', '/render/render_215_Fachada 2B_3.webp', '/render/render_215_Fachada 2B_4.webp', '2025-09-19 03:09:15', '2025-09-19 03:09:15'),
(588, 215, 'Fachada 3A', '/render/render_215_Fachada 3A_1.webp', '/render/render_215_Fachada 3A_2.webp', '/render/render_215_Fachada 3A_3.webp', '/render/render_215_Fachada 3A_4.webp', '2025-09-19 03:09:15', '2025-09-19 03:09:15'),
(589, 215, 'Fachada 3B', '/render/render_215_Fachada 3B_1.webp', '/render/render_215_Fachada 3B_2.webp', '/render/render_215_Fachada 3B_3.webp', '/render/render_215_Fachada 3B_4.webp', '2025-09-19 03:09:15', '2025-09-19 03:10:05'),
(590, 215, 'Fachada 4A', '/render/render_215_Fachada 4A_1.webp', '/render/render_215_Fachada 4A_2.webp', '/render/render_215_Fachada 4A_3.webp', '/render/render_215_Fachada 4A_4.webp', '2025-09-19 03:10:05', '2025-09-19 03:10:05'),
(591, 216, 'Fachada A', '/render/render_216_Fachada A_1.webp', '/render/render_216_Fachada A_2.webp', '/render/render_216_Fachada A_3.webp', NULL, '2025-09-19 03:23:23', '2025-09-19 03:23:23'),
(592, 216, 'Fachada B', '/render/render_216_Fachada B_1.webp', '/render/render_216_Fachada B_2.webp', '/render/render_216_Fachada B_3.webp', '/render/render_216_Fachada B_4.webp', '2025-09-19 03:23:23', '2025-09-19 03:23:23'),
(593, 216, 'Fachada 2A', '/render/render_216_Fachada 2A_1.webp', '/render/render_216_Fachada 2A_2.webp', '/render/render_216_Fachada 2A_3.webp', '/render/render_216_Fachada 2A_4.webp', '2025-09-19 03:23:23', '2025-09-19 03:23:23'),
(594, 216, 'Fachada 2B', '/render/render_216_Fachada 2B_1.webp', '/render/render_216_Fachada 2B_2.webp', '/render/render_216_Fachada 2B_3.webp', '/render/render_216_Fachada 2B_4.webp', '2025-09-19 03:23:23', '2025-09-19 03:23:23'),
(595, 216, 'Fachada 3A', '/render/render_216_Fachada 3A_1.webp', '/render/render_216_Fachada 3A_2.webp', '/render/render_216_Fachada 3A_3.webp', '/render/render_216_Fachada 3A_4.webp', '2025-09-19 03:23:23', '2025-09-19 03:23:23'),
(596, 216, 'Fachada 3B', '/render/render_216_Fachada 3B_1.webp', '/render/render_216_Fachada 3B_2.webp', '/render/render_216_Fachada 3B_3.webp', '/render/render_216_Fachada 3B_4.webp', '2025-09-19 03:23:23', '2025-09-19 03:24:34'),
(597, 216, 'Fachada 4A', '/render/render_216_Fachada 4A_1.png', '/render/render_216_Fachada 4A_2.webp', '/render/render_216_Fachada 4A_3.webp', '/render/render_216_Fachada 4A_4.webp', '2025-09-19 03:24:34', '2025-09-19 03:24:34'),
(598, 217, 'Fachada A', '/render/render_217_Fachada A_1.webp', '/render/render_217_Fachada A_2.webp', '/render/render_217_Fachada A_3.webp', NULL, '2025-09-19 03:25:57', '2025-09-19 03:25:57'),
(599, 217, 'Fachada B', '/render/render_217_Fachada B_1.webp', '/render/render_217_Fachada B_2.webp', '/render/render_217_Fachada B_3.webp', '/render/render_217_Fachada B_4.webp', '2025-09-19 03:25:57', '2025-09-19 03:25:57'),
(600, 217, 'Fachada 2A', '/render/render_217_Fachada 2A_1.webp', '/render/render_217_Fachada 2A_2.webp', '/render/render_217_Fachada 2A_3.webp', '/render/render_217_Fachada 2A_4.webp', '2025-09-19 03:25:57', '2025-09-19 03:25:57'),
(601, 217, 'Fachada 2B', '/render/render_217_Fachada 2B_1.webp', '/render/render_217_Fachada 2B_2.webp', '/render/render_217_Fachada 2B_3.webp', '/render/render_217_Fachada 2B_4.webp', '2025-09-19 03:25:57', '2025-09-19 03:25:57'),
(602, 217, 'Fachada 3A', '/render/render_217_Fachada 3A_1.webp', '/render/render_217_Fachada 3A_2.webp', '/render/render_217_Fachada 3A_3.webp', '/render/render_217_Fachada 3A_4.webp', '2025-09-19 03:25:57', '2025-09-19 03:25:57'),
(603, 217, 'Fachada 3B', '/render/render_217_Fachada 3B_1.webp', '/render/render_217_Fachada 3B_2.webp', '/render/render_217_Fachada 3B_3.webp', '/render/render_217_Fachada 3B_4.webp', '2025-09-19 03:25:57', '2025-09-19 03:26:31'),
(604, 217, 'Fachada 4A', '/render/render_217_Fachada 4A_1.webp', '/render/render_217_Fachada 4A_2.webp', '/render/render_217_Fachada 4A_3.webp', '/render/render_217_Fachada 4A_4.webp', '2025-09-19 03:26:31', '2025-09-19 03:26:31'),
(605, 218, 'Fachada A', '/render/render_218_Fachada A_1.webp', '/render/render_218_Fachada A_2.webp', '/render/render_218_Fachada A_3.webp', NULL, '2025-09-19 03:35:18', '2025-09-19 03:35:18'),
(606, 218, 'Fachada B', '/render/render_218_Fachada B_1.webp', '/render/render_218_Fachada B_2.webp', '/render/render_218_Fachada B_3.webp', '/render/render_218_Fachada B_4.webp', '2025-09-19 03:35:18', '2025-09-19 03:35:18'),
(607, 218, 'Fachada 2A', '/render/render_218_Fachada 2A_1.webp', '/render/render_218_Fachada 2A_2.webp', '/render/render_218_Fachada 2A_3.webp', '/render/render_218_Fachada 2A_4.webp', '2025-09-19 03:35:18', '2025-09-19 03:35:18'),
(608, 218, 'Fachada 2B', '/render/render_218_Fachada 2B_1.webp', '/render/render_218_Fachada 2B_2.webp', '/render/render_218_Fachada 2B_3.webp', '/render/render_218_Fachada 2B_4.webp', '2025-09-19 03:35:18', '2025-09-19 03:35:18'),
(609, 218, 'Fachada 3A', '/render/render_218_Fachada 3A_1.webp', '/render/render_218_Fachada 3A_2.webp', '/render/render_218_Fachada 3A_3.webp', '/render/render_218_Fachada 3A_4.webp', '2025-09-19 03:35:18', '2025-09-19 03:35:18'),
(610, 218, 'Fachada 3B', '/render/render_218_Fachada 3B_1.webp', '/render/render_218_Fachada 3B_2.webp', '/render/render_218_Fachada 3B_3.webp', '/render/render_218_Fachada 3B_4.webp', '2025-09-19 03:35:52', '2025-09-19 03:35:52'),
(611, 218, 'Fachada 4A', '/render/render_218_Fachada 4A_1.webp', '/render/render_218_Fachada 4A_2.webp', '/render/render_218_Fachada 4A_3.webp', '/render/render_218_Fachada 4A_4.webp', '2025-09-19 03:35:52', '2025-09-19 03:35:52'),
(612, 219, 'Fachada A', '/render/render_219_Fachada A_1.webp', '/render/render_219_Fachada A_2.webp', '/render/render_219_Fachada A_3.webp', NULL, '2025-09-19 03:37:16', '2025-09-19 03:37:16'),
(613, 219, 'Fachada B', '/render/render_219_Fachada B_1.webp', '/render/render_219_Fachada B_2.webp', '/render/render_219_Fachada B_3.webp', '/render/render_219_Fachada B_4.webp', '2025-09-19 03:37:16', '2025-09-19 03:37:16'),
(614, 219, 'Fachada 2A', '/render/render_219_Fachada 2A_1.webp', '/render/render_219_Fachada 2A_2.webp', '/render/render_219_Fachada 2A_3.webp', '/render/render_219_Fachada 2A_4.webp', '2025-09-19 03:37:16', '2025-09-19 03:37:16'),
(615, 219, 'Fachada 2B', '/render/render_219_Fachada 2B_1.webp', '/render/render_219_Fachada 2B_2.webp', '/render/render_219_Fachada 2B_3.webp', '/render/render_219_Fachada 2B_4.webp', '2025-09-19 03:37:16', '2025-09-19 03:37:16'),
(616, 219, 'Fachada 3A', '/render/render_219_Fachada 3A_1.webp', '/render/render_219_Fachada 3A_2.webp', '/render/render_219_Fachada 3A_3.webp', '/render/render_219_Fachada 3A_4.webp', '2025-09-19 03:37:16', '2025-09-19 03:37:16'),
(617, 220, 'Fachada A', '/render/render_220_Fachada A_1.webp', '/render/render_220_Fachada A_2.webp', '/render/render_220_Fachada A_3.webp', NULL, '2025-09-19 03:39:09', '2025-09-19 03:39:09'),
(618, 220, 'Fachada B', '/render/render_220_Fachada B_1.webp', '/render/render_220_Fachada B_2.webp', '/render/render_220_Fachada B_3.webp', '/render/render_220_Fachada B_4.webp', '2025-09-19 03:39:09', '2025-09-19 03:39:09'),
(619, 220, 'Fachada 2A', '/render/render_220_Fachada 2A_1.webp', '/render/render_220_Fachada 2A_2.webp', '/render/render_220_Fachada 2A_3.webp', '/render/render_220_Fachada 2A_4.webp', '2025-09-19 03:39:09', '2025-09-19 03:39:09'),
(620, 220, 'Fachada 2B', '/render/render_220_Fachada 2B_1.webp', '/render/render_220_Fachada 2B_2.webp', '/render/render_220_Fachada 2B_3.webp', '/render/render_220_Fachada 2B_4.webp', '2025-09-19 03:39:09', '2025-09-19 03:39:09'),
(621, 220, 'Fachada 3A', '/render/render_220_Fachada 3A_1.webp', '/render/render_220_Fachada 3A_2.webp', '/render/render_220_Fachada 3A_3.webp', '/render/render_220_Fachada 3A_4.webp', '2025-09-19 03:39:09', '2025-09-19 03:39:09'),
(622, 219, 'Fachada 3B', '/render/render_219_Fachada 3B_1.webp', '/render/render_219_Fachada 3B_2.webp', '/render/render_219_Fachada 3B_3.webp', '/render/render_219_Fachada 3B_4.webp', '2025-09-19 03:49:41', '2025-09-19 03:49:41'),
(623, 219, 'Fachada 4A', '/render/render_219_Fachada 4A_1.webp', '/render/render_219_Fachada 4A_2.webp', '/render/render_219_Fachada 4A_3.webp', '/render/render_219_Fachada 4A_4.webp', '2025-09-19 03:49:41', '2025-09-19 03:49:41'),
(624, 220, 'Fachada 3B', '/render/render_220_Fachada 3B_1.webp', '/render/render_220_Fachada 3B_2.webp', '/render/render_220_Fachada 3B_3.webp', '/render/render_220_Fachada 3B_4.webp', '2025-09-19 04:03:41', '2025-09-19 04:03:41'),
(625, 220, 'Fachada 4A', '/render/render_220_Fachada 4A_1.webp', '/render/render_220_Fachada 4A_2.webp', '/render/render_220_Fachada 4A_3.webp', '/render/render_220_Fachada 4A_4.webp', '2025-09-19 04:03:41', '2025-09-19 04:03:41'),
(626, 221, 'Fachada A', '/render/render_221_Fachada A_1.webp', '/render/render_221_Fachada A_2.webp', '/render/render_221_Fachada A_3.webp', NULL, '2025-09-19 04:04:57', '2025-09-19 04:04:57'),
(627, 221, 'Fachada B', '/render/render_221_Fachada B_1.webp', '/render/render_221_Fachada B_2.webp', '/render/render_221_Fachada B_3.webp', '/render/render_221_Fachada B_4.webp', '2025-09-19 04:04:57', '2025-09-19 04:04:57'),
(628, 221, 'Fachada 2A', '/render/render_221_Fachada 2A_1.webp', '/render/render_221_Fachada 2A_2.webp', '/render/render_221_Fachada 2A_3.webp', '/render/render_221_Fachada 2A_4.webp', '2025-09-19 04:04:57', '2025-09-19 04:04:57'),
(629, 221, 'Fachada 2B', '/render/render_221_Fachada 2B_1.webp', '/render/render_221_Fachada 2B_2.webp', '/render/render_221_Fachada 2B_3.webp', '/render/render_221_Fachada 2B_4.webp', '2025-09-19 04:04:57', '2025-09-19 04:04:57'),
(630, 221, 'Fachada 3A', '/render/render_221_Fachada 3A_1.webp', '/render/render_221_Fachada 3A_2.webp', '/render/render_221_Fachada 3A_3.webp', '/render/render_221_Fachada 3A_4.webp', '2025-09-19 04:04:57', '2025-09-19 04:04:57'),
(631, 221, 'Fachada 3B', '/render/render_221_Fachada 3B_1.webp', '/render/render_221_Fachada 3B_2.webp', '/render/render_221_Fachada 3B_3.webp', '/render/render_221_Fachada 3B_4.webp', '2025-09-19 04:04:57', '2025-09-19 04:05:58'),
(632, 221, 'Fachada 4A', '/render/render_221_Fachada 4A_1.webp', '/render/render_221_Fachada 4A_2.webp', '/render/render_221_Fachada 4A_3.webp', '/render/render_221_Fachada 4A_4.webp', '2025-09-19 04:05:58', '2025-09-19 04:05:58'),
(633, 222, 'Fachada A', '/render/render_222_Fachada A_1.webp', '/render/render_222_Fachada A_2.webp', '/render/render_222_Fachada A_3.webp', NULL, '2025-09-19 04:07:12', '2025-09-19 04:07:12'),
(634, 222, 'Fachada B', '/render/render_222_Fachada B_1.webp', '/render/render_222_Fachada B_2.webp', '/render/render_222_Fachada B_3.webp', '/render/render_222_Fachada B_4.webp', '2025-09-19 04:07:12', '2025-09-19 04:07:12'),
(635, 222, 'Fachada 2A', '/render/render_222_Fachada 2A_1.webp', '/render/render_222_Fachada 2A_2.webp', '/render/render_222_Fachada 2A_3.webp', '/render/render_222_Fachada 2A_4.webp', '2025-09-19 04:07:12', '2025-09-19 04:07:12'),
(636, 222, 'Fachada 2B', '/render/render_222_Fachada 2B_1.webp', '/render/render_222_Fachada 2B_2.webp', '/render/render_222_Fachada 2B_3.webp', '/render/render_222_Fachada 2B_4.webp', '2025-09-19 04:07:12', '2025-09-19 04:07:12'),
(637, 222, 'Fachada 3A', '/render/render_222_Fachada 3A_1.webp', '/render/render_222_Fachada 3A_2.webp', '/render/render_222_Fachada 3A_3.webp', '/render/render_222_Fachada 3A_4.webp', '2025-09-19 04:07:12', '2025-09-19 04:07:12'),
(638, 222, 'Fachada 3B', '/render/render_222_Fachada 3B_1.webp', '/render/render_222_Fachada 3B_2.webp', '/render/render_222_Fachada 3B_3.webp', '/render/render_222_Fachada 3B_4.webp', '2025-09-19 04:07:12', '2025-09-19 04:07:52'),
(639, 222, 'Fachada 4A', '/render/render_222_Fachada 4A_1.webp', '/render/render_222_Fachada 4A_2.webp', '/render/render_222_Fachada 4A_3.webp', '/render/render_222_Fachada 4A_4.webp', '2025-09-19 04:07:52', '2025-09-19 04:07:52'),
(640, 223, 'Fachada A', '/render/render_223_Fachada A_1.webp', '/render/render_223_Fachada A_2.webp', '/render/render_223_Fachada A_3.webp', NULL, '2025-09-19 04:16:24', '2025-09-19 04:16:24');
INSERT INTO `product_fachada_renders` (`id`, `product_id`, `fachada`, `base_image_1`, `base_image_2`, `base_image_3`, `base_image_4`, `created_at`, `updated_at`) VALUES
(641, 223, 'Fachada B', '/render/render_223_Fachada B_1.webp', '/render/render_223_Fachada B_2.webp', '/render/render_223_Fachada B_3.webp', '/render/render_223_Fachada B_4.webp', '2025-09-19 04:16:24', '2025-09-19 04:16:24'),
(642, 223, 'Fachada 2A', '/render/render_223_Fachada 2A_1.webp', '/render/render_223_Fachada 2A_2.webp', '/render/render_223_Fachada 2A_3.webp', '/render/render_223_Fachada 2A_4.webp', '2025-09-19 04:16:24', '2025-09-19 04:16:24'),
(643, 223, 'Fachada 2B', '/render/render_223_Fachada 2B_1.webp', '/render/render_223_Fachada 2B_2.webp', '/render/render_223_Fachada 2B_3.webp', '/render/render_223_Fachada 2B_4.webp', '2025-09-19 04:16:24', '2025-09-19 04:16:24'),
(644, 223, 'Fachada 3A', '/render/render_223_Fachada 3A_1.webp', '/render/render_223_Fachada 3A_2.webp', '/render/render_223_Fachada 3A_3.webp', '/render/render_223_Fachada 3A_4.webp', '2025-09-19 04:16:24', '2025-09-19 04:16:24'),
(645, 223, 'Fachada 3B', '/render/render_223_Fachada 3B_1.webp', '/render/render_223_Fachada 3B_2.webp', '/render/render_223_Fachada 3B_3.webp', '/render/render_223_Fachada 3B_4.webp', '2025-09-19 04:17:04', '2025-09-19 04:17:04'),
(646, 223, 'Fachada 4A', '/render/render_223_Fachada 4A_1.webp', '/render/render_223_Fachada 4A_2.webp', '/render/render_223_Fachada 4A_3.webp', '/render/render_223_Fachada 4A_4.webp', '2025-09-19 04:17:04', '2025-09-19 04:17:04'),
(647, 224, 'Fachada A', '/render/render_224_Fachada A_1.webp', '/render/render_224_Fachada A_2.webp', '/render/render_224_Fachada A_3.webp', NULL, '2025-09-19 07:26:17', '2025-09-19 07:26:17'),
(648, 224, 'Fachada B', '/render/render_224_Fachada B_1.webp', '/render/render_224_Fachada B_2.webp', '/render/render_224_Fachada B_3.webp', '/render/render_224_Fachada B_4.webp', '2025-09-19 07:26:17', '2025-09-19 07:26:17'),
(649, 224, 'Fachada 2A', '/render/render_224_Fachada 2A_1.webp', '/render/render_224_Fachada 2A_2.webp', '/render/render_224_Fachada 2A_3.webp', '/render/render_224_Fachada 2A_4.webp', '2025-09-19 07:26:17', '2025-09-19 07:26:17'),
(650, 224, 'Fachada 2B', '/render/render_224_Fachada 2B_1.webp', '/render/render_224_Fachada 2B_2.webp', '/render/render_224_Fachada 2B_3.webp', '/render/render_224_Fachada 2B_4.webp', '2025-09-19 07:26:17', '2025-09-19 07:26:17'),
(651, 224, 'Fachada 3A', '/render/render_224_Fachada 3A_1.webp', '/render/render_224_Fachada 3A_2.webp', '/render/render_224_Fachada 3A_3.webp', '/render/render_224_Fachada 3A_4.webp', '2025-09-19 07:26:17', '2025-09-19 07:26:17'),
(652, 224, 'Fachada 3B', '/render/render_224_Fachada 3B_1.webp', '/render/render_224_Fachada 3B_2.webp', '/render/render_224_Fachada 3B_3.webp', '/render/render_224_Fachada 3B_4.webp', '2025-09-19 07:26:17', '2025-09-19 07:26:54'),
(653, 224, 'Fachada 4A', '/render/render_224_Fachada 4A_1.webp', '/render/render_224_Fachada 4A_2.webp', '/render/render_224_Fachada 4A_3.webp', '/render/render_224_Fachada 4A_4.webp', '2025-09-19 07:26:54', '2025-09-19 07:26:54'),
(654, 225, 'Fachada A', '/render/render_225_Fachada A_1.webp', '/render/render_225_Fachada A_2.webp', '/render/render_225_Fachada A_3.webp', NULL, '2025-09-19 07:28:06', '2025-09-19 07:28:06'),
(655, 225, 'Fachada B', '/render/render_225_Fachada B_1.webp', '/render/render_225_Fachada B_2.webp', '/render/render_225_Fachada B_3.webp', '/render/render_225_Fachada B_4.webp', '2025-09-19 07:28:06', '2025-09-19 07:28:06'),
(656, 225, 'Fachada 2A', '/render/render_225_Fachada 2A_1.webp', '/render/render_225_Fachada 2A_2.webp', '/render/render_225_Fachada 2A_3.webp', '/render/render_225_Fachada 2A_4.webp', '2025-09-19 07:28:06', '2025-09-19 07:28:06'),
(657, 225, 'Fachada 2B', '/render/render_225_Fachada 2B_1.webp', '/render/render_225_Fachada 2B_2.webp', '/render/render_225_Fachada 2B_3.webp', '/render/render_225_Fachada 2B_4.webp', '2025-09-19 07:28:06', '2025-09-19 07:28:06'),
(658, 225, 'Fachada 3A', '/render/render_225_Fachada 3A_1.webp', '/render/render_225_Fachada 3A_2.webp', '/render/render_225_Fachada 3A_3.webp', '/render/render_225_Fachada 3A_4.webp', '2025-09-19 07:28:06', '2025-09-19 07:28:06'),
(659, 225, 'Fachada 3B', '/render/render_225_Fachada 3B_1.webp', '/render/render_225_Fachada 3B_2.webp', '/render/render_225_Fachada 3B_3.webp', '/render/render_225_Fachada 3B_4.webp', '2025-09-19 07:28:06', '2025-09-19 07:28:40'),
(660, 225, 'Fachada 4A', '/render/render_225_Fachada 4A_1.webp', '/render/render_225_Fachada 4A_2.webp', '/render/render_225_Fachada 4A_3.webp', '/render/render_225_Fachada 4A_4.webp', '2025-09-19 07:28:40', '2025-09-19 07:28:40'),
(661, 137, 'Fachada A', '/render/render_137_Fachada A_1.webp', '/render/render_137_Fachada A_2.webp', '/render/render_137_Fachada A_3.webp', NULL, '2025-09-22 09:21:12', '2025-09-22 09:21:12'),
(662, 137, 'Fachada B', '/render/render_137_Fachada B_1.webp', '/render/render_137_Fachada B_2.webp', '/render/render_137_Fachada B_3.webp', NULL, '2025-09-22 09:21:12', '2025-09-22 09:21:12'),
(663, 137, 'Fachada 2A', '/render/render_137_Fachada 2A_1.webp', '/render/render_137_Fachada 2A_2.webp', '/render/render_137_Fachada 2A_3.webp', NULL, '2025-09-22 09:21:12', '2025-09-22 09:21:12'),
(664, 137, 'Fachada 2B', '/render/render_137_Fachada 2B_1.webp', '/render/render_137_Fachada 2B_2.webp', '/render/render_137_Fachada 2B_3.webp', NULL, '2025-09-22 09:21:12', '2025-09-22 09:21:12'),
(665, 137, 'Fachada 3A', '/render/render_137_Fachada 3A_1.webp', '/render/render_137_Fachada 3A_2.webp', '/render/render_137_Fachada 3A_3.webp', NULL, '2025-09-22 09:21:12', '2025-09-22 09:21:12'),
(666, 137, 'Fachada 3B', '/render/render_137_Fachada 3B_1.webp', '/render/render_137_Fachada 3B_2.webp', NULL, NULL, '2025-09-22 09:21:12', '2025-09-22 09:21:12'),
(667, 137, 'Fachada 4A', '/render/render_137_Fachada 4A_1.webp', '/render/render_137_Fachada 4A_2.webp', NULL, NULL, '2025-09-22 09:21:35', '2025-09-22 09:21:35'),
(668, 138, 'Fachada A', '/render/render_138_Fachada A_1.webp', '/render/render_138_Fachada A_2.webp', '/render/render_138_Fachada A_3.webp', NULL, '2025-09-22 09:23:42', '2025-09-22 09:23:42'),
(669, 138, 'Fachada B', '/render/render_138_Fachada B_1.webp', '/render/render_138_Fachada B_2.webp', '/render/render_138_Fachada B_3.webp', NULL, '2025-09-22 09:23:42', '2025-09-22 09:23:42'),
(670, 138, 'Fachada 2A', '/render/render_138_Fachada 2A_1.webp', '/render/render_138_Fachada 2A_2.webp', '/render/render_138_Fachada 2A_3.webp', NULL, '2025-09-22 09:23:42', '2025-09-22 09:23:42'),
(671, 138, 'Fachada 2B', '/render/render_138_Fachada 2B_1.webp', '/render/render_138_Fachada 2B_2.webp', '/render/render_138_Fachada 2B_3.webp', NULL, '2025-09-22 09:23:42', '2025-09-22 09:23:42'),
(672, 138, 'Fachada 3A', '/render/render_138_Fachada 3A_1.webp', '/render/render_138_Fachada 3A_2.webp', '/render/render_138_Fachada 3A_3.webp', NULL, '2025-09-22 09:23:42', '2025-09-22 09:23:42'),
(673, 138, 'Fachada 3B', '/render/render_138_Fachada 3B_1.webp', '/render/render_138_Fachada 3B_2.webp', NULL, NULL, '2025-09-22 09:23:42', '2025-09-22 09:23:42'),
(674, 138, 'Fachada 4A', '/render/render_138_Fachada 4A_1.webp', '/render/render_138_Fachada 4A_2.webp', NULL, NULL, '2025-09-22 09:23:58', '2025-09-22 09:23:58'),
(675, 152, 'Fachada A', '/render/render_152_Fachada A_1.webp', '/render/render_152_Fachada A_2.webp', '/render/render_152_Fachada A_3.webp', NULL, '2025-09-22 09:29:56', '2025-09-22 09:29:56'),
(676, 152, 'Fachada B', '/render/render_152_Fachada B_1.webp', '/render/render_152_Fachada B_2.webp', '/render/render_152_Fachada B_3.webp', NULL, '2025-09-22 09:29:56', '2025-09-22 09:29:56'),
(677, 152, 'Fachada 2A', '/render/render_152_Fachada 2A_1.webp', '/render/render_152_Fachada 2A_2.webp', '/render/render_152_Fachada 2A_3.webp', NULL, '2025-09-22 09:29:56', '2025-09-22 09:29:56'),
(678, 152, 'Fachada 2B', '/render/render_152_Fachada 2B_1.webp', '/render/render_152_Fachada 2B_2.webp', '/render/render_152_Fachada 2B_3.webp', NULL, '2025-09-22 09:29:56', '2025-09-22 09:29:56'),
(679, 152, 'Fachada 3A', '/render/render_152_Fachada 3A_1.webp', '/render/render_152_Fachada 3A_2.webp', '/render/render_152_Fachada 3A_3.webp', NULL, '2025-09-22 09:29:56', '2025-09-22 09:29:56'),
(680, 152, 'Fachada 3B', '/render/render_152_Fachada 3B_1.webp', '/render/render_152_Fachada 3B_2.webp', NULL, NULL, '2025-09-22 09:29:56', '2025-09-22 09:29:56'),
(681, 152, 'Fachada 4A', '/render/render_152_Fachada 4A_1.webp', '/render/render_152_Fachada 4A_2.webp', NULL, NULL, '2025-09-22 09:30:18', '2025-09-22 09:30:18'),
(682, 153, 'Fachada A', '/render/render_153_Fachada A_1.webp', '/render/render_153_Fachada A_2.webp', '/render/render_153_Fachada A_3.webp', NULL, '2025-09-22 09:32:18', '2025-09-22 09:32:18'),
(683, 153, 'Fachada B', '/render/render_153_Fachada B_1.webp', '/render/render_153_Fachada B_2.webp', '/render/render_153_Fachada B_3.webp', NULL, '2025-09-22 09:32:18', '2025-09-22 09:32:18'),
(684, 153, 'Fachada 2A', '/render/render_153_Fachada 2A_1.webp', '/render/render_153_Fachada 2A_2.webp', '/render/render_153_Fachada 2A_3.webp', NULL, '2025-09-22 09:32:18', '2025-09-22 09:32:18'),
(685, 153, 'Fachada 2B', '/render/render_153_Fachada 2B_1.webp', '/render/render_153_Fachada 2B_2.webp', '/render/render_153_Fachada 2B_3.webp', NULL, '2025-09-22 09:32:18', '2025-09-22 09:32:18'),
(686, 153, 'Fachada 3A', '/render/render_153_Fachada 3A_1.webp', '/render/render_153_Fachada 3A_2.webp', '/render/render_153_Fachada 3A_3.webp', NULL, '2025-09-22 09:32:18', '2025-09-22 09:32:18'),
(687, 153, 'Fachada 3B', '/render/render_153_Fachada 3B_1.webp', '/render/render_153_Fachada 3B_2.webp', NULL, NULL, '2025-09-22 09:32:18', '2025-09-22 09:32:18'),
(688, 153, 'Fachada 4A', '/render/render_153_Fachada 4A_1.webp', '/render/render_153_Fachada 4A_2.webp', NULL, NULL, '2025-09-22 09:32:43', '2025-09-22 09:32:43'),
(689, 154, 'Fachada A', '/render/render_154_Fachada A_1.webp', '/render/render_154_Fachada A_2.webp', '/render/render_154_Fachada A_3.webp', NULL, '2025-09-22 09:34:48', '2025-09-22 09:34:48'),
(690, 154, 'Fachada B', '/render/render_154_Fachada B_1.webp', '/render/render_154_Fachada B_2.webp', '/render/render_154_Fachada B_3.webp', NULL, '2025-09-22 09:34:48', '2025-09-22 09:34:48'),
(691, 154, 'Fachada 2A', '/render/render_154_Fachada 2A_1.webp', '/render/render_154_Fachada 2A_2.webp', '/render/render_154_Fachada 2A_3.webp', NULL, '2025-09-22 09:34:48', '2025-09-22 09:34:48'),
(692, 154, 'Fachada 2B', '/render/render_154_Fachada 2B_1.webp', '/render/render_154_Fachada 2B_2.webp', '/render/render_154_Fachada 2B_3.webp', NULL, '2025-09-22 09:34:48', '2025-09-22 09:34:48'),
(693, 154, 'Fachada 3A', '/render/render_154_Fachada 3A_1.webp', '/render/render_154_Fachada 3A_2.webp', '/render/render_154_Fachada 3A_3.webp', NULL, '2025-09-22 09:34:48', '2025-09-22 09:34:48'),
(694, 154, 'Fachada 3B', '/render/render_154_Fachada 3B_1.webp', '/render/render_154_Fachada 3B_2.webp', '/render/render_154_Fachada 3B_3.webp', NULL, '2025-09-22 09:34:48', '2025-09-22 09:35:22'),
(695, 154, 'Fachada 4A', '/render/render_154_Fachada 4A_1.webp', '/render/render_154_Fachada 4A_2.webp', NULL, NULL, '2025-09-22 09:35:22', '2025-09-22 09:35:22'),
(696, 111, 'Fachada A', '/render/render_111_Fachada A_1.webp', '/render/render_111_Fachada A_2.webp', '/render/render_111_Fachada A_3.webp', NULL, '2025-09-22 09:41:35', '2025-09-22 09:41:35'),
(697, 112, 'Fachada A', '/render/render_112_Fachada A_1.webp', '/render/render_112_Fachada A_2.webp', '/render/render_112_Fachada A_3.webp', NULL, '2025-09-22 09:42:24', '2025-09-22 09:42:24'),
(698, 113, 'Fachada A', '/render/render_113_Fachada A_1.webp', '/render/render_113_Fachada A_2.webp', '/render/render_113_Fachada A_3.webp', NULL, '2025-09-22 09:42:36', '2025-09-22 09:42:36'),
(699, 114, 'Fachada A', '/render/render_114_Fachada A_1.webp', '/render/render_114_Fachada A_2.webp', '/render/render_114_Fachada A_3.webp', NULL, '2025-09-22 09:42:53', '2025-09-22 09:42:53'),
(700, 115, 'Fachada A', '/render/render_115_Fachada A_1.webp', '/render/render_115_Fachada A_2.webp', '/render/render_115_Fachada A_3.webp', NULL, '2025-09-22 09:43:09', '2025-09-22 09:43:09'),
(701, 116, 'Fachada A', '/render/render_116_Fachada A_1.webp', '/render/render_116_Fachada A_2.webp', '/render/render_116_Fachada A_3.webp', NULL, '2025-09-22 09:43:44', '2025-09-22 09:43:44'),
(702, 117, 'Fachada A', '/render/render_117_Fachada A_1.webp', '/render/render_117_Fachada A_2.webp', '/render/render_117_Fachada A_3.webp', NULL, '2025-09-22 09:43:58', '2025-09-22 09:43:58'),
(703, 118, 'Fachada A', '/render/render_118_Fachada A_1.webp', '/render/render_118_Fachada A_2.webp', '/render/render_118_Fachada A_3.webp', NULL, '2025-09-22 09:44:19', '2025-09-22 09:44:19'),
(704, 127, 'Fachada A', '/render/render_127_Fachada A_1.webp', '/render/render_127_Fachada A_2.webp', '/render/render_127_Fachada A_3.webp', '/render/render_127_Fachada A_4.webp', '2025-09-22 09:45:39', '2025-09-22 09:45:39'),
(705, 128, 'Fachada A', '/render/render_128_Fachada A_1.webp', '/render/render_128_Fachada A_2.webp', '/render/render_128_Fachada A_3.webp', '/render/render_128_Fachada A_4.webp', '2025-09-22 09:46:00', '2025-09-22 09:46:00'),
(706, 129, 'Fachada A', '/render/render_129_Fachada A_1.webp', '/render/render_129_Fachada A_2.webp', '/render/render_129_Fachada A_3.webp', '/render/render_129_Fachada A_4.webp', '2025-09-22 09:46:21', '2025-09-22 09:46:21'),
(707, 130, 'Fachada A', '/render/render_130_Fachada A_1.webp', '/render/render_130_Fachada A_2.webp', '/render/render_130_Fachada A_3.webp', '/render/render_130_Fachada A_4.webp', '2025-09-22 09:46:43', '2025-09-22 09:46:43'),
(708, 131, 'Fachada A', '/render/render_131_Fachada A_1.webp', '/render/render_131_Fachada A_2.webp', '/render/render_131_Fachada A_3.webp', '/render/render_131_Fachada A_4.webp', '2025-09-22 09:47:03', '2025-09-22 09:47:03'),
(709, 132, 'Fachada A', '/render/render_132_Fachada A_1.webp', '/render/render_132_Fachada A_2.webp', '/render/render_132_Fachada A_3.webp', '/render/render_132_Fachada A_4.webp', '2025-09-22 09:47:23', '2025-09-22 09:47:23'),
(710, 133, 'Fachada A', '/render/render_133_Fachada A_1.webp', '/render/render_133_Fachada A_2.webp', '/render/render_133_Fachada A_3.webp', '/render/render_133_Fachada A_4.webp', '2025-09-22 09:47:46', '2025-09-22 09:47:46'),
(711, 111, 'Fachada B', '/render/render_111_Fachada B_1.webp', '/render/render_111_Fachada B_2.webp', '/render/render_111_Fachada B_3.webp', '/render/render_111_Fachada B_4.webp', '2025-09-22 09:53:46', '2025-09-22 09:53:46'),
(712, 112, 'Fachada B', '/render/render_112_Fachada B_1.webp', '/render/render_112_Fachada B_2.webp', '/render/render_112_Fachada B_3.webp', '/render/render_112_Fachada B_4.webp', '2025-09-22 09:54:12', '2025-09-22 09:54:12'),
(713, 113, 'Fachada B', '/render/render_113_Fachada B_1.webp', '/render/render_113_Fachada B_2.webp', '/render/render_113_Fachada B_3.webp', '/render/render_113_Fachada B_4.webp', '2025-09-22 09:54:30', '2025-09-22 09:54:30'),
(714, 114, 'Fachada B', '/render/render_114_Fachada B_1.webp', '/render/render_114_Fachada B_2.webp', '/render/render_114_Fachada B_3.webp', '/render/render_114_Fachada B_4.webp', '2025-09-22 09:54:56', '2025-09-22 09:54:56'),
(715, 115, 'Fachada B', '/render/render_115_Fachada B_1.webp', '/render/render_115_Fachada B_2.webp', '/render/render_115_Fachada B_3.webp', '/render/render_115_Fachada B_4.webp', '2025-09-22 09:55:40', '2025-09-22 09:55:40'),
(716, 116, 'Fachada B', '/render/render_116_Fachada B_1.webp', '/render/render_116_Fachada B_2.webp', '/render/render_116_Fachada B_3.webp', '/render/render_116_Fachada B_4.webp', '2025-09-22 09:56:18', '2025-09-22 09:56:18'),
(717, 117, 'Fachada B', '/render/render_117_Fachada B_1.webp', '/render/render_117_Fachada B_2.webp', '/render/render_117_Fachada B_3.webp', '/render/render_117_Fachada B_4.png', '2025-09-22 09:56:40', '2025-09-22 09:56:40'),
(718, 118, 'Fachada B', '/render/render_118_Fachada B_1.webp', '/render/render_118_Fachada B_2.webp', '/render/render_118_Fachada B_3.webp', '/render/render_118_Fachada B_4.webp', '2025-09-22 09:57:03', '2025-09-22 09:57:03'),
(719, 119, 'Fachada B', '/render/render_119_Fachada B_1.webp', '/render/render_119_Fachada B_2.webp', '/render/render_119_Fachada B_3.webp', NULL, '2025-09-22 09:59:12', '2025-09-22 09:59:12'),
(720, 120, 'Fachada B', '/render/render_120_Fachada B_1.webp', '/render/render_120_Fachada B_2.webp', '/render/render_120_Fachada B_3.webp', NULL, '2025-09-22 09:59:26', '2025-09-22 09:59:26'),
(721, 121, 'Fachada B', '/render/render_121_Fachada B_1.webp', '/render/render_121_Fachada B_2.webp', '/render/render_121_Fachada B_3.webp', NULL, '2025-09-22 09:59:38', '2025-09-22 09:59:38'),
(722, 122, 'Fachada B', '/render/render_122_Fachada B_1.webp', '/render/render_122_Fachada B_2.webp', '/render/render_122_Fachada B_3.webp', NULL, '2025-09-22 09:59:58', '2025-09-22 09:59:58'),
(723, 123, 'Fachada B', '/render/render_123_Fachada B_1.webp', '/render/render_123_Fachada B_2.webp', '/render/render_123_Fachada B_3.webp', NULL, '2025-09-22 10:00:14', '2025-09-22 10:00:14'),
(724, 124, 'Fachada B', '/render/render_124_Fachada B_1.webp', '/render/render_124_Fachada B_2.webp', '/render/render_124_Fachada B_3.webp', NULL, '2025-09-22 10:00:52', '2025-09-22 10:00:52'),
(725, 125, 'Fachada B', '/render/render_125_Fachada B_1.webp', '/render/render_125_Fachada B_2.webp', '/render/render_125_Fachada B_3.webp', NULL, '2025-09-22 10:01:08', '2025-09-22 10:01:08'),
(726, 126, 'Fachada B', '/render/render_126_Fachada B_1.webp', '/render/render_126_Fachada B_2.webp', '/render/render_126_Fachada B_3.webp', NULL, '2025-09-22 10:01:31', '2025-09-22 10:01:31'),
(727, 127, 'Fachada B', '/render/render_127_Fachada B_1.webp', '/render/render_127_Fachada B_2.webp', '/render/render_127_Fachada B_3.webp', '/render/render_127_Fachada B_4.webp', '2025-09-22 10:02:57', '2025-09-22 10:02:57'),
(728, 128, 'Fachada B', '/render/render_128_Fachada B_1.webp', '/render/render_128_Fachada B_2.webp', '/render/render_128_Fachada B_3.webp', '/render/render_128_Fachada B_4.webp', '2025-09-22 10:03:12', '2025-09-22 10:03:12'),
(729, 129, 'Fachada B', '/render/render_129_Fachada B_1.webp', '/render/render_129_Fachada B_2.webp', '/render/render_129_Fachada B_3.webp', '/render/render_129_Fachada B_4.webp', '2025-09-22 10:03:34', '2025-09-22 10:03:34'),
(730, 130, 'Fachada B', '/render/render_130_Fachada B_1.webp', '/render/render_130_Fachada B_2.webp', '/render/render_130_Fachada B_3.webp', '/render/render_130_Fachada B_4.webp', '2025-09-22 10:03:54', '2025-09-22 10:03:54'),
(731, 131, 'Fachada B', '/render/render_131_Fachada B_1.webp', '/render/render_131_Fachada B_2.webp', '/render/render_131_Fachada B_3.webp', '/render/render_131_Fachada B_4.webp', '2025-09-22 10:04:10', '2025-09-22 10:04:10'),
(732, 132, 'Fachada B', '/render/render_132_Fachada B_1.webp', '/render/render_132_Fachada B_2.webp', '/render/render_132_Fachada B_3.webp', '/render/render_132_Fachada B_4.webp', '2025-09-22 10:04:30', '2025-09-22 10:04:30'),
(733, 133, 'Fachada B', '/render/render_133_Fachada B_1.webp', '/render/render_133_Fachada B_2.webp', '/render/render_133_Fachada B_3.webp', '/render/render_133_Fachada B_4.webp', '2025-09-22 10:04:59', '2025-09-22 10:04:59'),
(734, 111, 'Fachada 2A', '/render/render_111_Fachada 2A_1.webp', '/render/render_111_Fachada 2A_2.webp', '/render/render_111_Fachada 2A_3.webp', NULL, '2025-09-22 10:07:18', '2025-09-22 10:07:18'),
(735, 112, 'Fachada 2A', '/render/render_112_Fachada 2A_1.webp', '/render/render_112_Fachada 2A_2.webp', '/render/render_112_Fachada 2A_3.webp', NULL, '2025-09-22 10:07:35', '2025-09-22 10:07:35'),
(736, 113, 'Fachada 2A', '/render/render_113_Fachada 2A_1.webp', '/render/render_113_Fachada 2A_2.webp', '/render/render_113_Fachada 2A_3.webp', NULL, '2025-09-22 10:07:56', '2025-09-22 10:07:56'),
(737, 114, 'Fachada 2A', '/render/render_114_Fachada 2A_1.webp', '/render/render_114_Fachada 2A_2.webp', '/render/render_114_Fachada 2A_3.webp', NULL, '2025-09-22 10:08:18', '2025-09-22 10:08:18'),
(738, 115, 'Fachada 2A', '/render/render_115_Fachada 2A_1.webp', '/render/render_115_Fachada 2A_2.webp', '/render/render_115_Fachada 2A_3.webp', NULL, '2025-09-22 10:08:34', '2025-09-22 10:08:34'),
(739, 116, 'Fachada 2A', '/render/render_116_Fachada 2A_1.webp', '/render/render_116_Fachada 2A_2.webp', '/render/render_116_Fachada 2A_3.webp', NULL, '2025-09-22 10:08:50', '2025-09-22 10:08:50'),
(740, 117, 'Fachada 2A', '/render/render_117_Fachada 2A_1.webp', '/render/render_117_Fachada 2A_2.webp', '/render/render_117_Fachada 2A_3.webp', NULL, '2025-09-22 10:09:12', '2025-09-22 10:09:12'),
(741, 118, 'Fachada 2A', '/render/render_118_Fachada 2A_1.webp', '/render/render_118_Fachada 2A_2.webp', '/render/render_118_Fachada 2A_3.webp', NULL, '2025-09-22 10:09:30', '2025-09-22 10:09:30'),
(742, 119, 'Fachada 2A', '/render/render_119_Fachada 2A_1.webp', '/render/render_119_Fachada 2A_2.webp', '/render/render_119_Fachada 2A_3.webp', '/render/render_119_Fachada 2A_4.webp', '2025-09-22 10:13:41', '2025-09-22 10:13:41'),
(743, 120, 'Fachada 2A', '/render/render_120_Fachada 2A_1.webp', '/render/render_120_Fachada 2A_2.webp', '/render/render_120_Fachada 2A_3.webp', '/render/render_120_Fachada 2A_4.webp', '2025-09-22 10:13:59', '2025-09-22 10:13:59'),
(744, 121, 'Fachada 2A', '/render/render_121_Fachada 2A_1.webp', '/render/render_121_Fachada 2A_2.webp', '/render/render_121_Fachada 2A_3.webp', '/render/render_121_Fachada 2A_4.webp', '2025-09-22 10:14:22', '2025-09-22 10:14:22'),
(745, 122, 'Fachada 2A', '/render/render_122_Fachada 2A_1.webp', '/render/render_122_Fachada 2A_2.webp', '/render/render_122_Fachada 2A_3.webp', '/render/render_122_Fachada 2A_4.webp', '2025-09-22 10:14:57', '2025-09-22 10:14:57'),
(746, 123, 'Fachada 2A', '/render/render_123_Fachada 2A_1.webp', '/render/render_123_Fachada 2A_2.webp', '/render/render_123_Fachada 2A_3.webp', '/render/render_123_Fachada 2A_4.webp', '2025-09-22 10:15:21', '2025-09-22 10:15:21'),
(747, 124, 'Fachada 2A', '/render/render_124_Fachada 2A_1.webp', '/render/render_124_Fachada 2A_2.webp', '/render/render_124_Fachada 2A_3.webp', '/render/render_124_Fachada 2A_4.webp', '2025-09-22 10:15:37', '2025-09-22 10:15:37'),
(748, 125, 'Fachada 2A', '/render/render_125_Fachada 2A_1.webp', '/render/render_125_Fachada 2A_2.webp', '/render/render_125_Fachada 2A_3.webp', '/render/render_125_Fachada 2A_4.webp', '2025-09-22 10:16:05', '2025-09-22 10:16:05'),
(749, 126, 'Fachada 2A', '/render/render_126_Fachada 2A_1.webp', '/render/render_126_Fachada 2A_2.webp', '/render/render_126_Fachada 2A_3.webp', '/render/render_126_Fachada 2A_4.webp', '2025-09-22 10:18:28', '2025-09-22 10:18:28'),
(750, 127, 'Fachada 2A', '/render/render_127_Fachada 2A_1.webp', '/render/render_127_Fachada 2A_2.webp', '/render/render_127_Fachada 2A_3.webp', '/render/render_127_Fachada 2A_4.webp', '2025-09-22 10:19:18', '2025-09-22 10:19:18'),
(751, 128, 'Fachada 2A', '/render/render_128_Fachada 2A_1.webp', '/render/render_128_Fachada 2A_2.webp', '/render/render_128_Fachada 2A_3.webp', '/render/render_128_Fachada 2A_4.webp', '2025-09-22 10:19:49', '2025-09-22 10:19:49'),
(752, 129, 'Fachada 2A', '/render/render_129_Fachada 2A_1.webp', '/render/render_129_Fachada 2A_2.webp', '/render/render_129_Fachada 2A_3.webp', '/render/render_129_Fachada 2A_4.webp', '2025-09-22 10:20:09', '2025-09-22 10:20:09'),
(753, 130, 'Fachada 2A', '/render/render_130_Fachada 2A_1.webp', '/render/render_130_Fachada 2A_2.webp', '/render/render_130_Fachada 2A_3.webp', '/render/render_130_Fachada 2A_4.webp', '2025-09-22 10:20:29', '2025-09-22 10:20:29'),
(754, 131, 'Fachada 2A', '/render/render_131_Fachada 2A_1.webp', '/render/render_131_Fachada 2A_2.webp', '/render/render_131_Fachada 2A_3.webp', '/render/render_131_Fachada 2A_4.webp', '2025-09-22 10:20:44', '2025-09-22 10:20:44'),
(755, 132, 'Fachada 2A', '/render/render_132_Fachada 2A_1.webp', '/render/render_132_Fachada 2A_2.webp', '/render/render_132_Fachada 2A_3.webp', '/render/render_132_Fachada 2A_4.webp', '2025-09-22 10:21:06', '2025-09-22 10:21:06'),
(756, 133, 'Fachada 2A', '/render/render_133_Fachada 2A_1.webp', '/render/render_133_Fachada 2A_2.webp', '/render/render_133_Fachada 2A_3.webp', '/render/render_133_Fachada 2A_4.webp', '2025-09-22 10:21:24', '2025-09-22 10:21:24'),
(757, 111, 'Fachada 2B', '/render/render_111_Fachada 2B_1.webp', '/render/render_111_Fachada 2B_2.webp', '/render/render_111_Fachada 2B_3.webp', '/render/render_111_Fachada 2B_4.webp', '2025-09-22 10:23:53', '2025-09-22 10:23:53'),
(758, 112, 'Fachada 2B', '/render/render_112_Fachada 2B_1.webp', '/render/render_112_Fachada 2B_2.webp', '/render/render_112_Fachada 2B_3.webp', '/render/render_112_Fachada 2B_4.webp', '2025-09-22 10:24:15', '2025-09-22 10:24:15'),
(759, 113, 'Fachada 2B', '/render/render_113_Fachada 2B_1.webp', '/render/render_113_Fachada 2B_2.webp', '/render/render_113_Fachada 2B_3.webp', '/render/render_113_Fachada 2B_4.webp', '2025-09-22 10:24:33', '2025-09-22 10:24:33'),
(760, 114, 'Fachada 2B', '/render/render_114_Fachada 2B_1.webp', '/render/render_114_Fachada 2B_2.webp', '/render/render_114_Fachada 2B_3.webp', '/render/render_114_Fachada 2B_4.webp', '2025-09-22 10:24:51', '2025-09-22 10:24:51'),
(761, 115, 'Fachada 2B', '/render/render_115_Fachada 2B_1.webp', '/render/render_115_Fachada 2B_2.webp', '/render/render_115_Fachada 2B_3.webp', '/render/render_115_Fachada 2B_4.webp', '2025-09-22 10:25:06', '2025-09-22 10:25:06'),
(762, 116, 'Fachada 2B', '/render/render_116_Fachada 2B_1.webp', '/render/render_116_Fachada 2B_2.webp', '/render/render_116_Fachada 2B_3.webp', '/render/render_116_Fachada 2B_4.webp', '2025-09-22 10:25:23', '2025-09-22 10:25:23'),
(763, 117, 'Fachada 2B', '/render/render_117_Fachada 2B_1.webp', '/render/render_117_Fachada 2B_2.webp', '/render/render_117_Fachada 2B_3.webp', '/render/render_117_Fachada 2B_4.webp', '2025-09-22 10:25:38', '2025-09-22 10:25:38'),
(764, 118, 'Fachada 2B', '/render/render_118_Fachada 2B_1.webp', '/render/render_118_Fachada 2B_2.webp', '/render/render_118_Fachada 2B_3.webp', '/render/render_118_Fachada 2B_4.webp', '2025-09-22 10:25:55', '2025-09-22 10:25:55'),
(765, 119, 'Fachada 2B', '/render/render_119_Fachada 2B_1.webp', '/render/render_119_Fachada 2B_2.webp', '/render/render_119_Fachada 2B_3.webp', NULL, '2025-09-22 10:26:47', '2025-09-22 10:26:47'),
(766, 120, 'Fachada 2B', '/render/render_120_Fachada 2B_1.webp', '/render/render_120_Fachada 2B_2.webp', '/render/render_120_Fachada 2B_3.webp', NULL, '2025-09-22 10:26:58', '2025-09-22 10:26:58'),
(767, 121, 'Fachada 2B', '/render/render_121_Fachada 2B_1.webp', '/render/render_121_Fachada 2B_2.webp', '/render/render_121_Fachada 2B_3.webp', NULL, '2025-09-22 10:27:19', '2025-09-22 10:27:19'),
(768, 122, 'Fachada 2B', '/render/render_122_Fachada 2B_1.webp', '/render/render_122_Fachada 2B_2.webp', '/render/render_122_Fachada 2B_3.webp', NULL, '2025-09-22 10:27:37', '2025-09-22 10:27:37'),
(769, 123, 'Fachada 2B', '/render/render_123_Fachada 2B_1.webp', '/render/render_123_Fachada 2B_2.webp', '/render/render_123_Fachada 2B_3.webp', NULL, '2025-09-22 10:27:53', '2025-09-22 10:27:53'),
(770, 124, 'Fachada 2B', '/render/render_124_Fachada 2B_1.webp', '/render/render_124_Fachada 2B_2.webp', '/render/render_124_Fachada 2B_3.webp', NULL, '2025-09-22 10:28:08', '2025-09-22 10:28:08'),
(771, 125, 'Fachada 2B', '/render/render_125_Fachada 2B_1.webp', '/render/render_125_Fachada 2B_2.webp', '/render/render_125_Fachada 2B_3.webp', NULL, '2025-09-22 10:28:22', '2025-09-22 10:28:22'),
(772, 126, 'Fachada 2B', '/render/render_126_Fachada 2B_1.webp', '/render/render_126_Fachada 2B_2.webp', '/render/render_126_Fachada 2B_3.webp', NULL, '2025-09-22 10:28:38', '2025-09-22 10:28:38'),
(773, 127, 'Fachada 2B', '/render/render_127_Fachada 2B_1.webp', '/render/render_127_Fachada 2B_2.webp', '/render/render_127_Fachada 2B_3.webp', '/render/render_127_Fachada 2B_4.webp', '2025-09-22 10:29:48', '2025-09-22 10:29:48'),
(774, 128, 'Fachada 2B', '/render/render_128_Fachada 2B_1.webp', '/render/render_128_Fachada 2B_2.webp', '/render/render_128_Fachada 2B_3.webp', '/render/render_128_Fachada 2B_4.webp', '2025-09-22 10:30:15', '2025-09-22 10:30:15'),
(775, 129, 'Fachada 2B', '/render/render_129_Fachada 2B_1.webp', '/render/render_129_Fachada 2B_2.webp', '/render/render_129_Fachada 2B_3.webp', '/render/render_129_Fachada 2B_4.webp', '2025-09-22 10:30:30', '2025-09-22 10:30:30'),
(776, 130, 'Fachada 2B', '/render/render_130_Fachada 2B_1.webp', '/render/render_130_Fachada 2B_2.webp', '/render/render_130_Fachada 2B_3.webp', '/render/render_130_Fachada 2B_4.webp', '2025-09-22 10:30:45', '2025-09-22 10:30:45'),
(777, 131, 'Fachada 2B', '/render/render_131_Fachada 2B_1.webp', '/render/render_131_Fachada 2B_2.webp', '/render/render_131_Fachada 2B_3.webp', '/render/render_131_Fachada 2B_4.webp', '2025-09-22 10:31:02', '2025-09-22 10:31:02'),
(778, 132, 'Fachada 2B', '/render/render_132_Fachada 2B_1.webp', '/render/render_132_Fachada 2B_2.webp', '/render/render_132_Fachada 2B_3.webp', '/render/render_132_Fachada 2B_4.webp', '2025-09-22 10:31:20', '2025-09-22 10:31:20'),
(779, 133, 'Fachada 2B', '/render/render_133_Fachada 2B_1.webp', '/render/render_133_Fachada 2B_2.webp', '/render/render_133_Fachada 2B_3.webp', '/render/render_133_Fachada 2B_4.webp', '2025-09-22 10:31:41', '2025-09-22 10:31:41'),
(780, 111, 'Fachada 3A', '/render/render_111_Fachada 3A_1.webp', '/render/render_111_Fachada 3A_2.webp', '/render/render_111_Fachada 3A_3.webp', NULL, '2025-09-22 10:32:57', '2025-09-22 10:32:57'),
(781, 112, 'Fachada 3A', '/render/render_112_Fachada 3A_1.webp', '/render/render_112_Fachada 3A_2.webp', '/render/render_112_Fachada 3A_3.webp', NULL, '2025-09-22 10:33:15', '2025-09-22 10:33:15'),
(782, 113, 'Fachada 3A', '/render/render_113_Fachada 3A_1.webp', '/render/render_113_Fachada 3A_2.webp', '/render/render_113_Fachada 3A_3.webp', NULL, '2025-09-22 10:33:35', '2025-09-22 10:33:35'),
(783, 114, 'Fachada 3A', '/render/render_114_Fachada 3A_1.webp', '/render/render_114_Fachada 3A_2.webp', '/render/render_114_Fachada 3A_3.webp', NULL, '2025-09-22 10:33:58', '2025-09-22 10:33:58'),
(784, 115, 'Fachada 3A', '/render/render_115_Fachada 3A_1.webp', '/render/render_115_Fachada 3A_2.webp', '/render/render_115_Fachada 3A_3.webp', NULL, '2025-09-22 10:34:13', '2025-09-22 10:34:13'),
(785, 116, 'Fachada 3A', '/render/render_116_Fachada 3A_1.webp', '/render/render_116_Fachada 3A_2.webp', '/render/render_116_Fachada 3A_3.webp', NULL, '2025-09-22 10:34:26', '2025-09-22 10:34:26'),
(786, 117, 'Fachada 3A', '/render/render_117_Fachada 3A_1.webp', '/render/render_117_Fachada 3A_2.webp', '/render/render_117_Fachada 3A_3.webp', NULL, '2025-09-22 10:34:39', '2025-09-22 10:34:39'),
(787, 118, 'Fachada 3A', '/render/render_118_Fachada 3A_1.webp', '/render/render_118_Fachada 3A_2.webp', '/render/render_118_Fachada 3A_3.webp', NULL, '2025-09-22 10:35:00', '2025-09-22 10:35:00'),
(788, 119, 'Fachada 3A', '/render/render_119_Fachada 3A_1.webp', '/render/render_119_Fachada 3A_2.webp', '/render/render_119_Fachada 3A_3.webp', NULL, '2025-09-22 10:35:35', '2025-09-22 10:35:35'),
(789, 120, 'Fachada 3A', '/render/render_120_Fachada 3A_1.webp', '/render/render_120_Fachada 3A_2.webp', '/render/render_120_Fachada 3A_3.webp', NULL, '2025-09-22 10:35:48', '2025-09-22 10:35:48'),
(790, 121, 'Fachada 3A', '/render/render_121_Fachada 3A_1.webp', '/render/render_121_Fachada 3A_2.webp', '/render/render_121_Fachada 3A_3.webp', NULL, '2025-09-22 10:36:12', '2025-09-22 10:36:12'),
(791, 122, 'Fachada 3A', '/render/render_122_Fachada 3A_1.webp', '/render/render_122_Fachada 3A_2.webp', '/render/render_122_Fachada 3A_3.webp', NULL, '2025-09-22 10:36:25', '2025-09-22 10:36:25'),
(792, 123, 'Fachada 3A', '/render/render_123_Fachada 3A_1.webp', '/render/render_123_Fachada 3A_2.webp', '/render/render_123_Fachada 3A_3.webp', NULL, '2025-09-22 10:36:38', '2025-09-22 10:36:38'),
(793, 124, 'Fachada 3A', '/render/render_124_Fachada 3A_1.webp', '/render/render_124_Fachada 3A_2.webp', '/render/render_124_Fachada 3A_3.webp', NULL, '2025-09-22 10:37:25', '2025-09-22 10:37:25'),
(794, 125, 'Fachada 3A', '/render/render_125_Fachada 3A_1.webp', '/render/render_125_Fachada 3A_2.webp', '/render/render_125_Fachada 3A_3.webp', NULL, '2025-09-22 10:37:51', '2025-09-22 10:37:51'),
(795, 126, 'Fachada 3A', '/render/render_126_Fachada 3A_1.webp', '/render/render_126_Fachada 3A_2.webp', '/render/render_126_Fachada 3A_3.webp', NULL, '2025-09-22 10:38:06', '2025-09-22 10:38:06'),
(796, 127, 'Fachada 3A', NULL, '/render/render_127_Fachada 3A_2.webp', '/render/render_127_Fachada 3A_3.webp', NULL, '2025-09-22 10:38:51', '2025-09-22 10:38:51'),
(797, 128, 'Fachada 3A', NULL, '/render/render_128_Fachada 3A_2.webp', '/render/render_128_Fachada 3A_3.webp', NULL, '2025-09-22 10:39:02', '2025-09-22 10:39:02'),
(798, 129, 'Fachada 3A', NULL, '/render/render_129_Fachada 3A_2.webp', '/render/render_129_Fachada 3A_3.webp', NULL, '2025-09-22 10:39:11', '2025-09-22 10:39:11'),
(799, 130, 'Fachada 3A', NULL, '/render/render_130_Fachada 3A_2.webp', '/render/render_130_Fachada 3A_3.webp', NULL, '2025-09-22 10:39:21', '2025-09-22 10:39:21'),
(800, 131, 'Fachada 3A', NULL, '/render/render_131_Fachada 3A_2.webp', '/render/render_131_Fachada 3A_3.webp', NULL, '2025-09-22 10:39:37', '2025-09-22 10:39:37'),
(801, 132, 'Fachada 3A', NULL, '/render/render_132_Fachada 3A_2.webp', '/render/render_132_Fachada 3A_3.webp', NULL, '2025-09-22 10:39:53', '2025-09-22 10:39:53'),
(802, 133, 'Fachada 3A', NULL, '/render/render_133_Fachada 3A_2.webp', '/render/render_133_Fachada 3A_3.webp', NULL, '2025-09-22 10:40:04', '2025-09-22 10:40:04'),
(803, 111, 'Fachada 3B', '/render/render_111_Fachada 3B_1.webp', '/render/render_111_Fachada 3B_2.webp', '/render/render_111_Fachada 3B_3.webp', '/render/render_111_Fachada 3B_4.webp', '2025-09-22 10:41:08', '2025-09-22 10:41:08'),
(804, 112, 'Fachada 3B', '/render/render_112_Fachada 3B_1.webp', '/render/render_112_Fachada 3B_2.webp', '/render/render_112_Fachada 3B_3.webp', '/render/render_112_Fachada 3B_4.webp', '2025-09-22 10:41:24', '2025-09-22 10:41:24'),
(805, 113, 'Fachada 3B', '/render/render_113_Fachada 3B_1.webp', '/render/render_113_Fachada 3B_2.webp', '/render/render_113_Fachada 3B_3.webp', '/render/render_113_Fachada 3B_4.webp', '2025-09-22 10:41:42', '2025-09-22 10:41:42'),
(806, 114, 'Fachada 3B', '/render/render_114_Fachada 3B_1.webp', '/render/render_114_Fachada 3B_2.webp', '/render/render_114_Fachada 3B_3.webp', '/render/render_114_Fachada 3B_4.webp', '2025-09-22 10:42:02', '2025-09-22 10:42:02'),
(807, 115, 'Fachada 3B', '/render/render_115_Fachada 3B_1.webp', '/render/render_115_Fachada 3B_2.webp', '/render/render_115_Fachada 3B_3.webp', '/render/render_115_Fachada 3B_4.webp', '2025-09-22 10:42:21', '2025-09-22 10:42:21'),
(808, 116, 'Fachada 3B', '/render/render_116_Fachada 3B_1.webp', '/render/render_116_Fachada 3B_2.webp', '/render/render_116_Fachada 3B_3.webp', '/render/render_116_Fachada 3B_4.webp', '2025-09-22 10:42:37', '2025-09-22 10:42:37'),
(809, 117, 'Fachada 3B', '/render/render_117_Fachada 3B_1.webp', '/render/render_117_Fachada 3B_2.webp', '/render/render_117_Fachada 3B_3.webp', '/render/render_117_Fachada 3B_4.webp', '2025-09-22 10:42:57', '2025-09-22 10:42:57'),
(810, 118, 'Fachada 3B', '/render/render_118_Fachada 3B_1.webp', '/render/render_118_Fachada 3B_2.webp', '/render/render_118_Fachada 3B_3.webp', '/render/render_118_Fachada 3B_4.webp', '2025-09-22 10:43:18', '2025-09-22 10:43:18'),
(811, 119, 'Fachada 3B', '/render/render_119_Fachada 3B_1.webp', '/render/render_119_Fachada 3B_2.webp', '/render/render_119_Fachada 3B_3.webp', NULL, '2025-09-22 10:44:36', '2025-09-22 10:44:36'),
(812, 120, 'Fachada 3B', '/render/render_120_Fachada 3B_1.webp', '/render/render_120_Fachada 3B_2.webp', '/render/render_120_Fachada 3B_3.webp', NULL, '2025-09-22 10:44:48', '2025-09-22 10:44:48'),
(813, 121, 'Fachada 3B', '/render/render_121_Fachada 3B_1.webp', '/render/render_121_Fachada 3B_2.webp', '/render/render_121_Fachada 3B_3.webp', NULL, '2025-09-22 10:45:02', '2025-09-22 10:45:02'),
(814, 122, 'Fachada 3B', '/render/render_122_Fachada 3B_1.webp', '/render/render_122_Fachada 3B_2.webp', '/render/render_122_Fachada 3B_3.webp', NULL, '2025-09-22 10:45:25', '2025-09-22 10:45:25'),
(815, 123, 'Fachada 3B', '/render/render_123_Fachada 3B_1.webp', '/render/render_123_Fachada 3B_2.webp', '/render/render_123_Fachada 3B_3.webp', NULL, '2025-09-22 10:45:43', '2025-09-22 10:45:43'),
(816, 124, 'Fachada 3B', '/render/render_124_Fachada 3B_1.webp', '/render/render_124_Fachada 3B_2.webp', '/render/render_124_Fachada 3B_3.webp', NULL, '2025-09-22 10:46:07', '2025-09-22 10:46:07'),
(817, 125, 'Fachada 3B', '/render/render_125_Fachada 3B_1.webp', '/render/render_125_Fachada 3B_2.webp', '/render/render_125_Fachada 3B_3.webp', NULL, '2025-09-22 10:46:27', '2025-09-22 10:46:27'),
(818, 126, 'Fachada 3B', '/render/render_126_Fachada 3B_1.webp', '/render/render_126_Fachada 3B_2.webp', '/render/render_126_Fachada 3B_3.webp', NULL, '2025-09-22 10:46:40', '2025-09-22 10:46:40'),
(819, 127, 'Fachada 3B', '/render/render_127_Fachada 3B_1.webp', NULL, NULL, NULL, '2025-09-22 10:47:16', '2025-09-22 10:47:16'),
(820, 128, 'Fachada 3B', '/render/render_128_Fachada 3B_1.webp', NULL, NULL, NULL, '2025-09-22 10:47:29', '2025-09-22 10:47:29'),
(821, 129, 'Fachada 3B', '/render/render_129_Fachada 3B_1.webp', NULL, NULL, NULL, '2025-09-22 10:47:45', '2025-09-22 10:47:45'),
(822, 130, 'Fachada 3B', '/render/render_130_Fachada 3B_1.webp', NULL, NULL, NULL, '2025-09-22 10:47:55', '2025-09-22 10:47:55'),
(823, 131, 'Fachada 3B', '/render/render_131_Fachada 3B_1.webp', NULL, NULL, NULL, '2025-09-22 10:48:02', '2025-09-22 10:48:02'),
(824, 132, 'Fachada 3B', '/render/render_132_Fachada 3B_1.webp', NULL, NULL, NULL, '2025-09-22 10:48:09', '2025-09-22 10:48:09'),
(825, 133, 'Fachada 3B', '/render/render_133_Fachada 3B_1.webp', NULL, NULL, NULL, '2025-09-22 10:48:16', '2025-09-22 10:48:16'),
(826, 111, 'Fachada 4A', '/render/render_111_Fachada 4A_1.webp', '/render/render_111_Fachada 4A_2.webp', '/render/render_111_Fachada 4A_3.webp', NULL, '2025-09-22 10:49:28', '2025-09-22 10:49:28'),
(827, 112, 'Fachada 4A', '/render/render_112_Fachada 4A_1.webp', '/render/render_112_Fachada 4A_2.webp', '/render/render_112_Fachada 4A_3.webp', NULL, '2025-09-22 10:49:39', '2025-09-22 10:49:39'),
(828, 113, 'Fachada 4A', '/render/render_113_Fachada 4A_1.webp', '/render/render_113_Fachada 4A_2.webp', '/render/render_113_Fachada 4A_3.webp', NULL, '2025-09-22 10:49:50', '2025-09-22 10:49:50'),
(829, 114, 'Fachada 4A', '/render/render_114_Fachada 4A_1.webp', '/render/render_114_Fachada 4A_2.webp', '/render/render_114_Fachada 4A_3.webp', NULL, '2025-09-22 10:50:07', '2025-09-22 10:50:07'),
(830, 115, 'Fachada 4A', '/render/render_115_Fachada 4A_1.webp', '/render/render_115_Fachada 4A_2.webp', '/render/render_115_Fachada 4A_3.webp', NULL, '2025-09-22 10:50:23', '2025-09-22 10:50:23'),
(831, 116, 'Fachada 4A', '/render/render_116_Fachada 4A_1.webp', '/render/render_116_Fachada 4A_2.webp', '/render/render_116_Fachada 4A_3.webp', NULL, '2025-09-22 10:50:39', '2025-09-22 10:50:39'),
(832, 117, 'Fachada 4A', '/render/render_117_Fachada 4A_1.webp', '/render/render_117_Fachada 4A_2.webp', '/render/render_117_Fachada 4A_3.webp', NULL, '2025-09-22 10:50:59', '2025-09-22 10:50:59'),
(833, 118, 'Fachada 4A', '/render/render_118_Fachada 4A_1.webp', '/render/render_118_Fachada 4A_2.webp', '/render/render_118_Fachada 4A_3.webp', NULL, '2025-09-22 10:51:15', '2025-09-22 10:51:15'),
(834, 119, 'Fachada 4A', '/render/render_119_Fachada 4A_1.webp', '/render/render_119_Fachada 4A_2.webp', '/render/render_119_Fachada 4A_3.webp', NULL, '2025-09-22 10:51:56', '2025-09-22 10:51:56'),
(835, 120, 'Fachada 4A', '/render/render_120_Fachada 4A_1.webp', '/render/render_120_Fachada 4A_2.webp', '/render/render_120_Fachada 4A_3.webp', NULL, '2025-09-22 10:52:13', '2025-09-22 10:52:13'),
(836, 121, 'Fachada 4A', '/render/render_121_Fachada 4A_1.webp', '/render/render_121_Fachada 4A_2.webp', '/render/render_121_Fachada 4A_3.webp', NULL, '2025-09-22 10:52:25', '2025-09-22 10:52:25'),
(837, 122, 'Fachada 4A', '/render/render_122_Fachada 4A_1.webp', '/render/render_122_Fachada 4A_2.webp', '/render/render_122_Fachada 4A_3.webp', NULL, '2025-09-22 10:52:38', '2025-09-22 10:52:38'),
(838, 123, 'Fachada 4A', '/render/render_123_Fachada 4A_1.webp', '/render/render_123_Fachada 4A_2.webp', '/render/render_123_Fachada 4A_3.webp', NULL, '2025-09-22 10:52:54', '2025-09-22 10:52:54'),
(839, 124, 'Fachada 4A', '/render/render_124_Fachada 4A_1.webp', '/render/render_124_Fachada 4A_2.webp', '/render/render_124_Fachada 4A_3.webp', NULL, '2025-09-22 10:53:17', '2025-09-22 10:53:17'),
(840, 125, 'Fachada 4A', '/render/render_125_Fachada 4A_1.webp', '/render/render_125_Fachada 4A_2.webp', '/render/render_125_Fachada 4A_3.webp', NULL, '2025-09-22 10:53:29', '2025-09-22 10:53:29'),
(841, 126, 'Fachada 4A', '/render/render_126_Fachada 4A_1.webp', '/render/render_126_Fachada 4A_2.webp', '/render/render_126_Fachada 4A_3.webp', NULL, '2025-09-22 10:53:42', '2025-09-22 10:53:42'),
(842, 127, 'Fachada 4A', '/render/render_127_Fachada 4A_1.webp', NULL, NULL, NULL, '2025-09-22 10:54:11', '2025-09-22 10:54:11'),
(843, 128, 'Fachada 4A', '/render/render_128_Fachada 4A_1.webp', NULL, NULL, NULL, '2025-09-22 10:54:19', '2025-09-22 10:54:19'),
(844, 129, 'Fachada 4A', '/render/render_129_Fachada 4A_1.webp', NULL, NULL, NULL, '2025-09-22 10:54:26', '2025-09-22 10:54:26'),
(845, 130, 'Fachada 4A', '/render/render_130_Fachada 4A_1.webp', NULL, NULL, NULL, '2025-09-22 10:54:31', '2025-09-22 10:54:31'),
(846, 131, 'Fachada 4A', '/render/render_131_Fachada 4A_1.webp', NULL, NULL, NULL, '2025-09-22 10:54:39', '2025-09-22 10:54:39'),
(847, 132, 'Fachada 4A', '/render/render_132_Fachada 4A_1.webp', NULL, NULL, NULL, '2025-09-22 10:54:48', '2025-09-22 10:54:48'),
(848, 133, 'Fachada 4A', '/render/render_133_Fachada 4A_1.webp', NULL, NULL, NULL, '2025-09-22 10:54:53', '2025-09-22 10:54:53');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `product_renders`
--

CREATE TABLE `product_renders` (
  `id` bigint UNSIGNED NOT NULL,
  `product_id` bigint UNSIGNED NOT NULL,
  `image_1` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `image_2` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `image_3` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `image_4` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `image_5` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `image_6` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `image_7` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `image_8` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `image_9` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `product_renders`
--

INSERT INTO `product_renders` (`id`, `product_id`, `image_1`, `image_2`, `image_3`, `image_4`, `image_5`, `image_6`, `image_7`, `image_8`, `image_9`, `created_at`, `updated_at`) VALUES
(5, 3, NULL, NULL, NULL, NULL, '/render/render_3_5.webp', '/render/render_3_6.webp', '/render/render_3_7.webp', '/render/render_3_8.webp', NULL, '2025-08-08 17:25:35', '2025-08-12 13:03:35'),
(6, 58, NULL, NULL, NULL, NULL, '/render/render_58_5.webp', '/render/render_58_6.webp', '/render/render_58_7.webp', '/render/render_58_8.webp', NULL, '2025-08-08 17:33:44', '2025-08-12 12:59:06'),
(7, 59, NULL, NULL, NULL, NULL, '/render/render_59_5.webp', '/render/render_59_6.webp', '/render/render_59_7.webp', '/render/render_59_8.webp', NULL, '2025-08-08 17:34:18', '2025-08-08 19:36:13'),
(8, 60, NULL, NULL, NULL, NULL, '/render/render_60_5.webp', '/render/render_60_6.webp', '/render/render_60_7.webp', '/render/render_60_8.webp', NULL, '2025-08-08 17:34:31', '2025-08-08 19:06:02'),
(9, 31, NULL, NULL, NULL, NULL, '/render/render_31_5.webp', '/render/render_31_6.webp', '/render/render_31_7.webp', NULL, NULL, '2025-08-08 17:38:14', '2025-08-08 19:12:21'),
(10, 32, NULL, NULL, NULL, NULL, '/render/render_32_5.webp', '/render/render_32_6.webp', '/render/render_32_7.webp', NULL, NULL, '2025-08-08 17:38:35', '2025-08-08 19:12:35'),
(11, 28, NULL, NULL, NULL, NULL, '/render/render_28_5.webp', '/render/render_28_6.webp', '/render/render_28_7.webp', NULL, NULL, '2025-08-08 17:38:49', '2025-08-08 19:12:53'),
(12, 30, NULL, NULL, NULL, NULL, '/render/render_30_5.webp', '/render/render_30_6.webp', '/render/render_30_7.webp', NULL, NULL, '2025-08-08 17:39:01', '2025-08-08 19:13:07'),
(13, 29, NULL, NULL, NULL, NULL, '/render/render_29_5.webp', '/render/render_29_6.webp', '/render/render_29_7.webp', NULL, NULL, '2025-08-08 17:39:16', '2025-08-08 19:13:18'),
(14, 26, NULL, NULL, NULL, NULL, '/render/render_26_5.webp', '/render/render_26_6.webp', '/render/render_26_7.webp', '/render/render_26_8.webp', NULL, '2025-08-08 17:42:30', '2025-08-08 19:14:50'),
(15, 27, NULL, NULL, NULL, NULL, '/render/render_27_5.webp', '/render/render_27_6.webp', '/render/render_27_7.webp', '/render/render_27_8.webp', NULL, '2025-08-08 17:42:42', '2025-09-19 08:19:54'),
(16, 23, NULL, NULL, NULL, NULL, '/render/render_23_5.webp', '/render/render_23_6.webp', '/render/render_23_7.webp', '/render/render_23_8.webp', NULL, '2025-08-08 17:42:54', '2025-09-19 08:15:56'),
(17, 25, NULL, NULL, NULL, NULL, '/render/render_25_5.webp', '/render/render_25_6.webp', '/render/render_25_7.webp', '/render/render_25_8.webp', NULL, '2025-08-08 17:43:11', '2025-09-19 08:19:13'),
(18, 24, NULL, NULL, NULL, NULL, '/render/render_24_5.webp', '/render/render_24_6.webp', '/render/render_24_7.webp', '/render/render_24_8.webp', NULL, '2025-08-08 17:43:22', '2025-09-19 08:16:23'),
(19, 4, NULL, NULL, NULL, NULL, '/render/render_4_5.webp', '/render/render_4_6.webp', '/render/render_4_7.webp', '/render/render_4_8.webp', NULL, '2025-08-08 17:46:17', '2025-08-12 13:03:43'),
(20, 5, NULL, NULL, NULL, NULL, '/render/render_5_5.webp', '/render/render_5_6.webp', '/render/render_5_7.webp', '/render/render_5_8.webp', NULL, '2025-08-08 17:46:29', '2025-08-12 13:03:51'),
(21, 6, NULL, NULL, NULL, NULL, '/render/render_6_5.webp', '/render/render_6_6.webp', '/render/render_6_7.webp', '/render/render_6_8.webp', NULL, '2025-08-08 17:46:41', '2025-08-12 13:04:01'),
(22, 7, NULL, NULL, NULL, NULL, '/render/render_7_5.webp', '/render/render_7_6.webp', '/render/render_7_7.webp', '/render/render_7_8.webp', NULL, '2025-08-08 17:46:52', '2025-08-12 13:04:14'),
(23, 8, NULL, NULL, NULL, NULL, '/render/render_8_5.png', '/render/render_8_6.png', '/render/render_8_7.png', '/render/render_8_8.png', NULL, '2025-08-08 17:47:02', '2025-09-14 07:05:27'),
(24, 51, NULL, NULL, NULL, NULL, '/render/render_51_5.webp', '/render/render_51_6.webp', '/render/render_51_7.webp', '/render/render_51_8.webp', NULL, '2025-08-08 17:48:32', '2025-08-12 13:05:31'),
(25, 52, NULL, NULL, NULL, NULL, '/render/render_52_5.webp', '/render/render_52_6.webp', '/render/render_52_7.webp', '/render/render_52_8.webp', NULL, '2025-08-08 17:48:43', '2025-08-12 13:05:40'),
(26, 53, NULL, NULL, NULL, NULL, '/render/render_53_5.webp', '/render/render_53_6.webp', '/render/render_53_7.webp', '/render/render_53_8.webp', NULL, '2025-08-08 17:48:52', '2025-08-12 13:06:18'),
(27, 54, NULL, NULL, NULL, NULL, '/render/render_54_5.webp', '/render/render_54_6.webp', '/render/render_54_7.webp', '/render/render_54_8.webp', NULL, '2025-08-08 17:49:25', '2025-08-12 13:06:51'),
(28, 55, NULL, NULL, NULL, NULL, '/render/render_55_5.webp', '/render/render_55_6.webp', '/render/render_55_7.webp', '/render/render_55_8.webp', NULL, '2025-08-08 17:49:36', '2025-08-12 13:06:59'),
(29, 56, NULL, NULL, NULL, NULL, '/render/render_56_5.webp', '/render/render_56_6.webp', '/render/render_56_7.webp', '/render/render_56_8.webp', NULL, '2025-08-08 17:50:04', '2025-08-08 19:20:26'),
(30, 57, NULL, NULL, NULL, NULL, '/render/render_57_5.webp', '/render/render_57_6.webp', '/render/render_57_7.webp', '/render/render_57_8.webp', NULL, '2025-08-08 17:50:14', '2025-08-12 13:07:18'),
(31, 74, NULL, NULL, NULL, NULL, NULL, NULL, '/render/render_74_7.webp', NULL, NULL, '2025-08-08 18:03:38', '2025-08-08 18:03:38'),
(32, 75, NULL, NULL, NULL, NULL, NULL, NULL, '/render/render_75_7.webp', NULL, NULL, '2025-08-08 18:19:49', '2025-08-08 18:19:49'),
(33, 76, NULL, NULL, NULL, NULL, NULL, NULL, '/render/render_76_7.webp', NULL, NULL, '2025-08-08 18:20:03', '2025-08-08 18:20:03'),
(34, 71, NULL, NULL, NULL, NULL, NULL, '/render/render_71_6.webp', '/render/render_71_7.webp', '/render/render_71_8.webp', NULL, '2025-08-08 18:20:55', '2025-08-12 12:55:40'),
(35, 72, NULL, NULL, NULL, NULL, NULL, '/render/render_72_6.webp', '/render/render_72_7.webp', '/render/render_72_8.webp', NULL, '2025-08-08 18:21:08', '2025-08-12 12:58:31'),
(36, 73, NULL, NULL, NULL, NULL, NULL, '/render/render_73_6.webp', '/render/render_73_7.webp', '/render/render_73_8.webp', NULL, '2025-08-08 18:21:17', '2025-08-12 12:58:41'),
(37, 61, NULL, NULL, NULL, NULL, NULL, '/render/render_61_6.webp', '/render/render_61_7.webp', '/render/render_61_8.webp', NULL, '2025-08-08 18:33:08', '2025-08-12 12:59:56'),
(38, 62, NULL, NULL, NULL, NULL, NULL, '/render/render_62_6.webp', '/render/render_62_7.webp', '/render/render_62_8.webp', NULL, '2025-08-08 18:33:19', '2025-08-12 13:00:08'),
(39, 63, NULL, NULL, NULL, NULL, NULL, '/render/render_63_6.webp', '/render/render_63_7.webp', '/render/render_63_8.webp', NULL, '2025-08-08 18:33:31', '2025-08-12 13:00:17'),
(40, 64, NULL, NULL, NULL, NULL, NULL, '/render/render_64_6.webp', '/render/render_64_7.webp', '/render/render_64_8.webp', NULL, '2025-08-08 18:33:45', '2025-08-12 13:00:26'),
(41, 16, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '/render/render_16_8.webp', NULL, '2025-08-08 19:08:07', '2025-08-12 10:45:30'),
(42, 17, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '/render/render_17_8.webp', NULL, '2025-08-08 19:08:22', '2025-08-12 10:45:44'),
(43, 18, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '/render/render_18_8.webp', NULL, '2025-08-08 19:08:32', '2025-08-12 10:45:57'),
(44, 13, NULL, NULL, NULL, NULL, NULL, '/render/render_13_6.webp', NULL, NULL, NULL, '2025-08-08 19:10:41', '2025-08-08 19:10:41'),
(45, 14, NULL, NULL, NULL, NULL, '/render/render_14_5.webp', '/render/render_14_6.webp', NULL, NULL, NULL, '2025-08-08 19:10:56', '2025-08-08 19:24:37'),
(46, 15, NULL, NULL, NULL, NULL, NULL, '/render/render_15_6.webp', NULL, NULL, NULL, '2025-08-08 19:11:06', '2025-08-08 19:11:06'),
(47, 65, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '/render/render_65_8.webp', NULL, '2025-08-12 12:51:44', '2025-08-12 12:51:44'),
(48, 66, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '/render/render_66_8.webp', NULL, '2025-08-12 12:51:59', '2025-08-12 12:51:59'),
(49, 67, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '/render/render_67_8.webp', NULL, '2025-08-12 12:52:08', '2025-08-12 12:52:08'),
(50, 19, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '/render/render_19_8.webp', NULL, '2025-08-12 13:02:06', '2025-08-12 13:02:06'),
(51, 20, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '/render/render_20_8.webp', NULL, '2025-08-12 13:02:14', '2025-08-12 13:02:14'),
(52, 21, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '/render/render_21_8.webp', NULL, '2025-08-12 13:02:23', '2025-08-12 13:02:23'),
(53, 22, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '/render/render_22_8.webp', NULL, '2025-08-12 13:02:30', '2025-08-12 13:02:30'),
(54, 9, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '/render/render_9_8.webp', NULL, '2025-08-12 13:04:40', '2025-08-12 13:04:40'),
(55, 10, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '/render/render_10_8.webp', NULL, '2025-08-12 13:04:51', '2025-08-12 13:04:51'),
(56, 11, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '/render/render_11_8.webp', NULL, '2025-08-12 13:04:58', '2025-08-12 13:04:58'),
(57, 12, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '/render/render_12_8.webp', NULL, '2025-08-12 13:05:05', '2025-08-12 13:05:05'),
(58, 155, NULL, NULL, NULL, NULL, '/render/render_155_5.webp', '/render/render_155_6.webp', '/render/render_155_7.webp', '/render/render_155_8.png', NULL, '2025-08-26 20:42:31', '2025-08-26 20:42:31'),
(59, 156, NULL, NULL, NULL, NULL, '/render/render_156_5.webp', '/render/render_156_6.webp', '/render/render_156_7.webp', '/render/render_156_8.png', NULL, '2025-08-26 20:44:04', '2025-08-26 20:44:04'),
(60, 157, NULL, NULL, NULL, NULL, '/render/render_157_5.webp', '/render/render_157_6.webp', '/render/render_157_7.webp', '/render/render_157_8.png', NULL, '2025-08-26 20:44:43', '2025-08-26 20:44:43'),
(61, 158, NULL, NULL, NULL, NULL, '/render/render_158_5.webp', '/render/render_158_6.webp', '/render/render_158_7.webp', '/render/render_158_8.png', NULL, '2025-08-26 20:45:14', '2025-08-26 20:45:14'),
(62, 159, NULL, NULL, NULL, NULL, '/render/render_159_5.webp', '/render/render_159_6.webp', '/render/render_159_7.webp', '/render/render_159_8.png', NULL, '2025-08-26 20:46:18', '2025-08-26 20:46:18'),
(63, 160, NULL, NULL, NULL, NULL, '/render/render_160_5.webp', '/render/render_160_6.webp', '/render/render_160_7.webp', '/render/render_160_8.png', NULL, '2025-08-26 20:47:48', '2025-08-26 20:47:48'),
(64, 198, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2025-08-26 20:55:27', '2025-08-26 20:55:27'),
(65, 161, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '/render/render_161_8.webp', NULL, '2025-09-10 10:21:01', '2025-09-10 10:21:01'),
(66, 162, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '/render/render_162_8.webp', NULL, '2025-09-10 10:21:19', '2025-09-10 10:21:19'),
(67, 163, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '/render/render_163_8.webp', NULL, '2025-09-10 10:21:25', '2025-09-10 10:21:25'),
(68, 164, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '/render/render_164_8.webp', NULL, '2025-09-10 10:21:34', '2025-09-10 10:21:34'),
(69, 165, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '/render/render_165_8.webp', NULL, '2025-09-10 10:21:40', '2025-09-10 10:21:40'),
(70, 166, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '/render/render_166_8.webp', NULL, '2025-09-10 10:21:47', '2025-09-10 10:21:47'),
(71, 167, NULL, NULL, NULL, NULL, NULL, '/render/render_167_6.webp', NULL, NULL, NULL, '2025-09-10 10:23:48', '2025-09-10 10:23:48'),
(72, 168, NULL, NULL, NULL, NULL, NULL, '/render/render_168_6.webp', NULL, NULL, NULL, '2025-09-10 10:24:06', '2025-09-10 10:24:06'),
(73, 169, NULL, NULL, NULL, NULL, NULL, '/render/render_169_6.webp', NULL, NULL, NULL, '2025-09-10 10:24:14', '2025-09-10 10:24:14'),
(74, 170, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '/render/render_170_8.webp', NULL, '2025-09-10 10:25:16', '2025-09-10 10:25:16'),
(75, 171, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '/render/render_171_8.webp', NULL, '2025-09-10 10:25:22', '2025-09-10 10:25:22'),
(76, 172, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '/render/render_172_8.webp', NULL, '2025-09-10 10:25:29', '2025-09-10 10:25:29'),
(77, 173, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '/render/render_173_8.webp', NULL, '2025-09-10 10:27:06', '2025-09-10 10:27:06'),
(78, 174, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '/render/render_174_8.webp', NULL, '2025-09-10 10:27:15', '2025-09-10 10:27:15'),
(79, 175, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '/render/render_175_8.webp', NULL, '2025-09-10 10:27:22', '2025-09-10 10:27:22'),
(80, 176, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '/render/render_176_8.webp', NULL, '2025-09-10 10:27:28', '2025-09-10 10:27:28'),
(81, 177, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '/render/render_177_8.webp', NULL, '2025-09-10 10:27:34', '2025-09-10 10:27:34'),
(82, 178, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '/render/render_178_8.webp', NULL, '2025-09-10 10:27:44', '2025-09-10 10:27:44'),
(83, 179, NULL, NULL, NULL, NULL, '/render/render_179_5.webp', '/render/render_179_6.webp', '/render/render_179_7.webp', '/render/render_179_8.webp', NULL, '2025-09-10 10:28:59', '2025-09-10 11:43:45'),
(84, 180, NULL, NULL, NULL, NULL, '/render/render_180_5.webp', '/render/render_180_6.webp', '/render/render_180_7.webp', '/render/render_180_8.webp', NULL, '2025-09-10 10:29:06', '2025-09-10 11:43:51'),
(85, 181, NULL, NULL, NULL, NULL, '/render/render_181_5.webp', '/render/render_181_6.webp', '/render/render_181_7.webp', '/render/render_181_8.webp', NULL, '2025-09-10 10:29:12', '2025-09-10 11:43:58'),
(86, 182, NULL, NULL, NULL, NULL, '/render/render_182_5.webp', '/render/render_182_6.webp', '/render/render_182_7.webp', '/render/render_182_8.webp', NULL, '2025-09-10 10:29:18', '2025-09-10 11:44:05'),
(87, 183, NULL, NULL, NULL, NULL, '/render/render_183_5.webp', '/render/render_183_6.webp', '/render/render_183_7.webp', '/render/render_183_8.webp', NULL, '2025-09-10 10:29:23', '2025-09-10 11:44:11'),
(88, 240, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '/render/render_240_8.webp', NULL, '2025-09-10 10:30:33', '2025-09-10 10:30:33'),
(89, 241, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '/render/render_241_8.webp', NULL, '2025-09-10 10:30:41', '2025-09-10 10:30:41'),
(90, 242, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '/render/render_242_8.webp', NULL, '2025-09-10 10:30:47', '2025-09-10 10:30:47'),
(91, 246, NULL, NULL, NULL, NULL, NULL, '/render/render_246_6.webp', '/render/render_246_7.webp', '/render/render_246_8.webp', NULL, '2025-09-10 10:32:07', '2025-09-10 11:35:12'),
(92, 247, NULL, NULL, NULL, NULL, NULL, '/render/render_247_6.webp', '/render/render_247_7.webp', '/render/render_247_8.webp', NULL, '2025-09-10 10:32:15', '2025-09-10 11:35:22'),
(93, 248, NULL, NULL, NULL, NULL, NULL, '/render/render_248_6.webp', '/render/render_248_7.webp', '/render/render_248_8.webp', NULL, '2025-09-10 10:32:21', '2025-09-10 11:35:29'),
(94, 232, NULL, NULL, NULL, NULL, '/render/render_232_5.webp', '/render/render_232_6.webp', '/render/render_232_7.webp', '/render/render_232_8.webp', NULL, '2025-09-10 10:33:12', '2025-09-10 11:38:09'),
(95, 233, NULL, NULL, NULL, NULL, '/render/render_233_5.webp', '/render/render_233_6.webp', '/render/render_233_7.webp', '/render/render_233_8.webp', NULL, '2025-09-10 10:33:19', '2025-09-10 11:38:19'),
(96, 234, NULL, NULL, NULL, NULL, '/render/render_235_5.webp', '/render/render_234_6.webp', '/render/render_234_7.webp', '/render/render_234_8.webp', NULL, '2025-09-10 10:33:24', '2025-09-10 11:38:26'),
(97, 235, NULL, NULL, NULL, NULL, '/render/render_234_5.webp', '/render/render_235_6.webp', '/render/render_235_7.webp', '/render/render_235_8.webp', NULL, '2025-09-10 10:33:32', '2025-09-10 11:38:33'),
(98, 252, NULL, NULL, NULL, NULL, NULL, '/render/render_252_6.webp', '/render/render_252_7.webp', '/render/render_252_8.webp', NULL, '2025-09-10 10:48:25', '2025-09-10 11:39:26'),
(99, 253, NULL, NULL, NULL, NULL, NULL, '/render/render_253_6.webp', '/render/render_253_7.webp', '/render/render_253_8.webp', NULL, '2025-09-10 10:48:35', '2025-09-10 11:39:33'),
(100, 254, NULL, NULL, NULL, NULL, NULL, '/render/render_254_6.webp', '/render/render_254_7.webp', '/render/render_254_8.webp', NULL, '2025-09-10 10:48:42', '2025-09-10 11:39:40'),
(101, 255, NULL, NULL, NULL, NULL, NULL, '/render/render_255_6.webp', '/render/render_255_7.webp', '/render/render_255_8.webp', NULL, '2025-09-10 10:48:48', '2025-09-10 11:39:46'),
(102, 226, NULL, NULL, NULL, NULL, '/render/render_226_5.webp', '/render/render_226_6.webp', '/render/render_226_7.webp', '/render/render_226_8.webp', NULL, '2025-09-10 10:52:06', '2025-09-10 11:48:04'),
(103, 227, NULL, NULL, NULL, NULL, '/render/render_227_5.webp', '/render/render_227_6.webp', '/render/render_227_7.webp', '/render/render_227_8.webp', NULL, '2025-09-10 10:52:13', '2025-09-10 11:48:15'),
(104, 228, NULL, NULL, NULL, NULL, '/render/render_228_5.webp', '/render/render_228_6.webp', '/render/render_228_7.webp', '/render/render_228_8.webp', NULL, '2025-09-10 10:52:18', '2025-09-10 11:48:21'),
(105, 229, NULL, NULL, NULL, NULL, '/render/render_229_5.webp', '/render/render_229_6.webp', '/render/render_229_7.webp', '/render/render_229_8.webp', NULL, '2025-09-10 10:53:30', '2025-09-10 11:50:46'),
(106, 230, NULL, NULL, NULL, NULL, '/render/render_230_5.webp', '/render/render_230_6.webp', '/render/render_230_7.webp', '/render/render_230_8.webp', NULL, '2025-09-10 10:53:40', '2025-09-10 11:50:53'),
(107, 231, NULL, NULL, NULL, NULL, '/render/render_231_5.webp', '/render/render_231_6.webp', '/render/render_231_7.webp', '/render/render_231_8.webp', NULL, '2025-09-10 10:53:49', '2025-09-10 11:51:01'),
(108, 184, NULL, NULL, NULL, NULL, '/render/render_184_5.webp', '/render/render_184_6.webp', '/render/render_184_7.webp', NULL, NULL, '2025-09-10 11:04:29', '2025-09-10 11:40:52'),
(109, 185, NULL, NULL, NULL, NULL, '/render/render_185_5.webp', '/render/render_185_6.webp', '/render/render_185_7.webp', NULL, NULL, '2025-09-10 11:04:36', '2025-09-10 11:40:59'),
(110, 186, NULL, NULL, NULL, NULL, '/render/render_186_5.webp', '/render/render_186_6.webp', '/render/render_186_7.webp', NULL, NULL, '2025-09-10 11:04:43', '2025-09-10 11:41:07'),
(111, 187, NULL, NULL, NULL, NULL, '/render/render_187_5.webp', '/render/render_187_6.webp', '/render/render_187_7.webp', NULL, NULL, '2025-09-10 11:04:49', '2025-09-10 11:41:13'),
(112, 188, NULL, NULL, NULL, NULL, '/render/render_188_5.webp', '/render/render_188_6.webp', '/render/render_188_7.webp', NULL, NULL, '2025-09-10 11:04:58', '2025-09-10 11:41:21'),
(113, 189, NULL, NULL, NULL, NULL, '/render/render_189_5.webp', '/render/render_189_6.webp', '/render/render_189_7.webp', NULL, NULL, '2025-09-10 11:05:04', '2025-09-10 11:41:28'),
(114, 190, NULL, NULL, NULL, NULL, '/render/render_190_5.webp', '/render/render_190_6.webp', '/render/render_190_7.webp', NULL, NULL, '2025-09-10 11:05:11', '2025-09-10 11:41:37'),
(115, 191, NULL, NULL, NULL, NULL, '/render/render_191_5.webp', '/render/render_191_6.webp', '/render/render_191_7.webp', NULL, NULL, '2025-09-10 11:05:20', '2025-09-10 11:41:45'),
(116, 192, NULL, NULL, NULL, NULL, '/render/render_192_5.webp', '/render/render_192_6.webp', '/render/render_192_7.webp', NULL, NULL, '2025-09-10 11:05:28', '2025-09-10 11:41:53'),
(117, 193, NULL, NULL, NULL, NULL, '/render/render_193_5.webp', '/render/render_193_6.webp', '/render/render_193_7.webp', NULL, NULL, '2025-09-10 11:05:36', '2025-09-10 11:42:01'),
(118, 194, NULL, NULL, NULL, NULL, '/render/render_194_5.webp', '/render/render_194_6.webp', '/render/render_194_7.webp', NULL, NULL, '2025-09-10 11:05:47', '2025-09-10 11:42:09'),
(119, 195, NULL, NULL, NULL, NULL, '/render/render_195_5.webp', '/render/render_195_6.webp', '/render/render_195_7.webp', NULL, NULL, '2025-09-10 11:05:56', '2025-09-10 11:42:21'),
(120, 196, NULL, NULL, NULL, NULL, '/render/render_196_5.webp', '/render/render_196_6.webp', '/render/render_196_7.webp', NULL, NULL, '2025-09-10 11:06:04', '2025-09-10 11:42:31'),
(121, 197, NULL, NULL, NULL, NULL, '/render/render_197_5.webp', '/render/render_197_6.webp', '/render/render_197_7.webp', NULL, NULL, '2025-09-10 11:06:12', '2025-09-10 11:42:39'),
(122, 35, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2025-09-11 10:16:42', '2025-09-11 10:16:42'),
(123, 36, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2025-09-11 10:17:56', '2025-09-11 10:17:56'),
(124, 139, NULL, NULL, NULL, NULL, '/render/render_139_5.webp', '/render/render_139_6.webp', '/render/render_139_7.webp', '/render/render_139_8.webp', NULL, '2025-09-12 09:19:59', '2025-09-12 10:57:10'),
(125, 140, NULL, NULL, NULL, NULL, '/render/render_140_5.webp', '/render/render_140_6.webp', '/render/render_140_7.webp', '/render/render_140_8.webp', NULL, '2025-09-12 09:20:19', '2025-09-12 10:57:16'),
(126, 141, NULL, NULL, NULL, NULL, '/render/render_141_5.webp', '/render/render_141_6.webp', '/render/render_141_7.webp', '/render/render_141_8.webp', NULL, '2025-09-12 09:20:41', '2025-09-12 10:57:22'),
(127, 104, NULL, NULL, NULL, NULL, '/render/render_104_5.webp', '/render/render_104_6.webp', '/render/render_104_7.webp', NULL, NULL, '2025-09-12 09:28:18', '2025-09-12 10:44:04'),
(128, 105, NULL, NULL, NULL, NULL, '/render/render_105_5.webp', '/render/render_105_6.webp', '/render/render_105_7.webp', NULL, NULL, '2025-09-12 09:29:47', '2025-09-12 10:44:22'),
(129, 106, NULL, NULL, NULL, NULL, '/render/render_106_5.webp', '/render/render_106_6.webp', '/render/render_106_7.webp', NULL, NULL, '2025-09-12 09:30:11', '2025-09-12 10:44:58'),
(130, 107, NULL, NULL, NULL, NULL, '/render/render_107_5.webp', '/render/render_107_6.webp', '/render/render_107_7.webp', NULL, NULL, '2025-09-12 09:30:51', '2025-09-12 10:45:19'),
(131, 108, NULL, NULL, NULL, NULL, '/render/render_108_5.webp', '/render/render_108_6.webp', '/render/render_108_7.webp', NULL, NULL, '2025-09-12 09:31:18', '2025-09-12 10:45:43'),
(132, 109, NULL, NULL, NULL, NULL, '/render/render_109_5.webp', '/render/render_109_6.webp', '/render/render_109_7.webp', NULL, NULL, '2025-09-12 09:31:32', '2025-09-12 10:46:25'),
(133, 110, NULL, NULL, NULL, NULL, '/render/render_110_5.webp', '/render/render_110_6.webp', '/render/render_110_7.webp', NULL, NULL, '2025-09-12 09:31:50', '2025-09-12 10:46:39'),
(134, 97, NULL, NULL, NULL, NULL, '/render/render_97_5.webp', '/render/render_97_6.webp', '/render/render_97_7.webp', '/render/render_97_8.webp', NULL, '2025-09-12 09:34:08', '2025-09-12 10:58:43'),
(135, 98, NULL, NULL, NULL, NULL, '/render/render_98_5.webp', '/render/render_98_6.webp', '/render/render_98_7.webp', '/render/render_98_8.webp', NULL, '2025-09-12 09:35:01', '2025-09-12 10:58:49'),
(136, 99, NULL, NULL, NULL, NULL, '/render/render_99_5.webp', '/render/render_99_6.webp', '/render/render_99_7.webp', '/render/render_99_8.webp', NULL, '2025-09-12 09:35:22', '2025-09-12 10:58:55'),
(137, 100, NULL, NULL, NULL, NULL, '/render/render_100_5.webp', '/render/render_100_6.webp', '/render/render_100_7.webp', '/render/render_100_8.webp', NULL, '2025-09-12 09:35:36', '2025-09-12 10:59:02'),
(138, 101, NULL, NULL, NULL, NULL, '/render/render_101_5.webp', '/render/render_101_6.webp', '/render/render_101_7.webp', '/render/render_101_8.webp', NULL, '2025-09-12 09:35:52', '2025-09-12 10:59:08'),
(139, 102, NULL, NULL, NULL, NULL, '/render/render_102_5.webp', '/render/render_102_6.webp', '/render/render_102_7.webp', '/render/render_102_8.webp', NULL, '2025-09-12 09:36:09', '2025-09-12 10:59:15'),
(140, 103, NULL, NULL, NULL, NULL, '/render/render_103_5.webp', '/render/render_103_6.webp', '/render/render_103_7.webp', '/render/render_103_8.webp', NULL, '2025-09-12 09:36:26', '2025-09-12 10:59:25'),
(141, 77, NULL, NULL, NULL, NULL, '/render/render_77_5.webp', '/render/render_77_6.webp', '/render/render_77_7.webp', '/render/render_77_8.webp', NULL, '2025-09-12 09:38:06', '2025-09-12 11:00:36'),
(142, 78, NULL, NULL, NULL, NULL, '/render/render_78_5.webp', '/render/render_78_6.webp', '/render/render_78_7.webp', '/render/render_78_8.webp', NULL, '2025-09-12 09:38:33', '2025-09-12 11:00:46'),
(143, 79, NULL, NULL, NULL, NULL, '/render/render_79_5.webp', '/render/render_79_6.webp', '/render/render_79_7.webp', '/render/render_79_8.webp', NULL, '2025-09-12 09:38:57', '2025-09-12 11:00:53'),
(144, 80, NULL, NULL, NULL, NULL, '/render/render_80_5.webp', '/render/render_80_6.webp', '/render/render_80_7.webp', '/render/render_80_8.webp', NULL, '2025-09-12 09:40:47', '2025-09-12 11:01:00'),
(145, 81, NULL, NULL, NULL, NULL, '/render/render_81_5.webp', '/render/render_81_6.webp', '/render/render_81_7.webp', '/render/render_81_8.webp', NULL, '2025-09-12 09:41:04', '2025-09-12 11:01:13'),
(146, 82, NULL, NULL, NULL, NULL, '/render/render_82_5.webp', '/render/render_82_6.webp', '/render/render_82_7.webp', '/render/render_82_8.webp', NULL, '2025-09-12 09:41:22', '2025-09-12 11:01:20'),
(147, 134, NULL, NULL, NULL, NULL, '/render/render_134_5.webp', '/render/render_134_6.webp', '/render/render_134_7.webp', '/render/render_134_8.webp', NULL, '2025-09-12 09:43:19', '2025-09-12 11:02:11'),
(148, 135, NULL, NULL, NULL, NULL, '/render/render_135_5.webp', '/render/render_135_6.webp', '/render/render_135_7.webp', '/render/render_135_8.webp', NULL, '2025-09-12 09:43:36', '2025-09-12 11:02:18'),
(149, 136, NULL, NULL, NULL, NULL, '/render/render_136_5.webp', '/render/render_136_6.webp', '/render/render_136_7.webp', '/render/render_136_8.webp', NULL, '2025-09-12 09:43:52', '2025-09-12 11:02:23'),
(150, 137, NULL, NULL, NULL, NULL, '/render/render_137_5.webp', '/render/render_137_6.webp', '/render/render_137_7.webp', '/render/render_137_8.webp', NULL, '2025-09-12 09:46:08', '2025-09-12 11:02:41'),
(151, 138, NULL, NULL, NULL, NULL, '/render/render_138_5.webp', '/render/render_138_6.webp', '/render/render_138_7.webp', '/render/render_138_8.webp', NULL, '2025-09-12 09:46:24', '2025-09-12 11:02:51'),
(152, 152, NULL, NULL, NULL, NULL, NULL, NULL, '/render/render_152_7.webp', '/render/render_152_8.webp', NULL, '2025-09-12 09:52:27', '2025-09-12 10:56:39'),
(153, 153, NULL, NULL, NULL, NULL, NULL, '/render/render_153_6.webp', '/render/render_153_7.webp', '/render/render_153_8.webp', NULL, '2025-09-12 09:54:21', '2025-09-12 10:56:45'),
(154, 154, NULL, NULL, NULL, NULL, NULL, '/render/render_154_6.webp', '/render/render_154_7.webp', '/render/render_154_8.webp', NULL, '2025-09-12 09:57:24', '2025-09-12 10:56:50'),
(155, 146, NULL, NULL, NULL, NULL, NULL, '/render/render_146_6.webp', NULL, '/render/render_146_8.webp', NULL, '2025-09-12 10:03:43', '2025-09-12 10:55:50'),
(156, 87, NULL, NULL, NULL, NULL, NULL, '/render/render_87_6.webp', NULL, NULL, NULL, '2025-09-12 10:06:14', '2025-09-12 10:06:14'),
(157, 88, NULL, NULL, NULL, NULL, NULL, '/render/render_88_6.webp', NULL, NULL, NULL, '2025-09-12 10:06:43', '2025-09-12 10:06:43'),
(158, 89, NULL, NULL, NULL, NULL, NULL, '/render/render_89_6.webp', NULL, NULL, NULL, '2025-09-12 10:07:01', '2025-09-12 10:07:01'),
(159, 142, NULL, NULL, NULL, NULL, NULL, '/render/render_142_6.webp', '/render/render_142_7.webp', '/render/render_142_8.webp', NULL, '2025-09-12 10:11:47', '2025-09-12 10:57:37'),
(160, 143, NULL, NULL, NULL, NULL, NULL, '/render/render_143_6.webp', '/render/render_143_7.webp', '/render/render_143_8.webp', NULL, '2025-09-12 10:12:08', '2025-09-12 10:57:43'),
(161, 144, NULL, NULL, NULL, NULL, NULL, '/render/render_144_6.webp', '/render/render_144_7.webp', '/render/render_144_8.webp', NULL, '2025-09-12 10:13:05', '2025-09-12 10:57:49'),
(162, 145, NULL, NULL, NULL, NULL, NULL, '/render/render_145_6.webp', '/render/render_145_7.webp', '/render/render_145_8.webp', NULL, '2025-09-12 10:13:20', '2025-09-12 10:57:54'),
(163, 147, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '/render/render_147_8.webp', NULL, '2025-09-12 10:55:56', '2025-09-12 10:55:56'),
(164, 148, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '/render/render_148_8.webp', NULL, '2025-09-12 10:56:03', '2025-09-12 10:56:03'),
(165, 90, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '/render/render_90_8.webp', NULL, '2025-09-12 10:58:11', '2025-09-12 10:58:11'),
(166, 91, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '/render/render_91_8.webp', NULL, '2025-09-12 10:58:16', '2025-09-12 10:58:16'),
(167, 92, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '/render/render_92_8.webp', NULL, '2025-09-12 10:58:21', '2025-09-12 10:58:21'),
(168, 93, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '/render/render_93_8.webp', NULL, '2025-09-12 10:59:43', '2025-09-12 10:59:43'),
(169, 94, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '/render/render_94_8.webp', NULL, '2025-09-12 10:59:56', '2025-09-12 10:59:56'),
(170, 95, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '/render/render_95_8.webp', NULL, '2025-09-12 11:00:01', '2025-09-12 11:00:01'),
(171, 96, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '/render/render_96_8.webp', NULL, '2025-09-12 11:00:07', '2025-09-12 11:00:07'),
(172, 83, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '/render/render_83_8.webp', NULL, '2025-09-12 11:01:38', '2025-09-12 11:01:38'),
(173, 84, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '/render/render_84_8.webp', NULL, '2025-09-12 11:01:44', '2025-09-12 11:01:44'),
(174, 85, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '/render/render_85_8.webp', NULL, '2025-09-12 11:01:50', '2025-09-12 11:01:50'),
(175, 86, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '/render/render_86_8.webp', NULL, '2025-09-12 11:01:56', '2025-09-12 11:01:56');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `sessions`
--

CREATE TABLE `sessions` (
  `id` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` bigint UNSIGNED DEFAULT NULL,
  `ip_address` varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `user_agent` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `payload` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `last_activity` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `sessions`
--

INSERT INTO `sessions` (`id`, `user_id`, `ip_address`, `user_agent`, `payload`, `last_activity`) VALUES
('4O8GjFLtwaess1ACBTlRP3F3XF2S3mXhYslKsFVz', NULL, '189.235.105.99', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/140.0.0.0 Safari/537.36 Edg/140.0.0.0', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiRHdiUkc5Uk9FbHFSNmtUMkFHVzlYYjE2d3VkQ3FCaE12NUI4aFNyNSI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MzE6Imh0dHBzOi8vdW9uZHIuYmVza2FyLm14L3Jlc3VtZW4iO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19', 1758598269),
('K4hOd1ZEj7201BKcEOVR6iIeRxKUN0LFv8FGkhgt', NULL, '189.172.242.141', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/140.0.0.0 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoidG5wWjJleDJ2VVpjeGJEVEtUSnBrRTQ1NEdxVVF4ZngyTm1sYUFYVCI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjM6Imh0dHBzOi8vdW9uZHIuYmVza2FyLm14Ijt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1758575459),
('MYJn1Kom4z8HRAAWTmvCkb47eC8HbNV7i21vjgeo', NULL, '189.172.135.110', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/139.0.0.0 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiWktqODZ6dktRQ2dPMDNvemZ2aVVGaTZ5cHNQYjNGUVAxVGNEV3Z3ViI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MzE6Imh0dHBzOi8vdW9uZHIuYmVza2FyLm14L3Jlc3VtZW4iO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19', 1758656757),
('niDzMeFgLBaiQ7IccYOQ1x5B79dp3bHzmZ1GPyO6', NULL, '189.235.105.99', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/140.0.0.0 Safari/537.36 Edg/140.0.0.0', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoicnlxV3RSc24zODEwVGtISjUwSFVpNlJqYU1hd09CWlBGSTVxU1ZTSyI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjM6Imh0dHBzOi8vdW9uZHIuYmVza2FyLm14Ijt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1758607358),
('OfeQulaJKd5CvjBV5FTlWDT9LD4AFUqTTV0Zy85A', NULL, '129.222.201.85', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/139.0.0.0 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoidGZYbmhidkZRYUxkUDdBaktJWklzajNHUjdpQVhiOEVMVWV6RmdjQiI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjM6Imh0dHBzOi8vdW9uZHIuYmVza2FyLm14Ijt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1758564783),
('t1KQFphacKlYRPJMmI3r87E6TwlqEtaI3BAdF13d', NULL, '187.189.90.216', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/139.0.0.0 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiejk2cENJWGRsUGJQMFI0R0xoN2xHR2FoVjV1cHNUQWpqT2ZaTW5IbyI7czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6Mjk6Imh0dHBzOi8vdW9uZHIuYmVza2FyLm14L3R1bHVtIjt9fQ==', 1758558230),
('xL5RIBmSPNUY49uyIMGcrx69WtxQtBidPxDWqgLJ', NULL, '189.172.242.141', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/140.0.0.0 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiVkEyY1BtUU1Na2Y1VG1kUW56TDBITFR3dTV5N0RvZEVLWjJldHZvWCI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MzI6Imh0dHBzOi8vdW9uZHIuYmVza2FyLm14L21leGljYW5vIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1758564779);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `users`
--

CREATE TABLE `users` (
  `id` bigint UNSIGNED NOT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `google_id` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `is_admin` tinyint(1) NOT NULL DEFAULT '0',
  `remember_token` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `email_verified_at`, `password`, `google_id`, `is_admin`, `remember_token`, `created_at`, `updated_at`) VALUES
(1, 'sts 19813', 'sts19813@gmail.com', NULL, NULL, '110154208474442854241', 1, NULL, '2025-08-08 07:25:53', '2025-08-08 07:25:53'),
(2, 'David Sabido', 'hi@davidsabido.com', NULL, NULL, '102695912472279843888', 1, NULL, '2025-06-15 08:38:39', '2025-06-15 08:38:39'),
(3, 'Angelica Ecatzim', 'angelicaecatzim@gmail.com', NULL, '$2y$12$uga0bCP3nvT9dDqib3ZBD.AptO3SyCO/YZmj9OBa9j4EsbGSBqlQu', NULL, 1, NULL, '2025-09-10 09:59:05', '2025-09-10 09:59:05');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `base_images`
--
ALTER TABLE `base_images`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `base_prices`
--
ALTER TABLE `base_prices`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `base_prices_style_unique` (`style`);

--
-- Indices de la tabla `cache`
--
ALTER TABLE `cache`
  ADD PRIMARY KEY (`key`);

--
-- Indices de la tabla `cache_locks`
--
ALTER TABLE `cache_locks`
  ADD PRIMARY KEY (`key`);

--
-- Indices de la tabla `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`);

--
-- Indices de la tabla `house_configurations`
--
ALTER TABLE `house_configurations`
  ADD PRIMARY KEY (`id`),
  ADD KEY `house_configurations_user_id_foreign` (`user_id`);

--
-- Indices de la tabla `jobs`
--
ALTER TABLE `jobs`
  ADD PRIMARY KEY (`id`),
  ADD KEY `jobs_queue_index` (`queue`);

--
-- Indices de la tabla `job_batches`
--
ALTER TABLE `job_batches`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `password_reset_tokens`
--
ALTER TABLE `password_reset_tokens`
  ADD PRIMARY KEY (`email`);

--
-- Indices de la tabla `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`id`),
  ADD KEY `products_category_id_foreign` (`category_id`);

--
-- Indices de la tabla `product_fachada_renders`
--
ALTER TABLE `product_fachada_renders`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `product_fachada_renders_product_id_fachada_unique` (`product_id`,`fachada`);

--
-- Indices de la tabla `product_renders`
--
ALTER TABLE `product_renders`
  ADD PRIMARY KEY (`id`),
  ADD KEY `product_renders_product_id_foreign` (`product_id`);

--
-- Indices de la tabla `sessions`
--
ALTER TABLE `sessions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `sessions_user_id_index` (`user_id`),
  ADD KEY `sessions_last_activity_index` (`last_activity`);

--
-- Indices de la tabla `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `base_images`
--
ALTER TABLE `base_images`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=25;

--
-- AUTO_INCREMENT de la tabla `base_prices`
--
ALTER TABLE `base_prices`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `categories`
--
ALTER TABLE `categories`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=59;

--
-- AUTO_INCREMENT de la tabla `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `jobs`
--
ALTER TABLE `jobs`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT de la tabla `products`
--
ALTER TABLE `products`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=281;

--
-- AUTO_INCREMENT de la tabla `product_fachada_renders`
--
ALTER TABLE `product_fachada_renders`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=849;

--
-- AUTO_INCREMENT de la tabla `product_renders`
--
ALTER TABLE `product_renders`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=176;

--
-- AUTO_INCREMENT de la tabla `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `house_configurations`
--
ALTER TABLE `house_configurations`
  ADD CONSTRAINT `house_configurations_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Filtros para la tabla `products`
--
ALTER TABLE `products`
  ADD CONSTRAINT `products_category_id_foreign` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id`) ON DELETE CASCADE;

--
-- Filtros para la tabla `product_fachada_renders`
--
ALTER TABLE `product_fachada_renders`
  ADD CONSTRAINT `product_fachada_renders_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE;

--
-- Filtros para la tabla `product_renders`
--
ALTER TABLE `product_renders`
  ADD CONSTRAINT `product_renders_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
