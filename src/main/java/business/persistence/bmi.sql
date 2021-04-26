CREATE DATABASE  IF NOT EXISTS `bmi` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `bmi`;
-- MySQL dump 10.13  Distrib 8.0.17, for macos10.14 (x86_64)
--
-- Host: 127.0.0.1    Database: bmi
-- ------------------------------------------------------
-- Server version	8.0.21

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
-- Table structure for table `bmi_entry`
--

DROP TABLE IF EXISTS `bmi_entry`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `bmi_entry` (
  `bmi_entry_id` int NOT NULL AUTO_INCREMENT,
  `height` int DEFAULT NULL,
  `weight` int DEFAULT NULL,
  `category` varchar(20) DEFAULT NULL,
  `bmi` float DEFAULT NULL,
  `gender` varchar(6) DEFAULT NULL,
  `sport_id` int DEFAULT NULL,
  `user_id` int DEFAULT NULL,
  `created` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`bmi_entry_id`),
  KEY `fk_bmi_entry_users_idx` (`user_id`),
  KEY `fk_bmi_entry_sport1_idx` (`sport_id`),
  CONSTRAINT `fk_bmi_entry_sport1` FOREIGN KEY (`sport_id`) REFERENCES `sport` (`sport_id`),
  CONSTRAINT `fk_bmi_entry_users` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bmi_entry`
--

LOCK TABLES `bmi_entry` WRITE;
/*!40000 ALTER TABLE `bmi_entry` DISABLE KEYS */;
INSERT INTO `bmi_entry` VALUES (1,182,80,'Normalvægtig',24.1517,'female',1,1,'2021-04-12 23:34:03'),(2,170,60,'Normalvægtig',20.7612,'male',1,3,'2021-04-12 23:34:53'),(3,170,50,'Undervægtig',17.301,'female',4,1,'2021-04-12 23:36:37'),(4,170,50,'Undervægtig',17.301,'male',3,1,'2021-04-12 23:52:20'),(5,182,80,'Normalvægtig',24.1517,'male',4,1,'2021-04-13 19:36:52'),(6,200,100,'Overvægtig',25,'male',1,2,'2021-04-13 19:37:35'),(7,182,80,'Normalvægtig',24.1517,'male',2,4,'2021-04-13 20:38:11'),(8,200,80,'Normalvægtig',20,'male',5,1,'2021-04-13 21:23:09'),(9,180,75,'Normalvægtig',23.1481,'male',5,4,'2021-04-14 07:22:22'),(10,182,80,'Normalvægtig',24.1517,'female',3,1,'2021-04-14 10:31:07'),(11,182,80,'Normalvægtig',24.1517,'male',1,1,'2021-04-14 10:38:08');
/*!40000 ALTER TABLE `bmi_entry` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `hobby`
--

DROP TABLE IF EXISTS `hobby`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `hobby` (
  `hobby_id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`hobby_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `hobby`
--

LOCK TABLES `hobby` WRITE;
/*!40000 ALTER TABLE `hobby` DISABLE KEYS */;
INSERT INTO `hobby` VALUES (1,'Jeg går op i sund kost'),(2,'Jeg har et sommerhus'),(3,'Jeg er kæledyr');
/*!40000 ALTER TABLE `hobby` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `link_bmi_hobby`
--

DROP TABLE IF EXISTS `link_bmi_hobby`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `link_bmi_hobby` (
  `hobby_id` int NOT NULL,
  `bmi_entry_id` int NOT NULL,
  PRIMARY KEY (`hobby_id`,`bmi_entry_id`),
  KEY `fk_link_bmi_hobby_bmi_entry1_idx` (`bmi_entry_id`),
  CONSTRAINT `fk_hobby_bmi_entry` FOREIGN KEY (`hobby_id`) REFERENCES `hobby` (`hobby_id`),
  CONSTRAINT `fk_link_bmi_hobby_bmi_entry1` FOREIGN KEY (`bmi_entry_id`) REFERENCES `bmi_entry` (`bmi_entry_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `link_bmi_hobby`
--

LOCK TABLES `link_bmi_hobby` WRITE;
/*!40000 ALTER TABLE `link_bmi_hobby` DISABLE KEYS */;
INSERT INTO `link_bmi_hobby` VALUES (1,4),(2,4),(1,5),(2,5),(3,5),(1,6),(2,6),(1,7),(2,7),(1,8),(2,8),(1,9),(2,9),(1,10),(2,10),(1,11),(2,11);
/*!40000 ALTER TABLE `link_bmi_hobby` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sport`
--

DROP TABLE IF EXISTS `sport`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sport` (
  `sport_id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`sport_id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sport`
--

LOCK TABLES `sport` WRITE;
/*!40000 ALTER TABLE `sport` DISABLE KEYS */;
INSERT INTO `sport` VALUES (1,'tennis'),(2,'bordfodbold'),(3,'yoga'),(4,'gymnastik'),(5,'langbold');
/*!40000 ALTER TABLE `sport` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `users` (
  `id` int NOT NULL AUTO_INCREMENT,
  `email` varchar(90) NOT NULL,
  `password` varchar(45) NOT NULL,
  `role` varchar(20) NOT NULL DEFAULT 'customer',
  PRIMARY KEY (`id`),
  UNIQUE KEY `email_UNIQUE` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (1,'barbie@world.dk','jensen','customer'),(2,'ken@world.com','jensen','customer'),(3,'robin@gotham.com','batman','employee'),(4,'jon@jon.dk','123','customer');
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2021-04-14 21:48:31
