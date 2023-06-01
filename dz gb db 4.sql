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

-- Дамп структуры для таблица gb.AUTO
CREATE TABLE IF NOT EXISTS `AUTO` (
  `REGNUM` varchar(10) NOT NULL,
  `MARK` varchar(10) DEFAULT NULL,
  `COLOR` varchar(15) DEFAULT NULL,
  `RELEASEDT` date DEFAULT NULL,
  `PHONENUM` varchar(15) DEFAULT NULL,
  PRIMARY KEY (`REGNUM`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Дамп данных таблицы gb.AUTO: ~9 rows (приблизительно)
DELETE FROM `AUTO`;
/*!40000 ALTER TABLE `AUTO` DISABLE KEYS */;
INSERT INTO `AUTO` (`REGNUM`, `MARK`, `COLOR`, `RELEASEDT`, `PHONENUM`) VALUES
	('111113', 'BMW', 'ЗЕЛЕНЫЙ', '2007-01-01', '9214444444'),
	('111114', 'LADA', 'КРАСНЫЙ', '2008-01-01', '9152222221'),
	('111115', 'VOLVO', 'КРАСНЫЙ', '2013-01-01', '9173333334'),
	('111116', 'BMW', 'СИНИЙ', '2015-01-01', '9173333334'),
	('111117', 'BMW', 'СИНИЙ', '2005-01-01', NULL),
	('111119', 'LADA', 'СИНИЙ', '2017-01-01', '9213333331'),
	('111121', 'AUDI', 'СИНИЙ', '2009-01-01', '9173333332'),
	('111122', 'AUDI', 'СИНИЙ', '2011-01-01', '9213333336'),
	('111126', 'LADA', 'ЗЕЛЕНЫЙ', '2005-01-01', NULL);
/*!40000 ALTER TABLE `AUTO` ENABLE KEYS */;

-- Дамп структуры для таблица gb.CITY
CREATE TABLE IF NOT EXISTS `CITY` (
  `CITYCODE` int(11) NOT NULL,
  `CITYNAME` varchar(50) DEFAULT NULL,
  `PEOPLES` int(11) DEFAULT NULL,
  PRIMARY KEY (`CITYCODE`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Дамп данных таблицы gb.CITY: ~8 rows (приблизительно)
DELETE FROM `CITY`;
/*!40000 ALTER TABLE `CITY` DISABLE KEYS */;
INSERT INTO `CITY` (`CITYCODE`, `CITYNAME`, `PEOPLES`) VALUES
	(1, 'Москва', 10000000),
	(2, 'Владимир', 500000),
	(3, 'Орел', 300000),
	(4, 'Курск', 200000),
	(5, 'Казань', 2000000),
	(7, 'Котлас', 110000),
	(8, 'Мурманск', 400000),
	(9, 'Ярославль', 500000);
/*!40000 ALTER TABLE `CITY` ENABLE KEYS */;

-- Дамп структуры для таблица gb.clients
CREATE TABLE IF NOT EXISTS `clients` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `login` varchar(255) DEFAULT NULL,
  `pass` varchar(255) DEFAULT NULL,
  `male` tinyint(4) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8;

-- Дамп данных таблицы gb.clients: ~11 rows (приблизительно)
DELETE FROM `clients`;
/*!40000 ALTER TABLE `clients` DISABLE KEYS */;
INSERT INTO `clients` (`id`, `login`, `pass`, `male`) VALUES
	(1, 'alexander', '$2y$10$6SzbBCMENklStIgTqBKIluijJUnbeZ5WqIu4RJgkksnFZon5kH14y', 1),
	(2, 'Mikle', '$ws$10$6SzbBCMENklStIgTqBKIluijJUnbeZ5WqIu4RJgkksnFZon5kH14y', 1),
	(3, 'Olia', '$2y$10$88zbBCKLJklStIgTqBKIluijJUnbeZ5WqJI4RJgkksnFZon5kH14y', 2),
	(4, 'Dmitry', '$2y$20$6SzbBCNRNklStIgTqBKIluijJUnbeZ5WqIu4RJgkksnFZon5kH20y', 1),
	(5, 'Margaret', '$2y$20$6SzbBCNRNklStIgTqBKIluijJUnbeZ4wqIu4RJgkksnFZon5kH20y', 2),
	(6, 'Leonid', '$2y$10$6SzbBCMENklStIgTqBKIluijJUnbeZ5WqIu4RJgkksnFZon5kH14y', 1),
	(7, 'Mikle', '$ws$10$6SzbBCMENklStIgTqBKIluijJUnbeZ5WqIu4RJgkksnFZon5kH14y', 1),
	(8, 'Olga', '$2y$10$88zbBCKLJklStIgTqBKIluijJUnbeZ5WqJI4RJgkksnFZon5kH14y', 2),
	(9, 'Tom', '$2y$20$6SzbBCNRNklStIgTqBKIluijJUnbeZ5WqIu4RJgkksnFZon5kH20y', 1),
	(10, 'Masha', '$2y$20$6SzbBCNRNklStIgTqBKIluijJUnbeZ4wqIu4RJgkksnFZon5kH20y', 2),
	(11, 'alex', '$2y$10$6SzbBCMENklStIgTqBKIluijJUnbeZ5WqIu4RJgkksnFZon5kH14y', 1);
/*!40000 ALTER TABLE `clients` ENABLE KEYS */;

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

-- Дамп структуры для таблица gb.Employee
CREATE TABLE IF NOT EXISTS `Employee` (
  `Id` int(11) NOT NULL,
  `Name` varchar(45) NOT NULL,
  `Department` varchar(45) NOT NULL,
  `Salary` float NOT NULL,
  `Gender` varchar(45) NOT NULL,
  `Age` int(11) NOT NULL,
  `City` varchar(45) NOT NULL,
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Дамп данных таблицы gb.Employee: ~10 rows (приблизительно)
DELETE FROM `Employee`;
/*!40000 ALTER TABLE `Employee` DISABLE KEYS */;
INSERT INTO `Employee` (`Id`, `Name`, `Department`, `Salary`, `Gender`, `Age`, `City`) VALUES
	(1001, 'John Doe', 'IT', 35000, 'Male', 25, 'London'),
	(1002, 'Mary Smith', 'HR', 45000, 'Female', 27, 'London'),
	(1003, 'James Brown', 'Finance', 50000, 'Male', 28, 'London'),
	(1004, 'Mike Walker', 'Finance', 50000, 'Male', 28, 'London'),
	(1005, 'Linda Jones', 'HR', 75000, 'Female', 26, 'London'),
	(1006, 'Anurag Mohanty', 'IT', 35000, 'Male', 25, 'Mumbai'),
	(1007, 'Priyanla Dewangan', 'HR', 45000, 'Female', 27, 'Mumbai'),
	(1008, 'Sambit Mohanty', 'IT', 50000, 'Male', 28, 'Mumbai'),
	(1009, 'Pranaya Kumar', 'IT', 50000, 'Male', 28, 'Mumbai'),
	(1010, 'Hina Sharma', 'HR', 75000, 'Female', 26, 'Mumbai');
/*!40000 ALTER TABLE `Employee` ENABLE KEYS */;

-- Дамп структуры для таблица gb.MAN
CREATE TABLE IF NOT EXISTS `MAN` (
  `PHONENUM` varchar(15) NOT NULL,
  `FIRSTNAME` varchar(50) DEFAULT NULL,
  `LASTNAME` varchar(50) DEFAULT NULL,
  `CITYCODE` int(11) DEFAULT NULL,
  `YEAROLD` int(11) DEFAULT NULL,
  PRIMARY KEY (`PHONENUM`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Дамп данных таблицы gb.MAN: ~9 rows (приблизительно)
DELETE FROM `MAN`;
/*!40000 ALTER TABLE `MAN` DISABLE KEYS */;
INSERT INTO `MAN` (`PHONENUM`, `FIRSTNAME`, `LASTNAME`, `CITYCODE`, `YEAROLD`) VALUES
	('9152222221', 'Андрей', 'Николаев', 1, 22),
	('9152222222', 'Максим', 'Москитов', 1, 31),
	('9153333333', 'Олег', 'Денисов', 3, 34),
	('9173333334', 'Алиса', 'Никина', 4, 31),
	('9173333335', 'Таня', 'Иванова', 4, 31),
	('9213333331', 'Андрей', 'Некрасов', 2, 27),
	('9213333332', 'Миша', 'Рогозин', 2, 21),
	('9213333336', 'Алексей', 'Иванов', 7, 25),
	('9214444444', 'Алексей', 'Галкин', 1, 38);
/*!40000 ALTER TABLE `MAN` ENABLE KEYS */;

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

-- Дамп данных таблицы gb.orders: ~10 rows (приблизительно)
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

-- Дамп структуры для таблица gb.Projects
CREATE TABLE IF NOT EXISTS `Projects` (
  `ProjectId` int(11) NOT NULL AUTO_INCREMENT,
  `Title` varchar(200) NOT NULL,
  `ClientId` int(11) DEFAULT NULL,
  `EmployeeId` int(11) DEFAULT NULL,
  `StartDate` datetime DEFAULT NULL,
  `EndDate` datetime DEFAULT NULL,
  PRIMARY KEY (`ProjectId`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;

-- Дамп данных таблицы gb.Projects: ~8 rows (приблизительно)
DELETE FROM `Projects`;
/*!40000 ALTER TABLE `Projects` DISABLE KEYS */;
INSERT INTO `Projects` (`ProjectId`, `Title`, `ClientId`, `EmployeeId`, `StartDate`, `EndDate`) VALUES
	(1, 'Develop ecommerse website from scratch', 1, 1003, '2023-06-01 14:21:56', '2023-07-01 14:21:56'),
	(2, 'WordPress website for our company', 1, 1002, '2023-06-01 14:21:56', '2023-07-16 14:21:56'),
	(3, 'Manage our company servers', 2, 1007, '2023-06-01 14:21:56', '2023-07-16 14:21:56'),
	(4, 'Hosting account is not working', 3, 1009, '2023-06-01 14:21:56', '2023-06-08 14:21:56'),
	(5, 'MySQL database from my desktop application', 4, 1010, '2023-06-01 14:21:56', '2023-06-16 14:21:56'),
	(6, 'Develop new WordPress plugin for my business website', 2, NULL, '2023-06-01 14:21:56', '2023-06-11 14:21:56'),
	(7, 'Migrate web application and database to new server', 2, NULL, '2023-06-01 14:21:56', '2023-06-06 14:21:56'),
	(8, 'Android Application development', 4, 1004, '2023-06-01 14:21:56', '2023-07-01 14:21:56');
/*!40000 ALTER TABLE `Projects` ENABLE KEYS */;

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

-- Дамп структуры для таблица gb.test_a
CREATE TABLE IF NOT EXISTS `test_a` (
  `id` int(11) DEFAULT NULL,
  `text` varchar(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Дамп данных таблицы gb.test_a: ~0 rows (приблизительно)
DELETE FROM `test_a`;
/*!40000 ALTER TABLE `test_a` DISABLE KEYS */;
INSERT INTO `test_a` (`id`, `text`) VALUES
	(10, 'A'),
	(20, 'A'),
	(30, 'F'),
	(40, 'D'),
	(50, 'C');
/*!40000 ALTER TABLE `test_a` ENABLE KEYS */;

-- Дамп структуры для таблица gb.users
CREATE TABLE IF NOT EXISTS `users` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `login` varchar(255) DEFAULT NULL,
  `pass` varchar(255) DEFAULT NULL,
  `male` tinyint(4) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;

-- Дамп данных таблицы gb.users: ~6 rows (приблизительно)
DELETE FROM `users`;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` (`id`, `login`, `pass`, `male`) VALUES
	(1, 'alex', '$2y$10$6SzbBCMENklStIgTqBKIluijJUnbeZ5WqIu4RJgkksnFZon5kH14y', 1),
	(2, 'Mikle', '$ws$10$6SzbBCMENklStIgTqBKIluijJUnbeZ5WqIu4RJgkksnFZon5kH14y', 1),
	(3, 'Olia', '$2y$10$88zbBCKLJklStIgTqBKIluijJUnbeZ5WqJI4RJgkksnFZon5kH14y', 2),
	(4, 'Tom', '$2y$20$6SzbBCNRNklStIgTqBKIluijJUnbeZ5WqIu4RJgkksnFZon5kH20y', 1),
	(5, 'Margaret', '$2y$20$6SzbBCNRNklStIgTqBKIluijJUnbeZ4wqIu4RJgkksnFZon5kH20y', 2),
	(6, 'alex', '$2y$10$6SzbBCMENklStIgTqBKIluijJUnbeZ5WqIu4RJgkksnFZon5kH14y', 1);
/*!40000 ALTER TABLE `users` ENABLE KEYS */;

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;
