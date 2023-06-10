-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 10-06-2023 a las 01:40:44
-- Versión del servidor: 10.4.22-MariaDB
-- Versión de PHP: 8.1.2

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `hector_gonzalez`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `failed_jobs`
--

CREATE TABLE `failed_jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `uuid` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `connection` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(7, '2014_10_12_000000_create_users_table', 1),
(8, '2014_10_12_100000_create_password_resets_table', 1),
(9, '2019_08_19_000000_create_failed_jobs_table', 1),
(10, '2019_12_14_000001_create_personal_access_tokens_table', 1),
(11, '2023_06_09_042715_create_productos_table', 1),
(12, '2023_06_09_042747_create_productos_traducciones_table', 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `password_resets`
--

CREATE TABLE `password_resets` (
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `personal_access_tokens`
--

CREATE TABLE `personal_access_tokens` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `tokenable_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tokenable_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL,
  `abilities` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `expires_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `productos`
--

CREATE TABLE `productos` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `sku` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `precioDolares` decimal(10,2) NOT NULL,
  `precioPesos` decimal(10,2) NOT NULL,
  `puntos` int(11) NOT NULL,
  `url` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `activo` tinyint(4) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `productos`
--

INSERT INTO `productos` (`id`, `sku`, `precioDolares`, `precioPesos`, `puntos`, `url`, `activo`, `created_at`, `updated_at`) VALUES
(1, '3575609', '56.00', '725.00', 80, 'teatino-supreme-3575609', 1, '2023-06-09 17:52:29', '2023-06-09 17:52:45'),
(2, '5177632', '34.75', '600.00', 65, 'cafezzino-sin-endulzar-5177632', 1, '2023-06-10 01:30:54', '2023-06-10 01:30:54'),
(5, '6305929', '25.77', '445.00', 35, 'one-c-mix-6305929', 0, '2023-06-10 01:47:42', '2023-06-10 01:47:42'),
(6, '2603201', '50.91', '880.00', 105, 'power-maker-2603201', 0, '2023-06-10 05:31:01', '2023-06-10 05:31:01'),
(7, '2313801', '39.63', '685.00', 90, 'omniplus-2313801', 0, '2023-06-10 05:39:44', '2023-06-10 05:39:44');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `productos_traducciones`
--

CREATE TABLE `productos_traducciones` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `producto_id` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `nombre` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `descripcion_corta` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `descripcion_larga` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `url` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `idioma` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `productos_traducciones`
--

INSERT INTO `productos_traducciones` (`id`, `producto_id`, `nombre`, `descripcion_corta`, `descripcion_larga`, `url`, `idioma`, `created_at`, `updated_at`) VALUES
(1, '1', 'Teatino Supreme', 'Caja con 30 sobres, contenido neto 225 gramos', 'Suplemento alimenticio, sabor a maracuyá, que contiene extracto de té negro, inulina, L-Carnitina, L-Tirosina, extracto café verde (Coffea canephora robusta Pierre), extractos de menta, y romero. Con endulzante de origen natural, estevia.', 'teatino-supreme-3575609', 'espanol', '2023-06-09 17:53:26', '2023-06-09 17:53:26'),
(2, '1', 'Teatino Maracuyá Supreme', 'Box /30 sachets 225g', 'Passion fruit flavored product with green coffee extract, L-tyrosine, L-carnitine and fiber. Promotes satiety.', 'teatino-maracuya-supreme-3575609', 'ingles', '2023-06-09 17:53:26', '2023-06-09 17:53:26'),
(3, '2', 'Cafezzino sin endulzar', 'Bote, contenido neto 175 gramos', 'Suplemento alimenticio que contiene café colombiano, extracto de café verde (Coffea canephora robusta Pierre), cromo e inulina.', 'cafezzino-sin-endulzar-5177632', 'espanol', '2023-06-09 19:20:35', '2023-06-09 19:20:35'),
(4, '2', 'Cafezzino Unsweetened', 'Bottle 175g', 'Nutritional product with Colombian coffee, green coffee extract, chromium and fiber, unsweetened.', 'cafezzino-unsweetened-5177632', 'ingles', '2023-06-09 19:20:35', '2023-06-09 19:20:35'),
(5, '5', 'One C Mix', 'Caja con 30 sobres, contenido neto 150 g', 'Suplemento alimenticio, sabor a mango verde, que contiene L-Glutatión, L-Cisteína, Complejo B: tiamina B1, riboflavina B2, niacina B3, ácido pantoténico B5, piridoxina B6, biotina, ácido fólico B9, cianocobalamina B12, vitaminas A, C, D, E y K, además de minerales como calcio, fósforo, yodo, zinc, cobre, manganeso, cromo, molibdeno y selenio. Con extracto de fruto del monje y glucósidos de esteviol, endulzantes de origen natural.', 'one-c-mix-6305929', 'espanol', '2023-06-10 01:47:42', '2023-06-10 01:47:42'),
(6, '6', 'Power Maker', 'Caja con 30 sobres, contenido neto 300 gramos', 'Suplemento alimenticio, sabor a naranja, que contiene L-Arginina, colina, glicina, vitaminas B5, C y E, además de minerales: boro, calcio, cobre, cromo y zinc. Con endulzantes de origen natural, extracto de fruto del monje y estevia.', 'power-maker-2603201', 'espanol', '2023-06-10 05:31:01', '2023-06-10 05:31:01'),
(7, '7', 'Omniplus', 'Caja con 30 sobres, contenido neto 900 mililitros', 'Suplemento alimenticio, sabor a naranja, que contiene vitamina A, complejo B: tiamina B1, riboflavina B2, niacina B3, ácido pantoténico B5, piridoxina B6, biotina y cobalamina B12, vitaminas C, D y E, minerales: calcio, magnesio, zinc, cobre, manganeso, cromo y selenio, además de gel de sábila (aloe vera), guaraná, kelp, nuez de cola, schisandra, chlorella, espirulina, pasto de trigo, perejil, bayas de Hawthorne, suma y manzanilla.', 'omniplus-2313801', 'espanol', '2023-06-10 05:39:44', '2023-06-10 05:39:44'),
(8, '7', 'OML Plus', 'Box w/30 packets 900ml', 'Orange flavored nutritional product with vitamins and minerals of easy absorption and herbal extracts that provides nutritional benefits.', 'oml-plus-2313801', 'ingles', '2023-06-10 05:39:44', '2023-06-10 05:39:44');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `email_verified_at`, `password`, `remember_token`, `created_at`, `updated_at`) VALUES
(1, 'hector gonzalez', 'hector.gonzalez@omnilife.com', NULL, '$2y$10$mEMxuBes2fkCw3T.FNzNvuFX05u46bzcKLao514Qw6N3VHNIh9cjq', 'mymgOxjoih6MvA9OEq2NVDjJIv4LbTazm99v1jkodrnqPKVOZK1L2v7tBXKT', '2023-06-09 11:54:42', '2023-06-09 11:54:42');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`);

--
-- Indices de la tabla `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `password_resets`
--
ALTER TABLE `password_resets`
  ADD PRIMARY KEY (`email`);

--
-- Indices de la tabla `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  ADD KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`);

--
-- Indices de la tabla `productos`
--
ALTER TABLE `productos`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `productos_traducciones`
--
ALTER TABLE `productos_traducciones`
  ADD PRIMARY KEY (`id`);

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
-- AUTO_INCREMENT de la tabla `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT de la tabla `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `productos`
--
ALTER TABLE `productos`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT de la tabla `productos_traducciones`
--
ALTER TABLE `productos_traducciones`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT de la tabla `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
