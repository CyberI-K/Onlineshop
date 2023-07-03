-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Erstellungszeit: 07. Jun 2021 um 18:38
-- Server-Version: 10.4.11-MariaDB
-- PHP-Version: 7.4.6
SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";
--
613
-- Datenbank: `db_shop`
--
-- --------------------------------------------------------
--
-- Tabellenstruktur für Tabelle `tbl_kunden`
--
CREATE TABLE `tbl_kunden` (
 `IDKunde` int(10) UNSIGNED NOT NULL,
 `Emailadresse` varchar(128) NOT NULL,
 `Passwort` varchar(255) NOT NULL,
 `Vorname` varchar(64) NOT NULL,
 `Nachname` varchar(64) NOT NULL,
 `Adresse` varchar(64) NOT NULL,
 `PLZ` varchar(8) NOT NULL,
 `Ort` varchar(64) NOT NULL,
 `FIDStaat` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
--
-- Daten für Tabelle `tbl_kunden`
--
INSERT INTO `tbl_kunden` (`IDKunde`, `Emailadresse`, `Passwort`, `Vorname`,
`Nachname`, `Adresse`, `PLZ`, `Ort`, `FIDStaat`) VALUES
(1, 'uwe.mutz@syne.at', 'test123', 'Uwe', 'Mutz', 'Teststr. 1', '1234', 'TestortA',
1),
(2, 'silvia.mutz@syne.at', 'test456', 'Silvia', 'Mutz', 'Teststr. 1', '1234',
'TestortA', 1),
(3, 'roland.aichberger@test.at', 'test789', 'Roland', 'Aichberger', 'Teststr. 2',
'2345', 'TestortB', 2);
-- --------------------------------------------------------
--
-- Tabellenstruktur für Tabelle `tbl_produkte`
--
CREATE TABLE `tbl_produkte` (
 `IDProdukt` int(10) UNSIGNED NOT NULL,
 `Titel` varchar(128) NOT NULL,
614
 `Beschreibung` text DEFAULT NULL,
 `Preis` decimal(8,2) UNSIGNED NOT NULL,
 `Verfuegbarkeit` tinyint(1) UNSIGNED NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
--
-- Daten für Tabelle `tbl_produkte`
--
INSERT INTO `tbl_produkte` (`IDProdukt`, `Titel`, `Beschreibung`, `Preis`,
`Verfuegbarkeit`) VALUES
(1, 'iPhone 12', 'Das iPhone der zwölften Generation', '1299.00', 1),
(2, 'iPhone 12 MAX', 'Das iPhone der zwölften Generation mit größerem Bildschirm',
'1499.00', 1),
(3, 'iPad Pro 12.9', 'Das iPad mit großem Display', '1399.00', 1),
(4, 'iPad Air', 'Das leichte iPad', '899.00', 0),
(5, 'iPad Mini', 'Das kleine iPad', '599.00', 1);
-- --------------------------------------------------------
--
-- Tabellenstruktur für Tabelle `tbl_staaten`
--
CREATE TABLE `tbl_staaten` (
 `IDStaat` int(10) UNSIGNED NOT NULL,
 `Bezeichnung` varchar(64) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
--
-- Daten für Tabelle `tbl_staaten`
--
INSERT INTO `tbl_staaten` (`IDStaat`, `Bezeichnung`) VALUES
(3, 'Italien'),
(1, 'Österreich'),
(4, 'Schottland'),
(2, 'Spanien');
-- --------------------------------------------------------
--
-- Tabellenstruktur für Tabelle `tbl_verkauf`
615
--
CREATE TABLE `tbl_verkauf` (
 `IDVerkauf` int(10) UNSIGNED NOT NULL,
 `FIDKunde` int(10) UNSIGNED DEFAULT NULL,
 `FIDProdukt` int(10) UNSIGNED DEFAULT NULL,
 `Anzahl` smallint(5) UNSIGNED NOT NULL,
 `Titel` varchar(128) NOT NULL,
 `Preis` double(8,2) NOT NULL,
 `Zeitpunkt` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE
current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
--
-- Daten für Tabelle `tbl_verkauf`
--
INSERT INTO `tbl_verkauf` (`IDVerkauf`, `FIDKunde`, `FIDProdukt`, `Anzahl`, `Titel`,
`Preis`, `Zeitpunkt`) VALUES
(1, 1, 1, 2, 'iPhone 12', 1299.00, '2021-06-07 16:37:51'),
(2, 1, 2, 3, 'iPhone 12 MAX', 1499.00, '2021-06-07 16:37:51'),
(3, 2, 5, 5, 'iPad Mini', 498.00, '2021-06-07 16:37:51'),
(4, NULL, NULL, 5, 'iPhone 7', 699.00, '2021-06-07 16:38:08');
-- --------------------------------------------------------
--
-- Tabellenstruktur für Tabelle `tbl_warenkorb`
--
CREATE TABLE `tbl_warenkorb` (
 `IDWarenkorb` int(10) UNSIGNED NOT NULL,
 `FIDKunde` int(10) UNSIGNED DEFAULT NULL,
 `FIDProdukt` int(10) UNSIGNED NOT NULL,
 `Anzahl` smallint(5) UNSIGNED NOT NULL,
 `Zeitpunkt` timestamp NOT NULL DEFAULT current_timestamp(),
 `SID` varchar(32) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
--
-- Indizes der exportierten Tabellen
--
616
--
-- Indizes für die Tabelle `tbl_kunden`
--
ALTER TABLE `tbl_kunden`
 ADD PRIMARY KEY (`IDKunde`),
 ADD UNIQUE KEY `Emailadresse` (`Emailadresse`),
 ADD KEY `FIDStaat` (`FIDStaat`);
--
-- Indizes für die Tabelle `tbl_produkte`
--
ALTER TABLE `tbl_produkte`
 ADD PRIMARY KEY (`IDProdukt`);
--
-- Indizes für die Tabelle `tbl_staaten`
--
ALTER TABLE `tbl_staaten`
 ADD PRIMARY KEY (`IDStaat`),
 ADD UNIQUE KEY `Bezeichnung` (`Bezeichnung`);
--
-- Indizes für die Tabelle `tbl_verkauf`
--
ALTER TABLE `tbl_verkauf`
 ADD PRIMARY KEY (`IDVerkauf`),
 ADD KEY `FIDKunde` (`FIDKunde`),
 ADD KEY `FIDProdukt` (`FIDProdukt`);
--
-- Indizes für die Tabelle `tbl_warenkorb`
--
ALTER TABLE `tbl_warenkorb`
 ADD PRIMARY KEY (`IDWarenkorb`),
 ADD KEY `FIDKunde` (`FIDKunde`),
 ADD KEY `FIDProdukt` (`FIDProdukt`);
--
-- AUTO_INCREMENT für exportierte Tabellen
--
--
-- AUTO_INCREMENT für Tabelle `tbl_kunden`
617
--
ALTER TABLE `tbl_kunden`
 MODIFY `IDKunde` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT für Tabelle `tbl_produkte`
--
ALTER TABLE `tbl_produkte`
 MODIFY `IDProdukt` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;
--
-- AUTO_INCREMENT für Tabelle `tbl_staaten`
--
ALTER TABLE `tbl_staaten`
 MODIFY `IDStaat` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
--
-- AUTO_INCREMENT für Tabelle `tbl_verkauf`
--
ALTER TABLE `tbl_verkauf`
 MODIFY `IDVerkauf` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
--
-- AUTO_INCREMENT für Tabelle `tbl_warenkorb`
--
ALTER TABLE `tbl_warenkorb`
 MODIFY `IDWarenkorb` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- Constraints der exportierten Tabellen
--
--
-- Constraints der Tabelle `tbl_kunden`
--
ALTER TABLE `tbl_kunden`
 ADD CONSTRAINT `tbl_kunden_ibfk_1` FOREIGN KEY (`FIDStaat`) REFERENCES
`tbl_staaten` (`IDStaat`) ON UPDATE CASCADE;
--
-- Constraints der Tabelle `tbl_verkauf`
--
ALTER TABLE `tbl_verkauf`
618
 ADD CONSTRAINT `tbl_verkauf_ibfk_1` FOREIGN KEY (`FIDKunde`) REFERENCES
`tbl_kunden` (`IDKunde`) ON DELETE SET NULL ON UPDATE SET NULL,
 ADD CONSTRAINT `tbl_verkauf_ibfk_2` FOREIGN KEY (`FIDProdukt`) REFERENCES
`tbl_produkte` (`IDProdukt`) ON DELETE SET NULL ON UPDATE SET NULL;
--
-- Constraints der Tabelle `tbl_warenkorb`
--
ALTER TABLE `tbl_warenkorb`
 ADD CONSTRAINT `tbl_warenkorb_ibfk_1` FOREIGN KEY (`FIDKunde`) REFERENCES
`tbl_kunden` (`IDKunde`) ON DELETE CASCADE ON UPDATE CASCADE,
 ADD CONSTRAINT `tbl_warenkorb_ibfk_2` FOREIGN KEY (`FIDProdukt`) REFERENCES
`tbl_produkte` (`IDProdukt`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;
