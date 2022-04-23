/* Delimiter changed to ; */
/* Connecting to 127.0.0.1 via MariaDB or MySQL (TCP/IP), username root, using password: Yes ... */
/* Can't connect to MySQL server on '127.0.0.1' (10061) */
/* Connecting to 127.0.0.1 via MariaDB or MySQL (TCP/IP), username root, using password: Yes ... */
/* Can't connect to MySQL server on '127.0.0.1' (10061) */
/* Connecting to 127.0.0.1 via MariaDB or MySQL (TCP/IP), username root, using password: Yes ... */
SELECT CONNECTION_ID();
/* Characterset: utf8mb4 */
SHOW /*!50002 GLOBAL */ STATUS;
SELECT NOW();
SHOW VARIABLES;
/* Connected. Thread-ID: 8 */
SHOW TABLES FROM `information_schema`;
SHOW DATABASES;
SHOW OPEN TABLES FROM database_2111536 WHERE `in_use`!=0;
USE `database_2111536`;
/* Entering session "root" */
SELECT `DEFAULT_COLLATION_NAME` FROM `information_schema`.`SCHEMATA` WHERE `SCHEMA_NAME`='database_2111536';
SHOW TABLE STATUS FROM `database_2111536`;
SHOW FUNCTION STATUS WHERE `Db`='database_2111536';
SHOW PROCEDURE STATUS WHERE `Db`='database_2111536';
SHOW TRIGGERS FROM `database_2111536`;
SELECT *, EVENT_SCHEMA AS `Db`, EVENT_NAME AS `Name` FROM information_schema.`EVENTS` WHERE `EVENT_SCHEMA`='database_2111536';
/* Loading file "C:\Users\Harjinder Kaur\Desktop\Mysql.sql" (27 B) into query tab #1 ... */
/* Loading file "C:\Users\Harjinder Kaur\Desktop\web server\pro_shivneet\pro_shivneet\db_shivneet.sql" (3.2 KiB) into query tab #2 ... */
SHOW VARIABLES;
FLUSH PRIVILEGES;
SHOW COLUMNS FROM `mysql`.`user`;
SELECT `user`, `host`, IF(LENGTH(password)>0, password, authentication_string) AS `password` FROM `mysql`.`user`;
CREATE USER 'Harry'@'localhost' IDENTIFIED BY 'QopenO';
GRANT USAGE ON *.* TO 'Harry'@'localhost';
GRANT USAGE ON PROCEDURE `database_2111536`.`Delete_customer` TO 'Harry'@'localhost' WITH GRANT OPTION;
FLUSH PRIVILEGES;
SHOW GRANTS FOR 'Harry'@'localhost';
GRANT USAGE ON PROCEDURE `database_2111536`.`Delete_order` TO 'Harry'@'localhost' WITH GRANT OPTION;
GRANT USAGE ON PROCEDURE `database_2111536`.`Delete_product` TO 'Harry'@'localhost' WITH GRANT OPTION;
GRANT USAGE ON PROCEDURE `database_2111536`.`Insert_customer` TO 'Harry'@'localhost' WITH GRANT OPTION;
GRANT USAGE ON PROCEDURE `database_2111536`.`Insert_order` TO 'Harry'@'localhost' WITH GRANT OPTION;
GRANT USAGE ON PROCEDURE `database_2111536`.`Insert_product` TO 'Harry'@'localhost' WITH GRANT OPTION;
GRANT USAGE ON PROCEDURE `database_2111536`.`Login_customer` TO 'Harry'@'localhost' WITH GRANT OPTION;
GRANT USAGE ON PROCEDURE `database_2111536`.`Selectall_customers` TO 'Harry'@'localhost' WITH GRANT OPTION;
GRANT USAGE ON PROCEDURE `database_2111536`.`Selectall_orders` TO 'Harry'@'localhost' WITH GRANT OPTION;
GRANT USAGE ON PROCEDURE `database_2111536`.`Selectall_products` TO 'Harry'@'localhost' WITH GRANT OPTION;
GRANT USAGE ON PROCEDURE `database_2111536`.`Select_Customer` TO 'Harry'@'localhost' WITH GRANT OPTION;
GRANT USAGE ON PROCEDURE `database_2111536`.`Select_order` TO 'Harry'@'localhost' WITH GRANT OPTION;
GRANT USAGE ON PROCEDURE `database_2111536`.`Select_product` TO 'Harry'@'localhost' WITH GRANT OPTION;
GRANT USAGE ON PROCEDURE `database_2111536`.`Update_customer` TO 'Harry'@'localhost' WITH GRANT OPTION;
GRANT USAGE ON PROCEDURE `database_2111536`.`Update_order` TO 'Harry'@'localhost' WITH GRANT OPTION;
GRANT USAGE ON PROCEDURE `database_2111536`.`Update_product` TO 'Harry'@'localhost' WITH GRANT OPTION;
FLUSH PRIVILEGES;
SHOW GRANTS FOR 'Harry'@'localhost';
SET PASSWORD FOR 'Harry'@'localhost' = PASSWORD('ru4oFI');
FLUSH PRIVILEGES;
SHOW GRANTS FOR 'Harry'@'localhost';
SET PASSWORD FOR 'Harry'@'localhost' = PASSWORD('WoV5w8');
FLUSH PRIVILEGES;
SHOW GRANTS FOR 'Harry'@'localhost';
FLUSH PRIVILEGES;
SHOW COLUMNS FROM `mysql`.`user`;
SELECT `user`, `host`, IF(LENGTH(password)>0, password, authentication_string) AS `password` FROM `mysql`.`user`;
SHOW GRANTS FOR 'Harry'@'localhost';
SHOW GRANTS FOR 'Harry'@'localhost';
/* Affected rows: 0  Found rows: 17  Warnings: 0  Duration for 1 query: 0.000 sec. */
SELECT NOW();
SHOW GRANTS FOR Harry@localhost;
/* Affected rows: 0  Found rows: 17  Warnings: 0  Duration for 1 query: 0.000 sec. */