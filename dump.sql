-- MySQL dump 10.13  Distrib 5.6.27, for debian-linux-gnu (x86_64)
--
-- Host: localhost    Database: Spy
-- ------------------------------------------------------
-- Server version	5.6.27-0ubuntu0.15.04.1

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
-- Table structure for table `Banned_domains`
--

DROP TABLE IF EXISTS `Banned_domains`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Banned_domains` (
  `domain_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `time` time NOT NULL DEFAULT '00:00:00'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Banned_domains`
--

LOCK TABLES `Banned_domains` WRITE;
/*!40000 ALTER TABLE `Banned_domains` DISABLE KEYS */;
INSERT INTO `Banned_domains` VALUES (1,4,'00:20:00'),(4,4,'00:00:00');
/*!40000 ALTER TABLE `Banned_domains` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Banned_processes`
--

DROP TABLE IF EXISTS `Banned_processes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Banned_processes` (
  `process_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `time` time NOT NULL DEFAULT '00:00:00'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Banned_processes`
--

LOCK TABLES `Banned_processes` WRITE;
/*!40000 ALTER TABLE `Banned_processes` DISABLE KEYS */;
INSERT INTO `Banned_processes` VALUES (5,1,'00:15:00'),(5,2,'00:20:00'),(5,3,'00:00:00');
/*!40000 ALTER TABLE `Banned_processes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Domains`
--

DROP TABLE IF EXISTS `Domains`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Domains` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `domain` varchar(50) DEFAULT NULL,
  `description` text,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Domains`
--

LOCK TABLES `Domains` WRITE;
/*!40000 ALTER TABLE `Domains` DISABLE KEYS */;
INSERT INTO `Domains` VALUES (1,'facebook.com','social media'),(3,'stackoverflow.com',''),(4,'panidomu.pl','');
/*!40000 ALTER TABLE `Domains` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Preferred_domains`
--

DROP TABLE IF EXISTS `Preferred_domains`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Preferred_domains` (
  `domain_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `time` time NOT NULL DEFAULT '00:00:00'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Preferred_domains`
--

LOCK TABLES `Preferred_domains` WRITE;
/*!40000 ALTER TABLE `Preferred_domains` DISABLE KEYS */;
INSERT INTO `Preferred_domains` VALUES (3,1,'00:00:00');
/*!40000 ALTER TABLE `Preferred_domains` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Preferred_processes`
--

DROP TABLE IF EXISTS `Preferred_processes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Preferred_processes` (
  `process_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `time` time NOT NULL DEFAULT '00:00:00'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Preferred_processes`
--

LOCK TABLES `Preferred_processes` WRITE;
/*!40000 ALTER TABLE `Preferred_processes` DISABLE KEYS */;
INSERT INTO `Preferred_processes` VALUES (4,2,'06:00:00'),(11,2,'00:00:00'),(6,1,'07:00:00'),(8,1,'01:00:00'),(1,1,'00:00:00'),(15,1,'00:00:00'),(16,4,'05:40:00');
/*!40000 ALTER TABLE `Preferred_processes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Processes`
--

DROP TABLE IF EXISTS `Processes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Processes` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `command` varchar(30) DEFAULT NULL,
  `description` text,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Processes`
--

LOCK TABLES `Processes` WRITE;
/*!40000 ALTER TABLE `Processes` DISABLE KEYS */;
INSERT INTO `Processes` VALUES (1,'sublime_text','editor, programming'),(2,'firefox','browser'),(3,'spotify',NULL),(4,'gimp','graphics'),(5,'sol','solitare, game, made by devil'),(6,'eclipse','editor, programming'),(7,'java',NULL),(8,'ruby',NULL),(9,'chromium-browser','browser'),(10,'vivaldi-bin','browser'),(11,'shotwell',NULL),(12,'thunderbird',NULL),(14,'gedit','editor'),(15,'evince','pdf, document'),(16,'soffice.bin','libre office, writer, calc');
/*!40000 ALTER TABLE `Processes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Processes_log`
--

DROP TABLE IF EXISTS `Processes_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Processes_log` (
  `user_id` int(11) NOT NULL,
  `process_id` int(11) NOT NULL,
  `started_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `elapsed_time` time NOT NULL,
  `memory` float NOT NULL,
  `cpu` float NOT NULL,
  KEY `user_id` (`user_id`),
  KEY `process_id` (`process_id`),
  CONSTRAINT `Processes_log_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `Users` (`id`),
  CONSTRAINT `Processes_log_ibfk_2` FOREIGN KEY (`process_id`) REFERENCES `Processes` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Processes_log`
--

LOCK TABLES `Processes_log` WRITE;
/*!40000 ALTER TABLE `Processes_log` DISABLE KEYS */;
INSERT INTO `Processes_log` VALUES (1,1,'2016-01-13 16:46:01','04:30:04',53.6,0.4),(1,3,'2016-01-13 14:46:36','06:29:29',128.5,2.7),(1,8,'2016-01-13 16:59:33','04:16:32',10.7,0),(1,10,'2016-01-13 14:43:40','06:32:26',366.9,4.3),(1,12,'2016-01-13 14:43:45','06:32:21',184,0.1),(1,15,'2016-01-13 21:03:00','00:13:06',101.9,0.7),(1,1,'2016-01-14 11:06:21','00:33:32',48.6,0.8),(1,3,'2016-01-14 10:51:19','00:48:34',121.2,4),(1,8,'2016-01-14 11:18:50','00:02:31',17.4,0.3),(1,10,'2016-01-14 11:03:10','00:36:43',302.8,3.4),(1,12,'2016-01-14 10:50:24','00:29:12',203.2,0.4),(1,12,'2016-01-14 11:20:15','00:19:38',170.7,0.8),(1,8,'2016-01-14 11:22:05','00:17:48',15.8,0.2),(2,1,'2016-01-14 11:06:21','10:49:43',116.6,1.1),(2,3,'2016-01-14 10:51:19','11:04:45',121.2,3.3),(2,8,'2016-01-14 11:22:06','00:17:42',15.8,0.2),(2,10,'2016-01-14 11:03:10','10:52:54',292.6,3.3),(2,12,'2016-01-14 11:20:15','10:35:49',160.8,0.1),(4,1,'2016-01-14 11:06:22','06:42:45',72.9,0.7),(4,3,'2016-01-14 10:51:20','06:57:47',109.3,3.7),(4,8,'2016-01-14 16:04:39','01:44:28',18.2,0),(4,10,'2016-01-14 11:03:11','06:45:56',261.3,3.8),(4,12,'2016-01-14 11:20:16','06:28:51',208.8,0.2),(1,1,'2016-01-16 17:04:57','04:00:41',57.5,0.3),(1,3,'2016-01-16 12:06:23','08:59:15',143.7,2.6),(1,8,'2016-01-16 17:04:58','04:00:40',50.6,0),(1,10,'2016-01-16 12:04:39','09:00:59',321.6,4),(1,12,'2016-01-16 12:00:47','09:04:51',142,0),(1,2,'2016-01-16 18:44:39','02:20:59',570.3,4.4),(2,1,'2016-01-16 17:04:58','04:10:12',61,0.3),(2,2,'2016-01-16 18:44:40','02:30:30',586.5,4.6),(2,3,'2016-01-16 12:06:24','09:08:46',144.1,2.6),(2,8,'2016-01-16 17:04:59','04:10:11',50.6,0),(2,10,'2016-01-16 12:04:40','09:10:30',323.1,3.9),(2,12,'2016-01-16 12:00:48','09:14:22',141.4,0),(4,1,'2016-01-16 17:04:57','04:16:54',60.8,0.3),(4,2,'2016-01-16 18:44:39','02:37:12',558.6,4.7),(4,3,'2016-01-16 12:06:23','09:15:28',139.5,2.6),(4,8,'2016-01-16 17:04:58','04:16:53',50.6,0),(4,10,'2016-01-16 12:04:39','09:17:12',295.5,3.9),(4,12,'2016-01-16 12:00:47','09:21:04',139.2,0),(2,1,'2016-01-18 11:46:41','10:26:42',65.8,0.7),(2,2,'2016-01-18 22:09:48','00:03:35',514.1,27.9),(2,8,'2016-01-18 22:07:18','00:06:05',15.4,0.1),(2,10,'2016-01-18 21:13:13','01:00:10',316.8,4.4),(2,12,'2016-01-18 17:28:13','04:45:10',152,0.1),(4,1,'2016-01-19 00:05:59','00:46:05',60.3,2);
/*!40000 ALTER TABLE `Processes_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `Processes_report`
--

DROP TABLE IF EXISTS `Processes_report`;
/*!50001 DROP VIEW IF EXISTS `Processes_report`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `Processes_report` AS SELECT 
 1 AS `userName(Processes_log.user_id)`,
 1 AS `procCommand(Processes_log.process_id)`,
 1 AS `time`,
 1 AS `elapsed_time`,
 1 AS `started_at`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `Users`
--

DROP TABLE IF EXISTS `Users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Users` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(30) DEFAULT NULL,
  `password_hash` varchar(100) DEFAULT NULL,
  `description` varchar(30) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Users`
--

LOCK TABLES `Users` WRITE;
/*!40000 ALTER TABLE `Users` DISABLE KEYS */;
INSERT INTO `Users` VALUES (1,'Adam','$2a$10$ZDhpDbmORjYAaV5.3g/EpewgSL0qF7P4573LUwa.is3DQaXtVQG1i','developer'),(2,'Bartek','$2a$10$lQG0xCuDEqIR6.Rz48TohOUKxQR169bBzwu8HzHTTxbosHgKRGuna','graphic designer'),(4,'Danuta','$2a$10$T350JhGyFuKEHasdXNULUeBPk.2KSraN9PGbjQj24iYdAWJejkGpi','accountant, solitare addicted');
/*!40000 ALTER TABLE `Users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Websites_log`
--

DROP TABLE IF EXISTS `Websites_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Websites_log` (
  `user_id` int(11) NOT NULL,
  `domain_id` int(11) NOT NULL,
  `url` text NOT NULL,
  `time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  KEY `user_id` (`user_id`),
  KEY `domain_id` (`domain_id`),
  CONSTRAINT `Websites_log_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `Users` (`id`),
  CONSTRAINT `Websites_log_ibfk_2` FOREIGN KEY (`domain_id`) REFERENCES `Domains` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Websites_log`
--

LOCK TABLES `Websites_log` WRITE;
/*!40000 ALTER TABLE `Websites_log` DISABLE KEYS */;
INSERT INTO `Websites_log` VALUES (4,1,'https://www.facebook.com/','2016-01-18 23:30:37'),(4,1,'https://www.facebook.com/places/Things-to-do-in-Santiago-Chile/112371848779363/','2016-01-18 23:34:17'),(4,1,'https://www.facebook.com/places/Things-to-do-in-Santiago-Chile/112371848779363/','2016-01-18 23:34:17'),(4,1,'https://www.facebook.com/policies/?ref=pf','2016-01-18 23:34:40'),(4,1,'https://www.facebook.com/promotions_guidelines.php','2016-01-18 23:35:02'),(4,1,'https://www.facebook.com/page_guidelines.php#promotionsguidelines','2016-01-18 23:35:02'),(4,1,'https://www.facebook.com/places/Things-to-do-in-Santiago-Chile/112371848779363/','2016-01-18 23:34:17'),(4,1,'https://www.facebook.com/policies/?ref=pf','2016-01-18 23:34:40'),(4,1,'https://www.facebook.com/promotions_guidelines.php','2016-01-18 23:35:02'),(4,1,'https://www.facebook.com/page_guidelines.php#promotionsguidelines','2016-01-18 23:35:02'),(4,1,'https://www.facebook.com/campaign/landing.php?placement=pflo&campaign_id=402047449186&extra_1=auto','2016-01-18 23:35:09'),(4,1,'https://www.facebook.com/places/Things-to-do-in-Santiago-Chile/112371848779363/','2016-01-18 23:34:17'),(4,1,'https://www.facebook.com/policies/?ref=pf','2016-01-18 23:34:40'),(4,1,'https://www.facebook.com/promotions_guidelines.php','2016-01-18 23:35:02'),(4,1,'https://www.facebook.com/page_guidelines.php#promotionsguidelines','2016-01-18 23:35:02'),(4,1,'https://www.facebook.com/campaign/landing.php?placement=pflo&campaign_id=402047449186&extra_1=auto','2016-01-18 23:35:09'),(4,1,'https://www.facebook.com/r.php','2016-01-18 23:35:37'),(4,1,'https://www.facebook.com/places/Things-to-do-in-Santiago-Chile/112371848779363/','2016-01-18 23:34:17'),(4,1,'https://www.facebook.com/policies/?ref=pf','2016-01-18 23:34:40'),(4,1,'https://www.facebook.com/promotions_guidelines.php','2016-01-18 23:35:02'),(4,1,'https://www.facebook.com/page_guidelines.php#promotionsguidelines','2016-01-18 23:35:02'),(4,1,'https://www.facebook.com/campaign/landing.php?placement=pflo&campaign_id=402047449186&extra_1=auto','2016-01-18 23:35:09'),(4,1,'https://www.facebook.com/r.php','2016-01-18 23:35:37'),(4,1,'https://www.facebook.com/places/Things-to-do-in-Santiago-Chile/112371848779363/','2016-01-18 23:34:17'),(4,1,'https://www.facebook.com/policies/?ref=pf','2016-01-18 23:34:40'),(4,1,'https://www.facebook.com/promotions_guidelines.php','2016-01-18 23:35:02'),(4,1,'https://www.facebook.com/page_guidelines.php#promotionsguidelines','2016-01-18 23:35:02'),(4,1,'https://www.facebook.com/campaign/landing.php?placement=pflo&campaign_id=402047449186&extra_1=auto','2016-01-18 23:35:09'),(4,1,'https://www.facebook.com/r.php','2016-01-18 23:35:37'),(4,1,'https://www.facebook.com/places/Things-to-do-in-Santiago-Chile/112371848779363/','2016-01-18 23:34:17'),(4,1,'https://www.facebook.com/policies/?ref=pf','2016-01-18 23:34:40'),(4,1,'https://www.facebook.com/promotions_guidelines.php','2016-01-18 23:35:02'),(4,1,'https://www.facebook.com/page_guidelines.php#promotionsguidelines','2016-01-18 23:35:02'),(4,1,'https://www.facebook.com/campaign/landing.php?placement=pflo&campaign_id=402047449186&extra_1=auto','2016-01-18 23:35:09'),(4,1,'https://www.facebook.com/r.php','2016-01-18 23:35:37'),(4,1,'https://www.facebook.com/places/Things-to-do-in-Santiago-Chile/112371848779363/','2016-01-18 23:34:17'),(4,1,'https://www.facebook.com/policies/?ref=pf','2016-01-18 23:34:40'),(4,1,'https://www.facebook.com/promotions_guidelines.php','2016-01-18 23:35:02'),(4,1,'https://www.facebook.com/page_guidelines.php#promotionsguidelines','2016-01-18 23:35:02'),(4,1,'https://www.facebook.com/campaign/landing.php?placement=pflo&campaign_id=402047449186&extra_1=auto','2016-01-18 23:35:09'),(4,1,'https://www.facebook.com/r.php','2016-01-18 23:35:37'),(4,1,'https://www.facebook.com/places/Things-to-do-in-Santiago-Chile/112371848779363/','2016-01-18 23:34:17'),(4,1,'https://www.facebook.com/policies/?ref=pf','2016-01-18 23:34:40'),(4,1,'https://www.facebook.com/promotions_guidelines.php','2016-01-18 23:35:02'),(4,1,'https://www.facebook.com/page_guidelines.php#promotionsguidelines','2016-01-18 23:35:02'),(4,1,'https://www.facebook.com/campaign/landing.php?placement=pflo&campaign_id=402047449186&extra_1=auto','2016-01-18 23:35:09'),(4,1,'https://www.facebook.com/r.php','2016-01-18 23:35:37'),(4,1,'https://www.facebook.com/places/Things-to-do-in-Santiago-Chile/112371848779363/','2016-01-18 23:34:17'),(4,1,'https://www.facebook.com/policies/?ref=pf','2016-01-18 23:34:40'),(4,1,'https://www.facebook.com/promotions_guidelines.php','2016-01-18 23:35:02'),(4,1,'https://www.facebook.com/page_guidelines.php#promotionsguidelines','2016-01-18 23:35:02'),(4,1,'https://www.facebook.com/campaign/landing.php?placement=pflo&campaign_id=402047449186&extra_1=auto','2016-01-18 23:35:09'),(4,1,'https://www.facebook.com/r.php','2016-01-18 23:35:37'),(4,1,'https://www.facebook.com/places/Things-to-do-in-Santiago-Chile/112371848779363/','2016-01-18 23:34:17'),(4,1,'https://www.facebook.com/policies/?ref=pf','2016-01-18 23:34:40'),(4,1,'https://www.facebook.com/promotions_guidelines.php','2016-01-18 23:35:02'),(4,1,'https://www.facebook.com/page_guidelines.php#promotionsguidelines','2016-01-18 23:35:02'),(4,1,'https://www.facebook.com/campaign/landing.php?placement=pflo&campaign_id=402047449186&extra_1=auto','2016-01-18 23:35:09'),(4,1,'https://www.facebook.com/r.php','2016-01-18 23:35:37'),(4,1,'https://www.facebook.com/places/Things-to-do-in-Santiago-Chile/112371848779363/','2016-01-18 23:34:17'),(4,1,'https://www.facebook.com/policies/?ref=pf','2016-01-18 23:34:40'),(4,1,'https://www.facebook.com/promotions_guidelines.php','2016-01-18 23:35:02'),(4,1,'https://www.facebook.com/page_guidelines.php#promotionsguidelines','2016-01-18 23:35:02'),(4,1,'https://www.facebook.com/campaign/landing.php?placement=pflo&campaign_id=402047449186&extra_1=auto','2016-01-18 23:35:09'),(4,1,'https://www.facebook.com/r.php','2016-01-18 23:35:37'),(4,1,'https://www.facebook.com/places/Things-to-do-in-Santiago-Chile/112371848779363/','2016-01-18 23:34:17'),(4,1,'https://www.facebook.com/policies/?ref=pf','2016-01-18 23:34:40'),(4,1,'https://www.facebook.com/promotions_guidelines.php','2016-01-18 23:35:02'),(4,1,'https://www.facebook.com/page_guidelines.php#promotionsguidelines','2016-01-18 23:35:02'),(4,1,'https://www.facebook.com/campaign/landing.php?placement=pflo&campaign_id=402047449186&extra_1=auto','2016-01-18 23:35:09'),(4,1,'https://www.facebook.com/r.php','2016-01-18 23:35:37'),(4,1,'https://www.facebook.com/places/Things-to-do-in-Santiago-Chile/112371848779363/','2016-01-18 23:34:17'),(4,1,'https://www.facebook.com/policies/?ref=pf','2016-01-18 23:34:40'),(4,1,'https://www.facebook.com/promotions_guidelines.php','2016-01-18 23:35:02'),(4,1,'https://www.facebook.com/page_guidelines.php#promotionsguidelines','2016-01-18 23:35:02'),(4,1,'https://www.facebook.com/campaign/landing.php?placement=pflo&campaign_id=402047449186&extra_1=auto','2016-01-18 23:35:09'),(4,1,'https://www.facebook.com/r.php','2016-01-18 23:35:37'),(4,1,'https://www.facebook.com/places/Things-to-do-in-Santiago-Chile/112371848779363/','2016-01-18 23:34:17'),(4,1,'https://www.facebook.com/policies/?ref=pf','2016-01-18 23:34:40'),(4,1,'https://www.facebook.com/promotions_guidelines.php','2016-01-18 23:35:02'),(4,1,'https://www.facebook.com/page_guidelines.php#promotionsguidelines','2016-01-18 23:35:02'),(4,1,'https://www.facebook.com/campaign/landing.php?placement=pflo&campaign_id=402047449186&extra_1=auto','2016-01-18 23:35:09'),(4,1,'https://www.facebook.com/r.php','2016-01-18 23:35:37'),(4,1,'https://www.facebook.com/places/Things-to-do-in-Santiago-Chile/112371848779363/','2016-01-18 23:34:17'),(4,1,'https://www.facebook.com/policies/?ref=pf','2016-01-18 23:34:40'),(4,1,'https://www.facebook.com/promotions_guidelines.php','2016-01-18 23:35:02'),(4,1,'https://www.facebook.com/page_guidelines.php#promotionsguidelines','2016-01-18 23:35:02'),(4,1,'https://www.facebook.com/campaign/landing.php?placement=pflo&campaign_id=402047449186&extra_1=auto','2016-01-18 23:35:09'),(4,1,'https://www.facebook.com/r.php','2016-01-18 23:35:37'),(4,1,'https://www.facebook.com/places/Things-to-do-in-Santiago-Chile/112371848779363/','2016-01-18 23:34:17'),(4,1,'https://www.facebook.com/policies/?ref=pf','2016-01-18 23:34:40'),(4,1,'https://www.facebook.com/promotions_guidelines.php','2016-01-18 23:35:02'),(4,1,'https://www.facebook.com/page_guidelines.php#promotionsguidelines','2016-01-18 23:35:02'),(4,1,'https://www.facebook.com/campaign/landing.php?placement=pflo&campaign_id=402047449186&extra_1=auto','2016-01-18 23:35:09'),(4,1,'https://www.facebook.com/r.php','2016-01-18 23:35:37'),(4,1,'https://www.facebook.com/places/Things-to-do-in-Santiago-Chile/112371848779363/','2016-01-18 23:34:17'),(4,1,'https://www.facebook.com/policies/?ref=pf','2016-01-18 23:34:40'),(4,1,'https://www.facebook.com/promotions_guidelines.php','2016-01-18 23:35:02'),(4,1,'https://www.facebook.com/page_guidelines.php#promotionsguidelines','2016-01-18 23:35:02'),(4,1,'https://www.facebook.com/campaign/landing.php?placement=pflo&campaign_id=402047449186&extra_1=auto','2016-01-18 23:35:09'),(4,1,'https://www.facebook.com/r.php','2016-01-18 23:35:37'),(4,1,'https://www.facebook.com/places/Things-to-do-in-Santiago-Chile/112371848779363/','2016-01-18 23:34:17'),(4,1,'https://www.facebook.com/policies/?ref=pf','2016-01-18 23:34:40'),(4,1,'https://www.facebook.com/promotions_guidelines.php','2016-01-18 23:35:02'),(4,1,'https://www.facebook.com/page_guidelines.php#promotionsguidelines','2016-01-18 23:35:02'),(4,1,'https://www.facebook.com/campaign/landing.php?placement=pflo&campaign_id=402047449186&extra_1=auto','2016-01-18 23:35:09'),(4,1,'https://www.facebook.com/r.php','2016-01-18 23:35:37'),(4,1,'https://www.facebook.com/places/Things-to-do-in-Santiago-Chile/112371848779363/','2016-01-18 23:34:17'),(4,1,'https://www.facebook.com/policies/?ref=pf','2016-01-18 23:34:40'),(4,1,'https://www.facebook.com/promotions_guidelines.php','2016-01-18 23:35:02'),(4,1,'https://www.facebook.com/page_guidelines.php#promotionsguidelines','2016-01-18 23:35:02'),(4,1,'https://www.facebook.com/campaign/landing.php?placement=pflo&campaign_id=402047449186&extra_1=auto','2016-01-18 23:35:09'),(4,1,'https://www.facebook.com/r.php','2016-01-18 23:35:37'),(4,1,'https://www.facebook.com/places/Things-to-do-in-Santiago-Chile/112371848779363/','2016-01-18 23:34:17'),(4,1,'https://www.facebook.com/policies/?ref=pf','2016-01-18 23:34:40'),(4,1,'https://www.facebook.com/promotions_guidelines.php','2016-01-18 23:35:02'),(4,1,'https://www.facebook.com/page_guidelines.php#promotionsguidelines','2016-01-18 23:35:02'),(4,1,'https://www.facebook.com/campaign/landing.php?placement=pflo&campaign_id=402047449186&extra_1=auto','2016-01-18 23:35:09'),(4,1,'https://www.facebook.com/r.php','2016-01-18 23:35:37'),(4,1,'https://www.facebook.com/places/Things-to-do-in-Santiago-Chile/112371848779363/','2016-01-18 23:34:17'),(4,1,'https://www.facebook.com/policies/?ref=pf','2016-01-18 23:34:40'),(4,1,'https://www.facebook.com/promotions_guidelines.php','2016-01-18 23:35:02'),(4,1,'https://www.facebook.com/page_guidelines.php#promotionsguidelines','2016-01-18 23:35:02'),(4,1,'https://www.facebook.com/campaign/landing.php?placement=pflo&campaign_id=402047449186&extra_1=auto','2016-01-18 23:35:09'),(4,1,'https://www.facebook.com/r.php','2016-01-18 23:35:37'),(4,1,'https://www.facebook.com/places/Things-to-do-in-Santiago-Chile/112371848779363/','2016-01-18 23:34:17'),(4,1,'https://www.facebook.com/policies/?ref=pf','2016-01-18 23:34:40'),(4,1,'https://www.facebook.com/promotions_guidelines.php','2016-01-18 23:35:02'),(4,1,'https://www.facebook.com/page_guidelines.php#promotionsguidelines','2016-01-18 23:35:02'),(4,1,'https://www.facebook.com/campaign/landing.php?placement=pflo&campaign_id=402047449186&extra_1=auto','2016-01-18 23:35:09'),(4,1,'https://www.facebook.com/r.php','2016-01-18 23:35:37'),(4,1,'https://www.facebook.com/places/Things-to-do-in-Santiago-Chile/112371848779363/','2016-01-18 23:34:17'),(4,1,'https://www.facebook.com/policies/?ref=pf','2016-01-18 23:34:40'),(4,1,'https://www.facebook.com/promotions_guidelines.php','2016-01-18 23:35:02'),(4,1,'https://www.facebook.com/page_guidelines.php#promotionsguidelines','2016-01-18 23:35:02'),(4,1,'https://www.facebook.com/campaign/landing.php?placement=pflo&campaign_id=402047449186&extra_1=auto','2016-01-18 23:35:09'),(4,1,'https://www.facebook.com/r.php','2016-01-18 23:35:37'),(4,1,'https://www.facebook.com/places/Things-to-do-in-Santiago-Chile/112371848779363/','2016-01-18 23:34:17'),(4,1,'https://www.facebook.com/policies/?ref=pf','2016-01-18 23:34:40'),(4,1,'https://www.facebook.com/promotions_guidelines.php','2016-01-18 23:35:02'),(4,1,'https://www.facebook.com/page_guidelines.php#promotionsguidelines','2016-01-18 23:35:02'),(4,1,'https://www.facebook.com/campaign/landing.php?placement=pflo&campaign_id=402047449186&extra_1=auto','2016-01-18 23:35:09'),(4,1,'https://www.facebook.com/r.php','2016-01-18 23:35:37'),(4,1,'https://www.facebook.com/places/Things-to-do-in-Santiago-Chile/112371848779363/','2016-01-18 23:34:17'),(4,1,'https://www.facebook.com/policies/?ref=pf','2016-01-18 23:34:40'),(4,1,'https://www.facebook.com/promotions_guidelines.php','2016-01-18 23:35:02'),(4,1,'https://www.facebook.com/page_guidelines.php#promotionsguidelines','2016-01-18 23:35:02'),(4,1,'https://www.facebook.com/campaign/landing.php?placement=pflo&campaign_id=402047449186&extra_1=auto','2016-01-18 23:35:09'),(4,1,'https://www.facebook.com/r.php','2016-01-18 23:35:37'),(4,1,'https://www.facebook.com/places/Things-to-do-in-Santiago-Chile/112371848779363/','2016-01-18 23:34:17'),(4,1,'https://www.facebook.com/policies/?ref=pf','2016-01-18 23:34:40'),(4,1,'https://www.facebook.com/promotions_guidelines.php','2016-01-18 23:35:02'),(4,1,'https://www.facebook.com/page_guidelines.php#promotionsguidelines','2016-01-18 23:35:02'),(4,1,'https://www.facebook.com/campaign/landing.php?placement=pflo&campaign_id=402047449186&extra_1=auto','2016-01-18 23:35:09'),(4,1,'https://www.facebook.com/r.php','2016-01-18 23:35:37'),(4,1,'https://www.facebook.com/places/Things-to-do-in-Santiago-Chile/112371848779363/','2016-01-18 23:34:17'),(4,1,'https://www.facebook.com/policies/?ref=pf','2016-01-18 23:34:40'),(4,1,'https://www.facebook.com/promotions_guidelines.php','2016-01-18 23:35:02'),(4,1,'https://www.facebook.com/page_guidelines.php#promotionsguidelines','2016-01-18 23:35:02'),(4,1,'https://www.facebook.com/campaign/landing.php?placement=pflo&campaign_id=402047449186&extra_1=auto','2016-01-18 23:35:09'),(4,1,'https://www.facebook.com/r.php','2016-01-18 23:35:37'),(4,1,'https://www.facebook.com/places/Things-to-do-in-Santiago-Chile/112371848779363/','2016-01-18 23:34:17'),(4,1,'https://www.facebook.com/policies/?ref=pf','2016-01-18 23:34:40'),(4,1,'https://www.facebook.com/promotions_guidelines.php','2016-01-18 23:35:02'),(4,1,'https://www.facebook.com/page_guidelines.php#promotionsguidelines','2016-01-18 23:35:02'),(4,1,'https://www.facebook.com/campaign/landing.php?placement=pflo&campaign_id=402047449186&extra_1=auto','2016-01-18 23:35:09'),(4,1,'https://www.facebook.com/r.php','2016-01-18 23:35:37'),(4,1,'https://www.facebook.com/pages/feed','2016-01-18 23:48:32'),(4,1,'https://www.facebook.com/login.php?next=https%3A%2F%2Fwww.facebook.com%2Fpages%2Ffeed','2016-01-18 23:48:32'),(4,1,'https://www.facebook.com/places/Things-to-do-in-Santiago-Chile/112371848779363/','2016-01-18 23:34:17'),(4,1,'https://www.facebook.com/policies/?ref=pf','2016-01-18 23:34:40'),(4,1,'https://www.facebook.com/promotions_guidelines.php','2016-01-18 23:35:02'),(4,1,'https://www.facebook.com/page_guidelines.php#promotionsguidelines','2016-01-18 23:35:02'),(4,1,'https://www.facebook.com/campaign/landing.php?placement=pflo&campaign_id=402047449186&extra_1=auto','2016-01-18 23:35:09'),(4,1,'https://www.facebook.com/r.php','2016-01-18 23:35:37'),(4,1,'https://www.facebook.com/pages/feed','2016-01-18 23:48:32'),(4,1,'https://www.facebook.com/login.php?next=https%3A%2F%2Fwww.facebook.com%2Fpages%2Ffeed','2016-01-18 23:48:32'),(4,3,'https://stackoverflow.com/','2016-01-18 23:49:00'),(4,1,'https://www.facebook.com/places/Things-to-do-in-Santiago-Chile/112371848779363/','2016-01-18 23:34:17'),(4,1,'https://www.facebook.com/policies/?ref=pf','2016-01-18 23:34:40'),(4,1,'https://www.facebook.com/promotions_guidelines.php','2016-01-18 23:35:02'),(4,1,'https://www.facebook.com/page_guidelines.php#promotionsguidelines','2016-01-18 23:35:02'),(4,1,'https://www.facebook.com/campaign/landing.php?placement=pflo&campaign_id=402047449186&extra_1=auto','2016-01-18 23:35:09'),(4,1,'https://www.facebook.com/r.php','2016-01-18 23:35:37'),(4,1,'https://www.facebook.com/pages/feed','2016-01-18 23:48:32'),(4,1,'https://www.facebook.com/login.php?next=https%3A%2F%2Fwww.facebook.com%2Fpages%2Ffeed','2016-01-18 23:48:32'),(4,3,'https://stackoverflow.com/','2016-01-18 23:49:00'),(4,1,'https://www.facebook.com/places/Things-to-do-in-Santiago-Chile/112371848779363/','2016-01-18 23:34:17'),(4,1,'https://www.facebook.com/policies/?ref=pf','2016-01-18 23:34:40'),(4,1,'https://www.facebook.com/promotions_guidelines.php','2016-01-18 23:35:02'),(4,1,'https://www.facebook.com/page_guidelines.php#promotionsguidelines','2016-01-18 23:35:02'),(4,1,'https://www.facebook.com/campaign/landing.php?placement=pflo&campaign_id=402047449186&extra_1=auto','2016-01-18 23:35:09'),(4,1,'https://www.facebook.com/r.php','2016-01-18 23:35:37'),(4,1,'https://www.facebook.com/pages/feed','2016-01-18 23:48:32'),(4,1,'https://www.facebook.com/login.php?next=https%3A%2F%2Fwww.facebook.com%2Fpages%2Ffeed','2016-01-18 23:48:32'),(4,3,'https://stackoverflow.com/','2016-01-18 23:49:00'),(4,1,'https://www.facebook.com/places/Things-to-do-in-Santiago-Chile/112371848779363/','2016-01-18 23:34:17'),(4,1,'https://www.facebook.com/policies/?ref=pf','2016-01-18 23:34:40'),(4,1,'https://www.facebook.com/promotions_guidelines.php','2016-01-18 23:35:02'),(4,1,'https://www.facebook.com/page_guidelines.php#promotionsguidelines','2016-01-18 23:35:02'),(4,1,'https://www.facebook.com/campaign/landing.php?placement=pflo&campaign_id=402047449186&extra_1=auto','2016-01-18 23:35:09'),(4,1,'https://www.facebook.com/r.php','2016-01-18 23:35:37'),(4,1,'https://www.facebook.com/pages/feed','2016-01-18 23:48:32'),(4,1,'https://www.facebook.com/login.php?next=https%3A%2F%2Fwww.facebook.com%2Fpages%2Ffeed','2016-01-18 23:48:32'),(4,3,'https://stackoverflow.com/','2016-01-18 23:49:00'),(4,1,'https://www.facebook.com/places/Things-to-do-in-Santiago-Chile/112371848779363/','2016-01-18 23:34:17'),(4,1,'https://www.facebook.com/policies/?ref=pf','2016-01-18 23:34:40'),(4,1,'https://www.facebook.com/promotions_guidelines.php','2016-01-18 23:35:02'),(4,1,'https://www.facebook.com/page_guidelines.php#promotionsguidelines','2016-01-18 23:35:02'),(4,1,'https://www.facebook.com/campaign/landing.php?placement=pflo&campaign_id=402047449186&extra_1=auto','2016-01-18 23:35:09'),(4,1,'https://www.facebook.com/r.php','2016-01-18 23:35:37'),(4,1,'https://www.facebook.com/pages/feed','2016-01-18 23:48:32'),(4,1,'https://www.facebook.com/login.php?next=https%3A%2F%2Fwww.facebook.com%2Fpages%2Ffeed','2016-01-18 23:48:32'),(4,3,'https://stackoverflow.com/','2016-01-18 23:49:00'),(4,1,'https://www.facebook.com/places/Things-to-do-in-Santiago-Chile/112371848779363/','2016-01-18 23:34:17'),(4,1,'https://www.facebook.com/policies/?ref=pf','2016-01-18 23:34:40'),(4,1,'https://www.facebook.com/promotions_guidelines.php','2016-01-18 23:35:02'),(4,1,'https://www.facebook.com/page_guidelines.php#promotionsguidelines','2016-01-18 23:35:02'),(4,1,'https://www.facebook.com/campaign/landing.php?placement=pflo&campaign_id=402047449186&extra_1=auto','2016-01-18 23:35:09'),(4,1,'https://www.facebook.com/r.php','2016-01-18 23:35:37'),(4,1,'https://www.facebook.com/pages/feed','2016-01-18 23:48:32'),(4,1,'https://www.facebook.com/login.php?next=https%3A%2F%2Fwww.facebook.com%2Fpages%2Ffeed','2016-01-18 23:48:32'),(4,3,'https://stackoverflow.com/','2016-01-18 23:49:00'),(4,1,'https://www.facebook.com/places/Things-to-do-in-Santiago-Chile/112371848779363/','2016-01-18 23:34:17'),(4,1,'https://www.facebook.com/policies/?ref=pf','2016-01-18 23:34:40'),(4,1,'https://www.facebook.com/promotions_guidelines.php','2016-01-18 23:35:02'),(4,1,'https://www.facebook.com/page_guidelines.php#promotionsguidelines','2016-01-18 23:35:02'),(4,1,'https://www.facebook.com/campaign/landing.php?placement=pflo&campaign_id=402047449186&extra_1=auto','2016-01-18 23:35:09'),(4,1,'https://www.facebook.com/r.php','2016-01-18 23:35:37'),(4,1,'https://www.facebook.com/pages/feed','2016-01-18 23:48:32'),(4,1,'https://www.facebook.com/login.php?next=https%3A%2F%2Fwww.facebook.com%2Fpages%2Ffeed','2016-01-18 23:48:32'),(4,3,'https://stackoverflow.com/','2016-01-18 23:49:00'),(4,1,'https://www.facebook.com/places/Things-to-do-in-Santiago-Chile/112371848779363/','2016-01-18 23:34:17'),(4,1,'https://www.facebook.com/policies/?ref=pf','2016-01-18 23:34:40'),(4,1,'https://www.facebook.com/promotions_guidelines.php','2016-01-18 23:35:02'),(4,1,'https://www.facebook.com/page_guidelines.php#promotionsguidelines','2016-01-18 23:35:02'),(4,1,'https://www.facebook.com/campaign/landing.php?placement=pflo&campaign_id=402047449186&extra_1=auto','2016-01-18 23:35:09'),(4,1,'https://www.facebook.com/r.php','2016-01-18 23:35:37'),(4,1,'https://www.facebook.com/pages/feed','2016-01-18 23:48:32'),(4,1,'https://www.facebook.com/login.php?next=https%3A%2F%2Fwww.facebook.com%2Fpages%2Ffeed','2016-01-18 23:48:32'),(4,3,'https://stackoverflow.com/','2016-01-18 23:49:00'),(4,1,'https://www.facebook.com/places/Things-to-do-in-Santiago-Chile/112371848779363/','2016-01-18 23:34:17'),(4,1,'https://www.facebook.com/policies/?ref=pf','2016-01-18 23:34:40'),(4,1,'https://www.facebook.com/promotions_guidelines.php','2016-01-18 23:35:02'),(4,1,'https://www.facebook.com/page_guidelines.php#promotionsguidelines','2016-01-18 23:35:02'),(4,1,'https://www.facebook.com/campaign/landing.php?placement=pflo&campaign_id=402047449186&extra_1=auto','2016-01-18 23:35:09'),(4,1,'https://www.facebook.com/r.php','2016-01-18 23:35:37'),(4,1,'https://www.facebook.com/pages/feed','2016-01-18 23:48:32'),(4,1,'https://www.facebook.com/login.php?next=https%3A%2F%2Fwww.facebook.com%2Fpages%2Ffeed','2016-01-18 23:48:32'),(4,3,'https://stackoverflow.com/','2016-01-18 23:49:00'),(4,1,'https://www.facebook.com/places/Things-to-do-in-Santiago-Chile/112371848779363/','2016-01-18 23:34:17'),(4,1,'https://www.facebook.com/policies/?ref=pf','2016-01-18 23:34:40'),(4,1,'https://www.facebook.com/promotions_guidelines.php','2016-01-18 23:35:02'),(4,1,'https://www.facebook.com/page_guidelines.php#promotionsguidelines','2016-01-18 23:35:02'),(4,1,'https://www.facebook.com/campaign/landing.php?placement=pflo&campaign_id=402047449186&extra_1=auto','2016-01-18 23:35:09'),(4,1,'https://www.facebook.com/r.php','2016-01-18 23:35:37'),(4,1,'https://www.facebook.com/pages/feed','2016-01-18 23:48:32'),(4,1,'https://www.facebook.com/login.php?next=https%3A%2F%2Fwww.facebook.com%2Fpages%2Ffeed','2016-01-18 23:48:32'),(4,3,'https://stackoverflow.com/','2016-01-18 23:49:00'),(4,1,'https://www.facebook.com/places/Things-to-do-in-Santiago-Chile/112371848779363/','2016-01-18 23:34:17'),(4,1,'https://www.facebook.com/policies/?ref=pf','2016-01-18 23:34:40'),(4,1,'https://www.facebook.com/promotions_guidelines.php','2016-01-18 23:35:02'),(4,1,'https://www.facebook.com/page_guidelines.php#promotionsguidelines','2016-01-18 23:35:02'),(4,1,'https://www.facebook.com/campaign/landing.php?placement=pflo&campaign_id=402047449186&extra_1=auto','2016-01-18 23:35:09'),(4,1,'https://www.facebook.com/r.php','2016-01-18 23:35:37'),(4,1,'https://www.facebook.com/pages/feed','2016-01-18 23:48:32'),(4,1,'https://www.facebook.com/login.php?next=https%3A%2F%2Fwww.facebook.com%2Fpages%2Ffeed','2016-01-18 23:48:32'),(4,3,'https://stackoverflow.com/','2016-01-18 23:49:00'),(4,1,'https://www.facebook.com/places/Things-to-do-in-Santiago-Chile/112371848779363/','2016-01-18 23:34:17'),(4,1,'https://www.facebook.com/policies/?ref=pf','2016-01-18 23:34:40'),(4,1,'https://www.facebook.com/promotions_guidelines.php','2016-01-18 23:35:02'),(4,1,'https://www.facebook.com/page_guidelines.php#promotionsguidelines','2016-01-18 23:35:02'),(4,1,'https://www.facebook.com/campaign/landing.php?placement=pflo&campaign_id=402047449186&extra_1=auto','2016-01-18 23:35:09'),(4,1,'https://www.facebook.com/r.php','2016-01-18 23:35:37'),(4,1,'https://www.facebook.com/pages/feed','2016-01-18 23:48:32'),(4,1,'https://www.facebook.com/login.php?next=https%3A%2F%2Fwww.facebook.com%2Fpages%2Ffeed','2016-01-18 23:48:32'),(4,3,'https://stackoverflow.com/','2016-01-18 23:49:00'),(4,1,'https://www.facebook.com/places/Things-to-do-in-Santiago-Chile/112371848779363/','2016-01-18 23:34:17'),(4,1,'https://www.facebook.com/policies/?ref=pf','2016-01-18 23:34:40'),(4,1,'https://www.facebook.com/promotions_guidelines.php','2016-01-18 23:35:02'),(4,1,'https://www.facebook.com/page_guidelines.php#promotionsguidelines','2016-01-18 23:35:02'),(4,1,'https://www.facebook.com/campaign/landing.php?placement=pflo&campaign_id=402047449186&extra_1=auto','2016-01-18 23:35:09'),(4,1,'https://www.facebook.com/r.php','2016-01-18 23:35:37'),(4,1,'https://www.facebook.com/pages/feed','2016-01-18 23:48:32'),(4,1,'https://www.facebook.com/login.php?next=https%3A%2F%2Fwww.facebook.com%2Fpages%2Ffeed','2016-01-18 23:48:32'),(4,3,'https://stackoverflow.com/','2016-01-18 23:49:00'),(4,1,'https://www.facebook.com/places/Things-to-do-in-Santiago-Chile/112371848779363/','2016-01-18 23:34:17'),(4,1,'https://www.facebook.com/policies/?ref=pf','2016-01-18 23:34:40'),(4,1,'https://www.facebook.com/promotions_guidelines.php','2016-01-18 23:35:02'),(4,1,'https://www.facebook.com/page_guidelines.php#promotionsguidelines','2016-01-18 23:35:02'),(4,1,'https://www.facebook.com/campaign/landing.php?placement=pflo&campaign_id=402047449186&extra_1=auto','2016-01-18 23:35:09'),(4,1,'https://www.facebook.com/r.php','2016-01-18 23:35:37'),(4,1,'https://www.facebook.com/pages/feed','2016-01-18 23:48:32'),(4,1,'https://www.facebook.com/login.php?next=https%3A%2F%2Fwww.facebook.com%2Fpages%2Ffeed','2016-01-18 23:48:32'),(4,3,'https://stackoverflow.com/','2016-01-18 23:49:00'),(4,1,'https://www.facebook.com/places/Things-to-do-in-Santiago-Chile/112371848779363/','2016-01-18 23:34:17'),(4,1,'https://www.facebook.com/policies/?ref=pf','2016-01-18 23:34:40'),(4,1,'https://www.facebook.com/promotions_guidelines.php','2016-01-18 23:35:02'),(4,1,'https://www.facebook.com/page_guidelines.php#promotionsguidelines','2016-01-18 23:35:02'),(4,1,'https://www.facebook.com/campaign/landing.php?placement=pflo&campaign_id=402047449186&extra_1=auto','2016-01-18 23:35:09'),(4,1,'https://www.facebook.com/r.php','2016-01-18 23:35:37'),(4,1,'https://www.facebook.com/pages/feed','2016-01-18 23:48:32'),(4,1,'https://www.facebook.com/login.php?next=https%3A%2F%2Fwww.facebook.com%2Fpages%2Ffeed','2016-01-18 23:48:32'),(4,3,'https://stackoverflow.com/','2016-01-18 23:49:00'),(4,1,'https://www.facebook.com/places/Things-to-do-in-Santiago-Chile/112371848779363/','2016-01-18 23:34:17'),(4,1,'https://www.facebook.com/policies/?ref=pf','2016-01-18 23:34:40'),(4,1,'https://www.facebook.com/promotions_guidelines.php','2016-01-18 23:35:02'),(4,1,'https://www.facebook.com/page_guidelines.php#promotionsguidelines','2016-01-18 23:35:02'),(4,1,'https://www.facebook.com/campaign/landing.php?placement=pflo&campaign_id=402047449186&extra_1=auto','2016-01-18 23:35:09'),(4,1,'https://www.facebook.com/r.php','2016-01-18 23:35:37'),(4,1,'https://www.facebook.com/pages/feed','2016-01-18 23:48:32'),(4,1,'https://www.facebook.com/login.php?next=https%3A%2F%2Fwww.facebook.com%2Fpages%2Ffeed','2016-01-18 23:48:32'),(4,3,'https://stackoverflow.com/','2016-01-18 23:49:00'),(4,1,'https://www.facebook.com/places/Things-to-do-in-Santiago-Chile/112371848779363/','2016-01-18 23:34:17'),(4,1,'https://www.facebook.com/policies/?ref=pf','2016-01-18 23:34:40'),(4,1,'https://www.facebook.com/promotions_guidelines.php','2016-01-18 23:35:02'),(4,1,'https://www.facebook.com/page_guidelines.php#promotionsguidelines','2016-01-18 23:35:02'),(4,1,'https://www.facebook.com/campaign/landing.php?placement=pflo&campaign_id=402047449186&extra_1=auto','2016-01-18 23:35:09'),(4,1,'https://www.facebook.com/r.php','2016-01-18 23:35:37'),(4,1,'https://www.facebook.com/pages/feed','2016-01-18 23:48:32'),(4,1,'https://www.facebook.com/login.php?next=https%3A%2F%2Fwww.facebook.com%2Fpages%2Ffeed','2016-01-18 23:48:32'),(4,3,'https://stackoverflow.com/','2016-01-18 23:49:00'),(4,1,'https://www.facebook.com/places/Things-to-do-in-Santiago-Chile/112371848779363/','2016-01-18 23:34:17'),(4,1,'https://www.facebook.com/policies/?ref=pf','2016-01-18 23:34:40'),(4,1,'https://www.facebook.com/promotions_guidelines.php','2016-01-18 23:35:02'),(4,1,'https://www.facebook.com/page_guidelines.php#promotionsguidelines','2016-01-18 23:35:02'),(4,1,'https://www.facebook.com/campaign/landing.php?placement=pflo&campaign_id=402047449186&extra_1=auto','2016-01-18 23:35:09'),(4,1,'https://www.facebook.com/r.php','2016-01-18 23:35:37'),(4,1,'https://www.facebook.com/pages/feed','2016-01-18 23:48:32'),(4,1,'https://www.facebook.com/login.php?next=https%3A%2F%2Fwww.facebook.com%2Fpages%2Ffeed','2016-01-18 23:48:32'),(4,3,'https://stackoverflow.com/','2016-01-18 23:49:00'),(4,1,'https://www.facebook.com/places/Things-to-do-in-Santiago-Chile/112371848779363/','2016-01-18 23:34:17'),(4,1,'https://www.facebook.com/policies/?ref=pf','2016-01-18 23:34:40'),(4,1,'https://www.facebook.com/promotions_guidelines.php','2016-01-18 23:35:02'),(4,1,'https://www.facebook.com/page_guidelines.php#promotionsguidelines','2016-01-18 23:35:02'),(4,1,'https://www.facebook.com/campaign/landing.php?placement=pflo&campaign_id=402047449186&extra_1=auto','2016-01-18 23:35:09'),(4,1,'https://www.facebook.com/r.php','2016-01-18 23:35:37'),(4,1,'https://www.facebook.com/pages/feed','2016-01-18 23:48:32'),(4,1,'https://www.facebook.com/login.php?next=https%3A%2F%2Fwww.facebook.com%2Fpages%2Ffeed','2016-01-18 23:48:32'),(4,3,'https://stackoverflow.com/','2016-01-18 23:49:00'),(4,1,'https://www.facebook.com/places/Things-to-do-in-Santiago-Chile/112371848779363/','2016-01-18 23:34:17'),(4,1,'https://www.facebook.com/policies/?ref=pf','2016-01-18 23:34:40'),(4,1,'https://www.facebook.com/promotions_guidelines.php','2016-01-18 23:35:02'),(4,1,'https://www.facebook.com/page_guidelines.php#promotionsguidelines','2016-01-18 23:35:02'),(4,1,'https://www.facebook.com/campaign/landing.php?placement=pflo&campaign_id=402047449186&extra_1=auto','2016-01-18 23:35:09'),(4,1,'https://www.facebook.com/r.php','2016-01-18 23:35:37'),(4,1,'https://www.facebook.com/pages/feed','2016-01-18 23:48:32'),(4,1,'https://www.facebook.com/login.php?next=https%3A%2F%2Fwww.facebook.com%2Fpages%2Ffeed','2016-01-18 23:48:32'),(4,3,'https://stackoverflow.com/','2016-01-18 23:49:00');
/*!40000 ALTER TABLE `Websites_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `Websites_report`
--

DROP TABLE IF EXISTS `Websites_report`;
/*!50001 DROP VIEW IF EXISTS `Websites_report`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `Websites_report` AS SELECT 
 1 AS `userName(user_id)`,
 1 AS `getDomain(domain_id)`,
 1 AS `COUNT(time)`*/;
SET character_set_client = @saved_cs_client;

--
-- Final view structure for view `Processes_report`
--

/*!50001 DROP VIEW IF EXISTS `Processes_report`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = latin1 */;
/*!50001 SET character_set_results     = latin1 */;
/*!50001 SET collation_connection      = latin1_swedish_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`spy`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `Processes_report` AS select `userName`(`Processes_log`.`user_id`) AS `userName(Processes_log.user_id)`,`procCommand`(`Processes_log`.`process_id`) AS `procCommand(Processes_log.process_id)`,`Preferred_processes`.`time` AS `time`,`Processes_log`.`elapsed_time` AS `elapsed_time`,`Processes_log`.`started_at` AS `started_at` from (`Processes_log` join `Preferred_processes` on(((`Processes_log`.`user_id` = `Preferred_processes`.`user_id`) and (`Processes_log`.`process_id` = `Preferred_processes`.`process_id`)))) order by `Processes_log`.`started_at` desc */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `Websites_report`
--

/*!50001 DROP VIEW IF EXISTS `Websites_report`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = latin1 */;
/*!50001 SET character_set_results     = latin1 */;
/*!50001 SET collation_connection      = latin1_swedish_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`spy`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `Websites_report` AS select distinct `userName`(`Websites_log`.`user_id`) AS `userName(user_id)`,`getDomain`(`Websites_log`.`domain_id`) AS `getDomain(domain_id)`,count(`Websites_log`.`time`) AS `COUNT(time)` from `Websites_log` group by `Websites_log`.`user_id`,`Websites_log`.`domain_id`,cast(`Websites_log`.`time` as date) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2016-01-19  8:38:08
#   con = Mysql.new 'localhost', 'spy', 'db%SPY16'
#   con.query("USE Spy")
#   literal =  "DROP FUNCTION IF EXISTS userName; \ 
#     DELIMITER // \ 
#     CREATE FUNCTION userName (user int) \ 
#     RETURNS varchar(30) \ 
#     BEGIN  \ 
#       DECLARE result varchar(30); \ 
#       SELECT name into result FROM Users WHERE id=user; \
#       RETURN result; \
      
#     END // \
#     DELIMITER ; \


#     DROP FUNCTION IF EXISTS procCommand; \
#     DELIMITER // \
#     CREATE FUNCTION procCommand (process int) \ 
#     RETURNS varchar(30) \
#     BEGIN \
#       DECLARE result varchar(30); \
#       SELECT command into result FROM Processes WHERE id=process; \
#       RETURN result; \
      
#     END // \
#     DELIMITER ;"
# DELIMITER //
# CREATE FUNCTION getDomain (url int) 
# RETURNS varchar(30)
# BEGIN 
#   DECLARE result varchar(30);
#   SELECT domain into result FROM Domains WHERE id=url;
#   RETURN result;
  
# END //