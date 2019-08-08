-- phpMyAdmin SQL Dump
-- version 4.8.5
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: 2019 m. Rgp 08 d. 07:01
-- Server version: 10.1.40-MariaDB
-- PHP Version: 7.3.5

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `kavine`
--

-- --------------------------------------------------------

--
-- Sukurta duomenų struktūra lentelei `patiekalai`
--

CREATE TABLE `patiekalai` (
  `id` int(11) NOT NULL,
  `pav` varchar(256) COLLATE utf8_lithuanian_ci NOT NULL,
  `trukme_ruosimo` int(11) NOT NULL,
  `trukme_kaitinimo` int(11) NOT NULL,
  `kaina` int(32) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_lithuanian_ci;

--
-- Sukurta duomenų kopija lentelei `patiekalai`
--

INSERT INTO `patiekalai` (`id`, `pav`, `trukme_ruosimo`, `trukme_kaitinimo`, `kaina`) VALUES
(3, 'Ledai', 0, 0, 3),
(4, 'Kava Juoda', 0, 0, 4),
(5, 'Cezario salotos', 15, 0, 20),
(6, 'Obuolių pyragas su braškėmis', 0, 0, 6),
(7, 'Kava Late', 0, 0, 7),
(8, 'Humus Pica', 15, 8, 31),
(9, 'Šaltibarščiai su bulvėmis', 15, 5, 29),
(10, 'Bulviniai blynai', 10, 15, 35),
(11, 'Vaisinė arbata', 0, 0, 11),
(12, 'Blyneliai su bananais', 15, 10, 37),
(13, 'Varškėčiai', 20, 10, 43);

-- --------------------------------------------------------

--
-- Sukurta duomenų struktūra lentelei `produktai`
--

CREATE TABLE `produktai` (
  `id` int(11) UNSIGNED NOT NULL,
  `pav` varchar(256) COLLATE utf8_lithuanian_ci NOT NULL,
  `mat_vnt` varchar(32) COLLATE utf8_lithuanian_ci NOT NULL,
  `mat_kiek` int(10) UNSIGNED NOT NULL,
  `kaina` decimal(12,2) UNSIGNED NOT NULL,
  `kiekis_sand` double UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_lithuanian_ci;

--
-- Sukurta duomenų kopija lentelei `produktai`
--

INSERT INTO `produktai` (`id`, `pav`, `mat_vnt`, `mat_kiek`, `kaina`, `kiekis_sand`) VALUES
(1, 'Pienas', 'vnt', 5, '5.00', 2000),
(2, 'Vištiena', 'kg', 40, '160.00', 1000),
(3, 'Kiaušiniai', 'vnt', 100, '20.00', 8000),
(4, 'Grietinė', 'g', 900, '3.00', 500);

-- --------------------------------------------------------

--
-- Sukurta duomenų struktūra lentelei `uzsakymai`
--

CREATE TABLE `uzsakymai` (
  `id` int(11) UNSIGNED NOT NULL,
  `pav` varchar(256) COLLATE utf8_lithuanian_ci NOT NULL,
  `trukme_ruosimo` int(11) UNSIGNED DEFAULT NULL,
  `trukme_kaitinimo` int(11) UNSIGNED DEFAULT NULL,
  `busena` enum('uzsakytas','anuliuotas','ivykdytas') COLLATE utf8_lithuanian_ci NOT NULL DEFAULT 'uzsakytas',
  `laikas_uzsakymo` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `laikas_patekimo` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  `klientas` varchar(255) COLLATE utf8_lithuanian_ci NOT NULL,
  `id_patiekalo` int(10) UNSIGNED DEFAULT NULL,
  `kaina` decimal(12,2) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_lithuanian_ci;

--
-- Sukurta duomenų kopija lentelei `uzsakymai`
--

INSERT INTO `uzsakymai` (`id`, `pav`, `trukme_ruosimo`, `trukme_kaitinimo`, `busena`, `laikas_uzsakymo`, `laikas_patekimo`, `klientas`, `id_patiekalo`, `kaina`) VALUES
(1, 'Ledai', 0, 0, 'ivykdytas', '2019-08-06 06:03:25', '2019-08-07 15:30:10', '', 3, '0.00'),
(2, 'Kava Juoda', 0, 0, 'ivykdytas', '2019-08-06 06:03:25', '2019-08-07 07:15:42', '', 4, '0.00'),
(4, 'Cezario salotos', 15, 0, 'ivykdytas', '2019-08-06 06:03:25', '2019-08-07 07:15:42', '', 5, '0.00'),
(6, 'Obuoliu pyragas su braskemis', 0, 0, 'anuliuotas', '2019-08-06 06:03:25', '2019-08-07 07:17:39', '', 6, '0.00'),
(7, 'Kava Late', 0, 0, 'anuliuotas', '2019-08-06 06:03:25', '2019-08-07 07:15:42', '', 7, '0.00'),
(8, 'Humus Pica', 15, 8, 'uzsakytas', '2019-08-06 06:03:25', '2019-08-07 07:15:42', '', 8, '0.00'),
(9, 'Saltibarsciai su bulvemis', 15, 5, 'uzsakytas', '2019-08-06 06:03:25', '2019-08-07 07:17:39', '', 9, '0.00'),
(10, 'Bulviniai blynai', 10, 15, 'anuliuotas', '2019-08-06 06:03:25', '2019-08-07 07:15:42', '', 10, '0.00'),
(11, 'Vaisin? arbata', 0, 0, 'uzsakytas', '2019-08-06 06:03:25', '2019-08-07 07:17:39', '', 11, '0.00'),
(12, 'Blyneliai su bananais', 15, 10, 'uzsakytas', '2019-08-06 06:03:25', '2019-08-07 07:15:42', '', 12, '0.00'),
(13, 'Varšk??iai', 20, 10, 'anuliuotas', '2019-08-06 06:03:25', '2019-08-07 07:17:39', '', 13, '0.00'),
(14, 'Obuoli? pyragas su brašk?mis', 0, 0, 'ivykdytas', '2019-08-07 07:11:13', '2019-08-07 07:11:24', '', 6, '6.00'),
(15, 'Obuoli? pyragas su brašk?mis', 0, 0, 'ivykdytas', '2019-08-07 07:11:38', '2019-08-07 07:11:41', 'kitas', 6, '6.00'),
(16, 'Obuoli? pyragas su brašk?mis', 0, 0, 'ivykdytas', '2019-08-07 07:11:58', '2019-08-07 07:12:02', 'kitas', 6, '8.00');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `patiekalai`
--
ALTER TABLE `patiekalai`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `produktai`
--
ALTER TABLE `produktai`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `uzsakymai`
--
ALTER TABLE `uzsakymai`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `patiekalai`
--
ALTER TABLE `patiekalai`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT for table `produktai`
--
ALTER TABLE `produktai`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `uzsakymai`
--
ALTER TABLE `uzsakymai`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
