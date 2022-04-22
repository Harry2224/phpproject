-- --------------------------------------------------------
-- Host:                         127.0.0.1
-- Server version:               10.4.22-MariaDB - mariadb.org binary distribution
-- Server OS:                    Win64
-- HeidiSQL Version:             11.3.0.6295
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


-- Dumping database structure for database_2111536
CREATE DATABASE IF NOT EXISTS `database_2111536` /*!40100 DEFAULT CHARACTER SET utf8mb4 */;
USE `database_2111536`;

-- Dumping structure for table database_2111536.customers
CREATE TABLE IF NOT EXISTS `customers` (
  `Customer_id` int(11) NOT NULL DEFAULT uuid(),
  `FirstName` varchar(20) NOT NULL,
  `LastName` varchar(20) NOT NULL,
  `Address` varchar(25) NOT NULL,
  `City` varchar(25) NOT NULL,
  `Province` varchar(25) NOT NULL,
  `PostalCode` varchar(7) NOT NULL,
  `Username` varchar(15) NOT NULL,
  `Password` varchar(255) NOT NULL,
  `CustomerImage` blob NOT NULL,
  `Creation` datetime NOT NULL DEFAULT current_timestamp(),
  `Modification` datetime NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  PRIMARY KEY (`Customer_id`),
  UNIQUE KEY `Username` (`Username`),
  UNIQUE KEY `Customer_id` (`Customer_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- Dumping data for table database_2111536.customers: ~0 rows (approximately)
/*!40000 ALTER TABLE `customers` DISABLE KEYS */;
/*!40000 ALTER TABLE `customers` ENABLE KEYS */;

-- Dumping structure for table database_2111536.orders
CREATE TABLE IF NOT EXISTS `orders` (
  `Order_ID` int(10) NOT NULL DEFAULT uuid(),
  `Customer_id` int(11) NOT NULL DEFAULT uuid(),
  `ProductCode` char(12) NOT NULL DEFAULT uuid(),
  `SoldQty` int(3) NOT NULL,
  `SoldProductPr` int(10) NOT NULL,
  `Comments` varchar(200) NOT NULL,
  `Creation` datetime NOT NULL DEFAULT current_timestamp(),
  `Modification` datetime NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  PRIMARY KEY (`Order_ID`),
  KEY `FK_orders_customers` (`Customer_id`),
  KEY `FK_orders_products` (`ProductCode`),
  CONSTRAINT `FK_orders_customers` FOREIGN KEY (`Customer_id`) REFERENCES `customers` (`Customer_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `FK_orders_products` FOREIGN KEY (`ProductCode`) REFERENCES `products` (`ProductCode`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- Dumping data for table database_2111536.orders: ~0 rows (approximately)
/*!40000 ALTER TABLE `orders` DISABLE KEYS */;
/*!40000 ALTER TABLE `orders` ENABLE KEYS */;

-- Dumping structure for table database_2111536.products
CREATE TABLE IF NOT EXISTS `products` (
  `ProductCode` char(12) NOT NULL DEFAULT uuid(),
  `ProductDesc` varchar(100) NOT NULL,
  `ProductPrice` float NOT NULL,
  `CostPrice` float NOT NULL,
  `Creation` datetime NOT NULL DEFAULT current_timestamp(),
  `Modification` datetime NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  PRIMARY KEY (`ProductCode`),
  UNIQUE KEY `ProductCode` (`ProductCode`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- Dumping data for table database_2111536.products: ~0 rows (approximately)
/*!40000 ALTER TABLE `products` DISABLE KEYS */;
/*!40000 ALTER TABLE `products` ENABLE KEYS */;

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;
