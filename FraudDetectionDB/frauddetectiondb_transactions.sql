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
-- Table structure for table `transactions`
--

DROP TABLE IF EXISTS `transactions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `transactions` (
  `transaction_id` int NOT NULL AUTO_INCREMENT,
  `account_id` int NOT NULL,
  `amount` decimal(10,2) NOT NULL,
  `transaction_type` varchar(10) NOT NULL,
  `transaction_date` date NOT NULL,
  `location` varchar(50) DEFAULT NULL,
  `status` varchar(20) NOT NULL,
  `flagged` tinyint(1) DEFAULT '0',
  `flag_reason` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`transaction_id`),
  KEY `idx_transaction_timestamp` (`transaction_date`),
  KEY `idx_transaction_account` (`account_id`),
  CONSTRAINT `transactions_ibfk_1` FOREIGN KEY (`account_id`) REFERENCES `account` (`account_id`)
) ENGINE=InnoDB AUTO_INCREMENT=73 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `transactions`
--

LOCK TABLES `transactions` WRITE;
/*!40000 ALTER TABLE `transactions` DISABLE KEYS */;
INSERT INTO `transactions` VALUES (1,1,120.50,'Debit','2024-01-10','Winnipeg','Success',0,NULL),(2,1,450.00,'Debit','2024-02-18','Toronto','Success',0,NULL),(3,1,5000.00,'Debit','2024-03-01','Vancouver','Success',1,'High-value transaction outside typical region'),(4,2,80.00,'Debit','2024-03-05','Surrey','Success',0,NULL),(5,2,2500.00,'Credit','2024-03-20','Online','Success',0,NULL),(6,2,5200.00,'Debit','2024-04-01','Calgary','Success',1,'Large debit inconsistent with customer history'),(7,3,13000.00,'Debit','2024-02-12','Calgary','Success',1,'High-value debit above fraud threshold'),(8,3,150.00,'Debit','2024-02-15','Calgary','Success',0,NULL),(9,3,200.00,'Credit','2024-02-20','Online','Success',0,NULL),(10,4,900.00,'Debit','2024-05-11','Ottawa','Success',0,NULL),(11,4,50.00,'Debit','2024-06-01','Ottawa','Failed',1,'Multiple failed attempt detected'),(12,4,1200.00,'Credit','2024-06-15','Online','Success',0,NULL),(13,5,500.00,'Debit','2023-06-25','Sudbury','Success',0,NULL),(14,5,5200.00,'Debit','2023-07-01','Toronto','Success',1,'Amount exceeds normal debit limit'),(15,5,75.00,'Debit','2023-07-08','Sudbury','Success',0,NULL),(16,6,150.75,'Debit','2023-07-10','Ottawa','Success',0,NULL),(17,6,7000.00,'Debit','2023-07-14','Montreal','Success',1,'Transaction from unusual location'),(18,6,99.99,'Debit','2023-07-20','Ottawa','Success',0,NULL),(19,7,30.00,'Debit','2025-07-02','Hamilton','Success',0,NULL),(20,7,280.90,'Debit','2025-07-14','Hamilton','Success',0,NULL),(21,7,8500.00,'Debit','2025-07-20','Toronto','Success',1,'High-value transaction not matching typical pattern'),(22,8,14000.00,'Debit','2024-01-12','Toronto','Success',1,'Unusually large debit, potential business fraud'),(23,8,180.00,'Debit','2024-01-14','Toronto','Success',0,NULL),(24,8,900.00,'Credit','2024-01-22','Online','Success',0,NULL),(25,9,340.00,'Debit','2024-04-05','London','Success',0,NULL),(26,9,11000.00,'Debit','2024-04-08','London','Success',1,'Large withdrawal above account threshold'),(27,9,120.00,'Debit','2024-04-15','London','Success',0,NULL),(28,10,75.00,'Debit','2025-09-01','Sudbury','Failed',1,'Failed transaction flagged for review'),(29,10,1500.00,'Debit','2025-09-10','Toronto','Success',0,NULL),(30,10,6200.00,'Debit','2025-09-18','Vancouver','Success',1,'Cross-province high-value debit'),(31,11,200.00,'Debit','2024-08-30','Brampton','Success',0,NULL),(32,11,5000.00,'Debit','2024-09-10','Montreal','Success',1,'Unusual location and high amount'),(33,11,150.00,'Credit','2024-09-15','Online','Success',0,NULL),(34,12,85.00,'Debit','2024-09-05','Mississauga','Success',0,NULL),(35,12,7400.00,'Debit','2024-09-22','Toronto','Success',1,'Amount exceeds risk threshold'),(36,12,55.00,'Debit','2024-10-01','Mississauga','Success',0,NULL),(37,13,9500.00,'Debit','2023-10-01','Toronto','Success',1,'High-value debit flagged for fraud screening'),(38,13,220.00,'Debit','2023-10-10','Toronto','Success',0,NULL),(39,13,600.00,'Credit','2023-10-14','Online','Success',0,NULL),(40,14,100.00,'Debit','2023-09-30','Brampton','Success',0,NULL),(41,14,500.00,'Debit','2023-10-05','Brampton','Success',0,NULL),(42,14,7000.00,'Debit','2023-10-10','New York','Failed',1,'Foreign transaction attempt detected'),(43,15,350.00,'Debit','2023-11-01','Burlington','Success',0,NULL),(44,15,11000.00,'Debit','2023-11-05','Calgary','Success',1,'Large debit above customer profile limit'),(45,15,890.00,'Credit','2023-11-10','Online','Success',0,NULL),(46,16,700.00,'Debit','2025-10-20','Hamilton','Success',0,NULL),(47,16,13000.00,'Debit','2025-10-22','Toronto','Success',1,'High-value debit with regional mismatch'),(48,16,150.00,'Debit','2025-10-24','Hamilton','Success',0,NULL),(49,17,95.00,'Debit','2023-10-25','Ottawa','Success',0,NULL),(50,17,7200.00,'Debit','2023-10-28','Toronto','Success',1,'Large transaction compared to profile'),(51,17,140.00,'Credit','2023-11-01','Online','Success',0,NULL),(52,18,110.00,'Debit','2024-10-30','Kitchener','Success',0,NULL),(53,18,5400.00,'Debit','2024-11-02','Kitchener','Success',1,'High-value local transaction flagged'),(54,18,60.00,'Debit','2024-11-05','Kitchener','Success',0,NULL),(55,19,200.00,'Debit','2025-11-05','Toronto','Success',0,NULL),(56,19,12000.00,'Debit','2025-11-07','Montreal','Success',1,'Cross-province high-value transaction'),(57,19,95.00,'Debit','2025-11-08','Toronto','Success',0,NULL),(58,20,15.00,'Debit','2023-11-11','Sudbury','Success',0,NULL),(59,20,3500.00,'Debit','2023-11-12','Toronto','Success',1,'Moderate amount with unusual travel pattern'),(60,20,85.00,'Debit','2023-11-14','Sudbury','Success',0,NULL),(61,21,110.00,'Debit','2025-10-30','Sudbury','Success',0,NULL),(62,21,5400.00,'Debit','2025-11-02','Kitchener','Success',1,'High-value out of city transaction.'),(63,21,60.00,'Debit','2025-11-05','Sudbury','Success',0,NULL),(64,22,200.00,'Debit','2025-11-05','Toronto','Success',0,NULL),(65,22,5200.00,'Debit','2025-11-07','Montreal','Success',1,'Cross-province high-value transaction'),(66,22,95.00,'Debit','2025-11-08','Toronto','Success',0,NULL),(67,23,15.00,'Debit','2025-11-11','Sudbury','Success',0,NULL),(68,23,3500.00,'Debit','2025-11-12','Toronto','Success',1,'Moderate amount with unusual travel pattern'),(69,23,85.00,'Debit','2025-11-14','Sudbury','Success',0,NULL),(70,24,15.00,'Debit','2025-11-11','Sudbury','Success',0,NULL),(71,24,3500.00,'Debit','2025-11-12','Toronto','Success',1,'Moderate amount with unusual travel pattern'),(72,24,85.00,'Debit','2025-11-14','Sudbury','Success',0,NULL);
/*!40000 ALTER TABLE `transactions` ENABLE KEYS */;
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
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `trg_after_transaction_insert` AFTER INSERT ON `transactions` FOR EACH ROW BEGIN
    CALL DetectSuspiciousTransaction(NEW.transaction_id);
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
