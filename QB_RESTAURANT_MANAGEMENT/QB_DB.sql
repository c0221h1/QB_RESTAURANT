-- MySQL dump 10.13  Distrib 8.0.25, for Win64 (x86_64)
--
-- Host: localhost    Database: qb-restaurant-management
-- ------------------------------------------------------
-- Server version	8.0.25

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
-- Table structure for table `bill_details`
--

DROP TABLE IF EXISTS `bill_details`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `bill_details` (
  `bill_detail_id` bigint NOT NULL AUTO_INCREMENT,
  `bill_id` bigint DEFAULT NULL,
  `order_detail_id` bigint DEFAULT NULL,
  `amount` int NOT NULL,
  `product_name` varchar(255) NOT NULL,
  `product_price` double NOT NULL,
  PRIMARY KEY (`bill_detail_id`),
  KEY `FKklpmg9jyaabwwbdwfgaxt0mas` (`order_detail_id`),
  KEY `FKfwm4sko9p82ndh6belyxx12bj` (`bill_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bill_details`
--

LOCK TABLES `bill_details` WRITE;
/*!40000 ALTER TABLE `bill_details` DISABLE KEYS */;
/*!40000 ALTER TABLE `bill_details` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `bills`
--

DROP TABLE IF EXISTS `bills`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `bills` (
  `bill_id` bigint NOT NULL AUTO_INCREMENT,
  `bill_time` date NOT NULL,
  `status` bit(1) NOT NULL,
  `vat` int NOT NULL,
  `order_id` bigint DEFAULT NULL,
  `bill_note` varchar(255) DEFAULT NULL,
  `bill_total` double NOT NULL,
  `customer_name` varchar(255) DEFAULT NULL,
  `voucher_id` bigint DEFAULT NULL,
  PRIMARY KEY (`bill_id`),
  KEY `FK2s1iwv6bgsmh8u9awhdd1aela` (`order_id`),
  KEY `FK1p232jm7oedinqkn0pmlj3upi` (`voucher_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bills`
--

LOCK TABLES `bills` WRITE;
/*!40000 ALTER TABLE `bills` DISABLE KEYS */;
/*!40000 ALTER TABLE `bills` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `bills_bill_detail_list`
--

DROP TABLE IF EXISTS `bills_bill_detail_list`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `bills_bill_detail_list` (
  `bill_bill_id` bigint NOT NULL,
  `bill_detail_list_bill_detail_id` bigint NOT NULL,
  UNIQUE KEY `UK_sypes832bgcf7dfdm3qir9ka3` (`bill_detail_list_bill_detail_id`),
  KEY `FKbhnu8au3fcktl2o60vg127nna` (`bill_bill_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bills_bill_detail_list`
--

LOCK TABLES `bills_bill_detail_list` WRITE;
/*!40000 ALTER TABLE `bills_bill_detail_list` DISABLE KEYS */;
/*!40000 ALTER TABLE `bills_bill_detail_list` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `categories`
--

DROP TABLE IF EXISTS `categories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `categories` (
  `category_id` bigint NOT NULL AUTO_INCREMENT,
  `category_name` varchar(255) NOT NULL,
  PRIMARY KEY (`category_id`)
) ENGINE=MyISAM AUTO_INCREMENT=17 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `categories`
--

LOCK TABLES `categories` WRITE;
/*!40000 ALTER TABLE `categories` DISABLE KEYS */;
INSERT INTO `categories` VALUES (1,'Đồ Ăn'),(2,'Đồ Uống'),(4,'Bia'),(5,'Khác');
/*!40000 ALTER TABLE `categories` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `categories_products`
--

DROP TABLE IF EXISTS `categories_products`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `categories_products` (
  `category_category_id` bigint NOT NULL,
  `products_product_id` bigint NOT NULL,
  UNIQUE KEY `UK_g1g4fl8pt4xsutvejxvt02sqp` (`products_product_id`),
  KEY `FK6aweqa9namwcbfpy2nc123g7x` (`category_category_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `categories_products`
--

LOCK TABLES `categories_products` WRITE;
/*!40000 ALTER TABLE `categories_products` DISABLE KEYS */;
/*!40000 ALTER TABLE `categories_products` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `employees`
--

DROP TABLE IF EXISTS `employees`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `employees` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `deleted` tinyint(1) DEFAULT '0',
  `address` varchar(255) DEFAULT NULL,
  `avatar` varchar(255) DEFAULT NULL,
  `citizen_id` varchar(255) DEFAULT NULL,
  `dob` date NOT NULL,
  `full_name` varchar(255) NOT NULL,
  `gender` tinyint(1) DEFAULT '0',
  `password` varchar(255) NOT NULL,
  `phone` int NOT NULL,
  `status` bit(1) DEFAULT NULL,
  `username` varchar(255) NOT NULL,
  `position_id` bigint DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FKngcpgx7fx5kednw3m7u0u8of3` (`position_id`)
) ENGINE=MyISAM AUTO_INCREMENT=68 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `employees`
--

LOCK TABLES `employees` WRITE;
/*!40000 ALTER TABLE `employees` DISABLE KEYS */;
INSERT INTO `employees` VALUES (14,0,'Quảng Bình',NULL,NULL,'2006-04-23','Trần Nhật Nam',0,'nam123',373455419,_binary '\0','nam123',1),(24,0,'Hue',NULL,NULL,'2021-08-21','qưeert',0,'123',384056894,_binary '\0','sfdgf',1),(34,0,'asdasf',NULL,NULL,'2021-09-05','sfdsfsd',0,'ádsad',384056894,_binary '\0','sfsdsd',1),(60,0,'Quảng Bình',NULL,NULL,'2009-11-09','Võ Hoàng Dương',0,'$2a$05$MqXCYVi79m7fqco0QHiSYeRWvNCuzbwDNsH.iWv3L4OZ7veH5GVVG',898600373,_binary '\0','admin',1),(61,0,'Ad adipisicing illum',NULL,NULL,'2011-07-02','Lamar Bowman',0,'$2a$05$MqXCYVi79m7fqco0QHiSYeRWvNCuzbwDNsH.iWv3L4OZ7veH5GVVG',373455419,_binary '\0','user',2),(50,0,'Hue',NULL,NULL,'2021-08-13','sdfg',0,'ádfgf',384056894,_binary '\0','admin123',1),(62,0,'Elit et dolore sit ',NULL,NULL,'1976-06-17','Kalia Vaughn',0,'Pa$$w0rd!',898600373,_binary '\0','kytiwo',1),(64,0,'Deserunt fugiat qui ',NULL,NULL,'1992-01-15','Hayden Weiss',0,'Pa$$w0rd!',1612345656,_binary '\0','xycosuwyve',3),(65,0,'Excepturi sunt quo d',NULL,NULL,'2012-08-12','Stuart Page',0,'Pa$$w0rd!',236988745,_binary '\0','wibek',2),(66,0,'Deserunt fugiat qui ',NULL,NULL,'1992-01-15','Hayden Weiss',0,'abc123',1612345656,_binary '\0','xycosuwyve',3),(67,0,'Quia ipsum voluptate',NULL,NULL,'1978-08-06','Yuli Romero',0,'Pa$$w0rd!',979999999,_binary '\0','fixetune',2);
/*!40000 ALTER TABLE `employees` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `employees_orders`
--

DROP TABLE IF EXISTS `employees_orders`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `employees_orders` (
  `employee_id` bigint NOT NULL,
  `orders_order_id` bigint NOT NULL,
  UNIQUE KEY `UK_dmi2p308210jfvvvcf23pw707` (`orders_order_id`),
  KEY `FKmli66mjnn6lfhd9dq8f25fw5m` (`employee_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `employees_orders`
--

LOCK TABLES `employees_orders` WRITE;
/*!40000 ALTER TABLE `employees_orders` DISABLE KEYS */;
/*!40000 ALTER TABLE `employees_orders` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `order_details`
--

DROP TABLE IF EXISTS `order_details`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `order_details` (
  `order_detail_id` bigint NOT NULL AUTO_INCREMENT,
  `amount` int NOT NULL,
  `product_price` double NOT NULL,
  `status` varchar(255) DEFAULT NULL,
  `order_id` bigint DEFAULT NULL,
  `product_id` bigint DEFAULT NULL,
  PRIMARY KEY (`order_detail_id`),
  KEY `FKjyu2qbqt8gnvno9oe9j2s2ldk` (`order_id`),
  KEY `FK4q98utpd73imf4yhttm3w0eax` (`product_id`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `order_details`
--

LOCK TABLES `order_details` WRITE;
/*!40000 ALTER TABLE `order_details` DISABLE KEYS */;
INSERT INTO `order_details` VALUES (1,1,100000,'true',15,87),(2,1,5000,'true',1,85),(3,1,100000,'true',15,87);
/*!40000 ALTER TABLE `order_details` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `orders`
--

DROP TABLE IF EXISTS `orders`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `orders` (
  `order_id` bigint NOT NULL AUTO_INCREMENT,
  `order_time` date NOT NULL,
  `table_id` bigint DEFAULT NULL,
  PRIMARY KEY (`order_id`),
  KEY `FKrkhrp1dape261t3x3spj7l5ny` (`table_id`)
) ENGINE=MyISAM AUTO_INCREMENT=18 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `orders`
--

LOCK TABLES `orders` WRITE;
/*!40000 ALTER TABLE `orders` DISABLE KEYS */;
INSERT INTO `orders` VALUES (1,'2021-08-16',4),(12,'2021-08-16',7),(13,'2021-08-16',8),(14,'2021-08-16',10),(15,'2021-08-16',3);
/*!40000 ALTER TABLE `orders` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `orders_order_details`
--

DROP TABLE IF EXISTS `orders_order_details`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `orders_order_details` (
  `order_order_id` bigint NOT NULL,
  `order_details_order_detail_id` bigint NOT NULL,
  PRIMARY KEY (`order_order_id`,`order_details_order_detail_id`),
  UNIQUE KEY `UK_pqomu9eufirjh2x9oesw26a4f` (`order_details_order_detail_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `orders_order_details`
--

LOCK TABLES `orders_order_details` WRITE;
/*!40000 ALTER TABLE `orders_order_details` DISABLE KEYS */;
/*!40000 ALTER TABLE `orders_order_details` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `positions`
--

DROP TABLE IF EXISTS `positions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `positions` (
  `position_id` bigint NOT NULL AUTO_INCREMENT,
  `code` varchar(255) DEFAULT NULL,
  `position_name` varchar(255) NOT NULL,
  PRIMARY KEY (`position_id`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `positions`
--

LOCK TABLES `positions` WRITE;
/*!40000 ALTER TABLE `positions` DISABLE KEYS */;
INSERT INTO `positions` VALUES (1,'ADMIN','ADMIN'),(2,'STAFF','STAFF'),(3,'MANAGER','MANAGER');
/*!40000 ALTER TABLE `positions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `positions_employees`
--

DROP TABLE IF EXISTS `positions_employees`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `positions_employees` (
  `position_position_id` bigint NOT NULL,
  `employees_id` bigint NOT NULL,
  PRIMARY KEY (`position_position_id`,`employees_id`),
  UNIQUE KEY `UK_rf8oqrg1tsnwcw02ur0g4pij3` (`employees_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `positions_employees`
--

LOCK TABLES `positions_employees` WRITE;
/*!40000 ALTER TABLE `positions_employees` DISABLE KEYS */;
/*!40000 ALTER TABLE `positions_employees` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `products`
--

DROP TABLE IF EXISTS `products`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `products` (
  `product_id` bigint NOT NULL AUTO_INCREMENT,
  `description` varchar(255) DEFAULT NULL,
  `image` longtext,
  `price` double NOT NULL,
  `product_name` varchar(255) NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '1',
  `category_id` bigint DEFAULT NULL,
  PRIMARY KEY (`product_id`),
  KEY `FKog2rp4qthbtt2lfyhfo32lsw9` (`category_id`)
) ENGINE=MyISAM AUTO_INCREMENT=88 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `products`
--

LOCK TABLES `products` WRITE;
/*!40000 ALTER TABLE `products` DISABLE KEYS */;
INSERT INTO `products` VALUES (75,'Do porro ad sed ulla','tomhumhapbia1500k.png',9000,'Kelly Ryan',1,1),(74,'Dignissimos quia rep','cua-chien-nuoc-mam2000k.png',6820,'Hedley Stuart',1,1),(73,'Rerum voluptatem vel','tomhumhapbia1500k.png',7370,'Hayden Wagner',0,1),(72,'Ngon','cua-chien-nuoc-mam2000k.png',5650,'Cua ',1,1),(77,'Consequat Officia m','cua-chien-nuoc-mam2000k.png',6820,'Blythe Curry',0,1),(79,'Enim saepe voluptati','tomalaskahap350k-kg.png',6330,'Hedley Stuart234',1,1),(81,'Minima exercitation ','king-crabsalad1tr.png',6800,'Lydia Frazier',1,1),(82,'Lorem sint molestia','alaskachaytoi350k-kg.png',9310,'Tôm nướng',1,1),(83,'Molestiae in adipisi','tomalaskahap350k-kg.png',10000,'Tôm Hùm',1,1),(84,'Deserunt possimus e','tomhumhapbia1500k.png',6740,'MacKensie Lambert',1,1),(85,'Nước suối','Nước suối.png',5000,'Nước suối',1,2),(86,'Nước có ga','coca.jpg',10000,'Coca ',1,2),(87,'Nước có ga','7 up.jpg',100000,'7-up',1,2);
/*!40000 ALTER TABLE `products` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `products_order_details`
--

DROP TABLE IF EXISTS `products_order_details`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `products_order_details` (
  `product_product_id` bigint NOT NULL,
  `order_details_order_detail_id` bigint NOT NULL,
  PRIMARY KEY (`product_product_id`,`order_details_order_detail_id`),
  UNIQUE KEY `UK_5s4ftds4psjsqonrkdsqss65n` (`order_details_order_detail_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `products_order_details`
--

LOCK TABLES `products_order_details` WRITE;
/*!40000 ALTER TABLE `products_order_details` DISABLE KEYS */;
/*!40000 ALTER TABLE `products_order_details` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `promotions`
--

DROP TABLE IF EXISTS `promotions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `promotions` (
  `promotion_id` bigint NOT NULL AUTO_INCREMENT,
  `begin_date` date NOT NULL,
  `end_date` date NOT NULL,
  `percent` int NOT NULL,
  `promotion_name` varchar(255) NOT NULL,
  PRIMARY KEY (`promotion_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `promotions`
--

LOCK TABLES `promotions` WRITE;
/*!40000 ALTER TABLE `promotions` DISABLE KEYS */;
/*!40000 ALTER TABLE `promotions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `staticsicals`
--

DROP TABLE IF EXISTS `staticsicals`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `staticsicals` (
  `year_bill` bigint NOT NULL AUTO_INCREMENT,
  `apr_bill` double DEFAULT NULL,
  `aug_bill` double DEFAULT NULL,
  `dec_bill` double DEFAULT NULL,
  `feb_bill` double DEFAULT NULL,
  `jan_bill` double DEFAULT NULL,
  `jul_bill` double DEFAULT NULL,
  `jun_bill` double DEFAULT NULL,
  `mar_bill` double DEFAULT NULL,
  `may_bill` double DEFAULT NULL,
  `nov_bill` double DEFAULT NULL,
  `oct_bill` double DEFAULT NULL,
  `sep_bill` double DEFAULT NULL,
  `total_bill_of_year` double DEFAULT NULL,
  PRIMARY KEY (`year_bill`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `staticsicals`
--

LOCK TABLES `staticsicals` WRITE;
/*!40000 ALTER TABLE `staticsicals` DISABLE KEYS */;
/*!40000 ALTER TABLE `staticsicals` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tables`
--

DROP TABLE IF EXISTS `tables`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tables` (
  `table_id` bigint NOT NULL AUTO_INCREMENT,
  `book` varchar(255) DEFAULT NULL,
  `custom` tinyint(1) DEFAULT '0',
  `hidden` tinyint(1) DEFAULT '0',
  `table_name` varchar(255) NOT NULL,
  PRIMARY KEY (`table_id`)
) ENGINE=MyISAM AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tables`
--

LOCK TABLES `tables` WRITE;
/*!40000 ALTER TABLE `tables` DISABLE KEYS */;
INSERT INTO `tables` VALUES (3,NULL,1,0,'Bàn số 3'),(4,NULL,1,0,'Bàn số 4'),(6,NULL,0,0,'Bàn số 6'),(7,NULL,1,0,'Bàn số 7'),(8,NULL,0,0,'Bàn số 8'),(9,NULL,0,0,'Bàn số 9'),(10,NULL,0,0,'Bàn số 10'),(12,NULL,0,0,'Bàn số 1');
/*!40000 ALTER TABLE `tables` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tables_orders`
--

DROP TABLE IF EXISTS `tables_orders`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tables_orders` (
  `desk_table_id` bigint NOT NULL,
  `orders_order_id` bigint NOT NULL,
  UNIQUE KEY `UK_2yqgi74m351jwhc3gr1ftkxwy` (`orders_order_id`),
  KEY `FKipg7qwsj1cwb9i6yi789e2qik` (`desk_table_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tables_orders`
--

LOCK TABLES `tables_orders` WRITE;
/*!40000 ALTER TABLE `tables_orders` DISABLE KEYS */;
/*!40000 ALTER TABLE `tables_orders` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tokens`
--

DROP TABLE IF EXISTS `tokens`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tokens` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `deleted` tinyint(1) DEFAULT '0',
  `token` varchar(1000) DEFAULT NULL,
  `token_exp_date` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tokens`
--

LOCK TABLES `tokens` WRITE;
/*!40000 ALTER TABLE `tokens` DISABLE KEYS */;
/*!40000 ALTER TABLE `tokens` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `vouchers`
--

DROP TABLE IF EXISTS `vouchers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `vouchers` (
  `voucher_id` bigint NOT NULL AUTO_INCREMENT,
  `begin_date` date DEFAULT NULL,
  `end_date` date DEFAULT NULL,
  `note` varchar(255) DEFAULT NULL,
  `percent` int NOT NULL,
  `status` tinyint(1) DEFAULT '0',
  `voucher_name` varchar(255) NOT NULL,
  `voucher_deleted` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`voucher_id`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `vouchers`
--

LOCK TABLES `vouchers` WRITE;
/*!40000 ALTER TABLE `vouchers` DISABLE KEYS */;
INSERT INTO `vouchers` VALUES (1,'2021-08-11','2021-08-12','Giảm 20%',20,0,'Giảm 20%',0),(2,'2021-08-12','2021-08-20','Khách Vip',50,1,'Giảm 50%',0);
/*!40000 ALTER TABLE `vouchers` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2021-08-17 13:53:01
