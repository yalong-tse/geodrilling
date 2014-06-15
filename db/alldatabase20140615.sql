/*
SQLyog Trial v11.5 (32 bit)
MySQL - 5.6.10 : Database - geodrilling_development
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`geodrilling_development` /*!40100 DEFAULT CHARACTER SET utf8 */;

USE `geodrilling_development`;

/*Table structure for table `appsettings` */

DROP TABLE IF EXISTS `appsettings`;

CREATE TABLE `appsettings` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `settingtype` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `value` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

/*Data for the table `appsettings` */

insert  into `appsettings`(`id`,`name`,`settingtype`,`value`,`created_at`,`updated_at`) values (1,'attachment_savepath','attachment','d:/upload','2013-07-25 00:00:00','2013-07-25 00:00:00');

/*Table structure for table `assignments` */

DROP TABLE IF EXISTS `assignments`;

CREATE TABLE `assignments` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) DEFAULT NULL,
  `role_id` int(11) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `index_assignments_on_role_id` (`role_id`),
  KEY `index_assignments_on_user_id` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=46 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

/*Data for the table `assignments` */

insert  into `assignments`(`id`,`user_id`,`role_id`,`created_at`,`updated_at`) values (2,22,7,'2014-03-16 14:06:25','2014-03-16 14:06:25'),(5,23,7,'2014-03-16 14:11:00','2014-03-16 14:11:00'),(8,44,4,'2014-03-16 14:13:35','2014-03-16 14:13:35'),(9,45,4,'2014-03-16 14:14:23','2014-03-16 14:14:23'),(12,46,2,'2014-03-16 14:17:46','2014-03-16 14:17:46'),(13,47,2,'2014-03-16 14:18:31','2014-03-16 14:18:31'),(14,48,2,'2014-03-16 14:19:13','2014-03-16 14:19:13'),(15,49,2,'2014-03-16 14:20:19','2014-03-16 14:20:19'),(16,43,2,'2014-03-16 14:20:34','2014-03-16 14:20:34'),(17,50,9,'2014-03-16 14:26:46','2014-03-16 14:26:46'),(18,51,9,'2014-03-16 14:27:46','2014-03-16 14:27:46'),(19,52,10,'2014-03-16 14:30:31','2014-03-16 14:30:31'),(20,53,10,'2014-03-16 14:31:15','2014-03-16 14:31:15'),(21,54,7,'2014-03-16 14:32:53','2014-03-16 14:32:53'),(25,58,11,'2014-03-16 14:41:02','2014-03-16 14:41:02'),(26,57,11,'2014-03-16 14:41:15','2014-03-16 14:41:15'),(27,59,11,'2014-03-16 14:42:13','2014-03-16 14:42:13'),(28,60,11,'2014-03-16 14:42:59','2014-03-16 14:42:59'),(29,61,11,'2014-03-16 14:44:05','2014-03-16 14:44:05'),(30,62,11,'2014-03-16 14:44:43','2014-03-16 14:44:43'),(31,16,8,'2014-04-23 10:18:02','2014-04-23 10:18:02'),(32,17,8,'2014-04-23 10:18:10','2014-04-23 10:18:10'),(33,24,8,'2014-04-23 10:22:40','2014-04-23 10:22:40'),(35,25,8,'2014-04-23 10:22:55','2014-04-23 10:22:55'),(36,55,8,'2014-04-23 10:23:09','2014-04-23 10:23:09'),(37,56,8,'2014-04-23 10:23:21','2014-04-23 10:23:21'),(40,20,11,'2014-04-24 13:11:32','2014-04-24 13:11:32'),(41,18,11,'2014-04-24 13:11:42','2014-04-24 13:11:42'),(42,27,11,'2014-04-24 13:11:52','2014-04-24 13:11:52'),(43,28,11,'2014-04-24 13:11:59','2014-04-24 13:11:59'),(45,19,11,'2014-06-15 00:27:35','2014-06-15 00:27:35');

/*Table structure for table `attachments` */

DROP TABLE IF EXISTS `attachments`;

CREATE TABLE `attachments` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `filename` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `filetype` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `savefilename` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `savepath` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

/*Data for the table `attachments` */

insert  into `attachments`(`id`,`filename`,`filetype`,`savefilename`,`savepath`,`created_at`,`updated_at`) values (1,'发票2.doc','doc','fbb830880f274ef6a54ab2f4aca63bce.doc','d:/upload','2013-09-12 11:11:17','2013-09-12 11:11:17'),(2,'北京局调度所应急平台调研问题列表.doc','doc','a5bd8c3ea7aa47b58994f240c7847c28.doc','d:/upload','2013-09-12 11:39:18','2013-09-12 11:39:18'),(3,'北京局调度所应急平台调研问题列表.doc','doc','dfb7ceab0a7c443990e74c12ce056d50.doc','d:/upload','2013-09-12 11:56:14','2013-09-12 11:56:14'),(4,'北京局调度所应急平台调研问题列表.doc','doc','aeb10d37a5d84860b1e216e982ea708f.doc','d:/upload','2013-09-12 12:15:28','2013-09-12 12:15:28'),(5,'883662d0f703918ff8a6e45d513d269758eec4c0.jpg','jpg','e8359ef9aaa140ed80254af2f5187bff.jpg','d:/upload','2013-09-13 13:23:39','2013-09-13 13:23:39'),(6,'综合管理界面5.PNG','PNG','7ffb57b610f94491a9ac75bd4d5a0aa6.PNG','d:/upload','2013-09-13 13:39:52','2013-09-13 13:39:52'),(7,'20121218_add92c28b2c3f6aceee84ejq7Bm64KE8.jpg','jpg','7fa40b2e8cc74c498bd62284c154bee4.jpg','d:/upload','2013-09-20 03:36:16','2013-09-20 03:36:16'),(8,'20121218_add92c28b2c3f6aceee84ejq7Bm64KE8.jpg','jpg','2a397623c1bb47f48abe625aade3a430.jpg','d:/upload','2013-09-20 03:52:35','2013-09-20 03:52:35'),(9,'20121218_add92c28b2c3f6aceee84ejq7Bm64KE8.jpg','jpg','346c51f6d57d486f85baf2590cadf951.jpg','d:/upload','2013-09-20 03:55:05','2013-09-20 03:55:05'),(10,'107949931_646288256_w1280p.jpeg','jpeg','404dddfc0645463abc500239835bca10.jpeg','d:/upload','2013-09-20 03:55:34','2013-09-20 03:55:34'),(11,'70414fc2d5628535575f0cb690ef76c6a6ef63f8.jpg','jpg','594177d72afe406b92bd7ae1d4741183.jpg','d:/upload','2013-09-20 04:23:56','2013-09-20 04:23:56'),(12,'程序更新.PNG','PNG','e6f554f34e9148158b17c36a6e5758d2.PNG','d:/upload','2013-09-20 04:26:26','2013-09-20 04:26:26'),(13,'20121218_add92c28b2c3f6aceee84ejq7Bm64KE8.jpg','jpg','5b6e4efd08584026896c1fb8a4d66bc9.jpg','d:/upload','2013-09-20 04:45:56','2013-09-20 04:45:56'),(14,'20121218_add92c28b2c3f6aceee84ejq7Bm64KE8.jpg','jpg','360ffa557e2d4abcac992b848563a14a.jpg','d:/upload','2013-09-20 08:24:34','2013-09-20 08:24:34'),(15,'883662d0f703918ff8a6e45d513d269758eec4c0.jpg','jpg','387dbd0f78b948aea0cf3f4cfdfd2e6f.jpg','d:/upload','2013-09-20 09:53:39','2013-09-20 09:53:39');

/*Table structure for table `contractassets` */

DROP TABLE IF EXISTS `contractassets`;

CREATE TABLE `contractassets` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `data_file_name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `data_content_type` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `data_file_size` decimal(10,0) DEFAULT NULL,
  `data_updated_at` datetime DEFAULT NULL,
  `contract_id` decimal(10,0) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `data_origin_file_name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

/*Data for the table `contractassets` */

insert  into `contractassets`(`id`,`data_file_name`,`data_content_type`,`data_file_size`,`data_updated_at`,`contract_id`,`created_at`,`updated_at`,`data_origin_file_name`) values (1,'20140316233050556.docx','application/vnd.openxmlformats-officedocument.wordprocessingml.document','34028','2014-03-16 15:30:50','4','2014-03-16 15:30:50','2014-03-16 15:30:50','协议文件.docx'),(2,'20140608095326738.doc','application/msword','24064','2014-06-08 01:53:26','1','2014-06-08 01:53:26','2014-06-08 01:53:26','ceshiwenjian.doc'),(3,'2014061016144756.doc','application/octet-stream','43008','2014-06-10 08:14:47','5','2014-06-10 08:14:47','2014-06-10 08:14:47','云南丽江钻探总包合同2014.3.doc'),(4,'20140615112027906.doc','application/msword','56320','2014-06-15 03:20:27','7','2014-06-15 03:20:27','2014-06-15 03:20:27','礼庄寨铝土矿普查钻探施工合同.doc'),(6,'2014061511320163.doc','application/msword','45568','2014-06-15 03:32:01','9','2014-06-15 03:32:01','2014-06-15 03:32:01','金源公司鼎立分公司ZK1512钻孔工合同.doc');

/*Table structure for table `contracts` */

DROP TABLE IF EXISTS `contracts`;

CREATE TABLE `contracts` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `contractamount` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `content` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `signdate` date DEFAULT NULL,
  `startdate` date DEFAULT NULL,
  `finishdate` date DEFAULT NULL,
  `status` int(11) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `projectname` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `buyerparty` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `projectaddr` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `remark` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `contractno` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `owner` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `deadlinedate` date DEFAULT NULL,
  `fundsource` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `attachment_id` int(11) DEFAULT NULL,
  `workshift` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `department_id` decimal(10,0) DEFAULT NULL,
  `administrator_id` decimal(10,0) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

/*Data for the table `contracts` */

insert  into `contracts`(`id`,`contractamount`,`name`,`content`,`signdate`,`startdate`,`finishdate`,`status`,`created_at`,`updated_at`,`projectname`,`buyerparty`,`projectaddr`,`remark`,`contractno`,`owner`,`deadlinedate`,`fundsource`,`attachment_id`,`workshift`,`department_id`,`administrator_id`) values (1,'5450000','金源鑫灵钻孔工程施工合同',NULL,'2013-10-05','2013-11-01','2015-06-13',1,'2013-09-12 11:11:17','2014-06-13 06:53:01','桐沟矿区深部探矿','河南省矿源地质有限公司','河南三门峡灵宝','','201322','灵宝金源矿业股份有限公司',NULL,'8',1,'5000.00','6','16'),(5,'1200000','钻探工程施工合同书',NULL,'2014-03-28','2014-04-01','2015-06-30',0,'2014-06-10 08:14:47','2014-06-10 08:14:47','云南省宁蒗县金都铜矿详查区钻探工程','丽江土金矿业开发有限公司','云南省宁蒗县','项目负责为孔存银','201401','丽江土金矿业开发有限公司',NULL,'8',NULL,'1500.00','8',NULL),(6,'10000000','河南省灵宝市小秦岭金矿田北中矿带深部金矿预查',NULL,'2013-02-15','2013-03-15','2015-06-15',1,'2014-06-15 02:13:18','2014-06-15 04:06:47','河南省灵宝市小秦岭金矿田北中矿带深部金矿预查钻探合同','地勘四院','灵宝阳平-故县','','201321','河南省国土厅',NULL,'3',NULL,'11000.00','1','16'),(7,'1510000','河南省渑池县礼庄寨地区铝土矿普查2013年度续作钻探施工合同',NULL,'2014-06-01','2014-06-01','2014-10-31',0,'2014-06-15 03:20:27','2014-06-15 03:28:08','河南省渑池县礼庄寨地区铝土矿普查2013年度续作钻探工程','河南省矿源地质有限公司','河南省渑池县仁村——洪阳','','201403','河南省地质调查院',NULL,'8',NULL,'3230','7','25'),(8,'2000000','河南省灵宝金渠金矿坑内钻探工程施工合同',NULL,'2014-03-01','2014-03-02','2014-12-31',1,'2014-06-15 03:21:31','2014-06-15 03:22:30','河南省灵宝金渠金矿坑内钻探工程','河南省矿源地质有限公司','灵宝金渠坑道内','','201402','河南金渠黄金股份有限公司',NULL,'8',NULL,'3000.00','6','16'),(9,'446400','金源公司鼎立分公司接替资源勘查钻探施工合同',NULL,'2014-04-10','2014-04-15','2015-08-15',1,'2014-06-15 03:32:01','2014-06-15 03:34:21','金源公司鼎立分公司接替资源勘查钻探施工','河南省矿源地质有限公司','灵宝阳平','该项目钻孔实际施工孔号变更为zk15003','201403','灵宝金源矿业股份有限公司-鼎立分公司',NULL,'8',NULL,'720.00','6','16'),(10,'5500000','河南省小秦岭金矿田南中矿带金矿普查（2011年度续作）机械岩心钻探施工  ',NULL,'2013-04-15','2013-05-15','2013-08-15',1,'2014-06-15 03:38:29','2014-06-15 03:41:05','河南省小秦岭金矿田南中矿带金矿普查（2011年度续作）机械岩心钻探施工  ','河南省矿源地质有限公司','灵宝朱阳','','201321','河南中矿能源有限公司',NULL,'8',NULL,'6440.00','6','17'),(11,'3500000','金源公司鑫宝分公司朱阳樊岔矿区钻探工程施工合同',NULL,'2013-03-15','2013-03-20','2013-12-30',1,'2014-06-15 03:45:29','2014-06-15 03:48:08','金源公司鑫宝分公司朱阳樊岔矿区钻探工程','河南省矿源地质有限公司','朱阳樊岔','','201324','灵宝金源矿业股份有限公司公司',NULL,'8',NULL,'5220.00','6','17'),(12,'2400000','河南省小秦岭金矿田北矿带深部金矿普查2013年度续作项目机械岩心钻探工程合同',NULL,'2014-05-25','2014-06-13','2014-10-25',1,'2014-06-15 04:16:33','2014-06-15 04:20:19','河南省小秦岭金矿田北矿带深部金矿普查2013年度续作项目机械岩心钻探工程','河南省矿源地质有限公司','灵宝阳平','','201404','河南中矿能源有限公司',NULL,'3',NULL,'4000.00','6','16');

/*Table structure for table `departments` */

DROP TABLE IF EXISTS `departments`;

CREATE TABLE `departments` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `depcode` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `head` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `phone` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `address` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `remark` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `ancestry` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

/*Data for the table `departments` */

insert  into `departments`(`id`,`name`,`depcode`,`head`,`phone`,`address`,`remark`,`ancestry`,`created_at`,`updated_at`) values (1,'地勘四院','001',NULL,NULL,NULL,NULL,NULL,'2013-06-16 02:48:33','2013-06-16 02:48:33'),(2,'综合部门','001001',NULL,NULL,NULL,NULL,'1','2013-06-16 02:48:33','2013-06-16 02:48:33'),(3,'地勘四院仓库','001001001',NULL,NULL,NULL,NULL,'1/2','2013-06-16 02:48:33','2013-06-16 02:48:33'),(4,'钻探公司','002','谷天本','','','',NULL,'2013-06-16 02:48:33','2014-03-16 11:36:42'),(6,'钻探一分公司','zt001','杨宽才','','','','4','2014-03-16 11:37:23','2014-03-16 11:37:23'),(7,'钻探二公司','zt002','宁赞格','','','','4','2014-03-16 11:38:11','2014-03-16 11:38:11'),(8,'省外分公司','zt003','梁丽','','','','4','2014-03-16 11:38:40','2014-03-16 11:38:40'),(9,'国外分公司','zt004','杨宽才','','','','4','2014-03-16 11:38:59','2014-03-16 11:38:59'),(10,'领导层','zt000','','','','','4','2014-03-16 11:39:57','2014-03-16 11:39:57'),(11,'设备管理部','zt006','王卢伟','','','','4','2014-03-16 11:40:40','2014-03-16 11:40:40'),(12,'人力资源部','zt007','','','','','4','2014-03-16 11:41:20','2014-03-16 11:41:20'),(13,'生产技术部','ZT007','田敏','','','','4','2014-03-16 11:41:50','2014-03-16 11:41:50');

/*Table structure for table `deployments` */

DROP TABLE IF EXISTS `deployments`;

CREATE TABLE `deployments` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `hole_id` int(11) DEFAULT NULL,
  `pump_id` int(11) DEFAULT NULL,
  `rigmachine_id` int(11) DEFAULT NULL,
  `drilltower_id` int(11) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `index_deployments_on_drilltower_id` (`drilltower_id`),
  KEY `index_deployments_on_hole_id` (`hole_id`),
  KEY `index_deployments_on_pump_id` (`pump_id`),
  KEY `index_deployments_on_rigmachine_id` (`rigmachine_id`),
  KEY `index_deployments_on_user_id` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=24 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

/*Data for the table `deployments` */

insert  into `deployments`(`id`,`hole_id`,`pump_id`,`rigmachine_id`,`drilltower_id`,`user_id`,`created_at`,`updated_at`) values (12,8,5,8,6,18,'2014-05-04 15:13:37','2014-05-04 15:13:37'),(13,9,6,10,7,19,'2014-06-13 07:03:17','2014-06-15 00:32:54'),(14,11,7,11,8,20,'2014-06-15 02:34:11','2014-06-15 02:56:26'),(15,13,NULL,NULL,NULL,16,'2014-06-15 02:34:44','2014-06-15 02:34:44'),(16,12,NULL,NULL,NULL,16,'2014-06-15 02:34:55','2014-06-15 02:34:55'),(17,10,NULL,NULL,NULL,16,'2014-06-15 02:35:07','2014-06-15 02:35:07'),(18,16,NULL,NULL,NULL,17,'2014-06-15 03:43:03','2014-06-15 03:43:03'),(19,14,NULL,NULL,NULL,16,'2014-06-15 03:48:34','2014-06-15 03:48:34'),(20,15,NULL,NULL,NULL,16,'2014-06-15 03:48:44','2014-06-15 03:48:44'),(21,17,NULL,NULL,NULL,17,'2014-06-15 03:48:54','2014-06-15 03:48:54'),(22,18,NULL,NULL,NULL,17,'2014-06-15 03:49:30','2014-06-15 03:49:30'),(23,19,NULL,NULL,NULL,16,'2014-06-15 04:21:06','2014-06-15 04:21:06');

/*Table structure for table `devicephotos` */

DROP TABLE IF EXISTS `devicephotos`;

CREATE TABLE `devicephotos` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `data_content_type` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `data_file_name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `data_update_at` datetime DEFAULT NULL,
  `data_origin_file_name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `data_file_size` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

/*Data for the table `devicephotos` */

/*Table structure for table `deviceresumes` */

DROP TABLE IF EXISTS `deviceresumes`;

CREATE TABLE `deviceresumes` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `devicenumber` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `devicetype` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `operatedate` date DEFAULT NULL,
  `operatetype` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `operator` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `holenumber` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `remark` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

/*Data for the table `deviceresumes` */

/*Table structure for table `dictionaries` */

DROP TABLE IF EXISTS `dictionaries`;

CREATE TABLE `dictionaries` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `item` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `delflag` tinyint(1) DEFAULT NULL,
  `priority` decimal(10,0) DEFAULT NULL,
  `remark` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `dictype` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=26 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

/*Data for the table `dictionaries` */

insert  into `dictionaries`(`id`,`item`,`delflag`,`priority`,`remark`,`created_at`,`updated_at`,`dictype`) values (2,'普通钻杆',0,'11','普通钻杆','2013-06-04 13:00:00','2013-06-04 13:00:00','材料名称'),(3,'中央财政',0,'10','中央财政','2013-07-02 15:02:04','2013-07-02 15:02:04','资金来源'),(4,'省财政',0,'20','省财政','2013-07-02 15:02:25','2013-07-02 15:02:25','资金来源'),(5,'局财政',0,'30','局财政','2013-07-02 15:05:49','2013-07-02 15:05:49','资金来源'),(6,'市财政',0,'40','市财政','2013-07-02 15:07:10','2013-07-02 15:07:10','资金来源'),(7,'地方财政',0,'50','地方财政','2013-07-02 15:07:49','2013-07-02 15:07:49','资金来源'),(8,'市场项目',0,'60','市场项目','2013-07-02 15:08:10','2013-07-02 15:08:10','资金来源'),(9,'粘土',0,'11','','2013-09-21 15:05:13','2013-09-21 15:05:13','材料名称'),(10,'处理剂',0,'20','','2013-09-21 15:12:53','2013-09-21 15:12:53','材料名称'),(11,'绳索取心钻杆',0,'30','','2013-09-21 15:27:01','2013-09-21 15:27:01','材料名称'),(12,'精钢石钻头',0,'40','','2013-09-21 15:27:19','2013-09-21 15:27:19','材料名称'),(13,'PDC钻头',0,'50','','2013-09-21 15:28:50','2013-09-21 15:28:50','材料名称'),(14,'牙轮钻头',0,'60','','2013-09-21 15:29:09','2013-09-21 15:29:09','材料名称'),(15,'柴油',0,'70','','2013-09-21 15:29:53','2013-09-21 15:29:53','材料名称'),(16,'钢丝绳',0,'80','','2013-09-21 15:30:13','2013-09-21 15:30:13','材料名称'),(17,'56',NULL,'100','','2014-03-16 08:44:39','2014-03-16 08:44:39','钻孔直径'),(18,'59',NULL,'110','','2014-03-16 08:44:57','2014-03-16 08:44:57','钻孔直径'),(19,'77',NULL,'120','','2014-03-16 08:45:14','2014-03-16 08:45:14','钻孔直径'),(20,'89',NULL,'140','','2014-03-16 08:45:28','2014-03-16 08:45:28','钻孔直径'),(21,'122',NULL,'150','','2014-03-16 08:46:01','2014-03-16 08:46:01','钻孔直径'),(22,'110',NULL,'145','','2014-03-16 08:46:44','2014-03-16 08:46:44','钻孔直径'),(23,'130',NULL,'151','','2014-03-16 08:47:57','2014-03-16 08:47:57','钻孔直径'),(24,'170',NULL,'160','','2014-03-16 08:48:26','2014-03-16 08:48:26','钻孔直径'),(25,'金属矿',NULL,'10','','2014-03-16 08:50:02','2014-03-16 08:50:02','钻探目的');

/*Table structure for table `drilltowers` */

DROP TABLE IF EXISTS `drilltowers`;

CREATE TABLE `drilltowers` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `model` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `height` decimal(10,0) DEFAULT NULL,
  `deep` decimal(10,0) DEFAULT NULL,
  `effectiveload` decimal(10,0) DEFAULT NULL,
  `topsize` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `pipequantityAndLenght` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `sheaveQuantity` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `weight` decimal(10,0) DEFAULT NULL,
  `workbenchHeight` decimal(10,0) DEFAULT NULL,
  `basePlatformsize` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `manufacture` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `manufactureContact` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `picture` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `remark` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `devicenumber` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `status` tinyint(1) DEFAULT NULL,
  `groupstatus` tinyint(1) DEFAULT NULL,
  `rigmachineid` decimal(10,0) DEFAULT NULL,
  `attachment_id` int(11) DEFAULT NULL,
  `discarddate` date DEFAULT NULL,
  `discardtype` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `discardreason` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `officialcode` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

/*Data for the table `drilltowers` */

insert  into `drilltowers`(`id`,`model`,`height`,`deep`,`effectiveload`,`topsize`,`pipequantityAndLenght`,`sheaveQuantity`,`weight`,`workbenchHeight`,`basePlatformsize`,`manufacture`,`manufactureContact`,`picture`,`remark`,`created_at`,`updated_at`,`name`,`devicenumber`,`status`,`groupstatus`,`rigmachineid`,`attachment_id`,`discarddate`,`discardtype`,`discardreason`,`officialcode`) values (6,'SG-24','24',NULL,'68','1.4×1.4','18',NULL,'10000',NULL,'7.5×7.5','张家口探矿厂','12345678',NULL,'','2014-03-16 12:01:00','2014-03-16 12:01:00',NULL,'ZT003',NULL,NULL,NULL,NULL,NULL,NULL,NULL,''),(7,'SG-18','18',NULL,'30','1.2*1.2','15',NULL,'8',NULL,'4.5*4.5','张家口探矿厂','0313-4080349',NULL,'','2014-06-13 07:00:11','2014-06-13 07:00:11',NULL,'0',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'01-111'),(8,'SG-23','23',NULL,'30','1.4*1.4','15',NULL,'8',NULL,'6.5*6.5','张家口探矿厂','0313-4080424',NULL,'','2014-06-15 02:29:09','2014-06-15 02:29:09',NULL,'0',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'01-140');

/*Table structure for table `equipment` */

DROP TABLE IF EXISTS `equipment`;

CREATE TABLE `equipment` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `category` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `quantity` int(11) DEFAULT NULL,
  `keeper` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `borrower` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `usage` int(11) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

/*Data for the table `equipment` */

insert  into `equipment`(`id`,`name`,`category`,`quantity`,`keeper`,`borrower`,`usage`,`created_at`,`updated_at`) values (1,'起重机','起重器',1,'牛宏睿','解亚龙',1,'2013-03-18 05:31:32','2013-03-18 05:31:32');

/*Table structure for table `groups` */

DROP TABLE IF EXISTS `groups`;

CREATE TABLE `groups` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `groupflag` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

/*Data for the table `groups` */

insert  into `groups`(`id`,`name`,`created_at`,`updated_at`,`groupflag`) values (1,'项目经理','2013-08-29 10:52:02','2013-08-29 10:52:02',1),(2,'机长','2013-08-29 10:52:18','2013-08-29 10:52:18',2),(3,'班长','2013-08-29 10:52:44','2013-08-29 10:52:44',3),(4,'班员','2013-08-29 10:53:07','2013-08-29 10:53:07',4);

/*Table structure for table `groups_users` */

DROP TABLE IF EXISTS `groups_users`;

CREATE TABLE `groups_users` (
  `group_id` int(11) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  KEY `index_groups_users_on_group_id_and_user_id` (`group_id`,`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

/*Data for the table `groups_users` */

/*Table structure for table `holeassets` */

DROP TABLE IF EXISTS `holeassets`;

CREATE TABLE `holeassets` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `data_content_type` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `data_file_name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `data_file_size` decimal(10,0) DEFAULT NULL,
  `data_updated_at` datetime DEFAULT NULL,
  `hole_id` decimal(10,0) DEFAULT NULL,
  `data_origin_file_name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

/*Data for the table `holeassets` */

/*Table structure for table `holes` */

DROP TABLE IF EXISTS `holes`;

CREATE TABLE `holes` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `designdeep` int(11) DEFAULT NULL,
  `actualdeep` float DEFAULT NULL,
  `designdiameter` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `actualdiameter` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `finishdate` date DEFAULT NULL,
  `startdate` date DEFAULT NULL,
  `contract_id` int(11) DEFAULT NULL,
  `minearea` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `holenumber` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `geologysituation` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `designapexangle` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `actualapexangle` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `designcoreratio` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `actualcoreratio` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `designbook` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `drillingpurpose` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `status` int(11) DEFAULT NULL,
  `remark` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `attachment_id` int(11) DEFAULT NULL,
  `opennoticeatt_id` int(11) DEFAULT NULL,
  `closenoticeatt_id` int(11) DEFAULT NULL,
  `curvetableatt_id` int(11) DEFAULT NULL,
  `measuretableatt_id` int(11) DEFAULT NULL,
  `coretransferdoc_id` int(11) DEFAULT NULL,
  `tourreporttransferdoc_id` int(11) DEFAULT NULL,
  `qualitychecktable_id` int(11) DEFAULT NULL,
  `tourreporttabledoc_id` int(11) DEFAULT NULL,
  `designminecoreratio` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `actualminecoreratio` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `designpositionangle` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `actualpositionangle` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `unitprice` decimal(10,0) DEFAULT NULL,
  `output` decimal(10,0) DEFAULT NULL,
  `outerflag` decimal(10,0) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

/*Data for the table `holes` */

insert  into `holes`(`id`,`designdeep`,`actualdeep`,`designdiameter`,`actualdiameter`,`finishdate`,`startdate`,`contract_id`,`minearea`,`holenumber`,`geologysituation`,`designapexangle`,`actualapexangle`,`designcoreratio`,`actualcoreratio`,`designbook`,`drillingpurpose`,`status`,`remark`,`attachment_id`,`opennoticeatt_id`,`closenoticeatt_id`,`curvetableatt_id`,`measuretableatt_id`,`coretransferdoc_id`,`tourreporttransferdoc_id`,`qualitychecktable_id`,`tourreporttabledoc_id`,`designminecoreratio`,`actualminecoreratio`,`designpositionangle`,`actualpositionangle`,`unitprice`,`output`,`outerflag`) values (8,2124,435.96,'19',NULL,NULL,'2013-11-10',1,'桐沟深部探矿','zk8066','','0',NULL,'75',NULL,NULL,'25',1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'90',NULL,'0',NULL,NULL,NULL,'0'),(9,930,53.27,'19',NULL,NULL,'2014-05-13',1,'桐沟深部探矿','ZK8171','','90',NULL,'75',NULL,NULL,'25',1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'80',NULL,'0',NULL,NULL,NULL,'0'),(10,1700,499,'19',NULL,NULL,'2013-10-25',1,'阳平陈家沟','ZK8043','','0',NULL,'80',NULL,NULL,'25',1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'90',NULL,'0',NULL,NULL,NULL,'1'),(11,1450,NULL,'19',NULL,NULL,'2013-05-18',6,'河南省灵宝市小秦岭金矿田北中矿带深部金矿预查','zk1816','','90',NULL,'80',NULL,NULL,'25',1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'85',NULL,'0',NULL,NULL,NULL,'0'),(12,1760,1120,'19',NULL,NULL,'2013-09-01',6,'河南省灵宝市小秦岭金矿田北中矿带深部金矿预查','zk802','','90',NULL,'80',NULL,NULL,'25',1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'85',NULL,'0',NULL,NULL,NULL,'1'),(13,1500,446,'19',NULL,NULL,'2014-04-09',6,'河南省灵宝市小秦岭金矿田北中矿带深部金矿预查','zk2416','','90',NULL,'80',NULL,NULL,'25',1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'85',NULL,'0',NULL,NULL,NULL,'1'),(14,400,95,'18',NULL,NULL,'2014-06-11',8,'河南省灵宝金渠金矿坑内钻探工程','zk2020n','','60',NULL,'80',NULL,NULL,'25',1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'85',NULL,'180',NULL,NULL,NULL,'1'),(15,720,678,'19',NULL,NULL,'2014-04-20',9,'金源公司鼎立分公司接替资源勘查钻探施工','zk15003','','90',NULL,'80',NULL,NULL,'25',1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'85',NULL,'0',NULL,NULL,NULL,'1'),(16,1410,825,'19',NULL,NULL,'2013-07-23',10,'河南省小秦岭金矿田南中矿带金矿普查（2011年度续作）机械岩心钻探工程','zk2601','','90',NULL,'80',NULL,NULL,'25',1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'85',NULL,'0',NULL,NULL,NULL,'1'),(17,1200,506,'19',NULL,NULL,'2013-09-03',11,'金源公司鑫宝分公司朱阳樊岔矿区钻探工程','zk1104','','90',NULL,'80',NULL,NULL,'25',1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'85',NULL,'0',NULL,NULL,NULL,'1'),(18,1410,1111,'19',NULL,NULL,'2013-06-03',11,'金源公司鑫宝分公司朱阳樊岔矿区钻探工程','zk300','','90',NULL,'80',NULL,NULL,'25',1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'85',NULL,'0',NULL,NULL,NULL,'1'),(19,1280,41,'19',NULL,NULL,'2014-06-13',12,'河南省小秦岭金矿田北矿带深部金矿普查2013年度续作项目机械岩心钻探工程','zk27009','','90',NULL,'80',NULL,NULL,'25',1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'85',NULL,'0',NULL,NULL,NULL,'1');

/*Table structure for table `lastyearlefts` */

DROP TABLE IF EXISTS `lastyearlefts`;

CREATE TABLE `lastyearlefts` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `year` varchar(255) DEFAULT NULL,
  `lastyeartotallength` float DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

/*Data for the table `lastyearlefts` */

insert  into `lastyearlefts`(`id`,`year`,`lastyeartotallength`,`created_at`,`updated_at`) values (1,NULL,2755,'2014-06-15 06:15:53','2014-06-15 06:17:24');

/*Table structure for table `materials` */

DROP TABLE IF EXISTS `materials`;

CREATE TABLE `materials` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `count` decimal(10,0) DEFAULT NULL,
  `price` decimal(10,0) DEFAULT NULL,
  `stockdate` date DEFAULT NULL,
  `recorder` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `remark` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `materialtype` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `model` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `manufacture` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `holeid` int(11) DEFAULT NULL,
  `stockin` decimal(10,0) DEFAULT NULL,
  `recipient` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

/*Data for the table `materials` */

insert  into `materials`(`id`,`name`,`count`,`price`,`stockdate`,`recorder`,`remark`,`created_at`,`updated_at`,`materialtype`,`model`,`manufacture`,`holeid`,`stockin`,`recipient`) values (1,'粘土','5','5','2013-09-24','王晓','','2013-09-24 15:48:31','2013-09-24 15:48:31',NULL,'HS-5','重庆粘土厂',3,NULL,NULL);

/*Table structure for table `permissions` */

DROP TABLE IF EXISTS `permissions`;

CREATE TABLE `permissions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `description` text COLLATE utf8_unicode_ci,
  `subject_class` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `action` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=116 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

/*Data for the table `permissions` */

insert  into `permissions`(`id`,`name`,`description`,`subject_class`,`action`,`created_at`,`updated_at`) values (89,'合同列表','合同列表权限','Contract','index','2014-03-16 13:23:39','2014-03-16 13:23:39'),(90,'新增合同','新增合同权限','Contract','new','2014-03-16 13:23:39','2014-03-16 13:23:39'),(91,'合同关闭','合同关闭和归档','Contract','indexforclose','2014-03-16 13:23:39','2014-03-16 13:23:39'),(92,'新增钻孔','新增钻孔','Hole','new','2014-03-16 13:23:39','2014-03-16 13:23:39'),(93,'钻孔配置','钻孔配置','Hole','deployment','2014-03-16 13:23:39','2014-03-16 13:23:39'),(94,'钻孔查询','钻孔查询','Hole','index','2014-03-16 13:23:39','2014-03-16 13:23:39'),(95,'班报填写','班报填写','Tourreport','new','2014-03-16 13:23:40','2014-03-16 13:23:40'),(96,'班报修改','班报修改','Tourreport','edit','2014-03-16 13:23:40','2014-03-16 13:23:40'),(97,'班报查询','班报查询','Tourreport','index','2014-03-16 13:23:40','2014-03-16 13:23:40'),(98,'设备存库','设备库存','Equipment','index','2014-03-16 13:23:40','2014-03-16 13:23:40'),(99,'设备入库','设备入库','Equipment','stockin','2014-03-16 13:23:40','2014-03-16 13:23:40'),(100,'设备处理','设备处理','Equipment','discard','2014-03-16 13:23:40','2014-03-16 13:23:40'),(101,'材料库存','材料库存','Material','index','2014-03-16 13:23:40','2014-03-16 13:23:40'),(102,'材料入库','材料入库','Material','new','2014-03-16 13:23:40','2014-03-16 13:23:40'),(103,'材料消耗','材料消耗','Material','stockout','2014-03-16 13:23:40','2014-03-16 13:23:40'),(104,'合同统计','合同统计','Chart','contract','2014-03-16 13:23:40','2014-03-16 13:23:40'),(105,'钻孔统计','钻孔统计的情况','Chart','hole','2014-03-16 13:23:40','2014-03-16 13:23:40'),(106,'领导关注钻孔情况','领导关注钻孔情况','Leader','holeproduct','2014-03-16 13:23:40','2014-03-16 13:23:40'),(107,'领导关注合同情况','领导关注合同情况','Leader','contract','2014-03-16 13:23:40','2014-03-16 13:23:40'),(108,'合同归档','合同归档','archive','contract','2014-03-16 13:23:40','2014-03-16 13:23:40'),(109,'钻孔归档','钻孔归档','archive','hole','2014-03-16 13:23:40','2014-03-16 13:23:40'),(110,'部门管理','部门管理','department','index','2014-03-16 13:23:40','2014-03-16 13:23:40'),(111,'人员管理','人员管理','user','index','2014-03-16 13:23:40','2014-03-16 13:23:40'),(112,'人员配组','人员配组','group','index','2014-03-16 13:23:40','2014-03-16 13:23:40'),(113,'角色管理','角色管理','role','index','2014-03-16 13:23:40','2014-03-16 13:23:40'),(114,'字典管理','字典管理','dictionary','index','2014-03-16 13:23:40','2014-03-16 13:23:40'),(115,'钻孔终孔','钻孔终孔','Hole','close','2014-03-16 12:00:00','2014-03-16 12:00:00');

/*Table structure for table `permissions_roles` */

DROP TABLE IF EXISTS `permissions_roles`;

CREATE TABLE `permissions_roles` (
  `permission_id` int(11) DEFAULT NULL,
  `role_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

/*Data for the table `permissions_roles` */

insert  into `permissions_roles`(`permission_id`,`role_id`) values (1,1),(6,1),(11,1),(15,1),(19,1),(24,1),(29,1),(34,1),(38,1),(42,1),(46,1),(51,1),(56,1),(58,1),(89,2),(94,2),(97,2),(98,2),(104,2),(105,2),(106,2),(107,2),(108,2),(109,2),(89,3),(90,3),(91,3),(108,3),(98,4),(99,4),(100,4),(110,6),(111,6),(112,6),(89,8),(90,8),(91,8),(92,8),(93,8),(94,8),(95,8),(96,8),(97,8),(104,8),(105,8),(108,8),(109,8),(112,8),(89,7),(90,7),(91,7),(92,7),(93,7),(94,7),(104,7),(105,7),(106,7),(107,7),(108,7),(109,7),(112,7),(94,10),(97,10),(104,10),(105,10),(93,11),(94,11),(95,11),(97,11),(101,11),(102,11),(103,11),(89,9),(90,9),(91,9),(92,9),(93,9),(94,9),(95,9),(96,9),(97,9),(98,9),(99,9),(100,9),(101,9),(102,9),(103,9),(104,9),(105,9),(106,9),(107,9),(108,9),(109,9),(110,9),(111,9),(112,9),(113,9),(114,9);

/*Table structure for table `pumps` */

DROP TABLE IF EXISTS `pumps`;

CREATE TABLE `pumps` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `pumpmodel` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `pumpDiameter` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `pumplineNumber` decimal(10,0) DEFAULT NULL,
  `stroke` decimal(10,0) DEFAULT NULL,
  `strokeTimes` decimal(10,0) DEFAULT NULL,
  `traffic` decimal(10,0) DEFAULT NULL,
  `pressure` decimal(10,0) DEFAULT NULL,
  `power` decimal(10,0) DEFAULT NULL,
  `overallsize` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `weight` decimal(10,0) DEFAULT NULL,
  `manufacture` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `manufactureContact` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `picture` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `remark` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `devicenumber` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `status` tinyint(1) DEFAULT NULL,
  `groupstatus` tinyint(1) DEFAULT NULL,
  `rigmachineid` decimal(10,0) DEFAULT NULL,
  `attachment_id` int(11) DEFAULT NULL,
  `discarddate` date DEFAULT NULL,
  `discardtype` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `discardreason` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `officialcode` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

/*Data for the table `pumps` */

insert  into `pumps`(`id`,`pumpmodel`,`pumpDiameter`,`pumplineNumber`,`stroke`,`strokeTimes`,`traffic`,`pressure`,`power`,`overallsize`,`weight`,`manufacture`,`manufactureContact`,`picture`,`remark`,`created_at`,`updated_at`,`name`,`devicenumber`,`status`,`groupstatus`,`rigmachineid`,`attachment_id`,`discarddate`,`discardtype`,`discardreason`,`officialcode`) values (5,'BW-300/16','80',NULL,NULL,NULL,'80','16','30','','1500','衡阳探矿厂','12345678',NULL,'','2014-03-16 12:03:16','2014-03-16 12:03:16',NULL,'NJB003',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'056'),(6,'BW250','80',NULL,NULL,NULL,'250','50','15','','1300','衡阳探矿厂','13973406603',NULL,'','2014-06-13 07:01:56','2014-06-13 07:01:56',NULL,'103',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'01-114'),(7,'BW250','80',NULL,NULL,NULL,'250','50','15','','1300','衡阳探矿厂','0734-8320029',NULL,'','2014-06-15 02:32:45','2014-06-15 02:32:45',NULL,'311',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'01-063');

/*Table structure for table `rigmachines` */

DROP TABLE IF EXISTS `rigmachines`;

CREATE TABLE `rigmachines` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `rigmodel` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `righoleDeep` decimal(10,0) DEFAULT NULL,
  `pipeDiameter` decimal(10,0) DEFAULT NULL,
  `rigPower` decimal(10,0) DEFAULT NULL,
  `rotatingSpeed` decimal(10,0) DEFAULT NULL,
  `rigweight` decimal(10,0) DEFAULT NULL,
  `manufacture` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `manufactureContact` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `overallsize` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `picture` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `remark` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `devicenumber` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `status` tinyint(1) DEFAULT NULL,
  `attachment_id` int(11) DEFAULT NULL,
  `discarddate` date DEFAULT NULL,
  `discardtype` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `discardreason` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `officialcode` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `maxrotatespeed` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

/*Data for the table `rigmachines` */

insert  into `rigmachines`(`id`,`rigmodel`,`righoleDeep`,`pipeDiameter`,`rigPower`,`rotatingSpeed`,`rigweight`,`manufacture`,`manufactureContact`,`overallsize`,`picture`,`remark`,`created_at`,`updated_at`,`name`,`devicenumber`,`status`,`attachment_id`,`discarddate`,`discardtype`,`discardreason`,`officialcode`,`maxrotatespeed`) values (8,'XY-8','3000','89','90',NULL,NULL,'张家口探矿厂','13839881018','',NULL,'','2014-05-04 14:54:05','2014-05-04 17:03:48',NULL,'T0008',0,NULL,'2014-05-05','设备报废','','',''),(10,'XY-6B','2000','89','55',NULL,NULL,'张家口探矿厂','0313-4080349','',NULL,'','2014-06-13 06:58:11','2014-06-13 06:58:11',NULL,'09',NULL,NULL,NULL,NULL,NULL,'01-175',''),(11,'XY-6B','2000','89','55',NULL,'5','张家口探矿厂','0313-4080424','',NULL,'','2014-06-15 02:26:58','2014-06-15 02:26:58',NULL,'30#',NULL,NULL,NULL,NULL,NULL,'01-091','');

/*Table structure for table `roles` */

DROP TABLE IF EXISTS `roles`;

CREATE TABLE `roles` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `description` text COLLATE utf8_unicode_ci,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

/*Data for the table `roles` */

insert  into `roles`(`id`,`name`,`description`,`created_at`,`updated_at`) values (1,'系统管理员','系统管理员','2013-08-09 03:22:38','2013-08-09 03:22:38'),(2,'领导角色','领导角色','2014-03-16 13:38:47','2014-03-16 13:38:47'),(3,'合同管理角色','合同管理角色','2014-03-16 13:39:16','2014-03-16 13:39:16'),(4,'设备管理角色','设备管理角色','2014-03-16 13:39:38','2014-03-16 13:39:38'),(6,'人员管理角色','人员管理角色','2014-03-16 13:40:22','2014-03-16 13:40:22'),(7,'分公司经理角色','分公司经理角色','2014-03-16 14:05:55','2014-03-16 14:05:55'),(8,'项目经理角色','项目经理角色','2014-03-16 14:09:14','2014-03-16 14:09:14'),(9,'业务主管角色','业务主管角色','2014-03-16 14:26:36','2014-03-16 14:26:36'),(10,'技术员角色','技术员角色','2014-03-16 14:29:29','2014-03-16 14:29:29'),(11,'机长角色','机长角色','2014-03-16 14:39:57','2014-03-16 14:39:57');

/*Table structure for table `schema_migrations` */

DROP TABLE IF EXISTS `schema_migrations`;

CREATE TABLE `schema_migrations` (
  `version` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  UNIQUE KEY `unique_schema_migrations` (`version`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

/*Data for the table `schema_migrations` */

insert  into `schema_migrations`(`version`) values ('20130315130733'),('20130315132129'),('20130315132256'),('20130318081938'),('20130326051843'),('20130504031328'),('20130505080033'),('20130505084412'),('20130505154025'),('20130505154734'),('20130513015758'),('20130518030509'),('20130518031157'),('20130518032445'),('20130526071558'),('20130529143813'),('20130529153811'),('20130603143006'),('20130603153456'),('20130606010627'),('20130612100409'),('20130613012043'),('20130613012931'),('20130613013347'),('20130613013455'),('20130613013854'),('20130613014108'),('20130723170803'),('20130725081643'),('20130725084015'),('20130725155511'),('20130727051621'),('20130806010605'),('20130813030654'),('20130822143534'),('20130822143706'),('20130822172302'),('20130908152322'),('20130911072103'),('20130920033825'),('20130920081244'),('20130920094628'),('20130921155516'),('20130922024635'),('20130924103004'),('20130928091617'),('20131002000830'),('20131002003706'),('20131003052321'),('20131004052957'),('20131005041253'),('20131109135536'),('20131231031801'),('20140102033449'),('20140109063729'),('20140109084158'),('20140109084856'),('20140111045955'),('20140111074532'),('20140112102142'),('20140112111009'),('20140112115401'),('20140112120919'),('20140113075349'),('20140113154248'),('20140207171848'),('20140302042727'),('20140319061558'),('20140423082231'),('20140615042930');

/*Table structure for table `teams` */

DROP TABLE IF EXISTS `teams`;

CREATE TABLE `teams` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `leader` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `contact` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `memberquantity` int(11) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

/*Data for the table `teams` */

insert  into `teams`(`id`,`name`,`leader`,`contact`,`memberquantity`,`created_at`,`updated_at`) values (1,'郑州勘探队','朱哥','135124123',10,'2013-03-18 03:51:36','2013-03-18 03:51:36'),(2,'新的勘探队','解亚龙','13691394242',10,'2013-03-18 05:38:02','2013-03-18 05:38:02');

/*Table structure for table `tourreports` */

DROP TABLE IF EXISTS `tourreports`;

CREATE TABLE `tourreports` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `holeid` int(11) DEFAULT NULL,
  `tourdate` date DEFAULT NULL,
  `starttime` time DEFAULT NULL,
  `finishtime` time DEFAULT NULL,
  `administrator` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `tourleader` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `recorder` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `tourshift` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `tourcore` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `tourdrillingtime` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `tourauxiliarytime` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `remark` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `status` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `lastdeep` float DEFAULT NULL,
  `currentdeep` float DEFAULT NULL,
  `intrumenttakeover` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `takeoverremark` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `holeaccidenttime` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `deviceaccidenttime` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `othertime` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `totaltime` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `projectmanager` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `lastleader` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `nextleader` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `centralizer` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `antideviation` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `source` decimal(10,0) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=145 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

/*Data for the table `tourreports` */

insert  into `tourreports`(`id`,`holeid`,`tourdate`,`starttime`,`finishtime`,`administrator`,`tourleader`,`recorder`,`tourshift`,`tourcore`,`tourdrillingtime`,`tourauxiliarytime`,`remark`,`created_at`,`updated_at`,`status`,`lastdeep`,`currentdeep`,`intrumenttakeover`,`takeoverremark`,`holeaccidenttime`,`deviceaccidenttime`,`othertime`,`totaltime`,`projectmanager`,`lastleader`,`nextleader`,`centralizer`,`antideviation`,`source`) values (15,3,'2013-09-12','16:00:00','00:00:00','机长','班长一','王超','10','4','','',NULL,'2013-09-12 13:04:03','2013-09-12 13:04:03',NULL,0,10,'钻杆一根','',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(16,3,'2013-09-14','16:00:00','00:00:00','机长','班长一','记录员二','70','10','300','1:00',NULL,'2013-09-14 05:02:57','2013-09-14 05:02:57',NULL,20,90,'钻具交接','交接说明',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(27,6,'2012-04-22','03:00:00','04:00:00',NULL,NULL,'','12.58','1.97','05:00','07:00',NULL,'2014-05-01 14:22:55','2014-05-01 14:22:55',NULL,NULL,304.22,'','','00:00','00:00','00:00','12:00','16',NULL,NULL,'',NULL,'2'),(28,6,'2014-05-01','03:00:00','04:00:00',NULL,NULL,'','0','0','00:00','01:30',NULL,'2014-05-01 14:22:56','2014-05-01 14:22:56',NULL,NULL,291.64,'','','00:00','00:00','00:00','01:30','16',NULL,NULL,'',NULL,'2'),(29,6,'2014-05-01','03:00:00','15:00:00',NULL,NULL,'','8.77','8.7','08:40','03:20',NULL,'2014-05-01 15:24:37','2014-05-01 15:24:37',NULL,NULL,328.91,'','','00:00','00:00','00:00','12:00','16',NULL,NULL,'',NULL,'2'),(31,6,'2014-05-01','15:00:00','03:00:00',NULL,'29','化天辉','7.44','7.32','06:50','05:10',NULL,'2014-05-01 17:27:58','2014-05-01 17:27:58',NULL,NULL,357.11,'2个单根，长6.04米','','00:00','00:00','00:00','12:00','16',NULL,NULL,'',NULL,'2'),(32,6,'2012-04-25','15:00:00','03:00:00',NULL,NULL,'','11.09','1.62','05:40','06:20',NULL,'2014-05-01 18:00:59','2014-05-01 18:00:59',NULL,NULL,368.5,'','','00:00','00:00','00:00','12:00','16',NULL,NULL,'',NULL,'2'),(33,6,'2014-05-01','00:00:00','00:00:00',NULL,NULL,'','0','0','00:00','01:00',NULL,'2014-05-01 18:01:00','2014-05-01 18:01:00',NULL,NULL,357.11,'','','00:00','00:00','00:00','01:00','16',NULL,NULL,'',NULL,'2'),(34,6,'2012-07-02','15:00:00','03:00:00',NULL,'30','管建军','4.22','4.19','02:40','09:20',NULL,'2014-05-01 18:40:02','2014-05-01 18:40:02',NULL,NULL,373.95,'1个单根','早班钻机坏了，等配件，看班。','00:00','00:00','00:00','12:00','16',NULL,NULL,'',NULL,'2'),(35,7,'2014-05-01','00:00:00','23:00:00',NULL,NULL,'','12.5','0','23:59','00:00',NULL,'2014-05-01 19:19:00','2014-05-01 19:19:00',NULL,NULL,373.95,'','','00:00','00:00','00:00','23:59',NULL,NULL,NULL,'',NULL,'2'),(36,6,'2012-02-01','15:00:00','03:00:00',NULL,'30','关建军','6.44','6.42','07:50','02:10',NULL,'2014-05-01 21:06:39','2014-05-01 21:06:39',NULL,NULL,423.5,'1个单根，长3.03米','','00:00','00:00','00:00','10:00','16',NULL,NULL,'',NULL,'2'),(37,7,'2014-05-01','00:00:00','00:00:00',NULL,NULL,'','12.3','0','23:59','00:00',NULL,'2014-05-01 21:06:39','2014-05-01 21:06:39',NULL,NULL,300.1,'','','00:00','00:00','00:00','23:59',NULL,NULL,NULL,'',NULL,'2'),(38,9,'2014-06-15','08:00:00','16:00:00','19','36','金志刚','4.92','0.00','3:40','4:20',NULL,'2014-06-15 00:43:42','2014-06-15 00:46:28',NULL,0,4.92,'1个单根，长 米：①      ②      ③     ④     ⑤     \r\n1个立根，长546米，机上钻杆长 米\r\n粗径钻具全长  米，钻具总长  米 ','','','','','8:00','','35','36','','','1'),(39,9,'2014-05-19','16:00:00','00:00:00','19','35','郭卫齐','1.77','0.00','1:40','6:19',NULL,'2014-06-15 01:19:57','2014-06-15 01:19:57',NULL,4.92,6.69,'1个单根，长 米：①      ②      ③     ④     ⑤     \r\n1个立根，长546米，机上钻杆长 米\r\n粗径钻具全长  米，钻具总长  米 ','19:00 ~22:00 辅助， 下Ф146套管，围护孔口， 配Ф127钻具，换钻具，-3.92， +5.89','','','','7:59','','64','35','','','1'),(40,9,'2014-05-22','16:00:00','00:00:00','19','35','郭卫齐','11.52','10.22','4:10','3:49',NULL,'2014-06-15 01:37:17','2014-06-15 02:05:18',NULL,41.75,53.27,'1个单根，长3.04 米：①  3.04    ②      ③     ④     ⑤     \r\n3个立根，长45.53米，机上钻杆长 6.20米\r\n粗径钻具全长 4.10 米，钻具总长58.87  米 ','在50.12米处校正孔深，立根①  15.14，②  15.14，总长30.28，单根①  3.02   ②  3.04    ③   3.12  ④ 3.05，单根总长12.23，立轴6.20，钻具4.10，上余0.80，机高1.90，孔深=钻具总长-上余-机高=30.28+12.23+4.1+6.20-0.80-1.90=50.11\r\n误差=校正后孔深-校正前孔深=50.11-50.12=-0.01。\r\n原孔深不变。\r\n测斜：顶角   方位角   。','','','','7:59','','35','35','','','1'),(41,8,'2013-11-17','03:00:00','15:00:00','18','29','吉兆辉','1.02','0.70','3:30','8:30',NULL,'2014-05-09 15:22:42','2014-05-09 15:22:42',NULL,9.27,10.29,' 2个单根，长5.95米：①2.97②2.98 ③     ④     ⑤     \r\n 个立根，长 米，机上钻杆长6.06米\r\n粗径钻具全长2.02米，钻具总长14.03米 ','','','','','12:00','','30','29','','','1'),(42,8,'2013-11-17','15:00:00','03:00:00','18','30','徐志强','1.89','1.44','4:10','7:40',NULL,'2014-05-09 15:46:08','2014-05-09 15:46:08',NULL,10.29,12.18,' 2个单根，长5.10米：①2.97②2.12 ③     ④     ⑤     \r\n 个立根，长 米，机上钻杆长6.06米\r\n粗径钻具全长4.26米，钻具总长15.42米 ','','','','','11:50','','63','30','','','1'),(43,8,'2013-11-18','03:00:00','15:00:00','18','63','吴富国','1.51','0.92','2:30','9:30',NULL,'2014-05-09 19:54:48','2014-05-09 19:54:48',NULL,12.18,13.69,' 3个单根，长8.92米：①2.98②2.97 ③2.97④     ⑤     \r\n 个立根，长 米，机上钻杆长6.06米\r\n粗径钻具全长4.26米，钻具总长19.24米 ','在孔深12.18米，换S114绳索取心钻具。辅助工作为：配钻杆下钻+2.98+2.97+2.97-3.82-2.12。','','','','12:00','','29','63','','','1'),(44,8,'2013-11-22','15:00:00','03:00:00','18','29','吉兆辉','0.86','0.68','1:00','8:30',NULL,'2014-05-09 20:12:38','2014-05-09 20:12:38',NULL,13.69,14.55,' 2个单根，长6.79米：①3.82②2.97 ③    ④     ⑤     \r\n 个立根，长 米，机上钻杆长6.06米\r\n粗径钻具全长6.40米，钻具总长19.25米 ','其他为铺池子和安装液压钳，辅助为配钻具、下钻、通孔、清理泥浆池。','','','2:30','12:00','','30','29','','','1'),(45,8,'2013-11-23','03:00:00','15:00:00','18','30','徐智强','3.95','2.46','5:50','6:10',NULL,'2014-05-10 08:56:18','2014-05-10 08:56:18',NULL,14.55,18.5,'4个单根，长11.98米：①2.98②2.98 ③3.05④2.97⑤     \r\n 个立根，长 米，机上钻杆长6.06米\r\n粗径钻具全长4.26米，钻具总长22.30米 ','辅助为配S114钻具+4.26-6.40，换钻杆+2.98+2.98+3.05-3.82-2.97，下钻。','','','','12:00','','63','30','','','1'),(46,8,'2013-11-23','15:00:00','03:00:00','18','63','吴富国','1.97','1.05','4:10','7:30',NULL,'2014-05-10 09:07:09','2014-05-10 09:07:09',NULL,18.5,20.47,'5个单根，长14.95米：①2.98②2.98 ③3.05④2.97⑤2.97   个立根，长 米，机上钻杆长6.06米\r\n粗径钻具全长4.26米，钻具总长25.27米 ','辅助为投内管。最后起大钻，等水。','','','','11:40','','29','63','','','1'),(47,8,'2014-03-20','08:00:00','15:00:00','18','29','吉兆辉','0.00','0.00','','0:00',NULL,'2014-05-10 09:37:20','2014-05-10 09:37:20',NULL,20.47,20.47,'5个单根，长14.95米：①2.98②2.98 ③3.05④2.97⑤2.97   个立根，长 米，机上钻杆长6.06米\r\n粗径钻具全长4.26米，钻具总长25.27米 ','其他为开钻前准备工作，修水泵，整理岩心，清理水池，等皮碗。','','','7:00','7:00','','30','29','','','1'),(48,8,'2014-03-20','15:00:00','03:00:00','18','30','徐智强','2.10','2.05','2:40','1:00',NULL,'2014-05-10 10:01:54','2014-05-10 10:01:54',NULL,20.47,22.57,'5个单根，长14.95米：①2.98②2.98 ③3.05④2.97⑤2.97   个立根，长 米，机上钻杆长6.06米\r\n粗径钻具全长4.26米，钻具总长25.27米 ','其他为等水看班。','','','7:50','11:30','','63','30','','','1'),(49,8,'2014-03-21','03:00:00','15:00:00','18','63','吴富国','0.00','0.00','','4:00',NULL,'2014-05-10 10:06:35','2014-05-10 10:06:35',NULL,22.57,22.57,'5个单根，长14.95米：①2.98②2.98 ③3.05④2.97⑤2.97   个立根，长 米，机上钻杆长6.06米\r\n粗径钻具全长4.26米，钻具总长25.27米 ','其他为看班。','','','8:00','12:00','','29','63','','','1'),(50,8,'2014-03-22','15:00:00','03:00:00','18','30','徐智强','0.00','0.00','','0:00',NULL,'2014-05-10 10:16:34','2014-05-10 10:16:34',NULL,22.57,22.57,'5个单根，长14.95米：①2.98②2.98 ③3.05④2.97⑤2.97   个立根，长 米，机上钻杆长6.20米\r\n粗径钻具全长4.26米，钻具总长25.41米 ','其他为等水，做通孔前准备工作，通孔，通孔到底提引器坏，十字接头+0.14。','','','12:00','12:00','','63','30','','','1'),(51,8,'2014-03-23','15:00:00','03:00:00','18','30','徐智强','8.89','8.77','7:30','4:00',NULL,'2014-05-10 11:00:11','2014-05-10 11:00:11',NULL,22.57,31.46,' 个单根，长5.96米：①2.98②2.98 ③    ④    ⑤        \r\n1个立根，长17.94米，机上钻杆长6.20米\r\n粗径钻具全长4.26米，钻具总长34.36米 ','早班等提引器。其他为固定小绞车。','','','0:20','11:50','','29','29','','','1'),(52,8,'2014-03-24','03:00:00','15:00:00','18','63','吉兆辉','8.16','7.73','7:10','3:30',NULL,'2014-05-11 09:11:40','2014-05-11 09:11:40',NULL,31.46,39.62,'5个单根，长14.92米：①2.98②2.98 ③2.98④2.99⑤2.99\r\n1个立根，长17.94米，机上钻杆长6.20米\r\n粗径钻具全长4.26米，钻具总长43.32米 ','停待为等水','','','1:20','12:00','','29','29','','','1'),(53,8,'2014-03-24','15:00:00','03:00:00','18','29','吉兆辉','5.09','4.40','2:35','3:50',NULL,'2014-05-11 09:31:23','2014-05-11 09:31:23',NULL,39.62,44.71,'1个单根，长3.00米：①3.00②     ③     ④     ⑤     \r\n2个立根，长35.85米，机上钻杆长6.20米\r\n粗径钻具全长4.26米，钻具总长49.31米 ','辅助为水泵漏水换垫子。其他为起大钻，等水，看班。','','','5:15','11:40','','30','29','','','1'),(54,8,'2014-03-25','15:00:00','03:00:00','18','30','徐智强','6.05','5.71','4:25','3:00',NULL,'2014-05-11 09:44:58','2014-05-11 09:44:58',NULL,44.71,50.76,'3个单根，长8.95米：①3.00②2.96③2.99④     ⑤     \r\n2个立根，长35.85米，机上钻杆长6.20米\r\n粗径钻具全长4.26米，钻具总长55.26米 ','50.46米校正孔深误差0.00米，测斜顶角0°。','','','4:00','11:25','','63','30','','','1'),(55,8,'2014-03-26','03:00:00','15:00:00','18','63','吉兆辉','5.12','4.99','3:00','2:30',NULL,'2014-05-11 09:56:24','2014-05-11 09:56:24',NULL,50.76,55.88,'5个单根，长15.07米：①3.00②2.96③2.99④3.14⑤2.98\r\n2个立根，长35.85米，机上钻杆长6.20米\r\n粗径钻具全长4.26米，钻具总长61.38米 ','第一个其他为整理老虎笼。第二个其他为整理地台板，等水，清水池，池子塌，起大钻，修水池。在41.51米处漏水。','','','6:30','12:00','','29','63','','','1'),(56,8,'2014-03-26','15:00:00','03:00:00','18','29','吴富国','4.88','4.73','5:30','6:10',NULL,'2014-05-11 10:15:42','2014-05-11 10:15:42',NULL,55.88,60.76,'  个单根，长     米：①     ②     ③     ④     ⑤     \r\n3个立根，长53.90米，机上钻杆长6.20米\r\n粗径钻具全长4.26米，钻具总长64.36米 ','辅助位起大钻换钻头、扩孔器，下大钻扫孔。','0:40','','','11:40','','30','29','','','1'),(57,8,'2014-03-27','03:00:00','15:00:00','18','30','徐智强','0.00','0.00','','8:55',NULL,'2014-05-11 10:21:36','2014-05-11 10:21:36',NULL,60.76,60.76,'  个单根，长     米：①     ②     ③     ④     ⑤     \r\n3个立根，长53.90米，机上钻杆长6.20米\r\n粗径钻具全长4.26米，钻具总长64.36米 ','辅助为扫孔。停待为等水，等电。','','0:30','3:05','12:00','','63','30','','','1'),(58,8,'2014-03-27','03:00:00','15:00:00','18','30','徐智强','0.00','0.00','','8:55',NULL,'2014-05-11 10:21:41','2014-05-11 10:21:41',NULL,60.76,60.76,'  个单根，长     米：①     ②     ③     ④     ⑤     \r\n3个立根，长53.90米，机上钻杆长6.20米\r\n粗径钻具全长4.26米，钻具总长64.36米 ','辅助为扫孔。停待为等水，等电。','','0:30','3:05','12:00','','63','30','','','1'),(59,8,'2014-03-27','15:00:00','03:00:00','18','29','吉兆辉','7.44','7.28','7:40','3:35',NULL,'2014-05-12 10:03:45','2014-05-12 10:03:45',NULL,60.76,68.2,'  3个单根，长 8.94 米：①2.99 m ②2.98 m  ③2.98 m  ④     ⑤     \r\n3个立根，长53.90米，机上钻杆长6.20米\r\n粗径钻具全长4.26米，钻具总长73.30米 ','','','','','11:15','','29','29','','','1'),(60,8,'2014-03-28','03:00:00','15:00:00','18','63','吴富国','13.33','13.25','8:40','2:50',NULL,'2014-05-21 21:41:12','2014-05-21 21:41:12',NULL,68.2,81.53,'1个单根，长2.98米：①2.98 m ②        ③      ④     ⑤     \r\n4个立根，长71.79米，机上钻杆长6.20米\r\n粗径钻具全长4.26米，钻具总长85.23米 ','设备事故为;起小钻，小绞车坏，修小绞车。','','0:30','0:30','12:00','','30','63','','','1'),(61,8,'2014-03-28','15:00:00','03:00:00','18','30','徐智强','15.01','14.55','10:40','3:20',NULL,'2014-05-21 22:04:53','2014-05-21 22:04:53',NULL,81.53,96.54,' 个单根，长 米：①    ②        ③      ④     ⑤     \r\n5个立根，长89.68米，机上钻杆长6.20米\r\n粗径钻具全长4.26米，钻具总长100.14米 ','','','','','14:00','','29','30','','','1'),(62,8,'2014-03-29','03:00:00','15:00:00','18','29','吉兆辉','3.40','1.70','0:50','8:50',NULL,'2014-05-21 22:19:49','2014-05-21 22:19:49',NULL,96.54,98.24,'1个单根，长3.00米：①3.00②        ③      ④     ⑤     \r\n5个立根，长89.68米，机上钻杆长6.20米\r\n粗径钻具全长4.26米，钻具总长103.14米 ','设备事故均为起小钻拉不动。','','2:20','','12:00','','29','29','','','1'),(63,8,'2014-03-29','15:00:00','03:00:00','18','63','吴富国','4.18','4.13','3:00','4:40',NULL,'2014-05-21 22:33:07','2014-05-21 22:33:07',NULL,98.24,102.42,'2个单根，长5.98米：①3.00② 2.98 ③      ④     ⑤     \r\n5个立根，长89.68米，机上钻杆长6.20米\r\n粗径钻具全长4.26米，钻具总长106.12米 ','','','','4:00','11:40','','29','29','','','1'),(64,8,'2014-03-30','03:00:00','15:00:00','18','30','徐智强','2.60','3.90','5:00','4:30',NULL,'2014-05-21 22:52:37','2014-05-21 22:52:37',NULL,102.42,106.4,'3个单根，长8.96米：①3.00② 2.98 ③2.98④     ⑤     \r\n5个立根，长89.68米，机上钻杆长6.20米\r\n粗径钻具全长4.26米，钻具总长109.10米 ','停待为等水。','','','2:30','12:00','','29','29','','','1'),(65,8,'2014-03-30','15:00:00','03:00:00','18','29','吉兆辉','9.42','8.90','9:00','26:20',NULL,'2014-05-21 23:36:07','2014-05-21 23:36:07',NULL,106.4,115.82,'1个单根，长2.98米：①2.98②  ③  ④     ⑤     \r\n6个立根，长107.58米，机上钻杆长6.20米\r\n粗径钻具全长4.26米，钻具总长121.02米 ','113.5-115.82岩石比较破碎。','','','','35:20','','63','29','','','1'),(66,8,'2014-03-31','03:00:00','15:00:00','18','63','吴富国','7.64','7.52','8:50','3:10',NULL,'2014-05-21 23:56:20','2014-05-21 23:56:20',NULL,115.82,123.46,'3个单根，长8.92米：①2.98②2.98③2.96④     ⑤     \r\n6个立根，长107.58米，机上钻杆长6.20米\r\n粗径钻具全长4.26米，钻具总长126.96米 ','115.82-118.30破碎','','','','12:00','','30','63','','','1'),(67,8,'2014-03-31','15:00:00','03:00:00','18','30','徐智强','3.27','3.23','2:30','9:00',NULL,'2014-05-22 00:08:43','2014-05-22 00:08:43',NULL,123.46,126.73,'4个单根，长11.89米：①2.98②2.98③2.96④2.97⑤     \r\n6个立根，长107.58米，机上钻杆长6.20米\r\n粗径钻具全长4.26米，钻具总长126.96米 ','','','','','11:30','','29','30','','','1'),(68,8,'2014-04-01','03:00:00','15:00:00','18','29','吉兆辉','0.00','0.00','','12:00',NULL,'2014-05-22 00:12:11','2014-05-22 00:12:11',NULL,126.73,126.73,'4个单根，长11.89米：①2.98②2.98③2.96④2.97⑤     \r\n6个立根，长107.58米，机上钻杆长6.20米\r\n粗径钻具全长4.26米，钻具总长126.96米 ','','','','','12:00','','29','29','','','1'),(69,8,'2014-04-01','15:00:00','03:00:00','18','63','吴富国','0.00','0.00','','12:00',NULL,'2014-05-22 00:14:25','2014-05-22 00:14:25',NULL,126.73,126.73,'4个单根，长11.89米：①2.98②2.98③2.96④2.97⑤     \r\n6个立根，长107.58米，机上钻杆长6.20米\r\n粗径钻具全长4.26米，钻具总长126.96米 ','','','','','12:00','','29','29','','','1'),(70,8,'2014-04-02','03:00:00','15:00:00','18','30','徐智强','0.50','0.47','0:30','11:30',NULL,'2014-05-22 00:22:37','2014-05-22 00:22:37',NULL,126.73,126.73,'4个单根，长11.89米：①2.98②2.98③2.96④2.97⑤     \r\n6个立根，长107.58米，机上钻杆长6.20米\r\n粗径钻具全长4.26米，钻具总长129.93米 ','','','','','12:00','','29','30','','','1'),(71,8,'2014-04-04','15:00:00','03:00:00','18','63','吴富国','0.00','0.00','','12:00',NULL,'2014-05-22 00:26:16','2014-05-22 00:26:16',NULL,127.23,127.23,'4个单根，长11.89米：①2.98②2.98③2.96④2.97⑤     \r\n6个立根，长107.58米，机上钻杆长6.20米\r\n粗径钻具全长4.26米，钻具总长129.93米 ','','','','','12:00','','30','63','','','1'),(72,8,'2014-04-05','03:00:00','15:00:00','18','30','徐智强','0.00','0.00','','12:00',NULL,'2014-05-22 00:28:51','2014-05-22 00:28:51',NULL,127.23,127.23,'4个单根，长11.89米：①2.98②2.98③2.96④2.97⑤     \r\n6个立根，长107.58米，机上钻杆长6.20米\r\n粗径钻具全长4.26米，钻具总长129.93米 ','','','','12:00','12:00','','29','29','','','1'),(73,8,'2014-04-05','15:00:00','03:00:00','18','29','吉兆辉','0.00','0.00','','12:00',NULL,'2014-05-22 00:30:52','2014-05-22 00:30:52',NULL,127.23,127.23,'4个单根，长11.89米：①2.98②2.98③2.96④2.97⑤     \r\n6个立根，长107.58米，机上钻杆长6.20米\r\n粗径钻具全长4.26米，钻具总长129.93米 ','','','','','12:00','','63','29','','','1'),(74,8,'2014-04-07','15:00:00','03:00:00','18','63','吴富国','0.00','0.00','','12:00',NULL,'2014-05-22 00:32:27','2014-05-22 00:32:27',NULL,127.23,127.23,'4个单根，长11.89米：①2.98②2.98③2.96④2.97⑤     \r\n6个立根，长107.58米，机上钻杆长6.20米\r\n粗径钻具全长4.26米，钻具总长129.93米 ','','','','','12:00','','29','29','','','1'),(75,8,'2014-04-08','03:00:00','15:00:00','18','30','徐智强','2.90','2.85','1:50','7:30',NULL,'2014-05-22 00:43:41','2014-05-22 00:43:41',NULL,127.23,130.13,'5个单根，长14.89米：①2.98②2.98③2.96④2.97⑤ 3.00    \r\n6个立根，长107.58米，机上钻杆长6.20米\r\n粗径钻具全长4.26米，钻具总长132.93米 ','','','','2:40','12:00','','29','29','','','1'),(76,8,'2014-04-08','15:00:00','03:00:00','18','29','吉兆辉','6.05','5.97','5:40','5:30',NULL,'2014-05-22 09:16:17','2014-05-22 09:16:17',NULL,130.13,136.18,'1个单根，长2.98米：①2.98②③④⑤   \r\n7个立根，长125.44米，机上钻杆长6.20米\r\n粗径钻具全长4.26米，钻具总长138.88米 ','','','','','11:10','','29','29','','','1'),(77,8,'2014-04-09','03:00:00','15:00:00','18','63','吴富国','7.65','7.55','7:30','4:30',NULL,'2014-05-22 09:32:52','2014-05-22 09:32:52',NULL,136.18,143.83,'4个单根，长11.93米：①2.98②2.98③2.98④2.99⑤   \r\n7个立根，长125.44米，机上钻杆长6.20米\r\n粗径钻具全长4.26米，钻具总长147.83米 ','','','','','12:00','','30','63','','','1'),(78,8,'2014-04-09','15:00:00','03:00:00','18','30','徐智强','151.79','7.85','8:30','2:50',NULL,'2014-05-22 09:49:19','2014-05-22 09:49:19',NULL,143.83,151.79,'1个单根，长2.99米：①2.99②③④⑤   \r\n8个立根，长143.33米，机上钻杆长6.20米\r\n粗径钻具全长4.26米，钻具总长156.78米 ','','','','','11:20','','29','30','','','1'),(79,8,'2014-04-10','03:00:00','15:00:00','18','29','吉兆辉','6.76','6.62','7:00','3:00',NULL,'2014-05-22 10:00:01','2014-05-22 10:00:01',NULL,151.79,158.55,'3个单根，长8.96米：①2.99②2.98③2.99④⑤   \r\n8个立根，长143.33米，机上钻杆长6.20米\r\n粗径钻具全长4.26米，钻具总长162.75米 ','','','','2:00','12:00','','63','29','','','1'),(80,8,'2014-04-10','15:00:00','03:00:00','18','63','吴富国','9.08','8.98','7:30','4:10',NULL,'2014-05-22 10:14:37','2014-05-22 10:14:37',NULL,158.55,167.63,'3个单根，长8.96米：①2.99②2.98③2.99④⑤   \r\n8个立根，长143.33米，机上钻杆长6.20米\r\n粗径钻具全长4.26米，钻具总长162.75米 ','','','','','11:40','','30','63','','','1'),(81,8,'2014-04-11','03:00:00','15:00:00','18','30','徐智强','4.97','4.84','5:00','7:00',NULL,'2014-05-22 10:31:41','2014-05-22 10:31:41',NULL,167.63,172.6,'2个单根，长5.97米：①3.00②2.97③④⑤   \r\n9个立根，长161.27米，机上钻杆长6.20米\r\n粗径钻具全长4.26米，钻具总长177.70米 ','辅助为起大钻换钻头 换扩孔器。','','','','12:00','','29','30','','','1'),(82,8,'2014-04-12','15:00:00','03:00:00','18','29','吉兆辉','0.00','0.00','','12:00',NULL,'2014-05-22 10:36:18','2014-05-22 10:36:18',NULL,172.6,172.6,'2个单根，长5.97米：①3.00②2.97③④⑤   \r\n9个立根，长161.27米，机上钻杆长6.20米\r\n粗径钻具全长4.26米，钻具总长177.70米 ','下钻，扫孔，冲孔。','','','','12:00','','63','29','','','1'),(83,8,'2014-04-12','03:00:00','15:00:00','18','63','吴富国','5.38','5.32','3:50','2:20',NULL,'2014-05-22 10:45:41','2014-05-22 10:45:41',NULL,172.6,177.98,'3个单根，长8.97米：①3.00②2.97③2.97④⑤   \r\n9个立根，长161.27米，机上钻杆长6.20米\r\n粗径钻具全长4.26米，钻具总长180.68米 ','','','','5:50','12:00','','30','63','','','1'),(84,8,'2014-04-12','15:00:00','03:00:00','18','30','徐智强','5.46','5.33','7:40','3:40',NULL,'2014-05-22 10:59:11','2014-05-22 10:59:11',NULL,177.98,183.44,'5个单根，长14.91米：①3.00②2.97③2.98④2.98⑤2.98   \r\n9个立根，长161.27米，机上钻杆长6.20米\r\n粗径钻具全长4.26米，钻具总长186.64米 ','','','','1:30','11:20','','29','30','','','1'),(85,8,'2014-04-13','03:00:00','15:00:00','18','29','吉兆辉','8.95','8.88','7:40','4:20',NULL,'2014-05-22 11:49:49','2014-05-22 11:49:49',NULL,183.44,192.39,'2个单根，长5.97米：①3.00②2.97③④⑤   \r\n10个立根，长179.16米，机上钻杆长6.20米\r\n粗径钻具全长4.26米，钻具总长195.59米 ','','','','','12:00','','63','29','','','1'),(86,8,'2014-04-13','15:00:00','03:00:00','18','63','吴富国','5.47','5.37','4:10','7:20',NULL,'2014-05-22 11:58:41','2014-05-22 11:58:41',NULL,192.39,197.86,'4个单根，长11.94米：①3.00②2.97③2.98④2.99⑤   \r\n10个立根，长179.16米，机上钻杆长6.20米\r\n粗径钻具全长4.26米，钻具总长201.56米 ','辅助为起大钻，排浆 清理泥浆池。','','','','11:30','','30','63','','','1'),(87,8,'2014-04-14','03:00:00','15:00:00','18','30','徐智强','0.00','0.00','','12:00',NULL,'2014-05-22 12:01:57','2014-05-22 12:01:57',NULL,197.86,197.86,'4个单根，长11.94米：①3.00②2.97③2.98④2.99⑤   \r\n10个立根，长179.16米，机上钻杆长6.20米\r\n粗径钻具全长4.26米，钻具总长201.56米 ','本班的工作为，搅泥浆，配150钻具2.55导向0.3，扩孔。','','','','12:00','','29','30','','','1'),(88,8,'2014-04-14','15:00:00','03:00:00','18','29','吉兆辉','0.00','0.00','','12:00',NULL,'2014-05-22 12:04:44','2014-05-22 12:04:44',NULL,197.86,197.86,'4个单根，长11.94米：①3.00②2.97③2.98④2.99⑤   \r\n10个立根，长179.16米，机上钻杆长6.20米\r\n粗径钻具全长4.26米，钻具总长201.56米 ','本班继续扫孔， 下150套管，配钻具换上扩孔器，下大钻，扫孔。','','','','12:00','','63','29','','','1'),(89,8,'2014-04-15','03:00:00','15:00:00','18','63','吴富国','1.00','0.98','1:00','11:00',NULL,'2014-05-22 12:09:50','2014-05-22 12:09:50',NULL,197.86,198.86,'4个单根，长11.94米：①3.00②2.97③2.98④2.99⑤   \r\n10个立根，长179.16米，机上钻杆长6.20米\r\n粗径钻具全长4.26米，钻具总长201.56米 ','','','','','12:00','','30','63','','','1'),(90,8,'2014-04-15','15:00:00','03:00:00','18','30','徐智强','7.85','7.62','5:50','4:00',NULL,'2014-05-22 12:53:05','2014-05-22 12:53:05',NULL,198.86,206.71,'1个单根，长2.98米：①2.98②③④⑤   \r\n11个立根，长197.07米，机上钻杆长6.20米\r\n粗径钻具全长4.26米，钻具总长210.51米 ','200米测斜，顶角1.10°。校正孔深误差+0.01','','','1:50','11:40','','29','30','','','1'),(91,8,'2014-04-16','03:00:00','15:00:00','18','29','吉兆辉','7.06','6.99','6:30','3:50',NULL,'2014-05-22 13:24:11','2014-05-22 13:24:11',NULL,206.71,213.77,'4个单根，长11.94米：①2.98②2.98③2.98④3.00⑤   \r\n11个立根，长197.07米，机上钻杆长6.20米\r\n粗径钻具全长4.26米，钻具总长219.47米 ','','','0:20','1:20','12:00','','63','29','','','1'),(92,8,'2014-04-16','15:00:00','03:00:00','18','63','吴富国','2.70','2.69','','11:50',NULL,'2014-05-22 13:39:46','2014-05-22 13:39:46',NULL,213.77,216.47,'4个单根，长11.94米：①2.98②2.98③2.98④3.00⑤   \r\n11个立根，长197.07米，机上钻杆长6.20米\r\n粗径钻具全长4.26米，钻具总长219.47米 ','','','','','11:50','','30','63','','','1'),(93,8,'2014-04-17','03:00:00','15:00:00','18','30','徐智强','8.06','8.00','6:00','6:00',NULL,'2014-05-22 13:50:49','2014-05-22 13:50:49',NULL,216.47,224.53,'1个单根，长2.98米：①2.98②③④⑤   \r\n12个立根，长214.99米，机上钻杆长6.20米\r\n粗径钻具全长4.26米，钻具总长228.43米 ','','','','','12:00','','29','30','','','1'),(94,8,'2014-04-17','15:00:00','03:00:00','18','29','吉兆辉','10.13','10.10','8:20','3:10',NULL,'2014-05-22 14:00:53','2014-05-22 14:00:53',NULL,224.53,234.66,'4个单根，长11.91米：①2.98②2.98③2.98④2.97⑤   \r\n12个立根，长214.99米，机上钻杆长6.20米\r\n粗径钻具全长4.26米，钻具总长237.36米 ','','','','','11:30','','63','29','','','1'),(95,8,'2014-04-18','03:00:00','15:00:00','18','63','吴富国','6.57','6.45','7:10','4:50',NULL,'2014-05-22 14:48:50','2014-05-22 14:48:50',NULL,234.66,241.23,'1个单根，长2.99米：①2.99②③④⑤   \r\n13个立根，长232.88米，机上钻杆长6.20米\r\n粗径钻具全长4.26米，钻具总长246.33米 ','','','','','12:00','','29','29','','','1'),(96,8,'2014-04-18','15:00:00','03:00:00','18','30','徐智强','4.88','4.85','3:50','7:30',NULL,'2014-05-22 14:55:01','2014-05-22 14:55:01',NULL,241.23,246.11,'2个单根，长5.97米：①2.99②2.98③④⑤   \r\n13个立根，长232.88米，机上钻杆长6.20米\r\n粗径钻具全长4.26米，钻具总长249.31米 ','','','','','11:20','','29','30','','','1'),(97,8,'2014-04-19','03:00:00','15:00:00','18','29','吉兆辉','7.89','7.80','7:00','5:00',NULL,'2014-05-23 09:11:18','2014-05-23 09:11:18',NULL,246.11,254,'5个单根，长15.06米：①2.99②2.98③2.98④3.13⑤2.98   \r\n13个立根，长232.88米，机上钻杆长6.20米\r\n粗径钻具全长4.26米，钻具总长258.40米 ','','','','','12:00','','63','29','','','1'),(98,8,'2014-04-19','15:00:00','03:00:00','18','63','吴富国','7.68','7.62','5:00','1:20',NULL,'2014-05-23 09:20:51','2014-05-23 09:20:51',NULL,254,261.68,'1个单根，长2.99米：①2.99②③④⑤\r\n14个立根，长250.93米，机上钻杆长6.20米\r\n粗径钻具全长4.26米，钻具总长264.38米 ','','','','5:00','11:20','','29','29','','','1'),(99,8,'2014-04-20','03:00:00','15:00:00','18','30','徐智强','9.05','8.93','9:00','3:00',NULL,'2014-05-23 09:31:35','2014-05-23 09:31:35',NULL,261.68,270.73,'5个单根，长13.04米：①2.99②2.98③2.97④2.98⑤1.12\r\n14个立根，长250.93米，机上钻杆长6.20米\r\n粗径钻具全长4.26米，钻具总长264.38米 ','','','','','12:00','','29','30','','','1'),(100,8,'2014-04-20','15:00:00','03:00:00','18','29','吉兆辉','8.34','5.81','7:50','3:00',NULL,'2014-05-23 09:41:12','2014-05-23 09:41:12',NULL,270.73,279.07,'1个单根，长2.98米：①②③④⑤\r\n15个立根，长268.83米，机上钻杆长6.20米\r\n粗径钻具全长4.26米，钻具总长282.27米 ','','','0:30','','11:20','','63','29','','','1'),(101,8,'2014-04-21','03:00:00','15:00:00','18','63','吴富国','9.73','12.11','4:10','6:20',NULL,'2014-05-23 09:55:13','2014-05-23 09:55:13',NULL,279.07,288.8,'5个单根，长14.91米：①2.98②2.98③2.99④2.98⑤2.98\r\n15个立根，长268.83米，机上钻杆长6.20米\r\n粗径钻具全长4.26米，钻具总长282.27米 ','','','','1:30','12:00','','29','29','','','1'),(102,8,'2014-04-21','15:00:00','03:00:00','18','30','徐智强','7.85','7.72','5:40','5:50',NULL,'2014-05-23 10:08:36','2014-05-23 10:08:36',NULL,288.8,296.65,'1个单根，长2.98米：①2.98②③④⑤\r\n16个立根，长286.71米，机上钻杆长6.20米\r\n粗径钻具全长4.26米，钻具总长300.15米 ','','','','','11:30','','29','29','','','1'),(103,8,'2014-04-22','03:00:00','15:00:00','18','29','吉兆辉','6.49','6.25','4:40','7:20',NULL,'2014-05-23 10:26:45','2014-05-23 10:26:45',NULL,296.65,303.14,'3个单根，长8.97米：①2.98②3.00③2.99④⑤\r\n16个立根，长286.71米，机上钻杆长6.20米\r\n粗径钻具全长4.26米，钻具总长306.14米 ','本班校正孔深，误差+0.02m','','','','12:00','','63','29','','','1'),(104,8,'2014-04-22','15:00:00','03:00:00','18','63','吴富国','8.94','8.90','4:30','7:00',NULL,'2014-05-23 10:55:15','2014-05-23 10:55:15',NULL,303.14,312.08,'    个单根，长   米：①②③④⑤\r\n17个立根，长304.62米，机上钻杆长6.20米\r\n粗径钻具全长4.26米，钻具总长315.08米 ','','','','','11:30','','29','29','','','1'),(105,8,'2014-04-23','03:00:00','15:00:00','18','30','徐智强','7.19','7.10','5:10','2:50',NULL,'2014-05-23 12:07:21','2014-05-23 12:07:21',NULL,312.08,319.27,'3个单根，长7.09米：①2.99②2.98③1.12④⑤\r\n17个立根，长304.62米，机上钻杆长6.20米\r\n粗径钻具全长4.26米，钻具总长322.17米 ','其它为起大钻，换潜孔锤钻具，下大钻，扫孔。','','','4:00','12:00','','29','30','','','1'),(106,8,'2014-04-23','15:00:00','03:00:00','18','29','吉兆辉','0.78','0.00','1:10','5:00',NULL,'2014-05-23 12:13:00','2014-05-23 12:13:00',NULL,319.27,320.05,'3个单根，长8.97米：①2.99②2.98③3.00④⑤\r\n17个立根，长304.62米，机上钻杆长6.20米\r\n粗径钻具全长4.26米，钻具总长324.05米 ','其它为试验潜孔锤。','','','5:50','12:00','','29','29','','','1'),(107,8,'2014-04-24','03:00:00','15:00:00','18','63','吴富国','10.17','10.07','6:30','4:10',NULL,'2014-05-23 12:28:08','2014-05-23 12:28:08',NULL,320.05,330.22,'  个单根，长  米：①②③④⑤\r\n18个立根，长322.46米，机上钻杆长6.20米\r\n粗径钻具全长4.26米，钻具总长332.92米 ','','','','1:20','12:00','','30','63','','','1'),(108,8,'2014-04-24','15:00:00','03:00:00','18','30','徐智强','4.52','4.47','2:30','9:30',NULL,'2014-05-23 12:39:15','2014-05-23 12:39:15',NULL,330.22,334.74,'1个单根，长2.98米：①2.98②③④⑤\r\n18个立根，长322.46米，机上钻杆长6.20米\r\n粗径钻具全长5.80米，钻具总长337.44米 ','辅助为起大钻，换潜孔锤钻具+5.80-4.26，下大钻。','','','','12:00','','29','30','','','1'),(109,8,'2014-04-25','03:00:00','15:00:00','18','29','吉兆辉','7.43','7.39','6:20','5:40',NULL,'2014-05-23 12:50:42','2014-05-23 12:50:42',NULL,334.74,342.17,'4个单根，长11.95米：①2.98②3.01③2.99④2.97⑤\r\n18个立根，长322.46米，机上钻杆长6.20米\r\n粗径钻具全长5.80米，钻具总长344.87米 ','','','','','12:00','','63','29','','','1'),(110,8,'2014-04-25','15:00:00','03:00:00','18','63','吴富国','11.92','11.83','6:00','5:50',NULL,'2014-05-23 13:08:04','2014-05-23 13:08:04',NULL,342.17,354.09,'2个单根，长5,97米：①2.99②2.98③④⑤\r\n19个立根，长340.36米，机上钻杆长6.20米\r\n粗径钻具全长4.26米，钻具总长356.79米 ','','','','','11:50','','30','63','','','1'),(111,8,'2014-04-26','03:00:00','15:00:00','18','30','徐智强','8.64','8.60','5:40','2:20',NULL,'2014-05-23 13:25:55','2014-05-23 13:25:55',NULL,354.09,362.73,'个单根，长米：①②③④⑤\r\n20个立根，长358.25米，机上钻杆长6.20米\r\n粗径钻具全长4.26米，钻具总长368.71米 ','电流60—80A','','','4:00','12:00','','29','30','','','1'),(112,8,'2014-04-26','15:00:00','03:00:00','18','29','吉兆辉','1.18','1.18','1:50','10:10',NULL,'2014-05-23 13:31:36','2014-05-23 13:31:36',NULL,362.73,363.91,'个单根，长米：①②③④⑤\r\n20个立根，长358.25米，机上钻杆长6.20米\r\n粗径钻具全长4.26米，钻具总长368.71米 ','电流100A。','','','','12:00','','63','29','','','1'),(113,8,'2014-04-27','03:00:00','15:00:00','18','63','吴富国','17.05','16.90','7:30','4:30',NULL,'2014-05-23 13:52:45','2014-05-23 13:52:45',NULL,363.91,380.96,'5个单根，长14.95米：①3.01②2.99③2.98④2.98⑤2.99\r\n20个立根，长358.25米，机上钻杆长6.20米\r\n粗径钻具全长4.26米，钻具总长383.66米 ','','','','','12:00','','30','63','','','1'),(114,8,'2014-04-27','15:00:00','03:00:00','18','30','徐智强','10.32','10.26','5:50','5:30',NULL,'2014-05-23 14:07:24','2014-05-23 14:07:24',NULL,380.96,391.28,'3个单根，长8.93米：①2.99②2.96③2.98④⑤\r\n21个立根，长376.19米，机上钻杆长6.20米\r\n粗径钻具全长4.26米，钻具总长395.58米 ','电压340V，电流90A.','','','','11:20','','29','29','','','1'),(115,8,'2014-04-28','03:00:00','15:00:00','18','29','吉兆辉','4.81','4.75','3:00','8:00',NULL,'2014-05-23 14:28:17','2014-05-23 14:28:17',NULL,391.28,396.09,'5个单根，长14.89米：①2.99②2.96③2.98④2.98⑤2.98\r\n21个立根，长376.19米，机上钻杆长6.20米\r\n粗径钻具全长4.26米，钻具总长401.54米 ','在391.28米处校正孔深，误差+0.02米。','','','1:00','12:00','','63','29','','','1'),(116,8,'2014-04-28','15:00:00','03:00:00','18','63','吴富国','0.00','0.00','','12:00',NULL,'2014-05-23 14:30:32','2014-05-23 14:30:32',NULL,396.09,396.09,'5个单根，长14.89米：①2.99②2.96③2.98④2.98⑤2.98\r\n21个立根，长376.19米，机上钻杆长6.20米\r\n粗径钻具全长4.26米，钻具总长401.54米 ','修钻机。','','','12:00','12:00','','30','63','','','1'),(117,8,'2014-04-30','07:00:00','15:00:00','18','63','吴富国','','','','8:00',NULL,'2014-05-23 14:32:43','2014-05-23 14:32:43',NULL,396.09,396.09,'5个单根，长14.89米：①2.99②2.96③2.98④2.98⑤2.98\r\n21个立根，长376.19米，机上钻杆长6.20米\r\n粗径钻具全长4.26米，钻具总长401.54米 ','修钻机，搅泥浆，扫孔。','','','','8:00','','29','29','','','1'),(118,8,'2014-04-30','15:00:00','03:00:00','18','30','徐智强','14.58','14.51','6:30','4:50',NULL,'2014-05-23 14:49:39','2014-05-23 14:49:39',NULL,396.09,410.67,'3个单根，长8.94米：①2.97②2.99③2.98④⑤\r\n21个立根，长394.07米，机上钻杆长6.20米\r\n粗径钻具全长4.26米，钻具总长413.47米 ','电压330V，电流60--80A','','','','11:20','','29','30','','','1'),(119,8,'2014-05-01','03:00:00','15:00:00','18','29','吉兆辉','2.21','2.21','1:00','2:40',NULL,'2014-05-23 14:59:33','2014-05-23 14:59:33',NULL,410.67,412.88,'4个单根，长11.95米：①2.97②2.99③2.98④3.01⑤\r\n22个立根，长394.07米，机上钻杆长6.20米\r\n粗径钻具全长4.26米，钻具总长416.48米 ','电压330V,电流80A.  411.38米处漏水。','','','8:20','12:00','','29','29','','','1'),(120,8,'2014-05-01','15:00:00','03:00:00','18','63','吴富国','5.25','5.16','4:40','6:50',NULL,'2014-05-23 15:19:01','2014-05-23 15:19:01',NULL,412.88,418.13,' 个单根，长 米：①②③④⑤\r\n23个立根，长411.97米，机上钻杆长6.20米\r\n粗径钻具全长4.26米，钻具总长422.43米 ','','','','','11:30','','30','63','','','1'),(121,8,'2014-05-02','03:00:00','15:00:00','18','30','吉兆辉','10.28','10.21','4:50','4:40',NULL,'2014-05-23 15:47:44','2014-05-23 15:47:44',NULL,418.13,428.41,'3个单根，长9.08米：①3.01②2.97③3.1④⑤\r\n23个立根，长411.97米，机上钻杆长6.20米\r\n粗径钻具全长4.26米，钻具总长431.51米 ','','','','2:30','12:00','','29','29','','','1'),(122,8,'2014-05-02','15:00:00','03:00:00','18','29','吉兆辉','0.58','0.58','0:30','10:50',NULL,'2014-05-23 15:53:19','2014-05-23 15:53:19',NULL,428.41,428.99,'4个单根，长9.08米：①3.01②2.97③3.1④2.98⑤\r\n23个立根，长411.97米，机上钻杆长6.20米\r\n粗径钻具全长4.26米，钻具总长434.49米 ','','','','','11:20','','63','29','','','1'),(123,8,'2014-05-04','03:00:00','15:00:00','18','29','吉兆辉','0.30','0.30','0:20','0:30',NULL,'2014-05-23 15:59:22','2014-05-23 15:59:22',NULL,428.99,429.29,'4个单根，长9.08米：①3.01②2.97③3.1④2.98⑤\r\n23个立根，长411.97米，机上钻杆长6.20米\r\n粗径钻具全长4.26米，钻具总长434.49米 ','','','','9:30','10:20','','63','29','','','1'),(124,8,'2014-05-04','15:00:00','03:00:00','18','63','吴富国','1.90','1.72','1:50','9:30',NULL,'2014-05-23 16:05:00','2014-05-23 16:05:00',NULL,429.29,431.19,'4个单根，长9.08米：①3.01②2.97③3.1④2.98⑤\r\n23个立根，长411.97米，机上钻杆长6.20米\r\n粗径钻具全长4.26米，钻具总长434.49米 ','430米处漏水。电压340V-350V,电流40A','','','','11:20','','30','63','','','1'),(125,8,'2014-05-05','03:00:00','15:00:00','18','30','徐智强','4.77','4.68','3:00','7:00',NULL,'2014-05-23 16:13:00','2014-05-23 16:13:00',NULL,431.19,435.96,'个单根，长米：①②③④⑤\r\n24个立根，长430米，机上钻杆长6.20米\r\n粗径钻具全长4.26米，钻具总长440.46米 ','','','','2:00','12:00','','29','30','','','1'),(126,8,'2014-05-05','15:00:00','03:00:00','18','29','吉兆辉','0.00','0.00','','6:00',NULL,'2014-05-23 16:14:42','2014-05-23 16:14:42',NULL,435.96,435.96,'个单根，长米：①②③④⑤\r\n24个立根，长430米，机上钻杆长6.20米\r\n粗径钻具全长4.26米，钻具总长440.46米 ','','','','6:00','12:00','','63','29','','','1'),(127,8,'2013-11-14','08:00:00','15:00:00','18','29','段世林','5.55','2.15','3:22','3:38',NULL,'2014-05-08 09:29:53','2014-05-08 09:29:53',NULL,0,5.55,' 个单根，长 米：①      ②      ③     ④     ⑤     \r\n 个立根，长 米，机上钻杆长6.00米\r\n粗径钻具全长2.25米，钻具总长8.25米 ','11月14日下午5：00点至11月16日早8:00点封孔','','','','7:00','','29','29','','','1'),(128,8,'2013-11-16','08:00:00','15:00:00','18','30','徐志强','2.67','2.05','2:10','4:50',NULL,'2014-05-09 14:58:05','2014-05-09 14:58:05',NULL,5.55,8.22,' 个单根，长 米：①      ②      ③     ④     ⑤     \r\n 个立根，长 米，机上钻杆长6.00米\r\n粗径钻具全长5.22米，钻具总长11.22米 ','','','','0:40','7:00','','63','30','','','1'),(129,8,'2013-11-16','15:00:00','03:00:00','18','63','吴富国','1.05','0.80','2:00','1:00',NULL,'2014-05-09 15:14:32','2014-05-09 15:14:32',NULL,8.22,9.27,' 2个单根，长5.95米：①2.97②2.98 ③     ④     ⑤     \r\n 个立根，长 米，机上钻杆长6.00米\r\n粗径钻具全长2.02米，钻具总长13.97米 ','','0:00','','9:00','12:00','','29','63','','','1'),(130,12,'2014-06-13','00:00:00','00:00:00',NULL,NULL,NULL,'2',NULL,NULL,NULL,NULL,'2014-06-15 03:10:17','2014-06-15 03:10:17',NULL,1113,1115,NULL,NULL,NULL,NULL,NULL,NULL,'16',NULL,NULL,NULL,NULL,'1'),(131,12,'2014-06-14','00:00:00','00:00:00',NULL,NULL,NULL,'5',NULL,NULL,NULL,NULL,'2014-06-15 03:11:16','2014-06-15 03:11:16',NULL,1115,1120,NULL,NULL,NULL,NULL,NULL,NULL,'16',NULL,NULL,NULL,NULL,'1'),(132,12,'2014-06-15','00:00:00','00:00:00',NULL,NULL,NULL,'0',NULL,NULL,NULL,NULL,'2014-06-15 03:12:05','2014-06-15 03:12:05',NULL,1120,1120,NULL,NULL,NULL,NULL,NULL,NULL,'16',NULL,NULL,NULL,NULL,'1'),(133,12,'2014-06-15','00:00:00','00:00:00',NULL,NULL,NULL,'0',NULL,NULL,NULL,NULL,'2014-06-15 03:13:06','2014-06-15 03:13:06',NULL,1120,1120,NULL,NULL,NULL,NULL,NULL,NULL,'16',NULL,NULL,NULL,NULL,'1'),(134,13,'2014-06-15','00:00:00','00:00:00',NULL,NULL,NULL,'4',NULL,NULL,NULL,NULL,'2014-06-15 03:15:29','2014-06-15 03:15:29',NULL,442,446,NULL,NULL,NULL,NULL,NULL,NULL,'16',NULL,NULL,NULL,NULL,'1'),(135,16,'2014-06-15','00:00:00','00:00:00',NULL,NULL,NULL,'10',NULL,NULL,NULL,NULL,'2014-06-15 03:43:48','2014-06-15 03:43:48',NULL,815,825,NULL,NULL,NULL,NULL,NULL,NULL,'17',NULL,NULL,NULL,NULL,'1'),(136,16,'2014-06-15','00:00:00','00:00:00',NULL,NULL,'','10','0','23:59','00:00',NULL,'2014-06-15 03:48:23','2014-06-15 03:48:23',NULL,NULL,825,'','','00:00','00:00','00:00','23:59',NULL,NULL,NULL,'',NULL,'2'),(137,18,'2014-06-14','00:00:00','00:00:00',NULL,NULL,NULL,'12',NULL,NULL,NULL,NULL,'2014-06-15 03:50:28','2014-06-15 03:50:28',NULL,1099,1111,NULL,NULL,NULL,NULL,NULL,NULL,'17',NULL,NULL,NULL,NULL,'1'),(138,17,'2014-06-14','00:00:00','00:00:00',NULL,NULL,NULL,'8',NULL,NULL,NULL,NULL,'2014-06-15 03:51:18','2014-06-15 03:51:18',NULL,498,506,NULL,NULL,NULL,NULL,NULL,NULL,'17',NULL,NULL,NULL,NULL,'1'),(139,14,'2014-06-15','00:00:00','00:00:00',NULL,NULL,NULL,'20',NULL,NULL,NULL,NULL,'2014-06-15 04:10:23','2014-06-15 04:10:23',NULL,75,95,NULL,NULL,NULL,NULL,NULL,NULL,'16',NULL,NULL,NULL,NULL,'1'),(140,15,'2014-06-15','00:00:00','00:00:00',NULL,NULL,NULL,'12',NULL,NULL,NULL,NULL,'2014-06-15 04:11:04','2014-06-15 04:11:04',NULL,666,678,NULL,NULL,NULL,NULL,NULL,NULL,'16',NULL,NULL,NULL,NULL,'1'),(141,10,'2014-06-15','00:00:00','00:00:00',NULL,NULL,NULL,'6',NULL,NULL,NULL,NULL,'2014-06-15 04:11:30','2014-06-15 04:11:30',NULL,493,499,NULL,NULL,NULL,NULL,NULL,NULL,'16',NULL,NULL,NULL,NULL,'1'),(142,19,'2014-06-15','00:00:00','00:00:00',NULL,NULL,NULL,'20',NULL,NULL,NULL,NULL,'2014-06-15 04:22:19','2014-06-15 04:22:19',NULL,21,41,NULL,NULL,NULL,NULL,NULL,NULL,'16',NULL,NULL,NULL,NULL,'1'),(143,16,'2014-06-15','00:00:00','00:00:00',NULL,NULL,NULL,'25',NULL,NULL,NULL,NULL,'2014-06-15 06:27:02','2014-06-15 06:27:02',NULL,825,850,NULL,NULL,NULL,NULL,NULL,NULL,'17',NULL,NULL,NULL,NULL,'1'),(144,16,'2014-06-15','00:00:00','00:00:00',NULL,NULL,NULL,'10',NULL,NULL,NULL,NULL,'2014-06-15 06:28:17','2014-06-15 06:28:17',NULL,815,825,NULL,NULL,NULL,NULL,NULL,NULL,'17',NULL,NULL,NULL,NULL,'1');

/*Table structure for table `tourreportworkcontents` */

DROP TABLE IF EXISTS `tourreportworkcontents`;

CREATE TABLE `tourreportworkcontents` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `tourreport_id` int(11) DEFAULT NULL,
  `starttime` time DEFAULT NULL,
  `finishtime` time DEFAULT NULL,
  `workcontent` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `drillfootage` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `drillbit` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `rotatespeed` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `pumppressure` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `pumpquantity` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `coresamplelength` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

/*Data for the table `tourreportworkcontents` */

/*Table structure for table `transferrecords` */

DROP TABLE IF EXISTS `transferrecords`;

CREATE TABLE `transferrecords` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `devicenumber` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `devicetype` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `borrowdate` date DEFAULT NULL,
  `borrower` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `holenumber` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `return` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `returndate` date DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

/*Data for the table `transferrecords` */

/*Table structure for table `useroperations` */

DROP TABLE IF EXISTS `useroperations`;

CREATE TABLE `useroperations` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `useraccount` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `userid` decimal(10,0) DEFAULT NULL,
  `userip` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `operatetime` datetime DEFAULT NULL,
  `operatecontent` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `remark` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

/*Data for the table `useroperations` */

insert  into `useroperations`(`id`,`username`,`useraccount`,`userid`,`userip`,`operatetime`,`operatecontent`,`remark`,`created_at`,`updated_at`) values (1,'管理员','admin','1','172.20.98.107','2013-06-15 12:12:12','登陆系统',NULL,'2013-06-15 12:12:12','2013-06-15 12:12:12');

/*Table structure for table `users` */

DROP TABLE IF EXISTS `users`;

CREATE TABLE `users` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `sex` int(11) DEFAULT NULL,
  `birthday` date DEFAULT NULL,
  `duty` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `education` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `mobile` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `officephone` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `email` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `isappuser` tinyint(1) DEFAULT NULL,
  `department_id` int(11) DEFAULT NULL,
  `account` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `password_digest` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `leaderid` int(11) DEFAULT NULL,
  `position` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `index_users_on_account` (`account`),
  KEY `index_users_on_department_id` (`department_id`)
) ENGINE=InnoDB AUTO_INCREMENT=70 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

/*Data for the table `users` */

insert  into `users`(`id`,`name`,`sex`,`birthday`,`duty`,`education`,`mobile`,`officephone`,`email`,`isappuser`,`department_id`,`account`,`password_digest`,`created_at`,`updated_at`,`leaderid`,`position`) values (1,'系统管理员',1,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,'admin','$2a$10$MPF4NGYHcjm.2nujCRjUce1HlifoI9.qGJLPAA.hPNGhOTgKQCxeG','2013-06-13 14:03:44','2013-06-13 14:03:44',NULL,NULL),(2,'系统管理员',1,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,'admin1','$2a$10$RzzVc6ndZTPSOzCP8.UXY.GkMkasHhxiLHlDsHRfW3HisVXRAcuo2','2013-06-16 02:48:34','2013-06-16 02:48:34',NULL,NULL),(16,'王利峰',1,'1974-06-13','副经理','本科',NULL,NULL,NULL,1,6,'wanglifeng','$2a$10$B6e3g0joTAdpwq2m2C.PkOkk/mNd/okykpeUbPUbT8kSbXX2/XOi6','2014-03-16 11:43:29','2014-04-23 10:18:02',NULL,1),(17,'孔二伟',1,'1987-06-19','副经理','本科',NULL,NULL,NULL,1,6,'kongerwei','$2a$10$pQzZnhU6V5/fP0Q2tTtvguJ7KLbdb4ZOORS4QnAoK6upDVOMbZdqW','2014-03-16 11:44:16','2014-04-23 10:18:10',NULL,1),(18,'刘泽新',1,'1994-07-13','机长','本科',NULL,NULL,NULL,1,6,'liuzexin','$2a$10$3RgGxIbv2NszkowFgi8.5eBv/AqVq7M2HiN7LHR/6wbEXizgGCqz6','2014-03-16 11:45:16','2014-04-24 13:12:15',16,2),(19,'郭卫焦',1,'1994-07-16','机长','本科',NULL,NULL,NULL,1,6,'guoweijiao','$2a$10$ZLSLVZoRT9lpWSM3tTM.JewsEePaR2RIehiP1qa5Jzhi5ymFrRufq','2014-03-16 11:46:05','2014-06-15 00:27:35',NULL,2),(20,'谷新宽',1,'1974-07-19','机长','本科',NULL,NULL,NULL,1,6,'guxinkuan','$2a$10$JFDc.rLucV4/NkhriO8sRufUmgWnZCbBYV5pcXPVgfW3plJJ1s81m','2014-03-16 11:46:49','2014-04-24 13:12:15',16,2),(21,'段世林',1,'2010-02-03','技术员',NULL,NULL,NULL,NULL,1,6,'duanshilin','$2a$10$9xH1WhmnqnwN1NC6pdFVn.3WbuutNASnFWecAPjCrQi9uWNTQSMBu','2014-03-16 11:47:45','2014-03-16 11:47:45',NULL,NULL),(22,'杨宽才',1,'1983-12-21','分公司经理','本科',NULL,NULL,NULL,1,6,'yangkuancai','$2a$10$.24RXgaY5vrPh9h2/8cGOeq3v53s/BxxuU4asWgRd3klGx6xBhXty','2014-03-16 11:49:09','2014-03-16 14:06:25',NULL,NULL),(23,'宁赞格',1,'1967-08-18','分公司经理','本科',NULL,NULL,NULL,1,7,'ningzange','$2a$10$mQ2MRpS0hLvq.TCWaZZEeeEIlQvpzfp4aZK6PGHxbqBHX3AEs67Gm','2014-03-16 11:50:21','2014-03-16 14:11:01',NULL,NULL),(24,'许红升',1,'1972-06-23','分公司副经理','本科',NULL,NULL,NULL,1,7,'xuhongsheng','$2a$10$JrM9rC05PiD0Km1AG405TeVJnAAATU.67.Fr250/p/3P4q82QF3Hm','2014-03-16 11:51:26','2014-04-23 10:22:40',NULL,1),(25,'马德旺',1,'1964-07-25','分公司副经理','本科',NULL,NULL,NULL,1,7,'madewang','$2a$10$JkuCeEQxboGEtcycZ7LMiOaL2NuHeN348bU.Y.81ovNZ0K/tgo00C','2014-03-16 11:52:04','2014-04-23 10:22:55',NULL,1),(26,'李大鹏',1,'1984-06-12','技术员',NULL,NULL,NULL,NULL,1,7,'lidapeng','$2a$10$RnYT5rqcPwEycoXDl8O66.k/y4f.UjQva6E9Ul1EAryApUOCw3P5i','2014-03-16 11:52:29','2014-03-16 11:52:29',NULL,NULL),(27,'陈民超',1,'1980-08-15','机长','本科',NULL,NULL,NULL,1,7,'chenminchao','$2a$10$x6U7A8fAqgur77NBdNLI..AB722FnWxo9ppb.3EN3FE3omHsgrrVe','2014-03-16 11:53:13','2014-04-24 13:11:53',NULL,2),(28,'孟小六',1,'1979-10-18','机长','本科',NULL,NULL,NULL,1,7,'mengxiaoliu','$2a$10$4aUaXC7kgx9wM3Y.ky0gve3.ysxBq4Gyp60rUlbnTYyf5r1Qmt3Z2','2014-03-16 11:53:58','2014-04-24 13:11:59',NULL,2),(29,'张红军',1,NULL,'班长',NULL,NULL,NULL,NULL,0,6,NULL,'$2a$10$Y1xpWJJpe1Q0i1xgga.vbec5D689xAK7NkCrV38Fjft.OAOpkZIEO','2014-03-16 12:04:17','2014-03-16 15:08:09',18,3),(30,'张凌坤',1,NULL,'班长',NULL,NULL,NULL,NULL,0,6,NULL,'$2a$10$PCSgDiOv5bDYorFVkY8QiOmYfmIBwp.F4kP6VGoWnBxbvoysEua3u','2014-03-16 12:04:42','2014-03-16 15:08:09',18,3),(31,'席培阳',1,NULL,NULL,NULL,NULL,NULL,NULL,0,6,NULL,'$2a$10$n.5Lt1sO6WF4CmPxnOCxxOgvvMamUjYXxmJKU3upRsM3j5WKqy31K','2014-03-16 12:06:01','2014-03-16 15:08:25',20,3),(32,'王亚楠',1,NULL,NULL,NULL,NULL,NULL,NULL,0,6,NULL,'$2a$10$Ny0kV/JQFvCTgCbc/2P9vunZism38b/AqHLDtRD21GC4/M9mNwfzC','2014-03-16 12:06:20','2014-03-16 15:08:25',20,3),(33,'马书法',1,NULL,NULL,NULL,NULL,NULL,NULL,0,6,NULL,'$2a$10$B1lM2h./nQWOGwZCecXFmeZnYMwLUzh.WC5TEeyCyKgu4uZNCDUTa','2014-03-16 12:06:37','2014-03-16 15:08:25',20,3),(34,'黄国庆',1,NULL,NULL,NULL,NULL,NULL,NULL,0,6,NULL,'$2a$10$xGDaJzdxdpuNEG4HiF5Q2OryFb33U7qtXBMCHUEDp6JhShX9jMi/K','2014-03-16 12:06:56','2014-03-16 12:06:56',NULL,3),(35,'索战国',1,NULL,NULL,NULL,NULL,NULL,NULL,0,6,NULL,'$2a$10$9RSQPYD5vP/QXUHz0B7Wuu08npR0FwFCEA6prHdSgdNhDgF7FfTDm','2014-03-16 12:07:16','2014-06-15 00:28:09',19,3),(36,'陈世平',1,NULL,NULL,NULL,NULL,NULL,NULL,0,6,NULL,'$2a$10$xYjhn40gjAIzfK7fckgg5OqTd0I8PbQ48DI4zFuN6PfYoQ18aOSoi','2014-03-16 12:07:39','2014-06-15 00:28:09',19,3),(37,'许振军',1,NULL,NULL,NULL,NULL,NULL,NULL,0,7,NULL,'$2a$10$eeQcoioO7BJrsUAWGIW7M.B4DSojMYmkmEpW352jc1CLYlVuafCOm','2014-03-16 12:08:42','2014-03-16 12:08:42',NULL,3),(38,'敖行文',1,NULL,NULL,NULL,NULL,NULL,NULL,0,7,NULL,'$2a$10$PaByojR03oPbGty/p.oORuY/aKU1DMZUuHbCXc3WRO9ZvhiHbCvvm','2014-03-16 12:09:12','2014-06-15 02:58:11',28,3),(39,'张宏亮',1,NULL,NULL,NULL,NULL,NULL,NULL,0,7,NULL,'$2a$10$ll9ob7jzXC8Z/C2fbkBk/.gcHh/.OWDb92/Zv.9VqRRh4ne0T4L0a','2014-03-16 12:09:27','2014-06-15 02:58:11',28,3),(40,'吴同旭',1,NULL,NULL,NULL,NULL,NULL,NULL,0,7,NULL,'$2a$10$MuF9UWn.S4Ig/yRhWYhYG.UAGuWkQbFK0vRgbFWKdOBqbMQW81e1y','2014-03-16 12:09:51','2014-03-16 12:09:51',NULL,3),(41,'王超',1,NULL,NULL,NULL,NULL,NULL,NULL,0,7,NULL,'$2a$10$mTdf3tXcXAw91T4oL.9.YewQSQSBHH0UCfbCvxZE92Xx3Tgq5cnHy','2014-03-16 12:10:04','2014-06-15 02:58:11',28,3),(42,'刘玉生',1,NULL,NULL,'大专',NULL,NULL,NULL,0,7,NULL,'$2a$10$bTxavEfXaPvOZ9IHz5T79.bMXqWBVV4IMXM2NIW.KG6PQZqp5tMbq','2014-03-16 12:11:59','2014-06-15 03:04:08',28,3),(43,'谷天本',1,'1964-07-10','常务副总经理','博士',NULL,NULL,NULL,1,10,'gutianben','$2a$10$OLlWxLayrIH14CemyT5/Fef9Ygl4kwdhHS48a825rfZsRqLiwiAiq','2014-03-16 13:41:12','2014-03-16 14:20:34',NULL,NULL),(44,'王卢伟',1,'1978-06-13',NULL,'本科',NULL,NULL,NULL,1,11,'wangluwei','$2a$10$UQp3YCA2CMCrxJARTuNSuuGXIyQ/rdUwWC7xY/T4bt7rhU8gp7KSm','2014-03-16 14:13:35','2014-03-16 14:13:35',NULL,NULL),(45,'金光辉',1,'1974-07-25',NULL,'本科',NULL,NULL,NULL,1,11,'jinguanghui','$2a$10$.gBe2Tsv9DfuwdJn1bVzxOq2T1fVGpF7T5hzI0M8jJXyskDyxL93e','2014-03-16 14:14:23','2014-03-16 14:14:23',NULL,NULL),(46,'兰勇',1,'1970-06-03','总经理','硕士',NULL,NULL,NULL,1,10,'lanyong','$2a$10$7.asy36RBfkfQGyqYHTjFuSxUqKrNBNMlN3o2S.iELS6KPsVwjqQK','2014-03-16 14:17:27','2014-03-16 14:17:46',NULL,NULL),(47,'刘志国',1,'1965-07-15','董事长',NULL,NULL,NULL,NULL,1,10,'liuzhiguo','$2a$10$bWyTHstJLDlSUjWk8sdfMuVxKf5dwnm6xgGuzG6T8c06BQKduFKg6','2014-03-16 14:18:31','2014-03-16 14:18:31',NULL,NULL),(48,'刘国印',1,'1964-07-16','总工程师',NULL,NULL,NULL,NULL,1,10,'liuguoyin','$2a$10$sD6Cr.NWRRk6GwwgK1pwV.W1zJPp/d9bE77TFzaYYmbmzYJ.dTxxS','2014-03-16 14:19:13','2014-03-16 14:19:13',NULL,NULL),(49,'乔宁科',1,'1965-06-15','副总经理',NULL,NULL,NULL,NULL,1,10,'qiaoningke','$2a$10$5T0W1ZCKWgfAYT3RNBt6celh/mM57N8zBmeSEuYH6wLcNu7NkRuZ.','2014-03-16 14:20:19','2014-03-16 14:20:19',NULL,NULL),(50,'田敏',2,'1968-08-16','主任',NULL,NULL,NULL,NULL,1,13,'tianmin','$2a$10$oemCaFxzxLzyZ1.shBdhgeC4mh5TrPEZC1MPqySzdLq7H0.VPoCJq','2014-03-16 14:23:37','2014-03-16 14:26:46',NULL,NULL),(51,'曾石友',1,'1973-06-20','主任','本科','18039558518',NULL,NULL,1,13,'zengshiyou','$2a$10$/K8Q.VTjP9a0m5ctNubYnuf2l7nQJB.qfCRYFNbtaW0IuRcmXC9Ry','2014-03-16 14:27:46','2014-06-15 03:34:10',NULL,NULL),(52,'任朝阳',1,'1964-12-31','副主任','本科','13938105675',NULL,NULL,1,13,'renchaoyang','$2a$10$bzgut84PoInaZg7l/sh1l.S6u8VlVguhp8OKtUJSD1tnZB8D9JC7m','2014-03-16 14:30:31','2014-06-10 10:17:54',NULL,NULL),(53,'李金鹏',1,'1985-06-11','技术负责','本科',NULL,NULL,NULL,1,13,'lijinpeng','$2a$10$1rlugT.A5g9TCFW278I5IuDIklQcGoFyMspnV9IzgDCEAYRhUX/XC','2014-03-16 14:31:15','2014-03-16 14:31:15',NULL,NULL),(54,'梁丽',1,'1982-04-09','分公司经理',NULL,NULL,NULL,NULL,1,8,'liangli','$2a$10$J8jkW0ymddHpT8YGd58JFuo09.b9CRyD/ifJKsnZnpyr5yD5CK9ka','2014-03-16 14:32:53','2014-03-16 14:32:53',NULL,NULL),(55,'孟燕杰',1,'1982-10-28','分公司副经理','本科',NULL,NULL,NULL,1,8,'mengyanjie','$2a$10$Dfg3g7obmF4ZslOXqZ1wuez947hddirMxq7a5UShThfhdkwNop736','2014-03-16 14:34:04','2014-04-23 10:23:10',NULL,1),(56,'詹新明',1,'1972-07-04','分公司副经理','本科',NULL,NULL,NULL,1,8,'zhanxinming','$2a$10$XgbOg.aKqhuhhCrbeYyhCuZnW4lYsZcQN2GiAwtAyvPb5UV9TzzK2','2014-03-16 14:34:55','2014-04-23 10:23:21',NULL,1),(57,'张骏',1,'1990-11-28','技术员','本科',NULL,NULL,NULL,1,8,'zhangjun','$2a$10$Qhu2X5oWX7qUdqLTBDh4IOwEByVAuholOyzPtaQFie/380OQfCDlS','2014-03-16 14:36:03','2014-03-16 14:41:15',NULL,2),(58,'李金伟',1,'1972-11-30','机长',NULL,NULL,NULL,NULL,1,8,'lijinwei','$2a$10$eD4cmHs.ld/RQ/kH6dH50OwPojvmFNKZR31CPlWCmKSMYQF1OaXPu','2014-03-16 14:41:02','2014-03-16 14:41:02',NULL,2),(59,'贺政权',1,'1974-06-11','机长','本科',NULL,NULL,NULL,1,8,'hezhengquan','$2a$10$IzNnhm6U.CGJkpJ1smb.ieB.k4NSJ3gJA5zJ/KZcVskghm4JlIA0S','2014-03-16 14:42:13','2014-03-16 14:42:13',NULL,2),(60,'张付华',1,'1975-07-10','机长',NULL,NULL,NULL,NULL,1,8,'zhangfuhua','$2a$10$usGtwSn504WSb69xMrQXXuUl2bNQQdgq2Jg61AYFMFndjvDqHjcxy','2014-03-16 14:42:59','2014-03-16 14:42:59',NULL,2),(61,'孔存银',1,'1979-07-05','机长',NULL,NULL,NULL,NULL,1,8,'kongcunyin','$2a$10$/HlJrcQMMpxAqNd8AVm0zuy0j4L0tNSH.PTQK0F/.7/H862uk7soa','2014-03-16 14:44:05','2014-03-16 14:44:05',NULL,2),(62,'杨小三',1,'1974-06-14',NULL,'本科',NULL,NULL,NULL,1,8,'yangxiaosan','$2a$10$2dE860aLmQwu/U3b8PBqNO0RYu6KuflsVoCsYowu3h6QoZY55/Ckm','2014-03-16 14:44:43','2014-03-16 14:44:43',NULL,2),(63,'程朝辉',1,'1974-07-18','班长','本科',NULL,NULL,NULL,0,6,NULL,'$2a$10$2xEl7xEH7MaxUBkxwOFsM.s9AcICl7syPO.N3ay1E20CHUIubxbiS','2014-03-16 23:32:55','2014-03-16 23:33:13',18,3),(64,'张卢生',1,'1968-06-13',NULL,'本科',NULL,NULL,NULL,0,6,NULL,'$2a$10$JrpqQfvrEVDiAy7jCLa6x.ljoWFTpVcTGcxciYIGXwh2.z1X86j5O','2014-06-15 00:29:18','2014-06-15 00:29:33',19,3),(65,'何双慈',1,'1970-06-20',NULL,'大专',NULL,NULL,NULL,0,8,NULL,'$2a$10$87bR5y0z/zHVyDN1Ob07me4aWZiHNEsIhXlEmaLlNqM0CWbcWCy5S','2014-06-15 02:53:44','2014-06-15 02:53:44',NULL,3),(66,'闫煜琛',1,'1970-06-25',NULL,'大专',NULL,NULL,NULL,0,7,NULL,'$2a$10$avhd.j.hVYgHc8KKXLRymOP2vizTxh9904TQqLsHSVWVksG9iIhme','2014-06-15 02:55:38','2014-06-15 02:55:38',NULL,3),(67,'徐志强',1,'1970-06-28',NULL,'大专',NULL,NULL,NULL,0,6,NULL,'$2a$10$Q5lw7es9Eh1tttiwNfW61uRiwstau46ftdogCsA2Zr5XsTEIle9w2','2014-06-15 03:13:21','2014-06-15 03:13:55',19,3),(68,'郭卫齐',1,'1967-07-25',NULL,NULL,NULL,NULL,NULL,0,6,NULL,'$2a$10$5q1uBzAquXgKd4uoJjG/yuDEUk8YdRxsDFSDTk.ViU5CAvVRUT13a','2014-06-15 03:29:29','2014-06-15 03:29:29',NULL,3),(69,'吴富国',1,NULL,NULL,NULL,NULL,NULL,NULL,0,6,NULL,'$2a$10$Rz3WgDi.laChM053zr3A1.8cnoSD106iUUikhwv8pDhuiA.GJNbm6','2014-06-15 03:30:25','2014-06-15 03:30:25',NULL,3);

/*Table structure for table `workcontents` */

DROP TABLE IF EXISTS `workcontents`;

CREATE TABLE `workcontents` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `starttime` time DEFAULT NULL,
  `finishtime` time DEFAULT NULL,
  `content` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `drilllength` float DEFAULT NULL,
  `drillbit` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `rotatespeed` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `pumpquantity` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `pumppressure` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `corelength` float DEFAULT NULL,
  `coreleftlength` float DEFAULT NULL,
  `tourreportid` int(11) DEFAULT NULL,
  `holeid` int(11) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `upmore` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `corename` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `coregrade` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `corenumber` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `drillbittype` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `drillbitnumber` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `enlargertype` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `enlargernumber` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `holedeep` float DEFAULT NULL,
  `mudamount` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=186 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

/*Data for the table `workcontents` */

insert  into `workcontents`(`id`,`starttime`,`finishtime`,`content`,`drilllength`,`drillbit`,`rotatespeed`,`pumpquantity`,`pumppressure`,`corelength`,`coreleftlength`,`tourreportid`,`holeid`,`created_at`,`updated_at`,`upmore`,`corename`,`coregrade`,`corenumber`,`drillbittype`,`drillbitnumber`,`enlargertype`,`enlargernumber`,`holedeep`,`mudamount`) values (17,'07:02:00','08:02:00','下钻',NULL,NULL,NULL,NULL,NULL,NULL,NULL,15,3,'2013-09-12 13:04:03','2013-09-12 13:04:03',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(18,'08:02:00','08:20:00','钻进',10,'1','100','10','10',NULL,NULL,15,3,'2013-09-12 13:04:03','2013-09-12 13:04:03',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(19,'08:20:00','09:20:00','取心',NULL,NULL,NULL,NULL,NULL,4,0,15,3,'2013-09-12 13:04:03','2013-09-12 13:04:03',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(20,'09:20:00','09:30:00','起钻',NULL,NULL,NULL,NULL,NULL,NULL,NULL,15,3,'2013-09-12 13:04:03','2013-09-12 13:04:03',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(21,'12:54:00','12:54:00','下钻',NULL,NULL,NULL,NULL,NULL,NULL,NULL,16,3,'2013-09-14 05:02:57','2013-09-14 05:02:57',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(22,'12:54:00','12:54:00','钻进',20,'小钻头','100','10','10',NULL,NULL,16,3,'2013-09-14 05:02:57','2013-09-14 05:02:57',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(23,'12:54:00','12:54:00','取心',NULL,NULL,NULL,NULL,NULL,10,0,16,3,'2013-09-14 05:02:57','2013-09-14 05:02:57',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(24,'12:54:00','12:54:00','起钻',NULL,NULL,NULL,NULL,NULL,NULL,NULL,16,3,'2013-09-14 05:02:57','2013-09-14 05:02:57',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(25,'12:54:00','12:59:00','钻进',50,'小钻头','100','10','20',NULL,NULL,16,3,'2013-09-14 05:02:57','2013-09-14 05:02:57',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(26,'13:59:00','14:59:00','起钻',NULL,NULL,NULL,NULL,NULL,NULL,NULL,16,3,'2013-09-14 05:02:57','2013-09-14 05:02:57',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(27,'08:30:00','10:30:00','其他',NULL,'110','','','',NULL,NULL,17,5,'2014-03-16 09:27:15','2014-03-16 09:27:15','4.0',NULL,NULL,'','金刚石','','','',0,''),(28,'10:30:00','11:08:00','钻进',NULL,'','400','60','500',NULL,NULL,17,5,'2014-03-16 09:27:15','2014-03-16 09:27:15','',NULL,NULL,'','','','','',NULL,''),(29,'11:08:00','12:30:00','起钻、取心',0.8,'','','','',0.78,NULL,17,5,'2014-03-16 09:27:15','2014-03-16 09:27:15','3.2',NULL,NULL,'1-5','','','','',0.8,''),(30,'12:30:00','13:10:00','钻进',NULL,'','','','',NULL,NULL,17,5,'2014-03-16 09:27:15','2014-03-16 09:27:15','',NULL,NULL,'','','','','',NULL,''),(31,'13:10:00','13:30:00','起钻、取心',0.35,'','','','',0.32,NULL,17,5,'2014-03-16 09:27:15','2014-03-16 09:27:15','2.85',NULL,NULL,'2-2','','','','',1.15,''),(32,'13:30:00','14:30:00','钻进',NULL,'','','','',NULL,NULL,17,5,'2014-03-16 09:27:15','2014-03-16 09:27:15','',NULL,NULL,'','','','','',NULL,''),(33,'14:30:00','15:00:00','取心',0.7,'','','','',0.6,NULL,17,5,'2014-03-16 09:27:15','2014-03-16 09:27:15','2.15',NULL,NULL,'3-3','','','','',1.85,''),(34,'15:00:00','15:00:00','下钻',NULL,'','','','',NULL,NULL,17,5,'2014-03-16 09:27:15','2014-03-16 09:27:15','',NULL,NULL,'','','','','',NULL,''),(35,'15:00:00','15:10:00','其他',NULL,'','','','',NULL,NULL,18,5,'2014-03-16 09:39:33','2014-03-16 09:39:33','2.15',NULL,NULL,'','','','','',1.85,''),(36,'15:10:00','15:20:00','下钻',NULL,'','','','',NULL,NULL,18,5,'2014-03-16 09:39:33','2014-03-16 09:39:33','',NULL,NULL,'','','','','',NULL,''),(37,'15:20:00','15:45:00','钻进',NULL,'','','','',NULL,NULL,18,5,'2014-03-16 09:39:34','2014-03-16 09:39:34','',NULL,NULL,'','','','','',NULL,''),(38,'15:45:00','16:05:00','起钻、取心',0.65,'','','','',0.64,NULL,18,5,'2014-03-16 09:39:34','2014-03-16 09:39:34','1.5',NULL,NULL,'4-3','','','','',2.5,''),(39,'16:05:00','16:25:00','停待',NULL,'','','','',NULL,NULL,18,5,'2014-03-16 09:39:34','2014-03-16 09:39:34','',NULL,NULL,'','','','','',NULL,''),(40,'16:25:00','16:55:00','钻进',NULL,'','','','',NULL,NULL,18,5,'2014-03-16 09:39:34','2014-03-16 09:39:34','',NULL,NULL,'','','','','',NULL,''),(41,'16:55:00','17:15:00','起钻、取心',0.7,'','','','',0.65,NULL,18,5,'2014-03-16 09:39:34','2014-03-16 09:39:34','0.8',NULL,NULL,'5-3','','','','',3.2,''),(42,'17:15:00','17:40:00','钻进',NULL,'','','','',NULL,NULL,18,5,'2014-03-16 09:39:34','2014-03-16 09:39:34','1.25',NULL,NULL,'','','','','',NULL,''),(43,'17:40:00','18:10:00','起钻、取心',0.2,'','','','',0.18,NULL,18,5,'2014-03-16 09:39:34','2014-03-16 09:39:34','1.05',NULL,NULL,'6-1','','','','',3.4,''),(44,'18:10:00','02:40:00','停待',NULL,'','','','',NULL,NULL,18,5,'2014-03-16 09:39:34','2014-03-16 09:39:34','',NULL,NULL,'','','','','',NULL,''),(45,'02:40:00','03:00:00','其他',NULL,'','','','',NULL,NULL,18,5,'2014-03-16 09:39:34','2014-03-16 09:39:34','1.05',NULL,NULL,'','','','','',3.4,''),(46,'08:00:00','09:15:00','钻进',0,NULL,'0','0','0',0,NULL,19,NULL,'2014-03-16 10:48:19','2014-03-16 10:48:19','0',NULL,NULL,NULL,NULL,NULL,NULL,NULL,40,NULL),(47,'09:15:00','10:15:00','起下钻取心',0,NULL,'0','0','0',0.18,NULL,19,NULL,'2014-03-16 10:48:19','2014-03-16 10:48:19','1.05',NULL,NULL,NULL,NULL,NULL,NULL,NULL,3.4,NULL),(48,'10:15:00','11:15:00','钻进',0,NULL,'0','0','0',0,NULL,19,NULL,'2014-03-16 10:48:19','2014-03-16 10:48:19','0',NULL,NULL,NULL,NULL,NULL,NULL,NULL,3.4,NULL),(49,'11:15:00','12:15:00','起钻取心',1.4,NULL,'0','0','0',2.3,NULL,19,NULL,'2014-03-16 10:48:19','2014-03-16 10:48:19','0',NULL,NULL,NULL,NULL,NULL,NULL,NULL,4.8,NULL),(50,'00:00:00','01:00:00','取心',0,NULL,'0','0','0',2,NULL,20,NULL,'2014-03-16 10:55:13','2014-03-16 10:55:13','1.5',NULL,NULL,NULL,NULL,NULL,NULL,NULL,5,NULL),(51,'00:00:00','01:00:00','钻进',3,NULL,'3','3','3',0,NULL,21,NULL,'2014-03-16 10:55:44','2014-03-16 10:55:44','3',NULL,NULL,NULL,NULL,NULL,NULL,NULL,0.03,NULL),(52,'01:00:00','02:00:00','取心',0,NULL,'0','0','0',2,NULL,21,NULL,'2014-03-16 10:55:44','2014-03-16 10:55:44','2',NULL,NULL,NULL,NULL,NULL,NULL,NULL,0.032,NULL),(53,'02:00:00','03:00:00','钻进',4,NULL,'4','4','4',0,NULL,21,NULL,'2014-03-16 10:55:44','2014-03-16 10:55:44','4',NULL,NULL,NULL,NULL,NULL,NULL,NULL,4,NULL),(54,'07:05:00','07:51:00','钻进',0,NULL,'0','0','0',0,NULL,22,NULL,'2014-03-16 10:59:50','2014-03-16 10:59:50','0',NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL),(55,'07:51:00','08:51:00','钻进',0,NULL,'0','0','0',0,NULL,22,NULL,'2014-03-16 10:59:50','2014-03-16 10:59:50','0',NULL,NULL,NULL,NULL,NULL,NULL,NULL,5,NULL),(56,'08:51:00','11:51:00','取心',0,NULL,'0','0','0',5,NULL,22,NULL,'2014-03-16 10:59:50','2014-03-16 10:59:50','2',NULL,NULL,NULL,NULL,NULL,NULL,NULL,5,NULL),(57,'00:00:00','00:10:00','下钻',0,NULL,'0','0','0',0,NULL,23,NULL,'2014-03-16 11:15:54','2014-03-16 11:15:54','1.4',NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL),(58,'00:10:00','01:10:00','钻进',0,NULL,'500','60','500',0,NULL,23,NULL,'2014-03-16 11:15:54','2014-03-16 11:15:54','1.4',NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL),(59,'01:10:00','02:10:00','起下钻取心',0,NULL,'0','0','0',0.3,NULL,23,NULL,'2014-03-16 11:15:54','2014-03-16 11:15:54','1',NULL,NULL,NULL,NULL,NULL,NULL,NULL,0.4,NULL),(60,'00:00:00','01:00:00','下钻',0,NULL,'0','0','0',0,NULL,24,NULL,'2014-03-16 11:18:19','2014-03-16 11:18:19','3.5',NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL),(61,'01:00:00','03:00:00','钻进',0,NULL,'0','0','500',0,NULL,24,NULL,'2014-03-16 11:18:19','2014-03-16 11:18:19','0',NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL),(62,'03:00:00','04:00:00','钻进',0,NULL,'600','0','0',2.9,NULL,24,NULL,'2014-03-16 11:18:19','2014-03-16 11:18:19','3.6',NULL,NULL,NULL,NULL,NULL,NULL,NULL,3,NULL),(63,'04:00:00','04:50:00','钻进',2.8,NULL,'0','0','0',0,NULL,24,NULL,'2014-03-16 11:18:19','2014-03-16 11:18:19','0.8',NULL,NULL,NULL,NULL,NULL,NULL,NULL,3,NULL),(64,'04:50:00','08:00:00','钻进',0,NULL,'0','0','0',0,NULL,24,NULL,'2014-03-16 11:18:19','2014-03-16 11:18:19','0',NULL,NULL,NULL,NULL,NULL,NULL,NULL,3,NULL),(65,'09:05:00','17:05:00','钻进',0,NULL,'1470','250','450',0,NULL,25,NULL,'2014-03-16 11:21:51','2014-03-16 11:21:51','0',NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL),(66,'19:05:00','20:05:00','起下钻取心',0,NULL,'0','0','0',0.7,NULL,25,NULL,'2014-03-16 11:21:52','2014-03-16 11:21:52','2.8',NULL,NULL,NULL,NULL,NULL,NULL,NULL,0.9,NULL),(67,'00:00:00','03:00:00','钻进',1.8,NULL,'1450','500','500',0,NULL,26,NULL,'2014-03-16 11:24:19','2014-03-16 11:24:19','2.7',NULL,NULL,NULL,NULL,NULL,NULL,NULL,0.9,NULL),(68,'03:00:00','04:30:00','接班',0,NULL,'0','0','0',0,NULL,27,NULL,'2014-05-01 14:22:55','2014-05-01 14:22:55','2.7',NULL,NULL,NULL,NULL,NULL,NULL,NULL,291.64,NULL),(69,'04:30:00','05:30:00','钻进',0,NULL,'0','0','0',0,NULL,27,NULL,'2014-05-01 14:22:55','2014-05-01 14:22:55','0',NULL,NULL,NULL,NULL,NULL,NULL,NULL,291.64,NULL),(70,'05:30:00','06:00:00','接班',2,NULL,'0','0','0',1.97,NULL,27,NULL,'2014-05-01 14:22:55','2014-05-01 14:22:55','0.7',NULL,NULL,NULL,NULL,NULL,NULL,NULL,293.64,NULL),(71,'06:00:00','07:20:00','钻进',0,NULL,'0','0','0',0,NULL,27,NULL,'2014-05-01 14:22:55','2014-05-01 14:22:55','3.72',NULL,NULL,NULL,NULL,NULL,NULL,NULL,296.66,NULL),(72,'07:20:00','08:50:00','取心',3.02,NULL,'0','0','0',0,NULL,27,NULL,'2014-05-01 14:22:55','2014-05-01 14:22:55','0.7',NULL,NULL,NULL,NULL,NULL,NULL,NULL,296.66,NULL),(73,'08:50:00','10:20:00','钻进',0,NULL,'0','0','0',0,NULL,27,NULL,'2014-05-01 14:22:55','2014-05-01 14:22:55','3.72',NULL,NULL,NULL,NULL,NULL,NULL,NULL,296.66,NULL),(74,'10:20:00','11:50:00','辅助',0,NULL,'0','0','0',0,NULL,27,NULL,'2014-05-01 14:22:55','2014-05-01 14:22:55','0.7',NULL,NULL,NULL,NULL,NULL,NULL,NULL,296.66,NULL),(75,'11:50:00','12:30:00','下钻',0,NULL,'0','0','0',0,NULL,27,NULL,'2014-05-01 14:22:55','2014-05-01 14:22:55','0',NULL,NULL,NULL,NULL,NULL,NULL,NULL,296.66,NULL),(76,'12:30:00','13:00:00','钻进',3.02,NULL,'0','0','0',0,NULL,27,NULL,'2014-05-01 14:22:55','2014-05-01 14:22:55','3.72',NULL,NULL,NULL,NULL,NULL,NULL,NULL,299.68,NULL),(77,'13:00:00','14:00:00','取心',2.82,NULL,'0','0','0',0,NULL,27,NULL,'2014-05-01 14:22:55','2014-05-01 14:22:55','0.9',NULL,NULL,NULL,NULL,NULL,NULL,NULL,302.5,NULL),(78,'14:00:00','14:40:00','钻进',0,NULL,'0','0','0',0,NULL,27,NULL,'2014-05-01 14:22:55','2014-05-01 14:22:55','3.92',NULL,NULL,NULL,NULL,NULL,NULL,NULL,302.5,NULL),(79,'14:40:00','15:00:00','取心',1.72,NULL,'0','0','0',0,NULL,27,NULL,'2014-05-01 14:22:55','2014-05-01 14:22:55','2.2',NULL,NULL,NULL,NULL,NULL,NULL,NULL,304.22,NULL),(80,'15:00:00','15:00:00','交班',0,NULL,'0','0','0',0,NULL,27,NULL,'2014-05-01 14:22:55','2014-05-01 14:22:55','0',NULL,NULL,NULL,NULL,NULL,NULL,NULL,304.22,NULL),(81,'03:00:00','04:30:00','接班',0,NULL,'0','0','0',0,NULL,28,NULL,'2014-05-01 14:22:56','2014-05-01 14:22:56','2.7',NULL,NULL,NULL,NULL,NULL,NULL,NULL,291.64,NULL),(82,'04:30:00','05:30:00','钻进',0,NULL,'0','0','0',0,NULL,28,NULL,'2014-05-01 14:22:56','2014-05-01 14:22:56','0',NULL,NULL,NULL,NULL,NULL,NULL,NULL,291.64,NULL),(83,'05:30:00','06:00:00','接班',2,NULL,'0','0','0',1.97,NULL,28,NULL,'2014-05-01 14:22:56','2014-05-01 14:22:56','0.7',NULL,NULL,NULL,NULL,NULL,NULL,NULL,293.64,NULL),(84,'06:00:00','07:20:00','钻进',0,NULL,'0','0','0',0,NULL,28,NULL,'2014-05-01 14:22:56','2014-05-01 14:22:56','3.72',NULL,NULL,NULL,NULL,NULL,NULL,NULL,296.66,NULL),(85,'07:20:00','08:50:00','取心',3.02,NULL,'0','0','0',0,NULL,28,NULL,'2014-05-01 14:22:56','2014-05-01 14:22:56','0.7',NULL,NULL,NULL,NULL,NULL,NULL,NULL,296.66,NULL),(86,'08:50:00','10:20:00','钻进',0,NULL,'0','0','0',0,NULL,28,NULL,'2014-05-01 14:22:56','2014-05-01 14:22:56','3.72',NULL,NULL,NULL,NULL,NULL,NULL,NULL,296.66,NULL),(87,'10:20:00','11:50:00','辅助',0,NULL,'0','0','0',0,NULL,28,NULL,'2014-05-01 14:22:56','2014-05-01 14:22:56','0.7',NULL,NULL,NULL,NULL,NULL,NULL,NULL,296.66,NULL),(88,'11:50:00','12:30:00','下钻',0,NULL,'0','0','0',0,NULL,28,NULL,'2014-05-01 14:22:56','2014-05-01 14:22:56','0',NULL,NULL,NULL,NULL,NULL,NULL,NULL,296.66,NULL),(89,'12:30:00','13:00:00','钻进',3.02,NULL,'0','0','0',0,NULL,28,NULL,'2014-05-01 14:22:56','2014-05-01 14:22:56','3.72',NULL,NULL,NULL,NULL,NULL,NULL,NULL,299.68,NULL),(90,'13:00:00','14:00:00','取心',2.82,NULL,'0','0','0',0,NULL,28,NULL,'2014-05-01 14:22:56','2014-05-01 14:22:56','0.9',NULL,NULL,NULL,NULL,NULL,NULL,NULL,302.5,NULL),(91,'14:00:00','14:40:00','钻进',0,NULL,'0','0','0',0,NULL,28,NULL,'2014-05-01 14:22:56','2014-05-01 14:22:56','3.92',NULL,NULL,NULL,NULL,NULL,NULL,NULL,302.5,NULL),(92,'14:40:00','15:00:00','取心',1.72,NULL,'0','0','0',0,NULL,28,NULL,'2014-05-01 14:22:56','2014-05-01 14:22:56','2.2',NULL,NULL,NULL,NULL,NULL,NULL,NULL,304.22,NULL),(93,'15:00:00','15:00:00','交班',0,NULL,'0','0','0',0,NULL,28,NULL,'2014-05-01 14:22:56','2014-05-01 14:22:56','0',NULL,NULL,NULL,NULL,NULL,NULL,NULL,304.22,NULL),(94,'03:00:00','04:30:00','接班',0,NULL,'0','0','0',0,NULL,28,NULL,'2014-05-01 14:22:56','2014-05-01 14:22:56','2.7',NULL,NULL,NULL,NULL,NULL,NULL,NULL,291.64,NULL),(95,'03:00:00','03:10:00','接班',0,NULL,'0','0','0',0,NULL,29,NULL,'2014-05-01 15:24:37','2014-05-01 15:24:37','1.4',NULL,NULL,NULL,NULL,NULL,NULL,NULL,320.14,NULL),(96,'03:10:00','05:00:00','钻进',0,NULL,'0','0','0',0,NULL,29,NULL,'2014-05-01 15:24:37','2014-05-01 15:24:37','4.43',NULL,NULL,NULL,NULL,NULL,NULL,NULL,320.14,NULL),(97,'05:00:00','05:30:00','取心',1.63,NULL,'0','0','0',1.57,NULL,29,NULL,'2014-05-01 15:24:37','2014-05-01 15:24:37','2.8',NULL,NULL,NULL,NULL,NULL,NULL,NULL,321.77,NULL),(98,'05:30:00','07:40:00','钻进',0,NULL,'0','0','0',0,NULL,29,NULL,'2014-05-01 15:24:37','2014-05-01 15:24:37','0',NULL,NULL,NULL,NULL,NULL,NULL,NULL,321.77,NULL),(99,'07:40:00','08:10:00','取心',2.1,NULL,'0','0','0',2.1,NULL,29,NULL,'2014-05-01 15:24:37','2014-05-01 15:24:37','0.7',NULL,NULL,NULL,NULL,NULL,NULL,NULL,323.87,NULL),(100,'08:10:00','09:50:00','钻进',0,NULL,'0','0','0',0,NULL,29,NULL,'2014-05-01 15:24:37','2014-05-01 15:24:37','3.72',NULL,NULL,NULL,NULL,NULL,NULL,NULL,323.87,NULL),(101,'09:50:00','10:20:00','取心',1.52,NULL,'0','0','0',1.51,NULL,29,NULL,'2014-05-01 15:24:37','2014-05-01 15:24:37','2.2',NULL,NULL,NULL,NULL,NULL,NULL,NULL,325.39,NULL),(102,'10:20:00','11:20:00','钻进',0,NULL,'0','0','0',0,NULL,29,NULL,'2014-05-01 15:24:37','2014-05-01 15:24:37','5.22',NULL,NULL,NULL,NULL,NULL,NULL,NULL,325.39,NULL),(103,'11:20:00','11:50:00','取心',1.82,NULL,'0','0','0',1.82,NULL,29,NULL,'2014-05-01 15:24:37','2014-05-01 15:24:37','3.4',NULL,NULL,NULL,NULL,NULL,NULL,NULL,327.21,NULL),(104,'11:50:00','13:50:00','钻进',0,NULL,'0','0','0',0,NULL,29,NULL,'2014-05-01 15:24:37','2014-05-01 15:24:37','0',NULL,NULL,NULL,NULL,NULL,NULL,NULL,327.21,NULL),(105,'13:50:00','14:20:00','取心',1.7,NULL,'0','0','0',1.7,NULL,29,NULL,'2014-05-01 15:24:37','2014-05-01 15:24:37','1.7',NULL,NULL,NULL,NULL,NULL,NULL,NULL,328.91,NULL),(106,'14:20:00','15:00:00','起钻',0,NULL,'0','0','0',0,NULL,29,NULL,'2014-05-01 15:24:37','2014-05-01 15:24:37','0',NULL,NULL,NULL,NULL,NULL,NULL,NULL,328.91,NULL),(107,'15:00:00','15:00:00','交班',0,NULL,'0','0','0',0,NULL,29,NULL,'2014-05-01 15:24:37','2014-05-01 15:24:37','0',NULL,NULL,NULL,NULL,NULL,NULL,NULL,328.91,NULL),(108,'03:00:00','04:00:00','钻进',0,NULL,'0','0','0',0,NULL,30,NULL,'2014-05-01 16:34:56','2014-05-01 16:34:56','1.5',NULL,NULL,NULL,NULL,NULL,NULL,NULL,328.91,NULL),(109,'00:50:00','01:20:00','取心',3.02,NULL,'0','0','0',2.9,NULL,31,NULL,'2014-05-01 17:27:58','2014-05-01 17:27:58','0.7',NULL,NULL,NULL,NULL,NULL,NULL,NULL,357.11,NULL),(110,'01:20:00','03:00:00','钻进',0,NULL,'0','0','0',0,NULL,31,NULL,'2014-05-01 17:27:58','2014-05-01 17:27:58','3.72',NULL,NULL,NULL,NULL,NULL,NULL,NULL,357.11,NULL),(111,'03:00:00','03:00:00','交班',0,NULL,'0','0','0',0,NULL,31,NULL,'2014-05-01 17:27:58','2014-05-01 17:27:58','0',NULL,NULL,NULL,NULL,NULL,NULL,NULL,357.11,NULL),(112,'15:00:00','15:10:00','接班',0,NULL,'0','0','0',0,NULL,31,NULL,'2014-05-01 17:27:58','2014-05-01 17:27:58','2.1',NULL,NULL,NULL,NULL,NULL,NULL,NULL,349.61,NULL),(113,'15:10:00','16:50:00','钻进',0,NULL,'0','0','0',0,NULL,31,NULL,'2014-05-01 17:27:58','2014-05-01 17:27:58','0',NULL,NULL,NULL,NULL,NULL,NULL,NULL,349.61,NULL),(114,'16:50:00','17:20:00','取心',1.4,NULL,'0','0','0',1.4,NULL,31,NULL,'2014-05-01 17:27:58','2014-05-01 17:27:58','0.7',NULL,NULL,NULL,NULL,NULL,NULL,NULL,351.07,NULL),(115,'17:20:00','20:50:00','钻进',0,NULL,'0','0','0',0,NULL,31,NULL,'2014-05-01 17:27:58','2014-05-01 17:27:58','3.72',NULL,NULL,NULL,NULL,NULL,NULL,NULL,351.07,NULL),(116,'20:50:00','21:20:00','取心',3.02,NULL,'0','0','0',3.02,NULL,31,NULL,'2014-05-01 17:27:58','2014-05-01 17:27:58','0.7',NULL,NULL,NULL,NULL,NULL,NULL,NULL,354.09,NULL),(117,'21:20:00','00:50:00','接班',0,NULL,'0','0','0',0,NULL,31,NULL,'2014-05-01 17:27:58','2014-05-01 17:27:58','3.72',NULL,NULL,NULL,NULL,NULL,NULL,NULL,354.09,NULL),(118,'00:40:00','02:40:00','钻进',0,NULL,'0','0','0',0,NULL,32,NULL,'2014-05-01 18:00:59','2014-05-01 18:00:59','0',NULL,NULL,NULL,NULL,NULL,NULL,NULL,368.5,NULL),(119,'02:40:00','03:00:00','交班',0,NULL,'0','0','0',0,NULL,32,NULL,'2014-05-01 18:00:59','2014-05-01 18:00:59','0',NULL,NULL,NULL,NULL,NULL,NULL,NULL,368.5,NULL),(120,'15:00:00','17:00:00','接班',0,NULL,'0','0','0',0,NULL,32,NULL,'2014-05-01 18:00:59','2014-05-01 18:00:59','3.72',NULL,NULL,NULL,NULL,NULL,NULL,NULL,357.11,NULL),(121,'17:00:00','17:20:00','辅助',0,NULL,'0','0','0',0,NULL,32,NULL,'2014-05-01 18:00:59','2014-05-01 18:00:59','0',NULL,NULL,NULL,NULL,NULL,NULL,NULL,357.11,NULL),(122,'17:20:00','18:10:00','钻进',0,NULL,'0','0','0',0,NULL,32,NULL,'2014-05-01 18:00:59','2014-05-01 18:00:59','0',NULL,NULL,NULL,NULL,NULL,NULL,NULL,357.11,NULL),(123,'18:10:00','18:40:00','取心',1.62,NULL,'0','0','0',1.62,NULL,32,NULL,'2014-05-01 18:00:59','2014-05-01 18:00:59','2.1',NULL,NULL,NULL,NULL,NULL,NULL,NULL,358.73,NULL),(124,'18:40:00','19:20:00','钻进',0,NULL,'0','0','0',0,NULL,32,NULL,'2014-05-01 18:00:59','2014-05-01 18:00:59','0',NULL,NULL,NULL,NULL,NULL,NULL,NULL,358.73,NULL),(125,'19:20:00','21:30:00','取心',4.42,NULL,'0','0','0',0,NULL,32,NULL,'2014-05-01 18:00:59','2014-05-01 18:00:59','0.7',NULL,NULL,NULL,NULL,NULL,NULL,NULL,363.15,NULL),(126,'21:30:00','23:40:00','钻进',0,NULL,'0','0','0',0,NULL,32,NULL,'2014-05-01 18:00:59','2014-05-01 18:00:59','3.73',NULL,NULL,NULL,NULL,NULL,NULL,NULL,363.15,NULL),(127,'23:40:00','00:40:00','取心',5.05,NULL,'0','0','0',0,NULL,32,NULL,'2014-05-01 18:00:59','2014-05-01 18:00:59','1.4',NULL,NULL,NULL,NULL,NULL,NULL,NULL,368.5,NULL),(128,'00:00:00','01:00:00','接班',0,NULL,'0','0','0',0,NULL,33,NULL,'2014-05-01 18:01:00','2014-05-01 18:01:00','0',NULL,NULL,NULL,NULL,NULL,NULL,NULL,357.11,NULL),(129,'00:40:00','01:00:00','取心',2.1,NULL,'0','0','0',2.07,NULL,34,NULL,'2014-05-01 18:40:02','2014-05-01 18:40:02','1.1',NULL,NULL,NULL,NULL,NULL,NULL,NULL,371.83,NULL),(130,'01:00:00','02:00:00','钻进',0,NULL,'0','0','0',0,NULL,34,NULL,'2014-05-01 18:40:02','2014-05-01 18:40:02','4.12',NULL,NULL,NULL,NULL,NULL,NULL,NULL,371.83,NULL),(131,'02:00:00','03:00:00','取心',2.12,NULL,'0','0','0',2.12,NULL,34,NULL,'2014-05-01 18:40:02','2014-05-01 18:40:02','2',NULL,NULL,NULL,NULL,NULL,NULL,NULL,373.95,NULL),(132,'03:00:00','03:00:00','交班',0,NULL,'0','0','0',0,NULL,34,NULL,'2014-05-01 18:40:02','2014-05-01 18:40:02','0',NULL,NULL,NULL,NULL,NULL,NULL,NULL,373.95,NULL),(133,'15:00:00','20:00:00','接班',0,NULL,'0','0','0',0,NULL,34,NULL,'2014-05-01 18:40:02','2014-05-01 18:40:02','3.2',NULL,NULL,NULL,NULL,NULL,NULL,NULL,369.73,NULL),(134,'20:00:00','20:30:00','辅助',0,NULL,'0','0','0',0,NULL,34,NULL,'2014-05-01 18:40:02','2014-05-01 18:40:02','0',NULL,NULL,NULL,NULL,NULL,NULL,NULL,369.73,NULL),(135,'20:30:00','23:00:00','辅助',0,NULL,'0','0','0',0,NULL,34,NULL,'2014-05-01 18:40:02','2014-05-01 18:40:02','0',NULL,NULL,NULL,NULL,NULL,NULL,NULL,369.73,NULL),(136,'23:00:00','00:40:00','钻进',0,NULL,'0','0','0',0,NULL,34,NULL,'2014-05-01 18:40:02','2014-05-01 18:40:02','0',NULL,NULL,NULL,NULL,NULL,NULL,NULL,369.73,NULL),(137,'00:00:00','23:59:00','钻进',12.5,NULL,'0','0','0',0,NULL,35,NULL,'2014-05-01 19:19:00','2014-05-01 19:19:00','0',NULL,NULL,NULL,NULL,NULL,NULL,NULL,373.95,NULL),(138,'15:00:00','15:10:00','接班',0,NULL,'0','0','0',0,NULL,36,NULL,'2014-05-01 21:06:39','2014-05-01 21:06:39','1.2',NULL,NULL,NULL,NULL,NULL,NULL,NULL,417.06,NULL),(139,'15:10:00','16:40:00','钻进',0,NULL,'0','0','0',0,NULL,36,NULL,'2014-05-01 21:06:39','2014-05-01 21:06:39','4.22',NULL,NULL,NULL,NULL,NULL,NULL,NULL,417.06,NULL),(140,'16:40:00','17:10:00','取心',1.72,NULL,'0','0','0',1.72,NULL,36,NULL,'2014-05-01 21:06:39','2014-05-01 21:06:39','2.5',NULL,NULL,NULL,NULL,NULL,NULL,NULL,418.78,NULL),(141,'17:10:00','18:40:00','钻进',0,NULL,'0','0','0',0,NULL,36,NULL,'2014-05-01 21:06:39','2014-05-01 21:06:39','0',NULL,NULL,NULL,NULL,NULL,NULL,NULL,418.78,NULL),(142,'18:40:00','19:10:00','取心',1.5,NULL,'0','0','0',1.5,NULL,36,NULL,'2014-05-01 21:06:39','2014-05-01 21:06:39','1',NULL,NULL,NULL,NULL,NULL,NULL,NULL,420.28,NULL),(143,'19:10:00','20:40:00','钻进',0,NULL,'0','0','0',0,NULL,36,NULL,'2014-05-01 21:06:39','2014-05-01 21:06:39','4.02',NULL,NULL,NULL,NULL,NULL,NULL,NULL,420.28,NULL),(144,'20:40:00','21:10:00','取心',1.72,NULL,'0','0','0',1.7,NULL,36,NULL,'2014-05-01 21:06:39','2014-05-01 21:06:39','2.3',NULL,NULL,NULL,NULL,NULL,NULL,NULL,422,NULL),(145,'21:10:00','22:40:00','钻进',0,NULL,'0','0','0',0,NULL,36,NULL,'2014-05-01 21:06:39','2014-05-01 21:06:39','0',NULL,NULL,NULL,NULL,NULL,NULL,NULL,422,NULL),(146,'22:40:00','23:10:00','取心',1.5,NULL,'0','0','0',1.5,NULL,36,NULL,'2014-05-01 21:06:39','2014-05-01 21:06:39','0.8',NULL,NULL,NULL,NULL,NULL,NULL,NULL,423.5,NULL),(147,'23:10:00','01:00:00','钻进',0,NULL,'0','0','0',0,NULL,36,NULL,'2014-05-01 21:06:39','2014-05-01 21:06:39','3.83',NULL,NULL,NULL,NULL,NULL,NULL,NULL,423.5,NULL),(148,'00:00:00','23:59:00','钻进',12.3,NULL,'0','0','0',0,NULL,37,NULL,'2014-05-01 21:06:39','2014-05-01 21:06:39','0',NULL,NULL,NULL,NULL,NULL,NULL,NULL,300.1,NULL),(149,'08:00:00','10:00:00','辅助',NULL,'','','','',NULL,NULL,38,9,'2014-06-15 00:43:42','2014-06-15 00:43:42','0.0',NULL,NULL,'','','','','',NULL,''),(150,'10:00:00','12:30:00','钻进',NULL,'','','','',NULL,NULL,38,9,'2014-06-15 00:43:43','2014-06-15 00:43:43','5.87',NULL,NULL,'','','','','',NULL,''),(151,'12:30:00','14:20:00','起下钻、取心',3.07,'','','','',NULL,NULL,38,9,'2014-06-15 00:43:43','2014-06-15 00:43:43','2.80',NULL,NULL,'','','','','',3.07,''),(152,'14:20:00','15:30:00','钻进',NULL,'','','','',NULL,NULL,38,9,'2014-06-15 00:43:43','2014-06-15 00:43:43','5.15',NULL,NULL,'','','','','',NULL,''),(153,'15:30:00','16:00:00','起钻、取心',1.85,'','','','',NULL,NULL,38,9,'2014-06-15 00:43:43','2014-06-15 00:43:43','3.30',NULL,NULL,'','','','','',4.92,''),(154,'16:00:00','16:00:00','交班',NULL,'','','','',NULL,NULL,38,9,'2014-06-15 00:43:43','2014-06-15 00:43:43','',NULL,NULL,'','','','','',NULL,''),(155,'16:00:00','18:00:00','接班',NULL,'','','','',NULL,NULL,39,9,'2014-06-15 01:19:57','2014-06-15 01:19:57','3.30',NULL,NULL,'','','','','',4.92,''),(156,'18:00:00','18:40:00','钻进',NULL,'','','','',NULL,NULL,39,9,'2014-06-15 01:19:57','2014-06-15 01:19:57','',NULL,NULL,'','','','','',NULL,''),(157,'18:40:00','19:00:00','起钻、取心',0.4,'','','','',NULL,NULL,39,9,'2014-06-15 01:19:57','2014-06-15 01:19:57','2.90',NULL,NULL,'','','','','',5.32,''),(158,'19:00:00','22:00:00','辅助',NULL,'','','','',NULL,NULL,39,9,'2014-06-15 01:19:57','2014-06-15 01:19:57','4.87',NULL,NULL,'','','','','',NULL,''),(159,'22:00:00','23:00:00','钻进',NULL,'','','','',NULL,NULL,39,9,'2014-06-15 01:19:57','2014-06-15 01:19:57','',NULL,NULL,'','','','','',NULL,''),(160,'23:00:00','23:59:00','起下钻、取心',1.37,'','','','',NULL,NULL,39,9,'2014-06-15 01:19:57','2014-06-15 01:19:57','3.50',NULL,NULL,'','','','','',6.69,''),(161,'23:59:00','23:59:00','交班',NULL,'','','','',NULL,NULL,39,9,'2014-06-15 01:19:57','2014-06-15 01:19:57','',NULL,NULL,'','','','','',NULL,''),(162,'16:00:00','16:05:00','接班',NULL,'','','','',NULL,NULL,40,9,'2014-06-15 01:37:17','2014-06-15 01:37:17','3.00',NULL,NULL,'','','','','',41.75,''),(163,'16:05:00','17:10:00','下钻',NULL,'','','','',NULL,NULL,40,9,'2014-06-15 01:37:17','2014-06-15 01:37:17','3.00',NULL,NULL,'','','','','',41.75,''),(164,'17:10:00','18:30:00','钻进',NULL,'','','','',NULL,NULL,40,9,'2014-06-15 01:37:17','2014-06-15 01:37:17','',NULL,NULL,'','','','','',NULL,''),(165,'18:30:00','18:50:00','起钻、取心',1.7,'','','','',1.46,NULL,40,9,'2014-06-15 01:37:17','2014-06-15 01:37:17','1.30',NULL,NULL,'28-4/4','','','','',43.45,''),(166,'18:50:00','18:55:00','辅助',NULL,'','','','',NULL,NULL,40,9,'2014-06-15 01:37:17','2014-06-15 01:37:17','4.42',NULL,NULL,'','','','','',NULL,''),(167,'18:55:00','19:20:00','钻进',NULL,'','','','',NULL,NULL,40,9,'2014-06-15 01:37:17','2014-06-15 01:37:17','',NULL,NULL,'','','','','',NULL,''),(168,'19:20:00','19:30:00','起下钻、取心',0.72,'','','','',0.6,NULL,40,9,'2014-06-15 01:37:17','2014-06-15 01:37:17','3.70',NULL,NULL,'29-1/1','','','','',44.17,''),(169,'19:30:00','20:10:00','钻进',NULL,'','','','',NULL,NULL,40,9,'2014-06-15 01:37:17','2014-06-15 01:37:17','',NULL,NULL,'','','','','',NULL,''),(170,'20:10:00','20:30:00','起下钻、取心',1.8,'','','','',1.6,NULL,40,9,'2014-06-15 01:37:17','2014-06-15 01:37:17','1.90',NULL,NULL,'30-4/4','','','','',45.97,''),(171,'20:30:00','20:35:00','辅助',NULL,'','','','',NULL,NULL,40,9,'2014-06-15 01:37:18','2014-06-15 01:37:18','4.95',NULL,NULL,'','','','','',NULL,''),(172,'20:35:00','21:00:00','钻进',NULL,'','','','',NULL,NULL,40,9,'2014-06-15 01:37:18','2014-06-15 01:37:18','',NULL,NULL,'','','','','',NULL,''),(173,'21:00:00','21:20:00','起下钻、取心',1.95,'','','','',1.68,NULL,40,9,'2014-06-15 01:37:18','2014-06-15 01:37:18','3.00',NULL,NULL,'31-4/4','','','','',47.92,''),(174,'21:20:00','22:00:00','钻进',NULL,'','','','',NULL,NULL,40,9,'2014-06-15 01:37:18','2014-06-15 01:37:18','',NULL,NULL,'','','','','',NULL,''),(175,'22:00:00','22:20:00','起下钻、取心',2.2,'','','','',1.99,NULL,40,9,'2014-06-15 01:37:18','2014-06-15 01:37:18','0.80',NULL,NULL,'32-5/5','','','','',50.12,''),(176,'22:20:00','22:35:00','校正孔深',NULL,'','','','',NULL,NULL,40,9,'2014-06-15 01:37:18','2014-06-15 01:37:18','',NULL,NULL,'','','','','',NULL,''),(177,'22:35:00','22:50:00','测斜',NULL,'','','','',NULL,NULL,40,9,'2014-06-15 01:37:18','2014-06-15 01:37:18','',NULL,NULL,'','','','','',NULL,''),(178,'22:50:00','22:55:00','辅助',NULL,'','','','',NULL,NULL,40,9,'2014-06-15 01:37:18','2014-06-15 01:37:18','3.81',NULL,NULL,'','','','','',NULL,''),(179,'22:55:00','23:20:00','钻进',NULL,'','','','',NULL,NULL,40,9,'2014-06-15 01:37:18','2014-06-15 01:37:18','',NULL,NULL,'','','','','',NULL,''),(180,'23:20:00','23:30:00','起下钻、取心',1.91,'','','','',1.76,NULL,40,9,'2014-06-15 01:37:18','2014-06-15 01:37:18','1.90',NULL,NULL,'33-4/4','','','','',52.03,''),(181,'23:30:00','23:35:00','辅助',NULL,'','','','',NULL,NULL,40,9,'2014-06-15 01:37:18','2014-06-15 01:37:18','4.94',NULL,NULL,'','','','','',NULL,''),(182,'23:35:00','23:50:00','钻进',NULL,'','','','',NULL,NULL,40,9,'2014-06-15 01:37:18','2014-06-15 01:37:18','',NULL,NULL,'','','','','',NULL,''),(183,'23:50:00','23:59:00','起下钻、取心',1.24,'','','','',1.13,NULL,40,9,'2014-06-15 01:37:18','2014-06-15 01:37:18','3.70',NULL,NULL,'34-1/1','','','','',53.27,''),(184,'23:59:00','23:59:00','交班',NULL,'','','','',NULL,NULL,40,9,'2014-06-15 01:37:18','2014-06-15 01:37:18','',NULL,NULL,'','','','','',NULL,''),(185,'00:00:00','23:59:00','钻进',10,NULL,'0','0','0',0,NULL,136,NULL,'2014-06-15 03:48:23','2014-06-15 03:48:23','0',NULL,NULL,NULL,NULL,NULL,NULL,NULL,825,NULL);

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
