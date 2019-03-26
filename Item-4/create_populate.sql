start transaction;

CREATE DATABASE  IF NOT EXISTS `acme-parade` /*!40100 DEFAULT CHARACTER SET latin1 */;
USE `acme-parade`;

create user 'acme-user'@'%' 
	identified by password '*4F10007AADA9EE3DBB2CC36575DFC6F4FDE27577';

create user 'acme-manager'@'%' 
	identified by password '*FDB8CD304EB2317D10C95D797A4BD7492560F55F';


grant select, insert, update, delete 
	on `acme-parade`.* to 'acme-user'@'%';

grant select, insert, update, delete, create, drop, references, index, alter, 
        create temporary tables, lock tables, create view, create routine, 
        alter routine, execute, trigger, show view
    on `acme-parade`.* to 'acme-manager'@'%';
 
-- MySQL dump 10.13  Distrib 5.5.16, for Win32 (x86)
--
-- Host: localhost    Database: acme-parade
-- ------------------------------------------------------
-- Server version	5.5.29

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
-- Table structure for table `actor_message_boxes`
--

DROP TABLE IF EXISTS `actor_message_boxes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `actor_message_boxes` (
  `actor` int(11) NOT NULL,
  `message_boxes` int(11) NOT NULL,
  UNIQUE KEY `UK_gsokk7rk6i6vd87e6dvdxfapu` (`message_boxes`),
  CONSTRAINT `FK_gsokk7rk6i6vd87e6dvdxfapu` FOREIGN KEY (`message_boxes`) REFERENCES `message_box` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `actor_message_boxes`
--

LOCK TABLES `actor_message_boxes` WRITE;
/*!40000 ALTER TABLE `actor_message_boxes` DISABLE KEYS */;
INSERT INTO `actor_message_boxes` (`actor`, `message_boxes`) VALUES (3284,3285),(3284,3286),(3284,3287),(3284,3288),(3284,3289),(3291,3292),(3291,3293),(3291,3294),(3291,3295),(3291,3296),(3297,3298),(3297,3299),(3297,3300),(3297,3301),(3297,3302),(3303,3304),(3303,3305),(3303,3306),(3303,3307),(3308,3309),(3308,3310),(3308,3311),(3308,3312),(3364,3321),(3364,3322),(3364,3323),(3364,3324),(3364,3325),(3365,3326),(3365,3327),(3365,3328),(3365,3329),(3365,3330),(3368,3331),(3368,3332),(3368,3333),(3368,3334),(3368,3335),(3369,3336),(3369,3337),(3369,3338),(3369,3339),(3369,3340);
/*!40000 ALTER TABLE `actor_message_boxes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `administrator`
--

DROP TABLE IF EXISTS `administrator`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `administrator` (
  `id` int(11) NOT NULL,
  `version` int(11) NOT NULL,
  `address` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `is_banned` bit(1) DEFAULT NULL,
  `is_spammer` bit(1) DEFAULT NULL,
  `middle_name` varchar(255) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `phone_number` varchar(255) DEFAULT NULL,
  `photo` varchar(255) DEFAULT NULL,
  `score` double DEFAULT NULL,
  `surname` varchar(255) DEFAULT NULL,
  `username` varchar(255) DEFAULT NULL,
  `user_account` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UK_7ohwsa2usmvu0yxb44je2lge` (`user_account`),
  CONSTRAINT `FK_7ohwsa2usmvu0yxb44je2lge` FOREIGN KEY (`user_account`) REFERENCES `user_account` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `administrator`
--

LOCK TABLES `administrator` WRITE;
/*!40000 ALTER TABLE `administrator` DISABLE KEYS */;
INSERT INTO `administrator` (`id`, `version`, `address`, `email`, `is_banned`, `is_spammer`, `middle_name`, `name`, `phone_number`, `photo`, `score`, `surname`, `username`, `user_account`) VALUES (3284,0,'admin1 18','admin1@gmail.com',NULL,NULL,'middlename1','admin','+34656256697',NULL,NULL,'surname1','admin',3274);
/*!40000 ALTER TABLE `administrator` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `area`
--

DROP TABLE IF EXISTS `area`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `area` (
  `id` int(11) NOT NULL,
  `version` int(11) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `chapter` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_ncskjbjgl3j1n73pdqyefsin5` (`chapter`),
  CONSTRAINT `FK_ncskjbjgl3j1n73pdqyefsin5` FOREIGN KEY (`chapter`) REFERENCES `chapter` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `area`
--

LOCK TABLES `area` WRITE;
/*!40000 ALTER TABLE `area` DISABLE KEYS */;
INSERT INTO `area` (`id`, `version`, `name`, `chapter`) VALUES (3357,0,'area1',3291),(3358,0,'area2',NULL);
/*!40000 ALTER TABLE `area` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `area_pictures`
--

DROP TABLE IF EXISTS `area_pictures`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `area_pictures` (
  `area` int(11) NOT NULL,
  `link` varchar(255) DEFAULT NULL,
  `target_id` int(11) NOT NULL,
  KEY `FK_s2y5bun5v8b608aoptnxfuelm` (`area`),
  CONSTRAINT `FK_s2y5bun5v8b608aoptnxfuelm` FOREIGN KEY (`area`) REFERENCES `area` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `area_pictures`
--

LOCK TABLES `area_pictures` WRITE;
/*!40000 ALTER TABLE `area_pictures` DISABLE KEYS */;
INSERT INTO `area_pictures` (`area`, `link`, `target_id`) VALUES (3357,'https://www.herramientasbricolaje.org/wp-content/uploads/2018/10/Taladro.jpg',0),(3357,'https://i.blogs.es/556f4e/madrid-central-restricciones-trafico/1366_2000.jpg',0),(3357,'https://i.blogs.es/b9d04b/madrid-central-restricciones-trafico/1366_2000.jpg',0),(3358,'http://pointti.info/wp-content/uploads/2018/04/fixing-door-frame-how-to-repair-a-gouge-nick-or-dent-in-a-door-or-frame-view-this-quick-video-tip-demonstrating-how-to-fix-a-gouge-or-dent-in-a-door-easily-fixing-door-frame-to-breeze-block.jpg',0),(3358,'https://cdn.pixabay.com/photo/2013/12/13/21/13/plumber-228010_960_720.jpg',0),(3358,'https://image.shutterstock.com/image-photo/closeup-male-plumber-fixing-white-450w-1005704569.jpg',0);
/*!40000 ALTER TABLE `area_pictures` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `brotherhood`
--

DROP TABLE IF EXISTS `brotherhood`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `brotherhood` (
  `id` int(11) NOT NULL,
  `version` int(11) NOT NULL,
  `address` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `is_banned` bit(1) DEFAULT NULL,
  `is_spammer` bit(1) DEFAULT NULL,
  `middle_name` varchar(255) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `phone_number` varchar(255) DEFAULT NULL,
  `photo` varchar(255) DEFAULT NULL,
  `score` double DEFAULT NULL,
  `surname` varchar(255) DEFAULT NULL,
  `username` varchar(255) DEFAULT NULL,
  `user_account` int(11) NOT NULL,
  `establishment` datetime DEFAULT NULL,
  `title` varchar(255) DEFAULT NULL,
  `area` int(11) NOT NULL,
  `history` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UK_5cyh83gj75vp1266mw0hxf8eu` (`history`),
  UNIQUE KEY `UK_j7wkl7fdmmjo3c5wa21wo8nl` (`user_account`),
  KEY `FK_oku65kpdi3ro8ta0bmmxdkidt` (`area`),
  CONSTRAINT `FK_j7wkl7fdmmjo3c5wa21wo8nl` FOREIGN KEY (`user_account`) REFERENCES `user_account` (`id`),
  CONSTRAINT `FK_5cyh83gj75vp1266mw0hxf8eu` FOREIGN KEY (`history`) REFERENCES `history` (`id`),
  CONSTRAINT `FK_oku65kpdi3ro8ta0bmmxdkidt` FOREIGN KEY (`area`) REFERENCES `area` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `brotherhood`
--

LOCK TABLES `brotherhood` WRITE;
/*!40000 ALTER TABLE `brotherhood` DISABLE KEYS */;
INSERT INTO `brotherhood` (`id`, `version`, `address`, `email`, `is_banned`, `is_spammer`, `middle_name`, `name`, `phone_number`, `photo`, `score`, `surname`, `username`, `user_account`, `establishment`, `title`, `area`, `history`) VALUES (3368,0,NULL,'broterhood1@mail.com',NULL,NULL,NULL,'brotherhood1',NULL,NULL,NULL,'brotherhood1','brotherhood1',3275,'2019-01-30 00:00:00','brotherhood1',3357,3366),(3369,0,NULL,'broterhood2@mail.com',NULL,NULL,NULL,'brotherhood2',NULL,NULL,NULL,'brotherhood2','brotherhood2',3277,'2019-02-10 00:00:00','brotherhood2',3358,3367);
/*!40000 ALTER TABLE `brotherhood` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `brotherhood_coaches`
--

DROP TABLE IF EXISTS `brotherhood_coaches`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `brotherhood_coaches` (
  `brotherhood` int(11) NOT NULL,
  `coaches` int(11) NOT NULL,
  UNIQUE KEY `UK_ns65rh9pdviu17l5vd2io00np` (`coaches`),
  KEY `FK_d5w0eh8sgpa84jaoryy6kx5ih` (`brotherhood`),
  CONSTRAINT `FK_d5w0eh8sgpa84jaoryy6kx5ih` FOREIGN KEY (`brotherhood`) REFERENCES `brotherhood` (`id`),
  CONSTRAINT `FK_ns65rh9pdviu17l5vd2io00np` FOREIGN KEY (`coaches`) REFERENCES `coach` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `brotherhood_coaches`
--

LOCK TABLES `brotherhood_coaches` WRITE;
/*!40000 ALTER TABLE `brotherhood_coaches` DISABLE KEYS */;
INSERT INTO `brotherhood_coaches` (`brotherhood`, `coaches`) VALUES (3368,3344),(3369,3345);
/*!40000 ALTER TABLE `brotherhood_coaches` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `brotherhood_pictures`
--

DROP TABLE IF EXISTS `brotherhood_pictures`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `brotherhood_pictures` (
  `brotherhood` int(11) NOT NULL,
  `link` varchar(255) DEFAULT NULL,
  `target_id` int(11) NOT NULL,
  KEY `FK_8d0m2wigmw0c32w3yqpgqlpyl` (`brotherhood`),
  CONSTRAINT `FK_8d0m2wigmw0c32w3yqpgqlpyl` FOREIGN KEY (`brotherhood`) REFERENCES `brotherhood` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `brotherhood_pictures`
--

LOCK TABLES `brotherhood_pictures` WRITE;
/*!40000 ALTER TABLE `brotherhood_pictures` DISABLE KEYS */;
/*!40000 ALTER TABLE `brotherhood_pictures` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `chapter`
--

DROP TABLE IF EXISTS `chapter`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `chapter` (
  `id` int(11) NOT NULL,
  `version` int(11) NOT NULL,
  `address` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `is_banned` bit(1) DEFAULT NULL,
  `is_spammer` bit(1) DEFAULT NULL,
  `middle_name` varchar(255) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `phone_number` varchar(255) DEFAULT NULL,
  `photo` varchar(255) DEFAULT NULL,
  `score` double DEFAULT NULL,
  `surname` varchar(255) DEFAULT NULL,
  `username` varchar(255) DEFAULT NULL,
  `user_account` int(11) NOT NULL,
  `title` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UK_j0iwie78xmrf4kapbyfbgl8uo` (`user_account`),
  CONSTRAINT `FK_j0iwie78xmrf4kapbyfbgl8uo` FOREIGN KEY (`user_account`) REFERENCES `user_account` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `chapter`
--

LOCK TABLES `chapter` WRITE;
/*!40000 ALTER TABLE `chapter` DISABLE KEYS */;
INSERT INTO `chapter` (`id`, `version`, `address`, `email`, `is_banned`, `is_spammer`, `middle_name`, `name`, `phone_number`, `photo`, `score`, `surname`, `username`, `user_account`, `title`) VALUES (3291,0,'chapter1 18','chapter1@gmail.com',NULL,NULL,'chapter1','chapter1','+34656256697',NULL,NULL,'chapter1','chapter1',3280,'chapter1'),(3297,0,'chapter2 18','chapter2@gmail.com',NULL,NULL,'chapter2','chapter2','+34656256697',NULL,NULL,'chapter2','chapter2',3281,'chapter2');
/*!40000 ALTER TABLE `chapter` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `chapter_proclaims`
--

DROP TABLE IF EXISTS `chapter_proclaims`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `chapter_proclaims` (
  `chapter` int(11) NOT NULL,
  `proclaims` int(11) NOT NULL,
  UNIQUE KEY `UK_i9bafhhvtsaw7apqwdyjq5bfx` (`proclaims`),
  KEY `FK_oi177522hsv2bpxq9x3rtp7pi` (`chapter`),
  CONSTRAINT `FK_oi177522hsv2bpxq9x3rtp7pi` FOREIGN KEY (`chapter`) REFERENCES `chapter` (`id`),
  CONSTRAINT `FK_i9bafhhvtsaw7apqwdyjq5bfx` FOREIGN KEY (`proclaims`) REFERENCES `proclaim` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `chapter_proclaims`
--

LOCK TABLES `chapter_proclaims` WRITE;
/*!40000 ALTER TABLE `chapter_proclaims` DISABLE KEYS */;
INSERT INTO `chapter_proclaims` (`chapter`, `proclaims`) VALUES (3291,3359),(3291,3360),(3297,3361),(3297,3362);
/*!40000 ALTER TABLE `chapter_proclaims` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `coach`
--

DROP TABLE IF EXISTS `coach`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `coach` (
  `id` int(11) NOT NULL,
  `version` int(11) NOT NULL,
  `description` varchar(255) DEFAULT NULL,
  `title` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `coach`
--

LOCK TABLES `coach` WRITE;
/*!40000 ALTER TABLE `coach` DISABLE KEYS */;
INSERT INTO `coach` (`id`, `version`, `description`, `title`) VALUES (3344,0,'Description Coach 1','Title Coach 1'),(3345,0,'Description Coach 2','Title Coach 2'),(3346,0,'Description Coach 3','Title Coach 3'),(3347,0,'Description Coach 4','Title Coach 4');
/*!40000 ALTER TABLE `coach` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `coach_pictures`
--

DROP TABLE IF EXISTS `coach_pictures`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `coach_pictures` (
  `coach` int(11) NOT NULL,
  `link` varchar(255) DEFAULT NULL,
  `target_id` int(11) NOT NULL,
  KEY `FK_a4nvrxvp4r93ye4psykcx3eyd` (`coach`),
  CONSTRAINT `FK_a4nvrxvp4r93ye4psykcx3eyd` FOREIGN KEY (`coach`) REFERENCES `coach` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `coach_pictures`
--

LOCK TABLES `coach_pictures` WRITE;
/*!40000 ALTER TABLE `coach_pictures` DISABLE KEYS */;
/*!40000 ALTER TABLE `coach_pictures` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `configurations`
--

DROP TABLE IF EXISTS `configurations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `configurations` (
  `id` int(11) NOT NULL,
  `version` int(11) NOT NULL,
  `cache_time` int(11) NOT NULL,
  `country_code` varchar(255) DEFAULT NULL,
  `english_message` varchar(255) DEFAULT NULL,
  `fare` double DEFAULT NULL,
  `finder_max_result` int(11) DEFAULT NULL,
  `logo` varchar(255) DEFAULT NULL,
  `spanish_message` varchar(255) DEFAULT NULL,
  `title` varchar(255) DEFAULT NULL,
  `vat` double DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `configurations`
--

LOCK TABLES `configurations` WRITE;
/*!40000 ALTER TABLE `configurations` DISABLE KEYS */;
INSERT INTO `configurations` (`id`, `version`, `cache_time`, `country_code`, `english_message`, `fare`, `finder_max_result`, `logo`, `spanish_message`, `title`, `vat`) VALUES (3363,0,1,'+34','Welcome to Acme Parade, the site to organise your parades.',10,10,'https://tinyurl.com/acme-madruga','¡Bienvenidos a Acme Parade! Tu sitio para organizar desfiles.','Acme Madruga Co., Inc.',0.21);
/*!40000 ALTER TABLE `configurations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `configurations_brand_name`
--

DROP TABLE IF EXISTS `configurations_brand_name`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `configurations_brand_name` (
  `configurations` int(11) NOT NULL,
  `brand_name` varchar(255) DEFAULT NULL,
  KEY `FK_rky45rf77p5hd9u55cuqwmkh6` (`configurations`),
  CONSTRAINT `FK_rky45rf77p5hd9u55cuqwmkh6` FOREIGN KEY (`configurations`) REFERENCES `configurations` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `configurations_brand_name`
--

LOCK TABLES `configurations_brand_name` WRITE;
/*!40000 ALTER TABLE `configurations_brand_name` DISABLE KEYS */;
INSERT INTO `configurations_brand_name` (`configurations`, `brand_name`) VALUES (3363,'VISA'),(3363,'MCARD'),(3363,'DINNERS'),(3363,'AMEX');
/*!40000 ALTER TABLE `configurations_brand_name` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `configurations_negative_words`
--

DROP TABLE IF EXISTS `configurations_negative_words`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `configurations_negative_words` (
  `configurations` int(11) NOT NULL,
  `negative_words` varchar(255) DEFAULT NULL,
  KEY `FK_b2m42flgo0mwdompewraemywl` (`configurations`),
  CONSTRAINT `FK_b2m42flgo0mwdompewraemywl` FOREIGN KEY (`configurations`) REFERENCES `configurations` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `configurations_negative_words`
--

LOCK TABLES `configurations_negative_words` WRITE;
/*!40000 ALTER TABLE `configurations_negative_words` DISABLE KEYS */;
INSERT INTO `configurations_negative_words` (`configurations`, `negative_words`) VALUES (3363,'not'),(3363,'no'),(3363,'bad'),(3363,'malo'),(3363,'horrible'),(3363,'average'),(3363,'mediocre'),(3363,'disaster'),(3363,'desastre');
/*!40000 ALTER TABLE `configurations_negative_words` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `configurations_positive_words`
--

DROP TABLE IF EXISTS `configurations_positive_words`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `configurations_positive_words` (
  `configurations` int(11) NOT NULL,
  `positive_words` varchar(255) DEFAULT NULL,
  KEY `FK_h21cdk82pq2rdyvdxhehvrpul` (`configurations`),
  CONSTRAINT `FK_h21cdk82pq2rdyvdxhehvrpul` FOREIGN KEY (`configurations`) REFERENCES `configurations` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `configurations_positive_words`
--

LOCK TABLES `configurations_positive_words` WRITE;
/*!40000 ALTER TABLE `configurations_positive_words` DISABLE KEYS */;
INSERT INTO `configurations_positive_words` (`configurations`, `positive_words`) VALUES (3363,'good'),(3363,'fantastic'),(3363,'excellent'),(3363,'great'),(3363,'amazing'),(3363,'terrific'),(3363,'beautiful'),(3363,'bueno'),(3363,'fantástico'),(3363,'excelente'),(3363,'gran'),(3363,'asombroso'),(3363,'terrible'),(3363,'bonito');
/*!40000 ALTER TABLE `configurations_positive_words` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `configurations_spam_words`
--

DROP TABLE IF EXISTS `configurations_spam_words`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `configurations_spam_words` (
  `configurations` int(11) NOT NULL,
  `spam_words` varchar(255) DEFAULT NULL,
  KEY `FK_1mwxou3h8fn5uxuwtsbhw7g1e` (`configurations`),
  CONSTRAINT `FK_1mwxou3h8fn5uxuwtsbhw7g1e` FOREIGN KEY (`configurations`) REFERENCES `configurations` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `configurations_spam_words`
--

LOCK TABLES `configurations_spam_words` WRITE;
/*!40000 ALTER TABLE `configurations_spam_words` DISABLE KEYS */;
INSERT INTO `configurations_spam_words` (`configurations`, `spam_words`) VALUES (3363,'sex'),(3363,'viagra'),(3363,'cialis'),(3363,'one million'),(3363,'you\'ve been selected'),(3363,'Nigeria'),(3363,'sexo'),(3363,'un millón'),(3363,'ha sido seleccionado');
/*!40000 ALTER TABLE `configurations_spam_words` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dropout`
--

DROP TABLE IF EXISTS `dropout`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `dropout` (
  `id` int(11) NOT NULL,
  `version` int(11) NOT NULL,
  `date` datetime DEFAULT NULL,
  `brotherhood` int(11) DEFAULT NULL,
  `member` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_etk0cjto9tih3181og5oyg14c` (`brotherhood`),
  KEY `FK_mg7gudatr8hrx0pi7fxuorvjx` (`member`),
  CONSTRAINT `FK_mg7gudatr8hrx0pi7fxuorvjx` FOREIGN KEY (`member`) REFERENCES `member` (`id`),
  CONSTRAINT `FK_etk0cjto9tih3181og5oyg14c` FOREIGN KEY (`brotherhood`) REFERENCES `brotherhood` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dropout`
--

LOCK TABLES `dropout` WRITE;
/*!40000 ALTER TABLE `dropout` DISABLE KEYS */;
/*!40000 ALTER TABLE `dropout` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `enrol`
--

DROP TABLE IF EXISTS `enrol`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `enrol` (
  `id` int(11) NOT NULL,
  `version` int(11) NOT NULL,
  `moment` datetime DEFAULT NULL,
  `brotherhood` int(11) NOT NULL,
  `member` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_icbopjp00kcbh1sfwn1ft5qdo` (`brotherhood`),
  KEY `FK_2bcj5a6l13qr0ilr8r41dgnab` (`member`),
  CONSTRAINT `FK_2bcj5a6l13qr0ilr8r41dgnab` FOREIGN KEY (`member`) REFERENCES `member` (`id`),
  CONSTRAINT `FK_icbopjp00kcbh1sfwn1ft5qdo` FOREIGN KEY (`brotherhood`) REFERENCES `brotherhood` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `enrol`
--

LOCK TABLES `enrol` WRITE;
/*!40000 ALTER TABLE `enrol` DISABLE KEYS */;
INSERT INTO `enrol` (`id`, `version`, `moment`, `brotherhood`, `member`) VALUES (3379,0,'2019-01-19 00:00:00',3368,3364),(3380,0,'2019-01-19 00:00:00',3369,3365),(3381,0,'2019-02-15 00:00:00',3368,3365);
/*!40000 ALTER TABLE `enrol` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `finder`
--

DROP TABLE IF EXISTS `finder`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `finder` (
  `id` int(11) NOT NULL,
  `version` int(11) NOT NULL,
  `keyword` varchar(255) DEFAULT NULL,
  `last_update` datetime DEFAULT NULL,
  `max_date` datetime DEFAULT NULL,
  `min_date` datetime DEFAULT NULL,
  `area` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_rbjlwj1bksuusd3142rf62xyt` (`area`),
  CONSTRAINT `FK_rbjlwj1bksuusd3142rf62xyt` FOREIGN KEY (`area`) REFERENCES `area` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `finder`
--

LOCK TABLES `finder` WRITE;
/*!40000 ALTER TABLE `finder` DISABLE KEYS */;
INSERT INTO `finder` (`id`, `version`, `keyword`, `last_update`, `max_date`, `min_date`, `area`) VALUES (3348,0,NULL,'2000-01-01 00:00:00',NULL,NULL,NULL),(3349,0,NULL,'2000-01-01 00:00:00',NULL,NULL,NULL);
/*!40000 ALTER TABLE `finder` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `finder_processions`
--

DROP TABLE IF EXISTS `finder_processions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `finder_processions` (
  `finder` int(11) NOT NULL,
  `processions` int(11) NOT NULL,
  UNIQUE KEY `UK_6p1eb8rm7luhusax3fd8uksw1` (`processions`),
  KEY `FK_1cueuewr7dicti6yua7dv4b6c` (`finder`),
  CONSTRAINT `FK_1cueuewr7dicti6yua7dv4b6c` FOREIGN KEY (`finder`) REFERENCES `finder` (`id`),
  CONSTRAINT `FK_6p1eb8rm7luhusax3fd8uksw1` FOREIGN KEY (`processions`) REFERENCES `procession` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `finder_processions`
--

LOCK TABLES `finder_processions` WRITE;
/*!40000 ALTER TABLE `finder_processions` DISABLE KEYS */;
/*!40000 ALTER TABLE `finder_processions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `hibernate_sequences`
--

DROP TABLE IF EXISTS `hibernate_sequences`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `hibernate_sequences` (
  `sequence_name` varchar(255) DEFAULT NULL,
  `sequence_next_hi_value` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `hibernate_sequences`
--

LOCK TABLES `hibernate_sequences` WRITE;
/*!40000 ALTER TABLE `hibernate_sequences` DISABLE KEYS */;
INSERT INTO `hibernate_sequences` (`sequence_name`, `sequence_next_hi_value`) VALUES ('domain_entity',2);
/*!40000 ALTER TABLE `hibernate_sequences` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `history`
--

DROP TABLE IF EXISTS `history`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `history` (
  `id` int(11) NOT NULL,
  `version` int(11) NOT NULL,
  `record_number` int(11) DEFAULT NULL,
  `inception_record` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UK_ft70pl0noyt3c2bufgsyepbbe` (`inception_record`),
  CONSTRAINT `FK_ft70pl0noyt3c2bufgsyepbbe` FOREIGN KEY (`inception_record`) REFERENCES `inception_record` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `history`
--

LOCK TABLES `history` WRITE;
/*!40000 ALTER TABLE `history` DISABLE KEYS */;
INSERT INTO `history` (`id`, `version`, `record_number`, `inception_record`) VALUES (3366,0,3,3313),(3367,0,1,3314);
/*!40000 ALTER TABLE `history` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `history_legal_records`
--

DROP TABLE IF EXISTS `history_legal_records`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `history_legal_records` (
  `history` int(11) NOT NULL,
  `legal_records` int(11) NOT NULL,
  UNIQUE KEY `UK_4cwwxrddivsxn1pdy0vhb1ywj` (`legal_records`),
  KEY `FK_6q06x59ns3cq8hmomnvifnrl` (`history`),
  CONSTRAINT `FK_6q06x59ns3cq8hmomnvifnrl` FOREIGN KEY (`history`) REFERENCES `history` (`id`),
  CONSTRAINT `FK_4cwwxrddivsxn1pdy0vhb1ywj` FOREIGN KEY (`legal_records`) REFERENCES `legal_record` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `history_legal_records`
--

LOCK TABLES `history_legal_records` WRITE;
/*!40000 ALTER TABLE `history_legal_records` DISABLE KEYS */;
INSERT INTO `history_legal_records` (`history`, `legal_records`) VALUES (3366,3315),(3366,3316);
/*!40000 ALTER TABLE `history_legal_records` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `history_link_records`
--

DROP TABLE IF EXISTS `history_link_records`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `history_link_records` (
  `history` int(11) NOT NULL,
  `link_records` int(11) NOT NULL,
  UNIQUE KEY `UK_bg9ynbbfa8vmxt2d8o0ih813c` (`link_records`),
  KEY `FK_i0x3qbnon99dx62swyxjpscdi` (`history`),
  CONSTRAINT `FK_i0x3qbnon99dx62swyxjpscdi` FOREIGN KEY (`history`) REFERENCES `history` (`id`),
  CONSTRAINT `FK_bg9ynbbfa8vmxt2d8o0ih813c` FOREIGN KEY (`link_records`) REFERENCES `link_record` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `history_link_records`
--

LOCK TABLES `history_link_records` WRITE;
/*!40000 ALTER TABLE `history_link_records` DISABLE KEYS */;
/*!40000 ALTER TABLE `history_link_records` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `history_miscellaneous_records`
--

DROP TABLE IF EXISTS `history_miscellaneous_records`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `history_miscellaneous_records` (
  `history` int(11) NOT NULL,
  `miscellaneous_records` int(11) NOT NULL,
  UNIQUE KEY `UK_jen0lw0bk1yyhve3wcsgypaym` (`miscellaneous_records`),
  KEY `FK_qlwmifke4ewmebi6xck9lwbft` (`history`),
  CONSTRAINT `FK_qlwmifke4ewmebi6xck9lwbft` FOREIGN KEY (`history`) REFERENCES `history` (`id`),
  CONSTRAINT `FK_jen0lw0bk1yyhve3wcsgypaym` FOREIGN KEY (`miscellaneous_records`) REFERENCES `miscellaneous_record` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `history_miscellaneous_records`
--

LOCK TABLES `history_miscellaneous_records` WRITE;
/*!40000 ALTER TABLE `history_miscellaneous_records` DISABLE KEYS */;
/*!40000 ALTER TABLE `history_miscellaneous_records` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `history_period_records`
--

DROP TABLE IF EXISTS `history_period_records`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `history_period_records` (
  `history` int(11) NOT NULL,
  `period_records` int(11) NOT NULL,
  UNIQUE KEY `UK_1butqdd9tg7u8ts0qq1gbsk4g` (`period_records`),
  KEY `FK_2n92fjhwuxbhgbrv5g4in69n2` (`history`),
  CONSTRAINT `FK_2n92fjhwuxbhgbrv5g4in69n2` FOREIGN KEY (`history`) REFERENCES `history` (`id`),
  CONSTRAINT `FK_1butqdd9tg7u8ts0qq1gbsk4g` FOREIGN KEY (`period_records`) REFERENCES `period_record` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `history_period_records`
--

LOCK TABLES `history_period_records` WRITE;
/*!40000 ALTER TABLE `history_period_records` DISABLE KEYS */;
/*!40000 ALTER TABLE `history_period_records` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `inception_record`
--

DROP TABLE IF EXISTS `inception_record`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `inception_record` (
  `id` int(11) NOT NULL,
  `version` int(11) NOT NULL,
  `description` varchar(255) DEFAULT NULL,
  `title` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `inception_record`
--

LOCK TABLES `inception_record` WRITE;
/*!40000 ALTER TABLE `inception_record` DISABLE KEYS */;
INSERT INTO `inception_record` (`id`, `version`, `description`, `title`) VALUES (3313,0,'Inception record','Inception bro 1'),(3314,0,'Inception record','Inception bro 2');
/*!40000 ALTER TABLE `inception_record` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `inception_record_pictures`
--

DROP TABLE IF EXISTS `inception_record_pictures`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `inception_record_pictures` (
  `inception_record` int(11) NOT NULL,
  `link` varchar(255) DEFAULT NULL,
  `target_id` int(11) NOT NULL,
  KEY `FK_fvjli3pklfewu2l3u5p7qu7dp` (`inception_record`),
  CONSTRAINT `FK_fvjli3pklfewu2l3u5p7qu7dp` FOREIGN KEY (`inception_record`) REFERENCES `inception_record` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `inception_record_pictures`
--

LOCK TABLES `inception_record_pictures` WRITE;
/*!40000 ALTER TABLE `inception_record_pictures` DISABLE KEYS */;
/*!40000 ALTER TABLE `inception_record_pictures` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `legal_record`
--

DROP TABLE IF EXISTS `legal_record`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `legal_record` (
  `id` int(11) NOT NULL,
  `version` int(11) NOT NULL,
  `description` varchar(255) DEFAULT NULL,
  `title` varchar(255) DEFAULT NULL,
  `laws` varchar(255) DEFAULT NULL,
  `legal_name` varchar(255) DEFAULT NULL,
  `vat` double NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `legal_record`
--

LOCK TABLES `legal_record` WRITE;
/*!40000 ALTER TABLE `legal_record` DISABLE KEYS */;
INSERT INTO `legal_record` (`id`, `version`, `description`, `title`, `laws`, `legal_name`, `vat`) VALUES (3315,0,'Legal record','Legal bro 1','Laws','Legal name 1',0.21),(3316,0,'Legal record','Legal bro 2','Laws','Legal name 2',0.21);
/*!40000 ALTER TABLE `legal_record` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `link_record`
--

DROP TABLE IF EXISTS `link_record`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `link_record` (
  `id` int(11) NOT NULL,
  `version` int(11) NOT NULL,
  `description` varchar(255) DEFAULT NULL,
  `title` varchar(255) DEFAULT NULL,
  `link` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_r2d59jwabxng1972jqr9t54a4` (`link`),
  CONSTRAINT `FK_r2d59jwabxng1972jqr9t54a4` FOREIGN KEY (`link`) REFERENCES `brotherhood` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `link_record`
--

LOCK TABLES `link_record` WRITE;
/*!40000 ALTER TABLE `link_record` DISABLE KEYS */;
/*!40000 ALTER TABLE `link_record` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `member`
--

DROP TABLE IF EXISTS `member`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `member` (
  `id` int(11) NOT NULL,
  `version` int(11) NOT NULL,
  `address` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `is_banned` bit(1) DEFAULT NULL,
  `is_spammer` bit(1) DEFAULT NULL,
  `middle_name` varchar(255) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `phone_number` varchar(255) DEFAULT NULL,
  `photo` varchar(255) DEFAULT NULL,
  `score` double DEFAULT NULL,
  `surname` varchar(255) DEFAULT NULL,
  `username` varchar(255) DEFAULT NULL,
  `user_account` int(11) NOT NULL,
  `finder` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UK_mjoa5yw12sbvknx53x7fu5a1g` (`finder`),
  UNIQUE KEY `UK_porqrqrfw70onhs6pelgepxhu` (`user_account`),
  CONSTRAINT `FK_porqrqrfw70onhs6pelgepxhu` FOREIGN KEY (`user_account`) REFERENCES `user_account` (`id`),
  CONSTRAINT `FK_mjoa5yw12sbvknx53x7fu5a1g` FOREIGN KEY (`finder`) REFERENCES `finder` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `member`
--

LOCK TABLES `member` WRITE;
/*!40000 ALTER TABLE `member` DISABLE KEYS */;
INSERT INTO `member` (`id`, `version`, `address`, `email`, `is_banned`, `is_spammer`, `middle_name`, `name`, `phone_number`, `photo`, `score`, `surname`, `username`, `user_account`, `finder`) VALUES (3364,0,NULL,'member1@mail.com',NULL,NULL,NULL,'member1',NULL,NULL,NULL,'member1','member1',3278,3348),(3365,0,NULL,'member2@mail.com',NULL,NULL,NULL,'member2',NULL,NULL,NULL,'member2','member2',3279,3349);
/*!40000 ALTER TABLE `member` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `message`
--

DROP TABLE IF EXISTS `message`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `message` (
  `id` int(11) NOT NULL,
  `version` int(11) NOT NULL,
  `body` varchar(255) DEFAULT NULL,
  `is_notification` bit(1) DEFAULT NULL,
  `moment` datetime DEFAULT NULL,
  `priority` varchar(255) DEFAULT NULL,
  `subject` varchar(255) DEFAULT NULL,
  `sender` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `message`
--

LOCK TABLES `message` WRITE;
/*!40000 ALTER TABLE `message` DISABLE KEYS */;
INSERT INTO `message` (`id`, `version`, `body`, `is_notification`, `moment`, `priority`, `subject`, `sender`) VALUES (3343,1,'body example',NULL,'2019-02-12 00:00:00','LOW','subject example',3368);
/*!40000 ALTER TABLE `message` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `message_box`
--

DROP TABLE IF EXISTS `message_box`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `message_box` (
  `id` int(11) NOT NULL,
  `version` int(11) NOT NULL,
  `is_system_box` bit(1) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `message_box`
--

LOCK TABLES `message_box` WRITE;
/*!40000 ALTER TABLE `message_box` DISABLE KEYS */;
INSERT INTO `message_box` (`id`, `version`, `is_system_box`, `name`) VALUES (3285,0,'','spam'),(3286,0,'','in'),(3287,0,'','out'),(3288,0,'','trash'),(3289,0,'','notification'),(3292,0,'','spam'),(3293,0,'','in'),(3294,0,'','out'),(3295,0,'','trash'),(3296,0,'','notification'),(3298,0,'','spam'),(3299,0,'','in'),(3300,0,'','out'),(3301,0,'','trash'),(3302,0,'','notification'),(3304,0,'','spam'),(3305,0,'','in'),(3306,0,'','out'),(3307,0,'','trash'),(3309,0,'','spam'),(3310,0,'','in'),(3311,0,'','out'),(3312,0,'','trash'),(3321,0,'','in'),(3322,0,'','out'),(3323,0,'','spam'),(3324,0,'','notification'),(3325,0,'','trash'),(3326,0,'','in'),(3327,0,'','out'),(3328,0,'','spam'),(3329,0,'','notification'),(3330,0,'','trash'),(3331,0,'','in'),(3332,0,'','out'),(3333,0,'','spam'),(3334,0,'','notification'),(3335,0,'','trash'),(3336,0,'','in'),(3337,0,'','out'),(3338,0,'','spam'),(3339,0,'','notification'),(3340,0,'','trash'),(3341,0,'','notification'),(3342,0,'','notification');
/*!40000 ALTER TABLE `message_box` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `message_box_messages`
--

DROP TABLE IF EXISTS `message_box_messages`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `message_box_messages` (
  `message_box` int(11) NOT NULL,
  `messages` int(11) NOT NULL,
  KEY `FK_4ydibw5107qpqjwmw37t3cx5c` (`messages`),
  KEY `FK_i9fsy1u5e0dyn977c4uhdupur` (`message_box`),
  CONSTRAINT `FK_i9fsy1u5e0dyn977c4uhdupur` FOREIGN KEY (`message_box`) REFERENCES `message_box` (`id`),
  CONSTRAINT `FK_4ydibw5107qpqjwmw37t3cx5c` FOREIGN KEY (`messages`) REFERENCES `message` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `message_box_messages`
--

LOCK TABLES `message_box_messages` WRITE;
/*!40000 ALTER TABLE `message_box_messages` DISABLE KEYS */;
INSERT INTO `message_box_messages` (`message_box`, `messages`) VALUES (3293,3343),(3299,3343),(3332,3343),(3336,3343);
/*!40000 ALTER TABLE `message_box_messages` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `message_message_boxes`
--

DROP TABLE IF EXISTS `message_message_boxes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `message_message_boxes` (
  `message` int(11) NOT NULL,
  `message_boxes` int(11) NOT NULL,
  KEY `FK_9e3s75h2409iiuiugj5h00enq` (`message_boxes`),
  KEY `FK_pg69wrq7o02j8baa8d56f1x0q` (`message`),
  CONSTRAINT `FK_pg69wrq7o02j8baa8d56f1x0q` FOREIGN KEY (`message`) REFERENCES `message` (`id`),
  CONSTRAINT `FK_9e3s75h2409iiuiugj5h00enq` FOREIGN KEY (`message_boxes`) REFERENCES `message_box` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `message_message_boxes`
--

LOCK TABLES `message_message_boxes` WRITE;
/*!40000 ALTER TABLE `message_message_boxes` DISABLE KEYS */;
INSERT INTO `message_message_boxes` (`message`, `message_boxes`) VALUES (3343,3332),(3343,3336);
/*!40000 ALTER TABLE `message_message_boxes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `message_recipients`
--

DROP TABLE IF EXISTS `message_recipients`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `message_recipients` (
  `message` int(11) NOT NULL,
  `recipients` int(11) NOT NULL,
  KEY `FK_1odmg2n3n487tvhuxx5oyyya2` (`message`),
  CONSTRAINT `FK_1odmg2n3n487tvhuxx5oyyya2` FOREIGN KEY (`message`) REFERENCES `message` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `message_recipients`
--

LOCK TABLES `message_recipients` WRITE;
/*!40000 ALTER TABLE `message_recipients` DISABLE KEYS */;
INSERT INTO `message_recipients` (`message`, `recipients`) VALUES (3343,3369);
/*!40000 ALTER TABLE `message_recipients` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `message_tags`
--

DROP TABLE IF EXISTS `message_tags`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `message_tags` (
  `message` int(11) NOT NULL,
  `tags` varchar(255) DEFAULT NULL,
  KEY `FK_suckduhsrrtot7go5ejeev57w` (`message`),
  CONSTRAINT `FK_suckduhsrrtot7go5ejeev57w` FOREIGN KEY (`message`) REFERENCES `message` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `message_tags`
--

LOCK TABLES `message_tags` WRITE;
/*!40000 ALTER TABLE `message_tags` DISABLE KEYS */;
/*!40000 ALTER TABLE `message_tags` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `miscellaneous_record`
--

DROP TABLE IF EXISTS `miscellaneous_record`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `miscellaneous_record` (
  `id` int(11) NOT NULL,
  `version` int(11) NOT NULL,
  `description` varchar(255) DEFAULT NULL,
  `title` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `miscellaneous_record`
--

LOCK TABLES `miscellaneous_record` WRITE;
/*!40000 ALTER TABLE `miscellaneous_record` DISABLE KEYS */;
/*!40000 ALTER TABLE `miscellaneous_record` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `path`
--

DROP TABLE IF EXISTS `path`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `path` (
  `id` int(11) NOT NULL,
  `version` int(11) NOT NULL,
  `procession` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UK_hfyvxjhmbijm7049ytg8fiod1` (`procession`),
  CONSTRAINT `FK_hfyvxjhmbijm7049ytg8fiod1` FOREIGN KEY (`procession`) REFERENCES `procession` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `path`
--

LOCK TABLES `path` WRITE;
/*!40000 ALTER TABLE `path` DISABLE KEYS */;
INSERT INTO `path` (`id`, `version`, `procession`) VALUES (3376,0,3370);
/*!40000 ALTER TABLE `path` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `period_record`
--

DROP TABLE IF EXISTS `period_record`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `period_record` (
  `id` int(11) NOT NULL,
  `version` int(11) NOT NULL,
  `description` varchar(255) DEFAULT NULL,
  `title` varchar(255) DEFAULT NULL,
  `end_year` int(11) DEFAULT NULL,
  `start_year` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `period_record`
--

LOCK TABLES `period_record` WRITE;
/*!40000 ALTER TABLE `period_record` DISABLE KEYS */;
/*!40000 ALTER TABLE `period_record` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `period_record_pictures`
--

DROP TABLE IF EXISTS `period_record_pictures`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `period_record_pictures` (
  `period_record` int(11) NOT NULL,
  `link` varchar(255) DEFAULT NULL,
  `target_id` int(11) NOT NULL,
  KEY `FK_hp3waus498w1lj9ue0mjv5vhq` (`period_record`),
  CONSTRAINT `FK_hp3waus498w1lj9ue0mjv5vhq` FOREIGN KEY (`period_record`) REFERENCES `period_record` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `period_record_pictures`
--

LOCK TABLES `period_record_pictures` WRITE;
/*!40000 ALTER TABLE `period_record_pictures` DISABLE KEYS */;
/*!40000 ALTER TABLE `period_record_pictures` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `position`
--

DROP TABLE IF EXISTS `position`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `position` (
  `id` int(11) NOT NULL,
  `version` int(11) NOT NULL,
  `english_name` varchar(255) DEFAULT NULL,
  `spanish_name` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `position`
--

LOCK TABLES `position` WRITE;
/*!40000 ALTER TABLE `position` DISABLE KEYS */;
INSERT INTO `position` (`id`, `version`, `english_name`, `spanish_name`) VALUES (3350,0,'President','Presidente'),(3351,0,'Vice President','Vicepresidente'),(3352,0,'Secretary','Secretario'),(3353,0,'Treasurer','Tesorero'),(3354,0,'Historian','Historiador'),(3355,0,'Fundraiser','Promotor'),(3356,0,'Officer','Vocal');
/*!40000 ALTER TABLE `position` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `position_enrol`
--

DROP TABLE IF EXISTS `position_enrol`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `position_enrol` (
  `positions` int(11) NOT NULL,
  `enrol` int(11) NOT NULL,
  KEY `FK_o6july96rcea75rvljgfbmydt` (`enrol`),
  KEY `FK_pj3u07jyhiop6tfg6c7xmw1yx` (`positions`),
  CONSTRAINT `FK_pj3u07jyhiop6tfg6c7xmw1yx` FOREIGN KEY (`positions`) REFERENCES `position` (`id`),
  CONSTRAINT `FK_o6july96rcea75rvljgfbmydt` FOREIGN KEY (`enrol`) REFERENCES `enrol` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `position_enrol`
--

LOCK TABLES `position_enrol` WRITE;
/*!40000 ALTER TABLE `position_enrol` DISABLE KEYS */;
INSERT INTO `position_enrol` (`positions`, `enrol`) VALUES (3350,3379),(3350,3380),(3352,3381);
/*!40000 ALTER TABLE `position_enrol` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `procession`
--

DROP TABLE IF EXISTS `procession`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `procession` (
  `id` int(11) NOT NULL,
  `version` int(11) NOT NULL,
  `description` varchar(255) DEFAULT NULL,
  `draft_mode` bit(1) DEFAULT NULL,
  `moment` datetime DEFAULT NULL,
  `reasson` varchar(255) DEFAULT NULL,
  `status` varchar(255) DEFAULT NULL,
  `ticker` varchar(255) DEFAULT NULL,
  `title` varchar(255) DEFAULT NULL,
  `brotherhood` int(11) NOT NULL,
  `path` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UK_sc8hr69nciikog00mms5616f8` (`ticker`),
  KEY `FK_k1aiqpf52p76km7ua07nlt1go` (`brotherhood`),
  KEY `FK_1sx766rrtw6twgsbptbd6137j` (`path`),
  CONSTRAINT `FK_1sx766rrtw6twgsbptbd6137j` FOREIGN KEY (`path`) REFERENCES `path` (`id`),
  CONSTRAINT `FK_k1aiqpf52p76km7ua07nlt1go` FOREIGN KEY (`brotherhood`) REFERENCES `brotherhood` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `procession`
--

LOCK TABLES `procession` WRITE;
/*!40000 ALTER TABLE `procession` DISABLE KEYS */;
INSERT INTO `procession` (`id`, `version`, `description`, `draft_mode`, `moment`, `reasson`, `status`, `ticker`, `title`, `brotherhood`, `path`) VALUES (3370,1,'procession1 description','\0','2019-04-01 00:00:00',NULL,'APPROVED','190210-AAAAA','procession1',3368,3376),(3373,0,'procession2 description','\0','2019-06-15 00:00:00',NULL,'SUBMITTED','190215-BBBBB','procession2',3369,NULL);
/*!40000 ALTER TABLE `procession` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `proclaim`
--

DROP TABLE IF EXISTS `proclaim`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `proclaim` (
  `id` int(11) NOT NULL,
  `version` int(11) NOT NULL,
  `moment` datetime DEFAULT NULL,
  `text` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `proclaim`
--

LOCK TABLES `proclaim` WRITE;
/*!40000 ALTER TABLE `proclaim` DISABLE KEYS */;
INSERT INTO `proclaim` (`id`, `version`, `moment`, `text`) VALUES (3359,0,'2019-03-12 00:00:00','New proclaim1'),(3360,0,'2019-01-12 00:00:00','New proclaim2'),(3361,0,'2019-02-20 00:00:00','New proclaim3'),(3362,0,'2019-01-09 00:00:00','New proclaim4');
/*!40000 ALTER TABLE `proclaim` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `record`
--

DROP TABLE IF EXISTS `record`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `record` (
  `id` int(11) NOT NULL,
  `version` int(11) NOT NULL,
  `description` varchar(255) DEFAULT NULL,
  `title` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `record`
--

LOCK TABLES `record` WRITE;
/*!40000 ALTER TABLE `record` DISABLE KEYS */;
/*!40000 ALTER TABLE `record` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `request`
--

DROP TABLE IF EXISTS `request`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `request` (
  `id` int(11) NOT NULL,
  `version` int(11) NOT NULL,
  `assigned_column` int(11) DEFAULT NULL,
  `assigned_row` int(11) DEFAULT NULL,
  `reason` varchar(255) DEFAULT NULL,
  `status` varchar(255) DEFAULT NULL,
  `member` int(11) NOT NULL,
  `procession` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_hgv8wexlup4hjaqo4ki13th8v` (`member`),
  KEY `FK_pihoapjtqc0dtknukqggpxmq6` (`procession`),
  CONSTRAINT `FK_pihoapjtqc0dtknukqggpxmq6` FOREIGN KEY (`procession`) REFERENCES `procession` (`id`),
  CONSTRAINT `FK_hgv8wexlup4hjaqo4ki13th8v` FOREIGN KEY (`member`) REFERENCES `member` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `request`
--

LOCK TABLES `request` WRITE;
/*!40000 ALTER TABLE `request` DISABLE KEYS */;
INSERT INTO `request` (`id`, `version`, `assigned_column`, `assigned_row`, `reason`, `status`, `member`, `procession`) VALUES (3371,0,2,2,NULL,'APPROVED',3364,3370),(3372,0,NULL,NULL,NULL,'PENDING',3365,3370),(3374,0,NULL,NULL,'Es demasiado gordo, ocuparía dos puestos','REJECTED',3364,3373),(3375,0,1,1,NULL,'APPROVED',3365,3373);
/*!40000 ALTER TABLE `request` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `segment`
--

DROP TABLE IF EXISTS `segment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `segment` (
  `id` int(11) NOT NULL,
  `version` int(11) NOT NULL,
  `destination_latitude` double DEFAULT NULL,
  `destination_longitude` double DEFAULT NULL,
  `destination_time` datetime DEFAULT NULL,
  `number` int(11) NOT NULL,
  `origin_latitude` double DEFAULT NULL,
  `origin_longitude` double DEFAULT NULL,
  `origin_time` datetime DEFAULT NULL,
  `path` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_bqsyylncrlwn1umig0u1d7q9y` (`path`),
  CONSTRAINT `FK_bqsyylncrlwn1umig0u1d7q9y` FOREIGN KEY (`path`) REFERENCES `path` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `segment`
--

LOCK TABLES `segment` WRITE;
/*!40000 ALTER TABLE `segment` DISABLE KEYS */;
INSERT INTO `segment` (`id`, `version`, `destination_latitude`, `destination_longitude`, `destination_time`, `number`, `origin_latitude`, `origin_longitude`, `origin_time`, `path`) VALUES (3377,0,10.5,10.5,'2019-06-19 19:00:00',0,0.5,0.5,'2019-06-19 18:00:00',3376),(3378,0,20.5,20.5,'2019-06-19 20:00:00',1,10.5,10.5,'2019-06-19 19:05:00',3376);
/*!40000 ALTER TABLE `segment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `social_identity`
--

DROP TABLE IF EXISTS `social_identity`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `social_identity` (
  `id` int(11) NOT NULL,
  `version` int(11) NOT NULL,
  `link` varchar(255) DEFAULT NULL,
  `nick` varchar(255) DEFAULT NULL,
  `social_network` varchar(255) DEFAULT NULL,
  `actor` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `social_identity`
--

LOCK TABLES `social_identity` WRITE;
/*!40000 ALTER TABLE `social_identity` DISABLE KEYS */;
INSERT INTO `social_identity` (`id`, `version`, `link`, `nick`, `social_network`, `actor`) VALUES (3290,0,'http://www.facebook/admin1','admin','facebook',3284),(3317,1,'http://www.facebook/member1','member1','facebook',3364),(3318,1,'http://www.facebook/member2','member2','facebook',3365),(3319,1,'http://www.facebook/brotherhood1','brotherhood1','facebook',3368),(3320,1,'http://www.facebook/brotherhood2','brotherhood2','facebook',3369);
/*!40000 ALTER TABLE `social_identity` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sponsor`
--

DROP TABLE IF EXISTS `sponsor`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sponsor` (
  `id` int(11) NOT NULL,
  `version` int(11) NOT NULL,
  `address` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `is_banned` bit(1) DEFAULT NULL,
  `is_spammer` bit(1) DEFAULT NULL,
  `middle_name` varchar(255) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `phone_number` varchar(255) DEFAULT NULL,
  `photo` varchar(255) DEFAULT NULL,
  `score` double DEFAULT NULL,
  `surname` varchar(255) DEFAULT NULL,
  `username` varchar(255) DEFAULT NULL,
  `user_account` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UK_du2w5ldt8rvlvxvtr7vyxk7g3` (`user_account`),
  CONSTRAINT `FK_du2w5ldt8rvlvxvtr7vyxk7g3` FOREIGN KEY (`user_account`) REFERENCES `user_account` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sponsor`
--

LOCK TABLES `sponsor` WRITE;
/*!40000 ALTER TABLE `sponsor` DISABLE KEYS */;
INSERT INTO `sponsor` (`id`, `version`, `address`, `email`, `is_banned`, `is_spammer`, `middle_name`, `name`, `phone_number`, `photo`, `score`, `surname`, `username`, `user_account`) VALUES (3303,0,'sponsor1 7474','sponsor1@gmail.com',NULL,NULL,'middlename1','sponsor1','656278997',NULL,NULL,'surname1','sponsor1',3282),(3308,0,'sponsor2 7474','sponsor2@gmail.com',NULL,NULL,'mddlnm2','sponsor2','656274521',NULL,NULL,'surname2',NULL,3283);
/*!40000 ALTER TABLE `sponsor` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sponsorship`
--

DROP TABLE IF EXISTS `sponsorship`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sponsorship` (
  `id` int(11) NOT NULL,
  `version` int(11) NOT NULL,
  `active` bit(1) DEFAULT NULL,
  `banner` varchar(255) DEFAULT NULL,
  `charge` double NOT NULL,
  `brand_name` varchar(255) DEFAULT NULL,
  `cvv_code` int(11) DEFAULT NULL,
  `expiration` datetime DEFAULT NULL,
  `holder_name` varchar(255) DEFAULT NULL,
  `number` varchar(255) DEFAULT NULL,
  `target_page` varchar(255) DEFAULT NULL,
  `procession` int(11) NOT NULL,
  `sponsor` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_64p0rgey0m6g0wtw93sb3419x` (`procession`),
  KEY `FK_huglhkud0ihqdljyou4eshra6` (`sponsor`),
  CONSTRAINT `FK_huglhkud0ihqdljyou4eshra6` FOREIGN KEY (`sponsor`) REFERENCES `sponsor` (`id`),
  CONSTRAINT `FK_64p0rgey0m6g0wtw93sb3419x` FOREIGN KEY (`procession`) REFERENCES `procession` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sponsorship`
--

LOCK TABLES `sponsorship` WRITE;
/*!40000 ALTER TABLE `sponsorship` DISABLE KEYS */;
INSERT INTO `sponsorship` (`id`, `version`, `active`, `banner`, `charge`, `brand_name`, `cvv_code`, `expiration`, `holder_name`, `number`, `target_page`, `procession`, `sponsor`) VALUES (3382,0,'','https://goo.gl/mR1tJ6',0,'VISA',123,'2015-12-02 00:00:00','sponsor1','4414856614566419','http://www.targetPage.com',3370,3303),(3383,0,'','https://goo.gl/IrU3gD',0,'VISA',123,'2023-12-04 00:00:00','sponsor2','4877161530824285','http://www.targetPage.com',3370,3308);
/*!40000 ALTER TABLE `sponsorship` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_account`
--

DROP TABLE IF EXISTS `user_account`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user_account` (
  `id` int(11) NOT NULL,
  `version` int(11) NOT NULL,
  `password` varchar(255) DEFAULT NULL,
  `username` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UK_castjbvpeeus0r8lbpehiu0e4` (`username`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_account`
--

LOCK TABLES `user_account` WRITE;
/*!40000 ALTER TABLE `user_account` DISABLE KEYS */;
INSERT INTO `user_account` (`id`, `version`, `password`, `username`) VALUES (3274,0,'21232f297a57a5a743894a0e4a801fc3','admin'),(3275,0,'479e3180a45b21ea8e88beb0c45aa8ed','brotherhood1'),(3276,0,'1b3231655cebb7a1f783eddf27d254ca','super'),(3277,0,'88f1b810c40cd63107fb758fef4d77db','brotherhood2'),(3278,0,'c7764cfed23c5ca3bb393308a0da2306','member1'),(3279,0,'88ed421f060aadcacbd63f28d889797f','member2'),(3280,0,'178494d73a41f7d68e80f685324d3662','chapter1'),(3281,0,'07a29f2348d728fad16c5260823f93ef','chapter2'),(3282,0,'42c63ad66d4dc07ed17753772bef96d6','sponsor1'),(3283,0,'3dc67f80a03324e01b1640f45d107485','sponsor2');
/*!40000 ALTER TABLE `user_account` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_account_authorities`
--

DROP TABLE IF EXISTS `user_account_authorities`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user_account_authorities` (
  `user_account` int(11) NOT NULL,
  `authority` varchar(255) DEFAULT NULL,
  KEY `FK_pao8cwh93fpccb0bx6ilq6gsl` (`user_account`),
  CONSTRAINT `FK_pao8cwh93fpccb0bx6ilq6gsl` FOREIGN KEY (`user_account`) REFERENCES `user_account` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_account_authorities`
--

LOCK TABLES `user_account_authorities` WRITE;
/*!40000 ALTER TABLE `user_account_authorities` DISABLE KEYS */;
INSERT INTO `user_account_authorities` (`user_account`, `authority`) VALUES (3274,'ADMIN'),(3275,'BROTHERHOOD'),(3276,'BROTHERHOOD'),(3277,'BROTHERHOOD'),(3278,'MEMBER'),(3279,'MEMBER'),(3280,'CHAPTER'),(3281,'CHAPTER'),(3282,'SPONSOR'),(3283,'SPONSOR');
/*!40000 ALTER TABLE `user_account_authorities` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2019-03-26 18:45:40

commit;