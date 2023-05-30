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
-- Table structure for table `consumables`
--

DROP TABLE IF EXISTS `consumables`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `consumables` (
  `id` int NOT NULL AUTO_INCREMENT,
  `title` varchar(255) NOT NULL,
  `amount` int NOT NULL,
  `storage_id` int NOT NULL,
  `category_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `title_UNIQUE` (`title`),
  KEY `fk_consumables_storage_idx` (`storage_id`),
  KEY `fk_consumables_category1_idx` (`category_id`),
  CONSTRAINT `fk_consumables_category1` FOREIGN KEY (`category_id`) REFERENCES `category` (`id`),
  CONSTRAINT `fk_consumables_storage` FOREIGN KEY (`storage_id`) REFERENCES `storage` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=46 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `consumables`
--

LOCK TABLES `consumables` WRITE;
/*!40000 ALTER TABLE `consumables` DISABLE KEYS */;
INSERT INTO `consumables` VALUES (1,'Highlighter',5,1,1),(2,'Binder Clips',50,1,1),(3,'Correction Tape',17,2,1),(4,'Rubber Bands',100,2,1),(5,'Laser Printer',3,2,2),(6,'Inkjet Printer',4,2,2),(7,'CD/DVD',40,3,3),(8,'External Hard Drive',8,3,3),(9,'Headphones',20,3,3),(10,'Mouse Pad',15,3,3),(11,'Ethernet Switch',6,3,3),(12,'Power Strip',10,3,3),(13,'Ruler',30,1,1),(14,'Binder',20,2,1),(15,'Post-it Notes',50,1,1),(16,'Calculator',10,1,1),(17,'Pencil Sharpener',15,2,1),(18,'Eraser',50,2,1),(19,'Wireless Keyboard',5,3,3),(20,'Wireless Mouse',5,3,3),(21,'Desk Organizer',12,1,1),(22,'Push Pins',40,2,1),(23,'Pencil Case',20,1,1),(24,'File Folders',30,2,1),(25,'Binder Dividers',25,2,1),(26,'Laminating Pouches',10,3,3),(27,'Notebook Paper',100,3,3),(28,'Desk Calendar',8,1,1),(29,'Paper Shredder',3,2,2),(30,'Pen',50,1,1),(31,'Notebook',20,1,1),(32,'Stapler',15,2,1),(33,'Paper Clips',100,2,1),(34,'Ink Cartridge',10,2,2),(35,'Toner Cartridge',5,2,2),(36,'USB Flash Drive',30,3,3),(37,'Ethernet Cable',25,3,3),(38,'Mouse',12,3,3),(39,'Keyboard',12,3,3),(40,'HDMI Cable',8,3,3),(41,'Power Cord',20,3,3),(42,'Scissors',10,1,1),(43,'Glue Stick',15,2,1),(44,'Whiteboard Marker',40,1,1),(45,'New Consumable',5,3,3);
/*!40000 ALTER TABLE `consumables` ENABLE KEYS */;
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
