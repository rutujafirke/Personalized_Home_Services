-- MySQL dump 10.13  Distrib 8.0.27, for Win64 (x86_64)
--
-- Host: localhost    Database: dumy
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
-- Table structure for table `customer`
--

DROP TABLE IF EXISTS `customer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `customer` (
  `customer_id` int NOT NULL AUTO_INCREMENT,
  `customer_firstname` varchar(250) DEFAULT NULL,
  `customer_lastname` varchar(250) DEFAULT NULL,
  `customer_username` varchar(250) DEFAULT NULL,
  `customer_mobieno` varchar(10) DEFAULT NULL,
  `customer_email` varchar(250) DEFAULT NULL,
  `customer_password` varchar(250) DEFAULT NULL,
  `customer_address` text,
  `customer_city` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`customer_id`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `customer`
--

LOCK TABLES `customer` WRITE;
/*!40000 ALTER TABLE `customer` DISABLE KEYS */;
INSERT INTO `customer` VALUES (11,'Rutuja','Firke','rutujafirke','7757981247','rutujafirke1232gmail.com','Rutuja@10','Sai Heritage Vadivali Section','Ambernath'),(12,'Harshal','Pagare','harrypagare','973637621','harrypagare@gmail.com','Harry@10','ABCD SaiKiran Apartment','Nashik'),(13,'Ruchira','Vaity','vaityruchira','9756737621','ruchiravaity@gmail.com','ruchira@01','Soham Apartment','Mulund'),(14,'Pooja','Kale','poojakale','8977654321','poojakale@gmail.com','Pooja@10','ABCD SaiKiran Apartment','Nashik');
/*!40000 ALTER TABLE `customer` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `feedbacks_tbl`
--

DROP TABLE IF EXISTS `feedbacks_tbl`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `feedbacks_tbl` (
  `feedback_id` int NOT NULL AUTO_INCREMENT,
  `feedback_customer_id` int DEFAULT NULL,
  `feedback_vendor_id` int DEFAULT NULL,
  PRIMARY KEY (`feedback_id`),
  KEY `feedback_customer_id` (`feedback_customer_id`),
  KEY `feedback_vendor_id` (`feedback_vendor_id`),
  CONSTRAINT `feedbacks_tbl_ibfk_1` FOREIGN KEY (`feedback_customer_id`) REFERENCES `customer` (`customer_id`),
  CONSTRAINT `feedbacks_tbl_ibfk_2` FOREIGN KEY (`feedback_vendor_id`) REFERENCES `vendors_tbl` (`vendor_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `feedbacks_tbl`
--

LOCK TABLES `feedbacks_tbl` WRITE;
/*!40000 ALTER TABLE `feedbacks_tbl` DISABLE KEYS */;
/*!40000 ALTER TABLE `feedbacks_tbl` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `order_bookings_tbl`
--

DROP TABLE IF EXISTS `order_bookings_tbl`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `order_bookings_tbl` (
  `booking_id` int NOT NULL AUTO_INCREMENT,
  `booking_service_id` int DEFAULT NULL,
  `booking_customer_id` int DEFAULT NULL,
  `booking_status` text,
  `booking_service_cost` int DEFAULT NULL,
  `booking_service_address` varchar(250) DEFAULT NULL,
  `booking_order_id` int DEFAULT NULL,
  `booking_ratings` varchar(10) DEFAULT NULL,
  `booking_review` text,
  `booking_feedback_date` date DEFAULT NULL,
  `booking_schedule_date_time` datetime DEFAULT NULL,
  PRIMARY KEY (`booking_id`),
  KEY `booking_service_id` (`booking_service_id`),
  KEY `booking_customer_id` (`booking_customer_id`),
  KEY `booking_order_id` (`booking_order_id`),
  CONSTRAINT `order_bookings_tbl_ibfk_1` FOREIGN KEY (`booking_service_id`) REFERENCES `services_tbl` (`service_id`),
  CONSTRAINT `order_bookings_tbl_ibfk_2` FOREIGN KEY (`booking_customer_id`) REFERENCES `customer` (`customer_id`),
  CONSTRAINT `order_bookings_tbl_ibfk_3` FOREIGN KEY (`booking_order_id`) REFERENCES `order_tbl` (`order_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `order_bookings_tbl`
--

LOCK TABLES `order_bookings_tbl` WRITE;
/*!40000 ALTER TABLE `order_bookings_tbl` DISABLE KEYS */;
INSERT INTO `order_bookings_tbl` VALUES (1,1003,11,'Complete',1000,'204 Awing Sai heritage Ambernath',1,'5','Good Cleaning','2022-02-27','2022-02-23 01:09:00'),(2,1001,12,'Inprogress',1000,'Ring Road Nashik',2,NULL,NULL,NULL,'2022-02-27 10:00:00'),(3,1005,12,'Inprogress',1500,'Ring Road Nashik',2,NULL,NULL,NULL,'2022-02-27 10:00:00');
/*!40000 ALTER TABLE `order_bookings_tbl` ENABLE KEYS */;
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
  `order_total_amount` double DEFAULT NULL,
  `order_date` date DEFAULT NULL,
  `order_status` text,
  PRIMARY KEY (`order_id`),
  KEY `order_customer_id` (`order_customer_id`),
  CONSTRAINT `order_tbl_ibfk_1` FOREIGN KEY (`order_customer_id`) REFERENCES `customer` (`customer_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `order_tbl`
--

LOCK TABLES `order_tbl` WRITE;
/*!40000 ALTER TABLE `order_tbl` DISABLE KEYS */;
INSERT INTO `order_tbl` VALUES (1,11,1000,'2022-02-25','Completed'),(2,12,2500,'2022-03-25','Inprogress');
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
  `service_name` varchar(250) DEFAULT NULL,
  `service_cost` int DEFAULT NULL,
  `service_discount` varchar(250) DEFAULT NULL,
  `service_time_hrs` varchar(10) DEFAULT NULL,
  `service_vendor_id` int DEFAULT NULL,
  PRIMARY KEY (`service_id`),
  KEY `service_vendor_id` (`service_vendor_id`),
  CONSTRAINT `services_tbl_ibfk_1` FOREIGN KEY (`service_vendor_id`) REFERENCES `vendors_tbl` (`vendor_id`)
) ENGINE=InnoDB AUTO_INCREMENT=1009 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `services_tbl`
--

LOCK TABLES `services_tbl` WRITE;
/*!40000 ALTER TABLE `services_tbl` DISABLE KEYS */;
INSERT INTO `services_tbl` VALUES (1001,'Bathroom Cleaning',1000,'5%','1hrs',201),(1002,'Living Room Cleaning',1000,'5%','1hrs',202),(1003,'Living Room Cleaning',1000,'5%','1hrs',203),(1004,'Common Room Cleaning',1000,'5%','1hrs',204),(1005,'Bedroom Cleaning',1500,'4%','2hrs',201),(1006,'Water-Tank Cleaning',2000,'4%','5hrs',202),(1007,'Before Festive Cleaning',2500,'3%','7hrs',203),(1008,'Kitchen Cleaning',500,'3%','2hrs',204);
/*!40000 ALTER TABLE `services_tbl` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `vendors_tbl`
--

DROP TABLE IF EXISTS `vendors_tbl`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `vendors_tbl` (
  `vendor_id` int NOT NULL AUTO_INCREMENT,
  `vendor_firstname` varchar(250) DEFAULT NULL,
  `vendor_lastname` varchar(250) DEFAULT NULL,
  `vendor_username` varchar(250) DEFAULT NULL,
  `vendor_mobileno` varchar(10) DEFAULT NULL,
  `vendor_email` varchar(25) DEFAULT NULL,
  `vendor_password` varchar(250) DEFAULT NULL,
  `vendor_address` text,
  `vendor_city` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`vendor_id`)
) ENGINE=InnoDB AUTO_INCREMENT=205 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `vendors_tbl`
--

LOCK TABLES `vendors_tbl` WRITE;
/*!40000 ALTER TABLE `vendors_tbl` DISABLE KEYS */;
INSERT INTO `vendors_tbl` VALUES (201,'Aniket','Pagare','Aniketpagare','7896542355','harryservices@gmail.com','services','Harryservice, maha roadNashik','Nashik'),(202,'Tushar','Patil','tusharpatil','7789764352','patilservices@gmail.com','services','Home cleaning Service 53 chowk','Pune'),(203,'Malhar','Chaudhary','malharchaudhary','9422665941','malharchaudhary@gmail.com','chaudharyhome','Malhar Service near Powai Station','Mumbai'),(204,'Harshal','Khavekar','harshalkhavekar','8087131609','khavekarhome@gmail.com','cleanmeservices','Ring Road Near King Hotel','Satara');
/*!40000 ALTER TABLE `vendors_tbl` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2022-02-27 16:22:08
