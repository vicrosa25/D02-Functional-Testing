drop database if exists `b9s59pemq0rbccbi8zil`;
CREATE DATABASE `b9s59pemq0rbccbi8zil` /*!40100 DEFAULT CHARACTER SET latin1 */;
USE `b9s59pemq0rbccbi8zil`;
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
INSERT INTO `actor_message_boxes` VALUES (3715,3716),(3715,3717),(3715,3718),(3715,3719),(3715,3720),(3722,3723),(3722,3724),(3722,3725),(3722,3726),(3722,3727),(3728,3729),(3728,3730),(3728,3731),(3728,3732),(3728,3733),(3734,3735),(3734,3736),(3734,3737),(3734,3738),(3734,3739),(3740,3741),(3740,3742),(3740,3743),(3740,3744),(3740,3745),(3746,3747),(3746,3748),(3746,3749),(3746,3750),(3746,3751),(3806,3760),(3806,3761),(3806,3762),(3806,3763),(3806,3764),(3807,3765),(3807,3766),(3807,3767),(3807,3768),(3807,3769),(3810,3770),(3810,3771),(3810,3772),(3810,3773),(3810,3774),(3811,3775),(3811,3776),(3811,3777),(3811,3778),(3811,3779);
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
INSERT INTO `administrator` VALUES (3715,0,'admin1 18','admin1@gmail.com',NULL,NULL,'middlename1','admin','+34656256697',NULL,NULL,'surname1','admin',3704);
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
INSERT INTO `area` VALUES (3798,0,'area1',3722),(3799,0,'area2',3728),(3800,0,'area3',NULL);
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
INSERT INTO `area_pictures` VALUES (3798,'https://www.visitasevilla.es/sites/default/files/styles/card_extended_page/public/extended_page/img_card_right/altozano_triana.jpg?itok=9W4ZVUUd',0),(3798,'https://ep01.epimg.net/elviajero/imagenes/2017/10/25/actualidad/1508938430_500364_1508945034_noticia_normal_recorte1.jpg',0),(3798,'https://sevillasecreta.co/wp-content/uploads/2016/08/triana.jpg',0),(3799,'https://i1.wp.com/bartapassevilla.com/wp-content/uploads/2017/10/centro-historico-de-sevilla-aerea.jpg?w=800',0),(3799,'https://i2.wp.com/bartapassevilla.com/wp-content/uploads/2015/11/Bares-de-tapas-en-el-centro-de-Sevilla.png?w=1024',0),(3799,'https://espanafascinante.com/wp-content/uploads/galeria_andalucia_sevilla_centro_setas-plaza_bi.jpeg',0);
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
INSERT INTO `brotherhood` VALUES (3810,0,NULL,'broterhood1@mail.com',NULL,NULL,NULL,'brotherhood1',NULL,NULL,NULL,'brotherhood1','brotherhood1',3705,'2019-01-30 00:00:00','brotherhood1',3798,3808),(3811,0,NULL,'broterhood2@mail.com',NULL,NULL,NULL,'brotherhood2',NULL,NULL,NULL,'brotherhood2','brotherhood2',3707,'2019-02-10 00:00:00','brotherhood2',3799,3809);
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
INSERT INTO `brotherhood_coaches` VALUES (3810,3785),(3811,3786);
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
INSERT INTO `chapter` VALUES (3722,0,'chapter1 18','chapter1@gmail.com',NULL,NULL,'chapter1','chapter1','+34656256697',NULL,NULL,'chapter1','chapter1',3710,'chapter1'),(3728,0,'chapter2 18','chapter2@gmail.com',NULL,NULL,'chapter2','chapter2','+34656256697',NULL,NULL,'chapter2','chapter2',3711,'chapter2'),(3734,0,'chapter3 18','chapter3@gmail.com',NULL,NULL,'chapter3','chapter3','+34656256697',NULL,NULL,'chapter3','chapter3',3714,'chapter3');
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
INSERT INTO `chapter_proclaims` VALUES (3722,3801),(3722,3802),(3728,3803),(3728,3804);
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
INSERT INTO `coach` VALUES (3785,0,'Description Coach 1','Title Coach 1'),(3786,0,'Description Coach 2','Title Coach 2'),(3787,0,'Description Coach 3','Title Coach 3'),(3788,0,'Description Coach 4','Title Coach 4');
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
INSERT INTO `configurations` VALUES (3805,0,1,'+34','Welcome to Acme Parade, the site to organise your parades.',10,10,'https://www.irishtimes.com/polopoly_fs/1.3426916.1521040386!/image/image.jpg_gen/derivatives/box_620_330/image.jpg','¡Bienvenidos a Acme Parade! Tu sitio para organizar desfiles.','Acme Madruga Co., Inc.',0.21);
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
INSERT INTO `configurations_brand_name` VALUES (3805,'VISA'),(3805,'MCARD'),(3805,'DINNERS'),(3805,'AMEX');
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
INSERT INTO `configurations_negative_words` VALUES (3805,'not'),(3805,'no'),(3805,'bad'),(3805,'malo'),(3805,'horrible'),(3805,'average'),(3805,'mediocre'),(3805,'disaster'),(3805,'desastre');
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
INSERT INTO `configurations_positive_words` VALUES (3805,'good'),(3805,'fantastic'),(3805,'excellent'),(3805,'great'),(3805,'amazing'),(3805,'terrific'),(3805,'beautiful'),(3805,'bueno'),(3805,'fantástico'),(3805,'excelente'),(3805,'gran'),(3805,'asombroso'),(3805,'terrible'),(3805,'bonito');
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
INSERT INTO `configurations_spam_words` VALUES (3805,'sex'),(3805,'viagra'),(3805,'cialis'),(3805,'one million'),(3805,'you\'ve been selected'),(3805,'Nigeria'),(3805,'sexo'),(3805,'un millón'),(3805,'ha sido seleccionado');
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
INSERT INTO `enrol` VALUES (3821,0,'2019-01-19 00:00:00',3810,3806),(3822,0,'2019-01-19 00:00:00',3811,3807),(3823,0,'2019-02-15 00:00:00',3810,3807);
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
INSERT INTO `finder` VALUES (3789,0,NULL,'2000-01-01 00:00:00',NULL,NULL,NULL),(3790,0,NULL,'2000-01-01 00:00:00',NULL,NULL,NULL);
/*!40000 ALTER TABLE `finder` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `finder_parades`
--

DROP TABLE IF EXISTS `finder_parades`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `finder_parades` (
  `finder` int(11) NOT NULL,
  `parades` int(11) NOT NULL,
  UNIQUE KEY `UK_a7t9ojmirwd7ijfq42ffessn5` (`parades`),
  KEY `FK_8pff5xgqq7qfh2ciyx24p67sp` (`finder`),
  CONSTRAINT `FK_8pff5xgqq7qfh2ciyx24p67sp` FOREIGN KEY (`finder`) REFERENCES `finder` (`id`),
  CONSTRAINT `FK_a7t9ojmirwd7ijfq42ffessn5` FOREIGN KEY (`parades`) REFERENCES `parade` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `finder_parades`
--

LOCK TABLES `finder_parades` WRITE;
/*!40000 ALTER TABLE `finder_parades` DISABLE KEYS */;
/*!40000 ALTER TABLE `finder_parades` ENABLE KEYS */;
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
INSERT INTO `hibernate_sequences` VALUES ('domain_entity',2);
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
INSERT INTO `history` VALUES (3808,0,3,3752),(3809,0,1,3753);
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
INSERT INTO `history_legal_records` VALUES (3808,3754),(3808,3755);
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
INSERT INTO `inception_record` VALUES (3752,0,'Inception record','Inception bro 1'),(3753,0,'Inception record','Inception bro 2');
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
INSERT INTO `legal_record` VALUES (3754,0,'Legal record','Legal bro 1','Laws','Legal name 1',0.21),(3755,0,'Legal record','Legal bro 2','Laws','Legal name 2',0.21);
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
INSERT INTO `member` VALUES (3806,0,NULL,'member1@mail.com',NULL,NULL,NULL,'member1',NULL,NULL,NULL,'member1','member1',3708,3789),(3807,0,NULL,'member2@mail.com',NULL,NULL,NULL,'member2',NULL,NULL,NULL,'member2','member2',3709,3790);
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
INSERT INTO `message` VALUES (3780,1,'body example',NULL,'2019-02-12 00:00:00','LOW','subject example',3810),(3781,0,'You have to use cialis',NULL,'2019-02-12 00:00:00','LOW','subject example',3740),(3782,1,'You have to use viagra',NULL,'2019-02-12 00:00:00','LOW','subject example',3806),(3783,0,'This is fantastic, amazing',NULL,'2019-02-12 00:00:00','LOW','subject example',3722),(3784,1,'This is bad, horrible',NULL,'2019-02-12 00:00:00','LOW','subject example',3811),(32768,1,'The brotherhood brotherhood2 has published a parade called asdasdasd.','','2019-07-17 19:35:23','MEDIUM','New parade by brotherhood2',3811),(32770,1,'The brotherhood brotherhood2 has published a parade called asdasdasd.','','2019-07-17 19:35:26','MEDIUM','New parade by brotherhood2',3811);
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
INSERT INTO `message_box` VALUES (3716,0,'','spam'),(3717,0,'','in'),(3718,0,'','out'),(3719,0,'','trash'),(3720,0,'','notification'),(3723,0,'','spam'),(3724,0,'','in'),(3725,0,'','out'),(3726,0,'','trash'),(3727,0,'','notification'),(3729,0,'','spam'),(3730,0,'','in'),(3731,0,'','out'),(3732,0,'','trash'),(3733,0,'','notification'),(3735,0,'','spam'),(3736,0,'','in'),(3737,0,'','out'),(3738,0,'','trash'),(3739,0,'','notification'),(3741,0,'','spam'),(3742,0,'','in'),(3743,0,'','out'),(3744,0,'','trash'),(3745,0,'','notification'),(3747,0,'','spam'),(3748,0,'','in'),(3749,0,'','out'),(3750,0,'','trash'),(3751,0,'','notification'),(3760,0,'','in'),(3761,0,'','out'),(3762,0,'','spam'),(3763,0,'','notification'),(3764,0,'','trash'),(3765,0,'','in'),(3766,0,'','out'),(3767,0,'','spam'),(3768,2,'','notification'),(3769,0,'','trash'),(3770,0,'','in'),(3771,0,'','out'),(3772,0,'','spam'),(3773,0,'','notification'),(3774,0,'','trash'),(3775,0,'','in'),(3776,2,'','out'),(3777,0,'','spam'),(3778,0,'','notification'),(3779,0,'','trash');
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
INSERT INTO `message_box_messages` VALUES (3724,3780),(3725,3783),(3730,3780),(3730,3783),(3743,3781),(3747,3781),(3761,3782),(3767,3782),(3770,3784),(3771,3780),(3775,3780),(3768,32768),(3768,32770),(3776,3784),(3776,32768),(3776,32770);
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
INSERT INTO `message_message_boxes` VALUES (3780,3771),(3780,3775),(3781,3743),(3781,3747),(3782,3761),(3782,3767),(3783,3725),(3783,3730),(3784,3776),(3784,3770),(32768,3765),(32768,3776),(32768,3768),(32770,3765),(32770,3776),(32770,3768);
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
INSERT INTO `message_recipients` VALUES (3780,3811),(3781,3746),(3782,3807),(3783,3728),(3784,3810),(32768,3807),(32770,3807);
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
-- Table structure for table `parade`
--

DROP TABLE IF EXISTS `parade`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `parade` (
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
  UNIQUE KEY `UK_5yuq215wrvxtjvi0gjynv32g7` (`ticker`),
  KEY `FK_kdqyp1ypu4jvmvlxb5d1cvrx3` (`brotherhood`),
  KEY `FK_pglhlf5kk68yy28whjkiagpw3` (`path`),
  CONSTRAINT `FK_pglhlf5kk68yy28whjkiagpw3` FOREIGN KEY (`path`) REFERENCES `path` (`id`),
  CONSTRAINT `FK_kdqyp1ypu4jvmvlxb5d1cvrx3` FOREIGN KEY (`brotherhood`) REFERENCES `brotherhood` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `parade`
--

LOCK TABLES `parade` WRITE;
/*!40000 ALTER TABLE `parade` DISABLE KEYS */;
INSERT INTO `parade` VALUES (3812,1,'parade1 description','\0','2019-10-01 00:00:00',NULL,'APPROVED','190210-AAAAA','parade1',3810,3818),(32769,0,'asdasdasd','\0','2019-10-01 00:00:00',NULL,'SUBMITTED','190717-9GPSS','asdasdasd',3811,NULL),(32771,0,'asdasdasd','','2019-10-01 00:00:00',NULL,NULL,'190717-V5VUC','asdasdasd',3811,NULL);
/*!40000 ALTER TABLE `parade` ENABLE KEYS */;
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
  `parade` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UK_djnqe44ogp0g3d9tdyd6mg7s3` (`parade`),
  CONSTRAINT `FK_djnqe44ogp0g3d9tdyd6mg7s3` FOREIGN KEY (`parade`) REFERENCES `parade` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `path`
--

LOCK TABLES `path` WRITE;
/*!40000 ALTER TABLE `path` DISABLE KEYS */;
INSERT INTO `path` VALUES (3818,0,3812);
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
INSERT INTO `position` VALUES (3791,0,'President','Presidente'),(3792,0,'Vice President','Vicepresidente'),(3793,0,'Secretary','Secretario'),(3794,0,'Treasurer','Tesorero'),(3795,0,'Historian','Historiador'),(3796,0,'Fundraiser','Promotor'),(3797,0,'Officer','Vocal');
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
INSERT INTO `position_enrol` VALUES (3791,3821),(3791,3822),(3793,3823);
/*!40000 ALTER TABLE `position_enrol` ENABLE KEYS */;
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
INSERT INTO `proclaim` VALUES (3801,0,'2019-03-12 00:00:00','New proclaim1'),(3802,0,'2019-01-12 00:00:00','New proclaim2'),(3803,0,'2019-02-20 00:00:00','New proclaim3'),(3804,0,'2019-01-09 00:00:00','New proclaim4');
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
  `parade` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_hgv8wexlup4hjaqo4ki13th8v` (`member`),
  KEY `FK_69jhubt9asf03c38l84e802le` (`parade`),
  CONSTRAINT `FK_69jhubt9asf03c38l84e802le` FOREIGN KEY (`parade`) REFERENCES `parade` (`id`),
  CONSTRAINT `FK_hgv8wexlup4hjaqo4ki13th8v` FOREIGN KEY (`member`) REFERENCES `member` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `request`
--

LOCK TABLES `request` WRITE;
/*!40000 ALTER TABLE `request` DISABLE KEYS */;
INSERT INTO `request` VALUES (3813,0,2,2,NULL,'APPROVED',3806,3812),(3814,0,NULL,NULL,NULL,'PENDING',3807,3812);
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
INSERT INTO `segment` VALUES (3819,0,10.5,10.5,'2019-06-19 19:00:00',0,0.5,0.5,'2019-06-19 18:00:00',3818),(3820,0,20.5,20.5,'2019-06-19 20:00:00',1,10.5,10.5,'2019-06-19 19:05:00',3818);
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
INSERT INTO `social_identity` VALUES (3721,0,'http://www.facebook/admin1','admin','facebook',3715),(3756,1,'http://www.facebook/member1','member1','facebook',3806),(3757,1,'http://www.facebook/member2','member2','facebook',3807),(3758,1,'http://www.facebook/brotherhood1','brotherhood1','facebook',3810),(3759,1,'http://www.facebook/brotherhood2','brotherhood2','facebook',3811);
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
INSERT INTO `sponsor` VALUES (3740,0,'sponsor1 7474','sponsor1@gmail.com',NULL,NULL,'middlename1','sponsor1','656278997',NULL,NULL,'surname1','sponsor1',3712),(3746,0,'sponsor2 7474','sponsor2@gmail.com',NULL,NULL,'mddlnm2','sponsor2','656274521',NULL,NULL,'surname2',NULL,3713);
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
  `parade` int(11) NOT NULL,
  `sponsor` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_4ngakrolee2xy93wibkm3tr52` (`parade`),
  KEY `FK_huglhkud0ihqdljyou4eshra6` (`sponsor`),
  CONSTRAINT `FK_huglhkud0ihqdljyou4eshra6` FOREIGN KEY (`sponsor`) REFERENCES `sponsor` (`id`),
  CONSTRAINT `FK_4ngakrolee2xy93wibkm3tr52` FOREIGN KEY (`parade`) REFERENCES `parade` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sponsorship`
--

LOCK TABLES `sponsorship` WRITE;
/*!40000 ALTER TABLE `sponsorship` DISABLE KEYS */;
INSERT INTO `sponsorship` VALUES (3824,0,'','https://goo.gl/mR1tJ6',0,'VISA',123,'2015-12-02 00:00:00','sponsor1','4414856614566419','http://www.targetPage.com',3812,3740),(3825,0,'','https://goo.gl/IrU3gD',0,'VISA',123,'2023-12-04 00:00:00','sponsor2','4877161530824285','http://www.targetPage.com',3812,3746);
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
INSERT INTO `user_account` VALUES (3704,0,'21232f297a57a5a743894a0e4a801fc3','admin'),(3705,0,'479e3180a45b21ea8e88beb0c45aa8ed','brotherhood1'),(3706,0,'1b3231655cebb7a1f783eddf27d254ca','super'),(3707,0,'88f1b810c40cd63107fb758fef4d77db','brotherhood2'),(3708,0,'c7764cfed23c5ca3bb393308a0da2306','member1'),(3709,0,'88ed421f060aadcacbd63f28d889797f','member2'),(3710,0,'178494d73a41f7d68e80f685324d3662','chapter1'),(3711,0,'07a29f2348d728fad16c5260823f93ef','chapter2'),(3712,0,'42c63ad66d4dc07ed17753772bef96d6','sponsor1'),(3713,0,'3dc67f80a03324e01b1640f45d107485','sponsor2'),(3714,0,'4cf7b4e4bb6d429f0f08bc498e397d81','chapter3');
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
INSERT INTO `user_account_authorities` VALUES (3704,'ADMIN'),(3705,'BROTHERHOOD'),(3706,'BROTHERHOOD'),(3707,'BROTHERHOOD'),(3708,'MEMBER'),(3709,'MEMBER'),(3710,'CHAPTER'),(3711,'CHAPTER'),(3712,'SPONSOR'),(3713,'SPONSOR'),(3714,'CHAPTER');
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

-- Dump completed on 2019-07-17 19:45:51
