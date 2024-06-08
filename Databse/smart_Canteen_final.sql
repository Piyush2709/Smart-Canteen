-- MySQL dump 10.13  Distrib 5.7.17, for Win64 (x86_64)
--
-- Host: localhost    Database: smart_canteen
-- ------------------------------------------------------
-- Server version	5.7.18-log

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `tbl_adminsignup`
--

DROP TABLE IF EXISTS `tbl_adminsignup`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tbl_adminsignup` (
  `admin_id` int(20) NOT NULL AUTO_INCREMENT,
  `username` varchar(50) DEFAULT NULL,
  `email` varchar(50) DEFAULT NULL,
  `phone_no` bigint(50) DEFAULT NULL,
  `password` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`admin_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_adminsignup`
--

LOCK TABLES `tbl_adminsignup` WRITE;
/*!40000 ALTER TABLE `tbl_adminsignup` DISABLE KEYS */;
INSERT INTO `tbl_adminsignup` VALUES (1,'piyu','piy@gmail.com',7038001196,'piy@27'),(2,'admin','admin@gmail.com',7038001196,'admin');
/*!40000 ALTER TABLE `tbl_adminsignup` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_cancelledorders`
--

DROP TABLE IF EXISTS `tbl_cancelledorders`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tbl_cancelledorders` (
  `order_id` int(10) NOT NULL AUTO_INCREMENT,
  `username` varchar(50) DEFAULT NULL,
  `Menu_name` varchar(50) DEFAULT NULL,
  `Menu_price` int(20) DEFAULT NULL,
  `Menu_Qunt` int(20) DEFAULT NULL,
  PRIMARY KEY (`order_id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_cancelledorders`
--

LOCK TABLES `tbl_cancelledorders` WRITE;
/*!40000 ALTER TABLE `tbl_cancelledorders` DISABLE KEYS */;
INSERT INTO `tbl_cancelledorders` VALUES (1,'sojji','somoda',20,1),(2,'null','idli',22,1),(3,'null','Samossa',25,1),(4,'piyush','Samosa chaat',30,1),(5,'piyush','Samossa',25,1),(6,'piyush','Samosa chaat',30,1),(7,'piyush','Veg thali',50,1);
/*!40000 ALTER TABLE `tbl_cancelledorders` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_cart`
--

DROP TABLE IF EXISTS `tbl_cart`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tbl_cart` (
  `menu_id` int(11) NOT NULL AUTO_INCREMENT,
  `menu_name` varchar(50) NOT NULL,
  `menu_price` int(20) NOT NULL,
  `menu_description` varchar(80) NOT NULL,
  `menu_img` varchar(60) NOT NULL,
  PRIMARY KEY (`menu_id`)
) ENGINE=InnoDB AUTO_INCREMENT=34 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_cart`
--

LOCK TABLES `tbl_cart` WRITE;
/*!40000 ALTER TABLE `tbl_cart` DISABLE KEYS */;
INSERT INTO `tbl_cart` VALUES (32,'Veg thali',50,'thali..','Img/thali.png'),(33,'Samossa',25,'The Great Samosaaa','Img/samossa.png');
/*!40000 ALTER TABLE `tbl_cart` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_completedorders`
--

DROP TABLE IF EXISTS `tbl_completedorders`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tbl_completedorders` (
  `order_id` int(10) NOT NULL AUTO_INCREMENT,
  `username` varchar(50) DEFAULT NULL,
  `Menu_name` varchar(50) DEFAULT NULL,
  `Menu_price` int(50) DEFAULT NULL,
  `Menu_Qunt` int(20) DEFAULT NULL,
  PRIMARY KEY (`order_id`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_completedorders`
--

LOCK TABLES `tbl_completedorders` WRITE;
/*!40000 ALTER TABLE `tbl_completedorders` DISABLE KEYS */;
INSERT INTO `tbl_completedorders` VALUES (1,'piya','pani puri',21,1),(2,'null','Veg thali',50,1),(3,'null','Samossa',25,1),(4,'null','Veg thali',50,1),(5,'null','Samossa',25,1),(6,'null','Veg thali',50,1),(7,'null','Veg thali',50,1),(8,'null','Samossa',25,1),(9,'piyush','Veg thali',50,1),(10,'piyush','idli',22,1),(11,'piyush','Samossa',25,1),(12,'piyush','Samossa',25,1),(13,'piyush','Veg thali',50,1);
/*!40000 ALTER TABLE `tbl_completedorders` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_emp`
--

DROP TABLE IF EXISTS `tbl_emp`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tbl_emp` (
  `emp_name` varchar(50) DEFAULT NULL,
  `emp_no` bigint(50) DEFAULT NULL,
  `emp_profile` varchar(50) DEFAULT NULL,
  `emp_id` int(50) NOT NULL AUTO_INCREMENT,
  `emp_proof` varchar(50) DEFAULT NULL,
  `emp_address` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`emp_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_emp`
--

LOCK TABLES `tbl_emp` WRITE;
/*!40000 ALTER TABLE `tbl_emp` DISABLE KEYS */;
INSERT INTO `tbl_emp` VALUES ('monu',1234562452,'Img/wp4660137-anime-lofi-wallpapers.jpg',1,'Img/wallpaperflare.com_wallpaper.jpg','pune'),('sonu',1234567854,'Img/wallpaperflare.com_wallpaper.jpg',2,'Img/wp4660137-anime-lofi-wallpapers.jpg','baramati');
/*!40000 ALTER TABLE `tbl_emp` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_emp_attedance`
--

DROP TABLE IF EXISTS `tbl_emp_attedance`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tbl_emp_attedance` (
  `emp_id` int(10) NOT NULL AUTO_INCREMENT,
  `emp_name` varchar(50) DEFAULT NULL,
  `date` date DEFAULT NULL,
  `status` varchar(50) NOT NULL,
  PRIMARY KEY (`emp_id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_emp_attedance`
--

LOCK TABLES `tbl_emp_attedance` WRITE;
/*!40000 ALTER TABLE `tbl_emp_attedance` DISABLE KEYS */;
INSERT INTO `tbl_emp_attedance` VALUES (1,'monu','2023-11-24','Absent'),(2,'sonu','2023-11-24','Half-Day'),(3,'monu','2023-11-24','Present'),(4,'sonu','2023-11-24','Absent');
/*!40000 ALTER TABLE `tbl_emp_attedance` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_feedback`
--

DROP TABLE IF EXISTS `tbl_feedback`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tbl_feedback` (
  `username` varchar(50) NOT NULL,
  `Message` varchar(100) NOT NULL,
  `feedback_id` int(11) NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`feedback_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_feedback`
--

LOCK TABLES `tbl_feedback` WRITE;
/*!40000 ALTER TABLE `tbl_feedback` DISABLE KEYS */;
INSERT INTO `tbl_feedback` VALUES ('piyu','Good website and Food Also',1),('Suraj','Website is Cute!',2),('Kewal','Mast ahe project!',3);
/*!40000 ALTER TABLE `tbl_feedback` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_menu`
--

DROP TABLE IF EXISTS `tbl_menu`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tbl_menu` (
  `menu_id` int(10) NOT NULL AUTO_INCREMENT,
  `menu_name` varchar(50) DEFAULT NULL,
  `menu_price` int(20) DEFAULT NULL,
  `menu_description` varchar(60) DEFAULT NULL,
  `menu_img` varchar(45) NOT NULL,
  PRIMARY KEY (`menu_id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_menu`
--

LOCK TABLES `tbl_menu` WRITE;
/*!40000 ALTER TABLE `tbl_menu` DISABLE KEYS */;
INSERT INTO `tbl_menu` VALUES (1,'Veg thali',50,'thali..','Img/thali.png'),(2,'puri bhaji',55,'puri bhaji with amti','Img/PuriBhaji.png'),(4,'idli',22,'soft idli','Img/idli.png'),(5,'Samossa',25,'The Great Samosaaa','Img/samossa.png');
/*!40000 ALTER TABLE `tbl_menu` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_orders`
--

DROP TABLE IF EXISTS `tbl_orders`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tbl_orders` (
  `order_id` int(10) NOT NULL,
  `username` varchar(50) DEFAULT NULL,
  `Menu_name` varchar(50) DEFAULT NULL,
  `Menu_price` int(20) DEFAULT NULL,
  `Menu_Qunt` int(20) DEFAULT NULL,
  `payment_type` varchar(45) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_orders`
--

LOCK TABLES `tbl_orders` WRITE;
/*!40000 ALTER TABLE `tbl_orders` DISABLE KEYS */;
INSERT INTO `tbl_orders` VALUES (33,'piyush','Samossa',25,1,'cod');
/*!40000 ALTER TABLE `tbl_orders` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_usersignup`
--

DROP TABLE IF EXISTS `tbl_usersignup`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tbl_usersignup` (
  `user_id` int(10) NOT NULL AUTO_INCREMENT,
  `username` varchar(50) DEFAULT NULL,
  `email` varchar(50) DEFAULT NULL,
  `phone_no` bigint(50) DEFAULT NULL,
  `password` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_usersignup`
--

LOCK TABLES `tbl_usersignup` WRITE;
/*!40000 ALTER TABLE `tbl_usersignup` DISABLE KEYS */;
INSERT INTO `tbl_usersignup` VALUES (1,'piyush','piy@gmail.com',7038001196,'piy@27');
/*!40000 ALTER TABLE `tbl_usersignup` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-02-27 22:45:56
