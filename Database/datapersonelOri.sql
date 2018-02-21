/*
SQLyog Ultimate v12.3.2 (64 bit)
MySQL - 10.1.30-MariaDB : Database - datapersonel
*********************************************************************
*/


/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
-- CREATE DATABASE /*!32312 IF NOT EXISTS*/`datapersonel` /*!40100 DEFAULT CHARACTER SET latin1 */;

-- USE `datapersonel`;

/*Table structure for table `area` */

DROP TABLE IF EXISTS `area`;

CREATE TABLE `area` (
  `areaID` tinyint(3) unsigned NOT NULL AUTO_INCREMENT,
  `areaName` varchar(45) DEFAULT NULL,
  `areaNote` varchar(100) DEFAULT NULL,
  `createdDate` datetime DEFAULT NULL,
  `createdUserID` int(11) unsigned DEFAULT NULL,
  PRIMARY KEY (`areaID`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=latin1;

/*Data for the table `area` */

insert  into `area`(`areaID`,`areaName`,`areaNote`,`createdDate`,`createdUserID`) values 

(1,'Pusat','Area Pusat','2017-12-10 16:10:00',1),

(2,'Jabodetabek','Area Jabodetabek','2017-12-10 16:10:00',1),

(3,'Purwokerto','Area Purwokerto','2017-12-10 16:10:00',1),

(4,'Perintis','Area Perintis','2017-12-10 16:10:00',1),

(5,'Yogyakarta','Area Yogyakarta','2017-12-10 16:10:00',1),

(6,'Semarang','Area Semarang','2017-12-10 16:10:00',1),

(7,'Solo','Area Solo','2017-12-10 16:10:00',1),

(8,'Malang','Area Malang','2017-12-10 16:10:00',1),

(9,'Bali','Area Bali','2017-12-10 16:10:00',1);

/*Table structure for table `bagan` */

DROP TABLE IF EXISTS `bagan`;

CREATE TABLE `bagan` (
  `baganID` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `baganName` varchar(150) NOT NULL,
  `parentID` int(11) unsigned DEFAULT NULL,
  `order` int(11) DEFAULT NULL,
  `class` int(11) DEFAULT NULL,
  `createdDate` datetime NOT NULL,
  `createdUserID` int(11) NOT NULL,
  PRIMARY KEY (`baganID`),
  KEY `parentID` (`parentID`),
  CONSTRAINT `bagan_ibfk_1` FOREIGN KEY (`parentID`) REFERENCES `bagan` (`baganID`) ON DELETE CASCADE ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=38 DEFAULT CHARSET=utf8;

/*Data for the table `bagan` */

insert  into `bagan`(`baganID`,`baganName`,`parentID`,`order`,`class`,`createdDate`,`createdUserID`) values 

(1,'Waroeng SS',NULL,NULL,NULL,'2018-01-14 13:25:34',44),

(2,'Support',1,1,0,'2018-02-18 13:19:13',44),

(3,'Operasi',1,2,0,'2018-02-18 13:19:37',44),

(4,'Lintas Divisi',1,3,0,'2018-02-18 13:19:57',44),

(5,'Non Struktural',1,4,0,'2018-02-18 13:22:22',44),

(6,'SDM',2,1,1,'2018-01-14 13:26:55',44),

(7,'PEMBANGUNAN DAN PENGELOLAAN MANAJEMEN (PPM)',6,1,2,'2018-01-14 13:35:31',44),

(8,'REKRUITMEN DAN PENEGAKAN ATURAN',6,2,2,'2018-01-14 13:41:43',44),

(9,'Training',6,3,2,'2018-01-14 13:48:33',44),

(10,'Event Dan Traffic',6,5,2,'2018-01-14 14:13:32',44),

(11,'KESRA DANA',6,6,2,'2018-01-20 09:29:20',44),

(12,'KESRA FASILITAS',6,7,2,'2018-01-20 09:42:51',44),

(13,'KERUMAHTANGGAAN',6,8,2,'2018-01-20 10:00:54',44),

(14,'KEUANGAN',2,2,1,'2018-01-20 10:11:41',44),

(15,'KEUANGAN PERUSAHAAN',14,1,2,'2018-01-20 10:18:49',44),

(16,'PENANGANAN PAJAK',14,2,2,'2018-01-20 10:27:22',44),

(17,'ANGGARAN DAN KONTROL PENGGUNAAN',14,3,2,'2018-02-18 16:07:19',44),

(18,'COST ACCOUNTING',14,4,2,'2018-01-20 11:02:32',44),

(19,'GENERAL ACCOUNTING',14,5,2,'2018-01-20 11:13:13',44),

(20,'INTERNAL KONTROL',14,6,2,'2018-01-20 11:18:42',44),

(21,'OPERASIONAL KEUANGAN',14,7,2,'2018-01-20 11:19:51',44),

(22,'Kasir',14,8,2,'2018-02-18 13:42:06',44),

(23,'TEKNOLOGI INFORMASI',2,3,1,'2018-01-20 15:04:12',44),

(24,'PEMBUATAN SOFTWARE',23,1,2,'2018-01-20 15:04:57',44),

(25,'PENGELOLAAN HARDWARE DAN JARINGAN',23,2,2,'2018-01-20 15:12:33',44),

(26,'OPERASIONAL UMUM TI',23,3,2,'2018-01-20 15:20:59',44),

(27,'INTERNAL AUDIT',2,4,1,'2018-01-20 15:38:12',44),

(28,'AUDIT PROSES KERJA',27,1,2,'2018-01-20 15:39:31',44),

(29,'AUDIT KEUANGAN',27,2,2,'2018-01-20 15:46:18',44),

(30,'PAPG',3,1,2,'2018-01-22 17:02:17',44),

(31,'Produksi',3,2,2,'2018-01-24 15:43:02',44),

(32,'P2O',3,3,2,'2018-01-24 16:37:33',44),

(33,'LEMBAGA DIREKTUR',4,5,1,'2018-01-24 19:22:43',44),

(34,'Pengembangan Usaha',33,1,2,'2018-01-25 09:48:38',44),

(35,'Kesekretariatan Direktur',33,2,2,'2018-01-25 09:49:26',44),

(36,'Legal, Humas & PDS',33,3,2,'2018-01-25 09:49:47',44),

(37,'Kacab',1,1,1,'2018-02-18 13:48:26',44);

/*Table structure for table `divisions` */

DROP TABLE IF EXISTS `divisions`;

CREATE TABLE `divisions` (
  `divisionID` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `divisionName` varchar(100) NOT NULL,
  `divisionNote` varchar(100) NOT NULL,
  `createdDate` datetime NOT NULL,
  `createdUserID` int(11) unsigned NOT NULL,
  PRIMARY KEY (`divisionID`)
) ENGINE=InnoDB AUTO_INCREMENT=29 DEFAULT CHARSET=latin1;

/*Data for the table `divisions` */

insert  into `divisions`(`divisionID`,`divisionName`,`divisionNote`,`createdDate`,`createdUserID`) values 

(1,'Pengembangan Usaha','','2018-02-22 09:03:00',25),

(2,'Kesekretariatan Direktur','','2018-02-22 09:03:00',25),

(3,'Legal, Humas & PDS','','2018-02-22 09:03:00',25),

(4,'PAPG','','2018-02-22 09:03:00',25),

(5,'Produksi','','2018-02-22 09:03:00',25),

(6,'P2O','','2018-02-22 09:03:00',25),

(7,'Pemasaran dan Penjualan','','2018-02-22 09:03:00',25),

(8,'Keuangan Perusahaan & Pajak','','2018-02-22 09:03:00',25),

(9,'Anggaran  & Kontrol Penggunaan','Bagian yang mengelola anggaran dan pengunaannya','2017-12-30 09:26:07',474),

(10,'Operasional Keuangan','','2018-02-22 09:03:00',25),

(11,'Cost Accounting','','2018-02-22 09:03:00',25),

(12,'General Accounting','','2018-02-22 09:03:00',25),

(14,'Training','','2018-02-22 09:03:00',25),

(15,'Event','-','2018-01-12 09:11:16',25),

(16,'Kesra Dana','','2018-02-22 09:03:00',25),

(17,'Kesra Fasilitas','-','2017-12-28 10:36:06',25),

(18,'Rumah Tangga & Traffic','-','2018-01-12 09:11:55',25),

(19,'[IT] Pengelolaan Hardware dan Jaringan','-','2018-01-04 09:00:42',25),

(20,'[IT] Pembuatan Software','-','2018-01-04 08:59:56',25),

(21,'Internal Audit','','2018-02-22 09:03:00',25),

(22,'Koperasi','','2018-02-22 09:03:00',25),

(24,'[RPP] Pembangunan dan Pengelolaan Manajemen (PPM)','[RPP] Pembangunan dan Pengelolaan Manajemen (PPM)','2017-12-31 13:40:15',25),

(26,'[RPP] Rekruitmen dan Penegakan Aturan','[RPP] Rekruitmen dan Penegakan Aturan','2017-12-31 13:40:36',25),

(27,'[IT] Operasional Umum IT','-','2018-01-04 09:01:03',25),

(28,'Manager','-','2018-01-05 11:30:30',25);

/*Table structure for table `groups` */

DROP TABLE IF EXISTS `groups`;

CREATE TABLE `groups` (
  `id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(20) NOT NULL,
  `description` varchar(100) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;

/*Data for the table `groups` */

insert  into `groups`(`id`,`name`,`description`) values 

(1,'admin','Administrator'),

(2,'members','General User'),

(3,'users','Management pengguna'),

(4,'area',''),

(5,'subarea',''),

(6,'bagian',''),

(7,'subbagian','');

/*Table structure for table `level` */

DROP TABLE IF EXISTS `level`;

CREATE TABLE `level` (
  `levelID` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `levelName` varchar(20) DEFAULT NULL,
  `createdDate` datetime DEFAULT NULL,
  `createdUserID` int(11) unsigned DEFAULT NULL,
  PRIMARY KEY (`levelID`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=latin1;

/*Data for the table `level` */

insert  into `level`(`levelID`,`levelName`,`createdDate`,`createdUserID`) values 

(1,'Direktur','2018-02-18 13:53:40',44),

(2,'General Manajer','2018-02-18 13:53:50',44),

(3,'Manajer','2018-02-18 13:54:50',44),

(4,'KASI','2018-02-18 13:54:57',44),

(5,'KAUR','2018-02-18 13:55:26',44),

(6,'STAF','2018-02-18 13:55:51',44),

(7,'KACAB','2018-02-18 14:40:52',44),

(8,'Wakil KACAB','2018-02-18 14:41:15',44),

(9,'Asisten','2018-02-18 14:41:35',44),

(10,'Wakil Asisten','2018-02-18 16:52:30',44);

/*Table structure for table `logsecurity` */

DROP TABLE IF EXISTS `logsecurity`;

CREATE TABLE `logsecurity` (
  `lsID` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `lsAction` varchar(30) NOT NULL,
  `lsIp` varchar(45) DEFAULT NULL,
  `lsPlatform` varchar(45) DEFAULT NULL,
  `lsBrowser` varchar(45) DEFAULT NULL,
  `lsBrowserVersion` varchar(45) DEFAULT NULL,
  `lsDescription` varchar(100) DEFAULT NULL,
  `createdDate` datetime NOT NULL,
  `createdUserID` int(11) unsigned DEFAULT NULL,
  PRIMARY KEY (`lsID`)
) ENGINE=InnoDB AUTO_INCREMENT=1253 DEFAULT CHARSET=utf8;

/*Data for the table `logsecurity` */

insert  into `logsecurity`(`lsID`,`lsAction`,`lsIp`,`lsPlatform`,`lsBrowser`,`lsBrowserVersion`,`lsDescription`,`createdDate`,`createdUserID`) values 

(1,'logout_berhasil','::1','Windows 10','Firefox','57.0','','2017-12-12 16:25:23',25),

(2,'login_gagal','::1','Windows 10','Firefox','57.0','','2017-12-12 16:25:29',25),

(3,'login_gagal','::1','Windows 10','Firefox','57.0','','2017-12-13 07:36:35',25),

(4,'logout_berhasil','180.253.129.48','Windows 10','Chrome','63.0.3239.108','','2017-12-25 16:08:33',26),

(5,'logout_berhasil','180.253.129.48','Windows 10','Chrome','63.0.3239.108','','2017-12-25 16:21:03',474),

(6,'logout_berhasil','180.253.129.48','Windows 10','Chrome','63.0.3239.84','','2017-12-25 17:29:46',NULL),

(7,'logout_berhasil','180.253.129.48','Windows 10','Chrome','63.0.3239.84','','2017-12-25 17:30:14',474),

(8,'logout_berhasil','180.253.129.48','Windows 10','Firefox','57.0','','2017-12-25 18:59:14',25),

(9,'logout_berhasil','180.253.129.48','Windows 8.1','Firefox','51.0','','2017-12-25 19:25:39',519),

(10,'logout_berhasil','36.79.132.117','Windows 10','Chrome','63.0.3239.84','','2017-12-26 08:33:50',455),

(11,'logout_berhasil','36.79.132.117','Windows 7','Firefox','57.0','','2017-12-26 08:40:06',72),

(12,'logout_berhasil','180.253.129.48','Windows 10','Chrome','63.0.3239.84','','2017-12-26 08:56:58',474),

(13,'logout_berhasil','36.79.32.123','Windows XP','Firefox','52.0','','2017-12-26 10:10:13',343),

(14,'logout_berhasil','180.253.129.48','Windows 10','Chrome','63.0.3239.84','','2017-12-26 10:29:55',474),

(15,'logout_berhasil','61.5.20.169','Windows 8.1','Firefox','57.0','','2017-12-26 10:32:55',399),

(16,'logout_berhasil','118.96.160.133','Windows 7','Chrome','56.0.2924.87','','2017-12-26 11:19:19',542),

(17,'logout_berhasil','180.253.129.48','Windows 8.1','Chrome','63.0.3239.84','','2017-12-26 12:51:56',553),

(18,'logout_berhasil','180.253.129.48','Windows 8.1','Chrome','63.0.3239.84','','2017-12-26 13:17:34',553),

(19,'login_gagal','180.253.129.48','Windows 7','Chrome','63.0.3239.108','','2017-12-26 13:23:20',353),

(20,'login_gagal','180.253.129.48','Windows 7','Chrome','63.0.3239.108','','2017-12-26 13:23:30',353),

(21,'login_gagal','180.253.129.48','Windows 7','Chrome','63.0.3239.108','','2017-12-26 13:23:40',0),

(22,'login_gagal','180.253.129.48','Windows 7','Chrome','63.0.3239.108','','2017-12-26 13:23:53',353),

(23,'login_gagal','180.253.129.48','Windows 7','Chrome','63.0.3239.108','','2017-12-26 13:24:23',353),

(24,'login_gagal','180.253.129.48','Windows 7','Chrome','63.0.3239.108','','2017-12-26 13:25:00',353),

(25,'login_gagal','180.253.129.48','Windows 7','Chrome','63.0.3239.108','','2017-12-26 13:37:12',353),

(26,'login_gagal','180.253.129.48','Windows 7','Chrome','63.0.3239.108','','2017-12-26 13:37:40',0),

(27,'logout_berhasil','180.253.129.48','Windows 10','Chrome','63.0.3239.84','','2017-12-26 13:38:28',474),

(28,'login_gagal','180.253.129.48','Windows 10','Chrome','63.0.3239.84','','2017-12-26 13:38:39',353),

(29,'login_gagal','180.253.129.48','Windows 10','Chrome','63.0.3239.84','','2017-12-26 13:38:56',0),

(30,'login_gagal','180.253.129.48','Windows 7','Chrome','63.0.3239.108','','2017-12-26 13:43:30',353),

(31,'logout_berhasil','115.178.255.188','Windows 10','Chrome','63.0.3239.84','','2017-12-26 14:00:44',515),

(32,'logout_berhasil','180.253.129.48','Windows 10','Firefox','57.0','','2017-12-26 14:10:06',44),

(33,'login_gagal','180.253.129.48','Windows 10','Firefox','57.0','','2017-12-26 14:10:16',353),

(34,'logout_berhasil','180.253.129.48','Windows 7','Chrome','63.0.3239.108','','2017-12-26 14:13:34',557),

(35,'logout_berhasil','36.79.132.117','Windows 10','Firefox','57.0','','2017-12-26 14:18:12',485),

(36,'logout_berhasil','180.253.129.48','Windows 10','Chrome','63.0.3239.84','','2017-12-26 15:37:04',474),

(37,'logout_berhasil','180.254.84.125','Windows 8.1','Firefox','51.0','','2017-12-26 15:42:17',519),

(38,'logout_berhasil','36.79.132.117','Windows 8.1','Chrome','63.0.3239.84','','2017-12-26 16:08:19',74),

(39,'logout_berhasil','115.178.255.188','Windows 10','Chrome','63.0.3239.84','','2017-12-26 16:25:01',515),

(40,'logout_berhasil','180.253.129.48','Windows 7','Chrome','63.0.3239.108','','2017-12-26 16:39:26',353),

(41,'logout_berhasil','180.253.129.48','Windows 10','Chrome','63.0.3239.84','','2017-12-26 16:58:26',474),

(42,'logout_berhasil','180.253.129.48','Windows 10','Chrome','63.0.3239.84','','2017-12-26 17:04:54',44),

(43,'logout_berhasil','180.253.129.48','Windows 8.1','Chrome','63.0.3239.84','','2017-12-26 17:15:26',553),

(44,'logout_berhasil','180.253.129.48','Windows 7','Firefox','57.0','','2017-12-26 17:25:13',525),

(45,'logout_berhasil','180.253.129.48','Windows 8.1','Chrome','63.0.3239.84','','2017-12-26 17:28:45',553),

(46,'logout_berhasil','180.253.129.48','Windows 10','Chrome','63.0.3239.84','','2017-12-26 17:36:24',474),

(47,'logout_berhasil','180.245.129.109','Windows 7','Firefox','58.0','','2017-12-26 17:56:24',465),

(48,'logout_berhasil','36.79.132.117','Windows 7','Firefox','57.0','','2017-12-26 18:02:47',72),

(49,'logout_berhasil','36.79.132.117','Windows 10','Chrome','63.0.3239.84','','2017-12-26 19:17:03',455),

(50,'logout_berhasil','61.5.20.169','Windows 7','Chrome','63.0.3239.84','','2017-12-26 19:33:21',494),

(51,'logout_berhasil','118.96.160.133','Windows 7','Chrome','57.0.2987.98','','2017-12-27 07:55:40',536),

(52,'logout_berhasil','118.96.160.133','Windows 7','Chrome','57.0.2987.98','','2017-12-27 08:08:10',537),

(53,'logout_berhasil','61.5.20.169','Windows 8.1','Firefox','57.0','','2017-12-27 08:31:44',345),

(54,'logout_berhasil','180.253.129.48','Windows 10','Firefox','57.0','','2017-12-27 08:40:09',44),

(55,'logout_berhasil','115.178.253.210','Windows 10','Chrome','63.0.3239.84','','2017-12-27 10:24:09',515),

(56,'logout_berhasil','36.85.48.38','Windows 7','Chrome','63.0.3239.84','','2017-12-27 10:53:16',547),

(57,'logout_berhasil','36.79.132.117','Windows 7','Firefox','57.0','','2017-12-27 11:05:39',489),

(58,'logout_berhasil','180.253.129.48','Windows 7','Firefox','57.0','','2017-12-27 11:12:45',525),

(59,'logout_berhasil','180.246.97.45','Windows 7','Chrome','63.0.3239.84','','2017-12-27 12:07:52',500),

(60,'logout_berhasil','36.79.132.117','Windows 10','Firefox','57.0','','2017-12-27 13:21:03',485),

(61,'logout_berhasil','115.178.253.210','Windows 7','Chrome','57.0.2987.98','','2017-12-27 13:22:31',360),

(62,'logout_berhasil','115.178.253.210','Windows 7','Firefox','57.0','','2017-12-27 13:22:37',NULL),

(63,'logout_berhasil','115.178.253.210','Windows 7','Chrome','57.0.2987.98','','2017-12-27 13:22:43',NULL),

(64,'login_gagal','36.79.132.117','Windows 7','Chrome','63.0.3239.84','','2017-12-27 13:27:58',482),

(65,'login_gagal','36.79.132.117','Windows 7','Chrome','63.0.3239.84','','2017-12-27 13:28:26',482),

(66,'login_gagal','36.79.132.117','Windows 7','Chrome','63.0.3239.84','','2017-12-27 13:28:54',482),

(67,'login_gagal','36.79.132.117','Windows 7','Chrome','63.0.3239.84','','2017-12-27 13:29:33',482),

(68,'logout_berhasil','36.79.87.80','Windows 10','Chrome','57.0.2987.98','','2017-12-27 13:48:27',511),

(69,'logout_berhasil','180.253.129.48','Windows 10','Chrome','63.0.3239.84','','2017-12-27 14:10:12',474),

(70,'logout_berhasil','180.253.129.48','Windows 10','Firefox','57.0','','2017-12-27 14:32:22',558),

(71,'logout_berhasil','120.188.72.139','Windows 7','Firefox','57.0','','2017-12-27 14:46:54',343),

(72,'logout_berhasil','180.253.129.48','Windows 8.1','Firefox','57.0','','2017-12-27 14:58:52',9),

(73,'logout_berhasil','180.253.129.48','Windows 7','Chrome','63.0.3239.108','','2017-12-27 15:48:11',NULL),

(74,'login_gagal','36.79.132.117','Windows 7','Opera','49.0.2725.64','','2017-12-27 15:49:08',483),

(75,'logout_berhasil','36.79.132.117','Windows 7','Opera','49.0.2725.64','','2017-12-27 16:25:59',483),

(76,'login_gagal','36.79.132.117','Windows 7','Opera','49.0.2725.64','','2017-12-27 16:26:06',483),

(77,'logout_berhasil','36.79.132.117','Windows 8.1','Chrome','63.0.3239.84','','2017-12-27 16:52:08',74),

(78,'logout_berhasil','115.178.253.210','Windows 10','Chrome','63.0.3239.84','','2017-12-27 16:58:25',515),

(79,'logout_berhasil','115.178.253.210','Windows 10','Chrome','63.0.3239.84','','2017-12-27 16:59:19',515),

(80,'logout_berhasil','36.79.132.117','Windows 10','Firefox','57.0','','2017-12-27 17:06:17',485),

(81,'logout_berhasil','180.253.129.48','Windows 10','Firefox','57.0','','2017-12-27 17:11:53',558),

(82,'logout_berhasil','36.79.132.117','Windows 7','Chrome','63.0.3239.84','','2017-12-27 17:19:12',482),

(83,'logout_berhasil','36.85.48.38','Windows 7','Firefox','57.0','','2017-12-27 17:35:57',NULL),

(84,'logout_berhasil','180.246.97.45','Windows 7','Chrome','63.0.3239.84','','2017-12-27 17:43:52',NULL),

(85,'logout_berhasil','114.124.145.97','Android','Chrome','63.0.3239.111','','2017-12-27 22:20:43',474),

(86,'logout_berhasil','36.73.66.202','Windows 10','Chrome','63.0.3239.84','','2017-12-28 09:20:18',474),

(87,'logout_berhasil','36.80.231.216','Windows 8.1','Chrome','63.0.3239.84','','2017-12-28 11:27:35',492),

(88,'logout_berhasil','118.96.160.133','Windows 8.1','Firefox','57.0','','2017-12-28 11:31:28',46),

(89,'logout_berhasil','180.245.129.109','Windows 7','Firefox','58.0','','2017-12-28 11:48:26',465),

(90,'logout_berhasil','36.73.66.202','Windows 10','Chrome','63.0.3239.84','','2017-12-28 12:55:53',474),

(91,'logout_berhasil','36.73.66.202','Windows 10','Chrome','63.0.3239.84','','2017-12-28 15:28:35',474),

(92,'logout_berhasil','36.73.66.202','Windows 7','Chrome','63.0.3239.108','','2017-12-28 16:09:33',353),

(93,'logout_berhasil','36.79.129.170','Windows 7','Firefox','57.0','','2017-12-28 16:51:59',525),

(94,'logout_berhasil','36.80.142.99','Windows 7','Chrome','63.0.3239.84','','2017-12-28 16:57:27',508),

(95,'logout_berhasil','36.79.129.170','Windows 7','Chrome','63.0.3239.84','','2017-12-28 17:02:09',NULL),

(96,'logout_berhasil','180.245.209.58','Windows 7','Chrome','63.0.3239.84','','2017-12-28 17:41:07',470),

(97,'logout_berhasil','36.79.129.170','Windows 7','Chrome','63.0.3239.84','','2017-12-28 17:46:34',557),

(98,'logout_berhasil','36.79.129.170','Windows 7','Firefox','57.0','','2017-12-29 10:48:48',525),

(99,'logout_berhasil','180.245.129.109','Windows 7','Chrome','63.0.3239.84','','2017-12-29 13:00:40',558),

(100,'logout_berhasil','180.245.209.58','Windows 7','Chrome','63.0.3239.84','','2017-12-29 13:16:04',NULL),

(101,'logout_berhasil','180.245.209.58','Windows 7','Chrome','63.0.3239.84','','2017-12-29 13:41:38',470),

(102,'logout_berhasil','112.215.240.234','Windows 8.1','Chrome','63.0.3239.84','','2017-12-29 15:09:48',357),

(103,'logout_berhasil','36.79.129.170','Windows 7','Firefox','57.0','','2017-12-29 15:36:56',525),

(104,'logout_berhasil','180.254.84.125','Windows 10','Firefox','57.0','','2017-12-29 15:47:49',558),

(105,'logout_berhasil','180.254.85.244','Windows 7','Chrome','63.0.3239.108','','2017-12-30 09:52:11',353),

(106,'logout_berhasil','180.254.85.244','Windows 7','Firefox','57.0','','2017-12-30 10:35:55',524),

(107,'logout_berhasil','36.80.142.99','Windows 7','Chrome','63.0.3239.84','','2017-12-30 10:37:52',511),

(108,'logout_berhasil','36.80.142.99','Windows 7','Chrome','63.0.3239.84','','2017-12-30 10:40:46',511),

(109,'logout_berhasil','36.80.203.124','Windows 7','Chrome','63.0.3239.84','','2017-12-30 11:39:30',54),

(110,'logout_berhasil','180.254.85.244','Windows 8.1','Chrome','63.0.3239.84','','2017-12-30 11:42:20',357),

(111,'logout_berhasil','180.254.85.244','Windows 7','Chrome','63.0.3239.108','','2017-12-30 13:55:18',353),

(112,'logout_berhasil','180.254.85.244','Windows 7','Chrome','63.0.3239.84','','2017-12-30 14:33:08',517),

(113,'logout_berhasil','36.79.151.226','Windows 7','Chrome','63.0.3239.84','','2017-12-30 15:59:55',538),

(114,'logout_berhasil','36.80.203.124','Windows 7','Chrome','63.0.3239.84','','2017-12-30 16:20:05',10),

(115,'logout_berhasil','36.80.142.99','Windows 7','Chrome','63.0.3239.84','','2017-12-30 16:58:37',511),

(116,'logout_berhasil','180.254.85.244','Windows 7','Firefox','57.0','','2017-12-30 17:19:07',559),

(117,'logout_berhasil','36.80.203.124','Windows 7','Chrome','63.0.3239.84','','2017-12-30 17:34:03',10),

(118,'logout_berhasil','36.79.157.111','Windows 7','Firefox','57.0','','2017-12-30 20:49:37',525),

(119,'logout_berhasil','36.79.157.111','Windows 7','Firefox','57.0','','2017-12-31 10:07:18',559),

(120,'logout_berhasil','36.73.50.126','Windows 7','Chrome','57.0.2987.98','','2017-12-31 13:19:35',536),

(121,'logout_berhasil','36.79.157.111','Windows 7','Chrome','63.0.3239.84','','2017-12-31 15:29:34',528),

(122,'logout_berhasil','180.245.209.58','Windows 7','Chrome','63.0.3239.84','','2017-12-31 16:18:05',470),

(123,'login_gagal','180.245.209.58','Windows 7','Chrome','63.0.3239.84','','2017-12-31 16:18:20',558),

(124,'logout_berhasil','36.79.157.111','Windows 8.1','Firefox','57.0','','2017-12-31 16:23:02',9),

(125,'login_gagal','36.79.157.111','Windows 8.1','Firefox','57.0','','2017-12-31 16:23:08',9),

(126,'logout_berhasil','180.245.209.58','Windows 7','Chrome','63.0.3239.84','','2017-12-31 16:59:24',558),

(127,'logout_berhasil','36.79.157.111','Windows 8.1','Firefox','57.0','','2017-12-31 17:00:24',9),

(128,'logout_berhasil','36.79.157.111','Windows 10','Firefox','57.0','','2017-12-31 17:03:26',44),

(129,'logout_berhasil','115.178.253.82','Windows 7','Firefox','57.0','','2018-01-01 07:20:49',343),

(130,'logout_berhasil','180.246.180.87','Windows 10','Chrome','63.0.3239.84','','2018-01-01 08:43:02',469),

(131,'logout_berhasil','180.246.180.87','Windows 10','Chrome','63.0.3239.84','','2018-01-01 08:44:07',28),

(132,'logout_berhasil','114.124.238.33','Android','Chrome','63.0.3239.111','','2018-01-01 10:08:20',474),

(133,'logout_berhasil','180.246.156.101','Windows 7','Chrome','63.0.3239.84','','2018-01-01 10:37:36',538),

(134,'logout_berhasil','180.246.156.101','Windows 7','Chrome','63.0.3239.84','','2018-01-01 10:38:03',538),

(135,'logout_berhasil','36.81.95.214','Windows 7','Firefox','57.0','','2018-01-01 11:28:58',559),

(136,'logout_berhasil','36.81.95.214','Windows 7','Firefox','57.0','','2018-01-01 11:29:14',559),

(137,'logout_berhasil','36.81.95.214','Windows 7','Firefox','57.0','','2018-01-01 11:33:14',559),

(138,'logout_berhasil','36.81.95.214','Windows 10','Firefox','57.0','','2018-01-01 16:33:44',25),

(139,'logout_berhasil','180.246.59.84','Windows 7','Chrome','63.0.3239.84','','2018-01-01 16:37:43',NULL),

(140,'logout_berhasil','180.246.180.87','Windows 7','Chrome','63.0.3239.84','','2018-01-01 17:05:27',470),

(141,'logout_berhasil','36.81.95.214','Windows 7','Firefox','57.0','','2018-01-01 18:42:25',525),

(142,'logout_berhasil','180.254.75.71','Windows 7','Firefox','58.0','','2018-01-02 09:11:32',523),

(143,'logout_berhasil','180.254.75.71','Windows 7','Chrome','63.0.3239.84','','2018-01-02 10:13:06',465),

(144,'logout_berhasil','36.81.95.214','Windows 8.1','Firefox','57.0','','2018-01-02 10:44:39',370),

(145,'logout_berhasil','36.81.95.214','Windows 8.1','Firefox','57.0','','2018-01-02 10:45:02',370),

(146,'login_gagal','180.254.75.71','Windows 7','Chrome','63.0.3239.84','','2018-01-02 10:46:12',465),

(147,'login_gagal','180.254.75.71','Windows 7','Chrome','63.0.3239.84','','2018-01-02 10:46:22',465),

(148,'login_gagal','180.254.75.71','Windows 7','Chrome','63.0.3239.84','','2018-01-02 10:46:39',465),

(149,'login_gagal','180.254.75.71','Windows 7','Chrome','63.0.3239.84','','2018-01-02 10:47:17',465),

(150,'login_gagal','180.254.75.71','Windows 7','Chrome','63.0.3239.84','','2018-01-02 10:47:40',465),

(151,'logout_berhasil','180.254.75.71','Windows 7','Firefox','58.0','','2018-01-02 11:07:25',465),

(152,'login_gagal','180.254.75.71','Windows 7','Firefox','58.0','','2018-01-02 11:07:51',465),

(153,'logout_berhasil','36.81.95.214','Windows 7','Chrome','56.0.2924.87','','2018-01-02 11:15:23',529),

(154,'logout_berhasil','180.246.156.101','Windows 8.1','Chrome','57.0.2987.98','','2018-01-02 11:15:51',536),

(155,'login_gagal','180.246.156.101','Windows 8.1','Chrome','57.0.2987.98','','2018-01-02 11:16:41',535),

(156,'login_gagal','180.246.156.101','Windows 8.1','Chrome','57.0.2987.98','','2018-01-02 11:16:55',535),

(157,'logout_berhasil','180.254.75.71','Windows 7','Firefox','58.0','','2018-01-02 11:41:57',465),

(158,'logout_berhasil','36.81.95.214','Windows 10','Chrome','63.0.3239.84','','2018-01-02 13:48:49',474),

(159,'logout_berhasil','125.161.99.217','Windows 8.1','Firefox','57.0','','2018-01-02 14:02:07',345),

(160,'logout_berhasil','36.80.150.143','Windows 7','Chrome','63.0.3239.84','','2018-01-02 14:04:25',511),

(161,'logout_berhasil','36.81.95.214','Windows 8.1','Firefox','57.0','','2018-01-02 15:01:35',370),

(162,'logout_berhasil','125.161.99.217','Windows 7','Firefox','57.0','','2018-01-02 16:26:10',398),

(163,'logout_berhasil','36.73.106.76','Windows 10','Chrome','63.0.3239.84','','2018-01-02 16:59:11',455),

(164,'logout_berhasil','36.73.106.76','Windows 7','Firefox','57.0','','2018-01-02 17:40:02',NULL),

(165,'logout_berhasil','36.81.95.214','Windows 10','Firefox','57.0','','2018-01-02 17:56:03',NULL),

(166,'logout_berhasil','180.246.156.101','Windows 7','Chrome','57.0.2987.98','','2018-01-02 20:36:46',535),

(167,'logout_berhasil','36.80.150.143','Windows XP','Firefox','52.0','','2018-01-03 10:27:33',343),

(168,'logout_berhasil','36.73.56.249','Windows 7','Chrome','57.0.2987.98','','2018-01-03 11:20:35',535),

(169,'login_gagal','36.73.56.249','Windows 8.1','Chrome','63.0.3239.84','','2018-01-03 11:25:10',535),

(170,'logout_berhasil','180.254.75.71','Windows 7','Firefox','58.0','','2018-01-03 11:44:55',465),

(171,'logout_berhasil','36.72.212.123','Windows 8.1','Chrome','63.0.3239.84','','2018-01-03 12:09:58',492),

(172,'logout_berhasil','128.199.238.125','Windows 10','Chrome','63.0.3239.108','','2018-01-03 13:21:24',482),

(173,'logout_berhasil','180.254.75.71','Windows 7','Chrome','63.0.3239.84','','2018-01-03 13:35:14',475),

(174,'login_gagal','180.254.75.71','Windows 7','Chrome','63.0.3239.84','','2018-01-03 13:35:33',465),

(175,'logout_berhasil','180.254.75.71','Windows 7','Chrome','63.0.3239.84','','2018-01-03 13:44:51',465),

(176,'logout_berhasil','36.73.106.76','Windows 10','Chrome','63.0.3239.84','','2018-01-03 14:09:50',455),

(177,'logout_berhasil','36.81.95.214','Windows 7','Chrome','56.0.2924.87','','2018-01-03 14:10:39',39),

(178,'logout_berhasil','115.178.235.83','Windows 10','Chrome','63.0.3239.84','','2018-01-03 15:04:08',515),

(179,'logout_berhasil','36.81.95.214','Windows 7','Firefox','57.0','','2018-01-03 15:29:32',NULL),

(180,'logout_berhasil','36.81.95.214','Windows 8.1','Firefox','57.0','','2018-01-03 15:52:36',9),

(181,'login_gagal','115.178.235.83','Windows 10','Chrome','63.0.3239.84','','2018-01-03 16:09:34',515),

(182,'login_gagal','115.178.235.83','Windows 10','Chrome','63.0.3239.84','','2018-01-03 16:09:48',0),

(183,'logout_berhasil','115.178.235.83','Windows 10','Chrome','63.0.3239.84','','2018-01-03 16:29:22',515),

(184,'logout_berhasil','36.72.215.170','Windows 7','Chrome','57.0.2987.98','','2018-01-03 17:00:59',535),

(185,'logout_berhasil','36.72.215.170','Windows 7','Chrome','56.0.2924.87','','2018-01-03 18:03:26',NULL),

(186,'logout_berhasil','36.73.106.76','Windows 7','Chrome','63.0.3239.84','','2018-01-03 19:00:10',NULL),

(187,'logout_berhasil','36.73.106.76','Windows 7','Opera','49.0.2725.64','','2018-01-04 08:55:12',483),

(188,'logout_berhasil','36.73.106.76','Windows 7','Chrome','63.0.3239.84','','2018-01-04 09:06:56',72),

(189,'logout_berhasil','115.178.250.179','Windows 10','Chrome','63.0.3239.84','','2018-01-04 09:07:46',515),

(190,'logout_berhasil','36.81.95.214','Windows 10','Chrome','63.0.3239.108','','2018-01-04 09:19:18',474),

(191,'logout_berhasil','36.81.95.214','Windows 7','Chrome','57.0.2987.98','','2018-01-04 09:51:00',558),

(192,'logout_berhasil','36.81.95.214','Windows 8.1','Firefox','57.0','','2018-01-04 10:24:34',370),

(193,'login_gagal','36.81.95.214','Windows 8.1','Firefox','57.0','','2018-01-04 10:24:44',370),

(194,'logout_berhasil','115.178.250.179','Windows 10','Chrome','63.0.3239.84','','2018-01-04 10:32:56',515),

(195,'logout_berhasil','180.254.75.71','Windows 7','Firefox','57.0','','2018-01-04 10:41:17',520),

(196,'logout_berhasil','115.178.250.179','Windows 10','Chrome','63.0.3239.84','','2018-01-04 12:56:53',515),

(197,'logout_berhasil','125.161.115.218','Windows 7','Chrome','56.0.2924.87','','2018-01-04 13:34:29',392),

(198,'logout_berhasil','36.81.95.214','Windows 10','Firefox','57.0','','2018-01-04 13:35:17',558),

(199,'logout_berhasil','180.254.28.29','Windows 7','Chrome','63.0.3239.84','','2018-01-04 14:44:38',513),

(200,'logout_berhasil','36.80.214.171','Windows 7','Chrome','63.0.3239.84','','2018-01-04 15:00:08',538),

(201,'logout_berhasil','36.81.95.214','Windows 7','Firefox','58.0','','2018-01-04 15:05:55',528),

(202,'logout_berhasil','36.81.95.214','Windows 7','Firefox','58.0','','2018-01-04 15:06:24',528),

(203,'logout_berhasil','36.81.95.214','Windows 7','Chrome','63.0.3239.84','','2018-01-04 15:10:00',26),

(204,'logout_berhasil','120.188.75.15','Windows 10','Firefox','57.0','','2018-01-04 15:13:01',521),

(205,'logout_berhasil','36.81.95.214','Windows 10','Firefox','57.0','','2018-01-04 15:14:17',558),

(206,'logout_berhasil','36.81.95.214','Windows 7','Chrome','56.0.2924.87','','2018-01-04 15:14:21',NULL),

(207,'logout_berhasil','36.81.95.214','Windows 8.1','Firefox','57.0','','2018-01-04 15:15:40',370),

(208,'logout_berhasil','180.254.28.29','Windows 10','Chrome','57.0.2987.98','','2018-01-04 15:34:36',511),

(209,'logout_berhasil','180.253.129.252','Windows 7','Chrome','63.0.3239.84','','2018-01-04 16:07:08',72),

(210,'logout_berhasil','125.163.237.174','Windows 10','Firefox','57.0','','2018-01-04 16:37:26',9),

(211,'logout_berhasil','115.178.250.179','Windows 7','Chrome','57.0.2987.98','','2018-01-04 17:17:19',NULL),

(212,'logout_berhasil','114.124.144.80','Android','Chrome','38.0.2125.102','','2018-01-04 18:22:07',519),

(213,'logout_berhasil','125.161.115.218','Windows 7','Firefox','57.0','','2018-01-04 19:02:25',392),

(214,'logout_berhasil','114.124.212.74','Windows 7','Chrome','63.0.3239.108','','2018-01-04 20:50:11',72),

(215,'logout_berhasil','180.254.28.29','Windows 10','Chrome','57.0.2987.98','','2018-01-04 20:53:08',511),

(216,'logout_berhasil','180.253.129.252','Windows 7','Firefox','57.0','','2018-01-04 21:13:13',NULL),

(217,'logout_berhasil','115.178.250.179','Windows 10','Chrome','63.0.3239.84','','2018-01-05 07:49:38',515),

(218,'logout_berhasil','180.254.28.29','Windows 7','Chrome','63.0.3239.108','','2018-01-05 08:44:33',508),

(219,'logout_berhasil','114.124.245.115','Android','Chrome','38.0.2125.102','','2018-01-05 08:46:27',519),

(220,'logout_berhasil','36.81.95.214','Windows 10','Firefox','57.0','','2018-01-05 08:46:39',558),

(221,'logout_berhasil','36.81.95.214','Windows 10','Firefox','57.0','','2018-01-05 08:48:52',519),

(222,'logout_berhasil','180.253.129.252','Windows 10','Opera','49.0.2725.64','','2018-01-05 08:55:49',484),

(223,'logout_berhasil','180.254.75.71','Windows 7','Firefox','57.0','','2018-01-05 09:39:09',520),

(224,'logout_berhasil','115.178.251.158','Windows 7','Chrome','57.0.2987.98','','2018-01-05 09:40:02',360),

(225,'logout_berhasil','180.254.28.29','Windows 7','Chrome','63.0.3239.84','','2018-01-05 09:52:55',513),

(226,'logout_berhasil','180.247.91.1','Windows 7','Firefox','57.0','','2018-01-05 09:55:11',342),

(227,'login_gagal','180.247.91.1','Windows 7','Firefox','57.0','','2018-01-05 09:55:42',546),

(228,'logout_berhasil','115.178.251.158','Windows 10','Chrome','63.0.3239.84','','2018-01-05 09:56:06',515),

(229,'login_gagal','180.247.91.1','Windows 7','Firefox','57.0','','2018-01-05 09:56:09',546),

(230,'logout_berhasil','180.247.91.1','Windows 7','Firefox','57.0','','2018-01-05 09:58:38',342),

(231,'logout_berhasil','180.247.91.1','Windows 7','Firefox','57.0','','2018-01-05 09:59:44',551),

(232,'logout_berhasil','180.247.91.1','Windows 7','Firefox','57.0','','2018-01-05 10:13:17',546),

(233,'login_gagal','180.247.91.1','Windows 7','Firefox','57.0','','2018-01-05 10:13:26',0),

(234,'logout_berhasil','180.247.91.1','Windows 7','Firefox','57.0','','2018-01-05 10:22:14',551),

(235,'logout_berhasil','180.253.129.252','Windows 10','Chrome','63.0.3239.84','','2018-01-05 11:39:36',455),

(236,'logout_berhasil','115.178.251.158','Windows 10','Chrome','63.0.3239.84','','2018-01-05 12:23:13',515),

(237,'logout_berhasil','125.166.234.158','Windows 7','Firefox','52.0','','2018-01-05 12:42:54',501),

(238,'logout_berhasil','180.247.91.1','Windows 7','Firefox','57.0','','2018-01-05 12:48:03',NULL),

(239,'logout_berhasil','180.247.91.1','Windows 7','Chrome','63.0.3239.108','','2018-01-05 13:14:43',547),

(240,'logout_berhasil','36.81.95.214','Windows 10','Chrome','63.0.3239.132','','2018-01-05 14:00:54',474),

(241,'logout_berhasil','115.178.251.158','Windows 7','Chrome','57.0.2987.98','','2018-01-05 15:05:55',360),

(242,'logout_berhasil','180.254.28.29','Windows 7','Chrome','63.0.3239.84','','2018-01-05 15:17:23',513),

(243,'logout_berhasil','36.81.23.72','Windows 8.1','Firefox','51.0','','2018-01-05 15:18:26',519),

(244,'logout_berhasil','36.81.95.214','Windows 7','Chrome','63.0.3239.84','','2018-01-05 15:30:42',520),

(245,'logout_berhasil','180.254.28.29','Windows 10','Chrome','57.0.2987.98','','2018-01-05 15:35:56',511),

(246,'logout_berhasil','180.254.28.29','Windows 7','Chrome','57.0.2987.98','','2018-01-05 15:38:07',422),

(247,'logout_berhasil','36.80.224.155','Windows 7','Chrome','63.0.3239.84','','2018-01-05 15:54:09',538),

(248,'logout_berhasil','115.178.251.158','Windows 10','Chrome','63.0.3239.84','','2018-01-05 16:27:02',515),

(249,'logout_berhasil','36.81.95.214','Windows 8.1','Firefox','57.0','','2018-01-05 16:48:52',NULL),

(250,'logout_berhasil','36.81.95.214','Windows 7','Chrome','56.0.2924.87','','2018-01-05 17:05:36',NULL),

(251,'logout_berhasil','36.80.224.155','Windows 7','Chrome','57.0.2987.98','','2018-01-05 17:08:05',535),

(252,'logout_berhasil','180.247.153.126','Windows 7','Firefox','57.0','','2018-01-05 17:35:17',454),

(253,'logout_berhasil','180.254.28.29','Windows 7','Chrome','63.0.3239.108','','2018-01-05 17:36:03',508),

(254,'logout_berhasil','180.254.28.29','Windows 10','Chrome','57.0.2987.98','','2018-01-05 17:42:56',422),

(255,'logout_berhasil','36.81.95.214','Windows 10','Chrome','63.0.3239.132','','2018-01-05 17:47:16',474),

(256,'logout_berhasil','180.247.153.126','Windows 7','Firefox','57.0','','2018-01-05 17:51:37',342),

(257,'logout_berhasil','180.247.153.126','Windows 7','Firefox','57.0','','2018-01-05 18:02:04',342),

(258,'logout_berhasil','180.253.129.252','Windows 7','Chrome','63.0.3239.84','','2018-01-05 18:10:08',72),

(259,'login_gagal','180.247.153.126','Windows 7','Firefox','57.0','','2018-01-05 18:11:27',342),

(260,'logout_berhasil','180.253.129.252','Windows 10','Chrome','63.0.3239.84','','2018-01-05 18:13:27',455),

(261,'logout_berhasil','125.166.234.158','Windows 7','Chrome','63.0.3239.84','','2018-01-05 18:14:21',11),

(262,'logout_berhasil','180.247.153.126','Windows 7','Firefox','57.0','','2018-01-05 18:16:29',342),

(263,'logout_berhasil','125.161.115.218','Windows 8.1','Firefox','57.0','','2018-01-05 18:36:49',NULL),

(264,'logout_berhasil','36.81.95.214','Windows 8.1','Chrome','57.0.2987.98','','2018-01-05 18:47:40',NULL),

(265,'logout_berhasil','36.81.95.214','Windows 7','Chrome','56.0.2924.87','','2018-01-05 18:50:15',528),

(266,'logout_berhasil','180.254.28.29','Windows 10','Chrome','57.0.2987.98','','2018-01-05 19:18:51',514),

(267,'logout_berhasil','36.81.23.72','Windows 8.1','Firefox','51.0','','2018-01-05 19:44:09',519),

(268,'logout_berhasil','180.254.75.71','Windows 7','Firefox','58.0','','2018-01-05 19:56:41',520),

(269,'logout_berhasil','36.81.95.214','Windows 8.1','Firefox','57.0','','2018-01-05 20:18:54',NULL),

(270,'logout_berhasil','180.246.217.217','Windows 7','Firefox','58.0','','2018-01-05 22:04:31',520),

(271,'logout_berhasil','180.254.28.29','Windows 7','Chrome','63.0.3239.132','','2018-01-05 22:11:41',NULL),

(272,'logout_berhasil','180.254.28.29','Windows 10','Chrome','57.0.2987.98','','2018-01-05 22:41:43',512),

(273,'logout_berhasil','180.246.217.217','Windows 7','Firefox','57.0','','2018-01-05 22:42:51',520),

(274,'logout_berhasil','180.246.177.136','Windows 10','Firefox','57.0','','2018-01-06 09:09:48',25),

(275,'logout_berhasil','115.178.250.172','Windows 10','Chrome','63.0.3239.84','','2018-01-06 10:34:39',515),

(276,'logout_berhasil','115.178.250.172','Windows 10','Chrome','63.0.3239.84','','2018-01-06 10:37:32',515),

(277,'logout_berhasil','180.253.129.252','Windows 10','Chrome','63.0.3239.84','','2018-01-06 14:16:29',455),

(278,'logout_berhasil','115.178.250.172','Windows 7','Chrome','57.0.2987.98','','2018-01-06 14:21:15',360),

(279,'logout_berhasil','36.73.90.218','Windows 10','Chrome','63.0.3239.132','','2018-01-06 14:27:05',474),

(280,'logout_berhasil','36.73.90.218','Windows 10','Firefox','57.0','','2018-01-06 15:09:02',558),

(281,'logout_berhasil','125.161.115.218','Windows 7','Firefox','57.0','','2018-01-06 15:11:44',399),

(282,'logout_berhasil','36.73.90.218','Windows 7','Chrome','63.0.3239.132','','2018-01-06 15:21:48',525),

(283,'logout_berhasil','36.73.90.218','Windows 7','Chrome','56.0.2924.87','','2018-01-06 15:28:36',545),

(284,'logout_berhasil','36.73.90.218','Windows 10','Firefox','57.0','','2018-01-06 16:08:42',558),

(285,'logout_berhasil','36.73.90.218','Windows 8.1','Firefox','57.0','','2018-01-06 16:48:46',370),

(286,'logout_berhasil','36.73.90.218','Windows 7','Firefox','57.0','','2018-01-06 16:59:01',80),

(287,'logout_berhasil','115.178.250.172','Windows 10','Chrome','63.0.3239.84','','2018-01-06 17:04:17',515),

(288,'logout_berhasil','36.73.90.218','Windows 7','Chrome','56.0.2924.87','','2018-01-06 17:05:04',528),

(289,'logout_berhasil','36.80.140.166','Windows 7','Chrome','63.0.3239.84','','2018-01-06 17:37:55',513),

(290,'login_gagal','36.73.90.218','Windows 10','Chrome','63.0.3239.132','','2018-01-06 17:40:20',474),

(291,'logout_berhasil','125.166.234.158','Windows 7','Firefox','57.0','','2018-01-06 17:59:49',498),

(292,'logout_berhasil','36.80.140.166','Windows 10','Chrome','57.0.2987.98','','2018-01-06 18:10:32',512),

(293,'logout_berhasil','36.78.113.12','Windows 7','Firefox','57.0','','2018-01-06 18:17:49',570),

(294,'logout_berhasil','36.78.113.12','Windows 7','Firefox','57.0','','2018-01-06 18:25:24',454),

(295,'logout_berhasil','36.73.90.218','Windows 10','Chrome','63.0.3239.132','','2018-01-06 18:36:08',474),

(296,'logout_berhasil','36.73.90.218','Windows 8.1','Chrome','57.0.2987.98','','2018-01-06 18:52:36',491),

(297,'logout_berhasil','36.73.90.218','Windows 7','Chrome','63.0.3239.84','','2018-01-06 20:56:11',NULL),

(298,'logout_berhasil','180.246.217.217','Windows 7','Firefox','57.0','','2018-01-06 23:06:43',520),

(299,'logout_berhasil','36.82.4.210','Windows 7','Firefox','57.0','','2018-01-06 23:53:50',454),

(300,'logout_berhasil','36.73.90.218','Windows 7','Firefox','57.0','','2018-01-07 09:58:19',524),

(301,'logout_berhasil','125.166.234.158','Windows 7','Chrome','63.0.3239.84','','2018-01-07 10:06:31',500),

(302,'logout_berhasil','115.178.237.96','Windows 10','Chrome','63.0.3239.84','','2018-01-07 10:24:36',515),

(303,'logout_berhasil','115.178.237.96','Windows 10','Chrome','63.0.3239.84','','2018-01-07 10:26:45',515),

(304,'logout_berhasil','36.80.251.191','Windows 7','Chrome','63.0.3239.132','','2018-01-07 13:48:27',538),

(305,'logout_berhasil','36.73.90.218','Windows 7','Chrome','57.0.2987.98','','2018-01-07 14:27:04',44),

(306,'logout_berhasil','36.81.11.200','Windows 7','Chrome','63.0.3239.84','','2018-01-07 15:04:43',72),

(307,'login_gagal','178.62.153.200','Windows 7','Chrome','63.0.3239.132','','2018-01-07 15:28:40',516),

(308,'logout_berhasil','36.81.11.200','Windows 7','Chrome','63.0.3239.84','','2018-01-07 15:48:17',72),

(309,'logout_berhasil','36.73.90.218','Windows 7','Chrome','57.0.2987.98','','2018-01-07 16:08:16',573),

(310,'logout_berhasil','125.166.234.158','Windows 7','Firefox','57.0','','2018-01-07 16:30:48',498),

(311,'logout_berhasil','115.178.255.6','Windows 10','Chrome','63.0.3239.84','','2018-01-07 17:00:24',515),

(312,'logout_berhasil','36.80.251.191','Windows 8.1','Firefox','57.0','','2018-01-07 17:03:04',537),

(313,'logout_berhasil','36.73.90.218','Windows 8.1','Firefox','51.0','','2018-01-07 17:11:37',519),

(314,'logout_berhasil','36.73.90.218','Windows 7','Chrome','56.0.2924.87','','2018-01-07 17:11:42',545),

(315,'logout_berhasil','36.81.11.200','Windows 10','Opera','49.0.2725.64','','2018-01-07 17:35:19',482),

(316,'logout_berhasil','36.81.23.72','Windows 7','Chrome','63.0.3239.84','','2018-01-07 17:36:08',470),

(317,'logout_berhasil','36.73.90.218','Windows 7','Firefox','57.0','','2018-01-07 19:38:30',526),

(318,'logout_berhasil','36.73.90.218','Windows 8.1','Firefox','51.0','','2018-01-07 20:09:44',519),

(319,'logout_berhasil','36.81.11.200','Windows 7','Firefox','57.0','','2018-01-07 20:50:23',482),

(320,'logout_berhasil','36.80.251.191','Windows 7','Chrome','56.0.2924.87','','2018-01-07 21:44:07',46),

(321,'logout_berhasil','115.178.255.6','Windows 7','Firefox','57.0','','2018-01-07 22:33:23',357),

(322,'logout_berhasil','36.73.90.218','Windows 8.1','Chrome','57.0.2987.98','','2018-01-07 23:20:05',491),

(323,'logout_berhasil','120.188.72.83','Windows 7','Firefox','57.0','','2018-01-08 06:31:08',93),

(324,'logout_berhasil','36.73.110.7','Windows 7','Firefox','58.0','','2018-01-08 08:05:35',520),

(325,'logout_berhasil','120.188.72.83','Windows 7','Firefox','57.0','','2018-01-08 08:32:31',93),

(326,'logout_berhasil','120.188.81.212','Windows 8.1','Chrome','63.0.3239.84','','2018-01-08 10:12:38',517),

(327,'logout_berhasil','115.178.235.17','Windows 10','Chrome','63.0.3239.84','','2018-01-08 10:34:04',515),

(328,'logout_berhasil','180.247.33.70','Windows 7','Chrome','63.0.3239.84','','2018-01-08 11:17:50',564),

(329,'logout_berhasil','36.73.110.7','Windows 7','Firefox','58.0','','2018-01-08 11:33:09',520),

(330,'logout_berhasil','36.81.11.200','Windows 7','Firefox','57.0','','2018-01-08 11:50:34',482),

(331,'logout_berhasil','180.247.33.70','Windows 7','Chrome','63.0.3239.132','','2018-01-08 13:07:32',547),

(332,'logout_berhasil','180.247.33.70','Windows 7','Firefox','57.0','','2018-01-08 13:54:02',342),

(333,'logout_berhasil','115.178.235.17','Windows 10','Chrome','63.0.3239.84','','2018-01-08 14:03:25',515),

(334,'logout_berhasil','115.178.235.17','Windows 7','Firefox','57.0','','2018-01-08 14:15:24',357),

(335,'logout_berhasil','36.80.140.166','Windows 7','Chrome','57.0.2987.98','','2018-01-08 14:25:23',508),

(336,'logout_berhasil','36.80.140.166','Windows 7','Chrome','57.0.2987.98','','2018-01-08 14:26:43',343),

(337,'login_gagal','180.247.33.70','Windows 7','Chrome','63.0.3239.84','','2018-01-08 15:18:14',0),

(338,'logout_berhasil','180.247.33.70','Windows 7','Chrome','63.0.3239.84','','2018-01-08 15:52:00',564),

(339,'logout_berhasil','180.247.33.70','Windows 7','Chrome','63.0.3239.84','','2018-01-08 15:54:00',564),

(340,'logout_berhasil','36.80.251.191','Windows 7','Chrome','57.0.2987.98','','2018-01-08 15:58:45',536),

(341,'logout_berhasil','36.81.11.200','Windows 7','Firefox','57.0','','2018-01-08 16:15:03',482),

(342,'logout_berhasil','36.73.90.218','Windows 7','Chrome','56.0.2924.87','','2018-01-08 16:18:48',528),

(343,'logout_berhasil','36.73.90.218','Windows 7','Chrome','63.0.3239.132','','2018-01-08 16:57:30',528),

(344,'logout_berhasil','180.247.33.70','Windows 7','Chrome','63.0.3239.84','','2018-01-08 17:10:47',564),

(345,'logout_berhasil','36.73.90.218','Windows 8.1','Firefox','57.0','','2018-01-08 17:11:45',9),

(346,'logout_berhasil','36.80.251.191','Windows 7','Chrome','57.0.2987.98','','2018-01-08 17:13:40',535),

(347,'logout_berhasil','125.166.234.158','Windows 7','Firefox','57.0','','2018-01-08 17:22:55',502),

(348,'logout_berhasil','180.254.61.99','Windows 7','Firefox','57.0','','2018-01-08 17:45:01',490),

(349,'logout_berhasil','180.254.61.99','Windows 7','Chrome','63.0.3239.84','','2018-01-08 17:49:06',395),

(350,'logout_berhasil','36.73.90.218','Windows 10','Chrome','63.0.3239.132','','2018-01-08 18:07:19',474),

(351,'logout_berhasil','180.254.61.99','Windows 7','Chrome','63.0.3239.84','','2018-01-08 18:21:06',395),

(352,'logout_berhasil','36.73.110.7','Windows 7','Firefox','58.0','','2018-01-08 18:30:07',520),

(353,'logout_berhasil','180.247.33.70','Windows 7','Chrome','63.0.3239.132','','2018-01-08 18:34:09',547),

(354,'logout_berhasil','36.80.140.166','Windows 10','Chrome','57.0.2987.98','','2018-01-08 18:36:15',512),

(355,'logout_berhasil','36.80.140.166','Windows 7','Chrome','57.0.2987.98','','2018-01-08 18:37:29',394),

(356,'logout_berhasil','36.80.140.166','Windows 7','Chrome','57.0.2987.98','','2018-01-08 18:38:52',NULL),

(357,'logout_berhasil','36.80.140.166','Windows 7','Chrome','63.0.3239.84','','2018-01-08 19:02:41',438),

(358,'logout_berhasil','36.73.110.7','Windows 10','Chrome','63.0.3239.132','','2018-01-08 19:25:45',475),

(359,'logout_berhasil','180.254.61.99','Windows 7','Chrome','63.0.3239.84','','2018-01-08 19:31:14',492),

(360,'logout_berhasil','125.161.115.218','Windows 7','Chrome','63.0.3239.84','','2018-01-08 19:32:36',345),

(361,'logout_berhasil','36.73.90.218','Windows 7','Chrome','56.0.2924.87','','2018-01-08 19:48:44',545),

(362,'logout_berhasil','36.80.140.166','Windows 7','Chrome','63.0.3239.84','','2018-01-08 19:51:35',513),

(363,'logout_berhasil','36.80.140.166','Windows XP','Firefox','52.0','','2018-01-08 19:55:57',343),

(364,'logout_berhasil','36.80.251.191','Windows 7','Chrome','57.0.2987.98','','2018-01-08 20:19:48',535),

(365,'logout_berhasil','36.73.90.218','Windows 10','Firefox','57.0','','2018-01-08 20:30:44',474),

(366,'logout_berhasil','36.80.251.191','Windows 7','Chrome','57.0.2987.98','','2018-01-08 20:49:02',535),

(367,'logout_berhasil','180.254.61.99','Windows 8.1','Chrome','63.0.3239.84','','2018-01-08 20:54:29',492),

(368,'logout_berhasil','36.73.110.7','Windows 7','Firefox','57.0','','2018-01-08 20:59:22',521),

(369,'logout_berhasil','180.254.61.99','Windows 10','Chrome','57.0.2987.98','','2018-01-08 21:08:01',514),

(370,'logout_berhasil','36.81.11.200','Windows 7','Firefox','58.0','','2018-01-08 21:14:11',NULL),

(371,'logout_berhasil','36.81.11.200','Windows 7','Chrome','63.0.3239.84','','2018-01-08 21:19:01',NULL),

(372,'logout_berhasil','115.178.235.17','Windows 7','Firefox','57.0','','2018-01-08 21:24:32',357),

(373,'logout_berhasil','125.166.234.158','Windows 7','Chrome','58.0.2988.0','','2018-01-08 21:25:59',501),

(374,'logout_berhasil','36.81.11.200','Windows 7','Firefox','57.0','','2018-01-08 21:27:32',482),

(375,'logout_berhasil','125.166.234.158','Windows 7','Firefox','57.0','','2018-01-08 21:30:53',NULL),

(376,'logout_berhasil','115.178.235.17','Windows 7','Chrome','57.0.2987.98','','2018-01-08 21:47:28',360),

(377,'logout_berhasil','125.166.234.158','Windows 7','Chrome','63.0.3239.132','','2018-01-08 22:12:17',54),

(378,'logout_berhasil','36.81.11.200','Windows 7','Firefox','57.0','','2018-01-08 22:19:34',482),

(379,'logout_berhasil','36.73.90.218','Windows 8.1','Chrome','57.0.2987.98','','2018-01-08 22:46:49',491),

(380,'logout_berhasil','36.80.140.166','Windows 7','Chrome','57.0.2987.98','','2018-01-08 23:27:56',394),

(381,'logout_berhasil','36.80.140.166','Windows 7','Chrome','63.0.3239.84','','2018-01-08 23:28:30',422),

(382,'logout_berhasil','115.178.235.17','Windows 7','Chrome','57.0.2987.98','','2018-01-09 03:28:57',360),

(383,'logout_berhasil','115.178.235.17','Windows 7','Firefox','57.0','','2018-01-09 03:32:36',357),

(384,'logout_berhasil','202.67.40.222','Windows 7','Chrome','63.0.3239.84','','2018-01-09 05:35:58',551),

(385,'logout_berhasil','36.73.70.174','Windows 7','Firefox','58.0','','2018-01-09 07:58:21',526),

(386,'logout_berhasil','36.73.70.174','Windows 10','Chrome','63.0.3239.132','','2018-01-09 07:59:45',474),

(387,'logout_berhasil','36.73.64.245','Windows 7','Firefox','57.0','','2018-01-09 08:57:12',469),

(388,'login_gagal','36.73.64.245','Windows 7','Firefox','57.0','','2018-01-09 08:57:39',0),

(389,'login_gagal','36.73.64.245','Windows 7','Firefox','57.0','','2018-01-09 08:58:17',490),

(390,'logout_berhasil','36.80.140.166','Windows XP','Firefox','52.0','','2018-01-09 09:07:49',343),

(391,'logout_berhasil','36.80.140.166','Windows XP','Firefox','52.0','','2018-01-09 09:13:11',510),

(392,'logout_berhasil','36.73.70.174','Windows 7','Firefox','58.0','','2018-01-09 09:58:27',528),

(393,'logout_berhasil','180.247.33.70','Windows 7','Firefox','57.0','','2018-01-09 10:43:13',454),

(394,'login_gagal','36.73.64.245','Windows 7','Chrome','63.0.3239.84','','2018-01-09 10:50:05',395),

(395,'logout_berhasil','36.80.140.166','Windows 7','Chrome','63.0.3239.132','','2018-01-09 11:06:56',513),

(396,'logout_berhasil','36.73.70.174','Windows 8.1','Firefox','57.0','','2018-01-09 11:23:57',9),

(397,'logout_berhasil','36.73.70.174','Windows 10','Chrome','63.0.3239.132','','2018-01-09 11:32:46',474),

(398,'logout_berhasil','36.73.70.174','Windows 10','Firefox','57.0','','2018-01-09 11:36:47',25),

(399,'logout_berhasil','36.73.70.174','Windows 10','Chrome','63.0.3239.132','','2018-01-09 12:55:34',474),

(400,'logout_berhasil','36.80.250.129','Windows 7','Firefox','57.0','','2018-01-09 13:25:23',93),

(401,'logout_berhasil','125.161.115.218','Windows 7','Chrome','56.0.2924.87','','2018-01-09 13:41:09',409),

(402,'logout_berhasil','36.72.214.137','Windows 7','Chrome','56.0.2924.87','','2018-01-09 14:27:04',NULL),

(403,'logout_berhasil','36.80.140.166','Windows 7','Chrome','57.0.2987.98','','2018-01-09 14:31:01',452),

(404,'logout_berhasil','125.161.115.218','Windows 7','Firefox','57.0','','2018-01-09 14:33:14',398),

(405,'login_gagal','36.73.70.174','Windows 8.1','Chrome','63.0.3239.84','','2018-01-09 14:47:10',522),

(406,'logout_berhasil','36.80.250.129','Windows 7','Firefox','57.0','','2018-01-09 14:53:09',481),

(407,'logout_berhasil','125.161.115.218','Windows 7','Chrome','56.0.2924.87','','2018-01-09 14:56:31',409),

(408,'logout_berhasil','36.73.70.174','Windows 10','Chrome','63.0.3239.132','','2018-01-09 15:23:01',474),

(409,'logout_berhasil','36.73.70.174','Windows 10','Chrome','63.0.3239.132','','2018-01-09 15:29:25',474),

(410,'logout_berhasil','36.73.64.245','Windows 7','Firefox','57.0','','2018-01-09 16:28:09',469),

(411,'logout_berhasil','36.73.64.245','Windows 7','Firefox','57.0','','2018-01-09 16:34:55',470),

(412,'logout_berhasil','36.80.250.129','Windows 7','Chrome','63.0.3239.84','','2018-01-09 16:37:02',NULL),

(413,'logout_berhasil','180.254.19.27','Windows 7','Chrome','63.0.3239.132','','2018-01-09 16:39:26',513),

(414,'logout_berhasil','36.73.70.174','Windows 10','Firefox','57.0','','2018-01-09 16:51:57',558),

(415,'logout_berhasil','36.73.70.174','Windows 10','Firefox','57.0','','2018-01-09 16:53:24',25),

(416,'logout_berhasil','180.246.42.172','Windows 7','Chrome','63.0.3239.132','','2018-01-09 17:03:37',500),

(417,'logout_berhasil','36.80.250.129','Windows 7','Firefox','58.0','','2018-01-09 17:06:14',480),

(418,'login_gagal','36.80.181.29','Windows 7','Chrome','57.0.2987.98','','2018-01-09 17:12:50',505),

(419,'login_gagal','36.80.181.29','Windows 7','Chrome','57.0.2987.98','','2018-01-09 17:13:00',505),

(420,'login_gagal','36.80.181.29','Windows 7','Chrome','57.0.2987.98','','2018-01-09 17:13:21',505),

(421,'login_gagal','36.80.181.29','Windows 7','Chrome','57.0.2987.98','','2018-01-09 17:13:45',505),

(422,'logout_berhasil','125.160.215.144','Windows 8.1','Firefox','57.0','','2018-01-09 17:14:20',345),

(423,'logout_berhasil','180.246.42.172','Windows 7','Chrome','63.0.3239.132','','2018-01-09 17:14:28',500),

(424,'logout_berhasil','36.72.214.137','Windows 7','Chrome','57.0.2987.98','','2018-01-09 17:17:14',535),

(425,'logout_berhasil','180.248.33.184','Windows 7','Firefox','57.0','','2018-01-09 17:19:16',418),

(426,'logout_berhasil','36.80.250.129','Windows 7','Firefox','57.0','','2018-01-09 17:24:19',NULL),

(427,'logout_berhasil','36.73.64.245','Windows 7','Chrome','63.0.3239.84','','2018-01-09 17:24:23',NULL),

(428,'logout_berhasil','36.80.250.129','Windows 10','Opera','49.0.2725.64','','2018-01-09 17:24:24',482),

(429,'logout_berhasil','36.73.70.174','Windows 7','Firefox','57.0','','2018-01-09 17:24:38',80),

(430,'logout_berhasil','36.73.70.174','Windows 7','Chrome','56.0.2924.87','','2018-01-09 17:38:24',545),

(431,'logout_berhasil','36.73.70.174','Windows 7','Chrome','63.0.3239.132','','2018-01-09 17:42:10',525),

(432,'logout_berhasil','36.73.58.220','Windows 7','Firefox','57.0','','2018-01-09 17:47:24',NULL),

(433,'logout_berhasil','118.96.169.2','Windows 7','Chrome','57.0.2987.98','','2018-01-09 17:54:25',505),

(434,'login_gagal','118.96.169.2','Windows 7','Chrome','57.0.2987.98','','2018-01-09 17:58:59',505),

(435,'login_gagal','118.96.169.2','Windows 7','Chrome','57.0.2987.98','','2018-01-09 17:59:24',505),

(436,'login_gagal','118.96.169.2','Windows 7','Chrome','57.0.2987.98','','2018-01-09 17:59:52',505),

(437,'login_gagal','118.96.169.2','Windows 7','Chrome','57.0.2987.98','','2018-01-09 18:00:11',505),

(438,'login_gagal','118.96.169.2','Windows 7','Chrome','57.0.2987.98','','2018-01-09 18:00:37',505),

(439,'logout_berhasil','180.246.42.172','Windows 7','Firefox','57.0','','2018-01-09 18:01:50',498),

(440,'logout_berhasil','125.160.215.144','Windows 7','Chrome','63.0.3239.84','','2018-01-09 18:32:10',397),

(441,'logout_berhasil','180.246.42.172','Windows 7','Firefox','57.0','','2018-01-09 18:32:35',577),

(442,'logout_berhasil','36.80.250.129','Windows 10','Firefox','57.0','','2018-01-09 18:39:25',485),

(443,'logout_berhasil','180.246.42.172','Windows 7','Chrome','63.0.3239.84','','2018-01-09 19:18:20',NULL),

(444,'logout_berhasil','36.73.64.245','Windows 8.1','Chrome','63.0.3239.84','','2018-01-09 19:22:39',492),

(445,'logout_berhasil','180.248.33.184','Windows 7','Chrome','63.0.3239.132','','2018-01-09 19:36:42',547),

(446,'logout_berhasil','110.136.171.220','Windows 7','Chrome','63.0.3239.132','','2018-01-09 19:40:45',513),

(447,'logout_berhasil','110.136.171.220','Windows 7','Firefox','57.0','','2018-01-09 19:55:28',NULL),

(448,'login_gagal','110.136.171.220','Windows 7','Chrome','63.0.3239.132','','2018-01-09 20:03:39',0),

(449,'logout_berhasil','180.248.33.184','Windows 7','Firefox','57.0','','2018-01-09 20:17:19',570),

(450,'logout_berhasil','36.73.70.174','Windows 10','Chrome','63.0.3239.132','','2018-01-09 20:33:28',474),

(451,'logout_berhasil','180.246.42.172','Windows 7','Chrome','58.0.2988.0','','2018-01-09 20:47:40',501),

(452,'logout_berhasil','110.136.171.220','Windows 7','Chrome','57.0.2987.98','','2018-01-09 21:02:33',511),

(453,'logout_berhasil','110.136.171.220','Windows 7','Chrome','63.0.3239.132','','2018-01-09 21:13:48',513),

(454,'logout_berhasil','110.136.171.220','Windows 7','Chrome','63.0.3239.132','','2018-01-09 21:21:20',508),

(455,'logout_berhasil','180.248.33.184','Windows 7','Firefox','57.0','','2018-01-09 21:24:32',454),

(456,'logout_berhasil','110.136.171.220','Windows 8.1','Chrome','63.0.3239.132','','2018-01-09 21:26:04',394),

(457,'logout_berhasil','110.136.171.220','Windows 7','Chrome','57.0.2987.98','','2018-01-09 21:31:32',505),

(458,'logout_berhasil','110.136.171.220','Windows 8.1','Chrome','63.0.3239.132','','2018-01-09 21:33:12',504),

(459,'logout_berhasil','110.136.171.220','Windows 10','Chrome','57.0.2987.98','','2018-01-09 21:43:02',512),

(460,'logout_berhasil','36.73.64.245','Windows 7','Chrome','63.0.3239.84','','2018-01-09 21:52:42',NULL),

(461,'logout_berhasil','36.73.58.220','Windows 7','Firefox','57.0','','2018-01-09 21:57:41',520),

(462,'logout_berhasil','36.73.64.245','Windows 8.1','Chrome','63.0.3239.84','','2018-01-09 22:25:33',492),

(463,'logout_berhasil','36.73.64.245','Windows 7','Firefox','57.0','','2018-01-09 22:52:58',NULL),

(464,'logout_berhasil','115.178.255.171','Windows 7','Chrome','57.0.2987.98','','2018-01-10 00:43:40',360),

(465,'logout_berhasil','36.73.70.174','Windows 10','Chrome','63.0.3239.132','','2018-01-10 08:44:23',474),

(466,'logout_berhasil','140.0.68.107','Windows 7','Firefox','57.0','','2018-01-10 08:56:23',454),

(467,'logout_berhasil','36.81.54.201','Windows 7','Chrome','57.0.2987.98','','2018-01-10 08:58:46',535),

(468,'logout_berhasil','36.72.218.151','Windows 7','Chrome','63.0.3239.132','','2018-01-10 09:08:16',513),

(469,'logout_berhasil','36.73.33.132','Windows 7','Chrome','63.0.3239.132','','2018-01-10 10:47:43',513),

(470,'logout_berhasil','36.73.70.174','Windows 8.1','Firefox','57.0','','2018-01-10 12:29:27',9),

(471,'logout_berhasil','36.73.70.174','Windows 7','Chrome','63.0.3239.132','','2018-01-10 12:34:59',353),

(472,'logout_berhasil','36.73.33.132','Windows 7','Chrome','63.0.3239.132','','2018-01-10 13:26:28',513),

(473,'logout_berhasil','180.248.33.184','Windows 7','Chrome','63.0.3239.132','','2018-01-10 13:34:07',373),

(474,'logout_berhasil','36.73.33.132','Windows 7','Chrome','63.0.3239.132','','2018-01-10 13:45:36',513),

(475,'logout_berhasil','180.248.33.184','Windows 7','Firefox','57.0','','2018-01-10 13:50:41',549),

(476,'logout_berhasil','36.73.70.174','Windows 7','Chrome','56.0.2924.87','','2018-01-10 14:13:11',39),

(477,'logout_berhasil','36.73.70.174','Windows 8.1','Chrome','63.0.3239.84','','2018-01-10 14:37:21',525),

(478,'logout_berhasil','36.73.33.132','Windows 7','Chrome','57.0.2987.98','','2018-01-10 14:54:47',NULL),

(479,'login_gagal','180.246.196.11','Windows 7','Chrome','63.0.3239.132','','2018-01-10 15:04:39',534),

(480,'logout_berhasil','36.80.250.129','Windows 7','Firefox','57.0','','2018-01-10 15:25:16',93),

(481,'logout_berhasil','36.73.151.207','Windows 7','Chrome','63.0.3239.132','','2018-01-10 15:29:26',54),

(482,'logout_berhasil','36.80.250.129','Windows 7','Firefox','57.0','','2018-01-10 15:34:45',93),

(483,'logout_berhasil','36.73.99.49','Windows 7','Firefox','57.0','','2018-01-10 16:24:17',469),

(484,'logout_berhasil','180.248.33.184','Windows 7','Firefox','57.0','','2018-01-10 17:03:47',342),

(485,'logout_berhasil','180.248.33.184','Windows 7','Chrome','63.0.3239.84','','2018-01-10 17:06:03',564),

(486,'logout_berhasil','36.73.99.49','Windows 7','Chrome','63.0.3239.132','','2018-01-10 17:08:01',395),

(487,'logout_berhasil','36.73.33.132','Windows 8.1','Chrome','63.0.3239.132','','2018-01-10 17:12:31',NULL),

(488,'logout_berhasil','36.73.151.207','Windows 7','Chrome','63.0.3239.132','','2018-01-10 17:13:45',500),

(489,'logout_berhasil','36.73.99.49','Windows 7','Chrome','63.0.3239.84','','2018-01-10 17:16:25',470),

(490,'logout_berhasil','36.73.99.49','Windows 7','Firefox','57.0','','2018-01-10 17:17:20',490),

(491,'logout_berhasil','180.248.33.184','Windows 7','Chrome','63.0.3239.132','','2018-01-10 17:27:11',547),

(492,'logout_berhasil','36.73.33.132','Windows 7','Chrome','63.0.3239.132','','2018-01-10 17:28:44',508),

(493,'logout_berhasil','36.73.33.132','Windows 7','Chrome','63.0.3239.132','','2018-01-10 17:37:12',422),

(494,'logout_berhasil','36.73.33.132','Windows 7','Firefox','57.0','','2018-01-10 17:44:13',505),

(495,'logout_berhasil','36.73.99.49','Windows 8.1','Chrome','57.0.2987.98','','2018-01-10 17:52:14',492),

(496,'logout_berhasil','36.80.250.129','Windows 7','Firefox','58.0','','2018-01-10 18:01:37',451),

(497,'logout_berhasil','180.248.33.184','Windows 7','Firefox','57.0','','2018-01-10 18:05:27',418),

(498,'logout_berhasil','36.73.33.132','Windows 10','Chrome','57.0.2987.98','','2018-01-10 18:38:24',512),

(499,'logout_berhasil','36.80.250.129','Windows 7','Firefox','57.0','','2018-01-10 18:53:24',93),

(500,'logout_berhasil','180.246.196.11','Windows 7','Chrome','56.0.2924.87','','2018-01-11 08:57:42',46),

(501,'logout_berhasil','180.246.196.11','Windows 8.1','Chrome','63.0.3239.132','','2018-01-11 09:17:30',46),

(502,'login_gagal','36.73.99.49','Windows 7','Firefox','57.0','','2018-01-11 09:38:36',470),

(503,'logout_berhasil','36.80.173.149','Windows 7','Chrome','63.0.3239.132','','2018-01-11 09:45:24',511),

(504,'logout_berhasil','36.73.70.174','Windows 10','Chrome','58.0.3014.0','','2018-01-11 09:59:25',474),

(505,'logout_berhasil','36.73.70.174','Windows 7','Chrome','63.0.3239.132','','2018-01-11 10:03:45',353),

(506,'logout_berhasil','125.164.35.210','Windows 7','Firefox','57.0','','2018-01-11 11:32:42',NULL),

(507,'login_gagal','125.164.35.210','Windows 7','Firefox','57.0','','2018-01-11 11:33:06',69),

(508,'logout_berhasil','36.80.250.129','Windows 7','Firefox','57.0','','2018-01-11 11:38:44',482),

(509,'logout_berhasil','125.164.35.210','Windows 7','Firefox','57.0','','2018-01-11 12:10:59',69),

(510,'logout_berhasil','36.73.70.174','Windows 8.1','Chrome','63.0.3239.132','','2018-01-11 12:41:36',528),

(511,'logout_berhasil','115.178.236.59','Windows 10','Chrome','63.0.3239.84','','2018-01-11 13:12:48',NULL),

(512,'logout_berhasil','36.73.70.174','Windows 7','Firefox','58.0','','2018-01-11 14:19:37',529),

(513,'logout_berhasil','36.73.99.49','Windows 7','Chrome','63.0.3239.132','','2018-01-11 15:18:26',395),

(514,'logout_berhasil','36.73.70.174','Windows 8.1','Chrome','63.0.3239.132','','2018-01-11 15:53:21',474),

(515,'logout_berhasil','36.80.131.78','Windows 7','Firefox','57.0','','2018-01-11 15:57:37',508),

(516,'logout_berhasil','36.73.99.49','Windows 7','Firefox','57.0','','2018-01-11 16:19:19',469),

(517,'logout_berhasil','36.73.99.49','Windows 7','Firefox','57.0','','2018-01-11 16:20:58',469),

(518,'logout_berhasil','36.73.99.49','Windows 7','Firefox','57.0','','2018-01-11 16:21:19',490),

(519,'logout_berhasil','36.73.99.49','Windows 7','Firefox','57.0','','2018-01-11 16:29:05',469),

(520,'logout_berhasil','36.73.99.49','Windows 7','Firefox','57.0','','2018-01-11 16:37:46',490),

(521,'logout_berhasil','36.73.70.174','Windows 7','Chrome','63.0.3239.132','','2018-01-11 16:37:53',579),

(522,'logout_berhasil','125.163.222.189','Windows 7','Chrome','58.0.2988.0','','2018-01-11 16:45:02',NULL),

(523,'logout_berhasil','36.80.131.78','Windows 7','Chrome','63.0.3239.132','','2018-01-11 17:00:36',511),

(524,'logout_berhasil','36.73.70.174','Windows 7','Firefox','57.0','','2018-01-11 17:01:49',80),

(525,'logout_berhasil','36.73.70.174','Windows 10','Chrome','63.0.3239.132','','2018-01-11 17:02:10',474),

(526,'logout_berhasil','36.73.70.174','Windows 7','Chrome','63.0.3239.132','','2018-01-11 17:02:18',579),

(527,'logout_berhasil','36.73.70.174','Windows 7','Chrome','56.0.2924.87','','2018-01-11 17:13:04',NULL),

(528,'logout_berhasil','180.246.196.11','Windows 7','Chrome','57.0.2987.98','','2018-01-11 17:13:36',535),

(529,'logout_berhasil','125.164.35.210','Windows 7','Firefox','57.0','','2018-01-11 17:16:05',NULL),

(530,'logout_berhasil','36.73.99.49','Windows 7','Firefox','57.0','','2018-01-11 17:17:30',490),

(531,'logout_berhasil','125.164.35.210','Windows 8.1','Chrome','63.0.3239.132','','2018-01-11 17:26:18',578),

(532,'login_gagal','125.164.35.210','Windows 8.1','Chrome','63.0.3239.132','','2018-01-11 17:26:41',568),

(533,'logout_berhasil','125.164.35.210','Windows 8.1','Chrome','63.0.3239.132','','2018-01-11 17:27:07',578),

(534,'logout_berhasil','125.163.222.189','Windows 7','Chrome','63.0.3239.132','','2018-01-11 17:29:00',500),

(535,'logout_berhasil','125.164.35.210','Windows 8.1','Chrome','63.0.3239.132','','2018-01-11 17:34:11',578),

(536,'logout_berhasil','125.163.222.189','Windows 7','Chrome','63.0.3239.132','','2018-01-11 17:35:44',502),

(537,'logout_berhasil','125.163.222.189','Windows 7','Firefox','57.0','','2018-01-11 17:36:14',58),

(538,'logout_berhasil','180.246.196.11','Windows 7','Chrome','56.0.2924.87','','2018-01-11 18:12:24',46),

(539,'logout_berhasil','125.164.35.210','Windows 10','Spartan','16.16299','','2018-01-11 18:33:38',546),

(540,'logout_berhasil','125.164.35.210','Windows 7','Chrome','63.0.3239.132','','2018-01-11 18:38:30',564),

(541,'logout_berhasil','36.80.131.78','Windows 7','Firefox','57.0','','2018-01-11 18:48:21',505),

(542,'logout_berhasil','125.164.35.210','Windows 7','Chrome','63.0.3239.132','','2018-01-11 18:53:06',547),

(543,'logout_berhasil','36.80.131.78','Windows 7','Firefox','57.0','','2018-01-11 19:49:06',422),

(544,'logout_berhasil','125.164.35.210','Windows 7','Firefox','57.0','','2018-01-11 20:22:34',570),

(545,'logout_berhasil','114.142.168.32','Windows 8.1','Firefox','57.0','','2018-01-11 22:09:07',80),

(546,'logout_berhasil','36.73.99.49','Windows 7','Firefox','57.0','','2018-01-12 08:22:26',469),

(547,'logout_berhasil','120.188.87.77','Windows 10','Firefox','57.0','','2018-01-12 08:43:02',520),

(548,'logout_berhasil','36.73.70.174','Windows 10','Chrome','58.0.3014.0','','2018-01-12 09:26:06',474),

(549,'logout_berhasil','36.79.76.169','Windows 7','Chrome','63.0.3239.132','','2018-01-12 09:33:03',422),

(550,'logout_berhasil','36.73.70.174','Windows 8.1','Chrome','63.0.3239.132','','2018-01-12 11:21:25',474),

(551,'logout_berhasil','36.73.70.174','Windows 8.1','Chrome','63.0.3239.132','','2018-01-12 11:21:28',474),

(552,'logout_berhasil','36.73.70.174','Windows 7','Firefox','58.0','','2018-01-12 11:33:15',523),

(553,'login_gagal','180.246.57.82','Windows 7','Chrome','63.0.3239.132','','2018-01-12 14:03:50',508),

(554,'logout_berhasil','36.73.70.174','Windows 8.1','Chrome','63.0.3239.132','','2018-01-12 14:54:22',474),

(555,'logout_berhasil','36.73.70.174','Windows 8.1','Chrome','63.0.3239.132','','2018-01-12 14:54:26',NULL),

(556,'logout_berhasil','36.73.58.220','Windows 7','Firefox','57.0','','2018-01-12 15:24:57',523),

(557,'logout_berhasil','125.164.35.210','Windows 7','Firefox','57.0','','2018-01-12 15:36:48',NULL),

(558,'logout_berhasil','36.73.99.49','Windows 7','Firefox','57.0','','2018-01-12 16:34:32',470),

(559,'logout_berhasil','36.73.207.195','Windows 7','Firefox','57.0','','2018-01-12 17:00:55',342),

(560,'logout_berhasil','36.73.207.195','Windows 7','Chrome','63.0.3239.132','','2018-01-12 17:05:25',549),

(561,'logout_berhasil','36.73.207.195','Windows 7','Chrome','63.0.3239.132','','2018-01-12 17:05:25',564),

(562,'logout_berhasil','36.73.207.195','Windows 7','Chrome','63.0.3239.132','','2018-01-12 17:08:41',547),

(563,'logout_berhasil','180.246.57.82','Windows 7','Chrome','63.0.3239.132','','2018-01-12 17:19:40',508),

(564,'logout_berhasil','36.73.99.49','Windows 7','Chrome','63.0.3239.132','','2018-01-12 17:22:15',470),

(565,'logout_berhasil','36.73.99.49','Windows 7','Chrome','56.0.2924.87','','2018-01-12 17:25:29',490),

(566,'logout_berhasil','36.73.99.49','Windows 7','Firefox','57.0','','2018-01-12 17:26:11',NULL),

(567,'logout_berhasil','36.73.99.49','Windows 10','Chrome','57.0.2987.98','','2018-01-12 17:30:27',514),

(568,'logout_berhasil','36.79.33.162','Windows 7','Chrome','63.0.3239.132','','2018-01-12 17:35:20',54),

(569,'logout_berhasil','36.79.33.162','Windows 7','Chrome','63.0.3239.132','','2018-01-12 17:36:08',11),

(570,'logout_berhasil','180.246.57.82','Windows 7','Firefox','57.0','','2018-01-12 17:42:29',505),

(571,'logout_berhasil','36.71.81.116','Windows 7','Firefox','57.0','','2018-01-12 17:44:37',344),

(572,'logout_berhasil','36.73.207.195','Windows 7','Firefox','57.0','','2018-01-12 17:52:29',342),

(573,'logout_berhasil','36.73.70.174','Windows 10','Chrome','63.0.3239.132','','2018-01-12 17:53:31',545),

(574,'logout_berhasil','36.80.250.129','Windows 7','Firefox','58.0','','2018-01-12 18:08:24',480),

(575,'logout_berhasil','36.73.70.174','Windows 8.1','Chrome','57.0.2987.98','','2018-01-12 18:22:13',491),

(576,'logout_berhasil','180.246.57.82','Windows 7','Chrome','57.0.2987.98','','2018-01-12 18:25:38',NULL),

(577,'logout_berhasil','36.80.250.129','Windows 10','Chrome','63.0.3239.132','','2018-01-12 18:32:57',455),

(578,'logout_berhasil','36.79.33.162','Windows 7','Chrome','63.0.3239.132','','2018-01-12 18:46:47',11),

(579,'logout_berhasil','180.246.196.11','Windows 10','Firefox','57.0','','2018-01-12 18:55:55',425),

(580,'login_gagal','180.246.196.11','Windows 10','Firefox','57.0','','2018-01-12 18:56:03',425),

(581,'logout_berhasil','180.246.196.11','Windows 10','Firefox','57.0','','2018-01-12 18:56:20',425),

(582,'login_gagal','180.246.196.11','Windows 10','Firefox','57.0','','2018-01-12 18:56:48',542),

(583,'logout_berhasil','36.79.33.162','Windows 7','Chrome','63.0.3239.132','','2018-01-12 19:25:55',500),

(584,'logout_berhasil','36.79.33.162','Windows 7','Firefox','57.0','','2018-01-12 19:33:21',58),

(585,'logout_berhasil','180.246.57.82','Windows 7','Chrome','63.0.3239.132','','2018-01-12 19:41:02',422),

(586,'logout_berhasil','36.73.207.195','Windows 7','Firefox','57.0','','2018-01-12 20:00:10',NULL),

(587,'logout_berhasil','36.73.70.174','Windows 10','Chrome','63.0.3239.132','','2018-01-12 20:00:17',NULL),

(588,'logout_berhasil','36.73.58.220','Windows 7','Chrome','63.0.3239.132','','2018-01-12 20:04:46',583),

(589,'login_gagal','36.73.58.220','Windows 7','Chrome','63.0.3239.132','','2018-01-12 20:04:58',583),

(590,'login_gagal','36.73.58.220','Windows 7','Chrome','63.0.3239.132','','2018-01-12 20:05:10',583),

(591,'login_gagal','36.73.58.220','Windows 7','Chrome','63.0.3239.132','','2018-01-12 20:05:24',583),

(592,'login_gagal','36.73.58.220','Windows 7','Chrome','63.0.3239.132','','2018-01-12 20:05:36',583),

(593,'login_gagal','36.73.58.220','Windows 7','Chrome','63.0.3239.132','','2018-01-12 20:05:50',583),

(594,'logout_berhasil','180.246.57.82','Windows 10','Chrome','57.0.2987.98','','2018-01-12 22:32:23',512),

(595,'logout_berhasil','36.73.58.220','Windows 7','Chrome','57.0.2987.98','','2018-01-12 22:50:48',585),

(596,'logout_berhasil','36.73.58.220','Windows 8.1','Chrome','57.0.2987.98','','2018-01-12 22:51:43',584),

(597,'logout_berhasil','36.73.99.49','Windows 7','Chrome','63.0.3239.132','','2018-01-13 08:46:00',395),

(598,'logout_berhasil','36.73.99.49','Windows 7','Chrome','52.0.2743.116','','2018-01-13 09:10:58',492),

(599,'logout_berhasil','202.67.41.249','Windows 7','Firefox','57.0','','2018-01-13 09:28:21',570),

(600,'logout_berhasil','36.73.58.220','Windows 7','Opera','49.0.2725.64','','2018-01-13 09:46:14',531),

(601,'logout_berhasil','36.73.58.220','Windows 7','Opera','49.0.2725.64','','2018-01-13 09:47:03',531),

(602,'login_gagal','36.73.58.220','Windows 7','Opera','49.0.2725.64','','2018-01-13 09:47:25',0),

(603,'logout_berhasil','36.73.58.220','Windows 10','Chrome','63.0.3239.132','','2018-01-13 09:47:47',475),

(604,'login_gagal','36.73.58.220','Windows 7','Opera','49.0.2725.64','','2018-01-13 09:48:01',0),

(605,'logout_berhasil','36.73.58.220','Windows 10','Chrome','63.0.3239.132','','2018-01-13 09:49:25',587),

(606,'logout_berhasil','115.178.236.138','Windows 10','Chrome','63.0.3239.132','','2018-01-13 09:54:59',515),

(607,'logout_berhasil','36.73.58.220','Windows 7','Opera','49.0.2725.64','','2018-01-13 10:12:12',475),

(608,'logout_berhasil','36.73.58.220','Windows 8.1','Chrome','57.0.2987.98','','2018-01-13 10:31:17',584),

(609,'logout_berhasil','36.73.70.174','Windows 10','Chrome','58.0.3014.0','','2018-01-13 10:37:50',NULL),

(610,'logout_berhasil','36.73.70.174','Windows 7','Chrome','56.0.2924.87','','2018-01-13 10:38:15',39),

(611,'logout_berhasil','36.73.70.174','Windows 7','Chrome','56.0.2924.87','','2018-01-13 10:39:42',474),

(612,'logout_berhasil','36.73.204.25','Windows 7','Chrome','63.0.3239.132','','2018-01-13 10:44:51',549),

(613,'logout_berhasil','36.73.204.25','Windows 7','Firefox','57.0','','2018-01-13 11:07:46',342),

(614,'logout_berhasil','36.73.58.220','Windows 10','Chrome','63.0.3239.132','','2018-01-13 11:30:22',531),

(615,'logout_berhasil','36.73.70.174','Windows 10','Firefox','57.0','','2018-01-13 11:34:18',558),

(616,'logout_berhasil','36.73.204.25','Windows 7','Chrome','63.0.3239.132','','2018-01-13 11:36:21',564),

(617,'logout_berhasil','36.73.70.174','Windows 10','Chrome','63.0.3239.132','','2018-01-13 11:36:43',474),

(618,'logout_berhasil','36.73.70.174','Windows 10','Chrome','63.0.3239.132','','2018-01-13 13:21:40',474),

(619,'login_gagal','36.73.99.49','Windows 7','Firefox','57.0','','2018-01-13 13:24:41',470),

(620,'logout_berhasil','180.246.57.82','Windows 7','Chrome','57.0.2987.98','','2018-01-13 13:30:07',NULL),

(621,'logout_berhasil','36.73.204.25','Windows 7','Chrome','63.0.3239.132','','2018-01-13 13:40:11',549),

(622,'logout_berhasil','36.73.204.25','Windows 7','Firefox','57.0','','2018-01-13 13:46:24',570),

(623,'logout_berhasil','36.79.33.162','Windows 7','Chrome','63.0.3239.132','','2018-01-13 15:13:32',11),

(624,'logout_berhasil','36.79.33.162','Windows 7','Chrome','63.0.3239.132','','2018-01-13 15:34:28',66),

(625,'logout_berhasil','36.79.33.162','Windows 7','Firefox','57.0','','2018-01-13 15:56:10',577),

(626,'logout_berhasil','36.80.250.129','Windows 7','Firefox','58.0','','2018-01-13 15:57:23',480),

(627,'logout_berhasil','36.73.70.174','Windows 7','Chrome','56.0.2924.87','','2018-01-13 16:23:44',529),

(628,'logout_berhasil','36.73.42.237','Windows 7','Firefox','57.0','','2018-01-13 16:28:37',469),

(629,'logout_berhasil','36.73.70.174','Windows 7','Chrome','56.0.2924.87','','2018-01-13 16:32:13',529),

(630,'logout_berhasil','36.71.81.116','Windows 7','Chrome','56.0.2924.87','','2018-01-13 16:41:07',409),

(631,'logout_berhasil','36.73.70.174','Windows 8.1','Chrome','63.0.3239.132','','2018-01-13 16:48:57',474),

(632,'logout_berhasil','36.73.70.174','Windows 8.1','Chrome','63.0.3239.132','','2018-01-13 16:52:01',474),

(633,'logout_berhasil','36.73.58.220','Windows 8.1','Chrome','63.0.3239.132','','2018-01-13 17:10:11',475),

(634,'logout_berhasil','36.79.33.162','Windows 7','Chrome','63.0.3239.132','','2018-01-13 17:12:45',11),

(635,'logout_berhasil','36.71.81.116','Windows 7','Chrome','56.0.2924.87','','2018-01-13 17:16:35',404),

(636,'logout_berhasil','36.80.250.129','Windows 7','Chrome','63.0.3239.132','','2018-01-13 17:21:07',72),

(637,'logout_berhasil','180.246.57.82','Windows 7','Firefox','57.0','','2018-01-13 17:25:15',505),

(638,'logout_berhasil','36.73.70.174','Windows 10','Firefox','57.0','','2018-01-13 17:29:23',NULL),

(639,'logout_berhasil','36.73.42.237','Windows 7','Chrome','56.0.2924.87','','2018-01-13 17:36:31',490),

(640,'logout_berhasil','180.246.57.82','Windows 7','Chrome','57.0.2987.98','','2018-01-13 17:56:29',452),

(641,'logout_berhasil','180.246.57.82','Windows 7','Firefox','57.0','','2018-01-13 17:56:52',355),

(642,'logout_berhasil','36.73.70.174','Windows 7','Chrome','56.0.2924.87','','2018-01-13 18:06:59',39),

(643,'logout_berhasil','36.80.250.129','Windows 10','Chrome','63.0.3239.132','','2018-01-13 18:13:50',455),

(644,'logout_berhasil','36.80.250.129','Windows 7','Firefox','57.0','','2018-01-13 18:24:41',482),

(645,'logout_berhasil','36.79.33.162','Windows 7','Firefox','57.0','','2018-01-13 18:25:53',58),

(646,'logout_berhasil','36.73.42.237','Windows 7','Chrome','63.0.3239.84','','2018-01-13 18:28:23',470),

(647,'logout_berhasil','36.73.70.174','Windows 8.1','Chrome','57.0.2987.98','','2018-01-13 18:39:08',491),

(648,'logout_berhasil','36.79.33.162','Windows 7','Chrome','63.0.3239.132','','2018-01-13 18:41:18',502),

(649,'logout_berhasil','36.73.42.237','Windows 7','Chrome','63.0.3239.132','','2018-01-13 18:45:45',492),

(650,'logout_berhasil','180.246.196.11','Windows 7','Chrome','57.0.2987.98','','2018-01-13 18:55:35',535),

(651,'logout_berhasil','36.73.70.174','Windows 8.1','Firefox','57.0','','2018-01-13 19:06:13',370),

(652,'logout_berhasil','36.79.33.162','Windows 7','Chrome','58.0.2988.0','','2018-01-13 19:08:09',NULL),

(653,'logout_berhasil','36.73.58.220','Windows 7','Chrome','63.0.3239.132','','2018-01-13 19:29:24',585),

(654,'logout_berhasil','180.246.57.82','Windows 7','Chrome','63.0.3239.132','','2018-01-13 19:41:37',422),

(655,'logout_berhasil','36.73.58.220','Windows 8.1','Chrome','63.0.3239.132','','2018-01-13 19:43:24',584),

(656,'logout_berhasil','180.246.57.82','Windows 7','Firefox','57.0','','2018-01-13 20:06:32',394),

(657,'logout_berhasil','36.79.33.162','Windows 7','Chrome','58.0.3029.81','','2018-01-13 20:31:36',499),

(658,'logout_berhasil','36.73.70.174','Windows 8.1','Firefox','51.0','','2018-01-13 21:35:04',519),

(659,'logout_berhasil','180.246.88.175','Windows 10','Chrome','57.0.2987.98','','2018-01-13 21:35:06',512),

(660,'logout_berhasil','120.188.76.3','Windows 7','Chrome','63.0.3239.132','','2018-01-13 23:32:51',502),

(661,'logout_berhasil','180.246.88.175','Windows 7','Firefox','57.0','','2018-01-14 08:08:16',505),

(662,'logout_berhasil','36.73.70.174','Windows 7','Chrome','56.0.2924.87','','2018-01-14 08:35:52',529),

(663,'logout_berhasil','120.188.38.25','Linux','Chrome','63.0.3239.111','','2018-01-14 08:56:03',11),

(664,'logout_berhasil','36.79.33.162','Windows 7','Chrome','63.0.3239.132','','2018-01-14 09:09:11',11),

(665,'logout_berhasil','36.79.33.162','Windows 7','Chrome','63.0.3239.132','','2018-01-14 09:12:36',11),

(666,'logout_berhasil','36.78.47.230','Windows 7','Chrome','56.0.2924.87','','2018-01-14 09:48:47',490),

(667,'logout_berhasil','36.78.47.230','Windows 7','Chrome','56.0.2924.87','','2018-01-14 09:52:10',490),

(668,'logout_berhasil','36.78.47.230','Windows 7','Chrome','56.0.2924.87','','2018-01-14 10:05:55',490),

(669,'logout_berhasil','36.73.58.220','Windows 7','Firefox','57.0','','2018-01-14 11:19:47',523),

(670,'logout_berhasil','180.246.88.175','Windows 7','Chrome','63.0.3239.132','','2018-01-14 11:30:26',511),

(671,'logout_berhasil','36.73.58.220','Windows 7','Chrome','63.0.3239.132','','2018-01-14 11:39:02',585),

(672,'logout_berhasil','120.188.77.221','Windows 7','Chrome','63.0.3239.132','','2018-01-14 12:05:34',502),

(673,'logout_berhasil','180.246.88.175','Windows 7','Chrome','57.0.2987.98','','2018-01-14 13:01:24',452),

(674,'logout_berhasil','36.73.58.220','Windows 7','Firefox','57.0','','2018-01-14 13:36:02',523),

(675,'logout_berhasil','36.73.70.174','Windows 7','Firefox','57.0','','2018-01-14 13:48:58',524),

(676,'logout_berhasil','120.188.86.38','Windows 7','Chrome','63.0.3239.132','','2018-01-14 14:57:55',502),

(677,'logout_berhasil','36.79.153.170','Windows 7','Chrome','63.0.3239.132','','2018-01-14 14:58:15',395),

(678,'logout_berhasil','36.73.70.174','Windows 10','Chrome','63.0.3239.132','','2018-01-14 14:58:45',474),

(679,'logout_berhasil','36.79.153.170','Windows 7','Firefox','57.0','','2018-01-14 15:01:21',469),

(680,'logout_berhasil','36.73.70.174','Windows 7','Chrome','63.0.3239.132','','2018-01-14 15:02:37',528),

(681,'logout_berhasil','36.79.153.170','Windows 7','Firefox','57.0','','2018-01-14 15:02:58',NULL),

(682,'logout_berhasil','36.73.58.220','Windows 7','Chrome','63.0.3239.132','','2018-01-14 15:10:52',585),

(683,'login_gagal','36.73.58.220','Windows 7','Chrome','63.0.3239.132','','2018-01-14 15:12:21',585),

(684,'logout_berhasil','36.73.58.220','Windows 7','Chrome','63.0.3239.132','','2018-01-14 15:12:44',585),

(685,'logout_berhasil','36.74.70.134','Windows 7','Firefox','57.0','','2018-01-14 16:36:28',570),

(686,'logout_berhasil','180.246.196.11','Windows 7','Chrome','57.0.2987.98','','2018-01-14 16:43:20',535),

(687,'logout_berhasil','36.79.33.162','Windows 7','Chrome','63.0.3239.132','','2018-01-14 17:00:30',54),

(688,'logout_berhasil','36.79.33.162','Windows 7','Chrome','63.0.3239.132','','2018-01-14 17:07:46',500),

(689,'logout_berhasil','36.79.33.162','Windows 7','Firefox','57.0','','2018-01-14 17:14:57',58),

(690,'logout_berhasil','36.79.33.162','Windows 7','Chrome','63.0.3239.132','','2018-01-14 17:16:57',500),

(691,'logout_berhasil','180.246.88.175','Windows 7','Chrome','63.0.3239.132','','2018-01-14 18:01:47',511),

(692,'logout_berhasil','115.178.237.155','Windows 7','Chrome','57.0.2987.98','','2018-01-14 18:51:10',360),

(693,'logout_berhasil','115.178.237.155','Windows 7','Chrome','57.0.2987.98','','2018-01-14 19:08:40',360),

(694,'logout_berhasil','36.73.58.220','Windows 7','Firefox','57.0','','2018-01-14 21:09:58',523),

(695,'logout_berhasil','36.73.58.220','Windows 7','Chrome','63.0.3239.132','','2018-01-14 21:38:11',585),

(696,'logout_berhasil','114.4.78.5','Windows 10','Chrome','63.0.3239.132','','2018-01-14 23:54:22',455),

(697,'logout_berhasil','120.188.86.38','Windows 7','Chrome','63.0.3239.132','','2018-01-15 00:11:39',502),

(698,'logout_berhasil','36.80.250.129','Windows 7','Firefox','57.0','','2018-01-15 08:18:27',482),

(699,'logout_berhasil','36.71.81.116','Windows 7','Firefox','57.0','','2018-01-15 09:05:00',399),

(700,'logout_berhasil','36.79.33.162','Windows 7','Chrome','63.0.3239.132','','2018-01-15 09:45:10',500),

(701,'logout_berhasil','115.178.253.63','Windows 7','Chrome','57.0.2987.98','','2018-01-15 09:53:08',360),

(702,'logout_berhasil','36.79.33.162','Windows 7','Chrome','63.0.3239.132','','2018-01-15 10:14:12',500),

(703,'logout_berhasil','36.73.70.174','Windows 8.1','Firefox','51.0','','2018-01-15 10:36:16',519),

(704,'login_gagal','36.73.70.174','Windows 8.1','Firefox','51.0','','2018-01-15 10:36:32',425),

(705,'login_gagal','36.73.70.174','Windows 8.1','Firefox','51.0','','2018-01-15 10:42:09',0),

(706,'login_gagal','36.73.70.174','Windows 8.1','Firefox','51.0','','2018-01-15 10:42:25',425),

(707,'login_gagal','36.73.70.174','Windows 8.1','Firefox','51.0','','2018-01-15 10:44:46',425),

(708,'logout_berhasil','36.71.81.116','Windows 7','Firefox','58.0','','2018-01-15 11:06:26',NULL),

(709,'logout_berhasil','115.178.253.63','Windows 7','Chrome','57.0.2987.98','','2018-01-15 11:29:05',360),

(710,'logout_berhasil','36.73.58.220','Windows 7','Firefox','58.0','','2018-01-15 11:49:58',465),

(711,'logout_berhasil','36.80.250.129','Windows 10','Chrome','63.0.3239.132','','2018-01-15 12:25:55',455),

(712,'logout_berhasil','36.73.70.174','Windows 7','Chrome','63.0.3239.132','','2018-01-15 13:29:33',525),

(713,'logout_berhasil','36.73.70.174','Windows 10','Firefox','57.0','','2018-01-15 13:54:07',558),

(714,'logout_berhasil','120.188.73.136','Windows 7','Chrome','63.0.3239.132','','2018-01-15 14:45:17',502),

(715,'logout_berhasil','36.72.213.92','Windows 7','Chrome','56.0.2924.87','','2018-01-15 15:11:43',46),

(716,'logout_berhasil','36.73.70.174','Windows 10','Firefox','57.0','','2018-01-15 16:28:15',NULL),

(717,'logout_berhasil','36.71.81.116','Windows 7','Chrome','56.0.2924.87','','2018-01-15 16:30:43',409),

(718,'logout_berhasil','36.73.58.220','Windows 7','Firefox','58.0','','2018-01-15 16:37:47',522),

(719,'logout_berhasil','36.71.81.116','Windows 7','Chrome','63.0.3239.132','','2018-01-15 16:41:17',397),

(720,'logout_berhasil','36.79.33.162','Windows 7','Chrome','58.0.2988.0','','2018-01-15 17:17:59',501),

(721,'logout_berhasil','36.80.250.129','Windows 7','Firefox','57.0','','2018-01-15 17:39:11',481),

(722,'logout_berhasil','36.73.58.220','Windows 7','Chrome','63.0.3239.132','','2018-01-15 17:43:15',585),

(723,'logout_berhasil','115.178.253.63','Windows 7','Firefox','57.0','','2018-01-15 17:55:05',357),

(724,'logout_berhasil','36.73.58.220','Windows 7','Chrome','63.0.3239.132','','2018-01-15 17:58:07',585),

(725,'logout_berhasil','36.79.153.170','Windows 7','Chrome','63.0.3239.132','','2018-01-15 18:03:27',470),

(726,'logout_berhasil','36.79.153.170','Windows 7','Chrome','63.0.3239.132','','2018-01-15 18:03:31',NULL),

(727,'logout_berhasil','180.246.64.69','Windows 10','Chrome','57.0.2987.98','','2018-01-15 18:34:52',512),

(728,'logout_berhasil','36.73.58.220','Windows 7','Chrome','57.0.2987.98','','2018-01-15 18:45:10',520),

(729,'logout_berhasil','36.71.81.116','Windows 7','Firefox','57.0','','2018-01-15 19:10:00',344),

(730,'logout_berhasil','36.73.58.220','Windows 7','Firefox','57.0','','2018-01-15 20:40:51',520),

(731,'logout_berhasil','36.72.213.92','Windows 7','Chrome','56.0.2924.87','','2018-01-15 21:12:19',46),

(732,'logout_berhasil','112.215.240.41','Android','Chrome','46.0.2490.85','','2018-01-15 22:02:56',514),

(733,'login_gagal','114.124.143.192','Windows 7','Firefox','57.0','','2018-01-15 22:17:51',542),

(734,'login_gagal','114.124.143.192','Windows 7','Firefox','57.0','','2018-01-15 22:18:19',542),

(735,'logout_berhasil','202.65.117.89','Windows 7','Firefox','53.0','','2018-01-15 22:28:25',545),

(736,'logout_berhasil','36.80.250.129','Windows 7','Chrome','63.0.3239.132','','2018-01-15 23:01:36',482),

(737,'logout_berhasil','36.80.250.129','Windows 10','Chrome','63.0.3239.132','','2018-01-15 23:14:32',481),

(738,'logout_berhasil','36.80.250.129','Windows 10','Opera','50.0.2762.58','','2018-01-15 23:15:04',484),

(739,'login_gagal','115.178.236.44','Windows 10','Firefox','57.0','','2018-01-15 23:34:48',542),

(740,'login_gagal','115.178.236.44','Windows 10','Firefox','57.0','','2018-01-15 23:35:02',542),

(741,'login_gagal','115.178.236.44','Windows 10','Firefox','57.0','','2018-01-15 23:35:16',542),

(742,'login_gagal','115.178.236.44','Windows 10','Firefox','57.0','','2018-01-15 23:35:28',425),

(743,'login_gagal','115.178.236.44','Windows 10','Firefox','57.0','','2018-01-15 23:36:27',542),

(744,'login_gagal','115.178.236.44','Windows 10','Firefox','57.0','','2018-01-15 23:37:04',542),

(745,'login_gagal','115.178.236.44','Windows 10','Firefox','57.0','','2018-01-15 23:37:12',425),

(746,'login_gagal','115.178.236.44','Windows 10','Firefox','57.0','','2018-01-15 23:37:18',542),

(747,'logout_berhasil','115.178.235.86','Windows 7','Chrome','57.0.2987.98','','2018-01-15 23:44:17',520),

(748,'logout_berhasil','114.124.145.211','Windows 8','Chrome','63.0.3239.84','','2018-01-16 01:36:22',545),

(749,'logout_berhasil','36.78.103.203','Windows 7','Chrome','63.0.3239.132','','2018-01-16 08:57:11',547),

(750,'logout_berhasil','36.72.213.92','Windows 7','Chrome','63.0.3239.132','','2018-01-16 10:01:45',538),

(751,'logout_berhasil','36.72.213.92','Windows 7','Chrome','56.0.2924.87','','2018-01-16 10:07:01',46),

(752,'logout_berhasil','115.178.251.75','Windows 10','Chrome','63.0.3239.132','','2018-01-16 10:34:00',515),

(753,'logout_berhasil','36.78.103.203','Windows 7','Chrome','63.0.3239.132','','2018-01-16 10:35:23',547),

(754,'logout_berhasil','36.73.105.216','Windows 7','Chrome','63.0.3239.132','','2018-01-16 10:37:02',520),

(755,'login_gagal','36.73.105.216','Windows 7','Chrome','63.0.3239.132','','2018-01-16 10:37:30',0),

(756,'login_gagal','36.73.105.216','Windows 7','Chrome','63.0.3239.132','','2018-01-16 10:37:56',0),

(757,'logout_berhasil','36.73.119.97','Windows 7','Chrome','57.0.2987.98','','2018-01-16 11:33:12',522),

(758,'logout_berhasil','114.124.168.182','Windows 10','Chrome','63.0.3239.132','','2018-01-16 11:42:10',NULL),

(759,'logout_berhasil','125.166.236.236','Windows 7','Chrome','63.0.3239.132','','2018-01-16 11:43:17',508),

(760,'logout_berhasil','36.79.153.170','Windows 7','Firefox','57.0','','2018-01-16 11:44:42',NULL),

(761,'logout_berhasil','36.73.105.216','Windows 7','Chrome','63.0.3239.132','','2018-01-16 12:02:41',521),

(762,'logout_berhasil','115.178.251.75','Windows 10','Chrome','63.0.3239.132','','2018-01-16 12:22:49',515),

(763,'logout_berhasil','36.78.103.203','Windows 7','Firefox','57.0','','2018-01-16 14:49:33',454),

(764,'logout_berhasil','36.79.153.170','Windows 7','Chrome','52.0.2743.116','','2018-01-16 14:54:14',492),

(765,'logout_berhasil','36.73.105.216','Windows 10','Chrome','58.0.3014.0','','2018-01-16 15:00:29',NULL),

(766,'logout_berhasil','115.178.251.75','Windows 10','Chrome','63.0.3239.132','','2018-01-16 15:07:18',515),

(767,'logout_berhasil','36.72.213.92','Windows 7','Chrome','63.0.3239.132','','2018-01-16 15:26:27',538),

(768,'logout_berhasil','36.73.105.216','Windows 8.1','Firefox','57.0','','2018-01-16 16:43:49',520),

(769,'logout_berhasil','36.73.105.216','Windows 8.1','Firefox','57.0','','2018-01-16 16:44:17',520),

(770,'logout_berhasil','36.73.105.216','Windows 8.1','Firefox','57.0','','2018-01-16 16:50:40',589),

(771,'logout_berhasil','125.166.236.236','Windows 7','Chrome','57.0.2987.98','','2018-01-16 16:59:46',511),

(772,'logout_berhasil','125.166.236.236','Windows 7','Chrome','57.0.2987.98','','2018-01-16 17:09:05',511),

(773,'logout_berhasil','36.73.105.216','Windows 7','Chrome','63.0.3239.132','','2018-01-16 17:11:16',525),

(774,'logout_berhasil','36.73.105.216','Windows 7','Chrome','63.0.3239.132','','2018-01-16 17:12:49',NULL),

(775,'logout_berhasil','36.79.33.162','Windows 7','Chrome','63.0.3239.132','','2018-01-16 17:12:53',502),

(776,'logout_berhasil','36.73.105.216','Windows 10','Chrome','57.0.2987.98','','2018-01-16 17:17:43',521),

(777,'logout_berhasil','36.73.105.216','Windows 10','Chrome','63.0.3239.132','','2018-01-16 17:29:40',474),

(778,'logout_berhasil','115.178.251.75','Windows 7','Firefox','57.0','','2018-01-16 17:48:07',NULL),

(779,'logout_berhasil','36.73.105.216','Windows 8.1','Firefox','57.0','','2018-01-16 18:16:27',9),

(780,'logout_berhasil','36.73.105.216','Windows 8.1','Firefox','57.0','','2018-01-16 18:42:23',520),

(781,'logout_berhasil','180.254.109.117','Windows 7','Firefox','57.0','','2018-01-16 18:43:11',481),

(782,'logout_berhasil','36.81.65.178','Windows 7','Chrome','52.0.2743.116','','2018-01-16 18:50:47',492),

(783,'logout_berhasil','36.73.105.216','Windows 8.1','Chrome','57.0.2987.98','','2018-01-16 18:55:06',491),

(784,'logout_berhasil','36.73.105.216','Windows 8.1','Firefox','57.0','','2018-01-16 20:04:38',NULL),

(785,'logout_berhasil','36.73.119.97','Windows 10','Chrome','57.0.2987.98','','2018-01-16 20:58:07',521),

(786,'logout_berhasil','112.215.173.217','Windows 7','Chrome','63.0.3239.132','','2018-01-16 21:05:46',474),

(787,'logout_berhasil','112.215.173.217','Windows 7','Chrome','63.0.3239.132','','2018-01-16 21:06:01',NULL),

(788,'logout_berhasil','36.73.119.97','Windows 8.1','Firefox','57.0','','2018-01-16 21:13:46',475),

(789,'logout_berhasil','36.73.119.97','Windows 10','Chrome','63.0.3239.132','','2018-01-16 22:01:58',589),

(790,'logout_berhasil','36.73.119.97','Windows 10','Chrome','63.0.3239.132','','2018-01-16 22:02:26',531),

(791,'logout_berhasil','36.73.119.97','Windows 7','Firefox','58.0','','2018-01-16 22:05:16',520),

(792,'logout_berhasil','36.73.119.97','Windows 7','Chrome','63.0.3239.132','','2018-01-16 23:24:39',583),

(793,'logout_berhasil','36.73.119.97','Windows 10','Chrome','63.0.3239.132','','2018-01-17 04:59:29',475),

(794,'logout_berhasil','36.73.105.216','Windows 7','Chrome','63.0.3239.132','','2018-01-17 08:47:05',528),

(795,'login_gagal','36.73.119.97','Windows 10','Chrome','63.0.3239.132','','2018-01-17 08:50:31',589),

(796,'login_gagal','36.73.119.97','Windows 10','Chrome','63.0.3239.132','','2018-01-17 08:50:51',589),

(797,'login_gagal','36.73.119.97','Windows 10','Chrome','63.0.3239.132','','2018-01-17 08:51:24',589),

(798,'logout_berhasil','36.73.105.216','Windows 7','Chrome','63.0.3239.132','','2018-01-17 09:15:58',483),

(799,'logout_berhasil','36.73.105.216','Windows 8.1','Chrome','63.0.3239.132','','2018-01-17 11:04:12',474),

(800,'logout_berhasil','36.73.105.216','Windows 8.1','Chrome','57.0.2987.98','','2018-01-17 13:08:22',NULL),

(801,'login_gagal','36.73.105.216','Windows 8.1','Firefox','57.0','','2018-01-17 13:14:39',589),

(802,'login_gagal','36.73.105.216','Windows 8.1','Firefox','57.0','','2018-01-17 13:14:50',589),

(803,'logout_berhasil','36.73.105.216','Windows 8','Chrome','63.0.3239.132','','2018-01-17 13:31:07',545),

(804,'logout_berhasil','36.73.105.216','Windows 8.1','Chrome','63.0.3239.132','','2018-01-17 13:31:48',465),

(805,'logout_berhasil','36.73.105.216','Windows 8.1','Chrome','63.0.3239.132','','2018-01-17 13:40:51',474),

(806,'logout_berhasil','36.73.105.216','Windows 7','Firefox','58.0','','2018-01-17 13:41:01',520),

(807,'logout_berhasil','36.73.105.216','Windows 8.1','Chrome','63.0.3239.132','','2018-01-17 13:41:39',531),

(808,'logout_berhasil','36.73.105.216','Windows 7','Firefox','58.0','','2018-01-17 13:42:41',465),

(809,'logout_berhasil','36.73.105.216','Windows 8.1','Chrome','63.0.3239.132','','2018-01-17 13:52:09',474),

(810,'login_gagal','36.73.119.97','Windows 10','Chrome','63.0.3239.132','','2018-01-17 14:06:23',589),

(811,'logout_berhasil','36.72.213.92','Windows 7','Chrome','57.0.2987.98','','2018-01-17 14:06:42',535),

(812,'login_gagal','36.73.119.97','Windows 10','Chrome','63.0.3239.132','','2018-01-17 14:06:43',589),

(813,'logout_berhasil','36.73.119.97','Windows 7','Chrome','57.0.2987.98','','2018-01-17 14:42:26',585),

(814,'logout_berhasil','36.73.105.216','Windows 8.1','Chrome','63.0.3239.132','','2018-01-17 14:43:40',522),

(815,'login_gagal','36.73.105.216','Windows 8.1','Chrome','63.0.3239.132','','2018-01-17 14:44:12',589),

(816,'login_gagal','36.73.105.216','Windows 8.1','Chrome','63.0.3239.132','','2018-01-17 14:44:29',589),

(817,'logout_berhasil','36.73.105.216','Windows 8.1','Chrome','63.0.3239.132','','2018-01-17 14:45:31',474),

(818,'logout_berhasil','36.73.105.216','Windows 8.1','Firefox','57.0','','2018-01-17 14:45:44',589),

(819,'login_gagal','36.73.105.216','Windows 8.1','Chrome','63.0.3239.132','','2018-01-17 14:45:49',589),

(820,'login_gagal','36.73.105.216','Windows 8.1','Chrome','63.0.3239.132','','2018-01-17 14:46:00',589),

(821,'logout_berhasil','36.73.105.216','Windows 8.1','Chrome','63.0.3239.132','','2018-01-17 14:46:15',531),

(822,'login_gagal','36.73.105.216','Windows 8.1','Chrome','63.0.3239.132','','2018-01-17 14:46:28',589),

(823,'login_gagal','36.73.105.216','Windows 8.1','Chrome','63.0.3239.132','','2018-01-17 14:50:43',528),

(824,'logout_berhasil','36.73.105.216','Windows 8.1','Firefox','57.0','','2018-01-17 16:03:48',370),

(825,'logout_berhasil','36.73.119.97','Windows 7','Firefox','57.0','','2018-01-17 16:11:03',521),

(826,'logout_berhasil','36.73.119.97','Windows 10','Chrome','57.0.2987.98','','2018-01-17 16:17:46',521),

(827,'logout_berhasil','36.73.105.216','Windows 8','Chrome','63.0.3239.132','','2018-01-17 16:35:57',545),

(828,'logout_berhasil','36.73.105.216','Windows 7','Chrome','57.0.2987.98','','2018-01-17 16:37:53',576),

(829,'logout_berhasil','180.254.109.117','Windows 7','Firefox','57.0','','2018-01-17 16:55:05',NULL),

(830,'logout_berhasil','36.73.105.216','Windows 10','Firefox','57.0','','2018-01-17 17:02:21',80),

(831,'logout_berhasil','36.73.105.216','Windows 7','Firefox','58.0','','2018-01-17 17:35:45',520),

(832,'logout_berhasil','36.73.105.216','Windows 8.1','Chrome','57.0.2987.98','','2018-01-17 17:56:30',491),

(833,'logout_berhasil','36.73.105.216','Windows 7','Chrome','57.0.2987.98','','2018-01-17 18:15:00',511),

(834,'logout_berhasil','36.73.105.216','Windows 7','Chrome','57.0.2987.98','','2018-01-17 18:15:05',NULL),

(835,'logout_berhasil','36.73.105.216','Windows 7','Chrome','57.0.2987.98','','2018-01-17 18:15:09',NULL),

(836,'logout_berhasil','36.73.105.216','Windows 8.1','Chrome','63.0.3239.132','','2018-01-17 18:21:01',523),

(837,'logout_berhasil','180.246.172.130','Windows 7','Chrome','56.0.2924.87','','2018-01-17 18:26:11',490),

(838,'logout_berhasil','36.73.105.216','Windows 8','Chrome','63.0.3239.132','','2018-01-17 18:31:58',545),

(839,'logout_berhasil','36.73.105.216','Windows 8.1','Chrome','57.0.2987.98','','2018-01-17 19:16:51',NULL),

(840,'logout_berhasil','36.79.33.162','Windows 7','Chrome','63.0.3239.132','','2018-01-17 21:21:13',577),

(841,'logout_berhasil','103.213.130.101','Windows 10','Firefox','48.0','','2018-01-18 05:23:13',577),

(842,'logout_berhasil','36.73.105.216','Windows 8.1','Chrome','63.0.3239.132','','2018-01-18 07:34:37',524),

(843,'logout_berhasil','36.73.105.216','Windows 8.1','Chrome','63.0.3239.132','','2018-01-18 07:35:03',524),

(844,'logout_berhasil','36.73.105.216','Windows 8.1','Chrome','63.0.3239.132','','2018-01-18 07:37:40',524),

(845,'logout_berhasil','36.73.105.216','Windows 8.1','Firefox','57.0','','2018-01-18 07:41:04',589),

(846,'logout_berhasil','36.73.105.216','Windows 8.1','Firefox','57.0','','2018-01-18 08:49:12',524),

(847,'logout_berhasil','36.73.105.216','Windows 8.1','Firefox','57.0','','2018-01-18 08:51:11',522),

(848,'login_gagal','36.73.105.216','Windows 8.1','Firefox','57.0','','2018-01-18 08:51:39',0),

(849,'logout_berhasil','36.73.105.216','Windows 8.1','Chrome','57.0.2987.98','','2018-01-18 08:51:54',491),

(850,'login_gagal','36.73.105.216','Windows 8.1','Firefox','57.0','','2018-01-18 08:52:05',0),

(851,'login_gagal','36.73.105.216','Windows 7','Chrome','63.0.3239.132','','2018-01-18 09:14:56',525),

(852,'login_gagal','36.73.105.216','Windows 7','Chrome','63.0.3239.132','','2018-01-18 09:15:07',525),

(853,'logout_berhasil','180.254.109.117','Windows 7','Firefox','57.0','','2018-01-18 09:34:09',482),

(854,'logout_berhasil','36.73.105.216','Windows 10','Firefox','57.0','','2018-01-18 10:07:06',360),

(855,'logout_berhasil','36.73.105.216','Windows 7','Chrome','56.0.2924.87','','2018-01-18 10:14:04',545),

(856,'logout_berhasil','36.73.105.216','Windows 10','Firefox','57.0','','2018-01-18 10:19:57',482),

(857,'logout_berhasil','36.73.119.97','Windows 7','Chrome','63.0.3239.132','','2018-01-18 10:54:42',585),

(858,'logout_berhasil','36.73.105.216','Windows 10','Firefox','57.0','','2018-01-18 11:00:51',360),

(859,'logout_berhasil','36.73.105.216','Windows 8','Chrome','63.0.3239.132','','2018-01-18 11:09:16',545),

(860,'login_gagal','36.73.105.216','Windows 8','Chrome','63.0.3239.132','','2018-01-18 11:09:30',0),

(861,'logout_berhasil','36.73.105.216','Windows 10','Firefox','57.0','','2018-01-18 11:22:09',482),

(862,'login_gagal','36.73.105.216','Windows 8','Chrome','63.0.3239.132','','2018-01-18 11:26:37',0),

(863,'login_gagal','36.73.105.216','Windows 8','Chrome','63.0.3239.132','','2018-01-18 11:26:52',0),

(864,'login_gagal','36.73.105.216','Windows 8','Chrome','63.0.3239.132','','2018-01-18 11:27:41',0),

(865,'login_gagal','36.73.105.216','Windows 8','Chrome','63.0.3239.132','','2018-01-18 11:28:43',0),

(866,'login_gagal','36.73.105.216','Windows 8','Chrome','63.0.3239.132','','2018-01-18 11:30:02',0),

(867,'logout_berhasil','36.73.105.216','Windows 8.1','Firefox','57.0','','2018-01-18 12:12:19',491),

(868,'logout_berhasil','36.73.105.216','Windows 10','Firefox','57.0','','2018-01-18 12:15:59',360),

(869,'login_gagal','36.73.8.142','Windows 7','Chrome','57.0.2987.98','','2018-01-18 13:15:54',452),

(870,'login_gagal','36.73.8.142','Windows 7','Chrome','57.0.2987.98','','2018-01-18 13:16:04',452),

(871,'logout_berhasil','125.164.60.183','Windows 7','Chrome','63.0.3239.132','','2018-01-18 13:20:10',547),

(872,'logout_berhasil','36.73.105.216','Windows 10','Firefox','57.0','','2018-01-18 13:20:14',482),

(873,'logout_berhasil','36.73.8.142','Windows 7','Chrome','63.0.3239.132','','2018-01-18 13:23:04',343),

(874,'logout_berhasil','180.254.109.117','Windows 7','Firefox','57.0','','2018-01-18 15:58:25',482),

(875,'logout_berhasil','180.252.248.149','Windows 7','Chrome','56.0.2924.87','','2018-01-18 16:08:07',NULL),

(876,'logout_berhasil','36.73.105.216','Windows 8.1','Firefox','57.0','','2018-01-18 16:14:26',545),

(877,'logout_berhasil','36.73.117.252','Windows 7','Chrome','57.0.2987.98','','2018-01-18 16:17:03',NULL),

(878,'logout_berhasil','36.73.105.216','Windows 8.1','Chrome','57.0.2987.98','','2018-01-18 16:19:20',NULL),

(879,'logout_berhasil','36.73.105.216','Windows 10','Chrome','63.0.3239.132','','2018-01-18 16:28:30',475),

(880,'logout_berhasil','36.73.105.216','Windows 10','Firefox','57.0','','2018-01-18 16:32:05',360),

(881,'logout_berhasil','36.73.8.142','Windows 7','Chrome','63.0.3239.132','','2018-01-18 16:33:53',438),

(882,'logout_berhasil','36.73.105.216','Windows 10','Firefox','57.0','','2018-01-18 17:01:19',482),

(883,'logout_berhasil','36.73.105.216','Windows 10','Firefox','57.0','','2018-01-18 17:01:34',360),

(884,'login_gagal','180.254.109.117','Windows 7','Firefox','57.0','','2018-01-18 17:02:33',482),

(885,'login_gagal','180.254.109.117','Windows 7','Firefox','57.0','','2018-01-18 17:02:49',482),

(886,'logout_berhasil','125.164.60.183','Windows 7','Chrome','63.0.3239.132','','2018-01-18 17:05:36',549),

(887,'logout_berhasil','125.164.60.183','Windows 7','Chrome','63.0.3239.132','','2018-01-18 17:10:27',564),

(888,'logout_berhasil','36.73.105.216','Windows 10','Chrome','63.0.3239.132','','2018-01-18 17:13:08',583),

(889,'login_gagal','36.73.105.216','Windows 10','Chrome','63.0.3239.132','','2018-01-18 17:13:17',0),

(890,'logout_berhasil','36.73.105.216','Windows 10','Firefox','57.0','','2018-01-18 17:13:24',25),

(891,'login_gagal','36.73.105.216','Windows 10','Chrome','63.0.3239.132','','2018-01-18 17:13:27',585),

(892,'logout_berhasil','180.254.109.117','Windows 7','Firefox','57.0','','2018-01-18 17:18:38',481),

(893,'logout_berhasil','180.246.172.130','Windows 7','Chrome','63.0.3239.132','','2018-01-18 18:01:04',NULL),

(894,'logout_berhasil','36.73.105.216','Windows 8.1','Firefox','57.0','','2018-01-18 18:02:15',9),

(895,'logout_berhasil','36.73.105.216','Windows 8.1','Chrome','63.0.3239.132','','2018-01-18 18:19:59',523),

(896,'logout_berhasil','36.73.105.216','Windows 10','Firefox','57.0','','2018-01-18 18:23:12',360),

(897,'logout_berhasil','36.73.105.216','Windows 7','Chrome','63.0.3239.132','','2018-01-18 18:45:08',474),

(898,'logout_berhasil','36.73.105.216','Windows 7','Chrome','57.0.2987.98','','2018-01-18 18:54:08',576),

(899,'logout_berhasil','36.73.105.216','Windows 7','Chrome','57.0.2987.98','','2018-01-18 19:19:06',511),

(900,'logout_berhasil','36.73.105.216','Windows 8.1','Chrome','63.0.3239.132','','2018-01-18 19:20:00',523),

(901,'logout_berhasil','36.73.105.216','Windows 8.1','Chrome','57.0.2987.98','','2018-01-18 19:20:34',NULL),

(902,'logout_berhasil','125.166.224.220','Windows 7','Chrome','63.0.3239.132','','2018-01-18 19:47:43',502),

(903,'logout_berhasil','36.73.105.216','Windows 7','Firefox','57.0','','2018-01-18 20:19:11',474),

(904,'logout_berhasil','36.73.105.216','Windows 7','Chrome','56.0.2924.87','','2018-01-18 20:35:13',576),

(905,'logout_berhasil','36.73.119.97','Windows 8.1','Chrome','57.0.2987.98','','2018-01-18 21:46:23',484),

(906,'login_gagal','36.73.119.97','Windows 8.1','Chrome','57.0.2987.98','','2018-01-18 21:46:43',481),

(907,'logout_berhasil','112.215.244.71','Windows 10','Chrome','57.0.2987.98','','2018-01-18 22:28:22',512),

(908,'logout_berhasil','36.73.119.97','Windows 7','Chrome','57.0.2987.98','','2018-01-18 23:21:02',511),

(909,'logout_berhasil','36.73.119.97','Windows 7','Chrome','57.0.2987.98','','2018-01-18 23:21:10',NULL),

(910,'logout_berhasil','203.78.118.180','Windows 10','Chrome','57.0.2987.98','','2018-01-19 05:39:19',512),

(911,'logout_berhasil','36.80.237.174','Windows 7','Chrome','57.0.2987.98','','2018-01-19 08:14:37',535),

(912,'logout_berhasil','36.73.119.97','Windows 8.1','Chrome','57.0.2987.98','','2018-01-19 08:18:20',585),

(913,'login_gagal','36.73.105.216','Windows 7','Chrome','63.0.3239.132','','2018-01-19 08:31:02',525),

(914,'login_gagal','36.73.119.97','Windows 8.1','Chrome','57.0.2987.98','','2018-01-19 08:37:02',585),

(915,'logout_berhasil','36.73.119.97','Windows 7','Firefox','57.0','','2018-01-19 09:09:45',523),

(916,'logout_berhasil','36.73.119.97','Windows 8.1','Chrome','63.0.3239.132','','2018-01-19 09:45:17',523),

(917,'logout_berhasil','180.244.57.202','Windows 7','Chrome','56.0.2924.87','','2018-01-19 09:53:47',409),

(918,'logout_berhasil','115.178.235.144','Windows 7','Firefox','57.0','','2018-01-19 10:02:45',512),

(919,'logout_berhasil','112.215.172.190','Windows 10','Chrome','57.0.2987.98','','2018-01-19 10:30:19',512),

(920,'logout_berhasil','36.73.119.97','Windows 7','Firefox','57.0','','2018-01-19 10:33:50',523),

(921,'logout_berhasil','36.80.237.174','Windows 7','Firefox','57.0','','2018-01-19 10:55:01',533),

(922,'logout_berhasil','36.80.237.174','Windows 7','Firefox','57.0','','2018-01-19 10:55:21',NULL),

(923,'logout_berhasil','36.80.237.174','Windows 7','Firefox','57.0','','2018-01-19 10:55:28',NULL),

(924,'logout_berhasil','36.80.237.174','Windows 7','Firefox','57.0','','2018-01-19 10:59:45',533),

(925,'logout_berhasil','125.164.60.183','Windows 7','Chrome','63.0.3239.132','','2018-01-19 11:36:16',NULL),

(926,'logout_berhasil','36.73.105.216','Windows 10','Firefox','57.0','','2018-01-19 13:35:28',NULL),

(927,'logout_berhasil','36.80.206.10','Windows 7','Firefox','57.0','','2018-01-19 13:58:34',511),

(928,'logout_berhasil','36.73.119.97','Windows 7','Chrome','57.0.2987.98','','2018-01-19 14:08:14',585),

(929,'logout_berhasil','36.80.206.10','Windows 7','Firefox','57.0','','2018-01-19 14:08:17',438),

(930,'logout_berhasil','180.244.70.195','Windows 7','Chrome','56.0.2924.87','','2018-01-19 14:23:09',409),

(931,'logout_berhasil','36.73.119.97','Windows 7','Firefox','57.0','','2018-01-19 14:40:06',523),

(932,'logout_berhasil','36.73.119.97','Windows 8.1','Chrome','63.0.3239.132','','2018-01-19 15:18:43',523),

(933,'logout_berhasil','36.73.119.97','Windows 8.1','Chrome','63.0.3239.132','','2018-01-19 15:20:58',523),

(934,'logout_berhasil','36.73.119.97','Windows 7','Chrome','57.0.2987.98','','2018-01-19 15:25:02',520),

(935,'logout_berhasil','112.215.244.251','Windows 10','Chrome','57.0.2987.98','','2018-01-19 15:53:12',512),

(936,'logout_berhasil','36.80.237.174','Windows 7','Chrome','57.0.2987.98','','2018-01-19 16:01:14',535),

(937,'logout_berhasil','180.244.70.195','Windows 7','Chrome','56.0.2924.87','','2018-01-19 16:55:40',409),

(938,'logout_berhasil','36.80.237.174','Windows 7','Firefox','57.0','','2018-01-19 17:03:02',533),

(939,'logout_berhasil','36.73.105.216','Windows 7','Chrome','56.0.2924.87','','2018-01-19 17:19:34',NULL),

(940,'logout_berhasil','36.79.60.130','Windows 7','Chrome','63.0.3239.132','','2018-01-19 17:33:56',438),

(941,'logout_berhasil','36.79.60.130','Windows 7','Chrome','63.0.3239.132','','2018-01-19 17:34:10',NULL),

(942,'logout_berhasil','36.79.60.130','Windows 7','Chrome','57.0.2987.98','','2018-01-19 17:37:00',511),

(943,'logout_berhasil','36.73.105.216','Windows 10','Chrome','58.0.3014.0','','2018-01-19 18:08:38',NULL),

(944,'logout_berhasil','36.73.119.97','Windows 7','Firefox','57.0','','2018-01-19 18:30:41',523),

(945,'logout_berhasil','180.246.172.130','Windows 8.1','Chrome','63.0.3239.132','','2018-01-19 18:47:31',492),

(946,'logout_berhasil','180.254.109.117','Windows 7','Firefox','57.0','','2018-01-19 19:42:29',NULL),

(947,'logout_berhasil','36.73.119.97','Windows 7','Chrome','63.0.3239.132','','2018-01-19 21:58:56',NULL),

(948,'logout_berhasil','180.246.172.130','Windows 8.1','Chrome','63.0.3239.132','','2018-01-20 08:15:47',492),

(949,'logout_berhasil','36.80.237.174','Windows 7','Chrome','57.0.2987.98','','2018-01-20 10:22:29',535),

(950,'logout_berhasil','36.80.175.64','Windows 7','Chrome','63.0.3239.132','','2018-01-20 10:44:50',438),

(951,'login_gagal','180.254.109.117','Windows 7','Firefox','57.0','','2018-01-20 11:18:48',93),

(952,'login_gagal','180.254.109.117','Windows 7','Firefox','57.0','','2018-01-20 11:19:09',93),

(953,'logout_berhasil','180.254.109.117','Windows 7','Chrome','63.0.3239.132','','2018-01-20 11:19:18',72),

(954,'logout_berhasil','180.254.109.117','Windows 7','Firefox','57.0','','2018-01-20 11:24:43',93),

(955,'logout_berhasil','180.254.109.117','Windows 7','Firefox','57.0','','2018-01-20 11:24:59',93),

(956,'logout_berhasil','180.246.172.130','Windows 8.1','Chrome','63.0.3239.132','','2018-01-20 11:41:52',492),

(957,'logout_berhasil','112.215.154.117','Windows 10','Firefox','57.0','','2018-01-20 11:45:25',521),

(958,'logout_berhasil','36.73.105.216','Windows 7','Chrome','57.0.2987.98','','2018-01-20 11:47:52',576),

(959,'logout_berhasil','180.254.109.117','Windows 7','Firefox','57.0','','2018-01-20 12:05:39',NULL),

(960,'logout_berhasil','180.254.109.117','Windows 7','Firefox','57.0','','2018-01-20 12:06:31',484),

(961,'logout_berhasil','36.72.254.94','Windows 7','Chrome','63.0.3239.132','','2018-01-20 12:16:54',502),

(962,'login_gagal','180.254.109.117','Windows 7','Firefox','57.0','','2018-01-20 13:00:40',93),

(963,'logout_berhasil','180.246.172.130','Windows 7','Firefox','57.0','','2018-01-20 13:33:25',NULL),

(964,'logout_berhasil','180.246.172.130','Windows 8.1','Chrome','63.0.3239.132','','2018-01-20 13:37:39',492),

(965,'logout_berhasil','36.73.105.216','Windows 7','Chrome','57.0.2987.98','','2018-01-20 14:12:56',576),

(966,'logout_berhasil','180.254.109.117','Windows 7','Firefox','57.0','','2018-01-20 16:04:43',481),

(967,'logout_berhasil','36.80.237.174','Windows 7','Firefox','57.0','','2018-01-20 16:37:16',533),

(968,'logout_berhasil','180.246.84.20','Windows 10','Chrome','57.0.2987.98','','2018-01-20 16:55:47',512),

(969,'logout_berhasil','180.244.70.195','Windows 7','Chrome','56.0.2924.87','','2018-01-20 17:04:53',409),

(970,'logout_berhasil','180.246.84.20','Windows 7','Chrome','63.0.3239.132','','2018-01-20 17:04:55',438),

(971,'logout_berhasil','180.246.84.20','Windows 7','Chrome','63.0.3239.132','','2018-01-20 17:04:59',NULL),

(972,'logout_berhasil','180.246.84.20','Windows 7','Chrome','63.0.3239.132','','2018-01-20 17:05:03',NULL),

(973,'logout_berhasil','180.246.84.20','Windows 10','Chrome','57.0.2987.98','','2018-01-20 17:17:21',512),

(974,'logout_berhasil','180.246.84.20','Windows 7','Chrome','57.0.2987.98','','2018-01-20 17:18:34',511),

(975,'logout_berhasil','180.246.84.20','Windows 7','Chrome','57.0.2987.98','','2018-01-20 17:18:42',NULL),

(976,'logout_berhasil','36.73.105.216','Windows 7','Chrome','56.0.2924.87','','2018-01-20 18:51:20',NULL),

(977,'logout_berhasil','36.73.105.216','Windows 7','Chrome','57.0.2987.98','','2018-01-20 18:57:09',576),

(978,'logout_berhasil','36.73.105.216','Windows 10','Chrome','58.0.3014.0','','2018-01-20 20:24:34',474),

(979,'logout_berhasil','36.72.254.94','Windows 7','Firefox','51.0','','2018-01-20 20:57:52',499),

(980,'logout_berhasil','36.73.127.8','Windows 7','Chrome','63.0.3239.132','','2018-01-21 10:52:50',492),

(981,'logout_berhasil','36.80.237.81','Windows 7','Chrome','57.0.2987.98','','2018-01-21 10:58:31',585),

(982,'logout_berhasil','36.73.105.216','Windows 7','Chrome','63.0.3239.132','','2018-01-21 11:11:03',353),

(983,'logout_berhasil','36.73.105.216','Windows 7','Firefox','57.0','','2018-01-21 12:17:23',360),

(984,'logout_berhasil','36.73.105.216','Windows 7','Firefox','57.0','','2018-01-21 12:20:05',583),

(985,'logout_berhasil','36.73.105.216','Windows 8.1','Chrome','57.0.2987.98','','2018-01-21 13:23:49',520),

(986,'logout_berhasil','180.254.65.170','Windows 7','Chrome','63.0.3239.132','','2018-01-21 15:13:33',538),

(987,'logout_berhasil','36.73.105.216','Windows 10','Firefox','57.0','','2018-01-21 16:25:02',25),

(988,'logout_berhasil','180.254.65.170','Windows 7','Chrome','63.0.3239.132','','2018-01-21 16:31:42',538),

(989,'logout_berhasil','36.73.105.216','Windows 7','Chrome','63.0.3239.132','','2018-01-21 17:02:53',353),

(990,'logout_berhasil','180.254.109.117','Windows 10','Firefox','57.0','','2018-01-21 17:03:39',NULL),

(991,'logout_berhasil','36.73.105.216','Windows 8.1','Chrome','57.0.2987.98','','2018-01-21 17:09:26',NULL),

(992,'logout_berhasil','36.71.67.214','Windows 7','Chrome','56.0.2924.87','','2018-01-21 17:10:16',409),

(993,'logout_berhasil','36.73.105.216','Windows 7','Chrome','56.0.2924.87','','2018-01-21 18:11:54',545),

(994,'logout_berhasil','36.80.237.81','Windows 7','Chrome','57.0.2987.98','','2018-01-21 18:28:05',585),

(995,'logout_berhasil','36.80.237.81','Windows 7','Chrome','57.0.2987.98','','2018-01-21 18:28:16',NULL),

(996,'logout_berhasil','180.254.65.170','Windows 7','Chrome','56.0.2924.87','','2018-01-21 20:25:39',46),

(997,'logout_berhasil','36.80.237.81','Windows 7','Firefox','57.0','','2018-01-21 21:40:39',585),

(998,'logout_berhasil','36.73.105.216','Windows 7','Firefox','57.0','','2018-01-22 12:17:47',524),

(999,'logout_berhasil','180.254.65.170','Windows 7','Chrome','57.0.2987.98','','2018-01-22 13:01:50',NULL),

(1000,'logout_berhasil','36.73.105.216','Windows 10','Chrome','63.0.3239.132','','2018-01-22 14:30:36',25),

(1001,'logout_berhasil','180.254.109.117','Windows 7','Firefox','57.0','','2018-01-22 14:32:14',481),

(1002,'logout_berhasil','120.188.35.117','Windows 10','Chrome','63.0.3239.132','','2018-01-22 15:42:30',455),

(1003,'logout_berhasil','36.73.105.216','Windows 10','Chrome','63.0.3239.132','','2018-01-22 21:05:16',474),

(1004,'logout_berhasil','180.254.108.249','Windows 7','Chrome','63.0.3239.132','','2018-01-23 07:20:16',72),

(1005,'logout_berhasil','36.72.254.94','Windows 7','Chrome','58.0.2988.0','','2018-01-23 09:39:13',502),

(1006,'logout_berhasil','36.80.237.81','Windows 10','Chrome','63.0.3239.132','','2018-01-23 09:54:51',585),

(1007,'logout_berhasil','36.80.237.81','Windows 7','Firefox','57.0','','2018-01-23 10:34:47',523),

(1008,'logout_berhasil','36.80.225.80','Windows 7','Firefox','57.0','','2018-01-23 11:11:26',343),

(1009,'logout_berhasil','36.72.254.94','Windows 7','Chrome','63.0.3239.132','','2018-01-23 11:38:37',502),

(1010,'logout_berhasil','36.80.225.80','Windows 7','Chrome','56.0.2924.87','','2018-01-23 11:50:03',NULL),

(1011,'logout_berhasil','36.80.225.80','Windows 7','Chrome','57.0.2987.98','','2018-01-23 11:51:59',343),

(1012,'logout_berhasil','36.80.225.80','Windows 7','Chrome','57.0.2987.98','','2018-01-23 11:55:01',511),

(1013,'logout_berhasil','180.254.93.75','Windows 10','Chrome','58.0.3014.0','','2018-01-23 13:31:45',NULL),

(1014,'logout_berhasil','36.80.251.89','Windows 7','Chrome','63.0.3239.132','','2018-01-23 14:09:43',538),

(1015,'logout_berhasil','36.80.251.89','Windows 7','Chrome','63.0.3239.132','','2018-01-23 20:18:22',538),

(1016,'logout_berhasil','36.72.254.94','Windows 7','Chrome','63.0.3239.132','','2018-01-24 10:15:54',11),

(1017,'logout_berhasil','180.254.108.249','Windows 7','Firefox','58.0','','2018-01-24 13:49:26',480),

(1018,'logout_berhasil','180.254.4.92','Windows 7','Chrome','63.0.3239.132','','2018-01-25 10:20:08',500),

(1019,'logout_berhasil','114.124.239.145','Windows 7','Chrome','63.0.3239.132','','2018-01-25 15:05:26',474),

(1020,'logout_berhasil','114.124.206.160','Windows 7','Chrome','63.0.3239.132','','2018-01-25 19:02:57',526),

(1021,'logout_berhasil','114.124.238.177','Windows 7','Chrome','63.0.3239.132','','2018-01-25 20:16:39',474),

(1022,'logout_berhasil','114.124.206.176','Windows 7','Chrome','63.0.3239.132','','2018-01-25 21:07:03',474),

(1023,'logout_berhasil','114.124.206.176','Windows 7','Chrome','63.0.3239.132','','2018-01-25 21:07:09',NULL),

(1024,'logout_berhasil','120.188.79.87','Android','Safari','534.30','','2018-01-25 23:17:21',72),

(1025,'logout_berhasil','8.37.235.247','Android','Safari','534.30','','2018-01-26 13:39:20',72),

(1026,'logout_berhasil','120.188.76.208','Windows 10','Firefox','57.0','','2018-01-26 15:36:54',9),

(1027,'logout_berhasil','36.80.122.220','Windows 7','Chrome','63.0.3239.132','','2018-01-27 15:51:29',11),

(1028,'logout_berhasil','36.80.122.220','Windows 7','Chrome','63.0.3239.132','','2018-01-27 16:37:23',500),

(1029,'logout_berhasil','172.31.27.199','Windows 7','Firefox','57.0','','2018-01-29 12:36:29',9),

(1030,'logout_berhasil','36.80.122.220','Windows 7','Firefox','58.0','','2018-01-29 13:10:15',577),

(1031,'logout_berhasil','36.73.31.167','Windows 7','Chrome','63.0.3239.132','','2018-01-29 15:50:45',500),

(1032,'logout_berhasil','36.73.31.167','Windows 7','Chrome','63.0.3239.132','','2018-01-29 15:50:56',NULL),

(1033,'logout_berhasil','172.31.27.199','Windows 7','Chrome','63.0.3239.132','','2018-01-29 15:53:12',547),

(1034,'logout_berhasil','36.73.31.167','Windows 7','Chrome','63.0.3239.132','','2018-01-29 16:04:19',500),

(1035,'logout_berhasil','36.73.31.167','Windows 7','Chrome','63.0.3239.132','','2018-01-29 16:40:08',500),

(1036,'logout_berhasil','36.73.31.167','Windows 7','Chrome','63.0.3239.132','','2018-01-29 16:40:16',NULL),

(1037,'login_gagal','180.254.24.68','Windows 7','Chrome','57.0.2987.98','','2018-01-30 11:26:46',0),

(1038,'logout_berhasil','172.31.27.199','Windows 10','Chrome','63.0.3239.132','','2018-01-30 11:35:21',474),

(1039,'logout_berhasil','172.31.39.24','Windows 7','Chrome','63.0.3239.132','','2018-01-30 12:21:28',502),

(1040,'logout_berhasil','172.31.39.24','Windows 7','Chrome','63.0.3239.132','','2018-01-30 12:21:54',502),

(1041,'logout_berhasil','172.31.39.24','Windows 7','Chrome','57.0.2987.98','','2018-01-30 13:38:39',585),

(1042,'logout_berhasil','172.31.29.69','Windows 7','Chrome','57.0.2987.98','','2018-01-30 13:46:02',585),

(1043,'logout_berhasil','172.31.29.69','Windows 10','Chrome','58.0.3014.0','','2018-01-30 17:00:43',NULL),

(1044,'logout_berhasil','36.73.155.170','Windows 7','Firefox','57.0','','2018-01-30 17:12:22',498),

(1045,'logout_berhasil','36.73.155.170','Windows 7','Chrome','63.0.3239.132','','2018-01-30 17:24:42',500),

(1046,'logout_berhasil','172.31.39.24','Windows 7','Chrome','63.0.3239.132','','2018-01-30 17:31:49',547),

(1047,'logout_berhasil','36.73.155.170','Windows 7','Chrome','63.0.3239.132','','2018-01-30 17:34:11',500),

(1048,'logout_berhasil','172.31.39.24','Windows 7','Chrome','63.0.3239.132','','2018-01-30 17:46:01',547),

(1049,'logout_berhasil','110.136.183.60','Windows 7','Firefox','59.0','','2018-01-30 22:24:06',520),

(1050,'logout_berhasil','110.139.3.97','Windows 10','Firefox','57.0','','2018-01-31 01:54:56',547),

(1051,'logout_berhasil','54.85.182.120','Mac OS X','Safari','600.1.25','','2018-01-31 03:13:01',NULL),

(1052,'logout_berhasil','172.31.29.69','Windows 7','Chrome','57.0.2987.98','','2018-01-31 09:28:20',584),

(1053,'logout_berhasil','172.31.39.24','Windows 7','Chrome','63.0.3239.132','','2018-01-31 11:09:07',11),

(1054,'logout_berhasil','172.31.29.69','Windows 7','Chrome','63.0.3239.132','','2018-01-31 12:37:39',547),

(1055,'logout_berhasil','180.245.210.119','Windows 10','Opera','50.0.2762.67','','2018-01-31 14:20:12',25),

(1056,'logout_berhasil','172.31.29.69','Windows 7','Firefox','58.0','','2018-01-31 15:07:06',NULL),

(1057,'logout_berhasil','180.245.210.119','Windows 10','Firefox','58.0','','2018-01-31 17:00:59',NULL),

(1058,'logout_berhasil','118.96.173.163','Windows 7','Firefox','57.0','','2018-01-31 17:41:35',498),

(1059,'logout_berhasil','172.31.29.69','Windows 10','Chrome','58.0.3014.0','','2018-02-01 10:31:14',474),

(1060,'logout_berhasil','36.79.59.106','Windows 7','Firefox','57.0','','2018-02-01 11:31:55',498),

(1061,'logout_berhasil','36.80.227.162','Windows 7','Firefox','58.0','','2018-02-01 11:34:21',353),

(1062,'logout_berhasil','125.163.238.21','Windows 7','Firefox','58.0','','2018-02-01 14:13:12',596),

(1063,'logout_berhasil','172.31.39.24','Windows 10','Chrome','57.0.2987.98','','2018-02-01 14:15:24',521),

(1064,'logout_berhasil','36.74.51.249','Windows 7','Chrome','63.0.3239.132','','2018-02-01 15:52:06',547),

(1065,'logout_berhasil','125.163.238.21','Windows 8.1','Firefox','51.0','','2018-02-01 17:16:10',519),

(1066,'logout_berhasil','172.31.29.69','Android','Chrome','56.0.2924.87','','2018-02-01 17:21:22',455),

(1067,'logout_berhasil','120.188.81.76','Windows 10','Chrome','63.0.3239.132','','2018-02-01 18:00:17',357),

(1068,'logout_berhasil','36.79.59.106','Windows 7','Chrome','63.0.3239.132','','2018-02-01 18:16:39',500),

(1069,'logout_berhasil','120.188.81.76','Windows 10','Chrome','63.0.3239.132','','2018-02-01 18:26:31',515),

(1070,'logout_berhasil','112.215.244.230','Windows 10','Firefox','58.0','','2018-02-01 18:45:05',25),

(1071,'logout_berhasil','125.163.238.21','Windows 7','Firefox','58.0','','2018-02-01 20:35:44',520),

(1072,'logout_berhasil','54.85.182.120','Mac OS X','Safari','600.1.25','','2018-02-01 23:13:31',NULL),

(1073,'logout_berhasil','125.163.238.21','Windows 7','Firefox','59.0','','2018-02-02 09:38:33',520),

(1074,'logout_berhasil','120.188.81.76','Windows 10','Chrome','63.0.3239.132','','2018-02-02 10:21:02',515),

(1075,'logout_berhasil','36.72.214.107','Windows 7','Chrome','56.0.2924.87','','2018-02-02 10:57:01',46),

(1076,'logout_berhasil','125.163.238.21','Windows 7','Firefox','58.0','','2018-02-02 11:33:11',520),

(1077,'logout_berhasil','172.31.29.69','Windows 7','Firefox','59.0','','2018-02-02 14:18:31',480),

(1078,'logout_berhasil','172.31.29.69','Windows 7','Chrome','63.0.3239.132','','2018-02-02 17:37:56',475),

(1079,'logout_berhasil','125.163.238.21','Windows 7','Chrome','63.0.3239.132','','2018-02-02 17:39:58',475),

(1080,'logout_berhasil','172.31.29.69','Windows 10','Firefox','58.0','','2018-02-02 18:55:54',558),

(1081,'logout_berhasil','36.73.45.214','Windows 7','Chrome','63.0.3239.132','','2018-02-02 19:17:00',470),

(1082,'logout_berhasil','36.72.219.60','Windows 7','Chrome','63.0.3239.132','','2018-02-02 19:54:41',500),

(1083,'logout_berhasil','36.72.219.60','Windows 7','Chrome','63.0.3239.132','','2018-02-02 19:54:45',NULL),

(1084,'logout_berhasil','34.207.98.73','Unknown Platform','','','','2018-02-02 19:58:43',NULL),

(1085,'logout_berhasil','172.31.29.69','Windows 10','Firefox','58.0','','2018-02-02 23:29:32',558),

(1086,'logout_berhasil','36.72.219.60','Windows 7','Firefox','57.0','','2018-02-03 09:32:18',498),

(1087,'logout_berhasil','54.85.182.120','Mac OS X','Safari','600.1.25','','2018-02-03 12:01:39',NULL),

(1088,'logout_berhasil','172.31.29.69','Windows 10','Chrome','63.0.3239.132','','2018-02-03 15:11:54',455),

(1089,'logout_berhasil','36.80.227.162','Windows 10','Chrome','58.0.3014.0','','2018-02-03 17:02:23',474),

(1090,'logout_berhasil','36.72.219.60','Windows 7','Chrome','63.0.3239.132','','2018-02-03 17:50:22',500),

(1091,'logout_berhasil','36.72.219.60','Windows 7','Chrome','63.0.3239.132','','2018-02-03 17:50:30',NULL),

(1092,'logout_berhasil','36.71.83.84','Windows 7','Chrome','56.0.2924.87','','2018-02-03 18:39:02',392),

(1093,'logout_berhasil','172.31.29.69','Windows 10','Chrome','57.0.2987.98','','2018-02-04 10:55:52',514),

(1094,'logout_berhasil','172.31.39.24','Mac OS X','Safari','600.1.25','','2018-02-04 11:21:21',NULL),

(1095,'logout_berhasil','172.31.39.24','Android','Chrome','56.0.2924.87','','2018-02-05 10:32:53',455),

(1096,'logout_berhasil','172.31.29.69','Mac OS X','Safari','600.1.25','','2018-02-05 13:23:16',NULL),

(1097,'logout_berhasil','172.31.29.69','Windows 10','Chrome','63.0.3239.132','','2018-02-05 14:32:29',25),

(1098,'logout_berhasil','36.80.227.162','Windows 7','Chrome','57.0.2987.98','','2018-02-05 16:21:45',576),

(1099,'logout_berhasil','172.31.19.50','Windows 7','Firefox','59.0','','2018-02-05 17:01:23',480),

(1100,'logout_berhasil','36.80.227.162','Windows 10','Chrome','58.0.3014.0','','2018-02-05 17:29:11',474),

(1101,'logout_berhasil','36.80.227.162','Windows 8.1','Firefox','51.0','','2018-02-06 09:20:24',519),

(1102,'login_gagal','36.80.227.162','Windows 8.1','Firefox','51.0','','2018-02-06 09:23:12',517),

(1103,'logout_berhasil','36.80.227.162','Windows 10','Chrome','63.0.3239.132','','2018-02-06 09:24:51',474),

(1104,'logout_berhasil','172.31.19.50','Windows 10','Firefox','58.0','','2018-02-06 09:31:48',517),

(1105,'logout_berhasil','114.142.168.18','Windows 7','Chrome','57.0.2987.98','','2018-02-06 10:26:08',46),

(1106,'logout_berhasil','172.31.45.9','Windows 7','Firefox','58.0','','2018-02-06 10:33:33',9),

(1107,'logout_berhasil','172.31.45.9','Windows 7','Firefox','58.0','','2018-02-06 11:12:18',533),

(1108,'logout_berhasil','36.80.227.162','Windows 8.1','Firefox','57.0','','2018-02-06 11:14:40',69),

(1109,'logout_berhasil','36.80.227.162','Windows 8.1','Firefox','57.0','','2018-02-06 13:11:02',517),

(1110,'login_gagal','36.80.227.162','Windows 8.1','Firefox','57.0','','2018-02-06 13:11:19',558),

(1111,'login_gagal','36.80.227.162','Windows 8.1','Firefox','57.0','','2018-02-06 13:11:31',558),

(1112,'login_gagal','36.80.227.162','Windows 8.1','Firefox','57.0','','2018-02-06 13:11:51',558),

(1113,'login_gagal','36.80.227.162','Windows 8.1','Firefox','57.0','','2018-02-06 13:12:22',0),

(1114,'login_gagal','36.80.227.162','Windows 8.1','Firefox','57.0','','2018-02-06 13:12:42',0),

(1115,'login_gagal','36.80.227.162','Windows 8.1','Firefox','57.0','','2018-02-06 13:12:56',0),

(1116,'login_gagal','36.80.227.162','Windows 8.1','Firefox','57.0','','2018-02-06 13:13:12',0),

(1117,'logout_berhasil','54.85.182.120','Mac OS X','Safari','600.1.25','','2018-02-06 13:21:54',NULL),

(1118,'logout_berhasil','36.80.227.162','Windows 8.1','Firefox','57.0','','2018-02-06 13:56:14',558),

(1119,'login_gagal','36.80.227.162','Windows 8.1','Firefox','57.0','','2018-02-06 13:58:40',519),

(1120,'logout_berhasil','172.31.45.9','Windows 10','Firefox','58.0','','2018-02-06 14:06:07',558),

(1121,'logout_berhasil','172.31.45.9','Windows 7','Firefox','58.0','','2018-02-06 14:12:07',533),

(1122,'logout_berhasil','36.80.227.162','Windows 7','Chrome','63.0.3239.132','','2018-02-06 15:11:06',517),

(1123,'logout_berhasil','36.80.227.162','Windows 7','Chrome','64.0.3282.140','','2018-02-06 15:13:37',517),

(1124,'logout_berhasil','36.80.227.162','Windows 8.1','Firefox','57.0','','2018-02-06 15:23:28',519),

(1125,'logout_berhasil','36.72.219.115','Windows 7','Chrome','63.0.3239.132','','2018-02-06 16:03:53',500),

(1126,'logout_berhasil','172.31.21.245','Windows 10','Chrome','63.0.3239.132','','2018-02-06 16:05:22',455),

(1127,'logout_berhasil','36.80.227.162','Windows 7','Firefox','57.0','','2018-02-06 17:06:44',69),

(1128,'logout_berhasil','36.82.27.28','Windows 7','Firefox','58.0','','2018-02-06 17:14:20',NULL),

(1129,'login_gagal','172.31.44.111','Windows 7','Firefox','59.0','','2018-02-06 17:21:23',472),

(1130,'logout_berhasil','172.31.44.111','Mac OS X','Safari','600.1.25','','2018-02-06 17:38:27',NULL),

(1131,'logout_berhasil','36.72.219.115','Windows 7','Firefox','57.0','','2018-02-06 17:49:25',498),

(1132,'logout_berhasil','172.31.44.111','Windows 7','Firefox','59.0','','2018-02-06 17:49:59',472),

(1133,'logout_berhasil','172.31.44.111','Windows 7','Firefox','59.0','','2018-02-06 18:09:21',480),

(1134,'logout_berhasil','172.31.21.245','Windows 10','Firefox','58.0','','2018-02-06 23:24:15',558),

(1135,'logout_berhasil','172.31.21.245','Windows 7','Firefox','59.0','','2018-02-07 08:29:39',480),

(1136,'logout_berhasil','36.72.219.115','Windows 7','Chrome','63.0.3239.132','','2018-02-07 10:41:04',500),

(1137,'logout_berhasil','172.31.21.245','Windows 7','Chrome','63.0.3239.132','','2018-02-07 12:50:42',502),

(1138,'logout_berhasil','172.31.21.245','Windows 10','Chrome','63.0.3239.132','','2018-02-07 13:54:07',455),

(1139,'logout_berhasil','36.72.219.115','Windows 7','Chrome','63.0.3239.132','','2018-02-07 13:54:51',500),

(1140,'logout_berhasil','36.80.227.162','Windows 7','Chrome','57.0.2987.98','','2018-02-07 13:55:29',576),

(1141,'logout_berhasil','172.31.21.245','Windows 7','Firefox','59.0','','2018-02-07 14:16:54',480),

(1142,'logout_berhasil','172.31.44.111','Windows 10','Firefox','58.0','','2018-02-07 15:24:36',558),

(1143,'logout_berhasil','180.254.252.145','Windows 7','Chrome','63.0.3239.132','','2018-02-07 15:29:53',438),

(1144,'logout_berhasil','36.80.227.162','Windows 10','Firefox','56.0','','2018-02-07 17:34:21',370),

(1145,'logout_berhasil','172.31.21.245','Windows 10','Chrome','63.0.3239.132','','2018-02-07 17:39:02',455),

(1146,'login_gagal','172.31.21.245','Windows 7','Chrome','63.0.3239.132','','2018-02-07 17:42:53',566),

(1147,'logout_berhasil','36.82.27.28','Windows 7','Chrome','63.0.3239.132','','2018-02-07 18:07:13',547),

(1148,'logout_berhasil','172.31.44.111','Windows 7','Firefox','59.0','','2018-02-07 18:08:02',NULL),

(1149,'logout_berhasil','36.80.227.162','Windows 10','Chrome','58.0.3014.0','','2018-02-07 18:48:56',474),

(1150,'logout_berhasil','172.31.44.111','Windows 7','Firefox','58.0','','2018-02-07 18:55:55',451),

(1151,'logout_berhasil','172.31.44.111','Windows 7','Firefox','58.0','','2018-02-07 19:11:11',9),

(1152,'logout_berhasil','172.31.21.245','Windows 8.1','Chrome','57.0.2987.98','','2018-02-07 19:33:16',12),

(1153,'logout_berhasil','36.72.219.115','Windows 7','Firefox','57.0','','2018-02-07 19:36:12',498),

(1154,'logout_berhasil','172.31.21.245','Windows 8.1','Chrome','57.0.2987.98','','2018-02-07 20:22:23',12),

(1155,'logout_berhasil','36.72.219.115','Windows 7','Firefox','57.0','','2018-02-07 20:22:48',498),

(1156,'logout_berhasil','172.31.44.111','Windows 10','Firefox','58.0','','2018-02-07 20:38:36',474),

(1157,'logout_berhasil','172.31.21.245','Windows 10','Chrome','63.0.3239.132','','2018-02-07 20:38:51',474),

(1158,'logout_berhasil','36.72.219.115','Windows 7','Firefox','57.0','','2018-02-07 21:04:44',498),

(1159,'logout_berhasil','172.31.44.111','Windows 7','Chrome','56.0.2924.87','','2018-02-07 22:23:46',545),

(1160,'logout_berhasil','36.72.219.115','Windows 7','Chrome','64.0.3282.140','','2018-02-08 10:01:24',54),

(1161,'logout_berhasil','172.31.44.111','Windows 8.1','Firefox','58.0','','2018-02-08 10:40:09',345),

(1162,'logout_berhasil','115.178.235.1','Windows 10','Chrome','63.0.3239.132','','2018-02-08 10:57:22',515),

(1163,'logout_berhasil','172.31.44.111','Windows 10','Chrome','63.0.3239.132','','2018-02-08 10:57:31',455),

(1164,'logout_berhasil','172.31.21.245','Windows 10','Firefox','58.0','','2018-02-08 10:57:34',474),

(1165,'logout_berhasil','172.31.21.245','Windows 10','Chrome','63.0.3239.132','','2018-02-08 10:59:24',515),

(1166,'logout_berhasil','36.72.219.115','Windows 7','Firefox','57.0','','2018-02-08 11:30:42',498),

(1167,'logout_berhasil','172.31.44.111','Windows 7','Firefox','58.0','','2018-02-08 11:39:54',454),

(1168,'logout_berhasil','172.31.21.245','Windows 10','Chrome','64.0.3282.140','','2018-02-08 11:44:16',455),

(1169,'logout_berhasil','180.247.39.4','Windows 7','Chrome','64.0.3282.140','','2018-02-08 13:07:07',547),

(1170,'logout_berhasil','172.31.44.111','Windows 10','Chrome','63.0.3239.132','','2018-02-08 13:18:32',515),

(1171,'logout_berhasil','36.72.219.115','Windows 7','Chrome','64.0.3282.140','','2018-02-08 13:48:04',NULL),

(1172,'logout_berhasil','180.247.39.4','Windows 7','Firefox','58.0','','2018-02-08 14:15:25',549),

(1173,'logout_berhasil','36.72.219.115','Windows 7','Chrome','63.0.3239.132','','2018-02-08 15:15:35',500),

(1174,'logout_berhasil','36.72.219.115','Windows 7','Chrome','63.0.3239.132','','2018-02-08 15:15:41',NULL),

(1175,'logout_berhasil','172.31.44.111','Windows 10','Firefox','58.0','','2018-02-08 16:26:07',558),

(1176,'logout_berhasil','36.73.53.33','Windows 7','Chrome','64.0.3282.140','','2018-02-08 17:02:10',519),

(1177,'logout_berhasil','36.73.53.33','Windows 7','Chrome','64.0.3282.140','','2018-02-08 17:02:20',NULL),

(1178,'logout_berhasil','36.73.53.33','Windows 7','Chrome','64.0.3282.140','','2018-02-08 17:02:30',NULL),

(1179,'logout_berhasil','36.73.53.33','Windows 7','Chrome','64.0.3282.140','','2018-02-08 17:02:35',NULL),

(1180,'logout_berhasil','36.73.53.33','Windows 8.1','Firefox','51.0','','2018-02-08 17:16:41',519),

(1181,'logout_berhasil','172.31.21.245','Windows 7','Chrome','63.0.3239.132','','2018-02-08 17:30:53',579),

(1182,'logout_berhasil','36.79.26.135','Windows 7','Firefox','57.0','','2018-02-08 17:34:21',498),

(1183,'logout_berhasil','172.31.21.245','Mac OS X','Safari','600.1.25','','2018-02-08 17:42:05',NULL),

(1184,'logout_berhasil','172.31.21.245','Windows 8.1','Firefox','58.0','','2018-02-08 18:07:27',12),

(1185,'logout_berhasil','172.31.21.245','Windows 7','Firefox','57.0','','2018-02-08 18:22:45',NULL),

(1186,'logout_berhasil','54.85.182.120','Mac OS X','Safari','600.1.25','','2018-02-08 18:50:56',NULL),

(1187,'logout_berhasil','172.31.21.245','Windows 7','Firefox','57.0','','2018-02-08 19:11:26',54),

(1188,'logout_berhasil','172.31.44.111','Windows 7','Firefox','58.0','','2018-02-08 19:30:11',451),

(1189,'logout_berhasil','172.31.44.111','Windows 7','Chrome','63.0.3239.132','','2018-02-08 19:46:34',492),

(1190,'logout_berhasil','172.31.44.111','Windows 7','Firefox','58.0','','2018-02-08 20:18:13',498),

(1191,'logout_berhasil','36.79.26.135','Windows 7','Chrome','64.0.3282.140','','2018-02-08 20:50:50',NULL),

(1192,'logout_berhasil','172.31.44.111','Windows 7','Firefox','58.0','','2018-02-08 20:53:41',12),

(1193,'logout_berhasil','128.199.226.56','Windows 10','Chrome','64.0.3282.140','','2018-02-08 21:20:14',482),

(1194,'logout_berhasil','172.31.21.245','Windows 8.1','Chrome','57.0.2987.98','','2018-02-08 21:32:27',NULL),

(1195,'logout_berhasil','172.31.21.245','Windows 8.1','Chrome','57.0.2987.98','','2018-02-08 21:33:29',491),

(1196,'logout_berhasil','139.59.237.194','Windows 10','Chrome','64.0.3282.140','','2018-02-08 22:27:00',72),

(1197,'logout_berhasil','114.124.134.127','Windows 8.1','Firefox','51.0','','2018-02-08 23:02:10',519),

(1198,'logout_berhasil','114.124.245.99','Windows 7','Chrome','63.0.3239.132','','2018-02-09 00:17:25',470),

(1199,'logout_berhasil','114.124.245.99','Windows 7','Chrome','63.0.3239.132','','2018-02-09 00:17:25',470),

(1200,'logout_berhasil','114.124.245.99','Windows 7','Chrome','63.0.3239.132','','2018-02-09 00:18:29',NULL),

(1201,'logout_berhasil','114.124.245.99','Windows 7','Chrome','63.0.3239.132','','2018-02-09 00:18:29',NULL),

(1202,'logout_berhasil','172.31.21.245','Windows 7','Firefox','59.0','','2018-02-09 08:34:48',12),

(1203,'logout_berhasil','172.31.44.111','Windows 10','Firefox','58.0','','2018-02-09 09:07:42',550),

(1204,'logout_berhasil','36.79.130.181','Windows 7','Firefox','58.0','','2018-02-09 10:26:00',46),

(1205,'logout_berhasil','180.254.85.33','Windows 7','Chrome','63.0.3239.132','','2018-02-09 11:35:41',470),

(1206,'logout_berhasil','180.254.85.33','Windows 7','Chrome','63.0.3239.132','','2018-02-09 11:38:24',470),

(1207,'logout_berhasil','36.73.53.33','Windows 8.1','Firefox','51.0','','2018-02-09 11:41:16',519),

(1208,'logout_berhasil','172.31.21.245','Windows 8.1','Chrome','63.0.3239.132','','2018-02-09 12:59:07',357),

(1209,'logout_berhasil','172.31.21.245','Windows 7','Chrome','63.0.3239.132','','2018-02-09 13:43:17',NULL),

(1210,'logout_berhasil','172.31.21.245','Windows 10','Chrome','63.0.3239.132','','2018-02-09 14:12:46',579),

(1211,'logout_berhasil','36.79.157.64','Windows 7','Firefox','58.0','','2018-02-09 15:37:51',72),

(1212,'logout_berhasil','172.31.44.111','Windows 7','Firefox','58.0','','2018-02-09 15:38:33',489),

(1213,'logout_berhasil','36.79.157.64','Windows 7','Firefox','58.0','','2018-02-09 15:49:18',451),

(1214,'logout_berhasil','180.245.209.174','Windows 7','Firefox','58.0','','2018-02-09 16:59:32',488),

(1215,'logout_berhasil','36.73.53.33','Windows 10','Firefox','58.0','','2018-02-09 18:34:59',370),

(1216,'logout_berhasil','172.31.44.111','Windows 7','Chrome','64.0.3282.140','','2018-02-09 19:13:32',451),

(1217,'logout_berhasil','172.31.21.245','Windows 10','Firefox','58.0','','2018-02-09 20:04:23',474),

(1218,'logout_berhasil','172.31.44.111','Windows 8.1','Firefox','51.0','','2018-02-10 08:51:54',519),

(1219,'logout_berhasil','172.31.21.245','Windows 7','Firefox','57.0','','2018-02-10 09:53:47',422),

(1220,'logout_berhasil','172.31.21.245','Mac OS X','Safari','600.1.25','','2018-02-10 09:54:49',NULL),

(1221,'logout_berhasil','172.31.44.111','Windows 7','Firefox','58.0','','2018-02-10 09:55:56',428),

(1222,'logout_berhasil','172.31.44.111','Windows 7','Firefox','58.0','','2018-02-10 09:56:32',44),

(1223,'logout_berhasil','36.80.201.202','Windows 7','Chrome','57.0.2987.98','','2018-02-10 10:40:36',355),

(1224,'logout_berhasil','36.80.201.202','Windows 7','Chrome','57.0.2987.98','','2018-02-10 10:42:34',355),

(1225,'logout_berhasil','36.80.201.202','Windows 7','Chrome','64.0.3282.140','','2018-02-10 10:59:58',438),

(1226,'logout_berhasil','36.80.201.202','Windows 7','Chrome','57.0.2987.98','','2018-02-10 11:00:16',343),

(1227,'logout_berhasil','36.80.201.202','Windows 7','Chrome','57.0.2987.98','','2018-02-10 11:00:28',NULL),

(1228,'logout_berhasil','36.80.201.202','Windows 7','Chrome','57.0.2987.98','','2018-02-10 11:02:31',438),

(1229,'logout_berhasil','36.80.201.202','Windows 7','Chrome','57.0.2987.98','','2018-02-10 11:02:36',NULL),

(1230,'logout_berhasil','36.80.201.202','Windows 7','Chrome','57.0.2987.98','','2018-02-10 11:03:41',355),

(1231,'logout_berhasil','36.80.201.202','Windows 7','Chrome','57.0.2987.98','','2018-02-10 11:03:46',NULL),

(1232,'logout_berhasil','36.80.201.202','Windows 7','Chrome','57.0.2987.98','','2018-02-10 11:04:34',343),

(1233,'logout_berhasil','36.80.201.202','Windows 7','Chrome','57.0.2987.98','','2018-02-10 11:04:44',NULL),

(1234,'logout_berhasil','172.31.21.245','Windows 10','Firefox','58.0','','2018-02-10 11:30:13',474),

(1235,'logout_berhasil','117.20.53.88','Windows 7','Chrome','62.0.3202.94','','2018-02-10 16:13:01',517),

(1236,'logout_berhasil','36.73.53.33','Windows 10','Firefox','58.0','','2018-02-10 16:58:00',370),

(1237,'logout_berhasil','172.31.21.245','Windows 7','Chrome','57.0.2987.98','','2018-02-10 17:28:27',395),

(1238,'logout_berhasil','172.31.21.245','Windows 7','Chrome','62.0.3202.89','','2018-02-10 19:44:30',NULL),

(1239,'logout_berhasil','172.31.21.245','Windows 10','Firefox','58.0','','2018-02-10 20:04:46',474),

(1240,'logout_berhasil','172.31.21.245','Windows 10','Firefox','58.0','','2018-02-11 16:43:38',NULL),

(1241,'logout_berhasil','172.31.21.245','Windows 7','Chrome','62.0.3202.89','','2018-02-11 16:53:51',NULL),

(1242,'logout_berhasil','172.31.21.245','Windows 10','Firefox','58.0','','2018-02-12 08:39:48',474),

(1243,'logout_berhasil','36.73.126.53','Windows 7','Chrome','64.0.3282.140','','2018-02-12 09:45:26',474),

(1244,'logout_berhasil','36.73.126.53','Windows 10','Firefox','58.0','','2018-02-12 11:33:53',NULL),

(1245,'logout_berhasil','36.73.126.53','Windows 7','Chrome','62.0.3202.89','','2018-02-12 18:03:14',573),

(1246,'logout_berhasil','36.73.126.53','Windows 10','Firefox','58.0','','2018-02-12 19:22:14',474),

(1247,'logout_berhasil','36.72.212.34','Windows 10','Firefox','58.0','','2018-02-13 19:58:10',NULL),

(1248,'logout_berhasil','36.72.212.34','Windows 10','Firefox','58.0','','2018-02-14 20:57:56',NULL),

(1249,'logout_berhasil','36.72.212.34','Windows 10','Firefox','58.0','','2018-02-14 20:58:01',NULL),

(1250,'logout_berhasil','36.74.190.231','Windows 7','Chrome','64.0.3282.167','','2018-02-15 14:46:57',342),

(1251,'logout_berhasil','36.74.190.231','Windows 7','Firefox','58.0','','2018-02-15 14:55:25',549),

(1252,'login_gagal','::1','Windows 10','Firefox','58.0','','2018-02-18 14:50:34',44);

/*Table structure for table `outlet` */

DROP TABLE IF EXISTS `outlet`;

CREATE TABLE `outlet` (
  `outletID` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `areaID` tinyint(3) unsigned NOT NULL,
  `outletName` varchar(45) DEFAULT NULL,
  `outletAddress` varchar(100) DEFAULT NULL,
  `outletStatus` tinyint(1) DEFAULT NULL,
  `createdDate` datetime DEFAULT NULL,
  `createdUserID` int(11) unsigned NOT NULL,
  PRIMARY KEY (`outletID`),
  KEY `areaID` (`areaID`),
  CONSTRAINT `outlet_ibfk_1` FOREIGN KEY (`areaID`) REFERENCES `area` (`areaID`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=100 DEFAULT CHARSET=latin1;

/*Data for the table `outlet` */

insert  into `outlet`(`outletID`,`areaID`,`outletName`,`outletAddress`,`outletStatus`,`createdDate`,`createdUserID`) values 

(1,1,'Management Pusat','ini alamat',1,'2017-12-10 16:10:00',1),

(2,1,'WSSM Malaysia','ini alamat',1,'2017-12-10 16:10:00',1),

(3,2,'Management Jabodetabek','ini alamat',1,'2017-12-10 16:10:00',1),

(4,2,'WSSM Gading Serpong','ini alamat',1,'2017-12-10 16:10:00',1),

(5,2,'WSSM BSD','ini alamat',1,'2017-12-10 16:10:00',1),

(6,2,'WSSM Lippo Asiatic','ini alamat',1,'2017-12-10 16:10:00',1),

(7,2,'WSSM Kisamaun','ini alamat',1,'2017-12-10 16:10:00',1),

(8,2,'WSSM Bintaro #1','ini alamat',1,'2017-12-10 16:10:00',1),

(9,2,'WSSM Citra Raya','ini alamat',1,'2017-12-10 16:10:00',1),

(10,2,'WSSM L\'Agricola','ini alamat',1,'2017-12-10 16:10:00',1),

(11,2,'WSSM Bogor Yasmin','ini alamat',1,'2017-12-10 16:10:00',1),

(12,2,'WSSM Greenville','ini alamat',1,'2017-12-10 16:10:00',1),

(13,2,'WSSM Palemsemi','ini alamat',1,'2017-12-10 16:10:00',1),

(14,2,'WSSM Bintaro #2','ini alamat',1,'2017-12-10 16:10:00',1),

(15,2,'WSSM Tanjung Duren #2','ini alamat',1,'2017-12-10 16:10:00',1),

(16,2,'WSSM Bekasi','ini alamat',1,'2017-12-10 16:10:00',1),

(17,2,'WSSA Taman Sari','ini alamat',1,'2017-12-10 16:10:00',1),

(18,3,'Management Purwokerto','ini alamat',1,'2017-12-10 16:10:00',1),

(19,3,'WSSM Jatinangor','ini alamat',1,'2017-12-10 16:10:00',1),

(20,3,'WSSM Cirebon Ampera','ini alamat',1,'2017-12-10 16:10:00',1),

(21,3,'WSSM Cirebon Tuparev','ini alamat',1,'2017-12-10 16:10:00',1),

(22,3,'WSSM Purwokerto GOR Satria','ini alamat',1,'2017-12-10 16:10:00',1),

(23,3,'WSSM Purwokerto Wiryaatmaja','ini alamat',1,'2017-12-10 16:10:00',1),

(24,3,'WSSM Cilacap','ini alamat',1,'2017-12-10 16:10:00',1),

(25,3,'WSSM Purbalingga','ini alamat',1,'2017-12-10 16:10:00',1),

(26,4,'Management Perintis','ini alamat',1,'2017-12-10 16:10:00',1),

(27,4,'WSSM Magelang','ini alamat',1,'2017-12-10 16:10:00',1),

(28,4,'WSSM Prambanan','ini alamat',1,'2017-12-10 16:10:00',1),

(29,4,'WSSM Palagan','ini alamat',1,'2017-12-10 16:10:00',1),

(30,4,'WSSM Megatruh','ini alamat',1,'2017-12-10 16:10:00',1),

(31,4,'WSSM Kulon Progo','ini alamat',1,'2017-12-10 16:10:00',1),

(32,5,'Management Yogyakarta','ini alamat',1,'2017-12-10 16:10:00',1),

(33,5,'WSSA Perjuangan','ini alamat',1,'2017-12-10 16:10:00',1),

(34,5,'WSSA Concat Barat','ini alamat',1,'2017-12-10 16:10:00',1),

(35,5,'WSSA Babarsari Barat','ini alamat',1,'2017-12-10 16:10:00',1),

(36,5,'WSSA Pandega Martha','ini alamat',1,'2017-12-10 16:10:00',1),

(37,5,'WSSA Besi','ini alamat',1,'2017-12-10 16:10:00',1),

(38,5,'WSSA Kusumanegara','ini alamat',1,'2017-12-10 16:10:00',1),

(39,5,'WSSA Monjali','ini alamat',1,'2017-12-10 16:10:00',1),

(40,5,'WSSA Godean','ini alamat',1,'2017-12-10 16:10:00',1),

(41,5,'WSSA Concat Timur','ini alamat',1,'2017-12-10 16:10:00',1),

(42,5,'WSSA Plengkung Gading','ini alamat',1,'2017-12-10 16:10:00',1),

(43,5,'WSSA Samirono','ini alamat',1,'2017-12-10 16:10:00',1),

(44,5,'WSSA Babarsari Timur','ini alamat',1,'2017-12-10 16:10:00',1),

(45,5,'WSSA Veteran','ini alamat',1,'2017-12-10 16:10:00',1),

(46,5,'WSSM Wonosari','ini alamat',1,'2017-12-10 16:10:00',1),

(47,5,'WSSM Bantul','ini alamat',1,'2017-12-10 16:10:00',1),

(48,5,'WSSM Parangtritis','ini alamat',1,'2017-12-10 16:10:00',1),

(49,5,'WSSA Kyai Mojo','ini alamat',1,'2017-12-10 16:10:00',1),

(50,6,'Management Semarang','ini alamat',1,'2017-12-10 16:10:00',1),

(51,6,'WSSM Sompok','ini alamat',1,'2017-12-10 16:10:00',1),

(52,6,'WSSM Tembalang','ini alamat',1,'2017-12-10 16:10:00',1),

(53,6,'WSSM Tembalang #2','ini alamat',1,'2017-12-10 16:10:00',1),

(54,6,'WSSM Puri','ini alamat',1,'2017-12-10 16:10:00',1),

(55,6,'WSSM Sambiroto','ini alamat',1,'2017-12-10 16:10:00',1),

(56,6,'WSSM Lampersari','ini alamat',1,'2017-12-10 16:10:00',1),

(57,6,'WSSM Ngaliyan','ini alamat',1,'2017-12-10 16:10:00',1),

(58,6,'WSSM Ungaran','ini alamat',1,'2017-12-10 16:10:00',1),

(59,6,'WSSM Sampangan','ini alamat',1,'2017-12-10 16:10:00',1),

(60,6,'WSSM Salatiga Diponegoro','ini alamat',1,'2017-12-10 16:10:00',1),

(61,6,'WSSM Salatiga Sudirman','ini alamat',1,'2017-12-10 16:10:00',1),

(62,6,'WSSM Pekalongan','ini alamat',1,'2017-12-10 16:10:00',1),

(63,6,'WSSM Tegal','ini alamat',1,'2018-01-25 20:20:01',44),

(64,6,'WSSM Pati','ini alamat',1,'2017-12-10 16:10:00',1),

(65,6,'WSSM Kudus','ini alamat',1,'2017-12-10 16:10:00',1),

(66,6,'WSSM Kendal','ini alamat',1,'2017-12-10 16:10:00',1),

(67,7,'Management Solo','ini alamat',1,'2017-12-10 16:10:00',1),

(68,7,'WSSA Manahan Barat','ini alamat',1,'2017-12-10 16:10:00',1),

(69,7,'WSSA Gonilan','ini alamat',1,'2017-12-10 16:10:00',1),

(70,7,'WSSA Solo Baru','ini alamat',1,'2017-12-10 16:10:00',1),

(71,7,'WSSA Jurug','ini alamat',1,'2017-12-10 16:10:00',1),

(72,7,'WSSA Kerten','ini alamat',1,'2017-12-10 16:10:00',1),

(73,7,'WSSM Manahan Timur','ini alamat',1,'2017-12-10 16:10:00',1),

(74,7,'WSSM Patimura','ini alamat',1,'2017-12-10 16:10:00',1),

(75,7,'WSSM Boyolali #1','ini alamat',1,'2017-12-10 16:10:00',1),

(76,7,'WSSA Boyolali #2','ini alamat',1,'2017-12-10 16:10:00',1),

(77,7,'WSSM Sragen','ini alamat',1,'2017-12-10 16:10:00',1),

(78,7,'WSSM Karanganyar','ini alamat',1,'2017-12-10 16:10:00',1),

(79,7,'WSSM Wonogiri','ini alamat',1,'2017-12-10 16:10:00',1),

(80,7,'WSSM Klaten','ini alamat',1,'2017-12-10 16:10:00',1),

(81,7,'WSSA Banyundono','ini alamat',1,'2017-12-10 16:10:00',1),

(82,8,'Management Malang','ini alamat',1,'2017-12-10 16:10:00',1),

(83,8,'WSSM Madiun','ini alamat',1,'2017-12-10 16:10:00',1),

(84,8,'WSSM Kediri','ini alamat',1,'2017-12-10 16:10:00',1),

(85,8,'WSSM Malang Sengkaling','ini alamat',1,'2017-12-10 16:10:00',1),

(86,8,'WSSM Malang Ciliwung','ini alamat',1,'2017-12-10 16:10:00',1),

(87,8,'WSSM Surabaya Arjuna Raya','ini alamat',1,'2017-12-10 16:10:00',1),

(88,8,'WSSM Surabaya Mulyorejo','ini alamat',1,'2017-12-10 16:10:00',1),

(89,8,'WSSM Jember','ini alamat',1,'2017-12-10 16:10:00',1),

(90,8,'WSSM Surabaya #3','ini alamat',1,'2017-12-10 16:10:00',1),

(91,9,'Management Bali','ini alamat',1,'2017-12-10 16:10:00',1),

(92,9,'WSSM Bali Batubulan','ini alamat',1,'2017-12-10 16:10:00',1),

(93,9,'WSSM Bali Tukad Barito','ini alamat',1,'2017-12-10 16:10:00',1),

(94,9,'WSSM Bali #3','ini alamat',1,'2017-12-10 16:10:00',1),

(95,5,'Dapur 1 jogja','jogja',1,'2018-01-01 16:33:35',25),

(96,7,'Dapur 1 solo','-',1,'2018-01-01 16:31:30',25),

(97,3,'WSSM Bandung','-',1,'2018-01-08 10:56:56',25),

(98,5,'SS d halal mart','-',1,'2018-01-28 17:02:35',25),

(99,9,'SS bali #4','-',1,'2018-01-28 17:02:23',25);

/*Table structure for table `personel` */

DROP TABLE IF EXISTS `personel`;

CREATE TABLE `personel` (
  `personelID` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `personelNIK` varchar(20) NOT NULL,
  `personelName` varchar(50) NOT NULL,
  `personelStatus` varchar(15) NOT NULL,
  `alamatKTP` text,
  `alamatDomisili` text,
  `personelBank` varchar(25) DEFAULT NULL,
  `personelRekening` varchar(20) DEFAULT NULL,
  `wilayahKerjaID` int(11) unsigned DEFAULT NULL,
  `levelID` int(11) unsigned DEFAULT NULL,
  `baganID` int(11) unsigned DEFAULT NULL,
  `outletID` int(11) unsigned DEFAULT NULL,
  `createdDate` datetime DEFAULT NULL,
  `createdUserID` int(11) unsigned DEFAULT NULL,
  PRIMARY KEY (`personelID`),
  KEY `levelID` (`levelID`),
  KEY `baganID` (`baganID`),
  KEY `outletID` (`outletID`),
  KEY `wilayahKerjaID` (`wilayahKerjaID`),
  CONSTRAINT `personel_ibfk_1` FOREIGN KEY (`levelID`) REFERENCES `level` (`levelID`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `personel_ibfk_2` FOREIGN KEY (`baganID`) REFERENCES `bagan` (`baganID`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `personel_ibfk_3` FOREIGN KEY (`outletID`) REFERENCES `outlet` (`outletID`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `personel_ibfk_4` FOREIGN KEY (`wilayahKerjaID`) REFERENCES `wilayahkerja` (`wilayahKerjaID`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `personel` */

/*Table structure for table `roles` */

DROP TABLE IF EXISTS `roles`;

CREATE TABLE `roles` (
  `roleID` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `roleName` varchar(40) NOT NULL,
  `roleAlias` varchar(50) NOT NULL,
  PRIMARY KEY (`roleID`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

/*Data for the table `roles` */

insert  into `roles`(`roleID`,`roleName`,`roleAlias`) values 

(1,'super_admin','Super Admin'),

(2,'member','Member');

/*Table structure for table `roles_groups` */

DROP TABLE IF EXISTS `roles_groups`;

CREATE TABLE `roles_groups` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `roleID` int(11) unsigned NOT NULL,
  `group_id` mediumint(8) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_roles_groups_groups` (`group_id`),
  KEY `FK_roles_groups_roles` (`roleID`),
  CONSTRAINT `FK_roles_groups_groups` FOREIGN KEY (`group_id`) REFERENCES `groups` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION,
  CONSTRAINT `FK_roles_groups_roles` FOREIGN KEY (`roleID`) REFERENCES `roles` (`roleID`) ON DELETE CASCADE ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=latin1;

/*Data for the table `roles_groups` */

insert  into `roles_groups`(`id`,`roleID`,`group_id`) values 

(1,1,1),

(3,1,3),

(4,2,2),

(6,1,4),

(7,1,5),

(8,1,6),

(9,1,7),

(10,1,2);

/*Table structure for table `subdivisions` */

DROP TABLE IF EXISTS `subdivisions`;

CREATE TABLE `subdivisions` (
  `subdivID` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `divisionID` int(11) unsigned NOT NULL,
  `subdivName` varchar(100) NOT NULL,
  `subdivStatus` tinyint(1) NOT NULL,
  `order` int(11) DEFAULT NULL,
  `createdDate` datetime NOT NULL,
  `createdUserID` int(11) unsigned NOT NULL,
  PRIMARY KEY (`subdivID`),
  KEY `divisionID` (`divisionID`),
  CONSTRAINT `subdivisions_ibfk_1` FOREIGN KEY (`divisionID`) REFERENCES `divisions` (`divisionID`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=127 DEFAULT CHARSET=latin1;

/*Data for the table `subdivisions` */

insert  into `subdivisions`(`subdivID`,`divisionID`,`subdivName`,`subdivStatus`,`order`,`createdDate`,`createdUserID`) values 

(1,1,'Kontrol & Pengembangan Kualitas Rasa',1,NULL,'2018-08-23 09:03:00',1),

(2,1,'Kontrol Operasi',1,NULL,'2018-08-24 09:03:00',1),

(3,2,'Kesekretariatan Direktur',1,NULL,'2018-08-25 09:03:00',1),

(4,3,'Legal',1,NULL,'2018-08-26 09:03:00',1),

(5,3,'Humas dan Penyaluran Dana Sosial (PDS)',1,NULL,'2017-12-25 18:58:56',25),

(7,4,'Pengembangan dan Kerjasama',1,NULL,'2018-01-06 15:40:14',44),

(8,4,'Training PA-PG',1,NULL,'2018-08-30 09:03:00',1),

(9,4,'Distribusi',1,NULL,'2018-08-31 09:03:00',1),

(10,5,'Pengembangan Produksi',1,NULL,'2018-09-01 09:03:00',1),

(11,5,'Training Produksi',1,NULL,'2018-09-02 09:03:00',1),

(12,6,'Pengembangan P2O (PUSAT)',1,NULL,'2017-12-27 08:21:30',519),

(13,6,'Training P2O (PUSAT)',1,NULL,'2017-12-27 08:21:39',519),

(15,7,'Pemasaran',1,NULL,'2018-01-06 16:34:38',44),

(16,7,'Penjualan',1,NULL,'2018-01-06 16:34:21',44),

(17,7,'Desain',1,NULL,'2018-01-06 16:34:49',44),

(18,8,'Keuangan Perusahaan',1,NULL,'2018-09-09 09:03:00',1),

(19,8,'Pajak',1,NULL,'2018-09-10 09:03:00',1),

(20,8,'Keuangan Distribusi',1,NULL,'2018-09-11 09:03:00',1),

(21,9,'Verifikasi Anggaran',1,NULL,'2018-09-12 09:03:00',1),

(22,9,'Kontrol Penggunaan Anggaran',1,NULL,'2017-12-30 09:31:38',474),

(23,10,'Operasionalisasi dan Pengelolaan SDM Keuangan',1,NULL,'2018-01-04 08:43:27',44),

(24,11,'Penyajian Laporan Keuangan (Laba/Rugi)',1,NULL,'2018-01-03 14:21:20',44),

(25,11,'Monitoring dan Kontrol atas Proses Akuntansi di Waroeng',1,NULL,'2018-01-03 14:22:07',44),

(26,12,'General Accounting',1,NULL,'2018-09-17 09:03:00',1),

(27,12,'Sales Control',1,NULL,'2018-09-18 09:03:00',1),

(30,14,'Pengembangan Training',0,NULL,'2018-01-06 18:10:14',44),

(31,14,'Administrasi & Penunjang Training',0,NULL,'2018-01-06 18:09:15',44),

(32,14,'Pengembangan Spiritualitas',0,NULL,'2018-01-06 18:09:44',44),

(33,15,'Penyelenggaraan Event',1,NULL,'2018-01-06 14:36:17',44),

(34,15,'Penunjang Event dan Admin',1,NULL,'2018-01-06 14:36:54',44),

(35,16,'Pengelolaan Kesra',1,NULL,'2017-12-27 15:41:46',25),

(37,16,'Pengelolaan JPS dan Kesra Keluarga',1,NULL,'2017-12-27 15:42:07',25),

(40,18,'Pengelolaan Prasarana & Alat (PSA) Kantor',1,1,'2018-01-05 17:34:12',25),

(41,18,'Pengelolaan Traffic dan Armada',1,3,'2018-01-05 17:36:32',25),

(42,19,'Pengelolaan Jaringan',1,NULL,'2018-01-04 09:04:44',25),

(43,19,'Pengelolaan Hardware',1,NULL,'2018-01-04 09:04:04',25),

(44,20,'Pembuatan Software Waroeng',1,NULL,'2018-01-04 09:01:50',25),

(45,20,'Pembuatan software manajemen waroeng',1,NULL,'2018-01-04 09:02:39',25),

(46,21,'Audit keuangan',1,NULL,'2018-01-02 10:15:31',25),

(47,21,'Audit proses kerja',1,NULL,'2018-01-02 10:15:16',25),

(48,22,'Koperasi',1,NULL,'2018-10-09 09:03:00',1),

(49,3,'Spiritualitas',1,NULL,'2017-12-25 18:58:47',25),

(50,6,'Operasional PSA (AREA)',1,NULL,'2017-12-27 08:23:00',519),

(51,6,'Pelayanan & Penanganan Komplain (AREA)',1,NULL,'2017-12-27 08:23:12',519),

(52,7,'Pemasaran (Area)',0,NULL,'2018-01-06 16:33:59',44),

(53,7,'Penjualan (Area)',0,NULL,'2018-01-06 16:34:11',44),

(54,7,'Desain (Area)',0,NULL,'2018-01-06 16:33:47',44),

(58,17,'Pengelolaan Fasilitas SDM di Waroeng',1,NULL,'0000-00-00 00:00:00',0),

(59,17,'Pengelolaan Fasilitas Kerja Personel',1,NULL,'0000-00-00 00:00:00',0),

(60,17,'Pengelolaan Kehadiran Personel\r\n\r\n',1,NULL,'0000-00-00 00:00:00',0),

(61,17,'Pengelolaan Aktifitas Kekeluargaan\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n',1,NULL,'0000-00-00 00:00:00',0),

(62,17,'Penerbitan dan Distribusi Media Silaturahmi\r\n\r\n',1,NULL,'0000-00-00 00:00:00',0),

(63,9,'Perencanaan & Evaluasi Anggaran',1,NULL,'2017-12-30 09:33:46',474),

(67,24,'Rekrutment dan Pengelolaan MT',1,NULL,'2017-12-31 13:42:07',25),

(69,24,'Penilaian Kinerja Manajemen',1,NULL,'2017-12-31 13:41:44',25),

(72,26,'Pemenuhan Personil Waroeng',1,NULL,'2017-12-31 13:43:24',25),

(73,26,'Operasional Kerja Organisasi Waroeng',1,NULL,'2017-12-31 13:43:03',25),

(76,26,'Penegakan Aturan Kerja',1,NULL,'2017-12-31 13:43:51',25),

(77,5,'RPK + Training',1,NULL,'2018-01-04 10:00:35',25),

(78,5,'PSA Produksi',1,NULL,'2018-01-02 13:27:55',25),

(79,10,'Pengelolaan Prasarana-Sarana dan Alat-alat (PSA) Keuangan',1,NULL,'2018-01-04 08:44:20',44),

(80,10,'Pengembangan Standard-Mekanisme, Training dan Administrasi',1,NULL,'2018-01-04 08:45:10',44),

(81,20,'Pembuatan software manajemen kantor',1,NULL,'2018-01-04 09:03:35',25),

(82,27,'Penerapan Software dan Perangkat IT',1,NULL,'2018-01-04 09:05:32',25),

(83,27,'Monitoring dan Troubleshooting dan Training',1,NULL,'2018-01-04 09:06:32',25),

(84,5,'Operasional Produksi & efisiensi',1,NULL,'2018-01-04 10:00:48',25),

(85,18,'Kepala Kantor',1,2,'2018-01-05 17:36:11',25),

(86,14,'Training Managerial dan Keahlian',1,NULL,'2018-01-06 13:46:05',44),

(87,4,'Pengadaan',1,NULL,'2018-01-06 15:40:30',44),

(88,4,'Pergudangan',1,NULL,'2018-01-06 15:48:50',44),

(89,14,'Training Waroeng',1,NULL,'2018-01-06 18:10:32',44),

(90,28,'Manager Pusat Pengembangan Operasi',1,NULL,'2018-01-08 16:12:09',25),

(91,28,'Manager Pusat IT',1,NULL,'2018-01-08 16:12:24',25),

(92,28,'Manager Pusat SDM',1,NULL,'2018-01-08 16:12:38',25),

(93,28,'Manager Pusat Keuangan',1,NULL,'2018-01-08 16:12:56',25),

(94,28,'Manager Area Jabodetabek',1,NULL,'2018-01-08 16:13:28',25),

(95,28,'Manager Area Purwokerto',1,NULL,'2018-01-08 16:13:42',25),

(96,28,'Manager Area Printis',1,NULL,'2018-01-08 16:13:55',25),

(97,28,'Manager Area Semarang',1,NULL,'2018-01-08 16:14:09',25),

(98,28,'Manager Area Jogja',1,NULL,'2018-01-08 16:14:24',25),

(99,28,'Manager Area Solo',1,NULL,'2018-01-08 16:14:36',25),

(100,28,'Manager Area Malang',1,NULL,'2018-01-08 16:14:48',25),

(101,28,'Manager Area Bali',1,NULL,'2018-01-08 16:15:05',25),

(102,1,'Pengelolaan dan Pembangunan Tim Pengembangan Usaha',1,NULL,'2018-01-13 16:31:43',44),

(103,2,'Pengelolaan dan Pembangunan Tim Kesekretariatan Direktur',1,NULL,'2018-01-13 16:31:24',44),

(104,3,'Pengelolaan dan Pembangunan Tim HLS',1,NULL,'2018-01-13 16:31:57',44),

(105,4,'Pengelolaan dan Pembangunan Tim PAPG',1,NULL,'2018-01-13 16:32:11',44),

(106,5,'Pengelolaan dan Pembangunan Tim Produksi',1,NULL,'2018-01-13 16:32:28',44),

(107,6,'Pengelolaan dan Pembangunan Tim P2O',1,NULL,'2018-01-13 16:32:56',44),

(108,7,'Pengelolaan dan Pembangunan Tim Pemasaran dan Penjualan',1,NULL,'2018-01-13 16:33:16',44),

(109,8,'Pengelolaan dan Pembangunan Tim Keuangan Perusahaan dan Pajak',1,NULL,'2018-01-13 16:33:46',44),

(110,9,'Pengelolaan dan Pembangunan Tim Anggaran & Kontrol Penggunaan',1,NULL,'2018-01-13 16:37:26',44),

(111,10,'Pengelolaan dan Pembangunan Tim Operasional Keuangan',1,NULL,'2018-01-13 16:37:48',44),

(112,11,'Pengelolaan dan Pembangunan Tim Cost Accounting',1,NULL,'2018-01-13 16:38:12',44),

(113,12,'Pengelolaan dan Pembangunan Tim General Accounting',1,NULL,'2018-01-13 16:38:35',44),

(114,14,'Pengelolaan dan Pembangunan Tim Training',1,NULL,'2018-01-13 16:38:54',44),

(115,15,'Pengelolaan dan Pembangunan Tim Event',1,NULL,'2018-01-13 16:39:08',44),

(116,16,'Pengelolaan dan Pembangunan Tim Kesra Dana',1,NULL,'2018-01-13 16:39:24',44),

(117,17,'Pengelolaan dan Pembangunan Tim Kesra Fasilitas',1,NULL,'2018-01-13 16:39:45',44),

(118,18,'Pengelolaan dan Pembangunan Tim Rumah Tangga & Traffic',1,NULL,'2018-01-13 16:41:31',44),

(119,19,'Pengelolaan dan Pembangunan Tim Pengelolaan Hardware dan Jaringan',1,NULL,'2018-01-13 16:42:03',44),

(120,20,'Pengelolaan dan Pembangunan Tim Pembuatan Software',1,NULL,'2018-01-13 16:43:24',44),

(121,21,'Pengelolaan dan Pembangunan Tim Internal Audit',1,NULL,'2018-01-13 16:43:49',44),

(122,22,'Pengelolaan dan Pembangunan Tim Koperasi',1,NULL,'2018-01-13 16:44:03',44),

(123,24,'Pengelolaan dan Pembangunan Tim PPM',1,NULL,'2018-01-13 16:44:31',44),

(124,26,'Pengelolaan dan Pembangunan Tim Rekruitmen dan Penegakan Aturan',1,NULL,'2018-01-13 16:45:11',44),

(125,27,'Pengelolaan dan Pembangunan Tim Operasional Umum IT',1,NULL,'2018-01-13 16:45:37',44),

(126,28,'Pengelolaan dan Pembangunan Tim Manager',1,NULL,'2018-01-13 16:45:53',44);

/*Table structure for table `userarea` */

DROP TABLE IF EXISTS `userarea`;

CREATE TABLE `userarea` (
  `userareaID` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `userID` int(11) unsigned NOT NULL,
  `areaID` tinyint(3) unsigned NOT NULL,
  PRIMARY KEY (`userareaID`),
  KEY `userID` (`userID`),
  KEY `areaID` (`areaID`),
  CONSTRAINT `userarea_ibfk_1` FOREIGN KEY (`userID`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `userarea_ibfk_2` FOREIGN KEY (`areaID`) REFERENCES `area` (`areaID`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=675 DEFAULT CHARSET=latin1;

/*Data for the table `userarea` */

insert  into `userarea`(`userareaID`,`userID`,`areaID`) values 

(10,46,5),

(12,54,6),

(13,72,7),

(14,342,8),

(15,343,3),

(16,345,2),

(17,357,9),

(18,28,4),

(20,475,1),

(21,475,4),

(22,475,5),

(23,475,7),

(24,44,1),

(25,44,2),

(26,44,3),

(27,44,4),

(28,44,5),

(29,44,6),

(30,44,7),

(31,44,8),

(32,44,9),

(33,474,1),

(34,474,2),

(35,474,3),

(36,474,4),

(37,474,5),

(38,474,6),

(39,474,7),

(40,474,8),

(41,474,9),

(42,451,7),

(43,449,7),

(44,478,7),

(45,73,7),

(46,74,7),

(47,333,7),

(48,75,7),

(49,479,7),

(50,480,7),

(51,455,7),

(52,472,7),

(53,481,7),

(54,482,7),

(55,484,7),

(56,485,7),

(57,486,7),

(58,447,7),

(59,71,7),

(60,488,7),

(61,489,7),

(62,487,7),

(63,469,4),

(64,490,4),

(65,392,2),

(66,404,2),

(67,395,4),

(68,344,2),

(69,413,4),

(70,399,2),

(71,470,4),

(72,390,2),

(73,491,4),

(74,492,4),

(75,494,2),

(76,493,4),

(77,59,2),

(78,506,3),

(79,495,2),

(80,504,3),

(81,505,3),

(82,409,2),

(83,507,3),

(84,422,3),

(85,394,3),

(86,10,6),

(87,11,6),

(88,496,6),

(89,67,6),

(90,12,6),

(91,508,3),

(92,497,6),

(93,509,3),

(94,510,3),

(95,498,6),

(96,513,3),

(97,512,3),

(98,58,6),

(99,511,3),

(100,499,6),

(101,355,3),

(102,500,6),

(103,452,3),

(104,438,3),

(105,27,3),

(106,514,3),

(107,514,4),

(108,387,6),

(109,48,6),

(110,361,9),

(111,365,9),

(112,515,9),

(113,501,6),

(114,360,9),

(115,502,6),

(116,516,9),

(117,503,6),

(118,517,1),

(119,69,1),

(120,412,1),

(121,40,1),

(122,518,1),

(123,519,1),

(124,521,1),

(125,520,1),

(126,522,1),

(127,523,1),

(128,524,1),

(129,525,1),

(130,526,1),

(131,526,2),

(132,526,3),

(133,526,4),

(134,526,5),

(135,526,6),

(136,526,7),

(137,526,8),

(138,526,9),

(139,528,1),

(140,528,2),

(141,528,3),

(142,528,4),

(143,528,5),

(144,528,6),

(145,528,7),

(146,528,8),

(147,528,9),

(148,529,1),

(149,529,2),

(150,529,3),

(151,529,4),

(152,529,5),

(153,529,6),

(154,529,7),

(155,529,8),

(156,529,9),

(157,530,1),

(158,530,2),

(159,530,3),

(160,530,4),

(161,530,5),

(162,530,6),

(163,530,7),

(164,530,8),

(165,530,9),

(166,531,1),

(167,531,2),

(168,531,3),

(169,531,4),

(170,531,5),

(171,531,6),

(172,531,7),

(173,531,8),

(174,531,9),

(175,532,1),

(176,532,2),

(177,532,3),

(178,532,4),

(179,532,5),

(180,532,6),

(181,532,7),

(182,532,8),

(183,532,9),

(184,465,1),

(185,465,2),

(186,465,3),

(187,465,4),

(188,465,5),

(189,465,6),

(190,465,7),

(191,465,8),

(192,465,9),

(193,527,1),

(194,527,2),

(195,527,3),

(196,527,4),

(197,527,5),

(198,527,6),

(199,527,7),

(200,527,8),

(201,527,9),

(202,517,2),

(203,517,3),

(204,517,4),

(205,517,5),

(206,517,6),

(207,517,7),

(208,517,8),

(209,517,9),

(210,69,2),

(211,69,3),

(212,69,4),

(213,69,5),

(214,69,6),

(215,69,7),

(216,69,8),

(217,69,9),

(218,412,2),

(219,412,3),

(220,412,4),

(221,412,5),

(222,412,6),

(223,412,7),

(224,412,8),

(225,412,9),

(226,40,2),

(227,40,3),

(228,40,4),

(229,40,5),

(230,40,6),

(231,40,7),

(232,40,8),

(233,40,9),

(234,518,2),

(235,518,3),

(236,518,4),

(237,518,5),

(238,518,6),

(239,518,7),

(240,518,8),

(241,518,9),

(242,519,2),

(243,519,3),

(244,519,4),

(245,519,5),

(246,519,6),

(247,519,7),

(248,519,8),

(249,519,9),

(250,520,2),

(251,520,3),

(252,520,4),

(253,520,5),

(254,520,6),

(255,520,7),

(256,520,8),

(257,520,9),

(258,521,2),

(259,521,3),

(260,521,4),

(261,521,5),

(262,521,6),

(263,521,7),

(264,521,8),

(265,521,9),

(266,522,2),

(267,522,3),

(268,522,4),

(269,522,5),

(270,522,6),

(271,522,7),

(272,522,8),

(273,522,9),

(274,523,2),

(275,523,3),

(276,523,4),

(277,523,5),

(278,523,6),

(279,523,7),

(280,523,8),

(281,523,9),

(282,524,2),

(283,524,3),

(284,524,4),

(285,524,5),

(286,524,6),

(287,524,7),

(288,524,8),

(289,524,9),

(290,525,2),

(291,525,3),

(292,525,4),

(293,525,5),

(294,525,6),

(295,525,7),

(296,525,8),

(297,525,9),

(298,491,1),

(299,491,2),

(300,491,3),

(301,491,5),

(302,491,6),

(303,491,7),

(304,491,8),

(305,491,9),

(306,541,1),

(307,541,2),

(308,541,3),

(309,541,4),

(310,541,5),

(311,541,6),

(312,541,7),

(313,541,8),

(314,541,9),

(315,55,1),

(316,55,2),

(317,55,3),

(318,55,4),

(319,55,5),

(320,55,6),

(321,55,7),

(322,55,8),

(323,55,9),

(324,39,1),

(325,39,2),

(326,39,3),

(327,39,4),

(328,39,5),

(329,39,6),

(330,39,7),

(331,39,8),

(332,39,9),

(333,62,5),

(334,91,5),

(335,533,5),

(336,534,5),

(337,38,5),

(338,63,5),

(339,535,5),

(340,536,5),

(341,537,5),

(342,538,5),

(343,78,5),

(344,539,5),

(345,79,5),

(346,540,5),

(347,60,5),

(348,542,5),

(349,543,5),

(350,544,5),

(351,545,1),

(352,545,2),

(353,545,3),

(354,545,4),

(355,545,5),

(356,545,6),

(357,545,7),

(358,545,8),

(359,545,9),

(360,546,8),

(361,547,8),

(362,548,8),

(363,549,8),

(364,550,8),

(365,551,8),

(366,552,8),

(367,346,8),

(368,373,8),

(369,372,8),

(370,348,8),

(371,418,8),

(372,308,8),

(373,353,1),

(374,353,2),

(375,353,3),

(376,353,4),

(377,353,5),

(378,353,6),

(379,353,7),

(380,353,8),

(381,353,9),

(382,554,1),

(383,554,2),

(384,554,3),

(385,554,4),

(386,554,5),

(387,554,6),

(388,554,7),

(389,554,8),

(390,554,9),

(391,553,1),

(392,553,2),

(393,553,3),

(394,553,4),

(395,553,5),

(396,553,6),

(397,553,7),

(398,553,8),

(399,553,9),

(400,555,1),

(401,555,2),

(402,555,3),

(403,555,4),

(404,555,5),

(405,555,6),

(406,555,7),

(407,555,8),

(408,555,9),

(409,556,1),

(410,556,2),

(411,556,3),

(412,556,4),

(413,556,5),

(414,556,6),

(415,556,7),

(416,556,8),

(417,556,9),

(418,557,1),

(419,557,2),

(420,557,3),

(421,557,4),

(422,557,5),

(423,557,6),

(424,557,7),

(425,557,8),

(426,557,9),

(427,9,1),

(428,9,2),

(429,9,3),

(430,9,4),

(431,9,5),

(432,9,6),

(433,9,7),

(434,9,8),

(435,9,9),

(436,558,1),

(437,558,2),

(438,558,3),

(439,558,4),

(440,558,5),

(441,558,6),

(442,558,7),

(443,558,8),

(444,558,9),

(445,559,1),

(446,559,2),

(447,559,3),

(448,559,4),

(449,559,5),

(450,559,6),

(451,559,7),

(452,559,8),

(453,559,9),

(454,483,7),

(455,370,1),

(456,370,2),

(457,370,3),

(458,370,4),

(459,370,5),

(460,370,6),

(461,370,7),

(462,370,8),

(463,370,9),

(471,563,8),

(473,564,8),

(474,565,8),

(475,566,8),

(476,567,8),

(477,568,8),

(478,454,8),

(479,80,1),

(480,80,2),

(481,80,3),

(482,80,4),

(483,80,5),

(484,80,6),

(485,80,7),

(486,80,8),

(487,80,9),

(488,569,7),

(489,570,8),

(490,573,1),

(491,573,2),

(492,573,3),

(493,573,4),

(494,573,5),

(495,573,6),

(496,573,7),

(497,573,8),

(498,573,9),

(499,576,1),

(500,576,2),

(501,576,3),

(502,576,4),

(503,576,5),

(504,576,6),

(505,576,7),

(506,576,8),

(507,576,9),

(508,93,7),

(509,92,1),

(518,425,1),

(519,425,2),

(520,425,3),

(521,425,4),

(522,425,5),

(523,425,6),

(524,425,7),

(525,425,8),

(526,425,9),

(527,475,2),

(528,475,3),

(529,475,6),

(530,475,8),

(531,475,9),

(532,577,6),

(533,428,1),

(534,428,2),

(535,428,3),

(536,428,4),

(537,428,5),

(538,428,6),

(539,428,7),

(540,428,8),

(541,428,9),

(542,397,2),

(543,579,1),

(544,579,2),

(545,579,3),

(546,579,4),

(547,579,5),

(548,579,6),

(549,579,7),

(550,579,8),

(551,579,9),

(552,578,8),

(553,583,1),

(554,583,2),

(555,583,3),

(556,583,4),

(557,583,5),

(558,583,6),

(559,583,7),

(560,583,8),

(561,583,9),

(562,582,1),

(563,582,2),

(564,582,3),

(565,582,4),

(566,582,5),

(567,582,6),

(568,582,7),

(569,582,8),

(570,582,9),

(571,585,1),

(572,585,2),

(573,585,3),

(574,585,4),

(575,585,5),

(576,585,6),

(577,585,7),

(578,585,8),

(579,585,9),

(580,584,1),

(581,584,2),

(582,584,3),

(583,584,4),

(584,584,5),

(585,584,6),

(586,584,7),

(587,584,8),

(588,584,9),

(589,587,1),

(590,587,2),

(591,587,3),

(592,587,4),

(593,587,5),

(594,587,6),

(595,587,7),

(596,587,8),

(597,587,9),

(598,586,1),

(599,586,2),

(600,586,3),

(601,586,4),

(602,586,5),

(603,586,6),

(604,586,7),

(605,586,8),

(606,586,9),

(607,588,1),

(608,588,2),

(609,588,3),

(610,588,4),

(611,588,5),

(612,588,6),

(613,588,7),

(614,588,8),

(615,588,9),

(621,25,6),

(624,589,1),

(625,589,2),

(626,589,3),

(627,589,4),

(628,589,5),

(629,589,6),

(630,589,7),

(631,589,8),

(632,589,9),

(633,484,1),

(634,484,2),

(635,484,3),

(636,484,4),

(637,484,5),

(638,484,6),

(639,484,8),

(640,484,9),

(641,92,2),

(642,92,3),

(643,92,4),

(644,92,5),

(645,92,6),

(646,92,7),

(647,92,8),

(648,92,9),

(649,596,1),

(650,596,2),

(651,596,3),

(652,596,4),

(653,596,5),

(654,596,6),

(655,596,7),

(656,596,8),

(657,596,9),

(658,25,1),

(659,25,2),

(660,25,3),

(661,25,4),

(662,25,5),

(663,25,7),

(664,25,8),

(665,25,9),

(666,26,1),

(667,26,2),

(668,26,3),

(669,26,4),

(670,26,5),

(671,26,6),

(672,26,7),

(673,26,8),

(674,26,9);

/*Table structure for table `userdivision` */

DROP TABLE IF EXISTS `userdivision`;

CREATE TABLE `userdivision` (
  `userdivisionID` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `userID` int(11) unsigned NOT NULL,
  `divisionID` int(11) unsigned NOT NULL,
  PRIMARY KEY (`userdivisionID`),
  KEY `userID` (`userID`),
  KEY `divisionID` (`divisionID`),
  CONSTRAINT `userdivision_ibfk_1` FOREIGN KEY (`userID`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `userdivision_ibfk_2` FOREIGN KEY (`divisionID`) REFERENCES `divisions` (`divisionID`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=1318 DEFAULT CHARSET=latin1;

/*Data for the table `userdivision` */

insert  into `userdivision`(`userdivisionID`,`userID`,`divisionID`) values 

(2,28,8),

(3,28,9),

(4,28,10),

(5,28,11),

(6,28,12),

(7,46,8),

(8,46,9),

(9,46,10),

(10,46,11),

(11,46,12),

(12,54,8),

(13,54,9),

(14,54,10),

(15,54,11),

(16,54,12),

(17,72,8),

(18,72,9),

(19,72,10),

(20,72,11),

(21,72,12),

(22,342,8),

(23,342,9),

(24,342,10),

(25,342,11),

(26,342,12),

(28,343,9),

(29,343,10),

(30,343,11),

(31,343,12),

(32,345,8),

(33,345,9),

(34,345,10),

(35,345,11),

(36,345,12),

(37,357,8),

(38,357,9),

(39,357,10),

(40,357,11),

(41,357,12),

(42,474,8),

(43,474,9),

(44,474,10),

(45,474,11),

(46,474,12),

(49,44,21),

(50,44,11),

(51,44,1),

(52,44,2),

(53,44,3),

(54,44,4),

(55,44,5),

(56,44,6),

(57,44,7),

(58,44,8),

(59,44,9),

(60,44,10),

(61,44,12),

(63,44,14),

(64,44,15),

(65,44,16),

(66,44,17),

(67,44,18),

(68,44,19),

(69,44,20),

(70,44,22),

(71,474,1),

(72,474,2),

(73,474,3),

(74,474,4),

(75,474,5),

(76,474,6),

(77,474,7),

(79,474,14),

(80,474,15),

(81,474,16),

(82,474,17),

(83,474,18),

(84,474,19),

(85,474,20),

(86,474,21),

(87,474,22),

(95,451,5),

(96,449,5),

(97,478,5),

(98,73,4),

(99,74,4),

(100,333,4),

(101,75,4),

(102,479,6),

(103,480,6),

(104,455,6),

(105,472,6),

(107,481,14),

(108,481,15),

(109,481,16),

(110,481,17),

(111,481,18),

(113,482,14),

(114,482,15),

(115,482,16),

(116,482,17),

(117,482,18),

(125,485,14),

(126,485,15),

(127,485,16),

(128,485,17),

(129,485,18),

(131,486,14),

(132,486,15),

(133,486,16),

(134,486,17),

(135,486,18),

(136,447,8),

(137,447,9),

(138,447,10),

(139,447,11),

(140,447,12),

(141,71,8),

(142,71,9),

(143,71,10),

(144,71,11),

(145,71,12),

(146,488,8),

(147,488,9),

(148,488,10),

(149,488,11),

(150,488,12),

(151,489,8),

(152,489,9),

(153,489,10),

(154,489,11),

(155,489,12),

(156,487,5),

(157,469,5),

(158,490,5),

(159,392,5),

(160,404,5),

(161,395,4),

(162,344,4),

(163,413,4),

(164,399,4),

(165,470,6),

(166,390,6),

(171,491,17),

(174,492,14),

(175,492,15),

(176,492,16),

(177,492,17),

(178,492,18),

(179,494,6),

(180,493,8),

(181,493,9),

(182,493,10),

(183,493,11),

(184,493,12),

(186,59,14),

(187,59,15),

(188,59,16),

(189,59,17),

(190,59,18),

(191,506,5),

(195,495,16),

(198,504,5),

(199,505,5),

(200,409,8),

(201,409,9),

(202,409,10),

(203,409,11),

(204,409,12),

(205,507,4),

(206,422,4),

(207,394,4),

(231,11,4),

(232,496,4),

(233,67,4),

(234,12,5),

(235,508,6),

(236,497,5),

(237,509,6),

(238,510,6),

(239,498,5),

(241,513,14),

(242,513,15),

(243,513,16),

(244,513,17),

(245,513,18),

(247,512,14),

(248,512,15),

(249,512,16),

(250,512,17),

(251,512,18),

(252,58,6),

(254,511,14),

(255,511,15),

(256,511,16),

(257,511,17),

(258,511,18),

(259,499,6),

(260,355,8),

(261,355,9),

(262,355,10),

(263,355,11),

(264,355,12),

(265,500,6),

(266,452,8),

(267,452,9),

(268,452,10),

(269,452,11),

(270,452,12),

(271,438,8),

(272,438,9),

(273,438,10),

(274,438,11),

(275,438,12),

(276,27,8),

(277,27,9),

(278,27,10),

(279,27,11),

(280,27,12),

(304,387,8),

(305,387,9),

(306,387,10),

(307,387,11),

(308,387,12),

(309,48,8),

(310,48,9),

(311,48,10),

(312,48,11),

(313,48,12),

(314,361,5),

(315,58,7),

(316,365,4),

(317,499,7),

(318,515,6),

(319,515,7),

(320,500,7),

(322,501,14),

(323,501,15),

(324,501,16),

(325,501,17),

(326,501,18),

(333,502,14),

(334,502,15),

(335,502,16),

(336,502,17),

(337,502,18),

(343,516,6),

(362,503,14),

(363,503,15),

(364,503,16),

(365,503,17),

(366,503,18),

(367,508,7),

(368,390,7),

(369,509,7),

(370,510,7),

(371,494,7),

(372,470,7),

(373,455,7),

(374,472,7),

(375,479,7),

(376,480,7),

(377,517,5),

(378,69,4),

(379,412,4),

(380,40,6),

(381,40,7),

(382,518,6),

(383,518,7),

(384,519,6),

(385,519,7),

(386,521,14),

(387,520,14),

(390,524,16),

(391,525,16),

(392,526,8),

(393,526,9),

(394,526,10),

(395,526,11),

(396,526,12),

(397,528,8),

(398,528,9),

(399,528,10),

(400,528,11),

(401,528,12),

(402,529,8),

(403,529,9),

(404,529,10),

(405,529,11),

(406,529,12),

(409,530,10),

(412,531,19),

(413,531,20),

(415,532,21),

(416,465,21),

(418,527,14),

(419,527,15),

(420,527,16),

(421,527,17),

(422,527,18),

(424,520,15),

(425,520,16),

(426,520,17),

(427,520,18),

(429,521,15),

(430,521,16),

(431,521,17),

(432,521,18),

(439,523,15),

(463,55,12),

(467,39,11),

(469,62,6),

(470,62,7),

(471,91,8),

(472,91,9),

(473,91,10),

(474,91,11),

(475,91,12),

(476,533,8),

(477,533,9),

(478,533,10),

(479,533,11),

(480,533,12),

(481,534,6),

(482,534,7),

(483,38,6),

(484,38,7),

(486,63,14),

(487,63,15),

(488,63,16),

(489,63,17),

(490,63,18),

(492,535,14),

(493,535,15),

(494,535,16),

(495,535,17),

(496,535,18),

(498,536,14),

(499,536,15),

(500,536,16),

(501,536,17),

(502,536,18),

(504,537,14),

(505,537,15),

(506,537,16),

(507,537,17),

(508,537,18),

(510,538,14),

(511,538,15),

(512,538,16),

(513,538,17),

(514,538,18),

(515,78,4),

(516,539,4),

(517,79,4),

(518,540,4),

(520,542,5),

(521,543,5),

(522,544,5),

(528,545,18),

(548,360,14),

(549,360,15),

(550,360,16),

(551,360,17),

(552,360,18),

(554,547,5),

(555,548,6),

(556,548,7),

(557,549,6),

(559,550,14),

(560,550,15),

(561,550,16),

(562,550,17),

(563,550,18),

(565,551,14),

(566,551,15),

(567,551,16),

(568,551,17),

(569,551,18),

(570,552,8),

(571,552,9),

(572,552,10),

(573,552,11),

(574,552,12),

(575,346,4),

(576,373,4),

(577,546,5),

(578,549,7),

(579,372,4),

(580,348,4),

(581,418,4),

(582,308,4),

(583,353,3),

(584,554,1),

(585,553,2),

(586,555,3),

(587,556,3),

(588,557,3),

(611,558,7),

(612,558,6),

(613,559,16),

(615,541,24),

(617,541,26),

(620,522,24),

(622,522,26),

(630,483,16),

(633,538,24),

(634,538,26),

(635,481,24),

(636,481,26),

(637,537,24),

(638,537,26),

(639,513,24),

(640,513,26),

(641,485,24),

(642,485,26),

(643,482,24),

(644,482,26),

(645,527,24),

(646,527,26),

(649,512,24),

(650,512,26),

(651,521,24),

(652,521,26),

(655,503,24),

(656,503,26),

(657,511,24),

(658,511,26),

(659,63,24),

(660,63,26),

(661,536,24),

(662,536,26),

(663,360,24),

(664,360,26),

(667,59,24),

(668,59,26),

(669,492,24),

(670,492,26),

(671,502,24),

(672,502,26),

(673,535,24),

(674,535,26),

(675,501,24),

(676,501,26),

(677,486,24),

(678,486,26),

(679,550,24),

(680,550,26),

(681,491,14),

(682,491,15),

(683,491,16),

(684,491,18),

(685,491,24),

(686,491,26),

(701,44,24),

(702,44,26),

(705,370,5),

(742,342,4),

(743,342,5),

(744,342,6),

(745,342,7),

(746,342,14),

(747,342,15),

(748,342,16),

(749,342,17),

(750,342,18),

(751,342,24),

(752,342,26),

(753,552,4),

(754,552,5),

(755,552,6),

(756,552,7),

(757,552,14),

(758,552,15),

(759,552,16),

(760,552,17),

(761,552,18),

(762,552,24),

(763,552,26),

(764,563,28),

(765,514,28),

(766,564,5),

(767,565,14),

(768,565,15),

(769,565,16),

(770,565,17),

(771,565,18),

(772,565,24),

(773,565,26),

(774,566,5),

(775,567,14),

(776,567,15),

(777,567,16),

(778,567,17),

(779,567,18),

(780,567,24),

(781,567,26),

(782,568,5),

(784,454,8),

(785,454,9),

(786,454,10),

(787,454,11),

(788,454,12),

(813,80,1),

(814,80,2),

(815,80,3),

(816,80,4),

(817,80,5),

(818,80,6),

(819,80,7),

(820,80,8),

(821,80,9),

(822,80,10),

(823,80,11),

(824,80,12),

(825,80,14),

(826,80,15),

(827,80,16),

(828,80,17),

(829,80,18),

(830,80,19),

(831,80,20),

(832,80,21),

(833,80,22),

(834,80,24),

(835,80,26),

(836,80,27),

(837,80,28),

(838,569,8),

(839,569,9),

(840,569,10),

(841,569,11),

(842,569,12),

(843,570,6),

(845,573,1),

(846,573,2),

(847,573,3),

(848,573,4),

(849,573,5),

(850,573,6),

(851,573,7),

(852,573,8),

(853,573,9),

(854,573,10),

(855,573,11),

(856,573,12),

(857,573,14),

(858,573,15),

(859,573,16),

(860,573,17),

(861,573,18),

(862,573,19),

(863,573,20),

(864,573,21),

(865,573,22),

(866,573,24),

(867,573,26),

(868,573,27),

(869,573,28),

(899,343,8),

(900,576,18),

(901,10,28),

(902,93,28),

(903,9,28),

(904,516,28),

(905,92,28),

(906,425,28),

(907,475,28),

(908,475,19),

(909,475,20),

(910,475,27),

(911,577,16),

(912,9,1),

(913,9,2),

(914,9,3),

(915,9,4),

(916,9,5),

(917,9,6),

(918,9,7),

(919,9,8),

(920,9,9),

(921,9,10),

(922,9,11),

(923,9,12),

(924,9,14),

(925,9,15),

(926,9,16),

(927,9,17),

(928,9,18),

(929,9,19),

(930,9,20),

(931,9,21),

(932,9,22),

(933,9,24),

(934,9,26),

(935,9,27),

(950,428,16),

(961,474,24),

(962,474,26),

(963,474,27),

(964,474,28),

(965,44,27),

(966,44,28),

(967,397,28),

(968,60,28),

(1024,579,4),

(1025,578,5),

(1026,583,19),

(1027,583,20),

(1028,583,27),

(1029,582,18),

(1030,585,19),

(1031,585,20),

(1032,585,27),

(1033,584,19),

(1034,584,20),

(1035,584,27),

(1036,587,19),

(1037,587,20),

(1038,587,27),

(1039,586,19),

(1040,586,20),

(1041,586,27),

(1042,531,27),

(1048,588,19),

(1049,588,20),

(1050,588,27),

(1056,25,6),

(1071,519,28),

(1072,589,14),

(1073,589,15),

(1074,589,16),

(1075,589,17),

(1076,589,18),

(1077,484,19),

(1078,484,20),

(1079,484,27),

(1080,583,14),

(1081,583,15),

(1082,583,16),

(1083,583,17),

(1084,583,18),

(1085,583,24),

(1086,583,26),

(1087,92,14),

(1088,92,15),

(1089,92,16),

(1090,92,17),

(1091,92,18),

(1092,92,19),

(1093,92,20),

(1094,92,24),

(1095,92,26),

(1096,92,27),

(1097,501,19),

(1098,501,20),

(1099,501,27),

(1100,59,19),

(1101,59,20),

(1102,59,27),

(1103,511,19),

(1104,511,20),

(1105,511,27),

(1106,538,19),

(1107,538,20),

(1108,538,27),

(1109,550,19),

(1110,550,20),

(1111,550,27),

(1112,360,19),

(1113,360,20),

(1114,360,27),

(1115,482,19),

(1116,482,20),

(1117,482,27),

(1118,492,19),

(1119,492,20),

(1120,492,27),

(1121,387,1),

(1122,387,2),

(1123,387,3),

(1124,387,4),

(1125,387,5),

(1126,387,6),

(1127,387,7),

(1128,387,14),

(1129,387,15),

(1130,387,16),

(1131,387,17),

(1132,387,18),

(1133,387,19),

(1134,387,20),

(1135,387,21),

(1136,387,22),

(1137,387,24),

(1138,387,26),

(1139,387,27),

(1140,387,28),

(1141,409,1),

(1142,409,2),

(1143,409,3),

(1144,409,4),

(1145,409,5),

(1146,409,6),

(1147,409,7),

(1148,409,14),

(1149,409,15),

(1150,409,16),

(1151,409,17),

(1152,409,18),

(1153,409,19),

(1154,409,20),

(1155,409,21),

(1156,409,22),

(1157,409,24),

(1158,409,26),

(1159,409,27),

(1160,409,28),

(1161,438,1),

(1162,438,2),

(1163,438,3),

(1164,438,4),

(1165,438,5),

(1166,438,6),

(1167,438,7),

(1168,438,14),

(1169,438,15),

(1170,438,16),

(1171,438,17),

(1172,438,18),

(1173,438,19),

(1174,438,20),

(1175,438,21),

(1176,438,22),

(1177,438,24),

(1178,438,26),

(1179,438,27),

(1180,438,28),

(1181,533,1),

(1182,533,2),

(1183,533,3),

(1184,533,4),

(1185,533,5),

(1186,533,6),

(1187,533,7),

(1188,533,14),

(1189,533,15),

(1190,533,16),

(1191,533,17),

(1192,533,18),

(1193,533,19),

(1194,533,20),

(1195,533,21),

(1196,533,22),

(1197,533,24),

(1198,533,26),

(1199,533,27),

(1200,533,28),

(1201,493,1),

(1202,493,2),

(1203,493,3),

(1204,493,4),

(1205,493,5),

(1206,493,6),

(1207,493,7),

(1208,493,14),

(1209,493,15),

(1210,493,16),

(1211,493,17),

(1212,493,18),

(1213,493,19),

(1214,493,20),

(1215,493,21),

(1216,493,22),

(1217,493,24),

(1218,493,26),

(1219,493,27),

(1220,493,28),

(1221,488,1),

(1222,488,2),

(1223,488,3),

(1224,488,4),

(1225,488,5),

(1226,488,6),

(1227,488,7),

(1228,488,14),

(1229,488,15),

(1230,488,16),

(1231,488,17),

(1232,488,18),

(1233,488,19),

(1234,488,20),

(1235,488,21),

(1236,488,22),

(1237,488,24),

(1238,488,26),

(1239,488,27),

(1240,488,28),

(1241,552,1),

(1242,552,2),

(1243,552,3),

(1244,552,19),

(1245,552,20),

(1246,552,21),

(1247,552,22),

(1248,552,27),

(1249,552,28),

(1250,454,1),

(1251,454,2),

(1252,454,3),

(1253,454,4),

(1254,454,5),

(1255,454,6),

(1256,454,7),

(1257,454,14),

(1258,454,15),

(1259,454,16),

(1260,454,17),

(1261,454,18),

(1262,454,19),

(1263,454,20),

(1264,454,21),

(1265,454,22),

(1266,454,24),

(1267,454,26),

(1268,454,27),

(1269,454,28),

(1270,357,1),

(1271,357,2),

(1272,357,3),

(1273,357,4),

(1274,357,5),

(1275,357,6),

(1276,357,7),

(1277,357,14),

(1278,357,15),

(1279,357,16),

(1280,357,17),

(1281,357,18),

(1282,357,19),

(1283,357,20),

(1284,357,21),

(1285,357,22),

(1286,357,24),

(1287,357,26),

(1288,357,27),

(1289,357,28),

(1290,585,17),

(1291,585,28),

(1292,596,15),

(1293,25,1),

(1294,25,2),

(1295,25,3),

(1296,25,4),

(1297,25,5),

(1298,25,7),

(1299,25,8),

(1300,25,9),

(1301,25,10),

(1302,25,11),

(1303,25,12),

(1304,25,14),

(1305,25,15),

(1306,25,16),

(1307,25,17),

(1308,25,18),

(1309,25,19),

(1310,25,20),

(1311,25,21),

(1312,25,22),

(1313,25,24),

(1314,25,26),

(1315,25,27),

(1316,25,28),

(1317,26,8);

/*Table structure for table `users` */

DROP TABLE IF EXISTS `users`;

CREATE TABLE `users` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `ip_address` varchar(45) NOT NULL,
  `username` varchar(100) NOT NULL,
  `password` varchar(255) NOT NULL,
  `salt` varchar(255) DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL,
  `activation_code` varchar(40) DEFAULT NULL,
  `forgotten_password_code` varchar(40) DEFAULT NULL,
  `forgotten_password_time` int(11) unsigned DEFAULT NULL,
  `remember_code` varchar(40) DEFAULT NULL,
  `created_on` int(11) unsigned NOT NULL,
  `last_login` int(11) unsigned DEFAULT NULL,
  `active` tinyint(1) unsigned DEFAULT NULL,
  `first_name` varchar(50) DEFAULT NULL,
  `last_name` varchar(50) DEFAULT NULL,
  `company` varchar(100) DEFAULT NULL,
  `phone` varchar(20) DEFAULT NULL,
  `roleID` int(11) NOT NULL,
  `divisionID` int(11) DEFAULT NULL,
  `image` varchar(20) DEFAULT 'default.jpg',
  `changePwd` tinyint(1) NOT NULL DEFAULT '1',
  `outletID` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `username` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=615 DEFAULT CHARSET=utf8;

/*Data for the table `users` */

insert  into `users`(`id`,`ip_address`,`username`,`password`,`salt`,`email`,`activation_code`,`forgotten_password_code`,`forgotten_password_time`,`remember_code`,`created_on`,`last_login`,`active`,`first_name`,`last_name`,`company`,`phone`,`roleID`,`divisionID`,`image`,`changePwd`,`outletID`) values 

(1,'36.81.4.128','candra_s','$2y$08$sGTgdkgLGACgq1fU6lueTuWFrDMG/zwoZVaGXsuHRsCWxyQoKNSvW',NULL,'candrasaputra@live.com',NULL,NULL,NULL,NULL,1268889823,1502414643,1,'candra saputra','saputra','SS PUSAT','081373961140',0,NULL,'default.jpg',1,34),

(9,'36.81.4.128','rubingah','$2y$08$BtjBHPd9s.0jUGZzz1yJteuo.0X4ltejqvCDZmUBc00YNq5YpSazu',NULL,'ruby_brn23@yahoo.com',NULL,NULL,NULL,NULL,1268889823,1514712195,1,'Rubingah','-','Manager Keuangan','08562730063',1,1,'default.jpg',1,1),

(10,'36.80.130.231','juwaeni','$2y$08$Jg9erIX7Jai/ymb/7wdUv.9Y8o4acOhfoyLuo8rMMOKmNJJoBS9L2',NULL,'ndut_13@yahoo.com','d63704fa9f9103b13dd86ea69a520f53c9bdd74e',NULL,NULL,NULL,1502412601,1502412601,1,'Ahmad Juwaeni','-','Manager Semarang','082325031011',0,NULL,'default.jpg',1,14),

(11,'36.80.130.231','rudi','$2y$08$vWlmNHuuVMxJZZxUdhKwcO.8T0c61frCrKWBNbouqTtyZb16jy8KK',NULL,'hayfa@ymail.com',NULL,NULL,NULL,NULL,1501729342,1517387700,1,'Rudi Sulistyo','-','Kasi PAPG Semarang','082325031033',1,NULL,'default.jpg',1,26),

(12,'36.80.130.231','uum','$2y$08$9r1gdEdSJSl9AuxqwBt3BOzjD0QXXSHn/gnwOjaKoUfnCJFOb.Lo6',NULL,'NULL',NULL,NULL,NULL,'bfFhC0rChhcsRXexr2bNne',1501729342,1518091891,1,'Uum Umiasih','-','Kasi Produksi Semarang','085229632080',2,NULL,'default.jpg',1,14),

(15,'36.81.4.128','christianto','$2y$08$IIDrUJJFvquO8y8EDcB9kumtGj86sqLCdrXrnw5ACaD1ZbUAw8wcy',NULL,'chris20529@rocketmail.com','5cff18f3184c5b5eb4ef1a1637fec8cc1ab1dc31',NULL,NULL,NULL,1268889823,1493970782,0,'Christianto','-','-','082325029381',0,NULL,'default.jpg',1,33),

(16,'36.81.4.128','arti','$2y$08$RAzdMHzA3CGqMHmry7T.fuoelNMKApsaOwq0hqtFg.WigxtEMkKJO',NULL,'arti_1136@yahoo.com','fdbaa7a03bd107aee06dc504df2dc76c50d67049',NULL,NULL,NULL,1268889823,1489494401,1,'Umi Sunarti','-','-','082325029386',0,NULL,'default.jpg',1,33),

(17,'36.81.4.128','ajitriwaskito','$2y$08$y5DKQ7MUFm5f5LQS/tOn9uI3/6xrCdVLCn0bY/45rDuAx9Bx55mRi',NULL,'ajirezpector.ar@gmail.com',NULL,NULL,NULL,NULL,1268889823,1494151132,1,'Aji Triwaskito','-','Kepala Cabang','082325030116',0,NULL,'default.jpg',1,1),

(18,'36.81.4.128','ristiana','$2y$08$IIDrUJJFvquO8y8EDcB9kumtGj86sqLCdrXrnw5ACaD1ZbUAw8wcy',NULL,'ristianahermawati@gmail.com',NULL,NULL,NULL,NULL,1268889823,1485397483,1,'Ristiana Hermawati','-','Kepala Produksi','082325030118',0,NULL,'default.jpg',1,1),

(19,'36.81.4.128','arief','$2y$08$IIDrUJJFvquO8y8EDcB9kumtGj86sqLCdrXrnw5ACaD1ZbUAw8wcy',NULL,'-',NULL,NULL,NULL,NULL,1268889823,1484275322,1,'Arief Bekti Nugroho','-','Wakil Kepala Produksi','0',0,NULL,'default.jpg',1,1),

(20,'36.81.4.128','mekar','$2y$08$p8KogRIBsniVBYGGKAMLi.yiXA0yUy37bli09wrdwtY1kuRD6l.bS',NULL,'Mekartitisss@gmail.com',NULL,NULL,NULL,NULL,1268889823,1507642136,1,'Mekar Titis Mibawani','-','Kepala Keuangan','082225511971',0,NULL,'default.jpg',1,1),

(21,'36.81.4.128','lutfy','$2y$08$IIDrUJJFvquO8y8EDcB9kumtGj86sqLCdrXrnw5ACaD1ZbUAw8wcy',NULL,'Lutfymerria@gmail.com',NULL,NULL,NULL,NULL,1268889823,1484275428,1,'Lutfy Merria Agustina','-','Wakil Kepala Keuangan','0',0,NULL,'default.jpg',1,1),

(22,'36.81.4.128','didik','$2y$08$Oe9iOVYdC/H0Po27A3vdauIMwRx08rnV5jitAOa2dmblP.Zpa902u',NULL,'thediks.rockers@gmai.com',NULL,NULL,NULL,NULL,1268889823,1507433339,1,'Didik Sulistiawan','-','Kepala Pengadaan','085743100589',0,NULL,'default.jpg',1,1),

(23,'36.81.4.128','triyunianto','$2y$08$IIDrUJJFvquO8y8EDcB9kumtGj86sqLCdrXrnw5ACaD1ZbUAw8wcy',NULL,'Monsterrriyue@yahoo.com',NULL,NULL,NULL,NULL,1268889823,1485847491,1,'Tri Yunianto','-','Pjs. Kepala Operasional','082325029429',0,NULL,'default.jpg',1,1),

(24,'36.81.4.128','icuk','$2y$08$EViYBQpv1sPML99HHyEBcObHT8w225Z9ZlIJXoH.7aChXcL24UR0y',NULL,'-',NULL,NULL,NULL,NULL,1268889823,1483771406,1,'Icuk Sutamto','-','wss palagan','081215406136',0,NULL,'default.jpg',1,1),

(25,'36.81.4.128','administrator','$2y$08$Zuln/xwXzqtOWO0YzPh.QeKXD3pb7uGGB1ngNnkWlfkK4fv.NRVp6',NULL,'candrasaputra@live.com',NULL,NULL,NULL,NULL,1268889823,1518686254,1,'Candra Saputra','-','Pelengkap','081373961140',1,1,'default.jpg',1,1),

(26,'36.81.4.128','novita','$2y$08$weikhVsT2zI89kuJlc1xN.g57EodBSU6mF6OCw3Jk9jrEnsbMo7gO',NULL,'novitasari.ha@gmail.com',NULL,NULL,NULL,NULL,1268889823,1507558850,1,'Novita','-','MT','087738328432',2,NULL,'default.jpg',1,5),

(27,'36.81.4.128','fani','$2y$08$IIDrUJJFvquO8y8EDcB9kumtGj86sqLCdrXrnw5ACaD1ZbUAw8wcy',NULL,'fanibudhitriyantisa@gmail.com','08d08ae390ba4fdd9ea829cd1b3001fa5aed81b3',NULL,NULL,NULL,1268889823,1474852755,0,'Fani Budi Triyantisa','-','MT','085641624882',2,NULL,'default.jpg',1,2),

(28,'36.81.4.128','indra','$2y$08$bR5wKUj1iVXTj0fK.t2Zke2.sznyycf.0BOzT6/XJHqGDCSg79DFq',NULL,'indrapurbosayekti@gmail.com',NULL,NULL,NULL,NULL,0,1516027423,1,'Indra Purbo','-','Costing Pusat','081804140606',2,NULL,'default.jpg',1,48),

(29,'36.81.4.128','vinwy','$2y$08$IIDrUJJFvquO8y8EDcB9kumtGj86sqLCdrXrnw5ACaD1ZbUAw8wcy',NULL,'tidakada@tidakada.tidakada',NULL,NULL,NULL,NULL,1477387197,1507305390,1,'Vinwy Apriyanto','-','Kacab SS Bantul','085643489665',0,NULL,'default.jpg',1,33),

(30,'36.81.4.128','nira','$2y$08$IIDrUJJFvquO8y8EDcB9kumtGj86sqLCdrXrnw5ACaD1ZbUAw8wcy',NULL,'belumada@belumada.belumada',NULL,NULL,NULL,NULL,1477387471,1507370262,1,'Niratitis Febriana','-','Ass Keuangan SS Bantul','089649086494',0,NULL,'default.jpg',1,33),

(31,'36.81.4.128','rini','$2y$08$IIDrUJJFvquO8y8EDcB9kumtGj86sqLCdrXrnw5ACaD1ZbUAw8wcy',NULL,'tidakada@tidakada.tidakada',NULL,NULL,NULL,NULL,1477387519,1507428923,1,'Riningsih','-','-','087838491230',0,NULL,'default.jpg',1,33),

(32,'36.81.4.128','tiya','$2y$08$IIDrUJJFvquO8y8EDcB9kumtGj86sqLCdrXrnw5ACaD1ZbUAw8wcy',NULL,'tidakada@tidakada.tidakada',NULL,NULL,NULL,NULL,1477387623,1507650116,1,'Tiya Maryati','-','-','0',0,NULL,'default.jpg',1,33),

(33,'36.81.4.128','ardhi','$2y$08$IIDrUJJFvquO8y8EDcB9kumtGj86sqLCdrXrnw5ACaD1ZbUAw8wcy',NULL,'tidakada@tidakada.tidakada',NULL,NULL,NULL,NULL,1477387661,1507766297,1,'Ardhi Irawan','-','-','08562857383',0,NULL,'default.jpg',1,33),

(34,'36.81.4.128','pardi','$2y$08$IIDrUJJFvquO8y8EDcB9kumtGj86sqLCdrXrnw5ACaD1ZbUAw8wcy',NULL,'tidakada@tidakada.tidakada',NULL,NULL,NULL,NULL,1477387705,1507774002,1,'Supadiyono','-','-','081904077782',0,NULL,'default.jpg',1,33),

(35,'180.254.67.139','Bagus','$2y$08$IIDrUJJFvquO8y8EDcB9kumtGj86sqLCdrXrnw5ACaD1ZbUAw8wcy',NULL,'belumada@belumada.com',NULL,NULL,NULL,NULL,1478935038,1507783010,1,'Bagus Yusianto','-','Staf Khusus Gudang','0',0,NULL,'default.jpg',1,33),

(36,'115.178.236.93','Dwi','$2y$08$KMm0niiFpSxsCXDualW0J.M8hXJrAGDWfkycVKUc3iAiyoK/CUv2K',NULL,'belum@ada.com',NULL,NULL,NULL,NULL,1482113942,1507336692,1,'Dwi Purwanti','-','Wakil Asisten Keuangan (waroeng)','0',0,NULL,'default.jpg',1,33),

(37,'36.81.15.221','Jogja','$2y$08$vV2nmEnGpwGu5DWZLJuQK.HbUWnpU7s64/tHPU1iedBcJqkpiKNt.',NULL,'tidakada@tidakada.com',NULL,NULL,NULL,NULL,1483167384,1495015861,1,'Manajemen Area','-','Manajemen Area','0',0,NULL,'default.jpg',1,33),

(38,'36.79.148.173','Agus','$2y$08$Irf0Ufu/ebc.HvsJw4B2eO8lILak39xlYUYRGsRbRTapScYcFQIry',NULL,'belumada@belumada.com','cc5cd7104490b8b22c987f62b10ed11dcf6cfdb0',NULL,NULL,NULL,1483427051,1487391372,1,'Agus Syafi\'i','-','-','082225959875',2,NULL,'default.jpg',1,33),

(39,'36.81.64.240','septyani','$2y$08$9IXOKFWa4JvA8VUHdsoUOuiXGTVPFQL81LTVdedWeUsqjRccGBMfC',NULL,'ss.septiyani@yahoo.com',NULL,NULL,NULL,NULL,1485402224,1513664413,1,'Siti Septiyani','-','-','085640452593',2,NULL,'default.jpg',1,33),

(40,'115.178.239.206','awan','$2y$08$JHpeSImjfkFjgSRRTjZQF.e2bikQCDQEqWK0g820nDkFk5XJI2AwO',NULL,'awanarga94@gmail.com',NULL,NULL,NULL,'8h.MulOA.b3EM2uOYDoq.O',1490452362,1513656702,1,'awan arga','-','P2O Pusat','082133303756',0,NULL,'default.jpg',1,33),

(41,'36.73.96.61','luluk','$2y$08$C1jBhDoDHMKfwQKVhCVg1ugCzRST2BwYWYtmsy4NctinY.ROA8FCW',NULL,'luluk@luluk.luluk',NULL,NULL,NULL,NULL,1491009089,1507732089,1,'luluk','-','P2O Waroeng SS Bantul','0',0,NULL,'default.jpg',1,33),

(42,'36.73.47.122','zainal','$2y$08$E6GkXCG6cpwIYp5XPda6weFst/eyg3EgxZ5hmSl2YlLhJ3PpoztQa',NULL,'admin@admin.com',NULL,NULL,NULL,NULL,1492570331,1505101619,1,'Zainal','-','Keuangan Distribusi Pusat','0',0,NULL,'default.jpg',1,1),

(43,'115.178.237.153','bambang','$2y$08$9fZBD6JmCiJOgKLRBKri4OS8S5z1embBMzqg9vs0obg7jwlwleYk6',NULL,'bambang@bambang.bambang',NULL,NULL,NULL,NULL,1493563617,1507788282,1,'Bambang','-','bantul','0',0,NULL,'default.jpg',1,33),

(44,'36.80.219.223','ihsan','$2y$08$dlh9fQecxlD2ScMOklGmUeOmUN1WXeH4mk/GfxamEIyV160Y2XhIi',NULL,'ihsan624@gmail.com',NULL,NULL,NULL,NULL,1494055705,1519091085,1,'Ihsanuddin','-','Waroeng SS','085725504641',1,NULL,'default.jpg',1,33),

(45,'128.199.174.4','rohman','$2y$08$lTrGixVh1PQzCNiwllMaRu9KHEoHZ8vcOAvkMAug3QdyNfJDKlwgi',NULL,'nudinrohman2014@gmail.com','00f73ccc9099965c845a6fc31c197feb96029e71',NULL,NULL,NULL,1495939526,1496213393,0,'Rohman Nudin','-','Keuangan Jogja','081226513738',0,NULL,'default.jpg',1,33),

(46,'180.254.91.113','asni','$2y$08$2jzeaEn19x7OBX7pck3uyeRsWIyrK1qSm31HN3ArVOp8smJk/R24m',NULL,'asni@gmail.com',NULL,NULL,NULL,NULL,1499758730,1516014381,1,'Asni Widyaningsih','-','Area Jogja','082325029825',2,NULL,'default.jpg',1,32),

(47,'36.79.152.253','Hesti','$2y$08$OalJwj9F26LXeYk/3BT94exaeCFzB/OPoO8tQigthd1h45B.cJxWu',NULL,'hesti@ssbantul.com',NULL,NULL,NULL,NULL,1500692092,1500692460,1,'Hesti','-','SS Bantul','0',0,NULL,'default.jpg',1,33),

(48,'36.80.219.122','faiz','$2y$08$o8V9BsRqO/SANlu5YwlDEO7VzRtfka.tjq4ILzPAkuFmUpUmS/69y',NULL,'faiz@faiz.com','00070b34d2192672656b16dfabf3e037a0f9b2df',NULL,NULL,NULL,1501572650,1504496915,1,'FAIZ AULIA RAHMAN','-','AREA SEMARANG','0',2,NULL,'default.jpg',1,14),

(49,'36.80.219.122','teguh','$2y$08$pw.v8BeiI6zPXDzMKWn8nuOVdgFCl4mKMKNje.SpmdEaq.uAUoRGi',NULL,'teguh@teguh.com',NULL,NULL,NULL,NULL,1501577892,1507738440,1,'TEGUH','-','SS Sompok','0',0,NULL,'default.jpg',1,14),

(50,'36.80.219.122','suharti','$2y$08$uHMCeRVFEPIA99qwetdHHeYnuckWGVNP1mOBSAmL9hge2Xk1h/8p.',NULL,'suharti@suharti.com',NULL,NULL,NULL,NULL,1501578414,1507784927,1,'Suharti Suharti','-','SS Sompok','0',0,NULL,'default.jpg',1,14),

(51,'36.80.219.122','mustaj','$2y$08$/qD0YbVWNx0S5jvdZikpueRIFnhQVjlmmV0rpgNq9pIzkEORpwpe6',NULL,'mustaj@mustaj.com','42719e2ef32c041e6113b0483b60c8b6e54681a1',NULL,NULL,NULL,1501578551,1503034669,0,'Muhammad Mustaj Mustajab','-','SS Sompok','0',0,NULL,'default.jpg',1,14),

(52,'36.80.219.122','daud','$2y$08$Kwca359JpdJjCUX.Sm7lW.HVgiqwBt.9KPHc7GaE6TNyQ537m7tVq',NULL,'daud@daud.com',NULL,NULL,NULL,NULL,1501578816,1507793706,1,'Daud Yulianto','-','SS Sompok','0',0,NULL,'default.jpg',1,14),

(53,'36.80.219.122','rifai','$2y$08$TvaKJ35dfJFqZh7AKbwN7ekZec4G.TJuuttGdSYeJINb1JLNzQM1K',NULL,'rifai@fai.com','1dd009f09a1c19dd5491ab319d055097cd2821b9',NULL,NULL,NULL,1501578917,1502987416,0,'Rifai Rifai','-','SS Sompok','0',0,NULL,'default.jpg',1,14),

(54,'36.80.219.122','nina','$2y$08$hQgJWuCiFZ4R24AN2FkjZuyJMx.xqbGbVYBUnlDcFT2Ro6zUwIXsy',NULL,'nina@nina.com',NULL,NULL,NULL,NULL,1501579148,1518088984,1,'Nina Ika Belgianingrum','-','Kasi Keuangan AREA SEMARANG','0',2,NULL,'default.jpg',1,14),

(55,'36.80.130.231','Yaufi','$2y$08$Ezp68FXVeek.wbhzvTjYuep3A761z2msuOq/GptfdkkJIufR7Z.jK',NULL,'yaufi@yaufi.com',NULL,NULL,NULL,NULL,1501729342,1507479453,1,'Yaufi Andriyano','-','SS PUSAT','0',0,NULL,'default.jpg',1,5),

(56,'114.124.229.56','ayu','$2y$08$Wa3Jcz4gaicWrKTzuCtZkeuq8KGU1dbuv4DRLwdv/Pup8DqHlKWHW',NULL,'ayu@ayu.com',NULL,NULL,NULL,NULL,1502460629,1507440792,1,'Dyah Ayu ','Puspitosari','Area semarang','0',0,NULL,'default.jpg',1,17),

(57,'114.124.148.201','fitri','$2y$08$VgaG/HldZL7OGvRFwrCpvuQgb4BO7hSS1miTyqrA2Yttt6eyBdnO2',NULL,'afi@afi.com','2a4893dc0ee0d5d25dba44ff738a26d5b0efc054',NULL,NULL,NULL,1502504943,1502532380,0,'Fitri','Nur Afianti','SS Sompok','0',0,NULL,'default.jpg',1,14),

(58,'202.67.46.226','ari','$2y$08$tEV3l5XY8WSu6XmJB3r9mulTIvOZdxzUcIo7itCq52KJxnQSWcQe2',NULL,'ari@area.com',NULL,NULL,NULL,'NUw6xBzncjrlBWoXcBqI2O',1502515473,1514714729,1,'Ari Widiatmoko','Ari','Kasi P2O Area Searang','082300053848',0,NULL,'default.jpg',1,14),

(59,'202.67.46.226','redina','$2y$08$wAOtXt6HVVVKKJGFWQ/r0e.nRL4QbXv8gmhlcLntCuRut2SXffwny',NULL,'rere@redina.com',NULL,NULL,NULL,'gpEkUjHOJGYjJwaGPzE3pu',1502515665,1516169284,1,'Redina Saskia','Rere','Kasi SDM Area Semarang','082300053841',0,NULL,'default.jpg',1,0),

(60,'202.67.46.226','dewijuliastuti','$2y$08$tEV3l5XY8WSu6XmJB3r9mulTIvOZdxzUcIo7itCq52KJxnQSWcQe2',NULL,'dewi@sad.sad',NULL,NULL,NULL,NULL,1502515665,1502871139,1,'Tri Artha Dewi Juliastuti','-','Manager Area Jogja','082325029331',0,NULL,'default.jpg',1,0),

(61,'202.67.46.226','gunarto','$2y$08$tEV3l5XY8WSu6XmJB3r9mulTIvOZdxzUcIo7itCq52KJxnQSWcQe2',NULL,'guntur@sda.sad',NULL,NULL,NULL,NULL,1502515665,1502515665,1,'Gunarto','-','Kasi PAPG Area Jogja','085290380281',0,NULL,'default.jpg',1,0),

(62,'202.67.46.226','siti','$2y$08$tEV3l5XY8WSu6XmJB3r9mulTIvOZdxzUcIo7itCq52KJxnQSWcQe2',NULL,'sss@sad.cs',NULL,NULL,NULL,NULL,1502515665,1502515665,1,'Siti Zulaikoh','-','Kasi P2O','082325029338',0,NULL,'default.jpg',1,0),

(63,'202.67.46.226','nades','$2y$08$g9iOMoN9SBLdMCSUuaaDj..4KBAzNquFFYSFCzG/f2ktQXNqkhvsS',NULL,'NULL',NULL,NULL,NULL,NULL,1502515665,1502515665,1,'Nades Kuswoyo','-','Kasi SDM','082325029603',0,NULL,'default.jpg',1,0),

(64,'202.67.40.25','feni','$2y$08$G4bxHziJPUqyNBXk.xvouulRa2Tdiiq8iEumFtO02sfEDfZlHqEsa',NULL,'feni@feni.com','2c2d6efd5faad205774d4b90bd474d48f540680a',NULL,NULL,NULL,1502718043,1504367057,0,'Feni Kusanti','Feni','Produksi Area Semarang','0',0,NULL,'default.jpg',1,14),

(65,'202.67.41.10','ribon','$2y$08$Rvf2YNMrpVH0eNvE4bFgIu.NgZETE8jb6uwyAbzqwgnSe0oj/aRMu',NULL,'ribon@ribon.com',NULL,NULL,NULL,NULL,1502956616,1507628140,1,'Ribon Andi','Pradana','Pusat','0',0,NULL,'default.jpg',1,33),

(66,'202.67.41.224','nofita','$2y$08$e21MLPBv9yFCso6CwJukHeI9qyWRNCPst7pPRl.XvoArT0dQQU3a6',NULL,'nofita@nofita.com',NULL,NULL,NULL,NULL,1503126387,1507791495,1,'Nofitasari','Rismawardani','SS Sompok','0',0,NULL,'default.jpg',1,14),

(67,'202.67.41.25','galang','$2y$08$6c9AKAZRozHYGeXOjVAbfO5JSzsDVtdNkFBRkqZ0ajkroCNDdeaFK',NULL,'galang@galang.com',NULL,NULL,NULL,NULL,1503159820,1507698860,1,'Galang Adi','Saputra','Kaur Pengadaan Area Semarang','0',1,NULL,'default.jpg',1,17),

(68,'202.67.46.235','rozi','$2y$08$7YsQ8gfwHABjZUjx3wJuE.5dDSE..7jcIuRlylLESChgrycWRqbe.',NULL,'rozi@rozi.com',NULL,NULL,NULL,NULL,1503244533,1506575994,1,'M Shabiq ','Nairozi','Area Semarang','0',0,NULL,'default.jpg',1,14),

(69,'36.78.63.56','rahmayani','$2y$08$d.uy7j2DDk/ZP42b/Hwz8u6RcSJggcc.SimKl3RN379e9zCjX2aWy',NULL,'rahma@gmail.com',NULL,NULL,NULL,NULL,1504073570,1507509874,1,'Rahmayani','dewi','waroeng ss','085743708309',1,NULL,'default.jpg',1,0),

(70,'36.78.55.12','haryono','$2y$08$Rwgcfl.5K3H.S9/leNWsi.cx52R1O4iNQUaCnti1lxBfCDPjig/wW',NULL,'haryo@haryo.com',NULL,NULL,NULL,NULL,1504420165,1507656044,1,'Haryono','Haryono','SS Sompok','0',0,NULL,'default.jpg',1,14),

(71,'36.78.55.12','anggit','$2y$08$dwAyyEJtb4dn1hNZ.ZqS2uGak9jY4tWgYBYZq4o/UUoLCbUK4kzB.',NULL,'anggit@anggit.com',NULL,NULL,NULL,NULL,1504607886,NULL,1,'Anggit',' Riyadi','AREA SOLO','0',2,NULL,'default.jpg',1,56),

(72,'36.78.55.12','rinis','$2y$08$yu4/o0xMKJpsC.GZOA.gtePOhRgI.5RQaFH92zJI2yjhc9gdYenHG',NULL,'rini@rini.com',NULL,NULL,NULL,NULL,1504608013,1518099642,1,'Rini','Setyani','AREA SOLO','0',2,NULL,'default.jpg',1,28),

(73,'36.78.55.12','Muksin','$2y$08$ts12wR/siFDer9vTUEyml.2/7/PepimuRprHxRFohhg7KhDoYvzDq',NULL,'muksin@muksin.com',NULL,NULL,NULL,NULL,1504608261,1517993374,1,'Mohammad Muksin','Muksin','AREA SOLO','0',1,NULL,'default.jpg',1,56),

(74,'36.78.55.12','febri','$2y$08$rto3Nhw5XP5Qdyrz.2RZHunta42oipMhim4kyM2IBgXHbWMaIk/Yq',NULL,'febri@febri.com',NULL,NULL,NULL,NULL,1504608330,1513683894,1,'Febriari ','Setiawan','AREA SOLO','0',1,NULL,'default.jpg',1,56),

(75,'36.78.55.12','Luphi','$2y$08$u7Sn48UM9h50LJ4U5/RUiuKtaClP3IK2jirkpTcjBF/3NZ7zPPRky',NULL,'luphi@luphi.com',NULL,NULL,NULL,NULL,1504608376,NULL,1,'Luphi',' Kustiyani','AREA SOLO','0',1,NULL,'default.jpg',1,0),

(76,'36.78.55.12','Ipah ','$2y$08$dWUrQQwoA8unQDJFAbHGv.vasEh2XXkoGIntm1c11kzi7BntEBOFS',NULL,'ipah@ipah.com',NULL,NULL,NULL,NULL,1504608486,1506050265,1,'Ipah ','Syarifah','AREA SOLO','0',0,NULL,'default.jpg',1,28),

(77,'36.78.55.12','sari','$2y$08$F9zeutAcgafsKwSeW456luMsb2SqMmXLr4siddY.f/IRLLkNghZjm',NULL,'sari@nur.com',NULL,NULL,NULL,NULL,1504608545,NULL,1,'Siti ','Nursari','Area Jogja','0',0,NULL,'default.jpg',1,0),

(78,'36.78.55.12','ridwan','$2y$08$LchbvNu1bUej44Mc.xrpS.8cEKG2vr1YfSspqsMSjwJm9ItOxXjGi',NULL,'ridwan@rid.com',NULL,NULL,NULL,NULL,1504608614,1516021612,1,'Ridwan ','Widiantoro','Area Jogja','0',1,NULL,'default.jpg',1,33),

(79,'36.78.55.12','khasan','$2y$08$SAxXmt1L4jS8IAi4vcS6D.Kc/ETZHvmMWgbLNOC.t/Isyypf7O1oq',NULL,'khasan@nur.com',NULL,NULL,NULL,NULL,1504608672,NULL,1,'Nur ','Khasan','Area Jogja','0',1,NULL,'default.jpg',1,32),

(80,'36.78.55.12','dewa','$2y$08$V8ZJpLUwtm4/bunjrRCS6OyvEqoChZTW6FvyjhuMV09Tq8.f6WdV.',NULL,'dewa@dew.com',NULL,NULL,NULL,NULL,1504608729,1518177181,1,'Dewa Tri ','Joko Saputra','SS PALAGAN','0',2,NULL,'default.jpg',1,1),

(81,'36.78.55.12','titis','$2y$08$dbDNgwbx2ZJ2JSPz5YoBkeJ34qcHfFGfzzJ81PBTWiil.LNFeqKQi',NULL,'titis@mekar.com',NULL,NULL,NULL,NULL,1504608788,NULL,1,'Mekar Titis','Wibawani','SS PALAGAN','0',0,NULL,'default.jpg',1,0),

(82,'36.78.55.12','aditya12','$2y$08$Z0YWWzPn9KEzw973VK1U1OS/HsUNKhPM.AybUe4U/dVAAER7PYzFa',NULL,'adit@aditya.com',NULL,NULL,NULL,NULL,1504664322,NULL,1,'Aditya Novia ','Kurniawan','PAPG PUSAT','0',0,NULL,'default.jpg',1,0),

(83,'36.78.55.12','niko','$2y$08$yGigsZMEkGEQNioZhLMCHuXNa6gb9nAcVj8jwOlfiLDnIZGu9SnR2',NULL,'niko@niko.com',NULL,NULL,NULL,NULL,1504664404,NULL,1,'Niko Bambang','Niko','PAPG PUSAT','0',0,NULL,'default.jpg',1,0),

(84,'36.78.55.12','didiks','$2y$08$cy9DkUUUde5UYSY5IlRiheDX978JIP37kTUJ18gw8UGcem5VGete2',NULL,'didik@didiks.com',NULL,NULL,NULL,NULL,1504664507,NULL,1,'Didik Septiyanto','Didik','PAPG PUSAT','0',0,NULL,'default.jpg',1,0),

(85,'36.78.55.12','krisna','$2y$08$JocUsQMHJZ5MGVCzSxo2rety/2W00d9Lg4VS5WYHWGLSiGozmZsbG',NULL,'krisna@fitriana.com',NULL,NULL,NULL,NULL,1504664583,NULL,1,'Krisna Fitriana','Krina','PAPG PUSAT','0',0,NULL,'default.jpg',1,0),

(86,'36.78.55.12','fuzi','$2y$08$MSP4vAeQQb5pkI/ZPhnFs.ZI6M9B2ocMwFlmuAfBCILOEOBrZyprm',NULL,'fuzi@asnawi.com',NULL,NULL,NULL,NULL,1504664648,NULL,1,'Agus Fuzi ','Asnawi','PAPG PUSAT','0',0,NULL,'default.jpg',1,0),

(87,'36.78.55.12','trisna','$2y$08$nPgmp77sgybjANO1HIS3Puq1/rhdjaOtHNTonFtgMZxqEOjxRNC8y',NULL,'tris@trisna.com',NULL,NULL,NULL,NULL,1504664694,NULL,1,'Trisna Apristanto','Trisna','PAPG PUSAT','0',0,NULL,'default.jpg',1,0),

(88,'36.78.55.12','agung','$2y$08$CmiJVdCbCE3NfL3ZNalhPuwL4WrpAlLJOw2YJUWYdBU8LP1mwGRzm',NULL,'agung@agung.com',NULL,NULL,NULL,NULL,1504664738,NULL,1,'Agung Supramono','Agung','PAPG PUSAT','0',0,NULL,'default.jpg',1,0),

(89,'36.78.55.12','duwi','$2y$08$sxFpNab5xLaTWtoUGrWv9.KInTb39UD2pELcOYfs3duprt2bHQaY.',NULL,'dui@dui.com',NULL,NULL,NULL,NULL,1504664835,NULL,1,'Dwi Setyaningrum','dwi','KEUANGAN PUSAT','0',0,NULL,'default.jpg',1,0),

(90,'36.78.55.12','joko','$2y$08$p2HqaRPu0hZPdbvauWg5DObZFIuKkpynvW/xDGx6vleqL7s.vbgZu',NULL,'joko@joko.com',NULL,NULL,NULL,NULL,1504670582,NULL,1,'Joko Susanto','joko','Area Jogja','0',0,NULL,'default.jpg',1,0),

(91,'36.78.55.12','nuning','$2y$08$5kOEDHcrLdgfgrtRv9S9vOZqUsSw/X2mUnhx9K2xb66hExLjGptmi',NULL,'nun@nuning.com',NULL,NULL,NULL,NULL,1504670680,NULL,1,'Nuning ','Supriyanti','Area Jogja','0',2,NULL,'default.jpg',1,0),

(92,'36.78.55.12','kadek','$2y$08$4f/DG0T5cVS6lR.B4D0WzuhUh6tqwsFukK9OOPfX22YvNNli3snqW',NULL,'kadek@kadek.com',NULL,NULL,NULL,NULL,1504775400,NULL,1,'I Kadek Gede',' Mertayasa','PUSAT','0',0,NULL,'default.jpg',1,0),

(93,'36.78.55.12','asung','$2y$08$FKWmm7HKn9TUnnVccO2xHeko9OeVED8j8W4rXjXD.r8uFCN1fqcVu',NULL,'asung@asung.com',NULL,NULL,NULL,NULL,1504775501,1516428054,1,'Asung Agung ','Widhiatmoko','AREA SOLO','0',0,NULL,'default.jpg',1,0),

(94,'36.80.223.135','dian','$2y$08$jFUaR6uSGH44bZEn5SZ3vug7la/9SMaEH5quxqB9Kpld8I6iIxE.u',NULL,'dian@dian.com',NULL,NULL,NULL,NULL,1505461364,1506673884,1,'Dian Nur ','Rizki','PUSAT','0',0,NULL,'default.jpg',1,14),

(95,'36.80.223.135','sandra','$2y$08$na4faZeVD2iIq1lVAHGFDOodbtj9McLCxDjLkMDTWrXEQk4I3god.',NULL,'sandra@sandra.com',NULL,NULL,NULL,NULL,1505531954,NULL,1,'Sandra',' PA','SS Pattimura','082325031066',0,NULL,'default.jpg',1,0),

(96,'36.80.223.135','Dhayyati','$2y$08$4390c009fFwv4WQ.O/ZIsuDjVuBE8jNY6TV3UdxVCO.esy9jIcowW',NULL,'dhayati@gmai.com',NULL,NULL,NULL,NULL,1505532039,1507690046,1,'Dhayyati',' Ayu R.','SS Pattimura','085200664683',0,NULL,'default.jpg',1,27),

(97,'36.80.223.135','Mukhlasin ','$2y$08$1.E431xMY8VjDG0yhXPQk.UGU.lrmeAidRGM1IGULeCBI7Z7/j5HO',NULL,'muk@khlasin.com',NULL,NULL,NULL,NULL,1505532089,1507432298,1,'Mukhlasin ','Mukhlasin ','SS Pattimura','082325031074',0,NULL,'default.jpg',1,27),

(98,'36.80.223.135','endi','$2y$08$EyKoEdZ1WF1hT9S.UGJV/umEUMBd5yRxqMT2d16n0IE2EmkM6mRwW',NULL,'endi@gumilang.com',NULL,NULL,NULL,NULL,1505532322,1507690082,1,'Endi Antha ','Gumilang Ramadhani','SS Pattimura','082328979490',0,NULL,'default.jpg',1,27),

(99,'36.80.223.135','Utami_3','$2y$08$A7FB8AsEzwQXbvud2cQxgOJSL1odIRFqTv.7MJNprE1fMJmgw4PV2',NULL,'tri@utami.com',NULL,NULL,NULL,NULL,1505532399,1506923536,1,'Tri Utami','tri','SS Pattimura','0',0,NULL,'default.jpg',1,27),

(100,'36.80.223.135','vero_a','$2y$08$rGjFHGaB1E.GqI.4LDbToOp5pIJCovsq3ZVpCvHSycCVSEvoybflK',NULL,'ss@ss.com',NULL,NULL,NULL,NULL,1505533021,NULL,1,'Agustina','Veronika','waroeng ss','082325031067',0,NULL,'default.jpg',1,0),

(101,'36.80.223.135','iska','$2y$08$DBCsuGauISxRngVlG./WQuW8rgubxp/Nkabms.L/d5XWD88/DWQnO',NULL,'ss@ss.com',NULL,NULL,NULL,NULL,1505533365,1507612503,1,'Iska','-','waroeng ss','085200664684',0,NULL,'default.jpg',1,52),

(102,'36.80.223.135','suyatno','$2y$08$jTjc/AAlTX/yjcLQ7OCEM.rI5EYW6b.lWUZNQqvj/oeT6Wg9v0XSy',NULL,'ss@ss.com',NULL,NULL,NULL,NULL,1505533520,1507518222,1,'Suyatno','-','waroeng ss','082325031072',0,NULL,'default.jpg',1,52),

(103,'36.80.223.135','AA_Rohman','$2y$08$rKS4L92IxdYOa7Uoy2UnregpjfrwgYhB4QUDiieFasAuKISxfwJbW',NULL,'ss@ss.com',NULL,NULL,NULL,NULL,1505533520,1506401837,1,'Ahmad','Abdul Rohman','waroeng ss','082328979391',0,NULL,'default.jpg',1,52),

(104,'36.80.223.135','sri_A','$2y$08$A7qce2IxWH1guFrCPVAaqezLp0f49gtmaJBybz8ZCGDaV3zZKY.xa',NULL,'ss@ss.com',NULL,NULL,NULL,NULL,1505533898,1507690009,1,'Sri','Astuti','waroeng ss','0',0,NULL,'default.jpg',1,52),

(105,'36.80.223.135','Kristyo','$2y$08$KLcLR4lW3JETcekiZmDZz.mYtwpBrQfibILcbrP2hxHpZYFNs//R.',NULL,'kris@tyo.com',NULL,NULL,NULL,NULL,1505533962,1507270051,1,'Kristyo ','Widodo','wss klaten','082325030083',0,NULL,'default.jpg',1,31),

(106,'36.80.223.135','Aris_Nur','$2y$08$uLZ1KKvC122k/IYIUzFAEusqC72nDN/PyeAZCGv6kuIeY9gJwsCEq',NULL,'ss@ss.com',NULL,NULL,NULL,NULL,1505533977,NULL,1,'Aris','Nur Hasan','waroeng ss','082325031077',0,NULL,'default.jpg',1,0),

(107,'36.80.223.135','zuraida','$2y$08$e0BLw9pP.kJ12VDoLziXQO5dHdu6RoZNQO4RqqOuiuq30qjMEeMbS',NULL,'zura@ida.com',NULL,NULL,NULL,NULL,1505534037,1507536868,1,'Nuraeni Zuraida','nuraeni','SS Klaten','082325030029',0,NULL,'default.jpg',1,31),

(108,'36.80.223.135','Jamillah','$2y$08$Z81QTKnziFO0D1BhqFmwjeLO9niWl9CmaWhkIOzW0SOBUcj5CQoK.',NULL,'ss@ss.com',NULL,NULL,NULL,NULL,1505534046,1507622708,1,'Jamillah','Abqoriyah','waroeng ss','085200664685',0,NULL,'default.jpg',1,29),

(109,'36.80.223.135','Hendri','$2y$08$muq03B64tejIJlO561souO9Ghq.VIe/GtdTcg4vvWCEDe/K68T.5y',NULL,'ss@ss.com',NULL,NULL,NULL,NULL,1505534108,1507622399,1,'Hendri','Budi','waroeng ss','082225511748',0,NULL,'default.jpg',1,29),

(110,'36.80.223.135','Ikbal','$2y$08$rU91JFkAnzlgvjnyJlbKk.1bjJWgcisT/qMKOvrMMNNLC0VVVVdcm',NULL,'ss@ss.com',NULL,NULL,NULL,NULL,1505534191,1507112066,1,'Ikbal','Novaliantoro','waroeng ss','082328979390',0,NULL,'default.jpg',1,29),

(111,'36.80.223.135','Jumiati','$2y$08$PvF2UYdR4PD7yDsBGhVZxO2MkCapt62r9pefgbURqBEllxiocWA32',NULL,'ss@ss.com',NULL,NULL,NULL,NULL,1505534248,NULL,1,'Jumiati','-','waroeng ss','083866512041',0,NULL,'default.jpg',1,28),

(112,'36.80.223.135','p_wulan','$2y$08$4nVzRC5TLEmMjrifGlEYiuD8OdpflKXO.ePPd.ec/B6ckaZ1lXnl6',NULL,'ss@ss.com',NULL,NULL,NULL,NULL,1505534321,1506572901,1,'Putri','Wulandari','waroeng ss','08989553345',0,NULL,'default.jpg',1,29),

(113,'36.80.223.135','riska_is','$2y$08$JCzb7sKpfaeDOu2b1XrozOMLRFy7XXsf18mbOULLExV0U0QF1EniO',NULL,'ss@ss.com',NULL,NULL,NULL,NULL,1505534376,NULL,1,'Riska','Iswanto','waroeng ss','082325031070',0,NULL,'default.jpg',1,28),

(114,'36.80.223.135','lutfhi_m','$2y$08$HsY5BUg77SLl/XkDcYkIB.yNbeouM92nwRwmW5coZP7Npl5b1ol/e',NULL,'ss@ss.com',NULL,NULL,NULL,NULL,1505534443,1507258198,1,'Luthfi','M','waroeng ss','085200664686',0,NULL,'default.jpg',1,28),

(115,'36.80.223.135','sarwanto','$2y$08$D9JTjaADRL6.W1RHyC56I.8t4jH2b/i3ey.BINDGLuwOlcYu0gHPO',NULL,'ss@ss.com',NULL,NULL,NULL,NULL,1505534506,1507347460,1,'Sarwanto','-','waroeng ss','082325031073',0,NULL,'default.jpg',1,28),

(116,'36.80.223.135','ganung','$2y$08$HoU38GoX3c1RZY7UhPNmBeDrMZToM7CJKjTxlgQITS0dRanhrYwBa',NULL,'ss@ss.com',NULL,NULL,NULL,NULL,1505534564,1507697086,1,'Ganung','-','waroeng ss','082328979415',0,NULL,'default.jpg',1,28),

(117,'36.80.223.135','Agus_S','$2y$08$.7inD3JnSsdyPq3yZIj7K.BkotoVd3HdqLmQ6UzZ3xuGyzFgSYniO',NULL,'agus@supri.com',NULL,NULL,NULL,NULL,1505534742,1507772836,1,'Agus Supriyanto','Supriyanto','SS Klaten','082305030069',0,NULL,'default.jpg',1,31),

(118,'36.80.223.135','Andrianto','$2y$08$ZTR5nDcgEm095ZZyRmlc4Ol/Q1BmYmDyhgouM3I9s14cwrItAc.Yi',NULL,'andri@andrianto.com',NULL,NULL,NULL,NULL,1505534804,1505811662,1,'Andrianto','andri','wss klaten','082328979406',0,NULL,'default.jpg',1,31),

(119,'36.80.223.135','aria_H','$2y$08$7B/4mRmEKP69S/sRox38oeevFsE.zGomXxuRIdWAo6askeDJG8bGm',NULL,'ari@aria.com',NULL,NULL,NULL,NULL,1505535006,NULL,1,'Aria Hendra ','Wibowo','SS Klaten','085729578788',0,NULL,'default.jpg',1,31),

(120,'36.80.223.135','Aghib','$2y$08$okocpiNRhRB.dDWtXoWvwuA7bQpK5/S0C05.fhMQB6RP6FHjeEh2.',NULL,'aghiib@ag.com',NULL,NULL,NULL,NULL,1505535409,NULL,1,'Aghib Bustomi','Bustomi','ss Wonogiri','085200664665',0,NULL,'default.jpg',1,30),

(121,'36.80.223.135','S_Fatimah','$2y$08$twvk8xgv83lKi8cQAQIcA.CFkGmfhPzrFYiALJwz0nUppPkwqJJ7K',NULL,'fati@fatimah.com',NULL,NULL,NULL,NULL,1505535486,1507609243,1,'Siti Fatimah','fatimah','ss Wonogiri','082328979412',0,NULL,'default.jpg',1,30),

(122,'36.80.223.135','Eko_W','$2y$08$U2PalABlNFdmiJhP.wU9gOY.CLEzreE0UhQsPpAITy2camriQc0Ui',NULL,'eko@widi.com',NULL,NULL,NULL,NULL,1505535547,1506574879,1,'Eko Widianto','Widianto','ss Wonogiri','0',0,NULL,'default.jpg',1,30),

(123,'36.80.223.135','Hendro_A','$2y$08$sC6uW7FBDWKk9kvvt09vjOS/Xn/98kV0/Sg055elZp5RL83.TXRIm',NULL,'hendro@gail.com',NULL,NULL,NULL,NULL,1505535547,1507608394,1,'Hendro Arpiyanto','apri','ss Wonogiri','082328979358',0,NULL,'default.jpg',1,30),

(124,'36.80.223.135','istiani_M','$2y$08$QJQ0cUL0dL75g.WfepSksOQaE5uSOpFPG5Z/yFEcJ066WmoYfPwGq',NULL,'isti@mus.com',NULL,NULL,NULL,NULL,1505535690,NULL,1,'Istiani Muslimah','muslim','ss Wonogiri','087834916973',0,NULL,'default.jpg',1,30),

(125,'36.80.223.135','Sepdianto','$2y$08$xmWadwIdgRpz9m8ThDtiQO3uEM1NOJIJwiqH67QQR7YLa1yGfgiI.',NULL,'ss@ss.com',NULL,NULL,NULL,NULL,1505535747,NULL,1,'Sepdianto','Dwi Saputro','waroeng ss','082327323833',0,NULL,'default.jpg',1,32),

(126,'36.80.223.135','AA_Haniarto','$2y$08$r9X7oaEWOkFajat0CoQNpOcgukO3oMgER6xk/zAzUWLM2AcZ0PKIm',NULL,'hani@arto.com',NULL,NULL,NULL,NULL,1505535762,1507786821,1,'Avi Alviana ','Haniarto','SS Wonosari','082138339169',0,NULL,'default.jpg',1,32),

(127,'36.80.223.135','B_Aditya','$2y$08$mN4D0/J/kDj/7Y/htpcfDOPWnoq49m68IrJjSWbQzLEIppqsB93vS',NULL,'bayu@adit.com',NULL,NULL,NULL,NULL,1505535824,NULL,1,'Bayu Aditya','aditya','SS Wonosari','082327323695',0,NULL,'default.jpg',1,32),

(128,'36.80.223.135','Ega','$2y$08$.IsE1tUxn9TLBwoXx0K6o.uurUsDdllPpQyDB2IBmgbBNfjI0lJLW',NULL,'ss@ss.com',NULL,NULL,NULL,NULL,1505535846,1507618632,1,'Ega Mahardika',' Mulya','waroeng ss','082327324059',0,NULL,'default.jpg',1,32),

(129,'118.96.156.183','yulinda','$2y$08$sinLas/BC2nXIAtzKkUkS.SkLMDNCb43a0xIFr4SysYww9eXhZBpy',NULL,'yuli@linda.com',NULL,NULL,NULL,NULL,1505548397,NULL,1,'Yulinda ','Miafatika','SS Sompok','089667801366',0,NULL,'default.jpg',1,0),

(130,'202.67.46.235','Endra','$2y$08$YXpAN7bRptms3zrwdikLU.9YVFu52qc7ALjpifRbWGLT5P/aMEkKO',NULL,'terserah@lah.com',NULL,NULL,NULL,NULL,1503244533,NULL,1,'Endra Setiawan','-','WSS Gading Serpong','081212042167',0,NULL,'default.jpg',1,0),

(131,'202.67.46.235','putri_NY','$2y$08$ogMxrp371lKCm/6KlXPzcOx8Anmsmphwx2LYLqROzrGHzIDx0dq3C',NULL,'terserah@lah.com',NULL,NULL,NULL,NULL,1503244533,1507020238,1,'Putri Nur Yuliyanti','-','WSS Gading Serpong','081212041357',0,NULL,'default.jpg',1,2),

(132,'202.67.46.236','Jafar','$2y$08$YXpAN7bRptms3zrwdikLU.9YVFu52qc7ALjpifRbWGLT5P/aMEkKO',NULL,'terserah@lah.com',NULL,NULL,NULL,NULL,1503244533,1507609245,1,'Abd. Jafar Sodiq','-','WSS Gading Serpong','081212041308',0,NULL,'default.jpg',1,2),

(133,'202.67.46.237','Heri_S','$2y$08$YXpAN7bRptms3zrwdikLU.9YVFu52qc7ALjpifRbWGLT5P/aMEkKO',NULL,'terserah@lah.com',NULL,NULL,NULL,NULL,1503244533,NULL,1,'Heri Susanto','-','WSS Gading Serpong','081212043911',0,NULL,'default.jpg',1,0),

(134,'202.67.46.238','Lisnawati','$2y$08$k..IrZo9xFPkY0OlA/UpQeh7ycxQdQ.9UYBQMuLMS046P4u/nXPAe',NULL,'terserah@lah.com',NULL,NULL,NULL,NULL,1503244533,NULL,1,'Sri Lisnawati','-','WSS Gading Serpong','081317352568',0,NULL,'default.jpg',1,0),

(135,'202.67.46.239','solikin','$2y$08$YXpAN7bRptms3zrwdikLU.9YVFu52qc7ALjpifRbWGLT5P/aMEkKO',NULL,'terserah@lah.com',NULL,NULL,NULL,NULL,1503244533,NULL,1,'solikin','-','WSS BSD','081212044596',0,NULL,'default.jpg',1,0),

(136,'202.67.46.240','putri_SM','$2y$08$YXpAN7bRptms3zrwdikLU.9YVFu52qc7ALjpifRbWGLT5P/aMEkKO',NULL,'terserah@lah.com',NULL,NULL,NULL,NULL,1503244533,NULL,1,'putri sari maharani','-','WSS BSD','081212040263',0,NULL,'default.jpg',1,0),

(137,'202.67.46.241','Eko_P','$2y$08$Y5S3tYX4mbsmOc5zj3Pci.iFnWrezHTn98oxp8ch.VjXJ.xK.fsPO',NULL,'terserah@lah.com',NULL,NULL,NULL,NULL,1503244533,NULL,1,'Eko prasetyo','-','WSS BSD','081212041138',0,NULL,'default.jpg',1,0),

(138,'202.67.46.242','ongki','$2y$08$YXpAN7bRptms3zrwdikLU.9YVFu52qc7ALjpifRbWGLT5P/aMEkKO',NULL,'terserah@lah.com',NULL,NULL,NULL,NULL,1503244533,NULL,1,'Ongki alexander','-','WSS BSD','081294964738',0,NULL,'default.jpg',1,0),

(139,'202.67.46.243','indriyani','$2y$08$YXpAN7bRptms3zrwdikLU.9YVFu52qc7ALjpifRbWGLT5P/aMEkKO',NULL,'terserah@lah.com',NULL,NULL,NULL,NULL,1503244533,NULL,1,'indriyani','-','WSS BSD','085781764142',0,NULL,'default.jpg',1,0),

(140,'202.67.46.244','Slamet','$2y$08$YXpAN7bRptms3zrwdikLU.9YVFu52qc7ALjpifRbWGLT5P/aMEkKO',NULL,'terserah@lah.com',NULL,NULL,NULL,NULL,1503244533,NULL,1,'Slamet Rahayu','-','WSS Lippo Asiatic','081212044725',0,NULL,'default.jpg',1,0),

(141,'202.67.46.245','Uswatul','$2y$08$YXpAN7bRptms3zrwdikLU.9YVFu52qc7ALjpifRbWGLT5P/aMEkKO',NULL,'terserah@lah.com',NULL,NULL,NULL,NULL,1503244533,1507791493,1,'Uswatul Hasanah ','-','WSS Lippo Asiatic','081212040195',0,NULL,'default.jpg',1,4),

(142,'202.67.46.246','Surya_FR','$2y$08$oIICHpMTCu0lK9xL8W2.fuRW8602BI0hNsXkSPwmKTgKNk6w9m142',NULL,'terserah@lah.com',NULL,NULL,NULL,NULL,1503244533,1507791300,1,'Surya Fajar Rizki','-','WSS Lippo Asiatic','081294964731',0,NULL,'default.jpg',1,4),

(143,'202.67.46.247','Mu\'alimin','$2y$08$YXpAN7bRptms3zrwdikLU.9YVFu52qc7ALjpifRbWGLT5P/aMEkKO',NULL,'terserah@lah.com',NULL,NULL,NULL,NULL,1503244533,1507692309,1,'Mu\'alimin','-','WSS Lippo Asiatic','081289510499',0,NULL,'default.jpg',1,4),

(144,'202.67.46.248','Sumiyati','$2y$08$l5Vk0ScAgV3pGR2egiRx/O6DCbvzdwoGoStIqwMv04sfOVVvuavGe',NULL,'terserah@lah.com',NULL,NULL,NULL,NULL,1503244533,1507772499,1,'Sumiyati','-','WSS Gading Serpong','081295878947',0,NULL,'default.jpg',1,4),

(145,'202.67.46.249','Yekti','$2y$08$YXpAN7bRptms3zrwdikLU.9YVFu52qc7ALjpifRbWGLT5P/aMEkKO',NULL,'terserah@lah.com',NULL,NULL,NULL,NULL,1503244533,1507784109,1,'Yekti Handayani','-','WSS Kisamaun','081212044845',0,NULL,'default.jpg',1,5),

(146,'202.67.46.250','Siti_K','$2y$08$YXpAN7bRptms3zrwdikLU.9YVFu52qc7ALjpifRbWGLT5P/aMEkKO',NULL,'terserah@lah.com',NULL,NULL,NULL,NULL,1503244533,1507615555,1,'Siti Khodijah','-','WSS Kisamaun','081212042677',0,NULL,'default.jpg',1,5),

(147,'202.67.46.251','Ifnu','$2y$08$3BFp3r6B.NWH.TbuhVS93eLvtf8hcdT0/nldK6IdKqW2E1QK8N9oG',NULL,'terserah@lah.com',NULL,NULL,NULL,NULL,1503244533,1507613903,1,'Ifnu Kurniawan','-','WSS Kisamaun','081294964734',0,NULL,'default.jpg',1,5),

(148,'202.67.46.252','kosong','kosong',NULL,'kosong',NULL,NULL,NULL,NULL,1503244533,NULL,1,'kosong','-','kosong','kosong',0,NULL,'default.jpg',1,0),

(149,'202.67.46.253','Ahmad_S','$2y$08$CaEB3rnVAHmLe/CGc3lQ5.hP5.Mfn2mvvjpY3naaUGi2yyVa8gM4y',NULL,'terserah@lah.com',NULL,NULL,NULL,NULL,1503244533,NULL,1,'Ahmad Saefudin','-','WSS Kisamaun','085646059880',0,NULL,'default.jpg',1,5),

(150,'202.67.46.254','Heri','$2y$08$YXpAN7bRptms3zrwdikLU.9YVFu52qc7ALjpifRbWGLT5P/aMEkKO',NULL,'terserah@lah.com',NULL,NULL,NULL,NULL,1503244533,NULL,1,'Heri Wahyudi','-','WSS Bintaro #1','081212042917',0,NULL,'default.jpg',1,0),

(151,'202.67.46.255','Welda','$2y$08$YXpAN7bRptms3zrwdikLU.9YVFu52qc7ALjpifRbWGLT5P/aMEkKO',NULL,'terserah@lah.com',NULL,NULL,NULL,NULL,1503244533,1507792268,1,'Welda Novyanti T.','-','WSS Bintaro #1','081212042981',0,NULL,'default.jpg',1,6),

(152,'202.67.46.256','nawawi','$2y$08$YXpAN7bRptms3zrwdikLU.9YVFu52qc7ALjpifRbWGLT5P/aMEkKO',NULL,'terserah@lah.com',NULL,NULL,NULL,NULL,1503244533,1507792353,1,'Muhammad Bahruddin Nawawi','-','WSS Bintaro #1','081294964730',0,NULL,'default.jpg',1,6),

(153,'202.67.46.257','riyanto','$2y$08$YXpAN7bRptms3zrwdikLU.9YVFu52qc7ALjpifRbWGLT5P/aMEkKO',NULL,'terserah@lah.com',NULL,NULL,NULL,NULL,1503244533,NULL,1,'Riyanto','-','WSS Bintaro #1','081294964732',0,NULL,'default.jpg',1,0),

(154,'202.67.46.258','Mumun','$2y$08$YXpAN7bRptms3zrwdikLU.9YVFu52qc7ALjpifRbWGLT5P/aMEkKO',NULL,'terserah@lah.com',NULL,NULL,NULL,NULL,1503244533,NULL,1,'Mumun Munajah','-','WSS Bintaro #1','08567081448',0,NULL,'default.jpg',1,0),

(155,'202.67.46.259','A_Mukti','$2y$08$YXpAN7bRptms3zrwdikLU.9YVFu52qc7ALjpifRbWGLT5P/aMEkKO',NULL,'terserah@lah.com',NULL,NULL,NULL,NULL,1503244533,NULL,1,'Abdul Mukti','-','WSS Citra Raya','081212041865',0,NULL,'default.jpg',1,0),

(156,'202.67.46.260','rizki','$2y$08$ZwfCmwrZcBeYbjKn/zeoZeMhqFByTbB6p4jxiPoF1FFwdkAbYn71y',NULL,'terserah@lah.com',NULL,NULL,NULL,NULL,1503244533,NULL,1,'Rizki Fadilah','-','WSS Citra Raya','081212045347',0,NULL,'default.jpg',1,0),

(157,'202.67.46.261','Bambang_s','$2y$08$YXpAN7bRptms3zrwdikLU.9YVFu52qc7ALjpifRbWGLT5P/aMEkKO',NULL,'terserah@lah.com',NULL,NULL,NULL,NULL,1503244533,1507454992,1,'Bambang Supriyanto','-','WSS Citra Raya','081212041289',0,NULL,'default.jpg',1,7),

(158,'202.67.46.262','Yosep','$2y$08$YXpAN7bRptms3zrwdikLU.9YVFu52qc7ALjpifRbWGLT5P/aMEkKO',NULL,'terserah@lah.com',NULL,NULL,NULL,NULL,1503244533,NULL,1,'A. Yosep','-','WSS Citra Raya','081289510526',0,NULL,'default.jpg',1,0),

(159,'202.67.46.263','S_Nurjanah','$2y$08$YXpAN7bRptms3zrwdikLU.9YVFu52qc7ALjpifRbWGLT5P/aMEkKO',NULL,'terserah@lah.com',NULL,NULL,NULL,NULL,1503244533,NULL,1,'Siti Nurjanah','-','WSS Citra Raya','085783796554',0,NULL,'default.jpg',1,0),

(160,'202.67.46.264','Devi','$2y$08$YXpAN7bRptms3zrwdikLU.9YVFu52qc7ALjpifRbWGLT5P/aMEkKO',NULL,'terserah@lah.com',NULL,NULL,NULL,NULL,1503244533,1507738178,1,'Devi Yuliani','-','WSS L\'Agricola','081212043865',0,NULL,'default.jpg',1,8),

(161,'202.67.46.265','Aisyah','$2y$08$YXpAN7bRptms3zrwdikLU.9YVFu52qc7ALjpifRbWGLT5P/aMEkKO',NULL,'terserah@lah.com',NULL,NULL,NULL,NULL,1503244533,1507773084,1,'Aisyah','-','WSS L\'Agricola','081212041302',0,NULL,'default.jpg',1,8),

(162,'202.67.46.266','Dede','$2y$08$.lRs6B9LAABiVGuw61NR6..zy5elzEPfgaJ1x8pXb0gkPMMwbPM5i',NULL,'terserah@lah.com',NULL,NULL,NULL,NULL,1503244533,1507709014,1,'Dede Wahidin','-','WSS L\'Agricola','081212042183',0,NULL,'default.jpg',1,8),

(163,'202.67.46.267','robbi','$2y$08$YXpAN7bRptms3zrwdikLU.9YVFu52qc7ALjpifRbWGLT5P/aMEkKO',NULL,'terserah@lah.com',NULL,NULL,NULL,NULL,1503244533,1507734739,1,'Robbi Sahril Romadona','-','WSS L\'Agricola','081212044119',0,NULL,'default.jpg',1,8),

(164,'202.67.46.268','Rudiansyah','$2y$08$YXpAN7bRptms3zrwdikLU.9YVFu52qc7ALjpifRbWGLT5P/aMEkKO',NULL,'terserah@lah.com',NULL,NULL,NULL,NULL,1503244533,NULL,1,'Rudiansyah','-','WSS Bogor Yasmin','081212043864',0,NULL,'default.jpg',1,0),

(165,'202.67.46.269','S_Maya','$2y$08$YXpAN7bRptms3zrwdikLU.9YVFu52qc7ALjpifRbWGLT5P/aMEkKO',NULL,'terserah@lah.com',NULL,NULL,NULL,NULL,1503244533,1507789081,1,'Siti Mayasaroh ','-','WSS Bogor Yasmin','081212044367',0,NULL,'default.jpg',1,9),

(166,'202.67.46.270','Ardi','$2y$08$YXpAN7bRptms3zrwdikLU.9YVFu52qc7ALjpifRbWGLT5P/aMEkKO',NULL,'terserah@lah.com',NULL,NULL,NULL,NULL,1503244533,1507789162,1,'Ardi Yani Saputra','-','WSS Bogor Yasmin','081212042470',0,NULL,'default.jpg',1,9),

(167,'202.67.46.271','Herwanto','$2y$08$YXpAN7bRptms3zrwdikLU.9YVFu52qc7ALjpifRbWGLT5P/aMEkKO',NULL,'terserah@lah.com',NULL,NULL,NULL,NULL,1503244533,NULL,1,'Herwanto','-','WSS Bogor Yasmin','081212041127',0,NULL,'default.jpg',1,0),

(168,'202.67.46.272','Sri_R','$2y$08$YXpAN7bRptms3zrwdikLU.9YVFu52qc7ALjpifRbWGLT5P/aMEkKO',NULL,'terserah@lah.com',NULL,NULL,NULL,NULL,1503244533,NULL,1,'Sri Rahayu','-','WSS Bogor Yasmin','089513956150',0,NULL,'default.jpg',1,0),

(169,'202.67.46.273','Maradona','$2y$08$YXpAN7bRptms3zrwdikLU.9YVFu52qc7ALjpifRbWGLT5P/aMEkKO',NULL,'terserah@lah.com',NULL,NULL,NULL,NULL,1503244533,NULL,1,'Gatot Maradona','-','WSS Tanjung Duren Barat','081212044948',0,NULL,'default.jpg',1,10),

(170,'202.67.46.274','natalia','$2y$08$YXpAN7bRptms3zrwdikLU.9YVFu52qc7ALjpifRbWGLT5P/aMEkKO',NULL,'terserah@lah.com',NULL,NULL,NULL,NULL,1503244533,1507793053,1,'Natalia Putri V ','-','WSS Tanjung Duren Barat','081212041594',0,NULL,'default.jpg',1,10),

(171,'202.67.46.275','Arip','$2y$08$8pdbYj4YDNsx5Ev7hrQ64.yyv7h7twqaRUErif3W09VfZw15gtHAO',NULL,'terserah@lah.com',NULL,NULL,NULL,NULL,1503244533,1507742241,1,'Arip Aripin','-','WSS Tanjung Duren Barat','081212041671',0,NULL,'default.jpg',1,10),

(172,'202.67.46.276','Khairul','$2y$08$YXpAN7bRptms3zrwdikLU.9YVFu52qc7ALjpifRbWGLT5P/aMEkKO',NULL,'terserah@lah.com',NULL,NULL,NULL,NULL,1503244533,1507792604,1,'Khairul Anam','-','WSS Tanjung Duren Barat','081212043483',0,NULL,'default.jpg',1,10),

(173,'202.67.46.277','Susan','$2y$08$YXpAN7bRptms3zrwdikLU.9YVFu52qc7ALjpifRbWGLT5P/aMEkKO',NULL,'terserah@lah.com',NULL,NULL,NULL,NULL,1503244533,NULL,1,'Susan Jayanti','-','WSS Tanjung Duren Barat','089631831798',0,NULL,'default.jpg',1,0),

(174,'202.67.46.278','Deni','$2y$08$YXpAN7bRptms3zrwdikLU.9YVFu52qc7ALjpifRbWGLT5P/aMEkKO',NULL,'terserah@lah.com',NULL,NULL,NULL,NULL,1503244533,1507617852,1,'Deni Iskandar','-','WSS Palem Semi','081289510704',0,NULL,'default.jpg',1,11),

(175,'202.67.46.279','Feni_L','$2y$08$YXpAN7bRptms3zrwdikLU.9YVFu52qc7ALjpifRbWGLT5P/aMEkKO',NULL,'terserah@lah.com',NULL,NULL,NULL,NULL,1503244533,1507683282,1,'Feni Lestari','-','WSS Palem Semi','081212043815',0,NULL,'default.jpg',1,11),

(176,'202.67.46.280','Asep','$2y$08$vZfBpshQ1l7IEfB71DyvDO7RvXuLkSC6SfwUvbaiwqr6sex2pvEMy',NULL,'terserah@lah.com',NULL,NULL,NULL,NULL,1503244533,1507780951,1,'Asep Sunarya','-','WSS Palem Semi','081212040384',0,NULL,'default.jpg',1,11),

(177,'202.67.46.281','Aulia','$2y$08$YXpAN7bRptms3zrwdikLU.9YVFu52qc7ALjpifRbWGLT5P/aMEkKO',NULL,'terserah@lah.com',NULL,NULL,NULL,NULL,1503244533,1507781399,1,'Aulia ulfa','-','WSS Palem Semi','089652003715',0,NULL,'default.jpg',1,11),

(178,'202.67.46.282','Azzakir','$2y$08$YXpAN7bRptms3zrwdikLU.9YVFu52qc7ALjpifRbWGLT5P/aMEkKO',NULL,'terserah@lah.com',NULL,NULL,NULL,NULL,1503244533,NULL,1,'A\'rof Azzakir','-','WSS Bintaro #2','081212043524',0,NULL,'default.jpg',1,0),

(179,'202.67.46.283','Desita','$2y$08$PcG1/FEHG4ErVbbW3FYs9emY5qP5H7UMpXDkHPRhLb1hbC7eDPHuu',NULL,'terserah@lah.com',NULL,NULL,NULL,NULL,1503244533,1507788077,1,'Desita Dewi Nariana','-','WSS Bintaro #2','081212041248',0,NULL,'default.jpg',1,12),

(180,'202.67.46.284','Abayajid','$2y$08$YeqCsoOcSvYugG7bT5VbweGVQ47B1xAgDIkLrJItLWWZajoltOVOG',NULL,'terserah@lah.com',NULL,NULL,NULL,NULL,1503244533,1507784155,1,'Abayajid Basthomy','-','WSS Bintaro #2','081212040712',0,NULL,'default.jpg',1,12),

(181,'202.67.46.285','Basiril','$2y$08$YXpAN7bRptms3zrwdikLU.9YVFu52qc7ALjpifRbWGLT5P/aMEkKO',NULL,'terserah@lah.com',NULL,NULL,NULL,NULL,1503244533,1507005561,1,'Basiril','-','WSS Bintaro #2','081212043069',0,NULL,'default.jpg',1,12),

(182,'202.67.46.286','Nanda','$2y$08$YXpAN7bRptms3zrwdikLU.9YVFu52qc7ALjpifRbWGLT5P/aMEkKO',NULL,'terserah@lah.com',NULL,NULL,NULL,NULL,1503244533,NULL,1,'Nanda Nur Safitri','-','WSS Bintaro #2','089621675308',0,NULL,'default.jpg',1,0),

(183,'202.67.46.287','Sugeng','$2y$08$YXpAN7bRptms3zrwdikLU.9YVFu52qc7ALjpifRbWGLT5P/aMEkKO',NULL,'terserah@lah.com',NULL,NULL,NULL,NULL,1503244533,1507523381,1,'Sugeng Suherman','-','WSS Tanjung Duren Utara','081289510603',0,NULL,'default.jpg',1,13),

(184,'202.67.46.288','putri_DE','$2y$08$YXpAN7bRptms3zrwdikLU.9YVFu52qc7ALjpifRbWGLT5P/aMEkKO',NULL,'terserah@lah.com',NULL,NULL,NULL,NULL,1503244533,1507791319,1,'Putri Dewi Elindasari','-','WSS Tanjung Duren Utara','081289400570',0,NULL,'default.jpg',1,13),

(185,'202.67.46.289','A_Arifin','$2y$08$MUPdRKxPmT6gKrrDo7ByEuageRuuK6HCQhK5i2LmEKC7eTxIIsbWa',NULL,'terserah@lah.com',NULL,NULL,NULL,NULL,1503244533,1507791453,1,'Ahmad Arifin','-','WSS Tanjung Duren Utara','081289510391',0,NULL,'default.jpg',1,13),

(186,'202.67.46.290','Nahrudin','$2y$08$YXpAN7bRptms3zrwdikLU.9YVFu52qc7ALjpifRbWGLT5P/aMEkKO',NULL,'terserah@lah.com',NULL,NULL,NULL,NULL,1503244533,1507742070,1,'Nahrudin','-','WSS Tanjung Duren Utara','081289400583',0,NULL,'default.jpg',1,13),

(187,'202.67.46.291','Yulinda_Jbtk','$2y$08$hUbn5CuNH45JKCXhSOASUOUQ0LXcqccW2k8VOkjTBEPkN4eVAUS4C',NULL,'terserah@lah.com',NULL,NULL,NULL,NULL,1503244533,1507708748,1,'Yulinda','-','WSS Tanjung Duren Utara','085921678781',0,NULL,'default.jpg',1,13),

(188,'202.67.46.292','Tarmidzi','$2y$08$YXpAN7bRptms3zrwdikLU.9YVFu52qc7ALjpifRbWGLT5P/aMEkKO',NULL,'terserah@lah.com',NULL,NULL,NULL,NULL,1503244533,NULL,1,'Tarmidzi','-','WSS Cirebon Ampera','082325029448',0,NULL,'default.jpg',1,0),

(189,'202.67.46.293','Anisah','$2y$08$YXpAN7bRptms3zrwdikLU.9YVFu52qc7ALjpifRbWGLT5P/aMEkKO',NULL,'terserah@lah.com',NULL,NULL,NULL,NULL,1503244533,NULL,1,'Anisah','-','WSS Cirebon Ampera','081215406152',0,NULL,'default.jpg',1,0),

(190,'202.67.46.294','Yoyo_W','$2y$08$b4JHbMzfi0AGHvNBrvFNCOSMHUV5BdUBZArMn8uS.q3jI74jqKD92',NULL,'terserah@lah.com',NULL,NULL,NULL,NULL,1503244533,NULL,1,'Yoyo Waluyo','-','WSS Cirebon Ampera','081215406153',0,NULL,'default.jpg',1,0),

(191,'202.67.46.295','Sumarsono','$2y$08$XIJ2tTODoHaC5qX7Y1KC1uwHVUM8xOd7X.aD1MtflUa8gMqwPhioi',NULL,'terserah@lah.com',NULL,NULL,NULL,NULL,1503244533,NULL,1,'Sumarsono','-','WSS Cirebon Ampera','082328979407',0,NULL,'default.jpg',1,0),

(192,'202.67.46.296','Suena','$2y$08$YXpAN7bRptms3zrwdikLU.9YVFu52qc7ALjpifRbWGLT5P/aMEkKO',NULL,'terserah@lah.com',NULL,NULL,NULL,NULL,1503244533,NULL,1,'Suena','-','WSS Cirebon Ampera','089660653372',0,NULL,'default.jpg',1,0),

(193,'202.67.46.297','nukman','$2y$08$YXpAN7bRptms3zrwdikLU.9YVFu52qc7ALjpifRbWGLT5P/aMEkKO',NULL,'terserah@lah.com',NULL,NULL,NULL,NULL,1503244533,NULL,1,'M. Nukman Yusuf','-','WSS Cirebon Tuparev','082325029439',0,NULL,'default.jpg',1,0),

(194,'202.67.46.298','Sanici','$2y$08$YXpAN7bRptms3zrwdikLU.9YVFu52qc7ALjpifRbWGLT5P/aMEkKO',NULL,'terserah@lah.com',NULL,NULL,NULL,NULL,1503244533,NULL,1,'Sanici','-','WSS Cirebon Tuparev','082325029435',0,NULL,'default.jpg',1,0),

(195,'202.67.46.299','Taryono','$2y$08$bMzVet3Q62IYt32kgn8YIOmaWsCjDSaNN0ROuP/bH.uFf42uH5dOC',NULL,'terserah@lah.com',NULL,NULL,NULL,NULL,1503244533,NULL,1,'Taryono','-','WSS Cirebon Tuparev','081215406137',0,NULL,'default.jpg',1,0),

(196,'202.67.46.300','ramadhan','$2y$08$Cji4WSpW7yStc1AanKax4O1GgrLgerb4R4mEzx8elr6pgQpCQIpBi',NULL,'terserah@lah.com',NULL,NULL,NULL,NULL,1503244533,NULL,1,'Ramadhan','-','WSS Cirebon Tuparev','082328979387',0,NULL,'default.jpg',1,0),

(197,'202.67.46.301','nurul\'aini','$2y$08$YXpAN7bRptms3zrwdikLU.9YVFu52qc7ALjpifRbWGLT5P/aMEkKO',NULL,'terserah@lah.com',NULL,NULL,NULL,NULL,1503244533,NULL,1,'Nurul\'aini','-','WSS Cirebon Tuparev','089570127807',0,NULL,'default.jpg',1,0),

(198,'202.67.46.302','Didik_Sri','$2y$08$YXpAN7bRptms3zrwdikLU.9YVFu52qc7ALjpifRbWGLT5P/aMEkKO',NULL,'terserah@lah.com',NULL,NULL,NULL,NULL,1503244533,NULL,1,'Didik Sri widodo ','-','WSS Purwokerto GOR Satria','082325029464',0,NULL,'default.jpg',1,0),

(199,'202.67.46.303','Siti_DH','$2y$08$YXpAN7bRptms3zrwdikLU.9YVFu52qc7ALjpifRbWGLT5P/aMEkKO',NULL,'terserah@lah.com',NULL,NULL,NULL,NULL,1503244533,NULL,1,'Siti Dwi Handayani','-','WSS Purwokerto GOR Satria','082325029460',0,NULL,'default.jpg',1,0),

(200,'202.67.46.304','Jaelani','$2y$08$x/Df3iydZtV6GrsLZnE89e/adGw..0jNVvtvuUfADXjoaxsJJzcRG',NULL,'terserah@lah.com',NULL,NULL,NULL,NULL,1503244533,NULL,1,'Jaelani','-','WSS Purwokerto GOR Satria','082325029463',0,NULL,'default.jpg',1,39),

(201,'202.67.46.305','Wismono','$2y$08$2M/iVNrVUV5iC6SKOdVcvurIXA2Ia37Pi0zZTgQoTSYYDJcaxb6a6',NULL,'terserah@lah.com',NULL,NULL,NULL,NULL,1503244533,1507188955,1,'Budi Wismono','-','WSS Purwokerto GOR Satria','082328979350',0,NULL,'default.jpg',1,39),

(202,'202.67.46.306','Sari_Indri','$2y$08$YXpAN7bRptms3zrwdikLU.9YVFu52qc7ALjpifRbWGLT5P/aMEkKO',NULL,'terserah@lah.com',NULL,NULL,NULL,NULL,1503244533,NULL,1,'Sari indriyati','-','WSS Purwokerto GOR Satria','085643913996',0,NULL,'default.jpg',1,0),

(203,'202.67.46.307','Febriyanto','$2y$08$YXpAN7bRptms3zrwdikLU.9YVFu52qc7ALjpifRbWGLT5P/aMEkKO',NULL,'terserah@lah.com',NULL,NULL,NULL,NULL,1503244533,NULL,1,'Febriyanto','-','WSS Jatinangor','082322819383',0,NULL,'default.jpg',1,0),

(204,'202.67.46.308','nengsi','$2y$08$YXpAN7bRptms3zrwdikLU.9YVFu52qc7ALjpifRbWGLT5P/aMEkKO',NULL,'terserah@lah.com',NULL,NULL,NULL,NULL,1503244533,NULL,1,'Nengsi Susilawati','-','WSS Jatinangor','082322819395',0,NULL,'default.jpg',1,0),

(205,'202.67.46.309','rendi_latif','$2y$08$F3E9ge12FcUFobDuh6D8oe9bPM7zASeB83Rg1QoeKBD2QLBBw.VCC',NULL,'terserah@lah.com',NULL,NULL,NULL,NULL,1503244533,NULL,1,'Rendi Latif Haryanto','-','WSS Jatinangor','082322819396',0,NULL,'default.jpg',1,0),

(206,'202.67.46.310','Chandra_jbtk','$2y$08$YXpAN7bRptms3zrwdikLU.9YVFu52qc7ALjpifRbWGLT5P/aMEkKO',NULL,'terserah@lah.com',NULL,NULL,NULL,NULL,1503244533,NULL,1,'Chandra','-','WSS Jatinangor','082322819388',0,NULL,'default.jpg',1,0),

(207,'202.67.46.311','windi','$2y$08$YXpAN7bRptms3zrwdikLU.9YVFu52qc7ALjpifRbWGLT5P/aMEkKO',NULL,'terserah@lah.com',NULL,NULL,NULL,NULL,1503244533,NULL,1,'windi andini','-','WSS Jatinangor','089656224223',0,NULL,'default.jpg',1,0),

(208,'202.67.46.312','Febi','$2y$08$YXpAN7bRptms3zrwdikLU.9YVFu52qc7ALjpifRbWGLT5P/aMEkKO',NULL,'terserah@lah.com',NULL,NULL,NULL,NULL,1503244533,NULL,1,'Febi Jumawan','-','WSS Purwokerto Wirya Atmaja','082328979344',0,NULL,'default.jpg',1,0),

(209,'202.67.46.313','nurul','$2y$08$YXpAN7bRptms3zrwdikLU.9YVFu52qc7ALjpifRbWGLT5P/aMEkKO',NULL,'terserah@lah.com',NULL,NULL,NULL,NULL,1503244533,1507717952,1,'Nurul Huswatun Hasanah','-','WSS Purwokerto Wirya Atmaja','082328979342',0,NULL,'default.jpg',1,40),

(210,'202.67.46.314','prayogiyanto','$2y$08$ngC2TewXJDmqjnvXgUXxb.M4ngybdNmbOXjqCbtNGcn.96iI8qGSq',NULL,'terserah@lah.com',NULL,NULL,NULL,NULL,1503244533,1507784489,1,'Prayogi Yanto','-','WSS Purwokerto Wirya Atmaja','082328979332',0,NULL,'default.jpg',1,40),

(211,'202.67.46.315','rizky_Wid','$2y$08$y0nfEHemJ3kmPfaEs03zvuYzbN0aFGdrdAVASb36nFHpZEjOAAfpC',NULL,'terserah@lah.com',NULL,NULL,NULL,NULL,1503244533,1507702417,1,'Rizky Widayat','-','WSS Purwokerto Wirya Atmaja','082328979335',0,NULL,'default.jpg',1,40),

(212,'202.67.46.316','ngesti','$2y$08$7dmJDARw8e/CL9loEgnKJerrfEGhqqiLRYVNnVV3ejvMoeDJziwNu',NULL,'terserah@lah.com',NULL,NULL,NULL,NULL,1503244533,1507785027,1,'Ngesti Palupi','-','WSS Purwokerto Wirya Atmaja','082242720770',0,NULL,'default.jpg',1,40),

(213,'202.67.46.317','Ari_Pur','$2y$08$VJ14lF2aLSgXikscv6H35Oh.0YhAfcibmDNDeQCNTpdag2SuG.ujy',NULL,'terserah@lah.com',NULL,NULL,NULL,NULL,1503244533,NULL,1,'Ari Purnomo','-','WSS Cilacap','082242932388',0,NULL,'default.jpg',1,53),

(214,'202.67.46.318','Hana','$2y$08$YXpAN7bRptms3zrwdikLU.9YVFu52qc7ALjpifRbWGLT5P/aMEkKO',NULL,'terserah@lah.com',NULL,NULL,NULL,NULL,1503244533,NULL,1,'Hana Didik Relika Sari','-','WSS Cilacap','082242932353',0,NULL,'default.jpg',1,0),

(215,'202.67.46.319','Wahyudi','$2y$08$YLiF0GiyKCYAAfFLp0KoTO8XaNfMUC.s15onXj8TWhcgBREJVr1g.',NULL,'terserah@lah.com',NULL,NULL,NULL,NULL,1503244533,1507704618,1,'Wahyudi','-','WSS Cilacap','082242932349',0,NULL,'default.jpg',1,53),

(216,'202.67.46.320','Septiawan','$2y$08$yIXSfb8XURZ0kwmZcYIw9OGWlYZVTuB3Vsvt4inokhodbjSrhx0Rq',NULL,'terserah@lah.com',NULL,NULL,NULL,NULL,1503244533,NULL,1,'Septiawan','-','WSS Cilacap','082242932361',0,NULL,'default.jpg',1,0),

(217,'202.67.46.321','riyadi_Yan','$2y$08$YXpAN7bRptms3zrwdikLU.9YVFu52qc7ALjpifRbWGLT5P/aMEkKO',NULL,'terserah@lah.com',NULL,NULL,NULL,NULL,1503244533,NULL,1,'Yan Riyadi','-','WSS Cilacap','085641833612',0,NULL,'default.jpg',1,0),

(218,'202.67.46.322','Boby','$2y$08$YXpAN7bRptms3zrwdikLU.9YVFu52qc7ALjpifRbWGLT5P/aMEkKO',NULL,'terserah@lah.com',NULL,NULL,NULL,NULL,1503244533,1507175069,1,'Yohana Boby Irawan','-','WSS Puri Anjasmoro','082325029319',0,NULL,'default.jpg',1,16),

(219,'202.67.46.323','S_Rahma','$2y$08$9TkUrjyOfNYtxHJsZswcTOjLu0hEfeVP3TDldI7EWV9WwiB4ZiqlC',NULL,'terserah@lah.com',NULL,NULL,NULL,NULL,1503244533,1507622022,1,'Siti Rahma','-','WSS Puri Anjasmoro','082325030998',0,NULL,'default.jpg',1,16),

(220,'202.67.46.324','Erwin','$2y$08$YXpAN7bRptms3zrwdikLU.9YVFu52qc7ALjpifRbWGLT5P/aMEkKO',NULL,'terserah@lah.com',NULL,NULL,NULL,NULL,1503244533,1507619610,1,'Erwin Firmansyah','-','WSS Puri Anjasmoro','082325030993',0,NULL,'default.jpg',1,16),

(221,'202.67.46.325','Faisol','$2y$08$YXpAN7bRptms3zrwdikLU.9YVFu52qc7ALjpifRbWGLT5P/aMEkKO',NULL,'terserah@lah.com',NULL,NULL,NULL,NULL,1503244533,1507733506,1,'Faisol Nurul Anam','-','WSS Puri Anjasmoro','082328979426',0,NULL,'default.jpg',1,16),

(222,'202.67.46.326','riri','$2y$08$YXpAN7bRptms3zrwdikLU.9YVFu52qc7ALjpifRbWGLT5P/aMEkKO',NULL,'terserah@lah.com',NULL,NULL,NULL,NULL,1503244533,1507349001,1,'Riri Wahyu P','-','WSS Puri Anjasmoro','083838151576',0,NULL,'default.jpg',1,16),

(223,'202.67.46.327','Fadly','$2y$08$YXpAN7bRptms3zrwdikLU.9YVFu52qc7ALjpifRbWGLT5P/aMEkKO',NULL,'terserah@lah.com',NULL,NULL,NULL,NULL,1503244533,1506916465,1,'Fadly Rahman','-','WSS Lampersari','082325030972',0,NULL,'default.jpg',1,18),

(224,'202.67.46.328','Juwita','$2y$08$ug/esj.6bub8Hn/DUNnbuumml95XmunLmg2macdLQlswnHwjWWyUe',NULL,'terserah@lah.com',NULL,NULL,NULL,NULL,1503244533,1507625981,1,'Ayu Juwita','-','WSS Lampersari','082325030976',0,NULL,'default.jpg',1,18),

(225,'202.67.46.329','Fairuz','$2y$08$YXpAN7bRptms3zrwdikLU.9YVFu52qc7ALjpifRbWGLT5P/aMEkKO',NULL,'terserah@lah.com',NULL,NULL,NULL,NULL,1503244533,1507786699,1,'Fairuz Zamzami','-','WSS Lampersari','082325030973',0,NULL,'default.jpg',1,18),

(226,'202.67.46.330','Andri','$2y$08$rKaikxyZxXJKheGFtEC.ju2ZWHQbT4/rZZj20zC5RLno79czR.Mke',NULL,'terserah@lah.com',NULL,NULL,NULL,NULL,1503244533,1507715228,1,'Andri Agung S.','-','WSS Lampersari','082328979359',0,NULL,'default.jpg',1,18),

(227,'202.67.46.331','Hernowo','$2y$08$YXpAN7bRptms3zrwdikLU.9YVFu52qc7ALjpifRbWGLT5P/aMEkKO',NULL,'terserah@lah.com',NULL,NULL,NULL,NULL,1503244533,NULL,1,'Satrio Agung Hernowo','-','WSS Salatiga Diponegoro','082325031018',0,NULL,'default.jpg',1,0),

(228,'202.67.46.332','retno_i','$2y$08$YXpAN7bRptms3zrwdikLU.9YVFu52qc7ALjpifRbWGLT5P/aMEkKO',NULL,'terserah@lah.com',NULL,NULL,NULL,NULL,1503244533,NULL,1,'Retno Indriyani','-','WSS Salatiga Diponegoro','082325031025',0,NULL,'default.jpg',1,0),

(229,'202.67.46.333','Budi_S','$2y$08$YXpAN7bRptms3zrwdikLU.9YVFu52qc7ALjpifRbWGLT5P/aMEkKO',NULL,'terserah@lah.com',NULL,NULL,NULL,NULL,1503244533,1507522988,1,'Budi Santoso','-','WSS Salatiga Diponegoro','082325031019',0,NULL,'default.jpg',1,21),

(230,'202.67.46.334','A_Affandi','$2y$08$YXpAN7bRptms3zrwdikLU.9YVFu52qc7ALjpifRbWGLT5P/aMEkKO',NULL,'terserah@lah.com',NULL,NULL,NULL,NULL,1503244533,NULL,1,'Arif Afandi','-','WSS Salatiga Diponegoro','082328979360',0,NULL,'default.jpg',1,21),

(231,'202.67.46.335','Endrik','$2y$08$HAilXiLiqveYi5IX8fIqEuEiHkobs8QKiT.i7UvOENFXagrshc1Cu',NULL,'terserah@lah.com',NULL,NULL,NULL,NULL,1503244533,1507362662,1,'Endrik Restu Pambudi','-','WSS Salatiga Diponegoro','081908922846',0,NULL,'default.jpg',1,21),

(232,'202.67.46.336','Budiman','$2y$08$YXpAN7bRptms3zrwdikLU.9YVFu52qc7ALjpifRbWGLT5P/aMEkKO',NULL,'terserah@lah.com',NULL,NULL,NULL,NULL,1503244533,NULL,1,'Budiman','-','WSS Tembalang #1','082325031002',0,NULL,'default.jpg',1,0),

(233,'202.67.46.337','Linda','$2y$08$aRyu2ZZ0c6hUbbW0SQgqCu7p15Y0xYU9tV0HvZ2/Td3ADUZDnVK7S',NULL,'terserah@lah.com',NULL,NULL,NULL,NULL,1503244533,1507718805,1,'Linda Melani','-','WSS Tembalang #1','082325031008',0,NULL,'default.jpg',1,15),

(234,'202.67.46.338','oka','$2y$08$YXpAN7bRptms3zrwdikLU.9YVFu52qc7ALjpifRbWGLT5P/aMEkKO',NULL,'terserah@lah.com',NULL,NULL,NULL,NULL,1503244533,1507780273,1,'Oka Oktavianto','-','WSS Tembalang #1','082325031003',0,NULL,'default.jpg',1,15),

(235,'202.67.46.339','Tomi_S','$2y$08$.UWli8TynuGqjGzDR0GqduI9ga/mbub51FLvM1IzCTkw3VPGfYa16',NULL,'terserah@lah.com',NULL,NULL,NULL,NULL,1503244533,1507772040,1,'Tomi Santoso','-','WSS Tembalang #1','082328979421',0,NULL,'default.jpg',1,14),

(236,'202.67.46.340','Septi_M','$2y$08$YXpAN7bRptms3zrwdikLU.9YVFu52qc7ALjpifRbWGLT5P/aMEkKO',NULL,'terserah@lah.com',NULL,NULL,NULL,NULL,1503244533,NULL,1,'Septi Maulani','-','WSS Tembalang #1','0',0,NULL,'default.jpg',1,0),

(237,'202.67.46.341','Khoirun','$2y$08$YXpAN7bRptms3zrwdikLU.9YVFu52qc7ALjpifRbWGLT5P/aMEkKO',NULL,'terserah@lah.com',NULL,NULL,NULL,NULL,1503244533,NULL,1,'Khoirun Anwar','-','WSS Sambiroto','082325030984',0,NULL,'default.jpg',1,17),

(238,'202.67.46.342','D_Anita','$2y$08$YXpAN7bRptms3zrwdikLU.9YVFu52qc7ALjpifRbWGLT5P/aMEkKO',NULL,'terserah@lah.com',NULL,NULL,NULL,NULL,1503244533,NULL,1,'Dika Anita Sari','-','WSS Sambiroto','082325030990',0,NULL,'default.jpg',1,17),

(239,'202.67.46.343','Khuluq','$2y$08$JHQ1xvIrw2APFgWVEGV1XOVIs5rgzYooi42IG3febS5ilBb77uaXy',NULL,'terserah@lah.com',NULL,NULL,NULL,NULL,1503244533,1507351802,1,'M. Achsanul Khuluq','-','WSS Sambiroto','082325030985',0,NULL,'default.jpg',1,17),

(240,'202.67.46.344','Latif_Z','$2y$08$G6ELUl2IdkBJlxQY3FExw.fPsGFiKyC2k3ld5S/PwZv0KRAbP8y4i',NULL,'terserah@lah.com',NULL,NULL,NULL,NULL,1503244533,NULL,1,'Latif Zainal Abidin','-','WSS Ungaran','082328979422',0,NULL,'default.jpg',1,17),

(241,'202.67.46.345','Marinda','$2y$08$YXpAN7bRptms3zrwdikLU.9YVFu52qc7ALjpifRbWGLT5P/aMEkKO',NULL,'terserah@lah.com',NULL,NULL,NULL,NULL,1503244533,NULL,1,'Marinda Ratna P','-','WSS Sambiroto','0',0,NULL,'default.jpg',1,0),

(242,'202.67.46.346','Deny_P','$2y$08$YXpAN7bRptms3zrwdikLU.9YVFu52qc7ALjpifRbWGLT5P/aMEkKO',NULL,'terserah@lah.com',NULL,NULL,NULL,NULL,1503244533,NULL,1,'Deny Prasetyo','-','WSS Ngaliyan','082325030978',0,NULL,'default.jpg',1,19),

(243,'202.67.46.347','Lukmita','$2y$08$YXpAN7bRptms3zrwdikLU.9YVFu52qc7ALjpifRbWGLT5P/aMEkKO',NULL,'terserah@lah.com',NULL,NULL,NULL,NULL,1503244533,1507785846,1,'Erna Lukmita S','-','WSS Ngaliyan','082325030983',0,NULL,'default.jpg',1,19),

(244,'202.67.46.348','Andi_W','$2y$08$YXpAN7bRptms3zrwdikLU.9YVFu52qc7ALjpifRbWGLT5P/aMEkKO',NULL,'terserah@lah.com',NULL,NULL,NULL,NULL,1503244533,1507530746,1,'Andi Wibowo','-','WSS Ngaliyan','082325030979',0,NULL,'default.jpg',1,19),

(245,'202.67.46.349','Syaiful_A','$2y$08$1zsK4W8.9N013v6nck7wqOIIJwrFU.X.4QsKNdHZBWCbujUiUmbgS',NULL,'terserah@lah.com',NULL,NULL,NULL,NULL,1503244533,1507192729,1,'Syaiful Anwar','-','WSS Ngaliyan','082328979423',0,NULL,'default.jpg',1,19),

(246,'202.67.46.350','Sri_Wahyu','$2y$08$YXpAN7bRptms3zrwdikLU.9YVFu52qc7ALjpifRbWGLT5P/aMEkKO',NULL,'terserah@lah.com',NULL,NULL,NULL,NULL,1503244533,NULL,1,'Sri Wahyuni','-','WSS Ngaliyan','0',0,NULL,'default.jpg',1,0),

(247,'202.67.46.351','I_Maulana','$2y$08$YXpAN7bRptms3zrwdikLU.9YVFu52qc7ALjpifRbWGLT5P/aMEkKO',NULL,'terserah@lah.com',NULL,NULL,NULL,NULL,1503244533,1507788330,1,'Indra Maulana Cahyo','-','WSS Salatiga Jenderal Sudirman','082325031026',0,NULL,'default.jpg',1,22),

(248,'202.67.46.352','Gian','$2y$08$w.OeAwG0Vuy7orVg0dITRuSmlMzHoGkE6/c9GfmGSHhLfdEUwtlJC',NULL,'terserah@lah.com',NULL,NULL,NULL,NULL,1503244533,1507791500,1,'Gian Lestari','-','WSS Salatiga Jenderal Sudirman','082325031030',0,NULL,'default.jpg',1,22),

(249,'202.67.46.353','B_Yulia','$2y$08$BIwQg.HpN41wqkF05fOjt.w1I4/oKv2HWxGkLHLSu1C7cd4V/rfdO',NULL,'terserah@lah.com',NULL,NULL,NULL,NULL,1503244533,1507038672,1,'Bagus Yulia Muslikhin','-','WSS Salatiga Jenderal Sudirman','082325031027',0,NULL,'default.jpg',1,22),

(250,'202.67.46.354','Supriyono','$2y$08$YXpAN7bRptms3zrwdikLU.9YVFu52qc7ALjpifRbWGLT5P/aMEkKO',NULL,'terserah@lah.com',NULL,NULL,NULL,NULL,1503244533,NULL,1,'Supriyono','-','WSS Salatiga Jenderal Sudirman','082328979364',0,NULL,'default.jpg',1,0),

(251,'202.67.46.355','M_Roni','$2y$08$kIfRUokf40zQmveR1WVXr.rLZAwBfUdwzquhtQLH.cEUykR12KewS',NULL,'terserah@lah.com',NULL,NULL,NULL,NULL,1503244533,1507422208,1,'M Roni','-','WSS Ungaran','085726870724',0,NULL,'default.jpg',1,22),

(252,'202.67.46.356','Syukron','$2y$08$YXpAN7bRptms3zrwdikLU.9YVFu52qc7ALjpifRbWGLT5P/aMEkKO',NULL,'terserah@lah.com',NULL,NULL,NULL,NULL,1503244533,NULL,1,'Ahmad Syukron','-','WSS Pekalongan Baros','082325031013',0,NULL,'default.jpg',1,0),

(253,'202.67.46.357','Nanis','$2y$08$YXpAN7bRptms3zrwdikLU.9YVFu52qc7ALjpifRbWGLT5P/aMEkKO',NULL,'terserah@lah.com',NULL,NULL,NULL,NULL,1503244533,1507790017,1,'Hen Nanis Suciati','-','WSS Pekalongan Baros','082325031017',0,NULL,'default.jpg',1,20),

(254,'202.67.46.358','Subandiyo','$2y$08$YXpAN7bRptms3zrwdikLU.9YVFu52qc7ALjpifRbWGLT5P/aMEkKO',NULL,'terserah@lah.com',NULL,NULL,NULL,NULL,1503244533,1507606229,1,'Subandiyo','-','WSS Pekalongan Baros','082325031014',0,NULL,'default.jpg',1,20),

(255,'202.67.46.359','Demyati','$2y$08$YXpAN7bRptms3zrwdikLU.9YVFu52qc7ALjpifRbWGLT5P/aMEkKO',NULL,'terserah@lah.com',NULL,NULL,NULL,NULL,1503244533,1507697905,1,'Mahfud Demyati','-','WSS Pekalongan Baros','082328979362',0,NULL,'default.jpg',1,20),

(256,'202.67.46.360','nurul_k','$2y$08$tgPyFAIgqhaAPmpuGF.g4ub89s.bxGK6N2LrMhRsW0giKpc3Lc42u',NULL,'terserah@lah.com',NULL,NULL,NULL,NULL,1503244533,1507541861,1,'Nurul Komariyah','-','Ass Keuangan Sampangan','0',0,NULL,'default.jpg',1,25),

(257,'202.67.46.361','Suprat','$2y$08$YXpAN7bRptms3zrwdikLU.9YVFu52qc7ALjpifRbWGLT5P/aMEkKO',NULL,'terserah@lah.com',NULL,NULL,NULL,NULL,1503244533,NULL,1,'Suprat','-','WSS Ungaran','082300053800',0,NULL,'default.jpg',1,23),

(258,'202.67.46.362','Titik_M','$2y$08$t705gEUmOyr.YT1y9tVA8.I786J4tEe18FCkXMf0dX7uYeXCpMFLW',NULL,'terserah@lah.com',NULL,NULL,NULL,NULL,1503244533,1507779785,1,'Titik Marfiati','-','WSS Ungaran','082300053821',0,NULL,'default.jpg',1,23),

(259,'202.67.46.363','Aji_S','$2y$08$v16npu9NjbZTZeUg4AfGXuf2T3UY5kzJn5PDqWP4DEmY6qtXFqpf.',NULL,'terserah@lah.com',NULL,NULL,NULL,NULL,1503244533,1507551638,1,'Aji Sariyadi','-','WSS Ungaran','082300053822',0,NULL,'default.jpg',1,23),

(260,'202.67.46.364','Ibnu_Okto','$2y$08$YXpAN7bRptms3zrwdikLU.9YVFu52qc7ALjpifRbWGLT5P/aMEkKO',NULL,'terserah@lah.com',NULL,NULL,NULL,NULL,1503244533,1507715359,1,'Dwi Ibnu Okto Saputra','-','WSS Ungaran','082300053825',0,NULL,'default.jpg',1,23),

(261,'202.67.46.365','Desi_W','$2y$08$YXpAN7bRptms3zrwdikLU.9YVFu52qc7ALjpifRbWGLT5P/aMEkKO',NULL,'terserah@lah.com',NULL,NULL,NULL,NULL,1503244533,1507348312,1,'Desi Wulandari','-','WSS Ungaran','0',0,NULL,'default.jpg',1,23),

(262,'202.67.46.366','Mukhlis_A','$2y$08$YXpAN7bRptms3zrwdikLU.9YVFu52qc7ALjpifRbWGLT5P/aMEkKO',NULL,'terserah@lah.com',NULL,NULL,NULL,NULL,1503244533,1506835203,1,'Mukhlis Anwar','-','WSS Tegal Kapten Soedibyo','082325029493',0,NULL,'default.jpg',1,24),

(263,'202.67.46.367','Esti_F','$2y$08$6R3brybhg08r3j3JmgHKIuDri8mPa.3O9yJIK0hyzWUcZ54cJi6Dm',NULL,'terserah@lah.com',NULL,NULL,NULL,NULL,1503244533,1507793793,1,'Esti Fadhilah','-','WSS Tegal Kapten Soedibyo','082325029450',0,NULL,'default.jpg',1,24),

(264,'202.67.46.368','Khaerul_A','$2y$08$YXpAN7bRptms3zrwdikLU.9YVFu52qc7ALjpifRbWGLT5P/aMEkKO',NULL,'terserah@lah.com',NULL,NULL,NULL,NULL,1503244533,1507793409,1,'Khaerul Anwar','-','WSS Tegal Kapten Soedibyo','082325029491',0,NULL,'default.jpg',1,24),

(265,'202.67.46.369','Asep_S','$2y$08$3vh66NXrWbI1YDWClLXvj.bd9rEfmIU4zXNVPqCE6s4JInCmvQD/u',NULL,'terserah@lah.com',NULL,NULL,NULL,NULL,1503244533,1507090990,1,'Asep Saepudin','-','WSS Tegal Kapten Soedibyo','082328979348',0,NULL,'default.jpg',1,24),

(266,'202.67.46.370','Hadi_Zuhri','$2y$08$YXpAN7bRptms3zrwdikLU.9YVFu52qc7ALjpifRbWGLT5P/aMEkKO',NULL,'terserah@lah.com',NULL,NULL,NULL,NULL,1503244533,NULL,1,'Hadi Ichwan Zuhri','-','WSS Pati Wahid Hasyim','082328979372',0,NULL,'default.jpg',1,26),

(267,'202.67.46.371','Saiful_M','$2y$08$YXpAN7bRptms3zrwdikLU.9YVFu52qc7ALjpifRbWGLT5P/aMEkKO',NULL,'terserah@lah.com',NULL,NULL,NULL,NULL,1503244533,1507719699,1,'Saiful Muslim','-','WSS Pati Wahid Hasyim','082225512038',0,NULL,'default.jpg',1,26),

(268,'202.67.46.372','Adi_P','$2y$08$YXpAN7bRptms3zrwdikLU.9YVFu52qc7ALjpifRbWGLT5P/aMEkKO',NULL,'terserah@lah.com',NULL,NULL,NULL,NULL,1503244533,1507772239,0,'Adi Pamungkas','-','WSS Pati Wahid Hasyim','082225512035',0,NULL,'default.jpg',1,26),

(269,'202.67.46.373','nendi','$2y$08$1lgIA/cg/QfjI0UGg11Q.OLzjDMUWEovdPkwXk//tuN5LLb2Gtu.W',NULL,'terserah@lah.com',NULL,NULL,NULL,NULL,1503244533,NULL,1,'Nendi Anata Wirana','-','WSS Pati Wahid Hasyim','082225512073',0,NULL,'default.jpg',1,26),

(270,'202.67.46.374','puji_P','$2y$08$YXpAN7bRptms3zrwdikLU.9YVFu52qc7ALjpifRbWGLT5P/aMEkKO',NULL,'terserah@lah.com',NULL,NULL,NULL,NULL,1503244533,NULL,1,'Puji Purriyati','-','WSS Pati Wahid Hasyim','0',0,NULL,'default.jpg',1,0),

(271,'202.67.46.375','Agung_S','$2y$08$cK4jybsCtCaNy4QA9WbR3e2Vw6zENjXEdBlREp77Sn2C9kHBY66aa',NULL,'terserah@lah.com',NULL,NULL,NULL,NULL,1503244533,1507213036,1,'Agung Susanto','-','WSS Sampangan','082225512039',0,NULL,'default.jpg',1,25),

(272,'202.67.46.376','Susi_A','$2y$08$YXpAN7bRptms3zrwdikLU.9YVFu52qc7ALjpifRbWGLT5P/aMEkKO',NULL,'terserah@lah.com',NULL,NULL,NULL,NULL,1503244533,1507612182,1,'Susi Ameliyasari','-','Ass. Keu Sompok','082225512043',0,NULL,'default.jpg',1,25),

(273,'202.67.46.377','David_W','$2y$08$tskFO.c2ZhsBX.rZ98bk7u57xJorzsK.q4FZ5Vci0KbqmycPVxkAi',NULL,'terserah@lah.com',NULL,NULL,NULL,NULL,1503244533,1507692731,1,'David Wijanarko','-','Wss Bintaro 2','082225512047',0,NULL,'default.jpg',1,25),

(274,'202.67.46.378','Nurjani','$2y$08$YXpAN7bRptms3zrwdikLU.9YVFu52qc7ALjpifRbWGLT5P/aMEkKO',NULL,'terserah@lah.com',NULL,NULL,NULL,NULL,1503244533,1507614371,1,'Rafi Nurjani','-','WSS Sampangan','082225512543',0,NULL,'default.jpg',1,25),

(275,'202.67.46.379','L_afiana','$2y$08$9d.VwNlLZNksZ8M9lRQ2heREc8ptcx7IMQ.24iGe7XOJps99eNsSq',NULL,'terserah@lah.com',NULL,NULL,NULL,NULL,1503244533,1507185179,1,'Lina Afiana','-','WSS Sampangan','083861942616',0,NULL,'default.jpg',1,25),

(276,'202.67.46.380','Indra_P','$2y$08$YXpAN7bRptms3zrwdikLU.9YVFu52qc7ALjpifRbWGLT5P/aMEkKO',NULL,'terserah@lah.com',NULL,NULL,NULL,NULL,1503244533,1507364155,1,'Indra Pratama','-','WSS Tembalang #2','082242613560',0,NULL,'default.jpg',1,54),

(277,'202.67.46.381','Hesti_R','$2y$08$YXpAN7bRptms3zrwdikLU.9YVFu52qc7ALjpifRbWGLT5P/aMEkKO',NULL,'terserah@lah.com',NULL,NULL,NULL,NULL,1503244533,1507774281,1,'Hesti Rustiana','-','WSS Tembalang #2','082242613564',0,NULL,'default.jpg',1,54),

(278,'202.67.46.382','Frigiawan','$2y$08$n5F5F35shKMTcFF329D4L.B0aPDSqHCU9cN5/l/7dnaFiXAr0LBCm',NULL,'terserah@lah.com',NULL,NULL,NULL,NULL,1503244533,1507767953,1,'Arif Frigiawan','-','WSS Tembalang #2','082242613565',0,NULL,'default.jpg',1,54),

(279,'202.67.46.383','A_Fauzan','$2y$08$isBxBJoPNSJZWY4wyU39xuYYeSRr8wZ7uZbH2XtLwXEvwOOri/MjW',NULL,'terserah@lah.com',NULL,NULL,NULL,NULL,1503244533,1507093587,1,'Ahmad Fauzan','-','WSS Sambiroto','082242613567',0,NULL,'default.jpg',1,54),

(280,'202.67.46.384','Sulamto','$2y$08$YXpAN7bRptms3zrwdikLU.9YVFu52qc7ALjpifRbWGLT5P/aMEkKO',NULL,'terserah@lah.com',NULL,NULL,NULL,NULL,1503244533,NULL,1,'Sulamto','-','WSS Prambanan','082325030112',0,NULL,'default.jpg',1,36),

(281,'202.67.46.385','ritma','$2y$08$YXpAN7bRptms3zrwdikLU.9YVFu52qc7ALjpifRbWGLT5P/aMEkKO',NULL,'terserah@lah.com',NULL,NULL,NULL,NULL,1503244533,1507261960,1,'Ritma Dzati','-','WSS Prambanan','082325030105',0,NULL,'default.jpg',1,36),

(282,'202.67.46.386','Jumardi','$2y$08$47QVN199RTOzbA53eCdrOOJemY8ZaJNrvdKpex3Gl3iGD.yOybZ5O',NULL,'terserah@lah.com',NULL,NULL,NULL,NULL,1503244533,1507425216,1,'Jumardi Setiawan','-','WSS Prambanan','082325030108',0,NULL,'default.jpg',1,36),

(283,'202.67.46.387','Farkhanudin','$2y$08$YXpAN7bRptms3zrwdikLU.9YVFu52qc7ALjpifRbWGLT5P/aMEkKO',NULL,'terserah@lah.com',NULL,NULL,NULL,NULL,1503244533,NULL,1,'Farkhanudin','-','WSS Prambanan','082328979410',0,NULL,'default.jpg',1,0),

(284,'202.67.46.388','Yunita_M','$2y$08$rFUFvBuo7T0PAa.wSew4aOnNIIVPLJpIhnbAPcg.NjWuB1FXSLkDS',NULL,'terserah@lah.com',NULL,NULL,NULL,NULL,1503244533,1507427444,1,'Yunita Mutiara Afifah','-','WSS Prambanan','0',0,NULL,'default.jpg',1,36),

(285,'202.67.46.389','Gilang_A','$2y$08$RFKeSNBSOPVth1NU0cNDt.r9iJMs.N1dz1XFQtBWWUzaN/2tNJrWW',NULL,'terserah@lah.com',NULL,NULL,NULL,NULL,1503244533,NULL,1,'Gilang Andi Pramana ','-','WSS Magelang (Mertoyudan)','082325029479',0,NULL,'default.jpg',1,0),

(286,'202.67.46.390','Heny_T','$2y$08$YXpAN7bRptms3zrwdikLU.9YVFu52qc7ALjpifRbWGLT5P/aMEkKO',NULL,'terserah@lah.com',NULL,NULL,NULL,NULL,1503244533,1507366599,1,'Heny Triastuti','-','WSS Magelang (Mertoyudan)','082325029920',0,NULL,'default.jpg',1,35),

(287,'202.67.46.391','Apriliyanto','$2y$08$WED8iKcgNGWT48r.MUVmzO4X2obWs1rNmb.VI7kguR.m1L2BtDc/.',NULL,'terserah@lah.com',NULL,NULL,NULL,NULL,1503244533,1507529135,0,'Apriliyanto','-','Staf P2O WSS Magelang','082325029927',0,NULL,'default.jpg',1,35),

(288,'202.67.46.392','Wahyu_W','$2y$08$coIgkgkbOp5bbxAiEql2uOPr8H5IVPrQiMDBrY/ArZFFy9sqT2a3C',NULL,'terserah@lah.com',NULL,NULL,NULL,NULL,1503244533,NULL,1,'Wahyu Wibowo','-','WSS Magelang (Mertoyudan)','082328979352',0,NULL,'default.jpg',1,0),

(289,'202.67.46.393','satrio_A','$2y$08$vLCHrdtc0/IIkSucz17znewr6TWpQWlWiVUJ86QFfZYMPuGiPZF7.',NULL,'terserah@lah.com',NULL,NULL,NULL,NULL,1503244533,NULL,1,'satrio andoko','-','WSS Magelang (Mertoyudan)','0',0,NULL,'default.jpg',1,0),

(290,'202.67.46.394','Zainul','$2y$08$YXpAN7bRptms3zrwdikLU.9YVFu52qc7ALjpifRbWGLT5P/aMEkKO',NULL,'terserah@lah.com',NULL,NULL,NULL,NULL,1503244533,1505835956,1,'Zainul arifin','-','WSS Surabaya Arjuna Raya','082325029459',0,NULL,'default.jpg',1,44),

(291,'202.67.46.395','n_azizah','$2y$08$YXpAN7bRptms3zrwdikLU.9YVFu52qc7ALjpifRbWGLT5P/aMEkKO',NULL,'terserah@lah.com',NULL,NULL,NULL,NULL,1503244533,1507635084,1,'Nur Azizah','-','WSS Surabaya Arjuna Raya','082325029452',0,NULL,'default.jpg',1,44),

(292,'202.67.46.396','M_Triyono','$2y$08$YXpAN7bRptms3zrwdikLU.9YVFu52qc7ALjpifRbWGLT5P/aMEkKO',NULL,'terserah@lah.com',NULL,NULL,NULL,NULL,1503244533,1507791194,1,'M. Triyono','-','WSS Surabaya Arjuna Raya','082325029458',0,NULL,'default.jpg',1,44),

(293,'202.67.46.397','Jefri_A','$2y$08$YXpAN7bRptms3zrwdikLU.9YVFu52qc7ALjpifRbWGLT5P/aMEkKO',NULL,'terserah@lah.com',NULL,NULL,NULL,NULL,1503244533,1507783486,1,'Jefri Ardianto','-','WSS Surabaya Arjuna Raya','082328979357',0,NULL,'default.jpg',1,44),

(294,'202.67.46.398','nurotul','$2y$08$YXpAN7bRptms3zrwdikLU.9YVFu52qc7ALjpifRbWGLT5P/aMEkKO',NULL,'terserah@lah.com',NULL,NULL,NULL,NULL,1503244533,1507789492,1,'Nurotul Hidayah','-','WSS Surabaya Arjuna Raya','085606481986',0,NULL,'default.jpg',1,44),

(295,'202.67.46.399','n_huda','$2y$08$5s3.4EnaBve8Z6QoKJhT4OtA/V.YO1CyUiUQpnliAHkzFM2vL6q6C',NULL,'terserah@lah.com',NULL,NULL,NULL,NULL,1503244533,1506582845,1,'Nur Huda','-','WSS Surabaya Mulyorejo','082242065700',0,NULL,'default.jpg',1,49),

(296,'202.67.46.400','Wiwik_P','$2y$08$YXpAN7bRptms3zrwdikLU.9YVFu52qc7ALjpifRbWGLT5P/aMEkKO',NULL,'terserah@lah.com',NULL,NULL,NULL,NULL,1503244533,1507789107,1,'Wiwik Purwanti','-','WSS Surabaya Mulyorejo','082242065699',0,NULL,'default.jpg',1,49),

(297,'202.67.46.401','W_Eka','$2y$08$cxWzyDFipOBJLTzQdMMeR.gbIoCYB1Uv03LfwTg6WcUeA8ILXnxR.',NULL,'terserah@lah.com',NULL,NULL,NULL,NULL,1503244533,1507774473,1,'Wahyu Eka Setyawan','-','WSS Surabaya Mulyorejo','082242065676',0,NULL,'default.jpg',1,49),

(298,'202.67.46.402','A_Faizal','$2y$08$YXpAN7bRptms3zrwdikLU.9YVFu52qc7ALjpifRbWGLT5P/aMEkKO',NULL,'terserah@lah.com',NULL,NULL,NULL,NULL,1503244533,1507781830,1,'Ahmad Faizal','-','WSS Surabaya Mulyorejo','082242065696',0,NULL,'default.jpg',1,45),

(299,'202.67.46.403','Wulansari','$2y$08$YXpAN7bRptms3zrwdikLU.9YVFu52qc7ALjpifRbWGLT5P/aMEkKO',NULL,'terserah@lah.com',NULL,NULL,NULL,NULL,1503244533,1507708151,1,'Wulansari','-','WSS Surabaya Mulyorejo','085708041730',0,NULL,'default.jpg',1,49),

(300,'202.67.46.404','A_Aziz','$2y$08$YXpAN7bRptms3zrwdikLU.9YVFu52qc7ALjpifRbWGLT5P/aMEkKO',NULL,'terserah@lah.com',NULL,NULL,NULL,NULL,1503244533,1506777127,1,'Abdul Aziz','-','WSS Kediri PK Bangsa','082325030098',0,NULL,'default.jpg',1,43),

(301,'202.67.46.405','Sri_RM','$2y$08$YXpAN7bRptms3zrwdikLU.9YVFu52qc7ALjpifRbWGLT5P/aMEkKO',NULL,'terserah@lah.com',NULL,NULL,NULL,NULL,1503244533,1507444658,1,'Sri Rahayu Mardaningsih','-','WSS Kediri PK Bangsa','082325030104',0,NULL,'default.jpg',1,43),

(302,'202.67.46.406','A_Rizal','$2y$08$YXpAN7bRptms3zrwdikLU.9YVFu52qc7ALjpifRbWGLT5P/aMEkKO',NULL,'terserah@lah.com',NULL,NULL,NULL,NULL,1503244533,1507444116,1,'Ahmad Rizal Sholihin','-','WSS Kediri PK Bangsa','082325030096',0,NULL,'default.jpg',1,43),

(303,'202.67.46.407','Paksy','$2y$08$YXpAN7bRptms3zrwdikLU.9YVFu52qc7ALjpifRbWGLT5P/aMEkKO',NULL,'terserah@lah.com',NULL,NULL,NULL,NULL,1503244533,1507006766,1,'Andhika Chandra Buana Paksy','-','WSS Kediri PK Bangsa','082328979480',0,NULL,'default.jpg',1,43),

(304,'202.67.46.408','Friska','$2y$08$N5dkp46HkzpUZ3ujGSQ5aOFCyryNJGVW7OVCmprwvbS5IOwNcEs7S',NULL,'terserah@lah.com',NULL,NULL,NULL,NULL,1503244533,NULL,1,'Friska Cindy Claudia Anggita Putri','-','WSS Mulyo rejo','085731847636',0,NULL,'default.jpg',1,0),

(305,'202.67.46.409','Dewi_Y','$2y$08$YXpAN7bRptms3zrwdikLU.9YVFu52qc7ALjpifRbWGLT5P/aMEkKO',NULL,'terserah@lah.com',NULL,NULL,NULL,NULL,1503244533,NULL,1,'Dewi Yuliana','-','WSS Kediri PK Bangsa','0',0,NULL,'default.jpg',1,0),

(306,'202.67.46.410','Tri_AP','$2y$08$YXpAN7bRptms3zrwdikLU.9YVFu52qc7ALjpifRbWGLT5P/aMEkKO',NULL,'terserah@lah.com',NULL,NULL,NULL,NULL,1503244533,1506772331,1,'Tri Adi Prasetya','-','WSS Malang Sengkaling','082325029472',0,NULL,'default.jpg',1,45),

(307,'202.67.46.411','Faidatul','$2y$08$zx5JFG6aCd2/c.dg3i9BKuioveLEPOySkEXqTvYvDeOK8RaTnZrBe',NULL,'terserah@lah.com',NULL,NULL,NULL,NULL,1503244533,1507782031,1,'Faidatul Hazilla','-','WSS Malang Sengkaling','082325029467',0,NULL,'default.jpg',1,45),

(308,'202.67.46.412','rojikin','$2y$08$YXpAN7bRptms3zrwdikLU.9YVFu52qc7ALjpifRbWGLT5P/aMEkKO',NULL,'terserah@lah.com',NULL,NULL,NULL,NULL,1503244533,1506839103,1,'Muhammad Rojikin','-','WSS Malang Sengkaling','082320623130',1,NULL,'default.jpg',1,45),

(309,'202.67.46.413','Khoirul_A','$2y$08$x.pggVmM4w8zXf6mUA/18.2Dz0OY.VJ.mRJzffernGMEskbuH3sjS',NULL,'terserah@lah.com',NULL,NULL,NULL,NULL,1503244533,1507714135,1,'Khoirul Anwar','-','WSS Malang Sengkaling','082328979411',0,NULL,'default.jpg',1,45),

(310,'202.67.46.414','M_Ulfa','$2y$08$tdOo6RS4UEuWtUaOiCU0AuGeWXkxbux53VbhknLvnUeY6f8.NktWy',NULL,'terserah@lah.com',NULL,NULL,NULL,NULL,1503244533,NULL,1,'Maria Ulfa','-','WSS Malang Sengkaling','089506722860',0,NULL,'default.jpg',1,45),

(311,'202.67.46.415','Ujang_S','$2y$08$YXpAN7bRptms3zrwdikLU.9YVFu52qc7ALjpifRbWGLT5P/aMEkKO',NULL,'terserah@lah.com',NULL,NULL,NULL,NULL,1503244533,1506780938,1,'Ujang Suherman','-','WSS Malang Ciliwung','082325029478',0,NULL,'default.jpg',1,46),

(312,'202.67.46.416','risna','$2y$08$YXpAN7bRptms3zrwdikLU.9YVFu52qc7ALjpifRbWGLT5P/aMEkKO',NULL,'terserah@lah.com',NULL,NULL,NULL,NULL,1503244533,1507781154,1,'Risna Devi mualiza','-','WSS Malang Ciliwung','082325029473',0,NULL,'default.jpg',1,46),

(313,'202.67.46.417','Lukhi','$2y$08$3c4A2UNGKKjfsiiIZvzC1uSb7kcrXsmJKyhipo/KtAyY9sVI02xoy',NULL,'terserah@lah.com',NULL,NULL,NULL,NULL,1503244533,1507611496,1,'Lukhi Nuhimbrianto','-','WSS Malang Ciliwung','082325029476',0,NULL,'default.jpg',1,46),

(314,'202.67.46.418','Fathur','$2y$08$YXpAN7bRptms3zrwdikLU.9YVFu52qc7ALjpifRbWGLT5P/aMEkKO',NULL,'terserah@lah.com',NULL,NULL,NULL,NULL,1503244533,1507734345,1,'Moch. Arif Fathur Rozi','-','WSS Malang Ciliwung','082328979403',0,NULL,'default.jpg',1,46),

(315,'202.67.46.419','Mega_Y','$2y$08$YXpAN7bRptms3zrwdikLU.9YVFu52qc7ALjpifRbWGLT5P/aMEkKO',NULL,'terserah@lah.com',NULL,NULL,NULL,NULL,1503244533,1507700806,1,'Mega Yunianto','-','WSS Malang Ciliwung','089681013854',0,NULL,'default.jpg',1,46),

(316,'202.67.46.420','Ariyanto','$2y$08$mvZHdztahwR9WZGs4i/bzO9kWuziZ0sixe5hShQ5L36iBqn6vWiVm',NULL,'terserah@lah.com',NULL,NULL,NULL,NULL,1503244533,NULL,1,'Ariyanto','-','WSS Madiun','082325029980',0,NULL,'default.jpg',1,42),

(317,'202.67.46.421','Silvia_LES','$2y$08$5e76HLq5/NCI3qYCybBPjei/tkKhtcwPjnHv3bJSI3vXMqhQ8PmFC',NULL,'terserah@lah.com',NULL,NULL,NULL,NULL,1503244533,1507458188,1,'Silvia Linda Eka Sopha','-','WSS Madiun','082300053778',0,NULL,'default.jpg',1,42),

(318,'202.67.46.422','Hongky','$2y$08$XFiEUgYTiWEoc9qG27cgD.U5oLFKWtFmLh9EyUJXvKEayqM.MY.Za',NULL,'terserah@lah.com',NULL,NULL,NULL,NULL,1503244533,1507616419,1,'Hongky Septian','-','WSS Madiun','082325029940',0,NULL,'default.jpg',1,42),

(319,'202.67.46.423','Komari','$2y$08$YXpAN7bRptms3zrwdikLU.9YVFu52qc7ALjpifRbWGLT5P/aMEkKO',NULL,'terserah@lah.com',NULL,NULL,NULL,NULL,1503244533,1507789439,1,'Komari','-','WSS Madiun','082328979468',0,NULL,'default.jpg',1,42),

(320,'202.67.46.424','Tika_R','$2y$08$YXpAN7bRptms3zrwdikLU.9YVFu52qc7ALjpifRbWGLT5P/aMEkKO',NULL,'terserah@lah.com',NULL,NULL,NULL,NULL,1503244533,1507437552,1,'Tika Rahmawati','-','WSS Madiun','085713000233',0,NULL,'default.jpg',1,42),

(321,'202.67.46.425','n_arif','$2y$08$YXpAN7bRptms3zrwdikLU.9YVFu52qc7ALjpifRbWGLT5P/aMEkKO',NULL,'terserah@lah.com',NULL,NULL,NULL,NULL,1503244533,NULL,1,'M. Nur Arif','-','WSS Jember','082226915302',0,NULL,'default.jpg',1,0),

(322,'202.67.46.427','Djatmiko','$2y$08$YXpAN7bRptms3zrwdikLU.9YVFu52qc7ALjpifRbWGLT5P/aMEkKO',NULL,'terserah@lah.com',NULL,NULL,NULL,NULL,1503244533,NULL,1,'Budi Djatmiko','-','WSS Jember','082226992110',0,NULL,'default.jpg',1,0),

(323,'202.67.46.428','Fahrul','$2y$08$YXpAN7bRptms3zrwdikLU.9YVFu52qc7ALjpifRbWGLT5P/aMEkKO',NULL,'terserah@lah.com',NULL,NULL,NULL,NULL,1503244533,1507609666,1,'Febrian Fahrul Ar Rozi','-','WSS Jember','082227050012',0,NULL,'default.jpg',1,50),

(324,'202.67.46.429','A_Maulana','$2y$08$9ZmPkjqDxtkMfRBQjjrtdO64W2CTa3VMiH2dR5fyJIR5UzLVxOiKm',NULL,'terserah@lah.com',NULL,NULL,NULL,NULL,1503244533,1507790019,1,'Ana Maulana','-','WSS Jember','082226992106',0,NULL,'default.jpg',1,50),

(325,'202.67.46.430','Herlambang','$2y$08$YXpAN7bRptms3zrwdikLU.9YVFu52qc7ALjpifRbWGLT5P/aMEkKO',NULL,'terserah@lah.com',NULL,NULL,NULL,NULL,1503244533,NULL,1,'Herlambang Pamungkas Sakti','-','WSS Bali Batu Bulan','082325029426',0,NULL,'default.jpg',1,0),

(326,'202.67.46.431','Anjrah','$2y$08$YkXKOoYqSsftiWJpIb3qTOcJMs/GRQYl6uwOp0IpvhXQruXQJioe2',NULL,'terserah@lah.com',NULL,NULL,NULL,NULL,1503244533,1507121685,1,'Anjrah Putri Sekar Pamularsih','-','WSS Bali Batu Bulan','082325029413',0,NULL,'default.jpg',1,47),

(327,'202.67.46.432','Teguh_P','$2y$08$Xa0O0x7oGHw211txwA8t/.tcPSwyNeF36.FdVKoH7OVfZCfSOHlGi',NULL,'terserah@lah.com',NULL,NULL,NULL,NULL,1503244533,NULL,1,'Teguh Prayitno','-','WSS Bali Batu Bulan','082325029425',0,NULL,'default.jpg',1,47),

(328,'202.67.46.433','F_Iriyanto','$2y$08$UA9.UVFhuZxsLPb5sRxOn.oVtE1Jmg/Xh1yJKFAQ1oQQmrEX3wlPS',NULL,'terserah@lah.com',NULL,NULL,NULL,NULL,1503244533,1507181400,1,'Febri Iriyanto','-','WSS Bali Batu Bulan','082328979478',0,NULL,'default.jpg',1,47),

(329,'202.67.46.434','Alif_BA','$2y$08$.9oOrnhV6s/cPpRot3ICOujx8DtUeNDz8tKckJZHr0ENn.UDy7n9y',NULL,'terserah@lah.com',NULL,NULL,NULL,NULL,1503244533,1507173503,1,'Alif Bagus Anggara','-','WSS Bali Tukad Barito','082325029441',0,NULL,'default.jpg',1,48),

(330,'202.67.46.435','Leni_SFL','$2y$08$qSgE.GQH9nRsQ1hnjxzif.Qo0PD5EFsJVqeX0LL8WKFHuRNb9IrYa',NULL,'terserah@lah.com',NULL,NULL,NULL,NULL,1503244533,1507785684,1,'Leni Septi Faridhatul Lia','-','WSS Bali Tukad Barito','082325029427',0,NULL,'default.jpg',1,48),

(331,'202.67.46.436','Luky','$2y$08$YXpAN7bRptms3zrwdikLU.9YVFu52qc7ALjpifRbWGLT5P/aMEkKO',NULL,'terserah@lah.com',NULL,NULL,NULL,NULL,1503244533,1507765489,1,'Luky Mardani Herlambang','-','WSS Bali Tukad Barito','082325029432',0,NULL,'default.jpg',1,48),

(332,'202.67.46.437','Hasanudin','$2y$08$YXpAN7bRptms3zrwdikLU.9YVFu52qc7ALjpifRbWGLT5P/aMEkKO',NULL,'terserah@lah.com',NULL,NULL,NULL,NULL,1503244533,1507792719,1,'Muhammad hasanudin','-','WSS Bali Tukad Barito','082328979354',0,NULL,'default.jpg',1,48),

(333,'36.81.4.128','kiki','$2y$08$YXpAN7bRptms3zrwdikLU.9YVFu52qc7ALjpifRbWGLT5P/aMEkKO',NULL,'tes@tes.com',NULL,NULL,NULL,NULL,1268889823,NULL,1,'Kiki Setiawan','-','Area Solo','082325031071',1,NULL,'default.jpg',1,0),

(334,'36.81.4.128','abdul','$2y$08$YXpAN7bRptms3zrwdikLU.9YVFu52qc7ALjpifRbWGLT5P/aMEkKO',NULL,'tes@tes.com',NULL,NULL,NULL,NULL,1268889823,NULL,1,'Abdul Latief','-','Area Solo','082233271099',0,NULL,'default.jpg',1,0),

(335,'36.81.4.128','ispurwanto','$2y$08$hVrCDa5R5tQuS9ExlV8aReg6iC14iu6iD4pPKCOI7kQIibFrAqTte',NULL,'tes@tes.com',NULL,NULL,NULL,NULL,1268889823,1506840821,1,'Ispurwanto','-','Area Solo','082300053847',0,NULL,'default.jpg',1,56),

(336,'36.81.4.128','parna','$2y$08$YXpAN7bRptms3zrwdikLU.9YVFu52qc7ALjpifRbWGLT5P/aMEkKO',NULL,'tes@tes.com',NULL,NULL,NULL,NULL,1268889823,1507702527,1,'Parna','-','Area Solo','081575063861',0,NULL,'default.jpg',1,56),

(339,'118.96.156.183','novita_Tes','$2y$08$sc8tvfeoT45lOhN80D3NTu/Zx7b5Z3cluCnOq5/c0v.djd7uh4lwS',NULL,'novitasari2910@gmail.com',NULL,NULL,NULL,NULL,1505800312,1506438661,1,'Novita Sari','-','SS PUSAT','-',0,NULL,'default.jpg',1,52),

(340,'118.96.156.183','yuni_a','$2y$08$BPNdoPAUTAUYHlhL0UStLupRDKOjkG2ZBF7hoHxjCSwe1YSPjsEhi',NULL,'ss@ss.com',NULL,NULL,NULL,NULL,1505804443,NULL,1,'Yuni ','anitawati','waroeng ss','6285326834944',0,NULL,'default.jpg',1,0),

(341,'118.96.156.183','hendi','$2y$08$nAAd.DoHDg1PBJbGAAdJh.XbX9a5bxbFgRNKZl.B.i0ksfAaMK0m.',NULL,'hendi@hen.com',NULL,NULL,NULL,NULL,1506138591,1506146722,1,'Kushendi','Winarto','PUSAT','-',0,NULL,'default.jpg',1,34),

(342,'36.81.88.136','seruni','$2y$08$dA05NzlJqkAyOBh4/VjZ2OX5aU5kefWoAQtHGyfzdwLBig1vRrUAm',NULL,'seruni@rembulan.com',NULL,NULL,NULL,NULL,1506156580,1515826465,1,'Yohana Seruni ','Rembulan','AREA MALANG','082325029911',1,NULL,'default.jpg',1,46),

(343,'36.81.88.136','sabdo','$2y$08$VeuYkGmjpQ3SWvChD/38FOtUCzSByWG.OrFpKZg9qJE8.rt5AMNqm',NULL,'sabdo@tomo.com',NULL,NULL,NULL,NULL,1506156643,1518235435,1,'Sabdo Tomo','Wiradad','AREA PURWOKERTO','-',2,NULL,'default.jpg',1,36),

(344,'36.81.88.136','sutarto','$2y$08$puftanfFvjRt88hglJuqGuDphBvH.EWn6zTm8o4QTJ8uvriCB6KVi',NULL,'sutarto@tarto.com',NULL,NULL,NULL,NULL,1506157332,NULL,1,'Sutarto','-','AREA JABODETABEK','081212045161',1,NULL,'default.jpg',1,0),

(345,'36.81.88.136','hanif','$2y$08$oVCpLZiW31bY.whEZaWLjedf3juutBxYJrxdR4FYhEPpb4C5iK0SO',NULL,'hanif@han.com',NULL,NULL,NULL,NULL,1506157465,1515414771,1,'Muhammad Hanif','hanif','AREA JABODETABEK','081212045268',2,NULL,'default.jpg',1,5),

(346,'36.81.88.136','bimo','$2y$08$EhfHY9ST3RN3mxYND8k1yud1WeIvLEXWmoAn3O9VdGbSbUPqycFJS',NULL,'ndaru.nagata777@gmail.com',NULL,NULL,NULL,'JK3qpPV.sNFou7FshQ9cuO',1506157769,1516457968,1,'Raden Bimo','Ndaru Kusuma','AREA MALANG','082300053839',1,NULL,'default.jpg',1,45),

(347,'36.81.88.136','devianto','$2y$08$8q4ucATKAvSjhq2vq.DDPOy767fw.wCuarpTr5wADmYhhO/ZhDu2S',NULL,'deviantorenaldi@gmail.com',NULL,NULL,NULL,NULL,1506157828,NULL,1,'Devianto ','Renaldy','AREA MALANG','082138031525',0,NULL,'default.jpg',1,0),

(348,'36.81.88.136','sahvira','$2y$08$/lUvC523uMoFTZd85zhMfO91xaEbl0zvF/ebTTtCZo.x6bZQMIUga',NULL,'kenshavira@gmail.com',NULL,NULL,NULL,NULL,1506157887,NULL,1,'Ken Sahvira ','Parasayu','AREA MALANG','085234001994',1,NULL,'default.jpg',1,45),

(349,'36.81.88.136','marsa','$2y$08$q4wt7NCcvI0H/BPPlhBZGeOhZ6E/a7b2rfyLbdah/vgQCO2p5gvN.',NULL,'marsalita_setyani@yahoo.co.id',NULL,NULL,NULL,NULL,1506157958,1507691263,1,'Marsalita Setyani','Marsa','AREA MALANG','082227048625',0,NULL,'default.jpg',1,43),

(350,'36.81.88.136','taufiq','$2y$08$kLQDOyXJ858zqHG.krklIe5U61gGH2q15WaPUrGV80bnE4b0kQLq6',NULL,'c.taufiq14@gmail.com',NULL,NULL,NULL,NULL,1506158064,NULL,1,'Chusnul Taufiq','Taufiq','AREA MALANG','081233436563',0,NULL,'default.jpg',1,0),

(351,'36.81.88.136','khomsiah','$2y$08$vdmxcA.UlxuPEwg3z037He/g3m17y08U2JHVPaSohoX1jhIbwvZOi',NULL,'ss@ss.com',NULL,NULL,NULL,NULL,1506249078,1507790104,1,'Nur Jayanti','Khomsiah','waroeng ss','08568202042',0,NULL,'default.jpg',1,56),

(352,'36.73.121.200','ratman','$2y$08$FTFEnSzEjRFveGqUgavnse5pE.fJw6gWUFVn3iD3qHArH8xYwPMgm',NULL,'ratman@surat.com',NULL,NULL,NULL,NULL,1506493515,1507791461,1,'Suratman','-','SS PALAGAN','087834193427',0,NULL,'default.jpg',1,1),

(353,'36.78.54.94','allan','$2y$08$CRcML.H1xGiKuf0euwU4AuSKN4ym/ZN4TdrCShH/REWEolWvjAuPu',NULL,'alan@kosong.com',NULL,NULL,NULL,NULL,1506504267,1516507226,1,'Allan Wihartono','-','Kaur spiritualitas Pusat','085862049343',0,NULL,'default.jpg',1,36),

(354,'36.78.54.94','jonitri','$2y$08$/Fclsk7WN7EsxyLVLuOsTuUUzPAPgD6K.Qwc6YkHfLvWO7G2AW0uS',NULL,'joni@jon.com',NULL,NULL,NULL,NULL,1506570378,NULL,1,'Joni Triono joni','-','SS Bekasi','-',0,NULL,'default.jpg',1,0),

(355,'36.78.54.94','ditanovi','$2y$08$2l6iKu4MF9LDv8W5QNppqOHdM5sFDpEmv.hTq1PSl0N16OrxW7tie',NULL,'dita@dita.com',NULL,NULL,NULL,NULL,1506762275,1518235376,1,'dita noviana','-','waroeng ss','6285726163898',2,NULL,'default.jpg',1,36),

(356,'36.73.61.81','flow','$2y$08$cA/YImuOhFYeSJ3uWzT9QuUA2PqxPfCzF7S2EzGMoWSv4YQLZEnmO',NULL,'flow.priskilla@gmail.com',NULL,NULL,NULL,NULL,1506911598,NULL,1,'Florentina Dewani','-','-','081915043627',0,NULL,'default.jpg',1,32),

(357,'0','andriwulansari','$2y$08$fjxcVdq.s3Q/EicBYTWSnOXs5ZahmmSMW8P4pJw/7jq0uO0YfVeja',NULL,'kosong@pedasabis.com',NULL,NULL,NULL,NULL,1506911598,1518155304,1,'Andri Wulansari','-','Kasi Keuangan','082327324252',1,NULL,'default.jpg',1,0),

(358,'0','ismiati','$2y$08$iP27iv4vWpMxmYFhO5s2z.qDHySohpEpA.lBkqHTIxWLzboJUC7Qe',NULL,'gakada@pedasabis.com',NULL,NULL,NULL,NULL,1506911598,1507361620,1,'Ismiati Khoiriah','-','Ass Produksi SS Tukat','082325029430',0,NULL,'default.jpg',1,48),

(359,'0','petrus','$2y$08$4uqQF6h2jPktfjfnL4Xxhe85G7fZ5fRGHPJFWC9SZBvf8g91gPYrK',NULL,'gakada@pedasabis.com',NULL,NULL,NULL,NULL,1506911598,1507781450,1,'Petrus Neno','-','Wak Ass Produksi SS Tukat','081238929849',0,NULL,'default.jpg',1,48),

(360,'0','nuraini','$2y$08$PL3wEmhmBQNLcvem/YfzAebUwO2XZ79Ajov3.txK1RTDJrxQ9gIke',NULL,'kosong@pedasabis.com',NULL,NULL,NULL,NULL,0,1516514916,1,'Nuraini Firmandari','-','Kaur SDM','082241300948',0,NULL,'default.jpg',1,0),

(361,'0','wahyu_e','$2y$08$b8L0DfgBZ0Bffiqkk3wBpOjQV1jy3.mEqOZ0ryuafM7hbH.6F8ntq',NULL,'kosong@pedasabis.com',NULL,NULL,NULL,NULL,0,1515652621,1,'Wahyu Eka R','-','Kasi Produksi','082325029495',2,NULL,'default.jpg',1,0),

(362,'0','putugita','$2y$08$dakqB3W9Vi4nDZMPivcKTOYIRhpwUMTthsE8nW0p/27JbU/5iN9BW',NULL,'gakada@pedasabis.com',NULL,NULL,NULL,NULL,1506911598,1507790823,1,'Ni Putu Gitayani','-','Ass Ops SS Tukat','082241300949',0,NULL,'default.jpg',1,48),

(363,'0','madeayu','$2y$08$EkHztpbsKkmxta1ex47n5.y7m6BmhwYwcCfyHqr.ibSgPd6qJDkyS',NULL,'gakada@pedasabis.com',NULL,NULL,NULL,NULL,1506911598,NULL,1,'Ni Made Ayu','-','Patroli Pedas SS Tukat','085739248270',0,NULL,'default.jpg',1,0),

(364,'0','wahyu_h','$2y$08$EkHztpbsKkmxta1ex47n5.y7m6BmhwYwcCfyHqr.ibSgPd6qJDkyS',NULL,'kosong@pedasabis.com',NULL,NULL,NULL,NULL,1506911598,NULL,1,'M. Wahyu H','-','Tim/Kasi SDM/Kasi P20','082242065668',0,NULL,'default.jpg',1,0),

(365,'0','rusito','$2y$08$Kx1ghsr20SevyvcUwmjxk.0v8N0iY9RonZWto0C6ILCZo.RQ/psje',NULL,'kosong@pedasabis.com',NULL,NULL,NULL,NULL,0,1515907039,1,'Rusito','-','Kasi PAPG','082325029406',1,NULL,'default.jpg',1,0),

(366,'180.254.84.71','riski','$2y$08$LxJUWcJ3AohX7H3979v13.6c/ENuw1kyET9StCEZoRmTuQ7/J3S72',NULL,'gakada@pedasabis.com',NULL,NULL,NULL,NULL,1507097664,1507121817,1,'Riski Windi Saputro','-','WAPG Prambanan','0',0,NULL,'default.jpg',1,36),

(367,'36.84.240.51','Sofiana','$2y$08$.NjsggFs.d28ixiPDUAT2eD8AChT6d2QRCK2QsooGRbcYS1tdc1R6',NULL,'sofiana@pedasabis.com',NULL,NULL,NULL,NULL,1507109707,1507719387,1,'Sofiana','Hutabarat','SS Kisamaun','083870965761',0,NULL,'default.jpg',1,5),

(368,'36.84.240.51','Yogi','$2y$08$12nNxfMsuA9CtsxEslHfAOkp/t6g3i3bwZXjL0t/QvQCrQjRy0/Se',NULL,'yogi@pedasabis.com',NULL,NULL,NULL,NULL,1507109784,1507691410,1,'Yogi','Yogi','SS Kisamaun','081212042374',0,NULL,'default.jpg',1,5),

(369,'36.84.240.51','Geger','$2y$08$2XTBH.hsgInVyJNpmFxjHe.dJGSCXJOh7DXph/gjW1yCEbIJRHI8i',NULL,'geger@pedasabis.com',NULL,NULL,NULL,NULL,1507109893,1507735601,1,'Geger Agung','Pamuji','SS Kisamaun','081294964759',0,NULL,'default.jpg',1,5),

(370,'36.73.54.159','mahdeputri','$2y$08$o4l/wxYVealE4BwVwkgFmelSOzBY1YLKVn11IIzn/6MhPGIE7miKa',NULL,'ss@ss.com',NULL,NULL,NULL,NULL,1507188895,1518254003,1,'Mahdeanty','Putri','waroeng ss','082325029399',2,NULL,'default.jpg',1,0),

(371,'36.73.54.159','masyudi','$2y$08$eVyCBnGZ8zgsFXFOPveuV.tnsynN3VHApWVIdPeEmSlCEmFLFCclO',NULL,'ss@ss.com',NULL,NULL,NULL,NULL,1507252751,1507787014,1,'Masyudi','-','waroeng ss','082227050012',0,NULL,'default.jpg',1,50),

(372,'36.73.54.159','ulum','$2y$08$yKe2s/cluG2lKr4Lhvgi8OWfc8Z8N9ZpqAosOUlhHZXxqiGwKoil2',NULL,'ss@ss.com',NULL,NULL,NULL,NULL,1507254534,NULL,1,'ulum','-','waroeng ss','123',1,NULL,'default.jpg',1,49),

(373,'36.73.54.159','renal','$2y$08$Ab42VRffo282PXMyb0xR6OEoI6OpQYmgsDDhbqmvu9.ygfduXaGCC',NULL,'ss@ss.com',NULL,NULL,NULL,NULL,1507254579,1515657491,1,'Renal','-','waroeng ss','123',1,NULL,'default.jpg',1,44),

(374,'180.244.61.66','nunung','$2y$08$fb/PHeuv1VwOB/bfkrLYAuN8NRRPpJOqmkiRVycmLMdu6DuXPlt96',NULL,'nun@nung.com',NULL,NULL,NULL,NULL,1507255392,1507699843,1,'Nunung','Nurmala','SS BEKASI','-',0,NULL,'default.jpg',1,51),

(375,'180.244.61.66','mukodam','$2y$08$L4vV1038HUTovlWmTMDJEewMF6vOfezqp2bAk56DXFUOe1kDhLy3m',NULL,'muko@dam.com',NULL,NULL,NULL,NULL,1507255841,1507791207,1,'Sifyanudin Mukodam','Mukodam','SS BEKASI','-',0,NULL,'default.jpg',1,51),

(376,'36.73.54.159','abdul_jafar','$2y$08$0wBOkcqLRmGhh2wkV6/d6eAHWaOSWU/bLh0EqOxw6B5gnjj2ANIPK',NULL,'ss@ss.com',NULL,NULL,NULL,NULL,1507256589,NULL,1,'abdul jafar','sodiq','waroeng ss','081212040384',0,NULL,'default.jpg',1,0),

(377,'36.73.54.159','selwa_f','$2y$08$Cq/oVwNjCPHyMJXU2h/93up9G.lqF45l5s7cJHOB/ulCF9vTxHhea',NULL,'ss@ss.com',NULL,NULL,NULL,NULL,1507259102,NULL,1,'Selwa Fathiah ','A','waroeng ss','081212041357',0,NULL,'default.jpg',1,0),

(378,'36.73.54.159','dedi_s','$2y$08$k/kjDXSIY1TFph42Bdp4Aez/Zq/bleAcEUqEwTYFBd3XSk4ObrTUy',NULL,'ss@ss.com',NULL,NULL,NULL,NULL,1507259413,NULL,1,'Dedi','Saputra','waroeng ss','081212041308',0,NULL,'default.jpg',1,0),

(379,'36.73.54.159','muh_alwi','$2y$08$BfWPJpkdcC2OMEGBN7Gn6.grXcXwxlSNsj8wDotQrLlo5tAdJG796',NULL,'ss@ss.com',NULL,NULL,NULL,NULL,1507259658,NULL,1,'Muhammad ','Alwi','waroeng ss','081212041138',0,NULL,'default.jpg',1,0),

(380,'36.73.54.159','saep_ewa','$2y$08$Kt62rt3A2pwKKLsz1MSIsOqLASY5Alo5KJc9/9i81qMmlfSw/blZW',NULL,'ss@ss.com',NULL,NULL,NULL,NULL,1507259852,NULL,1,'Saep','Ewahyudin','waroeng ss','081212043024',0,NULL,'default.jpg',1,0),

(381,'36.73.54.159','wiwin_lestari','$2y$08$tZ2NV/wDlEEEp0khuo32W.yCYIeC1n8U5yOBR8DBdtkSCeXaGmYYO',NULL,'ss@ss.com',NULL,NULL,NULL,NULL,1507259927,NULL,1,'Wiwin','Lestari','waroeng ss','081212045347',0,NULL,'default.jpg',1,0),

(382,'36.73.54.159','rudi_a','$2y$08$SUmRiuDs2BosiNgJnZz89ek8NRYxGYIEac0oF4RwZHWdi1XIZmDNK',NULL,'ss@ss.com',NULL,NULL,NULL,NULL,1507260028,NULL,1,'Rudi','Andani','waroeng ss','081212042183',0,NULL,'default.jpg',1,0),

(383,'36.73.54.159','yonida_v','$2y$08$d8N9JpSUf5ECExB.8vQodOSIr3zK.v9C/JVW1SJZf66P3vAjwn9LC',NULL,'ss@ss.com',NULL,NULL,NULL,NULL,1507260322,1507773548,1,'Yonida','Valianti','waroeng ss','081212041248',0,NULL,'default.jpg',1,0),

(384,'36.73.54.159','genduth','$2y$08$mC1afRSTBDzBAYuvkvc2SezzOcWZhij1QKo/JFn.QVbRRXH6xIe9i',NULL,'ss@ss.com',NULL,NULL,NULL,NULL,1507260322,1507428268,1,'Andri Setianti\r\n','-','Kaur Kosting Semarang','082225511966\r\n',0,NULL,'default.jpg',1,21),

(385,'36.73.54.159','vera','$2y$08$fAWfBjIBhi2dRTpVCd/5..Rx2uuFIEOF6.ZIL6l5axq2iqa3WndvC',NULL,'ss@ss.com',NULL,NULL,NULL,NULL,1507260322,NULL,1,'Vera Puspitasari Septiyaningsih\r\n','-','Kaur General Semarang','082225959867\r\n',0,NULL,'default.jpg',1,0),

(386,'36.73.54.159','winda','$2y$08$lDgeMQ8wcbRQ5XaY3mobX.tXCPhrPXSwbSfpC.nFIQsGtTi3QUwwi',NULL,'ss@ss.com',NULL,NULL,NULL,NULL,1507260322,NULL,1,'Winda Kurnia Fikri Ningrum\r\n','-','Staff Kosting Semarang','082328979451\r\n',0,NULL,'default.jpg',1,0),

(387,'36.73.54.159','ratna','$2y$08$m93OaY/fPoZKqfm5r4mkZewm4Hx0q2ayR173/vg4wmvEonK0qY2FG',NULL,'ss@ss.com',NULL,NULL,NULL,NULL,1507260322,1516268428,1,'Ratna Susilowati\r\n','-','Kaur Keuangan','085200664695\r\n',1,NULL,'default.jpg',1,0),

(388,'125.160.207.177','diding','$2y$08$1OAtVc1HX9onEwyP4JzwuOZSlhSRFTOWfHZXZYM/qvt8TLSTwz9ry',NULL,'di@ding.com',NULL,NULL,NULL,NULL,1507381893,1507794186,1,'Diding','Herpita','SS Kisamaun','-',0,NULL,'default.jpg',1,5),

(389,'125.160.207.177','nofisus','$2y$08$RJM4prI8F/DL8KOD9nPr7uH6WzbkWM0oXizXIHe0ppwdfM4gVOJ2O',NULL,'nofi@sus.com',NULL,NULL,NULL,NULL,1507456789,1507536335,1,'Nofi Susilowati','Nofi','AREA JABODETABEK','-',0,NULL,'default.jpg',1,5),

(390,'110.137.172.127','nuri','$2y$08$CSeOZXDc0eIf1Y.V50rVM.l1uYolkXMqvy/y1zNPoisWlM0uvxwuO',NULL,'nuri@pedasabis.com',NULL,NULL,NULL,NULL,1507469619,1518091726,1,'Nuryanti','Nuri','SS AREA JABODETABEK','-',0,NULL,'default.jpg',1,5),

(391,'110.137.163.164','Yanti','$2y$08$w3u5K5SfTPK0miiw8gPuQ.bbIvD4w2GDkgEUnug4pm0dYGxkLb.5K',NULL,'yanti@pedasabis.com',NULL,NULL,NULL,NULL,1507510977,1507713047,1,'Yanti','Agustini','Waroeng SS','081293300258',0,NULL,'default.jpg',1,5),

(392,'110.137.163.164','indah','$2y$08$MkwLC/P68Lp8.Wf0Jn3IN.xohSF7.tgr25YdtAFj7XIKBLyyEYxNG',NULL,'indah@putri.com',NULL,NULL,NULL,NULL,1507517674,1518100638,1,'Indah Permata ','Putri','AREA JABODETABEK','081212043545',2,NULL,'default.jpg',1,5),

(393,'118.96.156.144','yesi','$2y$08$0l28PUoSw7EQIONsJydt0eG7ER0eV/2FiffC0/64pcsZjRT46pqoe',NULL,'as@as.wss',NULL,NULL,NULL,NULL,1507522654,NULL,1,'Yesi Firsilia Setiawan','-','Ass Keuangan Pekalongan','085642913421',0,NULL,'default.jpg',1,0),

(394,'118.96.156.144','Jaenudin','$2y$08$Bg/9QSNrxKDFtajmpfEMteLmC0JkB/1uG7p/Urx5MOvtmHktvv.sa',NULL,'jaenudin@wss.com',NULL,NULL,NULL,NULL,1507529688,1515826291,1,'Jaenudin','-','Staf PAPG Area Purwokerto','082138031518',1,NULL,'default.jpg',1,40),

(395,'118.96.156.144','budi_w','$2y$08$KeBYR6bDtuGhlxUbO5pVTucQk.cGPsfHFEqUQYcbihlgOmOHFnbcm',NULL,'budi@wss.com',NULL,NULL,NULL,NULL,1507529790,1515489579,1,'Budi Widodo','-','Perintis','08233106633',1,NULL,'default.jpg',1,40),

(396,'118.96.156.144','kiryanto','$2y$08$8KysqE/VMgx57QHe0vSXgO4NXhqaU28g.p7JCzyl9yJ4NGgzqpn7G',NULL,'ss@ss.com',NULL,NULL,NULL,NULL,1507600448,NULL,1,'Kiryanto','-','waroeng ss','08164238965',0,NULL,'default.jpg',1,0),

(397,'36.78.79.248','yan','$2y$08$XI0OIsuZa4oL/KN2XylIUujcMcOi/7p1TQqBCZsOKJyQvIRL1E5cW',NULL,'yan@gmail.com',NULL,NULL,NULL,NULL,1507608764,1517917818,1,'Yan Prihatmoko','Yan','AREA JABODETABEK','081212041945',0,NULL,'default.jpg',1,0),

(398,'36.78.79.248','umi_s','$2y$08$WpFLuGhRoK9cQZoSyxL5SuwIPPxRAWeVh2EBavymvRPlZGQu/vKxa',NULL,'umi@jbtk.com',NULL,NULL,NULL,NULL,1507608912,1507702116,1,'Umi Solati','umi','AREA JABODETABEK','081212040933',0,NULL,'default.jpg',1,5),

(399,'36.78.79.248','heris','$2y$08$slBevFs.1KkHqKWiWJ31NubSr9ITZ94WoQcmr0f2lWoNmkSp2A/uG',NULL,'heri@s.com',NULL,NULL,NULL,NULL,1507608993,1515483199,1,'Heri Setiawan','heri','AREA JABODETABEK','081289550313',1,NULL,'default.jpg',1,5),

(400,'36.78.79.248','fathullah','$2y$08$LvL7iIYDL25UukS/2KhxY.ByxS059sMEaj9bmRBSp8EfhekMxgCfS',NULL,'fathul@amil.com',NULL,NULL,NULL,NULL,1507609377,NULL,1,'Fathullah','fathul','AREA JABODETABEK','081289510957',0,NULL,'default.jpg',1,0),

(401,'36.78.79.248','pariyanto','$2y$08$bi/88QXlZk9lwKqRRONPcu5zS8mOYtrd.9LIHJnwNvH8yJsbBRmVq',NULL,'pari@yahoo.com',NULL,NULL,NULL,NULL,1507609538,NULL,1,'Pariyanto','pariyanto','AREA JABODETABEK','081289510959',0,NULL,'default.jpg',1,0),

(402,'36.78.79.248','diah_lina','$2y$08$iwj.MTtw1MAMVN72ESmcQ.ZtoVYjToigmznXrxbgCVon.LX2uacp.',NULL,'diah@lina.com',NULL,NULL,NULL,NULL,1507609679,NULL,1,'Diah Lina','Susanti','AREA JABODETABEK','081212040514',0,NULL,'default.jpg',1,0),

(403,'36.78.79.248','ida_s','$2y$08$tSmD45NqHhNfa/B6qcXJnOYSJrI6cUC28eFb5SoK1c/Cih1QeLUga',NULL,'ida@sus.com',NULL,NULL,NULL,NULL,1507609789,NULL,1,'Ida Susanti','ida','AREA JABODETABEK','081212041715',0,NULL,'default.jpg',1,0),

(404,'36.78.79.248','ayu_w','$2y$08$M/lNfUcDBf.rRCUQlEDQWO9AIQxFy6hayVUK46mkMS3IEDixSCQPG',NULL,'ayu@w.com',NULL,NULL,NULL,NULL,1507609900,1516431084,1,'Ayu Wandina','ayu','AREA JABODETABEK','081212042168',2,NULL,'default.jpg',1,0),

(405,'36.78.79.248','siti_n','$2y$08$bbilOGnlpbqfyVL1H2l9xu/akJUXILH5zOh02dD5Evk/0znbTIl4S',NULL,'siti@n.com',NULL,NULL,NULL,NULL,1507610012,NULL,1,'Siti Nurcahaya','siti','AREA JABODETABEK','081385809382',0,NULL,'default.jpg',1,0),

(406,'36.78.79.248','warno','$2y$08$L71XyfpdTYtrXPgRxAs..OwMDeMPmAcq9SHMy1jahoy6YSBj9CeMa',NULL,'admin@aja.com',NULL,NULL,NULL,NULL,1507610120,NULL,1,'Warno','warno','AREA JABODETABEK','081393300242',0,NULL,'default.jpg',1,0),

(407,'36.78.79.248','annisa','$2y$08$X9BTf4vP4xoJbAijEU7zg.ZdBfPP2fCnX3CqPdf/E1KFEJ6DBiyJi',NULL,'admin@aja.com',NULL,NULL,NULL,NULL,1507610609,NULL,1,'Annisa Putri','-','AREA JABODETABEK','081212043353',0,NULL,'default.jpg',1,0),

(408,'36.78.79.248','fitrinovi','$2y$08$ztWdLYorTiBSZVj06JOi1OOUhIj/o/o6w7LDy5TNoniV2PGYDMIFG',NULL,'admin@aja.com',NULL,NULL,NULL,NULL,1507610908,NULL,1,'Fitri Novianti','-','AREA JABODETABEK','081212040505',0,NULL,'default.jpg',1,0),

(409,'36.78.79.248','ernawati','$2y$08$LvNQv5iuJs5O7M53kFmQGOaesuyR.ZlTGaeD1mxEpOV95ddzAZiVS',NULL,'admin@aja.com',NULL,NULL,NULL,NULL,1507610965,1516346630,1,'Ernawati','-','AREA JABODETABEK','081212044487',1,NULL,'default.jpg',1,0),

(410,'36.78.79.248','diana','$2y$08$XK.0C077xdg365fmYmKD3e3KMw8m64Kf9t10OB93V.0Me3RHjqa6S',NULL,'admin@aja.com',NULL,NULL,NULL,NULL,1507611044,NULL,1,'Diana Kurniawati','-','AREA JABODETABEK','081212045152',0,NULL,'default.jpg',1,0),

(411,'118.96.156.144','nonik_r','$2y$08$yPsJ9vKAr.WhaW46flOO8.krsqE76XwpH9PE8mHnRiYhXktzcKjna',NULL,'ss@ss.com',NULL,NULL,NULL,NULL,1507616952,NULL,1,'Nonik','R','Area Jogja','081212042464',0,NULL,'default.jpg',1,0),

(412,'118.96.156.144','mashud_s','$2y$08$6h4SottjwJBHMe./BcG1GeEmPJvWVcGk0vMk2ED0t7IcqMLIzDcpa',NULL,'ss@ss.com',NULL,NULL,NULL,NULL,1507619755,NULL,1,'Mashud','Syahroni','waroeng ss','123',1,NULL,'default.jpg',1,0),

(413,'36.79.129.74','bertanova','$2y$08$Cwwy.Xb2GBU82dJpTd0DKu3YG6lQQdPAgoZKOkWVVFKCSKAm4aTSu',NULL,'gakada@mail.com',NULL,NULL,NULL,NULL,1507631860,NULL,1,'Albertus Nova Alvianto','-','Staf PAPG Area Perintis','082243274507',1,NULL,'default.jpg',1,0),

(414,'61.5.27.224','ulfah','$2y$08$58wKum2Z4wiQlVUzEmaATOD.KrG.Lcj0SUzqnNHUo4SyI2bCmtaeK',NULL,'aulia@ulfa.com',NULL,NULL,NULL,NULL,1507702162,NULL,1,'Aulia Ulfah','-','SS PALEM SEMI','-',0,NULL,'default.jpg',1,0),

(415,'118.96.156.144','candra','$2y$08$sIgwZiu7XTNjz6MWcjEuZuZd3Yy4.y8u1p9tdmcI5BRc77pkV2Z9i',NULL,'ss@ss.com',NULL,NULL,NULL,NULL,1507703232,NULL,1,'Candra','-','waroeng ss','082322819388',0,NULL,'default.jpg',1,0),

(416,'118.96.156.144','prayogianto ','$2y$08$432MnBipdxD/e/1h8bQxjOQIkJWnx4InOAtQ6HfkuGt32BdLUoouO',NULL,'ss@ss.com',NULL,NULL,NULL,NULL,1507703584,NULL,1,'Prayogianto ','-','waroeng ss','082328979332',0,NULL,'default.jpg',1,0),

(417,'118.96.156.144','rizki_wd','$2y$08$sIgwZiu7XTNjz6MWcjEuZuZd3Yy4.y8u1p9tdmcI5BRc77pkV2Z9i',NULL,'ss@ss.com',NULL,NULL,NULL,NULL,1507714401,NULL,1,'Rizki ','Widayat ','waroeng ss','082328979335',0,NULL,'default.jpg',1,0),

(418,'118.96.156.144','putut_tp ','$2y$08$z.vP8Fm8Oz.raZ6H3gFHquI5.27eC8AXjNF2uegO5p0X6MAkilKEe',NULL,'ss@ss.com',NULL,NULL,NULL,NULL,1507720098,1515492746,1,'Putut Tri','Praseno ','waroeng ss','085608854436',1,NULL,'default.jpg',1,44),

(419,'118.96.156.144','ardiansyah','$2y$08$8950qU9a0V2qA7Ff39vnBOuAdkGX7kq6Nq8NF41GOcPL8lRi3mWOG',NULL,'ss@ss.com',NULL,NULL,NULL,NULL,1507720559,1507788339,1,'Ardiansyah M.','-','waroeng ss','082242065696',0,NULL,'default.jpg',1,49),

(420,'61.94.246.227','anda','$2y$08$iLqlpS41WSdB7tJSotn38ORCM4hoK5oQlmJdZLQprvx8mlNb1qMYC',NULL,'anda@purwanda.com',NULL,NULL,NULL,NULL,1507734108,NULL,1,'Anda Purwanda','-','SS Kisamaun','-',0,NULL,'default.jpg',1,5),

(421,'61.94.246.227','hayati','$2y$08$6Pg8pTRm8Yj9/nxepQyQpOfKGY7Pf8/Pe59elHyX9zyUW3iDuoPOW',NULL,'hayati@yahoo.com',NULL,NULL,NULL,NULL,1507734250,NULL,1,'Nurhayati','-','SS Kisamaun','-',0,NULL,'default.jpg',1,0),

(422,'36.80.227.207','arin_a','$2y$08$U3.77Hv4Y7Y2Ho.XboMQeO.nXzxy2fbERKNdhcDPYhycHFtwPOn2S',NULL,'ss@ss.com',NULL,NULL,NULL,NULL,1508232130,1515999373,1,'Arin','-','waroeng ss','082226246598',1,NULL,'default.jpg',1,0),

(423,'36.81.38.30','iwan_p','$2y$08$6vP42Zqo.2aTq1L4nCznquBQPM4o11T1MAww3Jb11KANomlJE9wWG',NULL,'iwan@p.com',NULL,NULL,NULL,NULL,1508825698,NULL,1,'Iwan Arif','Pranata','SS Sompok','082328979383',0,NULL,'default.jpg',1,0),

(424,'36.81.38.30','yakub','$2y$08$CIjaMm0jIOIaEfh7APJ72ekM0PDu/HvuJr4AWiLyuVXeN0V5n6Cf.',NULL,'yakub@yakub.com',NULL,NULL,NULL,NULL,1509073604,NULL,1,'Muhamad Yakub','-','PAPG SS Yasmin Bogor','081212041127',0,NULL,'default.jpg',1,0),

(425,'36.81.38.30','kris','$2y$08$K0/F1A80xUmfEGIWeZbkTeZiaUA/usvVC5McfkQH.Mkl22XzD5maG',NULL,'kris@kris.com',NULL,NULL,NULL,NULL,1509085637,1515758172,1,'Krislaksono Putro','Kris','MANAJEMEN PUSAT','-',2,NULL,'default.jpg',1,0),

(426,'36.81.38.30','asri','$2y$08$komcAfSW5CoSK2pli3Mo2.DHmWX6nZCbNW00KXZlPYGBhMyzzzOFy',NULL,'dwi@asri.com',NULL,NULL,NULL,NULL,1509085898,NULL,1,'Dwi Asri ','Wulandari','MANAJEMEN PUSAT','-',0,NULL,'default.jpg',1,0),

(427,'36.81.70.53','efi_uum','$2y$08$zFQsLUNlrUtqMRXfnQqqjeR8YTsCdDKvMv08I1SZEXjxathIdqDAC',NULL,'efi@uum.com',NULL,NULL,NULL,NULL,1509178914,NULL,1,'Efi Uum','Trifianiningtyas','MALANG','-',0,NULL,'default.jpg',1,0),

(428,'36.81.70.53','angga','$2y$08$3xDRnkncC68F8CvjuFs/DevlhKTwEjC1cAr6PZtrh0H4A5RnttK8i',NULL,'angga@mada.com',NULL,NULL,NULL,NULL,1509264154,1515836815,1,'Angga Prima','Atmadha','MANAJEMEN PUSAT','-',2,NULL,'default.jpg',1,0),

(429,'118.96.154.150','munir','$2y$08$tvEmI.rip/JGsQ4btlijJO.L8YNF0N9I1d.Q4HvWQhGuc4DfMwEa6',NULL,'ngawur@gmail.com',NULL,NULL,NULL,NULL,1509526221,NULL,1,'munir assagaf','-','wapg ss sampangan','082225512543',0,NULL,'default.jpg',1,0),

(430,'118.96.154.150','asep_r','$2y$08$VEuvcUaD/IIIqYvmi5QsTua6Mr1i0WzR/AMmZadGNYfIuLClQTfVa',NULL,'sudir@gmail.com',NULL,NULL,NULL,NULL,1509526496,NULL,1,'asep riyadi','-','wapg ss salatiga sudirman','082328979364',0,NULL,'default.jpg',1,0),

(431,'118.96.154.150','muji','$2y$08$SU7g6QgjOxTfNrBUk9hP/.g7XjFzpPZ/dtRRLGYqJA4KvCl336Cw2',NULL,'ghh@gmail.com',NULL,NULL,NULL,NULL,1509596220,NULL,1,'mujiyono','-','Asisten Produksi SS Tukad','085701041717',0,NULL,'default.jpg',1,0),

(432,'118.96.154.150','yoga','$2y$08$Y2Hvw17MyhwW0nzT2L/VF.abACH7IEbGMYyVEcQ6f.FoBsX87/JFS',NULL,'yog@yoga.com',NULL,NULL,NULL,NULL,1509779428,NULL,1,'Yoga','-','SS TEMBALANG','082328979421',0,NULL,'default.jpg',1,0),

(433,'180.254.56.167','fia_a','$2y$08$lS4khTv.E80JxiOWNIrtBOPyn/MfMu0lp1.jWP0iah5xXdnAmy1y2',NULL,'ghjhj@gmail.com',NULL,NULL,NULL,NULL,1510024926,NULL,1,'Fia Afiana','-','ss jember','081937784845',0,NULL,'default.jpg',1,0),

(434,'36.72.212.196','agusto','$2y$08$Shh7al4JMr3Ynoo2eXKCxePkJCYx6KxcrbOEg0.moA7UFQTqOEhWC',NULL,'kediri@gmail.com',NULL,NULL,NULL,NULL,1510286424,NULL,1,'Agusto Prima Ariyanto','-','WAPG SS Kediri','082328979480',0,NULL,'default.jpg',1,0),

(435,'36.72.212.196','nurul_s','$2y$08$z4hlFwSEmM1KIr/29jIRuOR.pwSvtoEu2AnV0rEbXWWN58gdY/WJm',NULL,'dfggg@gmail.com',NULL,NULL,NULL,NULL,1510372004,NULL,1,'Nurul Susanti','-','wss semarang','-',0,NULL,'default.jpg',1,0),

(436,'36.81.18.75','evan_a','$2y$08$1bC/17Vo37f9WnNO9Apf7.wUABhm.Q/wcZMGcQOzEmnmN1bD8Lnvq',NULL,'ddfggh@gmail.com',NULL,NULL,NULL,NULL,1510881590,NULL,1,'Evan Ahid','Oetoyo','Wss Tukad Barito','081325181086',0,NULL,'default.jpg',1,0),

(437,'36.81.18.75','nerisa_a','$2y$08$63lnMUCSq/YbtoFHO16J7eFg/I5SgTKYjehZ5yrH34Qkmz364JVp.',NULL,'fghj@gmail.com',NULL,NULL,NULL,NULL,1510881977,NULL,1,'Nerisa Arviana','-','Wss Tukad Barito','089678539240',0,NULL,'default.jpg',1,0),

(438,'36.81.28.208','handri_e','$2y$08$YTYG4dTw1y84bdizdbzX9.Gc07Pftx83f6fjC7e6CUduZXOT.UtzO',NULL,'ghhhjjk@gmail.com',NULL,NULL,NULL,NULL,1510985504,1518235243,1,'Handri Erminasari','-','Wss Purwokerto','081215406151',1,NULL,'default.jpg',1,0),

(439,'36.81.84.24','Setyadi','$2y$08$ihqQn5QOC2CUPpvvbskIsO5qpuhJpHFL6TZgdG0ZoV.T3RJwaOyQO',NULL,'qwerty@gmail.com',NULL,NULL,NULL,NULL,1511147047,NULL,1,'Setyadi','-','wss klaten','081567888765',0,NULL,'default.jpg',1,0),

(440,'36.81.84.24','Diana_K','$2y$08$5w.tRPpEPZpZk61vr72CwO5rXEqohETotx0Kya25rTDjjkRrAj.JC',NULL,'qwerty@gmail.com',NULL,NULL,NULL,NULL,1511148254,NULL,1,'Diana Krisnawati','-','wss klaten','082325030068',0,NULL,'default.jpg',1,0),

(441,'36.81.84.24','Cahyo','$2y$08$TkWlX1rQA18wmhQD2gvY7ud2lGD6T9VaYIPbrZp56RYZTg11JM4PK',NULL,'qwerty@gmail.com',NULL,NULL,NULL,NULL,1511148524,NULL,1,'Cahyo','-','wss klaten','-',0,NULL,'default.jpg',1,0),

(442,'36.81.84.24','Nur_Aini','$2y$08$S7VTnFMdUiTl4ME4gLjgb.TQ19ipDwaKQm.j/zFEPpMaqZaLjAHWe',NULL,'qwerty@gmail.com',NULL,NULL,NULL,NULL,1511148756,NULL,1,'Nuraini','-','wss klaten','082325030029',0,NULL,'default.jpg',1,0),

(443,'36.81.84.24','Hanafi','$2y$08$21gZrxk24RHQLk5qVvTnMOTmVu71RaK.IzWx4ZXwyHSU1PF3S8KH2',NULL,'qwerty@gmail.com',NULL,NULL,NULL,NULL,1511149044,NULL,1,'Hanafi','-','wss klaten','081227234084',0,NULL,'default.jpg',1,0),

(444,'36.79.156.64','edi','$2y$08$8Wo1x1ukXCgBfghfVudYC.JuMTSrWvlKehNL6/BMwN0nLZQD5Plf.',NULL,'edi@aja.com',NULL,NULL,NULL,NULL,1511314834,NULL,1,'Edi Hartono','edi','SS Agricola','08568520922',0,NULL,'default.jpg',1,0),

(446,'36.79.156.64','rendi_santoso','$2y$08$fB9WydVOtlJbD04znTMaoeLmYxTtgRuNca0VKrb9dNBs8N/h5A17W',NULL,'sadsa@sa.caa',NULL,NULL,NULL,NULL,1511322953,NULL,1,'rendi santoso','-','MT PAPG Area Semarang','081218001298',0,NULL,'default.jpg',1,0),

(447,'36.79.156.64','Hanafi_N','$2y$08$0e035dWoRrXjRCjQyYoE0ugzowOJ8wzUQK92Jaq/rNgIG1eyVj41y',NULL,'qwerty@gmail.com',NULL,NULL,NULL,NULL,1511343422,NULL,1,'Hanafi Noviansyah','-','SS Solo','-',2,NULL,'default.jpg',1,0),

(448,'36.79.156.64','Suyitno','$2y$08$0T1/j.tqswqtvNuNGUVHqu.IOyC8z44yX8/G0N7EvBCP17r06d2Vu',NULL,'qwerty@gmail.com',NULL,NULL,NULL,NULL,1511343998,NULL,1,'Suyitno','-','wss klaten','-',0,NULL,'default.jpg',1,0),

(449,'36.78.57.243','Slamet_W','$2y$08$0Q3PE8dg7gYL.eHTmHhIlebaNa65wKcVsVywNcwYypgczg/ZSxmoS',NULL,'qwerty@gmail.com',NULL,NULL,NULL,NULL,1511425683,NULL,1,'Slamet Wiyono','-','SS Solo','085647429400',2,NULL,'default.jpg',1,0),

(450,'36.78.57.243','lala','$2y$08$nXkhh1gGdEHRycuQpShcYeCKf/zHf9NTZ2BlWaUEps0VvPgxQ/9Be',NULL,'lala@laela.com',NULL,NULL,NULL,NULL,1511503371,NULL,1,'Laela Latifah','-','AREA MALANG','-',0,NULL,'default.jpg',1,0),

(451,'36.78.57.243','Bayu_W','$2y$08$ygoMqg.Rad9vGTlK6EZSJ.twgtoaO.jm82LM22sI6hUifDcvgAQjW',NULL,'qwerty@gmail.com',NULL,NULL,NULL,NULL,1511533739,1518165502,1,'Bayu Wicaksono','-','SS Solo','082242714565',2,NULL,'default.jpg',1,0),

(452,'36.78.57.243','Syakur','$2y$08$IoW1BX5PdEl0o70vQc5lq.PeRN1qGqrB2P/MXAv84IMWehXugd4M6',NULL,'sya@kur.com',NULL,NULL,NULL,NULL,1511596239,1515909404,1,'Abdussyakur Marzuq','-','AREA PURWOKERTO','-',2,NULL,'default.jpg',1,0),

(453,'36.78.57.243','Mujtaba','$2y$08$YZ26Ciwc1tA3C6SB5RXCYOKw1UqwRaWEK7WSiWwON4R4hCr.BEX1i',NULL,'agung@agung.com',NULL,NULL,NULL,NULL,1511596280,NULL,1,'Agung Mutjaba','-','PUSAT','-',0,NULL,'default.jpg',1,0),

(454,'36.78.57.243','fajar','$2y$08$hlCIEMau7AB2cBcRkhmMoesKx3GXqmHKKTH6fRYq4NCN.xSXqVjda',NULL,'fajar@latief.com',NULL,NULL,NULL,NULL,1511596332,1515549269,1,'Fajar Arif Wijaya ','Latief','AREA MALANG','-',1,NULL,'default.jpg',1,0),

(455,'36.78.57.243','Ahmad_SG','$2y$08$7EyiyoSSjEXXxS6JGzV19e83sE85HV9cSy9qQi0YdWj9JQLWXP1lS',NULL,'qwerty@gmail.com',NULL,NULL,NULL,NULL,1511604224,1517897670,1,'Ahmad Sugiyanto','-','SS Solo','082325031084',0,NULL,'default.jpg',1,0),

(456,'116.206.40.71','agusABG','$2y$08$enMQ0ipDYCHO/AVZiPWw1OaLdgN6zTd43eh0SbaiZSdoMlJ0ttqsG',NULL,'agus@gg.com',NULL,NULL,NULL,NULL,1511844520,NULL,1,'Agus Budi Santoso','-','SS BANTUL','-',0,NULL,'default.jpg',1,0),

(457,'116.206.40.71','tio','$2y$08$rKYoFx93.doTAFiG7M9n6e0mEdMfciUui8EEPe..Htiy68jFhzAMq',NULL,'tio@tyo.com',NULL,NULL,NULL,NULL,1511844829,NULL,1,'Stefanus Setio ','Prayogo','SS BANTUL','-',0,NULL,'default.jpg',1,0),

(458,'116.206.40.71','anggit_An','$2y$08$SJuTCMTV5pKg.UDxIZYl9OHMNNM1bXOzcOcf8yiRJAG.AUmoUrlKC',NULL,'angg@git.com',NULL,NULL,NULL,NULL,1511844989,NULL,1,'Anggit Anugrah','-','SS BANTUL','-',0,NULL,'default.jpg',1,0),

(459,'36.79.143.109','riyadi','$2y$08$RsV/b5e6Srnw6rWJ7Jxp5.ntHlCHphnlai.U62VYmmXoJlNeVRlmy',NULL,'riyadi@mail.com',NULL,NULL,NULL,NULL,1512290222,NULL,1,'Riyadi','-','Ass. Produksi','082325030107',0,NULL,'default.jpg',1,0),

(460,'36.79.143.109','sirun','$2y$08$ZJ36asVZmfpIzEUXO6n1iOz3c0aXEI.FJGWnyI9ktQCMJDjY8HdOS',NULL,'sirun@mail.com',NULL,NULL,NULL,NULL,1512290336,NULL,1,'sirun','-','Ass. Ops Prambanan','082328979410',0,NULL,'default.jpg',1,0),

(461,'36.79.143.109','rizki_windi','$2y$08$1h9aypywCEJd0ItwR0p.bOKf4tVX8.iCdF6j5ThVFQXBZIT0xvfkq',NULL,'rizki_windi@mail.com',NULL,NULL,NULL,NULL,1512290445,NULL,1,'rizki windi saputro','-','wak Ass. Pengadaan','082328979410',0,NULL,'default.jpg',1,0),

(462,'36.79.143.109','yuli_fitriati','$2y$08$7yJCqlAJ.c6uKNz1vFWrReC5LaLq1e2C6tMPxqm.ENPjX2/GB4lV.',NULL,'yuli_fitriati@mail.com',NULL,NULL,NULL,NULL,1512290569,NULL,1,'yuli fitriati','-','Ass. Produksi Magelang','082325029925',0,NULL,'default.jpg',1,0),

(463,'36.79.143.109','Dwi_nur','$2y$08$dpQy2aVU3SO1KCIRVtbExu4BXCOBtbUKTMrTj2DnzCcbUZAUxGhN6',NULL,'dwi_nur@mail.com',NULL,NULL,NULL,NULL,1512290690,NULL,1,'Dwi nur arif','-','Ass Ops Mangelang','082325029921',0,NULL,'default.jpg',1,0),

(464,'36.79.143.109','mfebris','$2y$08$38zNArYr.T.CcibIVBlZVu4aEavv4.aE0Y22cb/zw/ptakTuZ53ze',NULL,'waroengss@ss.com',NULL,NULL,NULL,NULL,1512355262,NULL,1,'Muhammad Febri Setiawan','-','wareong ss','085643770074',0,NULL,'default.jpg',1,0),

(465,'36.79.143.109','triyoso','$2y$08$AkuTxAdEPfCqTi1P9kAAQuqW6jKal/mBJpMnDXWmQj3nv4jmPHDKO',NULL,'triyosokuncoro@gmail.com',NULL,NULL,NULL,NULL,1512362293,1516171276,1,'Triyoso Kuncoro','-','SS PUSAT','085743587735',0,NULL,'default.jpg',1,0),

(466,'36.79.143.109','Agus_J','$2y$08$YPOEPOVgY3RLbTzLHS3wserXqDMhJz5ljxkUXpf.3.90glec9HWye',NULL,'qwerty@gmail.com',NULL,NULL,NULL,NULL,1512367838,NULL,1,'Agus Jahuri','-','Wss Magelang Mertoyudan','-',0,NULL,'default.jpg',1,0),

(467,'36.79.143.109','Arif_Y','$2y$08$SMS2Ajb7LQeKoiVpEKLkbOPbR8UUamzxIeUgPcW2qVBOxixPW4nR.',NULL,'qwerty@gmail.com',NULL,NULL,NULL,NULL,1512367931,NULL,1,'Arif Yulianto','-','Wss Magelang Mertoyudan','-',0,NULL,'default.jpg',1,0),

(468,'36.79.143.109','Dian_AS','$2y$08$rfSvRJZDvmYIgvvTMW3D/eG7fBqc1BwZ02hhXC4hlZ7a5cye.Au6.',NULL,'qwerty@gmail.com',NULL,NULL,NULL,NULL,1512368059,NULL,1,'Dian Ayu S','-','Wss Magelang Mertoyudan','-',0,NULL,'default.jpg',1,0),

(469,'36.79.143.109','Candra_KL','$2y$08$aeiph//4kml3sdeVNg9sruXHgSQjE51vaeKwtAfLWcgro9VUP2.JO',NULL,'qwerty@gmail.com',NULL,NULL,NULL,NULL,1512541798,1516433058,1,'Candra Kusuma L','-','Perintis','085647665373',2,NULL,'default.jpg',1,0),

(470,'36.79.143.109','Daniel_IW','$2y$08$9s2HN75tY/M5JPJudqyBx.J5xPYsdOoXEdaZWnuS2NHXKGO.0VlU2',NULL,'qwerty@gmail.com',NULL,NULL,NULL,NULL,1512541862,1515827454,1,'Daniel Indra W','-','Perintis','08564324754',0,NULL,'default.jpg',1,0),

(471,'36.79.143.109','Wardiyono','$2y$08$neBw3bJohzpbI3Dx1bzrFejwxJjDV5AXMv4QSQ2aCPgGBoFJyIANi',NULL,'qwerty@gmail.com',NULL,NULL,NULL,NULL,1512541914,NULL,1,'Wardiyono','-','Perintis','085713623099',0,NULL,'default.jpg',1,0),

(472,'36.79.143.109','Supriyanto','$2y$08$ccgBTjyYoSLi18v1jTu4aulpQ88aWPcZLyHn3uOPt/iIpPg55HDMy',NULL,'qwerty@gmail.com',NULL,NULL,NULL,NULL,1512615410,1517912532,1,'Supriyanto','-','Area Solo','085642324027',2,NULL,'default.jpg',1,0),

(473,'36.80.235.31','Rohmad_S','$2y$08$7UZeZg8dKvmr00onWVD5z.T6yoLAW9cdTqzrkixmUzT2rEAQ4JEhC',NULL,'qwerty@gmail.com',NULL,NULL,NULL,NULL,1512790716,NULL,1,'Rohmad Siswanto','-','Wss SBY Mulyorejo','-',0,NULL,'default.jpg',1,0),

(474,'36.72.213.97','ninda','$2y$08$EzNt/4raQWHD7m7EqXwwE.uucz8wifKknDKoxkpm/dHITyWyCzdW2',NULL,'emailnyaninda@yahoo.com',NULL,NULL,NULL,NULL,1513084037,1518603117,1,'Ninda Tanove','-','Anggaran Pusat','085290170276',1,1,'default.jpg',1,1),

(475,'36.72.213.97','kholis55','$2y$08$zEQuLFi.Ta7okqmp3M.PxOQIXrlYc5ZZf2TFOhHbvFzjeJdiDVgn6',NULL,'ihsan624@gmail.com',NULL,NULL,NULL,'Y3WwjQv71p3scnnYMVGhGe',1513233217,1516375182,1,'kholis','-','wareong ss','6285655268945',0,NULL,'default.jpg',1,0),

(476,'36.72.213.97','Yayan','$2y$08$QAKlCNAK/fs13p8DEQ7C2eZtsBujNeKhUMAM2wZw3ES03kVmdDEKe',NULL,'qwerty@gmail.com',NULL,NULL,NULL,NULL,1513308257,NULL,1,'Yayan','-','Distribusi Pusat','-',0,NULL,'default.jpg',1,0),

(477,'36.72.213.97','Taufiq_D','$2y$08$BUgQRlvD82giUE6N4nnfYO6YQy/nbILPONlUAubBngvEAmUDQDioG',NULL,'qwerty@gmail.com',NULL,NULL,NULL,NULL,1513308325,NULL,1,'Taufiq','-','Distribusi Pusat','-',0,NULL,'default.jpg',1,0),

(478,'36.81.29.50','Gratia_A','$2y$08$ngvpJAPo9Z5nEtZtMytcL.qKflZrNe6ikLneG.Rzr.GIo7Kr2Zp9e',NULL,'qwerty@gmail.com',NULL,NULL,NULL,NULL,1513581710,1515815373,1,'Gratia Aprilia','-','Area Solo','089664237387',2,NULL,'default.jpg',1,0),

(479,'36.81.29.50','Purwoko','$2y$08$F.Ju0oMLyb1HOipLpULJt.VxlIxZohblP/H9poxO.Sb28WuMS1g2m',NULL,'qwerty@gmail.com',NULL,NULL,NULL,NULL,1513581777,1513683104,1,'Purwoko','-','Area Solo','085867179477',2,NULL,'default.jpg',1,0),

(480,'36.81.29.50','Siti_AS','$2y$08$TZYn664N.rSCFfumi5fLhuvyuZ.9wk6kJRzUyOwEXgFEXBmaSlfe.',NULL,'qwerty@gmail.com',NULL,NULL,NULL,NULL,1513581846,1515826102,1,'Siti Ayu Sari','-','Area Solo','083866858540',2,NULL,'default.jpg',1,0),

(481,'36.81.29.50','Arya_G','$2y$08$PLP2Xp4SF25VJJ3FNocSPuy9fTeaunq9bSoPcgoLwLX4KGrngmLMC',NULL,'qwerty@gmail.com',NULL,NULL,NULL,NULL,1513581953,1516438258,1,'Arya Gumilang ','-','Area Solo','08982311127',0,NULL,'default.jpg',1,0),

(482,'36.81.29.50','Endang_M','$2y$08$ZbS6XRYzwsW9egoekHcRO.wLCuPuDlw47Do10e95X9qwqpzNPX1fy',NULL,'qwerty@gmail.com',NULL,NULL,NULL,NULL,1513582028,1516424514,1,'Endang Mari Astuti','-','Area Solo','082226556710',0,NULL,'default.jpg',1,0),

(483,'36.81.29.50','Iin_W','$2y$08$PZrT6YG52JgNdJ8jZyRTi.eFTpkGWiS0zbzIL030J64QwtvI3i0iO',NULL,'qwerty@gmail.com',NULL,NULL,NULL,NULL,1513582094,1514961241,1,'Iin Wulandari','-','Area Solo','083128029775',0,NULL,'default.jpg',1,0),

(484,'36.81.29.50','Ichsan_M','$2y$08$xdwqigobCH.cCoN4eRFM5upm60M9o0DN4DEHhpLLPv8t9FeRbtIkO',NULL,'qwerty@gmail.com',NULL,NULL,NULL,NULL,1513582168,1517899422,1,'Ichsan Munadi','-','Area Solo','087736263000',0,NULL,'default.jpg',1,0),

(485,'36.81.29.50','Eko_Y','$2y$08$T7rBVuewUrLIf.D0EjsV4uhBu.ZMR1UVmgzoW6VxvJZu0VJVDPpc2',NULL,'qwerty@gmail.com',NULL,NULL,NULL,NULL,1513582651,1516095295,1,'Eko Yulianto','-','Area Solo','082300053850',0,NULL,'default.jpg',1,0),

(486,'36.81.29.50','Tri_Y','$2y$08$vCUhnqpiPikRXXPHjeo0FeyNbAfdbACeMCXcI7RHxYLH9PYrggVt6',NULL,'qwerty@gmail.com',NULL,NULL,NULL,NULL,1513582716,NULL,1,'Tri Suryanto','-','Area Solo','085200664671',0,NULL,'default.jpg',1,0),

(487,'36.81.29.50','haryanto','$2y$08$WR018miJdM8UROSyDGf/bOTQKMzav6GXfO1HxArLXwG8kTbw71zaW',NULL,'Haryanto@Haryanto.com',NULL,NULL,NULL,NULL,1513582811,1513682252,1,'Haryanto','-','Produksi Area Solo','085647224411',2,NULL,'default.jpg',1,0),

(488,'36.81.29.50','Titin_W','$2y$08$jZKn3Ntr9.dcjcX9VGC1YO5H7TPZyzdK/U9KryJmQbk6LvvxPQvx2',NULL,'qwerty@gmail.com',NULL,NULL,NULL,NULL,1513582875,NULL,1,'Titin Widyawati','-','Area Solo','085601712414',1,NULL,'default.jpg',1,0),

(489,'36.81.29.50','Dini_C','$2y$08$.gYtWIyiwPS0ylrx4nsgZOEB6KYQcEr.btWIUncsfthUoCAkStsc.',NULL,'qwerty@gmail.com',NULL,NULL,NULL,NULL,1513582931,NULL,1,'Dini Claudia Widyasari','-','Area Solo','081802535441',2,NULL,'default.jpg',1,0),

(490,'36.81.29.50','Tri_S','$2y$08$kcBv.nTuLvh7Z5kZP8UCBe45Q8pKdbYdkrOKoMNvQdpgJ6sWXMrTq',NULL,'qwerty@gmail.com',NULL,NULL,NULL,NULL,1513583153,1517544434,1,'Tri Sunarno ','-','Area Perintis','082325029332',2,NULL,'default.jpg',1,0),

(491,'36.81.29.50','Husni_M','$2y$08$TZmd6UNMjapsmcfCqsERXe98IutB.SUGIl.lB6cEfkjtvQYWkb2Qy',NULL,'qwerty@gmail.com',NULL,NULL,NULL,NULL,1513583508,1518100360,1,'M HUSNI MUBARAK','-','Area Perintis','0823 2502 9992',0,NULL,'default.jpg',1,0),

(492,'36.81.29.50','Sandya_Y','$2y$08$brkKY/2X3cLkXLqW52fWx.BA2JDJP43vlXd3yBnctqx73BqBOmx.2',NULL,'qwerty@gmail.com',NULL,NULL,NULL,NULL,1513583625,NULL,1,'Sandya Yudha','-','Area Perintis','0822 2531 6248',0,NULL,'default.jpg',1,0),

(493,'36.81.29.50','Rahmania_A','$2y$08$vCsxVhqzRwgBr2/ddCx7eONo8hfscEPKKsEAhqUnVC5aOho.lF1di',NULL,'qwerty@gmail.com',NULL,NULL,NULL,NULL,1513583685,NULL,1,'Rahmania Agestiana','-','Area Perintis','085290232800',1,NULL,'default.jpg',1,0),

(494,'36.81.29.50','Yusuf_F','$2y$08$vUqYScOWS2VIF9KVRZaD6uMdnP7Pt/jrwbij2b0mJJs1c2yV5PMuu',NULL,'qwerty@gmail.com',NULL,NULL,NULL,NULL,1513583787,1517570229,1,'Muh Yusuf fisabilillah','-','Area Jabodetabek','089629644765',2,NULL,'default.jpg',1,0),

(495,'36.81.29.50','Ratna_R','$2y$08$JPFawLXHw8H3JTDD/xTihuo9ngpMOMHuhq9ZScnr1yQN3MwnlybqW',NULL,'qwerty@gmail.com',NULL,NULL,NULL,NULL,1513583845,NULL,1,'Ratna rahayu','-','SDM Area Jabodetabek','083871144233',2,NULL,'default.jpg',0,0),

(496,'36.81.29.50','Sabiq_N','$2y$08$Ec1Psy/gIBlyFJeDFN01cOQcdTRQcl/VvtjVepxg7oARgtfXmvj/.',NULL,'qwerty@gmail.com',NULL,NULL,NULL,NULL,1513583968,1513756222,1,'M. Sabiq Naerozi','-','Area Semarang','082300053840',1,NULL,'default.jpg',1,0),

(497,'36.81.29.50','Winoto','$2y$08$Z8IylfCWwx3M4yaq68aOz.j9eJs5OQ3sM86DJ7fPrMg5xo17aP/Va',NULL,'qwerty@gmail.com',NULL,NULL,NULL,NULL,1513584030,1513751681,1,'Winoto','-','Area Semarang','085229632090',2,NULL,'default.jpg',1,0),

(498,'36.81.29.50','Noridah','$2y$08$HFt6WCmxi27oWj/nmU50E.e3YcL7d5KF2R./6QwrvXEkRm7JFX0SS',NULL,'qwerty@gmail.com',NULL,NULL,NULL,NULL,1513584084,1518010194,1,'Noridah','-','Area Semarang','082327323897',2,NULL,'default.jpg',1,0),

(499,'36.81.29.50','Sri_Ambarwati','$2y$08$VuZxEg1UxJ927ATXWFa1xOd1t9f7ajTM7GU1U65X61JMmf2PoA9Jq',NULL,'qwerty@gmail.com',NULL,NULL,NULL,NULL,1513587045,1513751728,1,'Sri Ambarwati','-','Area Semarang','082325030977',2,NULL,'default.jpg',1,0),

(500,'36.81.29.50','Fitria_R','$2y$08$j5lXCBFt46pH1BeKrXSUL.hbnDYjSLbqULMx8LjJMQLLAJJ4mkExa',NULL,'qwerty@gmail.com',NULL,NULL,NULL,NULL,1513587106,NULL,1,'Fitria Ratna N.','-','Area Semarang','082225959863',2,NULL,'default.jpg',1,0),

(501,'36.81.29.50','Wawan_E','$2y$08$wIm9nKGQ8T8whBwT3F1rmeuw./CJTLuZYutNUZlGgFhwBPqZOrcRa',NULL,'qwerty@gmail.com',NULL,NULL,NULL,'T15GH4bA5nDFTDShabcmM.',1513587168,1518244739,1,'Wawan Edi','-','Area Semarang','082225959834',2,NULL,'default.jpg',1,0),

(502,'36.81.29.50','Saqif_Muzaki','$2y$08$va.t8KcC6FiiZvUExtnFJO5ySTs6qYmZ8YOQ2qqIE7TBa7tox1sMi',NULL,'qwerty@gmail.com',NULL,NULL,NULL,NULL,1513587223,1517289702,1,'Saqif Muzaki','-','Area Semarang','082225512072',0,NULL,'default.jpg',1,0),

(503,'36.81.29.50','Moh_Sadid','$2y$08$Dc5C81.ZAyVmZGoYmxvbG.DS/ytIT7zVb3UuoeQMw03pOGdac0OPi',NULL,'qwerty@gmail.com',NULL,NULL,NULL,NULL,1513587295,1515503608,1,'Moh. Sadid','-','Area Semarang','082138031524',0,NULL,'default.jpg',1,0),

(504,'36.81.29.50','AniruL_I','$2y$08$waaQhw4YL1cPBjnD91xJaeTvgFOB2IPwfYjRlt729RLiRYcjeuQ8y',NULL,'qwerty@gmail.com',NULL,NULL,NULL,'GrHnjOKkR59UehY4GiB6su',1513587402,1516197837,1,'Anirul Isnuansari','-','Ares Purwokerto','085712283237',2,NULL,'default.jpg',1,0),

(505,'36.81.29.50','Jumono','$2y$08$VFLrtSvPSrTSnsUi6cOiqefw9TKRx0fAVjDndiY.6bvA1BwcjPLG2',NULL,'qwerty@gmail.com',NULL,NULL,NULL,NULL,1513587479,1515495669,1,'Jumono','-','Area Purwokerto','085603118282',2,NULL,'default.jpg',1,0),

(506,'36.81.29.50','Diah_PWK','$2y$08$pMH5slzwiv5UXcb2s0lImOOla6E/s/N3ZmvhMWLMCwTI3LtdQSETe',NULL,'qwerty@gmail.com',NULL,NULL,NULL,NULL,1513587558,NULL,1,'Diah Purwokerto','-','Area Purwokerto','087737242235',2,NULL,'default.jpg',1,0),

(507,'36.81.29.50','Anggun_W','$2y$08$TAkEK9WnGkQWu6sftuobl.GgBacDl63.kNkVnjRM74NXWdcK9T21K',NULL,'qwerty@gmail.com',NULL,NULL,NULL,NULL,1513587603,NULL,1,'Anggun Widiarini','-','Area Purwokerto','-',1,NULL,'default.jpg',1,0),

(508,'36.81.29.50','Chelly_Y','$2y$08$Qt/RXmGjTYNwuWmadjXqROweIwIHCeoCbQwTtBvIK8Arq/gohLXvK',NULL,'qwerty@gmail.com',NULL,NULL,NULL,NULL,1513587676,1518231249,1,'Chelly Yustiviani','-','Area Purwokerto','085647959957',0,NULL,'default.jpg',1,0),

(509,'36.81.29.50','Setyarini','$2y$08$ZwvpvW83u0ExVzpoCkrToee9RXDvJjpNPMiNLmcZ7avnycLdAA9GK',NULL,'qwerty@gmail.com',NULL,NULL,NULL,NULL,1513587787,NULL,1,'Setyarini','-','Area Purwokerto','083837233044',0,NULL,'default.jpg',1,0),

(510,'36.81.29.50','Martono','$2y$08$j48IQ2CgSz6UxcSY8yIHYefQYfu8MIDPA70jla/IDRSwKGWccp3Dq',NULL,'qwerty@gmail.com',NULL,NULL,NULL,NULL,1513587841,1515463705,1,'Martono','-','P2O Area Purwokerto','085291101936',0,NULL,'default.jpg',1,0),

(511,'36.81.29.50','Muhrom','$2y$08$OueNQr.Qyg0n0FmYSAKNa.vYYuTK/gspznxaCYGK7mB9wEWbh9PPa',NULL,'qwerty@gmail.com',NULL,NULL,NULL,NULL,1513587886,1516410550,1,'Muhrom','-','Area Purwokerto','082225959836',0,NULL,'default.jpg',1,0),

(512,'36.81.29.50','Kemal','$2y$08$mtXfkKOOwT9dZ0439XNltelWrwCtgqNKwQlVSd4u/n4U3EV0MYfYG',NULL,'qwerty@gmail.com',NULL,NULL,NULL,NULL,1513587936,1516442160,1,'Kemal','-','Area Purwokerto','082324868143',0,NULL,'default.jpg',1,0),

(513,'36.81.29.50','Devita','$2y$08$i6q/mBGbCwlQaYtFLK9APu003/SOmPowBYmrupUoywOyEMSH7/9PK',NULL,'qwerty@gmail.com',NULL,NULL,NULL,'h3PoKaRB5rnszyGYDTaBpO',1513587983,1515565948,1,'Devita','-','Area Purwokerto','085640814051',0,NULL,'default.jpg',1,0),

(514,'36.81.29.50','Lilik_W','$2y$08$Dul7cCiogIWQUHNOpZNTDevlanz7iJxFLdvhvN8qhVlEQiI9ML7rq',NULL,'qwerty@gmail.com',NULL,NULL,NULL,NULL,1513588040,1515727891,1,'Lilik Wahyu Kuncoro','-','Area Purwokerto','087834603990',0,NULL,'default.jpg',1,0),

(515,'36.81.29.50','Desi_A','$2y$08$GtxVxGmGC.rqUEEnHDXx1ez6UZVs/98hjnjvMccjddeqelQ3Qwzo6',NULL,'qwerty@gmail.com',NULL,NULL,NULL,NULL,1513588167,1518068934,1,'Desi Aryanti','-','Area Bali','085738208804',0,NULL,'default.jpg',1,0),

(516,'36.81.29.50','Wahyu_Hidayat','$2y$08$DasDjho0LoWxPReyp/PQd.e4.yN0KfECidRGEoVNuyyOU4oXjQy4e',NULL,'qwerty@gmail.com',NULL,NULL,NULL,NULL,1513588263,1516515653,1,'M. Wahyu Hidayat','-','Area Bali','082242065668',2,NULL,'default.jpg',1,0),

(517,'36.81.29.50','Kartika_P','$2y$08$13Sv7WtQCCOOCE3aC6XT2uN8awEG1hTuU2F9DA.MZz6.2KOyFMtJO',NULL,'qwerty@gmail.com',NULL,NULL,NULL,NULL,1513588708,1518249290,1,'Kartika Pratnawati','-','Pusat','085643435165',2,NULL,'default.jpg',1,0),

(518,'36.81.29.50','Juno','$2y$08$DvcUGe564dz6maRB9SZAGOOfTMt/y48h003urxq1o07BtlsR9KHru',NULL,'qwerty@gmail.com',NULL,NULL,NULL,NULL,1513588757,NULL,1,'Herjuno','-','Pusat','-',0,NULL,'default.jpg',1,0),

(519,'36.81.29.50','Bambang_K','$2y$08$j8Ig0lrr7rRKyxvuS/hdJu63h2jrbaGTXBc3xr5zUYmfpxXqV/cm.',NULL,'qwerty@gmail.com',NULL,NULL,NULL,NULL,1513588833,1518142821,1,'Bambang Kurniawan','-','Pusat','085643271009',2,NULL,'default.jpg',1,0),

(520,'36.81.29.50','Agesti_Betty','$2y$08$73KmG8m27CSt48fylGysAeATTOXzVEYcx7PyaeV8BNujjI0B4FAWW',NULL,'qwerty@gmail.com',NULL,NULL,NULL,NULL,1513588891,1517537747,1,'Agesti Betty Eka Pratiwi','-','Pusat','085643350815',0,NULL,'default.jpg',1,0),

(521,'36.81.29.50','Luthfi_Zainal ','$2y$08$QCv9l4Ttql0pYDLSoFnb3OtxEPWrsO4UMVQ7J0IBHS5IZG8ZBB9Ua',NULL,'qwerty@gmail.com',NULL,NULL,NULL,NULL,1513588949,1517455913,1,'Luthfi Zainal Muttaqin','-','Pusat','085743096393',0,NULL,'default.jpg',1,0),

(522,'36.81.29.50','Siro','$2y$08$thKQkYg8k.mg8e85sCo.bOF0FUMM5O98W3BnGwAKggd4ugctGDwUO',NULL,'qwerty@gmail.com',NULL,NULL,NULL,'m5WVsCBNb.Krmv74R13e4O',1513589049,1516240174,1,'Siti Rochmah','-','Pusat','-',0,NULL,'default.jpg',1,0),

(523,'36.81.29.50','Syawal','$2y$08$gIEHHGBJsjwKcHrp2vsu1OUp2TsX5IC.LVu/EFfkic7xfZ/t8FALe',NULL,'qwerty@gmail.com',NULL,NULL,NULL,NULL,1513589111,1516519767,1,'Syawal illery','-','Pusat','085726537373',0,NULL,'default.jpg',1,0),

(524,'36.81.29.50','Arnisa_Rakhmah','$2y$08$l/2IOfMx6fnELRQ3jz4lA.l42WSVcS97R/VZfCSgsMsIZQ.9848dG',NULL,'qwerty@gmail.com',NULL,NULL,NULL,NULL,1513589181,1516236084,1,'Arnisa Rakhmah Jis Malasari','-','Pusat','082327324167',0,NULL,'default.jpg',1,0),

(525,'36.81.29.50','Teguh_Kesra','$2y$08$pGt3xY9Hv.f7xgyyIi56KeOQv/sg4Psd1h.bXktOXwSBapEs.34da',NULL,'qwerty@gmail.com',NULL,NULL,NULL,NULL,1513589282,1516325509,1,'Teguh','-','Pusat','-',0,NULL,'default.jpg',1,0),

(526,'36.81.29.50','Imam_Wibowo','$2y$08$9TiSXhqmgQZyHMgxFnJ08u2/rFJxlNkGGSaokJTG7/07nKgXhK5eO',NULL,'qwerty@gmail.com',NULL,NULL,NULL,NULL,1513589350,1516330675,1,'Imam Wibowo','-','Pusat','082328286392',2,NULL,'default.jpg',1,0),

(527,'36.81.29.50','Haryanti','$2y$08$F76UXl8xTslQvme09Wz.IuqAB9qz0tClCYn3RrEjODq8RNw86ZiI2',NULL,'qwerty@gmail.com',NULL,NULL,NULL,NULL,1513589401,NULL,1,'Haryanti','-','Pusat','082225511973',2,NULL,'default.jpg',1,0),

(528,'36.81.29.50','Irvan_BOY','$2y$08$6b0vjEEAyWVQN5ePgec9juiRLRsKWc3syrBJALAH7ZBFSDe9ogvC6',NULL,'qwerty@gmail.com',NULL,NULL,NULL,NULL,1513589475,1516333163,1,'Irvan Nir Sudibyanto','-','Pusat','085647201231',2,NULL,'default.jpg',1,0),

(529,'36.81.29.50','Fariza_RR','$2y$08$B5bH.2rkSK.mDrx.Xz6dDeelC3kio81c7jIKNbS0oNR/MRPGOc6o2',NULL,'qwerty@gmail.com',NULL,NULL,NULL,NULL,1513589539,1515834607,1,'Fariza Rosyidina','-','Pusat','082325029375',2,NULL,'default.jpg',1,0),

(530,'36.81.29.50','David_G','$2y$08$AZtNSMOpTus2w1PjCAEtoei3j83hvMSCrrFRxatKb6/y1WtpRmh1e',NULL,'qwerty@gmail.com',NULL,NULL,NULL,NULL,1513589598,NULL,1,'David Gilang Suharyono','-','Pusat','085743451117',2,NULL,'default.jpg',1,0),

(531,'36.81.29.50','Heriyanto','$2y$08$lvcJghdwmvorEn4c3F65iOhNAX7bvpriWGm5gDWsdER0blR5obBA2',NULL,'qwerty@gmail.com',NULL,NULL,NULL,'ftQ3zzRMfg01NnG/WrHDkO',1513589659,1516173225,1,'Heriyanto','-','Pusat','089650396691',0,NULL,'default.jpg',1,0),

(532,'36.81.29.50','Hosnan_R','$2y$08$X2qzi3R1eHiPUkdBaT3P8.i/qy9qIXGQoSZ.OWy2IDPkOh2hAiq2.',NULL,'qwerty@gmail.com',NULL,NULL,NULL,NULL,1513589716,NULL,1,'Hosnan Riadi','-','Pusat','082211815971',0,NULL,'default.jpg',1,0),

(533,'36.81.29.50','Dwi_F','$2y$08$xicAgJlhajpypbMPMstOaub6mtAnEGjGPqzY0SV/r2svNEcuNy3eK',NULL,'qwerty@gmail.com',NULL,NULL,NULL,NULL,1513650045,1516429232,1,'Dwi Febriani','-','Area Jogja','085743000150',1,NULL,'default.jpg',1,0),

(534,'36.81.29.50','Totok_A','$2y$08$4SI3wYJE9B4/WbZxGyETKuZsZKE9veQf6kRk5KBjsw34jhNFLCyO2',NULL,'qwerty@gmail.com',NULL,NULL,NULL,NULL,1513650146,1516182011,1,'Totok Aryanto','-','Area Jogja','085743000150',0,NULL,'default.jpg',1,0),

(535,'36.81.29.50','Steven_H','$2y$08$APyAKPWfOhsEKYdGd/GuVeTrOdx.tSzfQIld76h7TG5KZH4nPevQG',NULL,'qwerty@gmail.com',NULL,NULL,NULL,NULL,1513650253,1515823565,1,'Steven Hendras Cahya','-','Area Jogja','085624245757',0,NULL,'default.jpg',1,0),

(536,'36.81.29.50','Nila_N','$2y$08$23TzGY73EICJmeud6YUwPO3M8NZo6stwpYG8CtbLGnNzdCOcRTwKy',NULL,'qwerty@gmail.com',NULL,NULL,NULL,'pX/65uvv62Nd/t/CtYlSue',1513650371,1515392872,1,'Nila Nuria Rahmawati','-','Area Jogja','085743322333',0,NULL,'default.jpg',1,0),

(537,'36.81.29.50','Bobby_R','$2y$08$kHvtrfi3Fse2DmeLAKUCiOklNy59yZ./IruCdh5asZVG.IMhrqJCy',NULL,'qwerty@gmail.com',NULL,NULL,NULL,NULL,1513651008,1516008077,1,'Bobby Restya Putra','-','Area Jogja','085647195377',0,NULL,'default.jpg',1,0),

(538,'36.81.29.50','Ari_Setya','$2y$08$2q7DjUDZWTJyXSUojf52oezHhIrgTLyZOxfGKmlY01ggUimUCg8l2',NULL,'qwerty@gmail.com',NULL,NULL,NULL,NULL,1513651265,1516522426,1,'Ari Setya Saputra','-','Area Jogja','085743691992',2,NULL,'default.jpg',1,0),

(539,'36.81.29.50','Edy_S','$2y$08$wHCyIth1FBOFjHVT2h7Xv.92EjaIl0U1vx5NBPkIE7ZrbpkD9m55O',NULL,'qwerty@gmail.com',NULL,NULL,NULL,NULL,1513651363,NULL,1,'Edy Santoso','-','Area Jogja','085729726729',1,NULL,'default.jpg',1,0),

(540,'36.81.29.50','Arif_B','$2y$08$qej2XxLAMoKfXu2THggIt.l1rVdP/MZsvgymh1749p5yndpwowoEm',NULL,'qwerty@gmail.com',NULL,NULL,NULL,NULL,1513651418,NULL,1,'Arif Budiarto','-','Area Jogja','082227513445',1,NULL,'default.jpg',1,0),

(541,'36.81.29.50','doni','$2y$08$DieioWQut6HmIuBeBqG4vuOO.y6NEbcZcGFSv.D0Pg9MuSgnAI8ki',NULL,'ss@ss.com',NULL,NULL,NULL,NULL,1513651553,1516083839,1,'Doni Kristiawan','-','SDM Pusat','0',0,NULL,'default.jpg',1,0),

(542,'36.81.29.50','Husein_Y','$2y$08$Xcbg6ni1YJTVrXty8ZFlZORxWxPc1n38tqLXNShK53j0F7sO36H2e',NULL,'qwerty@gmail.com',NULL,NULL,NULL,NULL,1513651818,1515758255,1,'Husein Yulianto','-','Area Jogja','082225511718',2,NULL,'default.jpg',1,0),

(543,'36.81.29.50','Farid_S','$2y$08$4cm01xaAgetsdPx.HK8qWu6K5Q1H9caYWczATf12nRzu.Z7VbjojO',NULL,'qwerty@gmail.com',NULL,NULL,NULL,NULL,1513651936,1516010991,1,'Muhammad Farid Sugiyo Utomo','-','Area Jogja','085725095296',2,NULL,'default.jpg',1,0),

(544,'36.81.29.50','Rullani_I','$2y$08$yZYCWpXmzFs/1DGLExMP8Oxz0UVZGQqeZ9YGvf.wtzZy0fngJJ.zG',NULL,'qwerty@gmail.com',NULL,NULL,NULL,NULL,1513651981,NULL,1,'Rullani Indra Gartika','-','Area Jogja','085741860559',2,NULL,'default.jpg',1,0),

(545,'36.81.29.50','arista','$2y$08$OPghDLwWRk20yFHBsjwb.uAjLpMUgxAW2.nJXqQ1uGSHAB.jK4oPK',NULL,'ff@ss.cc',NULL,NULL,NULL,NULL,1513655244,1516252516,1,'arista','-','SDM PUSAT','0',0,NULL,'default.jpg',1,0),

(546,'180.253.129.48','Maria_N','$2y$08$/6J8wxFkJ05B6xBS4OLrhuJnsPME4Xc05sY8k6iDO2MXeJoZBAEPu',NULL,'qwerty@gmail.com',NULL,NULL,NULL,NULL,1513829303,1518075094,1,'Maria Novalina','-','Area Malang','085743497971',2,NULL,'default.jpg',1,0),

(547,'180.253.129.48','Wayan_S','$2y$08$rN0xB/DhrGRA81/wQkU1I.ZmOIoMDlIKAWUtiPGfxFJ2XHwNUGvn2',NULL,'qwerty@gmail.com',NULL,NULL,NULL,NULL,1513829377,1517987679,1,'I Wayan Surya Jaya','-','Area Malang','085646466832',2,NULL,'default.jpg',1,0),

(548,'180.253.129.48','Ria_S','$2y$08$OhiD6Ygj9yvcivfW.0CSd.vJx9V86PGvPr/s/Yr1voq8TYwR2dEwW',NULL,'qwerty@gmail.com',NULL,NULL,NULL,NULL,1513829445,1518680839,1,'Ria Siti Nurjanah','-','Area Malang','081945700300',2,NULL,'default.jpg',1,0),

(549,'180.253.129.48','Ervin_K','$2y$08$uyx2/iiX7chy6b3ls0Fom.1.1FqzjiJv7Dtj98j0Ap8V/bzG.zpvm',NULL,'qwerty@gmail.com',NULL,NULL,NULL,NULL,1513829500,1518074118,1,'Ervin Kurniawan','-','Area Malang','085602936429',2,NULL,'default.jpg',1,0),

(550,'180.253.129.48','Yunita_W','$2y$08$N9HL2toEyxaNSfZmpGDI2e2d8ejkVDNbQWL5/nQNQyaCqnDU/ru7W',NULL,'qwerty@gmail.com',NULL,NULL,NULL,NULL,1513829555,1518142073,1,'Yunita Woro Setyani','-','Area Malang','085729933280',0,NULL,'default.jpg',1,0),

(551,'180.253.129.48','Fathkur_M','$2y$08$IuuKaaMUU0ozDjmWH1fx4OJNquE/OlV40H18wdtUPPJcgKjICsYJ2',NULL,'qwerty@gmail.com',NULL,NULL,NULL,NULL,1513829621,1518083283,1,'Fathkur Muttaqin Amin','-','Area Malang','085790860246',0,NULL,'default.jpg',1,0),

(552,'180.253.129.48','Dewi_A','$2y$08$TBARL0KqyjVg1b6O3ibDFu3Hr6DLnDccuN9jOUCw6fO9I0nniehKK',NULL,'qwerty@gmail.com',NULL,NULL,NULL,NULL,1513829668,NULL,1,'Dewi Ayu Shifa','-','Area Malang','085784878326',1,NULL,'default.jpg',1,0),

(553,'180.253.129.48','sulistya','$2y$08$X96Me0SQO/xeZ3lxcJLpYu7UuWoYJkSKb7mbIptda3xA50F4HJp6O',NULL,'sulistio@sulistio.com',NULL,NULL,NULL,'mips3OZdIP6K5PS0Lfrnhe',1513924121,1515893369,1,'Bambang Sulistya','-','Kasi Kesetariatan Direktur','0',0,NULL,'default.jpg',1,0),

(554,'180.253.129.48','imas','$2y$08$tnKT1GbfG5n8iDkHU7ISA.8XlD6Gcp3Azxg0wsjMssitPDZ2uu7Nq',NULL,'ss@ss.com',NULL,NULL,NULL,NULL,1513932110,1515132212,1,'Imas Adriyanto','-','Kasi Pengembangan Usaha','0',0,NULL,'default.jpg',1,0),

(555,'180.253.129.48','widyatmoyo','$2y$08$0oeaH6SdHlXBWUVDf6mnM.BCmnuWzWQmpnHBHWAVZ32k.Pew8rjw2',NULL,'waroengss@ss.com',NULL,NULL,NULL,NULL,1514014582,NULL,1,'Widyatmoyo','-','wareong ss','6283840691645',0,NULL,'default.jpg',1,0),

(556,'180.253.129.48','galihw','$2y$08$ULjdU3LJ405yBiZvsBiaaux5bp4FZBXCmT4Glm1CPPPPxdaw/3cq2',NULL,'waroengss@ss.com',NULL,NULL,NULL,'hZsBSRnLk/rNBsaYsC3yBu',1514014685,1514864623,1,'Galih Wicaksono','-','wareong ss','6281328777315',0,NULL,'default.jpg',1,0),

(557,'180.253.129.48','yosibs','$2y$08$UwGVkBFaIDzo0Qsn9/GId.oCxsxa.lxrb5epD/AZs1Ak1vmSXOXDq',NULL,'waroengss@ss.com',NULL,NULL,NULL,'6IkIktdDxJssQ8VEVNDEVu',1514014771,1518513234,1,'Yosi Bestari','-','wareong ss','6285643467780',0,NULL,'default.jpg',1,0),

(558,'180.253.129.48','galihap','$2y$08$dkbQBwKO4RwmxEKCebA4OOdv/HagRk33sBdI3eov0EUD6o7tGjcWa',NULL,'waroengss@ss.com',NULL,NULL,NULL,'4yUWpREZNgdestQvOFLte.',1514282480,1518055322,1,'Galih Adi Prakoso','-','waroeng ss','085229632125',2,NULL,'default.jpg',1,NULL),

(559,'36.79.129.170','ave','$2y$08$3OsYum7VN8/To2xIE1BL9.Xe/ssO8DEFXVlT2tXG6Ti7/W.EpZBxO',NULL,'avecopo89@gmail.com',NULL,NULL,NULL,NULL,1514530714,1514780944,1,'Ave','-','SDM Kesdan Pusat','082138211113',0,NULL,'default.jpg',1,NULL),

(560,'36.81.95.214','Trida_T','$2y$08$C08XUymDFA9O1i9Yy7RNU.Fmq6jbuoMM//UcMJm022DUF1zf0FwjO',NULL,'qwerty@gmail.com',NULL,NULL,NULL,NULL,1514963917,NULL,1,'Trida Tarunis','-','WSS Kisamaun','-',0,NULL,'default.jpg',1,NULL),

(561,'36.81.95.214','agil','$2y$08$mlZDrmtwozDU74BWdaSv5ORFQJq0/MLaHUv4BzvlUczXdGImkESB.',NULL,'agil.agil@agil.com',NULL,NULL,NULL,NULL,1514971033,NULL,1,'Agil Saputro','-','SS Purwokerto GOR','082322819377',0,NULL,'default.jpg',1,NULL),

(562,'36.81.95.214','Widyawati','$2y$08$gEOzQbwST5RDEVTwtLKDeOGeKv.7WFvhxGGdzfIxmVhV1iGK1ACp6',NULL,'wid@wid.com',NULL,NULL,NULL,NULL,1514971085,NULL,1,'Widyawati','-','SS Purwokerto GOR','082325029461',0,NULL,'default.jpg',1,NULL),

(563,'36.81.95.214','gusfaj','$2y$08$kvieSsTUD00nkzuDK8hFv.Aynx4gcTYvPuiFe.do3fVWr3llVBAfK',NULL,'ss@ss.com',NULL,NULL,NULL,NULL,1515124008,NULL,1,'Gusfaj Cahyaasdendra yoga','-','Manager Area Malang','0',0,NULL,'default.jpg',1,NULL),

(564,'36.81.95.214','rochmadyoni','$2y$08$7fQ5Fvu8t69y4GeSP1yf8OAHWUn9xDJ5aKBEituXMT6JQjphGZRcW',NULL,'ss@ss.com',NULL,NULL,NULL,NULL,1515124073,1516085145,1,'rochmadyoni','-','Staf resep Malang','0',2,NULL,'default.jpg',1,NULL),

(565,'36.81.95.214','kurniawan','$2y$08$jT7121/1QOknP1Xd9wNnau1s9pKQA/66w1azonaP7W8C6krrv5772',NULL,'ss@ss.com',NULL,NULL,NULL,NULL,1515124147,1516359667,1,'kurniawan Pratama Arifin','-','Staff Training','0',0,NULL,'default.jpg',1,NULL),

(566,'36.81.95.214','adi','$2y$08$3OvAqIH5rS7eEoupjXMuluJ.K4FMsCpGtVtWPR9Qb5h.vnZnN7b66',NULL,'ss@ss.com',NULL,NULL,NULL,NULL,1515124419,1518000185,1,'adi wibowo','-','Staf PSA Produksi','0',2,NULL,'default.jpg',1,NULL),

(567,'36.81.95.214','andhika','$2y$08$ffi8vZrvd4m3CvntEnnZ8up18PpXO6eMRPwhSSgZ7UmyDKrmwzFm2',NULL,'ss@ss.com',NULL,NULL,NULL,NULL,1515124536,1516351528,1,'andhika dian pratama','-','Pjk Kaur Event dan KRT','0',0,NULL,'default.jpg',1,NULL),

(568,'36.81.95.214','rohiyatul','$2y$08$TQqUcuorq3TC/.t1Zk0n3.CTNBPI9o0tpONRZeO1SxtDxvOIu4eOe',NULL,'ss@ss.com',NULL,NULL,NULL,NULL,1515124647,NULL,1,'rohiyatul zannah','-','Staf resep masak Malang','0',2,NULL,'default.jpg',1,NULL),

(569,'36.81.95.214','diva','$2y$08$aMVPlnu7QfWgYr6L5D/bauE9X8HEtGWpUzIZKy7PPnH5OkkqdWOvi',NULL,'wareongss@ss.com',NULL,NULL,NULL,NULL,1515206245,NULL,1,'Diva Etri Dewinta','-','wareong ss','6285848961936',2,NULL,'default.jpg',1,NULL),

(570,'36.73.90.218','yusufadi','$2y$08$NdWhwQ6D0zljzCsb22NfNuNrsOaAzg6Dmfq9Y9HY.k80.OX/xx89.',NULL,'wareongss@ss.com',NULL,NULL,NULL,NULL,1515233425,NULL,1,'Yusuf Adi Sulistya','-','wareong ss','6289619962416',2,NULL,'default.jpg',1,NULL),

(571,'36.82.16.68','Allifa','$2y$08$0yXrExy4LoOiZkFZbBbHguCs6H.kd/MQcfmPKPv5NzHqShwW8NZ3e',NULL,'allifa.zaqie@facebook.com',NULL,NULL,NULL,NULL,1515302759,NULL,1,'Allifa Muzakkia','-','SS Ciliwung','089680614491',0,NULL,'default.jpg',1,NULL),

(572,'36.82.16.68','birin','$2y$08$fQst6al8OE7vej6oKzVbp.6mJh1xnO8JZaqbZwPQ0LWfsXyIgB4i.',NULL,'ardi@sob.com',NULL,NULL,NULL,NULL,1515303303,NULL,1,'Ardi Shobirin','-','SS Ciliwung','085790904873',0,NULL,'default.jpg',1,NULL),

(573,'36.73.90.218','ratriw','$2y$08$ljLAGNl7Jo4PK.tO83fRoehReTc//ybpNHWZGzdeeN51fnuLJ7zsW',NULL,'ss@ss.com',NULL,NULL,NULL,NULL,1515309966,1515310042,1,'Ratri Widiastuti','-','waroengss','097',2,NULL,'default.jpg',1,NULL),

(574,'36.82.16.68','indang','$2y$08$a28DtvkmIOlB1WZ/m.zUX.3Y7z/RFtj9NNRSZUYbDEfXUTD.4MF5y',NULL,'in@dang.com',NULL,NULL,NULL,NULL,1515328460,NULL,1,'Indang  Sri Utami','-','SS Ciliwung','-',0,NULL,'default.jpg',1,NULL),

(575,'36.82.16.68','hidayati','$2y$08$SGAha7CElc7nrZVFAcFsAuxYlzp7VXy3hboUqPWLpr9pAGmo4yRHS',NULL,'sof@ia.com',NULL,NULL,NULL,NULL,1515328648,NULL,1,'Nurul Hidayati','-','SS Ciliwung','-',0,NULL,'default.jpg',1,NULL),

(576,'36.73.90.218','irlando','$2y$08$4rKVQhfF4qr61u.5oV.6eeqLJYgDQBnjEVVpCdPce7N65P2zTf7SC',NULL,'ss@ss.com',NULL,NULL,NULL,NULL,1515392886,1517982574,1,'irlando surya dwiputra','-','rumah tangga pusat','082325029335',0,NULL,'default.jpg',1,NULL),

(577,'36.73.90.218','bayu','$2y$08$gApXggxqmEyPkv.b.nTkg.aXSjpjUT3wvoStCocfcXKQqswSaAEGC',NULL,'ss@ss.com',NULL,NULL,NULL,NULL,1515404340,NULL,1,'bayu khristanto','-','SMD Area Semarang','085641762626',0,NULL,'default.jpg',1,NULL),

(578,'125.164.102.47','zannah','$2y$08$tnTmCgddHgrYo/SmLf111O1Fz8m5uqPIIspb0ocjvIuXXi2zfOdKa',NULL,'ninarohiyatul@gmail.com',NULL,NULL,NULL,NULL,1515639851,1517383192,1,'Rohiyatul','Zannah','Area malang','082245490686',2,NULL,'default.jpg',1,NULL),

(579,'36.73.70.174','yuni','$2y$08$WbeUIc4yOdxUzy2RY15EC.RwwtxzGu5IAGxRBrU.J4XWCX1LF1NG2',NULL,'ss@ss.com',NULL,NULL,NULL,NULL,1515663038,NULL,1,'Yuni Anitawati','-','PAPG Pusat','085326834944',1,NULL,'default.jpg',1,NULL),

(580,'36.73.70.174','darul_n','$2y$08$SZ0cV7EOKrxs.e8MrL41Jul73iQHY9CMaZV2fmLnx/e7oeW8a76Tu',NULL,'wareongss@ss.com',NULL,NULL,NULL,NULL,1515725052,NULL,1,'Darul Nikmah','-','wareong ss','085826254465',0,NULL,'default.jpg',1,NULL),

(581,'36.73.70.174','testuser','$2y$08$l4hKqrcsWa4ZkM/.RdZR4eLSqVcSYQ54ViXjRWeudW5P7GvKj0/sq',NULL,'wareongss@ss.com',NULL,NULL,NULL,NULL,1515739034,NULL,1,'testuser','-','wareong ss','123456',0,NULL,'default.jpg',1,NULL),

(582,'36.73.70.174','gandung','$2y$08$PwJvv37D8tDWEjjon5hmjepVWw5P9/EvYoxA2Hu917Aaa7Yf7OJya',NULL,'ss@ss.com',NULL,NULL,NULL,NULL,1515753969,NULL,1,'agus wibowo','-','RT','0',0,NULL,'default.jpg',1,NULL),

(583,'36.73.70.174','ricki','$2y$08$by4ErcHFeHqXRUqzujEKh./mjG39mhOrCOVKZ5.CKrom3z5D1shc2',NULL,'ss@ss.com',NULL,NULL,NULL,NULL,1515754069,1516511865,1,'Ricki Setiawan','-','IT Pusat','08157957407',0,NULL,'default.jpg',1,NULL),

(584,'36.73.70.174','rizko','$2y$08$4P7igFv6D3YAlb0C7Xf7k.BHBdHz7IJz91ZpLXjephi9U3uoA57iu',NULL,'ss@ss.com',NULL,NULL,NULL,NULL,1515754712,1515814360,1,'Rizko dermawan','-','IT Pusat','082243909173',0,NULL,'default.jpg',1,NULL),

(585,'36.73.70.174','ekky','$2y$08$F7TVAdaNZadeBbNL7dHXRORy9YWAgoaW03VmeAzjeJZD0W6MjKGKK',NULL,'ss@ss.com',NULL,NULL,NULL,NULL,1515754780,1517294621,1,'Ekky setiyawan','-','IT Purwokerto','085775671598',0,NULL,'default.jpg',1,NULL),

(586,'180.246.176.238','iip','$2y$08$IyD2AaZGbnBfqJMOYMB8KuVwFemHRl.HaOqU8UU74zZK6IpQXlb9.',NULL,'ss@ss.com',NULL,NULL,NULL,NULL,1515765171,NULL,1,'iip shoifuddin','-','IT','081903987988',0,NULL,'default.jpg',1,NULL),

(587,'180.246.176.238','apri','$2y$08$u5fPIiPehJUEoSVjddu4MuhxiL1qAZausZ7pfm0hYZsBAS18xV4Fy',NULL,'ss@ss.com',NULL,NULL,NULL,'AvUq89dSWoHM4RJ4EtA7O.',1515765235,1515811716,1,'Apri Rimawan','-','IT','085879433335',0,NULL,'default.jpg',1,NULL),

(588,'36.73.70.174','khalista_az','$2y$08$WLKFXgEsJQ4GSj3YxaxuSORCxbXiN7jlfzKd8Fxbb0SKLMJv/yTLi',NULL,'wareongss@ss.com',NULL,NULL,NULL,'dW6kduyZ5Ib69/fgql94gO',1515815837,1516246140,1,'Khalista azti hutami','-','wareong ss','12345',2,NULL,'default.jpg',1,NULL),

(589,'36.73.105.216','nur_ari','$2y$08$OE6exMyfz7Ekk8qidjMRLe5Z4.YWnjBAKGHce0FdphyPkRK02c48G',NULL,'wareongss@ss.com',NULL,NULL,NULL,NULL,1516092766,1516175171,1,'Nur Ari Siti Sundari','-','wareong ss','6285290131525',0,NULL,'default.jpg',1,NULL),

(590,'202.43.93.6','antok','$2y$08$FTIlJPn.1Qtfq18F0As58um3fXu/f6xx3A0fSV16I0btigk9DXgfW',NULL,'ss@ss.com',NULL,NULL,NULL,NULL,1516423037,NULL,1,'antok sumarwan','-','Pengadaan Wonosari','087738916787',0,NULL,'default.jpg',1,NULL),

(591,'202.43.93.6','wiwit','$2y$08$yEnXiH4arV34aT.b/pkwsO4Cb7ZjUmvg5cYJLF/cXRob2vAAj5ana',NULL,'ss@ss.com',NULL,NULL,NULL,NULL,1516423128,NULL,1,'wiwit','-','Pengadaan Besi Mandiri','082325029336',0,NULL,'default.jpg',1,NULL),

(592,'36.73.105.216','yusuf','$2y$08$8kN773oVZUyY215E6YDqdOAVf2Lyg6DzhOfhWdJteutDV5CCXyYq6',NULL,'ss@ss.com',NULL,NULL,NULL,NULL,1516614965,NULL,1,'Andri yusuf hendroyono','-','WAPG ungaran','085868687764',0,NULL,'default.jpg',1,NULL),

(593,'180.254.93.75','Anisa_I','$2y$08$sk/SwzI92mnb4/2aA/sX5eC074PS4CwiXRg6QsEizMJ1YooJMv/Ai',NULL,'qwerty@gmail.com',NULL,NULL,NULL,NULL,1516861180,NULL,1,'Anisa Indira','-','Area Jogja','082325029380',0,NULL,'default.jpg',1,NULL),

(594,'180.254.93.75','Heda_A','$2y$08$EdUR2ZYGqZc7lyKhzSXSselujjYSIiC6kg8huf0MsRI73b3fQnbWy',NULL,'qwerty@gmail.com',NULL,NULL,NULL,NULL,1516861275,NULL,1,'Heda Anggitasari','-','Area Jogja','082225511857',0,NULL,'default.jpg',1,NULL),

(595,'180.254.93.75','febriani_tm','$2y$08$ZN/OMpFG85DW19D53uBMy.5q1i5PtETZzbKR4ctZpTWSkzbpRqm7a',NULL,'wareongss@ss.com',NULL,NULL,NULL,NULL,1517047901,NULL,1,'Febriani tri Mayasari','-','wareong ss','123456',0,NULL,'default.jpg',1,NULL),

(596,'36.80.212.175','ervi','$2y$08$5K29Dov96SPICIftUpK/re/5HmhGjXzYwzJArWj1EO3kEeUi8sTrK',NULL,'ss@ss.com',NULL,NULL,NULL,NULL,1517133879,1517459246,1,'Ervi Yuni Winarka','-','Kasi Event Pusat','0',0,NULL,'default.jpg',1,NULL),

(597,'112.215.241.159','Solek','$2y$08$nnxLJLsE7/ZLwPtAcQQ.EOqxTSmB/SAF5Xrd5SVn1vByxhCDd.RwS',NULL,'solek@yahoo.com',NULL,NULL,NULL,NULL,1517141131,NULL,1,'Solek','-','Saya kisamaun','-',0,NULL,'default.jpg',1,NULL),

(598,'36.80.212.175','wahyu','$2y$08$JZfMPwi1kr1HLcoBNADCruLRpClXR.ycUiVSU2LPlSoJbsF8gpWse',NULL,'ss@ss.com',NULL,NULL,NULL,NULL,1517218427,NULL,1,'wahyu setyo bekti','-','Patroli pedas Magelang','085801519823',0,NULL,'default.jpg',1,NULL),

(599,'172.31.29.69','farhanudin','$2y$08$BKuGdJM2aN7T7rUW//B45erKOI48CTSk.yNm4L2Kh7ogBHMOwQLZW',NULL,'ss@ss.com',NULL,NULL,NULL,NULL,1517289310,NULL,1,'farhanudin','-','Gudang magelang','089613711944',0,NULL,'default.jpg',1,NULL),

(600,'172.31.39.24','lestari','$2y$08$DQ2Dzacfm.BgGUhXiTL6UO5NfJRjQsq/Rpde18nArtI0ehFR.Ibxm',NULL,'ss@ss.com',NULL,NULL,NULL,NULL,1517294166,NULL,1,'Budi Lestari','-','Ass Keuangan Magelang','085878472296',0,NULL,'default.jpg',1,NULL),

(601,'180.245.210.119','buang','$2y$08$.E8Q/un4wGcazm7pig7TguftoltLr1W0HsWyWP/H0T2pDcLvBrp/q',NULL,'ss@ss.com',NULL,NULL,NULL,NULL,1517295680,NULL,1,'buang setiawan','-','Kacab Besi','082325029344',0,NULL,'default.jpg',1,NULL),

(602,'180.245.210.119','Putri','$2y$08$2q72dmAd0zBeLmisAXXoyuEwjAN2y.WRauDa5kL7vtKST2fFm4vv.',NULL,'ss@ss.com',NULL,NULL,NULL,NULL,1517295758,NULL,1,'Tri Putri Setyowati','-','Ass Produksi Besi','088216703543',0,NULL,'default.jpg',1,NULL),

(603,'180.245.210.119','Astuti','$2y$08$.hTgG8J.FVldpmQ2S1EC7.cslkJvy4NWDrXvBZXpYmz0OJzMkoTd.',NULL,'ss@ss.com',NULL,NULL,NULL,NULL,1517295818,NULL,1,'Yunita Astuti','-','Asisten Operasional Besi','085292333930',0,NULL,'default.jpg',1,NULL),

(604,'180.245.210.119','vera_nur','$2y$08$XLlpfDG7z82bfRYf2YwuL.1aYDhX/7FeR3FH63RCBiET4JFNQnKrK',NULL,'ss@ss.com',NULL,NULL,NULL,NULL,1517295875,NULL,1,'Vera Nur Septianingsih','-','Asisten Keuangan Besi','085878954461',0,NULL,'default.jpg',1,NULL),

(605,'180.245.210.119','Widjanarko','$2y$08$wmgy4B2x4jW8XvPEtl6dIeaRRyOUI5FRS61mAkGPjSAuOE4F1ZoWG',NULL,'ss@ss.com',NULL,NULL,NULL,NULL,1517295915,NULL,1,'Widjanarko','-','Asisten Pengadaan Besi','082325029336',0,NULL,'default.jpg',1,NULL),

(606,'172.31.39.24','didin','$2y$08$MO3ZIWebGcACPL1atB/feuu85O5HPodjlv2ad7zVjuEDdBsGCT45.',NULL,'ss@ss.com',NULL,NULL,NULL,NULL,1517371974,NULL,1,'didin mulyosari','-','Pjs Ass keuangan Sengkaling','0',0,NULL,'default.jpg',1,NULL),

(607,'36.80.227.162','fayoga','$2y$08$CE0ozXbBhDcZcmdANVqQkuufJiMDw5crjBReT8lBQqPrHi9aHpjxS',NULL,'wareongss@ss.com',NULL,NULL,NULL,NULL,1517649733,NULL,1,'Muhammad Fayoga','-','wareong ss','0895394611237',0,NULL,'default.jpg',1,NULL),

(608,'120.188.86.166','Fauzi','$2y$08$iQodeVlmmHmCfJbbA75hIeN2IGTJZXmcpPg8pXPVVuCUTGJYAoF6C',NULL,'fauzi@gmail.com',NULL,NULL,NULL,NULL,1517926605,NULL,1,'Fauzia Salshabilla','-','SS Besi','085780870368',0,NULL,'default.jpg',1,NULL),

(609,'172.31.44.111','miyati','$2y$08$a3PHCiHHxOPdXy8DUKmn3ejI5RoGpXel33/b0XD7YhZvila9x4RZm',NULL,'ss@ss.com',NULL,NULL,NULL,NULL,1518011384,NULL,1,'Isrohmiyati','-','Ss','12345',0,NULL,'default.jpg',1,NULL),

(610,'36.73.53.33','purnomo','$2y$08$hxVy3t6yH/ubkPorCBb2Heq4TiCxL7wZWUrOHeBa.6hb5JvT7OC.G',NULL,'qwerty@gmail.com',NULL,NULL,NULL,NULL,1518141620,NULL,1,'Purnomo','-','wss palagan','-',0,NULL,'default.jpg',1,NULL),

(611,'172.31.21.245','ani_y','$2y$08$06DKsR.VynK0ZF5.TYaxL.Lof5djGTX3WNmd1Xt4zTnCUGuFmV7Gu',NULL,'qwerty@gmail.com',NULL,NULL,NULL,NULL,1518237222,NULL,1,'ani yuriah','-','Pusat','',0,NULL,'default.jpg',1,NULL),

(612,'36.73.53.33','chintya_a','$2y$08$YsYJYw6.jTzO1Vq/QbGjJ.9FixaYhZC6slBReRXSep05EJ0sXLYoi',NULL,'qwerty@gmail.com',NULL,NULL,NULL,NULL,1518319386,NULL,1,'chintya agusti','-','wss besi','085867508486',0,NULL,'default.jpg',1,NULL),

(613,'36.72.212.34','Tri_Sutrisno','$2y$08$8ktMhWbh52Flg1aE.vvyE.NWOWzS3kg4OGuq1dPA7osQ2LTZiqL9C',NULL,'qwerty@gmail.com',NULL,NULL,NULL,NULL,1518663253,NULL,1,'Tri Sutrisno','-','Wss Tembalang 2','089510023653',0,NULL,'default.jpg',1,NULL),

(614,'36.72.212.34','Febby_E','$2y$08$QQP7.CwledDv7l2KT54cNevk9t1RrS183oiWPgsjuRuUbdZVUs9By',NULL,'qwerty@gmail.com',NULL,NULL,NULL,NULL,1518667443,NULL,1,' Febby Eka Setiawan','-','Wss Pati','081391416706',0,NULL,'default.jpg',1,NULL);

/*Table structure for table `users_groups` */

DROP TABLE IF EXISTS `users_groups`;

CREATE TABLE `users_groups` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(11) unsigned NOT NULL,
  `group_id` mediumint(8) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `uc_users_groups` (`user_id`,`group_id`),
  KEY `fk_users_groups_groups1_idx` (`group_id`),
  CONSTRAINT `FK_users_groups_groups` FOREIGN KEY (`group_id`) REFERENCES `groups` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION,
  CONSTRAINT `FK_users_groups_users1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

/*Data for the table `users_groups` */

insert  into `users_groups`(`id`,`user_id`,`group_id`) values 

(1,25,1),

(2,44,1),

(3,428,1);

/*Table structure for table `wilayahkerja` */

DROP TABLE IF EXISTS `wilayahkerja`;

CREATE TABLE `wilayahkerja` (
  `wilayahKerjaID` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `wilayahKerjaName` varchar(20) NOT NULL,
  `createdDate` datetime DEFAULT NULL,
  `createdUserID` int(11) unsigned DEFAULT NULL,
  PRIMARY KEY (`wilayahKerjaID`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

/*Data for the table `wilayahkerja` */

insert  into `wilayahkerja`(`wilayahKerjaID`,`wilayahKerjaName`,`createdDate`,`createdUserID`) values 

(1,'Manajemen','2018-02-18 17:02:43',44),

(2,'Waroeng','2018-02-18 14:01:52',44);

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
