-- MySQL dump 10.16  Distrib 10.1.48-MariaDB, for debian-linux-gnu (x86_64)
--
-- Host: localhost    Database: POKEMMO_BAIES
-- ------------------------------------------------------
-- Server version	10.1.48-MariaDB-0+deb9u2

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


--
-- Table structure for table `BAIES`
--

DROP TABLE IF EXISTS `BAIES`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `BAIES` (
  `Numero` int(3) NOT NULL AUTO_INCREMENT,
  `Baie` varchar(255) NOT NULL,
  `Effet` longtext NOT NULL,
  `EPICE` varchar(20) DEFAULT NULL,
  `SEC` varchar(20) DEFAULT NULL,
  `SUCRE` varchar(20) DEFAULT NULL,
  `AMER` varchar(20) DEFAULT NULL,
  `ACIDE` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`Numero`),
  UNIQUE KEY `EPICE` (`EPICE`,`SEC`,`SUCRE`,`AMER`,`ACIDE`)
) ENGINE=InnoDB AUTO_INCREMENT=65 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `BAIES`
--

LOCK TABLES `BAIES` WRITE;
/*!40000 ALTER TABLE `BAIES` DISABLE KEYS */;
INSERT INTO `BAIES` VALUES (1,'Ceriz ',' Soigne la paralysie','très épicé (3)','—','—','—','—'),(2,'Maron ',' Soigne le sommeil','—','très sec (3)','—','—','—'),(3,'Pêcha ',' Soigne l\'empoisonnement','—','—','très sucré (3)','—','—'),(4,'Fraive ',' Soigne la brûlure','—','—','—','très amer (3)','—'),(5,'Willia ',' Soigne le gel','—','—','—','—','très acide (3)'),(6,'Mepo ',' Restaure 10 PP','très épicé (2)','—','sucré (1)','amer (1)','—'),(7,'Oran ',' Restaure 10 PV','—','sec (1)','—','amer (1)','acide (1)'),(8,'Kika ',' Soigne la confusion','épicé (1)','sec (1)','sucré (1)','—','—'),(9,'Prine ',' Soigne tout changement de statut','très épicé (2)','très sec (2)','très sucré (2)','—','—'),(10,'Sitrus ',' Restaure 30 PV (en restaure 1/4 depuis la quatrième génération)','—','—','très sucré (2)','très amer (2)','très acide (2)'),(11,'Figuy ',' Restaure 1/8è des PV max, rend confus un Pokémon n\'appréciant pas les Baies épicées','très épicé (4)','—','—','—','—'),(12,'Wiki ',' Restaure 1/8è des PV max, rend confus un Pokémon n\'appréciant pas les Baies sèches','—','très sec (4)','—','—','—'),(13,'Mago ',' Restaure 1/8è des PV max, rend confus un Pokémon n\'appréciant pas les Baies sucrées','—','—','très sucré (4)','—','—'),(14,'Gowav ',' Restaure 1/8è des PV max, rend confus un Pokémon n\'appréciant pas les Baies amères','—','—','—','très amer (4)','—'),(15,'Papaya ',' Restaure 1/8è des PV max, rend confus un Pokémon n\'appréciant pas les Baies acides','—','—','—','—','très acide (4)'),(16,'Framby ',' Ingrédient de Pokéblocs et Poffins','épicé (1)','très sec (2)','—','—','—'),(17,'Remu ',' Ingrédient de Pokéblocs et Poffins','—','sec (1)','très sucré (2)','—','—'),(18,'Nanab ',' Ingrédient de Pokéblocs et Poffins','—','—','très sucré (2)','amer (1)','—'),(19,'Repoi ',' Ingrédient de Pokéblocs et Poffins','—','—','—','amer (1)','très acide (2)'),(20,'Nanana ',' Ingrédient de Pokéblocs et Poffins','épicé (1)','—','—','—','très acide (2)'),(21,'Grena ',' Diminue de 10 EV en PV, augmente le bonheur (depuis Pokémon Émeraude\')','très épicé (3)','—','—','amer (1)','—'),(22,'Alga ',' Diminue de 10 EV en attaque, augmente le bonheur (depuis Pokémon Émeraude\')','—','très sec (3)','—','—','acide (1)'),(23,'Qualot ',' Diminue de 10 EV en défense, augmente le bonheur (depuis Pokémon Émeraude\')','épicé (1)','—','très sucré (3)','—','—'),(24,'Lonme ',' Diminue de 10 EV en Attaque Spéciale, augmente le bonheur (depuis Pokémon Émeraude\')','—','sec (1)','—','très amer (3)','—'),(25,'Resin ',' Diminue de 10 EV en Défense Spéciale, augmente le bonheur (depuis Pokémon Émeraude\')','—','—','sucré (1)','—','très acide (3)'),(26,'Tamato ',' Diminue de 10 EV en vitesse, augmente le bonheur (depuis Pokémon Émeraude\')','très épicé (3)','sec (1)','—','—','—'),(27,'Siam ',' Ingrédient de Pokéblocs et Poffins','—','très sec (3)','sucré (1)','—','—'),(28,'Mangou ',' Ingrédient de Pokéblocs et Poffins','—','—','très sucré (3)','amer (1)','—'),(29,'Rabuta ',' Ingrédient de Pokéblocs et Poffins','—','—','—','très amer (3)','acide (1)'),(30,'Tronci ',' Ingrédient de Pokéblocs et Poffins','épicé (1)','—','—','—','très acide (3)'),(31,'Kiwan ',' Ingrédient de Pokéblocs et Poffins','très épicé (4)','sec (1)','—','—','—'),(32,'Palma ',' Ingrédient de Pokéblocs et Poffins','—','très sec (4)','sucré (1)','—','—'),(33,'Stekpa ',' Ingrédient de Pokéblocs et Poffins','—','—','très sucré (4)','amer (1)','—'),(34,'Durin ',' Ingrédient de Pokéblocs et Poffins','—','—','—','très amer (4)','acide (1)'),(35,'Myrte ',' Ingrédient de Pokéblocs et Poffins','épicé (1)','— ','—','—','très acide (4)'),(36,'Lichii ',' Augmente d\'un niveau l\'attaque lorsque les PV du Pokémon passent sous 1/3 de ses PV max','très épicé (2)','sec (1)','très sucré (2)','—','—'),(37,'Lingan ',' Augmente d\'un niveau la défense lorsque les PV du Pokémon passent sous 1/3 de ses PV max','—','très sec (2)','sucré (1)','très amer (2)','—'),(38,'Sailak ',' Augmente d\'un niveau la vitesse lorsque les PV du Pokémon passent sous 1/3 de ses PV max','—','—','très sucré (2)','amer (1)','très acide (2)'),(39,'Pitaye ',' Augmente d\'un niveau l\'Attaque Spéciale lorsque les PV du Pokémon passent sous 1/3 de ses PV max','très épicé (2)','—','—','très amer (2)','acide (1)'),(40,'Abriko ',' Augmente d\'un niveau la Défense Spéciale lorsque les PV du Pokémon passent sous 1/3 de ses PV max','épicé (1)','très sec (2)','—','—','très acide (2)'),(41,'Lansat ',' Augmente d\'un niveau le taux de coups critiques lorsque les PV du Pokémon passent sous 1/3 de ses PV max','très épicé (2)','—','très sucré (2)','—','très acide (2)'),(42,'Frista ',' Augmente de deux niveaux une statistique lorsque les PV du Pokémon passent sous 1/3 de ses PV max','—','très sec (2)','très sucré (2)','très amer (2)','—'),(43,'Enigma ',' Restaure 1/4 des PV du Pokémon lorsqu\'il est touché par une attaque super efficace','très épicé (4)','très sec (2) ','—','—','—'),(44,'Chocco ',' Divise par 2 les dégâts occasionnés par une attaque de type feu super efficace','très épicé (3)','—','très sucré (2)','—','—'),(45,'Pocpoc ',' Divise par 2 les dégâts occasionnés par une attaque de type eau super efficace','—','très sec (3)','—','très amer (2)','—'),(46,'Parma ',' Divise par 2 les dégâts occasionnés par une attaque de type Électrik super efficace','—','—','très sucré (3)','—','très acide (2)'),(47,'Ratam ',' Divise par 2 les dégâts occasionnés par une attaque de type plante super efficace','très épicé (2)','—','—','très amer (3)','—'),(48,'Nanone ',' Divise par 2 les dégâts occasionnés par une attaque de type glace super efficace','—','très sec (2)','—','—','très acide (3)'),(49,'Pomroz ',' Divise par 2 les dégâts occasionnés par une attaque de type Combat super efficace','très épicé (3)','—','—','très amer (2)','—'),(50,'Kébia ',' Divise par 2 les dégâts occasionnés par une attaque de type poison super efficace','—','très sec (3)','—','—','très acide (2)'),(51,'Jouca ',' Divise par 2 les dégâts occasionnés par une attaque de type sol super efficace','très épicé (2)','—','très sucré (3)','—','—'),(52,'Cobaba ',' Divise par 2 les dégâts occasionnés par une attaque de type vol super efficace','—','très sec (2)','—','très amer (3)','—'),(53,'Yapap ',' Divise par 2 les dégâts occasionnés par une attaque de type psy super efficace','—','—','très sucré (2)','—','très acide (3)'),(54,'Panga ',' Divise par 2 les dégâts occasionnés par une attaque de type insecte super efficace','très épicé (3)','—','—','—','très acide (2)'),(55,'Charti ',' Divise par 2 les dégâts occasionnés par une attaque de type roche super efficace','très épicé (2)','très sec (3)','—','—','—'),(56,'Sédra ',' Divise par 2 les dégâts occasionnés par une attaque de type Spectre super efficace','—','très sec (2)','très sucré (3)','—','—'),(57,'Fraigo ',' Divise par 2 les dégâts occasionnés par une attaque de type Dragon super efficace','—','—','très sucré (2)','très amer (3)','—'),(58,'Lampou ',' Divise par 2 les dégâts occasionnés par une attaque de type Ténèbres super efficace','très épicé (2)','—','—','—','très acide (3)'),(59,'Babiri ',' Divise par 2 les dégâts occasionnés par une attaque de type acier super efficace','très épicé (3)','très sec (2)','—','—','—'),(60,'Zalis ',' Divise par 2 les dégâts occasionnés par la première attaque de type normal encaissée.','—','très sec (3)','très sucré (2)','—','—'),(61,'Micle ',' Augmente la précision d\'une attaque pour un tour','—','très sec (4)','très sucré (2)','—','—'),(62,'Chérim ',' Le Pokémon attaquera en premier pour un tour','—','—','très sucré (4)','très amer (2)','—'),(63,'Jaboca ',' Inflige des dégâts de contrecoup à un adversaire utilisant une attaque physique','—','—','—','très amer (4)','très acide (2)'),(64,'Pommo ',' Inflige des dégâts de contrecoup à un adversaire utilisant une Attaque Spéciale','très épicé (2)','—','—','—','très acide (4)');
/*!40000 ALTER TABLE `BAIES` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `CROISSANCE`
--

DROP TABLE IF EXISTS `CROISSANCE`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `CROISSANCE` (
  `BAIE` int(3) NOT NULL,
  `DUREE_H` int(3) NOT NULL,
  `ARROSAGE_H` int(3) NOT NULL DEFAULT '5',
  `FLETRISSEMENT_H` int(3) NOT NULL DEFAULT '6',
  PRIMARY KEY (`BAIE`),
  CONSTRAINT `CROISSANCE_ibfk_1` FOREIGN KEY (`BAIE`) REFERENCES `BAIES` (`Numero`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `CROISSANCE`
--

LOCK TABLES `CROISSANCE` WRITE;
/*!40000 ALTER TABLE `CROISSANCE` DISABLE KEYS */;
INSERT INTO `CROISSANCE` VALUES (1,16,8,7),(2,16,8,7),(3,16,8,7),(4,16,8,7),(5,16,8,7),(6,20,8,7),(7,16,8,7),(8,16,8,7),(9,44,10,7),(10,44,10,7),(11,20,8,7),(12,20,8,7),(13,20,8,7),(14,20,8,7),(15,20,8,7),(16,16,8,7),(17,16,8,7),(18,16,8,7),(19,16,8,7),(20,16,8,7),(21,44,10,7),(22,44,10,7),(23,44,10,7),(24,44,10,7),(25,44,10,7),(26,44,10,7),(27,20,8,7),(28,20,8,7),(29,20,8,7),(30,20,8,7),(31,42,10,7),(32,42,10,7),(33,42,10,7),(34,42,10,7),(35,42,10,7),(36,67,10,7),(37,67,10,7),(38,67,10,7),(39,67,10,7),(40,67,10,7),(41,67,10,7),(42,67,10,7),(43,42,10,7),(44,42,10,7),(45,42,10,7),(46,42,10,7),(47,42,10,7),(48,42,10,7),(49,42,10,7),(50,42,10,7),(51,42,10,7),(52,42,10,7),(53,42,10,7),(54,42,10,7),(55,42,10,7),(56,42,10,7),(57,42,10,7),(58,42,10,7),(59,42,10,7),(60,42,10,7),(61,44,10,7),(62,44,10,7),(63,44,10,7),(64,44,10,7);
/*!40000 ALTER TABLE `CROISSANCE` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `EMPLACEMENTS`
--

DROP TABLE IF EXISTS `EMPLACEMENTS`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `EMPLACEMENTS` (
  `No_EMPLACEMENT` varchar(8) NOT NULL,
  `ROUTE` varchar(20) NOT NULL,
  `EMPLACEMENT` int(2) DEFAULT NULL,
  PRIMARY KEY (`No_EMPLACEMENT`),
  KEY `ROUTE` (`ROUTE`),
  CONSTRAINT `EMPLACEMENTS_ibfk_1` FOREIGN KEY (`ROUTE`) REFERENCES `ROUTES` (`Numero_Route`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `EMPLACEMENTS`
--

LOCK TABLES `EMPLACEMENTS` WRITE;
/*!40000 ALTER TABLE `EMPLACEMENTS` DISABLE KEYS */;
INSERT INTO `EMPLACEMENTS` VALUES ('AA-E01','AUT.ABONDANCE',1),('AA-E02','AUT.ABONDANCE',2),('AA-E03','AUT.ABONDANCE',3),('AA-E04','AUT.ABONDANCE',4),('AA-E05','AUT.ABONDANCE',5),('AA-E06','AUT.ABONDANCE',6),('AA-E07','AUT.ABONDANCE',7),('AA-E08','AUT.ABONDANCE',8),('AA-E09','AUT.ABONDANCE',9),('AA-E10','AUT.ABONDANCE',10),('AA-E11','AUT.ABONDANCE',11),('AA-E12','AUT.ABONDANCE',12),('AA-E13','AUT.ABONDANCE',13),('AA-E14','AUT.ABONDANCE',14),('AA-E15','AUT.ABONDANCE',15),('AA-E16','AUT.ABONDANCE',16),('AA-E17','AUT.ABONDANCE',17),('AA-E18','AUT.ABONDANCE',18),('AA-E19','AUT.ABONDANCE',19),('AA-E20','AUT.ABONDANCE',20),('AA-E21','AUT.ABONDANCE',21),('AA-E22','AUT.ABONDANCE',22),('AA-E23','AUT.ABONDANCE',23),('AA-E24','AUT.ABONDANCE',24),('AA-E25','AUT.ABONDANCE',25),('AA-E26','AUT.ABONDANCE',26),('AA-E27','AUT.ABONDANCE',27),('AA-E28','AUT.ABONDANCE',28),('AA-E29','AUT.ABONDANCE',29),('AA-E30','AUT.ABONDANCE',30),('AA-E31','AUT.ABONDANCE',31),('AA-E32','AUT.ABONDANCE',32),('AA-E33','AUT.ABONDANCE',33),('AA-E34','AUT.ABONDANCE',34),('AA-E35','AUT.ABONDANCE',35),('AA-E36','AUT.ABONDANCE',36),('AA-E37','AUT.ABONDANCE',37),('AA-E38','AUT.ABONDANCE',38),('AA-E39','AUT.ABONDANCE',39),('AA-E40','AUT.ABONDANCE',40),('AA-E41','AUT.ABONDANCE',41),('AA-E42','AUT.ABONDANCE',42),('AA-E43','AUT.ABONDANCE',43),('AA-E44','AUT.ABONDANCE',44),('AA-E45','AUT.ABONDANCE',45),('AA-E46','AUT.ABONDANCE',46),('AA-E47','AUT.ABONDANCE',47),('AA-E48','AUT.ABONDANCE',48),('AA-E49','AUT.ABONDANCE',49),('AA-E50','AUT.ABONDANCE',50),('AA-E51','AUT.ABONDANCE',51),('AA-E52','AUT.ABONDANCE',52),('AA-E53','AUT.ABONDANCE',53),('AA-E54','AUT.ABONDANCE',54),('AA-E55','AUT.ABONDANCE',55),('AA-E56','AUT.ABONDANCE',56),('AA-E57','AUT.ABONDANCE',57),('AA-E58','AUT.ABONDANCE',58),('AA-E59','AUT.ABONDANCE',59),('AA-E60','AUT.ABONDANCE',60),('AA-E61','AUT.ABONDANCE',61),('AA-E62','AUT.ABONDANCE',62),('AA-E63','AUT.ABONDANCE',63),('AA-E64','AUT.ABONDANCE',64),('AA-E65','AUT.ABONDANCE',65),('AA-E66','AUT.ABONDANCE',66),('AA-E67','AUT.ABONDANCE',67),('AA-E68','AUT.ABONDANCE',68),('AA-E69','AUT.ABONDANCE',69),('AA-E70','AUT.ABONDANCE',70),('AA-E71','AUT.ABONDANCE',71),('AA-E72','AUT.ABONDANCE',72),('AA-E73','AUT.ABONDANCE',73),('AA-E74','AUT.ABONDANCE',74),('AA-E75','AUT.ABONDANCE',75),('AA-E76','AUT.ABONDANCE',76),('AA-E77','AUT.ABONDANCE',77),('AA-E78','AUT.ABONDANCE',78),('AA-E79','AUT.ABONDANCE',79),('AA-E80','AUT.ABONDANCE',80),('AA-E81','AUT.ABONDANCE',81),('AA-E82','AUT.ABONDANCE',82),('AA-E83','AUT.ABONDANCE',83),('AA-E84','AUT.ABONDANCE',84),('Pa-E01','PARSEMILLE',1),('Pa-E02','PARSEMILLE',2),('Pa-E03','PARSEMILLE',3),('Pa-E04','PARSEMILLE',4),('Pa-E05','PARSEMILLE',5),('Pa-E06','PARSEMILLE',6),('Pa-E07','PARSEMILLE',7),('Pa-E08','PARSEMILLE',8),('Pa-E09','PARSEMILLE',9),('Pa-E10','PARSEMILLE',10),('Pa-E11','PARSEMILLE',11),('Pa-E12','PARSEMILLE',12),('Pa-E13','PARSEMILLE',13),('Pa-E14','PARSEMILLE',14),('Pa-E15','PARSEMILLE',15),('Pa-E16','PARSEMILLE',16),('Pa-E17','PARSEMILLE',17),('Pa-E18','PARSEMILLE',18),('Pa-E19','PARSEMILLE',19),('Pa-E20','PARSEMILLE',20),('Pa-E21','PARSEMILLE',21),('Pa-E22','PARSEMILLE',22),('Pa-E23','PARSEMILLE',23),('Pa-E24','PARSEMILLE',24),('Pa-E25','PARSEMILLE',25),('Pa-E26','PARSEMILLE',26),('Pa-E27','PARSEMILLE',27),('Pa-E28','PARSEMILLE',28),('Pa-E29','PARSEMILLE',29),('Pa-E30','PARSEMILLE',30),('Pa-E31','PARSEMILLE',31),('Pa-E32','PARSEMILLE',32),('Pa-E33','PARSEMILLE',33),('Pa-E34','PARSEMILLE',34),('Pa-E35','PARSEMILLE',35),('Pa-E36','PARSEMILLE',36),('Pa-E37','PARSEMILLE',37),('Pa-E38','PARSEMILLE',38),('Pa-E39','PARSEMILLE',39),('Pa-E40','PARSEMILLE',40),('Pa-E41','PARSEMILLE',41),('Pa-E42','PARSEMILLE',42),('Pa-E43','PARSEMILLE',43),('Pa-E44','PARSEMILLE',44),('Pa-E45','PARSEMILLE',45),('Pa-E46','PARSEMILLE',46),('Pa-E47','PARSEMILLE',47),('Pa-E48','PARSEMILLE',48),('Pa-E49','PARSEMILLE',49),('Pa-E50','PARSEMILLE',50),('Pa-E51','PARSEMILLE',51),('Pa-E52','PARSEMILLE',52),('Pa-E53','PARSEMILLE',53),('Pa-E54','PARSEMILLE',54),('Pa-E55','PARSEMILLE',55),('Pa-E56','PARSEMILLE',56),('Pa-E57','PARSEMILLE',57),('Pa-E58','PARSEMILLE',58),('Pa-E59','PARSEMILLE',59),('Pa-E60','PARSEMILLE',60),('Pa-E61','PARSEMILLE',61),('Pa-E62','PARSEMILLE',62),('Pa-E63','PARSEMILLE',63),('Pa-E64','PARSEMILLE',64),('Pa-E65','PARSEMILLE',65),('Pa-E66','PARSEMILLE',66),('Pa-E67','PARSEMILLE',67),('Pa-E68','PARSEMILLE',68),('Pa-E69','PARSEMILLE',69),('Pa-E70','PARSEMILLE',70),('Pa-E71','PARSEMILLE',71),('Pa-E72','PARSEMILLE',72),('R104-E01','ROUTE 104',1),('R104-E02','ROUTE 104',2),('R104-E03','ROUTE 104',3),('R104-E04','ROUTE 104',4),('R104-E05','ROUTE 104',5),('R104-E06','ROUTE 104',6),('R104-E07','ROUTE 104',7),('R104-E08','ROUTE 104',8),('R104-E09','ROUTE 104',9),('R104-E10','ROUTE 104',10),('R104-E11','ROUTE 104',11),('R120-E01','ROUTE 120',1),('R120-E02','ROUTE 120',2),('R120-E03','ROUTE 120',3),('R120-E04','ROUTE 120',4),('R120-E05','ROUTE 120',5),('R120-E06','ROUTE 120',6),('R120-E07','ROUTE 120',7),('R120-E08','ROUTE 120',8),('R120-E09','ROUTE 120',9),('R120-E10','ROUTE 120',10),('R123-E01','ROUTE 123',1),('R123-E02','ROUTE 123',2),('R123-E03','ROUTE 123',3),('R123-E04','ROUTE 123',4),('R123-E05','ROUTE 123',5),('R123-E06','ROUTE 123',6),('R123-E07','ROUTE 123',7),('R123-E08','ROUTE 123',8),('R123-E09','ROUTE 123',9),('R123-E10','ROUTE 123',10),('R123-E11','ROUTE 123',11),('R123-E12','ROUTE 123',12);
/*!40000 ALTER TABLE `EMPLACEMENTS` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ETAT_PLANTE`
--

DROP TABLE IF EXISTS `ETAT_PLANTE`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ETAT_PLANTE` (
  `ID` char(1) NOT NULL,
  `ETAT` varchar(9) NOT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ETAT_PLANTE`
--

LOCK TABLES `ETAT_PLANTE` WRITE;
/*!40000 ALTER TABLE `ETAT_PLANTE` DISABLE KEYS */;
INSERT INTO `ETAT_PLANTE` VALUES ('0','HARVESTED'),('1','SEEDED'),('2','DEAD'),('3','TEMPLATE');
/*!40000 ALTER TABLE `ETAT_PLANTE` ENABLE KEYS */;
UNLOCK TABLES;


--
-- Table structure for table `ROUTES`
--

DROP TABLE IF EXISTS `ROUTES`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ROUTES` (
  `Numero_Route` varchar(20) NOT NULL,
  `Localisation` varchar(255) NOT NULL,
  `Emplacements` int(3) NOT NULL,
  PRIMARY KEY (`Numero_Route`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ROUTES`
--

LOCK TABLES `ROUTES` WRITE;
/*!40000 ALTER TABLE `ROUTES` DISABLE KEYS */;
INSERT INTO `ROUTES` VALUES ('AUT.ABONDANCE','Autel Abondance près de la Forêt Blanche ou Ville noire',84),('PARSEMILLE','Ville de Parsemille (Unys)',72),('ROUTE 104','Sud de Mérouville',11),('ROUTE 120','Est de Cimetronelle',10),('ROUTE 123','Est de Lavandia',12);
/*!40000 ALTER TABLE `ROUTES` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2022-06-11 17:23:00
