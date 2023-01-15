-- phpMyAdmin SQL Dump
-- version 5.0.4
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: Jan 15, 2023 at 04:18 PM
-- Server version: 10.4.17-MariaDB
-- PHP Version: 7.4.15

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `androidh_fluttertraining`
--

-- --------------------------------------------------------

--
-- Table structure for table `messageUng`
--

CREATE TABLE `messageUng` (
  `id` int(11) NOT NULL,
  `avatar` text COLLATE utf8_unicode_ci NOT NULL,
  `name` text COLLATE utf8_unicode_ci NOT NULL,
  `message` text COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `messageUng`
--

INSERT INTO `messageUng` (`id`, `avatar`, `name`, `message`) VALUES
(1, 'https://www.androidthai.in.th/fluttertraining/ung/avatar244.jpg', 'มาสเตอร์ อึ่ง', 'Test Message1'),
(2, 'https://www.androidthai.in.th/fluttertraining/ung/avatar244.jpg', 'มาสเตอร์ อึ่ง', 'Test Message2'),
(3, 'https://www.androidthai.in.th/fluttertraining/ung/avatar295.jpg', 'Doramon', 'doramon 1'),
(4, 'https://www.androidthai.in.th/fluttertraining/ung/avatar295.jpg', 'Doramon', 'doramon 2'),
(5, 'https://www.androidthai.in.th/fluttertraining/ung/avatar244.jpg', 'มาสเตอร์ อึ่ง', 'Master Test3'),
(6, 'https://www.androidthai.in.th/fluttertraining/ung/avatar244.jpg', 'มาสเตอร์ อึ่ง', 'Master Test4'),
(7, 'https://www.androidthai.in.th/fluttertraining/ung/avatar244.jpg', 'มาสเตอร์ อึ่ง', 'Master Test5'),
(8, 'https://www.androidthai.in.th/fluttertraining/ung/avatar244.jpg', 'มาสเตอร์ อึ่ง', 'Master Test5');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `messageUng`
--
ALTER TABLE `messageUng`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `messageUng`
--
ALTER TABLE `messageUng`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
