-- phpMyAdmin SQL Dump
-- version 4.7.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: May 14, 2021 at 06:30 PM
-- Server version: 10.1.26-MariaDB
-- PHP Version: 7.1.8

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `db_sepomex_carlos_beltran`
--

DELIMITER $$
--
-- Procedures
--
CREATE DEFINER=`root`@`localhost` PROCEDURE `insertarMunicipio` (IN `nomMunicipio` VARCHAR(191))  BEGIN
    INSERT INTO municipio (NombreMunicipio) values (nomMunicipio);
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `obtenerColoniaCP` (IN `CP` INT(10))  BEGIN
    SELECT c.NombreColonia
    FROM estado e JOIN colonia c on e.id_Colonia = c.IdColonia
    WHERE e.CP = CP;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `obtenerColoniasCP` (IN `CP` INT(10))  BEGIN
    SELECT c.NombreColonia as Nombre
    FROM estado e JOIN colonia c on e.id_Colonia = c.IdColonia
    WHERE e.CP = CP;
END$$

DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `colonia`
--

CREATE TABLE `colonia` (
  `IdColonia` int(10) UNSIGNED NOT NULL,
  `NombreColonia` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `colonia`
--

INSERT INTO `colonia` (`IdColonia`, `NombreColonia`) VALUES
(1, 'Guanajuato Centro'),
(2, 'Alameda'),
(3, 'Cata'),
(4, 'Mellado'),
(5, 'Garrapata'),
(6, 'Ex-Hacienda de Luna');

-- --------------------------------------------------------

--
-- Table structure for table `municipio`
--

CREATE TABLE `municipio` (
  `idMunicipio` int(10) UNSIGNED NOT NULL,
  `NombreMunicipio` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `municipio`
--

INSERT INTO `municipio` (`idMunicipio`, `NombreMunicipio`, `created_at`, `updated_at`) VALUES
(1, 'Silao de la Victoria', NULL, NULL),
(2, 'Romita', NULL, NULL),
(3, 'San Miguel de Allende', NULL, NULL),
(4, 'Santa Cruz de Juventino Rosas', NULL, NULL),
(5, 'Cortazar', NULL, NULL),
(6, 'Yuriria', NULL, NULL);


-------------------------------------------------------------------------------------------
--
-- Table structure for table `estado`
--

CREATE TABLE `estado` (
  `idEstado` int(10) UNSIGNED NOT NULL,
  `d_codigo` int(11) NOT NULL,
  `d_tipo_asenta` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `CP` int(11) NOT NULL,
  `id_Colonia` int(10) UNSIGNED NOT NULL,
  `id_Municipio` int(10) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `estado`
--

INSERT INTO `estado` (`idEstado`, `d_codigo`, `d_tipo_asenta`, `CP`, `id_Colonia`, `id_Municipio`, `created_at`, `updated_at`) VALUES
(1, 36000, 'Colonia', 36201, 2, 2, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(21, '2014_10_12_000000_create_users_table', 1),
(22, '2014_10_12_100000_create_password_resets_table', 1),
(23, '2021_05_13_210150_create_colonia_table', 1),
(24, '2021_05_13_210427_create_municipio_table', 1),
(25, '2021_05_13_210449_create_estado_table', 1);

-- --------------------------------------------------------



-- --------------------------------------------------------

--
-- Table structure for table `password_resets`
--

CREATE TABLE `password_resets` (
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `colonia`
--
ALTER TABLE `colonia`
  ADD PRIMARY KEY (`IdColonia`);

--
-- Indexes for table `estado`
--
ALTER TABLE `estado`
  ADD PRIMARY KEY (`idEstado`),
  ADD KEY `estado_id_colonia_foreign` (`id_Colonia`),
  ADD KEY `estado_id_municipio_foreign` (`id_Municipio`);

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `municipio`
--
ALTER TABLE `municipio`
  ADD PRIMARY KEY (`idMunicipio`);

--
-- Indexes for table `password_resets`
--
ALTER TABLE `password_resets`
  ADD KEY `password_resets_email_index` (`email`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `colonia`
--
ALTER TABLE `colonia`
  MODIFY `IdColonia` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;
--
-- AUTO_INCREMENT for table `estado`
--
ALTER TABLE `estado`
  MODIFY `idEstado` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=26;
--
-- AUTO_INCREMENT for table `municipio`
--
ALTER TABLE `municipio`
  MODIFY `idMunicipio` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;
--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- Constraints for dumped tables
--

--
-- Constraints for table `estado`
--
ALTER TABLE `estado`
  ADD CONSTRAINT `estado_id_colonia_foreign` FOREIGN KEY (`id_Colonia`) REFERENCES `colonia` (`IdColonia`),
  ADD CONSTRAINT `estado_id_municipio_foreign` FOREIGN KEY (`id_Municipio`) REFERENCES `municipio` (`idMunicipio`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
