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
-- Table structure for table `fraudalert`
--

DROP TABLE IF EXISTS `fraudalert`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `fraudalert` (
  `alert_id` int NOT NULL AUTO_INCREMENT,
  `transaction_id` int NOT NULL,
  `alert_date` date NOT NULL,
  `risk_level` varchar(20) NOT NULL,
  `alert_notes` varchar(255) DEFAULT NULL,
  `investigator_id` int DEFAULT NULL,
  PRIMARY KEY (`alert_id`),
  KEY `idx_fraudalert_severity` (`risk_level`),
  KEY `idx_fraudalert_transaction` (`transaction_id`),
  KEY `idx_fraudalert_investigator` (`investigator_id`),
  KEY `idx_fraudalert_year_month` (`alert_date`),
  CONSTRAINT `fraudalert_ibfk_1` FOREIGN KEY (`transaction_id`) REFERENCES `transactions` (`transaction_id`),
  CONSTRAINT `fraudalert_ibfk_2` FOREIGN KEY (`investigator_id`) REFERENCES `investigator` (`investigator_id`)
) ENGINE=InnoDB AUTO_INCREMENT=26 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `fraudalert`
--

LOCK TABLES `fraudalert` WRITE;
/*!40000 ALTER TABLE `fraudalert` DISABLE KEYS */;
INSERT INTO `fraudalert` VALUES (1,3,'2024-03-01','MEDIUM','High-value transaction outside typical region',NULL),(2,6,'2024-04-01','MEDIUM','Large debit inconsistent with customer history',NULL),(3,7,'2024-02-12','HIGH','High-value debit above fraud threshold',NULL),(4,11,'2024-06-01','LOW','Multiple failed attempt detected',NULL),(5,14,'2023-07-01','MEDIUM','Amount exceeds normal debit limit',NULL),(6,17,'2023-07-14','MEDIUM','Transaction from unusual location',NULL),(7,20,'2025-07-20','MEDIUM','High-value transaction not matching typical pattern',NULL),(8,21,'2024-01-12','HIGH','Unusually large debit, potential business fraud',NULL),(9,24,'2024-04-08','HIGH','Large withdrawal above account threshold',NULL),(10,25,'2025-09-01','LOW','Failed transaction flagged for review',NULL),(11,27,'2025-09-18','MEDIUM','Cross-province high-value debit',NULL),(12,30,'2024-09-10','MEDIUM','Unusual location and high amount',NULL),(13,33,'2024-09-22','MEDIUM','Amount exceeds risk threshold',NULL),(14,36,'2023-10-01','HIGH','High-value debit flagged for fraud screening',NULL),(15,39,'2023-10-10','MEDIUM','Foreign transaction attempt detected',NULL),(16,42,'2023-11-05','HIGH','Large debit above customer profile limit',NULL),(17,45,'2025-10-22','HIGH','High-value debit with regional mismatch',NULL),(18,48,'2023-10-28','MEDIUM','Large transaction compared to profile',NULL),(19,51,'2024-11-02','MEDIUM','High-value local transaction flagged',NULL),(20,54,'2025-11-07','HIGH','Cross-province high-value transaction',NULL),(21,57,'2023-11-12','MEDIUM','Moderate amount with unusual travel pattern',NULL),(22,60,'2025-11-02','MEDIUM','High-value out of city transaction.',NULL),(23,63,'2025-11-07','MEDIUM','Cross-province high-value transaction',NULL),(24,66,'2025-11-12','MEDIUM','Moderate amount with unusual travel pattern',NULL),(25,69,'2025-11-12','MEDIUM','Moderate amount with unusual travel pattern',NULL);
/*!40000 ALTER TABLE `fraudalert` ENABLE KEYS */;
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
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `trg_fraudalert_update` AFTER UPDATE ON `fraudalert` FOR EACH ROW BEGIN
    INSERT INTO FraudAlertHistory(alert_id, investigator_id, action)
    VALUES(NEW.alert_id, NEW.investigator_id, 'Case Updated');
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
