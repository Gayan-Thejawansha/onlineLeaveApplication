-- MariaDB dump 10.18  Distrib 10.4.17-MariaDB, for Win64 (AMD64)
--
-- Host: localhost    Database: olas
-- ------------------------------------------------------
-- Server version	10.4.17-MariaDB

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `admin`
--

DROP TABLE IF EXISTS `admin`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `admin` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `UserName` varchar(100) NOT NULL,
  `Password` varchar(100) NOT NULL,
  `updationDate` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' ON UPDATE current_timestamp(),
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `admin`
--

LOCK TABLES `admin` WRITE;
/*!40000 ALTER TABLE `admin` DISABLE KEYS */;
INSERT INTO `admin` VALUES (1,'admin','827ccb0eea8a706c4c34a16891f84e7b','2021-01-15 16:45:52'),(2,'Gayan','827ccb0eea8a706c4c34a16891f84e7b','2021-01-24 07:36:35');
/*!40000 ALTER TABLE `admin` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbldepartments`
--

DROP TABLE IF EXISTS `tbldepartments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tbldepartments` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `DepartmentName` varchar(150) DEFAULT NULL,
  `DepartmentShortName` varchar(100) NOT NULL,
  `DepartmentCode` varchar(50) DEFAULT NULL,
  `CreationDate` timestamp NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbldepartments`
--

LOCK TABLES `tbldepartments` WRITE;
/*!40000 ALTER TABLE `tbldepartments` DISABLE KEYS */;
INSERT INTO `tbldepartments` VALUES (6,'Human Resources','HR','002','2021-01-20 03:33:18'),(7,'IT Department','IT','001','2021-01-23 13:10:16');
/*!40000 ALTER TABLE `tbldepartments` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tblemployees`
--

DROP TABLE IF EXISTS `tblemployees`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tblemployees` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `EmpId` varchar(100) NOT NULL,
  `FirstName` varchar(150) NOT NULL,
  `LastName` varchar(150) NOT NULL,
  `EmailId` varchar(200) NOT NULL,
  `Password` varchar(180) NOT NULL,
  `Gender` varchar(100) NOT NULL,
  `Dob` varchar(100) NOT NULL DEFAULT current_timestamp(),
  `Department` varchar(255) NOT NULL,
  `Address` varchar(255) NOT NULL,
  `Phonenumber` char(11) NOT NULL,
  `Category` varchar(50) NOT NULL,
  `Nic` varchar(15) NOT NULL,
  `Sechead` varchar(50) NOT NULL,
  `Institute` varchar(50) NOT NULL,
  `Status` varchar(15) NOT NULL,
  `RegDate` timestamp NOT NULL DEFAULT current_timestamp(),
  `permissionLevel` varchar(50) DEFAULT NULL,
  `secHeadId` varchar(15) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tblemployees`
--

LOCK TABLES `tblemployees` WRITE;
/*!40000 ALTER TABLE `tblemployees` DISABLE KEYS */;
INSERT INTO `tblemployees` VALUES (1,'Director_001','Director','Director','Director@Director','7c5ba892645af8d7dba520e3978c726f','Male','2 January, 1991','Human Resources','Director,Director,Director','1234567891','','7539521467','Director','7539521467','1','2021-01-24 18:09:58','Director','1'),(2,'Executive_002','Executive','Executive','Executive@Executive','671aa2e8cc2c2435cf509fa4a3baf26c','Other','1 January, 1993','Human Resources','44','1234567890','Executive','123456789v','admin','Institute','1','2021-01-23 15:56:10','sectionHead','1'),(3,'Officer_003','Officer','Officer','Officer@Officer','52c375813696b3de9433c236b3ba0253','Male','','IT Department','zotac','1234567891','Officer','12345+6789Offic','Executive','Institute','1','2021-01-23 15:57:55','noApproval','2');
/*!40000 ALTER TABLE `tblemployees` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tblleaves`
--

DROP TABLE IF EXISTS `tblleaves`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tblleaves` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `LeaveType` varchar(110) NOT NULL,
  `ToDate` varchar(120) NOT NULL,
  `FromDate` varchar(120) NOT NULL,
  `Description` mediumtext NOT NULL,
  `PostingDate` timestamp NOT NULL DEFAULT current_timestamp(),
  `AppSecHead` varchar(15) DEFAULT NULL,
  `AppDirector` varchar(15) NOT NULL,
  `empid` int(11) DEFAULT NULL,
  `AppSecHeadStatus` varchar(255) DEFAULT NULL,
  `AppSecHeadDate` varchar(120) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `UserEmail` (`empid`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tblleaves`
--

LOCK TABLES `tblleaves` WRITE;
/*!40000 ALTER TABLE `tblleaves` DISABLE KEYS */;
INSERT INTO `tblleaves` VALUES (1,'Casual Leave','25/01/2001','26/01/2001','whatever','2021-01-23 16:04:19','2','2',3,'Approved','24/01/2021'),(2,'Personal Leavee','05/05/2055','06/06/2066','6+66666','2021-01-23 16:15:07','2','1',3,'Approved','24/01/2021'),(16,'Personal Leavee','11/11/2011','22/02/2022','111111->2222222','2021-01-24 20:48:14','1','1',2,'Approved','24/01/2021');
/*!40000 ALTER TABLE `tblleaves` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tblleavetype`
--

DROP TABLE IF EXISTS `tblleavetype`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tblleavetype` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `LeaveType` varchar(200) DEFAULT NULL,
  `Description` mediumtext DEFAULT NULL,
  `CreationDate` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tblleavetype`
--

LOCK TABLES `tblleavetype` WRITE;
/*!40000 ALTER TABLE `tblleavetype` DISABLE KEYS */;
INSERT INTO `tblleavetype` VALUES (4,'Personal Leavee','sick','2021-01-16 03:01:59'),(5,'Casual Leave','Maximum Limit 21 per year; But any employee can request maximum 6 casual leaves at a time','2021-01-17 18:38:52'),(6,'Annual ','Maximum Limit 24 per year. can apply all 21 at once if he wants','2021-01-17 18:40:35'),(7,'Other','Duty Leave/Maternity Leave/Paternity Leave','2021-01-17 18:42:08');
/*!40000 ALTER TABLE `tblleavetype` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2021-01-25  2:25:59
