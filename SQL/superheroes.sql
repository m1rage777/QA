-- MySQL dump 10.13  Distrib 8.0.27, for Win64 (x86_64)
--
-- Host: localhost    Database: superheroes
-- ------------------------------------------------------
-- Server version	8.0.27

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
-- Table structure for table `superheroes`
--

DROP TABLE IF EXISTS `superheroes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `superheroes` (
  `id` int NOT NULL AUTO_INCREMENT,
  `hero_name` varchar(20) NOT NULL,
  `gender` varchar(1) DEFAULT NULL,
  `height` int DEFAULT '0',
  `real_name` varchar(20) DEFAULT NULL,
  `universe` int DEFAULT NULL,
  `team` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`hero_name`,`real_name`),
  KEY `hero_universe` (`universe`),
  KEY `hero_team` (`team`),
  CONSTRAINT `superheroes_ibfk_1` FOREIGN KEY (`universe`) REFERENCES `universes` (`id`),
  CONSTRAINT `superheroes_ibfk_2` FOREIGN KEY (`team`) REFERENCES `teams` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `superheroes`
--

LOCK TABLES `superheroes` WRITE;
/*!40000 ALTER TABLE `superheroes` DISABLE KEYS */;
INSERT INTO `superheroes` VALUES (1,'Spider Man','m',175,'Peter Parker',2,1),(2,'Captain America','m',188,'Steven Rogers',2,1),(3,'Black Widow','f',170,'Natalia Romanoff',2,1),(4,'Iron Man','m',198,'Tony Stark',2,1),(5,'Halk','m',229,'Bruce Banner',2,1),(12,'Batman ','m',188,'Bruce Wayne',1,3),(13,'Superman ','m',190,'Clark Kent',1,3),(14,'Wonder Woman','f',183,'Diana Prince',1,3),(15,'Flash','m',180,'Bartholomew Allen',1,3),(16,'Flash','m',183,'Wally West',1,3),(17,'Flash','m',180,'Jay Garrick',1,3),(18,'Wolverine','m',160,'James Howlett',2,2),(19,'Storm','f',175,'Ororo Munroe',2,2),(20,'Hellboy','m',195,'Anung Un Rama',4,5),(21,'Donatello','m',157,'Donatello',3,4),(22,'Raphael','m',158,'Raphael',3,4),(23,'Michelangelo','m',157,'Michelangelo',3,4),(24,'Leonardo','m',157,'Leonardo',3,4);
/*!40000 ALTER TABLE `superheroes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `teams`
--

DROP TABLE IF EXISTS `teams`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `teams` (
  `id` int NOT NULL,
  `team` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `teams`
--

LOCK TABLES `teams` WRITE;
/*!40000 ALTER TABLE `teams` DISABLE KEYS */;
INSERT INTO `teams` VALUES (1,'Avengers'),(2,'X-men'),(3,'Justice League'),(4,'Ninja Turtles'),(5,'Бюро паранормальных исследований и обороны');
/*!40000 ALTER TABLE `teams` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `universes`
--

DROP TABLE IF EXISTS `universes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `universes` (
  `id` int NOT NULL,
  `universe` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `universes`
--

LOCK TABLES `universes` WRITE;
/*!40000 ALTER TABLE `universes` DISABLE KEYS */;
INSERT INTO `universes` VALUES (1,'DC'),(2,'Marvel'),(3,'TMNT'),(4,'Dark Horse Comics');
/*!40000 ALTER TABLE `universes` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2022-01-04 14:01:18
