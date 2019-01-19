-- MySQL dump 10.13  Distrib 5.7.24, for Linux (x86_64)
--
-- Host: localhost    Database: clothes
-- ------------------------------------------------------
-- Server version	5.7.24-0ubuntu0.16.04.1

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
-- Table structure for table `auth_group`
--

DROP TABLE IF EXISTS `auth_group`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_group` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(80) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_group`
--

LOCK TABLES `auth_group` WRITE;
/*!40000 ALTER TABLE `auth_group` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_group` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_group_permissions`
--

DROP TABLE IF EXISTS `auth_group_permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_group_permissions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `group_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_group_permissions_group_id_permission_id_0cd325b0_uniq` (`group_id`,`permission_id`),
  KEY `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` (`permission_id`),
  CONSTRAINT `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `auth_group_permissions_group_id_b120cbf9_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_group_permissions`
--

LOCK TABLES `auth_group_permissions` WRITE;
/*!40000 ALTER TABLE `auth_group_permissions` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_group_permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_permission`
--

DROP TABLE IF EXISTS `auth_permission`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_permission` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `content_type_id` int(11) NOT NULL,
  `codename` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_permission_content_type_id_codename_01ab375a_uniq` (`content_type_id`,`codename`),
  CONSTRAINT `auth_permission_content_type_id_2f476e4b_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=49 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_permission`
--

LOCK TABLES `auth_permission` WRITE;
/*!40000 ALTER TABLE `auth_permission` DISABLE KEYS */;
INSERT INTO `auth_permission` VALUES (1,'Can add log entry',1,'add_logentry'),(2,'Can change log entry',1,'change_logentry'),(3,'Can delete log entry',1,'delete_logentry'),(4,'Can add group',2,'add_group'),(5,'Can change group',2,'change_group'),(6,'Can delete group',2,'delete_group'),(7,'Can add user',3,'add_user'),(8,'Can change user',3,'change_user'),(9,'Can delete user',3,'delete_user'),(10,'Can add permission',4,'add_permission'),(11,'Can change permission',4,'change_permission'),(12,'Can delete permission',4,'delete_permission'),(13,'Can add content type',5,'add_contenttype'),(14,'Can change content type',5,'change_contenttype'),(15,'Can delete content type',5,'delete_contenttype'),(16,'Can add session',6,'add_session'),(17,'Can change session',6,'change_session'),(18,'Can delete session',6,'delete_session'),(19,'Can add big',7,'add_big'),(20,'Can change big',7,'change_big'),(21,'Can delete big',7,'delete_big'),(22,'Can add user',8,'add_user'),(23,'Can change user',8,'change_user'),(24,'Can delete user',8,'delete_user'),(25,'Can add good',9,'add_good'),(26,'Can change good',9,'change_good'),(27,'Can delete good',9,'delete_good'),(28,'Can add brand',10,'add_brand'),(29,'Can change brand',10,'change_brand'),(30,'Can delete brand',10,'delete_brand'),(31,'Can add cart',11,'add_cart'),(32,'Can change cart',11,'change_cart'),(33,'Can delete cart',11,'delete_cart'),(34,'Can add child',12,'add_child'),(35,'Can change child',12,'change_child'),(36,'Can delete child',12,'delete_child'),(37,'Can add man',13,'add_man'),(38,'Can change man',13,'change_man'),(39,'Can delete man',13,'delete_man'),(40,'Can add woman',14,'add_woman'),(41,'Can change woman',14,'change_woman'),(42,'Can delete woman',14,'delete_woman'),(43,'Can add order good',15,'add_ordergood'),(44,'Can change order good',15,'change_ordergood'),(45,'Can delete order good',15,'delete_ordergood'),(46,'Can add order',16,'add_order'),(47,'Can change order',16,'change_order'),(48,'Can delete order',16,'delete_order');
/*!40000 ALTER TABLE `auth_permission` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_user`
--

DROP TABLE IF EXISTS `auth_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `password` varchar(128) NOT NULL,
  `last_login` datetime(6) DEFAULT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `username` varchar(150) NOT NULL,
  `first_name` varchar(30) NOT NULL,
  `last_name` varchar(30) NOT NULL,
  `email` varchar(254) NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `date_joined` datetime(6) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user`
--

LOCK TABLES `auth_user` WRITE;
/*!40000 ALTER TABLE `auth_user` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_user_groups`
--

DROP TABLE IF EXISTS `auth_user_groups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_user_groups` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_user_groups_user_id_group_id_94350c0c_uniq` (`user_id`,`group_id`),
  KEY `auth_user_groups_group_id_97559544_fk_auth_group_id` (`group_id`),
  CONSTRAINT `auth_user_groups_group_id_97559544_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`),
  CONSTRAINT `auth_user_groups_user_id_6a12ed8b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user_groups`
--

LOCK TABLES `auth_user_groups` WRITE;
/*!40000 ALTER TABLE `auth_user_groups` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_user_groups` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_user_user_permissions`
--

DROP TABLE IF EXISTS `auth_user_user_permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_user_user_permissions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_user_user_permissions_user_id_permission_id_14a6b632_uniq` (`user_id`,`permission_id`),
  KEY `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` (`permission_id`),
  CONSTRAINT `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user_user_permissions`
--

LOCK TABLES `auth_user_user_permissions` WRITE;
/*!40000 ALTER TABLE `auth_user_user_permissions` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_user_user_permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `big`
--

DROP TABLE IF EXISTS `big`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `big` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `img` varchar(200) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `big`
--

LOCK TABLES `big` WRITE;
/*!40000 ALTER TABLE `big` DISABLE KEYS */;
INSERT INTO `big` VALUES (1,'/img/imgs/s_cs.jpg'),(2,'/img/imgs/s_dzlsj.jpg'),(3,'/img/imgs/s_md.jpg'),(4,'/img/imgs/stella.jpg'),(5,'/img/imgs/panmax.jpg'),(6,'/img/imgs/l_mq.jpg'),(7,'/img/imgs/l_mq.jpg'),(8,'/img/imgs/l_mq.jpg'),(9,'/img/imgs/l_mq.jpg');
/*!40000 ALTER TABLE `big` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `brand`
--

DROP TABLE IF EXISTS `brand`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `brand` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `img` varchar(200) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `brand`
--

LOCK TABLES `brand` WRITE;
/*!40000 ALTER TABLE `brand` DISABLE KEYS */;
INSERT INTO `brand` VALUES (1,'/img/imgs/l_cs.jpg'),(2,'/img/imgs/l_dzlsj.jpg'),(3,'/img/imgs/l_eal.jpg'),(4,'/img/imgs/l_llke.jpg'),(5,'/img/imgs/l_md.jpg'),(6,'/img/imgs/l_mq.jpg'),(7,'/img/imgs/l_ol.jpg'),(8,'/img/imgs/l_panmax.jpg'),(9,'/img/imgs/l_stella.jpg');
/*!40000 ALTER TABLE `brand` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cart`
--

DROP TABLE IF EXISTS `cart`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cart` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `goodnum` int(11) NOT NULL,
  `goodcolor` varchar(20) NOT NULL,
  `goodsize` varchar(20) NOT NULL,
  `good_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `isselect` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `cart_good_id_ba0463a7_fk_good_id` (`good_id`),
  KEY `cart_user_id_1361a739_fk_user_id` (`user_id`),
  CONSTRAINT `cart_good_id_ba0463a7_fk_good_id` FOREIGN KEY (`good_id`) REFERENCES `good` (`id`),
  CONSTRAINT `cart_user_id_1361a739_fk_user_id` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cart`
--

LOCK TABLES `cart` WRITE;
/*!40000 ALTER TABLE `cart` DISABLE KEYS */;
INSERT INTO `cart` VALUES (1,0,'粉红色','L',14,1,1),(2,0,'红色','L',14,1,1),(4,0,'红色','M',7,1,1),(5,0,'红色','M',19,1,1),(7,0,'粉红色','L',1,1,1),(8,0,'粉红色','L',2,1,1);
/*!40000 ALTER TABLE `cart` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `child`
--

DROP TABLE IF EXISTS `child`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `child` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `img` varchar(100) NOT NULL,
  `price` decimal(10,2) NOT NULL,
  `name` varchar(200) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=75 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `child`
--

LOCK TABLES `child` WRITE;
/*!40000 ALTER TABLE `child` DISABLE KEYS */;
INSERT INTO `child` VALUES (47,'img/imgs/linke_14675991774937.jpg',170.00,'超仙长裙开叉立体绣花白色蕾丝网纱中袖连衣裙'),(48,'img/imgs/linke_14675985285998.jpg',79.00,'尚丝蔓2016夏装新款韩版修身印花无袖两件套连衣裙 显瘦露脐半身套装裙'),(49,'img/imgs/201606161639114423.jpg',56.00,'2016夏韩国新款女装背心长裙沙滩裙性感露背无袖大摆雪纺连衣裙'),(50,'img/imgs/201606211709019676.jpg',62.00,'新款韩国夏季短袖白色淑女连衣裙'),(51,'img/imgs/201606211734183033.jpg',57.00,'新款名媛气质立体雏菊圆领短款无袖连衣裙背心裙'),(52,'img/imgs/201606281622183043.jpg',86.00,'2016短袖修身单件女装通勤新款韩版夏季套头夏装气质淑女连衣裙'),(53,'img/imgs/linke_14675984387574.jpg',119.00,'MOFFI 2016夏季潮流新品欧美风纯色荷叶边蛋糕裙女式雪纺连衣裙'),(54,'img/imgs/linke_14691795725688.jpg',229.00,'真丝连衣裙2016夏大码女装高档中年修身显瘦中长款淑女重磅桑蚕丝'),(55,'img/imgs/201605311741133889.jpg',359.00,'哥弟 2016夏装正品哥弟新款时尚高贵气质妈妈装修身显瘦短袖连衣裙'),(56,'img/imgs/201605311748327870.jpg',358.00,'哥弟 2016专柜女装正品哥弟短袖连衣裙大牌时尚修身显瘦中长款女装'),(57,'img/imgs/201607221653034365.jpg',158.00,'Daiyisilin 2016夏季新款中老年时尚皱褶妈妈装特大加菲大码复古连衣裙'),(58,'img/imgs/201608011141365882.jpg',75.00,'约诺帝 中老年连衣裙2016夏季新款妈妈装'),(59,'img/imgs/201608011143335378.jpg',85.00,'约诺帝 中老年妈妈装假两件 加肥加大码'),(60,'img/imgs/201608011143442924.jpg',85.00,'约诺帝 中老年女装夏季新款雪纺连衣裙'),(61,'img/imgs/linke_14673519349499.jpg',119.00,'ROOM0404 2016高端女装系列韩版简单背带牛仔衫露肩一字肩'),(62,'img/imgs/201606251736052162.jpg',118.00,'ROOM0404 2016吊带衫短款宽松无袖外穿衫荷叶边翠花性感露背上衣t恤女'),(63,'img/imgs/201606251751202381.jpg',231.00,'ROOM0404 2016夏季潮流新品女装连衣裙'),(64,'img/imgs/201606251751427984.jpg',181.00,'ROOM0404 2016夏季韩版新款连衣裙'),(65,'img/imgs/201606251752051684.jpg',174.00,'ROOM0404 2016夏装欧版新款中长款系带连衣裙女裙'),(66,'img/imgs/201606251754441282.jpg',160.00,'ROOM0404 2016夏季连衣裙仿真丝中长宽松大摆裙 高端'),(67,'img/imgs/201606251755128723.jpg',170.00,'ROOM0404 夏季2016竖条纹打底裙中长款韩版潮'),(68,'img/imgs/linke_14673635998747.jpg',119.00,'刊菲 2016复古风夏季新款优雅名媛旗袍裙修身蕾丝连衣裙'),(69,'img/imgs/201606251600438107.jpg',79.00,'洛洛卡儿 夏装民族风波西米亚复古碎花拼接吊带裙长款连衣裙长裙'),(70,'img/imgs/201606251623459194.jpg',114.00,'洛洛卡儿 2016夏装日系森女系复古圆领碎花中袖雪纺中长款连衣裙'),(71,'img/imgs/201606251626292411.jpg',98.00,'洛洛卡儿 2016春装新款复古小碎花长袖灯芯绒印花拼接中长款连衣裙大码裙'),(72,'img/imgs/201606251659137066.jpg',78.00,'洛洛卡儿 2016夏装新款复古波西米亚浪漫飘逸文艺花朵森女碎花上衣系带雪纺'),(73,'img/imgs/201606251700072744.jpg',86.00,'洛洛卡儿 2015秋装新款复古民族风田园森女系碎花中袖衬衣麻衣衬衫'),(74,'img/imgs/201606251730423978.jpg',140.00,'ROOM0404 2016春装时尚潮新款复古上衣');
/*!40000 ALTER TABLE `child` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_admin_log`
--

DROP TABLE IF EXISTS `django_admin_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `django_admin_log` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `action_time` datetime(6) NOT NULL,
  `object_id` longtext,
  `object_repr` varchar(200) NOT NULL,
  `action_flag` smallint(5) unsigned NOT NULL,
  `change_message` longtext NOT NULL,
  `content_type_id` int(11) DEFAULT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `django_admin_log_content_type_id_c4bce8eb_fk_django_co` (`content_type_id`),
  KEY `django_admin_log_user_id_c564eba6_fk_auth_user_id` (`user_id`),
  CONSTRAINT `django_admin_log_content_type_id_c4bce8eb_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  CONSTRAINT `django_admin_log_user_id_c564eba6_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_admin_log`
--

LOCK TABLES `django_admin_log` WRITE;
/*!40000 ALTER TABLE `django_admin_log` DISABLE KEYS */;
/*!40000 ALTER TABLE `django_admin_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_content_type`
--

DROP TABLE IF EXISTS `django_content_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `django_content_type` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `app_label` varchar(100) NOT NULL,
  `model` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `django_content_type_app_label_model_76bd3d3b_uniq` (`app_label`,`model`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_content_type`
--

LOCK TABLES `django_content_type` WRITE;
/*!40000 ALTER TABLE `django_content_type` DISABLE KEYS */;
INSERT INTO `django_content_type` VALUES (1,'admin','logentry'),(2,'auth','group'),(4,'auth','permission'),(3,'auth','user'),(7,'clothes','big'),(10,'clothes','brand'),(11,'clothes','cart'),(12,'clothes','child'),(9,'clothes','good'),(13,'clothes','man'),(16,'clothes','order'),(15,'clothes','ordergood'),(8,'clothes','user'),(14,'clothes','woman'),(5,'contenttypes','contenttype'),(6,'sessions','session');
/*!40000 ALTER TABLE `django_content_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_migrations`
--

DROP TABLE IF EXISTS `django_migrations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `django_migrations` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `app` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `applied` datetime(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=28 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_migrations`
--

LOCK TABLES `django_migrations` WRITE;
/*!40000 ALTER TABLE `django_migrations` DISABLE KEYS */;
INSERT INTO `django_migrations` VALUES (1,'contenttypes','0001_initial','2019-01-15 09:01:39.749092'),(2,'auth','0001_initial','2019-01-15 09:01:40.691484'),(3,'admin','0001_initial','2019-01-15 09:01:40.804437'),(4,'admin','0002_logentry_remove_auto_add','2019-01-15 09:01:40.824679'),(5,'contenttypes','0002_remove_content_type_name','2019-01-15 09:01:40.925137'),(6,'auth','0002_alter_permission_name_max_length','2019-01-15 09:01:40.959326'),(7,'auth','0003_alter_user_email_max_length','2019-01-15 09:01:41.008735'),(8,'auth','0004_alter_user_username_opts','2019-01-15 09:01:41.022722'),(9,'auth','0005_alter_user_last_login_null','2019-01-15 09:01:41.078849'),(10,'auth','0006_require_contenttypes_0002','2019-01-15 09:01:41.083021'),(11,'auth','0007_alter_validators_add_error_messages','2019-01-15 09:01:41.102685'),(12,'auth','0008_alter_user_username_max_length','2019-01-15 09:01:41.146853'),(13,'clothes','0001_initial','2019-01-15 09:01:41.292358'),(14,'sessions','0001_initial','2019-01-15 09:01:41.323732'),(15,'clothes','0002_auto_20190115_0927','2019-01-15 09:27:46.603517'),(16,'clothes','0003_cart','2019-01-15 11:59:10.188448'),(17,'clothes','0004_child_man_woman','2019-01-15 13:17:23.377380'),(18,'clothes','0005_auto_20190116_0106','2019-01-16 01:07:43.915095'),(19,'clothes','0006_auto_20190116_0841','2019-01-16 08:41:30.024332'),(20,'clothes','0007_auto_20190116_0843','2019-01-16 08:43:59.675653'),(21,'clothes','0008_auto_20190116_1121','2019-01-16 11:21:53.038230'),(22,'clothes','0009_auto_20190116_1124','2019-01-16 11:24:08.302788'),(23,'clothes','0010_cart','2019-01-16 11:24:37.788285'),(24,'clothes','0011_auto_20190116_1127','2019-01-16 11:27:21.858746'),(25,'clothes','0012_cart_isselect','2019-01-18 02:28:53.284233'),(26,'clothes','0013_order_ordergood','2019-01-18 09:38:20.151181'),(27,'clothes','0014_auto_20190118_0942','2019-01-18 09:42:26.911428');
/*!40000 ALTER TABLE `django_migrations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_session`
--

DROP TABLE IF EXISTS `django_session`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `django_session` (
  `session_key` varchar(40) NOT NULL,
  `session_data` longtext NOT NULL,
  `expire_date` datetime(6) NOT NULL,
  PRIMARY KEY (`session_key`),
  KEY `django_session_expire_date_a5c62663` (`expire_date`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_session`
--

LOCK TABLES `django_session` WRITE;
/*!40000 ALTER TABLE `django_session` DISABLE KEYS */;
INSERT INTO `django_session` VALUES ('ixsr67gnoq0gutdv4hhpnnr6xzu7f4j2','MzMzOGNmNjY0ZGU2ZGI1NjkxODY3Zjc4ZmVmNDRkNjY5YTU4N2E3ZDp7InRva2VuIjoiOGNkODk3ZWYyMDZiOGFkZjBjOTc1NjI2ZTE2NTY3ZDAifQ==','2019-01-31 00:51:45.828557');
/*!40000 ALTER TABLE `django_session` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `good`
--

DROP TABLE IF EXISTS `good`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `good` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `price` decimal(10,2) NOT NULL,
  `old_price` decimal(10,2) DEFAULT NULL,
  `discount` double DEFAULT NULL,
  `imgdir` varchar(200) NOT NULL,
  `category_id` int(11) DEFAULT NULL,
  `big_id_id` int(11) DEFAULT NULL,
  `brand_id_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `good_big_id_id_ecadafcb_fk_big_id` (`big_id_id`),
  KEY `good_brand_id_id_37f33e18_fk_brand_id` (`brand_id_id`),
  CONSTRAINT `good_big_id_id_ecadafcb_fk_big_id` FOREIGN KEY (`big_id_id`) REFERENCES `big` (`id`),
  CONSTRAINT `good_brand_id_id_37f33e18_fk_brand_id` FOREIGN KEY (`brand_id_id`) REFERENCES `brand` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=65 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `good`
--

LOCK TABLES `good` WRITE;
/*!40000 ALTER TABLE `good` DISABLE KEYS */;
INSERT INTO `good` VALUES (1,'ROOM0404 2016夏季连衣裙仿真丝中长宽松大摆裙 高端',160.00,298.00,5.3,'img/imgs/201606251754441282.jpg',1,NULL,9),(2,'佳美诗 2016欧美夏季新款印花连衣裙 女士假两件长裙不规则裙爆款',195.00,390.00,5,'img/imgs/201606281405385445.jpg',1,NULL,9),(3,'佳美诗 2016夏季新款纯色钉珠女式衬衫欧美中袖翻领上衣开衫品牌女装',190.00,380.00,5,'img/imgs/201606281422478849.jpg',1,NULL,9),(4,'2016夏季新款韩版时尚牛仔套装女显瘦背心上衣镶钻半身裙两件套',83.00,332.00,2.5,'img/imgs/201606281656456293.jpg',2,NULL,9),(5,'2016夏季新款女装甜美小清新纯棉麻修身收腰短袖A字裙连衣裙',38.00,126.00,3,'img/imgs/201607061357388108.jpg',2,NULL,9),(6,'艾芮尔 2016新款韩版胖MM200斤大码女装夏 加肥加大露肩两件套套装',79.00,188.00,4.2,'img/imgs/201607111002315056.jpg',2,NULL,9),(7,'RANRAN冉冉2016夏季女装新款蕾丝长裙子大摆型拼接绸缎真丝连衣裙',179.00,760.00,2.3,'img/imgs/201607271454072825.jpg',3,NULL,9),(8,'真丝连衣裙2016夏大码女装高档中年修身显瘦中长款淑女重磅桑蚕丝',181.00,258.00,7,'img/imgs/201606251751427984.jpg',3,NULL,9),(10,'超仙长裙开叉立体绣花白色蕾丝网纱中袖连衣裙',170.00,200.00,5.3,'img/imgs/linke_14695018705525.jpg',3,NULL,2),(11,'尚丝蔓2016夏装新款韩版修身印花无袖两件套连衣裙 显瘦露脐半身套装裙',79.00,100.00,5,'img/imgs/201607041448549057.jpg',4,NULL,3),(12,'2016夏韩国新款女装背心长裙沙滩裙性感露背无袖大摆雪纺连衣裙',56.00,70.00,5,'img/imgs/201607041454171754.jpg',4,NULL,4),(13,'新款韩国夏季短袖白色淑女连衣裙',62.00,80.00,2.5,'img/imgs/201607041553065513.jpg',4,NULL,5),(14,'新款名媛气质立体雏菊圆领短款无袖连衣裙背心裙',57.00,70.00,3,'img/imgs/201607041610291958.jpg',5,NULL,6),(15,'2016短袖修身单件女装通勤新款韩版夏季套头夏装气质淑女连衣裙',86.00,90.00,4.2,'img/imgs/201607041618155728.jpg',5,NULL,1),(16,'MOFFI 2016夏季潮流新品欧美风纯色荷叶边蛋糕裙女式雪纺连衣裙',119.00,150.00,2.3,'img/imgs/201607041627479978.jpg',5,NULL,2),(17,'真丝连衣裙2016夏大码女装高档中年修身显瘦中长款淑女重磅桑蚕丝',229.00,250.00,7,'img/imgs/linke_14706258125239.jpg',6,NULL,3),(18,'哥弟 2016夏装正品哥弟新款时尚高贵气质妈妈装修身显瘦短袖连衣裙',359.00,400.00,NULL,'img/imgs/201602260137028067.jpg',6,NULL,4),(19,'哥弟 2016专柜女装正品哥弟短袖连衣裙大牌时尚修身显瘦中长款女装',358.00,400.00,NULL,'img/imgs/201603081354339001.jpg',6,NULL,5),(20,'Daiyisilin 2016夏季新款中老年时尚皱褶妈妈装特大加菲大码复古连衣裙',158.00,180.00,NULL,'img/imgs/201603232239264013.jpg',7,NULL,6),(21,'约诺帝 中老年连衣裙2016夏季新款妈妈装',75.00,100.00,NULL,'img/imgs/201603291959591645.jpg',7,NULL,1),(22,'约诺帝 中老年妈妈装假两件 加肥加大码',85.00,100.00,NULL,'img/imgs/201607292150398516.jpg',7,NULL,2),(23,'ROOM0404 2016高端女装系列韩版简单背带牛仔衫露肩一字肩',119.00,150.00,NULL,'img/imgs/linke_14658706757722.jpg',8,NULL,3),(24,'ROOM0404 2016吊带衫短款宽松无袖外穿衫荷叶边翠花性感露背上衣t恤女',160.00,298.00,NULL,'img/imgs/linke_14658706757722.jpg',8,NULL,4),(25,'ROOM0404 2016夏季潮流新品女装连衣裙',195.00,390.00,NULL,'img/imgs/201605311415521305.jpg',8,NULL,5),(26,'ROOM0404 2016夏季韩版新款连衣裙',190.00,380.00,NULL,'img/imgs/201605311420532242.jpg',9,NULL,6),(27,'ROOM0404 2016夏装欧版新款中长款系带连衣裙女裙',83.00,332.00,NULL,'img/imgs/201606020954307160.jpg',9,NULL,1),(28,'ROOM0404 2016夏季连衣裙仿真丝中长宽松大摆裙 高端',38.00,126.00,NULL,'img/imgs/201606020955437424.jpg',9,NULL,2),(29,'ROOM0404 夏季2016竖条纹打底裙中长款韩版潮',79.00,188.00,NULL,'img/imgs/201606071100167732.jpg',10,NULL,3),(30,'刊菲 2016复古风夏季新款优雅名媛旗袍裙修身蕾丝连衣裙',179.00,760.00,NULL,'img/imgs/201606211029566542.jpg',10,NULL,4),(31,'洛洛卡儿 夏装民族风波西米亚复古碎花拼接吊带裙长款连衣裙长裙',181.00,258.00,NULL,'img/imgs/linke_14658723315531.jpg',10,NULL,5),(32,'洛洛卡儿 2016夏装日系森女系复古圆领碎花中袖雪纺中长款连衣裙',170.00,200.00,NULL,'img/imgs/201603111926478825.jpg',11,NULL,6),(33,'洛洛卡儿 2016春装新款复古小碎花长袖灯芯绒印花拼接中长款连衣裙大码裙',79.00,100.00,NULL,'img/imgs/201603291032029443.jpg',11,NULL,5),(34,'洛洛卡儿 2016夏装新款复古波西米亚浪漫飘逸文艺花朵森女碎花上衣系带雪纺',56.00,70.00,NULL,'img/imgs/201604261227363906.jpg',11,NULL,6),(35,'洛洛卡儿 2015秋装新款复古民族风田园森女系碎花中袖衬衣麻衣衬衫',62.00,80.00,NULL,'img/imgs/201606281641392093.jpg',12,NULL,1),(36,'ROOM0404 2016春装时尚潮新款复古上衣',120.00,150.00,NULL,'img/imgs/201607181752319352.jpg',12,NULL,2),(37,'超仙长裙开叉立体绣花白色蕾丝网纱中袖连衣裙',170.00,NULL,NULL,'img/imgs/linke_14675991774937.jpg',12,NULL,NULL),(38,'尚丝蔓2016夏装新款韩版修身印花无袖两件套连衣裙 显瘦露脐半身套装裙',79.00,NULL,NULL,'img/imgs/linke_14675985285998.jpg',13,NULL,NULL),(39,'2016夏韩国新款女装背心长裙沙滩裙性感露背无袖大摆雪纺连衣裙',56.00,NULL,NULL,'img/imgs/201606161639114423.jpg',13,NULL,NULL),(40,'新款韩国夏季短袖白色淑女连衣裙',62.00,NULL,NULL,'img/imgs/201606211709019676.jpg',13,NULL,NULL),(41,'新款名媛气质立体雏菊圆领短款无袖连衣裙背心裙',57.00,NULL,NULL,'img/imgs/201606211734183033.jpg',14,NULL,NULL),(42,'2016短袖修身单件女装通勤新款韩版夏季套头夏装气质淑女连衣裙',86.00,NULL,NULL,'img/imgs/201606281622183043.jpg',14,NULL,NULL),(43,'MOFFI 2016夏季潮流新品欧美风纯色荷叶边蛋糕裙女式雪纺连衣裙',119.00,NULL,NULL,'img/imgs/linke_14675984387574.jpg',14,NULL,NULL),(44,'真丝连衣裙2016夏大码女装高档中年修身显瘦中长款淑女重磅桑蚕丝',229.00,NULL,NULL,'img/imgs/linke_14691795725688.jpg',15,NULL,NULL),(45,'哥弟 2016夏装正品哥弟新款时尚高贵气质妈妈装修身显瘦短袖连衣裙',359.00,NULL,NULL,'img/imgs/201605311741133889.jpg',15,NULL,NULL),(46,'哥弟 2016专柜女装正品哥弟短袖连衣裙大牌时尚修身显瘦中长款女装',358.00,NULL,NULL,'img/imgs/201605311748327870.jpg',15,NULL,NULL),(47,'Daiyisilin 2016夏季新款中老年时尚皱褶妈妈装特大加菲大码复古连衣裙',158.00,NULL,NULL,'img/imgs/201607221653034365.jpg',16,NULL,NULL),(48,'约诺帝 中老年连衣裙2016夏季新款妈妈装',75.00,NULL,NULL,'img/imgs/201608011141365882.jpg',16,NULL,NULL),(49,'约诺帝 中老年妈妈装假两件 加肥加大码',85.00,NULL,NULL,'img/imgs/201608011143335378.jpg',16,NULL,NULL),(50,'约诺帝 中老年女装夏季新款雪纺连衣裙',85.00,NULL,NULL,'img/imgs/201608011143442924.jpg',17,NULL,NULL),(51,'ROOM0404 2016高端女装系列韩版简单背带牛仔衫露肩一字肩',119.00,NULL,NULL,'img/imgs/linke_14673519349499.jpg',17,NULL,NULL),(52,'ROOM0404 2016吊带衫短款宽松无袖外穿衫荷叶边翠花性感露背上衣t恤女',118.00,NULL,NULL,'img/imgs/201606251736052162.jpg',17,NULL,NULL),(53,'ROOM0404 2016夏季潮流新品女装连衣裙',231.00,NULL,NULL,'img/imgs/201606251751202381.jpg',18,NULL,NULL),(54,'ROOM0404 2016夏季韩版新款连衣裙',181.00,NULL,NULL,'img/imgs/201606251751427984.jpg',18,NULL,NULL),(55,'ROOM0404 2016夏装欧版新款中长款系带连衣裙女裙',174.00,NULL,NULL,'img/imgs/201606251752051684.jpg',18,NULL,NULL),(56,'ROOM0404 2016夏季连衣裙仿真丝中长宽松大摆裙 高端',160.00,NULL,NULL,'img/imgs/201606251754441282.jpg',19,NULL,NULL),(57,'ROOM0404 夏季2016竖条纹打底裙中长款韩版潮',170.00,NULL,NULL,'img/imgs/201606251755128723.jpg',19,NULL,NULL),(58,'刊菲 2016复古风夏季新款优雅名媛旗袍裙修身蕾丝连衣裙',119.00,NULL,NULL,'img/imgs/linke_14673635998747.jpg',19,NULL,NULL),(59,'洛洛卡儿 夏装民族风波西米亚复古碎花拼接吊带裙长款连衣裙长裙',79.00,NULL,NULL,'img/imgs/201606251600438107.jpg',20,NULL,NULL),(60,'洛洛卡儿 2016夏装日系森女系复古圆领碎花中袖雪纺中长款连衣裙',114.00,NULL,NULL,'img/imgs/201606251623459194.jpg',20,NULL,NULL),(61,'洛洛卡儿 2016春装新款复古小碎花长袖灯芯绒印花拼接中长款连衣裙大码裙',98.00,NULL,NULL,'img/imgs/201606251626292411.jpg',20,NULL,NULL),(62,'洛洛卡儿 2016夏装新款复古波西米亚浪漫飘逸文艺花朵森女碎花上衣系带雪纺',78.00,NULL,NULL,'img/imgs/201606251659137066.jpg',21,NULL,NULL),(63,'洛洛卡儿 2015秋装新款复古民族风田园森女系碎花中袖衬衣麻衣衬衫',86.00,NULL,NULL,'img/imgs/201606251700072744.jpg',21,NULL,NULL),(64,'ROOM0404 2016春装时尚潮新款复古上衣',140.00,NULL,NULL,'img/imgs/201606251730423978.jpg',21,NULL,NULL);
/*!40000 ALTER TABLE `good` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `man`
--

DROP TABLE IF EXISTS `man`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `man` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `img` varchar(100) NOT NULL,
  `price` decimal(10,2) NOT NULL,
  `name` varchar(200) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=29 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `man`
--

LOCK TABLES `man` WRITE;
/*!40000 ALTER TABLE `man` DISABLE KEYS */;
INSERT INTO `man` VALUES (1,'img/imgs/linke_14675991774937.jpg',170.00,'超仙长裙开叉立体绣花白色蕾丝网纱中袖连衣裙'),(2,'img/imgs/linke_14675985285998.jpg',79.00,'尚丝蔓2016夏装新款韩版修身印花无袖两件套连衣裙 显瘦露脐半身套装裙'),(3,'img/imgs/201606161639114423.jpg',56.00,'2016夏韩国新款女装背心长裙沙滩裙性感露背无袖大摆雪纺连衣裙'),(4,'img/imgs/201606211709019676.jpg',62.00,'新款韩国夏季短袖白色淑女连衣裙'),(5,'img/imgs/201606211734183033.jpg',57.00,'新款名媛气质立体雏菊圆领短款无袖连衣裙背心裙'),(6,'img/imgs/201606281622183043.jpg',86.00,'2016短袖修身单件女装通勤新款韩版夏季套头夏装气质淑女连衣裙'),(7,'img/imgs/linke_14675984387574.jpg',119.00,'MOFFI 2016夏季潮流新品欧美风纯色荷叶边蛋糕裙女式雪纺连衣裙'),(8,'img/imgs/linke_14691795725688.jpg',229.00,'真丝连衣裙2016夏大码女装高档中年修身显瘦中长款淑女重磅桑蚕丝'),(9,'img/imgs/201605311741133889.jpg',359.00,'哥弟 2016夏装正品哥弟新款时尚高贵气质妈妈装修身显瘦短袖连衣裙'),(10,'img/imgs/201605311748327870.jpg',358.00,'哥弟 2016专柜女装正品哥弟短袖连衣裙大牌时尚修身显瘦中长款女装'),(11,'img/imgs/201607221653034365.jpg',158.00,'Daiyisilin 2016夏季新款中老年时尚皱褶妈妈装特大加菲大码复古连衣裙'),(12,'img/imgs/201608011141365882.jpg',75.00,'约诺帝 中老年连衣裙2016夏季新款妈妈装'),(13,'img/imgs/201608011143335378.jpg',85.00,'约诺帝 中老年妈妈装假两件 加肥加大码'),(14,'img/imgs/201608011143442924.jpg',85.00,'约诺帝 中老年女装夏季新款雪纺连衣裙'),(15,'img/imgs/linke_14673519349499.jpg',119.00,'ROOM0404 2016高端女装系列韩版简单背带牛仔衫露肩一字肩'),(16,'img/imgs/201606251736052162.jpg',118.00,'ROOM0404 2016吊带衫短款宽松无袖外穿衫荷叶边翠花性感露背上衣t恤女'),(17,'img/imgs/201606251751202381.jpg',231.00,'ROOM0404 2016夏季潮流新品女装连衣裙'),(18,'img/imgs/201606251751427984.jpg',181.00,'ROOM0404 2016夏季韩版新款连衣裙'),(19,'img/imgs/201606251752051684.jpg',174.00,'ROOM0404 2016夏装欧版新款中长款系带连衣裙女裙'),(20,'img/imgs/201606251754441282.jpg',160.00,'ROOM0404 2016夏季连衣裙仿真丝中长宽松大摆裙 高端'),(21,'img/imgs/201606251755128723.jpg',170.00,'ROOM0404 夏季2016竖条纹打底裙中长款韩版潮'),(22,'img/imgs/linke_14673635998747.jpg',119.00,'刊菲 2016复古风夏季新款优雅名媛旗袍裙修身蕾丝连衣裙'),(23,'img/imgs/201606251600438107.jpg',79.00,'洛洛卡儿 夏装民族风波西米亚复古碎花拼接吊带裙长款连衣裙长裙'),(24,'img/imgs/201606251623459194.jpg',114.00,'洛洛卡儿 2016夏装日系森女系复古圆领碎花中袖雪纺中长款连衣裙'),(25,'img/imgs/201606251626292411.jpg',98.00,'洛洛卡儿 2016春装新款复古小碎花长袖灯芯绒印花拼接中长款连衣裙大码裙'),(26,'img/imgs/201606251659137066.jpg',78.00,'洛洛卡儿 2016夏装新款复古波西米亚浪漫飘逸文艺花朵森女碎花上衣系带雪纺'),(27,'img/imgs/201606251700072744.jpg',86.00,'洛洛卡儿 2015秋装新款复古民族风田园森女系碎花中袖衬衣麻衣衬衫'),(28,'img/imgs/201606251730423978.jpg',140.00,'ROOM0404 2016春装时尚潮新款复古上衣');
/*!40000 ALTER TABLE `man` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `order`
--

DROP TABLE IF EXISTS `order`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `order` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `status` int(11) NOT NULL,
  `createtime` datetime(6) NOT NULL,
  `identifier` varchar(256) NOT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `order_user_id_e323497c_fk_user_id` (`user_id`),
  CONSTRAINT `order_user_id_e323497c_fk_user_id` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=43 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `order`
--

LOCK TABLES `order` WRITE;
/*!40000 ALTER TABLE `order` DISABLE KEYS */;
INSERT INTO `order` VALUES (42,0,'2019-01-19 02:32:55.988675','15478651750.5272093618925957',1);
/*!40000 ALTER TABLE `order` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ordergood`
--

DROP TABLE IF EXISTS `ordergood`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ordergood` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `number` int(11) NOT NULL,
  `size` varchar(20) NOT NULL,
  `color` varchar(20) NOT NULL,
  `good_id` int(11) NOT NULL,
  `order_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `ordergood_order_id_27b172a9_fk_order_id` (`order_id`),
  KEY `ordergood_good_id_30641557_fk_good_id` (`good_id`),
  CONSTRAINT `ordergood_good_id_30641557_fk_good_id` FOREIGN KEY (`good_id`) REFERENCES `good` (`id`),
  CONSTRAINT `ordergood_order_id_27b172a9_fk_order_id` FOREIGN KEY (`order_id`) REFERENCES `order` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ordergood`
--

LOCK TABLES `ordergood` WRITE;
/*!40000 ALTER TABLE `ordergood` DISABLE KEYS */;
INSERT INTO `ordergood` VALUES (8,5,'S','红色',1,42);
/*!40000 ALTER TABLE `ordergood` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(100) NOT NULL,
  `password` varchar(100) NOT NULL,
  `token` varchar(255) NOT NULL,
  `headimg` varchar(100) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` VALUES (1,'mingxinye123','e10adc3949ba59abbe56e057f20f883e','8cd897ef206b8adf0c975626e16567d0','img/imgs/desk.jpg');
/*!40000 ALTER TABLE `user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `woman`
--

DROP TABLE IF EXISTS `woman`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `woman` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `img` varchar(100) NOT NULL,
  `price` decimal(10,2) NOT NULL,
  `name` varchar(200) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=65 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `woman`
--

LOCK TABLES `woman` WRITE;
/*!40000 ALTER TABLE `woman` DISABLE KEYS */;
INSERT INTO `woman` VALUES (37,'img/imgs/linke_14675991774937.jpg',170.00,'超仙长裙开叉立体绣花白色蕾丝网纱中袖连衣裙'),(38,'img/imgs/linke_14675985285998.jpg',79.00,'尚丝蔓2016夏装新款韩版修身印花无袖两件套连衣裙 显瘦露脐半身套装裙'),(39,'img/imgs/201606161639114423.jpg',56.00,'2016夏韩国新款女装背心长裙沙滩裙性感露背无袖大摆雪纺连衣裙'),(40,'img/imgs/201606211709019676.jpg',62.00,'新款韩国夏季短袖白色淑女连衣裙'),(41,'img/imgs/201606211734183033.jpg',57.00,'新款名媛气质立体雏菊圆领短款无袖连衣裙背心裙'),(42,'img/imgs/201606281622183043.jpg',86.00,'2016短袖修身单件女装通勤新款韩版夏季套头夏装气质淑女连衣裙'),(43,'img/imgs/linke_14675984387574.jpg',119.00,'MOFFI 2016夏季潮流新品欧美风纯色荷叶边蛋糕裙女式雪纺连衣裙'),(44,'img/imgs/linke_14691795725688.jpg',229.00,'真丝连衣裙2016夏大码女装高档中年修身显瘦中长款淑女重磅桑蚕丝'),(45,'img/imgs/201605311741133889.jpg',359.00,'哥弟 2016夏装正品哥弟新款时尚高贵气质妈妈装修身显瘦短袖连衣裙'),(46,'img/imgs/201605311748327870.jpg',358.00,'哥弟 2016专柜女装正品哥弟短袖连衣裙大牌时尚修身显瘦中长款女装'),(47,'img/imgs/201607221653034365.jpg',158.00,'Daiyisilin 2016夏季新款中老年时尚皱褶妈妈装特大加菲大码复古连衣裙'),(48,'img/imgs/201608011141365882.jpg',75.00,'约诺帝 中老年连衣裙2016夏季新款妈妈装'),(49,'img/imgs/201608011143335378.jpg',85.00,'约诺帝 中老年妈妈装假两件 加肥加大码'),(50,'img/imgs/201608011143442924.jpg',85.00,'约诺帝 中老年女装夏季新款雪纺连衣裙'),(51,'img/imgs/linke_14673519349499.jpg',119.00,'ROOM0404 2016高端女装系列韩版简单背带牛仔衫露肩一字肩'),(52,'img/imgs/201606251736052162.jpg',118.00,'ROOM0404 2016吊带衫短款宽松无袖外穿衫荷叶边翠花性感露背上衣t恤女'),(53,'img/imgs/201606251751202381.jpg',231.00,'ROOM0404 2016夏季潮流新品女装连衣裙'),(54,'img/imgs/201606251751427984.jpg',181.00,'ROOM0404 2016夏季韩版新款连衣裙'),(55,'img/imgs/201606251752051684.jpg',174.00,'ROOM0404 2016夏装欧版新款中长款系带连衣裙女裙'),(56,'img/imgs/201606251754441282.jpg',160.00,'ROOM0404 2016夏季连衣裙仿真丝中长宽松大摆裙 高端'),(57,'img/imgs/201606251755128723.jpg',170.00,'ROOM0404 夏季2016竖条纹打底裙中长款韩版潮'),(58,'img/imgs/linke_14673635998747.jpg',119.00,'刊菲 2016复古风夏季新款优雅名媛旗袍裙修身蕾丝连衣裙'),(59,'img/imgs/201606251600438107.jpg',79.00,'洛洛卡儿 夏装民族风波西米亚复古碎花拼接吊带裙长款连衣裙长裙'),(60,'img/imgs/201606251623459194.jpg',114.00,'洛洛卡儿 2016夏装日系森女系复古圆领碎花中袖雪纺中长款连衣裙'),(61,'img/imgs/201606251626292411.jpg',98.00,'洛洛卡儿 2016春装新款复古小碎花长袖灯芯绒印花拼接中长款连衣裙大码裙'),(62,'img/imgs/201606251659137066.jpg',78.00,'洛洛卡儿 2016夏装新款复古波西米亚浪漫飘逸文艺花朵森女碎花上衣系带雪纺'),(63,'img/imgs/201606251700072744.jpg',86.00,'洛洛卡儿 2015秋装新款复古民族风田园森女系碎花中袖衬衣麻衣衬衫'),(64,'img/imgs/201606251730423978.jpg',140.00,'ROOM0404 2016春装时尚潮新款复古上衣');
/*!40000 ALTER TABLE `woman` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2019-01-19 11:29:38
