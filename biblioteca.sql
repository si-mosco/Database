-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Creato il: Ott 17, 2023 alle 17:28
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
-- Database: `biblioteca`
--

-- --------------------------------------------------------

--
-- Struttura della tabella `autori`
--

CREATE TABLE `autori` (
  `id` int(11) NOT NULL,
  `nome` varchar(15) NOT NULL,
  `cognome` varchar(20) NOT NULL,
  `data_nascita` date NOT NULL,
  `data_morte` date NOT NULL,
  `genere_letterario` varchar(15) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dump dei dati per la tabella `autori`
--

INSERT INTO `autori` (`id`, `nome`, `cognome`, `data_nascita`, `data_morte`, `genere_letterario`) VALUES
(1, 'Giacomo', 'Leopardi', '1798-07-06', '1837-06-14', 'Romanticismo'),
(2, 'Ugo', 'Foscolo', '1778-02-06', '1827-09-10', 'Neoclassicismo'),
(3, 'Giovanni', 'Boccaccio', '1313-02-19', '1375-12-21', 'Novella'),
(4, 'Giovanni', 'Pascoli', '1885-12-31', '1912-04-06', 'Decadentismo');

-- --------------------------------------------------------

--
-- Struttura della tabella `autori/libri`
--

CREATE TABLE `autori/libri` (
  `id` int(11) NOT NULL,
  `id_libro` int(11) NOT NULL,
  `id_autore` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dump dei dati per la tabella `autori/libri`
--

INSERT INTO `autori/libri` (`id`, `id_libro`, `id_autore`) VALUES
(1, 2, 1),
(2, 1, 2),
(3, 3, 3),
(4, 4, 4);

-- --------------------------------------------------------

--
-- Struttura della tabella `categorie`
--

CREATE TABLE `categorie` (
  `id` int(11) NOT NULL,
  `età_consigliata` int(11) NOT NULL,
  `genere` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dump dei dati per la tabella `categorie`
--

INSERT INTO `categorie` (`id`, `età_consigliata`, `genere`) VALUES
(0, 3, 'Fiabe'),
(1, 5, 'Poesia');

-- --------------------------------------------------------

--
-- Struttura della tabella `libri`
--

CREATE TABLE `libri` (
  `id` int(11) NOT NULL,
  `titolo` varchar(50) NOT NULL,
  `isbn` varchar(13) NOT NULL,
  `categoria` int(11) NOT NULL,
  `sede` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dump dei dati per la tabella `libri`
--

INSERT INTO `libri` (`id`, `titolo`, `isbn`, `categoria`, `sede`) VALUES
(1, 'Decameron', '1234567890', 0, 1),
(2, 'Infinito', '2345678901', 1, 0),
(3, 'A Zacinto', '3456789012', 1, 1),
(4, 'Il fanciullino', '4567890123', 1, 0);

-- --------------------------------------------------------

--
-- Struttura della tabella `sedi`
--

CREATE TABLE `sedi` (
  `id` int(11) NOT NULL,
  `nome` varchar(15) NOT NULL,
  `indirizzo` varchar(30) NOT NULL,
  `coordinate` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dump dei dati per la tabella `sedi`
--

INSERT INTO `sedi` (`id`, `nome`, `indirizzo`, `coordinate`) VALUES
(0, 'Guglielmi', 'via Rimembranze', '60.94684 121.03464'),
(1, 'Damiani', 'via mons. Signori', '10.23998 125.18755');

-- --------------------------------------------------------

--
-- Struttura della tabella `utenti`
--

CREATE TABLE `utenti` (
  `id` int(11) NOT NULL,
  `nome` varchar(15) NOT NULL,
  `cognome` varchar(20) NOT NULL,
  `email` varchar(30) NOT NULL,
  `indirizzo` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dump dei dati per la tabella `utenti`
--

INSERT INTO `utenti` (`id`, `nome`, `cognome`, `email`, `indirizzo`) VALUES
(1, 'Simone', 'Mosconi', 'simone@gmail.com', 'via dalle palle'),
(2, 'Marco', 'Borelli', 'marco@gmail.com', 'via le mani dal naso'),
(3, 'Nicola', 'Ghilardi', 'nicola@gmail.com', 'viale benito'),
(4, 'Alessandro', 'Colombi', 'alessandro@gmail.com', 'piazza pazza');

-- --------------------------------------------------------

--
-- Struttura della tabella `utenti/libri`
--

CREATE TABLE `utenti/libri` (
  `id` int(11) NOT NULL,
  `id_utente` int(11) NOT NULL,
  `id_libro` int(11) NOT NULL,
  `data_prestito` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dump dei dati per la tabella `utenti/libri`
--

INSERT INTO `utenti/libri` (`id`, `id_utente`, `id_libro`, `data_prestito`) VALUES
(1, 1, 1, '2023-10-03'),
(2, 2, 2, '2023-10-02'),
(3, 3, 3, '2023-10-01'),
(4, 4, 4, '2023-10-01');

--
-- Indici per le tabelle scaricate
--

--
-- Indici per le tabelle `autori`
--
ALTER TABLE `autori`
  ADD PRIMARY KEY (`id`);

--
-- Indici per le tabelle `autori/libri`
--
ALTER TABLE `autori/libri`
  ADD PRIMARY KEY (`id`),
  ADD KEY `rifer_autore` (`id_autore`),
  ADD KEY `rifer_libro` (`id_libro`);

--
-- Indici per le tabelle `categorie`
--
ALTER TABLE `categorie`
  ADD PRIMARY KEY (`id`);

--
-- Indici per le tabelle `libri`
--
ALTER TABLE `libri`
  ADD PRIMARY KEY (`id`),
  ADD KEY `rif_categoria` (`categoria`),
  ADD KEY `rif_sede` (`sede`);

--
-- Indici per le tabelle `sedi`
--
ALTER TABLE `sedi`
  ADD PRIMARY KEY (`id`);

--
-- Indici per le tabelle `utenti`
--
ALTER TABLE `utenti`
  ADD PRIMARY KEY (`id`);

--
-- Indici per le tabelle `utenti/libri`
--
ALTER TABLE `utenti/libri`
  ADD PRIMARY KEY (`id`),
  ADD KEY `rif_utente` (`id_utente`),
  ADD KEY `rif_libro` (`id_libro`);

--
-- AUTO_INCREMENT per le tabelle scaricate
--

--
-- AUTO_INCREMENT per la tabella `autori`
--
ALTER TABLE `autori`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT per la tabella `autori/libri`
--
ALTER TABLE `autori/libri`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT per la tabella `categorie`
--
ALTER TABLE `categorie`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT per la tabella `libri`
--
ALTER TABLE `libri`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT per la tabella `sedi`
--
ALTER TABLE `sedi`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT per la tabella `utenti`
--
ALTER TABLE `utenti`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT per la tabella `utenti/libri`
--
ALTER TABLE `utenti/libri`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- Limiti per le tabelle scaricate
--

--
-- Limiti per la tabella `autori/libri`
--
ALTER TABLE `autori/libri`
  ADD CONSTRAINT `rifer_autore` FOREIGN KEY (`id_autore`) REFERENCES `autori` (`id`),
  ADD CONSTRAINT `rifer_libro` FOREIGN KEY (`id_libro`) REFERENCES `libri` (`id`);

--
-- Limiti per la tabella `libri`
--
ALTER TABLE `libri`
  ADD CONSTRAINT `rif_categoria` FOREIGN KEY (`categoria`) REFERENCES `categorie` (`id`),
  ADD CONSTRAINT `rif_sede` FOREIGN KEY (`sede`) REFERENCES `sedi` (`id`);

--
-- Limiti per la tabella `utenti/libri`
--
ALTER TABLE `utenti/libri`
  ADD CONSTRAINT `rif_libro` FOREIGN KEY (`id_libro`) REFERENCES `libri` (`id`),
  ADD CONSTRAINT `rif_utente` FOREIGN KEY (`id_utente`) REFERENCES `utenti` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
