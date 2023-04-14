-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Hôte : 127.0.0.1
-- Généré le : ven. 14 avr. 2023 à 14:30
-- Version du serveur : 10.4.27-MariaDB
-- Version de PHP : 8.0.25

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données : `centre_formation`
--

-- --------------------------------------------------------

--
-- Structure de la table `admin`
--

CREATE TABLE `admin` (
  `ID_admin` int(11) NOT NULL,
  `nom` varchar(50) NOT NULL,
  `prenom` varchar(50) NOT NULL,
  `email` varchar(100) NOT NULL,
  `mot_de_passe` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `admin`
--

INSERT INTO `admin` (`ID_admin`, `nom`, `prenom`, `email`, `mot_de_passe`) VALUES
(1, 'Douae', 'Linjri', 'douaelinjri@gmail.com', 'linjri2004');

-- --------------------------------------------------------

--
-- Structure de la table `apprenant`
--

CREATE TABLE `apprenant` (
  `ID_apprenant` int(11) NOT NULL,
  `nom` varchar(200) NOT NULL,
  `prenom` varchar(200) NOT NULL,
  `email` varchar(70) NOT NULL,
  `mot_de_passe` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `apprenant`
--

INSERT INTO `apprenant` (`ID_apprenant`, `nom`, `prenom`, `email`, `mot_de_passe`) VALUES
(1, 'Malak', ' Linjri', 'malaklinjri@gmail.com', '2020');

-- --------------------------------------------------------

--
-- Structure de la table `evaluation`
--

CREATE TABLE `evaluation` (
  `ID_apprenant` int(11) NOT NULL,
  `ID_session` int(11) NOT NULL,
  `resultat` varchar(200) NOT NULL,
  `date_evaluation` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `evaluation`
--

INSERT INTO `evaluation` (`ID_apprenant`, `ID_session`, `resultat`, `date_evaluation`) VALUES
(1, 1, 'Valider', '2023-04-22 00:00:00');

-- --------------------------------------------------------

--
-- Structure de la table `formateur`
--

CREATE TABLE `formateur` (
  `ID_formateur` int(11) NOT NULL,
  `nom` varchar(200) NOT NULL,
  `prenom` varchar(200) NOT NULL,
  `email` varchar(70) NOT NULL,
  `mot_de_passe` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `formateur`
--

INSERT INTO `formateur` (`ID_formateur`, `nom`, `prenom`, `email`, `mot_de_passe`) VALUES
(1, 'Youssef', 'amzin', 'youssefamzin@gmail.com', '2003');

-- --------------------------------------------------------

--
-- Structure de la table `formation`
--

CREATE TABLE `formation` (
  `ID_formation` int(11) NOT NULL,
  `categorie` varchar(100) NOT NULL,
  `description` text NOT NULL,
  `masse_horaire` int(11) NOT NULL,
  `sujet` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `formation`
--

INSERT INTO `formation` (`ID_formation`, `categorie`, `description`, `masse_horaire`, `sujet`) VALUES
(1, 'Informatique', 'Formation en développement web Full_stack', 70, 'HTML/CSS/JavaScript/PHP');

-- --------------------------------------------------------

--
-- Structure de la table `session`
--

CREATE TABLE `session` (
  `ID_session` int(11) NOT NULL,
  `date_debut` datetime NOT NULL,
  `date_fin` datetime NOT NULL,
  `nombre_de_places` int(11) NOT NULL,
  `etat` varchar(100) NOT NULL,
  `ID_formateur` int(11) NOT NULL,
  `ID_formation` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `session`
--

INSERT INTO `session` (`ID_session`, `date_debut`, `date_fin`, `nombre_de_places`, `etat`, `ID_formateur`, `ID_formation`) VALUES
(1, '2023-06-01 00:00:00', '2023-07-29 00:00:00', 25, 'En cours', 1, 1);

--
-- Index pour les tables déchargées
--

--
-- Index pour la table `admin`
--
ALTER TABLE `admin`
  ADD PRIMARY KEY (`ID_admin`);

--
-- Index pour la table `apprenant`
--
ALTER TABLE `apprenant`
  ADD PRIMARY KEY (`ID_apprenant`);

--
-- Index pour la table `evaluation`
--
ALTER TABLE `evaluation`
  ADD PRIMARY KEY (`ID_apprenant`,`ID_session`),
  ADD KEY `ID_session` (`ID_session`);

--
-- Index pour la table `formateur`
--
ALTER TABLE `formateur`
  ADD PRIMARY KEY (`ID_formateur`);

--
-- Index pour la table `formation`
--
ALTER TABLE `formation`
  ADD PRIMARY KEY (`ID_formation`);

--
-- Index pour la table `session`
--
ALTER TABLE `session`
  ADD PRIMARY KEY (`ID_session`),
  ADD KEY `ID_formateur` (`ID_formateur`),
  ADD KEY `ID_formation` (`ID_formation`);

--
-- AUTO_INCREMENT pour les tables déchargées
--

--
-- AUTO_INCREMENT pour la table `admin`
--
ALTER TABLE `admin`
  MODIFY `ID_admin` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT pour la table `apprenant`
--
ALTER TABLE `apprenant`
  MODIFY `ID_apprenant` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT pour la table `formateur`
--
ALTER TABLE `formateur`
  MODIFY `ID_formateur` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT pour la table `formation`
--
ALTER TABLE `formation`
  MODIFY `ID_formation` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT pour la table `session`
--
ALTER TABLE `session`
  MODIFY `ID_session` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- Contraintes pour les tables déchargées
--

--
-- Contraintes pour la table `evaluation`
--
ALTER TABLE `evaluation`
  ADD CONSTRAINT `evaluation_ibfk_1` FOREIGN KEY (`ID_apprenant`) REFERENCES `apprenant` (`ID_apprenant`),
  ADD CONSTRAINT `evaluation_ibfk_2` FOREIGN KEY (`ID_session`) REFERENCES `session` (`ID_session`);

--
-- Contraintes pour la table `session`
--
ALTER TABLE `session`
  ADD CONSTRAINT `session_ibfk_1` FOREIGN KEY (`ID_formateur`) REFERENCES `formateur` (`ID_formateur`),
  ADD CONSTRAINT `session_ibfk_2` FOREIGN KEY (`ID_formation`) REFERENCES `formation` (`ID_formation`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
