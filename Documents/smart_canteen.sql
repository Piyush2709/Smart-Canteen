-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Nov 16, 2023 at 08:22 AM
-- Server version: 10.4.28-MariaDB
-- PHP Version: 8.2.4

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `smart_canteen`
--

-- --------------------------------------------------------

--
-- Table structure for table `tbl_adminsignup`
--

CREATE TABLE `tbl_adminsignup` (
  `admin_id` int(20) NOT NULL,
  `username` varchar(50) DEFAULT NULL,
  `email` varchar(50) DEFAULT NULL,
  `phone_no` int(15) DEFAULT NULL,
  `password` varchar(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_cancelledorders`
--

CREATE TABLE `tbl_cancelledorders` (
  `order_id` int(10) NOT NULL,
  `username` varchar(50) DEFAULT NULL,
  `Menu_name` varchar(50) DEFAULT NULL,
  `Menu_price` int(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_completedorders`
--

CREATE TABLE `tbl_completedorders` (
  `order_id` int(10) NOT NULL,
  `username` varchar(50) DEFAULT NULL,
  `Menu_name` varchar(50) DEFAULT NULL,
  `Menu_price` int(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_emp`
--

CREATE TABLE `tbl_emp` (
  `emp_name` varchar(50) DEFAULT NULL,
  `emp_no` int(50) DEFAULT NULL,
  `emp_profile` varchar(50) DEFAULT NULL,
  `emp_id` int(50) NOT NULL,
  `emp_proof` varchar(50) DEFAULT NULL,
  `emp_address` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_emp_attedance`
--

CREATE TABLE `tbl_emp_attedance` (
  `emp_id` int(10) NOT NULL,
  `emp_name` varchar(50) DEFAULT NULL,
  `date` date DEFAULT NULL,
  `status` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_menu`
--

CREATE TABLE `tbl_menu` (
  `menu_id` int(10) NOT NULL,
  `menu_name` varchar(50) DEFAULT NULL,
  `menu_price` int(20) DEFAULT NULL,
  `menu_description` varchar(60) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_orders`
--

CREATE TABLE `tbl_orders` (
  `order_id` int(10) NOT NULL,
  `username` varchar(50) DEFAULT NULL,
  `Menu_name` varchar(50) DEFAULT NULL,
  `Menu_price` int(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_usersignup`
--

CREATE TABLE `tbl_usersignup` (
  `user_id` int(10) NOT NULL,
  `username` varchar(50) DEFAULT NULL,
  `email` varchar(50) DEFAULT NULL,
  `phone_no` int(15) DEFAULT NULL,
  `password` varchar(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `tbl_adminsignup`
--
ALTER TABLE `tbl_adminsignup`
  ADD PRIMARY KEY (`admin_id`);

--
-- Indexes for table `tbl_cancelledorders`
--
ALTER TABLE `tbl_cancelledorders`
  ADD PRIMARY KEY (`order_id`);

--
-- Indexes for table `tbl_completedorders`
--
ALTER TABLE `tbl_completedorders`
  ADD PRIMARY KEY (`order_id`);

--
-- Indexes for table `tbl_emp`
--
ALTER TABLE `tbl_emp`
  ADD PRIMARY KEY (`emp_id`);

--
-- Indexes for table `tbl_emp_attedance`
--
ALTER TABLE `tbl_emp_attedance`
  ADD PRIMARY KEY (`emp_id`);

--
-- Indexes for table `tbl_menu`
--
ALTER TABLE `tbl_menu`
  ADD PRIMARY KEY (`menu_id`);

--
-- Indexes for table `tbl_orders`
--
ALTER TABLE `tbl_orders`
  ADD PRIMARY KEY (`order_id`);

--
-- Indexes for table `tbl_usersignup`
--
ALTER TABLE `tbl_usersignup`
  ADD PRIMARY KEY (`user_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `tbl_adminsignup`
--
ALTER TABLE `tbl_adminsignup`
  MODIFY `admin_id` int(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tbl_cancelledorders`
--
ALTER TABLE `tbl_cancelledorders`
  MODIFY `order_id` int(10) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tbl_completedorders`
--
ALTER TABLE `tbl_completedorders`
  MODIFY `order_id` int(10) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tbl_emp`
--
ALTER TABLE `tbl_emp`
  MODIFY `emp_id` int(50) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tbl_emp_attedance`
--
ALTER TABLE `tbl_emp_attedance`
  MODIFY `emp_id` int(10) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tbl_menu`
--
ALTER TABLE `tbl_menu`
  MODIFY `menu_id` int(10) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tbl_orders`
--
ALTER TABLE `tbl_orders`
  MODIFY `order_id` int(10) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tbl_usersignup`
--
ALTER TABLE `tbl_usersignup`
  MODIFY `user_id` int(10) NOT NULL AUTO_INCREMENT;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
