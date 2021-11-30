-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: us-cdbr-east-04.cleardb.com
-- Generation Time: Nov 30, 2021 at 01:07 AM
-- Server version: 5.6.50-log
-- PHP Version: 7.3.31

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `heroku_f98ed29c46af889`
--

-- --------------------------------------------------------

--
-- Table structure for table `consumes`
--

CREATE TABLE `consumes` (
  `username` varchar(20) NOT NULL,
  `entry_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `consumes`
--

INSERT INTO `consumes` (`username`, `entry_id`) VALUES
('vi', 55),
('vi', 65),
('aczhu2', 75),
('aczhu2', 85),
('Geetanjali', 95),
('aczhu2', 105),
('sindhu', 115),
('sindhu', 135),
('erick', 145),
('aczhu', 155),
('aczhu', 165),
('aczhu', 175);

-- --------------------------------------------------------

--
-- Table structure for table `does`
--

CREATE TABLE `does` (
  `username` varchar(20) NOT NULL,
  `exercise_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `does`
--

INSERT INTO `does` (`username`, `exercise_id`) VALUES
('aczhu', 45),
('aczhu', 55),
('Geetanjali', 25),
('sindhu', 35),
('vi', 0),
('vi', 5),
('vi', 15);

-- --------------------------------------------------------

--
-- Table structure for table `exercise`
--

CREATE TABLE `exercise` (
  `exercise_id` int(11) NOT NULL,
  `activity_type` varchar(20) NOT NULL,
  `date` date NOT NULL,
  `time_spent` int(11) NOT NULL,
  `calories` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `exercise`
--

INSERT INTO `exercise` (`exercise_id`, `activity_type`, `date`, `time_spent`, `calories`) VALUES
(15, 'running', '2021-11-29', 60, 100),
(25, 'running', '2021-11-29', 20000, 300000),
(35, 'walking', '2021-11-29', -20, -20),
(45, 'running', '2021-11-30', 12, 12),
(55, 'running', '2021-11-30', 12, 10);

-- --------------------------------------------------------

--
-- Table structure for table `food`
--

CREATE TABLE `food` (
  `entry_id` int(11) NOT NULL,
  `food_item` varchar(20) NOT NULL,
  `date` date NOT NULL,
  `quantity` int(11) NOT NULL,
  `calories` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `food`
--

INSERT INTO `food` (`entry_id`, `food_item`, `date`, `quantity`, `calories`) VALUES
(5, 'apple', '2021-11-29', 1, 70),
(15, 'apple', '2021-11-29', 1, 70),
(25, 'apple', '2021-11-29', 1, 70),
(35, 'apple', '2021-11-29', 1, 70),
(55, 'pasta', '2021-11-29', 1, 200),
(65, 'apple', '2021-11-29', 1, 70),
(75, 'Pizza', '2021-11-29', 1, 2),
(85, 'Apples', '2021-11-29', 2, 1),
(95, 'bread', '2021-11-29', 400, 3000),
(105, 'hei', '2021-11-29', 1, 1),
(115, 'cupcake', '2021-11-29', -10, -10),
(135, 'food', '2021-11-29', 1, 1),
(145, 'yam', '2021-11-29', 1, 0),
(155, 'running', '2021-11-30', 20, 10),
(165, 'Pizza', '2021-11-30', 3, 4),
(175, 'Pizza', '2021-11-30', 1, 50);

-- --------------------------------------------------------

--
-- Table structure for table `goals`
--

CREATE TABLE `goals` (
  `goal_id` int(11) NOT NULL,
  `type` varchar(10) NOT NULL,
  `details` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `goals`
--

INSERT INTO `goals` (`goal_id`, `type`, `details`) VALUES
(25, 'Food', 'eat more veg'),
(35, 'Exercise', 'walk'),
(45, 'Food', 'eat greens'),
(65, 'Food', 'hi'),
(75, 'Food', 'ehi');

-- --------------------------------------------------------

--
-- Table structure for table `has_goals`
--

CREATE TABLE `has_goals` (
  `goal_id` int(11) NOT NULL,
  `username` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `has_goals`
--

INSERT INTO `has_goals` (`goal_id`, `username`) VALUES
(25, 'vi'),
(35, 'Geetanjali'),
(45, 'Geetanjali'),
(65, 'aczhu'),
(75, 'aczhu');

-- --------------------------------------------------------

--
-- Table structure for table `health_guidelines`
--

CREATE TABLE `health_guidelines` (
  `age` int(11) NOT NULL,
  `gender` varchar(1) NOT NULL,
  `activity_level` int(11) NOT NULL,
  `recommended_calories` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `health_guidelines`
--

INSERT INTO `health_guidelines` (`age`, `gender`, `activity_level`, `recommended_calories`) VALUES
(4, 'F', 1, 1200),
(4, 'F', 2, 1500),
(4, 'F', 3, 1600),
(4, 'M', 1, 1400),
(4, 'M', 2, 1500),
(4, 'M', 3, 1800),
(5, 'F', 1, 1200),
(5, 'F', 2, 1500),
(5, 'F', 3, 1600),
(5, 'M', 1, 1400),
(5, 'M', 2, 1500),
(5, 'M', 3, 1800),
(6, 'F', 1, 1200),
(6, 'F', 2, 1500),
(6, 'F', 3, 1600),
(6, 'M', 1, 1400),
(6, 'M', 2, 1500),
(6, 'M', 3, 1800),
(7, 'F', 1, 1200),
(7, 'F', 2, 1500),
(7, 'F', 3, 1600),
(7, 'M', 1, 1400),
(7, 'M', 2, 1500),
(7, 'M', 3, 1800),
(8, 'F', 1, 1200),
(8, 'F', 2, 1500),
(8, 'F', 3, 1600),
(8, 'M', 1, 1400),
(8, 'M', 2, 1500),
(8, 'M', 3, 1800),
(9, 'F', 1, 1600),
(9, 'F', 2, 1800),
(9, 'F', 3, 2000),
(9, 'M', 1, 1800),
(9, 'M', 2, 2000),
(9, 'M', 3, 2300),
(10, 'F', 1, 1600),
(10, 'F', 2, 1800),
(10, 'F', 3, 2000),
(10, 'M', 1, 1800),
(10, 'M', 2, 2000),
(10, 'M', 3, 2300),
(11, 'F', 1, 1600),
(11, 'F', 2, 1800),
(11, 'F', 3, 2000),
(11, 'M', 1, 1800),
(11, 'M', 2, 2000),
(11, 'M', 3, 2300),
(12, 'F', 1, 1600),
(12, 'F', 2, 1800),
(12, 'F', 3, 2000),
(12, 'M', 1, 1800),
(12, 'M', 2, 2000),
(12, 'M', 3, 2300),
(13, 'F', 1, 1600),
(13, 'F', 2, 1800),
(13, 'F', 3, 2000),
(13, 'M', 1, 1800),
(13, 'M', 2, 2000),
(13, 'M', 3, 2300),
(14, 'F', 1, 1800),
(14, 'F', 2, 2000),
(14, 'F', 3, 2400),
(14, 'M', 1, 2200),
(14, 'M', 2, 2600),
(14, 'M', 3, 3000),
(15, 'F', 1, 1800),
(15, 'F', 2, 2000),
(15, 'F', 3, 2400),
(15, 'M', 1, 2200),
(15, 'M', 2, 2600),
(15, 'M', 3, 3000),
(16, 'F', 1, 1800),
(16, 'F', 2, 2000),
(16, 'F', 3, 2400),
(16, 'M', 1, 2200),
(16, 'M', 2, 2600),
(16, 'M', 3, 3000),
(17, 'F', 1, 1800),
(17, 'F', 2, 2000),
(17, 'F', 3, 2400),
(17, 'M', 1, 2200),
(17, 'M', 2, 2600),
(17, 'M', 3, 3000),
(18, 'F', 1, 1800),
(18, 'F', 2, 2000),
(18, 'F', 3, 2400),
(18, 'M', 1, 2200),
(18, 'M', 2, 2600),
(18, 'M', 3, 3000),
(19, 'F', 1, 2000),
(19, 'F', 2, 2100),
(19, 'F', 3, 2400),
(19, 'M', 1, 2400),
(19, 'M', 2, 2700),
(19, 'M', 3, 3000),
(20, 'F', 1, 2000),
(21, 'F', 1, 2000),
(21, 'F', 2, 2100),
(21, 'F', 3, 2400),
(21, 'M', 1, 2400),
(21, 'M', 2, 2700),
(21, 'M', 3, 3000),
(22, 'F', 1, 2000),
(22, 'F', 2, 2100),
(22, 'F', 3, 2400),
(22, 'M', 1, 2400),
(22, 'M', 2, 2700),
(22, 'M', 3, 3000),
(23, 'F', 1, 2000),
(23, 'F', 2, 2100),
(23, 'F', 3, 2400),
(23, 'M', 1, 2400),
(23, 'M', 2, 2700),
(23, 'M', 3, 3000),
(24, 'F', 1, 2000),
(24, 'F', 2, 2100),
(24, 'F', 3, 2400),
(24, 'M', 1, 2400),
(24, 'M', 2, 2700),
(24, 'M', 3, 3000),
(25, 'F', 1, 2000),
(25, 'F', 2, 2100),
(25, 'F', 3, 2400),
(25, 'M', 1, 2400),
(25, 'M', 2, 2700),
(25, 'M', 3, 3000),
(26, 'F', 1, 2000),
(26, 'F', 2, 2100),
(26, 'F', 3, 2400),
(26, 'M', 1, 2400),
(26, 'M', 2, 2700),
(26, 'M', 3, 3000),
(27, 'F', 1, 2000),
(27, 'F', 2, 2100),
(27, 'F', 3, 2400),
(27, 'M', 1, 2400),
(27, 'M', 2, 2700),
(27, 'M', 3, 3000),
(28, 'F', 1, 2000),
(28, 'F', 2, 2100),
(28, 'F', 3, 2400),
(28, 'M', 1, 2400),
(28, 'M', 2, 2700),
(28, 'M', 3, 3000),
(29, 'F', 1, 2000),
(29, 'F', 2, 2100),
(29, 'F', 3, 2400),
(29, 'M', 1, 2400),
(29, 'M', 2, 2700),
(29, 'M', 3, 3000),
(30, 'F', 1, 2000),
(30, 'F', 2, 2100),
(30, 'F', 3, 2400),
(30, 'M', 1, 2400),
(30, 'M', 2, 2700),
(30, 'M', 3, 3000),
(31, 'F', 1, 1800),
(31, 'F', 2, 2000),
(31, 'F', 3, 2200),
(31, 'M', 1, 2400),
(31, 'M', 2, 2700),
(31, 'M', 3, 3000),
(32, 'F', 1, 1800),
(32, 'F', 2, 2000),
(32, 'F', 3, 2200),
(32, 'M', 1, 2400),
(32, 'M', 2, 2700),
(32, 'M', 3, 3000),
(33, 'F', 1, 1800),
(33, 'F', 2, 2000),
(33, 'F', 3, 2200),
(33, 'M', 1, 2400),
(33, 'M', 2, 2700),
(33, 'M', 3, 3000),
(34, 'F', 1, 1800),
(34, 'F', 2, 2000),
(34, 'F', 3, 2200),
(34, 'M', 1, 2400),
(34, 'M', 2, 2700),
(34, 'M', 3, 3000),
(35, 'F', 1, 1800),
(35, 'F', 2, 2000),
(35, 'F', 3, 2200),
(35, 'M', 1, 2400),
(35, 'M', 2, 2700),
(35, 'M', 3, 3000),
(36, 'F', 1, 1800),
(36, 'F', 2, 2000),
(36, 'F', 3, 2200),
(36, 'M', 1, 2400),
(36, 'M', 2, 2700),
(36, 'M', 3, 3000),
(37, 'F', 1, 1800),
(37, 'F', 2, 2000),
(37, 'F', 3, 2200),
(37, 'M', 1, 2400),
(37, 'M', 2, 2700),
(37, 'M', 3, 3000),
(38, 'F', 1, 1800),
(38, 'F', 2, 2000),
(38, 'F', 3, 2200),
(38, 'M', 1, 2400),
(38, 'M', 2, 2700),
(38, 'M', 3, 3000),
(39, 'F', 1, 1800),
(39, 'F', 2, 2000),
(39, 'F', 3, 2200),
(39, 'M', 1, 2400),
(39, 'M', 2, 2700),
(39, 'M', 3, 3000),
(40, 'F', 1, 1800),
(40, 'F', 2, 2000),
(40, 'F', 3, 2200),
(40, 'M', 1, 2400),
(40, 'M', 2, 2700),
(40, 'M', 3, 3000),
(41, 'F', 1, 1800),
(41, 'F', 2, 2000),
(41, 'F', 3, 2200),
(41, 'M', 1, 2400),
(41, 'M', 2, 2700),
(41, 'M', 3, 3000),
(42, 'F', 1, 1800),
(42, 'F', 2, 2000),
(42, 'F', 3, 2200),
(42, 'M', 1, 2400),
(42, 'M', 2, 2700),
(42, 'M', 3, 3000),
(43, 'F', 1, 1800),
(43, 'F', 2, 2000),
(43, 'F', 3, 2200),
(43, 'M', 1, 2400),
(43, 'M', 2, 2700),
(43, 'M', 3, 3000),
(44, 'F', 1, 1800),
(44, 'F', 2, 2000),
(44, 'F', 3, 2200),
(44, 'M', 1, 2400),
(44, 'M', 2, 2700),
(44, 'M', 3, 3000),
(45, 'F', 1, 1800),
(45, 'F', 2, 2000),
(45, 'F', 3, 2200),
(45, 'M', 1, 2400),
(45, 'M', 2, 2700),
(45, 'M', 3, 3000),
(46, 'F', 1, 1800),
(46, 'F', 2, 2000),
(46, 'F', 3, 2200),
(46, 'M', 1, 2400),
(46, 'M', 2, 2700),
(46, 'M', 3, 3000),
(47, 'F', 1, 1800),
(47, 'F', 2, 2000),
(47, 'F', 3, 2200),
(47, 'M', 1, 2400),
(47, 'M', 2, 2700),
(47, 'M', 3, 3000),
(48, 'F', 1, 1800),
(48, 'F', 2, 2000),
(48, 'F', 3, 2200),
(48, 'M', 1, 2400),
(48, 'M', 2, 2700),
(48, 'M', 3, 3000),
(49, 'F', 1, 1800),
(49, 'F', 2, 2000),
(49, 'F', 3, 2200),
(49, 'M', 1, 2400),
(49, 'M', 2, 2700),
(49, 'M', 3, 3000),
(50, 'F', 1, 1800),
(50, 'F', 2, 2000),
(50, 'F', 3, 2200),
(50, 'M', 1, 2400),
(50, 'M', 2, 2700),
(50, 'M', 3, 3000),
(51, 'F', 1, 1600),
(51, 'F', 2, 1800),
(51, 'F', 3, 2100),
(51, 'M', 1, 2000),
(51, 'M', 2, 2300),
(51, 'M', 3, 2600),
(52, 'F', 1, 1600),
(52, 'F', 2, 1800),
(52, 'F', 3, 2100),
(52, 'M', 1, 2000),
(52, 'M', 2, 2300),
(52, 'M', 3, 2600),
(53, 'F', 1, 1600),
(53, 'F', 2, 1800),
(53, 'F', 3, 2100),
(53, 'M', 1, 2000),
(53, 'M', 2, 2300),
(53, 'M', 3, 2600),
(54, 'F', 1, 1600),
(54, 'F', 2, 1800),
(54, 'F', 3, 2100),
(54, 'M', 1, 2000),
(54, 'M', 2, 2300),
(54, 'M', 3, 2600),
(55, 'F', 1, 1600),
(55, 'F', 2, 1800),
(55, 'F', 3, 2100),
(55, 'M', 1, 2000),
(55, 'M', 2, 2300),
(55, 'M', 3, 2600),
(56, 'F', 1, 1600),
(56, 'F', 2, 1800),
(56, 'F', 3, 2100),
(56, 'M', 1, 2000),
(56, 'M', 2, 2300),
(56, 'M', 3, 2600),
(57, 'F', 1, 1600),
(57, 'F', 2, 1800),
(57, 'F', 3, 2100),
(57, 'M', 1, 2000),
(57, 'M', 2, 2300),
(57, 'M', 3, 2600),
(58, 'F', 1, 1600),
(58, 'F', 2, 1800),
(58, 'F', 3, 2100),
(58, 'M', 1, 2000),
(58, 'M', 2, 2300),
(58, 'M', 3, 2600),
(59, 'F', 1, 1600),
(59, 'F', 2, 1800),
(59, 'F', 3, 2100),
(59, 'M', 1, 2000),
(59, 'M', 2, 2300),
(59, 'M', 3, 2600),
(60, 'F', 1, 1600),
(60, 'F', 2, 1800),
(60, 'F', 3, 2100),
(60, 'M', 1, 2000),
(60, 'M', 2, 2300),
(60, 'M', 3, 2600),
(61, 'F', 1, 1600),
(61, 'F', 2, 1800),
(61, 'F', 3, 2100),
(61, 'M', 1, 2000),
(61, 'M', 2, 2300),
(61, 'M', 3, 2600),
(62, 'F', 1, 1600),
(62, 'F', 2, 1800),
(62, 'F', 3, 2100),
(62, 'M', 1, 2000),
(62, 'M', 2, 2300),
(62, 'M', 3, 2600),
(63, 'F', 1, 1600),
(63, 'F', 2, 1800),
(63, 'F', 3, 2100),
(63, 'M', 1, 2000),
(63, 'M', 2, 2300),
(63, 'M', 3, 2600),
(64, 'F', 1, 1600),
(64, 'F', 2, 1800),
(64, 'F', 3, 2100),
(64, 'M', 1, 2000),
(64, 'M', 2, 2300),
(64, 'M', 3, 2600),
(65, 'F', 1, 1600),
(65, 'F', 2, 1800),
(65, 'F', 3, 2100),
(65, 'M', 1, 2000),
(65, 'M', 2, 2300),
(65, 'M', 3, 2600),
(66, 'F', 1, 1600),
(66, 'F', 2, 1800),
(66, 'F', 3, 2100),
(66, 'M', 1, 2000),
(66, 'M', 2, 2300),
(66, 'M', 3, 2600),
(67, 'F', 1, 1600),
(67, 'F', 2, 1800),
(67, 'F', 3, 2100),
(67, 'M', 1, 2000),
(67, 'M', 2, 2300),
(67, 'M', 3, 2600),
(68, 'F', 1, 1600),
(68, 'F', 2, 1800),
(68, 'F', 3, 2100),
(68, 'M', 1, 2000),
(68, 'M', 2, 2300),
(68, 'M', 3, 2600),
(69, 'F', 1, 1600),
(69, 'F', 2, 1800),
(69, 'F', 3, 2100),
(69, 'M', 1, 2000),
(69, 'M', 2, 2300),
(69, 'M', 3, 2600),
(70, 'F', 1, 1600),
(70, 'F', 2, 1800),
(70, 'F', 3, 2100),
(70, 'M', 1, 2000),
(70, 'M', 2, 2300),
(70, 'M', 3, 2600),
(71, 'F', 1, 1600),
(71, 'F', 2, 1800),
(71, 'F', 3, 2100),
(71, 'M', 1, 2000),
(71, 'M', 2, 2300),
(71, 'M', 3, 2600),
(72, 'F', 1, 1600),
(72, 'F', 2, 1800),
(72, 'F', 3, 2100),
(72, 'M', 1, 2000),
(72, 'M', 2, 2300),
(72, 'M', 3, 2600),
(73, 'F', 1, 1600),
(73, 'F', 2, 1800),
(73, 'F', 3, 2100),
(73, 'M', 1, 2000),
(73, 'M', 2, 2300),
(73, 'M', 3, 2600),
(74, 'F', 1, 1600),
(74, 'F', 2, 1800),
(74, 'F', 3, 2100),
(74, 'M', 1, 2000),
(74, 'M', 2, 2300),
(74, 'M', 3, 2600),
(75, 'F', 1, 1600),
(75, 'F', 2, 1800),
(75, 'F', 3, 2100),
(75, 'M', 1, 2000),
(75, 'M', 2, 2300),
(75, 'M', 3, 2600),
(76, 'F', 1, 1600),
(76, 'F', 2, 1800),
(76, 'F', 3, 2100),
(76, 'M', 1, 2000),
(76, 'M', 2, 2300),
(76, 'M', 3, 2600),
(77, 'F', 1, 1600),
(77, 'F', 2, 1800),
(77, 'F', 3, 2100),
(77, 'M', 1, 2000),
(77, 'M', 2, 2300),
(77, 'M', 3, 2600),
(78, 'F', 1, 1600),
(78, 'F', 2, 1800),
(78, 'F', 3, 2100),
(78, 'M', 1, 2000),
(78, 'M', 2, 2300),
(78, 'M', 3, 2600),
(79, 'F', 1, 1600),
(79, 'F', 2, 1800),
(79, 'F', 3, 2100),
(79, 'M', 1, 2000),
(79, 'M', 2, 2300),
(79, 'M', 3, 2600),
(80, 'F', 1, 1600),
(80, 'F', 2, 1800),
(80, 'F', 3, 2100),
(80, 'M', 1, 2000),
(80, 'M', 2, 2300),
(80, 'M', 3, 2600),
(81, 'F', 1, 1600),
(81, 'F', 2, 1800),
(81, 'F', 3, 2100),
(81, 'M', 1, 2000),
(81, 'M', 2, 2300),
(81, 'M', 3, 2600),
(82, 'F', 1, 1600),
(82, 'F', 2, 1800),
(82, 'F', 3, 2100),
(82, 'M', 1, 2000),
(82, 'M', 2, 2300),
(82, 'M', 3, 2600),
(83, 'F', 1, 1600),
(83, 'F', 2, 1800),
(83, 'F', 3, 2100),
(83, 'M', 1, 2000),
(83, 'M', 2, 2300),
(83, 'M', 3, 2600),
(84, 'F', 1, 1600),
(84, 'F', 2, 1800),
(84, 'F', 3, 2100),
(84, 'M', 1, 2000),
(84, 'M', 2, 2300),
(84, 'M', 3, 2600),
(85, 'F', 1, 1600),
(85, 'F', 2, 1800),
(85, 'F', 3, 2100),
(85, 'M', 1, 2000),
(85, 'M', 2, 2300),
(85, 'M', 3, 2600),
(86, 'F', 1, 1600),
(86, 'F', 2, 1800),
(86, 'F', 3, 2100),
(86, 'M', 1, 2000),
(86, 'M', 2, 2300),
(86, 'M', 3, 2600),
(87, 'F', 1, 1600),
(87, 'F', 2, 1800),
(87, 'F', 3, 2100),
(87, 'M', 1, 2000),
(87, 'M', 2, 2300),
(87, 'M', 3, 2600),
(88, 'F', 1, 1600),
(88, 'F', 2, 1800),
(88, 'F', 3, 2100),
(88, 'M', 1, 2000),
(88, 'M', 2, 2300),
(88, 'M', 3, 2600),
(89, 'F', 1, 1600),
(89, 'F', 2, 1800),
(89, 'F', 3, 2100),
(89, 'M', 1, 2000),
(89, 'M', 2, 2300),
(89, 'M', 3, 2600),
(90, 'F', 1, 1600),
(90, 'F', 2, 1800),
(90, 'F', 3, 2100),
(90, 'M', 1, 2000),
(90, 'M', 2, 2300),
(90, 'M', 3, 2600),
(91, 'F', 1, 1600),
(91, 'F', 2, 1800),
(91, 'F', 3, 2100),
(91, 'M', 1, 2000),
(91, 'M', 2, 2300),
(91, 'M', 3, 2600),
(92, 'F', 1, 1600),
(92, 'F', 2, 1800),
(92, 'F', 3, 2100),
(92, 'M', 1, 2000),
(92, 'M', 2, 2300),
(92, 'M', 3, 2600),
(93, 'F', 1, 1600),
(93, 'F', 2, 1800),
(93, 'F', 3, 2100),
(93, 'M', 1, 2000),
(93, 'M', 2, 2300),
(93, 'M', 3, 2600),
(94, 'F', 1, 1600),
(94, 'F', 2, 1800),
(94, 'F', 3, 2100),
(94, 'M', 1, 2000),
(94, 'M', 2, 2300),
(94, 'M', 3, 2600),
(95, 'F', 1, 1600),
(95, 'F', 2, 1800),
(95, 'F', 3, 2100),
(95, 'M', 1, 2000),
(95, 'M', 2, 2300),
(95, 'M', 3, 2600),
(96, 'F', 1, 1600),
(96, 'F', 2, 1800),
(96, 'F', 3, 2100),
(96, 'M', 1, 2000),
(96, 'M', 2, 2300),
(96, 'M', 3, 2600),
(97, 'F', 1, 1600),
(97, 'F', 2, 1800),
(97, 'F', 3, 2100),
(97, 'M', 1, 2000),
(97, 'M', 2, 2300),
(97, 'M', 3, 2600),
(98, 'F', 1, 1600),
(98, 'F', 2, 1800),
(98, 'F', 3, 2100),
(98, 'M', 1, 2000),
(98, 'M', 2, 2300),
(98, 'M', 3, 2600),
(99, 'F', 1, 1600),
(99, 'F', 2, 1800),
(99, 'F', 3, 2100),
(99, 'M', 1, 2000),
(99, 'M', 2, 2300),
(99, 'M', 3, 2600),
(100, 'F', 1, 1600),
(100, 'F', 2, 1800),
(100, 'F', 3, 2100),
(100, 'M', 1, 2000),
(100, 'M', 2, 2300),
(100, 'M', 3, 2600);

-- --------------------------------------------------------

--
-- Table structure for table `login_credentials`
--

CREATE TABLE `login_credentials` (
  `username` varchar(20) NOT NULL,
  `password` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `login_credentials`
--

INSERT INTO `login_credentials` (`username`, `password`) VALUES
('aczhu', '$2y$10$q8RaV/UPQa0eLnwrUa10ZulbuI9HQ3ef5lJ5tMX00HIdaPli.F35G'),
('aczhu2', '$2y$10$dmTYwVQKt9wr9pKikod0K.rPXjQiCyXOWcb2KzA9sp99Yc0RVgHoi'),
('bertham', '$2y$10$e13V/in0dIvrnRV96s4G6uSnMfuWathwJlRUxBeroeoutFXg5I75q'),
('bobb3', '$2y$10$7fiZCN1TtvVXMzpQEjuezuwhRIDi89uxKSZEv88Y19ttnyZOQoFFW'),
('bobb4', '$2y$10$kXXhmPQrORa6QpJLYnjR4e/kWgScseXTWlwLSf.hNnujpvvwM2MDu'),
('bobby', '$2y$10$N0TSdwJMARfZRR4Dty7WSuzyMcbBIy.1aT6l1qr5NoskEWt6FP7Wu'),
('bobby1', '$2y$10$TBsTX2L7S8kxW5Io53nPE.IrBZ.lHuVwugRsjOHetsiGJe0Rciy1O'),
('d', '$2y$10$.sbyH3cJPLhH0TAD8lJX1O/ljzdPNu0vhVNqdIuAmLfgRnJikNhZy'),
('erick', '$2y$10$4D7APdkMR9umoUMpYdKoWecuIqfr9APmzQKroWbUPNNS68pkethB6'),
('erick10', '$2y$10$.S8im1ljOHE9XD6Yb4r0v.5budtOdc6bQKo6ArucO2wBICeMEOj.K'),
('erick11', '$2y$10$vCGIyFLiYspGKXTSFR4JWOuk8OIJNvGr6fTKtNIQEGJayUh2Rk8pO'),
('erick12', '$2y$10$tCwBVbTBFp7lpNYZrDbkQej7madfDsT.cPHlsglXVnILHS20SrB4O'),
('erick2', '$2y$10$GXljMwbJlDTwFCCbdP43W.TAfJA8z58l94FyTpj6bjAYtj2uCnNP2'),
('erick3', '$2y$10$S2E.250G0nJ3k5DT5GRt7.oUCXh3Guzrd.1dVnzdp8TXVlJw20P9a'),
('erick4', '$2y$10$1SE49sMl4IHvmTFkF6J3me2yiSwqcel4eMrJQeE.NeX3Loq4F1YEK'),
('erick5', '$2y$10$i56QsPQ4m3lZTw.361ibeOSbOcm3dJWFqx1cSJEMB8Tg3zKGuWVxG'),
('erick6', '$2y$10$OLI0NdRtAdjP912cJYE.8uHpCiMBXoMAwCErjjO0/An00MXwncQgi'),
('erick7', '$2y$10$sGwbtVJNLbXgNYZN8MwjmOS4stX6YFcEF5Lc5z9/LGvMV.N56S1Pi'),
('erick8', '$2y$10$WlfMTzDqLMdP6IotCwZIP.nUjiyBFkf.fJvFsOtGDz/xJu/.97mFG'),
('erick9', '$2y$10$pbv87/FMa5c0k26tHgdnKObpq5Kir6JmgR6upb12V7fU9qan9V0vu'),
('Geetanjali', '$2y$10$CNlWPQ4GPTd5MEeCDcfCv.hgOeNlO4HA7yTp.3FPSoew7UYb3olR.'),
('p', '$2y$10$aYk1u1Rt7LP3jqyZuYB5Hu0gVcvGVURcc0DP83kiJMgdnYu4MjviO'),
('s', '$2y$10$opYNRIbT5ldTet9eWhVCguC1wEXnfN4K4Gg/rbz9RvCNUfSNvLN0m'),
('sindhu', '$2y$10$S4Qzr/Qyqm.0KshyxXsJlOjOP/6U5rISj4x1s9f4clMIIrUhY1NrK'),
('vi', '$2y$10$D0YJXRpmrt3fuzZH3Xx8k.zIW332uGXAFmAQx3sGzhihnoCiTqQ0.'),
('vi2', '$2y$10$fWQ4HYv5I0KMOn.eteKxvegMB3F2w0FNmDiA8o7tbcNTNjBHdLV4K');

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE `user` (
  `username` varchar(20) NOT NULL,
  `name` varchar(20) NOT NULL,
  `activity_level` int(11) NOT NULL,
  `gender` varchar(1) NOT NULL,
  `birthday` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`username`, `name`, `activity_level`, `gender`, `birthday`) VALUES
('aczhu', 'Annie Zhu', 0, 'F', '2001-07-05'),
('aczhu2', 'Annie', 2, 'F', '1998-01-14'),
('bertham', 'Bertham Washington', 0, 'M', '2001-07-05'),
('bobb3', 'Annie Chen', 1, 'M', '2021-10-05'),
('bobb4', 'Annie Chen', 1, 'M', '2021-10-05'),
('bobby', 'bobby', 1, 'M', '2021-11-24'),
('bobby1', 'Annie Chen', 1, 'M', '2021-10-05'),
('d', 'sindhu', 1, '', '2001-11-23'),
('erick', 'Erick', 0, 'M', '2001-10-04'),
('erick10', 'Erick', 1, 'M', '2001-10-04'),
('erick11', 'Erick', 1, 'M', '2001-10-04'),
('erick12', 'Erick', 1, 'M', '2001-10-04'),
('erick2', 'Erick', 1, '', '2001-10-04'),
('erick3', 'Erick', 1, '', '2001-10-04'),
('erick4', 'ERICKAAAAAAA', 1, '', '2001-10-04'),
('erick5', 'ERICKAAAAAAA', 1, '', '2001-10-04'),
('erick6', 'ERICKAAAAAAA', 1, '', '2001-10-04'),
('erick7', 'ERICKAAAAAAA', 1, '', '2001-10-04'),
('erick8', 'Erick', 1, 'M', '2001-10-04'),
('erick9', 'Erick', 1, 'M', '2001-10-04'),
('Geetanjali', 'Geetanjali', 1, 'M', '2001-04-11'),
('p', 'sindhu', 1, '', '2001-11-23'),
('s', 'sindhu', 1, '', '2001-11-23'),
('sindhu', 'sindhu', 1, 'M', '2001-11-23'),
('vi', 'Vi', 2, 'F', '2000-09-07'),
('vi2', 'vi', 1, '', '2001-11-23');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `consumes`
--
ALTER TABLE `consumes`
  ADD PRIMARY KEY (`username`,`entry_id`),
  ADD KEY `consumes_ibfk_2` (`entry_id`);

--
-- Indexes for table `does`
--
ALTER TABLE `does`
  ADD PRIMARY KEY (`username`,`exercise_id`);

--
-- Indexes for table `exercise`
--
ALTER TABLE `exercise`
  ADD PRIMARY KEY (`exercise_id`);

--
-- Indexes for table `food`
--
ALTER TABLE `food`
  ADD PRIMARY KEY (`entry_id`);

--
-- Indexes for table `goals`
--
ALTER TABLE `goals`
  ADD PRIMARY KEY (`goal_id`);

--
-- Indexes for table `has_goals`
--
ALTER TABLE `has_goals`
  ADD PRIMARY KEY (`username`,`goal_id`),
  ADD KEY `has_goals_ibfk_1` (`goal_id`);

--
-- Indexes for table `health_guidelines`
--
ALTER TABLE `health_guidelines`
  ADD PRIMARY KEY (`age`,`gender`,`activity_level`);

--
-- Indexes for table `login_credentials`
--
ALTER TABLE `login_credentials`
  ADD PRIMARY KEY (`username`);

--
-- Indexes for table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`username`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `exercise`
--
ALTER TABLE `exercise`
  MODIFY `exercise_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=65;

--
-- AUTO_INCREMENT for table `food`
--
ALTER TABLE `food`
  MODIFY `entry_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=185;

--
-- AUTO_INCREMENT for table `goals`
--
ALTER TABLE `goals`
  MODIFY `goal_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=85;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `consumes`
--
ALTER TABLE `consumes`
  ADD CONSTRAINT `consumes_ibfk_1` FOREIGN KEY (`username`) REFERENCES `user` (`username`) ON DELETE CASCADE,
  ADD CONSTRAINT `consumes_ibfk_2` FOREIGN KEY (`entry_id`) REFERENCES `food` (`entry_id`) ON DELETE CASCADE;

--
-- Constraints for table `does`
--
ALTER TABLE `does`
  ADD CONSTRAINT `does_ibfk_1` FOREIGN KEY (`username`) REFERENCES `user` (`username`) ON DELETE CASCADE;

--
-- Constraints for table `has_goals`
--
ALTER TABLE `has_goals`
  ADD CONSTRAINT `has_goals_ibfk_1` FOREIGN KEY (`goal_id`) REFERENCES `goals` (`goal_id`) ON DELETE CASCADE;

--
-- Constraints for table `login_credentials`
--
ALTER TABLE `login_credentials`
  ADD CONSTRAINT `login_credentials_ibfk_1` FOREIGN KEY (`username`) REFERENCES `user` (`username`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
