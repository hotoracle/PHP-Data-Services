-- phpMyAdmin SQL Dump
-- version 4.0.4.1
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: Nov 08, 2013 at 02:38 PM
-- Server version: 5.6.12
-- PHP Version: 5.5.3

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `datas`
--
CREATE DATABASE IF NOT EXISTS `datas` DEFAULT CHARACTER SET latin1 COLLATE latin1_swedish_ci;
USE `datas`;

-- --------------------------------------------------------

--
-- Table structure for table `data_apps`
--

CREATE TABLE IF NOT EXISTS `data_apps` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `alias` varchar(100) NOT NULL,
  `name` varchar(100) DEFAULT NULL,
  `description` varchar(45) DEFAULT NULL,
  `secret` varchar(255) DEFAULT NULL,
  `is_public` tinyint(1) NOT NULL,
  `is_published` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 COMMENT='ret' AUTO_INCREMENT=2 ;

--
-- Dumping data for table `data_apps`
--

INSERT INTO `data_apps` (`id`, `alias`, `name`, `description`, `secret`, `is_public`, `is_published`) VALUES
(1, 'cd-collection', 'My CD Collection', 'My CD Collection App', '1234567892', 1, 1);

-- --------------------------------------------------------

--
-- Table structure for table `data_collections`
--

CREATE TABLE IF NOT EXISTS `data_collections` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(45) DEFAULT NULL,
  `alias` varchar(100) NOT NULL,
  `description` text,
  `data_provider_id` int(11) NOT NULL,
  `dbname` varchar(255) NOT NULL,
  `data_app_id` int(11) NOT NULL,
  `is_published` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`,`data_app_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=4 ;

--
-- Dumping data for table `data_collections`
--

INSERT INTO `data_collections` (`id`, `name`, `alias`, `description`, `data_provider_id`, `dbname`, `data_app_id`, `is_published`) VALUES
(1, 'CD Collections', 'cd-col', 'CD COL', 1, 'cdcol', 1, 1),
(2, 'T', 'rw', 'ffff', 1, '0', 3, 0),
(3, 'Notification', 'notification', 'Notification Table', 1, 'wso2mobile-mdm', 1, 1);

-- --------------------------------------------------------

--
-- Table structure for table `data_providers`
--

CREATE TABLE IF NOT EXISTS `data_providers` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(45) NOT NULL,
  `description` text,
  `params` text NOT NULL,
  `source_type_id` int(11) NOT NULL,
  PRIMARY KEY (`id`,`source_type_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=2 ;

--
-- Dumping data for table `data_providers`
--

INSERT INTO `data_providers` (`id`, `name`, `description`, `params`, `source_type_id`) VALUES
(1, 'Localhost', 'My Localhost', '{\r\n   "host": "localhost",\r\n   "port": "3306", \r\n   "username": "root",\r\n   "password": ""  \r\n} ', 1);

-- --------------------------------------------------------

--
-- Table structure for table `methods`
--

CREATE TABLE IF NOT EXISTS `methods` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(45) DEFAULT NULL,
  `alias` varchar(255) NOT NULL,
  `description` varchar(45) DEFAULT NULL,
  `command` text,
  `http_methods` text,
  `data_collection_id` int(11) NOT NULL,
  `method_type_id` int(11) NOT NULL,
  `is_published` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`,`data_collection_id`,`method_type_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=47 ;

--
-- Dumping data for table `methods`
--

INSERT INTO `methods` (`id`, `name`, `alias`, `description`, `command`, `http_methods`, `data_collection_id`, `method_type_id`, `is_published`) VALUES
(43, 'cds_create', 'cds', 'cds', 'create', 'POST', 1, 1, 1),
(44, 'cds_update', 'cds', 'cds', 'update', 'PUT', 1, 3, 1),
(45, 'getAllDevices', 'devices', 'test', 'SELECT * FROM test WHERE a = {{name}}', 'GET', 1, 5, 1),
(46, 'cds_retrieve', 'cds', 'cds', 'retrieve', 'GET', 1, 2, 1);

-- --------------------------------------------------------

--
-- Table structure for table `method_params`
--

CREATE TABLE IF NOT EXISTS `method_params` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(45) DEFAULT NULL,
  `description` varchar(45) DEFAULT NULL,
  `validation` varchar(255) DEFAULT 'none',
  `is_required` tinyint(1) NOT NULL,
  `expression` text,
  `method_id` int(11) NOT NULL,
  PRIMARY KEY (`id`,`method_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=24 ;

--
-- Dumping data for table `method_params`
--

INSERT INTO `method_params` (`id`, `name`, `description`, `validation`, `is_required`, `expression`, `method_id`) VALUES
(23, 'name', 'name', 'none', 0, NULL, 45);

-- --------------------------------------------------------

--
-- Table structure for table `method_types`
--

CREATE TABLE IF NOT EXISTS `method_types` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(45) DEFAULT NULL,
  `alias` varchar(45) DEFAULT NULL,
  `http_methods` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 COMMENT='p_method\n' AUTO_INCREMENT=6 ;

--
-- Dumping data for table `method_types`
--

INSERT INTO `method_types` (`id`, `name`, `alias`, `http_methods`) VALUES
(1, 'Create', 'create', 'POST'),
(2, 'Retrieve', 'retrieve', 'GET'),
(3, 'Update', 'update', 'PUT'),
(4, 'Delete', 'delete', 'DELETE'),
(5, 'Custom', 'custom', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `source_types`
--

CREATE TABLE IF NOT EXISTS `source_types` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(45) NOT NULL,
  `description` text,
  `init_params` text NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=2 ;

--
-- Dumping data for table `source_types`
--

INSERT INTO `source_types` (`id`, `name`, `description`, `init_params`) VALUES
(1, 'MySQL', 'MySQL Data Source Type', '{\r\n   "host": "",\r\n   "port": "", \r\n   "username": "",\r\n   "password": ""  \r\n} ');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE IF NOT EXISTS `users` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(255) NOT NULL,
  `password` char(40) NOT NULL,
  `role` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=2 ;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `username`, `password`, `role`) VALUES
(1, 'admin', 'ed1249a45a834f1028660e072e23a54b53f2fd16', 'admin');

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
