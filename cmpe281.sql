-- MySQL dump 10.13  Distrib 5.7.2-m12, for osx10.7 (x86_64)
--
-- Host: localhost    Database: CMPE281
-- ------------------------------------------------------
-- Server version	5.7.2-m12

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `billing`
--

DROP TABLE IF EXISTS `billing`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `billing` (
  `BillId` int(11) NOT NULL AUTO_INCREMENT,
  `OrderId` int(11) NOT NULL,
  `UserId` int(11) NOT NULL,
  `StartTime` datetime NOT NULL,
  `EndTime` datetime NOT NULL,
  `Plan` int(11) NOT NULL,
  `UnitPrice` decimal(10,2) NOT NULL,
  `Uptime` int(11) NOT NULL,
  `Charge` decimal(10,2) NOT NULL,
  `Status` varchar(45) NOT NULL,
  `DueDate` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`BillId`),
  KEY `OrderId_idx` (`OrderId`),
  KEY `UserId_idx` (`UserId`),
  CONSTRAINT `OrderId` FOREIGN KEY (`OrderId`) REFERENCES `orders` (`OrderId`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `billing`
--

LOCK TABLES `billing` WRITE;
/*!40000 ALTER TABLE `billing` DISABLE KEYS */;
INSERT INTO `billing` VALUES (1,6,1,'2014-04-20 02:26:19','2014-04-20 11:59:50',0,0.12,6464,12.93,'A','0000-00-00 00:00:00'),(3,8,1,'2014-04-20 12:03:45','2014-04-20 12:05:00',0,0.11,75,0.14,'A','0000-00-00 00:00:00'),(4,8,1,'2014-04-20 12:05:00','2014-04-20 12:58:05',0,0.11,2666,4.89,'A','0000-00-00 00:00:00'),(7,11,1,'2014-05-09 18:47:04','2014-05-09 19:34:13',0,0.11,2660,4.88,'A','2014-05-29 19:34:14');
/*!40000 ALTER TABLE `billing` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `host`
--

DROP TABLE IF EXISTS `host`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `host` (
  `Host` varchar(40) NOT NULL,
  `Key` varchar(45) NOT NULL,
  `Player` varchar(100) NOT NULL,
  PRIMARY KEY (`Host`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `host`
--

LOCK TABLES `host` WRITE;
/*!40000 ALTER TABLE `host` DISABLE KEYS */;
INSERT INTO `host` VALUES ('lan@localhost','/Users/lan/.ssh/pwdless_rsa','/Applications/Genymotion.app/Contents/MacOS/player');
/*!40000 ALTER TABLE `host` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `instance`
--

DROP TABLE IF EXISTS `instance`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `instance` (
  `VmId` int(11) NOT NULL AUTO_INCREMENT,
  `VmName` varchar(45) NOT NULL,
  `Host` varchar(45) NOT NULL,
  `ReservedBy` int(11) DEFAULT NULL COMMENT '\n',
  `OrderId` int(11) DEFAULT NULL,
  PRIMARY KEY (`VmId`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `instance`
--

LOCK TABLES `instance` WRITE;
/*!40000 ALTER TABLE `instance` DISABLE KEYS */;
INSERT INTO `instance` VALUES (9,'Nexus 7 - 4.4.2 - API 19 - 800x1280','lan@localhost',NULL,NULL),(10,'Custom Tablet 10 - 4.4.2 - API 19 - 1280x800','lan@localhost',NULL,NULL),(11,'Galaxy S2 - 4.1.1 - API 16 - 480x800','lan@localhost',NULL,NULL),(12,'Galaxy S3 - 4.3 - API 18 - 720x1280','lan@localhost',1,11);
/*!40000 ALTER TABLE `instance` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `logs`
--

DROP TABLE IF EXISTS `logs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `logs` (
  `LogId` int(11) NOT NULL AUTO_INCREMENT,
  `OrderId` int(11) NOT NULL,
  `VmId` int(11) NOT NULL,
  `StartTime` datetime NOT NULL,
  `EndTime` datetime DEFAULT NULL,
  `Uptime` int(11) DEFAULT NULL,
  PRIMARY KEY (`LogId`),
  KEY `OrderId_idx` (`OrderId`),
  KEY `VmId_idx` (`VmId`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `logs`
--

LOCK TABLES `logs` WRITE;
/*!40000 ALTER TABLE `logs` DISABLE KEYS */;
INSERT INTO `logs` VALUES (1,11,12,'2014-05-09 18:47:04','2014-05-09 18:50:15',191),(2,11,12,'2014-05-09 18:51:38','2014-05-09 18:53:37',119),(3,11,12,'2014-05-09 18:55:03','2014-05-09 21:33:10',7137);
/*!40000 ALTER TABLE `logs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `new_table`
--

DROP TABLE IF EXISTS `new_table`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `new_table` (
  `UserId` int(11) NOT NULL AUTO_INCREMENT,
  `email` varchar(45) NOT NULL,
  `password` varchar(45) NOT NULL,
  PRIMARY KEY (`UserId`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `new_table`
--

LOCK TABLES `new_table` WRITE;
/*!40000 ALTER TABLE `new_table` DISABLE KEYS */;
/*!40000 ALTER TABLE `new_table` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `orders`
--

DROP TABLE IF EXISTS `orders`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `orders` (
  `UserId` int(11) NOT NULL,
  `VmId` int(11) NOT NULL,
  `OrderId` int(11) NOT NULL AUTO_INCREMENT,
  `VmName` varchar(45) NOT NULL,
  `VmStatus` varchar(1) NOT NULL,
  `Uptime` int(11) NOT NULL,
  `LastStartTime` datetime NOT NULL,
  `RatePlan` int(11) NOT NULL,
  `UnitPrice` decimal(10,2) NOT NULL,
  `LastBillDate` datetime NOT NULL,
  PRIMARY KEY (`OrderId`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `orders`
--

LOCK TABLES `orders` WRITE;
/*!40000 ALTER TABLE `orders` DISABLE KEYS */;
INSERT INTO `orders` VALUES (1,9,3,'Nexus 7 - 4.4.2 - API 19 - 800x1280','T',3294,'2014-04-20 02:23:23',0,0.12,'2014-04-20 01:25:00'),(1,9,6,'Nexus 7 - 4.4.2 - API 19 - 800x1280','T',0,'2014-04-20 10:58:50',0,0.12,'2014-04-20 11:59:50'),(1,9,8,'Nexus 7 - 4.4.2 - API 19 - 800x1280','T',0,'2014-04-20 12:54:33',0,0.11,'2014-04-20 12:58:05'),(1,12,11,'Galaxy S3 - 4.3 - API 18 - 720x1280','S',7137,'2014-05-09 18:55:03',0,0.11,'2014-05-09 19:34:13');
/*!40000 ALTER TABLE `orders` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2014-05-09 22:06:52
