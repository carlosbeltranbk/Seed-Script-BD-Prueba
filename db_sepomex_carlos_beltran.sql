-- phpMyAdmin SQL Dump
-- version 4.7.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: May 13, 2021 at 11:06 PM
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

-- --------------------------------------------------------

--
-- Table structure for table `colonia`
--

CREATE TABLE `colonia` (
  `IdColonia` int(11) NOT NULL,
  `NombreColonia` varchar(100) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

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
  `idMunicipio` int(11) NOT NULL,
  `NombreMunicipio` varchar(100) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `municipio`
--

INSERT INTO `municipio` (`idMunicipio`, `NombreMunicipio`) VALUES
(1, 'Silao de la Victoria'),
(2, 'Romita'),
(3, 'San Miguel de Allende'),
(4, 'Santa Cruz de Juventino Rosas'),
(5, 'Cortazar'),
(6, 'Yuriria');


--
-- Table structure for table `estado`
--

CREATE TABLE `estado` (
  `idEstado` int(11) NOT NULL,
  `d_codigo` int(11) NOT NULL,
  `id_Colonia` int(11) NOT NULL,
  `d_tipo_asenta` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `id_Municipio` int(11) NOT NULL,
  `CP` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `estado`
--

INSERT INTO `estado` (`idEstado`, `d_codigo`, `id_Colonia`, `d_tipo_asenta`, `id_Municipio`, `CP`) VALUES
(1, 36000, 2, 'Colonia', 2, 36201);

-- --------------------------------------------------------

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
  ADD KEY `fk_estado_colonia` (`id_Colonia`),
  ADD KEY `fk_estado_municipio` (`id_Municipio`);

--
-- Indexes for table `municipio`
--
ALTER TABLE `municipio`
  ADD PRIMARY KEY (`idMunicipio`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `colonia`
--
ALTER TABLE `colonia`
  MODIFY `IdColonia` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;
--
-- AUTO_INCREMENT for table `estado`
--
ALTER TABLE `estado`
  MODIFY `idEstado` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `municipio`
--
ALTER TABLE `municipio`
  MODIFY `idMunicipio` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;
--
-- Constraints for dumped tables
--

--
-- Constraints for table `estado`
--
ALTER TABLE `estado`
  ADD CONSTRAINT `fk_estado_colonia` FOREIGN KEY (`id_Colonia`) REFERENCES `colonia` (`IdColonia`) ON DELETE CASCADE ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_estado_municipio` FOREIGN KEY (`id_Municipio`) REFERENCES `municipio` (`idMunicipio`) ON DELETE CASCADE ON UPDATE NO ACTION;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
