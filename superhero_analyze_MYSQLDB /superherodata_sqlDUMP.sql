-- MySQL dump 10.14  Distrib 5.5.60-MariaDB, for Linux (x86_64)
--
-- Host: warehouse    Database: ah3866_superheroesdb
-- ------------------------------------------------------
-- Server version	5.1.73

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `organization`
--

DROP TABLE IF EXISTS `organization`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `organization` (
  `organization_name` varchar(45) NOT NULL,
  `organization_hq` varchar(45) DEFAULT NULL,
  `organization_planet` varchar(45) DEFAULT NULL,
  `organization_ageInCenturies` int(11) DEFAULT NULL,
  `organization_directorAlias` varchar(45) DEFAULT NULL,
  `organization_identityStatus` varchar(45) DEFAULT NULL,
  `organization_primeTransportation` varchar(45) DEFAULT NULL,
  `organization_memberCount` int(11) DEFAULT NULL,
  PRIMARY KEY (`organization_name`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `organization`
--

LOCK TABLES `organization` WRITE;
/*!40000 ALTER TABLE `organization` DISABLE KEYS */;
INSERT INTO `organization` VALUES ('Phantom Sight','Pocket Realm','Crovex',40,'Doctor Fade','Private','Teleporter',153),('The Nova Crusaders','Spaceship Forty','Arieria',10,'Star Master','Public','Spaceship',1046),('Eight Divine','DracGuard','Cryovex',500,'Brother Ariah','Private','Mindhop',8),('Tomorrow Walkers','TimeVortex','Hilonde',1,'TimeKeeper','Private','TimeMachine',9),('Paradox Exiles','Isla Island','Earth',10,'The Night Thief','Public','Ship',78),('Infernal Machines','Underworld BaseZero','Cryovex',999,'Hades','Private','Portal',6667),('Clave of Justice','Torre Alicante','Fantasia',1,'Inquisitor Augustine','Public','Jet',32),('Capricorn Network','Abandoned Field','Earth',1,'Jill','Public','Mobilecar',25),('Mis0rder','Underground Pandemonium','Earth',1,'Chantelle the Oracle','Public','Motorcycle',30000),('Void Gods','Dark City Tower','Fantasia',999,'Hella','Private','AbyssPath',2);
/*!40000 ALTER TABLE `organization` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `planet`
--

DROP TABLE IF EXISTS `planet`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `planet` (
  `planet_technology` varchar(45) DEFAULT NULL,
  `planet_citizenCountB` int(11) DEFAULT NULL,
  `planet_government` varchar(45) DEFAULT NULL,
  `planet_distanceFromEarthAU` int(11) DEFAULT NULL,
  `planet_capitalCity` varchar(45) DEFAULT NULL,
  `planet_name` varchar(45) NOT NULL,
  PRIMARY KEY (`planet_name`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `planet`
--

LOCK TABLES `planet` WRITE;
/*!40000 ALTER TABLE `planet` DISABLE KEYS */;
INSERT INTO `planet` VALUES ('Modern',8,'Varies',0,'Varies','Earth'),('Magic',5,'Council',14,'Merlin','Fantasia'),('Advanced',13,'Monarchy',3,'Solstar','Hilonde'),('Advanced',9,'Democracy',1,'Ravka','Arieria'),('Ancient',1,'Theocratic Oligarcy',9,'Dark City','Cryovex');
/*!40000 ALTER TABLE `planet` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `species`
--

DROP TABLE IF EXISTS `species`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `species` (
  `species_name` varchar(45) NOT NULL,
  `species_planet` varchar(45) DEFAULT NULL,
  `species_biology` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`species_name`),
  KEY `species_planet` (`species_planet`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `species`
--

LOCK TABLES `species` WRITE;
/*!40000 ALTER TABLE `species` DISABLE KEYS */;
INSERT INTO `species` VALUES ('Faerie','Fantasia','half demon half angel'),('Animorph','Earth','part beast part evolved human'),('DemiGod','Hilonde','part god part evolved human'),('Djinni','Fantasia','part witch part demon summoning blood flow'),('Wielder','Hilonde','advanced being using element receptors'),('Cyborg','Hilonde','technically advanced high intelligence'),('Sorcerer','The Unknown','dark being light magic blood flow'),('Banshee','Cryovex','carrying out death transition to afterlife'),('Gree','Hilonde','advanced strength alien'),('Human','Earth','mundane strength mundane intelligence');
/*!40000 ALTER TABLE `species` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `superhero`
--

DROP TABLE IF EXISTS `superhero`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `superhero` (
  `superhero_lastName` varchar(45) DEFAULT NULL,
  `superhero_firstName` varchar(45) DEFAULT NULL,
  `superhero_gender` varchar(45) DEFAULT NULL,
  `superhero_species` varchar(45) DEFAULT NULL,
  `superhero_alias` varchar(45) DEFAULT NULL,
  `superhero_primePower` varchar(45) DEFAULT NULL,
  `superhero_affiliation` varchar(45) DEFAULT NULL,
  `superhero_powerTier` int(11) DEFAULT NULL,
  `superhero_id` int(20) NOT NULL,
  PRIMARY KEY (`superhero_id`),
  KEY `superhero_species` (`superhero_species`),
  KEY `superhero_affiliation` (`superhero_affiliation`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `superhero`
--

LOCK TABLES `superhero` WRITE;
/*!40000 ALTER TABLE `superhero` DISABLE KEYS */;
INSERT INTO `superhero` VALUES ('Egerford','Illias','Male','Sorcerer','Master of Abyss','SpaceWarp','Eight Divine',10,1),('Townstar','Arther','Male','Wielder','Doctor SpaceTime','TimeTravel','Tomorrow Walkers',9,2),('Penneman','Myriad','NonBinary','Sorcerer','The Myriad','RealityWarp','Eight Divine',10,3),('Galan','Feyre','Female','Banshee','Soul Screamer','DeathManipulation','Hades Hydra',8,4),('Decaux','Tekrin','Male','Cyborg','Megaboard','MindManipulation','Tech Rebellion',6,5),('Eastwood','Luke','Male','Human','Claw','AnimalCommunication','Capricorn Network',2,6),('Smithwood','Gloriela','Female','Cyborg','AVA.','SuperHack','Clave of Justice',5,7),('Trioloj','Kanin','Male','Djinni','Wishbone','FateManipulator','Rogue',7,8),('Gruber','Damionus','NonBinary','DemiGod','Damionus','LightningControl','Void Gods',7,9),('Levi','Philemon','Male','Human','The Continuum Scientist','Quantum Physics High Intelligence','Tomorrow Walkers',3,10),('Scratch','Gaspar','Male','Devil Incarnate','DarkWhisperer','Fear Creator','Infernal Machines',9,12),('Grete','Aeliet','Female','Faerie','Whisper','Desire Creator','Infernal Machines',9,13),('Gjinali','Kala','Female','Djinni','Magnificent','Unlimited Wishgranting','Void Gods',7,14),('Allen','Serena','Female','Animorph','Vigilante','Unlimited Shapeshifting by Sight','Capricorn Network',3,15),('Archeron','Aliss','Female','Metahuman','Robinhood','DestructionTouch','Mis0rder',8,16);
/*!40000 ALTER TABLE `superhero` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2019-04-23 23:40:30
