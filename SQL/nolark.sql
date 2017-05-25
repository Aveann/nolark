-- phpMyAdmin SQL Dump
-- version 4.6.4
-- https://www.phpmyadmin.net/
--
-- Client :  127.0.0.1
-- Généré le :  Jeu 25 Mai 2017 à 14:24
-- Version du serveur :  5.7.14
-- Version de PHP :  7.0.10

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données :  `nolark`
--

-- --------------------------------------------------------

--
-- Structure de la table `articles`
--

CREATE TABLE `articles` (
  `article_id` int(5) NOT NULL,
  `article_title` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `article_img` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `article_text` text COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `categorie`
--

CREATE TABLE `categorie` (
  `categorie_id` int(5) NOT NULL,
  `nom` varchar(40) CHARACTER SET utf8 NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='liste des catégories';

--
-- Contenu de la table `categorie`
--

INSERT INTO `categorie` (`categorie_id`, `nom`) VALUES
(1, 'casque');

-- --------------------------------------------------------

--
-- Structure de la table `filtre`
--

CREATE TABLE `filtre` (
  `filtre_id` int(5) NOT NULL,
  `nom` varchar(20) COLLATE utf8_unicode_ci NOT NULL COMMENT 'peut-être marque, couleur, taille, etc...'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Différentes catégories où peuvent appartenir les casques';

--
-- Contenu de la table `filtre`
--

INSERT INTO `filtre` (`filtre_id`, `nom`) VALUES
(1, 'marque'),
(2, 'type');

-- --------------------------------------------------------

--
-- Structure de la table `marque`
--

CREATE TABLE `marque` (
  `marque_id` int(3) NOT NULL,
  `nom` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Contenu de la table `marque`
--

INSERT INTO `marque` (`marque_id`, `nom`) VALUES
(13, 'AGV'),
(4, 'Arai'),
(17, 'Bobby'),
(11, 'Cox'),
(12, 'Flash'),
(6, 'Givi'),
(1, 'HJC'),
(2, 'Hornet'),
(14, 'Jetts'),
(7, 'Nexx'),
(10, 'Noja'),
(8, 'Project'),
(15, 'Quadrant'),
(16, 'Scorpion'),
(5, 'Shoei'),
(9, 'Torx'),
(3, 'X 501');

-- --------------------------------------------------------

--
-- Structure de la table `produit`
--

CREATE TABLE `produit` (
  `produit_id` int(5) NOT NULL,
  `categorie` varchar(40) DEFAULT NULL,
  `selection` varchar(40) DEFAULT NULL,
  `type` varchar(40) DEFAULT NULL,
  `modele` varchar(200) NOT NULL COMMENT 'nom du produit',
  `marque` varchar(20) DEFAULT NULL,
  `prix` float DEFAULT NULL,
  `should_price` int(5) NOT NULL DEFAULT '0' COMMENT 'le prix conseillé au client',
  `reduction` tinyint(2) NOT NULL DEFAULT '0' COMMENT 'réduction',
  `description` text NOT NULL,
  `stock` int(4) DEFAULT NULL,
  `note` double DEFAULT NULL,
  `image` text,
  `date_created` datetime NOT NULL,
  `date_modified` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Contenu de la table `produit`
--

INSERT INTO `produit` (`produit_id`, `categorie`, `selection`, `type`, `modele`, `marque`, `prix`, `should_price`, `reduction`, `description`, `stock`, `note`, `image`, `date_created`, `date_modified`) VALUES
(1, 'casque', 'En ce moment', 'cross', 'MX ELAN MC5', 'HJC', 249.99, 307, 0, '', 3, 3, 'arai-vx3-frost-silver.jpg', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(2, 'casque', 'En ce moment', 'cross', 'DS anthracite mat', 'Hornet', 249.99, 307, 40, '', 25, 3, 'casque-shoei-vfx-w-noir-mat-.jpg', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(3, 'casque', 'En ce moment', 'cross', 'DS blanc', 'Hornet', 249.99, 307, 40, '', 0, 3, 'CL_MX_ELAN_MC5.jpg', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(4, 'casque', 'En ce moment', 'cross', 'DS gris', 'Hornet', 249.99, 307, 40, '', 3, 3, 'Hornet-ds-anthracite-mat.jpg', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(5, 'casque', NULL, 'cross', 'DS noir mat', 'Hornet', 249.99, 307, 40, '', 15, 3, 'Hornet-ds-blanc.jpg', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(6, 'casque', NULL, 'cross', 'DS noir', 'Hornet', 249.99, 307, 40, '', 15, 3, 'Hornet-ds-gris.jpg', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(7, 'casque', NULL, 'cross', 'Start F Black', 'X 501', 249.99, 307, 0, '', 25, 3, 'Hornet-ds-noir-mat.jpg', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(8, 'casque', NULL, 'cross', 'VX3 Frost silver', 'Arai', 249.99, 307, 0, '', 0, 3, 'Hornet-ds-noir.jpg', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(9, 'casque', NULL, 'cross', 'VFX W Noir Mat', 'Shoei', 249.99, 307, 60, '', 3, 3, 'X-501-START-F.Black.jpg', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(10, 'casque', NULL, 'piste', 'Qwest Airfoil TC1', 'Shoei', 249.99, 307, 60, '', 3, 3, 'shoei-qwest-airfoil-tc1.jpg', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(11, 'casque', NULL, 'piste', 'Qwest Airfoil TC5', 'Shoei', 249.99, 307, 60, '', 25, 3, 'shoei-qwest-airfoil-tc5.jpg', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(12, 'casque', NULL, 'piste', 'X-Spirit 2 blanc', 'Shoei', 249.99, 307, 60, '', 0, 3, 'shoei-x-spirit-2-blanc.jpg', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(13, 'casque', NULL, 'piste', 'X-Spirit 2 noir', 'Shoei', 250, 307, 60, '', 3, 3, 'shoei-x-spirit-2-noir.jpg', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(14, 'casque', NULL, 'piste', 'Skyline blanc', 'AGV', 209.99, 267, 20, '', 15, 3, 'skyline-blanc.jpg', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(15, 'casque', NULL, 'piste', 'Skyline blanc', 'AGV', 269.99, 327, 20, '', 3, 3, 'skyline-block-blanc-bleu.jpg', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(16, 'casque', NULL, 'piste', 'Skyline Block blanc bleu', 'AGV', 270, 327, 20, '', 25, 3, 'skyline-block-blanc-rouge.jpg', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(17, 'casque', NULL, 'piste', 'Skyline Block blanc rouge', 'AGV', 270, 327, 20, '', 0, 3, 'Skyline-Block-Noir.jpg', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(18, 'casque', NULL, 'piste', 'Skyline Block noir', 'AGV', 229.99, 287, 20, '', 3, 3, 'Skyline-Multi-Psyco-White-Gunmetal-Blue.jpg', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(19, 'casque', NULL, 'piste', 'Skyline Multi Psyco White Gunmetal blue', 'AGV', 229.99, 287, 20, '', 15, 3, 'Skyline-Multi-Psyco-White-Gunmetal-Red.jpg', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(20, 'casque', NULL, 'piste', 'Skyline Multi Psyco White Gunmetal red', 'AGV', 245, 302, 20, '', 3, 3, 'skyline-multi-psyco-white-gunmetal.jpg', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(21, 'casque', NULL, 'piste', 'Skyline Multi Psyco White Gunmetal', 'AGV', 245, 302, 20, '', 25, 3, 'skyline-noir-mat.jpg', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(22, 'casque', NULL, 'piste', 'Skyline noir mat', 'AGV', 245, 302, 20, '', 0, 3, 'skyline-noir.jpg', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(23, 'casque', NULL, 'piste', 'Skyline noir', 'AGV', 245, 302, 20, '', 3, 3, 'x-spirit-ii-marquez-2-tc1.jpg', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(24, 'casque', NULL, 'piste', 'X-Spirit II Marquez 2 TC1', 'Shoei', 245, 302, 60, '', 15, 3, 'X-Spirit-II-Reverb-TC2.jpg', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(25, 'casque', NULL, 'piste', 'X-Spirit II Reverb TC2', 'Shoei', 245, 302, 60, '', 3, 3, 'xr-1100-bradley-tc1.jpg', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(26, 'casque', NULL, 'piste', 'XR 1100 Bradley TC1', 'Shoei', 245, 302, 60, '', 25, 3, 'xr-1100-cavallino-tc1.jpg', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(27, 'casque', NULL, 'piste', 'XR 1100 Cavallino TC1', 'Shoei', 200, 257, 60, '', 0, 3, 'xr-1100-plugin-tc8.jpg', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(28, 'casque', NULL, 'piste', 'XR 1100 Rollin TC5', 'Shoei', 200, 257, 60, '', 3, 3, 'XR-1100-Rollin-TC5_4.jpg', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(29, 'casque', NULL, 'piste', 'XR 1100 Skeet TC2', 'Shoei', 180, 237, 60, '', 15, 3, 'xr-1100-skeet-tc2.jpg', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(30, 'casque', NULL, 'piste', 'XR 1100 Skeet TC4', 'Shoei', 185, 242, 60, '', 3, 3, 'XR-1100-Skeet-TC4.jpg', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(31, 'casque', NULL, 'piste', 'XR 1100 Skeet TC6', 'Shoei', 175, 232, 60, '', 25, 3, 'xr-1100-skeet-tc6.jpg', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(32, 'casque', NULL, 'piste', 'XR 1100 Tangent TC5', 'Shoei', 180, 237, 60, '', 0, 3, 'xr-1100-tangent-tc5.jpg', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(33, 'casque', NULL, 'piste', 'XR 1100 Transmission TC10', 'Shoei', 230, 287, 60, '', 3, 3, 'xr-1100-transmission-tc10.jpg', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(34, 'casque', NULL, 'piste', 'XR 1100 Transmission TC2', 'Shoei', 225, 282, 60, '', 15, 3, 'xr-1100-transmission-tc2.jpg', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(35, 'casque', NULL, 'piste', 'XR 1100 Transmission TC5', 'Shoei', 200, 257, 60, '', 3, 3, 'xr-1100-transmission-tc5.jpg', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(36, 'casque', NULL, 'piste', 'XR 1100 Transmission TC8', 'Shoei', 190, 247, 60, '', 25, 3, 'xr-1100-transmission-tc8.jpg', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(37, 'casque', NULL, 'piste', 'XR 1100 Crystal white', 'Shoei', 200, 257, 60, '', 3, 3, 'xr1100-crystal-white.jpg', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(38, 'casque', NULL, 'piste', 'XR 1100 Light silver', 'Shoei', 190, 247, 60, '', 25, 3, 'xr1100-light-silver.jpg', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(39, 'casque', NULL, 'piste', 'XR 1100 noir mat', 'Shoei', 190, 247, 60, '', 25, 3, 'xr1100-noir-mat.jpg', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(40, 'casque', NULL, 'piste', 'XR 1100 noir', 'Shoei', 200, 257, 60, '', 3, 3, 'xr1100-noir.jpg', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(41, 'casque', NULL, 'piste', 'XR 1100 Pearl Grey', 'Shoei', 190, 247, 60, '', 25, 3, 'xr1100-pearl-grey.jpg', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(42, 'casque', NULL, 'enfant', 'blanc', 'Bobby', 249.99, 307, 0, '', 3, 3, 'bobby-blanc.jpg', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(43, 'casque', NULL, 'enfant', 'Noir rose', 'Bobby', 249.99, 307, 0, '', 25, 3, 'bobby-noir-rose.jpg', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(44, 'casque', NULL, 'enfant', 'Noir', 'Bobby', 249.99, 307, 0, '', 0, 3, 'bobby-noir.jpg', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(45, 'casque', NULL, 'enfant', 'HPS Blanc', 'Givi', 250, 307, 0, '', 3, 3, 'casque-enfant-givi-hps-blanc.jpg', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(46, 'casque', NULL, 'enfant', 'x60 Vision plus rose', 'Nexx', 209.99, 267, 0, '', 15, 3, 'casque-enfant-nexx-x60-vision-plus-rose.jpg', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(47, 'casque', NULL, 'enfant', 'Squalo blanc', 'Project', 269.99, 327, 0, '', 3, 3, 'casque-enfant-project-squalo-blanc.jpg', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(48, 'casque', NULL, 'enfant', 'Squalo jaune', 'Project', 270, 327, 0, '', 25, 3, 'casque-enfant-project-squalo-jaune.jpg', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(49, 'casque', NULL, 'enfant', 'Squalo pink', 'Project', 270, 327, 0, '', 0, 3, 'casque-enfant-project-squalo-pink.jpg', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(50, 'casque', NULL, 'enfant', 'x60 Vision Plus blanc', 'Nexx', 229.99, 287, 0, '', 3, 3, 'casque-enfant-x60-vision-plus-blanc.jpg', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(51, 'casque', NULL, 'enfant', 'Spock', 'Nexx', 229.99, 287, 0, '', 15, 3, 'casque-moto-casque-enfant-nexx-x60-spock.jpg', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(52, 'casque', NULL, 'enfant', 'x60 Cool Kids blanc brillant', 'Nexx', 245, 302, 0, '', 3, 3, 'casque-nexx-x60-cool-kids-blanc-brillant.jpg', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(53, 'casque', NULL, 'enfant', 'x60 Cool Kids noir mat', 'Nexx', 245, 302, 0, '', 25, 3, 'casque-nexx-x60-cool-kids-noir-mat.jpg', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(54, 'casque', NULL, 'enfant', 'x60 Cool Kids rose mat', 'Nexx', 245, 302, 0, '', 0, 3, 'casque-nexx-x60-cool-kids-rose-mat.jpg', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(55, 'casque', NULL, 'enfant', 'x60 Cool Kids Vision Neon Jaune', 'Nexx', 245, 302, 0, '', 3, 3, 'casque-nexx-x60-kid-vision-neon-jaune.jpg', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(56, 'casque', NULL, 'enfant', 'x60 Cool Kids Vision Neon orange', 'Nexx', 245, 302, 0, '', 15, 3, 'casque-nexx-x60-kid-vision-neon-orange.jpg', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(57, 'casque', NULL, 'enfant', 'x60 Cool Kids Vintage noir noir', 'Nexx', 245, 302, 0, '', 3, 3, 'casque-nexx-x60-kids-vintage-noir-noir.jpg', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(58, 'casque', NULL, 'enfant', 'x60 Cool Kids Vision noir', 'Nexx', 245, 302, 0, '', 25, 3, 'casque-nexx-x60-kids-vision-noir.jpg', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(59, 'casque', NULL, 'enfant', 'Walt Blanc Bleu', 'Torx', 200, 257, 0, '', 0, 3, 'casque-torx-walt-blanc-bleu.jpg', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(60, 'casque', NULL, 'enfant', 'Walt Blanc rouge', 'Torx', 200, 257, 0, '', 3, 3, 'casque-torx-walt-blanc-rouge.jpg', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(61, 'casque', NULL, 'enfant', 'CL XY Wanted MC1', 'HJC', 180, 237, 0, '', 15, 3, 'cl-xy-wanted-mc1.jpg', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(62, 'casque', NULL, 'enfant', 'CL XY Wanted MC2', 'HJC', 185, 242, 0, '', 3, 3, 'cl-xy-wanted-mc2.jpg', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(63, 'casque', NULL, 'enfant', 'CL XY Wanted MC5', 'HJC', 175, 232, 0, '', 25, 3, 'cl-xy-wanted-mc5.jpg', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(64, 'casque', NULL, 'enfant', 'CL Y Blanc', 'HJC', 180, 237, 0, '', 0, 3, 'cly-blanc.jpg', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(65, 'casque', NULL, 'enfant', 'CL Y Cura MC1', 'HJC', 230, 287, 0, '', 3, 3, 'cly-cura-mc1.jpg', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(66, 'casque', NULL, 'enfant', 'CL Y Cura MC10', 'HJC', 225, 282, 0, '', 15, 3, 'cly-cura-mc10.jpg', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(67, 'casque', NULL, 'enfant', 'MX ELAN MC5', 'HJC', 200, 257, 0, '', 3, 3, 'cly-cura-mc5.jpg', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(68, 'casque', NULL, 'enfant', 'Katzilla MC10', 'HJC', 190, 247, 0, '', 25, 3, 'cly-katzilla-mc10.jpg', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(69, 'casque', NULL, 'enfant', 'CL Y noir', 'HJC', 199.99, 257, 0, '', 0, 3, 'cly-noir.jpg', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(70, 'casque', NULL, 'enfant', 'CL Y Razz MC5F', 'HJC', 230, 287, 0, '', 3, 3, 'cly-razz-mc5f.jpg', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(71, 'casque', NULL, 'enfant', 'CL Y MC8', 'HJC', 180, 237, 0, '', 15, 3, 'cly-razz-mc8.jpg', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(72, 'casque', NULL, 'enfant', 'x60 Cool Kids blanc brillant', 'Nexx', 170, 227, 0, '', 3, 3, 'Commando-Power.jpg', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(73, 'casque', NULL, 'enfant', 'Commando Power', 'Noja', 150, 207, 0, '', 25, 3, 'Dynamo-Junior-Noir1.jpg', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(74, 'casque', NULL, 'enfant', 'Junior noir', 'Noja', 160, 217, 0, '', 0, 3, 'fgk01-cox-rouge-noir.jpg', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(75, 'casque', NULL, 'enfant', 'Rouge noir', 'Cox', 210, 267, 0, '', 3, 3, 'flash-kid-blanc.jpg', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(76, 'casque', NULL, 'enfant', 'kid blanc', 'Flash', 249.99, 307, 0, '', 15, 3, 'flash-kid-kokoala.jpg', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(77, 'casque', 'En ce moment', 'enfant', 'kid kokoala', 'Flash', 239.99, 297, 0, '', 3, 3, 'junior-noir-mat.jpg', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(78, 'casque', NULL, 'enfant', 'junior noir', 'Flash', 229.99, 287, 0, '', 25, 3, 'Junior-Noir.jpg', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(79, 'casque', NULL, 'enfant', 'junior noir', 'Flash', 230, 287, 0, '', 0, 3, 'junior-rose.jpg', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(80, 'casque', NULL, 'enfant', 'junior rose', 'Flash', 220, 277, 0, '', 3, 3, 'Junior-Titanium.jpg', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(81, 'casque', NULL, 'enfant', 'junior Titanium', 'Flash', 219.99, 277, 0, '', 15, 3, 'open-top-vale-symbols.jpg', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(82, 'casque', NULL, 'enfant', 'Open Top Vale Symbols', 'AGV', 249.99, 307, 20, '', 3, 3, 'pretty.jpg', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(83, 'casque', NULL, 'enfant', 'Pretty', 'Jetts', 260, 317, 0, '', 25, 3, 'project-coccinelle-rouge.jpg', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(84, 'casque', NULL, 'enfant', 'Project Coccinelle', 'Jetts', 170, 227, 0, '', 0, 3, 'project-fleur-noir.jpg', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(85, 'casque', NULL, 'enfant', 'Project Fleur noir', 'Jetts', 160, 217, 0, '', 3, 3, 'project-old-italy-37.jpg', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(86, 'casque', NULL, 'enfant', 'Project Old Italy 37', 'Jetts', 159.99, 217, 0, '', 15, 3, 'project-old-italy-38.jpg', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(87, 'casque', NULL, 'enfant', 'Project Old Italy 38', 'Jetts', 159.99, 217, 0, '', 3, 3, 'Quadrant-Fragment-Black.jpg', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(88, 'casque', NULL, 'enfant', 'Fragment Black', 'Quadrant', 249.99, 307, 0, '', 25, 3, 'Quadrant-Fragment-Blue.jpg', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(89, 'casque', NULL, 'enfant', 'Fragment Orange', 'Quadrant', 249.99, 307, 0, '', 0, 3, 'Quadrant-Fragment-Orange.jpg', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(90, 'casque', NULL, 'enfant', 'Stripe Black Enfant', 'Quadrant', 249.99, 307, 0, '', 3, 3, 'Quadrant-Stripe-Black-Enfnt.jpg', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(91, 'casque', NULL, 'enfant', 'Stripe Red', 'Quadrant', 249.99, 307, 0, '', 15, 3, 'Quadrant-Stripe-Red.jpg', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(92, 'casque', NULL, 'enfant', 'Vertice Junior', 'Quadrant', 249.99, 307, 0, '', 3, 3, 'vertice-junior.jpg', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(93, 'casque', NULL, 'enfant', 'Weave Kid Acid', 'Quadrant', 249.99, 307, 0, '', 25, 3, 'Weave-Kid-Acid.jpg', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(94, 'casque', NULL, 'enfant', 'Weave Kid Pandada', 'Quadrant', 249.99, 307, 0, '', 0, 3, 'weave-kid-pandada.jpg', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(95, 'casque', NULL, 'route', 'Exo 1000 Air noir Mat', 'Scorpion', 249.99, 307, 0, '', 3, 3, 'casque-scorpion-exo-1000-air--noir-mat.jpg', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(96, 'casque', NULL, 'route', 'Exo 1000 Air noir', 'Scorpion', 249.99, 307, 0, '', 25, 3, 'casque-scorpion-exo-1000-air--noir.jpg', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(97, 'casque', NULL, 'route', 'Exo 1000 Air Twister noir et blanc', 'Scorpion', 249.99, 307, 0, '', 0, 3, 'casque-scorpion-exo-1000-air--twister-noir-blanc.jpg', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(98, 'casque', NULL, 'route', 'Exo 1000 Air Twister noir mat', 'Scorpion', 249.99, 307, 0, '', 3, 3, 'casque-scorpion-exo-1000-air--twister-noir-mat.jpg', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(99, 'casque', NULL, 'route', 'Exo 1000 anthracite', 'Scorpion', 249.99, 307, 0, '', 15, 3, 'casque-scorpion-exo-1000-anthracite-mat..jpg', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(100, 'casque', NULL, 'route', 'Exo 1000 blanc', 'Scorpion', 249.99, 307, 0, '', 4, 3, 'casque-scorpion-exo-1000-blanc.jpg', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(101, 'casque', NULL, 'route', 'Exo 1000 Fantasia blanc argent', 'Scorpion', 249.99, 307, 0, '', 0, 3, 'casque-scorpion-exo-1000-fantasia-blanc-argent.jpg', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(102, 'casque', NULL, 'route', 'Exo 1000 Air anthracite mat', 'Scorpion', 199.99, 257, 0, '', 1, 3, 'casque-scorpion-exo-500-air-anthracite-mat.jpg', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(103, 'casque', NULL, 'route', 'Exo 500 Air Ardent noir et rose', 'Scorpion', 199.99, 257, 0, '', 6, 3, 'casque-scorpion-exo-500-air-ardent-noir-rose.jpg', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(104, 'casque', NULL, 'route', 'Exo 500 Air blanc', 'Scorpion', 199.99, 257, 0, '', 3, 3, 'casque-scorpion-exo-500-air-blanc.jpg', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(105, 'casque', NULL, 'route', 'Exo 500 Air Hypersilver', 'Scorpion', 199.99, 257, 0, '', 5, 3, 'casque-scorpion-exo-500-air-hypersilver.jpg', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(106, 'casque', NULL, 'route', 'Scorpion Exo 500 Nelly blanc nacré violet', 'Scorpion', 199.99, 257, 0, '', 7, 3, 'casque-scorpion-exo-500-air-nelly-blanc-nacre-violet-1.jpg', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(107, 'casque', NULL, 'route', 'Scorpion Exo 500 Noir Mat', 'Scorpion', 199.99, 257, 0, '', 9, 3, 'casque-scorpion-exo-500-air-noir-mat.jpg', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(108, 'casque', NULL, 'route', 'Scorpion Exo 750 Scorpion blanc', 'Scorpion', 225, 282, 0, '', 2, 3, 'casque-scorpion-exo-750-scorpion-blanc.jpg', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(109, 'casque', NULL, 'route', 'Scorpion Exo 750 Scorpion Noir', 'Scorpion', 225, 282, 0, '', 0, 3, 'casque-scorpion-exo-750-scorpion-noir.jpg', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(110, 'casque', NULL, 'route', 'Scorpion Exo 750 Smoky Jaune Fluo', 'Scorpion', 225, 282, 0, '', 4, 3, 'casque-scorpion-exo-750-smoky-jaune-fluo.jpg', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(111, 'casque', NULL, 'route', 'Scorpion Exo 750 Smoky Noir Gris', 'Scorpion', 225, 282, 0, '', 25, 3, 'casque-scorpion-exo-750-smoky-noir-gris.jpg', '0000-00-00 00:00:00', '0000-00-00 00:00:00');

-- --------------------------------------------------------

--
-- Structure de la table `selection`
--

CREATE TABLE `selection` (
  `selection_id` int(5) NOT NULL,
  `nom` varchar(40) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Contenu de la table `selection`
--

INSERT INTO `selection` (`selection_id`, `nom`) VALUES
(1, 'En ce moment');

-- --------------------------------------------------------

--
-- Structure de la table `type`
--

CREATE TABLE `type` (
  `type_id` int(1) NOT NULL,
  `nom` varchar(40) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Contenu de la table `type`
--

INSERT INTO `type` (`type_id`, `nom`) VALUES
(1, 'cross'),
(2, 'enfant'),
(3, 'piste'),
(4, 'route');

-- --------------------------------------------------------

--
-- Structure de la table `user`
--

CREATE TABLE `user` (
  `user_id` mediumint(8) NOT NULL,
  `user_cart` int(5) NOT NULL,
  `first_name` varchar(20) COLLATE utf8_unicode_ci NOT NULL,
  `last_name` varchar(40) COLLATE utf8_unicode_ci NOT NULL,
  `tel` int(10) NOT NULL,
  `email` varchar(60) COLLATE utf8_unicode_ci NOT NULL,
  `login` varchar(20) COLLATE utf8_unicode_ci NOT NULL,
  `password` char(40) COLLATE utf8_unicode_ci NOT NULL,
  `address` varchar(70) COLLATE utf8_unicode_ci NOT NULL,
  `zip` int(5) NOT NULL,
  `date_creation` datetime NOT NULL,
  `date_birth` date NOT NULL,
  `gender` enum('f','m','other') COLLATE utf8_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Contenu de la table `user`
--

INSERT INTO `user` (`user_id`, `user_cart`, `first_name`, `last_name`, `tel`, `email`, `login`, `password`, `address`, `zip`, `date_creation`, `date_birth`, `gender`) VALUES
(1, 0, 'Naëva', 'Arnould', 123456789, 'email@example.com', 'aveann', '5da0321e700606920439aea925f1416b76ce99b2', '9 bis mon adresse avenue de la paix', 12345, '2017-05-03 12:50:49', '1998-01-30', NULL),
(2, 0, 'Bruce', 'Wayne', 1234568952, 'bruce@wayne.com', 'brucy', 'bb93602ecb4d5003a53edd91e292899d2c4bdd54', 'wayne entreprises', 2666, '2017-05-03 13:03:39', '1982-02-12', 'm'),
(6, 0, 'Toto', 'Toto', 123456789, 'toto@gmail.com', 'toto', '0b9c2625dc21ef05f6ad4ddf47c5f203837aa32c', 'Rue tartanpion', 66666, '2017-05-05 09:17:57', '1998-06-01', 'm');

--
-- Index pour les tables exportées
--

--
-- Index pour la table `articles`
--
ALTER TABLE `articles`
  ADD PRIMARY KEY (`article_id`);

--
-- Index pour la table `categorie`
--
ALTER TABLE `categorie`
  ADD PRIMARY KEY (`categorie_id`),
  ADD UNIQUE KEY `uc_categorie` (`nom`);

--
-- Index pour la table `filtre`
--
ALTER TABLE `filtre`
  ADD PRIMARY KEY (`filtre_id`);

--
-- Index pour la table `marque`
--
ALTER TABLE `marque`
  ADD PRIMARY KEY (`marque_id`),
  ADD UNIQUE KEY `nom` (`nom`);

--
-- Index pour la table `produit`
--
ALTER TABLE `produit`
  ADD PRIMARY KEY (`produit_id`),
  ADD KEY `fk_produit_categorie` (`categorie`),
  ADD KEY `fk_selection` (`selection`),
  ADD KEY `fk_marque` (`marque`),
  ADD KEY `fk_type` (`type`);

--
-- Index pour la table `selection`
--
ALTER TABLE `selection`
  ADD PRIMARY KEY (`selection_id`),
  ADD UNIQUE KEY `nom` (`nom`);

--
-- Index pour la table `type`
--
ALTER TABLE `type`
  ADD PRIMARY KEY (`type_id`),
  ADD UNIQUE KEY `nom` (`nom`);

--
-- Index pour la table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`user_id`);

--
-- AUTO_INCREMENT pour les tables exportées
--

--
-- AUTO_INCREMENT pour la table `articles`
--
ALTER TABLE `articles`
  MODIFY `article_id` int(5) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT pour la table `categorie`
--
ALTER TABLE `categorie`
  MODIFY `categorie_id` int(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT pour la table `filtre`
--
ALTER TABLE `filtre`
  MODIFY `filtre_id` int(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT pour la table `produit`
--
ALTER TABLE `produit`
  MODIFY `produit_id` int(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=112;
--
-- AUTO_INCREMENT pour la table `selection`
--
ALTER TABLE `selection`
  MODIFY `selection_id` int(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT pour la table `user`
--
ALTER TABLE `user`
  MODIFY `user_id` mediumint(8) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;
--
-- Contraintes pour les tables exportées
--

--
-- Contraintes pour la table `produit`
--
ALTER TABLE `produit`
  ADD CONSTRAINT `fk_marque` FOREIGN KEY (`marque`) REFERENCES `marque` (`nom`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_selection` FOREIGN KEY (`selection`) REFERENCES `selection` (`nom`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_type` FOREIGN KEY (`type`) REFERENCES `type` (`nom`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `produit_ibfk_2` FOREIGN KEY (`categorie`) REFERENCES `categorie` (`nom`) ON DELETE SET NULL ON UPDATE CASCADE;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
