CREATE DATABASE  IF NOT EXISTS `midterm` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `midterm`;
-- MySQL dump 10.13  Distrib 8.0.32, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: midterm
-- ------------------------------------------------------
-- Server version	8.0.32

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
-- Temporary view structure for view `awakenskill_view`
--

DROP TABLE IF EXISTS `awakenskill_view`;
/*!50001 DROP VIEW IF EXISTS `awakenskill_view`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `awakenskill_view` AS SELECT 
 1 AS `職業名稱`,
 1 AS `覺醒技能`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `guild_view`
--

DROP TABLE IF EXISTS `guild_view`;
/*!50001 DROP VIEW IF EXISTS `guild_view`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `guild_view` AS SELECT 
 1 AS `guild_ID`,
 1 AS `guild_name`,
 1 AS `guild_creator`,
 1 AS `guild_create_time`,
 1 AS `guild_Lv`,
 1 AS `guild_people_num`,
 1 AS `guild_combat_effectiveness`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `job_view`
--

DROP TABLE IF EXISTS `job_view`;
/*!50001 DROP VIEW IF EXISTS `job_view`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `job_view` AS SELECT 
 1 AS `c_Job_Id`,
 1 AS `c_Job_Name`,
 1 AS `MainSkill_Name`,
 1 AS `MinorSkill_Name`,
 1 AS `PassiveSkill_Name`,
 1 AS `AwakenedSkill_Name`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `mainskill_view`
--

DROP TABLE IF EXISTS `mainskill_view`;
/*!50001 DROP VIEW IF EXISTS `mainskill_view`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `mainskill_view` AS SELECT 
 1 AS `職業名稱`,
 1 AS `主技能`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `minorskill_view`
--

DROP TABLE IF EXISTS `minorskill_view`;
/*!50001 DROP VIEW IF EXISTS `minorskill_view`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `minorskill_view` AS SELECT 
 1 AS `職業名稱`,
 1 AS `副技能`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `passiveskill_view`
--

DROP TABLE IF EXISTS `passiveskill_view`;
/*!50001 DROP VIEW IF EXISTS `passiveskill_view`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `passiveskill_view` AS SELECT 
 1 AS `職業名稱`,
 1 AS `被動技能`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `t_equipment`
--

DROP TABLE IF EXISTS `t_equipment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `t_equipment` (
  `c_Equipment_Id` varchar(8) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `c_Equipment_Name` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `c_Quality` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `c_AttackRange_Modified` varchar(8) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `c_HP_Modified` varchar(8) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `c_MP_Modified` varchar(8) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `c_ATK_Modified` varchar(8) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `c_DEF_Modified` varchar(8) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `c_ALG_Modified` varchar(8) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `c_Equipped` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`c_Equipment_Id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `t_equipment`
--

LOCK TABLES `t_equipment` WRITE;
/*!40000 ALTER TABLE `t_equipment` DISABLE KEYS */;
INSERT INTO `t_equipment` VALUES ('E001','鎧甲','Legendary','1','100','100','100','100','100',1),('E002','鎧甲','Normal','1','25','0','0','225','55',1),('E003','鬥神鎧','Legendary','0','100','0','500','200','450',1),('E004','鎧甲','Excellent','0','75','0','0','275','85',1),('E005','鎧甲','Fine','0','50','0','0','250','70',1),('E006','布甲','Excellent','0','null','100','50','50','50',1),('E007','布甲','Epic','0','null','125','75','60','70',1),('E008','鎖子甲','Normal','1','40','0','20','30','60',1),('E009','鬥神鎧','Fine','null','50','0','300','100','350',1),('E010','長袍','Fine','2','50','200','30','20','50',1),('E011','鎖子甲','Epic','1','100','0','50','100','120',1),('E012','長袍','Legendary','5','50','500','150','50','100',1),('E013','吾王甲','Fine','45','12','123','123','123','456',1);
/*!40000 ALTER TABLE `t_equipment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `t_guild`
--

DROP TABLE IF EXISTS `t_guild`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `t_guild` (
  `guild_ID` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `guild_name` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `guild_creator` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `guild_create_time` date DEFAULT NULL,
  `guild_Lv` int DEFAULT NULL,
  `guild_people_num` int DEFAULT NULL,
  `guild_combat_effectiveness` int DEFAULT NULL,
  PRIMARY KEY (`guild_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `t_guild`
--

LOCK TABLES `t_guild` WRITE;
/*!40000 ALTER TABLE `t_guild` DISABLE KEYS */;
INSERT INTO `t_guild` VALUES ('G001','撒旦傭兵團','P001','2003-05-17',3,5,1000),('G002','綠色恐怖','P008','2005-09-27',2,3,796),('G003','天使傭兵團','P009','2009-06-30',2,4,764);
/*!40000 ALTER TABLE `t_guild` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `t_job`
--

DROP TABLE IF EXISTS `t_job`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `t_job` (
  `c_Job_Id` varchar(4) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `c_Job_Name` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `c_MainSkill_id` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `c_MinorSkill_id` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `c_PassiveSkill_id` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `c_AwakenedSkill_id` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`c_Job_Id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `t_job`
--

LOCK TABLES `t_job` WRITE;
/*!40000 ALTER TABLE `t_job` DISABLE KEYS */;
INSERT INTO `t_job` VALUES ('J001','狂戰士','S001','S005','S009','S013'),('J002','守望者','S002','S006','S010','S014'),('J003','蘭','S003','S007','S011','S015'),('J004','決鬥家','S004','S008','S012','S016'),('J005','黑暗騎士','S017','S022','S030','S036'),('J006','獵魂者','S001','S023','S009','S013'),('J007','拳鬥士','S018','S024','S031','S014'),('J008','女忍者','S019','S025','S032','S037'),('J009','女武神','S020','S026','S033','S038'),('J010','戰士','S021','S027','S034','S039'),('J011','武術大師','S021','S028','S035','S039'),('J012','雯','S003','S029','S011','S040');
/*!40000 ALTER TABLE `t_job` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `t_mount`
--

DROP TABLE IF EXISTS `t_mount`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `t_mount` (
  `c_Mount_Id` varchar(8) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `c_Mount_Species` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `c_Mount_Quality` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `c_AttackRange_Modified` int DEFAULT NULL,
  `c_HP_Modified` int DEFAULT NULL,
  `c_MP_Modified` int DEFAULT NULL,
  `c_ATK_Modified` int DEFAULT NULL,
  `c_DEF_Modified` int DEFAULT NULL,
  `c_ALG_Modified` int DEFAULT NULL,
  `c_Mounted` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`c_Mount_Id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `t_mount`
--

LOCK TABLES `t_mount` WRITE;
/*!40000 ALTER TABLE `t_mount` DISABLE KEYS */;
INSERT INTO `t_mount` VALUES ('M001','小龍','Fine',1,100,0,200,0,0,0),('M002','北極熊','Excellent',0,100,0,350,100,0,0),('M003','神雕','Legendary',1,100,0,500,100,100,0),('M004','穿山甲','Normal',0,0,0,0,100,0,0),('M005','阿鵝','Excellent',1,0,0,100,100,300,0);
/*!40000 ALTER TABLE `t_mount` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `t_players`
--

DROP TABLE IF EXISTS `t_players`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `t_players` (
  `c_Player_Id` varchar(8) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `c_Player_Name` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `c_Player_Level` int DEFAULT NULL,
  `c_Player_Attribute` varchar(4) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `c_Equipment_ID` varchar(4) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `c_Mount_ID` varchar(4) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `c_Job_ID` varchar(4) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `c_MainSkill_Level` int DEFAULT NULL,
  `c_MinorSkill_Level` int DEFAULT NULL,
  `c_AwakenedSkill_Level` int DEFAULT NULL,
  `player_contribution` int DEFAULT NULL,
  `player_join_guild_time` date DEFAULT NULL,
  `guild_ID` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`c_Player_Id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `t_players`
--

LOCK TABLES `t_players` WRITE;
/*!40000 ALTER TABLE `t_players` DISABLE KEYS */;
INSERT INTO `t_players` VALUES ('P001','公羊',100,'火','E001','M001','J001',10,10,5,100,'2003-05-17','G001'),('P002','兔子',100,'火','E002','M002','J002',9,10,4,75,'2003-05-20','G001'),('P003','蛤蟆',100,'土','E003','M003','J003',10,8,3,98,'2003-02-20','G001'),('P004','大狗',100,'土','E004','M004','J004',10,10,5,26,'2003-05-20','G001'),('P005','小蒼蠅',81,'風','E005','M001','J005',7,10,4,64,'2003-05-20','G001'),('P006','試管',57,'水','E006','M001','J006',6,8,3,100,'2005-09-27','G002'),('P007','工蜂',97,'風','E007','M005','J007',5,7,5,159,'2005-09-27','G002'),('P008','蝙蝠',83,'風','E008','M003','J008',4,9,3,64,'2005-10-02','G002'),('P009','霸王龍',79,'土','E009','M003','J009',8,5,2,92,'2009-06-30','G003'),('P010','臭鼬',95,'火','E010','M004','J010',8,10,2,31,'2009-07-15','G003'),('P011','大鳥',84,'風','E011','M004','J011',9,6,3,31,'2009-07-15','G003'),('P012','熊貓',100,'水','E012','M001','J012',7,10,5,97,'2009-07-15','G003');
/*!40000 ALTER TABLE `t_players` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `t_skills`
--

DROP TABLE IF EXISTS `t_skills`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `t_skills` (
  `c_Skill_Id` varchar(8) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `c_Skill_Name` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `c_Skill_Type` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `c_Skill_Cumsume` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `c_Skill_Cooldown` int DEFAULT NULL,
  `c_Skill_Discription` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`c_Skill_Id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `t_skills`
--

LOCK TABLES `t_skills` WRITE;
/*!40000 ALTER TABLE `t_skills` DISABLE KEYS */;
INSERT INTO `t_skills` VALUES ('S001','血之爆發','MainSkill','26',6,'攻擊速度30%、攻擊力20%，持續10秒'),('S002','守護者之刃','MainSkill','18',6,'斬向前方的敵人，造成攻擊力140%的傷害，並有25%的概率緩速目標10%持續3秒'),('S003','破雲劍','MainSkill','15',6,'向前衝刺，造成攻擊力131%的傷害，並有40%的概率使目標昏迷1秒'),('S004','惡狼撲食','MainSkill','23',14,'釋放出狼群，對前方的敵人造成攻擊力205%的傷害，並降低目標20%的移動速度，持續5秒'),('S005','狂暴之力','MinorSkill','27',60,'增加23%的攻擊力和攻擊速度，持續10秒'),('S006','巨力砍擊','MinorSkill','31',6,'對前方的敵人造成166%的傷害，並使敵人攻擊力降低21%，持續8秒'),('S007','鬼行','MinorSkill','25',9,'瞬間移到敵人身後，造成270%的傷害並短時間內會處於隱形狀態，增加20%的移動速度，持續4秒'),('S008','力士','MinorSkill','10',6,'向前方衝刺，撞擊第一個敵人並造成200%的傷害。發動後進入狂暴狀態，增加20%的移動和攻擊速度，持續5秒'),('S009','血之渴望','PassiveSkill','100',12,'雙手持劍隊前方敵人發動强力攻擊，造成大量傷害，并且吸取傷害的一定比例的生命值。'),('S010','寒冰凍結','PassiveSkill','20',3,'將目標凍結在原地，持續時間視技能等級而定'),('S011','優雅的氣質','PassiveSkill','20',3,'創造出一個時間停滯的區域，使周圍的所有物體減慢速度'),('S012','潛力開放','PassiveSkill','20',0,'釋放決鬥家潛在於體內的能量，全力戰鬥。'),('S013','狂怒痛擊','AwakenedSkill','50',12,'昏迷和擊飛概率提升5%'),('S014','絕對防禦','AwakenedSkill','75',10,'提高防禦力20點，減少35%的受到傷害'),('S015','一莖九花','AwakenedSkill','15',6,'把力量裝在錘上，給敵人展現出強力的投擲攻擊，然後揮動錘讓周邊的敵人飛走。'),('S016','勢不可擋的奮鬥','AwakenedSkill','60',10,'潛用蜷伏後獲得的強大推動力向前衝刺後進行連續攻擊'),('S017','卡瑪希爾比亞之斬 ','MainSkill','15',13,'聚集自然的能量朝前方撒出。根據吸引聚集的自然的能量，傷害規模也不一樣。'),('S018','三連踢','MainSkill','15',0,'向左、右移動並用眼花繚亂的踢擊攻擊敵人。'),('S019','圓月輪','MainSkill','15',12,'從女忍者手中脫離的圓月輪無情地攻擊敵陣。'),('S020','光榮之劍','MainSkill','40',12,'將神聖力匯集到劍上後下擊。劍上的神聖力轉換成天上之劍並淨化敵人。'),('S021','前進劍術','MainSkill','10',0,'往前方前進砍殺敵人的劍術'),('S022','命運的車輪','MinorSkill','30',6,'使用周遭的自然能量，用強力的自然劍氣攻擊敵人。'),('S023','岩石推擊','MinorSkill','25',4,'往前方衝刺推開敵人。'),('S024','太白踢','MinorSkill','10',5,'利用靈巧有力的腳攻擊對敵方造成傷害。'),('S025','地面刺','MinorSkill','20',15,'在空中再次跳躍後，往地面快速落下，給予落下地點附近的敵人傷害。'),('S026','光線斬擊','MinorSkill','5',5,'使用揮劍時的強烈光芒來消除黑暗。'),('S027','地面聲響','MinorSkill','17',0,'用劍朝地面猛打，對大範圍的敵人進行咆哮攻擊。'),('S028','破壞平衡','MinorSkill','12',3,'往前方快速移動，用肩膀猛烈攻擊敵人。'),('S029','刺心','MinorSkill','60',7,'向前用力投擲血柳刃後，再拉回嵌在地面的血柳刃，給敵人再次造成傷害。'),('S030','精靈的遺產','PassiveSkill','60',30,'在幻影劍注入強力的魔力爆發，對敵人造成強大的傷害。'),('S031','飢餓的猛獸','PassiveSkill','30',8,'如飢餓的猛獸，襲擊敵人後進行殘暴的攻擊。'),('S032','展開忍術','PassiveSkill','30',180,'深深的殺意切入體內，瞬間擁有強大的力量。'),('S033','上天之氣息','PassiveSkill','0',40,'有恢復自身和周圍隊友的生命力，提升防禦力的效果。'),('S034','孤煙的大劍','PassiveSkill','0',0,'可使用大劍。'),('S035','猛烈的氣勢','PassiveSkill','0',10,'瞬間集中精神，恢復一定的鬥志。'),('S036','貝迪爾的瘋狂','AwakenedSkill','65',15,'聚集自然能量，將太刀刺進地面，擊倒對手。'),('S037','深紅的圓月輪','AwakenedSkill','5',1,'手持充滿月光能量的圓月輪參與戰鬥。'),('S038','讓幻想成為現實','AwakenedSkill','150',60,'在場上製造建築改變地形'),('S039','黃泉之斬','AwakenedSkill','100',33,'用大劍從左至右強力砍擊，給予敵人傷害，跳躍後強力砍擊地面，使周圍的敵人受到強烈傷害'),('S040','香的烙印','AwakenedSkill','48',7,'從空中迅速向下攻擊，給地面上的敵人造成很大的傷害。');
/*!40000 ALTER TABLE `t_skills` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `t_skills_name`
--

DROP TABLE IF EXISTS `t_skills_name`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `t_skills_name` (
  `c_job_id` varchar(4) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `c_major_name` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `c_minor_name` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `c_awakened_name` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `c_passive_name` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`c_job_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `t_skills_name`
--

LOCK TABLES `t_skills_name` WRITE;
/*!40000 ALTER TABLE `t_skills_name` DISABLE KEYS */;
/*!40000 ALTER TABLE `t_skills_name` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `t_user_information`
--

DROP TABLE IF EXISTS `t_user_information`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `t_user_information` (
  `user_ID` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_name` varchar(15) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_password` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_account` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_status` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_country` varchar(15) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `user_age` int DEFAULT NULL,
  `user_sex` varchar(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `user_gmail` varchar(35) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `user_phone` varchar(25) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `player_ID` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`user_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `t_user_information`
--

LOCK TABLES `t_user_information` WRITE;
/*!40000 ALTER TABLE `t_user_information` DISABLE KEYS */;
INSERT INTO `t_user_information` VALUES ('U001','高揚','1564713','ram','player','Taiwan',26,'M','Ram@gmail.com','0965751324','P001'),('U002','崔勃','1241231','rabbit','player','Taiwan',25,'M','Rabbit@gmail.com','0942657813','P002'),('U003','李金方','1484563','toad','player','Taiwan',28,'M','Toad@gmail.com','0984625714','P003'),('U004','格羅廖夫','1111111','big_dog','player','Russia',57,'M','Bigdog@gmail.com','0955475631','P004'),('U005','弗萊','2154561','fly','player','South Africa',20,'M','Fly@gmail.com','0964852159','P005'),('U006','布魯斯','4564696','test_tube','player','American',34,'M','Tsettube@gmail.com','0964862142','P006'),('U007','托米','1541324','worker_bee','player','Serbian',60,'M','Wokerbee@gmail.com','0935452345','P007'),('U008','露西卡','4856456','bat','player','Colombia',28,'F','Bat@gmail.com','0956474564','P008'),('U009','艾琳','5451231','rex','player','Germany',29,'F','Rex@gamil.com','0956545654','P009'),('U010','拉菲爾','1454856','skunk','player','Sicil',31,'M','Skunk@gmail.com','0945124542','P010'),('U011','詹森','1548541','big_bird','player','Scotland',29,'M','Bigbird@gmail.com','0956646466','P011'),('U012','安迪·何','1548451','panda','player','Colombia',32,'M','Pamda@gmail.com','0934542344','P012'),('U013','艾爾伯特','5678453','fat_cat','developer','American',35,'M','Fatcat@gmail.com','0956761344','D001'),('U014','泰勒','1464512','pigeon','developer','American',31,'M','Pigeon@gmail.com','0923454315','D002'),('U015','詹姆斯','1548462','cockroach','developer','U.K.',34,'M','Cockroach@gmail.com','0966753131','D003'),('U016','亞克','1544521','fox','developer','U.K.',31,'M','Fox@gmail.com','0956774634','D004'),('U017','十三號','7540244','squid','developer','Taiwan',29,'M','Squid@gmail.com','0932451313','D005');
/*!40000 ALTER TABLE `t_user_information` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `v_player_list`
--

DROP TABLE IF EXISTS `v_player_list`;
/*!50001 DROP VIEW IF EXISTS `v_player_list`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `v_player_list` AS SELECT 
 1 AS `c_Player_Id`,
 1 AS `c_Job_Name`,
 1 AS `c_Player_Name`,
 1 AS `c_Player_Level`,
 1 AS `c_Player_Attribute`,
 1 AS `guild_name`,
 1 AS `c_Equipment_Name`,
 1 AS `c_Mount_Species`,
 1 AS `c_MainSkill_Level`,
 1 AS `c_MinorSkill_Level`,
 1 AS `c_AwakenedSkill_Level`*/;
SET character_set_client = @saved_cs_client;

--
-- Final view structure for view `awakenskill_view`
--

/*!50001 DROP VIEW IF EXISTS `awakenskill_view`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb3 */;
/*!50001 SET character_set_results     = utf8mb3 */;
/*!50001 SET collation_connection      = utf8mb3_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `awakenskill_view` AS select distinct `t_job`.`c_Job_Name` AS `職業名稱`,`t_skills`.`c_Skill_Name` AS `覺醒技能` from (`t_job` join `t_skills` on((`t_job`.`c_AwakenedSkill_id` = `t_skills`.`c_Skill_Id`))) where (`t_job`.`c_AwakenedSkill_id` = `t_skills`.`c_Skill_Id`) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `guild_view`
--

/*!50001 DROP VIEW IF EXISTS `guild_view`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `guild_view` AS select `t_guild`.`guild_ID` AS `guild_ID`,`t_guild`.`guild_name` AS `guild_name`,`t_players`.`c_Player_Name` AS `guild_creator`,`t_guild`.`guild_create_time` AS `guild_create_time`,`t_guild`.`guild_Lv` AS `guild_Lv`,`t_guild`.`guild_people_num` AS `guild_people_num`,`t_guild`.`guild_combat_effectiveness` AS `guild_combat_effectiveness` from (`t_guild` join `t_players` on((`t_guild`.`guild_creator` = `t_players`.`c_Player_Id`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `job_view`
--

/*!50001 DROP VIEW IF EXISTS `job_view`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `job_view` AS select `t_job`.`c_Job_Id` AS `c_Job_Id`,`t_job`.`c_Job_Name` AS `c_Job_Name`,`t_skills_main`.`c_Skill_Name` AS `MainSkill_Name`,`t_skills_minor`.`c_Skill_Name` AS `MinorSkill_Name`,`t_skills_passive`.`c_Skill_Name` AS `PassiveSkill_Name`,`t_skills_awakened`.`c_Skill_Name` AS `AwakenedSkill_Name` from ((((`t_job` join `t_skills` `t_skills_main` on((`t_job`.`c_MainSkill_id` = `t_skills_main`.`c_Skill_Id`))) join `t_skills` `t_skills_minor` on((`t_job`.`c_MinorSkill_id` = `t_skills_minor`.`c_Skill_Id`))) join `t_skills` `t_skills_passive` on((`t_job`.`c_PassiveSkill_id` = `t_skills_passive`.`c_Skill_Id`))) join `t_skills` `t_skills_awakened` on((`t_job`.`c_AwakenedSkill_id` = `t_skills_awakened`.`c_Skill_Id`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `mainskill_view`
--

/*!50001 DROP VIEW IF EXISTS `mainskill_view`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb3 */;
/*!50001 SET character_set_results     = utf8mb3 */;
/*!50001 SET collation_connection      = utf8mb3_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `mainskill_view` AS select distinct `t_job`.`c_Job_Name` AS `職業名稱`,`t_skills`.`c_Skill_Name` AS `主技能` from (`t_job` join `t_skills` on((`t_job`.`c_MainSkill_id` = `t_skills`.`c_Skill_Id`))) where (`t_job`.`c_MainSkill_id` = `t_skills`.`c_Skill_Id`) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `minorskill_view`
--

/*!50001 DROP VIEW IF EXISTS `minorskill_view`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb3 */;
/*!50001 SET character_set_results     = utf8mb3 */;
/*!50001 SET collation_connection      = utf8mb3_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `minorskill_view` AS select distinct `t_job`.`c_Job_Name` AS `職業名稱`,`t_skills`.`c_Skill_Name` AS `副技能` from (`t_job` join `t_skills` on((`t_job`.`c_MinorSkill_id` = `t_skills`.`c_Skill_Id`))) where (`t_job`.`c_MinorSkill_id` = `t_skills`.`c_Skill_Id`) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `passiveskill_view`
--

/*!50001 DROP VIEW IF EXISTS `passiveskill_view`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb3 */;
/*!50001 SET character_set_results     = utf8mb3 */;
/*!50001 SET collation_connection      = utf8mb3_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `passiveskill_view` AS select distinct `t_job`.`c_Job_Name` AS `職業名稱`,`t_skills`.`c_Skill_Name` AS `被動技能` from (`t_job` join `t_skills` on((`t_job`.`c_PassiveSkill_id` = `t_skills`.`c_Skill_Id`))) where (`t_job`.`c_PassiveSkill_id` = `t_skills`.`c_Skill_Id`) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `v_player_list`
--

/*!50001 DROP VIEW IF EXISTS `v_player_list`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `v_player_list` AS select `t_players`.`c_Player_Id` AS `c_Player_Id`,`t_job`.`c_Job_Name` AS `c_Job_Name`,`t_players`.`c_Player_Name` AS `c_Player_Name`,`t_players`.`c_Player_Level` AS `c_Player_Level`,`t_players`.`c_Player_Attribute` AS `c_Player_Attribute`,`t_guild`.`guild_name` AS `guild_name`,`t_equipment`.`c_Equipment_Name` AS `c_Equipment_Name`,`t_mount`.`c_Mount_Species` AS `c_Mount_Species`,`t_players`.`c_MainSkill_Level` AS `c_MainSkill_Level`,`t_players`.`c_MinorSkill_Level` AS `c_MinorSkill_Level`,`t_players`.`c_AwakenedSkill_Level` AS `c_AwakenedSkill_Level` from ((((`t_players` join `t_equipment` on((`t_players`.`c_Equipment_ID` = `t_equipment`.`c_Equipment_Id`))) join `t_mount` on((`t_players`.`c_Mount_ID` = `t_mount`.`c_Mount_Id`))) join `t_job` on((`t_players`.`c_Job_ID` = `t_job`.`c_Job_Id`))) join `t_guild` on((`t_players`.`guild_ID` = `t_guild`.`guild_ID`))) */;
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

-- Dump completed on 2023-06-06 12:36:08
