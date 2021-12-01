-- phpMyAdmin SQL Dump
-- version 5.0.4
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Dec 01, 2021 at 08:21 PM
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

--
-- Indexes for dumped tables
--

--
-- Indexes for table `tilbageleveringstilstand`
--
ALTER TABLE `tilbageleveringstilstand`
  ADD PRIMARY KEY (`tilbageleveringstilstands_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `tilbageleveringstilstand`
--
ALTER TABLE `tilbageleveringstilstand`
  MODIFY `tilbageleveringstilstands_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
