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
-- Table structure for table `accounting`
--

DROP TABLE IF EXISTS `accounting`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `accounting` (
  `id` int NOT NULL AUTO_INCREMENT,
  `amount` int NOT NULL,
  `date` datetime NOT NULL,
  `consumables_id` int NOT NULL,
  `personal_id` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_accounting_consumables1_idx` (`consumables_id`),
  KEY `fk_accounting_personal1_idx` (`personal_id`),
  CONSTRAINT `fk_accounting_consumables1` FOREIGN KEY (`consumables_id`) REFERENCES `consumables` (`id`),
  CONSTRAINT `fk_accounting_personal1` FOREIGN KEY (`personal_id`) REFERENCES `personal` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=30 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `accounting`
--

LOCK TABLES `accounting` WRITE;
/*!40000 ALTER TABLE `accounting` DISABLE KEYS */;
INSERT INTO `accounting` VALUES (1,2,'2023-05-01 10:00:00',1,1),(2,3,'2023-05-02 14:30:00',2,2),(3,1,'2023-05-03 09:15:00',3,3),(4,4,'2023-05-04 11:30:00',4,4),(5,2,'2023-05-05 13:45:00',5,5),(6,3,'2023-05-06 08:30:00',6,6),(7,1,'2023-05-07 12:00:00',7,7),(8,4,'2023-05-08 14:15:00',8,8),(9,2,'2023-05-09 09:30:00',9,9),(10,3,'2023-05-10 13:00:00',10,10),(11,1,'2023-05-11 10:45:00',11,1),(12,4,'2023-05-12 12:30:00',12,2),(13,2,'2023-05-13 09:00:00',13,3),(14,3,'2023-05-14 14:45:00',14,4),(15,1,'2023-05-15 08:15:00',15,5),(16,4,'2023-05-16 11:00:00',16,6),(17,2,'2023-05-17 13:30:00',17,7),(18,3,'2023-05-18 09:45:00',18,8),(19,1,'2023-05-19 12:15:00',19,9),(20,4,'2023-05-04 12:00:00',1,2),(21,4,'2023-05-24 22:41:34',1,2),(22,4,'2023-05-24 22:50:56',1,2),(23,4,'2023-05-24 22:57:12',1,1),(24,4,'2023-05-24 23:02:13',1,1),(25,3,'2023-05-24 23:09:34',1,1),(26,12,'2023-05-29 16:53:06',1,1),(27,3,'2023-05-29 16:57:49',1,1),(28,3,'2023-05-29 16:57:54',1,1),(29,13,'2023-05-29 17:01:15',3,5);
/*!40000 ALTER TABLE `accounting` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-05-29 17:03:09
