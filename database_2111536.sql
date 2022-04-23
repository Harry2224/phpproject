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
  `CustomerImage` blob DEFAULT NULL,
  `Creation` datetime NOT NULL DEFAULT current_timestamp(),
  `Modification` datetime NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  PRIMARY KEY (`Customer_id`),
  UNIQUE KEY `Username` (`Username`),
  UNIQUE KEY `Customer_id` (`Customer_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- Dumping data for table database_2111536.customers: ~3 rows (approximately)
/*!40000 ALTER TABLE `customers` DISABLE KEYS */;
INSERT INTO `customers` (`Customer_id`, `FirstName`, `LastName`, `Address`, `City`, `Province`, `PostalCode`, `Username`, `Password`, `CustomerImage`, `Creation`, `Modification`) VALUES
	(10001, 'Harry', 'Kaur', 'Snowdon', 'Montreal', 'Quebec', 'H3W1W9', 'Harry', 'baby', NULL, '2022-04-22 11:07:21', '2022-04-22 11:07:21'),
	(10002, 'Neha', 'Kamboj', 'stcair', 'toronto', 'Ontario', 'S3E2P', 'Neha', 'Nonu', NULL, '2022-04-22 11:08:29', '2022-04-22 11:08:30'),
	(10003, 'Pooja', 'Taya', 'Lasalle', 'Montreal', 'Quebec', 'H5P1P6', 'Pooja', 'Rani', NULL, '2022-04-22 11:09:09', '2022-04-22 11:09:53');
/*!40000 ALTER TABLE `customers` ENABLE KEYS */;

-- Dumping structure for procedure database_2111536.Delete_customer
DELIMITER //
CREATE PROCEDURE `Delete_customer`()
BEGIN
# Harjinder kaur(211536) 22-04-2022  create store procedure to delete record based on customer id.
DELETE FROM customers
WHERE Customer_id = @cid;
END//
DELIMITER ;

-- Dumping structure for procedure database_2111536.Delete_order
DELIMITER //
CREATE PROCEDURE `Delete_order`()
BEGIN
# Harjinder kaur(211536) 22-04-2022  create store procedure to delete record based on order id
DELETE FROM orders
WHERE Order_ID = @orderid;
END//
DELIMITER ;

-- Dumping structure for procedure database_2111536.Delete_product
DELIMITER //
CREATE PROCEDURE `Delete_product`()
BEGIN
# Harjinder kaur(211536) 22-04-2022  create store procedure to delete record based on product code
DELETE FROM products
WHERE ProductCode = @procode;
END//
DELIMITER ;

-- Dumping structure for procedure database_2111536.Insert_customer
DELIMITER //
CREATE PROCEDURE `Insert_customer`()
BEGIN
# Harjinder kaur(211536) 22-04-2022  create store procedure to  insert record 
INSERT INTO customers
(Customer_id, FirstName, LastName, Address, City, Province,
PostalCode, Username, Password, CustomerImage, Creation, Modification)
VALUES(@id, @Fname, @Lname, @address, @city, @province, @postalcode,
@username, @PASSWORD, @image, @created, @modified);
END//
DELIMITER ;

-- Dumping structure for procedure database_2111536.Insert_order
DELIMITER //
CREATE PROCEDURE `Insert_order`()
BEGIN
# Harjinder kaur(211536) 22-04-2022  create store procedure to  insert record 
INSERT INTO orders
(Order_ID, Customer_id, ProductCode, SoldQty, 
SoldProductPr, Comments, Creation, Modification)
VALUES (@oid, @Cid, @procode, @soldqty,
@soldpr, @comments, @creation, @modification);
END//
DELIMITER ;

-- Dumping structure for procedure database_2111536.Insert_product
DELIMITER //
CREATE PROCEDURE `Insert_product`()
BEGIN
# Harjinder kaur(211536) 22-04-2022  create store procedure to  insert record 
INSERT INTO products
(ProductCode, ProductDesc, ProductPrice,
CostPrice, Creation, Modification)
VALUES(@prodcode, @proddesc, @proprice,
@costprice, @created, @modified);
END//
DELIMITER ;

-- Dumping structure for procedure database_2111536.Login_customer
DELIMITER //
CREATE PROCEDURE `Login_customer`()
BEGIN
# Harjinder kaur(211536) 22-04-2022  create store procedure which should accept a username and return its
# corresponding password
SELECT Username
FROM customers WHERE Password= @password;
END//
DELIMITER ;

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

-- Dumping data for table database_2111536.orders: ~3 rows (approximately)
/*!40000 ALTER TABLE `orders` DISABLE KEYS */;
INSERT INTO `orders` (`Order_ID`, `Customer_id`, `ProductCode`, `SoldQty`, `SoldProductPr`, `Comments`, `Creation`, `Modification`) VALUES
	(1001, 10001, 'p111', 5, 100, 'ghfyguhh', '2022-04-22 11:18:05', '2022-04-22 11:18:06'),
	(1002, 10002, 'p113', 10, 80, 'fhtfyjgkujhk', '2022-04-22 11:18:29', '2022-04-22 11:18:43'),
	(1003, 10003, 'p112', 5, 70, 'grdthfhgk', '2022-04-22 11:19:19', '2022-04-22 11:19:20');
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

-- Dumping data for table database_2111536.products: ~3 rows (approximately)
/*!40000 ALTER TABLE `products` DISABLE KEYS */;
INSERT INTO `products` (`ProductCode`, `ProductDesc`, `ProductPrice`, `CostPrice`, `Creation`, `Modification`) VALUES
	('p111', 'This plant has the awesome fragnance', 20.25, 25.3, '2022-04-22 11:13:21', '2022-04-22 11:13:23'),
	('p112', 'This plant is good for Oxygen', 30.3, 35.25, '2022-04-22 11:14:04', '2022-04-22 11:14:05'),
	('p113', 'This plant is good for health', 25.5, 30.5, '2022-04-22 11:15:04', '2022-04-22 11:15:20');
/*!40000 ALTER TABLE `products` ENABLE KEYS */;

-- Dumping structure for procedure database_2111536.Selectall_customers
DELIMITER //
CREATE PROCEDURE `Selectall_customers`()
BEGIN
# Harjinder kaur(211536) 22-04-2022  create store procedure to show all data of the table
SELECT * FROM customers;
END//
DELIMITER ;

-- Dumping structure for procedure database_2111536.Selectall_orders
DELIMITER //
CREATE PROCEDURE `Selectall_orders`()
BEGIN
# Harjinder kaur(211536) 22-04-2022  create store procedure to show all data of the table
SELECT * FROM orders;
END//
DELIMITER ;

-- Dumping structure for procedure database_2111536.Selectall_products
DELIMITER //
CREATE PROCEDURE `Selectall_products`()
BEGIN
# Harjinder kaur(211536) 22-04-2022  create store procedure to show all data of the table
SELECT * FROM products;
END//
DELIMITER ;

-- Dumping structure for procedure database_2111536.Select_Customer
DELIMITER //
CREATE PROCEDURE `Select_Customer`()
BEGIN
# Harjinder kaur(211536) 22-04-2022  create store procedure to show data of one row
SELECT * FROM customers
ORDER BY RANDOM()
LIMIT 1 ;
END//
DELIMITER ;

-- Dumping structure for procedure database_2111536.Select_order
DELIMITER //
CREATE PROCEDURE `Select_order`()
BEGIN
# Harjinder kaur(211536) 22-04-2022  create store procedure to show data of one row
SELECT * FROM orders
ORDER BY RANDOM()
LIMIT 1;
END//
DELIMITER ;

-- Dumping structure for procedure database_2111536.Select_product
DELIMITER //
CREATE PROCEDURE `Select_product`()
BEGIN
# Harjinder kaur(211536) 22-04-2022  create store procedure to show data of one row
SELECT * FROM products
ORDER BY RANDOM()
LIMIT 1;
END//
DELIMITER ;

-- Dumping structure for procedure database_2111536.Update_customer
DELIMITER //
CREATE PROCEDURE `Update_customer`()
BEGIN
# Harjinder kaur(211536) 22-04-2022  create store procedure to update the table
UPDATE customers
SET

FirstName = @Fname,
LastName = @Lname,
Address = @address,
City = @city,
Province = @province,
PostalCode = @postalcode,
Username = @username,
PASSWORD = @pwd,
CustomerImage = @image,
Creation = @creation,
Modification = @modification
WHERE
Customer_id = @id;
 
END//
DELIMITER ;

-- Dumping structure for procedure database_2111536.Update_order
DELIMITER //
CREATE PROCEDURE `Update_order`()
BEGIN
# Harjinder kaur(211536) 22-04-2022  create store procedure to update the table
UPDATE orders
SET
Customer_id = @cid,
ProductCode = @procode,
SoldQty = @soldqty,
SoldProductPr = @soldprice,
Comments = @comments,
Creation = @created,
Modification = @modified
WHERE
Order_ID = @orderid;
END//
DELIMITER ;

-- Dumping structure for procedure database_2111536.Update_product
DELIMITER //
CREATE PROCEDURE `Update_product`()
BEGIN
# Harjinder kaur(211536) 22-04-2022  create store procedure to update the table
UPDATE products
SET
ProductDesc = @prodescription,
ProductPrice = @proprice,
CostPrice = @costprice,
Creation = @created,
Modification = @modified
WHERE
ProductCode = @prodcode;
END//
DELIMITER ;

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;
