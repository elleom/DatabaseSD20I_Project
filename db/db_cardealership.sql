-- MySQL dump 10.13  Distrib 8.0.21, for Win64 (x86_64)
--
-- Host: localhost    Database: car_dealership
-- ------------------------------------------------------
-- Server version	8.0.21

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `audit`
--

DROP TABLE IF EXISTS `audit`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `audit` (
  `ID` int NOT NULL AUTO_INCREMENT,
  `type` varchar(100) NOT NULL,
  `date` date NOT NULL,
  `user` varchar(45) NOT NULL,
  `detail` varchar(255) NOT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `ID_UNIQUE` (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `audit`
--

LOCK TABLES `audit` WRITE;
/*!40000 ALTER TABLE `audit` DISABLE KEYS */;
INSERT INTO `audit` VALUES (1,'registration','2020-12-11','www-data','Reg'),(2,'registration','2020-12-11','www-data','audit2'),(3,'registration','2020-12-11','www-data','audit3'),(4,'delete','2020-12-11','root@localhost','audit3'),(8,'registration','2020-12-12','root@localhost','testrole'),(9,'registration','2020-12-12','root@localhost','testrole2');
/*!40000 ALTER TABLE `audit` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `carsavailable`
--

DROP TABLE IF EXISTS `carsavailable`;
/*!50001 DROP VIEW IF EXISTS `carsavailable`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `carsavailable` AS SELECT 
 1 AS `Build Year`,
 1 AS `Kms`,
 1 AS `DKK`,
 1 AS `available`,
 1 AS `colour`,
 1 AS `Make`,
 1 AS `Model`,
 1 AS `Seller`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `carslisted`
--

DROP TABLE IF EXISTS `carslisted`;
/*!50001 DROP VIEW IF EXISTS `carslisted`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `carslisted` AS SELECT 
 1 AS `Build Year`,
 1 AS `Kms`,
 1 AS `DKK`,
 1 AS `available`,
 1 AS `colour`,
 1 AS `Make`,
 1 AS `Model`,
 1 AS `Seller`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `carsnotavailable`
--

DROP TABLE IF EXISTS `carsnotavailable`;
/*!50001 DROP VIEW IF EXISTS `carsnotavailable`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `carsnotavailable` AS SELECT 
 1 AS `Build Year`,
 1 AS `Kms`,
 1 AS `DKK`,
 1 AS `available`,
 1 AS `colour`,
 1 AS `Make`,
 1 AS `Model`,
 1 AS `Seller`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `invoice`
--

DROP TABLE IF EXISTS `invoice`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `invoice` (
  `ID` int NOT NULL AUTO_INCREMENT,
  `date` date NOT NULL,
  `amount` int NOT NULL,
  `order_id` int NOT NULL,
  `user_id` int NOT NULL,
  PRIMARY KEY (`ID`,`order_id`,`user_id`),
  UNIQUE KEY `ID_UNIQUE` (`ID`),
  KEY `generates` (`order_id`),
  KEY `fk_invoice_users1_idx` (`user_id`),
  CONSTRAINT `fk_invoice_users1` FOREIGN KEY (`user_id`) REFERENCES `users` (`ID`),
  CONSTRAINT `generates` FOREIGN KEY (`order_id`) REFERENCES `orders` (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `invoice`
--

LOCK TABLES `invoice` WRITE;
/*!40000 ALTER TABLE `invoice` DISABLE KEYS */;
INSERT INTO `invoice` VALUES (7,'2020-12-08',10000,2,2);
/*!40000 ALTER TABLE `invoice` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `location`
--

DROP TABLE IF EXISTS `location`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `location` (
  `ID` int NOT NULL AUTO_INCREMENT,
  `postal_code` int NOT NULL,
  `name` varchar(45) NOT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `postalCode` (`postal_code`),
  UNIQUE KEY `ID_UNIQUE` (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=26 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `location`
--

LOCK TABLES `location` WRITE;
/*!40000 ALTER TABLE `location` DISABLE KEYS */;
INSERT INTO `location` VALUES (1,2500,'Valby'),(2,2600,'Glostrup'),(3,2605,'Brøndby'),(4,2610,'Rødovre'),(5,2620,'Albertslund'),(6,2625,'Vallensbæk'),(7,2630,'Taastrup'),(8,2633,'Taastrup'),(9,2635,'Ishøj'),(10,2640,'Hedehusene'),(11,2650,'Hvidovre'),(12,2660,'Brøndby Strand'),(13,2665,'Vallensbæk Strand'),(14,2670,'Greve'),(15,2680,'Solrød Strand'),(16,2690,'Karlslunde'),(17,2700,'Brønshøj'),(18,2720,'Vanløse'),(19,2730,'Herlev'),(20,2740,'Skovlunde'),(21,2750,'Ballerup'),(22,2760,'Måløv'),(23,2765,'Smørum'),(24,2770,'Kastrup'),(25,2791,'Dragør');
/*!40000 ALTER TABLE `location` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `make`
--

DROP TABLE IF EXISTS `make`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `make` (
  `ID` int NOT NULL AUTO_INCREMENT,
  `code` varchar(20) NOT NULL,
  `name` varchar(20) NOT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `name` (`code`),
  UNIQUE KEY `ID_UNIQUE` (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=72 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `make`
--

LOCK TABLES `make` WRITE;
/*!40000 ALTER TABLE `make` DISABLE KEYS */;
INSERT INTO `make` VALUES (1,'ACURA','Acura'),(2,'ALFA','Alfa Romeo'),(3,'AMC','AMC'),(4,'ASTON','Aston Martin'),(5,'AUDI','Audi'),(6,'AVANTI','Avanti'),(7,'BENTL','Bentley'),(8,'BMW','BMW'),(9,'BUICK','Buick'),(10,'CAD','Cadillac'),(11,'CHEV','Chevrolet'),(12,'CHRY','Chrysler'),(13,'DAEW','Daewoo'),(14,'DAIHAT','Daihatsu'),(15,'DATSUN','Datsun'),(16,'DELOREAN','DeLorean'),(17,'DODGE','Dodge'),(18,'EAGLE','Eagle'),(19,'FER','Ferrari'),(20,'FIAT','FIAT'),(21,'FISK','Fisker'),(22,'FORD','Ford'),(23,'FREIGHT','Freightliner'),(24,'GEO','Geo'),(25,'GMC','GMC'),(26,'HONDA','Honda'),(27,'AMGEN','HUMMER'),(28,'HYUND','Hyundai'),(29,'INFIN','Infiniti'),(30,'ISU','Isuzu'),(31,'JAG','Jaguar'),(32,'JEEP','Jeep'),(33,'KIA','Kia'),(34,'LAM','Lamborghini'),(35,'LAN','Lancia'),(36,'ROV','Land Rover'),(37,'LEXUS','Lexus'),(38,'LINC','Lincoln'),(39,'LOTUS','Lotus'),(40,'MAS','Maserati'),(41,'MAYBACH','Maybach'),(42,'MAZDA','Mazda'),(43,'MCLAREN','McLaren'),(44,'MB','Mercedes-Benz'),(45,'MERC','Mercury'),(46,'MERKUR','Merkur'),(47,'MINI','MINI'),(48,'MIT','Mitsubishi'),(49,'NISSAN','Nissan'),(50,'OLDS','Oldsmobile'),(51,'PEUG','Peugeot'),(52,'PLYM','Plymouth'),(53,'PONT','Pontiac'),(54,'POR','Porsche'),(55,'RAM','RAM'),(56,'REN','Renault'),(57,'RR','Rolls-Royce'),(58,'SAAB','Saab'),(59,'SATURN','Saturn'),(60,'SCION','Scion'),(61,'SMART','smart'),(62,'SRT','SRT'),(63,'STERL','Sterling'),(64,'SUB','Subaru'),(65,'SUZUKI','Suzuki'),(66,'TESLA','Tesla'),(67,'TOYOTA','Toyota'),(68,'TRI','Triumph'),(69,'VOLKS','Volkswagen'),(70,'VOLVO','Volvo'),(71,'YUGO','Yugo');
/*!40000 ALTER TABLE `make` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `model`
--

DROP TABLE IF EXISTS `model`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `model` (
  `ID` int NOT NULL AUTO_INCREMENT,
  `name` varchar(125) NOT NULL,
  `code` varchar(125) NOT NULL,
  `make_id` int NOT NULL,
  PRIMARY KEY (`ID`,`make_id`),
  UNIQUE KEY `ID_UNIQUE` (`ID`),
  KEY `name` (`name`),
  KEY `build` (`make_id`),
  CONSTRAINT `build` FOREIGN KEY (`make_id`) REFERENCES `make` (`ID`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE=InnoDB AUTO_INCREMENT=1315 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `model`
--

LOCK TABLES `model` WRITE;
/*!40000 ALTER TABLE `model` DISABLE KEYS */;
INSERT INTO `model` VALUES (1,'CL Models (4)','CL_MODELS',1),(2,' - 2.2CL','2.2CL',1),(3,' - 2.3CL','2.3CL',1),(4,' - 3.0CL','3.0CL',1),(5,' - 3.2CL','3.2CL',1),(6,'ILX','ILX',1),(7,'Integra','INTEG',1),(8,'Legend','LEGEND',1),(9,'MDX','MDX',1),(10,'NSX','NSX',1),(11,'RDX','RDX',1),(12,'RL Models (2)','RL_MODELS',1),(13,' - 3.5 RL','3.5RL',1),(14,' - RL','RL',1),(15,'RSX','RSX',1),(16,'SLX','SLX',1),(17,'TL Models (3)','TL_MODELS',1),(18,' - 2.5TL','2.5TL',1),(19,' - 3.2TL','3.2TL',1),(20,' - TL','TL',1),(21,'TSX','TSX',1),(22,'Vigor','VIGOR',1),(23,'ZDX','ZDX',1),(24,'Other Acura Models','ACUOTH',1),(25,'164','ALFA164',2),(26,'8C Competizione','ALFA8C',2),(27,'GTV-6','ALFAGT',2),(28,'Milano','MIL',2),(29,'Spider','SPID',2),(30,'Other Alfa Romeo Models','ALFAOTH',2),(31,'Alliance','AMCALLIAN',3),(32,'Concord','CON',3),(33,'Eagle','EAGLE',3),(34,'Encore','AMCENC',3),(35,'Spirit','AMCSPIRIT',3),(36,'Other AMC Models','AMCOTH',3),(37,'DB7','DB7',4),(38,'DB9','DB9',4),(39,'DBS','DBS',4),(40,'Lagonda','LAGONDA',4),(41,'Rapide','RAPIDE',4),(42,'V12 Vantage','V12VANT',4),(43,'V8 Vantage','VANTAGE',4),(44,'Vanquish','VANQUISH',4),(45,'Virage','VIRAGE',4),(46,'Other Aston Martin Models','UNAVAILAST',4),(47,'100','AUDI100',5),(48,'200','AUDI200',5),(49,'4000','4000',5),(50,'5000','5000',5),(51,'80','80',5),(52,'90','90',5),(53,'A3','A3',5),(54,'A4','A4',5),(55,'A5','A5',5),(56,'A6','A6',5),(57,'A7','A7',5),(58,'A8','A8',5),(59,'allroad','ALLRDQUA',5),(60,'Cabriolet','AUDICABRI',5),(61,'Coupe','AUDICOUPE',5),(62,'Q3','Q3',5),(63,'Q5','Q5',5),(64,'Q7','Q7',5),(65,'Quattro','QUATTR',5),(66,'R8','R8',5),(67,'RS 4','RS4',5),(68,'RS 5','RS5',5),(69,'RS 6','RS6',5),(70,'S4','S4',5),(71,'S5','S5',5),(72,'S6','S6',5),(73,'S7','S7',5),(74,'S8','S8',5),(75,'TT','TT',5),(76,'TT RS','TTRS',5),(77,'TTS','TTS',5),(78,'V8 Quattro','V8',5),(79,'Other Audi Models','AUDOTH',5),(80,'Convertible','CONVERT',6),(81,'Coupe','COUPEAVANT',6),(82,'Sedan','SEDAN',6),(83,'Other Avanti Models','UNAVAILAVA',6),(84,'Arnage','ARNAGE',7),(85,'Azure','AZURE',7),(86,'Brooklands','BROOKLANDS',7),(87,'Continental','BENCONT',7),(88,'Corniche','CORNICHE',7),(89,'Eight','BENEIGHT',7),(90,'Mulsanne','BENMUL',7),(91,'Turbo R','BENTURBO',7),(92,'Other Bentley Models','UNAVAILBEN',7),(93,'1 Series (3)','1_SERIES',8),(94,' - 128i','128I',8),(95,' - 135i','135I',8),(96,' - 135is','135IS',8),(97,'3 Series (29)','3_SERIES',8),(98,' - 318i','318I',8),(99,' - 318iC','318IC',8),(100,' - 318iS','318IS',8),(101,' - 318ti','318TI',8),(102,' - 320i','320I',8),(103,' - 323ci','323CI',8),(104,' - 323i','323I',8),(105,' - 323is','323IS',8),(106,' - 323iT','323IT',8),(107,' - 325Ci','325CI',8),(108,' - 325e','325E',8),(109,' - 325es','325ES',8),(110,' - 325i','325I',8),(111,' - 325is','325IS',8),(112,' - 325iX','325IX',8),(113,' - 325xi','325XI',8),(114,' - 328Ci','328CI',8),(115,' - 328i','328I',8),(116,' - 328iS','328IS',8),(117,' - 328xi','328XI',8),(118,' - 330Ci','330CI',8),(119,' - 330i','330I',8),(120,' - 330xi','330XI',8),(121,' - 335d','335D',8),(122,' - 335i','335I',8),(123,' - 335is','335IS',8),(124,' - 335xi','335XI',8),(125,' - ActiveHybrid 3','ACTIVE3',8),(126,' - 325','BMW325',8),(127,'5 Series (19)','5_SERIES',8),(128,' - 524td','524TD',8),(129,' - 525i','525I',8),(130,' - 525xi','525XI',8),(131,' - 528e','528E',8),(132,' - 528i','528I',8),(133,' - 528iT','528IT',8),(134,' - 528xi','528XI',8),(135,' - 530i','530I',8),(136,' - 530iT','530IT',8),(137,' - 530xi','530XI',8),(138,' - 533i','533I',8),(139,' - 535i','535I',8),(140,' - 535i Gran Turismo','535IGT',8),(141,' - 535xi','535XI',8),(142,' - 540i','540I',8),(143,' - 545i','545I',8),(144,' - 550i','550I',8),(145,' - 550i Gran Turismo','550IGT',8),(146,' - ActiveHybrid 5','ACTIVE5',8),(147,'6 Series (8)','6_SERIES',8),(148,' - 633CSi','633CSI',8),(149,' - 635CSi','635CSI',8),(150,' - 640i','640I',8),(151,' - 640i Gran Coupe','640IGC',8),(152,' - 645Ci','645CI',8),(153,' - 650i','650I',8),(154,' - 650i Gran Coupe','650IGC',8),(155,' - L6','L6',8),(156,'7 Series (15)','7_SERIES',8),(157,' - 733i','733I',8),(158,' - 735i','735I',8),(159,' - 735iL','735IL',8),(160,' - 740i','740I',8),(161,' - 740iL','740IL',8),(162,' - 740Li','740LI',8),(163,' - 745i','745I',8),(164,' - 745Li','745LI',8),(165,' - 750i','750I',8),(166,' - 750iL','750IL',8),(167,' - 750Li','750LI',8),(168,' - 760i','760I',8),(169,' - 760Li','760LI',8),(170,' - ActiveHybrid 7','ACTIVE7',8),(171,' - Alpina B7','ALPINAB7',8),(172,'8 Series (4)','8_SERIES',8),(173,' - 840Ci','840CI',8),(174,' - 850Ci','850CI',8),(175,' - 850CSi','850CSI',8),(176,' - 850i','850I',8),(177,'L Series (1)','L_SERIES',8),(178,' - L7','L7',8),(179,'M Series (8)','M_SERIES',8),(180,' - 1 Series M','1SERIESM',8),(181,' - M Coupe','BMWMCOUPE',8),(182,' - M Roadster','BMWROAD',8),(183,' - M3','M3',8),(184,' - M5','M5',8),(185,' - M6','M6',8),(186,' - X5 M','X5M',8),(187,' - X6 M','X6M',8),(188,'X Series (5)','X_SERIES',8),(189,' - ActiveHybrid X6','ACTIVEX6',8),(190,' - X1','X1',8),(191,' - X3','X3',8),(192,' - X5','X5',8),(193,' - X6','X6',8),(194,'Z Series (3)','Z_SERIES',8),(195,' - Z3','Z3',8),(196,' - Z4','Z4',8),(197,' - Z8','Z8',8),(198,'Other BMW Models','BMWOTH',8),(199,'Century','CENT',9),(200,'Electra','ELEC',9),(201,'Enclave','ENCLAVE',9),(202,'Encore','BUIENC',9),(203,'LaCrosse','LACROSSE',9),(204,'Le Sabre','LESA',9),(205,'Lucerne','LUCERNE',9),(206,'Park Avenue','PARK',9),(207,'Rainier','RAINIER',9),(208,'Reatta','REATTA',9),(209,'Regal','REG',9),(210,'Rendezvous','RENDEZVOUS',9),(211,'Riviera','RIV',9),(212,'Roadmaster','BUICKROAD',9),(213,'Skyhawk','SKYH',9),(214,'Skylark','SKYL',9),(215,'Somerset','SOMER',9),(216,'Terraza','TERRAZA',9),(217,'Verano','BUVERANO',9),(218,'Other Buick Models','BUOTH',9),(219,'Allante','ALLANT',10),(220,'ATS','ATS',10),(221,'Brougham','BROUGH',10),(222,'Catera','CATERA',10),(223,'Cimarron','CIMA',10),(224,'CTS','CTS',10),(225,'De Ville','DEV',10),(226,'DTS','DTS',10),(227,'Eldorado','ELDO',10),(228,'Escalade','ESCALA',10),(229,'Escalade ESV','ESCALAESV',10),(230,'Escalade EXT','EXT',10),(231,'Fleetwood','FLEE',10),(232,'Seville','SEV',10),(233,'SRX','SRX',10),(234,'STS','STS',10),(235,'XLR','XLR',10),(236,'XTS','XTS',10),(237,'Other Cadillac Models','CADOTH',10),(238,'Astro','ASTRO',11),(239,'Avalanche','AVALNCH',11),(240,'Aveo','AVEO',11),(241,'Aveo5','AVEO5',11),(242,'Beretta','BERETT',11),(243,'Blazer','BLAZER',11),(244,'Camaro','CAM',11),(245,'Caprice','CAP',11),(246,'Captiva Sport','CHECAPS',11),(247,'Cavalier','CAV',11),(248,'Celebrity','CELE',11),(249,'Chevette','CHEVETTE',11),(250,'Citation','CITATION',11),(251,'Cobalt','COBALT',11),(252,'Colorado','COLORADO',11),(253,'Corsica','CORSI',11),(254,'Corvette','CORV',11),(255,'Cruze','CRUZE',11),(256,'El Camino','ELCAM',11),(257,'Equinox','EQUINOX',11),(258,'Express Van','G15EXP',11),(259,'G Van','G10',11),(260,'HHR','HHR',11),(261,'Impala','CHEVIMP',11),(262,'Kodiak C4500','KODC4500',11),(263,'Lumina','LUMINA',11),(264,'Lumina APV','LAPV',11),(265,'LUV','LUV',11),(266,'Malibu','MALI',11),(267,'Metro','CHVMETR',11),(268,'Monte Carlo','CHEVMONT',11),(269,'Nova','NOVA',11),(270,'Prizm','CHEVPRIZM',11),(271,'S10 Blazer','CHVST',11),(272,'S10 Pickup','S10PICKUP',11),(273,'Silverado and other C/K1500','CHEV150',11),(274,'Silverado and other C/K2500','CHEVC25',11),(275,'Silverado and other C/K3500','CH3500PU',11),(276,'Sonic','SONIC',11),(277,'Spark','SPARK',11),(278,'Spectrum','CHEVSPEC',11),(279,'Sprint','CHSPRINT',11),(280,'SSR','SSR',11),(281,'Suburban','CHEVSUB',11),(282,'Tahoe','TAHOE',11),(283,'Tracker','TRACKE',11),(284,'TrailBlazer','TRAILBLZ',11),(285,'TrailBlazer EXT','TRAILBZEXT',11),(286,'Traverse','TRAVERSE',11),(287,'Uplander','UPLANDER',11),(288,'Venture','VENTUR',11),(289,'Volt','VOLT',11),(290,'Other Chevrolet Models','CHEOTH',11),(291,'200','CHRYS200',12),(292,'300','300',12),(293,'300M','CHRY300',12),(294,'Aspen','ASPEN',12),(295,'Caravan','CARAVAN',12),(296,'Cirrus','CIRRUS',12),(297,'Concorde','CONC',12),(298,'Conquest','CHRYCONQ',12),(299,'Cordoba','CORDOBA',12),(300,'Crossfire','CROSSFIRE',12),(301,'E Class','ECLASS',12),(302,'Fifth Avenue','FIFTH',12),(303,'Grand Voyager','CHRYGRANDV',12),(304,'Imperial','IMPE',12),(305,'Intrepid','INTREPID',12),(306,'Laser','CHRYLAS',12),(307,'LeBaron','LEBA',12),(308,'LHS','LHS',12),(309,'Neon','CHRYNEON',12),(310,'New Yorker','NY',12),(311,'Newport','NEWPORT',12),(312,'Pacifica','PACIFICA',12),(313,'Prowler','CHPROWLE',12),(314,'PT Cruiser','PTCRUIS',12),(315,'Sebring','CHRYSEB',12),(316,'TC by Maserati','CHRYTC',12),(317,'Town & Country','TANDC',12),(318,'Voyager','VOYAGER',12),(319,'Other Chrysler Models','CHOTH',12),(320,'Lanos','LANOS',13),(321,'Leganza','LEGANZA',13),(322,'Nubira','NUBIRA',13),(323,'Other Daewoo Models','DAEOTH',13),(324,'Charade','CHAR',14),(325,'Rocky','ROCKY',14),(326,'Other Daihatsu Models','DAIHOTH',14),(327,'200SX','DAT200SX',15),(328,'210','DAT210',15),(329,'280ZX','280Z',15),(330,'300ZX','300ZX',15),(331,'310','310',15),(332,'510','510',15),(333,'720','720',15),(334,'810','810',15),(335,'Maxima','DATMAX',15),(336,'Pickup','DATPU',15),(337,'Pulsar','PUL',15),(338,'Sentra','DATSENT',15),(339,'Stanza','STAN',15),(340,'Other Datsun Models','DATOTH',15),(341,'DMC-12','DMC12',16),(342,'400','400',17),(343,'600','DOD600',17),(344,'Aries','ARI',17),(345,'Avenger','AVENGR',17),(346,'Caliber','CALIBER',17),(347,'Caravan','DODCARA',17),(348,'Challenger','CHALLENGER',17),(349,'Charger','DODCHAR',17),(350,'Colt','DODCOLT',17),(351,'Conquest','DODCONQ',17),(352,'D/W Truck','DODDW',17),(353,'Dakota','DAKOTA',17),(354,'Dart','DODDART',17),(355,'Daytona','DAY',17),(356,'Diplomat','DIPLOMA',17),(357,'Durango','DURANG',17),(358,'Dynasty','DODDYNA',17),(359,'Grand Caravan','GRANDCARAV',17),(360,'Intrepid','INTRE',17),(361,'Journey','JOURNEY',17),(362,'Lancer','LANCERDODG',17),(363,'Magnum','MAGNUM',17),(364,'Mirada','MIRADA',17),(365,'Monaco','MONACO',17),(366,'Neon','DODNEON',17),(367,'Nitro','NITRO',17),(368,'Omni','OMNI',17),(369,'Raider','RAIDER',17),(370,'Ram 1500 Truck','RAM1504WD',17),(371,'Ram 2500 Truck','RAM25002WD',17),(372,'Ram 3500 Truck','RAM3502WD',17),(373,'Ram 4500 Truck','RAM4500',17),(374,'Ram 50 Truck','DODD50',17),(375,'RAM C/V','CV',17),(376,'Ram SRT-10','RAMSRT10',17),(377,'Ram Van','RAMVANV8',17),(378,'Ram Wagon','RAMWAGON',17),(379,'Ramcharger','RAMCGR',17),(380,'Rampage','RAMPAGE',17),(381,'Shadow','DODSHAD',17),(382,'Spirit','DODSPIR',17),(383,'Sprinter','SPRINTER',17),(384,'SRT-4','SRT4',17),(385,'St. Regis','STREGIS',17),(386,'Stealth','STEAL',17),(387,'Stratus','STRATU',17),(388,'Viper','VIPER',17),(389,'Other Dodge Models','DOOTH',17),(390,'Medallion','EAGLEMED',18),(391,'Premier','EAGLEPREM',18),(392,'Summit','SUMMIT',18),(393,'Talon','TALON',18),(394,'Vision','VISION',18),(395,'Other Eagle Models','EAGOTH',18),(396,'308 GTB Quattrovalvole','308GTB',19),(397,'308 GTBI','308TBI',19),(398,'308 GTS Quattrovalvole','308GTS',19),(399,'308 GTSI','308TSI',19),(400,'328 GTB','328GTB',19),(401,'328 GTS','328GTS',19),(402,'348 GTB','348GTB',19),(403,'348 GTS','348GTS',19),(404,'348 Spider','348SPI',19),(405,'348 TB','348TB',19),(406,'348 TS','348TS',19),(407,'360','360',19),(408,'456 GT','456GT',19),(409,'456M GT','456MGT',19),(410,'458 Italia','458ITALIA',19),(411,'512 BBi','512BBI',19),(412,'512M','512M',19),(413,'512TR','512TR',19),(414,'550 Maranello','550M',19),(415,'575M Maranello','575M',19),(416,'599 GTB Fiorano','599GTB',19),(417,'599 GTO','599GTO',19),(418,'612 Scaglietti','612SCAGLIE',19),(419,'California','FERCALIF',19),(420,'Enzo','ENZO',19),(421,'F355','F355',19),(422,'F40','F40',19),(423,'F430','F430',19),(424,'F50','F50',19),(425,'FF','FERFF',19),(426,'Mondial','MOND',19),(427,'Testarossa','TEST',19),(428,'Other Ferrari Models','UNAVAILFER',19),(429,'2000 Spider','2000',20),(430,'500','FIAT500',20),(431,'Bertone X1/9','BERTON',20),(432,'Brava','BRAVA',20),(433,'Pininfarina Spider','PININ',20),(434,'Strada','STRADA',20),(435,'X1/9','FIATX19',20),(436,'Other Fiat Models','UNAVAILFIA',20),(437,'Karma','KARMA',21),(438,'Aerostar','AERO',22),(439,'Aspire','ASPIRE',22),(440,'Bronco','BRON',22),(441,'Bronco II','B2',22),(442,'C-MAX','FOCMAX',22),(443,'Club Wagon','FORDCLUB',22),(444,'Contour','CONTOUR',22),(445,'Courier','COURIER',22),(446,'Crown Victoria','CROWNVIC',22),(447,'E-150 and Econoline 150','E150ECON',22),(448,'E-250 and Econoline 250','E250ECON',22),(449,'E-350 and Econoline 350','E350ECON',22),(450,'Edge','EDGE',22),(451,'Escape','ESCAPE',22),(452,'Escort','ESCO',22),(453,'Excursion','EXCURSION',22),(454,'EXP','EXP',22),(455,'Expedition','EXPEDI',22),(456,'Expedition EL','EXPEDIEL',22),(457,'Explorer','EXPLOR',22),(458,'Explorer Sport Trac','SPORTTRAC',22),(459,'F100','F100',22),(460,'F150','F150PICKUP',22),(461,'F250','F250',22),(462,'F350','F350',22),(463,'F450','F450',22),(464,'Fairmont','FAIRM',22),(465,'Festiva','FESTIV',22),(466,'Fiesta','FIESTA',22),(467,'Five Hundred','FIVEHUNDRE',22),(468,'Flex','FLEX',22),(469,'Focus','FOCUS',22),(470,'Freestar','FREESTAR',22),(471,'Freestyle','FREESTYLE',22),(472,'Fusion','FUSION',22),(473,'Granada','GRANADA',22),(474,'GT','GT',22),(475,'LTD','LTD',22),(476,'Mustang','MUST',22),(477,'Probe','PROBE',22),(478,'Ranger','RANGER',22),(479,'Taurus','TAURUS',22),(480,'Taurus X','TAURUSX',22),(481,'Tempo','TEMPO',22),(482,'Thunderbird','TBIRD',22),(483,'Transit Connect','TRANSCONN',22),(484,'Windstar','WINDST',22),(485,'ZX2 Escort','FORDZX2',22),(486,'Other Ford Models','FOOTH',22),(487,'Sprinter','FRESPRINT',23),(488,'Metro','GEOMETRO',24),(489,'Prizm','GEOPRIZM',24),(490,'Spectrum','SPECT',24),(491,'Storm','STORM',24),(492,'Tracker','GEOTRACK',24),(493,'Other Geo Models','GEOOTH',24),(494,'Acadia','ACADIA',25),(495,'Caballero','CABALLERO',25),(496,'Canyon','CANYON',25),(497,'Envoy','ENVOY',25),(498,'Envoy XL','ENVOYXL',25),(499,'Envoy XUV','ENVOYXUV',25),(500,'Jimmy','JIM',25),(501,'Rally Wagon','RALLYWAG',25),(502,'S15 Jimmy','GMCS15',25),(503,'S15 Pickup','S15',25),(504,'Safari','SAFARIGMC',25),(505,'Savana','GMCSAVANA',25),(506,'Sierra C/K1500','15SIPU4WD',25),(507,'Sierra C/K2500','GMCC25PU',25),(508,'Sierra C/K3500','GMC3500PU',25),(509,'Sonoma','SONOMA',25),(510,'Suburban','SUB',25),(511,'Syclone','GMCSYCLON',25),(512,'Terrain','TERRAIN',25),(513,'TopKick C4500','TOPC4500',25),(514,'Typhoon','TYPH',25),(515,'Vandura','GMCVANDUR',25),(516,'Yukon','YUKON',25),(517,'Yukon XL','YUKONXL',25),(518,'Other GMC Models','GMCOTH',25),(519,'Accord','ACCORD',26),(520,'Civic','CIVIC',26),(521,'CR-V','CRV',26),(522,'CR-Z','CRZ',26),(523,'CRX','CRX',26),(524,'Crosstour and Accord Crosstour Models (2)','CROSSTOUR_MODELS',26),(525,' - Accord Crosstour','CROSSTOUR',26),(526,' - Crosstour','HONCROSS',26),(527,'Del Sol','HONDELSOL',26),(528,'Element','ELEMENT',26),(529,'Fit','FIT',26),(530,'Insight','INSIGHT',26),(531,'Odyssey','ODYSSEY',26),(532,'Passport','PASSPO',26),(533,'Pilot','PILOT',26),(534,'Prelude','PRE',26),(535,'Ridgeline','RIDGELINE',26),(536,'S2000','S2000',26),(537,'Other Honda Models','HONOTH',26),(538,'H1','HUMMER',27),(539,'H2','H2',27),(540,'H3','H3',27),(541,'H3T','H3T',27),(542,'Other Hummer Models','AMGOTH',27),(543,'Accent','ACCENT',28),(544,'Azera','AZERA',28),(545,'Elantra','ELANTR',28),(546,'Elantra Coupe','HYUELANCPE',28),(547,'Elantra Touring','ELANTOUR',28),(548,'Entourage','ENTOURAGE',28),(549,'Equus','EQUUS',28),(550,'Excel','HYUEXCEL',28),(551,'Genesis','GENESIS',28),(552,'Genesis Coupe','GENESISCPE',28),(553,'Santa Fe','SANTAFE',28),(554,'Scoupe','SCOUPE',28),(555,'Sonata','SONATA',28),(556,'Tiburon','TIBURO',28),(557,'Tucson','TUCSON',28),(558,'Veloster','VELOSTER',28),(559,'Veracruz','VERACRUZ',28),(560,'XG300','XG300',28),(561,'XG350','XG350',28),(562,'Other Hyundai Models','HYUOTH',28),(563,'EX Models (2)','EX_MODELS',29),(564,' - EX35','EX35',29),(565,' - EX37','EX37',29),(566,'FX Models (4)','FX_MODELS',29),(567,' - FX35','FX35',29),(568,' - FX37','FX37',29),(569,' - FX45','FX45',29),(570,' - FX50','FX50',29),(571,'G Models (4)','G_MODELS',29),(572,' - G20','G20',29),(573,' - G25','G25',29),(574,' - G35','G35',29),(575,' - G37','G37',29),(576,'I Models (2)','I_MODELS',29),(577,' - I30','I30',29),(578,' - I35','I35',29),(579,'J Models (1)','J_MODELS',29),(580,' - J30','J30',29),(581,'JX Models (1)','JX_MODELS',29),(582,' - JX35','JX35',29),(583,'M Models (6)','M_MODELS',29),(584,' - M30','M30',29),(585,' - M35','M35',29),(586,' - M35h','M35HYBRID',29),(587,' - M37','M37',29),(588,' - M45','M45',29),(589,' - M56','M56',29),(590,'Q Models (1)','Q_MODELS',29),(591,' - Q45','Q45',29),(592,'QX Models (2)','QX_MODELS',29),(593,' - QX4','QX4',29),(594,' - QX56','QX56',29),(595,'Other Infiniti Models','INFOTH',29),(596,'Amigo','AMIGO',30),(597,'Ascender','ASCENDER',30),(598,'Axiom','AXIOM',30),(599,'Hombre','HOMBRE',30),(600,'i-280','I280',30),(601,'i-290','I290',30),(602,'i-350','I350',30),(603,'i-370','I370',30),(604,'I-Mark','ISUMARK',30),(605,'Impulse','ISUIMP',30),(606,'Oasis','OASIS',30),(607,'Pickup','ISUPU',30),(608,'Rodeo','RODEO',30),(609,'Stylus','STYLUS',30),(610,'Trooper','TROOP',30),(611,'Trooper II','TRP2',30),(612,'VehiCROSS','VEHICROSS',30),(613,'Other Isuzu Models','ISUOTH',30),(614,'S-Type','STYPE',31),(615,'X-Type','XTYPE',31),(616,'XF','XF',31),(617,'XJ Series (10)','XJ_SERIES',31),(618,' - XJ12','JAGXJ12',31),(619,' - XJ6','JAGXJ6',31),(620,' - XJR','JAGXJR',31),(621,' - XJR-S','JAGXJRS',31),(622,' - XJS','JAGXJS',31),(623,' - XJ Vanden Plas','VANDEN',31),(624,' - XJ','XJ',31),(625,' - XJ8','XJ8',31),(626,' - XJ8 L','XJ8L',31),(627,' - XJ Sport','XJSPORT',31),(628,'XK Series (3)','XK_SERIES',31),(629,' - XK8','JAGXK8',31),(630,' - XK','XK',31),(631,' - XKR','XKR',31),(632,'Other Jaguar Models','JAGOTH',31),(633,'Cherokee','CHER',32),(634,'CJ','JEEPCJ',32),(635,'Comanche','COMANC',32),(636,'Commander','COMMANDER',32),(637,'Compass','COMPASS',32),(638,'Grand Cherokee','JEEPGRAND',32),(639,'Grand Wagoneer','GRWAG',32),(640,'Liberty','LIBERTY',32),(641,'Patriot','PATRIOT',32),(642,'Pickup','JEEPPU',32),(643,'Scrambler','SCRAMBLE',32),(644,'Wagoneer','WAGONE',32),(645,'Wrangler','WRANGLER',32),(646,'Other Jeep Models','JEOTH',32),(647,'Amanti','AMANTI',33),(648,'Borrego','BORREGO',33),(649,'Forte','FORTE',33),(650,'Forte Koup','FORTEKOUP',33),(651,'Optima','OPTIMA',33),(652,'Rio','RIO',33),(653,'Rio5','RIO5',33),(654,'Rondo','RONDO',33),(655,'Sedona','SEDONA',33),(656,'Sephia','SEPHIA',33),(657,'Sorento','SORENTO',33),(658,'Soul','SOUL',33),(659,'Spectra','SPECTRA',33),(660,'Spectra5','SPECTRA5',33),(661,'Sportage','SPORTA',33),(662,'Other Kia Models','KIAOTH',33),(663,'Aventador','AVENT',34),(664,'Countach','COUNT',34),(665,'Diablo','DIABLO',34),(666,'Gallardo','GALLARDO',34),(667,'Jalpa','JALPA',34),(668,'LM002','LM002',34),(669,'Murcielago','MURCIELAGO',34),(670,'Other Lamborghini Models','UNAVAILLAM',34),(671,'Beta','BETA',35),(672,'Zagato','ZAGATO',35),(673,'Other Lancia Models','UNAVAILLAN',35),(674,'Defender','DEFEND',36),(675,'Discovery','DISCOV',36),(676,'Freelander','FRELNDR',36),(677,'LR2','LR2',36),(678,'LR3','LR3',36),(679,'LR4','LR4',36),(680,'Range Rover','RANGE',36),(681,'Range Rover Evoque','EVOQUE',36),(682,'Range Rover Sport','RANGESPORT',36),(683,'Other Land Rover Models','ROVOTH',36),(684,'CT Models (1)','CT_MODELS',37),(685,' - CT 200h','CT200H',37),(686,'ES Models (5)','ES_MODELS',37),(687,' - ES 250','ES250',37),(688,' - ES 300','ES300',37),(689,' - ES 300h','ES300H',37),(690,' - ES 330','ES330',37),(691,' - ES 350','ES350',37),(692,'GS Models (6)','GS_MODELS',37),(693,' - GS 300','GS300',37),(694,' - GS 350','GS350',37),(695,' - GS 400','GS400',37),(696,' - GS 430','GS430',37),(697,' - GS 450h','GS450H',37),(698,' - GS 460','GS460',37),(699,'GX Models (2)','GX_MODELS',37),(700,' - GX 460','GX460',37),(701,' - GX 470','GX470',37),(702,'HS Models (1)','HS_MODELS',37),(703,' - HS 250h','HS250H',37),(704,'IS Models (6)','IS_MODELS',37),(705,' - IS 250','IS250',37),(706,' - IS 250C','IS250C',37),(707,' - IS 300','IS300',37),(708,' - IS 350','IS350',37),(709,' - IS 350C','IS350C',37),(710,' - IS F','ISF',37),(711,'LFA','LEXLFA',37),(712,'LS Models (4)','LS_MODELS',37),(713,' - LS 400','LS400',37),(714,' - LS 430','LS430',37),(715,' - LS 460','LS460',37),(716,' - LS 600h','LS600H',37),(717,'LX Models (3)','LX_MODELS',37),(718,' - LX 450','LX450',37),(719,' - LX 470','LX470',37),(720,' - LX 570','LX570',37),(721,'RX Models (5)','RX_MODELS',37),(722,' - RX 300','RX300',37),(723,' - RX 330','RX330',37),(724,' - RX 350','RX350',37),(725,' - RX 400h','RX400H',37),(726,' - RX 450h','RX450H',37),(727,'SC Models (3)','SC_MODELS',37),(728,' - SC 300','SC300',37),(729,' - SC 400','SC400',37),(730,' - SC 430','SC430',37),(731,'Other Lexus Models','LEXOTH',37),(732,'Aviator','AVIATOR',38),(733,'Blackwood','BLKWOOD',38),(734,'Continental','CONT',38),(735,'LS','LSLINCOLN',38),(736,'Mark LT','MARKLT',38),(737,'Mark VI','MARK6',38),(738,'Mark VII','MARK7',38),(739,'Mark VIII','MARK8',38),(740,'MKS','MKS',38),(741,'MKT','MKT',38),(742,'MKX','MKX',38),(743,'MKZ','MKZ',38),(744,'Navigator','NAVIGA',38),(745,'Navigator L','NAVIGAL',38),(746,'Town Car','LINCTC',38),(747,'Zephyr','ZEPHYR',38),(748,'Other Lincoln Models','LINOTH',38),(749,'Elan','ELAN',39),(750,'Elise','LOTELISE',39),(751,'Esprit','ESPRIT',39),(752,'Evora','EVORA',39),(753,'Exige','EXIGE',39),(754,'Other Lotus Models','UNAVAILLOT',39),(755,'430','430',40),(756,'Biturbo','BITRBO',40),(757,'Coupe','COUPEMAS',40),(758,'GranSport','GRANSPORT',40),(759,'GranTurismo','GRANTURISM',40),(760,'Quattroporte','QP',40),(761,'Spyder','SPYDER',40),(762,'Other Maserati Models','UNAVAILMAS',40),(763,'57','57MAYBACH',41),(764,'62','62MAYBACH',41),(765,'Other Maybach Models','UNAVAILMAY',41),(766,'323','MAZDA323',42),(767,'626','MAZDA626',42),(768,'929','929',42),(769,'B-Series Pickup','B-SERIES',42),(770,'CX-5','CX-5',42),(771,'CX-7','CX-7',42),(772,'CX-9','CX-9',42),(773,'GLC','GLC',42),(774,'MAZDA2','MAZDA2',42),(775,'MAZDA3','MAZDA3',42),(776,'MAZDA5','MAZDA5',42),(777,'MAZDA6','MAZDA6',42),(778,'MAZDASPEED3','MAZDASPD3',42),(779,'MAZDASPEED6','MAZDASPD6',42),(780,'Miata MX5','MIATA',42),(781,'Millenia','MILL',42),(782,'MPV','MPV',42),(783,'MX3','MX3',42),(784,'MX6','MX6',42),(785,'Navajo','NAVAJO',42),(786,'Protege','PROTE',42),(787,'Protege5','PROTE5',42),(788,'RX-7','RX7',42),(789,'RX-8','RX8',42),(790,'Tribute','TRIBUTE',42),(791,'Other Mazda Models','MAZOTH',42),(792,'MP4-12C','MP4',43),(793,'190 Class (2)','190_CLASS',44),(794,' - 190D','190D',44),(795,' - 190E','190E',44),(796,'240 Class (1)','240_CLASS',44),(797,' - 240D','240D',44),(798,'300 Class / E Class (6)','300_CLASS_E_CLASS',44),(799,' - 300CD','300CD',44),(800,' - 300CE','300CE',44),(801,' - 300D','300D',44),(802,' - 300E','300E',44),(803,' - 300TD','300TD',44),(804,' - 300TE','300TE',44),(805,'C Class (13)','C_CLASS',44),(806,' - C220','C220',44),(807,' - C230','C230',44),(808,' - C240','C240',44),(809,' - C250','C250',44),(810,' - C280','C280',44),(811,' - C300','C300',44),(812,' - C320','C320',44),(813,' - C32 AMG','C32AMG',44),(814,' - C350','C350',44),(815,' - C36 AMG','C36AMG',44),(816,' - C43 AMG','C43AMG',44),(817,' - C55 AMG','C55AMG',44),(818,' - C63 AMG','C63AMG',44),(819,'CL Class (6)','CL_CLASS',44),(820,' - CL500','CL500',44),(821,' - CL550','CL550',44),(822,' - CL55 AMG','CL55AMG',44),(823,' - CL600','CL600',44),(824,' - CL63 AMG','CL63AMG',44),(825,' - CL65 AMG','CL65AMG',44),(826,'CLK Class (7)','CLK_CLASS',44),(827,' - CLK320','CLK320',44),(828,' - CLK350','CLK350',44),(829,' - CLK430','CLK430',44),(830,' - CLK500','CLK500',44),(831,' - CLK550','CLK550',44),(832,' - CLK55 AMG','CLK55AMG',44),(833,' - CLK63 AMG','CLK63AMG',44),(834,'CLS Class (4)','CLS_CLASS',44),(835,' - CLS500','CLS500',44),(836,' - CLS550','CLS550',44),(837,' - CLS55 AMG','CLS55AMG',44),(838,' - CLS63 AMG','CLS63AMG',44),(839,'E Class (18)','E_CLASS',44),(840,' - 260E','260E',44),(841,' - 280CE','280CE',44),(842,' - 280E','280E',44),(843,' - 400E','400E',44),(844,' - 500E','500E',44),(845,' - E300','E300',44),(846,' - E320','E320',44),(847,' - E320 Bluetec','E320BLUE',44),(848,' - E320 CDI','E320CDI',44),(849,' - E350','E350',44),(850,' - E350 Bluetec','E350BLUE',44),(851,' - E400 Hybrid','E400',44),(852,' - E420','E420',44),(853,' - E430','E430',44),(854,' - E500','E500',44),(855,' - E550','E550',44),(856,' - E55 AMG','E55AMG',44),(857,' - E63 AMG','E63AMG',44),(858,'G Class (4)','G_CLASS',44),(859,' - G500','G500',44),(860,' - G550','G550',44),(861,' - G55 AMG','G55AMG',44),(862,' - G63 AMG','G63AMG',44),(863,'GL Class (5)','GL_CLASS',44),(864,' - GL320 Bluetec','GL320BLUE',44),(865,' - GL320 CDI','GL320CDI',44),(866,' - GL350 Bluetec','GL350BLUE',44),(867,' - GL450','GL450',44),(868,' - GL550','GL550',44),(869,'GLK Class (1)','GLK_CLASS',44),(870,' - GLK350','GLK350',44),(871,'M Class (11)','M_CLASS',44),(872,' - ML320','ML320',44),(873,' - ML320 Bluetec','ML320BLUE',44),(874,' - ML320 CDI','ML320CDI',44),(875,' - ML350','ML350',44),(876,' - ML350 Bluetec','ML350BLUE',44),(877,' - ML430','ML430',44),(878,' - ML450 Hybrid','ML450HY',44),(879,' - ML500','ML500',44),(880,' - ML550','ML550',44),(881,' - ML55 AMG','ML55AMG',44),(882,' - ML63 AMG','ML63AMG',44),(883,'R Class (6)','R_CLASS',44),(884,' - R320 Bluetec','R320BLUE',44),(885,' - R320 CDI','R320CDI',44),(886,' - R350','R350',44),(887,' - R350 Bluetec','R350BLUE',44),(888,' - R500','R500',44),(889,' - R63 AMG','R63AMG',44),(890,'S Class (30)','S_CLASS',44),(891,' - 300SD','300SD',44),(892,' - 300SDL','300SDL',44),(893,' - 300SE','300SE',44),(894,' - 300SEL','300SEL',44),(895,' - 350SD','350SD',44),(896,' - 350SDL','350SDL',44),(897,' - 380SE','380SE',44),(898,' - 380SEC','380SEC',44),(899,' - 380SEL','380SEL',44),(900,' - 400SE','400SE',44),(901,' - 400SEL','400SEL',44),(902,' - 420SEL','420SEL',44),(903,' - 500SEC','500SEC',44),(904,' - 500SEL','500SEL',44),(905,' - 560SEC','560SEC',44),(906,' - 560SEL','560SEL',44),(907,' - 600SEC','600SEC',44),(908,' - 600SEL','600SEL',44),(909,' - S320','S320',44),(910,' - S350','S350',44),(911,' - S350 Bluetec','S350BLUE',44),(912,' - S400 Hybrid','S400HY',44),(913,' - S420','S420',44),(914,' - S430','S430',44),(915,' - S500','S500',44),(916,' - S550','S550',44),(917,' - S55 AMG','S55AMG',44),(918,' - S600','S600',44),(919,' - S63 AMG','S63AMG',44),(920,' - S65 AMG','S65AMG',44),(921,'SL Class (13)','SL_CLASS',44),(922,' - 300SL','300SL',44),(923,' - 380SL','380SL',44),(924,' - 380SLC','380SLC',44),(925,' - 500SL','500SL',44),(926,' - 560SL','560SL',44),(927,' - 600SL','600SL',44),(928,' - SL320','SL320',44),(929,' - SL500','SL500',44),(930,' - SL550','SL550',44),(931,' - SL55 AMG','SL55AMG',44),(932,' - SL600','SL600',44),(933,' - SL63 AMG','SL63AMG',44),(934,' - SL65 AMG','SL65AMG',44),(935,'SLK Class (8)','SLK_CLASS',44),(936,' - SLK230','SLK230',44),(937,' - SLK250','SLK250',44),(938,' - SLK280','SLK280',44),(939,' - SLK300','SLK300',44),(940,' - SLK320','SLK320',44),(941,' - SLK32 AMG','SLK32AMG',44),(942,' - SLK350','SLK350',44),(943,' - SLK55 AMG','SLK55AMG',44),(944,'SLR Class (1)','SLR_CLASS',44),(945,' - SLR','SLR',44),(946,'SLS Class (1)','SLS_CLASS',44),(947,' - SLS AMG','SLSAMG',44),(948,'Sprinter Class (1)','SPRINTER_CLASS',44),(949,' - Sprinter','MBSPRINTER',44),(950,'Other Mercedes-Benz Models','MBOTH',44),(951,'Capri','CAPRI',45),(952,'Cougar','COUGAR',45),(953,'Grand Marquis','MERCGRAND',45),(954,'Lynx','LYNX',45),(955,'Marauder','MARAUDER',45),(956,'Mariner','MARINER',45),(957,'Marquis','MARQ',45),(958,'Milan','MILAN',45),(959,'Montego','MONTEGO',45),(960,'Monterey','MONTEREY',45),(961,'Mountaineer','MOUNTA',45),(962,'Mystique','MYSTIQ',45),(963,'Sable','SABLE',45),(964,'Topaz','TOPAZ',45),(965,'Tracer','TRACER',45),(966,'Villager','VILLA',45),(967,'Zephyr','MERCZEP',45),(968,'Other Mercury Models','MEOTH',45),(969,'Scorpio','SCORP',46),(970,'XR4Ti','XR4TI',46),(971,'Other Merkur Models','MEROTH',46),(972,'Cooper Clubman Models (2)','COOPRCLUB_MODELS',47),(973,' - Cooper Clubman','COOPERCLUB',47),(974,' - Cooper S Clubman','COOPRCLUBS',47),(975,'Cooper Countryman Models (2)','COOPCOUNTRY_MODELS',47),(976,' - Cooper Countryman','COUNTRYMAN',47),(977,' - Cooper S Countryman','COUNTRYMNS',47),(978,'Cooper Coupe Models (2)','COOPCOUP_MODELS',47),(979,' - Cooper Coupe','MINICOUPE',47),(980,' - Cooper S Coupe','MINISCOUPE',47),(981,'Cooper Models (2)','COOPER_MODELS',47),(982,' - Cooper','COOPER',47),(983,' - Cooper S','COOPERS',47),(984,'Cooper Roadster Models (2)','COOPRROAD_MODELS',47),(985,' - Cooper Roadster','COOPERROAD',47),(986,' - Cooper S Roadster','COOPERSRD',47),(987,'3000GT','3000GT',48),(988,'Cordia','CORD',48),(989,'Diamante','DIAMAN',48),(990,'Eclipse','ECLIP',48),(991,'Endeavor','ENDEAVOR',48),(992,'Expo','MITEXP',48),(993,'Galant','GALANT',48),(994,'i','MITI',48),(995,'Lancer','LANCERMITS',48),(996,'Lancer Evolution','LANCEREVO',48),(997,'Mighty Max','MITPU',48),(998,'Mirage','MIRAGE',48),(999,'Montero','MONT',48),(1000,'Montero Sport','MONTSPORT',48),(1001,'Outlander','OUTLANDER',48),(1002,'Outlander Sport','OUTLANDSPT',48),(1003,'Precis','PRECIS',48),(1004,'Raider','RAIDERMITS',48),(1005,'Sigma','SIGMA',48),(1006,'Starion','MITSTAR',48),(1007,'Tredia','TRED',48),(1008,'Van','MITVAN',48),(1009,'Other Mitsubishi Models','MITOTH',48),(1010,'200SX','NIS200SX',49),(1011,'240SX','240SX',49),(1012,'300ZX','300ZXTURBO',49),(1013,'350Z','350Z',49),(1014,'370Z','370Z',49),(1015,'Altima','ALTIMA',49),(1016,'Armada','PATHARMADA',49),(1017,'Axxess','AXXESS',49),(1018,'Cube','CUBE',49),(1019,'Frontier','FRONTI',49),(1020,'GT-R','GT-R',49),(1021,'Juke','JUKE',49),(1022,'Leaf','LEAF',49),(1023,'Maxima','MAX',49),(1024,'Murano','MURANO',49),(1025,'Murano CrossCabriolet','MURANOCROS',49),(1026,'NV','NV',49),(1027,'NX','NX',49),(1028,'Pathfinder','PATH',49),(1029,'Pickup','NISPU',49),(1030,'Pulsar','PULSAR',49),(1031,'Quest','QUEST',49),(1032,'Rogue','ROGUE',49),(1033,'Sentra','SENTRA',49),(1034,'Stanza','STANZA',49),(1035,'Titan','TITAN',49),(1036,'Van','NISVAN',49),(1037,'Versa','VERSA',49),(1038,'Xterra','XTERRA',49),(1039,'Other Nissan Models','NISSOTH',49),(1040,'88','88',50),(1041,'Achieva','ACHIEV',50),(1042,'Alero','ALERO',50),(1043,'Aurora','AURORA',50),(1044,'Bravada','BRAV',50),(1045,'Custom Cruiser','CUCR',50),(1046,'Cutlass','OLDCUS',50),(1047,'Cutlass Calais','OLDCALAIS',50),(1048,'Cutlass Ciera','CIERA',50),(1049,'Cutlass Supreme','CSUPR',50),(1050,'Firenza','OLDSFIR',50),(1051,'Intrigue','INTRIG',50),(1052,'Ninety-Eight','98',50),(1053,'Omega','OMEG',50),(1054,'Regency','REGEN',50),(1055,'Silhouette','SILHO',50),(1056,'Toronado','TORO',50),(1057,'Other Oldsmobile Models','OLDOTH',50),(1058,'405','405',51),(1059,'504','504',51),(1060,'505','505',51),(1061,'604','604',51),(1062,'Other Peugeot Models','UNAVAILPEU',51),(1063,'Acclaim','ACC',52),(1064,'Arrow','ARROW',52),(1065,'Breeze','BREEZE',52),(1066,'Caravelle','CARAVE',52),(1067,'Champ','CHAMP',52),(1068,'Colt','COLT',52),(1069,'Conquest','PLYMCONQ',52),(1070,'Gran Fury','GRANFURY',52),(1071,'Grand Voyager','PLYMGRANV',52),(1072,'Horizon','HORI',52),(1073,'Laser','LASER',52),(1074,'Neon','NEON',52),(1075,'Prowler','PROWLE',52),(1076,'Reliant','RELI',52),(1077,'Sapporo','SAPPOROPLY',52),(1078,'Scamp','SCAMP',52),(1079,'Sundance','SUNDAN',52),(1080,'Trailduster','TRAILDUST',52),(1081,'Voyager','VOYA',52),(1082,'Other Plymouth Models','PLYOTH',52),(1083,'1000','T-1000',53),(1084,'6000','6000',53),(1085,'Aztek','AZTEK',53),(1086,'Bonneville','BON',53),(1087,'Catalina','CATALINA',53),(1088,'Fiero','FIERO',53),(1089,'Firebird','FBIRD',53),(1090,'G3','G3',53),(1091,'G5','G5',53),(1092,'G6','G6',53),(1093,'G8','G8',53),(1094,'Grand Am','GRNDAM',53),(1095,'Grand Prix','GP',53),(1096,'GTO','GTO',53),(1097,'J2000','J2000',53),(1098,'Le Mans','LEMANS',53),(1099,'Montana','MONTANA',53),(1100,'Parisienne','PARISI',53),(1101,'Phoenix','PHOENIX',53),(1102,'Safari','SAFARIPONT',53),(1103,'Solstice','SOLSTICE',53),(1104,'Sunbird','SUNBIR',53),(1105,'Sunfire','SUNFIR',53),(1106,'Torrent','TORRENT',53),(1107,'Trans Sport','TS',53),(1108,'Vibe','VIBE',53),(1109,'Other Pontiac Models','PONOTH',53),(1110,'911','911',54),(1111,'924','924',54),(1112,'928','928',54),(1113,'944','944',54),(1114,'968','968',54),(1115,'Boxster','BOXSTE',54),(1116,'Carrera GT','CARRERAGT',54),(1117,'Cayenne','CAYENNE',54),(1118,'Cayman','CAYMAN',54),(1119,'Panamera','PANAMERA',54),(1120,'Other Porsche Models','POROTH',54),(1121,'1500','RAM1504WD',55),(1122,'2500','RAM25002WD',55),(1123,'3500','RAM3502WD',55),(1124,'4500','RAM4500',55),(1125,'18i','18I',56),(1126,'Fuego','FU',56),(1127,'Le Car','LECAR',56),(1128,'R18','R18',56),(1129,'Sportwagon','RENSPORT',56),(1130,'Other Renault Models','UNAVAILREN',56),(1131,'Camargue','CAMAR',57),(1132,'Corniche','CORN',57),(1133,'Ghost','GHOST',57),(1134,'Park Ward','PARKWARD',57),(1135,'Phantom','PHANT',57),(1136,'Silver Dawn','DAWN',57),(1137,'Silver Seraph','SILSERAPH',57),(1138,'Silver Spirit','RRSPIR',57),(1139,'Silver Spur','SPUR',57),(1140,'Other Rolls-Royce Models','UNAVAILRR',57),(1141,'9-2X','9-2X',58),(1142,'9-3','9-3',58),(1143,'9-4X','9-4X',58),(1144,'9-5','9-5',58),(1145,'9-7X','97X',58),(1146,'900','900',58),(1147,'9000','9000',58),(1148,'Other Saab Models','SAOTH',58),(1149,'Astra','ASTRA',59),(1150,'Aura','AURA',59),(1151,'ION','ION',59),(1152,'L Series (3)','L_SERIES',59),(1153,' - L100','L100',59),(1154,' - L200','L200',59),(1155,' - L300','L300',59),(1156,'LS','LSSATURN',59),(1157,'LW Series (4)','LW_SERIES',59),(1158,' - LW1','LW',59),(1159,' - LW2','LW2',59),(1160,' - LW200','LW200',59),(1161,' - LW300','LW300',59),(1162,'Outlook','OUTLOOK',59),(1163,'Relay','RELAY',59),(1164,'SC Series (2)','SC_SERIES',59),(1165,' - SC1','SC1',59),(1166,' - SC2','SC2',59),(1167,'Sky','SKY',59),(1168,'SL Series (3)','SL_SERIES',59),(1169,' - SL','SL',59),(1170,' - SL1','SL1',59),(1171,' - SL2','SL2',59),(1172,'SW Series (2)','SW_SERIES',59),(1173,' - SW1','SW1',59),(1174,' - SW2','SW2',59),(1175,'Vue','VUE',59),(1176,'Other Saturn Models','SATOTH',59),(1177,'FR-S','SCIFRS',60),(1178,'iQ','IQ',60),(1179,'tC','TC',60),(1180,'xA','XA',60),(1181,'xB','XB',60),(1182,'xD','XD',60),(1183,'fortwo','FORTWO',61),(1184,'Other smart Models','SMOTH',61),(1185,'Viper','SRTVIPER',62),(1186,'825','825',63),(1187,'827','827',63),(1188,'Other Sterling Models','UNAVAILSTE',63),(1189,'Baja','BAJA',64),(1190,'Brat','BRAT',64),(1191,'BRZ','SUBBRZ',64),(1192,'Forester','FOREST',64),(1193,'Impreza','IMPREZ',64),(1194,'Impreza WRX','IMPWRX',64),(1195,'Justy','JUSTY',64),(1196,'L Series','SUBL',64),(1197,'Legacy','LEGACY',64),(1198,'Loyale','LOYALE',64),(1199,'Outback','SUBOUTBK',64),(1200,'SVX','SVX',64),(1201,'Tribeca','B9TRIBECA',64),(1202,'XT','XT',64),(1203,'XV Crosstrek','XVCRSSTREK',64),(1204,'Other Subaru Models','SUBOTH',64),(1205,'Aerio','AERIO',65),(1206,'Equator','EQUATOR',65),(1207,'Esteem','ESTEEM',65),(1208,'Forenza','FORENZA',65),(1209,'Grand Vitara','GRANDV',65),(1210,'Kizashi','KIZASHI',65),(1211,'Reno','RENO',65),(1212,'Samurai','SAMUR',65),(1213,'Sidekick','SIDE',65),(1214,'Swift','SWIFT',65),(1215,'SX4','SX4',65),(1216,'Verona','VERONA',65),(1217,'Vitara','VITARA',65),(1218,'X-90','X90',65),(1219,'XL7','XL7',65),(1220,'Other Suzuki Models','SUZOTH',65),(1221,'Roadster','ROADSTER',66),(1222,'4Runner','4RUN',67),(1223,'Avalon','AVALON',67),(1224,'Camry','CAMRY',67),(1225,'Celica','CELICA',67),(1226,'Corolla','COROL',67),(1227,'Corona','CORONA',67),(1228,'Cressida','CRESS',67),(1229,'Echo','ECHO',67),(1230,'FJ Cruiser','FJCRUIS',67),(1231,'Highlander','HIGHLANDER',67),(1232,'Land Cruiser','LC',67),(1233,'Matrix','MATRIX',67),(1234,'MR2','MR2',67),(1235,'MR2 Spyder','MR2SPYDR',67),(1236,'Paseo','PASEO',67),(1237,'Pickup','PICKUP',67),(1238,'Previa','PREVIA',67),(1239,'Prius','PRIUS',67),(1240,'Prius C','PRIUSC',67),(1241,'Prius V','PRIUSV',67),(1242,'RAV4','RAV4',67),(1243,'Sequoia','SEQUOIA',67),(1244,'Sienna','SIENNA',67),(1245,'Solara','SOLARA',67),(1246,'Starlet','STARLET',67),(1247,'Supra','SUPRA',67),(1248,'T100','T100',67),(1249,'Tacoma','TACOMA',67),(1250,'Tercel','TERCEL',67),(1251,'Tundra','TUNDRA',67),(1252,'Van','TOYVAN',67),(1253,'Venza','VENZA',67),(1254,'Yaris','YARIS',67),(1255,'Other Toyota Models','TOYOTH',67),(1256,'TR7','TR7',68),(1257,'TR8','TR8',68),(1258,'Other Triumph Models','TRIOTH',68),(1259,'Beetle','BEETLE',69),(1260,'Cabrio','VOLKSCAB',69),(1261,'Cabriolet','CAB',69),(1262,'CC','CC',69),(1263,'Corrado','CORR',69),(1264,'Dasher','DASHER',69),(1265,'Eos','EOS',69),(1266,'Eurovan','EUROVAN',69),(1267,'Fox','VOLKSFOX',69),(1268,'GLI','GLI',69),(1269,'Golf R','GOLFR',69),(1270,'GTI','GTI',69),(1271,'Golf and Rabbit Models (2)','GOLFANDRABBITMODELS',69),(1272,' - Golf','GOLF',69),(1273,' - Rabbit','RABBIT',69),(1274,'Jetta','JET',69),(1275,'Passat','PASS',69),(1276,'Phaeton','PHAETON',69),(1277,'Pickup','RABBITPU',69),(1278,'Quantum','QUAN',69),(1279,'R32','R32',69),(1280,'Routan','ROUTAN',69),(1281,'Scirocco','SCIR',69),(1282,'Tiguan','TIGUAN',69),(1283,'Touareg','TOUAREG',69),(1284,'Vanagon','VANAG',69),(1285,'Other Volkswagen Models','VWOTH',69),(1286,'240','240',70),(1287,'260','260',70),(1288,'740','740',70),(1289,'760','760',70),(1290,'780','780',70),(1291,'850','850',70),(1292,'940','940',70),(1293,'960','960',70),(1294,'C30','C30',70),(1295,'C70','C70',70),(1296,'S40','S40',70),(1297,'S60','S60',70),(1298,'S70','S70',70),(1299,'S80','S80',70),(1300,'S90','S90',70),(1301,'V40','V40',70),(1302,'V50','V50',70),(1303,'V70','V70',70),(1304,'V90','V90',70),(1305,'XC60','XC60',70),(1306,'XC70','XC',70),(1307,'XC90','XC90',70),(1308,'Other Volvo Models','VOLOTH',70),(1309,'GV','GV',71),(1310,'GVC','GVC',71),(1311,'GVL','GVL',71),(1312,'GVS','GVS',71),(1313,'GVX','GVX',71),(1314,'Other Yugo Models','YUOTH',71);
/*!40000 ALTER TABLE `model` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `orders`
--

DROP TABLE IF EXISTS `orders`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `orders` (
  `ID` int NOT NULL AUTO_INCREMENT,
  `date` date NOT NULL,
  `value` int NOT NULL,
  `buyer_id` int NOT NULL,
  `seller_id` int NOT NULL,
  `vehicle_ID` int NOT NULL,
  `payment_type_ID` int NOT NULL,
  PRIMARY KEY (`ID`,`vehicle_ID`),
  UNIQUE KEY `ID_UNIQUE` (`ID`),
  KEY `fk_orders_users1_idx` (`buyer_id`),
  KEY `fk_orders_users2_idx` (`seller_id`),
  KEY `fk_orders_vehicle1_idx` (`vehicle_ID`),
  KEY `fk_orders_payment_type1_idx` (`payment_type_ID`),
  CONSTRAINT `fk_orders_payment_type1` FOREIGN KEY (`payment_type_ID`) REFERENCES `payment_type` (`ID`),
  CONSTRAINT `fk_orders_users1` FOREIGN KEY (`buyer_id`) REFERENCES `users` (`ID`),
  CONSTRAINT `fk_orders_users2` FOREIGN KEY (`seller_id`) REFERENCES `users` (`ID`),
  CONSTRAINT `fk_orders_vehicle1` FOREIGN KEY (`vehicle_ID`) REFERENCES `vehicle` (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `orders`
--

LOCK TABLES `orders` WRITE;
/*!40000 ALTER TABLE `orders` DISABLE KEYS */;
INSERT INTO `orders` VALUES (2,'2020-12-08',15000,1,6,2,1),(4,'2020-12-08',99000,1,16,5,3);
/*!40000 ALTER TABLE `orders` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `payment_type`
--

DROP TABLE IF EXISTS `payment_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `payment_type` (
  `ID` int NOT NULL,
  `type` varchar(4) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `ID_UNIQUE` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `payment_type`
--

LOCK TABLES `payment_type` WRITE;
/*!40000 ALTER TABLE `payment_type` DISABLE KEYS */;
INSERT INTO `payment_type` VALUES (1,'CASH'),(2,'MC'),(3,'visa'),(4,'AMEX');
/*!40000 ALTER TABLE `payment_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `roles`
--

DROP TABLE IF EXISTS `roles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `roles` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(45) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `roles`
--

LOCK TABLES `roles` WRITE;
/*!40000 ALTER TABLE `roles` DISABLE KEYS */;
INSERT INTO `roles` VALUES (1,'USER'),(2,'ADMIN');
/*!40000 ALTER TABLE `roles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `users` (
  `ID` int NOT NULL AUTO_INCREMENT,
  `user_name` varchar(45) NOT NULL,
  `rating` int DEFAULT NULL,
  `password` varchar(20) NOT NULL,
  `email` varchar(50) NOT NULL,
  `location_ID` int NOT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `user_name` (`user_name`),
  UNIQUE KEY `ID_UNIQUE` (`ID`),
  KEY `fk_users_location1_idx` (`location_ID`),
  CONSTRAINT `lives` FOREIGN KEY (`location_ID`) REFERENCES `location` (`ID`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE=InnoDB AUTO_INCREMENT=45 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (1,'barracuda',NULL,'password1','barracuda@emailformat.com',1),(2,'highvoltage',NULL,'password1','highvoltage@emailformat.com',2),(3,'indominus',NULL,'password1','indominus@emailformat.com',3),(4,'inferno',NULL,'password1','inferno@emailformat.com',4),(5,'invincible',NULL,'password1','invincible@emailformat.com',5),(6,'lightspeed',NULL,'password1','lightspeed@emailformat.com',6),(7,'madmax',NULL,'password1','madmax@emailformat.com',7),(8,'matchbox',NULL,'password1','matchbox@emailformat.com',8),(9,'optimusPhantomWarlock',10,'password1','opw@emailformat.com',9),(10,'dominator',NULL,'password1','dominator@emailformat.com',10),(11,'ladybug',NULL,'password1','ladybug@emailformat.com',11),(12,'plasticFantastic',NULL,'password1','plasticfantastic@emailformat.com',12),(13,'clownshoe',NULL,'password1','clownshoe@emailformat.com',13),(14,'thebrick',NULL,'password1','thebrick@emailformat.com',14),(15,'terminator',NULL,'password1','terminator@emailformat.com',15),(16,'saabaru',NULL,'password1','saabaru@emailformat.com',16),(17,'breadvan',NULL,'password1','breadvan@emailformat.com',17),(18,'rambo lambo',NULL,'password1','rambolambo@emailformat.com',18),(19,'scooby',NULL,'password1','voldamort@emailformat.com',19),(20,'bugeye',NULL,'password1','bugeye@emailformat.com',20),(21,'godzilla',NULL,'password1','godzilla@emailformat.com',21),(22,'goat',NULL,'password1','goat@emailformat.com',22),(23,'voyager',NULL,'password1','voyager@emailformat.com',23),(24,'phantom',NULL,'password1','phantom@emailformat.com',4),(25,'fordor',NULL,'password1','warlock@emailformat.com',5),(26,'garth',NULL,'password1','garth@emailformat.com',6),(27,'getaway',NULL,'password1','getaway@emailformat.com',7),(28,'rendezvous',NULL,'password1','wraith@emailformat.com',8),(29,'carzilla',NULL,'password1','carzilla@emailformat.com',8),(30,'boomer',NULL,'password1','boomer@emailformat.com',3),(31,'test',NULL,'password','leo@email.com',3),(35,'audit',NULL,'audit','audit@email.com',5),(36,'audit2',NULL,'audit2','audit2@email.com',5),(43,'testrole',NULL,'password','role@email',1),(44,'testrole2',NULL,'password','roles@email.com',8);
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `newUser` AFTER INSERT ON `users` FOR EACH ROW insert into audit(type, date, user, detail)

            values ('registration', now(), session_user() , NEW.user_name) */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `assignUserRole` AFTER INSERT ON `users` FOR EACH ROW insert into users_roles(users_ID, roles_id)

        values (NEW.ID, 1) */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `delUser` AFTER DELETE ON `users` FOR EACH ROW insert into audit(type, date, user, detail)

            values ('delete', now(), session_user() , OLD.user_name) */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `users_orders`
--

DROP TABLE IF EXISTS `users_orders`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `users_orders` (
  `UsersID` int NOT NULL,
  `ordersID` int NOT NULL,
  PRIMARY KEY (`UsersID`,`ordersID`),
  KEY `FKUsers_orde271643` (`ordersID`),
  CONSTRAINT `FKUsers_orde271643` FOREIGN KEY (`ordersID`) REFERENCES `orders` (`ID`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `orders` FOREIGN KEY (`UsersID`) REFERENCES `users` (`ID`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users_orders`
--

LOCK TABLES `users_orders` WRITE;
/*!40000 ALTER TABLE `users_orders` DISABLE KEYS */;
/*!40000 ALTER TABLE `users_orders` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users_roles`
--

DROP TABLE IF EXISTS `users_roles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `users_roles` (
  `users_ID` int NOT NULL,
  `roles_id` int NOT NULL,
  PRIMARY KEY (`users_ID`,`roles_id`),
  KEY `fk_users_has_roles_roles1_idx` (`roles_id`),
  KEY `fk_users_has_roles_users1_idx` (`users_ID`),
  CONSTRAINT `fk_users_has_roles_roles1` FOREIGN KEY (`roles_id`) REFERENCES `roles` (`id`),
  CONSTRAINT `fk_users_has_roles_users1` FOREIGN KEY (`users_ID`) REFERENCES `users` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users_roles`
--

LOCK TABLES `users_roles` WRITE;
/*!40000 ALTER TABLE `users_roles` DISABLE KEYS */;
INSERT INTO `users_roles` VALUES (1,1),(2,1),(3,1),(4,1),(5,1),(6,1),(7,1),(8,1),(9,1),(10,1),(11,1),(12,1),(13,1),(14,1),(15,1),(16,1),(17,1),(18,1),(19,1),(20,1),(21,1),(22,1),(23,1),(24,1),(25,1),(26,1),(27,1),(28,1),(29,1),(30,1),(43,1),(44,1),(31,2);
/*!40000 ALTER TABLE `users_roles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users_users`
--

DROP TABLE IF EXISTS `users_users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `users_users` (
  `usersID` int NOT NULL,
  `usersID2` int NOT NULL,
  PRIMARY KEY (`usersID`,`usersID2`),
  KEY `FKusers_user471886` (`usersID2`),
  CONSTRAINT `FKusers_user471886` FOREIGN KEY (`usersID2`) REFERENCES `users` (`ID`),
  CONSTRAINT `rates` FOREIGN KEY (`usersID`) REFERENCES `users` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users_users`
--

LOCK TABLES `users_users` WRITE;
/*!40000 ALTER TABLE `users_users` DISABLE KEYS */;
/*!40000 ALTER TABLE `users_users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `vehicle`
--

DROP TABLE IF EXISTS `vehicle`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `vehicle` (
  `ID` int NOT NULL AUTO_INCREMENT,
  `year` int NOT NULL,
  `colour` varchar(15) NOT NULL,
  `fuel_type` varchar(1) NOT NULL,
  `Kms` int NOT NULL,
  `hp` int NOT NULL,
  `value` int NOT NULL,
  `available` tinyint(1) DEFAULT '1',
  `location_id` int NOT NULL,
  `user_id` int DEFAULT NULL,
  `model_ID` int NOT NULL,
  `make_ID` int NOT NULL,
  `car_image` varchar(255) NOT NULL DEFAULT '/images/no-image-available.jpg',
  PRIMARY KEY (`ID`,`model_ID`,`make_ID`),
  UNIQUE KEY `ID_UNIQUE` (`ID`),
  KEY `fk_vehicle_location1_idx` (`location_id`),
  KEY `fk_vehicle_users1_idx` (`user_id`),
  KEY `fk_vehicle_model1_idx` (`model_ID`),
  KEY `fk_vehicle_make1_idx` (`make_ID`),
  CONSTRAINT `fk_vehicle_location1` FOREIGN KEY (`location_id`) REFERENCES `location` (`ID`),
  CONSTRAINT `fk_vehicle_make1` FOREIGN KEY (`make_ID`) REFERENCES `make` (`ID`),
  CONSTRAINT `fk_vehicle_model1` FOREIGN KEY (`model_ID`) REFERENCES `model` (`ID`),
  CONSTRAINT `fk_vehicle_users1` FOREIGN KEY (`user_id`) REFERENCES `users` (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=34 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `vehicle`
--

LOCK TABLES `vehicle` WRITE;
/*!40000 ALTER TABLE `vehicle` DISABLE KEYS */;
INSERT INTO `vehicle` VALUES (1,2011,'White','F',20000,76,25000,0,4,3,123,8,'/images/no-image-available.jpg'),(2,2007,'Black','D',199999,45,15000,0,3,6,444,22,'/images/no-image-available.jpg'),(3,1998,'Green','D',35999,67,25000,1,2,7,23,1,'/images/acuraZDX.jpg'),(4,2001,'Yellow','D',45999,45,24000,1,23,12,12,1,'/images/no-image-available.jpg'),(5,2019,'Blue','D',55999,76,99000,1,12,16,54,5,'/images/no-image-available.jpg'),(6,2015,'Black','F',110000,76,15000,1,4,18,324,14,'/images/no-image-available.jpg'),(7,2010,'Black','D',12999,76,35000,1,23,3,256,11,'/images/no-image-available.jpg'),(8,2009,'White','D',99999,76,65000,1,6,25,675,36,'/images/no-image-available.jpg'),(9,2010,'White','D',35689,76,89000,1,7,11,1000,48,'/images/no-image-available.jpg'),(11,1997,'Red','D',87000,76,65000,1,4,14,96,8,'/images/no-image-available.jpg'),(12,2003,'Purple','D',205400,76,65000,1,13,2,751,39,'/images/no-image-available.jpg'),(13,2010,'Blue','F',99999,76,35000,1,4,23,234,10,'/images/no-image-available.jpg'),(14,1985,'Red','D',399999,76,15000,1,4,8,345,17,'/images/no-image-available.jpg'),(15,2010,'Yellow','D',99999,76,23000,1,9,5,234,10,'/images/no-image-available.jpg'),(16,1999,'Pink','F',299900,76,24000,1,2,6,234,10,'/images/no-image-available.jpg'),(17,2001,'Grey','D',35000,76,33000,1,4,7,267,11,'/images/no-image-available.jpg'),(18,2010,'Grey','D',150000,76,37000,1,13,3,189,8,'/images/no-image-available.jpg'),(19,2010,'Black','F',155000,76,12000,1,12,8,109,8,'/images/no-image-available.jpg'),(20,2001,'Blue','D',210000,76,12000,1,15,15,297,12,'/images/no-image-available.jpg'),(21,2010,'Green','D',67080,76,40000,1,3,3,568,29,'/images/no-image-available.jpg'),(22,2018,'Yellow','F',95040,76,65000,1,6,9,56,5,'/images/no-image-available.jpg'),(23,2018,'White','D',199020,76,55000,1,9,22,98,8,'/images/no-image-available.jpg'),(24,2017,'Black','D',180000,76,5000,1,12,19,256,11,'/images/no-image-available.jpg'),(25,2016,'Grey','D',56000,76,58000,1,4,4,912,44,'/images/no-image-available.jpg'),(26,2015,'Blue','F',78000,76,65000,1,4,7,43,4,'/images/no-image-available.jpg'),(27,2010,'White','D',45650,76,65000,1,4,8,65,5,'/images/no-image-available.jpg'),(28,2004,'Purple','F',99999,76,18500,1,4,5,89,7,'/images/no-image-available.jpg'),(29,2009,'Green','D',156000,76,65000,1,4,1,35,3,'/images/no-image-available.jpg'),(30,2010,'Black','D',210500,76,65000,1,4,23,2,1,'/images/no-image-available.jpg');
/*!40000 ALTER TABLE `vehicle` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping events for database 'car_dealership'
--

--
-- Dumping routines for database 'car_dealership'
--
/*!50003 DROP PROCEDURE IF EXISTS `makeAvailable` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `makeAvailable`(IN in_id int)
BEGIN
    UPDATE vehicle
   set available = true
       where vehicle.ID = in_id;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `makeUnavailable` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `makeUnavailable`(

IN in_id INTEGER)
BEGIN

    UPDATE vehicle

   set available = false

       where vehicle.ID = in_id;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Final view structure for view `carsavailable`
--

/*!50001 DROP VIEW IF EXISTS `carsavailable`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `carsavailable` AS select `carslisted`.`Build Year` AS `Build Year`,`carslisted`.`Kms` AS `Kms`,`carslisted`.`DKK` AS `DKK`,`carslisted`.`available` AS `available`,`carslisted`.`colour` AS `colour`,`carslisted`.`Make` AS `Make`,`carslisted`.`Model` AS `Model`,`carslisted`.`Seller` AS `Seller` from `carslisted` where (`carslisted`.`available` = 1) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `carslisted`
--

/*!50001 DROP VIEW IF EXISTS `carslisted`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `carslisted` AS select `vehicle`.`year` AS `Build Year`,`vehicle`.`Kms` AS `Kms`,`vehicle`.`value` AS `DKK`,`vehicle`.`available` AS `available`,`vehicle`.`colour` AS `colour`,`m2`.`name` AS `Make`,`m`.`name` AS `Model`,`u`.`user_name` AS `Seller` from ((((`vehicle` join `location` `l` on((`l`.`ID` = `vehicle`.`location_id`))) join `model` `m` on((`m`.`ID` = `vehicle`.`model_ID`))) join `users` `u` on((`u`.`ID` = `vehicle`.`user_id`))) join `make` `m2` on((`m2`.`ID` = `m`.`make_id`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `carsnotavailable`
--

/*!50001 DROP VIEW IF EXISTS `carsnotavailable`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `carsnotavailable` AS select `carslisted`.`Build Year` AS `Build Year`,`carslisted`.`Kms` AS `Kms`,`carslisted`.`DKK` AS `DKK`,`carslisted`.`available` AS `available`,`carslisted`.`colour` AS `colour`,`carslisted`.`Make` AS `Make`,`carslisted`.`Model` AS `Model`,`carslisted`.`Seller` AS `Seller` from `carslisted` where (`carslisted`.`available` = 1) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2020-12-19 11:44:37
