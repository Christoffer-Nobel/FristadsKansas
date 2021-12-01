-- phpMyAdmin SQL Dump
-- version 5.0.4
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Dec 01, 2021 at 08:22 PM
-- Server version: 5.7.24
-- PHP Version: 7.4.16

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `fristads_kansas`
--

-- --------------------------------------------------------

--
-- Table structure for table `abonnementer`
--

CREATE TABLE `abonnementer` (
  `abonnement_id` int(11) NOT NULL,
  `abonnementtype` varchar(30) NOT NULL,
  `indholdsbeskrivelse` varchar(200) NOT NULL,
  `styk_pris` float NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `abonnementer`
--

INSERT INTO `abonnementer` (`abonnement_id`, `abonnementtype`, `indholdsbeskrivelse`, `styk_pris`) VALUES
(1, 'Basis', '2x Bukser, 5x T-shirts, 1x Jakke', 569),
(2, 'Basis plus', '2x Bukser, 5x T-shirts, 2x Sweatshirt, 1x Jakke', 649),
(3, 'Helårs', '2x Bukser, 5x T-shirts, 2x Shorts, 1x Jakke', 819),
(4, 'Helårs plus', '2x Bukser, 5x T-shirts, 2x Shorts, 2x Sweatshirt, 1x Jakke', 899);

-- --------------------------------------------------------

--
-- Table structure for table `arbejdstøj`
--

CREATE TABLE `arbejdstøj` (
  `tøj_id` int(11) NOT NULL,
  `produkt_id` int(2) NOT NULL,
  `status_id` int(2) NOT NULL,
  `kunde_id` int(11) DEFAULT NULL,
  `udleveringstidspunkt` datetime DEFAULT NULL,
  `tilbageleveringstidspunkt` datetime DEFAULT NULL,
  `tilbageleveringstilstands_id` int(2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `arbejdstøj`
--

INSERT INTO `arbejdstøj` (`tøj_id`, `produkt_id`, `status_id`, `kunde_id`, `udleveringstidspunkt`, `tilbageleveringstidspunkt`, `tilbageleveringstilstands_id`) VALUES
(1, 5, 5, 1, '2021-06-09 21:17:38', '2021-11-26 21:17:38', 3),
(2, 9, 3, NULL, NULL, NULL, NULL),
(3, 9, 3, NULL, NULL, NULL, NULL),
(4, 7, 3, NULL, NULL, NULL, NULL),
(5, 4, 4, 2, '2021-11-25 21:20:05', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `brugere`
--

CREATE TABLE `brugere` (
  `bruger_id` int(11) NOT NULL,
  `butiksnavn` varchar(50) NOT NULL,
  `adresse` varchar(50) NOT NULL,
  `postnummer` int(4) NOT NULL,
  `email` varchar(100) NOT NULL,
  `brugernavn` varchar(50) NOT NULL,
  `kodeord` varchar(100) NOT NULL,
  `forhandler` tinyint(1) NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `brugere`
--

INSERT INTO `brugere` (`bruger_id`, `butiksnavn`, `adresse`, `postnummer`, `email`, `brugernavn`, `kodeord`, `forhandler`) VALUES
(1, 'FRISTADS KANSAS', 'Østerbro 3', 5000, 'admin@fk.com', 'admin', 'admin', 0),
(2, 'Orloff Albertslund', 'Roholmsvej 10A', 2620, 'info@orloff.dk', 'Orloff', '123', 1),
(3, 'STARK Odense ', 'Jarlsberggade 10', 5100, 'info.odense@stark.dk', 'starko', '123', 1);

-- --------------------------------------------------------

--
-- Table structure for table `kategori`
--

CREATE TABLE `kategori` (
  `kategori_id` int(11) NOT NULL,
  `kategori_navn` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `kategori`
--

INSERT INTO `kategori` (`kategori_id`, `kategori_navn`) VALUES
(1, 'Jakke'),
(2, 'Bukser'),
(3, 'Shorts'),
(4, 'T-shirt'),
(5, 'Sweatshirt');

-- --------------------------------------------------------

--
-- Table structure for table `kunde`
--

CREATE TABLE `kunde` (
  `kunde_id` int(11) NOT NULL,
  `kundenavn` varchar(50) NOT NULL,
  `CVR` int(8) NOT NULL,
  `adresse` varchar(50) NOT NULL,
  `postnummer` int(4) NOT NULL,
  `email` varchar(50) NOT NULL,
  `telefonnummer` int(8) NOT NULL,
  `regninger_betalt` tinyint(1) NOT NULL DEFAULT '1',
  `butikstilhørsforhold` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `kunde`
--

INSERT INTO `kunde` (`kunde_id`, `kundenavn`, `CVR`, `adresse`, `postnummer`, `email`, `telefonnummer`, `regninger_betalt`, `butikstilhørsforhold`) VALUES
(1, 'Guldfeldt', 17559737, 'Sivmosevænget 4', 5260, 'mail@guldfeldt.dk', 66121834, 1, 2),
(2, 'Byens tømrer og tag ', 65376152, 'Østerlunden 5', 5000, 'BT&T@gmail.com', 12345678, 1, 3),
(3, 'Odense Håndværkeren v/Brian Rasmussen', 21321523, 'Frivej 1', 5200, 'brian.rasmussen@gmail', 31232132, 1, 2),
(4, 'KeVin A/S', 23456789, 'Cortex Park Vest 13, 2. 3', 5230, 'kevin@vin.org', 88888888, 1, 2);

-- --------------------------------------------------------

--
-- Stand-in structure for view `kunder_med_abonnement`
-- (See below for the actual view)
--
CREATE TABLE `kunder_med_abonnement` (
`kunde_id` int(11)
,`kundenavn` varchar(50)
,`CVR` int(8)
,`adresse` varchar(50)
,`postnummer` int(4)
,`email` varchar(50)
,`telefonnummer` int(8)
,`regninger_betalt` tinyint(1)
,`butikstilhørsforhold` int(11)
,`kunde_abonnement_id` int(11)
,`abonnement_id` int(11)
,`abonnementtype` varchar(30)
,`indholdsbeskrivelse` varchar(200)
,`styk_pris` float
,`antal` int(11)
,`udleveret_tøj` int(4)
);

-- --------------------------------------------------------

--
-- Table structure for table `kunde_abonnementer`
--

CREATE TABLE `kunde_abonnementer` (
  `kunde_abonnement_id` int(11) NOT NULL,
  `kunde_id` int(11) NOT NULL,
  `abonnement_id` int(11) NOT NULL,
  `antal` int(11) NOT NULL,
  `udleveret_tøj` int(4) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `kunde_abonnementer`
--

INSERT INTO `kunde_abonnementer` (`kunde_abonnement_id`, `kunde_id`, `abonnement_id`, `antal`, `udleveret_tøj`) VALUES
(14, 1, 1, 8, 3),
(15, 1, 4, 4, 2),
(16, 1, 2, 9, 1),
(19, 4, 3, 2, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `produkt`
--

CREATE TABLE `produkt` (
  `produkt_id` int(11) NOT NULL,
  `produkt_navn` varchar(30) NOT NULL,
  `kategori_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `produkt`
--

INSERT INTO `produkt` (`produkt_id`, `produkt_navn`, `kategori_id`) VALUES
(3, 'GREEN SHELL JACKET ', 1),
(4, 'GREEN CRAFTSMAN TROUSERS ', 2),
(5, 'GREEN CRAFTSMAN JACKET', 1),
(6, 'GREEN FUNCTIONAL T-SHIRT', 4),
(7, 'GREEN FUNCTIONAL T-SHIRT', 4),
(8, 'GREEN CRAFTSMAN SHORTS ', 3),
(9, 'GREEN TROUSERS ', 2),
(10, 'GREEN SWEATSHIRT ', 5);

-- --------------------------------------------------------

--
-- Table structure for table `status`
--

CREATE TABLE `status` (
  `status_id` int(11) NOT NULL,
  `status_navn` varchar(20) NOT NULL,
  `beskrivelse` varchar(200) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `status`
--

INSERT INTO `status` (`status_id`, `status_navn`, `beskrivelse`) VALUES
(1, 'Hos leverandør', 'På lager hos Fristads Kansas - Klar til levering'),
(2, 'Transporteres', 'Under levering fra eller til Fristads Kansas'),
(3, 'Detailbutik - Klar', 'På lager hos detailbutik'),
(4, 'Kunde', 'Hos forbrugeren'),
(5, 'Detailbutik - Brugt', 'Tilbageleveret til detailbutik'),
(6, 'Reperation', 'Under reperation'),
(7, 'Genbrugt', 'Downcycled til materialebrug hos partner');

-- --------------------------------------------------------

--
-- Table structure for table `tilbageleveringstilstand`
--

CREATE TABLE `tilbageleveringstilstand` (
  `tilbageleveringstilstands_id` int(11) NOT NULL,
  `tilstands_navn` varchar(30) NOT NULL,
  `beskrivelse` varchar(200) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `tilbageleveringstilstand`
--

INSERT INTO `tilbageleveringstilstand` (`tilbageleveringstilstands_id`, `tilstands_navn`, `beskrivelse`) VALUES
(1, 'Ny', 'Ingen brugsspor'),
(2, 'Mildt brugt', 'Uden slid, men med behov for klargøring'),
(3, 'Slidt', 'Behov for reperation'),
(4, 'Ødelagt', 'Uafvaskelige kemikalier eller groft slid - kan ikke repareres');

-- --------------------------------------------------------

--
-- Structure for view `kunder_med_abonnement`
--
DROP TABLE IF EXISTS `kunder_med_abonnement`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `kunder_med_abonnement`  AS SELECT `kunde`.`kunde_id` AS `kunde_id`, `kunde`.`kundenavn` AS `kundenavn`, `kunde`.`CVR` AS `CVR`, `kunde`.`adresse` AS `adresse`, `kunde`.`postnummer` AS `postnummer`, `kunde`.`email` AS `email`, `kunde`.`telefonnummer` AS `telefonnummer`, `kunde`.`regninger_betalt` AS `regninger_betalt`, `kunde`.`butikstilhørsforhold` AS `butikstilhørsforhold`, `kunde_abonnementer`.`kunde_abonnement_id` AS `kunde_abonnement_id`, `abonnementer`.`abonnement_id` AS `abonnement_id`, `abonnementer`.`abonnementtype` AS `abonnementtype`, `abonnementer`.`indholdsbeskrivelse` AS `indholdsbeskrivelse`, `abonnementer`.`styk_pris` AS `styk_pris`, `kunde_abonnementer`.`antal` AS `antal`, `kunde_abonnementer`.`udleveret_tøj` AS `udleveret_tøj` FROM ((`kunde` join `kunde_abonnementer` on((`kunde`.`kunde_id` = `kunde_abonnementer`.`kunde_id`))) join `abonnementer` on((`kunde_abonnementer`.`abonnement_id` = `abonnementer`.`abonnement_id`))) ;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `abonnementer`
--
ALTER TABLE `abonnementer`
  ADD PRIMARY KEY (`abonnement_id`);

--
-- Indexes for table `arbejdstøj`
--
ALTER TABLE `arbejdstøj`
  ADD PRIMARY KEY (`tøj_id`),
  ADD KEY `produkt` (`produkt_id`),
  ADD KEY `status` (`status_id`),
  ADD KEY `tilbageleveringstilstand` (`tilbageleveringstilstands_id`),
  ADD KEY `kunde_arbejdstøj` (`kunde_id`);

--
-- Indexes for table `brugere`
--
ALTER TABLE `brugere`
  ADD PRIMARY KEY (`bruger_id`);

--
-- Indexes for table `kategori`
--
ALTER TABLE `kategori`
  ADD PRIMARY KEY (`kategori_id`);

--
-- Indexes for table `kunde`
--
ALTER TABLE `kunde`
  ADD PRIMARY KEY (`kunde_id`),
  ADD KEY `butiks_id` (`butikstilhørsforhold`);

--
-- Indexes for table `kunde_abonnementer`
--
ALTER TABLE `kunde_abonnementer`
  ADD PRIMARY KEY (`kunde_abonnement_id`),
  ADD KEY `abonnement` (`abonnement_id`),
  ADD KEY `kunde` (`kunde_id`);

--
-- Indexes for table `produkt`
--
ALTER TABLE `produkt`
  ADD PRIMARY KEY (`produkt_id`),
  ADD KEY `kategori` (`kategori_id`);

--
-- Indexes for table `status`
--
ALTER TABLE `status`
  ADD PRIMARY KEY (`status_id`);

--
-- Indexes for table `tilbageleveringstilstand`
--
ALTER TABLE `tilbageleveringstilstand`
  ADD PRIMARY KEY (`tilbageleveringstilstands_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `abonnementer`
--
ALTER TABLE `abonnementer`
  MODIFY `abonnement_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `arbejdstøj`
--
ALTER TABLE `arbejdstøj`
  MODIFY `tøj_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `brugere`
--
ALTER TABLE `brugere`
  MODIFY `bruger_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `kategori`
--
ALTER TABLE `kategori`
  MODIFY `kategori_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `kunde`
--
ALTER TABLE `kunde`
  MODIFY `kunde_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `kunde_abonnementer`
--
ALTER TABLE `kunde_abonnementer`
  MODIFY `kunde_abonnement_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;

--
-- AUTO_INCREMENT for table `produkt`
--
ALTER TABLE `produkt`
  MODIFY `produkt_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `status`
--
ALTER TABLE `status`
  MODIFY `status_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `tilbageleveringstilstand`
--
ALTER TABLE `tilbageleveringstilstand`
  MODIFY `tilbageleveringstilstands_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `arbejdstøj`
--
ALTER TABLE `arbejdstøj`
  ADD CONSTRAINT `kunde_arbejdstøj` FOREIGN KEY (`kunde_id`) REFERENCES `kunde` (`kunde_id`),
  ADD CONSTRAINT `produkt` FOREIGN KEY (`produkt_id`) REFERENCES `produkt` (`produkt_id`),
  ADD CONSTRAINT `status` FOREIGN KEY (`status_id`) REFERENCES `status` (`status_id`),
  ADD CONSTRAINT `tilbageleveringstilstand` FOREIGN KEY (`tilbageleveringstilstands_id`) REFERENCES `tilbageleveringstilstand` (`tilbageleveringstilstands_id`);

--
-- Constraints for table `kunde`
--
ALTER TABLE `kunde`
  ADD CONSTRAINT `butiks_id` FOREIGN KEY (`butikstilhørsforhold`) REFERENCES `brugere` (`bruger_id`);

--
-- Constraints for table `kunde_abonnementer`
--
ALTER TABLE `kunde_abonnementer`
  ADD CONSTRAINT `abonnement` FOREIGN KEY (`abonnement_id`) REFERENCES `abonnementer` (`abonnement_id`),
  ADD CONSTRAINT `kunde` FOREIGN KEY (`kunde_id`) REFERENCES `kunde` (`kunde_id`);

--
-- Constraints for table `produkt`
--
ALTER TABLE `produkt`
  ADD CONSTRAINT `kategori` FOREIGN KEY (`kategori_id`) REFERENCES `kategori` (`kategori_id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
