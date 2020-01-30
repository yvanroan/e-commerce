-- phpMyAdmin SQL Dump
-- version 4.7.9
-- https://www.phpmyadmin.net/
--
-- Hôte : 127.0.0.1:3306
-- Généré le :  jeu. 30 jan. 2020 à 04:42
-- Version du serveur :  5.7.21
-- Version de PHP :  5.6.35

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données :  `commerce`
--

-- --------------------------------------------------------

--
-- Structure de la table `cart`
--

DROP TABLE IF EXISTS `cart`;
CREATE TABLE IF NOT EXISTS `cart` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `quantity` int(11) NOT NULL,
  `ownerid` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `ownerid` (`ownerid`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `cart`
--

INSERT INTO `cart` (`id`, `quantity`, `ownerid`) VALUES
(13, 7, 5),
(16, 6, 4),
(17, 7, 1),
(18, 2, 2);

-- --------------------------------------------------------

--
-- Structure de la table `product`
--

DROP TABLE IF EXISTS `product`;
CREATE TABLE IF NOT EXISTS `product` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(150) NOT NULL,
  `image` text NOT NULL,
  `price` float NOT NULL,
  `description` text NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `product`
--

INSERT INTO `product` (`id`, `name`, `image`, `price`, `description`) VALUES
(1, 'pamplemousse', 'pas.png', 43543, 'just writing'),
(2, 'fdsgfdg', 'fdsgdfgdfg', 45254, 'just writing'),
(3, 'sac a dos', 'pickup.jpg', 435345, 'just writing'),
(6, 'babouche', 'vacarme.jpg', 54543, 'just writing');

-- --------------------------------------------------------

--
-- Structure de la table `productentity`
--

DROP TABLE IF EXISTS `productentity`;
CREATE TABLE IF NOT EXISTS `productentity` (
  `productid` int(11) NOT NULL,
  `cartid` int(11) NOT NULL,
  `quantity` int(11) NOT NULL,
  `id` int(11) NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`id`),
  KEY `productid` (`productid`),
  KEY `cartid` (`cartid`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `productentity`
--

INSERT INTO `productentity` (`productid`, `cartid`, `quantity`, `id`) VALUES
(6, 16, 2, 5),
(1, 16, 2, 6),
(6, 16, 2, 7),
(1, 17, 2, 8);

-- --------------------------------------------------------

--
-- Structure de la table `receipt`
--

DROP TABLE IF EXISTS `receipt`;
CREATE TABLE IF NOT EXISTS `receipt` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `date` date NOT NULL,
  `description` text NOT NULL,
  `total` int(11) NOT NULL,
  `ownerid` int(11) NOT NULL,
  `cartid` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_userreceipt` (`ownerid`),
  KEY `cvbn` (`cartid`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `receipt`
--

INSERT INTO `receipt` (`id`, `date`, `description`, `total`, `ownerid`, `cartid`) VALUES
(6, '2020-01-08', 'just writing', 543255, 5, 16),
(7, '2020-01-14', 'just writing', 214354, 4, 13),
(8, '2020-01-14', 'just writing', 54535, 2, 16),
(9, '2020-01-19', 'just writing', 454554, 1, 18);

-- --------------------------------------------------------

--
-- Structure de la table `review`
--

DROP TABLE IF EXISTS `review`;
CREATE TABLE IF NOT EXISTS `review` (
  `productId` int(11) NOT NULL,
  `consumerId` int(11) NOT NULL,
  `description` text NOT NULL,
  `stars` int(1) NOT NULL,
  `id` int(11) NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`id`),
  KEY `consumerId` (`consumerId`),
  KEY `FK_productreview` (`productId`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `review`
--

INSERT INTO `review` (`productId`, `consumerId`, `description`, `stars`, `id`) VALUES
(6, 2, 'just writing rubish', 5, 1),
(3, 1, 'just writing rubish', 5, 2),
(6, 5, 'just writing rubish', 1, 3),
(6, 1, 'just writing rubish', 0, 4),
(2, 6, 'just writing rubish', 4, 5),
(1, 6, 'just writing rubish', 2, 6);

-- --------------------------------------------------------

--
-- Structure de la table `user`
--

DROP TABLE IF EXISTS `user`;
CREATE TABLE IF NOT EXISTS `user` (
  `name` varchar(15) NOT NULL,
  `number` varchar(14) NOT NULL,
  `password` varchar(20) NOT NULL,
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `mail` varchar(30) NOT NULL,
  `addresse` varchar(150) NOT NULL,
  `image` varchar(150) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `user`
--

INSERT INTO `user` (`name`, `number`, `password`, `id`, `mail`, `addresse`, `image`) VALUES
('ulrich', '435435324', 'reteytry', 1, 'ulrich@yahoo.com', '115 st royal raod edmonton ab', 'dskfdskl.png'),
('pascal', '543253425', 'retretrete', 2, 'pascal@yahoo.com', 'bonanjo, douala ', 'pascal.jpg'),
('florian', '543253425', 'retretrete', 4, 'florian@yahoo.com', 'bepanda, douala', 'florian.jpg'),
('boris', '53534534', 'rewyreter', 5, 'borisd@yahoo.com', 'konoha, village de la feuille', 'boris.png'),
('angele', '543543', 'gfdgergsfd', 6, 'angele@yahoo.com', 'bonaberi, douala', 'angele.jpg');

--
-- Contraintes pour les tables déchargées
--

--
-- Contraintes pour la table `cart`
--
ALTER TABLE `cart`
  ADD CONSTRAINT `FK_usercart` FOREIGN KEY (`ownerid`) REFERENCES `user` (`id`);

--
-- Contraintes pour la table `productentity`
--
ALTER TABLE `productentity`
  ADD CONSTRAINT `fk_pace` FOREIGN KEY (`cartid`) REFERENCES `cart` (`id`),
  ADD CONSTRAINT `productentity_ibfk_1` FOREIGN KEY (`productid`) REFERENCES `product` (`id`);

--
-- Contraintes pour la table `receipt`
--
ALTER TABLE `receipt`
  ADD CONSTRAINT `FK_userreceipt` FOREIGN KEY (`ownerid`) REFERENCES `user` (`id`),
  ADD CONSTRAINT `cvbn` FOREIGN KEY (`cartid`) REFERENCES `cart` (`id`);

--
-- Contraintes pour la table `review`
--
ALTER TABLE `review`
  ADD CONSTRAINT `FK_productreview` FOREIGN KEY (`productId`) REFERENCES `product` (`id`),
  ADD CONSTRAINT `review_ibfk_1` FOREIGN KEY (`consumerId`) REFERENCES `user` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
