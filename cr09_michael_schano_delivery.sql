-- phpMyAdmin SQL Dump
-- version 5.0.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Erstellungszeit: 13. Mrz 2020 um 18:10
-- Server-Version: 10.4.11-MariaDB
-- PHP-Version: 7.4.3

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Datenbank: `cr09_michael_schano_delivery`
--

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `customers`
--

CREATE TABLE `customers` (
  `customer_id` int(10) NOT NULL,
  `first_name` varchar(40) DEFAULT NULL,
  `last_name` varchar(40) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Daten für Tabelle `customers`
--

INSERT INTO `customers` (`customer_id`, `first_name`, `last_name`) VALUES
(1, 'Alrik', 'Alrinson'),
(2, 'Balrik', 'Balrinson'),
(3, 'Calrik', 'Calrinson');

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `dates`
--

CREATE TABLE `dates` (
  `date_id` int(10) NOT NULL,
  `send_date` datetime DEFAULT NULL,
  `delivery_date` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Daten für Tabelle `dates`
--

INSERT INTO `dates` (`date_id`, `send_date`, `delivery_date`) VALUES
(1, '2020-03-05 12:00:00', '2020-03-13 17:00:00'),
(2, '2020-02-02 09:00:00', '2020-03-05 18:00:00'),
(3, '2020-03-08 10:00:00', '2020-03-10 15:00:00');

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `employees`
--

CREATE TABLE `employees` (
  `employee_id` int(10) NOT NULL,
  `first_name` varchar(40) DEFAULT NULL,
  `last_name` varchar(40) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Daten für Tabelle `employees`
--

INSERT INTO `employees` (`employee_id`, `first_name`, `last_name`) VALUES
(1, 'Michael', 'Schano'),
(2, 'Christian', 'Schano'),
(3, 'Thomas', 'Schano');

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `employees_info`
--

CREATE TABLE `employees_info` (
  `employee_info_id` int(10) NOT NULL,
  `salary` int(6) DEFAULT NULL,
  `department` varchar(20) DEFAULT NULL,
  `fk_employee_id` int(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Daten für Tabelle `employees_info`
--

INSERT INTO `employees_info` (`employee_info_id`, `salary`, `department`, `fk_employee_id`) VALUES
(1, 200, 'Delivery', 1),
(2, 500, 'Manager', 2),
(3, 300, 'Seller', 3);

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `getter`
--

CREATE TABLE `getter` (
  `getter_id` int(10) NOT NULL,
  `fk_customer_id` int(10) DEFAULT NULL,
  `fk_mail_id` int(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Daten für Tabelle `getter`
--

INSERT INTO `getter` (`getter_id`, `fk_customer_id`, `fk_mail_id`) VALUES
(1, 1, 1),
(2, 2, 2),
(3, 3, 3);

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `locations`
--

CREATE TABLE `locations` (
  `location_id` int(10) NOT NULL,
  `street` varchar(40) DEFAULT NULL,
  `street_number` int(6) DEFAULT NULL,
  `zip_code` int(6) DEFAULT NULL,
  `city` varchar(40) DEFAULT NULL,
  `fk_customer_id` int(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Daten für Tabelle `locations`
--

INSERT INTO `locations` (`location_id`, `street`, `street_number`, `zip_code`, `city`, `fk_customer_id`) VALUES
(1, 'Astreet', 3, 1234, 'Vienna', 1),
(2, 'Bstreet', 6, 5678, 'Graz', 2),
(3, 'Cstreet', 9, 9123, 'Innsbruck', 3);

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `mail`
--

CREATE TABLE `mail` (
  `mail_id` int(10) NOT NULL,
  `weight` int(8) DEFAULT NULL,
  `fk_date_id` int(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Daten für Tabelle `mail`
--

INSERT INTO `mail` (`mail_id`, `weight`, `fk_date_id`) VALUES
(1, 25, 1),
(2, 200, 2),
(3, 75, 3);

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `payments`
--

CREATE TABLE `payments` (
  `payments_id` int(10) NOT NULL,
  `amount` int(4) DEFAULT NULL,
  `pay_date` date DEFAULT NULL,
  `fk_customer_id` int(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Daten für Tabelle `payments`
--

INSERT INTO `payments` (`payments_id`, `amount`, `pay_date`, `fk_customer_id`) VALUES
(1, 10, '2020-03-13', 1),
(2, 20, '2020-03-13', 2),
(3, 30, '2020-03-13', 3);

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `post`
--

CREATE TABLE `post` (
  `post_id` int(10) NOT NULL,
  `fk_mail_id` int(10) DEFAULT NULL,
  `fk_employee_id` int(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Daten für Tabelle `post`
--

INSERT INTO `post` (`post_id`, `fk_mail_id`, `fk_employee_id`) VALUES
(1, 1, 1),
(2, 2, 2),
(3, 3, 3);

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `transportations`
--

CREATE TABLE `transportations` (
  `transportation_id` int(10) NOT NULL,
  `fk_mail_id` int(10) DEFAULT NULL,
  `fk_customer_id` int(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Daten für Tabelle `transportations`
--

INSERT INTO `transportations` (`transportation_id`, `fk_mail_id`, `fk_customer_id`) VALUES
(1, 1, 1),
(2, 2, 2),
(3, 3, 3);

--
-- Indizes der exportierten Tabellen
--

--
-- Indizes für die Tabelle `customers`
--
ALTER TABLE `customers`
  ADD PRIMARY KEY (`customer_id`);

--
-- Indizes für die Tabelle `dates`
--
ALTER TABLE `dates`
  ADD PRIMARY KEY (`date_id`);

--
-- Indizes für die Tabelle `employees`
--
ALTER TABLE `employees`
  ADD PRIMARY KEY (`employee_id`);

--
-- Indizes für die Tabelle `employees_info`
--
ALTER TABLE `employees_info`
  ADD PRIMARY KEY (`employee_info_id`),
  ADD KEY `fk_employee_id` (`fk_employee_id`);

--
-- Indizes für die Tabelle `getter`
--
ALTER TABLE `getter`
  ADD PRIMARY KEY (`getter_id`),
  ADD KEY `fk_customer_id` (`fk_customer_id`),
  ADD KEY `fk_mail_id` (`fk_mail_id`);

--
-- Indizes für die Tabelle `locations`
--
ALTER TABLE `locations`
  ADD PRIMARY KEY (`location_id`),
  ADD KEY `fk_customer_id` (`fk_customer_id`);

--
-- Indizes für die Tabelle `mail`
--
ALTER TABLE `mail`
  ADD PRIMARY KEY (`mail_id`),
  ADD KEY `fk_date_id` (`fk_date_id`);

--
-- Indizes für die Tabelle `payments`
--
ALTER TABLE `payments`
  ADD PRIMARY KEY (`payments_id`),
  ADD KEY `fk_customer_id` (`fk_customer_id`);

--
-- Indizes für die Tabelle `post`
--
ALTER TABLE `post`
  ADD PRIMARY KEY (`post_id`),
  ADD KEY `fk_mail_id` (`fk_mail_id`),
  ADD KEY `fk_employee_id` (`fk_employee_id`);

--
-- Indizes für die Tabelle `transportations`
--
ALTER TABLE `transportations`
  ADD PRIMARY KEY (`transportation_id`),
  ADD KEY `fk_customer_id` (`fk_customer_id`),
  ADD KEY `fk_mail_id` (`fk_mail_id`);

--
-- AUTO_INCREMENT für exportierte Tabellen
--

--
-- AUTO_INCREMENT für Tabelle `customers`
--
ALTER TABLE `customers`
  MODIFY `customer_id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT für Tabelle `dates`
--
ALTER TABLE `dates`
  MODIFY `date_id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT für Tabelle `employees`
--
ALTER TABLE `employees`
  MODIFY `employee_id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT für Tabelle `employees_info`
--
ALTER TABLE `employees_info`
  MODIFY `employee_info_id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT für Tabelle `getter`
--
ALTER TABLE `getter`
  MODIFY `getter_id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT für Tabelle `locations`
--
ALTER TABLE `locations`
  MODIFY `location_id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT für Tabelle `mail`
--
ALTER TABLE `mail`
  MODIFY `mail_id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT für Tabelle `payments`
--
ALTER TABLE `payments`
  MODIFY `payments_id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT für Tabelle `post`
--
ALTER TABLE `post`
  MODIFY `post_id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT für Tabelle `transportations`
--
ALTER TABLE `transportations`
  MODIFY `transportation_id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- Constraints der exportierten Tabellen
--

--
-- Constraints der Tabelle `employees_info`
--
ALTER TABLE `employees_info`
  ADD CONSTRAINT `employees_info_ibfk_1` FOREIGN KEY (`fk_employee_id`) REFERENCES `employees` (`employee_id`);

--
-- Constraints der Tabelle `getter`
--
ALTER TABLE `getter`
  ADD CONSTRAINT `getter_ibfk_1` FOREIGN KEY (`fk_customer_id`) REFERENCES `customers` (`customer_id`),
  ADD CONSTRAINT `getter_ibfk_2` FOREIGN KEY (`fk_mail_id`) REFERENCES `mail` (`mail_id`);

--
-- Constraints der Tabelle `locations`
--
ALTER TABLE `locations`
  ADD CONSTRAINT `locations_ibfk_1` FOREIGN KEY (`fk_customer_id`) REFERENCES `customers` (`customer_id`);

--
-- Constraints der Tabelle `mail`
--
ALTER TABLE `mail`
  ADD CONSTRAINT `mail_ibfk_1` FOREIGN KEY (`fk_date_id`) REFERENCES `dates` (`date_id`);

--
-- Constraints der Tabelle `payments`
--
ALTER TABLE `payments`
  ADD CONSTRAINT `payments_ibfk_1` FOREIGN KEY (`fk_customer_id`) REFERENCES `customers` (`customer_id`);

--
-- Constraints der Tabelle `post`
--
ALTER TABLE `post`
  ADD CONSTRAINT `post_ibfk_1` FOREIGN KEY (`fk_mail_id`) REFERENCES `mail` (`mail_id`),
  ADD CONSTRAINT `post_ibfk_2` FOREIGN KEY (`fk_employee_id`) REFERENCES `employees` (`employee_id`);

--
-- Constraints der Tabelle `transportations`
--
ALTER TABLE `transportations`
  ADD CONSTRAINT `transportations_ibfk_1` FOREIGN KEY (`fk_customer_id`) REFERENCES `customers` (`customer_id`),
  ADD CONSTRAINT `transportations_ibfk_2` FOREIGN KEY (`fk_mail_id`) REFERENCES `mail` (`mail_id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
