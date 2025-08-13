
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
(5, 3, NULL, NULL, NULL, NULL, '/render/render_3_5.webp', '/render/render_3_6.webp', '/render/render_3_7.webp', '/render/render_3_8.webp', NULL, '2025-08-08 12:25:35', '2025-08-12 08:03:35'),
(6, 58, NULL, NULL, NULL, NULL, '/render/render_58_5.webp', '/render/render_58_6.webp', '/render/render_58_7.webp', '/render/render_58_8.webp', NULL, '2025-08-08 12:33:44', '2025-08-12 07:59:06'),
(7, 59, NULL, NULL, NULL, NULL, '/render/render_59_5.webp', '/render/render_59_6.webp', '/render/render_59_7.webp', '/render/render_59_8.webp', NULL, '2025-08-08 12:34:18', '2025-08-08 14:36:13'),
(8, 60, NULL, NULL, NULL, NULL, '/render/render_60_5.webp', '/render/render_60_6.webp', '/render/render_60_7.webp', '/render/render_60_8.webp', NULL, '2025-08-08 12:34:31', '2025-08-08 14:06:02'),
(9, 31, NULL, NULL, NULL, NULL, '/render/render_31_5.webp', '/render/render_31_6.webp', '/render/render_31_7.webp', NULL, NULL, '2025-08-08 12:38:14', '2025-08-08 14:12:21'),
(10, 32, NULL, NULL, NULL, NULL, '/render/render_32_5.webp', '/render/render_32_6.webp', '/render/render_32_7.webp', NULL, NULL, '2025-08-08 12:38:35', '2025-08-08 14:12:35'),
(11, 28, NULL, NULL, NULL, NULL, '/render/render_28_5.webp', '/render/render_28_6.webp', '/render/render_28_7.webp', NULL, NULL, '2025-08-08 12:38:49', '2025-08-08 14:12:53'),
(12, 30, NULL, NULL, NULL, NULL, '/render/render_30_5.webp', '/render/render_30_6.webp', '/render/render_30_7.webp', NULL, NULL, '2025-08-08 12:39:01', '2025-08-08 14:13:07'),
(13, 29, NULL, NULL, NULL, NULL, '/render/render_29_5.webp', '/render/render_29_6.webp', '/render/render_29_7.webp', NULL, NULL, '2025-08-08 12:39:16', '2025-08-08 14:13:18'),
(14, 26, NULL, NULL, NULL, NULL, '/render/render_26_5.webp', '/render/render_26_6.webp', '/render/render_26_7.webp', '/render/render_26_8.webp', NULL, '2025-08-08 12:42:30', '2025-08-08 14:14:50'),
(15, 27, NULL, NULL, NULL, NULL, '/render/render_27_5.webp', '/render/render_27_6.webp', '/render/render_27_7.webp', '/render/render_27_8.webp', NULL, '2025-08-08 12:42:42', '2025-08-08 14:15:05'),
(16, 23, NULL, NULL, NULL, NULL, '/render/render_23_5.webp', '/render/render_23_6.webp', '/render/render_23_7.webp', '/render/render_23_8.webp', NULL, '2025-08-08 12:42:54', '2025-08-12 08:01:23'),
(17, 25, NULL, NULL, NULL, NULL, '/render/render_25_5.webp', '/render/render_25_6.webp', '/render/render_25_7.webp', '/render/render_25_8.webp', NULL, '2025-08-08 12:43:11', '2025-08-12 08:01:32'),
(18, 24, NULL, NULL, NULL, NULL, '/render/render_24_5.webp', '/render/render_24_6.webp', '/render/render_24_7.webp', '/render/render_24_8.webp', NULL, '2025-08-08 12:43:22', '2025-08-12 08:01:41'),
(19, 4, NULL, NULL, NULL, NULL, '/render/render_4_5.webp', '/render/render_4_6.webp', '/render/render_4_7.webp', '/render/render_4_8.webp', NULL, '2025-08-08 12:46:17', '2025-08-12 08:03:43'),
(20, 5, NULL, NULL, NULL, NULL, '/render/render_5_5.webp', '/render/render_5_6.webp', '/render/render_5_7.webp', '/render/render_5_8.webp', NULL, '2025-08-08 12:46:29', '2025-08-12 08:03:51'),
(21, 6, NULL, NULL, NULL, NULL, '/render/render_6_5.webp', '/render/render_6_6.webp', '/render/render_6_7.webp', '/render/render_6_8.webp', NULL, '2025-08-08 12:46:41', '2025-08-12 08:04:01'),
(22, 7, NULL, NULL, NULL, NULL, '/render/render_7_5.webp', '/render/render_7_6.webp', '/render/render_7_7.webp', '/render/render_7_8.webp', NULL, '2025-08-08 12:46:52', '2025-08-12 08:04:14'),
(23, 8, NULL, NULL, NULL, NULL, '/render/render_8_5.webp', NULL, '/render/render_8_7.webp', '/render/render_8_8.webp', NULL, '2025-08-08 12:47:02', '2025-08-12 08:04:25'),
(24, 51, NULL, NULL, NULL, NULL, '/render/render_51_5.webp', '/render/render_51_6.webp', '/render/render_51_7.webp', '/render/render_51_8.webp', NULL, '2025-08-08 12:48:32', '2025-08-12 08:05:31'),
(25, 52, NULL, NULL, NULL, NULL, '/render/render_52_5.webp', '/render/render_52_6.webp', '/render/render_52_7.webp', '/render/render_52_8.webp', NULL, '2025-08-08 12:48:43', '2025-08-12 08:05:40'),
(26, 53, NULL, NULL, NULL, NULL, '/render/render_53_5.webp', '/render/render_53_6.webp', '/render/render_53_7.webp', '/render/render_53_8.webp', NULL, '2025-08-08 12:48:52', '2025-08-12 08:06:18'),
(27, 54, NULL, NULL, NULL, NULL, '/render/render_54_5.webp', '/render/render_54_6.webp', '/render/render_54_7.webp', '/render/render_54_8.webp', NULL, '2025-08-08 12:49:25', '2025-08-12 08:06:51'),
(28, 55, NULL, NULL, NULL, NULL, '/render/render_55_5.webp', '/render/render_55_6.webp', '/render/render_55_7.webp', '/render/render_55_8.webp', NULL, '2025-08-08 12:49:36', '2025-08-12 08:06:59'),
(29, 56, NULL, NULL, NULL, NULL, '/render/render_56_5.webp', '/render/render_56_6.webp', '/render/render_56_7.webp', '/render/render_56_8.webp', NULL, '2025-08-08 12:50:04', '2025-08-08 14:20:26'),
(30, 57, NULL, NULL, NULL, NULL, '/render/render_57_5.webp', '/render/render_57_6.webp', '/render/render_57_7.webp', '/render/render_57_8.webp', NULL, '2025-08-08 12:50:14', '2025-08-12 08:07:18'),
(31, 74, NULL, NULL, NULL, NULL, NULL, NULL, '/render/render_74_7.webp', NULL, NULL, '2025-08-08 13:03:38', '2025-08-08 13:03:38'),
(32, 75, NULL, NULL, NULL, NULL, NULL, NULL, '/render/render_75_7.webp', NULL, NULL, '2025-08-08 13:19:49', '2025-08-08 13:19:49'),
(33, 76, NULL, NULL, NULL, NULL, NULL, NULL, '/render/render_76_7.webp', NULL, NULL, '2025-08-08 13:20:03', '2025-08-08 13:20:03'),
(34, 71, NULL, NULL, NULL, NULL, NULL, '/render/render_71_6.webp', '/render/render_71_7.webp', '/render/render_71_8.webp', NULL, '2025-08-08 13:20:55', '2025-08-12 07:55:40'),
(35, 72, NULL, NULL, NULL, NULL, NULL, '/render/render_72_6.webp', '/render/render_72_7.webp', '/render/render_72_8.webp', NULL, '2025-08-08 13:21:08', '2025-08-12 07:58:31'),
(36, 73, NULL, NULL, NULL, NULL, NULL, '/render/render_73_6.webp', '/render/render_73_7.webp', '/render/render_73_8.webp', NULL, '2025-08-08 13:21:17', '2025-08-12 07:58:41'),
(37, 61, NULL, NULL, NULL, NULL, NULL, '/render/render_61_6.webp', '/render/render_61_7.webp', '/render/render_61_8.webp', NULL, '2025-08-08 13:33:08', '2025-08-12 07:59:56'),
(38, 62, NULL, NULL, NULL, NULL, NULL, '/render/render_62_6.webp', '/render/render_62_7.webp', '/render/render_62_8.webp', NULL, '2025-08-08 13:33:19', '2025-08-12 08:00:08'),
(39, 63, NULL, NULL, NULL, NULL, NULL, '/render/render_63_6.webp', '/render/render_63_7.webp', '/render/render_63_8.webp', NULL, '2025-08-08 13:33:31', '2025-08-12 08:00:17'),
(40, 64, NULL, NULL, NULL, NULL, NULL, '/render/render_64_6.webp', '/render/render_64_7.webp', '/render/render_64_8.webp', NULL, '2025-08-08 13:33:45', '2025-08-12 08:00:26'),
(41, 16, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '/render/render_16_8.webp', NULL, '2025-08-08 14:08:07', '2025-08-12 05:45:30'),
(42, 17, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '/render/render_17_8.webp', NULL, '2025-08-08 14:08:22', '2025-08-12 05:45:44'),
(43, 18, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '/render/render_18_8.webp', NULL, '2025-08-08 14:08:32', '2025-08-12 05:45:57'),
(44, 13, NULL, NULL, NULL, NULL, NULL, '/render/render_13_6.webp', NULL, NULL, NULL, '2025-08-08 14:10:41', '2025-08-08 14:10:41'),
(45, 14, NULL, NULL, NULL, NULL, '/render/render_14_5.webp', '/render/render_14_6.webp', NULL, NULL, NULL, '2025-08-08 14:10:56', '2025-08-08 14:24:37'),
(46, 15, NULL, NULL, NULL, NULL, NULL, '/render/render_15_6.webp', NULL, NULL, NULL, '2025-08-08 14:11:06', '2025-08-08 14:11:06'),
(47, 65, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '/render/render_65_8.webp', NULL, '2025-08-12 07:51:44', '2025-08-12 07:51:44'),
(48, 66, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '/render/render_66_8.webp', NULL, '2025-08-12 07:51:59', '2025-08-12 07:51:59'),
(49, 67, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '/render/render_67_8.webp', NULL, '2025-08-12 07:52:08', '2025-08-12 07:52:08'),
(50, 19, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '/render/render_19_8.webp', NULL, '2025-08-12 08:02:06', '2025-08-12 08:02:06'),
(51, 20, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '/render/render_20_8.webp', NULL, '2025-08-12 08:02:14', '2025-08-12 08:02:14'),
(52, 21, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '/render/render_21_8.webp', NULL, '2025-08-12 08:02:23', '2025-08-12 08:02:23'),
(53, 22, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '/render/render_22_8.webp', NULL, '2025-08-12 08:02:30', '2025-08-12 08:02:30'),
(54, 9, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '/render/render_9_8.webp', NULL, '2025-08-12 08:04:40', '2025-08-12 08:04:40'),
(55, 10, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '/render/render_10_8.webp', NULL, '2025-08-12 08:04:51', '2025-08-12 08:04:51'),
(56, 11, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '/render/render_11_8.webp', NULL, '2025-08-12 08:04:58', '2025-08-12 08:04:58'),
(57, 12, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '/render/render_12_8.webp', NULL, '2025-08-12 08:05:05', '2025-08-12 08:05:05');

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
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=58;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `product_renders`
--
ALTER TABLE `product_renders`
  ADD CONSTRAINT `product_renders_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE;
COMMIT;

