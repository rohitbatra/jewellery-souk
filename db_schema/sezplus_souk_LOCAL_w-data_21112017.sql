# ************************************************************
# Sequel Pro SQL dump
# Version 4541
#
# http://www.sequelpro.com/
# https://github.com/sequelpro/sequelpro
#
# Host: 127.0.0.1 (MySQL 5.7.20)
# Database: sezplus_souk
# Generation Time: 2017-11-21 05:56:28 +0000
# ************************************************************


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


# Dump of table address
# ------------------------------------------------------------

DROP TABLE IF EXISTS `address`;

CREATE TABLE `address` (
  `address_id` int(11) NOT NULL AUTO_INCREMENT,
  `customer_id` int(11) NOT NULL,
  `firstname` varchar(32) NOT NULL,
  `lastname` varchar(32) NOT NULL,
  `company` varchar(40) NOT NULL,
  `address_1` varchar(128) NOT NULL,
  `address_2` varchar(128) NOT NULL,
  `city` varchar(128) NOT NULL,
  `postcode` varchar(10) NOT NULL,
  `country_id` int(11) NOT NULL DEFAULT '0',
  `zone_id` int(11) NOT NULL DEFAULT '0',
  `custom_field` text NOT NULL,
  PRIMARY KEY (`address_id`),
  KEY `customer_id` (`customer_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

LOCK TABLES `address` WRITE;
/*!40000 ALTER TABLE `address` DISABLE KEYS */;

INSERT INTO `address` (`address_id`, `customer_id`, `firstname`, `lastname`, `company`, `address_1`, `address_2`, `city`, `postcode`, `country_id`, `zone_id`, `custom_field`)
VALUES
	(10,10,'Rohit','Batra','','129 Idgah Hills','Near Water Filter Plant','Bhopal','462011',99,1492,'[]'),
	(11,11,'Test','Account','','111, B Wing','Western Edge 2','Mumbai','400066',99,1493,'');

/*!40000 ALTER TABLE `address` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table affiliate
# ------------------------------------------------------------

DROP TABLE IF EXISTS `affiliate`;

CREATE TABLE `affiliate` (
  `affiliate_id` int(11) NOT NULL AUTO_INCREMENT,
  `firstname` varchar(32) NOT NULL,
  `lastname` varchar(32) NOT NULL,
  `email` varchar(96) NOT NULL,
  `telephone` varchar(32) NOT NULL,
  `fax` varchar(32) NOT NULL,
  `password` varchar(40) NOT NULL,
  `salt` varchar(9) NOT NULL,
  `company` varchar(40) NOT NULL,
  `website` varchar(255) NOT NULL,
  `address_1` varchar(128) NOT NULL,
  `address_2` varchar(128) NOT NULL,
  `city` varchar(128) NOT NULL,
  `postcode` varchar(10) NOT NULL,
  `country_id` int(11) NOT NULL,
  `zone_id` int(11) NOT NULL,
  `code` varchar(64) NOT NULL,
  `commission` decimal(4,2) NOT NULL DEFAULT '0.00',
  `tax` varchar(64) NOT NULL,
  `payment` varchar(6) NOT NULL,
  `cheque` varchar(100) NOT NULL,
  `paypal` varchar(64) NOT NULL,
  `bank_name` varchar(64) NOT NULL,
  `bank_branch_number` varchar(64) NOT NULL,
  `bank_swift_code` varchar(64) NOT NULL,
  `bank_account_name` varchar(64) NOT NULL,
  `bank_account_number` varchar(64) NOT NULL,
  `ip` varchar(40) NOT NULL,
  `status` tinyint(1) NOT NULL,
  `approved` tinyint(1) NOT NULL,
  `date_added` datetime NOT NULL,
  PRIMARY KEY (`affiliate_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;



# Dump of table affiliate_activity
# ------------------------------------------------------------

DROP TABLE IF EXISTS `affiliate_activity`;

CREATE TABLE `affiliate_activity` (
  `affiliate_activity_id` int(11) NOT NULL AUTO_INCREMENT,
  `affiliate_id` int(11) NOT NULL,
  `key` varchar(64) NOT NULL,
  `data` text NOT NULL,
  `ip` varchar(40) NOT NULL,
  `date_added` datetime NOT NULL,
  PRIMARY KEY (`affiliate_activity_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;



# Dump of table affiliate_login
# ------------------------------------------------------------

DROP TABLE IF EXISTS `affiliate_login`;

CREATE TABLE `affiliate_login` (
  `affiliate_login_id` int(11) NOT NULL AUTO_INCREMENT,
  `email` varchar(96) NOT NULL,
  `ip` varchar(40) NOT NULL,
  `total` int(4) NOT NULL,
  `date_added` datetime NOT NULL,
  `date_modified` datetime NOT NULL,
  PRIMARY KEY (`affiliate_login_id`),
  KEY `email` (`email`),
  KEY `ip` (`ip`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;



# Dump of table affiliate_transaction
# ------------------------------------------------------------

DROP TABLE IF EXISTS `affiliate_transaction`;

CREATE TABLE `affiliate_transaction` (
  `affiliate_transaction_id` int(11) NOT NULL AUTO_INCREMENT,
  `affiliate_id` int(11) NOT NULL,
  `order_id` int(11) NOT NULL,
  `description` text NOT NULL,
  `amount` decimal(15,4) NOT NULL,
  `date_added` datetime NOT NULL,
  PRIMARY KEY (`affiliate_transaction_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;



# Dump of table api
# ------------------------------------------------------------

DROP TABLE IF EXISTS `api`;

CREATE TABLE `api` (
  `api_id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(64) NOT NULL,
  `key` text NOT NULL,
  `status` tinyint(1) NOT NULL,
  `date_added` datetime NOT NULL,
  `date_modified` datetime NOT NULL,
  PRIMARY KEY (`api_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

LOCK TABLES `api` WRITE;
/*!40000 ALTER TABLE `api` DISABLE KEYS */;

INSERT INTO `api` (`api_id`, `name`, `key`, `status`, `date_added`, `date_modified`)
VALUES
	(1,'Default','MinVl0qD6TNAeEvkJZhOaiZbrl7Gh9LuYK0KgKgCpZmwRJERT06RHjpwt0FRMW7hd7MN7bENSVHQ4fE41n3mfUI8esL3BSBdnjyuotAt0tS5ByTbgrJnRfTYp9q2r9VPmdItSOECkmUcdE4momeGJ0xRb8bfQfbixsDERkXUCXUePfxBSKJbT1eDK2sGg3gcZvnSh4Skwhz6s1AK14P9DpTNeni9O8emL71cntsfLf5z1ZryCJH9h76b4mWwzP6i',1,'2017-06-29 23:05:01','2017-06-29 23:05:01');

/*!40000 ALTER TABLE `api` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table api_ip
# ------------------------------------------------------------

DROP TABLE IF EXISTS `api_ip`;

CREATE TABLE `api_ip` (
  `api_ip_id` int(11) NOT NULL AUTO_INCREMENT,
  `api_id` int(11) NOT NULL,
  `ip` varchar(40) NOT NULL,
  PRIMARY KEY (`api_ip_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;



# Dump of table api_session
# ------------------------------------------------------------

DROP TABLE IF EXISTS `api_session`;

CREATE TABLE `api_session` (
  `api_session_id` int(11) NOT NULL AUTO_INCREMENT,
  `api_id` int(11) NOT NULL,
  `token` varchar(32) NOT NULL,
  `session_id` varchar(32) NOT NULL,
  `session_name` varchar(32) NOT NULL,
  `ip` varchar(40) NOT NULL,
  `date_added` datetime NOT NULL,
  `date_modified` datetime NOT NULL,
  PRIMARY KEY (`api_session_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;



# Dump of table attribute
# ------------------------------------------------------------

DROP TABLE IF EXISTS `attribute`;

CREATE TABLE `attribute` (
  `attribute_id` int(11) NOT NULL AUTO_INCREMENT,
  `attribute_group_id` int(11) NOT NULL,
  `sort_order` int(3) NOT NULL,
  PRIMARY KEY (`attribute_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

LOCK TABLES `attribute` WRITE;
/*!40000 ALTER TABLE `attribute` DISABLE KEYS */;

INSERT INTO `attribute` (`attribute_id`, `attribute_group_id`, `sort_order`)
VALUES
	(1,6,1),
	(2,6,5),
	(3,6,3),
	(4,3,1),
	(5,3,2),
	(6,3,3),
	(7,3,4),
	(8,3,5),
	(9,3,6),
	(10,3,7),
	(11,3,8);

/*!40000 ALTER TABLE `attribute` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table attribute_description
# ------------------------------------------------------------

DROP TABLE IF EXISTS `attribute_description`;

CREATE TABLE `attribute_description` (
  `attribute_id` int(11) NOT NULL,
  `language_id` int(11) NOT NULL,
  `name` varchar(64) NOT NULL,
  PRIMARY KEY (`attribute_id`,`language_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

LOCK TABLES `attribute_description` WRITE;
/*!40000 ALTER TABLE `attribute_description` DISABLE KEYS */;

INSERT INTO `attribute_description` (`attribute_id`, `language_id`, `name`)
VALUES
	(1,1,'Description'),
	(2,1,'No. of Cores'),
	(4,1,'test 1'),
	(5,1,'test 2'),
	(6,1,'test 3'),
	(7,1,'test 4'),
	(8,1,'test 5'),
	(9,1,'test 6'),
	(10,1,'test 7'),
	(11,1,'test 8'),
	(3,1,'Clockspeed');

/*!40000 ALTER TABLE `attribute_description` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table attribute_group
# ------------------------------------------------------------

DROP TABLE IF EXISTS `attribute_group`;

CREATE TABLE `attribute_group` (
  `attribute_group_id` int(11) NOT NULL AUTO_INCREMENT,
  `sort_order` int(3) NOT NULL,
  PRIMARY KEY (`attribute_group_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

LOCK TABLES `attribute_group` WRITE;
/*!40000 ALTER TABLE `attribute_group` DISABLE KEYS */;

INSERT INTO `attribute_group` (`attribute_group_id`, `sort_order`)
VALUES
	(3,2),
	(4,1),
	(5,3),
	(6,4);

/*!40000 ALTER TABLE `attribute_group` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table attribute_group_description
# ------------------------------------------------------------

DROP TABLE IF EXISTS `attribute_group_description`;

CREATE TABLE `attribute_group_description` (
  `attribute_group_id` int(11) NOT NULL,
  `language_id` int(11) NOT NULL,
  `name` varchar(64) NOT NULL,
  PRIMARY KEY (`attribute_group_id`,`language_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

LOCK TABLES `attribute_group_description` WRITE;
/*!40000 ALTER TABLE `attribute_group_description` DISABLE KEYS */;

INSERT INTO `attribute_group_description` (`attribute_group_id`, `language_id`, `name`)
VALUES
	(3,1,'Memory'),
	(4,1,'Technical'),
	(5,1,'Motherboard'),
	(6,1,'Processor');

/*!40000 ALTER TABLE `attribute_group_description` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table banner
# ------------------------------------------------------------

DROP TABLE IF EXISTS `banner`;

CREATE TABLE `banner` (
  `banner_id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(64) NOT NULL,
  `status` tinyint(1) NOT NULL,
  PRIMARY KEY (`banner_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

LOCK TABLES `banner` WRITE;
/*!40000 ALTER TABLE `banner` DISABLE KEYS */;

INSERT INTO `banner` (`banner_id`, `name`, `status`)
VALUES
	(6,'HP Products',1),
	(7,'Home Page Slideshow',1),
	(8,'Manufacturers',1);

/*!40000 ALTER TABLE `banner` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table banner_image
# ------------------------------------------------------------

DROP TABLE IF EXISTS `banner_image`;

CREATE TABLE `banner_image` (
  `banner_image_id` int(11) NOT NULL AUTO_INCREMENT,
  `banner_id` int(11) NOT NULL,
  `language_id` int(11) NOT NULL,
  `title` varchar(64) NOT NULL,
  `link` varchar(255) NOT NULL,
  `image` varchar(255) NOT NULL,
  `sort_order` int(3) NOT NULL DEFAULT '0',
  PRIMARY KEY (`banner_image_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

LOCK TABLES `banner_image` WRITE;
/*!40000 ALTER TABLE `banner_image` DISABLE KEYS */;

INSERT INTO `banner_image` (`banner_image_id`, `banner_id`, `language_id`, `title`, `link`, `image`, `sort_order`)
VALUES
	(79,7,1,'iPhone 6','index.php?route=product/product&amp;path=57&amp;product_id=49','catalog/demo/banners/iPhone6.jpg',0),
	(87,6,1,'HP Banner','index.php?route=product/manufacturer/info&amp;manufacturer_id=7','catalog/demo/compaq_presario.jpg',0),
	(94,8,1,'NFL','','catalog/demo/manufacturer/nfl.png',0),
	(95,8,1,'RedBull','','catalog/demo/manufacturer/redbull.png',0),
	(96,8,1,'Sony','','catalog/demo/manufacturer/sony.png',0),
	(91,8,1,'Coca Cola','','catalog/demo/manufacturer/cocacola.png',0),
	(92,8,1,'Burger King','','catalog/demo/manufacturer/burgerking.png',0),
	(93,8,1,'Canon','','catalog/demo/manufacturer/canon.png',0),
	(88,8,1,'Harley Davidson','','catalog/demo/manufacturer/harley.png',0),
	(89,8,1,'Dell','','catalog/demo/manufacturer/dell.png',0),
	(90,8,1,'Disney','','catalog/demo/manufacturer/disney.png',0),
	(80,7,1,'MacBookAir','','catalog/demo/banners/MacBookAir.jpg',0),
	(97,8,1,'Starbucks','','catalog/demo/manufacturer/starbucks.png',0),
	(98,8,1,'Nintendo','','catalog/demo/manufacturer/nintendo.png',0);

/*!40000 ALTER TABLE `banner_image` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table cart
# ------------------------------------------------------------

DROP TABLE IF EXISTS `cart`;

CREATE TABLE `cart` (
  `cart_id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `api_id` int(11) NOT NULL,
  `customer_id` int(11) NOT NULL,
  `session_id` varchar(32) NOT NULL,
  `product_id` int(11) NOT NULL,
  `recurring_id` int(11) NOT NULL,
  `option` text NOT NULL,
  `quantity` int(5) NOT NULL,
  `date_added` datetime NOT NULL,
  PRIMARY KEY (`cart_id`),
  KEY `cart_id` (`api_id`,`customer_id`,`session_id`,`product_id`,`recurring_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



# Dump of table category
# ------------------------------------------------------------

DROP TABLE IF EXISTS `category`;

CREATE TABLE `category` (
  `category_id` int(11) NOT NULL AUTO_INCREMENT,
  `image` varchar(255) DEFAULT NULL,
  `parent_id` int(11) NOT NULL DEFAULT '0',
  `top` tinyint(1) NOT NULL,
  `column` int(3) NOT NULL,
  `sort_order` int(3) NOT NULL DEFAULT '0',
  `status` tinyint(1) NOT NULL,
  `date_added` datetime NOT NULL,
  `date_modified` datetime NOT NULL,
  PRIMARY KEY (`category_id`),
  KEY `parent_id` (`parent_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

LOCK TABLES `category` WRITE;
/*!40000 ALTER TABLE `category` DISABLE KEYS */;

INSERT INTO `category` (`category_id`, `image`, `parent_id`, `top`, `column`, `sort_order`, `status`, `date_added`, `date_modified`)
VALUES
	(118,'',99,1,1,0,1,'2017-11-04 18:30:46','2017-11-04 18:30:46'),
	(115,'',100,1,1,0,1,'2017-11-04 18:24:31','2017-11-04 18:25:30'),
	(116,'',99,1,1,0,1,'2017-11-04 18:28:59','2017-11-04 18:28:59'),
	(117,'',99,1,1,0,1,'2017-11-04 18:29:43','2017-11-04 18:29:43'),
	(114,'',100,1,1,0,1,'2017-11-04 18:23:33','2017-11-04 18:23:33'),
	(121,'',98,1,1,0,1,'2017-11-04 19:10:30','2017-11-04 19:10:30'),
	(120,'',99,1,1,0,1,'2017-11-04 18:31:50','2017-11-04 18:31:50'),
	(119,'',99,0,1,0,1,'2017-11-04 18:31:16','2017-11-04 18:31:16'),
	(98,'',0,1,1,0,1,'2017-11-04 18:04:30','2017-11-04 18:04:30'),
	(99,'',0,1,1,0,1,'2017-11-04 18:08:22','2017-11-04 18:08:22'),
	(100,'',0,1,1,0,1,'2017-11-04 18:08:47','2017-11-04 18:08:47'),
	(101,'',0,1,1,0,1,'2017-11-04 18:09:16','2017-11-04 18:09:16'),
	(102,'',0,1,1,0,1,'2017-11-04 18:09:41','2017-11-04 18:09:41'),
	(103,'',0,1,1,0,1,'2017-11-04 18:10:08','2017-11-04 18:10:08'),
	(104,'',0,1,1,0,1,'2017-11-04 18:10:38','2017-11-04 18:10:38'),
	(105,'',0,1,1,0,1,'2017-11-04 18:13:39','2017-11-04 18:13:39'),
	(106,'',0,1,1,0,1,'2017-11-04 18:14:05','2017-11-04 18:14:05'),
	(107,'',0,1,1,0,1,'2017-11-04 18:14:35','2017-11-04 18:14:35'),
	(108,'',0,1,1,0,1,'2017-11-04 18:15:01','2017-11-04 18:15:01'),
	(109,'',0,1,1,0,1,'2017-11-04 18:15:28','2017-11-04 18:15:28'),
	(110,'',0,1,1,0,1,'2017-11-04 18:16:04','2017-11-20 17:36:09'),
	(111,'',0,1,1,0,1,'2017-11-04 18:16:35','2017-11-04 18:16:35'),
	(112,'',100,0,1,0,1,'2017-11-04 18:20:08','2017-11-04 18:20:08'),
	(113,'',100,1,1,0,1,'2017-11-04 18:22:48','2017-11-04 18:22:48'),
	(122,'',98,1,1,0,1,'2017-11-04 19:13:00','2017-11-04 19:13:00'),
	(123,'',98,1,1,0,1,'2017-11-04 19:13:58','2017-11-04 19:13:58'),
	(124,'',98,1,1,0,1,'2017-11-04 19:14:35','2017-11-04 19:14:35'),
	(125,'',98,0,1,0,1,'2017-11-04 19:15:18','2017-11-04 19:15:18'),
	(126,'',98,1,1,0,1,'2017-11-04 19:15:50','2017-11-04 19:15:50'),
	(127,'',109,1,1,0,1,'2017-11-04 19:17:11','2017-11-04 19:17:11'),
	(128,'',109,1,1,0,1,'2017-11-04 19:17:44','2017-11-04 19:17:44'),
	(129,'',109,1,1,0,1,'2017-11-04 19:18:42','2017-11-04 19:18:42'),
	(130,'',109,0,1,0,1,'2017-11-04 19:19:28','2017-11-04 19:19:28'),
	(131,'',109,1,1,0,1,'2017-11-04 19:20:09','2017-11-04 19:20:09'),
	(132,'',0,1,1,0,1,'2017-11-11 17:39:08','2017-11-11 17:40:26'),
	(133,'',132,1,1,0,1,'2017-11-11 17:40:13','2017-11-11 17:44:03'),
	(134,'',132,1,1,0,1,'2017-11-11 17:41:38','2017-11-11 17:44:14'),
	(135,'',132,1,1,0,1,'2017-11-11 17:42:49','2017-11-11 17:43:43'),
	(136,'',132,0,1,0,1,'2017-11-11 17:43:28','2017-11-11 17:43:28'),
	(137,'',132,1,1,0,1,'2017-11-11 17:44:50','2017-11-11 17:44:50'),
	(138,'',132,1,1,0,1,'2017-11-11 17:45:31','2017-11-11 17:45:31'),
	(139,'',132,1,1,0,1,'2017-11-11 17:46:28','2017-11-11 17:46:28'),
	(140,'',132,1,1,0,1,'2017-11-11 17:47:32','2017-11-11 17:47:32'),
	(141,'',132,1,1,0,1,'2017-11-11 17:48:06','2017-11-11 17:48:06'),
	(142,'',132,1,1,0,1,'2017-11-11 17:48:47','2017-11-11 17:48:47'),
	(143,'',0,1,1,0,1,'2017-11-11 17:49:14','2017-11-11 17:49:14'),
	(144,'',0,1,1,0,1,'2017-11-11 17:49:53','2017-11-11 17:49:53'),
	(145,'',0,1,1,0,1,'2017-11-11 17:50:36','2017-11-11 17:50:36'),
	(146,'',0,1,1,0,1,'2017-11-11 17:51:07','2017-11-11 17:51:07'),
	(147,'',0,1,1,0,1,'2017-11-11 17:51:44','2017-11-11 17:51:44'),
	(148,'',147,0,1,0,1,'2017-11-11 17:52:20','2017-11-11 17:52:20'),
	(149,'',147,0,1,0,1,'2017-11-11 17:53:08','2017-11-11 17:53:08'),
	(150,'',147,1,1,0,1,'2017-11-11 17:53:44','2017-11-11 17:53:44'),
	(151,'',0,1,1,0,1,'2017-11-11 17:54:31','2017-11-11 17:54:31'),
	(152,'',0,1,1,0,1,'2017-11-11 17:55:06','2017-11-11 17:55:06'),
	(153,'',0,1,1,0,1,'2017-11-11 17:55:27','2017-11-11 17:55:27'),
	(154,'',0,1,1,0,1,'2017-11-11 17:56:01','2017-11-11 17:56:01'),
	(155,'',0,1,1,0,1,'2017-11-11 17:57:00','2017-11-11 17:57:00'),
	(156,'',155,1,1,0,1,'2017-11-11 17:57:37','2017-11-11 17:57:37'),
	(157,'',155,1,1,0,1,'2017-11-11 17:58:04','2017-11-11 17:58:04'),
	(158,'',155,1,1,0,1,'2017-11-11 17:58:41','2017-11-11 17:58:41'),
	(159,'',155,1,1,0,1,'2017-11-11 17:59:08','2017-11-11 17:59:08'),
	(160,'',143,1,1,0,1,'2017-11-11 18:32:10','2017-11-11 18:32:10'),
	(161,'',143,1,1,0,1,'2017-11-11 18:32:44','2017-11-11 18:32:44'),
	(162,'',143,1,1,0,1,'2017-11-11 18:33:15','2017-11-11 18:33:15'),
	(163,'',143,1,1,0,1,'2017-11-11 18:33:48','2017-11-11 18:33:48'),
	(164,'',143,0,1,0,1,'2017-11-11 18:34:14','2017-11-11 18:34:40'),
	(165,'',143,1,1,0,1,'2017-11-11 18:35:30','2017-11-11 18:35:30'),
	(166,'',143,1,1,0,1,'2017-11-11 18:35:57','2017-11-11 18:35:57'),
	(167,'',143,1,1,0,1,'2017-11-11 18:36:29','2017-11-11 18:36:29'),
	(168,'',143,1,1,0,1,'2017-11-11 18:37:00','2017-11-11 18:37:00'),
	(169,'',143,1,1,0,1,'2017-11-11 18:37:29','2017-11-11 18:37:29');

/*!40000 ALTER TABLE `category` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table category_description
# ------------------------------------------------------------

DROP TABLE IF EXISTS `category_description`;

CREATE TABLE `category_description` (
  `category_id` int(11) NOT NULL,
  `language_id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `description` text NOT NULL,
  `meta_title` varchar(255) NOT NULL,
  `meta_description` varchar(255) NOT NULL,
  `meta_keyword` varchar(255) NOT NULL,
  PRIMARY KEY (`category_id`,`language_id`),
  KEY `name` (`name`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

LOCK TABLES `category_description` WRITE;
/*!40000 ALTER TABLE `category_description` DISABLE KEYS */;

INSERT INTO `category_description` (`category_id`, `language_id`, `name`, `description`, `meta_title`, `meta_description`, `meta_keyword`)
VALUES
	(124,1,'Solitaire','','Rings -Solitaire','',''),
	(125,1,'Twins','','Rings - Twins','',''),
	(126,1,'Trios','','Rings - Trios','',''),
	(127,1,'Ring Earring Pendant','','Matching Sets - Ring Earring Pendant','',''),
	(123,1,'Semi Mounts','','Rings - Semi Mounts','',''),
	(98,1,'Rings','','rings','',''),
	(99,1,'Pendants','','Pendants','',''),
	(100,1,'Earrings','','Earrings','',''),
	(101,1,'Necklaces','','Necklaces','',''),
	(102,1,'Bangles','','Bangles','',''),
	(103,1,'Bracelets','','Bracelets','',''),
	(104,1,'Tanmaniyas','','Tanmaniyas','',''),
	(105,1,'Nose Pins','','Nose Pins','',''),
	(106,1,'Cuff Links','','Cuff-Links','',''),
	(107,1,'Chains','','Chains','',''),
	(108,1,'Anklets','','Anklets','',''),
	(109,1,'Matching Sets','','Matching Sets','',''),
	(110,1,'MangalSutras','','MangalSutras','',''),
	(111,1,'Watches','','Watches','',''),
	(112,1,'Studs','','Earring - Studs','',''),
	(113,1,'Jhumka','','Earring - Jhumka','',''),
	(114,1,'Chandbali','','Earring - Chandbali','',''),
	(115,1,'Hoop','','Earring - Hoop &amp; Huggies','',''),
	(116,1,'Alphabet','','Pendants - Alphabet','',''),
	(117,1,'Fashion','','Pendants - Fashion','',''),
	(118,1,'Religious','','Pendants - Religious','',''),
	(119,1,'Heart','','Pendants - Heart','',''),
	(120,1,'Flower','','Pendants - Flower','',''),
	(121,1,'Fashion','','Rings - Fashion','',''),
	(122,1,'Bridal','','Rings - Bridal','',''),
	(128,1,'Earring Pendant','','Matching Sets - Earring Pendant','',''),
	(129,1,'Necklace Earring Ring Bangles','','Matching Sets - Necklace Earring Ring Bangles','',''),
	(130,1,'Necklace Earring Ring','','Matching Sets - Necklace Earring Ring','',''),
	(131,1,'Necklace Earring','','Matching Sets - Necklace Earring','',''),
	(132,1,'Models','','Models','',''),
	(133,1,'Rings','','Ring - Models','',''),
	(134,1,'Pendants','','Pendant - Models','',''),
	(135,1,'Earrings','','Earring - Models','',''),
	(136,1,'Necklaces','','Necklace - Models','',''),
	(137,1,'Bangles','','Bangles - Models','',''),
	(138,1,'Bracelets','','Bracelet - Models','',''),
	(139,1,'Tanmaniyas','','Tanmaniya - Models','',''),
	(140,1,'Watches','','Watch - Models','',''),
	(141,1,'Cuff Links','','Cuff-Links - Models','',''),
	(142,1,'Mangalsutras','','Mangalsutra - Models','',''),
	(143,1,'Moulds','','Moulds','',''),
	(144,1,'Packaging &amp; Displays','','Packaging &amp; Displays','',''),
	(145,1,'Tools &amp; Machinery','','Tools &amp; Machinery','',''),
	(146,1,'Used Machines','','Used Machines','',''),
	(147,1,'Books &amp; Catalogue','','Books &amp; Catalogue','',''),
	(148,1,'Books','','Books - Books &amp; Catalogue','',''),
	(149,1,'Catalogue','','Catalogues - Books &amp; Catalogue','',''),
	(150,1,'Magazines','','Magazines - Books &amp; Catalogue','',''),
	(151,1,'Freelance','','Freelance Services','',''),
	(152,1,'CAM Processing','','CAM Processing','',''),
	(153,1,'Gold','','Raw Gold','',''),
	(154,1,'Jewellery Institute','','Jewellery Institutes','',''),
	(155,1,'Stones','','Stones','',''),
	(156,1,'Diamonds','','Diamond - Stones','',''),
	(157,1,'Gems','','Gem Stones','',''),
	(158,1,'American Diamonds','','American Diamond Stones','',''),
	(159,1,'Pearls','','Pearl Stones','',''),
	(160,1,'Rings','','Rings - Moulds','',''),
	(161,1,'Earrings','','Earring - Moulds','',''),
	(162,1,'Pendants','','Pendant - Moulds','',''),
	(163,1,'Necklaces','','Necklace - Moulds','',''),
	(164,1,'Bangles','','Bangles - Moulds','',''),
	(165,1,'Bracelets','','Bracelet - Moulds','',''),
	(166,1,'Tanmaniyas','','Tanmaniya - Moulds','',''),
	(167,1,'Watches','','Watch - Moulds','',''),
	(168,1,'Cuff Links','','Cuff-Links - Moulds','',''),
	(169,1,'Mangalsutras','','Mangalsutra - Moulds','','');

/*!40000 ALTER TABLE `category_description` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table category_filter
# ------------------------------------------------------------

DROP TABLE IF EXISTS `category_filter`;

CREATE TABLE `category_filter` (
  `category_id` int(11) NOT NULL,
  `filter_id` int(11) NOT NULL,
  PRIMARY KEY (`category_id`,`filter_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

LOCK TABLES `category_filter` WRITE;
/*!40000 ALTER TABLE `category_filter` DISABLE KEYS */;

INSERT INTO `category_filter` (`category_id`, `filter_id`)
VALUES
	(98,1),
	(98,2),
	(98,3),
	(98,4),
	(98,5),
	(98,6),
	(98,7),
	(98,8),
	(98,9),
	(98,10),
	(98,11),
	(98,12),
	(98,13),
	(98,14),
	(98,15),
	(98,16),
	(98,17),
	(99,1),
	(99,2),
	(99,3),
	(99,4),
	(99,5),
	(99,6),
	(99,7),
	(99,8),
	(99,9),
	(99,10),
	(99,11),
	(99,12),
	(99,13),
	(99,14),
	(99,15),
	(99,16),
	(99,17),
	(100,1),
	(100,2),
	(100,3),
	(100,4),
	(100,5),
	(100,6),
	(100,7),
	(100,8),
	(100,9),
	(100,10),
	(100,11),
	(100,12),
	(100,13),
	(100,14),
	(100,15),
	(100,16),
	(100,17),
	(101,1),
	(101,2),
	(101,3),
	(101,4),
	(101,5),
	(101,6),
	(101,7),
	(101,8),
	(101,9),
	(101,10),
	(101,11),
	(101,12),
	(101,13),
	(101,14),
	(101,15),
	(101,16),
	(101,17),
	(102,1),
	(102,2),
	(102,3),
	(102,4),
	(102,5),
	(102,6),
	(102,7),
	(102,8),
	(102,9),
	(102,10),
	(102,11),
	(102,12),
	(102,13),
	(102,14),
	(102,15),
	(102,16),
	(102,17),
	(103,1),
	(103,2),
	(103,3),
	(103,4),
	(103,5),
	(103,6),
	(103,7),
	(103,8),
	(103,9),
	(103,10),
	(103,11),
	(103,12),
	(103,13),
	(103,14),
	(103,15),
	(103,16),
	(103,17),
	(104,1),
	(104,2),
	(104,3),
	(104,4),
	(104,5),
	(104,6),
	(104,7),
	(104,8),
	(104,9),
	(104,10),
	(104,11),
	(104,12),
	(104,13),
	(104,14),
	(104,15),
	(104,16),
	(104,17),
	(105,1),
	(105,2),
	(105,3),
	(105,4),
	(105,5),
	(105,6),
	(105,7),
	(105,8),
	(105,9),
	(105,10),
	(105,11),
	(105,12),
	(105,13),
	(105,14),
	(105,15),
	(105,16),
	(105,17),
	(106,1),
	(106,2),
	(106,3),
	(106,4),
	(106,5),
	(106,6),
	(106,7),
	(106,8),
	(106,9),
	(106,10),
	(106,11),
	(106,12),
	(106,13),
	(106,14),
	(106,15),
	(106,16),
	(106,17),
	(107,1),
	(107,2),
	(107,3),
	(107,4),
	(107,5),
	(107,6),
	(107,7),
	(107,8),
	(107,9),
	(107,10),
	(107,11),
	(107,12),
	(107,13),
	(107,14),
	(107,15),
	(107,16),
	(107,17),
	(108,1),
	(108,2),
	(108,3),
	(108,4),
	(108,5),
	(108,6),
	(108,7),
	(108,8),
	(108,9),
	(108,10),
	(108,11),
	(108,12),
	(108,13),
	(108,14),
	(108,15),
	(108,16),
	(108,17),
	(109,1),
	(109,2),
	(109,3),
	(109,4),
	(109,5),
	(109,6),
	(109,7),
	(109,8),
	(109,9),
	(109,10),
	(109,11),
	(109,12),
	(109,13),
	(109,14),
	(109,15),
	(109,16),
	(109,17),
	(110,1),
	(110,2),
	(110,3),
	(110,4),
	(110,5),
	(110,6),
	(110,7),
	(110,8),
	(110,9),
	(110,10),
	(110,11),
	(110,12),
	(110,13),
	(110,14),
	(110,15),
	(110,16),
	(110,17),
	(111,1),
	(111,2),
	(111,3),
	(111,4),
	(111,5),
	(111,6),
	(111,7),
	(111,8),
	(111,9),
	(111,10),
	(111,11),
	(111,12),
	(111,13),
	(111,14),
	(111,15),
	(111,16),
	(111,17),
	(112,1),
	(112,2),
	(112,3),
	(112,4),
	(112,5),
	(112,6),
	(112,7),
	(112,8),
	(112,9),
	(112,10),
	(112,11),
	(112,12),
	(112,13),
	(112,14),
	(112,15),
	(112,16),
	(112,17),
	(113,1),
	(113,2),
	(113,3),
	(113,4),
	(113,5),
	(113,6),
	(113,7),
	(113,8),
	(113,9),
	(113,10),
	(113,11),
	(113,12),
	(113,13),
	(113,14),
	(113,15),
	(113,16),
	(113,17),
	(114,1),
	(114,2),
	(114,3),
	(114,4),
	(114,5),
	(114,6),
	(114,7),
	(114,8),
	(114,9),
	(114,10),
	(114,11),
	(114,12),
	(114,13),
	(114,14),
	(114,15),
	(114,16),
	(114,17),
	(115,1),
	(115,2),
	(115,3),
	(115,4),
	(115,5),
	(115,6),
	(115,7),
	(115,8),
	(115,9),
	(115,10),
	(115,11),
	(115,12),
	(115,13),
	(115,14),
	(115,15),
	(115,16),
	(115,17),
	(116,1),
	(116,2),
	(116,3),
	(116,4),
	(116,5),
	(116,6),
	(116,7),
	(116,8),
	(116,9),
	(116,10),
	(116,11),
	(116,12),
	(116,13),
	(116,14),
	(116,15),
	(116,16),
	(116,17),
	(117,1),
	(117,2),
	(117,3),
	(117,4),
	(117,5),
	(117,6),
	(117,7),
	(117,8),
	(117,9),
	(117,10),
	(117,11),
	(117,12),
	(117,13),
	(117,14),
	(117,15),
	(117,16),
	(117,17),
	(118,1),
	(118,2),
	(118,3),
	(118,4),
	(118,5),
	(118,6),
	(118,7),
	(118,8),
	(118,9),
	(118,10),
	(118,11),
	(118,12),
	(118,13),
	(118,14),
	(118,15),
	(118,16),
	(118,17),
	(119,1),
	(119,2),
	(119,3),
	(119,4),
	(119,5),
	(119,6),
	(119,7),
	(119,8),
	(119,9),
	(119,10),
	(119,11),
	(119,12),
	(119,13),
	(119,14),
	(119,15),
	(119,16),
	(119,17),
	(120,1),
	(120,2),
	(120,3),
	(120,4),
	(120,5),
	(120,6),
	(120,7),
	(120,8),
	(120,9),
	(120,10),
	(120,11),
	(120,12),
	(120,13),
	(120,14),
	(120,15),
	(120,16),
	(120,17),
	(121,1),
	(121,2),
	(121,3),
	(121,4),
	(121,5),
	(121,6),
	(121,7),
	(121,8),
	(121,9),
	(121,10),
	(121,11),
	(121,12),
	(121,13),
	(121,14),
	(121,15),
	(121,16),
	(121,17),
	(122,1),
	(122,2),
	(122,3),
	(122,4),
	(122,5),
	(122,6),
	(122,7),
	(122,8),
	(122,9),
	(122,10),
	(122,11),
	(122,12),
	(122,13),
	(122,14),
	(122,15),
	(122,16),
	(122,17),
	(123,1),
	(123,2),
	(123,3),
	(123,4),
	(123,5),
	(123,6),
	(123,7),
	(123,8),
	(123,9),
	(123,10),
	(123,11),
	(123,12),
	(123,13),
	(123,14),
	(123,15),
	(123,16),
	(123,17),
	(124,1),
	(124,2),
	(124,3),
	(124,4),
	(124,5),
	(124,6),
	(124,7),
	(124,8),
	(124,9),
	(124,10),
	(124,11),
	(124,12),
	(124,13),
	(124,14),
	(124,15),
	(124,16),
	(124,17),
	(125,1),
	(125,2),
	(125,3),
	(125,4),
	(125,5),
	(125,6),
	(125,7),
	(125,8),
	(125,9),
	(125,10),
	(125,11),
	(125,12),
	(125,13),
	(125,14),
	(125,15),
	(125,16),
	(125,17),
	(126,1),
	(126,2),
	(126,3),
	(126,4),
	(126,5),
	(126,6),
	(126,7),
	(126,8),
	(126,9),
	(126,10),
	(126,11),
	(126,12),
	(126,13),
	(126,14),
	(126,15),
	(126,16),
	(126,17),
	(127,1),
	(127,2),
	(127,3),
	(127,4),
	(127,5),
	(127,6),
	(127,7),
	(127,8),
	(127,9),
	(127,10),
	(127,11),
	(127,12),
	(127,13),
	(127,14),
	(127,15),
	(127,16),
	(127,17),
	(128,1),
	(128,2),
	(128,3),
	(128,4),
	(128,5),
	(128,6),
	(128,7),
	(128,8),
	(128,9),
	(128,10),
	(128,11),
	(128,12),
	(128,13),
	(128,14),
	(128,15),
	(128,16),
	(128,17),
	(129,1),
	(129,2),
	(129,3),
	(129,4),
	(129,5),
	(129,6),
	(129,7),
	(129,8),
	(129,9),
	(129,10),
	(129,11),
	(129,12),
	(129,13),
	(129,14),
	(129,15),
	(129,16),
	(129,17),
	(130,1),
	(130,2),
	(130,3),
	(130,4),
	(130,5),
	(130,6),
	(130,7),
	(130,8),
	(130,9),
	(130,10),
	(130,11),
	(130,12),
	(130,13),
	(130,14),
	(130,15),
	(130,16),
	(130,17),
	(131,1),
	(131,2),
	(131,3),
	(131,4),
	(131,5),
	(131,6),
	(131,7),
	(131,8),
	(131,9),
	(131,10),
	(131,11),
	(131,12),
	(131,13),
	(131,14),
	(131,15),
	(131,16),
	(131,17);

/*!40000 ALTER TABLE `category_filter` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table category_path
# ------------------------------------------------------------

DROP TABLE IF EXISTS `category_path`;

CREATE TABLE `category_path` (
  `category_id` int(11) NOT NULL,
  `path_id` int(11) NOT NULL,
  `level` int(11) NOT NULL,
  PRIMARY KEY (`category_id`,`path_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

LOCK TABLES `category_path` WRITE;
/*!40000 ALTER TABLE `category_path` DISABLE KEYS */;

INSERT INTO `category_path` (`category_id`, `path_id`, `level`)
VALUES
	(149,149,1),
	(149,147,0),
	(146,146,0),
	(147,147,0),
	(148,147,0),
	(143,143,0),
	(144,144,0),
	(145,145,0),
	(141,141,1),
	(142,132,0),
	(142,142,1),
	(140,132,0),
	(140,140,1),
	(141,132,0),
	(138,138,1),
	(139,132,0),
	(139,139,1),
	(137,132,0),
	(138,132,0),
	(137,137,1),
	(136,132,0),
	(136,136,1),
	(135,135,1),
	(107,107,0),
	(111,111,0),
	(112,100,0),
	(104,104,0),
	(109,109,0),
	(150,147,0),
	(148,148,1),
	(108,108,0),
	(102,102,0),
	(106,106,0),
	(105,105,0),
	(119,99,0),
	(119,119,1),
	(120,99,0),
	(117,117,1),
	(118,99,0),
	(118,118,1),
	(116,99,0),
	(116,116,1),
	(117,99,0),
	(130,109,0),
	(131,109,0),
	(130,130,1),
	(100,100,0),
	(103,103,0),
	(98,98,0),
	(101,101,0),
	(110,110,0),
	(99,99,0),
	(115,115,1),
	(115,100,0),
	(114,100,0),
	(114,114,1),
	(113,100,0),
	(113,113,1),
	(129,109,0),
	(129,129,1),
	(112,112,1),
	(120,120,1),
	(127,127,1),
	(128,109,0),
	(128,128,1),
	(124,124,1),
	(125,98,0),
	(133,133,1),
	(134,132,0),
	(135,132,0),
	(134,134,1),
	(123,123,1),
	(122,122,1),
	(123,98,0),
	(133,132,0),
	(132,132,0),
	(131,131,1),
	(126,126,1),
	(127,109,0),
	(126,98,0),
	(125,125,1),
	(122,98,0),
	(121,121,1),
	(121,98,0),
	(124,98,0),
	(150,150,1),
	(151,151,0),
	(152,152,0),
	(153,153,0),
	(154,154,0),
	(155,155,0),
	(156,155,0),
	(156,156,1),
	(157,155,0),
	(157,157,1),
	(158,155,0),
	(158,158,1),
	(159,155,0),
	(159,159,1),
	(160,143,0),
	(160,160,1),
	(161,143,0),
	(161,161,1),
	(162,143,0),
	(162,162,1),
	(163,143,0),
	(163,163,1),
	(164,143,0),
	(164,164,1),
	(165,143,0),
	(165,165,1),
	(166,143,0),
	(166,166,1),
	(167,143,0),
	(167,167,1),
	(168,143,0),
	(168,168,1),
	(169,143,0),
	(169,169,1);

/*!40000 ALTER TABLE `category_path` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table category_to_layout
# ------------------------------------------------------------

DROP TABLE IF EXISTS `category_to_layout`;

CREATE TABLE `category_to_layout` (
  `category_id` int(11) NOT NULL,
  `store_id` int(11) NOT NULL,
  `layout_id` int(11) NOT NULL,
  PRIMARY KEY (`category_id`,`store_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

LOCK TABLES `category_to_layout` WRITE;
/*!40000 ALTER TABLE `category_to_layout` DISABLE KEYS */;

INSERT INTO `category_to_layout` (`category_id`, `store_id`, `layout_id`)
VALUES
	(122,0,0),
	(112,0,0),
	(120,0,0),
	(113,0,0),
	(116,0,0),
	(105,0,0),
	(98,0,0),
	(118,0,0),
	(106,0,0),
	(107,0,0),
	(108,0,0),
	(99,0,0),
	(100,0,0),
	(101,0,0),
	(119,0,0),
	(109,0,0),
	(110,0,0),
	(111,0,0),
	(102,0,0),
	(103,0,0),
	(104,0,0),
	(123,0,0),
	(124,0,0),
	(125,0,0),
	(126,0,0),
	(127,0,0),
	(128,0,0),
	(129,0,0),
	(130,0,0),
	(115,0,0),
	(121,0,0),
	(117,0,0),
	(114,0,0),
	(131,0,0),
	(132,0,0),
	(133,0,0),
	(134,0,0),
	(135,0,0),
	(136,0,0),
	(137,0,0),
	(138,0,0),
	(139,0,0),
	(140,0,0),
	(141,0,0),
	(142,0,0),
	(143,0,0),
	(144,0,0),
	(145,0,0),
	(146,0,0),
	(147,0,0),
	(148,0,0),
	(149,0,0),
	(150,0,0),
	(151,0,0),
	(152,0,0),
	(153,0,0),
	(154,0,0),
	(155,0,0),
	(156,0,0),
	(157,0,0),
	(158,0,0),
	(159,0,0),
	(160,0,0),
	(161,0,0),
	(162,0,0),
	(163,0,0),
	(164,0,0),
	(165,0,0),
	(166,0,0),
	(167,0,0),
	(168,0,0),
	(169,0,0);

/*!40000 ALTER TABLE `category_to_layout` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table category_to_store
# ------------------------------------------------------------

DROP TABLE IF EXISTS `category_to_store`;

CREATE TABLE `category_to_store` (
  `category_id` int(11) NOT NULL,
  `store_id` int(11) NOT NULL,
  PRIMARY KEY (`category_id`,`store_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

LOCK TABLES `category_to_store` WRITE;
/*!40000 ALTER TABLE `category_to_store` DISABLE KEYS */;

INSERT INTO `category_to_store` (`category_id`, `store_id`)
VALUES
	(98,0),
	(99,0),
	(100,0),
	(101,0),
	(102,0),
	(103,0),
	(104,0),
	(105,0),
	(106,0),
	(107,0),
	(108,0),
	(109,0),
	(110,0),
	(111,0),
	(112,0),
	(113,0),
	(114,0),
	(115,0),
	(116,0),
	(117,0),
	(118,0),
	(119,0),
	(120,0),
	(121,0),
	(122,0),
	(123,0),
	(124,0),
	(125,0),
	(126,0),
	(127,0),
	(128,0),
	(129,0),
	(130,0),
	(131,0),
	(132,0),
	(133,0),
	(134,0),
	(135,0),
	(136,0),
	(137,0),
	(138,0),
	(139,0),
	(140,0),
	(141,0),
	(142,0),
	(143,0),
	(144,0),
	(145,0),
	(146,0),
	(147,0),
	(148,0),
	(149,0),
	(150,0),
	(151,0),
	(152,0),
	(153,0),
	(154,0),
	(155,0),
	(156,0),
	(157,0),
	(158,0),
	(159,0),
	(160,0),
	(161,0),
	(162,0),
	(163,0),
	(164,0),
	(165,0),
	(166,0),
	(167,0),
	(168,0),
	(169,0);

/*!40000 ALTER TABLE `category_to_store` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table category_to_user_group
# ------------------------------------------------------------

DROP TABLE IF EXISTS `category_to_user_group`;

CREATE TABLE `category_to_user_group` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `category_id` int(11) NOT NULL,
  `user_group_id` int(11) NOT NULL,
  `dataTime` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

LOCK TABLES `category_to_user_group` WRITE;
/*!40000 ALTER TABLE `category_to_user_group` DISABLE KEYS */;

INSERT INTO `category_to_user_group` (`id`, `category_id`, `user_group_id`, `dataTime`)
VALUES
	(47,100,11,'2017-11-04 18:08:47'),
	(46,99,13,'2017-11-04 18:08:22'),
	(53,102,11,'2017-11-04 18:09:41'),
	(52,101,13,'2017-11-04 18:09:16'),
	(54,102,12,'2017-11-04 18:09:41'),
	(49,100,13,'2017-11-04 18:08:47'),
	(13,67,13,'2017-07-24 16:37:23'),
	(14,68,13,'2017-07-24 16:38:17'),
	(15,69,13,'2017-07-24 16:38:55'),
	(44,99,11,'2017-11-04 18:08:22'),
	(43,98,13,'2017-11-04 18:04:30'),
	(41,98,11,'2017-11-04 18:04:30'),
	(48,100,12,'2017-11-04 18:08:47'),
	(21,74,13,'2017-07-24 16:44:43'),
	(22,75,13,'2017-07-24 16:45:17'),
	(23,76,13,'2017-07-24 16:45:59'),
	(42,98,12,'2017-11-04 18:04:30'),
	(45,99,12,'2017-11-04 18:08:22'),
	(51,101,12,'2017-11-04 18:09:16'),
	(50,101,11,'2017-11-04 18:09:16'),
	(55,102,13,'2017-11-04 18:09:41'),
	(56,103,11,'2017-11-04 18:10:08'),
	(57,103,12,'2017-11-04 18:10:08'),
	(58,103,13,'2017-11-04 18:10:08'),
	(59,104,11,'2017-11-04 18:10:38'),
	(60,104,12,'2017-11-04 18:10:38'),
	(61,104,13,'2017-11-04 18:10:38'),
	(62,105,11,'2017-11-04 18:13:39'),
	(63,105,12,'2017-11-04 18:13:39'),
	(64,105,13,'2017-11-04 18:13:39'),
	(65,106,11,'2017-11-04 18:14:05'),
	(66,106,12,'2017-11-04 18:14:05'),
	(67,106,13,'2017-11-04 18:14:05'),
	(68,107,11,'2017-11-04 18:14:35'),
	(69,107,12,'2017-11-04 18:14:35'),
	(70,107,13,'2017-11-04 18:14:35'),
	(71,108,11,'2017-11-04 18:15:01'),
	(72,108,12,'2017-11-04 18:15:01'),
	(73,108,13,'2017-11-04 18:15:01'),
	(74,109,11,'2017-11-04 18:15:28'),
	(75,109,12,'2017-11-04 18:15:28'),
	(76,109,13,'2017-11-04 18:15:28'),
	(182,110,13,'2017-11-20 17:36:09'),
	(181,110,12,'2017-11-20 17:36:09'),
	(180,110,11,'2017-11-20 17:36:09'),
	(80,111,11,'2017-11-04 18:16:35'),
	(81,111,12,'2017-11-04 18:16:35'),
	(82,111,13,'2017-11-04 18:16:35'),
	(83,113,11,'2017-11-04 18:22:48'),
	(84,113,12,'2017-11-04 18:22:48'),
	(85,113,13,'2017-11-04 18:22:48'),
	(86,114,11,'2017-11-04 18:23:33'),
	(87,114,12,'2017-11-04 18:23:33'),
	(88,114,13,'2017-11-04 18:23:33'),
	(94,115,13,'2017-11-04 18:25:30'),
	(93,115,12,'2017-11-04 18:25:30'),
	(92,115,11,'2017-11-04 18:25:30'),
	(95,116,11,'2017-11-04 18:28:59'),
	(96,116,12,'2017-11-04 18:28:59'),
	(97,116,13,'2017-11-04 18:28:59'),
	(98,117,11,'2017-11-04 18:29:43'),
	(99,117,12,'2017-11-04 18:29:43'),
	(100,117,13,'2017-11-04 18:29:43'),
	(101,118,11,'2017-11-04 18:30:46'),
	(102,118,12,'2017-11-04 18:30:46'),
	(103,118,13,'2017-11-04 18:30:46'),
	(104,120,11,'2017-11-04 18:31:50'),
	(105,120,12,'2017-11-04 18:31:50'),
	(106,120,13,'2017-11-04 18:31:50'),
	(107,121,11,'2017-11-04 19:10:30'),
	(108,121,12,'2017-11-04 19:10:30'),
	(109,121,13,'2017-11-04 19:10:30'),
	(110,122,11,'2017-11-04 19:13:00'),
	(111,122,12,'2017-11-04 19:13:00'),
	(112,122,13,'2017-11-04 19:13:00'),
	(113,123,11,'2017-11-04 19:13:58'),
	(114,123,12,'2017-11-04 19:13:58'),
	(115,123,13,'2017-11-04 19:13:58'),
	(116,124,11,'2017-11-04 19:14:35'),
	(117,124,12,'2017-11-04 19:14:35'),
	(118,124,13,'2017-11-04 19:14:35'),
	(119,125,11,'2017-11-04 19:15:18'),
	(120,125,12,'2017-11-04 19:15:18'),
	(121,125,13,'2017-11-04 19:15:18'),
	(122,126,11,'2017-11-04 19:15:50'),
	(123,126,12,'2017-11-04 19:15:50'),
	(124,126,13,'2017-11-04 19:15:50'),
	(125,127,11,'2017-11-04 19:17:11'),
	(126,127,12,'2017-11-04 19:17:11'),
	(127,127,13,'2017-11-04 19:17:11'),
	(128,128,11,'2017-11-04 19:17:44'),
	(129,128,12,'2017-11-04 19:17:44'),
	(130,128,13,'2017-11-04 19:17:44'),
	(131,129,11,'2017-11-04 19:18:42'),
	(132,129,12,'2017-11-04 19:18:42'),
	(133,129,13,'2017-11-04 19:18:42'),
	(134,130,11,'2017-11-04 19:19:28'),
	(135,130,12,'2017-11-04 19:19:28'),
	(136,130,13,'2017-11-04 19:19:28'),
	(137,131,11,'2017-11-04 19:20:09'),
	(138,131,12,'2017-11-04 19:20:09'),
	(139,131,13,'2017-11-04 19:20:09'),
	(141,132,18,'2017-11-11 17:40:26'),
	(146,134,18,'2017-11-11 17:44:14'),
	(145,135,18,'2017-11-11 17:43:43'),
	(144,136,18,'2017-11-11 17:43:28'),
	(147,137,18,'2017-11-11 17:44:50'),
	(148,138,18,'2017-11-11 17:45:31'),
	(149,139,18,'2017-11-11 17:46:28'),
	(150,140,18,'2017-11-11 17:47:32'),
	(151,141,18,'2017-11-11 17:48:06'),
	(152,142,18,'2017-11-11 17:48:47'),
	(153,143,18,'2017-11-11 17:49:14'),
	(154,144,18,'2017-11-11 17:49:53'),
	(155,145,18,'2017-11-11 17:50:36'),
	(156,146,17,'2017-11-11 17:51:07'),
	(157,147,18,'2017-11-11 17:51:44'),
	(158,148,18,'2017-11-11 17:52:20'),
	(159,149,18,'2017-11-11 17:53:08'),
	(160,150,18,'2017-11-11 17:53:44'),
	(161,151,16,'2017-11-11 17:54:31'),
	(162,152,18,'2017-11-11 17:55:06'),
	(163,153,18,'2017-11-11 17:55:27'),
	(164,154,18,'2017-11-11 17:56:01'),
	(165,155,18,'2017-11-11 17:57:00'),
	(166,156,18,'2017-11-11 17:57:37'),
	(167,157,18,'2017-11-11 17:58:04'),
	(168,158,18,'2017-11-11 17:58:41'),
	(169,159,18,'2017-11-11 17:59:08'),
	(170,160,18,'2017-11-11 18:32:10'),
	(171,161,18,'2017-11-11 18:32:44'),
	(172,162,18,'2017-11-11 18:33:15'),
	(173,163,18,'2017-11-11 18:33:48'),
	(174,164,18,'2017-11-11 18:34:40'),
	(175,165,18,'2017-11-11 18:35:30'),
	(176,166,18,'2017-11-11 18:35:57'),
	(177,167,18,'2017-11-11 18:36:29'),
	(178,168,18,'2017-11-11 18:37:00'),
	(179,169,18,'2017-11-11 18:37:29');

/*!40000 ALTER TABLE `category_to_user_group` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table country
# ------------------------------------------------------------

DROP TABLE IF EXISTS `country`;

CREATE TABLE `country` (
  `country_id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(128) NOT NULL,
  `iso_code_2` varchar(2) NOT NULL,
  `iso_code_3` varchar(3) NOT NULL,
  `address_format` text NOT NULL,
  `postcode_required` tinyint(1) NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`country_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

LOCK TABLES `country` WRITE;
/*!40000 ALTER TABLE `country` DISABLE KEYS */;

INSERT INTO `country` (`country_id`, `name`, `iso_code_2`, `iso_code_3`, `address_format`, `postcode_required`, `status`)
VALUES
	(1,'Afghanistan','AF','AFG','',0,1),
	(2,'Albania','AL','ALB','',0,1),
	(3,'Algeria','DZ','DZA','',0,1),
	(4,'American Samoa','AS','ASM','',0,1),
	(5,'Andorra','AD','AND','',0,1),
	(6,'Angola','AO','AGO','',0,1),
	(7,'Anguilla','AI','AIA','',0,1),
	(8,'Antarctica','AQ','ATA','',0,1),
	(9,'Antigua and Barbuda','AG','ATG','',0,1),
	(10,'Argentina','AR','ARG','',0,1),
	(11,'Armenia','AM','ARM','',0,1),
	(12,'Aruba','AW','ABW','',0,1),
	(13,'Australia','AU','AUS','',0,1),
	(14,'Austria','AT','AUT','',0,1),
	(15,'Azerbaijan','AZ','AZE','',0,1),
	(16,'Bahamas','BS','BHS','',0,1),
	(17,'Bahrain','BH','BHR','',0,1),
	(18,'Bangladesh','BD','BGD','',0,1),
	(19,'Barbados','BB','BRB','',0,1),
	(20,'Belarus','BY','BLR','',0,1),
	(21,'Belgium','BE','BEL','{firstname} {lastname}\r\n{company}\r\n{address_1}\r\n{address_2}\r\n{postcode} {city}\r\n{country}',0,1),
	(22,'Belize','BZ','BLZ','',0,1),
	(23,'Benin','BJ','BEN','',0,1),
	(24,'Bermuda','BM','BMU','',0,1),
	(25,'Bhutan','BT','BTN','',0,1),
	(26,'Bolivia','BO','BOL','',0,1),
	(27,'Bosnia and Herzegovina','BA','BIH','',0,1),
	(28,'Botswana','BW','BWA','',0,1),
	(29,'Bouvet Island','BV','BVT','',0,1),
	(30,'Brazil','BR','BRA','',0,1),
	(31,'British Indian Ocean Territory','IO','IOT','',0,1),
	(32,'Brunei Darussalam','BN','BRN','',0,1),
	(33,'Bulgaria','BG','BGR','',0,1),
	(34,'Burkina Faso','BF','BFA','',0,1),
	(35,'Burundi','BI','BDI','',0,1),
	(36,'Cambodia','KH','KHM','',0,1),
	(37,'Cameroon','CM','CMR','',0,1),
	(38,'Canada','CA','CAN','',0,1),
	(39,'Cape Verde','CV','CPV','',0,1),
	(40,'Cayman Islands','KY','CYM','',0,1),
	(41,'Central African Republic','CF','CAF','',0,1),
	(42,'Chad','TD','TCD','',0,1),
	(43,'Chile','CL','CHL','',0,1),
	(44,'China','CN','CHN','',0,1),
	(45,'Christmas Island','CX','CXR','',0,1),
	(46,'Cocos (Keeling) Islands','CC','CCK','',0,1),
	(47,'Colombia','CO','COL','',0,1),
	(48,'Comoros','KM','COM','',0,1),
	(49,'Congo','CG','COG','',0,1),
	(50,'Cook Islands','CK','COK','',0,1),
	(51,'Costa Rica','CR','CRI','',0,1),
	(52,'Cote D\'Ivoire','CI','CIV','',0,1),
	(53,'Croatia','HR','HRV','',0,1),
	(54,'Cuba','CU','CUB','',0,1),
	(55,'Cyprus','CY','CYP','',0,1),
	(56,'Czech Republic','CZ','CZE','',0,1),
	(57,'Denmark','DK','DNK','',0,1),
	(58,'Djibouti','DJ','DJI','',0,1),
	(59,'Dominica','DM','DMA','',0,1),
	(60,'Dominican Republic','DO','DOM','',0,1),
	(61,'East Timor','TL','TLS','',0,1),
	(62,'Ecuador','EC','ECU','',0,1),
	(63,'Egypt','EG','EGY','',0,1),
	(64,'El Salvador','SV','SLV','',0,1),
	(65,'Equatorial Guinea','GQ','GNQ','',0,1),
	(66,'Eritrea','ER','ERI','',0,1),
	(67,'Estonia','EE','EST','',0,1),
	(68,'Ethiopia','ET','ETH','',0,1),
	(69,'Falkland Islands (Malvinas)','FK','FLK','',0,1),
	(70,'Faroe Islands','FO','FRO','',0,1),
	(71,'Fiji','FJ','FJI','',0,1),
	(72,'Finland','FI','FIN','',0,1),
	(74,'France, Metropolitan','FR','FRA','{firstname} {lastname}\r\n{company}\r\n{address_1}\r\n{address_2}\r\n{postcode} {city}\r\n{country}',1,1),
	(75,'French Guiana','GF','GUF','',0,1),
	(76,'French Polynesia','PF','PYF','',0,1),
	(77,'French Southern Territories','TF','ATF','',0,1),
	(78,'Gabon','GA','GAB','',0,1),
	(79,'Gambia','GM','GMB','',0,1),
	(80,'Georgia','GE','GEO','',0,1),
	(81,'Germany','DE','DEU','{company}\r\n{firstname} {lastname}\r\n{address_1}\r\n{address_2}\r\n{postcode} {city}\r\n{country}',1,1),
	(82,'Ghana','GH','GHA','',0,1),
	(83,'Gibraltar','GI','GIB','',0,1),
	(84,'Greece','GR','GRC','',0,1),
	(85,'Greenland','GL','GRL','',0,1),
	(86,'Grenada','GD','GRD','',0,1),
	(87,'Guadeloupe','GP','GLP','',0,1),
	(88,'Guam','GU','GUM','',0,1),
	(89,'Guatemala','GT','GTM','',0,1),
	(90,'Guinea','GN','GIN','',0,1),
	(91,'Guinea-Bissau','GW','GNB','',0,1),
	(92,'Guyana','GY','GUY','',0,1),
	(93,'Haiti','HT','HTI','',0,1),
	(94,'Heard and Mc Donald Islands','HM','HMD','',0,1),
	(95,'Honduras','HN','HND','',0,1),
	(96,'Hong Kong','HK','HKG','',0,1),
	(97,'Hungary','HU','HUN','',0,1),
	(98,'Iceland','IS','ISL','',0,1),
	(99,'India','IN','IND','',0,1),
	(100,'Indonesia','ID','IDN','',0,1),
	(101,'Iran (Islamic Republic of)','IR','IRN','',0,1),
	(102,'Iraq','IQ','IRQ','',0,1),
	(103,'Ireland','IE','IRL','',0,1),
	(104,'Israel','IL','ISR','',0,1),
	(105,'Italy','IT','ITA','',0,1),
	(106,'Jamaica','JM','JAM','',0,1),
	(107,'Japan','JP','JPN','',0,1),
	(108,'Jordan','JO','JOR','',0,1),
	(109,'Kazakhstan','KZ','KAZ','',0,1),
	(110,'Kenya','KE','KEN','',0,1),
	(111,'Kiribati','KI','KIR','',0,1),
	(112,'North Korea','KP','PRK','',0,1),
	(113,'South Korea','KR','KOR','',0,1),
	(114,'Kuwait','KW','KWT','',0,1),
	(115,'Kyrgyzstan','KG','KGZ','',0,1),
	(116,'Lao People\'s Democratic Republic','LA','LAO','',0,1),
	(117,'Latvia','LV','LVA','',0,1),
	(118,'Lebanon','LB','LBN','',0,1),
	(119,'Lesotho','LS','LSO','',0,1),
	(120,'Liberia','LR','LBR','',0,1),
	(121,'Libyan Arab Jamahiriya','LY','LBY','',0,1),
	(122,'Liechtenstein','LI','LIE','',0,1),
	(123,'Lithuania','LT','LTU','',0,1),
	(124,'Luxembourg','LU','LUX','',0,1),
	(125,'Macau','MO','MAC','',0,1),
	(126,'FYROM','MK','MKD','',0,1),
	(127,'Madagascar','MG','MDG','',0,1),
	(128,'Malawi','MW','MWI','',0,1),
	(129,'Malaysia','MY','MYS','',0,1),
	(130,'Maldives','MV','MDV','',0,1),
	(131,'Mali','ML','MLI','',0,1),
	(132,'Malta','MT','MLT','',0,1),
	(133,'Marshall Islands','MH','MHL','',0,1),
	(134,'Martinique','MQ','MTQ','',0,1),
	(135,'Mauritania','MR','MRT','',0,1),
	(136,'Mauritius','MU','MUS','',0,1),
	(137,'Mayotte','YT','MYT','',0,1),
	(138,'Mexico','MX','MEX','',0,1),
	(139,'Micronesia, Federated States of','FM','FSM','',0,1),
	(140,'Moldova, Republic of','MD','MDA','',0,1),
	(141,'Monaco','MC','MCO','',0,1),
	(142,'Mongolia','MN','MNG','',0,1),
	(143,'Montserrat','MS','MSR','',0,1),
	(144,'Morocco','MA','MAR','',0,1),
	(145,'Mozambique','MZ','MOZ','',0,1),
	(146,'Myanmar','MM','MMR','',0,1),
	(147,'Namibia','NA','NAM','',0,1),
	(148,'Nauru','NR','NRU','',0,1),
	(149,'Nepal','NP','NPL','',0,1),
	(150,'Netherlands','NL','NLD','',0,1),
	(151,'Netherlands Antilles','AN','ANT','',0,1),
	(152,'New Caledonia','NC','NCL','',0,1),
	(153,'New Zealand','NZ','NZL','',0,1),
	(154,'Nicaragua','NI','NIC','',0,1),
	(155,'Niger','NE','NER','',0,1),
	(156,'Nigeria','NG','NGA','',0,1),
	(157,'Niue','NU','NIU','',0,1),
	(158,'Norfolk Island','NF','NFK','',0,1),
	(159,'Northern Mariana Islands','MP','MNP','',0,1),
	(160,'Norway','NO','NOR','',0,1),
	(161,'Oman','OM','OMN','',0,1),
	(162,'Pakistan','PK','PAK','',0,1),
	(163,'Palau','PW','PLW','',0,1),
	(164,'Panama','PA','PAN','',0,1),
	(165,'Papua New Guinea','PG','PNG','',0,1),
	(166,'Paraguay','PY','PRY','',0,1),
	(167,'Peru','PE','PER','',0,1),
	(168,'Philippines','PH','PHL','',0,1),
	(169,'Pitcairn','PN','PCN','',0,1),
	(170,'Poland','PL','POL','',0,1),
	(171,'Portugal','PT','PRT','',0,1),
	(172,'Puerto Rico','PR','PRI','',0,1),
	(173,'Qatar','QA','QAT','',0,1),
	(174,'Reunion','RE','REU','',0,1),
	(175,'Romania','RO','ROM','',0,1),
	(176,'Russian Federation','RU','RUS','',0,1),
	(177,'Rwanda','RW','RWA','',0,1),
	(178,'Saint Kitts and Nevis','KN','KNA','',0,1),
	(179,'Saint Lucia','LC','LCA','',0,1),
	(180,'Saint Vincent and the Grenadines','VC','VCT','',0,1),
	(181,'Samoa','WS','WSM','',0,1),
	(182,'San Marino','SM','SMR','',0,1),
	(183,'Sao Tome and Principe','ST','STP','',0,1),
	(184,'Saudi Arabia','SA','SAU','',0,1),
	(185,'Senegal','SN','SEN','',0,1),
	(186,'Seychelles','SC','SYC','',0,1),
	(187,'Sierra Leone','SL','SLE','',0,1),
	(188,'Singapore','SG','SGP','',0,1),
	(189,'Slovak Republic','SK','SVK','{firstname} {lastname}\r\n{company}\r\n{address_1}\r\n{address_2}\r\n{city} {postcode}\r\n{zone}\r\n{country}',0,1),
	(190,'Slovenia','SI','SVN','',0,1),
	(191,'Solomon Islands','SB','SLB','',0,1),
	(192,'Somalia','SO','SOM','',0,1),
	(193,'South Africa','ZA','ZAF','',0,1),
	(194,'South Georgia &amp; South Sandwich Islands','GS','SGS','',0,1),
	(195,'Spain','ES','ESP','',0,1),
	(196,'Sri Lanka','LK','LKA','',0,1),
	(197,'St. Helena','SH','SHN','',0,1),
	(198,'St. Pierre and Miquelon','PM','SPM','',0,1),
	(199,'Sudan','SD','SDN','',0,1),
	(200,'Suriname','SR','SUR','',0,1),
	(201,'Svalbard and Jan Mayen Islands','SJ','SJM','',0,1),
	(202,'Swaziland','SZ','SWZ','',0,1),
	(203,'Sweden','SE','SWE','{company}\r\n{firstname} {lastname}\r\n{address_1}\r\n{address_2}\r\n{postcode} {city}\r\n{country}',1,1),
	(204,'Switzerland','CH','CHE','',0,1),
	(205,'Syrian Arab Republic','SY','SYR','',0,1),
	(206,'Taiwan','TW','TWN','',0,1),
	(207,'Tajikistan','TJ','TJK','',0,1),
	(208,'Tanzania, United Republic of','TZ','TZA','',0,1),
	(209,'Thailand','TH','THA','',0,1),
	(210,'Togo','TG','TGO','',0,1),
	(211,'Tokelau','TK','TKL','',0,1),
	(212,'Tonga','TO','TON','',0,1),
	(213,'Trinidad and Tobago','TT','TTO','',0,1),
	(214,'Tunisia','TN','TUN','',0,1),
	(215,'Turkey','TR','TUR','',0,1),
	(216,'Turkmenistan','TM','TKM','',0,1),
	(217,'Turks and Caicos Islands','TC','TCA','',0,1),
	(218,'Tuvalu','TV','TUV','',0,1),
	(219,'Uganda','UG','UGA','',0,1),
	(220,'Ukraine','UA','UKR','',0,1),
	(221,'United Arab Emirates','AE','ARE','',0,1),
	(222,'United Kingdom','GB','GBR','',1,1),
	(223,'United States','US','USA','{firstname} {lastname}\r\n{company}\r\n{address_1}\r\n{address_2}\r\n{city}, {zone} {postcode}\r\n{country}',0,1),
	(224,'United States Minor Outlying Islands','UM','UMI','',0,1),
	(225,'Uruguay','UY','URY','',0,1),
	(226,'Uzbekistan','UZ','UZB','',0,1),
	(227,'Vanuatu','VU','VUT','',0,1),
	(228,'Vatican City State (Holy See)','VA','VAT','',0,1),
	(229,'Venezuela','VE','VEN','',0,1),
	(230,'Viet Nam','VN','VNM','',0,1),
	(231,'Virgin Islands (British)','VG','VGB','',0,1),
	(232,'Virgin Islands (U.S.)','VI','VIR','',0,1),
	(233,'Wallis and Futuna Islands','WF','WLF','',0,1),
	(234,'Western Sahara','EH','ESH','',0,1),
	(235,'Yemen','YE','YEM','',0,1),
	(237,'Democratic Republic of Congo','CD','COD','',0,1),
	(238,'Zambia','ZM','ZMB','',0,1),
	(239,'Zimbabwe','ZW','ZWE','',0,1),
	(242,'Montenegro','ME','MNE','',0,1),
	(243,'Serbia','RS','SRB','',0,1),
	(244,'Aaland Islands','AX','ALA','',0,1),
	(245,'Bonaire, Sint Eustatius and Saba','BQ','BES','',0,1),
	(246,'Curacao','CW','CUW','',0,1),
	(247,'Palestinian Territory, Occupied','PS','PSE','',0,1),
	(248,'South Sudan','SS','SSD','',0,1),
	(249,'St. Barthelemy','BL','BLM','',0,1),
	(250,'St. Martin (French part)','MF','MAF','',0,1),
	(251,'Canary Islands','IC','ICA','',0,1),
	(252,'Ascension Island (British)','AC','ASC','',0,1),
	(253,'Kosovo, Republic of','XK','UNK','',0,1),
	(254,'Isle of Man','IM','IMN','',0,1),
	(255,'Tristan da Cunha','TA','SHN','',0,1),
	(256,'Guernsey','GG','GGY','',0,1),
	(257,'Jersey','JE','JEY','',0,1);

/*!40000 ALTER TABLE `country` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table coupon
# ------------------------------------------------------------

DROP TABLE IF EXISTS `coupon`;

CREATE TABLE `coupon` (
  `coupon_id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(128) NOT NULL,
  `code` varchar(20) NOT NULL,
  `type` char(1) NOT NULL,
  `discount` decimal(15,4) NOT NULL,
  `logged` tinyint(1) NOT NULL,
  `shipping` tinyint(1) NOT NULL,
  `total` decimal(15,4) NOT NULL,
  `date_start` date NOT NULL DEFAULT '0000-00-00',
  `date_end` date NOT NULL DEFAULT '0000-00-00',
  `uses_total` int(11) NOT NULL,
  `uses_customer` varchar(11) NOT NULL,
  `status` tinyint(1) NOT NULL,
  `date_added` datetime NOT NULL,
  PRIMARY KEY (`coupon_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

LOCK TABLES `coupon` WRITE;
/*!40000 ALTER TABLE `coupon` DISABLE KEYS */;

INSERT INTO `coupon` (`coupon_id`, `name`, `code`, `type`, `discount`, `logged`, `shipping`, `total`, `date_start`, `date_end`, `uses_total`, `uses_customer`, `status`, `date_added`)
VALUES
	(4,'-10% Discount','2222','P',10.0000,0,0,0.0000,'2014-01-01','2020-01-01',10,'10',0,'2009-01-27 13:55:03'),
	(5,'Free Shipping','3333','P',0.0000,0,1,100.0000,'2014-01-01','2014-02-01',10,'10',0,'2009-03-14 21:13:53'),
	(6,'-10.00 Discount','1111','F',10.0000,0,0,10.0000,'2014-01-01','2020-01-01',100000,'10000',0,'2009-03-14 21:15:18');

/*!40000 ALTER TABLE `coupon` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table coupon_category
# ------------------------------------------------------------

DROP TABLE IF EXISTS `coupon_category`;

CREATE TABLE `coupon_category` (
  `coupon_id` int(11) NOT NULL,
  `category_id` int(11) NOT NULL,
  PRIMARY KEY (`coupon_id`,`category_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;



# Dump of table coupon_history
# ------------------------------------------------------------

DROP TABLE IF EXISTS `coupon_history`;

CREATE TABLE `coupon_history` (
  `coupon_history_id` int(11) NOT NULL AUTO_INCREMENT,
  `coupon_id` int(11) NOT NULL,
  `order_id` int(11) NOT NULL,
  `customer_id` int(11) NOT NULL,
  `amount` decimal(15,4) NOT NULL,
  `date_added` datetime NOT NULL,
  PRIMARY KEY (`coupon_history_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;



# Dump of table coupon_product
# ------------------------------------------------------------

DROP TABLE IF EXISTS `coupon_product`;

CREATE TABLE `coupon_product` (
  `coupon_product_id` int(11) NOT NULL AUTO_INCREMENT,
  `coupon_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  PRIMARY KEY (`coupon_product_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;



# Dump of table currency
# ------------------------------------------------------------

DROP TABLE IF EXISTS `currency`;

CREATE TABLE `currency` (
  `currency_id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(32) NOT NULL,
  `code` varchar(3) NOT NULL,
  `symbol_left` varchar(12) NOT NULL,
  `symbol_right` varchar(12) NOT NULL,
  `decimal_place` char(1) NOT NULL,
  `value` float(15,8) NOT NULL,
  `status` tinyint(1) NOT NULL,
  `date_modified` datetime NOT NULL,
  PRIMARY KEY (`currency_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

LOCK TABLES `currency` WRITE;
/*!40000 ALTER TABLE `currency` DISABLE KEYS */;

INSERT INTO `currency` (`currency_id`, `title`, `code`, `symbol_left`, `symbol_right`, `decimal_place`, `value`, `status`, `date_modified`)
VALUES
	(4,'Indian Rupee','INR','₹','','2',1.00000000,1,'2017-06-29 23:23:43');

/*!40000 ALTER TABLE `currency` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table custom_field
# ------------------------------------------------------------

DROP TABLE IF EXISTS `custom_field`;

CREATE TABLE `custom_field` (
  `custom_field_id` int(11) NOT NULL AUTO_INCREMENT,
  `type` varchar(32) NOT NULL,
  `value` text NOT NULL,
  `validation` varchar(255) NOT NULL,
  `location` varchar(7) NOT NULL,
  `status` tinyint(1) NOT NULL,
  `sort_order` int(3) NOT NULL,
  PRIMARY KEY (`custom_field_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;



# Dump of table custom_field_customer_group
# ------------------------------------------------------------

DROP TABLE IF EXISTS `custom_field_customer_group`;

CREATE TABLE `custom_field_customer_group` (
  `custom_field_id` int(11) NOT NULL,
  `customer_group_id` int(11) NOT NULL,
  `required` tinyint(1) NOT NULL,
  PRIMARY KEY (`custom_field_id`,`customer_group_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;



# Dump of table custom_field_description
# ------------------------------------------------------------

DROP TABLE IF EXISTS `custom_field_description`;

CREATE TABLE `custom_field_description` (
  `custom_field_id` int(11) NOT NULL,
  `language_id` int(11) NOT NULL,
  `name` varchar(128) NOT NULL,
  PRIMARY KEY (`custom_field_id`,`language_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;



# Dump of table custom_field_value
# ------------------------------------------------------------

DROP TABLE IF EXISTS `custom_field_value`;

CREATE TABLE `custom_field_value` (
  `custom_field_value_id` int(11) NOT NULL AUTO_INCREMENT,
  `custom_field_id` int(11) NOT NULL,
  `sort_order` int(3) NOT NULL,
  PRIMARY KEY (`custom_field_value_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;



# Dump of table custom_field_value_description
# ------------------------------------------------------------

DROP TABLE IF EXISTS `custom_field_value_description`;

CREATE TABLE `custom_field_value_description` (
  `custom_field_value_id` int(11) NOT NULL,
  `language_id` int(11) NOT NULL,
  `custom_field_id` int(11) NOT NULL,
  `name` varchar(128) NOT NULL,
  PRIMARY KEY (`custom_field_value_id`,`language_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;



# Dump of table customer
# ------------------------------------------------------------

DROP TABLE IF EXISTS `customer`;

CREATE TABLE `customer` (
  `customer_id` int(11) NOT NULL AUTO_INCREMENT,
  `customer_group_id` int(11) NOT NULL,
  `store_id` int(11) NOT NULL DEFAULT '0',
  `language_id` int(11) NOT NULL,
  `firstname` varchar(32) NOT NULL,
  `lastname` varchar(32) NOT NULL,
  `email` varchar(96) NOT NULL,
  `telephone` varchar(32) NOT NULL,
  `fax` varchar(32) NOT NULL,
  `password` varchar(40) NOT NULL,
  `salt` varchar(9) NOT NULL,
  `cart` text,
  `wishlist` text,
  `newsletter` tinyint(1) NOT NULL DEFAULT '0',
  `address_id` int(11) NOT NULL DEFAULT '0',
  `custom_field` text NOT NULL,
  `ip` varchar(40) NOT NULL,
  `status` tinyint(1) NOT NULL,
  `approved` tinyint(1) NOT NULL,
  `safe` tinyint(1) NOT NULL,
  `token` text NOT NULL,
  `code` varchar(40) NOT NULL,
  `date_added` datetime NOT NULL,
  PRIMARY KEY (`customer_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

LOCK TABLES `customer` WRITE;
/*!40000 ALTER TABLE `customer` DISABLE KEYS */;

INSERT INTO `customer` (`customer_id`, `customer_group_id`, `store_id`, `language_id`, `firstname`, `lastname`, `email`, `telephone`, `fax`, `password`, `salt`, `cart`, `wishlist`, `newsletter`, `address_id`, `custom_field`, `ip`, `status`, `approved`, `safe`, `token`, `code`, `date_added`)
VALUES
	(11,1,0,1,'Test','Account','rohit@rohitbatra.in','9893127578','','ab9ea6e19c37a7cf00d057031fe7a8a04d0323cf','S3WHKZ056',NULL,NULL,1,11,'','27.4.3.124',1,1,0,'','','2017-08-25 07:37:46'),
	(10,1,0,1,'Rohit','Batra','rohit.rishi14@gmail.com','9619356420','','6ff4b1b8710e293105d54ea797c5a925c2a80fad','tFtlyp74Z',NULL,NULL,0,10,'[]','27.4.3.124',1,1,0,'','','2017-07-01 06:26:20');

/*!40000 ALTER TABLE `customer` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table customer_activity
# ------------------------------------------------------------

DROP TABLE IF EXISTS `customer_activity`;

CREATE TABLE `customer_activity` (
  `customer_activity_id` int(11) NOT NULL AUTO_INCREMENT,
  `customer_id` int(11) NOT NULL,
  `key` varchar(64) NOT NULL,
  `data` text NOT NULL,
  `ip` varchar(40) NOT NULL,
  `date_added` datetime NOT NULL,
  PRIMARY KEY (`customer_activity_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

LOCK TABLES `customer_activity` WRITE;
/*!40000 ALTER TABLE `customer_activity` DISABLE KEYS */;

INSERT INTO `customer_activity` (`customer_activity_id`, `customer_id`, `key`, `data`, `ip`, `date_added`)
VALUES
	(1,10,'register','{\"customer_id\":10,\"name\":\"Rohit Batra\"}','171.60.187.233','2017-07-01 06:26:27'),
	(2,10,'login','{\"customer_id\":\"10\",\"name\":\"Rohit Batra\"}','27.4.3.124','2017-08-25 07:34:53'),
	(3,11,'register','{\"customer_id\":11,\"name\":\"Test Account\"}','27.4.3.124','2017-08-25 07:37:53');

/*!40000 ALTER TABLE `customer_activity` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table customer_group
# ------------------------------------------------------------

DROP TABLE IF EXISTS `customer_group`;

CREATE TABLE `customer_group` (
  `customer_group_id` int(11) NOT NULL AUTO_INCREMENT,
  `approval` int(1) NOT NULL,
  `sort_order` int(3) NOT NULL,
  PRIMARY KEY (`customer_group_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

LOCK TABLES `customer_group` WRITE;
/*!40000 ALTER TABLE `customer_group` DISABLE KEYS */;

INSERT INTO `customer_group` (`customer_group_id`, `approval`, `sort_order`)
VALUES
	(1,0,1);

/*!40000 ALTER TABLE `customer_group` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table customer_group_description
# ------------------------------------------------------------

DROP TABLE IF EXISTS `customer_group_description`;

CREATE TABLE `customer_group_description` (
  `customer_group_id` int(11) NOT NULL,
  `language_id` int(11) NOT NULL,
  `name` varchar(32) NOT NULL,
  `description` text NOT NULL,
  PRIMARY KEY (`customer_group_id`,`language_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

LOCK TABLES `customer_group_description` WRITE;
/*!40000 ALTER TABLE `customer_group_description` DISABLE KEYS */;

INSERT INTO `customer_group_description` (`customer_group_id`, `language_id`, `name`, `description`)
VALUES
	(1,1,'Default','test');

/*!40000 ALTER TABLE `customer_group_description` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table customer_history
# ------------------------------------------------------------

DROP TABLE IF EXISTS `customer_history`;

CREATE TABLE `customer_history` (
  `customer_history_id` int(11) NOT NULL AUTO_INCREMENT,
  `customer_id` int(11) NOT NULL,
  `comment` text NOT NULL,
  `date_added` datetime NOT NULL,
  PRIMARY KEY (`customer_history_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;



# Dump of table customer_ip
# ------------------------------------------------------------

DROP TABLE IF EXISTS `customer_ip`;

CREATE TABLE `customer_ip` (
  `customer_ip_id` int(11) NOT NULL AUTO_INCREMENT,
  `customer_id` int(11) NOT NULL,
  `ip` varchar(40) NOT NULL,
  `date_added` datetime NOT NULL,
  PRIMARY KEY (`customer_ip_id`),
  KEY `ip` (`ip`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

LOCK TABLES `customer_ip` WRITE;
/*!40000 ALTER TABLE `customer_ip` DISABLE KEYS */;

INSERT INTO `customer_ip` (`customer_ip_id`, `customer_id`, `ip`, `date_added`)
VALUES
	(4,10,'27.4.3.124','2017-08-25 07:34:53'),
	(3,10,'171.60.187.233','2017-07-01 06:26:27'),
	(5,11,'27.4.3.124','2017-08-25 07:37:53');

/*!40000 ALTER TABLE `customer_ip` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table customer_login
# ------------------------------------------------------------

DROP TABLE IF EXISTS `customer_login`;

CREATE TABLE `customer_login` (
  `customer_login_id` int(11) NOT NULL AUTO_INCREMENT,
  `email` varchar(96) NOT NULL,
  `ip` varchar(40) NOT NULL,
  `total` int(4) NOT NULL,
  `date_added` datetime NOT NULL,
  `date_modified` datetime NOT NULL,
  PRIMARY KEY (`customer_login_id`),
  KEY `email` (`email`),
  KEY `ip` (`ip`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

LOCK TABLES `customer_login` WRITE;
/*!40000 ALTER TABLE `customer_login` DISABLE KEYS */;

INSERT INTO `customer_login` (`customer_login_id`, `email`, `ip`, `total`, `date_added`, `date_modified`)
VALUES
	(1,'admin','49.33.130.125',1,'2017-07-22 02:32:55','2017-07-22 02:32:55');

/*!40000 ALTER TABLE `customer_login` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table customer_online
# ------------------------------------------------------------

DROP TABLE IF EXISTS `customer_online`;

CREATE TABLE `customer_online` (
  `ip` varchar(40) NOT NULL,
  `customer_id` int(11) NOT NULL,
  `url` text NOT NULL,
  `referer` text NOT NULL,
  `date_added` datetime NOT NULL,
  PRIMARY KEY (`ip`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;



# Dump of table customer_reward
# ------------------------------------------------------------

DROP TABLE IF EXISTS `customer_reward`;

CREATE TABLE `customer_reward` (
  `customer_reward_id` int(11) NOT NULL AUTO_INCREMENT,
  `customer_id` int(11) NOT NULL DEFAULT '0',
  `order_id` int(11) NOT NULL DEFAULT '0',
  `description` text NOT NULL,
  `points` int(8) NOT NULL DEFAULT '0',
  `date_added` datetime NOT NULL,
  PRIMARY KEY (`customer_reward_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;



# Dump of table customer_search
# ------------------------------------------------------------

DROP TABLE IF EXISTS `customer_search`;

CREATE TABLE `customer_search` (
  `customer_search_id` int(11) NOT NULL AUTO_INCREMENT,
  `store_id` int(11) NOT NULL,
  `language_id` int(11) NOT NULL,
  `customer_id` int(11) NOT NULL,
  `keyword` varchar(255) NOT NULL,
  `category_id` int(11) DEFAULT NULL,
  `sub_category` tinyint(1) NOT NULL,
  `description` tinyint(1) NOT NULL,
  `products` int(11) NOT NULL,
  `ip` varchar(40) NOT NULL,
  `date_added` datetime NOT NULL,
  PRIMARY KEY (`customer_search_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

LOCK TABLES `customer_search` WRITE;
/*!40000 ALTER TABLE `customer_search` DISABLE KEYS */;

INSERT INTO `customer_search` (`customer_search_id`, `store_id`, `language_id`, `customer_id`, `keyword`, `category_id`, `sub_category`, `description`, `products`, `ip`, `date_added`)
VALUES
	(1,0,1,0,'',26,0,0,0,'64.233.173.45','2017-07-01 11:30:59'),
	(2,0,1,0,'',26,0,0,0,'64.233.173.49','2017-07-01 11:31:04'),
	(3,0,1,0,'',26,0,0,0,'47.11.5.148','2017-07-01 11:31:11'),
	(4,0,1,0,'',26,0,0,0,'64.233.173.49','2017-07-01 11:34:24'),
	(5,0,1,0,'',26,0,0,0,'47.11.5.148','2017-07-01 11:34:30'),
	(6,0,1,0,'',26,0,0,0,'64.233.173.45','2017-07-01 11:39:11'),
	(7,0,1,0,'',50,0,0,0,'64.233.173.49','2017-07-01 18:33:50'),
	(8,0,1,0,'',50,0,0,0,'47.11.3.172','2017-07-01 18:33:55'),
	(9,0,1,0,'',58,0,0,0,'64.233.173.49','2017-07-01 18:40:06'),
	(10,0,1,0,'',58,0,0,0,'47.11.3.172','2017-07-01 18:40:22'),
	(11,0,1,0,'',58,0,0,0,'64.233.173.49','2017-07-01 18:44:24'),
	(12,0,1,0,'',58,0,0,0,'47.11.3.172','2017-07-01 18:44:30'),
	(13,0,1,0,'',18,0,0,5,'47.11.7.121','2017-07-10 11:39:00'),
	(14,0,1,0,'',38,0,0,0,'49.33.130.125','2017-07-22 02:24:32'),
	(15,0,1,0,'',32,0,0,0,'49.33.130.125','2017-07-22 02:33:17'),
	(16,0,1,0,'ring',0,0,0,0,'49.33.48.43','2017-07-23 16:40:47'),
	(17,0,1,0,'ring',63,0,0,0,'49.33.48.43','2017-07-23 16:41:14'),
	(18,0,1,0,'Product 15',0,0,0,1,'27.4.3.124','2017-09-15 14:10:09'),
	(19,0,1,0,'Product 15',0,0,0,1,'127.0.0.1','2017-09-30 09:06:30'),
	(20,0,1,0,'product 15',0,0,0,1,'27.4.3.124','2017-09-30 09:12:03'),
	(21,0,1,0,'',0,0,0,19,'49.33.203.227','2017-10-01 13:06:56'),
	(22,0,1,0,'Camera',0,0,0,0,'49.33.203.227','2017-10-01 13:07:17'),
	(23,0,1,0,'Camera',0,0,0,7,'49.33.203.227','2017-10-01 13:07:50'),
	(24,0,1,0,'Camera',0,0,0,7,'49.33.203.227','2017-10-01 13:07:50'),
	(25,0,1,0,'Camera',0,0,0,7,'49.33.203.227','2017-10-01 13:08:19'),
	(26,0,1,0,'Camera',0,0,0,7,'49.33.203.227','2017-10-01 13:08:36'),
	(27,0,1,0,'Camera',0,0,0,7,'49.33.203.227','2017-10-01 13:11:39'),
	(28,0,1,0,'Camera',0,0,0,7,'49.33.203.227','2017-10-01 13:11:50'),
	(29,0,1,0,'Camera',0,0,0,7,'49.33.203.227','2017-10-01 13:12:05'),
	(30,0,1,0,'Camera',0,0,0,7,'49.33.203.227','2017-10-01 13:12:16'),
	(31,0,1,0,'Camera',0,0,0,7,'49.33.203.227','2017-10-01 13:12:36'),
	(32,0,1,0,'Camera',0,0,0,7,'49.33.203.227','2017-10-01 13:12:47'),
	(33,0,1,0,'Camera',63,0,0,0,'49.33.203.227','2017-10-01 13:13:25'),
	(34,0,1,0,'Camera',63,0,0,0,'49.33.203.227','2017-10-01 13:13:50'),
	(35,0,1,0,'Camera',63,0,0,0,'49.33.203.227','2017-10-01 13:28:09'),
	(36,0,1,0,'Product 15',0,0,0,1,'49.33.29.228','2017-10-02 13:14:26'),
	(37,0,1,0,'Product 15',0,0,0,1,'49.33.29.228','2017-10-02 13:14:40'),
	(38,0,1,0,'Product 15',0,0,0,1,'49.33.29.228','2017-10-02 13:14:53'),
	(39,0,1,0,'15',0,0,0,0,'49.33.196.33','2017-10-03 08:10:44'),
	(40,0,1,0,'Product 15',0,0,0,1,'49.33.196.33','2017-10-03 08:11:10'),
	(41,0,1,0,'Product 15',0,0,0,1,'49.33.196.33','2017-10-03 08:11:39'),
	(42,0,1,0,'15',0,0,0,0,'49.33.196.33','2017-10-03 08:11:45'),
	(43,0,1,0,'15',0,0,0,0,'49.33.196.33','2017-10-03 08:12:44'),
	(44,0,1,0,'15',0,0,0,0,'49.33.196.33','2017-10-03 08:13:27'),
	(45,0,1,0,'Product 15',0,0,0,1,'49.33.196.33','2017-10-03 08:13:46'),
	(46,0,1,0,'Product 15',0,0,0,1,'49.33.196.33','2017-10-03 08:14:07'),
	(47,0,1,0,'Product 15',0,0,0,1,'49.33.196.33','2017-10-03 08:14:23');

/*!40000 ALTER TABLE `customer_search` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table customer_transaction
# ------------------------------------------------------------

DROP TABLE IF EXISTS `customer_transaction`;

CREATE TABLE `customer_transaction` (
  `customer_transaction_id` int(11) NOT NULL AUTO_INCREMENT,
  `customer_id` int(11) NOT NULL,
  `order_id` int(11) NOT NULL,
  `description` text NOT NULL,
  `amount` decimal(15,4) NOT NULL,
  `date_added` datetime NOT NULL,
  PRIMARY KEY (`customer_transaction_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;



# Dump of table customer_wishlist
# ------------------------------------------------------------

DROP TABLE IF EXISTS `customer_wishlist`;

CREATE TABLE `customer_wishlist` (
  `customer_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `date_added` datetime NOT NULL,
  PRIMARY KEY (`customer_id`,`product_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;



# Dump of table download
# ------------------------------------------------------------

DROP TABLE IF EXISTS `download`;

CREATE TABLE `download` (
  `download_id` int(11) NOT NULL AUTO_INCREMENT,
  `filename` varchar(160) NOT NULL,
  `mask` varchar(128) NOT NULL,
  `remote_url` text COMMENT 'Remote Download Location URL',
  `log_data` text COMMENT 'DropBoox Error/Data for Debugging',
  `user_id` int(4) NOT NULL DEFAULT '0' COMMENT 'Seller Id',
  `date_added` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`download_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;



# Dump of table download_description
# ------------------------------------------------------------

DROP TABLE IF EXISTS `download_description`;

CREATE TABLE `download_description` (
  `download_id` int(11) NOT NULL,
  `language_id` int(11) NOT NULL,
  `name` varchar(64) NOT NULL,
  PRIMARY KEY (`download_id`,`language_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;



# Dump of table event
# ------------------------------------------------------------

DROP TABLE IF EXISTS `event`;

CREATE TABLE `event` (
  `event_id` int(11) NOT NULL AUTO_INCREMENT,
  `code` varchar(32) NOT NULL,
  `trigger` text NOT NULL,
  `action` text NOT NULL,
  `status` tinyint(1) NOT NULL,
  `date_added` datetime NOT NULL,
  PRIMARY KEY (`event_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

LOCK TABLES `event` WRITE;
/*!40000 ALTER TABLE `event` DISABLE KEYS */;

INSERT INTO `event` (`event_id`, `code`, `trigger`, `action`, `status`, `date_added`)
VALUES
	(1,'voucher','catalog/model/checkout/order/addOrderHistory/after','extension/total/voucher/send',0,'0000-00-00 00:00:00');

/*!40000 ALTER TABLE `event` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table extension
# ------------------------------------------------------------

DROP TABLE IF EXISTS `extension`;

CREATE TABLE `extension` (
  `extension_id` int(11) NOT NULL AUTO_INCREMENT,
  `type` varchar(32) NOT NULL,
  `code` varchar(32) NOT NULL,
  PRIMARY KEY (`extension_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

LOCK TABLES `extension` WRITE;
/*!40000 ALTER TABLE `extension` DISABLE KEYS */;

INSERT INTO `extension` (`extension_id`, `type`, `code`)
VALUES
	(1,'payment','cod'),
	(2,'total','shipping'),
	(3,'total','sub_total'),
	(4,'total','tax'),
	(5,'total','total'),
	(6,'module','banner'),
	(7,'module','carousel'),
	(8,'total','credit'),
	(9,'shipping','flat'),
	(10,'total','handling'),
	(11,'total','low_order_fee'),
	(12,'total','coupon'),
	(13,'module','category'),
	(14,'module','account'),
	(15,'total','reward'),
	(16,'total','voucher'),
	(17,'payment','free_checkout'),
	(18,'module','featured'),
	(19,'module','slideshow'),
	(20,'theme','theme_default'),
	(21,'dashboard','activity'),
	(22,'dashboard','sale'),
	(23,'dashboard','recent'),
	(24,'dashboard','order'),
	(25,'dashboard','online'),
	(26,'dashboard','map'),
	(27,'dashboard','customer'),
	(28,'dashboard','chart'),
	(29,'captcha','google_captcha'),
	(84,'module','vqmod_manager'),
	(59,'module','soconfig'),
	(48,'module','so_filter_shop_by'),
	(53,'module','so_megamenu'),
	(50,'module','so_searchpro'),
	(57,'module','simple_blog'),
	(58,'module','simple_blog_category'),
	(62,'module','so_extra_slider'),
	(63,'module','so_newletter_custom_popup'),
	(64,'module','so_home_slider'),
	(65,'module','so_deals'),
	(66,'module','so_popular_tags'),
	(70,'module','so_basic_products'),
	(71,'module','so_page_builder'),
	(72,'module','so_listing_tabs'),
	(73,'module','so_latest_blog'),
	(75,'module','so_quickview'),
	(76,'module','so_html_content'),
	(77,'module','so_category_slider'),
	(78,'module','so_super_category'),
	(80,'module','so_instagram_gallery'),
	(81,'module','so_sociallogin'),
	(82,'module','so_onepagecheckout'),
	(83,'module','so_product_label'),
	(87,'module','seller'),
	(90,'dashboard','sellers'),
	(91,'module','filter');

/*!40000 ALTER TABLE `extension` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table filter
# ------------------------------------------------------------

DROP TABLE IF EXISTS `filter`;

CREATE TABLE `filter` (
  `filter_id` int(11) NOT NULL AUTO_INCREMENT,
  `filter_group_id` int(11) NOT NULL,
  `sort_order` int(3) NOT NULL,
  PRIMARY KEY (`filter_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

LOCK TABLES `filter` WRITE;
/*!40000 ALTER TABLE `filter` DISABLE KEYS */;

INSERT INTO `filter` (`filter_id`, `filter_group_id`, `sort_order`)
VALUES
	(4,1,3),
	(3,1,2),
	(2,1,1),
	(1,1,0),
	(5,2,1),
	(6,2,2),
	(7,2,3),
	(8,2,4),
	(9,3,1),
	(10,3,2),
	(11,3,3),
	(12,3,4),
	(13,1,4),
	(14,1,5),
	(15,4,0),
	(16,4,1),
	(17,4,2);

/*!40000 ALTER TABLE `filter` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table filter_description
# ------------------------------------------------------------

DROP TABLE IF EXISTS `filter_description`;

CREATE TABLE `filter_description` (
  `filter_id` int(11) NOT NULL,
  `language_id` int(11) NOT NULL,
  `filter_group_id` int(11) NOT NULL,
  `name` varchar(64) NOT NULL,
  PRIMARY KEY (`filter_id`,`language_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

LOCK TABLES `filter_description` WRITE;
/*!40000 ALTER TABLE `filter_description` DISABLE KEYS */;

INSERT INTO `filter_description` (`filter_id`, `language_id`, `filter_group_id`, `name`)
VALUES
	(2,1,1,'Anniversary'),
	(1,1,1,'Engagement'),
	(5,1,2,'Women'),
	(6,1,2,'Men'),
	(7,1,2,'Kids'),
	(9,1,3,'Gold'),
	(10,1,3,'Diamond'),
	(11,1,3,'Platinum'),
	(12,1,3,'Imitation'),
	(8,1,2,'Unisex'),
	(3,1,1,'Festival'),
	(4,1,1,'Office'),
	(13,1,1,'Special'),
	(14,1,1,'Wedding'),
	(15,1,4,'ret'),
	(16,1,4,'mfg'),
	(17,1,4,'wss');

/*!40000 ALTER TABLE `filter_description` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table filter_group
# ------------------------------------------------------------

DROP TABLE IF EXISTS `filter_group`;

CREATE TABLE `filter_group` (
  `filter_group_id` int(11) NOT NULL AUTO_INCREMENT,
  `sort_order` int(3) NOT NULL,
  PRIMARY KEY (`filter_group_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

LOCK TABLES `filter_group` WRITE;
/*!40000 ALTER TABLE `filter_group` DISABLE KEYS */;

INSERT INTO `filter_group` (`filter_group_id`, `sort_order`)
VALUES
	(1,3),
	(2,2),
	(3,1),
	(4,0);

/*!40000 ALTER TABLE `filter_group` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table filter_group_description
# ------------------------------------------------------------

DROP TABLE IF EXISTS `filter_group_description`;

CREATE TABLE `filter_group_description` (
  `filter_group_id` int(11) NOT NULL,
  `language_id` int(11) NOT NULL,
  `name` varchar(64) NOT NULL,
  PRIMARY KEY (`filter_group_id`,`language_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

LOCK TABLES `filter_group_description` WRITE;
/*!40000 ALTER TABLE `filter_group_description` DISABLE KEYS */;

INSERT INTO `filter_group_description` (`filter_group_id`, `language_id`, `name`)
VALUES
	(1,1,'Occassion'),
	(3,1,'Material'),
	(2,1,'Shop For'),
	(4,1,'Type');

/*!40000 ALTER TABLE `filter_group_description` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table geo_zone
# ------------------------------------------------------------

DROP TABLE IF EXISTS `geo_zone`;

CREATE TABLE `geo_zone` (
  `geo_zone_id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(32) NOT NULL,
  `description` varchar(255) NOT NULL,
  `date_modified` datetime NOT NULL,
  `date_added` datetime NOT NULL,
  PRIMARY KEY (`geo_zone_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

LOCK TABLES `geo_zone` WRITE;
/*!40000 ALTER TABLE `geo_zone` DISABLE KEYS */;

INSERT INTO `geo_zone` (`geo_zone_id`, `name`, `description`, `date_modified`, `date_added`)
VALUES
	(3,'UK VAT Zone','UK VAT','2010-02-26 22:33:24','2009-01-06 23:26:25'),
	(4,'UK Shipping','UK Shipping Zones','2010-12-15 15:18:13','2009-06-23 01:14:53');

/*!40000 ALTER TABLE `geo_zone` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table image
# ------------------------------------------------------------

DROP TABLE IF EXISTS `image`;

CREATE TABLE `image` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `image_path` text NOT NULL COMMENT 'Image Relative Path',
  `name` varchar(255) NOT NULL DEFAULT '',
  `size` int(11) NOT NULL,
  `user_id` int(4) NOT NULL DEFAULT '0',
  `dataTime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;



# Dump of table information
# ------------------------------------------------------------

DROP TABLE IF EXISTS `information`;

CREATE TABLE `information` (
  `information_id` int(11) NOT NULL AUTO_INCREMENT,
  `bottom` int(1) NOT NULL DEFAULT '0',
  `sort_order` int(3) NOT NULL DEFAULT '0',
  `status` tinyint(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`information_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

LOCK TABLES `information` WRITE;
/*!40000 ALTER TABLE `information` DISABLE KEYS */;

INSERT INTO `information` (`information_id`, `bottom`, `sort_order`, `status`)
VALUES
	(3,1,3,1),
	(4,1,1,1),
	(5,1,4,1),
	(6,1,2,1);

/*!40000 ALTER TABLE `information` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table information_description
# ------------------------------------------------------------

DROP TABLE IF EXISTS `information_description`;

CREATE TABLE `information_description` (
  `information_id` int(11) NOT NULL,
  `language_id` int(11) NOT NULL,
  `title` varchar(64) NOT NULL,
  `description` text NOT NULL,
  `meta_title` varchar(255) NOT NULL,
  `meta_description` varchar(255) NOT NULL,
  `meta_keyword` varchar(255) NOT NULL,
  PRIMARY KEY (`information_id`,`language_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

LOCK TABLES `information_description` WRITE;
/*!40000 ALTER TABLE `information_description` DISABLE KEYS */;

INSERT INTO `information_description` (`information_id`, `language_id`, `title`, `description`, `meta_title`, `meta_description`, `meta_keyword`)
VALUES
	(4,1,'About Us','&lt;p&gt;\r\n	About Us&lt;/p&gt;\r\n','About Us','',''),
	(5,1,'Terms &amp; Conditions','&lt;p&gt;\r\n	Terms &amp;amp; Conditions&lt;/p&gt;\r\n','Terms &amp; Conditions','',''),
	(3,1,'Privacy Policy','&lt;p&gt;\r\n	Privacy Policy&lt;/p&gt;\r\n','Privacy Policy','',''),
	(6,1,'Delivery Information','&lt;p&gt;\r\n	Delivery Information&lt;/p&gt;\r\n','Delivery Information','','');

/*!40000 ALTER TABLE `information_description` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table information_to_layout
# ------------------------------------------------------------

DROP TABLE IF EXISTS `information_to_layout`;

CREATE TABLE `information_to_layout` (
  `information_id` int(11) NOT NULL,
  `store_id` int(11) NOT NULL,
  `layout_id` int(11) NOT NULL,
  PRIMARY KEY (`information_id`,`store_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;



# Dump of table information_to_store
# ------------------------------------------------------------

DROP TABLE IF EXISTS `information_to_store`;

CREATE TABLE `information_to_store` (
  `information_id` int(11) NOT NULL,
  `store_id` int(11) NOT NULL,
  PRIMARY KEY (`information_id`,`store_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

LOCK TABLES `information_to_store` WRITE;
/*!40000 ALTER TABLE `information_to_store` DISABLE KEYS */;

INSERT INTO `information_to_store` (`information_id`, `store_id`)
VALUES
	(3,0),
	(4,0),
	(5,0),
	(6,0);

/*!40000 ALTER TABLE `information_to_store` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table language
# ------------------------------------------------------------

DROP TABLE IF EXISTS `language`;

CREATE TABLE `language` (
  `language_id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(32) NOT NULL,
  `code` varchar(5) NOT NULL,
  `locale` varchar(255) NOT NULL,
  `image` varchar(64) NOT NULL,
  `directory` varchar(32) NOT NULL,
  `sort_order` int(3) NOT NULL DEFAULT '0',
  `status` tinyint(1) NOT NULL,
  PRIMARY KEY (`language_id`),
  KEY `name` (`name`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

LOCK TABLES `language` WRITE;
/*!40000 ALTER TABLE `language` DISABLE KEYS */;

INSERT INTO `language` (`language_id`, `name`, `code`, `locale`, `image`, `directory`, `sort_order`, `status`)
VALUES
	(1,'English','en-gb','en-US,en_US.UTF-8,en_US,en-gb,english','gb.png','english',1,1);

/*!40000 ALTER TABLE `language` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table layout
# ------------------------------------------------------------

DROP TABLE IF EXISTS `layout`;

CREATE TABLE `layout` (
  `layout_id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(64) NOT NULL,
  PRIMARY KEY (`layout_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

LOCK TABLES `layout` WRITE;
/*!40000 ALTER TABLE `layout` DISABLE KEYS */;

INSERT INTO `layout` (`layout_id`, `name`)
VALUES
	(1,'Home'),
	(2,'Product'),
	(3,'Category'),
	(4,'Default'),
	(5,'Manufacturer'),
	(6,'Account'),
	(7,'Checkout'),
	(8,'Contact'),
	(9,'Sitemap'),
	(10,'Affiliate'),
	(11,'Information'),
	(12,'Compare'),
	(13,'Search'),
	(18,'Seller Landing'),
	(17,'Seller');

/*!40000 ALTER TABLE `layout` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table layout_module
# ------------------------------------------------------------

DROP TABLE IF EXISTS `layout_module`;

CREATE TABLE `layout_module` (
  `layout_module_id` int(11) NOT NULL AUTO_INCREMENT,
  `layout_id` int(11) NOT NULL,
  `code` varchar(64) NOT NULL,
  `position` varchar(14) NOT NULL,
  `sort_order` int(3) NOT NULL,
  PRIMARY KEY (`layout_module_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

LOCK TABLES `layout_module` WRITE;
/*!40000 ALTER TABLE `layout_module` DISABLE KEYS */;

INSERT INTO `layout_module` (`layout_module_id`, `layout_id`, `code`, `position`, `sort_order`)
VALUES
	(6484,4,'so_quickview.247','content_top',1),
	(6491,1,'so_page_builder.330','footertop',0),
	(6490,1,'so_page_builder.331','content_top',0),
	(6489,1,'so_searchpro.94','content_search',0),
	(6488,1,'so_megamenu.124','content_menu1',0),
	(6486,1,'so_html_content.296','content_topbar',0),
	(6642,2,'so_quickview.247','content_bottom',1),
	(6641,2,'so_extra_slider.269','content_bottom',0),
	(6640,2,'so_searchpro.94','content_search',0),
	(6639,2,'so_megamenu.124','content_menu1',0),
	(6638,2,'so_megamenu.119','content_menu',0),
	(6637,2,'so_html_content.296','content_topbar',0),
	(6636,3,'so_page_builder.330','footertop',0),
	(6635,3,'so_quickview.247','content_top',0),
	(6634,3,'filter','column_left',1),
	(6633,3,'so_searchpro.94','content_search',0),
	(6632,3,'so_megamenu.124','content_menu1',0),
	(6631,3,'so_megamenu.119','content_menu',0),
	(6483,4,'so_page_builder.331','content_top',0),
	(6482,4,'so_searchpro.94','content_search',0),
	(6481,4,'so_megamenu.124','content_menu1',0),
	(6480,4,'so_megamenu.119','content_menu',0),
	(6301,5,'so_megamenu.124','content_menu1',0),
	(6302,5,'so_searchpro.94','content_search',0),
	(6300,5,'so_megamenu.119','content_menu',0),
	(6298,5,'so_html_content.296','content_topbar',0),
	(6184,6,'account','column_right',0),
	(6183,6,'so_searchpro.94','content_search',1),
	(6182,6,'so_megamenu.124','content_menu1',0),
	(6181,6,'so_megamenu.119','content_menu',0),
	(6179,6,'so_html_content.296','content_topbar',0),
	(6245,7,'so_searchpro.94','content_search',0),
	(6244,7,'so_megamenu.124','content_menu1',0),
	(6243,7,'so_megamenu.119','content_menu',0),
	(6241,7,'so_html_content.296','content_topbar',0),
	(6260,8,'so_megamenu.124','content_menu1',0),
	(6259,8,'so_megamenu.119','content_menu',0),
	(6257,8,'so_html_content.296','content_topbar',0),
	(6261,8,'so_searchpro.94','content_search',0),
	(6353,9,'so_megamenu.124','content_menu1',0),
	(6354,9,'so_searchpro.94','content_search',0),
	(6352,9,'so_megamenu.119','content_menu',0),
	(6350,9,'so_html_content.296','content_topbar',0),
	(6193,10,'affiliate','column_right',0),
	(6192,10,'so_searchpro.94','content_search',0),
	(6191,10,'so_megamenu.124','content_menu1',0),
	(6190,10,'so_megamenu.119','content_menu',0),
	(6188,10,'so_html_content.296','content_topbar',0),
	(6293,11,'so_megamenu.124','content_menu1',0),
	(6294,11,'so_searchpro.94','content_search',1),
	(6292,11,'so_megamenu.119','content_menu',0),
	(6290,11,'so_html_content.296','content_topbar',0),
	(6253,12,'so_searchpro.94','content_search',0),
	(6252,12,'so_megamenu.124','content_menu1',0),
	(6251,12,'so_megamenu.119','content_menu',0),
	(6249,12,'so_html_content.296','content_topbar',0),
	(6345,13,'so_megamenu.124','content_menu1',0),
	(6346,13,'so_searchpro.94','content_search',0),
	(6344,13,'so_megamenu.119','content_menu',0),
	(6342,13,'so_html_content.296','content_topbar',0),
	(6613,17,'so_page_builder.330','footertop',0),
	(6612,17,'seller','column_right',0),
	(6608,17,'so_html_content.296','content_topbar',0),
	(6609,17,'so_megamenu.119','content_menu',0),
	(6610,17,'so_megamenu.124','content_menu1',0),
	(6611,17,'so_searchpro.94','content_search',0),
	(6590,18,'so_page_builder.330','footertop',0),
	(6589,18,'so_page_builder.341','content_top',0),
	(6588,18,'so_searchpro.94','content_search',0),
	(6587,18,'so_megamenu.124','content_menu1',0),
	(6586,18,'so_megamenu.119','content_menu',0),
	(6479,4,'so_html_content.296','content_topbar',0),
	(6487,1,'so_megamenu.119','content_menu',0),
	(6485,4,'so_page_builder.330','footertop',0),
	(6643,2,'so_page_builder.330','footertop',0),
	(6630,3,'so_html_content.296','content_topbar',0);

/*!40000 ALTER TABLE `layout_module` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table layout_route
# ------------------------------------------------------------

DROP TABLE IF EXISTS `layout_route`;

CREATE TABLE `layout_route` (
  `layout_route_id` int(11) NOT NULL AUTO_INCREMENT,
  `layout_id` int(11) NOT NULL,
  `store_id` int(11) NOT NULL,
  `route` varchar(64) NOT NULL,
  PRIMARY KEY (`layout_route_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

LOCK TABLES `layout_route` WRITE;
/*!40000 ALTER TABLE `layout_route` DISABLE KEYS */;

INSERT INTO `layout_route` (`layout_route_id`, `layout_id`, `store_id`, `route`)
VALUES
	(38,6,0,'account/%'),
	(17,10,0,'affiliate/%'),
	(169,3,0,'product/category'),
	(69,1,0,'common/home'),
	(170,2,0,'product/product'),
	(24,11,0,'information/information'),
	(23,7,0,'checkout/%'),
	(31,8,0,'information/contact'),
	(32,9,0,'information/sitemap'),
	(45,5,0,'product/manufacturer'),
	(52,12,0,'product/compare'),
	(53,13,0,'product/search'),
	(68,4,0,''),
	(166,17,0,'seller/pricing'),
	(165,17,0,'seller/contact'),
	(164,17,0,'seller/terms'),
	(163,17,0,'seller/reset'),
	(162,17,0,'seller/forgotten'),
	(161,17,0,'seller/register'),
	(160,17,0,'seller/login'),
	(159,17,0,'seller/payment_process'),
	(158,17,0,'seller/payment_error'),
	(157,17,0,'seller/payment_success'),
	(150,18,0,'seller/landing');

/*!40000 ALTER TABLE `layout_route` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table length_class
# ------------------------------------------------------------

DROP TABLE IF EXISTS `length_class`;

CREATE TABLE `length_class` (
  `length_class_id` int(11) NOT NULL AUTO_INCREMENT,
  `value` decimal(15,8) NOT NULL,
  PRIMARY KEY (`length_class_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

LOCK TABLES `length_class` WRITE;
/*!40000 ALTER TABLE `length_class` DISABLE KEYS */;

INSERT INTO `length_class` (`length_class_id`, `value`)
VALUES
	(1,1.00000000),
	(2,10.00000000),
	(3,0.39370000);

/*!40000 ALTER TABLE `length_class` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table length_class_description
# ------------------------------------------------------------

DROP TABLE IF EXISTS `length_class_description`;

CREATE TABLE `length_class_description` (
  `length_class_id` int(11) NOT NULL,
  `language_id` int(11) NOT NULL,
  `title` varchar(32) NOT NULL,
  `unit` varchar(4) NOT NULL,
  PRIMARY KEY (`length_class_id`,`language_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

LOCK TABLES `length_class_description` WRITE;
/*!40000 ALTER TABLE `length_class_description` DISABLE KEYS */;

INSERT INTO `length_class_description` (`length_class_id`, `language_id`, `title`, `unit`)
VALUES
	(1,1,'Centimeter','cm'),
	(2,1,'Millimeter','mm'),
	(3,1,'Inch','in');

/*!40000 ALTER TABLE `length_class_description` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table location
# ------------------------------------------------------------

DROP TABLE IF EXISTS `location`;

CREATE TABLE `location` (
  `location_id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(32) NOT NULL,
  `address` text NOT NULL,
  `telephone` varchar(32) NOT NULL,
  `fax` varchar(32) NOT NULL,
  `geocode` varchar(32) NOT NULL,
  `image` varchar(255) DEFAULT NULL,
  `open` text NOT NULL,
  `comment` text NOT NULL,
  PRIMARY KEY (`location_id`),
  KEY `name` (`name`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

LOCK TABLES `location` WRITE;
/*!40000 ALTER TABLE `location` DISABLE KEYS */;

INSERT INTO `location` (`location_id`, `name`, `address`, `telephone`, `fax`, `geocode`, `image`, `open`, `comment`)
VALUES
	(1,'jewels','mumbai','09892722193','9892722193','Mumbai','','7am-10pm','can purchase product any time');

/*!40000 ALTER TABLE `location` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table manufacturer
# ------------------------------------------------------------

DROP TABLE IF EXISTS `manufacturer`;

CREATE TABLE `manufacturer` (
  `manufacturer_id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(64) NOT NULL,
  `image` varchar(255) DEFAULT NULL,
  `sort_order` int(3) NOT NULL,
  PRIMARY KEY (`manufacturer_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

LOCK TABLES `manufacturer` WRITE;
/*!40000 ALTER TABLE `manufacturer` DISABLE KEYS */;

INSERT INTO `manufacturer` (`manufacturer_id`, `name`, `image`, `sort_order`)
VALUES
	(5,'HTC','catalog/demo/htc_logo.jpg',0),
	(6,'Palm','catalog/demo/palm_logo.jpg',0),
	(7,'Hewlett-Packard','catalog/demo/hp_logo.jpg',0),
	(8,'Apple','catalog/demo/apple_logo.jpg',0),
	(9,'Canon','catalog/demo/canon_logo.jpg',0),
	(10,'Sony','catalog/demo/sony_logo.jpg',0);

/*!40000 ALTER TABLE `manufacturer` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table manufacturer_to_store
# ------------------------------------------------------------

DROP TABLE IF EXISTS `manufacturer_to_store`;

CREATE TABLE `manufacturer_to_store` (
  `manufacturer_id` int(11) NOT NULL,
  `store_id` int(11) NOT NULL,
  PRIMARY KEY (`manufacturer_id`,`store_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

LOCK TABLES `manufacturer_to_store` WRITE;
/*!40000 ALTER TABLE `manufacturer_to_store` DISABLE KEYS */;

INSERT INTO `manufacturer_to_store` (`manufacturer_id`, `store_id`)
VALUES
	(5,0),
	(6,0),
	(7,0),
	(8,0),
	(9,0),
	(10,0);

/*!40000 ALTER TABLE `manufacturer_to_store` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table marketing
# ------------------------------------------------------------

DROP TABLE IF EXISTS `marketing`;

CREATE TABLE `marketing` (
  `marketing_id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(32) NOT NULL,
  `description` text NOT NULL,
  `code` varchar(64) NOT NULL,
  `clicks` int(5) NOT NULL DEFAULT '0',
  `date_added` datetime NOT NULL,
  PRIMARY KEY (`marketing_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;



# Dump of table mega_menu
# ------------------------------------------------------------

DROP TABLE IF EXISTS `mega_menu`;

CREATE TABLE `mega_menu` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `parent_id` int(11) NOT NULL,
  `rang` int(11) NOT NULL,
  `icon` varchar(255) NOT NULL DEFAULT '',
  `name` text,
  `type_link` int(11) DEFAULT NULL,
  `module_id` int(11) DEFAULT NULL,
  `link` text,
  `description` text,
  `new_window` int(11) NOT NULL DEFAULT '0',
  `status` int(11) NOT NULL DEFAULT '0',
  `position` int(11) NOT NULL DEFAULT '0',
  `submenu_width` text,
  `submenu_type` int(11) NOT NULL DEFAULT '0',
  `content_width` int(11) NOT NULL DEFAULT '12',
  `content_type` int(11) NOT NULL DEFAULT '0',
  `content` text,
  `label_item` varchar(255) NOT NULL DEFAULT '',
  `icon_font` varchar(255) NOT NULL DEFAULT '',
  `class_menu` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

LOCK TABLES `mega_menu` WRITE;
/*!40000 ALTER TABLE `mega_menu` DISABLE KEYS */;

INSERT INTO `mega_menu` (`id`, `parent_id`, `rang`, `icon`, `name`, `type_link`, `module_id`, `link`, `description`, `new_window`, `status`, `position`, `submenu_width`, `submenu_type`, `content_width`, `content_type`, `content`, `label_item`, `icon_font`, `class_menu`)
VALUES
	(192,0,19,'http://localhost/ytc_templates/opencart/so_market/image/cache/no_image-100x100.png','a:2:{i:1;s:20:\"More Car Accessories\";i:2;s:20:\"More Car Accessories\";}',1,121,'a:2:{s:3:\"url\";s:0:\"\";s:8:\"category\";s:2:\"60\";}','a:2:{i:1;s:0:\"\";i:2;s:0:\"\";}',0,0,0,'100%',0,4,0,'a:6:{s:4:\"html\";a:1:{s:4:\"text\";a:2:{i:1;s:29:\"&lt;p&gt;&lt;br&gt;&lt;/p&gt;\";i:2;s:29:\"&lt;p&gt;&lt;br&gt;&lt;/p&gt;\";}}s:7:\"product\";a:2:{s:2:\"id\";s:0:\"\";s:4:\"name\";s:0:\"\";}s:5:\"image\";a:2:{s:4:\"link\";s:12:\"no_image.png\";s:10:\"show_title\";s:1:\"1\";}s:11:\"subcategory\";a:8:{s:8:\"category\";s:0:\"\";s:13:\"limit_level_1\";s:1:\"4\";s:13:\"limit_level_2\";s:1:\"4\";s:10:\"show_title\";s:1:\"1\";s:10:\"show_image\";s:1:\"1\";s:7:\"columns\";s:1:\"1\";s:7:\"submenu\";s:1:\"1\";s:15:\"submenu_columns\";s:1:\"1\";}s:11:\"productlist\";a:4:{s:5:\"limit\";s:0:\"\";s:4:\"type\";s:3:\"new\";s:10:\"show_title\";s:1:\"1\";s:3:\"col\";s:0:\"\";}s:10:\"categories\";a:4:{s:10:\"categories\";a:0:{}s:7:\"columns\";s:1:\"1\";s:7:\"submenu\";s:1:\"1\";s:15:\"submenu_columns\";s:1:\"1\";}}','','',''),
	(196,135,2,'http://dev.ytcvn.com/ytc_templates/opencart/so_maxshop/image/cache/no_image-100x100.png','a:2:{i:1;s:4:\"HTML\";i:2;s:4:\"HTML\";}',1,121,'a:2:{s:3:\"url\";s:0:\"\";s:8:\"category\";s:2:\"33\";}','a:2:{i:1;s:0:\"\";i:2;s:0:\"\";}',0,0,0,'',0,4,0,'a:6:{s:4:\"html\";a:1:{s:4:\"text\";a:2:{i:1;s:188:\"&lt;div class=&quot;row img-banner&quot;&gt;&lt;a href=&quot;#&quot;&gt;&lt;img src=&quot;image/catalog/cms/img-static-megamenu-h.png&quot; alt=&quot;banner&quot;&gt;&lt;/a&gt;&lt;/div&gt;\";i:2;s:188:\"&lt;div class=&quot;row img-banner&quot;&gt;&lt;a href=&quot;#&quot;&gt;&lt;img src=&quot;image/catalog/cms/img-static-megamenu-h.png&quot; alt=&quot;banner&quot;&gt;&lt;/a&gt;&lt;/div&gt;\";}}s:7:\"product\";a:2:{s:2:\"id\";s:2:\"30\";s:4:\"name\";s:12:\"Canon EOS 5D\";}s:5:\"image\";a:2:{s:4:\"link\";s:12:\"no_image.png\";s:10:\"show_title\";s:1:\"1\";}s:11:\"subcategory\";a:8:{s:8:\"category\";s:0:\"\";s:13:\"limit_level_1\";s:1:\"4\";s:13:\"limit_level_2\";s:1:\"4\";s:10:\"show_title\";s:1:\"1\";s:10:\"show_image\";s:1:\"1\";s:7:\"columns\";s:1:\"1\";s:7:\"submenu\";s:1:\"1\";s:15:\"submenu_columns\";s:1:\"1\";}s:11:\"productlist\";a:4:{s:5:\"limit\";s:1:\"1\";s:4:\"type\";s:7:\"popular\";s:10:\"show_title\";s:1:\"0\";s:3:\"col\";s:1:\"1\";}s:10:\"categories\";a:4:{s:10:\"categories\";a:0:{}s:7:\"columns\";s:1:\"3\";s:7:\"submenu\";s:1:\"2\";s:15:\"submenu_columns\";s:1:\"1\";}}','','',''),
	(185,0,6,'catalog/demo/menu/icon/icon-2.png','a:1:{i:1;s:24:\"Packaging &amp; Displays\";}',0,124,'a:2:{s:3:\"url\";s:23:\"packaging-displays.html\";s:8:\"category\";s:0:\"\";}','a:1:{i:1;s:0:\"\";}',0,0,0,'100%',0,4,0,'a:6:{s:4:\"html\";a:1:{s:4:\"text\";a:1:{i:1;s:29:\"&lt;p&gt;&lt;br&gt;&lt;/p&gt;\";}}s:7:\"product\";a:2:{s:2:\"id\";s:0:\"\";s:4:\"name\";s:0:\"\";}s:5:\"image\";a:2:{s:4:\"link\";s:12:\"no_image.png\";s:10:\"show_title\";s:1:\"1\";}s:11:\"subcategory\";a:9:{s:13:\"limit_level_1\";s:1:\"4\";s:13:\"limit_level_2\";s:1:\"4\";s:13:\"limit_level_3\";s:0:\"\";s:10:\"show_title\";s:1:\"1\";s:10:\"show_image\";s:1:\"1\";s:7:\"columns\";s:1:\"1\";s:7:\"submenu\";s:1:\"1\";s:15:\"submenu_columns\";s:1:\"1\";s:8:\"category\";s:0:\"\";}s:11:\"productlist\";a:4:{s:5:\"limit\";s:0:\"\";s:4:\"type\";s:3:\"new\";s:10:\"show_title\";s:1:\"1\";s:3:\"col\";s:1:\"1\";}s:10:\"categories\";a:4:{s:10:\"categories\";a:0:{}s:7:\"columns\";s:1:\"1\";s:7:\"submenu\";s:1:\"1\";s:15:\"submenu_columns\";s:1:\"1\";}}','','icon icon7',''),
	(321,0,7,'catalog/demo/menu/icon/icon-6.png','a:1:{i:1;s:21:\"Tools &amp; Machinery\";}',0,124,'a:2:{s:3:\"url\";s:20:\"tools-machinery.html\";s:8:\"category\";s:0:\"\";}','a:1:{i:1;s:0:\"\";}',0,0,0,'100%',0,4,0,'a:6:{s:4:\"html\";a:1:{s:4:\"text\";a:1:{i:1;s:29:\"&lt;p&gt;&lt;br&gt;&lt;/p&gt;\";}}s:7:\"product\";a:2:{s:2:\"id\";s:0:\"\";s:4:\"name\";s:0:\"\";}s:5:\"image\";a:2:{s:4:\"link\";s:12:\"no_image.png\";s:10:\"show_title\";s:1:\"1\";}s:11:\"subcategory\";a:9:{s:13:\"limit_level_1\";s:1:\"4\";s:13:\"limit_level_2\";s:1:\"4\";s:13:\"limit_level_3\";s:0:\"\";s:10:\"show_title\";s:1:\"1\";s:10:\"show_image\";s:1:\"1\";s:7:\"columns\";s:1:\"1\";s:7:\"submenu\";s:1:\"1\";s:15:\"submenu_columns\";s:1:\"1\";s:8:\"category\";s:0:\"\";}s:11:\"productlist\";a:4:{s:5:\"limit\";s:0:\"\";s:4:\"type\";s:3:\"new\";s:10:\"show_title\";s:1:\"1\";s:3:\"col\";s:1:\"1\";}s:10:\"categories\";a:4:{s:10:\"categories\";a:0:{}s:7:\"columns\";s:1:\"1\";s:7:\"submenu\";s:1:\"1\";s:15:\"submenu_columns\";s:1:\"1\";}}','','',''),
	(298,0,16,'no_image.png','a:1:{i:1;s:3:\"CAD\";}',0,119,'a:2:{s:3:\"url\";s:24:\"https://sezplus.com/cad/\";s:8:\"category\";s:0:\"\";}','a:1:{i:1;s:0:\"\";}',1,0,0,'100%',0,4,0,'a:6:{s:4:\"html\";a:1:{s:4:\"text\";a:1:{i:1;s:29:\"&lt;p&gt;&lt;br&gt;&lt;/p&gt;\";}}s:7:\"product\";a:2:{s:2:\"id\";s:0:\"\";s:4:\"name\";s:0:\"\";}s:5:\"image\";a:2:{s:4:\"link\";s:12:\"no_image.png\";s:10:\"show_title\";s:1:\"1\";}s:11:\"subcategory\";a:9:{s:13:\"limit_level_1\";s:0:\"\";s:13:\"limit_level_2\";s:0:\"\";s:13:\"limit_level_3\";s:0:\"\";s:10:\"show_title\";s:1:\"1\";s:10:\"show_image\";s:1:\"1\";s:7:\"columns\";s:1:\"1\";s:7:\"submenu\";s:1:\"1\";s:15:\"submenu_columns\";s:1:\"1\";s:8:\"category\";s:0:\"\";}s:11:\"productlist\";a:4:{s:5:\"limit\";s:0:\"\";s:4:\"type\";s:3:\"new\";s:10:\"show_title\";s:1:\"1\";s:3:\"col\";s:1:\"1\";}s:10:\"categories\";a:4:{s:10:\"categories\";a:0:{}s:7:\"columns\";s:1:\"1\";s:7:\"submenu\";s:1:\"1\";s:15:\"submenu_columns\";s:1:\"1\";}}','','',''),
	(319,318,4,'no_image.png','a:1:{i:1;s:14:\"Moulds Sub_Cat\";}',0,124,'a:2:{s:3:\"url\";s:0:\"\";s:8:\"category\";s:0:\"\";}','a:1:{i:1;s:0:\"\";}',0,0,0,'50%',0,7,0,'a:6:{s:4:\"html\";a:1:{s:4:\"text\";a:1:{i:1;s:1743:\"&lt;ul&gt;\r\n	&lt;li class=&quot;&quot;&gt;\r\n		&lt;a href=&quot;index.php?route=product/category&amp;amp;path=160&quot; title=&quot;Rings&quot;&gt;Rings&lt;/a&gt;\r\n	&lt;/li&gt;\r\n	&lt;li class=&quot;&quot;&gt;\r\n		&lt;a href=&quot;index.php?route=product/category&amp;amp;path=161&quot; title=&quot;Earrings&quot;&gt;Earrings&lt;/a&gt;\r\n	&lt;/li&gt;\r\n	&lt;li class=&quot;&quot;&gt;\r\n		&lt;a href=&quot;index.php?route=product/category&amp;amp;path=162&quot; title=&quot;Pendants&quot;&gt;Pendants&lt;/a&gt;\r\n	&lt;/li&gt;\r\n	&lt;li class=&quot;&quot;&gt;\r\n		&lt;a href=&quot;index.php?route=product/category&amp;amp;path=163&quot; title=&quot;Necklaces&quot;&gt;Necklaces&lt;/a&gt;\r\n	&lt;/li&gt;\r\n	&lt;li class=&quot;&quot;&gt;\r\n		&lt;a href=&quot;index.php?route=product/category&amp;amp;path=164&quot; title=&quot;Bangles&quot;&gt;Bangles&lt;/a&gt;\r\n	&lt;/li&gt;\r\n	&lt;li class=&quot;&quot;&gt;\r\n		&lt;a href=&quot;index.php?route=product/category&amp;amp;path=165&quot; title=&quot;Bracelets&quot;&gt;Bracelets&lt;/a&gt;\r\n	&lt;/li&gt;\r\n	&lt;li class=&quot;&quot;&gt;\r\n		&lt;a href=&quot;index.php?route=product/category&amp;amp;path=166&quot; title=&quot;Tanmaniyas&quot;&gt;Tanmaniyas&lt;/a&gt;\r\n	&lt;/li&gt;\r\n	&lt;li class=&quot;&quot;&gt;\r\n		&lt;a href=&quot;index.php?route=product/category&amp;amp;path=168&quot; title=&quot;Cuff-Links&quot;&gt;Cuff-Links&lt;/a&gt;\r\n	&lt;/li&gt;\r\n	&lt;li class=&quot;&quot;&gt;\r\n		&lt;a href=&quot;index.php?route=product/category&amp;amp;path=169&quot; title=&quot;Mangalsutras&quot;&gt;Mangalsutras&lt;/a&gt;\r\n	&lt;/li&gt;\r\n	&lt;li class=&quot;&quot;&gt;\r\n		&lt;a href=&quot;index.php?route=product/category&amp;amp;path=167&quot; title=&quot;Watches&quot;&gt;Watches&lt;/a&gt;\r\n	&lt;/li&gt;\r\n&lt;/ul&gt;\";}}s:7:\"product\";a:2:{s:2:\"id\";s:0:\"\";s:4:\"name\";s:0:\"\";}s:5:\"image\";a:2:{s:4:\"link\";s:12:\"no_image.png\";s:10:\"show_title\";s:1:\"1\";}s:11:\"subcategory\";a:9:{s:13:\"limit_level_1\";s:1:\"4\";s:13:\"limit_level_2\";s:1:\"4\";s:13:\"limit_level_3\";s:1:\"4\";s:10:\"show_title\";s:1:\"1\";s:10:\"show_image\";s:1:\"1\";s:7:\"columns\";s:1:\"1\";s:7:\"submenu\";s:1:\"1\";s:15:\"submenu_columns\";s:1:\"1\";s:8:\"category\";s:0:\"\";}s:11:\"productlist\";a:4:{s:5:\"limit\";s:0:\"\";s:4:\"type\";s:3:\"new\";s:10:\"show_title\";s:1:\"1\";s:3:\"col\";s:1:\"1\";}s:10:\"categories\";a:4:{s:10:\"categories\";a:0:{}s:7:\"columns\";s:1:\"1\";s:7:\"submenu\";s:1:\"1\";s:15:\"submenu_columns\";s:1:\"1\";}}','','','item-1'),
	(174,0,0,'catalog/demo/menu/icon/icon-9.png','a:1:{i:1;s:6:\"Models\";}',0,124,'a:2:{s:3:\"url\";s:11:\"models.html\";s:8:\"category\";s:0:\"\";}','a:1:{i:1;s:0:\"\";}',0,0,0,'495px',0,4,0,'a:6:{s:4:\"html\";a:1:{s:4:\"text\";a:1:{i:1;s:29:\"&lt;p&gt;&lt;br&gt;&lt;/p&gt;\";}}s:7:\"product\";a:2:{s:2:\"id\";s:0:\"\";s:4:\"name\";s:0:\"\";}s:5:\"image\";a:2:{s:4:\"link\";s:12:\"no_image.png\";s:10:\"show_title\";s:1:\"1\";}s:11:\"subcategory\";a:9:{s:13:\"limit_level_1\";s:1:\"4\";s:13:\"limit_level_2\";s:1:\"4\";s:13:\"limit_level_3\";s:0:\"\";s:10:\"show_title\";s:1:\"1\";s:10:\"show_image\";s:1:\"1\";s:7:\"columns\";s:1:\"1\";s:7:\"submenu\";s:1:\"1\";s:15:\"submenu_columns\";s:1:\"1\";s:8:\"category\";s:0:\"\";}s:11:\"productlist\";a:4:{s:5:\"limit\";s:0:\"\";s:4:\"type\";s:3:\"new\";s:10:\"show_title\";s:1:\"1\";s:3:\"col\";s:1:\"1\";}s:10:\"categories\";a:4:{s:10:\"categories\";a:0:{}s:7:\"columns\";s:1:\"1\";s:7:\"submenu\";s:1:\"1\";s:15:\"submenu_columns\";s:1:\"1\";}}','','',' vertical-style3'),
	(316,174,1,'no_image.png','a:1:{i:1;s:14:\"Models Sub_Cat\";}',0,124,'a:2:{s:3:\"url\";s:0:\"\";s:8:\"category\";s:0:\"\";}','a:1:{i:1;s:0:\"\";}',0,0,0,'50%',0,7,0,'a:6:{s:4:\"html\";a:1:{s:4:\"text\";a:1:{i:1;s:1743:\"&lt;ul&gt;\r\n	&lt;li class=&quot;&quot;&gt;\r\n		&lt;a href=&quot;index.php?route=product/category&amp;amp;path=133&quot; title=&quot;Rings&quot;&gt;Rings&lt;/a&gt;\r\n	&lt;/li&gt;\r\n	&lt;li class=&quot;&quot;&gt;\r\n		&lt;a href=&quot;index.php?route=product/category&amp;amp;path=135&quot; title=&quot;Earrings&quot;&gt;Earrings&lt;/a&gt;\r\n	&lt;/li&gt;\r\n	&lt;li class=&quot;&quot;&gt;\r\n		&lt;a href=&quot;index.php?route=product/category&amp;amp;path=134&quot; title=&quot;Pendants&quot;&gt;Pendants&lt;/a&gt;\r\n	&lt;/li&gt;\r\n	&lt;li class=&quot;&quot;&gt;\r\n		&lt;a href=&quot;index.php?route=product/category&amp;amp;path=136&quot; title=&quot;Necklaces&quot;&gt;Necklaces&lt;/a&gt;\r\n	&lt;/li&gt;\r\n	&lt;li class=&quot;&quot;&gt;\r\n		&lt;a href=&quot;index.php?route=product/category&amp;amp;path=137&quot; title=&quot;Bangles&quot;&gt;Bangles&lt;/a&gt;\r\n	&lt;/li&gt;\r\n	&lt;li class=&quot;&quot;&gt;\r\n		&lt;a href=&quot;index.php?route=product/category&amp;amp;path=138&quot; title=&quot;Bracelets&quot;&gt;Bracelets&lt;/a&gt;\r\n	&lt;/li&gt;\r\n	&lt;li class=&quot;&quot;&gt;\r\n		&lt;a href=&quot;index.php?route=product/category&amp;amp;path=139&quot; title=&quot;Tanmaniyas&quot;&gt;Tanmaniyas&lt;/a&gt;\r\n	&lt;/li&gt;\r\n	&lt;li class=&quot;&quot;&gt;\r\n		&lt;a href=&quot;index.php?route=product/category&amp;amp;path=141&quot; title=&quot;Cuff-Links&quot;&gt;Cuff-Links&lt;/a&gt;\r\n	&lt;/li&gt;\r\n	&lt;li class=&quot;&quot;&gt;\r\n		&lt;a href=&quot;index.php?route=product/category&amp;amp;path=142&quot; title=&quot;Mangalsutras&quot;&gt;Mangalsutras&lt;/a&gt;\r\n	&lt;/li&gt;\r\n	&lt;li class=&quot;&quot;&gt;\r\n		&lt;a href=&quot;index.php?route=product/category&amp;amp;path=140&quot; title=&quot;Watches&quot;&gt;Watches&lt;/a&gt;\r\n	&lt;/li&gt;\r\n&lt;/ul&gt;\";}}s:7:\"product\";a:2:{s:2:\"id\";s:0:\"\";s:4:\"name\";s:0:\"\";}s:5:\"image\";a:2:{s:4:\"link\";s:12:\"no_image.png\";s:10:\"show_title\";s:1:\"1\";}s:11:\"subcategory\";a:9:{s:13:\"limit_level_1\";s:1:\"4\";s:13:\"limit_level_2\";s:1:\"4\";s:13:\"limit_level_3\";s:1:\"4\";s:10:\"show_title\";s:1:\"1\";s:10:\"show_image\";s:1:\"1\";s:7:\"columns\";s:1:\"1\";s:7:\"submenu\";s:1:\"1\";s:15:\"submenu_columns\";s:1:\"1\";s:8:\"category\";s:0:\"\";}s:11:\"productlist\";a:4:{s:5:\"limit\";s:0:\"\";s:4:\"type\";s:3:\"new\";s:10:\"show_title\";s:1:\"1\";s:3:\"col\";s:1:\"1\";}s:10:\"categories\";a:4:{s:10:\"categories\";a:0:{}s:7:\"columns\";s:1:\"1\";s:7:\"submenu\";s:1:\"1\";s:15:\"submenu_columns\";s:1:\"1\";}}','','','item-1'),
	(172,156,7,'http://localhost/ytc_templates/opencart/so_market/image/cache/no_image-100x100.png','a:2:{i:1;s:8:\"Sub menu\";i:2;s:8:\"Sub menu\";}',1,123,'a:2:{s:3:\"url\";s:0:\"\";s:8:\"category\";s:2:\"34\";}','a:2:{i:1;s:0:\"\";i:2;s:0:\"\";}',0,0,0,'100%',0,12,2,'a:6:{s:4:\"html\";a:1:{s:4:\"text\";a:2:{i:1;s:29:\"&lt;p&gt;&lt;br&gt;&lt;/p&gt;\";i:2;s:29:\"&lt;p&gt;&lt;br&gt;&lt;/p&gt;\";}}s:7:\"product\";a:2:{s:2:\"id\";s:0:\"\";s:4:\"name\";s:0:\"\";}s:5:\"image\";a:2:{s:4:\"link\";s:12:\"no_image.png\";s:10:\"show_title\";s:1:\"1\";}s:11:\"subcategory\";a:8:{s:8:\"category\";s:0:\"\";s:13:\"limit_level_1\";s:1:\"4\";s:13:\"limit_level_2\";s:1:\"4\";s:10:\"show_title\";s:1:\"1\";s:10:\"show_image\";s:1:\"1\";s:7:\"columns\";s:1:\"1\";s:7:\"submenu\";s:1:\"1\";s:15:\"submenu_columns\";s:1:\"1\";}s:11:\"productlist\";a:4:{s:5:\"limit\";s:0:\"\";s:4:\"type\";s:3:\"new\";s:10:\"show_title\";s:1:\"1\";s:3:\"col\";s:0:\"\";}s:10:\"categories\";a:4:{s:10:\"categories\";a:4:{i:0;a:2:{s:4:\"name\";s:15:\"Health & Beauty\";s:2:\"id\";i:24;}i:1;a:2:{s:4:\"name\";s:40:\"Electronics','','',''),
	(173,157,9,'http://localhost/ytc_templates/opencart/so_market/image/cache/no_image-100x100.png','a:2:{i:1;s:8:\"Sub menu\";i:2;s:8:\"Sub menu\";}',1,123,'a:2:{s:3:\"url\";s:0:\"\";s:8:\"category\";s:2:\"34\";}','a:2:{i:1;s:0:\"\";i:2;s:0:\"\";}',0,0,0,'100%',0,12,2,'a:6:{s:4:\"html\";a:1:{s:4:\"text\";a:2:{i:1;s:29:\"&lt;p&gt;&lt;br&gt;&lt;/p&gt;\";i:2;s:29:\"&lt;p&gt;&lt;br&gt;&lt;/p&gt;\";}}s:7:\"product\";a:2:{s:2:\"id\";s:0:\"\";s:4:\"name\";s:0:\"\";}s:5:\"image\";a:2:{s:4:\"link\";s:12:\"no_image.png\";s:10:\"show_title\";s:1:\"1\";}s:11:\"subcategory\";a:8:{s:8:\"category\";s:0:\"\";s:13:\"limit_level_1\";s:1:\"4\";s:13:\"limit_level_2\";s:1:\"4\";s:10:\"show_title\";s:1:\"1\";s:10:\"show_image\";s:1:\"1\";s:7:\"columns\";s:1:\"1\";s:7:\"submenu\";s:1:\"1\";s:15:\"submenu_columns\";s:1:\"1\";}s:11:\"productlist\";a:4:{s:5:\"limit\";s:0:\"\";s:4:\"type\";s:3:\"new\";s:10:\"show_title\";s:1:\"1\";s:3:\"col\";s:0:\"\";}s:10:\"categories\";a:4:{s:10:\"categories\";a:6:{i:0;a:3:{s:4:\"name\";s:10:\"Automotive\";s:2:\"id\";i:33;s:8:\"children\";a:4:{i:0;a:2:{s:4:\"name\";s:54:\"Smartphone & Tablets','','',''),
	(170,155,5,'http://localhost/ytc_templates/opencart/so_market/image/cache/no_image-100x100.png','a:2:{i:1;s:12:\"HTML Content\";i:2;s:12:\"HTML Content\";}',1,123,'a:2:{s:3:\"url\";s:0:\"\";s:8:\"category\";s:2:\"25\";}','a:2:{i:1;s:0:\"\";i:2;s:0:\"\";}',0,0,0,'100%',0,6,0,'a:6:{s:4:\"html\";a:1:{s:4:\"text\";a:2:{i:1;s:172:\"&lt;div class=&quot;row banner&quot;&gt;&lt;a href=&quot;#&quot;&gt;&lt;img src=&quot;image/catalog/cms/menu_bg2.jpg&quot; alt=&quot;banner1&quot;&gt;&lt;/a&gt;&lt;/div&gt;\";i:2;s:172:\"&lt;div class=&quot;row banner&quot;&gt;&lt;a href=&quot;#&quot;&gt;&lt;img src=&quot;image/catalog/cms/menu_bg2.jpg&quot; alt=&quot;banner1&quot;&gt;&lt;/a&gt;&lt;/div&gt;\";}}s:7:\"product\";a:2:{s:2:\"id\";s:0:\"\";s:4:\"name\";s:0:\"\";}s:5:\"image\";a:2:{s:4:\"link\";s:12:\"no_image.png\";s:10:\"show_title\";s:1:\"1\";}s:11:\"subcategory\";a:8:{s:8:\"category\";s:0:\"\";s:13:\"limit_level_1\";s:1:\"4\";s:13:\"limit_level_2\";s:1:\"4\";s:10:\"show_title\";s:1:\"1\";s:10:\"show_image\";s:1:\"1\";s:7:\"columns\";s:1:\"1\";s:7:\"submenu\";s:1:\"1\";s:15:\"submenu_columns\";s:1:\"1\";}s:11:\"productlist\";a:4:{s:5:\"limit\";s:0:\"\";s:4:\"type\";s:3:\"new\";s:10:\"show_title\";s:1:\"1\";s:3:\"col\";s:0:\"\";}s:10:\"categories\";a:4:{s:10:\"categories\";a:0:{}s:7:\"columns\";s:1:\"1\";s:7:\"submenu\";s:1:\"1\";s:15:\"submenu_columns\";s:1:\"1\";}}','','',''),
	(169,155,4,'http://localhost/ytc_templates/opencart/so_market/image/cache/no_image-100x100.png','a:2:{i:1;s:12:\"Sub category\";i:2;s:12:\"Sub category\";}',0,123,'a:2:{s:3:\"url\";s:0:\"\";s:8:\"category\";s:0:\"\";}','a:2:{i:1;s:0:\"\";i:2;s:0:\"\";}',0,0,0,'100%',0,6,2,'a:6:{s:4:\"html\";a:1:{s:4:\"text\";a:2:{i:1;s:29:\"&lt;p&gt;&lt;br&gt;&lt;/p&gt;\";i:2;s:29:\"&lt;p&gt;&lt;br&gt;&lt;/p&gt;\";}}s:7:\"product\";a:2:{s:2:\"id\";s:0:\"\";s:4:\"name\";s:0:\"\";}s:5:\"image\";a:2:{s:4:\"link\";s:12:\"no_image.png\";s:10:\"show_title\";s:1:\"1\";}s:11:\"subcategory\";a:8:{s:8:\"category\";s:0:\"\";s:13:\"limit_level_1\";s:1:\"4\";s:13:\"limit_level_2\";s:1:\"4\";s:10:\"show_title\";s:1:\"1\";s:10:\"show_image\";s:1:\"1\";s:7:\"columns\";s:1:\"1\";s:7:\"submenu\";s:1:\"1\";s:15:\"submenu_columns\";s:1:\"1\";}s:11:\"productlist\";a:4:{s:5:\"limit\";s:0:\"\";s:4:\"type\";s:3:\"new\";s:10:\"show_title\";s:1:\"1\";s:3:\"col\";s:0:\"\";}s:10:\"categories\";a:4:{s:10:\"categories\";a:3:{i:0;a:3:{s:4:\"name\";s:18:\"Mobile Accessories\";s:2:\"id\";i:81;s:8:\"children\";a:1:{i:0;a:3:{s:4:\"name\";s:39:\"Automotive','','',''),
	(162,0,14,'http://localhost/ytc_templates/opencart/so_market/image/cache/no_image-100x100.png','a:2:{i:1;s:21:\"Jewelry &amp; Watches\";i:2;s:21:\"Jewelry &amp; Watches\";}',1,123,'a:2:{s:3:\"url\";s:0:\"\";s:8:\"category\";s:2:\"20\";}','a:2:{i:1;s:0:\"\";i:2;s:0:\"\";}',0,0,0,'100%',0,4,0,'a:6:{s:4:\"html\";a:1:{s:4:\"text\";a:2:{i:1;s:29:\"&lt;p&gt;&lt;br&gt;&lt;/p&gt;\";i:2;s:29:\"&lt;p&gt;&lt;br&gt;&lt;/p&gt;\";}}s:7:\"product\";a:2:{s:2:\"id\";s:0:\"\";s:4:\"name\";s:0:\"\";}s:5:\"image\";a:2:{s:4:\"link\";s:12:\"no_image.png\";s:10:\"show_title\";s:1:\"1\";}s:11:\"subcategory\";a:8:{s:8:\"category\";s:0:\"\";s:13:\"limit_level_1\";s:1:\"4\";s:13:\"limit_level_2\";s:1:\"4\";s:10:\"show_title\";s:1:\"1\";s:10:\"show_image\";s:1:\"1\";s:7:\"columns\";s:1:\"1\";s:7:\"submenu\";s:1:\"1\";s:15:\"submenu_columns\";s:1:\"1\";}s:11:\"productlist\";a:4:{s:5:\"limit\";s:0:\"\";s:4:\"type\";s:3:\"new\";s:10:\"show_title\";s:1:\"1\";s:3:\"col\";s:0:\"\";}s:10:\"categories\";a:4:{s:10:\"categories\";a:0:{}s:7:\"columns\";s:1:\"1\";s:7:\"submenu\";s:1:\"1\";s:15:\"submenu_columns\";s:1:\"1\";}}','','icon icon12',''),
	(163,0,15,'http://localhost/ytc_templates/opencart/so_market/image/cache/no_image-100x100.png','a:2:{i:1;s:22:\"Bags, Holiday Supplies\";i:2;s:22:\"Bags, Holiday Supplies\";}',1,123,'a:2:{s:3:\"url\";s:0:\"\";s:8:\"category\";s:2:\"17\";}','a:2:{i:1;s:0:\"\";i:2;s:0:\"\";}',0,0,0,'100%',0,4,0,'a:6:{s:4:\"html\";a:1:{s:4:\"text\";a:2:{i:1;s:29:\"&lt;p&gt;&lt;br&gt;&lt;/p&gt;\";i:2;s:29:\"&lt;p&gt;&lt;br&gt;&lt;/p&gt;\";}}s:7:\"product\";a:2:{s:2:\"id\";s:0:\"\";s:4:\"name\";s:0:\"\";}s:5:\"image\";a:2:{s:4:\"link\";s:12:\"no_image.png\";s:10:\"show_title\";s:1:\"1\";}s:11:\"subcategory\";a:8:{s:8:\"category\";s:0:\"\";s:13:\"limit_level_1\";s:1:\"4\";s:13:\"limit_level_2\";s:1:\"4\";s:10:\"show_title\";s:1:\"1\";s:10:\"show_image\";s:1:\"1\";s:7:\"columns\";s:1:\"1\";s:7:\"submenu\";s:1:\"1\";s:15:\"submenu_columns\";s:1:\"1\";}s:11:\"productlist\";a:4:{s:5:\"limit\";s:0:\"\";s:4:\"type\";s:3:\"new\";s:10:\"show_title\";s:1:\"1\";s:3:\"col\";s:0:\"\";}s:10:\"categories\";a:4:{s:10:\"categories\";a:0:{}s:7:\"columns\";s:1:\"1\";s:7:\"submenu\";s:1:\"1\";s:15:\"submenu_columns\";s:1:\"1\";}}','','icon icon13',''),
	(166,153,1,'http://localhost/ytc_templates/opencart/so_market/image/cache/no_image-100x100.png','a:2:{i:1;s:12:\"Sub category\";i:2;s:12:\"Sub category\";}',0,123,'a:2:{s:3:\"url\";s:0:\"\";s:8:\"category\";s:0:\"\";}','a:2:{i:1;s:0:\"\";i:2;s:0:\"\";}',0,0,0,'100%',0,12,2,'a:6:{s:4:\"html\";a:1:{s:4:\"text\";a:2:{i:1;s:29:\"&lt;p&gt;&lt;br&gt;&lt;/p&gt;\";i:2;s:29:\"&lt;p&gt;&lt;br&gt;&lt;/p&gt;\";}}s:7:\"product\";a:2:{s:2:\"id\";s:0:\"\";s:4:\"name\";s:0:\"\";}s:5:\"image\";a:2:{s:4:\"link\";s:12:\"no_image.png\";s:10:\"show_title\";s:1:\"1\";}s:11:\"subcategory\";a:8:{s:8:\"category\";s:0:\"\";s:13:\"limit_level_1\";s:1:\"4\";s:13:\"limit_level_2\";s:1:\"4\";s:10:\"show_title\";s:1:\"1\";s:10:\"show_image\";s:1:\"1\";s:7:\"columns\";s:1:\"1\";s:7:\"submenu\";s:1:\"1\";s:15:\"submenu_columns\";s:1:\"1\";}s:11:\"productlist\";a:4:{s:5:\"limit\";s:0:\"\";s:4:\"type\";s:3:\"new\";s:10:\"show_title\";s:1:\"1\";s:3:\"col\";s:0:\"\";}s:10:\"categories\";a:4:{s:10:\"categories\";a:5:{i:0;a:3:{s:4:\"name\";s:7:\"Apparel\";s:2:\"id\";i:78;s:8:\"children\";a:6:{i:0;a:2:{s:4:\"name\";s:10:\"Automotive\";s:2:\"id\";i:33;}i:1;a:2:{s:4:\"name\";s:54:\"Smartphone & Tablets','','',''),
	(161,0,13,'http://localhost/ytc_templates/opencart/so_market/image/cache/no_image-100x100.png','a:2:{i:1;s:19:\"Toys &amp; Hobbies \";i:2;s:19:\"Toys &amp; Hobbies \";}',1,123,'a:2:{s:3:\"url\";s:0:\"\";s:8:\"category\";s:2:\"57\";}','a:2:{i:1;s:0:\"\";i:2;s:0:\"\";}',0,0,0,'100%',0,4,0,'a:6:{s:4:\"html\";a:1:{s:4:\"text\";a:2:{i:1;s:29:\"&lt;p&gt;&lt;br&gt;&lt;/p&gt;\";i:2;s:29:\"&lt;p&gt;&lt;br&gt;&lt;/p&gt;\";}}s:7:\"product\";a:2:{s:2:\"id\";s:0:\"\";s:4:\"name\";s:0:\"\";}s:5:\"image\";a:2:{s:4:\"link\";s:12:\"no_image.png\";s:10:\"show_title\";s:1:\"1\";}s:11:\"subcategory\";a:8:{s:8:\"category\";s:0:\"\";s:13:\"limit_level_1\";s:1:\"4\";s:13:\"limit_level_2\";s:1:\"4\";s:10:\"show_title\";s:1:\"1\";s:10:\"show_image\";s:1:\"1\";s:7:\"columns\";s:1:\"1\";s:7:\"submenu\";s:1:\"1\";s:15:\"submenu_columns\";s:1:\"1\";}s:11:\"productlist\";a:4:{s:5:\"limit\";s:0:\"\";s:4:\"type\";s:3:\"new\";s:10:\"show_title\";s:1:\"1\";s:3:\"col\";s:0:\"\";}s:10:\"categories\";a:4:{s:10:\"categories\";a:0:{}s:7:\"columns\";s:1:\"1\";s:7:\"submenu\";s:1:\"1\";s:15:\"submenu_columns\";s:1:\"1\";}}','','icon icon11',''),
	(160,0,12,'http://localhost/ytc_templates/opencart/so_market/image/cache/no_image-100x100.png','a:2:{i:1;s:19:\"Health &amp; Beauty\";i:2;s:19:\"Health &amp; Beauty\";}',1,123,'a:2:{s:3:\"url\";s:0:\"\";s:8:\"category\";s:2:\"24\";}','a:2:{i:1;s:0:\"\";i:2;s:0:\"\";}',0,0,0,'100%',0,4,0,'a:6:{s:4:\"html\";a:1:{s:4:\"text\";a:2:{i:1;s:29:\"&lt;p&gt;&lt;br&gt;&lt;/p&gt;\";i:2;s:29:\"&lt;p&gt;&lt;br&gt;&lt;/p&gt;\";}}s:7:\"product\";a:2:{s:2:\"id\";s:0:\"\";s:4:\"name\";s:0:\"\";}s:5:\"image\";a:2:{s:4:\"link\";s:12:\"no_image.png\";s:10:\"show_title\";s:1:\"1\";}s:11:\"subcategory\";a:8:{s:8:\"category\";s:0:\"\";s:13:\"limit_level_1\";s:1:\"4\";s:13:\"limit_level_2\";s:1:\"4\";s:10:\"show_title\";s:1:\"1\";s:10:\"show_image\";s:1:\"1\";s:7:\"columns\";s:1:\"1\";s:7:\"submenu\";s:1:\"1\";s:15:\"submenu_columns\";s:1:\"1\";}s:11:\"productlist\";a:4:{s:5:\"limit\";s:0:\"\";s:4:\"type\";s:3:\"new\";s:10:\"show_title\";s:1:\"1\";s:3:\"col\";s:0:\"\";}s:10:\"categories\";a:4:{s:10:\"categories\";a:0:{}s:7:\"columns\";s:1:\"1\";s:7:\"submenu\";s:1:\"1\";s:15:\"submenu_columns\";s:1:\"1\";}}','','icon icon10',''),
	(159,0,11,'http://localhost/ytc_templates/opencart/so_market/image/cache/no_image-100x100.png','a:2:{i:1;s:32:\"Outdoor &amp; Traveling Supplies\";i:2;s:32:\"Outdoor &amp; Traveling Supplies\";}',1,123,'a:2:{s:3:\"url\";s:0:\"\";s:8:\"category\";s:2:\"28\";}','a:2:{i:1;s:0:\"\";i:2;s:0:\"\";}',0,0,0,'100%',0,4,0,'a:6:{s:4:\"html\";a:1:{s:4:\"text\";a:2:{i:1;s:29:\"&lt;p&gt;&lt;br&gt;&lt;/p&gt;\";i:2;s:29:\"&lt;p&gt;&lt;br&gt;&lt;/p&gt;\";}}s:7:\"product\";a:2:{s:2:\"id\";s:0:\"\";s:4:\"name\";s:0:\"\";}s:5:\"image\";a:2:{s:4:\"link\";s:12:\"no_image.png\";s:10:\"show_title\";s:1:\"1\";}s:11:\"subcategory\";a:8:{s:8:\"category\";s:0:\"\";s:13:\"limit_level_1\";s:1:\"4\";s:13:\"limit_level_2\";s:1:\"4\";s:10:\"show_title\";s:1:\"1\";s:10:\"show_image\";s:1:\"1\";s:7:\"columns\";s:1:\"1\";s:7:\"submenu\";s:1:\"1\";s:15:\"submenu_columns\";s:1:\"1\";}s:11:\"productlist\";a:4:{s:5:\"limit\";s:0:\"\";s:4:\"type\";s:3:\"new\";s:10:\"show_title\";s:1:\"1\";s:3:\"col\";s:0:\"\";}s:10:\"categories\";a:4:{s:10:\"categories\";a:0:{}s:7:\"columns\";s:1:\"1\";s:7:\"submenu\";s:1:\"1\";s:15:\"submenu_columns\";s:1:\"1\";}}','','icon icon9',''),
	(158,0,10,'http://localhost/ytc_templates/opencart/so_market/image/cache/no_image-100x100.png','a:2:{i:1;s:18:\"Camera &amp; Photo\";i:2;s:18:\"Camera &amp; Photo\";}',1,123,'a:2:{s:3:\"url\";s:0:\"\";s:8:\"category\";s:2:\"82\";}','a:2:{i:1;s:0:\"\";i:2;s:0:\"\";}',0,0,0,'100%',0,4,0,'a:6:{s:4:\"html\";a:1:{s:4:\"text\";a:2:{i:1;s:29:\"&lt;p&gt;&lt;br&gt;&lt;/p&gt;\";i:2;s:29:\"&lt;p&gt;&lt;br&gt;&lt;/p&gt;\";}}s:7:\"product\";a:2:{s:2:\"id\";s:0:\"\";s:4:\"name\";s:0:\"\";}s:5:\"image\";a:2:{s:4:\"link\";s:12:\"no_image.png\";s:10:\"show_title\";s:1:\"1\";}s:11:\"subcategory\";a:8:{s:8:\"category\";s:0:\"\";s:13:\"limit_level_1\";s:1:\"4\";s:13:\"limit_level_2\";s:1:\"4\";s:10:\"show_title\";s:1:\"1\";s:10:\"show_image\";s:1:\"1\";s:7:\"columns\";s:1:\"1\";s:7:\"submenu\";s:1:\"1\";s:15:\"submenu_columns\";s:1:\"1\";}s:11:\"productlist\";a:4:{s:5:\"limit\";s:0:\"\";s:4:\"type\";s:3:\"new\";s:10:\"show_title\";s:1:\"1\";s:3:\"col\";s:0:\"\";}s:10:\"categories\";a:4:{s:10:\"categories\";a:0:{}s:7:\"columns\";s:1:\"1\";s:7:\"submenu\";s:1:\"1\";s:15:\"submenu_columns\";s:1:\"1\";}}','','icon icon8',''),
	(157,0,8,'http://localhost/ytc_templates/opencart/so_market/image/cache/no_image-100x100.png','a:2:{i:1;s:23:\"Flashlights &amp; Lamps\";i:2;s:23:\"Flashlights &amp; Lamps\";}',1,123,'a:2:{s:3:\"url\";s:0:\"\";s:8:\"category\";s:2:\"80\";}','a:2:{i:1;s:0:\"\";i:2;s:0:\"\";}',0,0,0,'100%',0,4,0,'a:6:{s:4:\"html\";a:1:{s:4:\"text\";a:2:{i:1;s:29:\"&lt;p&gt;&lt;br&gt;&lt;/p&gt;\";i:2;s:29:\"&lt;p&gt;&lt;br&gt;&lt;/p&gt;\";}}s:7:\"product\";a:2:{s:2:\"id\";s:0:\"\";s:4:\"name\";s:0:\"\";}s:5:\"image\";a:2:{s:4:\"link\";s:12:\"no_image.png\";s:10:\"show_title\";s:1:\"1\";}s:11:\"subcategory\";a:8:{s:8:\"category\";s:0:\"\";s:13:\"limit_level_1\";s:1:\"4\";s:13:\"limit_level_2\";s:1:\"4\";s:10:\"show_title\";s:1:\"1\";s:10:\"show_image\";s:1:\"1\";s:7:\"columns\";s:1:\"1\";s:7:\"submenu\";s:1:\"1\";s:15:\"submenu_columns\";s:1:\"1\";}s:11:\"productlist\";a:4:{s:5:\"limit\";s:0:\"\";s:4:\"type\";s:3:\"new\";s:10:\"show_title\";s:1:\"1\";s:3:\"col\";s:0:\"\";}s:10:\"categories\";a:4:{s:10:\"categories\";a:0:{}s:7:\"columns\";s:1:\"1\";s:7:\"submenu\";s:1:\"1\";s:15:\"submenu_columns\";s:1:\"1\";}}','','icon icon5',''),
	(156,0,6,'http://localhost/ytc_templates/opencart/so_market/image/cache/no_image-100x100.png','a:2:{i:1;s:24:\"Smartphone &amp; Tablets\";i:2;s:24:\"Smartphone &amp; Tablets\";}',1,123,'a:2:{s:3:\"url\";s:0:\"\";s:8:\"category\";s:2:\"34\";}','a:2:{i:1;s:0:\"\";i:2;s:0:\"\";}',0,0,0,'30%',0,12,0,'a:6:{s:4:\"html\";a:1:{s:4:\"text\";a:2:{i:1;s:29:\"&lt;p&gt;&lt;br&gt;&lt;/p&gt;\";i:2;s:29:\"&lt;p&gt;&lt;br&gt;&lt;/p&gt;\";}}s:7:\"product\";a:2:{s:2:\"id\";s:0:\"\";s:4:\"name\";s:0:\"\";}s:5:\"image\";a:2:{s:4:\"link\";s:12:\"no_image.png\";s:10:\"show_title\";s:1:\"1\";}s:11:\"subcategory\";a:8:{s:8:\"category\";s:0:\"\";s:13:\"limit_level_1\";s:1:\"4\";s:13:\"limit_level_2\";s:1:\"4\";s:10:\"show_title\";s:1:\"1\";s:10:\"show_image\";s:1:\"1\";s:7:\"columns\";s:1:\"1\";s:7:\"submenu\";s:1:\"1\";s:15:\"submenu_columns\";s:1:\"1\";}s:11:\"productlist\";a:4:{s:5:\"limit\";s:0:\"\";s:4:\"type\";s:3:\"new\";s:10:\"show_title\";s:1:\"1\";s:3:\"col\";s:0:\"\";}s:10:\"categories\";a:4:{s:10:\"categories\";a:0:{}s:7:\"columns\";s:1:\"1\";s:7:\"submenu\";s:1:\"1\";s:15:\"submenu_columns\";s:1:\"1\";}}','','icon icon4',''),
	(155,0,3,'http://localhost/ytc_templates/opencart/so_market/image/cache/no_image-100x100.png','a:2:{i:1;s:21:\"Sports &amp; Outdoors\";i:2;s:21:\"Sports &amp; Outdoors\";}',1,123,'a:2:{s:3:\"url\";s:0:\"\";s:8:\"category\";s:2:\"25\";}','a:2:{i:1;s:0:\"\";i:2;s:0:\"\";}',0,0,0,'60%',0,4,0,'a:6:{s:4:\"html\";a:1:{s:4:\"text\";a:2:{i:1;s:29:\"&lt;p&gt;&lt;br&gt;&lt;/p&gt;\";i:2;s:29:\"&lt;p&gt;&lt;br&gt;&lt;/p&gt;\";}}s:7:\"product\";a:2:{s:2:\"id\";s:0:\"\";s:4:\"name\";s:0:\"\";}s:5:\"image\";a:2:{s:4:\"link\";s:12:\"no_image.png\";s:10:\"show_title\";s:1:\"1\";}s:11:\"subcategory\";a:8:{s:8:\"category\";s:0:\"\";s:13:\"limit_level_1\";s:1:\"4\";s:13:\"limit_level_2\";s:1:\"4\";s:10:\"show_title\";s:1:\"1\";s:10:\"show_image\";s:1:\"1\";s:7:\"columns\";s:1:\"1\";s:7:\"submenu\";s:1:\"1\";s:15:\"submenu_columns\";s:1:\"1\";}s:11:\"productlist\";a:4:{s:5:\"limit\";s:0:\"\";s:4:\"type\";s:3:\"new\";s:10:\"show_title\";s:1:\"1\";s:3:\"col\";s:0:\"\";}s:10:\"categories\";a:4:{s:10:\"categories\";a:0:{}s:7:\"columns\";s:1:\"1\";s:7:\"submenu\";s:1:\"1\";s:15:\"submenu_columns\";s:1:\"1\";}}','','icon icon3',''),
	(154,0,2,'http://localhost/ytc_templates/opencart/so_market/image/cache/no_image-100x100.png','a:2:{i:1;s:10:\"Electronic\";i:2;s:10:\"Electronic\";}',1,123,'a:2:{s:3:\"url\";s:0:\"\";s:8:\"category\";s:2:\"18\";}','a:2:{i:1;s:0:\"\";i:2;s:0:\"\";}',0,0,0,'100%',0,4,0,'a:6:{s:4:\"html\";a:1:{s:4:\"text\";a:2:{i:1;s:29:\"&lt;p&gt;&lt;br&gt;&lt;/p&gt;\";i:2;s:29:\"&lt;p&gt;&lt;br&gt;&lt;/p&gt;\";}}s:7:\"product\";a:2:{s:2:\"id\";s:0:\"\";s:4:\"name\";s:0:\"\";}s:5:\"image\";a:2:{s:4:\"link\";s:12:\"no_image.png\";s:10:\"show_title\";s:1:\"1\";}s:11:\"subcategory\";a:8:{s:8:\"category\";s:0:\"\";s:13:\"limit_level_1\";s:1:\"4\";s:13:\"limit_level_2\";s:1:\"4\";s:10:\"show_title\";s:1:\"1\";s:10:\"show_image\";s:1:\"1\";s:7:\"columns\";s:1:\"1\";s:7:\"submenu\";s:1:\"1\";s:15:\"submenu_columns\";s:1:\"1\";}s:11:\"productlist\";a:4:{s:5:\"limit\";s:0:\"\";s:4:\"type\";s:3:\"new\";s:10:\"show_title\";s:1:\"1\";s:3:\"col\";s:0:\"\";}s:10:\"categories\";a:4:{s:10:\"categories\";a:0:{}s:7:\"columns\";s:1:\"1\";s:7:\"submenu\";s:1:\"1\";s:15:\"submenu_columns\";s:1:\"1\";}}','','icon icon2',''),
	(153,0,0,'http://localhost/ytc_templates/opencart/so_market/image/cache/no_image-100x100.png','a:2:{i:1;s:27:\"Automotive &amp; Motocrycle\";i:2;s:27:\"Automotive &amp; Motocrycle\";}',0,123,'a:2:{s:3:\"url\";s:0:\"\";s:8:\"category\";s:0:\"\";}','a:2:{i:1;s:0:\"\";i:2;s:0:\"\";}',0,0,0,'100%',0,4,0,'a:6:{s:4:\"html\";a:1:{s:4:\"text\";a:2:{i:1;s:29:\"&lt;p&gt;&lt;br&gt;&lt;/p&gt;\";i:2;s:29:\"&lt;p&gt;&lt;br&gt;&lt;/p&gt;\";}}s:7:\"product\";a:2:{s:2:\"id\";s:0:\"\";s:4:\"name\";s:0:\"\";}s:5:\"image\";a:2:{s:4:\"link\";s:12:\"no_image.png\";s:10:\"show_title\";s:1:\"1\";}s:11:\"subcategory\";a:8:{s:8:\"category\";s:0:\"\";s:13:\"limit_level_1\";s:1:\"4\";s:13:\"limit_level_2\";s:1:\"4\";s:10:\"show_title\";s:1:\"1\";s:10:\"show_image\";s:1:\"1\";s:7:\"columns\";s:1:\"1\";s:7:\"submenu\";s:1:\"1\";s:15:\"submenu_columns\";s:1:\"1\";}s:11:\"productlist\";a:4:{s:5:\"limit\";s:0:\"\";s:4:\"type\";s:3:\"new\";s:10:\"show_title\";s:1:\"1\";s:3:\"col\";s:0:\"\";}s:10:\"categories\";a:4:{s:10:\"categories\";a:0:{}s:7:\"columns\";s:1:\"1\";s:7:\"submenu\";s:1:\"1\";s:15:\"submenu_columns\";s:1:\"1\";}}','','icon icon1',' style1'),
	(151,0,13,'http://localhost/ytc_templates/opencart/so_maxshop/image/cache/no_image-100x100.png','a:2:{i:1;s:24:\"Smartphone &amp; Tablets\";i:2;s:24:\"Smartphone &amp; Tablets\";}',1,121,'a:2:{s:3:\"url\";s:0:\"\";s:8:\"category\";s:2:\"34\";}','a:2:{i:1;s:0:\"\";i:2;s:0:\"\";}',0,0,0,'100%',0,3,2,'a:6:{s:4:\"html\";a:1:{s:4:\"text\";a:2:{i:1;s:29:\"&lt;p&gt;&lt;br&gt;&lt;/p&gt;\";i:2;s:29:\"&lt;p&gt;&lt;br&gt;&lt;/p&gt;\";}}s:7:\"product\";a:2:{s:2:\"id\";s:0:\"\";s:4:\"name\";s:0:\"\";}s:5:\"image\";a:2:{s:4:\"link\";s:12:\"no_image.png\";s:10:\"show_title\";s:1:\"1\";}s:11:\"subcategory\";a:8:{s:8:\"category\";s:0:\"\";s:13:\"limit_level_1\";s:1:\"4\";s:13:\"limit_level_2\";s:1:\"4\";s:10:\"show_title\";s:1:\"1\";s:10:\"show_image\";s:1:\"1\";s:7:\"columns\";s:1:\"1\";s:7:\"submenu\";s:1:\"1\";s:15:\"submenu_columns\";s:1:\"1\";}s:11:\"productlist\";a:4:{s:5:\"limit\";s:0:\"\";s:4:\"type\";s:3:\"new\";s:10:\"show_title\";s:1:\"1\";s:3:\"col\";s:1:\"1\";}s:10:\"categories\";a:4:{s:10:\"categories\";a:0:{}s:7:\"columns\";s:1:\"1\";s:7:\"submenu\";s:1:\"1\";s:15:\"submenu_columns\";s:1:\"1\";}}','','icon icon13','css-menu'),
	(152,139,8,'no_image.png','a:2:{i:1;s:9:\"Sub menu1\";i:2;s:9:\"Sub menu1\";}',1,121,'a:2:{s:3:\"url\";s:0:\"\";s:8:\"category\";s:0:\"\";}','a:2:{i:1;s:0:\"\";i:2;s:0:\"\";}',0,0,0,'100%',0,12,2,'a:6:{s:4:\"html\";a:1:{s:4:\"text\";a:2:{i:1;s:29:\"&lt;p&gt;&lt;br&gt;&lt;/p&gt;\";i:2;s:29:\"&lt;p&gt;&lt;br&gt;&lt;/p&gt;\";}}s:7:\"product\";a:2:{s:2:\"id\";s:0:\"\";s:4:\"name\";s:0:\"\";}s:5:\"image\";a:2:{s:4:\"link\";s:12:\"no_image.png\";s:10:\"show_title\";s:1:\"1\";}s:11:\"subcategory\";a:8:{s:8:\"category\";s:0:\"\";s:13:\"limit_level_1\";s:1:\"4\";s:13:\"limit_level_2\";s:1:\"4\";s:10:\"show_title\";s:1:\"1\";s:10:\"show_image\";s:1:\"1\";s:7:\"columns\";s:1:\"1\";s:7:\"submenu\";s:1:\"1\";s:15:\"submenu_columns\";s:1:\"1\";}s:11:\"productlist\";a:4:{s:5:\"limit\";s:0:\"\";s:4:\"type\";s:3:\"new\";s:10:\"show_title\";s:1:\"1\";s:3:\"col\";s:1:\"1\";}s:10:\"categories\";a:4:{s:10:\"categories\";a:6:{i:0;a:3:{s:2:\"id\";i:20;s:4:\"name\";s:8:\"Desktops\";s:8:\"children\";a:4:{i:0;a:2:{s:2:\"id\";i:59;s:4:\"name\";s:31:\"Computer','','',''),
	(150,138,10,'http://localhost/ytc_templates/opencart/so_maxshop/image/cache/no_image-100x100.png','a:2:{i:1;s:7:\"Submenu\";i:2;s:7:\"Submenu\";}',1,121,'a:2:{s:3:\"url\";s:0:\"\";s:8:\"category\";s:2:\"34\";}','a:2:{i:1;s:0:\"\";i:2;s:0:\"\";}',0,0,0,'',0,12,2,'a:6:{s:4:\"html\";a:1:{s:4:\"text\";a:2:{i:1;s:29:\"&lt;p&gt;&lt;br&gt;&lt;/p&gt;\";i:2;s:29:\"&lt;p&gt;&lt;br&gt;&lt;/p&gt;\";}}s:7:\"product\";a:2:{s:2:\"id\";s:0:\"\";s:4:\"name\";s:0:\"\";}s:5:\"image\";a:2:{s:4:\"link\";s:12:\"no_image.png\";s:10:\"show_title\";s:1:\"1\";}s:11:\"subcategory\";a:8:{s:8:\"category\";s:0:\"\";s:13:\"limit_level_1\";s:1:\"4\";s:13:\"limit_level_2\";s:1:\"4\";s:10:\"show_title\";s:1:\"1\";s:10:\"show_image\";s:1:\"1\";s:7:\"columns\";s:1:\"1\";s:7:\"submenu\";s:1:\"1\";s:15:\"submenu_columns\";s:1:\"1\";}s:11:\"productlist\";a:4:{s:5:\"limit\";s:0:\"\";s:4:\"type\";s:3:\"new\";s:10:\"show_title\";s:1:\"1\";s:3:\"col\";s:1:\"1\";}s:10:\"categories\";a:4:{s:10:\"categories\";a:8:{i:0;a:3:{s:4:\"name\";s:40:\"Electronics','','',''),
	(149,137,6,'http://localhost/ytc_templates/opencart/so_market/image/cache/no_image-100x100.png','a:2:{i:1;s:4:\"HTML\";i:2;s:4:\"HTML\";}',1,121,'a:2:{s:3:\"url\";s:0:\"\";s:8:\"category\";s:2:\"18\";}','a:2:{i:1;s:0:\"\";i:2;s:0:\"\";}',0,0,0,'40%',0,6,0,'a:6:{s:4:\"html\";a:1:{s:4:\"text\";a:2:{i:1;s:172:\"&lt;div class=&quot;row banner&quot;&gt;&lt;a href=&quot;#&quot;&gt;&lt;img src=&quot;image/catalog/cms/menu_bg2.jpg&quot; alt=&quot;banner1&quot;&gt;&lt;/a&gt;&lt;/div&gt;\";i:2;s:172:\"&lt;div class=&quot;row banner&quot;&gt;&lt;a href=&quot;#&quot;&gt;&lt;img src=&quot;image/catalog/cms/menu_bg2.jpg&quot; alt=&quot;banner1&quot;&gt;&lt;/a&gt;&lt;/div&gt;\";}}s:7:\"product\";a:2:{s:2:\"id\";s:0:\"\";s:4:\"name\";s:0:\"\";}s:5:\"image\";a:2:{s:4:\"link\";s:12:\"no_image.png\";s:10:\"show_title\";s:1:\"1\";}s:11:\"subcategory\";a:8:{s:8:\"category\";s:0:\"\";s:13:\"limit_level_1\";s:1:\"4\";s:13:\"limit_level_2\";s:1:\"4\";s:10:\"show_title\";s:1:\"1\";s:10:\"show_image\";s:1:\"1\";s:7:\"columns\";s:1:\"1\";s:7:\"submenu\";s:1:\"1\";s:15:\"submenu_columns\";s:1:\"1\";}s:11:\"productlist\";a:4:{s:5:\"limit\";s:0:\"\";s:4:\"type\";s:3:\"new\";s:10:\"show_title\";s:1:\"1\";s:3:\"col\";s:0:\"\";}s:10:\"categories\";a:4:{s:10:\"categories\";a:0:{}s:7:\"columns\";s:1:\"1\";s:7:\"submenu\";s:1:\"2\";s:15:\"submenu_columns\";s:1:\"1\";}}','','',''),
	(148,0,3,'http://localhost/ytc_templates/opencart/so_market/image/cache/no_image-100x100.png','a:2:{i:1;s:10:\"Electronic\";i:2;s:10:\"Electronic\";}',1,121,'a:2:{s:3:\"url\";s:0:\"\";s:8:\"category\";s:2:\"25\";}','a:2:{i:1;s:0:\"\";i:2;s:0:\"\";}',0,0,0,'100%',0,4,0,'a:6:{s:4:\"html\";a:1:{s:4:\"text\";a:2:{i:1;s:29:\"&lt;p&gt;&lt;br&gt;&lt;/p&gt;\";i:2;s:29:\"&lt;p&gt;&lt;br&gt;&lt;/p&gt;\";}}s:7:\"product\";a:2:{s:2:\"id\";s:0:\"\";s:4:\"name\";s:0:\"\";}s:5:\"image\";a:2:{s:4:\"link\";s:12:\"no_image.png\";s:10:\"show_title\";s:1:\"1\";}s:11:\"subcategory\";a:8:{s:8:\"category\";s:0:\"\";s:13:\"limit_level_1\";s:1:\"4\";s:13:\"limit_level_2\";s:1:\"4\";s:10:\"show_title\";s:1:\"1\";s:10:\"show_image\";s:1:\"1\";s:7:\"columns\";s:1:\"1\";s:7:\"submenu\";s:1:\"1\";s:15:\"submenu_columns\";s:1:\"1\";}s:11:\"productlist\";a:4:{s:5:\"limit\";s:0:\"\";s:4:\"type\";s:3:\"new\";s:10:\"show_title\";s:1:\"1\";s:3:\"col\";s:0:\"\";}s:10:\"categories\";a:4:{s:10:\"categories\";a:0:{}s:7:\"columns\";s:1:\"1\";s:7:\"submenu\";s:1:\"1\";s:15:\"submenu_columns\";s:1:\"1\";}}','','icon icon2',''),
	(146,0,17,'http://localhost/ytc_templates/opencart/so_market/image/cache/no_image-100x100.png','a:2:{i:1;s:21:\"Jewelry &amp; Watches\";i:2;s:21:\"Jewelry &amp; Watches\";}',1,121,'a:2:{s:3:\"url\";s:0:\"\";s:8:\"category\";s:2:\"20\";}','a:2:{i:1;s:0:\"\";i:2;s:0:\"\";}',0,0,0,'100%',0,4,0,'a:6:{s:4:\"html\";a:1:{s:4:\"text\";a:2:{i:1;s:29:\"&lt;p&gt;&lt;br&gt;&lt;/p&gt;\";i:2;s:29:\"&lt;p&gt;&lt;br&gt;&lt;/p&gt;\";}}s:7:\"product\";a:2:{s:2:\"id\";s:0:\"\";s:4:\"name\";s:0:\"\";}s:5:\"image\";a:2:{s:4:\"link\";s:12:\"no_image.png\";s:10:\"show_title\";s:1:\"1\";}s:11:\"subcategory\";a:8:{s:8:\"category\";s:0:\"\";s:13:\"limit_level_1\";s:1:\"4\";s:13:\"limit_level_2\";s:1:\"4\";s:10:\"show_title\";s:1:\"1\";s:10:\"show_image\";s:1:\"1\";s:7:\"columns\";s:1:\"1\";s:7:\"submenu\";s:1:\"1\";s:15:\"submenu_columns\";s:1:\"1\";}s:11:\"productlist\";a:4:{s:5:\"limit\";s:0:\"\";s:4:\"type\";s:3:\"new\";s:10:\"show_title\";s:1:\"1\";s:3:\"col\";s:0:\"\";}s:10:\"categories\";a:4:{s:10:\"categories\";a:0:{}s:7:\"columns\";s:1:\"1\";s:7:\"submenu\";s:1:\"1\";s:15:\"submenu_columns\";s:1:\"1\";}}','','icon icon12',''),
	(147,135,1,'no_image.png','a:2:{i:1;s:12:\"Sub category\";i:2;s:12:\"Sub category\";}',1,121,'a:2:{s:3:\"url\";s:0:\"\";s:8:\"category\";s:2:\"33\";}','a:2:{i:1;s:0:\"\";i:2;s:0:\"\";}',0,0,0,'',0,8,2,'a:6:{s:4:\"html\";a:1:{s:4:\"text\";a:2:{i:1;s:29:\"&lt;p&gt;&lt;br&gt;&lt;/p&gt;\";i:2;s:29:\"&lt;p&gt;&lt;br&gt;&lt;/p&gt;\";}}s:7:\"product\";a:2:{s:2:\"id\";s:0:\"\";s:4:\"name\";s:0:\"\";}s:5:\"image\";a:2:{s:4:\"link\";s:12:\"no_image.png\";s:10:\"show_title\";s:1:\"1\";}s:11:\"subcategory\";a:8:{s:8:\"category\";s:0:\"\";s:13:\"limit_level_1\";s:1:\"4\";s:13:\"limit_level_2\";s:1:\"4\";s:10:\"show_title\";s:1:\"1\";s:10:\"show_image\";s:1:\"1\";s:7:\"columns\";s:1:\"1\";s:7:\"submenu\";s:1:\"1\";s:15:\"submenu_columns\";s:1:\"1\";}s:11:\"productlist\";a:4:{s:5:\"limit\";s:0:\"\";s:4:\"type\";s:3:\"new\";s:10:\"show_title\";s:1:\"1\";s:3:\"col\";s:1:\"1\";}s:10:\"categories\";a:4:{s:10:\"categories\";a:4:{i:0;a:3:{s:2:\"id\";i:25;s:4:\"name\";s:10:\"Automotive\";s:8:\"children\";a:4:{i:0;a:2:{s:2:\"id\";i:28;s:4:\"name\";s:39:\"Automotive','','',''),
	(145,0,16,'http://localhost/ytc_templates/opencart/so_market/image/cache/no_image-100x100.png','a:2:{i:1;s:19:\"Toys &amp; Hobbies \";i:2;s:19:\"Toys &amp; Hobbies \";}',1,121,'a:2:{s:3:\"url\";s:0:\"\";s:8:\"category\";s:2:\"57\";}','a:2:{i:1;s:0:\"\";i:2;s:0:\"\";}',0,0,0,'100%',0,4,0,'a:6:{s:4:\"html\";a:1:{s:4:\"text\";a:2:{i:1;s:29:\"&lt;p&gt;&lt;br&gt;&lt;/p&gt;\";i:2;s:29:\"&lt;p&gt;&lt;br&gt;&lt;/p&gt;\";}}s:7:\"product\";a:2:{s:2:\"id\";s:0:\"\";s:4:\"name\";s:0:\"\";}s:5:\"image\";a:2:{s:4:\"link\";s:12:\"no_image.png\";s:10:\"show_title\";s:1:\"1\";}s:11:\"subcategory\";a:8:{s:8:\"category\";s:0:\"\";s:13:\"limit_level_1\";s:1:\"4\";s:13:\"limit_level_2\";s:1:\"4\";s:10:\"show_title\";s:1:\"1\";s:10:\"show_image\";s:1:\"1\";s:7:\"columns\";s:1:\"1\";s:7:\"submenu\";s:1:\"1\";s:15:\"submenu_columns\";s:1:\"1\";}s:11:\"productlist\";a:4:{s:5:\"limit\";s:0:\"\";s:4:\"type\";s:3:\"new\";s:10:\"show_title\";s:1:\"1\";s:3:\"col\";s:0:\"\";}s:10:\"categories\";a:4:{s:10:\"categories\";a:0:{}s:7:\"columns\";s:1:\"1\";s:7:\"submenu\";s:1:\"1\";s:15:\"submenu_columns\";s:1:\"1\";}}','','icon icon11',''),
	(142,0,12,'http://localhost/ytc_templates/opencart/so_market/image/cache/no_image-100x100.png','a:2:{i:1;s:18:\"Camera &amp; Photo\";i:2;s:18:\"Camera &amp; Photo\";}',1,121,'a:2:{s:3:\"url\";s:0:\"\";s:8:\"category\";s:2:\"82\";}','a:2:{i:1;s:0:\"\";i:2;s:0:\"\";}',0,0,0,'100%',0,4,0,'a:6:{s:4:\"html\";a:1:{s:4:\"text\";a:2:{i:1;s:29:\"&lt;p&gt;&lt;br&gt;&lt;/p&gt;\";i:2;s:29:\"&lt;p&gt;&lt;br&gt;&lt;/p&gt;\";}}s:7:\"product\";a:2:{s:2:\"id\";s:0:\"\";s:4:\"name\";s:0:\"\";}s:5:\"image\";a:2:{s:4:\"link\";s:12:\"no_image.png\";s:10:\"show_title\";s:1:\"1\";}s:11:\"subcategory\";a:8:{s:8:\"category\";s:0:\"\";s:13:\"limit_level_1\";s:1:\"4\";s:13:\"limit_level_2\";s:1:\"4\";s:10:\"show_title\";s:1:\"1\";s:10:\"show_image\";s:1:\"1\";s:7:\"columns\";s:1:\"1\";s:7:\"submenu\";s:1:\"1\";s:15:\"submenu_columns\";s:1:\"1\";}s:11:\"productlist\";a:4:{s:5:\"limit\";s:0:\"\";s:4:\"type\";s:3:\"new\";s:10:\"show_title\";s:1:\"1\";s:3:\"col\";s:0:\"\";}s:10:\"categories\";a:4:{s:10:\"categories\";a:0:{}s:7:\"columns\";s:1:\"1\";s:7:\"submenu\";s:1:\"1\";s:15:\"submenu_columns\";s:1:\"1\";}}','','icon icon8',''),
	(143,0,14,'http://localhost/ytc_templates/opencart/so_market/image/cache/no_image-100x100.png','a:2:{i:1;s:32:\"Outdoor &amp; Traveling Supplies\";i:2;s:32:\"Outdoor &amp; Traveling Supplies\";}',1,121,'a:2:{s:3:\"url\";s:0:\"\";s:8:\"category\";s:2:\"72\";}','a:2:{i:1;s:0:\"\";i:2;s:0:\"\";}',0,0,0,'100%',0,4,0,'a:6:{s:4:\"html\";a:1:{s:4:\"text\";a:2:{i:1;s:29:\"&lt;p&gt;&lt;br&gt;&lt;/p&gt;\";i:2;s:29:\"&lt;p&gt;&lt;br&gt;&lt;/p&gt;\";}}s:7:\"product\";a:2:{s:2:\"id\";s:0:\"\";s:4:\"name\";s:0:\"\";}s:5:\"image\";a:2:{s:4:\"link\";s:12:\"no_image.png\";s:10:\"show_title\";s:1:\"1\";}s:11:\"subcategory\";a:8:{s:8:\"category\";s:0:\"\";s:13:\"limit_level_1\";s:1:\"4\";s:13:\"limit_level_2\";s:1:\"4\";s:10:\"show_title\";s:1:\"1\";s:10:\"show_image\";s:1:\"1\";s:7:\"columns\";s:1:\"1\";s:7:\"submenu\";s:1:\"1\";s:15:\"submenu_columns\";s:1:\"1\";}s:11:\"productlist\";a:4:{s:5:\"limit\";s:0:\"\";s:4:\"type\";s:3:\"new\";s:10:\"show_title\";s:1:\"1\";s:3:\"col\";s:0:\"\";}s:10:\"categories\";a:4:{s:10:\"categories\";a:0:{}s:7:\"columns\";s:1:\"1\";s:7:\"submenu\";s:1:\"1\";s:15:\"submenu_columns\";s:1:\"1\";}}','','icon icon9',''),
	(144,0,15,'http://localhost/ytc_templates/opencart/so_market/image/cache/no_image-100x100.png','a:2:{i:1;s:19:\"Health &amp; Beauty\";i:2;s:19:\"Health &amp; Beauty\";}',1,121,'a:2:{s:3:\"url\";s:0:\"\";s:8:\"category\";s:2:\"24\";}','a:2:{i:1;s:0:\"\";i:2;s:0:\"\";}',0,0,0,'100%',0,4,0,'a:6:{s:4:\"html\";a:1:{s:4:\"text\";a:2:{i:1;s:29:\"&lt;p&gt;&lt;br&gt;&lt;/p&gt;\";i:2;s:29:\"&lt;p&gt;&lt;br&gt;&lt;/p&gt;\";}}s:7:\"product\";a:2:{s:2:\"id\";s:0:\"\";s:4:\"name\";s:0:\"\";}s:5:\"image\";a:2:{s:4:\"link\";s:12:\"no_image.png\";s:10:\"show_title\";s:1:\"1\";}s:11:\"subcategory\";a:8:{s:8:\"category\";s:0:\"\";s:13:\"limit_level_1\";s:1:\"4\";s:13:\"limit_level_2\";s:1:\"4\";s:10:\"show_title\";s:1:\"1\";s:10:\"show_image\";s:1:\"1\";s:7:\"columns\";s:1:\"1\";s:7:\"submenu\";s:1:\"1\";s:15:\"submenu_columns\";s:1:\"1\";}s:11:\"productlist\";a:4:{s:5:\"limit\";s:0:\"\";s:4:\"type\";s:3:\"new\";s:10:\"show_title\";s:1:\"1\";s:3:\"col\";s:0:\"\";}s:10:\"categories\";a:4:{s:10:\"categories\";a:0:{}s:7:\"columns\";s:1:\"1\";s:7:\"submenu\";s:1:\"1\";s:15:\"submenu_columns\";s:1:\"1\";}}','','icon icon10',''),
	(141,0,18,'http://localhost/ytc_templates/opencart/so_market/image/cache/no_image-100x100.png','a:2:{i:1;s:22:\"Bags, Holiday Supplies\";i:2;s:22:\"Bags, Holiday Supplies\";}',1,121,'a:2:{s:3:\"url\";s:0:\"\";s:8:\"category\";s:2:\"17\";}','a:2:{i:1;s:0:\"\";i:2;s:0:\"\";}',0,0,0,'100%',0,4,0,'a:6:{s:4:\"html\";a:1:{s:4:\"text\";a:2:{i:1;s:29:\"&lt;p&gt;&lt;br&gt;&lt;/p&gt;\";i:2;s:29:\"&lt;p&gt;&lt;br&gt;&lt;/p&gt;\";}}s:7:\"product\";a:2:{s:2:\"id\";s:0:\"\";s:4:\"name\";s:0:\"\";}s:5:\"image\";a:2:{s:4:\"link\";s:12:\"no_image.png\";s:10:\"show_title\";s:1:\"1\";}s:11:\"subcategory\";a:8:{s:8:\"category\";s:0:\"\";s:13:\"limit_level_1\";s:1:\"4\";s:13:\"limit_level_2\";s:1:\"4\";s:10:\"show_title\";s:1:\"1\";s:10:\"show_image\";s:1:\"1\";s:7:\"columns\";s:1:\"1\";s:7:\"submenu\";s:1:\"1\";s:15:\"submenu_columns\";s:1:\"1\";}s:11:\"productlist\";a:4:{s:5:\"limit\";s:0:\"\";s:4:\"type\";s:3:\"new\";s:10:\"show_title\";s:1:\"1\";s:3:\"col\";s:0:\"\";}s:10:\"categories\";a:4:{s:10:\"categories\";a:0:{}s:7:\"columns\";s:1:\"1\";s:7:\"submenu\";s:1:\"1\";s:15:\"submenu_columns\";s:1:\"1\";}}','','icon icon7',''),
	(140,0,11,'http://localhost/ytc_templates/opencart/so_market/image/cache/no_image-100x100.png','a:2:{i:1;s:23:\"Flashlights &amp; Lamps\";i:2;s:23:\"Flashlights &amp; Lamps\";}',1,121,'a:2:{s:3:\"url\";s:0:\"\";s:8:\"category\";s:2:\"80\";}','a:2:{i:1;s:0:\"\";i:2;s:0:\"\";}',0,0,0,'100%',0,4,0,'a:6:{s:4:\"html\";a:1:{s:4:\"text\";a:2:{i:1;s:29:\"&lt;p&gt;&lt;br&gt;&lt;/p&gt;\";i:2;s:29:\"&lt;p&gt;&lt;br&gt;&lt;/p&gt;\";}}s:7:\"product\";a:2:{s:2:\"id\";s:0:\"\";s:4:\"name\";s:0:\"\";}s:5:\"image\";a:2:{s:4:\"link\";s:12:\"no_image.png\";s:10:\"show_title\";s:1:\"1\";}s:11:\"subcategory\";a:8:{s:8:\"category\";s:0:\"\";s:13:\"limit_level_1\";s:1:\"4\";s:13:\"limit_level_2\";s:1:\"4\";s:10:\"show_title\";s:1:\"1\";s:10:\"show_image\";s:1:\"1\";s:7:\"columns\";s:1:\"1\";s:7:\"submenu\";s:1:\"1\";s:15:\"submenu_columns\";s:1:\"1\";}s:11:\"productlist\";a:4:{s:5:\"limit\";s:0:\"\";s:4:\"type\";s:3:\"new\";s:10:\"show_title\";s:1:\"1\";s:3:\"col\";s:0:\"\";}s:10:\"categories\";a:4:{s:10:\"categories\";a:0:{}s:7:\"columns\";s:1:\"1\";s:7:\"submenu\";s:1:\"1\";s:15:\"submenu_columns\";s:1:\"1\";}}','',' icon icon6',''),
	(139,0,7,'http://localhost/ytc_templates/opencart/so_market/image/cache/no_image-100x100.png','a:2:{i:1;s:19:\"Health &amp; Beauty\";i:2;s:19:\"Health &amp; Beauty\";}',1,121,'a:2:{s:3:\"url\";s:0:\"\";s:8:\"category\";s:2:\"24\";}','a:2:{i:1;s:0:\"\";i:2;s:0:\"\";}',0,0,0,'100%',0,4,0,'a:6:{s:4:\"html\";a:1:{s:4:\"text\";a:2:{i:1;s:29:\"&lt;p&gt;&lt;br&gt;&lt;/p&gt;\";i:2;s:29:\"&lt;p&gt;&lt;br&gt;&lt;/p&gt;\";}}s:7:\"product\";a:2:{s:2:\"id\";s:0:\"\";s:4:\"name\";s:0:\"\";}s:5:\"image\";a:2:{s:4:\"link\";s:12:\"no_image.png\";s:10:\"show_title\";s:1:\"1\";}s:11:\"subcategory\";a:8:{s:8:\"category\";s:0:\"\";s:13:\"limit_level_1\";s:1:\"4\";s:13:\"limit_level_2\";s:1:\"4\";s:10:\"show_title\";s:1:\"1\";s:10:\"show_image\";s:1:\"1\";s:7:\"columns\";s:1:\"1\";s:7:\"submenu\";s:1:\"1\";s:15:\"submenu_columns\";s:1:\"1\";}s:11:\"productlist\";a:4:{s:5:\"limit\";s:0:\"\";s:4:\"type\";s:3:\"new\";s:10:\"show_title\";s:1:\"1\";s:3:\"col\";s:0:\"\";}s:10:\"categories\";a:4:{s:10:\"categories\";a:0:{}s:7:\"columns\";s:1:\"1\";s:7:\"submenu\";s:1:\"1\";s:15:\"submenu_columns\";s:1:\"1\";}}','','icon icon5',''),
	(137,0,4,'http://localhost/ytc_templates/opencart/so_maxshop/image/cache/no_image-100x100.png','a:2:{i:1;s:21:\"Sports &amp; Outdoors\";i:2;s:21:\"Sports &amp; Outdoors\";}',1,121,'a:2:{s:3:\"url\";s:0:\"\";s:8:\"category\";s:2:\"25\";}','a:2:{i:1;s:0:\"\";i:2;s:0:\"\";}',0,0,0,'60%',0,4,0,'a:6:{s:4:\"html\";a:1:{s:4:\"text\";a:2:{i:1;s:29:\"&lt;p&gt;&lt;br&gt;&lt;/p&gt;\";i:2;s:29:\"&lt;p&gt;&lt;br&gt;&lt;/p&gt;\";}}s:7:\"product\";a:2:{s:2:\"id\";s:0:\"\";s:4:\"name\";s:0:\"\";}s:5:\"image\";a:2:{s:4:\"link\";s:12:\"no_image.png\";s:10:\"show_title\";s:1:\"1\";}s:11:\"subcategory\";a:8:{s:8:\"category\";s:0:\"\";s:13:\"limit_level_1\";s:1:\"4\";s:13:\"limit_level_2\";s:1:\"4\";s:10:\"show_title\";s:1:\"1\";s:10:\"show_image\";s:1:\"1\";s:7:\"columns\";s:1:\"1\";s:7:\"submenu\";s:1:\"1\";s:15:\"submenu_columns\";s:1:\"1\";}s:11:\"productlist\";a:4:{s:5:\"limit\";s:0:\"\";s:4:\"type\";s:3:\"new\";s:10:\"show_title\";s:1:\"1\";s:3:\"col\";s:1:\"1\";}s:10:\"categories\";a:4:{s:10:\"categories\";a:0:{}s:7:\"columns\";s:1:\"1\";s:7:\"submenu\";s:1:\"1\";s:15:\"submenu_columns\";s:1:\"1\";}}','','icon icon3',' item-style3'),
	(138,0,9,'http://localhost/ytc_templates/opencart/so_maxshop/image/cache/no_image-100x100.png','a:2:{i:1;s:24:\"Smartphone &amp; Tablets\";i:2;s:24:\"Smartphone &amp; Tablets\";}',1,121,'a:2:{s:3:\"url\";s:0:\"\";s:8:\"category\";s:2:\"34\";}','a:2:{i:1;s:0:\"\";i:2;s:0:\"\";}',0,0,0,'25%',0,4,2,'a:6:{s:4:\"html\";a:1:{s:4:\"text\";a:2:{i:1;s:29:\"&lt;p&gt;&lt;br&gt;&lt;/p&gt;\";i:2;s:29:\"&lt;p&gt;&lt;br&gt;&lt;/p&gt;\";}}s:7:\"product\";a:2:{s:2:\"id\";s:0:\"\";s:4:\"name\";s:0:\"\";}s:5:\"image\";a:2:{s:4:\"link\";s:12:\"no_image.png\";s:10:\"show_title\";s:1:\"1\";}s:11:\"subcategory\";a:8:{s:8:\"category\";s:0:\"\";s:13:\"limit_level_1\";s:1:\"4\";s:13:\"limit_level_2\";s:1:\"4\";s:10:\"show_title\";s:1:\"1\";s:10:\"show_image\";s:1:\"1\";s:7:\"columns\";s:1:\"1\";s:7:\"submenu\";s:1:\"1\";s:15:\"submenu_columns\";s:1:\"1\";}s:11:\"productlist\";a:4:{s:5:\"limit\";s:0:\"\";s:4:\"type\";s:3:\"new\";s:10:\"show_title\";s:1:\"1\";s:3:\"col\";s:1:\"1\";}s:10:\"categories\";a:4:{s:10:\"categories\";a:4:{i:0;a:3:{s:4:\"name\";s:40:\"Electronics','','icon icon4',' css-menu'),
	(135,0,0,'http://localhost/ytc_templates/opencart/so_market/image/cache/no_image-100x100.png','a:2:{i:1;s:27:\"Automotive &amp; Motocrycle\";i:2;s:27:\"Automotive &amp; Motocrycle\";}',1,121,'a:2:{s:3:\"url\";s:0:\"\";s:8:\"category\";s:2:\"33\";}','a:2:{i:1;s:0:\"\";i:2;s:0:\"\";}',0,0,0,'100%',0,4,0,'a:6:{s:4:\"html\";a:1:{s:4:\"text\";a:2:{i:1;s:29:\"&lt;p&gt;&lt;br&gt;&lt;/p&gt;\";i:2;s:29:\"&lt;p&gt;&lt;br&gt;&lt;/p&gt;\";}}s:7:\"product\";a:2:{s:2:\"id\";s:0:\"\";s:4:\"name\";s:0:\"\";}s:5:\"image\";a:2:{s:4:\"link\";s:12:\"no_image.png\";s:10:\"show_title\";s:1:\"1\";}s:11:\"subcategory\";a:8:{s:8:\"category\";s:0:\"\";s:13:\"limit_level_1\";s:1:\"4\";s:13:\"limit_level_2\";s:1:\"4\";s:10:\"show_title\";s:1:\"1\";s:10:\"show_image\";s:1:\"1\";s:7:\"columns\";s:1:\"1\";s:7:\"submenu\";s:1:\"1\";s:15:\"submenu_columns\";s:1:\"1\";}s:11:\"productlist\";a:4:{s:5:\"limit\";s:0:\"\";s:4:\"type\";s:3:\"new\";s:10:\"show_title\";s:1:\"1\";s:3:\"col\";s:0:\"\";}s:10:\"categories\";a:4:{s:10:\"categories\";a:0:{}s:7:\"columns\";s:1:\"1\";s:7:\"submenu\";s:1:\"1\";s:15:\"submenu_columns\";s:1:\"1\";}}','','icon icon1',' style1'),
	(136,137,5,'no_image.png','a:2:{i:1;s:7:\"Submenu\";i:2;s:7:\"Submenu\";}',1,121,'a:2:{s:3:\"url\";s:0:\"\";s:8:\"category\";s:2:\"18\";}','a:2:{i:1;s:0:\"\";i:2;s:0:\"\";}',0,0,0,'40%',0,6,2,'a:6:{s:4:\"html\";a:1:{s:4:\"text\";a:2:{i:1;s:29:\"&lt;p&gt;&lt;br&gt;&lt;/p&gt;\";i:2;s:29:\"&lt;p&gt;&lt;br&gt;&lt;/p&gt;\";}}s:7:\"product\";a:2:{s:2:\"id\";s:0:\"\";s:4:\"name\";s:0:\"\";}s:5:\"image\";a:2:{s:4:\"link\";s:12:\"no_image.png\";s:10:\"show_title\";s:1:\"1\";}s:11:\"subcategory\";a:8:{s:8:\"category\";s:0:\"\";s:13:\"limit_level_1\";s:1:\"4\";s:13:\"limit_level_2\";s:1:\"4\";s:10:\"show_title\";s:1:\"1\";s:10:\"show_image\";s:1:\"1\";s:7:\"columns\";s:1:\"1\";s:7:\"submenu\";s:1:\"1\";s:15:\"submenu_columns\";s:1:\"1\";}s:11:\"productlist\";a:4:{s:5:\"limit\";s:0:\"\";s:4:\"type\";s:3:\"new\";s:10:\"show_title\";s:1:\"1\";s:3:\"col\";s:1:\"1\";}s:10:\"categories\";a:4:{s:10:\"categories\";a:3:{i:0;a:3:{s:2:\"id\";i:57;s:4:\"name\";s:16:\"Mobile & Tablet \";s:8:\"children\";a:3:{i:0;a:2:{s:2:\"id\";i:69;s:4:\"name\";s:36:\"Mobile & Tablet ','','',''),
	(306,300,3,'no_image.png','a:1:{i:1;s:18:\"Platinum Jewellery\";}',0,119,'a:2:{s:3:\"url\";s:0:\"\";s:8:\"category\";s:0:\"\";}','a:1:{i:1;s:0:\"\";}',0,0,0,'100%',0,3,0,'a:6:{s:4:\"html\";a:1:{s:4:\"text\";a:1:{i:1;s:2170:\"&lt;div class=&quot;toplink-menu-heading&quot;&gt;Platinum Jewellery&lt;/div&gt;\r\n&lt;div class=&quot;toplink-menu&quot;&gt;\r\n	&lt;ul class=&quot;links-menu&quot;&gt;\r\n		&lt;li&gt;\r\n			&lt;a title=&quot;Rings&quot; href=&quot;rings.html&amp;amp;filter=15,11&quot;&gt;Rings&lt;/a&gt;\r\n		&lt;/li&gt;\r\n		&lt;li&gt;\r\n			&lt;a title=&quot;Earrings&quot; href=&quot;earrings.html&amp;amp;filter=15,11&quot;&gt;Earrings&lt;/a&gt;\r\n		&lt;/li&gt;\r\n		&lt;li&gt;\r\n			&lt;a title=&quot;Pendants&quot; href=&quot;pendants.html&amp;amp;filter=15,11&quot;&gt;Pendants&lt;/a&gt;\r\n		&lt;/li&gt;\r\n		&lt;li&gt;\r\n			&lt;a title=&quot;Necklaces&quot; href=&quot;necklaces.html&amp;amp;filter=15,11&quot;&gt;Necklaces&lt;/a&gt;\r\n		&lt;/li&gt;\r\n		&lt;li&gt;\r\n			&lt;a title=&quot;Bangles&quot; href=&quot;bangles.html&amp;amp;filter=15,11&quot;&gt;Bangles&lt;/a&gt;\r\n		&lt;/li&gt;\r\n		&lt;li&gt;\r\n			&lt;a title=&quot;Bracelets&quot; href=&quot;bracelets.html&amp;amp;filter=15,11&quot;&gt;Bracelets&lt;/a&gt;\r\n		&lt;/li&gt;\r\n		&lt;li&gt;\r\n			&lt;a title=&quot;Tanmaniyas&quot; href=&quot;tanmaniyas.html&amp;amp;filter=15,11&quot;&gt;Tanmaniyas&lt;/a&gt;\r\n		&lt;/li&gt;\r\n		&lt;li&gt;\r\n			&lt;a title=&quot;Chains&quot; href=&quot;chains.html&amp;amp;filter=15,11&quot;&gt;Chains&lt;/a&gt;\r\n		&lt;/li&gt;\r\n		&lt;li&gt;\r\n			&lt;a title=&quot;Anklets&quot; href=&quot;anklets.html&amp;amp;filter=15,11&quot;&gt;Anklets&lt;/a&gt;\r\n		&lt;/li&gt;\r\n		&lt;li&gt;\r\n			&lt;a title=&quot;Cuff-Links&quot; href=&quot;cuff-links.html&amp;amp;filter=15,11&quot;&gt;Cuff-Links&lt;/a&gt;\r\n		&lt;/li&gt;\r\n		&lt;li&gt;\r\n			&lt;a title=&quot;Mangalsutra&quot; href=&quot;mangalsutras.html&amp;amp;filter=15,11&quot;&gt;Mangalsutra&lt;/a&gt;\r\n		&lt;/li&gt;\r\n		&lt;li&gt;\r\n			&lt;a title=&quot;Nose Pin&quot; href=&quot;nose-pins.html&amp;amp;filter=15,11&quot;&gt;Nose-Pins&lt;/a&gt;\r\n		&lt;/li&gt;\r\n		&lt;li&gt;\r\n			&lt;a title=&quot;Matching Sets&quot; href=&quot;matching-sets.html&amp;amp;filter=15,11&quot;&gt;Pendants&lt;/a&gt;\r\n		&lt;/li&gt;\r\n		&lt;li&gt;\r\n			&lt;a title=&quot;Watches&quot; href=&quot;watches.html&amp;amp;filter=15,11&quot;&gt;Watches&lt;/a&gt;\r\n		&lt;/li&gt;\r\n	&lt;/ul&gt;\r\n&lt;/div&gt;\";}}s:7:\"product\";a:2:{s:2:\"id\";s:0:\"\";s:4:\"name\";s:0:\"\";}s:5:\"image\";a:2:{s:4:\"link\";s:12:\"no_image.png\";s:10:\"show_title\";s:1:\"1\";}s:11:\"subcategory\";a:9:{s:13:\"limit_level_1\";s:1:\"4\";s:13:\"limit_level_2\";s:1:\"4\";s:13:\"limit_level_3\";s:1:\"4\";s:10:\"show_title\";s:1:\"1\";s:10:\"show_image\";s:1:\"1\";s:7:\"columns\";s:1:\"1\";s:7:\"submenu\";s:1:\"1\";s:15:\"submenu_columns\";s:1:\"1\";s:8:\"category\";s:0:\"\";}s:11:\"productlist\";a:4:{s:5:\"limit\";s:0:\"\";s:4:\"type\";s:3:\"new\";s:10:\"show_title\";s:1:\"1\";s:3:\"col\";s:1:\"1\";}s:10:\"categories\";a:4:{s:10:\"categories\";a:0:{}s:7:\"columns\";s:1:\"1\";s:7:\"submenu\";s:1:\"1\";s:15:\"submenu_columns\";s:1:\"1\";}}','','',''),
	(303,300,2,'no_image.png','a:1:{i:1;s:17:\"Diamond Jewellery\";}',0,119,'a:2:{s:3:\"url\";s:0:\"\";s:8:\"category\";s:0:\"\";}','a:1:{i:1;s:0:\"\";}',0,0,0,'100%',0,3,0,'a:6:{s:4:\"html\";a:1:{s:4:\"text\";a:1:{i:1;s:2169:\"&lt;div class=&quot;toplink-menu-heading&quot;&gt;Diamond Jewellery&lt;/div&gt;\r\n&lt;div class=&quot;toplink-menu&quot;&gt;\r\n	&lt;ul class=&quot;links-menu&quot;&gt;\r\n		&lt;li&gt;\r\n			&lt;a title=&quot;Rings&quot; href=&quot;rings.html&amp;amp;filter=15,10&quot;&gt;Rings&lt;/a&gt;\r\n		&lt;/li&gt;\r\n		&lt;li&gt;\r\n			&lt;a title=&quot;Earrings&quot; href=&quot;earrings.html&amp;amp;filter=15,10&quot;&gt;Earrings&lt;/a&gt;\r\n		&lt;/li&gt;\r\n		&lt;li&gt;\r\n			&lt;a title=&quot;Pendants&quot; href=&quot;pendants.html&amp;amp;filter=15,10&quot;&gt;Pendants&lt;/a&gt;\r\n		&lt;/li&gt;\r\n		&lt;li&gt;\r\n			&lt;a title=&quot;Necklaces&quot; href=&quot;necklaces.html&amp;amp;filter=15,10&quot;&gt;Necklaces&lt;/a&gt;\r\n		&lt;/li&gt;\r\n		&lt;li&gt;\r\n			&lt;a title=&quot;Bangles&quot; href=&quot;bangles.html&amp;amp;filter=15,10&quot;&gt;Bangles&lt;/a&gt;\r\n		&lt;/li&gt;\r\n		&lt;li&gt;\r\n			&lt;a title=&quot;Bracelets&quot; href=&quot;bracelets.html&amp;amp;filter=15,10&quot;&gt;Bracelets&lt;/a&gt;\r\n		&lt;/li&gt;\r\n		&lt;li&gt;\r\n			&lt;a title=&quot;Tanmaniyas&quot; href=&quot;tanmaniyas.html&amp;amp;filter=15,10&quot;&gt;Tanmaniyas&lt;/a&gt;\r\n		&lt;/li&gt;\r\n		&lt;li&gt;\r\n			&lt;a title=&quot;Chains&quot; href=&quot;chains.html&amp;amp;filter=15,10&quot;&gt;Chains&lt;/a&gt;\r\n		&lt;/li&gt;\r\n		&lt;li&gt;\r\n			&lt;a title=&quot;Anklets&quot; href=&quot;anklets.html&amp;amp;filter=15,10&quot;&gt;Anklets&lt;/a&gt;\r\n		&lt;/li&gt;\r\n		&lt;li&gt;\r\n			&lt;a title=&quot;Cuff-Links&quot; href=&quot;cuff-links.html&amp;amp;filter=15,10&quot;&gt;Cuff-Links&lt;/a&gt;\r\n		&lt;/li&gt;\r\n		&lt;li&gt;\r\n			&lt;a title=&quot;Mangalsutra&quot; href=&quot;mangalsutras.html&amp;amp;filter=15,10&quot;&gt;Mangalsutra&lt;/a&gt;\r\n		&lt;/li&gt;\r\n		&lt;li&gt;\r\n			&lt;a title=&quot;Nose Pin&quot; href=&quot;nose-pins.html&amp;amp;filter=15,10&quot;&gt;Nose-Pins&lt;/a&gt;\r\n		&lt;/li&gt;\r\n		&lt;li&gt;\r\n			&lt;a title=&quot;Matching Sets&quot; href=&quot;matching-sets.html&amp;amp;filter=15,10&quot;&gt;Pendants&lt;/a&gt;\r\n		&lt;/li&gt;\r\n		&lt;li&gt;\r\n			&lt;a title=&quot;Watches&quot; href=&quot;watches.html&amp;amp;filter=15,10&quot;&gt;Watches&lt;/a&gt;\r\n		&lt;/li&gt;\r\n	&lt;/ul&gt;\r\n&lt;/div&gt;\";}}s:7:\"product\";a:2:{s:2:\"id\";s:0:\"\";s:4:\"name\";s:0:\"\";}s:5:\"image\";a:2:{s:4:\"link\";s:12:\"no_image.png\";s:10:\"show_title\";s:1:\"1\";}s:11:\"subcategory\";a:9:{s:13:\"limit_level_1\";s:1:\"4\";s:13:\"limit_level_2\";s:1:\"4\";s:13:\"limit_level_3\";s:1:\"4\";s:10:\"show_title\";s:1:\"1\";s:10:\"show_image\";s:1:\"1\";s:7:\"columns\";s:1:\"1\";s:7:\"submenu\";s:1:\"1\";s:15:\"submenu_columns\";s:1:\"1\";s:8:\"category\";s:0:\"\";}s:11:\"productlist\";a:4:{s:5:\"limit\";s:0:\"\";s:4:\"type\";s:3:\"new\";s:10:\"show_title\";s:1:\"1\";s:3:\"col\";s:1:\"1\";}s:10:\"categories\";a:4:{s:10:\"categories\";a:0:{}s:7:\"columns\";s:1:\"1\";s:7:\"submenu\";s:1:\"1\";s:15:\"submenu_columns\";s:1:\"1\";}}','','',''),
	(304,300,1,'no_image.png','a:1:{i:1;s:14:\"Gold Jewellery\";}',0,119,'a:2:{s:3:\"url\";s:0:\"\";s:8:\"category\";s:0:\"\";}','a:1:{i:1;s:0:\"\";}',0,0,0,'100%',0,3,0,'a:6:{s:4:\"html\";a:1:{s:4:\"text\";a:1:{i:1;s:2428:\"&lt;div class=&quot;toplink-menu-heading&quot;&gt;Gold Jewellery&lt;/div&gt;\r\n						&lt;div class=&quot;toplink-menu&quot;&gt;\r\n							&lt;ul class=&quot;links-menu&quot;&gt;\r\n								&lt;li&gt;\r\n									&lt;a title=&quot;Rings&quot; href=&quot;rings.html&amp;amp;filter=15,9&quot;&gt;Rings&lt;/a&gt;\r\n								&lt;/li&gt;\r\n								&lt;li&gt;\r\n									&lt;a title=&quot;Earrings&quot; href=&quot;earrings.html&amp;amp;filter=15,9&quot;&gt;Earrings&lt;/a&gt;\r\n								&lt;/li&gt;\r\n								&lt;li&gt;\r\n									&lt;a title=&quot;Pendants&quot; href=&quot;pendants.html&amp;amp;filter=15,9&quot;&gt;Pendants&lt;/a&gt;\r\n								&lt;/li&gt;\r\n								&lt;li&gt;\r\n									&lt;a title=&quot;Necklaces&quot; href=&quot;necklaces.html&amp;amp;filter=15,9&quot;&gt;Necklaces&lt;/a&gt;\r\n								&lt;/li&gt;\r\n								&lt;li&gt;\r\n									&lt;a title=&quot;Bangles&quot; href=&quot;bangles.html&amp;amp;filter=15,9&quot;&gt;Bangles&lt;/a&gt;\r\n								&lt;/li&gt;\r\n								&lt;li&gt;\r\n									&lt;a title=&quot;Bracelets&quot; href=&quot;bracelets.html&amp;amp;filter=15,9&quot;&gt;Bracelets&lt;/a&gt;\r\n								&lt;/li&gt;\r\n								&lt;li&gt;\r\n									&lt;a title=&quot;Tanmaniyas&quot; href=&quot;tanmaniyas.html&amp;amp;filter=15,9&quot;&gt;Tanmaniyas&lt;/a&gt;\r\n								&lt;/li&gt;\r\n								&lt;li&gt;\r\n									&lt;a title=&quot;Chains&quot; href=&quot;chains.html&amp;amp;filter=15,9&quot;&gt;Chains&lt;/a&gt;\r\n								&lt;/li&gt;\r\n								&lt;li&gt;\r\n									&lt;a title=&quot;Anklets&quot; href=&quot;anklets.html&amp;amp;filter=15,9&quot;&gt;Anklets&lt;/a&gt;\r\n								&lt;/li&gt;\r\n								&lt;li&gt;\r\n									&lt;a title=&quot;Cuff-Links&quot; href=&quot;cuff-links.html&amp;amp;filter=15,9&quot;&gt;Cuff-Links&lt;/a&gt;\r\n								&lt;/li&gt;\r\n								&lt;li&gt;\r\n									&lt;a title=&quot;Mangalsutra&quot; href=&quot;mangalsutras.html&amp;amp;filter=15,9&quot;&gt;Mangalsutra&lt;/a&gt;\r\n								&lt;/li&gt;\r\n								&lt;li&gt;\r\n									&lt;a title=&quot;Nose Pin&quot; href=&quot;nose-pins.html&amp;amp;filter=15,9&quot;&gt;Nose-Pins&lt;/a&gt;\r\n								&lt;/li&gt;\r\n								&lt;li&gt;\r\n									&lt;a title=&quot;Matching Sets&quot; href=&quot;matching-sets.html&amp;amp;filter=15,9&quot;&gt;Pendants&lt;/a&gt;\r\n								&lt;/li&gt;\r\n								&lt;li&gt;\r\n									&lt;a title=&quot;Watches&quot; href=&quot;watches.html&amp;amp;filter=15,9&quot;&gt;Watches&lt;/a&gt;\r\n								&lt;/li&gt;\r\n							&lt;/ul&gt;\r\n						&lt;/div&gt;\";}}s:7:\"product\";a:2:{s:2:\"id\";s:0:\"\";s:4:\"name\";s:0:\"\";}s:5:\"image\";a:2:{s:4:\"link\";s:12:\"no_image.png\";s:10:\"show_title\";s:1:\"1\";}s:11:\"subcategory\";a:9:{s:13:\"limit_level_1\";s:1:\"4\";s:13:\"limit_level_2\";s:1:\"4\";s:13:\"limit_level_3\";s:1:\"4\";s:10:\"show_title\";s:1:\"1\";s:10:\"show_image\";s:1:\"1\";s:7:\"columns\";s:1:\"1\";s:7:\"submenu\";s:1:\"1\";s:15:\"submenu_columns\";s:1:\"1\";s:8:\"category\";s:0:\"\";}s:11:\"productlist\";a:4:{s:5:\"limit\";s:0:\"\";s:4:\"type\";s:3:\"new\";s:10:\"show_title\";s:1:\"1\";s:3:\"col\";s:1:\"1\";}s:10:\"categories\";a:4:{s:10:\"categories\";a:0:{}s:7:\"columns\";s:1:\"1\";s:7:\"submenu\";s:1:\"1\";s:15:\"submenu_columns\";s:1:\"1\";}}','Gold Jewellery','',''),
	(305,300,4,'no_image.png','a:1:{i:1;s:19:\"Imitation Jewellery\";}',0,119,'a:2:{s:3:\"url\";s:0:\"\";s:8:\"category\";s:0:\"\";}','a:1:{i:1;s:0:\"\";}',0,0,0,'100%',0,3,0,'a:6:{s:4:\"html\";a:1:{s:4:\"text\";a:1:{i:1;s:2171:\"&lt;div class=&quot;toplink-menu-heading&quot;&gt;Imitation Jewellery&lt;/div&gt;\r\n&lt;div class=&quot;toplink-menu&quot;&gt;\r\n	&lt;ul class=&quot;links-menu&quot;&gt;\r\n		&lt;li&gt;\r\n			&lt;a title=&quot;Rings&quot; href=&quot;rings.html&amp;amp;filter=15,12&quot;&gt;Rings&lt;/a&gt;\r\n		&lt;/li&gt;\r\n		&lt;li&gt;\r\n			&lt;a title=&quot;Earrings&quot; href=&quot;earrings.html&amp;amp;filter=15,12&quot;&gt;Earrings&lt;/a&gt;\r\n		&lt;/li&gt;\r\n		&lt;li&gt;\r\n			&lt;a title=&quot;Pendants&quot; href=&quot;pendants.html&amp;amp;filter=15,12&quot;&gt;Pendants&lt;/a&gt;\r\n		&lt;/li&gt;\r\n		&lt;li&gt;\r\n			&lt;a title=&quot;Necklaces&quot; href=&quot;necklaces.html&amp;amp;filter=15,12&quot;&gt;Necklaces&lt;/a&gt;\r\n		&lt;/li&gt;\r\n		&lt;li&gt;\r\n			&lt;a title=&quot;Bangles&quot; href=&quot;bangles.html&amp;amp;filter=15,12&quot;&gt;Bangles&lt;/a&gt;\r\n		&lt;/li&gt;\r\n		&lt;li&gt;\r\n			&lt;a title=&quot;Bracelets&quot; href=&quot;bracelets.html&amp;amp;filter=15,12&quot;&gt;Bracelets&lt;/a&gt;\r\n		&lt;/li&gt;\r\n		&lt;li&gt;\r\n			&lt;a title=&quot;Tanmaniyas&quot; href=&quot;tanmaniyas.html&amp;amp;filter=15,12&quot;&gt;Tanmaniyas&lt;/a&gt;\r\n		&lt;/li&gt;\r\n		&lt;li&gt;\r\n			&lt;a title=&quot;Chains&quot; href=&quot;chains.html&amp;amp;filter=15,12&quot;&gt;Chains&lt;/a&gt;\r\n		&lt;/li&gt;\r\n		&lt;li&gt;\r\n			&lt;a title=&quot;Anklets&quot; href=&quot;anklets.html&amp;amp;filter=15,12&quot;&gt;Anklets&lt;/a&gt;\r\n		&lt;/li&gt;\r\n		&lt;li&gt;\r\n			&lt;a title=&quot;Cuff-Links&quot; href=&quot;cuff-links.html&amp;amp;filter=15,12&quot;&gt;Cuff-Links&lt;/a&gt;\r\n		&lt;/li&gt;\r\n		&lt;li&gt;\r\n			&lt;a title=&quot;Mangalsutra&quot; href=&quot;mangalsutras.html&amp;amp;filter=15,12&quot;&gt;Mangalsutra&lt;/a&gt;\r\n		&lt;/li&gt;\r\n		&lt;li&gt;\r\n			&lt;a title=&quot;Nose Pin&quot; href=&quot;nose-pins.html&amp;amp;filter=15,12&quot;&gt;Nose-Pins&lt;/a&gt;\r\n		&lt;/li&gt;\r\n		&lt;li&gt;\r\n			&lt;a title=&quot;Matching Sets&quot; href=&quot;matching-sets.html&amp;amp;filter=15,12&quot;&gt;Pendants&lt;/a&gt;\r\n		&lt;/li&gt;\r\n		&lt;li&gt;\r\n			&lt;a title=&quot;Watches&quot; href=&quot;watches.html&amp;amp;filter=15,12&quot;&gt;Watches&lt;/a&gt;\r\n		&lt;/li&gt;\r\n	&lt;/ul&gt;\r\n&lt;/div&gt;\";}}s:7:\"product\";a:2:{s:2:\"id\";s:0:\"\";s:4:\"name\";s:0:\"\";}s:5:\"image\";a:2:{s:4:\"link\";s:12:\"no_image.png\";s:10:\"show_title\";s:1:\"1\";}s:11:\"subcategory\";a:9:{s:13:\"limit_level_1\";s:1:\"4\";s:13:\"limit_level_2\";s:1:\"4\";s:13:\"limit_level_3\";s:1:\"4\";s:10:\"show_title\";s:1:\"1\";s:10:\"show_image\";s:1:\"1\";s:7:\"columns\";s:1:\"1\";s:7:\"submenu\";s:1:\"1\";s:15:\"submenu_columns\";s:1:\"1\";s:8:\"category\";s:0:\"\";}s:11:\"productlist\";a:4:{s:5:\"limit\";s:0:\"\";s:4:\"type\";s:3:\"new\";s:10:\"show_title\";s:1:\"1\";s:3:\"col\";s:1:\"1\";}s:10:\"categories\";a:4:{s:10:\"categories\";a:0:{}s:7:\"columns\";s:1:\"1\";s:7:\"submenu\";s:1:\"1\";s:15:\"submenu_columns\";s:1:\"1\";}}','','',''),
	(102,0,15,'no_image.png','a:1:{i:1;s:4:\"Jobs\";}',0,119,'a:2:{s:3:\"url\";s:24:\"https://sezplus.com/jobs\";s:8:\"category\";s:0:\"\";}','a:1:{i:1;s:0:\"\";}',1,0,0,'100%',0,4,0,'a:6:{s:4:\"html\";a:1:{s:4:\"text\";a:1:{i:1;s:29:\"&lt;p&gt;&lt;br&gt;&lt;/p&gt;\";}}s:7:\"product\";a:2:{s:2:\"id\";s:0:\"\";s:4:\"name\";s:0:\"\";}s:5:\"image\";a:2:{s:4:\"link\";s:12:\"no_image.png\";s:10:\"show_title\";s:1:\"1\";}s:11:\"subcategory\";a:9:{s:13:\"limit_level_1\";s:0:\"\";s:13:\"limit_level_2\";s:0:\"\";s:13:\"limit_level_3\";s:0:\"\";s:10:\"show_title\";s:1:\"1\";s:10:\"show_image\";s:1:\"1\";s:7:\"columns\";s:1:\"1\";s:7:\"submenu\";s:1:\"1\";s:15:\"submenu_columns\";s:1:\"1\";s:8:\"category\";s:0:\"\";}s:11:\"productlist\";a:4:{s:5:\"limit\";s:0:\"\";s:4:\"type\";s:3:\"new\";s:10:\"show_title\";s:1:\"1\";s:3:\"col\";s:1:\"1\";}s:10:\"categories\";a:4:{s:10:\"categories\";a:0:{}s:7:\"columns\";s:1:\"1\";s:7:\"submenu\";s:1:\"1\";s:15:\"submenu_columns\";s:1:\"1\";}}','','',''),
	(100,0,10,'no_image.png','a:1:{i:1;s:11:\"Wholeseller\";}',0,119,'a:2:{s:3:\"url\";s:0:\"\";s:8:\"category\";s:0:\"\";}','a:1:{i:1;s:0:\"\";}',0,0,0,'100%',0,4,0,'a:6:{s:4:\"html\";a:1:{s:4:\"text\";a:1:{i:1;s:29:\"&lt;p&gt;&lt;br&gt;&lt;/p&gt;\";}}s:7:\"product\";a:2:{s:2:\"id\";s:0:\"\";s:4:\"name\";s:0:\"\";}s:5:\"image\";a:2:{s:4:\"link\";s:12:\"no_image.png\";s:10:\"show_title\";s:1:\"1\";}s:11:\"subcategory\";a:9:{s:13:\"limit_level_1\";s:0:\"\";s:13:\"limit_level_2\";s:0:\"\";s:13:\"limit_level_3\";s:0:\"\";s:10:\"show_title\";s:1:\"1\";s:10:\"show_image\";s:1:\"1\";s:7:\"columns\";s:1:\"1\";s:7:\"submenu\";s:1:\"1\";s:15:\"submenu_columns\";s:1:\"1\";s:8:\"category\";s:0:\"\";}s:11:\"productlist\";a:4:{s:5:\"limit\";s:0:\"\";s:4:\"type\";s:3:\"new\";s:10:\"show_title\";s:1:\"1\";s:3:\"col\";s:1:\"1\";}s:10:\"categories\";a:4:{s:10:\"categories\";a:0:{}s:7:\"columns\";s:1:\"1\";s:7:\"submenu\";s:1:\"1\";s:15:\"submenu_columns\";s:1:\"1\";}}','New','','item-style1 content-full'),
	(300,0,0,'no_image.png','a:1:{i:1;s:9:\"Jewellery\";}',0,119,'a:2:{s:3:\"url\";s:0:\"\";s:8:\"category\";s:0:\"\";}','a:1:{i:1;s:0:\"\";}',0,0,0,'100%',0,4,0,'a:6:{s:4:\"html\";a:1:{s:4:\"text\";a:1:{i:1;s:0:\"\";}}s:7:\"product\";a:2:{s:2:\"id\";s:0:\"\";s:4:\"name\";s:0:\"\";}s:5:\"image\";a:2:{s:4:\"link\";s:12:\"no_image.png\";s:10:\"show_title\";s:1:\"1\";}s:11:\"subcategory\";a:9:{s:13:\"limit_level_1\";s:1:\"4\";s:13:\"limit_level_2\";s:1:\"4\";s:13:\"limit_level_3\";s:1:\"4\";s:10:\"show_title\";s:1:\"1\";s:10:\"show_image\";s:1:\"1\";s:7:\"columns\";s:1:\"1\";s:7:\"submenu\";s:1:\"1\";s:15:\"submenu_columns\";s:1:\"1\";s:8:\"category\";s:0:\"\";}s:11:\"productlist\";a:4:{s:5:\"limit\";s:0:\"\";s:4:\"type\";s:3:\"new\";s:10:\"show_title\";s:1:\"1\";s:3:\"col\";s:1:\"1\";}s:10:\"categories\";a:4:{s:10:\"categories\";a:3:{i:0;a:2:{s:4:\"name\";s:38:\"Manufacturer  >  Diamond Jewellery\";s:2:\"id\";i:62;}i:1;a:2:{s:4:\"name\";s:34:\"Retailer  >  Diamond Jewellery\";s:2:\"id\";i:67;}i:2;a:2:{s:4:\"name\";s:35:\"Retailer  >  Platinum Jewellery\";s:2:\"id\";i:68;}}s:7:\"columns\";s:1:\"3\";s:7:\"submenu\";s:1:\"1\";s:15:\"submenu_columns\";s:1:\"1\";}}','','',''),
	(299,0,5,'no_image.png','a:1:{i:1;s:12:\"Manufacturer\";}',1,119,'a:2:{s:3:\"url\";s:0:\"\";s:8:\"category\";s:2:\"60\";}','a:1:{i:1;s:0:\"\";}',0,0,0,'100%',0,4,0,'a:6:{s:4:\"html\";a:1:{s:4:\"text\";a:1:{i:1;s:0:\"\";}}s:7:\"product\";a:2:{s:2:\"id\";s:0:\"\";s:4:\"name\";s:0:\"\";}s:5:\"image\";a:2:{s:4:\"link\";s:12:\"no_image.png\";s:10:\"show_title\";s:1:\"0\";}s:11:\"subcategory\";a:8:{s:13:\"limit_level_1\";s:1:\"4\";s:13:\"limit_level_2\";s:1:\"4\";s:13:\"limit_level_3\";s:1:\"4\";s:10:\"show_title\";s:1:\"1\";s:10:\"show_image\";s:1:\"1\";s:7:\"columns\";s:1:\"1\";s:7:\"submenu\";s:1:\"1\";s:15:\"submenu_columns\";s:1:\"1\";}s:11:\"productlist\";a:4:{s:5:\"limit\";s:0:\"\";s:4:\"type\";s:3:\"new\";s:10:\"show_title\";s:1:\"1\";s:3:\"col\";s:1:\"1\";}s:10:\"categories\";a:4:{s:10:\"categories\";a:0:{}s:7:\"columns\";s:1:\"1\";s:7:\"submenu\";s:1:\"1\";s:15:\"submenu_columns\";s:1:\"1\";}}','','',NULL),
	(322,0,8,'catalog/demo/menu/icon/icon-7.png','a:1:{i:1;s:21:\"Books &amp; Catalgoue\";}',0,124,'a:2:{s:3:\"url\";s:20:\"books-catalogue.html\";s:8:\"category\";s:0:\"\";}','a:1:{i:1;s:0:\"\";}',0,0,0,'495px',0,4,0,'a:6:{s:4:\"html\";a:1:{s:4:\"text\";a:1:{i:1;s:29:\"&lt;p&gt;&lt;br&gt;&lt;/p&gt;\";}}s:7:\"product\";a:2:{s:2:\"id\";s:0:\"\";s:4:\"name\";s:0:\"\";}s:5:\"image\";a:2:{s:4:\"link\";s:12:\"no_image.png\";s:10:\"show_title\";s:1:\"1\";}s:11:\"subcategory\";a:9:{s:13:\"limit_level_1\";s:1:\"4\";s:13:\"limit_level_2\";s:1:\"4\";s:13:\"limit_level_3\";s:0:\"\";s:10:\"show_title\";s:1:\"1\";s:10:\"show_image\";s:1:\"1\";s:7:\"columns\";s:1:\"1\";s:7:\"submenu\";s:1:\"1\";s:15:\"submenu_columns\";s:1:\"1\";s:8:\"category\";s:0:\"\";}s:11:\"productlist\";a:4:{s:5:\"limit\";s:0:\"\";s:4:\"type\";s:3:\"new\";s:10:\"show_title\";s:1:\"1\";s:3:\"col\";s:1:\"1\";}s:10:\"categories\";a:4:{s:10:\"categories\";a:0:{}s:7:\"columns\";s:1:\"1\";s:7:\"submenu\";s:1:\"1\";s:15:\"submenu_columns\";s:1:\"1\";}}','','',' vertical-style3'),
	(323,322,9,'no_image.png','a:1:{i:1;s:27:\"Books&amp;Catalogue Sub_Cat\";}',0,124,'a:2:{s:3:\"url\";s:0:\"\";s:8:\"category\";s:0:\"\";}','a:1:{i:1;s:0:\"\";}',0,0,0,'50%',0,7,0,'a:6:{s:4:\"html\";a:1:{s:4:\"text\";a:1:{i:1;s:534:\"&lt;ul&gt;\r\n	&lt;li class=&quot;&quot;&gt;\r\n		&lt;a href=&quot;index.php?route=product/category&amp;amp;path=148&quot; title=&quot;Books&quot;&gt;Books&lt;/a&gt;\r\n	&lt;/li&gt;\r\n	&lt;li class=&quot;&quot;&gt;\r\n		&lt;a href=&quot;index.php?route=product/category&amp;amp;path=149&quot; title=&quot;Catalogue&quot;&gt;Catalogue&lt;/a&gt;\r\n	&lt;/li&gt;\r\n	&lt;li class=&quot;&quot;&gt;\r\n		&lt;a href=&quot;index.php?route=product/category&amp;amp;path=150&quot; title=&quot;Magazines&quot;&gt;Magazines&lt;/a&gt;\r\n	&lt;/li&gt;\r\n&lt;/ul&gt;\";}}s:7:\"product\";a:2:{s:2:\"id\";s:0:\"\";s:4:\"name\";s:0:\"\";}s:5:\"image\";a:2:{s:4:\"link\";s:12:\"no_image.png\";s:10:\"show_title\";s:1:\"1\";}s:11:\"subcategory\";a:9:{s:13:\"limit_level_1\";s:1:\"4\";s:13:\"limit_level_2\";s:1:\"4\";s:13:\"limit_level_3\";s:1:\"4\";s:10:\"show_title\";s:1:\"1\";s:10:\"show_image\";s:1:\"1\";s:7:\"columns\";s:1:\"1\";s:7:\"submenu\";s:1:\"1\";s:15:\"submenu_columns\";s:1:\"1\";s:8:\"category\";s:0:\"\";}s:11:\"productlist\";a:4:{s:5:\"limit\";s:0:\"\";s:4:\"type\";s:3:\"new\";s:10:\"show_title\";s:1:\"1\";s:3:\"col\";s:1:\"1\";}s:10:\"categories\";a:4:{s:10:\"categories\";a:0:{}s:7:\"columns\";s:1:\"1\";s:7:\"submenu\";s:1:\"1\";s:15:\"submenu_columns\";s:1:\"1\";}}','','','item-1'),
	(325,0,11,'catalog/demo/menu/icon/icon-5.png','a:1:{i:1;s:4:\"Gold\";}',0,124,'a:2:{s:3:\"url\";s:13:\"raw-gold.html\";s:8:\"category\";s:0:\"\";}','a:1:{i:1;s:0:\"\";}',0,0,0,'100%',0,4,0,'a:6:{s:4:\"html\";a:1:{s:4:\"text\";a:1:{i:1;s:29:\"&lt;p&gt;&lt;br&gt;&lt;/p&gt;\";}}s:7:\"product\";a:2:{s:2:\"id\";s:0:\"\";s:4:\"name\";s:0:\"\";}s:5:\"image\";a:2:{s:4:\"link\";s:12:\"no_image.png\";s:10:\"show_title\";s:1:\"1\";}s:11:\"subcategory\";a:9:{s:13:\"limit_level_1\";s:1:\"4\";s:13:\"limit_level_2\";s:1:\"4\";s:13:\"limit_level_3\";s:0:\"\";s:10:\"show_title\";s:1:\"1\";s:10:\"show_image\";s:1:\"1\";s:7:\"columns\";s:1:\"1\";s:7:\"submenu\";s:1:\"1\";s:15:\"submenu_columns\";s:1:\"1\";s:8:\"category\";s:0:\"\";}s:11:\"productlist\";a:4:{s:5:\"limit\";s:0:\"\";s:4:\"type\";s:3:\"new\";s:10:\"show_title\";s:1:\"1\";s:3:\"col\";s:1:\"1\";}s:10:\"categories\";a:4:{s:10:\"categories\";a:0:{}s:7:\"columns\";s:1:\"1\";s:7:\"submenu\";s:1:\"1\";s:15:\"submenu_columns\";s:1:\"1\";}}','','',''),
	(326,0,12,'catalog/demo/menu/icon/icon-8.png','a:1:{i:1;s:20:\"Jewellery Institutes\";}',0,124,'a:2:{s:3:\"url\";s:25:\"jewellery-institutes.html\";s:8:\"category\";s:0:\"\";}','a:1:{i:1;s:0:\"\";}',0,0,0,'100%',0,4,0,'a:6:{s:4:\"html\";a:1:{s:4:\"text\";a:1:{i:1;s:29:\"&lt;p&gt;&lt;br&gt;&lt;/p&gt;\";}}s:7:\"product\";a:2:{s:2:\"id\";s:0:\"\";s:4:\"name\";s:0:\"\";}s:5:\"image\";a:2:{s:4:\"link\";s:12:\"no_image.png\";s:10:\"show_title\";s:1:\"1\";}s:11:\"subcategory\";a:9:{s:13:\"limit_level_1\";s:1:\"4\";s:13:\"limit_level_2\";s:1:\"4\";s:13:\"limit_level_3\";s:0:\"\";s:10:\"show_title\";s:1:\"1\";s:10:\"show_image\";s:1:\"1\";s:7:\"columns\";s:1:\"1\";s:7:\"submenu\";s:1:\"1\";s:15:\"submenu_columns\";s:1:\"1\";s:8:\"category\";s:0:\"\";}s:11:\"productlist\";a:4:{s:5:\"limit\";s:0:\"\";s:4:\"type\";s:3:\"new\";s:10:\"show_title\";s:1:\"1\";s:3:\"col\";s:1:\"1\";}s:10:\"categories\";a:4:{s:10:\"categories\";a:0:{}s:7:\"columns\";s:1:\"1\";s:7:\"submenu\";s:1:\"1\";s:15:\"submenu_columns\";s:1:\"1\";}}','','',''),
	(324,322,10,'no_image.png','a:1:{i:1;s:10:\"Image_Mega\";}',1,124,'a:2:{s:3:\"url\";s:0:\"\";s:8:\"category\";s:0:\"\";}','a:1:{i:1;s:0:\"\";}',0,0,0,'900px',0,5,0,'a:6:{s:4:\"html\";a:1:{s:4:\"text\";a:1:{i:1;s:213:\"&lt;div class=&quot;row img-banner&quot;&gt;&lt;a href=&quot;books-catalogue.html&quot;&gt;&lt;img src=&quot;image/catalog/demo/menu/img-static-megamenu-h.jpg&quot; alt=&quot;banner&quot;&gt;&lt;/a&gt;&lt;/div&gt;\";}}s:7:\"product\";a:2:{s:2:\"id\";s:0:\"\";s:4:\"name\";s:0:\"\";}s:5:\"image\";a:2:{s:4:\"link\";s:12:\"no_image.png\";s:10:\"show_title\";s:1:\"1\";}s:11:\"subcategory\";a:9:{s:13:\"limit_level_1\";s:1:\"4\";s:13:\"limit_level_2\";s:1:\"4\";s:13:\"limit_level_3\";s:0:\"\";s:10:\"show_title\";s:1:\"1\";s:10:\"show_image\";s:1:\"1\";s:7:\"columns\";s:1:\"1\";s:7:\"submenu\";s:1:\"1\";s:15:\"submenu_columns\";s:1:\"1\";s:8:\"category\";s:0:\"\";}s:11:\"productlist\";a:4:{s:5:\"limit\";s:0:\"\";s:4:\"type\";s:3:\"new\";s:10:\"show_title\";s:1:\"1\";s:3:\"col\";s:1:\"1\";}s:10:\"categories\";a:4:{s:10:\"categories\";a:0:{}s:7:\"columns\";s:1:\"1\";s:7:\"submenu\";s:1:\"1\";s:15:\"submenu_columns\";s:1:\"1\";}}','','',''),
	(327,0,13,'catalog/demo/menu/icon/icon-2.png','a:1:{i:1;s:14:\"CAM Processing\";}',0,124,'a:2:{s:3:\"url\";s:19:\"cam-processing.html\";s:8:\"category\";s:0:\"\";}','a:1:{i:1;s:0:\"\";}',0,0,0,'100%',0,4,0,'a:6:{s:4:\"html\";a:1:{s:4:\"text\";a:1:{i:1;s:29:\"&lt;p&gt;&lt;br&gt;&lt;/p&gt;\";}}s:7:\"product\";a:2:{s:2:\"id\";s:0:\"\";s:4:\"name\";s:0:\"\";}s:5:\"image\";a:2:{s:4:\"link\";s:12:\"no_image.png\";s:10:\"show_title\";s:1:\"1\";}s:11:\"subcategory\";a:9:{s:13:\"limit_level_1\";s:1:\"4\";s:13:\"limit_level_2\";s:1:\"4\";s:13:\"limit_level_3\";s:0:\"\";s:10:\"show_title\";s:1:\"1\";s:10:\"show_image\";s:1:\"1\";s:7:\"columns\";s:1:\"1\";s:7:\"submenu\";s:1:\"1\";s:15:\"submenu_columns\";s:1:\"1\";s:8:\"category\";s:0:\"\";}s:11:\"productlist\";a:4:{s:5:\"limit\";s:0:\"\";s:4:\"type\";s:3:\"new\";s:10:\"show_title\";s:1:\"1\";s:3:\"col\";s:1:\"1\";}s:10:\"categories\";a:4:{s:10:\"categories\";a:0:{}s:7:\"columns\";s:1:\"1\";s:7:\"submenu\";s:1:\"1\";s:15:\"submenu_columns\";s:1:\"1\";}}','','',''),
	(328,0,14,'catalog/demo/menu/icon/icon-4.png','a:1:{i:1;s:9:\"Freelance\";}',0,124,'a:2:{s:3:\"url\";s:23:\"freelance-services.html\";s:8:\"category\";s:0:\"\";}','a:1:{i:1;s:0:\"\";}',0,0,0,'100%',0,4,0,'a:6:{s:4:\"html\";a:1:{s:4:\"text\";a:1:{i:1;s:29:\"&lt;p&gt;&lt;br&gt;&lt;/p&gt;\";}}s:7:\"product\";a:2:{s:2:\"id\";s:0:\"\";s:4:\"name\";s:0:\"\";}s:5:\"image\";a:2:{s:4:\"link\";s:12:\"no_image.png\";s:10:\"show_title\";s:1:\"1\";}s:11:\"subcategory\";a:9:{s:13:\"limit_level_1\";s:1:\"4\";s:13:\"limit_level_2\";s:1:\"4\";s:13:\"limit_level_3\";s:0:\"\";s:10:\"show_title\";s:1:\"1\";s:10:\"show_image\";s:1:\"1\";s:7:\"columns\";s:1:\"1\";s:7:\"submenu\";s:1:\"1\";s:15:\"submenu_columns\";s:1:\"1\";s:8:\"category\";s:0:\"\";}s:11:\"productlist\";a:4:{s:5:\"limit\";s:0:\"\";s:4:\"type\";s:3:\"new\";s:10:\"show_title\";s:1:\"1\";s:3:\"col\";s:1:\"1\";}s:10:\"categories\";a:4:{s:10:\"categories\";a:0:{}s:7:\"columns\";s:1:\"1\";s:7:\"submenu\";s:1:\"1\";s:15:\"submenu_columns\";s:1:\"1\";}}','','',''),
	(329,0,15,'catalog/demo/menu/icon/icon-6.png','a:1:{i:1;s:13:\"Used Machines\";}',0,124,'a:2:{s:3:\"url\";s:18:\"used-machines.html\";s:8:\"category\";s:0:\"\";}','a:1:{i:1;s:0:\"\";}',0,0,0,'100%',0,4,0,'a:6:{s:4:\"html\";a:1:{s:4:\"text\";a:1:{i:1;s:29:\"&lt;p&gt;&lt;br&gt;&lt;/p&gt;\";}}s:7:\"product\";a:2:{s:2:\"id\";s:0:\"\";s:4:\"name\";s:0:\"\";}s:5:\"image\";a:2:{s:4:\"link\";s:12:\"no_image.png\";s:10:\"show_title\";s:1:\"1\";}s:11:\"subcategory\";a:9:{s:13:\"limit_level_1\";s:1:\"4\";s:13:\"limit_level_2\";s:1:\"4\";s:13:\"limit_level_3\";s:0:\"\";s:10:\"show_title\";s:1:\"1\";s:10:\"show_image\";s:1:\"1\";s:7:\"columns\";s:1:\"1\";s:7:\"submenu\";s:1:\"1\";s:15:\"submenu_columns\";s:1:\"1\";s:8:\"category\";s:0:\"\";}s:11:\"productlist\";a:4:{s:5:\"limit\";s:0:\"\";s:4:\"type\";s:3:\"new\";s:10:\"show_title\";s:1:\"1\";s:3:\"col\";s:1:\"1\";}s:10:\"categories\";a:4:{s:10:\"categories\";a:0:{}s:7:\"columns\";s:1:\"1\";s:7:\"submenu\";s:1:\"1\";s:15:\"submenu_columns\";s:1:\"1\";}}','','',''),
	(292,174,2,'no_image.png','a:1:{i:1;s:10:\"Image_Mega\";}',1,124,'a:2:{s:3:\"url\";s:0:\"\";s:8:\"category\";s:0:\"\";}','a:1:{i:1;s:0:\"\";}',0,0,0,'900px',0,5,0,'a:6:{s:4:\"html\";a:1:{s:4:\"text\";a:1:{i:1;s:204:\"&lt;div class=&quot;row img-banner&quot;&gt;&lt;a href=&quot;models.html&quot;&gt;&lt;img src=&quot;image/catalog/demo/menu/img-static-megamenu-h.jpg&quot; alt=&quot;banner&quot;&gt;&lt;/a&gt;&lt;/div&gt;\";}}s:7:\"product\";a:2:{s:2:\"id\";s:0:\"\";s:4:\"name\";s:0:\"\";}s:5:\"image\";a:2:{s:4:\"link\";s:12:\"no_image.png\";s:10:\"show_title\";s:1:\"1\";}s:11:\"subcategory\";a:9:{s:13:\"limit_level_1\";s:1:\"4\";s:13:\"limit_level_2\";s:1:\"4\";s:13:\"limit_level_3\";s:0:\"\";s:10:\"show_title\";s:1:\"1\";s:10:\"show_image\";s:1:\"1\";s:7:\"columns\";s:1:\"1\";s:7:\"submenu\";s:1:\"1\";s:15:\"submenu_columns\";s:1:\"1\";s:8:\"category\";s:0:\"\";}s:11:\"productlist\";a:4:{s:5:\"limit\";s:0:\"\";s:4:\"type\";s:3:\"new\";s:10:\"show_title\";s:1:\"1\";s:3:\"col\";s:1:\"1\";}s:10:\"categories\";a:4:{s:10:\"categories\";a:0:{}s:7:\"columns\";s:1:\"1\";s:7:\"submenu\";s:1:\"1\";s:15:\"submenu_columns\";s:1:\"1\";}}','','',''),
	(318,0,3,'catalog/cart.png','a:1:{i:1;s:6:\"Moulds\";}',0,124,'a:2:{s:3:\"url\";s:11:\"moulds.html\";s:8:\"category\";s:0:\"\";}','a:1:{i:1;s:0:\"\";}',0,0,0,'495px',0,4,0,'a:6:{s:4:\"html\";a:1:{s:4:\"text\";a:1:{i:1;s:29:\"&lt;p&gt;&lt;br&gt;&lt;/p&gt;\";}}s:7:\"product\";a:2:{s:2:\"id\";s:0:\"\";s:4:\"name\";s:0:\"\";}s:5:\"image\";a:2:{s:4:\"link\";s:12:\"no_image.png\";s:10:\"show_title\";s:1:\"1\";}s:11:\"subcategory\";a:9:{s:13:\"limit_level_1\";s:1:\"4\";s:13:\"limit_level_2\";s:1:\"4\";s:13:\"limit_level_3\";s:0:\"\";s:10:\"show_title\";s:1:\"1\";s:10:\"show_image\";s:1:\"1\";s:7:\"columns\";s:1:\"1\";s:7:\"submenu\";s:1:\"1\";s:15:\"submenu_columns\";s:1:\"1\";s:8:\"category\";s:0:\"\";}s:11:\"productlist\";a:4:{s:5:\"limit\";s:0:\"\";s:4:\"type\";s:3:\"new\";s:10:\"show_title\";s:1:\"1\";s:3:\"col\";s:1:\"1\";}s:10:\"categories\";a:4:{s:10:\"categories\";a:0:{}s:7:\"columns\";s:1:\"1\";s:7:\"submenu\";s:1:\"1\";s:15:\"submenu_columns\";s:1:\"1\";}}','','',' vertical-style3'),
	(312,100,11,'no_image.png','a:1:{i:1;s:14:\"Gold Jewellery\";}',0,119,'a:2:{s:3:\"url\";s:0:\"\";s:8:\"category\";s:0:\"\";}','a:1:{i:1;s:0:\"\";}',0,0,0,'100%',0,3,0,'a:6:{s:4:\"html\";a:1:{s:4:\"text\";a:1:{i:1;s:2152:\"&lt;div class=&quot;toplink-menu-heading&quot;&gt;Gold Jewellery&lt;/div&gt;\r\n&lt;div class=&quot;toplink-menu&quot;&gt;\r\n	&lt;ul class=&quot;links-menu&quot;&gt;\r\n		&lt;li&gt;\r\n			&lt;a title=&quot;Rings&quot; href=&quot;rings.html&amp;amp;filter=17,9&quot;&gt;Rings&lt;/a&gt;\r\n		&lt;/li&gt;\r\n		&lt;li&gt;\r\n			&lt;a title=&quot;Earrings&quot; href=&quot;earrings.html&amp;amp;filter=17,9&quot;&gt;Earrings&lt;/a&gt;\r\n		&lt;/li&gt;\r\n		&lt;li&gt;\r\n			&lt;a title=&quot;Pendants&quot; href=&quot;pendants.html&amp;amp;filter=17,9&quot;&gt;Pendants&lt;/a&gt;\r\n		&lt;/li&gt;\r\n		&lt;li&gt;\r\n			&lt;a title=&quot;Necklaces&quot; href=&quot;necklaces.html&amp;amp;filter=17,9&quot;&gt;Necklaces&lt;/a&gt;\r\n		&lt;/li&gt;\r\n		&lt;li&gt;\r\n			&lt;a title=&quot;Bangles&quot; href=&quot;bangles.html&amp;amp;filter=17,9&quot;&gt;Bangles&lt;/a&gt;\r\n		&lt;/li&gt;\r\n		&lt;li&gt;\r\n			&lt;a title=&quot;Bracelets&quot; href=&quot;bracelets.html&amp;amp;filter=17,9&quot;&gt;Bracelets&lt;/a&gt;\r\n		&lt;/li&gt;\r\n		&lt;li&gt;\r\n			&lt;a title=&quot;Tanmaniyas&quot; href=&quot;tanmaniyas.html&amp;amp;filter=17,9&quot;&gt;Tanmaniyas&lt;/a&gt;\r\n		&lt;/li&gt;\r\n		&lt;li&gt;\r\n			&lt;a title=&quot;Chains&quot; href=&quot;chains.html&amp;amp;filter=17,9&quot;&gt;Chains&lt;/a&gt;\r\n		&lt;/li&gt;\r\n		&lt;li&gt;\r\n			&lt;a title=&quot;Anklets&quot; href=&quot;anklets.html&amp;amp;filter=17,9&quot;&gt;Anklets&lt;/a&gt;\r\n		&lt;/li&gt;\r\n		&lt;li&gt;\r\n			&lt;a title=&quot;Cuff-Links&quot; href=&quot;cuff-links.html&amp;amp;filter=17,9&quot;&gt;Cuff-Links&lt;/a&gt;\r\n		&lt;/li&gt;\r\n		&lt;li&gt;\r\n			&lt;a title=&quot;Mangalsutra&quot; href=&quot;mangalsutras.html&amp;amp;filter=17,9&quot;&gt;Mangalsutra&lt;/a&gt;\r\n		&lt;/li&gt;\r\n		&lt;li&gt;\r\n			&lt;a title=&quot;Nose Pin&quot; href=&quot;nose-pins.html&amp;amp;filter=17,9&quot;&gt;Nose-Pins&lt;/a&gt;\r\n		&lt;/li&gt;\r\n		&lt;li&gt;\r\n			&lt;a title=&quot;Matching Sets&quot; href=&quot;matching-sets.html&amp;amp;filter=17,9&quot;&gt;Pendants&lt;/a&gt;\r\n		&lt;/li&gt;\r\n		&lt;li&gt;\r\n			&lt;a title=&quot;Watches&quot; href=&quot;watches.html&amp;amp;filter=17,9&quot;&gt;Watches&lt;/a&gt;\r\n		&lt;/li&gt;\r\n	&lt;/ul&gt;\r\n&lt;/div&gt;\";}}s:7:\"product\";a:2:{s:2:\"id\";s:0:\"\";s:4:\"name\";s:0:\"\";}s:5:\"image\";a:2:{s:4:\"link\";s:12:\"no_image.png\";s:10:\"show_title\";s:1:\"1\";}s:11:\"subcategory\";a:9:{s:13:\"limit_level_1\";s:1:\"4\";s:13:\"limit_level_2\";s:1:\"4\";s:13:\"limit_level_3\";s:1:\"4\";s:10:\"show_title\";s:1:\"1\";s:10:\"show_image\";s:1:\"1\";s:7:\"columns\";s:1:\"1\";s:7:\"submenu\";s:1:\"1\";s:15:\"submenu_columns\";s:1:\"1\";s:8:\"category\";s:0:\"\";}s:11:\"productlist\";a:4:{s:5:\"limit\";s:0:\"\";s:4:\"type\";s:3:\"new\";s:10:\"show_title\";s:1:\"1\";s:3:\"col\";s:1:\"1\";}s:10:\"categories\";a:4:{s:10:\"categories\";a:0:{}s:7:\"columns\";s:1:\"1\";s:7:\"submenu\";s:1:\"1\";s:15:\"submenu_columns\";s:1:\"1\";}}','','',''),
	(308,299,6,'no_image.png','a:1:{i:1;s:14:\"Gold Jewellery\";}',0,119,'a:2:{s:3:\"url\";s:0:\"\";s:8:\"category\";s:0:\"\";}','a:1:{i:1;s:0:\"\";}',0,0,0,'100%',0,3,0,'a:6:{s:4:\"html\";a:1:{s:4:\"text\";a:1:{i:1;s:2152:\"&lt;div class=&quot;toplink-menu-heading&quot;&gt;Gold Jewellery&lt;/div&gt;\r\n&lt;div class=&quot;toplink-menu&quot;&gt;\r\n	&lt;ul class=&quot;links-menu&quot;&gt;\r\n		&lt;li&gt;\r\n			&lt;a title=&quot;Rings&quot; href=&quot;rings.html&amp;amp;filter=16,9&quot;&gt;Rings&lt;/a&gt;\r\n		&lt;/li&gt;\r\n		&lt;li&gt;\r\n			&lt;a title=&quot;Earrings&quot; href=&quot;earrings.html&amp;amp;filter=16,9&quot;&gt;Earrings&lt;/a&gt;\r\n		&lt;/li&gt;\r\n		&lt;li&gt;\r\n			&lt;a title=&quot;Pendants&quot; href=&quot;pendants.html&amp;amp;filter=16,9&quot;&gt;Pendants&lt;/a&gt;\r\n		&lt;/li&gt;\r\n		&lt;li&gt;\r\n			&lt;a title=&quot;Necklaces&quot; href=&quot;necklaces.html&amp;amp;filter=16,9&quot;&gt;Necklaces&lt;/a&gt;\r\n		&lt;/li&gt;\r\n		&lt;li&gt;\r\n			&lt;a title=&quot;Bangles&quot; href=&quot;bangles.html&amp;amp;filter=16,9&quot;&gt;Bangles&lt;/a&gt;\r\n		&lt;/li&gt;\r\n		&lt;li&gt;\r\n			&lt;a title=&quot;Bracelets&quot; href=&quot;bracelets.html&amp;amp;filter=16,9&quot;&gt;Bracelets&lt;/a&gt;\r\n		&lt;/li&gt;\r\n		&lt;li&gt;\r\n			&lt;a title=&quot;Tanmaniyas&quot; href=&quot;tanmaniyas.html&amp;amp;filter=16,9&quot;&gt;Tanmaniyas&lt;/a&gt;\r\n		&lt;/li&gt;\r\n		&lt;li&gt;\r\n			&lt;a title=&quot;Chains&quot; href=&quot;chains.html&amp;amp;filter=16,9&quot;&gt;Chains&lt;/a&gt;\r\n		&lt;/li&gt;\r\n		&lt;li&gt;\r\n			&lt;a title=&quot;Anklets&quot; href=&quot;anklets.html&amp;amp;filter=16,9&quot;&gt;Anklets&lt;/a&gt;\r\n		&lt;/li&gt;\r\n		&lt;li&gt;\r\n			&lt;a title=&quot;Cuff-Links&quot; href=&quot;cuff-links.html&amp;amp;filter=16,9&quot;&gt;Cuff-Links&lt;/a&gt;\r\n		&lt;/li&gt;\r\n		&lt;li&gt;\r\n			&lt;a title=&quot;Mangalsutra&quot; href=&quot;mangalsutras.html&amp;amp;filter=16,9&quot;&gt;Mangalsutra&lt;/a&gt;\r\n		&lt;/li&gt;\r\n		&lt;li&gt;\r\n			&lt;a title=&quot;Nose Pin&quot; href=&quot;nose-pins.html&amp;amp;filter=16,9&quot;&gt;Nose-Pins&lt;/a&gt;\r\n		&lt;/li&gt;\r\n		&lt;li&gt;\r\n			&lt;a title=&quot;Matching Sets&quot; href=&quot;matching-sets.html&amp;amp;filter=16,9&quot;&gt;Pendants&lt;/a&gt;\r\n		&lt;/li&gt;\r\n		&lt;li&gt;\r\n			&lt;a title=&quot;Watches&quot; href=&quot;watches.html&amp;amp;filter=16,9&quot;&gt;Watches&lt;/a&gt;\r\n		&lt;/li&gt;\r\n	&lt;/ul&gt;\r\n&lt;/div&gt;\";}}s:7:\"product\";a:2:{s:2:\"id\";s:0:\"\";s:4:\"name\";s:0:\"\";}s:5:\"image\";a:2:{s:4:\"link\";s:12:\"no_image.png\";s:10:\"show_title\";s:1:\"1\";}s:11:\"subcategory\";a:9:{s:13:\"limit_level_1\";s:1:\"4\";s:13:\"limit_level_2\";s:1:\"4\";s:13:\"limit_level_3\";s:1:\"4\";s:10:\"show_title\";s:1:\"1\";s:10:\"show_image\";s:1:\"1\";s:7:\"columns\";s:1:\"1\";s:7:\"submenu\";s:1:\"1\";s:15:\"submenu_columns\";s:1:\"1\";s:8:\"category\";s:0:\"\";}s:11:\"productlist\";a:4:{s:5:\"limit\";s:0:\"\";s:4:\"type\";s:3:\"new\";s:10:\"show_title\";s:1:\"1\";s:3:\"col\";s:1:\"1\";}s:10:\"categories\";a:4:{s:10:\"categories\";a:0:{}s:7:\"columns\";s:1:\"1\";s:7:\"submenu\";s:1:\"1\";s:15:\"submenu_columns\";s:1:\"1\";}}','','',''),
	(309,299,7,'no_image.png','a:1:{i:1;s:17:\"Diamond Jewellery\";}',0,119,'a:2:{s:3:\"url\";s:0:\"\";s:8:\"category\";s:0:\"\";}','a:1:{i:1;s:0:\"\";}',0,0,0,'100%',0,3,0,'a:6:{s:4:\"html\";a:1:{s:4:\"text\";a:1:{i:1;s:2169:\"&lt;div class=&quot;toplink-menu-heading&quot;&gt;Diamond Jewellery&lt;/div&gt;\r\n&lt;div class=&quot;toplink-menu&quot;&gt;\r\n	&lt;ul class=&quot;links-menu&quot;&gt;\r\n		&lt;li&gt;\r\n			&lt;a title=&quot;Rings&quot; href=&quot;rings.html&amp;amp;filter=16,10&quot;&gt;Rings&lt;/a&gt;\r\n		&lt;/li&gt;\r\n		&lt;li&gt;\r\n			&lt;a title=&quot;Earrings&quot; href=&quot;earrings.html&amp;amp;filter=16,10&quot;&gt;Earrings&lt;/a&gt;\r\n		&lt;/li&gt;\r\n		&lt;li&gt;\r\n			&lt;a title=&quot;Pendants&quot; href=&quot;pendants.html&amp;amp;filter=16,10&quot;&gt;Pendants&lt;/a&gt;\r\n		&lt;/li&gt;\r\n		&lt;li&gt;\r\n			&lt;a title=&quot;Necklaces&quot; href=&quot;necklaces.html&amp;amp;filter=16,10&quot;&gt;Necklaces&lt;/a&gt;\r\n		&lt;/li&gt;\r\n		&lt;li&gt;\r\n			&lt;a title=&quot;Bangles&quot; href=&quot;bangles.html&amp;amp;filter=16,10&quot;&gt;Bangles&lt;/a&gt;\r\n		&lt;/li&gt;\r\n		&lt;li&gt;\r\n			&lt;a title=&quot;Bracelets&quot; href=&quot;bracelets.html&amp;amp;filter=16,10&quot;&gt;Bracelets&lt;/a&gt;\r\n		&lt;/li&gt;\r\n		&lt;li&gt;\r\n			&lt;a title=&quot;Tanmaniyas&quot; href=&quot;tanmaniyas.html&amp;amp;filter=16,10&quot;&gt;Tanmaniyas&lt;/a&gt;\r\n		&lt;/li&gt;\r\n		&lt;li&gt;\r\n			&lt;a title=&quot;Chains&quot; href=&quot;chains.html&amp;amp;filter=16,10&quot;&gt;Chains&lt;/a&gt;\r\n		&lt;/li&gt;\r\n		&lt;li&gt;\r\n			&lt;a title=&quot;Anklets&quot; href=&quot;anklets.html&amp;amp;filter=16,10&quot;&gt;Anklets&lt;/a&gt;\r\n		&lt;/li&gt;\r\n		&lt;li&gt;\r\n			&lt;a title=&quot;Cuff-Links&quot; href=&quot;cuff-links.html&amp;amp;filter=16,10&quot;&gt;Cuff-Links&lt;/a&gt;\r\n		&lt;/li&gt;\r\n		&lt;li&gt;\r\n			&lt;a title=&quot;Mangalsutra&quot; href=&quot;mangalsutras.html&amp;amp;filter=16,10&quot;&gt;Mangalsutra&lt;/a&gt;\r\n		&lt;/li&gt;\r\n		&lt;li&gt;\r\n			&lt;a title=&quot;Nose Pin&quot; href=&quot;nose-pins.html&amp;amp;filter=16,10&quot;&gt;Nose-Pins&lt;/a&gt;\r\n		&lt;/li&gt;\r\n		&lt;li&gt;\r\n			&lt;a title=&quot;Matching Sets&quot; href=&quot;matching-sets.html&amp;amp;filter=16,10&quot;&gt;Pendants&lt;/a&gt;\r\n		&lt;/li&gt;\r\n		&lt;li&gt;\r\n			&lt;a title=&quot;Watches&quot; href=&quot;watches.html&amp;amp;filter=16,10&quot;&gt;Watches&lt;/a&gt;\r\n		&lt;/li&gt;\r\n	&lt;/ul&gt;\r\n&lt;/div&gt;\";}}s:7:\"product\";a:2:{s:2:\"id\";s:0:\"\";s:4:\"name\";s:0:\"\";}s:5:\"image\";a:2:{s:4:\"link\";s:12:\"no_image.png\";s:10:\"show_title\";s:1:\"1\";}s:11:\"subcategory\";a:9:{s:13:\"limit_level_1\";s:1:\"4\";s:13:\"limit_level_2\";s:1:\"4\";s:13:\"limit_level_3\";s:1:\"4\";s:10:\"show_title\";s:1:\"1\";s:10:\"show_image\";s:1:\"1\";s:7:\"columns\";s:1:\"1\";s:7:\"submenu\";s:1:\"1\";s:15:\"submenu_columns\";s:1:\"1\";s:8:\"category\";s:0:\"\";}s:11:\"productlist\";a:4:{s:5:\"limit\";s:0:\"\";s:4:\"type\";s:3:\"new\";s:10:\"show_title\";s:1:\"1\";s:3:\"col\";s:1:\"1\";}s:10:\"categories\";a:4:{s:10:\"categories\";a:0:{}s:7:\"columns\";s:1:\"1\";s:7:\"submenu\";s:1:\"1\";s:15:\"submenu_columns\";s:1:\"1\";}}','','',''),
	(310,299,8,'no_image.png','a:1:{i:1;s:18:\"Platinum Jewellery\";}',0,119,'a:2:{s:3:\"url\";s:0:\"\";s:8:\"category\";s:0:\"\";}','a:1:{i:1;s:0:\"\";}',0,0,0,'100%',0,3,0,'a:6:{s:4:\"html\";a:1:{s:4:\"text\";a:1:{i:1;s:2170:\"&lt;div class=&quot;toplink-menu-heading&quot;&gt;Platinum Jewellery&lt;/div&gt;\r\n&lt;div class=&quot;toplink-menu&quot;&gt;\r\n	&lt;ul class=&quot;links-menu&quot;&gt;\r\n		&lt;li&gt;\r\n			&lt;a title=&quot;Rings&quot; href=&quot;rings.html&amp;amp;filter=16,11&quot;&gt;Rings&lt;/a&gt;\r\n		&lt;/li&gt;\r\n		&lt;li&gt;\r\n			&lt;a title=&quot;Earrings&quot; href=&quot;earrings.html&amp;amp;filter=16,11&quot;&gt;Earrings&lt;/a&gt;\r\n		&lt;/li&gt;\r\n		&lt;li&gt;\r\n			&lt;a title=&quot;Pendants&quot; href=&quot;pendants.html&amp;amp;filter=16,11&quot;&gt;Pendants&lt;/a&gt;\r\n		&lt;/li&gt;\r\n		&lt;li&gt;\r\n			&lt;a title=&quot;Necklaces&quot; href=&quot;necklaces.html&amp;amp;filter=16,11&quot;&gt;Necklaces&lt;/a&gt;\r\n		&lt;/li&gt;\r\n		&lt;li&gt;\r\n			&lt;a title=&quot;Bangles&quot; href=&quot;bangles.html&amp;amp;filter=16,11&quot;&gt;Bangles&lt;/a&gt;\r\n		&lt;/li&gt;\r\n		&lt;li&gt;\r\n			&lt;a title=&quot;Bracelets&quot; href=&quot;bracelets.html&amp;amp;filter=16,11&quot;&gt;Bracelets&lt;/a&gt;\r\n		&lt;/li&gt;\r\n		&lt;li&gt;\r\n			&lt;a title=&quot;Tanmaniyas&quot; href=&quot;tanmaniyas.html&amp;amp;filter=16,11&quot;&gt;Tanmaniyas&lt;/a&gt;\r\n		&lt;/li&gt;\r\n		&lt;li&gt;\r\n			&lt;a title=&quot;Chains&quot; href=&quot;chains.html&amp;amp;filter=16,11&quot;&gt;Chains&lt;/a&gt;\r\n		&lt;/li&gt;\r\n		&lt;li&gt;\r\n			&lt;a title=&quot;Anklets&quot; href=&quot;anklets.html&amp;amp;filter=16,11&quot;&gt;Anklets&lt;/a&gt;\r\n		&lt;/li&gt;\r\n		&lt;li&gt;\r\n			&lt;a title=&quot;Cuff-Links&quot; href=&quot;cuff-links.html&amp;amp;filter=16,11&quot;&gt;Cuff-Links&lt;/a&gt;\r\n		&lt;/li&gt;\r\n		&lt;li&gt;\r\n			&lt;a title=&quot;Mangalsutra&quot; href=&quot;mangalsutras.html&amp;amp;filter=16,11&quot;&gt;Mangalsutra&lt;/a&gt;\r\n		&lt;/li&gt;\r\n		&lt;li&gt;\r\n			&lt;a title=&quot;Nose Pin&quot; href=&quot;nose-pins.html&amp;amp;filter=16,11&quot;&gt;Nose-Pins&lt;/a&gt;\r\n		&lt;/li&gt;\r\n		&lt;li&gt;\r\n			&lt;a title=&quot;Matching Sets&quot; href=&quot;matching-sets.html&amp;amp;filter=16,11&quot;&gt;Pendants&lt;/a&gt;\r\n		&lt;/li&gt;\r\n		&lt;li&gt;\r\n			&lt;a title=&quot;Watches&quot; href=&quot;watches.html&amp;amp;filter=16,11&quot;&gt;Watches&lt;/a&gt;\r\n		&lt;/li&gt;\r\n	&lt;/ul&gt;\r\n&lt;/div&gt;\";}}s:7:\"product\";a:2:{s:2:\"id\";s:0:\"\";s:4:\"name\";s:0:\"\";}s:5:\"image\";a:2:{s:4:\"link\";s:12:\"no_image.png\";s:10:\"show_title\";s:1:\"1\";}s:11:\"subcategory\";a:9:{s:13:\"limit_level_1\";s:1:\"4\";s:13:\"limit_level_2\";s:1:\"4\";s:13:\"limit_level_3\";s:1:\"4\";s:10:\"show_title\";s:1:\"1\";s:10:\"show_image\";s:1:\"1\";s:7:\"columns\";s:1:\"1\";s:7:\"submenu\";s:1:\"1\";s:15:\"submenu_columns\";s:1:\"1\";s:8:\"category\";s:0:\"\";}s:11:\"productlist\";a:4:{s:5:\"limit\";s:0:\"\";s:4:\"type\";s:3:\"new\";s:10:\"show_title\";s:1:\"1\";s:3:\"col\";s:1:\"1\";}s:10:\"categories\";a:4:{s:10:\"categories\";a:0:{}s:7:\"columns\";s:1:\"1\";s:7:\"submenu\";s:1:\"1\";s:15:\"submenu_columns\";s:1:\"1\";}}','','',''),
	(311,299,9,'no_image.png','a:1:{i:1;s:19:\"Imitation Jewellery\";}',0,119,'a:2:{s:3:\"url\";s:0:\"\";s:8:\"category\";s:0:\"\";}','a:1:{i:1;s:0:\"\";}',0,0,0,'100%',0,3,0,'a:6:{s:4:\"html\";a:1:{s:4:\"text\";a:1:{i:1;s:2199:\"&lt;div class=&quot;toplink-menu-heading&quot;&gt;Imitation Jewellery&lt;/div&gt;\r\n&lt;div class=&quot; toplink-menu&quot; =&quot;&quot;=&quot;&quot;&gt;\r\n	&lt;ul class=&quot;links-menu&quot;&gt;\r\n		&lt;li&gt;\r\n			&lt;a title=&quot;Rings&quot; href=&quot;rings.html&amp;amp;filter=16,12&quot;&gt;Rings&lt;/a&gt;\r\n		&lt;/li&gt;\r\n		&lt;li&gt;\r\n			&lt;a title=&quot;Earrings&quot; href=&quot;earrings.html&amp;amp;filter=16,12&quot;&gt;Earrings&lt;/a&gt;\r\n		&lt;/li&gt;\r\n		&lt;li&gt;\r\n			&lt;a title=&quot;Pendants&quot; href=&quot;pendants.html&amp;amp;filter=16,12&quot;&gt;Pendants&lt;/a&gt;\r\n		&lt;/li&gt;\r\n		&lt;li&gt;\r\n			&lt;a title=&quot;Necklaces&quot; href=&quot;necklaces.html&amp;amp;filter=16,12&quot;&gt;Necklaces&lt;/a&gt;\r\n		&lt;/li&gt;\r\n		&lt;li&gt;\r\n			&lt;a title=&quot;Bangles&quot; href=&quot;bangles.html&amp;amp;filter=16,12&quot;&gt;Bangles&lt;/a&gt;\r\n		&lt;/li&gt;\r\n		&lt;li&gt;\r\n			&lt;a title=&quot;Bracelets&quot; href=&quot;bracelets.html&amp;amp;filter=16,12&quot;&gt;Bracelets&lt;/a&gt;\r\n		&lt;/li&gt;\r\n		&lt;li&gt;\r\n			&lt;a title=&quot;Tanmaniyas&quot; href=&quot;tanmaniyas.html&amp;amp;filter=16,12&quot;&gt;Tanmaniyas&lt;/a&gt;\r\n		&lt;/li&gt;\r\n		&lt;li&gt;\r\n			&lt;a title=&quot;Chains&quot; href=&quot;chains.html&amp;amp;filter=16,12&quot;&gt;Chains&lt;/a&gt;\r\n		&lt;/li&gt;\r\n		&lt;li&gt;\r\n			&lt;a title=&quot;Anklets&quot; href=&quot;anklets.html&amp;amp;filter=16,12&quot;&gt;Anklets&lt;/a&gt;\r\n		&lt;/li&gt;\r\n		&lt;li&gt;\r\n			&lt;a title=&quot;Cuff-Links&quot; href=&quot;cuff-links.html&amp;amp;filter=16,12&quot;&gt;Cuff-Links&lt;/a&gt;\r\n		&lt;/li&gt;\r\n		&lt;li&gt;\r\n			&lt;a title=&quot;Mangalsutra&quot; href=&quot;mangalsutras.html&amp;amp;filter=16,12&quot;&gt;Mangalsutra&lt;/a&gt;\r\n		&lt;/li&gt;\r\n		&lt;li&gt;\r\n			&lt;a title=&quot;Nose Pin&quot; href=&quot;nose-pins.html&amp;amp;filter=16,12&quot;&gt;Nose-Pins&lt;/a&gt;\r\n		&lt;/li&gt;\r\n		&lt;li&gt;\r\n			&lt;a title=&quot;Matching Sets&quot; href=&quot;matching-sets.html&amp;amp;filter=16,12&quot;&gt;Pendants&lt;/a&gt;\r\n		&lt;/li&gt;\r\n		&lt;li&gt;\r\n			&lt;a title=&quot;Watches&quot; href=&quot;watches.html&amp;amp;filter=16,12&quot;&gt;Watches&lt;/a&gt;\r\n		&lt;/li&gt;\r\n	&lt;/ul&gt;\r\n&lt;/div&gt;\";}}s:7:\"product\";a:2:{s:2:\"id\";s:0:\"\";s:4:\"name\";s:0:\"\";}s:5:\"image\";a:2:{s:4:\"link\";s:12:\"no_image.png\";s:10:\"show_title\";s:1:\"1\";}s:11:\"subcategory\";a:9:{s:13:\"limit_level_1\";s:1:\"4\";s:13:\"limit_level_2\";s:1:\"4\";s:13:\"limit_level_3\";s:1:\"4\";s:10:\"show_title\";s:1:\"1\";s:10:\"show_image\";s:1:\"1\";s:7:\"columns\";s:1:\"1\";s:7:\"submenu\";s:1:\"1\";s:15:\"submenu_columns\";s:1:\"1\";s:8:\"category\";s:0:\"\";}s:11:\"productlist\";a:4:{s:5:\"limit\";s:0:\"\";s:4:\"type\";s:3:\"new\";s:10:\"show_title\";s:1:\"1\";s:3:\"col\";s:1:\"1\";}s:10:\"categories\";a:4:{s:10:\"categories\";a:0:{}s:7:\"columns\";s:1:\"1\";s:7:\"submenu\";s:1:\"1\";s:15:\"submenu_columns\";s:1:\"1\";}}','','',''),
	(313,100,12,'no_image.png','a:1:{i:1;s:17:\"Diamond Jewellery\";}',0,119,'a:2:{s:3:\"url\";s:0:\"\";s:8:\"category\";s:0:\"\";}','a:1:{i:1;s:0:\"\";}',0,0,0,'100%',0,3,0,'a:6:{s:4:\"html\";a:1:{s:4:\"text\";a:1:{i:1;s:2169:\"&lt;div class=&quot;toplink-menu-heading&quot;&gt;Diamond Jewellery&lt;/div&gt;\r\n&lt;div class=&quot;toplink-menu&quot;&gt;\r\n	&lt;ul class=&quot;links-menu&quot;&gt;\r\n		&lt;li&gt;\r\n			&lt;a title=&quot;Rings&quot; href=&quot;rings.html&amp;amp;filter=17,10&quot;&gt;Rings&lt;/a&gt;\r\n		&lt;/li&gt;\r\n		&lt;li&gt;\r\n			&lt;a title=&quot;Earrings&quot; href=&quot;earrings.html&amp;amp;filter=17,10&quot;&gt;Earrings&lt;/a&gt;\r\n		&lt;/li&gt;\r\n		&lt;li&gt;\r\n			&lt;a title=&quot;Pendants&quot; href=&quot;pendants.html&amp;amp;filter=17,10&quot;&gt;Pendants&lt;/a&gt;\r\n		&lt;/li&gt;\r\n		&lt;li&gt;\r\n			&lt;a title=&quot;Necklaces&quot; href=&quot;necklaces.html&amp;amp;filter=17,10&quot;&gt;Necklaces&lt;/a&gt;\r\n		&lt;/li&gt;\r\n		&lt;li&gt;\r\n			&lt;a title=&quot;Bangles&quot; href=&quot;bangles.html&amp;amp;filter=17,10&quot;&gt;Bangles&lt;/a&gt;\r\n		&lt;/li&gt;\r\n		&lt;li&gt;\r\n			&lt;a title=&quot;Bracelets&quot; href=&quot;bracelets.html&amp;amp;filter=17,10&quot;&gt;Bracelets&lt;/a&gt;\r\n		&lt;/li&gt;\r\n		&lt;li&gt;\r\n			&lt;a title=&quot;Tanmaniyas&quot; href=&quot;tanmaniyas.html&amp;amp;filter=17,10&quot;&gt;Tanmaniyas&lt;/a&gt;\r\n		&lt;/li&gt;\r\n		&lt;li&gt;\r\n			&lt;a title=&quot;Chains&quot; href=&quot;chains.html&amp;amp;filter=17,10&quot;&gt;Chains&lt;/a&gt;\r\n		&lt;/li&gt;\r\n		&lt;li&gt;\r\n			&lt;a title=&quot;Anklets&quot; href=&quot;anklets.html&amp;amp;filter=17,10&quot;&gt;Anklets&lt;/a&gt;\r\n		&lt;/li&gt;\r\n		&lt;li&gt;\r\n			&lt;a title=&quot;Cuff-Links&quot; href=&quot;cuff-links.html&amp;amp;filter=17,10&quot;&gt;Cuff-Links&lt;/a&gt;\r\n		&lt;/li&gt;\r\n		&lt;li&gt;\r\n			&lt;a title=&quot;Mangalsutra&quot; href=&quot;mangalsutras.html&amp;amp;filter=17,10&quot;&gt;Mangalsutra&lt;/a&gt;\r\n		&lt;/li&gt;\r\n		&lt;li&gt;\r\n			&lt;a title=&quot;Nose Pin&quot; href=&quot;nose-pins.html&amp;amp;filter=17,10&quot;&gt;Nose-Pins&lt;/a&gt;\r\n		&lt;/li&gt;\r\n		&lt;li&gt;\r\n			&lt;a title=&quot;Matching Sets&quot; href=&quot;matching-sets.html&amp;amp;filter=17,10&quot;&gt;Pendants&lt;/a&gt;\r\n		&lt;/li&gt;\r\n		&lt;li&gt;\r\n			&lt;a title=&quot;Watches&quot; href=&quot;watches.html&amp;amp;filter=17,10&quot;&gt;Watches&lt;/a&gt;\r\n		&lt;/li&gt;\r\n	&lt;/ul&gt;\r\n&lt;/div&gt;\";}}s:7:\"product\";a:2:{s:2:\"id\";s:0:\"\";s:4:\"name\";s:0:\"\";}s:5:\"image\";a:2:{s:4:\"link\";s:12:\"no_image.png\";s:10:\"show_title\";s:1:\"1\";}s:11:\"subcategory\";a:9:{s:13:\"limit_level_1\";s:1:\"4\";s:13:\"limit_level_2\";s:1:\"4\";s:13:\"limit_level_3\";s:1:\"4\";s:10:\"show_title\";s:1:\"1\";s:10:\"show_image\";s:1:\"1\";s:7:\"columns\";s:1:\"1\";s:7:\"submenu\";s:1:\"1\";s:15:\"submenu_columns\";s:1:\"1\";s:8:\"category\";s:0:\"\";}s:11:\"productlist\";a:4:{s:5:\"limit\";s:0:\"\";s:4:\"type\";s:3:\"new\";s:10:\"show_title\";s:1:\"1\";s:3:\"col\";s:1:\"1\";}s:10:\"categories\";a:4:{s:10:\"categories\";a:0:{}s:7:\"columns\";s:1:\"1\";s:7:\"submenu\";s:1:\"1\";s:15:\"submenu_columns\";s:1:\"1\";}}','','',''),
	(314,100,13,'no_image.png','a:1:{i:1;s:18:\"Platinum Jewellery\";}',0,119,'a:2:{s:3:\"url\";s:0:\"\";s:8:\"category\";s:0:\"\";}','a:1:{i:1;s:0:\"\";}',0,0,0,'100%',0,3,0,'a:6:{s:4:\"html\";a:1:{s:4:\"text\";a:1:{i:1;s:2170:\"&lt;div class=&quot;toplink-menu-heading&quot;&gt;Platinum Jewellery&lt;/div&gt;\r\n&lt;div class=&quot;toplink-menu&quot;&gt;\r\n	&lt;ul class=&quot;links-menu&quot;&gt;\r\n		&lt;li&gt;\r\n			&lt;a title=&quot;Rings&quot; href=&quot;rings.html&amp;amp;filter=17,11&quot;&gt;Rings&lt;/a&gt;\r\n		&lt;/li&gt;\r\n		&lt;li&gt;\r\n			&lt;a title=&quot;Earrings&quot; href=&quot;earrings.html&amp;amp;filter=17,11&quot;&gt;Earrings&lt;/a&gt;\r\n		&lt;/li&gt;\r\n		&lt;li&gt;\r\n			&lt;a title=&quot;Pendants&quot; href=&quot;pendants.html&amp;amp;filter=17,11&quot;&gt;Pendants&lt;/a&gt;\r\n		&lt;/li&gt;\r\n		&lt;li&gt;\r\n			&lt;a title=&quot;Necklaces&quot; href=&quot;necklaces.html&amp;amp;filter=17,11&quot;&gt;Necklaces&lt;/a&gt;\r\n		&lt;/li&gt;\r\n		&lt;li&gt;\r\n			&lt;a title=&quot;Bangles&quot; href=&quot;bangles.html&amp;amp;filter=17,11&quot;&gt;Bangles&lt;/a&gt;\r\n		&lt;/li&gt;\r\n		&lt;li&gt;\r\n			&lt;a title=&quot;Bracelets&quot; href=&quot;bracelets.html&amp;amp;filter=17,11&quot;&gt;Bracelets&lt;/a&gt;\r\n		&lt;/li&gt;\r\n		&lt;li&gt;\r\n			&lt;a title=&quot;Tanmaniyas&quot; href=&quot;tanmaniyas.html&amp;amp;filter=17,11&quot;&gt;Tanmaniyas&lt;/a&gt;\r\n		&lt;/li&gt;\r\n		&lt;li&gt;\r\n			&lt;a title=&quot;Chains&quot; href=&quot;chains.html&amp;amp;filter=17,11&quot;&gt;Chains&lt;/a&gt;\r\n		&lt;/li&gt;\r\n		&lt;li&gt;\r\n			&lt;a title=&quot;Anklets&quot; href=&quot;anklets.html&amp;amp;filter=17,11&quot;&gt;Anklets&lt;/a&gt;\r\n		&lt;/li&gt;\r\n		&lt;li&gt;\r\n			&lt;a title=&quot;Cuff-Links&quot; href=&quot;cuff-links.html&amp;amp;filter=17,11&quot;&gt;Cuff-Links&lt;/a&gt;\r\n		&lt;/li&gt;\r\n		&lt;li&gt;\r\n			&lt;a title=&quot;Mangalsutra&quot; href=&quot;mangalsutras.html&amp;amp;filter=17,11&quot;&gt;Mangalsutra&lt;/a&gt;\r\n		&lt;/li&gt;\r\n		&lt;li&gt;\r\n			&lt;a title=&quot;Nose Pin&quot; href=&quot;nose-pins.html&amp;amp;filter=17,11&quot;&gt;Nose-Pins&lt;/a&gt;\r\n		&lt;/li&gt;\r\n		&lt;li&gt;\r\n			&lt;a title=&quot;Matching Sets&quot; href=&quot;matching-sets.html&amp;amp;filter=17,11&quot;&gt;Pendants&lt;/a&gt;\r\n		&lt;/li&gt;\r\n		&lt;li&gt;\r\n			&lt;a title=&quot;Watches&quot; href=&quot;watches.html&amp;amp;filter=17,11&quot;&gt;Watches&lt;/a&gt;\r\n		&lt;/li&gt;\r\n	&lt;/ul&gt;\r\n&lt;/div&gt;\";}}s:7:\"product\";a:2:{s:2:\"id\";s:0:\"\";s:4:\"name\";s:0:\"\";}s:5:\"image\";a:2:{s:4:\"link\";s:12:\"no_image.png\";s:10:\"show_title\";s:1:\"1\";}s:11:\"subcategory\";a:9:{s:13:\"limit_level_1\";s:1:\"4\";s:13:\"limit_level_2\";s:1:\"4\";s:13:\"limit_level_3\";s:1:\"4\";s:10:\"show_title\";s:1:\"1\";s:10:\"show_image\";s:1:\"1\";s:7:\"columns\";s:1:\"1\";s:7:\"submenu\";s:1:\"1\";s:15:\"submenu_columns\";s:1:\"1\";s:8:\"category\";s:0:\"\";}s:11:\"productlist\";a:4:{s:5:\"limit\";s:0:\"\";s:4:\"type\";s:3:\"new\";s:10:\"show_title\";s:1:\"1\";s:3:\"col\";s:1:\"1\";}s:10:\"categories\";a:4:{s:10:\"categories\";a:0:{}s:7:\"columns\";s:1:\"1\";s:7:\"submenu\";s:1:\"1\";s:15:\"submenu_columns\";s:1:\"1\";}}','','',''),
	(315,100,14,'no_image.png','a:1:{i:1;s:19:\"Imitation Jewellery\";}',0,119,'a:2:{s:3:\"url\";s:0:\"\";s:8:\"category\";s:0:\"\";}','a:1:{i:1;s:0:\"\";}',0,0,0,'100%',0,3,0,'a:6:{s:4:\"html\";a:1:{s:4:\"text\";a:1:{i:1;s:2171:\"&lt;div class=&quot;toplink-menu-heading&quot;&gt;Imitation Jewellery&lt;/div&gt;\r\n&lt;div class=&quot;toplink-menu&quot;&gt;\r\n	&lt;ul class=&quot;links-menu&quot;&gt;\r\n		&lt;li&gt;\r\n			&lt;a title=&quot;Rings&quot; href=&quot;rings.html&amp;amp;filter=17,12&quot;&gt;Rings&lt;/a&gt;\r\n		&lt;/li&gt;\r\n		&lt;li&gt;\r\n			&lt;a title=&quot;Earrings&quot; href=&quot;earrings.html&amp;amp;filter=17,12&quot;&gt;Earrings&lt;/a&gt;\r\n		&lt;/li&gt;\r\n		&lt;li&gt;\r\n			&lt;a title=&quot;Pendants&quot; href=&quot;pendants.html&amp;amp;filter=17,12&quot;&gt;Pendants&lt;/a&gt;\r\n		&lt;/li&gt;\r\n		&lt;li&gt;\r\n			&lt;a title=&quot;Necklaces&quot; href=&quot;necklaces.html&amp;amp;filter=17,12&quot;&gt;Necklaces&lt;/a&gt;\r\n		&lt;/li&gt;\r\n		&lt;li&gt;\r\n			&lt;a title=&quot;Bangles&quot; href=&quot;bangles.html&amp;amp;filter=17,12&quot;&gt;Bangles&lt;/a&gt;\r\n		&lt;/li&gt;\r\n		&lt;li&gt;\r\n			&lt;a title=&quot;Bracelets&quot; href=&quot;bracelets.html&amp;amp;filter=17,12&quot;&gt;Bracelets&lt;/a&gt;\r\n		&lt;/li&gt;\r\n		&lt;li&gt;\r\n			&lt;a title=&quot;Tanmaniyas&quot; href=&quot;tanmaniyas.html&amp;amp;filter=17,12&quot;&gt;Tanmaniyas&lt;/a&gt;\r\n		&lt;/li&gt;\r\n		&lt;li&gt;\r\n			&lt;a title=&quot;Chains&quot; href=&quot;chains.html&amp;amp;filter=17,12&quot;&gt;Chains&lt;/a&gt;\r\n		&lt;/li&gt;\r\n		&lt;li&gt;\r\n			&lt;a title=&quot;Anklets&quot; href=&quot;anklets.html&amp;amp;filter=17,12&quot;&gt;Anklets&lt;/a&gt;\r\n		&lt;/li&gt;\r\n		&lt;li&gt;\r\n			&lt;a title=&quot;Cuff-Links&quot; href=&quot;cuff-links.html&amp;amp;filter=17,12&quot;&gt;Cuff-Links&lt;/a&gt;\r\n		&lt;/li&gt;\r\n		&lt;li&gt;\r\n			&lt;a title=&quot;Mangalsutra&quot; href=&quot;mangalsutras.html&amp;amp;filter=17,12&quot;&gt;Mangalsutra&lt;/a&gt;\r\n		&lt;/li&gt;\r\n		&lt;li&gt;\r\n			&lt;a title=&quot;Nose Pin&quot; href=&quot;nose-pins.html&amp;amp;filter=17,12&quot;&gt;Nose-Pins&lt;/a&gt;\r\n		&lt;/li&gt;\r\n		&lt;li&gt;\r\n			&lt;a title=&quot;Matching Sets&quot; href=&quot;matching-sets.html&amp;amp;filter=17,12&quot;&gt;Pendants&lt;/a&gt;\r\n		&lt;/li&gt;\r\n		&lt;li&gt;\r\n			&lt;a title=&quot;Watches&quot; href=&quot;watches.html&amp;amp;filter=17,12&quot;&gt;Watches&lt;/a&gt;\r\n		&lt;/li&gt;\r\n	&lt;/ul&gt;\r\n&lt;/div&gt;\";}}s:7:\"product\";a:2:{s:2:\"id\";s:0:\"\";s:4:\"name\";s:0:\"\";}s:5:\"image\";a:2:{s:4:\"link\";s:12:\"no_image.png\";s:10:\"show_title\";s:1:\"1\";}s:11:\"subcategory\";a:9:{s:13:\"limit_level_1\";s:1:\"4\";s:13:\"limit_level_2\";s:1:\"4\";s:13:\"limit_level_3\";s:1:\"4\";s:10:\"show_title\";s:1:\"1\";s:10:\"show_image\";s:1:\"1\";s:7:\"columns\";s:1:\"1\";s:7:\"submenu\";s:1:\"1\";s:15:\"submenu_columns\";s:1:\"1\";s:8:\"category\";s:0:\"\";}s:11:\"productlist\";a:4:{s:5:\"limit\";s:0:\"\";s:4:\"type\";s:3:\"new\";s:10:\"show_title\";s:1:\"1\";s:3:\"col\";s:1:\"1\";}s:10:\"categories\";a:4:{s:10:\"categories\";a:0:{}s:7:\"columns\";s:1:\"1\";s:7:\"submenu\";s:1:\"1\";s:15:\"submenu_columns\";s:1:\"1\";}}','','',''),
	(320,318,5,'no_image.png','a:1:{i:1;s:10:\"Image_Mega\";}',1,124,'a:2:{s:3:\"url\";s:0:\"\";s:8:\"category\";s:0:\"\";}','a:1:{i:1;s:0:\"\";}',0,0,0,'900px',0,5,0,'a:6:{s:4:\"html\";a:1:{s:4:\"text\";a:1:{i:1;s:204:\"&lt;div class=&quot;row img-banner&quot;&gt;&lt;a href=&quot;moulds.html&quot;&gt;&lt;img src=&quot;image/catalog/demo/menu/img-static-megamenu-h.jpg&quot; alt=&quot;banner&quot;&gt;&lt;/a&gt;&lt;/div&gt;\";}}s:7:\"product\";a:2:{s:2:\"id\";s:0:\"\";s:4:\"name\";s:0:\"\";}s:5:\"image\";a:2:{s:4:\"link\";s:12:\"no_image.png\";s:10:\"show_title\";s:1:\"1\";}s:11:\"subcategory\";a:9:{s:13:\"limit_level_1\";s:1:\"4\";s:13:\"limit_level_2\";s:1:\"4\";s:13:\"limit_level_3\";s:0:\"\";s:10:\"show_title\";s:1:\"1\";s:10:\"show_image\";s:1:\"1\";s:7:\"columns\";s:1:\"1\";s:7:\"submenu\";s:1:\"1\";s:15:\"submenu_columns\";s:1:\"1\";s:8:\"category\";s:0:\"\";}s:11:\"productlist\";a:4:{s:5:\"limit\";s:0:\"\";s:4:\"type\";s:3:\"new\";s:10:\"show_title\";s:1:\"1\";s:3:\"col\";s:1:\"1\";}s:10:\"categories\";a:4:{s:10:\"categories\";a:0:{}s:7:\"columns\";s:1:\"1\";s:7:\"submenu\";s:1:\"1\";s:15:\"submenu_columns\";s:1:\"1\";}}','','','');

/*!40000 ALTER TABLE `mega_menu` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table menu
# ------------------------------------------------------------

DROP TABLE IF EXISTS `menu`;

CREATE TABLE `menu` (
  `menu_id` int(11) NOT NULL AUTO_INCREMENT,
  `store_id` int(11) NOT NULL,
  `type` varchar(6) NOT NULL,
  `link` varchar(255) NOT NULL,
  `sort_order` int(3) NOT NULL,
  `status` tinyint(1) NOT NULL,
  PRIMARY KEY (`menu_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;



# Dump of table menu_description
# ------------------------------------------------------------

DROP TABLE IF EXISTS `menu_description`;

CREATE TABLE `menu_description` (
  `menu_id` int(11) NOT NULL,
  `language_id` int(11) NOT NULL,
  `name` varchar(64) NOT NULL,
  PRIMARY KEY (`menu_id`,`language_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;



# Dump of table menu_module
# ------------------------------------------------------------

DROP TABLE IF EXISTS `menu_module`;

CREATE TABLE `menu_module` (
  `menu_module_id` int(11) NOT NULL,
  `menu_id` int(11) NOT NULL,
  `code` varchar(64) NOT NULL,
  `sort_order` int(3) NOT NULL,
  PRIMARY KEY (`menu_module_id`),
  KEY `menu_id` (`menu_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;



# Dump of table modification
# ------------------------------------------------------------

DROP TABLE IF EXISTS `modification`;

CREATE TABLE `modification` (
  `modification_id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(64) NOT NULL,
  `code` varchar(64) NOT NULL,
  `author` varchar(64) NOT NULL,
  `version` varchar(32) NOT NULL,
  `link` varchar(255) NOT NULL,
  `xml` mediumtext NOT NULL,
  `status` tinyint(1) NOT NULL,
  `date_added` datetime NOT NULL,
  PRIMARY KEY (`modification_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

LOCK TABLES `modification` WRITE;
/*!40000 ALTER TABLE `modification` DISABLE KEYS */;

INSERT INTO `modification` (`modification_id`, `name`, `code`, `author`, `version`, `link`, `xml`, `status`, `date_added`)
VALUES
	(1,'Installation without FTP settings','no_ftp','karapuz (support@ka-station.com)','1.2.0','http://www.opencart.com/index.php?route=extension/extension/info&extension_id=19862','<modification> \n <id></id> \n <name>Installation without FTP settings</name> \n <code>no_ftp</code> \n <version>1.2.0</version> \n <author>karapuz (support@ka-station.com)</author> \n <link>http://www.opencart.com/index.php?route=extension/extension/info&amp;extension_id=19862</link> \n <file path=\"admin/controller/extension/installer.php\">\n <operation>\n <search index=\"0\"><![CDATA[$data[\'button_continue\'] =]]></search>\n <add position=\"after\"><![CDATA[//karapuz (no_ftp.ocmod.xml) \n $data[\'text_upload_without_ftp\'] = $this->language->get(\'text_upload_without_ftp\');\n $data[\'help_upload_without_ftp\'] = $this->language->get(\'help_upload_without_ftp\');\n $data[\'upload_without_ftp\'] = false;\n///karapuz (no_ftp.ocmod.xml) ]]></add>\n </operation>\n <operation>\n <search index=\"0\"><![CDATA[\'extension/installer/ftp\']]></search>\n <add position=\"replace\"><![CDATA[\'extension/installer/file_tp_wrapper\']]></add>\n </operation>\n <operation>\n <search index=\"0\"><![CDATA[function ftp(]]></search>\n <add position=\"before\"><![CDATA[//karapuz (no_ftp.ocmod.xml) \n static public function cpy($source, $dest) {\n if(is_dir($source)) {\n $dir_handle = opendir($source);\n while ($file = readdir($dir_handle)) {\n if ($file != \".\" && $file != \"..\") {\n if (is_dir($source . \"/\" . $file)) {\n if (!is_dir($dest . \"/\" . $file)) {\n mkdir($dest . \"/\" . $file);\n }\n self::cpy($source . \"/\" . $file, $dest . \"/\" . $file);\n } else {\n copy($source . \"/\" . $file, $dest . \"/\" . $file);\n }\n }\n }\n closedir($dir_handle);\n } else {\n copy($source, $dest);\n }\n }\n \n protected function copyUpload() {\n $json = array();\n \n $directory = DIR_UPLOAD . str_replace(array(\'../\', \'..\\\\\', \'..\'), \'\', $this->request->post[\'path\']) . \'/upload/\';\n\n if (!is_dir($directory)) {\n $json[\'error\'] = $this->language->get(\'error_directory\');\n return $json;\n }\n\n self::cpy($directory, dirname(DIR_APPLICATION));\n \n return $json;\n }\n \n /*\n This wrapper is used because some hostings block calls to URLs containing \'/ftp\'. It\n brokes installation process.\n */\n public function file_tp_wrapper() {\n return $this->ftp();\n }\n///karapuz (no_ftp.ocmod.xml) ]]></add>\n </operation>\n <operation>\n <search index=\"0\"><![CDATA[if (!$this->config->get(\'config_ftp_status\')]]></search>\n <add position=\"before\"><![CDATA[//karapuz (no_ftp.ocmod.xml) \n if (!empty($this->request->post[\'upload_without_ftp\'])) {\n $json = $this->copyUpload();\n $this->response->addHeader(\'Content-Type: application/json\');\n $this->response->setOutput(json_encode($json));\n return; \n }\n///karapuz (no_ftp.ocmod.xml) ]]></add>\n </operation>\n </file>\n <file path=\"admin/language/en-gb/extension/installer.php\">\n <operation>\n <search index=\"0\"><![CDATA[$_[\'text_clear\']]]></search>\n <add position=\"after\"><![CDATA[//karapuz (no_ftp.ocmod.xml) \n$_[\'text_upload_without_ftp\'] = \'Upload Without FTP\'; \n$_[\'help_upload_without_ftp\'] = \'When the checkbox is set, files from the archive will be unpacked to the store directory directly without connecting to it through FTP\';\n///karapuz (no_ftp.ocmod.xml) ]]></add>\n </operation>\n </file>\n <file path=\"admin/language/english/extension/installer.php\">\n <operation>\n <search index=\"0\"><![CDATA[$_[\'text_clear\']]]></search>\n <add position=\"after\"><![CDATA[//karapuz (no_ftp.ocmod.xml) \n$_[\'text_upload_without_ftp\'] = \'Upload Without FTP\';\n$_[\'help_upload_without_ftp\'] = \'When the checkbox is set, files from the archive will be unpacked to the store directory directly without connecting to it through FTP\';\n///karapuz (no_ftp.ocmod.xml) ]]></add>\n </operation>\n </file>\n <file path=\"admin/view/template/extension/installer.tpl\">\n <operation>\n <search index=\"0\"><![CDATA[<form class=\"form]]></search>\n <add position=\"after\"><![CDATA[<?php /* //karapuz (no_ftp.ocmod.xml) */?>\n <div class=\"form-group\">\n <label class=\"col-sm-2 control-label\" for=\"input-upload_without_ftp\"><span data-toggle=\"tooltip\" title=\"<?php echo $help_upload_without_ftp; ?>\"><?php echo $text_upload_without_ftp; ?></span></label>\n <div class=\"col-sm-10\">\n <div class=\"checkbox\">\n <label>\n <?php if ($upload_without_ftp) { ?>\n <input type=\"checkbox\" name=\"upload_without_ftp\" value=\"1\" checked=\"checked\" id=\"input-upload_without_ftp\" />\n <?php } else { ?>\n <input type=\"checkbox\" name=\"upload_without_ftp\" value=\"1\" id=\"input-upload_without_ftp\" />\n <?php } ?>\n &nbsp; </label>\n </div>\n </div>\n </div>\n<?php /* ///karapuz (no_ftp.ocmod.xml) */?>]]></add>\n </operation>\n <operation>\n <search index=\"0\"><![CDATA[timer = setInterval(]]></search>\n <add position=\"before\"><![CDATA[<?php /* //karapuz (no_ftp.ocmod.xml) */?>\n if (typeof(timer) != \'undefined\' && timer) {\n clearInterval(timer); \n }\n<?php /* ///karapuz (no_ftp.ocmod.xml) */?>]]></add>\n </operation>\n <operation>\n <search index=\"0\"><![CDATA[n next()]]></search>\n <add position=\"after\"><![CDATA[<?php /* //karapuz (no_ftp.ocmod.xml) */?>\n var custom_params = \'\';\n if ($(\'#input-upload_without_ftp\').prop(\'checked\')) {\n custom_params = \'&upload_without_ftp=1\';\n }\n<?php /* ///karapuz (no_ftp.ocmod.xml) */?>]]></add>\n </operation>\n <operation>\n <search index=\"0\"><![CDATA[\'path=\' + data.path]]></search>\n <add position=\"replace\"><![CDATA[\'path=\' + data.path + custom_params]]></add>\n </operation>\n </file>\n</modification>',1,'2016-09-08 15:42:01'),
	(2,'So Social Login','So-Social-Login','Smartaddons','1.0','http://www.smartaddons.com/','<?xml version=\"1.0\" encoding=\"utf-8\"?>\n<modification>\n <name>So Social Login</name>\n <code>So-Social-Login</code>\n <version>1.0</version>\n <author>Smartaddons</author>\n <link>http://www.smartaddons.com/</link>\n \n <file path=\"catalog/view/theme/*/template/account/login.tpl\">\n <operation error=\"log\">\n <search ><![CDATA[<div class=\"well\">]]></search>\n <add position=\"replace\"><![CDATA[\n <div class=\"well col-sm-12\"> \n ]]></add>\n </operation>\n \n <operation error=\"log\">\n <search ><![CDATA[<input type=\"submit\" value=\"<?php echo $button_login; ?>\" class=\"btn btn-primary\" />]]></search>\n <add position=\"replace\"><![CDATA[\n <input type=\"submit\" value=\"<?php echo $button_login; ?>\" class=\"btn btn-primary pull-left\" /> \n ]]></add>\n </operation>\n \n <operation error=\"log\">\n <search ><![CDATA[</form>]]></search>\n <add position=\"after\"><![CDATA[\n <?php //echo $column_login; ?>\n <?php if ($setting[\'so_sociallogin_status\']) {?>\n <column id=\"column-login\" class=\"col-sm-8 pull-right\">\n <div class=\"row\">\n <?php if (isset($this->session->data[\'warning\'])) { ?>\n <div class=\"alert alert-warning\"><i class=\"fa fa-check-circle\"></i> <?php echo $this->session->data[\'warning\']; ?></div>\n <?php } ?>\n \n <div class=\"social_login pull-right\" id=\"so_sociallogin\">\n <?php if($setting[\'so_sociallogin_fbstatus\']){?>\n <?php if ($setting[\'so_sociallogin_button\'] == \'image\') {?>\n <a class=\"social-icon\" href=\"<?php echo $fblink; ?>\">\n <img class=\"img-responsive\" src=\"<?php echo $fbimage; ?>\" \n data-toggle=\"tooltip\" alt=\"<?php echo $setting[\'so_sociallogin_fbtitle\']; ?>\" \n title=\"<?php echo $setting[\'so_sociallogin_fbtitle\']; ?>\"\n />\n </a>\n <?php }else {?>\n <a href=\"<?php echo $fblink?>\" class=\"btn btn-social-icon btn-sm btn-facebook\"><i class=\"fa fa-facebook fa-fw\" aria-hidden=\"true\"></i></a>\n <?php } ?>\n <?php } ?>\n \n <?php if($setting[\'so_sociallogin_twitstatus\']){?>\n <?php if ($setting[\'so_sociallogin_button\'] == \'image\') {?>\n <a class=\"social-icon\" href=\"<?php echo $twitlink; ?>\">\n <img class=\"img-responsive\" src=\"<?php echo $twitimage; ?>\" \n data-toggle=\"tooltip\" alt=\"<?php echo $setting[\'so_sociallogin_twittertitle\']; ?>\" \n title=\"<?php echo $setting[\'so_sociallogin_twittertitle\']; ?>\"\n />\n </a>\n <?php }else {?>\n <a href=\"<?php echo $twitlink?>\" class=\"btn btn-social-icon btn-sm btn-twitter\"><i class=\"fa fa-twitter fa-fw\" aria-hidden=\"true\"></i></a>\n <?php }?>\n <?php } ?>\n \n <?php if($setting[\'so_sociallogin_googlestatus\']){?>\n <?php if ($setting[\'so_sociallogin_button\'] == \'image\') {?>\n <a class=\"social-icon\" href=\"<?php echo $googlelink; ?>\">\n <img class=\"img-responsive\" src=\"<?php echo $googleimage; ?>\" \n data-toggle=\"tooltip\" alt=\"<?php echo $setting[\'so_sociallogin_googletitle\']; ?>\" \n title=\"<?php echo $setting[\'so_sociallogin_googletitle\']; ?>\" \n />\n </a>\n <?php }else {?>\n <a href=\"<?php echo $googlelink?>\" class=\"btn btn-social-icon btn-sm btn-google-plus\"><i class=\"fa fa-google fa-fw\" aria-hidden=\"true\"></i></a>\n <?php }?>\n <?php } ?>\n \n <?php if($setting[\'so_sociallogin_linkstatus\']){?>\n <?php if ($setting[\'so_sociallogin_button\'] == \'image\') {?>\n <a class=\"social-icon\" href=\"<?php echo $linkdinlink; ?>\">\n <img class=\"img-responsive\" src=\"<?php echo $linkdinimage; ?>\" \n data-toggle=\"tooltip\" alt=\"<?php echo $setting[\'so_sociallogin_linkedintitle\']; ?>\" \n title=\"<?php echo $setting[\'so_sociallogin_linkedintitle\']; ?>\"\n />\n </a>\n <?php }else {?>\n <a href=\"<?php echo $linkdinlink?>\" class=\"btn btn-social-icon btn-sm btn-linkdin\"><i class=\"fa fa-linkedin fa-fw\" aria-hidden=\"true\"></i></a>\n <?php }?>\n <?php } ?>\n </div>\n </div>\n </column>\n <?php }?>\n ]]></add>\n </operation>\n \n <operation error=\"log\">\n <search ><![CDATA[<?php echo $footer; ?>]]></search>\n <add position=\"before\"><![CDATA[\n <style>\n @media(max-width:991px){\n #column-login,.social_login,.socalicon{\n float:none !important;\n width:100%;\n }\n .account-login .btn-primary{\n float:none !important;\n }\n .social_login {\n padding:0 10px;\n }\n }\n </style>\n ]]></add>\n </operation>\n </file>\n \n <file path=\"catalog/view/theme/*/template/checkout/login.tpl\">\n <operation error=\"log\">\n <search ><![CDATA[<input type=\"button\" value=\"<?php echo $button_login; ?>\" id=\"button-login\" data-loading-text=\"<?php echo $text_loading; ?>\" class=\"btn btn-primary\" />]]></search>\n <add position=\"replace\"><![CDATA[\n <input type=\"button\" value=\"<?php echo $button_login; ?>\" id=\"button-login\" data-loading-text=\"<?php echo $text_loading; ?>\" class=\"btn btn-primary\" />\n <?php echo $column_login; ?>\n \n ]]></add>\n </operation>\n \n </file>\n \n <file path=\"catalog/controller/checkout/login.php\">\n <operation error=\"log\">\n <search ><![CDATA[$data[\'forgotten\'] = $this->url->link(\'account/forgotten\', \'\', true);]]></search>\n <add position=\"after\"><![CDATA[\n \n /* xml */\n $data[\'column_login\'] = $this->load->controller(\'common/column_login\');\n /* xml */\n ]]></add>\n </operation>\n </file>\n <file path=\"catalog/controller/checkout/checkout.php\">\n <operation error=\"log\">\n <search ><![CDATA[$data[\'forgotten\'] = $this->url->link(\'account/forgotten\', \'\', true);]]></search>\n <add position=\"before\"><![CDATA[\n \n /* xml */\n $data[\'column_login\'] = $this->load->controller(\'common/column_login\');\n /* xml */\n ]]></add>\n </operation>\n </file>\n \n <file path=\"catalog/controller/account/login.php\">\n <operation error=\"log\">\n <search ><![CDATA[$data[\'column_left\'] = $this->load->controller(\'common/column_left\');]]></search>\n <add position=\"after\"><![CDATA[\n /* xml */\n $data[\'column_login\'] = $this->load->controller(\'common/column_login\');\n /* xml */\n ]]></add>\n </operation>\n \n <operation error=\"log\">\n <search ><![CDATA[$data[\'header\'] = $this->load->controller(\'common/header\');]]></search>\n <add position=\"after\"><![CDATA[\n /* xml */\n $this->load->model(\'setting/setting\');\n $this->load->model(\'tool/image\');\n $setting = $this->model_setting_setting->getSetting(\'so_sociallogin\');\n if ($setting) {\n if(isset($this->session->data[\'route\']))\n {\n $location = $this->url->link($this->session->data[\'route\'], \"\", \'SSL\');\n }\n else\n {\n $location = $this->url->link(\"account/account\", \"\", \'SSL\');\n }\n \n /* Facebook Library */\n require_once(DIR_SYSTEM . \'library/so_social/fb/facebook.php\');\n \n /* Facebook Login link code */\n $fbconnect = new Facebook(array(\n \'appId\' => $setting[\'so_sociallogin_fbapikey\'],\n \'secret\' => $setting[\'so_sociallogin_fbsecretapi\'],\n ));\n \n $data[\'fblink\'] = $fbconnect->getLoginUrl(\n array(\n \'scope\' => \'email,user_birthday,user_location,user_hometown\',\n \'redirect_uri\' => $this->url->link(\'extension/module/so_sociallogin/FacebookLogin\', \'\', \'SSL\')\n )\n );\n /* Facebook Login link code */\n \n /* Google Libery file inculde */\n require_once DIR_SYSTEM.\'library/so_social/src/Google_Client.php\';\n require_once DIR_SYSTEM.\'library/so_social/src/contrib/Google_Oauth2Service.php\';\n \n /* Google Login link code */\n $gClient = new Google_Client();\n $gClient->setApplicationName($setting[\'so_sociallogin_googletitle\']);\n $gClient->setClientId($setting[\'so_sociallogin_googleapikey\']);\n $gClient->setClientSecret($setting[\'so_sociallogin_googlesecretapi\']);\n $gClient->setRedirectUri($this->url->link(\'extension/module/so_sociallogin/GoogleLogin\', \'\', \'SSL\'));\n $google_oauthV2 = new Google_Oauth2Service($gClient);\n $data[\'googlelink\'] = $gClient->createAuthUrl();\n \n /* Twitter Login */ \n $data[\'twitlink\'] = $this->url->link(\'extension/module/so_sociallogin/TwitterLogin\', \'\', \'SSL\');\n \n /* Linkedin Login */\n $data[\'linkdinlink\'] = $this->url->link(\'extension/module/so_sociallogin/LinkedinLogin\', \'\', \'SSL\');\n \n /* Get Image */\n $sociallogin_width = 130;\n $sociallogin_height = 35;\n if (isset($setting[\'so_sociallogin_width\']) && is_numeric($setting[\'so_sociallogin_width\'])) {\n $sociallogin_width = $setting[\'so_sociallogin_width\'];\n }\n if (isset($setting[\'so_sociallogin_height\']) && is_numeric($setting[\'so_sociallogin_height\'])) {\n $sociallogin_height = $setting[\'so_sociallogin_height\'];\n }\n if ($setting[\'so_sociallogin_fbimage\']) {\n $fbicon = $this->model_tool_image->resize($setting[\'so_sociallogin_fbimage\'], $sociallogin_width, $sociallogin_height);\n } else {\n $fbicon = $this->model_tool_image->resize(\'placeholder.png\', $sociallogin_width, $sociallogin_height);\n }\n \n if ($setting[\'so_sociallogin_twitimage\']) {\n $twiticon = $this->model_tool_image->resize($setting[\'so_sociallogin_twitimage\'], $sociallogin_width, $sociallogin_height);\n } else {\n $twiticon = $this->model_tool_image->resize(\'placeholder.png\', $sociallogin_width, $sociallogin_height);\n }\n \n if ($setting[\'so_sociallogin_googleimage\']) {\n $googleicon = $this->model_tool_image->resize($setting[\'so_sociallogin_googleimage\'], $sociallogin_width, $sociallogin_height);\n } else {\n $googleicon = $this->model_tool_image->resize(\'placeholder.png\', $sociallogin_width, $sociallogin_height);\n }\n \n if ($setting[\'so_sociallogin_linkdinimage\']) {\n $linkdinicon = $this->model_tool_image->resize($setting[\'so_sociallogin_linkdinimage\'], $sociallogin_width, $sociallogin_height);\n } else {\n $linkdinicon = $this->model_tool_image->resize(\'placeholder.png\', $sociallogin_width, $sociallogin_height);\n }\n \n $data[\'iconwidth\'] = $sociallogin_width;\n $data[\'iconheight\'] = $sociallogin_height;\n $data[\'status\'] = $setting[\'so_sociallogin_status\'];\n $data[\'fbimage\'] = $fbicon;\n $data[\'twitimage\'] = $twiticon;\n $data[\'googleimage\'] = $googleicon;\n $data[\'linkdinimage\'] = $linkdinicon;\n \n $data[\'setting\'] = $setting;\n }\n /* xml */ \n ]]></add>\n </operation>\n </file>\n \n <file path=\"admin/view/template/design/layout_form.tpl\">\n <operation error=\"log\">\n <search ><![CDATA[<table id=\"module-column-right\" class=\"table table-striped table-bordered table-hover\">]]></search>\n <add position=\"before\" offset=\"2\"><![CDATA[\n <!--xml-->\n <table id=\"module-column-login\" class=\"table table-striped table-bordered table-hover\">\n <thead>\n <tr>\n <td class=\"text-center\"><?php echo $text_column_loginpage; ?></td>\n </tr>\n </thead>\n <tbody>\n <?php foreach ($layout_modules as $layout_module) { ?>\n <?php if ($layout_module[\'position\'] == \'column_login\') { ?>\n <tr id=\"module-row<?php echo $module_row; ?>\">\n <td class=\"text-left\"><div class=\"input-group\">\n <select name=\"layout_module[<?php echo $module_row; ?>][code]\" class=\"form-control input-sm\">\n <?php foreach ($extensions as $extension) { ?>\n <optgroup label=\"<?php echo $extension[\'name\']; ?>\">\n <?php if (!$extension[\'module\']) { ?>\n <?php if ($extension[\'code\'] == $layout_module[\'code\']) { ?>\n <option value=\"<?php echo $extension[\'code\']; ?>\" selected=\"selected\"><?php echo $extension[\'name\']; ?></option>\n <?php } else { ?>\n <option value=\"<?php echo $extension[\'code\']; ?>\"><?php echo $extension[\'name\']; ?></option>\n <?php } ?>\n <?php } else { ?>\n <?php foreach ($extension[\'module\'] as $module) { ?>\n <?php if ($module[\'code\'] == $layout_module[\'code\']) { ?>\n <option value=\"<?php echo $module[\'code\']; ?>\" selected=\"selected\"><?php echo $module[\'name\']; ?></option>\n <?php } else { ?>\n <option value=\"<?php echo $module[\'code\']; ?>\"><?php echo $module[\'name\']; ?></option>\n <?php } ?>\n <?php } ?>\n <?php } ?>\n </optgroup>\n <?php } ?>\n </select>\n <input type=\"hidden\" name=\"layout_module[<?php echo $module_row; ?>][position]\" value=\"<?php echo $layout_module[\'position\']; ?>\" />\n <input type=\"hidden\" name=\"layout_module[<?php echo $module_row; ?>][sort_order]\" value=\"<?php echo $layout_module[\'sort_order\']; ?>\" />\n <div class=\"input-group-btn\"><a href=\"<?php echo $layout_module[\'edit\']; ?>\" type=\"button\" data-toggle=\"tooltip\" title=\"<?php echo $button_edit; ?>\" target=\"_blank\" class=\"btn btn-primary btn-sm\"><i class=\"fa fa-pencil\"></i></a>\n <button type=\"button\" onclick=\"$(\'#module-row<?php echo $module_row; ?>\').remove();\" data-toggle=\"tooltip\" title=\"<?php echo $button_remove; ?>\" class=\"btn btn-danger btn-sm\"><i class=\"fa fa fa-minus-circle\"></i></button>\n </div>\n </div></td>\n </tr>\n <?php $module_row++; ?>\n <?php } ?>\n <?php } ?>\n </tbody>\n <tfoot>\n <tr>\n <td class=\"text-left\"><div class=\"input-group\">\n <select class=\"form-control input-sm\">\n <?php foreach ($extensions as $extension) { ?>\n <optgroup label=\"<?php echo $extension[\'name\']; ?>\">\n <?php if (!$extension[\'module\']) { ?>\n <option value=\"<?php echo $extension[\'code\']; ?>\"><?php echo $extension[\'name\']; ?></option>\n <?php } else { ?>\n <?php foreach ($extension[\'module\'] as $module) { ?>\n <option value=\"<?php echo $module[\'code\']; ?>\"><?php echo $module[\'name\']; ?></option>\n <?php } ?>\n <?php } ?>\n </optgroup>\n <?php } ?>\n </select>\n <div class=\"input-group-btn\">\n <button type=\"button\" onclick=\"addModule(\'column-login\');\" data-toggle=\"tooltip\" title=\"<?php echo $button_module_add; ?>\" class=\"btn btn-primary btn-sm\"><i class=\"fa fa-plus-circle\"></i></button>\n </div>\n </div></td>\n </tr>\n </tfoot>\n </table>\n <!--xml-->\n ]]></add>\n </operation>\n \n <operation error=\"log\">\n <search ><![CDATA[$(\'#module-column-left, #module-column-right, #module-content-top, #module-content-bottom\').delegate(\'select[name*=\\\'code\\\']\', \'change\', function() {]]></search>\n <add position=\"replace\"><![CDATA[\n $(\'#module-column-left, #module-column-right, #module-content-top, #module-content-bottom, #module-column-login\').delegate(\'select[name*=\\\'code\\\']\', \'change\', function() {\n ]]></add>\n </operation>\n <operation error=\"log\">\n <search ><![CDATA[$(\'#module-column-left, #module-column-right, #module-content-top, #module-content-bottom\').trigger(\'change\');]]></search>\n <add position=\"replace\"><![CDATA[\n $(\'#module-column-left, #module-column-right, #module-content-top, #module-content-bottom, #module-column-login\').trigger(\'change\');\n ]]></add>\n </operation>\n </file>\n \n <file path=\"admin/language/*/design/layout.php\">\n <operation error=\"log\">\n <search ><![CDATA[// Text]]></search>\n <add position=\"after\"><![CDATA[\n /* xml */\n \n $_[\'text_column_loginpage\'] = \'Login Page\';\n $_[\'text_column_checkoutpage\'] = \'Checkout Page\';\n /* xml */ \n ]]></add>\n </operation>\n </file>\n \n <file path=\"admin/controller/design/layout.php\">\n <operation error=\"log\">\n <search ><![CDATA[protected function getForm() {]]></search>\n <add position=\"after\"><![CDATA[\n /* xml */\n $data[\'text_column_loginpage\'] = $this->language->get(\'text_column_loginpage\');\n $data[\'text_column_checkoutpage\'] = $this->language->get(\'text_column_checkoutpage\'); \n /* xml */ \n ]]></add>\n </operation>\n </file>\n \n <file path=\"catalog/model/account/customer.php\">\n <operation error=\"log\">\n <search ><![CDATA[$customer_id = $this->db->getLastId();]]></search>\n <add position=\"after\"><![CDATA[\n /* xml */\n if(!empty($data[\'address_1\']))\n {\n /* xml */ \n ]]></add>\n </operation>\n <operation error=\"log\">\n <search ><![CDATA[$this->load->language(\'mail/customer\');]]></search>\n <add position=\"before\"><![CDATA[\n /* xml */\n }\n /* xml */ \n ]]></add>\n </operation>\n </file>\n \n <file path=\"catalog/controller/common/header.php\">\n <operation error=\"log\">\n <search ><![CDATA[$data[\'title\'] = $this->document->getTitle();]]></search>\n <add position=\"after\"><![CDATA[\n $this->document->addStyle(\'catalog/view/javascript/so_sociallogin/css/so_sociallogin.css\');\n $this->load->model(\'setting/setting\');\n $this->load->model(\'tool/image\');\n $setting = $this->model_setting_setting->getSetting(\'so_sociallogin\');\n \n if ($setting) {\n if(isset($this->session->data[\'route\']))\n {\n $location = $this->url->link($this->session->data[\'route\'], \"\", \'SSL\');\n }\n else\n {\n $location = $this->url->link(\"account/account\", \"\", \'SSL\');\n }\n \n /* Facebook Library */\n require_once(DIR_SYSTEM . \'library/so_social/fb/facebook.php\');\n \n /* Facebook Login link code */\n $fbconnect = new Facebook(array(\n \'appId\' => $setting[\'so_sociallogin_fbapikey\'],\n \'secret\' => $setting[\'so_sociallogin_fbsecretapi\'],\n ));\n \n $data[\'fblink\'] = $fbconnect->getLoginUrl(\n array(\n \'scope\' => \'email,user_birthday,user_location,user_hometown\',\n \'redirect_uri\' => $this->url->link(\'extension/module/so_sociallogin/FacebookLogin\', \'\', \'SSL\')\n )\n );\n /* Facebook Login link code */\n \n /* Google Libery file inculde */\n require_once DIR_SYSTEM.\'library/so_social/src/Google_Client.php\';\n require_once DIR_SYSTEM.\'library/so_social/src/contrib/Google_Oauth2Service.php\';\n \n /* Google Login link code */\n $gClient = new Google_Client();\n $gClient->setApplicationName($setting[\'so_sociallogin_googletitle\']);\n $gClient->setClientId($setting[\'so_sociallogin_googleapikey\']);\n $gClient->setClientSecret($setting[\'so_sociallogin_googlesecretapi\']);\n $gClient->setRedirectUri($this->url->link(\'extension/module/so_sociallogin/GoogleLogin\', \'\', \'SSL\'));\n $google_oauthV2 = new Google_Oauth2Service($gClient);\n $data[\'googlelink\'] = $gClient->createAuthUrl();\n \n /* Twitter Login */ \n $data[\'twitlink\'] = $this->url->link(\'extension/module/so_sociallogin/TwitterLogin\', \'\', \'SSL\');\n \n /* Linkedin Login */\n $data[\'linkdinlink\'] = $this->url->link(\'extension/module/so_sociallogin/LinkedinLogin\', \'\', \'SSL\');\n \n /* Get Image */\n $sociallogin_width = 130;\n $sociallogin_height = 35;\n if (isset($setting[\'so_sociallogin_width\']) && is_numeric($setting[\'so_sociallogin_width\'])) {\n $sociallogin_width = $setting[\'so_sociallogin_width\'];\n }\n if (isset($setting[\'so_sociallogin_height\']) && is_numeric($setting[\'so_sociallogin_height\'])) {\n $sociallogin_height = $setting[\'so_sociallogin_height\'];\n }\n if ($setting[\'so_sociallogin_fbimage\']) {\n $fbicon = $this->model_tool_image->resize($setting[\'so_sociallogin_fbimage\'], $sociallogin_width, $sociallogin_height);\n } else {\n $fbicon = $this->model_tool_image->resize(\'placeholder.png\', $sociallogin_width, $sociallogin_height);\n }\n \n if ($setting[\'so_sociallogin_twitimage\']) {\n $twiticon = $this->model_tool_image->resize($setting[\'so_sociallogin_twitimage\'], $sociallogin_width, $sociallogin_height);\n } else {\n $twiticon = $this->model_tool_image->resize(\'placeholder.png\', $sociallogin_width, $sociallogin_height);\n }\n \n if ($setting[\'so_sociallogin_googleimage\']) {\n $googleicon = $this->model_tool_image->resize($setting[\'so_sociallogin_googleimage\'], $sociallogin_width, $sociallogin_height);\n } else {\n $googleicon = $this->model_tool_image->resize(\'placeholder.png\', $sociallogin_width, $sociallogin_height);\n }\n \n if ($setting[\'so_sociallogin_linkdinimage\']) {\n $linkdinicon = $this->model_tool_image->resize($setting[\'so_sociallogin_linkdinimage\'], $sociallogin_width, $sociallogin_height);\n } else {\n $linkdinicon = $this->model_tool_image->resize(\'placeholder.png\', $sociallogin_width, $sociallogin_height);\n }\n \n $data[\'iconwidth\'] = $sociallogin_width;\n $data[\'iconheight\'] = $sociallogin_height;\n $data[\'status\'] = $setting[\'so_sociallogin_status\'];\n $data[\'fbimage\'] = $fbicon;\n $data[\'twitimage\'] = $twiticon;\n $data[\'googleimage\'] = $googleicon;\n $data[\'linkdinimage\'] = $linkdinicon;\n \n $data[\'setting\'] = $setting;\n \n $this->load->language(\'extension/module/so_sociallogin\');\n $data[\'text_colregister\'] = $this->language->get(\'text_colregister\');\n $data[\'text_create_account\'] = $this->language->get(\'text_create_account\');\n $data[\'text_forgot_password\'] = $this->language->get(\'text_forgot_password\');\n $data[\'forgotten\'] = $this->url->link(\'account/forgotten\', \'\', true);\n $data[\'text_title_popuplogin\'] = $this->language->get(\'text_title_popuplogin\');\n $data[\'text_title_login_with_social\'] = $this->language->get(\'text_title_login_with_social\');\n }\n ]]></add>\n </operation>\n </file>\n \n <file path=\"catalog/view/theme/*/template/common/header.tpl\">\n <operation error=\"log\">\n <search><![CDATA[<div id=\"socialLogin\"></div>]]></search>\n <add position=\"after\"><![CDATA[\n <?php if (isset($setting) && $setting[\'so_sociallogin_status\'] && $setting[\'so_sociallogin_popuplogin\']) {?>\n <div class=\"modal fade in\" id=\"so_sociallogin\" tabindex=\"-1\" role=\"dialog\" aria-hidden=\"true\">\n <div class=\"modal-dialog block-popup-login\">\n <a href=\"javascript:void(0)\" title=\"Close\" class=\"close close-login fa fa-times-circle\" data-dismiss=\"modal\"></a>\n <div class=\"tt_popup_login\"><strong><?php echo $text_title_popuplogin?></strong></div>\n <div class=\"block-content\">\n <div class=\" col-reg registered-account\">\n <div class=\"block-content\">\n <form class=\"form form-login\" action=\"<?php echo $login?>\" method=\"post\" id=\"login-form\">\n <fieldset class=\"fieldset login\" data-hasrequired=\"* Required Fields\">\n <div class=\"field email required email-input\">\n <div class=\"control\">\n <input name=\"email\" value=\"\" autocomplete=\"off\" id=\"email\" type=\"email\" class=\"input-text\" title=\"Email\" placeholder=\"E-mail Address\" />\n </div>\n </div>\n <div class=\"field password required pass-input\">\n <div class=\"control\">\n <input name=\"password\" type=\"password\" autocomplete=\"off\" class=\"input-text\" id=\"pass\" title=\"Password\" placeholder=\"Password\" />\n </div>\n </div>\n <?php if ($setting[\'so_sociallogin_status\']) {?>\n <div class=\" form-group\">\n <label class=\"control-label\"><?php echo $text_title_login_with_social?></label>\n <div>\n <?php if ($setting[\'so_sociallogin_googlestatus\']) {?>\n <?php if ($setting[\'so_sociallogin_button\'] == \'icon\') {?>\n <a href=\"<?php echo $googlelink?>\" class=\"btn btn-social-icon btn-sm btn-google-plus\"><i class=\"fa fa-google fa-fw\" aria-hidden=\"true\"></i></a>\n <?php }else {?>\n <a class=\"social-icon\" href=\"<?php echo $googlelink?>\">\n <img class=\"img-responsive\" src=\"<?php echo $googleimage; ?>\" \n data-toggle=\"tooltip\" alt=\"<?php echo $setting[\'so_sociallogin_googletitle\']; ?>\" \n title=\"<?php echo $setting[\'so_sociallogin_googletitle\']; ?>\" \n />\n </a>\n <?php }?>\n <?php }?>\n <?php if ($setting[\'so_sociallogin_fbstatus\']) {?>\n <?php if ($setting[\'so_sociallogin_button\'] == \'icon\') {?>\n <a href=\"<?php echo $fblink?>\" class=\"btn btn-social-icon btn-sm btn-facebook\"><i class=\"fa fa-facebook fa-fw\" aria-hidden=\"true\"></i></a>\n <?php }else {?>\n <a href=\"<?php echo $fblink?>\" class=\"social-icon\">\n <img class=\"img-responsive\" src=\"<?php echo $fbimage; ?>\" \n data-toggle=\"tooltip\" alt=\"<?php echo $setting[\'so_sociallogin_fbtitle\']; ?>\" \n title=\"<?php echo $setting[\'so_sociallogin_fbtitle\']; ?>\"\n />\n </a>\n <?php }?>\n <?php }?>\n <?php if ($setting[\'so_sociallogin_twitstatus\']) {?>\n <?php if ($setting[\'so_sociallogin_button\'] == \'icon\') {?>\n <a href=\"<?php echo $twitlink?>\" class=\"btn btn-social-icon btn-sm btn-twitter\"><i class=\"fa fa-twitter fa-fw\" aria-hidden=\"true\"></i></a>\n <?php }else {?>\n <a class=\"social-icon\" href=\"<?php echo $twitlink; ?>\">\n <img class=\"img-responsive\" src=\"<?php echo $twitimage; ?>\" \n data-toggle=\"tooltip\" alt=\"<?php echo $setting[\'so_sociallogin_twittertitle\']; ?>\" \n title=\"<?php echo $setting[\'so_sociallogin_twittertitle\']; ?>\"\n />\n </a>\n <?php }?>\n <?php }?>\n <?php if ($setting[\'so_sociallogin_linkstatus\']) {?>\n <?php if ($setting[\'so_sociallogin_button\'] == \'icon\') {?>\n <a href=\"<?php echo $linkdinlink?>\" class=\"btn btn-social-icon btn-sm btn-linkdin\"><i class=\"fa fa-linkedin fa-fw\" aria-hidden=\"true\"></i></a>\n <?php }else {?>\n <a class=\"social-icon\" href=\"<?php echo $linkdinlink; ?>\">\n <img class=\"img-responsive\" src=\"<?php echo $linkdinimage; ?>\" \n data-toggle=\"tooltip\" alt=\"<?php echo $setting[\'so_sociallogin_linkedintitle\']; ?>\" \n title=\"<?php echo $setting[\'so_sociallogin_linkedintitle\']; ?>\"\n />\n </a>\n <?php }?>\n <?php }?>\n </div>\n </div>\n <?php }?>\n <div class=\"secondary ft-link-p\"><a class=\"action remind\" href=\"<?php echo $forgotten?>\"><span><?php echo $text_forgot_password?></span></a></div>\n <div class=\"actions-toolbar\">\n <div class=\"primary\"><button type=\"submit\" class=\"action login primary\" name=\"send\" id=\"send2\"><span><?php echo $text_login?></span></button></div>\n </div>\n </fieldset>\n </form>\n </div>\n </div> \n <div class=\"col-reg login-customer\">\n <?php echo $text_colregister?>\n <a class=\"btn-reg-popup\" title=\"<?php echo $text_register?>\" href=\"<?php echo $register; ?>\"><?php echo $text_create_account?></a>\n </div>\n <div style=\"clear:both;\"></div>\n </div>\n </div>\n </div>\n <script type=\"text/javascript\">\n jQuery(document).ready(function($) {\n var $window = $(window);\n function checkWidth() {\n var windowsize = $window.width();\n if (windowsize > 767) {\n $(\'a[href*=\"account/login\"]\').click(function (e) {\n e.preventDefault();\n $(\"#so_sociallogin\").modal(\'show\');\n });\n }\n }\n checkWidth();\n $(window).resize(checkWidth);\n });\n </script>\n <?php }?>\n ]]></add>\n </operation>\n </file>\n</modification>',1,'2017-02-16 17:27:40'),
	(3,'OCMod Editor','ocmod-editor','OpenCart Brasil','1.6','http://www.opencartbrasil.com.br','<?xml version=\"1.0\" encoding=\"utf-8\"?> \n<modification> \n <name>OCMod Editor</name> \n <code>ocmod-editor</code> \n <version>1.6</version> \n <author>OpenCart Brasil</author> \n <link>http://www.opencartbrasil.com.br</link> \n <file path=\"admin/controller/extension/modification.php\"> \n <operation> \n <search> \n <![CDATA[$data[\'refresh\'] = $this->url->link(\'extension/modification/refresh\', \'token=\' . $this->session->data[\'token\'] . $url, true);]]> \n </search> \n <add position=\"before\"> \n <![CDATA[$data[\'new\'] = $this->url->link(\'extension/modification_editor\', \'token=\' . $this->session->data[\'token\'] . $url, true);]]> \n </add> \n </operation> \n <operation> \n <search> \n <![CDATA[$data[\'modifications\'][] = array(]]> \n </search> \n <add position=\"after\"> \n <![CDATA[ \n \'edit\' => $this->url->link(\'extension/modification_editor\', \'token=\' . $this->session->data[\'token\'] . \'&modification_id=\' . $result[\'modification_id\'], true), \n \'download\' => $this->url->link(\'extension/modification_editor/download\', \'token=\' . $this->session->data[\'token\'] . \'&modification_id=\' . $result[\'modification_id\'], true), \n ]]> \n </add> \n </operation> \n <operation> \n <search> \n <![CDATA[$data[\'tab_log\'] = $this->language->get(\'tab_log\');]]> \n </search> \n <add position=\"after\"> \n <![CDATA[ \n $this->load->language(\'extension/modification_editor\'); \n $data[\'button_new\'] = $this->language->get(\'button_new\'); \n $data[\'button_edit\'] = $this->language->get(\'button_edit\'); \n $data[\'button_download\'] = $this->language->get(\'button_download\'); \n ]]> \n </add> \n </operation> \n <operation> \n <search index=\"1\"> \n <![CDATA[$this->response->redirect($this->url->link(\'extension/modification\', \'token=\' . $this->session->data[\'token\'] . $url, true));]]> \n </search> \n <add position=\"replace\"> \n <![CDATA[ \n if (isset($this->request->get[\'modification_editor\'])) { \n echo $this->session->data[\'success\']; \n exit; \n } else { \n $this->response->redirect($this->url->link(\'extension/modification\', \'token=\' . $this->session->data[\'token\'] . $url, true)); \n } \n ]]> \n </add> \n </operation> \n </file> \n \n <file path=\"admin/view/template/extension/modification.tpl\"> \n <operation> \n <search> \n <![CDATA[<div class=\"pull-right\">]]> \n </search> \n <add position=\"after\"> \n <![CDATA[<a href=\"<?php echo $new; ?>\" data-toggle=\"tooltip\" title=\"<?php echo $button_new; ?>\" class=\"btn btn-primary\"><i class=\"fa fa-plus\"></i></a>]]> \n </add> \n </operation> \n <operation> \n <search> \n <![CDATA[<?php if (!$modification[\'enabled\']) { ?>]]> \n </search> \n <add position=\"before\"> \n <![CDATA[ \n <a href=\"<?php echo $modification[\'edit\']; ?>\" data-toggle=\"tooltip\" title=\"<?php echo $button_edit; ?>\" class=\"btn btn-primary\"><i class=\"fa fa-pencil\"></i></a> \n <a href=\"<?php echo $modification[\'download\']; ?>\" data-toggle=\"tooltip\" title=\"<?php echo $button_download; ?>\" class=\"btn btn-success\"><i class=\"fa fa-cloud-download\"></i></a> \n ]]> \n </add> \n </operation> \n </file> \n</modification>',1,'2017-02-16 17:36:36'),
	(6,'So OnePage Checkout','so-onepage-checkout','OpenCartWorks','1.0.1','http://www.opencartworks.com/','<?xml version=\"1.0\" encoding=\"utf-8\"?> \n<modification> \n <name>So OnePage Checkout</name> \n <code>so-onepage-checkout</code> \n <version>1.0.1</version> \n <author>OpenCartWorks</author> \n <link>http://www.opencartworks.com/</link> \n \n <file path=\"catalog/controller/checkout/checkout.php\"> \n <operation error=\"log\"> \n <search ><![CDATA[class ControllerCheckoutCheckout extends Controller {]]></search> \n <add position=\"after\"><![CDATA[ \n public function __construct($registry) { \n parent::__construct($registry); \n $this->load->language(\'checkout/cart\'); \n $this->load->language(\'checkout/checkout\'); \n \n $this->load->language(\'checkout/coupon\'); \n $this->load->language(\'checkout/voucher\'); \n $this->load->language(\'extension/module/so_onepagecheckout\'); \n \n $this->load->model(\'account/activity\'); \n $this->load->model(\'account/custom_field\'); \n $this->load->model(\'tool/upload\'); \n \n $this->load->model(\'account/address\'); \n $this->load->model(\'account/customer\'); \n $this->load->model(\'account/customer_group\'); \n $this->load->model(\'localisation/country\'); \n $this->load->model(\'localisation/zone\'); \n $this->load->model(\'extension/module/so_onepagecheckout\'); \n } \n \n public function getProperty($array, $property, $default_value = null) { \n $properties = explode(\'.\', $property); \n foreach ($properties as $prop) { \n if (!is_array($array) || !isset($array[$prop])) { \n return $default_value; \n } \n $array = $array[$prop]; \n } \n if (is_array($array)) { \n return $array; \n } \n $array = trim($array); \n return $array !== \'\' ? $array : $default_value; \n } \n \n private function isShippingRequired() { \n return $this->cart->hasShipping(); \n } \n \n private function isLoggedIn() { \n return $this->customer->isLogged(); \n } \n \n private function allowGuestCheckout() { \n return $this->config->get(\'config_checkout_guest\') && !$this->config->get(\'config_customer_price\') && !$this->cart->hasDownload(); \n } \n \n private function renderRegisterForm() { \n $this->load->model(\'setting/setting\'); \n $setting_so_onepagecheckout = $this->model_setting_setting->getSetting(\'so_onepagecheckout\'); \n $setting_so_onepagecheckout_general = $setting_so_onepagecheckout[\'so_onepagecheckout_general\']; \n $setting_so_onepagecheckout_layout_setting = $setting_so_onepagecheckout[\'so_onepagecheckout_layout_setting\']; \n $data[\'setting_so_onepagecheckout\'] = $setting_so_onepagecheckout; \n $data[\'setting_so_onepagecheckout_general\'] = $setting_so_onepagecheckout_general; \n $data[\'setting_so_onepagecheckout_layout_setting\'] = $setting_so_onepagecheckout_layout_setting; \n \n $data[\'text_register\'] = $this->language->get(\'text_register\'); \n $data[\'text_guest\'] = $this->language->get(\'text_guest\'); \n $data[\'entry_email\'] = $this->language->get(\'entry_email\'); \n $data[\'entry_password\'] = $this->language->get(\'entry_password\'); \n $data[\'text_forgotten\'] = $this->language->get(\'text_forgotten\'); \n $data[\'text_loading\'] = $this->language->get(\'text_loading\'); \n $data[\'button_login\'] = $this->language->get(\'button_login\'); \n $data[\'text_i_am_returning_customer\'] = $this->language->get(\'text_i_am_returning_customer\'); \n $data[\'text_returning_customer\'] = $this->language->get(\'text_returning_customer\'); \n \n $data[\'text_your_details\'] = $this->language->get(\'text_your_details\'); \n $data[\'entry_customer_group\'] = $this->language->get(\'entry_customer_group\'); \n $data[\'entry_firstname\'] = $this->language->get(\'entry_firstname\'); \n $data[\'entry_lastname\'] = $this->language->get(\'entry_lastname\'); \n $data[\'entry_telephone\'] = $this->language->get(\'entry_telephone\'); \n $data[\'entry_fax\'] = $this->language->get(\'entry_fax\'); \n $data[\'text_your_password\'] = $this->language->get(\'text_your_password\'); \n $data[\'entry_confirm\'] = $this->language->get(\'entry_confirm\'); \n $data[\'text_your_address\'] = $this->language->get(\'text_your_address\'); \n $data[\'entry_shipping\'] = $this->language->get(\'entry_shipping\'); \n $data[\'text_shipping_address\'] = $this->language->get(\'text_shipping_address\'); \n \n $data[\'customer_groups\'] = array(); \n $data[\'customer_group_id\'] = $this->model_extension_module_so_onepagecheckout->getCustomerGroupId(); \n if (is_array($this->config->get(\'config_customer_group_display\'))) { \n $this->load->model(\'account/customer_group\'); \n \n $customer_groups = $this->model_account_customer_group->getCustomerGroups(); \n \n foreach ($customer_groups as $customer_group) { \n if (in_array($customer_group[\'customer_group_id\'], $this->config->get(\'config_customer_group_display\'))) { \n $data[\'customer_groups\'][] = $customer_group; \n } \n } \n } \n \n $data[\'payment_address_form\'] = $this->renderAddressForm(\'payment\', false); \n $data[\'shipping_address_form\'] = $this->renderAddressForm(\'shipping\'); \n $data[\'shipping_address\'] = $this->getProperty($this->session->data, \'so_checkout_shipping_address\', \'1\'); \n $data[\'is_shipping_required\'] = $this->isShippingRequired(); \n \n $data[\'forgotten\'] = $this->url->link(\'account/forgotten\', \'\', true); \n \n $data[\'custom_fields\'] = $this->model_extension_module_so_onepagecheckout->getCustomFields(); \n $data[\'order_data\'] = $this->model_extension_module_so_onepagecheckout->getOrder(); \n \n return $this->load->view(\'extension/module/so_onepagecheckout/checkout/register\', $data); \n } \n \n private function renderAddressForm($type, $name = true) { \n $this->load->model(\'setting/setting\'); \n $setting_so_onepagecheckout = $this->model_setting_setting->getSetting(\'so_onepagecheckout\'); \n $setting_so_onepagecheckout_general = $setting_so_onepagecheckout[\'so_onepagecheckout_general\']; \n $setting_so_onepagecheckout_layout_setting = $setting_so_onepagecheckout[\'so_onepagecheckout_layout_setting\']; \n \n $data[\'type\'] = $type; \n $data[\'name\'] = $name; \n \n $data[\'button_upload\'] = $this->language->get(\'button_upload\'); \n $data[\'text_address_existing\'] = $this->language->get(\'text_address_existing\'); \n $data[\'text_address_new\'] = $this->language->get(\'text_address_new\'); \n $data[\'text_select\'] = $this->language->get(\'text_select\'); \n $data[\'text_none\'] = $this->language->get(\'text_none\'); \n \n $data[\'entry_firstname\'] = $this->language->get(\'entry_firstname\'); \n $data[\'entry_lastname\'] = $this->language->get(\'entry_lastname\'); \n $data[\'entry_company\'] = $this->language->get(\'entry_company\'); \n $data[\'entry_company_id\'] = $this->language->get(\'entry_company_id\'); \n $data[\'entry_tax_id\'] = $this->language->get(\'entry_tax_id\'); \n $data[\'entry_address_1\'] = $this->language->get(\'entry_address_1\'); \n $data[\'entry_address_2\'] = $this->language->get(\'entry_address_2\'); \n $data[\'entry_postcode\'] = $this->language->get(\'entry_postcode\'); \n $data[\'entry_city\'] = $this->language->get(\'entry_city\'); \n $data[\'entry_country\'] = $this->language->get(\'entry_country\'); \n $data[\'entry_zone\'] = $this->language->get(\'entry_zone\'); \n \n $data[\'custom_fields\'] = $this->model_extension_module_so_onepagecheckout->getCustomFields($type); \n $data[\'order_data\'] = $this->model_extension_module_so_onepagecheckout->getOrder(); \n \n $data[\'addresses\'] = $this->model_account_address->getAddresses(); \n $data[\'countries\'] = $this->model_localisation_country->getCountries(); \n \n $address = $this->model_extension_module_so_onepagecheckout->getAddress($type); \n foreach ($address as $key => $value) { \n $data[$key] = $value; \n } \n \n if ($this->isLoggedIn()) { \n $data[\'is_logged_in\'] = true; \n } else { \n $data[\'is_logged_in\'] = false; \n } \n \n if (isset($setting_so_onepagecheckout_general[\'so_onepagecheckout_country_id\']) && $setting_so_onepagecheckout_general[\'so_onepagecheckout_country_id\']) { \n $data[\'country_id\'] = $setting_so_onepagecheckout_general[\'so_onepagecheckout_country_id\']; \n } \n \n if (isset($setting_so_onepagecheckout_general[\'so_onepagecheckout_zone_id\']) && $setting_so_onepagecheckout_general[\'so_onepagecheckout_zone_id\']) { \n $data[\'zone_id\'] = $setting_so_onepagecheckout_general[\'so_onepagecheckout_zone_id\']; \n } \n \n return $this->load->view(\'extension/module/so_onepagecheckout/checkout/address_form\', $data); \n } \n \n public function shipping($load = false) { \n $this->load->model(\'setting/setting\'); \n $setting_so_onepagecheckout = $this->model_setting_setting->getSetting(\'so_onepagecheckout\'); \n $setting_so_onepagecheckout_general = $setting_so_onepagecheckout[\'so_onepagecheckout_general\']; \n $setting_so_onepagecheckout_layout_setting = $setting_so_onepagecheckout[\'so_onepagecheckout_layout_setting\']; \n $data[\'setting_so_onepagecheckout\'] = $setting_so_onepagecheckout; \n $data[\'setting_so_onepagecheckout_general\'] = $setting_so_onepagecheckout_general; \n $data[\'setting_so_onepagecheckout_layout_setting\'] = $setting_so_onepagecheckout_layout_setting; \n \n $data[\'text_shipping_method\'] = $this->language->get(\'text_shipping_method\'); \n $data[\'text_title_shipping_method\'] = $this->language->get(\'text_title_shipping_method\'); \n $data[\'error_shipping_method\'] = $this->language->get(\'error_shipping_method\'); \n \n $data[\'shipping_methods\'] = $this->model_extension_module_so_onepagecheckout->getShippingMethods(); \n $shipping_methods = array(); \n if (count($data[\'shipping_methods\'])>0) { \n foreach ($data[\'shipping_methods\'] as $key=>$shipping_method) { \n if (@$setting_so_onepagecheckout_layout_setting[$key.\'_status\'] == 1) { \n $shipping_methods[] = $shipping_method; \n } \n } \n } \n $data[\'shipping_methods\'] = $shipping_methods; \n $data[\'code\'] = $this->model_extension_module_so_onepagecheckout->getShippingMethodCode(); \n \n if (!$data[\'shipping_methods\']) { \n $data[\'error_warning\'] = sprintf($this->language->get(\'error_no_shipping\'), $this->url->link(\'information/contact\', \'\', true)); \n } else { \n $data[\'error_warning\'] = \'\'; \n } \n \n if ($load) \n return $this->load->view(\'extension/module/so_onepagecheckout/checkout/shipping_methods\', $data); \n else \n return $this->response->setOutput($this->load->view(\'extension/module/so_onepagecheckout/checkout/shipping_methods\', $data)); \n \n } \n \n public function payment($load = false) { \n $this->load->model(\'setting/setting\'); \n $setting_so_onepagecheckout = $this->model_setting_setting->getSetting(\'so_onepagecheckout\'); \n $setting_so_onepagecheckout_general = $setting_so_onepagecheckout[\'so_onepagecheckout_general\']; \n $setting_so_onepagecheckout_layout_setting = $setting_so_onepagecheckout[\'so_onepagecheckout_layout_setting\']; \n $data[\'setting_so_onepagecheckout\'] = $setting_so_onepagecheckout; \n $data[\'setting_so_onepagecheckout_general\'] = $setting_so_onepagecheckout_general; \n $data[\'setting_so_onepagecheckout_layout_setting\'] = $setting_so_onepagecheckout_layout_setting; \n \n $data[\'text_payment_method\'] = $this->language->get(\'text_payment_method\'); \n $data[\'text_title_payment_method\'] = $this->language->get(\'text_title_payment_method\'); \n \n $data[\'payment_methods\'] = $this->model_extension_module_so_onepagecheckout->getPaymentMethods(); \n $payment_methods = array(); \n if (count($data[\'payment_methods\'])>0) { \n foreach ($data[\'payment_methods\'] as $key=>$payment_method) { \n if (@$setting_so_onepagecheckout_layout_setting[$key.\'_status\'] == 1) { \n $payment_methods[] = $payment_method; \n } \n } \n } \n $data[\'payment_methods\'] = $payment_methods; \n $data[\'code\'] = $this->model_extension_module_so_onepagecheckout->getPaymentMethodCode(); \n \n if (!$data[\'payment_methods\']) { \n $data[\'error_warning\'] = sprintf($this->language->get(\'error_no_payment\'), $this->url->link(\'information/contact\', \'\', true)); \n } else { \n $data[\'error_warning\'] = \'\'; \n } \n \n if ($load) \n return $this->load->view(\'extension/module/so_onepagecheckout/checkout/payment_methods\', $data); \n else \n return $this->response->setOutput($this->load->view(\'extension/module/so_onepagecheckout/checkout/payment_methods\', $data)); \n } \n \n public function change_coupon_voucher_reward() { \n $this->load->model(\'setting/setting\'); \n $setting_so_onepagecheckout = $this->model_setting_setting->getSetting(\'so_onepagecheckout\'); \n $setting_so_onepagecheckout_general = $setting_so_onepagecheckout[\'so_onepagecheckout_general\']; \n $setting_so_onepagecheckout_layout_setting = $setting_so_onepagecheckout[\'so_onepagecheckout_layout_setting\']; \n $data[\'setting_so_onepagecheckout\'] = $setting_so_onepagecheckout; \n $data[\'setting_so_onepagecheckout_general\'] = $setting_so_onepagecheckout_general; \n $data[\'setting_so_onepagecheckout_layout_setting\'] = $setting_so_onepagecheckout_layout_setting; \n \n $data[\'text_loading\'] = $this->language->get(\'text_loading\'); \n $data[\'text_coupon_voucher\'] = $this->language->get(\'text_coupon_voucher\'); \n $data[\'text_enter_coupon_code\'] = $this->language->get(\'text_enter_coupon_code\'); \n $data[\'text_enter_voucher_code\'] = $this->language->get(\'text_enter_voucher_code\'); \n $data[\'text_apply_voucher\'] = $this->language->get(\'text_apply_voucher\'); \n $data[\'text_enter_reward_points\'] = $this->language->get(\'text_enter_reward_points\'); \n $data[\'text_apply_points\'] = $this->language->get(\'text_apply_points\'); \n \n $_data = $this->request->post; \n \n if (@$_data[\'so_checkout_account\'] == \'login\') { \n $data[\'coupon_status\'] = $this->config->get(\'coupon_status\') && $setting_so_onepagecheckout_layout_setting[\'coupon_login_status\']; \n }else if (@$_data[\'so_checkout_account\'] == \'register\') { \n $data[\'coupon_status\'] = $this->config->get(\'coupon_status\') && $setting_so_onepagecheckout_layout_setting[\'coupon_register_status\']; \n }else if (@$_data[\'so_checkout_account\'] == \'guest\') { \n $data[\'coupon_status\'] = $this->config->get(\'coupon_status\') && $setting_so_onepagecheckout_layout_setting[\'coupon_guest_status\']; \n }else { \n $data[\'coupon_status\'] = $this->config->get(\'coupon_status\'); \n } \n $data[\'entry_coupon\'] = $this->language->get(\'entry_coupon\'); \n $data[\'button_coupon\'] = $this->language->get(\'button_coupon\'); \n $data[\'coupon\'] = $this->getProperty($this->session->data, \'coupon\'); \n \n if (@$_data[\'so_checkout_account\'] == \'login\') { \n $data[\'voucher_status\'] = $this->config->get(\'voucher_status\') && $setting_so_onepagecheckout_layout_setting[\'voucher_login_status\']; \n }else if (@$_data[\'so_checkout_account\'] == \'register\') { \n $data[\'voucher_status\'] = $this->config->get(\'voucher_status\') && $setting_so_onepagecheckout_layout_setting[\'voucher_register_status\']; \n }else if (@$_data[\'so_checkout_account\'] == \'guest\') { \n $data[\'voucher_status\'] = $this->config->get(\'voucher_status\') && $setting_so_onepagecheckout_layout_setting[\'voucher_guest_status\']; \n }else { \n $data[\'voucher_status\'] = $this->config->get(\'voucher_status\'); \n } \n $data[\'entry_voucher\'] = $this->language->get(\'entry_voucher\'); \n $data[\'button_voucher\'] = $this->language->get(\'button_voucher\'); \n $data[\'voucher\'] = $this->getProperty($this->session->data, \'voucher\'); \n \n $points = $this->customer->getRewardPoints(); \n \n $points_total = 0; \n \n foreach ($this->cart->getProducts() as $product) { \n if ($product[\'points\']) { \n $points_total += $product[\'points\']; \n } \n } \n \n if (@$_data[\'so_checkout_account\'] == \'login\') { \n $data[\'reward_status\'] = $points && $points_total && $this->config->get(\'reward_status\') && $setting_so_onepagecheckout_layout_setting[\'reward_login_status\']; \n }else if (@$_data[\'so_checkout_account\'] == \'register\') { \n $data[\'reward_status\'] = $points && $points_total && $this->config->get(\'reward_status\') && $setting_so_onepagecheckout_layout_setting[\'reward_register_status\']; \n }else if (@$_data[\'so_checkout_account\'] == \'guest\') { \n $data[\'reward_status\'] = $points && $points_total && $this->config->get(\'reward_status\') && $setting_so_onepagecheckout_layout_setting[\'reward_guest_status\']; \n } \n else { \n $data[\'reward_status\'] = $points && $points_total && $this->config->get(\'reward_status\'); \n } \n $data[\'entry_reward\'] = $this->language->get(\'entry_reward\'); \n $data[\'button_reward\'] = $this->language->get(\'button_reward\'); \n $data[\'reward\'] = $this->getProperty($this->session->data, \'reward\'); \n \n echo $this->load->view(\'extension/module/so_onepagecheckout/checkout/coupon_voucher_reward\', $data); \n exit(); \n } \n \n public function save() { \n if ($value = $this->getProperty($this->request->post, \'shipping_address_id\')) { \n $this->session->data[\'shipping_address\'] = $this->model_account_address->getAddress($value); \n $this->model_extension_module_so_onepagecheckout->setAddress(\'shipping\', $this->session->data[\'shipping_address\']); \n } \n \n if ($value = $this->getProperty($this->request->post, \'shipping_country_id\')) { \n $this->model_extension_module_so_onepagecheckout->setAddress(\'shipping\', array( \n \'country_id\' => $value, \n \'zone_id\' => $this->getProperty($this->request->post, \'shipping_zone_id\'), \n \'postcode\' => $this->getProperty($this->request->post, \'shipping_postcode\'), \n )); \n } \n \n if ($value = $this->getProperty($this->request->post, \'shipping_method\')) { \n $shipping = explode(\'.\', $value); \n $this->session->data[\'shipping_method\'] = $this->session->data[\'shipping_methods\'][$shipping[0]][\'quote\'][$shipping[1]]; \n } \n \n if ($value = $this->getProperty($this->request->post, \'payment_address_id\')) { \n $this->session->data[\'payment_address\'] = $this->model_account_address->getAddress($value); \n $this->model_extension_module_so_onepagecheckout->setAddress(\'payment\', $this->session->data[\'payment_address\']); \n } \n \n if ($value = $this->getProperty($this->request->post, \'payment_country_id\')) { \n $this->model_extension_module_so_onepagecheckout->setAddress(\'payment\', array( \n \'country_id\' => $value, \n \'zone_id\' => $this->getProperty($this->request->post, \'payment_zone_id\'), \n \'postcode\' => $this->getProperty($this->request->post, \'payment_postcode\'), \n )); \n } \n \n if ($value = $this->getProperty($this->request->post, \'payment_method\')) { \n $this->session->data[\'payment_method\'] = $this->session->data[\'payment_methods\'][$value]; \n } \n \n $this->model_extension_module_so_onepagecheckout->save(); \n \n header(\'Content-Type: application/json\'); \n echo \'{}\'; \n \n exit; \n } \n \n private function renderCouponVoucherReward() { \n $this->load->model(\'setting/setting\'); \n $setting_so_onepagecheckout = $this->model_setting_setting->getSetting(\'so_onepagecheckout\'); \n $setting_so_onepagecheckout_general = $setting_so_onepagecheckout[\'so_onepagecheckout_general\']; \n $setting_so_onepagecheckout_layout_setting = $setting_so_onepagecheckout[\'so_onepagecheckout_layout_setting\']; \n $data[\'setting_so_onepagecheckout\'] = $setting_so_onepagecheckout; \n $data[\'setting_so_onepagecheckout_general\'] = $setting_so_onepagecheckout_general; \n $data[\'setting_so_onepagecheckout_layout_setting\'] = $setting_so_onepagecheckout_layout_setting; \n \n $data[\'text_loading\'] = $this->language->get(\'text_loading\'); \n $data[\'text_coupon_voucher\'] = $this->language->get(\'text_coupon_voucher\'); \n $data[\'text_enter_coupon_code\'] = $this->language->get(\'text_enter_coupon_code\'); \n $data[\'text_enter_voucher_code\'] = $this->language->get(\'text_enter_voucher_code\'); \n $data[\'text_apply_voucher\'] = $this->language->get(\'text_apply_voucher\'); \n $data[\'text_enter_reward_points\'] = $this->language->get(\'text_enter_reward_points\'); \n $data[\'text_apply_points\'] = $this->language->get(\'text_apply_points\'); \n \n $_data = $this->session->data; \n \n if (@$_data[\'so_checkout_account\'] == \'login\') { \n $data[\'coupon_status\'] = $this->config->get(\'coupon_status\') && $setting_so_onepagecheckout_layout_setting[\'coupon_login_status\']; \n }else if (@$_data[\'so_checkout_account\'] == \'register\') { \n $data[\'coupon_status\'] = $this->config->get(\'coupon_status\') && $setting_so_onepagecheckout_layout_setting[\'coupon_register_status\']; \n }else if (@$_data[\'so_checkout_account\'] == \'guest\') { \n $data[\'coupon_status\'] = $this->config->get(\'coupon_status\') && $setting_so_onepagecheckout_layout_setting[\'coupon_guest_status\']; \n }else { \n $data[\'coupon_status\'] = $this->config->get(\'coupon_status\'); \n } \n $data[\'entry_coupon\'] = $this->language->get(\'entry_coupon\'); \n $data[\'button_coupon\'] = $this->language->get(\'button_coupon\'); \n $data[\'coupon\'] = $this->getProperty($this->session->data, \'coupon\'); \n \n if (@$_data[\'so_checkout_account\'] == \'login\') { \n $data[\'voucher_status\'] = $this->config->get(\'voucher_status\') && $setting_so_onepagecheckout_layout_setting[\'voucher_login_status\']; \n }else if (@$_data[\'so_checkout_account\'] == \'register\') { \n $data[\'voucher_status\'] = $this->config->get(\'voucher_status\') && $setting_so_onepagecheckout_layout_setting[\'voucher_register_status\']; \n }else if (@$_data[\'so_checkout_account\'] == \'guest\') { \n $data[\'voucher_status\'] = $this->config->get(\'voucher_status\') && $setting_so_onepagecheckout_layout_setting[\'voucher_guest_status\']; \n }else { \n $data[\'voucher_status\'] = $this->config->get(\'voucher_status\'); \n } \n $data[\'entry_voucher\'] = $this->language->get(\'entry_voucher\'); \n $data[\'button_voucher\'] = $this->language->get(\'button_voucher\'); \n $data[\'voucher\'] = $this->getProperty($this->session->data, \'voucher\'); \n \n $points = $this->customer->getRewardPoints(); \n \n $points_total = 0; \n \n foreach ($this->cart->getProducts() as $product) { \n if ($product[\'points\']) { \n $points_total += $product[\'points\']; \n } \n } \n \n if (@$_data[\'so_checkout_account\'] == \'login\') { \n $data[\'reward_status\'] = $points && $points_total && $this->config->get(\'reward_status\') && $setting_so_onepagecheckout_layout_setting[\'reward_login_status\']; \n }else if (@$_data[\'so_checkout_account\'] == \'register\') { \n $data[\'reward_status\'] = $points && $points_total && $this->config->get(\'reward_status\') && $setting_so_onepagecheckout_layout_setting[\'reward_register_status\']; \n }else if (@$_data[\'so_checkout_account\'] == \'guest\') { \n $data[\'reward_status\'] = $points && $points_total && $this->config->get(\'reward_status\') && $setting_so_onepagecheckout_layout_setting[\'reward_guest_status\']; \n } \n else { \n $data[\'reward_status\'] = $points && $points_total && $this->config->get(\'reward_status\'); \n } \n $data[\'entry_reward\'] = $this->language->get(\'entry_reward\'); \n $data[\'button_reward\'] = $this->language->get(\'button_reward\'); \n $data[\'reward\'] = $this->getProperty($this->session->data, \'reward\'); \n \n return $this->load->view(\'extension/module/so_onepagecheckout/checkout/coupon_voucher_reward\', $data); \n } \n \n public function cart($load = false) { \n $this->load->model(\'setting/setting\'); \n $setting_so_onepagecheckout = $this->model_setting_setting->getSetting(\'so_onepagecheckout\'); \n $setting_so_onepagecheckout_general = $setting_so_onepagecheckout[\'so_onepagecheckout_general\']; \n $setting_so_onepagecheckout_layout_setting = $setting_so_onepagecheckout[\'so_onepagecheckout_layout_setting\']; \n \n $data[\'text_recurring_item\'] = $this->language->get(\'text_recurring_item\'); \n $data[\'text_payment_recurring\'] = $this->language->get(\'text_payment_recurring\'); \n $data[\'text_shopping_cart\'] = $this->language->get(\'text_shopping_cart\'); \n $data[\'text_payment_detail\'] = $this->language->get(\'text_payment_detail\'); \n \n $data[\'button_update\'] = $this->language->get(\'button_update\'); \n $data[\'button_remove\'] = $this->language->get(\'button_remove\'); \n \n $data[\'column_image\'] = $this->language->get(\'column_image\'); \n $data[\'column_name\'] = $this->language->get(\'column_name\'); \n $data[\'column_model\'] = $this->language->get(\'column_model\'); \n $data[\'column_quantity\'] = $this->language->get(\'column_quantity\'); \n $data[\'column_price\'] = $this->language->get(\'column_price\'); \n $data[\'column_total\'] = $this->language->get(\'column_total\'); \n \n $data[\'products\'] = $this->model_extension_module_so_onepagecheckout->getProducts(); \n $data[\'vouchers\'] = $this->model_extension_module_so_onepagecheckout->getVouchers(); \n $data[\'totals\'] = $this->model_extension_module_so_onepagecheckout->getTotals(); \n \n if ($value = $this->getProperty($this->session->data, \'payment_method.code\')) { \n if (version_compare(VERSION, \'2.3\', \'<\')) { \n $data[\'payment\'] = $this->load->controller(\'payment/\' . $value); \n } else { \n $data[\'payment\'] = $this->load->controller(\'extension/payment/\' . $value); \n } \n } else { \n $data[\'payment\'] = \'\'; \n } \n \n $data[\'session_data\'] = $this->session->data; \n \n if ($this->config->get(\'config_cart_weight\') && (isset($setting_so_onepagecheckout_layout_setting[\'show_product_weight\']) && $setting_so_onepagecheckout_layout_setting[\'show_product_weight\'])) { \n $data[\'weight\'] = $this->weight->format($this->cart->getWeight(), $this->config->get(\'config_weight_class_id\'), $this->language->get(\'decimal_point\'), $this->language->get(\'thousand_point\')); \n } else { \n $data[\'weight\'] = \'\'; \n } \n \n $data[\'setting_so_onepagecheckout_layout_setting\'] = $setting_so_onepagecheckout_layout_setting; \n \n if ($load) \n return $this->load->view(\'extension/module/so_onepagecheckout/checkout/cart\', $data); \n else \n return $this->response->setOutput($this->load->view(\'extension/module/so_onepagecheckout/checkout/cart\', $data)); \n } \n \n public function cart_update() { \n $session_update = $this->getProperty($this->request->post, \'key\'); \n $qty = $this->getProperty($this->request->post, \'quantity\'); \n $this->cart->update($session_update, $qty); \n \n $json = array(); \n \n if (!$this->checkCart()) { \n $json[\'redirect\'] = $this->url->link(\'checkout/cart\', \'\', true); \n } else { \n $json[\'total\'] = sprintf($this->language->get(\'text_items\'), $this->cart->countProducts() + (isset($this->session->data[\'vouchers\']) ? count($this->session->data[\'vouchers\']) : 0), $this->registry->get(\'currency\')->format($this->model_extension_module_so_onepagecheckout->getTotal(), $this->session->data[\'currency\'])); \n } \n \n echo json_encode($json); \n exit; \n } \n \n public function cart_delete() { \n $session_delete = $this->getProperty($this->request->post, \'key\'); \n \n $this->cart->remove($session_delete); \n \n unset($this->session->data[\'vouchers\'][$session_delete]); \n \n $json = array(); \n \n if (!$this->checkCart()) { \n $json[\'redirect\'] = $this->url->link(\'checkout/cart\', \'\', true); \n } else { \n $json[\'total\'] = sprintf($this->language->get(\'text_items\'), $this->cart->countProducts() + (isset($this->session->data[\'vouchers\']) ? count($this->session->data[\'vouchers\']) : 0), $this->registry->get(\'currency\')->format($this->model_extension_module_so_onepagecheckout->getTotal(), $this->session->data[\'currency\'])); \n } \n \n echo json_encode($json); \n exit; \n } \n \n private function checkCart() { \n // Validate cart has products and has stock. \n if ((!$this->cart->hasProducts() && empty($this->session->data[\'vouchers\'])) || (!$this->cart->hasStock() && !$this->config->get(\'config_stock_checkout\'))) { \n return false; \n } \n \n // Validate minimum quantity requirements. \n $products = $this->cart->getProducts(); \n \n foreach ($products as $product) { \n $product_total = 0; \n \n foreach ($products as $product_2) { \n if ($product_2[\'product_id\'] == $product[\'product_id\']) { \n $product_total += $product_2[\'quantity\']; \n } \n } \n \n if ($product[\'minimum\'] > $product_total) { \n return false; \n } \n } \n \n return true; \n } \n \n public function confirm() { \n /* exit if page is accessed via get method */ \n if ($this->request->server[\'REQUEST_METHOD\'] != \'POST\') { \n return; \n } \n $this->load->model(\'setting/setting\'); \n $setting_so_onepagecheckout = $this->model_setting_setting->getSetting(\'so_onepagecheckout\'); \n $setting_so_onepagecheckout_general = $setting_so_onepagecheckout[\'so_onepagecheckout_general\']; \n $setting_so_onepagecheckout_layout_setting = $setting_so_onepagecheckout[\'so_onepagecheckout_layout_setting\']; \n \n $order_data = $this->model_extension_module_so_onepagecheckout->getOrder(); \n \n $new_payment_address = null; \n $new_shipping_address = null; \n \n $register_account = $this->getProperty($this->request->post, \'account\', \'register\'); \n \n $errors = array(); \n $redirect_cart = \'\'; \n \n if (!$this->checkCart()) { \n $errors[\'cart\'] = \'\'; \n $redirect_cart = $this->url->link(\'checkout/cart\', \'\', true); \n } \n \n if ($this->isLoggedIn()) { \n // payment data \n if ($this->getProperty($this->request->post, \'payment_address\') === \'existing\') { \n $address_info = $this->model_account_address->getAddress($this->getProperty($this->request->post, \'payment_address_id\')); \n $order_data = array_replace($order_data, $this->getAddressData($address_info, \'\', \'payment_\')); \n } else { \n $new_payment_address = $this->getAddressData($this->request->post, \'payment_\', \'payment_\'); \n $order_data = array_replace($order_data, $new_payment_address); \n $errors = array_merge($errors, $this->validateAddressData($new_payment_address, \'payment_\')); \n } \n \n // shipping data \n if ($this->isShippingRequired()) { \n if ($this->getProperty($this->request->post, \'shipping_address\') === \'existing\') { \n $address_info = $this->model_account_address->getAddress($this->getProperty($this->request->post, \'shipping_address_id\')); \n $order_data = array_replace($order_data, $this->getAddressData($address_info, \'\', \'shipping_\')); \n } else { \n $new_shipping_address = $this->getAddressData($this->request->post, \'shipping_\', \'shipping_\'); \n $order_data = array_replace($order_data, $new_shipping_address); \n $errors = array_merge($errors, $this->validateAddressData($new_shipping_address, \'shipping_\')); \n } \n } \n \n // customer data \n if (!$errors) { \n $customer_info = $this->model_account_customer->getCustomer($this->customer->getId()); \n \n $order_data[\'customer_id\'] = $this->customer->getId(); \n $order_data[\'customer_group_id\'] = $customer_info[\'customer_group_id\']; \n $order_data[\'firstname\'] = $customer_info[\'firstname\']; \n $order_data[\'lastname\'] = $customer_info[\'lastname\']; \n $order_data[\'email\'] = $customer_info[\'email\']; \n $order_data[\'telephone\'] = $customer_info[\'telephone\']; \n $order_data[\'fax\'] = $customer_info[\'fax\']; \n $order_data[\'custom_field\'] = version_compare(VERSION, \'2.1\', \'>=\') ? json_decode($customer_info[\'custom_field\'], true) : unserialize($customer_info[\'custom_field\']); \n } \n } else { \n // check firstname, lastname \n $errors = array_merge($errors, $this->validateUserData($this->request->post, $register_account)); \n \n // check customer group id \n if (isset($this->request->post[\'customer_group_id\']) && is_array($this->config->get(\'config_customer_group_display\')) && in_array($this->request->post[\'customer_group_id\'], $this->config->get(\'config_customer_group_display\'))) { \n $order_data[\'customer_group_id\'] = $this->request->post[\'customer_group_id\']; \n } else { \n $order_data[\'customer_group_id\'] = $this->config->get(\'config_customer_group_id\'); \n } \n \n if (!isset($this->request->post[\'account\'])) { \n $errors[\'account\'] = array_merge($errors, array(\'Does not account exists! Please check configuration\')); \n } \n \n // check passwords if register \n if (($register_account == \'register\') && isset($this->request->post[\'account\'])) { \n $errors = array_merge($errors, $this->validatePassword($this->request->post)); \n } \n \n // check payment address \n $new_payment_address = $this->getAddressData($this->request->post, \'payment_\', \'payment_\'); \n $order_data = array_replace($order_data, $new_payment_address); \n $errors = array_merge($errors, $this->validateAddressData($new_payment_address, \'payment_\', false)); \n \n // add payment firstname and lastname \n $order_data[\'firstname\'] = $this->request->post[\'firstname\']; \n $order_data[\'lastname\'] = $this->request->post[\'lastname\']; \n $order_data[\'email\'] = $this->request->post[\'email\']; \n $order_data[\'telephone\'] = $this->request->post[\'telephone\']; \n $order_data[\'fax\'] = $this->request->post[\'fax\']; \n $order_data[\'custom_field\'] = $this->getProperty($this->request->post, \'custom_field\', array()); \n $order_data[\'payment_firstname\'] = $order_data[\'firstname\']; \n $order_data[\'payment_lastname\'] = $order_data[\'lastname\']; \n \n // check delivery address \n if ($this->isShippingRequired()) { \n if (!$this->getProperty($this->request->post, \'shipping_address\')) { \n $new_shipping_address = $this->getAddressData($this->request->post, \'shipping_\', \'shipping_\'); \n $order_data = array_replace($order_data, $new_shipping_address); \n $errors = array_merge($errors, $this->validateAddressData($new_shipping_address, \'shipping_\')); \n } else { \n $order_data = array_replace($order_data, $this->getAddressData($order_data, \'payment_\', \'shipping_\')); \n } \n } \n } \n \n // payment method \n if ($payment_method = $this->getProperty($this->session->data, \'payment_methods.\' . $this->getProperty($this->request->post, \'payment_method\') . \'.title\')) { \n $order_data[\'payment_method\'] = $payment_method; \n $order_data[\'payment_code\'] = $this->getProperty($this->request->post, \'payment_method\'); \n } else { \n $errors[\'payment_method\'] = str_replace(\'&nbsp;\', \'\', strip_tags($this->language->get(\'error_no_payment\'))); \n } \n \n // shipping method \n if ($this->isShippingRequired()) { \n $shipping = explode(\'.\', $this->getProperty($this->request->post, \'shipping_method\')); \n if (is_array($shipping) && count($shipping) > 1) { \n $shipping_method = $this->session->data[\'shipping_methods\'][$shipping[0]][\'quote\'][$shipping[1]]; \n if ($shipping_method) { \n $order_data[\'shipping_method\'] = $shipping_method[\'title\']; \n $order_data[\'shipping_code\'] = $this->getProperty($this->request->post, \'shipping_method\'); \n } else { \n $order_data[\'shipping_method\'] = \'no shipping method\'; \n $errors[\'shipping_method\'] = str_replace(\'&nbsp;\', \'\', strip_tags($this->language->get(\'error_no_shipping\'))); \n } \n } else { \n $order_data[\'shipping_method\'] = \'no shipping method\'; \n $errors[\'shipping_method\'] = str_replace(\'&nbsp;\', \'\', strip_tags($this->language->get(\'error_no_shipping\'))); \n } \n } \n \n // order totals \n $totals = array(); \n $taxes = $this->cart->getTaxes(); \n $total = 0; \n \n // Because __call can not keep var references so we put them into an array. \n $total_data = array( \n \'totals\' => &$totals, \n \'taxes\' => &$taxes, \n \'total\' => &$total \n ); \n \n $this->load->model(\'extension/extension\'); \n $results = $this->model_extension_extension->getExtensions(\'total\'); \n \n $sort_order = array(); \n \n foreach ($results as $key => $value) { \n $sort_order[$key] = $this->config->get($value[\'code\'] . \'_sort_order\'); \n } \n \n array_multisort($sort_order, SORT_ASC, $results); \n \n foreach ($results as $result) { \n if ($this->config->get($result[\'code\'] . \'_status\')) { \n if (version_compare(VERSION, \'2.3\', \'<\')) { \n $this->load->model(\'total/\' . $result[\'code\']); \n } else { \n $this->load->model(\'extension/total/\' . $result[\'code\']); \n } \n \n if (version_compare(VERSION, \'2.2\', \'<\')) { \n $this->{\'model_total_\' . $result[\'code\']}->getTotal($totals, $total, $taxes); \n } else if (version_compare(VERSION, \'2.3\', \'<\')) { \n // We have to put the totals in an array so that they pass by reference. \n $this->{\'model_total_\' . $result[\'code\']}->getTotal($total_data); \n } else { \n // We have to put the totals in an array so that they pass by reference. \n $this->{\'model_extension_total_\' . $result[\'code\']}->getTotal($total_data); \n } \n } \n } \n \n $sort_order = array(); \n \n foreach ($totals as $key => $value) { \n $sort_order[$key] = $value[\'sort_order\']; \n } \n \n array_multisort($sort_order, SORT_ASC, $totals); \n \n $order_data[\'totals\'] = $totals; \n $order_data[\'total\'] = $total; \n \n // order products \n $order_data[\'products\'] = array(); \n \n foreach ($this->cart->getProducts() as $product) { \n $option_data = array(); \n \n foreach ($product[\'option\'] as $option) { \n $option_data[] = array( \n \'product_option_id\' => $option[\'product_option_id\'], \n \'product_option_value_id\' => $option[\'product_option_value_id\'], \n \'option_id\' => $option[\'option_id\'], \n \'option_value_id\' => $option[\'option_value_id\'], \n \'name\' => $option[\'name\'], \n \'value\' => $option[\'value\'], \n \'type\' => $option[\'type\'] \n ); \n } \n \n $order_data[\'products\'][] = array( \n \'product_id\' => $product[\'product_id\'], \n \'name\' => $product[\'name\'], \n \'model\' => $product[\'model\'], \n \'option\' => $option_data, \n \'download\' => $product[\'download\'], \n \'quantity\' => $product[\'quantity\'], \n \'subtract\' => $product[\'subtract\'], \n \'price\' => $product[\'price\'], \n \'total\' => $product[\'total\'], \n \'tax\' => $this->tax->getTax($product[\'price\'], $product[\'tax_class_id\']), \n \'reward\' => $product[\'reward\'] \n ); \n } \n \n // Gift Voucher \n $order_data[\'vouchers\'] = array(); \n \n if (!empty($this->session->data[\'vouchers\'])) { \n foreach ($this->session->data[\'vouchers\'] as $voucher) { \n $order_data[\'vouchers\'][] = array( \n \'description\' => $voucher[\'description\'], \n \'code\' => substr(md5(mt_rand()), 0, 10), \n \'to_name\' => $voucher[\'to_name\'], \n \'to_email\' => $voucher[\'to_email\'], \n \'from_name\' => $voucher[\'from_name\'], \n \'from_email\' => $voucher[\'from_email\'], \n \'voucher_theme_id\' => $voucher[\'voucher_theme_id\'], \n \'message\' => $voucher[\'message\'], \n \'amount\' => $voucher[\'amount\'] \n ); \n } \n } \n \n // comment + checkboxes \n $order_data[\'comment\'] = $this->getProperty($this->request->post, \'comment\'); \n if ($setting_so_onepagecheckout_layout_setting[\'require_comment_status\'] == 1 && empty($order_data[\'comment\'])) { \n $errors[\'comment\'] = $this->language->get(\'error_comment\'); \n } \n \n if (!$this->isLoggedIn() && $this->config->get(\'config_account_id\')) { \n $this->load->model(\'catalog/information\'); \n \n $information_info = $this->model_catalog_information->getInformation($this->config->get(\'config_account_id\')); \n \n if ($information_info && !isset($this->request->post[\'privacy\'])) { \n $errors[\'privacy\'] = sprintf($this->language->get(\'error_agree\'), $information_info[\'title\']); \n } \n } \n \n if ($this->config->get(\'config_checkout_id\')) { \n $this->load->model(\'catalog/information\'); \n \n $information_info = $this->model_catalog_information->getInformation($this->config->get(\'config_checkout_id\')); \n \n if ($information_info && !isset($this->request->post[\'agree\'])) { \n $errors[\'agree\'] = sprintf($this->language->get(\'error_agree\'), $information_info[\'title\']); \n } \n } \n \n if (isset($errors[\'agree\']) && empty($setting_so_onepagecheckout_layout_setting[\'show_term\'])) { \n unset($errors[\'agree\']); \n } \n \n if ($this->config->get(\'config_account_id\') == $this->config->get(\'config_checkout_id\')) { \n unset($errors[\'privacy\']); \n } \n \n $redirect = \'\'; \n \n // update order \n $this->model_extension_module_so_onepagecheckout->setOrderData($order_data); \n \n if ($this->getProperty($this->request->get, \'saveOnly\') === \'true\') { \n header(\'Content-Type: application/json\'); \n echo json_encode(array( \n \'order_data\'=> $order_data \n )); \n exit; \n } \n \n if (!$errors) { \n if ($this->isLoggedIn()) { \n // save new payment address \n if ($new_payment_address) { \n $this->model_account_address->addAddress($this->getAddressData($new_payment_address, \'payment_\')); \n } \n \n // save new shipping address \n if ($new_shipping_address && $new_shipping_address !== $new_payment_address) { \n $this->model_account_address->addAddress($this->getAddressData($new_shipping_address, \'shipping_\')); \n } \n \n $this->model_extension_module_so_onepagecheckout->updateCustomer(); \n } else if ($register_account == \'register\') { \n $redirect = $this->registerAccount(); \n $sql = \"UPDATE `\" . DB_PREFIX . \"order` SET customer_id = \'\" . (int)($this->customer->getId()) . \"\', customer_group_id = \'\" . (int)($this->customer->getGroupId()) . \"\' WHERE order_id = \'\" . (int)($this->session->data[\'order_id\']) . \"\'\"; \n $this->db->query($sql); \n } else { \n $this->session->data[\'guest\'] = $this->getAddressData($order_data, \'payment_\'); \n } \n } \n \n $this->session->data[\'so_checkout_account\'] = $this->getProperty($this->request->post, \'account\'); \n $this->session->data[\'so_checkout_shipping_address\'] = $this->getProperty($this->request->post, \'shipping_address\', \'0\'); \n \n // send response \n header(\'Content-Type: application/json\'); \n echo json_encode(array( \n \'errors\' => $errors ? $errors : null, \n \'account_status\' => $this->isLoggedIn() ? 1 : 0, \n \'redirect\' => $redirect, \n \'redirect_cart\' => $redirect_cart, \n \'order_data\'=> $order_data \n )); \n exit; \n } \n \n private function validateAddressData($data, $key, $name = true) { \n $errors = array(); \n \n if ($name) { \n // firstname \n if ((utf8_strlen(trim($data[$key . \'firstname\'])) < 1) || (utf8_strlen(trim($data[$key . \'firstname\'])) > 32)) { \n $errors[$key . \'firstname\'] = $this->language->get(\'error_firstname\'); \n } \n \n // lastname \n if ((utf8_strlen(trim($data[$key . \'lastname\'])) < 1) || (utf8_strlen(trim($data[$key . \'lastname\'])) > 32)) { \n $errors[$key . \'lastname\'] = $this->language->get(\'error_lastname\'); \n } \n } \n \n if ((utf8_strlen(trim($data[$key . \'address_1\'])) < 3) || (utf8_strlen(trim($data[$key . \'address_1\'])) > 128)) { \n $errors[$key . \'address_1\'] = $this->language->get(\'error_address_1\'); \n } \n \n if ((utf8_strlen($data[$key . \'city\']) < 2) || (utf8_strlen($data[$key . \'city\']) > 32)) { \n $errors[$key . \'city\'] = $this->language->get(\'error_city\'); \n } \n \n $country_info = $this->model_localisation_country->getCountry($data[$key . \'country_id\']); \n \n if ($country_info && $country_info[\'postcode_required\'] && (utf8_strlen(trim($data[$key . \'postcode\'])) < 2 || utf8_strlen(trim($data[$key . \'postcode\'])) > 10)) { \n $errors[$key . \'postcode\'] = $this->language->get(\'error_postcode\'); \n } \n \n if ($data[$key . \'country_id\'] == \'\') { \n $errors[$key . \'country\'] = $this->language->get(\'error_country\'); \n } \n \n if (!isset($data[$key . \'zone_id\']) || $data[$key . \'zone_id\'] == \'\' || !is_numeric($data[$key . \'zone_id\'])) { \n $errors[$key . \'zone\'] = $this->language->get(\'error_zone\'); \n } \n \n // Custom field validation \n $custom_fields = $this->model_extension_module_so_onepagecheckout->getCustomFields(); \n foreach ($custom_fields as $custom_field) { \n if (($custom_field[\'location\'] == \'address\') && $custom_field[\'required\'] && empty($data[$key . \'custom_field\'][$custom_field[\'custom_field_id\']])) { \n $errors[$key . \'custom_field\' . $custom_field[\'custom_field_id\']] = sprintf($this->language->get(\'error_custom_field\'), $custom_field[\'name\']); \n } \n } \n \n return $errors; \n } \n \n private function validateUserData($data, $register) { \n $errors = array(); \n \n // firstname \n if ((utf8_strlen(trim($data[\'firstname\'])) < 1) || (utf8_strlen(trim($data[\'firstname\'])) > 32)) { \n $errors[\'firstname\'] = $this->language->get(\'error_firstname\'); \n } \n \n // lastname \n if ((utf8_strlen(trim($data[\'lastname\'])) < 1) || (utf8_strlen(trim($data[\'lastname\'])) > 32)) { \n $errors[\'lastname\'] = $this->language->get(\'error_lastname\'); \n } \n \n // email \n if ((utf8_strlen($data[\'email\']) > 96) || !preg_match(\'/^[^\\@]+@.*.[a-z]{2,15}$/i\', $data[\'email\'])) { \n $errors[\'email\'] = $this->language->get(\'error_email\'); \n } else if ($register && $this->model_account_customer->getTotalCustomersByEmail($data[\'email\'])) { \n $errors[\'email\'] = $this->language->get(\'error_exists\'); \n } \n \n // telephone \n if ((utf8_strlen($data[\'telephone\']) < 3) || (utf8_strlen($data[\'telephone\']) > 32)) { \n $errors[\'telephone\'] = $this->language->get(\'error_telephone\'); \n } \n \n // Custom field validation \n $custom_fields = $this->model_extension_module_so_onepagecheckout->getCustomFields(); \n \n foreach ($custom_fields as $custom_field) { \n if (($custom_field[\'location\'] == \'account\') && $custom_field[\'required\'] && empty($data[\'custom_field\'][$custom_field[\'custom_field_id\']])) { \n $errors[\'custom_field\' . $custom_field[\'custom_field_id\']] = sprintf($this->language->get(\'error_custom_field\'), $custom_field[\'name\']); \n } \n } \n \n return $errors; \n } \n \n private function validatePassword($data) { \n $errors = array(); \n \n if ((utf8_strlen($data[\'password\']) < 4) || (utf8_strlen($data[\'password\']) > 20)) { \n $errors[\'password\'] = $this->language->get(\'error_password\'); \n } \n \n if ($data[\'confirm\'] != $data[\'password\']) { \n $errors[\'confirm\'] = $this->language->get(\'error_confirm\'); \n } \n \n return $errors; \n } \n \n private function getAddressData($array, $i_address = \'\', $prefix = \'\') { \n $keys = array( \n \'address_1\', \n \'address_2\', \n \'address_id\', \n \'address_format\', \n \'city\', \n \'company\', \n \'company_id\', \n \'country\', \n \'country_id\', \n \'firstname\', \n \'lastname\', \n \'method\', \n \'postcode\', \n \'tax_id\', \n \'zone\', \n \'zone_id\' \n ); \n \n $result = array(); \n \n foreach ($keys as $k) { \n $result[$prefix . $k] = $this->getProperty($array, $i_address . $k, \'\'); \n } \n \n if ($result[$prefix . \'country_id\']) { \n $country_info = $this->model_localisation_country->getCountry($result[$prefix . \'country_id\']); \n if ($country_info) { \n if (!$result[$prefix . \'country\']) { \n $result[$prefix . \'country\'] = $country_info[\'name\']; \n } \n $result[$prefix . \'address_format\'] = $country_info[\'address_format\']; \n } \n } \n \n if (!$result[$prefix . \'zone\'] && $result[$prefix . \'zone_id\']) { \n $zone_info = $this->model_localisation_zone->getZone($result[$prefix . \'zone_id\']); \n if ($zone_info) { \n $result[$prefix . \'zone\'] = $zone_info[\'name\']; \n } \n } \n \n $result[$prefix . \'custom_field\'] = $this->getProperty($array, $i_address . \'custom_field\', array()); \n \n return $result; \n } \n \n private function registerAccount() { \n $redirect = \'\'; \n \n $data = $this->getAddressData($this->request->post, \'payment_\'); \n \n $data = array_merge($data, array( \n \'firstname\' => $this->getProperty($this->request->post, \'firstname\'), \n \'lastname\' => $this->getProperty($this->request->post, \'lastname\'), \n \'customer_group_id\'=> $this->getProperty($this->request->post, \'customer_group_id\', $this->config->get(\'config_customer_group_id\')), \n \'custom_field\' => array( \n \'account\' => $this->getProperty($this->request->post, \'custom_field\'), \n \'address\' => $this->getProperty($this->request->post, \'payment_custom_field\'), \n ), \n \'email\' => $this->getProperty($this->request->post, \'email\'), \n \'telephone\' => $this->getProperty($this->request->post, \'telephone\'), \n \'fax\' => $this->getProperty($this->request->post, \'fax\'), \n \'password\' => $this->getProperty($this->request->post, \'password\'), \n \'newsletter\' => $this->getProperty($this->request->post, \'newsletter\') \n )); \n \n $customer_id = $this->model_account_customer->addCustomer($data); \n \n // Clear any previous login attempts for unregistered accounts. \n $this->model_account_customer->deleteLoginAttempts($data[\'email\']); \n \n $this->session->data[\'account\'] = \'register\'; \n \n $customer_group_info = $this->model_account_customer_group->getCustomerGroup($this->getProperty($this->request->post, \'customer_group_id\', $this->config->get(\'config_customer_group_id\'))); \n \n if ($customer_group_info && !$customer_group_info[\'approval\']) { \n $this->customer->login($data[\'email\'], $data[\'password\']); \n \n if ($this->getProperty($this->request->post, \'shipping_address\') != \'1\') { \n $this->model_account_address->addAddress($this->getAddressData($this->request->post, \'shipping_\')); \n } \n \n // Add to activity log \n $activity_data = array( \n \'customer_id\' => $customer_id, \n \'name\' => $data[\'firstname\'] . \' \' . $data[\'lastname\'] \n ); \n \n $this->model_account_activity->addActivity(\'register\', $activity_data); \n } \n else { \n $redirect = $this->url->link(\'account/success\'); \n } \n \n return $redirect; \n } \n \n public function login() { \n $json = array(); \n \n if ($this->customer->isLogged()) { \n $json[\'redirect\'] = $this->url->link(\'checkout/checkout\', \'\', true); \n } \n \n if ((!$this->cart->hasProducts() && empty($this->session->data[\'vouchers\'])) || (!$this->cart->hasStock() && !$this->config->get(\'config_stock_checkout\'))) { \n $json[\'redirect\'] = $this->url->link(\'checkout/cart\', \'\', true); \n } \n \n if (!$json) { \n $this->load->model(\'account/customer\'); \n \n // Check how many login attempts have been made. \n $login_info = $this->model_account_customer->getLoginAttempts($this->request->post[\'email\']); \n \n if ($login_info && ($login_info[\'total\'] >= $this->config->get(\'config_login_attempts\')) && strtotime(\'-1 hour\') < strtotime($login_info[\'date_modified\'])) { \n $json[\'error\'][\'warning\'] = $this->language->get(\'error_attempts\'); \n } \n \n // Check if customer has been approved. \n $customer_info = $this->model_account_customer->getCustomerByEmail($this->request->post[\'email\']); \n \n if ($customer_info && !$customer_info[\'approved\']) { \n $json[\'error\'][\'warning\'] = $this->language->get(\'error_approved\'); \n } \n \n if (!isset($json[\'error\'])) { \n if (!$this->customer->login($this->request->post[\'email\'], $this->request->post[\'password\'])) { \n $json[\'error\'][\'warning\'] = $this->language->get(\'error_login\'); \n \n $this->model_account_customer->addLoginAttempt($this->request->post[\'email\']); \n } else { \n $this->model_account_customer->deleteLoginAttempts($this->request->post[\'email\']); \n } \n } \n } \n \n if (!$json) { \n unset($this->session->data[\'guest\']); \n \n $this->load->model(\'account/address\'); \n \n $address_info = $this->model_account_address->getAddress($this->customer->getAddressId()); \n \n if ($this->config->get(\'config_tax_customer\') == \'payment\') { \n $this->session->data[\'payment_address\'] = $address_info; \n } \n \n if ($this->config->get(\'config_tax_customer\') == \'shipping\') { \n $this->session->data[\'shipping_address\'] = $address_info; \n } \n \n $this->model_extension_module_so_onepagecheckout->setAddress(\'shipping\', $address_info); \n $this->model_extension_module_so_onepagecheckout->setAddress(\'payment\', $address_info); \n $this->model_extension_module_so_onepagecheckout->save(); \n \n $json[\'redirect\'] = $this->url->link(\'checkout/checkout\', \'\', true); \n \n // Add to activity log \n $this->load->model(\'account/activity\'); \n \n $activity_data = array( \n \'customer_id\' => $this->customer->getId(), \n \'name\' => $this->customer->getFirstName() . \' \' . $this->customer->getLastName() \n ); \n \n $this->model_account_activity->addActivity(\'login\', $activity_data); \n } \n \n $this->response->addHeader(\'Content-Type: application/json\'); \n $this->response->setOutput(json_encode($json)); \n } \n ]]></add> \n </operation> \n \n <operation error=\"log\"> \n <search ><![CDATA[$data[\'breadcrumbs\'] = array();]]></search> \n <add position=\"before\"><![CDATA[ \n $this->load->model(\'setting/setting\'); \n $setting_so_onepagecheckout = $this->model_setting_setting->getSetting(\'so_onepagecheckout\'); \n if (isset($setting_so_onepagecheckout) && count($setting_so_onepagecheckout)>0) { \n $setting_so_onepagecheckout_general = $setting_so_onepagecheckout[\'so_onepagecheckout_general\']; \n if (isset($setting_so_onepagecheckout_general[\'so_onepagecheckout_enabled\']) && $setting_so_onepagecheckout_general[\'so_onepagecheckout_enabled\']) { \n $this->document->addStyle(\'catalog/view/javascript/so_onepagecheckout/css/so_onepagecheckout.css\'); \n $this->document->addScript(\'catalog/view/javascript/so_onepagecheckout/js/so_onepagecheckout.js\'); \n $this->load->model(\'localisation/country\'); \n $data[\'countries\'] = $this->model_localisation_country->getCountries(); \n } \n } \n ]]></add> \n </operation> \n \n <operation error=\"log\"> \n <search ><![CDATA[$this->response->setOutput($this->load->view(\'checkout/checkout\', $data));]]></search> \n <add position=\"before\"><![CDATA[ \n $this->load->model(\'setting/setting\'); \n $setting_so_onepagecheckout = $this->model_setting_setting->getSetting(\'so_onepagecheckout\'); \n if (isset($setting_so_onepagecheckout) && count($setting_so_onepagecheckout)>0) { \n $setting_so_onepagecheckout_general = $setting_so_onepagecheckout[\'so_onepagecheckout_general\']; \n $setting_so_onepagecheckout_layout_setting = $setting_so_onepagecheckout[\'so_onepagecheckout_layout_setting\']; \n \n if (isset($setting_so_onepagecheckout_general[\'so_onepagecheckout_enabled\']) && $setting_so_onepagecheckout_general[\'so_onepagecheckout_enabled\']) { \n if (isset($setting_so_onepagecheckout_layout_setting[\'so_onepagecheckout_account_open\']) && !empty($setting_so_onepagecheckout_layout_setting[\'so_onepagecheckout_account_open\'])) { \n $data[\'default_auth\'] = $setting_so_onepagecheckout_layout_setting[\'so_onepagecheckout_account_open\']; \n } \n else { \n $data[\'default_auth\'] = $this->getProperty($this->session->data, \'so_checkout_account\', \'register\'); \n } \n \n $data[\'setting_so_onepagecheckout\'] = $setting_so_onepagecheckout; \n $data[\'setting_so_onepagecheckout_general\'] = $setting_so_onepagecheckout_general; \n $data[\'setting_so_onepagecheckout_layout_setting\'] = $setting_so_onepagecheckout_layout_setting; \n \n $data[\'text_register\'] = $this->language->get(\'text_register\'); \n $data[\'text_guest\'] = $this->language->get(\'text_guest\'); \n $data[\'entry_email\'] = $this->language->get(\'entry_email\'); \n $data[\'entry_password\'] = $this->language->get(\'entry_password\'); \n $data[\'text_forgotten\'] = $this->language->get(\'text_forgotten\'); \n $data[\'text_loading\'] = $this->language->get(\'text_loading\'); \n $data[\'button_login\'] = $this->language->get(\'button_login\'); \n $data[\'text_i_am_returning_customer\'] = $this->language->get(\'text_i_am_returning_customer\'); \n $data[\'text_returning_customer\'] = $this->language->get(\'text_returning_customer\'); \n $data[\'text_checkout_create_account_login\'] = $this->language->get(\'text_checkout_create_account_login\'); \n \n $data[\'text_your_details\'] = $this->language->get(\'text_your_details\'); \n $data[\'entry_customer_group\'] = $this->language->get(\'entry_customer_group\'); \n $data[\'entry_firstname\'] = $this->language->get(\'entry_firstname\'); \n $data[\'entry_lastname\'] = $this->language->get(\'entry_lastname\'); \n $data[\'entry_telephone\'] = $this->language->get(\'entry_telephone\'); \n $data[\'entry_fax\'] = $this->language->get(\'entry_fax\'); \n $data[\'text_your_password\'] = $this->language->get(\'text_your_password\'); \n $data[\'entry_confirm\'] = $this->language->get(\'entry_confirm\'); \n $data[\'text_your_address\'] = $this->language->get(\'text_your_address\'); \n $data[\'entry_shipping\'] = $this->language->get(\'entry_shipping\'); \n $data[\'text_confirm_order\'] = $this->language->get(\'text_confirm_order\'); \n \n // address data \n if ($this->isLoggedIn()) { \n $data[\'is_logged_in\'] = true; \n $data[\'payment_address\'] = $this->renderAddressForm(\'payment\'); \n $data[\'shipping_address\'] = $this->renderAddressForm(\'shipping\'); \n $data[\'register_form\'] = \'\'; \n } else { \n $data[\'is_logged_in\'] = false; \n $data[\'allow_guest_checkout\'] = $this->allowGuestCheckout(); \n $data[\'register_form\'] = $this->renderRegisterForm(); \n } \n \n // shipping \n if ($this->isShippingRequired() && $setting_so_onepagecheckout_layout_setting[\'delivery_method_status\']) { \n $data[\'is_shipping_required\'] = true; \n $data[\'shipping_methods\'] = $this->shipping(true); \n } else { \n $data[\'is_shipping_required\'] = false; \n } \n \n // payment \n $data[\'payment_methods\'] = $this->payment(true); \n \n // coupon + voucher \n $data[\'coupon_voucher_reward\'] = $this->renderCouponVoucherReward(); \n \n // cart \n if (isset($setting_so_onepagecheckout_layout_setting[\'shopping_cart_status\']) && $setting_so_onepagecheckout_layout_setting[\'shopping_cart_status\']) { \n $data[\'cart\'] = $this->cart(true); \n } \n else { \n $data[\'cart\'] = \'\'; \n } \n \n // checkboxes \n if (!$this->isLoggedIn() && $this->config->get(\'config_account_id\')) { \n $this->load->model(\'catalog/information\'); \n \n $information_info = $this->model_catalog_information->getInformation($this->config->get(\'config_account_id\')); \n \n if ($information_info) { \n $data[\'text_privacy\'] = sprintf($this->language->get(\'text_agree\'), $this->url->link(\'information/information/agree\', \'information_id=\' . $this->config->get(\'config_account_id\'), true), $information_info[\'title\'], $information_info[\'title\']); \n } else { \n $data[\'text_privacy\'] = \'\'; \n } \n } else { \n $data[\'text_privacy\'] = \'\'; \n } \n \n if ($this->config->get(\'config_checkout_id\')) { \n $this->load->model(\'catalog/information\'); \n \n $information_info = $this->model_catalog_information->getInformation($this->config->get(\'config_checkout_id\')); \n \n if ($information_info) { \n $data[\'text_agree\'] = sprintf($this->language->get(\'text_agree\'), $this->url->link(\'information/information/agree\', \'information_id=\' . $this->config->get(\'config_checkout_id\'), true), $information_info[\'title\'], $information_info[\'title\']); \n } else { \n $data[\'text_agree\'] = \'\'; \n } \n } else { \n $data[\'text_agree\'] = \'\'; \n } \n \n if ($data[\'text_privacy\'] === $data[\'text_agree\']) { \n $data[\'text_privacy\'] = \'\'; \n } \n \n $data[\'text_comments\'] = $this->language->get(\'text_comments\'); \n \n if ($this->isLoggedIn()) { \n $data[\'entry_newsletter\'] = false; \n } else { \n $data[\'entry_newsletter\'] = sprintf($this->language->get(\'entry_newsletter\'), $this->config->get(\'config_name\')); \n } \n \n $data[\'comment\'] = $this->model_extension_module_so_onepagecheckout->getComment(); \n \n if (isset($this->session->data[\'error\'])) { \n $data[\'error_warning\'] = $this->session->data[\'error\']; \n unset($this->session->data[\'error\']); \n } else { \n $data[\'error_warning\'] = \'\'; \n } \n \n $data[\'customer_groups\'] = array(); \n if (is_array($this->config->get(\'config_customer_group_display\'))) { \n $this->load->model(\'account/customer_group\'); \n \n $customer_groups = $this->model_account_customer_group->getCustomerGroups(); \n \n foreach ($customer_groups as $customer_group) { \n if (in_array($customer_group[\'customer_group_id\'], $this->config->get(\'config_customer_group_display\'))) { \n $data[\'customer_groups\'][] = $customer_group; \n } \n } \n } \n if (isset($this->request->post[\'customer_group_id\'])) { \n $data[\'customer_group_id\'] = $this->request->post[\'customer_group_id\']; \n } else { \n $data[\'customer_group_id\'] = $this->config->get(\'config_customer_group_id\'); \n } \n \n \n \n //Get cart \n $this->load->model(\'tool/image\'); \n $this->load->model(\'tool/upload\'); \n \n $data[\'products\'] = array(); \n $products = $this->cart->getProducts(); \n foreach ($products as $product) { \n $product_total = 0; \n \n foreach ($products as $product_2) { \n if ($product_2[\'product_id\'] == $product[\'product_id\']) { \n $product_total += $product_2[\'quantity\']; \n } \n } \n \n if ($product[\'minimum\'] > $product_total) { \n $data[\'error_warning\'] = sprintf($this->language->get(\'error_minimum\'), $product[\'name\'], $product[\'minimum\']); \n } \n \n if ($product[\'image\']) { \n $image = $this->model_tool_image->resize($product[\'image\'], $this->config->get($this->config->get(\'config_theme\') . \'_image_cart_width\'), $this->config->get($this->config->get(\'config_theme\') . \'_image_cart_height\')); \n } else { \n $image = \'\'; \n } \n \n $option_data = array(); \n \n foreach ($product[\'option\'] as $option) { \n if ($option[\'type\'] != \'file\') { \n $value = $option[\'value\']; \n } else { \n $upload_info = $this->model_tool_upload->getUploadByCode($option[\'value\']); \n \n if ($upload_info) { \n $value = $upload_info[\'name\']; \n } else { \n $value = \'\'; \n } \n } \n \n $option_data[] = array( \n \'name\' => $option[\'name\'], \n \'value\' => (utf8_strlen($value) > 20 ? utf8_substr($value, 0, 20) . \'..\' : $value) \n ); \n } \n \n // Display prices \n if ($this->customer->isLogged() || !$this->config->get(\'config_customer_price\')) { \n $unit_price = $this->tax->calculate($product[\'price\'], $product[\'tax_class_id\'], $this->config->get(\'config_tax\')); \n \n $price = $this->currency->format($unit_price, $this->session->data[\'currency\']); \n $total = $this->currency->format($unit_price * $product[\'quantity\'], $this->session->data[\'currency\']); \n } else { \n $price = false; \n $total = false; \n } \n \n $recurring = \'\'; \n \n if ($product[\'recurring\']) { \n $frequencies = array( \n \'day\' => $this->language->get(\'text_day\'), \n \'week\' => $this->language->get(\'text_week\'), \n \'semi_month\' => $this->language->get(\'text_semi_month\'), \n \'month\' => $this->language->get(\'text_month\'), \n \'year\' => $this->language->get(\'text_year\'), \n ); \n \n if ($product[\'recurring\'][\'trial\']) { \n $recurring = sprintf($this->language->get(\'text_trial_description\'), $this->currency->format($this->tax->calculate($product[\'recurring\'][\'trial_price\'] * $product[\'quantity\'], $product[\'tax_class_id\'], $this->config->get(\'config_tax\')), $this->session->data[\'currency\']), $product[\'recurring\'][\'trial_cycle\'], $frequencies[$product[\'recurring\'][\'trial_frequency\']], $product[\'recurring\'][\'trial_duration\']) . \' \'; \n } \n \n if ($product[\'recurring\'][\'duration\']) { \n $recurring .= sprintf($this->language->get(\'text_payment_description\'), $this->currency->format($this->tax->calculate($product[\'recurring\'][\'price\'] * $product[\'quantity\'], $product[\'tax_class_id\'], $this->config->get(\'config_tax\')), $this->session->data[\'currency\']), $product[\'recurring\'][\'cycle\'], $frequencies[$product[\'recurring\'][\'frequency\']], $product[\'recurring\'][\'duration\']); \n } else { \n $recurring .= sprintf($this->language->get(\'text_payment_cancel\'), $this->currency->format($this->tax->calculate($product[\'recurring\'][\'price\'] * $product[\'quantity\'], $product[\'tax_class_id\'], $this->config->get(\'config_tax\')), $this->session->data[\'currency\']), $product[\'recurring\'][\'cycle\'], $frequencies[$product[\'recurring\'][\'frequency\']], $product[\'recurring\'][\'duration\']); \n } \n } \n \n $data[\'products\'][] = array( \n \'cart_id\' => $product[\'cart_id\'], \n \'thumb\' => $image, \n \'name\' => $product[\'name\'], \n \'model\' => $product[\'model\'], \n \'option\' => $option_data, \n \'recurring\' => $recurring, \n \'quantity\' => $product[\'quantity\'], \n \'stock\' => $product[\'stock\'] ? true : !(!$this->config->get(\'config_stock_checkout\') || $this->config->get(\'config_stock_warning\')), \n \'reward\' => ($product[\'reward\'] ? sprintf($this->language->get(\'text_points\'), $product[\'reward\']) : \'\'), \n \'price\' => $price, \n \'total\' => $total, \n \'href\' => $this->url->link(\'product/product\', \'product_id=\' . $product[\'product_id\']) \n ); \n } \n \n // Gift Voucher \n $data[\'vouchers\'] = array(); \n \n if (!empty($this->session->data[\'vouchers\'])) { \n foreach ($this->session->data[\'vouchers\'] as $key => $voucher) { \n $data[\'vouchers\'][] = array( \n \'key\' => $key, \n \'description\' => $voucher[\'description\'], \n \'amount\' => $this->currency->format($voucher[\'amount\'], $this->session->data[\'currency\']), \n \'remove\' => $this->url->link(\'checkout/cart\', \'remove=\' . $key) \n ); \n } \n } \n \n // Totals \n $this->load->model(\'extension/extension\'); \n \n $totals = array(); \n $taxes = $this->cart->getTaxes(); \n $total = 0; \n \n // Because __call can not keep var references so we put them into an array. \n $total_data = array( \n \'totals\' => &$totals, \n \'taxes\' => &$taxes, \n \'total\' => &$total \n ); \n \n // Display prices \n if ($this->customer->isLogged() || !$this->config->get(\'config_customer_price\')) { \n $sort_order = array(); \n \n $results = $this->model_extension_extension->getExtensions(\'total\'); \n \n foreach ($results as $key => $value) { \n $sort_order[$key] = $this->config->get($value[\'code\'] . \'_sort_order\'); \n } \n \n array_multisort($sort_order, SORT_ASC, $results); \n \n foreach ($results as $result) { \n if ($this->config->get($result[\'code\'] . \'_status\')) { \n $this->load->model(\'extension/total/\' . $result[\'code\']); \n \n // We have to put the totals in an array so that they pass by reference. \n $this->{\'model_extension_total_\' . $result[\'code\']}->getTotal($total_data); \n } \n } \n \n $sort_order = array(); \n \n foreach ($totals as $key => $value) { \n $sort_order[$key] = $value[\'sort_order\']; \n } \n \n array_multisort($sort_order, SORT_ASC, $totals); \n } \n \n $data[\'totals\'] = array(); \n \n foreach ($totals as $total) { \n $data[\'totals\'][] = array( \n \'title\' => $total[\'title\'], \n \'text\' => $this->currency->format($total[\'value\'], $this->session->data[\'currency\']) \n ); \n } \n } \n } \n ]]></add> \n </operation> \n \n <operation error=\"log\"> \n <search ><![CDATA[$this->response->setOutput($this->load->view(\'checkout/checkout\', $data));]]></search> \n <add position=\"replace\"><![CDATA[ \n if (isset($setting_so_onepagecheckout_general[\'so_onepagecheckout_enabled\']) && $setting_so_onepagecheckout_general[\'so_onepagecheckout_enabled\']) { \n $data[\'forgotten\'] = $this->url->link(\'account/forgotten\', \'\', true); \n $this->model_extension_module_so_onepagecheckout->save(); \n if ($setting_so_onepagecheckout_general[\'so_onepagecheckout_layout\'] == 1) \n $this->response->setOutput($this->load->view(\'extension/module/so_onepagecheckout/default\', $data)); \n else if ($setting_so_onepagecheckout_general[\'so_onepagecheckout_layout\'] == 2) \n $this->response->setOutput($this->load->view(\'extension/module/so_onepagecheckout/default2\', $data)); \n } \n else { \n $this->response->setOutput($this->load->view(\'checkout/checkout\', $data)); \n } \n ]]></add> \n </operation> \n </file> \n</modification> \n',1,'2017-04-20 12:19:00'),
	(7,'So Product Label','so-product-label','OpenCartWorks','1.0.0','http://www.opencartworks.com/','<?xml version=\"1.0\" encoding=\"UTF-8\"?> \n<modification> \n <name>So Product Label</name> \n <code>so-product-label</code> \n <version>1.0.0</version> \n <author>OpenCartWorks</author> \n <link>http://www.opencartworks.com/</link> \n \n <file path=\"admin/view/template/extension/soconfig/mproduct_form.tpl\"> \n <operation> \n <search><![CDATA[ \n <li><a href=\"#tab-design\" data-toggle=\"tab\"><?php echo $tab_design; ?></a></li> \n ]]></search> \n <add position=\"after\"><![CDATA[ \n <li><a href=\"#tab-productlabel\" data-toggle=\"tab\"><?php echo $tab_productlabel; ?></a></li> \n ]]></add> \n </operation> \n \n <operation> \n <search><![CDATA[<div class=\"tab-pane\" id=\"tab-design\">]]></search> \n <add position=\"before\"><![CDATA[ \n <div class=\"tab-pane\" id=\"tab-productlabel\"> \n <div class=\"table-responsive\"> \n <table id=\"discount\" class=\"table table-striped table-bordered table-hover\"> \n <thead> \n <tr> \n <td class=\"text-left\" width=\"10%\"><?php echo $entry_position; ?></td> \n <td class=\"text-left\" width=\"10%\"><?php echo $entry_image; ?></td> \n <td class=\"text-left\" width=\"10%\"><?php echo $entry_text; ?></td> \n <td class=\"text-left\" width=\"7%\"><?php echo $entry_text_color; ?></td> \n <td class=\"text-left\" width=\"7%\"><?php echo $entry_bg_color; ?></td> \n <td class=\"text-left\" width=\"8%\"><?php echo $entry_text_font_size; ?></td> \n <td class=\"text-left\"><?php echo $entry_show_category; ?></td> \n <td class=\"text-left\"><?php echo $entry_show_product; ?></td> \n <td class=\"text-left\"><?php echo $entry_status; ?></td> \n <td class=\"text-left\"><?php echo $entry_type; ?></td> \n </tr> \n </thead> \n <tbody> \n <?php for ($i=0; $i<8;$i++) {?> \n <tr id=\"discount-row0\"> \n <td class=\"text-left\"> \n <select name=\"product_label[<?php echo $i?>][position]\" class=\"form-control\"> \n <option value=\"topleft\" <?php echo (isset($product_labels[$i][\'position\']) && $product_labels[$i][\'position\'] == \'topleft\') ? \'selected=\"selected\"\' : \'\'?>>Top-Left</option> \n <option value=\"topright\" <?php echo (isset($product_labels[$i][\'position\']) && $product_labels[$i][\'position\'] == \'topright\') ? \'selected=\"selected\"\' : \'\'?>>Top-Right</option> \n <option value=\"bottomleft\" <?php echo (isset($product_labels[$i][\'position\']) && $product_labels[$i][\'position\'] == \'bottomleft\') ? \'selected=\"selected\"\' : \'\'?>>Bottom-Left</option> \n <option value=\"bottomright\" <?php echo (isset($product_labels[$i][\'position\']) && $product_labels[$i][\'position\'] == \'bottomright\') ? \'selected=\"selected\"\' : \'\'?>>Bottom-Right</option> \n <option value=\"topcenter\" <?php echo (isset($product_labels[$i][\'position\']) && $product_labels[$i][\'position\'] == \'topcenter\') ? \'selected=\"selected\"\' : \'\'?>>Top-Center</option> \n <option value=\"bottomcenter\" <?php echo (isset($product_labels[$i][\'position\']) && $product_labels[$i][\'position\'] == \'bottomcenter\') ? \'selected=\"selected\"\' : \'\'?>>Bottom-Center</option> \n <option value=\"leftcenter\" <?php echo (isset($product_labels[$i][\'position\']) && $product_labels[$i][\'position\'] == \'leftcenter\') ? \'selected=\"selected\"\' : \'\'?>>Left-Center</option> \n <option value=\"rightcenter\" <?php echo (isset($product_labels[$i][\'position\']) && $product_labels[$i][\'position\'] == \'rightcenter\') ? \'selected=\"selected\"\' : \'\'?>>Right-Center</option> \n </select> \n </td> \n <td> \n <a href=\"\" id=\"so_thumb-image<?php echo $i?>\" data-toggle=\"image\" class=\"img-thumbnail\"> \n <img src=\"<?php echo isset($product_label_images[$i][\'thumb\']) ? $product_label_images[$i][\'thumb\'] : $so_product_label_thumb; ?>\" alt=\"\" title=\"\" data-placeholder=\"<?php echo $placeholder; ?>\" /> \n </a> \n <input type=\"hidden\" name=\"product_label[<?php echo $i?>][image]\" value=\"<?php echo isset($product_label_images[$i][\'image\']) ? $product_label_images[$i][\'image\'] : $placeholder?>\" id=\"so_input-image<?php echo $i?>\" /> \n <p></p> \n <p><input type=\"text\" name=\"product_label[<?php echo $i?>][width]\" placeholder=\"Width\" class=\"form-control\" value=\"<?php echo (isset($product_labels[$i][\'width\']) && $product_labels[$i][\'width\'] != 0) ? $product_labels[$i][\'width\'] : \'\'?>\" /></p> \n <p><input type=\"text\" name=\"product_label[<?php echo $i?>][height]\" placeholder=\"Height\" class=\"form-control\" value=\"<?php echo (isset($product_labels[$i][\'height\']) && $product_labels[$i][\'height\'] != 0) ? $product_labels[$i][\'height\'] : \'\'?>\" /></p> \n </td> \n <td><input type=\"text\" name=\"product_label[<?php echo $i?>][text]\" value=\"<?php echo isset($product_labels[$i][\'text\']) ? $product_labels[$i][\'text\'] : \'\'?>\" class=\"form-control\" /></td> \n <td><input type=\"color\" name=\"product_label[<?php echo $i?>][color]\" value=\"<?php echo isset($product_labels[$i][\'color\']) ? $product_labels[$i][\'color\'] : \'#000000\'?>\" class=\"input-text\" /></td> \n <td><input type=\"color\" name=\"product_label[<?php echo $i?>][bgcolor]\" value=\"<?php echo isset($product_labels[$i][\'bgcolor\']) ? $product_labels[$i][\'bgcolor\'] : \'#000000\'?>\" class=\"input-text\" /></td> \n <td><input type=\"text\" name=\"product_label[<?php echo $i?>][fontsize]\" value=\"<?php echo isset($product_labels[$i][\'fontsize\']) ? $product_labels[$i][\'fontsize\'] : 12?>\" class=\"form-control\" /></td> \n <td> \n <select name=\"product_label[<?php echo $i?>][show_category]\" class=\"form-control\"> \n <?php if (isset($product_labels[$i][\'show_category\']) && $product_labels[$i][\'show_category\'] == 1) {?> \n <option value=\"1\" selected=\"selected\"><?php echo $text_enabled?></option> \n <option value=\"0\"><?php echo $text_disabled?></option> \n <?php }else {?> \n <option value=\"1\"><?php echo $text_enabled?></option> \n <option value=\"0\" selected=\"selected\"><?php echo $text_disabled?></option> \n <?php }?> \n </select> \n </td> \n <td> \n <select name=\"product_label[<?php echo $i?>][show_product]\" class=\"form-control\"> \n <?php if (isset($product_labels[$i][\'show_product\']) && $product_labels[$i][\'show_product\'] == 1) {?> \n <option value=\"1\" selected=\"selected\"><?php echo $text_enabled?></option> \n <option value=\"0\"><?php echo $text_disabled?></option> \n <?php }else {?> \n <option value=\"1\"><?php echo $text_enabled?></option> \n <option value=\"0\" selected=\"selected\"><?php echo $text_disabled?></option> \n <?php }?> \n </select> \n </td> \n <td> \n <select name=\"product_label[<?php echo $i?>][status]\" class=\"form-control\"> \n <?php if (isset($product_labels[$i][\'status\']) && $product_labels[$i][\'status\'] == 1) {?> \n <option value=\"1\" selected=\"selected\"><?php echo $text_enabled?></option> \n <option value=\"0\"><?php echo $text_disabled?></option> \n <?php }else {?> \n <option value=\"1\"><?php echo $text_enabled?></option> \n <option value=\"0\" selected=\"selected\"><?php echo $text_disabled?></option> \n <?php }?> \n </select> \n </td> \n <td> \n <select name=\"product_label[<?php echo $i?>][type]\" class=\"form-control\"> \n <?php if (isset($product_labels[$i][\'type\']) && $product_labels[$i][\'type\'] == 1) {?> \n <option value=\"1\" selected=\"selected\"><?php echo $text_image?></option> \n <option value=\"2\"><?php echo $text_text?></option> \n <?php }else {?> \n <option value=\"1\"><?php echo $text_image?></option> \n <option value=\"2\" selected=\"selected\"><?php echo $text_text?></option> \n <?php }?> \n </select> \n </td> \n </tr> \n <?php }?> \n </tbody> \n </table> \n </div> \n </div> \n ]]></add> \n </operation> \n </file> \n \n <file path=\"admin/controller/catalog/mproduct.php\"> \n <operation> \n <search><![CDATA[ \n $data[\'tab_design\'] = $this->language->get(\'tab_design\'); \n ]]></search> \n <add position=\"after\"><![CDATA[ \n $this->load->language(\'catalog/product\'); \n $data[\'tab_productlabel\'] = $this->language->get(\'tab_productlabel\'); \n $data[\'entry_product_label_status\'] = $this->language->get(\'entry_product_label_status\'); \n $data[\'entry_product_label_type\'] = $this->language->get(\'entry_product_label_type\'); \n $data[\'text_image\'] = $this->language->get(\'text_image\'); \n $data[\'text_text\'] = $this->language->get(\'text_text\'); \n $data[\'entry_position\'] = $this->language->get(\'entry_position\'); \n $data[\'entry_image\'] = $this->language->get(\'entry_image\'); \n $data[\'entry_text\'] = $this->language->get(\'entry_text\'); \n $data[\'entry_text_color\'] = $this->language->get(\'entry_text_color\'); \n $data[\'entry_bg_color\'] = $this->language->get(\'entry_bg_color\'); \n $data[\'entry_show_category\'] = $this->language->get(\'entry_show_category\'); \n $data[\'entry_show_product\'] = $this->language->get(\'entry_show_product\'); \n $data[\'entry_text_font_size\'] = $this->language->get(\'entry_text_font_size\'); \n $data[\'entry_type\'] = $this->language->get(\'entry_type\'); \n ]]></add> \n </operation> \n \n <operation> \n <search index=\"0\"><![CDATA[ \n $this->load->model(\'localisation/tax_class\'); \n ]]></search> \n <add position=\"before\" offset=\"0\"><![CDATA[ \n $this->load->model(\'catalog/product\'); \n if (isset($this->request->post[\'product_label\'])) { \n $data[\'product_labels\'] = $this->request->post[\'product_label\']; \n } elseif (!empty($product_info)) { \n $data[\'product_labels\'] = $this->model_catalog_product->getProductLabels($product_info[\'product_id\']); \n } else { \n $data[\'product_labels\'] = array(); \n } \n \n // Images \n $this->load->model(\'tool/image\'); \n $data[\'product_label_images\'] = array(); \n \n foreach ($data[\'product_labels\'] as $product_label) { \n if (is_file(DIR_IMAGE . $product_label[\'image\'])) { \n $image = $product_label[\'image\']; \n $thumb = $product_label[\'image\']; \n } else { \n $image = \'\'; \n $thumb = \'no_image.png\'; \n } \n \n $data[\'product_label_images\'][] = array( \n \'image\' => $image, \n \'thumb\' => $this->model_tool_image->resize($thumb, 100, 100) \n ); \n } \n \n $data[\'so_product_label_thumb\'] = $this->model_tool_image->resize(\'no_image.png\', 100, 100); \n ]]></add> \n </operation> \n </file> \n \n <file path=\"admin/language/*/catalog/product.php\"> \n <operation> \n <search><![CDATA[ \n $_[\'entry_recurring\'] \n ]]> \n </search> \n <add position=\"after\"><![CDATA[ \n $_[\'tab_productlabel\'] = \'Product Label\'; \n $_[\'entry_product_label_status\'] = \'Product Label Status\'; \n $_[\'entry_product_label_type\'] = \'Product Label Type\'; \n $_[\'text_image\'] = \'Image\'; \n $_[\'text_text\'] = \'Text\'; \n $_[\'entry_position\'] = \'Position\'; \n $_[\'entry_image\'] = \'Image\'; \n $_[\'entry_text\'] = \'Text\'; \n $_[\'entry_text_color\'] = \'Text Color\'; \n $_[\'entry_bg_color\'] = \'Background Color\'; \n $_[\'entry_text_font_size\'] = \'Font size\'; \n $_[\'entry_type\'] = \'Type\'; \n $_[\'entry_show_category\'] = \'Show category\'; \n $_[\'entry_show_product\'] = \'Show product\'; \n ]]></add> \n </operation> \n </file> \n \n <file path=\"admin/model/catalog/product.php\"> \n <operation> \n <search index=\"0\"><![CDATA[ \n if (isset($data[\'product_recurring\'])) { \n ]]></search> \n <add position=\"before\" offset=\"0\"><![CDATA[ \n if (isset($data[\'product_label\'])) { \n foreach ($data[\'product_label\'] as $label) { \n $this->db->query(\"INSERT INTO `\" . DB_PREFIX . \"so_product_label` SET `product_id` = \" . (int)$product_id . \", status = \" . (int)$label[\'status\'] . \", `type` = \" . (int)$label[\'type\'] . \", `position` = \'\" . $label[\'position\'] . \"\', `image` = \'\" . $label[\'image\'] . \"\', `width` = \'\" . (int)$label[\'width\'] . \"\', `height` = \'\" . (int)$label[\'height\'] . \"\', `text` = \'\" . $label[\'text\'] . \"\', show_category = \" . (int)$label[\'show_category\'] . \", show_product = \" . (int)$label[\'show_product\'] . \", `color` = \'\" . $label[\'color\'] . \"\', `bgcolor` = \'\" . $label[\'bgcolor\'] . \"\', `fontsize` = \'\" . $label[\'fontsize\'] . \"\'\"); \n } \n } \n ]]></add> \n </operation> \n \n <operation> \n <search index=\"0\"><![CDATA[ \n $this->db->query(\"DELETE FROM `\" . DB_PREFIX . \"product_recurring` WHERE product_id = \" . (int)$product_id); \n ]]></search> \n <add position=\"before\" offset=\"0\"><![CDATA[ \n $this->db->query(\"DELETE FROM `\" . DB_PREFIX . \"so_product_label` WHERE product_id = \" . (int)$product_id); \n if (isset($data[\'product_label\'])) { \n foreach ($data[\'product_label\'] as $label) { \n $this->db->query(\"INSERT INTO `\" . DB_PREFIX . \"so_product_label` SET `product_id` = \" . (int)$product_id . \", status = \" . (int)$label[\'status\'] . \", `type` = \" . (int)$label[\'type\'] . \", `position` = \'\" . $label[\'position\'] . \"\', `image` = \'\" . $label[\'image\'] . \"\', `width` = \'\" . (int)$label[\'width\'] . \"\', `height` = \'\" . (int)$label[\'height\'] . \"\', `text` = \'\" . $label[\'text\'] . \"\', show_category = \" . (int)$label[\'show_category\'] . \", show_product = \" . (int)$label[\'show_product\'] . \", `color` = \'\" . $label[\'color\'] . \"\', `bgcolor` = \'\" . $label[\'bgcolor\'] . \"\', `fontsize` = \'\" . $label[\'fontsize\'] . \"\'\"); \n } \n } \n ]]></add> \n </operation> \n \n <operation> \n <search index=\"0\"><![CDATA[ \n public function getRecurrings($product_id) { \n ]]></search> \n <add position=\"before\" offset=\"0\"><![CDATA[ \n public function getProductLabels($product_id) { \n $query = $this->db->query(\"SELECT * FROM `\" . DB_PREFIX . \"so_product_label` WHERE product_id = \'\" . (int)$product_id . \"\'\"); \n \n return $query->rows; \n } \n ]]></add> \n </operation> \n </file> \n \n <file path=\"admin/model/soconfig/mproduct.php\"> \n <operation> \n <search index=\"0\"><![CDATA[ \n if (isset($data[\'product_recurring\'])) { \n ]]></search> \n <add position=\"before\" offset=\"0\"><![CDATA[ \n if (isset($data[\'product_label\'])) { \n foreach ($data[\'product_label\'] as $label) { \n $this->db->query(\"INSERT INTO `\" . DB_PREFIX . \"so_product_label` SET `product_id` = \" . (int)$product_id . \", status = \" . (int)$label[\'status\'] . \", `type` = \" . (int)$label[\'type\'] . \", `position` = \'\" . $label[\'position\'] . \"\', `image` = \'\" . $label[\'image\'] . \"\', `width` = \'\" . (int)$label[\'width\'] . \"\', `height` = \'\" . (int)$label[\'height\'] . \"\', `text` = \'\" . $label[\'text\'] . \"\', show_category = \" . (int)$label[\'show_category\'] . \", show_product = \" . (int)$label[\'show_product\'] . \", `color` = \'\" . $label[\'color\'] . \"\', `bgcolor` = \'\" . $label[\'bgcolor\'] . \"\', `fontsize` = \'\" . $label[\'fontsize\'] . \"\'\"); \n } \n } \n ]]></add> \n </operation> \n \n <operation> \n <search index=\"0\"><![CDATA[ \n $this->db->query(\"DELETE FROM `\" . DB_PREFIX . \"product_recurring` WHERE product_id = \" . (int)$product_id); \n ]]></search> \n <add position=\"before\" offset=\"0\"><![CDATA[ \n $this->db->query(\"DELETE FROM `\" . DB_PREFIX . \"so_product_label` WHERE product_id = \" . (int)$product_id); \n if (isset($data[\'product_label\'])) { \n foreach ($data[\'product_label\'] as $label) { \n $this->db->query(\"INSERT INTO `\" . DB_PREFIX . \"so_product_label` SET `product_id` = \" . (int)$product_id . \", status = \" . (int)$label[\'status\'] . \", `type` = \" . (int)$label[\'type\'] . \", `position` = \'\" . $label[\'position\'] . \"\', `image` = \'\" . $label[\'image\'] . \"\', `width` = \'\" . (int)$label[\'width\'] . \"\', `height` = \'\" . (int)$label[\'height\'] . \"\', `text` = \'\" . $label[\'text\'] . \"\', show_category = \" . (int)$label[\'show_category\'] . \", show_product = \" . (int)$label[\'show_product\'] . \", `color` = \'\" . $label[\'color\'] . \"\', `bgcolor` = \'\" . $label[\'bgcolor\'] . \"\', `fontsize` = \'\" . $label[\'fontsize\'] . \"\'\"); \n } \n } \n ]]></add> \n </operation> \n \n <operation> \n <search index=\"0\"><![CDATA[ \n public function getRecurrings($product_id) { \n ]]></search> \n <add position=\"before\" offset=\"0\"><![CDATA[ \n public function getProductLabels($product_id) { \n $query = $this->db->query(\"SELECT * FROM `\" . DB_PREFIX . \"so_product_label` WHERE product_id = \'\" . (int)$product_id . \"\'\"); \n \n return $query->rows; \n } \n ]]></add> \n </operation> \n </file> \n \n <file path=\"catalog/model/catalog/product.php\"> \n <operation> \n <search index=\"0\"><![CDATA[ \n public function getTotalProductSpecials() { \n ]]></search> \n <add position=\"before\" offset=\"0\"><![CDATA[ \n public function getProductLabels($product_id) { \n $query = $this->db->query(\"SELECT * FROM `\" . DB_PREFIX . \"so_product_label` WHERE `status` = 1 AND product_id = \'\" . (int)$product_id . \"\' GROUP BY id\"); \n \n return $query->rows; \n } \n ]]></add> \n </operation> \n </file> \n \n <file path=\"catalog/controller/product/search.php\"> \n <operation> \n <search><![CDATA[ \n $data[\'products\'][] = array( \n ]]></search> \n <add position=\"before\"><![CDATA[ \n $this->load->model(\'tool/image\'); \n $this->load->model(\'setting/setting\'); \n $data[\'productlabels\'] = array(); \n $so_pl_setting = $this->model_setting_setting->getSetting(\'so_product_label\'); \n if (isset($so_pl_setting[\'so_product_label_enabled\']) && $so_pl_setting[\'so_product_label_enabled\'] == 1 && isset($so_pl_setting[\'so_product_label_showing_search\']) && $so_pl_setting[\'so_product_label_showing_search\'] == 1) { \n $data[\'so_pl_setting\'] = $so_pl_setting; \n $productlabels = $this->model_catalog_product->getProductLabels($result[\'product_id\']); \n foreach ($productlabels as $label) { \n $data[\'productlabels\'][] = array( \n \'thumb\' => $this->model_tool_image->resize($label[\'image\'], ($label[\'width\'] != 0 ? $label[\'width\'] : 40), ($label[\'height\'] != 0 ? $label[\'height\'] : 40)), \n \'type\' => $label[\'type\'], \n \'text\' => $label[\'text\'], \n \'position\' => $label[\'position\'], \n \'color\' => $label[\'color\'], \n \'bgcolor\' => $label[\'bgcolor\'], \n \'fontsize\' => $label[\'fontsize\'] \n ); \n } \n } \n ]]></add> \n </operation> \n \n <operation> \n <search><![CDATA[ \n $data[\'products\'][] = array( \n ]]></search> \n <add position=\"after\"><![CDATA[ \n \'productlabels\' => $data[\'productlabels\'], \n ]]></add> \n </operation> \n </file> \n <file path=\"catalog/view/theme/*/template/product/search.tpl\"> \n <operation> \n <search index=\"0\"><![CDATA[ \n <div class=\"image\"> \n ]]></search> \n <add position=\"replace\" offset=\"0\"><![CDATA[ \n <div class=\"image\"> \n <?php if (isset($so_pl_setting) && $product[\'productlabels\']) {?> \n <div class=\"so_sticker\"> \n <?php foreach ($product[\'productlabels\'] as $label) {?> \n <?php if ($label[\'type\'] == 1) {?> \n <img src=\"<?php echo $label[\'thumb\']?>\" alt=\"<?php echo $product[\'name\']?>\" class=\"ps-<?php echo $label[\'position\']?>\" /> \n <?php }else {?> \n <div class=\"label-text ps-<?php echo $label[\'position\']?>\" style=\"color: <?php echo $label[\'color\']?>; background-color: <?php echo $label[\'bgcolor\']?>; font-size: <?php echo ($label[\'fontsize\'] != \'\' ? (int)$label[\'fontsize\'].\'px\' : \'inherit\')?>\"><?php echo $label[\'text\']?></div> \n <?php }?> \n <?php }?> \n </div> \n <?php }?> \n ]]></add> \n </operation> \n </file> \n \n <file path=\"catalog/controller/product/category.php\"> \n <operation> \n <search><![CDATA[ \n $data[\'products\'][] = array( \n ]]></search> \n <add position=\"before\"><![CDATA[ \n $this->load->model(\'tool/image\'); \n $this->load->model(\'setting/setting\'); \n $data[\'productlabels\'] = array(); \n $so_pl_setting = $this->model_setting_setting->getSetting(\'so_product_label\'); \n if (isset($so_pl_setting[\'so_product_label_enabled\']) && $so_pl_setting[\'so_product_label_enabled\'] == 1 && isset($so_pl_setting[\'so_product_label_showing_category\']) && $so_pl_setting[\'so_product_label_showing_category\'] == 1) { \n $data[\'so_pl_setting\'] = $so_pl_setting; \n $productlabels = $this->model_catalog_product->getProductLabels($result[\'product_id\']); \n foreach ($productlabels as $label) { \n if (isset($label[\'show_category\']) && $label[\'show_category\'] == 1) { \n $data[\'productlabels\'][] = array( \n \'thumb\' => $this->model_tool_image->resize($label[\'image\'], ($label[\'width\'] != 0 ? $label[\'width\'] : 40), ($label[\'height\'] != 0 ? $label[\'height\'] : 40)), \n \'type\' => $label[\'type\'], \n \'text\' => $label[\'text\'], \n \'position\' => $label[\'position\'], \n \'color\' => $label[\'color\'], \n \'bgcolor\' => $label[\'bgcolor\'], \n \'fontsize\' => $label[\'fontsize\'] \n ); \n } \n } \n } \n ]]></add> \n </operation> \n \n <operation> \n <search><![CDATA[ \n $data[\'products\'][] = array( \n ]]></search> \n <add position=\"after\"><![CDATA[ \n \'productlabels\' => $data[\'productlabels\'], \n ]]></add> \n </operation> \n </file> \n <file path=\"catalog/view/theme/*/template/product/category.tpl\"> \n <operation> \n <search index=\"0\"><![CDATA[ \n <div class=\"left-block\"> \n ]]></search> \n <add position=\"replace\" offset=\"0\"><![CDATA[ \n <div class=\"left-block\"> \n <?php if (isset($so_pl_setting) && $product[\'productlabels\']) {?> \n <div class=\"so_sticker\"> \n <?php foreach ($product[\'productlabels\'] as $label) {?> \n <?php if ($label[\'type\'] == 1) {?> \n <img src=\"<?php echo $label[\'thumb\']?>\" alt=\"<?php echo $product[\'name\']?>\" class=\"ps-<?php echo $label[\'position\']?>\" /> \n <?php }else {?> \n <div class=\"label-text ps-<?php echo $label[\'position\']?>\" style=\"color: <?php echo $label[\'color\']?>; background-color: <?php echo $label[\'bgcolor\']?>; font-size: <?php echo ($label[\'fontsize\'] != \'\' ? (int)$label[\'fontsize\'].\'px\' : \'inherit\')?>\"><?php echo $label[\'text\']?></div> \n <?php }?> \n <?php }?> \n </div> \n <?php }?> \n ]]></add> \n </operation> \n </file> \n \n <file path=\"catalog/view/theme/*/template/soconfig/listing.php\"> \n <operation> \n <search><![CDATA[ \n <div class=\"left-block\"> \n ]]></search> \n <add position=\"replace\"><![CDATA[ \n <div class=\"left-block\"> \n <?php if (isset($so_pl_setting) && $product[\'productlabels\']) {?> \n <div class=\"so_sticker\"> \n <?php foreach ($product[\'productlabels\'] as $label) {?> \n <?php if ($label[\'type\'] == 1) {?> \n <img src=\"<?php echo $label[\'thumb\']?>\" alt=\"<?php echo $product[\'name\']?>\" class=\"ps-<?php echo $label[\'position\']?>\" /> \n <?php }else {?> \n <div class=\"label-text ps-<?php echo $label[\'position\']?>\" style=\"color: <?php echo $label[\'color\']?>; background-color: <?php echo $label[\'bgcolor\']?>; font-size: <?php echo ($label[\'fontsize\'] != \'\' ? (int)$label[\'fontsize\'].\'px\' : \'inherit\')?>\"><?php echo $label[\'text\']?></div> \n <?php }?> \n <?php }?> \n </div> \n <?php }?> \n ]]></add> \n </operation> \n </file> \n \n <file path=\"catalog/controller/product/special.php\"> \n <operation> \n <search><![CDATA[ \n $data[\'products\'][] = array( \n ]]></search> \n <add position=\"before\"><![CDATA[ \n $this->load->model(\'tool/image\'); \n $this->load->model(\'setting/setting\'); \n $data[\'productlabels\'] = array(); \n $so_pl_setting = $this->model_setting_setting->getSetting(\'so_product_label\'); \n if (isset($so_pl_setting[\'so_product_label_enabled\']) && $so_pl_setting[\'so_product_label_enabled\'] == 1 && isset($so_pl_setting[\'so_product_label_showing_special\']) && $so_pl_setting[\'so_product_label_showing_special\'] == 1) { \n $data[\'so_pl_setting\'] = $so_pl_setting; \n $productlabels = $this->model_catalog_product->getProductLabels($result[\'product_id\']); \n foreach ($productlabels as $label) { \n $data[\'productlabels\'][] = array( \n \'thumb\' => $this->model_tool_image->resize($label[\'image\'], ($label[\'width\'] != 0 ? $label[\'width\'] : 40), ($label[\'height\'] != 0 ? $label[\'height\'] : 40)), \n \'type\' => $label[\'type\'], \n \'text\' => $label[\'text\'], \n \'position\' => $label[\'position\'], \n \'color\' => $label[\'color\'], \n \'bgcolor\' => $label[\'bgcolor\'], \n \'fontsize\' => $label[\'fontsize\'] \n ); \n } \n } \n ]]></add> \n </operation> \n \n <operation> \n <search><![CDATA[ \n $data[\'products\'][] = array( \n ]]></search> \n <add position=\"after\"><![CDATA[ \n \'productlabels\' => $data[\'productlabels\'], \n ]]></add> \n </operation> \n </file> \n <file path=\"catalog/view/theme/*/template/product/special.tpl\"> \n <operation> \n <search index=\"0\"><![CDATA[ \n <div class=\"image\"> \n ]]></search> \n <add position=\"replace\" offset=\"0\"><![CDATA[ \n <div class=\"image\"> \n <?php if (isset($so_pl_setting) && $product[\'productlabels\']) {?> \n <div class=\"so_sticker\"> \n <?php foreach ($product[\'productlabels\'] as $label) {?> \n <?php if ($label[\'type\'] == 1) {?> \n <img src=\"<?php echo $label[\'thumb\']?>\" alt=\"<?php echo $product[\'name\']?>\" class=\"ps-<?php echo $label[\'position\']?>\" /> \n <?php }else {?> \n <div class=\"label-text ps-<?php echo $label[\'position\']?>\" style=\"color: <?php echo $label[\'color\']?>; background-color: <?php echo $label[\'bgcolor\']?>; font-size: <?php echo ($label[\'fontsize\'] != \'\' ? (int)$label[\'fontsize\'].\'px\' : \'inherit\')?>\"><?php echo $label[\'text\']?></div> \n <?php }?> \n <?php }?> \n </div> \n <?php }?> \n ]]></add> \n </operation> \n </file> \n \n <file path=\"catalog/controller/product/manufacturer.php\"> \n <operation> \n <search><![CDATA[ \n $data[\'products\'][] = array( \n ]]></search> \n <add position=\"before\"><![CDATA[ \n $this->load->model(\'tool/image\'); \n $this->load->model(\'setting/setting\'); \n $data[\'productlabels\'] = array(); \n $so_pl_setting = $this->model_setting_setting->getSetting(\'so_product_label\'); \n if (isset($so_pl_setting[\'so_product_label_enabled\']) && $so_pl_setting[\'so_product_label_enabled\'] == 1 && isset($so_pl_setting[\'so_product_label_showing_manufacturer\']) && $so_pl_setting[\'so_product_label_showing_manufacturer\'] == 1) { \n $data[\'so_pl_setting\'] = $so_pl_setting; \n $productlabels = $this->model_catalog_product->getProductLabels($result[\'product_id\']); \n foreach ($productlabels as $label) { \n $data[\'productlabels\'][] = array( \n \'thumb\' => $this->model_tool_image->resize($label[\'image\'], ($label[\'width\'] != 0 ? $label[\'width\'] : 40), ($label[\'height\'] != 0 ? $label[\'height\'] : 40)), \n \'type\' => $label[\'type\'], \n \'text\' => $label[\'text\'], \n \'position\' => $label[\'position\'], \n \'color\' => $label[\'color\'], \n \'bgcolor\' => $label[\'bgcolor\'], \n \'fontsize\' => $label[\'fontsize\'] \n ); \n } \n } \n ]]></add> \n </operation> \n \n <operation> \n <search><![CDATA[ \n $data[\'products\'][] = array( \n ]]></search> \n <add position=\"after\"><![CDATA[ \n \'productlabels\' => $data[\'productlabels\'], \n ]]></add> \n </operation> \n </file> \n <file path=\"catalog/view/theme/*/template/product/manufacturer_info.tpl\"> \n <operation> \n <search index=\"0\"><![CDATA[ \n <div class=\"image\"> \n ]]></search> \n <add position=\"replace\" offset=\"0\"><![CDATA[ \n <div class=\"image\"> \n <?php if (isset($so_pl_setting) && $product[\'productlabels\']) {?> \n <div class=\"so_sticker\"> \n <?php foreach ($product[\'productlabels\'] as $label) {?> \n <?php if ($label[\'type\'] == 1) {?> \n <img src=\"<?php echo $label[\'thumb\']?>\" alt=\"<?php echo $product[\'name\']?>\" class=\"ps-<?php echo $label[\'position\']?>\" /> \n <?php }else {?> \n <div class=\"label-text ps-<?php echo $label[\'position\']?>\" style=\"color: <?php echo $label[\'color\']?>; background-color: <?php echo $label[\'bgcolor\']?>; font-size: <?php echo ($label[\'fontsize\'] != \'\' ? (int)$label[\'fontsize\'].\'px\' : \'inherit\')?>\"><?php echo $label[\'text\']?></div> \n <?php }?> \n <?php }?> \n </div> \n <?php }?> \n ]]></add> \n </operation> \n </file> \n \n <file path=\"catalog/controller/product/product.php\"> \n <operation> \n <search index=\"0\"><![CDATA[$data[\'points\'] = $product_info[\'points\'];]]></search> \n <add position=\"after\" offset=\"0\"><![CDATA[ \n $this->load->model(\'tool/image\'); \n $this->load->model(\'setting/setting\'); \n $data[\'productlabels\'] = array(); \n $so_pl_setting = $this->model_setting_setting->getSetting(\'so_product_label\'); \n if (isset($so_pl_setting[\'so_product_label_enabled\']) && $so_pl_setting[\'so_product_label_enabled\'] == 1 && isset($so_pl_setting[\'so_product_label_showing_product\']) && $so_pl_setting[\'so_product_label_showing_product\'] == 1) { \n $data[\'so_pl_setting\'] = $so_pl_setting; \n \n $productlabels = $this->model_catalog_product->getProductLabels($product_info[\'product_id\']); \n if (is_array($productlabels)) $productlabels = @array_unique($productlabels); \n foreach ($productlabels as $label) { \n if (isset($label[\'show_product\']) && $label[\'show_product\'] == 1) { \n $data[\'productlabels\'][] = array( \n \'thumb\' => $this->model_tool_image->resize($label[\'image\'], ($label[\'width\'] != 0 ? $label[\'width\'] : 40), ($label[\'height\'] != 0 ? $label[\'height\'] : 40)), \n \'type\' => $label[\'type\'], \n \'text\' => $label[\'text\'], \n \'position\' => $label[\'position\'], \n \'color\' => $label[\'color\'], \n \'bgcolor\' => $label[\'bgcolor\'], \n \'fontsize\' => $label[\'fontsize\'] \n ); \n } \n } \n } \n ]]></add> \n </operation> \n </file> \n \n <file path=\"catalog/view/theme/*/template/product/product.tpl\"> \n <operation> \n <search index=\"0\"><![CDATA[<div class=\"large-image <?php echo (isset($thumbnails_position) && $thumbnails_position == \'left\') ? \' vertical \' : \'\' ?> \">]]></search> \n <add position=\"replace\" offset=\"0\"><![CDATA[ \n <div class=\"large-image <?php echo (isset($thumbnails_position) && $thumbnails_position == \'left\') ? \' vertical \' : \'\' ?> \"> \n <?php if (isset($so_pl_setting) && $productlabels) {?> \n <div class=\"so_sticker\"> \n <?php foreach ($productlabels as $label) {?> \n <?php if ($label[\'type\'] == 1) {?> \n <img src=\"<?php echo $label[\'thumb\']?>\" class=\"ps-<?php echo $label[\'position\']?>\" /> \n <?php }else {?> \n <div class=\"label-text ps-<?php echo $label[\'position\']?>\" style=\"color: <?php echo $label[\'color\']?>; background-color: <?php echo $label[\'bgcolor\']?>; font-size: <?php echo ($label[\'fontsize\'] != \'\' ? (int)$label[\'fontsize\'].\'px\' : \'inherit\')?>\"><?php echo $label[\'text\']?></div> \n <?php }?> \n <?php }?> \n </div> \n <?php }?> \n ]]></add> \n </operation> \n </file> \n \n <file path=\"catalog/controller/extension/module/featured.php\"> \n <operation> \n <search><![CDATA[ \n $data[\'products\'][] = array( \n ]]></search> \n <add position=\"before\"><![CDATA[ \n $this->load->model(\'tool/image\'); \n $this->load->model(\'setting/setting\'); \n $data[\'productlabels\'] = array(); \n $so_pl_setting = $this->model_setting_setting->getSetting(\'so_product_label\'); \n if (isset($so_pl_setting[\'so_product_label_enabled\']) && $so_pl_setting[\'so_product_label_enabled\'] == 1 && isset($so_pl_setting[\'so_product_label_showing_featured\']) && $so_pl_setting[\'so_product_label_showing_featured\'] == 1) { \n $data[\'so_pl_setting\'] = $so_pl_setting; \n $productlabels = $this->model_catalog_product->getProductLabels($product_info[\'product_id\']); \n foreach ($productlabels as $label) { \n $data[\'productlabels\'][] = array( \n \'thumb\' => $this->model_tool_image->resize($label[\'image\'], ($label[\'width\'] != 0 ? $label[\'width\'] : 40), ($label[\'height\'] != 0 ? $label[\'height\'] : 40)), \n \'type\' => $label[\'type\'], \n \'text\' => $label[\'text\'], \n \'position\' => $label[\'position\'], \n \'color\' => $label[\'color\'], \n \'bgcolor\' => $label[\'bgcolor\'], \n \'fontsize\' => $label[\'fontsize\'] \n ); \n } \n } \n ]]></add> \n </operation> \n \n <operation> \n <search><![CDATA[ \n $data[\'products\'][] = array( \n ]]></search> \n <add position=\"after\"><![CDATA[ \n \'productlabels\' => $data[\'productlabels\'], \n ]]></add> \n </operation> \n </file> \n <file path=\"catalog/view/theme/*/template/extension/module/featured.tpl\"> \n <operation> \n <search index=\"0\"><![CDATA[ \n <div class=\"image\"> \n ]]></search> \n <add position=\"replace\" offset=\"0\"><![CDATA[ \n <div class=\"image\"> \n <?php if (isset($so_pl_setting) && $product[\'productlabels\']) {?> \n <div class=\"so_sticker\"> \n <?php foreach ($product[\'productlabels\'] as $label) {?> \n <?php if ($label[\'type\'] == 1) {?> \n <img src=\"<?php echo $label[\'thumb\']?>\" alt=\"<?php echo $product[\'name\']?>\" class=\"ps-<?php echo $label[\'position\']?>\" /> \n <?php }else {?> \n <div class=\"label-text ps-<?php echo $label[\'position\']?>\" style=\"color: <?php echo $label[\'color\']?>; background-color: <?php echo $label[\'bgcolor\']?>; font-size: <?php echo ($label[\'fontsize\'] != \'\' ? (int)$label[\'fontsize\'].\'px\' : \'inherit\')?>\"><?php echo $label[\'text\']?></div> \n <?php }?> \n <?php }?> \n </div> \n <?php }?> \n ]]></add> \n </operation> \n </file> \n \n <file path=\"catalog/controller/extension/module/bestseller.php\"> \n <operation> \n <search><![CDATA[ \n $data[\'products\'][] = array( \n ]]></search> \n <add position=\"before\"><![CDATA[ \n $this->load->model(\'tool/image\'); \n $this->load->model(\'setting/setting\'); \n $data[\'productlabels\'] = array(); \n $so_pl_setting = $this->model_setting_setting->getSetting(\'so_product_label\'); \n if (isset($so_pl_setting[\'so_product_label_enabled\']) && $so_pl_setting[\'so_product_label_enabled\'] == 1 && isset($so_pl_setting[\'so_product_label_showing_bestseller\']) && $so_pl_setting[\'so_product_label_showing_bestseller\'] == 1) { \n $data[\'so_pl_setting\'] = $so_pl_setting; \n $productlabels = $this->model_catalog_product->getProductLabels($result[\'product_id\']); \n foreach ($productlabels as $label) { \n $data[\'productlabels\'][] = array( \n \'thumb\' => $this->model_tool_image->resize($label[\'image\'], ($label[\'width\'] != 0 ? $label[\'width\'] : 40), ($label[\'height\'] != 0 ? $label[\'height\'] : 40)), \n \'type\' => $label[\'type\'], \n \'text\' => $label[\'text\'], \n \'position\' => $label[\'position\'], \n \'color\' => $label[\'color\'], \n \'bgcolor\' => $label[\'bgcolor\'], \n \'fontsize\' => $label[\'fontsize\'] \n ); \n } \n } \n ]]></add> \n </operation> \n \n <operation> \n <search><![CDATA[ \n $data[\'products\'][] = array( \n ]]></search> \n <add position=\"after\"><![CDATA[ \n \'productlabels\' => $data[\'productlabels\'], \n ]]></add> \n </operation> \n </file> \n <file path=\"catalog/view/theme/*/template/extension/module/bestseller.tpl\"> \n <operation> \n <search index=\"0\"><![CDATA[ \n <div class=\"image\"> \n ]]></search> \n <add position=\"replace\" offset=\"0\"><![CDATA[ \n <div class=\"image\"> \n <?php if (isset($so_pl_setting) && $product[\'productlabels\']) {?> \n <div class=\"so_sticker\"> \n <?php foreach ($product[\'productlabels\'] as $label) {?> \n <?php if ($label[\'type\'] == 1) {?> \n <img src=\"<?php echo $label[\'thumb\']?>\" alt=\"<?php echo $product[\'name\']?>\" class=\"ps-<?php echo $label[\'position\']?>\" /> \n <?php }else {?> \n <div class=\"label-text ps-<?php echo $label[\'position\']?>\" style=\"color: <?php echo $label[\'color\']?>; background-color: <?php echo $label[\'bgcolor\']?>; font-size: <?php echo ($label[\'fontsize\'] != \'\' ? (int)$label[\'fontsize\'].\'px\' : \'inherit\')?>\"><?php echo $label[\'text\']?></div> \n <?php }?> \n <?php }?> \n </div> \n <?php }?> \n ]]></add> \n </operation> \n </file> \n \n <file path=\"catalog/controller/extension/module/latest.php\"> \n <operation> \n <search><![CDATA[ \n $data[\'products\'][] = array( \n ]]></search> \n <add position=\"before\"><![CDATA[ \n $this->load->model(\'tool/image\'); \n $this->load->model(\'setting/setting\'); \n $data[\'productlabels\'] = array(); \n $so_pl_setting = $this->model_setting_setting->getSetting(\'so_product_label\'); \n if (isset($so_pl_setting[\'so_product_label_enabled\']) && $so_pl_setting[\'so_product_label_enabled\'] == 1 && isset($so_pl_setting[\'so_product_label_showing_lastest\']) && $so_pl_setting[\'so_product_label_showing_lastest\'] == 1) { \n $data[\'so_pl_setting\'] = $so_pl_setting; \n $productlabels = $this->model_catalog_product->getProductLabels($result[\'product_id\']); \n foreach ($productlabels as $label) { \n $data[\'productlabels\'][] = array( \n \'thumb\' => $this->model_tool_image->resize($label[\'image\'], ($label[\'width\'] != 0 ? $label[\'width\'] : 40), ($label[\'height\'] != 0 ? $label[\'height\'] : 40)), \n \'type\' => $label[\'type\'], \n \'text\' => $label[\'text\'], \n \'position\' => $label[\'position\'], \n \'color\' => $label[\'color\'], \n \'bgcolor\' => $label[\'bgcolor\'], \n \'fontsize\' => $label[\'fontsize\'] \n ); \n } \n } \n ]]></add> \n </operation> \n \n <operation> \n <search><![CDATA[ \n $data[\'products\'][] = array( \n ]]></search> \n <add position=\"after\"><![CDATA[ \n \'productlabels\' => $data[\'productlabels\'], \n ]]></add> \n </operation> \n </file> \n <file path=\"catalog/view/theme/*/template/extension/module/latest.tpl\"> \n <operation> \n <search index=\"0\"><![CDATA[ \n <div class=\"image\"> \n ]]></search> \n <add position=\"replace\" offset=\"0\"><![CDATA[ \n <div class=\"image\"> \n <?php if (isset($so_pl_setting) && $product[\'productlabels\']) {?> \n <div class=\"so_sticker\"> \n <?php foreach ($product[\'productlabels\'] as $label) {?> \n <?php if ($label[\'type\'] == 1) {?> \n <img src=\"<?php echo $label[\'thumb\']?>\" alt=\"<?php echo $product[\'name\']?>\" class=\"ps-<?php echo $label[\'position\']?>\" /> \n <?php }else {?> \n <div class=\"label-text ps-<?php echo $label[\'position\']?>\" style=\"color: <?php echo $label[\'color\']?>; background-color: <?php echo $label[\'bgcolor\']?>; font-size: <?php echo ($label[\'fontsize\'] != \'\' ? (int)$label[\'fontsize\'].\'px\' : \'inherit\')?>\"><?php echo $label[\'text\']?></div> \n <?php }?> \n <?php }?> \n </div> \n <?php }?> \n ]]></add> \n </operation> \n </file> \n \n <file path=\"catalog/controller/extension/module/special.php\"> \n <operation> \n <search><![CDATA[ \n $data[\'products\'][] = array( \n ]]></search> \n <add position=\"before\"><![CDATA[ \n $this->load->model(\'tool/image\'); \n $this->load->model(\'setting/setting\'); \n $data[\'productlabels\'] = array(); \n $so_pl_setting = $this->model_setting_setting->getSetting(\'so_product_label\'); \n if (isset($so_pl_setting[\'so_product_label_enabled\']) && $so_pl_setting[\'so_product_label_enabled\'] == 1 && isset($so_pl_setting[\'so_product_label_showing_special_mod\']) && $so_pl_setting[\'so_product_label_showing_special_mod\'] == 1) { \n $data[\'so_pl_setting\'] = $so_pl_setting; \n $productlabels = $this->model_catalog_product->getProductLabels($result[\'product_id\']); \n foreach ($productlabels as $label) { \n $data[\'productlabels\'][] = array( \n \'thumb\' => $this->model_tool_image->resize($label[\'image\'], ($label[\'width\'] != 0 ? $label[\'width\'] : 40), ($label[\'height\'] != 0 ? $label[\'height\'] : 40)), \n \'type\' => $label[\'type\'], \n \'text\' => $label[\'text\'], \n \'position\' => $label[\'position\'], \n \'color\' => $label[\'color\'], \n \'bgcolor\' => $label[\'bgcolor\'], \n \'fontsize\' => $label[\'fontsize\'] \n ); \n } \n } \n ]]></add> \n </operation> \n \n <operation> \n <search><![CDATA[ \n $data[\'products\'][] = array( \n ]]></search> \n <add position=\"after\"><![CDATA[ \n \'productlabels\' => $data[\'productlabels\'], \n ]]></add> \n </operation> \n </file> \n <file path=\"catalog/view/theme/*/template/extension/module/special.tpl\"> \n <operation> \n <search index=\"0\"><![CDATA[ \n <div class=\"image\"> \n ]]></search> \n <add position=\"replace\" offset=\"0\"><![CDATA[ \n <div class=\"image\"> \n <?php if (isset($so_pl_setting) && $product[\'productlabels\']) {?> \n <div class=\"so_sticker\"> \n <?php foreach ($product[\'productlabels\'] as $label) {?> \n <?php if ($label[\'type\'] == 1) {?> \n <img src=\"<?php echo $label[\'thumb\']?>\" alt=\"<?php echo $product[\'name\']?>\" class=\"ps-<?php echo $label[\'position\']?>\" /> \n <?php }else {?> \n <div class=\"label-text ps-<?php echo $label[\'position\']?>\" style=\"color: <?php echo $label[\'color\']?>; background-color: <?php echo $label[\'bgcolor\']?>; font-size: <?php echo ($label[\'fontsize\'] != \'\' ? (int)$label[\'fontsize\'].\'px\' : \'inherit\')?>\"><?php echo $label[\'text\']?></div> \n <?php }?> \n <?php }?> \n </div> \n <?php }?> \n ]]></add> \n </operation> \n </file> \n <file path=\"catalog/controller/extension/module/so_extra_slider.php\"> \n <operation> \n <search><![CDATA[ \n $data[\'products\'][] = array( \n ]]></search> \n <add position=\"before\"><![CDATA[ \n $this->load->model(\'tool/image\'); \n $this->load->model(\'setting/setting\'); \n $data[\'productlabels\'] = array(); \n $so_pl_setting = $this->model_setting_setting->getSetting(\'so_product_label\'); \n if (isset($so_pl_setting[\'so_product_label_enabled\']) && $so_pl_setting[\'so_product_label_enabled\'] == 1) { \n $data[\'so_pl_setting\'] = $so_pl_setting; \n $productlabels = $this->model_catalog_product->getProductLabels($product_info[\'product_id\']); \n foreach ($productlabels as $label) { \n $data[\'productlabels\'][] = array( \n \'thumb\' => $this->model_tool_image->resize($label[\'image\'], ($label[\'width\'] != 0 ? $label[\'width\'] : 40), ($label[\'height\'] != 0 ? $label[\'height\'] : 40)), \n \'type\' => $label[\'type\'], \n \'text\' => $label[\'text\'], \n \'position\' => $label[\'position\'], \n \'color\' => $label[\'color\'], \n \'bgcolor\' => $label[\'bgcolor\'], \n \'fontsize\' => $label[\'fontsize\'] \n ); \n } \n } \n ]]></add> \n </operation> \n \n <operation> \n <search><![CDATA[ \n $data[\'products\'][] = array( \n ]]></search> \n <add position=\"after\"><![CDATA[ \n \'productlabels\' => $data[\'productlabels\'], \n ]]></add> \n </operation> \n </file> \n <file path=\"catalog/view/theme/*/template/extension/module/so_extra_slider/default.tpl\"> \n <operation> \n <search index=\"0\"><![CDATA[ \n <div class=\"left-block\"> \n ]]></search> \n <add position=\"replace\" offset=\"0\"><![CDATA[ \n <div class=\"left-block\"> \n <?php if (isset($so_pl_setting) && $product[\'productlabels\']) {?> \n <div class=\"so_sticker\"> \n <?php foreach ($product[\'productlabels\'] as $label) {?> \n <?php if ($label[\'type\'] == 1) {?> \n <img src=\"<?php echo $label[\'thumb\']?>\" alt=\"<?php echo $product[\'name\']?>\" class=\"ps-<?php echo $label[\'position\']?>\" /> \n <?php }else {?> \n <div class=\"label-text ps-<?php echo $label[\'position\']?>\" style=\"color: <?php echo $label[\'color\']?>; background-color: <?php echo $label[\'bgcolor\']?>; font-size: <?php echo ($label[\'fontsize\'] != \'\' ? (int)$label[\'fontsize\'].\'px\' : \'inherit\')?>\"><?php echo $label[\'text\']?></div> \n <?php }?> \n <?php }?> \n </div> \n <?php }?> \n ]]></add> \n </operation> \n </file> \n <file path=\"catalog/view/theme/*/template/extension/module/so_extra_slider/layout2.tpl\"> \n <operation> \n <search index=\"0\"><![CDATA[ \n <div class=\"left-block so-quickview\"> \n ]]></search> \n <add position=\"replace\" offset=\"0\"><![CDATA[ \n <div class=\"left-block so-quickview\"> \n <?php if (isset($so_pl_setting) && $product[\'productlabels\']) {?> \n <div class=\"so_sticker\"> \n <?php foreach ($product[\'productlabels\'] as $label) {?> \n <?php if ($label[\'type\'] == 1) {?> \n <img src=\"<?php echo $label[\'thumb\']?>\" alt=\"<?php echo $product[\'name\']?>\" class=\"ps-<?php echo $label[\'position\']?>\" /> \n <?php }else {?> \n <div class=\"label-text ps-<?php echo $label[\'position\']?>\" style=\"color: <?php echo $label[\'color\']?>; background-color: <?php echo $label[\'bgcolor\']?>; font-size: <?php echo ($label[\'fontsize\'] != \'\' ? (int)$label[\'fontsize\'].\'px\' : \'inherit\')?>\"><?php echo $label[\'text\']?></div> \n <?php }?> \n <?php }?> \n </div> \n <?php }?> \n ]]></add> \n </operation> \n </file> \n <file path=\"catalog/controller/extension/module/so_deals.php\"> \n <operation> \n <search><![CDATA[ \n $cat[\'child\'][] = array( \n ]]></search> \n <add position=\"before\"><![CDATA[ \n $this->load->model(\'tool/image\'); \n $this->load->model(\'setting/setting\'); \n $data[\'productlabels\'] = array(); \n $so_pl_setting = $this->model_setting_setting->getSetting(\'so_product_label\'); \n if (isset($so_pl_setting[\'so_product_label_enabled\']) && $so_pl_setting[\'so_product_label_enabled\'] == 1) { \n $data[\'so_pl_setting\'] = $so_pl_setting; \n $productlabels = $this->model_catalog_product->getProductLabels($product_info[\'product_id\']); \n foreach ($productlabels as $label) { \n $data[\'productlabels\'][] = array( \n \'thumb\' => $this->model_tool_image->resize($label[\'image\'], ($label[\'width\'] != 0 ? $label[\'width\'] : 40), ($label[\'height\'] != 0 ? $label[\'height\'] : 40)), \n \'type\' => $label[\'type\'], \n \'text\' => $label[\'text\'], \n \'position\' => $label[\'position\'], \n \'color\' => $label[\'color\'], \n \'bgcolor\' => $label[\'bgcolor\'], \n \'fontsize\' => $label[\'fontsize\'] \n ); \n } \n } \n ]]></add> \n </operation> \n \n <operation> \n <search><![CDATA[ \n $cat[\'child\'][] = array( \n ]]></search> \n <add position=\"after\"><![CDATA[ \n \'productlabels\' => $data[\'productlabels\'], \n \'so_pl_setting\' => $so_pl_setting, \n ]]></add> \n </operation> \n </file> \n <file path=\"catalog/view/theme/*/template/extension/module/so_deals/default3_carousel.tpl\"> \n <operation> \n <search><![CDATA[ \n <div class=\"left-block\"> \n ]]></search> \n <add position=\"replace\"><![CDATA[ \n <div class=\"left-block\"> \n <?php if (isset($product[\'so_pl_setting\']) && $product[\'productlabels\']) {?> \n <div class=\"so_sticker\"> \n <?php foreach ($product[\'productlabels\'] as $label) {?> \n <?php if ($label[\'type\'] == 1) {?> \n <img src=\"<?php echo $label[\'thumb\']?>\" alt=\"<?php echo $product[\'name\']?>\" class=\"ps-<?php echo $label[\'position\']?>\" /> \n <?php }else {?> \n <div class=\"label-text ps-<?php echo $label[\'position\']?>\" style=\"color: <?php echo $label[\'color\']?>; background-color: <?php echo $label[\'bgcolor\']?>; font-size: <?php echo ($label[\'fontsize\'] != \'\' ? (int)$label[\'fontsize\'].\'px\' : \'inherit\')?>\"><?php echo $label[\'text\']?></div> \n <?php }?> \n <?php }?> \n </div> \n <?php }?> \n ]]></add> \n </operation> \n </file> \n <file path=\"catalog/view/theme/*/template/extension/module/so_deals/default4_carousel.tpl\"> \n <operation> \n <search><![CDATA[ \n <div class=\"left-block so-quickview\"> \n ]]></search> \n <add position=\"replace\"><![CDATA[ \n <div class=\"left-block so-quickview\"> \n <?php if (isset($product[\'so_pl_setting\']) && $product[\'productlabels\']) {?> \n <div class=\"so_sticker\"> \n <?php foreach ($product[\'productlabels\'] as $label) {?> \n <?php if ($label[\'type\'] == 1) {?> \n <img src=\"<?php echo $label[\'thumb\']?>\" alt=\"<?php echo $product[\'name\']?>\" class=\"ps-<?php echo $label[\'position\']?>\" /> \n <?php }else {?> \n <div class=\"label-text ps-<?php echo $label[\'position\']?>\" style=\"color: <?php echo $label[\'color\']?>; background-color: <?php echo $label[\'bgcolor\']?>; font-size: <?php echo ($label[\'fontsize\'] != \'\' ? (int)$label[\'fontsize\'].\'px\' : \'inherit\')?>\"><?php echo $label[\'text\']?></div> \n <?php }?> \n <?php }?> \n </div> \n <?php }?> \n ]]></add> \n </operation> \n </file> \n <file path=\"catalog/controller/extension/module/so_listing_tabs.php\"> \n <operation> \n <search><![CDATA[ \n $cat[\'child\'][] = array( \n ]]></search> \n <add position=\"before\"><![CDATA[ \n $this->load->model(\'tool/image\'); \n $this->load->model(\'setting/setting\'); \n $data[\'productlabels\'] = array(); \n $so_pl_setting = $this->model_setting_setting->getSetting(\'so_product_label\'); \n if (isset($so_pl_setting[\'so_product_label_enabled\']) && $so_pl_setting[\'so_product_label_enabled\'] == 1) { \n $data[\'so_pl_setting\'] = $so_pl_setting; \n $productlabels = $this->model_catalog_product->getProductLabels($product_info[\'product_id\']); \n foreach ($productlabels as $label) { \n $data[\'productlabels\'][] = array( \n \'thumb\' => $this->model_tool_image->resize($label[\'image\'], ($label[\'width\'] != 0 ? $label[\'width\'] : 40), ($label[\'height\'] != 0 ? $label[\'height\'] : 40)), \n \'type\' => $label[\'type\'], \n \'text\' => $label[\'text\'], \n \'position\' => $label[\'position\'], \n \'color\' => $label[\'color\'], \n \'bgcolor\' => $label[\'bgcolor\'], \n \'fontsize\' => $label[\'fontsize\'] \n ); \n } \n } \n ]]></add> \n </operation> \n \n <operation> \n <search><![CDATA[ \n $cat[\'child\'][] = array( \n ]]></search> \n <add position=\"after\"><![CDATA[ \n \'productlabels\' => $data[\'productlabels\'], \n \'so_pl_setting\' => $so_pl_setting, \n ]]></add> \n </operation> \n </file> \n <file path=\"catalog/view/theme/*/template/extension/module/so_listing_tabs/default/default_items.tpl\"> \n <operation> \n <search><![CDATA[ \n <div class=\"left-block\"> \n ]]></search> \n <add position=\"replace\"><![CDATA[ \n <div class=\"left-block\"> \n <?php if (isset($product[\'so_pl_setting\']) && $product[\'productlabels\']) {?> \n <div class=\"so_sticker\"> \n <?php foreach ($product[\'productlabels\'] as $label) {?> \n <?php if ($label[\'type\'] == 1) {?> \n <img src=\"<?php echo $label[\'thumb\']?>\" alt=\"<?php echo $product[\'name\']?>\" class=\"ps-<?php echo $label[\'position\']?>\" /> \n <?php }else {?> \n <div class=\"label-text ps-<?php echo $label[\'position\']?>\" style=\"color: <?php echo $label[\'color\']?>; background-color: <?php echo $label[\'bgcolor\']?>; font-size: <?php echo ($label[\'fontsize\'] != \'\' ? (int)$label[\'fontsize\'].\'px\' : \'inherit\')?>\"><?php echo $label[\'text\']?></div> \n <?php }?> \n <?php }?> \n </div> \n <?php }?> \n ]]></add> \n </operation> \n </file> \n <file path=\"catalog/view/theme/*/template/extension/module/so_listing_tabs/style2/default_items.tpl\"> \n <operation> \n <search><![CDATA[ \n <div class=\"left-block\"> \n ]]></search> \n <add position=\"replace\"><![CDATA[ \n <div class=\"left-block\"> \n <?php if (isset($product[\'so_pl_setting\']) && $product[\'productlabels\']) {?> \n <div class=\"so_sticker\"> \n <?php foreach ($product[\'productlabels\'] as $label) {?> \n <?php if ($label[\'type\'] == 1) {?> \n <img src=\"<?php echo $label[\'thumb\']?>\" alt=\"<?php echo $product[\'name\']?>\" class=\"ps-<?php echo $label[\'position\']?>\" /> \n <?php }else {?> \n <div class=\"label-text ps-<?php echo $label[\'position\']?>\" style=\"color: <?php echo $label[\'color\']?>; background-color: <?php echo $label[\'bgcolor\']?>; font-size: <?php echo ($label[\'fontsize\'] != \'\' ? (int)$label[\'fontsize\'].\'px\' : \'inherit\')?>\"><?php echo $label[\'text\']?></div> \n <?php }?> \n <?php }?> \n </div> \n <?php }?> \n ]]></add> \n </operation> \n </file> \n <file path=\"catalog/view/theme/*/template/extension/module/so_listing_tabs/layout2/default_items.tpl\"> \n <operation> \n <search><![CDATA[ \n <div class=\"left-block so-quickview\"> \n ]]></search> \n <add position=\"replace\"><![CDATA[ \n <div class=\"left-block so-quickview\"> \n <?php if (isset($product[\'so_pl_setting\']) && $product[\'productlabels\']) {?> \n <div class=\"so_sticker\"> \n <?php foreach ($product[\'productlabels\'] as $label) {?> \n <?php if ($label[\'type\'] == 1) {?> \n <img src=\"<?php echo $label[\'thumb\']?>\" alt=\"<?php echo $product[\'name\']?>\" class=\"ps-<?php echo $label[\'position\']?>\" /> \n <?php }else {?> \n <div class=\"label-text ps-<?php echo $label[\'position\']?>\" style=\"color: <?php echo $label[\'color\']?>; background-color: <?php echo $label[\'bgcolor\']?>; font-size: <?php echo ($label[\'fontsize\'] != \'\' ? (int)$label[\'fontsize\'].\'px\' : \'inherit\')?>\"><?php echo $label[\'text\']?></div> \n <?php }?> \n <?php }?> \n </div> \n <?php }?> \n ]]></add> \n </operation> \n </file> \n <file path=\"catalog/view/theme/*/template/extension/module/so_listing_tabs/layout3/default_items.tpl\"> \n <operation> \n <search><![CDATA[ \n <div class=\"left-block so-quickview\"> \n ]]></search> \n <add position=\"replace\"><![CDATA[ \n <div class=\"left-block so-quickview\"> \n <?php if (isset($product[\'so_pl_setting\']) && $product[\'productlabels\']) {?> \n <div class=\"so_sticker\"> \n <?php foreach ($product[\'productlabels\'] as $label) {?> \n <?php if ($label[\'type\'] == 1) {?> \n <img src=\"<?php echo $label[\'thumb\']?>\" alt=\"<?php echo $product[\'name\']?>\" class=\"ps-<?php echo $label[\'position\']?>\" /> \n <?php }else {?> \n <div class=\"label-text ps-<?php echo $label[\'position\']?>\" style=\"color: <?php echo $label[\'color\']?>; background-color: <?php echo $label[\'bgcolor\']?>; font-size: <?php echo ($label[\'fontsize\'] != \'\' ? (int)$label[\'fontsize\'].\'px\' : \'inherit\')?>\"><?php echo $label[\'text\']?></div> \n <?php }?> \n <?php }?> \n </div> \n <?php }?> \n ]]></add> \n </operation> \n </file> \n <file path=\"catalog/view/theme/*/template/extension/module/so_listing_tabs/layout3style2/default_items.tpl\"> \n <operation> \n <search><![CDATA[ \n <div class=\"left-block so-quickview\"> \n ]]></search> \n <add position=\"replace\"><![CDATA[ \n <div class=\"left-block so-quickview\"> \n <?php if (isset($product[\'so_pl_setting\']) && $product[\'productlabels\']) {?> \n <div class=\"so_sticker\"> \n <?php foreach ($product[\'productlabels\'] as $label) {?> \n <?php if ($label[\'type\'] == 1) {?> \n <img src=\"<?php echo $label[\'thumb\']?>\" alt=\"<?php echo $product[\'name\']?>\" class=\"ps-<?php echo $label[\'position\']?>\" /> \n <?php }else {?> \n <div class=\"label-text ps-<?php echo $label[\'position\']?>\" style=\"color: <?php echo $label[\'color\']?>; background-color: <?php echo $label[\'bgcolor\']?>; font-size: <?php echo ($label[\'fontsize\'] != \'\' ? (int)$label[\'fontsize\'].\'px\' : \'inherit\')?>\"><?php echo $label[\'text\']?></div> \n <?php }?> \n <?php }?> \n </div> \n <?php }?> \n ]]></add> \n </operation> \n </file> \n \n <file path=\"catalog/controller/extension/soconfig/quickview.php\"> \n <operation> \n <search><![CDATA[ \n foreach ($results as $result) { \n ]]></search> \n <add position=\"before\"><![CDATA[ \n $this->load->model(\'tool/image\'); \n $this->load->model(\'setting/setting\'); \n $data[\'productlabels\'] = array(); \n $so_pl_setting = $this->model_setting_setting->getSetting(\'so_product_label\'); \n if (isset($so_pl_setting[\'so_product_label_enabled\']) && $so_pl_setting[\'so_product_label_enabled\'] == 1) { \n $data[\'so_pl_setting\'] = $so_pl_setting; \n $productlabels = $this->model_catalog_product->getProductLabels($this->request->get[\'product_id\']); \n foreach ($productlabels as $label) { \n $data[\'productlabels\'][] = array( \n \'thumb\' => $this->model_tool_image->resize($label[\'image\'], ($label[\'width\'] != 0 ? $label[\'width\'] : 40), ($label[\'height\'] != 0 ? $label[\'height\'] : 40)), \n \'type\' => $label[\'type\'], \n \'text\' => $label[\'text\'], \n \'position\' => $label[\'position\'], \n \'color\' => $label[\'color\'], \n \'bgcolor\' => $label[\'bgcolor\'], \n \'fontsize\' => $label[\'fontsize\'] \n ); \n } \n } \n ]]></add> \n </operation> \n \n <operation> \n <search><![CDATA[ \n $this->document->addScript(\'catalog/view/javascript/jquery/datetimepicker/moment.js\'); \n ]]></search> \n <add position=\"before\"><![CDATA[ \n $this->document->addStyle(\'catalog/view/javascript/so_product_label/css/so_product_label.css\'); \n ]]></add> \n </operation> \n </file> \n \n <file path=\"catalog/view/theme/*/template/soconfig/quickview.tpl\"> \n <operation> \n <search index=\"0\"><![CDATA[ \n <div class=\"large-image \"> \n ]]></search> \n <add position=\"replace\" offset=\"0\"><![CDATA[ \n <div class=\"large-image \"> \n <?php if (isset($so_pl_setting) && $productlabels) {?> \n <div class=\"so_sticker\"> \n <?php foreach ($productlabels as $label) {?> \n <?php if ($label[\'type\'] == 1) {?> \n <img src=\"<?php echo $label[\'thumb\']?>\" class=\"ps-<?php echo $label[\'position\']?>\" /> \n <?php }else {?> \n <div class=\"label-text ps-<?php echo $label[\'position\']?>\" style=\"color: <?php echo $label[\'color\']?>; background-color: <?php echo $label[\'bgcolor\']?>; font-size: <?php echo ($label[\'fontsize\'] != \'\' ? (int)$label[\'fontsize\'].\'px\' : \'inherit\')?>\"><?php echo $label[\'text\']?></div> \n <?php }?> \n <?php }?> \n </div> \n <?php }?> \n ]]></add> \n </operation> \n </file> \n \n \n \n <file path=\"catalog/controller/common/header.php\"> \n <operation> \n <search index=\"0\"><![CDATA[ \n $data[\'title\'] = $this->document->getTitle(); \n ]]></search> \n <add position=\"after\" offset=\"0\"><![CDATA[ \n $this->document->addStyle(\'catalog/view/javascript/so_product_label/css/so_product_label.css\'); \n ]]></add> \n </operation> \n </file> \n</modification>',1,'2017-05-19 09:02:04'),
	(9,'So Mobile','so_mobile','OpenCartWorks','1.0.0','http://www.opencartworks.com/','<?xml version=\"1.0\" encoding=\"utf-8\"?> \n<modification> \n <name><![CDATA[So Mobile]]></name> \n <code>so-mobile</code> \n <version><![CDATA[1.0.0]]></version> \n <author><![CDATA[OpenCartWorks]]></author> \n <link>http://www.opencartworks.com/</link> \n <!--Catalog/controller/common--> \n <file path=\"catalog/controller/common/home.php\"> \n <operation > \n <search ><![CDATA[public function index()]]></search> \n <add position=\"after\"><![CDATA[$data[\'mobile\'] = $this->config->get(\'mobile_general\'); \n if($this->session->data[\'device\']==\'mobile\' && $data[\'mobile\'][\'platforms_mobile\']){ \n return $this->response->redirect($this->url->link(\'mobile/home\')); \n }else{ \n ]]></add> \n </operation> \n <operation > \n <search ><![CDATA[$this->response->setOutput($this->load->view(\'common/home\', $data));]]></search> \n <add position=\"replace\"><![CDATA[ \n return $this->response->setOutput($this->load->view(\'common/home\', $data)); \n } \n ]]></add> \n </operation> \n </file> \n \n <file path=\"catalog/controller/common/header.php\"> \n <operation > \n <search ><![CDATA[$data[\'language\'] = $this->load->controller(\'common/language\')]]></search> \n <add position=\"before\"><![CDATA[ \n $this->load->language(\'extension/soconfig/mobile\'); \n $data[\'objlang\'] = $this->language; \n $data[\'menu_search\'] = $this->url->link(\'product/search\', \'\', true); \n $data[\'mobile\'] = $this->config->get(\'mobile_general\'); \n $data[\'text_items\'] = sprintf($this->language->get(\'text_itemcount\'), $this->cart->countProducts() + (isset($this->session->data[\'vouchers\']) ? count($this->session->data[\'vouchers\']) : 0)); \n if($this->session->data[\'device\']==\'mobile\'){ \n $data[\'home\'] = $this->url->link(\'mobile/home\'); \n }else{ \n $data[\'home\'] = $this->url->link(\'common/home\'); \n } \n if(isset($this->request->get[\'layoutmobile\'])) $data[\'layoutmobile\'] = $this->request->get[\'layoutmobile\']; \n ]]></add> \n </operation> \n </file> \n \n <file path=\"catalog/controller/common/footer.php\"> \n <operation> \n <search ><![CDATA[return $this->load->view(\'common/footer\', $data); ]]></search> \n <add position=\"before\"><![CDATA[ \n // Menu Mobile \n $this->load->model(\'catalog/category\'); \n $this->load->model(\'catalog/product\'); \n $this->load->language(\'extension/soconfig/mobile\'); \n $data[\'objlang\'] = $this->language; \n $data[\'categories\'] = array(); \n $data[\'mobile\'] = $this->config->get(\'mobile_general\'); \n $data[\'text_account\'] = $this->language->get(\'text_account\'); \n $data[\'text_register\'] = $this->language->get(\'text_register\'); \n $data[\'text_login\'] = $this->language->get(\'text_login\'); \n \n $categories = $this->model_catalog_category->getCategories(0); \n \n \n foreach ($categories as $category) { \n if ($category[\'top\']) { \n // Level 2 \n $children_data = array(); \n \n $children = $this->model_catalog_category->getCategories($category[\'category_id\']); \n \n foreach ($children as $child) { \n $filter_data = array( \n \'filter_category_id\' => $child[\'category_id\'], \n \'filter_sub_category\' => true \n ); \n \n $children_data[] = array( \n \'name\' => $child[\'name\'] . ($this->config->get(\'config_product_count\') ? \' (\' . $this->model_catalog_product->getTotalProducts($filter_data) . \')\' : \'\'), \n \'href\' => $this->url->link(\'product/category\', \'path=\' . $category[\'category_id\'] . \'_\' . $child[\'category_id\']) \n ); \n } \n \n // Level 1 \n $data[\'categories\'][] = array( \n \'name\' => $category[\'name\'], \n \'children\' => $children_data, \n \'column\' => $category[\'column\'] ? $category[\'column\'] : 1, \n \'href\' => $this->url->link(\'product/category\', \'path=\' . $category[\'category_id\']) \n ); \n } \n } \n \n $data[\'language\'] = $this->load->controller(\'common/language\'); \n $data[\'currency\'] = $this->load->controller(\'common/currency\'); \n $data[\'search\'] = $this->load->controller(\'common/search\'); \n $data[\'cart\'] = $this->load->controller(\'common/cart\'); \n $data[\'wishlist\'] = $this->url->link(\'account/wishlist\', \'\', true); \n $data[\'compare\'] = $this->url->link(\'product/compare\', \'\', \'SSL\'); \n $data[\'text_compare\'] = sprintf($this->language->get(\'text_compare\'),(isset($this->session->data[\'compare\']) ? count($this->session->data[\'compare\']) : 0)); \n $data[\'logged\'] = $this->customer->isLogged(); \n $data[\'account\'] = $this->url->link(\'account/account\', \'\', true); \n $data[\'register\'] = $this->url->link(\'account/register\', \'\', true); \n $data[\'login\'] = $this->url->link(\'account/login\', \'\', true); \n \n \n ]]></add> \n </operation> \n \n </file> \n <!--End Catalog/controller/common--> \n \n <!--Catalog/controller/product--> \n <file path=\"catalog/controller/product/category.php\"> \n <operation> \n <search ><![CDATA[$data[\'heading_title\'] = $category_info[\'name\']]]></search> \n <add position=\"before\"><![CDATA[$data[\'mobile\'] = $this->config->get(\'mobile_general\');\n $data[\'objlang\'] = $this->language; \n ]]></add> \n </operation> \n </file> \n <file path=\"catalog/controller/product/{search,special,manufacturer}*.php\"> \n <operation> \n <search ><![CDATA[$this->load->model(\'tool/image\')]]></search> \n <add position=\"after\"><![CDATA[$data[\'mobile\'] = $this->config->get(\'mobile_general\');]]></add> \n </operation> \n \n </file> \n <file path=\"catalog/controller/product/product.php\"> \n <operation error=\"skip\"> \n <search ><![CDATA[$this->document->addScript(\'catalog/view/javascript/jquery/datetimepicker/moment.js\');]]></search> \n <add position=\"before\"><![CDATA[ \n if($this->session->data[\'device\']==\'mobile\'){ \n $this->document->addStyle(\'catalog/view/javascript/soconfig/css/mobile/slick.css\'); \n $this->document->addScript(\'catalog/view/javascript/soconfig/js/mobile/slick.min.js\'); \n } \n ]]></add> \n </operation> \n </file> \n <!--End Catalog/controller/product--> \n <file path=\"catalog/controller/extension/module/so_filter_shop_by.php\"> \n <operation> \n <search><![CDATA[$footer = \'\';]]></search> \n <add position=\"after\"><![CDATA[$mobile = $this->config->get(\'mobile_general\'); \n $objlang = $this->language; \n ]]></add> \n </operation> \n </file> \n</modification>',1,'2017-05-22 11:06:50'),
	(10,'Admin View Catalog ProductForm','Admin View Catalog ProductForm','MultifileUpload','1.2','','<?xml version=\"1.0\" encoding=\"utf-8\"?>\r\n<modification>\r\n	<code>Admin View Catalog ProductForm</code>\r\n    <name>Admin View Catalog ProductForm</name>\r\n    <version>1.2</version>\r\n    <author>MultifileUpload</author>\r\n    <link></link>\r\n    <file path=\"admin/view/template/catalog/product_form.tpl\">\r\n        <operation>\r\n            <search><![CDATA[\r\n            <button type=\"button\" onclick=\"addImage();\" data-toggle=\"tooltip\" title=\"<?php echo $button_image_add; ?>\" class=\"btn btn-primary\"><i class=\"fa fa-plus-circle\"></i></button>\r\n            ]]></search>\r\n            <add position=\"Replace\"><![CDATA[\r\n            <button type=\"button\" onclick=\"addMultiImage();\" data-toggle=\"tooltip\" title=\"<?php echo $button_image_add; ?>\" class=\"btn btn-primary\"><i class=\"fa fa-plus-circle\"></i></button>\r\n            ]]></add>\r\n        </operation>\r\n        <operation>\r\n            <search><![CDATA[\r\n            function addImage() {\r\n            ]]></search>\r\n            <add position=\"Replace\"><![CDATA[\r\n            function addMultiImage() {\r\n				$(\'#modal-image\').remove();\r\n				$.ajax({\r\n					url: \'index.php?route=common/multifilemanager&token=\' + getURLVar(\'token\') + \'&image_row=\' + image_row,\r\n					dataType: \'html\',\r\n					beforeSend: function() {\r\n						$(\'#button-image i\').replaceWith(\'<i class=\"fa fa-circle-o-notch fa-spin\"></i>\');\r\n						$(\'#button-image\').prop(\'disabled\', true);\r\n					},\r\n					complete: function() {\r\n						$(\'#button-image i\').replaceWith(\'<i class=\"fa fa-upload\"></i>\');\r\n						$(\'#button-image\').prop(\'disabled\', false);\r\n					},\r\n					success: function(html) {\r\n						$(\'body\').append(\'<div id=\"modal-image\" class=\"modal\">\' + html + \'</div>\');\r\n\r\n						$(\'#modal-image\').modal(\'show\');\r\n					}\r\n				});\r\n			}\r\n			\r\n			function addImage() {\r\n            ]]></add>\r\n        </operation>\r\n    </file>  \r\n</modification>',1,'2017-07-25 11:59:43'),
	(11,'Fix Filter Opencart 2.x','fixfilter','AlexDW','1.00','https://www.opencart.com/index.php?route=marketplace/extension&filter_member=AlexDW','<?xml version=\"1.0\" encoding=\"UTF-8\"?>\r\n<modification>\r\n	<name>Fix Filter Opencart 2.x</name>\r\n	<version>1.00</version>\r\n	<author>AlexDW</author>\r\n	<link>https://www.opencart.com/index.php?route=marketplace/extension&amp;filter_member=AlexDW</link>\r\n	<code>fixfilter</code>\r\n	<file path=\"catalog/model/catalog/product.php\">		\r\n		<operation error=\"abort\">\r\n		<search><![CDATA[\r\n$sql .= \" AND pf.filter_id IN (\" . implode(\',\', $implode) . \")\";\r\n			]]></search>\r\n			<add position=\"after\" ><![CDATA[\r\n// FixFilter\r\n			$minq=$this->db->query(\"\r\nSELECT id.product_id FROM(SELECT \r\n    product_id, count(i.product_id) as t, c.filter_group as b\r\nFROM\r\n    (SELECT \r\n        f.filter_id, f.product_id, p.filter_group_id\r\n    FROM\r\n        \". DB_PREFIX .\"product_filter f\r\n    left join \". DB_PREFIX .\"filter p ON p.filter_id = f.filter_id\r\n    where\r\n        p.filter_id IN (\" . implode(\',\', $implode) . \")\r\n    GROUP BY product_id , filter_group_id) as i,\r\n    (select \r\n        count(distinct filter_group_id) as filter_group\r\n    from\r\n        \". DB_PREFIX .\"filter_description f_b\r\n    WHERE f_b.filter_id in (\" . implode(\',\', $implode) . \")) as c\r\nGROUP BY product_id\r\nHAVING t = b) as id\");\r\n\r\n$min=array();\r\n\r\nfor($x=0;$x<count($minq->rows);$x++){	\r\n	\r\n	foreach($minq->rows[$x] as $value){\r\n		$min[]=$value;\r\n	}\r\n}\r\n\r\n$imp=implode(\',\',$min);\r\n// FixFilter END\r\n			]]></add>\r\n		</operation>\r\n\r\n		<operation error=\"abort\">\r\n		<search><![CDATA[\r\n$sql .= \" AND p.manufacturer_id = \'\" . (int)$data[\'filter_manufacturer_id\'] . \"\'\";\r\n			]]></search>\r\n			<add position=\"after\" offset=\"1\"><![CDATA[\r\n// FixFilter\r\n			if(isset($filters)){\r\n				if(!count($min)){\r\n					$imp=\'0000000\';\r\n				}\r\n			$sql .= \" AND p.product_id IN(\".$imp.\")\";\r\n			}\r\n// FixFilter END\r\n			]]></add>\r\n		</operation>\r\n	</file>\r\n</modification>',1,'2017-11-12 16:36:59');

/*!40000 ALTER TABLE `modification` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table module
# ------------------------------------------------------------

DROP TABLE IF EXISTS `module`;

CREATE TABLE `module` (
  `module_id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(64) NOT NULL,
  `code` varchar(32) NOT NULL,
  `setting` text NOT NULL,
  PRIMARY KEY (`module_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

LOCK TABLES `module` WRITE;
/*!40000 ALTER TABLE `module` DISABLE KEYS */;

INSERT INTO `module` (`module_id`, `name`, `code`, `setting`)
VALUES
	(30,'Category','banner','{\"name\":\"Category\",\"banner_id\":\"6\",\"width\":\"182\",\"height\":\"182\",\"status\":\"1\"}'),
	(29,'Home Page','carousel','{\"name\":\"Home Page\",\"banner_id\":\"8\",\"width\":\"130\",\"height\":\"100\",\"status\":\"1\"}'),
	(28,'Home Page','featured','{\"name\":\"Home Page\",\"product\":[\"43\",\"40\",\"42\",\"30\"],\"limit\":\"4\",\"width\":\"200\",\"height\":\"200\",\"status\":\"1\"}'),
	(27,'Home Page','slideshow','{\"name\":\"Home Page\",\"banner_id\":\"7\",\"width\":\"1140\",\"height\":\"380\",\"status\":\"1\"}'),
	(31,'Banner 1','banner','{\"name\":\"Banner 1\",\"banner_id\":\"6\",\"width\":\"182\",\"height\":\"182\",\"status\":\"1\"}'),
	(261,'Newsletter - Home Popup','so_newletter_custom_popup','{\"action\":\"\",\"name\":\"Newsletter - Home Popup\",\"module_description\":{\"1\":{\"head_name\":\"Newsletter\"}},\"head_name\":\"Newsletter\",\"disp_title_module\":\"0\",\"status\":\"0\",\"class_suffix\":\"main-newsleter-popup\",\"expired\":\"1\",\"layout\":\"layout_popup\",\"width\":\"840px\",\"image_bg_display\":\"1\",\"image\":\"catalog\\/demo\\/bonuspage\\/newletter\\/bg-newsletter-popup.jpg\",\"color_bg\":\"fff\",\"title_display\":\"1\",\"description_content\":{\"1\":{\"title\":\"Newsletter\",\"newsletter_promo\":\"Subscribe to the Topdeals mailing list to receive updates on new arrivals, special offers and other discount information.\"}},\"email_template_subject\":\"\",\"content_email\":\"\",\"pre_text\":\"\",\"post_text\":\"\",\"use_cache\":\"0\",\"cache_time\":\"3600\",\"footer_display1\":\"1\",\"footer_display2\":\"1\",\"footer_display3\":\"1\",\"moduleid\":\"261\"}'),
	(291,'Upsell - Detail full','so_extra_slider','{\"action\":\"save_edit\",\"name\":\"Upsell - Detail full\",\"module_description\":{\"1\":{\"head_name\":\"Upsell - Detail\"},\"2\":{\"head_name\":\"Upsell - Detail\"}},\"head_name\":\"Upsell - Detail\",\"disp_title_module\":\"0\",\"status\":\"1\",\"type_layout\":\"0\",\"class_suffix\":\"ex_upsell custom-extra clearfix\",\"item_link_target\":\"_self\",\"button_page\":\"top\",\"products_style\":\"style1\",\"nb_column0\":\"3\",\"nb_column1\":\"3\",\"nb_column2\":\"2\",\"nb_column3\":\"2\",\"nb_column4\":\"1\",\"nb_row\":\"1\",\"type_data\":\"category\",\"product_feature\":\"\",\"category\":[\"17\"],\"child_category\":\"1\",\"category_depth\":\"1\",\"product_sort\":\"p.price\",\"product_ordering\":\"ASC\",\"limitation\":\"6\",\"display_title\":\"1\",\"title_maxlength\":\"50\",\"display_description\":\"0\",\"description_maxlength\":\"100\",\"display_price\":\"1\",\"display_readmore_link\":\"0\",\"readmore_text\":\"Readmore\",\"display_add_to_cart\":\"1\",\"display_wishlist\":\"1\",\"display_compare\":\"1\",\"display_rating\":\"0\",\"display_sale\":\"1\",\"display_new\":\"1\",\"date_day\":\"337\",\"product_image_num\":\"1\",\"product_image\":\"1\",\"product_get_image_data\":\"1\",\"product_get_image_image\":\"1\",\"width\":\"370\",\"height\":\"370\",\"placeholder_path\":\"nophoto.png\",\"margin\":\"30\",\"slideBy\":\"1\",\"autoplay\":\"0\",\"autoplayTimeout\":\"5000\",\"autoplayHoverPause\":\"0\",\"autoplaySpeed\":\"1000\",\"startPosition\":\"0\",\"mouseDrag\":\"1\",\"touchDrag\":\"1\",\"effect\":\"none\",\"dots\":\"0\",\"dotsSpeed\":\"500\",\"loop\":\"1\",\"navs\":\"1\",\"navSpeed\":\"500\",\"duration\":\"800\",\"delay\":\"500\",\"pre_text\":\"\",\"post_text\":\"\",\"use_cache\":\"0\",\"cache_time\":\"3600\",\"moduleid\":\"291\"}'),
	(222,'Home 1 - Spa &amp; Massage','so_listing_tabs','{\"action\":\"save_edit\",\"name\":\"Home 1 - Spa &amp; Massage\",\"module_description\":{\"1\":{\"head_name\":\"Spa &amp; Massage\"},\"2\":{\"head_name\":\"Spa &amp; Massage\"}},\"head_name\":\"Spa &amp; Massage\",\"disp_title_module\":\"1\",\"status\":\"1\",\"type_layout\":\"0\",\"class_suffix\":\"home-lt1 default-nav clearfix img-float label-1\",\"item_link_target\":\"_self\",\"nb_column0\":\"4\",\"nb_column1\":\"3\",\"nb_column2\":\"3\",\"nb_column3\":\"2\",\"nb_column4\":\"1\",\"type_show\":\"loadmore\",\"nb_row\":\"1\",\"type_source\":\"1\",\"category\":[\"20\"],\"child_category\":\"1\",\"category_depth\":\"1\",\"product_sort\":\"pd.name\",\"product_ordering\":\"DESC\",\"source_limit\":\"8\",\"catid_preload\":\"20\",\"field_product_tab\":[\"rating\",\"p_date_added\",\"sell\"],\"field_preload\":\"rating\",\"tab_all_display\":\"0\",\"tab_max_characters\":\"40\",\"tab_icon_display\":\"0\",\"cat_order_by\":\"name\",\"imgcfgcat_width\":\"70\",\"imgcfgcat_height\":\"30\",\"display_title\":\"1\",\"title_maxlength\":\"60\",\"display_description\":\"0\",\"description_maxlength\":\"100\",\"display_price\":\"1\",\"display_add_to_cart\":\"1\",\"display_wishlist\":\"1\",\"display_compare\":\"1\",\"display_rating\":\"0\",\"display_sale\":\"1\",\"display_new\":\"1\",\"date_day\":\"427\",\"product_image_num\":\"1\",\"product_image\":\"1\",\"product_get_image_data\":\"1\",\"product_get_image_image\":\"1\",\"width\":\"370\",\"height\":\"370\",\"product_placeholder_path\":\"nophoto.png\",\"display_banner_image\":\"0\",\"banner_image\":\"catalog\\/demo\\/banners\\/home1\\/7.jpg\",\"banner_width\":\"196\",\"banner_height\":\"540\",\"banner_image_url\":\"#\",\"effect\":\"none\",\"margin\":\"30\",\"duration\":\"800\",\"delay\":\"500\",\"autoplay\":\"0\",\"display_nav\":\"1\",\"display_loop\":\"0\",\"touchdrag\":\"1\",\"mousedrag\":\"1\",\"pausehover\":\"0\",\"autoplayTimeout\":\"5000\",\"autoplaySpeed\":\"1000\",\"pre_text\":\"\",\"post_text\":\"\",\"use_cache\":\"0\",\"cache_time\":\"3600\",\"moduleid\":\"222\"}'),
	(269,'Upsell - Detail','so_extra_slider','{\"action\":\"save_edit\",\"name\":\"Upsell - Detail\",\"module_description\":{\"1\":{\"head_name\":\"Upsell - Detail\"},\"2\":{\"head_name\":\"Upsell - Detail\"}},\"head_name\":\"Upsell - Detail\",\"disp_title_module\":\"0\",\"status\":\"1\",\"type_layout\":\"0\",\"class_suffix\":\"ex_upsell custom-extra clearfix\",\"item_link_target\":\"_blank\",\"button_page\":\"top\",\"products_style\":\"style1\",\"nb_column0\":\"3\",\"nb_column1\":\"3\",\"nb_column2\":\"2\",\"nb_column3\":\"2\",\"nb_column4\":\"1\",\"nb_row\":\"1\",\"type_data\":\"category\",\"product_feature\":\"\",\"category\":[\"17\"],\"child_category\":\"1\",\"category_depth\":\"1\",\"product_sort\":\"p.price\",\"product_ordering\":\"ASC\",\"limitation\":\"6\",\"display_title\":\"1\",\"title_maxlength\":\"50\",\"display_description\":\"0\",\"description_maxlength\":\"100\",\"display_price\":\"1\",\"display_readmore_link\":\"0\",\"readmore_text\":\"Readmore\",\"display_add_to_cart\":\"1\",\"display_wishlist\":\"1\",\"display_compare\":\"1\",\"display_rating\":\"0\",\"display_sale\":\"1\",\"display_new\":\"1\",\"date_day\":\"227\",\"product_image_num\":\"1\",\"product_image\":\"1\",\"product_get_image_data\":\"1\",\"product_get_image_image\":\"1\",\"width\":\"370\",\"height\":\"370\",\"placeholder_path\":\"nophoto.png\",\"margin\":\"30\",\"slideBy\":\"1\",\"autoplay\":\"0\",\"autoplayTimeout\":\"5000\",\"autoplayHoverPause\":\"0\",\"autoplaySpeed\":\"1000\",\"startPosition\":\"0\",\"mouseDrag\":\"1\",\"touchDrag\":\"1\",\"effect\":\"none\",\"dots\":\"0\",\"dotsSpeed\":\"500\",\"loop\":\"0\",\"navs\":\"1\",\"navSpeed\":\"500\",\"duration\":\"800\",\"delay\":\"500\",\"pre_text\":\"\",\"post_text\":\"\",\"use_cache\":\"0\",\"cache_time\":\"&lt;b&gt;Notice&lt;\\/b&gt;: Undefined index: cache_time in &lt;b&gt;E:\\\\xampp\\\\htdocs\\\\ytc_templates\\\\opencart\\\\so23_maxshop\\\\admin\\\\view\\\\template\\\\extension\\\\module\\\\so_extra_slider.tpl&lt;\\/b&gt; on line &lt;b&gt;1218&lt;\\/b&gt;\",\"moduleid\":\"269\"}'),
	(268,'Best Sellers Detail','so_extra_slider','{\"action\":\"save_edit\",\"name\":\"Best Sellers Detail\",\"module_description\":{\"1\":{\"head_name\":\"Best Sellers\"},\"2\":{\"head_name\":\"Best Sellers\"}},\"head_name\":\"Best Sellers\",\"disp_title_module\":\"1\",\"status\":\"1\",\"type_layout\":\"3\",\"class_suffix\":\"best-seller best-seller-custom fa-diamond fa-hidden \",\"item_link_target\":\"_self\",\"button_page\":\"top\",\"products_style\":\"style1\",\"nb_column0\":\"1\",\"nb_column1\":\"1\",\"nb_column2\":\"1\",\"nb_column3\":\"1\",\"nb_column4\":\"1\",\"nb_row\":\"6\",\"type_data\":\"category\",\"product_feature\":\"\",\"category\":[\"25\",\"33\"],\"child_category\":\"1\",\"category_depth\":\"1\",\"product_sort\":\"p.price\",\"product_ordering\":\"ASC\",\"limitation\":\"8\",\"display_title\":\"1\",\"title_maxlength\":\"35\",\"display_description\":\"0\",\"description_maxlength\":\"100\",\"display_price\":\"1\",\"display_readmore_link\":\"0\",\"readmore_text\":\"Readmore\",\"display_add_to_cart\":\"0\",\"display_wishlist\":\"0\",\"display_compare\":\"0\",\"display_rating\":\"1\",\"display_sale\":\"0\",\"display_new\":\"0\",\"date_day\":\"7\",\"product_image_num\":\"1\",\"product_image\":\"1\",\"product_get_image_data\":\"1\",\"product_get_image_image\":\"1\",\"width\":\"100\",\"height\":\"100\",\"placeholder_path\":\"nophoto.png\",\"margin\":\"1\",\"slideBy\":\"1\",\"autoplay\":\"0\",\"autoplayTimeout\":\"5000\",\"autoplayHoverPause\":\"0\",\"autoplaySpeed\":\"1000\",\"startPosition\":\"0\",\"mouseDrag\":\"1\",\"touchDrag\":\"1\",\"effect\":\"none\",\"dots\":\"0\",\"dotsSpeed\":\"500\",\"loop\":\"0\",\"navs\":\"0\",\"navSpeed\":\"500\",\"duration\":\"800\",\"delay\":\"500\",\"pre_text\":\"\",\"post_text\":\"\",\"use_cache\":\"0\",\"cache_time\":\"&lt;b&gt;Notice&lt;\\/b&gt;: Undefined index: cache_time in &lt;b&gt;E:\\\\xampp\\\\htdocs\\\\ytc_templates\\\\opencart\\\\so23_maxshop\\\\admin\\\\view\\\\template\\\\extension\\\\module\\\\so_extra_slider.tpl&lt;\\/b&gt; on line &lt;b&gt;1218&lt;\\/b&gt;\",\"moduleid\":\"268\"}'),
	(212,'Home 1 - Latest Blog','so_latest_blog','{\"action\":\"save_edit\",\"name\":\"Home 1 - Latest Blog\",\"module_description\":{\"1\":{\"head_name\":\"Latest Blog\"},\"2\":{\"head_name\":\"Latest Blog\"}},\"head_name\":\"Latest Blog\",\"disp_title_module\":\"1\",\"status\":\"1\",\"type_layout\":\"0\",\"class_suffix\":\"custom-ourblog clearfix default-nav\",\"item_link_target\":\"_self\",\"nb_column0\":\"2\",\"nb_column1\":\"2\",\"nb_column2\":\"2\",\"nb_column3\":\"2\",\"nb_column4\":\"1\",\"type_show\":\"slider\",\"nb_row\":\"1\",\"category\":[\"5\",\"2\",\"3\"],\"child_category\":\"1\",\"category_depth\":\"1\",\"sort\":\"bd.article_title\",\"order\":\"ASC\",\"limit\":\"6\",\"display_title\":\"1\",\"title_maxlength\":\"75\",\"display_description\":\"1\",\"description_maxlength\":\"120\",\"display_author\":\"0\",\"display_comment\":\"0\",\"display_view\":\"0\",\"display_date_added\":\"1\",\"display_readmore\":\"1\",\"readmore_text\":\"Read more\",\"blog_image\":\"1\",\"blog_get_featured_image\":\"1\",\"width\":\"260\",\"height\":\"190\",\"blog_placeholder_path\":\"nophoto.png\",\"margin\":\"30\",\"slideBy\":\"1\",\"autoplay\":\"0\",\"autoplay_timeout\":\"5000\",\"pausehover\":\"0\",\"autoplaySpeed\":\"1000\",\"startPosition\":\"0\",\"mouseDrag\":\"1\",\"touchDrag\":\"1\",\"loop\":\"1\",\"button_page\":\"under\",\"dots\":\"1\",\"dotsSpeed\":\"500\",\"navs\":\"0\",\"navSpeed\":\"500\",\"effect\":\"none\",\"duration\":\"800\",\"delay\":\"500\",\"pre_text\":\"\",\"post_text\":\"\",\"use_cache\":\"0\",\"cache_time\":\"3600\",\"moduleid\":\"212\"}'),
	(194,'Home Page - Slideshow','so_home_slider','{\"name\":\"Home Page - Slideshow\",\"module_description\":{\"1\":{\"head_name\":\"Slideshow\"},\"2\":{\"head_name\":\"Slideshow\"}},\"head_name\":\"Slideshow\",\"disp_title_module\":\"0\",\"status\":\"1\",\"class_suffix\":\"\",\"item_link_target\":\"_self\",\"nb_column0\":\"1\",\"nb_column1\":\"1\",\"nb_column2\":\"1\",\"nb_column3\":\"1\",\"nb_column4\":\"1\",\"width\":\"883\",\"height\":\"355\",\"center\":\"0\",\"autoplay\":\"1\",\"autoplayTimeout\":\"5000\",\"autoplayHoverPause\":\"1\",\"autoplaySpeed\":\"1000\",\"startPosition\":\"0\",\"mouseDrag\":\"1\",\"touchDrag\":\"1\",\"loop\":\"1\",\"dots\":\"1\",\"navs\":\"1\",\"animateOut\":\"none\",\"animateIn\":\"none\",\"pre_text\":\"\",\"post_text\":\"\",\"use_cache\":\"0\",\"cache_time\":\"3600\",\"image\":\"\",\"slide_link\":\"\",\"slide_status\":\"1\",\"slide_description\":{\"1\":{\"slide_title\":\"\",\"language_id\":\"1\",\"slide_caption\":\"\",\"slide_desciption\":\" \"},\"2\":{\"slide_title\":\"\",\"language_id\":\"2\",\"slide_caption\":\"\",\"slide_desciption\":\" \"}},\"moduleid\":\"194\"}'),
	(133,'Jewelry - Home Layout 2','so_category_slider','{\"action\":\"save_edit\",\"name\":\"Jewelry - Home Layout 2\",\"module_description\":{\"1\":{\"head_name\":\"Jewelry\"},\"2\":{\"head_name\":\"Jewelry\"}},\"head_name\":\"Jewelry\",\"disp_title_module\":\"1\",\"status\":\"1\",\"class_suffix\":\"custom_cate_slider custom_cate_slider_v2 default-nav\",\"item_link_target\":\"_self\",\"nb_column0\":\"1\",\"nb_column1\":\"1\",\"nb_column2\":\"1\",\"nb_column3\":\"1\",\"nb_column4\":\"1\",\"category\":\"20\",\"child_category\":\"1\",\"category_depth\":\"1\",\"product_sort\":\"p.price\",\"product_ordering\":\"DESC\",\"source_limit\":\"5\",\"display_feature\":\"1\",\"product_feature\":[\"176\",\"32\"],\"cat_title_display\":\"1\",\"cat_title_maxcharacs\":\"25\",\"cat_image_display\":\"0\",\"width_cat\":\"870\",\"height_cat\":\"100\",\"placeholder_path\":\"catalog\\/view\\/javascript\\/so_category_slider\\/images\\/nophoto.jpg\",\"child_category_cat\":\"1\",\"source_limit_cat\":\"4\",\"cat_sub_title_maxcharacs\":\"25\",\"cat_all_product\":\"0\",\"display_title\":\"1\",\"title_maxlength\":\"50\",\"display_description\":\"0\",\"description_maxlength\":\"100\",\"product_image\":\"1\",\"product_image_num\":\"2\",\"width\":\"266\",\"height\":\"266\",\"nb_row\":\"3\",\"display_rating\":\"0\",\"display_price\":\"1\",\"display_addtocart\":\"0\",\"display_wishlist\":\"0\",\"display_compare\":\"0\",\"display_sale\":\"1\",\"display_new\":\"1\",\"date_day\":\"7\",\"margin\":\"5\",\"slideBy\":\"4\",\"autoplay\":\"0\",\"autoplay_timeout\":\"5000\",\"pausehover\":\"0\",\"autoplaySpeed\":\"1000\",\"startPosition\":\"0\",\"mouseDrag\":\"1\",\"touchDrag\":\"1\",\"navs\":\"1\",\"navSpeed\":\"500\",\"effect\":\"none\",\"duration\":\"800\",\"delay\":\"500\",\"pre_text\":\" \",\"post_text\":\" \",\"use_cache\":\"0\",\"cache_time\":\"3600\",\"moduleid\":\"133\"}'),
	(190,'Home Page - Best Sellers Listing','so_extra_slider','{\"action\":\"save_edit\",\"name\":\"Home Page - Best Sellers Listing\",\"module_description\":{\"1\":{\"head_name\":\"Best Sellers\"},\"2\":{\"head_name\":\"Best Sellers\"}},\"head_name\":\"Best Sellers\",\"disp_title_module\":\"1\",\"status\":\"1\",\"type_layout\":\"3\",\"class_suffix\":\"best-seller best-seller-custom\",\"item_link_target\":\"_self\",\"button_page\":\"top\",\"products_style\":\"style1\",\"nb_column0\":\"1\",\"nb_column1\":\"1\",\"nb_column2\":\"1\",\"nb_column3\":\"1\",\"nb_column4\":\"1\",\"nb_row\":\"4\",\"type_data\":\"category\",\"product_feature\":\"\",\"category\":[\"25\",\"33\"],\"child_category\":\"1\",\"category_depth\":\"1\",\"product_sort\":\"p.price\",\"product_ordering\":\"ASC\",\"limitation\":\"8\",\"display_title\":\"1\",\"title_maxlength\":\"20\",\"display_description\":\"0\",\"description_maxlength\":\"100\",\"display_price\":\"1\",\"display_readmore_link\":\"0\",\"readmore_text\":\"Readmore\",\"display_add_to_cart\":\"0\",\"display_wishlist\":\"0\",\"display_compare\":\"0\",\"display_rating\":\"1\",\"display_sale\":\"0\",\"display_new\":\"0\",\"date_day\":\"7\",\"product_image_num\":\"1\",\"product_image\":\"1\",\"product_get_image_data\":\"1\",\"product_get_image_image\":\"1\",\"width\":\"100\",\"height\":\"100\",\"placeholder_path\":\"nophoto.png\",\"margin\":\"1\",\"slideBy\":\"1\",\"autoplay\":\"0\",\"autoplayTimeout\":\"5000\",\"autoplayHoverPause\":\"0\",\"autoplaySpeed\":\"1000\",\"startPosition\":\"0\",\"mouseDrag\":\"1\",\"touchDrag\":\"1\",\"effect\":\"none\",\"dots\":\"0\",\"dotsSpeed\":\"500\",\"loop\":\"0\",\"navs\":\"0\",\"navSpeed\":\"500\",\"duration\":\"800\",\"delay\":\"500\",\"pre_text\":\"\",\"post_text\":\"\",\"use_cache\":\"0\",\"cache_time\":\"&lt;b&gt;Notice&lt;\\/b&gt;: Undefined index: cache_time in &lt;b&gt;E:\\\\xampp\\\\htdocs\\\\ytc_templates\\\\opencart\\\\so23_maxshop\\\\admin\\\\view\\\\template\\\\extension\\\\module\\\\so_extra_slider.tpl&lt;\\/b&gt; on line &lt;b&gt;1218&lt;\\/b&gt;\",\"moduleid\":\"190\"}'),
	(147,'Bestsellers','bestseller','{\"name\":\"Bestsellers\",\"limit\":\"2\",\"width\":\"84\",\"height\":\"84\",\"status\":\"1\"}'),
	(179,'So Filter Shop By','so_filter_shop_by','{\"action\":\"save_edit\",\"name\":\"So Filter Shop By\",\"module_description\":{\"1\":{\"head_name\":\"SHOP BY\"},\"2\":{\"head_name\":\"\\u0627\\u0644\\u0645\\u062d\\u0644 \\u0645\\u0646 \\u0642\\u0628\\u0644\"}},\"head_name\":\"SHOP BY\",\"disp_title_module\":\"1\",\"status\":\"1\",\"class_suffix\":\"block-shopby\",\"in_class\":\"#content .row\",\"use_cache\":\"0\",\"cache_time\":\"3600\",\"disp_manu_all\":\"1\",\"disp_manu_id_5\":\"1\",\"disp_manu_id_6\":\"1\",\"disp_manu_id_7\":\"1\",\"disp_manu_id_8\":\"1\",\"disp_manu_id_9\":\"1\",\"disp_manu_id_10\":\"1\",\"disp_pro_price\":\"1\",\"disp_search_text\":\"1\",\"character_search\":\"3\",\"disp_subcategory\":\"1\",\"disp_reset_all\":\"1\",\"disp_att_group_id_6\":\"0\",\"disp_att_id_1\":\"1\",\"disp_att_id_2\":\"1\",\"disp_att_id_3\":\"1\",\"disp_att_group_id_3\":\"0\",\"disp_att_id_4\":\"1\",\"disp_att_id_5\":\"1\",\"disp_att_id_6\":\"1\",\"disp_att_id_7\":\"1\",\"disp_att_id_8\":\"1\",\"disp_att_id_9\":\"1\",\"disp_att_id_10\":\"1\",\"disp_att_id_11\":\"1\",\"disp_opt_id_1\":\"0\",\"disp_opt_id_2\":\"0\",\"disp_opt_id_5\":\"0\",\"disp_opt_id_11\":\"1\",\"disp_opt_id_13\":\"1\",\"moduleid\":\"179\"}'),
	(276,'Home3 - Instagram Home 3','so_instagram_gallery','{\"action\":\"save_edit\",\"name\":\"Home3 - Instagram Home 3\",\"module_description\":{\"1\":{\"head_name\":\"Instargram Gallery\"},\"2\":{\"head_name\":\"Instargram Gallery\"}},\"head_name\":\"Instargram Gallery\",\"disp_title_module\":\"1\",\"status\":\"1\",\"class_suffix\":\"home3_instagram footer-links\",\"type_show\":\"slider\",\"row\":\"2\",\"nb_column0\":\"3\",\"nb_column1\":\"3\",\"nb_column2\":\"2\",\"nb_column3\":\"2\",\"nb_column4\":\"1\",\"users_id\":\"4894431401\",\"access_token\":\"4894431401.1677ed0.686c4b5fed2a4983bde609e1016b150f\",\"limit_image\":\"6\",\"show_fullname\":\"1\",\"margin\":\"15\",\"slideBy\":\"1\",\"autoplay\":\"0\",\"autoplay_timeout\":\"5000\",\"pausehover\":\"0\",\"autoplaySpeed\":\"1000\",\"startPosition\":\"0\",\"mouseDrag\":\"1\",\"touchDrag\":\"1\",\"loop\":\"1\",\"button_page\":\"under\",\"dots\":\"0\",\"dotsSpeed\":\"500\",\"navs\":\"0\",\"navSpeed\":\"500\",\"effect\":\"none\",\"duration\":\"800\",\"delay\":\"500\",\"pre_text\":\"\",\"post_text\":\"\",\"use_cache\":\"0\",\"cache_time\":\"3600\",\"moduleid\":\"276\"}'),
	(153,'Electronic - Home Layout 2','so_super_category','{\"action\":\"\",\"name\":\"Electronic - Home Layout 2\",\"module_description\":{\"1\":{\"head_name\":\"Electronic\"}},\"head_name\":\"Electronic\",\"disp_title_module\":\"0\",\"status\":\"1\",\"advanced_mod_class_suffix\":\"custom_supper custom_supper_v2\",\"item_link_target\":\"_self\",\"category\":\"17\",\"category_depth\":\"1\",\"field_product_tab\":[\"pd_name\"],\"field_preload\":\"pd_name\",\"limitation\":\"10\",\"product_ordering\":\"DESC\",\"category_column0\":\"4\",\"category_column1\":\"4\",\"category_column2\":\"3\",\"category_column3\":\"2\",\"category_column4\":\"1\",\"category_title_maxlength\":\"25\",\"display_title_sub_category\":\"1\",\"display_slide_category\":\"1\",\"show_category_type\":\"0\",\"sub_category_title_maxlength\":\"25\",\"category_width\":\"200\",\"category_height\":\"100\",\"category_placeholder_path\":\"nophoto.png\",\"product_column0\":\"5\",\"product_column1\":\"4\",\"product_column2\":\"3\",\"product_column3\":\"2\",\"product_column4\":\"1\",\"type_show\":\"slider\",\"rows\":\"2\",\"product_display_title\":\"1\",\"product_title_maxlength\":\"15\",\"product_display_description\":\"0\",\"product_description_maxlength\":\"200\",\"product_display_price\":\"1\",\"display_add_to_cart\":\"1\",\"display_wishlist\":\"1\",\"display_compare\":\"1\",\"display_rating\":\"0\",\"display_sale\":\"1\",\"display_new\":\"1\",\"date_day\":\"227\",\"product_image_num\":\"1\",\"product_image\":\"1\",\"product_get_image_data\":\"1\",\"product_get_image_image\":\"1\",\"product_width\":\"196\",\"product_height\":\"196\",\"product_placeholder_path\":\"nophoto.png\",\"effect\":\"bounce\",\"product_duration\":\"600\",\"product_delay\":\"300\",\"subcategory_center\":\"0\",\"subcategory_display_navigation\":\"0\",\"subcategory_display_loop\":\"0\",\"subcategory_margin_right\":\"5\",\"subcategory_slideby\":\"1\",\"subcategory_auto_play\":\"0\",\"subcategory_auto_interval_timeout\":\"300\",\"subcategory_auto_hover_pause\":\"1\",\"subcategory_auto_play_speed\":\"300\",\"subcategory_navigation_speed\":\"3000\",\"subcategory_start_position\":\"0\",\"subcategory_mouse_drag\":\"1\",\"subcategory_touch_drag\":\"1\",\"slider_auto_play\":\"0\",\"slider_display_navigation\":\"0\",\"slider_display_loop\":\"0\",\"slider_mouse_drag\":\"1\",\"slider_touch_drag\":\"1\",\"slider_auto_hover_pause\":\"1\",\"slider_auto_interval_timeout\":\"5000\",\"slider_auto_play_speed\":\"2000\",\"pre_text\":\"\",\"post_text\":\"\",\"use_cache\":\"0\",\"cache_time\":\"3600\",\"moduleid\":\"153\"}'),
	(247,'Quick View','so_quickview','{\"action\":\"save_edit\",\"name\":\"Quick View\",\"status\":\"1\",\"class_suffix\":\".so-quickview\",\"label_button\":{\"1\":{\"label_text\":\"Quick View\"},\"2\":{\"label_text\":\"\\u0646\\u0638\\u0631\\u0629 \\u0633\\u0631\\u064a\\u0639\\u0629\"}},\"label_text\":\"Quick View\",\"moduleid\":\"247\"}'),
	(121,'Vertical Menu','so_megamenu','{\"button-save\":\"\",\"moduleid\":\"121\",\"name\":\"Vertical Menu\",\"suffix_class\":\"\",\"head_name\":{\"1\":\"Categories\"},\"disp_title_module\":\"0\",\"status\":\"0\",\"use_cache\":\"1\",\"cache_time\":\"3600\",\"orientation\":\"1\",\"show_itemver\":\"7\",\"navigation_text\":{\"1\":\"Categories\"},\"full_width\":\"0\",\"home_item\":\"text\",\"home_text\":{\"1\":\"Home\"},\"animation\":\"slide\",\"animation_time\":\"300\",\"layout_id\":100,\"position\":\"menu\",\"sort_order\":0,\"label_item\":\"hot\",\"icon_font\":\"fa fa-camera-retro\",\"class_menu\":\"\",\"search_bar\":0}'),
	(132,'Health &amp; Beauty - Home Layout 2','so_category_slider','{\"action\":\"save_edit\",\"name\":\"Health &amp; Beauty - Home Layout 2\",\"module_description\":{\"1\":{\"head_name\":\"Health &amp; Beauty\"},\"2\":{\"head_name\":\"Health &amp; Beauty\"}},\"head_name\":\"Health &amp; Beauty\",\"disp_title_module\":\"1\",\"status\":\"1\",\"class_suffix\":\"custom_cate_slider default-nav\",\"item_link_target\":\"_self\",\"nb_column0\":\"1\",\"nb_column1\":\"1\",\"nb_column2\":\"1\",\"nb_column3\":\"1\",\"nb_column4\":\"1\",\"category\":\"25\",\"child_category\":\"1\",\"category_depth\":\"1\",\"product_sort\":\"p.price\",\"product_ordering\":\"ASC\",\"source_limit\":\"6\",\"display_feature\":\"1\",\"product_feature\":[\"94\",\"47\"],\"cat_title_display\":\"0\",\"cat_title_maxcharacs\":\"25\",\"cat_image_display\":\"1\",\"width_cat\":\"250\",\"height_cat\":\"250\",\"placeholder_path\":\"catalog\\/view\\/javascript\\/so_category_slider\\/images\\/nophoto.jpg\",\"child_category_cat\":\"1\",\"source_limit_cat\":\"3\",\"cat_sub_title_maxcharacs\":\"12\",\"cat_all_product\":\"0\",\"display_title\":\"1\",\"title_maxlength\":\"40\",\"display_description\":\"0\",\"description_maxlength\":\"100\",\"product_image\":\"1\",\"product_image_num\":\"1\",\"width\":\"266\",\"height\":\"266\",\"nb_row\":\"3\",\"display_rating\":\"0\",\"display_price\":\"1\",\"display_addtocart\":\"0\",\"display_wishlist\":\"0\",\"display_compare\":\"0\",\"display_sale\":\"1\",\"display_new\":\"1\",\"date_day\":\"7\",\"margin\":\"5\",\"slideBy\":\"4\",\"autoplay\":\"0\",\"autoplay_timeout\":\"5000\",\"pausehover\":\"0\",\"autoplaySpeed\":\"1000\",\"startPosition\":\"0\",\"mouseDrag\":\"1\",\"touchDrag\":\"1\",\"navs\":\"0\",\"navSpeed\":\"500\",\"effect\":\"none\",\"duration\":\"800\",\"delay\":\"500\",\"pre_text\":\" \",\"post_text\":\" \",\"use_cache\":\"0\",\"cache_time\":\"3600\",\"moduleid\":\"132\"}'),
	(154,'Sports - Home Layout 2','so_super_category','{\"action\":\"save_edit\",\"name\":\"Sports - Home Layout 2\",\"module_description\":{\"1\":{\"head_name\":\"Sports\"},\"2\":{\"head_name\":\"Sports\"}},\"head_name\":\"Sports\",\"disp_title_module\":\"0\",\"status\":\"1\",\"advanced_mod_class_suffix\":\"custom_supper custom_supper_v3\",\"item_link_target\":\"_blank\",\"category\":\"34\",\"category_depth\":\"1\",\"field_product_tab\":[\"p_quantity\"],\"field_preload\":\"p_quantity\",\"limitation\":\"10\",\"product_ordering\":\"ASC\",\"category_column0\":\"5\",\"category_column1\":\"4\",\"category_column2\":\"3\",\"category_column3\":\"2\",\"category_column4\":\"1\",\"category_title_maxlength\":\"25\",\"display_title_sub_category\":\"1\",\"display_slide_category\":\"1\",\"show_category_type\":\"0\",\"sub_category_title_maxlength\":\"25\",\"category_width\":\"200\",\"category_height\":\"100\",\"category_placeholder_path\":\"nophoto.png\",\"product_column0\":\"5\",\"product_column1\":\"4\",\"product_column2\":\"3\",\"product_column3\":\"2\",\"product_column4\":\"1\",\"type_show\":\"slider\",\"rows\":\"2\",\"product_display_title\":\"1\",\"product_title_maxlength\":\"15\",\"product_display_description\":\"0\",\"product_description_maxlength\":\"200\",\"product_display_price\":\"1\",\"display_add_to_cart\":\"1\",\"display_wishlist\":\"1\",\"display_compare\":\"1\",\"display_rating\":\"0\",\"display_sale\":\"1\",\"display_new\":\"1\",\"date_day\":\"227\",\"product_image_num\":\"1\",\"product_image\":\"1\",\"product_get_image_data\":\"1\",\"product_get_image_image\":\"1\",\"product_width\":\"196\",\"product_height\":\"196\",\"product_placeholder_path\":\"nophoto.png\",\"effect\":\"none\",\"product_duration\":\"600\",\"product_delay\":\"300\",\"subcategory_center\":\"0\",\"subcategory_display_navigation\":\"1\",\"subcategory_display_loop\":\"1\",\"subcategory_margin_right\":\"5\",\"subcategory_slideby\":\"1\",\"subcategory_auto_play\":\"0\",\"subcategory_auto_interval_timeout\":\"300\",\"subcategory_auto_hover_pause\":\"1\",\"subcategory_auto_play_speed\":\"300\",\"subcategory_navigation_speed\":\"3000\",\"subcategory_start_position\":\"0\",\"subcategory_mouse_drag\":\"1\",\"subcategory_touch_drag\":\"1\",\"slider_auto_play\":\"0\",\"slider_display_navigation\":\"0\",\"slider_display_loop\":\"1\",\"slider_mouse_drag\":\"1\",\"slider_touch_drag\":\"1\",\"slider_auto_hover_pause\":\"1\",\"slider_auto_interval_timeout\":\"5000\",\"slider_auto_play_speed\":\"2000\",\"pre_text\":\"\",\"post_text\":\"\",\"use_cache\":\"0\",\"cache_time\":\"3600\",\"moduleid\":\"154\"}'),
	(155,'Fashion - Home Layout 2','so_super_category','{\"action\":\"save_edit\",\"name\":\"Fashion - Home Layout 2\",\"module_description\":{\"1\":{\"head_name\":\"Fashion\"},\"2\":{\"head_name\":\"Fashion\"}},\"head_name\":\"Fashion\",\"disp_title_module\":\"0\",\"status\":\"1\",\"advanced_mod_class_suffix\":\"custom_supper\",\"item_link_target\":\"_self\",\"category\":\"25\",\"category_depth\":\"1\",\"field_product_tab\":[\"pd_name\"],\"field_preload\":\"pd_name\",\"limitation\":\"10\",\"product_ordering\":\"DESC\",\"category_column0\":\"4\",\"category_column1\":\"4\",\"category_column2\":\"3\",\"category_column3\":\"2\",\"category_column4\":\"1\",\"category_title_maxlength\":\"25\",\"display_title_sub_category\":\"1\",\"display_slide_category\":\"1\",\"show_category_type\":\"0\",\"sub_category_title_maxlength\":\"25\",\"category_width\":\"200\",\"category_height\":\"100\",\"category_placeholder_path\":\"nophoto.png\",\"product_column0\":\"5\",\"product_column1\":\"4\",\"product_column2\":\"3\",\"product_column3\":\"2\",\"product_column4\":\"1\",\"type_show\":\"slider\",\"rows\":\"2\",\"product_display_title\":\"1\",\"product_title_maxlength\":\"15\",\"product_display_description\":\"0\",\"product_description_maxlength\":\"200\",\"product_display_price\":\"1\",\"display_add_to_cart\":\"1\",\"display_wishlist\":\"1\",\"display_compare\":\"1\",\"display_rating\":\"0\",\"display_sale\":\"1\",\"display_new\":\"1\",\"date_day\":\"7\",\"product_image_num\":\"2\",\"product_image\":\"1\",\"product_get_image_data\":\"1\",\"product_get_image_image\":\"1\",\"product_width\":\"196\",\"product_height\":\"196\",\"product_placeholder_path\":\"nophoto.png\",\"effect\":\"none\",\"product_duration\":\"600\",\"product_delay\":\"300\",\"subcategory_center\":\"0\",\"subcategory_display_navigation\":\"0\",\"subcategory_display_loop\":\"1\",\"subcategory_margin_right\":\"5\",\"subcategory_slideby\":\"1\",\"subcategory_auto_play\":\"0\",\"subcategory_auto_interval_timeout\":\"300\",\"subcategory_auto_hover_pause\":\"1\",\"subcategory_auto_play_speed\":\"300\",\"subcategory_navigation_speed\":\"3000\",\"subcategory_start_position\":\"0\",\"subcategory_mouse_drag\":\"1\",\"subcategory_touch_drag\":\"1\",\"slider_auto_play\":\"0\",\"slider_display_navigation\":\"0\",\"slider_display_loop\":\"1\",\"slider_mouse_drag\":\"1\",\"slider_touch_drag\":\"1\",\"slider_auto_hover_pause\":\"1\",\"slider_auto_interval_timeout\":\"5000\",\"slider_auto_play_speed\":\"2000\",\"pre_text\":\"\",\"post_text\":\"\",\"use_cache\":\"0\",\"cache_time\":\"3600\",\"moduleid\":\"155\"}'),
	(129,'Home 1 - Hot Deals','so_deals','{\"action\":\"save_edit\",\"name\":\"Home 1 - Hot Deals\",\"module_description\":{\"1\":{\"head_name\":\"Hot Deals\"},\"2\":{\"head_name\":\"Hot Deals\"}},\"head_name\":\"Hot Deals\",\"disp_title_module\":\"1\",\"status\":\"1\",\"class_suffix\":\"home1_deals so-deals\",\"item_link_target\":\"_self\",\"include_js\":\"owlCarousel\",\"nb_column0\":\"3\",\"nb_column1\":\"3\",\"nb_column2\":\"2\",\"nb_column3\":\"2\",\"nb_column4\":\"1\",\"nb_row\":\"1\",\"display_feature\":\"0\",\"product_feature\":\"\",\"position_thumbnail\":\"vertical\",\"category\":[\"25\"],\"child_category\":\"1\",\"category_depth\":\"1\",\"product_sort\":\"p.price\",\"product_ordering\":\"ASC\",\"source_limit\":\"6\",\"display_title\":\"1\",\"title_maxlength\":\"60\",\"display_description\":\"0\",\"description_maxlength\":\"150\",\"display_countdown\":\"1\",\"display_price\":\"1\",\"display_addtocart\":\"1\",\"display_wishlist\":\"1\",\"display_compare\":\"1\",\"display_rating\":\"0\",\"display_sale\":\"1\",\"display_new\":\"1\",\"date_day\":\"227\",\"product_image_num\":\"1\",\"product_image\":\"1\",\"product_get_image_data\":\"1\",\"product_get_image_image\":\"1\",\"width\":\"370\",\"height\":\"370\",\"placeholder_path\":\"nophoto.png\",\"margin\":\"30\",\"slideBy\":\"1\",\"autoplay\":\"0\",\"autoplayTimeout\":\"4000\",\"autoplayHoverPause\":\"1\",\"autoplaySpeed\":\"2000\",\"startPosition\":\"0\",\"mouseDrag\":\"1\",\"touchDrag\":\"1\",\"loop\":\"1\",\"button_page\":\"top\",\"dots\":\"1\",\"dotsSpeed\":\"500\",\"navs\":\"0\",\"navSpeed\":\"500\",\"effect\":\"none\",\"duration\":\"2000\",\"delay\":\"1000\",\"store_layout\":\"default3\",\"pre_text\":\"\",\"post_text\":\"\",\"use_cache\":\"0\",\"cache_time\":\"3600\",\"moduleid\":\"129\"}'),
	(119,'Main Menu - Horizontal','so_megamenu','{\"button-save\":\"\",\"moduleid\":\"119\",\"name\":\"Main Menu - Horizontal\",\"suffix_class\":\"megamenu-dev\",\"head_name\":{\"1\":\"\"},\"disp_title_module\":\"0\",\"status\":\"1\",\"use_cache\":\"0\",\"cache_time\":\"3600\",\"orientation\":\"0\",\"show_itemver\":\"5\",\"navigation_text\":{\"1\":\"\"},\"full_width\":\"1\",\"home_item\":\"disabled\",\"home_text\":{\"1\":\"Home\"},\"animation\":\"slide\",\"animation_time\":\"300\",\"layout_id\":100,\"position\":\"menu\",\"sort_order\":0,\"label_item\":\"hot\",\"icon_font\":\"fa fa-camera-retro\",\"class_menu\":\"\",\"search_bar\":0}'),
	(124,'Secondary Menu - Vertical','so_megamenu','{\"button-save\":\"\",\"moduleid\":\"124\",\"name\":\"Secondary Menu - Vertical\",\"suffix_class\":\"\",\"head_name\":{\"1\":\"\"},\"disp_title_module\":\"0\",\"status\":\"1\",\"use_cache\":\"0\",\"cache_time\":\"3600\",\"orientation\":\"1\",\"show_itemver\":\"10\",\"navigation_text\":{\"1\":\"Others\"},\"full_width\":\"1\",\"home_item\":\"disabled\",\"home_text\":{\"1\":\"\"},\"animation\":\"slide\",\"animation_time\":\"300\",\"layout_id\":100,\"position\":\"menu\",\"sort_order\":0,\"label_item\":\"hot\",\"icon_font\":\"fa fa-camera-retro\",\"class_menu\":\"\",\"search_bar\":0}'),
	(94,'Search Pro','so_searchpro','{\"name\":\"Search Pro\",\"action\":\"\",\"module_description\":{\"1\":{\"head_name\":\"Search Pro\",\"str_keyword\":\"Keywords\"}},\"head_name\":\"Search Pro\",\"disp_title_module\":\"0\",\"type_layout\":\"0\",\"class\":\"so-search\",\"width\":\"60\",\"height\":\"60\",\"limit\":\"5\",\"character\":\"3\",\"showcategory\":\"0\",\"showimage\":\"1\",\"showprice\":\"1\",\"status\":\"1\",\"show_keyword\":\"1\",\"str_keyword\":\"Keywords\",\"limit_keyword\":\"5\",\"use_cache\":\"0\",\"cache_time\":\"3600\",\"header_display1\":\"1\",\"header_display2\":\"1\",\"header_display3\":\"1\",\"moduleid\":\"94\"}'),
	(181,'Home 1 - Newsletter','so_newletter_custom_popup','{\"action\":\"save_edit\",\"name\":\"Home 1 - Newsletter\",\"module_description\":{\"1\":{\"head_name\":\"Newsletter\"}},\"head_name\":\"Newsletter\",\"disp_title_module\":\"0\",\"status\":\"1\",\"class_suffix\":\"news-letter\",\"expired\":\"1\",\"layout\":\"layout_default\",\"width\":\"100%\",\"image_bg_display\":\"0\",\"image\":\"\",\"color_bg\":\"fff\",\"title_display\":\"1\",\"description_content\":{\"1\":{\"title\":\"&lt;i class=&quot;fa fa-paper-plane-o&quot; aria-hidden=&quot;true&quot;&gt;&lt;\\/i&gt; \\t\\t\\t&lt;strong&gt;Sign up to Newsletter&lt;\\/strong&gt;\",\"newsletter_promo\":\"AND RECEIVE $29 COUPON FOR FIRST SHOPPING\"}},\"email_template_subject\":\"Thank your For Subscribing!\",\"content_email\":\"&lt;p&gt;&lt;br&gt;&lt;\\/p&gt;\",\"pre_text\":\"\",\"post_text\":\"\",\"use_cache\":\"0\",\"cache_time\":\"3600\",\"footer_display1\":\"1\",\"footer_display2\":\"1\",\"footer_display3\":\"1\",\"moduleid\":\"181\"}'),
	(340,'Home 1 - Page Builder InYb7','so_page_builder','{\"page_builder\":\"[{\\\"text_class_id\\\":\\\"row_a90w\\\",\\\"text_class\\\":\\\"row-style\\\",\\\"text_color\\\":\\\"#000000\\\",\\\"link_color\\\":\\\"#000000\\\",\\\"link_hover_color\\\":\\\"#000000\\\",\\\"heading_color\\\":\\\"#000000\\\",\\\"background_type\\\":0,\\\"bg_color\\\":\\\"#FFFFFF\\\",\\\"bg_opacity\\\":\\\"100%\\\",\\\"bg_image\\\":\\\"\\\",\\\"bg_repeat\\\":\\\"no-repeat\\\",\\\"bg_position\\\":\\\"center center\\\",\\\"bg_attachment\\\":\\\"fixed\\\",\\\"bg_scale\\\":\\\"cover\\\",\\\"video_type\\\":0,\\\"link_video\\\":\\\"YE7VzlLtp-4\\\",\\\"margin\\\":\\\"\\\",\\\"padding\\\":\\\"\\\",\\\"row_container_fluid\\\":0,\\\"row_section\\\":0,\\\"row_section_class\\\":\\\"section-style\\\",\\\"row_section_id\\\":\\\"\\\",\\\"section_background_type\\\":0,\\\"section_bg_color\\\":\\\"#FFFFFF\\\",\\\"section_bg_opacity\\\":\\\"100%\\\",\\\"section_bg_image\\\":\\\"\\\",\\\"section_bg_repeat\\\":\\\"no-repeat\\\",\\\"section_bg_position\\\":\\\"center center\\\",\\\"section_bg_attachment\\\":\\\"fixed\\\",\\\"section_bg_scale\\\":\\\"cover\\\",\\\"section_video_type\\\":0,\\\"section_link_video\\\":\\\"YE7VzlLtp-4\\\",\\\"cols\\\":[{\\\"text_class_id\\\":\\\"col_anla\\\",\\\"text_class\\\":\\\"slider-right\\\",\\\"text_color\\\":\\\"#000000\\\",\\\"link_color\\\":\\\"#000000\\\",\\\"link_hover_color\\\":\\\"#000000\\\",\\\"heading_color\\\":\\\"#000000\\\",\\\"background_type\\\":\\\"0\\\",\\\"bg_color\\\":\\\"#FFFFFF\\\",\\\"bg_opacity\\\":\\\"100%\\\",\\\"bg_image\\\":\\\"\\\",\\\"bg_repeat\\\":\\\"no-repeat\\\",\\\"bg_position\\\":\\\"center center\\\",\\\"bg_attachment\\\":\\\"fixed\\\",\\\"bg_scale\\\":\\\"cover\\\",\\\"col_video_type\\\":\\\"0\\\",\\\"col_link_video\\\":\\\"YE7VzlLtp-4\\\",\\\"padding\\\":\\\"\\\",\\\"margin\\\":\\\"10px\\\",\\\"lg_col\\\":12,\\\"md_col\\\":\\\"9\\\",\\\"sm_col\\\":\\\"12\\\",\\\"xs_col\\\":\\\"12\\\",\\\"widgets\\\":[],\\\"rows\\\":[{\\\"text_class_id\\\":\\\"row_ci4f\\\",\\\"text_class\\\":\\\"\\\",\\\"text_color\\\":\\\"#000000\\\",\\\"link_color\\\":\\\"#000000\\\",\\\"link_hover_color\\\":\\\"#000000\\\",\\\"heading_color\\\":\\\"#000000\\\",\\\"background_type\\\":\\\"0\\\",\\\"bg_color\\\":\\\"#FFFFFF\\\",\\\"bg_opacity\\\":\\\"100%\\\",\\\"bg_image\\\":\\\"\\\",\\\"bg_repeat\\\":\\\"no-repeat\\\",\\\"bg_position\\\":\\\"center center\\\",\\\"bg_attachment\\\":\\\"fixed\\\",\\\"bg_scale\\\":\\\"cover\\\",\\\"video_type\\\":\\\"0\\\",\\\"link_video\\\":\\\"YE7VzlLtp-4\\\",\\\"margin\\\":\\\"\\\",\\\"padding\\\":\\\"\\\",\\\"row_container_fluid\\\":\\\"0\\\",\\\"row_section\\\":\\\"0\\\",\\\"row_section_class\\\":\\\"section-style\\\",\\\"row_section_id\\\":\\\"\\\",\\\"section_background_type\\\":\\\"0\\\",\\\"section_bg_color\\\":\\\"#FFFFFF\\\",\\\"section_bg_opacity\\\":\\\"100%\\\",\\\"section_bg_image\\\":\\\"\\\",\\\"section_bg_repeat\\\":\\\"no-repeat\\\",\\\"section_bg_position\\\":\\\"center center\\\",\\\"section_bg_attachment\\\":\\\"fixed\\\",\\\"section_bg_scale\\\":\\\"cover\\\",\\\"section_video_type\\\":\\\"0\\\",\\\"section_link_video\\\":\\\"YE7VzlLtp-4\\\",\\\"cols\\\":[{\\\"text_class_id\\\":\\\"col_dg1b\\\",\\\"text_class\\\":\\\"block block_1\\\",\\\"text_color\\\":\\\"#000000\\\",\\\"link_color\\\":\\\"#000000\\\",\\\"link_hover_color\\\":\\\"#000000\\\",\\\"heading_color\\\":\\\"#000000\\\",\\\"background_type\\\":\\\"0\\\",\\\"bg_color\\\":\\\"#FFFFFF\\\",\\\"bg_opacity\\\":\\\"100%\\\",\\\"bg_image\\\":\\\"\\\",\\\"bg_repeat\\\":\\\"no-repeat\\\",\\\"bg_position\\\":\\\"center center\\\",\\\"bg_attachment\\\":\\\"fixed\\\",\\\"bg_scale\\\":\\\"cover\\\",\\\"col_video_type\\\":\\\"0\\\",\\\"col_link_video\\\":\\\"YE7VzlLtp-4\\\",\\\"padding\\\":\\\"\\\",\\\"margin\\\":\\\"\\\",\\\"lg_col\\\":\\\"12\\\",\\\"md_col\\\":\\\"12\\\",\\\"sm_col\\\":\\\"12\\\",\\\"xs_col\\\":\\\"12\\\",\\\"widgets\\\":[{\\\"name\\\":\\\"Home Page - Slideshow\\\",\\\"module\\\":\\\"so_home_slider.194\\\",\\\"type\\\":\\\"module\\\"}],\\\"rows\\\":[]},{\\\"text_class_id\\\":\\\"col_hmsd\\\",\\\"text_class\\\":\\\"block block_2\\\",\\\"text_color\\\":\\\"#000000\\\",\\\"link_color\\\":\\\"#000000\\\",\\\"link_hover_color\\\":\\\"#000000\\\",\\\"heading_color\\\":\\\"#000000\\\",\\\"background_type\\\":\\\"0\\\",\\\"bg_color\\\":\\\"#FFFFFF\\\",\\\"bg_opacity\\\":\\\"100%\\\",\\\"bg_image\\\":\\\"\\\",\\\"bg_repeat\\\":\\\"no-repeat\\\",\\\"bg_position\\\":\\\"center center\\\",\\\"bg_attachment\\\":\\\"fixed\\\",\\\"bg_scale\\\":\\\"cover\\\",\\\"col_video_type\\\":\\\"0\\\",\\\"col_link_video\\\":\\\"YE7VzlLtp-4\\\",\\\"padding\\\":\\\"\\\",\\\"margin\\\":\\\"\\\",\\\"lg_col\\\":\\\"12\\\",\\\"md_col\\\":\\\"12\\\",\\\"sm_col\\\":\\\"12\\\",\\\"xs_col\\\":\\\"12\\\",\\\"widgets\\\":[{\\\"name\\\":\\\"Html\\\",\\\"module\\\":\\\"html_gn4q\\\",\\\"type\\\":\\\"shortcode\\\",\\\"shortcode\\\":\\\"html\\\",\\\"content\\\":\\\"{\\\\\\\"cparent\\\\\\\":[{\\\\\\\"name_shortcode_1\\\\\\\":\\\\\\\"Home1_Banner_1\\\\\\\",\\\\\\\"name_shortcode_2\\\\\\\":\\\\\\\"Home1_Banner_1\\\\\\\",\\\\\\\"name_shortcode_status\\\\\\\":\\\\\\\"no\\\\\\\",\\\\\\\"content_1\\\\\\\":\\\\\\\"<div class=\\\\\\\\\\\\\\\"home1-banner-1 clearfix\\\\\\\\\\\\\\\">\\\\\\\\n\\\\\\\\t<div class=\\\\\\\\\\\\\\\"item-1 col-lg-6 col-md-6 col-sm-6 banners\\\\\\\\\\\\\\\">\\\\\\\\n\\\\\\\\t\\\\\\\\t<div>\\\\\\\\n\\\\\\\\t\\\\\\\\t\\\\\\\\t<a title=\\\\\\\\\\\\\\\"Static Image\\\\\\\\\\\\\\\" href=\\\\\\\\\\\\\\\"#\\\\\\\\\\\\\\\"><img src=\\\\\\\\\\\\\\\"image\\/catalog\\/demo\\/banners\\/home1\\/bn-1.jpg\\\\\\\\\\\\\\\" alt=\\\\\\\\\\\\\\\"Static Image\\\\\\\\\\\\\\\"><\\/a>\\\\\\\\n\\\\\\\\t\\\\\\\\t<\\/div>\\\\\\\\n\\\\\\\\t<\\/div>\\\\\\\\n\\\\\\\\t<div class=\\\\\\\\\\\\\\\"item-2 col-lg-6 col-md-6 col-sm-6 banners\\\\\\\\\\\\\\\">\\\\\\\\n\\\\\\\\t\\\\\\\\t<div>\\\\\\\\n\\\\\\\\t\\\\\\\\t\\\\\\\\t<a title=\\\\\\\\\\\\\\\"Static Image\\\\\\\\\\\\\\\" href=\\\\\\\\\\\\\\\"#\\\\\\\\\\\\\\\"><img src=\\\\\\\\\\\\\\\"image\\/catalog\\/demo\\/banners\\/home1\\/bn-2.jpg\\\\\\\\\\\\\\\" alt=\\\\\\\\\\\\\\\"Static Image\\\\\\\\\\\\\\\"><\\/a>\\\\\\\\n\\\\\\\\t\\\\\\\\t<\\/div>\\\\\\\\n\\\\\\\\t<\\/div>\\\\\\\\n<\\/div>\\\\\\\",\\\\\\\"content_2\\\\\\\":\\\\\\\"<div class=\\\\\\\\\\\\\\\"home1-banner-1 clearfix\\\\\\\\\\\\\\\">\\\\\\\\n\\\\\\\\t<div class=\\\\\\\\\\\\\\\"item-1 col-lg-6 col-md-6 col-sm-6 banners\\\\\\\\\\\\\\\">\\\\\\\\n\\\\\\\\t\\\\\\\\t<div>\\\\\\\\n\\\\\\\\t\\\\\\\\t\\\\\\\\t<a title=\\\\\\\\\\\\\\\"Static Image\\\\\\\\\\\\\\\" href=\\\\\\\\\\\\\\\"#\\\\\\\\\\\\\\\"><img src=\\\\\\\\\\\\\\\"image\\/catalog\\/demo\\/banners\\/home1\\/bn-1.jpg\\\\\\\\\\\\\\\" alt=\\\\\\\\\\\\\\\"Static Image\\\\\\\\\\\\\\\"><\\/a>\\\\\\\\n\\\\\\\\t\\\\\\\\t<\\/div>\\\\\\\\n\\\\\\\\t<\\/div>\\\\\\\\n\\\\\\\\t<div class=\\\\\\\\\\\\\\\"item-2 col-lg-6 col-md-6 col-sm-6 banners\\\\\\\\\\\\\\\">\\\\\\\\n\\\\\\\\t\\\\\\\\t<div>\\\\\\\\n\\\\\\\\t\\\\\\\\t\\\\\\\\t<a title=\\\\\\\\\\\\\\\"Static Image\\\\\\\\\\\\\\\" href=\\\\\\\\\\\\\\\"#\\\\\\\\\\\\\\\"><img src=\\\\\\\\\\\\\\\"image\\/catalog\\/demo\\/banners\\/home1\\/bn-2.jpg\\\\\\\\\\\\\\\" alt=\\\\\\\\\\\\\\\"Static Image\\\\\\\\\\\\\\\"><\\/a>\\\\\\\\n\\\\\\\\t\\\\\\\\t<\\/div>\\\\\\\\n\\\\\\\\t<\\/div>\\\\\\\\n<\\/div>\\\\\\\",\\\\\\\"yt_class\\\\\\\":\\\\\\\"\\\\\\\",\\\\\\\"css_internal\\\\\\\":\\\\\\\"\\\\\\\"}],\\\\\\\"cchild\\\\\\\":{}}\\\"}],\\\"rows\\\":[]}]}]}]},{\\\"text_class_id\\\":\\\"row_mri4\\\",\\\"text_class\\\":\\\"page-content row-style\\\",\\\"text_color\\\":\\\"#000000\\\",\\\"link_color\\\":\\\"#000000\\\",\\\"link_hover_color\\\":\\\"#000000\\\",\\\"heading_color\\\":\\\"#000000\\\",\\\"background_type\\\":\\\"0\\\",\\\"bg_color\\\":\\\"#FFFFFF\\\",\\\"bg_opacity\\\":\\\"100%\\\",\\\"bg_image\\\":\\\"\\\",\\\"bg_repeat\\\":\\\"no-repeat\\\",\\\"bg_position\\\":\\\"center center\\\",\\\"bg_attachment\\\":\\\"fixed\\\",\\\"bg_scale\\\":\\\"cover\\\",\\\"video_type\\\":\\\"0\\\",\\\"link_video\\\":\\\"YE7VzlLtp-4\\\",\\\"margin\\\":\\\"\\\",\\\"padding\\\":\\\"\\\",\\\"row_container_fluid\\\":\\\"0\\\",\\\"row_section\\\":\\\"0\\\",\\\"row_section_class\\\":\\\"section-style\\\",\\\"row_section_id\\\":\\\"\\\",\\\"section_background_type\\\":\\\"0\\\",\\\"section_bg_color\\\":\\\"#FFFFFF\\\",\\\"section_bg_opacity\\\":\\\"100%\\\",\\\"section_bg_image\\\":\\\"\\\",\\\"section_bg_repeat\\\":\\\"no-repeat\\\",\\\"section_bg_position\\\":\\\"center center\\\",\\\"section_bg_attachment\\\":\\\"fixed\\\",\\\"section_bg_scale\\\":\\\"cover\\\",\\\"section_video_type\\\":\\\"0\\\",\\\"section_link_video\\\":\\\"YE7VzlLtp-4\\\",\\\"cols\\\":[{\\\"text_class_id\\\":\\\"col_gsvy\\\",\\\"text_class\\\":\\\"block block_3 title_neo1\\\",\\\"text_color\\\":\\\"#000000\\\",\\\"link_color\\\":\\\"#000000\\\",\\\"link_hover_color\\\":\\\"#000000\\\",\\\"heading_color\\\":\\\"#000000\\\",\\\"background_type\\\":\\\"0\\\",\\\"bg_color\\\":\\\"#FFFFFF\\\",\\\"bg_opacity\\\":\\\"100%\\\",\\\"bg_image\\\":\\\"\\\",\\\"bg_repeat\\\":\\\"no-repeat\\\",\\\"bg_position\\\":\\\"center center\\\",\\\"bg_attachment\\\":\\\"fixed\\\",\\\"bg_scale\\\":\\\"cover\\\",\\\"col_video_type\\\":\\\"0\\\",\\\"col_link_video\\\":\\\"YE7VzlLtp-4\\\",\\\"padding\\\":\\\"\\\",\\\"margin\\\":\\\"\\\",\\\"lg_col\\\":\\\"12\\\",\\\"md_col\\\":\\\"12\\\",\\\"sm_col\\\":\\\"12\\\",\\\"xs_col\\\":\\\"12\\\",\\\"widgets\\\":[{\\\"name\\\":\\\"Home 1 - Hot Deals\\\",\\\"module\\\":\\\"so_deals.129\\\",\\\"type\\\":\\\"module\\\"}],\\\"rows\\\":[]},{\\\"text_class_id\\\":\\\"col_9xxo\\\",\\\"text_class\\\":\\\"block block_4\\\",\\\"text_color\\\":\\\"#000000\\\",\\\"link_color\\\":\\\"#000000\\\",\\\"link_hover_color\\\":\\\"#000000\\\",\\\"heading_color\\\":\\\"#000000\\\",\\\"background_type\\\":\\\"0\\\",\\\"bg_color\\\":\\\"#FFFFFF\\\",\\\"bg_opacity\\\":\\\"100%\\\",\\\"bg_image\\\":\\\"\\\",\\\"bg_repeat\\\":\\\"no-repeat\\\",\\\"bg_position\\\":\\\"center center\\\",\\\"bg_attachment\\\":\\\"fixed\\\",\\\"bg_scale\\\":\\\"cover\\\",\\\"col_video_type\\\":\\\"0\\\",\\\"col_link_video\\\":\\\"YE7VzlLtp-4\\\",\\\"padding\\\":\\\"\\\",\\\"margin\\\":\\\"\\\",\\\"lg_col\\\":\\\"12\\\",\\\"md_col\\\":\\\"12\\\",\\\"sm_col\\\":\\\"12\\\",\\\"xs_col\\\":\\\"12\\\",\\\"widgets\\\":[{\\\"name\\\":\\\"Html\\\",\\\"module\\\":\\\"html_807x\\\",\\\"type\\\":\\\"shortcode\\\",\\\"shortcode\\\":\\\"html\\\",\\\"content\\\":\\\"{\\\\\\\"cparent\\\\\\\":[{\\\\\\\"name_shortcode_1\\\\\\\":\\\\\\\"Home1_Banner_2\\\\\\\",\\\\\\\"name_shortcode_2\\\\\\\":\\\\\\\"Home1_Banner_2\\\\\\\",\\\\\\\"name_shortcode_status\\\\\\\":\\\\\\\"no\\\\\\\",\\\\\\\"content_1\\\\\\\":\\\\\\\"<div class=\\\\\\\\\\\\\\\"home1-banner-2 clearfix\\\\\\\\\\\\\\\">\\\\\\\\n\\\\\\\\t<div class=\\\\\\\\\\\\\\\"item-1 col-lg-6 col-md-6 col-sm-6 banners\\\\\\\\\\\\\\\">\\\\\\\\n\\\\\\\\t\\\\\\\\t<div>\\\\\\\\n\\\\\\\\t\\\\\\\\t\\\\\\\\t<a title=\\\\\\\\\\\\\\\"Static Image\\\\\\\\\\\\\\\" href=\\\\\\\\\\\\\\\"#\\\\\\\\\\\\\\\"><img src=\\\\\\\\\\\\\\\"image\\/catalog\\/demo\\/banners\\/home1\\/bn-3.jpg\\\\\\\\\\\\\\\" alt=\\\\\\\\\\\\\\\"Static Image\\\\\\\\\\\\\\\"><\\/a>\\\\\\\\n\\\\\\\\t\\\\\\\\t<\\/div>\\\\\\\\n\\\\\\\\t<\\/div>\\\\\\\\n\\\\\\\\t<div class=\\\\\\\\\\\\\\\"item-2 col-lg-6 col-md-6 col-sm-6 banners\\\\\\\\\\\\\\\">\\\\\\\\n\\\\\\\\t\\\\\\\\t<div>\\\\\\\\n\\\\\\\\t\\\\\\\\t\\\\\\\\t<a title=\\\\\\\\\\\\\\\"Static Image\\\\\\\\\\\\\\\" href=\\\\\\\\\\\\\\\"#\\\\\\\\\\\\\\\"><img src=\\\\\\\\\\\\\\\"image\\/catalog\\/demo\\/banners\\/home1\\/bn-4.jpg\\\\\\\\\\\\\\\" alt=\\\\\\\\\\\\\\\"Static Image\\\\\\\\\\\\\\\"><\\/a>\\\\\\\\n\\\\\\\\t\\\\\\\\t<\\/div>\\\\\\\\n\\\\\\\\t<\\/div>\\\\\\\\n<\\/div>\\\\\\\",\\\\\\\"content_2\\\\\\\":\\\\\\\"<div class=\\\\\\\\\\\\\\\"home1-banner-2 clearfix\\\\\\\\\\\\\\\">\\\\\\\\n\\\\\\\\t<div class=\\\\\\\\\\\\\\\"item-1 col-lg-6 col-md-6 col-sm-6 banners\\\\\\\\\\\\\\\">\\\\\\\\n\\\\\\\\t\\\\\\\\t<div>\\\\\\\\n\\\\\\\\t\\\\\\\\t\\\\\\\\t<a title=\\\\\\\\\\\\\\\"Static Image\\\\\\\\\\\\\\\" href=\\\\\\\\\\\\\\\"#\\\\\\\\\\\\\\\"><img src=\\\\\\\\\\\\\\\"image\\/catalog\\/demo\\/banners\\/home1\\/bn-3.jpg\\\\\\\\\\\\\\\" alt=\\\\\\\\\\\\\\\"Static Image\\\\\\\\\\\\\\\"><\\/a>\\\\\\\\n\\\\\\\\t\\\\\\\\t<\\/div>\\\\\\\\n\\\\\\\\t<\\/div>\\\\\\\\n\\\\\\\\t<div class=\\\\\\\\\\\\\\\"item-2 col-lg-6 col-md-6 col-sm-6 banners\\\\\\\\\\\\\\\">\\\\\\\\n\\\\\\\\t\\\\\\\\t<div>\\\\\\\\n\\\\\\\\t\\\\\\\\t\\\\\\\\t<a title=\\\\\\\\\\\\\\\"Static Image\\\\\\\\\\\\\\\" href=\\\\\\\\\\\\\\\"#\\\\\\\\\\\\\\\"><img src=\\\\\\\\\\\\\\\"image\\/catalog\\/demo\\/banners\\/home1\\/bn-4.jpg\\\\\\\\\\\\\\\" alt=\\\\\\\\\\\\\\\"Static Image\\\\\\\\\\\\\\\"><\\/a>\\\\\\\\n\\\\\\\\t\\\\\\\\t<\\/div>\\\\\\\\n\\\\\\\\t<\\/div>\\\\\\\\n<\\/div>\\\\\\\",\\\\\\\"yt_class\\\\\\\":\\\\\\\"\\\\\\\",\\\\\\\"css_internal\\\\\\\":\\\\\\\"\\\\\\\"}],\\\\\\\"cchild\\\\\\\":{}}\\\"}],\\\"rows\\\":[]},{\\\"text_class_id\\\":\\\"col_bsf3\\\",\\\"text_class\\\":\\\"block block_5 title_neo2\\\",\\\"text_color\\\":\\\"#000000\\\",\\\"link_color\\\":\\\"#000000\\\",\\\"link_hover_color\\\":\\\"#000000\\\",\\\"heading_color\\\":\\\"#000000\\\",\\\"background_type\\\":\\\"0\\\",\\\"bg_color\\\":\\\"#FFFFFF\\\",\\\"bg_opacity\\\":\\\"100%\\\",\\\"bg_image\\\":\\\"\\\",\\\"bg_repeat\\\":\\\"no-repeat\\\",\\\"bg_position\\\":\\\"center center\\\",\\\"bg_attachment\\\":\\\"fixed\\\",\\\"bg_scale\\\":\\\"cover\\\",\\\"col_video_type\\\":\\\"0\\\",\\\"col_link_video\\\":\\\"YE7VzlLtp-4\\\",\\\"padding\\\":\\\"\\\",\\\"margin\\\":\\\"\\\",\\\"lg_col\\\":\\\"12\\\",\\\"md_col\\\":\\\"12\\\",\\\"sm_col\\\":\\\"12\\\",\\\"xs_col\\\":\\\"12\\\",\\\"widgets\\\":[{\\\"name\\\":\\\"Home 1 - Spa & Massage\\\",\\\"module\\\":\\\"so_listing_tabs.222\\\",\\\"type\\\":\\\"module\\\"}],\\\"rows\\\":[]},{\\\"text_class_id\\\":\\\"col_nvxr\\\",\\\"text_class\\\":\\\"block block_6 title_neo3\\\",\\\"text_color\\\":\\\"#000000\\\",\\\"link_color\\\":\\\"#000000\\\",\\\"link_hover_color\\\":\\\"#000000\\\",\\\"heading_color\\\":\\\"#000000\\\",\\\"background_type\\\":\\\"0\\\",\\\"bg_color\\\":\\\"#FFFFFF\\\",\\\"bg_opacity\\\":\\\"100%\\\",\\\"bg_image\\\":\\\"\\\",\\\"bg_repeat\\\":\\\"no-repeat\\\",\\\"bg_position\\\":\\\"center center\\\",\\\"bg_attachment\\\":\\\"fixed\\\",\\\"bg_scale\\\":\\\"cover\\\",\\\"col_video_type\\\":\\\"0\\\",\\\"col_link_video\\\":\\\"YE7VzlLtp-4\\\",\\\"padding\\\":\\\"\\\",\\\"margin\\\":\\\"\\\",\\\"lg_col\\\":\\\"12\\\",\\\"md_col\\\":\\\"12\\\",\\\"sm_col\\\":\\\"12\\\",\\\"xs_col\\\":\\\"12\\\",\\\"widgets\\\":[{\\\"name\\\":\\\"Home 1 - Fashion & Accessories\\\",\\\"module\\\":\\\"so_listing_tabs.297\\\",\\\"type\\\":\\\"module\\\"}],\\\"rows\\\":[]},{\\\"text_class_id\\\":\\\"col_mfpr\\\",\\\"text_class\\\":\\\"block block_7 title_neo4\\\",\\\"text_color\\\":\\\"#000000\\\",\\\"link_color\\\":\\\"#000000\\\",\\\"link_hover_color\\\":\\\"#000000\\\",\\\"heading_color\\\":\\\"#000000\\\",\\\"background_type\\\":\\\"0\\\",\\\"bg_color\\\":\\\"#FFFFFF\\\",\\\"bg_opacity\\\":\\\"100%\\\",\\\"bg_image\\\":\\\"\\\",\\\"bg_repeat\\\":\\\"no-repeat\\\",\\\"bg_position\\\":\\\"center center\\\",\\\"bg_attachment\\\":\\\"fixed\\\",\\\"bg_scale\\\":\\\"cover\\\",\\\"col_video_type\\\":\\\"0\\\",\\\"col_link_video\\\":\\\"YE7VzlLtp-4\\\",\\\"padding\\\":\\\"\\\",\\\"margin\\\":\\\"\\\",\\\"lg_col\\\":\\\"12\\\",\\\"md_col\\\":\\\"12\\\",\\\"sm_col\\\":\\\"12\\\",\\\"xs_col\\\":\\\"12\\\",\\\"widgets\\\":[{\\\"name\\\":\\\"Home 1 - Travel & Vacation\\\",\\\"module\\\":\\\"so_listing_tabs.298\\\",\\\"type\\\":\\\"module\\\"}],\\\"rows\\\":[]},{\\\"text_class_id\\\":\\\"col_iunl\\\",\\\"text_class\\\":\\\"block block_8 title_neo5\\\",\\\"text_color\\\":\\\"#000000\\\",\\\"link_color\\\":\\\"#000000\\\",\\\"link_hover_color\\\":\\\"#000000\\\",\\\"heading_color\\\":\\\"#000000\\\",\\\"background_type\\\":\\\"0\\\",\\\"bg_color\\\":\\\"#FFFFFF\\\",\\\"bg_opacity\\\":\\\"100%\\\",\\\"bg_image\\\":\\\"\\\",\\\"bg_repeat\\\":\\\"no-repeat\\\",\\\"bg_position\\\":\\\"center center\\\",\\\"bg_attachment\\\":\\\"fixed\\\",\\\"bg_scale\\\":\\\"cover\\\",\\\"col_video_type\\\":\\\"0\\\",\\\"col_link_video\\\":\\\"YE7VzlLtp-4\\\",\\\"padding\\\":\\\"\\\",\\\"margin\\\":\\\"\\\",\\\"lg_col\\\":\\\"12\\\",\\\"md_col\\\":\\\"12\\\",\\\"sm_col\\\":\\\"12\\\",\\\"xs_col\\\":\\\"12\\\",\\\"widgets\\\":[{\\\"name\\\":\\\"Home1 - Digital & Electronics\\\",\\\"module\\\":\\\"so_listing_tabs.299\\\",\\\"type\\\":\\\"module\\\"}],\\\"rows\\\":[]},{\\\"text_class_id\\\":\\\"col_siw1\\\",\\\"text_class\\\":\\\"block block_9\\\",\\\"text_color\\\":\\\"#000000\\\",\\\"link_color\\\":\\\"#000000\\\",\\\"link_hover_color\\\":\\\"#000000\\\",\\\"heading_color\\\":\\\"#000000\\\",\\\"background_type\\\":\\\"0\\\",\\\"bg_color\\\":\\\"#FFFFFF\\\",\\\"bg_opacity\\\":\\\"100%\\\",\\\"bg_image\\\":\\\"\\\",\\\"bg_repeat\\\":\\\"no-repeat\\\",\\\"bg_position\\\":\\\"center center\\\",\\\"bg_attachment\\\":\\\"fixed\\\",\\\"bg_scale\\\":\\\"cover\\\",\\\"col_video_type\\\":\\\"0\\\",\\\"col_link_video\\\":\\\"YE7VzlLtp-4\\\",\\\"padding\\\":\\\"\\\",\\\"margin\\\":\\\"\\\",\\\"lg_col\\\":\\\"4\\\",\\\"md_col\\\":\\\"4\\\",\\\"sm_col\\\":\\\"12\\\",\\\"xs_col\\\":\\\"12\\\",\\\"widgets\\\":[{\\\"name\\\":\\\"Home1 - Sport & Entertaiment\\\",\\\"module\\\":\\\"so_extra_slider.300\\\",\\\"type\\\":\\\"module\\\"}],\\\"rows\\\":[]},{\\\"text_class_id\\\":\\\"col_fm89\\\",\\\"text_class\\\":\\\"block block_9\\\",\\\"text_color\\\":\\\"#000000\\\",\\\"link_color\\\":\\\"#000000\\\",\\\"link_hover_color\\\":\\\"#000000\\\",\\\"heading_color\\\":\\\"#000000\\\",\\\"background_type\\\":\\\"0\\\",\\\"bg_color\\\":\\\"#FFFFFF\\\",\\\"bg_opacity\\\":\\\"100%\\\",\\\"bg_image\\\":\\\"\\\",\\\"bg_repeat\\\":\\\"no-repeat\\\",\\\"bg_position\\\":\\\"center center\\\",\\\"bg_attachment\\\":\\\"fixed\\\",\\\"bg_scale\\\":\\\"cover\\\",\\\"col_video_type\\\":\\\"0\\\",\\\"col_link_video\\\":\\\"YE7VzlLtp-4\\\",\\\"padding\\\":\\\"\\\",\\\"margin\\\":\\\"\\\",\\\"lg_col\\\":\\\"4\\\",\\\"md_col\\\":\\\"4\\\",\\\"sm_col\\\":\\\"12\\\",\\\"xs_col\\\":\\\"12\\\",\\\"widgets\\\":[{\\\"name\\\":\\\"Home 1 - Food & Restaurant\\\",\\\"module\\\":\\\"so_extra_slider.301\\\",\\\"type\\\":\\\"module\\\"}],\\\"rows\\\":[]},{\\\"text_class_id\\\":\\\"col_16k5\\\",\\\"text_class\\\":\\\"block block_9\\\",\\\"text_color\\\":\\\"#000000\\\",\\\"link_color\\\":\\\"#000000\\\",\\\"link_hover_color\\\":\\\"#000000\\\",\\\"heading_color\\\":\\\"#000000\\\",\\\"background_type\\\":\\\"0\\\",\\\"bg_color\\\":\\\"#FFFFFF\\\",\\\"bg_opacity\\\":\\\"100%\\\",\\\"bg_image\\\":\\\"\\\",\\\"bg_repeat\\\":\\\"no-repeat\\\",\\\"bg_position\\\":\\\"center center\\\",\\\"bg_attachment\\\":\\\"fixed\\\",\\\"bg_scale\\\":\\\"cover\\\",\\\"col_video_type\\\":\\\"0\\\",\\\"col_link_video\\\":\\\"YE7VzlLtp-4\\\",\\\"padding\\\":\\\"\\\",\\\"margin\\\":\\\"\\\",\\\"lg_col\\\":\\\"4\\\",\\\"md_col\\\":\\\"4\\\",\\\"sm_col\\\":\\\"12\\\",\\\"xs_col\\\":\\\"12\\\",\\\"widgets\\\":[{\\\"name\\\":\\\"Home 1 - Book Stationery\\\",\\\"module\\\":\\\"so_extra_slider.302\\\",\\\"type\\\":\\\"module\\\"}],\\\"rows\\\":[]},{\\\"text_class_id\\\":\\\"col_doyh\\\",\\\"text_class\\\":\\\"block block_10\\\",\\\"text_color\\\":\\\"#000000\\\",\\\"link_color\\\":\\\"#000000\\\",\\\"link_hover_color\\\":\\\"#000000\\\",\\\"heading_color\\\":\\\"#000000\\\",\\\"background_type\\\":\\\"0\\\",\\\"bg_color\\\":\\\"#FFFFFF\\\",\\\"bg_opacity\\\":\\\"100%\\\",\\\"bg_image\\\":\\\"\\\",\\\"bg_repeat\\\":\\\"no-repeat\\\",\\\"bg_position\\\":\\\"center center\\\",\\\"bg_attachment\\\":\\\"fixed\\\",\\\"bg_scale\\\":\\\"cover\\\",\\\"col_video_type\\\":\\\"0\\\",\\\"col_link_video\\\":\\\"YE7VzlLtp-4\\\",\\\"padding\\\":\\\"\\\",\\\"margin\\\":\\\"\\\",\\\"lg_col\\\":\\\"12\\\",\\\"md_col\\\":\\\"12\\\",\\\"sm_col\\\":\\\"12\\\",\\\"xs_col\\\":\\\"12\\\",\\\"widgets\\\":[{\\\"name\\\":\\\"Html\\\",\\\"module\\\":\\\"html_alul\\\",\\\"type\\\":\\\"shortcode\\\",\\\"shortcode\\\":\\\"html\\\",\\\"content\\\":\\\"{\\\\\\\"cparent\\\\\\\":[{\\\\\\\"name_shortcode_1\\\\\\\":\\\\\\\"Home1_Sevices\\\\\\\",\\\\\\\"name_shortcode_2\\\\\\\":\\\\\\\"Home1_Sevices\\\\\\\",\\\\\\\"name_shortcode_status\\\\\\\":\\\\\\\"no\\\\\\\",\\\\\\\"content_1\\\\\\\":\\\\\\\"<div class=\\\\\\\\\\\\\\\"clearfix home1-sevices\\\\\\\\\\\\\\\">\\\\\\\\n\\\\\\\\t<ul><li class=\\\\\\\\\\\\\\\"item free col-md-3\\\\\\\\\\\\\\\">\\\\\\\\n\\\\\\\\t\\\\\\\\t\\\\\\\\t<div class=\\\\\\\\\\\\\\\"icon\\\\\\\\\\\\\\\">\\\\\\\\n\\\\\\\\t\\\\\\\\t\\\\\\\\t\\\\\\\\t\\\\\\\\n\\\\\\\\t\\\\\\\\t\\\\\\\\t<\\/div>\\\\\\\\n\\\\\\\\t\\\\\\\\t\\\\\\\\t<div class=\\\\\\\\\\\\\\\"text\\\\\\\\\\\\\\\">\\\\\\\\n\\\\\\\\t\\\\\\\\t\\\\\\\\t\\\\\\\\t<h5><a href=\\\\\\\\\\\\\\\"#\\\\\\\\\\\\\\\">Free shipping<\\/a><\\/h5>\\\\\\\\n\\\\\\\\t\\\\\\\\t\\\\\\\\t\\\\\\\\t<p>Free shipping on oder over $100<\\/p>\\\\\\\\n\\\\\\\\t\\\\\\\\t\\\\\\\\t<\\/div>\\\\\\\\n\\\\\\\\t\\\\\\\\t<\\/li>\\\\\\\\n\\\\\\\\t\\\\\\\\t<li class=\\\\\\\\\\\\\\\"item secure col-md-3\\\\\\\\\\\\\\\">\\\\\\\\n\\\\\\\\t\\\\\\\\t\\\\\\\\t<div class=\\\\\\\\\\\\\\\"icon\\\\\\\\\\\\\\\">\\\\\\\\n\\\\\\\\t\\\\\\\\t\\\\\\\\t\\\\\\\\t\\\\\\\\n\\\\\\\\t\\\\\\\\t\\\\\\\\t<\\/div>\\\\\\\\n\\\\\\\\t\\\\\\\\t\\\\\\\\t<div class=\\\\\\\\\\\\\\\"text\\\\\\\\\\\\\\\">\\\\\\\\n\\\\\\\\t\\\\\\\\t\\\\\\\\t\\\\\\\\t<h5><a href=\\\\\\\\\\\\\\\"#\\\\\\\\\\\\\\\">Secure Payment<\\/a><\\/h5>\\\\\\\\n\\\\\\\\t\\\\\\\\t\\\\\\\\t\\\\\\\\t<p>We value your security<\\/p>\\\\\\\\n\\\\\\\\t\\\\\\\\t\\\\\\\\t<\\/div>\\\\\\\\n\\\\\\\\t\\\\\\\\t<\\/li>\\\\\\\\n\\\\\\\\t\\\\\\\\t<li class=\\\\\\\\\\\\\\\"item support col-md-3\\\\\\\\\\\\\\\">\\\\\\\\n\\\\\\\\t\\\\\\\\t\\\\\\\\t<div class=\\\\\\\\\\\\\\\"icon\\\\\\\\\\\\\\\">\\\\\\\\n\\\\\\\\t\\\\\\\\t\\\\\\\\t\\\\\\\\t\\\\\\\\n\\\\\\\\t\\\\\\\\t\\\\\\\\t<\\/div>\\\\\\\\n\\\\\\\\t\\\\\\\\t\\\\\\\\t<div class=\\\\\\\\\\\\\\\"text\\\\\\\\\\\\\\\">\\\\\\\\n\\\\\\\\t\\\\\\\\t\\\\\\\\t\\\\\\\\t<h5><a href=\\\\\\\\\\\\\\\"#\\\\\\\\\\\\\\\">Online support<\\/a><\\/h5>\\\\\\\\n\\\\\\\\t\\\\\\\\t\\\\\\\\t\\\\\\\\t<p>We have support 24\\/7<\\/p>\\\\\\\\n\\\\\\\\t\\\\\\\\t\\\\\\\\t<\\/div>\\\\\\\\n\\\\\\\\t\\\\\\\\t<\\/li>\\\\\\\\n\\\\\\\\t\\\\\\\\t<li class=\\\\\\\\\\\\\\\"item payment col-md-3\\\\\\\\\\\\\\\">\\\\\\\\n\\\\\\\\t\\\\\\\\t\\\\\\\\t<div class=\\\\\\\\\\\\\\\"icon\\\\\\\\\\\\\\\">\\\\\\\\n\\\\\\\\t\\\\\\\\t\\\\\\\\n\\\\\\\\t\\\\\\\\t\\\\\\\\t<\\/div>\\\\\\\\n\\\\\\\\t\\\\\\\\t\\\\\\\\t<div class=\\\\\\\\\\\\\\\"text\\\\\\\\\\\\\\\">\\\\\\\\n\\\\\\\\t\\\\\\\\t\\\\\\\\t\\\\\\\\t<h5><a href=\\\\\\\\\\\\\\\"#\\\\\\\\\\\\\\\">Payment on Delivery<\\/a><\\/h5>\\\\\\\\n\\\\\\\\t\\\\\\\\t\\\\\\\\t\\\\\\\\t<p>Cash on delivery option<\\/p>\\\\\\\\n\\\\\\\\t\\\\\\\\t\\\\\\\\t<\\/div>\\\\\\\\n\\\\\\\\t\\\\\\\\t<\\/li>\\\\\\\\n\\\\\\\\t<\\/ul>\\\\\\\\n<\\/div>\\\\\\\",\\\\\\\"content_2\\\\\\\":\\\\\\\"<div class=\\\\\\\\\\\\\\\"clearfix home1-sevices\\\\\\\\\\\\\\\">\\\\\\\\n\\\\\\\\t<ul><li class=\\\\\\\\\\\\\\\"item free col-md-3\\\\\\\\\\\\\\\">\\\\\\\\n\\\\\\\\t\\\\\\\\t\\\\\\\\t<div class=\\\\\\\\\\\\\\\"icon\\\\\\\\\\\\\\\">\\\\\\\\n\\\\\\\\t\\\\\\\\t\\\\\\\\t\\\\\\\\t\\\\\\\\n\\\\\\\\t\\\\\\\\t\\\\\\\\t<\\/div>\\\\\\\\n\\\\\\\\t\\\\\\\\t\\\\\\\\t<div class=\\\\\\\\\\\\\\\"text\\\\\\\\\\\\\\\">\\\\\\\\n\\\\\\\\t\\\\\\\\t\\\\\\\\t\\\\\\\\t<h5><a href=\\\\\\\\\\\\\\\"#\\\\\\\\\\\\\\\">Free shipping<\\/a><\\/h5>\\\\\\\\n\\\\\\\\t\\\\\\\\t\\\\\\\\t\\\\\\\\t<p>Free shipping on oder over $100<\\/p>\\\\\\\\n\\\\\\\\t\\\\\\\\t\\\\\\\\t<\\/div>\\\\\\\\n\\\\\\\\t\\\\\\\\t<\\/li>\\\\\\\\n\\\\\\\\t\\\\\\\\t<li class=\\\\\\\\\\\\\\\"item secure col-md-3\\\\\\\\\\\\\\\">\\\\\\\\n\\\\\\\\t\\\\\\\\t\\\\\\\\t<div class=\\\\\\\\\\\\\\\"icon\\\\\\\\\\\\\\\">\\\\\\\\n\\\\\\\\t\\\\\\\\t\\\\\\\\t\\\\\\\\t\\\\\\\\n\\\\\\\\t\\\\\\\\t\\\\\\\\t<\\/div>\\\\\\\\n\\\\\\\\t\\\\\\\\t\\\\\\\\t<div class=\\\\\\\\\\\\\\\"text\\\\\\\\\\\\\\\">\\\\\\\\n\\\\\\\\t\\\\\\\\t\\\\\\\\t\\\\\\\\t<h5><a href=\\\\\\\\\\\\\\\"#\\\\\\\\\\\\\\\">Secure Payment<\\/a><\\/h5>\\\\\\\\n\\\\\\\\t\\\\\\\\t\\\\\\\\t\\\\\\\\t<p>We value your security<\\/p>\\\\\\\\n\\\\\\\\t\\\\\\\\t\\\\\\\\t<\\/div>\\\\\\\\n\\\\\\\\t\\\\\\\\t<\\/li>\\\\\\\\n\\\\\\\\t\\\\\\\\t<li class=\\\\\\\\\\\\\\\"item support col-md-3\\\\\\\\\\\\\\\">\\\\\\\\n\\\\\\\\t\\\\\\\\t\\\\\\\\t<div class=\\\\\\\\\\\\\\\"icon\\\\\\\\\\\\\\\">\\\\\\\\n\\\\\\\\t\\\\\\\\t\\\\\\\\t\\\\\\\\t\\\\\\\\n\\\\\\\\t\\\\\\\\t\\\\\\\\t<\\/div>\\\\\\\\n\\\\\\\\t\\\\\\\\t\\\\\\\\t<div class=\\\\\\\\\\\\\\\"text\\\\\\\\\\\\\\\">\\\\\\\\n\\\\\\\\t\\\\\\\\t\\\\\\\\t\\\\\\\\t<h5><a href=\\\\\\\\\\\\\\\"#\\\\\\\\\\\\\\\">Online support<\\/a><\\/h5>\\\\\\\\n\\\\\\\\t\\\\\\\\t\\\\\\\\t\\\\\\\\t<p>We have support 24\\/7<\\/p>\\\\\\\\n\\\\\\\\t\\\\\\\\t\\\\\\\\t<\\/div>\\\\\\\\n\\\\\\\\t\\\\\\\\t<\\/li>\\\\\\\\n\\\\\\\\t\\\\\\\\t<li class=\\\\\\\\\\\\\\\"item payment col-md-3\\\\\\\\\\\\\\\">\\\\\\\\n\\\\\\\\t\\\\\\\\t\\\\\\\\t<div class=\\\\\\\\\\\\\\\"icon\\\\\\\\\\\\\\\">\\\\\\\\n\\\\\\\\t\\\\\\\\t\\\\\\\\n\\\\\\\\t\\\\\\\\t\\\\\\\\t<\\/div>\\\\\\\\n\\\\\\\\t\\\\\\\\t\\\\\\\\t<div class=\\\\\\\\\\\\\\\"text\\\\\\\\\\\\\\\">\\\\\\\\n\\\\\\\\t\\\\\\\\t\\\\\\\\t\\\\\\\\t<h5><a href=\\\\\\\\\\\\\\\"#\\\\\\\\\\\\\\\">Payment on Delivery<\\/a><\\/h5>\\\\\\\\n\\\\\\\\t\\\\\\\\t\\\\\\\\t\\\\\\\\t<p>Cash on delivery option<\\/p>\\\\\\\\n\\\\\\\\t\\\\\\\\t\\\\\\\\t<\\/div>\\\\\\\\n\\\\\\\\t\\\\\\\\t<\\/li>\\\\\\\\n\\\\\\\\t<\\/ul>\\\\\\\\n<\\/div>\\\\\\\",\\\\\\\"yt_class\\\\\\\":\\\\\\\"\\\\\\\",\\\\\\\"css_internal\\\\\\\":\\\\\\\"\\\\\\\"}],\\\\\\\"cchild\\\\\\\":{}}\\\"}],\\\"rows\\\":[]},{\\\"text_class_id\\\":\\\"col_cfay\\\",\\\"text_class\\\":\\\"block block_11\\\",\\\"text_color\\\":\\\"#000000\\\",\\\"link_color\\\":\\\"#000000\\\",\\\"link_hover_color\\\":\\\"#000000\\\",\\\"heading_color\\\":\\\"#000000\\\",\\\"background_type\\\":\\\"0\\\",\\\"bg_color\\\":\\\"#FFFFFF\\\",\\\"bg_opacity\\\":\\\"100%\\\",\\\"bg_image\\\":\\\"\\\",\\\"bg_repeat\\\":\\\"no-repeat\\\",\\\"bg_position\\\":\\\"center center\\\",\\\"bg_attachment\\\":\\\"fixed\\\",\\\"bg_scale\\\":\\\"cover\\\",\\\"col_video_type\\\":\\\"0\\\",\\\"col_link_video\\\":\\\"YE7VzlLtp-4\\\",\\\"padding\\\":\\\"\\\",\\\"margin\\\":\\\"\\\",\\\"lg_col\\\":\\\"12\\\",\\\"md_col\\\":\\\"12\\\",\\\"sm_col\\\":\\\"12\\\",\\\"xs_col\\\":\\\"12\\\",\\\"widgets\\\":[{\\\"name\\\":\\\"Home 1 - Latest Blog\\\",\\\"module\\\":\\\"so_latest_blog.212\\\",\\\"type\\\":\\\"module\\\"}],\\\"rows\\\":[]},{\\\"text_class_id\\\":\\\"col_swee\\\",\\\"text_class\\\":\\\"block block_12\\\",\\\"text_color\\\":\\\"#000000\\\",\\\"link_color\\\":\\\"#000000\\\",\\\"link_hover_color\\\":\\\"#000000\\\",\\\"heading_color\\\":\\\"#000000\\\",\\\"background_type\\\":\\\"0\\\",\\\"bg_color\\\":\\\"#FFFFFF\\\",\\\"bg_opacity\\\":\\\"100%\\\",\\\"bg_image\\\":\\\"\\\",\\\"bg_repeat\\\":\\\"no-repeat\\\",\\\"bg_position\\\":\\\"center center\\\",\\\"bg_attachment\\\":\\\"fixed\\\",\\\"bg_scale\\\":\\\"cover\\\",\\\"col_video_type\\\":\\\"0\\\",\\\"col_link_video\\\":\\\"YE7VzlLtp-4\\\",\\\"padding\\\":\\\"\\\",\\\"margin\\\":\\\"\\\",\\\"lg_col\\\":\\\"12\\\",\\\"md_col\\\":\\\"12\\\",\\\"sm_col\\\":\\\"12\\\",\\\"xs_col\\\":\\\"12\\\",\\\"widgets\\\":[{\\\"name\\\":\\\"Content Slider\\\",\\\"module\\\":\\\"content_slider_mfn4\\\",\\\"type\\\":\\\"shortcode\\\",\\\"shortcode\\\":\\\"content_slider\\\",\\\"content\\\":\\\"{\\\\\\\"cparent\\\\\\\":[{\\\\\\\"name_shortcode_1\\\\\\\":\\\\\\\"Home 1 - Brand Slider\\\\\\\",\\\\\\\"name_shortcode_2\\\\\\\":\\\\\\\"Home 1 - Brand Slider\\\\\\\",\\\\\\\"name_shortcode_status\\\\\\\":\\\\\\\"no\\\\\\\",\\\\\\\"style\\\\\\\":\\\\\\\"default\\\\\\\",\\\\\\\"margin\\\\\\\":\\\\\\\"10\\\\\\\",\\\\\\\"items_column0\\\\\\\":\\\\\\\"6\\\\\\\",\\\\\\\"items_column1\\\\\\\":\\\\\\\"5\\\\\\\",\\\\\\\"items_column2\\\\\\\":\\\\\\\"4\\\\\\\",\\\\\\\"items_column3\\\\\\\":\\\\\\\"3\\\\\\\",\\\\\\\"items_column4\\\\\\\":\\\\\\\"2\\\\\\\",\\\\\\\"type_change\\\\\\\":\\\\\\\"fade\\\\\\\",\\\\\\\"transitionin\\\\\\\":\\\\\\\"fadeIn\\\\\\\",\\\\\\\"transitionout\\\\\\\":\\\\\\\"fadeOut\\\\\\\",\\\\\\\"arrows\\\\\\\":\\\\\\\"yes\\\\\\\",\\\\\\\"arrow_position\\\\\\\":\\\\\\\"arrow-default\\\\\\\",\\\\\\\"pagination\\\\\\\":\\\\\\\"no\\\\\\\",\\\\\\\"autoplay\\\\\\\":\\\\\\\"yes\\\\\\\",\\\\\\\"autoheight\\\\\\\":\\\\\\\"no\\\\\\\",\\\\\\\"hoverpause\\\\\\\":\\\\\\\"yes\\\\\\\",\\\\\\\"lazyload\\\\\\\":\\\\\\\"no\\\\\\\",\\\\\\\"loop\\\\\\\":\\\\\\\"yes\\\\\\\",\\\\\\\"speed\\\\\\\":\\\\\\\"0.6\\\\\\\",\\\\\\\"delay\\\\\\\":\\\\\\\"4\\\\\\\",\\\\\\\"yt_class\\\\\\\":\\\\\\\"top-brand\\\\\\\",\\\\\\\"css_internal\\\\\\\":\\\\\\\"\\\\\\\"}],\\\\\\\"cchild\\\\\\\":{\\\\\\\"child1\\\\\\\":{\\\\\\\"src\\\\\\\":\\\\\\\"catalog\\/demo\\/brand\\/brand-1.jpg\\\\\\\",\\\\\\\"caption\\\\\\\":\\\\\\\"no\\\\\\\",\\\\\\\"link\\\\\\\":\\\\\\\"#\\\\\\\",\\\\\\\"content_1\\\\\\\":\\\\\\\"Add content here\\\\\\\",\\\\\\\"content_2\\\\\\\":\\\\\\\"Add content here\\\\\\\"},\\\\\\\"child2\\\\\\\":{\\\\\\\"src\\\\\\\":\\\\\\\"catalog\\/demo\\/brand\\/brand-2.jpg\\\\\\\",\\\\\\\"caption\\\\\\\":\\\\\\\"no\\\\\\\",\\\\\\\"link\\\\\\\":\\\\\\\"#\\\\\\\",\\\\\\\"content_1\\\\\\\":\\\\\\\"Add content here\\\\\\\",\\\\\\\"content_2\\\\\\\":\\\\\\\"Add content here\\\\\\\"},\\\\\\\"child3\\\\\\\":{\\\\\\\"src\\\\\\\":\\\\\\\"catalog\\/demo\\/brand\\/brand-3.jpg\\\\\\\",\\\\\\\"caption\\\\\\\":\\\\\\\"no\\\\\\\",\\\\\\\"link\\\\\\\":\\\\\\\"#\\\\\\\",\\\\\\\"content_1\\\\\\\":\\\\\\\"Add content here\\\\\\\",\\\\\\\"content_2\\\\\\\":\\\\\\\"Add content here\\\\\\\"},\\\\\\\"child4\\\\\\\":{\\\\\\\"src\\\\\\\":\\\\\\\"catalog\\/demo\\/brand\\/brand-4.jpg\\\\\\\",\\\\\\\"caption\\\\\\\":\\\\\\\"no\\\\\\\",\\\\\\\"link\\\\\\\":\\\\\\\"#\\\\\\\",\\\\\\\"content_1\\\\\\\":\\\\\\\"Add content here\\\\\\\",\\\\\\\"content_2\\\\\\\":\\\\\\\"Add content here\\\\\\\"},\\\\\\\"child5\\\\\\\":{\\\\\\\"src\\\\\\\":\\\\\\\"catalog\\/demo\\/brand\\/brand-5.jpg\\\\\\\",\\\\\\\"caption\\\\\\\":\\\\\\\"no\\\\\\\",\\\\\\\"link\\\\\\\":\\\\\\\"\\\\\\\",\\\\\\\"content_1\\\\\\\":\\\\\\\"Add content here\\\\\\\",\\\\\\\"content_2\\\\\\\":\\\\\\\"Add content here\\\\\\\"},\\\\\\\"child6\\\\\\\":{\\\\\\\"src\\\\\\\":\\\\\\\"catalog\\/demo\\/brand\\/brand-6.jpg\\\\\\\",\\\\\\\"caption\\\\\\\":\\\\\\\"no\\\\\\\",\\\\\\\"link\\\\\\\":\\\\\\\"\\\\\\\",\\\\\\\"content_1\\\\\\\":\\\\\\\"Add content here\\\\\\\",\\\\\\\"content_2\\\\\\\":\\\\\\\"Add content here\\\\\\\"},\\\\\\\"child7\\\\\\\":{\\\\\\\"src\\\\\\\":\\\\\\\"catalog\\/demo\\/brand\\/brand-3.jpg\\\\\\\",\\\\\\\"caption\\\\\\\":\\\\\\\"no\\\\\\\",\\\\\\\"link\\\\\\\":\\\\\\\"\\\\\\\",\\\\\\\"content_1\\\\\\\":\\\\\\\"Add content here\\\\\\\",\\\\\\\"content_2\\\\\\\":\\\\\\\"Add content here\\\\\\\"}}}\\\"}],\\\"rows\\\":[]}]}]\",\"name\":\"Home 1 - Page Builder\",\"status\":\"1\",\"import_theme\":\"0\",\"content_shortcode\":\"{&quot;cparent&quot;:[{&quot;name_shortcode_1&quot;:&quot;Home 1 - Brand Slider&quot;,&quot;name_shortcode_2&quot;:&quot;Home 1 - Brand Slider&quot;,&quot;name_shortcode_status&quot;:&quot;no&quot;,&quot;style&quot;:&quot;default&quot;,&quot;margin&quot;:&quot;10&quot;,&quot;items_column0&quot;:&quot;6&quot;,&quot;items_column1&quot;:&quot;5&quot;,&quot;items_column2&quot;:&quot;4&quot;,&quot;items_column3&quot;:&quot;3&quot;,&quot;items_column4&quot;:&quot;2&quot;,&quot;type_change&quot;:&quot;fade&quot;,&quot;transitionin&quot;:&quot;fadeIn&quot;,&quot;transitionout&quot;:&quot;fadeOut&quot;,&quot;arrows&quot;:&quot;yes&quot;,&quot;arrow_position&quot;:&quot;arrow-default&quot;,&quot;pagination&quot;:&quot;no&quot;,&quot;autoplay&quot;:&quot;yes&quot;,&quot;autoheight&quot;:&quot;no&quot;,&quot;hoverpause&quot;:&quot;yes&quot;,&quot;lazyload&quot;:&quot;no&quot;,&quot;loop&quot;:&quot;yes&quot;,&quot;speed&quot;:&quot;0.6&quot;,&quot;delay&quot;:&quot;4&quot;,&quot;yt_class&quot;:&quot;top-brand&quot;,&quot;css_internal&quot;:&quot;&quot;}],&quot;cchild&quot;:{&quot;child1&quot;:{&quot;src&quot;:&quot;catalog\\/demo\\/brand\\/brand-1.jpg&quot;,&quot;caption&quot;:&quot;no&quot;,&quot;link&quot;:&quot;#&quot;,&quot;content_1&quot;:&quot;Add content here&quot;,&quot;content_2&quot;:&quot;Add content here&quot;},&quot;child2&quot;:{&quot;src&quot;:&quot;catalog\\/demo\\/brand\\/brand-2.jpg&quot;,&quot;caption&quot;:&quot;no&quot;,&quot;link&quot;:&quot;#&quot;,&quot;content_1&quot;:&quot;Add content here&quot;,&quot;content_2&quot;:&quot;Add content here&quot;},&quot;child3&quot;:{&quot;src&quot;:&quot;catalog\\/demo\\/brand\\/brand-3.jpg&quot;,&quot;caption&quot;:&quot;no&quot;,&quot;link&quot;:&quot;#&quot;,&quot;content_1&quot;:&quot;Add content here&quot;,&quot;content_2&quot;:&quot;Add content here&quot;},&quot;child4&quot;:{&quot;src&quot;:&quot;catalog\\/demo\\/brand\\/brand-4.jpg&quot;,&quot;caption&quot;:&quot;no&quot;,&quot;link&quot;:&quot;#&quot;,&quot;content_1&quot;:&quot;Add content here&quot;,&quot;content_2&quot;:&quot;Add content here&quot;},&quot;child5&quot;:{&quot;src&quot;:&quot;catalog\\/demo\\/brand\\/brand-5.jpg&quot;,&quot;caption&quot;:&quot;no&quot;,&quot;link&quot;:&quot;&quot;,&quot;content_1&quot;:&quot;Add content here&quot;,&quot;content_2&quot;:&quot;Add content here&quot;},&quot;child6&quot;:{&quot;src&quot;:&quot;catalog\\/demo\\/brand\\/brand-6.jpg&quot;,&quot;caption&quot;:&quot;no&quot;,&quot;link&quot;:&quot;&quot;,&quot;content_1&quot;:&quot;Add content here&quot;,&quot;content_2&quot;:&quot;Add content here&quot;},&quot;child7&quot;:{&quot;src&quot;:&quot;catalog\\/demo\\/brand\\/brand-3.jpg&quot;,&quot;caption&quot;:&quot;no&quot;,&quot;link&quot;:&quot;&quot;,&quot;content_1&quot;:&quot;Add content here&quot;,&quot;content_2&quot;:&quot;Add content here&quot;}}}\",\"moduleid\":\"331\"}'),
	(182,'Home Default - Banner Left','so_html_content','{\"action\":\"save_edit\",\"name\":\"Home Default - Banner Left\",\"status\":\"1\",\"type_layout\":\"0\",\"class_suffix\":\"banner-left hidden-xs\",\"use_cache\":\"0\",\"cache_time\":\"3600\",\"module_description\":{\"1\":{\"title\":\"\",\"description\":\"&lt;div class=&quot;static-image-home-left banners&quot;&gt;&lt;div&gt;&lt;a title=&quot;Static Image&quot; href=&quot;#&quot;&gt;&lt;img src=&quot;image\\/catalog\\/demo\\/banners\\/image-left.jpg&quot; alt=&quot;Static Image&quot;&gt;&lt;\\/a&gt;&lt;\\/div&gt;&lt;\\/div&gt;\"},\"2\":{\"title\":\"\",\"description\":\"&lt;div class=&quot;static-image-home-left banners&quot;&gt;&lt;div&gt;&lt;a title=&quot;Static Image&quot; href=&quot;#&quot;&gt;&lt;img src=&quot;image\\/catalog\\/demo\\/banners\\/image-left.jpg&quot; alt=&quot;Static Image&quot;&gt;&lt;\\/a&gt;&lt;\\/div&gt;&lt;\\/div&gt;\"}},\"moduleid\":\"182\"}'),
	(297,'Home 1 - Fashion &amp; Accessories','so_listing_tabs','{\"action\":\"save_edit\",\"name\":\"Home 1 - Fashion &amp; Accessories\",\"module_description\":{\"1\":{\"head_name\":\"Fashion &amp; Accessories\"},\"2\":{\"head_name\":\"Fashion &amp; Accessories\"}},\"head_name\":\"Fashion &amp; Accessories\",\"disp_title_module\":\"1\",\"status\":\"1\",\"type_layout\":\"0\",\"class_suffix\":\"home1-lt-style2 default-nav clearfix img-float home-lt1\",\"item_link_target\":\"_self\",\"nb_column0\":\"3\",\"nb_column1\":\"3\",\"nb_column2\":\"3\",\"nb_column3\":\"2\",\"nb_column4\":\"1\",\"type_show\":\"loadmore\",\"nb_row\":\"1\",\"type_source\":\"1\",\"category\":[\"17\"],\"child_category\":\"1\",\"category_depth\":\"1\",\"product_sort\":\"p.price\",\"product_ordering\":\"ASC\",\"source_limit\":\"6\",\"catid_preload\":\"17\",\"field_product_tab\":[\"rating\",\"p_date_added\",\"sell\"],\"field_preload\":\"rating\",\"tab_all_display\":\"0\",\"tab_max_characters\":\"50\",\"tab_icon_display\":\"0\",\"cat_order_by\":\"name\",\"imgcfgcat_width\":\"30\",\"imgcfgcat_height\":\"30\",\"display_title\":\"1\",\"title_maxlength\":\"50\",\"display_description\":\"0\",\"description_maxlength\":\"100\",\"display_price\":\"1\",\"display_add_to_cart\":\"1\",\"display_wishlist\":\"1\",\"display_compare\":\"1\",\"display_rating\":\"0\",\"display_sale\":\"1\",\"display_new\":\"1\",\"date_day\":\"227\",\"product_image_num\":\"1\",\"product_image\":\"1\",\"product_get_image_data\":\"1\",\"product_get_image_image\":\"1\",\"width\":\"370\",\"height\":\"370\",\"product_placeholder_path\":\"nophoto.png\",\"display_banner_image\":\"1\",\"banner_image\":\"catalog\\/demo\\/banners\\/home1\\/md-banner-1.jpg\",\"banner_width\":\"270\",\"banner_height\":\"854\",\"banner_image_url\":\"#\",\"effect\":\"none\",\"margin\":\"30\",\"duration\":\"800\",\"delay\":\"500\",\"autoplay\":\"0\",\"display_nav\":\"1\",\"display_loop\":\"1\",\"touchdrag\":\"1\",\"mousedrag\":\"1\",\"pausehover\":\"0\",\"autoplayTimeout\":\"5000\",\"autoplaySpeed\":\"1000\",\"pre_text\":\"\",\"post_text\":\"\",\"use_cache\":\"0\",\"cache_time\":\"3600\",\"moduleid\":\"297\"}'),
	(299,'Home1 - Digital &amp; Electronics','so_listing_tabs','{\"action\":\"save_edit\",\"name\":\"Home1 - Digital &amp; Electronics\",\"module_description\":{\"1\":{\"head_name\":\"Digital &amp; Electronics\"},\"2\":{\"head_name\":\"Digital &amp; Electronics\"}},\"head_name\":\"Digital &amp; Electronics\",\"disp_title_module\":\"1\",\"status\":\"1\",\"type_layout\":\"4\",\"class_suffix\":\"home1-lt-style4 default-nav clearfix img-float home-lt1\",\"item_link_target\":\"_self\",\"nb_column0\":\"4\",\"nb_column1\":\"4\",\"nb_column2\":\"3\",\"nb_column3\":\"2\",\"nb_column4\":\"1\",\"type_show\":\"loadmore\",\"nb_row\":\"1\",\"type_source\":\"1\",\"category\":[\"72\",\"33\"],\"child_category\":\"1\",\"category_depth\":\"1\",\"product_sort\":\"p.price\",\"product_ordering\":\"ASC\",\"source_limit\":\"4\",\"catid_preload\":\"72\",\"field_product_tab\":[\"rating\",\"p_date_added\",\"sell\"],\"field_preload\":\"rating\",\"tab_all_display\":\"0\",\"tab_max_characters\":\"25\",\"tab_icon_display\":\"0\",\"cat_order_by\":\"name\",\"imgcfgcat_width\":\"30\",\"imgcfgcat_height\":\"30\",\"display_title\":\"1\",\"title_maxlength\":\"70\",\"display_description\":\"0\",\"description_maxlength\":\"100\",\"display_price\":\"1\",\"display_add_to_cart\":\"1\",\"display_wishlist\":\"1\",\"display_compare\":\"1\",\"display_rating\":\"0\",\"display_sale\":\"1\",\"display_new\":\"1\",\"date_day\":\"7\",\"product_image_num\":\"1\",\"product_image\":\"1\",\"product_get_image_data\":\"1\",\"product_get_image_image\":\"1\",\"width\":\"370\",\"height\":\"370\",\"product_placeholder_path\":\"nophoto.png\",\"display_banner_image\":\"0\",\"banner_image\":\"no_image.png\",\"banner_width\":\"270\",\"banner_height\":\"854\",\"banner_image_url\":\"#\",\"effect\":\"none\",\"margin\":\"30\",\"duration\":\"800\",\"delay\":\"500\",\"autoplay\":\"0\",\"display_nav\":\"1\",\"display_loop\":\"1\",\"touchdrag\":\"1\",\"mousedrag\":\"1\",\"pausehover\":\"0\",\"autoplayTimeout\":\"5000\",\"autoplaySpeed\":\"1000\",\"pre_text\":\"&lt;div&gt;&lt;a href=&quot;#&quot;&gt;&lt;img src=&quot;image\\/catalog\\/demo\\/banners\\/home1\\/bn-5.jpg&quot; alt=&quot;Image Client&quot;&gt;&lt;\\/a&gt;&lt;\\/div&gt;\",\"post_text\":\"&lt;div&gt;&lt;a href=&quot;#&quot;&gt;&lt;img src=&quot;image\\/catalog\\/demo\\/banners\\/home1\\/bn-6.jpg&quot; alt=&quot;Image Client&quot;&gt;&lt;\\/a&gt;&lt;\\/div&gt;\",\"use_cache\":\"0\",\"cache_time\":\"3600\",\"moduleid\":\"299\"}'),
	(298,'Home 1 - Travel &amp; Vacation','so_listing_tabs','{\"action\":\"save_edit\",\"name\":\"Home 1 - Travel &amp; Vacation\",\"module_description\":{\"1\":{\"head_name\":\"Travel &amp; Vacation\"},\"2\":{\"head_name\":\"Travel &amp; Vacation\"}},\"head_name\":\"Travel &amp; Vacation\",\"disp_title_module\":\"1\",\"status\":\"1\",\"type_layout\":\"0\",\"class_suffix\":\"home1-lt-style3 default-nav clearfix img-float home-lt1\",\"item_link_target\":\"_self\",\"nb_column0\":\"3\",\"nb_column1\":\"3\",\"nb_column2\":\"3\",\"nb_column3\":\"2\",\"nb_column4\":\"1\",\"type_show\":\"loadmore\",\"nb_row\":\"1\",\"type_source\":\"1\",\"category\":[\"25\"],\"child_category\":\"1\",\"category_depth\":\"1\",\"product_sort\":\"p.price\",\"product_ordering\":\"ASC\",\"source_limit\":\"6\",\"catid_preload\":\"25\",\"field_product_tab\":[\"rating\",\"p_date_added\",\"sell\"],\"field_preload\":\"rating\",\"tab_all_display\":\"0\",\"tab_max_characters\":\"25\",\"tab_icon_display\":\"0\",\"cat_order_by\":\"name\",\"imgcfgcat_width\":\"30\",\"imgcfgcat_height\":\"30\",\"display_title\":\"1\",\"title_maxlength\":\"60\",\"display_description\":\"0\",\"description_maxlength\":\"100\",\"display_price\":\"1\",\"display_add_to_cart\":\"1\",\"display_wishlist\":\"1\",\"display_compare\":\"1\",\"display_rating\":\"0\",\"display_sale\":\"1\",\"display_new\":\"1\",\"date_day\":\"227\",\"product_image_num\":\"1\",\"product_image\":\"1\",\"product_get_image_data\":\"1\",\"product_get_image_image\":\"1\",\"width\":\"370\",\"height\":\"370\",\"product_placeholder_path\":\"nophoto.png\",\"display_banner_image\":\"1\",\"banner_image\":\"catalog\\/demo\\/banners\\/home1\\/md-banner-2.jpg\",\"banner_width\":\"270\",\"banner_height\":\"854\",\"banner_image_url\":\"#\",\"effect\":\"none\",\"margin\":\"30\",\"duration\":\"800\",\"delay\":\"500\",\"autoplay\":\"0\",\"display_nav\":\"1\",\"display_loop\":\"1\",\"touchdrag\":\"1\",\"mousedrag\":\"1\",\"pausehover\":\"0\",\"autoplayTimeout\":\"5000\",\"autoplaySpeed\":\"1000\",\"pre_text\":\"\",\"post_text\":\"\",\"use_cache\":\"0\",\"cache_time\":\"3600\",\"moduleid\":\"298\"}'),
	(300,'Home1 - Sport &amp; Entertaiment','so_extra_slider','{\"action\":\"save_edit\",\"name\":\"Home1 - Sport &amp; Entertaiment\",\"module_description\":{\"1\":{\"head_name\":\"Sport &amp; Entertaiment\"},\"2\":{\"head_name\":\"Sport &amp; Entertaiment\"}},\"head_name\":\"Sport &amp; Entertaiment\",\"disp_title_module\":\"1\",\"status\":\"1\",\"type_layout\":\"1\",\"class_suffix\":\"home1-extra clearfix\",\"item_link_target\":\"_self\",\"button_page\":\"top\",\"products_style\":\"style1\",\"nb_column0\":\"1\",\"nb_column1\":\"1\",\"nb_column2\":\"1\",\"nb_column3\":\"1\",\"nb_column4\":\"1\",\"nb_row\":\"3\",\"type_data\":\"category\",\"product_feature\":\"\",\"category\":[\"34\"],\"child_category\":\"1\",\"category_depth\":\"1\",\"product_sort\":\"p.price\",\"product_ordering\":\"ASC\",\"limitation\":\"6\",\"display_title\":\"1\",\"title_maxlength\":\"50\",\"display_description\":\"0\",\"description_maxlength\":\"100\",\"display_price\":\"1\",\"display_readmore_link\":\"0\",\"readmore_text\":\"Readmore\",\"display_add_to_cart\":\"0\",\"display_wishlist\":\"0\",\"display_compare\":\"0\",\"display_rating\":\"0\",\"display_sale\":\"1\",\"display_new\":\"1\",\"date_day\":\"227\",\"product_image_num\":\"1\",\"product_image\":\"1\",\"product_get_image_data\":\"1\",\"product_get_image_image\":\"1\",\"width\":\"120\",\"height\":\"120\",\"placeholder_path\":\"nophoto.png\",\"margin\":\"1\",\"slideBy\":\"1\",\"autoplay\":\"0\",\"autoplayTimeout\":\"5000\",\"autoplayHoverPause\":\"0\",\"autoplaySpeed\":\"1000\",\"startPosition\":\"0\",\"mouseDrag\":\"1\",\"touchDrag\":\"1\",\"effect\":\"none\",\"dots\":\"0\",\"dotsSpeed\":\"500\",\"loop\":\"1\",\"navs\":\"1\",\"navSpeed\":\"500\",\"duration\":\"800\",\"delay\":\"500\",\"pre_text\":\"\",\"post_text\":\"\",\"use_cache\":\"0\",\"cache_time\":\"3600\",\"moduleid\":\"300\"}'),
	(301,'Home 1 - Food &amp; Restaurant','so_extra_slider','{\"action\":\"save_edit\",\"name\":\"Home 1 - Food &amp; Restaurant\",\"module_description\":{\"1\":{\"head_name\":\"Food &amp; Restaurant\"},\"2\":{\"head_name\":\"Food &amp; Restaurant\"}},\"head_name\":\"Food &amp; Restaurant\",\"disp_title_module\":\"1\",\"status\":\"1\",\"type_layout\":\"1\",\"class_suffix\":\"home1-extra clearfix home1-extra-style2\",\"item_link_target\":\"_self\",\"button_page\":\"top\",\"products_style\":\"style1\",\"nb_column0\":\"1\",\"nb_column1\":\"1\",\"nb_column2\":\"1\",\"nb_column3\":\"1\",\"nb_column4\":\"1\",\"nb_row\":\"3\",\"type_data\":\"category\",\"product_feature\":\"\",\"category\":[\"57\"],\"child_category\":\"1\",\"category_depth\":\"1\",\"product_sort\":\"p.price\",\"product_ordering\":\"ASC\",\"limitation\":\"6\",\"display_title\":\"1\",\"title_maxlength\":\"50\",\"display_description\":\"0\",\"description_maxlength\":\"100\",\"display_price\":\"1\",\"display_readmore_link\":\"0\",\"readmore_text\":\"Readmore\",\"display_add_to_cart\":\"0\",\"display_wishlist\":\"0\",\"display_compare\":\"0\",\"display_rating\":\"0\",\"display_sale\":\"1\",\"display_new\":\"1\",\"date_day\":\"7\",\"product_image_num\":\"1\",\"product_image\":\"1\",\"product_get_image_data\":\"1\",\"product_get_image_image\":\"1\",\"width\":\"120\",\"height\":\"120\",\"placeholder_path\":\"nophoto.png\",\"margin\":\"1\",\"slideBy\":\"1\",\"autoplay\":\"0\",\"autoplayTimeout\":\"5000\",\"autoplayHoverPause\":\"0\",\"autoplaySpeed\":\"1000\",\"startPosition\":\"0\",\"mouseDrag\":\"1\",\"touchDrag\":\"1\",\"effect\":\"none\",\"dots\":\"0\",\"dotsSpeed\":\"500\",\"loop\":\"1\",\"navs\":\"1\",\"navSpeed\":\"500\",\"duration\":\"800\",\"delay\":\"500\",\"pre_text\":\"\",\"post_text\":\"\",\"use_cache\":\"0\",\"cache_time\":\"3600\",\"moduleid\":\"301\"}'),
	(302,'Home 1 - Book Stationery','so_extra_slider','{\"action\":\"save_edit\",\"name\":\"Home 1 - Book Stationery\",\"module_description\":{\"1\":{\"head_name\":\"Book Stationery\"},\"2\":{\"head_name\":\"Book Stationery\"}},\"head_name\":\"Book Stationery\",\"disp_title_module\":\"1\",\"status\":\"1\",\"type_layout\":\"1\",\"class_suffix\":\"home1-extra clearfix home1-extra-style3\",\"item_link_target\":\"_self\",\"button_page\":\"top\",\"products_style\":\"style1\",\"nb_column0\":\"1\",\"nb_column1\":\"1\",\"nb_column2\":\"1\",\"nb_column3\":\"1\",\"nb_column4\":\"1\",\"nb_row\":\"3\",\"type_data\":\"category\",\"product_feature\":\"\",\"category\":[\"18\"],\"child_category\":\"1\",\"category_depth\":\"1\",\"product_sort\":\"p.price\",\"product_ordering\":\"ASC\",\"limitation\":\"6\",\"display_title\":\"1\",\"title_maxlength\":\"50\",\"display_description\":\"0\",\"description_maxlength\":\"100\",\"display_price\":\"1\",\"display_readmore_link\":\"0\",\"readmore_text\":\"Readmore\",\"display_add_to_cart\":\"0\",\"display_wishlist\":\"0\",\"display_compare\":\"0\",\"display_rating\":\"0\",\"display_sale\":\"1\",\"display_new\":\"1\",\"date_day\":\"227\",\"product_image_num\":\"1\",\"product_image\":\"1\",\"product_get_image_data\":\"1\",\"product_get_image_image\":\"1\",\"width\":\"120\",\"height\":\"120\",\"placeholder_path\":\"nophoto.png\",\"margin\":\"1\",\"slideBy\":\"1\",\"autoplay\":\"0\",\"autoplayTimeout\":\"5000\",\"autoplayHoverPause\":\"0\",\"autoplaySpeed\":\"1000\",\"startPosition\":\"0\",\"mouseDrag\":\"1\",\"touchDrag\":\"1\",\"effect\":\"none\",\"dots\":\"0\",\"dotsSpeed\":\"500\",\"loop\":\"1\",\"navs\":\"1\",\"navSpeed\":\"500\",\"duration\":\"800\",\"delay\":\"500\",\"pre_text\":\"\",\"post_text\":\"\",\"use_cache\":\"0\",\"cache_time\":\"3600\",\"moduleid\":\"302\"}'),
	(289,'So Social Login','so_sociallogin','{\"so_sociallogin_name\":\"So Social Login\",\"so_sociallogin_width\":\"130\",\"so_sociallogin_height\":\"35\",\"so_sociallogin_button\":\"icon\",\"so_sociallogin_status\":\"1\",\"so_sociallogin_popuplogin\":\"1\",\"so_sociallogin_fbtitle\":\"Facebook Login\",\"so_sociallogin_fbimage\":\"catalog\\/sociallogin\\/fb.png\",\"so_sociallogin_fbapikey\":\"442675926063537\",\"so_sociallogin_fbsecretapi\":\"88d0f814891d4d1a9b173647291a911e\",\"so_sociallogin_fbstatus\":\"1\",\"so_sociallogin_twittertitle\":\"Twitter Login\",\"so_sociallogin_twitimage\":\"catalog\\/sociallogin\\/twitter.png\",\"so_sociallogin_twitapikey\":\"EEJ3pjetfaHXrOw54ZyjATQGw\",\"so_sociallogin_twitsecretapi\":\"i7kGpUlhPsEmb4AkmaSQ2kFqgBM2U1nYs7ijHGk2f65J0672mP\",\"so_sociallogin_twitstatus\":\"1\",\"so_sociallogin_googletitle\":\"Google Login\",\"so_sociallogin_googleimage\":\"catalog\\/sociallogin\\/google.png\",\"so_sociallogin_googleapikey\":\"21690390667-tco9t3ca2o89d3sshkb2fmppoioq5mfq.apps.googleusercontent.com\",\"so_sociallogin_googlesecretapi\":\"COYNPrxaLq42QdIM2XBPASna\",\"so_sociallogin_googlestatus\":\"1\",\"so_sociallogin_linkedintitle\":\"Linkedin Login\",\"so_sociallogin_linkdinimage\":\"catalog\\/sociallogin\\/linkedin.png\",\"so_sociallogin_linkdinapikey\":\"78b7xin6x0kjj3\",\"so_sociallogin_linkdinsecretapi\":\"qvTyRdKakj6WFmWs\",\"so_sociallogin_linkstatus\":\"1\",\"name\":\"So Social Login\"}'),
	(260,'So Filter Shop By - horizontal','so_filter_shop_by','{\"action\":\"\",\"name\":\"So Filter Shop By - horizontal\",\"module_description\":{\"1\":{\"head_name\":\"SHOP BY\"}},\"head_name\":\"SHOP BY\",\"disp_title_module\":\"1\",\"status\":\"1\",\"class_suffix\":\"filter-horizontal\",\"in_class\":\"#content .row\",\"use_cache\":\"0\",\"cache_time\":\"3600\",\"disp_manu_all\":\"1\",\"disp_manu_id_5\":\"1\",\"disp_manu_id_6\":\"1\",\"disp_manu_id_7\":\"1\",\"disp_manu_id_8\":\"1\",\"disp_manu_id_9\":\"1\",\"disp_manu_id_10\":\"1\",\"disp_pro_price\":\"1\",\"disp_search_text\":\"1\",\"character_search\":\"3\",\"disp_subcategory\":\"1\",\"disp_reset_all\":\"1\",\"disp_att_group_id_6\":\"0\",\"disp_att_id_1\":\"1\",\"disp_att_id_2\":\"1\",\"disp_att_id_3\":\"1\",\"disp_att_group_id_3\":\"0\",\"disp_att_id_4\":\"1\",\"disp_att_id_5\":\"1\",\"disp_att_id_6\":\"1\",\"disp_att_id_7\":\"1\",\"disp_att_id_8\":\"1\",\"disp_att_id_9\":\"1\",\"disp_att_id_10\":\"1\",\"disp_att_id_11\":\"1\",\"disp_opt_id_1\":\"0\",\"disp_opt_id_2\":\"0\",\"disp_opt_id_5\":\"0\",\"disp_opt_id_11\":\"1\",\"moduleid\":\"260\"}'),
	(294,'So Onepage Checkout','so_onepagecheckout','{\"name\":\"So Onepage Checkout\"}'),
	(296,'Header 1 - CUSTOM','so_html_content','{\"action\":\"save_edit\",\"name\":\"Header 1 - CUSTOM\",\"status\":\"1\",\"type_layout\":\"0\",\"class_suffix\":\"html--sevices\",\"use_cache\":\"0\",\"cache_time\":\"3600\",\"module_description\":{\"1\":{\"title\":\"\",\"description\":\"&lt;div class=&quot;clearfix sevices-menu&quot;&gt;\\t\\r\\n\\t&lt;ul&gt;\\r\\n\\t\\t&lt;li class=&quot;col-md-4 item mail pull-right&quot;&gt;\\r\\n\\t\\t\\t&lt;div class=&quot;icon&quot;&gt; &lt;\\/div&gt;\\r\\n\\t\\t\\t&lt;div class=&quot;text&quot;&gt;\\r\\n\\t\\t\\t&lt;a class=&quot;name&quot; href=&quot;mailto:hello@sezplus.com&quot;&gt;hello@sezplus.com&lt;\\/a&gt;\\r\\n\\t\\t\\t&lt;p&gt;( +91 ) 22 - 6526 0008 &lt;\\/p&gt;\\r\\n\\t\\t&lt;p&gt;&lt;\\/p&gt;&lt;\\/div&gt;\\r\\n\\t\\t&lt;\\/li&gt;\\r\\n\\t&lt;\\/ul&gt;\\r\\n&lt;\\/div&gt;\"}},\"moduleid\":\"296\"}'),
	(303,'So Social Login','so_sociallogin','{\"so_sociallogin_name\":\"So Social Login\",\"so_sociallogin_width\":\"130\",\"so_sociallogin_height\":\"35\",\"so_sociallogin_button\":\"icon\",\"so_sociallogin_status\":\"1\",\"so_sociallogin_popuplogin\":\"1\",\"so_sociallogin_fbtitle\":\"Facebook Login\",\"so_sociallogin_fbimage\":\"catalog\\/sociallogin\\/fb.png\",\"so_sociallogin_fbapikey\":\"273987359678940\",\"so_sociallogin_fbsecretapi\":\"08399f0a037cdb5b975f753516922914\",\"so_sociallogin_fbstatus\":\"1\",\"so_sociallogin_twittertitle\":\"Twitter Login\",\"so_sociallogin_twitimage\":\"catalog\\/sociallogin\\/twitter.png\",\"so_sociallogin_twitapikey\":\"EEJ3pjetfaHXrOw54ZyjATQGw\",\"so_sociallogin_twitsecretapi\":\"i7kGpUlhPsEmb4AkmaSQ2kFqgBM2U1nYs7ijHGk2f65J0672mP\",\"so_sociallogin_twitstatus\":\"1\",\"so_sociallogin_googletitle\":\"Google Login\",\"so_sociallogin_googleimage\":\"catalog\\/sociallogin\\/google.png\",\"so_sociallogin_googleapikey\":\"21690390667-tco9t3ca2o89d3sshkb2fmppoioq5mfq.apps.googleusercontent.com\",\"so_sociallogin_googlesecretapi\":\"COYNPrxaLq42QdIM2XBPASna\",\"so_sociallogin_googlestatus\":\"1\",\"so_sociallogin_linkedintitle\":\"Linkedin Login\",\"so_sociallogin_linkdinimage\":\"catalog\\/sociallogin\\/linkedin.png\",\"so_sociallogin_linkdinapikey\":\"78b7xin6x0kjj3\",\"so_sociallogin_linkdinsecretapi\":\"qvTyRdKakj6WFmWs\",\"so_sociallogin_linkstatus\":\"1\",\"name\":\"So Social Login\"}'),
	(307,'Special Items','featured','{\"name\":\"Special Items\",\"product_name\":\"\",\"product\":[\"209\",\"193\",\"212\",\"211\",\"228\"],\"limit\":\"5\",\"width\":\"60\",\"height\":\"60\",\"status\":\"1\"}'),
	(310,'Seller Landing Page - Slideshow','so_home_slider','{\"name\":\"Seller Landing Page - Slideshow\",\"module_description\":{\"1\":{\"head_name\":\"Slideshow\"}},\"head_name\":\"Slideshow\",\"disp_title_module\":\"0\",\"status\":\"1\",\"class_suffix\":\"slideshow\",\"item_link_target\":\"_self\",\"nb_column0\":\"1\",\"nb_column1\":\"1\",\"nb_column2\":\"1\",\"nb_column3\":\"1\",\"nb_column4\":\"1\",\"width\":\"873\",\"height\":\"355\",\"center\":\"0\",\"autoplay\":\"1\",\"autoplayTimeout\":\"5000\",\"autoplayHoverPause\":\"1\",\"autoplaySpeed\":\"1000\",\"startPosition\":\"0\",\"mouseDrag\":\"1\",\"touchDrag\":\"1\",\"loop\":\"0\",\"dots\":\"1\",\"navs\":\"1\",\"animateOut\":\"slideOutLeft\",\"animateIn\":\"slideInRight\",\"pre_text\":\"\",\"post_text\":\"\",\"use_cache\":\"0\",\"cache_time\":\"3600\",\"image\":\"\",\"slide_link\":\"\",\"slide_status\":\"1\",\"slide_description\":{\"1\":{\"slide_title\":\"\",\"language_id\":\"1\",\"slide_caption\":\"\",\"slide_desciption\":\" \"}},\"moduleid\":\"310\"}'),
	(311,'Home Page 3 - Slideshow','so_home_slider','{\"name\":\"Home Page 3 - Slideshow\",\"module_description\":{\"1\":{\"head_name\":\"Slidershow\"},\"2\":{\"head_name\":\"Slidershow\"}},\"head_name\":\"Slidershow\",\"disp_title_module\":\"0\",\"status\":\"1\",\"class_suffix\":\"\",\"item_link_target\":\"_blank\",\"nb_column0\":\"1\",\"nb_column1\":\"1\",\"nb_column2\":\"1\",\"nb_column3\":\"1\",\"nb_column4\":\"1\",\"width\":\"1058\",\"height\":\"370\",\"center\":\"0\",\"autoplay\":\"1\",\"autoplayTimeout\":\"5000\",\"autoplayHoverPause\":\"1\",\"autoplaySpeed\":\"1000\",\"startPosition\":\"0\",\"mouseDrag\":\"1\",\"touchDrag\":\"1\",\"loop\":\"1\",\"dots\":\"1\",\"navs\":\"1\",\"animateOut\":\"slideOutLeft\",\"animateIn\":\"slideInRight\",\"pre_text\":\"\",\"post_text\":\"\",\"use_cache\":\"0\",\"cache_time\":\"3600\",\"image\":\"\",\"slide_link\":\"\",\"slide_status\":\"1\",\"slide_description\":{\"1\":{\"slide_title\":\"\",\"language_id\":\"1\",\"slide_caption\":\"\",\"slide_desciption\":\" \"},\"2\":{\"slide_title\":\"\",\"language_id\":\"2\",\"slide_caption\":\"\",\"slide_desciption\":\" \"}},\"moduleid\":\"311\"}'),
	(312,'Home 2 - Ending Soon','so_extra_slider','{\"action\":\"save_edit\",\"name\":\"Home 2 - Ending Soon\",\"module_description\":{\"1\":{\"head_name\":\"Ending Soon\"},\"2\":{\"head_name\":\"Ending Soon\"}},\"head_name\":\"Ending Soon\",\"disp_title_module\":\"1\",\"status\":\"1\",\"type_layout\":\"2\",\"class_suffix\":\"home2_extra\",\"item_link_target\":\"_blank\",\"button_page\":\"top\",\"products_style\":\"style1\",\"nb_column0\":\"4\",\"nb_column1\":\"3\",\"nb_column2\":\"3\",\"nb_column3\":\"2\",\"nb_column4\":\"1\",\"nb_row\":\"2\",\"type_data\":\"category\",\"product_feature\":\"\",\"category\":[\"33\"],\"child_category\":\"1\",\"category_depth\":\"1\",\"product_sort\":\"p.price\",\"product_ordering\":\"ASC\",\"limitation\":\"8\",\"display_title\":\"1\",\"title_maxlength\":\"50\",\"display_description\":\"0\",\"description_maxlength\":\"100\",\"display_price\":\"1\",\"display_readmore_link\":\"0\",\"readmore_text\":\"Readmore\",\"display_add_to_cart\":\"1\",\"display_wishlist\":\"1\",\"display_compare\":\"1\",\"display_rating\":\"0\",\"display_sale\":\"1\",\"display_new\":\"1\",\"date_day\":\"227\",\"product_image_num\":\"1\",\"product_image\":\"1\",\"product_get_image_data\":\"1\",\"product_get_image_image\":\"1\",\"width\":\"222\",\"height\":\"222\",\"placeholder_path\":\"nophoto.png\",\"margin\":\"0\",\"slideBy\":\"1\",\"autoplay\":\"0\",\"autoplayTimeout\":\"5000\",\"autoplayHoverPause\":\"0\",\"autoplaySpeed\":\"1000\",\"startPosition\":\"0\",\"mouseDrag\":\"1\",\"touchDrag\":\"1\",\"effect\":\"none\",\"dots\":\"0\",\"dotsSpeed\":\"500\",\"loop\":\"1\",\"navs\":\"1\",\"navSpeed\":\"500\",\"duration\":\"800\",\"delay\":\"500\",\"pre_text\":\"&lt;a title=&quot;Static Image&quot; href=&quot;#&quot;&gt;&lt;img src=&quot;image\\/catalog\\/demo\\/banners\\/home2\\/banner11.jpg&quot; alt=&quot;Static Image&quot;&gt;&lt;\\/a&gt;\",\"post_text\":\"\",\"use_cache\":\"0\",\"cache_time\":\"3600\",\"moduleid\":\"312\"}'),
	(313,'Banner Mod Featured','so_html_content','{\"action\":\"save_edit\",\"name\":\"Banner Mod Featured\",\"status\":\"1\",\"type_layout\":\"0\",\"class_suffix\":\"\",\"use_cache\":\"0\",\"cache_time\":\"3600\",\"module_description\":{\"1\":{\"title\":\"\",\"description\":\"&lt;div class=&quot;banner-featured hidden&quot;&gt;\\r\\n\\t&lt;div class=&quot;banners&quot;&gt;\\r\\n\\t\\t&lt;a href=&quot;#&quot; title=&quot;Banner 1&quot;&gt;\\t\\t\\t\\r\\n\\t\\t\\t&lt;img src=&quot;image\\/catalog\\/demo\\/banners\\/home2\\/bn-featured.jpg&quot; alt=&quot;Static Image&quot;&gt;\\r\\n\\t\\t&lt;\\/a&gt; \\r\\n\\t&lt;\\/div&gt;\\r\\n&lt;\\/div&gt;\"},\"2\":{\"title\":\"\",\"description\":\"&lt;div class=&quot;banner-featured hidden&quot;&gt;\\r\\n\\t&lt;div class=&quot;banners&quot;&gt;\\r\\n\\t\\t&lt;a href=&quot;#&quot; title=&quot;Banner 1&quot;&gt;\\t\\t\\t\\r\\n\\t\\t\\t&lt;img src=&quot;image\\/catalog\\/demo\\/banners\\/home2\\/bn-featured.jpg&quot; alt=&quot;Static Image&quot;&gt;\\r\\n\\t\\t&lt;\\/a&gt; \\r\\n\\t&lt;\\/div&gt;\\r\\n&lt;\\/div&gt;\"}},\"moduleid\":\"313\"}'),
	(315,'Home2 - Flash Deal ','so_deals','{\"action\":\"save_edit\",\"name\":\"Home2 - Flash Deal \",\"module_description\":{\"1\":{\"head_name\":\"Flash Deal \"},\"2\":{\"head_name\":\"Flash Deal \"}},\"head_name\":\"Flash Deal \",\"disp_title_module\":\"1\",\"status\":\"1\",\"class_suffix\":\"home2_deals\",\"item_link_target\":\"_self\",\"include_js\":\"owlCarousel\",\"nb_column0\":\"1\",\"nb_column1\":\"1\",\"nb_column2\":\"2\",\"nb_column3\":\"2\",\"nb_column4\":\"1\",\"nb_row\":\"1\",\"display_feature\":\"0\",\"product_feature\":\"\",\"position_thumbnail\":\"vertical\",\"category\":[\"17\"],\"child_category\":\"1\",\"category_depth\":\"1\",\"product_sort\":\"p.price\",\"product_ordering\":\"ASC\",\"source_limit\":\"3\",\"display_title\":\"1\",\"title_maxlength\":\"50\",\"display_description\":\"0\",\"description_maxlength\":\"100\",\"display_countdown\":\"0\",\"display_price\":\"1\",\"display_addtocart\":\"1\",\"display_wishlist\":\"0\",\"display_compare\":\"0\",\"display_rating\":\"1\",\"display_sale\":\"1\",\"display_new\":\"1\",\"date_day\":\"227\",\"product_image_num\":\"1\",\"product_image\":\"1\",\"product_get_image_data\":\"1\",\"product_get_image_image\":\"1\",\"width\":\"300\",\"height\":\"300\",\"placeholder_path\":\"nophoto.png\",\"margin\":\"1\",\"slideBy\":\"1\",\"autoplay\":\"0\",\"autoplayTimeout\":\"5000\",\"autoplayHoverPause\":\"0\",\"autoplaySpeed\":\"1000\",\"startPosition\":\"0\",\"mouseDrag\":\"1\",\"touchDrag\":\"1\",\"loop\":\"1\",\"button_page\":\"top\",\"dots\":\"0\",\"dotsSpeed\":\"500\",\"navs\":\"1\",\"navSpeed\":\"500\",\"effect\":\"none\",\"duration\":\"800\",\"delay\":\"500\",\"store_layout\":\"default\",\"pre_text\":\"\",\"post_text\":\"\",\"use_cache\":\"0\",\"cache_time\":\"3600\",\"moduleid\":\"315\"}'),
	(316,'Home 2 - Weekly Deal','so_deals','{\"action\":\"save_edit\",\"name\":\"Home 2 - Weekly Deal\",\"module_description\":{\"1\":{\"head_name\":\"Weekly Deal\"},\"2\":{\"head_name\":\"Weekly Deal\"}},\"head_name\":\"Weekly Deal\",\"disp_title_module\":\"1\",\"status\":\"1\",\"class_suffix\":\"home2_deals_style2\",\"item_link_target\":\"_blank\",\"include_js\":\"slick\",\"nb_column0\":\"4\",\"nb_column1\":\"3\",\"nb_column2\":\"3\",\"nb_column3\":\"2\",\"nb_column4\":\"1\",\"nb_row\":\"1\",\"display_feature\":\"0\",\"product_feature\":\"\",\"position_thumbnail\":\"vertical\",\"category\":[\"72\",\"33\"],\"child_category\":\"1\",\"category_depth\":\"1\",\"product_sort\":\"p.price\",\"product_ordering\":\"ASC\",\"source_limit\":\"6\",\"display_title\":\"1\",\"title_maxlength\":\"50\",\"display_description\":\"1\",\"description_maxlength\":\"100\",\"display_countdown\":\"1\",\"display_price\":\"1\",\"display_addtocart\":\"1\",\"display_wishlist\":\"1\",\"display_compare\":\"1\",\"display_rating\":\"0\",\"display_sale\":\"1\",\"display_new\":\"1\",\"date_day\":\"227\",\"product_image_num\":\"1\",\"product_image\":\"1\",\"product_get_image_data\":\"1\",\"product_get_image_image\":\"1\",\"width\":\"440\",\"height\":\"440\",\"placeholder_path\":\"nophoto.png\",\"margin\":\"5\",\"slideBy\":\"1\",\"autoplay\":\"0\",\"autoplayTimeout\":\"1000\",\"autoplayHoverPause\":\"0\",\"autoplaySpeed\":\"500\",\"startPosition\":\"0\",\"mouseDrag\":\"1\",\"touchDrag\":\"1\",\"loop\":\"1\",\"button_page\":\"top\",\"dots\":\"1\",\"dotsSpeed\":\"500\",\"navs\":\"0\",\"navSpeed\":\"500\",\"effect\":\"starwars\",\"duration\":\"800\",\"delay\":\"500\",\"store_layout\":\"default\",\"pre_text\":\"\",\"post_text\":\"\",\"use_cache\":\"0\",\"cache_time\":\"3600\",\"moduleid\":\"316\"}'),
	(317,'Home 2 - Recommend','so_deals','{\"action\":\"save_edit\",\"name\":\"Home 2 - Recommend\",\"module_description\":{\"1\":{\"head_name\":\"Recommend\"},\"2\":{\"head_name\":\"Recommend\"}},\"head_name\":\"Recommend\",\"disp_title_module\":\"1\",\"status\":\"1\",\"class_suffix\":\"home2_deals_style3\",\"item_link_target\":\"_self\",\"include_js\":\"owlCarousel\",\"nb_column0\":\"2\",\"nb_column1\":\"2\",\"nb_column2\":\"2\",\"nb_column3\":\"2\",\"nb_column4\":\"1\",\"nb_row\":\"2\",\"display_feature\":\"0\",\"product_feature\":\"\",\"position_thumbnail\":\"vertical\",\"category\":[\"33\"],\"child_category\":\"1\",\"category_depth\":\"1\",\"product_sort\":\"p.price\",\"product_ordering\":\"ASC\",\"source_limit\":\"8\",\"display_title\":\"1\",\"title_maxlength\":\"50\",\"display_description\":\"0\",\"description_maxlength\":\"100\",\"display_countdown\":\"0\",\"display_price\":\"1\",\"display_addtocart\":\"1\",\"display_wishlist\":\"1\",\"display_compare\":\"1\",\"display_rating\":\"1\",\"display_sale\":\"1\",\"display_new\":\"1\",\"date_day\":\"227\",\"product_image_num\":\"1\",\"product_image\":\"1\",\"product_get_image_data\":\"1\",\"product_get_image_image\":\"1\",\"width\":\"270\",\"height\":\"270\",\"placeholder_path\":\"nophoto.png\",\"margin\":\"1\",\"slideBy\":\"1\",\"autoplay\":\"0\",\"autoplayTimeout\":\"5000\",\"autoplayHoverPause\":\"0\",\"autoplaySpeed\":\"1000\",\"startPosition\":\"0\",\"mouseDrag\":\"1\",\"touchDrag\":\"1\",\"loop\":\"1\",\"button_page\":\"top\",\"dots\":\"0\",\"dotsSpeed\":\"500\",\"navs\":\"1\",\"navSpeed\":\"500\",\"effect\":\"none\",\"duration\":\"800\",\"delay\":\"500\",\"store_layout\":\"default\",\"pre_text\":\"\",\"post_text\":\"\",\"use_cache\":\"0\",\"cache_time\":\"3600\",\"moduleid\":\"317\"}'),
	(318,'Home 2 - New Deals','so_listing_tabs','{\"action\":\"save_edit\",\"name\":\"Home 2 - New Deals\",\"module_description\":{\"1\":{\"head_name\":\"New Deals\"},\"2\":{\"head_name\":\"New Deals\"}},\"head_name\":\"New Deals\",\"disp_title_module\":\"1\",\"status\":\"1\",\"type_layout\":\"1\",\"class_suffix\":\"home2_listingtab\",\"item_link_target\":\"_self\",\"nb_column0\":\"4\",\"nb_column1\":\"4\",\"nb_column2\":\"3\",\"nb_column3\":\"2\",\"nb_column4\":\"1\",\"type_show\":\"slider\",\"nb_row\":\"2\",\"type_source\":\"1\",\"category\":[\"33\"],\"child_category\":\"1\",\"category_depth\":\"1\",\"product_sort\":\"p.price\",\"product_ordering\":\"ASC\",\"source_limit\":\"12\",\"catid_preload\":\"*\",\"field_product_tab\":[\"p_price\",\"rating\",\"p_date_added\",\"sell\"],\"field_preload\":\"sell\",\"tab_all_display\":\"1\",\"tab_max_characters\":\"25\",\"tab_icon_display\":\"0\",\"cat_order_by\":\"name\",\"imgcfgcat_width\":\"30\",\"imgcfgcat_height\":\"30\",\"display_title\":\"1\",\"title_maxlength\":\"50\",\"display_description\":\"0\",\"description_maxlength\":\"100\",\"display_price\":\"1\",\"display_add_to_cart\":\"1\",\"display_wishlist\":\"1\",\"display_compare\":\"1\",\"display_rating\":\"1\",\"display_sale\":\"1\",\"display_new\":\"1\",\"date_day\":\"7\",\"product_image_num\":\"1\",\"product_image\":\"1\",\"product_get_image_data\":\"1\",\"product_get_image_image\":\"1\",\"width\":\"270\",\"height\":\"270\",\"product_placeholder_path\":\"nophoto.png\",\"display_banner_image\":\"0\",\"banner_image\":\"no_image.png\",\"banner_width\":\"150\",\"banner_height\":\"250\",\"banner_image_url\":\"\",\"effect\":\"none\",\"margin\":\"0\",\"duration\":\"800\",\"delay\":\"500\",\"autoplay\":\"0\",\"display_nav\":\"1\",\"display_loop\":\"1\",\"touchdrag\":\"1\",\"mousedrag\":\"1\",\"pausehover\":\"0\",\"autoplayTimeout\":\"5000\",\"autoplaySpeed\":\"1000\",\"pre_text\":\"\",\"post_text\":\"\",\"use_cache\":\"0\",\"cache_time\":\"3600\",\"moduleid\":\"318\"}'),
	(319,'Footer 2 - Lastest From Blog','so_latest_blog','{\"action\":\"save_edit\",\"name\":\"Footer 2 - Lastest From Blog\",\"module_description\":{\"1\":{\"head_name\":\"Lastest From Blog\"},\"2\":{\"head_name\":\"Lastest From Blog\"}},\"head_name\":\"Lastest From Blog\",\"disp_title_module\":\"1\",\"status\":\"1\",\"type_layout\":\"1\",\"class_suffix\":\"footer_lastestblog footer-links \",\"item_link_target\":\"_self\",\"nb_column0\":\"4\",\"nb_column1\":\"4\",\"nb_column2\":\"3\",\"nb_column3\":\"2\",\"nb_column4\":\"1\",\"type_show\":\"simple\",\"nb_row\":\"1\",\"category\":[\"5\",\"2\"],\"child_category\":\"1\",\"category_depth\":\"1\",\"sort\":\"bd.article_title\",\"order\":\"ASC\",\"limit\":\"3\",\"display_title\":\"1\",\"title_maxlength\":\"50\",\"display_description\":\"0\",\"description_maxlength\":\"100\",\"display_author\":\"1\",\"display_comment\":\"0\",\"display_view\":\"0\",\"display_date_added\":\"1\",\"display_readmore\":\"0\",\"readmore_text\":\"Read more\",\"blog_image\":\"1\",\"blog_get_featured_image\":\"1\",\"width\":\"65\",\"height\":\"50\",\"blog_placeholder_path\":\"nophoto.png\",\"margin\":\"1\",\"slideBy\":\"1\",\"autoplay\":\"0\",\"autoplay_timeout\":\"5000\",\"pausehover\":\"0\",\"autoplaySpeed\":\"1000\",\"startPosition\":\"0\",\"mouseDrag\":\"1\",\"touchDrag\":\"1\",\"loop\":\"1\",\"button_page\":\"under\",\"dots\":\"1\",\"dotsSpeed\":\"500\",\"navs\":\"1\",\"navSpeed\":\"500\",\"effect\":\"none\",\"duration\":\"800\",\"delay\":\"500\",\"pre_text\":\"\",\"post_text\":\"\",\"use_cache\":\"0\",\"cache_time\":\"3600\",\"moduleid\":\"319\"}'),
	(330,'Footer 1 - CUSTOM','so_page_builder','{\"page_builder\":\"[{\\\"text_class_id\\\":\\\"row_qof8\\\",\\\"text_class\\\":\\\"footer--center3\\\",\\\"text_color\\\":\\\"#000000\\\",\\\"link_color\\\":\\\"#000000\\\",\\\"link_hover_color\\\":\\\"#000000\\\",\\\"heading_color\\\":\\\"#000000\\\",\\\"background_type\\\":\\\"1\\\",\\\"bg_color\\\":\\\"#fff\\\",\\\"bg_opacity\\\":\\\"100%\\\",\\\"bg_image\\\":\\\"\\\",\\\"bg_repeat\\\":\\\"no-repeat\\\",\\\"bg_position\\\":\\\"center center\\\",\\\"bg_attachment\\\":\\\"fixed\\\",\\\"bg_scale\\\":\\\"cover\\\",\\\"video_type\\\":\\\"0\\\",\\\"link_video\\\":\\\"YE7VzlLtp-4\\\",\\\"margin\\\":\\\"\\\",\\\"padding\\\":\\\"\\\",\\\"row_container_fluid\\\":\\\"1\\\",\\\"row_section\\\":\\\"0\\\",\\\"row_section_class\\\":\\\"section-style\\\",\\\"row_section_id\\\":\\\"\\\",\\\"section_background_type\\\":\\\"0\\\",\\\"section_bg_color\\\":\\\"#FFFFFF\\\",\\\"section_bg_opacity\\\":\\\"100%\\\",\\\"section_bg_image\\\":\\\"\\\",\\\"section_bg_repeat\\\":\\\"no-repeat\\\",\\\"section_bg_position\\\":\\\"center center\\\",\\\"section_bg_attachment\\\":\\\"fixed\\\",\\\"section_bg_scale\\\":\\\"cover\\\",\\\"section_video_type\\\":\\\"0\\\",\\\"section_link_video\\\":\\\"YE7VzlLtp-4\\\",\\\"cols\\\":[{\\\"text_class_id\\\":\\\"col_up4v\\\",\\\"text_class\\\":\\\"float_none \\\",\\\"text_color\\\":\\\"#000000\\\",\\\"link_color\\\":\\\"#000000\\\",\\\"link_hover_color\\\":\\\"#000000\\\",\\\"heading_color\\\":\\\"#000000\\\",\\\"background_type\\\":\\\"1\\\",\\\"bg_color\\\":\\\"#FFFFFF\\\",\\\"bg_opacity\\\":\\\"100%\\\",\\\"bg_image\\\":\\\"\\\",\\\"bg_repeat\\\":\\\"no-repeat\\\",\\\"bg_position\\\":\\\"center center\\\",\\\"bg_attachment\\\":\\\"fixed\\\",\\\"bg_scale\\\":\\\"cover\\\",\\\"col_video_type\\\":\\\"0\\\",\\\"col_link_video\\\":\\\"YE7VzlLtp-4\\\",\\\"padding\\\":\\\"\\\",\\\"margin\\\":\\\"\\\",\\\"lg_col\\\":\\\"12\\\",\\\"md_col\\\":\\\"12\\\",\\\"sm_col\\\":\\\"12\\\",\\\"xs_col\\\":\\\"12\\\",\\\"widgets\\\":[],\\\"rows\\\":[{\\\"text_class_id\\\":\\\"row_fymn\\\",\\\"text_class\\\":\\\"\\\",\\\"text_color\\\":\\\"#000000\\\",\\\"link_color\\\":\\\"#000000\\\",\\\"link_hover_color\\\":\\\"#000000\\\",\\\"heading_color\\\":\\\"#000000\\\",\\\"background_type\\\":\\\"0\\\",\\\"bg_color\\\":\\\"#FFFFFF\\\",\\\"bg_opacity\\\":\\\"100%\\\",\\\"bg_image\\\":\\\"\\\",\\\"bg_repeat\\\":\\\"no-repeat\\\",\\\"bg_position\\\":\\\"center center\\\",\\\"bg_attachment\\\":\\\"fixed\\\",\\\"bg_scale\\\":\\\"cover\\\",\\\"video_type\\\":\\\"0\\\",\\\"link_video\\\":\\\"YE7VzlLtp-4\\\",\\\"margin\\\":\\\"\\\",\\\"padding\\\":\\\"\\\",\\\"row_container_fluid\\\":\\\"1\\\",\\\"row_section\\\":\\\"0\\\",\\\"row_section_class\\\":\\\"section-style\\\",\\\"row_section_id\\\":\\\"\\\",\\\"section_background_type\\\":\\\"0\\\",\\\"section_bg_color\\\":\\\"#FFFFFF\\\",\\\"section_bg_opacity\\\":\\\"100%\\\",\\\"section_bg_image\\\":\\\"\\\",\\\"section_bg_repeat\\\":\\\"no-repeat\\\",\\\"section_bg_position\\\":\\\"center center\\\",\\\"section_bg_attachment\\\":\\\"fixed\\\",\\\"section_bg_scale\\\":\\\"cover\\\",\\\"section_video_type\\\":\\\"0\\\",\\\"section_link_video\\\":\\\"YE7VzlLtp-4\\\",\\\"cols\\\":[{\\\"text_class_id\\\":\\\"col_1yf0\\\",\\\"text_class\\\":\\\"\\\",\\\"text_color\\\":\\\"#000000\\\",\\\"link_color\\\":\\\"#000000\\\",\\\"link_hover_color\\\":\\\"#000000\\\",\\\"heading_color\\\":\\\"#000000\\\",\\\"background_type\\\":\\\"0\\\",\\\"bg_color\\\":\\\"#FFFFFF\\\",\\\"bg_opacity\\\":\\\"100%\\\",\\\"bg_image\\\":\\\"\\\",\\\"bg_repeat\\\":\\\"no-repeat\\\",\\\"bg_position\\\":\\\"center center\\\",\\\"bg_attachment\\\":\\\"fixed\\\",\\\"bg_scale\\\":\\\"cover\\\",\\\"col_video_type\\\":\\\"0\\\",\\\"col_link_video\\\":\\\"YE7VzlLtp-4\\\",\\\"padding\\\":\\\"\\\",\\\"margin\\\":\\\"\\\",\\\"lg_col\\\":\\\"12\\\",\\\"md_col\\\":\\\"12\\\",\\\"sm_col\\\":\\\"12\\\",\\\"xs_col\\\":\\\"12\\\",\\\"widgets\\\":[{\\\"name\\\":\\\"Html\\\",\\\"module\\\":\\\"html_mm9y\\\",\\\"type\\\":\\\"shortcode\\\",\\\"shortcode\\\":\\\"html\\\",\\\"content\\\":\\\"{\\\\\\\"cparent\\\\\\\":[{\\\\\\\"name_shortcode_1\\\\\\\":\\\\\\\"Footer_Contact\\\\\\\",\\\\\\\"name_shortcode_status\\\\\\\":\\\\\\\"no\\\\\\\",\\\\\\\"content_1\\\\\\\":\\\\\\\"<div class=\\\\\\\\\\\\\\\"contactinfo\\\\\\\\\\\\\\\">\\\\\\\\n\\\\\\\\t<h4 class=\\\\\\\\\\\\\\\"title-footer\\\\\\\\\\\\\\\">Our Contact<\\/h4><div class=\\\\\\\\\\\\\\\"content-footer\\\\\\\\\\\\\\\">\\\\\\\\n\\\\\\\\t\\\\\\\\t<div class=\\\\\\\\\\\\\\\"address\\\\\\\\\\\\\\\">\\\\\\\\n\\\\\\\\t\\\\\\\\t\\\\\\\\t<label><i class=\\\\\\\\\\\\\\\"fa fa-map-marker\\\\\\\\\\\\\\\" aria-hidden=\\\\\\\\\\\\\\\"true\\\\\\\\\\\\\\\"><\\/i><\\/label>\\\\\\\\n\\\\\\\\t\\\\\\\\t\\\\\\\\t<span>M.I.D.C Andheri East, Mumbai - 93<\\/span>\\\\\\\\n\\\\\\\\t\\\\\\\\t<\\/div>\\\\\\\\n\\\\\\\\t\\\\\\\\t<div class=\\\\\\\\\\\\\\\"phone\\\\\\\\\\\\\\\">\\\\\\\\n\\\\\\\\t\\\\\\\\t\\\\\\\\t<label><i class=\\\\\\\\\\\\\\\"fa fa-phone\\\\\\\\\\\\\\\" aria-hidden=\\\\\\\\\\\\\\\"true\\\\\\\\\\\\\\\"><\\/i><\\/label>\\\\\\\\n\\\\\\\\t\\\\\\\\t\\\\\\\\t<span>( +91 ) 22 - 6526 0008<\\/span>\\\\\\\\n\\\\\\\\t\\\\\\\\t<\\/div>\\\\\\\\n\\\\\\\\t\\\\\\\\t<div class=\\\\\\\\\\\\\\\"email\\\\\\\\\\\\\\\">\\\\\\\\n\\\\\\\\t\\\\\\\\t\\\\\\\\t<label><i class=\\\\\\\\\\\\\\\"fa fa-envelope\\\\\\\\\\\\\\\"><\\/i><\\/label>\\\\\\\\n\\\\\\\\t\\\\\\\\t\\\\\\\\t<a href=\\\\\\\\\\\\\\\"mailto:support@sezplus.com\\\\\\\\\\\\\\\">support@sezplus.com<\\/a>\\\\\\\\n\\\\\\\\t\\\\\\\\t<\\/div>\\\\\\\\n\\\\\\\\t<\\/div>\\\\\\\\n<\\/div>\\\\\\\",\\\\\\\"yt_class\\\\\\\":\\\\\\\"\\\\\\\",\\\\\\\"css_internal\\\\\\\":\\\\\\\"\\\\\\\"}],\\\\\\\"cchild\\\\\\\":{}}\\\"}],\\\"rows\\\":[]}]}]}]}]\",\"name\":\"Footer 1 - CUSTOM\",\"status\":\"1\",\"import_theme\":\"0\",\"content_shortcode\":\"{&quot;cparent&quot;:[{&quot;name_shortcode_1&quot;:&quot;Footer_Contact&quot;,&quot;name_shortcode_status&quot;:&quot;no&quot;,&quot;content_1&quot;:&quot;&lt;div class=\\\\&quot;contactinfo\\\\&quot;&gt;\\\\n\\\\t&lt;h4 class=\\\\&quot;title-footer\\\\&quot;&gt;Our Contact&lt;\\/h4&gt;&lt;div class=\\\\&quot;content-footer\\\\&quot;&gt;\\\\n\\\\t\\\\t&lt;div class=\\\\&quot;address\\\\&quot;&gt;\\\\n\\\\t\\\\t\\\\t&lt;label&gt;&lt;i class=\\\\&quot;fa fa-map-marker\\\\&quot; aria-hidden=\\\\&quot;true\\\\&quot;&gt;&lt;\\/i&gt;&lt;\\/label&gt;\\\\n\\\\t\\\\t\\\\t&lt;span&gt;M.I.D.C Andheri East, Mumbai - 93&lt;\\/span&gt;\\\\n\\\\t\\\\t&lt;\\/div&gt;\\\\n\\\\t\\\\t&lt;div class=\\\\&quot;phone\\\\&quot;&gt;\\\\n\\\\t\\\\t\\\\t&lt;label&gt;&lt;i class=\\\\&quot;fa fa-phone\\\\&quot; aria-hidden=\\\\&quot;true\\\\&quot;&gt;&lt;\\/i&gt;&lt;\\/label&gt;\\\\n\\\\t\\\\t\\\\t&lt;span&gt;( +91 ) 22 - 6526 0008&lt;\\/span&gt;\\\\n\\\\t\\\\t&lt;\\/div&gt;\\\\n\\\\t\\\\t&lt;div class=\\\\&quot;email\\\\&quot;&gt;\\\\n\\\\t\\\\t\\\\t&lt;label&gt;&lt;i class=\\\\&quot;fa fa-envelope\\\\&quot;&gt;&lt;\\/i&gt;&lt;\\/label&gt;\\\\n\\\\t\\\\t\\\\t&lt;a href=\\\\&quot;mailto:support@sezplus.com\\\\&quot;&gt;support@sezplus.com&lt;\\/a&gt;\\\\n\\\\t\\\\t&lt;\\/div&gt;\\\\n\\\\t&lt;\\/div&gt;\\\\n&lt;\\/div&gt;&quot;,&quot;yt_class&quot;:&quot;&quot;,&quot;css_internal&quot;:&quot;&quot;}],&quot;cchild&quot;:{}}\",\"moduleid\":\"330\"}'),
	(341,'Seller Landing Page','so_page_builder','{\"page_builder\":\"[{\\\"text_class_id\\\":\\\"row_63qx\\\",\\\"text_class\\\":\\\"row-style\\\",\\\"text_color\\\":\\\"#000000\\\",\\\"link_color\\\":\\\"#000000\\\",\\\"link_hover_color\\\":\\\"#000000\\\",\\\"heading_color\\\":\\\"#000000\\\",\\\"background_type\\\":\\\"0\\\",\\\"bg_color\\\":\\\"#FFFFFF\\\",\\\"bg_opacity\\\":\\\"100%\\\",\\\"bg_image\\\":\\\"\\\",\\\"bg_repeat\\\":\\\"no-repeat\\\",\\\"bg_position\\\":\\\"center center\\\",\\\"bg_attachment\\\":\\\"fixed\\\",\\\"bg_scale\\\":\\\"cover\\\",\\\"video_type\\\":\\\"0\\\",\\\"link_video\\\":\\\"YE7VzlLtp-4\\\",\\\"margin\\\":\\\"\\\",\\\"padding\\\":\\\"\\\",\\\"row_container_fluid\\\":\\\"0\\\",\\\"row_section\\\":\\\"0\\\",\\\"row_section_class\\\":\\\"section-style\\\",\\\"row_section_id\\\":\\\"\\\",\\\"section_background_type\\\":\\\"0\\\",\\\"section_bg_color\\\":\\\"#FFFFFF\\\",\\\"section_bg_opacity\\\":\\\"100%\\\",\\\"section_bg_image\\\":\\\"\\\",\\\"section_bg_repeat\\\":\\\"no-repeat\\\",\\\"section_bg_position\\\":\\\"center center\\\",\\\"section_bg_attachment\\\":\\\"fixed\\\",\\\"section_bg_scale\\\":\\\"cover\\\",\\\"section_video_type\\\":\\\"0\\\",\\\"section_link_video\\\":\\\"YE7VzlLtp-4\\\",\\\"cols\\\":[{\\\"text_class_id\\\":\\\"col_pix3\\\",\\\"text_class\\\":\\\"slider-right\\\",\\\"text_color\\\":\\\"#000000\\\",\\\"link_color\\\":\\\"#000000\\\",\\\"link_hover_color\\\":\\\"#000000\\\",\\\"heading_color\\\":\\\"#000000\\\",\\\"background_type\\\":\\\"0\\\",\\\"bg_color\\\":\\\"#FFFFFF\\\",\\\"bg_opacity\\\":\\\"100%\\\",\\\"bg_image\\\":\\\"\\\",\\\"bg_repeat\\\":\\\"no-repeat\\\",\\\"bg_position\\\":\\\"center center\\\",\\\"bg_attachment\\\":\\\"fixed\\\",\\\"bg_scale\\\":\\\"cover\\\",\\\"col_video_type\\\":\\\"0\\\",\\\"col_link_video\\\":\\\"YE7VzlLtp-4\\\",\\\"padding\\\":\\\"\\\",\\\"margin\\\":\\\"10px\\\",\\\"lg_col\\\":\\\"12\\\",\\\"md_col\\\":\\\"9\\\",\\\"sm_col\\\":\\\"12\\\",\\\"xs_col\\\":\\\"12\\\",\\\"widgets\\\":[{\\\"name\\\":\\\"Seller Landing Page - Slideshow\\\",\\\"module\\\":\\\"so_home_slider.310\\\",\\\"type\\\":\\\"module\\\"}],\\\"rows\\\":[]}]},{\\\"text_class_id\\\":\\\"row_tk95\\\",\\\"text_class\\\":\\\"row-style\\\",\\\"text_color\\\":\\\"#000000\\\",\\\"link_color\\\":\\\"#000000\\\",\\\"link_hover_color\\\":\\\"#000000\\\",\\\"heading_color\\\":\\\"#000000\\\",\\\"background_type\\\":0,\\\"bg_color\\\":\\\"#FFFFFF\\\",\\\"bg_opacity\\\":\\\"100%\\\",\\\"bg_image\\\":\\\"\\\",\\\"bg_repeat\\\":\\\"no-repeat\\\",\\\"bg_position\\\":\\\"center center\\\",\\\"bg_attachment\\\":\\\"fixed\\\",\\\"bg_scale\\\":\\\"cover\\\",\\\"video_type\\\":0,\\\"link_video\\\":\\\"YE7VzlLtp-4\\\",\\\"margin\\\":\\\"\\\",\\\"padding\\\":\\\"\\\",\\\"row_container_fluid\\\":0,\\\"row_section\\\":0,\\\"row_section_class\\\":\\\"section-style\\\",\\\"row_section_id\\\":\\\"\\\",\\\"section_background_type\\\":0,\\\"section_bg_color\\\":\\\"#FFFFFF\\\",\\\"section_bg_opacity\\\":\\\"100%\\\",\\\"section_bg_image\\\":\\\"\\\",\\\"section_bg_repeat\\\":\\\"no-repeat\\\",\\\"section_bg_position\\\":\\\"center center\\\",\\\"section_bg_attachment\\\":\\\"fixed\\\",\\\"section_bg_scale\\\":\\\"cover\\\",\\\"section_video_type\\\":0,\\\"section_link_video\\\":\\\"YE7VzlLtp-4\\\",\\\"cols\\\":[{\\\"text_class_id\\\":\\\"col_ajtr\\\",\\\"text_class\\\":\\\"slider-right\\\",\\\"text_color\\\":\\\"#000000\\\",\\\"link_color\\\":\\\"#000000\\\",\\\"link_hover_color\\\":\\\"#000000\\\",\\\"heading_color\\\":\\\"#000000\\\",\\\"background_type\\\":\\\"0\\\",\\\"bg_color\\\":\\\"#FFFFFF\\\",\\\"bg_opacity\\\":\\\"100%\\\",\\\"bg_image\\\":\\\"\\\",\\\"bg_repeat\\\":\\\"no-repeat\\\",\\\"bg_position\\\":\\\"center center\\\",\\\"bg_attachment\\\":\\\"fixed\\\",\\\"bg_scale\\\":\\\"cover\\\",\\\"col_video_type\\\":\\\"0\\\",\\\"col_link_video\\\":\\\"YE7VzlLtp-4\\\",\\\"padding\\\":\\\"\\\",\\\"margin\\\":\\\"10px\\\",\\\"lg_col\\\":\\\"12\\\",\\\"md_col\\\":\\\"9\\\",\\\"sm_col\\\":\\\"12\\\",\\\"xs_col\\\":\\\"12\\\",\\\"widgets\\\":[{\\\"name\\\":\\\"Seller Landing - FAQ\'s\\\",\\\"module\\\":\\\"so_html_content.342\\\",\\\"type\\\":\\\"module\\\"}],\\\"rows\\\":[]},{\\\"text_class_id\\\":\\\"col_7jv2\\\",\\\"text_class\\\":\\\"col-style\\\",\\\"text_color\\\":\\\"#000000\\\",\\\"link_color\\\":\\\"#000000\\\",\\\"link_hover_color\\\":\\\"#000000\\\",\\\"heading_color\\\":\\\"#000000\\\",\\\"background_type\\\":0,\\\"bg_color\\\":\\\"#FFFFFF\\\",\\\"bg_opacity\\\":\\\"100%\\\",\\\"bg_image\\\":\\\"\\\",\\\"bg_repeat\\\":\\\"no-repeat\\\",\\\"bg_position\\\":\\\"center center\\\",\\\"bg_attachment\\\":\\\"fixed\\\",\\\"bg_scale\\\":\\\"cover\\\",\\\"col_video_type\\\":0,\\\"col_link_video\\\":\\\"YE7VzlLtp-4\\\",\\\"padding\\\":\\\"\\\",\\\"margin\\\":\\\"\\\",\\\"lg_col\\\":12,\\\"md_col\\\":\\\"4\\\",\\\"sm_col\\\":\\\"6\\\",\\\"xs_col\\\":\\\"12\\\",\\\"widgets\\\":[],\\\"rows\\\":[]}]}]\",\"name\":\"Seller Landing Page\",\"status\":\"1\",\"import_theme\":\"0\",\"moduleid\":\"341\"}'),
	(342,'Seller Landing - FAQ\'s','so_html_content','{\"action\":\"save_edit\",\"name\":\"Seller Landing - FAQ\'s\",\"status\":\"1\",\"type_layout\":\"0\",\"class_suffix\":\"no-margin\",\"use_cache\":\"0\",\"cache_time\":\"3600\",\"module_description\":{\"1\":{\"title\":\"\",\"description\":\"&lt;div class=&quot;block-categories&quot;&gt;\\r\\n\\t&lt;h3 class=&quot;modtitle&quot;&gt;&lt;span&gt;FAQ(s)&lt;\\/span&gt;&lt;\\/h3&gt;\\r\\n&lt;\\/div&gt;\"}},\"moduleid\":\"342\"}'),
	(323,'Home3 - Recommend Items','so_extra_slider','{\"action\":\"save_edit\",\"name\":\"Home3 - Recommend Items\",\"module_description\":{\"1\":{\"head_name\":\"Recommend Items\"},\"2\":{\"head_name\":\"Recommend Items\"}},\"head_name\":\"Recommend Items\",\"disp_title_module\":\"1\",\"status\":\"1\",\"type_layout\":\"2\",\"class_suffix\":\"home3_extra_style2 bn-shadow\",\"item_link_target\":\"_self\",\"button_page\":\"top\",\"products_style\":\"style1\",\"nb_column0\":\"1\",\"nb_column1\":\"1\",\"nb_column2\":\"1\",\"nb_column3\":\"2\",\"nb_column4\":\"1\",\"nb_row\":\"3\",\"type_data\":\"category\",\"product_feature\":\"\",\"category\":[\"72\",\"33\"],\"child_category\":\"1\",\"category_depth\":\"1\",\"product_sort\":\"p.price\",\"product_ordering\":\"ASC\",\"limitation\":\"6\",\"display_title\":\"1\",\"title_maxlength\":\"50\",\"display_description\":\"0\",\"description_maxlength\":\"100\",\"display_price\":\"1\",\"display_readmore_link\":\"0\",\"readmore_text\":\"Readmore\",\"display_add_to_cart\":\"1\",\"display_wishlist\":\"1\",\"display_compare\":\"1\",\"display_rating\":\"0\",\"display_sale\":\"1\",\"display_new\":\"1\",\"date_day\":\"7\",\"product_image_num\":\"1\",\"product_image\":\"1\",\"product_get_image_data\":\"1\",\"product_get_image_image\":\"1\",\"width\":\"250\",\"height\":\"250\",\"placeholder_path\":\"nophoto.png\",\"margin\":\"0\",\"slideBy\":\"1\",\"autoplay\":\"0\",\"autoplayTimeout\":\"5000\",\"autoplayHoverPause\":\"0\",\"autoplaySpeed\":\"1000\",\"startPosition\":\"0\",\"mouseDrag\":\"1\",\"touchDrag\":\"1\",\"effect\":\"none\",\"dots\":\"0\",\"dotsSpeed\":\"500\",\"loop\":\"0\",\"navs\":\"0\",\"navSpeed\":\"500\",\"duration\":\"800\",\"delay\":\"500\",\"pre_text\":\"\",\"post_text\":\"\",\"use_cache\":\"0\",\"cache_time\":\"3600\",\"moduleid\":\"323\"}'),
	(324,'Home3 - Feature Items','so_extra_slider','{\"action\":\"save_edit\",\"name\":\"Home3 - Feature Items\",\"module_description\":{\"1\":{\"head_name\":\"Feature Items\"},\"2\":{\"head_name\":\"Feature Items\"}},\"head_name\":\"Feature Items\",\"disp_title_module\":\"1\",\"status\":\"1\",\"type_layout\":\"2\",\"class_suffix\":\"home3_extra_style3\",\"item_link_target\":\"_self\",\"button_page\":\"top\",\"products_style\":\"style1\",\"nb_column0\":\"6\",\"nb_column1\":\"4\",\"nb_column2\":\"3\",\"nb_column3\":\"2\",\"nb_column4\":\"1\",\"nb_row\":\"2\",\"type_data\":\"category\",\"product_feature\":\"\",\"category\":[\"33\"],\"child_category\":\"1\",\"category_depth\":\"1\",\"product_sort\":\"p.price\",\"product_ordering\":\"ASC\",\"limitation\":\"12\",\"display_title\":\"1\",\"title_maxlength\":\"50\",\"display_description\":\"0\",\"description_maxlength\":\"100\",\"display_price\":\"1\",\"display_readmore_link\":\"0\",\"readmore_text\":\"Readmore\",\"display_add_to_cart\":\"1\",\"display_wishlist\":\"1\",\"display_compare\":\"1\",\"display_rating\":\"0\",\"display_sale\":\"1\",\"display_new\":\"1\",\"date_day\":\"227\",\"product_image_num\":\"1\",\"product_image\":\"1\",\"product_get_image_data\":\"1\",\"product_get_image_image\":\"1\",\"width\":\"270\",\"height\":\"270\",\"placeholder_path\":\"nophoto.png\",\"margin\":\"0\",\"slideBy\":\"1\",\"autoplay\":\"0\",\"autoplayTimeout\":\"5000\",\"autoplayHoverPause\":\"0\",\"autoplaySpeed\":\"1000\",\"startPosition\":\"0\",\"mouseDrag\":\"1\",\"touchDrag\":\"1\",\"effect\":\"none\",\"dots\":\"0\",\"dotsSpeed\":\"500\",\"loop\":\"0\",\"navs\":\"0\",\"navSpeed\":\"500\",\"duration\":\"800\",\"delay\":\"500\",\"pre_text\":\"\",\"post_text\":\"\",\"use_cache\":\"0\",\"cache_time\":\"3600\",\"moduleid\":\"324\"}'),
	(325,'Home 3 - Fashion &amp; Accessories','so_listing_tabs','{\"action\":\"save_edit\",\"name\":\"Home 3 - Fashion &amp; Accessories\",\"module_description\":{\"1\":{\"head_name\":\"Fashion &amp; Accessories\"},\"2\":{\"head_name\":\"Fashion &amp; Accessories\"}},\"head_name\":\"Fashion &amp; Accessories\",\"disp_title_module\":\"1\",\"status\":\"1\",\"type_layout\":\"2\",\"class_suffix\":\"home3_listingtab\",\"item_link_target\":\"_self\",\"nb_column0\":\"2\",\"nb_column1\":\"2\",\"nb_column2\":\"1\",\"nb_column3\":\"2\",\"nb_column4\":\"1\",\"type_show\":\"slider\",\"nb_row\":\"2\",\"type_source\":\"0\",\"category\":[\"64\",\"93\",\"61\",\"66\",\"92\",\"60\",\"62\",\"63\"],\"child_category\":\"1\",\"category_depth\":\"1\",\"product_sort\":\"p.price\",\"product_ordering\":\"ASC\",\"source_limit\":\"4\",\"catid_preload\":\"64\",\"field_product_tab\":\"\",\"tab_all_display\":\"0\",\"tab_max_characters\":\"25\",\"tab_icon_display\":\"1\",\"cat_order_by\":\"name\",\"imgcfgcat_width\":\"60\",\"imgcfgcat_height\":\"60\",\"display_title\":\"1\",\"title_maxlength\":\"50\",\"display_description\":\"0\",\"description_maxlength\":\"100\",\"display_price\":\"1\",\"display_add_to_cart\":\"1\",\"display_wishlist\":\"1\",\"display_compare\":\"1\",\"display_rating\":\"0\",\"display_sale\":\"1\",\"display_new\":\"1\",\"date_day\":\"7\",\"product_image_num\":\"1\",\"product_image\":\"1\",\"product_get_image_data\":\"1\",\"product_get_image_image\":\"1\",\"width\":\"270\",\"height\":\"270\",\"product_placeholder_path\":\"nophoto.png\",\"display_banner_image\":\"0\",\"banner_image\":\"no_image.png\",\"banner_width\":\"150\",\"banner_height\":\"250\",\"banner_image_url\":\"\",\"effect\":\"none\",\"margin\":\"0\",\"duration\":\"800\",\"delay\":\"500\",\"autoplay\":\"0\",\"display_nav\":\"1\",\"display_loop\":\"1\",\"touchdrag\":\"1\",\"mousedrag\":\"1\",\"pausehover\":\"0\",\"autoplayTimeout\":\"5000\",\"autoplaySpeed\":\"1000\",\"pre_text\":\"\",\"post_text\":\"\",\"use_cache\":\"0\",\"cache_time\":\"3600\",\"moduleid\":\"325\"}'),
	(326,'Home3 - Digital &amp; Electronic','so_listing_tabs','{\"action\":\"save_edit\",\"name\":\"Home3 - Digital &amp; Electronic\",\"module_description\":{\"1\":{\"head_name\":\"Digital &amp; Electronic\"},\"2\":{\"head_name\":\"Digital &amp; Electronic\"}},\"head_name\":\"Digital &amp; Electronic\",\"disp_title_module\":\"1\",\"status\":\"1\",\"type_layout\":\"3\",\"class_suffix\":\"home3_listingtab_style2\",\"item_link_target\":\"_self\",\"nb_column0\":\"4\",\"nb_column1\":\"3\",\"nb_column2\":\"2\",\"nb_column3\":\"2\",\"nb_column4\":\"1\",\"type_show\":\"slider\",\"nb_row\":\"2\",\"type_source\":\"0\",\"category\":[\"90\",\"91\",\"94\",\"76\",\"95\",\"96\",\"87\",\"86\"],\"child_category\":\"1\",\"category_depth\":\"1\",\"product_sort\":\"p.price\",\"product_ordering\":\"ASC\",\"source_limit\":\"10\",\"catid_preload\":\"90\",\"field_product_tab\":\"\",\"tab_all_display\":\"0\",\"tab_max_characters\":\"25\",\"tab_icon_display\":\"1\",\"cat_order_by\":\"name\",\"imgcfgcat_width\":\"60\",\"imgcfgcat_height\":\"60\",\"display_title\":\"1\",\"title_maxlength\":\"50\",\"display_description\":\"0\",\"description_maxlength\":\"100\",\"display_price\":\"1\",\"display_add_to_cart\":\"1\",\"display_wishlist\":\"1\",\"display_compare\":\"1\",\"display_rating\":\"0\",\"display_sale\":\"1\",\"display_new\":\"1\",\"date_day\":\"7\",\"product_image_num\":\"1\",\"product_image\":\"1\",\"product_get_image_data\":\"1\",\"product_get_image_image\":\"1\",\"width\":\"270\",\"height\":\"270\",\"product_placeholder_path\":\"nophoto.png\",\"display_banner_image\":\"0\",\"banner_image\":\"no_image.png\",\"banner_width\":\"150\",\"banner_height\":\"250\",\"banner_image_url\":\"\",\"effect\":\"none\",\"margin\":\"0\",\"duration\":\"800\",\"delay\":\"500\",\"autoplay\":\"0\",\"display_nav\":\"1\",\"display_loop\":\"1\",\"touchdrag\":\"1\",\"mousedrag\":\"1\",\"pausehover\":\"0\",\"autoplayTimeout\":\"5000\",\"autoplaySpeed\":\"1000\",\"pre_text\":\"\",\"post_text\":\"\",\"use_cache\":\"0\",\"cache_time\":\"3600\",\"moduleid\":\"326\"}'),
	(322,'Home3 - Special Items','so_extra_slider','{\"action\":\"save_edit\",\"name\":\"Home3 - Special Items\",\"module_description\":{\"1\":{\"head_name\":\"Special Items\"},\"2\":{\"head_name\":\"Special Items\"}},\"head_name\":\"Special Items\",\"disp_title_module\":\"1\",\"status\":\"1\",\"type_layout\":\"2\",\"class_suffix\":\"home3_extra bn-shadow\",\"item_link_target\":\"_self\",\"button_page\":\"top\",\"products_style\":\"style1\",\"nb_column0\":\"1\",\"nb_column1\":\"1\",\"nb_column2\":\"1\",\"nb_column3\":\"1\",\"nb_column4\":\"1\",\"nb_row\":\"5\",\"type_data\":\"category\",\"product_feature\":\"\",\"category\":[\"17\"],\"child_category\":\"1\",\"category_depth\":\"1\",\"product_sort\":\"p.price\",\"product_ordering\":\"ASC\",\"limitation\":\"5\",\"display_title\":\"1\",\"title_maxlength\":\"50\",\"display_description\":\"0\",\"description_maxlength\":\"100\",\"display_price\":\"1\",\"display_readmore_link\":\"0\",\"readmore_text\":\"Readmore\",\"display_add_to_cart\":\"0\",\"display_wishlist\":\"0\",\"display_compare\":\"0\",\"display_rating\":\"0\",\"display_sale\":\"0\",\"display_new\":\"0\",\"date_day\":\"7\",\"product_image_num\":\"1\",\"product_image\":\"1\",\"product_get_image_data\":\"1\",\"product_get_image_image\":\"1\",\"width\":\"60\",\"height\":\"60\",\"placeholder_path\":\"nophoto.png\",\"margin\":\"0\",\"slideBy\":\"1\",\"autoplay\":\"0\",\"autoplayTimeout\":\"5000\",\"autoplayHoverPause\":\"0\",\"autoplaySpeed\":\"1000\",\"startPosition\":\"0\",\"mouseDrag\":\"1\",\"touchDrag\":\"1\",\"effect\":\"none\",\"dots\":\"0\",\"dotsSpeed\":\"500\",\"loop\":\"0\",\"navs\":\"0\",\"navSpeed\":\"500\",\"duration\":\"800\",\"delay\":\"500\",\"pre_text\":\"\",\"post_text\":\"\",\"use_cache\":\"0\",\"cache_time\":\"3600\",\"moduleid\":\"322\"}'),
	(327,'Home3 - Hot Deal','so_deals','{\"action\":\"save_edit\",\"name\":\"Home3 - Hot Deal\",\"module_description\":{\"1\":{\"head_name\":\"Hot Deal\"},\"2\":{\"head_name\":\"Hot Deal\"}},\"head_name\":\"Hot Deal\",\"disp_title_module\":\"1\",\"status\":\"1\",\"class_suffix\":\"home3_deal_style2\",\"item_link_target\":\"_self\",\"include_js\":\"owlCarousel\",\"nb_column0\":\"4\",\"nb_column1\":\"3\",\"nb_column2\":\"2\",\"nb_column3\":\"2\",\"nb_column4\":\"1\",\"nb_row\":\"1\",\"display_feature\":\"0\",\"product_feature\":\"\",\"position_thumbnail\":\"vertical\",\"category\":[\"33\"],\"child_category\":\"1\",\"category_depth\":\"1\",\"product_sort\":\"p.price\",\"product_ordering\":\"ASC\",\"source_limit\":\"6\",\"display_title\":\"1\",\"title_maxlength\":\"50\",\"display_description\":\"0\",\"description_maxlength\":\"100\",\"display_countdown\":\"1\",\"display_price\":\"1\",\"display_addtocart\":\"1\",\"display_wishlist\":\"1\",\"display_compare\":\"1\",\"display_rating\":\"0\",\"display_sale\":\"1\",\"display_new\":\"1\",\"date_day\":\"7\",\"product_image_num\":\"1\",\"product_image\":\"1\",\"product_get_image_data\":\"1\",\"product_get_image_image\":\"1\",\"width\":\"270\",\"height\":\"270\",\"placeholder_path\":\"nophoto.png\",\"margin\":\"1\",\"slideBy\":\"1\",\"autoplay\":\"0\",\"autoplayTimeout\":\"5000\",\"autoplayHoverPause\":\"0\",\"autoplaySpeed\":\"1000\",\"startPosition\":\"0\",\"mouseDrag\":\"1\",\"touchDrag\":\"1\",\"loop\":\"1\",\"button_page\":\"top\",\"dots\":\"0\",\"dotsSpeed\":\"500\",\"navs\":\"0\",\"navSpeed\":\"500\",\"effect\":\"none\",\"duration\":\"800\",\"delay\":\"500\",\"store_layout\":\"default4\",\"pre_text\":\"\",\"post_text\":\"\",\"use_cache\":\"0\",\"cache_time\":\"3600\",\"moduleid\":\"327\"}'),
	(328,'Home3 - Flash Deal ','so_deals','{\"action\":\"save_edit\",\"name\":\"Home3 - Flash Deal \",\"module_description\":{\"1\":{\"head_name\":\"Flash Deal \"},\"2\":{\"head_name\":\"Flash Deal \"}},\"head_name\":\"Flash Deal \",\"disp_title_module\":\"0\",\"status\":\"1\",\"class_suffix\":\"home3_deal\",\"item_link_target\":\"_self\",\"include_js\":\"owlCarousel\",\"nb_column0\":\"1\",\"nb_column1\":\"1\",\"nb_column2\":\"1\",\"nb_column3\":\"1\",\"nb_column4\":\"1\",\"nb_row\":\"1\",\"display_feature\":\"0\",\"product_feature\":\"\",\"position_thumbnail\":\"vertical\",\"category\":[\"33\"],\"child_category\":\"1\",\"category_depth\":\"1\",\"product_sort\":\"p.price\",\"product_ordering\":\"ASC\",\"source_limit\":\"3\",\"display_title\":\"1\",\"title_maxlength\":\"50\",\"display_description\":\"0\",\"description_maxlength\":\"100\",\"display_countdown\":\"1\",\"display_price\":\"1\",\"display_addtocart\":\"1\",\"display_wishlist\":\"1\",\"display_compare\":\"1\",\"display_rating\":\"0\",\"display_sale\":\"1\",\"display_new\":\"1\",\"date_day\":\"227\",\"product_image_num\":\"1\",\"product_image\":\"1\",\"product_get_image_data\":\"1\",\"product_get_image_image\":\"1\",\"width\":\"270\",\"height\":\"270\",\"placeholder_path\":\"nophoto.png\",\"margin\":\"1\",\"slideBy\":\"1\",\"autoplay\":\"0\",\"autoplayTimeout\":\"5000\",\"autoplayHoverPause\":\"0\",\"autoplaySpeed\":\"1000\",\"startPosition\":\"0\",\"mouseDrag\":\"1\",\"touchDrag\":\"1\",\"loop\":\"1\",\"button_page\":\"top\",\"dots\":\"0\",\"dotsSpeed\":\"500\",\"navs\":\"0\",\"navSpeed\":\"500\",\"effect\":\"none\",\"duration\":\"800\",\"delay\":\"500\",\"store_layout\":\"default2\",\"pre_text\":\"\",\"post_text\":\"\",\"use_cache\":\"0\",\"cache_time\":\"3600\",\"moduleid\":\"328\"}'),
	(329,'So Product Label','so_product_label','{\"name\":\"So Product Label\"}'),
	(24,'Mobile Page Builder - Home 1','so_page_builder','{\"page_builder\":\"[{\\\"text_class_id\\\":\\\"row_v2u7\\\",\\\"text_class\\\":\\\"row-style\\\",\\\"text_color\\\":\\\"#000000\\\",\\\"link_color\\\":\\\"#000000\\\",\\\"link_hover_color\\\":\\\"#000000\\\",\\\"heading_color\\\":\\\"#000000\\\",\\\"background_type\\\":0,\\\"bg_color\\\":\\\"#FFFFFF\\\",\\\"bg_opacity\\\":\\\"100%\\\",\\\"bg_image\\\":\\\"\\\",\\\"bg_repeat\\\":\\\"no-repeat\\\",\\\"bg_position\\\":\\\"center center\\\",\\\"bg_attachment\\\":\\\"fixed\\\",\\\"bg_scale\\\":\\\"cover\\\",\\\"video_type\\\":0,\\\"link_video\\\":\\\"YE7VzlLtp-4\\\",\\\"margin\\\":\\\"\\\",\\\"padding\\\":\\\"\\\",\\\"row_container_fluid\\\":0,\\\"row_section\\\":0,\\\"row_section_class\\\":\\\"section-style\\\",\\\"row_section_id\\\":\\\"\\\",\\\"section_background_type\\\":0,\\\"section_bg_color\\\":\\\"#FFFFFF\\\",\\\"section_bg_opacity\\\":\\\"100%\\\",\\\"section_bg_image\\\":\\\"\\\",\\\"section_bg_repeat\\\":\\\"no-repeat\\\",\\\"section_bg_position\\\":\\\"center center\\\",\\\"section_bg_attachment\\\":\\\"fixed\\\",\\\"section_bg_scale\\\":\\\"cover\\\",\\\"section_video_type\\\":0,\\\"section_link_video\\\":\\\"YE7VzlLtp-4\\\",\\\"cols\\\":[{\\\"text_class_id\\\":\\\"col_oqrd\\\",\\\"text_class\\\":\\\"menu_custom\\\",\\\"text_color\\\":\\\"#000000\\\",\\\"link_color\\\":\\\"#000000\\\",\\\"link_hover_color\\\":\\\"#000000\\\",\\\"heading_color\\\":\\\"#000000\\\",\\\"background_type\\\":\\\"0\\\",\\\"bg_color\\\":\\\"#FFFFFF\\\",\\\"bg_opacity\\\":\\\"100%\\\",\\\"bg_image\\\":\\\"\\\",\\\"bg_repeat\\\":\\\"no-repeat\\\",\\\"bg_position\\\":\\\"center center\\\",\\\"bg_attachment\\\":\\\"fixed\\\",\\\"bg_scale\\\":\\\"cover\\\",\\\"col_video_type\\\":\\\"0\\\",\\\"col_link_video\\\":\\\"YE7VzlLtp-4\\\",\\\"padding\\\":\\\"\\\",\\\"margin\\\":\\\"\\\",\\\"lg_col\\\":\\\"12\\\",\\\"md_col\\\":\\\"12\\\",\\\"sm_col\\\":\\\"12\\\",\\\"xs_col\\\":\\\"12\\\",\\\"widgets\\\":[{\\\"name\\\":\\\"Html\\\",\\\"module\\\":\\\"html_8ng0\\\",\\\"type\\\":\\\"shortcode\\\",\\\"shortcode\\\":\\\"html\\\",\\\"content\\\":\\\"{\\\\\\\"cparent\\\\\\\":[{\\\\\\\"name_shortcode_1\\\\\\\":\\\\\\\"Custom_Menu\\\\\\\",\\\\\\\"name_shortcode_2\\\\\\\":\\\\\\\"Custom_Menu\\\\\\\",\\\\\\\"name_shortcode_status\\\\\\\":\\\\\\\"no\\\\\\\",\\\\\\\"content_1\\\\\\\":\\\\\\\"<div class=\\\\\\\\\\\\\\\"module\\\\\\\\\\\\\\\">\\\\\\\\n<div class=\\\\\\\\\\\\\\\"menu-link contentslider\\\\\\\\\\\\\\\" data-rtl=\\\\\\\\\\\\\\\"no\\\\\\\\\\\\\\\" data-autoplay=\\\\\\\\\\\\\\\"yes\\\\\\\\\\\\\\\" data-autowidth=\\\\\\\\\\\\\\\"yes\\\\\\\\\\\\\\\" data-delay=\\\\\\\\\\\\\\\"4\\\\\\\\\\\\\\\" data-speed=\\\\\\\\\\\\\\\"0.6\\\\\\\\\\\\\\\" data-margin=\\\\\\\\\\\\\\\"10\\\\\\\\\\\\\\\" data-items_column1=\\\\\\\\\\\\\\\"1\\\\\\\\\\\\\\\" data-items_column2=\\\\\\\\\\\\\\\"1\\\\\\\\\\\\\\\" data-items_column3=\\\\\\\\\\\\\\\"2\\\\\\\\\\\\\\\" data-items_column4=\\\\\\\\\\\\\\\"2\\\\\\\\\\\\\\\" data-arrows=\\\\\\\\\\\\\\\"no\\\\\\\\\\\\\\\" data-pagination=\\\\\\\\\\\\\\\"no\\\\\\\\\\\\\\\" data-lazyload=\\\\\\\\\\\\\\\"no\\\\\\\\\\\\\\\" \\\\\\\\\\\\\\\"=\\\\\\\\\\\\\\\"\\\\\\\\\\\\\\\" data-loop=\\\\\\\\\\\\\\\"yes\\\\\\\\\\\\\\\" data-hoverpause=\\\\\\\\\\\\\\\"yes\\\\\\\\\\\\\\\">\\\\\\\\n\\\\\\\\t<div class=\\\\\\\\\\\\\\\"item-link\\\\\\\\\\\\\\\"><a href=\\\\\\\\\\\\\\\"index.php?route=mobile\\/home\\\\\\\\\\\\\\\"><span class=\\\\\\\\\\\\\\\"menu-title\\\\\\\\\\\\\\\">New Arrivals<\\/span><\\/a><\\/div>\\\\\\\\n\\\\\\\\t<div class=\\\\\\\\\\\\\\\"item-link\\\\\\\\\\\\\\\"><a href=\\\\\\\\\\\\\\\"index.php?route=mobile\\/home\\\\\\\\\\\\\\\"><span class=\\\\\\\\\\\\\\\"menu-title\\\\\\\\\\\\\\\">Best Sellers<\\/span><\\/a><\\/div>\\\\\\\\n\\\\\\\\t<div class=\\\\\\\\\\\\\\\"item-link\\\\\\\\\\\\\\\"><a href=\\\\\\\\\\\\\\\"index.php?route=mobile\\/home\\\\\\\\\\\\\\\"><span class=\\\\\\\\\\\\\\\"menu-title\\\\\\\\\\\\\\\">Top Deals<\\/span><\\/a><\\/div>\\\\\\\\n\\\\\\\\t<div class=\\\\\\\\\\\\\\\"item-link\\\\\\\\\\\\\\\"><a href=\\\\\\\\\\\\\\\"index.php?route=simple_blog\\/category&simple_blog_category_id=5\\\\\\\\\\\\\\\"><span class=\\\\\\\\\\\\\\\"menu-title\\\\\\\\\\\\\\\">Blog<\\/span><\\/a><\\/div>\\\\\\\\n\\\\\\\\t<div class=\\\\\\\\\\\\\\\"item-link\\\\\\\\\\\\\\\"><a href=\\\\\\\\\\\\\\\"index.php?route=information\\/information&information_id=4\\\\\\\\\\\\\\\"><span class=\\\\\\\\\\\\\\\"menu-title\\\\\\\\\\\\\\\">About Us<\\/span><\\/a><\\/div>\\\\\\\\n\\\\\\\\t<div class=\\\\\\\\\\\\\\\"item-link\\\\\\\\\\\\\\\"><a href=\\\\\\\\\\\\\\\"index.php?route=information\\/contact\\\\\\\\\\\\\\\"><span class=\\\\\\\\\\\\\\\"menu-title\\\\\\\\\\\\\\\">Contact Us<\\/span><\\/a><\\/div>\\\\\\\\n<\\/div>\\\\\\\\t\\\\\\\\n<\\/div>\\\\\\\",\\\\\\\"content_2\\\\\\\":\\\\\\\"<div class=\\\\\\\\\\\\\\\"module\\\\\\\\\\\\\\\">\\\\\\\\n<div class=\\\\\\\\\\\\\\\"menu-link contentslider\\\\\\\\\\\\\\\" data-rtl=\\\\\\\\\\\\\\\"yes\\\\\\\\\\\\\\\" data-autoplay=\\\\\\\\\\\\\\\"no\\\\\\\\\\\\\\\" data-autowidth=\\\\\\\\\\\\\\\"yes\\\\\\\\\\\\\\\" data-delay=\\\\\\\\\\\\\\\"4\\\\\\\\\\\\\\\" data-speed=\\\\\\\\\\\\\\\"0.6\\\\\\\\\\\\\\\" data-margin=\\\\\\\\\\\\\\\"10\\\\\\\\\\\\\\\" data-items_column1=\\\\\\\\\\\\\\\"1\\\\\\\\\\\\\\\" data-items_column2=\\\\\\\\\\\\\\\"1\\\\\\\\\\\\\\\" data-items_column3=\\\\\\\\\\\\\\\"2\\\\\\\\\\\\\\\" data-items_column4=\\\\\\\\\\\\\\\"2\\\\\\\\\\\\\\\" data-arrows=\\\\\\\\\\\\\\\"no\\\\\\\\\\\\\\\" data-pagination=\\\\\\\\\\\\\\\"no\\\\\\\\\\\\\\\" data-lazyload=\\\\\\\\\\\\\\\"no\\\\\\\\\\\\\\\" \\\\\\\\\\\\\\\"=\\\\\\\\\\\\\\\"\\\\\\\\\\\\\\\" data-loop=\\\\\\\\\\\\\\\"yes\\\\\\\\\\\\\\\" data-hoverpause=\\\\\\\\\\\\\\\"yes\\\\\\\\\\\\\\\">\\\\\\\\n\\\\\\\\t<div class=\\\\\\\\\\\\\\\"item-link\\\\\\\\\\\\\\\"><a href=\\\\\\\\\\\\\\\"index.php?route=mobile\\/home\\\\\\\\\\\\\\\"><span class=\\\\\\\\\\\\\\\"menu-title\\\\\\\\\\\\\\\">New Arrivals<\\/span><\\/a><\\/div>\\\\\\\\n\\\\\\\\t<div class=\\\\\\\\\\\\\\\"item-link\\\\\\\\\\\\\\\"><a href=\\\\\\\\\\\\\\\"index.php?route=mobile\\/home\\\\\\\\\\\\\\\"><span class=\\\\\\\\\\\\\\\"menu-title\\\\\\\\\\\\\\\">Best Sellers<\\/span><\\/a><\\/div>\\\\\\\\n\\\\\\\\t<div class=\\\\\\\\\\\\\\\"item-link\\\\\\\\\\\\\\\"><a href=\\\\\\\\\\\\\\\"index.php?route=mobile\\/home\\\\\\\\\\\\\\\"><span class=\\\\\\\\\\\\\\\"menu-title\\\\\\\\\\\\\\\">Top Deals<\\/span><\\/a><\\/div>\\\\\\\\n\\\\\\\\t<div class=\\\\\\\\\\\\\\\"item-link\\\\\\\\\\\\\\\"><a href=\\\\\\\\\\\\\\\"index.php?route=simple_blog\\/category&simple_blog_category_id=5\\\\\\\\\\\\\\\"><span class=\\\\\\\\\\\\\\\"menu-title\\\\\\\\\\\\\\\">Blog<\\/span><\\/a><\\/div>\\\\\\\\n\\\\\\\\t<div class=\\\\\\\\\\\\\\\"item-link\\\\\\\\\\\\\\\"><a href=\\\\\\\\\\\\\\\"index.php?route=information\\/information&information_id=4\\\\\\\\\\\\\\\"><span class=\\\\\\\\\\\\\\\"menu-title\\\\\\\\\\\\\\\">About Us<\\/span><\\/a><\\/div>\\\\\\\\n\\\\\\\\t<div class=\\\\\\\\\\\\\\\"item-link\\\\\\\\\\\\\\\"><a href=\\\\\\\\\\\\\\\"index.php?route=information\\/contact\\\\\\\\\\\\\\\"><span class=\\\\\\\\\\\\\\\"menu-title\\\\\\\\\\\\\\\">Contact Us<\\/span><\\/a><\\/div>\\\\\\\\n<\\/div>\\\\\\\\t\\\\\\\\n<\\/div>\\\\\\\",\\\\\\\"yt_class\\\\\\\":\\\\\\\"\\\\\\\",\\\\\\\"css_internal\\\\\\\":\\\\\\\"\\\\\\\"}],\\\\\\\"cchild\\\\\\\":{}}\\\"}],\\\"rows\\\":[]},{\\\"text_class_id\\\":\\\"col_9pr0\\\",\\\"text_class\\\":\\\"no-padding\\\",\\\"text_color\\\":\\\"#000000\\\",\\\"link_color\\\":\\\"#000000\\\",\\\"link_hover_color\\\":\\\"#000000\\\",\\\"heading_color\\\":\\\"#000000\\\",\\\"background_type\\\":\\\"0\\\",\\\"bg_color\\\":\\\"#FFFFFF\\\",\\\"bg_opacity\\\":\\\"100%\\\",\\\"bg_image\\\":\\\"\\\",\\\"bg_repeat\\\":\\\"no-repeat\\\",\\\"bg_position\\\":\\\"center center\\\",\\\"bg_attachment\\\":\\\"fixed\\\",\\\"bg_scale\\\":\\\"cover\\\",\\\"col_video_type\\\":\\\"0\\\",\\\"col_link_video\\\":\\\"YE7VzlLtp-4\\\",\\\"padding\\\":\\\"\\\",\\\"margin\\\":\\\"\\\",\\\"lg_col\\\":\\\"12\\\",\\\"md_col\\\":\\\"12\\\",\\\"sm_col\\\":\\\"12\\\",\\\"xs_col\\\":\\\"12\\\",\\\"widgets\\\":[{\\\"name\\\":\\\"Mobile - Slide - Home 1\\\",\\\"module\\\":\\\"so_home_slider.12\\\",\\\"type\\\":\\\"module\\\"}],\\\"rows\\\":[]},{\\\"text_class_id\\\":\\\"col_63tw\\\",\\\"text_class\\\":\\\"no-padding\\\",\\\"text_color\\\":\\\"#000000\\\",\\\"link_color\\\":\\\"#000000\\\",\\\"link_hover_color\\\":\\\"#000000\\\",\\\"heading_color\\\":\\\"#000000\\\",\\\"background_type\\\":\\\"0\\\",\\\"bg_color\\\":\\\"#FFFFFF\\\",\\\"bg_opacity\\\":\\\"100%\\\",\\\"bg_image\\\":\\\"\\\",\\\"bg_repeat\\\":\\\"no-repeat\\\",\\\"bg_position\\\":\\\"center center\\\",\\\"bg_attachment\\\":\\\"fixed\\\",\\\"bg_scale\\\":\\\"cover\\\",\\\"col_video_type\\\":\\\"0\\\",\\\"col_link_video\\\":\\\"YE7VzlLtp-4\\\",\\\"padding\\\":\\\"\\\",\\\"margin\\\":\\\"\\\",\\\"lg_col\\\":\\\"12\\\",\\\"md_col\\\":\\\"12\\\",\\\"sm_col\\\":\\\"12\\\",\\\"xs_col\\\":\\\"12\\\",\\\"widgets\\\":[{\\\"name\\\":\\\"Html\\\",\\\"module\\\":\\\"html_rhau\\\",\\\"type\\\":\\\"shortcode\\\",\\\"shortcode\\\":\\\"html\\\",\\\"content\\\":\\\"{\\\\\\\"cparent\\\\\\\":[{\\\\\\\"name_shortcode_1\\\\\\\":\\\\\\\"Mobile_Banner1_Home1\\\\\\\",\\\\\\\"name_shortcode_2\\\\\\\":\\\\\\\"Mobile_Banner1_Home1\\\\\\\",\\\\\\\"name_shortcode_status\\\\\\\":\\\\\\\"no\\\\\\\",\\\\\\\"content_1\\\\\\\":\\\\\\\"<div class=\\\\\\\\\\\\\\\"mobile-bn1-h1 clearfix\\\\\\\\\\\\\\\">\\\\\\\\n\\\\\\\\t<div class=\\\\\\\\\\\\\\\"banners\\\\\\\\\\\\\\\">\\\\\\\\n\\\\\\\\t\\\\\\\\t<div class=\\\\\\\\\\\\\\\"banner21\\\\\\\\\\\\\\\">\\\\\\\\n\\\\\\\\t\\\\\\\\t\\\\\\\\t<a href=\\\\\\\\\\\\\\\"index.php?route=mobile\\/home\\\\\\\\\\\\\\\">\\\\\\\\n\\\\\\\\t\\\\\\\\t\\\\\\\\t\\\\\\\\t<img src=\\\\\\\\\\\\\\\"image\\/catalog\\/demo-mobile\\/banner\\/banner-mobile-2.png\\\\\\\\\\\\\\\" alt=\\\\\\\\\\\\\\\"Image Client\\\\\\\\\\\\\\\">\\\\\\\\n\\\\\\\\t\\\\\\\\t\\\\\\\\t<\\/a>\\\\\\\\n\\\\\\\\t\\\\\\\\t<\\/div>\\\\\\\\n\\\\\\\\t\\\\\\\\t<div class=\\\\\\\\\\\\\\\"banner21\\\\\\\\\\\\\\\">\\\\\\\\n\\\\\\\\t\\\\\\\\t\\\\\\\\t<a href=\\\\\\\\\\\\\\\"index.php?route=mobile\\/home\\\\\\\\\\\\\\\">\\\\\\\\n\\\\\\\\t\\\\\\\\t\\\\\\\\t\\\\\\\\t<img src=\\\\\\\\\\\\\\\"image\\/catalog\\/demo-mobile\\/banner\\/banner-mobile-3.png\\\\\\\\\\\\\\\" alt=\\\\\\\\\\\\\\\"Image Client\\\\\\\\\\\\\\\">\\\\\\\\n\\\\\\\\t\\\\\\\\t\\\\\\\\t<\\/a>\\\\\\\\n\\\\\\\\t\\\\\\\\t<\\/div>\\\\\\\\n\\\\\\\\t<\\/div>\\\\\\\\n<\\/div>\\\\\\\",\\\\\\\"content_2\\\\\\\":\\\\\\\"<div class=\\\\\\\\\\\\\\\"mobile-bn1-h1 clearfix\\\\\\\\\\\\\\\">\\\\\\\\n\\\\\\\\t<div class=\\\\\\\\\\\\\\\"banners\\\\\\\\\\\\\\\">\\\\\\\\n\\\\\\\\t\\\\\\\\t<div class=\\\\\\\\\\\\\\\"banner21\\\\\\\\\\\\\\\">\\\\\\\\n\\\\\\\\t\\\\\\\\t\\\\\\\\t<a href=\\\\\\\\\\\\\\\"index.php?route=mobile\\/home\\\\\\\\\\\\\\\">\\\\\\\\n\\\\\\\\t\\\\\\\\t\\\\\\\\t\\\\\\\\t<img src=\\\\\\\\\\\\\\\"image\\/catalog\\/demo-mobile\\/banner\\/banner-mobile-2.png\\\\\\\\\\\\\\\" alt=\\\\\\\\\\\\\\\"Image Client\\\\\\\\\\\\\\\">\\\\\\\\n\\\\\\\\t\\\\\\\\t\\\\\\\\t<\\/a>\\\\\\\\n\\\\\\\\t\\\\\\\\t<\\/div>\\\\\\\\n\\\\\\\\t\\\\\\\\t<div class=\\\\\\\\\\\\\\\"banner21\\\\\\\\\\\\\\\">\\\\\\\\n\\\\\\\\t\\\\\\\\t\\\\\\\\t<a href=\\\\\\\\\\\\\\\"index.php?route=mobile\\/home\\\\\\\\\\\\\\\">\\\\\\\\n\\\\\\\\t\\\\\\\\t\\\\\\\\t\\\\\\\\t<img src=\\\\\\\\\\\\\\\"image\\/catalog\\/demo-mobile\\/banner\\/banner-mobile-3.png\\\\\\\\\\\\\\\" alt=\\\\\\\\\\\\\\\"Image Client\\\\\\\\\\\\\\\">\\\\\\\\n\\\\\\\\t\\\\\\\\t\\\\\\\\t<\\/a>\\\\\\\\n\\\\\\\\t\\\\\\\\t<\\/div>\\\\\\\\n\\\\\\\\t<\\/div>\\\\\\\\n<\\/div>\\\\\\\",\\\\\\\"yt_class\\\\\\\":\\\\\\\"\\\\\\\",\\\\\\\"css_internal\\\\\\\":\\\\\\\"\\\\\\\"}],\\\\\\\"cchild\\\\\\\":{}}\\\"}],\\\"rows\\\":[]},{\\\"text_class_id\\\":\\\"col_ukoq\\\",\\\"text_class\\\":\\\"col-style\\\",\\\"text_color\\\":\\\"#000000\\\",\\\"link_color\\\":\\\"#000000\\\",\\\"link_hover_color\\\":\\\"#000000\\\",\\\"heading_color\\\":\\\"#000000\\\",\\\"background_type\\\":0,\\\"bg_color\\\":\\\"#FFFFFF\\\",\\\"bg_opacity\\\":\\\"100%\\\",\\\"bg_image\\\":\\\"\\\",\\\"bg_repeat\\\":\\\"no-repeat\\\",\\\"bg_position\\\":\\\"center center\\\",\\\"bg_attachment\\\":\\\"fixed\\\",\\\"bg_scale\\\":\\\"cover\\\",\\\"col_video_type\\\":0,\\\"col_link_video\\\":\\\"YE7VzlLtp-4\\\",\\\"padding\\\":\\\"\\\",\\\"margin\\\":\\\"\\\",\\\"lg_col\\\":12,\\\"md_col\\\":\\\"4\\\",\\\"sm_col\\\":\\\"6\\\",\\\"xs_col\\\":\\\"12\\\",\\\"widgets\\\":[{\\\"name\\\":\\\"Home 1 - Featured Categories\\\",\\\"module\\\":\\\"so_html_content.22\\\",\\\"type\\\":\\\"module\\\"}],\\\"rows\\\":[]},{\\\"text_class_id\\\":\\\"col_07aq\\\",\\\"text_class\\\":\\\"col-style\\\",\\\"text_color\\\":\\\"#000000\\\",\\\"link_color\\\":\\\"#000000\\\",\\\"link_hover_color\\\":\\\"#000000\\\",\\\"heading_color\\\":\\\"#000000\\\",\\\"background_type\\\":0,\\\"bg_color\\\":\\\"#FFFFFF\\\",\\\"bg_opacity\\\":\\\"100%\\\",\\\"bg_image\\\":\\\"\\\",\\\"bg_repeat\\\":\\\"no-repeat\\\",\\\"bg_position\\\":\\\"center center\\\",\\\"bg_attachment\\\":\\\"fixed\\\",\\\"bg_scale\\\":\\\"cover\\\",\\\"col_video_type\\\":0,\\\"col_link_video\\\":\\\"YE7VzlLtp-4\\\",\\\"padding\\\":\\\"\\\",\\\"margin\\\":\\\"\\\",\\\"lg_col\\\":12,\\\"md_col\\\":\\\"4\\\",\\\"sm_col\\\":\\\"6\\\",\\\"xs_col\\\":\\\"12\\\",\\\"widgets\\\":[{\\\"name\\\":\\\"Mobile - Top Deals\\\",\\\"module\\\":\\\"so_deals.14\\\",\\\"type\\\":\\\"module\\\"}],\\\"rows\\\":[]},{\\\"text_class_id\\\":\\\"col_5fku\\\",\\\"text_class\\\":\\\"\\\",\\\"text_color\\\":\\\"#000000\\\",\\\"link_color\\\":\\\"#000000\\\",\\\"link_hover_color\\\":\\\"#000000\\\",\\\"heading_color\\\":\\\"#000000\\\",\\\"background_type\\\":\\\"0\\\",\\\"bg_color\\\":\\\"#FFFFFF\\\",\\\"bg_opacity\\\":\\\"100%\\\",\\\"bg_image\\\":\\\"\\\",\\\"bg_repeat\\\":\\\"no-repeat\\\",\\\"bg_position\\\":\\\"center center\\\",\\\"bg_attachment\\\":\\\"fixed\\\",\\\"bg_scale\\\":\\\"cover\\\",\\\"col_video_type\\\":\\\"0\\\",\\\"col_link_video\\\":\\\"YE7VzlLtp-4\\\",\\\"padding\\\":\\\"\\\",\\\"margin\\\":\\\"\\\",\\\"lg_col\\\":\\\"12\\\",\\\"md_col\\\":\\\"12\\\",\\\"sm_col\\\":\\\"12\\\",\\\"xs_col\\\":\\\"12\\\",\\\"widgets\\\":[{\\\"name\\\":\\\"Html\\\",\\\"module\\\":\\\"html_zai2\\\",\\\"type\\\":\\\"shortcode\\\",\\\"shortcode\\\":\\\"html\\\",\\\"content\\\":\\\"{\\\\\\\"cparent\\\\\\\":[{\\\\\\\"name_shortcode_1\\\\\\\":\\\\\\\"Mobile_Banner2_Home1\\\\\\\",\\\\\\\"name_shortcode_2\\\\\\\":\\\\\\\"Mobile_Banner2_Home1\\\\\\\",\\\\\\\"name_shortcode_status\\\\\\\":\\\\\\\"no\\\\\\\",\\\\\\\"content_1\\\\\\\":\\\\\\\"<div class=\\\\\\\\\\\\\\\"mobile-bn2-h1 clearfix\\\\\\\\\\\\\\\">\\\\\\\\n\\\\\\\\t<div class=\\\\\\\\\\\\\\\"banners\\\\\\\\\\\\\\\">\\\\\\\\n\\\\\\\\t\\\\\\\\t<div class=\\\\\\\\\\\\\\\"banner21\\\\\\\\\\\\\\\">\\\\\\\\n\\\\\\\\t\\\\\\\\t\\\\\\\\t<a href=\\\\\\\\\\\\\\\"index.php?route=mobile\\/home\\\\\\\\\\\\\\\">\\\\\\\\n\\\\\\\\t\\\\\\\\t\\\\\\\\t\\\\\\\\t<img src=\\\\\\\\\\\\\\\"image\\/catalog\\/demo-mobile\\/banner\\/banner-mobile-4.png\\\\\\\\\\\\\\\" alt=\\\\\\\\\\\\\\\"Image Client\\\\\\\\\\\\\\\">\\\\\\\\n\\\\\\\\t\\\\\\\\t\\\\\\\\t<\\/a>\\\\\\\\n\\\\\\\\t\\\\\\\\t<\\/div>\\\\\\\\n\\\\\\\\t\\\\\\\\t\\\\\\\\n\\\\\\\\t<\\/div>\\\\\\\\n<\\/div>\\\\\\\",\\\\\\\"content_2\\\\\\\":\\\\\\\"<div class=\\\\\\\\\\\\\\\"mobile-bn2-h1 clearfix\\\\\\\\\\\\\\\">\\\\\\\\n\\\\\\\\t<div class=\\\\\\\\\\\\\\\"banners\\\\\\\\\\\\\\\">\\\\\\\\n\\\\\\\\t\\\\\\\\t<div class=\\\\\\\\\\\\\\\"banner21\\\\\\\\\\\\\\\">\\\\\\\\n\\\\\\\\t\\\\\\\\t\\\\\\\\t<a href=\\\\\\\\\\\\\\\"index.php?route=mobile\\/home\\\\\\\\\\\\\\\">\\\\\\\\n\\\\\\\\t\\\\\\\\t\\\\\\\\t\\\\\\\\t<img src=\\\\\\\\\\\\\\\"image\\/catalog\\/demo-mobile\\/banner\\/banner-mobile-4.png\\\\\\\\\\\\\\\" alt=\\\\\\\\\\\\\\\"Image Client\\\\\\\\\\\\\\\">\\\\\\\\n\\\\\\\\t\\\\\\\\t\\\\\\\\t<\\/a>\\\\\\\\n\\\\\\\\t\\\\\\\\t<\\/div>\\\\\\\\n\\\\\\\\t\\\\\\\\t\\\\\\\\n\\\\\\\\t<\\/div>\\\\\\\\n<\\/div>\\\\\\\",\\\\\\\"yt_class\\\\\\\":\\\\\\\"\\\\\\\",\\\\\\\"css_internal\\\\\\\":\\\\\\\"\\\\\\\"}],\\\\\\\"cchild\\\\\\\":{}}\\\"}],\\\"rows\\\":[]},{\\\"text_class_id\\\":\\\"col_o2b0\\\",\\\"text_class\\\":\\\"col-style\\\",\\\"text_color\\\":\\\"#000000\\\",\\\"link_color\\\":\\\"#000000\\\",\\\"link_hover_color\\\":\\\"#000000\\\",\\\"heading_color\\\":\\\"#000000\\\",\\\"background_type\\\":0,\\\"bg_color\\\":\\\"#FFFFFF\\\",\\\"bg_opacity\\\":\\\"100%\\\",\\\"bg_image\\\":\\\"\\\",\\\"bg_repeat\\\":\\\"no-repeat\\\",\\\"bg_position\\\":\\\"center center\\\",\\\"bg_attachment\\\":\\\"fixed\\\",\\\"bg_scale\\\":\\\"cover\\\",\\\"col_video_type\\\":0,\\\"col_link_video\\\":\\\"YE7VzlLtp-4\\\",\\\"padding\\\":\\\"\\\",\\\"margin\\\":\\\"\\\",\\\"lg_col\\\":12,\\\"md_col\\\":\\\"4\\\",\\\"sm_col\\\":\\\"6\\\",\\\"xs_col\\\":\\\"12\\\",\\\"widgets\\\":[{\\\"name\\\":\\\"Mobile - Best Sellers\\\",\\\"module\\\":\\\"so_extra_slider.13\\\",\\\"type\\\":\\\"module\\\"}],\\\"rows\\\":[]},{\\\"text_class_id\\\":\\\"col_w3j9\\\",\\\"text_class\\\":\\\"no-padding\\\",\\\"text_color\\\":\\\"#000000\\\",\\\"link_color\\\":\\\"#000000\\\",\\\"link_hover_color\\\":\\\"#000000\\\",\\\"heading_color\\\":\\\"#000000\\\",\\\"background_type\\\":\\\"0\\\",\\\"bg_color\\\":\\\"#FFFFFF\\\",\\\"bg_opacity\\\":\\\"100%\\\",\\\"bg_image\\\":\\\"\\\",\\\"bg_repeat\\\":\\\"no-repeat\\\",\\\"bg_position\\\":\\\"center center\\\",\\\"bg_attachment\\\":\\\"fixed\\\",\\\"bg_scale\\\":\\\"cover\\\",\\\"col_video_type\\\":\\\"0\\\",\\\"col_link_video\\\":\\\"YE7VzlLtp-4\\\",\\\"padding\\\":\\\"\\\",\\\"margin\\\":\\\"\\\",\\\"lg_col\\\":\\\"12\\\",\\\"md_col\\\":\\\"12\\\",\\\"sm_col\\\":\\\"12\\\",\\\"xs_col\\\":\\\"12\\\",\\\"widgets\\\":[{\\\"name\\\":\\\"Html\\\",\\\"module\\\":\\\"html_bs4u\\\",\\\"type\\\":\\\"shortcode\\\",\\\"shortcode\\\":\\\"html\\\",\\\"content\\\":\\\"{\\\\\\\"cparent\\\\\\\":[{\\\\\\\"name_shortcode_1\\\\\\\":\\\\\\\"Mobile_Banner3_Home1\\\\\\\",\\\\\\\"name_shortcode_2\\\\\\\":\\\\\\\"Mobile_Banner3_Home1\\\\\\\",\\\\\\\"name_shortcode_status\\\\\\\":\\\\\\\"no\\\\\\\",\\\\\\\"content_1\\\\\\\":\\\\\\\"<div class=\\\\\\\\\\\\\\\"mobile-bn1-h1 clearfix\\\\\\\\\\\\\\\">\\\\\\\\n\\\\\\\\t<div class=\\\\\\\\\\\\\\\"banners\\\\\\\\\\\\\\\">\\\\\\\\n\\\\\\\\t\\\\\\\\t<div class=\\\\\\\\\\\\\\\"banner21\\\\\\\\\\\\\\\">\\\\\\\\n\\\\\\\\t\\\\\\\\t\\\\\\\\t<a href=\\\\\\\\\\\\\\\"index.php?route=mobile\\/home\\\\\\\\\\\\\\\">\\\\\\\\n\\\\\\\\t\\\\\\\\t\\\\\\\\t\\\\\\\\t<img src=\\\\\\\\\\\\\\\"image\\/catalog\\/demo-mobile\\/banner\\/banner-mobile-5.png\\\\\\\\\\\\\\\" alt=\\\\\\\\\\\\\\\"Image Client\\\\\\\\\\\\\\\">\\\\\\\\n\\\\\\\\t\\\\\\\\t\\\\\\\\t<\\/a>\\\\\\\\n\\\\\\\\t\\\\\\\\t<\\/div>\\\\\\\\n\\\\\\\\t\\\\\\\\t<div class=\\\\\\\\\\\\\\\"banner21\\\\\\\\\\\\\\\">\\\\\\\\n\\\\\\\\t\\\\\\\\t\\\\\\\\t<a href=\\\\\\\\\\\\\\\"index.php?route=mobile\\/home\\\\\\\\\\\\\\\">\\\\\\\\n\\\\\\\\t\\\\\\\\t\\\\\\\\t\\\\\\\\t<img src=\\\\\\\\\\\\\\\"image\\/catalog\\/demo-mobile\\/banner\\/banner-mobile-6.png\\\\\\\\\\\\\\\" alt=\\\\\\\\\\\\\\\"Image Client\\\\\\\\\\\\\\\">\\\\\\\\n\\\\\\\\t\\\\\\\\t\\\\\\\\t<\\/a>\\\\\\\\n\\\\\\\\t\\\\\\\\t<\\/div>\\\\\\\\n\\\\\\\\t<\\/div>\\\\\\\\n<\\/div>\\\\\\\",\\\\\\\"content_2\\\\\\\":\\\\\\\"<div class=\\\\\\\\\\\\\\\"mobile-bn1-h1 clearfix\\\\\\\\\\\\\\\">\\\\\\\\n\\\\\\\\t<div class=\\\\\\\\\\\\\\\"banners\\\\\\\\\\\\\\\">\\\\\\\\n\\\\\\\\t\\\\\\\\t<div class=\\\\\\\\\\\\\\\"banner21\\\\\\\\\\\\\\\">\\\\\\\\n\\\\\\\\t\\\\\\\\t\\\\\\\\t<a href=\\\\\\\\\\\\\\\"index.php?route=mobile\\/home\\\\\\\\\\\\\\\">\\\\\\\\n\\\\\\\\t\\\\\\\\t\\\\\\\\t\\\\\\\\t<img src=\\\\\\\\\\\\\\\"image\\/catalog\\/demo-mobile\\/banner\\/banner-mobile-5.png\\\\\\\\\\\\\\\" alt=\\\\\\\\\\\\\\\"Image Client\\\\\\\\\\\\\\\">\\\\\\\\n\\\\\\\\t\\\\\\\\t\\\\\\\\t<\\/a>\\\\\\\\n\\\\\\\\t\\\\\\\\t<\\/div>\\\\\\\\n\\\\\\\\t\\\\\\\\t<div class=\\\\\\\\\\\\\\\"banner21\\\\\\\\\\\\\\\">\\\\\\\\n\\\\\\\\t\\\\\\\\t\\\\\\\\t<a href=\\\\\\\\\\\\\\\"index.php?route=mobile\\/home\\\\\\\\\\\\\\\">\\\\\\\\n\\\\\\\\t\\\\\\\\t\\\\\\\\t\\\\\\\\t<img src=\\\\\\\\\\\\\\\"image\\/catalog\\/demo-mobile\\/banner\\/banner-mobile-6.png\\\\\\\\\\\\\\\" alt=\\\\\\\\\\\\\\\"Image Client\\\\\\\\\\\\\\\">\\\\\\\\n\\\\\\\\t\\\\\\\\t\\\\\\\\t<\\/a>\\\\\\\\n\\\\\\\\t\\\\\\\\t<\\/div>\\\\\\\\n\\\\\\\\t<\\/div>\\\\\\\\n<\\/div>\\\\\\\",\\\\\\\"yt_class\\\\\\\":\\\\\\\"\\\\\\\",\\\\\\\"css_internal\\\\\\\":\\\\\\\"\\\\\\\"}],\\\\\\\"cchild\\\\\\\":{}}\\\"}],\\\"rows\\\":[]},{\\\"text_class_id\\\":\\\"col_aykc\\\",\\\"text_class\\\":\\\"\\\",\\\"text_color\\\":\\\"#000000\\\",\\\"link_color\\\":\\\"#000000\\\",\\\"link_hover_color\\\":\\\"#000000\\\",\\\"heading_color\\\":\\\"#000000\\\",\\\"background_type\\\":\\\"0\\\",\\\"bg_color\\\":\\\"#FFFFFF\\\",\\\"bg_opacity\\\":\\\"100%\\\",\\\"bg_image\\\":\\\"\\\",\\\"bg_repeat\\\":\\\"no-repeat\\\",\\\"bg_position\\\":\\\"center center\\\",\\\"bg_attachment\\\":\\\"fixed\\\",\\\"bg_scale\\\":\\\"cover\\\",\\\"col_video_type\\\":\\\"0\\\",\\\"col_link_video\\\":\\\"YE7VzlLtp-4\\\",\\\"padding\\\":\\\"\\\",\\\"margin\\\":\\\"\\\",\\\"lg_col\\\":\\\"12\\\",\\\"md_col\\\":\\\"12\\\",\\\"sm_col\\\":\\\"12\\\",\\\"xs_col\\\":\\\"12\\\",\\\"widgets\\\":[{\\\"name\\\":\\\"Html\\\",\\\"module\\\":\\\"html_iff1\\\",\\\"type\\\":\\\"shortcode\\\",\\\"shortcode\\\":\\\"html\\\",\\\"content\\\":\\\"{\\\\\\\"cparent\\\\\\\":[{\\\\\\\"name_shortcode_1\\\\\\\":\\\\\\\"Brand_Home1\\\\\\\",\\\\\\\"name_shortcode_2\\\\\\\":\\\\\\\"Brand_Home1\\\\\\\",\\\\\\\"name_shortcode_status\\\\\\\":\\\\\\\"no\\\\\\\",\\\\\\\"content_1\\\\\\\":\\\\\\\"<div class=\\\\\\\\\\\\\\\" module\\\\\\\\\\\\\\\">\\\\\\\\n\\\\\\\\t<h3 class=\\\\\\\\\\\\\\\"modtitle\\\\\\\\\\\\\\\"><span>Top Brands<\\/span><\\/h3>\\\\\\\\n\\\\\\\\t<div class=\\\\\\\\\\\\\\\"contentslider\\\\\\\\\\\\\\\" data-rtl=\\\\\\\\\\\\\\\"no\\\\\\\\\\\\\\\" data-autoplay=\\\\\\\\\\\\\\\"no\\\\\\\\\\\\\\\" data-autowidth=\\\\\\\\\\\\\\\"yes\\\\\\\\\\\\\\\" data-delay=\\\\\\\\\\\\\\\"4\\\\\\\\\\\\\\\" data-speed=\\\\\\\\\\\\\\\"0.6\\\\\\\\\\\\\\\" data-margin=\\\\\\\\\\\\\\\"10\\\\\\\\\\\\\\\" data-items_column1=\\\\\\\\\\\\\\\"1\\\\\\\\\\\\\\\" data-items_column2=\\\\\\\\\\\\\\\"1\\\\\\\\\\\\\\\" data-items_column3=\\\\\\\\\\\\\\\"2\\\\\\\\\\\\\\\" data-items_column4=\\\\\\\\\\\\\\\"2\\\\\\\\\\\\\\\" data-arrows=\\\\\\\\\\\\\\\"yes\\\\\\\\\\\\\\\" data-pagination=\\\\\\\\\\\\\\\"no\\\\\\\\\\\\\\\" data-lazyload=\\\\\\\\\\\\\\\"no\\\\\\\\\\\\\\\" data-loop=\\\\\\\\\\\\\\\"yes\\\\\\\\\\\\\\\" data-hoverpause=\\\\\\\\\\\\\\\"yes\\\\\\\\\\\\\\\">\\\\\\\\n\\\\\\\\t\\\\\\\\t<div class=\\\\\\\\\\\\\\\"item-brand item-scroll\\\\\\\\\\\\\\\">\\\\\\\\n\\\\\\\\t\\\\\\\\t\\\\\\\\t<a href=\\\\\\\\\\\\\\\"index.php?route=mobile\\/home\\\\\\\\\\\\\\\">\\\\\\\\n\\\\\\\\t\\\\\\\\t\\\\\\\\t\\\\\\\\t<img src=\\\\\\\\\\\\\\\"image\\/catalog\\/demo-mobile\\/banner\\/brand-mobile.jpg\\\\\\\\\\\\\\\" alt=\\\\\\\\\\\\\\\"Image Client\\\\\\\\\\\\\\\">\\\\\\\\n\\\\\\\\t\\\\\\\\t\\\\\\\\t<\\/a>\\\\\\\\n\\\\\\\\t\\\\\\\\t<\\/div>\\\\\\\\n\\\\\\\\t\\\\\\\\t<div class=\\\\\\\\\\\\\\\"item-brand item-scroll\\\\\\\\\\\\\\\">\\\\\\\\n\\\\\\\\t\\\\\\\\t\\\\\\\\t<a href=\\\\\\\\\\\\\\\"index.php?route=mobile\\/home\\\\\\\\\\\\\\\">\\\\\\\\n\\\\\\\\t\\\\\\\\t\\\\\\\\t\\\\\\\\t<img src=\\\\\\\\\\\\\\\"image\\/catalog\\/demo-mobile\\/banner\\/brand-mobile.jpg\\\\\\\\\\\\\\\" alt=\\\\\\\\\\\\\\\"Image Client\\\\\\\\\\\\\\\">\\\\\\\\n\\\\\\\\t\\\\\\\\t\\\\\\\\t<\\/a>\\\\\\\\n\\\\\\\\t\\\\\\\\t<\\/div>\\\\\\\\n\\\\\\\\t\\\\\\\\t<div class=\\\\\\\\\\\\\\\"item-brand item-scroll\\\\\\\\\\\\\\\">\\\\\\\\n\\\\\\\\t\\\\\\\\t\\\\\\\\t<a href=\\\\\\\\\\\\\\\"index.php?route=mobile\\/home\\\\\\\\\\\\\\\">\\\\\\\\n\\\\\\\\t\\\\\\\\t\\\\\\\\t\\\\\\\\t<img src=\\\\\\\\\\\\\\\"image\\/catalog\\/demo-mobile\\/banner\\/brand-mobile.jpg\\\\\\\\\\\\\\\" alt=\\\\\\\\\\\\\\\"Image Client\\\\\\\\\\\\\\\">\\\\\\\\n\\\\\\\\t\\\\\\\\t\\\\\\\\t<\\/a>\\\\\\\\n\\\\\\\\t\\\\\\\\t<\\/div>\\\\\\\\n\\\\\\\\t\\\\\\\\t<div class=\\\\\\\\\\\\\\\"item-brand item-scroll\\\\\\\\\\\\\\\">\\\\\\\\n\\\\\\\\t\\\\\\\\t\\\\\\\\t<a href=\\\\\\\\\\\\\\\"index.php?route=mobile\\/home\\\\\\\\\\\\\\\">\\\\\\\\n\\\\\\\\t\\\\\\\\t\\\\\\\\t\\\\\\\\t<img src=\\\\\\\\\\\\\\\"image\\/catalog\\/demo-mobile\\/banner\\/brand-mobile.jpg\\\\\\\\\\\\\\\" alt=\\\\\\\\\\\\\\\"Image Client\\\\\\\\\\\\\\\">\\\\\\\\n\\\\\\\\t\\\\\\\\t\\\\\\\\t<\\/a>\\\\\\\\n\\\\\\\\t\\\\\\\\t<\\/div>\\\\\\\\n\\\\\\\\t\\\\\\\\t<div class=\\\\\\\\\\\\\\\"item-brand item-scroll\\\\\\\\\\\\\\\">\\\\\\\\n\\\\\\\\t\\\\\\\\t\\\\\\\\t<a href=\\\\\\\\\\\\\\\"index.php?route=mobile\\/home\\\\\\\\\\\\\\\">\\\\\\\\n\\\\\\\\t\\\\\\\\t\\\\\\\\t\\\\\\\\t<img src=\\\\\\\\\\\\\\\"image\\/catalog\\/demo-mobile\\/banner\\/brand-mobile.jpg\\\\\\\\\\\\\\\" alt=\\\\\\\\\\\\\\\"Image Client\\\\\\\\\\\\\\\">\\\\\\\\n\\\\\\\\t\\\\\\\\t\\\\\\\\t<\\/a>\\\\\\\\n\\\\\\\\t\\\\\\\\t<\\/div>\\\\\\\\n\\\\\\\\t\\\\\\\\t<div class=\\\\\\\\\\\\\\\"item-brand item-scroll\\\\\\\\\\\\\\\">\\\\\\\\n\\\\\\\\t\\\\\\\\t\\\\\\\\t<a href=\\\\\\\\\\\\\\\"index.php?route=mobile\\/home\\\\\\\\\\\\\\\">\\\\\\\\n\\\\\\\\t\\\\\\\\t\\\\\\\\t\\\\\\\\t<img src=\\\\\\\\\\\\\\\"image\\/catalog\\/demo-mobile\\/banner\\/brand-mobile.jpg\\\\\\\\\\\\\\\" alt=\\\\\\\\\\\\\\\"Image Client\\\\\\\\\\\\\\\">\\\\\\\\n\\\\\\\\t\\\\\\\\t\\\\\\\\t<\\/a>\\\\\\\\n\\\\\\\\t\\\\\\\\t<\\/div>\\\\\\\\n\\\\\\\\t<\\/div>\\\\\\\\n<\\/div>\\\\\\\",\\\\\\\"content_2\\\\\\\":\\\\\\\"<div class=\\\\\\\\\\\\\\\" module\\\\\\\\\\\\\\\">\\\\\\\\n\\\\\\\\t<h3 class=\\\\\\\\\\\\\\\"modtitle\\\\\\\\\\\\\\\"><span>Top Brands<\\/span><\\/h3>\\\\\\\\n\\\\\\\\t<div class=\\\\\\\\\\\\\\\"contentslider\\\\\\\\\\\\\\\" data-rtl=\\\\\\\\\\\\\\\"yes\\\\\\\\\\\\\\\" data-autoplay=\\\\\\\\\\\\\\\"no\\\\\\\\\\\\\\\" data-autowidth=\\\\\\\\\\\\\\\"yes\\\\\\\\\\\\\\\" data-delay=\\\\\\\\\\\\\\\"4\\\\\\\\\\\\\\\" data-speed=\\\\\\\\\\\\\\\"0.6\\\\\\\\\\\\\\\" data-margin=\\\\\\\\\\\\\\\"10\\\\\\\\\\\\\\\" data-items_column1=\\\\\\\\\\\\\\\"1\\\\\\\\\\\\\\\" data-items_column2=\\\\\\\\\\\\\\\"1\\\\\\\\\\\\\\\" data-items_column3=\\\\\\\\\\\\\\\"2\\\\\\\\\\\\\\\" data-items_column4=\\\\\\\\\\\\\\\"2\\\\\\\\\\\\\\\" data-arrows=\\\\\\\\\\\\\\\"yes\\\\\\\\\\\\\\\" data-pagination=\\\\\\\\\\\\\\\"no\\\\\\\\\\\\\\\" data-lazyload=\\\\\\\\\\\\\\\"no\\\\\\\\\\\\\\\" data-loop=\\\\\\\\\\\\\\\"yes\\\\\\\\\\\\\\\" data-hoverpause=\\\\\\\\\\\\\\\"yes\\\\\\\\\\\\\\\">\\\\\\\\n\\\\\\\\t\\\\\\\\t<div class=\\\\\\\\\\\\\\\"item-brand item-scroll\\\\\\\\\\\\\\\">\\\\\\\\n\\\\\\\\t\\\\\\\\t\\\\\\\\t<a href=\\\\\\\\\\\\\\\"index.php?route=mobile\\/home\\\\\\\\\\\\\\\">\\\\\\\\n\\\\\\\\t\\\\\\\\t\\\\\\\\t\\\\\\\\t<img src=\\\\\\\\\\\\\\\"image\\/catalog\\/demo-mobile\\/banner\\/brand-mobile.jpg\\\\\\\\\\\\\\\" alt=\\\\\\\\\\\\\\\"Image Client\\\\\\\\\\\\\\\">\\\\\\\\n\\\\\\\\t\\\\\\\\t\\\\\\\\t<\\/a>\\\\\\\\n\\\\\\\\t\\\\\\\\t<\\/div>\\\\\\\\n\\\\\\\\t\\\\\\\\t<div class=\\\\\\\\\\\\\\\"item-brand item-scroll\\\\\\\\\\\\\\\">\\\\\\\\n\\\\\\\\t\\\\\\\\t\\\\\\\\t<a href=\\\\\\\\\\\\\\\"index.php?route=mobile\\/home\\\\\\\\\\\\\\\">\\\\\\\\n\\\\\\\\t\\\\\\\\t\\\\\\\\t\\\\\\\\t<img src=\\\\\\\\\\\\\\\"image\\/catalog\\/demo-mobile\\/banner\\/brand-mobile.jpg\\\\\\\\\\\\\\\" alt=\\\\\\\\\\\\\\\"Image Client\\\\\\\\\\\\\\\">\\\\\\\\n\\\\\\\\t\\\\\\\\t\\\\\\\\t<\\/a>\\\\\\\\n\\\\\\\\t\\\\\\\\t<\\/div>\\\\\\\\n\\\\\\\\t\\\\\\\\t<div class=\\\\\\\\\\\\\\\"item-brand item-scroll\\\\\\\\\\\\\\\">\\\\\\\\n\\\\\\\\t\\\\\\\\t\\\\\\\\t<a href=\\\\\\\\\\\\\\\"index.php?route=mobile\\/home\\\\\\\\\\\\\\\">\\\\\\\\n\\\\\\\\t\\\\\\\\t\\\\\\\\t\\\\\\\\t<img src=\\\\\\\\\\\\\\\"image\\/catalog\\/demo-mobile\\/banner\\/brand-mobile.jpg\\\\\\\\\\\\\\\" alt=\\\\\\\\\\\\\\\"Image Client\\\\\\\\\\\\\\\">\\\\\\\\n\\\\\\\\t\\\\\\\\t\\\\\\\\t<\\/a>\\\\\\\\n\\\\\\\\t\\\\\\\\t<\\/div>\\\\\\\\n\\\\\\\\t\\\\\\\\t<div class=\\\\\\\\\\\\\\\"item-brand item-scroll\\\\\\\\\\\\\\\">\\\\\\\\n\\\\\\\\t\\\\\\\\t\\\\\\\\t<a href=\\\\\\\\\\\\\\\"index.php?route=mobile\\/home\\\\\\\\\\\\\\\">\\\\\\\\n\\\\\\\\t\\\\\\\\t\\\\\\\\t\\\\\\\\t<img src=\\\\\\\\\\\\\\\"image\\/catalog\\/demo-mobile\\/banner\\/brand-mobile.jpg\\\\\\\\\\\\\\\" alt=\\\\\\\\\\\\\\\"Image Client\\\\\\\\\\\\\\\">\\\\\\\\n\\\\\\\\t\\\\\\\\t\\\\\\\\t<\\/a>\\\\\\\\n\\\\\\\\t\\\\\\\\t<\\/div>\\\\\\\\n\\\\\\\\t\\\\\\\\t<div class=\\\\\\\\\\\\\\\"item-brand item-scroll\\\\\\\\\\\\\\\">\\\\\\\\n\\\\\\\\t\\\\\\\\t\\\\\\\\t<a href=\\\\\\\\\\\\\\\"index.php?route=mobile\\/home\\\\\\\\\\\\\\\">\\\\\\\\n\\\\\\\\t\\\\\\\\t\\\\\\\\t\\\\\\\\t<img src=\\\\\\\\\\\\\\\"image\\/catalog\\/demo-mobile\\/banner\\/brand-mobile.jpg\\\\\\\\\\\\\\\" alt=\\\\\\\\\\\\\\\"Image Client\\\\\\\\\\\\\\\">\\\\\\\\n\\\\\\\\t\\\\\\\\t\\\\\\\\t<\\/a>\\\\\\\\n\\\\\\\\t\\\\\\\\t<\\/div>\\\\\\\\n\\\\\\\\t\\\\\\\\t<div class=\\\\\\\\\\\\\\\"item-brand item-scroll\\\\\\\\\\\\\\\">\\\\\\\\n\\\\\\\\t\\\\\\\\t\\\\\\\\t<a href=\\\\\\\\\\\\\\\"index.php?route=mobile\\/home\\\\\\\\\\\\\\\">\\\\\\\\n\\\\\\\\t\\\\\\\\t\\\\\\\\t\\\\\\\\t<img src=\\\\\\\\\\\\\\\"image\\/catalog\\/demo-mobile\\/banner\\/brand-mobile.jpg\\\\\\\\\\\\\\\" alt=\\\\\\\\\\\\\\\"Image Client\\\\\\\\\\\\\\\">\\\\\\\\n\\\\\\\\t\\\\\\\\t\\\\\\\\t<\\/a>\\\\\\\\n\\\\\\\\t\\\\\\\\t<\\/div>\\\\\\\\n\\\\\\\\t<\\/div>\\\\\\\\n<\\/div>\\\\\\\",\\\\\\\"yt_class\\\\\\\":\\\\\\\"\\\\\\\",\\\\\\\"css_internal\\\\\\\":\\\\\\\"\\\\\\\"}],\\\\\\\"cchild\\\\\\\":{}}\\\"}],\\\"rows\\\":[]},{\\\"text_class_id\\\":\\\"col_724x\\\",\\\"text_class\\\":\\\"\\\",\\\"text_color\\\":\\\"#000000\\\",\\\"link_color\\\":\\\"#000000\\\",\\\"link_hover_color\\\":\\\"#000000\\\",\\\"heading_color\\\":\\\"#000000\\\",\\\"background_type\\\":\\\"0\\\",\\\"bg_color\\\":\\\"#FFFFFF\\\",\\\"bg_opacity\\\":\\\"100%\\\",\\\"bg_image\\\":\\\"\\\",\\\"bg_repeat\\\":\\\"no-repeat\\\",\\\"bg_position\\\":\\\"center center\\\",\\\"bg_attachment\\\":\\\"fixed\\\",\\\"bg_scale\\\":\\\"cover\\\",\\\"col_video_type\\\":\\\"0\\\",\\\"col_link_video\\\":\\\"YE7VzlLtp-4\\\",\\\"padding\\\":\\\"\\\",\\\"margin\\\":\\\"\\\",\\\"lg_col\\\":\\\"12\\\",\\\"md_col\\\":\\\"12\\\",\\\"sm_col\\\":\\\"12\\\",\\\"xs_col\\\":\\\"12\\\",\\\"widgets\\\":[{\\\"name\\\":\\\"Html\\\",\\\"module\\\":\\\"html_bj24\\\",\\\"type\\\":\\\"shortcode\\\",\\\"shortcode\\\":\\\"html\\\",\\\"content\\\":\\\"{\\\\\\\"cparent\\\\\\\":[{\\\\\\\"name_shortcode_1\\\\\\\":\\\\\\\"Sevicer_Home1\\\\\\\",\\\\\\\"name_shortcode_2\\\\\\\":\\\\\\\"Sevicer_Home1\\\\\\\",\\\\\\\"name_shortcode_status\\\\\\\":\\\\\\\"no\\\\\\\",\\\\\\\"content_1\\\\\\\":\\\\\\\"<div class=\\\\\\\\\\\\\\\"block-mobile clearfix\\\\\\\\\\\\\\\">\\\\\\\\n\\\\\\\\t<div class=\\\\\\\\\\\\\\\"info info1\\\\\\\\\\\\\\\">\\\\\\\\n\\\\\\\\t\\\\\\\\t<div class=\\\\\\\\\\\\\\\"inner\\\\\\\\\\\\\\\">\\\\\\\\n\\\\\\\\t\\\\\\\\t\\\\\\\\t<i class=\\\\\\\\\\\\\\\"fa fa-truck\\\\\\\\\\\\\\\"><\\/i>\\\\\\\\n\\\\\\\\t\\\\\\\\t\\\\\\\\t<div class=\\\\\\\\\\\\\\\"info-content\\\\\\\\\\\\\\\">\\\\\\\\n\\\\\\\\t\\\\\\\\t\\\\\\\\t\\\\\\\\t<span>free delivery<\\/span>\\\\\\\\n\\\\\\\\t\\\\\\\\t\\\\\\\\t\\\\\\\\t<p>From 275 AED<\\/p>\\\\\\\\n\\\\\\\\t\\\\\\\\t\\\\\\\\t<\\/div>\\\\\\\\n\\\\\\\\t\\\\\\\\t<\\/div>\\\\\\\\n\\\\\\\\t<\\/div>\\\\\\\\n\\\\\\\\t<div class=\\\\\\\\\\\\\\\"info info2\\\\\\\\\\\\\\\">\\\\\\\\n\\\\\\\\t\\\\\\\\t<div class=\\\\\\\\\\\\\\\"inner\\\\\\\\\\\\\\\">\\\\\\\\n\\\\\\\\t\\\\\\\\t\\\\\\\\t<i class=\\\\\\\\\\\\\\\"fa fa-money\\\\\\\\\\\\\\\"><\\/i>\\\\\\\\n\\\\\\\\t\\\\\\\\t\\\\\\\\t<div class=\\\\\\\\\\\\\\\"info-content\\\\\\\\\\\\\\\">\\\\\\\\n\\\\\\\\t\\\\\\\\t\\\\\\\\t\\\\\\\\t<span>free delivery<\\/span>\\\\\\\\n\\\\\\\\t\\\\\\\\t\\\\\\\\t\\\\\\\\t<p>From 275 AED<\\/p>\\\\\\\\n\\\\\\\\t\\\\\\\\t\\\\\\\\t<\\/div>\\\\\\\\n\\\\\\\\t\\\\\\\\t<\\/div>\\\\\\\\n\\\\\\\\t<\\/div>\\\\\\\\n\\\\\\\\t<div class=\\\\\\\\\\\\\\\"info info3\\\\\\\\\\\\\\\">\\\\\\\\n\\\\\\\\t\\\\\\\\t<div class=\\\\\\\\\\\\\\\"inner\\\\\\\\\\\\\\\">\\\\\\\\n\\\\\\\\t\\\\\\\\t\\\\\\\\t<i class=\\\\\\\\\\\\\\\"fa fa-gift\\\\\\\\\\\\\\\"><\\/i>\\\\\\\\n\\\\\\\\t\\\\\\\\t\\\\\\\\t<div class=\\\\\\\\\\\\\\\"info-content\\\\\\\\\\\\\\\">\\\\\\\\n\\\\\\\\t\\\\\\\\t\\\\\\\\t\\\\\\\\t<span>free gift box<\\/span>\\\\\\\\n\\\\\\\\t\\\\\\\\t\\\\\\\\t\\\\\\\\t<p>& gift note<\\/p>\\\\\\\\n\\\\\\\\t\\\\\\\\t\\\\\\\\t<\\/div>\\\\\\\\n\\\\\\\\t\\\\\\\\t<\\/div>\\\\\\\\n\\\\\\\\t<\\/div>\\\\\\\\n<\\/div>\\\\\\\",\\\\\\\"content_2\\\\\\\":\\\\\\\"<div class=\\\\\\\\\\\\\\\"block-mobile clearfix\\\\\\\\\\\\\\\">\\\\\\\\n\\\\\\\\t<div class=\\\\\\\\\\\\\\\"info info1\\\\\\\\\\\\\\\">\\\\\\\\n\\\\\\\\t\\\\\\\\t<div class=\\\\\\\\\\\\\\\"inner\\\\\\\\\\\\\\\">\\\\\\\\n\\\\\\\\t\\\\\\\\t\\\\\\\\t<i class=\\\\\\\\\\\\\\\"fa fa-truck\\\\\\\\\\\\\\\"><\\/i>\\\\\\\\n\\\\\\\\t\\\\\\\\t\\\\\\\\t<div class=\\\\\\\\\\\\\\\"info-content\\\\\\\\\\\\\\\">\\\\\\\\n\\\\\\\\t\\\\\\\\t\\\\\\\\t\\\\\\\\t<span>free delivery<\\/span>\\\\\\\\n\\\\\\\\t\\\\\\\\t\\\\\\\\t\\\\\\\\t<p>From 275 AED<\\/p>\\\\\\\\n\\\\\\\\t\\\\\\\\t\\\\\\\\t<\\/div>\\\\\\\\n\\\\\\\\t\\\\\\\\t<\\/div>\\\\\\\\n\\\\\\\\t<\\/div>\\\\\\\\n\\\\\\\\t<div class=\\\\\\\\\\\\\\\"info info2\\\\\\\\\\\\\\\">\\\\\\\\n\\\\\\\\t\\\\\\\\t<div class=\\\\\\\\\\\\\\\"inner\\\\\\\\\\\\\\\">\\\\\\\\n\\\\\\\\t\\\\\\\\t\\\\\\\\t<i class=\\\\\\\\\\\\\\\"fa fa-money\\\\\\\\\\\\\\\"><\\/i>\\\\\\\\n\\\\\\\\t\\\\\\\\t\\\\\\\\t<div class=\\\\\\\\\\\\\\\"info-content\\\\\\\\\\\\\\\">\\\\\\\\n\\\\\\\\t\\\\\\\\t\\\\\\\\t\\\\\\\\t<span>free delivery<\\/span>\\\\\\\\n\\\\\\\\t\\\\\\\\t\\\\\\\\t\\\\\\\\t<p>From 275 AED<\\/p>\\\\\\\\n\\\\\\\\t\\\\\\\\t\\\\\\\\t<\\/div>\\\\\\\\n\\\\\\\\t\\\\\\\\t<\\/div>\\\\\\\\n\\\\\\\\t<\\/div>\\\\\\\\n\\\\\\\\t<div class=\\\\\\\\\\\\\\\"info info3\\\\\\\\\\\\\\\">\\\\\\\\n\\\\\\\\t\\\\\\\\t<div class=\\\\\\\\\\\\\\\"inner\\\\\\\\\\\\\\\">\\\\\\\\n\\\\\\\\t\\\\\\\\t\\\\\\\\t<i class=\\\\\\\\\\\\\\\"fa fa-gift\\\\\\\\\\\\\\\"><\\/i>\\\\\\\\n\\\\\\\\t\\\\\\\\t\\\\\\\\t<div class=\\\\\\\\\\\\\\\"info-content\\\\\\\\\\\\\\\">\\\\\\\\n\\\\\\\\t\\\\\\\\t\\\\\\\\t\\\\\\\\t<span>free gift box<\\/span>\\\\\\\\n\\\\\\\\t\\\\\\\\t\\\\\\\\t\\\\\\\\t<p>& gift note<\\/p>\\\\\\\\n\\\\\\\\t\\\\\\\\t\\\\\\\\t<\\/div>\\\\\\\\n\\\\\\\\t\\\\\\\\t<\\/div>\\\\\\\\n\\\\\\\\t<\\/div>\\\\\\\\n<\\/div>\\\\\\\",\\\\\\\"yt_class\\\\\\\":\\\\\\\"\\\\\\\",\\\\\\\"css_internal\\\\\\\":\\\\\\\"\\\\\\\"}],\\\\\\\"cchild\\\\\\\":{}}\\\"}],\\\"rows\\\":[]}]}]\",\"name\":\"Mobile Page Builder - Home 1\",\"status\":\"1\",\"import_theme\":\"0\",\"content_shortcode\":\"{&quot;cparent&quot;:[{&quot;name_shortcode_1&quot;:&quot;Sevicer_Home1&quot;,&quot;name_shortcode_2&quot;:&quot;Sevicer_Home1&quot;,&quot;name_shortcode_status&quot;:&quot;no&quot;,&quot;content_1&quot;:&quot;&lt;div class=\\\\&quot;block-mobile clearfix\\\\&quot;&gt;\\\\n\\\\t&lt;div class=\\\\&quot;info info1\\\\&quot;&gt;\\\\n\\\\t\\\\t&lt;div class=\\\\&quot;inner\\\\&quot;&gt;\\\\n\\\\t\\\\t\\\\t&lt;i class=\\\\&quot;fa fa-truck\\\\&quot;&gt;&lt;\\/i&gt;\\\\n\\\\t\\\\t\\\\t&lt;div class=\\\\&quot;info-content\\\\&quot;&gt;\\\\n\\\\t\\\\t\\\\t\\\\t&lt;span&gt;free delivery&lt;\\/span&gt;\\\\n\\\\t\\\\t\\\\t\\\\t&lt;p&gt;From 275 AED&lt;\\/p&gt;\\\\n\\\\t\\\\t\\\\t&lt;\\/div&gt;\\\\n\\\\t\\\\t&lt;\\/div&gt;\\\\n\\\\t&lt;\\/div&gt;\\\\n\\\\t&lt;div class=\\\\&quot;info info2\\\\&quot;&gt;\\\\n\\\\t\\\\t&lt;div class=\\\\&quot;inner\\\\&quot;&gt;\\\\n\\\\t\\\\t\\\\t&lt;i class=\\\\&quot;fa fa-money\\\\&quot;&gt;&lt;\\/i&gt;\\\\n\\\\t\\\\t\\\\t&lt;div class=\\\\&quot;info-content\\\\&quot;&gt;\\\\n\\\\t\\\\t\\\\t\\\\t&lt;span&gt;free delivery&lt;\\/span&gt;\\\\n\\\\t\\\\t\\\\t\\\\t&lt;p&gt;From 275 AED&lt;\\/p&gt;\\\\n\\\\t\\\\t\\\\t&lt;\\/div&gt;\\\\n\\\\t\\\\t&lt;\\/div&gt;\\\\n\\\\t&lt;\\/div&gt;\\\\n\\\\t&lt;div class=\\\\&quot;info info3\\\\&quot;&gt;\\\\n\\\\t\\\\t&lt;div class=\\\\&quot;inner\\\\&quot;&gt;\\\\n\\\\t\\\\t\\\\t&lt;i class=\\\\&quot;fa fa-gift\\\\&quot;&gt;&lt;\\/i&gt;\\\\n\\\\t\\\\t\\\\t&lt;div class=\\\\&quot;info-content\\\\&quot;&gt;\\\\n\\\\t\\\\t\\\\t\\\\t&lt;span&gt;free gift box&lt;\\/span&gt;\\\\n\\\\t\\\\t\\\\t\\\\t&lt;p&gt;&amp; gift note&lt;\\/p&gt;\\\\n\\\\t\\\\t\\\\t&lt;\\/div&gt;\\\\n\\\\t\\\\t&lt;\\/div&gt;\\\\n\\\\t&lt;\\/div&gt;\\\\n&lt;\\/div&gt;&quot;,&quot;content_2&quot;:&quot;&lt;div class=\\\\&quot;block-mobile clearfix\\\\&quot;&gt;\\\\n\\\\t&lt;div class=\\\\&quot;info info1\\\\&quot;&gt;\\\\n\\\\t\\\\t&lt;div class=\\\\&quot;inner\\\\&quot;&gt;\\\\n\\\\t\\\\t\\\\t&lt;i class=\\\\&quot;fa fa-truck\\\\&quot;&gt;&lt;\\/i&gt;\\\\n\\\\t\\\\t\\\\t&lt;div class=\\\\&quot;info-content\\\\&quot;&gt;\\\\n\\\\t\\\\t\\\\t\\\\t&lt;span&gt;free delivery&lt;\\/span&gt;\\\\n\\\\t\\\\t\\\\t\\\\t&lt;p&gt;From 275 AED&lt;\\/p&gt;\\\\n\\\\t\\\\t\\\\t&lt;\\/div&gt;\\\\n\\\\t\\\\t&lt;\\/div&gt;\\\\n\\\\t&lt;\\/div&gt;\\\\n\\\\t&lt;div class=\\\\&quot;info info2\\\\&quot;&gt;\\\\n\\\\t\\\\t&lt;div class=\\\\&quot;inner\\\\&quot;&gt;\\\\n\\\\t\\\\t\\\\t&lt;i class=\\\\&quot;fa fa-money\\\\&quot;&gt;&lt;\\/i&gt;\\\\n\\\\t\\\\t\\\\t&lt;div class=\\\\&quot;info-content\\\\&quot;&gt;\\\\n\\\\t\\\\t\\\\t\\\\t&lt;span&gt;free delivery&lt;\\/span&gt;\\\\n\\\\t\\\\t\\\\t\\\\t&lt;p&gt;From 275 AED&lt;\\/p&gt;\\\\n\\\\t\\\\t\\\\t&lt;\\/div&gt;\\\\n\\\\t\\\\t&lt;\\/div&gt;\\\\n\\\\t&lt;\\/div&gt;\\\\n\\\\t&lt;div class=\\\\&quot;info info3\\\\&quot;&gt;\\\\n\\\\t\\\\t&lt;div class=\\\\&quot;inner\\\\&quot;&gt;\\\\n\\\\t\\\\t\\\\t&lt;i class=\\\\&quot;fa fa-gift\\\\&quot;&gt;&lt;\\/i&gt;\\\\n\\\\t\\\\t\\\\t&lt;div class=\\\\&quot;info-content\\\\&quot;&gt;\\\\n\\\\t\\\\t\\\\t\\\\t&lt;span&gt;free gift box&lt;\\/span&gt;\\\\n\\\\t\\\\t\\\\t\\\\t&lt;p&gt;&amp; gift note&lt;\\/p&gt;\\\\n\\\\t\\\\t\\\\t&lt;\\/div&gt;\\\\n\\\\t\\\\t&lt;\\/div&gt;\\\\n\\\\t&lt;\\/div&gt;\\\\n&lt;\\/div&gt;&quot;,&quot;yt_class&quot;:&quot;&quot;,&quot;css_internal&quot;:&quot;&quot;}],&quot;cchild&quot;:{}}\",\"moduleid\":\"24\"}'),
	(21,'Mobile - Slide _ Home3','so_home_slider','{\"name\":\"Mobile - Slide _ Home3\",\"module_description\":{\"1\":{\"head_name\":\"Slide\"},\"2\":{\"head_name\":\"Slide\"}},\"head_name\":\"Slide\",\"disp_title_module\":\"0\",\"status\":\"1\",\"class_suffix\":\"\",\"item_link_target\":\"_self\",\"nb_column0\":\"1\",\"nb_column1\":\"1\",\"nb_column2\":\"1\",\"nb_column3\":\"1\",\"nb_column4\":\"1\",\"width\":\"480\",\"height\":\"520\",\"center\":\"0\",\"autoplay\":\"0\",\"autoplayTimeout\":\"5000\",\"autoplayHoverPause\":\"1\",\"autoplaySpeed\":\"1000\",\"startPosition\":\"0\",\"mouseDrag\":\"1\",\"touchDrag\":\"1\",\"loop\":\"0\",\"dots\":\"0\",\"navs\":\"0\",\"animateOut\":\"none\",\"animateIn\":\"none\",\"pre_text\":\"\",\"post_text\":\"\",\"use_cache\":\"0\",\"cache_time\":\"3600\",\"image\":\"\",\"slide_link\":\"\",\"slide_status\":\"1\",\"slide_description\":{\"1\":{\"slide_title\":\"\",\"language_id\":\"1\",\"slide_caption\":\"\",\"slide_desciption\":\" \"},\"2\":{\"slide_title\":\"\",\"language_id\":\"2\",\"slide_caption\":\"\",\"slide_desciption\":\" \"}},\"moduleid\":\"21\"}'),
	(22,'Home 1 - Featured Categories','so_html_content','{\"action\":\"\",\"name\":\"Home 1 - Featured Categories\",\"status\":\"1\",\"type_layout\":\"0\",\"class_suffix\":\"no-margin\",\"use_cache\":\"0\",\"cache_time\":\"3600\",\"module_description\":{\"1\":{\"title\":\"\",\"description\":\"&lt;div class=&quot;block-categories&quot;&gt;\\r\\n\\t&lt;h3 class=&quot;modtitle&quot;&gt;&lt;span&gt;Featured Categories&lt;\\/span&gt;&lt;\\/h3&gt;\\r\\n\\t&lt;div class=&quot;cate-content contentslider&quot; data-rtl=&quot;no&quot; data-autoplay=&quot;no&quot; data-autowidth=&quot;yes&quot; data-delay=&quot;4&quot; data-speed=&quot;0.6&quot; data-margin=&quot;10&quot; data-items_column1=&quot;1&quot; data-items_column2=&quot;1&quot; data-items_column3=&quot;2&quot; data-items_column4=&quot;2&quot; data-arrows=&quot;yes&quot; data-pagination=&quot;no&quot; data-lazyload=&quot;no&quot; data-loop=&quot;yes&quot; data-hoverpause=&quot;yes&quot;&gt;\\r\\n\\t\\t&lt;div class=&quot;cate cate1&quot;&gt;\\r\\n\\t\\t\\t&lt;div class=&quot;inner&quot;&gt;&lt;img src=&quot;image\\/catalog\\/demo\\/banners\\/home1\\/cate1.jpg&quot; alt=&quot;Static Image&quot;&gt;&lt;a href=&quot;#&quot;&gt;Watch&lt;\\/a&gt;&lt;\\/div&gt;\\r\\n\\t\\t&lt;\\/div&gt;\\r\\n\\t\\t&lt;div class=&quot;cate cate2&quot;&gt;\\r\\n\\t\\t&lt;div class=&quot;inner&quot;&gt;&lt;img src=&quot;image\\/catalog\\/demo\\/banners\\/home1\\/cate2.jpg&quot; alt=&quot;Static Image&quot;&gt;&lt;a href=&quot;#&quot;&gt;Bags&lt;\\/a&gt;&lt;\\/div&gt;\\r\\n\\t\\t&lt;\\/div&gt;\\r\\n\\t\\t&lt;div class=&quot;cate cate3&quot;&gt;\\r\\n\\t\\t&lt;div class=&quot;inner&quot;&gt;&lt;img src=&quot;image\\/catalog\\/demo\\/banners\\/home1\\/cate3.jpg&quot; alt=&quot;Static Image&quot;&gt;&lt;a href=&quot;#&quot;&gt;Swimwear&lt;\\/a&gt;&lt;\\/div&gt;\\r\\n\\t\\t&lt;\\/div&gt;\\r\\n\\t\\t&lt;div class=&quot;cate cate4&quot;&gt;\\r\\n\\t\\t&lt;div class=&quot;inner&quot;&gt;&lt;img src=&quot;image\\/catalog\\/demo\\/banners\\/home1\\/cate4.jpg&quot; alt=&quot;Static Image&quot;&gt;&lt;a href=&quot;#&quot;&gt;Shoes&lt;\\/a&gt;&lt;\\/div&gt;\\r\\n\\t\\t&lt;\\/div&gt;\\r\\n\\t\\t&lt;div class=&quot;cate cate5&quot;&gt;\\r\\n\\t\\t&lt;div class=&quot;inner&quot;&gt;&lt;img src=&quot;image\\/catalog\\/demo\\/banners\\/home1\\/cate5.jpg&quot; alt=&quot;Static Image&quot;&gt;&lt;a href=&quot;#&quot;&gt;Fashion&lt;\\/a&gt;&lt;\\/div&gt;\\r\\n\\t\\t&lt;\\/div&gt;\\r\\n\\t&lt;\\/div&gt;\\r\\n&lt;\\/div&gt;\"},\"2\":{\"title\":\"\",\"description\":\"&lt;div class=&quot;block-categories&quot;&gt;\\r\\n\\t&lt;h3 class=&quot;modtitle&quot;&gt;&lt;span&gt;Featured Categories&lt;\\/span&gt;&lt;\\/h3&gt;\\r\\n\\t&lt;div class=&quot;cate-content contentslider&quot; data-rtl=&quot;yes&quot; data-autoplay=&quot;no&quot; data-autowidth=&quot;yes&quot; data-delay=&quot;4&quot; data-speed=&quot;0.6&quot; data-margin=&quot;10&quot; data-items_column1=&quot;1&quot; data-items_column2=&quot;1&quot; data-items_column3=&quot;2&quot; data-items_column4=&quot;2&quot; data-arrows=&quot;yes&quot; data-pagination=&quot;no&quot; data-lazyload=&quot;no&quot; data-loop=&quot;yes&quot; data-hoverpause=&quot;yes&quot;&gt;\\r\\n\\t\\t&lt;div class=&quot;cate cate1&quot;&gt;\\r\\n\\t\\t\\t&lt;div class=&quot;inner&quot;&gt;&lt;img src=&quot;image\\/catalog\\/demo\\/banners\\/home1\\/cate1.jpg&quot; alt=&quot;Static Image&quot;&gt;&lt;a href=&quot;#&quot;&gt;Watch&lt;\\/a&gt;&lt;\\/div&gt;\\r\\n\\t\\t&lt;\\/div&gt;\\r\\n\\t\\t&lt;div class=&quot;cate cate2&quot;&gt;\\r\\n\\t\\t&lt;div class=&quot;inner&quot;&gt;&lt;img src=&quot;image\\/catalog\\/demo\\/banners\\/home1\\/cate2.jpg&quot; alt=&quot;Static Image&quot;&gt;&lt;a href=&quot;#&quot;&gt;Bags&lt;\\/a&gt;&lt;\\/div&gt;\\r\\n\\t\\t&lt;\\/div&gt;\\r\\n\\t\\t&lt;div class=&quot;cate cate3&quot;&gt;\\r\\n\\t\\t&lt;div class=&quot;inner&quot;&gt;&lt;img src=&quot;image\\/catalog\\/demo\\/banners\\/home1\\/cate3.jpg&quot; alt=&quot;Static Image&quot;&gt;&lt;a href=&quot;#&quot;&gt;Swimwear&lt;\\/a&gt;&lt;\\/div&gt;\\r\\n\\t\\t&lt;\\/div&gt;\\r\\n\\t\\t&lt;div class=&quot;cate cate4&quot;&gt;\\r\\n\\t\\t&lt;div class=&quot;inner&quot;&gt;&lt;img src=&quot;image\\/catalog\\/demo\\/banners\\/home1\\/cate4.jpg&quot; alt=&quot;Static Image&quot;&gt;&lt;a href=&quot;#&quot;&gt;Shoes&lt;\\/a&gt;&lt;\\/div&gt;\\r\\n\\t\\t&lt;\\/div&gt;\\r\\n\\t\\t&lt;div class=&quot;cate cate5&quot;&gt;\\r\\n\\t\\t&lt;div class=&quot;inner&quot;&gt;&lt;img src=&quot;image\\/catalog\\/demo\\/banners\\/home1\\/cate5.jpg&quot; alt=&quot;Static Image&quot;&gt;&lt;a href=&quot;#&quot;&gt;Fashion&lt;\\/a&gt;&lt;\\/div&gt;\\r\\n\\t\\t&lt;\\/div&gt;\\r\\n\\t&lt;\\/div&gt;\\r\\n&lt;\\/div&gt;\"}},\"moduleid\":\"22\"}'),
	(11,'Mobile - Header Menu','so_html_content','{\"action\":\"save_edit\",\"name\":\"Mobile - Header Menu\",\"status\":\"1\",\"type_layout\":\"0\",\"class_suffix\":\"\",\"use_cache\":\"0\",\"cache_time\":\"3600\",\"module_description\":{\"1\":{\"title\":\"\",\"description\":\"&lt;div class=&quot;header-menu-page pull-left&quot;&gt;\\r\\n\\t&lt;div class=&quot;wrapper_menu&quot;&gt;\\r\\n\\t\\t&lt;ul id=&quot;menu-menu-mobile-1&quot; class=&quot;nav menu-mobile1 contentslider&quot; data-rtl=&quot;no&quot; data-autoplay=&quot;no&quot; data-autoheight=&quot;no&quot; data-autowidth=&quot;yes&quot; data-delay=&quot;4&quot; data-speed=&quot;0.6&quot; data-margin=&quot;10&quot; data-items_column3=&quot;4&quot; data-items_column4=&quot;4&quot; data-arrows=&quot;yes&quot; data-pagination=&quot;no&quot; data-lazyload=&quot;yes&quot; data-loop=&quot;no&quot; data-hoverpause=&quot;yes&quot;&gt;\\r\\n\\t\\t\\t&lt;li class=&quot;menu-new-arrivals&quot;&gt;&lt;a class=&quot;item-link&quot; href=&quot;#&quot;&gt;&lt;span class=&quot;menu-title&quot;&gt;New Arrivals&lt;\\/span&gt;&lt;\\/a&gt;&lt;\\/li&gt;\\r\\n\\t\\t\\t&lt;li class=&quot;menu-promotions&quot;&gt;&lt;a class=&quot;item-link&quot; href=&quot;#&quot;&gt;&lt;span class=&quot;menu-title&quot;&gt;Best Sellers&lt;\\/span&gt;&lt;\\/a&gt;&lt;\\/li&gt;\\r\\n\\t\\t\\t&lt;li class=&quot;menu-blog&quot;&gt;&lt;a class=&quot;item-link&quot; href=&quot;index.php?route=simple_blog\\/category&amp;amp;simple_blog_category_id=5&quot;&gt;&lt;span class=&quot;menu-title&quot;&gt;Blog&lt;\\/span&gt;&lt;\\/a&gt;&lt;\\/li&gt;\\r\\n\\t\\t\\t&lt;li class=&quot;menu-about-us&quot;&gt;&lt;a class=&quot;item-link&quot; href=&quot;index.php?route=information\\/information&amp;amp;information_id=4&quot;&gt;&lt;span class=&quot;menu-title&quot;&gt;About Us&lt;\\/span&gt;&lt;\\/a&gt;&lt;\\/li&gt;\\r\\n\\t\\t\\t&lt;li class=&quot;menu-contact-us&quot;&gt;&lt;a class=&quot;item-link&quot; href=&quot;index.php?route=information\\/contact&quot;&gt;&lt;span class=&quot;menu-title&quot;&gt;Contact Us&lt;\\/span&gt;&lt;\\/a&gt;&lt;\\/li&gt;\\r\\n\\t\\t&lt;\\/ul&gt;\\t\\t\\t\\t\\t\\t\\r\\n\\t&lt;\\/div&gt;\\r\\n&lt;\\/div&gt;\"},\"2\":{\"title\":\"\",\"description\":\"&lt;div class=&quot;header-menu-page pull-left&quot;&gt;\\r\\n\\t&lt;div class=&quot;wrapper_menu&quot;&gt;\\r\\n\\t\\t&lt;ul id=&quot;menu-menu-mobile-1&quot; class=&quot;nav menu-mobile1 contentslider&quot; data-rtl=&quot;no&quot; data-autoplay=&quot;no&quot; data-autoheight=&quot;no&quot; data-autowidth=&quot;yes&quot; data-delay=&quot;4&quot; data-speed=&quot;0.6&quot; data-margin=&quot;10&quot; data-items_column3=&quot;4&quot; data-items_column4=&quot;4&quot; data-arrows=&quot;yes&quot; data-pagination=&quot;no&quot; data-lazyload=&quot;yes&quot; data-loop=&quot;no&quot; data-hoverpause=&quot;yes&quot;&gt;\\r\\n\\t\\t\\t&lt;li class=&quot;menu-new-arrivals&quot;&gt;&lt;a class=&quot;item-link&quot; href=&quot;#&quot;&gt;&lt;span class=&quot;menu-title&quot;&gt;New Arrivals&lt;\\/span&gt;&lt;\\/a&gt;&lt;\\/li&gt;\\r\\n\\t\\t\\t&lt;li class=&quot;menu-promotions&quot;&gt;&lt;a class=&quot;item-link&quot; href=&quot;#&quot;&gt;&lt;span class=&quot;menu-title&quot;&gt;Best Sellers&lt;\\/span&gt;&lt;\\/a&gt;&lt;\\/li&gt;\\r\\n\\t\\t\\t&lt;li class=&quot;menu-blog&quot;&gt;&lt;a class=&quot;item-link&quot; href=&quot;index.php?route=simple_blog\\/category&amp;amp;simple_blog_category_id=5&quot;&gt;&lt;span class=&quot;menu-title&quot;&gt;Blog&lt;\\/span&gt;&lt;\\/a&gt;&lt;\\/li&gt;\\r\\n\\t\\t\\t&lt;li class=&quot;menu-about-us&quot;&gt;&lt;a class=&quot;item-link&quot; href=&quot;index.php?route=information\\/information&amp;amp;information_id=4&quot;&gt;&lt;span class=&quot;menu-title&quot;&gt;About Us&lt;\\/span&gt;&lt;\\/a&gt;&lt;\\/li&gt;\\r\\n\\t\\t\\t&lt;li class=&quot;menu-contact-us&quot;&gt;&lt;a class=&quot;item-link&quot; href=&quot;index.php?route=information\\/contact&quot;&gt;&lt;span class=&quot;menu-title&quot;&gt;Contact Us&lt;\\/span&gt;&lt;\\/a&gt;&lt;\\/li&gt;\\r\\n\\t\\t&lt;\\/ul&gt;\\t\\t\\t\\t\\t\\t\\r\\n\\t&lt;\\/div&gt;\\r\\n&lt;\\/div&gt;\"}},\"moduleid\":\"11\"}'),
	(12,'Mobile - Slide - Home 1','so_home_slider','{\"name\":\"Mobile - Slide - Home 1\",\"module_description\":{\"1\":{\"head_name\":\"Slidershow\"},\"2\":{\"head_name\":\"Slidershow\"}},\"head_name\":\"Slidershow\",\"disp_title_module\":\"0\",\"status\":\"1\",\"class_suffix\":\"\",\"item_link_target\":\"_self\",\"nb_column0\":\"1\",\"nb_column1\":\"1\",\"nb_column2\":\"1\",\"nb_column3\":\"1\",\"nb_column4\":\"1\",\"width\":\"480\",\"height\":\"130\",\"center\":\"0\",\"autoplay\":\"0\",\"autoplayTimeout\":\"5000\",\"autoplayHoverPause\":\"1\",\"autoplaySpeed\":\"1000\",\"startPosition\":\"0\",\"mouseDrag\":\"1\",\"touchDrag\":\"1\",\"loop\":\"1\",\"dots\":\"1\",\"navs\":\"0\",\"animateOut\":\"fadeOut\",\"animateIn\":\"fadeIn\",\"pre_text\":\"\",\"post_text\":\"\",\"use_cache\":\"0\",\"cache_time\":\"3600\",\"image\":\"\",\"slide_link\":\"\",\"slide_status\":\"1\",\"slide_description\":{\"1\":{\"slide_title\":\"\",\"language_id\":\"1\",\"slide_caption\":\"\",\"slide_desciption\":\" \"},\"2\":{\"slide_title\":\"\",\"language_id\":\"2\",\"slide_caption\":\"\",\"slide_desciption\":\" \"}},\"moduleid\":\"12\"}'),
	(13,'Mobile - Best Sellers','so_extra_slider','{\"action\":\"save_edit\",\"name\":\"Mobile - Best Sellers\",\"module_description\":{\"1\":{\"head_name\":\"Best Sellers\"},\"2\":{\"head_name\":\"Best Sellers\"}},\"head_name\":\"Best Sellers\",\"disp_title_module\":\"1\",\"status\":\"1\",\"type_layout\":\"0\",\"class_suffix\":\"mobile_deals\",\"item_link_target\":\"_self\",\"button_page\":\"top\",\"products_style\":\"style1\",\"nb_column0\":\"4\",\"nb_column1\":\"4\",\"nb_column2\":\"3\",\"nb_column3\":\"2\",\"nb_column4\":\"1\",\"nb_row\":\"1\",\"type_data\":\"category\",\"product_feature\":\"\",\"category\":[\"33\"],\"child_category\":\"1\",\"category_depth\":\"1\",\"product_sort\":\"p.price\",\"product_ordering\":\"ASC\",\"limitation\":\"6\",\"display_title\":\"1\",\"title_maxlength\":\"50\",\"display_description\":\"0\",\"description_maxlength\":\"100\",\"display_price\":\"1\",\"display_readmore_link\":\"0\",\"readmore_text\":\"Readmore\",\"display_add_to_cart\":\"0\",\"display_wishlist\":\"0\",\"display_compare\":\"0\",\"display_rating\":\"0\",\"display_sale\":\"1\",\"display_new\":\"1\",\"date_day\":\"227\",\"product_image_num\":\"1\",\"product_image\":\"1\",\"product_get_image_data\":\"1\",\"product_get_image_image\":\"1\",\"width\":\"160\",\"height\":\"160\",\"placeholder_path\":\"nophoto.png\",\"margin\":\"10\",\"slideBy\":\"1\",\"autoplay\":\"0\",\"autoplayTimeout\":\"5000\",\"autoplayHoverPause\":\"0\",\"autoplaySpeed\":\"1000\",\"startPosition\":\"0\",\"mouseDrag\":\"1\",\"touchDrag\":\"1\",\"effect\":\"none\",\"dots\":\"0\",\"dotsSpeed\":\"500\",\"loop\":\"1\",\"navs\":\"1\",\"navSpeed\":\"500\",\"duration\":\"800\",\"delay\":\"500\",\"pre_text\":\"\",\"post_text\":\"\",\"use_cache\":\"0\",\"cache_time\":\"3600\",\"moduleid\":\"13\"}'),
	(14,'Mobile - Top Deals','so_deals','{\"action\":\"save_edit\",\"name\":\"Mobile - Top Deals\",\"module_description\":{\"1\":{\"head_name\":\"Top Deals\"},\"2\":{\"head_name\":\"Top Deals\"}},\"head_name\":\"Top Deals\",\"disp_title_module\":\"1\",\"status\":\"1\",\"class_suffix\":\"mobile_deals \",\"item_link_target\":\"_self\",\"include_js\":\"owlCarousel\",\"nb_column0\":\"4\",\"nb_column1\":\"4\",\"nb_column2\":\"3\",\"nb_column3\":\"2\",\"nb_column4\":\"1\",\"nb_row\":\"1\",\"display_feature\":\"0\",\"product_feature\":\"\",\"position_thumbnail\":\"vertical\",\"category\":[\"25\",\"33\"],\"child_category\":\"1\",\"category_depth\":\"1\",\"product_sort\":\"p.price\",\"product_ordering\":\"ASC\",\"source_limit\":\"6\",\"display_title\":\"1\",\"title_maxlength\":\"50\",\"display_description\":\"0\",\"description_maxlength\":\"100\",\"display_countdown\":\"1\",\"display_price\":\"1\",\"display_addtocart\":\"0\",\"display_wishlist\":\"0\",\"display_compare\":\"0\",\"display_rating\":\"0\",\"display_sale\":\"1\",\"display_new\":\"1\",\"date_day\":\"227\",\"product_image_num\":\"1\",\"product_image\":\"1\",\"product_get_image_data\":\"1\",\"product_get_image_image\":\"1\",\"width\":\"160\",\"height\":\"160\",\"placeholder_path\":\"nophoto.png\",\"margin\":\"10\",\"slideBy\":\"1\",\"autoplay\":\"0\",\"autoplayTimeout\":\"5000\",\"autoplayHoverPause\":\"0\",\"autoplaySpeed\":\"1000\",\"startPosition\":\"0\",\"mouseDrag\":\"1\",\"touchDrag\":\"1\",\"loop\":\"1\",\"button_page\":\"top\",\"dots\":\"0\",\"dotsSpeed\":\"500\",\"navs\":\"1\",\"navSpeed\":\"500\",\"effect\":\"none\",\"duration\":\"800\",\"delay\":\"500\",\"store_layout\":\"default\",\"pre_text\":\"\",\"post_text\":\"\",\"use_cache\":\"0\",\"cache_time\":\"3600\",\"moduleid\":\"14\"}'),
	(15,'Mobile - Categories Featured','so_html_content','{\"action\":\"save_edit\",\"name\":\"Mobile - Categories Featured\",\"status\":\"1\",\"type_layout\":\"0\",\"class_suffix\":\"no-margin\",\"use_cache\":\"0\",\"cache_time\":\"3600\",\"module_description\":{\"1\":{\"title\":\"\",\"description\":\"&lt;div class=&quot;block-categories&quot;&gt;\\r\\n\\t&lt;h3 class=&quot;modtitle&quot;&gt;&lt;span&gt;Featured Categories&lt;\\/span&gt;&lt;\\/h3&gt;\\r\\n\\t&lt;div class=&quot;cate-content&quot;&gt;\\r\\n\\t\\t&lt;div class=&quot;cate cate1&quot;&gt;\\r\\n\\t\\t\\t&lt;div class=&quot;inner&quot;&gt;&lt;img src=&quot;image\\/catalog\\/demo\\/banners\\/home1\\/cate1.jpg&quot; alt=&quot;Static Image&quot;&gt;&lt;a href=&quot;index.php?route=mobile\\/home&quot;&gt;Watch&lt;\\/a&gt;&lt;\\/div&gt;\\r\\n\\t\\t&lt;\\/div&gt;\\r\\n\\t\\t&lt;div class=&quot;cate cate2&quot;&gt;\\r\\n\\t\\t&lt;div class=&quot;inner&quot;&gt;&lt;img src=&quot;image\\/catalog\\/demo\\/banners\\/home1\\/cate2.jpg&quot; alt=&quot;Static Image&quot;&gt;&lt;a href=&quot;index.php?route=mobile\\/home&quot;&gt;Bags&lt;\\/a&gt;&lt;\\/div&gt;\\r\\n\\t\\t&lt;\\/div&gt;\\r\\n\\t\\t&lt;div class=&quot;cate cate3&quot;&gt;\\r\\n\\t\\t&lt;div class=&quot;inner&quot;&gt;&lt;img src=&quot;image\\/catalog\\/demo\\/banners\\/home1\\/cate3.jpg&quot; alt=&quot;Static Image&quot;&gt;&lt;a href=&quot;index.php?route=mobile\\/home&quot;&gt;Swimwear&lt;\\/a&gt;&lt;\\/div&gt;\\r\\n\\t\\t&lt;\\/div&gt;\\r\\n\\t\\t&lt;div class=&quot;cate cate4&quot;&gt;\\r\\n\\t\\t&lt;div class=&quot;inner&quot;&gt;&lt;img src=&quot;image\\/catalog\\/demo\\/banners\\/home1\\/cate4.jpg&quot; alt=&quot;Static Image&quot;&gt;&lt;a href=&quot;index.php?route=mobile\\/home&quot;&gt;Shoes&lt;\\/a&gt;&lt;\\/div&gt;\\r\\n\\t\\t&lt;\\/div&gt;\\r\\n\\t\\t&lt;div class=&quot;cate cate5&quot;&gt;\\r\\n\\t\\t&lt;div class=&quot;inner&quot;&gt;&lt;img src=&quot;image\\/catalog\\/demo\\/banners\\/home1\\/cate5.jpg&quot; alt=&quot;Static Image&quot;&gt;&lt;a href=&quot;index.php?route=mobile\\/home&quot;&gt;Fashion&lt;\\/a&gt;&lt;\\/div&gt;\\r\\n\\t\\t&lt;\\/div&gt;\\r\\n\\t&lt;\\/div&gt;\\r\\n&lt;\\/div&gt;\"},\"2\":{\"title\":\"\",\"description\":\"&lt;div class=&quot;block-categories&quot;&gt;\\r\\n\\t&lt;h3 class=&quot;modtitle&quot;&gt;&lt;span&gt;Featured Categories&lt;\\/span&gt;&lt;\\/h3&gt;\\r\\n\\t&lt;div class=&quot;cate-content&quot;&gt;\\r\\n\\t\\t&lt;div class=&quot;cate cate1&quot;&gt;\\r\\n\\t\\t\\t&lt;div class=&quot;inner&quot;&gt;&lt;img src=&quot;image\\/catalog\\/demo\\/banners\\/home1\\/cate1.jpg&quot; alt=&quot;Static Image&quot;&gt;&lt;a href=&quot;index.php?route=mobile\\/home&quot;&gt;Watch&lt;\\/a&gt;&lt;\\/div&gt;\\r\\n\\t\\t&lt;\\/div&gt;\\r\\n\\t\\t&lt;div class=&quot;cate cate2&quot;&gt;\\r\\n\\t\\t&lt;div class=&quot;inner&quot;&gt;&lt;img src=&quot;image\\/catalog\\/demo\\/banners\\/home1\\/cate2.jpg&quot; alt=&quot;Static Image&quot;&gt;&lt;a href=&quot;index.php?route=mobile\\/home&quot;&gt;Bags&lt;\\/a&gt;&lt;\\/div&gt;\\r\\n\\t\\t&lt;\\/div&gt;\\r\\n\\t\\t&lt;div class=&quot;cate cate3&quot;&gt;\\r\\n\\t\\t&lt;div class=&quot;inner&quot;&gt;&lt;img src=&quot;image\\/catalog\\/demo\\/banners\\/home1\\/cate3.jpg&quot; alt=&quot;Static Image&quot;&gt;&lt;a href=&quot;index.php?route=mobile\\/home&quot;&gt;Swimwear&lt;\\/a&gt;&lt;\\/div&gt;\\r\\n\\t\\t&lt;\\/div&gt;\\r\\n\\t\\t&lt;div class=&quot;cate cate4&quot;&gt;\\r\\n\\t\\t&lt;div class=&quot;inner&quot;&gt;&lt;img src=&quot;image\\/catalog\\/demo\\/banners\\/home1\\/cate4.jpg&quot; alt=&quot;Static Image&quot;&gt;&lt;a href=&quot;index.php?route=mobile\\/home&quot;&gt;Shoes&lt;\\/a&gt;&lt;\\/div&gt;\\r\\n\\t\\t&lt;\\/div&gt;\\r\\n\\t\\t&lt;div class=&quot;cate cate5&quot;&gt;\\r\\n\\t\\t&lt;div class=&quot;inner&quot;&gt;&lt;img src=&quot;image\\/catalog\\/demo\\/banners\\/home1\\/cate5.jpg&quot; alt=&quot;Static Image&quot;&gt;&lt;a href=&quot;index.php?route=mobile\\/home&quot;&gt;Fashion&lt;\\/a&gt;&lt;\\/div&gt;\\r\\n\\t\\t&lt;\\/div&gt;\\r\\n\\t&lt;\\/div&gt;\\r\\n&lt;\\/div&gt;\"}},\"moduleid\":\"15\"}'),
	(18,'Mobile - Slide - Home 2','so_home_slider','{\"name\":\"Mobile - Slide - Home 2\",\"module_description\":{\"1\":{\"head_name\":\"Slide\"},\"2\":{\"head_name\":\"Slide\"}},\"head_name\":\"Slide\",\"disp_title_module\":\"0\",\"status\":\"1\",\"class_suffix\":\"\",\"item_link_target\":\"_self\",\"nb_column0\":\"1\",\"nb_column1\":\"1\",\"nb_column2\":\"1\",\"nb_column3\":\"1\",\"nb_column4\":\"1\",\"width\":\"480\",\"height\":\"160\",\"center\":\"0\",\"autoplay\":\"0\",\"autoplayTimeout\":\"5000\",\"autoplayHoverPause\":\"1\",\"autoplaySpeed\":\"1000\",\"startPosition\":\"0\",\"mouseDrag\":\"1\",\"touchDrag\":\"1\",\"loop\":\"0\",\"dots\":\"1\",\"navs\":\"0\",\"animateOut\":\"bounceOut\",\"animateIn\":\"bounceIn\",\"pre_text\":\"\",\"post_text\":\"\",\"use_cache\":\"0\",\"cache_time\":\"3600\",\"image\":\"\",\"slide_link\":\"\",\"slide_status\":\"1\",\"slide_description\":{\"1\":{\"slide_title\":\"\",\"language_id\":\"1\",\"slide_caption\":\"\",\"slide_desciption\":\" \"},\"2\":{\"slide_title\":\"\",\"language_id\":\"2\",\"slide_caption\":\"\",\"slide_desciption\":\" \"}},\"moduleid\":\"18\"}'),
	(19,'Mobile - Bestseller','so_listing_tabs','{\"action\":\"save_edit\",\"name\":\"Mobile - Bestseller\",\"module_description\":{\"1\":{\"head_name\":\"Bestseller\"},\"2\":{\"head_name\":\"Bestseller\"}},\"head_name\":\"Bestseller\",\"disp_title_module\":\"0\",\"status\":\"1\",\"type_layout\":\"0\",\"class_suffix\":\"mobile_listing\",\"item_link_target\":\"_self\",\"nb_column0\":\"4\",\"nb_column1\":\"4\",\"nb_column2\":\"3\",\"nb_column3\":\"2\",\"nb_column4\":\"2\",\"type_show\":\"slider\",\"nb_row\":\"1\",\"type_source\":\"1\",\"category\":[\"33\"],\"child_category\":\"1\",\"category_depth\":\"1\",\"product_sort\":\"p.price\",\"product_ordering\":\"ASC\",\"source_limit\":\"5\",\"catid_preload\":\"*\",\"field_product_tab\":[\"p_date_added\",\"sell\"],\"field_preload\":\"sell\",\"tab_all_display\":\"1\",\"tab_max_characters\":\"25\",\"tab_icon_display\":\"1\",\"cat_order_by\":\"name\",\"imgcfgcat_width\":\"30\",\"imgcfgcat_height\":\"30\",\"display_title\":\"1\",\"title_maxlength\":\"50\",\"display_description\":\"0\",\"description_maxlength\":\"100\",\"display_price\":\"1\",\"display_add_to_cart\":\"0\",\"display_wishlist\":\"0\",\"display_compare\":\"0\",\"display_rating\":\"0\",\"display_sale\":\"1\",\"display_new\":\"1\",\"date_day\":\"7\",\"product_image_num\":\"1\",\"product_image\":\"1\",\"product_get_image_data\":\"1\",\"product_get_image_image\":\"1\",\"width\":\"160\",\"height\":\"160\",\"product_placeholder_path\":\"nophoto.png\",\"display_banner_image\":\"0\",\"banner_image\":\"no_image.png\",\"banner_width\":\"150\",\"banner_height\":\"250\",\"banner_image_url\":\"\",\"effect\":\"none\",\"margin\":\"10\",\"duration\":\"800\",\"delay\":\"500\",\"autoplay\":\"0\",\"display_nav\":\"1\",\"display_loop\":\"1\",\"touchdrag\":\"1\",\"mousedrag\":\"1\",\"pausehover\":\"0\",\"autoplayTimeout\":\"5000\",\"autoplaySpeed\":\"1000\",\"pre_text\":\"\",\"post_text\":\"\",\"use_cache\":\"0\",\"cache_time\":\"3600\",\"moduleid\":\"19\"}'),
	(23,'Mobile - New Arrivals','so_extra_slider','{\"action\":\"\",\"name\":\"Mobile - New Arrivals\",\"module_description\":{\"1\":{\"head_name\":\"New Arrivals\"},\"2\":{\"head_name\":\"New Arrivals\"}},\"head_name\":\"New Arrivals\",\"disp_title_module\":\"1\",\"status\":\"1\",\"type_layout\":\"0\",\"class_suffix\":\"mobile_deals\",\"item_link_target\":\"_self\",\"button_page\":\"top\",\"products_style\":\"style1\",\"nb_column0\":\"4\",\"nb_column1\":\"4\",\"nb_column2\":\"3\",\"nb_column3\":\"2\",\"nb_column4\":\"1\",\"nb_row\":\"1\",\"type_data\":\"category\",\"product_feature\":\"\",\"category\":[\"25\",\"79\"],\"child_category\":\"1\",\"category_depth\":\"1\",\"product_sort\":\"p.price\",\"product_ordering\":\"ASC\",\"limitation\":\"6\",\"display_title\":\"1\",\"title_maxlength\":\"50\",\"display_description\":\"0\",\"description_maxlength\":\"100\",\"display_price\":\"1\",\"display_readmore_link\":\"0\",\"readmore_text\":\"Readmore\",\"display_add_to_cart\":\"0\",\"display_wishlist\":\"0\",\"display_compare\":\"0\",\"display_rating\":\"0\",\"display_sale\":\"1\",\"display_new\":\"1\",\"date_day\":\"7\",\"product_image_num\":\"1\",\"product_image\":\"1\",\"product_get_image_data\":\"1\",\"product_get_image_image\":\"1\",\"width\":\"160\",\"height\":\"160\",\"placeholder_path\":\"nophoto.png\",\"margin\":\"10\",\"slideBy\":\"1\",\"autoplay\":\"0\",\"autoplayTimeout\":\"5000\",\"autoplayHoverPause\":\"0\",\"autoplaySpeed\":\"1000\",\"startPosition\":\"0\",\"mouseDrag\":\"1\",\"touchDrag\":\"1\",\"effect\":\"none\",\"dots\":\"0\",\"dotsSpeed\":\"500\",\"loop\":\"1\",\"navs\":\"1\",\"navSpeed\":\"500\",\"duration\":\"800\",\"delay\":\"500\",\"pre_text\":\"\",\"post_text\":\"\",\"use_cache\":\"0\",\"cache_time\":\"3600\",\"moduleid\":\"23\"}'),
	(331,'Home 1 - Page Builder','so_page_builder','{\"page_builder\":\"[{\\\"text_class_id\\\":\\\"row_a90w\\\",\\\"text_class\\\":\\\"row-style\\\",\\\"text_color\\\":\\\"#000000\\\",\\\"link_color\\\":\\\"#000000\\\",\\\"link_hover_color\\\":\\\"#000000\\\",\\\"heading_color\\\":\\\"#000000\\\",\\\"background_type\\\":\\\"0\\\",\\\"bg_color\\\":\\\"#FFFFFF\\\",\\\"bg_opacity\\\":\\\"100%\\\",\\\"bg_image\\\":\\\"\\\",\\\"bg_repeat\\\":\\\"no-repeat\\\",\\\"bg_position\\\":\\\"center center\\\",\\\"bg_attachment\\\":\\\"fixed\\\",\\\"bg_scale\\\":\\\"cover\\\",\\\"video_type\\\":\\\"0\\\",\\\"link_video\\\":\\\"YE7VzlLtp-4\\\",\\\"margin\\\":\\\"\\\",\\\"padding\\\":\\\"\\\",\\\"row_container_fluid\\\":\\\"0\\\",\\\"row_section\\\":\\\"0\\\",\\\"row_section_class\\\":\\\"section-style\\\",\\\"row_section_id\\\":\\\"\\\",\\\"section_background_type\\\":\\\"0\\\",\\\"section_bg_color\\\":\\\"#FFFFFF\\\",\\\"section_bg_opacity\\\":\\\"100%\\\",\\\"section_bg_image\\\":\\\"\\\",\\\"section_bg_repeat\\\":\\\"no-repeat\\\",\\\"section_bg_position\\\":\\\"center center\\\",\\\"section_bg_attachment\\\":\\\"fixed\\\",\\\"section_bg_scale\\\":\\\"cover\\\",\\\"section_video_type\\\":\\\"0\\\",\\\"section_link_video\\\":\\\"YE7VzlLtp-4\\\",\\\"cols\\\":[{\\\"text_class_id\\\":\\\"col_anla\\\",\\\"text_class\\\":\\\"slider-right\\\",\\\"text_color\\\":\\\"#000000\\\",\\\"link_color\\\":\\\"#000000\\\",\\\"link_hover_color\\\":\\\"#000000\\\",\\\"heading_color\\\":\\\"#000000\\\",\\\"background_type\\\":\\\"0\\\",\\\"bg_color\\\":\\\"#FFFFFF\\\",\\\"bg_opacity\\\":\\\"100%\\\",\\\"bg_image\\\":\\\"\\\",\\\"bg_repeat\\\":\\\"no-repeat\\\",\\\"bg_position\\\":\\\"center center\\\",\\\"bg_attachment\\\":\\\"fixed\\\",\\\"bg_scale\\\":\\\"cover\\\",\\\"col_video_type\\\":\\\"0\\\",\\\"col_link_video\\\":\\\"YE7VzlLtp-4\\\",\\\"padding\\\":\\\"\\\",\\\"margin\\\":\\\"10px\\\",\\\"lg_col\\\":12,\\\"md_col\\\":\\\"9\\\",\\\"sm_col\\\":\\\"12\\\",\\\"xs_col\\\":\\\"12\\\",\\\"widgets\\\":[{\\\"name\\\":\\\"Home Page - Slideshow\\\",\\\"module\\\":\\\"so_home_slider.194\\\",\\\"type\\\":\\\"module\\\"}],\\\"rows\\\":[]}]},{\\\"text_class_id\\\":\\\"row_mri4\\\",\\\"text_class\\\":\\\"page-content row-style\\\",\\\"text_color\\\":\\\"#000000\\\",\\\"link_color\\\":\\\"#000000\\\",\\\"link_hover_color\\\":\\\"#000000\\\",\\\"heading_color\\\":\\\"#000000\\\",\\\"background_type\\\":\\\"0\\\",\\\"bg_color\\\":\\\"#FFFFFF\\\",\\\"bg_opacity\\\":\\\"100%\\\",\\\"bg_image\\\":\\\"\\\",\\\"bg_repeat\\\":\\\"no-repeat\\\",\\\"bg_position\\\":\\\"center center\\\",\\\"bg_attachment\\\":\\\"fixed\\\",\\\"bg_scale\\\":\\\"cover\\\",\\\"video_type\\\":\\\"0\\\",\\\"link_video\\\":\\\"YE7VzlLtp-4\\\",\\\"margin\\\":\\\"\\\",\\\"padding\\\":\\\"\\\",\\\"row_container_fluid\\\":\\\"0\\\",\\\"row_section\\\":\\\"0\\\",\\\"row_section_class\\\":\\\"section-style\\\",\\\"row_section_id\\\":\\\"\\\",\\\"section_background_type\\\":\\\"0\\\",\\\"section_bg_color\\\":\\\"#FFFFFF\\\",\\\"section_bg_opacity\\\":\\\"100%\\\",\\\"section_bg_image\\\":\\\"\\\",\\\"section_bg_repeat\\\":\\\"no-repeat\\\",\\\"section_bg_position\\\":\\\"center center\\\",\\\"section_bg_attachment\\\":\\\"fixed\\\",\\\"section_bg_scale\\\":\\\"cover\\\",\\\"section_video_type\\\":\\\"0\\\",\\\"section_link_video\\\":\\\"YE7VzlLtp-4\\\",\\\"cols\\\":[{\\\"text_class_id\\\":\\\"col_gsvy\\\",\\\"text_class\\\":\\\"block block_3 title_neo1\\\",\\\"text_color\\\":\\\"#000000\\\",\\\"link_color\\\":\\\"#000000\\\",\\\"link_hover_color\\\":\\\"#000000\\\",\\\"heading_color\\\":\\\"#000000\\\",\\\"background_type\\\":\\\"0\\\",\\\"bg_color\\\":\\\"#FFFFFF\\\",\\\"bg_opacity\\\":\\\"100%\\\",\\\"bg_image\\\":\\\"\\\",\\\"bg_repeat\\\":\\\"no-repeat\\\",\\\"bg_position\\\":\\\"center center\\\",\\\"bg_attachment\\\":\\\"fixed\\\",\\\"bg_scale\\\":\\\"cover\\\",\\\"col_video_type\\\":\\\"0\\\",\\\"col_link_video\\\":\\\"YE7VzlLtp-4\\\",\\\"padding\\\":\\\"\\\",\\\"margin\\\":\\\"\\\",\\\"lg_col\\\":\\\"12\\\",\\\"md_col\\\":\\\"12\\\",\\\"sm_col\\\":\\\"12\\\",\\\"xs_col\\\":\\\"12\\\",\\\"widgets\\\":[{\\\"name\\\":\\\"Home 1 - Hot Deals\\\",\\\"module\\\":\\\"so_deals.129\\\",\\\"type\\\":\\\"module\\\"}],\\\"rows\\\":[]},{\\\"text_class_id\\\":\\\"col_nvxr\\\",\\\"text_class\\\":\\\"block block_6 title_neo3\\\",\\\"text_color\\\":\\\"#000000\\\",\\\"link_color\\\":\\\"#000000\\\",\\\"link_hover_color\\\":\\\"#000000\\\",\\\"heading_color\\\":\\\"#000000\\\",\\\"background_type\\\":\\\"0\\\",\\\"bg_color\\\":\\\"#FFFFFF\\\",\\\"bg_opacity\\\":\\\"100%\\\",\\\"bg_image\\\":\\\"\\\",\\\"bg_repeat\\\":\\\"no-repeat\\\",\\\"bg_position\\\":\\\"center center\\\",\\\"bg_attachment\\\":\\\"fixed\\\",\\\"bg_scale\\\":\\\"cover\\\",\\\"col_video_type\\\":\\\"0\\\",\\\"col_link_video\\\":\\\"YE7VzlLtp-4\\\",\\\"padding\\\":\\\"\\\",\\\"margin\\\":\\\"\\\",\\\"lg_col\\\":\\\"12\\\",\\\"md_col\\\":\\\"12\\\",\\\"sm_col\\\":\\\"12\\\",\\\"xs_col\\\":\\\"12\\\",\\\"widgets\\\":[{\\\"name\\\":\\\"Home 1 - Fashion & Accessories\\\",\\\"module\\\":\\\"so_listing_tabs.297\\\",\\\"type\\\":\\\"module\\\"}],\\\"rows\\\":[]},{\\\"text_class_id\\\":\\\"col_siw1\\\",\\\"text_class\\\":\\\"block block_9\\\",\\\"text_color\\\":\\\"#000000\\\",\\\"link_color\\\":\\\"#000000\\\",\\\"link_hover_color\\\":\\\"#000000\\\",\\\"heading_color\\\":\\\"#000000\\\",\\\"background_type\\\":\\\"0\\\",\\\"bg_color\\\":\\\"#FFFFFF\\\",\\\"bg_opacity\\\":\\\"100%\\\",\\\"bg_image\\\":\\\"\\\",\\\"bg_repeat\\\":\\\"no-repeat\\\",\\\"bg_position\\\":\\\"center center\\\",\\\"bg_attachment\\\":\\\"fixed\\\",\\\"bg_scale\\\":\\\"cover\\\",\\\"col_video_type\\\":\\\"0\\\",\\\"col_link_video\\\":\\\"YE7VzlLtp-4\\\",\\\"padding\\\":\\\"\\\",\\\"margin\\\":\\\"\\\",\\\"lg_col\\\":\\\"4\\\",\\\"md_col\\\":\\\"4\\\",\\\"sm_col\\\":\\\"12\\\",\\\"xs_col\\\":\\\"12\\\",\\\"widgets\\\":[{\\\"name\\\":\\\"Home1 - Sport & Entertaiment\\\",\\\"module\\\":\\\"so_extra_slider.300\\\",\\\"type\\\":\\\"module\\\"}],\\\"rows\\\":[]},{\\\"text_class_id\\\":\\\"col_fm89\\\",\\\"text_class\\\":\\\"block block_9\\\",\\\"text_color\\\":\\\"#000000\\\",\\\"link_color\\\":\\\"#000000\\\",\\\"link_hover_color\\\":\\\"#000000\\\",\\\"heading_color\\\":\\\"#000000\\\",\\\"background_type\\\":\\\"0\\\",\\\"bg_color\\\":\\\"#FFFFFF\\\",\\\"bg_opacity\\\":\\\"100%\\\",\\\"bg_image\\\":\\\"\\\",\\\"bg_repeat\\\":\\\"no-repeat\\\",\\\"bg_position\\\":\\\"center center\\\",\\\"bg_attachment\\\":\\\"fixed\\\",\\\"bg_scale\\\":\\\"cover\\\",\\\"col_video_type\\\":\\\"0\\\",\\\"col_link_video\\\":\\\"YE7VzlLtp-4\\\",\\\"padding\\\":\\\"\\\",\\\"margin\\\":\\\"\\\",\\\"lg_col\\\":\\\"4\\\",\\\"md_col\\\":\\\"4\\\",\\\"sm_col\\\":\\\"12\\\",\\\"xs_col\\\":\\\"12\\\",\\\"widgets\\\":[{\\\"name\\\":\\\"Home 1 - Food & Restaurant\\\",\\\"module\\\":\\\"so_extra_slider.301\\\",\\\"type\\\":\\\"module\\\"}],\\\"rows\\\":[]},{\\\"text_class_id\\\":\\\"col_16k5\\\",\\\"text_class\\\":\\\"block block_9\\\",\\\"text_color\\\":\\\"#000000\\\",\\\"link_color\\\":\\\"#000000\\\",\\\"link_hover_color\\\":\\\"#000000\\\",\\\"heading_color\\\":\\\"#000000\\\",\\\"background_type\\\":\\\"0\\\",\\\"bg_color\\\":\\\"#FFFFFF\\\",\\\"bg_opacity\\\":\\\"100%\\\",\\\"bg_image\\\":\\\"\\\",\\\"bg_repeat\\\":\\\"no-repeat\\\",\\\"bg_position\\\":\\\"center center\\\",\\\"bg_attachment\\\":\\\"fixed\\\",\\\"bg_scale\\\":\\\"cover\\\",\\\"col_video_type\\\":\\\"0\\\",\\\"col_link_video\\\":\\\"YE7VzlLtp-4\\\",\\\"padding\\\":\\\"\\\",\\\"margin\\\":\\\"\\\",\\\"lg_col\\\":\\\"4\\\",\\\"md_col\\\":\\\"4\\\",\\\"sm_col\\\":\\\"12\\\",\\\"xs_col\\\":\\\"12\\\",\\\"widgets\\\":[{\\\"name\\\":\\\"Home 1 - Book Stationery\\\",\\\"module\\\":\\\"so_extra_slider.302\\\",\\\"type\\\":\\\"module\\\"}],\\\"rows\\\":[]},{\\\"text_class_id\\\":\\\"col_swee\\\",\\\"text_class\\\":\\\"block block_12\\\",\\\"text_color\\\":\\\"#000000\\\",\\\"link_color\\\":\\\"#000000\\\",\\\"link_hover_color\\\":\\\"#000000\\\",\\\"heading_color\\\":\\\"#000000\\\",\\\"background_type\\\":\\\"0\\\",\\\"bg_color\\\":\\\"#FFFFFF\\\",\\\"bg_opacity\\\":\\\"100%\\\",\\\"bg_image\\\":\\\"\\\",\\\"bg_repeat\\\":\\\"no-repeat\\\",\\\"bg_position\\\":\\\"center center\\\",\\\"bg_attachment\\\":\\\"fixed\\\",\\\"bg_scale\\\":\\\"cover\\\",\\\"col_video_type\\\":\\\"0\\\",\\\"col_link_video\\\":\\\"YE7VzlLtp-4\\\",\\\"padding\\\":\\\"\\\",\\\"margin\\\":\\\"\\\",\\\"lg_col\\\":\\\"12\\\",\\\"md_col\\\":\\\"12\\\",\\\"sm_col\\\":\\\"12\\\",\\\"xs_col\\\":\\\"12\\\",\\\"widgets\\\":[{\\\"name\\\":\\\"Content Slider\\\",\\\"module\\\":\\\"content_slider_mfn4\\\",\\\"type\\\":\\\"shortcode\\\",\\\"shortcode\\\":\\\"content_slider\\\",\\\"content\\\":\\\"{\\\\\\\"cparent\\\\\\\":[{\\\\\\\"name_shortcode_1\\\\\\\":\\\\\\\"Home 1 - Brand Slider\\\\\\\",\\\\\\\"name_shortcode_2\\\\\\\":\\\\\\\"Home 1 - Brand Slider\\\\\\\",\\\\\\\"name_shortcode_status\\\\\\\":\\\\\\\"no\\\\\\\",\\\\\\\"style\\\\\\\":\\\\\\\"default\\\\\\\",\\\\\\\"margin\\\\\\\":\\\\\\\"10\\\\\\\",\\\\\\\"items_column0\\\\\\\":\\\\\\\"6\\\\\\\",\\\\\\\"items_column1\\\\\\\":\\\\\\\"5\\\\\\\",\\\\\\\"items_column2\\\\\\\":\\\\\\\"4\\\\\\\",\\\\\\\"items_column3\\\\\\\":\\\\\\\"3\\\\\\\",\\\\\\\"items_column4\\\\\\\":\\\\\\\"2\\\\\\\",\\\\\\\"type_change\\\\\\\":\\\\\\\"fade\\\\\\\",\\\\\\\"transitionin\\\\\\\":\\\\\\\"fadeIn\\\\\\\",\\\\\\\"transitionout\\\\\\\":\\\\\\\"fadeOut\\\\\\\",\\\\\\\"arrows\\\\\\\":\\\\\\\"yes\\\\\\\",\\\\\\\"arrow_position\\\\\\\":\\\\\\\"arrow-default\\\\\\\",\\\\\\\"pagination\\\\\\\":\\\\\\\"no\\\\\\\",\\\\\\\"autoplay\\\\\\\":\\\\\\\"yes\\\\\\\",\\\\\\\"autoheight\\\\\\\":\\\\\\\"no\\\\\\\",\\\\\\\"hoverpause\\\\\\\":\\\\\\\"yes\\\\\\\",\\\\\\\"lazyload\\\\\\\":\\\\\\\"no\\\\\\\",\\\\\\\"loop\\\\\\\":\\\\\\\"yes\\\\\\\",\\\\\\\"speed\\\\\\\":\\\\\\\"0.6\\\\\\\",\\\\\\\"delay\\\\\\\":\\\\\\\"4\\\\\\\",\\\\\\\"yt_class\\\\\\\":\\\\\\\"top-brand\\\\\\\",\\\\\\\"css_internal\\\\\\\":\\\\\\\"\\\\\\\"}],\\\\\\\"cchild\\\\\\\":{\\\\\\\"child1\\\\\\\":{\\\\\\\"src\\\\\\\":\\\\\\\"catalog\\/demo\\/brand\\/brand-1.jpg\\\\\\\",\\\\\\\"caption\\\\\\\":\\\\\\\"no\\\\\\\",\\\\\\\"link\\\\\\\":\\\\\\\"#\\\\\\\",\\\\\\\"content_1\\\\\\\":\\\\\\\"Add content here\\\\\\\",\\\\\\\"content_2\\\\\\\":\\\\\\\"Add content here\\\\\\\"},\\\\\\\"child2\\\\\\\":{\\\\\\\"src\\\\\\\":\\\\\\\"catalog\\/demo\\/brand\\/brand-2.jpg\\\\\\\",\\\\\\\"caption\\\\\\\":\\\\\\\"no\\\\\\\",\\\\\\\"link\\\\\\\":\\\\\\\"#\\\\\\\",\\\\\\\"content_1\\\\\\\":\\\\\\\"Add content here\\\\\\\",\\\\\\\"content_2\\\\\\\":\\\\\\\"Add content here\\\\\\\"},\\\\\\\"child3\\\\\\\":{\\\\\\\"src\\\\\\\":\\\\\\\"catalog\\/demo\\/brand\\/brand-3.jpg\\\\\\\",\\\\\\\"caption\\\\\\\":\\\\\\\"no\\\\\\\",\\\\\\\"link\\\\\\\":\\\\\\\"#\\\\\\\",\\\\\\\"content_1\\\\\\\":\\\\\\\"Add content here\\\\\\\",\\\\\\\"content_2\\\\\\\":\\\\\\\"Add content here\\\\\\\"},\\\\\\\"child4\\\\\\\":{\\\\\\\"src\\\\\\\":\\\\\\\"catalog\\/demo\\/brand\\/brand-4.jpg\\\\\\\",\\\\\\\"caption\\\\\\\":\\\\\\\"no\\\\\\\",\\\\\\\"link\\\\\\\":\\\\\\\"#\\\\\\\",\\\\\\\"content_1\\\\\\\":\\\\\\\"Add content here\\\\\\\",\\\\\\\"content_2\\\\\\\":\\\\\\\"Add content here\\\\\\\"},\\\\\\\"child5\\\\\\\":{\\\\\\\"src\\\\\\\":\\\\\\\"catalog\\/demo\\/brand\\/brand-5.jpg\\\\\\\",\\\\\\\"caption\\\\\\\":\\\\\\\"no\\\\\\\",\\\\\\\"link\\\\\\\":\\\\\\\"\\\\\\\",\\\\\\\"content_1\\\\\\\":\\\\\\\"Add content here\\\\\\\",\\\\\\\"content_2\\\\\\\":\\\\\\\"Add content here\\\\\\\"},\\\\\\\"child6\\\\\\\":{\\\\\\\"src\\\\\\\":\\\\\\\"catalog\\/demo\\/brand\\/brand-6.jpg\\\\\\\",\\\\\\\"caption\\\\\\\":\\\\\\\"no\\\\\\\",\\\\\\\"link\\\\\\\":\\\\\\\"\\\\\\\",\\\\\\\"content_1\\\\\\\":\\\\\\\"Add content here\\\\\\\",\\\\\\\"content_2\\\\\\\":\\\\\\\"Add content here\\\\\\\"},\\\\\\\"child7\\\\\\\":{\\\\\\\"src\\\\\\\":\\\\\\\"catalog\\/demo\\/brand\\/brand-3.jpg\\\\\\\",\\\\\\\"caption\\\\\\\":\\\\\\\"no\\\\\\\",\\\\\\\"link\\\\\\\":\\\\\\\"\\\\\\\",\\\\\\\"content_1\\\\\\\":\\\\\\\"Add content here\\\\\\\",\\\\\\\"content_2\\\\\\\":\\\\\\\"Add content here\\\\\\\"}}}\\\"}],\\\"rows\\\":[]}]}]\",\"name\":\"Home 1 - Page Builder\",\"status\":\"1\",\"import_theme\":\"0\",\"content_shortcode\":\"{&quot;cparent&quot;:[{&quot;name_shortcode_1&quot;:&quot;Home 1 - Brand Slider&quot;,&quot;name_shortcode_2&quot;:&quot;Home 1 - Brand Slider&quot;,&quot;name_shortcode_status&quot;:&quot;no&quot;,&quot;style&quot;:&quot;default&quot;,&quot;margin&quot;:&quot;10&quot;,&quot;items_column0&quot;:&quot;6&quot;,&quot;items_column1&quot;:&quot;5&quot;,&quot;items_column2&quot;:&quot;4&quot;,&quot;items_column3&quot;:&quot;3&quot;,&quot;items_column4&quot;:&quot;2&quot;,&quot;type_change&quot;:&quot;fade&quot;,&quot;transitionin&quot;:&quot;fadeIn&quot;,&quot;transitionout&quot;:&quot;fadeOut&quot;,&quot;arrows&quot;:&quot;yes&quot;,&quot;arrow_position&quot;:&quot;arrow-default&quot;,&quot;pagination&quot;:&quot;no&quot;,&quot;autoplay&quot;:&quot;yes&quot;,&quot;autoheight&quot;:&quot;no&quot;,&quot;hoverpause&quot;:&quot;yes&quot;,&quot;lazyload&quot;:&quot;no&quot;,&quot;loop&quot;:&quot;yes&quot;,&quot;speed&quot;:&quot;0.6&quot;,&quot;delay&quot;:&quot;4&quot;,&quot;yt_class&quot;:&quot;top-brand&quot;,&quot;css_internal&quot;:&quot;&quot;}],&quot;cchild&quot;:{&quot;child1&quot;:{&quot;src&quot;:&quot;catalog\\/demo\\/brand\\/brand-1.jpg&quot;,&quot;caption&quot;:&quot;no&quot;,&quot;link&quot;:&quot;#&quot;,&quot;content_1&quot;:&quot;Add content here&quot;,&quot;content_2&quot;:&quot;Add content here&quot;},&quot;child2&quot;:{&quot;src&quot;:&quot;catalog\\/demo\\/brand\\/brand-2.jpg&quot;,&quot;caption&quot;:&quot;no&quot;,&quot;link&quot;:&quot;#&quot;,&quot;content_1&quot;:&quot;Add content here&quot;,&quot;content_2&quot;:&quot;Add content here&quot;},&quot;child3&quot;:{&quot;src&quot;:&quot;catalog\\/demo\\/brand\\/brand-3.jpg&quot;,&quot;caption&quot;:&quot;no&quot;,&quot;link&quot;:&quot;#&quot;,&quot;content_1&quot;:&quot;Add content here&quot;,&quot;content_2&quot;:&quot;Add content here&quot;},&quot;child4&quot;:{&quot;src&quot;:&quot;catalog\\/demo\\/brand\\/brand-4.jpg&quot;,&quot;caption&quot;:&quot;no&quot;,&quot;link&quot;:&quot;#&quot;,&quot;content_1&quot;:&quot;Add content here&quot;,&quot;content_2&quot;:&quot;Add content here&quot;},&quot;child5&quot;:{&quot;src&quot;:&quot;catalog\\/demo\\/brand\\/brand-5.jpg&quot;,&quot;caption&quot;:&quot;no&quot;,&quot;link&quot;:&quot;&quot;,&quot;content_1&quot;:&quot;Add content here&quot;,&quot;content_2&quot;:&quot;Add content here&quot;},&quot;child6&quot;:{&quot;src&quot;:&quot;catalog\\/demo\\/brand\\/brand-6.jpg&quot;,&quot;caption&quot;:&quot;no&quot;,&quot;link&quot;:&quot;&quot;,&quot;content_1&quot;:&quot;Add content here&quot;,&quot;content_2&quot;:&quot;Add content here&quot;},&quot;child7&quot;:{&quot;src&quot;:&quot;catalog\\/demo\\/brand\\/brand-3.jpg&quot;,&quot;caption&quot;:&quot;no&quot;,&quot;link&quot;:&quot;&quot;,&quot;content_1&quot;:&quot;Add content here&quot;,&quot;content_2&quot;:&quot;Add content here&quot;}}}\",\"moduleid\":\"331\"}'),
	(336,'So Social Login','so_sociallogin','{\"so_sociallogin_name\":\"So Social Login\",\"so_sociallogin_width\":\"130\",\"so_sociallogin_height\":\"35\",\"so_sociallogin_button\":\"icon\",\"so_sociallogin_status\":\"1\",\"so_sociallogin_popuplogin\":\"1\",\"so_sociallogin_fbtitle\":\"Facebook Login\",\"so_sociallogin_fbimage\":\"catalog\\/sociallogin\\/fb.png\",\"so_sociallogin_fbapikey\":\"273987359678940\",\"so_sociallogin_fbsecretapi\":\"08399f0a037cdb5b975f753516922914\",\"so_sociallogin_fbstatus\":\"1\",\"so_sociallogin_twittertitle\":\"Twitter Login\",\"so_sociallogin_twitimage\":\"catalog\\/sociallogin\\/twitter.png\",\"so_sociallogin_twitapikey\":\"EEJ3pjetfaHXrOw54ZyjATQGw\",\"so_sociallogin_twitsecretapi\":\"i7kGpUlhPsEmb4AkmaSQ2kFqgBM2U1nYs7ijHGk2f65J0672mP\",\"so_sociallogin_twitstatus\":\"1\",\"so_sociallogin_googletitle\":\"Google Login\",\"so_sociallogin_googleimage\":\"catalog\\/sociallogin\\/google.png\",\"so_sociallogin_googleapikey\":\"21690390667-tco9t3ca2o89d3sshkb2fmppoioq5mfq.apps.googleusercontent.com\",\"so_sociallogin_googlesecretapi\":\"COYNPrxaLq42QdIM2XBPASna\",\"so_sociallogin_googlestatus\":\"1\",\"so_sociallogin_linkedintitle\":\"Linkedin Login\",\"so_sociallogin_linkdinimage\":\"catalog\\/sociallogin\\/linkedin.png\",\"so_sociallogin_linkdinapikey\":\"78b7xin6x0kjj3\",\"so_sociallogin_linkdinsecretapi\":\"qvTyRdKakj6WFmWs\",\"so_sociallogin_linkstatus\":\"1\",\"name\":\"So Social Login\"}'),
	(337,'Seller 1 - Page Builder','so_page_builder','{\"page_builder\":\"[{\\\"text_class_id\\\":\\\"row_a90w\\\",\\\"text_class\\\":\\\"row-style\\\",\\\"text_color\\\":\\\"#000000\\\",\\\"link_color\\\":\\\"#000000\\\",\\\"link_hover_color\\\":\\\"#000000\\\",\\\"heading_color\\\":\\\"#000000\\\",\\\"background_type\\\":0,\\\"bg_color\\\":\\\"#FFFFFF\\\",\\\"bg_opacity\\\":\\\"100%\\\",\\\"bg_image\\\":\\\"\\\",\\\"bg_repeat\\\":\\\"no-repeat\\\",\\\"bg_position\\\":\\\"center center\\\",\\\"bg_attachment\\\":\\\"fixed\\\",\\\"bg_scale\\\":\\\"cover\\\",\\\"video_type\\\":0,\\\"link_video\\\":\\\"YE7VzlLtp-4\\\",\\\"margin\\\":\\\"\\\",\\\"padding\\\":\\\"\\\",\\\"row_container_fluid\\\":0,\\\"row_section\\\":0,\\\"row_section_class\\\":\\\"section-style\\\",\\\"row_section_id\\\":\\\"\\\",\\\"section_background_type\\\":0,\\\"section_bg_color\\\":\\\"#FFFFFF\\\",\\\"section_bg_opacity\\\":\\\"100%\\\",\\\"section_bg_image\\\":\\\"\\\",\\\"section_bg_repeat\\\":\\\"no-repeat\\\",\\\"section_bg_position\\\":\\\"center center\\\",\\\"section_bg_attachment\\\":\\\"fixed\\\",\\\"section_bg_scale\\\":\\\"cover\\\",\\\"section_video_type\\\":0,\\\"section_link_video\\\":\\\"YE7VzlLtp-4\\\",\\\"cols\\\":[{\\\"text_class_id\\\":\\\"col_anla\\\",\\\"text_class\\\":\\\"slider-right\\\",\\\"text_color\\\":\\\"#000000\\\",\\\"link_color\\\":\\\"#000000\\\",\\\"link_hover_color\\\":\\\"#000000\\\",\\\"heading_color\\\":\\\"#000000\\\",\\\"background_type\\\":\\\"0\\\",\\\"bg_color\\\":\\\"#FFFFFF\\\",\\\"bg_opacity\\\":\\\"100%\\\",\\\"bg_image\\\":\\\"\\\",\\\"bg_repeat\\\":\\\"no-repeat\\\",\\\"bg_position\\\":\\\"center center\\\",\\\"bg_attachment\\\":\\\"fixed\\\",\\\"bg_scale\\\":\\\"cover\\\",\\\"col_video_type\\\":\\\"0\\\",\\\"col_link_video\\\":\\\"YE7VzlLtp-4\\\",\\\"padding\\\":\\\"\\\",\\\"margin\\\":\\\"10px\\\",\\\"lg_col\\\":12,\\\"md_col\\\":\\\"9\\\",\\\"sm_col\\\":\\\"12\\\",\\\"xs_col\\\":\\\"12\\\",\\\"widgets\\\":[],\\\"rows\\\":[{\\\"text_class_id\\\":\\\"row_ci4f\\\",\\\"text_class\\\":\\\"\\\",\\\"text_color\\\":\\\"#000000\\\",\\\"link_color\\\":\\\"#000000\\\",\\\"link_hover_color\\\":\\\"#000000\\\",\\\"heading_color\\\":\\\"#000000\\\",\\\"background_type\\\":\\\"0\\\",\\\"bg_color\\\":\\\"#FFFFFF\\\",\\\"bg_opacity\\\":\\\"100%\\\",\\\"bg_image\\\":\\\"\\\",\\\"bg_repeat\\\":\\\"no-repeat\\\",\\\"bg_position\\\":\\\"center center\\\",\\\"bg_attachment\\\":\\\"fixed\\\",\\\"bg_scale\\\":\\\"cover\\\",\\\"video_type\\\":\\\"0\\\",\\\"link_video\\\":\\\"YE7VzlLtp-4\\\",\\\"margin\\\":\\\"\\\",\\\"padding\\\":\\\"\\\",\\\"row_container_fluid\\\":\\\"0\\\",\\\"row_section\\\":\\\"0\\\",\\\"row_section_class\\\":\\\"section-style\\\",\\\"row_section_id\\\":\\\"\\\",\\\"section_background_type\\\":\\\"0\\\",\\\"section_bg_color\\\":\\\"#FFFFFF\\\",\\\"section_bg_opacity\\\":\\\"100%\\\",\\\"section_bg_image\\\":\\\"\\\",\\\"section_bg_repeat\\\":\\\"no-repeat\\\",\\\"section_bg_position\\\":\\\"center center\\\",\\\"section_bg_attachment\\\":\\\"fixed\\\",\\\"section_bg_scale\\\":\\\"cover\\\",\\\"section_video_type\\\":\\\"0\\\",\\\"section_link_video\\\":\\\"YE7VzlLtp-4\\\",\\\"cols\\\":[{\\\"text_class_id\\\":\\\"col_dg1b\\\",\\\"text_class\\\":\\\"block block_1\\\",\\\"text_color\\\":\\\"#000000\\\",\\\"link_color\\\":\\\"#000000\\\",\\\"link_hover_color\\\":\\\"#000000\\\",\\\"heading_color\\\":\\\"#000000\\\",\\\"background_type\\\":\\\"0\\\",\\\"bg_color\\\":\\\"#FFFFFF\\\",\\\"bg_opacity\\\":\\\"100%\\\",\\\"bg_image\\\":\\\"\\\",\\\"bg_repeat\\\":\\\"no-repeat\\\",\\\"bg_position\\\":\\\"center center\\\",\\\"bg_attachment\\\":\\\"fixed\\\",\\\"bg_scale\\\":\\\"cover\\\",\\\"col_video_type\\\":\\\"0\\\",\\\"col_link_video\\\":\\\"YE7VzlLtp-4\\\",\\\"padding\\\":\\\"\\\",\\\"margin\\\":\\\"\\\",\\\"lg_col\\\":\\\"12\\\",\\\"md_col\\\":\\\"12\\\",\\\"sm_col\\\":\\\"12\\\",\\\"xs_col\\\":\\\"12\\\",\\\"widgets\\\":[{\\\"name\\\":\\\"Home Page - Slideshow\\\",\\\"module\\\":\\\"so_home_slider.194\\\",\\\"type\\\":\\\"module\\\"}],\\\"rows\\\":[]},{\\\"text_class_id\\\":\\\"col_hmsd\\\",\\\"text_class\\\":\\\"block block_2\\\",\\\"text_color\\\":\\\"#000000\\\",\\\"link_color\\\":\\\"#000000\\\",\\\"link_hover_color\\\":\\\"#000000\\\",\\\"heading_color\\\":\\\"#000000\\\",\\\"background_type\\\":\\\"0\\\",\\\"bg_color\\\":\\\"#FFFFFF\\\",\\\"bg_opacity\\\":\\\"100%\\\",\\\"bg_image\\\":\\\"\\\",\\\"bg_repeat\\\":\\\"no-repeat\\\",\\\"bg_position\\\":\\\"center center\\\",\\\"bg_attachment\\\":\\\"fixed\\\",\\\"bg_scale\\\":\\\"cover\\\",\\\"col_video_type\\\":\\\"0\\\",\\\"col_link_video\\\":\\\"YE7VzlLtp-4\\\",\\\"padding\\\":\\\"\\\",\\\"margin\\\":\\\"\\\",\\\"lg_col\\\":\\\"12\\\",\\\"md_col\\\":\\\"12\\\",\\\"sm_col\\\":\\\"12\\\",\\\"xs_col\\\":\\\"12\\\",\\\"widgets\\\":[{\\\"name\\\":\\\"Html\\\",\\\"module\\\":\\\"html_gn4q\\\",\\\"type\\\":\\\"shortcode\\\",\\\"shortcode\\\":\\\"html\\\",\\\"content\\\":\\\"{\\\\\\\"cparent\\\\\\\":[{\\\\\\\"name_shortcode_1\\\\\\\":\\\\\\\"Home1_Banner_1\\\\\\\",\\\\\\\"name_shortcode_2\\\\\\\":\\\\\\\"Home1_Banner_1\\\\\\\",\\\\\\\"name_shortcode_status\\\\\\\":\\\\\\\"no\\\\\\\",\\\\\\\"content_1\\\\\\\":\\\\\\\"<div class=\\\\\\\\\\\\\\\"home1-banner-1 clearfix\\\\\\\\\\\\\\\">\\\\\\\\n\\\\\\\\t<div class=\\\\\\\\\\\\\\\"item-1 col-lg-6 col-md-6 col-sm-6 banners\\\\\\\\\\\\\\\">\\\\\\\\n\\\\\\\\t\\\\\\\\t<div>\\\\\\\\n\\\\\\\\t\\\\\\\\t\\\\\\\\t<a title=\\\\\\\\\\\\\\\"Static Image\\\\\\\\\\\\\\\" href=\\\\\\\\\\\\\\\"#\\\\\\\\\\\\\\\"><img src=\\\\\\\\\\\\\\\"image\\/catalog\\/demo\\/banners\\/home1\\/bn-1.jpg\\\\\\\\\\\\\\\" alt=\\\\\\\\\\\\\\\"Static Image\\\\\\\\\\\\\\\"><\\/a>\\\\\\\\n\\\\\\\\t\\\\\\\\t<\\/div>\\\\\\\\n\\\\\\\\t<\\/div>\\\\\\\\n\\\\\\\\t<div class=\\\\\\\\\\\\\\\"item-2 col-lg-6 col-md-6 col-sm-6 banners\\\\\\\\\\\\\\\">\\\\\\\\n\\\\\\\\t\\\\\\\\t<div>\\\\\\\\n\\\\\\\\t\\\\\\\\t\\\\\\\\t<a title=\\\\\\\\\\\\\\\"Static Image\\\\\\\\\\\\\\\" href=\\\\\\\\\\\\\\\"#\\\\\\\\\\\\\\\"><img src=\\\\\\\\\\\\\\\"image\\/catalog\\/demo\\/banners\\/home1\\/bn-2.jpg\\\\\\\\\\\\\\\" alt=\\\\\\\\\\\\\\\"Static Image\\\\\\\\\\\\\\\"><\\/a>\\\\\\\\n\\\\\\\\t\\\\\\\\t<\\/div>\\\\\\\\n\\\\\\\\t<\\/div>\\\\\\\\n<\\/div>\\\\\\\",\\\\\\\"content_2\\\\\\\":\\\\\\\"<div class=\\\\\\\\\\\\\\\"home1-banner-1 clearfix\\\\\\\\\\\\\\\">\\\\\\\\n\\\\\\\\t<div class=\\\\\\\\\\\\\\\"item-1 col-lg-6 col-md-6 col-sm-6 banners\\\\\\\\\\\\\\\">\\\\\\\\n\\\\\\\\t\\\\\\\\t<div>\\\\\\\\n\\\\\\\\t\\\\\\\\t\\\\\\\\t<a title=\\\\\\\\\\\\\\\"Static Image\\\\\\\\\\\\\\\" href=\\\\\\\\\\\\\\\"#\\\\\\\\\\\\\\\"><img src=\\\\\\\\\\\\\\\"image\\/catalog\\/demo\\/banners\\/home1\\/bn-1.jpg\\\\\\\\\\\\\\\" alt=\\\\\\\\\\\\\\\"Static Image\\\\\\\\\\\\\\\"><\\/a>\\\\\\\\n\\\\\\\\t\\\\\\\\t<\\/div>\\\\\\\\n\\\\\\\\t<\\/div>\\\\\\\\n\\\\\\\\t<div class=\\\\\\\\\\\\\\\"item-2 col-lg-6 col-md-6 col-sm-6 banners\\\\\\\\\\\\\\\">\\\\\\\\n\\\\\\\\t\\\\\\\\t<div>\\\\\\\\n\\\\\\\\t\\\\\\\\t\\\\\\\\t<a title=\\\\\\\\\\\\\\\"Static Image\\\\\\\\\\\\\\\" href=\\\\\\\\\\\\\\\"#\\\\\\\\\\\\\\\"><img src=\\\\\\\\\\\\\\\"image\\/catalog\\/demo\\/banners\\/home1\\/bn-2.jpg\\\\\\\\\\\\\\\" alt=\\\\\\\\\\\\\\\"Static Image\\\\\\\\\\\\\\\"><\\/a>\\\\\\\\n\\\\\\\\t\\\\\\\\t<\\/div>\\\\\\\\n\\\\\\\\t<\\/div>\\\\\\\\n<\\/div>\\\\\\\",\\\\\\\"yt_class\\\\\\\":\\\\\\\"\\\\\\\",\\\\\\\"css_internal\\\\\\\":\\\\\\\"\\\\\\\"}],\\\\\\\"cchild\\\\\\\":{}}\\\"}],\\\"rows\\\":[]}]}]}]}]\",\"name\":\"Seller 1 - Page Builder\",\"status\":\"1\",\"import_theme\":\"0\",\"content_shortcode\":\"{&quot;cparent&quot;:[{&quot;name_shortcode_1&quot;:&quot;Home1_Banner_1&quot;,&quot;name_shortcode_2&quot;:&quot;Home1_Banner_1&quot;,&quot;name_shortcode_status&quot;:&quot;no&quot;,&quot;content_1&quot;:&quot;&lt;div class=\\\\&quot;home1-banner-1 clearfix\\\\&quot;&gt;\\\\n\\\\t&lt;div class=\\\\&quot;item-1 col-lg-6 col-md-6 col-sm-6 banners\\\\&quot;&gt;\\\\n\\\\t\\\\t&lt;div&gt;\\\\n\\\\t\\\\t\\\\t&lt;a title=\\\\&quot;Static Image\\\\&quot; href=\\\\&quot;#\\\\&quot;&gt;&lt;img src=\\\\&quot;image\\/catalog\\/demo\\/banners\\/home1\\/bn-1.jpg\\\\&quot; alt=\\\\&quot;Static Image\\\\&quot;&gt;&lt;\\/a&gt;\\\\n\\\\t\\\\t&lt;\\/div&gt;\\\\n\\\\t&lt;\\/div&gt;\\\\n\\\\t&lt;div class=\\\\&quot;item-2 col-lg-6 col-md-6 col-sm-6 banners\\\\&quot;&gt;\\\\n\\\\t\\\\t&lt;div&gt;\\\\n\\\\t\\\\t\\\\t&lt;a title=\\\\&quot;Static Image\\\\&quot; href=\\\\&quot;#\\\\&quot;&gt;&lt;img src=\\\\&quot;image\\/catalog\\/demo\\/banners\\/home1\\/bn-2.jpg\\\\&quot; alt=\\\\&quot;Static Image\\\\&quot;&gt;&lt;\\/a&gt;\\\\n\\\\t\\\\t&lt;\\/div&gt;\\\\n\\\\t&lt;\\/div&gt;\\\\n&lt;\\/div&gt;&quot;,&quot;content_2&quot;:&quot;&lt;div class=\\\\&quot;home1-banner-1 clearfix\\\\&quot;&gt;\\\\n\\\\t&lt;div class=\\\\&quot;item-1 col-lg-6 col-md-6 col-sm-6 banners\\\\&quot;&gt;\\\\n\\\\t\\\\t&lt;div&gt;\\\\n\\\\t\\\\t\\\\t&lt;a title=\\\\&quot;Static Image\\\\&quot; href=\\\\&quot;#\\\\&quot;&gt;&lt;img src=\\\\&quot;image\\/catalog\\/demo\\/banners\\/home1\\/bn-1.jpg\\\\&quot; alt=\\\\&quot;Static Image\\\\&quot;&gt;&lt;\\/a&gt;\\\\n\\\\t\\\\t&lt;\\/div&gt;\\\\n\\\\t&lt;\\/div&gt;\\\\n\\\\t&lt;div class=\\\\&quot;item-2 col-lg-6 col-md-6 col-sm-6 banners\\\\&quot;&gt;\\\\n\\\\t\\\\t&lt;div&gt;\\\\n\\\\t\\\\t\\\\t&lt;a title=\\\\&quot;Static Image\\\\&quot; href=\\\\&quot;#\\\\&quot;&gt;&lt;img src=\\\\&quot;image\\/catalog\\/demo\\/banners\\/home1\\/bn-2.jpg\\\\&quot; alt=\\\\&quot;Static Image\\\\&quot;&gt;&lt;\\/a&gt;\\\\n\\\\t\\\\t&lt;\\/div&gt;\\\\n\\\\t&lt;\\/div&gt;\\\\n&lt;\\/div&gt;&quot;,&quot;yt_class&quot;:&quot;&quot;,&quot;css_internal&quot;:&quot;&quot;}],&quot;cchild&quot;:{}}\",\"moduleid\":\"337\"}'),
	(339,'Footer 1 - CUSTOM VCTP0','so_page_builder','{\"page_builder\":\"[{\\\"text_class_id\\\":\\\"row_sh6r\\\",\\\"text_class\\\":\\\"footer--top\\\",\\\"text_color\\\":\\\"#000000\\\",\\\"link_color\\\":\\\"#000000\\\",\\\"link_hover_color\\\":\\\"#000000\\\",\\\"heading_color\\\":\\\"#000000\\\",\\\"background_type\\\":\\\"1\\\",\\\"bg_color\\\":\\\"#fff\\\",\\\"bg_opacity\\\":\\\"100%\\\",\\\"bg_image\\\":\\\"\\\",\\\"bg_repeat\\\":\\\"no-repeat\\\",\\\"bg_position\\\":\\\"center center\\\",\\\"bg_attachment\\\":\\\"fixed\\\",\\\"bg_scale\\\":\\\"cover\\\",\\\"video_type\\\":\\\"0\\\",\\\"link_video\\\":\\\"YE7VzlLtp-4\\\",\\\"margin\\\":\\\"\\\",\\\"padding\\\":\\\"\\\",\\\"row_container_fluid\\\":\\\"1\\\",\\\"row_section\\\":\\\"0\\\",\\\"row_section_class\\\":\\\"section-style\\\",\\\"row_section_id\\\":\\\"\\\",\\\"section_background_type\\\":\\\"0\\\",\\\"section_bg_color\\\":\\\"#FFFFFF\\\",\\\"section_bg_opacity\\\":\\\"100%\\\",\\\"section_bg_image\\\":\\\"\\\",\\\"section_bg_repeat\\\":\\\"no-repeat\\\",\\\"section_bg_position\\\":\\\"center center\\\",\\\"section_bg_attachment\\\":\\\"fixed\\\",\\\"section_bg_scale\\\":\\\"cover\\\",\\\"section_video_type\\\":\\\"0\\\",\\\"section_link_video\\\":\\\"YE7VzlLtp-4\\\",\\\"cols\\\":[{\\\"text_class_id\\\":\\\"col_971a\\\",\\\"text_class\\\":\\\"float_none container\\\",\\\"text_color\\\":\\\"#000000\\\",\\\"link_color\\\":\\\"#000000\\\",\\\"link_hover_color\\\":\\\"#000000\\\",\\\"heading_color\\\":\\\"#000000\\\",\\\"background_type\\\":\\\"0\\\",\\\"bg_color\\\":\\\"#FFFFFF\\\",\\\"bg_opacity\\\":\\\"100%\\\",\\\"bg_image\\\":\\\"\\\",\\\"bg_repeat\\\":\\\"no-repeat\\\",\\\"bg_position\\\":\\\"center center\\\",\\\"bg_attachment\\\":\\\"fixed\\\",\\\"bg_scale\\\":\\\"cover\\\",\\\"col_video_type\\\":\\\"0\\\",\\\"col_link_video\\\":\\\"YE7VzlLtp-4\\\",\\\"padding\\\":\\\"\\\",\\\"margin\\\":\\\"\\\",\\\"lg_col\\\":\\\"12\\\",\\\"md_col\\\":\\\"12\\\",\\\"sm_col\\\":\\\"12\\\",\\\"xs_col\\\":\\\"12\\\",\\\"widgets\\\":[],\\\"rows\\\":[{\\\"text_class_id\\\":\\\"row_dmol\\\",\\\"text_class\\\":\\\"\\\",\\\"text_color\\\":\\\"#000000\\\",\\\"link_color\\\":\\\"#000000\\\",\\\"link_hover_color\\\":\\\"#000000\\\",\\\"heading_color\\\":\\\"#000000\\\",\\\"background_type\\\":\\\"0\\\",\\\"bg_color\\\":\\\"#FFFFFF\\\",\\\"bg_opacity\\\":\\\"100%\\\",\\\"bg_image\\\":\\\"\\\",\\\"bg_repeat\\\":\\\"no-repeat\\\",\\\"bg_position\\\":\\\"center center\\\",\\\"bg_attachment\\\":\\\"fixed\\\",\\\"bg_scale\\\":\\\"cover\\\",\\\"video_type\\\":\\\"0\\\",\\\"link_video\\\":\\\"YE7VzlLtp-4\\\",\\\"margin\\\":\\\"\\\",\\\"padding\\\":\\\"\\\",\\\"row_container_fluid\\\":\\\"0\\\",\\\"row_section\\\":\\\"0\\\",\\\"row_section_class\\\":\\\"section-style\\\",\\\"row_section_id\\\":\\\"\\\",\\\"section_background_type\\\":\\\"0\\\",\\\"section_bg_color\\\":\\\"#FFFFFF\\\",\\\"section_bg_opacity\\\":\\\"100%\\\",\\\"section_bg_image\\\":\\\"\\\",\\\"section_bg_repeat\\\":\\\"no-repeat\\\",\\\"section_bg_position\\\":\\\"center center\\\",\\\"section_bg_attachment\\\":\\\"fixed\\\",\\\"section_bg_scale\\\":\\\"cover\\\",\\\"section_video_type\\\":\\\"0\\\",\\\"section_link_video\\\":\\\"YE7VzlLtp-4\\\",\\\"cols\\\":[{\\\"text_class_id\\\":\\\"col_hcbx\\\",\\\"text_class\\\":\\\"block--newletter\\\",\\\"text_color\\\":\\\"#000000\\\",\\\"link_color\\\":\\\"#000000\\\",\\\"link_hover_color\\\":\\\"#000000\\\",\\\"heading_color\\\":\\\"#000000\\\",\\\"background_type\\\":\\\"0\\\",\\\"bg_color\\\":\\\"#FFFFFF\\\",\\\"bg_opacity\\\":\\\"100%\\\",\\\"bg_image\\\":\\\"\\\",\\\"bg_repeat\\\":\\\"no-repeat\\\",\\\"bg_position\\\":\\\"center center\\\",\\\"bg_attachment\\\":\\\"fixed\\\",\\\"bg_scale\\\":\\\"cover\\\",\\\"col_video_type\\\":\\\"0\\\",\\\"col_link_video\\\":\\\"YE7VzlLtp-4\\\",\\\"padding\\\":\\\"\\\",\\\"margin\\\":\\\"\\\",\\\"lg_col\\\":\\\"9\\\",\\\"md_col\\\":\\\"9\\\",\\\"sm_col\\\":\\\"9\\\",\\\"xs_col\\\":\\\"12\\\",\\\"widgets\\\":[{\\\"name\\\":\\\"Home 1 - Newsletter\\\",\\\"module\\\":\\\"so_newletter_custom_popup.181\\\",\\\"type\\\":\\\"module\\\"}],\\\"rows\\\":[]},{\\\"text_class_id\\\":\\\"col_h1e7\\\",\\\"text_class\\\":\\\"block--social\\\",\\\"text_color\\\":\\\"#000000\\\",\\\"link_color\\\":\\\"#000000\\\",\\\"link_hover_color\\\":\\\"#000000\\\",\\\"heading_color\\\":\\\"#000000\\\",\\\"background_type\\\":\\\"0\\\",\\\"bg_color\\\":\\\"#FFFFFF\\\",\\\"bg_opacity\\\":\\\"100%\\\",\\\"bg_image\\\":\\\"\\\",\\\"bg_repeat\\\":\\\"no-repeat\\\",\\\"bg_position\\\":\\\"center center\\\",\\\"bg_attachment\\\":\\\"fixed\\\",\\\"bg_scale\\\":\\\"cover\\\",\\\"col_video_type\\\":\\\"0\\\",\\\"col_link_video\\\":\\\"YE7VzlLtp-4\\\",\\\"padding\\\":\\\"\\\",\\\"margin\\\":\\\"\\\",\\\"lg_col\\\":\\\"3\\\",\\\"md_col\\\":\\\"3\\\",\\\"sm_col\\\":\\\"3\\\",\\\"xs_col\\\":\\\"12\\\",\\\"widgets\\\":[{\\\"name\\\":\\\"Html\\\",\\\"module\\\":\\\"html_1k6e\\\",\\\"type\\\":\\\"shortcode\\\",\\\"shortcode\\\":\\\"html\\\",\\\"content\\\":\\\"{\\\\\\\"cparent\\\\\\\":[{\\\\\\\"name_shortcode_1\\\\\\\":\\\\\\\"Footer_Social\\\\\\\",\\\\\\\"name_shortcode_2\\\\\\\":\\\\\\\"Footer_Social\\\\\\\",\\\\\\\"name_shortcode_status\\\\\\\":\\\\\\\"no\\\\\\\",\\\\\\\"content_1\\\\\\\":\\\\\\\"<div class=\\\\\\\\\\\\\\\"footer-social\\\\\\\\\\\\\\\">\\\\\\\\n\\\\\\\\t<h3 class=\\\\\\\\\\\\\\\"block-title\\\\\\\\\\\\\\\">Follow us<\\/h3>\\\\\\\\n\\\\\\\\t<div class=\\\\\\\\\\\\\\\"socials\\\\\\\\\\\\\\\">\\\\\\\\n\\\\\\\\n\\\\\\\\t<a href=\\\\\\\\\\\\\\\"https:\\/\\/www.facebook.com\\/SmartAddons.page\\\\\\\\\\\\\\\" class=\\\\\\\\\\\\\\\"facebook\\\\\\\\\\\\\\\" target=\\\\\\\\\\\\\\\"_blank\\\\\\\\\\\\\\\"><i class=\\\\\\\\\\\\\\\"fa fa-facebook\\\\\\\\\\\\\\\"><\\/i>\\\\\\\\n\\\\\\\\t\\\\\\\\t\\\\\\\\t<p>on<\\/p>\\\\\\\\n\\\\\\\\t\\\\\\\\t\\\\\\\\t<span class=\\\\\\\\\\\\\\\"name-social\\\\\\\\\\\\\\\">Facebook<\\/span>\\\\\\\\n\\\\\\\\t<\\/a>\\\\\\\\n\\\\\\\\t \\\\\\\\n\\\\\\\\t<a href=\\\\\\\\\\\\\\\"https:\\/\\/twitter.com\\/smartaddons\\\\\\\\\\\\\\\" class=\\\\\\\\\\\\\\\"twitter\\\\\\\\\\\\\\\" target=\\\\\\\\\\\\\\\"_blank\\\\\\\\\\\\\\\">\\\\\\\\n\\\\\\\\t\\\\\\\\t\\\\\\\\t<i class=\\\\\\\\\\\\\\\"fa fa-twitter\\\\\\\\\\\\\\\"><\\/i>\\\\\\\\n\\\\\\\\t\\\\\\\\t\\\\\\\\t<p>on<\\/p>\\\\\\\\n\\\\\\\\t\\\\\\\\t\\\\\\\\t<span class=\\\\\\\\\\\\\\\"name-social\\\\\\\\\\\\\\\">Twitter<\\/span>\\\\\\\\n\\\\\\\\t<\\/a>\\\\\\\\n\\\\\\\\t\\\\\\\\t\\\\\\\\t\\\\\\\\t\\\\\\\\t<a href=\\\\\\\\\\\\\\\"https:\\/\\/plus.google.com\\/u\\/0\\/+SmartAddons-Joomla-Magento-WordPress\\/posts\\\\\\\\\\\\\\\" class=\\\\\\\\\\\\\\\"google\\\\\\\\\\\\\\\" target=\\\\\\\\\\\\\\\"_blank\\\\\\\\\\\\\\\">\\\\\\\\n\\\\\\\\t\\\\\\\\t\\\\\\\\t<i class=\\\\\\\\\\\\\\\"fa fa-google-plus\\\\\\\\\\\\\\\"><\\/i>\\\\\\\\n\\\\\\\\t\\\\\\\\t\\\\\\\\t<p>on<\\/p>\\\\\\\\n\\\\\\\\t\\\\\\\\t\\\\\\\\t<span class=\\\\\\\\\\\\\\\"name-social\\\\\\\\\\\\\\\">Google +<\\/span>\\\\\\\\n\\\\\\\\t<\\/a>\\\\\\\\n\\\\\\\\n\\\\\\\\t\\\\\\\\t\\\\\\\\t<a href=\\\\\\\\\\\\\\\"#\\\\\\\\\\\\\\\" class=\\\\\\\\\\\\\\\"dribbble\\\\\\\\\\\\\\\" target=\\\\\\\\\\\\\\\"_blank\\\\\\\\\\\\\\\"><i class=\\\\\\\\\\\\\\\"fa fa-dribbble\\\\\\\\\\\\\\\" aria-hidden=\\\\\\\\\\\\\\\"true\\\\\\\\\\\\\\\"><\\/i><\\/a>\\\\\\\\n\\\\\\\\n\\\\\\\\t\\\\\\\\t\\\\\\\\t<a href=\\\\\\\\\\\\\\\"#\\\\\\\\\\\\\\\" class=\\\\\\\\\\\\\\\"instagram\\\\\\\\\\\\\\\" target=\\\\\\\\\\\\\\\"_blank\\\\\\\\\\\\\\\">\\\\\\\\n\\\\\\\\t\\\\\\\\t\\\\\\\\t<i class=\\\\\\\\\\\\\\\"fa fa-instagram\\\\\\\\\\\\\\\" aria-hidden=\\\\\\\\\\\\\\\"true\\\\\\\\\\\\\\\"><\\/i>\\\\\\\\n\\\\\\\\t\\\\\\\\t\\\\\\\\t<p>on<\\/p>\\\\\\\\n\\\\\\\\t\\\\\\\\t\\\\\\\\t<span class=\\\\\\\\\\\\\\\"name-social\\\\\\\\\\\\\\\">Instagram<\\/span>\\\\\\\\n\\\\\\\\t<\\/a>\\\\\\\\n\\\\\\\\n\\\\\\\\t<a href=\\\\\\\\\\\\\\\"#\\\\\\\\\\\\\\\" class=\\\\\\\\\\\\\\\"pinterest\\\\\\\\\\\\\\\" target=\\\\\\\\\\\\\\\"_blank\\\\\\\\\\\\\\\"><i class=\\\\\\\\\\\\\\\"fa fa-pinterest\\\\\\\\\\\\\\\"><\\/i><\\/a>\\\\\\\\t\\\\\\\\t<a href=\\\\\\\\\\\\\\\"#\\\\\\\\\\\\\\\" class=\\\\\\\\\\\\\\\"linkedIn\\\\\\\\\\\\\\\" target=\\\\\\\\\\\\\\\"_blank\\\\\\\\\\\\\\\"><i class=\\\\\\\\\\\\\\\"fa fa-linkedin\\\\\\\\\\\\\\\"><\\/i><\\/a>\\\\\\\\t\\\\\\\\t\\\\\\\\n\\\\\\\\t<\\/div>\\\\\\\\n<\\/div>\\\\\\\",\\\\\\\"content_2\\\\\\\":\\\\\\\"<div class=\\\\\\\\\\\\\\\"footer-social\\\\\\\\\\\\\\\">\\\\\\\\n\\\\\\\\t<h3 class=\\\\\\\\\\\\\\\"block-title\\\\\\\\\\\\\\\">Follow us<\\/h3>\\\\\\\\n\\\\\\\\t<div class=\\\\\\\\\\\\\\\"socials\\\\\\\\\\\\\\\">\\\\\\\\n\\\\\\\\n\\\\\\\\t<a href=\\\\\\\\\\\\\\\"https:\\/\\/www.facebook.com\\/SmartAddons.page\\\\\\\\\\\\\\\" class=\\\\\\\\\\\\\\\"facebook\\\\\\\\\\\\\\\" target=\\\\\\\\\\\\\\\"_blank\\\\\\\\\\\\\\\"><i class=\\\\\\\\\\\\\\\"fa fa-facebook\\\\\\\\\\\\\\\"><\\/i>\\\\\\\\n\\\\\\\\t\\\\\\\\t\\\\\\\\t<p>on<\\/p>\\\\\\\\n\\\\\\\\t\\\\\\\\t\\\\\\\\t<span class=\\\\\\\\\\\\\\\"name-social\\\\\\\\\\\\\\\">Facebook<\\/span>\\\\\\\\n\\\\\\\\t<\\/a>\\\\\\\\n\\\\\\\\t \\\\\\\\n\\\\\\\\t<a href=\\\\\\\\\\\\\\\"https:\\/\\/twitter.com\\/smartaddons\\\\\\\\\\\\\\\" class=\\\\\\\\\\\\\\\"twitter\\\\\\\\\\\\\\\" target=\\\\\\\\\\\\\\\"_blank\\\\\\\\\\\\\\\">\\\\\\\\n\\\\\\\\t\\\\\\\\t\\\\\\\\t<i class=\\\\\\\\\\\\\\\"fa fa-twitter\\\\\\\\\\\\\\\"><\\/i>\\\\\\\\n\\\\\\\\t\\\\\\\\t\\\\\\\\t<p>on<\\/p>\\\\\\\\n\\\\\\\\t\\\\\\\\t\\\\\\\\t<span class=\\\\\\\\\\\\\\\"name-social\\\\\\\\\\\\\\\">Twitter<\\/span>\\\\\\\\n\\\\\\\\t<\\/a>\\\\\\\\n\\\\\\\\t\\\\\\\\t\\\\\\\\t\\\\\\\\t\\\\\\\\t<a href=\\\\\\\\\\\\\\\"https:\\/\\/plus.google.com\\/u\\/0\\/+SmartAddons-Joomla-Magento-WordPress\\/posts\\\\\\\\\\\\\\\" class=\\\\\\\\\\\\\\\"google\\\\\\\\\\\\\\\" target=\\\\\\\\\\\\\\\"_blank\\\\\\\\\\\\\\\">\\\\\\\\n\\\\\\\\t\\\\\\\\t\\\\\\\\t<i class=\\\\\\\\\\\\\\\"fa fa-google-plus\\\\\\\\\\\\\\\"><\\/i>\\\\\\\\n\\\\\\\\t\\\\\\\\t\\\\\\\\t<p>on<\\/p>\\\\\\\\n\\\\\\\\t\\\\\\\\t\\\\\\\\t<span class=\\\\\\\\\\\\\\\"name-social\\\\\\\\\\\\\\\">Google +<\\/span>\\\\\\\\n\\\\\\\\t<\\/a>\\\\\\\\n\\\\\\\\n\\\\\\\\t\\\\\\\\t\\\\\\\\t<a href=\\\\\\\\\\\\\\\"#\\\\\\\\\\\\\\\" class=\\\\\\\\\\\\\\\"dribbble\\\\\\\\\\\\\\\" target=\\\\\\\\\\\\\\\"_blank\\\\\\\\\\\\\\\"><i class=\\\\\\\\\\\\\\\"fa fa-dribbble\\\\\\\\\\\\\\\" aria-hidden=\\\\\\\\\\\\\\\"true\\\\\\\\\\\\\\\"><\\/i><\\/a>\\\\\\\\n\\\\\\\\n\\\\\\\\t\\\\\\\\t\\\\\\\\t<a href=\\\\\\\\\\\\\\\"#\\\\\\\\\\\\\\\" class=\\\\\\\\\\\\\\\"instagram\\\\\\\\\\\\\\\" target=\\\\\\\\\\\\\\\"_blank\\\\\\\\\\\\\\\">\\\\\\\\n\\\\\\\\t\\\\\\\\t\\\\\\\\t<i class=\\\\\\\\\\\\\\\"fa fa-instagram\\\\\\\\\\\\\\\" aria-hidden=\\\\\\\\\\\\\\\"true\\\\\\\\\\\\\\\"><\\/i>\\\\\\\\n\\\\\\\\t\\\\\\\\t\\\\\\\\t<p>on<\\/p>\\\\\\\\n\\\\\\\\t\\\\\\\\t\\\\\\\\t<span class=\\\\\\\\\\\\\\\"name-social\\\\\\\\\\\\\\\">Instagram<\\/span>\\\\\\\\n\\\\\\\\t<\\/a>\\\\\\\\n\\\\\\\\n\\\\\\\\t<a href=\\\\\\\\\\\\\\\"#\\\\\\\\\\\\\\\" class=\\\\\\\\\\\\\\\"pinterest\\\\\\\\\\\\\\\" target=\\\\\\\\\\\\\\\"_blank\\\\\\\\\\\\\\\"><i class=\\\\\\\\\\\\\\\"fa fa-pinterest\\\\\\\\\\\\\\\"><\\/i><\\/a>\\\\\\\\t\\\\\\\\t<a href=\\\\\\\\\\\\\\\"#\\\\\\\\\\\\\\\" class=\\\\\\\\\\\\\\\"linkedIn\\\\\\\\\\\\\\\" target=\\\\\\\\\\\\\\\"_blank\\\\\\\\\\\\\\\"><i class=\\\\\\\\\\\\\\\"fa fa-linkedin\\\\\\\\\\\\\\\"><\\/i><\\/a>\\\\\\\\t\\\\\\\\t\\\\\\\\n\\\\\\\\t<\\/div>\\\\\\\\n<\\/div>\\\\\\\",\\\\\\\"yt_class\\\\\\\":\\\\\\\"\\\\\\\",\\\\\\\"css_internal\\\\\\\":\\\\\\\"\\\\\\\"}],\\\\\\\"cchild\\\\\\\":{}}\\\"}],\\\"rows\\\":[]}]}]}]},{\\\"text_class_id\\\":\\\"row_z1do\\\",\\\"text_class\\\":\\\"footer--center\\\",\\\"text_color\\\":\\\"#000000\\\",\\\"link_color\\\":\\\"#000000\\\",\\\"link_hover_color\\\":\\\"#000000\\\",\\\"heading_color\\\":\\\"#000000\\\",\\\"background_type\\\":\\\"1\\\",\\\"bg_color\\\":\\\"#f2f5f5\\\",\\\"bg_opacity\\\":\\\"100%\\\",\\\"bg_image\\\":\\\"\\\",\\\"bg_repeat\\\":\\\"no-repeat\\\",\\\"bg_position\\\":\\\"center center\\\",\\\"bg_attachment\\\":\\\"fixed\\\",\\\"bg_scale\\\":\\\"cover\\\",\\\"video_type\\\":\\\"0\\\",\\\"link_video\\\":\\\"YE7VzlLtp-4\\\",\\\"margin\\\":\\\"\\\",\\\"padding\\\":\\\"\\\",\\\"row_container_fluid\\\":\\\"1\\\",\\\"row_section\\\":\\\"0\\\",\\\"row_section_class\\\":\\\"section-style\\\",\\\"row_section_id\\\":\\\"\\\",\\\"section_background_type\\\":\\\"0\\\",\\\"section_bg_color\\\":\\\"#FFFFFF\\\",\\\"section_bg_opacity\\\":\\\"100%\\\",\\\"section_bg_image\\\":\\\"\\\",\\\"section_bg_repeat\\\":\\\"no-repeat\\\",\\\"section_bg_position\\\":\\\"center center\\\",\\\"section_bg_attachment\\\":\\\"fixed\\\",\\\"section_bg_scale\\\":\\\"cover\\\",\\\"section_video_type\\\":\\\"0\\\",\\\"section_link_video\\\":\\\"YE7VzlLtp-4\\\",\\\"cols\\\":[{\\\"text_class_id\\\":\\\"col_x6fe\\\",\\\"text_class\\\":\\\"float_none container\\\",\\\"text_color\\\":\\\"#000000\\\",\\\"link_color\\\":\\\"#000000\\\",\\\"link_hover_color\\\":\\\"#000000\\\",\\\"heading_color\\\":\\\"#000000\\\",\\\"background_type\\\":\\\"0\\\",\\\"bg_color\\\":\\\"#FFFFFF\\\",\\\"bg_opacity\\\":\\\"100%\\\",\\\"bg_image\\\":\\\"\\\",\\\"bg_repeat\\\":\\\"no-repeat\\\",\\\"bg_position\\\":\\\"center center\\\",\\\"bg_attachment\\\":\\\"fixed\\\",\\\"bg_scale\\\":\\\"cover\\\",\\\"col_video_type\\\":\\\"0\\\",\\\"col_link_video\\\":\\\"YE7VzlLtp-4\\\",\\\"padding\\\":\\\"\\\",\\\"margin\\\":\\\"\\\",\\\"lg_col\\\":\\\"12\\\",\\\"md_col\\\":\\\"12\\\",\\\"sm_col\\\":\\\"12\\\",\\\"xs_col\\\":\\\"12\\\",\\\"widgets\\\":[],\\\"rows\\\":[{\\\"text_class_id\\\":\\\"row_wprs\\\",\\\"text_class\\\":\\\"\\\",\\\"text_color\\\":\\\"#000000\\\",\\\"link_color\\\":\\\"#000000\\\",\\\"link_hover_color\\\":\\\"#000000\\\",\\\"heading_color\\\":\\\"#000000\\\",\\\"background_type\\\":\\\"0\\\",\\\"bg_color\\\":\\\"#FFFFFF\\\",\\\"bg_opacity\\\":\\\"100%\\\",\\\"bg_image\\\":\\\"\\\",\\\"bg_repeat\\\":\\\"no-repeat\\\",\\\"bg_position\\\":\\\"center center\\\",\\\"bg_attachment\\\":\\\"fixed\\\",\\\"bg_scale\\\":\\\"cover\\\",\\\"video_type\\\":\\\"0\\\",\\\"link_video\\\":\\\"YE7VzlLtp-4\\\",\\\"margin\\\":\\\"\\\",\\\"padding\\\":\\\"\\\",\\\"row_container_fluid\\\":\\\"0\\\",\\\"row_section\\\":\\\"0\\\",\\\"row_section_class\\\":\\\"section-style\\\",\\\"row_section_id\\\":\\\"\\\",\\\"section_background_type\\\":\\\"0\\\",\\\"section_bg_color\\\":\\\"#FFFFFF\\\",\\\"section_bg_opacity\\\":\\\"100%\\\",\\\"section_bg_image\\\":\\\"\\\",\\\"section_bg_repeat\\\":\\\"no-repeat\\\",\\\"section_bg_position\\\":\\\"center center\\\",\\\"section_bg_attachment\\\":\\\"fixed\\\",\\\"section_bg_scale\\\":\\\"cover\\\",\\\"section_video_type\\\":\\\"0\\\",\\\"section_link_video\\\":\\\"YE7VzlLtp-4\\\",\\\"cols\\\":[{\\\"text_class_id\\\":\\\"col_yb5e\\\",\\\"text_class\\\":\\\"footer--link\\\",\\\"text_color\\\":\\\"#000000\\\",\\\"link_color\\\":\\\"#000000\\\",\\\"link_hover_color\\\":\\\"#000000\\\",\\\"heading_color\\\":\\\"#000000\\\",\\\"background_type\\\":\\\"0\\\",\\\"bg_color\\\":\\\"#FFFFFF\\\",\\\"bg_opacity\\\":\\\"100%\\\",\\\"bg_image\\\":\\\"\\\",\\\"bg_repeat\\\":\\\"no-repeat\\\",\\\"bg_position\\\":\\\"center center\\\",\\\"bg_attachment\\\":\\\"fixed\\\",\\\"bg_scale\\\":\\\"cover\\\",\\\"col_video_type\\\":\\\"0\\\",\\\"col_link_video\\\":\\\"YE7VzlLtp-4\\\",\\\"padding\\\":\\\"\\\",\\\"margin\\\":\\\"\\\",\\\"lg_col\\\":\\\"15\\\",\\\"md_col\\\":\\\"15\\\",\\\"sm_col\\\":\\\"4\\\",\\\"xs_col\\\":\\\"6\\\",\\\"widgets\\\":[{\\\"name\\\":\\\"Html\\\",\\\"module\\\":\\\"html_xxnh\\\",\\\"type\\\":\\\"shortcode\\\",\\\"shortcode\\\":\\\"html\\\",\\\"content\\\":\\\"{\\\\\\\"cparent\\\\\\\":[{\\\\\\\"name_shortcode_1\\\\\\\":\\\\\\\"Footer_link_2\\\\\\\",\\\\\\\"name_shortcode_2\\\\\\\":\\\\\\\"Footer_link_2\\\\\\\",\\\\\\\"name_shortcode_status\\\\\\\":\\\\\\\"no\\\\\\\",\\\\\\\"content_1\\\\\\\":\\\\\\\"<h3 class=\\\\\\\\\\\\\\\"title-footer\\\\\\\\\\\\\\\">\\\\\\\\n\\\\\\\\tspa & massage\\\\\\\\n<\\/h3>\\\\\\\\n<ul class=\\\\\\\\\\\\\\\"links\\\\\\\\\\\\\\\">\\\\\\\\n\\\\\\\\t<li>\\\\\\\\n\\\\\\\\t<a href=\\\\\\\\\\\\\\\"#\\\\\\\\\\\\\\\">Makeup<\\/a>\\\\\\\\n\\\\\\\\t<\\/li>\\\\\\\\n\\\\\\\\t<li>\\\\\\\\n\\\\\\\\t<a href=\\\\\\\\\\\\\\\"#\\\\\\\\\\\\\\\"> Skin Care<\\/a>\\\\\\\\n\\\\\\\\t<\\/li>\\\\\\\\n\\\\\\\\t<li>\\\\\\\\n\\\\\\\\t<a href=\\\\\\\\\\\\\\\"#\\\\\\\\\\\\\\\"> Hair Care<\\/a>\\\\\\\\n\\\\\\\\t<\\/li>\\\\\\\\n\\\\\\\\t<li>\\\\\\\\n\\\\\\\\t<a href=\\\\\\\\\\\\\\\"#\\\\\\\\\\\\\\\"> Tools & Accessories<\\/a>\\\\\\\\n\\\\\\\\t<\\/li>\\\\\\\\n\\\\\\\\t<li>\\\\\\\\n\\\\\\\\t<a href=\\\\\\\\\\\\\\\"#\\\\\\\\\\\\\\\"> Perfume & Cologne<\\/a>\\\\\\\\n\\\\\\\\t<\\/li>\\\\\\\\n\\\\\\\\t<li>\\\\\\\\n\\\\\\\\t<a href=\\\\\\\\\\\\\\\"#\\\\\\\\\\\\\\\"> More to Explore<\\/a>\\\\\\\\n\\\\\\\\t<\\/li>\\\\\\\\n<\\/ul>\\\\\\\\n\\\\\\\",\\\\\\\"content_2\\\\\\\":\\\\\\\"<h3 class=\\\\\\\\\\\\\\\"title-footer\\\\\\\\\\\\\\\">\\\\\\\\n\\\\\\\\tspa & massage\\\\\\\\n<\\/h3>\\\\\\\\n<ul class=\\\\\\\\\\\\\\\"links\\\\\\\\\\\\\\\">\\\\\\\\n\\\\\\\\t<li>\\\\\\\\n\\\\\\\\t<a href=\\\\\\\\\\\\\\\"#\\\\\\\\\\\\\\\">Makeup<\\/a>\\\\\\\\n\\\\\\\\t<\\/li>\\\\\\\\n\\\\\\\\t<li>\\\\\\\\n\\\\\\\\t<a href=\\\\\\\\\\\\\\\"#\\\\\\\\\\\\\\\"> Skin Care<\\/a>\\\\\\\\n\\\\\\\\t<\\/li>\\\\\\\\n\\\\\\\\t<li>\\\\\\\\n\\\\\\\\t<a href=\\\\\\\\\\\\\\\"#\\\\\\\\\\\\\\\"> Hair Care<\\/a>\\\\\\\\n\\\\\\\\t<\\/li>\\\\\\\\n\\\\\\\\t<li>\\\\\\\\n\\\\\\\\t<a href=\\\\\\\\\\\\\\\"#\\\\\\\\\\\\\\\"> Tools & Accessories<\\/a>\\\\\\\\n\\\\\\\\t<\\/li>\\\\\\\\n\\\\\\\\t<li>\\\\\\\\n\\\\\\\\t<a href=\\\\\\\\\\\\\\\"#\\\\\\\\\\\\\\\"> Perfume & Cologne<\\/a>\\\\\\\\n\\\\\\\\t<\\/li>\\\\\\\\n\\\\\\\\t<li>\\\\\\\\n\\\\\\\\t<a href=\\\\\\\\\\\\\\\"#\\\\\\\\\\\\\\\"> More to Explore<\\/a>\\\\\\\\n\\\\\\\\t<\\/li>\\\\\\\\n<\\/ul>\\\\\\\\n\\\\\\\",\\\\\\\"yt_class\\\\\\\":\\\\\\\"\\\\\\\",\\\\\\\"css_internal\\\\\\\":\\\\\\\"\\\\\\\"}],\\\\\\\"cchild\\\\\\\":{}}\\\"}],\\\"rows\\\":[]},{\\\"text_class_id\\\":\\\"col_1tke\\\",\\\"text_class\\\":\\\"footer--link\\\",\\\"text_color\\\":\\\"#000000\\\",\\\"link_color\\\":\\\"#000000\\\",\\\"link_hover_color\\\":\\\"#000000\\\",\\\"heading_color\\\":\\\"#000000\\\",\\\"background_type\\\":\\\"0\\\",\\\"bg_color\\\":\\\"#FFFFFF\\\",\\\"bg_opacity\\\":\\\"100%\\\",\\\"bg_image\\\":\\\"\\\",\\\"bg_repeat\\\":\\\"no-repeat\\\",\\\"bg_position\\\":\\\"center center\\\",\\\"bg_attachment\\\":\\\"fixed\\\",\\\"bg_scale\\\":\\\"cover\\\",\\\"col_video_type\\\":\\\"0\\\",\\\"col_link_video\\\":\\\"YE7VzlLtp-4\\\",\\\"padding\\\":\\\"\\\",\\\"margin\\\":\\\"\\\",\\\"lg_col\\\":\\\"15\\\",\\\"md_col\\\":\\\"15\\\",\\\"sm_col\\\":\\\"4\\\",\\\"xs_col\\\":\\\"6\\\",\\\"widgets\\\":[{\\\"name\\\":\\\"Html\\\",\\\"module\\\":\\\"html_a9po\\\",\\\"type\\\":\\\"shortcode\\\",\\\"shortcode\\\":\\\"html\\\",\\\"content\\\":\\\"{\\\\\\\"cparent\\\\\\\":[{\\\\\\\"name_shortcode_1\\\\\\\":\\\\\\\"Footer_link_1\\\\\\\",\\\\\\\"name_shortcode_2\\\\\\\":\\\\\\\"Footer_link_1\\\\\\\",\\\\\\\"name_shortcode_status\\\\\\\":\\\\\\\"no\\\\\\\",\\\\\\\"content_1\\\\\\\":\\\\\\\"<h3 class=\\\\\\\\\\\\\\\"title-footer\\\\\\\\\\\\\\\">\\\\\\\\n\\\\\\\\tfashion & accessories\\\\\\\\n<\\/h3>\\\\\\\\n<ul class=\\\\\\\\\\\\\\\"links\\\\\\\\\\\\\\\">\\\\\\\\n\\\\\\\\t<li>\\\\\\\\n\\\\\\\\t<a href=\\\\\\\\\\\\\\\"#\\\\\\\\\\\\\\\">Clothing<\\/a>\\\\\\\\n\\\\\\\\t<\\/li>\\\\\\\\n\\\\\\\\t<li>\\\\\\\\n\\\\\\\\t<a href=\\\\\\\\\\\\\\\"#\\\\\\\\\\\\\\\"> Shoes<\\/a>\\\\\\\\n\\\\\\\\t<\\/li>\\\\\\\\n\\\\\\\\t<li>\\\\\\\\n\\\\\\\\t<a href=\\\\\\\\\\\\\\\"#\\\\\\\\\\\\\\\"> Jewelry<\\/a>\\\\\\\\n\\\\\\\\t<\\/li>\\\\\\\\n\\\\\\\\t<li>\\\\\\\\n\\\\\\\\t<a href=\\\\\\\\\\\\\\\"#\\\\\\\\\\\\\\\"> Watches<\\/a>\\\\\\\\n\\\\\\\\t<\\/li>\\\\\\\\n\\\\\\\\t<li>\\\\\\\\n\\\\\\\\t<a href=\\\\\\\\\\\\\\\"#\\\\\\\\\\\\\\\"> Handbags & Walletss<\\/a>\\\\\\\\n\\\\\\\\t<\\/li>\\\\\\\\n\\\\\\\\t<li>\\\\\\\\n\\\\\\\\t<a href=\\\\\\\\\\\\\\\"#\\\\\\\\\\\\\\\"> Accessories<\\/a>\\\\\\\\n\\\\\\\\t<\\/li>\\\\\\\\n<\\/ul>\\\\\\\",\\\\\\\"content_2\\\\\\\":\\\\\\\"<h3 class=\\\\\\\\\\\\\\\"title-footer\\\\\\\\\\\\\\\">\\\\\\\\n\\\\\\\\tfashion & accessories\\\\\\\\n<\\/h3>\\\\\\\\n<ul class=\\\\\\\\\\\\\\\"links\\\\\\\\\\\\\\\">\\\\\\\\n\\\\\\\\t<li>\\\\\\\\n\\\\\\\\t<a href=\\\\\\\\\\\\\\\"#\\\\\\\\\\\\\\\">Clothing<\\/a>\\\\\\\\n\\\\\\\\t<\\/li>\\\\\\\\n\\\\\\\\t<li>\\\\\\\\n\\\\\\\\t<a href=\\\\\\\\\\\\\\\"#\\\\\\\\\\\\\\\"> Shoes<\\/a>\\\\\\\\n\\\\\\\\t<\\/li>\\\\\\\\n\\\\\\\\t<li>\\\\\\\\n\\\\\\\\t<a href=\\\\\\\\\\\\\\\"#\\\\\\\\\\\\\\\"> Jewelry<\\/a>\\\\\\\\n\\\\\\\\t<\\/li>\\\\\\\\n\\\\\\\\t<li>\\\\\\\\n\\\\\\\\t<a href=\\\\\\\\\\\\\\\"#\\\\\\\\\\\\\\\"> Watches<\\/a>\\\\\\\\n\\\\\\\\t<\\/li>\\\\\\\\n\\\\\\\\t<li>\\\\\\\\n\\\\\\\\t<a href=\\\\\\\\\\\\\\\"#\\\\\\\\\\\\\\\"> Handbags & Walletss<\\/a>\\\\\\\\n\\\\\\\\t<\\/li>\\\\\\\\n\\\\\\\\t<li>\\\\\\\\n\\\\\\\\t<a href=\\\\\\\\\\\\\\\"#\\\\\\\\\\\\\\\"> Accessories<\\/a>\\\\\\\\n\\\\\\\\t<\\/li>\\\\\\\\n<\\/ul>\\\\\\\",\\\\\\\"yt_class\\\\\\\":\\\\\\\"\\\\\\\",\\\\\\\"css_internal\\\\\\\":\\\\\\\"\\\\\\\"}],\\\\\\\"cchild\\\\\\\":{}}\\\"}],\\\"rows\\\":[]},{\\\"text_class_id\\\":\\\"col_ldmi\\\",\\\"text_class\\\":\\\"footer--link\\\",\\\"text_color\\\":\\\"#000000\\\",\\\"link_color\\\":\\\"#000000\\\",\\\"link_hover_color\\\":\\\"#000000\\\",\\\"heading_color\\\":\\\"#000000\\\",\\\"background_type\\\":\\\"0\\\",\\\"bg_color\\\":\\\"#FFFFFF\\\",\\\"bg_opacity\\\":\\\"100%\\\",\\\"bg_image\\\":\\\"\\\",\\\"bg_repeat\\\":\\\"no-repeat\\\",\\\"bg_position\\\":\\\"center center\\\",\\\"bg_attachment\\\":\\\"fixed\\\",\\\"bg_scale\\\":\\\"cover\\\",\\\"col_video_type\\\":\\\"0\\\",\\\"col_link_video\\\":\\\"YE7VzlLtp-4\\\",\\\"padding\\\":\\\"\\\",\\\"margin\\\":\\\"\\\",\\\"lg_col\\\":\\\"15\\\",\\\"md_col\\\":\\\"15\\\",\\\"sm_col\\\":\\\"4\\\",\\\"xs_col\\\":\\\"6\\\",\\\"widgets\\\":[{\\\"name\\\":\\\"Html\\\",\\\"module\\\":\\\"html_n0x0\\\",\\\"type\\\":\\\"shortcode\\\",\\\"shortcode\\\":\\\"html\\\",\\\"content\\\":\\\"{\\\\\\\"cparent\\\\\\\":[{\\\\\\\"name_shortcode_1\\\\\\\":\\\\\\\"Footer_link_3\\\\\\\",\\\\\\\"name_shortcode_2\\\\\\\":\\\\\\\"Footer_link_3\\\\\\\",\\\\\\\"name_shortcode_status\\\\\\\":\\\\\\\"no\\\\\\\",\\\\\\\"content_1\\\\\\\":\\\\\\\"\\\\\\\\n<h3 class=\\\\\\\\\\\\\\\"title-footer\\\\\\\\\\\\\\\">\\\\\\\\ntravel & vacation\\\\\\\\n<\\/h3>\\\\\\\\n<ul class=\\\\\\\\\\\\\\\"links\\\\\\\\\\\\\\\">\\\\\\\\n<li>\\\\\\\\n<a href=\\\\\\\\\\\\\\\"#\\\\\\\\\\\\\\\">Top 10 Hotels<\\/a>\\\\\\\\n<\\/li>\\\\\\\\n<li>\\\\\\\\n<a href=\\\\\\\\\\\\\\\"#\\\\\\\\\\\\\\\"> Travel Tour<\\/a>\\\\\\\\n<\\/li>\\\\\\\\n<li>\\\\\\\\n<a href=\\\\\\\\\\\\\\\"#\\\\\\\\\\\\\\\"> Bundle Deal<\\/a>\\\\\\\\n<\\/li>\\\\\\\\n<li>\\\\\\\\n<a href=\\\\\\\\\\\\\\\"#\\\\\\\\\\\\\\\"> Top Fights<\\/a>\\\\\\\\n<\\/li>\\\\\\\\n<li>\\\\\\\\n<a href=\\\\\\\\\\\\\\\"#\\\\\\\\\\\\\\\"> Vacation Retals<\\/a>\\\\\\\\n<\\/li>\\\\\\\\n<li>\\\\\\\\n<a href=\\\\\\\\\\\\\\\"#\\\\\\\\\\\\\\\"> Cruise<\\/a>\\\\\\\\n<\\/li>\\\\\\\\n<\\/ul>\\\\\\\\n\\\\\\\",\\\\\\\"content_2\\\\\\\":\\\\\\\"\\\\\\\\n<h3 class=\\\\\\\\\\\\\\\"title-footer\\\\\\\\\\\\\\\">\\\\\\\\ntravel & vacation\\\\\\\\n<\\/h3>\\\\\\\\n<ul class=\\\\\\\\\\\\\\\"links\\\\\\\\\\\\\\\">\\\\\\\\n<li>\\\\\\\\n<a href=\\\\\\\\\\\\\\\"#\\\\\\\\\\\\\\\">Top 10 Hotels<\\/a>\\\\\\\\n<\\/li>\\\\\\\\n<li>\\\\\\\\n<a href=\\\\\\\\\\\\\\\"#\\\\\\\\\\\\\\\"> Travel Tour<\\/a>\\\\\\\\n<\\/li>\\\\\\\\n<li>\\\\\\\\n<a href=\\\\\\\\\\\\\\\"#\\\\\\\\\\\\\\\"> Bundle Deal<\\/a>\\\\\\\\n<\\/li>\\\\\\\\n<li>\\\\\\\\n<a href=\\\\\\\\\\\\\\\"#\\\\\\\\\\\\\\\"> Top Fights<\\/a>\\\\\\\\n<\\/li>\\\\\\\\n<li>\\\\\\\\n<a href=\\\\\\\\\\\\\\\"#\\\\\\\\\\\\\\\"> Vacation Retals<\\/a>\\\\\\\\n<\\/li>\\\\\\\\n<li>\\\\\\\\n<a href=\\\\\\\\\\\\\\\"#\\\\\\\\\\\\\\\"> Cruise<\\/a>\\\\\\\\n<\\/li>\\\\\\\\n<\\/ul>\\\\\\\\n\\\\\\\",\\\\\\\"yt_class\\\\\\\":\\\\\\\"\\\\\\\",\\\\\\\"css_internal\\\\\\\":\\\\\\\"\\\\\\\"}],\\\\\\\"cchild\\\\\\\":{}}\\\"}],\\\"rows\\\":[]},{\\\"text_class_id\\\":\\\"col_uoai\\\",\\\"text_class\\\":\\\"footer--link\\\",\\\"text_color\\\":\\\"#000000\\\",\\\"link_color\\\":\\\"#000000\\\",\\\"link_hover_color\\\":\\\"#000000\\\",\\\"heading_color\\\":\\\"#000000\\\",\\\"background_type\\\":\\\"0\\\",\\\"bg_color\\\":\\\"#FFFFFF\\\",\\\"bg_opacity\\\":\\\"100%\\\",\\\"bg_image\\\":\\\"\\\",\\\"bg_repeat\\\":\\\"no-repeat\\\",\\\"bg_position\\\":\\\"center center\\\",\\\"bg_attachment\\\":\\\"fixed\\\",\\\"bg_scale\\\":\\\"cover\\\",\\\"col_video_type\\\":\\\"0\\\",\\\"col_link_video\\\":\\\"YE7VzlLtp-4\\\",\\\"padding\\\":\\\"\\\",\\\"margin\\\":\\\"\\\",\\\"lg_col\\\":\\\"15\\\",\\\"md_col\\\":\\\"15\\\",\\\"sm_col\\\":\\\"4\\\",\\\"xs_col\\\":\\\"6\\\",\\\"widgets\\\":[{\\\"name\\\":\\\"Html\\\",\\\"module\\\":\\\"html_mgjw\\\",\\\"type\\\":\\\"shortcode\\\",\\\"shortcode\\\":\\\"html\\\",\\\"content\\\":\\\"{\\\\\\\"cparent\\\\\\\":[{\\\\\\\"name_shortcode_1\\\\\\\":\\\\\\\"Footer_link_4\\\\\\\",\\\\\\\"name_shortcode_2\\\\\\\":\\\\\\\"Footer_link_4\\\\\\\",\\\\\\\"name_shortcode_status\\\\\\\":\\\\\\\"no\\\\\\\",\\\\\\\"content_1\\\\\\\":\\\\\\\"<h3 class=\\\\\\\\\\\\\\\"title-footer\\\\\\\\\\\\\\\">\\\\\\\\nelectronics\\\\\\\\n<\\/h3>\\\\\\\\n<ul class=\\\\\\\\\\\\\\\"links\\\\\\\\\\\\\\\">\\\\\\\\n<li>\\\\\\\\n<a href=\\\\\\\\\\\\\\\"#\\\\\\\\\\\\\\\">Home Audio & Theater<\\/a>\\\\\\\\n<\\/li>\\\\\\\\n<li>\\\\\\\\n<a href=\\\\\\\\\\\\\\\"#\\\\\\\\\\\\\\\"> Camera<\\/a>\\\\\\\\n<\\/li>\\\\\\\\n<li>\\\\\\\\n<a href=\\\\\\\\\\\\\\\"#\\\\\\\\\\\\\\\"> Photo & Video<\\/a>\\\\\\\\n<\\/li>\\\\\\\\n<li>\\\\\\\\n<a href=\\\\\\\\\\\\\\\"#\\\\\\\\\\\\\\\"> Cell Phones<\\/a>\\\\\\\\n<\\/li>\\\\\\\\n<li>\\\\\\\\n<a href=\\\\\\\\\\\\\\\"#\\\\\\\\\\\\\\\"> Headphones<\\/a>\\\\\\\\n<\\/li>\\\\\\\\n<li>\\\\\\\\n<a href=\\\\\\\\\\\\\\\"#\\\\\\\\\\\\\\\"> Video Games<\\/a>\\\\\\\\n<\\/li>\\\\\\\\n<\\/ul>\\\\\\\",\\\\\\\"content_2\\\\\\\":\\\\\\\"<h3 class=\\\\\\\\\\\\\\\"title-footer\\\\\\\\\\\\\\\">\\\\\\\\nelectronics\\\\\\\\n<\\/h3>\\\\\\\\n<ul class=\\\\\\\\\\\\\\\"links\\\\\\\\\\\\\\\">\\\\\\\\n<li>\\\\\\\\n<a href=\\\\\\\\\\\\\\\"#\\\\\\\\\\\\\\\">Home Audio & Theater<\\/a>\\\\\\\\n<\\/li>\\\\\\\\n<li>\\\\\\\\n<a href=\\\\\\\\\\\\\\\"#\\\\\\\\\\\\\\\"> Camera<\\/a>\\\\\\\\n<\\/li>\\\\\\\\n<li>\\\\\\\\n<a href=\\\\\\\\\\\\\\\"#\\\\\\\\\\\\\\\"> Photo & Video<\\/a>\\\\\\\\n<\\/li>\\\\\\\\n<li>\\\\\\\\n<a href=\\\\\\\\\\\\\\\"#\\\\\\\\\\\\\\\"> Cell Phones<\\/a>\\\\\\\\n<\\/li>\\\\\\\\n<li>\\\\\\\\n<a href=\\\\\\\\\\\\\\\"#\\\\\\\\\\\\\\\"> Headphones<\\/a>\\\\\\\\n<\\/li>\\\\\\\\n<li>\\\\\\\\n<a href=\\\\\\\\\\\\\\\"#\\\\\\\\\\\\\\\"> Video Games<\\/a>\\\\\\\\n<\\/li>\\\\\\\\n<\\/ul>\\\\\\\",\\\\\\\"yt_class\\\\\\\":\\\\\\\"\\\\\\\",\\\\\\\"css_internal\\\\\\\":\\\\\\\"\\\\\\\"}],\\\\\\\"cchild\\\\\\\":{}}\\\"}],\\\"rows\\\":[]},{\\\"text_class_id\\\":\\\"col_77lh\\\",\\\"text_class\\\":\\\"footer--link\\\",\\\"text_color\\\":\\\"#000000\\\",\\\"link_color\\\":\\\"#000000\\\",\\\"link_hover_color\\\":\\\"#000000\\\",\\\"heading_color\\\":\\\"#000000\\\",\\\"background_type\\\":\\\"0\\\",\\\"bg_color\\\":\\\"#FFFFFF\\\",\\\"bg_opacity\\\":\\\"100%\\\",\\\"bg_image\\\":\\\"\\\",\\\"bg_repeat\\\":\\\"no-repeat\\\",\\\"bg_position\\\":\\\"center center\\\",\\\"bg_attachment\\\":\\\"fixed\\\",\\\"bg_scale\\\":\\\"cover\\\",\\\"col_video_type\\\":\\\"0\\\",\\\"col_link_video\\\":\\\"YE7VzlLtp-4\\\",\\\"padding\\\":\\\"\\\",\\\"margin\\\":\\\"\\\",\\\"lg_col\\\":\\\"15\\\",\\\"md_col\\\":\\\"15\\\",\\\"sm_col\\\":\\\"4\\\",\\\"xs_col\\\":\\\"6\\\",\\\"widgets\\\":[{\\\"name\\\":\\\"Html\\\",\\\"module\\\":\\\"html_w5io\\\",\\\"type\\\":\\\"shortcode\\\",\\\"shortcode\\\":\\\"html\\\",\\\"content\\\":\\\"{\\\\\\\"cparent\\\\\\\":[{\\\\\\\"name_shortcode_1\\\\\\\":\\\\\\\"Footer_link_5\\\\\\\",\\\\\\\"name_shortcode_2\\\\\\\":\\\\\\\"Footer_link_5\\\\\\\",\\\\\\\"name_shortcode_status\\\\\\\":\\\\\\\"no\\\\\\\",\\\\\\\"content_1\\\\\\\":\\\\\\\"<h3 class=\\\\\\\\\\\\\\\"title-footer\\\\\\\\\\\\\\\">\\\\\\\\nsport & Entertaiment\\\\\\\\n<\\/h3>\\\\\\\\n<ul class=\\\\\\\\\\\\\\\"links\\\\\\\\\\\\\\\">\\\\\\\\n<li>\\\\\\\\n<a href=\\\\\\\\\\\\\\\"#\\\\\\\\\\\\\\\">Yoga & Fitness<\\/a>\\\\\\\\n<\\/li>\\\\\\\\n<li>\\\\\\\\n<a href=\\\\\\\\\\\\\\\"#\\\\\\\\\\\\\\\"> Games<\\/a>\\\\\\\\n<\\/li>\\\\\\\\n<li>\\\\\\\\n<a href=\\\\\\\\\\\\\\\"#\\\\\\\\\\\\\\\"> Cinema<\\/a>\\\\\\\\n<\\/li>\\\\\\\\n<li>\\\\\\\\n<a href=\\\\\\\\\\\\\\\"#\\\\\\\\\\\\\\\"> Studio<\\/a>\\\\\\\\n<\\/li>\\\\\\\\n<li>\\\\\\\\n<a href=\\\\\\\\\\\\\\\"#\\\\\\\\\\\\\\\"> Music<\\/a>\\\\\\\\n<\\/li>\\\\\\\\n<li>\\\\\\\\n<a href=\\\\\\\\\\\\\\\"#\\\\\\\\\\\\\\\"> Shopping<\\/a>\\\\\\\\n<\\/li>\\\\\\\\n<\\/ul>\\\\\\\",\\\\\\\"content_2\\\\\\\":\\\\\\\"<h3 class=\\\\\\\\\\\\\\\"title-footer\\\\\\\\\\\\\\\">\\\\\\\\n\\\\\\\\tspa & massage\\\\\\\\n<\\/h3>\\\\\\\\n<ul class=\\\\\\\\\\\\\\\"links\\\\\\\\\\\\\\\">\\\\\\\\n\\\\\\\\t<li>\\\\\\\\n\\\\\\\\t<a href=\\\\\\\\\\\\\\\"#\\\\\\\\\\\\\\\">Makeup<\\/a>\\\\\\\\n\\\\\\\\t<\\/li>\\\\\\\\n\\\\\\\\t<li>\\\\\\\\n\\\\\\\\t<a href=\\\\\\\\\\\\\\\"#\\\\\\\\\\\\\\\"> Skin Care<\\/a>\\\\\\\\n\\\\\\\\t<\\/li>\\\\\\\\n\\\\\\\\t<li>\\\\\\\\n\\\\\\\\t<a href=\\\\\\\\\\\\\\\"#\\\\\\\\\\\\\\\"> Hair Care<\\/a>\\\\\\\\n\\\\\\\\t<\\/li>\\\\\\\\n\\\\\\\\t<li>\\\\\\\\n\\\\\\\\t<a href=\\\\\\\\\\\\\\\"#\\\\\\\\\\\\\\\"> Tools & Accessories<\\/a>\\\\\\\\n\\\\\\\\t<\\/li>\\\\\\\\n\\\\\\\\t<li>\\\\\\\\n\\\\\\\\t<a href=\\\\\\\\\\\\\\\"#\\\\\\\\\\\\\\\"> Perfume & Cologne<\\/a>\\\\\\\\n\\\\\\\\t<\\/li>\\\\\\\\n\\\\\\\\t<li>\\\\\\\\n\\\\\\\\t<a href=\\\\\\\\\\\\\\\"#\\\\\\\\\\\\\\\"> More to Explore<\\/a>\\\\\\\\n\\\\\\\\t<\\/li>\\\\\\\\n<\\/ul>\\\\\\\\n\\\\\\\",\\\\\\\"yt_class\\\\\\\":\\\\\\\"\\\\\\\",\\\\\\\"css_internal\\\\\\\":\\\\\\\"\\\\\\\"}],\\\\\\\"cchild\\\\\\\":{}}\\\"}],\\\"rows\\\":[]}]}]}]},{\\\"text_class_id\\\":\\\"row_mvtd\\\",\\\"text_class\\\":\\\"footer--center2\\\",\\\"text_color\\\":\\\"#000000\\\",\\\"link_color\\\":\\\"#000000\\\",\\\"link_hover_color\\\":\\\"#000000\\\",\\\"heading_color\\\":\\\"#000000\\\",\\\"background_type\\\":\\\"1\\\",\\\"bg_color\\\":\\\"#f2f5f5\\\",\\\"bg_opacity\\\":\\\"100%\\\",\\\"bg_image\\\":\\\"\\\",\\\"bg_repeat\\\":\\\"no-repeat\\\",\\\"bg_position\\\":\\\"center center\\\",\\\"bg_attachment\\\":\\\"fixed\\\",\\\"bg_scale\\\":\\\"cover\\\",\\\"video_type\\\":\\\"0\\\",\\\"link_video\\\":\\\"YE7VzlLtp-4\\\",\\\"margin\\\":\\\"\\\",\\\"padding\\\":\\\"\\\",\\\"row_container_fluid\\\":\\\"1\\\",\\\"row_section\\\":\\\"0\\\",\\\"row_section_class\\\":\\\"section-style\\\",\\\"row_section_id\\\":\\\"\\\",\\\"section_background_type\\\":\\\"0\\\",\\\"section_bg_color\\\":\\\"#FFFFFF\\\",\\\"section_bg_opacity\\\":\\\"100%\\\",\\\"section_bg_image\\\":\\\"\\\",\\\"section_bg_repeat\\\":\\\"no-repeat\\\",\\\"section_bg_position\\\":\\\"center center\\\",\\\"section_bg_attachment\\\":\\\"fixed\\\",\\\"section_bg_scale\\\":\\\"cover\\\",\\\"section_video_type\\\":\\\"0\\\",\\\"section_link_video\\\":\\\"YE7VzlLtp-4\\\",\\\"cols\\\":[{\\\"text_class_id\\\":\\\"col_6fdl\\\",\\\"text_class\\\":\\\"float_none container\\\",\\\"text_color\\\":\\\"#000000\\\",\\\"link_color\\\":\\\"#000000\\\",\\\"link_hover_color\\\":\\\"#000000\\\",\\\"heading_color\\\":\\\"#000000\\\",\\\"background_type\\\":\\\"0\\\",\\\"bg_color\\\":\\\"#FFFFFF\\\",\\\"bg_opacity\\\":\\\"100%\\\",\\\"bg_image\\\":\\\"\\\",\\\"bg_repeat\\\":\\\"no-repeat\\\",\\\"bg_position\\\":\\\"center center\\\",\\\"bg_attachment\\\":\\\"fixed\\\",\\\"bg_scale\\\":\\\"cover\\\",\\\"col_video_type\\\":\\\"0\\\",\\\"col_link_video\\\":\\\"YE7VzlLtp-4\\\",\\\"padding\\\":\\\"\\\",\\\"margin\\\":\\\"\\\",\\\"lg_col\\\":\\\"12\\\",\\\"md_col\\\":\\\"12\\\",\\\"sm_col\\\":\\\"12\\\",\\\"xs_col\\\":\\\"12\\\",\\\"widgets\\\":[],\\\"rows\\\":[{\\\"text_class_id\\\":\\\"row_hwmc\\\",\\\"text_class\\\":\\\"\\\",\\\"text_color\\\":\\\"#000000\\\",\\\"link_color\\\":\\\"#000000\\\",\\\"link_hover_color\\\":\\\"#000000\\\",\\\"heading_color\\\":\\\"#000000\\\",\\\"background_type\\\":\\\"0\\\",\\\"bg_color\\\":\\\"#FFFFFF\\\",\\\"bg_opacity\\\":\\\"100%\\\",\\\"bg_image\\\":\\\"\\\",\\\"bg_repeat\\\":\\\"no-repeat\\\",\\\"bg_position\\\":\\\"center center\\\",\\\"bg_attachment\\\":\\\"fixed\\\",\\\"bg_scale\\\":\\\"cover\\\",\\\"video_type\\\":\\\"0\\\",\\\"link_video\\\":\\\"YE7VzlLtp-4\\\",\\\"margin\\\":\\\"\\\",\\\"padding\\\":\\\"\\\",\\\"row_container_fluid\\\":\\\"0\\\",\\\"row_section\\\":\\\"0\\\",\\\"row_section_class\\\":\\\"section-style\\\",\\\"row_section_id\\\":\\\"\\\",\\\"section_background_type\\\":\\\"0\\\",\\\"section_bg_color\\\":\\\"#FFFFFF\\\",\\\"section_bg_opacity\\\":\\\"100%\\\",\\\"section_bg_image\\\":\\\"\\\",\\\"section_bg_repeat\\\":\\\"no-repeat\\\",\\\"section_bg_position\\\":\\\"center center\\\",\\\"section_bg_attachment\\\":\\\"fixed\\\",\\\"section_bg_scale\\\":\\\"cover\\\",\\\"section_video_type\\\":\\\"0\\\",\\\"section_link_video\\\":\\\"YE7VzlLtp-4\\\",\\\"cols\\\":[{\\\"text_class_id\\\":\\\"col_6ps1\\\",\\\"text_class\\\":\\\"footer--link\\\",\\\"text_color\\\":\\\"#000000\\\",\\\"link_color\\\":\\\"#000000\\\",\\\"link_hover_color\\\":\\\"#000000\\\",\\\"heading_color\\\":\\\"#000000\\\",\\\"background_type\\\":\\\"0\\\",\\\"bg_color\\\":\\\"#FFFFFF\\\",\\\"bg_opacity\\\":\\\"100%\\\",\\\"bg_image\\\":\\\"\\\",\\\"bg_repeat\\\":\\\"no-repeat\\\",\\\"bg_position\\\":\\\"center center\\\",\\\"bg_attachment\\\":\\\"fixed\\\",\\\"bg_scale\\\":\\\"cover\\\",\\\"col_video_type\\\":\\\"0\\\",\\\"col_link_video\\\":\\\"YE7VzlLtp-4\\\",\\\"padding\\\":\\\"\\\",\\\"margin\\\":\\\"\\\",\\\"lg_col\\\":\\\"15\\\",\\\"md_col\\\":\\\"15\\\",\\\"sm_col\\\":\\\"4\\\",\\\"xs_col\\\":\\\"6\\\",\\\"widgets\\\":[{\\\"name\\\":\\\"Html\\\",\\\"module\\\":\\\"html_ilfp\\\",\\\"type\\\":\\\"shortcode\\\",\\\"shortcode\\\":\\\"html\\\",\\\"content\\\":\\\"{\\\\\\\"cparent\\\\\\\":[{\\\\\\\"name_shortcode_1\\\\\\\":\\\\\\\"Footer_link_6\\\\\\\",\\\\\\\"name_shortcode_2\\\\\\\":\\\\\\\"Footer_link_6\\\\\\\",\\\\\\\"name_shortcode_status\\\\\\\":\\\\\\\"no\\\\\\\",\\\\\\\"content_1\\\\\\\":\\\\\\\"\\\\\\\\n<h3 class=\\\\\\\\\\\\\\\"title-footer\\\\\\\\\\\\\\\">\\\\\\\\n\\\\\\\\tfood & restaurant\\\\\\\\n<\\/h3>\\\\\\\\n<ul class=\\\\\\\\\\\\\\\"links\\\\\\\\\\\\\\\">\\\\\\\\n\\\\\\\\t<li>\\\\\\\\n\\\\\\\\t<a href=\\\\\\\\\\\\\\\"#\\\\\\\\\\\\\\\">Fast Food<\\/a>\\\\\\\\n\\\\\\\\t<\\/li>\\\\\\\\n\\\\\\\\t<li>\\\\\\\\n\\\\\\\\t<a href=\\\\\\\\\\\\\\\"#\\\\\\\\\\\\\\\"> Buffet<\\/a>\\\\\\\\n\\\\\\\\t<\\/li>\\\\\\\\n\\\\\\\\t<li>\\\\\\\\n\\\\\\\\t<a href=\\\\\\\\\\\\\\\"#\\\\\\\\\\\\\\\"> Caf\\u00e9<\\/a>\\\\\\\\n\\\\\\\\t<\\/li>\\\\\\\\n\\\\\\\\t<li>\\\\\\\\n\\\\\\\\t<a href=\\\\\\\\\\\\\\\"#\\\\\\\\\\\\\\\"> Drink<\\/a>\\\\\\\\n\\\\\\\\t<\\/li>\\\\\\\\n\\\\\\\\t<li>\\\\\\\\n\\\\\\\\t<a href=\\\\\\\\\\\\\\\"#\\\\\\\\\\\\\\\"> Cake<\\/a>\\\\\\\\n\\\\\\\\t<\\/li>\\\\\\\\n\\\\\\\\t<li>\\\\\\\\n\\\\\\\\t<a href=\\\\\\\\\\\\\\\"#\\\\\\\\\\\\\\\"> Restaurant<\\/a>\\\\\\\\n\\\\\\\\t<\\/li>\\\\\\\\n<\\/ul>\\\\\\\\n\\\\\\\",\\\\\\\"content_2\\\\\\\":\\\\\\\"\\\\\\\\n<h3 class=\\\\\\\\\\\\\\\"title-footer\\\\\\\\\\\\\\\">\\\\\\\\n\\\\\\\\tfood & restaurant\\\\\\\\n<\\/h3>\\\\\\\\n<ul class=\\\\\\\\\\\\\\\"links\\\\\\\\\\\\\\\">\\\\\\\\n\\\\\\\\t<li>\\\\\\\\n\\\\\\\\t<a href=\\\\\\\\\\\\\\\"#\\\\\\\\\\\\\\\">Fast Food<\\/a>\\\\\\\\n\\\\\\\\t<\\/li>\\\\\\\\n\\\\\\\\t<li>\\\\\\\\n\\\\\\\\t<a href=\\\\\\\\\\\\\\\"#\\\\\\\\\\\\\\\"> Buffet<\\/a>\\\\\\\\n\\\\\\\\t<\\/li>\\\\\\\\n\\\\\\\\t<li>\\\\\\\\n\\\\\\\\t<a href=\\\\\\\\\\\\\\\"#\\\\\\\\\\\\\\\"> Caf\\u00e9<\\/a>\\\\\\\\n\\\\\\\\t<\\/li>\\\\\\\\n\\\\\\\\t<li>\\\\\\\\n\\\\\\\\t<a href=\\\\\\\\\\\\\\\"#\\\\\\\\\\\\\\\"> Drink<\\/a>\\\\\\\\n\\\\\\\\t<\\/li>\\\\\\\\n\\\\\\\\t<li>\\\\\\\\n\\\\\\\\t<a href=\\\\\\\\\\\\\\\"#\\\\\\\\\\\\\\\"> Cake<\\/a>\\\\\\\\n\\\\\\\\t<\\/li>\\\\\\\\n\\\\\\\\t<li>\\\\\\\\n\\\\\\\\t<a href=\\\\\\\\\\\\\\\"#\\\\\\\\\\\\\\\"> Restaurant<\\/a>\\\\\\\\n\\\\\\\\t<\\/li>\\\\\\\\n<\\/ul>\\\\\\\\n\\\\\\\",\\\\\\\"yt_class\\\\\\\":\\\\\\\"\\\\\\\",\\\\\\\"css_internal\\\\\\\":\\\\\\\"\\\\\\\"}],\\\\\\\"cchild\\\\\\\":{}}\\\"}],\\\"rows\\\":[]},{\\\"text_class_id\\\":\\\"col_qprt\\\",\\\"text_class\\\":\\\"footer--link\\\",\\\"text_color\\\":\\\"#000000\\\",\\\"link_color\\\":\\\"#000000\\\",\\\"link_hover_color\\\":\\\"#000000\\\",\\\"heading_color\\\":\\\"#000000\\\",\\\"background_type\\\":\\\"0\\\",\\\"bg_color\\\":\\\"#FFFFFF\\\",\\\"bg_opacity\\\":\\\"100%\\\",\\\"bg_image\\\":\\\"\\\",\\\"bg_repeat\\\":\\\"no-repeat\\\",\\\"bg_position\\\":\\\"center center\\\",\\\"bg_attachment\\\":\\\"fixed\\\",\\\"bg_scale\\\":\\\"cover\\\",\\\"col_video_type\\\":\\\"0\\\",\\\"col_link_video\\\":\\\"YE7VzlLtp-4\\\",\\\"padding\\\":\\\"\\\",\\\"margin\\\":\\\"\\\",\\\"lg_col\\\":\\\"15\\\",\\\"md_col\\\":\\\"15\\\",\\\"sm_col\\\":\\\"4\\\",\\\"xs_col\\\":\\\"6\\\",\\\"widgets\\\":[{\\\"name\\\":\\\"Html\\\",\\\"module\\\":\\\"html_2i3e\\\",\\\"type\\\":\\\"shortcode\\\",\\\"shortcode\\\":\\\"html\\\",\\\"content\\\":\\\"{\\\\\\\"cparent\\\\\\\":[{\\\\\\\"name_shortcode_1\\\\\\\":\\\\\\\"Footer_link_7\\\\\\\",\\\\\\\"name_shortcode_2\\\\\\\":\\\\\\\"Footer_link_7\\\\\\\",\\\\\\\"name_shortcode_status\\\\\\\":\\\\\\\"no\\\\\\\",\\\\\\\"content_1\\\\\\\":\\\\\\\"\\\\\\\\n<h3 class=\\\\\\\\\\\\\\\"title-footer\\\\\\\\\\\\\\\">\\\\\\\\n\\\\\\\\thealth & beauty\\\\\\\\n<\\/h3>\\\\\\\\n<ul class=\\\\\\\\\\\\\\\"links\\\\\\\\\\\\\\\">\\\\\\\\n\\\\\\\\t<li>\\\\\\\\n\\\\\\\\t<a href=\\\\\\\\\\\\\\\"#\\\\\\\\\\\\\\\">Makeup<\\/a>\\\\\\\\n\\\\\\\\t<\\/li>\\\\\\\\n\\\\\\\\t<li>\\\\\\\\n\\\\\\\\t<a href=\\\\\\\\\\\\\\\"#\\\\\\\\\\\\\\\"> Skin Care<\\/a>\\\\\\\\n\\\\\\\\t<\\/li>\\\\\\\\n\\\\\\\\t<li>\\\\\\\\n\\\\\\\\t<a href=\\\\\\\\\\\\\\\"#\\\\\\\\\\\\\\\"> Hair Care<\\/a>\\\\\\\\n\\\\\\\\t<\\/li>\\\\\\\\n\\\\\\\\t<li>\\\\\\\\n\\\\\\\\t<a href=\\\\\\\\\\\\\\\"#\\\\\\\\\\\\\\\"> Tools & Accessories<\\/a>\\\\\\\\n\\\\\\\\t<\\/li>\\\\\\\\n\\\\\\\\t<li>\\\\\\\\n\\\\\\\\t<a href=\\\\\\\\\\\\\\\"#\\\\\\\\\\\\\\\"> Perfume & Cologne<\\/a>\\\\\\\\n\\\\\\\\t<\\/li>\\\\\\\\n\\\\\\\\t<li>\\\\\\\\n\\\\\\\\t<a href=\\\\\\\\\\\\\\\"#\\\\\\\\\\\\\\\"> More to Explore<\\/a>\\\\\\\\n\\\\\\\\t<\\/li>\\\\\\\\n<\\/ul>\\\\\\\\n\\\\\\\",\\\\\\\"content_2\\\\\\\":\\\\\\\"\\\\\\\\n<h3 class=\\\\\\\\\\\\\\\"title-footer\\\\\\\\\\\\\\\">\\\\\\\\n\\\\\\\\thealth & beauty\\\\\\\\n<\\/h3>\\\\\\\\n<ul class=\\\\\\\\\\\\\\\"links\\\\\\\\\\\\\\\">\\\\\\\\n\\\\\\\\t<li>\\\\\\\\n\\\\\\\\t<a href=\\\\\\\\\\\\\\\"#\\\\\\\\\\\\\\\">Makeup<\\/a>\\\\\\\\n\\\\\\\\t<\\/li>\\\\\\\\n\\\\\\\\t<li>\\\\\\\\n\\\\\\\\t<a href=\\\\\\\\\\\\\\\"#\\\\\\\\\\\\\\\"> Skin Care<\\/a>\\\\\\\\n\\\\\\\\t<\\/li>\\\\\\\\n\\\\\\\\t<li>\\\\\\\\n\\\\\\\\t<a href=\\\\\\\\\\\\\\\"#\\\\\\\\\\\\\\\"> Hair Care<\\/a>\\\\\\\\n\\\\\\\\t<\\/li>\\\\\\\\n\\\\\\\\t<li>\\\\\\\\n\\\\\\\\t<a href=\\\\\\\\\\\\\\\"#\\\\\\\\\\\\\\\"> Tools & Accessories<\\/a>\\\\\\\\n\\\\\\\\t<\\/li>\\\\\\\\n\\\\\\\\t<li>\\\\\\\\n\\\\\\\\t<a href=\\\\\\\\\\\\\\\"#\\\\\\\\\\\\\\\"> Perfume & Cologne<\\/a>\\\\\\\\n\\\\\\\\t<\\/li>\\\\\\\\n\\\\\\\\t<li>\\\\\\\\n\\\\\\\\t<a href=\\\\\\\\\\\\\\\"#\\\\\\\\\\\\\\\"> More to Explore<\\/a>\\\\\\\\n\\\\\\\\t<\\/li>\\\\\\\\n<\\/ul>\\\\\\\\n\\\\\\\",\\\\\\\"yt_class\\\\\\\":\\\\\\\"\\\\\\\",\\\\\\\"css_internal\\\\\\\":\\\\\\\"\\\\\\\"}],\\\\\\\"cchild\\\\\\\":{}}\\\"}],\\\"rows\\\":[]},{\\\"text_class_id\\\":\\\"col_jzhl\\\",\\\"text_class\\\":\\\"footer--link\\\",\\\"text_color\\\":\\\"#000000\\\",\\\"link_color\\\":\\\"#000000\\\",\\\"link_hover_color\\\":\\\"#000000\\\",\\\"heading_color\\\":\\\"#000000\\\",\\\"background_type\\\":\\\"0\\\",\\\"bg_color\\\":\\\"#FFFFFF\\\",\\\"bg_opacity\\\":\\\"100%\\\",\\\"bg_image\\\":\\\"\\\",\\\"bg_repeat\\\":\\\"no-repeat\\\",\\\"bg_position\\\":\\\"center center\\\",\\\"bg_attachment\\\":\\\"fixed\\\",\\\"bg_scale\\\":\\\"cover\\\",\\\"col_video_type\\\":\\\"0\\\",\\\"col_link_video\\\":\\\"YE7VzlLtp-4\\\",\\\"padding\\\":\\\"\\\",\\\"margin\\\":\\\"\\\",\\\"lg_col\\\":\\\"15\\\",\\\"md_col\\\":\\\"15\\\",\\\"sm_col\\\":\\\"4\\\",\\\"xs_col\\\":\\\"6\\\",\\\"widgets\\\":[{\\\"name\\\":\\\"Html\\\",\\\"module\\\":\\\"html_kh47\\\",\\\"type\\\":\\\"shortcode\\\",\\\"shortcode\\\":\\\"html\\\",\\\"content\\\":\\\"{\\\\\\\"cparent\\\\\\\":[{\\\\\\\"name_shortcode_1\\\\\\\":\\\\\\\"Footer_link_8\\\\\\\",\\\\\\\"name_shortcode_2\\\\\\\":\\\\\\\"Footer_link_8\\\\\\\",\\\\\\\"name_shortcode_status\\\\\\\":\\\\\\\"no\\\\\\\",\\\\\\\"content_1\\\\\\\":\\\\\\\"\\\\\\\\n<h3 class=\\\\\\\\\\\\\\\"title-footer\\\\\\\\\\\\\\\">\\\\\\\\nBook Stationery\\\\\\\\n<\\/h3>\\\\\\\\n<ul class=\\\\\\\\\\\\\\\"links\\\\\\\\\\\\\\\">\\\\\\\\n\\\\\\\\t<li>\\\\\\\\n\\\\\\\\t<a href=\\\\\\\\\\\\\\\"#\\\\\\\\\\\\\\\">Award Winners<\\/a>\\\\\\\\n\\\\\\\\t<\\/li>\\\\\\\\n\\\\\\\\t<li>\\\\\\\\n\\\\\\\\t<a href=\\\\\\\\\\\\\\\"#\\\\\\\\\\\\\\\"> Bargain Books<\\/a>\\\\\\\\n\\\\\\\\t<\\/li>\\\\\\\\n\\\\\\\\t<li>\\\\\\\\n\\\\\\\\t<a href=\\\\\\\\\\\\\\\"#\\\\\\\\\\\\\\\"> Best Books of 2016<\\/a>\\\\\\\\n\\\\\\\\t<\\/li>\\\\\\\\n\\\\\\\\t<li>\\\\\\\\n\\\\\\\\t<a href=\\\\\\\\\\\\\\\"#\\\\\\\\\\\\\\\"> Best Books of the Month<\\/a>\\\\\\\\n\\\\\\\\t<\\/li>\\\\\\\\n\\\\\\\\t<li>\\\\\\\\n\\\\\\\\t<a href=\\\\\\\\\\\\\\\"#\\\\\\\\\\\\\\\"> Books in Spanish<\\/a>\\\\\\\\n\\\\\\\\t<\\/li>\\\\\\\\n\\\\\\\\t<li>\\\\\\\\n\\\\\\\\t<a href=\\\\\\\\\\\\\\\"#\\\\\\\\\\\\\\\"> Children Books<\\/a>\\\\\\\\n\\\\\\\\t<\\/li>\\\\\\\\n<\\/ul>\\\\\\\\n\\\\\\\",\\\\\\\"content_2\\\\\\\":\\\\\\\"\\\\\\\\n<h3 class=\\\\\\\\\\\\\\\"title-footer\\\\\\\\\\\\\\\">\\\\\\\\nBook Stationery\\\\\\\\n<\\/h3>\\\\\\\\n<ul class=\\\\\\\\\\\\\\\"links\\\\\\\\\\\\\\\">\\\\\\\\n\\\\\\\\t<li>\\\\\\\\n\\\\\\\\t<a href=\\\\\\\\\\\\\\\"#\\\\\\\\\\\\\\\">Award Winners<\\/a>\\\\\\\\n\\\\\\\\t<\\/li>\\\\\\\\n\\\\\\\\t<li>\\\\\\\\n\\\\\\\\t<a href=\\\\\\\\\\\\\\\"#\\\\\\\\\\\\\\\"> Bargain Books<\\/a>\\\\\\\\n\\\\\\\\t<\\/li>\\\\\\\\n\\\\\\\\t<li>\\\\\\\\n\\\\\\\\t<a href=\\\\\\\\\\\\\\\"#\\\\\\\\\\\\\\\"> Best Books of 2016<\\/a>\\\\\\\\n\\\\\\\\t<\\/li>\\\\\\\\n\\\\\\\\t<li>\\\\\\\\n\\\\\\\\t<a href=\\\\\\\\\\\\\\\"#\\\\\\\\\\\\\\\"> Best Books of the Month<\\/a>\\\\\\\\n\\\\\\\\t<\\/li>\\\\\\\\n\\\\\\\\t<li>\\\\\\\\n\\\\\\\\t<a href=\\\\\\\\\\\\\\\"#\\\\\\\\\\\\\\\"> Books in Spanish<\\/a>\\\\\\\\n\\\\\\\\t<\\/li>\\\\\\\\n\\\\\\\\t<li>\\\\\\\\n\\\\\\\\t<a href=\\\\\\\\\\\\\\\"#\\\\\\\\\\\\\\\"> Children Books<\\/a>\\\\\\\\n\\\\\\\\t<\\/li>\\\\\\\\n<\\/ul>\\\\\\\\n\\\\\\\",\\\\\\\"yt_class\\\\\\\":\\\\\\\"\\\\\\\",\\\\\\\"css_internal\\\\\\\":\\\\\\\"\\\\\\\"}],\\\\\\\"cchild\\\\\\\":{}}\\\"}],\\\"rows\\\":[]},{\\\"text_class_id\\\":\\\"col_kefr\\\",\\\"text_class\\\":\\\"footer--link\\\",\\\"text_color\\\":\\\"#000000\\\",\\\"link_color\\\":\\\"#000000\\\",\\\"link_hover_color\\\":\\\"#000000\\\",\\\"heading_color\\\":\\\"#000000\\\",\\\"background_type\\\":\\\"0\\\",\\\"bg_color\\\":\\\"#FFFFFF\\\",\\\"bg_opacity\\\":\\\"100%\\\",\\\"bg_image\\\":\\\"\\\",\\\"bg_repeat\\\":\\\"no-repeat\\\",\\\"bg_position\\\":\\\"center center\\\",\\\"bg_attachment\\\":\\\"fixed\\\",\\\"bg_scale\\\":\\\"cover\\\",\\\"col_video_type\\\":\\\"0\\\",\\\"col_link_video\\\":\\\"YE7VzlLtp-4\\\",\\\"padding\\\":\\\"\\\",\\\"margin\\\":\\\"\\\",\\\"lg_col\\\":\\\"15\\\",\\\"md_col\\\":\\\"15\\\",\\\"sm_col\\\":\\\"4\\\",\\\"xs_col\\\":\\\"6\\\",\\\"widgets\\\":[{\\\"name\\\":\\\"Html\\\",\\\"module\\\":\\\"html_ayyv\\\",\\\"type\\\":\\\"shortcode\\\",\\\"shortcode\\\":\\\"html\\\",\\\"content\\\":\\\"{\\\\\\\"cparent\\\\\\\":[{\\\\\\\"name_shortcode_1\\\\\\\":\\\\\\\"Footer_link_9\\\\\\\",\\\\\\\"name_shortcode_2\\\\\\\":\\\\\\\"Footer_link_9\\\\\\\",\\\\\\\"name_shortcode_status\\\\\\\":\\\\\\\"no\\\\\\\",\\\\\\\"content_1\\\\\\\":\\\\\\\"<h3 class=\\\\\\\\\\\\\\\"title-footer\\\\\\\\\\\\\\\">\\\\\\\\n\\\\\\\\tReal house\\\\\\\\n<\\/h3>\\\\\\\\n<ul class=\\\\\\\\\\\\\\\"links\\\\\\\\\\\\\\\">\\\\\\\\n\\\\\\\\t<li>\\\\\\\\n\\\\\\\\t<a href=\\\\\\\\\\\\\\\"#\\\\\\\\\\\\\\\">Makeup<\\/a>\\\\\\\\n\\\\\\\\t<\\/li>\\\\\\\\n\\\\\\\\t<li>\\\\\\\\n\\\\\\\\t<a href=\\\\\\\\\\\\\\\"#\\\\\\\\\\\\\\\"> Skin Care<\\/a>\\\\\\\\n\\\\\\\\t<\\/li>\\\\\\\\n\\\\\\\\t<li>\\\\\\\\n\\\\\\\\t<a href=\\\\\\\\\\\\\\\"#\\\\\\\\\\\\\\\"> Hair Care<\\/a>\\\\\\\\n\\\\\\\\t<\\/li>\\\\\\\\n\\\\\\\\t<li>\\\\\\\\n\\\\\\\\t<a href=\\\\\\\\\\\\\\\"#\\\\\\\\\\\\\\\"> Tools & Accessories<\\/a>\\\\\\\\n\\\\\\\\t<\\/li>\\\\\\\\n\\\\\\\\t<li>\\\\\\\\n\\\\\\\\t<a href=\\\\\\\\\\\\\\\"#\\\\\\\\\\\\\\\"> Perfume & Cologne<\\/a>\\\\\\\\n\\\\\\\\t<\\/li>\\\\\\\\n\\\\\\\\t<li>\\\\\\\\n\\\\\\\\t<a href=\\\\\\\\\\\\\\\"#\\\\\\\\\\\\\\\"> More to Explore<\\/a>\\\\\\\\n\\\\\\\\t<\\/li>\\\\\\\\n<\\/ul>\\\\\\\",\\\\\\\"content_2\\\\\\\":\\\\\\\"<h3 class=\\\\\\\\\\\\\\\"title-footer\\\\\\\\\\\\\\\">\\\\\\\\n\\\\\\\\tReal house\\\\\\\\n<\\/h3>\\\\\\\\n<ul class=\\\\\\\\\\\\\\\"links\\\\\\\\\\\\\\\">\\\\\\\\n\\\\\\\\t<li>\\\\\\\\n\\\\\\\\t<a href=\\\\\\\\\\\\\\\"#\\\\\\\\\\\\\\\">Makeup<\\/a>\\\\\\\\n\\\\\\\\t<\\/li>\\\\\\\\n\\\\\\\\t<li>\\\\\\\\n\\\\\\\\t<a href=\\\\\\\\\\\\\\\"#\\\\\\\\\\\\\\\"> Skin Care<\\/a>\\\\\\\\n\\\\\\\\t<\\/li>\\\\\\\\n\\\\\\\\t<li>\\\\\\\\n\\\\\\\\t<a href=\\\\\\\\\\\\\\\"#\\\\\\\\\\\\\\\"> Hair Care<\\/a>\\\\\\\\n\\\\\\\\t<\\/li>\\\\\\\\n\\\\\\\\t<li>\\\\\\\\n\\\\\\\\t<a href=\\\\\\\\\\\\\\\"#\\\\\\\\\\\\\\\"> Tools & Accessories<\\/a>\\\\\\\\n\\\\\\\\t<\\/li>\\\\\\\\n\\\\\\\\t<li>\\\\\\\\n\\\\\\\\t<a href=\\\\\\\\\\\\\\\"#\\\\\\\\\\\\\\\"> Perfume & Cologne<\\/a>\\\\\\\\n\\\\\\\\t<\\/li>\\\\\\\\n\\\\\\\\t<li>\\\\\\\\n\\\\\\\\t<a href=\\\\\\\\\\\\\\\"#\\\\\\\\\\\\\\\"> More to Explore<\\/a>\\\\\\\\n\\\\\\\\t<\\/li>\\\\\\\\n<\\/ul>\\\\\\\",\\\\\\\"yt_class\\\\\\\":\\\\\\\"\\\\\\\",\\\\\\\"css_internal\\\\\\\":\\\\\\\"\\\\\\\"}],\\\\\\\"cchild\\\\\\\":{}}\\\"}],\\\"rows\\\":[]},{\\\"text_class_id\\\":\\\"col_mtmx\\\",\\\"text_class\\\":\\\"footer--link\\\",\\\"text_color\\\":\\\"#000000\\\",\\\"link_color\\\":\\\"#000000\\\",\\\"link_hover_color\\\":\\\"#000000\\\",\\\"heading_color\\\":\\\"#000000\\\",\\\"background_type\\\":\\\"0\\\",\\\"bg_color\\\":\\\"#FFFFFF\\\",\\\"bg_opacity\\\":\\\"100%\\\",\\\"bg_image\\\":\\\"\\\",\\\"bg_repeat\\\":\\\"no-repeat\\\",\\\"bg_position\\\":\\\"center center\\\",\\\"bg_attachment\\\":\\\"fixed\\\",\\\"bg_scale\\\":\\\"cover\\\",\\\"col_video_type\\\":\\\"0\\\",\\\"col_link_video\\\":\\\"YE7VzlLtp-4\\\",\\\"padding\\\":\\\"\\\",\\\"margin\\\":\\\"\\\",\\\"lg_col\\\":\\\"15\\\",\\\"md_col\\\":\\\"15\\\",\\\"sm_col\\\":\\\"4\\\",\\\"xs_col\\\":\\\"6\\\",\\\"widgets\\\":[{\\\"name\\\":\\\"Html\\\",\\\"module\\\":\\\"html_6fns\\\",\\\"type\\\":\\\"shortcode\\\",\\\"shortcode\\\":\\\"html\\\",\\\"content\\\":\\\"{\\\\\\\"cparent\\\\\\\":[{\\\\\\\"name_shortcode_1\\\\\\\":\\\\\\\"Footer_link_10\\\\\\\",\\\\\\\"name_shortcode_2\\\\\\\":\\\\\\\"Footer_link_10\\\\\\\",\\\\\\\"name_shortcode_status\\\\\\\":\\\\\\\"no\\\\\\\",\\\\\\\"content_1\\\\\\\":\\\\\\\"<h3 class=\\\\\\\\\\\\\\\"title-footer\\\\\\\\\\\\\\\">\\\\\\\\n\\\\\\\\tMom & baby care\\\\\\\\n<\\/h3>\\\\\\\\n<ul class=\\\\\\\\\\\\\\\"links\\\\\\\\\\\\\\\">\\\\\\\\n\\\\\\\\t<li>\\\\\\\\n\\\\\\\\t<a href=\\\\\\\\\\\\\\\"#\\\\\\\\\\\\\\\">Award Winners<\\/a>\\\\\\\\n\\\\\\\\t<\\/li>\\\\\\\\n\\\\\\\\t<li>\\\\\\\\n\\\\\\\\t<a href=\\\\\\\\\\\\\\\"#\\\\\\\\\\\\\\\"> Bargain Books<\\/a>\\\\\\\\n\\\\\\\\t<\\/li>\\\\\\\\n\\\\\\\\t<li>\\\\\\\\n\\\\\\\\t<a href=\\\\\\\\\\\\\\\"#\\\\\\\\\\\\\\\"> Best Books of 2016<\\/a>\\\\\\\\n\\\\\\\\t<\\/li>\\\\\\\\n\\\\\\\\t<li>\\\\\\\\n\\\\\\\\t<a href=\\\\\\\\\\\\\\\"#\\\\\\\\\\\\\\\"> Best Books of the Month<\\/a>\\\\\\\\n\\\\\\\\t<\\/li>\\\\\\\\n\\\\\\\\t<li>\\\\\\\\n\\\\\\\\t<a href=\\\\\\\\\\\\\\\"#\\\\\\\\\\\\\\\"> Books in Spanish<\\/a>\\\\\\\\n\\\\\\\\t<\\/li>\\\\\\\\n\\\\\\\\t<li>\\\\\\\\n\\\\\\\\t<a href=\\\\\\\\\\\\\\\"#\\\\\\\\\\\\\\\"> Children Books<\\/a>\\\\\\\\n\\\\\\\\t<\\/li>\\\\\\\\n<\\/ul>\\\\\\\",\\\\\\\"content_2\\\\\\\":\\\\\\\"<h3 class=\\\\\\\\\\\\\\\"title-footer\\\\\\\\\\\\\\\">\\\\\\\\n\\\\\\\\tMom & baby care\\\\\\\\n<\\/h3>\\\\\\\\n<ul class=\\\\\\\\\\\\\\\"links\\\\\\\\\\\\\\\">\\\\\\\\n\\\\\\\\t<li>\\\\\\\\n\\\\\\\\t<a href=\\\\\\\\\\\\\\\"#\\\\\\\\\\\\\\\">Award Winners<\\/a>\\\\\\\\n\\\\\\\\t<\\/li>\\\\\\\\n\\\\\\\\t<li>\\\\\\\\n\\\\\\\\t<a href=\\\\\\\\\\\\\\\"#\\\\\\\\\\\\\\\"> Bargain Books<\\/a>\\\\\\\\n\\\\\\\\t<\\/li>\\\\\\\\n\\\\\\\\t<li>\\\\\\\\n\\\\\\\\t<a href=\\\\\\\\\\\\\\\"#\\\\\\\\\\\\\\\"> Best Books of 2016<\\/a>\\\\\\\\n\\\\\\\\t<\\/li>\\\\\\\\n\\\\\\\\t<li>\\\\\\\\n\\\\\\\\t<a href=\\\\\\\\\\\\\\\"#\\\\\\\\\\\\\\\"> Best Books of the Month<\\/a>\\\\\\\\n\\\\\\\\t<\\/li>\\\\\\\\n\\\\\\\\t<li>\\\\\\\\n\\\\\\\\t<a href=\\\\\\\\\\\\\\\"#\\\\\\\\\\\\\\\"> Books in Spanish<\\/a>\\\\\\\\n\\\\\\\\t<\\/li>\\\\\\\\n\\\\\\\\t<li>\\\\\\\\n\\\\\\\\t<a href=\\\\\\\\\\\\\\\"#\\\\\\\\\\\\\\\"> Children Books<\\/a>\\\\\\\\n\\\\\\\\t<\\/li>\\\\\\\\n<\\/ul>\\\\\\\",\\\\\\\"yt_class\\\\\\\":\\\\\\\"\\\\\\\",\\\\\\\"css_internal\\\\\\\":\\\\\\\"\\\\\\\"}],\\\\\\\"cchild\\\\\\\":{}}\\\"}],\\\"rows\\\":[]}]}]}]},{\\\"text_class_id\\\":\\\"row_qof8\\\",\\\"text_class\\\":\\\"footer--center3\\\",\\\"text_color\\\":\\\"#000000\\\",\\\"link_color\\\":\\\"#000000\\\",\\\"link_hover_color\\\":\\\"#000000\\\",\\\"heading_color\\\":\\\"#000000\\\",\\\"background_type\\\":\\\"1\\\",\\\"bg_color\\\":\\\"#fff\\\",\\\"bg_opacity\\\":\\\"100%\\\",\\\"bg_image\\\":\\\"\\\",\\\"bg_repeat\\\":\\\"no-repeat\\\",\\\"bg_position\\\":\\\"center center\\\",\\\"bg_attachment\\\":\\\"fixed\\\",\\\"bg_scale\\\":\\\"cover\\\",\\\"video_type\\\":\\\"0\\\",\\\"link_video\\\":\\\"YE7VzlLtp-4\\\",\\\"margin\\\":\\\"\\\",\\\"padding\\\":\\\"\\\",\\\"row_container_fluid\\\":\\\"1\\\",\\\"row_section\\\":\\\"0\\\",\\\"row_section_class\\\":\\\"section-style\\\",\\\"row_section_id\\\":\\\"\\\",\\\"section_background_type\\\":\\\"0\\\",\\\"section_bg_color\\\":\\\"#FFFFFF\\\",\\\"section_bg_opacity\\\":\\\"100%\\\",\\\"section_bg_image\\\":\\\"\\\",\\\"section_bg_repeat\\\":\\\"no-repeat\\\",\\\"section_bg_position\\\":\\\"center center\\\",\\\"section_bg_attachment\\\":\\\"fixed\\\",\\\"section_bg_scale\\\":\\\"cover\\\",\\\"section_video_type\\\":\\\"0\\\",\\\"section_link_video\\\":\\\"YE7VzlLtp-4\\\",\\\"cols\\\":[{\\\"text_class_id\\\":\\\"col_up4v\\\",\\\"text_class\\\":\\\"float_none \\\",\\\"text_color\\\":\\\"#000000\\\",\\\"link_color\\\":\\\"#000000\\\",\\\"link_hover_color\\\":\\\"#000000\\\",\\\"heading_color\\\":\\\"#000000\\\",\\\"background_type\\\":\\\"0\\\",\\\"bg_color\\\":\\\"#FFFFFF\\\",\\\"bg_opacity\\\":\\\"100%\\\",\\\"bg_image\\\":\\\"\\\",\\\"bg_repeat\\\":\\\"no-repeat\\\",\\\"bg_position\\\":\\\"center center\\\",\\\"bg_attachment\\\":\\\"fixed\\\",\\\"bg_scale\\\":\\\"cover\\\",\\\"col_video_type\\\":\\\"0\\\",\\\"col_link_video\\\":\\\"YE7VzlLtp-4\\\",\\\"padding\\\":\\\"\\\",\\\"margin\\\":\\\"\\\",\\\"lg_col\\\":\\\"12\\\",\\\"md_col\\\":\\\"12\\\",\\\"sm_col\\\":\\\"12\\\",\\\"xs_col\\\":\\\"12\\\",\\\"widgets\\\":[],\\\"rows\\\":[{\\\"text_class_id\\\":\\\"row_fymn\\\",\\\"text_class\\\":\\\"\\\",\\\"text_color\\\":\\\"#000000\\\",\\\"link_color\\\":\\\"#000000\\\",\\\"link_hover_color\\\":\\\"#000000\\\",\\\"heading_color\\\":\\\"#000000\\\",\\\"background_type\\\":\\\"0\\\",\\\"bg_color\\\":\\\"#FFFFFF\\\",\\\"bg_opacity\\\":\\\"100%\\\",\\\"bg_image\\\":\\\"\\\",\\\"bg_repeat\\\":\\\"no-repeat\\\",\\\"bg_position\\\":\\\"center center\\\",\\\"bg_attachment\\\":\\\"fixed\\\",\\\"bg_scale\\\":\\\"cover\\\",\\\"video_type\\\":\\\"0\\\",\\\"link_video\\\":\\\"YE7VzlLtp-4\\\",\\\"margin\\\":\\\"\\\",\\\"padding\\\":\\\"\\\",\\\"row_container_fluid\\\":\\\"0\\\",\\\"row_section\\\":\\\"0\\\",\\\"row_section_class\\\":\\\"section-style\\\",\\\"row_section_id\\\":\\\"\\\",\\\"section_background_type\\\":\\\"0\\\",\\\"section_bg_color\\\":\\\"#FFFFFF\\\",\\\"section_bg_opacity\\\":\\\"100%\\\",\\\"section_bg_image\\\":\\\"\\\",\\\"section_bg_repeat\\\":\\\"no-repeat\\\",\\\"section_bg_position\\\":\\\"center center\\\",\\\"section_bg_attachment\\\":\\\"fixed\\\",\\\"section_bg_scale\\\":\\\"cover\\\",\\\"section_video_type\\\":\\\"0\\\",\\\"section_link_video\\\":\\\"YE7VzlLtp-4\\\",\\\"cols\\\":[{\\\"text_class_id\\\":\\\"col_1yf0\\\",\\\"text_class\\\":\\\"\\\",\\\"text_color\\\":\\\"#000000\\\",\\\"link_color\\\":\\\"#000000\\\",\\\"link_hover_color\\\":\\\"#000000\\\",\\\"heading_color\\\":\\\"#000000\\\",\\\"background_type\\\":\\\"0\\\",\\\"bg_color\\\":\\\"#FFFFFF\\\",\\\"bg_opacity\\\":\\\"100%\\\",\\\"bg_image\\\":\\\"\\\",\\\"bg_repeat\\\":\\\"no-repeat\\\",\\\"bg_position\\\":\\\"center center\\\",\\\"bg_attachment\\\":\\\"fixed\\\",\\\"bg_scale\\\":\\\"cover\\\",\\\"col_video_type\\\":\\\"0\\\",\\\"col_link_video\\\":\\\"YE7VzlLtp-4\\\",\\\"padding\\\":\\\"\\\",\\\"margin\\\":\\\"\\\",\\\"lg_col\\\":\\\"12\\\",\\\"md_col\\\":\\\"12\\\",\\\"sm_col\\\":\\\"12\\\",\\\"xs_col\\\":\\\"12\\\",\\\"widgets\\\":[{\\\"name\\\":\\\"Html\\\",\\\"module\\\":\\\"html_mm9y\\\",\\\"type\\\":\\\"shortcode\\\",\\\"shortcode\\\":\\\"html\\\",\\\"content\\\":\\\"{\\\\\\\"cparent\\\\\\\":[{\\\\\\\"name_shortcode_1\\\\\\\":\\\\\\\"Footer_Contact\\\\\\\",\\\\\\\"name_shortcode_status\\\\\\\":\\\\\\\"no\\\\\\\",\\\\\\\"content_1\\\\\\\":\\\\\\\"<div class=\\\\\\\\\\\\\\\"contactinfo\\\\\\\\\\\\\\\">\\\\\\\\n\\\\\\\\t<h4 class=\\\\\\\\\\\\\\\"title-footer\\\\\\\\\\\\\\\">Our Contact<\\/h4><div class=\\\\\\\\\\\\\\\"content-footer\\\\\\\\\\\\\\\">\\\\\\\\n\\\\\\\\t\\\\\\\\t<div class=\\\\\\\\\\\\\\\"address\\\\\\\\\\\\\\\">\\\\\\\\n\\\\\\\\t\\\\\\\\t\\\\\\\\t<label><i class=\\\\\\\\\\\\\\\"fa fa-map-marker\\\\\\\\\\\\\\\" aria-hidden=\\\\\\\\\\\\\\\"true\\\\\\\\\\\\\\\"><\\/i><\\/label>\\\\\\\\n\\\\\\\\t\\\\\\\\t\\\\\\\\t<span>M.I.D.C Andheri East, Mumbai - 93<\\/span>\\\\\\\\n\\\\\\\\t\\\\\\\\t<\\/div>\\\\\\\\n\\\\\\\\t\\\\\\\\t<div class=\\\\\\\\\\\\\\\"phone\\\\\\\\\\\\\\\">\\\\\\\\n\\\\\\\\t\\\\\\\\t\\\\\\\\t<label><i class=\\\\\\\\\\\\\\\"fa fa-phone\\\\\\\\\\\\\\\" aria-hidden=\\\\\\\\\\\\\\\"true\\\\\\\\\\\\\\\"><\\/i><\\/label>\\\\\\\\n\\\\\\\\t\\\\\\\\t\\\\\\\\t<span>( +91 ) 22 - 6526 0008<\\/span>\\\\\\\\n\\\\\\\\t\\\\\\\\t<\\/div>\\\\\\\\n\\\\\\\\t\\\\\\\\t<div class=\\\\\\\\\\\\\\\"email\\\\\\\\\\\\\\\">\\\\\\\\n\\\\\\\\t\\\\\\\\t\\\\\\\\t<label><i class=\\\\\\\\\\\\\\\"fa fa-envelope\\\\\\\\\\\\\\\"><\\/i><\\/label>\\\\\\\\n\\\\\\\\t\\\\\\\\t\\\\\\\\t<a href=\\\\\\\\\\\\\\\"#\\\\\\\\\\\\\\\">support@sezplus.com<\\/a>\\\\\\\\n\\\\\\\\t\\\\\\\\t<\\/div>\\\\\\\\n\\\\\\\\t<\\/div>\\\\\\\\n<\\/div>\\\\\\\",\\\\\\\"yt_class\\\\\\\":\\\\\\\"\\\\\\\",\\\\\\\"css_internal\\\\\\\":\\\\\\\"\\\\\\\"}],\\\\\\\"cchild\\\\\\\":{}}\\\"}],\\\"rows\\\":[]}]}]}]}]\",\"name\":\"Footer 1 - CUSTOM\",\"status\":\"1\",\"import_theme\":\"0\",\"content_shortcode\":\"{&quot;cparent&quot;:[{&quot;name_shortcode_1&quot;:&quot;Footer_Contact&quot;,&quot;name_shortcode_status&quot;:&quot;no&quot;,&quot;content_1&quot;:&quot;&lt;div class=\\\\&quot;contactinfo\\\\&quot;&gt;\\\\n\\\\t&lt;h4 class=\\\\&quot;title-footer\\\\&quot;&gt;Our Contact&lt;\\/h4&gt;&lt;div class=\\\\&quot;content-footer\\\\&quot;&gt;\\\\n\\\\t\\\\t&lt;div class=\\\\&quot;address\\\\&quot;&gt;\\\\n\\\\t\\\\t\\\\t&lt;label&gt;&lt;i class=\\\\&quot;fa fa-map-marker\\\\&quot; aria-hidden=\\\\&quot;true\\\\&quot;&gt;&lt;\\/i&gt;&lt;\\/label&gt;\\\\n\\\\t\\\\t\\\\t&lt;span&gt;M.I.D.C Andheri East, Mumbai - 93&lt;\\/span&gt;\\\\n\\\\t\\\\t&lt;\\/div&gt;\\\\n\\\\t\\\\t&lt;div class=\\\\&quot;phone\\\\&quot;&gt;\\\\n\\\\t\\\\t\\\\t&lt;label&gt;&lt;i class=\\\\&quot;fa fa-phone\\\\&quot; aria-hidden=\\\\&quot;true\\\\&quot;&gt;&lt;\\/i&gt;&lt;\\/label&gt;\\\\n\\\\t\\\\t\\\\t&lt;span&gt;( +91 ) 22 - 6526 0008&lt;\\/span&gt;\\\\n\\\\t\\\\t&lt;\\/div&gt;\\\\n\\\\t\\\\t&lt;div class=\\\\&quot;email\\\\&quot;&gt;\\\\n\\\\t\\\\t\\\\t&lt;label&gt;&lt;i class=\\\\&quot;fa fa-envelope\\\\&quot;&gt;&lt;\\/i&gt;&lt;\\/label&gt;\\\\n\\\\t\\\\t\\\\t&lt;a href=\\\\&quot;#\\\\&quot;&gt;support@sezplus.com&lt;\\/a&gt;\\\\n\\\\t\\\\t&lt;\\/div&gt;\\\\n\\\\t&lt;\\/div&gt;\\\\n&lt;\\/div&gt;&quot;,&quot;yt_class&quot;:&quot;&quot;,&quot;css_internal&quot;:&quot;&quot;}],&quot;cchild&quot;:{}}\",\"moduleid\":\"330\"}');

INSERT INTO `module` (`module_id`, `name`, `code`, `setting`)
VALUES
	(343,'Filter Gender By','so_filter_shop_by','{\"action\":\"save_edit\",\"name\":\"Filter Gender By\",\"module_description\":{\"1\":{\"head_name\":\"Gender\"}},\"head_name\":\"Gender\",\"disp_title_module\":\"1\",\"status\":\"1\",\"class_suffix\":\"block-shopby\",\"in_class\":\"#content .row\",\"use_cache\":\"0\",\"cache_time\":\"3600\",\"disp_manu_all\":\"0\",\"disp_manu_id_5\":\"1\",\"disp_manu_id_6\":\"1\",\"disp_manu_id_7\":\"1\",\"disp_manu_id_8\":\"1\",\"disp_manu_id_9\":\"1\",\"disp_manu_id_10\":\"1\",\"disp_pro_price\":\"1\",\"disp_search_text\":\"1\",\"character_search\":\"3\",\"disp_subcategory\":\"1\",\"disp_reset_all\":\"1\",\"disp_att_group_id_6\":\"0\",\"disp_att_id_1\":\"1\",\"disp_att_id_2\":\"1\",\"disp_att_id_3\":\"1\",\"disp_att_group_id_3\":\"0\",\"disp_att_id_4\":\"1\",\"disp_att_id_5\":\"1\",\"disp_att_id_6\":\"1\",\"disp_att_id_7\":\"1\",\"disp_att_id_8\":\"1\",\"disp_att_id_9\":\"1\",\"disp_att_id_10\":\"1\",\"disp_att_id_11\":\"1\",\"disp_opt_id_1\":\"1\",\"disp_opt_id_2\":\"1\",\"disp_opt_id_5\":\"1\",\"disp_opt_id_11\":\"1\",\"moduleid\":\"343\"}');

/*!40000 ALTER TABLE `module` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table newsletter_custom_popup
# ------------------------------------------------------------

DROP TABLE IF EXISTS `newsletter_custom_popup`;

CREATE TABLE `newsletter_custom_popup` (
  `news_id` int(11) NOT NULL AUTO_INCREMENT,
  `news_email` varchar(255) NOT NULL,
  `news_create_date` datetime NOT NULL,
  `news_status` tinyint(1) NOT NULL,
  `confirm_mail` tinyint(1) NOT NULL,
  PRIMARY KEY (`news_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;



# Dump of table option
# ------------------------------------------------------------

DROP TABLE IF EXISTS `option`;

CREATE TABLE `option` (
  `option_id` int(11) NOT NULL AUTO_INCREMENT,
  `type` varchar(32) NOT NULL,
  `sort_order` int(3) NOT NULL,
  PRIMARY KEY (`option_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

LOCK TABLES `option` WRITE;
/*!40000 ALTER TABLE `option` DISABLE KEYS */;

INSERT INTO `option` (`option_id`, `type`, `sort_order`)
VALUES
	(1,'radio',1),
	(2,'checkbox',2),
	(4,'text',3),
	(5,'select',4),
	(6,'textarea',5),
	(7,'file',6),
	(8,'date',7),
	(9,'time',8),
	(10,'datetime',9),
	(11,'select',10),
	(12,'date',11);

/*!40000 ALTER TABLE `option` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table option_description
# ------------------------------------------------------------

DROP TABLE IF EXISTS `option_description`;

CREATE TABLE `option_description` (
  `option_id` int(11) NOT NULL,
  `language_id` int(11) NOT NULL,
  `name` varchar(128) NOT NULL,
  PRIMARY KEY (`option_id`,`language_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

LOCK TABLES `option_description` WRITE;
/*!40000 ALTER TABLE `option_description` DISABLE KEYS */;

INSERT INTO `option_description` (`option_id`, `language_id`, `name`)
VALUES
	(1,1,'Radio'),
	(2,1,'Checkbox'),
	(4,1,'Text'),
	(6,1,'Textarea'),
	(8,1,'Date'),
	(7,1,'File'),
	(5,1,'Select'),
	(9,1,'Time'),
	(10,1,'Date &amp; Time'),
	(12,1,'Delivery Date'),
	(11,1,'Size');

/*!40000 ALTER TABLE `option_description` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table option_value
# ------------------------------------------------------------

DROP TABLE IF EXISTS `option_value`;

CREATE TABLE `option_value` (
  `option_value_id` int(11) NOT NULL AUTO_INCREMENT,
  `option_id` int(11) NOT NULL,
  `image` varchar(255) NOT NULL,
  `sort_order` int(3) NOT NULL,
  PRIMARY KEY (`option_value_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

LOCK TABLES `option_value` WRITE;
/*!40000 ALTER TABLE `option_value` DISABLE KEYS */;

INSERT INTO `option_value` (`option_value_id`, `option_id`, `image`, `sort_order`)
VALUES
	(43,1,'',3),
	(32,1,'',1),
	(45,2,'',4),
	(44,2,'',3),
	(42,5,'',4),
	(41,5,'',3),
	(39,5,'',1),
	(40,5,'',2),
	(31,1,'',2),
	(23,2,'',1),
	(24,2,'',2),
	(46,11,'',1),
	(47,11,'',2),
	(48,11,'',3);

/*!40000 ALTER TABLE `option_value` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table option_value_description
# ------------------------------------------------------------

DROP TABLE IF EXISTS `option_value_description`;

CREATE TABLE `option_value_description` (
  `option_value_id` int(11) NOT NULL,
  `language_id` int(11) NOT NULL,
  `option_id` int(11) NOT NULL,
  `name` varchar(128) NOT NULL,
  PRIMARY KEY (`option_value_id`,`language_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

LOCK TABLES `option_value_description` WRITE;
/*!40000 ALTER TABLE `option_value_description` DISABLE KEYS */;

INSERT INTO `option_value_description` (`option_value_id`, `language_id`, `option_id`, `name`)
VALUES
	(43,1,1,'Large'),
	(32,1,1,'Small'),
	(45,1,2,'Checkbox 4'),
	(44,1,2,'Checkbox 3'),
	(31,1,1,'Medium'),
	(42,1,5,'Yellow'),
	(41,1,5,'Green'),
	(39,1,5,'Red'),
	(40,1,5,'Blue'),
	(23,1,2,'Checkbox 1'),
	(24,1,2,'Checkbox 2'),
	(48,1,11,'Large'),
	(47,1,11,'Medium'),
	(46,1,11,'Small');

/*!40000 ALTER TABLE `option_value_description` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table order
# ------------------------------------------------------------

DROP TABLE IF EXISTS `order`;

CREATE TABLE `order` (
  `order_id` int(11) NOT NULL AUTO_INCREMENT,
  `invoice_no` int(11) NOT NULL DEFAULT '0',
  `invoice_prefix` varchar(26) NOT NULL,
  `store_id` int(11) NOT NULL DEFAULT '0',
  `store_name` varchar(64) NOT NULL,
  `store_url` varchar(255) NOT NULL,
  `customer_id` int(11) NOT NULL DEFAULT '0',
  `customer_group_id` int(11) NOT NULL DEFAULT '0',
  `firstname` varchar(32) NOT NULL,
  `lastname` varchar(32) NOT NULL,
  `email` varchar(96) NOT NULL,
  `telephone` varchar(32) NOT NULL,
  `fax` varchar(32) NOT NULL,
  `custom_field` text NOT NULL,
  `payment_firstname` varchar(32) NOT NULL,
  `payment_lastname` varchar(32) NOT NULL,
  `payment_company` varchar(60) NOT NULL,
  `payment_address_1` varchar(128) NOT NULL,
  `payment_address_2` varchar(128) NOT NULL,
  `payment_city` varchar(128) NOT NULL,
  `payment_postcode` varchar(10) NOT NULL,
  `payment_country` varchar(128) NOT NULL,
  `payment_country_id` int(11) NOT NULL,
  `payment_zone` varchar(128) NOT NULL,
  `payment_zone_id` int(11) NOT NULL,
  `payment_address_format` text NOT NULL,
  `payment_custom_field` text NOT NULL,
  `payment_method` varchar(128) NOT NULL,
  `payment_code` varchar(128) NOT NULL,
  `shipping_firstname` varchar(32) NOT NULL,
  `shipping_lastname` varchar(32) NOT NULL,
  `shipping_company` varchar(40) NOT NULL,
  `shipping_address_1` varchar(128) NOT NULL,
  `shipping_address_2` varchar(128) NOT NULL,
  `shipping_city` varchar(128) NOT NULL,
  `shipping_postcode` varchar(10) NOT NULL,
  `shipping_country` varchar(128) NOT NULL,
  `shipping_country_id` int(11) NOT NULL,
  `shipping_zone` varchar(128) NOT NULL,
  `shipping_zone_id` int(11) NOT NULL,
  `shipping_address_format` text NOT NULL,
  `shipping_custom_field` text NOT NULL,
  `shipping_method` varchar(128) NOT NULL,
  `shipping_code` varchar(128) NOT NULL,
  `comment` text NOT NULL,
  `total` decimal(15,4) NOT NULL DEFAULT '0.0000',
  `order_status_id` int(11) NOT NULL DEFAULT '0',
  `affiliate_id` int(11) NOT NULL,
  `commission` decimal(15,4) NOT NULL,
  `marketing_id` int(11) NOT NULL,
  `tracking` varchar(64) NOT NULL,
  `language_id` int(11) NOT NULL,
  `currency_id` int(11) NOT NULL,
  `currency_code` varchar(3) NOT NULL,
  `currency_value` decimal(15,8) NOT NULL DEFAULT '1.00000000',
  `ip` varchar(40) NOT NULL,
  `forwarded_ip` varchar(40) NOT NULL,
  `user_agent` varchar(255) NOT NULL,
  `accept_language` varchar(255) NOT NULL,
  `date_added` datetime NOT NULL,
  `date_modified` datetime NOT NULL,
  PRIMARY KEY (`order_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;



# Dump of table order_custom_field
# ------------------------------------------------------------

DROP TABLE IF EXISTS `order_custom_field`;

CREATE TABLE `order_custom_field` (
  `order_custom_field_id` int(11) NOT NULL AUTO_INCREMENT,
  `order_id` int(11) NOT NULL,
  `custom_field_id` int(11) NOT NULL,
  `custom_field_value_id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `value` text NOT NULL,
  `type` varchar(32) NOT NULL,
  `location` varchar(16) NOT NULL,
  PRIMARY KEY (`order_custom_field_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;



# Dump of table order_history
# ------------------------------------------------------------

DROP TABLE IF EXISTS `order_history`;

CREATE TABLE `order_history` (
  `order_history_id` int(11) NOT NULL AUTO_INCREMENT,
  `order_id` int(11) NOT NULL,
  `order_status_id` int(11) NOT NULL,
  `notify` tinyint(1) NOT NULL DEFAULT '0',
  `comment` text NOT NULL,
  `date_added` datetime NOT NULL,
  PRIMARY KEY (`order_history_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;



# Dump of table order_option
# ------------------------------------------------------------

DROP TABLE IF EXISTS `order_option`;

CREATE TABLE `order_option` (
  `order_option_id` int(11) NOT NULL AUTO_INCREMENT,
  `order_id` int(11) NOT NULL,
  `order_product_id` int(11) NOT NULL,
  `product_option_id` int(11) NOT NULL,
  `product_option_value_id` int(11) NOT NULL DEFAULT '0',
  `name` varchar(255) NOT NULL,
  `value` text NOT NULL,
  `type` varchar(32) NOT NULL,
  PRIMARY KEY (`order_option_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;



# Dump of table order_product
# ------------------------------------------------------------

DROP TABLE IF EXISTS `order_product`;

CREATE TABLE `order_product` (
  `order_product_id` int(11) NOT NULL AUTO_INCREMENT,
  `order_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `model` varchar(64) NOT NULL,
  `quantity` int(4) NOT NULL,
  `price` decimal(15,4) NOT NULL DEFAULT '0.0000',
  `total` decimal(15,4) NOT NULL DEFAULT '0.0000',
  `tax` decimal(15,4) NOT NULL DEFAULT '0.0000',
  `reward` int(8) NOT NULL,
  PRIMARY KEY (`order_product_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;



# Dump of table order_recurring
# ------------------------------------------------------------

DROP TABLE IF EXISTS `order_recurring`;

CREATE TABLE `order_recurring` (
  `order_recurring_id` int(11) NOT NULL AUTO_INCREMENT,
  `order_id` int(11) NOT NULL,
  `reference` varchar(255) NOT NULL,
  `product_id` int(11) NOT NULL,
  `product_name` varchar(255) NOT NULL,
  `product_quantity` int(11) NOT NULL,
  `recurring_id` int(11) NOT NULL,
  `recurring_name` varchar(255) NOT NULL,
  `recurring_description` varchar(255) NOT NULL,
  `recurring_frequency` varchar(25) NOT NULL,
  `recurring_cycle` smallint(6) NOT NULL,
  `recurring_duration` smallint(6) NOT NULL,
  `recurring_price` decimal(10,4) NOT NULL,
  `trial` tinyint(1) NOT NULL,
  `trial_frequency` varchar(25) NOT NULL,
  `trial_cycle` smallint(6) NOT NULL,
  `trial_duration` smallint(6) NOT NULL,
  `trial_price` decimal(10,4) NOT NULL,
  `status` tinyint(4) NOT NULL,
  `date_added` datetime NOT NULL,
  PRIMARY KEY (`order_recurring_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;



# Dump of table order_recurring_transaction
# ------------------------------------------------------------

DROP TABLE IF EXISTS `order_recurring_transaction`;

CREATE TABLE `order_recurring_transaction` (
  `order_recurring_transaction_id` int(11) NOT NULL AUTO_INCREMENT,
  `order_recurring_id` int(11) NOT NULL,
  `reference` varchar(255) NOT NULL,
  `type` varchar(255) NOT NULL,
  `amount` decimal(10,4) NOT NULL,
  `date_added` datetime NOT NULL,
  PRIMARY KEY (`order_recurring_transaction_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;



# Dump of table order_status
# ------------------------------------------------------------

DROP TABLE IF EXISTS `order_status`;

CREATE TABLE `order_status` (
  `order_status_id` int(11) NOT NULL AUTO_INCREMENT,
  `language_id` int(11) NOT NULL,
  `name` varchar(32) NOT NULL,
  PRIMARY KEY (`order_status_id`,`language_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

LOCK TABLES `order_status` WRITE;
/*!40000 ALTER TABLE `order_status` DISABLE KEYS */;

INSERT INTO `order_status` (`order_status_id`, `language_id`, `name`)
VALUES
	(2,1,'Processing'),
	(3,1,'Shipped'),
	(7,1,'Canceled'),
	(5,1,'Complete'),
	(8,1,'Denied'),
	(9,1,'Canceled Reversal'),
	(10,1,'Failed'),
	(11,1,'Refunded'),
	(12,1,'Reversed'),
	(13,1,'Chargeback'),
	(1,1,'Pending'),
	(16,1,'Voided'),
	(15,1,'Processed'),
	(14,1,'Expired');

/*!40000 ALTER TABLE `order_status` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table order_total
# ------------------------------------------------------------

DROP TABLE IF EXISTS `order_total`;

CREATE TABLE `order_total` (
  `order_total_id` int(10) NOT NULL AUTO_INCREMENT,
  `order_id` int(11) NOT NULL,
  `code` varchar(32) NOT NULL,
  `title` varchar(255) NOT NULL,
  `value` decimal(15,4) NOT NULL DEFAULT '0.0000',
  `sort_order` int(3) NOT NULL,
  PRIMARY KEY (`order_total_id`),
  KEY `order_id` (`order_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;



# Dump of table order_voucher
# ------------------------------------------------------------

DROP TABLE IF EXISTS `order_voucher`;

CREATE TABLE `order_voucher` (
  `order_voucher_id` int(11) NOT NULL AUTO_INCREMENT,
  `order_id` int(11) NOT NULL,
  `voucher_id` int(11) NOT NULL,
  `description` varchar(255) NOT NULL,
  `code` varchar(10) NOT NULL,
  `from_name` varchar(64) NOT NULL,
  `from_email` varchar(96) NOT NULL,
  `to_name` varchar(64) NOT NULL,
  `to_email` varchar(96) NOT NULL,
  `voucher_theme_id` int(11) NOT NULL,
  `message` text NOT NULL,
  `amount` decimal(15,4) NOT NULL,
  PRIMARY KEY (`order_voucher_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;



# Dump of table product
# ------------------------------------------------------------

DROP TABLE IF EXISTS `product`;

CREATE TABLE `product` (
  `product_id` int(11) NOT NULL AUTO_INCREMENT,
  `model` varchar(64) NOT NULL,
  `sku` varchar(64) NOT NULL,
  `upc` varchar(12) NOT NULL,
  `ean` varchar(14) NOT NULL,
  `jan` varchar(13) NOT NULL,
  `isbn` varchar(17) NOT NULL,
  `mpn` varchar(64) NOT NULL,
  `location` varchar(128) NOT NULL,
  `quantity` int(4) NOT NULL DEFAULT '0',
  `stock_status_id` int(11) NOT NULL,
  `image` varchar(255) DEFAULT NULL,
  `manufacturer_id` int(11) NOT NULL,
  `shipping` tinyint(1) NOT NULL DEFAULT '1',
  `price` decimal(15,4) NOT NULL DEFAULT '0.0000',
  `points` int(8) NOT NULL DEFAULT '0',
  `tax_class_id` int(11) NOT NULL,
  `date_available` date NOT NULL DEFAULT '0000-00-00',
  `weight` decimal(15,8) NOT NULL DEFAULT '0.00000000',
  `weight_class_id` int(11) NOT NULL DEFAULT '0',
  `length` decimal(15,8) NOT NULL DEFAULT '0.00000000',
  `width` decimal(15,8) NOT NULL DEFAULT '0.00000000',
  `height` decimal(15,8) NOT NULL DEFAULT '0.00000000',
  `length_class_id` int(11) NOT NULL DEFAULT '0',
  `subtract` tinyint(1) NOT NULL DEFAULT '1',
  `minimum` int(11) NOT NULL DEFAULT '1',
  `sort_order` int(11) NOT NULL DEFAULT '0',
  `status` tinyint(1) NOT NULL DEFAULT '0',
  `viewed` int(5) NOT NULL DEFAULT '0',
  `date_added` datetime NOT NULL,
  `date_modified` datetime NOT NULL,
  `seller_id` int(4) NOT NULL DEFAULT '0' COMMENT 'Seller Association with Products',
  `gold_weight` decimal(15,8) DEFAULT NULL COMMENT 'Gold Weight in GMS',
  `silver_weight` decimal(15,8) DEFAULT NULL COMMENT 'Silver Weight in GMS',
  `diamond_weight` decimal(15,8) DEFAULT NULL COMMENT 'Diamond Weight in Carat (ct)',
  `parts_count` int(2) DEFAULT NULL COMMENT 'Parts Count',
  `tone_count` enum('one_tone','two_tone','three_tone','four_tone') DEFAULT 'one_tone' COMMENT 'Number of Color Tones',
  `created_using` varchar(40) DEFAULT NULL COMMENT 'Design Created Using Software',
  PRIMARY KEY (`product_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

LOCK TABLES `product` WRITE;
/*!40000 ALTER TABLE `product` DISABLE KEYS */;

INSERT INTO `product` (`product_id`, `model`, `sku`, `upc`, `ean`, `jan`, `isbn`, `mpn`, `location`, `quantity`, `stock_status_id`, `image`, `manufacturer_id`, `shipping`, `price`, `points`, `tax_class_id`, `date_available`, `weight`, `weight_class_id`, `length`, `width`, `height`, `length_class_id`, `subtract`, `minimum`, `sort_order`, `status`, `viewed`, `date_added`, `date_modified`, `seller_id`, `gold_weight`, `silver_weight`, `diamond_weight`, `parts_count`, `tone_count`, `created_using`)
VALUES
	(28,'Product 1','','','','','','','',939,7,'catalog/demo/htc_touch_hd_1.jpg',5,1,100.0000,200,9,'2009-02-03',146.40000000,2,0.00000000,0.00000000,0.00000000,1,1,1,0,1,0,'2009-02-03 16:06:50','2011-09-30 01:05:39',0,NULL,NULL,NULL,NULL,'one_tone',NULL),
	(29,'Product 2','','','','','','','',999,6,'catalog/demo/palm_treo_pro_1.jpg',6,1,279.9900,0,9,'2009-02-03',133.00000000,2,0.00000000,0.00000000,0.00000000,3,1,1,0,1,0,'2009-02-03 16:42:17','2011-09-30 01:06:08',0,NULL,NULL,NULL,NULL,'one_tone',NULL),
	(30,'Product 3','','','','','','','',7,6,'catalog/demo/canon_eos_5d_1.jpg',9,1,100.0000,0,9,'2009-02-03',0.00000000,1,0.00000000,0.00000000,0.00000000,1,1,1,0,1,9,'2009-02-03 16:59:00','2017-11-12 16:38:33',0,NULL,NULL,NULL,NULL,'one_tone',NULL),
	(31,'Product 4','','','','','','','',1000,6,'catalog/demo/nikon_d300_1.jpg',0,1,80.0000,0,9,'2009-02-03',0.00000000,1,0.00000000,0.00000000,0.00000000,3,1,1,0,1,0,'2009-02-03 17:00:10','2011-09-30 01:06:00',0,NULL,NULL,NULL,NULL,'one_tone',NULL),
	(32,'Product 5','','','','','','','',999,6,'catalog/demo/ipod_touch_1.jpg',8,1,100.0000,0,9,'2009-02-03',5.00000000,1,0.00000000,0.00000000,0.00000000,1,1,1,0,1,0,'2009-02-03 17:07:26','2011-09-30 01:07:22',0,NULL,NULL,NULL,NULL,'one_tone',NULL),
	(33,'Product 6','','','','','','','',1000,6,'catalog/demo/samsung_syncmaster_941bw.jpg',0,1,200.0000,0,9,'2009-02-03',5.00000000,1,0.00000000,0.00000000,0.00000000,2,1,1,0,1,0,'2009-02-03 17:08:31','2011-09-30 01:06:29',0,NULL,NULL,NULL,NULL,'one_tone',NULL),
	(34,'Product 7','','','','','','','',1000,6,'catalog/demo/ipod_shuffle_1.jpg',8,1,100.0000,0,9,'2009-02-03',5.00000000,1,0.00000000,0.00000000,0.00000000,2,1,1,0,1,0,'2009-02-03 18:07:54','2011-09-30 01:07:17',0,NULL,NULL,NULL,NULL,'one_tone',NULL),
	(35,'Product 8','','','','','','','',1000,5,'',0,0,100.0000,0,9,'2009-02-03',5.00000000,1,0.00000000,0.00000000,0.00000000,1,1,1,0,1,0,'2009-02-03 18:08:31','2011-09-30 01:06:17',0,NULL,NULL,NULL,NULL,'one_tone',NULL),
	(36,'Product 9','','','','','','','',994,6,'catalog/demo/ipod_nano_1.jpg',8,0,100.0000,100,9,'2009-02-03',5.00000000,1,0.00000000,0.00000000,0.00000000,2,1,1,0,1,0,'2009-02-03 18:09:19','2011-09-30 01:07:12',0,NULL,NULL,NULL,NULL,'one_tone',NULL),
	(40,'product 11','','','','','','','',970,5,'catalog/demo/iphone_1.jpg',8,1,101.0000,0,9,'2009-02-03',10.00000000,1,0.00000000,0.00000000,0.00000000,1,1,1,0,1,0,'2009-02-03 21:07:12','2011-09-30 01:06:53',0,NULL,NULL,NULL,NULL,'one_tone',NULL),
	(41,'Product 14','','','','','','','',977,5,'catalog/demo/imac_1.jpg',8,1,100.0000,0,9,'2009-02-03',5.00000000,1,0.00000000,0.00000000,0.00000000,1,1,1,0,1,0,'2009-02-03 21:07:26','2011-09-30 01:06:44',0,NULL,NULL,NULL,NULL,'one_tone',NULL),
	(42,'Product 15','','','','','','','',990,5,'catalog/demo/apple_cinema_30.jpg',8,1,100.0000,400,9,'2009-02-04',12.50000000,1,1.00000000,2.00000000,3.00000000,1,1,2,0,1,62,'2009-02-03 21:07:37','2017-11-12 15:24:25',0,NULL,NULL,NULL,NULL,'one_tone',NULL),
	(43,'Product 16','','','','','','','',929,5,'catalog/demo/macbook_1.jpg',8,0,500.0000,0,9,'2009-02-03',0.00000000,1,0.00000000,0.00000000,0.00000000,2,1,1,0,1,0,'2009-02-03 21:07:49','2011-09-30 01:05:46',0,NULL,NULL,NULL,NULL,'one_tone',NULL),
	(44,'Product 17','','','','','','','',1000,5,'catalog/demo/macbook_air_1.jpg',8,1,1000.0000,0,9,'2009-02-03',0.00000000,1,0.00000000,0.00000000,0.00000000,2,1,1,0,1,0,'2009-02-03 21:08:00','2011-09-30 01:05:53',0,NULL,NULL,NULL,NULL,'one_tone',NULL),
	(45,'Product 18','','','','','','','',998,5,'catalog/demo/macbook_pro_1.jpg',8,1,2000.0000,0,100,'2009-02-03',0.00000000,1,0.00000000,0.00000000,0.00000000,2,1,1,0,1,0,'2009-02-03 21:08:17','2011-09-15 22:22:01',0,NULL,NULL,NULL,NULL,'one_tone',NULL),
	(46,'Product 19','','','','','','','',1000,5,'catalog/demo/sony_vaio_1.jpg',10,1,1000.0000,0,9,'2009-02-03',0.00000000,1,0.00000000,0.00000000,0.00000000,2,1,1,0,1,0,'2009-02-03 21:08:29','2011-09-30 01:06:39',0,NULL,NULL,NULL,NULL,'one_tone',NULL),
	(47,'Product 21','','','','','','','',1000,5,'catalog/demo/hp_1.jpg',7,1,100.0000,400,9,'2009-02-03',1.00000000,1,0.00000000,0.00000000,0.00000000,1,0,1,0,1,0,'2009-02-03 21:08:40','2017-11-12 15:25:14',0,NULL,NULL,NULL,NULL,'one_tone',NULL),
	(48,'product 20','test 1','','','','','','test 2',995,5,'catalog/demo/ipod_classic_1.jpg',8,1,100.0000,0,9,'2009-02-08',1.00000000,1,0.00000000,0.00000000,0.00000000,2,1,1,0,1,0,'2009-02-08 17:21:51','2011-09-30 01:07:06',0,NULL,NULL,NULL,NULL,'one_tone',NULL),
	(49,'SAM1','','','','','','','',0,8,'catalog/demo/samsung_tab_1.jpg',0,1,199.9900,0,9,'2011-04-25',0.00000000,1,0.00000000,0.00000000,0.00000000,1,1,1,1,1,0,'2011-04-26 08:57:34','2011-09-30 01:06:23',0,NULL,NULL,NULL,NULL,'one_tone',NULL);

/*!40000 ALTER TABLE `product` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table product_attribute
# ------------------------------------------------------------

DROP TABLE IF EXISTS `product_attribute`;

CREATE TABLE `product_attribute` (
  `product_id` int(11) NOT NULL,
  `attribute_id` int(11) NOT NULL,
  `language_id` int(11) NOT NULL,
  `text` text NOT NULL,
  PRIMARY KEY (`product_id`,`attribute_id`,`language_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

LOCK TABLES `product_attribute` WRITE;
/*!40000 ALTER TABLE `product_attribute` DISABLE KEYS */;

INSERT INTO `product_attribute` (`product_id`, `attribute_id`, `language_id`, `text`)
VALUES
	(43,2,1,'1'),
	(47,4,1,'16GB'),
	(43,4,1,'8gb'),
	(42,3,1,'100mhz'),
	(47,2,1,'4');

/*!40000 ALTER TABLE `product_attribute` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table product_description
# ------------------------------------------------------------

DROP TABLE IF EXISTS `product_description`;

CREATE TABLE `product_description` (
  `product_id` int(11) NOT NULL,
  `language_id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `fimage` text CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `video1` text CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `html_product_shortdesc` text CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `html_product_right` text CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `html_product_tab` text CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `tab_title` text CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `description` text NOT NULL,
  `tag` text NOT NULL,
  `meta_title` varchar(255) NOT NULL,
  `meta_description` varchar(255) NOT NULL,
  `meta_keyword` varchar(255) NOT NULL,
  PRIMARY KEY (`product_id`,`language_id`),
  KEY `name` (`name`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

LOCK TABLES `product_description` WRITE;
/*!40000 ALTER TABLE `product_description` DISABLE KEYS */;

INSERT INTO `product_description` (`product_id`, `language_id`, `name`, `fimage`, `video1`, `html_product_shortdesc`, `html_product_right`, `html_product_tab`, `tab_title`, `description`, `tag`, `meta_title`, `meta_description`, `meta_keyword`)
VALUES
	(35,1,'Product 8','','','','','','','&lt;p&gt;\r\n	Product 8&lt;/p&gt;\r\n','','Product 8','',''),
	(48,1,'iPod Classic','','','','','','','&lt;div class=&quot;cpt_product_description &quot;&gt;\r\n	&lt;div&gt;\r\n		&lt;p&gt;\r\n			&lt;strong&gt;More room to move.&lt;/strong&gt;&lt;/p&gt;\r\n		&lt;p&gt;\r\n			With 80GB or 160GB of storage and up to 40 hours of battery life, the new iPod classic lets you enjoy up to 40,000 songs or up to 200 hours of video or any combination wherever you go.&lt;/p&gt;\r\n		&lt;p&gt;\r\n			&lt;strong&gt;Cover Flow.&lt;/strong&gt;&lt;/p&gt;\r\n		&lt;p&gt;\r\n			Browse through your music collection by flipping through album art. Select an album to turn it over and see the track list.&lt;/p&gt;\r\n		&lt;p&gt;\r\n			&lt;strong&gt;Enhanced interface.&lt;/strong&gt;&lt;/p&gt;\r\n		&lt;p&gt;\r\n			Experience a whole new way to browse and view your music and video.&lt;/p&gt;\r\n		&lt;p&gt;\r\n			&lt;strong&gt;Sleeker design.&lt;/strong&gt;&lt;/p&gt;\r\n		&lt;p&gt;\r\n			Beautiful, durable, and sleeker than ever, iPod classic now features an anodized aluminum and polished stainless steel enclosure with rounded edges.&lt;/p&gt;\r\n	&lt;/div&gt;\r\n&lt;/div&gt;\r\n&lt;!-- cpt_container_end --&gt;','','iPod Classic','',''),
	(40,1,'iPhone','','','','','','','&lt;p class=&quot;intro&quot;&gt;\r\n	iPhone is a revolutionary new mobile phone that allows you to make a call by simply tapping a name or number in your address book, a favorites list, or a call log. It also automatically syncs all your contacts from a PC, Mac, or Internet service. And it lets you select and listen to voicemail messages in whatever order you want just like email.&lt;/p&gt;\r\n','','iPhone','',''),
	(28,1,'HTC Touch HD','','','','','','','&lt;p&gt;\r\n	HTC Touch - in High Definition. Watch music videos and streaming content in awe-inspiring high definition clarity for a mobile experience you never thought possible. Seductively sleek, the HTC Touch HD provides the next generation of mobile functionality, all at a simple touch. Fully integrated with Windows Mobile Professional 6.1, ultrafast 3.5G, GPS, 5MP camera, plus lots more - all delivered on a breathtakingly crisp 3.8&amp;quot; WVGA touchscreen - you can take control of your mobile world with the HTC Touch HD.&lt;/p&gt;\r\n&lt;p&gt;\r\n	&lt;strong&gt;Features&lt;/strong&gt;&lt;/p&gt;\r\n&lt;ul&gt;\r\n	&lt;li&gt;\r\n		Processor Qualcomm&amp;reg; MSM 7201A&amp;trade; 528 MHz&lt;/li&gt;\r\n	&lt;li&gt;\r\n		Windows Mobile&amp;reg; 6.1 Professional Operating System&lt;/li&gt;\r\n	&lt;li&gt;\r\n		Memory: 512 MB ROM, 288 MB RAM&lt;/li&gt;\r\n	&lt;li&gt;\r\n		Dimensions: 115 mm x 62.8 mm x 12 mm / 146.4 grams&lt;/li&gt;\r\n	&lt;li&gt;\r\n		3.8-inch TFT-LCD flat touch-sensitive screen with 480 x 800 WVGA resolution&lt;/li&gt;\r\n	&lt;li&gt;\r\n		HSDPA/WCDMA: Europe/Asia: 900/2100 MHz; Up to 2 Mbps up-link and 7.2 Mbps down-link speeds&lt;/li&gt;\r\n	&lt;li&gt;\r\n		Quad-band GSM/GPRS/EDGE: Europe/Asia: 850/900/1800/1900 MHz (Band frequency, HSUPA availability, and data speed are operator dependent.)&lt;/li&gt;\r\n	&lt;li&gt;\r\n		Device Control via HTC TouchFLO&amp;trade; 3D &amp;amp; Touch-sensitive front panel buttons&lt;/li&gt;\r\n	&lt;li&gt;\r\n		GPS and A-GPS ready&lt;/li&gt;\r\n	&lt;li&gt;\r\n		Bluetooth&amp;reg; 2.0 with Enhanced Data Rate and A2DP for wireless stereo headsets&lt;/li&gt;\r\n	&lt;li&gt;\r\n		Wi-Fi&amp;reg;: IEEE 802.11 b/g&lt;/li&gt;\r\n	&lt;li&gt;\r\n		HTC ExtUSB&amp;trade; (11-pin mini-USB 2.0)&lt;/li&gt;\r\n	&lt;li&gt;\r\n		5 megapixel color camera with auto focus&lt;/li&gt;\r\n	&lt;li&gt;\r\n		VGA CMOS color camera&lt;/li&gt;\r\n	&lt;li&gt;\r\n		Built-in 3.5 mm audio jack, microphone, speaker, and FM radio&lt;/li&gt;\r\n	&lt;li&gt;\r\n		Ring tone formats: AAC, AAC+, eAAC+, AMR-NB, AMR-WB, QCP, MP3, WMA, WAV&lt;/li&gt;\r\n	&lt;li&gt;\r\n		40 polyphonic and standard MIDI format 0 and 1 (SMF)/SP MIDI&lt;/li&gt;\r\n	&lt;li&gt;\r\n		Rechargeable Lithium-ion or Lithium-ion polymer 1350 mAh battery&lt;/li&gt;\r\n	&lt;li&gt;\r\n		Expansion Slot: microSD&amp;trade; memory card (SD 2.0 compatible)&lt;/li&gt;\r\n	&lt;li&gt;\r\n		AC Adapter Voltage range/frequency: 100 ~ 240V AC, 50/60 Hz DC output: 5V and 1A&lt;/li&gt;\r\n	&lt;li&gt;\r\n		Special Features: FM Radio, G-Sensor&lt;/li&gt;\r\n&lt;/ul&gt;\r\n','','	 HTC Touch HD','',''),
	(44,1,'MacBook Air','','','','','','','&lt;div&gt;\r\n	MacBook Air is ultrathin, ultraportable, and ultra unlike anything else. But you don&amp;rsquo;t lose inches and pounds overnight. It&amp;rsquo;s the result of rethinking conventions. Of multiple wireless innovations. And of breakthrough design. With MacBook Air, mobile computing suddenly has a new standard.&lt;/div&gt;\r\n','','MacBook Air','',''),
	(45,1,'MacBook Pro','','','','','','','&lt;div class=&quot;cpt_product_description &quot;&gt;\r\n	&lt;div&gt;\r\n		&lt;p&gt;\r\n			&lt;b&gt;Latest Intel mobile architecture&lt;/b&gt;&lt;/p&gt;\r\n		&lt;p&gt;\r\n			Powered by the most advanced mobile processors from Intel, the new Core 2 Duo MacBook Pro is over 50% faster than the original Core Duo MacBook Pro and now supports up to 4GB of RAM.&lt;/p&gt;\r\n		&lt;p&gt;\r\n			&lt;b&gt;Leading-edge graphics&lt;/b&gt;&lt;/p&gt;\r\n		&lt;p&gt;\r\n			The NVIDIA GeForce 8600M GT delivers exceptional graphics processing power. For the ultimate creative canvas, you can even configure the 17-inch model with a 1920-by-1200 resolution display.&lt;/p&gt;\r\n		&lt;p&gt;\r\n			&lt;b&gt;Designed for life on the road&lt;/b&gt;&lt;/p&gt;\r\n		&lt;p&gt;\r\n			Innovations such as a magnetic power connection and an illuminated keyboard with ambient light sensor put the MacBook Pro in a class by itself.&lt;/p&gt;\r\n		&lt;p&gt;\r\n			&lt;b&gt;Connect. Create. Communicate.&lt;/b&gt;&lt;/p&gt;\r\n		&lt;p&gt;\r\n			Quickly set up a video conference with the built-in iSight camera. Control presentations and media from up to 30 feet away with the included Apple Remote. Connect to high-bandwidth peripherals with FireWire 800 and DVI.&lt;/p&gt;\r\n		&lt;p&gt;\r\n			&lt;b&gt;Next-generation wireless&lt;/b&gt;&lt;/p&gt;\r\n		&lt;p&gt;\r\n			Featuring 802.11n wireless technology, the MacBook Pro delivers up to five times the performance and up to twice the range of previous-generation technologies.&lt;/p&gt;\r\n	&lt;/div&gt;\r\n&lt;/div&gt;\r\n&lt;!-- cpt_container_end --&gt;','','MacBook Pro','',''),
	(29,1,'Palm Treo Pro','','','','','','','&lt;p&gt;\r\n	Redefine your workday with the Palm Treo Pro smartphone. Perfectly balanced, you can respond to business and personal email, stay on top of appointments and contacts, and use Wi-Fi or GPS when you&amp;rsquo;re out and about. Then watch a video on YouTube, catch up with news and sports on the web, or listen to a few songs. Balance your work and play the way you like it, with the Palm Treo Pro.&lt;/p&gt;\r\n&lt;p&gt;\r\n	&lt;strong&gt;Features&lt;/strong&gt;&lt;/p&gt;\r\n&lt;ul&gt;\r\n	&lt;li&gt;\r\n		Windows Mobile&amp;reg; 6.1 Professional Edition&lt;/li&gt;\r\n	&lt;li&gt;\r\n		Qualcomm&amp;reg; MSM7201 400MHz Processor&lt;/li&gt;\r\n	&lt;li&gt;\r\n		320x320 transflective colour TFT touchscreen&lt;/li&gt;\r\n	&lt;li&gt;\r\n		HSDPA/UMTS/EDGE/GPRS/GSM radio&lt;/li&gt;\r\n	&lt;li&gt;\r\n		Tri-band UMTS &amp;mdash; 850MHz, 1900MHz, 2100MHz&lt;/li&gt;\r\n	&lt;li&gt;\r\n		Quad-band GSM &amp;mdash; 850/900/1800/1900&lt;/li&gt;\r\n	&lt;li&gt;\r\n		802.11b/g with WPA, WPA2, and 801.1x authentication&lt;/li&gt;\r\n	&lt;li&gt;\r\n		Built-in GPS&lt;/li&gt;\r\n	&lt;li&gt;\r\n		Bluetooth Version: 2.0 + Enhanced Data Rate&lt;/li&gt;\r\n	&lt;li&gt;\r\n		256MB storage (100MB user available), 128MB RAM&lt;/li&gt;\r\n	&lt;li&gt;\r\n		2.0 megapixel camera, up to 8x digital zoom and video capture&lt;/li&gt;\r\n	&lt;li&gt;\r\n		Removable, rechargeable 1500mAh lithium-ion battery&lt;/li&gt;\r\n	&lt;li&gt;\r\n		Up to 5.0 hours talk time and up to 250 hours standby&lt;/li&gt;\r\n	&lt;li&gt;\r\n		MicroSDHC card expansion (up to 32GB supported)&lt;/li&gt;\r\n	&lt;li&gt;\r\n		MicroUSB 2.0 for synchronization and charging&lt;/li&gt;\r\n	&lt;li&gt;\r\n		3.5mm stereo headset jack&lt;/li&gt;\r\n	&lt;li&gt;\r\n		60mm (W) x 114mm (L) x 13.5mm (D) / 133g&lt;/li&gt;\r\n&lt;/ul&gt;\r\n','','Palm Treo Pro','',''),
	(36,1,'iPod Nano','','','','','','','&lt;div&gt;\r\n	&lt;p&gt;\r\n		&lt;strong&gt;Video in your pocket.&lt;/strong&gt;&lt;/p&gt;\r\n	&lt;p&gt;\r\n		Its the small iPod with one very big idea: video. The worlds most popular music player now lets you enjoy movies, TV shows, and more on a two-inch display thats 65% brighter than before.&lt;/p&gt;\r\n	&lt;p&gt;\r\n		&lt;strong&gt;Cover Flow.&lt;/strong&gt;&lt;/p&gt;\r\n	&lt;p&gt;\r\n		Browse through your music collection by flipping through album art. Select an album to turn it over and see the track list.&lt;strong&gt;&amp;nbsp;&lt;/strong&gt;&lt;/p&gt;\r\n	&lt;p&gt;\r\n		&lt;strong&gt;Enhanced interface.&lt;/strong&gt;&lt;/p&gt;\r\n	&lt;p&gt;\r\n		Experience a whole new way to browse and view your music and video.&lt;/p&gt;\r\n	&lt;p&gt;\r\n		&lt;strong&gt;Sleek and colorful.&lt;/strong&gt;&lt;/p&gt;\r\n	&lt;p&gt;\r\n		With an anodized aluminum and polished stainless steel enclosure and a choice of five colors, iPod nano is dressed to impress.&lt;/p&gt;\r\n	&lt;p&gt;\r\n		&lt;strong&gt;iTunes.&lt;/strong&gt;&lt;/p&gt;\r\n	&lt;p&gt;\r\n		Available as a free download, iTunes makes it easy to browse and buy millions of songs, movies, TV shows, audiobooks, and games and download free podcasts all at the iTunes Store. And you can import your own music, manage your whole media library, and sync your iPod or iPhone with ease.&lt;/p&gt;\r\n&lt;/div&gt;\r\n','','iPod Nano','',''),
	(46,1,'Sony VAIO','','','','','','','&lt;div&gt;\r\n	Unprecedented power. The next generation of processing technology has arrived. Built into the newest VAIO notebooks lies Intel&amp;#39;s latest, most powerful innovation yet: Intel&amp;reg; Centrino&amp;reg; 2 processor technology. Boasting incredible speed, expanded wireless connectivity, enhanced multimedia support and greater energy efficiency, all the high-performance essentials are seamlessly combined into a single chip.&lt;/div&gt;\r\n','','Sony VAIO','',''),
	(47,1,'HP LP3065','','','','','','','&lt;p&gt;\r\n	Stop your co-workers in their tracks with the stunning new 30-inch diagonal HP LP3065 Flat Panel Monitor. This flagship monitor features best-in-class performance and presentation features on a huge wide-aspect screen while letting you work as comfortably as possible - you might even forget you&amp;#39;re at the office&lt;/p&gt;\r\n','','HP LP3065','',''),
	(32,1,'iPod Touch','','','','','','','&lt;p&gt;\r\n	&lt;strong&gt;Revolutionary multi-touch interface.&lt;/strong&gt;&lt;br /&gt;\r\n	iPod touch features the same multi-touch screen technology as iPhone. Pinch to zoom in on a photo. Scroll through your songs and videos with a flick. Flip through your library by album artwork with Cover Flow.&lt;/p&gt;\r\n&lt;p&gt;\r\n	&lt;strong&gt;Gorgeous 3.5-inch widescreen display.&lt;/strong&gt;&lt;br /&gt;\r\n	Watch your movies, TV shows, and photos come alive with bright, vivid color on the 320-by-480-pixel display.&lt;/p&gt;\r\n&lt;p&gt;\r\n	&lt;strong&gt;Music downloads straight from iTunes.&lt;/strong&gt;&lt;br /&gt;\r\n	Shop the iTunes Wi-Fi Music Store from anywhere with Wi-Fi.1 Browse or search to find the music youre looking for, preview it, and buy it with just a tap.&lt;/p&gt;\r\n&lt;p&gt;\r\n	&lt;strong&gt;Surf the web with Wi-Fi.&lt;/strong&gt;&lt;br /&gt;\r\n	Browse the web using Safari and watch YouTube videos on the first iPod with Wi-Fi built in&lt;br /&gt;\r\n	&amp;nbsp;&lt;/p&gt;\r\n','','	 iPod Touch','',''),
	(41,1,'iMac','','','','','','','&lt;div&gt;\r\n	Just when you thought iMac had everything, now there&acute;s even more. More powerful Intel Core 2 Duo processors. And more memory standard. Combine this with Mac OS X Leopard and iLife &acute;08, and it&acute;s more all-in-one than ever. iMac packs amazing performance into a stunningly slim space.&lt;/div&gt;\r\n','','iMac','',''),
	(33,1,'Samsung SyncMaster 941BW','','','','','','','&lt;div&gt;\r\n	Imagine the advantages of going big without slowing down. The big 19&amp;quot; 941BW monitor combines wide aspect ratio with fast pixel response time, for bigger images, more room to work and crisp motion. In addition, the exclusive MagicBright 2, MagicColor and MagicTune technologies help deliver the ideal image in every situation, while sleek, narrow bezels and adjustable stands deliver style just the way you want it. With the Samsung 941BW widescreen analog/digital LCD monitor, it&amp;#39;s not hard to imagine.&lt;/div&gt;\r\n','','Samsung SyncMaster 941BW','',''),
	(34,1,'iPod Shuffle','','','','','','','&lt;div&gt;\r\n	&lt;strong&gt;Born to be worn.&lt;/strong&gt;\r\n	&lt;p&gt;\r\n		Clip on the worlds most wearable music player and take up to 240 songs with you anywhere. Choose from five colors including four new hues to make your musical fashion statement.&lt;/p&gt;\r\n	&lt;p&gt;\r\n		&lt;strong&gt;Random meets rhythm.&lt;/strong&gt;&lt;/p&gt;\r\n	&lt;p&gt;\r\n		With iTunes autofill, iPod shuffle can deliver a new musical experience every time you sync. For more randomness, you can shuffle songs during playback with the slide of a switch.&lt;/p&gt;\r\n	&lt;strong&gt;Everything is easy.&lt;/strong&gt;\r\n	&lt;p&gt;\r\n		Charge and sync with the included USB dock. Operate the iPod shuffle controls with one hand. Enjoy up to 12 hours straight of skip-free music playback.&lt;/p&gt;\r\n&lt;/div&gt;\r\n','','iPod Shuffle','',''),
	(43,1,'MacBook','','','','','','','&lt;div&gt;\r\n	&lt;p&gt;\r\n		&lt;b&gt;Intel Core 2 Duo processor&lt;/b&gt;&lt;/p&gt;\r\n	&lt;p&gt;\r\n		Powered by an Intel Core 2 Duo processor at speeds up to 2.16GHz, the new MacBook is the fastest ever.&lt;/p&gt;\r\n	&lt;p&gt;\r\n		&lt;b&gt;1GB memory, larger hard drives&lt;/b&gt;&lt;/p&gt;\r\n	&lt;p&gt;\r\n		The new MacBook now comes with 1GB of memory standard and larger hard drives for the entire line perfect for running more of your favorite applications and storing growing media collections.&lt;/p&gt;\r\n	&lt;p&gt;\r\n		&lt;b&gt;Sleek, 1.08-inch-thin design&lt;/b&gt;&lt;/p&gt;\r\n	&lt;p&gt;\r\n		MacBook makes it easy to hit the road thanks to its tough polycarbonate case, built-in wireless technologies, and innovative MagSafe Power Adapter that releases automatically if someone accidentally trips on the cord.&lt;/p&gt;\r\n	&lt;p&gt;\r\n		&lt;b&gt;Built-in iSight camera&lt;/b&gt;&lt;/p&gt;\r\n	&lt;p&gt;\r\n		Right out of the box, you can have a video chat with friends or family,2 record a video at your desk, or take fun pictures with Photo Booth&lt;/p&gt;\r\n&lt;/div&gt;\r\n','','MacBook','',''),
	(31,1,'Nikon D300','','','','','','','&lt;div class=&quot;cpt_product_description &quot;&gt;\r\n	&lt;div&gt;\r\n		Engineered with pro-level features and performance, the 12.3-effective-megapixel D300 combines brand new technologies with advanced features inherited from Nikon&amp;#39;s newly announced D3 professional digital SLR camera to offer serious photographers remarkable performance combined with agility.&lt;br /&gt;\r\n		&lt;br /&gt;\r\n		Similar to the D3, the D300 features Nikon&amp;#39;s exclusive EXPEED Image Processing System that is central to driving the speed and processing power needed for many of the camera&amp;#39;s new features. The D300 features a new 51-point autofocus system with Nikon&amp;#39;s 3D Focus Tracking feature and two new LiveView shooting modes that allow users to frame a photograph using the camera&amp;#39;s high-resolution LCD monitor. The D300 shares a similar Scene Recognition System as is found in the D3; it promises to greatly enhance the accuracy of autofocus, autoexposure, and auto white balance by recognizing the subject or scene being photographed and applying this information to the calculations for the three functions.&lt;br /&gt;\r\n		&lt;br /&gt;\r\n		The D300 reacts with lightning speed, powering up in a mere 0.13 seconds and shooting with an imperceptible 45-millisecond shutter release lag time. The D300 is capable of shooting at a rapid six frames per second and can go as fast as eight frames per second when using the optional MB-D10 multi-power battery pack. In continuous bursts, the D300 can shoot up to 100 shots at full 12.3-megapixel resolution. (NORMAL-LARGE image setting, using a SanDisk Extreme IV 1GB CompactFlash card.)&lt;br /&gt;\r\n		&lt;br /&gt;\r\n		The D300 incorporates a range of innovative technologies and features that will significantly improve the accuracy, control, and performance photographers can get from their equipment. Its new Scene Recognition System advances the use of Nikon&amp;#39;s acclaimed 1,005-segment sensor to recognize colors and light patterns that help the camera determine the subject and the type of scene being photographed before a picture is taken. This information is used to improve the accuracy of autofocus, autoexposure, and auto white balance functions in the D300. For example, the camera can track moving subjects better and by identifying them, it can also automatically select focus points faster and with greater accuracy. It can also analyze highlights and more accurately determine exposure, as well as infer light sources to deliver more accurate white balance detection.&lt;/div&gt;\r\n&lt;/div&gt;\r\n&lt;!-- cpt_container_end --&gt;','','Nikon D300','',''),
	(49,1,'Samsung Galaxy Tab 10.1','','','','','','','&lt;p&gt;\r\n	Samsung Galaxy Tab 10.1, is the world&amp;rsquo;s thinnest tablet, measuring 8.6 mm thickness, running with Android 3.0 Honeycomb OS on a 1GHz dual-core Tegra 2 processor, similar to its younger brother Samsung Galaxy Tab 8.9.&lt;/p&gt;\r\n&lt;p&gt;\r\n	Samsung Galaxy Tab 10.1 gives pure Android 3.0 experience, adding its new TouchWiz UX or TouchWiz 4.0 &amp;ndash; includes a live panel, which lets you to customize with different content, such as your pictures, bookmarks, and social feeds, sporting a 10.1 inches WXGA capacitive touch screen with 1280 x 800 pixels of resolution, equipped with 3 megapixel rear camera with LED flash and a 2 megapixel front camera, HSPA+ connectivity up to 21Mbps, 720p HD video recording capability, 1080p HD playback, DLNA support, Bluetooth 2.1, USB 2.0, gyroscope, Wi-Fi 802.11 a/b/g/n, micro-SD slot, 3.5mm headphone jack, and SIM slot, including the Samsung Stick &amp;ndash; a Bluetooth microphone that can be carried in a pocket like a pen and sound dock with powered subwoofer.&lt;/p&gt;\r\n&lt;p&gt;\r\n	Samsung Galaxy Tab 10.1 will come in 16GB / 32GB / 64GB verities and pre-loaded with Social Hub, Reader&amp;rsquo;s Hub, Music Hub and Samsung Mini Apps Tray &amp;ndash; which gives you access to more commonly used apps to help ease multitasking and it is capable of Adobe Flash Player 10.2, powered by 6860mAh battery that gives you 10hours of video-playback time.&amp;nbsp;&amp;auml;&amp;ouml;&lt;/p&gt;\r\n','','Samsung Galaxy Tab 10.1','',''),
	(42,1,'Apple Cinema 30&quot;','','','','','','','&lt;p&gt;\r\n	&lt;font face=&quot;helvetica,geneva,arial&quot; size=&quot;2&quot;&gt;&lt;font face=&quot;Helvetica&quot; size=&quot;2&quot;&gt;The 30-inch Apple Cinema HD Display delivers an amazing 2560 x 1600 pixel resolution. Designed specifically for the creative professional, this display provides more space for easier access to all the tools and palettes needed to edit, format and composite your work. Combine this display with a Mac Pro, MacBook Pro, or PowerMac G5 and there\'s no limit to what you can achieve. &lt;br&gt;\r\n	&lt;br&gt;\r\n	&lt;/font&gt;&lt;font face=&quot;Helvetica&quot; size=&quot;2&quot;&gt;The Cinema HD features an active-matrix liquid crystal display that produces flicker-free images that deliver twice the brightness, twice the sharpness and twice the contrast ratio of a typical CRT display. Unlike other flat panels, it\'s designed with a pure digital interface to deliver distortion-free images that never need adjusting. With over 4 million digital pixels, the display is uniquely suited for scientific and technical applications such as visualizing molecular structures or analyzing geological data. &lt;br&gt;\r\n	&lt;br&gt;\r\n	&lt;/font&gt;&lt;font face=&quot;Helvetica&quot; size=&quot;2&quot;&gt;Offering accurate, brilliant color performance, the Cinema HD delivers up to 16.7 million colors across a wide gamut allowing you to see subtle nuances between colors from soft pastels to rich jewel tones. A wide viewing angle ensures uniform color from edge to edge. Apple\'s ColorSync technology allows you to create custom profiles to maintain consistent color onscreen and in print. The result: You can confidently use this display in all your color-critical applications. &lt;br&gt;\r\n	&lt;br&gt;\r\n	&lt;/font&gt;&lt;font face=&quot;Helvetica&quot; size=&quot;2&quot;&gt;Housed in a new aluminum design, the display has a very thin bezel that enhances visual accuracy. Each display features two FireWire 400 ports and two USB 2.0 ports, making attachment of desktop peripherals, such as iSight, iPod, digital and still cameras, hard drives, printers and scanners, even more accessible and convenient. Taking advantage of the much thinner and lighter footprint of an LCD, the new displays support the VESA (Video Electronics Standards Association) mounting interface standard. Customers with the optional Cinema Display VESA Mount Adapter kit gain the flexibility to mount their display in locations most appropriate for their work environment. &lt;br&gt;\r\n	&lt;br&gt;\r\n	&lt;/font&gt;&lt;font face=&quot;Helvetica&quot; size=&quot;2&quot;&gt;The Cinema HD features a single cable design with elegant breakout for the USB 2.0, FireWire 400 and a pure digital connection using the industry standard Digital Video Interface (DVI) interface. The DVI connection allows for a direct pure-digital connection.&lt;br&gt;\r\n	&lt;/font&gt;&lt;/font&gt;&lt;/p&gt;\r\n&lt;h3&gt;\r\n	Features:&lt;/h3&gt;\r\n&lt;p&gt;\r\n	Unrivaled display performance&lt;/p&gt;\r\n&lt;ul&gt;\r\n	&lt;li&gt;\r\n		30-inch (viewable) active-matrix liquid crystal display provides breathtaking image quality and vivid, richly saturated color.&lt;/li&gt;\r\n	&lt;li&gt;\r\n		Support for 2560-by-1600 pixel resolution for display of high definition still and video imagery.&lt;/li&gt;\r\n	&lt;li&gt;\r\n		Wide-format design for simultaneous display of two full pages of text and graphics.&lt;/li&gt;\r\n	&lt;li&gt;\r\n		Industry standard DVI connector for direct attachment to Mac- and Windows-based desktops and notebooks&lt;/li&gt;\r\n	&lt;li&gt;\r\n		Incredibly wide (170 degree) horizontal and vertical viewing angle for maximum visibility and color performance.&lt;/li&gt;\r\n	&lt;li&gt;\r\n		Lightning-fast pixel response for full-motion digital video playback.&lt;/li&gt;\r\n	&lt;li&gt;\r\n		Support for 16.7 million saturated colors, for use in all graphics-intensive applications.&lt;/li&gt;\r\n&lt;/ul&gt;\r\n&lt;p&gt;\r\n	Simple setup and operation&lt;/p&gt;\r\n&lt;ul&gt;\r\n	&lt;li&gt;\r\n		Single cable with elegant breakout for connection to DVI, USB and FireWire ports&lt;/li&gt;\r\n	&lt;li&gt;\r\n		Built-in two-port USB 2.0 hub for easy connection of desktop peripheral devices.&lt;/li&gt;\r\n	&lt;li&gt;\r\n		Two FireWire 400 ports to support iSight and other desktop peripherals&lt;/li&gt;\r\n&lt;/ul&gt;\r\n&lt;p&gt;\r\n	Sleek, elegant design&lt;/p&gt;\r\n&lt;ul&gt;\r\n	&lt;li&gt;\r\n		Huge virtual workspace, very small footprint.&lt;/li&gt;\r\n	&lt;li&gt;\r\n		Narrow Bezel design to minimize visual impact of using dual displays&lt;/li&gt;\r\n	&lt;li&gt;\r\n		Unique hinge design for effortless adjustment&lt;/li&gt;\r\n	&lt;li&gt;\r\n		Support for VESA mounting solutions (Apple Cinema Display VESA Mount Adapter sold separately)&lt;/li&gt;\r\n&lt;/ul&gt;\r\n&lt;h3&gt;\r\n	Technical specifications&lt;/h3&gt;\r\n&lt;p&gt;\r\n	&lt;b&gt;Screen size (diagonal viewable image size)&lt;/b&gt;&lt;/p&gt;\r\n&lt;ul&gt;\r\n	&lt;li&gt;\r\n		Apple Cinema HD Display: 30 inches (29.7-inch viewable)&lt;/li&gt;\r\n&lt;/ul&gt;\r\n&lt;p&gt;\r\n	&lt;b&gt;Screen type&lt;/b&gt;&lt;/p&gt;\r\n&lt;ul&gt;\r\n	&lt;li&gt;\r\n		Thin film transistor (TFT) active-matrix liquid crystal display (AMLCD)&lt;/li&gt;\r\n&lt;/ul&gt;\r\n&lt;p&gt;\r\n	&lt;b&gt;Resolutions&lt;/b&gt;&lt;/p&gt;\r\n&lt;ul&gt;\r\n	&lt;li&gt;\r\n		2560 x 1600 pixels (optimum resolution)&lt;/li&gt;\r\n	&lt;li&gt;\r\n		2048 x 1280&lt;/li&gt;\r\n	&lt;li&gt;\r\n		1920 x 1200&lt;/li&gt;\r\n	&lt;li&gt;\r\n		1280 x 800&lt;/li&gt;\r\n	&lt;li&gt;\r\n		1024 x 640&lt;/li&gt;\r\n&lt;/ul&gt;\r\n&lt;p&gt;\r\n	&lt;b&gt;Display colors (maximum)&lt;/b&gt;&lt;/p&gt;\r\n&lt;ul&gt;\r\n	&lt;li&gt;\r\n		16.7 million&lt;/li&gt;\r\n&lt;/ul&gt;\r\n&lt;p&gt;\r\n	&lt;b&gt;Viewing angle (typical)&lt;/b&gt;&lt;/p&gt;\r\n&lt;ul&gt;\r\n	&lt;li&gt;\r\n		170° horizontal; 170° vertical&lt;/li&gt;\r\n&lt;/ul&gt;\r\n&lt;p&gt;\r\n	&lt;b&gt;Brightness (typical)&lt;/b&gt;&lt;/p&gt;\r\n&lt;ul&gt;\r\n	&lt;li&gt;\r\n		30-inch Cinema HD Display: 400 cd/m2&lt;/li&gt;\r\n&lt;/ul&gt;\r\n&lt;p&gt;\r\n	&lt;b&gt;Contrast ratio (typical)&lt;/b&gt;&lt;/p&gt;\r\n&lt;ul&gt;\r\n	&lt;li&gt;\r\n		700:1&lt;/li&gt;\r\n&lt;/ul&gt;\r\n&lt;p&gt;\r\n	&lt;b&gt;Response time (typical)&lt;/b&gt;&lt;/p&gt;\r\n&lt;ul&gt;\r\n	&lt;li&gt;\r\n		16 ms&lt;/li&gt;\r\n&lt;/ul&gt;\r\n&lt;p&gt;\r\n	&lt;b&gt;Pixel pitch&lt;/b&gt;&lt;/p&gt;\r\n&lt;ul&gt;\r\n	&lt;li&gt;\r\n		30-inch Cinema HD Display: 0.250 mm&lt;/li&gt;\r\n&lt;/ul&gt;\r\n&lt;p&gt;\r\n	&lt;b&gt;Screen treatment&lt;/b&gt;&lt;/p&gt;\r\n&lt;ul&gt;\r\n	&lt;li&gt;\r\n		Antiglare hardcoat&lt;/li&gt;\r\n&lt;/ul&gt;\r\n&lt;p&gt;\r\n	&lt;b&gt;User controls (hardware and software)&lt;/b&gt;&lt;/p&gt;\r\n&lt;ul&gt;\r\n	&lt;li&gt;\r\n		Display Power,&lt;/li&gt;\r\n	&lt;li&gt;\r\n		System sleep, wake&lt;/li&gt;\r\n	&lt;li&gt;\r\n		Brightness&lt;/li&gt;\r\n	&lt;li&gt;\r\n		Monitor tilt&lt;/li&gt;\r\n&lt;/ul&gt;\r\n&lt;p&gt;\r\n	&lt;b&gt;Connectors and cables&lt;/b&gt;&lt;br&gt;\r\n	Cable&lt;/p&gt;\r\n&lt;ul&gt;\r\n	&lt;li&gt;\r\n		DVI (Digital Visual Interface)&lt;/li&gt;\r\n	&lt;li&gt;\r\n		FireWire 400&lt;/li&gt;\r\n	&lt;li&gt;\r\n		USB 2.0&lt;/li&gt;\r\n	&lt;li&gt;\r\n		DC power (24 V)&lt;/li&gt;\r\n&lt;/ul&gt;\r\n&lt;p&gt;\r\n	Connectors&lt;/p&gt;\r\n&lt;ul&gt;\r\n	&lt;li&gt;\r\n		Two-port, self-powered USB 2.0 hub&lt;/li&gt;\r\n	&lt;li&gt;\r\n		Two FireWire 400 ports&lt;/li&gt;\r\n	&lt;li&gt;\r\n		Kensington security port&lt;/li&gt;\r\n&lt;/ul&gt;\r\n&lt;p&gt;\r\n	&lt;b&gt;VESA mount adapter&lt;/b&gt;&lt;br&gt;\r\n	Requires optional Cinema Display VESA Mount Adapter (M9649G/A)&lt;/p&gt;\r\n&lt;ul&gt;\r\n	&lt;li&gt;\r\n		Compatible with VESA FDMI (MIS-D, 100, C) compliant mounting solutions&lt;/li&gt;\r\n&lt;/ul&gt;\r\n&lt;p&gt;\r\n	&lt;b&gt;Electrical requirements&lt;/b&gt;&lt;/p&gt;\r\n&lt;ul&gt;\r\n	&lt;li&gt;\r\n		Input voltage: 100-240 VAC 50-60Hz&lt;/li&gt;\r\n	&lt;li&gt;\r\n		Maximum power when operating: 150W&lt;/li&gt;\r\n	&lt;li&gt;\r\n		Energy saver mode: 3W or less&lt;/li&gt;\r\n&lt;/ul&gt;\r\n&lt;p&gt;\r\n	&lt;b&gt;Environmental requirements&lt;/b&gt;&lt;/p&gt;\r\n&lt;ul&gt;\r\n	&lt;li&gt;\r\n		Operating temperature: 50° to 95° F (10° to 35° C)&lt;/li&gt;\r\n	&lt;li&gt;\r\n		Storage temperature: -40° to 116° F (-40° to 47° C)&lt;/li&gt;\r\n	&lt;li&gt;\r\n		Operating humidity: 20% to 80% noncondensing&lt;/li&gt;\r\n	&lt;li&gt;\r\n		Maximum operating altitude: 10,000 feet&lt;/li&gt;\r\n&lt;/ul&gt;\r\n&lt;p&gt;\r\n	&lt;b&gt;Agency approvals&lt;/b&gt;&lt;/p&gt;\r\n&lt;ul&gt;\r\n	&lt;li&gt;\r\n		FCC Part 15 Class B&lt;/li&gt;\r\n	&lt;li&gt;\r\n		EN55022 Class B&lt;/li&gt;\r\n	&lt;li&gt;\r\n		EN55024&lt;/li&gt;\r\n	&lt;li&gt;\r\n		VCCI Class B&lt;/li&gt;\r\n	&lt;li&gt;\r\n		AS/NZS 3548 Class B&lt;/li&gt;\r\n	&lt;li&gt;\r\n		CNS 13438 Class B&lt;/li&gt;\r\n	&lt;li&gt;\r\n		ICES-003 Class B&lt;/li&gt;\r\n	&lt;li&gt;\r\n		ISO 13406 part 2&lt;/li&gt;\r\n	&lt;li&gt;\r\n		MPR II&lt;/li&gt;\r\n	&lt;li&gt;\r\n		IEC 60950&lt;/li&gt;\r\n	&lt;li&gt;\r\n		UL 60950&lt;/li&gt;\r\n	&lt;li&gt;\r\n		CSA 60950&lt;/li&gt;\r\n	&lt;li&gt;\r\n		EN60950&lt;/li&gt;\r\n	&lt;li&gt;\r\n		ENERGY STAR&lt;/li&gt;\r\n	&lt;li&gt;\r\n		TCO \'03&lt;/li&gt;\r\n&lt;/ul&gt;\r\n&lt;p&gt;\r\n	&lt;b&gt;Size and weight&lt;/b&gt;&lt;br&gt;\r\n	30-inch Apple Cinema HD Display&lt;/p&gt;\r\n&lt;ul&gt;\r\n	&lt;li&gt;\r\n		Height: 21.3 inches (54.3 cm)&lt;/li&gt;\r\n	&lt;li&gt;\r\n		Width: 27.2 inches (68.8 cm)&lt;/li&gt;\r\n	&lt;li&gt;\r\n		Depth: 8.46 inches (21.5 cm)&lt;/li&gt;\r\n	&lt;li&gt;\r\n		Weight: 27.5 pounds (12.5 kg)&lt;/li&gt;\r\n&lt;/ul&gt;\r\n&lt;p&gt;\r\n	&lt;b&gt;System Requirements&lt;/b&gt;&lt;/p&gt;\r\n&lt;ul&gt;\r\n	&lt;li&gt;\r\n		Mac Pro, all graphic options&lt;/li&gt;\r\n	&lt;li&gt;\r\n		MacBook Pro&lt;/li&gt;\r\n	&lt;li&gt;\r\n		Power Mac G5 (PCI-X) with ATI Radeon 9650 or better or NVIDIA GeForce 6800 GT DDL or better&lt;/li&gt;\r\n	&lt;li&gt;\r\n		Power Mac G5 (PCI Express), all graphics options&lt;/li&gt;\r\n	&lt;li&gt;\r\n		PowerBook G4 with dual-link DVI support&lt;/li&gt;\r\n	&lt;li&gt;\r\n		Windows PC and graphics card that supports DVI ports with dual-link digital bandwidth and VESA DDC standard for plug-and-play setup&lt;/li&gt;\r\n&lt;/ul&gt;\r\n','','Apple Cinema 30','',''),
	(30,1,'Canon EOS 5D','','','','','','','&lt;p&gt;\r\n	Canon\'s press material for the EOS 5D states that it \'defines (a) new D-SLR category\', while we\'re not typically too concerned with marketing talk this particular statement is clearly pretty accurate. The EOS 5D is unlike any previous digital SLR in that it combines a full-frame (35 mm sized) high resolution sensor (12.8 megapixels) with a relatively compact body (slightly larger than the EOS 20D, although in your hand it feels noticeably \'chunkier\'). The EOS 5D is aimed to slot in between the EOS 20D and the EOS-1D professional digital SLR\'s, an important difference when compared to the latter is that the EOS 5D doesn\'t have any environmental seals. While Canon don\'t specifically refer to the EOS 5D as a \'professional\' digital SLR it will have obvious appeal to professionals who want a high quality digital SLR in a body lighter than the EOS-1D. It will also no doubt appeal to current EOS 20D owners (although lets hope they\'ve not bought too many EF-S lenses...) äë&lt;/p&gt;\r\n','','sdf','','');

/*!40000 ALTER TABLE `product_description` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table product_discount
# ------------------------------------------------------------

DROP TABLE IF EXISTS `product_discount`;

CREATE TABLE `product_discount` (
  `product_discount_id` int(11) NOT NULL AUTO_INCREMENT,
  `product_id` int(11) NOT NULL,
  `customer_group_id` int(11) NOT NULL,
  `quantity` int(4) NOT NULL DEFAULT '0',
  `priority` int(5) NOT NULL DEFAULT '1',
  `price` decimal(15,4) NOT NULL DEFAULT '0.0000',
  `date_start` date NOT NULL DEFAULT '0000-00-00',
  `date_end` date NOT NULL DEFAULT '0000-00-00',
  PRIMARY KEY (`product_discount_id`),
  KEY `product_id` (`product_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

LOCK TABLES `product_discount` WRITE;
/*!40000 ALTER TABLE `product_discount` DISABLE KEYS */;

INSERT INTO `product_discount` (`product_discount_id`, `product_id`, `customer_group_id`, `quantity`, `priority`, `price`, `date_start`, `date_end`)
VALUES
	(449,42,1,30,1,66.0000,'0000-00-00','0000-00-00'),
	(448,42,1,20,1,77.0000,'0000-00-00','0000-00-00'),
	(447,42,1,10,1,88.0000,'0000-00-00','0000-00-00');

/*!40000 ALTER TABLE `product_discount` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table product_filter
# ------------------------------------------------------------

DROP TABLE IF EXISTS `product_filter`;

CREATE TABLE `product_filter` (
  `product_id` int(11) NOT NULL,
  `filter_id` int(11) NOT NULL,
  PRIMARY KEY (`product_id`,`filter_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

LOCK TABLES `product_filter` WRITE;
/*!40000 ALTER TABLE `product_filter` DISABLE KEYS */;

INSERT INTO `product_filter` (`product_id`, `filter_id`)
VALUES
	(30,1),
	(30,2),
	(30,5),
	(30,15),
	(42,6),
	(42,7),
	(42,15),
	(47,8),
	(47,17);

/*!40000 ALTER TABLE `product_filter` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table product_image
# ------------------------------------------------------------

DROP TABLE IF EXISTS `product_image`;

CREATE TABLE `product_image` (
  `product_image_id` int(11) NOT NULL AUTO_INCREMENT,
  `product_id` int(11) NOT NULL,
  `image` varchar(255) DEFAULT NULL,
  `seller_id` int(4) DEFAULT '0' COMMENT 'Seller Id for Sorting',
  `sort_order` int(3) NOT NULL DEFAULT '0',
  PRIMARY KEY (`product_image_id`),
  KEY `product_id` (`product_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

LOCK TABLES `product_image` WRITE;
/*!40000 ALTER TABLE `product_image` DISABLE KEYS */;

INSERT INTO `product_image` (`product_image_id`, `product_id`, `image`, `seller_id`, `sort_order`)
VALUES
	(2378,30,'catalog/demo/canon_eos_5d_3.jpg',0,0),
	(2376,47,'catalog/demo/hp_2.jpg',0,0),
	(2035,28,'catalog/demo/htc_touch_hd_2.jpg',0,0),
	(2351,41,'catalog/demo/imac_3.jpg',0,0),
	(1982,40,'catalog/demo/iphone_6.jpg',0,0),
	(2001,36,'catalog/demo/ipod_nano_5.jpg',0,0),
	(2000,36,'catalog/demo/ipod_nano_4.jpg',0,0),
	(2005,34,'catalog/demo/ipod_shuffle_5.jpg',0,0),
	(2004,34,'catalog/demo/ipod_shuffle_4.jpg',0,0),
	(2011,32,'catalog/demo/ipod_touch_7.jpg',0,0),
	(2010,32,'catalog/demo/ipod_touch_6.jpg',0,0),
	(2009,32,'catalog/demo/ipod_touch_5.jpg',0,0),
	(1971,43,'catalog/demo/macbook_5.jpg',0,0),
	(1970,43,'catalog/demo/macbook_4.jpg',0,0),
	(1974,44,'catalog/demo/macbook_air_4.jpg',0,0),
	(1973,44,'catalog/demo/macbook_air_2.jpg',0,0),
	(1977,45,'catalog/demo/macbook_pro_2.jpg',0,0),
	(1976,45,'catalog/demo/macbook_pro_3.jpg',0,0),
	(1986,31,'catalog/demo/nikon_d300_3.jpg',0,0),
	(1985,31,'catalog/demo/nikon_d300_2.jpg',0,0),
	(1988,29,'catalog/demo/palm_treo_pro_3.jpg',0,0),
	(1995,46,'catalog/demo/sony_vaio_5.jpg',0,0),
	(1994,46,'catalog/demo/sony_vaio_4.jpg',0,0),
	(1991,48,'catalog/demo/ipod_classic_4.jpg',0,0),
	(1990,48,'catalog/demo/ipod_classic_3.jpg',0,0),
	(1981,40,'catalog/demo/iphone_2.jpg',0,0),
	(1980,40,'catalog/demo/iphone_5.jpg',0,0),
	(2377,30,'catalog/demo/canon_eos_5d_2.jpg',0,0),
	(2375,47,'catalog/demo/hp_3.jpg',0,0),
	(2034,28,'catalog/demo/htc_touch_hd_3.jpg',0,0),
	(2350,41,'catalog/demo/imac_2.jpg',0,0),
	(1979,40,'catalog/demo/iphone_3.jpg',0,0),
	(1978,40,'catalog/demo/iphone_4.jpg',0,0),
	(1989,48,'catalog/demo/ipod_classic_2.jpg',0,0),
	(1999,36,'catalog/demo/ipod_nano_2.jpg',0,0),
	(1998,36,'catalog/demo/ipod_nano_3.jpg',0,0),
	(2003,34,'catalog/demo/ipod_shuffle_2.jpg',0,0),
	(2002,34,'catalog/demo/ipod_shuffle_3.jpg',0,0),
	(2008,32,'catalog/demo/ipod_touch_2.jpg',0,0),
	(2007,32,'catalog/demo/ipod_touch_3.jpg',0,0),
	(2006,32,'catalog/demo/ipod_touch_4.jpg',0,0),
	(1969,43,'catalog/demo/macbook_2.jpg',0,0),
	(1968,43,'catalog/demo/macbook_3.jpg',0,0),
	(1972,44,'catalog/demo/macbook_air_3.jpg',0,0),
	(1975,45,'catalog/demo/macbook_pro_4.jpg',0,0),
	(1984,31,'catalog/demo/nikon_d300_4.jpg',0,0),
	(1983,31,'catalog/demo/nikon_d300_5.jpg',0,0),
	(1987,29,'catalog/demo/palm_treo_pro_2.jpg',0,0),
	(1993,46,'catalog/demo/sony_vaio_2.jpg',0,0),
	(1992,46,'catalog/demo/sony_vaio_3.jpg',0,0),
	(2327,49,'catalog/demo/samsung_tab_7.jpg',0,0),
	(2326,49,'catalog/demo/samsung_tab_6.jpg',0,0),
	(2325,49,'catalog/demo/samsung_tab_5.jpg',0,0),
	(2324,49,'catalog/demo/samsung_tab_4.jpg',0,0),
	(2323,49,'catalog/demo/samsung_tab_3.jpg',0,0),
	(2322,49,'catalog/demo/samsung_tab_2.jpg',0,0),
	(2372,42,'catalog/demo/canon_eos_5d_2.jpg',0,0),
	(2371,42,'catalog/demo/canon_eos_5d_1.jpg',0,0),
	(2370,42,'catalog/demo/compaq_presario.jpg',0,0),
	(2369,42,'catalog/demo/hp_1.jpg',0,0),
	(2368,42,'catalog/demo/canon_logo.jpg',0,0);

/*!40000 ALTER TABLE `product_image` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table product_option
# ------------------------------------------------------------

DROP TABLE IF EXISTS `product_option`;

CREATE TABLE `product_option` (
  `product_option_id` int(11) NOT NULL AUTO_INCREMENT,
  `product_id` int(11) NOT NULL,
  `option_id` int(11) NOT NULL,
  `value` text NOT NULL,
  `required` tinyint(1) NOT NULL,
  PRIMARY KEY (`product_option_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

LOCK TABLES `product_option` WRITE;
/*!40000 ALTER TABLE `product_option` DISABLE KEYS */;

INSERT INTO `product_option` (`product_option_id`, `product_id`, `option_id`, `value`, `required`)
VALUES
	(224,35,11,'',1),
	(225,47,12,'2011-04-22',1),
	(220,42,10,'2011-02-20 22:25',1),
	(221,42,9,'22:25',1),
	(222,42,7,'',1),
	(219,42,8,'2011-02-20',1),
	(218,42,1,'',1),
	(226,30,5,'',1),
	(208,42,4,'test',1),
	(209,42,6,'',1),
	(217,42,5,'',1),
	(223,42,2,'',1);

/*!40000 ALTER TABLE `product_option` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table product_option_value
# ------------------------------------------------------------

DROP TABLE IF EXISTS `product_option_value`;

CREATE TABLE `product_option_value` (
  `product_option_value_id` int(11) NOT NULL AUTO_INCREMENT,
  `product_option_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `option_id` int(11) NOT NULL,
  `option_value_id` int(11) NOT NULL,
  `quantity` int(3) NOT NULL,
  `subtract` tinyint(1) NOT NULL,
  `price` decimal(15,4) NOT NULL,
  `price_prefix` varchar(1) NOT NULL,
  `points` int(8) NOT NULL,
  `points_prefix` varchar(1) NOT NULL,
  `weight` decimal(15,8) NOT NULL,
  `weight_prefix` varchar(1) NOT NULL,
  PRIMARY KEY (`product_option_value_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

LOCK TABLES `product_option_value` WRITE;
/*!40000 ALTER TABLE `product_option_value` DISABLE KEYS */;

INSERT INTO `product_option_value` (`product_option_value_id`, `product_option_id`, `product_id`, `option_id`, `option_value_id`, `quantity`, `subtract`, `price`, `price_prefix`, `points`, `points_prefix`, `weight`, `weight_prefix`)
VALUES
	(5,218,42,1,32,96,1,10.0000,'+',1,'+',10.00000000,'+'),
	(7,218,42,1,43,300,1,30.0000,'+',3,'+',30.00000000,'+'),
	(6,218,42,1,31,146,1,20.0000,'+',2,'-',20.00000000,'+'),
	(2,217,42,5,42,200,1,2.0000,'+',0,'+',2.00000000,'+'),
	(3,217,42,5,40,300,0,3.0000,'+',0,'+',3.00000000,'+'),
	(4,217,42,5,39,92,1,4.0000,'+',0,'+',4.00000000,'+'),
	(8,223,42,2,23,48,1,10.0000,'+',0,'+',10.00000000,'+'),
	(1,217,42,5,41,100,0,1.0000,'+',0,'+',1.00000000,'+'),
	(12,224,35,11,46,0,1,5.0000,'+',0,'+',0.00000000,'+'),
	(13,224,35,11,47,10,1,10.0000,'+',0,'+',0.00000000,'+'),
	(14,224,35,11,48,15,1,15.0000,'+',0,'+',0.00000000,'+'),
	(15,226,30,5,39,2,1,0.0000,'+',0,'+',0.00000000,'+'),
	(16,226,30,5,40,5,1,0.0000,'+',0,'+',0.00000000,'+'),
	(10,223,42,2,44,2696,1,30.0000,'+',0,'+',30.00000000,'+'),
	(9,223,42,2,24,194,1,20.0000,'+',0,'+',20.00000000,'+'),
	(11,223,42,2,45,3998,1,40.0000,'+',0,'+',40.00000000,'+');

/*!40000 ALTER TABLE `product_option_value` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table product_recurring
# ------------------------------------------------------------

DROP TABLE IF EXISTS `product_recurring`;

CREATE TABLE `product_recurring` (
  `product_id` int(11) NOT NULL,
  `recurring_id` int(11) NOT NULL,
  `customer_group_id` int(11) NOT NULL,
  PRIMARY KEY (`product_id`,`recurring_id`,`customer_group_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;



# Dump of table product_related
# ------------------------------------------------------------

DROP TABLE IF EXISTS `product_related`;

CREATE TABLE `product_related` (
  `product_id` int(11) NOT NULL,
  `related_id` int(11) NOT NULL,
  PRIMARY KEY (`product_id`,`related_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

LOCK TABLES `product_related` WRITE;
/*!40000 ALTER TABLE `product_related` DISABLE KEYS */;

INSERT INTO `product_related` (`product_id`, `related_id`)
VALUES
	(40,42),
	(41,42),
	(42,40),
	(42,41);

/*!40000 ALTER TABLE `product_related` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table product_reward
# ------------------------------------------------------------

DROP TABLE IF EXISTS `product_reward`;

CREATE TABLE `product_reward` (
  `product_reward_id` int(11) NOT NULL AUTO_INCREMENT,
  `product_id` int(11) NOT NULL DEFAULT '0',
  `customer_group_id` int(11) NOT NULL DEFAULT '0',
  `points` int(8) NOT NULL DEFAULT '0',
  PRIMARY KEY (`product_reward_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

LOCK TABLES `product_reward` WRITE;
/*!40000 ALTER TABLE `product_reward` DISABLE KEYS */;

INSERT INTO `product_reward` (`product_reward_id`, `product_id`, `customer_group_id`, `points`)
VALUES
	(551,42,1,100),
	(553,47,1,300),
	(379,28,1,400),
	(329,43,1,600),
	(339,29,1,0),
	(343,48,1,0),
	(335,40,1,0),
	(554,30,1,200),
	(331,44,1,700),
	(333,45,1,800),
	(337,31,1,0),
	(425,35,1,0),
	(345,33,1,0),
	(347,46,1,0),
	(545,41,1,0),
	(351,36,1,0),
	(353,34,1,0),
	(355,32,1,0),
	(521,49,1,1000);

/*!40000 ALTER TABLE `product_reward` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table product_special
# ------------------------------------------------------------

DROP TABLE IF EXISTS `product_special`;

CREATE TABLE `product_special` (
  `product_special_id` int(11) NOT NULL AUTO_INCREMENT,
  `product_id` int(11) NOT NULL,
  `customer_group_id` int(11) NOT NULL,
  `priority` int(5) NOT NULL DEFAULT '1',
  `price` decimal(15,4) NOT NULL DEFAULT '0.0000',
  `date_start` date NOT NULL DEFAULT '0000-00-00',
  `date_end` date NOT NULL DEFAULT '0000-00-00',
  PRIMARY KEY (`product_special_id`),
  KEY `product_id` (`product_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

LOCK TABLES `product_special` WRITE;
/*!40000 ALTER TABLE `product_special` DISABLE KEYS */;

INSERT INTO `product_special` (`product_special_id`, `product_id`, `customer_group_id`, `priority`, `price`, `date_start`, `date_end`)
VALUES
	(444,42,1,1,90.0000,'0000-00-00','0000-00-00'),
	(448,30,1,2,90.0000,'0000-00-00','0000-00-00'),
	(447,30,1,1,80.0000,'0000-00-00','0000-00-00');

/*!40000 ALTER TABLE `product_special` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table product_to_category
# ------------------------------------------------------------

DROP TABLE IF EXISTS `product_to_category`;

CREATE TABLE `product_to_category` (
  `product_id` int(11) NOT NULL,
  `category_id` int(11) NOT NULL,
  PRIMARY KEY (`product_id`,`category_id`),
  KEY `category_id` (`category_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

LOCK TABLES `product_to_category` WRITE;
/*!40000 ALTER TABLE `product_to_category` DISABLE KEYS */;

INSERT INTO `product_to_category` (`product_id`, `category_id`)
VALUES
	(30,108),
	(42,108),
	(47,147);

/*!40000 ALTER TABLE `product_to_category` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table product_to_download
# ------------------------------------------------------------

DROP TABLE IF EXISTS `product_to_download`;

CREATE TABLE `product_to_download` (
  `product_id` int(11) NOT NULL,
  `download_id` int(11) NOT NULL,
  PRIMARY KEY (`product_id`,`download_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;



# Dump of table product_to_layout
# ------------------------------------------------------------

DROP TABLE IF EXISTS `product_to_layout`;

CREATE TABLE `product_to_layout` (
  `product_id` int(11) NOT NULL,
  `store_id` int(11) NOT NULL,
  `layout_id` int(11) NOT NULL,
  PRIMARY KEY (`product_id`,`store_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

LOCK TABLES `product_to_layout` WRITE;
/*!40000 ALTER TABLE `product_to_layout` DISABLE KEYS */;

INSERT INTO `product_to_layout` (`product_id`, `store_id`, `layout_id`)
VALUES
	(42,0,0),
	(47,0,0),
	(30,0,0);

/*!40000 ALTER TABLE `product_to_layout` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table product_to_store
# ------------------------------------------------------------

DROP TABLE IF EXISTS `product_to_store`;

CREATE TABLE `product_to_store` (
  `product_id` int(11) NOT NULL,
  `store_id` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`product_id`,`store_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

LOCK TABLES `product_to_store` WRITE;
/*!40000 ALTER TABLE `product_to_store` DISABLE KEYS */;

INSERT INTO `product_to_store` (`product_id`, `store_id`)
VALUES
	(28,0),
	(29,0),
	(30,0),
	(31,0),
	(32,0),
	(33,0),
	(34,0),
	(35,0),
	(36,0),
	(40,0),
	(41,0),
	(42,0),
	(43,0),
	(44,0),
	(45,0),
	(46,0),
	(47,0),
	(48,0),
	(49,0);

/*!40000 ALTER TABLE `product_to_store` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table recurring
# ------------------------------------------------------------

DROP TABLE IF EXISTS `recurring`;

CREATE TABLE `recurring` (
  `recurring_id` int(11) NOT NULL AUTO_INCREMENT,
  `price` decimal(10,4) NOT NULL,
  `frequency` enum('day','week','semi_month','month','year') NOT NULL,
  `duration` int(10) unsigned NOT NULL,
  `cycle` int(10) unsigned NOT NULL,
  `trial_status` tinyint(4) NOT NULL,
  `trial_price` decimal(10,4) NOT NULL,
  `trial_frequency` enum('day','week','semi_month','month','year') NOT NULL,
  `trial_duration` int(10) unsigned NOT NULL,
  `trial_cycle` int(10) unsigned NOT NULL,
  `status` tinyint(4) NOT NULL,
  `sort_order` int(11) NOT NULL,
  PRIMARY KEY (`recurring_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;



# Dump of table recurring_description
# ------------------------------------------------------------

DROP TABLE IF EXISTS `recurring_description`;

CREATE TABLE `recurring_description` (
  `recurring_id` int(11) NOT NULL,
  `language_id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  PRIMARY KEY (`recurring_id`,`language_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;



# Dump of table return
# ------------------------------------------------------------

DROP TABLE IF EXISTS `return`;

CREATE TABLE `return` (
  `return_id` int(11) NOT NULL AUTO_INCREMENT,
  `order_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `customer_id` int(11) NOT NULL,
  `firstname` varchar(32) NOT NULL,
  `lastname` varchar(32) NOT NULL,
  `email` varchar(96) NOT NULL,
  `telephone` varchar(32) NOT NULL,
  `product` varchar(255) NOT NULL,
  `model` varchar(64) NOT NULL,
  `quantity` int(4) NOT NULL,
  `opened` tinyint(1) NOT NULL,
  `return_reason_id` int(11) NOT NULL,
  `return_action_id` int(11) NOT NULL,
  `return_status_id` int(11) NOT NULL,
  `comment` text,
  `date_ordered` date NOT NULL DEFAULT '0000-00-00',
  `date_added` datetime NOT NULL,
  `date_modified` datetime NOT NULL,
  PRIMARY KEY (`return_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;



# Dump of table return_action
# ------------------------------------------------------------

DROP TABLE IF EXISTS `return_action`;

CREATE TABLE `return_action` (
  `return_action_id` int(11) NOT NULL AUTO_INCREMENT,
  `language_id` int(11) NOT NULL DEFAULT '0',
  `name` varchar(64) NOT NULL,
  PRIMARY KEY (`return_action_id`,`language_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

LOCK TABLES `return_action` WRITE;
/*!40000 ALTER TABLE `return_action` DISABLE KEYS */;

INSERT INTO `return_action` (`return_action_id`, `language_id`, `name`)
VALUES
	(1,1,'Refunded'),
	(2,1,'Credit Issued'),
	(3,1,'Replacement Sent');

/*!40000 ALTER TABLE `return_action` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table return_history
# ------------------------------------------------------------

DROP TABLE IF EXISTS `return_history`;

CREATE TABLE `return_history` (
  `return_history_id` int(11) NOT NULL AUTO_INCREMENT,
  `return_id` int(11) NOT NULL,
  `return_status_id` int(11) NOT NULL,
  `notify` tinyint(1) NOT NULL,
  `comment` text NOT NULL,
  `date_added` datetime NOT NULL,
  PRIMARY KEY (`return_history_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;



# Dump of table return_reason
# ------------------------------------------------------------

DROP TABLE IF EXISTS `return_reason`;

CREATE TABLE `return_reason` (
  `return_reason_id` int(11) NOT NULL AUTO_INCREMENT,
  `language_id` int(11) NOT NULL DEFAULT '0',
  `name` varchar(128) NOT NULL,
  PRIMARY KEY (`return_reason_id`,`language_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

LOCK TABLES `return_reason` WRITE;
/*!40000 ALTER TABLE `return_reason` DISABLE KEYS */;

INSERT INTO `return_reason` (`return_reason_id`, `language_id`, `name`)
VALUES
	(1,1,'Dead On Arrival'),
	(2,1,'Received Wrong Item'),
	(3,1,'Order Error'),
	(4,1,'Faulty, please supply details'),
	(5,1,'Other, please supply details');

/*!40000 ALTER TABLE `return_reason` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table return_status
# ------------------------------------------------------------

DROP TABLE IF EXISTS `return_status`;

CREATE TABLE `return_status` (
  `return_status_id` int(11) NOT NULL AUTO_INCREMENT,
  `language_id` int(11) NOT NULL DEFAULT '0',
  `name` varchar(32) NOT NULL,
  PRIMARY KEY (`return_status_id`,`language_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

LOCK TABLES `return_status` WRITE;
/*!40000 ALTER TABLE `return_status` DISABLE KEYS */;

INSERT INTO `return_status` (`return_status_id`, `language_id`, `name`)
VALUES
	(1,1,'Pending'),
	(3,1,'Complete'),
	(2,1,'Awaiting Products');

/*!40000 ALTER TABLE `return_status` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table review
# ------------------------------------------------------------

DROP TABLE IF EXISTS `review`;

CREATE TABLE `review` (
  `review_id` int(11) NOT NULL AUTO_INCREMENT,
  `product_id` int(11) NOT NULL,
  `customer_id` int(11) NOT NULL,
  `author` varchar(64) NOT NULL,
  `text` text NOT NULL,
  `rating` int(1) NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '0',
  `date_added` datetime NOT NULL,
  `date_modified` datetime NOT NULL,
  PRIMARY KEY (`review_id`),
  KEY `product_id` (`product_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;



# Dump of table seller_info
# ------------------------------------------------------------

DROP TABLE IF EXISTS `seller_info`;

CREATE TABLE `seller_info` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `key` varchar(255) NOT NULL,
  `value` text NOT NULL,
  `dataTime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

LOCK TABLES `seller_info` WRITE;
/*!40000 ALTER TABLE `seller_info` DISABLE KEYS */;

INSERT INTO `seller_info` (`id`, `user_id`, `key`, `value`, `dataTime`)
VALUES
	(1,6,'seller_type','individual','2017-09-08 13:15:51'),
	(2,6,'category','freelancer','2017-09-08 13:15:51'),
	(3,6,'pan_number','AWAPB6243R','2017-09-08 13:15:51'),
	(4,6,'address_1','111, B Wing','2017-09-08 13:15:51'),
	(5,6,'address_2','Western Edge 2','2017-09-08 13:15:51'),
	(6,6,'city','Mumbai','2017-09-08 13:15:51'),
	(7,6,'postcode','400066','2017-09-08 13:15:51'),
	(8,6,'country_id','99','2017-09-08 13:15:51'),
	(9,6,'telephone','9893127576','2017-09-08 13:15:51'),
	(10,6,'user_group','freelance','2017-09-08 13:15:51'),
	(11,6,'user_group_id','16','2017-09-08 13:15:51'),
	(12,7,'seller_type','company','2017-09-25 08:05:31'),
	(13,7,'category','jewellery_manufacturer','2017-09-25 08:05:31'),
	(14,7,'company_name','Seller','2017-09-25 08:05:31'),
	(15,7,'company_pan','Aukpd0916a','2017-09-25 08:05:31'),
	(16,7,'company_tin','Tin 123','2017-09-25 08:05:31'),
	(17,7,'company_p_firstname','Dibyendu','2017-09-25 08:05:31'),
	(18,7,'company_p_lastname','Dhara','2017-09-25 08:05:31'),
	(19,7,'address_1','Midc','2017-09-25 08:05:31'),
	(20,7,'address_2','Midc','2017-09-25 08:05:31'),
	(21,7,'city','Mumbai','2017-09-25 08:05:31'),
	(22,7,'postcode','400093','2017-09-25 08:05:31'),
	(23,7,'country_id','99','2017-09-25 08:05:31'),
	(24,7,'telephone','9768230192','2017-09-25 08:05:31'),
	(25,7,'user_group','manufacturer','2017-09-25 08:05:31'),
	(26,7,'user_group_id','11','2017-09-25 08:05:31');

/*!40000 ALTER TABLE `seller_info` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table seller_payments
# ------------------------------------------------------------

DROP TABLE IF EXISTS `seller_payments`;

CREATE TABLE `seller_payments` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL COMMENT 'Seller User Id',
  `amount` varchar(255) NOT NULL COMMENT 'Amount Paid',
  `payment_date` varchar(30) NOT NULL COMMENT 'Payment Date',
  `payment_status` varchar(30) NOT NULL COMMENT 'Payment Status from API',
  `payment_id` varchar(30) NOT NULL COMMENT 'Payment ID from API',
  `extra_data` text COMMENT 'extra data for transaction',
  `dataTime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

LOCK TABLES `seller_payments` WRITE;
/*!40000 ALTER TABLE `seller_payments` DISABLE KEYS */;

INSERT INTO `seller_payments` (`id`, `user_id`, `amount`, `payment_date`, `payment_status`, `payment_id`, `extra_data`, `dataTime`)
VALUES
	(1,6,'10.0','2017-09-08','Success','106275898903','{\"orderNo\":\"SOUK-2017-6\",\"order_id\":\"SOUK-2017-6\",\"tracking_id\":\"106275898903\",\"bank_ref_no\":\"7207371366\",\"order_status\":\"Success\",\"failure_message\":\"\",\"payment_mode\":\"Wallet\",\"card_name\":\"Paytm\",\"status_code\":\"null\",\"status_message\":\"Txn Successful.\",\"currency\":\"INR\",\"amount\":\"10.0\",\"billing_name\":\"Rohit\",\"billing_address\":\"129 Idgah\",\"billing_city\":\"Bhopal\",\"billing_state\":\"MP\",\"billing_zip\":\"462001\",\"billing_country\":\"India\",\"billing_tel\":\"9619356420\",\"billing_email\":\"rohit.rishi14@gmail.com\",\"delivery_name\":\"Rohit\",\"delivery_address\":\"129 Idgah\",\"delivery_city\":\"Bhopal\",\"delivery_state\":\"MP\",\"delivery_zip\":\"462001\",\"delivery_country\":\"India\",\"delivery_tel\":\"9619356420\",\"merchant_param1\":\"\",\"merchant_param2\":\"\",\"merchant_param3\":\"\",\"merchant_param4\":\"\",\"merchant_param5\":\"\",\"vault\":\"N\",\"offer_type\":\"null\",\"offer_code\":\"null\",\"discount_value\":\"0.0\",\"mer_amount\":\"10.0\",\"eci_value\":\"null\",\"retry\":\"N\",\"response_code\":\"0\",\"billing_notes\":\"Test Transactions\",\"trans_date\":\"08/09/2017 18:47:41\",\"bin_country\":\"u0005u0005u0005u0005u0005\",\"seller_id\":\"6\"}','2017-09-08 13:33:52');

/*!40000 ALTER TABLE `seller_payments` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table setting
# ------------------------------------------------------------

DROP TABLE IF EXISTS `setting`;

CREATE TABLE `setting` (
  `setting_id` int(11) NOT NULL AUTO_INCREMENT,
  `store_id` int(11) NOT NULL DEFAULT '0',
  `code` varchar(32) NOT NULL,
  `key` varchar(64) NOT NULL,
  `value` text NOT NULL,
  `serialized` tinyint(1) NOT NULL,
  PRIMARY KEY (`setting_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

LOCK TABLES `setting` WRITE;
/*!40000 ALTER TABLE `setting` DISABLE KEYS */;

INSERT INTO `setting` (`setting_id`, `store_id`, `code`, `key`, `value`, `serialized`)
VALUES
	(23858,0,'so_sociallogin','so_sociallogin_linkedintitle','Linkedin Login',0),
	(23857,0,'so_sociallogin','so_sociallogin_googlestatus','1',0),
	(23856,0,'so_sociallogin','so_sociallogin_googlesecretapi','COYNPrxaLq42QdIM2XBPASna',0),
	(23967,0,'config','config_encryption','4fY8CVOfqnk4tJCCZACP8FdrkhlZIlVy0QxprzlIleheIgLCitZPe1sOitYiNKqp1ud7HmKWFk4oMKR7iqi6kyMV1K6OTjvVOcJj6qysHcLfFQWgw0zjwHQuyA015QfTroKden5Z5DKvlY7EFdv4AysPxsC1FB4SYzk9P8Ci2ILoOhONxzKvIGjBjIVJuzVore5kYPJwEYlgimYwW0Rhcvx0g03QLz2mzo66ok5y8LZMol0Yg4TLFMsrwDOHdvGE9W7tsSHrD06Yptd0nYekv5iFAAESxlk8DqvAw72x5tfQ1PML8zcTLNtv5YMZwB8FaReJxU3ehDCSh1jM7BRszA2StE5XAvs1XnPTnp2t2DQtR1VfhZnj2KPcUluvYKIhqEkGvAAV09VGc6JzQFPQ3RbzrSbTuHxbKtE2dng0U46tJZQ7UJU4NzspZIOjoi2Vn3uYYajNlmaPpQX1aHZet9srJHboMxbljbh4nJPAIyxnysyhWItWjF1h5EOSLkSlSAUnb564X7A6iZxdKbwsEYud4WkAPAZBO3oUOQ9jL4XXp7SrT9XHEu2jYEsBbyyKa1wD9rfJZdtRPLsEouvUGZdERrq7IqKxTGjnio9ZkNIVE7JHkQrhSmtn8ubE74imWnsiJ55IrOCvhfpEus0HzIzUNywExn7vS1pi9LyHNompaw3tCLBpRrKm0HJ0XNXSvX5eOhaYW7qn9uyq5wW51y6xO8khadQK3h4SN1imnV5JCa4olvbwpELZ91GnSqVxhd1lEOCn5vDPRlYHNiuNrjbgoqXY0Zt7m9V3bmDgzoFfbmFz6k4ipkEZWS4S2CyCr7WtueMnf7nlzYD9dkmywnGmr6LiJBtZIRkDcKoe2kgzDUh9wewRjuePDGyUm2idyxkszdIdDgu3JNKCVqlmzi96AMFkqWZlGZrPnooACbrW05GjzGbi29gicdw9ELBrEzSe6vaVi38wz07tIMOaoMYTDyDfTdU3cBUgL4U8Tnci0xgCzmknleGRQCeN8Nk3',0),
	(23966,0,'config','config_shared','0',0),
	(23855,0,'so_sociallogin','so_sociallogin_googleapikey','21690390667-tco9t3ca2o89d3sshkb2fmppoioq5mfq.apps.googleusercontent.com',0),
	(23965,0,'config','config_password','1',0),
	(23964,0,'config','config_secure','1',0),
	(23963,0,'config','config_compression','0',0),
	(4,0,'voucher','voucher_sort_order','8',0),
	(5,0,'voucher','voucher_status','1',0),
	(23936,0,'config','config_affiliate_auto','0',0),
	(23937,0,'config','config_affiliate_commission','5',0),
	(23938,0,'config','config_affiliate_id','4',0),
	(23939,0,'config','config_return_id','0',0),
	(23940,0,'config','config_return_status_id','2',0),
	(23941,0,'config','config_captcha','google_captcha',0),
	(23942,0,'config','config_captcha_page','[\"register\",\"review\",\"return\",\"contact\"]',1),
	(23943,0,'config','config_logo','catalog/sezplus_souk_logo_horizontal.PNG',0),
	(23944,0,'config','config_icon','catalog/cart.png',0),
	(23945,0,'config','config_ftp_hostname','sezplus.dev',0),
	(23946,0,'config','config_ftp_port','21',0),
	(23947,0,'config','config_ftp_username','',0),
	(23948,0,'config','config_ftp_password','',0),
	(23949,0,'config','config_ftp_root','',0),
	(23950,0,'config','config_ftp_status','0',0),
	(23951,0,'config','config_mail_protocol','smtp',0),
	(23952,0,'config','config_mail_parameter','',0),
	(23953,0,'config','config_mail_smtp_hostname','ssl://smtp.zoho.com',0),
	(23954,0,'config','config_mail_smtp_username','no-reply@sezplus.com',0),
	(23955,0,'config','config_mail_smtp_password','noreply@12345',0),
	(23956,0,'config','config_mail_smtp_port','465',0),
	(23957,0,'config','config_mail_smtp_timeout','5',0),
	(23958,0,'config','config_mail_alert','[\"account\",\"order\"]',1),
	(23959,0,'config','config_mail_alert_email','',0),
	(23960,0,'config','config_maintenance','0',0),
	(23961,0,'config','config_seo_url','1',0),
	(23962,0,'config','config_robots','abot\r\ndbot\r\nebot\r\nhbot\r\nkbot\r\nlbot\r\nmbot\r\nnbot\r\nobot\r\npbot\r\nrbot\r\nsbot\r\ntbot\r\nvbot\r\nybot\r\nzbot\r\nbot.\r\nbot/\r\n_bot\r\n.bot\r\n/bot\r\n-bot\r\n:bot\r\n(bot\r\ncrawl\r\nslurp\r\nspider\r\nseek\r\naccoona\r\nacoon\r\nadressendeutschland\r\nah-ha.com\r\nahoy\r\naltavista\r\nananzi\r\nanthill\r\nappie\r\narachnophilia\r\narale\r\naraneo\r\naranha\r\narchitext\r\naretha\r\narks\r\nasterias\r\natlocal\r\natn\r\natomz\r\naugurfind\r\nbackrub\r\nbannana_bot\r\nbaypup\r\nbdfetch\r\nbig brother\r\nbiglotron\r\nbjaaland\r\nblackwidow\r\nblaiz\r\nblog\r\nblo.\r\nbloodhound\r\nboitho\r\nbooch\r\nbradley\r\nbutterfly\r\ncalif\r\ncassandra\r\nccubee\r\ncfetch\r\ncharlotte\r\nchurl\r\ncienciaficcion\r\ncmc\r\ncollective\r\ncomagent\r\ncombine\r\ncomputingsite\r\ncsci\r\ncurl\r\ncusco\r\ndaumoa\r\ndeepindex\r\ndelorie\r\ndepspid\r\ndeweb\r\ndie blinde kuh\r\ndigger\r\nditto\r\ndmoz\r\ndocomo\r\ndownload express\r\ndtaagent\r\ndwcp\r\nebiness\r\nebingbong\r\ne-collector\r\nejupiter\r\nemacs-w3 search engine\r\nesther\r\nevliya celebi\r\nezresult\r\nfalcon\r\nfelix ide\r\nferret\r\nfetchrover\r\nfido\r\nfindlinks\r\nfireball\r\nfish search\r\nfouineur\r\nfunnelweb\r\ngazz\r\ngcreep\r\ngenieknows\r\ngetterroboplus\r\ngeturl\r\nglx\r\ngoforit\r\ngolem\r\ngrabber\r\ngrapnel\r\ngralon\r\ngriffon\r\ngromit\r\ngrub\r\ngulliver\r\nhamahakki\r\nharvest\r\nhavindex\r\nhelix\r\nheritrix\r\nhku www octopus\r\nhomerweb\r\nhtdig\r\nhtml index\r\nhtml_analyzer\r\nhtmlgobble\r\nhubater\r\nhyper-decontextualizer\r\nia_archiver\r\nibm_planetwide\r\nichiro\r\niconsurf\r\niltrovatore\r\nimage.kapsi.net\r\nimagelock\r\nincywincy\r\nindexer\r\ninfobee\r\ninformant\r\ningrid\r\ninktomisearch.com\r\ninspector web\r\nintelliagent\r\ninternet shinchakubin\r\nip3000\r\niron33\r\nisraeli-search\r\nivia\r\njack\r\njakarta\r\njavabee\r\njetbot\r\njumpstation\r\nkatipo\r\nkdd-explorer\r\nkilroy\r\nknowledge\r\nkototoi\r\nkretrieve\r\nlabelgrabber\r\nlachesis\r\nlarbin\r\nlegs\r\nlibwww\r\nlinkalarm\r\nlink validator\r\nlinkscan\r\nlockon\r\nlwp\r\nlycos\r\nmagpie\r\nmantraagent\r\nmapoftheinternet\r\nmarvin/\r\nmattie\r\nmediafox\r\nmediapartners\r\nmercator\r\nmerzscope\r\nmicrosoft url control\r\nminirank\r\nmiva\r\nmj12\r\nmnogosearch\r\nmoget\r\nmonster\r\nmoose\r\nmotor\r\nmultitext\r\nmuncher\r\nmuscatferret\r\nmwd.search\r\nmyweb\r\nnajdi\r\nnameprotect\r\nnationaldirectory\r\nnazilla\r\nncsa beta\r\nnec-meshexplorer\r\nnederland.zoek\r\nnetcarta webmap engine\r\nnetmechanic\r\nnetresearchserver\r\nnetscoop\r\nnewscan-online\r\nnhse\r\nnokia6682/\r\nnomad\r\nnoyona\r\nnutch\r\nnzexplorer\r\nobjectssearch\r\noccam\r\nomni\r\nopen text\r\nopenfind\r\nopenintelligencedata\r\norb search\r\nosis-project\r\npack rat\r\npageboy\r\npagebull\r\npage_verifier\r\npanscient\r\nparasite\r\npartnersite\r\npatric\r\npear.\r\npegasus\r\nperegrinator\r\npgp key agent\r\nphantom\r\nphpdig\r\npicosearch\r\npiltdownman\r\npimptrain\r\npinpoint\r\npioneer\r\npiranha\r\nplumtreewebaccessor\r\npogodak\r\npoirot\r\npompos\r\npoppelsdorf\r\npoppi\r\npopular iconoclast\r\npsycheclone\r\npublisher\r\npython\r\nrambler\r\nraven search\r\nroach\r\nroad runner\r\nroadhouse\r\nrobbie\r\nrobofox\r\nrobozilla\r\nrules\r\nsalty\r\nsbider\r\nscooter\r\nscoutjet\r\nscrubby\r\nsearch.\r\nsearchprocess\r\nsemanticdiscovery\r\nsenrigan\r\nsg-scout\r\nshai\'hulud\r\nshark\r\nshopwiki\r\nsidewinder\r\nsift\r\nsilk\r\nsimmany\r\nsite searcher\r\nsite valet\r\nsitetech-rover\r\nskymob.com\r\nsleek\r\nsmartwit\r\nsna-\r\nsnappy\r\nsnooper\r\nsohu\r\nspeedfind\r\nsphere\r\nsphider\r\nspinner\r\nspyder\r\nsteeler/\r\nsuke\r\nsuntek\r\nsupersnooper\r\nsurfnomore\r\nsven\r\nsygol\r\nszukacz\r\ntach black widow\r\ntarantula\r\ntempleton\r\n/teoma\r\nt-h-u-n-d-e-r-s-t-o-n-e\r\ntheophrastus\r\ntitan\r\ntitin\r\ntkwww\r\ntoutatis\r\nt-rex\r\ntutorgig\r\ntwiceler\r\ntwisted\r\nucsd\r\nudmsearch\r\nurl check\r\nupdated\r\nvagabondo\r\nvalkyrie\r\nverticrawl\r\nvictoria\r\nvision-search\r\nvolcano\r\nvoyager/\r\nvoyager-hc\r\nw3c_validator\r\nw3m2\r\nw3mir\r\nwalker\r\nwallpaper\r\nwanderer\r\nwauuu\r\nwavefire\r\nweb core\r\nweb hopper\r\nweb wombat\r\nwebbandit\r\nwebcatcher\r\nwebcopy\r\nwebfoot\r\nweblayers\r\nweblinker\r\nweblog monitor\r\nwebmirror\r\nwebmonkey\r\nwebquest\r\nwebreaper\r\nwebsitepulse\r\nwebsnarf\r\nwebstolperer\r\nwebvac\r\nwebwalk\r\nwebwatch\r\nwebwombat\r\nwebzinger\r\nwhizbang\r\nwhowhere\r\nwild ferret\r\nworldlight\r\nwwwc\r\nwwwster\r\nxenu\r\nxget\r\nxift\r\nxirq\r\nyandex\r\nyanga\r\nyeti\r\nyodao\r\nzao\r\nzippp\r\nzyborg',0),
	(23935,0,'config','config_affiliate_approval','0',0),
	(23934,0,'config','config_stock_checkout','0',0),
	(23933,0,'config','config_stock_warning','1',0),
	(95,0,'free_checkout','free_checkout_status','1',0),
	(96,0,'free_checkout','free_checkout_order_status_id','1',0),
	(97,0,'shipping','shipping_sort_order','3',0),
	(98,0,'sub_total','sub_total_sort_order','1',0),
	(99,0,'sub_total','sub_total_status','1',0),
	(100,0,'tax','tax_status','1',0),
	(101,0,'total','total_sort_order','9',0),
	(102,0,'total','total_status','1',0),
	(103,0,'tax','tax_sort_order','5',0),
	(104,0,'free_checkout','free_checkout_sort_order','1',0),
	(105,0,'cod','cod_sort_order','5',0),
	(106,0,'cod','cod_total','0.01',0),
	(107,0,'cod','cod_order_status_id','1',0),
	(108,0,'cod','cod_geo_zone_id','0',0),
	(109,0,'cod','cod_status','1',0),
	(110,0,'shipping','shipping_status','1',0),
	(111,0,'shipping','shipping_estimator','1',0),
	(112,0,'coupon','coupon_sort_order','4',0),
	(113,0,'coupon','coupon_status','1',0),
	(114,0,'flat','flat_sort_order','1',0),
	(115,0,'flat','flat_status','1',0),
	(116,0,'flat','flat_geo_zone_id','0',0),
	(117,0,'flat','flat_tax_class_id','9',0),
	(118,0,'flat','flat_cost','5.00',0),
	(119,0,'credit','credit_sort_order','7',0),
	(120,0,'credit','credit_status','1',0),
	(121,0,'reward','reward_sort_order','2',0),
	(122,0,'reward','reward_status','1',0),
	(123,0,'category','category_status','1',0),
	(124,0,'account','account_status','1',0),
	(125,0,'affiliate','affiliate_status','1',0),
	(23854,0,'so_sociallogin','so_sociallogin_googleimage','catalog/sociallogin/google.png',0),
	(23853,0,'so_sociallogin','so_sociallogin_googletitle','Google Login',0),
	(23852,0,'so_sociallogin','so_sociallogin_twitstatus','1',0),
	(23851,0,'so_sociallogin','so_sociallogin_twitsecretapi','i7kGpUlhPsEmb4AkmaSQ2kFqgBM2U1nYs7ijHGk2f65J0672mP',0),
	(22081,0,'theme_default','theme_default_image_product_width','600',0),
	(22082,0,'theme_default','theme_default_image_product_height','600',0),
	(22083,0,'theme_default','theme_default_image_additional_width','210',0),
	(22084,0,'theme_default','theme_default_image_additional_height','210',0),
	(22085,0,'theme_default','theme_default_image_related_width','370',0),
	(22086,0,'theme_default','theme_default_image_related_height','370',0),
	(22087,0,'theme_default','theme_default_image_compare_width','90',0),
	(22088,0,'theme_default','theme_default_image_compare_height','90',0),
	(22089,0,'theme_default','theme_default_image_wishlist_width','47',0),
	(22090,0,'theme_default','theme_default_image_wishlist_height','47',0),
	(22091,0,'theme_default','theme_default_image_cart_width','47',0),
	(22092,0,'theme_default','theme_default_image_cart_height','47',0),
	(22093,0,'theme_default','theme_default_image_location_width','268',0),
	(22094,0,'theme_default','theme_default_image_location_height','50',0),
	(150,0,'dashboard_activity','dashboard_activity_status','1',0),
	(151,0,'dashboard_activity','dashboard_activity_sort_order','7',0),
	(152,0,'dashboard_sale','dashboard_sale_status','1',0),
	(153,0,'dashboard_sale','dashboard_sale_width','3',0),
	(154,0,'dashboard_chart','dashboard_chart_status','1',0),
	(155,0,'dashboard_chart','dashboard_chart_width','6',0),
	(156,0,'dashboard_customer','dashboard_customer_status','1',0),
	(157,0,'dashboard_customer','dashboard_customer_width','3',0),
	(158,0,'dashboard_map','dashboard_map_status','1',0),
	(159,0,'dashboard_map','dashboard_map_width','6',0),
	(23881,0,'dashboard_online','dashboard_online_sort_order','4',0),
	(23880,0,'dashboard_online','dashboard_online_status','0',0),
	(162,0,'dashboard_order','dashboard_order_sort_order','1',0),
	(163,0,'dashboard_order','dashboard_order_status','1',0),
	(164,0,'dashboard_order','dashboard_order_width','3',0),
	(165,0,'dashboard_sale','dashboard_sale_sort_order','2',0),
	(166,0,'dashboard_customer','dashboard_customer_sort_order','3',0),
	(23879,0,'dashboard_online','dashboard_online_width','3',0),
	(168,0,'dashboard_map','dashboard_map_sort_order','5',0),
	(169,0,'dashboard_chart','dashboard_chart_sort_order','6',0),
	(170,0,'dashboard_recent','dashboard_recent_status','1',0),
	(171,0,'dashboard_recent','dashboard_recent_sort_order','8',0),
	(172,0,'dashboard_activity','dashboard_activity_width','4',0),
	(173,0,'dashboard_recent','dashboard_recent_width','8',0),
	(23932,0,'config','config_stock_display','0',0),
	(23931,0,'config','config_api_id','1',0),
	(23930,0,'config','config_fraud_status_id','7',0),
	(23929,0,'config','config_complete_status','[\"5\",\"3\"]',1),
	(23928,0,'config','config_processing_status','[\"5\",\"1\",\"2\",\"12\",\"3\"]',1),
	(23927,0,'config','config_order_status_id','1',0),
	(23926,0,'config','config_checkout_id','5',0),
	(23925,0,'config','config_checkout_guest','0',0),
	(23924,0,'config','config_cart_weight','1',0),
	(23923,0,'config','config_invoice_prefix','SEZ-INV-2017-00',0),
	(23922,0,'config','config_account_id','3',0),
	(23921,0,'config','config_login_attempts','5',0),
	(23920,0,'config','config_customer_price','1',0),
	(23919,0,'config','config_customer_group_display','[\"1\"]',1),
	(23918,0,'config','config_customer_group_id','1',0),
	(23917,0,'config','config_customer_search','1',0),
	(23916,0,'config','config_customer_activity','1',0),
	(23915,0,'config','config_customer_online','0',0),
	(23914,0,'config','config_tax_customer','shipping',0),
	(23913,0,'config','config_tax_default','shipping',0),
	(23912,0,'config','config_tax','1',0),
	(268,0,'google_captcha','google_captcha_key','6LfvGQsUAAAAABgqlGea17P3SDoYUPb4EA5XD7lE',0),
	(269,0,'google_captcha','google_captcha_secret','6LfvGQsUAAAAANoktAFV0-qU4KdupGGc2UypYyig',0),
	(270,0,'google_captcha','google_captcha_status','1',0),
	(23911,0,'config','config_voucher_max','1000',0),
	(23850,0,'so_sociallogin','so_sociallogin_twitapikey','EEJ3pjetfaHXrOw54ZyjATQGw',0),
	(23849,0,'so_sociallogin','so_sociallogin_twitimage','catalog/sociallogin/twitter.png',0),
	(23848,0,'so_sociallogin','so_sociallogin_twittertitle','Twitter Login',0),
	(23847,0,'so_sociallogin','so_sociallogin_fbstatus','1',0),
	(23846,0,'so_sociallogin','so_sociallogin_fbsecretapi','08399f0a037cdb5b975f753516922914',0),
	(22080,0,'theme_default','theme_default_image_popup_height','600',0),
	(23845,0,'so_sociallogin','so_sociallogin_fbapikey','273987359678940',0),
	(23844,0,'so_sociallogin','so_sociallogin_fbimage','catalog/sociallogin/fb.png',0),
	(23843,0,'so_sociallogin','so_sociallogin_fbtitle','Facebook Login',0),
	(20675,0,'so_onepagecheckout','so_onepagecheckout_general','{\"so_onepagecheckout_enabled\":\"1\",\"so_onepagecheckout_name\":\"So Onepage Checkout\",\"so_onepagecheckout_layout\":\"1\",\"so_onepagecheckout_country_id\":\"223\",\"so_onepagecheckout_zone_id\":\"3655\"}',1),
	(20676,0,'so_onepagecheckout','so_onepagecheckout_layout_setting','{\"so_onepagecheckout_register_checkout\":\"1\",\"so_onepagecheckout_guest_checkout\":\"1\",\"so_onepagecheckout_enable_login\":\"1\",\"so_onepagecheckout_account_open\":\"register\",\"shopping_cart_status\":\"1\",\"show_product_weight\":\"1\",\"show_product_qnty_update\":\"1\",\"show_product_removecart\":\"1\",\"show_product_image_width\":\"80\",\"show_product_image_height\":\"80\",\"coupon_login_status\":\"1\",\"coupon_register_status\":\"1\",\"coupon_guest_status\":\"1\",\"reward_login_status\":\"1\",\"reward_register_status\":\"1\",\"reward_guest_status\":\"1\",\"voucher_login_status\":\"1\",\"voucher_register_status\":\"1\",\"voucher_guest_status\":\"1\",\"delivery_method_status\":\"1\",\"so_onepagecheckout_default_shipping\":\"flat\",\"flat_status\":\"1\",\"payment_method_status\":\"1\",\"so_onepagecheckout_default_payment\":\"cod\",\"cod_status\":\"1\",\"comment_status\":\"1\",\"require_comment_status\":\"1\",\"show_newsletter\":\"1\",\"show_privacy\":\"1\",\"show_term\":\"1\"}',1),
	(22079,0,'theme_default','theme_default_image_popup_width','600',0),
	(22078,0,'theme_default','theme_default_image_thumb_height','600',0),
	(22077,0,'theme_default','theme_default_image_thumb_width','600',0),
	(22076,0,'theme_default','theme_default_image_category_height','75',0),
	(22075,0,'theme_default','theme_default_image_category_width','133',0),
	(22074,0,'theme_default','theme_default_product_description_length','200',0),
	(22073,0,'theme_default','theme_default_product_limit','12',0),
	(22072,0,'theme_default','theme_default_status','1',0),
	(22071,0,'theme_default','theme_default_directory','so-topdeal',0),
	(23842,0,'so_sociallogin','so_sociallogin_popuplogin','1',0),
	(23841,0,'so_sociallogin','so_sociallogin_status','1',0),
	(23840,0,'so_sociallogin','so_sociallogin_button','icon',0),
	(23839,0,'so_sociallogin','so_sociallogin_height','35',0),
	(23838,0,'so_sociallogin','so_sociallogin_width','130',0),
	(23837,0,'so_sociallogin','so_sociallogin_name','So Social Login',0),
	(23910,0,'config','config_voucher_min','1',0),
	(23909,0,'config','config_review_guest','0',0),
	(22186,0,'simple_blog','simple_blog_status','1',0),
	(22187,0,'simple_blog','simple_blog_seo_keyword','',0),
	(22188,0,'simple_blog','simple_blog_footer_heading','',0),
	(22189,0,'simple_blog','simple_blog_heading','',0),
	(22190,0,'simple_blog','simple_blog_product_related_heading','',0),
	(22191,0,'simple_blog','simple_blog_comment_related_heading','',0),
	(22192,0,'simple_blog','simple_blog_display_category','0',0),
	(22193,0,'simple_blog','simple_blog_comment_auto_approval','0',0),
	(22194,0,'simple_blog','simple_blog_author_information','0',0),
	(22195,0,'simple_blog','simple_blog_related_articles','0',0),
	(22196,0,'simple_blog','simple_blog_share_social_site','0',0),
	(23908,0,'config','config_review_status','1',0),
	(22380,0,'so_mobile','mobile_general','{\"mobilelayout\":\"1\",\"nameColor\":\"\",\"colorHex\":\"\",\"listcolor\":\"blue\",\"platforms_mobile\":\"0\",\"logomobile\":\"\",\"barnav\":\"0\",\"copyright\":\"\",\"mobileheader\":\"0\",\"imgpayment\":\"\",\"phone_status\":\"1\",\"phone_text\":\"\",\"email_status\":\"1\",\"email_text\":\"\",\"customfooter_status\":\"1\",\"customfooter_text\":\"\",\"menufooter_status\":\"1\",\"footermenus\":[{\"name\":\"Menu Demo\",\"link\":\"#\",\"sort\":\"1\"}],\"barmore_status\":\"0\",\"listmenus\":[{\"name\":\"Page Brands\",\"link\":\"#\",\"sort\":\"1\"}],\"barsearch_status\":\"0\",\"barwistlist_status\":\"0\",\"barcompare_status\":\"0\",\"barcurenty_status\":\"0\",\"barlanguage_status\":\"0\",\"category_more\":\"0\",\"compare_status\":\"0\",\"wishlist_status\":\"0\",\"addcart_status\":\"0\",\"body_status\":\"standard\",\"normal_body\":\"inherit\",\"url_body\":\"\",\"family_body\":\"\",\"selector_body\":\"\",\"heading_status\":\"standard\",\"normal_heading\":\"inherit\",\"url_heading\":\"\",\"family_heading\":\"\",\"selector_heading\":\"\",\"scsscompile\":\"1\",\"scssformat\":\"Expanded\",\"compilemuticolor\":\"1\"}',1),
	(23907,0,'config','config_limit_admin','20',0),
	(23906,0,'config','config_product_count','1',0),
	(23905,0,'config','config_weight_class_id','2',0),
	(23904,0,'config','config_length_class_id','1',0),
	(23903,0,'config','config_currency_auto','0',0),
	(23902,0,'config','config_currency','INR',0),
	(23901,0,'config','config_admin_language','en-gb',0),
	(23900,0,'config','config_language','en-gb',0),
	(23899,0,'config','config_zone_id','1493',0),
	(23898,0,'config','config_country_id','99',0),
	(23897,0,'config','config_comment','',0),
	(23896,0,'config','config_open','',0),
	(23895,0,'config','config_image','catalog/sezplus_souk_logo.PNG',0),
	(23894,0,'config','config_fax','',0),
	(23893,0,'config','config_telephone','+91 022-65260008',0),
	(23892,0,'config','config_email','no-reply@sezplus.com',0),
	(23891,0,'config','config_geocode','',0),
	(23890,0,'config','config_address','RK SEZPLUS Services Pvt. Ltd.\r\nG-10, Siddhivinayak C.H.S LTD,\r\nBuilding No - 6, Bhim Nagar,\r\nRoad No - 7, Near Ackruti Star,\r\nM.I.D.C, Andheri East,\r\nMumbai - 400093 ',0),
	(23889,0,'config','config_owner','Dibyendu Dhara',0),
	(23888,0,'config','config_name','SEZPLUS',0),
	(23887,0,'config','config_layout_id','4',0),
	(23886,0,'config','config_theme','theme_default',0),
	(23885,0,'config','config_meta_keyword','',0),
	(23884,0,'config','config_meta_description','Jewellery Souk',0),
	(23859,0,'so_sociallogin','so_sociallogin_linkdinimage','catalog/sociallogin/linkedin.png',0),
	(23860,0,'so_sociallogin','so_sociallogin_linkdinapikey','78b7xin6x0kjj3',0),
	(23861,0,'so_sociallogin','so_sociallogin_linkdinsecretapi','qvTyRdKakj6WFmWs',0),
	(23862,0,'so_sociallogin','so_sociallogin_linkstatus','1',0),
	(23865,0,'seller','seller_status','1',0),
	(23866,0,'seller','subscription_fees','5',0),
	(23883,0,'config','config_meta_title','SEZPLUS',0),
	(23872,0,'basic_captcha','basic_captcha_status','0',0),
	(23873,0,'google_captcha','google_captcha_key','6LfvGQsUAAAAABgqlGea17P3SDoYUPb4EA5XD7lE',0),
	(23874,0,'google_captcha','google_captcha_secret','6LfvGQsUAAAAANoktAFV0-qU4KdupGGc2UypYyig',0),
	(23875,0,'google_captcha','google_captcha_status','1',0),
	(23876,0,'dashboard_seller','dashboard_sellers_width','3',0),
	(23877,0,'dashboard_seller','dashboard_sellers_status','1',0),
	(23878,0,'dashboard_seller','dashboard_sellers_sort_order','1',0),
	(23882,0,'filter','filter_status','1',0),
	(23968,0,'config','config_file_max_size','300000',0),
	(23969,0,'config','config_file_ext_allowed','zip\r\ntxt\r\npng\r\njpe\r\njpeg\r\njpg\r\ngif\r\nbmp\r\nico\r\ntiff\r\ntif\r\nsvg\r\nsvgz\r\nzip\r\nrar\r\nmsi\r\ncab\r\nmp3\r\nqt\r\nmov\r\npdf\r\npsd\r\nai\r\neps\r\nps\r\ndoc',0),
	(23970,0,'config','config_file_mime_allowed','text/plain\r\nimage/png\r\nimage/jpeg\r\nimage/gif\r\nimage/bmp\r\nimage/tiff\r\nimage/svg+xml\r\napplication/zip\r\n&quot;application/zip&quot;\r\napplication/x-zip\r\n&quot;application/x-zip&quot;\r\napplication/x-zip-compressed\r\n&quot;application/x-zip-compressed&quot;\r\napplication/rar\r\n&quot;application/rar&quot;\r\napplication/x-rar\r\n&quot;application/x-rar&quot;\r\napplication/x-rar-compressed\r\n&quot;application/x-rar-compressed&quot;\r\napplication/octet-stream\r\n&quot;application/octet-stream&quot;\r\naudio/mpeg\r\nvideo/quicktime\r\napplication/pdf',0),
	(23971,0,'config','config_error_display','1',0),
	(23972,0,'config','config_error_log','1',0),
	(23973,0,'config','config_error_filename','error.log',0);

/*!40000 ALTER TABLE `setting` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table simple_blog_article
# ------------------------------------------------------------

DROP TABLE IF EXISTS `simple_blog_article`;

CREATE TABLE `simple_blog_article` (
  `simple_blog_article_id` int(16) NOT NULL AUTO_INCREMENT,
  `simple_blog_author_id` int(16) NOT NULL,
  `allow_comment` tinyint(1) NOT NULL,
  `image` text NOT NULL,
  `featured_image` text NOT NULL,
  `article_related_method` varchar(64) NOT NULL,
  `article_related_option` text NOT NULL,
  `sort_order` int(8) NOT NULL,
  `status` tinyint(1) NOT NULL,
  `date_added` datetime NOT NULL,
  `date_modified` datetime NOT NULL,
  PRIMARY KEY (`simple_blog_article_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;



# Dump of table simple_blog_article_description
# ------------------------------------------------------------

DROP TABLE IF EXISTS `simple_blog_article_description`;

CREATE TABLE `simple_blog_article_description` (
  `simple_blog_article_description_id` int(16) NOT NULL AUTO_INCREMENT,
  `simple_blog_article_id` int(16) NOT NULL,
  `language_id` int(16) NOT NULL,
  `article_title` varchar(256) NOT NULL,
  `description` text NOT NULL,
  `meta_description` varchar(256) NOT NULL,
  `meta_keyword` varchar(256) NOT NULL,
  PRIMARY KEY (`simple_blog_article_description_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;



# Dump of table simple_blog_article_description_additional
# ------------------------------------------------------------

DROP TABLE IF EXISTS `simple_blog_article_description_additional`;

CREATE TABLE `simple_blog_article_description_additional` (
  `simple_blog_article_id` int(16) NOT NULL,
  `language_id` int(16) NOT NULL,
  `additional_description` text NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;



# Dump of table simple_blog_article_product_related
# ------------------------------------------------------------

DROP TABLE IF EXISTS `simple_blog_article_product_related`;

CREATE TABLE `simple_blog_article_product_related` (
  `simple_blog_article_id` int(16) NOT NULL,
  `product_id` int(16) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;



# Dump of table simple_blog_article_to_category
# ------------------------------------------------------------

DROP TABLE IF EXISTS `simple_blog_article_to_category`;

CREATE TABLE `simple_blog_article_to_category` (
  `simple_blog_article_id` int(16) NOT NULL,
  `simple_blog_category_id` int(16) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;



# Dump of table simple_blog_article_to_layout
# ------------------------------------------------------------

DROP TABLE IF EXISTS `simple_blog_article_to_layout`;

CREATE TABLE `simple_blog_article_to_layout` (
  `simple_blog_article_id` int(16) NOT NULL,
  `store_id` int(16) NOT NULL,
  `layout_id` int(16) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;



# Dump of table simple_blog_article_to_store
# ------------------------------------------------------------

DROP TABLE IF EXISTS `simple_blog_article_to_store`;

CREATE TABLE `simple_blog_article_to_store` (
  `simple_blog_article_id` int(16) NOT NULL,
  `store_id` int(16) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;



# Dump of table simple_blog_author
# ------------------------------------------------------------

DROP TABLE IF EXISTS `simple_blog_author`;

CREATE TABLE `simple_blog_author` (
  `simple_blog_author_id` int(16) NOT NULL AUTO_INCREMENT,
  `name` varchar(256) NOT NULL,
  `image` text NOT NULL,
  `status` tinyint(1) NOT NULL,
  `date_added` datetime NOT NULL,
  `date_modified` datetime NOT NULL,
  PRIMARY KEY (`simple_blog_author_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;



# Dump of table simple_blog_author_description
# ------------------------------------------------------------

DROP TABLE IF EXISTS `simple_blog_author_description`;

CREATE TABLE `simple_blog_author_description` (
  `simple_blog_author_description_id` int(16) NOT NULL AUTO_INCREMENT,
  `simple_blog_author_id` int(16) NOT NULL,
  `language_id` int(16) NOT NULL,
  `description` text NOT NULL,
  `meta_description` varchar(256) NOT NULL,
  `meta_keyword` varchar(256) NOT NULL,
  `date_added` datetime NOT NULL,
  PRIMARY KEY (`simple_blog_author_description_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;



# Dump of table simple_blog_category
# ------------------------------------------------------------

DROP TABLE IF EXISTS `simple_blog_category`;

CREATE TABLE `simple_blog_category` (
  `simple_blog_category_id` int(16) NOT NULL AUTO_INCREMENT,
  `image` text NOT NULL,
  `parent_id` int(16) NOT NULL,
  `top` tinyint(1) NOT NULL,
  `blog_category_column` int(16) NOT NULL,
  `external_link` text NOT NULL,
  `column` int(8) NOT NULL,
  `sort_order` int(8) NOT NULL,
  `status` tinyint(1) NOT NULL,
  `date_added` datetime NOT NULL,
  `date_modified` datetime NOT NULL,
  PRIMARY KEY (`simple_blog_category_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

LOCK TABLES `simple_blog_category` WRITE;
/*!40000 ALTER TABLE `simple_blog_category` DISABLE KEYS */;

INSERT INTO `simple_blog_category` (`simple_blog_category_id`, `image`, `parent_id`, `top`, `blog_category_column`, `external_link`, `column`, `sort_order`, `status`, `date_added`, `date_modified`)
VALUES
	(1,'',0,0,2,'',6,0,1,'2015-10-01 09:01:25','2016-11-28 15:08:29'),
	(2,'',0,0,0,'',5,0,1,'2015-10-01 16:12:40','2017-03-06 16:47:32'),
	(3,'',0,0,0,'',5,0,1,'2015-10-01 16:13:05','2017-03-06 16:47:41'),
	(4,'',0,0,0,'',5,0,1,'2015-10-01 16:13:27','2016-11-28 15:22:07'),
	(5,'',0,0,0,'',5,0,1,'2015-10-01 16:45:07','2016-11-28 15:08:14');

/*!40000 ALTER TABLE `simple_blog_category` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table simple_blog_category_description
# ------------------------------------------------------------

DROP TABLE IF EXISTS `simple_blog_category_description`;

CREATE TABLE `simple_blog_category_description` (
  `simple_blog_category_description_id` int(16) NOT NULL AUTO_INCREMENT,
  `simple_blog_category_id` int(16) NOT NULL,
  `language_id` int(16) NOT NULL,
  `name` varchar(256) NOT NULL,
  `description` text NOT NULL,
  `meta_description` varchar(256) NOT NULL,
  `meta_keyword` varchar(256) NOT NULL,
  PRIMARY KEY (`simple_blog_category_description_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

LOCK TABLES `simple_blog_category_description` WRITE;
/*!40000 ALTER TABLE `simple_blog_category_description` DISABLE KEYS */;

INSERT INTO `simple_blog_category_description` (`simple_blog_category_description_id`, `simple_blog_category_id`, `language_id`, `name`, `description`, `meta_description`, `meta_keyword`)
VALUES
	(49,5,1,'Demo Category 1','&lt;p&gt;&lt;span style=&quot;font-size: 13px; line-height: 22px;&quot;&gt;Ac tincidunt Suspendisse malesuada velit in Nullam elit magnis netus Vestibulum.&amp;nbsp;&lt;/span&gt;&lt;br&gt;&lt;/p&gt;','',''),
	(50,5,2,'Demo Category 1','&lt;p&gt;&lt;span style=&quot;font-size: 13px; line-height: 22px;&quot;&gt;Ac tincidunt Suspendisse malesuada velit in Nullam elit magnis netus Vestibulum.&amp;nbsp;&lt;/span&gt;&lt;br&gt;&lt;/p&gt;','',''),
	(51,1,1,'Our Blog','&lt;p&gt;&lt;span style=&quot;font-size: 13px; line-height: 22px;&quot;&gt;Ac tincidunt Suspendisse malesuada velit in Nullam elit magnis netus Vestibulum.&amp;nbsp;&lt;/span&gt;&lt;br&gt;&lt;/p&gt;','',''),
	(52,1,2,'Our Blog','&lt;p&gt;&lt;span style=&quot;font-size: 13px; line-height: 22px;&quot;&gt;Ac tincidunt Suspendisse malesuada velit in Nullam elit magnis netus Vestibulum.&amp;nbsp;&lt;/span&gt;&lt;br&gt;&lt;/p&gt;','',''),
	(53,4,1,'Demo Category 4','&lt;p&gt;&lt;span style=&quot;font-size: 13px; line-height: 22px;&quot;&gt;Ac tincidunt Suspendisse malesuada velit in Nullam elit magnis netus Vestibulum.&amp;nbsp;&lt;/span&gt;&lt;br&gt;&lt;/p&gt;','',''),
	(54,4,2,'Demo Category 4','&lt;p&gt;&lt;span style=&quot;font-size: 13px; line-height: 22px;&quot;&gt;Ac tincidunt Suspendisse malesuada velit in Nullam elit magnis netus Vestibulum.&amp;nbsp;&lt;/span&gt;&lt;br&gt;&lt;/p&gt;','',''),
	(55,2,1,'Demo Category 2','&lt;p&gt;&lt;span style=&quot;font-size: 13px; line-height: 22px;&quot;&gt;Ac tincidunt Suspendisse malesuada velit in Nullam elit magnis netus Vestibulum.&amp;nbsp;&lt;/span&gt;&lt;br&gt;&lt;/p&gt;','',''),
	(56,2,2,'Demo Category 2','&lt;p&gt;&lt;span style=&quot;font-size: 13px; line-height: 22px;&quot;&gt;Ac tincidunt Suspendisse malesuada velit in Nullam elit magnis netus Vestibulum.&amp;nbsp;&lt;/span&gt;&lt;br&gt;&lt;/p&gt;','',''),
	(57,3,1,'Demo Category 3','&lt;p&gt;&lt;span style=&quot;font-size: 13px; line-height: 22px;&quot;&gt;Ac tincidunt Suspendisse malesuada velit in Nullam elit magnis netus Vestibulum.&amp;nbsp;&lt;/span&gt;&lt;br&gt;&lt;/p&gt;','',''),
	(58,3,2,'Demo Category 3','&lt;p&gt;&lt;span style=&quot;font-size: 13px; line-height: 22px;&quot;&gt;Ac tincidunt Suspendisse malesuada velit in Nullam elit magnis netus Vestibulum.&amp;nbsp;&lt;/span&gt;&lt;br&gt;&lt;/p&gt;','','');

/*!40000 ALTER TABLE `simple_blog_category_description` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table simple_blog_category_to_layout
# ------------------------------------------------------------

DROP TABLE IF EXISTS `simple_blog_category_to_layout`;

CREATE TABLE `simple_blog_category_to_layout` (
  `simple_blog_category_id` int(16) NOT NULL,
  `store_id` int(16) NOT NULL,
  `layout_id` int(16) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;



# Dump of table simple_blog_category_to_store
# ------------------------------------------------------------

DROP TABLE IF EXISTS `simple_blog_category_to_store`;

CREATE TABLE `simple_blog_category_to_store` (
  `simple_blog_category_id` int(16) NOT NULL,
  `store_id` int(16) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;



# Dump of table simple_blog_comment
# ------------------------------------------------------------

DROP TABLE IF EXISTS `simple_blog_comment`;

CREATE TABLE `simple_blog_comment` (
  `simple_blog_comment_id` int(16) NOT NULL AUTO_INCREMENT,
  `simple_blog_article_id` int(16) NOT NULL,
  `simple_blog_article_reply_id` int(16) NOT NULL,
  `author` varchar(64) NOT NULL,
  `comment` text NOT NULL,
  `status` tinyint(1) NOT NULL,
  `date_added` datetime NOT NULL,
  `date_modified` datetime NOT NULL,
  PRIMARY KEY (`simple_blog_comment_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;



# Dump of table simple_blog_related_article
# ------------------------------------------------------------

DROP TABLE IF EXISTS `simple_blog_related_article`;

CREATE TABLE `simple_blog_related_article` (
  `simple_blog_related_article_id` int(16) NOT NULL AUTO_INCREMENT,
  `simple_blog_article_id` int(16) NOT NULL,
  `simple_blog_article_related_id` int(16) NOT NULL,
  `sort_order` int(8) NOT NULL,
  `status` tinyint(1) NOT NULL,
  `date_added` datetime NOT NULL,
  PRIMARY KEY (`simple_blog_related_article_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;



# Dump of table simple_blog_view
# ------------------------------------------------------------

DROP TABLE IF EXISTS `simple_blog_view`;

CREATE TABLE `simple_blog_view` (
  `simple_blog_view_id` int(16) NOT NULL AUTO_INCREMENT,
  `simple_blog_article_id` int(16) NOT NULL,
  `view` int(16) NOT NULL,
  `date_added` datetime NOT NULL,
  `date_modified` datetime NOT NULL,
  PRIMARY KEY (`simple_blog_view_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;



# Dump of table so_homeslider
# ------------------------------------------------------------

DROP TABLE IF EXISTS `so_homeslider`;

CREATE TABLE `so_homeslider` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `module_id` int(11) NOT NULL,
  `url` varchar(255) NOT NULL,
  `position` int(11) NOT NULL,
  `image` varchar(255) NOT NULL,
  `status` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `id` (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

LOCK TABLES `so_homeslider` WRITE;
/*!40000 ALTER TABLE `so_homeslider` DISABLE KEYS */;

INSERT INTO `so_homeslider` (`id`, `module_id`, `url`, `position`, `image`, `status`)
VALUES
	(16,194,'#',11,'catalog/demo/slideshow/home1/slider.jpg',1),
	(31,194,'#',12,'catalog/demo/slideshow/home1/slider-2.jpg',1),
	(32,194,'#',13,'catalog/demo/slideshow/home1/slider-3.jpg',1),
	(13,158,'#',8,'catalog/slideshow/home-v2/02.jpg',1),
	(12,158,'#',7,'catalog/slideshow/home-v2/01.jpg',1),
	(7,127,'#',5,'catalog/slideshow/home-v1/02.jpg',1),
	(8,127,'#',6,'catalog/slideshow/home-v1/03.jpg',1),
	(4,127,'#',4,'catalog/slideshow/home-v1/01.jpg',1),
	(3,126,'#',3,'catalog/slideshow/slider-3.png',1),
	(2,126,'#',2,'catalog/slideshow/slider-2.png',1),
	(1,126,'#',1,'catalog/slideshow/slider-1.png',1),
	(33,310,'#',14,'catalog/demo/slideshow/home2/sample-1.jpg',1),
	(34,310,'#',15,'catalog/demo/slideshow/home2/sample-2.jpg',1),
	(35,310,'#',16,'catalog/demo/slideshow/home2/sample-3.jpg',1),
	(138,12,'index.php?route=mobile/home',30,'catalog/demo-mobile/slider/banner-mobile-2.jpg',1),
	(37,311,'#',18,'catalog/demo/slideshow/home3/sample-7.jpg',1),
	(38,311,'#',19,'catalog/demo/slideshow/home3/sample-8.jpg',1),
	(137,12,'index.php?route=mobile/home',29,'catalog/demo-mobile/slider/banner-mobile-1.png',1),
	(42,311,'#',20,'catalog/demo/slideshow/home3/sample-9.jpg',1),
	(139,12,'index.php?route=mobile/home',31,'catalog/demo-mobile/slider/banner-mobile-3.jpg',1),
	(140,18,'#',32,'catalog/demo-mobile/slider/home2/banner-mobile-1.jpg',1),
	(141,21,'#',33,'catalog/demo-mobile/slider/home3/slider3-1.jpg',1),
	(142,21,'#',34,'catalog/demo-mobile/slider/home3/slider3-2.jpg',1);

/*!40000 ALTER TABLE `so_homeslider` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table so_homeslider_description
# ------------------------------------------------------------

DROP TABLE IF EXISTS `so_homeslider_description`;

CREATE TABLE `so_homeslider_description` (
  `homeslider_id` int(11) NOT NULL AUTO_INCREMENT,
  `language_id` int(11) NOT NULL,
  `title` varchar(255) NOT NULL,
  `caption` varchar(255) NOT NULL,
  `description` text NOT NULL,
  PRIMARY KEY (`homeslider_id`,`language_id`),
  KEY `title` (`title`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

LOCK TABLES `so_homeslider_description` WRITE;
/*!40000 ALTER TABLE `so_homeslider_description` DISABLE KEYS */;

INSERT INTO `so_homeslider_description` (`homeslider_id`, `language_id`, `title`, `caption`, `description`)
VALUES
	(12,2,'Title slider 1','',' '),
	(12,1,'Title slider 1','',' '),
	(8,2,'Title slider 3','',' '),
	(13,2,'Title slider 2','',' '),
	(7,2,'Title slider 2','',' '),
	(8,1,'Title slider 3','',' '),
	(7,1,'Title slider 2','',' '),
	(4,2,'Title slider 1','','&lt;p&gt;&lt;br&gt;&lt;/p&gt; '),
	(4,1,'Title slider 1','','&lt;p&gt;&lt;br&gt;&lt;/p&gt; '),
	(3,2,'Title slider 1','Caption','Watch music videos and streaming content in awe-inspiring high definition '),
	(3,1,'Title slider 1','Caption','Watch music videos and streaming content in awe-inspiring high definition '),
	(2,2,'Title slider 1','Caption','Watch music videos and streaming content in awe-inspiring high definition '),
	(2,1,'Title slider 2','Caption','Watch music videos and streaming content in awe-inspiring high definition '),
	(1,2,'Title slider 1','Caption','Watch music videos and streaming content in awe-inspiring high definition '),
	(1,1,'Title slider 1','Caption','Watch music videos and streaming content in awe-inspiring high definition '),
	(13,1,'Title slider 2','',' '),
	(16,1,'Slider 1','','&lt;p&gt;&lt;br&gt;&lt;/p&gt;'),
	(16,2,'Slider 1','','&lt;p&gt;&lt;br&gt;&lt;/p&gt;'),
	(31,1,'slider2','',' '),
	(31,2,'slider2','',' '),
	(32,1,'slider3','',' '),
	(32,2,'slider3','',' '),
	(33,1,'slide1','',' '),
	(33,2,'slide1','',' '),
	(34,1,'slider2','',' '),
	(34,2,'slider2','',' '),
	(35,1,'slider3','',' '),
	(35,2,'slider3','',' '),
	(138,1,'slider2','',' '),
	(37,1,'slider2','',' '),
	(37,2,'slide2','',' '),
	(38,1,'slider3','',' '),
	(38,2,'slider3','',' '),
	(137,2,'slider1','',' '),
	(137,1,'slider1','',' '),
	(42,2,'slide1','',' '),
	(42,1,'slider1','',' '),
	(138,2,'slider2','',' '),
	(139,1,'slider3','',' '),
	(139,2,'slider3','',' '),
	(140,1,'slider1','',' '),
	(140,2,'slider1','',' '),
	(141,1,'slider1','',' '),
	(141,2,'slide1','',' '),
	(142,1,'slider2','',' '),
	(142,2,'slide2','',' ');

/*!40000 ALTER TABLE `so_homeslider_description` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table so_product_label
# ------------------------------------------------------------

DROP TABLE IF EXISTS `so_product_label`;

CREATE TABLE `so_product_label` (
  `id` int(11) unsigned NOT NULL,
  `product_id` int(11) NOT NULL,
  `status` tinyint(1) NOT NULL,
  `show_category` tinyint(1) NOT NULL,
  `show_product` tinyint(1) NOT NULL,
  `type` tinyint(1) NOT NULL,
  `position` varchar(50) NOT NULL,
  `image` varchar(255) DEFAULT NULL,
  `text` varchar(100) DEFAULT NULL,
  `color` char(7) DEFAULT NULL,
  `bgcolor` char(7) DEFAULT NULL,
  `fontsize` char(2) DEFAULT NULL,
  `width` int(3) DEFAULT NULL,
  `height` int(3) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES `so_product_label` WRITE;
/*!40000 ALTER TABLE `so_product_label` DISABLE KEYS */;

INSERT INTO `so_product_label` (`id`, `product_id`, `status`, `show_category`, `show_product`, `type`, `position`, `image`, `text`, `color`, `bgcolor`, `fontsize`, `width`, `height`)
VALUES
	(513,193,1,1,1,1,'topleft','catalog/so_product_label/all/free-gift.png','','#000000','#000000','12',55,61),
	(514,193,1,1,1,1,'bottomleft','catalog/so_product_label/all/preorder.png','','#000000','#000000','12',105,83),
	(515,193,0,0,0,2,'topleft','','','#000000','#000000','12',0,0),
	(516,193,0,0,0,2,'topleft','','','#000000','#000000','12',0,0),
	(517,193,0,0,0,2,'topleft','','','#000000','#000000','12',0,0),
	(518,193,0,0,0,2,'topleft','','','#000000','#000000','12',0,0),
	(519,193,0,0,0,2,'topleft','','','#000000','#000000','12',0,0),
	(520,193,0,0,0,2,'topleft','','','#000000','#000000','12',0,0),
	(521,193,1,1,1,1,'topleft','catalog/so_product_label/all/free-gift.png','','#000000','#000000','12',55,61),
	(522,193,1,1,1,1,'bottomleft','catalog/so_product_label/all/preorder.png','','#000000','#000000','12',105,83),
	(523,193,0,0,0,2,'topleft','','','#000000','#000000','12',0,0),
	(524,193,0,0,0,2,'topleft','','','#000000','#000000','12',0,0),
	(525,193,0,0,0,2,'topleft','','','#000000','#000000','12',0,0),
	(526,193,0,0,0,2,'topleft','','','#000000','#000000','12',0,0),
	(527,193,0,0,0,2,'topleft','','','#000000','#000000','12',0,0),
	(528,193,0,0,0,2,'topleft','','','#000000','#000000','12',0,0),
	(657,187,1,1,1,1,'topleft','catalog/so_product_label/All/hot.png','','#000000','#000000','12',80,80),
	(658,187,1,1,1,1,'bottomright','catalog/so_product_label/all/instock.png','','#000000','#000000','12',94,94),
	(659,187,0,0,0,2,'topleft','','','#000000','#000000','12',0,0),
	(660,187,0,0,0,2,'topleft','','','#000000','#000000','12',0,0),
	(661,187,0,0,0,2,'topleft','','','#000000','#000000','12',0,0),
	(662,187,0,0,0,2,'topleft','','','#000000','#000000','12',0,0),
	(663,187,0,0,0,2,'topleft','','','#000000','#000000','12',0,0),
	(664,187,0,0,0,2,'topleft','','','#000000','#000000','12',0,0),
	(665,187,1,1,1,1,'topleft','catalog/so_product_label/All/hot.png','','#000000','#000000','12',80,80),
	(666,187,1,1,1,1,'bottomright','catalog/so_product_label/all/instock.png','','#000000','#000000','12',94,94),
	(667,187,0,0,0,2,'topleft','','','#000000','#000000','12',0,0),
	(668,187,0,0,0,2,'topleft','','','#000000','#000000','12',0,0),
	(669,187,0,0,0,2,'topleft','','','#000000','#000000','12',0,0),
	(670,187,0,0,0,2,'topleft','','','#000000','#000000','12',0,0),
	(671,187,0,0,0,2,'topleft','','','#000000','#000000','12',0,0),
	(672,187,0,0,0,2,'topleft','','','#000000','#000000','12',0,0),
	(705,230,1,1,1,1,'topleft','catalog/so_product_label/All/ship.png','','#000000','#000000','12',140,52),
	(706,230,0,0,0,2,'bottomcenter','','','#000000','#000000','12',0,0),
	(707,230,0,0,0,2,'topleft','','','#000000','#000000','12',0,0),
	(708,230,0,0,0,2,'topleft','','','#000000','#000000','12',0,0),
	(709,230,0,0,0,2,'topleft','','','#000000','#000000','12',0,0),
	(710,230,0,0,0,2,'topleft','','','#000000','#000000','12',0,0),
	(711,230,0,0,0,2,'topleft','','','#000000','#000000','12',0,0),
	(712,230,0,0,0,2,'topleft','','','#000000','#000000','12',0,0),
	(713,230,1,1,1,1,'topleft','catalog/so_product_label/All/ship.png','','#000000','#000000','12',140,52),
	(714,230,0,0,0,2,'bottomcenter','','','#000000','#000000','12',0,0),
	(715,230,0,0,0,2,'topleft','','','#000000','#000000','12',0,0),
	(716,230,0,0,0,2,'topleft','','','#000000','#000000','12',0,0),
	(717,230,0,0,0,2,'topleft','','','#000000','#000000','12',0,0),
	(718,230,0,0,0,2,'topleft','','','#000000','#000000','12',0,0),
	(719,230,0,0,0,2,'topleft','','','#000000','#000000','12',0,0),
	(720,230,0,0,0,2,'topleft','','','#000000','#000000','12',0,0),
	(737,190,1,1,1,1,'topleft','catalog/so_product_label/All/day.png','','#000000','#000000','12',80,80),
	(738,190,1,1,1,1,'bottomright','catalog/so_product_label/All/instock.png','','#000000','#000000','12',94,94),
	(739,190,0,0,0,2,'topleft','','','#000000','#000000','12',0,0),
	(740,190,0,0,0,2,'topleft','','','#000000','#000000','12',0,0),
	(741,190,0,0,0,2,'topleft','','','#000000','#000000','12',0,0),
	(742,190,0,0,0,2,'topleft','','','#000000','#000000','12',0,0),
	(743,190,0,0,0,2,'topleft','','','#000000','#000000','12',0,0),
	(744,190,0,0,0,2,'topleft','','','#000000','#000000','12',0,0),
	(745,190,1,1,1,1,'topleft','catalog/so_product_label/All/day.png','','#000000','#000000','12',80,80),
	(746,190,1,1,1,1,'bottomright','catalog/so_product_label/All/instock.png','','#000000','#000000','12',94,94),
	(747,190,0,0,0,2,'topleft','','','#000000','#000000','12',0,0),
	(748,190,0,0,0,2,'topleft','','','#000000','#000000','12',0,0),
	(749,190,0,0,0,2,'topleft','','','#000000','#000000','12',0,0),
	(750,190,0,0,0,2,'topleft','','','#000000','#000000','12',0,0),
	(751,190,0,0,0,2,'topleft','','','#000000','#000000','12',0,0),
	(752,190,0,0,0,2,'topleft','','','#000000','#000000','12',0,0),
	(753,47,1,0,0,1,'topright','catalog/so_product_label/All/comingsoon.png','','#000000','#000000','12',89,90),
	(754,47,0,0,0,2,'topleft','http://localhost/ytc_templates/opencart/so_topdeal/image/cache/no_image-100x100.png','','#000000','#000000','12',0,0),
	(755,47,0,0,0,2,'topleft','http://localhost/ytc_templates/opencart/so_topdeal/image/cache/no_image-100x100.png','','#000000','#000000','12',0,0),
	(756,47,0,0,0,2,'topleft','http://localhost/ytc_templates/opencart/so_topdeal/image/cache/no_image-100x100.png','','#000000','#000000','12',0,0),
	(757,47,0,0,0,2,'topleft','http://localhost/ytc_templates/opencart/so_topdeal/image/cache/no_image-100x100.png','','#000000','#000000','12',0,0),
	(758,47,0,0,0,2,'topleft','http://localhost/ytc_templates/opencart/so_topdeal/image/cache/no_image-100x100.png','','#000000','#000000','12',0,0),
	(759,47,0,0,0,2,'topleft','http://localhost/ytc_templates/opencart/so_topdeal/image/cache/no_image-100x100.png','','#000000','#000000','12',0,0),
	(760,47,0,0,0,2,'topleft','http://localhost/ytc_templates/opencart/so_topdeal/image/cache/no_image-100x100.png','','#000000','#000000','12',0,0),
	(761,47,1,0,0,1,'topright','catalog/so_product_label/All/comingsoon.png','','#000000','#000000','12',89,90),
	(762,47,0,0,0,2,'topleft','http://localhost/ytc_templates/opencart/so_topdeal/image/cache/no_image-100x100.png','','#000000','#000000','12',0,0),
	(763,47,0,0,0,2,'topleft','http://localhost/ytc_templates/opencart/so_topdeal/image/cache/no_image-100x100.png','','#000000','#000000','12',0,0),
	(764,47,0,0,0,2,'topleft','http://localhost/ytc_templates/opencart/so_topdeal/image/cache/no_image-100x100.png','','#000000','#000000','12',0,0),
	(765,47,0,0,0,2,'topleft','http://localhost/ytc_templates/opencart/so_topdeal/image/cache/no_image-100x100.png','','#000000','#000000','12',0,0),
	(766,47,0,0,0,2,'topleft','http://localhost/ytc_templates/opencart/so_topdeal/image/cache/no_image-100x100.png','','#000000','#000000','12',0,0),
	(767,47,0,0,0,2,'topleft','http://localhost/ytc_templates/opencart/so_topdeal/image/cache/no_image-100x100.png','','#000000','#000000','12',0,0),
	(768,47,0,0,0,2,'topleft','http://localhost/ytc_templates/opencart/so_topdeal/image/cache/no_image-100x100.png','','#000000','#000000','12',0,0),
	(785,202,0,0,0,1,'topleft','','','#000000','#000000','12',0,0),
	(786,202,0,0,0,2,'topleft','','','#000000','#000000','12',0,0),
	(787,202,0,0,0,2,'topleft','','','#000000','#000000','12',0,0),
	(788,202,0,0,0,2,'topleft','','','#000000','#000000','12',0,0),
	(789,202,0,0,0,2,'topleft','','','#000000','#000000','12',0,0),
	(790,202,0,0,0,2,'topleft','','','#000000','#000000','12',0,0),
	(791,202,0,0,0,2,'topleft','','','#000000','#000000','12',0,0),
	(792,202,0,0,0,2,'topleft','','','#000000','#000000','12',0,0),
	(793,202,0,0,0,1,'topleft','','','#000000','#000000','12',0,0),
	(794,202,0,0,0,2,'topleft','','','#000000','#000000','12',0,0),
	(795,202,0,0,0,2,'topleft','','','#000000','#000000','12',0,0),
	(796,202,0,0,0,2,'topleft','','','#000000','#000000','12',0,0),
	(797,202,0,0,0,2,'topleft','','','#000000','#000000','12',0,0),
	(798,202,0,0,0,2,'topleft','','','#000000','#000000','12',0,0),
	(799,202,0,0,0,2,'topleft','','','#000000','#000000','12',0,0),
	(800,202,0,0,0,2,'topleft','','','#000000','#000000','12',0,0),
	(833,203,1,1,1,1,'bottomright','catalog/so_product_label/All/instock.png','','#000000','#000000','12',94,94),
	(834,203,0,0,0,2,'topleft','','','#000000','#000000','12',0,0),
	(835,203,0,0,0,2,'topleft','','','#000000','#000000','12',0,0),
	(836,203,0,0,0,2,'topleft','','','#000000','#000000','12',0,0),
	(837,203,0,0,0,2,'topleft','','','#000000','#000000','12',0,0),
	(838,203,0,0,0,2,'topleft','','','#000000','#000000','12',0,0),
	(839,203,0,0,0,2,'topleft','','','#000000','#000000','12',0,0),
	(840,203,0,0,0,2,'topleft','','','#000000','#000000','12',0,0),
	(841,203,1,1,1,1,'bottomright','catalog/so_product_label/All/instock.png','','#000000','#000000','12',94,94),
	(842,203,0,0,0,2,'topleft','','','#000000','#000000','12',0,0),
	(843,203,0,0,0,2,'topleft','','','#000000','#000000','12',0,0),
	(844,203,0,0,0,2,'topleft','','','#000000','#000000','12',0,0),
	(845,203,0,0,0,2,'topleft','','','#000000','#000000','12',0,0),
	(846,203,0,0,0,2,'topleft','','','#000000','#000000','12',0,0),
	(847,203,0,0,0,2,'topleft','','','#000000','#000000','12',0,0),
	(848,203,0,0,0,2,'topleft','','','#000000','#000000','12',0,0),
	(897,243,1,1,0,1,'topleft','catalog/so_product_label/All/limited.png','','#000000','#000000','12',80,80),
	(898,243,1,1,0,1,'bottomright','catalog/so_product_label/All/instock.png','','#000000','#000000','12',94,94),
	(899,243,0,0,0,2,'topleft','','','#000000','#000000','12',0,0),
	(900,243,0,0,0,2,'topleft','','','#000000','#000000','12',0,0),
	(901,243,0,0,0,2,'topleft','','','#000000','#000000','12',0,0),
	(902,243,0,0,0,2,'topleft','','','#000000','#000000','12',0,0),
	(903,243,0,0,0,2,'topleft','','','#000000','#000000','12',0,0),
	(904,243,0,0,0,2,'topleft','','','#000000','#000000','12',0,0),
	(905,243,1,1,0,1,'topleft','catalog/so_product_label/All/limited.png','','#000000','#000000','12',80,80),
	(906,243,1,1,0,1,'bottomright','catalog/so_product_label/All/instock.png','','#000000','#000000','12',94,94),
	(907,243,0,0,0,2,'topleft','','','#000000','#000000','12',0,0),
	(908,243,0,0,0,2,'topleft','','','#000000','#000000','12',0,0),
	(909,243,0,0,0,2,'topleft','','','#000000','#000000','12',0,0),
	(910,243,0,0,0,2,'topleft','','','#000000','#000000','12',0,0),
	(911,243,0,0,0,2,'topleft','','','#000000','#000000','12',0,0),
	(912,243,0,0,0,2,'topleft','','','#000000','#000000','12',0,0),
	(945,247,1,1,0,1,'topleft','catalog/so_product_label/All/hot.png','','#000000','#000000','12',80,80),
	(946,247,1,1,0,1,'bottomright','catalog/so_product_label/All/soldout.png','','#000000','#000000','12',94,94),
	(947,247,0,0,0,2,'topleft','','','#000000','#000000','12',0,0),
	(948,247,0,0,0,2,'topleft','','','#000000','#000000','12',0,0),
	(949,247,0,0,0,2,'topleft','','','#000000','#000000','12',0,0),
	(950,247,0,0,0,2,'topleft','','','#000000','#000000','12',0,0),
	(951,247,0,0,0,2,'topleft','','','#000000','#000000','12',0,0),
	(952,247,0,0,0,2,'topleft','','','#000000','#000000','12',0,0),
	(953,247,1,1,0,1,'topleft','catalog/so_product_label/All/hot.png','','#000000','#000000','12',80,80),
	(954,247,1,1,0,1,'bottomright','catalog/so_product_label/All/soldout.png','','#000000','#000000','12',94,94),
	(955,247,0,0,0,2,'topleft','','','#000000','#000000','12',0,0),
	(956,247,0,0,0,2,'topleft','','','#000000','#000000','12',0,0),
	(957,247,0,0,0,2,'topleft','','','#000000','#000000','12',0,0),
	(958,247,0,0,0,2,'topleft','','','#000000','#000000','12',0,0),
	(959,247,0,0,0,2,'topleft','','','#000000','#000000','12',0,0),
	(960,247,0,0,0,2,'topleft','','','#000000','#000000','12',0,0),
	(961,204,1,1,1,1,'topleft','catalog/so_product_label/All/trans.png','','#000000','#000000','12',140,52),
	(962,204,0,0,0,2,'bottomright','','','#000000','#000000','12',0,0),
	(963,204,0,0,0,2,'topleft','','','#000000','#000000','12',0,0),
	(964,204,0,0,0,2,'topleft','','','#000000','#000000','12',0,0),
	(965,204,0,0,0,2,'topleft','','','#000000','#000000','12',0,0),
	(966,204,0,0,0,2,'topleft','','','#000000','#000000','12',0,0),
	(967,204,0,0,0,2,'topleft','','','#000000','#000000','12',0,0),
	(968,204,0,0,0,2,'topleft','','','#000000','#000000','12',0,0),
	(969,204,1,1,1,1,'topleft','catalog/so_product_label/All/trans.png','','#000000','#000000','12',140,52),
	(970,204,0,0,0,2,'bottomright','','','#000000','#000000','12',0,0),
	(971,204,0,0,0,2,'topleft','','','#000000','#000000','12',0,0),
	(972,204,0,0,0,2,'topleft','','','#000000','#000000','12',0,0),
	(973,204,0,0,0,2,'topleft','','','#000000','#000000','12',0,0),
	(974,204,0,0,0,2,'topleft','','','#000000','#000000','12',0,0),
	(975,204,0,0,0,2,'topleft','','','#000000','#000000','12',0,0),
	(976,204,0,0,0,2,'topleft','','','#000000','#000000','12',0,0),
	(977,191,1,1,1,1,'topleft','catalog/so_product_label/All/limited.png','','#000000','#000000','12',67,65),
	(978,191,1,1,0,1,'bottomright','catalog/so_product_label/All/instock.png','','#000000','#000000','12',94,94),
	(979,191,0,0,0,2,'topleft','','','#000000','#000000','12',0,0),
	(980,191,0,0,0,2,'topleft','','','#000000','#000000','12',0,0),
	(981,191,0,0,0,2,'topleft','','','#000000','#000000','12',0,0),
	(982,191,0,0,0,2,'topleft','','','#000000','#000000','12',0,0),
	(983,191,0,0,0,2,'topleft','','','#000000','#000000','12',0,0),
	(984,191,0,0,0,2,'topleft','','','#000000','#000000','12',0,0),
	(985,191,1,1,1,1,'topleft','catalog/so_product_label/All/limited.png','','#000000','#000000','12',67,65),
	(986,191,1,1,0,1,'bottomright','catalog/so_product_label/All/instock.png','','#000000','#000000','12',94,94),
	(987,191,0,0,0,2,'topleft','','','#000000','#000000','12',0,0),
	(988,191,0,0,0,2,'topleft','','','#000000','#000000','12',0,0),
	(989,191,0,0,0,2,'topleft','','','#000000','#000000','12',0,0),
	(990,191,0,0,0,2,'topleft','','','#000000','#000000','12',0,0),
	(991,191,0,0,0,2,'topleft','','','#000000','#000000','12',0,0),
	(992,191,0,0,0,2,'topleft','','','#000000','#000000','12',0,0),
	(993,79,1,1,1,1,'topleft','catalog/so_product_label/All/best.png','','#000000','#000000','12',80,80),
	(994,79,1,1,1,1,'bottomright','catalog/so_product_label/All/instock.png','','#000000','#000000','12',94,94),
	(995,79,0,0,0,2,'topleft','','','#000000','#000000','12',0,0),
	(996,79,0,0,0,2,'topleft','','','#000000','#000000','12',0,0),
	(997,79,0,0,0,2,'topleft','','','#000000','#000000','12',0,0),
	(998,79,0,0,0,2,'topleft','','','#000000','#000000','12',0,0),
	(999,79,0,0,0,2,'topleft','','','#000000','#000000','12',0,0),
	(1000,79,0,0,0,2,'topleft','','','#000000','#000000','12',0,0),
	(1001,79,1,1,1,1,'topleft','catalog/so_product_label/All/best.png','','#000000','#000000','12',80,80),
	(1002,79,1,1,1,1,'bottomright','catalog/so_product_label/All/instock.png','','#000000','#000000','12',94,94),
	(1003,79,0,0,0,2,'topleft','','','#000000','#000000','12',0,0),
	(1004,79,0,0,0,2,'topleft','','','#000000','#000000','12',0,0),
	(1005,79,0,0,0,2,'topleft','','','#000000','#000000','12',0,0),
	(1006,79,0,0,0,2,'topleft','','','#000000','#000000','12',0,0),
	(1007,79,0,0,0,2,'topleft','','','#000000','#000000','12',0,0),
	(1008,79,0,0,0,2,'topleft','','','#000000','#000000','12',0,0),
	(1009,76,1,1,1,1,'topleft','catalog/so_product_label/All/limited.png','','#000000','#000000','12',67,65),
	(1010,76,0,1,1,1,'bottomright','catalog/so_product_label/All/soldout.png','','#000000','#000000','12',94,94),
	(1011,76,0,0,0,2,'topleft','','','#000000','#000000','12',0,0),
	(1012,76,0,0,0,2,'topleft','','','#000000','#000000','12',0,0),
	(1013,76,0,0,0,2,'topleft','','','#000000','#000000','12',0,0),
	(1014,76,0,0,0,2,'topleft','','','#000000','#000000','12',0,0),
	(1015,76,0,0,0,2,'topleft','','','#000000','#000000','12',0,0),
	(1016,76,0,0,0,2,'topleft','','','#000000','#000000','12',0,0),
	(1017,76,1,1,1,1,'topleft','catalog/so_product_label/All/limited.png','','#000000','#000000','12',67,65),
	(1018,76,0,1,1,1,'bottomright','catalog/so_product_label/All/soldout.png','','#000000','#000000','12',94,94),
	(1019,76,0,0,0,2,'topleft','','','#000000','#000000','12',0,0),
	(1020,76,0,0,0,2,'topleft','','','#000000','#000000','12',0,0),
	(1021,76,0,0,0,2,'topleft','','','#000000','#000000','12',0,0),
	(1022,76,0,0,0,2,'topleft','','','#000000','#000000','12',0,0),
	(1023,76,0,0,0,2,'topleft','','','#000000','#000000','12',0,0),
	(1024,76,0,0,0,2,'topleft','','','#000000','#000000','12',0,0),
	(1025,209,1,1,1,1,'topleft','catalog/so_product_label/All/ship.png','','#000000','#000000','12',140,52),
	(1026,209,1,1,0,1,'bottomright','catalog/so_product_label/All/instock.png','','#000000','#000000','12',94,94),
	(1027,209,0,0,0,2,'topleft','','','#000000','#000000','12',0,0),
	(1028,209,0,0,0,2,'topleft','','','#000000','#000000','12',0,0),
	(1029,209,0,0,0,2,'topleft','','','#000000','#000000','12',0,0),
	(1030,209,0,0,0,2,'topleft','','','#000000','#000000','12',0,0),
	(1031,209,0,0,0,2,'topleft','','','#000000','#000000','12',0,0),
	(1032,209,0,0,0,2,'topleft','','','#000000','#000000','12',0,0),
	(1033,209,1,1,1,1,'topleft','catalog/so_product_label/All/ship.png','','#000000','#000000','12',140,52),
	(1034,209,1,1,0,1,'bottomright','catalog/so_product_label/All/instock.png','','#000000','#000000','12',94,94),
	(1035,209,0,0,0,2,'topleft','','','#000000','#000000','12',0,0),
	(1036,209,0,0,0,2,'topleft','','','#000000','#000000','12',0,0),
	(1037,209,0,0,0,2,'topleft','','','#000000','#000000','12',0,0),
	(1038,209,0,0,0,2,'topleft','','','#000000','#000000','12',0,0),
	(1039,209,0,0,0,2,'topleft','','','#000000','#000000','12',0,0),
	(1040,209,0,0,0,2,'topleft','','','#000000','#000000','12',0,0);

/*!40000 ALTER TABLE `so_product_label` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table soconfig
# ------------------------------------------------------------

DROP TABLE IF EXISTS `soconfig`;

CREATE TABLE `soconfig` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `store_id` int(11) NOT NULL DEFAULT '0',
  `key` varchar(255) NOT NULL,
  `value` mediumtext NOT NULL,
  `serialized` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

LOCK TABLES `soconfig` WRITE;
/*!40000 ALTER TABLE `soconfig` DISABLE KEYS */;

INSERT INTO `soconfig` (`id`, `store_id`, `key`, `value`, `serialized`)
VALUES
	(54889,0,'soconfig_general_store','{\"typelayout\":\"1\",\"themecolor\":\"pink\",\"preloader\":\"1\",\"preloader_animation\":\"cube-grid\",\"imgpreloader\":\"\",\"layouts\":\"1\",\"backtop\":\"1\",\"scroll_animation\":\"1\",\"copyright\":\"RK SEZPLUS Services Pvt. Ltd.  \\u00a9 2016 - {year}. All Rights Reserved.\",\"typeheader\":\"2\",\"toppanel_status\":\"0\",\"toppanel_type\":\"1\",\"phone_status\":\"0\",\"contact_number\":{\"1\":\"\"},\"welcome_message_status\":\"0\",\"welcome_message\":{\"1\":\"\"},\"wishlist_status\":\"0\",\"checkout_status\":\"0\",\"lang_status\":\"0\",\"typefooter\":\"1\",\"imgpayment_status\":\"0\",\"imgpayment\":\"catalog\\/demo\\/payment\\/payments-1.png\",\"type_banner\":\"7\",\"contentbg\":\"\"}',1),
	(54890,0,'soconfig_advanced_store','{\"name_color\":\"Pink\",\"theme_color\":\"#dd3c7f\",\"scsscompile\":\"0\",\"scssformat\":\"Compressed\",\"compileMutiColor\":\"0\",\"minify_css\":\"0\",\"minify_js\":\"0\"}',1),
	(54891,0,'soconfig_layout_store','{\"layoutstyle\":\"full\",\"general_bgcolor\":\"#f5f5f5\",\"pattern\":\"21\",\"content_bg_mode\":\"repeat\",\"content_attachment\":\"scroll\"}',1),
	(54892,0,'soconfig_pages_store','{\"product_catalog_refine\":\"2\",\"product_catalog_refine_col_lg\":\"5\",\"product_catalog_refine_col_md\":\"4\",\"product_catalog_refine_col_sm\":\"4\",\"product_catalog_refine_col_xs\":\"2\",\"deals_today\":\"0\",\"lstimg_cate_status\":\"0\",\"product_catalog_mode\":\"0\",\"product_catalog_column_lg\":\"3\",\"product_catalog_column_md\":\"3\",\"product_catalog_column_sm\":\"3\",\"product_catalog_column_xs\":\"2\",\"other_catalog_column_lg\":\"4\",\"other_catalog_column_md\":\"3\",\"other_catalog_column_sm\":\"2\",\"other_catalog_column_xs\":\"2\",\"secondimg\":\"2\",\"rating_status\":\"0\",\"lstdescription_status\":\"0\",\"sale_status\":\"1\",\"sale_text\":{\"1\":\"Sale\"},\"new_status\":\"1\",\"new_text\":{\"1\":\"New\"},\"days\":\"30\",\"quick_status\":\"0\",\"quick_view_text\":{\"1\":\"Quickview\"},\"discount_status\":\"1\",\"countdown_status\":\"1\",\"radio_style\":\"1\",\"check_style\":\"1\",\"product_gallerysize\":\"medium\",\"thumbnails_position\":\"bottom\",\"product_enablezoom\":\"1\",\"product_zoommode\":\"basic\",\"product_zoomlenssize\":\"250\",\"tabs_position\":\"2\",\"product_page_button\":\"1\",\"product_socialshare\":{\"1\":\"&lt;div class=&quot;social-share&quot;&gt;\\r\\n\\t&lt;div class=&quot;title-share&quot;&gt;Share&lt;\\/div&gt;\\r\\n\\t&lt;div class=&quot;wrap-content&quot;&gt;\\r\\n\\t\\t&lt;a href=&quot;http:\\/\\/www.facebook.com\\/share.php?u=http:\\/\\/wp.smartaddons.com\\/themes\\/sw_revo\\/?product=ut-enim-ad-mini-2&amp;amp;title=Ut enim ad mini&quot; onclick=&quot;javascript:window.open(this.href,\'\', \'menubar=no,toolbar=no,resizable=yes,scrollbars=yes,height=600,width=600\');return false;&quot;&gt;&lt;i class=&quot;fa fa-facebook&quot;&gt;&lt;\\/i&gt;&lt;\\/a&gt;\\r\\n\\t\\t\\t&lt;a href=&quot;http:\\/\\/twitter.com\\/home?status=Ut enim ad mini+http:\\/\\/wp.smartaddons.com\\/themes\\/sw_revo\\/?product=ut-enim-ad-mini-2&quot; onclick=&quot;javascript:window.open(this.href,\'\', \'menubar=no,toolbar=no,resizable=yes,scrollbars=yes,height=600,width=600\');return false;&quot;&gt;&lt;i class=&quot;fa fa-twitter&quot;&gt;&lt;\\/i&gt;&lt;\\/a&gt;\\r\\n\\t\\t\\t&lt;a href=&quot;https:\\/\\/plus.google.com\\/share?url=http:\\/\\/wp.smartaddons.com\\/themes\\/sw_revo\\/?product=ut-enim-ad-mini-2&quot; onclick=&quot;javascript:window.open(this.href,\'\', \'menubar=no,toolbar=no,resizable=yes,scrollbars=yes,height=600,width=600\');return false;&quot;&gt;&lt;i class=&quot;fa fa-google-plus&quot;&gt;&lt;\\/i&gt;&lt;\\/a&gt;\\r\\n\\t\\t\\t&lt;a href=&quot;#&quot;&gt;&lt;i class=&quot;fa fa-dribbble&quot;&gt;&lt;\\/i&gt;&lt;\\/a&gt;\\r\\n\\t\\t\\t&lt;a href=&quot;#&quot;&gt;&lt;i class=&quot;fa fa-instagram&quot;&gt;&lt;\\/i&gt;&lt;\\/a&gt;\\r\\n\\t&lt;\\/div&gt;\\r\\n&lt;\\/div&gt;\"},\"related_status\":\"1\",\"related_position\":\"horizontal\",\"product_related_column_lg\":\"3\",\"product_related_column_md\":\"3\",\"product_related_column_sm\":\"2\",\"product_related_column_xs\":\"2\"}',1),
	(54893,0,'soconfig_fonts_store','{\"body_status\":\"google\",\"normal_body\":\"inherit\",\"url_body\":\"https:\\/\\/fonts.googleapis.com\\/css?family=Roboto:400,500,700\",\"family_body\":\"Roboto, sans-serif\",\"selector_body\":\"body\",\"menu_status\":\"google\",\"normal_menu\":\"inherit\",\"url_menu\":\"https:\\/\\/fonts.googleapis.com\\/css?family=Lora:400,400i,700,700i\",\"family_menu\":\"Lora, serif\",\"selector_menu\":\".ct-font\",\"heading_status\":\"standard\",\"normal_heading\":\"inherit\",\"url_heading\":\"\",\"family_heading\":\"\",\"selector_heading\":\"\"}',1),
	(54894,0,'soconfig_social_store','{\"social_fb_status\":\"0\",\"facebook\":\"rksezplus\",\"social_twitter_status\":\"0\",\"twitter\":\"smartaddons\",\"social_custom_status\":\"0\",\"video_code\":{\"1\":\"&lt;br&gt;\"}}',1),
	(54895,0,'soconfig_custom_store','{\"cssinput_status\":\"1\",\"custom_css\":\".seller-login .well, .seller-register .well, .seller-terms .well, .seller-contact .well, .seller-forgotten .well {\\r\\n    background: #fff none repeat scroll 0 0;\\r\\n}\\r\\n\\r\\n.toplink-menu-heading {\\r\\n\\ttext-transform: uppercase;\\r\\n\\tfont-weight: bold;\\r\\n\\tcolor: #556681;\\r\\n\\tborder-bottom: #dd3c7f solid 1px;\\r\\n\\tpadding: 2px 3px;\\r\\n\\tfont-size: 14px;\\r\\n}\",\"cssfile_status\":\"0\",\"cssfile\":[\"catalog\\/view\\/theme\\/so-hurama\\/css\\/custom.css\"],\"jsinput_status\":\"0\",\"custom_js\":\"\",\"jsfile_status\":\"0\",\"jsfile\":[\"catalog\\/view\\/theme\\/so-hurama\\/js\\/custom.js\"]}',1);

/*!40000 ALTER TABLE `soconfig` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table stock_status
# ------------------------------------------------------------

DROP TABLE IF EXISTS `stock_status`;

CREATE TABLE `stock_status` (
  `stock_status_id` int(11) NOT NULL AUTO_INCREMENT,
  `language_id` int(11) NOT NULL,
  `name` varchar(32) NOT NULL,
  PRIMARY KEY (`stock_status_id`,`language_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

LOCK TABLES `stock_status` WRITE;
/*!40000 ALTER TABLE `stock_status` DISABLE KEYS */;

INSERT INTO `stock_status` (`stock_status_id`, `language_id`, `name`)
VALUES
	(7,1,'In Stock'),
	(8,1,'Pre-Order'),
	(5,1,'Out Of Stock'),
	(6,1,'2-3 Days');

/*!40000 ALTER TABLE `stock_status` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table store
# ------------------------------------------------------------

DROP TABLE IF EXISTS `store`;

CREATE TABLE `store` (
  `store_id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(64) NOT NULL,
  `url` varchar(255) NOT NULL,
  `ssl` varchar(255) NOT NULL,
  PRIMARY KEY (`store_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;



# Dump of table tax_class
# ------------------------------------------------------------

DROP TABLE IF EXISTS `tax_class`;

CREATE TABLE `tax_class` (
  `tax_class_id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(32) NOT NULL,
  `description` varchar(255) NOT NULL,
  `date_added` datetime NOT NULL,
  `date_modified` datetime NOT NULL,
  PRIMARY KEY (`tax_class_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

LOCK TABLES `tax_class` WRITE;
/*!40000 ALTER TABLE `tax_class` DISABLE KEYS */;

INSERT INTO `tax_class` (`tax_class_id`, `title`, `description`, `date_added`, `date_modified`)
VALUES
	(9,'Taxable Goods','Taxed goods','2009-01-06 23:21:53','2011-09-23 14:07:50'),
	(10,'Downloadable Products','Downloadable','2011-09-21 22:19:39','2011-09-22 10:27:36');

/*!40000 ALTER TABLE `tax_class` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table tax_rate
# ------------------------------------------------------------

DROP TABLE IF EXISTS `tax_rate`;

CREATE TABLE `tax_rate` (
  `tax_rate_id` int(11) NOT NULL AUTO_INCREMENT,
  `geo_zone_id` int(11) NOT NULL DEFAULT '0',
  `name` varchar(32) NOT NULL,
  `rate` decimal(15,4) NOT NULL DEFAULT '0.0000',
  `type` char(1) NOT NULL,
  `date_added` datetime NOT NULL,
  `date_modified` datetime NOT NULL,
  PRIMARY KEY (`tax_rate_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

LOCK TABLES `tax_rate` WRITE;
/*!40000 ALTER TABLE `tax_rate` DISABLE KEYS */;

INSERT INTO `tax_rate` (`tax_rate_id`, `geo_zone_id`, `name`, `rate`, `type`, `date_added`, `date_modified`)
VALUES
	(86,3,'VAT (20%)',20.0000,'P','2011-03-09 21:17:10','2011-09-22 22:24:29'),
	(87,3,'Eco Tax (-2.00)',2.0000,'F','2011-09-21 21:49:23','2011-09-23 00:40:19');

/*!40000 ALTER TABLE `tax_rate` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table tax_rate_to_customer_group
# ------------------------------------------------------------

DROP TABLE IF EXISTS `tax_rate_to_customer_group`;

CREATE TABLE `tax_rate_to_customer_group` (
  `tax_rate_id` int(11) NOT NULL,
  `customer_group_id` int(11) NOT NULL,
  PRIMARY KEY (`tax_rate_id`,`customer_group_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

LOCK TABLES `tax_rate_to_customer_group` WRITE;
/*!40000 ALTER TABLE `tax_rate_to_customer_group` DISABLE KEYS */;

INSERT INTO `tax_rate_to_customer_group` (`tax_rate_id`, `customer_group_id`)
VALUES
	(86,1),
	(87,1);

/*!40000 ALTER TABLE `tax_rate_to_customer_group` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table tax_rule
# ------------------------------------------------------------

DROP TABLE IF EXISTS `tax_rule`;

CREATE TABLE `tax_rule` (
  `tax_rule_id` int(11) NOT NULL AUTO_INCREMENT,
  `tax_class_id` int(11) NOT NULL,
  `tax_rate_id` int(11) NOT NULL,
  `based` varchar(10) NOT NULL,
  `priority` int(5) NOT NULL DEFAULT '1',
  PRIMARY KEY (`tax_rule_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

LOCK TABLES `tax_rule` WRITE;
/*!40000 ALTER TABLE `tax_rule` DISABLE KEYS */;

INSERT INTO `tax_rule` (`tax_rule_id`, `tax_class_id`, `tax_rate_id`, `based`, `priority`)
VALUES
	(121,10,86,'payment',1),
	(120,10,87,'store',0),
	(128,9,86,'shipping',1),
	(127,9,87,'shipping',2);

/*!40000 ALTER TABLE `tax_rule` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table theme
# ------------------------------------------------------------

DROP TABLE IF EXISTS `theme`;

CREATE TABLE `theme` (
  `theme_id` int(11) NOT NULL AUTO_INCREMENT,
  `store_id` int(11) NOT NULL,
  `theme` varchar(64) NOT NULL,
  `route` varchar(64) NOT NULL,
  `code` text NOT NULL,
  PRIMARY KEY (`theme_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;



# Dump of table translation
# ------------------------------------------------------------

DROP TABLE IF EXISTS `translation`;

CREATE TABLE `translation` (
  `translation_id` int(11) NOT NULL AUTO_INCREMENT,
  `store_id` int(11) NOT NULL,
  `language_id` int(11) NOT NULL,
  `route` varchar(64) NOT NULL,
  `key` varchar(64) NOT NULL,
  `value` text NOT NULL,
  PRIMARY KEY (`translation_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;



# Dump of table upload
# ------------------------------------------------------------

DROP TABLE IF EXISTS `upload`;

CREATE TABLE `upload` (
  `upload_id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `filename` varchar(255) NOT NULL,
  `code` varchar(255) NOT NULL,
  `date_added` datetime NOT NULL,
  PRIMARY KEY (`upload_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

LOCK TABLES `upload` WRITE;
/*!40000 ALTER TABLE `upload` DISABLE KEYS */;

INSERT INTO `upload` (`upload_id`, `name`, `filename`, `code`, `date_added`)
VALUES
	(1,'Git-Cheat-Sheet.png','Git-Cheat-Sheet.png.r4TmsCOXXpgHe5S7UZKhF6AWC34LxhMN','05eb482dd1dcbeaa1888a7e2b01864233c26efbe','2017-09-15 14:11:59');

/*!40000 ALTER TABLE `upload` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table url_alias
# ------------------------------------------------------------

DROP TABLE IF EXISTS `url_alias`;

CREATE TABLE `url_alias` (
  `url_alias_id` int(11) NOT NULL AUTO_INCREMENT,
  `query` varchar(255) NOT NULL,
  `keyword` varchar(255) NOT NULL,
  PRIMARY KEY (`url_alias_id`),
  KEY `query` (`query`),
  KEY `keyword` (`keyword`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

LOCK TABLES `url_alias` WRITE;
/*!40000 ALTER TABLE `url_alias` DISABLE KEYS */;

INSERT INTO `url_alias` (`url_alias_id`, `query`, `keyword`)
VALUES
	(824,'product_id=48','ipod-classic'),
	(933,'category_id=112','studs.html'),
	(934,'category_id=113','jhumka.html'),
	(730,'manufacturer_id=8','apple'),
	(772,'information_id=4','about_us'),
	(997,'product_id=42','test'),
	(1001,'category_id=110','mangalsutras.html'),
	(932,'category_id=111','watches.html'),
	(919,'category_id=98','rings.html'),
	(920,'category_id=99','pendants.html'),
	(921,'category_id=100','earrings.html'),
	(922,'category_id=101','necklaces.html'),
	(923,'category_id=102','bangles.html'),
	(924,'category_id=103','bracelets.html'),
	(925,'category_id=104','tanmaniyas.html'),
	(926,'category_id=105','nose-pins.html'),
	(927,'category_id=106','cuff-links.html'),
	(928,'category_id=107','chains.html'),
	(929,'category_id=108','anklets.html'),
	(930,'category_id=109','matching-sets.html'),
	(1000,'product_id=30','canon-eos-5d'),
	(999,'product_id=47','hp-lp3065'),
	(811,'product_id=28','htc-touch-hd'),
	(812,'product_id=43','macbook'),
	(813,'product_id=44','macbook-air'),
	(814,'product_id=45','macbook-pro'),
	(816,'product_id=31','nikon-d300'),
	(817,'product_id=29','palm-treo-pro'),
	(818,'product_id=35','product-8'),
	(819,'product_id=49','samsung-galaxy-tab-10-1'),
	(820,'product_id=33','samsung-syncmaster-941bw'),
	(821,'product_id=46','sony-vaio'),
	(837,'product_id=41','imac'),
	(823,'product_id=40','iphone'),
	(825,'product_id=36','ipod-nano'),
	(826,'product_id=34','ipod-shuffle'),
	(827,'product_id=32','ipod-touch'),
	(828,'manufacturer_id=9','canon'),
	(829,'manufacturer_id=5','htc'),
	(830,'manufacturer_id=7','hewlett-packard'),
	(831,'manufacturer_id=6','palm'),
	(832,'manufacturer_id=10','sony'),
	(841,'information_id=6','delivery'),
	(842,'information_id=3','privacy'),
	(843,'information_id=5','terms'),
	(935,'category_id=114','chandbali.html'),
	(937,'category_id=115','hoops.html'),
	(938,'category_id=116','alphabets.html'),
	(939,'category_id=117','fashion-pendants.html'),
	(940,'category_id=118','religious-pendants.html'),
	(941,'category_id=119','heart-pendants.html'),
	(942,'category_id=120','flower-pendants.html'),
	(943,'category_id=121','fashion-rings.html'),
	(944,'category_id=122','bridal-rings.html'),
	(945,'category_id=123','semi-mount-rings.html'),
	(946,'category_id=124','solitaire-rings.html'),
	(947,'category_id=125','twin-rings.html'),
	(948,'category_id=126','trio-rings.html'),
	(949,'category_id=127','ring-earring-pendant-set.html'),
	(950,'category_id=128','earring-pendant-set.html'),
	(951,'category_id=129','necklace-earring-ring-bangles-set.html'),
	(952,'category_id=130','necklace-earring-ring-set.html'),
	(953,'category_id=131','necklace-earring-set.html'),
	(956,'category_id=132','models.html'),
	(961,'category_id=133','ring-models.html'),
	(962,'category_id=134','pendant-models.html'),
	(960,'category_id=135','earring-models.html'),
	(959,'category_id=136','necklace-models.html'),
	(963,'category_id=137','bangles-models.html'),
	(964,'category_id=138','bracelet-models.html'),
	(965,'category_id=139','tanmaniya-models.html'),
	(966,'category_id=140','watch-models.html'),
	(967,'category_id=141','cufflink-models.html'),
	(968,'category_id=142','mangalsutra-models.html'),
	(969,'category_id=143','moulds.html'),
	(970,'category_id=144','packaging-displays.html'),
	(971,'category_id=145','tools-machinery.html'),
	(972,'category_id=146','used-machines.html'),
	(973,'category_id=147','books-catalogue.html'),
	(974,'category_id=148','books.html'),
	(975,'category_id=149','catalogue.html'),
	(976,'category_id=150','magazines.html'),
	(977,'category_id=151','freelance-services.html'),
	(978,'category_id=152','cam-processing.html'),
	(979,'category_id=153','raw-gold.html'),
	(980,'category_id=154','jewellery-institutes.html'),
	(981,'category_id=155','stones.html'),
	(982,'category_id=156','diamond-stones.html'),
	(983,'category_id=157','gem-stones.html'),
	(984,'category_id=158','american-diamond-stones.html'),
	(985,'category_id=159','pearl-stones.html'),
	(986,'category_id=160','rings-moulds.html'),
	(987,'category_id=161','earring-moulds.html'),
	(988,'category_id=162','pendant-moulds.html'),
	(989,'category_id=163','necklace-moulds.html'),
	(991,'category_id=164','bangles-moulds.html'),
	(992,'category_id=165','bracelet-moulds.html'),
	(993,'category_id=166','tanmaniya-moulds.html'),
	(994,'category_id=167','watch-moulds.html'),
	(995,'category_id=168','cufflink-moulds.html'),
	(996,'category_id=169','mangalsutra-moulds.html');

/*!40000 ALTER TABLE `url_alias` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table user
# ------------------------------------------------------------

DROP TABLE IF EXISTS `user`;

CREATE TABLE `user` (
  `user_id` int(11) NOT NULL AUTO_INCREMENT,
  `user_group_id` int(11) NOT NULL,
  `username` varchar(20) NOT NULL,
  `password` varchar(40) NOT NULL,
  `salt` varchar(9) NOT NULL,
  `firstname` varchar(32) NOT NULL,
  `lastname` varchar(32) NOT NULL,
  `email` varchar(96) NOT NULL,
  `image` varchar(255) NOT NULL,
  `code` varchar(40) NOT NULL,
  `ip` varchar(40) NOT NULL,
  `status` tinyint(1) NOT NULL,
  `date_added` datetime NOT NULL,
  PRIMARY KEY (`user_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;

INSERT INTO `user` (`user_id`, `user_group_id`, `username`, `password`, `salt`, `firstname`, `lastname`, `email`, `image`, `code`, `ip`, `status`, `date_added`)
VALUES
	(1,1,'admin','25aeecb2a5193fa37446c2ed52861d7e82b1f119','LeLsjjZrx','John','Doe','rohit@rohitbatra.in','','','127.0.0.1',1,'2017-06-29 23:05:01'),
	(4,2,'sezplus_mod','74197d159ebf00a17223d3ae48630682b42a1b20','Ra9W5i9S6','MOD','Test','support@sezplus.com','','','',1,'2017-07-23 14:09:17'),
	(7,11,'Dibyendu','0571f7a54590ac367393ee4765e499a8621a2883','GQmQ6HHBg','Dibyendu','Dhara','caddesignc@gmail.com','','','49.33.251.11',0,'2017-09-25 08:05:31'),
	(6,16,'rohit.batra99','dbb92e81c877f979eb649675eb1476e9ac6b4c74','x3O38wEfY','Rohit','Batra','rohit.rishi14@gmail.com','','','182.70.196.134',0,'2017-09-08 13:15:51');

/*!40000 ALTER TABLE `user` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table user_group
# ------------------------------------------------------------

DROP TABLE IF EXISTS `user_group`;

CREATE TABLE `user_group` (
  `user_group_id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(64) NOT NULL,
  `permission` text NOT NULL,
  `subscription_fees` float(11,2) NOT NULL DEFAULT '0.00' COMMENT 'Subscription Fees for Seller(s)',
  PRIMARY KEY (`user_group_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

LOCK TABLES `user_group` WRITE;
/*!40000 ALTER TABLE `user_group` DISABLE KEYS */;

INSERT INTO `user_group` (`user_group_id`, `name`, `permission`, `subscription_fees`)
VALUES
	(1,'Administrator','{\"access\":[\"catalog\\/attribute\",\"catalog\\/attribute_group\",\"catalog\\/category\",\"catalog\\/download\",\"catalog\\/filter\",\"catalog\\/information\",\"catalog\\/manufacturer\",\"catalog\\/mproduct\",\"catalog\\/option\",\"catalog\\/product\",\"catalog\\/recurring\",\"catalog\\/review\",\"common\\/column_left\",\"common\\/filemanager\",\"common\\/multifilemanager\",\"customer\\/custom_field\",\"customer\\/customer\",\"customer\\/customer_group\",\"design\\/banner\",\"design\\/language\",\"design\\/layout\",\"design\\/menu\",\"design\\/theme\",\"design\\/translation\",\"event\\/compatibility\",\"event\\/theme\",\"extension\\/analytics\\/google_analytics\",\"extension\\/captcha\\/basic_captcha\",\"extension\\/captcha\\/google_captcha\",\"extension\\/dashboard\\/activity\",\"extension\\/dashboard\\/chart\",\"extension\\/dashboard\\/customer\",\"extension\\/dashboard\\/map\",\"extension\\/dashboard\\/online\",\"extension\\/dashboard\\/order\",\"extension\\/dashboard\\/recent\",\"extension\\/dashboard\\/sale\",\"extension\\/dashboard\\/sellers\",\"extension\\/event\",\"extension\\/extension\",\"extension\\/extension\\/analytics\",\"extension\\/extension\\/captcha\",\"extension\\/extension\\/dashboard\",\"extension\\/extension\\/feed\",\"extension\\/extension\\/fraud\",\"extension\\/extension\\/module\",\"extension\\/extension\\/payment\",\"extension\\/extension\\/shipping\",\"extension\\/extension\\/theme\",\"extension\\/extension\\/total\",\"extension\\/feed\\/google_base\",\"extension\\/feed\\/google_sitemap\",\"extension\\/feed\\/openbaypro\",\"extension\\/fraud\\/fraudlabspro\",\"extension\\/fraud\\/ip\",\"extension\\/fraud\\/maxmind\",\"extension\\/installer\",\"extension\\/modification\",\"extension\\/modification_editor\",\"extension\\/module\\/account\",\"extension\\/module\\/affiliate\",\"extension\\/module\\/amazon_login\",\"extension\\/module\\/amazon_pay\",\"extension\\/module\\/banner\",\"extension\\/module\\/bestseller\",\"extension\\/module\\/carousel\",\"extension\\/module\\/category\",\"extension\\/module\\/divido_calculator\",\"extension\\/module\\/ebay_listing\",\"extension\\/module\\/featured\",\"extension\\/module\\/filter\",\"extension\\/module\\/google_hangouts\",\"extension\\/module\\/html\",\"extension\\/module\\/information\",\"extension\\/module\\/klarna_checkout_module\",\"extension\\/module\\/latest\",\"extension\\/module\\/laybuy_layout\",\"extension\\/module\\/pilibaba_button\",\"extension\\/module\\/pp_button\",\"extension\\/module\\/pp_login\",\"extension\\/module\\/sagepay_direct_cards\",\"extension\\/module\\/sagepay_server_cards\",\"extension\\/module\\/seller\",\"extension\\/module\\/simple_blog\",\"extension\\/module\\/simple_blog_category\",\"extension\\/module\\/slideshow\",\"extension\\/module\\/so_basic_products\",\"extension\\/module\\/so_category_slider\",\"extension\\/module\\/so_deals\",\"extension\\/module\\/so_extra_slider\",\"extension\\/module\\/so_filter_shop_by\",\"extension\\/module\\/so_home_slider\",\"extension\\/module\\/so_html_content\",\"extension\\/module\\/so_instagram_gallery\",\"extension\\/module\\/so_latest_blog\",\"extension\\/module\\/so_listing_tabs\",\"extension\\/module\\/so_megamenu\",\"extension\\/module\\/so_newletter_custom_popup\",\"extension\\/module\\/so_onepagecheckout\",\"extension\\/module\\/so_page_builder\",\"extension\\/module\\/so_popular_tags\",\"extension\\/module\\/so_product_label\",\"extension\\/module\\/so_quickview\",\"extension\\/module\\/so_searchpro\",\"extension\\/module\\/so_sociallogin\",\"extension\\/module\\/so_super_category\",\"extension\\/module\\/soconfig\",\"extension\\/module\\/soconfig_mobile\",\"extension\\/module\\/special\",\"extension\\/module\\/store\",\"extension\\/module\\/vqmod_manager\",\"extension\\/openbay\",\"extension\\/openbay\\/amazon\",\"extension\\/openbay\\/amazon_listing\",\"extension\\/openbay\\/amazon_product\",\"extension\\/openbay\\/amazonus\",\"extension\\/openbay\\/amazonus_listing\",\"extension\\/openbay\\/amazonus_product\",\"extension\\/openbay\\/ebay\",\"extension\\/openbay\\/ebay_profile\",\"extension\\/openbay\\/ebay_template\",\"extension\\/openbay\\/etsy\",\"extension\\/openbay\\/etsy_product\",\"extension\\/openbay\\/etsy_shipping\",\"extension\\/openbay\\/etsy_shop\",\"extension\\/openbay\\/fba\",\"extension\\/payment\\/amazon_login_pay\",\"extension\\/payment\\/authorizenet_aim\",\"extension\\/payment\\/authorizenet_sim\",\"extension\\/payment\\/bank_transfer\",\"extension\\/payment\\/bluepay_hosted\",\"extension\\/payment\\/bluepay_redirect\",\"extension\\/payment\\/cardconnect\",\"extension\\/payment\\/cardinity\",\"extension\\/payment\\/ccavenue\",\"extension\\/payment\\/cheque\",\"extension\\/payment\\/cod\",\"extension\\/payment\\/divido\",\"extension\\/payment\\/eway\",\"extension\\/payment\\/firstdata\",\"extension\\/payment\\/firstdata_remote\",\"extension\\/payment\\/free_checkout\",\"extension\\/payment\\/g2apay\",\"extension\\/payment\\/globalpay\",\"extension\\/payment\\/globalpay_remote\",\"extension\\/payment\\/klarna_account\",\"extension\\/payment\\/klarna_checkout\",\"extension\\/payment\\/klarna_invoice\",\"extension\\/payment\\/laybuy\",\"extension\\/payment\\/liqpay\",\"extension\\/payment\\/nochex\",\"extension\\/payment\\/paymate\",\"extension\\/payment\\/paypoint\",\"extension\\/payment\\/payza\",\"extension\\/payment\\/perpetual_payments\",\"extension\\/payment\\/pilibaba\",\"extension\\/payment\\/pp_express\",\"extension\\/payment\\/pp_payflow\",\"extension\\/payment\\/pp_payflow_iframe\",\"extension\\/payment\\/pp_pro\",\"extension\\/payment\\/pp_pro_iframe\",\"extension\\/payment\\/pp_standard\",\"extension\\/payment\\/realex\",\"extension\\/payment\\/realex_remote\",\"extension\\/payment\\/sagepay_direct\",\"extension\\/payment\\/sagepay_server\",\"extension\\/payment\\/sagepay_us\",\"extension\\/payment\\/securetrading_pp\",\"extension\\/payment\\/securetrading_ws\",\"extension\\/payment\\/skrill\",\"extension\\/payment\\/twocheckout\",\"extension\\/payment\\/web_payment_software\",\"extension\\/payment\\/worldpay\",\"extension\\/shipping\\/auspost\",\"extension\\/shipping\\/citylink\",\"extension\\/shipping\\/fedex\",\"extension\\/shipping\\/flat\",\"extension\\/shipping\\/free\",\"extension\\/shipping\\/item\",\"extension\\/shipping\\/parcelforce_48\",\"extension\\/shipping\\/pickup\",\"extension\\/shipping\\/royal_mail\",\"extension\\/shipping\\/ups\",\"extension\\/shipping\\/usps\",\"extension\\/shipping\\/weight\",\"extension\\/store\",\"extension\\/theme\\/theme_default\",\"extension\\/total\\/coupon\",\"extension\\/total\\/credit\",\"extension\\/total\\/handling\",\"extension\\/total\\/klarna_fee\",\"extension\\/total\\/low_order_fee\",\"extension\\/total\\/maintainance_fee\",\"extension\\/total\\/reward\",\"extension\\/total\\/shipping\",\"extension\\/total\\/sub_total\",\"extension\\/total\\/tax\",\"extension\\/total\\/total\",\"extension\\/total\\/voucher\",\"localisation\\/country\",\"localisation\\/currency\",\"localisation\\/geo_zone\",\"localisation\\/language\",\"localisation\\/length_class\",\"localisation\\/location\",\"localisation\\/order_status\",\"localisation\\/return_action\",\"localisation\\/return_reason\",\"localisation\\/return_status\",\"localisation\\/stock_status\",\"localisation\\/tax_class\",\"localisation\\/tax_rate\",\"localisation\\/weight_class\",\"localisation\\/zone\",\"marketing\\/affiliate\",\"marketing\\/contact\",\"marketing\\/coupon\",\"marketing\\/marketing\",\"report\\/affiliate\",\"report\\/affiliate_activity\",\"report\\/affiliate_login\",\"report\\/customer_activity\",\"report\\/customer_credit\",\"report\\/customer_login\",\"report\\/customer_online\",\"report\\/customer_order\",\"report\\/customer_reward\",\"report\\/customer_search\",\"report\\/marketing\",\"report\\/product_purchased\",\"report\\/product_viewed\",\"report\\/sale_coupon\",\"report\\/sale_order\",\"report\\/sale_return\",\"report\\/sale_shipping\",\"report\\/sale_tax\",\"sale\\/order\",\"sale\\/recurring\",\"sale\\/return\",\"sale\\/voucher\",\"sale\\/voucher_theme\",\"seller\\/seller\",\"setting\\/setting\",\"setting\\/store\",\"simple_blog\\/article\",\"simple_blog\\/author\",\"simple_blog\\/category\",\"simple_blog\\/comment\",\"simple_blog\\/install\",\"simple_blog\\/report\",\"startup\\/compatibility\",\"startup\\/error\",\"startup\\/event\",\"startup\\/login\",\"startup\\/permission\",\"startup\\/router\",\"startup\\/sass\",\"startup\\/startup\",\"tool\\/backup\",\"tool\\/log\",\"tool\\/upload\",\"user\\/api\",\"user\\/user\",\"user\\/user_permission\",\"extension\\/module\\/filter\"],\"modify\":[\"catalog\\/attribute\",\"catalog\\/attribute_group\",\"catalog\\/category\",\"catalog\\/download\",\"catalog\\/filter\",\"catalog\\/information\",\"catalog\\/manufacturer\",\"catalog\\/mproduct\",\"catalog\\/option\",\"catalog\\/product\",\"catalog\\/recurring\",\"catalog\\/review\",\"common\\/column_left\",\"common\\/filemanager\",\"common\\/multifilemanager\",\"customer\\/custom_field\",\"customer\\/customer\",\"customer\\/customer_group\",\"design\\/banner\",\"design\\/language\",\"design\\/layout\",\"design\\/menu\",\"design\\/theme\",\"design\\/translation\",\"event\\/compatibility\",\"event\\/theme\",\"extension\\/analytics\\/google_analytics\",\"extension\\/captcha\\/basic_captcha\",\"extension\\/captcha\\/google_captcha\",\"extension\\/dashboard\\/activity\",\"extension\\/dashboard\\/chart\",\"extension\\/dashboard\\/customer\",\"extension\\/dashboard\\/map\",\"extension\\/dashboard\\/online\",\"extension\\/dashboard\\/order\",\"extension\\/dashboard\\/recent\",\"extension\\/dashboard\\/sale\",\"extension\\/dashboard\\/sellers\",\"extension\\/event\",\"extension\\/extension\",\"extension\\/extension\\/analytics\",\"extension\\/extension\\/captcha\",\"extension\\/extension\\/dashboard\",\"extension\\/extension\\/feed\",\"extension\\/extension\\/fraud\",\"extension\\/extension\\/module\",\"extension\\/extension\\/payment\",\"extension\\/extension\\/shipping\",\"extension\\/extension\\/theme\",\"extension\\/extension\\/total\",\"extension\\/feed\\/google_base\",\"extension\\/feed\\/google_sitemap\",\"extension\\/feed\\/openbaypro\",\"extension\\/fraud\\/fraudlabspro\",\"extension\\/fraud\\/ip\",\"extension\\/fraud\\/maxmind\",\"extension\\/installer\",\"extension\\/modification\",\"extension\\/modification_editor\",\"extension\\/module\\/account\",\"extension\\/module\\/affiliate\",\"extension\\/module\\/amazon_login\",\"extension\\/module\\/amazon_pay\",\"extension\\/module\\/banner\",\"extension\\/module\\/bestseller\",\"extension\\/module\\/carousel\",\"extension\\/module\\/category\",\"extension\\/module\\/divido_calculator\",\"extension\\/module\\/ebay_listing\",\"extension\\/module\\/featured\",\"extension\\/module\\/filter\",\"extension\\/module\\/google_hangouts\",\"extension\\/module\\/html\",\"extension\\/module\\/information\",\"extension\\/module\\/klarna_checkout_module\",\"extension\\/module\\/latest\",\"extension\\/module\\/laybuy_layout\",\"extension\\/module\\/pilibaba_button\",\"extension\\/module\\/pp_button\",\"extension\\/module\\/pp_login\",\"extension\\/module\\/sagepay_direct_cards\",\"extension\\/module\\/sagepay_server_cards\",\"extension\\/module\\/seller\",\"extension\\/module\\/simple_blog\",\"extension\\/module\\/simple_blog_category\",\"extension\\/module\\/slideshow\",\"extension\\/module\\/so_basic_products\",\"extension\\/module\\/so_category_slider\",\"extension\\/module\\/so_deals\",\"extension\\/module\\/so_extra_slider\",\"extension\\/module\\/so_filter_shop_by\",\"extension\\/module\\/so_home_slider\",\"extension\\/module\\/so_html_content\",\"extension\\/module\\/so_instagram_gallery\",\"extension\\/module\\/so_latest_blog\",\"extension\\/module\\/so_listing_tabs\",\"extension\\/module\\/so_megamenu\",\"extension\\/module\\/so_newletter_custom_popup\",\"extension\\/module\\/so_onepagecheckout\",\"extension\\/module\\/so_page_builder\",\"extension\\/module\\/so_popular_tags\",\"extension\\/module\\/so_product_label\",\"extension\\/module\\/so_quickview\",\"extension\\/module\\/so_searchpro\",\"extension\\/module\\/so_sociallogin\",\"extension\\/module\\/so_super_category\",\"extension\\/module\\/soconfig\",\"extension\\/module\\/soconfig_mobile\",\"extension\\/module\\/special\",\"extension\\/module\\/store\",\"extension\\/module\\/vqmod_manager\",\"extension\\/openbay\",\"extension\\/openbay\\/amazon\",\"extension\\/openbay\\/amazon_listing\",\"extension\\/openbay\\/amazon_product\",\"extension\\/openbay\\/amazonus\",\"extension\\/openbay\\/amazonus_listing\",\"extension\\/openbay\\/amazonus_product\",\"extension\\/openbay\\/ebay\",\"extension\\/openbay\\/ebay_profile\",\"extension\\/openbay\\/ebay_template\",\"extension\\/openbay\\/etsy\",\"extension\\/openbay\\/etsy_product\",\"extension\\/openbay\\/etsy_shipping\",\"extension\\/openbay\\/etsy_shop\",\"extension\\/openbay\\/fba\",\"extension\\/payment\\/amazon_login_pay\",\"extension\\/payment\\/authorizenet_aim\",\"extension\\/payment\\/authorizenet_sim\",\"extension\\/payment\\/bank_transfer\",\"extension\\/payment\\/bluepay_hosted\",\"extension\\/payment\\/bluepay_redirect\",\"extension\\/payment\\/cardconnect\",\"extension\\/payment\\/cardinity\",\"extension\\/payment\\/ccavenue\",\"extension\\/payment\\/cheque\",\"extension\\/payment\\/cod\",\"extension\\/payment\\/divido\",\"extension\\/payment\\/eway\",\"extension\\/payment\\/firstdata\",\"extension\\/payment\\/firstdata_remote\",\"extension\\/payment\\/free_checkout\",\"extension\\/payment\\/g2apay\",\"extension\\/payment\\/globalpay\",\"extension\\/payment\\/globalpay_remote\",\"extension\\/payment\\/klarna_account\",\"extension\\/payment\\/klarna_checkout\",\"extension\\/payment\\/klarna_invoice\",\"extension\\/payment\\/laybuy\",\"extension\\/payment\\/liqpay\",\"extension\\/payment\\/nochex\",\"extension\\/payment\\/paymate\",\"extension\\/payment\\/paypoint\",\"extension\\/payment\\/payza\",\"extension\\/payment\\/perpetual_payments\",\"extension\\/payment\\/pilibaba\",\"extension\\/payment\\/pp_express\",\"extension\\/payment\\/pp_payflow\",\"extension\\/payment\\/pp_payflow_iframe\",\"extension\\/payment\\/pp_pro\",\"extension\\/payment\\/pp_pro_iframe\",\"extension\\/payment\\/pp_standard\",\"extension\\/payment\\/realex\",\"extension\\/payment\\/realex_remote\",\"extension\\/payment\\/sagepay_direct\",\"extension\\/payment\\/sagepay_server\",\"extension\\/payment\\/sagepay_us\",\"extension\\/payment\\/securetrading_pp\",\"extension\\/payment\\/securetrading_ws\",\"extension\\/payment\\/skrill\",\"extension\\/payment\\/twocheckout\",\"extension\\/payment\\/web_payment_software\",\"extension\\/payment\\/worldpay\",\"extension\\/shipping\\/auspost\",\"extension\\/shipping\\/citylink\",\"extension\\/shipping\\/fedex\",\"extension\\/shipping\\/flat\",\"extension\\/shipping\\/free\",\"extension\\/shipping\\/item\",\"extension\\/shipping\\/parcelforce_48\",\"extension\\/shipping\\/pickup\",\"extension\\/shipping\\/royal_mail\",\"extension\\/shipping\\/ups\",\"extension\\/shipping\\/usps\",\"extension\\/shipping\\/weight\",\"extension\\/store\",\"extension\\/theme\\/theme_default\",\"extension\\/total\\/coupon\",\"extension\\/total\\/credit\",\"extension\\/total\\/handling\",\"extension\\/total\\/klarna_fee\",\"extension\\/total\\/low_order_fee\",\"extension\\/total\\/maintainance_fee\",\"extension\\/total\\/reward\",\"extension\\/total\\/shipping\",\"extension\\/total\\/sub_total\",\"extension\\/total\\/tax\",\"extension\\/total\\/total\",\"extension\\/total\\/voucher\",\"localisation\\/country\",\"localisation\\/currency\",\"localisation\\/geo_zone\",\"localisation\\/language\",\"localisation\\/length_class\",\"localisation\\/location\",\"localisation\\/order_status\",\"localisation\\/return_action\",\"localisation\\/return_reason\",\"localisation\\/return_status\",\"localisation\\/stock_status\",\"localisation\\/tax_class\",\"localisation\\/tax_rate\",\"localisation\\/weight_class\",\"localisation\\/zone\",\"marketing\\/affiliate\",\"marketing\\/contact\",\"marketing\\/coupon\",\"marketing\\/marketing\",\"report\\/affiliate\",\"report\\/affiliate_activity\",\"report\\/affiliate_login\",\"report\\/customer_activity\",\"report\\/customer_credit\",\"report\\/customer_login\",\"report\\/customer_online\",\"report\\/customer_order\",\"report\\/customer_reward\",\"report\\/customer_search\",\"report\\/marketing\",\"report\\/product_purchased\",\"report\\/product_viewed\",\"report\\/sale_coupon\",\"report\\/sale_order\",\"report\\/sale_return\",\"report\\/sale_shipping\",\"report\\/sale_tax\",\"sale\\/order\",\"sale\\/recurring\",\"sale\\/return\",\"sale\\/voucher\",\"sale\\/voucher_theme\",\"seller\\/seller\",\"setting\\/setting\",\"setting\\/store\",\"simple_blog\\/article\",\"simple_blog\\/author\",\"simple_blog\\/category\",\"simple_blog\\/comment\",\"simple_blog\\/install\",\"simple_blog\\/report\",\"startup\\/compatibility\",\"startup\\/error\",\"startup\\/event\",\"startup\\/login\",\"startup\\/permission\",\"startup\\/router\",\"startup\\/sass\",\"startup\\/startup\",\"tool\\/backup\",\"tool\\/log\",\"tool\\/upload\",\"user\\/api\",\"user\\/user\",\"user\\/user_permission\",\"extension\\/module\\/filter\"]}',0.00),
	(11,'Manufacturer','{\"access\":[\"catalog\\/attribute\",\"catalog\\/category\",\"catalog\\/download\",\"catalog\\/filter\",\"catalog\\/mproduct\",\"catalog\\/option\",\"catalog\\/product\",\"common\\/filemanager\",\"extension\\/dashboard\\/activity\",\"extension\\/dashboard\\/order\",\"extension\\/dashboard\\/recent\",\"extension\\/dashboard\\/sale\",\"extension\\/extension\\/dashboard\",\"sale\\/order\"],\"modify\":[\"catalog\\/download\",\"catalog\\/mproduct\",\"catalog\\/product\",\"common\\/filemanager\",\"extension\\/dashboard\\/activity\",\"extension\\/dashboard\\/order\",\"extension\\/dashboard\\/recent\",\"extension\\/dashboard\\/sale\",\"extension\\/extension\\/dashboard\",\"sale\\/order\"]}',117.85),
	(12,'Wholeseller','{\"access\":[\"catalog\\/attribute\",\"catalog\\/category\",\"catalog\\/download\",\"catalog\\/filter\",\"catalog\\/mproduct\",\"catalog\\/option\",\"catalog\\/product\",\"common\\/filemanager\",\"extension\\/dashboard\\/activity\",\"extension\\/dashboard\\/order\",\"extension\\/dashboard\\/recent\",\"extension\\/dashboard\\/sale\",\"extension\\/extension\\/dashboard\",\"sale\\/order\"],\"modify\":[\"catalog\\/download\",\"catalog\\/mproduct\",\"catalog\\/product\",\"common\\/filemanager\",\"extension\\/dashboard\\/activity\",\"extension\\/dashboard\\/order\",\"extension\\/dashboard\\/recent\",\"extension\\/dashboard\\/sale\",\"extension\\/extension\\/dashboard\",\"sale\\/order\"]}',50.10),
	(13,'Retailer','{\"access\":[\"catalog\\/attribute\",\"catalog\\/category\",\"catalog\\/download\",\"catalog\\/filter\",\"catalog\\/mproduct\",\"catalog\\/option\",\"catalog\\/product\",\"common\\/filemanager\",\"extension\\/dashboard\\/activity\",\"extension\\/dashboard\\/order\",\"extension\\/dashboard\\/recent\",\"extension\\/dashboard\\/sale\",\"extension\\/extension\\/dashboard\",\"sale\\/order\"],\"modify\":[\"catalog\\/download\",\"catalog\\/mproduct\",\"catalog\\/product\",\"common\\/filemanager\",\"extension\\/dashboard\\/activity\",\"extension\\/dashboard\\/order\",\"extension\\/dashboard\\/recent\",\"extension\\/dashboard\\/sale\",\"extension\\/extension\\/dashboard\",\"sale\\/order\"]}',350.60),
	(23,'Service','{\"access\":[\"catalog\\/attribute\",\"catalog\\/attribute_group\",\"catalog\\/category\",\"catalog\\/download\",\"catalog\\/filter\",\"catalog\\/information\",\"catalog\\/manufacturer\",\"catalog\\/mproduct\",\"catalog\\/option\",\"catalog\\/product\",\"catalog\\/recurring\",\"catalog\\/review\",\"common\\/column_left\",\"common\\/filemanager\",\"common\\/multifilemanager\",\"customer\\/custom_field\",\"customer\\/customer\",\"customer\\/customer_group\",\"design\\/banner\",\"design\\/language\",\"design\\/layout\",\"design\\/menu\",\"design\\/theme\",\"design\\/translation\",\"event\\/compatibility\",\"event\\/theme\",\"extension\\/analytics\\/google_analytics\",\"extension\\/captcha\\/basic_captcha\",\"extension\\/captcha\\/google_captcha\",\"extension\\/dashboard\\/activity\",\"extension\\/dashboard\\/chart\",\"extension\\/dashboard\\/customer\",\"extension\\/dashboard\\/map\",\"extension\\/dashboard\\/online\",\"extension\\/dashboard\\/order\",\"extension\\/dashboard\\/recent\",\"extension\\/dashboard\\/sale\",\"extension\\/dashboard\\/sellers\",\"extension\\/event\",\"extension\\/extension\",\"extension\\/extension\\/analytics\",\"extension\\/extension\\/captcha\",\"extension\\/extension\\/dashboard\",\"extension\\/extension\\/feed\",\"extension\\/extension\\/fraud\",\"extension\\/extension\\/module\",\"extension\\/extension\\/payment\",\"extension\\/extension\\/shipping\",\"extension\\/extension\\/theme\",\"extension\\/extension\\/total\",\"extension\\/feed\\/google_base\",\"extension\\/feed\\/google_sitemap\",\"extension\\/feed\\/openbaypro\",\"extension\\/fraud\\/fraudlabspro\",\"extension\\/fraud\\/ip\",\"extension\\/fraud\\/maxmind\",\"extension\\/installer\",\"extension\\/modification\",\"extension\\/modification_editor\",\"extension\\/module\\/account\",\"extension\\/module\\/affiliate\",\"extension\\/module\\/amazon_login\",\"extension\\/module\\/amazon_pay\",\"extension\\/module\\/banner\",\"extension\\/module\\/bestseller\",\"extension\\/module\\/carousel\",\"extension\\/module\\/category\",\"extension\\/module\\/divido_calculator\",\"extension\\/module\\/ebay_listing\",\"extension\\/module\\/featured\",\"extension\\/module\\/filter\",\"extension\\/module\\/google_hangouts\",\"extension\\/module\\/html\",\"extension\\/module\\/information\",\"extension\\/module\\/klarna_checkout_module\",\"extension\\/module\\/latest\",\"extension\\/module\\/laybuy_layout\",\"extension\\/module\\/pilibaba_button\",\"extension\\/module\\/pp_button\",\"extension\\/module\\/pp_login\",\"extension\\/module\\/sagepay_direct_cards\",\"extension\\/module\\/sagepay_server_cards\",\"extension\\/module\\/seller\",\"extension\\/module\\/simple_blog\",\"extension\\/module\\/simple_blog_category\",\"extension\\/module\\/slideshow\",\"extension\\/module\\/so_basic_products\",\"extension\\/module\\/so_category_slider\",\"extension\\/module\\/so_deals\",\"extension\\/module\\/so_extra_slider\",\"extension\\/module\\/so_filter_shop_by\",\"extension\\/module\\/so_home_slider\",\"extension\\/module\\/so_html_content\",\"extension\\/module\\/so_instagram_gallery\",\"extension\\/module\\/so_latest_blog\",\"extension\\/module\\/so_listing_tabs\",\"extension\\/module\\/so_megamenu\",\"extension\\/module\\/so_newletter_custom_popup\",\"extension\\/module\\/so_onepagecheckout\",\"extension\\/module\\/so_page_builder\",\"extension\\/module\\/so_popular_tags\",\"extension\\/module\\/so_product_label\",\"extension\\/module\\/so_quickview\",\"extension\\/module\\/so_searchpro\",\"extension\\/module\\/so_sociallogin\",\"extension\\/module\\/so_super_category\",\"extension\\/module\\/soconfig\",\"extension\\/module\\/soconfig_mobile\",\"extension\\/module\\/special\",\"extension\\/module\\/store\",\"extension\\/module\\/vqmod_manager\",\"extension\\/openbay\",\"extension\\/openbay\\/amazon\",\"extension\\/openbay\\/amazon_listing\",\"extension\\/openbay\\/amazon_product\",\"extension\\/openbay\\/amazonus\",\"extension\\/openbay\\/amazonus_listing\",\"extension\\/openbay\\/amazonus_product\",\"extension\\/openbay\\/ebay\",\"extension\\/openbay\\/ebay_profile\",\"extension\\/openbay\\/ebay_template\",\"extension\\/openbay\\/etsy\",\"extension\\/openbay\\/etsy_product\",\"extension\\/openbay\\/etsy_shipping\",\"extension\\/openbay\\/etsy_shop\",\"extension\\/openbay\\/fba\",\"extension\\/payment\\/amazon_login_pay\",\"extension\\/payment\\/authorizenet_aim\",\"extension\\/payment\\/authorizenet_sim\",\"extension\\/payment\\/bank_transfer\",\"extension\\/payment\\/bluepay_hosted\",\"extension\\/payment\\/bluepay_redirect\",\"extension\\/payment\\/cardconnect\",\"extension\\/payment\\/cardinity\",\"extension\\/payment\\/ccavenue\",\"extension\\/payment\\/cheque\",\"extension\\/payment\\/cod\",\"extension\\/payment\\/divido\",\"extension\\/payment\\/eway\",\"extension\\/payment\\/firstdata\",\"extension\\/payment\\/firstdata_remote\",\"extension\\/payment\\/free_checkout\",\"extension\\/payment\\/g2apay\",\"extension\\/payment\\/globalpay\",\"extension\\/payment\\/globalpay_remote\",\"extension\\/payment\\/klarna_account\",\"extension\\/payment\\/klarna_checkout\",\"extension\\/payment\\/klarna_invoice\",\"extension\\/payment\\/laybuy\",\"extension\\/payment\\/liqpay\",\"extension\\/payment\\/nochex\",\"extension\\/payment\\/paymate\",\"extension\\/payment\\/paypoint\",\"extension\\/payment\\/payza\",\"extension\\/payment\\/perpetual_payments\",\"extension\\/payment\\/pilibaba\",\"extension\\/payment\\/pp_express\",\"extension\\/payment\\/pp_payflow\",\"extension\\/payment\\/pp_payflow_iframe\",\"extension\\/payment\\/pp_pro\",\"extension\\/payment\\/pp_pro_iframe\",\"extension\\/payment\\/pp_standard\",\"extension\\/payment\\/realex\",\"extension\\/payment\\/realex_remote\",\"extension\\/payment\\/sagepay_direct\",\"extension\\/payment\\/sagepay_server\",\"extension\\/payment\\/sagepay_us\",\"extension\\/payment\\/securetrading_pp\",\"extension\\/payment\\/securetrading_ws\",\"extension\\/payment\\/skrill\",\"extension\\/payment\\/twocheckout\",\"extension\\/payment\\/web_payment_software\",\"extension\\/payment\\/worldpay\",\"extension\\/shipping\\/auspost\",\"extension\\/shipping\\/citylink\",\"extension\\/shipping\\/fedex\",\"extension\\/shipping\\/flat\",\"extension\\/shipping\\/free\",\"extension\\/shipping\\/item\",\"extension\\/shipping\\/parcelforce_48\",\"extension\\/shipping\\/pickup\",\"extension\\/shipping\\/royal_mail\",\"extension\\/shipping\\/ups\",\"extension\\/shipping\\/usps\",\"extension\\/shipping\\/weight\",\"extension\\/store\",\"extension\\/theme\\/theme_default\",\"extension\\/total\\/coupon\",\"extension\\/total\\/credit\",\"extension\\/total\\/handling\",\"extension\\/total\\/klarna_fee\",\"extension\\/total\\/low_order_fee\",\"extension\\/total\\/maintainance_fee\",\"extension\\/total\\/reward\",\"extension\\/total\\/shipping\",\"extension\\/total\\/sub_total\",\"extension\\/total\\/tax\",\"extension\\/total\\/total\",\"extension\\/total\\/voucher\",\"localisation\\/country\",\"localisation\\/currency\",\"localisation\\/geo_zone\",\"localisation\\/language\",\"localisation\\/length_class\",\"localisation\\/location\",\"localisation\\/order_status\",\"localisation\\/return_action\",\"localisation\\/return_reason\",\"localisation\\/return_status\",\"localisation\\/stock_status\",\"localisation\\/tax_class\",\"localisation\\/tax_rate\",\"localisation\\/weight_class\",\"localisation\\/zone\",\"marketing\\/affiliate\",\"marketing\\/contact\",\"marketing\\/coupon\",\"marketing\\/marketing\",\"report\\/affiliate\",\"report\\/affiliate_activity\",\"report\\/affiliate_login\",\"report\\/customer_activity\",\"report\\/customer_credit\",\"report\\/customer_login\",\"report\\/customer_online\",\"report\\/customer_order\",\"report\\/customer_reward\",\"report\\/customer_search\",\"report\\/marketing\",\"report\\/product_purchased\",\"report\\/product_viewed\",\"report\\/sale_coupon\",\"report\\/sale_order\",\"report\\/sale_return\",\"report\\/sale_shipping\",\"report\\/sale_tax\",\"sale\\/order\",\"sale\\/recurring\",\"sale\\/return\",\"sale\\/voucher\",\"sale\\/voucher_theme\",\"seller\\/seller\",\"setting\\/setting\",\"setting\\/store\",\"simple_blog\\/article\",\"simple_blog\\/author\",\"simple_blog\\/category\",\"simple_blog\\/comment\",\"simple_blog\\/install\",\"simple_blog\\/report\",\"startup\\/compatibility\",\"startup\\/error\",\"startup\\/event\",\"startup\\/login\",\"startup\\/permission\",\"startup\\/router\",\"startup\\/sass\",\"startup\\/startup\",\"tool\\/backup\",\"tool\\/log\",\"tool\\/upload\",\"user\\/api\",\"user\\/user\",\"user\\/user_permission\"],\"modify\":[\"catalog\\/attribute\",\"catalog\\/attribute_group\",\"catalog\\/category\",\"catalog\\/download\",\"catalog\\/filter\",\"catalog\\/information\",\"catalog\\/manufacturer\",\"catalog\\/mproduct\",\"catalog\\/option\",\"catalog\\/product\",\"catalog\\/recurring\",\"catalog\\/review\",\"common\\/column_left\",\"common\\/filemanager\",\"common\\/multifilemanager\",\"customer\\/custom_field\",\"customer\\/customer\",\"customer\\/customer_group\",\"design\\/banner\",\"design\\/language\",\"design\\/layout\",\"design\\/menu\",\"design\\/theme\",\"design\\/translation\",\"event\\/compatibility\",\"event\\/theme\",\"extension\\/analytics\\/google_analytics\",\"extension\\/captcha\\/basic_captcha\",\"extension\\/captcha\\/google_captcha\",\"extension\\/dashboard\\/activity\",\"extension\\/dashboard\\/chart\",\"extension\\/dashboard\\/customer\",\"extension\\/dashboard\\/map\",\"extension\\/dashboard\\/online\",\"extension\\/dashboard\\/order\",\"extension\\/dashboard\\/recent\",\"extension\\/dashboard\\/sale\",\"extension\\/dashboard\\/sellers\",\"extension\\/event\",\"extension\\/extension\",\"extension\\/extension\\/analytics\",\"extension\\/extension\\/captcha\",\"extension\\/extension\\/dashboard\",\"extension\\/extension\\/feed\",\"extension\\/extension\\/fraud\",\"extension\\/extension\\/module\",\"extension\\/extension\\/payment\",\"extension\\/extension\\/shipping\",\"extension\\/extension\\/theme\",\"extension\\/extension\\/total\",\"extension\\/feed\\/google_base\",\"extension\\/feed\\/google_sitemap\",\"extension\\/feed\\/openbaypro\",\"extension\\/fraud\\/fraudlabspro\",\"extension\\/fraud\\/ip\",\"extension\\/fraud\\/maxmind\",\"extension\\/installer\",\"extension\\/modification\",\"extension\\/modification_editor\",\"extension\\/module\\/account\",\"extension\\/module\\/affiliate\",\"extension\\/module\\/amazon_login\",\"extension\\/module\\/amazon_pay\",\"extension\\/module\\/banner\",\"extension\\/module\\/bestseller\",\"extension\\/module\\/carousel\",\"extension\\/module\\/category\",\"extension\\/module\\/divido_calculator\",\"extension\\/module\\/ebay_listing\",\"extension\\/module\\/featured\",\"extension\\/module\\/filter\",\"extension\\/module\\/google_hangouts\",\"extension\\/module\\/html\",\"extension\\/module\\/information\",\"extension\\/module\\/klarna_checkout_module\",\"extension\\/module\\/latest\",\"extension\\/module\\/laybuy_layout\",\"extension\\/module\\/pilibaba_button\",\"extension\\/module\\/pp_button\",\"extension\\/module\\/pp_login\",\"extension\\/module\\/sagepay_direct_cards\",\"extension\\/module\\/sagepay_server_cards\",\"extension\\/module\\/seller\",\"extension\\/module\\/simple_blog\",\"extension\\/module\\/simple_blog_category\",\"extension\\/module\\/slideshow\",\"extension\\/module\\/so_basic_products\",\"extension\\/module\\/so_category_slider\",\"extension\\/module\\/so_deals\",\"extension\\/module\\/so_extra_slider\",\"extension\\/module\\/so_filter_shop_by\",\"extension\\/module\\/so_home_slider\",\"extension\\/module\\/so_html_content\",\"extension\\/module\\/so_instagram_gallery\",\"extension\\/module\\/so_latest_blog\",\"extension\\/module\\/so_listing_tabs\",\"extension\\/module\\/so_megamenu\",\"extension\\/module\\/so_newletter_custom_popup\",\"extension\\/module\\/so_onepagecheckout\",\"extension\\/module\\/so_page_builder\",\"extension\\/module\\/so_popular_tags\",\"extension\\/module\\/so_product_label\",\"extension\\/module\\/so_quickview\",\"extension\\/module\\/so_searchpro\",\"extension\\/module\\/so_sociallogin\",\"extension\\/module\\/so_super_category\",\"extension\\/module\\/soconfig\",\"extension\\/module\\/soconfig_mobile\",\"extension\\/module\\/special\",\"extension\\/module\\/store\",\"extension\\/module\\/vqmod_manager\",\"extension\\/openbay\",\"extension\\/openbay\\/amazon\",\"extension\\/openbay\\/amazon_listing\",\"extension\\/openbay\\/amazon_product\",\"extension\\/openbay\\/amazonus\",\"extension\\/openbay\\/amazonus_listing\",\"extension\\/openbay\\/amazonus_product\",\"extension\\/openbay\\/ebay\",\"extension\\/openbay\\/ebay_profile\",\"extension\\/openbay\\/ebay_template\",\"extension\\/openbay\\/etsy\",\"extension\\/openbay\\/etsy_product\",\"extension\\/openbay\\/etsy_shipping\",\"extension\\/openbay\\/etsy_shop\",\"extension\\/openbay\\/fba\",\"extension\\/payment\\/amazon_login_pay\",\"extension\\/payment\\/authorizenet_aim\",\"extension\\/payment\\/authorizenet_sim\",\"extension\\/payment\\/bank_transfer\",\"extension\\/payment\\/bluepay_hosted\",\"extension\\/payment\\/bluepay_redirect\",\"extension\\/payment\\/cardconnect\",\"extension\\/payment\\/cardinity\",\"extension\\/payment\\/ccavenue\",\"extension\\/payment\\/cheque\",\"extension\\/payment\\/cod\",\"extension\\/payment\\/divido\",\"extension\\/payment\\/eway\",\"extension\\/payment\\/firstdata\",\"extension\\/payment\\/firstdata_remote\",\"extension\\/payment\\/free_checkout\",\"extension\\/payment\\/g2apay\",\"extension\\/payment\\/globalpay\",\"extension\\/payment\\/globalpay_remote\",\"extension\\/payment\\/klarna_account\",\"extension\\/payment\\/klarna_checkout\",\"extension\\/payment\\/klarna_invoice\",\"extension\\/payment\\/laybuy\",\"extension\\/payment\\/liqpay\",\"extension\\/payment\\/nochex\",\"extension\\/payment\\/paymate\",\"extension\\/payment\\/paypoint\",\"extension\\/payment\\/payza\",\"extension\\/payment\\/perpetual_payments\",\"extension\\/payment\\/pilibaba\",\"extension\\/payment\\/pp_express\",\"extension\\/payment\\/pp_payflow\",\"extension\\/payment\\/pp_payflow_iframe\",\"extension\\/payment\\/pp_pro\",\"extension\\/payment\\/pp_pro_iframe\",\"extension\\/payment\\/pp_standard\",\"extension\\/payment\\/realex\",\"extension\\/payment\\/realex_remote\",\"extension\\/payment\\/sagepay_direct\",\"extension\\/payment\\/sagepay_server\",\"extension\\/payment\\/sagepay_us\",\"extension\\/payment\\/securetrading_pp\",\"extension\\/payment\\/securetrading_ws\",\"extension\\/payment\\/skrill\",\"extension\\/payment\\/twocheckout\",\"extension\\/payment\\/web_payment_software\",\"extension\\/payment\\/worldpay\",\"extension\\/shipping\\/auspost\",\"extension\\/shipping\\/citylink\",\"extension\\/shipping\\/fedex\",\"extension\\/shipping\\/flat\",\"extension\\/shipping\\/free\",\"extension\\/shipping\\/item\",\"extension\\/shipping\\/parcelforce_48\",\"extension\\/shipping\\/pickup\",\"extension\\/shipping\\/royal_mail\",\"extension\\/shipping\\/ups\",\"extension\\/shipping\\/usps\",\"extension\\/shipping\\/weight\",\"extension\\/store\",\"extension\\/theme\\/theme_default\",\"extension\\/total\\/coupon\",\"extension\\/total\\/credit\",\"extension\\/total\\/handling\",\"extension\\/total\\/klarna_fee\",\"extension\\/total\\/low_order_fee\",\"extension\\/total\\/maintainance_fee\",\"extension\\/total\\/reward\",\"extension\\/total\\/shipping\",\"extension\\/total\\/sub_total\",\"extension\\/total\\/tax\",\"extension\\/total\\/total\",\"extension\\/total\\/voucher\",\"localisation\\/country\",\"localisation\\/currency\",\"localisation\\/geo_zone\",\"localisation\\/language\",\"localisation\\/length_class\",\"localisation\\/location\",\"localisation\\/order_status\",\"localisation\\/return_action\",\"localisation\\/return_reason\",\"localisation\\/return_status\",\"localisation\\/stock_status\",\"localisation\\/tax_class\",\"localisation\\/tax_rate\",\"localisation\\/weight_class\",\"localisation\\/zone\",\"marketing\\/affiliate\",\"marketing\\/contact\",\"marketing\\/coupon\",\"marketing\\/marketing\",\"report\\/affiliate\",\"report\\/affiliate_activity\",\"report\\/affiliate_login\",\"report\\/customer_activity\",\"report\\/customer_credit\",\"report\\/customer_login\",\"report\\/customer_online\",\"report\\/customer_order\",\"report\\/customer_reward\",\"report\\/customer_search\",\"report\\/marketing\",\"report\\/product_purchased\",\"report\\/product_viewed\",\"report\\/sale_coupon\",\"report\\/sale_order\",\"report\\/sale_return\",\"report\\/sale_shipping\",\"report\\/sale_tax\",\"sale\\/order\",\"sale\\/recurring\",\"sale\\/return\",\"sale\\/voucher\",\"sale\\/voucher_theme\",\"seller\\/seller\",\"setting\\/setting\",\"setting\\/store\",\"simple_blog\\/article\",\"simple_blog\\/author\",\"simple_blog\\/category\",\"simple_blog\\/comment\",\"simple_blog\\/install\",\"simple_blog\\/report\",\"startup\\/compatibility\",\"startup\\/error\",\"startup\\/event\",\"startup\\/login\",\"startup\\/permission\",\"startup\\/router\",\"startup\\/sass\",\"startup\\/startup\",\"tool\\/backup\",\"tool\\/log\",\"tool\\/upload\",\"user\\/api\",\"user\\/user\",\"user\\/user_permission\"]}',10.00),
	(2,'Moderator','{\"access\":[\"catalog\\/attribute\",\"catalog\\/attribute_group\",\"catalog\\/category\",\"catalog\\/download\",\"catalog\\/filter\",\"catalog\\/information\",\"catalog\\/manufacturer\",\"catalog\\/mproduct\",\"catalog\\/option\",\"catalog\\/product\",\"catalog\\/recurring\",\"catalog\\/review\",\"common\\/column_left\",\"common\\/filemanager\",\"customer\\/custom_field\",\"customer\\/customer\",\"customer\\/customer_group\",\"design\\/banner\",\"design\\/language\",\"design\\/layout\",\"design\\/menu\",\"design\\/theme\",\"design\\/translation\",\"event\\/compatibility\",\"event\\/theme\",\"extension\\/analytics\\/google_analytics\",\"extension\\/captcha\\/basic_captcha\",\"extension\\/captcha\\/google_captcha\",\"extension\\/dashboard\\/activity\",\"extension\\/dashboard\\/chart\",\"extension\\/dashboard\\/customer\",\"extension\\/dashboard\\/map\",\"extension\\/dashboard\\/online\",\"extension\\/dashboard\\/order\",\"extension\\/dashboard\\/recent\",\"extension\\/dashboard\\/sale\",\"extension\\/event\",\"extension\\/extension\",\"extension\\/extension\\/analytics\",\"extension\\/extension\\/captcha\",\"extension\\/extension\\/dashboard\",\"extension\\/extension\\/feed\",\"extension\\/extension\\/fraud\",\"extension\\/extension\\/module\",\"extension\\/extension\\/payment\",\"extension\\/extension\\/shipping\",\"extension\\/extension\\/theme\",\"extension\\/extension\\/total\",\"extension\\/feed\\/google_base\",\"extension\\/feed\\/google_sitemap\",\"extension\\/feed\\/openbaypro\",\"extension\\/fraud\\/fraudlabspro\",\"extension\\/fraud\\/ip\",\"extension\\/fraud\\/maxmind\",\"extension\\/installer\",\"extension\\/modification\",\"extension\\/modification_editor\",\"extension\\/module\\/account\",\"extension\\/module\\/affiliate\",\"extension\\/module\\/amazon_login\",\"extension\\/module\\/amazon_pay\",\"extension\\/module\\/banner\",\"extension\\/module\\/bestseller\",\"extension\\/module\\/carousel\",\"extension\\/module\\/category\",\"extension\\/module\\/divido_calculator\",\"extension\\/module\\/ebay_listing\",\"extension\\/module\\/featured\",\"extension\\/module\\/filter\",\"extension\\/module\\/google_hangouts\",\"extension\\/module\\/html\",\"extension\\/module\\/information\",\"extension\\/module\\/klarna_checkout_module\",\"extension\\/module\\/latest\",\"extension\\/module\\/laybuy_layout\",\"extension\\/module\\/pilibaba_button\",\"extension\\/module\\/pp_button\",\"extension\\/module\\/pp_login\",\"extension\\/module\\/sagepay_direct_cards\",\"extension\\/module\\/sagepay_server_cards\",\"extension\\/module\\/simple_blog\",\"extension\\/module\\/simple_blog_category\",\"extension\\/module\\/slideshow\",\"extension\\/module\\/so_basic_products\",\"extension\\/module\\/so_category_slider\",\"extension\\/module\\/so_deals\",\"extension\\/module\\/so_extra_slider\",\"extension\\/module\\/so_filter_shop_by\",\"extension\\/module\\/so_home_slider\",\"extension\\/module\\/so_html_content\",\"extension\\/module\\/so_instagram_gallery\",\"extension\\/module\\/so_latest_blog\",\"extension\\/module\\/so_listing_tabs\",\"extension\\/module\\/so_megamenu\",\"extension\\/module\\/so_newletter_custom_popup\",\"extension\\/module\\/so_onepagecheckout\",\"extension\\/module\\/so_page_builder\",\"extension\\/module\\/so_popular_tags\",\"extension\\/module\\/so_product_label\",\"extension\\/module\\/so_quickview\",\"extension\\/module\\/so_searchpro\",\"extension\\/module\\/so_sociallogin\",\"extension\\/module\\/so_super_category\",\"extension\\/module\\/soconfig\",\"extension\\/module\\/soconfig_mobile\",\"extension\\/module\\/special\",\"extension\\/module\\/store\",\"extension\\/module\\/vqmod_manager\",\"extension\\/openbay\",\"extension\\/openbay\\/amazon\",\"extension\\/openbay\\/amazon_listing\",\"extension\\/openbay\\/amazon_product\",\"extension\\/openbay\\/amazonus\",\"extension\\/openbay\\/amazonus_listing\",\"extension\\/openbay\\/amazonus_product\",\"extension\\/openbay\\/ebay\",\"extension\\/openbay\\/ebay_profile\",\"extension\\/openbay\\/ebay_template\",\"extension\\/openbay\\/etsy\",\"extension\\/openbay\\/etsy_product\",\"extension\\/openbay\\/etsy_shipping\",\"extension\\/openbay\\/etsy_shop\",\"extension\\/openbay\\/fba\",\"extension\\/payment\\/amazon_login_pay\",\"extension\\/payment\\/authorizenet_aim\",\"extension\\/payment\\/authorizenet_sim\",\"extension\\/payment\\/bank_transfer\",\"extension\\/payment\\/bluepay_hosted\",\"extension\\/payment\\/bluepay_redirect\",\"extension\\/payment\\/cardconnect\",\"extension\\/payment\\/cardinity\",\"extension\\/payment\\/ccavenue\",\"extension\\/payment\\/cheque\",\"extension\\/payment\\/cod\",\"extension\\/payment\\/divido\",\"extension\\/payment\\/eway\",\"extension\\/payment\\/firstdata\",\"extension\\/payment\\/firstdata_remote\",\"extension\\/payment\\/free_checkout\",\"extension\\/payment\\/g2apay\",\"extension\\/payment\\/globalpay\",\"extension\\/payment\\/globalpay_remote\",\"extension\\/payment\\/klarna_account\",\"extension\\/payment\\/klarna_checkout\",\"extension\\/payment\\/klarna_invoice\",\"extension\\/payment\\/laybuy\",\"extension\\/payment\\/liqpay\",\"extension\\/payment\\/nochex\",\"extension\\/payment\\/paymate\",\"extension\\/payment\\/paypoint\",\"extension\\/payment\\/payza\",\"extension\\/payment\\/perpetual_payments\",\"extension\\/payment\\/pilibaba\",\"extension\\/payment\\/pp_express\",\"extension\\/payment\\/pp_payflow\",\"extension\\/payment\\/pp_payflow_iframe\",\"extension\\/payment\\/pp_pro\",\"extension\\/payment\\/pp_pro_iframe\",\"extension\\/payment\\/pp_standard\",\"extension\\/payment\\/realex\",\"extension\\/payment\\/realex_remote\",\"extension\\/payment\\/sagepay_direct\",\"extension\\/payment\\/sagepay_server\",\"extension\\/payment\\/sagepay_us\",\"extension\\/payment\\/securetrading_pp\",\"extension\\/payment\\/securetrading_ws\",\"extension\\/payment\\/skrill\",\"extension\\/payment\\/twocheckout\",\"extension\\/payment\\/web_payment_software\",\"extension\\/payment\\/worldpay\",\"extension\\/shipping\\/auspost\",\"extension\\/shipping\\/citylink\",\"extension\\/shipping\\/fedex\",\"extension\\/shipping\\/flat\",\"extension\\/shipping\\/free\",\"extension\\/shipping\\/item\",\"extension\\/shipping\\/parcelforce_48\",\"extension\\/shipping\\/pickup\",\"extension\\/shipping\\/royal_mail\",\"extension\\/shipping\\/ups\",\"extension\\/shipping\\/usps\",\"extension\\/shipping\\/weight\",\"extension\\/store\",\"extension\\/theme\\/theme_default\",\"extension\\/total\\/coupon\",\"extension\\/total\\/credit\",\"extension\\/total\\/handling\",\"extension\\/total\\/klarna_fee\",\"extension\\/total\\/low_order_fee\",\"extension\\/total\\/maintainance_fee\",\"extension\\/total\\/reward\",\"extension\\/total\\/shipping\",\"extension\\/total\\/sub_total\",\"extension\\/total\\/tax\",\"extension\\/total\\/total\",\"extension\\/total\\/voucher\",\"localisation\\/country\",\"localisation\\/currency\",\"localisation\\/geo_zone\",\"localisation\\/language\",\"localisation\\/length_class\",\"localisation\\/location\",\"localisation\\/order_status\",\"localisation\\/return_action\",\"localisation\\/return_reason\",\"localisation\\/return_status\",\"localisation\\/stock_status\",\"localisation\\/tax_class\",\"localisation\\/tax_rate\",\"localisation\\/weight_class\",\"localisation\\/zone\",\"marketing\\/affiliate\",\"marketing\\/contact\",\"marketing\\/coupon\",\"marketing\\/marketing\",\"report\\/affiliate\",\"report\\/affiliate_activity\",\"report\\/affiliate_login\",\"report\\/customer_activity\",\"report\\/customer_credit\",\"report\\/customer_login\",\"report\\/customer_online\",\"report\\/customer_order\",\"report\\/customer_reward\",\"report\\/customer_search\",\"report\\/marketing\",\"report\\/product_purchased\",\"report\\/product_viewed\",\"report\\/sale_coupon\",\"report\\/sale_order\",\"report\\/sale_return\",\"report\\/sale_shipping\",\"report\\/sale_tax\",\"sale\\/order\",\"sale\\/recurring\",\"sale\\/return\",\"sale\\/voucher\",\"sale\\/voucher_theme\",\"setting\\/setting\",\"setting\\/store\",\"simple_blog\\/article\",\"simple_blog\\/author\",\"simple_blog\\/category\",\"simple_blog\\/comment\",\"simple_blog\\/install\",\"simple_blog\\/report\",\"startup\\/compatibility\",\"startup\\/error\",\"startup\\/event\",\"startup\\/login\",\"startup\\/permission\",\"startup\\/router\",\"startup\\/sass\",\"startup\\/startup\",\"tool\\/backup\",\"tool\\/log\",\"tool\\/upload\",\"user\\/api\",\"user\\/user\",\"user\\/user_permission\",\"extension\\/module\\/vqmod_manager\"],\"modify\":[\"catalog\\/attribute\",\"catalog\\/attribute_group\",\"catalog\\/category\",\"catalog\\/download\",\"catalog\\/filter\",\"catalog\\/information\",\"catalog\\/manufacturer\",\"catalog\\/mproduct\",\"catalog\\/option\",\"catalog\\/product\",\"catalog\\/recurring\",\"catalog\\/review\",\"common\\/column_left\",\"common\\/filemanager\",\"customer\\/custom_field\",\"customer\\/customer\",\"customer\\/customer_group\",\"design\\/banner\",\"design\\/language\",\"design\\/layout\",\"design\\/menu\",\"design\\/theme\",\"design\\/translation\",\"event\\/compatibility\",\"event\\/theme\",\"extension\\/analytics\\/google_analytics\",\"extension\\/captcha\\/basic_captcha\",\"extension\\/captcha\\/google_captcha\",\"extension\\/dashboard\\/activity\",\"extension\\/dashboard\\/chart\",\"extension\\/dashboard\\/customer\",\"extension\\/dashboard\\/map\",\"extension\\/dashboard\\/online\",\"extension\\/dashboard\\/order\",\"extension\\/dashboard\\/recent\",\"extension\\/dashboard\\/sale\",\"extension\\/event\",\"extension\\/extension\",\"extension\\/extension\\/analytics\",\"extension\\/extension\\/captcha\",\"extension\\/extension\\/dashboard\",\"extension\\/extension\\/feed\",\"extension\\/extension\\/fraud\",\"extension\\/extension\\/module\",\"extension\\/extension\\/payment\",\"extension\\/extension\\/shipping\",\"extension\\/extension\\/theme\",\"extension\\/extension\\/total\",\"extension\\/feed\\/google_base\",\"extension\\/feed\\/google_sitemap\",\"extension\\/feed\\/openbaypro\",\"extension\\/fraud\\/fraudlabspro\",\"extension\\/fraud\\/ip\",\"extension\\/fraud\\/maxmind\",\"extension\\/installer\",\"extension\\/modification\",\"extension\\/modification_editor\",\"extension\\/module\\/account\",\"extension\\/module\\/affiliate\",\"extension\\/module\\/amazon_login\",\"extension\\/module\\/amazon_pay\",\"extension\\/module\\/banner\",\"extension\\/module\\/bestseller\",\"extension\\/module\\/carousel\",\"extension\\/module\\/category\",\"extension\\/module\\/divido_calculator\",\"extension\\/module\\/ebay_listing\",\"extension\\/module\\/featured\",\"extension\\/module\\/filter\",\"extension\\/module\\/google_hangouts\",\"extension\\/module\\/html\",\"extension\\/module\\/information\",\"extension\\/module\\/klarna_checkout_module\",\"extension\\/module\\/latest\",\"extension\\/module\\/laybuy_layout\",\"extension\\/module\\/pilibaba_button\",\"extension\\/module\\/pp_button\",\"extension\\/module\\/pp_login\",\"extension\\/module\\/sagepay_direct_cards\",\"extension\\/module\\/sagepay_server_cards\",\"extension\\/module\\/simple_blog\",\"extension\\/module\\/simple_blog_category\",\"extension\\/module\\/slideshow\",\"extension\\/module\\/so_basic_products\",\"extension\\/module\\/so_category_slider\",\"extension\\/module\\/so_deals\",\"extension\\/module\\/so_extra_slider\",\"extension\\/module\\/so_filter_shop_by\",\"extension\\/module\\/so_home_slider\",\"extension\\/module\\/so_html_content\",\"extension\\/module\\/so_instagram_gallery\",\"extension\\/module\\/so_latest_blog\",\"extension\\/module\\/so_listing_tabs\",\"extension\\/module\\/so_megamenu\",\"extension\\/module\\/so_newletter_custom_popup\",\"extension\\/module\\/so_onepagecheckout\",\"extension\\/module\\/so_page_builder\",\"extension\\/module\\/so_popular_tags\",\"extension\\/module\\/so_product_label\",\"extension\\/module\\/so_quickview\",\"extension\\/module\\/so_searchpro\",\"extension\\/module\\/so_sociallogin\",\"extension\\/module\\/so_super_category\",\"extension\\/module\\/soconfig\",\"extension\\/module\\/soconfig_mobile\",\"extension\\/module\\/special\",\"extension\\/module\\/store\",\"extension\\/module\\/vqmod_manager\",\"extension\\/openbay\",\"extension\\/openbay\\/amazon\",\"extension\\/openbay\\/amazon_listing\",\"extension\\/openbay\\/amazon_product\",\"extension\\/openbay\\/amazonus\",\"extension\\/openbay\\/amazonus_listing\",\"extension\\/openbay\\/amazonus_product\",\"extension\\/openbay\\/ebay\",\"extension\\/openbay\\/ebay_profile\",\"extension\\/openbay\\/ebay_template\",\"extension\\/openbay\\/etsy\",\"extension\\/openbay\\/etsy_product\",\"extension\\/openbay\\/etsy_shipping\",\"extension\\/openbay\\/etsy_shop\",\"extension\\/openbay\\/fba\",\"extension\\/payment\\/amazon_login_pay\",\"extension\\/payment\\/authorizenet_aim\",\"extension\\/payment\\/authorizenet_sim\",\"extension\\/payment\\/bank_transfer\",\"extension\\/payment\\/bluepay_hosted\",\"extension\\/payment\\/bluepay_redirect\",\"extension\\/payment\\/cardconnect\",\"extension\\/payment\\/cardinity\",\"extension\\/payment\\/ccavenue\",\"extension\\/payment\\/cheque\",\"extension\\/payment\\/cod\",\"extension\\/payment\\/divido\",\"extension\\/payment\\/eway\",\"extension\\/payment\\/firstdata\",\"extension\\/payment\\/firstdata_remote\",\"extension\\/payment\\/free_checkout\",\"extension\\/payment\\/g2apay\",\"extension\\/payment\\/globalpay\",\"extension\\/payment\\/globalpay_remote\",\"extension\\/payment\\/klarna_account\",\"extension\\/payment\\/klarna_checkout\",\"extension\\/payment\\/klarna_invoice\",\"extension\\/payment\\/laybuy\",\"extension\\/payment\\/liqpay\",\"extension\\/payment\\/nochex\",\"extension\\/payment\\/paymate\",\"extension\\/payment\\/paypoint\",\"extension\\/payment\\/payza\",\"extension\\/payment\\/perpetual_payments\",\"extension\\/payment\\/pilibaba\",\"extension\\/payment\\/pp_express\",\"extension\\/payment\\/pp_payflow\",\"extension\\/payment\\/pp_payflow_iframe\",\"extension\\/payment\\/pp_pro\",\"extension\\/payment\\/pp_pro_iframe\",\"extension\\/payment\\/pp_standard\",\"extension\\/payment\\/realex\",\"extension\\/payment\\/realex_remote\",\"extension\\/payment\\/sagepay_direct\",\"extension\\/payment\\/sagepay_server\",\"extension\\/payment\\/sagepay_us\",\"extension\\/payment\\/securetrading_pp\",\"extension\\/payment\\/securetrading_ws\",\"extension\\/payment\\/skrill\",\"extension\\/payment\\/twocheckout\",\"extension\\/payment\\/web_payment_software\",\"extension\\/payment\\/worldpay\",\"extension\\/shipping\\/auspost\",\"extension\\/shipping\\/citylink\",\"extension\\/shipping\\/fedex\",\"extension\\/shipping\\/flat\",\"extension\\/shipping\\/free\",\"extension\\/shipping\\/item\",\"extension\\/shipping\\/parcelforce_48\",\"extension\\/shipping\\/pickup\",\"extension\\/shipping\\/royal_mail\",\"extension\\/shipping\\/ups\",\"extension\\/shipping\\/usps\",\"extension\\/shipping\\/weight\",\"extension\\/store\",\"extension\\/theme\\/theme_default\",\"extension\\/total\\/coupon\",\"extension\\/total\\/credit\",\"extension\\/total\\/handling\",\"extension\\/total\\/klarna_fee\",\"extension\\/total\\/low_order_fee\",\"extension\\/total\\/maintainance_fee\",\"extension\\/total\\/reward\",\"extension\\/total\\/shipping\",\"extension\\/total\\/sub_total\",\"extension\\/total\\/tax\",\"extension\\/total\\/total\",\"extension\\/total\\/voucher\",\"localisation\\/country\",\"localisation\\/currency\",\"localisation\\/geo_zone\",\"localisation\\/language\",\"localisation\\/length_class\",\"localisation\\/location\",\"localisation\\/order_status\",\"localisation\\/return_action\",\"localisation\\/return_reason\",\"localisation\\/return_status\",\"localisation\\/stock_status\",\"localisation\\/tax_class\",\"localisation\\/tax_rate\",\"localisation\\/weight_class\",\"localisation\\/zone\",\"marketing\\/affiliate\",\"marketing\\/contact\",\"marketing\\/coupon\",\"marketing\\/marketing\",\"report\\/affiliate\",\"report\\/affiliate_activity\",\"report\\/affiliate_login\",\"report\\/customer_activity\",\"report\\/customer_credit\",\"report\\/customer_login\",\"report\\/customer_online\",\"report\\/customer_order\",\"report\\/customer_reward\",\"report\\/customer_search\",\"report\\/marketing\",\"report\\/product_purchased\",\"report\\/product_viewed\",\"report\\/sale_coupon\",\"report\\/sale_order\",\"report\\/sale_return\",\"report\\/sale_shipping\",\"report\\/sale_tax\",\"sale\\/order\",\"sale\\/recurring\",\"sale\\/return\",\"sale\\/voucher\",\"sale\\/voucher_theme\",\"setting\\/setting\",\"setting\\/store\",\"simple_blog\\/article\",\"simple_blog\\/author\",\"simple_blog\\/category\",\"simple_blog\\/comment\",\"simple_blog\\/install\",\"simple_blog\\/report\",\"startup\\/compatibility\",\"startup\\/error\",\"startup\\/event\",\"startup\\/login\",\"startup\\/permission\",\"startup\\/router\",\"startup\\/sass\",\"startup\\/startup\",\"tool\\/backup\",\"tool\\/log\",\"tool\\/upload\",\"user\\/api\",\"user\\/user\",\"user\\/user_permission\",\"extension\\/module\\/vqmod_manager\"]}',0.00),
	(16,'Freelance','{\"access\":[\"catalog\\/attribute\",\"catalog\\/category\",\"catalog\\/download\",\"catalog\\/filter\",\"catalog\\/mproduct\",\"catalog\\/option\",\"catalog\\/product\",\"common\\/filemanager\",\"extension\\/dashboard\\/activity\",\"extension\\/dashboard\\/order\",\"extension\\/dashboard\\/recent\",\"extension\\/dashboard\\/sale\",\"extension\\/extension\\/dashboard\",\"sale\\/order\"],\"modify\":[\"catalog\\/download\",\"catalog\\/mproduct\",\"catalog\\/product\",\"common\\/filemanager\",\"extension\\/dashboard\\/activity\",\"extension\\/dashboard\\/order\",\"extension\\/dashboard\\/recent\",\"extension\\/dashboard\\/sale\",\"extension\\/extension\\/dashboard\",\"sale\\/order\"]}',40.00),
	(17,'Used Item Seller','{\"access\":[\"catalog\\/attribute\",\"catalog\\/category\",\"catalog\\/download\",\"catalog\\/filter\",\"catalog\\/mproduct\",\"catalog\\/option\",\"catalog\\/product\",\"common\\/filemanager\",\"extension\\/dashboard\\/activity\",\"extension\\/dashboard\\/order\",\"extension\\/dashboard\\/recent\",\"extension\\/dashboard\\/sale\",\"extension\\/extension\\/dashboard\",\"sale\\/order\"],\"modify\":[\"catalog\\/download\",\"catalog\\/mproduct\",\"catalog\\/product\",\"common\\/filemanager\",\"extension\\/dashboard\\/activity\",\"extension\\/dashboard\\/order\",\"extension\\/dashboard\\/recent\",\"extension\\/dashboard\\/sale\",\"extension\\/extension\\/dashboard\",\"sale\\/order\"]}',20.00),
	(18,'Others','{\"access\":[\"catalog\\/attribute\",\"catalog\\/category\",\"catalog\\/download\",\"catalog\\/filter\",\"catalog\\/mproduct\",\"catalog\\/option\",\"catalog\\/product\",\"common\\/filemanager\",\"extension\\/dashboard\\/activity\",\"extension\\/dashboard\\/order\",\"extension\\/dashboard\\/recent\",\"extension\\/dashboard\\/sale\",\"extension\\/extension\\/dashboard\",\"sale\\/order\"],\"modify\":[\"catalog\\/download\",\"catalog\\/mproduct\",\"catalog\\/product\",\"common\\/filemanager\",\"extension\\/dashboard\\/activity\",\"extension\\/dashboard\\/order\",\"extension\\/dashboard\\/recent\",\"extension\\/dashboard\\/sale\",\"extension\\/extension\\/dashboard\",\"sale\\/order\"]}',10.00);

/*!40000 ALTER TABLE `user_group` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table voucher
# ------------------------------------------------------------

DROP TABLE IF EXISTS `voucher`;

CREATE TABLE `voucher` (
  `voucher_id` int(11) NOT NULL AUTO_INCREMENT,
  `order_id` int(11) NOT NULL,
  `code` varchar(10) NOT NULL,
  `from_name` varchar(64) NOT NULL,
  `from_email` varchar(96) NOT NULL,
  `to_name` varchar(64) NOT NULL,
  `to_email` varchar(96) NOT NULL,
  `voucher_theme_id` int(11) NOT NULL,
  `message` text NOT NULL,
  `amount` decimal(15,4) NOT NULL,
  `status` tinyint(1) NOT NULL,
  `date_added` datetime NOT NULL,
  PRIMARY KEY (`voucher_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;



# Dump of table voucher_history
# ------------------------------------------------------------

DROP TABLE IF EXISTS `voucher_history`;

CREATE TABLE `voucher_history` (
  `voucher_history_id` int(11) NOT NULL AUTO_INCREMENT,
  `voucher_id` int(11) NOT NULL,
  `order_id` int(11) NOT NULL,
  `amount` decimal(15,4) NOT NULL,
  `date_added` datetime NOT NULL,
  PRIMARY KEY (`voucher_history_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;



# Dump of table voucher_theme
# ------------------------------------------------------------

DROP TABLE IF EXISTS `voucher_theme`;

CREATE TABLE `voucher_theme` (
  `voucher_theme_id` int(11) NOT NULL AUTO_INCREMENT,
  `image` varchar(255) NOT NULL,
  PRIMARY KEY (`voucher_theme_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

LOCK TABLES `voucher_theme` WRITE;
/*!40000 ALTER TABLE `voucher_theme` DISABLE KEYS */;

INSERT INTO `voucher_theme` (`voucher_theme_id`, `image`)
VALUES
	(8,'catalog/demo/canon_eos_5d_2.jpg'),
	(7,'catalog/demo/gift-voucher-birthday.jpg'),
	(6,'catalog/demo/apple_logo.jpg');

/*!40000 ALTER TABLE `voucher_theme` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table voucher_theme_description
# ------------------------------------------------------------

DROP TABLE IF EXISTS `voucher_theme_description`;

CREATE TABLE `voucher_theme_description` (
  `voucher_theme_id` int(11) NOT NULL,
  `language_id` int(11) NOT NULL,
  `name` varchar(32) NOT NULL,
  PRIMARY KEY (`voucher_theme_id`,`language_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

LOCK TABLES `voucher_theme_description` WRITE;
/*!40000 ALTER TABLE `voucher_theme_description` DISABLE KEYS */;

INSERT INTO `voucher_theme_description` (`voucher_theme_id`, `language_id`, `name`)
VALUES
	(6,1,'Christmas'),
	(7,1,'Birthday'),
	(8,1,'General');

/*!40000 ALTER TABLE `voucher_theme_description` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table weight_class
# ------------------------------------------------------------

DROP TABLE IF EXISTS `weight_class`;

CREATE TABLE `weight_class` (
  `weight_class_id` int(11) NOT NULL AUTO_INCREMENT,
  `value` decimal(15,8) NOT NULL DEFAULT '0.00000000',
  PRIMARY KEY (`weight_class_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

LOCK TABLES `weight_class` WRITE;
/*!40000 ALTER TABLE `weight_class` DISABLE KEYS */;

INSERT INTO `weight_class` (`weight_class_id`, `value`)
VALUES
	(1,1.00000000),
	(2,1000.00000000),
	(5,2.20460000),
	(6,35.27400000);

/*!40000 ALTER TABLE `weight_class` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table weight_class_description
# ------------------------------------------------------------

DROP TABLE IF EXISTS `weight_class_description`;

CREATE TABLE `weight_class_description` (
  `weight_class_id` int(11) NOT NULL,
  `language_id` int(11) NOT NULL,
  `title` varchar(32) NOT NULL,
  `unit` varchar(4) NOT NULL,
  PRIMARY KEY (`weight_class_id`,`language_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

LOCK TABLES `weight_class_description` WRITE;
/*!40000 ALTER TABLE `weight_class_description` DISABLE KEYS */;

INSERT INTO `weight_class_description` (`weight_class_id`, `language_id`, `title`, `unit`)
VALUES
	(1,1,'Kilogram','kg'),
	(2,1,'Gram','g'),
	(5,1,'Pound ','lb'),
	(6,1,'Ounce','oz');

/*!40000 ALTER TABLE `weight_class_description` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table zone
# ------------------------------------------------------------

DROP TABLE IF EXISTS `zone`;

CREATE TABLE `zone` (
  `zone_id` int(11) NOT NULL AUTO_INCREMENT,
  `country_id` int(11) NOT NULL,
  `name` varchar(128) NOT NULL,
  `code` varchar(32) NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`zone_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

LOCK TABLES `zone` WRITE;
/*!40000 ALTER TABLE `zone` DISABLE KEYS */;

INSERT INTO `zone` (`zone_id`, `country_id`, `name`, `code`, `status`)
VALUES
	(1,1,'Badakhshan','BDS',1),
	(2,1,'Badghis','BDG',1),
	(3,1,'Baghlan','BGL',1),
	(4,1,'Balkh','BAL',1),
	(5,1,'Bamian','BAM',1),
	(6,1,'Farah','FRA',1),
	(7,1,'Faryab','FYB',1),
	(8,1,'Ghazni','GHA',1),
	(9,1,'Ghowr','GHO',1),
	(10,1,'Helmand','HEL',1),
	(11,1,'Herat','HER',1),
	(12,1,'Jowzjan','JOW',1),
	(13,1,'Kabul','KAB',1),
	(14,1,'Kandahar','KAN',1),
	(15,1,'Kapisa','KAP',1),
	(16,1,'Khost','KHO',1),
	(17,1,'Konar','KNR',1),
	(18,1,'Kondoz','KDZ',1),
	(19,1,'Laghman','LAG',1),
	(20,1,'Lowgar','LOW',1),
	(21,1,'Nangrahar','NAN',1),
	(22,1,'Nimruz','NIM',1),
	(23,1,'Nurestan','NUR',1),
	(24,1,'Oruzgan','ORU',1),
	(25,1,'Paktia','PIA',1),
	(26,1,'Paktika','PKA',1),
	(27,1,'Parwan','PAR',1),
	(28,1,'Samangan','SAM',1),
	(29,1,'Sar-e Pol','SAR',1),
	(30,1,'Takhar','TAK',1),
	(31,1,'Wardak','WAR',1),
	(32,1,'Zabol','ZAB',1),
	(33,2,'Berat','BR',1),
	(34,2,'Bulqize','BU',1),
	(35,2,'Delvine','DL',1),
	(36,2,'Devoll','DV',1),
	(37,2,'Diber','DI',1),
	(38,2,'Durres','DR',1),
	(39,2,'Elbasan','EL',1),
	(40,2,'Kolonje','ER',1),
	(41,2,'Fier','FR',1),
	(42,2,'Gjirokaster','GJ',1),
	(43,2,'Gramsh','GR',1),
	(44,2,'Has','HA',1),
	(45,2,'Kavaje','KA',1),
	(46,2,'Kurbin','KB',1),
	(47,2,'Kucove','KC',1),
	(48,2,'Korce','KO',1),
	(49,2,'Kruje','KR',1),
	(50,2,'Kukes','KU',1),
	(51,2,'Librazhd','LB',1),
	(52,2,'Lezhe','LE',1),
	(53,2,'Lushnje','LU',1),
	(54,2,'Malesi e Madhe','MM',1),
	(55,2,'Mallakaster','MK',1),
	(56,2,'Mat','MT',1),
	(57,2,'Mirdite','MR',1),
	(58,2,'Peqin','PQ',1),
	(59,2,'Permet','PR',1),
	(60,2,'Pogradec','PG',1),
	(61,2,'Puke','PU',1),
	(62,2,'Shkoder','SH',1),
	(63,2,'Skrapar','SK',1),
	(64,2,'Sarande','SR',1),
	(65,2,'Tepelene','TE',1),
	(66,2,'Tropoje','TP',1),
	(67,2,'Tirane','TR',1),
	(68,2,'Vlore','VL',1),
	(69,3,'Adrar','ADR',1),
	(70,3,'Ain Defla','ADE',1),
	(71,3,'Ain Temouchent','ATE',1),
	(72,3,'Alger','ALG',1),
	(73,3,'Annaba','ANN',1),
	(74,3,'Batna','BAT',1),
	(75,3,'Bechar','BEC',1),
	(76,3,'Bejaia','BEJ',1),
	(77,3,'Biskra','BIS',1),
	(78,3,'Blida','BLI',1),
	(79,3,'Bordj Bou Arreridj','BBA',1),
	(80,3,'Bouira','BOA',1),
	(81,3,'Boumerdes','BMD',1),
	(82,3,'Chlef','CHL',1),
	(83,3,'Constantine','CON',1),
	(84,3,'Djelfa','DJE',1),
	(85,3,'El Bayadh','EBA',1),
	(86,3,'El Oued','EOU',1),
	(87,3,'El Tarf','ETA',1),
	(88,3,'Ghardaia','GHA',1),
	(89,3,'Guelma','GUE',1),
	(90,3,'Illizi','ILL',1),
	(91,3,'Jijel','JIJ',1),
	(92,3,'Khenchela','KHE',1),
	(93,3,'Laghouat','LAG',1),
	(94,3,'Muaskar','MUA',1),
	(95,3,'Medea','MED',1),
	(96,3,'Mila','MIL',1),
	(97,3,'Mostaganem','MOS',1),
	(98,3,'M\'Sila','MSI',1),
	(99,3,'Naama','NAA',1),
	(100,3,'Oran','ORA',1),
	(101,3,'Ouargla','OUA',1),
	(102,3,'Oum el-Bouaghi','OEB',1),
	(103,3,'Relizane','REL',1),
	(104,3,'Saida','SAI',1),
	(105,3,'Setif','SET',1),
	(106,3,'Sidi Bel Abbes','SBA',1),
	(107,3,'Skikda','SKI',1),
	(108,3,'Souk Ahras','SAH',1),
	(109,3,'Tamanghasset','TAM',1),
	(110,3,'Tebessa','TEB',1),
	(111,3,'Tiaret','TIA',1),
	(112,3,'Tindouf','TIN',1),
	(113,3,'Tipaza','TIP',1),
	(114,3,'Tissemsilt','TIS',1),
	(115,3,'Tizi Ouzou','TOU',1),
	(116,3,'Tlemcen','TLE',1),
	(117,4,'Eastern','E',1),
	(118,4,'Manu\'a','M',1),
	(119,4,'Rose Island','R',1),
	(120,4,'Swains Island','S',1),
	(121,4,'Western','W',1),
	(122,5,'Andorra la Vella','ALV',1),
	(123,5,'Canillo','CAN',1),
	(124,5,'Encamp','ENC',1),
	(125,5,'Escaldes-Engordany','ESE',1),
	(126,5,'La Massana','LMA',1),
	(127,5,'Ordino','ORD',1),
	(128,5,'Sant Julia de Loria','SJL',1),
	(129,6,'Bengo','BGO',1),
	(130,6,'Benguela','BGU',1),
	(131,6,'Bie','BIE',1),
	(132,6,'Cabinda','CAB',1),
	(133,6,'Cuando-Cubango','CCU',1),
	(134,6,'Cuanza Norte','CNO',1),
	(135,6,'Cuanza Sul','CUS',1),
	(136,6,'Cunene','CNN',1),
	(137,6,'Huambo','HUA',1),
	(138,6,'Huila','HUI',1),
	(139,6,'Luanda','LUA',1),
	(140,6,'Lunda Norte','LNO',1),
	(141,6,'Lunda Sul','LSU',1),
	(142,6,'Malange','MAL',1),
	(143,6,'Moxico','MOX',1),
	(144,6,'Namibe','NAM',1),
	(145,6,'Uige','UIG',1),
	(146,6,'Zaire','ZAI',1),
	(147,9,'Saint George','ASG',1),
	(148,9,'Saint John','ASJ',1),
	(149,9,'Saint Mary','ASM',1),
	(150,9,'Saint Paul','ASL',1),
	(151,9,'Saint Peter','ASR',1),
	(152,9,'Saint Philip','ASH',1),
	(153,9,'Barbuda','BAR',1),
	(154,9,'Redonda','RED',1),
	(155,10,'Antartida e Islas del Atlantico','AN',1),
	(156,10,'Buenos Aires','BA',1),
	(157,10,'Catamarca','CA',1),
	(158,10,'Chaco','CH',1),
	(159,10,'Chubut','CU',1),
	(160,10,'Cordoba','CO',1),
	(161,10,'Corrientes','CR',1),
	(162,10,'Distrito Federal','DF',1),
	(163,10,'Entre Rios','ER',1),
	(164,10,'Formosa','FO',1),
	(165,10,'Jujuy','JU',1),
	(166,10,'La Pampa','LP',1),
	(167,10,'La Rioja','LR',1),
	(168,10,'Mendoza','ME',1),
	(169,10,'Misiones','MI',1),
	(170,10,'Neuquen','NE',1),
	(171,10,'Rio Negro','RN',1),
	(172,10,'Salta','SA',1),
	(173,10,'San Juan','SJ',1),
	(174,10,'San Luis','SL',1),
	(175,10,'Santa Cruz','SC',1),
	(176,10,'Santa Fe','SF',1),
	(177,10,'Santiago del Estero','SD',1),
	(178,10,'Tierra del Fuego','TF',1),
	(179,10,'Tucuman','TU',1),
	(180,11,'Aragatsotn','AGT',1),
	(181,11,'Ararat','ARR',1),
	(182,11,'Armavir','ARM',1),
	(183,11,'Geghark\'unik\'','GEG',1),
	(184,11,'Kotayk\'','KOT',1),
	(185,11,'Lorri','LOR',1),
	(186,11,'Shirak','SHI',1),
	(187,11,'Syunik\'','SYU',1),
	(188,11,'Tavush','TAV',1),
	(189,11,'Vayots\' Dzor','VAY',1),
	(190,11,'Yerevan','YER',1),
	(191,13,'Australian Capital Territory','ACT',1),
	(192,13,'New South Wales','NSW',1),
	(193,13,'Northern Territory','NT',1),
	(194,13,'Queensland','QLD',1),
	(195,13,'South Australia','SA',1),
	(196,13,'Tasmania','TAS',1),
	(197,13,'Victoria','VIC',1),
	(198,13,'Western Australia','WA',1),
	(199,14,'Burgenland','BUR',1),
	(200,14,'Kärnten','KAR',1),
	(201,14,'Niederösterreich','NOS',1),
	(202,14,'Oberösterreich','OOS',1),
	(203,14,'Salzburg','SAL',1),
	(204,14,'Steiermark','STE',1),
	(205,14,'Tirol','TIR',1),
	(206,14,'Vorarlberg','VOR',1),
	(207,14,'Wien','WIE',1),
	(208,15,'Ali Bayramli','AB',1),
	(209,15,'Abseron','ABS',1),
	(210,15,'AgcabAdi','AGC',1),
	(211,15,'Agdam','AGM',1),
	(212,15,'Agdas','AGS',1),
	(213,15,'Agstafa','AGA',1),
	(214,15,'Agsu','AGU',1),
	(215,15,'Astara','AST',1),
	(216,15,'Baki','BA',1),
	(217,15,'BabAk','BAB',1),
	(218,15,'BalakAn','BAL',1),
	(219,15,'BArdA','BAR',1),
	(220,15,'Beylaqan','BEY',1),
	(221,15,'Bilasuvar','BIL',1),
	(222,15,'Cabrayil','CAB',1),
	(223,15,'Calilabab','CAL',1),
	(224,15,'Culfa','CUL',1),
	(225,15,'Daskasan','DAS',1),
	(226,15,'Davaci','DAV',1),
	(227,15,'Fuzuli','FUZ',1),
	(228,15,'Ganca','GA',1),
	(229,15,'Gadabay','GAD',1),
	(230,15,'Goranboy','GOR',1),
	(231,15,'Goycay','GOY',1),
	(232,15,'Haciqabul','HAC',1),
	(233,15,'Imisli','IMI',1),
	(234,15,'Ismayilli','ISM',1),
	(235,15,'Kalbacar','KAL',1),
	(236,15,'Kurdamir','KUR',1),
	(237,15,'Lankaran','LA',1),
	(238,15,'Lacin','LAC',1),
	(239,15,'Lankaran','LAN',1),
	(240,15,'Lerik','LER',1),
	(241,15,'Masalli','MAS',1),
	(242,15,'Mingacevir','MI',1),
	(243,15,'Naftalan','NA',1),
	(244,15,'Neftcala','NEF',1),
	(245,15,'Oguz','OGU',1),
	(246,15,'Ordubad','ORD',1),
	(247,15,'Qabala','QAB',1),
	(248,15,'Qax','QAX',1),
	(249,15,'Qazax','QAZ',1),
	(250,15,'Qobustan','QOB',1),
	(251,15,'Quba','QBA',1),
	(252,15,'Qubadli','QBI',1),
	(253,15,'Qusar','QUS',1),
	(254,15,'Saki','SA',1),
	(255,15,'Saatli','SAT',1),
	(256,15,'Sabirabad','SAB',1),
	(257,15,'Sadarak','SAD',1),
	(258,15,'Sahbuz','SAH',1),
	(259,15,'Saki','SAK',1),
	(260,15,'Salyan','SAL',1),
	(261,15,'Sumqayit','SM',1),
	(262,15,'Samaxi','SMI',1),
	(263,15,'Samkir','SKR',1),
	(264,15,'Samux','SMX',1),
	(265,15,'Sarur','SAR',1),
	(266,15,'Siyazan','SIY',1),
	(267,15,'Susa','SS',1),
	(268,15,'Susa','SUS',1),
	(269,15,'Tartar','TAR',1),
	(270,15,'Tovuz','TOV',1),
	(271,15,'Ucar','UCA',1),
	(272,15,'Xankandi','XA',1),
	(273,15,'Xacmaz','XAC',1),
	(274,15,'Xanlar','XAN',1),
	(275,15,'Xizi','XIZ',1),
	(276,15,'Xocali','XCI',1),
	(277,15,'Xocavand','XVD',1),
	(278,15,'Yardimli','YAR',1),
	(279,15,'Yevlax','YEV',1),
	(280,15,'Zangilan','ZAN',1),
	(281,15,'Zaqatala','ZAQ',1),
	(282,15,'Zardab','ZAR',1),
	(283,15,'Naxcivan','NX',1),
	(284,16,'Acklins','ACK',1),
	(285,16,'Berry Islands','BER',1),
	(286,16,'Bimini','BIM',1),
	(287,16,'Black Point','BLK',1),
	(288,16,'Cat Island','CAT',1),
	(289,16,'Central Abaco','CAB',1),
	(290,16,'Central Andros','CAN',1),
	(291,16,'Central Eleuthera','CEL',1),
	(292,16,'City of Freeport','FRE',1),
	(293,16,'Crooked Island','CRO',1),
	(294,16,'East Grand Bahama','EGB',1),
	(295,16,'Exuma','EXU',1),
	(296,16,'Grand Cay','GRD',1),
	(297,16,'Harbour Island','HAR',1),
	(298,16,'Hope Town','HOP',1),
	(299,16,'Inagua','INA',1),
	(300,16,'Long Island','LNG',1),
	(301,16,'Mangrove Cay','MAN',1),
	(302,16,'Mayaguana','MAY',1),
	(303,16,'Moore\'s Island','MOO',1),
	(304,16,'North Abaco','NAB',1),
	(305,16,'North Andros','NAN',1),
	(306,16,'North Eleuthera','NEL',1),
	(307,16,'Ragged Island','RAG',1),
	(308,16,'Rum Cay','RUM',1),
	(309,16,'San Salvador','SAL',1),
	(310,16,'South Abaco','SAB',1),
	(311,16,'South Andros','SAN',1),
	(312,16,'South Eleuthera','SEL',1),
	(313,16,'Spanish Wells','SWE',1),
	(314,16,'West Grand Bahama','WGB',1),
	(315,17,'Capital','CAP',1),
	(316,17,'Central','CEN',1),
	(317,17,'Muharraq','MUH',1),
	(318,17,'Northern','NOR',1),
	(319,17,'Southern','SOU',1),
	(320,18,'Barisal','BAR',1),
	(321,18,'Chittagong','CHI',1),
	(322,18,'Dhaka','DHA',1),
	(323,18,'Khulna','KHU',1),
	(324,18,'Rajshahi','RAJ',1),
	(325,18,'Sylhet','SYL',1),
	(326,19,'Christ Church','CC',1),
	(327,19,'Saint Andrew','AND',1),
	(328,19,'Saint George','GEO',1),
	(329,19,'Saint James','JAM',1),
	(330,19,'Saint John','JOH',1),
	(331,19,'Saint Joseph','JOS',1),
	(332,19,'Saint Lucy','LUC',1),
	(333,19,'Saint Michael','MIC',1),
	(334,19,'Saint Peter','PET',1),
	(335,19,'Saint Philip','PHI',1),
	(336,19,'Saint Thomas','THO',1),
	(337,20,'Brestskaya (Brest)','BR',1),
	(338,20,'Homyel\'skaya (Homyel\')','HO',1),
	(339,20,'Horad Minsk','HM',1),
	(340,20,'Hrodzyenskaya (Hrodna)','HR',1),
	(341,20,'Mahilyowskaya (Mahilyow)','MA',1),
	(342,20,'Minskaya','MI',1),
	(343,20,'Vitsyebskaya (Vitsyebsk)','VI',1),
	(344,21,'Antwerpen','VAN',1),
	(345,21,'Brabant Wallon','WBR',1),
	(346,21,'Hainaut','WHT',1),
	(347,21,'Liège','WLG',1),
	(348,21,'Limburg','VLI',1),
	(349,21,'Luxembourg','WLX',1),
	(350,21,'Namur','WNA',1),
	(351,21,'Oost-Vlaanderen','VOV',1),
	(352,21,'Vlaams Brabant','VBR',1),
	(353,21,'West-Vlaanderen','VWV',1),
	(354,22,'Belize','BZ',1),
	(355,22,'Cayo','CY',1),
	(356,22,'Corozal','CR',1),
	(357,22,'Orange Walk','OW',1),
	(358,22,'Stann Creek','SC',1),
	(359,22,'Toledo','TO',1),
	(360,23,'Alibori','AL',1),
	(361,23,'Atakora','AK',1),
	(362,23,'Atlantique','AQ',1),
	(363,23,'Borgou','BO',1),
	(364,23,'Collines','CO',1),
	(365,23,'Donga','DO',1),
	(366,23,'Kouffo','KO',1),
	(367,23,'Littoral','LI',1),
	(368,23,'Mono','MO',1),
	(369,23,'Oueme','OU',1),
	(370,23,'Plateau','PL',1),
	(371,23,'Zou','ZO',1),
	(372,24,'Devonshire','DS',1),
	(373,24,'Hamilton City','HC',1),
	(374,24,'Hamilton','HA',1),
	(375,24,'Paget','PG',1),
	(376,24,'Pembroke','PB',1),
	(377,24,'Saint George City','GC',1),
	(378,24,'Saint George\'s','SG',1),
	(379,24,'Sandys','SA',1),
	(380,24,'Smith\'s','SM',1),
	(381,24,'Southampton','SH',1),
	(382,24,'Warwick','WA',1),
	(383,25,'Bumthang','BUM',1),
	(384,25,'Chukha','CHU',1),
	(385,25,'Dagana','DAG',1),
	(386,25,'Gasa','GAS',1),
	(387,25,'Haa','HAA',1),
	(388,25,'Lhuntse','LHU',1),
	(389,25,'Mongar','MON',1),
	(390,25,'Paro','PAR',1),
	(391,25,'Pemagatshel','PEM',1),
	(392,25,'Punakha','PUN',1),
	(393,25,'Samdrup Jongkhar','SJO',1),
	(394,25,'Samtse','SAT',1),
	(395,25,'Sarpang','SAR',1),
	(396,25,'Thimphu','THI',1),
	(397,25,'Trashigang','TRG',1),
	(398,25,'Trashiyangste','TRY',1),
	(399,25,'Trongsa','TRO',1),
	(400,25,'Tsirang','TSI',1),
	(401,25,'Wangdue Phodrang','WPH',1),
	(402,25,'Zhemgang','ZHE',1),
	(403,26,'Beni','BEN',1),
	(404,26,'Chuquisaca','CHU',1),
	(405,26,'Cochabamba','COC',1),
	(406,26,'La Paz','LPZ',1),
	(407,26,'Oruro','ORU',1),
	(408,26,'Pando','PAN',1),
	(409,26,'Potosi','POT',1),
	(410,26,'Santa Cruz','SCZ',1),
	(411,26,'Tarija','TAR',1),
	(412,27,'Brcko district','BRO',1),
	(413,27,'Unsko-Sanski Kanton','FUS',1),
	(414,27,'Posavski Kanton','FPO',1),
	(415,27,'Tuzlanski Kanton','FTU',1),
	(416,27,'Zenicko-Dobojski Kanton','FZE',1),
	(417,27,'Bosanskopodrinjski Kanton','FBP',1),
	(418,27,'Srednjebosanski Kanton','FSB',1),
	(419,27,'Hercegovacko-neretvanski Kanton','FHN',1),
	(420,27,'Zapadnohercegovacka Zupanija','FZH',1),
	(421,27,'Kanton Sarajevo','FSA',1),
	(422,27,'Zapadnobosanska','FZA',1),
	(423,27,'Banja Luka','SBL',1),
	(424,27,'Doboj','SDO',1),
	(425,27,'Bijeljina','SBI',1),
	(426,27,'Vlasenica','SVL',1),
	(427,27,'Sarajevo-Romanija or Sokolac','SSR',1),
	(428,27,'Foca','SFO',1),
	(429,27,'Trebinje','STR',1),
	(430,28,'Central','CE',1),
	(431,28,'Ghanzi','GH',1),
	(432,28,'Kgalagadi','KD',1),
	(433,28,'Kgatleng','KT',1),
	(434,28,'Kweneng','KW',1),
	(435,28,'Ngamiland','NG',1),
	(436,28,'North East','NE',1),
	(437,28,'North West','NW',1),
	(438,28,'South East','SE',1),
	(439,28,'Southern','SO',1),
	(440,30,'Acre','AC',1),
	(441,30,'Alagoas','AL',1),
	(442,30,'Amapá','AP',1),
	(443,30,'Amazonas','AM',1),
	(444,30,'Bahia','BA',1),
	(445,30,'Ceará','CE',1),
	(446,30,'Distrito Federal','DF',1),
	(447,30,'Espírito Santo','ES',1),
	(448,30,'Goiás','GO',1),
	(449,30,'Maranhão','MA',1),
	(450,30,'Mato Grosso','MT',1),
	(451,30,'Mato Grosso do Sul','MS',1),
	(452,30,'Minas Gerais','MG',1),
	(453,30,'Pará','PA',1),
	(454,30,'Paraíba','PB',1),
	(455,30,'Paraná','PR',1),
	(456,30,'Pernambuco','PE',1),
	(457,30,'Piauí','PI',1),
	(458,30,'Rio de Janeiro','RJ',1),
	(459,30,'Rio Grande do Norte','RN',1),
	(460,30,'Rio Grande do Sul','RS',1),
	(461,30,'Rondônia','RO',1),
	(462,30,'Roraima','RR',1),
	(463,30,'Santa Catarina','SC',1),
	(464,30,'São Paulo','SP',1),
	(465,30,'Sergipe','SE',1),
	(466,30,'Tocantins','TO',1),
	(467,31,'Peros Banhos','PB',1),
	(468,31,'Salomon Islands','SI',1),
	(469,31,'Nelsons Island','NI',1),
	(470,31,'Three Brothers','TB',1),
	(471,31,'Eagle Islands','EA',1),
	(472,31,'Danger Island','DI',1),
	(473,31,'Egmont Islands','EG',1),
	(474,31,'Diego Garcia','DG',1),
	(475,32,'Belait','BEL',1),
	(476,32,'Brunei and Muara','BRM',1),
	(477,32,'Temburong','TEM',1),
	(478,32,'Tutong','TUT',1),
	(479,33,'Blagoevgrad','',1),
	(480,33,'Burgas','',1),
	(481,33,'Dobrich','',1),
	(482,33,'Gabrovo','',1),
	(483,33,'Haskovo','',1),
	(484,33,'Kardjali','',1),
	(485,33,'Kyustendil','',1),
	(486,33,'Lovech','',1),
	(487,33,'Montana','',1),
	(488,33,'Pazardjik','',1),
	(489,33,'Pernik','',1),
	(490,33,'Pleven','',1),
	(491,33,'Plovdiv','',1),
	(492,33,'Razgrad','',1),
	(493,33,'Shumen','',1),
	(494,33,'Silistra','',1),
	(495,33,'Sliven','',1),
	(496,33,'Smolyan','',1),
	(497,33,'Sofia','',1),
	(498,33,'Sofia - town','',1),
	(499,33,'Stara Zagora','',1),
	(500,33,'Targovishte','',1),
	(501,33,'Varna','',1),
	(502,33,'Veliko Tarnovo','',1),
	(503,33,'Vidin','',1),
	(504,33,'Vratza','',1),
	(505,33,'Yambol','',1),
	(506,34,'Bale','BAL',1),
	(507,34,'Bam','BAM',1),
	(508,34,'Banwa','BAN',1),
	(509,34,'Bazega','BAZ',1),
	(510,34,'Bougouriba','BOR',1),
	(511,34,'Boulgou','BLG',1),
	(512,34,'Boulkiemde','BOK',1),
	(513,34,'Comoe','COM',1),
	(514,34,'Ganzourgou','GAN',1),
	(515,34,'Gnagna','GNA',1),
	(516,34,'Gourma','GOU',1),
	(517,34,'Houet','HOU',1),
	(518,34,'Ioba','IOA',1),
	(519,34,'Kadiogo','KAD',1),
	(520,34,'Kenedougou','KEN',1),
	(521,34,'Komondjari','KOD',1),
	(522,34,'Kompienga','KOP',1),
	(523,34,'Kossi','KOS',1),
	(524,34,'Koulpelogo','KOL',1),
	(525,34,'Kouritenga','KOT',1),
	(526,34,'Kourweogo','KOW',1),
	(527,34,'Leraba','LER',1),
	(528,34,'Loroum','LOR',1),
	(529,34,'Mouhoun','MOU',1),
	(530,34,'Nahouri','NAH',1),
	(531,34,'Namentenga','NAM',1),
	(532,34,'Nayala','NAY',1),
	(533,34,'Noumbiel','NOU',1),
	(534,34,'Oubritenga','OUB',1),
	(535,34,'Oudalan','OUD',1),
	(536,34,'Passore','PAS',1),
	(537,34,'Poni','PON',1),
	(538,34,'Sanguie','SAG',1),
	(539,34,'Sanmatenga','SAM',1),
	(540,34,'Seno','SEN',1),
	(541,34,'Sissili','SIS',1),
	(542,34,'Soum','SOM',1),
	(543,34,'Sourou','SOR',1),
	(544,34,'Tapoa','TAP',1),
	(545,34,'Tuy','TUY',1),
	(546,34,'Yagha','YAG',1),
	(547,34,'Yatenga','YAT',1),
	(548,34,'Ziro','ZIR',1),
	(549,34,'Zondoma','ZOD',1),
	(550,34,'Zoundweogo','ZOW',1),
	(551,35,'Bubanza','BB',1),
	(552,35,'Bujumbura','BJ',1),
	(553,35,'Bururi','BR',1),
	(554,35,'Cankuzo','CA',1),
	(555,35,'Cibitoke','CI',1),
	(556,35,'Gitega','GI',1),
	(557,35,'Karuzi','KR',1),
	(558,35,'Kayanza','KY',1),
	(559,35,'Kirundo','KI',1),
	(560,35,'Makamba','MA',1),
	(561,35,'Muramvya','MU',1),
	(562,35,'Muyinga','MY',1),
	(563,35,'Mwaro','MW',1),
	(564,35,'Ngozi','NG',1),
	(565,35,'Rutana','RT',1),
	(566,35,'Ruyigi','RY',1),
	(567,36,'Phnom Penh','PP',1),
	(568,36,'Preah Seihanu (Kompong Som or Sihanoukville)','PS',1),
	(569,36,'Pailin','PA',1),
	(570,36,'Keb','KB',1),
	(571,36,'Banteay Meanchey','BM',1),
	(572,36,'Battambang','BA',1),
	(573,36,'Kampong Cham','KM',1),
	(574,36,'Kampong Chhnang','KN',1),
	(575,36,'Kampong Speu','KU',1),
	(576,36,'Kampong Som','KO',1),
	(577,36,'Kampong Thom','KT',1),
	(578,36,'Kampot','KP',1),
	(579,36,'Kandal','KL',1),
	(580,36,'Kaoh Kong','KK',1),
	(581,36,'Kratie','KR',1),
	(582,36,'Mondul Kiri','MK',1),
	(583,36,'Oddar Meancheay','OM',1),
	(584,36,'Pursat','PU',1),
	(585,36,'Preah Vihear','PR',1),
	(586,36,'Prey Veng','PG',1),
	(587,36,'Ratanak Kiri','RK',1),
	(588,36,'Siemreap','SI',1),
	(589,36,'Stung Treng','ST',1),
	(590,36,'Svay Rieng','SR',1),
	(591,36,'Takeo','TK',1),
	(592,37,'Adamawa (Adamaoua)','ADA',1),
	(593,37,'Centre','CEN',1),
	(594,37,'East (Est)','EST',1),
	(595,37,'Extreme North (Extreme-Nord)','EXN',1),
	(596,37,'Littoral','LIT',1),
	(597,37,'North (Nord)','NOR',1),
	(598,37,'Northwest (Nord-Ouest)','NOT',1),
	(599,37,'West (Ouest)','OUE',1),
	(600,37,'South (Sud)','SUD',1),
	(601,37,'Southwest (Sud-Ouest).','SOU',1),
	(602,38,'Alberta','AB',1),
	(603,38,'British Columbia','BC',1),
	(604,38,'Manitoba','MB',1),
	(605,38,'New Brunswick','NB',1),
	(606,38,'Newfoundland and Labrador','NL',1),
	(607,38,'Northwest Territories','NT',1),
	(608,38,'Nova Scotia','NS',1),
	(609,38,'Nunavut','NU',1),
	(610,38,'Ontario','ON',1),
	(611,38,'Prince Edward Island','PE',1),
	(612,38,'Qu&eacute;bec','QC',1),
	(613,38,'Saskatchewan','SK',1),
	(614,38,'Yukon Territory','YT',1),
	(615,39,'Boa Vista','BV',1),
	(616,39,'Brava','BR',1),
	(617,39,'Calheta de Sao Miguel','CS',1),
	(618,39,'Maio','MA',1),
	(619,39,'Mosteiros','MO',1),
	(620,39,'Paul','PA',1),
	(621,39,'Porto Novo','PN',1),
	(622,39,'Praia','PR',1),
	(623,39,'Ribeira Grande','RG',1),
	(624,39,'Sal','SL',1),
	(625,39,'Santa Catarina','CA',1),
	(626,39,'Santa Cruz','CR',1),
	(627,39,'Sao Domingos','SD',1),
	(628,39,'Sao Filipe','SF',1),
	(629,39,'Sao Nicolau','SN',1),
	(630,39,'Sao Vicente','SV',1),
	(631,39,'Tarrafal','TA',1),
	(632,40,'Creek','CR',1),
	(633,40,'Eastern','EA',1),
	(634,40,'Midland','ML',1),
	(635,40,'South Town','ST',1),
	(636,40,'Spot Bay','SP',1),
	(637,40,'Stake Bay','SK',1),
	(638,40,'West End','WD',1),
	(639,40,'Western','WN',1),
	(640,41,'Bamingui-Bangoran','BBA',1),
	(641,41,'Basse-Kotto','BKO',1),
	(642,41,'Haute-Kotto','HKO',1),
	(643,41,'Haut-Mbomou','HMB',1),
	(644,41,'Kemo','KEM',1),
	(645,41,'Lobaye','LOB',1),
	(646,41,'Mambere-KadeÔ','MKD',1),
	(647,41,'Mbomou','MBO',1),
	(648,41,'Nana-Mambere','NMM',1),
	(649,41,'Ombella-M\'Poko','OMP',1),
	(650,41,'Ouaka','OUK',1),
	(651,41,'Ouham','OUH',1),
	(652,41,'Ouham-Pende','OPE',1),
	(653,41,'Vakaga','VAK',1),
	(654,41,'Nana-Grebizi','NGR',1),
	(655,41,'Sangha-Mbaere','SMB',1),
	(656,41,'Bangui','BAN',1),
	(657,42,'Batha','BA',1),
	(658,42,'Biltine','BI',1),
	(659,42,'Borkou-Ennedi-Tibesti','BE',1),
	(660,42,'Chari-Baguirmi','CB',1),
	(661,42,'Guera','GU',1),
	(662,42,'Kanem','KA',1),
	(663,42,'Lac','LA',1),
	(664,42,'Logone Occidental','LC',1),
	(665,42,'Logone Oriental','LR',1),
	(666,42,'Mayo-Kebbi','MK',1),
	(667,42,'Moyen-Chari','MC',1),
	(668,42,'Ouaddai','OU',1),
	(669,42,'Salamat','SA',1),
	(670,42,'Tandjile','TA',1),
	(671,43,'Aisen del General Carlos Ibanez','AI',1),
	(672,43,'Antofagasta','AN',1),
	(673,43,'Araucania','AR',1),
	(674,43,'Atacama','AT',1),
	(675,43,'Bio-Bio','BI',1),
	(676,43,'Coquimbo','CO',1),
	(677,43,'Libertador General Bernardo O\'Higgins','LI',1),
	(678,43,'Los Lagos','LL',1),
	(679,43,'Magallanes y de la Antartica Chilena','MA',1),
	(680,43,'Maule','ML',1),
	(681,43,'Region Metropolitana','RM',1),
	(682,43,'Tarapaca','TA',1),
	(683,43,'Valparaiso','VS',1),
	(684,44,'Anhui','AN',1),
	(685,44,'Beijing','BE',1),
	(686,44,'Chongqing','CH',1),
	(687,44,'Fujian','FU',1),
	(688,44,'Gansu','GA',1),
	(689,44,'Guangdong','GU',1),
	(690,44,'Guangxi','GX',1),
	(691,44,'Guizhou','GZ',1),
	(692,44,'Hainan','HA',1),
	(693,44,'Hebei','HB',1),
	(694,44,'Heilongjiang','HL',1),
	(695,44,'Henan','HE',1),
	(696,44,'Hong Kong','HK',1),
	(697,44,'Hubei','HU',1),
	(698,44,'Hunan','HN',1),
	(699,44,'Inner Mongolia','IM',1),
	(700,44,'Jiangsu','JI',1),
	(701,44,'Jiangxi','JX',1),
	(702,44,'Jilin','JL',1),
	(703,44,'Liaoning','LI',1),
	(704,44,'Macau','MA',1),
	(705,44,'Ningxia','NI',1),
	(706,44,'Shaanxi','SH',1),
	(707,44,'Shandong','SA',1),
	(708,44,'Shanghai','SG',1),
	(709,44,'Shanxi','SX',1),
	(710,44,'Sichuan','SI',1),
	(711,44,'Tianjin','TI',1),
	(712,44,'Xinjiang','XI',1),
	(713,44,'Yunnan','YU',1),
	(714,44,'Zhejiang','ZH',1),
	(715,46,'Direction Island','D',1),
	(716,46,'Home Island','H',1),
	(717,46,'Horsburgh Island','O',1),
	(718,46,'South Island','S',1),
	(719,46,'West Island','W',1),
	(720,47,'Amazonas','AMZ',1),
	(721,47,'Antioquia','ANT',1),
	(722,47,'Arauca','ARA',1),
	(723,47,'Atlantico','ATL',1),
	(724,47,'Bogota D.C.','BDC',1),
	(725,47,'Bolivar','BOL',1),
	(726,47,'Boyaca','BOY',1),
	(727,47,'Caldas','CAL',1),
	(728,47,'Caqueta','CAQ',1),
	(729,47,'Casanare','CAS',1),
	(730,47,'Cauca','CAU',1),
	(731,47,'Cesar','CES',1),
	(732,47,'Choco','CHO',1),
	(733,47,'Cordoba','COR',1),
	(734,47,'Cundinamarca','CAM',1),
	(735,47,'Guainia','GNA',1),
	(736,47,'Guajira','GJR',1),
	(737,47,'Guaviare','GVR',1),
	(738,47,'Huila','HUI',1),
	(739,47,'Magdalena','MAG',1),
	(740,47,'Meta','MET',1),
	(741,47,'Narino','NAR',1),
	(742,47,'Norte de Santander','NDS',1),
	(743,47,'Putumayo','PUT',1),
	(744,47,'Quindio','QUI',1),
	(745,47,'Risaralda','RIS',1),
	(746,47,'San Andres y Providencia','SAP',1),
	(747,47,'Santander','SAN',1),
	(748,47,'Sucre','SUC',1),
	(749,47,'Tolima','TOL',1),
	(750,47,'Valle del Cauca','VDC',1),
	(751,47,'Vaupes','VAU',1),
	(752,47,'Vichada','VIC',1),
	(753,48,'Grande Comore','G',1),
	(754,48,'Anjouan','A',1),
	(755,48,'Moheli','M',1),
	(756,49,'Bouenza','BO',1),
	(757,49,'Brazzaville','BR',1),
	(758,49,'Cuvette','CU',1),
	(759,49,'Cuvette-Ouest','CO',1),
	(760,49,'Kouilou','KO',1),
	(761,49,'Lekoumou','LE',1),
	(762,49,'Likouala','LI',1),
	(763,49,'Niari','NI',1),
	(764,49,'Plateaux','PL',1),
	(765,49,'Pool','PO',1),
	(766,49,'Sangha','SA',1),
	(767,50,'Pukapuka','PU',1),
	(768,50,'Rakahanga','RK',1),
	(769,50,'Manihiki','MK',1),
	(770,50,'Penrhyn','PE',1),
	(771,50,'Nassau Island','NI',1),
	(772,50,'Surwarrow','SU',1),
	(773,50,'Palmerston','PA',1),
	(774,50,'Aitutaki','AI',1),
	(775,50,'Manuae','MA',1),
	(776,50,'Takutea','TA',1),
	(777,50,'Mitiaro','MT',1),
	(778,50,'Atiu','AT',1),
	(779,50,'Mauke','MU',1),
	(780,50,'Rarotonga','RR',1),
	(781,50,'Mangaia','MG',1),
	(782,51,'Alajuela','AL',1),
	(783,51,'Cartago','CA',1),
	(784,51,'Guanacaste','GU',1),
	(785,51,'Heredia','HE',1),
	(786,51,'Limon','LI',1),
	(787,51,'Puntarenas','PU',1),
	(788,51,'San Jose','SJ',1),
	(789,52,'Abengourou','ABE',1),
	(790,52,'Abidjan','ABI',1),
	(791,52,'Aboisso','ABO',1),
	(792,52,'Adiake','ADI',1),
	(793,52,'Adzope','ADZ',1),
	(794,52,'Agboville','AGB',1),
	(795,52,'Agnibilekrou','AGN',1),
	(796,52,'Alepe','ALE',1),
	(797,52,'Bocanda','BOC',1),
	(798,52,'Bangolo','BAN',1),
	(799,52,'Beoumi','BEO',1),
	(800,52,'Biankouma','BIA',1),
	(801,52,'Bondoukou','BDK',1),
	(802,52,'Bongouanou','BGN',1),
	(803,52,'Bouafle','BFL',1),
	(804,52,'Bouake','BKE',1),
	(805,52,'Bouna','BNA',1),
	(806,52,'Boundiali','BDL',1),
	(807,52,'Dabakala','DKL',1),
	(808,52,'Dabou','DBU',1),
	(809,52,'Daloa','DAL',1),
	(810,52,'Danane','DAN',1),
	(811,52,'Daoukro','DAO',1),
	(812,52,'Dimbokro','DIM',1),
	(813,52,'Divo','DIV',1),
	(814,52,'Duekoue','DUE',1),
	(815,52,'Ferkessedougou','FER',1),
	(816,52,'Gagnoa','GAG',1),
	(817,52,'Grand-Bassam','GBA',1),
	(818,52,'Grand-Lahou','GLA',1),
	(819,52,'Guiglo','GUI',1),
	(820,52,'Issia','ISS',1),
	(821,52,'Jacqueville','JAC',1),
	(822,52,'Katiola','KAT',1),
	(823,52,'Korhogo','KOR',1),
	(824,52,'Lakota','LAK',1),
	(825,52,'Man','MAN',1),
	(826,52,'Mankono','MKN',1),
	(827,52,'Mbahiakro','MBA',1),
	(828,52,'Odienne','ODI',1),
	(829,52,'Oume','OUM',1),
	(830,52,'Sakassou','SAK',1),
	(831,52,'San-Pedro','SPE',1),
	(832,52,'Sassandra','SAS',1),
	(833,52,'Seguela','SEG',1),
	(834,52,'Sinfra','SIN',1),
	(835,52,'Soubre','SOU',1),
	(836,52,'Tabou','TAB',1),
	(837,52,'Tanda','TAN',1),
	(838,52,'Tiebissou','TIE',1),
	(839,52,'Tingrela','TIN',1),
	(840,52,'Tiassale','TIA',1),
	(841,52,'Touba','TBA',1),
	(842,52,'Toulepleu','TLP',1),
	(843,52,'Toumodi','TMD',1),
	(844,52,'Vavoua','VAV',1),
	(845,52,'Yamoussoukro','YAM',1),
	(846,52,'Zuenoula','ZUE',1),
	(847,53,'Bjelovarsko-bilogorska','BB',1),
	(848,53,'Grad Zagreb','GZ',1),
	(849,53,'Dubrovačko-neretvanska','DN',1),
	(850,53,'Istarska','IS',1),
	(851,53,'Karlovačka','KA',1),
	(852,53,'Koprivničko-križevačka','KK',1),
	(853,53,'Krapinsko-zagorska','KZ',1),
	(854,53,'Ličko-senjska','LS',1),
	(855,53,'Međimurska','ME',1),
	(856,53,'Osječko-baranjska','OB',1),
	(857,53,'Požeško-slavonska','PS',1),
	(858,53,'Primorsko-goranska','PG',1),
	(859,53,'Šibensko-kninska','SK',1),
	(860,53,'Sisačko-moslavačka','SM',1),
	(861,53,'Brodsko-posavska','BP',1),
	(862,53,'Splitsko-dalmatinska','SD',1),
	(863,53,'Varaždinska','VA',1),
	(864,53,'Virovitičko-podravska','VP',1),
	(865,53,'Vukovarsko-srijemska','VS',1),
	(866,53,'Zadarska','ZA',1),
	(867,53,'Zagrebačka','ZG',1),
	(868,54,'Camaguey','CA',1),
	(869,54,'Ciego de Avila','CD',1),
	(870,54,'Cienfuegos','CI',1),
	(871,54,'Ciudad de La Habana','CH',1),
	(872,54,'Granma','GR',1),
	(873,54,'Guantanamo','GU',1),
	(874,54,'Holguin','HO',1),
	(875,54,'Isla de la Juventud','IJ',1),
	(876,54,'La Habana','LH',1),
	(877,54,'Las Tunas','LT',1),
	(878,54,'Matanzas','MA',1),
	(879,54,'Pinar del Rio','PR',1),
	(880,54,'Sancti Spiritus','SS',1),
	(881,54,'Santiago de Cuba','SC',1),
	(882,54,'Villa Clara','VC',1),
	(883,55,'Famagusta','F',1),
	(884,55,'Kyrenia','K',1),
	(885,55,'Larnaca','A',1),
	(886,55,'Limassol','I',1),
	(887,55,'Nicosia','N',1),
	(888,55,'Paphos','P',1),
	(889,56,'Ústecký','U',1),
	(890,56,'Jihočeský','C',1),
	(891,56,'Jihomoravský','B',1),
	(892,56,'Karlovarský','K',1),
	(893,56,'Královehradecký','H',1),
	(894,56,'Liberecký','L',1),
	(895,56,'Moravskoslezský','T',1),
	(896,56,'Olomoucký','M',1),
	(897,56,'Pardubický','E',1),
	(898,56,'Plzeňský','P',1),
	(899,56,'Praha','A',1),
	(900,56,'Středočeský','S',1),
	(901,56,'Vysočina','J',1),
	(902,56,'Zlínský','Z',1),
	(903,57,'Arhus','AR',1),
	(904,57,'Bornholm','BH',1),
	(905,57,'Copenhagen','CO',1),
	(906,57,'Faroe Islands','FO',1),
	(907,57,'Frederiksborg','FR',1),
	(908,57,'Fyn','FY',1),
	(909,57,'Kobenhavn','KO',1),
	(910,57,'Nordjylland','NO',1),
	(911,57,'Ribe','RI',1),
	(912,57,'Ringkobing','RK',1),
	(913,57,'Roskilde','RO',1),
	(914,57,'Sonderjylland','SO',1),
	(915,57,'Storstrom','ST',1),
	(916,57,'Vejle','VK',1),
	(917,57,'Vestj&aelig;lland','VJ',1),
	(918,57,'Viborg','VB',1),
	(919,58,'\'Ali Sabih','S',1),
	(920,58,'Dikhil','K',1),
	(921,58,'Djibouti','J',1),
	(922,58,'Obock','O',1),
	(923,58,'Tadjoura','T',1),
	(924,59,'Saint Andrew Parish','AND',1),
	(925,59,'Saint David Parish','DAV',1),
	(926,59,'Saint George Parish','GEO',1),
	(927,59,'Saint John Parish','JOH',1),
	(928,59,'Saint Joseph Parish','JOS',1),
	(929,59,'Saint Luke Parish','LUK',1),
	(930,59,'Saint Mark Parish','MAR',1),
	(931,59,'Saint Patrick Parish','PAT',1),
	(932,59,'Saint Paul Parish','PAU',1),
	(933,59,'Saint Peter Parish','PET',1),
	(934,60,'Distrito Nacional','DN',1),
	(935,60,'Azua','AZ',1),
	(936,60,'Baoruco','BC',1),
	(937,60,'Barahona','BH',1),
	(938,60,'Dajabon','DJ',1),
	(939,60,'Duarte','DU',1),
	(940,60,'Elias Pina','EL',1),
	(941,60,'El Seybo','SY',1),
	(942,60,'Espaillat','ET',1),
	(943,60,'Hato Mayor','HM',1),
	(944,60,'Independencia','IN',1),
	(945,60,'La Altagracia','AL',1),
	(946,60,'La Romana','RO',1),
	(947,60,'La Vega','VE',1),
	(948,60,'Maria Trinidad Sanchez','MT',1),
	(949,60,'Monsenor Nouel','MN',1),
	(950,60,'Monte Cristi','MC',1),
	(951,60,'Monte Plata','MP',1),
	(952,60,'Pedernales','PD',1),
	(953,60,'Peravia (Bani)','PR',1),
	(954,60,'Puerto Plata','PP',1),
	(955,60,'Salcedo','SL',1),
	(956,60,'Samana','SM',1),
	(957,60,'Sanchez Ramirez','SH',1),
	(958,60,'San Cristobal','SC',1),
	(959,60,'San Jose de Ocoa','JO',1),
	(960,60,'San Juan','SJ',1),
	(961,60,'San Pedro de Macoris','PM',1),
	(962,60,'Santiago','SA',1),
	(963,60,'Santiago Rodriguez','ST',1),
	(964,60,'Santo Domingo','SD',1),
	(965,60,'Valverde','VA',1),
	(966,61,'Aileu','AL',1),
	(967,61,'Ainaro','AN',1),
	(968,61,'Baucau','BA',1),
	(969,61,'Bobonaro','BO',1),
	(970,61,'Cova Lima','CO',1),
	(971,61,'Dili','DI',1),
	(972,61,'Ermera','ER',1),
	(973,61,'Lautem','LA',1),
	(974,61,'Liquica','LI',1),
	(975,61,'Manatuto','MT',1),
	(976,61,'Manufahi','MF',1),
	(977,61,'Oecussi','OE',1),
	(978,61,'Viqueque','VI',1),
	(979,62,'Azuay','AZU',1),
	(980,62,'Bolivar','BOL',1),
	(981,62,'Ca&ntilde;ar','CAN',1),
	(982,62,'Carchi','CAR',1),
	(983,62,'Chimborazo','CHI',1),
	(984,62,'Cotopaxi','COT',1),
	(985,62,'El Oro','EOR',1),
	(986,62,'Esmeraldas','ESM',1),
	(987,62,'Gal&aacute;pagos','GPS',1),
	(988,62,'Guayas','GUA',1),
	(989,62,'Imbabura','IMB',1),
	(990,62,'Loja','LOJ',1),
	(991,62,'Los Rios','LRO',1),
	(992,62,'Manab&iacute;','MAN',1),
	(993,62,'Morona Santiago','MSA',1),
	(994,62,'Napo','NAP',1),
	(995,62,'Orellana','ORE',1),
	(996,62,'Pastaza','PAS',1),
	(997,62,'Pichincha','PIC',1),
	(998,62,'Sucumb&iacute;os','SUC',1),
	(999,62,'Tungurahua','TUN',1),
	(1000,62,'Zamora Chinchipe','ZCH',1),
	(1001,63,'Ad Daqahliyah','DHY',1),
	(1002,63,'Al Bahr al Ahmar','BAM',1),
	(1003,63,'Al Buhayrah','BHY',1),
	(1004,63,'Al Fayyum','FYM',1),
	(1005,63,'Al Gharbiyah','GBY',1),
	(1006,63,'Al Iskandariyah','IDR',1),
	(1007,63,'Al Isma\'iliyah','IML',1),
	(1008,63,'Al Jizah','JZH',1),
	(1009,63,'Al Minufiyah','MFY',1),
	(1010,63,'Al Minya','MNY',1),
	(1011,63,'Al Qahirah','QHR',1),
	(1012,63,'Al Qalyubiyah','QLY',1),
	(1013,63,'Al Wadi al Jadid','WJD',1),
	(1014,63,'Ash Sharqiyah','SHQ',1),
	(1015,63,'As Suways','SWY',1),
	(1016,63,'Aswan','ASW',1),
	(1017,63,'Asyut','ASY',1),
	(1018,63,'Bani Suwayf','BSW',1),
	(1019,63,'Bur Sa\'id','BSD',1),
	(1020,63,'Dumyat','DMY',1),
	(1021,63,'Janub Sina\'','JNS',1),
	(1022,63,'Kafr ash Shaykh','KSH',1),
	(1023,63,'Matruh','MAT',1),
	(1024,63,'Qina','QIN',1),
	(1025,63,'Shamal Sina\'','SHS',1),
	(1026,63,'Suhaj','SUH',1),
	(1027,64,'Ahuachapan','AH',1),
	(1028,64,'Cabanas','CA',1),
	(1029,64,'Chalatenango','CH',1),
	(1030,64,'Cuscatlan','CU',1),
	(1031,64,'La Libertad','LB',1),
	(1032,64,'La Paz','PZ',1),
	(1033,64,'La Union','UN',1),
	(1034,64,'Morazan','MO',1),
	(1035,64,'San Miguel','SM',1),
	(1036,64,'San Salvador','SS',1),
	(1037,64,'San Vicente','SV',1),
	(1038,64,'Santa Ana','SA',1),
	(1039,64,'Sonsonate','SO',1),
	(1040,64,'Usulutan','US',1),
	(1041,65,'Provincia Annobon','AN',1),
	(1042,65,'Provincia Bioko Norte','BN',1),
	(1043,65,'Provincia Bioko Sur','BS',1),
	(1044,65,'Provincia Centro Sur','CS',1),
	(1045,65,'Provincia Kie-Ntem','KN',1),
	(1046,65,'Provincia Litoral','LI',1),
	(1047,65,'Provincia Wele-Nzas','WN',1),
	(1048,66,'Central (Maekel)','MA',1),
	(1049,66,'Anseba (Keren)','KE',1),
	(1050,66,'Southern Red Sea (Debub-Keih-Bahri)','DK',1),
	(1051,66,'Northern Red Sea (Semien-Keih-Bahri)','SK',1),
	(1052,66,'Southern (Debub)','DE',1),
	(1053,66,'Gash-Barka (Barentu)','BR',1),
	(1054,67,'Harjumaa (Tallinn)','HA',1),
	(1055,67,'Hiiumaa (Kardla)','HI',1),
	(1056,67,'Ida-Virumaa (Johvi)','IV',1),
	(1057,67,'Jarvamaa (Paide)','JA',1),
	(1058,67,'Jogevamaa (Jogeva)','JO',1),
	(1059,67,'Laane-Virumaa (Rakvere)','LV',1),
	(1060,67,'Laanemaa (Haapsalu)','LA',1),
	(1061,67,'Parnumaa (Parnu)','PA',1),
	(1062,67,'Polvamaa (Polva)','PO',1),
	(1063,67,'Raplamaa (Rapla)','RA',1),
	(1064,67,'Saaremaa (Kuessaare)','SA',1),
	(1065,67,'Tartumaa (Tartu)','TA',1),
	(1066,67,'Valgamaa (Valga)','VA',1),
	(1067,67,'Viljandimaa (Viljandi)','VI',1),
	(1068,67,'Vorumaa (Voru)','VO',1),
	(1069,68,'Afar','AF',1),
	(1070,68,'Amhara','AH',1),
	(1071,68,'Benishangul-Gumaz','BG',1),
	(1072,68,'Gambela','GB',1),
	(1073,68,'Hariai','HR',1),
	(1074,68,'Oromia','OR',1),
	(1075,68,'Somali','SM',1),
	(1076,68,'Southern Nations - Nationalities and Peoples Region','SN',1),
	(1077,68,'Tigray','TG',1),
	(1078,68,'Addis Ababa','AA',1),
	(1079,68,'Dire Dawa','DD',1),
	(1080,71,'Central Division','C',1),
	(1081,71,'Northern Division','N',1),
	(1082,71,'Eastern Division','E',1),
	(1083,71,'Western Division','W',1),
	(1084,71,'Rotuma','R',1),
	(1085,72,'Ahvenanmaan lääni','AL',1),
	(1086,72,'Etelä-Suomen lääni','ES',1),
	(1087,72,'Itä-Suomen lääni','IS',1),
	(1088,72,'Länsi-Suomen lääni','LS',1),
	(1089,72,'Lapin lääni','LA',1),
	(1090,72,'Oulun lääni','OU',1),
	(1114,74,'Ain','01',1),
	(1115,74,'Aisne','02',1),
	(1116,74,'Allier','03',1),
	(1117,74,'Alpes de Haute Provence','04',1),
	(1118,74,'Hautes-Alpes','05',1),
	(1119,74,'Alpes Maritimes','06',1),
	(1120,74,'Ard&egrave;che','07',1),
	(1121,74,'Ardennes','08',1),
	(1122,74,'Ari&egrave;ge','09',1),
	(1123,74,'Aube','10',1),
	(1124,74,'Aude','11',1),
	(1125,74,'Aveyron','12',1),
	(1126,74,'Bouches du Rh&ocirc;ne','13',1),
	(1127,74,'Calvados','14',1),
	(1128,74,'Cantal','15',1),
	(1129,74,'Charente','16',1),
	(1130,74,'Charente Maritime','17',1),
	(1131,74,'Cher','18',1),
	(1132,74,'Corr&egrave;ze','19',1),
	(1133,74,'Corse du Sud','2A',1),
	(1134,74,'Haute Corse','2B',1),
	(1135,74,'C&ocirc;te d&#039;or','21',1),
	(1136,74,'C&ocirc;tes d&#039;Armor','22',1),
	(1137,74,'Creuse','23',1),
	(1138,74,'Dordogne','24',1),
	(1139,74,'Doubs','25',1),
	(1140,74,'Dr&ocirc;me','26',1),
	(1141,74,'Eure','27',1),
	(1142,74,'Eure et Loir','28',1),
	(1143,74,'Finist&egrave;re','29',1),
	(1144,74,'Gard','30',1),
	(1145,74,'Haute Garonne','31',1),
	(1146,74,'Gers','32',1),
	(1147,74,'Gironde','33',1),
	(1148,74,'H&eacute;rault','34',1),
	(1149,74,'Ille et Vilaine','35',1),
	(1150,74,'Indre','36',1),
	(1151,74,'Indre et Loire','37',1),
	(1152,74,'Is&eacute;re','38',1),
	(1153,74,'Jura','39',1),
	(1154,74,'Landes','40',1),
	(1155,74,'Loir et Cher','41',1),
	(1156,74,'Loire','42',1),
	(1157,74,'Haute Loire','43',1),
	(1158,74,'Loire Atlantique','44',1),
	(1159,74,'Loiret','45',1),
	(1160,74,'Lot','46',1),
	(1161,74,'Lot et Garonne','47',1),
	(1162,74,'Loz&egrave;re','48',1),
	(1163,74,'Maine et Loire','49',1),
	(1164,74,'Manche','50',1),
	(1165,74,'Marne','51',1),
	(1166,74,'Haute Marne','52',1),
	(1167,74,'Mayenne','53',1),
	(1168,74,'Meurthe et Moselle','54',1),
	(1169,74,'Meuse','55',1),
	(1170,74,'Morbihan','56',1),
	(1171,74,'Moselle','57',1),
	(1172,74,'Ni&egrave;vre','58',1),
	(1173,74,'Nord','59',1),
	(1174,74,'Oise','60',1),
	(1175,74,'Orne','61',1),
	(1176,74,'Pas de Calais','62',1),
	(1177,74,'Puy de D&ocirc;me','63',1),
	(1178,74,'Pyr&eacute;n&eacute;es Atlantiques','64',1),
	(1179,74,'Hautes Pyr&eacute;n&eacute;es','65',1),
	(1180,74,'Pyr&eacute;n&eacute;es Orientales','66',1),
	(1181,74,'Bas Rhin','67',1),
	(1182,74,'Haut Rhin','68',1),
	(1183,74,'Rh&ocirc;ne','69',1),
	(1184,74,'Haute Sa&ocirc;ne','70',1),
	(1185,74,'Sa&ocirc;ne et Loire','71',1),
	(1186,74,'Sarthe','72',1),
	(1187,74,'Savoie','73',1),
	(1188,74,'Haute Savoie','74',1),
	(1189,74,'Paris','75',1),
	(1190,74,'Seine Maritime','76',1),
	(1191,74,'Seine et Marne','77',1),
	(1192,74,'Yvelines','78',1),
	(1193,74,'Deux S&egrave;vres','79',1),
	(1194,74,'Somme','80',1),
	(1195,74,'Tarn','81',1),
	(1196,74,'Tarn et Garonne','82',1),
	(1197,74,'Var','83',1),
	(1198,74,'Vaucluse','84',1),
	(1199,74,'Vend&eacute;e','85',1),
	(1200,74,'Vienne','86',1),
	(1201,74,'Haute Vienne','87',1),
	(1202,74,'Vosges','88',1),
	(1203,74,'Yonne','89',1),
	(1204,74,'Territoire de Belfort','90',1),
	(1205,74,'Essonne','91',1),
	(1206,74,'Hauts de Seine','92',1),
	(1207,74,'Seine St-Denis','93',1),
	(1208,74,'Val de Marne','94',1),
	(1209,74,'Val d\'Oise','95',1),
	(1210,76,'Archipel des Marquises','M',1),
	(1211,76,'Archipel des Tuamotu','T',1),
	(1212,76,'Archipel des Tubuai','I',1),
	(1213,76,'Iles du Vent','V',1),
	(1214,76,'Iles Sous-le-Vent','S',1),
	(1215,77,'Iles Crozet','C',1),
	(1216,77,'Iles Kerguelen','K',1),
	(1217,77,'Ile Amsterdam','A',1),
	(1218,77,'Ile Saint-Paul','P',1),
	(1219,77,'Adelie Land','D',1),
	(1220,78,'Estuaire','ES',1),
	(1221,78,'Haut-Ogooue','HO',1),
	(1222,78,'Moyen-Ogooue','MO',1),
	(1223,78,'Ngounie','NG',1),
	(1224,78,'Nyanga','NY',1),
	(1225,78,'Ogooue-Ivindo','OI',1),
	(1226,78,'Ogooue-Lolo','OL',1),
	(1227,78,'Ogooue-Maritime','OM',1),
	(1228,78,'Woleu-Ntem','WN',1),
	(1229,79,'Banjul','BJ',1),
	(1230,79,'Basse','BS',1),
	(1231,79,'Brikama','BR',1),
	(1232,79,'Janjangbure','JA',1),
	(1233,79,'Kanifeng','KA',1),
	(1234,79,'Kerewan','KE',1),
	(1235,79,'Kuntaur','KU',1),
	(1236,79,'Mansakonko','MA',1),
	(1237,79,'Lower River','LR',1),
	(1238,79,'Central River','CR',1),
	(1239,79,'North Bank','NB',1),
	(1240,79,'Upper River','UR',1),
	(1241,79,'Western','WE',1),
	(1242,80,'Abkhazia','AB',1),
	(1243,80,'Ajaria','AJ',1),
	(1244,80,'Tbilisi','TB',1),
	(1245,80,'Guria','GU',1),
	(1246,80,'Imereti','IM',1),
	(1247,80,'Kakheti','KA',1),
	(1248,80,'Kvemo Kartli','KK',1),
	(1249,80,'Mtskheta-Mtianeti','MM',1),
	(1250,80,'Racha Lechkhumi and Kvemo Svanet','RL',1),
	(1251,80,'Samegrelo-Zemo Svaneti','SZ',1),
	(1252,80,'Samtskhe-Javakheti','SJ',1),
	(1253,80,'Shida Kartli','SK',1),
	(1254,81,'Baden-Württemberg','BAW',1),
	(1255,81,'Bayern','BAY',1),
	(1256,81,'Berlin','BER',1),
	(1257,81,'Brandenburg','BRG',1),
	(1258,81,'Bremen','BRE',1),
	(1259,81,'Hamburg','HAM',1),
	(1260,81,'Hessen','HES',1),
	(1261,81,'Mecklenburg-Vorpommern','MEC',1),
	(1262,81,'Niedersachsen','NDS',1),
	(1263,81,'Nordrhein-Westfalen','NRW',1),
	(1264,81,'Rheinland-Pfalz','RHE',1),
	(1265,81,'Saarland','SAR',1),
	(1266,81,'Sachsen','SAS',1),
	(1267,81,'Sachsen-Anhalt','SAC',1),
	(1268,81,'Schleswig-Holstein','SCN',1),
	(1269,81,'Thüringen','THE',1),
	(1270,82,'Ashanti Region','AS',1),
	(1271,82,'Brong-Ahafo Region','BA',1),
	(1272,82,'Central Region','CE',1),
	(1273,82,'Eastern Region','EA',1),
	(1274,82,'Greater Accra Region','GA',1),
	(1275,82,'Northern Region','NO',1),
	(1276,82,'Upper East Region','UE',1),
	(1277,82,'Upper West Region','UW',1),
	(1278,82,'Volta Region','VO',1),
	(1279,82,'Western Region','WE',1),
	(1280,84,'Attica','AT',1),
	(1281,84,'Central Greece','CN',1),
	(1282,84,'Central Macedonia','CM',1),
	(1283,84,'Crete','CR',1),
	(1284,84,'East Macedonia and Thrace','EM',1),
	(1285,84,'Epirus','EP',1),
	(1286,84,'Ionian Islands','II',1),
	(1287,84,'North Aegean','NA',1),
	(1288,84,'Peloponnesos','PP',1),
	(1289,84,'South Aegean','SA',1),
	(1290,84,'Thessaly','TH',1),
	(1291,84,'West Greece','WG',1),
	(1292,84,'West Macedonia','WM',1),
	(1293,85,'Avannaa','A',1),
	(1294,85,'Tunu','T',1),
	(1295,85,'Kitaa','K',1),
	(1296,86,'Saint Andrew','A',1),
	(1297,86,'Saint David','D',1),
	(1298,86,'Saint George','G',1),
	(1299,86,'Saint John','J',1),
	(1300,86,'Saint Mark','M',1),
	(1301,86,'Saint Patrick','P',1),
	(1302,86,'Carriacou','C',1),
	(1303,86,'Petit Martinique','Q',1),
	(1304,89,'Alta Verapaz','AV',1),
	(1305,89,'Baja Verapaz','BV',1),
	(1306,89,'Chimaltenango','CM',1),
	(1307,89,'Chiquimula','CQ',1),
	(1308,89,'El Peten','PE',1),
	(1309,89,'El Progreso','PR',1),
	(1310,89,'El Quiche','QC',1),
	(1311,89,'Escuintla','ES',1),
	(1312,89,'Guatemala','GU',1),
	(1313,89,'Huehuetenango','HU',1),
	(1314,89,'Izabal','IZ',1),
	(1315,89,'Jalapa','JA',1),
	(1316,89,'Jutiapa','JU',1),
	(1317,89,'Quetzaltenango','QZ',1),
	(1318,89,'Retalhuleu','RE',1),
	(1319,89,'Sacatepequez','ST',1),
	(1320,89,'San Marcos','SM',1),
	(1321,89,'Santa Rosa','SR',1),
	(1322,89,'Solola','SO',1),
	(1323,89,'Suchitepequez','SU',1),
	(1324,89,'Totonicapan','TO',1),
	(1325,89,'Zacapa','ZA',1),
	(1326,90,'Conakry','CNK',1),
	(1327,90,'Beyla','BYL',1),
	(1328,90,'Boffa','BFA',1),
	(1329,90,'Boke','BOK',1),
	(1330,90,'Coyah','COY',1),
	(1331,90,'Dabola','DBL',1),
	(1332,90,'Dalaba','DLB',1),
	(1333,90,'Dinguiraye','DGR',1),
	(1334,90,'Dubreka','DBR',1),
	(1335,90,'Faranah','FRN',1),
	(1336,90,'Forecariah','FRC',1),
	(1337,90,'Fria','FRI',1),
	(1338,90,'Gaoual','GAO',1),
	(1339,90,'Gueckedou','GCD',1),
	(1340,90,'Kankan','KNK',1),
	(1341,90,'Kerouane','KRN',1),
	(1342,90,'Kindia','KND',1),
	(1343,90,'Kissidougou','KSD',1),
	(1344,90,'Koubia','KBA',1),
	(1345,90,'Koundara','KDA',1),
	(1346,90,'Kouroussa','KRA',1),
	(1347,90,'Labe','LAB',1),
	(1348,90,'Lelouma','LLM',1),
	(1349,90,'Lola','LOL',1),
	(1350,90,'Macenta','MCT',1),
	(1351,90,'Mali','MAL',1),
	(1352,90,'Mamou','MAM',1),
	(1353,90,'Mandiana','MAN',1),
	(1354,90,'Nzerekore','NZR',1),
	(1355,90,'Pita','PIT',1),
	(1356,90,'Siguiri','SIG',1),
	(1357,90,'Telimele','TLM',1),
	(1358,90,'Tougue','TOG',1),
	(1359,90,'Yomou','YOM',1),
	(1360,91,'Bafata Region','BF',1),
	(1361,91,'Biombo Region','BB',1),
	(1362,91,'Bissau Region','BS',1),
	(1363,91,'Bolama Region','BL',1),
	(1364,91,'Cacheu Region','CA',1),
	(1365,91,'Gabu Region','GA',1),
	(1366,91,'Oio Region','OI',1),
	(1367,91,'Quinara Region','QU',1),
	(1368,91,'Tombali Region','TO',1),
	(1369,92,'Barima-Waini','BW',1),
	(1370,92,'Cuyuni-Mazaruni','CM',1),
	(1371,92,'Demerara-Mahaica','DM',1),
	(1372,92,'East Berbice-Corentyne','EC',1),
	(1373,92,'Essequibo Islands-West Demerara','EW',1),
	(1374,92,'Mahaica-Berbice','MB',1),
	(1375,92,'Pomeroon-Supenaam','PM',1),
	(1376,92,'Potaro-Siparuni','PI',1),
	(1377,92,'Upper Demerara-Berbice','UD',1),
	(1378,92,'Upper Takutu-Upper Essequibo','UT',1),
	(1379,93,'Artibonite','AR',1),
	(1380,93,'Centre','CE',1),
	(1381,93,'Grand\'Anse','GA',1),
	(1382,93,'Nord','ND',1),
	(1383,93,'Nord-Est','NE',1),
	(1384,93,'Nord-Ouest','NO',1),
	(1385,93,'Ouest','OU',1),
	(1386,93,'Sud','SD',1),
	(1387,93,'Sud-Est','SE',1),
	(1388,94,'Flat Island','F',1),
	(1389,94,'McDonald Island','M',1),
	(1390,94,'Shag Island','S',1),
	(1391,94,'Heard Island','H',1),
	(1392,95,'Atlantida','AT',1),
	(1393,95,'Choluteca','CH',1),
	(1394,95,'Colon','CL',1),
	(1395,95,'Comayagua','CM',1),
	(1396,95,'Copan','CP',1),
	(1397,95,'Cortes','CR',1),
	(1398,95,'El Paraiso','PA',1),
	(1399,95,'Francisco Morazan','FM',1),
	(1400,95,'Gracias a Dios','GD',1),
	(1401,95,'Intibuca','IN',1),
	(1402,95,'Islas de la Bahia (Bay Islands)','IB',1),
	(1403,95,'La Paz','PZ',1),
	(1404,95,'Lempira','LE',1),
	(1405,95,'Ocotepeque','OC',1),
	(1406,95,'Olancho','OL',1),
	(1407,95,'Santa Barbara','SB',1),
	(1408,95,'Valle','VA',1),
	(1409,95,'Yoro','YO',1),
	(1410,96,'Central and Western Hong Kong Island','HCW',1),
	(1411,96,'Eastern Hong Kong Island','HEA',1),
	(1412,96,'Southern Hong Kong Island','HSO',1),
	(1413,96,'Wan Chai Hong Kong Island','HWC',1),
	(1414,96,'Kowloon City Kowloon','KKC',1),
	(1415,96,'Kwun Tong Kowloon','KKT',1),
	(1416,96,'Sham Shui Po Kowloon','KSS',1),
	(1417,96,'Wong Tai Sin Kowloon','KWT',1),
	(1418,96,'Yau Tsim Mong Kowloon','KYT',1),
	(1419,96,'Islands New Territories','NIS',1),
	(1420,96,'Kwai Tsing New Territories','NKT',1),
	(1421,96,'North New Territories','NNO',1),
	(1422,96,'Sai Kung New Territories','NSK',1),
	(1423,96,'Sha Tin New Territories','NST',1),
	(1424,96,'Tai Po New Territories','NTP',1),
	(1425,96,'Tsuen Wan New Territories','NTW',1),
	(1426,96,'Tuen Mun New Territories','NTM',1),
	(1427,96,'Yuen Long New Territories','NYL',1),
	(1467,98,'Austurland','AL',1),
	(1468,98,'Hofuoborgarsvaeoi','HF',1),
	(1469,98,'Norourland eystra','NE',1),
	(1470,98,'Norourland vestra','NV',1),
	(1471,98,'Suourland','SL',1),
	(1472,98,'Suournes','SN',1),
	(1473,98,'Vestfiroir','VF',1),
	(1474,98,'Vesturland','VL',1),
	(1475,99,'Andaman and Nicobar Islands','AN',1),
	(1476,99,'Andhra Pradesh','AP',1),
	(1477,99,'Arunachal Pradesh','AR',1),
	(1478,99,'Assam','AS',1),
	(1479,99,'Bihar','BI',1),
	(1480,99,'Chandigarh','CH',1),
	(1481,99,'Dadra and Nagar Haveli','DA',1),
	(1482,99,'Daman and Diu','DM',1),
	(1483,99,'Delhi','DE',1),
	(1484,99,'Goa','GO',1),
	(1485,99,'Gujarat','GU',1),
	(1486,99,'Haryana','HA',1),
	(1487,99,'Himachal Pradesh','HP',1),
	(1488,99,'Jammu and Kashmir','JA',1),
	(1489,99,'Karnataka','KA',1),
	(1490,99,'Kerala','KE',1),
	(1491,99,'Lakshadweep Islands','LI',1),
	(1492,99,'Madhya Pradesh','MP',1),
	(1493,99,'Maharashtra','MA',1),
	(1494,99,'Manipur','MN',1),
	(1495,99,'Meghalaya','ME',1),
	(1496,99,'Mizoram','MI',1),
	(1497,99,'Nagaland','NA',1),
	(1498,99,'Orissa','OR',1),
	(1499,99,'Puducherry','PO',1),
	(1500,99,'Punjab','PU',1),
	(1501,99,'Rajasthan','RA',1),
	(1502,99,'Sikkim','SI',1),
	(1503,99,'Tamil Nadu','TN',1),
	(1504,99,'Tripura','TR',1),
	(1505,99,'Uttar Pradesh','UP',1),
	(1506,99,'West Bengal','WB',1),
	(1507,100,'Aceh','AC',1),
	(1508,100,'Bali','BA',1),
	(1509,100,'Banten','BT',1),
	(1510,100,'Bengkulu','BE',1),
	(1511,100,'Kalimantan Utara','BD',1),
	(1512,100,'Gorontalo','GO',1),
	(1513,100,'Jakarta','JK',1),
	(1514,100,'Jambi','JA',1),
	(1515,100,'Jawa Barat','JB',1),
	(1516,100,'Jawa Tengah','JT',1),
	(1517,100,'Jawa Timur','JI',1),
	(1518,100,'Kalimantan Barat','KB',1),
	(1519,100,'Kalimantan Selatan','KS',1),
	(1520,100,'Kalimantan Tengah','KT',1),
	(1521,100,'Kalimantan Timur','KI',1),
	(1522,100,'Kepulauan Bangka Belitung','BB',1),
	(1523,100,'Lampung','LA',1),
	(1524,100,'Maluku','MA',1),
	(1525,100,'Maluku Utara','MU',1),
	(1526,100,'Nusa Tenggara Barat','NB',1),
	(1527,100,'Nusa Tenggara Timur','NT',1),
	(1528,100,'Papua','PA',1),
	(1529,100,'Riau','RI',1),
	(1530,100,'Sulawesi Selatan','SN',1),
	(1531,100,'Sulawesi Tengah','ST',1),
	(1532,100,'Sulawesi Tenggara','SG',1),
	(1533,100,'Sulawesi Utara','SA',1),
	(1534,100,'Sumatera Barat','SB',1),
	(1535,100,'Sumatera Selatan','SS',1),
	(1536,100,'Sumatera Utara','SU',1),
	(1537,100,'Yogyakarta','YO',1),
	(1538,101,'Tehran','TEH',1),
	(1539,101,'Qom','QOM',1),
	(1540,101,'Markazi','MKZ',1),
	(1541,101,'Qazvin','QAZ',1),
	(1542,101,'Gilan','GIL',1),
	(1543,101,'Ardabil','ARD',1),
	(1544,101,'Zanjan','ZAN',1),
	(1545,101,'East Azarbaijan','EAZ',1),
	(1546,101,'West Azarbaijan','WEZ',1),
	(1547,101,'Kurdistan','KRD',1),
	(1548,101,'Hamadan','HMD',1),
	(1549,101,'Kermanshah','KRM',1),
	(1550,101,'Ilam','ILM',1),
	(1551,101,'Lorestan','LRS',1),
	(1552,101,'Khuzestan','KZT',1),
	(1553,101,'Chahar Mahaal and Bakhtiari','CMB',1),
	(1554,101,'Kohkiluyeh and Buyer Ahmad','KBA',1),
	(1555,101,'Bushehr','BSH',1),
	(1556,101,'Fars','FAR',1),
	(1557,101,'Hormozgan','HRM',1),
	(1558,101,'Sistan and Baluchistan','SBL',1),
	(1559,101,'Kerman','KRB',1),
	(1560,101,'Yazd','YZD',1),
	(1561,101,'Esfahan','EFH',1),
	(1562,101,'Semnan','SMN',1),
	(1563,101,'Mazandaran','MZD',1),
	(1564,101,'Golestan','GLS',1),
	(1565,101,'North Khorasan','NKH',1),
	(1566,101,'Razavi Khorasan','RKH',1),
	(1567,101,'South Khorasan','SKH',1),
	(1568,102,'Baghdad','BD',1),
	(1569,102,'Salah ad Din','SD',1),
	(1570,102,'Diyala','DY',1),
	(1571,102,'Wasit','WS',1),
	(1572,102,'Maysan','MY',1),
	(1573,102,'Al Basrah','BA',1),
	(1574,102,'Dhi Qar','DQ',1),
	(1575,102,'Al Muthanna','MU',1),
	(1576,102,'Al Qadisyah','QA',1),
	(1577,102,'Babil','BB',1),
	(1578,102,'Al Karbala','KB',1),
	(1579,102,'An Najaf','NJ',1),
	(1580,102,'Al Anbar','AB',1),
	(1581,102,'Ninawa','NN',1),
	(1582,102,'Dahuk','DH',1),
	(1583,102,'Arbil','AL',1),
	(1584,102,'At Ta\'mim','TM',1),
	(1585,102,'As Sulaymaniyah','SL',1),
	(1586,103,'Carlow','CA',1),
	(1587,103,'Cavan','CV',1),
	(1588,103,'Clare','CL',1),
	(1589,103,'Cork','CO',1),
	(1590,103,'Donegal','DO',1),
	(1591,103,'Dublin','DU',1),
	(1592,103,'Galway','GA',1),
	(1593,103,'Kerry','KE',1),
	(1594,103,'Kildare','KI',1),
	(1595,103,'Kilkenny','KL',1),
	(1596,103,'Laois','LA',1),
	(1597,103,'Leitrim','LE',1),
	(1598,103,'Limerick','LI',1),
	(1599,103,'Longford','LO',1),
	(1600,103,'Louth','LU',1),
	(1601,103,'Mayo','MA',1),
	(1602,103,'Meath','ME',1),
	(1603,103,'Monaghan','MO',1),
	(1604,103,'Offaly','OF',1),
	(1605,103,'Roscommon','RO',1),
	(1606,103,'Sligo','SL',1),
	(1607,103,'Tipperary','TI',1),
	(1608,103,'Waterford','WA',1),
	(1609,103,'Westmeath','WE',1),
	(1610,103,'Wexford','WX',1),
	(1611,103,'Wicklow','WI',1),
	(1612,104,'Be\'er Sheva','BS',1),
	(1613,104,'Bika\'at Hayarden','BH',1),
	(1614,104,'Eilat and Arava','EA',1),
	(1615,104,'Galil','GA',1),
	(1616,104,'Haifa','HA',1),
	(1617,104,'Jehuda Mountains','JM',1),
	(1618,104,'Jerusalem','JE',1),
	(1619,104,'Negev','NE',1),
	(1620,104,'Semaria','SE',1),
	(1621,104,'Sharon','SH',1),
	(1622,104,'Tel Aviv (Gosh Dan)','TA',1),
	(3860,105,'Caltanissetta','CL',1),
	(3842,105,'Agrigento','AG',1),
	(3843,105,'Alessandria','AL',1),
	(3844,105,'Ancona','AN',1),
	(3845,105,'Aosta','AO',1),
	(3846,105,'Arezzo','AR',1),
	(3847,105,'Ascoli Piceno','AP',1),
	(3848,105,'Asti','AT',1),
	(3849,105,'Avellino','AV',1),
	(3850,105,'Bari','BA',1),
	(3851,105,'Belluno','BL',1),
	(3852,105,'Benevento','BN',1),
	(3853,105,'Bergamo','BG',1),
	(3854,105,'Biella','BI',1),
	(3855,105,'Bologna','BO',1),
	(3856,105,'Bolzano','BZ',1),
	(3857,105,'Brescia','BS',1),
	(3858,105,'Brindisi','BR',1),
	(3859,105,'Cagliari','CA',1),
	(1643,106,'Clarendon Parish','CLA',1),
	(1644,106,'Hanover Parish','HAN',1),
	(1645,106,'Kingston Parish','KIN',1),
	(1646,106,'Manchester Parish','MAN',1),
	(1647,106,'Portland Parish','POR',1),
	(1648,106,'Saint Andrew Parish','AND',1),
	(1649,106,'Saint Ann Parish','ANN',1),
	(1650,106,'Saint Catherine Parish','CAT',1),
	(1651,106,'Saint Elizabeth Parish','ELI',1),
	(1652,106,'Saint James Parish','JAM',1),
	(1653,106,'Saint Mary Parish','MAR',1),
	(1654,106,'Saint Thomas Parish','THO',1),
	(1655,106,'Trelawny Parish','TRL',1),
	(1656,106,'Westmoreland Parish','WML',1),
	(1657,107,'Aichi','AI',1),
	(1658,107,'Akita','AK',1),
	(1659,107,'Aomori','AO',1),
	(1660,107,'Chiba','CH',1),
	(1661,107,'Ehime','EH',1),
	(1662,107,'Fukui','FK',1),
	(1663,107,'Fukuoka','FU',1),
	(1664,107,'Fukushima','FS',1),
	(1665,107,'Gifu','GI',1),
	(1666,107,'Gumma','GU',1),
	(1667,107,'Hiroshima','HI',1),
	(1668,107,'Hokkaido','HO',1),
	(1669,107,'Hyogo','HY',1),
	(1670,107,'Ibaraki','IB',1),
	(1671,107,'Ishikawa','IS',1),
	(1672,107,'Iwate','IW',1),
	(1673,107,'Kagawa','KA',1),
	(1674,107,'Kagoshima','KG',1),
	(1675,107,'Kanagawa','KN',1),
	(1676,107,'Kochi','KO',1),
	(1677,107,'Kumamoto','KU',1),
	(1678,107,'Kyoto','KY',1),
	(1679,107,'Mie','MI',1),
	(1680,107,'Miyagi','MY',1),
	(1681,107,'Miyazaki','MZ',1),
	(1682,107,'Nagano','NA',1),
	(1683,107,'Nagasaki','NG',1),
	(1684,107,'Nara','NR',1),
	(1685,107,'Niigata','NI',1),
	(1686,107,'Oita','OI',1),
	(1687,107,'Okayama','OK',1),
	(1688,107,'Okinawa','ON',1),
	(1689,107,'Osaka','OS',1),
	(1690,107,'Saga','SA',1),
	(1691,107,'Saitama','SI',1),
	(1692,107,'Shiga','SH',1),
	(1693,107,'Shimane','SM',1),
	(1694,107,'Shizuoka','SZ',1),
	(1695,107,'Tochigi','TO',1),
	(1696,107,'Tokushima','TS',1),
	(1697,107,'Tokyo','TK',1),
	(1698,107,'Tottori','TT',1),
	(1699,107,'Toyama','TY',1),
	(1700,107,'Wakayama','WA',1),
	(1701,107,'Yamagata','YA',1),
	(1702,107,'Yamaguchi','YM',1),
	(1703,107,'Yamanashi','YN',1),
	(1704,108,'\'Amman','AM',1),
	(1705,108,'Ajlun','AJ',1),
	(1706,108,'Al \'Aqabah','AA',1),
	(1707,108,'Al Balqa\'','AB',1),
	(1708,108,'Al Karak','AK',1),
	(1709,108,'Al Mafraq','AL',1),
	(1710,108,'At Tafilah','AT',1),
	(1711,108,'Az Zarqa\'','AZ',1),
	(1712,108,'Irbid','IR',1),
	(1713,108,'Jarash','JA',1),
	(1714,108,'Ma\'an','MA',1),
	(1715,108,'Madaba','MD',1),
	(1716,109,'Almaty','AL',1),
	(1717,109,'Almaty City','AC',1),
	(1718,109,'Aqmola','AM',1),
	(1719,109,'Aqtobe','AQ',1),
	(1720,109,'Astana City','AS',1),
	(1721,109,'Atyrau','AT',1),
	(1722,109,'Batys Qazaqstan','BA',1),
	(1723,109,'Bayqongyr City','BY',1),
	(1724,109,'Mangghystau','MA',1),
	(1725,109,'Ongtustik Qazaqstan','ON',1),
	(1726,109,'Pavlodar','PA',1),
	(1727,109,'Qaraghandy','QA',1),
	(1728,109,'Qostanay','QO',1),
	(1729,109,'Qyzylorda','QY',1),
	(1730,109,'Shyghys Qazaqstan','SH',1),
	(1731,109,'Soltustik Qazaqstan','SO',1),
	(1732,109,'Zhambyl','ZH',1),
	(1733,110,'Central','CE',1),
	(1734,110,'Coast','CO',1),
	(1735,110,'Eastern','EA',1),
	(1736,110,'Nairobi Area','NA',1),
	(1737,110,'North Eastern','NE',1),
	(1738,110,'Nyanza','NY',1),
	(1739,110,'Rift Valley','RV',1),
	(1740,110,'Western','WE',1),
	(1741,111,'Abaiang','AG',1),
	(1742,111,'Abemama','AM',1),
	(1743,111,'Aranuka','AK',1),
	(1744,111,'Arorae','AO',1),
	(1745,111,'Banaba','BA',1),
	(1746,111,'Beru','BE',1),
	(1747,111,'Butaritari','bT',1),
	(1748,111,'Kanton','KA',1),
	(1749,111,'Kiritimati','KR',1),
	(1750,111,'Kuria','KU',1),
	(1751,111,'Maiana','MI',1),
	(1752,111,'Makin','MN',1),
	(1753,111,'Marakei','ME',1),
	(1754,111,'Nikunau','NI',1),
	(1755,111,'Nonouti','NO',1),
	(1756,111,'Onotoa','ON',1),
	(1757,111,'Tabiteuea','TT',1),
	(1758,111,'Tabuaeran','TR',1),
	(1759,111,'Tamana','TM',1),
	(1760,111,'Tarawa','TW',1),
	(1761,111,'Teraina','TE',1),
	(1762,112,'Chagang-do','CHA',1),
	(1763,112,'Hamgyong-bukto','HAB',1),
	(1764,112,'Hamgyong-namdo','HAN',1),
	(1765,112,'Hwanghae-bukto','HWB',1),
	(1766,112,'Hwanghae-namdo','HWN',1),
	(1767,112,'Kangwon-do','KAN',1),
	(1768,112,'P\'yongan-bukto','PYB',1),
	(1769,112,'P\'yongan-namdo','PYN',1),
	(1770,112,'Ryanggang-do (Yanggang-do)','YAN',1),
	(1771,112,'Rason Directly Governed City','NAJ',1),
	(1772,112,'P\'yongyang Special City','PYO',1),
	(1773,113,'Ch\'ungch\'ong-bukto','CO',1),
	(1774,113,'Ch\'ungch\'ong-namdo','CH',1),
	(1775,113,'Cheju-do','CD',1),
	(1776,113,'Cholla-bukto','CB',1),
	(1777,113,'Cholla-namdo','CN',1),
	(1778,113,'Inch\'on-gwangyoksi','IG',1),
	(1779,113,'Kangwon-do','KA',1),
	(1780,113,'Kwangju-gwangyoksi','KG',1),
	(1781,113,'Kyonggi-do','KD',1),
	(1782,113,'Kyongsang-bukto','KB',1),
	(1783,113,'Kyongsang-namdo','KN',1),
	(1784,113,'Pusan-gwangyoksi','PG',1),
	(1785,113,'Soul-t\'ukpyolsi','SO',1),
	(1786,113,'Taegu-gwangyoksi','TA',1),
	(1787,113,'Taejon-gwangyoksi','TG',1),
	(1788,114,'Al \'Asimah','AL',1),
	(1789,114,'Al Ahmadi','AA',1),
	(1790,114,'Al Farwaniyah','AF',1),
	(1791,114,'Al Jahra\'','AJ',1),
	(1792,114,'Hawalli','HA',1),
	(1793,115,'Bishkek','GB',1),
	(1794,115,'Batken','B',1),
	(1795,115,'Chu','C',1),
	(1796,115,'Jalal-Abad','J',1),
	(1797,115,'Naryn','N',1),
	(1798,115,'Osh','O',1),
	(1799,115,'Talas','T',1),
	(1800,115,'Ysyk-Kol','Y',1),
	(1801,116,'Vientiane','VT',1),
	(1802,116,'Attapu','AT',1),
	(1803,116,'Bokeo','BK',1),
	(1804,116,'Bolikhamxai','BL',1),
	(1805,116,'Champasak','CH',1),
	(1806,116,'Houaphan','HO',1),
	(1807,116,'Khammouan','KH',1),
	(1808,116,'Louang Namtha','LM',1),
	(1809,116,'Louangphabang','LP',1),
	(1810,116,'Oudomxai','OU',1),
	(1811,116,'Phongsali','PH',1),
	(1812,116,'Salavan','SL',1),
	(1813,116,'Savannakhet','SV',1),
	(1814,116,'Vientiane','VI',1),
	(1815,116,'Xaignabouli','XA',1),
	(1816,116,'Xekong','XE',1),
	(1817,116,'Xiangkhoang','XI',1),
	(1818,116,'Xaisomboun','XN',1),
	(1852,119,'Berea','BE',1),
	(1853,119,'Butha-Buthe','BB',1),
	(1854,119,'Leribe','LE',1),
	(1855,119,'Mafeteng','MF',1),
	(1856,119,'Maseru','MS',1),
	(1857,119,'Mohale\'s Hoek','MH',1),
	(1858,119,'Mokhotlong','MK',1),
	(1859,119,'Qacha\'s Nek','QN',1),
	(1860,119,'Quthing','QT',1),
	(1861,119,'Thaba-Tseka','TT',1),
	(1862,120,'Bomi','BI',1),
	(1863,120,'Bong','BG',1),
	(1864,120,'Grand Bassa','GB',1),
	(1865,120,'Grand Cape Mount','CM',1),
	(1866,120,'Grand Gedeh','GG',1),
	(1867,120,'Grand Kru','GK',1),
	(1868,120,'Lofa','LO',1),
	(1869,120,'Margibi','MG',1),
	(1870,120,'Maryland','ML',1),
	(1871,120,'Montserrado','MS',1),
	(1872,120,'Nimba','NB',1),
	(1873,120,'River Cess','RC',1),
	(1874,120,'Sinoe','SN',1),
	(1875,121,'Ajdabiya','AJ',1),
	(1876,121,'Al \'Aziziyah','AZ',1),
	(1877,121,'Al Fatih','FA',1),
	(1878,121,'Al Jabal al Akhdar','JA',1),
	(1879,121,'Al Jufrah','JU',1),
	(1880,121,'Al Khums','KH',1),
	(1881,121,'Al Kufrah','KU',1),
	(1882,121,'An Nuqat al Khams','NK',1),
	(1883,121,'Ash Shati\'','AS',1),
	(1884,121,'Awbari','AW',1),
	(1885,121,'Az Zawiyah','ZA',1),
	(1886,121,'Banghazi','BA',1),
	(1887,121,'Darnah','DA',1),
	(1888,121,'Ghadamis','GD',1),
	(1889,121,'Gharyan','GY',1),
	(1890,121,'Misratah','MI',1),
	(1891,121,'Murzuq','MZ',1),
	(1892,121,'Sabha','SB',1),
	(1893,121,'Sawfajjin','SW',1),
	(1894,121,'Surt','SU',1),
	(1895,121,'Tarabulus (Tripoli)','TL',1),
	(1896,121,'Tarhunah','TH',1),
	(1897,121,'Tubruq','TU',1),
	(1898,121,'Yafran','YA',1),
	(1899,121,'Zlitan','ZL',1),
	(1900,122,'Vaduz','V',1),
	(1901,122,'Schaan','A',1),
	(1902,122,'Balzers','B',1),
	(1903,122,'Triesen','N',1),
	(1904,122,'Eschen','E',1),
	(1905,122,'Mauren','M',1),
	(1906,122,'Triesenberg','T',1),
	(1907,122,'Ruggell','R',1),
	(1908,122,'Gamprin','G',1),
	(1909,122,'Schellenberg','L',1),
	(1910,122,'Planken','P',1),
	(1911,123,'Alytus','AL',1),
	(1912,123,'Kaunas','KA',1),
	(1913,123,'Klaipeda','KL',1),
	(1914,123,'Marijampole','MA',1),
	(1915,123,'Panevezys','PA',1),
	(1916,123,'Siauliai','SI',1),
	(1917,123,'Taurage','TA',1),
	(1918,123,'Telsiai','TE',1),
	(1919,123,'Utena','UT',1),
	(1920,123,'Vilnius','VI',1),
	(1921,124,'Diekirch','DD',1),
	(1922,124,'Clervaux','DC',1),
	(1923,124,'Redange','DR',1),
	(1924,124,'Vianden','DV',1),
	(1925,124,'Wiltz','DW',1),
	(1926,124,'Grevenmacher','GG',1),
	(1927,124,'Echternach','GE',1),
	(1928,124,'Remich','GR',1),
	(1929,124,'Luxembourg','LL',1),
	(1930,124,'Capellen','LC',1),
	(1931,124,'Esch-sur-Alzette','LE',1),
	(1932,124,'Mersch','LM',1),
	(1933,125,'Our Lady Fatima Parish','OLF',1),
	(1934,125,'St. Anthony Parish','ANT',1),
	(1935,125,'St. Lazarus Parish','LAZ',1),
	(1936,125,'Cathedral Parish','CAT',1),
	(1937,125,'St. Lawrence Parish','LAW',1),
	(1938,127,'Antananarivo','AN',1),
	(1939,127,'Antsiranana','AS',1),
	(1940,127,'Fianarantsoa','FN',1),
	(1941,127,'Mahajanga','MJ',1),
	(1942,127,'Toamasina','TM',1),
	(1943,127,'Toliara','TL',1),
	(1944,128,'Balaka','BLK',1),
	(1945,128,'Blantyre','BLT',1),
	(1946,128,'Chikwawa','CKW',1),
	(1947,128,'Chiradzulu','CRD',1),
	(1948,128,'Chitipa','CTP',1),
	(1949,128,'Dedza','DDZ',1),
	(1950,128,'Dowa','DWA',1),
	(1951,128,'Karonga','KRG',1),
	(1952,128,'Kasungu','KSG',1),
	(1953,128,'Likoma','LKM',1),
	(1954,128,'Lilongwe','LLG',1),
	(1955,128,'Machinga','MCG',1),
	(1956,128,'Mangochi','MGC',1),
	(1957,128,'Mchinji','MCH',1),
	(1958,128,'Mulanje','MLJ',1),
	(1959,128,'Mwanza','MWZ',1),
	(1960,128,'Mzimba','MZM',1),
	(1961,128,'Ntcheu','NTU',1),
	(1962,128,'Nkhata Bay','NKB',1),
	(1963,128,'Nkhotakota','NKH',1),
	(1964,128,'Nsanje','NSJ',1),
	(1965,128,'Ntchisi','NTI',1),
	(1966,128,'Phalombe','PHL',1),
	(1967,128,'Rumphi','RMP',1),
	(1968,128,'Salima','SLM',1),
	(1969,128,'Thyolo','THY',1),
	(1970,128,'Zomba','ZBA',1),
	(1971,129,'Johor','MY-01',1),
	(1972,129,'Kedah','MY-02',1),
	(1973,129,'Kelantan','MY-03',1),
	(1974,129,'Labuan','MY-15',1),
	(1975,129,'Melaka','MY-04',1),
	(1976,129,'Negeri Sembilan','MY-05',1),
	(1977,129,'Pahang','MY-06',1),
	(1978,129,'Perak','MY-08',1),
	(1979,129,'Perlis','MY-09',1),
	(1980,129,'Pulau Pinang','MY-07',1),
	(1981,129,'Sabah','MY-12',1),
	(1982,129,'Sarawak','MY-13',1),
	(1983,129,'Selangor','MY-10',1),
	(1984,129,'Terengganu','MY-11',1),
	(1985,129,'Kuala Lumpur','MY-14',1),
	(4035,129,'Putrajaya','MY-16',1),
	(1986,130,'Thiladhunmathi Uthuru','THU',1),
	(1987,130,'Thiladhunmathi Dhekunu','THD',1),
	(1988,130,'Miladhunmadulu Uthuru','MLU',1),
	(1989,130,'Miladhunmadulu Dhekunu','MLD',1),
	(1990,130,'Maalhosmadulu Uthuru','MAU',1),
	(1991,130,'Maalhosmadulu Dhekunu','MAD',1),
	(1992,130,'Faadhippolhu','FAA',1),
	(1993,130,'Male Atoll','MAA',1),
	(1994,130,'Ari Atoll Uthuru','AAU',1),
	(1995,130,'Ari Atoll Dheknu','AAD',1),
	(1996,130,'Felidhe Atoll','FEA',1),
	(1997,130,'Mulaku Atoll','MUA',1),
	(1998,130,'Nilandhe Atoll Uthuru','NAU',1),
	(1999,130,'Nilandhe Atoll Dhekunu','NAD',1),
	(2000,130,'Kolhumadulu','KLH',1),
	(2001,130,'Hadhdhunmathi','HDH',1),
	(2002,130,'Huvadhu Atoll Uthuru','HAU',1),
	(2003,130,'Huvadhu Atoll Dhekunu','HAD',1),
	(2004,130,'Fua Mulaku','FMU',1),
	(2005,130,'Addu','ADD',1),
	(2006,131,'Gao','GA',1),
	(2007,131,'Kayes','KY',1),
	(2008,131,'Kidal','KD',1),
	(2009,131,'Koulikoro','KL',1),
	(2010,131,'Mopti','MP',1),
	(2011,131,'Segou','SG',1),
	(2012,131,'Sikasso','SK',1),
	(2013,131,'Tombouctou','TB',1),
	(2014,131,'Bamako Capital District','CD',1),
	(2015,132,'Attard','ATT',1),
	(2016,132,'Balzan','BAL',1),
	(2017,132,'Birgu','BGU',1),
	(2018,132,'Birkirkara','BKK',1),
	(2019,132,'Birzebbuga','BRZ',1),
	(2020,132,'Bormla','BOR',1),
	(2021,132,'Dingli','DIN',1),
	(2022,132,'Fgura','FGU',1),
	(2023,132,'Floriana','FLO',1),
	(2024,132,'Gudja','GDJ',1),
	(2025,132,'Gzira','GZR',1),
	(2026,132,'Gargur','GRG',1),
	(2027,132,'Gaxaq','GXQ',1),
	(2028,132,'Hamrun','HMR',1),
	(2029,132,'Iklin','IKL',1),
	(2030,132,'Isla','ISL',1),
	(2031,132,'Kalkara','KLK',1),
	(2032,132,'Kirkop','KRK',1),
	(2033,132,'Lija','LIJ',1),
	(2034,132,'Luqa','LUQ',1),
	(2035,132,'Marsa','MRS',1),
	(2036,132,'Marsaskala','MKL',1),
	(2037,132,'Marsaxlokk','MXL',1),
	(2038,132,'Mdina','MDN',1),
	(2039,132,'Melliea','MEL',1),
	(2040,132,'Mgarr','MGR',1),
	(2041,132,'Mosta','MST',1),
	(2042,132,'Mqabba','MQA',1),
	(2043,132,'Msida','MSI',1),
	(2044,132,'Mtarfa','MTF',1),
	(2045,132,'Naxxar','NAX',1),
	(2046,132,'Paola','PAO',1),
	(2047,132,'Pembroke','PEM',1),
	(2048,132,'Pieta','PIE',1),
	(2049,132,'Qormi','QOR',1),
	(2050,132,'Qrendi','QRE',1),
	(2051,132,'Rabat','RAB',1),
	(2052,132,'Safi','SAF',1),
	(2053,132,'San Giljan','SGI',1),
	(2054,132,'Santa Lucija','SLU',1),
	(2055,132,'San Pawl il-Bahar','SPB',1),
	(2056,132,'San Gwann','SGW',1),
	(2057,132,'Santa Venera','SVE',1),
	(2058,132,'Siggiewi','SIG',1),
	(2059,132,'Sliema','SLM',1),
	(2060,132,'Swieqi','SWQ',1),
	(2061,132,'Ta Xbiex','TXB',1),
	(2062,132,'Tarxien','TRX',1),
	(2063,132,'Valletta','VLT',1),
	(2064,132,'Xgajra','XGJ',1),
	(2065,132,'Zabbar','ZBR',1),
	(2066,132,'Zebbug','ZBG',1),
	(2067,132,'Zejtun','ZJT',1),
	(2068,132,'Zurrieq','ZRQ',1),
	(2069,132,'Fontana','FNT',1),
	(2070,132,'Ghajnsielem','GHJ',1),
	(2071,132,'Gharb','GHR',1),
	(2072,132,'Ghasri','GHS',1),
	(2073,132,'Kercem','KRC',1),
	(2074,132,'Munxar','MUN',1),
	(2075,132,'Nadur','NAD',1),
	(2076,132,'Qala','QAL',1),
	(2077,132,'Victoria','VIC',1),
	(2078,132,'San Lawrenz','SLA',1),
	(2079,132,'Sannat','SNT',1),
	(2080,132,'Xagra','ZAG',1),
	(2081,132,'Xewkija','XEW',1),
	(2082,132,'Zebbug','ZEB',1),
	(2083,133,'Ailinginae','ALG',1),
	(2084,133,'Ailinglaplap','ALL',1),
	(2085,133,'Ailuk','ALK',1),
	(2086,133,'Arno','ARN',1),
	(2087,133,'Aur','AUR',1),
	(2088,133,'Bikar','BKR',1),
	(2089,133,'Bikini','BKN',1),
	(2090,133,'Bokak','BKK',1),
	(2091,133,'Ebon','EBN',1),
	(2092,133,'Enewetak','ENT',1),
	(2093,133,'Erikub','EKB',1),
	(2094,133,'Jabat','JBT',1),
	(2095,133,'Jaluit','JLT',1),
	(2096,133,'Jemo','JEM',1),
	(2097,133,'Kili','KIL',1),
	(2098,133,'Kwajalein','KWJ',1),
	(2099,133,'Lae','LAE',1),
	(2100,133,'Lib','LIB',1),
	(2101,133,'Likiep','LKP',1),
	(2102,133,'Majuro','MJR',1),
	(2103,133,'Maloelap','MLP',1),
	(2104,133,'Mejit','MJT',1),
	(2105,133,'Mili','MIL',1),
	(2106,133,'Namorik','NMK',1),
	(2107,133,'Namu','NAM',1),
	(2108,133,'Rongelap','RGL',1),
	(2109,133,'Rongrik','RGK',1),
	(2110,133,'Toke','TOK',1),
	(2111,133,'Ujae','UJA',1),
	(2112,133,'Ujelang','UJL',1),
	(2113,133,'Utirik','UTK',1),
	(2114,133,'Wotho','WTH',1),
	(2115,133,'Wotje','WTJ',1),
	(2116,135,'Adrar','AD',1),
	(2117,135,'Assaba','AS',1),
	(2118,135,'Brakna','BR',1),
	(2119,135,'Dakhlet Nouadhibou','DN',1),
	(2120,135,'Gorgol','GO',1),
	(2121,135,'Guidimaka','GM',1),
	(2122,135,'Hodh Ech Chargui','HC',1),
	(2123,135,'Hodh El Gharbi','HG',1),
	(2124,135,'Inchiri','IN',1),
	(2125,135,'Tagant','TA',1),
	(2126,135,'Tiris Zemmour','TZ',1),
	(2127,135,'Trarza','TR',1),
	(2128,135,'Nouakchott','NO',1),
	(2129,136,'Beau Bassin-Rose Hill','BR',1),
	(2130,136,'Curepipe','CU',1),
	(2131,136,'Port Louis','PU',1),
	(2132,136,'Quatre Bornes','QB',1),
	(2133,136,'Vacoas-Phoenix','VP',1),
	(2134,136,'Agalega Islands','AG',1),
	(2135,136,'Cargados Carajos Shoals (Saint Brandon Islands)','CC',1),
	(2136,136,'Rodrigues','RO',1),
	(2137,136,'Black River','BL',1),
	(2138,136,'Flacq','FL',1),
	(2139,136,'Grand Port','GP',1),
	(2140,136,'Moka','MO',1),
	(2141,136,'Pamplemousses','PA',1),
	(2142,136,'Plaines Wilhems','PW',1),
	(2143,136,'Port Louis','PL',1),
	(2144,136,'Riviere du Rempart','RR',1),
	(2145,136,'Savanne','SA',1),
	(2146,138,'Baja California Norte','BN',1),
	(2147,138,'Baja California Sur','BS',1),
	(2148,138,'Campeche','CA',1),
	(2149,138,'Chiapas','CI',1),
	(2150,138,'Chihuahua','CH',1),
	(2151,138,'Coahuila de Zaragoza','CZ',1),
	(2152,138,'Colima','CL',1),
	(2153,138,'Distrito Federal','DF',1),
	(2154,138,'Durango','DU',1),
	(2155,138,'Guanajuato','GA',1),
	(2156,138,'Guerrero','GE',1),
	(2157,138,'Hidalgo','HI',1),
	(2158,138,'Jalisco','JA',1),
	(2159,138,'Mexico','ME',1),
	(2160,138,'Michoacan de Ocampo','MI',1),
	(2161,138,'Morelos','MO',1),
	(2162,138,'Nayarit','NA',1),
	(2163,138,'Nuevo Leon','NL',1),
	(2164,138,'Oaxaca','OA',1),
	(2165,138,'Puebla','PU',1),
	(2166,138,'Queretaro de Arteaga','QA',1),
	(2167,138,'Quintana Roo','QR',1),
	(2168,138,'San Luis Potosi','SA',1),
	(2169,138,'Sinaloa','SI',1),
	(2170,138,'Sonora','SO',1),
	(2171,138,'Tabasco','TB',1),
	(2172,138,'Tamaulipas','TM',1),
	(2173,138,'Tlaxcala','TL',1),
	(2174,138,'Veracruz-Llave','VE',1),
	(2175,138,'Yucatan','YU',1),
	(2176,138,'Zacatecas','ZA',1),
	(2177,139,'Chuuk','C',1),
	(2178,139,'Kosrae','K',1),
	(2179,139,'Pohnpei','P',1),
	(2180,139,'Yap','Y',1),
	(2181,140,'Gagauzia','GA',1),
	(2182,140,'Chisinau','CU',1),
	(2183,140,'Balti','BA',1),
	(2184,140,'Cahul','CA',1),
	(2185,140,'Edinet','ED',1),
	(2186,140,'Lapusna','LA',1),
	(2187,140,'Orhei','OR',1),
	(2188,140,'Soroca','SO',1),
	(2189,140,'Tighina','TI',1),
	(2190,140,'Ungheni','UN',1),
	(2191,140,'St‚nga Nistrului','SN',1),
	(2192,141,'Fontvieille','FV',1),
	(2193,141,'La Condamine','LC',1),
	(2194,141,'Monaco-Ville','MV',1),
	(2195,141,'Monte-Carlo','MC',1),
	(2196,142,'Ulanbaatar','1',1),
	(2197,142,'Orhon','035',1),
	(2198,142,'Darhan uul','037',1),
	(2199,142,'Hentiy','039',1),
	(2200,142,'Hovsgol','041',1),
	(2201,142,'Hovd','043',1),
	(2202,142,'Uvs','046',1),
	(2203,142,'Tov','047',1),
	(2204,142,'Selenge','049',1),
	(2205,142,'Suhbaatar','051',1),
	(2206,142,'Omnogovi','053',1),
	(2207,142,'Ovorhangay','055',1),
	(2208,142,'Dzavhan','057',1),
	(2209,142,'DundgovL','059',1),
	(2210,142,'Dornod','061',1),
	(2211,142,'Dornogov','063',1),
	(2212,142,'Govi-Sumber','064',1),
	(2213,142,'Govi-Altay','065',1),
	(2214,142,'Bulgan','067',1),
	(2215,142,'Bayanhongor','069',1),
	(2216,142,'Bayan-Olgiy','071',1),
	(2217,142,'Arhangay','073',1),
	(2218,143,'Saint Anthony','A',1),
	(2219,143,'Saint Georges','G',1),
	(2220,143,'Saint Peter','P',1),
	(2221,144,'Agadir','AGD',1),
	(2222,144,'Al Hoceima','HOC',1),
	(2223,144,'Azilal','AZI',1),
	(2224,144,'Beni Mellal','BME',1),
	(2225,144,'Ben Slimane','BSL',1),
	(2226,144,'Boulemane','BLM',1),
	(2227,144,'Casablanca','CBL',1),
	(2228,144,'Chaouen','CHA',1),
	(2229,144,'El Jadida','EJA',1),
	(2230,144,'El Kelaa des Sraghna','EKS',1),
	(2231,144,'Er Rachidia','ERA',1),
	(2232,144,'Essaouira','ESS',1),
	(2233,144,'Fes','FES',1),
	(2234,144,'Figuig','FIG',1),
	(2235,144,'Guelmim','GLM',1),
	(2236,144,'Ifrane','IFR',1),
	(2237,144,'Kenitra','KEN',1),
	(2238,144,'Khemisset','KHM',1),
	(2239,144,'Khenifra','KHN',1),
	(2240,144,'Khouribga','KHO',1),
	(2241,144,'Laayoune','LYN',1),
	(2242,144,'Larache','LAR',1),
	(2243,144,'Marrakech','MRK',1),
	(2244,144,'Meknes','MKN',1),
	(2245,144,'Nador','NAD',1),
	(2246,144,'Ouarzazate','ORZ',1),
	(2247,144,'Oujda','OUJ',1),
	(2248,144,'Rabat-Sale','RSA',1),
	(2249,144,'Safi','SAF',1),
	(2250,144,'Settat','SET',1),
	(2251,144,'Sidi Kacem','SKA',1),
	(2252,144,'Tangier','TGR',1),
	(2253,144,'Tan-Tan','TAN',1),
	(2254,144,'Taounate','TAO',1),
	(2255,144,'Taroudannt','TRD',1),
	(2256,144,'Tata','TAT',1),
	(2257,144,'Taza','TAZ',1),
	(2258,144,'Tetouan','TET',1),
	(2259,144,'Tiznit','TIZ',1),
	(2260,144,'Ad Dakhla','ADK',1),
	(2261,144,'Boujdour','BJD',1),
	(2262,144,'Es Smara','ESM',1),
	(2263,145,'Cabo Delgado','CD',1),
	(2264,145,'Gaza','GZ',1),
	(2265,145,'Inhambane','IN',1),
	(2266,145,'Manica','MN',1),
	(2267,145,'Maputo (city)','MC',1),
	(2268,145,'Maputo','MP',1),
	(2269,145,'Nampula','NA',1),
	(2270,145,'Niassa','NI',1),
	(2271,145,'Sofala','SO',1),
	(2272,145,'Tete','TE',1),
	(2273,145,'Zambezia','ZA',1),
	(2274,146,'Ayeyarwady','AY',1),
	(2275,146,'Bago','BG',1),
	(2276,146,'Magway','MG',1),
	(2277,146,'Mandalay','MD',1),
	(2278,146,'Sagaing','SG',1),
	(2279,146,'Tanintharyi','TN',1),
	(2280,146,'Yangon','YG',1),
	(2281,146,'Chin State','CH',1),
	(2282,146,'Kachin State','KC',1),
	(2283,146,'Kayah State','KH',1),
	(2284,146,'Kayin State','KN',1),
	(2285,146,'Mon State','MN',1),
	(2286,146,'Rakhine State','RK',1),
	(2287,146,'Shan State','SH',1),
	(2288,147,'Caprivi','CA',1),
	(2289,147,'Erongo','ER',1),
	(2290,147,'Hardap','HA',1),
	(2291,147,'Karas','KR',1),
	(2292,147,'Kavango','KV',1),
	(2293,147,'Khomas','KH',1),
	(2294,147,'Kunene','KU',1),
	(2295,147,'Ohangwena','OW',1),
	(2296,147,'Omaheke','OK',1),
	(2297,147,'Omusati','OT',1),
	(2298,147,'Oshana','ON',1),
	(2299,147,'Oshikoto','OO',1),
	(2300,147,'Otjozondjupa','OJ',1),
	(2301,148,'Aiwo','AO',1),
	(2302,148,'Anabar','AA',1),
	(2303,148,'Anetan','AT',1),
	(2304,148,'Anibare','AI',1),
	(2305,148,'Baiti','BA',1),
	(2306,148,'Boe','BO',1),
	(2307,148,'Buada','BU',1),
	(2308,148,'Denigomodu','DE',1),
	(2309,148,'Ewa','EW',1),
	(2310,148,'Ijuw','IJ',1),
	(2311,148,'Meneng','ME',1),
	(2312,148,'Nibok','NI',1),
	(2313,148,'Uaboe','UA',1),
	(2314,148,'Yaren','YA',1),
	(2315,149,'Bagmati','BA',1),
	(2316,149,'Bheri','BH',1),
	(2317,149,'Dhawalagiri','DH',1),
	(2318,149,'Gandaki','GA',1),
	(2319,149,'Janakpur','JA',1),
	(2320,149,'Karnali','KA',1),
	(2321,149,'Kosi','KO',1),
	(2322,149,'Lumbini','LU',1),
	(2323,149,'Mahakali','MA',1),
	(2324,149,'Mechi','ME',1),
	(2325,149,'Narayani','NA',1),
	(2326,149,'Rapti','RA',1),
	(2327,149,'Sagarmatha','SA',1),
	(2328,149,'Seti','SE',1),
	(2329,150,'Drenthe','DR',1),
	(2330,150,'Flevoland','FL',1),
	(2331,150,'Friesland','FR',1),
	(2332,150,'Gelderland','GE',1),
	(2333,150,'Groningen','GR',1),
	(2334,150,'Limburg','LI',1),
	(2335,150,'Noord-Brabant','NB',1),
	(2336,150,'Noord-Holland','NH',1),
	(2337,150,'Overijssel','OV',1),
	(2338,150,'Utrecht','UT',1),
	(2339,150,'Zeeland','ZE',1),
	(2340,150,'Zuid-Holland','ZH',1),
	(2341,152,'Iles Loyaute','L',1),
	(2342,152,'Nord','N',1),
	(2343,152,'Sud','S',1),
	(2344,153,'Auckland','AUK',1),
	(2345,153,'Bay of Plenty','BOP',1),
	(2346,153,'Canterbury','CAN',1),
	(2347,153,'Coromandel','COR',1),
	(2348,153,'Gisborne','GIS',1),
	(2349,153,'Fiordland','FIO',1),
	(2350,153,'Hawke\'s Bay','HKB',1),
	(2351,153,'Marlborough','MBH',1),
	(2352,153,'Manawatu-Wanganui','MWT',1),
	(2353,153,'Mt Cook-Mackenzie','MCM',1),
	(2354,153,'Nelson','NSN',1),
	(2355,153,'Northland','NTL',1),
	(2356,153,'Otago','OTA',1),
	(2357,153,'Southland','STL',1),
	(2358,153,'Taranaki','TKI',1),
	(2359,153,'Wellington','WGN',1),
	(2360,153,'Waikato','WKO',1),
	(2361,153,'Wairarapa','WAI',1),
	(2362,153,'West Coast','WTC',1),
	(2363,154,'Atlantico Norte','AN',1),
	(2364,154,'Atlantico Sur','AS',1),
	(2365,154,'Boaco','BO',1),
	(2366,154,'Carazo','CA',1),
	(2367,154,'Chinandega','CI',1),
	(2368,154,'Chontales','CO',1),
	(2369,154,'Esteli','ES',1),
	(2370,154,'Granada','GR',1),
	(2371,154,'Jinotega','JI',1),
	(2372,154,'Leon','LE',1),
	(2373,154,'Madriz','MD',1),
	(2374,154,'Managua','MN',1),
	(2375,154,'Masaya','MS',1),
	(2376,154,'Matagalpa','MT',1),
	(2377,154,'Nuevo Segovia','NS',1),
	(2378,154,'Rio San Juan','RS',1),
	(2379,154,'Rivas','RI',1),
	(2380,155,'Agadez','AG',1),
	(2381,155,'Diffa','DF',1),
	(2382,155,'Dosso','DS',1),
	(2383,155,'Maradi','MA',1),
	(2384,155,'Niamey','NM',1),
	(2385,155,'Tahoua','TH',1),
	(2386,155,'Tillaberi','TL',1),
	(2387,155,'Zinder','ZD',1),
	(2388,156,'Abia','AB',1),
	(2389,156,'Abuja Federal Capital Territory','CT',1),
	(2390,156,'Adamawa','AD',1),
	(2391,156,'Akwa Ibom','AK',1),
	(2392,156,'Anambra','AN',1),
	(2393,156,'Bauchi','BC',1),
	(2394,156,'Bayelsa','BY',1),
	(2395,156,'Benue','BN',1),
	(2396,156,'Borno','BO',1),
	(2397,156,'Cross River','CR',1),
	(2398,156,'Delta','DE',1),
	(2399,156,'Ebonyi','EB',1),
	(2400,156,'Edo','ED',1),
	(2401,156,'Ekiti','EK',1),
	(2402,156,'Enugu','EN',1),
	(2403,156,'Gombe','GO',1),
	(2404,156,'Imo','IM',1),
	(2405,156,'Jigawa','JI',1),
	(2406,156,'Kaduna','KD',1),
	(2407,156,'Kano','KN',1),
	(2408,156,'Katsina','KT',1),
	(2409,156,'Kebbi','KE',1),
	(2410,156,'Kogi','KO',1),
	(2411,156,'Kwara','KW',1),
	(2412,156,'Lagos','LA',1),
	(2413,156,'Nassarawa','NA',1),
	(2414,156,'Niger','NI',1),
	(2415,156,'Ogun','OG',1),
	(2416,156,'Ondo','ONG',1),
	(2417,156,'Osun','OS',1),
	(2418,156,'Oyo','OY',1),
	(2419,156,'Plateau','PL',1),
	(2420,156,'Rivers','RI',1),
	(2421,156,'Sokoto','SO',1),
	(2422,156,'Taraba','TA',1),
	(2423,156,'Yobe','YO',1),
	(2424,156,'Zamfara','ZA',1),
	(2425,159,'Northern Islands','N',1),
	(2426,159,'Rota','R',1),
	(2427,159,'Saipan','S',1),
	(2428,159,'Tinian','T',1),
	(2429,160,'Akershus','AK',1),
	(2430,160,'Aust-Agder','AA',1),
	(2431,160,'Buskerud','BU',1),
	(2432,160,'Finnmark','FM',1),
	(2433,160,'Hedmark','HM',1),
	(2434,160,'Hordaland','HL',1),
	(2435,160,'More og Romdal','MR',1),
	(2436,160,'Nord-Trondelag','NT',1),
	(2437,160,'Nordland','NL',1),
	(2438,160,'Ostfold','OF',1),
	(2439,160,'Oppland','OP',1),
	(2440,160,'Oslo','OL',1),
	(2441,160,'Rogaland','RL',1),
	(2442,160,'Sor-Trondelag','ST',1),
	(2443,160,'Sogn og Fjordane','SJ',1),
	(2444,160,'Svalbard','SV',1),
	(2445,160,'Telemark','TM',1),
	(2446,160,'Troms','TR',1),
	(2447,160,'Vest-Agder','VA',1),
	(2448,160,'Vestfold','VF',1),
	(2449,161,'Ad Dakhiliyah','DA',1),
	(2450,161,'Al Batinah','BA',1),
	(2451,161,'Al Wusta','WU',1),
	(2452,161,'Ash Sharqiyah','SH',1),
	(2453,161,'Az Zahirah','ZA',1),
	(2454,161,'Masqat','MA',1),
	(2455,161,'Musandam','MU',1),
	(2456,161,'Zufar','ZU',1),
	(2457,162,'Balochistan','B',1),
	(2458,162,'Federally Administered Tribal Areas','T',1),
	(2459,162,'Islamabad Capital Territory','I',1),
	(2460,162,'North-West Frontier','N',1),
	(2461,162,'Punjab','P',1),
	(2462,162,'Sindh','S',1),
	(2463,163,'Aimeliik','AM',1),
	(2464,163,'Airai','AR',1),
	(2465,163,'Angaur','AN',1),
	(2466,163,'Hatohobei','HA',1),
	(2467,163,'Kayangel','KA',1),
	(2468,163,'Koror','KO',1),
	(2469,163,'Melekeok','ME',1),
	(2470,163,'Ngaraard','NA',1),
	(2471,163,'Ngarchelong','NG',1),
	(2472,163,'Ngardmau','ND',1),
	(2473,163,'Ngatpang','NT',1),
	(2474,163,'Ngchesar','NC',1),
	(2475,163,'Ngeremlengui','NR',1),
	(2476,163,'Ngiwal','NW',1),
	(2477,163,'Peleliu','PE',1),
	(2478,163,'Sonsorol','SO',1),
	(2479,164,'Bocas del Toro','BT',1),
	(2480,164,'Chiriqui','CH',1),
	(2481,164,'Cocle','CC',1),
	(2482,164,'Colon','CL',1),
	(2483,164,'Darien','DA',1),
	(2484,164,'Herrera','HE',1),
	(2485,164,'Los Santos','LS',1),
	(2486,164,'Panama','PA',1),
	(2487,164,'San Blas','SB',1),
	(2488,164,'Veraguas','VG',1),
	(2489,165,'Bougainville','BV',1),
	(2490,165,'Central','CE',1),
	(2491,165,'Chimbu','CH',1),
	(2492,165,'Eastern Highlands','EH',1),
	(2493,165,'East New Britain','EB',1),
	(2494,165,'East Sepik','ES',1),
	(2495,165,'Enga','EN',1),
	(2496,165,'Gulf','GU',1),
	(2497,165,'Madang','MD',1),
	(2498,165,'Manus','MN',1),
	(2499,165,'Milne Bay','MB',1),
	(2500,165,'Morobe','MR',1),
	(2501,165,'National Capital','NC',1),
	(2502,165,'New Ireland','NI',1),
	(2503,165,'Northern','NO',1),
	(2504,165,'Sandaun','SA',1),
	(2505,165,'Southern Highlands','SH',1),
	(2506,165,'Western','WE',1),
	(2507,165,'Western Highlands','WH',1),
	(2508,165,'West New Britain','WB',1),
	(2509,166,'Alto Paraguay','AG',1),
	(2510,166,'Alto Parana','AN',1),
	(2511,166,'Amambay','AM',1),
	(2512,166,'Asuncion','AS',1),
	(2513,166,'Boqueron','BO',1),
	(2514,166,'Caaguazu','CG',1),
	(2515,166,'Caazapa','CZ',1),
	(2516,166,'Canindeyu','CN',1),
	(2517,166,'Central','CE',1),
	(2518,166,'Concepcion','CC',1),
	(2519,166,'Cordillera','CD',1),
	(2520,166,'Guaira','GU',1),
	(2521,166,'Itapua','IT',1),
	(2522,166,'Misiones','MI',1),
	(2523,166,'Neembucu','NE',1),
	(2524,166,'Paraguari','PA',1),
	(2525,166,'Presidente Hayes','PH',1),
	(2526,166,'San Pedro','SP',1),
	(2527,167,'Amazonas','AM',1),
	(2528,167,'Ancash','AN',1),
	(2529,167,'Apurimac','AP',1),
	(2530,167,'Arequipa','AR',1),
	(2531,167,'Ayacucho','AY',1),
	(2532,167,'Cajamarca','CJ',1),
	(2533,167,'Callao','CL',1),
	(2534,167,'Cusco','CU',1),
	(2535,167,'Huancavelica','HV',1),
	(2536,167,'Huanuco','HO',1),
	(2537,167,'Ica','IC',1),
	(2538,167,'Junin','JU',1),
	(2539,167,'La Libertad','LD',1),
	(2540,167,'Lambayeque','LY',1),
	(2541,167,'Lima','LI',1),
	(2542,167,'Loreto','LO',1),
	(2543,167,'Madre de Dios','MD',1),
	(2544,167,'Moquegua','MO',1),
	(2545,167,'Pasco','PA',1),
	(2546,167,'Piura','PI',1),
	(2547,167,'Puno','PU',1),
	(2548,167,'San Martin','SM',1),
	(2549,167,'Tacna','TA',1),
	(2550,167,'Tumbes','TU',1),
	(2551,167,'Ucayali','UC',1),
	(2552,168,'Abra','ABR',1),
	(2553,168,'Agusan del Norte','ANO',1),
	(2554,168,'Agusan del Sur','ASU',1),
	(2555,168,'Aklan','AKL',1),
	(2556,168,'Albay','ALB',1),
	(2557,168,'Antique','ANT',1),
	(2558,168,'Apayao','APY',1),
	(2559,168,'Aurora','AUR',1),
	(2560,168,'Basilan','BAS',1),
	(2561,168,'Bataan','BTA',1),
	(2562,168,'Batanes','BTE',1),
	(2563,168,'Batangas','BTG',1),
	(2564,168,'Biliran','BLR',1),
	(2565,168,'Benguet','BEN',1),
	(2566,168,'Bohol','BOL',1),
	(2567,168,'Bukidnon','BUK',1),
	(2568,168,'Bulacan','BUL',1),
	(2569,168,'Cagayan','CAG',1),
	(2570,168,'Camarines Norte','CNO',1),
	(2571,168,'Camarines Sur','CSU',1),
	(2572,168,'Camiguin','CAM',1),
	(2573,168,'Capiz','CAP',1),
	(2574,168,'Catanduanes','CAT',1),
	(2575,168,'Cavite','CAV',1),
	(2576,168,'Cebu','CEB',1),
	(2577,168,'Compostela','CMP',1),
	(2578,168,'Davao del Norte','DNO',1),
	(2579,168,'Davao del Sur','DSU',1),
	(2580,168,'Davao Oriental','DOR',1),
	(2581,168,'Eastern Samar','ESA',1),
	(2582,168,'Guimaras','GUI',1),
	(2583,168,'Ifugao','IFU',1),
	(2584,168,'Ilocos Norte','INO',1),
	(2585,168,'Ilocos Sur','ISU',1),
	(2586,168,'Iloilo','ILO',1),
	(2587,168,'Isabela','ISA',1),
	(2588,168,'Kalinga','KAL',1),
	(2589,168,'Laguna','LAG',1),
	(2590,168,'Lanao del Norte','LNO',1),
	(2591,168,'Lanao del Sur','LSU',1),
	(2592,168,'La Union','UNI',1),
	(2593,168,'Leyte','LEY',1),
	(2594,168,'Maguindanao','MAG',1),
	(2595,168,'Marinduque','MRN',1),
	(2596,168,'Masbate','MSB',1),
	(2597,168,'Mindoro Occidental','MIC',1),
	(2598,168,'Mindoro Oriental','MIR',1),
	(2599,168,'Misamis Occidental','MSC',1),
	(2600,168,'Misamis Oriental','MOR',1),
	(2601,168,'Mountain','MOP',1),
	(2602,168,'Negros Occidental','NOC',1),
	(2603,168,'Negros Oriental','NOR',1),
	(2604,168,'North Cotabato','NCT',1),
	(2605,168,'Northern Samar','NSM',1),
	(2606,168,'Nueva Ecija','NEC',1),
	(2607,168,'Nueva Vizcaya','NVZ',1),
	(2608,168,'Palawan','PLW',1),
	(2609,168,'Pampanga','PMP',1),
	(2610,168,'Pangasinan','PNG',1),
	(2611,168,'Quezon','QZN',1),
	(2612,168,'Quirino','QRN',1),
	(2613,168,'Rizal','RIZ',1),
	(2614,168,'Romblon','ROM',1),
	(2615,168,'Samar','SMR',1),
	(2616,168,'Sarangani','SRG',1),
	(2617,168,'Siquijor','SQJ',1),
	(2618,168,'Sorsogon','SRS',1),
	(2619,168,'South Cotabato','SCO',1),
	(2620,168,'Southern Leyte','SLE',1),
	(2621,168,'Sultan Kudarat','SKU',1),
	(2622,168,'Sulu','SLU',1),
	(2623,168,'Surigao del Norte','SNO',1),
	(2624,168,'Surigao del Sur','SSU',1),
	(2625,168,'Tarlac','TAR',1),
	(2626,168,'Tawi-Tawi','TAW',1),
	(2627,168,'Zambales','ZBL',1),
	(2628,168,'Zamboanga del Norte','ZNO',1),
	(2629,168,'Zamboanga del Sur','ZSU',1),
	(2630,168,'Zamboanga Sibugay','ZSI',1),
	(2631,170,'Dolnoslaskie','DO',1),
	(2632,170,'Kujawsko-Pomorskie','KP',1),
	(2633,170,'Lodzkie','LO',1),
	(2634,170,'Lubelskie','LL',1),
	(2635,170,'Lubuskie','LU',1),
	(2636,170,'Malopolskie','ML',1),
	(2637,170,'Mazowieckie','MZ',1),
	(2638,170,'Opolskie','OP',1),
	(2639,170,'Podkarpackie','PP',1),
	(2640,170,'Podlaskie','PL',1),
	(2641,170,'Pomorskie','PM',1),
	(2642,170,'Slaskie','SL',1),
	(2643,170,'Swietokrzyskie','SW',1),
	(2644,170,'Warminsko-Mazurskie','WM',1),
	(2645,170,'Wielkopolskie','WP',1),
	(2646,170,'Zachodniopomorskie','ZA',1),
	(2647,198,'Saint Pierre','P',1),
	(2648,198,'Miquelon','M',1),
	(2649,171,'A&ccedil;ores','AC',1),
	(2650,171,'Aveiro','AV',1),
	(2651,171,'Beja','BE',1),
	(2652,171,'Braga','BR',1),
	(2653,171,'Bragan&ccedil;a','BA',1),
	(2654,171,'Castelo Branco','CB',1),
	(2655,171,'Coimbra','CO',1),
	(2656,171,'&Eacute;vora','EV',1),
	(2657,171,'Faro','FA',1),
	(2658,171,'Guarda','GU',1),
	(2659,171,'Leiria','LE',1),
	(2660,171,'Lisboa','LI',1),
	(2661,171,'Madeira','ME',1),
	(2662,171,'Portalegre','PO',1),
	(2663,171,'Porto','PR',1),
	(2664,171,'Santar&eacute;m','SA',1),
	(2665,171,'Set&uacute;bal','SE',1),
	(2666,171,'Viana do Castelo','VC',1),
	(2667,171,'Vila Real','VR',1),
	(2668,171,'Viseu','VI',1),
	(2669,173,'Ad Dawhah','DW',1),
	(2670,173,'Al Ghuwayriyah','GW',1),
	(2671,173,'Al Jumayliyah','JM',1),
	(2672,173,'Al Khawr','KR',1),
	(2673,173,'Al Wakrah','WK',1),
	(2674,173,'Ar Rayyan','RN',1),
	(2675,173,'Jarayan al Batinah','JB',1),
	(2676,173,'Madinat ash Shamal','MS',1),
	(2677,173,'Umm Sa\'id','UD',1),
	(2678,173,'Umm Salal','UL',1),
	(2679,175,'Alba','AB',1),
	(2680,175,'Arad','AR',1),
	(2681,175,'Arges','AG',1),
	(2682,175,'Bacau','BC',1),
	(2683,175,'Bihor','BH',1),
	(2684,175,'Bistrita-Nasaud','BN',1),
	(2685,175,'Botosani','BT',1),
	(2686,175,'Brasov','BV',1),
	(2687,175,'Braila','BR',1),
	(2688,175,'Bucuresti','B',1),
	(2689,175,'Buzau','BZ',1),
	(2690,175,'Caras-Severin','CS',1),
	(2691,175,'Calarasi','CL',1),
	(2692,175,'Cluj','CJ',1),
	(2693,175,'Constanta','CT',1),
	(2694,175,'Covasna','CV',1),
	(2695,175,'Dimbovita','DB',1),
	(2696,175,'Dolj','DJ',1),
	(2697,175,'Galati','GL',1),
	(2698,175,'Giurgiu','GR',1),
	(2699,175,'Gorj','GJ',1),
	(2700,175,'Harghita','HR',1),
	(2701,175,'Hunedoara','HD',1),
	(2702,175,'Ialomita','IL',1),
	(2703,175,'Iasi','IS',1),
	(2704,175,'Ilfov','IF',1),
	(2705,175,'Maramures','MM',1),
	(2706,175,'Mehedinti','MH',1),
	(2707,175,'Mures','MS',1),
	(2708,175,'Neamt','NT',1),
	(2709,175,'Olt','OT',1),
	(2710,175,'Prahova','PH',1),
	(2711,175,'Satu-Mare','SM',1),
	(2712,175,'Salaj','SJ',1),
	(2713,175,'Sibiu','SB',1),
	(2714,175,'Suceava','SV',1),
	(2715,175,'Teleorman','TR',1),
	(2716,175,'Timis','TM',1),
	(2717,175,'Tulcea','TL',1),
	(2718,175,'Vaslui','VS',1),
	(2719,175,'Valcea','VL',1),
	(2720,175,'Vrancea','VN',1),
	(2721,176,'Abakan','AB',1),
	(2722,176,'Aginskoye','AG',1),
	(2723,176,'Anadyr','AN',1),
	(2724,176,'Arkahangelsk','AR',1),
	(2725,176,'Astrakhan','AS',1),
	(2726,176,'Barnaul','BA',1),
	(2727,176,'Belgorod','BE',1),
	(2728,176,'Birobidzhan','BI',1),
	(2729,176,'Blagoveshchensk','BL',1),
	(2730,176,'Bryansk','BR',1),
	(2731,176,'Cheboksary','CH',1),
	(2732,176,'Chelyabinsk','CL',1),
	(2733,176,'Cherkessk','CR',1),
	(2734,176,'Chita','CI',1),
	(2735,176,'Dudinka','DU',1),
	(2736,176,'Elista','EL',1),
	(2738,176,'Gorno-Altaysk','GA',1),
	(2739,176,'Groznyy','GR',1),
	(2740,176,'Irkutsk','IR',1),
	(2741,176,'Ivanovo','IV',1),
	(2742,176,'Izhevsk','IZ',1),
	(2743,176,'Kalinigrad','KA',1),
	(2744,176,'Kaluga','KL',1),
	(2745,176,'Kasnodar','KS',1),
	(2746,176,'Kazan','KZ',1),
	(2747,176,'Kemerovo','KE',1),
	(2748,176,'Khabarovsk','KH',1),
	(2749,176,'Khanty-Mansiysk','KM',1),
	(2750,176,'Kostroma','KO',1),
	(2751,176,'Krasnodar','KR',1),
	(2752,176,'Krasnoyarsk','KN',1),
	(2753,176,'Kudymkar','KU',1),
	(2754,176,'Kurgan','KG',1),
	(2755,176,'Kursk','KK',1),
	(2756,176,'Kyzyl','KY',1),
	(2757,176,'Lipetsk','LI',1),
	(2758,176,'Magadan','MA',1),
	(2759,176,'Makhachkala','MK',1),
	(2760,176,'Maykop','MY',1),
	(2761,176,'Moscow','MO',1),
	(2762,176,'Murmansk','MU',1),
	(2763,176,'Nalchik','NA',1),
	(2764,176,'Naryan Mar','NR',1),
	(2765,176,'Nazran','NZ',1),
	(2766,176,'Nizhniy Novgorod','NI',1),
	(2767,176,'Novgorod','NO',1),
	(2768,176,'Novosibirsk','NV',1),
	(2769,176,'Omsk','OM',1),
	(2770,176,'Orel','OR',1),
	(2771,176,'Orenburg','OE',1),
	(2772,176,'Palana','PA',1),
	(2773,176,'Penza','PE',1),
	(2774,176,'Perm','PR',1),
	(2775,176,'Petropavlovsk-Kamchatskiy','PK',1),
	(2776,176,'Petrozavodsk','PT',1),
	(2777,176,'Pskov','PS',1),
	(2778,176,'Rostov-na-Donu','RO',1),
	(2779,176,'Ryazan','RY',1),
	(2780,176,'Salekhard','SL',1),
	(2781,176,'Samara','SA',1),
	(2782,176,'Saransk','SR',1),
	(2783,176,'Saratov','SV',1),
	(2784,176,'Smolensk','SM',1),
	(2785,176,'St. Petersburg','SP',1),
	(2786,176,'Stavropol','ST',1),
	(2787,176,'Syktyvkar','SY',1),
	(2788,176,'Tambov','TA',1),
	(2789,176,'Tomsk','TO',1),
	(2790,176,'Tula','TU',1),
	(2791,176,'Tura','TR',1),
	(2792,176,'Tver','TV',1),
	(2793,176,'Tyumen','TY',1),
	(2794,176,'Ufa','UF',1),
	(2795,176,'Ul\'yanovsk','UL',1),
	(2796,176,'Ulan-Ude','UU',1),
	(2797,176,'Ust\'-Ordynskiy','US',1),
	(2798,176,'Vladikavkaz','VL',1),
	(2799,176,'Vladimir','VA',1),
	(2800,176,'Vladivostok','VV',1),
	(2801,176,'Volgograd','VG',1),
	(2802,176,'Vologda','VD',1),
	(2803,176,'Voronezh','VO',1),
	(2804,176,'Vyatka','VY',1),
	(2805,176,'Yakutsk','YA',1),
	(2806,176,'Yaroslavl','YR',1),
	(2807,176,'Yekaterinburg','YE',1),
	(2808,176,'Yoshkar-Ola','YO',1),
	(2809,177,'Butare','BU',1),
	(2810,177,'Byumba','BY',1),
	(2811,177,'Cyangugu','CY',1),
	(2812,177,'Gikongoro','GK',1),
	(2813,177,'Gisenyi','GS',1),
	(2814,177,'Gitarama','GT',1),
	(2815,177,'Kibungo','KG',1),
	(2816,177,'Kibuye','KY',1),
	(2817,177,'Kigali Rurale','KR',1),
	(2818,177,'Kigali-ville','KV',1),
	(2819,177,'Ruhengeri','RU',1),
	(2820,177,'Umutara','UM',1),
	(2821,178,'Christ Church Nichola Town','CCN',1),
	(2822,178,'Saint Anne Sandy Point','SAS',1),
	(2823,178,'Saint George Basseterre','SGB',1),
	(2824,178,'Saint George Gingerland','SGG',1),
	(2825,178,'Saint James Windward','SJW',1),
	(2826,178,'Saint John Capesterre','SJC',1),
	(2827,178,'Saint John Figtree','SJF',1),
	(2828,178,'Saint Mary Cayon','SMC',1),
	(2829,178,'Saint Paul Capesterre','CAP',1),
	(2830,178,'Saint Paul Charlestown','CHA',1),
	(2831,178,'Saint Peter Basseterre','SPB',1),
	(2832,178,'Saint Thomas Lowland','STL',1),
	(2833,178,'Saint Thomas Middle Island','STM',1),
	(2834,178,'Trinity Palmetto Point','TPP',1),
	(2835,179,'Anse-la-Raye','AR',1),
	(2836,179,'Castries','CA',1),
	(2837,179,'Choiseul','CH',1),
	(2838,179,'Dauphin','DA',1),
	(2839,179,'Dennery','DE',1),
	(2840,179,'Gros-Islet','GI',1),
	(2841,179,'Laborie','LA',1),
	(2842,179,'Micoud','MI',1),
	(2843,179,'Praslin','PR',1),
	(2844,179,'Soufriere','SO',1),
	(2845,179,'Vieux-Fort','VF',1),
	(2846,180,'Charlotte','C',1),
	(2847,180,'Grenadines','R',1),
	(2848,180,'Saint Andrew','A',1),
	(2849,180,'Saint David','D',1),
	(2850,180,'Saint George','G',1),
	(2851,180,'Saint Patrick','P',1),
	(2852,181,'A\'ana','AN',1),
	(2853,181,'Aiga-i-le-Tai','AI',1),
	(2854,181,'Atua','AT',1),
	(2855,181,'Fa\'asaleleaga','FA',1),
	(2856,181,'Gaga\'emauga','GE',1),
	(2857,181,'Gagaifomauga','GF',1),
	(2858,181,'Palauli','PA',1),
	(2859,181,'Satupa\'itea','SA',1),
	(2860,181,'Tuamasaga','TU',1),
	(2861,181,'Va\'a-o-Fonoti','VF',1),
	(2862,181,'Vaisigano','VS',1),
	(2863,182,'Acquaviva','AC',1),
	(2864,182,'Borgo Maggiore','BM',1),
	(2865,182,'Chiesanuova','CH',1),
	(2866,182,'Domagnano','DO',1),
	(2867,182,'Faetano','FA',1),
	(2868,182,'Fiorentino','FI',1),
	(2869,182,'Montegiardino','MO',1),
	(2870,182,'Citta di San Marino','SM',1),
	(2871,182,'Serravalle','SE',1),
	(2872,183,'Sao Tome','S',1),
	(2873,183,'Principe','P',1),
	(2874,184,'Al Bahah','BH',1),
	(2875,184,'Al Hudud ash Shamaliyah','HS',1),
	(2876,184,'Al Jawf','JF',1),
	(2877,184,'Al Madinah','MD',1),
	(2878,184,'Al Qasim','QS',1),
	(2879,184,'Ar Riyad','RD',1),
	(2880,184,'Ash Sharqiyah (Eastern)','AQ',1),
	(2881,184,'\'Asir','AS',1),
	(2882,184,'Ha\'il','HL',1),
	(2883,184,'Jizan','JZ',1),
	(2884,184,'Makkah','ML',1),
	(2885,184,'Najran','NR',1),
	(2886,184,'Tabuk','TB',1),
	(2887,185,'Dakar','DA',1),
	(2888,185,'Diourbel','DI',1),
	(2889,185,'Fatick','FA',1),
	(2890,185,'Kaolack','KA',1),
	(2891,185,'Kolda','KO',1),
	(2892,185,'Louga','LO',1),
	(2893,185,'Matam','MA',1),
	(2894,185,'Saint-Louis','SL',1),
	(2895,185,'Tambacounda','TA',1),
	(2896,185,'Thies','TH',1),
	(2897,185,'Ziguinchor','ZI',1),
	(2898,186,'Anse aux Pins','AP',1),
	(2899,186,'Anse Boileau','AB',1),
	(2900,186,'Anse Etoile','AE',1),
	(2901,186,'Anse Louis','AL',1),
	(2902,186,'Anse Royale','AR',1),
	(2903,186,'Baie Lazare','BL',1),
	(2904,186,'Baie Sainte Anne','BS',1),
	(2905,186,'Beau Vallon','BV',1),
	(2906,186,'Bel Air','BA',1),
	(2907,186,'Bel Ombre','BO',1),
	(2908,186,'Cascade','CA',1),
	(2909,186,'Glacis','GL',1),
	(2910,186,'Grand\' Anse (on Mahe)','GM',1),
	(2911,186,'Grand\' Anse (on Praslin)','GP',1),
	(2912,186,'La Digue','DG',1),
	(2913,186,'La Riviere Anglaise','RA',1),
	(2914,186,'Mont Buxton','MB',1),
	(2915,186,'Mont Fleuri','MF',1),
	(2916,186,'Plaisance','PL',1),
	(2917,186,'Pointe La Rue','PR',1),
	(2918,186,'Port Glaud','PG',1),
	(2919,186,'Saint Louis','SL',1),
	(2920,186,'Takamaka','TA',1),
	(2921,187,'Eastern','E',1),
	(2922,187,'Northern','N',1),
	(2923,187,'Southern','S',1),
	(2924,187,'Western','W',1),
	(2925,189,'Banskobystrický','BA',1),
	(2926,189,'Bratislavský','BR',1),
	(2927,189,'Košický','KO',1),
	(2928,189,'Nitriansky','NI',1),
	(2929,189,'Prešovský','PR',1),
	(2930,189,'Trenčiansky','TC',1),
	(2931,189,'Trnavský','TV',1),
	(2932,189,'Žilinský','ZI',1),
	(2933,191,'Central','CE',1),
	(2934,191,'Choiseul','CH',1),
	(2935,191,'Guadalcanal','GC',1),
	(2936,191,'Honiara','HO',1),
	(2937,191,'Isabel','IS',1),
	(2938,191,'Makira','MK',1),
	(2939,191,'Malaita','ML',1),
	(2940,191,'Rennell and Bellona','RB',1),
	(2941,191,'Temotu','TM',1),
	(2942,191,'Western','WE',1),
	(2943,192,'Awdal','AW',1),
	(2944,192,'Bakool','BK',1),
	(2945,192,'Banaadir','BN',1),
	(2946,192,'Bari','BR',1),
	(2947,192,'Bay','BY',1),
	(2948,192,'Galguduud','GA',1),
	(2949,192,'Gedo','GE',1),
	(2950,192,'Hiiraan','HI',1),
	(2951,192,'Jubbada Dhexe','JD',1),
	(2952,192,'Jubbada Hoose','JH',1),
	(2953,192,'Mudug','MU',1),
	(2954,192,'Nugaal','NU',1),
	(2955,192,'Sanaag','SA',1),
	(2956,192,'Shabeellaha Dhexe','SD',1),
	(2957,192,'Shabeellaha Hoose','SH',1),
	(2958,192,'Sool','SL',1),
	(2959,192,'Togdheer','TO',1),
	(2960,192,'Woqooyi Galbeed','WG',1),
	(2961,193,'Eastern Cape','EC',1),
	(2962,193,'Free State','FS',1),
	(2963,193,'Gauteng','GT',1),
	(2964,193,'KwaZulu-Natal','KN',1),
	(2965,193,'Limpopo','LP',1),
	(2966,193,'Mpumalanga','MP',1),
	(2967,193,'North West','NW',1),
	(2968,193,'Northern Cape','NC',1),
	(2969,193,'Western Cape','WC',1),
	(2970,195,'La Coru&ntilde;a','CA',1),
	(2971,195,'&Aacute;lava','AL',1),
	(2972,195,'Albacete','AB',1),
	(2973,195,'Alicante','AC',1),
	(2974,195,'Almeria','AM',1),
	(2975,195,'Asturias','AS',1),
	(2976,195,'&Aacute;vila','AV',1),
	(2977,195,'Badajoz','BJ',1),
	(2978,195,'Baleares','IB',1),
	(2979,195,'Barcelona','BA',1),
	(2980,195,'Burgos','BU',1),
	(2981,195,'C&aacute;ceres','CC',1),
	(2982,195,'C&aacute;diz','CZ',1),
	(2983,195,'Cantabria','CT',1),
	(2984,195,'Castell&oacute;n','CL',1),
	(2985,195,'Ceuta','CE',1),
	(2986,195,'Ciudad Real','CR',1),
	(2987,195,'C&oacute;rdoba','CD',1),
	(2988,195,'Cuenca','CU',1),
	(2989,195,'Girona','GI',1),
	(2990,195,'Granada','GD',1),
	(2991,195,'Guadalajara','GJ',1),
	(2992,195,'Guip&uacute;zcoa','GP',1),
	(2993,195,'Huelva','HL',1),
	(2994,195,'Huesca','HS',1),
	(2995,195,'Ja&eacute;n','JN',1),
	(2996,195,'La Rioja','RJ',1),
	(2997,195,'Las Palmas','PM',1),
	(2998,195,'Leon','LE',1),
	(2999,195,'Lleida','LL',1),
	(3000,195,'Lugo','LG',1),
	(3001,195,'Madrid','MD',1),
	(3002,195,'Malaga','MA',1),
	(3003,195,'Melilla','ML',1),
	(3004,195,'Murcia','MU',1),
	(3005,195,'Navarra','NV',1),
	(3006,195,'Ourense','OU',1),
	(3007,195,'Palencia','PL',1),
	(3008,195,'Pontevedra','PO',1),
	(3009,195,'Salamanca','SL',1),
	(3010,195,'Santa Cruz de Tenerife','SC',1),
	(3011,195,'Segovia','SG',1),
	(3012,195,'Sevilla','SV',1),
	(3013,195,'Soria','SO',1),
	(3014,195,'Tarragona','TA',1),
	(3015,195,'Teruel','TE',1),
	(3016,195,'Toledo','TO',1),
	(3017,195,'Valencia','VC',1),
	(3018,195,'Valladolid','VD',1),
	(3019,195,'Vizcaya','VZ',1),
	(3020,195,'Zamora','ZM',1),
	(3021,195,'Zaragoza','ZR',1),
	(3022,196,'Central','CE',1),
	(3023,196,'Eastern','EA',1),
	(3024,196,'North Central','NC',1),
	(3025,196,'Northern','NO',1),
	(3026,196,'North Western','NW',1),
	(3027,196,'Sabaragamuwa','SA',1),
	(3028,196,'Southern','SO',1),
	(3029,196,'Uva','UV',1),
	(3030,196,'Western','WE',1),
	(3032,197,'Saint Helena','S',1),
	(3034,199,'A\'ali an Nil','ANL',1),
	(3035,199,'Al Bahr al Ahmar','BAM',1),
	(3036,199,'Al Buhayrat','BRT',1),
	(3037,199,'Al Jazirah','JZR',1),
	(3038,199,'Al Khartum','KRT',1),
	(3039,199,'Al Qadarif','QDR',1),
	(3040,199,'Al Wahdah','WDH',1),
	(3041,199,'An Nil al Abyad','ANB',1),
	(3042,199,'An Nil al Azraq','ANZ',1),
	(3043,199,'Ash Shamaliyah','ASH',1),
	(3044,199,'Bahr al Jabal','BJA',1),
	(3045,199,'Gharb al Istiwa\'iyah','GIS',1),
	(3046,199,'Gharb Bahr al Ghazal','GBG',1),
	(3047,199,'Gharb Darfur','GDA',1),
	(3048,199,'Gharb Kurdufan','GKU',1),
	(3049,199,'Janub Darfur','JDA',1),
	(3050,199,'Janub Kurdufan','JKU',1),
	(3051,199,'Junqali','JQL',1),
	(3052,199,'Kassala','KSL',1),
	(3053,199,'Nahr an Nil','NNL',1),
	(3054,199,'Shamal Bahr al Ghazal','SBG',1),
	(3055,199,'Shamal Darfur','SDA',1),
	(3056,199,'Shamal Kurdufan','SKU',1),
	(3057,199,'Sharq al Istiwa\'iyah','SIS',1),
	(3058,199,'Sinnar','SNR',1),
	(3059,199,'Warab','WRB',1),
	(3060,200,'Brokopondo','BR',1),
	(3061,200,'Commewijne','CM',1),
	(3062,200,'Coronie','CR',1),
	(3063,200,'Marowijne','MA',1),
	(3064,200,'Nickerie','NI',1),
	(3065,200,'Para','PA',1),
	(3066,200,'Paramaribo','PM',1),
	(3067,200,'Saramacca','SA',1),
	(3068,200,'Sipaliwini','SI',1),
	(3069,200,'Wanica','WA',1),
	(3070,202,'Hhohho','H',1),
	(3071,202,'Lubombo','L',1),
	(3072,202,'Manzini','M',1),
	(3073,202,'Shishelweni','S',1),
	(3074,203,'Blekinge','K',1),
	(3075,203,'Dalarna','W',1),
	(3076,203,'Gävleborg','X',1),
	(3077,203,'Gotland','I',1),
	(3078,203,'Halland','N',1),
	(3079,203,'Jämtland','Z',1),
	(3080,203,'Jönköping','F',1),
	(3081,203,'Kalmar','H',1),
	(3082,203,'Kronoberg','G',1),
	(3083,203,'Norrbotten','BD',1),
	(3084,203,'Örebro','T',1),
	(3085,203,'Östergötland','E',1),
	(3086,203,'Sk&aring;ne','M',1),
	(3087,203,'Södermanland','D',1),
	(3088,203,'Stockholm','AB',1),
	(3089,203,'Uppsala','C',1),
	(3090,203,'Värmland','S',1),
	(3091,203,'Västerbotten','AC',1),
	(3092,203,'Västernorrland','Y',1),
	(3093,203,'Västmanland','U',1),
	(3094,203,'Västra Götaland','O',1),
	(3095,204,'Aargau','AG',1),
	(3096,204,'Appenzell Ausserrhoden','AR',1),
	(3097,204,'Appenzell Innerrhoden','AI',1),
	(3098,204,'Basel-Stadt','BS',1),
	(3099,204,'Basel-Landschaft','BL',1),
	(3100,204,'Bern','BE',1),
	(3101,204,'Fribourg','FR',1),
	(3102,204,'Gen&egrave;ve','GE',1),
	(3103,204,'Glarus','GL',1),
	(3104,204,'Graubünden','GR',1),
	(3105,204,'Jura','JU',1),
	(3106,204,'Luzern','LU',1),
	(3107,204,'Neuch&acirc;tel','NE',1),
	(3108,204,'Nidwald','NW',1),
	(3109,204,'Obwald','OW',1),
	(3110,204,'St. Gallen','SG',1),
	(3111,204,'Schaffhausen','SH',1),
	(3112,204,'Schwyz','SZ',1),
	(3113,204,'Solothurn','SO',1),
	(3114,204,'Thurgau','TG',1),
	(3115,204,'Ticino','TI',1),
	(3116,204,'Uri','UR',1),
	(3117,204,'Valais','VS',1),
	(3118,204,'Vaud','VD',1),
	(3119,204,'Zug','ZG',1),
	(3120,204,'Zürich','ZH',1),
	(3121,205,'Al Hasakah','HA',1),
	(3122,205,'Al Ladhiqiyah','LA',1),
	(3123,205,'Al Qunaytirah','QU',1),
	(3124,205,'Ar Raqqah','RQ',1),
	(3125,205,'As Suwayda','SU',1),
	(3126,205,'Dara','DA',1),
	(3127,205,'Dayr az Zawr','DZ',1),
	(3128,205,'Dimashq','DI',1),
	(3129,205,'Halab','HL',1),
	(3130,205,'Hamah','HM',1),
	(3131,205,'Hims','HI',1),
	(3132,205,'Idlib','ID',1),
	(3133,205,'Rif Dimashq','RD',1),
	(3134,205,'Tartus','TA',1),
	(3135,206,'Chang-hua','CH',1),
	(3136,206,'Chia-i','CI',1),
	(3137,206,'Hsin-chu','HS',1),
	(3138,206,'Hua-lien','HL',1),
	(3139,206,'I-lan','IL',1),
	(3140,206,'Kao-hsiung county','KH',1),
	(3141,206,'Kin-men','KM',1),
	(3142,206,'Lien-chiang','LC',1),
	(3143,206,'Miao-li','ML',1),
	(3144,206,'Nan-t\'ou','NT',1),
	(3145,206,'P\'eng-hu','PH',1),
	(3146,206,'P\'ing-tung','PT',1),
	(3147,206,'T\'ai-chung','TG',1),
	(3148,206,'T\'ai-nan','TA',1),
	(3149,206,'T\'ai-pei county','TP',1),
	(3150,206,'T\'ai-tung','TT',1),
	(3151,206,'T\'ao-yuan','TY',1),
	(3152,206,'Yun-lin','YL',1),
	(3153,206,'Chia-i city','CC',1),
	(3154,206,'Chi-lung','CL',1),
	(3155,206,'Hsin-chu','HC',1),
	(3156,206,'T\'ai-chung','TH',1),
	(3157,206,'T\'ai-nan','TN',1),
	(3158,206,'Kao-hsiung city','KC',1),
	(3159,206,'T\'ai-pei city','TC',1),
	(3160,207,'Gorno-Badakhstan','GB',1),
	(3161,207,'Khatlon','KT',1),
	(3162,207,'Sughd','SU',1),
	(3163,208,'Arusha','AR',1),
	(3164,208,'Dar es Salaam','DS',1),
	(3165,208,'Dodoma','DO',1),
	(3166,208,'Iringa','IR',1),
	(3167,208,'Kagera','KA',1),
	(3168,208,'Kigoma','KI',1),
	(3169,208,'Kilimanjaro','KJ',1),
	(3170,208,'Lindi','LN',1),
	(3171,208,'Manyara','MY',1),
	(3172,208,'Mara','MR',1),
	(3173,208,'Mbeya','MB',1),
	(3174,208,'Morogoro','MO',1),
	(3175,208,'Mtwara','MT',1),
	(3176,208,'Mwanza','MW',1),
	(3177,208,'Pemba North','PN',1),
	(3178,208,'Pemba South','PS',1),
	(3179,208,'Pwani','PW',1),
	(3180,208,'Rukwa','RK',1),
	(3181,208,'Ruvuma','RV',1),
	(3182,208,'Shinyanga','SH',1),
	(3183,208,'Singida','SI',1),
	(3184,208,'Tabora','TB',1),
	(3185,208,'Tanga','TN',1),
	(3186,208,'Zanzibar Central/South','ZC',1),
	(3187,208,'Zanzibar North','ZN',1),
	(3188,208,'Zanzibar Urban/West','ZU',1),
	(3189,209,'Amnat Charoen','Amnat Charoen',1),
	(3190,209,'Ang Thong','Ang Thong',1),
	(3191,209,'Ayutthaya','Ayutthaya',1),
	(3192,209,'Bangkok','Bangkok',1),
	(3193,209,'Buriram','Buriram',1),
	(3194,209,'Chachoengsao','Chachoengsao',1),
	(3195,209,'Chai Nat','Chai Nat',1),
	(3196,209,'Chaiyaphum','Chaiyaphum',1),
	(3197,209,'Chanthaburi','Chanthaburi',1),
	(3198,209,'Chiang Mai','Chiang Mai',1),
	(3199,209,'Chiang Rai','Chiang Rai',1),
	(3200,209,'Chon Buri','Chon Buri',1),
	(3201,209,'Chumphon','Chumphon',1),
	(3202,209,'Kalasin','Kalasin',1),
	(3203,209,'Kamphaeng Phet','Kamphaeng Phet',1),
	(3204,209,'Kanchanaburi','Kanchanaburi',1),
	(3205,209,'Khon Kaen','Khon Kaen',1),
	(3206,209,'Krabi','Krabi',1),
	(3207,209,'Lampang','Lampang',1),
	(3208,209,'Lamphun','Lamphun',1),
	(3209,209,'Loei','Loei',1),
	(3210,209,'Lop Buri','Lop Buri',1),
	(3211,209,'Mae Hong Son','Mae Hong Son',1),
	(3212,209,'Maha Sarakham','Maha Sarakham',1),
	(3213,209,'Mukdahan','Mukdahan',1),
	(3214,209,'Nakhon Nayok','Nakhon Nayok',1),
	(3215,209,'Nakhon Pathom','Nakhon Pathom',1),
	(3216,209,'Nakhon Phanom','Nakhon Phanom',1),
	(3217,209,'Nakhon Ratchasima','Nakhon Ratchasima',1),
	(3218,209,'Nakhon Sawan','Nakhon Sawan',1),
	(3219,209,'Nakhon Si Thammarat','Nakhon Si Thammarat',1),
	(3220,209,'Nan','Nan',1),
	(3221,209,'Narathiwat','Narathiwat',1),
	(3222,209,'Nong Bua Lamphu','Nong Bua Lamphu',1),
	(3223,209,'Nong Khai','Nong Khai',1),
	(3224,209,'Nonthaburi','Nonthaburi',1),
	(3225,209,'Pathum Thani','Pathum Thani',1),
	(3226,209,'Pattani','Pattani',1),
	(3227,209,'Phangnga','Phangnga',1),
	(3228,209,'Phatthalung','Phatthalung',1),
	(3229,209,'Phayao','Phayao',1),
	(3230,209,'Phetchabun','Phetchabun',1),
	(3231,209,'Phetchaburi','Phetchaburi',1),
	(3232,209,'Phichit','Phichit',1),
	(3233,209,'Phitsanulok','Phitsanulok',1),
	(3234,209,'Phrae','Phrae',1),
	(3235,209,'Phuket','Phuket',1),
	(3236,209,'Prachin Buri','Prachin Buri',1),
	(3237,209,'Prachuap Khiri Khan','Prachuap Khiri Khan',1),
	(3238,209,'Ranong','Ranong',1),
	(3239,209,'Ratchaburi','Ratchaburi',1),
	(3240,209,'Rayong','Rayong',1),
	(3241,209,'Roi Et','Roi Et',1),
	(3242,209,'Sa Kaeo','Sa Kaeo',1),
	(3243,209,'Sakon Nakhon','Sakon Nakhon',1),
	(3244,209,'Samut Prakan','Samut Prakan',1),
	(3245,209,'Samut Sakhon','Samut Sakhon',1),
	(3246,209,'Samut Songkhram','Samut Songkhram',1),
	(3247,209,'Sara Buri','Sara Buri',1),
	(3248,209,'Satun','Satun',1),
	(3249,209,'Sing Buri','Sing Buri',1),
	(3250,209,'Sisaket','Sisaket',1),
	(3251,209,'Songkhla','Songkhla',1),
	(3252,209,'Sukhothai','Sukhothai',1),
	(3253,209,'Suphan Buri','Suphan Buri',1),
	(3254,209,'Surat Thani','Surat Thani',1),
	(3255,209,'Surin','Surin',1),
	(3256,209,'Tak','Tak',1),
	(3257,209,'Trang','Trang',1),
	(3258,209,'Trat','Trat',1),
	(3259,209,'Ubon Ratchathani','Ubon Ratchathani',1),
	(3260,209,'Udon Thani','Udon Thani',1),
	(3261,209,'Uthai Thani','Uthai Thani',1),
	(3262,209,'Uttaradit','Uttaradit',1),
	(3263,209,'Yala','Yala',1),
	(3264,209,'Yasothon','Yasothon',1),
	(3265,210,'Kara','K',1),
	(3266,210,'Plateaux','P',1),
	(3267,210,'Savanes','S',1),
	(3268,210,'Centrale','C',1),
	(3269,210,'Maritime','M',1),
	(3270,211,'Atafu','A',1),
	(3271,211,'Fakaofo','F',1),
	(3272,211,'Nukunonu','N',1),
	(3273,212,'Ha\'apai','H',1),
	(3274,212,'Tongatapu','T',1),
	(3275,212,'Vava\'u','V',1),
	(3276,213,'Couva/Tabaquite/Talparo','CT',1),
	(3277,213,'Diego Martin','DM',1),
	(3278,213,'Mayaro/Rio Claro','MR',1),
	(3279,213,'Penal/Debe','PD',1),
	(3280,213,'Princes Town','PT',1),
	(3281,213,'Sangre Grande','SG',1),
	(3282,213,'San Juan/Laventille','SL',1),
	(3283,213,'Siparia','SI',1),
	(3284,213,'Tunapuna/Piarco','TP',1),
	(3285,213,'Port of Spain','PS',1),
	(3286,213,'San Fernando','SF',1),
	(3287,213,'Arima','AR',1),
	(3288,213,'Point Fortin','PF',1),
	(3289,213,'Chaguanas','CH',1),
	(3290,213,'Tobago','TO',1),
	(3291,214,'Ariana','AR',1),
	(3292,214,'Beja','BJ',1),
	(3293,214,'Ben Arous','BA',1),
	(3294,214,'Bizerte','BI',1),
	(3295,214,'Gabes','GB',1),
	(3296,214,'Gafsa','GF',1),
	(3297,214,'Jendouba','JE',1),
	(3298,214,'Kairouan','KR',1),
	(3299,214,'Kasserine','KS',1),
	(3300,214,'Kebili','KB',1),
	(3301,214,'Kef','KF',1),
	(3302,214,'Mahdia','MH',1),
	(3303,214,'Manouba','MN',1),
	(3304,214,'Medenine','ME',1),
	(3305,214,'Monastir','MO',1),
	(3306,214,'Nabeul','NA',1),
	(3307,214,'Sfax','SF',1),
	(3308,214,'Sidi','SD',1),
	(3309,214,'Siliana','SL',1),
	(3310,214,'Sousse','SO',1),
	(3311,214,'Tataouine','TA',1),
	(3312,214,'Tozeur','TO',1),
	(3313,214,'Tunis','TU',1),
	(3314,214,'Zaghouan','ZA',1),
	(3315,215,'Adana','ADA',1),
	(3316,215,'Adıyaman','ADI',1),
	(3317,215,'Afyonkarahisar','AFY',1),
	(3318,215,'Ağrı','AGR',1),
	(3319,215,'Aksaray','AKS',1),
	(3320,215,'Amasya','AMA',1),
	(3321,215,'Ankara','ANK',1),
	(3322,215,'Antalya','ANT',1),
	(3323,215,'Ardahan','ARD',1),
	(3324,215,'Artvin','ART',1),
	(3325,215,'Aydın','AYI',1),
	(3326,215,'Balıkesir','BAL',1),
	(3327,215,'Bartın','BAR',1),
	(3328,215,'Batman','BAT',1),
	(3329,215,'Bayburt','BAY',1),
	(3330,215,'Bilecik','BIL',1),
	(3331,215,'Bingöl','BIN',1),
	(3332,215,'Bitlis','BIT',1),
	(3333,215,'Bolu','BOL',1),
	(3334,215,'Burdur','BRD',1),
	(3335,215,'Bursa','BRS',1),
	(3336,215,'Çanakkale','CKL',1),
	(3337,215,'Çankırı','CKR',1),
	(3338,215,'Çorum','COR',1),
	(3339,215,'Denizli','DEN',1),
	(3340,215,'Diyarbakır','DIY',1),
	(3341,215,'Düzce','DUZ',1),
	(3342,215,'Edirne','EDI',1),
	(3343,215,'Elazığ','ELA',1),
	(3344,215,'Erzincan','EZC',1),
	(3345,215,'Erzurum','EZR',1),
	(3346,215,'Eskişehir','ESK',1),
	(3347,215,'Gaziantep','GAZ',1),
	(3348,215,'Giresun','GIR',1),
	(3349,215,'Gümüşhane','GMS',1),
	(3350,215,'Hakkari','HKR',1),
	(3351,215,'Hatay','HTY',1),
	(3352,215,'Iğdır','IGD',1),
	(3353,215,'Isparta','ISP',1),
	(3354,215,'İstanbul','IST',1),
	(3355,215,'İzmir','IZM',1),
	(3356,215,'Kahramanmaraş','KAH',1),
	(3357,215,'Karabük','KRB',1),
	(3358,215,'Karaman','KRM',1),
	(3359,215,'Kars','KRS',1),
	(3360,215,'Kastamonu','KAS',1),
	(3361,215,'Kayseri','KAY',1),
	(3362,215,'Kilis','KLS',1),
	(3363,215,'Kırıkkale','KRK',1),
	(3364,215,'Kırklareli','KLR',1),
	(3365,215,'Kırşehir','KRH',1),
	(3366,215,'Kocaeli','KOC',1),
	(3367,215,'Konya','KON',1),
	(3368,215,'Kütahya','KUT',1),
	(3369,215,'Malatya','MAL',1),
	(3370,215,'Manisa','MAN',1),
	(3371,215,'Mardin','MAR',1),
	(3372,215,'Mersin','MER',1),
	(3373,215,'Muğla','MUG',1),
	(3374,215,'Muş','MUS',1),
	(3375,215,'Nevşehir','NEV',1),
	(3376,215,'Niğde','NIG',1),
	(3377,215,'Ordu','ORD',1),
	(3378,215,'Osmaniye','OSM',1),
	(3379,215,'Rize','RIZ',1),
	(3380,215,'Sakarya','SAK',1),
	(3381,215,'Samsun','SAM',1),
	(3382,215,'Şanlıurfa','SAN',1),
	(3383,215,'Siirt','SII',1),
	(3384,215,'Sinop','SIN',1),
	(3385,215,'Şırnak','SIR',1),
	(3386,215,'Sivas','SIV',1),
	(3387,215,'Tekirdağ','TEL',1),
	(3388,215,'Tokat','TOK',1),
	(3389,215,'Trabzon','TRA',1),
	(3390,215,'Tunceli','TUN',1),
	(3391,215,'Uşak','USK',1),
	(3392,215,'Van','VAN',1),
	(3393,215,'Yalova','YAL',1),
	(3394,215,'Yozgat','YOZ',1),
	(3395,215,'Zonguldak','ZON',1),
	(3396,216,'Ahal Welayaty','A',1),
	(3397,216,'Balkan Welayaty','B',1),
	(3398,216,'Dashhowuz Welayaty','D',1),
	(3399,216,'Lebap Welayaty','L',1),
	(3400,216,'Mary Welayaty','M',1),
	(3401,217,'Ambergris Cays','AC',1),
	(3402,217,'Dellis Cay','DC',1),
	(3403,217,'French Cay','FC',1),
	(3404,217,'Little Water Cay','LW',1),
	(3405,217,'Parrot Cay','RC',1),
	(3406,217,'Pine Cay','PN',1),
	(3407,217,'Salt Cay','SL',1),
	(3408,217,'Grand Turk','GT',1),
	(3409,217,'South Caicos','SC',1),
	(3410,217,'East Caicos','EC',1),
	(3411,217,'Middle Caicos','MC',1),
	(3412,217,'North Caicos','NC',1),
	(3413,217,'Providenciales','PR',1),
	(3414,217,'West Caicos','WC',1),
	(3415,218,'Nanumanga','NMG',1),
	(3416,218,'Niulakita','NLK',1),
	(3417,218,'Niutao','NTO',1),
	(3418,218,'Funafuti','FUN',1),
	(3419,218,'Nanumea','NME',1),
	(3420,218,'Nui','NUI',1),
	(3421,218,'Nukufetau','NFT',1),
	(3422,218,'Nukulaelae','NLL',1),
	(3423,218,'Vaitupu','VAI',1),
	(3424,219,'Kalangala','KAL',1),
	(3425,219,'Kampala','KMP',1),
	(3426,219,'Kayunga','KAY',1),
	(3427,219,'Kiboga','KIB',1),
	(3428,219,'Luwero','LUW',1),
	(3429,219,'Masaka','MAS',1),
	(3430,219,'Mpigi','MPI',1),
	(3431,219,'Mubende','MUB',1),
	(3432,219,'Mukono','MUK',1),
	(3433,219,'Nakasongola','NKS',1),
	(3434,219,'Rakai','RAK',1),
	(3435,219,'Sembabule','SEM',1),
	(3436,219,'Wakiso','WAK',1),
	(3437,219,'Bugiri','BUG',1),
	(3438,219,'Busia','BUS',1),
	(3439,219,'Iganga','IGA',1),
	(3440,219,'Jinja','JIN',1),
	(3441,219,'Kaberamaido','KAB',1),
	(3442,219,'Kamuli','KML',1),
	(3443,219,'Kapchorwa','KPC',1),
	(3444,219,'Katakwi','KTK',1),
	(3445,219,'Kumi','KUM',1),
	(3446,219,'Mayuge','MAY',1),
	(3447,219,'Mbale','MBA',1),
	(3448,219,'Pallisa','PAL',1),
	(3449,219,'Sironko','SIR',1),
	(3450,219,'Soroti','SOR',1),
	(3451,219,'Tororo','TOR',1),
	(3452,219,'Adjumani','ADJ',1),
	(3453,219,'Apac','APC',1),
	(3454,219,'Arua','ARU',1),
	(3455,219,'Gulu','GUL',1),
	(3456,219,'Kitgum','KIT',1),
	(3457,219,'Kotido','KOT',1),
	(3458,219,'Lira','LIR',1),
	(3459,219,'Moroto','MRT',1),
	(3460,219,'Moyo','MOY',1),
	(3461,219,'Nakapiripirit','NAK',1),
	(3462,219,'Nebbi','NEB',1),
	(3463,219,'Pader','PAD',1),
	(3464,219,'Yumbe','YUM',1),
	(3465,219,'Bundibugyo','BUN',1),
	(3466,219,'Bushenyi','BSH',1),
	(3467,219,'Hoima','HOI',1),
	(3468,219,'Kabale','KBL',1),
	(3469,219,'Kabarole','KAR',1),
	(3470,219,'Kamwenge','KAM',1),
	(3471,219,'Kanungu','KAN',1),
	(3472,219,'Kasese','KAS',1),
	(3473,219,'Kibaale','KBA',1),
	(3474,219,'Kisoro','KIS',1),
	(3475,219,'Kyenjojo','KYE',1),
	(3476,219,'Masindi','MSN',1),
	(3477,219,'Mbarara','MBR',1),
	(3478,219,'Ntungamo','NTU',1),
	(3479,219,'Rukungiri','RUK',1),
	(3480,220,'Cherkas\'ka Oblast\'','71',1),
	(3481,220,'Chernihivs\'ka Oblast\'','74',1),
	(3482,220,'Chernivets\'ka Oblast\'','77',1),
	(3483,220,'Crimea','43',1),
	(3484,220,'Dnipropetrovs\'ka Oblast\'','12',1),
	(3485,220,'Donets\'ka Oblast\'','14',1),
	(3486,220,'Ivano-Frankivs\'ka Oblast\'','26',1),
	(3487,220,'Khersons\'ka Oblast\'','65',1),
	(3488,220,'Khmel\'nyts\'ka Oblast\'','68',1),
	(3489,220,'Kirovohrads\'ka Oblast\'','35',1),
	(3490,220,'Kyiv','30',1),
	(3491,220,'Kyivs\'ka Oblast\'','32',1),
	(3492,220,'Luhans\'ka Oblast\'','09',1),
	(3493,220,'L\'vivs\'ka Oblast\'','46',1),
	(3494,220,'Mykolayivs\'ka Oblast\'','48',1),
	(3495,220,'Odes\'ka Oblast\'','51',1),
	(3496,220,'Poltavs\'ka Oblast\'','53',1),
	(3497,220,'Rivnens\'ka Oblast\'','56',1),
	(3498,220,'Sevastopol\'','40',1),
	(3499,220,'Sums\'ka Oblast\'','59',1),
	(3500,220,'Ternopil\'s\'ka Oblast\'','61',1),
	(3501,220,'Vinnyts\'ka Oblast\'','05',1),
	(3502,220,'Volyns\'ka Oblast\'','07',1),
	(3503,220,'Zakarpats\'ka Oblast\'','21',1),
	(3504,220,'Zaporiz\'ka Oblast\'','23',1),
	(3505,220,'Zhytomyrs\'ka oblast\'','18',1),
	(3506,221,'Abu Dhabi','ADH',1),
	(3507,221,'\'Ajman','AJ',1),
	(3508,221,'Al Fujayrah','FU',1),
	(3509,221,'Ash Shariqah','SH',1),
	(3510,221,'Dubai','DU',1),
	(3511,221,'R\'as al Khaymah','RK',1),
	(3512,221,'Umm al Qaywayn','UQ',1),
	(3513,222,'Aberdeen','ABN',1),
	(3514,222,'Aberdeenshire','ABNS',1),
	(3515,222,'Anglesey','ANG',1),
	(3516,222,'Angus','AGS',1),
	(3517,222,'Argyll and Bute','ARY',1),
	(3518,222,'Bedfordshire','BEDS',1),
	(3519,222,'Berkshire','BERKS',1),
	(3520,222,'Blaenau Gwent','BLA',1),
	(3521,222,'Bridgend','BRI',1),
	(3522,222,'Bristol','BSTL',1),
	(3523,222,'Buckinghamshire','BUCKS',1),
	(3524,222,'Caerphilly','CAE',1),
	(3525,222,'Cambridgeshire','CAMBS',1),
	(3526,222,'Cardiff','CDF',1),
	(3527,222,'Carmarthenshire','CARM',1),
	(3528,222,'Ceredigion','CDGN',1),
	(3529,222,'Cheshire','CHES',1),
	(3530,222,'Clackmannanshire','CLACK',1),
	(3531,222,'Conwy','CON',1),
	(3532,222,'Cornwall','CORN',1),
	(3533,222,'Denbighshire','DNBG',1),
	(3534,222,'Derbyshire','DERBY',1),
	(3535,222,'Devon','DVN',1),
	(3536,222,'Dorset','DOR',1),
	(3537,222,'Dumfries and Galloway','DGL',1),
	(3538,222,'Dundee','DUND',1),
	(3539,222,'Durham','DHM',1),
	(3540,222,'East Ayrshire','ARYE',1),
	(3541,222,'East Dunbartonshire','DUNBE',1),
	(3542,222,'East Lothian','LOTE',1),
	(3543,222,'East Renfrewshire','RENE',1),
	(3544,222,'East Riding of Yorkshire','ERYS',1),
	(3545,222,'East Sussex','SXE',1),
	(3546,222,'Edinburgh','EDIN',1),
	(3547,222,'Essex','ESX',1),
	(3548,222,'Falkirk','FALK',1),
	(3549,222,'Fife','FFE',1),
	(3550,222,'Flintshire','FLINT',1),
	(3551,222,'Glasgow','GLAS',1),
	(3552,222,'Gloucestershire','GLOS',1),
	(3553,222,'Greater London','LDN',1),
	(3554,222,'Greater Manchester','MCH',1),
	(3555,222,'Gwynedd','GDD',1),
	(3556,222,'Hampshire','HANTS',1),
	(3557,222,'Herefordshire','HWR',1),
	(3558,222,'Hertfordshire','HERTS',1),
	(3559,222,'Highlands','HLD',1),
	(3560,222,'Inverclyde','IVER',1),
	(3561,222,'Isle of Wight','IOW',1),
	(3562,222,'Kent','KNT',1),
	(3563,222,'Lancashire','LANCS',1),
	(3564,222,'Leicestershire','LEICS',1),
	(3565,222,'Lincolnshire','LINCS',1),
	(3566,222,'Merseyside','MSY',1),
	(3567,222,'Merthyr Tydfil','MERT',1),
	(3568,222,'Midlothian','MLOT',1),
	(3569,222,'Monmouthshire','MMOUTH',1),
	(3570,222,'Moray','MORAY',1),
	(3571,222,'Neath Port Talbot','NPRTAL',1),
	(3572,222,'Newport','NEWPT',1),
	(3573,222,'Norfolk','NOR',1),
	(3574,222,'North Ayrshire','ARYN',1),
	(3575,222,'North Lanarkshire','LANN',1),
	(3576,222,'North Yorkshire','YSN',1),
	(3577,222,'Northamptonshire','NHM',1),
	(3578,222,'Northumberland','NLD',1),
	(3579,222,'Nottinghamshire','NOT',1),
	(3580,222,'Orkney Islands','ORK',1),
	(3581,222,'Oxfordshire','OFE',1),
	(3582,222,'Pembrokeshire','PEM',1),
	(3583,222,'Perth and Kinross','PERTH',1),
	(3584,222,'Powys','PWS',1),
	(3585,222,'Renfrewshire','REN',1),
	(3586,222,'Rhondda Cynon Taff','RHON',1),
	(3587,222,'Rutland','RUT',1),
	(3588,222,'Scottish Borders','BOR',1),
	(3589,222,'Shetland Islands','SHET',1),
	(3590,222,'Shropshire','SPE',1),
	(3591,222,'Somerset','SOM',1),
	(3592,222,'South Ayrshire','ARYS',1),
	(3593,222,'South Lanarkshire','LANS',1),
	(3594,222,'South Yorkshire','YSS',1),
	(3595,222,'Staffordshire','SFD',1),
	(3596,222,'Stirling','STIR',1),
	(3597,222,'Suffolk','SFK',1),
	(3598,222,'Surrey','SRY',1),
	(3599,222,'Swansea','SWAN',1),
	(3600,222,'Torfaen','TORF',1),
	(3601,222,'Tyne and Wear','TWR',1),
	(3602,222,'Vale of Glamorgan','VGLAM',1),
	(3603,222,'Warwickshire','WARKS',1),
	(3604,222,'West Dunbartonshire','WDUN',1),
	(3605,222,'West Lothian','WLOT',1),
	(3606,222,'West Midlands','WMD',1),
	(3607,222,'West Sussex','SXW',1),
	(3608,222,'West Yorkshire','YSW',1),
	(3609,222,'Western Isles','WIL',1),
	(3610,222,'Wiltshire','WLT',1),
	(3611,222,'Worcestershire','WORCS',1),
	(3612,222,'Wrexham','WRX',1),
	(3613,223,'Alabama','AL',1),
	(3614,223,'Alaska','AK',1),
	(3615,223,'American Samoa','AS',1),
	(3616,223,'Arizona','AZ',1),
	(3617,223,'Arkansas','AR',1),
	(3618,223,'Armed Forces Africa','AF',1),
	(3619,223,'Armed Forces Americas','AA',1),
	(3620,223,'Armed Forces Canada','AC',1),
	(3621,223,'Armed Forces Europe','AE',1),
	(3622,223,'Armed Forces Middle East','AM',1),
	(3623,223,'Armed Forces Pacific','AP',1),
	(3624,223,'California','CA',1),
	(3625,223,'Colorado','CO',1),
	(3626,223,'Connecticut','CT',1),
	(3627,223,'Delaware','DE',1),
	(3628,223,'District of Columbia','DC',1),
	(3629,223,'Federated States Of Micronesia','FM',1),
	(3630,223,'Florida','FL',1),
	(3631,223,'Georgia','GA',1),
	(3632,223,'Guam','GU',1),
	(3633,223,'Hawaii','HI',1),
	(3634,223,'Idaho','ID',1),
	(3635,223,'Illinois','IL',1),
	(3636,223,'Indiana','IN',1),
	(3637,223,'Iowa','IA',1),
	(3638,223,'Kansas','KS',1),
	(3639,223,'Kentucky','KY',1),
	(3640,223,'Louisiana','LA',1),
	(3641,223,'Maine','ME',1),
	(3642,223,'Marshall Islands','MH',1),
	(3643,223,'Maryland','MD',1),
	(3644,223,'Massachusetts','MA',1),
	(3645,223,'Michigan','MI',1),
	(3646,223,'Minnesota','MN',1),
	(3647,223,'Mississippi','MS',1),
	(3648,223,'Missouri','MO',1),
	(3649,223,'Montana','MT',1),
	(3650,223,'Nebraska','NE',1),
	(3651,223,'Nevada','NV',1),
	(3652,223,'New Hampshire','NH',1),
	(3653,223,'New Jersey','NJ',1),
	(3654,223,'New Mexico','NM',1),
	(3655,223,'New York','NY',1),
	(3656,223,'North Carolina','NC',1),
	(3657,223,'North Dakota','ND',1),
	(3658,223,'Northern Mariana Islands','MP',1),
	(3659,223,'Ohio','OH',1),
	(3660,223,'Oklahoma','OK',1),
	(3661,223,'Oregon','OR',1),
	(3662,223,'Palau','PW',1),
	(3663,223,'Pennsylvania','PA',1),
	(3664,223,'Puerto Rico','PR',1),
	(3665,223,'Rhode Island','RI',1),
	(3666,223,'South Carolina','SC',1),
	(3667,223,'South Dakota','SD',1),
	(3668,223,'Tennessee','TN',1),
	(3669,223,'Texas','TX',1),
	(3670,223,'Utah','UT',1),
	(3671,223,'Vermont','VT',1),
	(3672,223,'Virgin Islands','VI',1),
	(3673,223,'Virginia','VA',1),
	(3674,223,'Washington','WA',1),
	(3675,223,'West Virginia','WV',1),
	(3676,223,'Wisconsin','WI',1),
	(3677,223,'Wyoming','WY',1),
	(3678,224,'Baker Island','BI',1),
	(3679,224,'Howland Island','HI',1),
	(3680,224,'Jarvis Island','JI',1),
	(3681,224,'Johnston Atoll','JA',1),
	(3682,224,'Kingman Reef','KR',1),
	(3683,224,'Midway Atoll','MA',1),
	(3684,224,'Navassa Island','NI',1),
	(3685,224,'Palmyra Atoll','PA',1),
	(3686,224,'Wake Island','WI',1),
	(3687,225,'Artigas','AR',1),
	(3688,225,'Canelones','CA',1),
	(3689,225,'Cerro Largo','CL',1),
	(3690,225,'Colonia','CO',1),
	(3691,225,'Durazno','DU',1),
	(3692,225,'Flores','FS',1),
	(3693,225,'Florida','FA',1),
	(3694,225,'Lavalleja','LA',1),
	(3695,225,'Maldonado','MA',1),
	(3696,225,'Montevideo','MO',1),
	(3697,225,'Paysandu','PA',1),
	(3698,225,'Rio Negro','RN',1),
	(3699,225,'Rivera','RV',1),
	(3700,225,'Rocha','RO',1),
	(3701,225,'Salto','SL',1),
	(3702,225,'San Jose','SJ',1),
	(3703,225,'Soriano','SO',1),
	(3704,225,'Tacuarembo','TA',1),
	(3705,225,'Treinta y Tres','TT',1),
	(3706,226,'Andijon','AN',1),
	(3707,226,'Buxoro','BU',1),
	(3708,226,'Farg\'ona','FA',1),
	(3709,226,'Jizzax','JI',1),
	(3710,226,'Namangan','NG',1),
	(3711,226,'Navoiy','NW',1),
	(3712,226,'Qashqadaryo','QA',1),
	(3713,226,'Qoraqalpog\'iston Republikasi','QR',1),
	(3714,226,'Samarqand','SA',1),
	(3715,226,'Sirdaryo','SI',1),
	(3716,226,'Surxondaryo','SU',1),
	(3717,226,'Toshkent City','TK',1),
	(3718,226,'Toshkent Region','TO',1),
	(3719,226,'Xorazm','XO',1),
	(3720,227,'Malampa','MA',1),
	(3721,227,'Penama','PE',1),
	(3722,227,'Sanma','SA',1),
	(3723,227,'Shefa','SH',1),
	(3724,227,'Tafea','TA',1),
	(3725,227,'Torba','TO',1),
	(3726,229,'Amazonas','AM',1),
	(3727,229,'Anzoategui','AN',1),
	(3728,229,'Apure','AP',1),
	(3729,229,'Aragua','AR',1),
	(3730,229,'Barinas','BA',1),
	(3731,229,'Bolivar','BO',1),
	(3732,229,'Carabobo','CA',1),
	(3733,229,'Cojedes','CO',1),
	(3734,229,'Delta Amacuro','DA',1),
	(3735,229,'Dependencias Federales','DF',1),
	(3736,229,'Distrito Federal','DI',1),
	(3737,229,'Falcon','FA',1),
	(3738,229,'Guarico','GU',1),
	(3739,229,'Lara','LA',1),
	(3740,229,'Merida','ME',1),
	(3741,229,'Miranda','MI',1),
	(3742,229,'Monagas','MO',1),
	(3743,229,'Nueva Esparta','NE',1),
	(3744,229,'Portuguesa','PO',1),
	(3745,229,'Sucre','SU',1),
	(3746,229,'Tachira','TA',1),
	(3747,229,'Trujillo','TR',1),
	(3748,229,'Vargas','VA',1),
	(3749,229,'Yaracuy','YA',1),
	(3750,229,'Zulia','ZU',1),
	(3751,230,'An Giang','AG',1),
	(3752,230,'Bac Giang','BG',1),
	(3753,230,'Bac Kan','BK',1),
	(3754,230,'Bac Lieu','BL',1),
	(3755,230,'Bac Ninh','BC',1),
	(3756,230,'Ba Ria-Vung Tau','BR',1),
	(3757,230,'Ben Tre','BN',1),
	(3758,230,'Binh Dinh','BH',1),
	(3759,230,'Binh Duong','BU',1),
	(3760,230,'Binh Phuoc','BP',1),
	(3761,230,'Binh Thuan','BT',1),
	(3762,230,'Ca Mau','CM',1),
	(3763,230,'Can Tho','CT',1),
	(3764,230,'Cao Bang','CB',1),
	(3765,230,'Dak Lak','DL',1),
	(3766,230,'Dak Nong','DG',1),
	(3767,230,'Da Nang','DN',1),
	(3768,230,'Dien Bien','DB',1),
	(3769,230,'Dong Nai','DI',1),
	(3770,230,'Dong Thap','DT',1),
	(3771,230,'Gia Lai','GL',1),
	(3772,230,'Ha Giang','HG',1),
	(3773,230,'Hai Duong','HD',1),
	(3774,230,'Hai Phong','HP',1),
	(3775,230,'Ha Nam','HM',1),
	(3776,230,'Ha Noi','HI',1),
	(3777,230,'Ha Tay','HT',1),
	(3778,230,'Ha Tinh','HH',1),
	(3779,230,'Hoa Binh','HB',1),
	(3780,230,'Ho Chi Minh City','HC',1),
	(3781,230,'Hau Giang','HU',1),
	(3782,230,'Hung Yen','HY',1),
	(3783,232,'Saint Croix','C',1),
	(3784,232,'Saint John','J',1),
	(3785,232,'Saint Thomas','T',1),
	(3786,233,'Alo','A',1),
	(3787,233,'Sigave','S',1),
	(3788,233,'Wallis','W',1),
	(3789,235,'Abyan','AB',1),
	(3790,235,'Adan','AD',1),
	(3791,235,'Amran','AM',1),
	(3792,235,'Al Bayda','BA',1),
	(3793,235,'Ad Dali','DA',1),
	(3794,235,'Dhamar','DH',1),
	(3795,235,'Hadramawt','HD',1),
	(3796,235,'Hajjah','HJ',1),
	(3797,235,'Al Hudaydah','HU',1),
	(3798,235,'Ibb','IB',1),
	(3799,235,'Al Jawf','JA',1),
	(3800,235,'Lahij','LA',1),
	(3801,235,'Ma\'rib','MA',1),
	(3802,235,'Al Mahrah','MR',1),
	(3803,235,'Al Mahwit','MW',1),
	(3804,235,'Sa\'dah','SD',1),
	(3805,235,'San\'a','SN',1),
	(3806,235,'Shabwah','SH',1),
	(3807,235,'Ta\'izz','TA',1),
	(3812,237,'Bas-Congo','BC',1),
	(3813,237,'Bandundu','BN',1),
	(3814,237,'Equateur','EQ',1),
	(3815,237,'Katanga','KA',1),
	(3816,237,'Kasai-Oriental','KE',1),
	(3817,237,'Kinshasa','KN',1),
	(3818,237,'Kasai-Occidental','KW',1),
	(3819,237,'Maniema','MA',1),
	(3820,237,'Nord-Kivu','NK',1),
	(3821,237,'Orientale','OR',1),
	(3822,237,'Sud-Kivu','SK',1),
	(3823,238,'Central','CE',1),
	(3824,238,'Copperbelt','CB',1),
	(3825,238,'Eastern','EA',1),
	(3826,238,'Luapula','LP',1),
	(3827,238,'Lusaka','LK',1),
	(3828,238,'Northern','NO',1),
	(3829,238,'North-Western','NW',1),
	(3830,238,'Southern','SO',1),
	(3831,238,'Western','WE',1),
	(3832,239,'Bulawayo','BU',1),
	(3833,239,'Harare','HA',1),
	(3834,239,'Manicaland','ML',1),
	(3835,239,'Mashonaland Central','MC',1),
	(3836,239,'Mashonaland East','ME',1),
	(3837,239,'Mashonaland West','MW',1),
	(3838,239,'Masvingo','MV',1),
	(3839,239,'Matabeleland North','MN',1),
	(3840,239,'Matabeleland South','MS',1),
	(3841,239,'Midlands','MD',1),
	(3861,105,'Campobasso','CB',1),
	(3862,105,'Carbonia-Iglesias','CI',1),
	(3863,105,'Caserta','CE',1),
	(3864,105,'Catania','CT',1),
	(3865,105,'Catanzaro','CZ',1),
	(3866,105,'Chieti','CH',1),
	(3867,105,'Como','CO',1),
	(3868,105,'Cosenza','CS',1),
	(3869,105,'Cremona','CR',1),
	(3870,105,'Crotone','KR',1),
	(3871,105,'Cuneo','CN',1),
	(3872,105,'Enna','EN',1),
	(3873,105,'Ferrara','FE',1),
	(3874,105,'Firenze','FI',1),
	(3875,105,'Foggia','FG',1),
	(3876,105,'Forli-Cesena','FC',1),
	(3877,105,'Frosinone','FR',1),
	(3878,105,'Genova','GE',1),
	(3879,105,'Gorizia','GO',1),
	(3880,105,'Grosseto','GR',1),
	(3881,105,'Imperia','IM',1),
	(3882,105,'Isernia','IS',1),
	(3883,105,'L&#39;Aquila','AQ',1),
	(3884,105,'La Spezia','SP',1),
	(3885,105,'Latina','LT',1),
	(3886,105,'Lecce','LE',1),
	(3887,105,'Lecco','LC',1),
	(3888,105,'Livorno','LI',1),
	(3889,105,'Lodi','LO',1),
	(3890,105,'Lucca','LU',1),
	(3891,105,'Macerata','MC',1),
	(3892,105,'Mantova','MN',1),
	(3893,105,'Massa-Carrara','MS',1),
	(3894,105,'Matera','MT',1),
	(3895,105,'Medio Campidano','VS',1),
	(3896,105,'Messina','ME',1),
	(3897,105,'Milano','MI',1),
	(3898,105,'Modena','MO',1),
	(3899,105,'Napoli','NA',1),
	(3900,105,'Novara','NO',1),
	(3901,105,'Nuoro','NU',1),
	(3902,105,'Ogliastra','OG',1),
	(3903,105,'Olbia-Tempio','OT',1),
	(3904,105,'Oristano','OR',1),
	(3905,105,'Padova','PD',1),
	(3906,105,'Palermo','PA',1),
	(3907,105,'Parma','PR',1),
	(3908,105,'Pavia','PV',1),
	(3909,105,'Perugia','PG',1),
	(3910,105,'Pesaro e Urbino','PU',1),
	(3911,105,'Pescara','PE',1),
	(3912,105,'Piacenza','PC',1),
	(3913,105,'Pisa','PI',1),
	(3914,105,'Pistoia','PT',1),
	(3915,105,'Pordenone','PN',1),
	(3916,105,'Potenza','PZ',1),
	(3917,105,'Prato','PO',1),
	(3918,105,'Ragusa','RG',1),
	(3919,105,'Ravenna','RA',1),
	(3920,105,'Reggio Calabria','RC',1),
	(3921,105,'Reggio Emilia','RE',1),
	(3922,105,'Rieti','RI',1),
	(3923,105,'Rimini','RN',1),
	(3924,105,'Roma','RM',1),
	(3925,105,'Rovigo','RO',1),
	(3926,105,'Salerno','SA',1),
	(3927,105,'Sassari','SS',1),
	(3928,105,'Savona','SV',1),
	(3929,105,'Siena','SI',1),
	(3930,105,'Siracusa','SR',1),
	(3931,105,'Sondrio','SO',1),
	(3932,105,'Taranto','TA',1),
	(3933,105,'Teramo','TE',1),
	(3934,105,'Terni','TR',1),
	(3935,105,'Torino','TO',1),
	(3936,105,'Trapani','TP',1),
	(3937,105,'Trento','TN',1),
	(3938,105,'Treviso','TV',1),
	(3939,105,'Trieste','TS',1),
	(3940,105,'Udine','UD',1),
	(3941,105,'Varese','VA',1),
	(3942,105,'Venezia','VE',1),
	(3943,105,'Verbano-Cusio-Ossola','VB',1),
	(3944,105,'Vercelli','VC',1),
	(3945,105,'Verona','VR',1),
	(3946,105,'Vibo Valentia','VV',1),
	(3947,105,'Vicenza','VI',1),
	(3948,105,'Viterbo','VT',1),
	(3949,222,'County Antrim','ANT',1),
	(3950,222,'County Armagh','ARM',1),
	(3951,222,'County Down','DOW',1),
	(3952,222,'County Fermanagh','FER',1),
	(3953,222,'County Londonderry','LDY',1),
	(3954,222,'County Tyrone','TYR',1),
	(3955,222,'Cumbria','CMA',1),
	(3956,190,'Pomurska','1',1),
	(3957,190,'Podravska','2',1),
	(3958,190,'Koroška','3',1),
	(3959,190,'Savinjska','4',1),
	(3960,190,'Zasavska','5',1),
	(3961,190,'Spodnjeposavska','6',1),
	(3962,190,'Jugovzhodna Slovenija','7',1),
	(3963,190,'Osrednjeslovenska','8',1),
	(3964,190,'Gorenjska','9',1),
	(3965,190,'Notranjsko-kraška','10',1),
	(3966,190,'Goriška','11',1),
	(3967,190,'Obalno-kraška','12',1),
	(3968,33,'Ruse','',1),
	(3969,101,'Alborz','ALB',1),
	(3970,21,'Brussels-Capital Region','BRU',1),
	(3971,138,'Aguascalientes','AG',1),
	(3973,242,'Andrijevica','01',1),
	(3974,242,'Bar','02',1),
	(3975,242,'Berane','03',1),
	(3976,242,'Bijelo Polje','04',1),
	(3977,242,'Budva','05',1),
	(3978,242,'Cetinje','06',1),
	(3979,242,'Danilovgrad','07',1),
	(3980,242,'Herceg-Novi','08',1),
	(3981,242,'Kolašin','09',1),
	(3982,242,'Kotor','10',1),
	(3983,242,'Mojkovac','11',1),
	(3984,242,'Nikšić','12',1),
	(3985,242,'Plav','13',1),
	(3986,242,'Pljevlja','14',1),
	(3987,242,'Plužine','15',1),
	(3988,242,'Podgorica','16',1),
	(3989,242,'Rožaje','17',1),
	(3990,242,'Šavnik','18',1),
	(3991,242,'Tivat','19',1),
	(3992,242,'Ulcinj','20',1),
	(3993,242,'Žabljak','21',1),
	(3994,243,'Belgrade','00',1),
	(3995,243,'North Bačka','01',1),
	(3996,243,'Central Banat','02',1),
	(3997,243,'North Banat','03',1),
	(3998,243,'South Banat','04',1),
	(3999,243,'West Bačka','05',1),
	(4000,243,'South Bačka','06',1),
	(4001,243,'Srem','07',1),
	(4002,243,'Mačva','08',1),
	(4003,243,'Kolubara','09',1),
	(4004,243,'Podunavlje','10',1),
	(4005,243,'Braničevo','11',1),
	(4006,243,'Šumadija','12',1),
	(4007,243,'Pomoravlje','13',1),
	(4008,243,'Bor','14',1),
	(4009,243,'Zaječar','15',1),
	(4010,243,'Zlatibor','16',1),
	(4011,243,'Moravica','17',1),
	(4012,243,'Raška','18',1),
	(4013,243,'Rasina','19',1),
	(4014,243,'Nišava','20',1),
	(4015,243,'Toplica','21',1),
	(4016,243,'Pirot','22',1),
	(4017,243,'Jablanica','23',1),
	(4018,243,'Pčinja','24',1),
	(4020,245,'Bonaire','BO',1),
	(4021,245,'Saba','SA',1),
	(4022,245,'Sint Eustatius','SE',1),
	(4023,248,'Central Equatoria','EC',1),
	(4024,248,'Eastern Equatoria','EE',1),
	(4025,248,'Jonglei','JG',1),
	(4026,248,'Lakes','LK',1),
	(4027,248,'Northern Bahr el-Ghazal','BN',1),
	(4028,248,'Unity','UY',1),
	(4029,248,'Upper Nile','NU',1),
	(4030,248,'Warrap','WR',1),
	(4031,248,'Western Bahr el-Ghazal','BW',1),
	(4032,248,'Western Equatoria','EW',1),
	(4036,117,'Ainaži, Salacgrīvas novads','0661405',1),
	(4037,117,'Aizkraukle, Aizkraukles novads','0320201',1),
	(4038,117,'Aizkraukles novads','0320200',1),
	(4039,117,'Aizpute, Aizputes novads','0640605',1),
	(4040,117,'Aizputes novads','0640600',1),
	(4041,117,'Aknīste, Aknīstes novads','0560805',1),
	(4042,117,'Aknīstes novads','0560800',1),
	(4043,117,'Aloja, Alojas novads','0661007',1),
	(4044,117,'Alojas novads','0661000',1),
	(4045,117,'Alsungas novads','0624200',1),
	(4046,117,'Alūksne, Alūksnes novads','0360201',1),
	(4047,117,'Alūksnes novads','0360200',1),
	(4048,117,'Amatas novads','0424701',1),
	(4049,117,'Ape, Apes novads','0360805',1),
	(4050,117,'Apes novads','0360800',1),
	(4051,117,'Auce, Auces novads','0460805',1),
	(4052,117,'Auces novads','0460800',1),
	(4053,117,'Ādažu novads','0804400',1),
	(4054,117,'Babītes novads','0804900',1),
	(4055,117,'Baldone, Baldones novads','0800605',1),
	(4056,117,'Baldones novads','0800600',1),
	(4057,117,'Baloži, Ķekavas novads','0800807',1),
	(4058,117,'Baltinavas novads','0384400',1),
	(4059,117,'Balvi, Balvu novads','0380201',1),
	(4060,117,'Balvu novads','0380200',1),
	(4061,117,'Bauska, Bauskas novads','0400201',1),
	(4062,117,'Bauskas novads','0400200',1),
	(4063,117,'Beverīnas novads','0964700',1),
	(4064,117,'Brocēni, Brocēnu novads','0840605',1),
	(4065,117,'Brocēnu novads','0840601',1),
	(4066,117,'Burtnieku novads','0967101',1),
	(4067,117,'Carnikavas novads','0805200',1),
	(4068,117,'Cesvaine, Cesvaines novads','0700807',1),
	(4069,117,'Cesvaines novads','0700800',1),
	(4070,117,'Cēsis, Cēsu novads','0420201',1),
	(4071,117,'Cēsu novads','0420200',1),
	(4072,117,'Ciblas novads','0684901',1),
	(4073,117,'Dagda, Dagdas novads','0601009',1),
	(4074,117,'Dagdas novads','0601000',1),
	(4075,117,'Daugavpils','0050000',1),
	(4076,117,'Daugavpils novads','0440200',1),
	(4077,117,'Dobele, Dobeles novads','0460201',1),
	(4078,117,'Dobeles novads','0460200',1),
	(4079,117,'Dundagas novads','0885100',1),
	(4080,117,'Durbe, Durbes novads','0640807',1),
	(4081,117,'Durbes novads','0640801',1),
	(4082,117,'Engures novads','0905100',1),
	(4083,117,'Ērgļu novads','0705500',1),
	(4084,117,'Garkalnes novads','0806000',1),
	(4085,117,'Grobiņa, Grobiņas novads','0641009',1),
	(4086,117,'Grobiņas novads','0641000',1),
	(4087,117,'Gulbene, Gulbenes novads','0500201',1),
	(4088,117,'Gulbenes novads','0500200',1),
	(4089,117,'Iecavas novads','0406400',1),
	(4090,117,'Ikšķile, Ikšķiles novads','0740605',1),
	(4091,117,'Ikšķiles novads','0740600',1),
	(4092,117,'Ilūkste, Ilūkstes novads','0440807',1),
	(4093,117,'Ilūkstes novads','0440801',1),
	(4094,117,'Inčukalna novads','0801800',1),
	(4095,117,'Jaunjelgava, Jaunjelgavas novads','0321007',1),
	(4096,117,'Jaunjelgavas novads','0321000',1),
	(4097,117,'Jaunpiebalgas novads','0425700',1),
	(4098,117,'Jaunpils novads','0905700',1),
	(4099,117,'Jelgava','0090000',1),
	(4100,117,'Jelgavas novads','0540200',1),
	(4101,117,'Jēkabpils','0110000',1),
	(4102,117,'Jēkabpils novads','0560200',1),
	(4103,117,'Jūrmala','0130000',1),
	(4104,117,'Kalnciems, Jelgavas novads','0540211',1),
	(4105,117,'Kandava, Kandavas novads','0901211',1),
	(4106,117,'Kandavas novads','0901201',1),
	(4107,117,'Kārsava, Kārsavas novads','0681009',1),
	(4108,117,'Kārsavas novads','0681000',1),
	(4109,117,'Kocēnu novads ,bij. Valmieras)','0960200',1),
	(4110,117,'Kokneses novads','0326100',1),
	(4111,117,'Krāslava, Krāslavas novads','0600201',1),
	(4112,117,'Krāslavas novads','0600202',1),
	(4113,117,'Krimuldas novads','0806900',1),
	(4114,117,'Krustpils novads','0566900',1),
	(4115,117,'Kuldīga, Kuldīgas novads','0620201',1),
	(4116,117,'Kuldīgas novads','0620200',1),
	(4117,117,'Ķeguma novads','0741001',1),
	(4118,117,'Ķegums, Ķeguma novads','0741009',1),
	(4119,117,'Ķekavas novads','0800800',1),
	(4120,117,'Lielvārde, Lielvārdes novads','0741413',1),
	(4121,117,'Lielvārdes novads','0741401',1),
	(4122,117,'Liepāja','0170000',1),
	(4123,117,'Limbaži, Limbažu novads','0660201',1),
	(4124,117,'Limbažu novads','0660200',1),
	(4125,117,'Līgatne, Līgatnes novads','0421211',1),
	(4126,117,'Līgatnes novads','0421200',1),
	(4127,117,'Līvāni, Līvānu novads','0761211',1),
	(4128,117,'Līvānu novads','0761201',1),
	(4129,117,'Lubāna, Lubānas novads','0701413',1),
	(4130,117,'Lubānas novads','0701400',1),
	(4131,117,'Ludza, Ludzas novads','0680201',1),
	(4132,117,'Ludzas novads','0680200',1),
	(4133,117,'Madona, Madonas novads','0700201',1),
	(4134,117,'Madonas novads','0700200',1),
	(4135,117,'Mazsalaca, Mazsalacas novads','0961011',1),
	(4136,117,'Mazsalacas novads','0961000',1),
	(4137,117,'Mālpils novads','0807400',1),
	(4138,117,'Mārupes novads','0807600',1),
	(4139,117,'Mērsraga novads','0887600',1),
	(4140,117,'Naukšēnu novads','0967300',1),
	(4141,117,'Neretas novads','0327100',1),
	(4142,117,'Nīcas novads','0647900',1),
	(4143,117,'Ogre, Ogres novads','0740201',1),
	(4144,117,'Ogres novads','0740202',1),
	(4145,117,'Olaine, Olaines novads','0801009',1),
	(4146,117,'Olaines novads','0801000',1),
	(4147,117,'Ozolnieku novads','0546701',1),
	(4148,117,'Pārgaujas novads','0427500',1),
	(4149,117,'Pāvilosta, Pāvilostas novads','0641413',1),
	(4150,117,'Pāvilostas novads','0641401',1),
	(4151,117,'Piltene, Ventspils novads','0980213',1),
	(4152,117,'Pļaviņas, Pļaviņu novads','0321413',1),
	(4153,117,'Pļaviņu novads','0321400',1),
	(4154,117,'Preiļi, Preiļu novads','0760201',1),
	(4155,117,'Preiļu novads','0760202',1),
	(4156,117,'Priekule, Priekules novads','0641615',1),
	(4157,117,'Priekules novads','0641600',1),
	(4158,117,'Priekuļu novads','0427300',1),
	(4159,117,'Raunas novads','0427700',1),
	(4160,117,'Rēzekne','0210000',1),
	(4161,117,'Rēzeknes novads','0780200',1),
	(4162,117,'Riebiņu novads','0766300',1),
	(4163,117,'Rīga','0010000',1),
	(4164,117,'Rojas novads','0888300',1),
	(4165,117,'Ropažu novads','0808400',1),
	(4166,117,'Rucavas novads','0648500',1),
	(4167,117,'Rugāju novads','0387500',1),
	(4168,117,'Rundāles novads','0407700',1),
	(4169,117,'Rūjiena, Rūjienas novads','0961615',1),
	(4170,117,'Rūjienas novads','0961600',1),
	(4171,117,'Sabile, Talsu novads','0880213',1),
	(4172,117,'Salacgrīva, Salacgrīvas novads','0661415',1),
	(4173,117,'Salacgrīvas novads','0661400',1),
	(4174,117,'Salas novads','0568700',1),
	(4175,117,'Salaspils novads','0801200',1),
	(4176,117,'Salaspils, Salaspils novads','0801211',1),
	(4177,117,'Saldus novads','0840200',1),
	(4178,117,'Saldus, Saldus novads','0840201',1),
	(4179,117,'Saulkrasti, Saulkrastu novads','0801413',1),
	(4180,117,'Saulkrastu novads','0801400',1),
	(4181,117,'Seda, Strenču novads','0941813',1),
	(4182,117,'Sējas novads','0809200',1),
	(4183,117,'Sigulda, Siguldas novads','0801615',1),
	(4184,117,'Siguldas novads','0801601',1),
	(4185,117,'Skrīveru novads','0328200',1),
	(4186,117,'Skrunda, Skrundas novads','0621209',1),
	(4187,117,'Skrundas novads','0621200',1),
	(4188,117,'Smiltene, Smiltenes novads','0941615',1),
	(4189,117,'Smiltenes novads','0941600',1),
	(4190,117,'Staicele, Alojas novads','0661017',1),
	(4191,117,'Stende, Talsu novads','0880215',1),
	(4192,117,'Stopiņu novads','0809600',1),
	(4193,117,'Strenči, Strenču novads','0941817',1),
	(4194,117,'Strenču novads','0941800',1),
	(4195,117,'Subate, Ilūkstes novads','0440815',1),
	(4196,117,'Talsi, Talsu novads','0880201',1),
	(4197,117,'Talsu novads','0880200',1),
	(4198,117,'Tērvetes novads','0468900',1),
	(4199,117,'Tukuma novads','0900200',1),
	(4200,117,'Tukums, Tukuma novads','0900201',1),
	(4201,117,'Vaiņodes novads','0649300',1),
	(4202,117,'Valdemārpils, Talsu novads','0880217',1),
	(4203,117,'Valka, Valkas novads','0940201',1),
	(4204,117,'Valkas novads','0940200',1),
	(4205,117,'Valmiera','0250000',1),
	(4206,117,'Vangaži, Inčukalna novads','0801817',1),
	(4207,117,'Varakļāni, Varakļānu novads','0701817',1),
	(4208,117,'Varakļānu novads','0701800',1),
	(4209,117,'Vārkavas novads','0769101',1),
	(4210,117,'Vecpiebalgas novads','0429300',1),
	(4211,117,'Vecumnieku novads','0409500',1),
	(4212,117,'Ventspils','0270000',1),
	(4213,117,'Ventspils novads','0980200',1),
	(4214,117,'Viesīte, Viesītes novads','0561815',1),
	(4215,117,'Viesītes novads','0561800',1),
	(4216,117,'Viļaka, Viļakas novads','0381615',1),
	(4217,117,'Viļakas novads','0381600',1),
	(4218,117,'Viļāni, Viļānu novads','0781817',1),
	(4219,117,'Viļānu novads','0781800',1),
	(4220,117,'Zilupe, Zilupes novads','0681817',1),
	(4221,117,'Zilupes novads','0681801',1),
	(4222,43,'Arica y Parinacota','AP',1),
	(4223,43,'Los Rios','LR',1),
	(4224,220,'Kharkivs\'ka Oblast\'','63',1),
	(4225,118,'Beirut','LB-BR',1),
	(4226,118,'Bekaa','LB-BE',1),
	(4227,118,'Mount Lebanon','LB-ML',1),
	(4228,118,'Nabatieh','LB-NB',1),
	(4229,118,'North','LB-NR',1),
	(4230,118,'South','LB-ST',1),
	(4231,99,'Telangana','TS',1),
	(4232,44,'Qinghai','QH',1),
	(4233,100,'Papua Barat','PB',1),
	(4234,100,'Sulawesi Barat','SR',1),
	(4235,100,'Kepulauan Riau','KR',1);

/*!40000 ALTER TABLE `zone` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table zone_to_geo_zone
# ------------------------------------------------------------

DROP TABLE IF EXISTS `zone_to_geo_zone`;

CREATE TABLE `zone_to_geo_zone` (
  `zone_to_geo_zone_id` int(11) NOT NULL AUTO_INCREMENT,
  `country_id` int(11) NOT NULL,
  `zone_id` int(11) NOT NULL DEFAULT '0',
  `geo_zone_id` int(11) NOT NULL,
  `date_added` datetime NOT NULL,
  `date_modified` datetime NOT NULL,
  PRIMARY KEY (`zone_to_geo_zone_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

LOCK TABLES `zone_to_geo_zone` WRITE;
/*!40000 ALTER TABLE `zone_to_geo_zone` DISABLE KEYS */;

INSERT INTO `zone_to_geo_zone` (`zone_to_geo_zone_id`, `country_id`, `zone_id`, `geo_zone_id`, `date_added`, `date_modified`)
VALUES
	(1,222,0,4,'0000-00-00 00:00:00','0000-00-00 00:00:00'),
	(2,222,3513,3,'0000-00-00 00:00:00','0000-00-00 00:00:00'),
	(3,222,3514,3,'0000-00-00 00:00:00','0000-00-00 00:00:00'),
	(4,222,3515,3,'0000-00-00 00:00:00','0000-00-00 00:00:00'),
	(5,222,3516,3,'0000-00-00 00:00:00','0000-00-00 00:00:00'),
	(6,222,3517,3,'0000-00-00 00:00:00','0000-00-00 00:00:00'),
	(7,222,3518,3,'0000-00-00 00:00:00','0000-00-00 00:00:00'),
	(8,222,3519,3,'0000-00-00 00:00:00','0000-00-00 00:00:00'),
	(9,222,3520,3,'0000-00-00 00:00:00','0000-00-00 00:00:00'),
	(10,222,3521,3,'0000-00-00 00:00:00','0000-00-00 00:00:00'),
	(11,222,3522,3,'0000-00-00 00:00:00','0000-00-00 00:00:00'),
	(12,222,3523,3,'0000-00-00 00:00:00','0000-00-00 00:00:00'),
	(13,222,3524,3,'0000-00-00 00:00:00','0000-00-00 00:00:00'),
	(14,222,3525,3,'0000-00-00 00:00:00','0000-00-00 00:00:00'),
	(15,222,3526,3,'0000-00-00 00:00:00','0000-00-00 00:00:00'),
	(16,222,3527,3,'0000-00-00 00:00:00','0000-00-00 00:00:00'),
	(17,222,3528,3,'0000-00-00 00:00:00','0000-00-00 00:00:00'),
	(18,222,3529,3,'0000-00-00 00:00:00','0000-00-00 00:00:00'),
	(19,222,3530,3,'0000-00-00 00:00:00','0000-00-00 00:00:00'),
	(20,222,3531,3,'0000-00-00 00:00:00','0000-00-00 00:00:00'),
	(21,222,3532,3,'0000-00-00 00:00:00','0000-00-00 00:00:00'),
	(22,222,3533,3,'0000-00-00 00:00:00','0000-00-00 00:00:00'),
	(23,222,3534,3,'0000-00-00 00:00:00','0000-00-00 00:00:00'),
	(24,222,3535,3,'0000-00-00 00:00:00','0000-00-00 00:00:00'),
	(25,222,3536,3,'0000-00-00 00:00:00','0000-00-00 00:00:00'),
	(26,222,3537,3,'0000-00-00 00:00:00','0000-00-00 00:00:00'),
	(27,222,3538,3,'0000-00-00 00:00:00','0000-00-00 00:00:00'),
	(28,222,3539,3,'0000-00-00 00:00:00','0000-00-00 00:00:00'),
	(29,222,3540,3,'0000-00-00 00:00:00','0000-00-00 00:00:00'),
	(30,222,3541,3,'0000-00-00 00:00:00','0000-00-00 00:00:00'),
	(31,222,3542,3,'0000-00-00 00:00:00','0000-00-00 00:00:00'),
	(32,222,3543,3,'0000-00-00 00:00:00','0000-00-00 00:00:00'),
	(33,222,3544,3,'0000-00-00 00:00:00','0000-00-00 00:00:00'),
	(34,222,3545,3,'0000-00-00 00:00:00','0000-00-00 00:00:00'),
	(35,222,3546,3,'0000-00-00 00:00:00','0000-00-00 00:00:00'),
	(36,222,3547,3,'0000-00-00 00:00:00','0000-00-00 00:00:00'),
	(37,222,3548,3,'0000-00-00 00:00:00','0000-00-00 00:00:00'),
	(38,222,3549,3,'0000-00-00 00:00:00','0000-00-00 00:00:00'),
	(39,222,3550,3,'0000-00-00 00:00:00','0000-00-00 00:00:00'),
	(40,222,3551,3,'0000-00-00 00:00:00','0000-00-00 00:00:00'),
	(41,222,3552,3,'0000-00-00 00:00:00','0000-00-00 00:00:00'),
	(42,222,3553,3,'0000-00-00 00:00:00','0000-00-00 00:00:00'),
	(43,222,3554,3,'0000-00-00 00:00:00','0000-00-00 00:00:00'),
	(44,222,3555,3,'0000-00-00 00:00:00','0000-00-00 00:00:00'),
	(45,222,3556,3,'0000-00-00 00:00:00','0000-00-00 00:00:00'),
	(46,222,3557,3,'0000-00-00 00:00:00','0000-00-00 00:00:00'),
	(47,222,3558,3,'0000-00-00 00:00:00','0000-00-00 00:00:00'),
	(48,222,3559,3,'0000-00-00 00:00:00','0000-00-00 00:00:00'),
	(49,222,3560,3,'0000-00-00 00:00:00','0000-00-00 00:00:00'),
	(50,222,3561,3,'0000-00-00 00:00:00','0000-00-00 00:00:00'),
	(51,222,3562,3,'0000-00-00 00:00:00','0000-00-00 00:00:00'),
	(52,222,3563,3,'0000-00-00 00:00:00','0000-00-00 00:00:00'),
	(53,222,3564,3,'0000-00-00 00:00:00','0000-00-00 00:00:00'),
	(54,222,3565,3,'0000-00-00 00:00:00','0000-00-00 00:00:00'),
	(55,222,3566,3,'0000-00-00 00:00:00','0000-00-00 00:00:00'),
	(56,222,3567,3,'0000-00-00 00:00:00','0000-00-00 00:00:00'),
	(57,222,3568,3,'0000-00-00 00:00:00','0000-00-00 00:00:00'),
	(58,222,3569,3,'0000-00-00 00:00:00','0000-00-00 00:00:00'),
	(59,222,3570,3,'0000-00-00 00:00:00','0000-00-00 00:00:00'),
	(60,222,3571,3,'0000-00-00 00:00:00','0000-00-00 00:00:00'),
	(61,222,3572,3,'0000-00-00 00:00:00','0000-00-00 00:00:00'),
	(62,222,3573,3,'0000-00-00 00:00:00','0000-00-00 00:00:00'),
	(63,222,3574,3,'0000-00-00 00:00:00','0000-00-00 00:00:00'),
	(64,222,3575,3,'0000-00-00 00:00:00','0000-00-00 00:00:00'),
	(65,222,3576,3,'0000-00-00 00:00:00','0000-00-00 00:00:00'),
	(66,222,3577,3,'0000-00-00 00:00:00','0000-00-00 00:00:00'),
	(67,222,3578,3,'0000-00-00 00:00:00','0000-00-00 00:00:00'),
	(68,222,3579,3,'0000-00-00 00:00:00','0000-00-00 00:00:00'),
	(69,222,3580,3,'0000-00-00 00:00:00','0000-00-00 00:00:00'),
	(70,222,3581,3,'0000-00-00 00:00:00','0000-00-00 00:00:00'),
	(71,222,3582,3,'0000-00-00 00:00:00','0000-00-00 00:00:00'),
	(72,222,3583,3,'0000-00-00 00:00:00','0000-00-00 00:00:00'),
	(73,222,3584,3,'0000-00-00 00:00:00','0000-00-00 00:00:00'),
	(74,222,3585,3,'0000-00-00 00:00:00','0000-00-00 00:00:00'),
	(75,222,3586,3,'0000-00-00 00:00:00','0000-00-00 00:00:00'),
	(76,222,3587,3,'0000-00-00 00:00:00','0000-00-00 00:00:00'),
	(77,222,3588,3,'0000-00-00 00:00:00','0000-00-00 00:00:00'),
	(78,222,3589,3,'0000-00-00 00:00:00','0000-00-00 00:00:00'),
	(79,222,3590,3,'0000-00-00 00:00:00','0000-00-00 00:00:00'),
	(80,222,3591,3,'0000-00-00 00:00:00','0000-00-00 00:00:00'),
	(81,222,3592,3,'0000-00-00 00:00:00','0000-00-00 00:00:00'),
	(82,222,3593,3,'0000-00-00 00:00:00','0000-00-00 00:00:00'),
	(83,222,3594,3,'0000-00-00 00:00:00','0000-00-00 00:00:00'),
	(84,222,3595,3,'0000-00-00 00:00:00','0000-00-00 00:00:00'),
	(85,222,3596,3,'0000-00-00 00:00:00','0000-00-00 00:00:00'),
	(86,222,3597,3,'0000-00-00 00:00:00','0000-00-00 00:00:00'),
	(87,222,3598,3,'0000-00-00 00:00:00','0000-00-00 00:00:00'),
	(88,222,3599,3,'0000-00-00 00:00:00','0000-00-00 00:00:00'),
	(89,222,3600,3,'0000-00-00 00:00:00','0000-00-00 00:00:00'),
	(90,222,3601,3,'0000-00-00 00:00:00','0000-00-00 00:00:00'),
	(91,222,3602,3,'0000-00-00 00:00:00','0000-00-00 00:00:00'),
	(92,222,3603,3,'0000-00-00 00:00:00','0000-00-00 00:00:00'),
	(93,222,3604,3,'0000-00-00 00:00:00','0000-00-00 00:00:00'),
	(94,222,3605,3,'0000-00-00 00:00:00','0000-00-00 00:00:00'),
	(95,222,3606,3,'0000-00-00 00:00:00','0000-00-00 00:00:00'),
	(96,222,3607,3,'0000-00-00 00:00:00','0000-00-00 00:00:00'),
	(97,222,3608,3,'0000-00-00 00:00:00','0000-00-00 00:00:00'),
	(98,222,3609,3,'0000-00-00 00:00:00','0000-00-00 00:00:00'),
	(99,222,3610,3,'0000-00-00 00:00:00','0000-00-00 00:00:00'),
	(100,222,3611,3,'0000-00-00 00:00:00','0000-00-00 00:00:00'),
	(101,222,3612,3,'0000-00-00 00:00:00','0000-00-00 00:00:00'),
	(102,222,3949,3,'0000-00-00 00:00:00','0000-00-00 00:00:00'),
	(103,222,3950,3,'0000-00-00 00:00:00','0000-00-00 00:00:00'),
	(104,222,3951,3,'0000-00-00 00:00:00','0000-00-00 00:00:00'),
	(105,222,3952,3,'0000-00-00 00:00:00','0000-00-00 00:00:00'),
	(106,222,3953,3,'0000-00-00 00:00:00','0000-00-00 00:00:00'),
	(107,222,3954,3,'0000-00-00 00:00:00','0000-00-00 00:00:00'),
	(108,222,3955,3,'0000-00-00 00:00:00','0000-00-00 00:00:00'),
	(109,222,3972,3,'0000-00-00 00:00:00','0000-00-00 00:00:00');

/*!40000 ALTER TABLE `zone_to_geo_zone` ENABLE KEYS */;
UNLOCK TABLES;



/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
