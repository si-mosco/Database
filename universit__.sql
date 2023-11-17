-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Creato il: Nov 17, 2023 alle 11:51
-- Versione del server: 10.4.28-MariaDB
-- Versione PHP: 8.2.4

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `università`
--

-- --------------------------------------------------------

--
-- Struttura della tabella `iscrizioni`
--

CREATE TABLE `iscrizioni` (
  `id` int(11) NOT NULL,
  `Id_studente` int(11) NOT NULL,
  `denominazione_università` varchar(30) NOT NULL,
  `data_inizio` date NOT NULL,
  `data_fine` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dump dei dati per la tabella `iscrizioni`
--

INSERT INTO `iscrizioni` (`id`, `Id_studente`, `denominazione_università`, `data_inizio`, `data_fine`) VALUES
(1, 0, 'Politecnico di Milano', '2023-10-01', '2023-10-31'),
(2, 0, 'Università Bicocca', '2023-11-01', NULL),
(3, 1, 'Università Bicocca', '2023-10-01', NULL),
(4, 2, 'Università di Milano', '2023-10-01', NULL);

-- --------------------------------------------------------

--
-- Struttura della tabella `studenti`
--

CREATE TABLE `studenti` (
  `Id` int(11) NOT NULL,
  `Cognome` varchar(20) NOT NULL,
  `Nome` varchar(30) NOT NULL,
  `Indirizzo` varchar(50) DEFAULT NULL,
  `Città` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dump dei dati per la tabella `studenti`
--

INSERT INTO `studenti` (`Id`, `Cognome`, `Nome`, `Indirizzo`, `Città`) VALUES
(0, 'Borelli', 'Alessandro', NULL, 'Sorisole'),
(1, 'Ferrari', 'Gioele', NULL, 'Cologno al Serio'),
(2, 'Manca', 'Antonio', NULL, 'Calcio');

-- --------------------------------------------------------

--
-- Struttura della tabella `universita`
--

CREATE TABLE `universita` (
  `Denominazione` varchar(30) NOT NULL,
  `Indirizzo` varchar(50) DEFAULT NULL,
  `Città` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dump dei dati per la tabella `universita`
--

INSERT INTO `universita` (`Denominazione`, `Indirizzo`, `Città`) VALUES
('Politecnico di Milano', NULL, 'Milano'),
('Università Bicocca', NULL, 'Milano'),
('Università di Milano', NULL, 'Milano');

--
-- Indici per le tabelle scaricate
--

--
-- Indici per le tabelle `iscrizioni`
--
ALTER TABLE `iscrizioni`
  ADD PRIMARY KEY (`id`),
  ADD KEY `rif_studente1` (`Id_studente`),
  ADD KEY `rif_università1` (`denominazione_università`);

--
-- Indici per le tabelle `studenti`
--
ALTER TABLE `studenti`
  ADD PRIMARY KEY (`Id`);

--
-- Indici per le tabelle `universita`
--
ALTER TABLE `universita`
  ADD PRIMARY KEY (`Denominazione`);

--
-- AUTO_INCREMENT per le tabelle scaricate
--

--
-- AUTO_INCREMENT per la tabella `iscrizioni`
--
ALTER TABLE `iscrizioni`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- Limiti per le tabelle scaricate
--

--
-- Limiti per la tabella `iscrizioni`
--
ALTER TABLE `iscrizioni`
  ADD CONSTRAINT `rif_studente1` FOREIGN KEY (`Id_studente`) REFERENCES `studenti` (`Id`) ON UPDATE CASCADE,
  ADD CONSTRAINT `rif_università1` FOREIGN KEY (`denominazione_università`) REFERENCES `universita` (`Denominazione`) ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
