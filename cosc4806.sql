-- phpMyAdmin SQL Dump
-- version 4.7.4
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Dec 04, 2017 at 05:08 AM
-- Server version: 10.1.26-MariaDB
-- PHP Version: 7.1.9

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `cosc4806`
--

-- --------------------------------------------------------

--
-- Table structure for table `tbl_city`
--

CREATE TABLE `tbl_city` (
  `id` int(11) NOT NULL,
  `name` varchar(150) NOT NULL,
  `province_name` varchar(15) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `tbl_city`
--

INSERT INTO `tbl_city` (`id`, `name`, `province_name`) VALUES
(1, 'Toronto', 'Ontario'),
(2, 'Belleville', 'Ontario'),
(3, 'Brant', 'Ontario'),
(4, 'Airdrie', 'Alberta'),
(5, 'Brooks', 'Alberta'),
(6, 'Calgary', 'Alberta'),
(7, 'Brandon', 'Manitoba'),
(8, 'Dauphin', 'Manitoba'),
(9, 'Winkler', 'Manitoba');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_client`
--

CREATE TABLE `tbl_client` (
  `id` int(11) NOT NULL,
  `name` varchar(150) NOT NULL,
  `dob` date NOT NULL,
  `email` varchar(150) NOT NULL,
  `phone` varchar(150) NOT NULL,
  `city` int(11) NOT NULL,
  `createdBy` varchar(150) NOT NULL,
  `updatedBy` varchar(150) NOT NULL,
  `createdDate` datetime NOT NULL,
  `updatedDate` datetime NOT NULL,
  `note` text
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `tbl_client`
--

INSERT INTO `tbl_client` (`id`, `name`, `dob`, `email`, `phone`, `city`, `createdBy`, `updatedBy`, `createdDate`, `updatedDate`, `note`) VALUES
(1, 'Client 01', '2010-01-01', 'c01@algomau.ca', '1234567891', 7, 'staff3', 'staff3', '2017-11-06 07:29:05', '2017-11-06 08:31:19', 'NOTE for client 01.'),
(2, 'Client 01', '2013-10-28', 'hello@algomau.ca', '1234567890', 9, 'staff3', 'staff3', '2017-11-06 08:40:10', '2017-11-06 08:40:10', 'hello');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_province`
--

CREATE TABLE `tbl_province` (
  `province_name` varchar(150) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `tbl_province`
--

INSERT INTO `tbl_province` (`province_name`) VALUES
('Alberta'),
('Manitoba'),
('Ontario');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_user`
--

CREATE TABLE `tbl_user` (
  `username` varchar(150) NOT NULL,
  `password` varchar(150) NOT NULL,
  `role` varchar(150) NOT NULL,
  `managedBy` varchar(150) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `tbl_user`
--

INSERT INTO `tbl_user` (`username`, `password`, `role`, `managedBy`) VALUES
('admin', '$1$rrsZDlAh$JxJczvUrxcJgJn46zw5gn1', 'admin', ''),
('manager1', 'manager1', 'manager', ''),
('manager2', '$1$f1ZrKWVp$EMUkJ7ks4ww2vmd.AtX8y.', 'manager', NULL),
('staff3', '$1$76I0h/MG$zjwMVTwPKtVE.q.OzBi.Z1', 'staff', 'manager1');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `tbl_city`
--
ALTER TABLE `tbl_city`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_province` (`province_name`);

--
-- Indexes for table `tbl_client`
--
ALTER TABLE `tbl_client`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_city` (`city`),
  ADD KEY `fk_createdBy` (`createdBy`),
  ADD KEY `fk_updatedBy` (`updatedBy`);

--
-- Indexes for table `tbl_province`
--
ALTER TABLE `tbl_province`
  ADD PRIMARY KEY (`province_name`);

--
-- Indexes for table `tbl_user`
--
ALTER TABLE `tbl_user`
  ADD PRIMARY KEY (`username`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `tbl_city`
--
ALTER TABLE `tbl_city`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `tbl_client`
--
ALTER TABLE `tbl_client`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `tbl_city`
--
ALTER TABLE `tbl_city`
  ADD CONSTRAINT `fk_province` FOREIGN KEY (`province_name`) REFERENCES `tbl_province` (`province_name`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `tbl_client`
--
ALTER TABLE `tbl_client`
  ADD CONSTRAINT `fk_city` FOREIGN KEY (`city`) REFERENCES `tbl_city` (`id`),
  ADD CONSTRAINT `fk_createdBy` FOREIGN KEY (`createdBy`) REFERENCES `tbl_user` (`username`),
  ADD CONSTRAINT `fk_updatedBy` FOREIGN KEY (`updatedBy`) REFERENCES `tbl_user` (`username`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
