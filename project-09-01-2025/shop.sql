/*
SQLyog Community v12.4.0 (64 bit)
MySQL - 5.6.12-log : Database - shop
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`shop` /*!40100 DEFAULT CHARACTER SET latin1 */;

USE `shop`;

/*Table structure for table `auth_group` */

DROP TABLE IF EXISTS `auth_group`;

CREATE TABLE `auth_group` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(80) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `auth_group` */

/*Table structure for table `auth_group_permissions` */

DROP TABLE IF EXISTS `auth_group_permissions`;

CREATE TABLE `auth_group_permissions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `group_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_group_permissions_group_id_permission_id_0cd325b0_uniq` (`group_id`,`permission_id`),
  KEY `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` (`permission_id`),
  CONSTRAINT `auth_group_permissions_group_id_b120cbf9_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`),
  CONSTRAINT `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `auth_group_permissions` */

/*Table structure for table `auth_permission` */

DROP TABLE IF EXISTS `auth_permission`;

CREATE TABLE `auth_permission` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `content_type_id` int(11) NOT NULL,
  `codename` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_permission_content_type_id_codename_01ab375a_uniq` (`content_type_id`,`codename`),
  CONSTRAINT `auth_permission_content_type_id_2f476e4b_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=49 DEFAULT CHARSET=latin1;

/*Data for the table `auth_permission` */

insert  into `auth_permission`(`id`,`name`,`content_type_id`,`codename`) values 
(1,'Can add log entry',1,'add_logentry'),
(2,'Can change log entry',1,'change_logentry'),
(3,'Can delete log entry',1,'delete_logentry'),
(4,'Can add permission',2,'add_permission'),
(5,'Can change permission',2,'change_permission'),
(6,'Can delete permission',2,'delete_permission'),
(7,'Can add group',3,'add_group'),
(8,'Can change group',3,'change_group'),
(9,'Can delete group',3,'delete_group'),
(10,'Can add user',4,'add_user'),
(11,'Can change user',4,'change_user'),
(12,'Can delete user',4,'delete_user'),
(13,'Can add content type',5,'add_contenttype'),
(14,'Can change content type',5,'change_contenttype'),
(15,'Can delete content type',5,'delete_contenttype'),
(16,'Can add session',6,'add_session'),
(17,'Can change session',6,'change_session'),
(18,'Can delete session',6,'delete_session'),
(19,'Can add cart',7,'add_cart'),
(20,'Can change cart',7,'change_cart'),
(21,'Can delete cart',7,'delete_cart'),
(22,'Can add feedback',8,'add_feedback'),
(23,'Can change feedback',8,'change_feedback'),
(24,'Can delete feedback',8,'delete_feedback'),
(25,'Can add login',9,'add_login'),
(26,'Can change login',9,'change_login'),
(27,'Can delete login',9,'delete_login'),
(28,'Can add order',10,'add_order'),
(29,'Can change order',10,'change_order'),
(30,'Can delete order',10,'delete_order'),
(31,'Can add order_master',11,'add_order_master'),
(32,'Can change order_master',11,'change_order_master'),
(33,'Can delete order_master',11,'delete_order_master'),
(34,'Can add product',12,'add_product'),
(35,'Can change product',12,'change_product'),
(36,'Can delete product',12,'delete_product'),
(37,'Can add staff',13,'add_staff'),
(38,'Can change staff',13,'change_staff'),
(39,'Can delete staff',13,'delete_staff'),
(40,'Can add users',14,'add_users'),
(41,'Can change users',14,'change_users'),
(42,'Can delete users',14,'delete_users'),
(43,'Can add wishlist',15,'add_wishlist'),
(44,'Can change wishlist',15,'change_wishlist'),
(45,'Can delete wishlist',15,'delete_wishlist'),
(46,'Can add delivery',16,'add_delivery'),
(47,'Can change delivery',16,'change_delivery'),
(48,'Can delete delivery',16,'delete_delivery');

/*Table structure for table `auth_user` */

DROP TABLE IF EXISTS `auth_user`;

CREATE TABLE `auth_user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `password` varchar(128) NOT NULL,
  `last_login` datetime(6) DEFAULT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `username` varchar(150) NOT NULL,
  `first_name` varchar(30) NOT NULL,
  `last_name` varchar(150) NOT NULL,
  `email` varchar(254) NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `date_joined` datetime(6) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

/*Data for the table `auth_user` */

insert  into `auth_user`(`id`,`password`,`last_login`,`is_superuser`,`username`,`first_name`,`last_name`,`email`,`is_staff`,`is_active`,`date_joined`) values 
(1,'pbkdf2_sha256$100000$tF8hsmQTLbS9$GxAP/+sIHF27a7iMvhDVGa7OwsahPTuMTksRUEuSfEA=','2025-01-08 05:48:13.463185',1,'admin','','','',1,1,'2025-01-08 05:47:39.347987');

/*Table structure for table `auth_user_groups` */

DROP TABLE IF EXISTS `auth_user_groups`;

CREATE TABLE `auth_user_groups` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_user_groups_user_id_group_id_94350c0c_uniq` (`user_id`,`group_id`),
  KEY `auth_user_groups_group_id_97559544_fk_auth_group_id` (`group_id`),
  CONSTRAINT `auth_user_groups_group_id_97559544_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`),
  CONSTRAINT `auth_user_groups_user_id_6a12ed8b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `auth_user_groups` */

/*Table structure for table `auth_user_user_permissions` */

DROP TABLE IF EXISTS `auth_user_user_permissions`;

CREATE TABLE `auth_user_user_permissions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_user_user_permissions_user_id_permission_id_14a6b632_uniq` (`user_id`,`permission_id`),
  KEY `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` (`permission_id`),
  CONSTRAINT `auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`),
  CONSTRAINT `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `auth_user_user_permissions` */

/*Table structure for table `django_admin_log` */

DROP TABLE IF EXISTS `django_admin_log`;

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
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

/*Data for the table `django_admin_log` */

insert  into `django_admin_log`(`id`,`action_time`,`object_id`,`object_repr`,`action_flag`,`change_message`,`content_type_id`,`user_id`) values 
(1,'2025-01-08 05:48:31.876439','1','Woolen heavy winter jacket',3,'',12,1);

/*Table structure for table `django_content_type` */

DROP TABLE IF EXISTS `django_content_type`;

CREATE TABLE `django_content_type` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `app_label` varchar(100) NOT NULL,
  `model` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `django_content_type_app_label_model_76bd3d3b_uniq` (`app_label`,`model`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=latin1;

/*Data for the table `django_content_type` */

insert  into `django_content_type`(`id`,`app_label`,`model`) values 
(1,'admin','logentry'),
(3,'auth','group'),
(2,'auth','permission'),
(4,'auth','user'),
(5,'contenttypes','contenttype'),
(7,'myapp','cart'),
(16,'myapp','delivery'),
(8,'myapp','feedback'),
(9,'myapp','login'),
(10,'myapp','order'),
(11,'myapp','order_master'),
(12,'myapp','product'),
(13,'myapp','staff'),
(14,'myapp','users'),
(15,'myapp','wishlist'),
(6,'sessions','session');

/*Table structure for table `django_migrations` */

DROP TABLE IF EXISTS `django_migrations`;

CREATE TABLE `django_migrations` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `app` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `applied` datetime(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=latin1;

/*Data for the table `django_migrations` */

insert  into `django_migrations`(`id`,`app`,`name`,`applied`) values 
(1,'contenttypes','0001_initial','2025-01-07 08:04:10.081977'),
(2,'auth','0001_initial','2025-01-07 08:04:11.297411'),
(3,'admin','0001_initial','2025-01-07 08:04:11.562267'),
(4,'admin','0002_logentry_remove_auto_add','2025-01-07 08:04:11.577888'),
(5,'contenttypes','0002_remove_content_type_name','2025-01-07 08:04:11.738204'),
(6,'auth','0002_alter_permission_name_max_length','2025-01-07 08:04:11.838918'),
(7,'auth','0003_alter_user_email_max_length','2025-01-07 08:04:11.924893'),
(8,'auth','0004_alter_user_username_opts','2025-01-07 08:04:11.940515'),
(9,'auth','0005_alter_user_last_login_null','2025-01-07 08:04:12.040706'),
(10,'auth','0006_require_contenttypes_0002','2025-01-07 08:04:12.041722'),
(11,'auth','0007_alter_validators_add_error_messages','2025-01-07 08:04:12.058388'),
(12,'auth','0008_alter_user_username_max_length','2025-01-07 08:04:12.158434'),
(13,'auth','0009_alter_user_last_name_max_length','2025-01-07 08:04:12.258518'),
(14,'myapp','0001_initial','2025-01-07 08:04:14.260406'),
(15,'sessions','0001_initial','2025-01-07 08:04:14.367229'),
(16,'myapp','0002_auto_20250108_1249','2025-01-08 07:19:36.163934'),
(17,'myapp','0003_delivery','2025-01-08 10:35:03.664664'),
(18,'myapp','0004_auto_20250108_1638','2025-01-08 11:08:38.793881');

/*Table structure for table `django_session` */

DROP TABLE IF EXISTS `django_session`;

CREATE TABLE `django_session` (
  `session_key` varchar(40) NOT NULL,
  `session_data` longtext NOT NULL,
  `expire_date` datetime(6) NOT NULL,
  PRIMARY KEY (`session_key`),
  KEY `django_session_expire_date_a5c62663` (`expire_date`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `django_session` */

insert  into `django_session`(`session_key`,`session_data`,`expire_date`) values 
('xwwxtgbr20d3y4uhj3yhz10351bpxjq7','NWRiMGEwMjE1YmI2OTM1NTI2YWIzNGU5ODllMmIxYzUzNmFkMjY3Yzp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiIwMDg3MjliYWM1YTViYjYxOGM0MTQ0ZjEyZWJlYjUzODBhMDUwMmU5In0=','2025-01-22 05:48:13.463185');

/*Table structure for table `myapp_cart` */

DROP TABLE IF EXISTS `myapp_cart`;

CREATE TABLE `myapp_cart` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `quantity` int(11) NOT NULL,
  `csize` varchar(100) NOT NULL,
  `NAME_id` int(11) NOT NULL,
  `USERS_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `myapp_cart_NAME_id_00a5fc7a_fk_myapp_product_id` (`NAME_id`),
  KEY `myapp_cart_USERS_id_f1c0726a_fk_myapp_users_id` (`USERS_id`),
  CONSTRAINT `myapp_cart_NAME_id_00a5fc7a_fk_myapp_product_id` FOREIGN KEY (`NAME_id`) REFERENCES `myapp_product` (`id`),
  CONSTRAINT `myapp_cart_USERS_id_f1c0726a_fk_myapp_users_id` FOREIGN KEY (`USERS_id`) REFERENCES `myapp_users` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=latin1;

/*Data for the table `myapp_cart` */

insert  into `myapp_cart`(`id`,`quantity`,`csize`,`NAME_id`,`USERS_id`) values 
(2,2,'M',4,11);

/*Table structure for table `myapp_delivery` */

DROP TABLE IF EXISTS `myapp_delivery`;

CREATE TABLE `myapp_delivery` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `fname` varchar(100) NOT NULL,
  `lname` varchar(100) NOT NULL,
  `phone` bigint(20) NOT NULL,
  `pin` int(11) NOT NULL,
  `address` varchar(10000) NOT NULL,
  `locality` varchar(200) NOT NULL,
  `other` varchar(10000) NOT NULL,
  `ORDER_MASTER_id` int(11) NOT NULL,
  `district` varchar(200) NOT NULL,
  `state` varchar(200) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `myapp_delivery_ORDER_MASTER_id_85f1322f_fk_myapp_order_master_id` (`ORDER_MASTER_id`),
  CONSTRAINT `myapp_delivery_ORDER_MASTER_id_85f1322f_fk_myapp_order_master_id` FOREIGN KEY (`ORDER_MASTER_id`) REFERENCES `myapp_order_master` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=latin1;

/*Data for the table `myapp_delivery` */

insert  into `myapp_delivery`(`id`,`fname`,`lname`,`phone`,`pin`,`address`,`locality`,`other`,`ORDER_MASTER_id`,`district`,`state`) values 
(11,'sdg','sdgsg',9087654321,24,'dsfgdg','sgsg','sgsg',34,'sgsg','sgsg'),
(12,'aparna','ns',7902339267,686691,'flat no 14','ernakulam','near town hospital',35,'ernakulam','kerala'),
(13,'gouri','nandana',7903654312,896745,'focus','thrissur','focus',36,'thrissur','kerala'),
(14,'aparna','ns',7902339267,97865,'focus','thrissu','west fort',37,'thrissur','kerala');

/*Table structure for table `myapp_feedback` */

DROP TABLE IF EXISTS `myapp_feedback`;

CREATE TABLE `myapp_feedback` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `feedbacks` varchar(100) NOT NULL,
  `fdate` varchar(100) NOT NULL,
  `rating` int(11) NOT NULL,
  `PRODUCT_id` int(11) NOT NULL,
  `USERS_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `myapp_feedback_PRODUCT_id_87175ae5_fk_myapp_product_id` (`PRODUCT_id`),
  KEY `myapp_feedback_USERS_id_766bce84_fk_myapp_users_id` (`USERS_id`),
  CONSTRAINT `myapp_feedback_PRODUCT_id_87175ae5_fk_myapp_product_id` FOREIGN KEY (`PRODUCT_id`) REFERENCES `myapp_product` (`id`),
  CONSTRAINT `myapp_feedback_USERS_id_766bce84_fk_myapp_users_id` FOREIGN KEY (`USERS_id`) REFERENCES `myapp_users` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=latin1;

/*Data for the table `myapp_feedback` */

insert  into `myapp_feedback`(`id`,`feedbacks`,`fdate`,`rating`,`PRODUCT_id`,`USERS_id`) values 
(5,'nice product \r\n','2025-01-08 07:01:05.155664+00:00',3,10,1),
(6,'nice product','2025-01-08 07:21:18.656776+00:00',3,16,1),
(7,'vbmmn','2025-01-08 07:33:32.594760+00:00',4,16,1),
(8,'nice quality','2025-01-08 09:13:14.668201+00:00',4,16,1),
(9,'safaf','2025-01-09 08:03:46.825177+00:00',5,13,1),
(10,'nice product','2025-01-10 03:51:24.449700+00:00',5,13,1),
(11,'nice product','2025-01-10 04:37:16.111853+00:00',5,11,12),
(12,'cheep quality print','2025-01-13 07:32:25.618730+00:00',5,13,1);

/*Table structure for table `myapp_login` */

DROP TABLE IF EXISTS `myapp_login`;

CREATE TABLE `myapp_login` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(100) NOT NULL,
  `password` varchar(100) NOT NULL,
  `usertype` varchar(100) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=latin1;

/*Data for the table `myapp_login` */

insert  into `myapp_login`(`id`,`username`,`password`,`usertype`) values 
(1,'aparna','123','user'),
(2,'jishna','123','staff'),
(3,'','','staff'),
(4,'santeena','1234','staff'),
(5,'albin','1234','user'),
(9,'anusree','34','user'),
(10,'drgdg','43','user'),
(11,'jeeva','123345','user'),
(12,'sf','23','user'),
(13,'ertet','345','user'),
(14,'','','staff'),
(15,'gouri','12345','staff'),
(16,'divya','divya123','staff'),
(17,'anju','anju123','user'),
(18,'mariya','mariya@123','staff'),
(19,'tomy','tomy123','staff'),
(20,'gouri','gouri123','user');

/*Table structure for table `myapp_order` */

DROP TABLE IF EXISTS `myapp_order`;

CREATE TABLE `myapp_order` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `oquantity` int(11) NOT NULL,
  `osize` varchar(100) NOT NULL,
  `ORDER_MASTER_id` int(11) NOT NULL,
  `PRODUCT_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `myapp_order_ORDER_MASTER_id_56fb8389_fk_myapp_order_master_id` (`ORDER_MASTER_id`),
  KEY `myapp_order_PRODUCT_id_2f0f6d0e_fk_myapp_product_id` (`PRODUCT_id`),
  CONSTRAINT `myapp_order_ORDER_MASTER_id_56fb8389_fk_myapp_order_master_id` FOREIGN KEY (`ORDER_MASTER_id`) REFERENCES `myapp_order_master` (`id`),
  CONSTRAINT `myapp_order_PRODUCT_id_2f0f6d0e_fk_myapp_product_id` FOREIGN KEY (`PRODUCT_id`) REFERENCES `myapp_product` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=38 DEFAULT CHARSET=latin1;

/*Data for the table `myapp_order` */

insert  into `myapp_order`(`id`,`oquantity`,`osize`,`ORDER_MASTER_id`,`PRODUCT_id`) values 
(34,1,'L',34,13),
(35,1,'L',35,12),
(36,1,'S',36,11),
(37,1,'XXL',37,12);

/*Table structure for table `myapp_order_master` */

DROP TABLE IF EXISTS `myapp_order_master`;

CREATE TABLE `myapp_order_master` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `camount` int(11) NOT NULL,
  `odate` date NOT NULL,
  `status` varchar(100) NOT NULL,
  `USERS_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `myapp_order_master_USERS_id_44f8d5c6_fk_myapp_users_id` (`USERS_id`),
  CONSTRAINT `myapp_order_master_USERS_id_44f8d5c6_fk_myapp_users_id` FOREIGN KEY (`USERS_id`) REFERENCES `myapp_users` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=38 DEFAULT CHARSET=latin1;

/*Data for the table `myapp_order_master` */

insert  into `myapp_order_master`(`id`,`camount`,`odate`,`status`,`USERS_id`) values 
(34,599,'2025-01-09','Cash on Delivery',1),
(35,799,'2025-01-10','Cash on Delivery',1),
(36,699,'2025-01-10','Online Payment',12),
(37,799,'2025-01-10','Online Payment',1);

/*Table structure for table `myapp_product` */

DROP TABLE IF EXISTS `myapp_product`;

CREATE TABLE `myapp_product` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `pname` varchar(100) NOT NULL,
  `psize` varchar(100) NOT NULL,
  `category` varchar(100) NOT NULL,
  `pamount` int(11) NOT NULL,
  `pphoto` varchar(100) NOT NULL,
  `sizephoto` varchar(100) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=27 DEFAULT CHARSET=latin1;

/*Data for the table `myapp_product` */

insert  into `myapp_product`(`id`,`pname`,`psize`,`category`,`pamount`,`pphoto`,`sizephoto`) values 
(4,'Shirt style top','XS,S,M,L,XL,XXL','TOPS',799,'media/shirt_style_top_H2pIklS.png','media/top_sizechart_xzaaVEz.png'),
(5,'Green high-rise strechable jeans','XS,S,M,L,XL,XXL','Jeans',19,'media/green_rhigh_rise_strechable_tpTZOVC.png','media/sizechart-jeans_C8BGat6.png'),
(6,'Regular cropped jeans','S,M,L','Jeans',888,'media/regular_cropped_jeans_mchWRVy.png','media/sizechart-jeans_hwO3oDR.png'),
(7,'Bluue strachable jeans','S,M,L,XXL','Jeans',766,'media/blue_strachable_jeans_wdsRVea.png','media/sizechart-jeans_atKZbnW.png'),
(8,'Antirelaxi fit strachable jeans','XS,S,M,L,XL,XXL','Jeans',1999,'media/fit_streechable_jeans_FOSyizw.png','media/sizechart-jeans_lPwsOZY.png'),
(9,'Fllared Jeans','XS,S,M,L,XL','Jeans',853,'media/j6_cockdwz.png','media/sizechart-jeans_0UMQtKv.png'),
(10,'Anarkali kurta set','XS,S,M,L,XL,XXL','KURTA SETS',1299,'media/anarkali_kuta_set_UD7RcDl.png','media/kurta-size_cahrt_EJ8eMlG.png'),
(11,'Chiffon flared kuta set','XS,S,M,L,XL,XXL','KURTA SETS',699,'media/chiffon_flared_kurta_set_ZooNhwr.png','media/kurta-size_cahrt_Ek2T9y9.png'),
(12,'Ethnic embroided kurta','XS,S,M,L,XL,XXL','KURTA SETS',799,'media/embroided_kurta_set_LoNZxoI.png','media/kurta-size_cahrt_kjFpgOY.png'),
(13,'Printed kurta set','XS,S,M,L,XL,XXL','KURTA SETS',599,'media/printed_kurta_set_HYaWgRT.png','media/kurta-size_cahrt_i62M7Db.png'),
(14,'Yoke design kurta set','XS,S,M,L,XL,XXL','KURTA SETS',399,'media/k6_m7DYapY.png','media/kurta-size_cahrt_siM4gGS.png'),
(15,'Cowl neck top','XS,S,M,L','TOPS',899,'media/cowl_neck_top_YUFrqv0.png','media/top_sizechart_YsgcBy8.png'),
(16,'A line top','XS,S,M,L,XL,XXL','TOPS',999,'media/aline_top_PkI2MN9.png','media/top_sizechart_IlCLZ5H.png'),
(17,'Trutle neck top','XS,S,M,L,XL,XXL','TOPS',799,'media/trutle_neck_top_eCcbCKS.png','media/top_sizechart_Kn6jwlq.png'),
(19,'Woolen heavy winter jacket','XS,S,M,L,XL','WINTER WEAR',1299,'media/woolen_jacket_b9xPSKI.png','media/wsize_dMbboSt.png'),
(20,'Solid PufferJacket','S,M,L','WINTER WEAR',1288,'media/SOLID_PUFFER_JACKET_IlESVvr.png','media/wsize_ETLjHBB.png'),
(21,'Thermal suit night','M,L,XL','WINTER WEAR',999,'media/thermalsuit_18xjj8e.png','media/wsize_hjPTGKD.png'),
(22,'night wear','S,M,L','WINTER WEAR',299,'media/night_suits__ot2vbaw.png','media/wsize_0ikaRMS.png'),
(24,'jacket','S,M,L','WINTER WEAR',999,'media/chkokko_JTzsXSC.png','media/wsize_X47iBXO.png'),
(26,'cotton kurta','XS,S,M,L','KURTA SETS',299,'media/new_cotton_kurta.png','media/kurta-size_cahrt_ec5qSRA.png');

/*Table structure for table `myapp_staff` */

DROP TABLE IF EXISTS `myapp_staff`;

CREATE TABLE `myapp_staff` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `sname` varchar(100) NOT NULL,
  `semail` varchar(100) NOT NULL,
  `address` varchar(100) NOT NULL,
  `sphone` bigint(20) NOT NULL,
  `spassword` varchar(100) NOT NULL,
  `sphoto` varchar(100) NOT NULL,
  `LOGIN_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `myapp_staff_LOGIN_id_73bde0f5_fk_myapp_login_id` (`LOGIN_id`),
  CONSTRAINT `myapp_staff_LOGIN_id_73bde0f5_fk_myapp_login_id` FOREIGN KEY (`LOGIN_id`) REFERENCES `myapp_login` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=latin1;

/*Data for the table `myapp_staff` */

insert  into `myapp_staff`(`id`,`sname`,`semail`,`address`,`sphone`,`spassword`,`sphoto`,`LOGIN_id`) values 
(1,'jishna','jishna@gmail.com','jhjjn',8797898,'123','media/aline_top_OsMtVI1.png',2),
(2,'santeena','santeena@gmail.com','fgghjg',89896534664,'1234','media/cotton_kurta_splo3MH.png',4),
(3,'gouri','gouri@gmail.com','fghg',7893542355,'12345','media/cotton_kurta_drWiaXk.png',15),
(4,'divya','divya@gmail.com','hgjhkj',8967564544,'divya123','media/aline_top_26eSr5z.png',16),
(5,'mariya','mariya@gmail.com','house no 113',7902339269,'mariya@123','media/shirt_style_top_GubuiXD.png',18),
(6,'tomy','tomy@gmail.com','focus',7902337865,'tomy123','media/aline_top_qKlVM3s.png',19);

/*Table structure for table `myapp_users` */

DROP TABLE IF EXISTS `myapp_users`;

CREATE TABLE `myapp_users` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uname` varchar(100) NOT NULL,
  `uemail` varchar(100) NOT NULL,
  `housename` varchar(100) NOT NULL,
  `town` varchar(100) NOT NULL,
  `pin` int(11) NOT NULL,
  `uphone` bigint(20) NOT NULL,
  `upassword` varchar(100) NOT NULL,
  `LOGIN_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `myapp_users_LOGIN_id_80656a2a_fk_myapp_login_id` (`LOGIN_id`),
  CONSTRAINT `myapp_users_LOGIN_id_80656a2a_fk_myapp_login_id` FOREIGN KEY (`LOGIN_id`) REFERENCES `myapp_login` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=latin1;

/*Data for the table `myapp_users` */

insert  into `myapp_users`(`id`,`uname`,`uemail`,`housename`,`town`,`pin`,`uphone`,`upassword`,`LOGIN_id`) values 
(1,'aparna','aparna@gmail.com','gffg','hgj',868,9857436463,'123',1),
(2,'albin','albin@gmail.com','gfjhjh','hjkkjkj',43457,7535359779,'1234',5),
(6,'anusree','anusree@gmail.com','gjkkj','ghjkkl',88767,917902339267,'34',9),
(7,'drgdg','sona@gmail.com','sgtsg','dgdg',345353,6789054321,'43',10),
(8,'jeeva','jeeva@gmail.com','rtyhhg','fgcbghh',867997,1234567890,'123345',11),
(9,'sf','sona@gmail.com','sgsg','sgsg',24,917902339267,'23',12),
(10,'ertet','seetha@gmail.com','sfgsgs','sgs',345,917789054321,'345',13),
(11,'anju','anju@gmail.com','hghj','shgjhghjhj',678789,7902339267,'anju123',17),
(12,'gouri','gouri@gmail.com','focus','thrisur',78988,7856341243,'gouri123',20);

/*Table structure for table `myapp_wishlist` */

DROP TABLE IF EXISTS `myapp_wishlist`;

CREATE TABLE `myapp_wishlist` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `PRODUCT_id` int(11) NOT NULL,
  `USERS_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `myapp_wishlist_PRODUCT_id_6f86bc73_fk_myapp_product_id` (`PRODUCT_id`),
  KEY `myapp_wishlist_USERS_id_f091c25c_fk_myapp_users_id` (`USERS_id`),
  CONSTRAINT `myapp_wishlist_PRODUCT_id_6f86bc73_fk_myapp_product_id` FOREIGN KEY (`PRODUCT_id`) REFERENCES `myapp_product` (`id`),
  CONSTRAINT `myapp_wishlist_USERS_id_f091c25c_fk_myapp_users_id` FOREIGN KEY (`USERS_id`) REFERENCES `myapp_users` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=32 DEFAULT CHARSET=latin1;

/*Data for the table `myapp_wishlist` */

insert  into `myapp_wishlist`(`id`,`PRODUCT_id`,`USERS_id`) values 
(30,13,1),
(31,11,2);

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
