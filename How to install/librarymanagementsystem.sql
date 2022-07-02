-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1:3306
-- Generation Time: Jul 02, 2022 at 03:05 PM
-- Server version: 5.7.31
-- PHP Version: 7.3.21

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `librarymanagementsystem`
--

-- --------------------------------------------------------

--
-- Table structure for table `administrator`
--

DROP TABLE IF EXISTS `administrator`;
CREATE TABLE IF NOT EXISTS `administrator` (
  `admUsername` varchar(20) NOT NULL,
  `firstName` varchar(50) NOT NULL,
  `lastName` varchar(50) NOT NULL,
  `nicNumber` varchar(12) NOT NULL,
  `phoneNumber` varchar(10) DEFAULT NULL,
  `password` varchar(50) NOT NULL,
  `admUsername2` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`admUsername`),
  UNIQUE KEY `nicNumber` (`nicNumber`),
  KEY `admUsername2` (`admUsername2`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `administrator`
--

INSERT INTO `administrator` (`admUsername`, `firstName`, `lastName`, `nicNumber`, `phoneNumber`, `password`, `admUsername2`) VALUES
('spiderman', 'Peter', 'Benjamin Parker', '971123856V', '0711236567', 'newpassword', NULL),
('deadpool', 'Wlade', 'Wilson', '912759768V', '075125768', 'wlade123', 'spiderman');

-- --------------------------------------------------------

--
-- Table structure for table `book`
--

DROP TABLE IF EXISTS `book`;
CREATE TABLE IF NOT EXISTS `book` (
  `ISBNnumber` varchar(13) NOT NULL,
  `bookName` varchar(100) NOT NULL,
  `authorName` varchar(100) DEFAULT NULL,
  `currentAvailability` varchar(13) DEFAULT NULL,
  `admUsername` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`ISBNnumber`),
  KEY `admUsername` (`admUsername`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `book`
--

INSERT INTO `book` (`ISBNnumber`, `bookName`, `authorName`, `currentAvailability`, `admUsername`) VALUES
('9780747532743', 'Harry Potter and the Philosopher\'s Stone', 'J. K. Rowling', 'Available', 'spiderman'),
('9789556950076', 'Madol Doova', 'Martin Wickramasinghe', 'Available', 'spiderman'),
('9789558415443', 'Ape Gama', 'Martin Wickramasinghe', 'Available', 'spiderman'),
('0142410314', 'Charlie and the Chocolate Factory', 'Roald Dahl', 'Available', 'spiderman'),
('9781473211537', 'Sword of Destiny', 'Andrzej Sapkowski', 'Available', 'spiderman'),
('9780316029193', 'Blood of Elves ', ' Andrzej Sapkowski', 'Available', 'spiderman'),
('9780439358064', 'Harry Potter and the Order of the Pheonix', 'J.K. Rowling', 'Available', 'spiderman'),
('9780439064866', 'Harry Potter and the Chamber of Secrets', 'J. K. Rowling', 'Available', 'spiderman');

-- --------------------------------------------------------

--
-- Table structure for table `issue`
--

DROP TABLE IF EXISTS `issue`;
CREATE TABLE IF NOT EXISTS `issue` (
  `mUsername` varchar(20) NOT NULL,
  `ISBNnumber` varchar(13) NOT NULL,
  `borrowDate` date NOT NULL,
  `dateToReturn` date DEFAULT NULL,
  `bookReturned` varchar(3) DEFAULT 'No',
  KEY `mUsername` (`mUsername`),
  KEY `ISBNnumber` (`ISBNnumber`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `issue`
--

INSERT INTO `issue` (`mUsername`, `ISBNnumber`, `borrowDate`, `dateToReturn`, `bookReturned`) VALUES
('hulk', '9780747532743', '2022-03-28', '2022-04-28', 'Yes'),
('hulk', '9780747532743', '2022-03-28', '2022-04-28', 'Yes'),
('batman', '9789556950076', '2022-06-23', '2022-07-23', 'Yes'),
('spiderwoman', '9780747532743', '2022-06-23', '2022-07-23', 'Yes'),
('hulk', '9781473211537', '2022-06-23', '2022-07-23', 'Yes'),
('spiderwoman', '9780316029193', '2022-06-23', '2022-07-23', 'Yes'),
('spiderwoman', '0142410314', '2022-06-23', '2022-07-23', 'Yes'),
('spiderwoman', '9789558415443', '2022-07-02', '2022-08-02', 'Yes'),
('batman', '0142410314', '2022-07-02', '2022-08-02', 'Yes'),
('batman', '9781473211537', '2022-07-02', '2022-08-02', 'Yes');

-- --------------------------------------------------------

--
-- Table structure for table `member`
--

DROP TABLE IF EXISTS `member`;
CREATE TABLE IF NOT EXISTS `member` (
  `mUsername` varchar(20) NOT NULL,
  `firstName` varchar(50) NOT NULL,
  `lastName` varchar(50) NOT NULL,
  `nicNumber` varchar(12) NOT NULL,
  `phoneNumber` varchar(10) DEFAULT NULL,
  `password` varchar(50) NOT NULL,
  `bookToReturn` varchar(3) DEFAULT NULL,
  `admUsername` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`mUsername`),
  UNIQUE KEY `nicNumber` (`nicNumber`),
  KEY `admUsername` (`admUsername`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `member`
--

INSERT INTO `member` (`mUsername`, `firstName`, `lastName`, `nicNumber`, `phoneNumber`, `password`, `bookToReturn`, `admUsername`) VALUES
('spiderwoman', 'Gwendolyne Maxine', 'Stacy', '978456789V', '0718367531', 'gwens123', 'No', 'spiderman'),
('batman', 'Bruce', 'Wayne', '199975638784', '0718465795', 'bruce123', 'No', 'spiderman'),
('hulk', 'Bruce', 'Banner', '974648789V', '0715625833', 'bruce123', 'No', 'spiderman');
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
