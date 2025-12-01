-- MySQL dump 10.13  Distrib 8.0.43, for Win64 (x86_64)
--
-- Host: localhost    Database: frauddetectiondb
-- ------------------------------------------------------
-- Server version	8.0.43

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8 */;
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
  `first_name` varchar(50) NOT NULL,
  `last_name` varchar(50) NOT NULL,
  `email` varchar(100) NOT NULL,
  `phone` varchar(20) DEFAULT NULL,
  `city` varchar(50) DEFAULT NULL,
  `created_on` date NOT NULL,
  PRIMARY KEY (`customer_id`),
  UNIQUE KEY `email` (`email`),
  KEY `idx_customer_email` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `customer`
--

LOCK TABLES `customer` WRITE;
/*!40000 ALTER TABLE `customer` DISABLE KEYS */;
INSERT INTO `customer` VALUES (1,'John','Cooper','john.cooper@yahoo.com','705-988-5534','Winnipeg','2022-11-07'),(2,'Jason','Wall','jwall@outlook.com','249-885-1644','Surrey','2023-11-07'),(3,'Tony','Stark','stark@gmail.com','705-280-6758','Calgary','2024-11-07'),(4,'James','Clark','j.clark@yahoo.com','613-555-6060','Ottawa','2023-06-01'),(5,'Manpreet','Singh','manpreet.singh@gmail.com','705-555-5050','Sudbury','2023-05-22'),(6,'Jaspreet','Gill','jaspreet.gill@yahoo.com','613-555-6060','Ottawa','2023-06-01'),(7,'Neha','Patel','neha.patel@outlook.com','289-555-7070','Hamilton','2025-06-15'),(8,'Karan','Johal','karan.johal@yahoo.com','437-555-8080','Toronto','2023-07-03'),(9,'Amanpreet','Kaur','amanpreet.kaur@gmail.com','519-555-9090','London','2024-07-21'),(10,'Gurpreet','Singh','gurpreet.singh@gmail.com','705-555-1111','Sudbury','2025-08-09'),(11,'Rohit','Gupta','rohit.gupta@yahoo.com','416-555-1212','Brampton','2023-08-25'),(12,'Anita','Sharma','anita.sharma@outlook.com','905-555-1313','Mississauga','2024-09-01'),(13,'Harman','Dhaliwal','harman.dhaliwal@gmail.com','647-555-1414','Toronto','2023-09-12'),(14,'Sandeep','Kaur','sandeep.kaur@yahoo.com','416-555-1515','Brampton','2023-09-27'),(15,'Vikram','Arora','vikram.arora@outlook.com','905-555-1616','Burlington','2023-10-05'),(16,'Navjot','Sidhu','navjot.sidhu@gmail.com','289-555-1717','Hamilton','2025-10-13'),(17,'Harleen','Deol','harleen.deol@yahoo.com','613-555-1818','Ottawa','2023-10-20'),(18,'Ramanpreet','Singh','ramanpreet.singh@gmail.com','519-555-1919','Kitchener','2024-10-28'),(19,'Deepika','Joshi','deepika.joshi@outlook.com','437-555-2021','Toronto','2025-11-02'),(20,'Kamalpreet','Kaur','kamalpreet.kaur@outlook.com','705-555-2121','Sudbury','2023-11-10'),(21,'Karam','Singh','ksingh37@laurentian.ca','705-988-5534','Sudbury','2025-09-07'),(22,'Pooja','Bera','Pbera@laurentian.ca','249-885-1644','Sudbury','2025-09-07'),(23,'Deepan','Bhatta','dbhatta@laurentian.ca','705-280-6758','Sudbury','2025-09-07'),(24,'Kapldrum','Passi','kpassi@laurentian.ca','705-675-1151','Sudbury','2025-11-07');
/*!40000 ALTER TABLE `customer` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `trg_no_customer_delete` BEFORE DELETE ON `customer` FOR EACH ROW BEGIN
    IF EXISTS (SELECT 1 FROM Account WHERE customer_id = OLD.customer_id) THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Cannot delete customer: Accounts exist.';
    END IF;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2025-11-29 13:52:45
