CREATE DATABASE  IF NOT EXISTS `trafficdb` /*!40100 DEFAULT CHARACTER SET utf8 */;
USE `trafficdb`;
-- MySQL dump 10.13  Distrib 5.7.17, for Win64 (x86_64)
--
-- Host: localhost    Database: trafficdb
-- ------------------------------------------------------
-- Server version	5.7.19-log

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
-- Table structure for table `driver`
--

DROP TABLE IF EXISTS `driver`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `driver` (
  `lic_no` int(10) NOT NULL,
  `d_name` varchar(50) NOT NULL,
  `d_address` varchar(100) NOT NULL,
  `dob` date NOT NULL,
  PRIMARY KEY (`lic_no`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `driver`
--

LOCK TABLES `driver` WRITE;
/*!40000 ALTER TABLE `driver` DISABLE KEYS */;
INSERT INTO `driver` VALUES (90,'ananath','banashankari','1995-01-10'),(91,'vamsi','basavangudi','1990-11-20'),(92,'darshan','basavangudi','1997-09-14'),(93,'shreya','jayanagar','1993-07-22'),(94,'ranjith','majestic','1999-04-18'),(95,'manoj','hebbal','1991-02-25');
/*!40000 ALTER TABLE `driver` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `insert_log`
--

DROP TABLE IF EXISTS `insert_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `insert_log` (
  `rd_id` int(11) NOT NULL,
  `rd_name` varchar(45) DEFAULT NULL,
  `type_of_way` varchar(45) DEFAULT NULL,
  `log` datetime DEFAULT NULL,
  PRIMARY KEY (`rd_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `insert_log`
--

LOCK TABLES `insert_log` WRITE;
/*!40000 ALTER TABLE `insert_log` DISABLE KEYS */;
INSERT INTO `insert_log` VALUES (7,'nice road','toll road','2017-11-18 13:42:26'),(100,'example','city','2017-12-05 10:41:55');
/*!40000 ALTER TABLE `insert_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `junction`
--

DROP TABLE IF EXISTS `junction`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `junction` (
  `junction_id` int(11) NOT NULL,
  `j_name` varchar(45) DEFAULT NULL,
  `license_id` int(10) NOT NULL,
  PRIMARY KEY (`license_id`),
  KEY `driver_name_idx` (`license_id`),
  CONSTRAINT `licence_id` FOREIGN KEY (`license_id`) REFERENCES `driver` (`lic_no`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `junction`
--

LOCK TABLES `junction` WRITE;
/*!40000 ALTER TABLE `junction` DISABLE KEYS */;
INSERT INTO `junction` VALUES (100,'kothanur',90),(101,'bagalur',91),(102,'anandrao',92),(103,'sajjanrao',93),(104,'southend',94),(105,'ashoka',95);
/*!40000 ALTER TABLE `junction` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `road`
--

DROP TABLE IF EXISTS `road`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `road` (
  `rd_id` int(11) NOT NULL,
  `rd_name` varchar(45) DEFAULT NULL,
  `type_of_way` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`rd_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `road`
--

LOCK TABLES `road` WRITE;
/*!40000 ALTER TABLE `road` DISABLE KEYS */;
INSERT INTO `road` VALUES (1,'mg road','city road'),(2,'magadi road','city road'),(3,'tumkur road','state highway'),(4,'airport road','national highway'),(5,'hal road','city road'),(6,'mysore road','state highway'),(7,'nice road','toll road');
/*!40000 ALTER TABLE `road` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 trigger trig before insert on road
for each row
begin
if new.rd_id < 0 then
signal sqlstate '45000'
set message_text = 'Road ID less than zero';
end if;
end */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 trigger trig1
after insert on road
for each row
begin
insert into insert_log(rd_id, rd_name,type_of_way,log)values(new.rd_id,new.rd_name,new.type_of_way,now());
end */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `vehicle`
--

DROP TABLE IF EXISTS `vehicle`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `vehicle` (
  `reg_no` varchar(10) NOT NULL,
  `lic_id` int(10) NOT NULL,
  `v_color` varchar(10) DEFAULT NULL,
  `v_class` varchar(4) DEFAULT NULL,
  `model_name` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`reg_no`),
  KEY `lic_id_idx` (`lic_id`),
  CONSTRAINT `lic_id` FOREIGN KEY (`lic_id`) REFERENCES `driver` (`lic_no`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `vehicle`
--

LOCK TABLES `vehicle` WRITE;
/*!40000 ALTER TABLE `vehicle` DISABLE KEYS */;
INSERT INTO `vehicle` VALUES ('ka01aa0000',90,'red','lmv','i10'),('ka01ab0022',95,'brown','vlmv','rx100'),('ka02mf1010',93,'blue','hmv','canter'),('ka03pq2323',91,'red','lmv','duster'),('ka04st9988',94,'black','vlmv','activa'),('ka05za9999',92,'white','lmv','creta');
/*!40000 ALTER TABLE `vehicle` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `violation`
--

DROP TABLE IF EXISTS `violation`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `violation` (
  `vn_no` int(11) NOT NULL,
  `vn_name` varchar(45) DEFAULT NULL,
  `vn_fine` float NOT NULL,
  `lic_num` int(10) NOT NULL,
  `rd_no` int(11) NOT NULL,
  PRIMARY KEY (`vn_no`),
  KEY `lic_num_idx` (`lic_num`),
  KEY `rd_no_idx` (`rd_no`),
  CONSTRAINT `lic_num` FOREIGN KEY (`lic_num`) REFERENCES `driver` (`lic_no`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `rd_no` FOREIGN KEY (`rd_no`) REFERENCES `road` (`rd_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `violation`
--

LOCK TABLES `violation` WRITE;
/*!40000 ALTER TABLE `violation` DISABLE KEYS */;
INSERT INTO `violation` VALUES (10,'overtaking',200,91,2),(68,'rash driving',500,93,6),(70,'no helmet',100,94,2),(79,'drink&drive',5000,92,6),(88,'no entry',100,90,1),(99,'signal skip',200,95,5);
/*!40000 ALTER TABLE `violation` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping events for database 'trafficdb'
--

--
-- Dumping routines for database 'trafficdb'
--
/*!50003 DROP PROCEDURE IF EXISTS `myproc` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `myproc`(IN id int(11), IN name varchar(45), IN way varchar(45))
begin
insert into road(rd_id,rd_name,type_of_way) values(id,name,way);
end ;;
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

-- Dump completed on 2018-12-04 11:31:01
