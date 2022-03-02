-- MySQL dump 10.13  Distrib 8.0.27, for Win64 (x86_64)
--
-- Host: localhost    Database: projectdb
-- ------------------------------------------------------
-- Server version	8.0.27

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `customer_tbl`
--

DROP TABLE IF EXISTS `customer_tbl`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `customer_tbl` (
  `customer_id` int NOT NULL AUTO_INCREMENT,
  `customer_username` varchar(250) NOT NULL,
  `customer_firstname` varchar(250) NOT NULL,
  `customer_lastname` varchar(250) NOT NULL,
  `customer_email` varchar(250) NOT NULL,
  `customer_mobile` varchar(15) NOT NULL,
  `customer_password` varchar(250) NOT NULL,
  `customer_address` varchar(250) NOT NULL,
  `customer_city` varchar(250) NOT NULL,
  `customer_pincode` int NOT NULL,
  PRIMARY KEY (`customer_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `customer_tbl`
--

LOCK TABLES `customer_tbl` WRITE;
/*!40000 ALTER TABLE `customer_tbl` DISABLE KEYS */;
/*!40000 ALTER TABLE `customer_tbl` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `order_booking_tbl`
--

DROP TABLE IF EXISTS `order_booking_tbl`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `order_booking_tbl` (
  `booking_id` int NOT NULL AUTO_INCREMENT,
  `booking_service_id` int NOT NULL,
  `booking_customer_id` int NOT NULL,
  `booking_status` varchar(250) DEFAULT NULL,
  `booking_service_cost` int NOT NULL,
  `booking_schedule_date_time` datetime NOT NULL,
  `booking_service_address` varchar(250) DEFAULT NULL,
  `booking_ordered_date` date DEFAULT NULL,
  `booking_order_id` int NOT NULL,
  `booking_review` varchar(250) DEFAULT NULL,
  `booking_rating` varchar(250) DEFAULT NULL,
  `booking_feedback_date` date DEFAULT NULL,
  PRIMARY KEY (`booking_id`),
  KEY `booking_service_id` (`booking_service_id`),
  KEY `booking_customer_id` (`booking_customer_id`),
  KEY `booking_order_id` (`booking_order_id`),
  CONSTRAINT `order_booking_tbl_ibfk_1` FOREIGN KEY (`booking_service_id`) REFERENCES `services_tbl` (`service_id`),
  CONSTRAINT `order_booking_tbl_ibfk_2` FOREIGN KEY (`booking_customer_id`) REFERENCES `customer_tbl` (`customer_id`),
  CONSTRAINT `order_booking_tbl_ibfk_3` FOREIGN KEY (`booking_order_id`) REFERENCES `order_tbl` (`order_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `order_booking_tbl`
--

LOCK TABLES `order_booking_tbl` WRITE;
/*!40000 ALTER TABLE `order_booking_tbl` DISABLE KEYS */;
/*!40000 ALTER TABLE `order_booking_tbl` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `order_tbl`
--

DROP TABLE IF EXISTS `order_tbl`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `order_tbl` (
  `order_id` int NOT NULL AUTO_INCREMENT,
  `order_customer_id` int DEFAULT NULL,
  `order_total_amount` int NOT NULL,
  `order_status` varchar(250) DEFAULT NULL,
  PRIMARY KEY (`order_id`),
  KEY `customer_id` (`order_customer_id`),
  CONSTRAINT `order_tbl_ibfk_1` FOREIGN KEY (`order_customer_id`) REFERENCES `customer_tbl` (`customer_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `order_tbl`
--

LOCK TABLES `order_tbl` WRITE;
/*!40000 ALTER TABLE `order_tbl` DISABLE KEYS */;
/*!40000 ALTER TABLE `order_tbl` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `services_tbl`
--

DROP TABLE IF EXISTS `services_tbl`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `services_tbl` (
  `service_id` int NOT NULL AUTO_INCREMENT,
  `service_type` varchar(250) NOT NULL,
  `service_cost` int NOT NULL,
  `service_discount` varchar(250) NOT NULL,
  `service_time_hrs` varchar(250) NOT NULL,
  `service_vendor_id` int DEFAULT NULL,
  PRIMARY KEY (`service_id`),
  KEY `service_vendor_id` (`service_vendor_id`),
  CONSTRAINT `services_tbl_ibfk_1` FOREIGN KEY (`service_vendor_id`) REFERENCES `vendor_tbl` (`vendor_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `services_tbl`
--

LOCK TABLES `services_tbl` WRITE;
/*!40000 ALTER TABLE `services_tbl` DISABLE KEYS */;
/*!40000 ALTER TABLE `services_tbl` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `vendor_tbl`
--

DROP TABLE IF EXISTS `vendor_tbl`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `vendor_tbl` (
  `vendor_id` int NOT NULL AUTO_INCREMENT,
  `vendor_username` varchar(250) NOT NULL,
  `vendor_firstname` varchar(250) NOT NULL,
  `vendor_lastname` varchar(250) NOT NULL,
  `vendor_email` varchar(250) NOT NULL,
  `vendor_mobile` varchar(15) NOT NULL,
  `vendor_password` varchar(250) NOT NULL,
  `vendor_address` varchar(250) NOT NULL,
  `vendor_city` varchar(250) NOT NULL,
  `vendor_pincode` int NOT NULL,
  `vendor_image` longblob,
  PRIMARY KEY (`vendor_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `vendor_tbl`
--

LOCK TABLES `vendor_tbl` WRITE;
/*!40000 ALTER TABLE `vendor_tbl` DISABLE KEYS */;
/*!40000 ALTER TABLE `vendor_tbl` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2022-02-27 22:32:01
