-- --------------------------------------------------------
-- Хост:                         127.0.0.1
-- Версия сервера:               10.4.11-MariaDB - mariadb.org binary distribution
-- Операционная система:         Win64
-- HeidiSQL Версия:              11.0.0.5919
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;


-- Дамп структуры базы данных db1
CREATE DATABASE IF NOT EXISTS `db1` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci */;
USE `db1`;

-- Дамп структуры для таблица db1.accounts
CREATE TABLE IF NOT EXISTS `accounts` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `currency_id` int(11) NOT NULL,
  `balance` int(11) NOT NULL COMMENT 'баланс рахунку користувача',
  PRIMARY KEY (`id`),
  UNIQUE KEY `currency_idd` (`currency_id`,`user_id`) USING BTREE,
  KEY `user_id` (`user_id`),
  CONSTRAINT `currency_idd` FOREIGN KEY (`currency_id`) REFERENCES `currencies` (`id`),
  CONSTRAINT `users_id` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- Дамп данных таблицы db1.accounts: ~12 rows (приблизительно)
/*!40000 ALTER TABLE `accounts` DISABLE KEYS */;
INSERT INTO `accounts` (`id`, `user_id`, `currency_id`, `balance`) VALUES
	(1, 1, 1, 1200),
	(2, 2, 1, 2200),
	(3, 3, 1, 2700),
	(4, 4, 2, 900),
	(5, 5, 1, 1300),
	(7, 4, 4, 500),
	(8, 2, 2, 1600),
	(9, 3, 5, 1600),
	(10, 4, 3, 540),
	(11, 1, 5, 250),
	(12, 1, 4, 1450),
	(13, 3, 2, 5000);
/*!40000 ALTER TABLE `accounts` ENABLE KEYS */;

-- Дамп структуры для таблица db1.amounts
CREATE TABLE IF NOT EXISTS `amounts` (
  `id` int(11) NOT NULL,
  `cashbox_id` int(11) NOT NULL,
  `value` int(11) NOT NULL COMMENT 'Номінал валюти',
  `quantity` int(11) NOT NULL COMMENT 'Кількість валюти',
  UNIQUE KEY `cashbox_value` (`value`,`cashbox_id`),
  KEY `cashbox_idd` (`cashbox_id`),
  CONSTRAINT `cashbox_idd` FOREIGN KEY (`cashbox_id`) REFERENCES `cashboxes` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- Дамп данных таблицы db1.amounts: ~48 rows (приблизительно)
/*!40000 ALTER TABLE `amounts` DISABLE KEYS */;
INSERT INTO `amounts` (`id`, `cashbox_id`, `value`, `quantity`) VALUES
	(8, 1, 5, 2),
	(8, 2, 5, 2),
	(8, 3, 5, 2),
	(8, 4, 5, 2),
	(8, 5, 5, 2),
	(8, 6, 5, 2),
	(7, 1, 10, 2),
	(7, 2, 10, 3),
	(7, 3, 10, 2),
	(7, 4, 10, 2),
	(7, 5, 10, 2),
	(7, 6, 10, 2),
	(6, 1, 20, 1),
	(6, 2, 20, 1),
	(6, 3, 20, 1),
	(6, 4, 20, 1),
	(6, 5, 20, 1),
	(6, 6, 20, 1),
	(5, 1, 50, 3),
	(5, 2, 50, 3),
	(5, 3, 50, 3),
	(5, 4, 50, 3),
	(5, 5, 50, 3),
	(5, 6, 50, 3),
	(4, 1, 100, 3),
	(4, 2, 100, 3),
	(4, 3, 100, 9),
	(4, 4, 100, 3),
	(4, 5, 100, 3),
	(4, 6, 100, 5),
	(3, 1, 200, 5),
	(3, 2, 200, 5),
	(3, 3, 200, 5),
	(3, 4, 200, 5),
	(3, 5, 200, 2),
	(3, 6, 200, 5),
	(2, 1, 500, 7),
	(2, 2, 500, 5),
	(2, 3, 500, 5),
	(2, 4, 500, 5),
	(2, 5, 500, 5),
	(2, 6, 500, 5),
	(1, 1, 1000, 6),
	(1, 2, 1000, 5),
	(1, 3, 1000, 5),
	(1, 4, 1000, 3),
	(1, 5, 1000, 5),
	(1, 6, 1000, 5);
/*!40000 ALTER TABLE `amounts` ENABLE KEYS */;

-- Дамп структуры для таблица db1.cashboxes
CREATE TABLE IF NOT EXISTS `cashboxes` (
  `id` int(11) NOT NULL,
  `city` varchar(30) NOT NULL,
  `model` varchar(10) NOT NULL,
  `currency_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`),
  KEY `currency_id` (`currency_id`),
  CONSTRAINT `currency_id` FOREIGN KEY (`currency_id`) REFERENCES `currencies` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- Дамп данных таблицы db1.cashboxes: ~6 rows (приблизительно)
/*!40000 ALTER TABLE `cashboxes` DISABLE KEYS */;
INSERT INTO `cashboxes` (`id`, `city`, `model`, `currency_id`) VALUES
	(1, 'Aurora', 'model #1', 1),
	(2, 'San Piero', 'model #2', 1),
	(3, 'Latur', 'model #3', 1),
	(4, 'Comox', 'model #1', 2),
	(5, 'Burnaby', 'model #2', 3),
	(6, 'Rocca Massima', 'model #3', 5);
/*!40000 ALTER TABLE `cashboxes` ENABLE KEYS */;

-- Дамп структуры для таблица db1.currencies
CREATE TABLE IF NOT EXISTS `currencies` (
  `id` int(11) NOT NULL,
  `sign` varchar(5) NOT NULL COMMENT 'Символ валюти',
  `name` varchar(20) NOT NULL COMMENT 'Назва валюти',
  PRIMARY KEY (`id`),
  UNIQUE KEY `sign` (`sign`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- Дамп данных таблицы db1.currencies: ~5 rows (приблизительно)
/*!40000 ALTER TABLE `currencies` DISABLE KEYS */;
INSERT INTO `currencies` (`id`, `sign`, `name`) VALUES
	(1, '$', 'dollar'),
	(2, '£', 'pound sterling'),
	(3, '€', 'euro'),
	(4, '₴', 'hryvnia'),
	(5, '¥', 'yen');
/*!40000 ALTER TABLE `currencies` ENABLE KEYS */;

-- Дамп структуры для таблица db1.logs
CREATE TABLE IF NOT EXISTS `logs` (
  `id` int(11) NOT NULL,
  `account_id` int(11) NOT NULL,
  `cashbox_id` int(11) NOT NULL,
  `date` datetime NOT NULL COMMENT 'дата транзакції',
  `amount` int(11) NOT NULL COMMENT 'сума транзакції',
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`),
  KEY `account_id` (`account_id`),
  KEY `cashbox_id` (`cashbox_id`),
  CONSTRAINT `account_id` FOREIGN KEY (`account_id`) REFERENCES `accounts` (`id`),
  CONSTRAINT `cashbox_id` FOREIGN KEY (`cashbox_id`) REFERENCES `cashboxes` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='Журнал транзакцій';

-- Дамп данных таблицы db1.logs: ~16 rows (приблизительно)
/*!40000 ALTER TABLE `logs` DISABLE KEYS */;
INSERT INTO `logs` (`id`, `account_id`, `cashbox_id`, `date`, `amount`) VALUES
	(1, 1, 1, '2020-01-02 12:34:01', 50),
	(2, 2, 2, '2020-05-03 10:41:13', 120),
	(3, 2, 3, '2020-06-05 17:46:10', 85),
	(4, 3, 1, '0000-00-00 00:00:00', 125),
	(5, 4, 1, '0000-00-00 00:00:00', 500),
	(6, 5, 2, '0000-00-00 00:00:00', 115),
	(7, 5, 4, '0000-00-00 00:00:00', 625),
	(8, 1, 5, '0000-00-00 00:00:00', 800),
	(9, 1, 1, '0000-00-00 00:00:00', 50),
	(10, 2, 2, '0000-00-00 00:00:00', 120),
	(11, 2, 3, '0000-00-00 00:00:00', 85),
	(12, 3, 1, '0000-00-00 00:00:00', 125),
	(13, 4, 1, '0000-00-00 00:00:00', 500),
	(14, 5, 2, '0000-00-00 00:00:00', 115),
	(15, 5, 4, '0000-00-00 00:00:00', 625),
	(16, 1, 5, '0000-00-00 00:00:00', 800);
/*!40000 ALTER TABLE `logs` ENABLE KEYS */;

-- Дамп структуры для таблица db1.users
CREATE TABLE IF NOT EXISTS `users` (
  `id` int(11) NOT NULL,
  `name` varchar(20) NOT NULL COMMENT 'ім''я користувача',
  `age` tinyint(4) NOT NULL COMMENT 'вік користувача',
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`),
  UNIQUE KEY `id` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- Дамп данных таблицы db1.users: ~5 rows (приблизительно)
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` (`id`, `name`, `age`) VALUES
	(1, 'Reuben Sherman', 45),
	(2, 'Clayton Owens', 52),
	(3, 'Gary Schroeder', 35),
	(4, 'Connor Huber', 36),
	(5, 'Melvin Malone', 61);
/*!40000 ALTER TABLE `users` ENABLE KEYS */;

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
