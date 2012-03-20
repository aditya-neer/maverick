-- phpMyAdmin SQL Dump
-- version 3.3.9
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: Mar 20, 2012 at 05:13 AM
-- Server version: 5.5.8
-- PHP Version: 5.3.5

SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `saywtf`
--

-- --------------------------------------------------------

--
-- Table structure for table `activity`
--

CREATE TABLE IF NOT EXISTS `activity` (
  `activity_id` int(11) NOT NULL AUTO_INCREMENT,
  `activity_description` varchar(45) NOT NULL,
  PRIMARY KEY (`activity_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

--
-- Dumping data for table `activity`
--


-- --------------------------------------------------------

--
-- Table structure for table `comment`
--

CREATE TABLE IF NOT EXISTS `comment` (
  `comment_id` int(11) NOT NULL AUTO_INCREMENT,
  `user_user_id` int(11) NOT NULL,
  `user_user_name` varchar(45) NOT NULL,
  `user_user_email` varchar(255) NOT NULL,
  `poll_poll_id` int(11) NOT NULL,
  `comment_text` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`comment_id`,`user_user_id`,`user_user_name`,`user_user_email`,`poll_poll_id`),
  KEY `fk_comment_user1` (`user_user_id`,`user_user_name`,`user_user_email`),
  KEY `fk_comment_poll1` (`poll_poll_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

--
-- Dumping data for table `comment`
--


-- --------------------------------------------------------

--
-- Table structure for table `discussion`
--

CREATE TABLE IF NOT EXISTS `discussion` (
  `discussion_id` int(11) NOT NULL AUTO_INCREMENT,
  `user_user_id` int(11) NOT NULL,
  `user_user_name` varchar(45) NOT NULL,
  `user_user_email` varchar(255) NOT NULL,
  `poll_poll_id` int(11) NOT NULL,
  `discussion_text` text NOT NULL,
  `comment_id` int(11) DEFAULT NULL,
  `comment_text` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`discussion_id`,`user_user_id`,`user_user_name`,`user_user_email`,`poll_poll_id`),
  KEY `fk_discussion_user1` (`user_user_id`,`user_user_name`,`user_user_email`),
  KEY `fk_discussion_poll1` (`poll_poll_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=2 ;

--
-- Dumping data for table `discussion`
--

INSERT INTO `discussion` (`discussion_id`, `user_user_id`, `user_user_name`, `user_user_email`, `poll_poll_id`, `discussion_text`, `comment_id`, `comment_text`) VALUES
(1, 1, 'sushil', 'sushil.zavare@gmail.com', 1, 'which is good color', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `discussion_comment`
--

CREATE TABLE IF NOT EXISTS `discussion_comment` (
  `discussion_comment_id` int(11) NOT NULL AUTO_INCREMENT,
  `discussion_discussion_id` int(11) NOT NULL,
  `user_user_id` int(11) NOT NULL,
  `user_user_name` varchar(45) NOT NULL,
  `user_user_email` varchar(255) NOT NULL,
  `discussion_comment_text` text,
  PRIMARY KEY (`discussion_comment_id`,`discussion_discussion_id`,`user_user_id`,`user_user_name`,`user_user_email`),
  KEY `fk_discussion_comment_discussion1` (`discussion_discussion_id`),
  KEY `fk_discussion_comment_user1` (`user_user_id`,`user_user_name`,`user_user_email`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=192 ;

--
-- Dumping data for table `discussion_comment`
--

INSERT INTO `discussion_comment` (`discussion_comment_id`, `discussion_discussion_id`, `user_user_id`, `user_user_name`, `user_user_email`, `discussion_comment_text`) VALUES
(1, 1, 1, 'sushil', 'sushil.zavare@gmail.com', 'df'),
(2, 1, 1, 'sushil', 'sushil.zavare@gmail.com', 'dfg'),
(3, 1, 1, 'sushil', 'sushil.zavare@gmail.com', 'fdgd'),
(4, 1, 1, 'sushil', 'sushil.zavare@gmail.com', 'fdg'),
(5, 1, 1, 'sushil', 'sushil.zavare@gmail.com', 'rte'),
(6, 1, 1, 'sushil', 'sushil.zavare@gmail.com', 'dfdf'),
(7, 1, 1, 'sushil', 'sushil.zavare@gmail.com', 'dfdfdfds'),
(8, 1, 1, 'sushil', 'sushil.zavare@gmail.com', 'fgd'),
(9, 1, 1, 'sushil', 'sushil.zavare@gmail.com', 'rte'),
(10, 1, 1, 'sushil', 'sushil.zavare@gmail.com', 'ffdg'),
(11, 1, 1, 'sushil', 'sushil.zavare@gmail.com', 'fdgd'),
(12, 1, 1, 'sushil', 'sushil.zavare@gmail.com', 'rte'),
(13, 1, 1, 'sushil', 'sushil.zavare@gmail.com', 'retre'),
(14, 1, 1, 'sushil', 'sushil.zavare@gmail.com', 'fdgdf'),
(15, 1, 1, 'sushil', 'sushil.zavare@gmail.com', 'dsfd'),
(16, 1, 1, 'sushil', 'sushil.zavare@gmail.com', 'dsf'),
(17, 1, 1, 'sushil', 'sushil.zavare@gmail.com', 'dfsd'),
(18, 1, 1, 'sushil', 'sushil.zavare@gmail.com', 'fdg'),
(19, 1, 1, 'sushil', 'sushil.zavare@gmail.com', 'dfgfd'),
(20, 1, 1, 'sushil', 'sushil.zavare@gmail.com', 'dfdsdfd'),
(21, 1, 1, 'sushil', 'sushil.zavare@gmail.com', 'dfsdf'),
(22, 1, 1, 'sushil', 'sushil.zavare@gmail.com', 'rete'),
(23, 1, 1, 'sushil', 'sushil.zavare@gmail.com', 'fdgfdg'),
(24, 1, 1, 'sushil', 'sushil.zavare@gmail.com', 'fgfd'),
(25, 1, 1, 'sushil', 'sushil.zavare@gmail.com', 'gfdgf'),
(26, 1, 1, 'sushil', 'sushil.zavare@gmail.com', 'fgfd'),
(27, 1, 1, 'sushil', 'sushil.zavare@gmail.com', 'cvcxv'),
(28, 1, 1, 'sushil', 'sushil.zavare@gmail.com', 'gvfdg'),
(29, 1, 1, 'sushil', 'sushil.zavare@gmail.com', 'fgfd'),
(30, 1, 1, 'sushil', 'sushil.zavare@gmail.com', 'dsfds'),
(31, 1, 1, 'sushil', 'sushil.zavare@gmail.com', 'dfds'),
(32, 1, 1, 'sushil', 'sushil.zavare@gmail.com', 'dfgdf'),
(33, 1, 1, 'sushil', 'sushil.zavare@gmail.com', 'dgdf'),
(34, 1, 1, 'sushil', 'sushil.zavare@gmail.com', 'ert'),
(35, 1, 1, 'sushil', 'sushil.zavare@gmail.com', 'rter'),
(36, 1, 1, 'sushil', 'sushil.zavare@gmail.com', 'dfs'),
(37, 1, 1, 'sushil', 'sushil.zavare@gmail.com', 'dfs'),
(38, 1, 1, 'sushil', 'sushil.zavare@gmail.com', 'fgf'),
(39, 1, 1, 'sushil', 'sushil.zavare@gmail.com', 'ret'),
(40, 1, 1, 'sushil', 'sushil.zavare@gmail.com', 'erte'),
(41, 1, 1, 'sushil', 'sushil.zavare@gmail.com', 'fd'),
(42, 1, 1, 'sushil', 'sushil.zavare@gmail.com', 'gdf'),
(43, 1, 1, 'sushil', 'sushil.zavare@gmail.com', 'fgfd'),
(44, 1, 1, 'sushil', 'sushil.zavare@gmail.com', 'fgfd'),
(45, 1, 1, 'sushil', 'sushil.zavare@gmail.com', 'fdgfd'),
(46, 1, 1, 'sushil', 'sushil.zavare@gmail.com', 'fgd'),
(47, 1, 1, 'sushil', 'sushil.zavare@gmail.com', 'fgdfgfdg'),
(48, 1, 1, 'sushil', 'sushil.zavare@gmail.com', 'rtre'),
(49, 1, 1, 'sushil', 'sushil.zavare@gmail.com', 'rtre'),
(50, 1, 1, 'sushil', 'sushil.zavare@gmail.com', 'rtre'),
(51, 1, 1, 'sushil', 'sushil.zavare@gmail.com', 'rt'),
(52, 1, 1, 'sushil', 'sushil.zavare@gmail.com', 'retre'),
(53, 1, 1, 'sushil', 'sushil.zavare@gmail.com', 'dfg'),
(54, 1, 1, 'sushil', 'sushil.zavare@gmail.com', 'dfgf'),
(55, 1, 1, 'sushil', 'sushil.zavare@gmail.com', 'tre'),
(56, 1, 1, 'sushil', 'sushil.zavare@gmail.com', 'rtre'),
(57, 1, 1, 'sushil', 'sushil.zavare@gmail.com', 'rte'),
(58, 1, 1, 'sushil', 'sushil.zavare@gmail.com', 'fgdf'),
(59, 1, 1, 'sushil', 'sushil.zavare@gmail.com', 'ret'),
(60, 1, 1, 'sushil', 'sushil.zavare@gmail.com', 'rter'),
(61, 1, 1, 'sushil', 'sushil.zavare@gmail.com', ''),
(62, 1, 1, 'sushil', 'sushil.zavare@gmail.com', ''),
(63, 1, 1, 'sushil', 'sushil.zavare@gmail.com', ''),
(64, 1, 1, 'sushil', 'sushil.zavare@gmail.com', ''),
(65, 1, 1, 'sushil', 'sushil.zavare@gmail.com', ''),
(66, 1, 1, 'sushil', 'sushil.zavare@gmail.com', ''),
(67, 1, 1, 'sushil', 'sushil.zavare@gmail.com', ''),
(68, 1, 1, 'sushil', 'sushil.zavare@gmail.com', ''),
(69, 1, 1, 'sushil', 'sushil.zavare@gmail.com', ''),
(70, 1, 1, 'sushil', 'sushil.zavare@gmail.com', ''),
(71, 1, 1, 'sushil', 'sushil.zavare@gmail.com', 'rhgtrh'),
(72, 1, 1, 'sushil', 'sushil.zavare@gmail.com', ''),
(73, 1, 1, 'sushil', 'sushil.zavare@gmail.com', ''),
(74, 1, 1, 'sushil', 'sushil.zavare@gmail.com', 'fdgdf'),
(75, 1, 1, 'sushil', 'sushil.zavare@gmail.com', 'fdgfd'),
(76, 1, 1, 'sushil', 'sushil.zavare@gmail.com', 'dsfd'),
(77, 1, 1, 'sushil', 'sushil.zavare@gmail.com', 'dsvsd'),
(78, 1, 1, 'sushil', 'sushil.zavare@gmail.com', 'dsfds'),
(79, 1, 1, 'sushil', 'sushil.zavare@gmail.com', 'dsfsd'),
(80, 1, 1, 'sushil', 'sushil.zavare@gmail.com', 'sdasd'),
(81, 1, 1, 'sushil', 'sushil.zavare@gmail.com', 'erew'),
(82, 1, 1, 'sushil', 'sushil.zavare@gmail.com', 'dfsdf'),
(83, 1, 1, 'sushil', 'sushil.zavare@gmail.com', 'dfds'),
(84, 1, 1, 'sushil', 'sushil.zavare@gmail.com', 'dfds'),
(85, 1, 1, 'sushil', 'sushil.zavare@gmail.com', 'dfds'),
(86, 1, 1, 'sushil', 'sushil.zavare@gmail.com', 'dfds'),
(87, 1, 1, 'sushil', 'sushil.zavare@gmail.com', 'erwe'),
(88, 1, 1, 'sushil', 'sushil.zavare@gmail.com', 'dfds'),
(89, 1, 1, 'sushil', 'sushil.zavare@gmail.com', 'rtre'),
(90, 1, 1, 'sushil', 'sushil.zavare@gmail.com', 'fdgd'),
(91, 1, 1, 'sushil', 'sushil.zavare@gmail.com', 'fds'),
(92, 1, 1, 'sushil', 'sushil.zavare@gmail.com', 'sdf'),
(93, 1, 1, 'sushil', 'sushil.zavare@gmail.com', 'retre'),
(94, 1, 1, 'sushil', 'sushil.zavare@gmail.com', 'rt'),
(95, 1, 1, 'sushil', 'sushil.zavare@gmail.com', 'sdas'),
(96, 1, 1, 'sushil', 'sushil.zavare@gmail.com', 'fds'),
(97, 1, 1, 'sushil', 'sushil.zavare@gmail.com', 'dfs'),
(98, 1, 1, 'sushil', 'sushil.zavare@gmail.com', 'rtre'),
(99, 1, 1, 'sushil', 'sushil.zavare@gmail.com', 'wer'),
(100, 1, 1, 'sushil', 'sushil.zavare@gmail.com', 'dsfdsf'),
(101, 1, 1, 'sushil', 'sushil.zavare@gmail.com', 'sdfds'),
(102, 1, 1, 'sushil', 'sushil.zavare@gmail.com', 'dfd'),
(103, 1, 1, 'sushil', 'sushil.zavare@gmail.com', 'dfsd'),
(104, 1, 1, 'sushil', 'sushil.zavare@gmail.com', 'sdfs'),
(105, 1, 1, 'sushil', 'sushil.zavare@gmail.com', 'sdfsd'),
(106, 1, 1, 'sushil', 'sushil.zavare@gmail.com', 'fdgd'),
(107, 1, 1, 'sushil', 'sushil.zavare@gmail.com', 'dfsd'),
(108, 1, 1, 'sushil', 'sushil.zavare@gmail.com', 'dsf'),
(109, 1, 1, 'sushil', 'sushil.zavare@gmail.com', 'dv'),
(110, 1, 1, 'sushil', 'sushil.zavare@gmail.com', 'dfsd'),
(111, 1, 1, 'sushil', 'sushil.zavare@gmail.com', 'sdfsd'),
(112, 1, 1, 'sushil', 'sushil.zavare@gmail.com', 'dfg'),
(113, 1, 1, 'sushil', 'sushil.zavare@gmail.com', 'dsfds'),
(114, 1, 1, 'sushil', 'sushil.zavare@gmail.com', 'dfgfd'),
(115, 1, 1, 'sushil', 'sushil.zavare@gmail.com', 'dsfdfd'),
(116, 1, 1, 'sushil', 'sushil.zavare@gmail.com', 'dsfsd'),
(117, 1, 1, 'sushil', 'sushil.zavare@gmail.com', 'dfgfd'),
(118, 1, 1, 'sushil', 'sushil.zavare@gmail.com', 'dfgfd'),
(119, 1, 1, 'sushil', 'sushil.zavare@gmail.com', 'sdfds'),
(120, 1, 1, 'sushil', 'sushil.zavare@gmail.com', 'dfd'),
(121, 1, 1, 'sushil', 'sushil.zavare@gmail.com', 'dfds'),
(122, 1, 1, 'sushil', 'sushil.zavare@gmail.com', 'dfg'),
(123, 1, 1, 'sushil', 'sushil.zavare@gmail.com', 'dfg'),
(124, 1, 1, 'sushil', 'sushil.zavare@gmail.com', 'dfgdf'),
(125, 1, 1, 'sushil', 'sushil.zavare@gmail.com', 'fdgd'),
(126, 1, 1, 'sushil', 'sushil.zavare@gmail.com', 'fdgg'),
(127, 1, 1, 'sushil', 'sushil.zavare@gmail.com', 'dfgfd'),
(128, 1, 1, 'sushil', 'sushil.zavare@gmail.com', 'dfsdgfd'),
(129, 1, 1, 'sushil', 'sushil.zavare@gmail.com', 'fdgfd'),
(130, 1, 1, 'sushil', 'sushil.zavare@gmail.com', 'dfgfd'),
(131, 1, 1, 'sushil', 'sushil.zavare@gmail.com', 'dfg'),
(132, 1, 1, 'sushil', 'sushil.zavare@gmail.com', 'dfgd'),
(133, 1, 1, 'sushil', 'sushil.zavare@gmail.com', 'rte'),
(134, 1, 1, 'sushil', 'sushil.zavare@gmail.com', 'dfgdfg'),
(135, 1, 1, 'sushil', 'sushil.zavare@gmail.com', 'sdfs'),
(136, 1, 1, 'sushil', 'sushil.zavare@gmail.com', 'sdfds'),
(137, 1, 1, 'sushil', 'sushil.zavare@gmail.com', 'retre'),
(138, 1, 1, 'sushil', 'sushil.zavare@gmail.com', 'dfds'),
(139, 1, 1, 'sushil', 'sushil.zavare@gmail.com', 'fgd'),
(140, 1, 1, 'sushil', 'sushil.zavare@gmail.com', 'fdgfd'),
(141, 1, 1, 'sushil', 'sushil.zavare@gmail.com', 'fdg'),
(142, 1, 1, 'sushil', 'sushil.zavare@gmail.com', 'dsfsd'),
(143, 1, 1, 'sushil', 'sushil.zavare@gmail.com', 'dfgd'),
(144, 1, 1, 'sushil', 'sushil.zavare@gmail.com', 'ewre'),
(145, 1, 1, 'sushil', 'sushil.zavare@gmail.com', 'fgdf'),
(146, 1, 1, 'sushil', 'sushil.zavare@gmail.com', 'dfgfd'),
(147, 1, 1, 'sushil', 'sushil.zavare@gmail.com', 'cvbvc'),
(148, 1, 1, 'sushil', 'sushil.zavare@gmail.com', 'dgd'),
(149, 1, 1, 'sushil', 'sushil.zavare@gmail.com', 'fdgfd'),
(150, 1, 1, 'sushil', 'sushil.zavare@gmail.com', 'xcbvfdbg'),
(166, 1, 1, 'sushil', 'sushil.zavare@gmail.com', 'dddddd'),
(167, 1, 1, 'sushil', 'sushil.zavare@gmail.com', 's'),
(168, 1, 1, 'sushil', 'sushil.zavare@gmail.com', 's'),
(169, 1, 1, 'sushil', 'sushil.zavare@gmail.com', 'd'),
(170, 1, 1, 'sushil', 'sushil.zavare@gmail.com', 'dd'),
(171, 1, 1, 'sushil', 'sushil.zavare@gmail.com', 'dsdsd'),
(172, 1, 1, 'sushil', 'sushil.zavare@gmail.com', 'f'),
(173, 1, 1, 'sushil', 'sushil.zavare@gmail.com', 'd'),
(174, 1, 1, 'sushil', 'sushil.zavare@gmail.com', 'd'),
(175, 1, 1, 'sushil', 'sushil.zavare@gmail.com', 'sdsd'),
(176, 1, 1, 'sushil', 'sushil.zavare@gmail.com', 'sdsd'),
(177, 1, 1, 'sushil', 'sushil.zavare@gmail.com', 'ghghgh'),
(178, 1, 1, 'sushil', 'sushil.zavare@gmail.com', 'ddfdsfgd'),
(179, 1, 1, 'sushil', 'sushil.zavare@gmail.com', 'sdfsd'),
(180, 1, 1, 'sushil', 'sushil.zavare@gmail.com', 'fgfd'),
(181, 1, 1, 'sushil', 'sushil.zavare@gmail.com', 'were'),
(182, 1, 1, 'sushil', 'sushil.zavare@gmail.com', 'dfgfdg'),
(183, 1, 1, 'sushil', 'sushil.zavare@gmail.com', 'fdf'),
(184, 1, 1, 'sushil', 'sushil.zavare@gmail.com', 'dfdgdg'),
(185, 1, 1, 'sushil', 'sushil.zavare@gmail.com', 'fdffdg'),
(186, 1, 1, 'sushil', 'sushil.zavare@gmail.com', 'fvfdbf'),
(187, 1, 1, 'sushil', 'sushil.zavare@gmail.com', 'ddd'),
(188, 1, 1, 'sushil', 'sushil.zavare@gmail.com', 'ddd'),
(189, 1, 1, 'sushil', 'sushil.zavare@gmail.com', 'dfd'),
(190, 1, 1, 'sushil', 'sushil.zavare@gmail.com', 'fdfdf'),
(191, 1, 1, 'sushil', 'sushil.zavare@gmail.com', 'fsdf');

-- --------------------------------------------------------

--
-- Table structure for table `error`
--

CREATE TABLE IF NOT EXISTS `error` (
  `error_id` int(11) NOT NULL AUTO_INCREMENT,
  `error_description` varchar(45) NOT NULL,
  PRIMARY KEY (`error_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

--
-- Dumping data for table `error`
--


-- --------------------------------------------------------

--
-- Table structure for table `error_log`
--

CREATE TABLE IF NOT EXISTS `error_log` (
  `error_log_id` int(11) NOT NULL AUTO_INCREMENT,
  `error_error_id` int(11) NOT NULL,
  `user_user_id` int(11) NOT NULL,
  `user_user_name` varchar(45) NOT NULL,
  `user_user_email` varchar(255) NOT NULL,
  PRIMARY KEY (`error_log_id`,`error_error_id`,`user_user_id`,`user_user_name`,`user_user_email`),
  KEY `fk_error_log_error1` (`error_error_id`),
  KEY `fk_error_log_user1` (`user_user_id`,`user_user_name`,`user_user_email`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

--
-- Dumping data for table `error_log`
--


-- --------------------------------------------------------

--
-- Table structure for table `log`
--

CREATE TABLE IF NOT EXISTS `log` (
  `log_id` int(11) NOT NULL AUTO_INCREMENT,
  `user_user_id` int(11) NOT NULL,
  `user_user_name` varchar(45) NOT NULL,
  `user_user_email` varchar(255) NOT NULL,
  `activity_activity_id` int(11) NOT NULL,
  PRIMARY KEY (`log_id`,`user_user_id`,`user_user_name`,`user_user_email`,`activity_activity_id`),
  KEY `fk_log_user1` (`user_user_id`,`user_user_name`,`user_user_email`),
  KEY `fk_log_activity1` (`activity_activity_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

--
-- Dumping data for table `log`
--


-- --------------------------------------------------------

--
-- Table structure for table `login`
--

CREATE TABLE IF NOT EXISTS `login` (
  `user_user_id` int(11) NOT NULL,
  `user_user_name` varchar(45) NOT NULL,
  `user_user_email` varchar(255) NOT NULL,
  `user_user_password` varchar(45) DEFAULT NULL,
  `user_user_verified` tinyint(1) DEFAULT NULL,
  `user_user_active` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`user_user_id`,`user_user_name`,`user_user_email`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `login`
--

INSERT INTO `login` (`user_user_id`, `user_user_name`, `user_user_email`, `user_user_password`, `user_user_verified`, `user_user_active`) VALUES
(1, 'sushil', 'sushil.zavare@gmail.com', 'asd', 1, 1),
(55, 'nikhil1', 'nikhil.machcha@gmail.com', 'a', 1, 1),
(56, 'adya', 'aditya@gmail.com', 'a', 1, 1),
(57, 'a', 'sushil.ask24@gmail.com', 'a', 1, 1),
(58, 'rajiv', 'rajiv@gmail.com', 'a', 1, 1);

-- --------------------------------------------------------

--
-- Table structure for table `option`
--

CREATE TABLE IF NOT EXISTS `option` (
  `option_id` int(11) NOT NULL AUTO_INCREMENT,
  `poll_poll_id` int(11) NOT NULL,
  `option_title` varchar(1023) NOT NULL,
  `option_attachment_type` tinyint(2) NOT NULL,
  `option_attachment_url` varchar(255) DEFAULT NULL,
  `option_votes` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`option_id`,`poll_poll_id`),
  KEY `fk_option_poll1` (`poll_poll_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=8 ;

--
-- Dumping data for table `option`
--

INSERT INTO `option` (`option_id`, `poll_poll_id`, `option_title`, `option_attachment_type`, `option_attachment_url`, `option_votes`) VALUES
(1, 1, 'which is good color?', 0, NULL, 0),
(6, 27, 'Option 1', 1, 'heder_img - Copy.jpg', 0),
(7, 27, 'Option 2', 2, 'http://www.youtube.com/watch?v=vBTJwVVTfGQ', 0);

-- --------------------------------------------------------

--
-- Table structure for table `option_vote`
--

CREATE TABLE IF NOT EXISTS `option_vote` (
  `option_option_id` int(11) NOT NULL,
  `option_poll_poll_id` int(11) NOT NULL,
  `option_vote_count` varchar(45) NOT NULL DEFAULT '0',
  PRIMARY KEY (`option_option_id`,`option_poll_poll_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `option_vote`
--

INSERT INTO `option_vote` (`option_option_id`, `option_poll_poll_id`, `option_vote_count`) VALUES
(1, 1, '25');

-- --------------------------------------------------------

--
-- Table structure for table `poll`
--

CREATE TABLE IF NOT EXISTS `poll` (
  `poll_id` int(11) NOT NULL AUTO_INCREMENT,
  `user_user_id` int(11) NOT NULL,
  `user_user_name` varchar(45) NOT NULL,
  `user_user_email` varchar(255) NOT NULL,
  `poll_title` mediumtext NOT NULL,
  `poll_attachment_type` tinyint(2) DEFAULT NULL,
  `poll_attachment_url` varchar(255) DEFAULT NULL,
  `poll_creation_ip` varchar(45) NOT NULL,
  `poll_creation_time` datetime DEFAULT NULL,
  `poll_start_date` datetime DEFAULT NULL,
  `poll_end_date` varchar(45) DEFAULT NULL,
  `poll_is_abusive` tinyint(1) NOT NULL DEFAULT '0',
  `poll_total_votes` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`poll_id`,`user_user_id`,`user_user_name`,`user_user_email`),
  KEY `fk_poll_user1` (`user_user_id`,`user_user_name`,`user_user_email`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=28 ;

--
-- Dumping data for table `poll`
--

INSERT INTO `poll` (`poll_id`, `user_user_id`, `user_user_name`, `user_user_email`, `poll_title`, `poll_attachment_type`, `poll_attachment_url`, `poll_creation_ip`, `poll_creation_time`, `poll_start_date`, `poll_end_date`, `poll_is_abusive`, `poll_total_votes`) VALUES
(1, 1, 'sushil', 'sushil.zavare@gmail.com', 'which is good color', 0, 'ssd', '123.1.1.1', '2012-02-14 13:18:01', '2012-02-14 13:18:44', 'null', 0, 0),
(27, 1, 'sushil', 'sushil.zavare@gmail.com', 'Sample Question', 0, '', '121.0.0.2', '0000-00-00 00:00:00', '2014-02-20 12:00:00', 'null', 0, 0);

-- --------------------------------------------------------

--
-- Table structure for table `poll_abuse`
--

CREATE TABLE IF NOT EXISTS `poll_abuse` (
  `poll_abuse_id` int(11) NOT NULL AUTO_INCREMENT,
  `poll_poll_id` int(11) NOT NULL,
  `poll_user_user_id` int(11) NOT NULL,
  `poll_user_user_name` varchar(45) NOT NULL,
  `poll_user_user_email` varchar(255) NOT NULL,
  PRIMARY KEY (`poll_abuse_id`,`poll_poll_id`,`poll_user_user_id`,`poll_user_user_name`,`poll_user_user_email`),
  KEY `fk_poll_abuse_poll1` (`poll_poll_id`,`poll_user_user_id`,`poll_user_user_name`,`poll_user_user_email`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

--
-- Dumping data for table `poll_abuse`
--


-- --------------------------------------------------------

--
-- Table structure for table `poll_vote`
--

CREATE TABLE IF NOT EXISTS `poll_vote` (
  `poll_poll_id` int(11) NOT NULL,
  `poll_vote_count` varchar(45) NOT NULL DEFAULT '0',
  PRIMARY KEY (`poll_poll_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `poll_vote`
--


-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE IF NOT EXISTS `user` (
  `user_id` int(11) NOT NULL AUTO_INCREMENT,
  `user_name` varchar(45) NOT NULL,
  `user_email` varchar(255) NOT NULL,
  `user_fname` varchar(255) NOT NULL,
  `user_lname` varchar(255) NOT NULL COMMENT '		',
  `user_dob` date NOT NULL,
  `user_gender` tinyint(1) NOT NULL,
  `user_reg_date` datetime DEFAULT NULL,
  `user_reg_ip` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`user_id`,`user_name`,`user_email`),
  UNIQUE KEY `user_name_UNIQUE` (`user_name`),
  UNIQUE KEY `user_email_UNIQUE` (`user_email`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=59 ;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`user_id`, `user_name`, `user_email`, `user_fname`, `user_lname`, `user_dob`, `user_gender`, `user_reg_date`, `user_reg_ip`) VALUES
(1, 'sushil', 'sushil.zavare@gmail.com', 'Sushil', 'Zavare', '1988-10-16', 0, '2011-11-15 15:44:45', '123.1.1.1'),
(55, 'nikhil1', 'nikhil.machcha@gmail.com', 'nikhil', 'machcha', '1999-02-23', 0, '2012-02-26 00:00:00', '127.0.0.1'),
(56, 'adya', 'aditya@gmail.com', 'aditya', 'parab', '1999-03-10', 0, '2012-02-28 00:00:00', '127.0.0.1'),
(57, 'a', 'sushil.ask24@gmail.com', 's', 'a', '1999-04-01', 0, '2012-03-01 00:00:00', '127.0.0.1'),
(58, 'rajiv', 'rajiv@gmail.com', 'rajiv', 'pingale', '1999-03-17', 0, '2012-03-20 00:00:00', '127.0.0.1');

-- --------------------------------------------------------

--
-- Table structure for table `verification`
--

CREATE TABLE IF NOT EXISTS `verification` (
  `user_user_id` int(11) NOT NULL,
  `user_user_name` varchar(45) NOT NULL,
  `user_user_email` varchar(255) NOT NULL,
  `user_user_code` varchar(45) NOT NULL,
  PRIMARY KEY (`user_user_id`,`user_user_name`,`user_user_email`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `verification`
--

INSERT INTO `verification` (`user_user_id`, `user_user_name`, `user_user_email`, `user_user_code`) VALUES
(1, 'sushil', 'sushil.zavare@gmail.com', 'asddf'),
(55, 'nikhil1', 'nikhil.machcha@gmail.com', 'byd6cl'),
(56, 'adya', 'aditya@gmail.com', 'qxf31g'),
(57, 'a', 'sushil.ask24@gmail.com', 'y78f31'),
(58, 'rajiv', 'rajiv@gmail.com', '26xkj0');

-- --------------------------------------------------------

--
-- Table structure for table `vote`
--

CREATE TABLE IF NOT EXISTS `vote` (
  `user_user_id` int(11) NOT NULL,
  `option_option_id` int(11) NOT NULL,
  `option_poll_poll_id` int(11) NOT NULL,
  PRIMARY KEY (`user_user_id`,`option_option_id`,`option_poll_poll_id`),
  KEY `fk_vote_option1` (`option_option_id`,`option_poll_poll_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `vote`
--


--
-- Constraints for dumped tables
--

--
-- Constraints for table `comment`
--
ALTER TABLE `comment`
  ADD CONSTRAINT `fk_comment_poll1` FOREIGN KEY (`poll_poll_id`) REFERENCES `poll` (`poll_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_comment_user1` FOREIGN KEY (`user_user_id`, `user_user_name`, `user_user_email`) REFERENCES `user` (`user_id`, `user_name`, `user_email`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `discussion`
--
ALTER TABLE `discussion`
  ADD CONSTRAINT `fk_discussion_poll1` FOREIGN KEY (`poll_poll_id`) REFERENCES `poll` (`poll_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_discussion_user1` FOREIGN KEY (`user_user_id`, `user_user_name`, `user_user_email`) REFERENCES `user` (`user_id`, `user_name`, `user_email`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `discussion_comment`
--
ALTER TABLE `discussion_comment`
  ADD CONSTRAINT `fk_discussion_comment_discussion1` FOREIGN KEY (`discussion_discussion_id`) REFERENCES `discussion` (`discussion_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_discussion_comment_user1` FOREIGN KEY (`user_user_id`, `user_user_name`, `user_user_email`) REFERENCES `user` (`user_id`, `user_name`, `user_email`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `error_log`
--
ALTER TABLE `error_log`
  ADD CONSTRAINT `fk_error_log_error1` FOREIGN KEY (`error_error_id`) REFERENCES `error` (`error_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_error_log_user1` FOREIGN KEY (`user_user_id`, `user_user_name`, `user_user_email`) REFERENCES `user` (`user_id`, `user_name`, `user_email`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `log`
--
ALTER TABLE `log`
  ADD CONSTRAINT `fk_log_activity1` FOREIGN KEY (`activity_activity_id`) REFERENCES `activity` (`activity_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_log_user1` FOREIGN KEY (`user_user_id`, `user_user_name`, `user_user_email`) REFERENCES `user` (`user_id`, `user_name`, `user_email`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `login`
--
ALTER TABLE `login`
  ADD CONSTRAINT `fk_table1_user` FOREIGN KEY (`user_user_id`, `user_user_name`, `user_user_email`) REFERENCES `user` (`user_id`, `user_name`, `user_email`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `option`
--
ALTER TABLE `option`
  ADD CONSTRAINT `fk_option_poll1` FOREIGN KEY (`poll_poll_id`) REFERENCES `poll` (`poll_id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `option_vote`
--
ALTER TABLE `option_vote`
  ADD CONSTRAINT `fk_option_vote_option1` FOREIGN KEY (`option_option_id`, `option_poll_poll_id`) REFERENCES `option` (`option_id`, `poll_poll_id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `poll`
--
ALTER TABLE `poll`
  ADD CONSTRAINT `fk_poll_user1` FOREIGN KEY (`user_user_id`, `user_user_name`, `user_user_email`) REFERENCES `user` (`user_id`, `user_name`, `user_email`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `poll_abuse`
--
ALTER TABLE `poll_abuse`
  ADD CONSTRAINT `fk_poll_abuse_poll1` FOREIGN KEY (`poll_poll_id`, `poll_user_user_id`, `poll_user_user_name`, `poll_user_user_email`) REFERENCES `poll` (`poll_id`, `user_user_id`, `user_user_name`, `user_user_email`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `poll_vote`
--
ALTER TABLE `poll_vote`
  ADD CONSTRAINT `fk_poll_vote_poll1` FOREIGN KEY (`poll_poll_id`) REFERENCES `poll` (`poll_id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `verification`
--
ALTER TABLE `verification`
  ADD CONSTRAINT `fk_table1_user1` FOREIGN KEY (`user_user_id`, `user_user_name`, `user_user_email`) REFERENCES `user` (`user_id`, `user_name`, `user_email`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `vote`
--
ALTER TABLE `vote`
  ADD CONSTRAINT `fk_vote_option1` FOREIGN KEY (`option_option_id`, `option_poll_poll_id`) REFERENCES `option` (`option_id`, `poll_poll_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_vote_user1` FOREIGN KEY (`user_user_id`) REFERENCES `user` (`user_id`) ON DELETE NO ACTION ON UPDATE NO ACTION;
