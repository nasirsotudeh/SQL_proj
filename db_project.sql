-- phpMyAdmin SQL Dump
-- version 4.8.5
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1:3306
-- Generation Time: Dec 08, 2019 at 03:29 PM
-- Server version: 5.7.26
-- PHP Version: 7.2.18


SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `db_project`
--

-- --------------------------------------------------------

--
-- Table structure for table `apartments`
--

DROP TABLE IF EXISTS `apartments`;
CREATE TABLE IF NOT EXISTS `apartments` (
  `id` int(11) NOT NULL,
  `name` varchar(45) COLLATE utf8_persian_ci DEFAULT NULL,
  `state` varchar(45) COLLATE utf8_persian_ci DEFAULT NULL,
  `city` varchar(45) COLLATE utf8_persian_ci DEFAULT NULL,
  `street` varchar(45) COLLATE utf8_persian_ci DEFAULT NULL,
  `manager_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `manager_idx` (`manager_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_persian_ci;

-- --------------------------------------------------------

--
-- Table structure for table `charges`
--




DROP TABLE IF EXISTS `charges`;
CREATE TABLE IF NOT EXISTS `charges` (
  `id` int(11) NOT NULL,
  `title` varchar(45) COLLATE utf8_persian_ci DEFAULT NULL,
  `cost` int(11) DEFAULT NULL,
  `deadline` varchar(45) COLLATE utf8_persian_ci DEFAULT NULL,
  `created_at` varchar(45) COLLATE utf8_persian_ci DEFAULT NULL,
  `manager_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `manager_idx` (`manager_id`),
  KEY `manager_idx1` (`manager_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_persian_ci;

-- --------------------------------------------------------

--
-- Table structure for table `charge_ladger`
--

DROP TABLE IF EXISTS `charge_ladger`;
CREATE TABLE IF NOT EXISTS `charge_ladger` (
  `id` int(11) NOT NULL,
  `charge_id` int(11) NOT NULL,
  `ladger_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `ladger_idx` (`ladger_id`),
  KEY `charge_idx` (`charge_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_persian_ci;

-- --------------------------------------------------------

--
-- Table structure for table `ladgers`
--

DROP TABLE IF EXISTS `ladgers`;
CREATE TABLE IF NOT EXISTS `ladgers` (
  `id` int(11) NOT NULL,
  `first_name` varchar(45) COLLATE utf8_persian_ci DEFAULT NULL,
  `last_name` varchar(45) COLLATE utf8_persian_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_persian_ci;

-- --------------------------------------------------------

--
-- Table structure for table `managers`
--

DROP TABLE IF EXISTS `managers`;
CREATE TABLE IF NOT EXISTS `managers` (
  `id` int(11) NOT NULL,
  `first_name` varchar(45) COLLATE utf8_persian_ci DEFAULT NULL,
  `last_name` varchar(45) COLLATE utf8_persian_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_persian_ci;

-- --------------------------------------------------------

--
-- Table structure for table `notifications`
--

DROP TABLE IF EXISTS `notifications`;
CREATE TABLE IF NOT EXISTS `notifications` (
  `id` int(11) NOT NULL,
  `title` varchar(45) COLLATE utf8_persian_ci DEFAULT NULL,
  `description` varchar(45) COLLATE utf8_persian_ci DEFAULT NULL,
  `manager_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `2manager_idx` (`manager_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_persian_ci;

-- --------------------------------------------------------

--
-- Table structure for table `notification_ladger`
--

DROP TABLE IF EXISTS `notification_ladger`;
CREATE TABLE IF NOT EXISTS `notification_ladger` (
  `id` int(11) NOT NULL,
  `ladger_id` int(11) NOT NULL,
  `notification_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `notification_idx` (`notification_id`),
  KEY `ladger_idx` (`ladger_id`),
  KEY `notification_idx1` (`notification_id`),
  KEY `ladger_idx1` (`ladger_id`),
  KEY `notification_idx2` (`notification_id`),
  KEY `ladger_idx2` (`ladger_id`),
  KEY `notification_idx3` (`notification_id`),
  KEY `ladger_idx3` (`ladger_id`,`notification_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_persian_ci;

-- --------------------------------------------------------

--
-- Table structure for table `units`
--

DROP TABLE IF EXISTS `units`;
CREATE TABLE IF NOT EXISTS `units` (
  `id` int(11) NOT NULL,
  `area` int(11) DEFAULT NULL,
  `floor` int(11) DEFAULT NULL,
  `apartment_id` int(11) DEFAULT NULL,
  `ladger_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `2apartment_idx` (`apartment_id`),
  KEY `2ladger_idx` (`ladger_id`),
  KEY `3apartment_idx` (`apartment_id`),
  KEY `3ladger_idx` (`ladger_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_persian_ci;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `apartments`
--
ALTER TABLE `apartments`
  ADD CONSTRAINT `manager` FOREIGN KEY (`manager_id`) REFERENCES `managers` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `charges`
--
ALTER TABLE `charges`
  ADD CONSTRAINT `manager_charge` FOREIGN KEY (`manager_id`) REFERENCES `managers` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `charge_ladger`
--
ALTER TABLE `charge_ladger`
  ADD CONSTRAINT `charge` FOREIGN KEY (`charge_id`) REFERENCES `charges` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `ladger` FOREIGN KEY (`ladger_id`) REFERENCES `ladgers` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `notifications`
--
ALTER TABLE `notifications`
  ADD CONSTRAINT `2manager` FOREIGN KEY (`manager_id`) REFERENCES `managers` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `notification_ladger`
--
ALTER TABLE `notification_ladger`
  ADD CONSTRAINT `2ladger` FOREIGN KEY (`ladger_id`) REFERENCES `ladgers` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `2notification` FOREIGN KEY (`notification_id`) REFERENCES `notifications` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `units`
--
ALTER TABLE `units`
  ADD CONSTRAINT `3apartment` FOREIGN KEY (`apartment_id`) REFERENCES `apartments` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `3ladger` FOREIGN KEY (`ladger_id`) REFERENCES `ladgers` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
