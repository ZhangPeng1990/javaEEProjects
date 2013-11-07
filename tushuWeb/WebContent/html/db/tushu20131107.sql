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
  `image_name` varchar(128) DEFAULT NULL,
  `url` varchar(256) DEFAULT NULL,
  `image_index` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=237 DEFAULT CHARSET=utf8;

/*Data for the table `images` */

insert  into `images`(`id`,`image_name`,`url`,`image_index`) values (1,'lomo.jpg','/styles/images/lomo.jpg',1),(2,'book.jpg','/styles/images/book.jpg',2),(3,'log.jpg','/styles/images/log.jpg',3),(4,'family.jpg','/styles/images/family.jpg',4),(5,'1_004.jpg','/styles/images/1_004.jpg',1),(6,'2.jpg','/styles/images/2.jpg',2),(7,'3.jpg','/styles/images/3.jpg',3),(8,'4_004.jpg','/styles/images/4_004.jpg',4),(9,'5_003.jpg','/styles/images/5_003.jpg',5),(10,'1_002.jpg','/styles/images/1_002.jpg',1),(11,'2_003.jpg','/styles/images/2_003.jpg',2),(12,'3_004.jpg','/styles/images/3_004.jpg',3),(13,'4_002.jpg','/styles/images/4_002.jpg',4),(14,'5_004.jpg','/styles/images/5_004.jpg',5),(15,'1_005.jpg','/styles/images/1_005.jpg',1),(16,'2_006.jpg','/styles/images/2_006.jpg',2),(17,'3_005.jpg','/styles/images/3_005.jpg',3),(18,'4_003.jpg','/styles/images/4_003.jpg',4),(19,'5.jpg','/styles/images/5.jpg',5),(20,'1.jpg','/styles/images/1.jpg',1),(21,'2_004.jpg','/styles/images/2_004.jpg',2),(22,'3_003.jpg','/styles/images/3_003.jpg',3),(23,'4_005.jpg','/styles/images/4_005.jpg',4),(24,'5_002.jpg','/styles/images/5_002.jpg',5),(33,'1383024153387.jpg','/imageSpace/users/2/1383024153387.jpg',0),(34,'1383024153505.jpg','/imageSpace/users/2/1383024153505.jpg',0),(35,'1383024153636.jpg','/imageSpace/users/2/1383024153636.jpg',0),(36,'1383024153733.jpg','/imageSpace/users/2/1383024153733.jpg',0),(37,'1383024298878.jpg','/imageSpace/users/2/1383024298878.jpg',0),(38,'1383024298982.jpg','/imageSpace/users/2/1383024298982.jpg',0),(39,'1383024299081.jpg','/imageSpace/users/2/1383024299081.jpg',0),(40,'1383024299144.jpg','/imageSpace/users/2/1383024299144.jpg',0),(41,'1383024299233.jpg','/imageSpace/users/2/1383024299233.jpg',0),(42,'1383033673782.jpg','/imageSpace/users/2/1383033673782.jpg',0),(43,'1383033675836.jpg','/imageSpace/users/2/1383033675836.jpg',0),(44,'1383033675956.jpg','/imageSpace/users/2/1383033675956.jpg',0),(45,'1383033676384.jpg','/imageSpace/users/2/1383033676384.jpg',0),(46,'1383033676502.jpg','/imageSpace/users/2/1383033676502.jpg',0),(47,'1383033921153.jpg','/imageSpace/users/2/1383033921153.jpg',0),(48,'1383033921344.jpg','/imageSpace/users/2/1383033921344.jpg',0),(49,'1383033921433.jpg','/imageSpace/users/2/1383033921433.jpg',0),(50,'1383033921585.jpg','/imageSpace/users/2/1383033921585.jpg',0),(51,'1383033921682.jpg','/imageSpace/users/2/1383033921682.jpg',0),(52,'1383034015801.jpg','/imageSpace/users/2/1383034015801.jpg',0),(53,'1383034051379.jpg','/imageSpace/users/2/1383034051379.jpg',0),(54,'1383034074746.jpg','/imageSpace/users/2/1383034074746.jpg',0),(55,'1383034088543.jpg','/imageSpace/users/2/1383034088543.jpg',0),(56,'1383034089931.jpg','/imageSpace/users/2/1383034089931.jpg',0),(57,'1383198117634.jpg','/imageSpace/users/2/1383198117634.jpg',0),(58,'1383198119693.jpg','/imageSpace/users/2/1383198119693.jpg',0),(59,'1383198119815.jpg','/imageSpace/users/2/1383198119815.jpg',0),(60,'1383198119993.jpg','/imageSpace/users/2/1383198119993.jpg',0),(61,'1383198120103.jpg','/imageSpace/users/2/1383198120103.jpg',0),(62,'1383198232191.jpg','/imageSpace/users/2/1383198232191.jpg',0),(63,'1383198232304.jpg','/imageSpace/users/2/1383198232304.jpg',0),(64,'1383198232391.jpg','/imageSpace/users/2/1383198232391.jpg',0),(65,'1383198232500.jpg','/imageSpace/users/2/1383198232500.jpg',0),(66,'1383198232593.jpg','/imageSpace/users/2/1383198232593.jpg',0),(67,'1383198677007.jpg','/imageSpace/users/2/1383198677007.jpg',0),(68,'1383198677148.jpg','/imageSpace/users/2/1383198677148.jpg',0),(69,'1383198677241.jpg','/imageSpace/users/2/1383198677241.jpg',0),(70,'1383198677311.jpg','/imageSpace/users/2/1383198677311.jpg',0),(71,'1383198677393.jpg','/imageSpace/users/2/1383198677393.jpg',0),(72,'1383198733759.jpg','/imageSpace/users/2/1383198733759.jpg',0),(73,'1383198733894.jpg','/imageSpace/users/2/1383198733894.jpg',0),(74,'1383198733972.jpg','/imageSpace/users/2/1383198733972.jpg',0),(75,'1383198734107.jpg','/imageSpace/users/2/1383198734107.jpg',0),(76,'1383198734292.jpg','/imageSpace/users/2/1383198734292.jpg',0),(77,'1383202944743.jpg','/imageSpace/users/2/1383202944743.jpg',0),(78,'1383202945295.jpg','/imageSpace/users/2/1383202945295.jpg',0),(79,'1383202945443.jpg','/imageSpace/users/2/1383202945443.jpg',0),(80,'1383202945592.jpg','/imageSpace/users/2/1383202945592.jpg',0),(81,'1383202945702.jpg','/imageSpace/users/2/1383202945702.jpg',0),(82,'1383206062832.jpg','/imageSpace/users/2/1383206062832.jpg',0),(83,'1383206063596.jpg','/imageSpace/users/2/1383206063596.jpg',0),(84,'1383206063873.jpg','/imageSpace/users/2/1383206063873.jpg',0),(85,'1383206064042.jpg','/imageSpace/users/2/1383206064042.jpg',0),(86,'1383206064162.jpg','/imageSpace/users/2/1383206064162.jpg',0),(87,'1383206417715.jpg','/imageSpace/users/2/1383206417715.jpg',0),(88,'1383206417845.jpg','/imageSpace/users/2/1383206417845.jpg',0),(89,'1383206417915.jpg','/imageSpace/users/2/1383206417915.jpg',0),(90,'1383206418001.jpg','/imageSpace/users/2/1383206418001.jpg',0),(91,'1383206418115.jpg','/imageSpace/users/2/1383206418115.jpg',0),(92,'1383206465066.jpg','/imageSpace/users/2/1383206465066.jpg',0),(93,'1383206465167.jpg','/imageSpace/users/2/1383206465167.jpg',0),(94,'1383206465300.jpg','/imageSpace/users/2/1383206465300.jpg',0),(95,'1383206465391.jpg','/imageSpace/users/2/1383206465391.jpg',0),(96,'1383206465500.jpg','/imageSpace/users/2/1383206465500.jpg',0),(97,'1383206917525.jpg','/imageSpace/users/2/1383206917525.jpg',0),(98,'1383206917660.jpg','/imageSpace/users/2/1383206917660.jpg',0),(99,'1383206917823.jpg','/imageSpace/users/2/1383206917823.jpg',0),(100,'1383206918051.jpg','/imageSpace/users/2/1383206918051.jpg',0),(101,'1383206918165.jpg','/imageSpace/users/2/1383206918165.jpg',0),(102,'1383206990152.jpg','/imageSpace/users/2/1383206990152.jpg',0),(103,'1383206990343.jpg','/imageSpace/users/2/1383206990343.jpg',0),(104,'1383206990440.jpg','/imageSpace/users/2/1383206990440.jpg',0),(105,'1383206990541.jpg','/imageSpace/users/2/1383206990541.jpg',0),(106,'1383206990658.jpg','/imageSpace/users/2/1383206990658.jpg',0),(107,'1383207179608.jpg','/imageSpace/users/2/1383207179608.jpg',0),(108,'1383207179712.jpg','/imageSpace/users/2/1383207179712.jpg',0),(109,'1383207179793.jpg','/imageSpace/users/2/1383207179793.jpg',0),(110,'1383207179891.jpg','/imageSpace/users/2/1383207179891.jpg',0),(111,'1383207180015.jpg','/imageSpace/users/2/1383207180015.jpg',0),(112,'1383207206528.jpg','/imageSpace/users/2/1383207206528.jpg',0),(113,'1383207207743.jpg','/imageSpace/users/2/1383207207743.jpg',0),(114,'1383207208194.jpg','/imageSpace/users/2/1383207208194.jpg',0),(115,'1383207208492.jpg','/imageSpace/users/2/1383207208492.jpg',0),(116,'1383207208570.jpg','/imageSpace/users/2/1383207208570.jpg',0),(117,'1383208353737.jpg','/imageSpace/users/2/1383208353737.jpg',0),(118,'1383208355105.jpg','/imageSpace/users/2/1383208355105.jpg',0),(119,'1383208355243.jpg','/imageSpace/users/2/1383208355243.jpg',0),(120,'1383208355396.jpg','/imageSpace/users/2/1383208355396.jpg',0),(121,'1383208355510.jpg','/imageSpace/users/2/1383208355510.jpg',0),(122,'1383209017505.jpg','/imageSpace/users/2/1383209017505.jpg',0),(123,'1383209017742.jpg','/imageSpace/users/2/1383209017742.jpg',0),(124,'1383209017849.jpg','/imageSpace/users/2/1383209017849.jpg',0),(125,'1383209018002.jpg','/imageSpace/users/2/1383209018002.jpg',0),(126,'1383209018106.jpg','/imageSpace/users/2/1383209018106.jpg',0),(127,'1383209211369.jpg','/imageSpace/users/2/1383209211369.jpg',0),(128,'1383209211492.jpg','/imageSpace/users/2/1383209211492.jpg',0),(129,'1383209211575.jpg','/imageSpace/users/2/1383209211575.jpg',0),(130,'1383209211707.jpg','/imageSpace/users/2/1383209211707.jpg',0),(131,'1383209211823.jpg','/imageSpace/users/2/1383209211823.jpg',0),(132,'1383209324481.jpg','/imageSpace/users/2/1383209324481.jpg',0),(133,'1383209324643.jpg','/imageSpace/users/2/1383209324643.jpg',0),(134,'1383209324742.jpg','/imageSpace/users/2/1383209324742.jpg',0),(135,'1383209324824.jpg','/imageSpace/users/2/1383209324824.jpg',0),(136,'1383209324892.jpg','/imageSpace/users/2/1383209324892.jpg',0),(137,'1383209560186.jpg','/imageSpace/users/2/1383209560186.jpg',0),(138,'1383209560293.jpg','/imageSpace/users/2/1383209560293.jpg',0),(139,'1383209560440.jpg','/imageSpace/users/2/1383209560440.jpg',0),(140,'1383209560604.jpg','/imageSpace/users/2/1383209560604.jpg',0),(141,'1383209560690.jpg','/imageSpace/users/2/1383209560690.jpg',0),(142,'1383210209851.jpg','/imageSpace/users/2/1383210209851.jpg',0),(143,'1383210209999.jpg','/imageSpace/users/2/1383210209999.jpg',0),(144,'1383210210153.jpg','/imageSpace/users/2/1383210210153.jpg',0),(145,'1383210210271.jpg','/imageSpace/users/2/1383210210271.jpg',0),(146,'1383210210365.jpg','/imageSpace/users/2/1383210210365.jpg',0),(147,'1383210553720.jpg','/imageSpace/users/2/1383210553720.jpg',0),(148,'1383210553868.jpg','/imageSpace/users/2/1383210553868.jpg',0),(149,'1383210553998.jpg','/imageSpace/users/2/1383210553998.jpg',0),(150,'1383210554167.jpg','/imageSpace/users/2/1383210554167.jpg',0),(151,'1383210554287.jpg','/imageSpace/users/2/1383210554287.jpg',0),(152,'1383210554411.jpg','/imageSpace/users/2/1383210554411.jpg',0),(153,'1383210554601.jpg','/imageSpace/users/2/1383210554601.jpg',0),(154,'1383210554848.jpg','/imageSpace/users/2/1383210554848.jpg',0),(155,'1383211074693.jpg','/imageSpace/users/2/1383211074693.jpg',0),(156,'1383211074793.jpg','/imageSpace/users/2/1383211074793.jpg',0),(157,'1383211074948.jpg','/imageSpace/users/2/1383211074948.jpg',0),(158,'1383211075066.jpg','/imageSpace/users/2/1383211075066.jpg',0),(159,'1383211098434.jpg','/imageSpace/users/2/1383211098434.jpg',0),(160,'1383211098541.jpg','/imageSpace/users/2/1383211098541.jpg',0),(161,'1383211098639.jpg','/imageSpace/users/2/1383211098639.jpg',0),(162,'1383211098791.jpg','/imageSpace/users/2/1383211098791.jpg',0),(163,'1383211098890.jpg','/imageSpace/users/2/1383211098890.jpg',0),(164,'1383211265068.jpg','/imageSpace/users/2/1383211265068.jpg',0),(165,'1383211265201.jpg','/imageSpace/users/2/1383211265201.jpg',0),(166,'1383211265291.jpg','/imageSpace/users/2/1383211265291.jpg',0),(167,'1383211265391.jpg','/imageSpace/users/2/1383211265391.jpg',0),(168,'1383211265491.jpg','/imageSpace/users/2/1383211265491.jpg',0),(169,'1383211271338.jpg','/imageSpace/users/2/1383211271338.jpg',0),(170,'1383211271451.jpg','/imageSpace/users/2/1383211271451.jpg',0),(171,'1383211271548.jpg','/imageSpace/users/2/1383211271548.jpg',0),(172,'1383211271657.jpg','/imageSpace/users/2/1383211271657.jpg',0),(173,'1383211271740.jpg','/imageSpace/users/2/1383211271740.jpg',0),(174,'1383211277472.jpg','/imageSpace/users/2/1383211277472.jpg',0),(175,'1383211277566.jpg','/imageSpace/users/2/1383211277566.jpg',0),(176,'1383211277699.jpg','/imageSpace/users/2/1383211277699.jpg',0),(177,'1383211277791.jpg','/imageSpace/users/2/1383211277791.jpg',0),(178,'1383211277890.jpg','/imageSpace/users/2/1383211277890.jpg',0),(179,'1383211509958.jpg','/imageSpace/users/2/1383211509958.jpg',0),(180,'1383211510075.jpg','/imageSpace/users/2/1383211510075.jpg',0),(181,'1383211510141.jpg','/imageSpace/users/2/1383211510141.jpg',0),(182,'1383211510240.jpg','/imageSpace/users/2/1383211510240.jpg',0),(183,'1383211510322.jpg','/imageSpace/users/2/1383211510322.jpg',0),(184,'1383271367919.jpg','/imageSpace/users/2/1383271367919.jpg',0),(185,'1383271369293.jpg','/imageSpace/users/2/1383271369293.jpg',0),(186,'1383271369395.jpg','/imageSpace/users/2/1383271369395.jpg',0),(187,'1383271369541.jpg','/imageSpace/users/2/1383271369541.jpg',0),(188,'1383271369641.jpg','/imageSpace/users/2/1383271369641.jpg',0),(189,'1383289766736.jpg','/imageSpace/users/2/1383289766736.jpg',0),(190,'1383289767640.jpg','/imageSpace/users/2/1383289767640.jpg',0),(191,'1383289767717.jpg','/imageSpace/users/2/1383289767717.jpg',0),(192,'1383289767800.jpg','/imageSpace/users/2/1383289767800.jpg',0),(193,'1383289767891.jpg','/imageSpace/users/2/1383289767891.jpg',0),(194,'1383289787304.jpg','/imageSpace/users/2/1383289787304.jpg',0),(195,'1383289787462.jpg','/imageSpace/users/2/1383289787462.jpg',0),(196,'1383289787624.jpg','/imageSpace/users/2/1383289787624.jpg',0),(197,'1383289787953.jpg','/imageSpace/users/2/1383289787953.jpg',0),(198,'1383289788125.jpg','/imageSpace/users/2/1383289788125.jpg',0),(199,'1383289788258.jpg','/imageSpace/users/2/1383289788258.jpg',0),(200,'1383289788379.jpg','/imageSpace/users/2/1383289788379.jpg',0),(201,'1383289788508.jpg','/imageSpace/users/2/1383289788508.jpg',0),(202,'1383550480736.jpg','/imageSpace/users/2/1383550480736.jpg',0),(203,'1383550482057.jpg','/imageSpace/users/2/1383550482057.jpg',0),(204,'1383550482143.jpg','/imageSpace/users/2/1383550482143.jpg',0),(205,'1383550482282.jpg','/imageSpace/users/2/1383550482282.jpg',0),(206,'1383550482443.jpg','/imageSpace/users/2/1383550482443.jpg',0),(207,'1383712080443.jpg','/imageSpace/users/2/1383712080443.jpg',0),(208,'1383712082218.jpg','/imageSpace/users/2/1383712082218.jpg',0),(209,'1383712082354.jpg','/imageSpace/users/2/1383712082354.jpg',0),(210,'1383712082455.jpg','/imageSpace/users/2/1383712082455.jpg',0),(211,'1383712082551.jpg','/imageSpace/users/2/1383712082551.jpg',0),(212,'1383726135184.jpg','/imageSpace/users/2/1383726135184.jpg',0),(213,'1383726137181.jpg','/imageSpace/users/2/1383726137181.jpg',0),(214,'1383726137327.jpg','/imageSpace/users/2/1383726137327.jpg',0),(215,'1383726137494.jpg','/imageSpace/users/2/1383726137494.jpg',0),(216,'1383726137592.jpg','/imageSpace/users/2/1383726137592.jpg',0),(217,'1383726160490.jpg','/imageSpace/users/2/1383726160490.jpg',0),(218,'1383726160606.jpg','/imageSpace/users/2/1383726160606.jpg',0),(219,'1383726161041.jpg','/imageSpace/users/2/1383726161041.jpg',0),(220,'1383726161141.jpg','/imageSpace/users/2/1383726161141.jpg',0),(221,'1383726161223.jpg','/imageSpace/users/2/1383726161223.jpg',0),(222,'1383728831048.jpg','/imageSpace/users/2/1383728831048.jpg',0),(223,'1383728831120.jpg','/imageSpace/users/2/1383728831120.jpg',0),(224,'1383728831190.jpg','/imageSpace/users/2/1383728831190.jpg',0),(225,'1383728831290.jpg','/imageSpace/users/2/1383728831290.jpg',0),(226,'1383728831369.jpg','/imageSpace/users/2/1383728831369.jpg',0),(227,'1383728872366.jpg','/imageSpace/users/2/1383728872366.jpg',0),(228,'1383728872491.jpg','/imageSpace/users/2/1383728872491.jpg',0),(229,'1383728872652.jpg','/imageSpace/users/2/1383728872652.jpg',0),(230,'1383728872849.jpg','/imageSpace/users/2/1383728872849.jpg',0),(231,'1383728872992.jpg','/imageSpace/users/2/1383728872992.jpg',0),(232,'1383807846597.jpg','/imageSpace/users/2/1383807846597.jpg',0),(233,'1383807848451.jpg','/imageSpace/users/2/1383807848451.jpg',0),(234,'1383807848586.jpg','/imageSpace/users/2/1383807848586.jpg',0),(235,'1383807848702.jpg','/imageSpace/users/2/1383807848702.jpg',0),(236,'1383807848792.jpg','/imageSpace/users/2/1383807848792.jpg',0);

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
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8;

/*Data for the table `order_form` */

insert  into `order_form`(`id`,`order_Number`,`user_Id`,`product_Id`,`create_Time`,`payment_Time`,`order_Type`,`product_Number`,`amount_Payable`,`express_Message`) values (11,'30E4E813-9EC6-43B3-9BB1-075AF4A730B7',1,2,'2013-09-18 13:59:18',NULL,'NON_PAYMENT',3,30,NULL),(16,'03478ECC-D7A9-4DFA-B7F4-A5B72AAAE42F',2,1,'2013-10-25 17:28:33',NULL,'NON_PAYMENT',3,30,NULL),(17,'B56A6F5A-FE33-4D10-97B2-679FAC2956BD',2,2,'2013-10-29 15:31:51',NULL,'SHOPPING_CART',7,70,NULL),(18,'A1B4D9EF-4E87-4C0B-80DD-1B4BCCD71A43',2,7,'2013-11-07 15:10:37',NULL,'SHOPPING_CART',1,10,NULL);

/*Table structure for table `page_message` */

DROP TABLE IF EXISTS `page_message`;

CREATE TABLE `page_message` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `page_Num` int(11) DEFAULT NULL,
  `page_Type` enum('RIGHT','LEFT') DEFAULT NULL,
  `template_Id` int(11) DEFAULT NULL,
  `work_Id` int(11) DEFAULT NULL,
  `page-desc` varchar(500) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `page_message` */

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

insert  into `product`(`product_Id`,`index_Show_Type_Id`,`name`,`sell_Price`,`market_Price`,`pages`,`freight`,`product_Standard`,`product_Material`,`product_Process`,`production_Cycle`,`content1`,`content2`,`content3`,`content4`,`image_Id`,`index_Show_Image_Type`,`view_Count`,`saled_Count`) values (1,1,'简简单单',10,19.9,16,10,'58x85mm','哑粉纸','Indigo印刷','3—5个工作日（不包含配送时间）','﻿LOMO卡它就像一款小巧的精致品，虽然个头不大，但却别具特色。',NULL,NULL,NULL,1,'LENGTHWAYS',48,0),(2,1,'炫彩',10,19.9,16,10,'58x85mm','哑粉纸','Indigo印刷','3—5个工作日（不包含配送时间）','﻿LOMO卡它就像一款小巧的精致品，虽然个头不大，但却别具特色。',NULL,NULL,NULL,2,'LENGTHWAYS',128,0),(3,1,'炫彩',10,19.9,16,10,'58x85mm','哑粉纸','Indigo印刷','3—5个工作日（不包含配送时间）','﻿LOMO卡它就像一款小巧的精致品，虽然个头不大，但却别具特色。',NULL,NULL,NULL,3,'LENGTHWAYS',23,0),(4,1,'炫彩',10,19.9,16,10,'58x85mm','哑粉纸','Indigo印刷','3—5个工作日（不包含配送时间）','﻿LOMO卡它就像一款小巧的精致品，虽然个头不大，但却别具特色。',NULL,NULL,NULL,4,'LENGTHWAYS',6,0),(5,2,'炫彩',10,19.9,16,10,'58x85mm','哑粉纸','Indigo印刷','3—5个工作日（不包含配送时间）','﻿LOMO卡它就像一款小巧的精致品，虽然个头不大，但却别具特色。',NULL,NULL,NULL,1,'LENGTHWAYS',0,0),(6,2,'炫彩',10,19.9,16,10,'58x85mm','哑粉纸','Indigo印刷','3—5个工作日（不包含配送时间）','﻿LOMO卡它就像一款小巧的精致品，虽然个头不大，但却别具特色。',NULL,NULL,NULL,2,'LENGTHWAYS',10,0),(7,2,'炫彩',10,19.9,16,10,'58x85mm','哑粉纸','Indigo印刷','3—5个工作日（不包含配送时间）','﻿LOMO卡它就像一款小巧的精致品，虽然个头不大，但却别具特色。',NULL,NULL,NULL,3,'LENGTHWAYS',4,0),(8,2,'炫彩',10,19.9,16,10,'58x85mm','哑粉纸','Indigo印刷','3—5个工作日（不包含配送时间）','﻿LOMO卡它就像一款小巧的精致品，虽然个头不大，但却别具特色。',NULL,NULL,NULL,4,'LENGTHWAYS',2,0),(10,3,'炫彩',10,19.9,16,10,'58x85mm','哑粉纸','Indigo印刷','3—5个工作日（不包含配送时间）','﻿LOMO卡它就像一款小巧的精致品，虽然个头不大，但却别具特色。',NULL,NULL,NULL,1,'LENGTHWAYS',0,0),(11,3,'炫彩',10,19.9,16,10,'58x85mm','哑粉纸','Indigo印刷','3—5个工作日（不包含配送时间）','﻿LOMO卡它就像一款小巧的精致品，虽然个头不大，但却别具特色。',NULL,NULL,NULL,2,'LENGTHWAYS',1,0),(12,3,'炫彩',10,19.9,16,10,'58x85mm','哑粉纸','Indigo印刷','3—5个工作日（不包含配送时间）','﻿LOMO卡它就像一款小巧的精致品，虽然个头不大，但却别具特色。',NULL,NULL,NULL,3,'LENGTHWAYS',1,0),(13,3,'炫彩',10,19.9,16,10,'58x85mm','哑粉纸','Indigo印刷','3—5个工作日（不包含配送时间）','﻿LOMO卡它就像一款小巧的精致品，虽然个头不大，但却别具特色。',NULL,NULL,NULL,4,'LENGTHWAYS',1,0),(16,4,'炫彩',10,19.9,16,10,'58x85mm','哑粉纸','Indigo印刷','3—5个工作日（不包含配送时间）','﻿LOMO卡它就像一款小巧的精致品，虽然个头不大，但却别具特色。',NULL,NULL,NULL,1,'LENGTHWAYS',0,0),(17,4,'炫彩',10,19.9,16,10,'58x85mm','哑粉纸','Indigo印刷','3—5个工作日（不包含配送时间）','﻿LOMO卡它就像一款小巧的精致品，虽然个头不大，但却别具特色。',NULL,NULL,NULL,2,'LENGTHWAYS',0,0),(19,4,'炫彩',10,19.9,16,10,'58x85mm','哑粉纸','Indigo印刷','3—5个工作日（不包含配送时间）','﻿LOMO卡它就像一款小巧的精致品，虽然个头不大，但却别具特色。',NULL,NULL,NULL,3,'LENGTHWAYS',0,0),(20,4,'炫彩',10,19.9,16,10,'58x85mm','哑粉纸','Indigo印刷','3—5个工作日（不包含配送时间）','﻿LOMO卡它就像一款小巧的精致品，虽然个头不大，但却别具特色。',NULL,NULL,NULL,4,'LENGTHWAYS',0,0),(21,5,'炫彩',10,19.9,16,10,'58x85mm','哑粉纸','Indigo印刷','3—5个工作日（不包含配送时间）','﻿LOMO卡它就像一款小巧的精致品，虽然个头不大，但却别具特色。',NULL,NULL,NULL,1,'LENGTHWAYS',0,0),(22,5,'炫彩',10,19.9,16,10,'58x85mm','哑粉纸','Indigo印刷','3—5个工作日（不包含配送时间）','﻿LOMO卡它就像一款小巧的精致品，虽然个头不大，但却别具特色。',NULL,NULL,NULL,2,'LENGTHWAYS',3,0),(24,5,'炫彩',10,19.9,16,10,'58x85mm','哑粉纸','Indigo印刷','3—5个工作日（不包含配送时间）','﻿LOMO卡它就像一款小巧的精致品，虽然个头不大，但却别具特色。',NULL,NULL,NULL,3,'LENGTHWAYS',0,0),(25,5,'炫彩',10,19.9,16,10,'58x85mm','哑粉纸','Indigo印刷','3—5个工作日（不包含配送时间）','﻿LOMO卡它就像一款小巧的精致品，虽然个头不大，但却别具特色。',NULL,NULL,NULL,4,'LENGTHWAYS',0,0);

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

/*Table structure for table `template` */

DROP TABLE IF EXISTS `template`;

CREATE TABLE `template` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(32) DEFAULT NULL,
  `li_Class` varchar(64) DEFAULT NULL,
  `a_Class` varchar(64) DEFAULT NULL,
  `t_type` varchar(12) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=42 DEFAULT CHARSET=utf8;

/*Data for the table `template` */

insert  into `template`(`id`,`name`,`li_Class`,`a_Class`,`t_type`) values (1,'T1','pagelayout_P T1','pagelayout_bg t1_r','NARROW'),(2,'T2','pagelayout_P T1','pagelayout_bg t2_r','NARROW'),(3,'T3','pagelayout_P T1','pagelayout_bg t3_r','NARROW'),(4,'T4','pagelayout_P T4','pagelayout_bg t4_r','NARROW'),(5,'T5','pagelayout_P T5','pagelayout_bg t5_r','NARROW'),(6,'T6','pagelayout_P T6','pagelayout_bg t6_r','NARROW'),(7,'T7','pagelayout_P T7','pagelayout_bg t7_r','NARROW'),(8,'T8','pagelayout_P T8','pagelayout_bg t8_r','NARROW'),(9,'T9','pagelayout_P T9','pagelayout_bg t9_r','NARROW'),(10,'T10','pagelayout_P T10','pagelayout_bg t10_r','NARROW'),(11,'T11','pagelayout_P T11','pagelayout_bg t11_r','NARROW'),(12,'T12','pagelayout_P T12','pagelayout_bg t12_r','NARROW'),(13,'T13','pagelayout_P T13','pagelayout_bg t13_r','NARROW'),(14,'T14','pagelayout_P T14','pagelayout_bg t14_r','NARROW'),(15,'T15','pagelayout_P T15','pagelayout_bg t15_r','NARROW'),(16,'T16','pagelayout_P T16','pagelayout_bg t16_r','NARROW'),(17,'T17','pagelayout_P T17','pagelayout_bg t17_r','NARROW'),(18,'T18','pagelayout_P T18','pagelayout_bg t18_r','NARROW'),(19,'T19','pagelayout_P T19','pagelayout_bg t19_r','NARROW'),(20,'T20','pagelayout_P T20','pagelayout_bg t20_r','NARROW'),(21,'T21','pagelayout_P T21','pagelayout_bg t21_r','NARROW'),(22,'T200','pagelayout_P T200','pagelayout_bg t200_r cross_layout','WIDE'),(23,'T201','pagelayout_P T201','pagelayout_bg t201_r cross_layout','WIDE'),(24,'T202','pagelayout_P T202','pagelayout_bg t202_r cross_layout','WIDE'),(25,'T203','pagelayout_P T203','pagelayout_bg t203_r cross_layout','WIDE'),(26,'T204','pagelayout_P T204','pagelayout_bg t204_r cross_layout','WIDE'),(27,'T205','pagelayout_P T205','pagelayout_bg t205_r cross_layout','WIDE'),(28,'T206','pagelayout_P T206','pagelayout_bg t206_r cross_layout','WIDE'),(29,'T207','pagelayout_P T207','pagelayout_bg t207_r cross_layout','WIDE'),(30,'T208','pagelayout_P T208','pagelayout_bg t208_r cross_layout','WIDE'),(31,'T209','pagelayout_P T209','pagelayout_bg t209_r cross_layout','WIDE'),(32,'T210','pagelayout_P T210','pagelayout_bg t210_r cross_layout','WIDE'),(33,'T211','pagelayout_P T211','pagelayout_bg t211_r cross_layout','WIDE'),(34,'T212','pagelayout_P T212','pagelayout_bg t212_r cross_layout','WIDE'),(35,'T213','pagelayout_P T213','pagelayout_bg t213_r cross_layout','WIDE'),(36,'T214','pagelayout_P T214','pagelayout_bg t214_r cross_layout','WIDE'),(37,'T215','pagelayout_P T215','pagelayout_bg t215_r cross_layout','WIDE'),(38,'T216','pagelayout_P T216','pagelayout_bg t216_r cross_layout','WIDE'),(39,'T217','pagelayout_P T217','pagelayout_bg t217_r cross_layout','WIDE'),(40,'T218','pagelayout_P T218','pagelayout_bg t218_r cross_layout','WIDE'),(41,'T219','pagelayout_P T219','pagelayout_bg t219_r cross_layout','WIDE');

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
