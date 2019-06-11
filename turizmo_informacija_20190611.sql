-- phpMyAdmin SQL Dump
-- version 4.8.5
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: 2019 m. Bir 11 d. 12:33
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
-- Database: `turizmo_informacija`
--

-- --------------------------------------------------------

--
-- Sukurta duomenų struktūra lentelei `group_concat`
--

CREATE TABLE `group_concat` (
  `id` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_lithuanian_ci;

-- --------------------------------------------------------

--
-- Sukurta duomenų struktūra lentelei `istoriniai_ivykiai`
--

CREATE TABLE `istoriniai_ivykiai` (
  `data` date NOT NULL,
  `aprasymas` text COLLATE utf8_lithuanian_ci NOT NULL,
  `pavadinimas` varchar(256) COLLATE utf8_lithuanian_ci NOT NULL,
  `id` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_lithuanian_ci;

-- --------------------------------------------------------

--
-- Sukurta duomenų struktūra lentelei `keliai`
--

CREATE TABLE `keliai` (
  `num_pavadinimas` varchar(256) COLLATE utf8_lithuanian_ci NOT NULL,
  `tipas` enum('automagistrale','greitkelis','rajoninis','krasto_keliai') COLLATE utf8_lithuanian_ci NOT NULL,
  `id` int(10) UNSIGNED NOT NULL,
  `ilgumas` int(10) NOT NULL,
  `num_nr` varchar(256) COLLATE utf8_lithuanian_ci NOT NULL,
  `id_pradinis_miestas` int(10) UNSIGNED DEFAULT NULL,
  `id_galutinis_miestas` int(10) UNSIGNED DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_lithuanian_ci;

--
-- Sukurta duomenų kopija lentelei `keliai`
--

INSERT INTO `keliai` (`num_pavadinimas`, `tipas`, `id`, `ilgumas`, `num_nr`, `id_pradinis_miestas`, `id_galutinis_miestas`) VALUES
('Kaunas-Zarasai-Daugpilis', 'automagistrale', 1, 185, 'A6', 2, 6),
('Vilnius-Minskas', 'automagistrale', 2, 34, 'A3', NULL, NULL),
('Garliava-KaunoHE', 'krasto_keliai', 3, 12, '139', NULL, NULL),
('Utena-Kaltanėnai-Švenčionys', 'krasto_keliai', 4, 65, '111', NULL, NULL),
('Šiauliai-Palanga', 'automagistrale', 5, 147, 'A11', NULL, NULL),
('Panevėžys-Vilnius', 'automagistrale', 6, 136, 'A2', NULL, NULL);

-- --------------------------------------------------------

--
-- Sukurta duomenų struktūra lentelei `keliai_miestai`
--

CREATE TABLE `keliai_miestai` (
  `id` int(10) UNSIGNED NOT NULL,
  `id_miesto` int(10) UNSIGNED NOT NULL,
  `id_kelio` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_lithuanian_ci;

--
-- Sukurta duomenų kopija lentelei `keliai_miestai`
--

INSERT INTO `keliai_miestai` (`id`, `id_miesto`, `id_kelio`) VALUES
(5, 2, 1),
(6, 2, 6),
(7, 6, 1);

-- --------------------------------------------------------

--
-- Sukurta duomenų struktūra lentelei `lankytinos_vietos`
--

CREATE TABLE `lankytinos_vietos` (
  `id` int(10) UNSIGNED NOT NULL,
  `pavadinimas` varchar(256) COLLATE utf8_lithuanian_ci NOT NULL,
  `aprasymas` text COLLATE utf8_lithuanian_ci NOT NULL,
  `tipas` enum('piliakalnis','muziejai','sventes') COLLATE utf8_lithuanian_ci NOT NULL,
  `ilguma` decimal(10,7) NOT NULL,
  `platuma` decimal(10,2) NOT NULL,
  `id_miesto` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_lithuanian_ci;

--
-- Sukurta duomenų kopija lentelei `lankytinos_vietos`
--

INSERT INTO `lankytinos_vietos` (`id`, `pavadinimas`, `aprasymas`, `tipas`, `ilguma`, `platuma`, `id_miesto`) VALUES
(1, 'Birštono piliakalnis', 'Birštono piliakalnis apjuostas daubų. Šlaitai statūs, 13–20 m aukščio. Aikštelė ovali, apie 70 x 35 m dydžio, jos šiaurės vakarų dalis suardyta - iškastos vandentiekio rezervuaro duobės. Piliakalnio pietinėje papėdėje yra senovės gyvenvietės liekanų. Piliakalnis apaugęs medžiais ir krūmais. Iš šiaurės pusės griovys jungia piliakalnį su gretima aukštuma. Piliakalnis ir aukštuma sujungti laiptais.', 'piliakalnis', '24.0336110', '54.61', 1),
(2, 'Kauno pilis', 'Kauno pilis – seniausia mūrinė pilis Lietuvoje, stovinti Kaune, antrajame pagal dydį šalies mieste. Pirmą kartą rašytiniuose šaltiniuose paminėta 1361 m.', 'muziejai', '23.8850000', '54.90', 2),
(3, 'Lietuvos jūrų muziejus', 'Lietuvos jūrų muziejus – nuo 1979 metų veikiantis muziejus Kuršių nerijos šiauriausiame taške, Kopgalyje, Smiltynės g. 3 (Klaipėda). Nuo 1994 metų veikia Delfinariumas. Muziejaus rinkiniuose saugomi 60.062 eksponatų vienetai. Didžiausias rinkinys – jūrų faunos preparatai (moliuskų kriauklės, koralai, vėžiagyviai, dygiaodžiai, jūrų paukščiai, žuvys ir žinduoliai). Jame yra 19 787 vienetai. Muziejaus rinkiniuose yra ir geologijos, archeologijos, etnografijos, numizmatikos, kartografijos, laivų technikos, raštijos, filatelijos eksponatų. Gyvų eksponatų – 957 gyvūnai.', 'muziejai', '21.0997220', '55.72', 3),
(4, 'Gedimino pilis', 'Gedimino pilis – gotikinė pilis Vilniuje, kurios liekanos stūkso Gedimino kalno aikštelėje. Papėdėje buvo LDK kunigaikščio Vytauto Didžiojo rezidencija, dabar – atstatyti Valdovų rūmai. Iš pagarbos Vilniaus įkūrėjui LDK kunigaikščiui Gediminui pilis pavadinta jo vardu. Pilis priklauso Vilniaus pilių rezervatui. ', 'muziejai', '25.2908330', '54.69', 4),
(5, 'Graliavos krašto istorijos muziejus', 'Tautos istorija ir mūsų kalba yra tautos žadintojai ir palaikytojai. Kraštotyrininkų, bibliotekų, kultūros centrų darbai ir dėmesys kaip tik liudija apie pagarbą tautos praeičiai ir šias dienas. Tas buvo pabrėžta ir Garliavoje, Kauno rajono viešojoje bibliotekoje.', 'muziejai', '23.8860700', '54.83', 5),
(6, 'Utenos krašto muziejus', 'Utenos krašto muziejus - kraštotyros muziejus Šiaurės Lietuvoje. Steigėjas - Utenos rajono savivaldybė.', 'muziejai', '25.6012060', '55.50', 6),
(7, 'Dviračių muziejus', 'Dviračių muziejus – vienintelis specializuotas dviračių tematikai skirtas Lietuvos muziejus, kuriame demonstruojama daugiau kaip 80 dviračių, 5 velomobiliai ir apie 300 kitų eksponatų. Įsikūręs Šiauliuose, Šiaulių Aušros muziejaus padalinys. ', 'muziejai', '23.3198560', '55.93', 7),
(8, 'Upytės piliakalnis', 'Piliakalnis įrengtas Vešetos pelkių, kurios numelioruotos 1930–1931 m., supamos žvyringos kalvos šiaurės rytinėje siauresnėje dalyje. Pačios kalvos daugiau šiaurės rytų centrinėje dalyje, labiau į šiaurės rytus nuo centro, yra natūrali ovali 85 m ilgio, 25 m pločio, 6 m gylio įduba. Piliakalnio aikštelė keturkampė, pailga šiaurės rytų – pietvakarių kryptimi, 40x18 m dydžio, 1 m aukštesniu pietrytiniu šonu. Šiaurės rytiniame aikštelės krašte supiltas 1,2 m aukščio, 17 m pločio pylimas, kurio išorinis 4 m aukščio šlaitas leidžiasi į 8 m pločio, 1,5 m gylio griovį, už jo yra supiltas antras 0,3 m aukščio, 8 m pločio pylimas, jame matyti iki 30 cm skersmens akmenys. Pietvakariniame aikštelės krašte supiltas 1,2 m aukščio, 14 m pločio pylimas, kurio 2,5 m aukščio išorinis šlaitas leidžiasi į 8 m pločio terasą (joje irgi kyšo iki 30 cm skersmens akmenys), už jos yra 4 m pločio, 0,5 m gylio griovys. Už griovio supiltas antras 0,3 m aukščio, 6 m pločio pylimas. Šlaitai statūs, 6 m aukščio.\r\n\r\nŠiaurės rytinio pylimo viršus apardytas iškastos duobės. ', 'piliakalnis', '24.3638890', '55.73', 8);

-- --------------------------------------------------------

--
-- Sukurta duomenų struktūra lentelei `miestai`
--

CREATE TABLE `miestai` (
  `id` int(10) UNSIGNED NOT NULL,
  `pavadinimas` varchar(256) COLLATE utf8_lithuanian_ci NOT NULL,
  `gyventoju_skaicius` bigint(20) NOT NULL,
  `plotas` decimal(12,2) NOT NULL,
  `ilguma` decimal(10,7) NOT NULL,
  `platuma` decimal(10,2) NOT NULL,
  `valstybe` char(7) COLLATE utf8_lithuanian_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_lithuanian_ci;

--
-- Sukurta duomenų kopija lentelei `miestai`
--

INSERT INTO `miestai` (`id`, `pavadinimas`, `gyventoju_skaicius`, `plotas`, `ilguma`, `platuma`, `valstybe`) VALUES
(1, 'Birštonas', 2369, '13.00', '24.0293290', '54.61', 'Lietuva'),
(2, 'Kaunas', 286763, '157.00', '23.8924290', '54.90', 'Lietuva'),
(3, 'Klaipėda', 147898, '98.00', '21.1318090', '55.71', 'Lietuva'),
(4, 'Vilnius', 540919, '401.00', '25.2796520', '54.69', 'Lietuva'),
(5, 'Garliava', 10067, '3.00', '23.8825800', '54.82', 'Lietuva'),
(6, 'Utena', 25496, '15.00', '25.5967100', '55.50', 'Lietuva'),
(7, 'Šiauliai', 100618, '81.00', '23.3142200', '55.93', 'Lietuva'),
(8, 'Panevėžys', 98258, '54.00', '24.3703310', '55.74', 'Lietuva');

-- --------------------------------------------------------

--
-- Sukurta duomenų struktūra lentelei `miestai_atstumai`
--

CREATE TABLE `miestai_atstumai` (
  `id_miesto1` int(10) UNSIGNED DEFAULT NULL,
  `id_miesto2` int(10) UNSIGNED DEFAULT NULL,
  `atstumas_geografinis` int(10) NOT NULL,
  `atstumas_keliai` int(10) UNSIGNED DEFAULT NULL,
  `id` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_lithuanian_ci;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `group_concat`
--
ALTER TABLE `group_concat`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `istoriniai_ivykiai`
--
ALTER TABLE `istoriniai_ivykiai`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `keliai`
--
ALTER TABLE `keliai`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_pradinis_miestas` (`id_pradinis_miestas`),
  ADD KEY `id_galutinis_miestas` (`id_galutinis_miestas`);

--
-- Indexes for table `keliai_miestai`
--
ALTER TABLE `keliai_miestai`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_kelio` (`id_kelio`) USING BTREE,
  ADD KEY `id_miesto` (`id_miesto`) USING BTREE;

--
-- Indexes for table `lankytinos_vietos`
--
ALTER TABLE `lankytinos_vietos`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_miesto` (`id_miesto`) USING BTREE;

--
-- Indexes for table `miestai`
--
ALTER TABLE `miestai`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `miestai_atstumai`
--
ALTER TABLE `miestai_atstumai`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_miesto1` (`id_miesto1`),
  ADD KEY `id_miesto2` (`id_miesto2`),
  ADD KEY `miestai_atstumai_ibfk_3` (`atstumas_keliai`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `group_concat`
--
ALTER TABLE `group_concat`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `istoriniai_ivykiai`
--
ALTER TABLE `istoriniai_ivykiai`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `keliai`
--
ALTER TABLE `keliai`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `keliai_miestai`
--
ALTER TABLE `keliai_miestai`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `lankytinos_vietos`
--
ALTER TABLE `lankytinos_vietos`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `miestai`
--
ALTER TABLE `miestai`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `miestai_atstumai`
--
ALTER TABLE `miestai_atstumai`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- Apribojimai eksportuotom lentelėm
--

--
-- Apribojimai lentelei `keliai`
--
ALTER TABLE `keliai`
  ADD CONSTRAINT `keliai_ibfk_1` FOREIGN KEY (`id_pradinis_miestas`) REFERENCES `miestai` (`id`) ON UPDATE CASCADE,
  ADD CONSTRAINT `keliai_ibfk_2` FOREIGN KEY (`id_galutinis_miestas`) REFERENCES `miestai` (`id`) ON UPDATE CASCADE;

--
-- Apribojimai lentelei `keliai_miestai`
--
ALTER TABLE `keliai_miestai`
  ADD CONSTRAINT `keliai_miestai_ibfk_1` FOREIGN KEY (`id_kelio`) REFERENCES `keliai` (`id`) ON UPDATE CASCADE,
  ADD CONSTRAINT `keliai_miestai_ibfk_2` FOREIGN KEY (`id_miesto`) REFERENCES `miestai` (`id`) ON UPDATE CASCADE;

--
-- Apribojimai lentelei `lankytinos_vietos`
--
ALTER TABLE `lankytinos_vietos`
  ADD CONSTRAINT `lankytinos_vietos_ibfk_1` FOREIGN KEY (`id_miesto`) REFERENCES `miestai` (`id`) ON UPDATE CASCADE;

--
-- Apribojimai lentelei `miestai_atstumai`
--
ALTER TABLE `miestai_atstumai`
  ADD CONSTRAINT `miestai_atstumai_ibfk_1` FOREIGN KEY (`id_miesto1`) REFERENCES `miestai` (`id`) ON UPDATE CASCADE,
  ADD CONSTRAINT `miestai_atstumai_ibfk_2` FOREIGN KEY (`id_miesto2`) REFERENCES `miestai` (`id`) ON UPDATE CASCADE,
  ADD CONSTRAINT `miestai_atstumai_ibfk_3` FOREIGN KEY (`atstumas_keliai`) REFERENCES `miestai` (`id`) ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
