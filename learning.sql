-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Creato il: Ott 27, 2023 alle 10:21
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
-- Database: `learning`
--

-- --------------------------------------------------------

--
-- Struttura della tabella `classe_gioco`
--

CREATE TABLE `classe_gioco` (
  `id` int(11) NOT NULL,
  `id_classe` int(11) NOT NULL,
  `id_gioco` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dump dei dati per la tabella `classe_gioco`
--

INSERT INTO `classe_gioco` (`id`, `id_classe`, `id_gioco`) VALUES
(1, 1, 1),
(2, 2, 2),
(3, 3, 3);

-- --------------------------------------------------------

--
-- Struttura della tabella `classi_vituali`
--

CREATE TABLE `classi_vituali` (
  `Id` int(11) NOT NULL,
  `Classe` varchar(10) NOT NULL,
  `Materia` varchar(15) NOT NULL,
  `Annualità` varchar(15) NOT NULL,
  `Link` varchar(2000) NOT NULL,
  `Docente_Creatore` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dump dei dati per la tabella `classi_vituali`
--

INSERT INTO `classi_vituali` (`Id`, `Classe`, `Materia`, `Annualità`, `Link`, `Docente_Creatore`) VALUES
(1, '5', 'Matematica', '2022', 'wikipedia.com', 1),
(2, '4', 'Italiano', '2023', 'koala.it', 2),
(3, '3', 'Sistemi', '2021', 'olProfesur.bg', 3);

-- --------------------------------------------------------

--
-- Struttura della tabella `docenti`
--

CREATE TABLE `docenti` (
  `Id` int(11) NOT NULL,
  `Nome` varchar(15) NOT NULL,
  `Cognome` varchar(15) NOT NULL,
  `Mail` varchar(2000) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dump dei dati per la tabella `docenti`
--

INSERT INTO `docenti` (`Id`, `Nome`, `Cognome`, `Mail`) VALUES
(1, 'Antonina', 'Indelicato', 'antonina.indelicato@gmail.com'),
(2, 'Nicola', 'Pinto', 'nicola.pinto@gmail.com'),
(3, 'Marco', 'Crobu', 'marco.crobu@gmail.com');

-- --------------------------------------------------------

--
-- Struttura della tabella `studente_classe`
--

CREATE TABLE `studente_classe` (
  `id` int(11) NOT NULL,
  `ora` date NOT NULL,
  `id_studente` int(11) NOT NULL,
  `id_classe` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dump dei dati per la tabella `studente_classe`
--

INSERT INTO `studente_classe` (`id`, `ora`, `id_studente`, `id_classe`) VALUES
(1, '2023-10-01', 1, 1),
(2, '2023-10-03', 2, 2),
(3, '2023-10-08', 3, 3);

-- --------------------------------------------------------

--
-- Struttura della tabella `studente_classe_gioco`
--

CREATE TABLE `studente_classe_gioco` (
  `id` int(11) NOT NULL,
  `ora` date NOT NULL,
  `monete` int(11) NOT NULL,
  `id_studente` int(11) NOT NULL,
  `id_classe` int(11) NOT NULL,
  `id_gioco` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dump dei dati per la tabella `studente_classe_gioco`
--

INSERT INTO `studente_classe_gioco` (`id`, `ora`, `monete`, `id_studente`, `id_classe`, `id_gioco`) VALUES
(1, '2023-10-04', 10, 1, 1, 1),
(2, '2023-10-05', 15, 2, 2, 2),
(3, '2023-10-06', 20, 3, 3, 3);

-- --------------------------------------------------------

--
-- Struttura della tabella `studenti`
--

CREATE TABLE `studenti` (
  `Id` int(11) NOT NULL,
  `Nome` varchar(15) NOT NULL,
  `Cognome` varchar(15) NOT NULL,
  `Mail` varchar(2000) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dump dei dati per la tabella `studenti`
--

INSERT INTO `studenti` (`Id`, `Nome`, `Cognome`, `Mail`) VALUES
(1, 'Simone', 'Mosconi', 'simone.mosconi@gmil.com'),
(2, 'Marco', 'Borelli', 'marco.borelli@gmail.com'),
(3, 'Nicola', 'Ghilardi', 'nicola.ghilardi@gmail.com');

-- --------------------------------------------------------

--
-- Struttura della tabella `videogiochi`
--

CREATE TABLE `videogiochi` (
  `Id` int(11) NOT NULL,
  `Titolo` varchar(20) NOT NULL,
  `Descrizione_breve` varchar(30) NOT NULL,
  `Descrizione_lunga` varchar(60) NOT NULL,
  `Categoria` varchar(20) NOT NULL,
  `Max_monete` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dump dei dati per la tabella `videogiochi`
--

INSERT INTO `videogiochi` (`Id`, `Titolo`, `Descrizione_breve`, `Descrizione_lunga`, `Categoria`, `Max_monete`) VALUES
(1, 'Minecraft', 'Bel gioco', 'Molto bel gioco', 'SandBox', 1000),
(2, 'Super Mario Sunshine', 'Gioco ultra bello', 'Gioco ultra bello con splac3000', 'Bambini', 120),
(3, 'Burnout drift', 'Sgommate', 'Sgommate con macchine di lusso', 'Macchine', 500);

--
-- Indici per le tabelle scaricate
--

--
-- Indici per le tabelle `classe_gioco`
--
ALTER TABLE `classe_gioco`
  ADD PRIMARY KEY (`id`),
  ADD KEY `rif_classe2` (`id_classe`),
  ADD KEY `rif_gioco2` (`id_gioco`);

--
-- Indici per le tabelle `classi_vituali`
--
ALTER TABLE `classi_vituali`
  ADD PRIMARY KEY (`Id`),
  ADD KEY `creare` (`Docente_Creatore`);

--
-- Indici per le tabelle `docenti`
--
ALTER TABLE `docenti`
  ADD PRIMARY KEY (`Id`);

--
-- Indici per le tabelle `studente_classe`
--
ALTER TABLE `studente_classe`
  ADD PRIMARY KEY (`id`),
  ADD KEY `rif_studente1` (`id_studente`),
  ADD KEY `rif_classe1` (`id_classe`);

--
-- Indici per le tabelle `studente_classe_gioco`
--
ALTER TABLE `studente_classe_gioco`
  ADD PRIMARY KEY (`id`),
  ADD KEY `rif_studente3` (`id_studente`),
  ADD KEY `rif_classe3` (`id_classe`),
  ADD KEY `rif_gioco3` (`id_gioco`);

--
-- Indici per le tabelle `studenti`
--
ALTER TABLE `studenti`
  ADD PRIMARY KEY (`Id`);

--
-- Indici per le tabelle `videogiochi`
--
ALTER TABLE `videogiochi`
  ADD PRIMARY KEY (`Id`);

--
-- AUTO_INCREMENT per le tabelle scaricate
--

--
-- AUTO_INCREMENT per la tabella `classe_gioco`
--
ALTER TABLE `classe_gioco`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT per la tabella `classi_vituali`
--
ALTER TABLE `classi_vituali`
  MODIFY `Id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT per la tabella `docenti`
--
ALTER TABLE `docenti`
  MODIFY `Id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT per la tabella `studente_classe`
--
ALTER TABLE `studente_classe`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT per la tabella `studente_classe_gioco`
--
ALTER TABLE `studente_classe_gioco`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT per la tabella `studenti`
--
ALTER TABLE `studenti`
  MODIFY `Id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT per la tabella `videogiochi`
--
ALTER TABLE `videogiochi`
  MODIFY `Id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- Limiti per le tabelle scaricate
--

--
-- Limiti per la tabella `classe_gioco`
--
ALTER TABLE `classe_gioco`
  ADD CONSTRAINT `rif_classe2` FOREIGN KEY (`id_classe`) REFERENCES `classi_vituali` (`Id`),
  ADD CONSTRAINT `rif_gioco2` FOREIGN KEY (`id_gioco`) REFERENCES `videogiochi` (`Id`);

--
-- Limiti per la tabella `classi_vituali`
--
ALTER TABLE `classi_vituali`
  ADD CONSTRAINT `creare` FOREIGN KEY (`Docente_Creatore`) REFERENCES `docenti` (`Id`);

--
-- Limiti per la tabella `studente_classe`
--
ALTER TABLE `studente_classe`
  ADD CONSTRAINT `rif_classe1` FOREIGN KEY (`id_classe`) REFERENCES `classi_vituali` (`Id`),
  ADD CONSTRAINT `rif_studente1` FOREIGN KEY (`id_studente`) REFERENCES `studenti` (`Id`);

--
-- Limiti per la tabella `studente_classe_gioco`
--
ALTER TABLE `studente_classe_gioco`
  ADD CONSTRAINT `rif_classe3` FOREIGN KEY (`id_classe`) REFERENCES `classi_vituali` (`Id`),
  ADD CONSTRAINT `rif_gioco3` FOREIGN KEY (`id_gioco`) REFERENCES `videogiochi` (`Id`),
  ADD CONSTRAINT `rif_studente3` FOREIGN KEY (`id_studente`) REFERENCES `studenti` (`Id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
