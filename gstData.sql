-- phpMyAdmin SQL Dump
-- version 4.9.0.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Sep 30, 2019 at 11:11 AM
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
-- Database: `gstData`
--

-- --------------------------------------------------------

--
-- Table structure for table `gst_1`
--

CREATE TABLE `gst_1` (
  `GST_1_id` int(11) NOT NULL,
  `invoice_no` int(11) DEFAULT NULL,
  `GST_no_user` varchar(15) NOT NULL,
  `taxable_value` decimal(7,2) DEFAULT NULL,
  `tax_liability` decimal(7,2) DEFAULT NULL,
  `CGST` decimal(7,2) DEFAULT NULL,
  `SGST` decimal(7,2) DEFAULT NULL,
  `IGST` decimal(7,2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `gst_2`
--

CREATE TABLE `gst_2` (
  `GST_2_id` int(11) NOT NULL,
  `invoice_no` int(11) DEFAULT NULL,
  `GST_no_user` varchar(15) NOT NULL,
  `GST_no_seller` varchar(15) NOT NULL,
  `CGST` decimal(10,2) DEFAULT NULL,
  `SGST` decimal(10,2) DEFAULT NULL,
  `ITC` decimal(10,2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `gst_3`
--

CREATE TABLE `gst_3` (
  `GST_3_id` int(11) NOT NULL,
  `GST_1_id` int(11) DEFAULT NULL,
  `GST_2_id` int(11) DEFAULT NULL,
  `GSTR_3` decimal(11,2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `invoice`
--

CREATE TABLE `invoice` (
  `invoice_no` int(11) NOT NULL,
  `P_id` int(11) DEFAULT NULL,
  `invoice_date` date DEFAULT NULL,
  `invoice_value` decimal(7,2) DEFAULT NULL,
  `Inter_or_intra` tinyint(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `product`
--

CREATE TABLE `product` (
  `P_id` int(11) NOT NULL,
  `P_name` varchar(20) NOT NULL,
  `P_category` varchar(20) DEFAULT NULL,
  `gst_slab` decimal(5,2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE `user` (
  `gst_no` varchar(15) NOT NULL,
  `name` varchar(20) NOT NULL,
  `email` varchar(30) DEFAULT NULL,
  `password` varchar(18) NOT NULL,
  `phone_no` decimal(10,0) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `gst_1`
--
ALTER TABLE `gst_1`
  ADD PRIMARY KEY (`GST_1_id`),
  ADD KEY `invoice_no_1` (`invoice_no`),
  ADD KEY `GST1_no_user` (`GST_no_user`);

--
-- Indexes for table `gst_2`
--
ALTER TABLE `gst_2`
  ADD PRIMARY KEY (`GST_2_id`),
  ADD KEY `invoice_no_2` (`invoice_no`),
  ADD KEY `GST2_no_user` (`GST_no_user`);

--
-- Indexes for table `gst_3`
--
ALTER TABLE `gst_3`
  ADD PRIMARY KEY (`GST_3_id`),
  ADD KEY `GST_1_id` (`GST_1_id`),
  ADD KEY `GST_2_id` (`GST_2_id`);

--
-- Indexes for table `invoice`
--
ALTER TABLE `invoice`
  ADD PRIMARY KEY (`invoice_no`),
  ADD KEY `P_id` (`P_id`);

--
-- Indexes for table `product`
--
ALTER TABLE `product`
  ADD PRIMARY KEY (`P_id`);

--
-- Indexes for table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`gst_no`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `gst_1`
--
ALTER TABLE `gst_1`
  MODIFY `GST_1_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `gst_2`
--
ALTER TABLE `gst_2`
  MODIFY `GST_2_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `gst_3`
--
ALTER TABLE `gst_3`
  MODIFY `GST_3_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `invoice`
--
ALTER TABLE `invoice`
  MODIFY `invoice_no` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `product`
--
ALTER TABLE `product`
  MODIFY `P_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `gst_1`
--
ALTER TABLE `gst_1`
  ADD CONSTRAINT `GST1_no_user` FOREIGN KEY (`GST_no_user`) REFERENCES `user` (`gst_no`),
  ADD CONSTRAINT `invoice_no_1` FOREIGN KEY (`invoice_no`) REFERENCES `invoice` (`invoice_no`);

--
-- Constraints for table `gst_2`
--
ALTER TABLE `gst_2`
  ADD CONSTRAINT `GST2_no_user` FOREIGN KEY (`GST_no_user`) REFERENCES `user` (`gst_no`),
  ADD CONSTRAINT `invoice_no_2` FOREIGN KEY (`invoice_no`) REFERENCES `invoice` (`invoice_no`);

--
-- Constraints for table `gst_3`
--
ALTER TABLE `gst_3`
  ADD CONSTRAINT `GST_1_id` FOREIGN KEY (`GST_1_id`) REFERENCES `gst_1` (`GST_1_id`),
  ADD CONSTRAINT `GST_2_id` FOREIGN KEY (`GST_2_id`) REFERENCES `gst_2` (`GST_2_id`);

--
-- Constraints for table `invoice`
--
ALTER TABLE `invoice`
  ADD CONSTRAINT `P_id` FOREIGN KEY (`P_id`) REFERENCES `product` (`P_id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
