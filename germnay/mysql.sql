-- MySQL dump for German cities and states
SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";

--
-- Table structure for table `provinces` (Bundesländer)
--

CREATE TABLE `provinces` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) DEFAULT NULL,
  `tel_prefix` varchar(3) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `ix_provinces_id` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `provinces`
--

INSERT INTO `provinces` (`id`, `name`, `tel_prefix`) VALUES
(1, 'Baden-Württemberg', '071'),
(2, 'Bayern', '089'),
(3, 'Berlin', '030'),
(4, 'Brandenburg', '033'),
(5, 'Bremen', '042'),
(6, 'Hamburg', '040'),
(7, 'Hessen', '069'),
(8, 'Mecklenburg-Vorpommern', '038'),
(9, 'Niedersachsen', '051'),
(10, 'Nordrhein-Westfalen', '021'),
(11, 'Rheinland-Pfalz', '061'),
(12, 'Saarland', '068'),
(13, 'Sachsen', '034'),
(14, 'Sachsen-Anhalt', '039'),
(15, 'Schleswig-Holstein', '043'),
(16, 'Thüringen', '036');

--
-- Table structure for table `cities`
--

CREATE TABLE `cities` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) DEFAULT NULL,
  `province_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `province_id` (`province_id`),
  KEY `ix_cities_id` (`id`),
  CONSTRAINT `cities_ibfk_1` FOREIGN KEY (`province_id`) REFERENCES `provinces` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `cities`
--

INSERT INTO `cities` (`id`, `name`, `province_id`) VALUES
-- Baden-Württemberg
(1, 'Stuttgart', 1),
(2, 'Karlsruhe', 1),
(3, 'Mannheim', 1),
(4, 'Freiburg', 1),
(5, 'Heidelberg', 1),
(6, 'Ulm', 1),
(7, 'Heilbronn', 1),
(8, 'Pforzheim', 1),

-- Bayern
(9, 'München', 2),
(10, 'Nürnberg', 2),
(11, 'Augsburg', 2),
(12, 'Regensburg', 2),
(13, 'Würzburg', 2),
(14, 'Ingolstadt', 2),
(15, 'Fürth', 2),
(16, 'Erlangen', 2),

-- Berlin
(17, 'Berlin', 3),

-- Brandenburg
(18, 'Potsdam', 4),
(19, 'Cottbus', 4),
(20, 'Brandenburg an der Havel', 4),
(21, 'Frankfurt (Oder)', 4),

-- Bremen
(22, 'Bremen', 5),
(23, 'Bremerhaven', 5),

-- Hamburg
(24, 'Hamburg', 6),

-- Hessen
(25, 'Frankfurt am Main', 7),
(26, 'Wiesbaden', 7),
(27, 'Kassel', 7),
(28, 'Darmstadt', 7),
(29, 'Offenbach am Main', 7),
(30, 'Hanau', 7),
(31, 'Marburg', 7),
(32, 'Gießen', 7),

-- Mecklenburg-Vorpommern
(33, 'Rostock', 8),
(34, 'Schwerin', 8),
(35, 'Neubrandenburg', 8),
(36, 'Stralsund', 8),
(37, 'Greifswald', 8),

-- Niedersachsen
(38, 'Hannover', 9),
(39, 'Braunschweig', 9),
(40, 'Osnabrück', 9),
(41, 'Oldenburg', 9),
(42, 'Wolfsburg', 9),
(43, 'Göttingen', 9),

-- Nordrhein-Westfalen
(44, 'Köln', 10),
(45, 'Düsseldorf', 10),
(46, 'Dortmund', 10),
(47, 'Essen', 10),
(48, 'Duisburg', 10),
(49, 'Bochum', 10),
(50, 'Wuppertal', 10),
(51, 'Bielefeld', 10),
(52, 'Bonn', 10),
(53, 'Münster', 10),

-- Rheinland-Pfalz
(54, 'Mainz', 11),
(55, 'Ludwigshafen', 11),
(56, 'Koblenz', 11),
(57, 'Trier', 11),
(58, 'Kaiserslautern', 11),

-- Saarland
(59, 'Saarbrücken', 12),
(60, 'Neunkirchen', 12),
(61, 'Homburg', 12),

-- Sachsen
(62, 'Dresden', 13),
(63, 'Leipzig', 13),
(64, 'Chemnitz', 13),
(65, 'Zwickau', 13),

-- Sachsen-Anhalt
(66, 'Magdeburg', 14),
(67, 'Halle (Saale)', 14),
(68, 'Dessau-Roßlau', 14),

-- Schleswig-Holstein
(69, 'Kiel', 15),
(70, 'Lübeck', 15),
(71, 'Flensburg', 15),
(72, 'Neumünster', 15),

-- Thüringen
(73, 'Erfurt', 16),
(74, 'Jena', 16),
(75, 'Gera', 16),
(76, 'Weimar', 16);

-- Add foreign key constraint
ALTER TABLE `cities`
  ADD CONSTRAINT `cities_province_fk` FOREIGN KEY (`province_id`) REFERENCES `provinces` (`id`);

COMMIT;
