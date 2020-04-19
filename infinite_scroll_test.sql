-- phpMyAdmin SQL Dump
-- version 4.9.0.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Apr 19, 2020 at 12:12 PM
-- Server version: 10.4.6-MariaDB
-- PHP Version: 7.3.9

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `infinite_scroll_test`
--

-- --------------------------------------------------------

--
-- Table structure for table `conferences`
--

CREATE TABLE `conferences` (
  `id` int(11) NOT NULL,
  `conf_title` varchar(50) NOT NULL,
  `conf_subtitle` varchar(50) NOT NULL,
  `conf_desc` varchar(1000) NOT NULL,
  `conf_speaker` varchar(50) NOT NULL,
  `conf_date` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `conferences`
--

INSERT INTO `conferences` (`id`, `conf_title`, `conf_subtitle`, `conf_desc`, `conf_speaker`, `conf_date`) VALUES
(1, 'Artificial Intelligence', 'Inside the world of AI 1', 'A description of what the conference will be about. Should be short and captivating so that the users will want to click the \'read more\' link below.', 'Moses Adinfono', '20 Oct 2020'),
(2, 'Artificial Intelligence', 'Inside the world of AI 2', 'A description of what the conference will be about. Should be short and captivating so that the users will want to click the \'read more\' link below.', 'Caleb Adinfono', '21 Oct 2020'),
(3, 'Cyber Security', 'Threats and Prevention', 'A description of what the conference will be about. Should be short and captivating so that the users will want to click the \'read more\' link below.', 'Miebaka Wakama', '23 Oct 2020'),
(4, 'Computational Analysis', 'Computation for Big Data', 'A description of what the conference will be about. Should be short and captivating so that the users will want to click the \'read more\' link below.', 'Mike Fleming', '24 Oct 2020'),
(5, 'Using Big Words', 'Vocabulary without meaning', 'A description of what the conference will be about. Should be short and captivating so that the users will want to click the \'read more\' link below.', 'Lawrence Okene', '21 Oct 2020'),
(6, 'Story Telling', 'Story telling with Jide', 'A description of what the conference will be about. Should be short and captivating so that the users will want to click the \'read more\' link below.', 'Jide Kosoko', '21 Oct 2020'),
(7, 'Film Makiing', 'Film making 101', 'A description of what the conference will be about. Should be short and captivating so that the users will want to click the \'read more\' link below.', 'Tomiwa Abioye', '21 Oct 2020'),
(8, 'Film Makiing', 'Film making 102', 'A description of what the conference will be about. Should be short and captivating so that the users will want to click the \'read more\' link below.', 'Kayode Ayomide', '21 Oct 2020'),
(9, 'Leadership Development', 'Leadership development 101', 'A description of what the conference will be about. Should be short and captivating so that the users will want to click the \'read more\' link below.', 'Nana Terry', '21 Oct 2020'),
(10, 'Entrepreneurship Development', 'Come waste time with us', 'A description of what the conference will be about. Should be short and captivating so that the users will want to click the \'read more\' link below.', 'EDS guys', '21 Oct 2020'),
(11, 'Entrepreneurship Development', 'Come waste time with us 2', 'A description of what the conference will be about. Should be short and captivating so that the users will want to click the \'read more\' link below.', 'EDS guys', '21 Oct 2020');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `conferences`
--
ALTER TABLE `conferences`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `conferences`
--
ALTER TABLE `conferences`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
