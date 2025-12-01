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
-- Temporary view structure for view `vw_investigator_case_load`
--

DROP TABLE IF EXISTS `vw_investigator_case_load`;
/*!50001 DROP VIEW IF EXISTS `vw_investigator_case_load`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `vw_investigator_case_load` AS SELECT 
 1 AS `investigator_id`,
 1 AS `name`,
 1 AS `active_cases`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `vw_monthly_fraud_stats`
--

DROP TABLE IF EXISTS `vw_monthly_fraud_stats`;
/*!50001 DROP VIEW IF EXISTS `vw_monthly_fraud_stats`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `vw_monthly_fraud_stats` AS SELECT 
 1 AS `year`,
 1 AS `month`,
 1 AS `total_alerts`,
 1 AS `high_severity`,
 1 AS `medium_severity`,
 1 AS `low_severity`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `vw_suspicious_transactions`
--

DROP TABLE IF EXISTS `vw_suspicious_transactions`;
/*!50001 DROP VIEW IF EXISTS `vw_suspicious_transactions`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `vw_suspicious_transactions` AS SELECT 
 1 AS `transaction_id`,
 1 AS `account_id`,
 1 AS `amount`,
 1 AS `transaction_city`,
 1 AS `transaction_date`,
 1 AS `transaction_type`,
 1 AS `risk_level`,
 1 AS `customer_name`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `vw_customer_financial_summary`
--

DROP TABLE IF EXISTS `vw_customer_financial_summary`;
/*!50001 DROP VIEW IF EXISTS `vw_customer_financial_summary`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `vw_customer_financial_summary` AS SELECT 
 1 AS `customer_id`,
 1 AS `full_name`,
 1 AS `city`,
 1 AS `total_accounts`,
 1 AS `total_balance`,
 1 AS `fraud_alerts`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `vw_high_risk_customers`
--

DROP TABLE IF EXISTS `vw_high_risk_customers`;
/*!50001 DROP VIEW IF EXISTS `vw_high_risk_customers`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `vw_high_risk_customers` AS SELECT 
 1 AS `customer_id`,
 1 AS `full_name`,
 1 AS `city`,
 1 AS `total_alerts`,
 1 AS `high_severity_count`*/;
SET character_set_client = @saved_cs_client;

--
-- Final view structure for view `vw_investigator_case_load`
--

/*!50001 DROP VIEW IF EXISTS `vw_investigator_case_load`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `vw_investigator_case_load` AS select `i`.`investigator_id` AS `investigator_id`,`i`.`name` AS `name`,count(`f`.`alert_id`) AS `active_cases` from (`investigator` `i` left join `fraudalert` `f` on((`i`.`investigator_id` = `f`.`investigator_id`))) group by `i`.`investigator_id` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `vw_monthly_fraud_stats`
--

/*!50001 DROP VIEW IF EXISTS `vw_monthly_fraud_stats`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `vw_monthly_fraud_stats` AS select year(`fraudalert`.`alert_date`) AS `year`,month(`fraudalert`.`alert_date`) AS `month`,count(0) AS `total_alerts`,sum((case when (`fraudalert`.`risk_level` = 'High') then 1 else 0 end)) AS `high_severity`,sum((case when (`fraudalert`.`risk_level` = 'Medium') then 1 else 0 end)) AS `medium_severity`,sum((case when (`fraudalert`.`risk_level` = 'Low') then 1 else 0 end)) AS `low_severity` from `fraudalert` group by year(`fraudalert`.`alert_date`),month(`fraudalert`.`alert_date`) order by `year` desc,`month` desc */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `vw_suspicious_transactions`
--

/*!50001 DROP VIEW IF EXISTS `vw_suspicious_transactions`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `vw_suspicious_transactions` AS select `t`.`transaction_id` AS `transaction_id`,`t`.`account_id` AS `account_id`,`t`.`amount` AS `amount`,`t`.`location` AS `transaction_city`,`t`.`transaction_date` AS `transaction_date`,`t`.`transaction_type` AS `transaction_type`,`f`.`risk_level` AS `risk_level`,concat(`c`.`first_name`,' ',`c`.`last_name`) AS `customer_name` from (((`transactions` `t` join `fraudalert` `f` on((`t`.`transaction_id` = `f`.`transaction_id`))) join `account` `a` on((`t`.`account_id` = `a`.`account_id`))) join `customer` `c` on((`a`.`customer_id` = `c`.`customer_id`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `vw_customer_financial_summary`
--

/*!50001 DROP VIEW IF EXISTS `vw_customer_financial_summary`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `vw_customer_financial_summary` AS select `c`.`customer_id` AS `customer_id`,concat(`c`.`first_name`,' ',`c`.`last_name`) AS `full_name`,`c`.`city` AS `city`,count(`a`.`account_id`) AS `total_accounts`,sum(`a`.`balance`) AS `total_balance`,count(`f`.`alert_id`) AS `fraud_alerts` from (((`customer` `c` left join `account` `a` on((`c`.`customer_id` = `a`.`customer_id`))) left join `transactions` `t` on((`a`.`account_id` = `t`.`account_id`))) left join `fraudalert` `f` on((`t`.`transaction_id` = `f`.`transaction_id`))) group by `c`.`customer_id` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `vw_high_risk_customers`
--

/*!50001 DROP VIEW IF EXISTS `vw_high_risk_customers`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `vw_high_risk_customers` AS select `c`.`customer_id` AS `customer_id`,concat(`c`.`first_name`,' ',`c`.`last_name`) AS `full_name`,`c`.`city` AS `city`,count(`f`.`alert_id`) AS `total_alerts`,sum((case when (`f`.`risk_level` = 'High') then 1 else 0 end)) AS `high_severity_count` from (((`customer` `c` join `account` `a` on((`c`.`customer_id` = `a`.`customer_id`))) join `transactions` `t` on((`a`.`account_id` = `t`.`account_id`))) join `fraudalert` `f` on((`t`.`transaction_id` = `f`.`transaction_id`))) group by `c`.`customer_id` having ((`total_alerts` >= 3) or (`high_severity_count` >= 1)) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Dumping events for database 'frauddetectiondb'
--

--
-- Dumping routines for database 'frauddetectiondb'
--
/*!50003 DROP FUNCTION IF EXISTS `fn_alert_time_gap` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `fn_alert_time_gap`(
    p_transaction_id INT
) RETURNS int
    DETERMINISTIC
BEGIN
    DECLARE v_account_id INT;
    DECLARE v_customer_id INT;
    DECLARE v_prev_alert_time DATETIME;
    DECLARE v_current_time DATETIME;

    -- Find account + customer
    SELECT t.account_id, a.customer_id, t.timestamp
    INTO v_account_id, v_customer_id, v_current_time
    FROM Transactions t
    JOIN Account a ON t.account_id = a.account_id
    WHERE t.transaction_id = p_transaction_id;

    -- Find last alert time
    SELECT MAX(f.alert_date)
    INTO v_prev_alert_time
    FROM FraudAlert f
    JOIN Transactions ts ON f.transaction_id = ts.transaction_id
    JOIN Account ac ON ts.account_id = ac.account_id
    WHERE ac.customer_id = v_customer_id;

    IF v_prev_alert_time IS NULL THEN
        RETURN 99999;
    END IF;

    RETURN TIMESTAMPDIFF(MINUTE, v_prev_alert_time, v_current_time);
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP FUNCTION IF EXISTS `fn_calculate_risk_score` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `fn_calculate_risk_score`(
    p_amount DECIMAL(10,2),
    p_is_unusual_location BOOLEAN,
    p_recent_trans_count INT
) RETURNS int
    DETERMINISTIC
BEGIN
    DECLARE v_score INT DEFAULT 0;

    -- High amount
    IF p_amount > 7500 THEN
        SET v_score = v_score + 40;
    ELSEIF p_amount BETWEEN 3000 AND 7500 THEN
        SET v_score = v_score + 20;
    END IF;

    -- Unusual location
    IF p_is_unusual_location = TRUE THEN
        SET v_score = v_score + 30;
    END IF;

    -- High frequency
    IF p_recent_trans_count >= 3 THEN
        SET v_score = v_score + 30;
    ELSEIF p_recent_trans_count = 2 THEN
        SET v_score = v_score + 15;
    END IF;

    RETURN v_score;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP FUNCTION IF EXISTS `fn_customer_alert_count` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `fn_customer_alert_count`(p_customer_id INT) RETURNS int
    DETERMINISTIC
BEGIN
    DECLARE v_count INT;

    SELECT COUNT(*) INTO v_count
    FROM FraudAlert f
    JOIN Transactions t ON f.transaction_id = t.transaction_id
    JOIN Account a ON t.account_id = a.account_id
    WHERE a.customer_id = p_customer_id;

    RETURN v_count;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP FUNCTION IF EXISTS `fn_customer_fullname` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `fn_customer_fullname`(p_customer_id INT) RETURNS varchar(200) CHARSET utf8mb4
    DETERMINISTIC
BEGIN
    DECLARE v_name VARCHAR(200);
    SELECT CONCAT(first_name, ' ', last_name)
    INTO v_name
    FROM Customer
    WHERE customer_id = p_customer_id;
    RETURN v_name;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP FUNCTION IF EXISTS `fn_display_alert` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `fn_display_alert`(
    p_transaction_id INT,
    p_risk_level VARCHAR(20),
    p_notes VARCHAR(255)
) RETURNS varchar(255) CHARSET utf8mb4
    DETERMINISTIC
BEGIN
    RETURN CONCAT(
        'Fraud Alert [Transaction ID: ', p_transaction_id,
        '] — Risk: ', p_risk_level,
        ' — Notes: ', p_notes
    );
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP FUNCTION IF EXISTS `fn_investigator_active_cases` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `fn_investigator_active_cases`(p_investigator_id INT) RETURNS int
    DETERMINISTIC
BEGIN
    DECLARE v_count INT;

    SELECT COUNT(*)
    INTO v_count
    FROM FraudAlert
    WHERE investigator_id = p_investigator_id;

    RETURN v_count;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP FUNCTION IF EXISTS `fn_risk_category` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `fn_risk_category`(p_score INT) RETURNS varchar(20) CHARSET utf8mb4
    DETERMINISTIC
BEGIN
    IF p_score >= 70 THEN
        RETURN 'High';
    ELSEIF p_score >= 40 THEN
        RETURN 'Medium';
    ELSE
        RETURN 'Low';
    END IF;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `AssignInvestigator` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `AssignInvestigator`(IN p_alert_id INT)
BEGIN
    DECLARE v_investigator_id INT;

    -- Find investigator with lowest number of assigned open cases
    SELECT investigator_id
    INTO v_investigator_id
    FROM Investigator
    ORDER BY 
        (SELECT COUNT(*) FROM FraudAlerts 
         WHERE investigator_id = Investigator.investigator_id 
         AND status = 'Open') ASC
    LIMIT 1;

    -- Assign
    UPDATE FraudAlerts
    SET investigator_id = v_investigator_id,
        status = 'Assigned'
    WHERE alert_id = p_alert_id;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `CloseFraudCase` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `CloseFraudCase`(
    IN p_alert_id INT,
    IN p_resolution_notes TEXT
)
BEGIN
    UPDATE FraudAlerts
    SET status = 'Closed',
        resolution_notes = p_resolution_notes,
        closed_on = CURDATE()
    WHERE alert_id = p_alert_id;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `DetectSuspiciousTransaction` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `DetectSuspiciousTransaction`(
    IN p_transaction_id INT
)
BEGIN
    DECLARE v_account_id INT;
    DECLARE v_customer_id INT;
    DECLARE v_amount DECIMAL(10,2);
    DECLARE v_city VARCHAR(50);
    DECLARE v_ts DATETIME;

    -- Extract transaction details
    SELECT account_id, amount, city, timestamp
    INTO v_account_id, v_amount, v_city, v_ts
    FROM Transactions
    WHERE transaction_id = p_transaction_id;

    -- Get customer id
    SELECT customer_id INTO v_customer_id 
    FROM Account WHERE account_id = v_account_id;

    -- RULE 1: High amount
    IF v_amount > 7500 THEN
        INSERT INTO FraudAlerts(customer_id, account_id, transaction_id, alert_type, severity, created_on)
        VALUES(v_customer_id, v_account_id, p_transaction_id, 
               'High Amount Transaction', 'High', CURDATE());
    END IF;

    -- RULE 2: Rapid-fire transactions
    IF (
        SELECT COUNT(*) FROM Transactions
        WHERE account_id = v_account_id
        AND timestamp >= DATE_SUB(v_ts, INTERVAL 1 HOUR)
    ) >= 3 THEN
        INSERT INTO FraudAlerts(customer_id, account_id, transaction_id, alert_type, severity, created_on)
        VALUES(v_customer_id, v_account_id, p_transaction_id, 
               'Multiple Rapid Transactions', 'Medium', CURDATE());
    END IF;

    -- RULE 3: Unusual city
    IF v_city NOT IN ('Toronto','Ottawa','Vancouver','Calgary','Montreal') THEN
        INSERT INTO FraudAlerts(customer_id, account_id, transaction_id, alert_type, severity, created_on)
        VALUES(v_customer_id, v_account_id, p_transaction_id, 
               'Suspicious Location', 'Medium', CURDATE());
    END IF;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `MonthlyFraudSummary` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `MonthlyFraudSummary`(IN p_year INT, IN p_month INT)
BEGIN
    SELECT 
        COUNT(*) AS total_alerts,
        SUM(CASE WHEN severity = 'High' THEN 1 ELSE 0 END) AS high_severity,
        SUM(CASE WHEN severity = 'Medium' THEN 1 ELSE 0 END) AS medium_severity,
        SUM(CASE WHEN severity = 'Low' THEN 1 ELSE 0 END) AS low_severity,
        COUNT(DISTINCT customer_id) AS affected_customers,
        COUNT(DISTINCT investigator_id) AS active_investigators
    FROM FraudAlerts
    WHERE YEAR(created_on) = p_year AND MONTH(created_on) = p_month;
END ;;
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

-- Dump completed on 2025-11-29 13:52:46
