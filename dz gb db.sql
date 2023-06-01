-- --------------------------------------------------------
-- Хост:                         localhost
-- Версия сервера:               5.6.28-76.1 - Percona Server (GPL), Release 76.1, Revision 5759e76
-- Операционная система:         debian-linux-gnu
-- HeidiSQL Версия:              11.3.0.6295
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


-- Дамп структуры базы данных gb
CREATE DATABASE IF NOT EXISTS `gb` /*!40100 DEFAULT CHARACTER SET utf8 */;
USE `gb`;

-- Дамп структуры для таблица gb.customers
CREATE TABLE IF NOT EXISTS `customers` (
  `cnum` int(11) NOT NULL AUTO_INCREMENT,
  `cname` varchar(50) NOT NULL,
  `city` varchar(50) NOT NULL,
  `rating` int(11) NOT NULL DEFAULT '0',
  `snum` int(11) DEFAULT NULL,
  PRIMARY KEY (`cnum`),
  KEY `FK_customers_salespeople` (`snum`),
  KEY `cnum` (`cnum`),
  CONSTRAINT `FK_customers_salespeople` FOREIGN KEY (`snum`) REFERENCES `salespeople` (`snum`) ON DELETE SET NULL ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=2009 DEFAULT CHARSET=utf8;

-- Дамп данных таблицы gb.customers: ~7 rows (приблизительно)
DELETE FROM `customers`;
/*!40000 ALTER TABLE `customers` DISABLE KEYS */;
INSERT INTO `customers` (`cnum`, `cname`, `city`, `rating`, `snum`) VALUES
	(2001, 'Hoffman', 'London', 100, 1001),
	(2002, 'Giovanni', 'Rome', 200, 1003),
	(2003, 'Liu', 'SanJose', 200, 1002),
	(2004, 'Grass', 'Berlin', 300, 1002),
	(2006, 'Clemens', 'London', 100, 1001),
	(2007, 'Pereira', 'Rome', 100, 1004),
	(2008, 'Cisneros', 'SanJose', 300, 1007);
/*!40000 ALTER TABLE `customers` ENABLE KEYS */;

-- Дамп структуры для таблица gb.orders
CREATE TABLE IF NOT EXISTS `orders` (
  `onum` int(11) NOT NULL AUTO_INCREMENT,
  `amt` float(8,2) NOT NULL DEFAULT '0.00',
  `odate` date NOT NULL,
  `cnum` int(11) DEFAULT NULL,
  `snum` int(11) DEFAULT NULL,
  PRIMARY KEY (`onum`),
  KEY `cnum` (`cnum`),
  KEY `snum` (`snum`),
  CONSTRAINT `FK_orders_customers` FOREIGN KEY (`cnum`) REFERENCES `customers` (`cnum`) ON DELETE SET NULL ON UPDATE NO ACTION,
  CONSTRAINT `FK_orders_salespeople` FOREIGN KEY (`snum`) REFERENCES `salespeople` (`snum`) ON DELETE SET NULL ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=3012 DEFAULT CHARSET=utf8;

-- Дамп данных таблицы gb.orders: ~0 rows (приблизительно)
DELETE FROM `orders`;
/*!40000 ALTER TABLE `orders` DISABLE KEYS */;
INSERT INTO `orders` (`onum`, `amt`, `odate`, `cnum`, `snum`) VALUES
	(3001, 18.69, '1990-03-10', 2008, 1007),
	(3002, 1900.10, '1990-03-10', 2007, 1004),
	(3003, 767.19, '1990-03-10', 2001, 1001),
	(3005, 5160.45, '1990-03-10', 2003, 1002),
	(3006, 1098.16, '1990-03-10', 2008, 1007),
	(3007, 75.75, '1990-04-10', 2004, 1002),
	(3008, 4723.00, '1990-05-10', 2006, 1001),
	(3009, 1713.23, '1990-04-10', 2002, 1003),
	(3010, 1309.95, '1990-06-10', 2004, 1002),
	(3011, 9891.88, '1990-06-10', 2006, 1001);
/*!40000 ALTER TABLE `orders` ENABLE KEYS */;

-- Дамп структуры для таблица gb.salespeople
CREATE TABLE IF NOT EXISTS `salespeople` (
  `snum` int(11) NOT NULL AUTO_INCREMENT,
  `sname` varchar(50) NOT NULL,
  `city` varchar(50) NOT NULL,
  `comm` varchar(50) NOT NULL,
  PRIMARY KEY (`snum`),
  KEY `snum` (`snum`)
) ENGINE=InnoDB AUTO_INCREMENT=1008 DEFAULT CHARSET=utf8;

-- Дамп данных таблицы gb.salespeople: ~5 rows (приблизительно)
DELETE FROM `salespeople`;
/*!40000 ALTER TABLE `salespeople` DISABLE KEYS */;
INSERT INTO `salespeople` (`snum`, `sname`, `city`, `comm`) VALUES
	(1001, 'Peel', 'London', '.12'),
	(1002, 'Serres', 'San Jose', '.13'),
	(1003, 'Axelrod', 'New York', '.10'),
	(1004, 'Motika', 'London', '.11'),
	(1007, 'Rifkin', 'Barcelona', '.15');
/*!40000 ALTER TABLE `salespeople` ENABLE KEYS */;

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;
