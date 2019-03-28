-- Adminer 4.6.2 MySQL dump

SET NAMES utf8;
SET time_zone = '+00:00';
SET foreign_key_checks = 0;
SET sql_mode = 'NO_AUTO_VALUE_ON_ZERO';

DROP TABLE IF EXISTS `commandes`;
CREATE TABLE `commandes` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_produit` int(11) NOT NULL,
  `nom_client` varchar(255) NOT NULL,
  `contact` varchar(255) NOT NULL,
  `adresse` varchar(255) NOT NULL,
  `statut` enum('livre','en_attente') CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT 'en_attente',
  PRIMARY KEY (`id`),
  KEY `id_produit` (`id_produit`),
  CONSTRAINT `commandes_ibfk_1` FOREIGN KEY (`id_produit`) REFERENCES `produits` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


DROP TABLE IF EXISTS `produits`;
CREATE TABLE `produits` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nom` varchar(255) NOT NULL,
  `image` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `description` text,
  `prix` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

INSERT INTO `produits` (`id`, `nom`, `image`, `description`, `prix`) VALUES
(1,	'Real Kebab Plateau',	'images/9921031099.jpeg',	'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Duis congue augue sapien, sed commodo nunc tempus sed. Mauris venenatis ut diam quis consequat. Sed efficitur, ex sed viverra fringilla, odio justo malesuada eros, sed tempor metus magna cursus magna. Aliquam faucibus orci quis nibh rutrum laoreet. Aenean eleifend eu erat sit amet mattis. Sed et sem imperdiet, sagittis purus efficitur, ullamcorper velit. Nulla facilisi. ',	15000),
(2,	'Pasta e Pizza Soccocé',	'images/261dc2189c.jpeg',	'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Duis congue augue sapien, sed commodo nunc tempus sed. Mauris venenatis ut diam quis consequat. Sed efficitur, ex sed viverra fringilla, odio justo malesuada eros, sed tempor metus magna cursus magna. Aliquam faucibus orci quis nibh rutrum laoreet. Aenean eleifend eu erat sit amet mattis. Sed et sem imperdiet, sagittis purus efficitur, ullamcorper velit. Nulla facilisi. Praesent interdum ipsum ut leo sollicitudin, quis pharetra massa convallis. ',	8000),
(3,	'Villa Di Sorrento',	'images/a7f172de05.jpeg',	'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Duis congue augue sapien, sed commodo nunc tempus sed. Mauris venenatis ut diam quis consequat. Sed efficitur, ex sed viverra fringilla, odio justo malesuada eros, sed tempor metus magna cursus magna. Aliquam faucibus orci quis nibh rutrum laoreet. Aenean eleifend eu erat sit amet mattis. Sed et sem imperdiet, sagittis purus efficitur, ullamcorper velit. Nulla facilisi. Praesent interdum ipsum ut leo sollicitudin, quis pharetra massa convallis.',	9000),
(4,	'Fé ta crêpe-Zone4',	'images/5ee4e48cf5.jpeg',	'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Duis congue augue sapien, sed commodo nunc tempus sed. Mauris venenatis ut diam quis consequat. Sed efficitur, ex sed viverra fringilla, odio justo malesuada eros, sed tempor metus magna cursus magna. Aliquam faucibus orci quis nibh rutrum laoreet. Aenean eleifend eu erat sit amet mattis. Sed et sem imperdiet, sagittis purus efficitur, ullamcorper velit. Nulla facilisi. Praesent interdum ipsum ut leo sollicitudin, quis pharetra massa convallis. ',	20000);

-- 2019-03-26 20:58:51
