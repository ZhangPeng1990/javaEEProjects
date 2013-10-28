/*
SQLyog Ultimate v9.60 
MySQL - 5.5.10 : Database - tushu
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`tushu` /*!40100 DEFAULT CHARACTER SET utf8 */;

USE `tushu`;

/*Table structure for table `address_message` */

DROP TABLE IF EXISTS `address_message`;

CREATE TABLE `address_message` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_Id` bigint(20) DEFAULT NULL,
  `order_Form_Id` bigint(20) DEFAULT NULL,
  `recipients_Name` varchar(32) DEFAULT NULL,
  `province` varchar(32) DEFAULT NULL,
  `city` varchar(32) DEFAULT NULL,
  `county` varchar(32) DEFAULT NULL,
  `street` varchar(256) DEFAULT NULL,
  `phone` varchar(32) DEFAULT NULL,
  `tel` varchar(32) DEFAULT NULL,
  `email` varchar(32) DEFAULT NULL,
  `post_Code` varchar(32) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8;

/*Data for the table `address_message` */

insert  into `address_message`(`id`,`user_Id`,`order_Form_Id`,`recipients_Name`,`province`,`city`,`county`,`street`,`phone`,`tel`,`email`,`post_Code`) values (10,2,NULL,'李国民','湖北省','襄樊市','樊城区','颐和园北宫门 上河沿路 美联超市','15644456321','','123123@163.com','123121'),(11,2,NULL,'张飞','河北省','承德市','丰宁满族自治县','阿飞家 102号','15655578943','','31537121@qq.com','123232'),(15,2,NULL,'李明博','吉林省','松原市','三岔河镇','12加款加多少的 是','1213223223','','1212@qq.com','100080');

/*Table structure for table `base_user` */

DROP TABLE IF EXISTS `base_user`;

CREATE TABLE `base_user` (
  `ID` bigint(20) NOT NULL AUTO_INCREMENT,
  `USER_NAME` varchar(128) DEFAULT NULL,
  `PASSWORD` varchar(128) DEFAULT NULL,
  `INSERT_TIME` datetime DEFAULT NULL,
  `UPDATE_TIME` datetime DEFAULT NULL,
  `userState` enum('ADMIN','CUSTOMER') DEFAULT NULL,
  `nick_Nname` varchar(32) DEFAULT NULL,
  `image_Id` int(11) DEFAULT NULL,
  `real_Name` varchar(32) DEFAULT NULL,
  `sex` varchar(6) DEFAULT NULL,
  `birth_Day` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8;

/*Data for the table `base_user` */

insert  into `base_user`(`ID`,`USER_NAME`,`PASSWORD`,`INSERT_TIME`,`UPDATE_TIME`,`userState`,`nick_Nname`,`image_Id`,`real_Name`,`sex`,`birth_Day`) values (1,'admin','123','2013-09-07 20:38:51','2013-09-07 20:38:55','ADMIN',NULL,NULL,NULL,NULL,NULL),(2,'123@163.com','123','2013-09-08 15:59:01','2013-09-08 15:59:05','CUSTOMER',NULL,NULL,NULL,NULL,NULL),(3,'涂书网','123','2013-09-08 17:11:44','2013-09-08 17:11:46','CUSTOMER',NULL,NULL,NULL,NULL,NULL),(5,'123123@163.com','aaa123123','2013-09-09 17:49:35','2013-09-09 17:49:35','CUSTOMER',NULL,NULL,NULL,NULL,NULL),(6,'5489498@163.com','123123bb','2013-09-09 17:52:54','2013-09-09 17:52:54','CUSTOMER',NULL,NULL,NULL,NULL,NULL),(7,'123456@qq.com','123123a','2013-09-09 17:53:17','2013-09-09 17:53:17','CUSTOMER',NULL,NULL,NULL,NULL,NULL),(8,'111@qq.com','123123','2013-09-30 17:25:07','2013-09-30 17:25:07','CUSTOMER',NULL,NULL,NULL,NULL,NULL),(9,'212232@qq.com','123456','2013-10-24 15:43:58','2013-10-24 15:43:58','CUSTOMER',NULL,NULL,NULL,NULL,NULL),(10,'1234567@qq.com','123123','2013-10-24 15:48:24','2013-10-24 15:48:24','CUSTOMER',NULL,NULL,NULL,NULL,NULL),(11,'1111@qq.com','123456','2013-10-24 15:52:28','2013-10-24 15:52:28','CUSTOMER',NULL,NULL,NULL,NULL,NULL),(12,'2222@qq.com','123456','2013-10-24 15:59:10','2013-10-24 15:59:10','CUSTOMER',NULL,NULL,NULL,NULL,NULL),(13,'3333@qq.com','123456','2013-10-24 16:03:00','2013-10-24 16:03:01','CUSTOMER',NULL,NULL,NULL,NULL,NULL),(14,'5555@qq.com','123456','2013-10-24 16:16:10','2013-10-24 16:16:10','CUSTOMER',NULL,NULL,NULL,NULL,NULL);

/*Table structure for table `express_message` */

DROP TABLE IF EXISTS `express_message`;

CREATE TABLE `express_message` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `express_Name` varchar(128) DEFAULT NULL,
  `express_Price` double DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

/*Data for the table `express_message` */

insert  into `express_message`(`id`,`express_Name`,`express_Price`) values (1,'EMS',20),(2,'顺丰快递',22),(3,'中通快递',10);

/*Table structure for table `images` */

DROP TABLE IF EXISTS `images`;

CREATE TABLE `images` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(128) DEFAULT NULL,
  `url` varchar(256) DEFAULT NULL,
  `index` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=utf8;

/*Data for the table `images` */

insert  into `images`(`id`,`name`,`url`,`index`) values (1,'lomo.jpg','/styles/images/lomo.jpg',1),(2,'book.jpg','/styles/images/book.jpg',2),(3,'log.jpg','/styles/images/log.jpg',3),(4,'family.jpg','/styles/images/family.jpg',4),(5,'1_004.jpg','/styles/images/1_004.jpg',1),(6,'2.jpg','/styles/images/2.jpg',2),(7,'3.jpg','/styles/images/3.jpg',3),(8,'4_004.jpg','/styles/images/4_004.jpg',4),(9,'5_003.jpg','/styles/images/5_003.jpg',5),(10,'1_002.jpg','/styles/images/1_002.jpg',1),(11,'2_003.jpg','/styles/images/2_003.jpg',2),(12,'3_004.jpg','/styles/images/3_004.jpg',3),(13,'4_002.jpg','/styles/images/4_002.jpg',4),(14,'5_004.jpg','/styles/images/5_004.jpg',5),(15,'1_005.jpg','/styles/images/1_005.jpg',1),(16,'2_006.jpg','/styles/images/2_006.jpg',2),(17,'3_005.jpg','/styles/images/3_005.jpg',3),(18,'4_003.jpg','/styles/images/4_003.jpg',4),(19,'5.jpg','/styles/images/5.jpg',5),(20,'1.jpg','/styles/images/1.jpg',1),(21,'2_004.jpg','/styles/images/2_004.jpg',2),(22,'3_003.jpg','/styles/images/3_003.jpg',3),(23,'4_005.jpg','/styles/images/4_005.jpg',4),(24,'5_002.jpg','/styles/images/5_002.jpg',5);

/*Table structure for table `index_show_type` */

DROP TABLE IF EXISTS `index_show_type`;

CREATE TABLE `index_show_type` (
  `id` int(6) NOT NULL AUTO_INCREMENT,
  `name` varchar(128) DEFAULT NULL,
  `describe` varchar(256) DEFAULT NULL,
  `type` enum('EXHIBITION','ACTIVITY') DEFAULT NULL,
  `index` int(6) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

/*Data for the table `index_show_type` */

insert  into `index_show_type`(`id`,`name`,`describe`,`type`,`index`) values (1,'热门推荐',NULL,'EXHIBITION',1),(2,'校园回忆录','记录学生时代的快乐时光','EXHIBITION',2),(3,'宝宝成长录','你眉头开了，所以我们笑了','EXHIBITION',3),(4,'旅行回忆录','记录下每一次难忘的旅行时光','EXHIBITION',4),(5,'爱的纪念品','你的美好，我会为你收起','EXHIBITION',5);

/*Table structure for table `inform` */

DROP TABLE IF EXISTS `inform`;

CREATE TABLE `inform` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `userId` bigint(20) DEFAULT NULL,
  `senderId` bigint(20) DEFAULT NULL,
  `title` varchar(128) DEFAULT NULL,
  `content` text,
  `insertTime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8;

/*Data for the table `inform` */

insert  into `inform`(`id`,`userId`,`senderId`,`title`,`content`,`insertTime`) values (3,10,3,'欢迎注册','Hi 1234567@qq.com欢迎注册本网站','2013-10-24 15:48:24'),(4,11,3,'欢迎注册','Hi 1111@qq.com! 欢迎注册本网站','2013-10-24 15:52:45'),(5,12,3,'欢迎注册','Hi 2222@qq.com! 欢迎注册本网站','2013-10-24 15:59:43'),(6,13,3,'欢迎注册','Hi 3333@qq.com! 欢迎注册本网站','2013-10-24 16:03:19'),(9,14,3,'欢迎注册','Hi 5555@qq.com! 欢迎注册本网站','2013-10-24 16:16:20');

/*Table structure for table `order_form` */

DROP TABLE IF EXISTS `order_form`;

CREATE TABLE `order_form` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `order_Number` varchar(128) DEFAULT NULL,
  `user_Id` int(11) DEFAULT NULL,
  `product_Id` int(11) DEFAULT NULL,
  `create_Time` datetime DEFAULT NULL,
  `payment_Time` datetime DEFAULT NULL,
  `order_Type` enum('SHOPPING_CART','NON_PAYMENT','ACCOUNT_PAID') DEFAULT NULL,
  `product_Number` int(11) DEFAULT NULL,
  `amount_Payable` double DEFAULT NULL,
  `express_Message` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8;

/*Data for the table `order_form` */

insert  into `order_form`(`id`,`order_Number`,`user_Id`,`product_Id`,`create_Time`,`payment_Time`,`order_Type`,`product_Number`,`amount_Payable`,`express_Message`) values (11,'30E4E813-9EC6-43B3-9BB1-075AF4A730B7',1,2,'2013-09-18 13:59:18',NULL,'NON_PAYMENT',3,30,NULL),(16,'03478ECC-D7A9-4DFA-B7F4-A5B72AAAE42F',2,1,'2013-10-25 17:28:33',NULL,'NON_PAYMENT',3,30,NULL);

/*Table structure for table `product` */

DROP TABLE IF EXISTS `product`;

CREATE TABLE `product` (
  `product_Id` int(11) NOT NULL AUTO_INCREMENT,
  `index_Show_Type_Id` int(11) DEFAULT NULL,
  `name` varchar(128) DEFAULT NULL,
  `sell_Price` double DEFAULT NULL,
  `market_Price` double DEFAULT NULL,
  `pages` int(11) DEFAULT NULL,
  `freight` double DEFAULT NULL,
  `product_Standard` varchar(256) DEFAULT NULL,
  `product_Material` varchar(256) DEFAULT NULL,
  `product_Process` varchar(256) DEFAULT NULL,
  `production_Cycle` varchar(128) DEFAULT NULL,
  `content1` varchar(128) DEFAULT NULL,
  `content2` varchar(256) DEFAULT NULL,
  `content3` varchar(256) DEFAULT NULL,
  `content4` varchar(256) DEFAULT NULL,
  `image_Id` int(26) DEFAULT NULL,
  `index_Show_Image_Type` enum('CROSSWISE','LENGTHWAYS') DEFAULT NULL,
  `view_Count` int(11) DEFAULT NULL,
  `saled_Count` int(11) DEFAULT NULL,
  PRIMARY KEY (`product_Id`)
) ENGINE=InnoDB AUTO_INCREMENT=26 DEFAULT CHARSET=utf8;

/*Data for the table `product` */

insert  into `product`(`product_Id`,`index_Show_Type_Id`,`name`,`sell_Price`,`market_Price`,`pages`,`freight`,`product_Standard`,`product_Material`,`product_Process`,`production_Cycle`,`content1`,`content2`,`content3`,`content4`,`image_Id`,`index_Show_Image_Type`,`view_Count`,`saled_Count`) values (1,1,'简简单单',10,19.9,16,10,'58x85mm','哑粉纸','Indigo印刷','3—5个工作日（不包含配送时间）','﻿LOMO卡它就像一款小巧的精致品，虽然个头不大，但却别具特色。',NULL,NULL,NULL,1,'LENGTHWAYS',41,0),(2,1,'炫彩',10,19.9,16,10,'58x85mm','哑粉纸','Indigo印刷','3—5个工作日（不包含配送时间）','﻿LOMO卡它就像一款小巧的精致品，虽然个头不大，但却别具特色。',NULL,NULL,NULL,2,'LENGTHWAYS',92,0),(3,1,'炫彩',10,19.9,16,10,'58x85mm','哑粉纸','Indigo印刷','3—5个工作日（不包含配送时间）','﻿LOMO卡它就像一款小巧的精致品，虽然个头不大，但却别具特色。',NULL,NULL,NULL,3,'LENGTHWAYS',23,0),(4,1,'炫彩',10,19.9,16,10,'58x85mm','哑粉纸','Indigo印刷','3—5个工作日（不包含配送时间）','﻿LOMO卡它就像一款小巧的精致品，虽然个头不大，但却别具特色。',NULL,NULL,NULL,4,'LENGTHWAYS',6,0),(5,2,'炫彩',10,19.9,16,10,'58x85mm','哑粉纸','Indigo印刷','3—5个工作日（不包含配送时间）','﻿LOMO卡它就像一款小巧的精致品，虽然个头不大，但却别具特色。',NULL,NULL,NULL,1,'LENGTHWAYS',0,0),(6,2,'炫彩',10,19.9,16,10,'58x85mm','哑粉纸','Indigo印刷','3—5个工作日（不包含配送时间）','﻿LOMO卡它就像一款小巧的精致品，虽然个头不大，但却别具特色。',NULL,NULL,NULL,2,'LENGTHWAYS',5,0),(7,2,'炫彩',10,19.9,16,10,'58x85mm','哑粉纸','Indigo印刷','3—5个工作日（不包含配送时间）','﻿LOMO卡它就像一款小巧的精致品，虽然个头不大，但却别具特色。',NULL,NULL,NULL,3,'LENGTHWAYS',2,0),(8,2,'炫彩',10,19.9,16,10,'58x85mm','哑粉纸','Indigo印刷','3—5个工作日（不包含配送时间）','﻿LOMO卡它就像一款小巧的精致品，虽然个头不大，但却别具特色。',NULL,NULL,NULL,4,'LENGTHWAYS',2,0),(10,3,'炫彩',10,19.9,16,10,'58x85mm','哑粉纸','Indigo印刷','3—5个工作日（不包含配送时间）','﻿LOMO卡它就像一款小巧的精致品，虽然个头不大，但却别具特色。',NULL,NULL,NULL,1,'LENGTHWAYS',0,0),(11,3,'炫彩',10,19.9,16,10,'58x85mm','哑粉纸','Indigo印刷','3—5个工作日（不包含配送时间）','﻿LOMO卡它就像一款小巧的精致品，虽然个头不大，但却别具特色。',NULL,NULL,NULL,2,'LENGTHWAYS',1,0),(12,3,'炫彩',10,19.9,16,10,'58x85mm','哑粉纸','Indigo印刷','3—5个工作日（不包含配送时间）','﻿LOMO卡它就像一款小巧的精致品，虽然个头不大，但却别具特色。',NULL,NULL,NULL,3,'LENGTHWAYS',1,0),(13,3,'炫彩',10,19.9,16,10,'58x85mm','哑粉纸','Indigo印刷','3—5个工作日（不包含配送时间）','﻿LOMO卡它就像一款小巧的精致品，虽然个头不大，但却别具特色。',NULL,NULL,NULL,4,'LENGTHWAYS',1,0),(16,4,'炫彩',10,19.9,16,10,'58x85mm','哑粉纸','Indigo印刷','3—5个工作日（不包含配送时间）','﻿LOMO卡它就像一款小巧的精致品，虽然个头不大，但却别具特色。',NULL,NULL,NULL,1,'LENGTHWAYS',0,0),(17,4,'炫彩',10,19.9,16,10,'58x85mm','哑粉纸','Indigo印刷','3—5个工作日（不包含配送时间）','﻿LOMO卡它就像一款小巧的精致品，虽然个头不大，但却别具特色。',NULL,NULL,NULL,2,'LENGTHWAYS',0,0),(19,4,'炫彩',10,19.9,16,10,'58x85mm','哑粉纸','Indigo印刷','3—5个工作日（不包含配送时间）','﻿LOMO卡它就像一款小巧的精致品，虽然个头不大，但却别具特色。',NULL,NULL,NULL,3,'LENGTHWAYS',0,0),(20,4,'炫彩',10,19.9,16,10,'58x85mm','哑粉纸','Indigo印刷','3—5个工作日（不包含配送时间）','﻿LOMO卡它就像一款小巧的精致品，虽然个头不大，但却别具特色。',NULL,NULL,NULL,4,'LENGTHWAYS',0,0),(21,5,'炫彩',10,19.9,16,10,'58x85mm','哑粉纸','Indigo印刷','3—5个工作日（不包含配送时间）','﻿LOMO卡它就像一款小巧的精致品，虽然个头不大，但却别具特色。',NULL,NULL,NULL,1,'LENGTHWAYS',0,0),(22,5,'炫彩',10,19.9,16,10,'58x85mm','哑粉纸','Indigo印刷','3—5个工作日（不包含配送时间）','﻿LOMO卡它就像一款小巧的精致品，虽然个头不大，但却别具特色。',NULL,NULL,NULL,2,'LENGTHWAYS',0,0),(24,5,'炫彩',10,19.9,16,10,'58x85mm','哑粉纸','Indigo印刷','3—5个工作日（不包含配送时间）','﻿LOMO卡它就像一款小巧的精致品，虽然个头不大，但却别具特色。',NULL,NULL,NULL,3,'LENGTHWAYS',0,0),(25,5,'炫彩',10,19.9,16,10,'58x85mm','哑粉纸','Indigo印刷','3—5个工作日（不包含配送时间）','﻿LOMO卡它就像一款小巧的精致品，虽然个头不大，但却别具特色。',NULL,NULL,NULL,4,'LENGTHWAYS',0,0);

/*Table structure for table `product_type` */

DROP TABLE IF EXISTS `product_type`;

CREATE TABLE `product_type` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(128) NOT NULL,
  `father_Id` int(11) DEFAULT NULL,
  `product_Id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=84 DEFAULT CHARSET=utf8;

/*Data for the table `product_type` */

insert  into `product_type`(`id`,`name`,`father_Id`,`product_Id`) values (2,'微博书',NULL,NULL),(3,'照片书',NULL,NULL),(4,'海报',NULL,NULL),(5,'卡片',NULL,NULL),(6,'日历',NULL,NULL),(7,'收藏版',2,NULL),(8,'炫彩',7,1),(9,'怀旧',7,2),(10,'星★STAR',7,1),(11,'微博主题',7,2),(12,'创意版',2,NULL),(13,'CD书',12,1),(14,'亲子写真',3,NULL),(15,'校园写真',3,NULL),(16,'旅行写真',3,NULL),(17,'爱的写真',3,NULL),(18,'个人写真',3,1),(19,'小小少年',14,2),(20,'家庭日记',14,2),(21,'妈咪宝贝',14,2),(22,'童年的色彩',14,1),(23,'幻彩童年',14,2),(24,'宝贝成长记录',14,3),(25,'童心飞扬',14,1),(26,'青春记忆',15,2),(27,'纯真年代',15,2),(28,'毕业纪念册',15,1),(29,'那些人那些事',15,2),(30,'旅行梦',16,1),(31,'摄影画册',16,1),(32,'我们的旅行日志',16,1),(33,'爱情故事',17,2),(34,'喜爱一生',17,3),(35,'因为爱情',17,4),(36,'花样年华',18,1),(37,'咫尺繁华',18,2),(38,'我的青春我做主',18,1),(39,'校园海报',4,NULL),(40,'个人海报',4,NULL),(41,'亲子海报',4,NULL),(42,'爱的海报',4,NULL),(43,'旅行海报',4,NULL),(44,'节日海报',4,NULL),(45,'同窗情',39,1),(46,'大学时光',39,2),(47,'奋斗青春',39,1),(48,'我们毕业啦',39,2),(49,'标准海报',40,1),(50,'Shine个人海报',40,2),(51,'ShowTime照片海报',40,1),(52,'BabyFace宝宝海报',41,2),(53,'哈尼宝贝封面海报',41,1),(54,'Love创意海报',42,2),(55,'佳缘封面海报',42,1),(56,'爱旅程封面海报',43,2),(57,'Trave封面海报',43,1),(58,'Vissions Trave照片海报',43,2),(59,'新春海报',44,1),(60,'明信片',5,NULL),(61,'LOMO卡',5,NULL),(62,'标准明信片',60,1),(63,'新春明信片',60,2),(64,'新年明信片',60,1),(65,'婚恋明信片',60,2),(66,'亲子明信片',60,1),(67,'旅行明信片',60,2),(68,'多彩生活',61,1),(69,'简简单单',61,2),(70,'校园时光',61,1),(71,'纯真校园',61,2),(72,'同学留念',61,1),(73,'青春纪念',61,2),(74,'简简单单35',61,1),(75,'多彩生活35',61,2),(76,'年历',6,NULL),(77,'台历',6,NULL),(78,'挂历',6,NULL),(79,'年历时尚版',76,1),(80,'年历新春版',76,2),(81,'台历时尚款',77,3),(82,'台历家庭款',77,1),(83,'挂历',78,2);

/*Table structure for table `work_message` */

DROP TABLE IF EXISTS `work_message`;

CREATE TABLE `work_message` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `product_Id` int(11) DEFAULT NULL,
  `user_Id` bigint(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `work_message` */

/*Table structure for table `work_relationship_image` */

DROP TABLE IF EXISTS `work_relationship_image`;

CREATE TABLE `work_relationship_image` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `work_Id` int(11) NOT NULL,
  `image_Id` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `work_relationship_image` */

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
