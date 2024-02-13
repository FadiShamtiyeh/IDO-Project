-- phpMyAdmin SQL Dump
-- version 5.1.3
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Feb 13, 2024 at 04:34 PM
-- Server version: 10.4.24-MariaDB
-- PHP Version: 7.4.28

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `mydata`
--

-- --------------------------------------------------------

--
-- Stand-in structure for view `doing`
-- (See below for the actual view)
--
CREATE TABLE `doing` (
`item_id` int(11)
,`title` varchar(255)
,`category` varchar(255)
,`duedate` date
,`estimate` varchar(255)
,`importance` enum('High','Medium','Low')
,`item_status` int(11)
);

-- --------------------------------------------------------

--
-- Stand-in structure for view `done`
-- (See below for the actual view)
--
CREATE TABLE `done` (
`item_id` int(11)
,`title` varchar(255)
,`category` varchar(255)
,`duedate` date
,`estimate` varchar(255)
,`importance` enum('High','Medium','Low')
,`item_status` int(11)
);

-- --------------------------------------------------------

--
-- Table structure for table `items`
--

CREATE TABLE `items` (
  `item_id` int(11) NOT NULL,
  `title` varchar(255) NOT NULL,
  `category` varchar(255) NOT NULL,
  `duedate` date NOT NULL,
  `estimate` varchar(255) NOT NULL,
  `importance` enum('High','Medium','Low') NOT NULL,
  `item_status` int(11) NOT NULL,
  `item_user` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `items`
--

INSERT INTO `items` (`item_id`, `title`, `category`, `duedate`, `estimate`, `importance`, `item_status`, `item_user`) VALUES
(1, 'Prepare the assay', 'Education', '2022-12-12', '6 hours', 'High', 1, 1),
(2, 'Format the PC', 'General clean up', '2022-10-12', '3 hours', 'Low', 1, 1),
(3, 'Contact the support team of XYZ software to ask about the guarantee pricing ', 'Follow Up', '2022-10-01', '0.5 hours', 'Medium', 1, 1),
(4, 'Translate the resume', 'Job Opportunity ', '2022-10-10', '2 hours', 'Low', 2, 1),
(5, 'Fix the power button of the TV', 'House improvement\r\n', '0000-00-00', '1 hour', 'Medium', 2, 1),
(6, 'Prepare the XD design', 'Final Year Project', '2022-01-01', '8 days', 'High', 3, 1),
(7, 'Email the faculty director about the progress', 'Final Year Project', '0000-00-00', '15 minutes', '', 3, 1);

-- --------------------------------------------------------

--
-- Table structure for table `status`
--

CREATE TABLE `status` (
  `status_id` int(11) NOT NULL,
  `status` enum('To Do','Doing','Done') NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `status`
--

INSERT INTO `status` (`status_id`, `status`) VALUES
(1, 'To Do'),
(2, 'Doing'),
(3, 'Done');

-- --------------------------------------------------------

--
-- Stand-in structure for view `todo`
-- (See below for the actual view)
--
CREATE TABLE `todo` (
`item_id` int(11)
,`title` varchar(255)
,`category` varchar(255)
,`duedate` date
,`estimate` varchar(255)
,`importance` enum('High','Medium','Low')
,`item_status` int(11)
);

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `user_id` int(11) NOT NULL,
  `email` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `username` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`user_id`, `email`, `password`, `username`) VALUES
(1, 'fadi@gmail.com', 'fadi2024', 'fadi');

-- --------------------------------------------------------

--
-- Structure for view `doing`
--
DROP TABLE IF EXISTS `doing`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `doing`  AS SELECT `items`.`item_id` AS `item_id`, `items`.`title` AS `title`, `items`.`category` AS `category`, `items`.`duedate` AS `duedate`, `items`.`estimate` AS `estimate`, `items`.`importance` AS `importance`, `items`.`item_status` AS `item_status` FROM `items` WHERE `items`.`item_status` = 22  ;

-- --------------------------------------------------------

--
-- Structure for view `done`
--
DROP TABLE IF EXISTS `done`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `done`  AS SELECT `items`.`item_id` AS `item_id`, `items`.`title` AS `title`, `items`.`category` AS `category`, `items`.`duedate` AS `duedate`, `items`.`estimate` AS `estimate`, `items`.`importance` AS `importance`, `items`.`item_status` AS `item_status` FROM `items` WHERE `items`.`item_status` = 33  ;

-- --------------------------------------------------------

--
-- Structure for view `todo`
--
DROP TABLE IF EXISTS `todo`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `todo`  AS SELECT `items`.`item_id` AS `item_id`, `items`.`title` AS `title`, `items`.`category` AS `category`, `items`.`duedate` AS `duedate`, `items`.`estimate` AS `estimate`, `items`.`importance` AS `importance`, `items`.`item_status` AS `item_status` FROM `items` WHERE `items`.`item_status` = 11  ;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `items`
--
ALTER TABLE `items`
  ADD PRIMARY KEY (`item_id`),
  ADD KEY `item_status` (`item_status`),
  ADD KEY `item_user` (`item_user`);

--
-- Indexes for table `status`
--
ALTER TABLE `status`
  ADD PRIMARY KEY (`status_id`),
  ADD UNIQUE KEY `status` (`status`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`user_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `items`
--
ALTER TABLE `items`
  MODIFY `item_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `status`
--
ALTER TABLE `status`
  MODIFY `status_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `user_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `items`
--
ALTER TABLE `items`
  ADD CONSTRAINT `items_ibfk_1` FOREIGN KEY (`item_status`) REFERENCES `status` (`status_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `items_ibfk_2` FOREIGN KEY (`item_user`) REFERENCES `users` (`user_id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
