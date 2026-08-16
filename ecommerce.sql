-- phpMyAdmin SQL Dump
-- version 4.9.2
-- https://www.phpmyadmin.net/
--
-- Hôte : 127.0.0.1:3306
-- Généré le :  mar. 05 jan. 2021 à 09:43
-- Version du serveur :  10.4.10-MariaDB
-- Version de PHP :  7.3.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données :  `ecommerce`
--
CREATE DATABASE IF NOT EXISTS `ecommerce` DEFAULT CHARACTER SET latin1 COLLATE latin1_swedish_ci;
USE `ecommerce`;

-- --------------------------------------------------------

--
-- Structure de la table `commande`
--

DROP TABLE IF EXISTS `commande`;
CREATE TABLE IF NOT EXISTS `commande` (
  `id` int(11) NOT NULL,
  `adresseFacturation` varchar(255) DEFAULT NULL,
  `adresseLivraison` varchar(255) DEFAULT NULL,
  `datePassageCommande` date DEFAULT NULL,
  `expédiée` tinyint(4) NOT NULL,
  `numCarteBancaire` varchar(255) DEFAULT NULL,
  `reglée` tinyint(4) NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FKbnvedj82re94mjd15kt29utro` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Tronquer la table avant d'insérer `commande`
--

TRUNCATE TABLE `commande`;
--
-- Déchargement des données de la table `commande`
--

INSERT INTO `commande` (`id`, `adresseFacturation`, `adresseLivraison`, `datePassageCommande`, `expédiée`, `numCarteBancaire`, `reglée`, `user_id`) VALUES
(1, NULL, NULL, '2020-12-01', 0, NULL, 0, 1),
(45, NULL, NULL, NULL, 0, NULL, 0, 1);

-- --------------------------------------------------------

--
-- Structure de la table `commentaire`
--

DROP TABLE IF EXISTS `commentaire`;
CREATE TABLE IF NOT EXISTS `commentaire` (
  `id` int(11) NOT NULL,
  `texte` longtext DEFAULT NULL,
  `produit_id` int(11) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FKbe5ehx3nrrquf9wea21h094tc` (`produit_id`),
  KEY `FKas6d40xq788pur80nap7ol195` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Tronquer la table avant d'insérer `commentaire`
--

TRUNCATE TABLE `commentaire`;
-- --------------------------------------------------------

--
-- Structure de la table `hibernate_sequence`
--

DROP TABLE IF EXISTS `hibernate_sequence`;
CREATE TABLE IF NOT EXISTS `hibernate_sequence` (
  `next_val` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Tronquer la table avant d'insérer `hibernate_sequence`
--

TRUNCATE TABLE `hibernate_sequence`;
--
-- Déchargement des données de la table `hibernate_sequence`
--

INSERT INTO `hibernate_sequence` (`next_val`) VALUES
(48);

-- --------------------------------------------------------

--
-- Structure de la table `ligne_commande`
--

DROP TABLE IF EXISTS `ligne_commande`;
CREATE TABLE IF NOT EXISTS `ligne_commande` (
  `id` int(11) NOT NULL,
  `quantite` int(11) NOT NULL,
  `commande_id` int(11) DEFAULT NULL,
  `produit_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK81r9tjbd7qd0s24u8w8aa6vav` (`commande_id`),
  KEY `FKgb6d0shnvshfxkhpywym1wom8` (`produit_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Tronquer la table avant d'insérer `ligne_commande`
--

TRUNCATE TABLE `ligne_commande`;
--
-- Déchargement des données de la table `ligne_commande`
--

INSERT INTO `ligne_commande` (`id`, `quantite`, `commande_id`, `produit_id`) VALUES
(1, 10, 1, 2),
(2, 24, 1, 1),
(46, 1, 45, 4);

-- --------------------------------------------------------

--
-- Structure de la table `produit`
--

DROP TABLE IF EXISTS `produit`;
CREATE TABLE IF NOT EXISTS `produit` (
  `id` int(11) NOT NULL,
  `categorie` varchar(255) NOT NULL,
  `description` longtext NOT NULL,
  `disponibleEnVente` tinyint(4) NOT NULL,
  `image` varchar(255) DEFAULT NULL,
  `prix` double NOT NULL,
  `quantite` int(11) NOT NULL,
  `titre` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Tronquer la table avant d'insérer `produit`
--

TRUNCATE TABLE `produit`;
--
-- Déchargement des données de la table `produit`
--

INSERT INTO `produit` (`id`, `categorie`, `description`, `disponibleEnVente`, `image`, `prix`, `quantite`, `titre`) VALUES
(1, 'ACTION', 'Super Mario Bros. 35 sur Switch est un jeu de plateforme en ligne dans lequel vous devez rester le dernier en vie alors que les ennemis que vous éliminez iront envahir les stages des autres joueurs. Reprenant l\'univers du premier Super Mario Bros, le jeu vous permet d\'utiliser la roulette d\'objets et quatre stratégies différentes pour devancer vos adversaires.', 1, 'img/51XVjiMwr2L._AC_SX425_.jpg', 75.99, 65, 'Mario'),
(2, 'AVENTURE', 'The Legend of Zelda , ou simplement Zelda, est une série de jeux vidéo d\'action-aventure produite par la société japonaise Nintendo et créée par Shigeru Miyamoto et Takashi Tezuka. Depuis 1986 et la sortie du jeu The Legend of Zelda sur la console NES, dix-neuf jeux font officiellement partie de la saga. Plusieurs rééditions, remakes et jeux dérivés ont également vu le jour.', 1, 'img/zelda.png', 87.99, 36, 'Zelda'),
(3, 'AVENTURE', 'Après l\'exécution de l\'Ordre 66, l\'Empire cherche à éradiquer tous les Jedi. En tant que Padawan Jedi en fuite, vous devez lutter pour survivre et percer les secrets d\'une civilisation disparue depuis des générations, dans l\'espoir de rebâtir l\'Ordre Jedi.', 1, 'img/Star-Wars-Battlefront-2-PS3.jpg', 84.99, 36, 'Star Wars'),
(4, 'MMO', 'Empreint de légendes et d\'aventure, l\'univers de WoW vous attend ! Vous allez revisiter les terres d\'Azeroth sous une nouvelle perspective, explorant des champs de bataille familiers, découvrant de nouvelles terres au travers de quêtes épiques.', 1, 'img/wow-classic1.jpg', 84.99, 36, 'World of Warcraft'),
(5, 'RPG', 'The Elder Scrolls V: Skyrim isn’t just one of the best RPGs on PC, it’s an institution. It’s managed to stay relevant and eminently playable long after its 2011 debut – tirelessly tugging players back in by their mage robes. With the help of many, many Skyrim mods and console commands, of course.', 1, 'img/best-rpg-skyrim-900x506.jpg', 84.99, 36, 'THE ELDER SCROLLS V: SKYRIM'),
(47, 'ACTION', 'ytuftjyf', 0, 'img/', 7, 7, 'rdty');

-- --------------------------------------------------------

--
-- Structure de la table `user`
--

DROP TABLE IF EXISTS `user`;
CREATE TABLE IF NOT EXISTS `user` (
  `id` int(11) NOT NULL,
  `admin` tinyint(4) NOT NULL,
  `adresse` varchar(255) DEFAULT NULL,
  `adresseMail` varchar(255) NOT NULL,
  `identifiant` varchar(255) DEFAULT NULL,
  `mdp` varchar(255) NOT NULL,
  `pointsFidelite` int(11) NOT NULL,
  `telephone` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Tronquer la table avant d'insérer `user`
--

TRUNCATE TABLE `user`;
--
-- Déchargement des données de la table `user`
--

INSERT INTO `user` (`id`, `admin`, `adresse`, `adresseMail`, `identifiant`, `mdp`, `pointsFidelite`, `telephone`) VALUES
(1, 1, NULL, 'rom@rom.com', NULL, 'rom', 0, NULL);

--
-- Contraintes pour les tables déchargées
--

--
-- Contraintes pour la table `commande`
--
ALTER TABLE `commande`
  ADD CONSTRAINT `FKbnvedj82re94mjd15kt29utro` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`);

--
-- Contraintes pour la table `commentaire`
--
ALTER TABLE `commentaire`
  ADD CONSTRAINT `FKas6d40xq788pur80nap7ol195` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`),
  ADD CONSTRAINT `FKbe5ehx3nrrquf9wea21h094tc` FOREIGN KEY (`produit_id`) REFERENCES `produit` (`id`);

--
-- Contraintes pour la table `ligne_commande`
--
ALTER TABLE `ligne_commande`
  ADD CONSTRAINT `FK81r9tjbd7qd0s24u8w8aa6vav` FOREIGN KEY (`commande_id`) REFERENCES `commande` (`id`),
  ADD CONSTRAINT `FKgb6d0shnvshfxkhpywym1wom8` FOREIGN KEY (`produit_id`) REFERENCES `produit` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
