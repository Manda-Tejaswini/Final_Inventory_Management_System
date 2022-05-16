CREATE DATABASE  IF NOT EXISTS `inventorymanagementappication`;
USE `inventorymanagementappication`;

DROP TABLE IF EXISTS `sales`;
DROP TABLE IF EXISTS `item`;
DROP TABLE IF EXISTS `purchase`;
DROP TABLE IF EXISTS `inventory_customer_tbl`;
DROP TABLE IF EXISTS `users`;

CREATE TABLE `users` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `username` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
);
LOCK TABLES `users` WRITE;
UNLOCK TABLES;


 CREATE TABLE `inventory_customer_tbl` (
   `id` bigint NOT NULL AUTO_INCREMENT,
   `address` varchar(255) DEFAULT NULL,
   `address2` varchar(255) DEFAULT NULL,
   `city` varchar(255) DEFAULT NULL,
   `district` varchar(255) DEFAULT NULL,
   `email` varchar(255) DEFAULT NULL,
   `full_name` varchar(255) DEFAULT NULL,
   `phone2` int NOT NULL,
   `phone_number` int NOT NULL,
   `status` varchar(255) DEFAULT NULL,
   `user_id`  bigint(20) not null,
   PRIMARY KEY (`id`),
   constraint foreign key (`user_id`) references users(id)
 ) ;

LOCK TABLES `inventory_customer_tbl` WRITE;

UNLOCK TABLES;



CREATE TABLE `item` (
   `id` bigint NOT NULL AUTO_INCREMENT primary key,
   `description` varchar(255) DEFAULT NULL,
   `item_name` varchar(255) DEFAULT NULL,
   `item_number` int NOT NULL,
   `product_id` int NOT NULL,
   `quantity` bigint NOT NULL,
   `total_price` bigint NOT NULL,
   `unit_price` bigint NOT NULL,
   `customer_id` bigint DEFAULT NULL,
   FOREIGN KEY (`customer_id`) references inventory_customer_tbl(id)
 );

LOCK TABLES `item` WRITE;

UNLOCK TABLES;

CREATE TABLE `purchase` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `current_stock` bigint(20) DEFAULT NULL,
  `item_name` varchar(255) DEFAULT NULL,
  `item_number` int(11) DEFAULT NULL,
  `purchase_id` int(11) DEFAULT NULL,
  `quantity` bigint(20) DEFAULT NULL,
  `sale_date` date DEFAULT NULL,
  `total_cost` bigint(20) DEFAULT NULL,
  `unit_price` bigint(20) DEFAULT NULL,
  `vendor_name` varchar(255) DEFAULT NULL,
  `customer_id` bigint DEFAULT NULL,
   FOREIGN KEY (`customer_id`) references inventory_customer_tbl(id),
  PRIMARY KEY (`id`)
) ;

LOCK TABLES `purchase` WRITE;
UNLOCK TABLES;

CREATE TABLE `sales` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `customer_name` varchar(255) DEFAULT NULL,
  `discount` bigint(20) DEFAULT NULL,
  `item_name` varchar(255) DEFAULT NULL,
  `item_number` int(11) DEFAULT NULL,
  `quantity` bigint(20) DEFAULT NULL,
  `sale_date` date DEFAULT NULL,
  `sale_id` int(11) DEFAULT NULL,
  `total` bigint(20) DEFAULT NULL,
  `total_stock` bigint(20) DEFAULT NULL,
  `unit_price` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  `customer_id` bigint DEFAULT NULL,
   FOREIGN KEY (`customer_id`) references inventory_customer_tbl(id)
);

LOCK TABLES `sales` WRITE;

UNLOCK TABLES;

