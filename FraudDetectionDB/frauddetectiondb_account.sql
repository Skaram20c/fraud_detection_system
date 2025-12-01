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
-- Table structure for table `account`
--

DROP TABLE IF EXISTS `account`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `account` (
  `account_id` int NOT NULL AUTO_INCREMENT,
  `customer_id` int NOT NULL,
  `account_type` varchar(20) NOT NULL,
  `opening_date` date NOT NULL,
  `balance` decimal(10,2) NOT NULL,
  `status` varchar(20) NOT NULL DEFAULT 'Active',
  PRIMARY KEY (`account_id`),
  KEY `idx_account_customer` (`customer_id`),
  CONSTRAINT `account_ibfk_1` FOREIGN KEY (`customer_id`) REFERENCES `customer` (`customer_id`)
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `account`
--

LOCK TABLES `account` WRITE;
/*!40000 ALTER TABLE `account` DISABLE KEYS */;
INSERT INTO `account` VALUES (1,1,'Chequing','2022-11-10',2500.00,'Active'),(2,2,'Savings','2023-11-10',4200.50,'Active'),(3,3,'Business','2024-11-10',15000.00,'Active'),(4,4,'Chequing','2023-06-05',1890.75,'Active'),(5,5,'Savings','2023-05-25',5600.00,'Frozen'),(6,6,'Chequing','2023-06-05',735.20,'Active'),(7,7,'Savings','2025-06-18',9200.00,'Active'),(8,8,'Business','2023-07-05',15300.00,'Active'),(9,9,'Savings','2024-07-23',2900.00,'Active'),(10,10,'Chequing','2025-08-12',780.00,'Frozen'),(11,11,'Savings','2023-08-28',3100.45,'Active'),(12,12,'Chequing','2024-09-03',1250.00,'Active'),(13,13,'Savings','2023-09-14',9800.00,'Closed'),(14,14,'Chequing','2023-09-29',200.00,'Active'),(15,15,'Savings','2023-10-08',5400.00,'Active'),(16,16,'Business','2025-10-16',22000.00,'Active'),(17,17,'Savings','2023-10-23',6700.00,'Active'),(18,18,'Chequing','2024-10-30',900.00,'Active'),(19,19,'Savings','2025-11-04',10300.50,'Frozen'),(20,20,'Chequing','2023-11-12',620.00,'Active'),(21,21,'Chequing','2025-11-08',4700.00,'Active'),(22,22,'Savings','2025-11-08',5100.00,'Active'),(23,23,'Chequing','2025-11-08',2600.00,'Active'),(24,24,'Savings','2025-11-08',360000.00,'Active');
/*!40000 ALTER TABLE `account` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2025-11-29 13:52:45
