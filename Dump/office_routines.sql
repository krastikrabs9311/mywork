CREATE DATABASE  IF NOT EXISTS `office` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `office`;
-- MySQL dump 10.13  Distrib 8.0.33, for Linux (x86_64)
--
-- Host: localhost    Database: office
-- ------------------------------------------------------
-- Server version	8.0.33-0ubuntu0.22.04.2

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
-- Temporary view structure for view `result_table`
--

DROP TABLE IF EXISTS `result_table`;
/*!50001 DROP VIEW IF EXISTS `result_table`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `result_table` AS SELECT 
 1 AS `amount`,
 1 AS `consumable`,
 1 AS `category`,
 1 AS `date`,
 1 AS `firstname`,
 1 AS `lastname`,
 1 AS `middlename`,
 1 AS `profession`,
 1 AS `storage`*/;
SET character_set_client = @saved_cs_client;

--
-- Final view structure for view `result_table`
--

/*!50001 DROP VIEW IF EXISTS `result_table`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`chiya`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `result_table` AS select `accounting`.`amount` AS `amount`,`consumables`.`title` AS `consumable`,`category`.`title` AS `category`,`accounting`.`date` AS `date`,`personal`.`firstname` AS `firstname`,`personal`.`lastname` AS `lastname`,`personal`.`middlename` AS `middlename`,`profession`.`title` AS `profession`,`storage`.`title` AS `storage` from (((((`accounting` join `consumables` on((`accounting`.`consumables_id` = `consumables`.`id`))) join `personal` on((`accounting`.`personal_id` = `personal`.`id`))) join `profession` on((`personal`.`profession_id` = `profession`.`id`))) join `storage` on((`consumables`.`storage_id` = `storage`.`id`))) join `category` on((`consumables`.`category_id` = `category`.`id`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Dumping events for database 'office'
--

--
-- Dumping routines for database 'office'
--
/*!50003 DROP PROCEDURE IF EXISTS `AddAccountingRow` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`localhost` PROCEDURE `AddAccountingRow`(
    IN p_amount INT,
    IN p_consumables_id INT,
    IN p_personal_id INT
)
BEGIN
    DECLARE current_amount INT;
    
    DECLARE exit handler for sqlexception
    BEGIN
        ROLLBACK;
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Error occurred, transaction rolled back';
    END;

    START TRANSACTION;
    
    -- Get the current amount of consumables
    SELECT `amount` INTO current_amount
    FROM `office`.`consumables`
    WHERE `id` = p_consumables_id
    FOR UPDATE;
    
    -- Check if the requested amount is valid
    IF current_amount < p_amount THEN
        ROLLBACK;
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Insufficient amount of consumables';
    ELSE
        -- Decrease amount in the consumables row
        UPDATE `office`.`consumables`
        SET `amount` = `amount` - p_amount
        WHERE `id` = p_consumables_id;
        
        -- Insert the accounting row
        INSERT INTO `office`.`accounting` (`amount`, `date`, `consumables_id`, `personal_id`)
        VALUES (p_amount, CURRENT_TIMESTAMP(), p_consumables_id, p_personal_id);
        
        -- Commit the transaction
        COMMIT;
    END IF;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `AddConsumable` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`localhost` PROCEDURE `AddConsumable`(
    IN p_Title VARCHAR(255),
    IN p_Amount INT,
    IN p_StorageTitle VARCHAR(255),
    IN p_CategoryTitle VARCHAR(255)
)
BEGIN
    DECLARE v_StorageId INT;
    DECLARE v_CategoryId INT;

    -- Get the storage ID based on the provided title
    SELECT id INTO v_StorageId FROM `office`.`storage` WHERE title = p_StorageTitle;

    -- Get the category ID based on the provided title
    SELECT id INTO v_CategoryId FROM `office`.`category` WHERE title = p_CategoryTitle;

    -- Insert the consumable
    INSERT INTO `office`.`consumables` (title, amount, storage_id, category_id)
    VALUES (p_Title, p_Amount, v_StorageId, v_CategoryId);
    
    -- Display success message
    SELECT 'Consumable added successfully.' AS message;
    
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

-- Dump completed on 2023-05-29 17:03:09
