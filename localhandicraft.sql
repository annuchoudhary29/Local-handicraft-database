CREATE DATABASE  IF NOT EXISTS `handicraftretail` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `handicraftretail`;
-- MySQL dump 10.13  Distrib 8.0.41, for Win64 (x86_64)
--
-- Host: localhost    Database: handicraftretail
-- ------------------------------------------------------
-- Server version	8.0.41

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
-- Table structure for table `admin`
--

DROP TABLE IF EXISTS `admin`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `admin` (
  `admin_id` int NOT NULL AUTO_INCREMENT,
  `admin_username` varchar(50) DEFAULT NULL,
  `admin_email` varchar(100) DEFAULT NULL,
  `admin_role` varchar(50) DEFAULT NULL,
  `role_description` text,
  `admin_password` varchar(100) DEFAULT NULL,
  `admin_fullName` varchar(100) DEFAULT NULL,
  `last_login` date DEFAULT NULL,
  `time` time DEFAULT NULL,
  PRIMARY KEY (`admin_id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `admin`
--

LOCK TABLES `admin` WRITE;
/*!40000 ALTER TABLE `admin` DISABLE KEYS */;
INSERT INTO `admin` VALUES (1,'ADM001','ADM001@gmail.com','Super Admin','Full Access for all features and content','******','Rakesh Kumar','2025-04-22','14:49:33'),(2,'ADM002','ADM002@gmail.com','Manager','Limited Access','******','Mamta Tyagi','2025-03-15','08:20:23'),(3,'ADM003','ADM003@gmail.com','Support Admin','Handling customer and technical issues','******','Anju Upadhaye','2025-03-20','07:45:15'),(4,'ADM004','ADM004@gmail.com','Inventory','Handling Inventory','******','Rekha Patil','2025-04-20','12:24:00'),(5,'ADM005','ADM005@gmail.com','Sales','Handling sales','******','Jalak Maan','2025-05-20','23:12:00'),(6,'ADM006','ADM006@gmail.com','Super Admin','Full Access for all features and content','******','Suresh Verma','2025-06-10','14:30:00'),(7,'ADM007','ADM007@gmail.com','Manager','Limited Access to user management','******','Priya Singh','2025-06-12','09:50:00'),(8,'ADM008','ADM008@gmail.com','Support Admin','Handling technical and user inquiries','******','Neha Patel','2025-06-15','11:10:45'),(9,'ADM009','ADM009@gmail.com','Inventory','Managing inventory updates and stock records','******','Rajesh Yadav','2025-06-20','17:25:30'),(10,'ADM010','ADM010@gmail.com','Sales','Overseeing sales and promotional activities','******','Pooja Sharma','2025-06-25','21:35:10');
/*!40000 ALTER TABLE `admin` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `LogAdminLoginTime` BEFORE UPDATE ON `admin` FOR EACH ROW BEGIN
    -- If last_login changes, record the current time
    IF NEW.last_login <> OLD.last_login THEN
        SET NEW.time = CURRENT_TIME();
    END IF;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `category`
--

DROP TABLE IF EXISTS `category`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `category` (
  `category_id` int NOT NULL AUTO_INCREMENT,
  `category_name` varchar(50) DEFAULT NULL,
  `description` text,
  `date_manufacture` date DEFAULT NULL,
  `category_description` text,
  `product_id` int DEFAULT NULL,
  PRIMARY KEY (`category_id`),
  KEY `category_product_fk` (`product_id`),
  CONSTRAINT `category_product_fk` FOREIGN KEY (`product_id`) REFERENCES `product` (`product_id`)
) ENGINE=InnoDB AUTO_INCREMENT=26 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `category`
--

LOCK TABLES `category` WRITE;
/*!40000 ALTER TABLE `category` DISABLE KEYS */;
INSERT INTO `category` VALUES (16,'Home Decor','Items designed to enhance living spaces','2024-02-15','Includes handmade vases, wall hangings, etc.',1),(17,'Accessories','Fashion and personal items','2024-03-10','Includes jewelry, scarves, and other accessories',2),(18,'Textiles','Handwoven and embroidered fabric items','2024-01-25','Includes cushion covers, table runners, etc.',3),(19,'Lighting','Handmade decorative lighting solutions','2024-02-05','Includes table lamps, diyas, and lanterns',4),(20,'Bags','Eco-friendly and handcrafted bags','2024-03-01','Includes jute bags, embroidered handbags, etc.',5),(21,'Candle','Scented Candles','2024-02-15','Includes paraben-free DIY scented candles',6),(22,'Rugs','To enhance your space by adding warmth and style','2024-03-10','Includes Area Rugs, Outdoor Rugs and Kids Rugs',7),(23,'Wall Art','Elevates your space with creativity and personal expression','2024-01-25','Includes Abstract, landscape, and traditional Wall arts',8),(24,'Storage','Combines functionality with style to keep your home organized.','2024-02-05','Combine organization and style with baskets, shelves, and bins.',9),(25,'Themed decor','Brings a cohesive and unique personality to your living space','2024-03-01','Includes rustic theme, Bohemian Theme and minimalistic and vintage-themed decor',10);
/*!40000 ALTER TABLE `category` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `customer`
--

DROP TABLE IF EXISTS `customer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `customer` (
  `customer_id` int NOT NULL AUTO_INCREMENT,
  `customer_fname` varchar(50) DEFAULT NULL,
  `customer_lname` varchar(50) DEFAULT NULL,
  `email_id` varchar(100) DEFAULT NULL,
  `phone_number` varchar(15) DEFAULT NULL,
  `shipping_address` text,
  `date_joined` date DEFAULT NULL,
  `customer_city` varchar(50) DEFAULT NULL,
  `customer_State` varchar(50) DEFAULT NULL,
  `customer_country` varchar(50) DEFAULT NULL,
  `postal_code` varchar(10) DEFAULT NULL,
  `dob` date DEFAULT NULL,
  PRIMARY KEY (`customer_id`),
  UNIQUE KEY `Email_ID` (`email_id`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `customer`
--

LOCK TABLES `customer` WRITE;
/*!40000 ALTER TABLE `customer` DISABLE KEYS */;
INSERT INTO `customer` VALUES (1,'Shika','Sharma','shikha123@gmail.com','9111234562','Ganga enclave, Roorkee','2020-12-01','Roorkee','Uttarakhand','India','123456','1990-12-12'),(2,'Akanksha','Chouhan','akanksha123@gmail.com','1234567891','Shanti Nagar, Saharanpur','2021-11-02','Saharanpur','Uttar Pradesh','India','234561','1991-12-23'),(3,'Deepak','Rawat','deepak123@gmail.com','2345678912','900w, fodall street, Dehradun','2023-10-03','Dehradun','Uttarakhand','India','345612','1998-02-28'),(4,'Anu','Choudhary','anu123@gmail.com','3456789012','Girja ghar, st 61, Alliwala','2024-09-04','Alliwala','Uttar Pradesh','India','456123','1995-04-24'),(5,'Sagar','Das','sagar123@gmail.com','4567890123','shantikunj road, house 12, New Delhi','2025-08-05','New Delhi','Delhi','India','567890','1998-04-01'),(6,'Amarpal','Singh','amarpal123@gmail.com','1234567890','juhubanglow, nearby road 41, Mumbai','2019-07-06','Mumbai','Maharashtra','India','124523','2000-04-14'),(7,'John','Doe','john.doe@example.com','2213356691','123 Main St','2023-05-12','New York','New York','India','100012','1990-08-15'),(8,'Emma','Smith','emma.smith@example.com','9876543210','456 Elm St','2022-10-20','Los Angeles','California','USA','900018','1985-04-22'),(9,'Liam','Jones','liam.jones@example.com','5647382910','789 Maple St','2024-01-10','Chicago','Illinois','USA','606015','1995-11-30'),(10,'Olivia','Wilson','olivia.wilson@example.com','2143658709','567 Pine St','2021-06-05','Houston','Texas','USA','770014','1988-02-14'),(11,'Noah','Brown','brown@example.com','1928374650','890 Oak St','2023-07-19','Miami','Florida','USA','331016','1992-07-09'),(12,'Rahul','Kumar','rahul123@gmail.com','9876543210','Chandigarh','2022-02-15','Chandigarh','Punjab','India','234567','1992-10-10'),(13,'Priya','Yadav','priya123@gmail.com','9087654321','Patiala','2023-03-25','Patiala','Punjab','India','345678','1995-05-18'),(14,'Rohan','Gupta','rohan123@gmail.com','9876543211','Ludhiana','2023-04-12','Ludhiana','Punjab','India','456789','1994-07-29'),(15,'Pooja','Kaur','pooja123@gmail.com','9871234567','Amritsar','2023-05-07','Amritsar','Punjab','India','567890','1991-08-30'),(16,'Harsh','Mehta','harsh123@gmail.com','9912345678','Bhopal','2023-06-18','Bhopal','Madhya Pradesh','India','678901','1996-11-05');
/*!40000 ALTER TABLE `customer` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `customer_order_summary_view`
--

DROP TABLE IF EXISTS `customer_order_summary_view`;
/*!50001 DROP VIEW IF EXISTS `customer_order_summary_view`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `customer_order_summary_view` AS SELECT 
 1 AS `customer_id`,
 1 AS `customer_name`,
 1 AS `email_id`,
 1 AS `customer_city`,
 1 AS `total_orders`,
 1 AS `total_spent`,
 1 AS `avg_order_value`,
 1 AS `last_order_date`,
 1 AS `last_payment_status`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `discount`
--

DROP TABLE IF EXISTS `discount`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `discount` (
  `discount_id` int NOT NULL AUTO_INCREMENT,
  `product_id` int NOT NULL,
  `discount_percentage` tinyint DEFAULT NULL,
  `customer_dob` date DEFAULT NULL,
  `start_date` date DEFAULT NULL,
  `end_date` date DEFAULT NULL,
  PRIMARY KEY (`discount_id`),
  KEY `product_fk_idx` (`product_id`),
  CONSTRAINT `discount_product_fk` FOREIGN KEY (`product_id`) REFERENCES `product` (`product_id`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `discount`
--

LOCK TABLES `discount` WRITE;
/*!40000 ALTER TABLE `discount` DISABLE KEYS */;
INSERT INTO `discount` VALUES (1,1,10,'1995-08-15','2024-02-12','2024-02-19'),(2,2,15,'1993-03-22','2023-12-06','2024-02-28'),(3,3,20,'1997-05-10','2023-03-30','2024-02-28'),(4,4,5,'1990-09-04','2024-05-31','2024-02-25'),(5,5,25,'1992-12-11','2023-01-02','2024-03-05'),(6,6,30,'1996-07-14','2024-03-26','2024-03-07'),(7,7,10,'1994-01-02','2022-05-08','2024-03-10'),(8,8,18,'1995-06-18','2024-03-03','2024-03-10'),(9,9,12,'1998-11-27','2024-03-07','2024-03-15'),(10,10,5,'1994-03-30','2024-03-10','2024-03-20'),(11,7,15,'1992-01-13','2022-12-04','2024-02-28'),(12,4,20,'1992-09-07','2024-07-24','2024-02-28'),(13,2,5,'1992-10-10','2024-03-22','2024-02-28'),(14,2,25,'1999-01-24','2024-03-03','2024-02-25'),(15,9,30,'1994-02-02','2024-03-07','2024-03-05'),(16,3,35,'1992-12-24','2022-03-08','2024-12-18'),(17,5,45,'1997-01-09','2024-03-23','2022-09-02'),(18,7,22,'2013-06-06','2022-08-09','2023-02-11');
/*!40000 ALTER TABLE `discount` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `trg_validate_discount_dates` BEFORE INSERT ON `discount` FOR EACH ROW BEGIN
    IF NEW.start_date > NEW.end_date THEN
        SIGNAL SQLSTATE '45000'
            SET MESSAGE_TEXT = 'Discount start_date cannot be later than end_date';
    END IF;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `inventory`
--

DROP TABLE IF EXISTS `inventory`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `inventory` (
  `inventory_id` int NOT NULL AUTO_INCREMENT,
  `product_id` int NOT NULL,
  `stock_level` int DEFAULT NULL,
  `latest_date` date DEFAULT NULL,
  `reorder_level` int DEFAULT NULL,
  PRIMARY KEY (`inventory_id`),
  KEY `product_fk_idx` (`product_id`),
  CONSTRAINT `inventory_product_fk` FOREIGN KEY (`product_id`) REFERENCES `product` (`product_id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `inventory`
--

LOCK TABLES `inventory` WRITE;
/*!40000 ALTER TABLE `inventory` DISABLE KEYS */;
INSERT INTO `inventory` VALUES (1,1,20,'2024-12-02',5),(2,2,15,'2024-02-15',3),(3,3,30,'2024-02-18',10),(4,4,10,'2024-02-20',4),(5,5,25,'2024-02-22',8),(6,6,20,'2024-02-15',15),(7,7,15,'2024-02-18',12),(8,8,30,'2024-02-20',9),(9,9,10,'2024-02-20',5),(10,10,25,'2024-02-22',6),(11,3,30,'2024-02-18',32);
/*!40000 ALTER TABLE `inventory` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `order_items`
--

DROP TABLE IF EXISTS `order_items`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `order_items` (
  `order_item_id` int NOT NULL,
  `order_id` int DEFAULT NULL,
  `product_id` int DEFAULT NULL,
  `quantity` int DEFAULT NULL,
  `price` decimal(10,2) DEFAULT NULL,
  PRIMARY KEY (`order_item_id`),
  KEY `order_items_product_fk_idx` (`product_id`),
  KEY `order_items_order_fk_idx` (`order_id`),
  CONSTRAINT `order_items_order_fk` FOREIGN KEY (`order_id`) REFERENCES `orders` (`order_id`),
  CONSTRAINT `order_items_product_fk` FOREIGN KEY (`product_id`) REFERENCES `product` (`product_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `order_items`
--

LOCK TABLES `order_items` WRITE;
/*!40000 ALTER TABLE `order_items` DISABLE KEYS */;
INSERT INTO `order_items` VALUES (1,1,1,4,1400.00),(2,2,2,10,2000.00),(3,3,3,8,5000.00),(4,4,4,2,8000.00),(5,5,5,1,6500.00),(6,6,6,7,9000.00),(7,7,7,5,4500.00),(8,8,8,2,3000.00),(9,9,9,25,2500.00),(10,10,10,50,5000.00),(11,11,1,3,1200.00),(12,12,2,6,4800.00),(13,13,3,2,1800.00),(14,11,4,4,4000.00),(15,3,5,1,6500.00);
/*!40000 ALTER TABLE `order_items` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `prevent_order_if_insufficient_stock` BEFORE INSERT ON `order_items` FOR EACH ROW BEGIN
    DECLARE current_stock INT;

    -- Get current stock for the product
    SELECT stock_level INTO current_stock
    FROM inventory
    WHERE product_id = NEW.product_id;

    -- If not enough stock, block the insert
    IF current_stock IS NULL OR current_stock < NEW.quantity THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Insufficient stock to place the order';
    END IF;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `trg_restock_after_order_delete` AFTER DELETE ON `order_items` FOR EACH ROW BEGIN
    UPDATE product
    SET stock_quantity = stock_quantity + OLD.quantity
    WHERE product_id = OLD.product_id;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `orders`
--

DROP TABLE IF EXISTS `orders`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `orders` (
  `order_id` int NOT NULL,
  `customer_id` int DEFAULT NULL,
  `order_date` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `total_amount` decimal(10,2) DEFAULT NULL,
  `payment_status_id` int DEFAULT NULL,
  `order_status_id` int DEFAULT NULL,
  `shipping_address` varchar(100) NOT NULL,
  PRIMARY KEY (`order_id`),
  KEY `orders_customer_fk_idx` (`customer_id`),
  KEY `orders_payment_status_fk_idx` (`payment_status_id`),
  CONSTRAINT `orders_customer_fk` FOREIGN KEY (`customer_id`) REFERENCES `customer` (`customer_id`),
  CONSTRAINT `orders_payment_status_fk` FOREIGN KEY (`payment_status_id`) REFERENCES `payment_status` (`payment_status_id`),
  CONSTRAINT `orders_chk_1` CHECK ((`total_amount` >= 0))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `orders`
--

LOCK TABLES `orders` WRITE;
/*!40000 ALTER TABLE `orders` DISABLE KEYS */;
INSERT INTO `orders` VALUES (1,2,'2024-12-02 06:00:00',1400.00,1,1,'Ganga enclave, Roorkee'),(2,4,'2025-02-11 06:00:00',2000.00,3,2,'Shanti Nagar, Saharanpur'),(3,2,'2025-01-03 06:00:00',5000.00,1,4,'900w, fodall street, Dehradun'),(4,1,'2024-02-03 06:00:00',8000.00,4,5,'Girja ghar, st 61, Alliwala'),(5,3,'2026-12-11 06:00:00',6500.00,5,2,'shantikunj road, house 12, New Delhi'),(6,7,'2025-03-14 05:00:00',1200.00,3,7,'juhubanglow, nearby road 41, Mumbai'),(7,9,'2025-04-20 05:00:00',3500.00,2,4,'12, Park Street, Kolkata, India'),(8,6,'2025-05-05 05:00:00',2200.00,1,3,'78, Anna Nagar, Chennai, India'),(9,2,'2025-06-18 05:00:00',46000.00,4,6,'56, Sector 21, Gurgaon, India'),(10,10,'2025-07-22 05:00:00',1800.00,5,8,'32, Andheri West, Mumbai, India'),(11,11,'2024-03-10 06:00:00',1750.00,1,4,'123 Maple St, Los Angeles, CA, USA'),(12,12,'2024-03-11 05:00:00',3300.00,1,2,'456 Elm St, New York, NY, USA'),(13,13,'2024-03-13 05:00:00',4500.00,3,6,'789 Pine St, London, UK');
/*!40000 ALTER TABLE `orders` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `after_order_insert_log_transaction` AFTER INSERT ON `orders` FOR EACH ROW BEGIN
    INSERT INTO transaction_history (
        transaction_type,
        order_id,
        customer_id,
        payment_method_id,
        transaction_date
    )
    VALUES (
        'New Order Placed',
        NEW.order_id,
        NEW.customer_id,
        NULL,
        NOW()
    );
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Temporary view structure for view `ordersummary`
--

DROP TABLE IF EXISTS `ordersummary`;
/*!50001 DROP VIEW IF EXISTS `ordersummary`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `ordersummary` AS SELECT 
 1 AS `order_id`,
 1 AS `customer_fname`,
 1 AS `customer_lname`,
 1 AS `order_date`,
 1 AS `total_amount`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `payment_method`
--

DROP TABLE IF EXISTS `payment_method`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `payment_method` (
  `payment_method_id` int NOT NULL AUTO_INCREMENT,
  `payment_method` varchar(50) DEFAULT NULL,
  `active` bit(1) DEFAULT NULL,
  PRIMARY KEY (`payment_method_id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `payment_method`
--

LOCK TABLES `payment_method` WRITE;
/*!40000 ALTER TABLE `payment_method` DISABLE KEYS */;
INSERT INTO `payment_method` VALUES (1,'Credit Card',_binary ''),(2,'Debit Card',_binary ''),(3,'UPI',_binary ''),(4,'PayPal',_binary ''),(5,'Net Banking',_binary '');
/*!40000 ALTER TABLE `payment_method` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `payment_status`
--

DROP TABLE IF EXISTS `payment_status`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `payment_status` (
  `payment_status_id` int NOT NULL AUTO_INCREMENT,
  `payment_status` varchar(50) DEFAULT NULL,
  `active` bit(1) DEFAULT NULL,
  PRIMARY KEY (`payment_status_id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `payment_status`
--

LOCK TABLES `payment_status` WRITE;
/*!40000 ALTER TABLE `payment_status` DISABLE KEYS */;
INSERT INTO `payment_status` VALUES (1,'Paid',_binary ''),(2,'Pending',_binary ''),(3,'Refunded',_binary ''),(4,'Canceled',_binary ''),(5,'Failed',_binary '');
/*!40000 ALTER TABLE `payment_status` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `payments`
--

DROP TABLE IF EXISTS `payments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `payments` (
  `payment_id` int NOT NULL,
  `order_id` int NOT NULL,
  `customer_address` varchar(150) DEFAULT NULL,
  `shipping_date` date DEFAULT NULL,
  `delivery_date` date DEFAULT NULL,
  `payment_status_id` int DEFAULT NULL,
  `amount` decimal(10,2) DEFAULT NULL,
  `payment_method_id` int DEFAULT NULL,
  `customer_id` int DEFAULT NULL,
  `payment_date` date DEFAULT NULL,
  `transaction_history_id` int DEFAULT NULL,
  PRIMARY KEY (`payment_id`),
  KEY `payment_status_fk_idx` (`payment_status_id`),
  KEY `customer_fk_idx` (`customer_id`),
  KEY `customer_payment_method_fk_idx` (`payment_method_id`),
  KEY `payments_transaction_history_fk_idx` (`transaction_history_id`),
  KEY `payments_order_fk_idx` (`order_id`),
  CONSTRAINT `payments_customer_fk` FOREIGN KEY (`customer_id`) REFERENCES `customer` (`customer_id`),
  CONSTRAINT `payments_order_fk` FOREIGN KEY (`order_id`) REFERENCES `orders` (`order_id`),
  CONSTRAINT `payments_payment_method_fk` FOREIGN KEY (`payment_method_id`) REFERENCES `payment_method` (`payment_method_id`),
  CONSTRAINT `payments_payment_status_fk` FOREIGN KEY (`payment_status_id`) REFERENCES `payment_status` (`payment_status_id`),
  CONSTRAINT `payments_transaction_history_fk` FOREIGN KEY (`transaction_history_id`) REFERENCES `transaction_history` (`transaction_history_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `payments`
--

LOCK TABLES `payments` WRITE;
/*!40000 ALTER TABLE `payments` DISABLE KEYS */;
INSERT INTO `payments` VALUES (1,1,'Roorkee','2020-02-01','2020-02-08',1,1400.00,3,1,'2025-02-01',6),(2,2,'Saharanpur','2021-02-01','2021-02-10',1,2000.00,2,2,'2025-02-02',10),(3,3,'Dehradun','2020-02-02','2025-02-14',2,5000.00,5,3,'2025-03-03',7),(4,4,'Alliwala','2021-02-02','2021-02-01',3,8000.00,4,4,'2025-04-04',11),(5,5,'New Delhi','2025-01-03','2025-01-11',1,6500.00,1,5,'2025-02-01',7),(6,6,'Mumbai','2024-03-03','2024-03-09',4,9000.00,3,6,'2025-02-02',15),(7,7,'Pune','2025-05-04','2025-05-12',1,4500.00,2,7,'2025-05-04',3),(8,8,'Kolkata','2025-07-06','2024-07-04',5,3000.00,5,15,'2025-07-06',1),(9,9,'Hyderabad','2025-09-08','2025-09-10',3,2500.00,2,12,'2025-09-08',8),(10,10,'Chennai','2025-10-10','2025-10-05',2,5000.00,5,3,'2025-10-10',9),(11,11,'Bangalore','2025-11-02','2025-11-03',1,1200.00,4,7,'2025-11-15',3),(12,13,'New York, USA','2025-03-14','2025-03-21',1,3500.00,1,11,'2025-03-14',2),(13,12,'London, UK','2025-03-16','2025-03-26',2,4500.00,3,15,'2025-03-15',12),(14,10,'St, Los Angeles, USA','2025-03-19','2025-03-30',1,5500.00,2,16,'2025-03-18',14);
/*!40000 ALTER TABLE `payments` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `validate_payment_amount` BEFORE INSERT ON `payments` FOR EACH ROW BEGIN
  DECLARE expected_amount DECIMAL(10,2);

  SELECT total_amount INTO expected_amount
  FROM orders
  WHERE order_id = NEW.order_id;

  IF NEW.amount != expected_amount THEN
    SIGNAL SQLSTATE '45000'
    SET MESSAGE_TEXT = 'Payment amount does not match order total.';
  END IF;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `product`
--

DROP TABLE IF EXISTS `product`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `product` (
  `product_id` int NOT NULL AUTO_INCREMENT,
  `product_name` varchar(100) DEFAULT NULL,
  `category` varchar(50) DEFAULT NULL,
  `price` decimal(10,2) DEFAULT NULL,
  `stock_quantity` int DEFAULT NULL,
  `description` text,
  `vendor_name` varchar(100) DEFAULT NULL,
  `material` varchar(50) DEFAULT NULL,
  `vendor_id` int DEFAULT NULL,
  PRIMARY KEY (`product_id`),
  KEY `product_vendor_fk` (`vendor_id`),
  CONSTRAINT `product_vendor_fk` FOREIGN KEY (`vendor_id`) REFERENCES `vendor` (`vendor_id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `product`
--

LOCK TABLES `product` WRITE;
/*!40000 ALTER TABLE `product` DISABLE KEYS */;
INSERT INTO `product` VALUES (1,'Handmade Clay Vase','Home Decor',150.00,7,'A beautifully crafted clay vase with intricate carvings','Rajiv Kumar','Clay',1),(2,'Wooden Jewelry Box','Accessories',200.00,15,'A hand-carved wooden box for storing jewelry','Anita Sharma','Teak Wood',2),(3,'Embroidered Cushion Cover','Textiles',60.00,25,'Hand-embroidered cushion cover with traditional patterns','Suman Devi','Cotton',3),(4,'Bamboo Table Lamp','Lighting',175.00,5,'Eco-friendly table lamp made from woven bamboo','Amit Verma','Bamboo',4),(5,'Handwoven Jute Bag','Bags',50.00,35,'A stylish and durable handwoven jute bag','Meera Das','Jute',5),(6,'Terracotta Wall Hanging','Home Decor',120.00,12,'Handmade terracotta wall decor with intricate motifs','Kavita Reddy','Terracotta',6),(7,'Hand-Painted Silk Scarf','Textiles',250.00,18,'Elegant hand-painted silk scarf with floral designs','Priya Iyer','Silk',7),(8,'Wooden Coasters Set','Kitchenware',80.00,20,'Set of four hand-carved wooden coasters','Ramesh Patel','Sheesham Wood',8),(9,'Crochet Table Runner','Textiles',300.00,10,'Handmade crochet table runner with detailed patterns','Sunita Joshi','Cotton Thread',9),(10,'Brass Diyas Set','Lighting',90.00,30,'Traditional brass oil lamps for festive occasions','Harish Mehta','Brass',10);
/*!40000 ALTER TABLE `product` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `reviews`
--

DROP TABLE IF EXISTS `reviews`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `reviews` (
  `review_id` int NOT NULL,
  `customer_id` int DEFAULT NULL,
  `product_id` int DEFAULT NULL,
  `rating` int DEFAULT NULL,
  `review_text` varchar(255) DEFAULT NULL,
  `review_date` date DEFAULT NULL,
  PRIMARY KEY (`review_id`),
  KEY `customer_fk_idx` (`customer_id`),
  KEY `reviews_product_fk_idx` (`product_id`),
  CONSTRAINT `reviews_customer_fk` FOREIGN KEY (`customer_id`) REFERENCES `customer` (`customer_id`),
  CONSTRAINT `reviews_product_fk` FOREIGN KEY (`product_id`) REFERENCES `product` (`product_id`),
  CONSTRAINT `reviews_chk_1` CHECK ((`rating` between 1 and 5))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `reviews`
--

LOCK TABLES `reviews` WRITE;
/*!40000 ALTER TABLE `reviews` DISABLE KEYS */;
INSERT INTO `reviews` VALUES (1,2,1,5,'Beautifully crafted vase, excellent quality','2024-12-02'),(2,4,2,4,'The jewelry box is nice, but a bit small.','2024-02-15'),(3,5,3,5,'Loved the cushion cover, vibrant colors','2024-02-20'),(4,1,4,3,'Lamp design is great, but packaging was poor.','2024-02-25'),(5,3,5,5,'Jute bag is stylish and eco-friendly','2024-02-28'),(6,7,6,4,'Wall hanging looks good, but a bit fragile','2024-03-05'),(7,9,7,5,'Soft and elegant silk scarf, loved it','2024-03-10'),(8,6,8,4,'Coasters are good but took time to arrive.','2024-03-15'),(9,8,9,3,'Crochet runner is fine but smaller than shown.','2024-03-18'),(10,10,10,5,'Brass diyas are perfect for puja and decor','2024-03-22'),(11,11,1,5,'Unique, cohesive designs','2024-02-25'),(12,12,2,4,'Elegant ceramic charm','2024-02-28'),(13,13,3,3,'Lightweight, artistic decor','2024-03-05'),(14,14,4,4,'Vibrant fabric creations.','2024-03-10'),(15,15,5,5,'Durable and artistic designs that blend functionality with style','2024-03-15');
/*!40000 ALTER TABLE `reviews` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sales`
--

DROP TABLE IF EXISTS `sales`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sales` (
  `sales_id` int NOT NULL AUTO_INCREMENT,
  `order_id` int NOT NULL,
  `product_id` int NOT NULL,
  `quantity` int DEFAULT NULL,
  `total_sales_amount` int DEFAULT NULL,
  `customer_id` int NOT NULL,
  `sales_date` date DEFAULT NULL,
  PRIMARY KEY (`sales_id`),
  KEY `sales_product_fk_idx` (`product_id`),
  KEY `sales_customer_fk_idx` (`customer_id`),
  KEY `sales_order_fk_idx` (`order_id`),
  CONSTRAINT `sales_customer_fk` FOREIGN KEY (`customer_id`) REFERENCES `customer` (`customer_id`),
  CONSTRAINT `sales_order_fk` FOREIGN KEY (`order_id`) REFERENCES `orders` (`order_id`),
  CONSTRAINT `sales_product_fk` FOREIGN KEY (`product_id`) REFERENCES `product` (`product_id`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sales`
--

LOCK TABLES `sales` WRITE;
/*!40000 ALTER TABLE `sales` DISABLE KEYS */;
INSERT INTO `sales` VALUES (1,1,1,4,5600,2,'2024-02-12'),(2,2,2,10,2000,4,'2024-02-15'),(3,3,3,8,4000,5,'2024-02-20'),(4,4,4,2,16000,1,'2024-02-25'),(5,5,5,1,6500,3,'2024-02-28'),(6,6,6,7,6300,7,'2024-03-03'),(7,7,7,5,4500,9,'2024-03-07'),(8,8,8,2,6000,6,'2024-03-10'),(9,9,9,25,62500,8,'2024-03-15'),(10,10,10,50,25000,10,'2024-03-18'),(11,11,1,7,16000,11,'2024-02-25'),(12,12,2,5,6500,12,'2024-02-28'),(13,13,3,2,6300,13,'2024-03-03'),(14,1,4,25,4500,14,'2024-03-07');
/*!40000 ALTER TABLE `sales` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `shipments`
--

DROP TABLE IF EXISTS `shipments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `shipments` (
  `shipment_id` int NOT NULL,
  `order_id` int DEFAULT NULL,
  `shipping_date` date DEFAULT NULL,
  `delivery_date` date DEFAULT NULL,
  `shipping_status` varchar(50) DEFAULT NULL,
  `customer_id` int DEFAULT NULL,
  `tracking_number` varchar(50) DEFAULT NULL,
  `actual_delivery_date` date DEFAULT NULL,
  PRIMARY KEY (`shipment_id`),
  KEY `shipments_customer_fk_idx` (`customer_id`),
  KEY `shipments_order_fk_idx` (`order_id`),
  CONSTRAINT `shipments_customer_fk` FOREIGN KEY (`customer_id`) REFERENCES `customer` (`customer_id`),
  CONSTRAINT `shipments_order_fk` FOREIGN KEY (`order_id`) REFERENCES `orders` (`order_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `shipments`
--

LOCK TABLES `shipments` WRITE;
/*!40000 ALTER TABLE `shipments` DISABLE KEYS */;
INSERT INTO `shipments` VALUES (1,1,'2020-01-02','2020-08-02','Delivered',1,'TRK987654336',NULL),(2,2,'2021-01-02','2021-10-02','Delivered',2,'TRK987654358',NULL),(3,3,'2020-02-02','2025-02-14','Failed',3,'TRK987654367',NULL),(4,4,'2021-02-02','2021-03-22','Returned',4,'TRK987654369',NULL),(5,5,'2025-03-01','2025-11-01','In Transit',5,'TRK987654341',NULL),(6,6,'2024-03-03','2024-09-03','Pending',6,'TRK987654399',NULL),(7,7,'2025-04-05','2024-09-03','Delivered',12,'TRK987654321','2025-12-05'),(8,8,'2025-06-07','2025-07-14','In Transit',15,'TRK987654322',NULL),(9,9,'2025-08-09','2025-09-20','Pending',11,'TRK987654323',NULL),(10,10,'2025-10-10','2025-10-25','Failed',14,'TRK987654324',NULL),(11,11,'2025-11-15','2025-11-30','Delivered',2,'TRK987654325','2025-11-30'),(12,12,'2025-03-14','2025-03-21','Delivered',11,'TRK987654326','2025-03-23'),(13,13,'2025-03-16','2025-03-26','Failed',12,'TRK987654327','2025-03-27'),(14,1,'2025-03-19','2025-03-30','In Transit',13,'TRK987654328','2025-03-29');
/*!40000 ALTER TABLE `shipments` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `trg_update_order_on_delivery` AFTER UPDATE ON `shipments` FOR EACH ROW BEGIN
    IF NEW.shipping_status = 'Delivered' AND OLD.shipping_status <> 'Delivered' THEN
        UPDATE orders
        SET order_status_id = 2 -- 2 indicates order completed (adjust as necessary)
        WHERE order_id = NEW.order_id;
    END IF;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `shopping_cart`
--

DROP TABLE IF EXISTS `shopping_cart`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `shopping_cart` (
  `shopping_cart_id` int NOT NULL AUTO_INCREMENT,
  `customer_id` int NOT NULL,
  `product_id` int NOT NULL,
  `quantity` int DEFAULT NULL,
  `date_added` date DEFAULT NULL,
  PRIMARY KEY (`shopping_cart_id`),
  KEY `shopping_cart_customer_id_idx` (`customer_id`),
  KEY `shopping_cart_product_id_idx` (`product_id`),
  CONSTRAINT `shopping_cart_customer_id` FOREIGN KEY (`customer_id`) REFERENCES `customer` (`customer_id`),
  CONSTRAINT `shopping_cart_product_id` FOREIGN KEY (`product_id`) REFERENCES `product` (`product_id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `shopping_cart`
--

LOCK TABLES `shopping_cart` WRITE;
/*!40000 ALTER TABLE `shopping_cart` DISABLE KEYS */;
INSERT INTO `shopping_cart` VALUES (1,2,1,2,'2024-02-12'),(2,4,3,1,'2024-02-15'),(3,5,5,3,'2024-02-18'),(4,1,2,1,'2024-02-20'),(5,3,4,2,'2024-02-22');
/*!40000 ALTER TABLE `shopping_cart` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `transaction_history`
--

DROP TABLE IF EXISTS `transaction_history`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `transaction_history` (
  `transaction_history_id` int NOT NULL AUTO_INCREMENT,
  `transaction_type` varchar(50) DEFAULT NULL,
  `order_id` int NOT NULL,
  `customer_id` int NOT NULL,
  `amount` int DEFAULT NULL,
  `payment_status_id` int NOT NULL,
  `payment_method_id` int NOT NULL,
  `description` varchar(50) DEFAULT NULL,
  `transaction_date` date DEFAULT NULL,
  PRIMARY KEY (`transaction_history_id`),
  KEY `transaction_history_customer_fk_idx` (`customer_id`),
  KEY `transaction_history_payment_status_fk_idx` (`payment_status_id`),
  KEY `transaction_history_order_fk_idx` (`order_id`),
  KEY `transaction_history_payment_method_fk_idx` (`payment_method_id`),
  CONSTRAINT `transaction_history_customer_fk` FOREIGN KEY (`customer_id`) REFERENCES `customer` (`customer_id`),
  CONSTRAINT `transaction_history_order_fk` FOREIGN KEY (`order_id`) REFERENCES `orders` (`order_id`),
  CONSTRAINT `transaction_history_payment_method_fk` FOREIGN KEY (`payment_method_id`) REFERENCES `payment_method` (`payment_method_id`),
  CONSTRAINT `transaction_history_payment_status_fk` FOREIGN KEY (`payment_status_id`) REFERENCES `payment_status` (`payment_status_id`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `transaction_history`
--

LOCK TABLES `transaction_history` WRITE;
/*!40000 ALTER TABLE `transaction_history` DISABLE KEYS */;
INSERT INTO `transaction_history` VALUES (1,'Purchase',1,2,1400,1,1,'Payment for handmade clay vase','2024-02-12'),(2,'Purchase',2,4,2000,3,2,'Payment for wooden jewelry box','2024-02-15'),(3,'Purchase',3,5,5000,2,3,'Payment for embroidered cushion cover','2024-02-20'),(4,'Refund',4,1,8000,3,4,'Refund for bamboo table lamp','2024-02-25'),(5,'Purchase',5,3,6500,4,5,'Payment for handwoven jute bag','2024-02-28'),(6,'Purchase',6,7,1200,1,1,'Payment for terracotta wall hanging','2024-03-03'),(7,'Purchase',7,9,4500,1,2,'Payment for hand-painted silk scarf','2024-03-07'),(8,'Payment',8,6,3000,1,3,'Payment for wooden coasters set','2024-03-10'),(9,'Purchase',9,8,2500,2,4,'Payment for crochet table runner','2024-03-15'),(10,'Payment',10,10,5000,5,1,'Payment for brass diyas set','2024-03-18'),(11,'Refund',11,11,6500,2,2,'Payment for handwoven jute bag','2024-02-15'),(12,'Purchase',12,12,1200,3,3,'Payment for terracotta wall hanging','2024-02-20'),(13,'Purchase',13,13,4500,4,4,'Payment for hand-painted silk scarf','2024-02-25'),(14,'Purchase',1,14,3000,1,5,'Payment for wooden coasters set','2024-02-28'),(15,'Payment',2,15,2500,1,1,'Payment for crochet table runner','2024-03-03');
/*!40000 ALTER TABLE `transaction_history` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `vendor`
--

DROP TABLE IF EXISTS `vendor`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `vendor` (
  `vendor_id` int NOT NULL AUTO_INCREMENT,
  `vendor_name` varchar(100) DEFAULT NULL,
  `contact_number` varchar(15) DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL,
  `admin_id` int DEFAULT NULL,
  `vendor_city` varchar(50) DEFAULT NULL,
  `vendor_state` varchar(50) DEFAULT NULL,
  `vendor_country` varchar(50) DEFAULT NULL,
  `postal_code` varchar(10) DEFAULT NULL,
  `vendor_address` text,
  `active` bit(1) DEFAULT NULL,
  PRIMARY KEY (`vendor_id`),
  UNIQUE KEY `Email` (`email`),
  KEY `vendor_admin_fk_idx` (`admin_id`),
  CONSTRAINT `vendor_admin_fk` FOREIGN KEY (`admin_id`) REFERENCES `admin` (`admin_id`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `vendor`
--

LOCK TABLES `vendor` WRITE;
/*!40000 ALTER TABLE `vendor` DISABLE KEYS */;
INSERT INTO `vendor` VALUES (1,'Rajiv Kumar','1234567890','Rajiv1234@gmail.com',NULL,'Podigardwal','Uttarakhand','India','123456','Podigardwal',_binary ''),(2,'Anita Sharma','2345678901','anita1234@gmail.com',NULL,'Haldwani','Assam','India','234561','Haldwani',_binary '\0'),(3,'Suman Devi','3456789012','Suman1234@gmail.com',NULL,'Saharanpur','Telenagna','India','345612','Saharanpur',_binary ''),(4,'Amit Verma','4567890123','Amit1234@gmail.com',NULL,'Roorkee','Uttarakhand','India','456123','Roorkee',_binary ''),(5,'Meera Das','5678901234','Meera12345@gmail.com',NULL,'Meerut','Uttar Pradesh','India','561234','Meerut',_binary '\0'),(6,'Kavita Reddy','6789012345','Kavita1234@gmail.com',NULL,'Tajpur','Rajasthan','India','561234','Tajpur',_binary ''),(7,'Priya Iyer','7890123456','priya1234@gmail.com',NULL,'Bangalore','Karnataka','India','789012','Bangalore, Karnataka',_binary ''),(8,'Ramesh Patel','8901234567','ramesh1234@gmail.com',NULL,'Surat','Gujarat','India','890123','Surat, Gujarat',_binary ''),(9,'Sunita Joshi','9012345678','sunita1234@gmail.com',NULL,'Pune','Maharashtra','India','901234','Pune, Maharashtra',_binary ''),(10,'Harish Mehta','123456789','harish1234@gmail.com',NULL,'Ahmedabad','Gujarat','India','123458','Ahmedabad, Gujarat',_binary '\0'),(11,'Artisan Creations','2147542360','contact@artisancreations.com',NULL,'London','England','United Kingdom','575001','123 Handmade St',_binary ''),(12,'Heritage Crafts','9876543210','info@heritagecrafts.com',NULL,'Sydney','New South Wales','Australia','458236','456 Heritage Rd',_binary '\0'),(13,'Rustic Handicrafts','5647382910','support@rustichandicrafts.com',NULL,'Toronto','Ontario','Canada','352148','789 Woodwork Ave',_binary ''),(14,'Handmade Wonders','2143658709','sales@handmadewonders.com',NULL,'Berlin','Berlin','Germany','101178','567 Artisan Lane',_binary '\0'),(15,'Exotic Handmade','1928374650','help@exotichandmade.com',NULL,'Tokyo','Tokyo Prefecture','Japan','100001','890 Claypot St',_binary ''),(16,'Heritage Arts',NULL,'hello@heritagearts.com',NULL,NULL,NULL,NULL,NULL,NULL,_binary '');
/*!40000 ALTER TABLE `vendor` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `SetVendorActiveDefault` BEFORE INSERT ON `vendor` FOR EACH ROW -- For each new row being inserted
BEGIN
    -- Check if the 'active' column is NULL (not provided during insert)
    IF NEW.active IS NULL THEN
        -- Set 'active' to 1 (which represents 'Active')
        SET NEW.active = 1;
    END IF;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Temporary view structure for view `vw_customer_purchase_summary`
--

DROP TABLE IF EXISTS `vw_customer_purchase_summary`;
/*!50001 DROP VIEW IF EXISTS `vw_customer_purchase_summary`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `vw_customer_purchase_summary` AS SELECT 
 1 AS `customer_id`,
 1 AS `customer_fname`,
 1 AS `total_orders`,
 1 AS `total_spent`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `vw_vendor_performance_summary`
--

DROP TABLE IF EXISTS `vw_vendor_performance_summary`;
/*!50001 DROP VIEW IF EXISTS `vw_vendor_performance_summary`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `vw_vendor_performance_summary` AS SELECT 
 1 AS `vendor_id`,
 1 AS `vendor_name`,
 1 AS `total_products`,
 1 AS `total_stock`,
 1 AS `total_sales_amount`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `wishlist`
--

DROP TABLE IF EXISTS `wishlist`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `wishlist` (
  `wishlist_id` int NOT NULL AUTO_INCREMENT,
  `customer_id` int NOT NULL,
  `product_id` int DEFAULT NULL,
  `date_added` date DEFAULT NULL,
  PRIMARY KEY (`wishlist_id`),
  KEY `customer_fk_idx` (`customer_id`),
  KEY `wishlist_product_fk_idx` (`product_id`),
  CONSTRAINT `wishlist_customer_fk` FOREIGN KEY (`customer_id`) REFERENCES `customer` (`customer_id`),
  CONSTRAINT `wishlist_product_fk` FOREIGN KEY (`product_id`) REFERENCES `product` (`product_id`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wishlist`
--

LOCK TABLES `wishlist` WRITE;
/*!40000 ALTER TABLE `wishlist` DISABLE KEYS */;
INSERT INTO `wishlist` VALUES (1,2,1,'2024-02-12'),(2,4,2,'2024-02-15'),(3,5,3,'2024-02-18'),(4,1,4,'2024-02-20'),(5,3,5,'2024-02-22'),(6,7,6,'2024-02-25'),(7,9,7,'2024-02-28'),(8,6,8,'2024-03-03'),(9,8,9,'2024-03-07'),(10,10,10,'2024-03-10'),(11,11,1,'2024-02-18'),(12,12,2,'2024-02-20'),(13,13,3,'2024-02-22'),(14,14,4,'2024-02-25'),(15,15,5,'2024-02-28');
/*!40000 ALTER TABLE `wishlist` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping events for database 'handicraftretail'
--

--
-- Dumping routines for database 'handicraftretail'
--
/*!50003 DROP FUNCTION IF EXISTS `CalculateTotal` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `CalculateTotal`(order_id INT) RETURNS decimal(10,2)
    DETERMINISTIC
BEGIN
    DECLARE total DECIMAL(10,2);
    
    -- Sum of quantity * price from order_items for a specific order
    SELECT SUM(quantity * price) INTO total
    FROM order_items
    WHERE order_items.order_id = order_id;
    
    -- Return 0.00 if there are no items
    RETURN IFNULL(total, 0.00);
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP FUNCTION IF EXISTS `Calculate_Customer_Purchase_Score` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `Calculate_Customer_Purchase_Score`(input_customer_id INT) RETURNS varchar(20) CHARSET utf8mb4
    DETERMINISTIC
BEGIN
    DECLARE total_spent DECIMAL(10,2);
    DECLARE total_orders INT;
    DECLARE avg_order DECIMAL(10,2);
    DECLARE score INT;

    -- Calculate total spent
    SELECT IFNULL(SUM(total_amount), 0)
    INTO total_spent
    FROM orders
    WHERE customer_id = input_customer_id;

    -- Calculate total orders
    SELECT COUNT(order_id)
    INTO total_orders
    FROM orders
    WHERE customer_id = input_customer_id;

    -- Calculate average order value
    IF total_orders > 0 THEN
        SET avg_order = total_spent / total_orders;
    ELSE
        SET avg_order = 0;
    END IF;

    -- Assign a weighted score
    SET score = 
        (CASE 
            WHEN total_spent > 1000 THEN 50
            WHEN total_spent > 500 THEN 30
            ELSE 10
        END)
        +
        (CASE 
            WHEN avg_order > 200 THEN 30
            WHEN avg_order > 100 THEN 20
            ELSE 10
        END)
        +
        (CASE 
            WHEN total_orders > 10 THEN 20
            WHEN total_orders > 5 THEN 10
            ELSE 5
        END);

    -- Convert score to label
    RETURN
        CASE
            WHEN score >= 90 THEN 'Platinum'
            WHEN score >= 70 THEN 'Gold'
            WHEN score >= 50 THEN 'Silver'
            ELSE 'Bronze'
        END;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP FUNCTION IF EXISTS `GetAverageOrderValue` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `GetAverageOrderValue`(cust_id INT) RETURNS decimal(10,2)
    DETERMINISTIC
BEGIN
    DECLARE total_amt DECIMAL(10,2);
    DECLARE order_cnt INT;
    DECLARE avg_value DECIMAL(10,2);
    SELECT IFNULL(SUM(total_amount), 0), COUNT(order_id)
    INTO total_amt, order_cnt
    FROM orders
    WHERE customer_id = cust_id;
    IF order_cnt = 0 THEN
        SET avg_value = 0;
    ELSE
        SET avg_value = total_amt / order_cnt;
    END IF;
    RETURN avg_value;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP FUNCTION IF EXISTS `GetTotalOrderAmount` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `GetTotalOrderAmount`(orderId INT) RETURNS decimal(10,2)
    DETERMINISTIC
BEGIN
    DECLARE total_amount DECIMAL(10,2);
 
    SELECT SUM(oi.quantity * p.price) INTO total_amount
    FROM order_items oi
    JOIN product p ON oi.product_id = p.product_id
    WHERE oi.order_id = orderId;
 
    RETURN IFNULL(total_amount, 0);
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP FUNCTION IF EXISTS `GetVendorName` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `GetVendorName`(v_id INT) RETURNS varchar(255) CHARSET utf8mb4
    DETERMINISTIC
BEGIN
    DECLARE name VARCHAR(255);

    -- Get the vendor name using the ID
    SELECT vendor_name INTO name FROM vendor WHERE vendor_id = v_id;
    RETURN name;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP FUNCTION IF EXISTS `Get_Customer_Order_Status_Summary` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `Get_Customer_Order_Status_Summary`(input_customer_id INT) RETURNS varchar(50) CHARSET utf8mb4
    DETERMINISTIC
BEGIN
    DECLARE order_count INT;
    DECLARE unpaid_count INT;

    -- Count total orders for customer
    SELECT COUNT(*) INTO order_count
    FROM orders
    WHERE customer_id = input_customer_id;

    -- Count unpaid or failed payments
    SELECT COUNT(*)
    INTO unpaid_count
    FROM payments p
    JOIN payment_status ps ON p.payment_status_id = ps.payment_status_id
    WHERE p.customer_id = input_customer_id AND ps.payment_status != 'Paid';

    -- Decision Logic
    RETURN
        CASE
            WHEN order_count = 0 THEN 'Inactive / No Orders'
            WHEN order_count = 1 THEN 'First-Time Buyer'
            WHEN order_count BETWEEN 2 AND 5 THEN 'Occasional Buyer'
            WHEN order_count > 5 AND unpaid_count > 0 THEN 'Active but Some Unpaid'
            WHEN order_count > 10 AND unpaid_count = 0 THEN 'Highly Active'
            ELSE 'Active'
        END;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP FUNCTION IF EXISTS `IsCustomerEligibleForDiscount` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `IsCustomerEligibleForDiscount`(cust_id INT) RETURNS tinyint(1)
    DETERMINISTIC
BEGIN
    DECLARE order_cnt INT;
    DECLARE total_amt DECIMAL(10,2);
    SELECT COUNT(order_id), IFNULL(SUM(total_amount), 0)
    INTO order_cnt, total_amt
    FROM orders
    WHERE customer_id = cust_id;
    RETURN (order_cnt >= 5 AND total_amt > 500);
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP FUNCTION IF EXISTS `IsProductInStock` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `IsProductInStock`(prod_id INT) RETURNS tinyint(1)
    DETERMINISTIC
BEGIN
    DECLARE qty INT;
 
    SELECT stock_quantity INTO qty
    FROM product
    WHERE product_id = prod_id;
 
    RETURN qty > 0;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `AddNewProduct` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `AddNewProduct`(
    IN pname VARCHAR(100),         -- Product name
    IN category VARCHAR(50),       -- Product category
    IN price DECIMAL(10,2),        -- Product price
    IN qty INT,                    -- Quantity available in stock
    IN description TEXT,           -- Product description
    IN vendor_id INT               -- ID of the vendor supplying this product
)
BEGIN
    -- Insert the new product record into the 'product' table
    -- Values are passed in as parameters to the procedure
    INSERT INTO product (
        product_name, category, price, stock_quantity, description, vendor_id
    )
    VALUES (
        pname, category, price, qty, description, vendor_id
    );
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `GetCustomerLoyaltyReport` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `GetCustomerLoyaltyReport`()
BEGIN
    SELECT 
        c.customer_id,
        CONCAT(c.customer_fname, ' ', c.customer_lname) AS customer_name,
        COUNT(o.order_id) AS total_orders,
        ROUND(IFNULL(AVG(o.total_amount), 0), 2) AS avg_order_value,
        CASE 
            WHEN COUNT(o.order_id) < 3 THEN 'Bronze'
            WHEN COUNT(o.order_id) BETWEEN 3 AND 6 THEN 'Silver'
            WHEN COUNT(o.order_id) BETWEEN 7 AND 10 THEN 'Gold'
            ELSE 'Platinum'
        END AS loyalty_level
    FROM customer c
    LEFT JOIN orders o ON c.customer_id = o.customer_id
    GROUP BY c.customer_id, customer_name;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `GetCustomerOrders` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `GetCustomerOrders`(IN cust_id INT)
BEGIN
    -- Select orders where the customer_id matches the input
    SELECT * FROM orders
    WHERE customer_id = cust_id;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `GetSalesSummaryByMonth` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `GetSalesSummaryByMonth`()
BEGIN
    SELECT 
        DATE_FORMAT(o.order_date, '%Y-%m') AS month,
        COUNT(DISTINCT o.order_id) AS total_orders,
        SUM(oi.quantity * p.price) AS total_revenue,
        SUM(oi.quantity) AS total_items_sold
    FROM orders o
    JOIN order_items oi ON o.order_id = oi.order_id
    JOIN product p ON oi.product_id = p.product_id
    GROUP BY DATE_FORMAT(o.order_date, '%Y-%m')
    ORDER BY month;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `GetTopSellingProducts` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `GetTopSellingProducts`(
    IN top_n INT
)
BEGIN
    -- Default to top 5 if the input is not valid
    IF top_n IS NULL OR top_n <= 0 THEN
        SET top_n = 5;
    END IF;
    SELECT 
        p.product_id,
        p.product_name,
        SUM(oi.quantity) AS total_quantity_sold,
        SUM(oi.quantity * p.price) AS total_revenue
    FROM order_items oi
    JOIN product p ON oi.product_id = p.product_id
    GROUP BY p.product_id, p.product_name
    ORDER BY total_quantity_sold DESC
    LIMIT top_n;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `Get_Customer_Order_Summary` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `Get_Customer_Order_Summary`()
BEGIN
    SELECT 
        c.customer_id,
        CONCAT(c.customer_fname, ' ', c.customer_lname) AS customer_name,
        c.email_id,
        c.customer_city,
        COUNT(o.order_id) AS total_orders,
        SUM(o.total_amount) AS total_spent,
        AVG(o.total_amount) AS avg_order_value,
        MAX(o.order_date) AS last_order_date,
        
        -- Last payment status (via subquery)
        (
            SELECT ps.payment_status 
            FROM payments p 
            JOIN payment_status ps ON p.payment_status_id = ps.payment_status_id
            WHERE p.customer_id = c.customer_id 
            ORDER BY p.payment_date DESC 
            LIMIT 1
        ) AS last_payment_status,

        -- Last delivery status (via subquery)
        (
            SELECT s.actual_delivery_date 
            FROM shipments s 
            WHERE s.customer_id = c.customer_id 
            ORDER BY s.actual_delivery_date DESC 
            LIMIT 1
        ) AS last_delivery_date

    FROM customer c
    LEFT JOIN orders o ON c.customer_id = o.customer_id
    GROUP BY 
        c.customer_id, 
        customer_name, 
        c.email_id, 
        c.customer_city;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `Get_Full_Customer_Insight` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `Get_Full_Customer_Insight`(IN input_customer_id INT)
BEGIN
    -- Customer Details
     SELECT 
        customer_id,
        customer_fname,
        customer_lname,
        email_id,
        phone_number,
        shipping_address,
        customer_city,
        customer_state,
        customer_country,
        dob
    FROM customer
    WHERE customer_id = input_customer_id;

-- Last 3 Orders with Shipment & Payment Info
SELECT 
    o.order_id,
    o.order_date,
    o.total_amount,
    o.payment_status_id,
    o.order_status_id,
    s.actual_delivery_date,
    s.shipping_date,
    ps.payment_status
FROM orders o
LEFT JOIN shipments s ON o.order_id = s.order_id
LEFT JOIN payment_status ps ON o.payment_status_id = ps.payment_status_id
WHERE o.customer_id = input_customer_id
ORDER BY o.order_date DESC
LIMIT 3;


    -- Top 3 Frequently Ordered Products
SELECT 
    oi.product_id,
    p.product_name,
    SUM(oi.quantity) AS total_quantity
FROM
    order_items oi
        JOIN
    product p ON oi.product_id = p.product_id
        JOIN
    orders o ON oi.order_id = o.order_id
WHERE
    o.customer_id = input_customer_id
GROUP BY oi.product_id , p.product_name
ORDER BY total_quantity DESC
LIMIT 3;

    -- Total Spending
SELECT 
    SUM(total_amount) AS total_spent
FROM
    orders
WHERE
    customer_id = input_customer_id;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `UpdateProductStock` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `UpdateProductStock`(
    IN prod_id INT,
    IN qty_sold INT
)
BEGIN
    DECLARE current_stock INT;
 
    -- Get current stock for the product
    SELECT stock_quantity INTO current_stock
    FROM product
    WHERE product_id = prod_id;
 
    -- Check if enough stock is available
    IF current_stock IS NULL THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Product not found';
    ELSEIF current_stock < qty_sold THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Not enough stock available';
    ELSE
        -- Update stock
        UPDATE product
        SET stock_quantity = stock_quantity - qty_sold
        WHERE product_id = prod_id;
    END IF;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Final view structure for view `customer_order_summary_view`
--

/*!50001 DROP VIEW IF EXISTS `customer_order_summary_view`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `customer_order_summary_view` AS select `c`.`customer_id` AS `customer_id`,concat(`c`.`customer_fname`,' ',`c`.`customer_lname`) AS `customer_name`,`c`.`email_id` AS `email_id`,`c`.`customer_city` AS `customer_city`,count(`o`.`order_id`) AS `total_orders`,ifnull(sum(`o`.`total_amount`),0) AS `total_spent`,round(ifnull(avg(`o`.`total_amount`),0),2) AS `avg_order_value`,max(`o`.`order_date`) AS `last_order_date`,(select `ps`.`payment_status` from (`payments` `p` join `payment_status` `ps` on((`p`.`payment_status_id` = `ps`.`payment_status_id`))) where (`p`.`customer_id` = `c`.`customer_id`) order by `p`.`payment_date` desc limit 1) AS `last_payment_status` from (`customer` `c` left join `orders` `o` on((`c`.`customer_id` = `o`.`customer_id`))) group by `c`.`customer_id`,`customer_name`,`c`.`email_id`,`c`.`customer_city` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `ordersummary`
--

/*!50001 DROP VIEW IF EXISTS `ordersummary`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `ordersummary` AS select `o`.`order_id` AS `order_id`,`c`.`customer_fname` AS `customer_fname`,`c`.`customer_lname` AS `customer_lname`,`o`.`order_date` AS `order_date`,`CalculateTotal`(`o`.`order_id`) AS `total_amount` from (`orders` `o` join `customer` `c` on((`o`.`customer_id` = `c`.`customer_id`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `vw_customer_purchase_summary`
--

/*!50001 DROP VIEW IF EXISTS `vw_customer_purchase_summary`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `vw_customer_purchase_summary` AS select `c`.`customer_id` AS `customer_id`,`c`.`customer_fname` AS `customer_fname`,count(`o`.`order_id`) AS `total_orders`,sum((`oi`.`quantity` * `p`.`price`)) AS `total_spent` from (((`customer` `c` join `orders` `o` on((`c`.`customer_id` = `o`.`customer_id`))) join `order_items` `oi` on((`o`.`order_id` = `oi`.`order_id`))) join `product` `p` on((`oi`.`product_id` = `p`.`product_id`))) group by `c`.`customer_id`,`c`.`customer_fname` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `vw_vendor_performance_summary`
--

/*!50001 DROP VIEW IF EXISTS `vw_vendor_performance_summary`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `vw_vendor_performance_summary` AS select `v`.`vendor_id` AS `vendor_id`,`v`.`vendor_name` AS `vendor_name`,count(`p`.`product_id`) AS `total_products`,ifnull(sum(`p`.`stock_quantity`),0) AS `total_stock`,ifnull(sum(`s`.`total_sales_amount`),0) AS `total_sales_amount` from ((`vendor` `v` left join `product` `p` on((`v`.`vendor_id` = `p`.`vendor_id`))) left join `sales` `s` on((`p`.`product_id` = `s`.`product_id`))) group by `v`.`vendor_id`,`v`.`vendor_name` */;
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

-- Dump completed on 2025-04-22 14:52:01
