-- phpMyAdmin SQL Dump
-- version 4.9.0.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Oct 15, 2019 at 08:50 PM
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
-- Database: `login`
--

-- --------------------------------------------------------

--
-- Table structure for table `category`
--

CREATE TABLE `category` (
  `cat_id` int(11) NOT NULL,
  `P_category` varchar(20) CHARACTER SET latin1 NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_mysql500_ci;

--
-- Dumping data for table `category`
--

INSERT INTO `category` (`cat_id`, `P_category`) VALUES
(1, 'CLOTHES'),
(2, 'COSMETICS'),
(3, 'DAIRY'),
(4, 'DRINKS'),
(5, 'ELECTRONICS'),
(6, 'FOOD'),
(7, 'FOSSIL FUELS'),
(8, 'MEDICINES'),
(9, 'STATIONARY'),
(10, 'SPORTS GOODS'),
(11, 'TRAVEL & TOURISM'),
(12, 'UTENSILS');

-- --------------------------------------------------------

--
-- Table structure for table `gst_1`
--

CREATE TABLE `gst_1` (
  `GST_1_id` int(11) NOT NULL,
  `invoice_no` int(11) DEFAULT NULL,
  `GST_no_user` varchar(15) CHARACTER SET latin1 NOT NULL,
  `taxable_value` decimal(7,2) DEFAULT NULL,
  `tax_liability` int(11) DEFAULT NULL,
  `CGST` int(11) DEFAULT NULL,
  `SGST` int(11) DEFAULT NULL,
  `IGST` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_mysql500_ci;

--
-- Dumping data for table `gst_1`
--

INSERT INTO `gst_1` (`GST_1_id`, `invoice_no`, `GST_no_user`, `taxable_value`, `tax_liability`, `CGST`, `SGST`, `IGST`) VALUES
(4, 696, '35AABCS1429B1ZX', '8800.00', 1200, 0, 0, 1200),
(5, 999, '35AABCS1429B1ZX', '88.00', 12, 0, 0, 12),
(6, 55, '35AABCS1429B1ZX', '1.00', 0, 0, 0, 0),
(8, 899, 'XXXXXXXXXXXXXXX', '88.00', 12, 6, 6, 0),
(16, 690, 'YYYYYYYYYYYYYYY', '440.00', 60, 30, 30, 0),
(17, 760, 'YYYYYYYYYYYYYYY', '96.00', 4, 2, 2, 0),
(18, 785, 'XXXXXXXXXXXXXXX', '164.00', 36, 18, 18, 0),
(19, 954, 'XXXXXXXXXXXXXXX', '144.00', 56, 0, 0, 56);

--
-- Triggers `gst_1`
--
DELIMITER $$
CREATE TRIGGER `delete_invoice` AFTER DELETE ON `gst_1` FOR EACH ROW BEGIN
DELETE FROM invoice WHERE invoice.invoice_no = old.invoice_no;
END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `gst_2`
--

CREATE TABLE `gst_2` (
  `GST_2_id` int(11) NOT NULL,
  `GST_no_user` varchar(15) CHARACTER SET latin1 NOT NULL,
  `GST_no_seller` varchar(15) CHARACTER SET latin1 NOT NULL,
  `CGST` int(11) DEFAULT NULL,
  `SGST` int(11) DEFAULT NULL,
  `ITC` int(11) DEFAULT NULL,
  `invoice_no` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_mysql500_ci;

--
-- Dumping data for table `gst_2`
--

INSERT INTO `gst_2` (`GST_2_id`, `GST_no_user`, `GST_no_seller`, `CGST`, `SGST`, `ITC`, `invoice_no`) VALUES
(3, 'XXXXXXXXXXXXXXX', 'XXXXXXXXXXXXXXY', 90, 90, 180, 32),
(4, 'XXXXXXXXXXXXXXX', 'XXXXXXXXXXXXXXY', 9, 9, 18, 20),
(5, 'XXXXXXXXXXXXXXX', 'XXXXXXXXXXXXXXY', 18, 18, 36, 786),
(6, 'XXXXXXXXXXXXXXX', 'XXXYYYXXXYYYXXX', 60, 60, 120, 410),
(7, 'XXXXXXXXXXXXXXX', 'XXYYXXYYXXYYXXX', 900, 900, 1800, 310);

--
-- Triggers `gst_2`
--
DELIMITER $$
CREATE TRIGGER `delete_invoice_buys` AFTER DELETE ON `gst_2` FOR EACH ROW BEGIN
DELETE from invoice_buys WHERE invoice_buys.invoice_no = old.invoice_no;
END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `gst_3`
--

CREATE TABLE `gst_3` (
  `GST_3_id` int(11) NOT NULL,
  `GST_1_id` int(11) DEFAULT NULL,
  `GST_2_id` int(11) DEFAULT NULL,
  `GSTR_3` decimal(11,2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_mysql500_ci;

-- --------------------------------------------------------

--
-- Table structure for table `invoice`
--

CREATE TABLE `invoice` (
  `invoice_no` int(11) NOT NULL,
  `invoice_date` varchar(18) COLLATE utf8_general_mysql500_ci DEFAULT NULL,
  `invoice_value` decimal(7,2) DEFAULT NULL,
  `Inter_or_intra` tinyint(1) DEFAULT NULL,
  `P_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_mysql500_ci;

--
-- Dumping data for table `invoice`
--

INSERT INTO `invoice` (`invoice_no`, `invoice_date`, `invoice_value`, `Inter_or_intra`, `P_id`) VALUES
(21, '03-10-2019', '100.00', 0, NULL),
(25, '03-10-2019', '1000.00', 0, NULL),
(55, '02-10-2019', '1.00', 1, NULL),
(58, '02-10-2019', '100.00', 0, NULL),
(75, '04-10-2019', '1000.00', 0, NULL),
(88, '03-10-2019', '100.00', 1, NULL),
(121, '16-09-2019', '100.00', 1, NULL),
(690, '12-10-2019', '500.00', 0, 695),
(696, '01-10-2019', '10000.00', 1, NULL),
(760, '04-10-2019', '100.00', 0, 761),
(785, '01-10-2019', '200.00', 0, 784),
(899, '03-09-2019', '100.00', 0, NULL),
(954, '01-10-2019', '200.00', 1, 8954),
(999, '17-09-2019', '100.00', 1, NULL);

--
-- Triggers `invoice`
--
DELIMITER $$
CREATE TRIGGER `delete_product` AFTER DELETE ON `invoice` FOR EACH ROW BEGIN
DELETE FROM product where product.P_id = old.P_id;
END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `invoice_buys`
--

CREATE TABLE `invoice_buys` (
  `invoice_no` int(11) NOT NULL,
  `invoice_date` varchar(18) CHARACTER SET latin1 DEFAULT NULL,
  `invoice_value` decimal(10,2) DEFAULT NULL,
  `P_id_buys` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_mysql500_ci;

--
-- Dumping data for table `invoice_buys`
--

INSERT INTO `invoice_buys` (`invoice_no`, `invoice_date`, `invoice_value`, `P_id_buys`) VALUES
(20, '11-10-2019', '100.00', 202),
(32, '12-10-2019', '1000.00', 31),
(52, '10-10-2019', '1100.00', 420),
(310, '05-10-2019', '10000.00', 311),
(410, '04-10-2019', '1000.00', 411),
(510, '05-10-2019', '1000.00', 511),
(786, '04-10-2019', '200.00', 78),
(1210, '04-10-2019', '1000.00', NULL);

--
-- Triggers `invoice_buys`
--
DELIMITER $$
CREATE TRIGGER `delete_product_buys` AFTER DELETE ON `invoice_buys` FOR EACH ROW BEGIN
DELETE FROM product_buys WHERE product_buys.P_id_buys = old.P_id_buys;
END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `product`
--

CREATE TABLE `product` (
  `P_id` int(11) NOT NULL,
  `P_name` varchar(20) CHARACTER SET latin1 NOT NULL,
  `gst_slab` decimal(7,2) DEFAULT NULL,
  `cat_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_mysql500_ci;

--
-- Dumping data for table `product`
--

INSERT INTO `product` (`P_id`, `P_name`, `gst_slab`, `cat_id`) VALUES
(20, 'ARPIT', '12.00', NULL),
(22, 'BEDARE', '18.00', NULL),
(23, 'SHIRT', '12.00', NULL),
(33, 'ARPIT', '12.00', NULL),
(39, 'ARPIT', '12.00', NULL),
(62, 'AMOD', '12.00', NULL),
(63, 'NAIR', '0.00', NULL),
(65, 'REEVA', '18.00', NULL),
(125, 'BATTERY', '12.00', NULL),
(199, '', NULL, NULL),
(200, 'MOBILE', NULL, NULL),
(201, 'GASOLINE', NULL, NULL),
(202, 'SHIRT', NULL, NULL),
(203, 'MOBILE', NULL, NULL),
(204, 'SHIRT', NULL, NULL),
(205, 'MOBILE', NULL, NULL),
(206, 'GHEE', NULL, NULL),
(207, 'xyz', NULL, NULL),
(208, 'zx', NULL, NULL),
(375, 'ARPIT', '12.00', NULL),
(559, 'BEER', '28.00', NULL),
(585, 'AMOD', '12.00', NULL),
(632, 'MEET', '12.00', NULL),
(695, 'SHIRT', '12.00', 1),
(761, 'MILK', '5.00', 3),
(784, 'LIPSTICK', '18.00', 2),
(1201, 'UDDHAV', '28.00', NULL),
(1321, 'ROHAN', '28.00', NULL),
(6969, 'REDMI', '12.00', NULL),
(6970, 'ROHAN', '5.00', NULL),
(6971, 'ROHAN', '5.00', NULL),
(6972, 'ROHAN', '5.00', NULL),
(7860, 'ANIMESH', '12.00', NULL),
(8954, 'FACEPACK', '28.00', 2);

-- --------------------------------------------------------

--
-- Table structure for table `product_buys`
--

CREATE TABLE `product_buys` (
  `P_id_buys` int(11) NOT NULL,
  `P_name` varchar(20) COLLATE utf8_general_mysql500_ci DEFAULT NULL,
  `cat_id` int(11) DEFAULT NULL,
  `gst_slab` decimal(7,2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_mysql500_ci;

--
-- Dumping data for table `product_buys`
--

INSERT INTO `product_buys` (`P_id_buys`, `P_name`, `cat_id`, `gst_slab`) VALUES
(31, 'CAR', 7, '18.00'),
(78, 'FUEL', 7, '18.00'),
(202, 'GASOLINE', 7, '18.00'),
(212, 'bnm', 1, '0.00'),
(311, 'LAPTOP', 5, '18.00'),
(411, 'SHIRT', 1, '12.00'),
(420, 'MOUSE', 5, '12.00'),
(511, 'SHIRT', 1, '12.00'),
(633, 'KEYBOARD', 5, '12.00'),
(1211, 'MOUSE', 5, '12.00'),
(2221, 'KEYBOARD', 5, '12.00'),
(9091, 'MOUSE', 5, '5.00');

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE `user` (
  `gst_no` varchar(15) CHARACTER SET latin1 NOT NULL,
  `name` varchar(20) CHARACTER SET latin1 NOT NULL,
  `email` varchar(30) CHARACTER SET latin1 DEFAULT NULL,
  `password` varchar(18) CHARACTER SET latin1 NOT NULL,
  `phone_no` decimal(10,0) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_mysql500_ci;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`gst_no`, `name`, `email`, `password`, `phone_no`) VALUES
('35AABCS1429B1ZX', 'AMOD', 'amoddhopavkar2@gmail.com', 'amod123', '9881497495'),
('XXXXXXXXXXXXXXX', 'Arpit', 'arpit@gmail.com', 'arpit123', '9011745568'),
('YYYYYYYYYYYYYYY', 'ANIKET', 'aniket123@gmail.com', 'aniket123', '9823563210');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `category`
--
ALTER TABLE `category`
  ADD PRIMARY KEY (`cat_id`);

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
  ADD KEY `GST2_no_user` (`GST_no_user`),
  ADD KEY `invoice_no_buys` (`invoice_no`);

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
  ADD KEY `P_id_sells` (`P_id`);

--
-- Indexes for table `invoice_buys`
--
ALTER TABLE `invoice_buys`
  ADD PRIMARY KEY (`invoice_no`),
  ADD KEY `P_id_buys` (`P_id_buys`);

--
-- Indexes for table `product`
--
ALTER TABLE `product`
  ADD PRIMARY KEY (`P_id`),
  ADD KEY `cat_id` (`cat_id`);

--
-- Indexes for table `product_buys`
--
ALTER TABLE `product_buys`
  ADD PRIMARY KEY (`P_id_buys`),
  ADD KEY `cat_id_buys` (`cat_id`);

--
-- Indexes for table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`gst_no`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `category`
--
ALTER TABLE `category`
  MODIFY `cat_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `gst_1`
--
ALTER TABLE `gst_1`
  MODIFY `GST_1_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;

--
-- AUTO_INCREMENT for table `gst_2`
--
ALTER TABLE `gst_2`
  MODIFY `GST_2_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `gst_3`
--
ALTER TABLE `gst_3`
  MODIFY `GST_3_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `invoice`
--
ALTER TABLE `invoice`
  MODIFY `invoice_no` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1000;

--
-- AUTO_INCREMENT for table `invoice_buys`
--
ALTER TABLE `invoice_buys`
  MODIFY `invoice_no` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1211;

--
-- AUTO_INCREMENT for table `product`
--
ALTER TABLE `product`
  MODIFY `P_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8955;

--
-- AUTO_INCREMENT for table `product_buys`
--
ALTER TABLE `product_buys`
  MODIFY `P_id_buys` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9092;

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
  ADD CONSTRAINT `invoice_no_buys` FOREIGN KEY (`invoice_no`) REFERENCES `invoice_buys` (`invoice_no`);

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
  ADD CONSTRAINT `P_id_sells` FOREIGN KEY (`P_id`) REFERENCES `product` (`P_id`);

--
-- Constraints for table `invoice_buys`
--
ALTER TABLE `invoice_buys`
  ADD CONSTRAINT `P_id_buys` FOREIGN KEY (`P_id_buys`) REFERENCES `product_buys` (`P_id_buys`);

--
-- Constraints for table `product`
--
ALTER TABLE `product`
  ADD CONSTRAINT `cat_id` FOREIGN KEY (`cat_id`) REFERENCES `category` (`cat_id`);

--
-- Constraints for table `product_buys`
--
ALTER TABLE `product_buys`
  ADD CONSTRAINT `cat_id_buys` FOREIGN KEY (`cat_id`) REFERENCES `category` (`cat_id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
