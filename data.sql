-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Hôte : 127.0.0.1
-- Généré le : mer. 26 fév. 2025 à 10:08
-- Version du serveur : 10.4.32-MariaDB
-- Version de PHP : 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données : `euroexpress`
--

-- --------------------------------------------------------

--
-- Structure de la table `classe`
--

CREATE TABLE `classe` (
  `id` int(11) NOT NULL,
  `nomClasse` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `augmentation` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `classe`
--

INSERT INTO `classe` (`id`, `nomClasse`, `augmentation`) VALUES
(1, 'Eco', 0),
(2, 'Premium', 25),
(3, 'Business', 50);

-- --------------------------------------------------------

--
-- Structure de la table `destinations`
--

CREATE TABLE `destinations` (
  `id` int(255) NOT NULL,
  `ville` varchar(100) NOT NULL,
  `prix` decimal(65,2) NOT NULL,
  `heuredep` time NOT NULL,
  `description` longtext NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `destinations`
--

INSERT INTO `destinations` (`id`, `ville`, `prix`, `heuredep`, `description`) VALUES
(1, 'Barcelone\r\n', 120.50, '18:30:00', 'Le train pour Barcelone est un voyage confortable à travers les paysages magnifiques du sud de la France avant d\'atteindre la vibrante capitale catalane. Ce service offre des sièges spacieux, une connexion Wi-Fi gratuite et un service de restauration à bord.\r\n'),
(2, 'Copenhague\r\n', 150.75, '20:45:00', 'Le train pour Copenhague vous emmène vers la capitale danoise en traversant des paysages spectaculaires et des ponts impressionnants comme le célèbre pont de l’Øresund. Avec des installations modernes et un espace de travail pour les professionnels, ce voyage est idéal pour allier confort et efficacité.\r\n'),
(3, 'Londres\r\n', 187.55, '07:30:00', 'Londres est accessible via un trajet rapide et direct. Ce train à grande vitesse traverse la Manche via le tunnel sous la mer, garantissant une arrivée rapide en plein cœur de la capitale britannique. Avec des sièges inclinables et un service de restauration, le voyage est aussi plaisant qu’efficace.\r\n'),
(4, 'Naples\r\n', 135.25, '09:25:00', 'Voyagez vers Naples en traversant les paysages pittoresques d’Italie. Ce train offre des cabines confortables et un service de restauration inspiré de la cuisine italienne. Idéal pour ceux qui veulent découvrir la richesse historique et gastronomique du sud de l’Italie.\r\n'),
(5, 'Berlin\r\n', 110.60, '15:50:00', 'Le train pour Berlin est une excellente option pour explorer la capitale allemande. Confortable et moderne, ce service propose des wagons équipés de prises électriques, d\'un espace détente et d\'une voiture-restaurant offrant des spécialités locales. Un voyage agréable pour les amateurs d’histoire et de culture.\r\n'),
(6, 'Amsterdam\r\n', 105.80, '12:10:00', 'Amsterdam est accessible via un trajet agréable et rapide. Ce train offre une atmosphère détendue avec des compartiments spacieux et un service à bord de qualité. Que vous visitiez la ville pour ses musées, ses canaux ou sa vie nocturne, ce voyage vous assure un excellent début d’expérience.\r\n');

-- --------------------------------------------------------

--
-- Structure de la table `reservation`
--

CREATE TABLE `reservation` (
  `id` int(250) NOT NULL,
  `nom` varchar(25) NOT NULL,
  `prenom` varchar(35) NOT NULL,
  `email` varchar(254) NOT NULL,
  `datedenaissance` date NOT NULL,
  `dateresa` datetime NOT NULL,
  `classe` int(255) NOT NULL,
  `destination` int(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `reservation`
--

INSERT INTO `reservation` (`id`, `nom`, `prenom`, `email`, `datedenaissance`, `dateresa`, `classe`, `destination`) VALUES
(2, 'Konda', 'Eudes', 'konda.eudes@gmail.com', '2000-02-03', '2025-02-26 09:48:26', 1, 2),
(3, 'Konda', 'Eudes', 'konda.eudes@gmail.com', '2000-02-03', '2025-02-26 09:48:26', 1, 2);

--
-- Index pour les tables déchargées
--

--
-- Index pour la table `classe`
--
ALTER TABLE `classe`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `destinations`
--
ALTER TABLE `destinations`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `reservation`
--
ALTER TABLE `reservation`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FK destination` (`destination`),
  ADD KEY `FK classe` (`classe`);

--
-- AUTO_INCREMENT pour les tables déchargées
--

--
-- AUTO_INCREMENT pour la table `classe`
--
ALTER TABLE `classe`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT pour la table `destinations`
--
ALTER TABLE `destinations`
  MODIFY `id` int(255) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT pour la table `reservation`
--
ALTER TABLE `reservation`
  MODIFY `id` int(250) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- Contraintes pour les tables déchargées
--

--
-- Contraintes pour la table `reservation`
--
ALTER TABLE `reservation`
  ADD CONSTRAINT `FK classe` FOREIGN KEY (`classe`) REFERENCES `classe` (`id`),
  ADD CONSTRAINT `FK destination` FOREIGN KEY (`destination`) REFERENCES `destinations` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
