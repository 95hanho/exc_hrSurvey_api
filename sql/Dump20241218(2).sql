-- MySQL dump 10.13  Distrib 8.0.36, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: hr_survey
-- ------------------------------------------------------
-- Server version	8.0.37

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
-- Table structure for table `common_info`
--

DROP TABLE IF EXISTS `common_info`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `common_info` (
  `year` int NOT NULL,
  `backcolor` varchar(45) DEFAULT NULL,
  `start_date` datetime DEFAULT CURRENT_TIMESTAMP,
  `end_date` datetime DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`year`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `common_info`
--

LOCK TABLES `common_info` WRITE;
/*!40000 ALTER TABLE `common_info` DISABLE KEYS */;
INSERT INTO `common_info` VALUES (2024,'#efefef','2024-07-26 14:00:00','2024-07-31 14:00:00'),(2025,NULL,'2024-12-18 15:56:22','2024-12-18 15:56:22');
/*!40000 ALTER TABLE `common_info` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `page_survey`
--

DROP TABLE IF EXISTS `page_survey`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `page_survey` (
  `p_survey_id` int NOT NULL AUTO_INCREMENT,
  `sPage` int DEFAULT NULL,
  `jsonData` json DEFAULT NULL,
  `survey_id` int DEFAULT NULL,
  PRIMARY KEY (`p_survey_id`),
  KEY `page_survey_survey_idx` (`survey_id`),
  CONSTRAINT `page_survey_survey` FOREIGN KEY (`survey_id`) REFERENCES `survey` (`survey_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `page_survey`
--

LOCK TABLES `page_survey` WRITE;
/*!40000 ALTER TABLE `page_survey` DISABLE KEYS */;
/*!40000 ALTER TABLE `page_survey` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `survey`
--

DROP TABLE IF EXISTS `survey`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `survey` (
  `survey_id` int NOT NULL AUTO_INCREMENT,
  `survey_description` varchar(100) DEFAULT NULL,
  `survey_url` varchar(45) DEFAULT NULL,
  `survey_name` varchar(100) DEFAULT NULL,
  `top_menu_list_jsonData` json DEFAULT NULL,
  `year` int DEFAULT NULL,
  PRIMARY KEY (`survey_id`),
  KEY `common_info_survey_idx` (`year`),
  CONSTRAINT `common_info_survey` FOREIGN KEY (`year`) REFERENCES `common_info` (`year`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `survey`
--

LOCK TABLES `survey` WRITE;
/*!40000 ALTER TABLE `survey` DISABLE KEYS */;
INSERT INTO `survey` VALUES (9,'개발','hrd_2024','제 24회 인재개발 실태조사',NULL,2024),(10,'채용','hrm_2024','제 25회 인재채용 실태조사',NULL,2024);
/*!40000 ALTER TABLE `survey` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-12-18 21:30:25
