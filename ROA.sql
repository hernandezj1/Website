-- MySQL dump 10.13  Distrib 8.0.28, for Win64 (x86_64)
--
-- Host: localhost    Database: ratesofadvance
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
-- Table structure for table `battles`
--

DROP TABLE IF EXISTS `battles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `battles` (
  `idbattles` int NOT NULL AUTO_INCREMENT,
  `battle name` varchar(45) DEFAULT NULL,
  `warfk` int DEFAULT NULL,
  PRIMARY KEY (`idbattles`),
  KEY `war_idx` (`warfk`),
  CONSTRAINT `war` FOREIGN KEY (`warfk`) REFERENCES `wars` (`idWars`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `battles`
--

LOCK TABLES `battles` WRITE;
/*!40000 ALTER TABLE `battles` DISABLE KEYS */;
INSERT INTO `battles` VALUES (1,'D-Day',NULL),(2,'Pearl harbor',NULL);
/*!40000 ALTER TABLE `battles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `distance,time`
--

DROP TABLE IF EXISTS `distance,time`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `distance,time` (
  `iddtr` int NOT NULL AUTO_INCREMENT,
  `Distance` int DEFAULT NULL,
  `Time(days)` int DEFAULT NULL,
  `OperationFK` int DEFAULT NULL,
  PRIMARY KEY (`iddtr`),
  KEY `OPerationFK_idx` (`OperationFK`),
  CONSTRAINT `OPerationFK` FOREIGN KEY (`OperationFK`) REFERENCES `operation` (`idoperation`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `distance,time`
--

LOCK TABLES `distance,time` WRITE;
/*!40000 ALTER TABLE `distance,time` DISABLE KEYS */;
INSERT INTO `distance,time` VALUES (1,100,5,NULL),(2,20,2,NULL),(3,359,5,NULL);
/*!40000 ALTER TABLE `distance,time` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `modeoftransport`
--

DROP TABLE IF EXISTS `modeoftransport`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `modeoftransport` (
  `idmodeoftransport` int NOT NULL AUTO_INCREMENT,
  `Mode of transport` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`idmodeoftransport`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `modeoftransport`
--

LOCK TABLES `modeoftransport` WRITE;
/*!40000 ALTER TABLE `modeoftransport` DISABLE KEYS */;
INSERT INTO `modeoftransport` VALUES (1,'Foot'),(2,'horse'),(3,'Tank');
/*!40000 ALTER TABLE `modeoftransport` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `operation`
--

DROP TABLE IF EXISTS `operation`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `operation` (
  `idoperation` int NOT NULL AUTO_INCREMENT,
  `battlesFK` int DEFAULT NULL,
  `ModeFK` int DEFAULT NULL,
  `SourceFK` int DEFAULT NULL,
  `UnitFK` int DEFAULT NULL,
  PRIMARY KEY (`idoperation`),
  KEY `BattlesFk_idx` (`battlesFK`),
  KEY `modeFK_idx` (`ModeFK`),
  KEY `sourceFK_idx` (`SourceFK`),
  KEY `unitFK_idx` (`UnitFK`),
  CONSTRAINT `BattlesFk` FOREIGN KEY (`battlesFK`) REFERENCES `battles` (`idbattles`),
  CONSTRAINT `modeFK` FOREIGN KEY (`ModeFK`) REFERENCES `modeoftransport` (`idmodeoftransport`),
  CONSTRAINT `sourceFK` FOREIGN KEY (`SourceFK`) REFERENCES `source` (`idSource`),
  CONSTRAINT `unitFK` FOREIGN KEY (`UnitFK`) REFERENCES `unit` (`idUnit`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `operation`
--

LOCK TABLES `operation` WRITE;
/*!40000 ALTER TABLE `operation` DISABLE KEYS */;
INSERT INTO `operation` VALUES (1,1,1,1,1);
/*!40000 ALTER TABLE `operation` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `rate`
--

DROP TABLE IF EXISTS `rate`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `rate` (
  `Distance` int DEFAULT NULL,
  `Time(days)` int DEFAULT NULL,
  `Rate` decimal(14,4) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `rate`
--

LOCK TABLES `rate` WRITE;
/*!40000 ALTER TABLE `rate` DISABLE KEYS */;
INSERT INTO `rate` VALUES (100,5,20.0000),(20,2,10.0000),(359,5,71.8000);
/*!40000 ALTER TABLE `rate` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `source`
--

DROP TABLE IF EXISTS `source`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `source` (
  `idSource` int NOT NULL AUTO_INCREMENT,
  `Source of Information` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`idSource`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `source`
--

LOCK TABLES `source` WRITE;
/*!40000 ALTER TABLE `source` DISABLE KEYS */;
INSERT INTO `source` VALUES (1,'Savkin Data A-313'),(2,'Napoleon data A-58');
/*!40000 ALTER TABLE `source` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `unit`
--

DROP TABLE IF EXISTS `unit`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `unit` (
  `idUnit` int NOT NULL AUTO_INCREMENT,
  `Unit name` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`idUnit`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `unit`
--

LOCK TABLES `unit` WRITE;
/*!40000 ALTER TABLE `unit` DISABLE KEYS */;
INSERT INTO `unit` VALUES (1,'1st infantry US '),(2,'2nd infantry US');
/*!40000 ALTER TABLE `unit` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `wars`
--

DROP TABLE IF EXISTS `wars`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `wars` (
  `idWars` int NOT NULL AUTO_INCREMENT,
  `Name of War` varchar(45) DEFAULT NULL COMMENT 'Name of each different War. this si the most global out of the conflict categories.',
  PRIMARY KEY (`idWars`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wars`
--

LOCK TABLES `wars` WRITE;
/*!40000 ALTER TABLE `wars` DISABLE KEYS */;
INSERT INTO `wars` VALUES (1,'World War II'),(2,'World War I');
/*!40000 ALTER TABLE `wars` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2022-01-27 11:01:50
