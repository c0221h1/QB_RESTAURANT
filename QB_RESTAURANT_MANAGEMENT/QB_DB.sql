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
) ENGINE=MyISAM AUTO_INCREMENT=29 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `categories`
--

LOCK TABLES `categories` WRITE;
/*!40000 ALTER TABLE `categories` DISABLE KEYS */;
INSERT INTO `categories` VALUES (1,'Nước uống'),(2,'Món lẩu'),(3,'Tráng miệng'),(4,'Hải sản'),(5,'Khai vị'),(6,'Cơm - Mỳ'),(7,'Đặc biệt');
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
  `phone` varchar(10) NOT NULL,
  `status` bit(1) DEFAULT NULL,
  `username` varchar(255) NOT NULL,
  `position_id` bigint DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FKngcpgx7fx5kednw3m7u0u8of3` (`position_id`)
) ENGINE=MyISAM AUTO_INCREMENT=87 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `employees`
--

LOCK TABLES `employees` WRITE;
/*!40000 ALTER TABLE `employees` DISABLE KEYS */;
INSERT INTO `employees` VALUES (1,0,'Huế',NULL,NULL,'1995-07-23','Võ Hoàng Dương',0,'$2a$05$MqXCYVi79m7fqco0QHiSYeRWvNCuzbwDNsH.iWv3L4OZ7veH5GVVG','0904744408',_binary '\0','admin',1),(85,0,'Quảng Bình',NULL,NULL,'1991-02-21','Phạm Đăng Phong',0,'$2a$10$Ntmpvegg7uy9INrad/JSi.NmrRh2NBAvq5CQOem6Scm9uCoMFelDS','0384056894',_binary '\0','admin1',1),(86,0,'Huế',NULL,NULL,'1999-06-29','Nguyễn Văn A',0,'$2a$10$KhGgs/XR0kbbKF64kDcr..D1nsmGsyxlWdYOy3L9YK40XZXTFmDKq','0384056897',_binary '\0','TestUser',2);
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
  `status` tinyint(1) DEFAULT '0',
  `order_id` bigint DEFAULT NULL,
  `product_id` bigint DEFAULT NULL,
  PRIMARY KEY (`order_detail_id`),
  KEY `FKjyu2qbqt8gnvno9oe9j2s2ldk` (`order_id`),
  KEY `FK4q98utpd73imf4yhttm3w0eax` (`product_id`)
) ENGINE=MyISAM AUTO_INCREMENT=218 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `order_details`
--

LOCK TABLES `order_details` WRITE;
/*!40000 ALTER TABLE `order_details` DISABLE KEYS */;
INSERT INTO `order_details` VALUES (207,1,280000,0,31,117),(208,1,130000,0,31,122),(209,2,200000,0,30,112),(210,1,15000,0,31,128),(211,1,10000,0,31,126),(212,1,10000,0,31,124),(213,1,10000,0,32,126),(214,1,100000,0,32,97),(215,2,280000,0,34,103),(216,2,240000,0,34,102),(217,3,750000,0,34,101);
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
) ENGINE=MyISAM AUTO_INCREMENT=35 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `orders`
--

LOCK TABLES `orders` WRITE;
/*!40000 ALTER TABLE `orders` DISABLE KEYS */;
INSERT INTO `orders` VALUES (27,'2021-08-17',21),(26,'2021-08-17',17),(25,'2021-08-17',19),(28,'2021-08-17',23),(29,'2021-08-17',22),(30,'2021-08-17',20),(31,'2021-08-18',18),(32,'2021-08-18',15),(33,'2021-08-24',16),(34,'2021-08-29',27);
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
) ENGINE=MyISAM AUTO_INCREMENT=129 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `products`
--

LOCK TABLES `products` WRITE;
/*!40000 ALTER TABLE `products` DISABLE KEYS */;
INSERT INTO `products` VALUES (105,'Ngon','cua-chien-nuoc-mam2000k.png',2000000,'Cua chiên nước mắm',1,4),(104,'Ngon','alaskachaytoi350k-kg.png',350000,'Tôm Alaska',1,4),(103,'Ngon','vitquaybackinh140k.png',140000,'Vịt quay Bắc Kinh',1,7),(102,'Ngon','so-huyet-tu-xuyen120k.png',120000,'Sò huyết Tứ Xuyên',1,7),(101,'Ngon','heoquaylu250k.png',250000,'Heo quay lu',1,7),(100,'Ngon','ga-xao-hat-dieu120k.png',120000,'Gà xào hạt điều',1,7),(99,'Ngon','catamnuongladua180k.png',180000,'Cá tầm nướng',1,7),(98,'Ngon','canhganuongmuoiot80k.png',80000,'Cánh gà nướng muối ớt',1,7),(97,'Ngon','cang-cua-bach-hoa100k.png',100000,'Càng cua bách hoa',1,7),(96,'Ngon','camuhaphongkong210k.png',210000,'Cá mú hấp',1,7),(95,'Ngon','ca-dieu-hong-hap-tam-to100k.png',100000,'Cá diêu hồng hấp',1,7),(94,'Ngon','cachinhnuongmuoitot180k.png',180000,'Cá chình nướng',1,7),(93,'Ngon','mi-xao-hai-san100k.png',100000,'Mỳ xào hải sản',1,6),(92,'Giòn và thơm ngon','com-chien-duong-chau100k.png',100000,'Cơm chiên dương châu',1,6),(106,'Ngon','mucnuong120k.png',120000,'Mực nướng',1,4),(107,'Ngon','mucthamlam130k.png',130000,'Mực tham lam',1,4),(108,'Ngon','sasimitomhum400k.png',400000,'Sashimi tôm hùm',1,4),(109,'Ngon','tomalaskahap350k-kg.png',350000,'Tôm Alaska hấp',1,4),(110,'Ngon','tomhumhapbia1500k.png',1500000,'Tôm hùm hấp bia',1,4),(111,'Tuyệt vời !','goi-cu-hu-dưa-90k.png',90000,'Gỏi củ hủ dừa',1,5),(112,'Tuyệt vời','salad.png',100000,'Salad',1,5),(113,'Tuyệt !','saladtomtraicay100k.png',100000,'Salad tôm trái cây',1,5),(114,'Tuyệt !','suon-kinh-do120k.png',120000,'Sườn kinh đô',1,5),(115,'Tuyệt!','sup-chay-toc-tien40k.png',40000,'Súp tóc tiên chay',1,5),(116,'Tuyệt !','thit-nguoi-bat-buu120k.png',120000,'Thịt nguội bát bửu ',1,5),(117,'Tuyệt !','laucalangmangchua280k.png',280000,'Lẩu cá lăng ',1,2),(118,'Tuyệt!','laughechuacay300.png',300000,'Lẩu ghẹ chua cay',1,2),(119,'Tuyệt !','lau-thai250k.png',250000,'Lẩu thái',1,2),(120,'Tuyệt!','banh-tiramisu50k.png',50000,'Bánh Tiramisu',1,3),(121,'Tuyệt!','che-tuyet-giap50k.png',50000,'Chè Tuyết Giáp',1,3),(122,'Tuyệt','trai-cay-thap-cam130k.png',130000,'Trái cây thập cẩm',1,3),(123,'Nước có ga','7 up.jpg',10000,'7 up',1,1),(124,'Nước có ga','coca.jpg',10000,'Coca',1,1),(125,'Nước suối','Nước suối.png',5000,'Nước suối',1,1),(126,'Nước có ga','pepsi.jpg',10000,'Pepsi',1,1),(127,'Bia lon','bia-huda-330ml.jpg',15000,'Bia Huda',1,1),(128,'Bia','bia-saigon.jpg',15000,'Bia Sài Gòn',1,1);
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
) ENGINE=MyISAM AUTO_INCREMENT=29 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tables`
--

LOCK TABLES `tables` WRITE;
/*!40000 ALTER TABLE `tables` DISABLE KEYS */;
INSERT INTO `tables` VALUES (20,NULL,1,0,'Bàn số 7'),(21,NULL,1,0,'Bàn số 8'),(19,NULL,1,0,'Bàn số 6'),(18,NULL,1,0,'Bàn số 5'),(17,NULL,1,0,'Bàn số 4'),(16,NULL,1,0,'Bàn số 3'),(15,'17h 00',1,0,'Bàn số 2'),(14,NULL,0,0,'Bàn số 1'),(22,NULL,1,0,'Bàn số 9'),(23,NULL,1,0,'Bàn số 10'),(27,NULL,1,0,'Bàn số 13'),(25,NULL,0,0,'Bàn số 11'),(26,NULL,0,0,'Bàn số 12'),(28,NULL,0,0,'Bàn số 14');
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
) ENGINE=MyISAM AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `vouchers`
--

LOCK TABLES `vouchers` WRITE;
/*!40000 ALTER TABLE `vouchers` DISABLE KEYS */;
INSERT INTO `vouchers` VALUES (1,'2021-08-11','2021-08-12','Giảm 20%',20,0,'Giảm 20%',0),(2,'2021-08-12','2021-08-20','Khách Vip',50,0,'Giảm 50%',0),(4,'2021-08-29','2021-09-16','Lễ Quốc Khánh',10,1,'Giảm 10%',0);
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

-- Dump completed on 2021-08-29 16:51:46
