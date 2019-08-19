-- phpMyAdmin SQL Dump
-- version 4.5.2
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: Sep 17, 2017 at 06:11 AM
-- Server version: 10.1.19-MariaDB
-- PHP Version: 7.0.13

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `webservices`
--

-- --------------------------------------------------------

--
-- Table structure for table `detail`
--

CREATE TABLE `detail` (
  `id` int(10) UNSIGNED NOT NULL COMMENT 'primary key',
  `name` varchar(255) NOT NULL,
  `age` int(10) UNSIGNED DEFAULT NULL,
  `product_id` int(10) UNSIGNED NOT NULL COMMENT 'foreign key reference of products table',
  `company` varchar(255) DEFAULT NULL,
  `address` text,
  `mobile` bigint(20) UNSIGNED DEFAULT NULL,
  `email` varchar(100) NOT NULL,
  `height` float UNSIGNED DEFAULT NULL,
  `weight` float UNSIGNED DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'time stamp when row was created',
  `update_at` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT 'time stamp when row was updated',
  `deleted_at` timestamp NULL DEFAULT NULL COMMENT 'time stamp when row was deleted'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `detail`
--

INSERT INTO `detail` (`id`, `name`, `age`, `product_id`, `company`, `address`, `mobile`, `email`, `height`, `weight`, `created_at`, `update_at`, `deleted_at`) VALUES
(1, 'Saurabh', 26, 1, 'Appster', 'gurgaon', 987393757, 'saurabhsharma147@gmail.com', 23, 27, '2017-09-14 16:37:06', NULL, NULL),
(14, 'Saurabh', 24, 1, 'Appster', 'Gurgaon', 9873937577, 'saurabhsharma147@gmail.com', 1.4, 3.2, '2017-09-17 04:10:48', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `products`
--

CREATE TABLE `products` (
  `id` int(10) UNSIGNED NOT NULL COMMENT 'primary key of products table',
  `product_name` varchar(255) NOT NULL COMMENT 'name of the product',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'timestamp when product was added',
  `updated_at` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT 'timestamp when product was updated',
  `deleted_at` timestamp NULL DEFAULT NULL COMMENT 'timestamp when product was deleted'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `products`
--

INSERT INTO `products` (`id`, `product_name`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 'Samsung Galaxy', '2017-09-14 16:32:06', NULL, NULL),
(2, 'Lenovo K8 Plus', '2017-09-14 16:32:06', NULL, NULL),
(3, 'VIVO V5 Plus', '2017-09-14 16:32:50', NULL, NULL),
(4, 'Apple iPhone 6', '2017-09-14 16:32:50', NULL, NULL);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `detail`
--
ALTER TABLE `detail`
  ADD PRIMARY KEY (`id`),
  ADD KEY `product_id` (`product_id`);

--
-- Indexes for table `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `detail`
--
ALTER TABLE `detail`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'primary key', AUTO_INCREMENT=15;
--
-- AUTO_INCREMENT for table `products`
--
ALTER TABLE `products`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'primary key of products table', AUTO_INCREMENT=5;
--
-- Constraints for dumped tables
--

--
-- Constraints for table `detail`
--
ALTER TABLE `detail`
  ADD CONSTRAINT `products_product_id_fk` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
