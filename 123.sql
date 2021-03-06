-- MariaDB dump 10.19  Distrib 10.5.10-MariaDB, for debian-linux-gnu (x86_64)
--
-- Host: localhost    Database: db_factory
-- ------------------------------------------------------
-- Server version	10.5.10-MariaDB-2

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
-- Table structure for table `f_bid`
--

DROP TABLE IF EXISTS `f_bid`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `f_bid` (
  `fb_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `fb_fid` bigint(20) NOT NULL,
  `fb_state` varchar(10) NOT NULL,
  `fb_finish_time` date NOT NULL,
  `fb_bid_price` double NOT NULL,
  `fb_num` bigint(20) unsigned NOT NULL,
  `fb_oid` bigint(20) NOT NULL,
  PRIMARY KEY (`fb_id`),
  KEY `f_bid_FK` (`fb_fid`),
  KEY `f_bid_FK_1` (`fb_oid`),
  CONSTRAINT `f_bid_FK` FOREIGN KEY (`fb_fid`) REFERENCES `f_factory` (`ff_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `f_bid_FK_1` FOREIGN KEY (`fb_oid`) REFERENCES `f_morder` (`fmo_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `f_bid`
--

LOCK TABLES `f_bid` WRITE;
/*!40000 ALTER TABLE `f_bid` DISABLE KEYS */;
/*!40000 ALTER TABLE `f_bid` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `f_bid_win`
--

DROP TABLE IF EXISTS `f_bid_win`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `f_bid_win` (
  `fbw_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `fbw_oid` bigint(20) NOT NULL,
  `fbw_bid` bigint(20) NOT NULL,
  PRIMARY KEY (`fbw_id`),
  KEY `f_bid_win_FK` (`fbw_bid`),
  KEY `f_bid_win_FK_1` (`fbw_oid`),
  CONSTRAINT `f_bid_win_FK` FOREIGN KEY (`fbw_bid`) REFERENCES `f_bid` (`fb_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `f_bid_win_FK_1` FOREIGN KEY (`fbw_oid`) REFERENCES `f_morder` (`fmo_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `f_bid_win`
--

LOCK TABLES `f_bid_win` WRITE;
/*!40000 ALTER TABLE `f_bid_win` DISABLE KEYS */;
/*!40000 ALTER TABLE `f_bid_win` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `f_facility`
--

DROP TABLE IF EXISTS `f_facility`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `f_facility` (
  `ffacility_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `ff_code` varchar(100) NOT NULL,
  `ffacility_name` varchar(100) NOT NULL,
  `ff_length` bigint(20) NOT NULL,
  `ff_width` bigint(20) NOT NULL,
  `ff_height` bigint(20) NOT NULL,
  `ff_type_id` bigint(20) NOT NULL,
  `ff_info` text DEFAULT NULL,
  `gmt_modified` datetime NOT NULL DEFAULT current_timestamp(),
  `gmt_created` datetime DEFAULT current_timestamp(),
  `deleted` int(11) DEFAULT 0,
  PRIMARY KEY (`ffacility_id`),
  KEY `f_facility_FK` (`ff_type_id`),
  CONSTRAINT `f_facility_FK` FOREIGN KEY (`ff_type_id`) REFERENCES `f_facility_type` (`fft_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `f_facility_CHECK` CHECK (`ff_length` > 0),
  CONSTRAINT `f_facility_CHECK2` CHECK (`ff_width` > 0),
  CONSTRAINT `f_facility_CHECK3` CHECK (`ff_height` > 0)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `f_facility`
--

LOCK TABLES `f_facility` WRITE;
/*!40000 ALTER TABLE `f_facility` DISABLE KEYS */;
INSERT INTO `f_facility` VALUES (1,'D01','D01',100,80,120,1,NULL,'2021-07-14 21:19:06','2021-07-14 21:19:06',0),(2,'B01','B01',220,340,180,1,NULL,'2021-07-14 21:19:06','2021-07-14 21:19:06',0),(3,'P01','P01',390,390,180,1,'???????????????','2021-07-14 21:19:06','2021-07-14 21:19:06',0),(4,'P11','P11',400,280,390,2,'???????????????','2021-07-14 21:19:06','2021-07-14 21:19:06',0),(5,'D02','D02',120,100,110,1,NULL,'2021-07-14 21:19:06','2021-07-14 21:19:06',0),(6,'P02','P02',300,275,300,1,'???????????????','2021-07-14 21:19:06','2021-07-14 21:19:06',0),(7,'P03','P03',50,50,50,2,'???????????????','2021-07-14 21:19:06','2021-07-14 21:19:06',0),(8,'P04','P03',10,20,10,1,'???????????????','2021-07-14 21:19:06','2021-07-14 21:19:06',0),(9,'P007','????????????',10,50,20,3,'????????????','2021-07-15 08:10:42','2021-07-15 08:10:42',0),(10,'????????????-P009','??????????????????',20,10,20,3,'?????????????????????owo','2021-07-15 08:26:19','2021-07-15 08:26:19',0);
/*!40000 ALTER TABLE `f_facility` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'IGNORE_SPACE,STRICT_TRANS_TABLES,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER deleteobj
BEFORE UPDATE 
ON f_facility FOR EACH ROW
BEGIN 
	DECLARE check_fpf int;
	DECLARE check_fff int;
	IF new.deleted = 1 THEN 
		SELECT COUNT(*) INTO check_fpf FROM db_factory.f_pfacility WHERE fpf_id = new.ffacility_id AND fpf_state = "?????????";
		SELECT COUNT(*) INTO check_fff FROM db_factory.f_ffacility WHERE fff_id = new.ffacility_id AND fff_src <> "??????" AND fff_state = "??????";
	
		IF check_fpf = 0 AND check_fff = 0 THEN 
			insert into temp VALUES(1);
		ELSE
			UPDATE db_factory.f_ffacility SET fff_state = "?????????", deleted = 1 WHERE fff_id = new.ffacility_id;
			UPDATE db_factory.f_pfacility SET fpf_state = "?????????", deleted = 1 WHERE fpf_id = new.ffacility_id;
		END IF;
	ELSE
		IF new.deleted <> old.deleted THEN
			UPDATE db_factory.f_ffacility SET fff_state = "??????", deleted = 0 WHERE fff_id = new.ffacility_id;
			UPDATE db_factory.f_pfacility SET fpf_state = "?????????", deleted = 0 WHERE fpf_id = new.ffacility_id;
		END IF;
	END IF;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `f_facility_type`
--

DROP TABLE IF EXISTS `f_facility_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `f_facility_type` (
  `fft_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `fft_name` varchar(100) NOT NULL,
  PRIMARY KEY (`fft_id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `f_facility_type`
--

LOCK TABLES `f_facility_type` WRITE;
/*!40000 ALTER TABLE `f_facility_type` DISABLE KEYS */;
INSERT INTO `f_facility_type` VALUES (1,'??????'),(2,'??????'),(3,'??????');
/*!40000 ALTER TABLE `f_facility_type` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'IGNORE_SPACE,STRICT_TRANS_TABLES,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER deleteObj
BEFORE DELETE
ON f_facility_type FOR EACH ROW
BEGIN 
	
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `f_factory`
--

DROP TABLE IF EXISTS `f_factory`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `f_factory` (
  `ff_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `ff_oid` bigint(20) NOT NULL,
  `ff_name` varchar(100) NOT NULL,
  `ff_state` varchar(255) DEFAULT '?????????',
  `ff_info` text DEFAULT NULL,
  `gmt_created` datetime DEFAULT current_timestamp(),
  `gmt_modified` datetime DEFAULT current_timestamp(),
  `deleted` int(11) DEFAULT 0,
  PRIMARY KEY (`ff_id`),
  KEY `f_factory_FK_1` (`ff_oid`),
  CONSTRAINT `f_factory_FK_1` FOREIGN KEY (`ff_oid`) REFERENCES `f_user` (`fu_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `f_factory`
--

LOCK TABLES `f_factory` WRITE;
/*!40000 ALTER TABLE `f_factory` DISABLE KEYS */;
INSERT INTO `f_factory` VALUES (1,6,'???????????????','?????????','????????????????????????????????????','2021-07-14 21:20:58','2021-07-14 21:20:58',0),(2,5,'??????????????????','?????????',NULL,'2021-07-14 21:20:58','2021-07-14 21:20:58',0),(3,4,'???????????????','?????????','???????????????????????????????????????????????????','2021-07-14 21:20:58','2021-07-14 21:20:58',0),(4,10,'?????????????????????','?????????','?????????????????????????????????','2021-07-14 21:20:58','2021-07-14 21:20:58',0),(5,12,':)????????????','?????????','?????????','2021-07-14 21:20:58','2021-07-14 21:20:58',0),(10,13,'??????????????????','?????????','????????????????????????','2021-07-14 21:20:58','2021-07-14 21:20:58',0);
/*!40000 ALTER TABLE `f_factory` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `f_ffacility`
--

DROP TABLE IF EXISTS `f_ffacility`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `f_ffacility` (
  `fff_nid` bigint(20) NOT NULL AUTO_INCREMENT,
  `fff_id` bigint(20) NOT NULL COMMENT '??????ID',
  `fff_state` varchar(10) NOT NULL DEFAULT '??????' COMMENT '1????????????2????????????3?????????',
  `fff_src` varchar(100) NOT NULL,
  `fff_fid` bigint(20) NOT NULL COMMENT '??????id',
  `deleted` int(11) DEFAULT 0,
  PRIMARY KEY (`fff_id`,`fff_fid`),
  UNIQUE KEY `f_ffacility_UN` (`fff_nid`),
  KEY `f_ffacility_FK_1` (`fff_fid`),
  CONSTRAINT `f_ffacility_FK` FOREIGN KEY (`fff_id`) REFERENCES `f_facility` (`ffacility_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `f_ffacility_FK_1` FOREIGN KEY (`fff_fid`) REFERENCES `f_factory` (`ff_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `f_ffacility`
--

LOCK TABLES `f_ffacility` WRITE;
/*!40000 ALTER TABLE `f_ffacility` DISABLE KEYS */;
INSERT INTO `f_ffacility` VALUES (1,1,'??????','?????????',1,0),(2,2,'??????','?????????',1,0),(3,4,'??????','??????',2,0),(4,6,'??????','??????',2,0);
/*!40000 ALTER TABLE `f_ffacility` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `f_forder`
--

DROP TABLE IF EXISTS `f_forder`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `f_forder` (
  `ffo_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `ffo_fid` bigint(20) NOT NULL,
  `ffo_oid` bigint(20) NOT NULL,
  PRIMARY KEY (`ffo_id`),
  KEY `f_forder_FK` (`ffo_fid`),
  KEY `f_forder_FK_1` (`ffo_oid`),
  CONSTRAINT `f_forder_FK` FOREIGN KEY (`ffo_fid`) REFERENCES `f_factory` (`ff_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `f_forder_FK_1` FOREIGN KEY (`ffo_oid`) REFERENCES `f_morder` (`fmo_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `f_forder`
--

LOCK TABLES `f_forder` WRITE;
/*!40000 ALTER TABLE `f_forder` DISABLE KEYS */;
/*!40000 ALTER TABLE `f_forder` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `f_gen_ability`
--

DROP TABLE IF EXISTS `f_gen_ability`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `f_gen_ability` (
  `fga_fid` bigint(20) NOT NULL,
  `fga_pid` bigint(20) NOT NULL,
  `fga_gnum_pb` bigint(20) unsigned NOT NULL,
  KEY `f_gen_ability_FK_1` (`fga_pid`),
  KEY `fast_indx` (`fga_fid`,`fga_pid`),
  CONSTRAINT `f_gen_ability_FK` FOREIGN KEY (`fga_fid`) REFERENCES `f_facility` (`ffacility_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `f_gen_ability_FK_1` FOREIGN KEY (`fga_pid`) REFERENCES `f_product` (`fp_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `f_gen_ability`
--

LOCK TABLES `f_gen_ability` WRITE;
/*!40000 ALTER TABLE `f_gen_ability` DISABLE KEYS */;
INSERT INTO `f_gen_ability` VALUES (1,1,100),(1,2,199),(1,3,99),(4,1,8),(4,4,11);
/*!40000 ALTER TABLE `f_gen_ability` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `f_morder`
--

DROP TABLE IF EXISTS `f_morder`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `f_morder` (
  `fmo_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `fmo_code` varchar(100) NOT NULL,
  `fmo_uri_id` bigint(20) NOT NULL,
  `fmo_uid` bigint(20) NOT NULL,
  `fmo_state` varchar(10) DEFAULT '?????????',
  `fmo_finish_day` date NOT NULL,
  `fmo_bid_finish_day` date NOT NULL,
  `fmo_pid` bigint(20) NOT NULL,
  `fmo_pnum` bigint(20) unsigned NOT NULL,
  PRIMARY KEY (`fmo_id`),
  UNIQUE KEY `f_morder_UN` (`fmo_code`),
  KEY `f_morder_FK` (`fmo_uri_id`),
  KEY `f_morder_FK_1` (`fmo_uid`),
  KEY `f_morder_FK_2` (`fmo_pid`),
  CONSTRAINT `f_morder_FK` FOREIGN KEY (`fmo_uri_id`) REFERENCES `f_ureceive_info` (`furi_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `f_morder_FK_1` FOREIGN KEY (`fmo_uid`) REFERENCES `f_user` (`fu_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `f_morder_FK_2` FOREIGN KEY (`fmo_pid`) REFERENCES `f_product` (`fp_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `f_morder`
--

LOCK TABLES `f_morder` WRITE;
/*!40000 ALTER TABLE `f_morder` DISABLE KEYS */;
INSERT INTO `f_morder` VALUES (1,'O-001',3,1,'?????????','2022-09-01','2021-07-31',1,100),(2,'O-003',3,1,'?????????','2022-09-01','2021-07-31',1,100),(3,'O-004',3,1,'?????????','2022-09-01','2021-07-31',1,100),(4,'O-005',3,1,'?????????','2022-09-01','2021-07-31',1,100),(5,'O-006',3,1,'?????????','2022-09-01','2021-07-31',1,100),(6,'O-002',3,1,'?????????','2022-09-01','2021-07-31',1,100);
/*!40000 ALTER TABLE `f_morder` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `f_pfacility`
--

DROP TABLE IF EXISTS `f_pfacility`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `f_pfacility` (
  `fpf_rentId` bigint(20) NOT NULL AUTO_INCREMENT,
  `fpf_id` bigint(20) NOT NULL COMMENT '??????ID',
  `fpf_state` varchar(11) NOT NULL COMMENT '0???????????????1???????????????2?????????????????????3???????????????',
  `fpf_fid` bigint(20) DEFAULT NULL COMMENT '????????????ID??????????????????',
  `deleted` int(11) DEFAULT 0,
  PRIMARY KEY (`fpf_id`,`fpf_state`),
  UNIQUE KEY `f_pfacility_UN` (`fpf_rentId`),
  KEY `f_pfacility_FK` (`fpf_fid`),
  CONSTRAINT `f_pfacility_FK` FOREIGN KEY (`fpf_fid`) REFERENCES `f_factory` (`ff_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `f_pfacility_FK_1` FOREIGN KEY (`fpf_id`) REFERENCES `f_facility` (`ffacility_id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `f_pfacility`
--

LOCK TABLES `f_pfacility` WRITE;
/*!40000 ALTER TABLE `f_pfacility` DISABLE KEYS */;
INSERT INTO `f_pfacility` VALUES (1,3,'?????????',NULL,0),(2,4,'?????????',2,0),(3,6,'?????????',2,0),(4,7,'?????????',NULL,0),(5,8,'?????????',NULL,0),(6,9,'?????????',NULL,0),(7,10,'?????????',NULL,0);
/*!40000 ALTER TABLE `f_pfacility` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `f_product`
--

DROP TABLE IF EXISTS `f_product`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `f_product` (
  `fp_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `fp_code` varchar(100) NOT NULL,
  `fp_name` varchar(100) NOT NULL,
  `fp_type_id` bigint(20) NOT NULL,
  `fp_length` bigint(20) unsigned NOT NULL,
  `fp_witdth` bigint(20) unsigned NOT NULL,
  `fp_height` bigint(20) unsigned NOT NULL,
  `fp_info` varchar(100) DEFAULT NULL,
  `gmt_create` datetime DEFAULT current_timestamp(),
  `gmt_modified` datetime DEFAULT current_timestamp(),
  `deleted` int(11) DEFAULT 0,
  PRIMARY KEY (`fp_id`),
  KEY `f_product_FK` (`fp_type_id`),
  CONSTRAINT `f_product_FK` FOREIGN KEY (`fp_type_id`) REFERENCES `f_product_type` (`fpt_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `f_product`
--

LOCK TABLES `f_product` WRITE;
/*!40000 ALTER TABLE `f_product` DISABLE KEYS */;
INSERT INTO `f_product` VALUES (1,'T001','??????????????????',3,8,5,10,'?????????????????????','2021-07-14 21:21:51','2021-07-14 21:21:51',0),(2,'T002','????????????',4,5,5,5,NULL,'2021-07-14 21:21:51','2021-07-14 21:21:51',0),(3,'T003','?????????',5,5,6,5,NULL,'2021-07-14 21:21:51','2021-07-14 21:21:51',0),(4,'T004','????????????',10,10,8,10,NULL,'2021-07-14 21:21:51','2021-07-14 21:21:51',0),(5,'T010','???????????????????????????',9,99,99,99,'????????????,??????',NULL,NULL,0),(6,'Test01','az',10,1,1,1,NULL,NULL,NULL,1),(7,'Test02','?????????',10,12,223,33,NULL,NULL,NULL,1),(8,'Test03','????????????',4,33,33,33,'',NULL,NULL,1);
/*!40000 ALTER TABLE `f_product` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'IGNORE_SPACE,STRICT_TRANS_TABLES,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER deleteproduct
BEFORE UPDATE
ON f_product FOR EACH ROW
BEGIN 
	DECLARE deletable1 int;
	DECLARE deletable2 int;

	IF new.deleted = 1 THEN 
		SELECT COUNT(*) INTO deletable1 FROM db_factory.f_gen_ability WHERE fga_pid = new.fp_id;
		SELECT COUNT(*) INTO deletable2 FROM db_factory.f_morder WHERE fmo_pid = new.fp_id;
		IF deletable1 <> 0 OR deletable2 <> 0 THEN 
			insert into temp VALUES(1);
		END IF;
	END IF;

END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `f_product_type`
--

DROP TABLE IF EXISTS `f_product_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `f_product_type` (
  `fpt_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `fpt_name` varchar(100) NOT NULL,
  `fpt_pid` bigint(20) NOT NULL,
  PRIMARY KEY (`fpt_id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `f_product_type`
--

LOCK TABLES `f_product_type` WRITE;
/*!40000 ALTER TABLE `f_product_type` DISABLE KEYS */;
INSERT INTO `f_product_type` VALUES (1,'??????',1),(2,'??????',1),(3,'????????????',2),(4,'??????',2),(5,'??????',2),(8,'??????',1),(9,'??????',8),(10,'??????',8);
/*!40000 ALTER TABLE `f_product_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `f_product_type_1`
--

DROP TABLE IF EXISTS `f_product_type_1`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `f_product_type_1` (
  `fpt_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `fpt_name` varchar(100) NOT NULL,
  `fpt_pid` bigint(20) NOT NULL,
  PRIMARY KEY (`fpt_id`),
  KEY `f_product_type_1_FK` (`fpt_pid`),
  CONSTRAINT `f_product_type_1_FK` FOREIGN KEY (`fpt_pid`) REFERENCES `f_product_type_2` (`fpt_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `f_product_type_1`
--

LOCK TABLES `f_product_type_1` WRITE;
/*!40000 ALTER TABLE `f_product_type_1` DISABLE KEYS */;
/*!40000 ALTER TABLE `f_product_type_1` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `f_product_type_2`
--

DROP TABLE IF EXISTS `f_product_type_2`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `f_product_type_2` (
  `fpt_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `fpt_name` varchar(100) NOT NULL,
  `fpt_pid` bigint(20) NOT NULL,
  PRIMARY KEY (`fpt_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `f_product_type_2`
--

LOCK TABLES `f_product_type_2` WRITE;
/*!40000 ALTER TABLE `f_product_type_2` DISABLE KEYS */;
/*!40000 ALTER TABLE `f_product_type_2` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `f_register_type`
--

DROP TABLE IF EXISTS `f_register_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `f_register_type` (
  `fr_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `fr_name` varchar(100) NOT NULL,
  PRIMARY KEY (`fr_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `f_register_type`
--

LOCK TABLES `f_register_type` WRITE;
/*!40000 ALTER TABLE `f_register_type` DISABLE KEYS */;
INSERT INTO `f_register_type` VALUES (1,'?????????'),(2,'?????????'),(3,'???????????????');
/*!40000 ALTER TABLE `f_register_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `f_schedule`
--

DROP TABLE IF EXISTS `f_schedule`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `f_schedule` (
  `fs_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `fs_factory_id` bigint(20) NOT NULL,
  `fs_facility_id` bigint(20) NOT NULL,
  `fs_foid` bigint(20) NOT NULL,
  `fs_start_day` date NOT NULL,
  `fs_end_day` date NOT NULL,
  PRIMARY KEY (`fs_id`),
  KEY `f_schedule_FK` (`fs_factory_id`),
  KEY `f_schedule_FK_1` (`fs_facility_id`),
  KEY `f_schedule_FK_2` (`fs_foid`),
  CONSTRAINT `f_schedule_FK` FOREIGN KEY (`fs_factory_id`) REFERENCES `f_factory` (`ff_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `f_schedule_FK_1` FOREIGN KEY (`fs_facility_id`) REFERENCES `f_facility` (`ffacility_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `f_schedule_FK_2` FOREIGN KEY (`fs_foid`) REFERENCES `f_forder` (`ffo_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `f_schedule`
--

LOCK TABLES `f_schedule` WRITE;
/*!40000 ALTER TABLE `f_schedule` DISABLE KEYS */;
/*!40000 ALTER TABLE `f_schedule` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `f_ureceive_info`
--

DROP TABLE IF EXISTS `f_ureceive_info`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `f_ureceive_info` (
  `furi_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `furi_uid` bigint(20) NOT NULL,
  `furi_phone` varchar(100) NOT NULL,
  `furi_addr` varchar(100) NOT NULL,
  PRIMARY KEY (`furi_id`,`furi_uid`),
  KEY `f_ureceive_info_FK` (`furi_uid`),
  CONSTRAINT `f_ureceive_info_FK` FOREIGN KEY (`furi_uid`) REFERENCES `f_user` (`fu_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `f_ureceive_info`
--

LOCK TABLES `f_ureceive_info` WRITE;
/*!40000 ALTER TABLE `f_ureceive_info` DISABLE KEYS */;
INSERT INTO `f_ureceive_info` VALUES (1,1,'123123123','???????????????????????????'),(2,2,'123123123123','???????????????'),(3,1,'9999999999','???????????????'),(4,6,'12312333123','????????????'),(5,6,'3333333333','???????????????');
/*!40000 ALTER TABLE `f_ureceive_info` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `f_user`
--

DROP TABLE IF EXISTS `f_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `f_user` (
  `fu_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `fu_name` varchar(100) NOT NULL,
  `fu_psw` varchar(100) NOT NULL,
  `fu_rname` varchar(100) DEFAULT NULL,
  `fu_type_id` bigint(20) NOT NULL,
  `gmt_modified` datetime DEFAULT current_timestamp(),
  `gmt_create` datetime DEFAULT current_timestamp(),
  `deleted` int(1) DEFAULT 0,
  PRIMARY KEY (`fu_id`),
  UNIQUE KEY `f_user_UN` (`fu_name`),
  KEY `f_user_FK` (`fu_type_id`),
  CONSTRAINT `f_user_FK` FOREIGN KEY (`fu_type_id`) REFERENCES `f_register_type` (`fr_id`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `f_user`
--

LOCK TABLES `f_user` WRITE;
/*!40000 ALTER TABLE `f_user` DISABLE KEYS */;
INSERT INTO `f_user` VALUES (1,'??????','1234567','?????????',2,'2021-07-12 06:44:16','2021-07-12 06:44:16',0),(2,'??????','123123','?????????',2,'2021-07-12 06:44:16','2021-07-12 06:44:16',0),(4,'??????','111222','????????????',1,'2021-07-12 06:44:16','2021-07-12 06:44:16',0),(5,'?????????','111111','?????????',1,'2021-07-12 06:44:16','2021-07-12 06:44:16',0),(6,'??????','22222','?????????',1,'2021-07-12 06:44:16','2021-07-12 06:44:16',0),(7,'??????','99999','??????',1,'2021-07-12 06:44:16','2021-07-12 06:44:16',0),(9,'admin','admin','admin',3,'2021-07-12 06:44:16','2021-07-12 06:44:16',0),(10,'???????????????','101010','??????',1,'2021-07-12 06:44:16','2021-07-12 06:44:16',0),(11,'?????????','787895','???????????????',2,'2021-07-12 06:44:16','2021-07-12 06:44:16',0),(12,':)','9456123','+_+',1,'2021-07-12 06:44:16','2021-07-12 06:44:16',0),(13,'????????????yyds','101010','??????',1,'2021-07-12 06:44:16','2021-07-12 06:44:16',0),(14,'?????????????????????????????????','111333','?????????',1,'2021-07-14 00:46:11','2021-07-14 00:46:08',1),(15,'????????????','123123','????????????',2,'2021-07-14 04:56:23','2021-07-14 04:56:23',0),(16,'????????????2','123123','??????',2,'2021-07-14 04:57:11','2021-07-14 04:57:11',0),(17,'????????????3','123123','?????????',2,'2021-07-14 05:02:15','2021-07-14 05:02:15',0),(18,'????????????4','123123','?????????',2,'2021-07-14 05:03:19','2021-07-14 05:03:19',0),(19,'????????????5','123123','?????????',2,'2021-07-14 05:05:05','2021-07-14 05:05:05',0),(20,'????????????6','123123','????????????',2,'2021-07-14 08:39:51','2021-07-14 08:39:51',0);
/*!40000 ALTER TABLE `f_user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `f_user_phone`
--

DROP TABLE IF EXISTS `f_user_phone`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `f_user_phone` (
  `fup_uid` bigint(20) NOT NULL,
  `fup_phonenum` varchar(100) NOT NULL,
  PRIMARY KEY (`fup_uid`,`fup_phonenum`),
  CONSTRAINT `f_user_phone_FK` FOREIGN KEY (`fup_uid`) REFERENCES `f_user` (`fu_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `f_user_phone_FK_1` FOREIGN KEY (`fup_uid`) REFERENCES `f_user` (`fu_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `f_user_phone`
--

LOCK TABLES `f_user_phone` WRITE;
/*!40000 ALTER TABLE `f_user_phone` DISABLE KEYS */;
INSERT INTO `f_user_phone` VALUES (1,'123123123'),(1,'9999999999'),(2,'123123123123'),(10,'0x01010'),(11,'90898235'),(12,'888888'),(13,'0x01010'),(15,'18912312312'),(16,'18912312312'),(17,'18912312112'),(18,'18932112312'),(19,'18912312322'),(20,'18932223312');
/*!40000 ALTER TABLE `f_user_phone` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary table structure for view `factory_facility_info`
--

DROP TABLE IF EXISTS `factory_facility_info`;
/*!50001 DROP VIEW IF EXISTS `factory_facility_info`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE TABLE `factory_facility_info` (
  `ffacility_id` tinyint NOT NULL,
  `ff_code` tinyint NOT NULL,
  `ffacility_name` tinyint NOT NULL,
  `ff_length` tinyint NOT NULL,
  `ff_width` tinyint NOT NULL,
  `ff_height` tinyint NOT NULL,
  `ff_type_id` tinyint NOT NULL,
  `ff_info` tinyint NOT NULL,
  `gmt_modified` tinyint NOT NULL,
  `gmt_created` tinyint NOT NULL,
  `deleted` tinyint NOT NULL,
  `fff_nid` tinyint NOT NULL,
  `fff_id` tinyint NOT NULL,
  `fff_state` tinyint NOT NULL,
  `fff_src` tinyint NOT NULL,
  `fff_fid` tinyint NOT NULL
) ENGINE=MyISAM */;
SET character_set_client = @saved_cs_client;

--
-- Temporary table structure for view `platform_facility_info`
--

DROP TABLE IF EXISTS `platform_facility_info`;
/*!50001 DROP VIEW IF EXISTS `platform_facility_info`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE TABLE `platform_facility_info` (
  `ffacility_id` tinyint NOT NULL,
  `ff_code` tinyint NOT NULL,
  `ffacility_name` tinyint NOT NULL,
  `ff_length` tinyint NOT NULL,
  `ff_width` tinyint NOT NULL,
  `ff_height` tinyint NOT NULL,
  `ff_type_id` tinyint NOT NULL,
  `ff_info` tinyint NOT NULL,
  `gmt_modified` tinyint NOT NULL,
  `gmt_created` tinyint NOT NULL,
  `deleted` tinyint NOT NULL,
  `fpf_rentId` tinyint NOT NULL,
  `fpf_id` tinyint NOT NULL,
  `fpf_state` tinyint NOT NULL,
  `fpf_fid` tinyint NOT NULL
) ENGINE=MyISAM */;
SET character_set_client = @saved_cs_client;

--
-- Temporary table structure for view `receiveinfo`
--

DROP TABLE IF EXISTS `receiveinfo`;
/*!50001 DROP VIEW IF EXISTS `receiveinfo`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE TABLE `receiveinfo` (
  `????????????id` tinyint NOT NULL,
  `???????????????` tinyint NOT NULL,
  `???????????????` tinyint NOT NULL,
  `?????????????????????` tinyint NOT NULL
) ENGINE=MyISAM */;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `sys_login_log`
--

DROP TABLE IF EXISTS `sys_login_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sys_login_log` (
  `sll_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `sll_uid` bigint(20) NOT NULL,
  `sll_time` datetime NOT NULL,
  `sll_msg` text NOT NULL,
  PRIMARY KEY (`sll_id`),
  KEY `sys_login_log_FK` (`sll_uid`),
  CONSTRAINT `sys_login_log_FK` FOREIGN KEY (`sll_uid`) REFERENCES `f_user` (`fu_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_login_log`
--

LOCK TABLES `sys_login_log` WRITE;
/*!40000 ALTER TABLE `sys_login_log` DISABLE KEYS */;
/*!40000 ALTER TABLE `sys_login_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_logout_log`
--

DROP TABLE IF EXISTS `sys_logout_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sys_logout_log` (
  `sll_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `sll_uid` bigint(20) NOT NULL,
  `sll_time` datetime NOT NULL,
  `sll_msg` text NOT NULL,
  PRIMARY KEY (`sll_id`),
  KEY `sys_logout_log_FK` (`sll_uid`),
  CONSTRAINT `sys_logout_log_FK` FOREIGN KEY (`sll_uid`) REFERENCES `f_user` (`fu_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_logout_log`
--

LOCK TABLES `sys_logout_log` WRITE;
/*!40000 ALTER TABLE `sys_logout_log` DISABLE KEYS */;
/*!40000 ALTER TABLE `sys_logout_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_rent_log`
--

DROP TABLE IF EXISTS `sys_rent_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sys_rent_log` (
  `srl_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `srl_factory_id` bigint(20) NOT NULL,
  `srl_facility_id` bigint(20) NOT NULL,
  `srl_msg` text NOT NULL,
  `srl_start_day` date DEFAULT NULL,
  `srl_end_day` date DEFAULT NULL,
  PRIMARY KEY (`srl_id`),
  KEY `sys_rent_log_FK` (`srl_facility_id`),
  KEY `sys_rent_log_FK_1` (`srl_factory_id`),
  CONSTRAINT `sys_rent_log_FK` FOREIGN KEY (`srl_facility_id`) REFERENCES `f_facility` (`ffacility_id`) ON UPDATE CASCADE,
  CONSTRAINT `sys_rent_log_FK_1` FOREIGN KEY (`srl_factory_id`) REFERENCES `f_factory` (`ff_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_rent_log`
--

LOCK TABLES `sys_rent_log` WRITE;
/*!40000 ALTER TABLE `sys_rent_log` DISABLE KEYS */;
INSERT INTO `sys_rent_log` VALUES (1,2,4,'?????????','2021-07-02','2022-07-02'),(2,2,6,'?????????','2021-07-02','2022-07-02'),(3,1,4,'?????????','2021-07-02','2021-07-03'),(4,3,4,'????????????','2021-07-02',NULL),(5,4,7,'????????????','2021-07-09','2021-07-19');
/*!40000 ALTER TABLE `sys_rent_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping routines for database 'db_factory'
--
/*!50003 DROP PROCEDURE IF EXISTS `create_order` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'IGNORE_SPACE,STRICT_TRANS_TABLES,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `create_order`(
IN order_code VARCHAR(255), 
IN product_id BIGINT, 
IN production_num INT(255), 
IN finish_date DATE,
IN bid_finish_date DATE, 
IN receive_name VARCHAR(255), 
IN receive_addr VARCHAR(255), 
IN phone_num VARCHAR(255),
OUT p_result VARCHAR(10)
)
BEGIN
	main:BEGIN
		DECLARE check_product int;
		DECLARE check_receive_info int;
		DECLARE check_order_code int;
		DECLARE check_receive_name int;
		DECLARE check_user_type int;
		DECLARE user_id bigint;
		DECLARE cur_rid bigint;
	
		# ????????????????????????????????????
		IF bid_finish_date < now() THEN
			SET p_result = "?????????????????????????????????????????????";
			LEAVE main;
		END IF;
	
		# ??????????????????????????????
		IF finish_date < now() THEN
			SET p_result = "???????????????????????????????????????";
			LEAVE main;
		END IF;
	
		# ??????????????????????????????
		SELECT COUNT(*) INTO check_order_code FROM db_factory.f_morder f WHERE f.fmo_code = order_code;
		IF check_order_code <> 0 THEN
			SET p_result = "??????????????????";
			LEAVE main;
		END IF;
	
		# ???????????????????????????
		SELECT COUNT(*) INTO check_product FROM db_factory.f_product WHERE fp_id = product_id;
		IF check_product = 0 THEN
			SET p_result = "??????????????????";
			LEAVE main;
		END IF;
		# ???????????????????????????
		SELECT COUNT(*) INTO check_receive_name FROM db_factory.f_user f WHERE f.fu_name = receive_name;
		IF check_receive_name = 0 THEN
			SET p_result = "??????????????????";
			LEAVE main;
		END IF;
	
		# ??????????????????????????????????????????????????????
		SELECT f.fu_type_id INTO check_user_type FROM db_factory.f_user f WHERE f.fu_name = receive_name;
		IF check_user_type <> 2 THEN
			SET p_result = "????????????????????????";
			LEAVE main;
		END IF;
	
		# ???????????????????????????????????????????????????????????????????????????
		SELECT COUNT(*) INTO check_receive_info 
		FROM receiveinfo 
		WHERE ??????????????? = receive_name AND ??????????????? = receive_addr AND ????????????????????? = phone_num;
	
		SELECT fu_id INTO user_id FROM db_factory.f_user WHERE fu_name = receive_name;
	
		IF check_receive_info = 0 THEN
			INSERT INTO db_factory.f_ureceive_info VALUES(NULL, user_id, phone_num, receive_addr);
		END IF;
	
		SELECT ????????????id INTO cur_rid 
		FROM receiveinfo 
		WHERE ??????????????? = receive_name AND ??????????????? = receive_addr AND ????????????????????? = phone_num;
		
		INSERT INTO db_factory.f_morder VALUES(NULL, order_code,cur_rid, user_id, NULL, finish_date, bid_finish_date, product_id, production_num);
		COMMIT;
		SET p_result = "??????";
	END main;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `maintain_facility` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'IGNORE_SPACE,STRICT_TRANS_TABLES,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `maintain_facility`(
	IN facility_id BIGINT,
	IN product_id BIGINT,
	IN gpd BIGINT UNSIGNED,
	OUT p_result VARCHAR(10)
)
BEGIN
	main:BEGIN
		DECLARE check_facility int;
		DECLARE check_product int ;
		DECLARE check_gpd int;
	
		SELECT COUNT(*) INTO check_facility FROM f_gen_ability WHERE facility_id = fga_fid;
		IF check_facility = 0 THEN
			SET p_result = "???????????????";
			LEAVE main;
		END IF;
		
		SELECT COUNT(*) INTO check_product FROM f_gen_ability WHERE product_id = fga_pid;
		IF check_product = 0 THEN
			SET p_result = "???????????????";
			LEAVE main;
		END IF;
	
		IF gpd <= 0 THEN
			SET p_result = "??????????????????0";
			LEAVE main;
		END IF;

		SELECT COUNT(*) INTO check_gpd 
		FROM f_gen_ability 
		WHERE facility_id = fga_fid AND product_id = fga_pid;
	
		IF check_gpd = 0 THEN
			INSERT INTO f_gen_ability VALUES(facility_id, product_id, gpd);
		ELSE
			UPDATE f_gen_ability SET fga_gnum_pb = gpd WHERE facility_id = fga_fid AND product_id = fga_pid;
		END IF;
		SET p_result = "????????????"; 
	
		COMMIT;
	END main;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `newFacility` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'IGNORE_SPACE,STRICT_TRANS_TABLES,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `newFacility`(
IN f_src VARCHAR(255),
IN f_factory_id BIGINT(20),
IN f_code VARCHAR(255),
IN f_name VARCHAR(255),
IN f_length BIGINT(20),
IN f_width BIGINT(20),
IN f_height BIGINT(20),
IN f_type BIGINT(20),
IN f_info TEXT(20),
OUT p_result VARCHAR(255)
)
BEGIN
	main:BEGIN
		DECLARE check_facility_code int;
		DECLARE check_factory_code int;
		#??????????????????????????? ??????
		DECLARE user_id bigint;
		DECLARE user_size int;
		DECLARE maxid_user bigint DEFAULT 0;
		DECLARE cur_user cursor FOR SELECT ffacility_id FROM db_factory.f_facility;
		#??????????????????????????? ??????
		
		SELECT COUNT(*) INTO check_facility_code FROM f_facility WHERE ff_code = f_code;
		IF check_facility_code <> 0 THEN
			SET p_result = "????????????";
			LEAVE main;
		END IF;
		
		# ?????????????????????
		SELECT COUNT(*) INTO user_size FROM db_factory.f_facility;
		
		OPEN cur_user;
		WHILE(user_size > 0) DO
				FETCH cur_user into user_id;
				IF maxid_user <= user_id THEN
					SET maxid_user = user_id + 1;
				END IF;
				SET user_size = user_size - 1;
		END WHILE;
		CLOSE cur_user;
		# ???????????????????????????
		
		IF f_src = "??????" THEN
			INSERT INTO f_facility VALUES(NULL, f_code, f_name, f_length, f_width, f_height, f_type, f_info, now(), now(), 0);
			INSERT INTO f_pfacility VALUES(NULL, maxid_user, "?????????", NULL);
		ELSE
			SELECT COUNT(*) INTO check_factory_code FROM f_factory WHERE ff_id = f_factory_id;
			IF check_facility_code <> 0 THEN
				SET p_result = "???????????????";
				LEAVE main;
			END IF;
			INSERT INTO f_facility VALUES(NULL, f_code, f_name, f_length, f_width, f_height, now(), f_type, f_info);
			INSERT INTO f_ffacility VALUES(NULL, maxid_user, "??????", "?????????", f_factory_id);
		END IF;
		SET p_result = "??????????????????"; 
		COMMIT;
	END main;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `newOrder` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'IGNORE_SPACE,STRICT_TRANS_TABLES,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `newOrder`(
IN order_code VARCHAR(255), 
IN product_id BIGINT, 
IN production_num INT(255), 
IN finish_date DATE,
IN bid_finish_date DATE, 
IN receive_name VARCHAR(255), 
IN receive_addr VARCHAR(255), 
IN phone_num VARCHAR(255),
OUT p_result VARCHAR(10)
)
BEGIN
	main:BEGIN
		DECLARE check_product int;
		DECLARE check_receive_info int;
		DECLARE check_order_code int;
		DECLARE check_receive_name int;
		DECLARE check_user_type int;
		DECLARE user_id bigint;
		DECLARE cur_rid bigint;
	
		# ????????????????????????????????????
		IF bid_finish_date < now() THEN
			SET p_result = "?????????????????????????????????????????????";
			LEAVE main;
		END IF;
	
		# ??????????????????????????????
		IF finish_date < now() THEN
			SET p_result = "???????????????????????????????????????";
			LEAVE main;
		END IF;
	
		# ??????????????????????????????
		SELECT COUNT(*) INTO check_order_code FROM db_factory.f_morder f WHERE f.fmo_code = order_code;
		IF check_order_code <> 0 THEN
			SET p_result = "??????????????????";
			LEAVE main;
		END IF;
	
		# ???????????????????????????
		SELECT COUNT(*) INTO check_product FROM db_factory.f_product WHERE fp_id = product_id;
		IF check_product = 0 THEN
			SET p_result = "??????????????????";
			LEAVE main;
		END IF;
		# ???????????????????????????
		SELECT COUNT(*) INTO check_receive_name FROM db_factory.f_user f WHERE f.fu_name = receive_name;
		IF check_receive_name = 0 THEN
			SET p_result = "??????????????????";
			LEAVE main;
		END IF;
	
		# ??????????????????????????????????????????????????????
		SELECT f.fu_type_id INTO check_user_type FROM db_factory.f_user f WHERE f.fu_name = receive_name;
		IF check_user_type <> 2 THEN
			SET p_result = "????????????????????????";
			LEAVE main;
		END IF;
	
		# ???????????????????????????????????????????????????????????????????????????
		SELECT COUNT(*) INTO check_receive_info 
		FROM receiveinfo 
		WHERE ??????????????? = receive_name AND ??????????????? = receive_addr AND ????????????????????? = phone_num;
	
		SELECT fu_id INTO user_id FROM db_factory.f_user WHERE fu_name = receive_name;
	
		IF check_receive_info = 0 THEN
			INSERT INTO db_factory.f_ureceive_info VALUES(NULL, user_id, phone_num, receive_addr);
		END IF;
	
		SELECT ????????????id INTO cur_rid 
		FROM receiveinfo 
		WHERE ??????????????? = receive_name AND ??????????????? = receive_addr AND ????????????????????? = phone_num;
		
		INSERT INTO db_factory.f_morder VALUES(NULL, order_code,cur_rid, user_id, "?????????", finish_date, bid_finish_date, product_id, production_num);
		COMMIT;
	
		SET p_result = "??????";
	END main;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `newProduct` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'IGNORE_SPACE,STRICT_TRANS_TABLES,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `newProduct`()
BEGIN
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `pickBid` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'IGNORE_SPACE,STRICT_TRANS_TABLES,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `pickBid`(
	IN bid_id BIGINT,
	OUT p_result VARCHAR(10)
)
BEGIN
	main:BEGIN
		DECLARE check_order_id bigint; # ????????????????????????
		DECLARE check_bid int; # ?????????????????????
		DECLARE check_factory_id bigint; # ?????????????????????
		DECLARE check_factory_state_id int; # ???????????????????????????
		DECLARE factory_id bigint;
		DECLARE order_id bigint;
		
		# ????????????????????????
		SELECT COUNT(*) INTO check_bid FROM f_bid WHERE bid_id = fb_id;
		IF check_bid <> 1 THEN
			SET p_result = "???????????????";
			LEAVE main;
		END IF;
	
		SELECT fb_oid INTO order_id FROM f_bid WHERE fb_id = bid_id;
	
		# ???????????????????????????
		SELECT COUNT(*) INTO check_order_id FROM f_morder WHERE order_id = fmo_id;
		IF check_order_id = 0 THEN
			SET p_result = "???????????????";
			LEAVE main;
		END IF;
	
		SELECT fb_fid INTO factory_id FROM f_bid WHERE fb_id = bid_id;
	
		# ????????????????????????
		SELECT COUNT(*) INTO check_factory_id FROM f_factory WHERE factory_id = ff_id;
		IF check_factory_id = 0 THEN
			SET p_result = "???????????????";
			LEAVE main;
		END IF;
		
	
		# ????????????????????????
		SELECT ff_state INTO check_factory_state_id FROM f_factory WHERE factory_id = ff_id;
		IF check_factory_state_id ="?????????" THEN
			SET p_result = "???????????????";
			LEAVE main;
		END IF;
	
		# ??????????????????
		UPDATE f_bid SET fb_state = "????????????" WHERE fb_id = bid_id;
		UPDATE f_bid SET fb_state = "????????????" WHERE fb_oid = order_id;
		# ??????????????????
		UPDATE f_order SET fo_state = "????????????" WHERE fo_id = order_id;
		# ???????????????????????????
		INSERT INTO f_bid_win VALUES(NULL, order_id, bid_id);
	    # ??????????????????
		INSERT INTO f_forder VALUES(NULL, factory_id, order_id);
	
		SET p_result = "??????";
		COMMIT;
	END main;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `refresh_sys_rent_log` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'IGNORE_SPACE,STRICT_TRANS_TABLES,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `refresh_sys_rent_log`()
BEGIN
	# ??????rent??????fp??????ff???
	DECLARE rent_id int;
	DECLARE factory_id bigint;
	DECLARE facility_id bigint;
	DECLARE msg text;
	DECLARE start_day bigint;
	DECLARE end_day bigint;
	DECLARE rentable int;
	DECLARE done INT DEFAULT 0; 
	DECLARE sys_rent_cursor CURSOR FOR SELECT * FROM sys_rent_log;
	DECLARE CONTINUE HANDLER FOR NOT FOUND SET done = 1;  

	OPEN sys_rent_cursor;
	refresh_state:LOOP
		FETCH sys_rent_cursor INTO rent_id, factory_id, facility_id, msg, start_day, end_day;
		IF done = 1 THEN
			LEAVE refresh_state;
		END IF;
		IF msg = "????????????" THEN
			IF start_day >= CURRENT_DATE() THEN
			
				SELECT COUNT (*) INTO rentable 
				FROM sys_rent_log 
				WHERE srl_facility_id = facility_id
				AND (srl_start_day <= end_day  and srl_end_day >= start_day);
				IF rentable > 0 THEN
					ITERATE refresh_state;
				END IF;
			
				UPDATE sys_rent_log SET srl_msg = "?????????" WHERE srl_id = rent_id;
				INSERT INTO f_ffacility VALUES(NULL, facility_id, "??????", "??????", factory_id);
				UPDATE f_pfacility SET fpf_state = "?????????" WHERE fpf_fid = factory_id AND fpf_id = facility_id;
			END IF;
		END IF;
		IF msg = "?????????" THEN
			IF end_day <= CURRENT_DATE() THEN
				UPDATE f_pfacility SET fpf_state = "?????????" WHERE fpf_fid = factory_id AND fpf_id = facility_id;
				UPDATE f_ffacility SET fff_state = "?????????????????????" WHERE fff_fid = factory_id AND fff_id = facility_id;
				UPDATE sys_rent_log SET srl_msg = "?????????" WHERE srl_id = rent_id;
			END IF;
		END IF;
		SET done = 0;
		END LOOP refresh_state;
	CLOSE sys_rent_cursor;
	COMMIT;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `Registration` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'IGNORE_SPACE,STRICT_TRANS_TABLES,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `Registration`(IN uname varchar(255), IN psw varchar(255), IN rname varchar(255),
                                                    IN phonenum varchar(255), IN utype bigint,
                                                    IN factory_name varchar(255), IN factory_info text,
                                                    OUT p_result varchar(255))
BEGIN
	main: BEGIN
		DECLARE check_account int;
		DECLARE check_factory int;
		#??????????????????????????? ??????
		DECLARE user_id int;
		DECLARE user_size int;
		DECLARE maxid_user int DEFAULT 0;
		DECLARE cur_user cursor FOR SELECT fu_id FROM db_factory.f_user;
		#??????????????????????????? ??????
		DECLARE exit handler for sqlexception
		BEGIN
			# ??????????????????
			SET p_result = "?????????????????????DEBUG";
			rollback;
		END;
		
		SELECT COUNT(*) INTO check_account FROM db_factory.f_user WHERE fu_name = uname;
	
		
	
		IF check_account <> 0 THEN
			# ????????????????????????
			set p_result = "???????????????";
			leave main;
		END IF;
	
		# ?????????????????????
		SELECT COUNT(*) INTO user_size FROM db_factory.f_user;
		
		OPEN cur_user;
		WHILE(user_size > 0) DO
				FETCH cur_user into user_id;
				IF maxid_user <= user_id THEN
					SET maxid_user = user_id + 1;
				END IF;
				SET user_size = user_size - 1;
		END WHILE;
		CLOSE cur_user;
		# ???????????????????????????
		
		INSERT INTO db_factory.f_user VALUES(NULL, uname, psw, rname, utype, current_timestamp(), current_timestamp(), 0);
		
		
		INSERT INTO db_factory.f_user_phone VALUES(maxid_user, phonenum);
		
		IF utype = 1 THEN # ?????????????????????
			# ??????????????????
			INSERT INTO db_factory.f_factory VALUES(NULL, maxid_user, factory_name, NULL, factory_info);
		END IF;
	
		SET p_result = "??????????????????";
		COMMIT ;
	END main;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `rentFacility` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'IGNORE_SPACE,STRICT_TRANS_TABLES,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `rentFacility`(
	IN facility_id BIGINT,
	IN start_day DATE,
	IN duration INT(255),
	IN factory_id BIGINT,
	OUT p_result VARCHAR(50)
)
BEGIN
	main:BEGIN
		DECLARE rentable int; # ???????????????????????????
		DECLARE check_facility int; # ????????????????????????
		DECLARE check_factory int; # ????????????????????????
		DECLARE check_factory_state int; # ????????????????????????
		DECLARE end_day date;
	
		IF start_day < curdate() THEN
			SET p_result = "????????????????????????????????????";
			LEAVE main;
		END IF;
	
		IF duration <= 0 THEN
			SET p_result = "????????????????????????0";
			LEAVE main;
		END IF;
		
		# ????????????????????????
		SELECT COUNT (*) INTO check_facility FROM f_pfacility WHERE fpf_id = facility_id;
		IF check_facility = 0 THEN
			SET p_result = "???????????????";
			LEAVE main;
		END IF;
	
		#??????????????????????????????????????????
		SELECT COUNT (*) INTO rentable 
		FROM f_pfacility 
		WHERE fpf_state = "?????????"  AND fpf_id = facility_id;
		IF rentable <> 0 THEN
			SET p_result ="???????????????";
			LEAVE main;
		END IF;
		
		# ???????????????????????????????????????
		SET end_day = DATE_ADD(start_day, INTERVAL duration day);
		SELECT COUNT (*) INTO rentable 
		FROM sys_rent_log 
		WHERE srl_facility_id = facility_id
		AND (srl_start_day <= end_day  and srl_end_day >= start_day);
		IF rentable > 0 THEN
			SET p_result ="????????????????????????";
			LEAVE main;
		END IF;
	
		START TRANSACTION;
		# ????????????????????????
		SELECT COUNT (*) INTO check_factory FROM f_factory WHERE ff_id = factory_id;
		IF check_factory = 0 THEN
			SET p_result = "???????????????";
			LEAVE main;
		END IF;
		
		START TRANSACTION;
		INSERT INTO sys_rent_log VALUES(NULL, factory_id, facility_id, "????????????", start_day, end_day);
		COMMIT;
		SET p_result = "????????????";
	END main;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `scheduleOrder` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'IGNORE_SPACE,STRICT_TRANS_TABLES,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `scheduleOrder`()
BEGIN
	main:BEGIN
		DECLARE check_f_order int;
		DECLARE check_facility int;
		DECLARE check_facility_state_1 int;
		DECLARE check_facility_state_2 int;
		DECLARE check_shedule_num int;	
		DECLARE facility_type int;
		
		DECLARE cur_id int;
		DECLARE forder_id bigint;
		DECLARE facility_id bigint;
		DECLARE factory_id bigint;
		DECLARE start_day date;
		DECLARE end_day date;
		DECLARE p_result VARCHAR(10);
		DECLARE done INT DEFAULT 0;
		
		DECLARE temp_cursor CURSOR FOR SELECT * FROM f_schedule_temp;
		DECLARE CONTINUE HANDLER FOR NOT FOUND SET done = 1;  
		
		OPEN temp_cursor;
		schedule:LOOP
			FETCH temp_cursor INTO cur_id, forder_id, facility_id, factory_id, start_day, end_day, p_result;
			IF done = 1 THEN
				LEAVE schedule;
			END IF;
			# ????????????????????????
			SELECT COUNT(*) INTO check_facility FROM f_ffacility WHERE fff_id = facility_id;
			IF check_facility = 0 THEN 
				UPDATE f_schedule_temp SET fst_p_result = "???????????????" WHERE cur_id = fst_id;
				ITERATE schedule;
			END IF;
			# ??????????????????????????????
			SELECT COUNT(*) INTO check_f_order FROM f_forder WHERE ffo_oid = forder_id;
			IF check_f_order = 0 THEN 
				UPDATE f_schedule_temp SET fst_p_result = "?????????????????????" WHERE cur_id = fst_id;
				ITERATE schedule;
			END IF;
		
			SELECT COUNT(*) INTO check_shedule_num 
			FROM f_schedule 
			WHERE fs_facility_id = facility_id;
		
			# ???????????????????????????????????????
			
			# 1. ????????????????????????????????????
			SELECT COUNT(*) INTO check_facility_state_1 
			FROM f_schedule 
			WHERE fs_facility_id = facility_id
			AND (fs_start_day > end_day OR fs_end_day < start_day);
	
			IF check_facility_state_1 = 0 and check_shedule_num <> 0 THEN 
				UPDATE f_schedule_temp SET fst_p_result = "???????????????????????????" WHERE cur_id = fst_id;
				ITERATE schedule;
			END IF;
		
			# 2. ??????????????????????????????????????????????????????????????????????????????
			SELECT COUNT(*) INTO facility_type
			FROM f_pfaclity 
			WHERE fpf_id = facility_id;
			
			IF facility_type = 1 THEN
				SELECT COUNT(*) INTO check_facility_state_2
				FROM sys_rent_log 
				WHERE srl_facility_id = facility_id
				AND (srl_start_day > end_day OR srl_end_day < start_day);
			
				IF check_facility_state_2 = 0 and check_shedule_num <> 0 THEN 
					UPDATE f_schedule_temp SET fst_p_result = "???????????????????????????" WHERE cur_id = fst_id;
					ITERATE schedule;
				END IF;
			END IF;
		
			# ?????????
			INSERT INTO f_shedule VALUES(NULL, factory_id, facility_id, forder_id, start_day, end_day);
			UPDATE f_schedule_temp SET fst_p_result = "????????????" WHERE cur_id = fst_id;
		SET done = 0;
		END LOOP schedule;
		CLOSE temp_cursor;
		
	
	END main;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `shtDownOrOpen` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'IGNORE_SPACE,STRICT_TRANS_TABLES,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `shtDownOrOpen`(
	IN fid BIGINT,
	IN changeTo VARCHAR(255),
	OUT p_result VARCHAR(255)
)
BEGIN
	main:BEGIN
		DECLARE exit handler for sqlexception
		BEGIN
			# ??????????????????
			SET p_result = "?????????????????????DEBUG";
			rollback;
		END;
		IF changeTo = "??????" THEN
			UPDATE db_factory.f_ffacility SET fff_state = "??????" WHERE fff_id = fid;
			UPDATE db_factory.f_pfacility SET fpf_state = "?????????" WHERE fpf_id = fid;
		ELSE
			UPDATE db_factory.f_ffacility SET fff_state = changeTo WHERE fff_id = fid;
			UPDATE db_factory.f_pfacility SET fpf_state = changeTo WHERE fpf_id = fid;
		END IF;
		SET p_result = "????????????";
		COMMIT;	
	END main;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `shutDown` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'IGNORE_SPACE,STRICT_TRANS_TABLES,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `shutDown`(
	IN fid BIGINT,
	IN changeTo VARCHAR(255),
	OUT p_result VARCHAR(255)
)
BEGIN
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Final view structure for view `factory_facility_info`
--

/*!50001 DROP TABLE IF EXISTS `factory_facility_info`*/;
/*!50001 DROP VIEW IF EXISTS `factory_facility_info`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `factory_facility_info` AS (select `ff1`.`ffacility_id` AS `ffacility_id`,`ff1`.`ff_code` AS `ff_code`,`ff1`.`ffacility_name` AS `ffacility_name`,`ff1`.`ff_length` AS `ff_length`,`ff1`.`ff_width` AS `ff_width`,`ff1`.`ff_height` AS `ff_height`,`ff1`.`ff_type_id` AS `ff_type_id`,`ff1`.`ff_info` AS `ff_info`,`ff1`.`gmt_modified` AS `gmt_modified`,`ff1`.`gmt_created` AS `gmt_created`,`ff1`.`deleted` AS `deleted`,`ff2`.`fff_nid` AS `fff_nid`,`ff2`.`fff_id` AS `fff_id`,`ff2`.`fff_state` AS `fff_state`,`ff2`.`fff_src` AS `fff_src`,`ff2`.`fff_fid` AS `fff_fid` from (`f_facility` `ff1` join `f_ffacility` `ff2`) where `ff2`.`fff_id` = `ff1`.`ffacility_id` and `ff2`.`fff_src` <> '??????') */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `platform_facility_info`
--

/*!50001 DROP TABLE IF EXISTS `platform_facility_info`*/;
/*!50001 DROP VIEW IF EXISTS `platform_facility_info`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `platform_facility_info` AS (select `ff`.`ffacility_id` AS `ffacility_id`,`ff`.`ff_code` AS `ff_code`,`ff`.`ffacility_name` AS `ffacility_name`,`ff`.`ff_length` AS `ff_length`,`ff`.`ff_width` AS `ff_width`,`ff`.`ff_height` AS `ff_height`,`ff`.`ff_type_id` AS `ff_type_id`,`ff`.`ff_info` AS `ff_info`,`ff`.`gmt_modified` AS `gmt_modified`,`ff`.`gmt_created` AS `gmt_created`,`ff`.`deleted` AS `deleted`,`fp`.`fpf_rentId` AS `fpf_rentId`,`fp`.`fpf_id` AS `fpf_id`,`fp`.`fpf_state` AS `fpf_state`,`fp`.`fpf_fid` AS `fpf_fid` from (`f_facility` `ff` join `f_pfacility` `fp`) where `fp`.`fpf_id` = `ff`.`ffacility_id`) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `receiveinfo`
--

/*!50001 DROP TABLE IF EXISTS `receiveinfo`*/;
/*!50001 DROP VIEW IF EXISTS `receiveinfo`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `receiveinfo` AS (select `f_ureceive_info`.`furi_id` AS `????????????id`,`f_user`.`fu_name` AS `???????????????`,`f_ureceive_info`.`furi_addr` AS `???????????????`,`f_ureceive_info`.`furi_phone` AS `?????????????????????` from (`f_ureceive_info` join `f_user` on(`f_ureceive_info`.`furi_uid` = `f_user`.`fu_id`))) */;
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

-- Dump completed on 2021-07-17  1:22:21
