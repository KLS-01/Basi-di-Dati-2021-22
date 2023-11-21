-- MySQL dump 10.13  Distrib 8.0.27, for Win64 (x86_64)
--
-- Host: localhost    Database: michela
-- ------------------------------------------------------
-- Server version	8.0.27

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
-- Table structure for table `accessoria`
--

DROP TABLE IF EXISTS `accessoria`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `accessoria` (
  `Nome` varchar(45) NOT NULL,
  `Destinazione d'uso` varchar(45) NOT NULL,
  `Applicabile a più macchinari` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`Nome`)
) ENGINE=InnoDB DEFAULT CHARSET=utf32;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `accessoria`
--

LOCK TABLES `accessoria` WRITE;
/*!40000 ALTER TABLE `accessoria` DISABLE KEYS */;
INSERT INTO `accessoria` VALUES ('Aspiratore punti neri','Viso',0),('Maschera','Viso',1),('Massaggiatore','Corpo',0),('Massaggiatore anticellulite','Corpo',1),('Pediluvio','Piedi',1),('Sauna vapore viso','Viso',1),('Scrub pelle','Viso',1),('Spazzola Viso','Massaggiatore facciale',1),('Ultrasuoni','Corpo',0);
/*!40000 ALTER TABLE `accessoria` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `associazione`
--

DROP TABLE IF EXISTS `associazione`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `associazione` (
  `Macchinario base` varchar(10) NOT NULL,
  `Macchinario accessorio` varchar(10) NOT NULL,
  PRIMARY KEY (`Macchinario base`,`Macchinario accessorio`),
  KEY `macchinario base_idx` (`Macchinario base`),
  KEY `macchinario acessorio_idx` (`Macchinario accessorio`),
  CONSTRAINT `macchinario acessorio` FOREIGN KEY (`Macchinario accessorio`) REFERENCES `macchinario` (`Codice seriale`),
  CONSTRAINT `macchinario base` FOREIGN KEY (`Macchinario base`) REFERENCES `macchinario` (`Codice seriale`)
) ENGINE=InnoDB DEFAULT CHARSET=utf32;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `associazione`
--

LOCK TABLES `associazione` WRITE;
/*!40000 ALTER TABLE `associazione` DISABLE KEYS */;
INSERT INTO `associazione` VALUES ('AF-2348','EF-5679'),('AF-2356','EF-5678'),('AF-3321','EF-2219'),('AF-8909','EF-2222'),('AF-8909','EF-2322');
/*!40000 ALTER TABLE `associazione` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `base`
--

DROP TABLE IF EXISTS `base`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `base` (
  `Nome` varchar(45) NOT NULL,
  `Destinazione d'uso` varchar(45) NOT NULL,
  `Lunghezza` decimal(5,2) NOT NULL,
  `Larghezza` decimal(5,2) NOT NULL,
  `Altezza` decimal(5,2) NOT NULL,
  `Trattamenti` varchar(45) NOT NULL,
  PRIMARY KEY (`Nome`)
) ENGINE=InnoDB DEFAULT CHARSET=utf32;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `base`
--

LOCK TABLES `base` WRITE;
/*!40000 ALTER TABLE `base` DISABLE KEYS */;
INSERT INTO `base` VALUES ('Elettroporatore','Viso',20.00,19.30,20.00,'Maschere per viso'),('Fotoepilazione','Peli',27.60,9.75,19.42,'Epilazione'),('Mesoterapia','Viso',20.80,11.00,9.20,'Anti-età'),('Microdermo  abarasation','Rimozione impurità',20.00,40.00,37.00,'Rimozione nei, punti neri e rughe'),('Pressoterapia','Corpo',46.00,25.40,31.00,'Massaggio'),('Termoepilazione','Dimagrimento',19.42,75.00,27.60,'Procter & Gamble');
/*!40000 ALTER TABLE `base` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cliente`
--

DROP TABLE IF EXISTS `cliente`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cliente` (
  `CF` char(16) NOT NULL,
  `Nome` varchar(45) NOT NULL,
  `Cognome` varchar(45) NOT NULL,
  `data_di_nascita` date NOT NULL,
  `#_acquisti` int NOT NULL DEFAULT '0',
  `#_telefono` varchar(15) NOT NULL,
  `email` varchar(45) NOT NULL,
  PRIMARY KEY (`CF`)
) ENGINE=InnoDB DEFAULT CHARSET=utf32;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cliente`
--

LOCK TABLES `cliente` WRITE;
/*!40000 ALTER TABLE `cliente` DISABLE KEYS */;
INSERT INTO `cliente` VALUES ('FRRLGU92P10A662I','Luigi','Ferrante','1992-09-10',2,'3348077321','luigiferrante@gmail.com'),('LGGGLC74S13A580W','Gianluca','Leggiero','1974-11-13',2,'3675432312','leggiadro.gian@gmail.com'),('PSCNTN82D15G230T','Antonio','Pischello','1982-04-15',2,'3245679856','a.pischello2@gmail.com'),('RSSMRA78C16H860H','Mario','Rossi','1996-03-16',0,'339333993','marross@libero.it'),('SCLLGU66A06F839T','Luigi','Scala','1966-01-06',3,'3393036555','ScalaLuigi@gmail.com'),('SVNRRT93T17H433X','Roberto','Saviano','1993-12-17',1,'3564380673','saviano23@gmail.com');
/*!40000 ALTER TABLE `cliente` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `coinvolgimento ingegnere`
--

DROP TABLE IF EXISTS `coinvolgimento ingegnere`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `coinvolgimento ingegnere` (
  `Ingegnere` char(16) NOT NULL,
  `Intervento di manutenzione` int NOT NULL,
  `# ore impiegate` int NOT NULL DEFAULT '0',
  `Data inizio` date NOT NULL,
  `Data fine` date DEFAULT NULL,
  PRIMARY KEY (`Ingegnere`,`Intervento di manutenzione`),
  KEY `intervento_di_manutenzione_idx` (`Intervento di manutenzione`),
  KEY `Ingegnere_idx` (`Ingegnere`),
  CONSTRAINT `Ingegnere` FOREIGN KEY (`Ingegnere`) REFERENCES `ingegnere` (`CF`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `intervento_di_manutenzione` FOREIGN KEY (`Intervento di manutenzione`) REFERENCES `intervento di manutenzione` (`# progressivo`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf32;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `coinvolgimento ingegnere`
--

LOCK TABLES `coinvolgimento ingegnere` WRITE;
/*!40000 ALTER TABLE `coinvolgimento ingegnere` DISABLE KEYS */;
INSERT INTO `coinvolgimento ingegnere` VALUES ('GVNMCC66M01G942U',1,2,'2021-11-12','2021-12-15'),('GVNMCC66M01G942U',2,10,'2021-12-11','2021-12-15'),('MCHFLL01E46A509R',1,12,'2021-11-12','2021-12-15'),('MCHFLL01E46A509R',2,5,'2021-12-11','2021-12-15'),('MCHFLL01E46A509R',3,3,'2021-08-15',NULL),('MCHFLL01E46A509R',5,0,'2022-01-09',NULL),('NCLMRA01M07F839B',3,5,'2021-08-15',NULL),('SRTLNZ80A01D612N',2,10,'2021-12-11','2021-12-15'),('SRTLNZ80A01D612N',3,7,'2021-08-15',NULL);
/*!40000 ALTER TABLE `coinvolgimento ingegnere` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `coinvolgimento operaio`
--

DROP TABLE IF EXISTS `coinvolgimento operaio`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `coinvolgimento operaio` (
  `Intervento di manutenzione` int NOT NULL,
  `Operaio` char(16) NOT NULL,
  `# ore impiegate` varchar(45) NOT NULL,
  `Data inizio` date NOT NULL,
  `Data fine` date DEFAULT NULL,
  PRIMARY KEY (`Intervento di manutenzione`,`Operaio`),
  KEY `Intervento di manutenzione_idx` (`Intervento di manutenzione`),
  KEY `Operaio_idx` (`Operaio`),
  CONSTRAINT `Intervento di manutenzione` FOREIGN KEY (`Intervento di manutenzione`) REFERENCES `intervento di manutenzione` (`# progressivo`),
  CONSTRAINT `Operaio` FOREIGN KEY (`Operaio`) REFERENCES `operaio` (`CF`)
) ENGINE=InnoDB DEFAULT CHARSET=utf32;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `coinvolgimento operaio`
--

LOCK TABLES `coinvolgimento operaio` WRITE;
/*!40000 ALTER TABLE `coinvolgimento operaio` DISABLE KEYS */;
INSERT INTO `coinvolgimento operaio` VALUES (1,'DRSCRN01R57F924Y','2','2021-11-12','2021-12-15'),(1,'MCHPTC80A01I469C','3','2021-11-12','2021-12-15'),(1,'RSSMRO98S11H456O','1','2021-11-12','2021-12-15'),(2,'PRPLGN68A01A509Q','12','2021-12-11','2021-12-15'),(2,'PRTNNA90C57H501F','13','2021-12-11','2021-12-15'),(2,'RSSMRO98S11H456O','8','2021-12-11','2021-12-15'),(2,'SCLBDT01S12H860U','15','2021-12-11','2021-12-15'),(2,'VSSGPP56C17F839Y','11','2021-12-11','2021-12-15'),(3,'DRSCRN01R57F924Y','0','2022-01-09',NULL),(4,'MCHPTC80A01I469C','0','2022-01-09',NULL),(5,'MCHPTC80A01I469C','1','2021-11-10',NULL),(5,'SMMNNA65I49E456U','0','2021-11-10',NULL);
/*!40000 ALTER TABLE `coinvolgimento operaio` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `corriere`
--

DROP TABLE IF EXISTS `corriere`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `corriere` (
  `Targa` varchar(12) NOT NULL,
  `Società` varchar(45) NOT NULL,
  `Data primo impiego` date DEFAULT NULL,
  PRIMARY KEY (`Targa`)
) ENGINE=InnoDB DEFAULT CHARSET=utf32;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `corriere`
--

LOCK TABLES `corriere` WRITE;
/*!40000 ALTER TABLE `corriere` DISABLE KEYS */;
INSERT INTO `corriere` VALUES ('EW902DZ','Amazon','2021-07-12'),('FC402MJ','Bartolini','2021-05-06'),('FV181EX','Poste Italiane','2021-03-04');
/*!40000 ALTER TABLE `corriere` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ingegnere`
--

DROP TABLE IF EXISTS `ingegnere`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ingegnere` (
  `CF` char(16) NOT NULL,
  `Nome` varchar(45) NOT NULL,
  `Cognome` varchar(45) NOT NULL,
  `data_di_nascita` date NOT NULL,
  `Tipo contratto` varchar(45) NOT NULL,
  `#_telefono` varchar(15) NOT NULL,
  `e-mail` varchar(45) NOT NULL,
  `Specializzazione` varchar(45) NOT NULL,
  `Albo professionale` varchar(45) NOT NULL,
  PRIMARY KEY (`CF`)
) ENGINE=InnoDB DEFAULT CHARSET=utf32;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ingegnere`
--

LOCK TABLES `ingegnere` WRITE;
/*!40000 ALTER TABLE `ingegnere` DISABLE KEYS */;
INSERT INTO `ingegnere` VALUES ('GVNMCC66M01G942U','Giovanni','Muciaccia','1989-07-01','Indeterminato','3256789546','ArtAttack@rai.it','Civile','Ordine degli ingegneri NA'),('MCHFLL01E46A509R','Michela','Faella','2001-05-06','Determinato','3248788433','michelafaella@unisa.it','Biochimica','Ordine degli ingegneri AV'),('NCLMRA01M07F839B','Nicola','Mauro','1999-02-13','Stage','3393046777','Scoobydoo@gmail.com','Informatica','Ordine degli ingegneri NA'),('PLMNCL86D15L113W','Nicola','Palmieri','0000-00-00','Determinato','3237382382','qdss@gmail.com','Informatica','Ordine degli ingegneri CB'),('SRTLNZ80A01D612N','Lorenzo','Soreta','2000-06-06','Stage','3254789467','sorlor@gmail.com','Gestionale','Ordine degli ingegneri FR');
/*!40000 ALTER TABLE `ingegnere` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `intervento di manutenzione`
--

DROP TABLE IF EXISTS `intervento di manutenzione`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `intervento di manutenzione` (
  `# progressivo` int NOT NULL AUTO_INCREMENT,
  `Macchinario` varchar(12) NOT NULL,
  `Data completamento` date DEFAULT NULL,
  `Data inizio` date NOT NULL,
  `Stato dell'intervento` varchar(45) NOT NULL,
  PRIMARY KEY (`# progressivo`,`Macchinario`),
  KEY `Macchinario_idx` (`Macchinario`),
  CONSTRAINT `Macchinario` FOREIGN KEY (`Macchinario`) REFERENCES `macchinario` (`Codice seriale`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf32;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `intervento di manutenzione`
--

LOCK TABLES `intervento di manutenzione` WRITE;
/*!40000 ALTER TABLE `intervento di manutenzione` DISABLE KEYS */;
INSERT INTO `intervento di manutenzione` VALUES (1,'AF-2348','2021-12-15','2021-11-12','Completato'),(2,'EF-2219','2021-12-15','2021-12-11','Completato'),(3,'AF-3321',NULL,'2021-08-15','Verificato'),(4,'EF-5679',NULL,'2021-11-12','Richiesto'),(5,'AF-3340',NULL,'2021-11-10','Valutato'),(6,'AF-2348',NULL,'2022-01-09','Richiesto');
/*!40000 ALTER TABLE `intervento di manutenzione` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `intervento di sostituzione`
--

DROP TABLE IF EXISTS `intervento di sostituzione`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `intervento di sostituzione` (
  `Tipo` varchar(45) NOT NULL,
  `Intervento di manutenzione` int NOT NULL,
  `Ingegnere` char(16) NOT NULL,
  PRIMARY KEY (`Tipo`,`Intervento di manutenzione`),
  KEY `Intervento di manutenzione_idx` (`Intervento di manutenzione`),
  KEY `Ingegnere_idx` (`Ingegnere`),
  CONSTRAINT `Ingegnere_sostituzione` FOREIGN KEY (`Ingegnere`) REFERENCES `ingegnere` (`CF`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `manutenzione_sostituzione` FOREIGN KEY (`Intervento di manutenzione`) REFERENCES `intervento di manutenzione` (`# progressivo`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf32;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `intervento di sostituzione`
--

LOCK TABLES `intervento di sostituzione` WRITE;
/*!40000 ALTER TABLE `intervento di sostituzione` DISABLE KEYS */;
INSERT INTO `intervento di sostituzione` VALUES ('Sostituzione bulloni',2,'GVNMCC66M01G942U'),('Sositutzione guarnizione',3,'MCHFLL01E46A509R');
/*!40000 ALTER TABLE `intervento di sostituzione` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `macchinario`
--

DROP TABLE IF EXISTS `macchinario`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `macchinario` (
  `Codice seriale` varchar(10) NOT NULL,
  `Cliente` char(16) DEFAULT NULL,
  `Base` varchar(45) DEFAULT NULL,
  `Accessoria` varchar(45) DEFAULT NULL,
  `corriere` varchar(12) DEFAULT NULL,
  `Descrizione` varchar(300) NOT NULL,
  `Prezzo` decimal(8,2) NOT NULL,
  `# lotto` int NOT NULL,
  PRIMARY KEY (`Codice seriale`),
  KEY `corriere_idx` (`corriere`),
  KEY `base_idx` (`Base`),
  KEY `accessoria_idx` (`Accessoria`),
  KEY `cliente_idx` (`Cliente`),
  CONSTRAINT `accessoria` FOREIGN KEY (`Accessoria`) REFERENCES `accessoria` (`Nome`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `base` FOREIGN KEY (`Base`) REFERENCES `base` (`Nome`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `cliente` FOREIGN KEY (`Cliente`) REFERENCES `cliente` (`CF`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `corriere` FOREIGN KEY (`corriere`) REFERENCES `corriere` (`Targa`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf32;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `macchinario`
--

LOCK TABLES `macchinario` WRITE;
/*!40000 ALTER TABLE `macchinario` DISABLE KEYS */;
INSERT INTO `macchinario` VALUES ('AF-2001',NULL,'Microdermo  abarasation',NULL,NULL,'Apparecchiatura professionale per microdermoabrasione con punta di diamante e punta di cristalli di corindone.',1209.33,19),('AF-2005',NULL,'Elettroporatore',NULL,NULL,'È un generatore di correnti impulsive che permette trattamenti di veicolazione superficiale con una metodologia assolutamente incruenta e non invasiva.',340.00,13),('AF-2348','LGGGLC74S13A580W','Mesoterapia',NULL,NULL,'Il massaggio facciale ad ultrasuoni può essere antietà, antirughe, rassodante e liftante, riduce l\'acne ei punti neri, restringe i pori, sbianca la pelle e rimuove le lentiggini. Mantieni l\'elasticità e la giovinezza della pelle sana.',110.99,12),('AF-2356','FRRLGU92P10A662I','Fotoepilazione',NULL,'FC402MJ','L’epilatore luce pulsata più sicuro, più rapido ed efficiente',124.56,23),('AF-3321','PSCNTN82D15G230T','Pressoterapia',NULL,NULL,'ATTENZIONE, SEMPLICE OPERAZIONE DA EFFETTUARE PRIMA DELL\'USO: RIMUOVERE LA VITE DI BLOCCO MOTORE.',33.29,11),('AF-3340','SVNRRT93T17H433X','Termoepilazione',NULL,NULL,'La tecnologia a luce pulsata sicura; clinicamente testata',6.99,8),('AF-5689',NULL,'Mesoterapia',NULL,NULL,'L’epilatore luce pulsata più sicuro, più rapido ed efficiente',19.99,25),('AF-8909','SCLLGU66A06F839T','Termoepilazione',NULL,'FV181EX','La rimozione delle rughe a radiofrequenza è un metodo di trattamento non invasivo ed è uno dei metodi più sicuri ed efficaci per la rimozione delle rughe',255.99,55),('EF-2219','PSCNTN82D15G230T',NULL,'Spazzola Viso','FV181EX','Una spazzola che delicatamente e efficacemente purifica la pelle in un solo minuto',172.50,11),('EF-2222','SCLLGU66A06F839T',NULL,'Pediluvio',NULL,'Pediluvio per un benefico idromassaggio plantare comodamente a casa',38.98,55),('EF-2322','SCLLGU66A06F839T',NULL,'Massaggiatore','FC402MJ','Una maschera che elimina ogni impurità facciale',4.99,55),('EF-2325',NULL,NULL,'Maschera',NULL,'Il massaggiatore massaggia tutto il corpo',39.99,2),('EF-5678','FRRLGU92P10A662I',NULL,'Aspiratore punti neri','FV181EX','L\'aspiratore punti neri viso può rimuovere efficacemente Comedone, punti neri, Grasso, pelle morta e residui di trucco, rende la pelle profondamente pulita e luminosa.',19.99,23),('EF-5679','LGGGLC74S13A580W',NULL,'Scrub pelle',NULL,'realizzata pensando ad uno strumento di uso domestico per il benessere della pelle del viso',34.90,12),('EF-7810',NULL,NULL,'Massaggiatore',NULL,'L\'aspiratore punti neri viso può rimuovere efficacemente Comedone, punti neri, Grasso, pelle morta e residui di trucco, rende la pelle profondamente pulita e luminosa.',37.90,11);
/*!40000 ALTER TABLE `macchinario` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `operaio`
--

DROP TABLE IF EXISTS `operaio`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `operaio` (
  `CF` char(16) NOT NULL,
  `Nome` varchar(45) NOT NULL,
  `Cognome` varchar(45) NOT NULL,
  `data_di_nascita` date NOT NULL,
  `e-mail` varchar(45) NOT NULL,
  `#_telefono` varchar(15) NOT NULL,
  `# ore manutenzione` int NOT NULL DEFAULT '0',
  `Tipo Contratto` varchar(45) NOT NULL,
  PRIMARY KEY (`CF`)
) ENGINE=InnoDB DEFAULT CHARSET=utf32;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `operaio`
--

LOCK TABLES `operaio` WRITE;
/*!40000 ALTER TABLE `operaio` DISABLE KEYS */;
INSERT INTO `operaio` VALUES ('DRSCRN01R57F924Y','Caterina','De Risi','1999-01-12','DeRisi@libero.it','3248788458',50,'Indeterminato'),('MCHPTC80A01I469C','Michele','Portici','1968-12-03','michele.portici@outlook.it','3567894523',23,'Stage'),('PRPLGN68A01A509Q','Priapo','Lungone','1971-05-21','romeGods@outlook.it','3325643222',55,'Indeterminato'),('PRTNNA90C57H501F','Parete','Anna','1981-06-12','annaparete@gmail.com','3567432358',33,'Indeterminato'),('RSSMRO98S11H456O','Mario','Rossi','1977-03-08','mariorossi@gmail.com','3896542345',25,'Determinato'),('SCLBDT01S12H860U','Benedetto','Scala','2001-11-12','supermail2345@gmail.com','3556789456',12,'Part-time'),('SMMNNA65I49E456U','Anna','Sommese','1998-02-02','supermail5674@libero.com','3986574523',16,'Indeterminato'),('VSSGPP56C17F839Y','Giuseppe','Vessicchio','1968-12-05','musicLover@gmail.com','3393036579',45,'Stage');
/*!40000 ALTER TABLE `operaio` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `partecipazione`
--

DROP TABLE IF EXISTS `partecipazione`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `partecipazione` (
  `Codice` varchar(10) NOT NULL,
  `Progetto` varchar(10) NOT NULL,
  `Operaio` char(16) NOT NULL,
  PRIMARY KEY (`Codice`),
  KEY `partecipazione_progetto_idx` (`Progetto`),
  KEY `partecipazione_operaio_idx` (`Operaio`),
  CONSTRAINT `partecipazione_operaio` FOREIGN KEY (`Operaio`) REFERENCES `operaio` (`CF`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `partecipazione_progetto` FOREIGN KEY (`Progetto`) REFERENCES `progetto` (`identificativo`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf32;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `partecipazione`
--

LOCK TABLES `partecipazione` WRITE;
/*!40000 ALTER TABLE `partecipazione` DISABLE KEYS */;
INSERT INTO `partecipazione` VALUES ('PA-1','PG-1','DRSCRN01R57F924Y'),('PA-10','PG-4','PRTNNA90C57H501F'),('PA-11','PG-5','VSSGPP56C17F839Y'),('PA-12','PG-5','MCHPTC80A01I469C'),('PA-13','PG-6','SCLBDT01S12H860U'),('PA-14','PG-7','RSSMRO98S11H456O'),('PA-15','PG-7','VSSGPP56C17F839Y'),('PA-16','PG-8','DRSCRN01R57F924Y'),('PA-17','PG-8','PRPLGN68A01A509Q'),('PA-18','PG-9','PRTNNA90C57H501F'),('PA-19','PG-9','VSSGPP56C17F839Y'),('PA-2','PG-2','MCHPTC80A01I469C'),('PA-3','PG-2','DRSCRN01R57F924Y'),('PA-4','PG-2','PRTNNA90C57H501F'),('PA-5','PG-3','SCLBDT01S12H860U'),('PA-6','PG-3','SMMNNA65I49E456U'),('PA-7','PG-4','RSSMRO98S11H456O'),('PA-8','PG-4','PRPLGN68A01A509Q'),('PA-9','PG-4','MCHPTC80A01I469C');
/*!40000 ALTER TABLE `partecipazione` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `progetto`
--

DROP TABLE IF EXISTS `progetto`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `progetto` (
  `identificativo` varchar(10) NOT NULL,
  `Ingegnere` char(16) NOT NULL,
  `tipo` varchar(45) NOT NULL,
  `macchinario` varchar(10) NOT NULL,
  PRIMARY KEY (`identificativo`),
  KEY `macchinario_progetto_idx` (`macchinario`),
  KEY `Ingegnere_progetto_idx` (`Ingegnere`),
  CONSTRAINT `Ingegnere_progetto` FOREIGN KEY (`Ingegnere`) REFERENCES `ingegnere` (`CF`),
  CONSTRAINT `macchinario_progetto` FOREIGN KEY (`macchinario`) REFERENCES `macchinario` (`Codice seriale`)
) ENGINE=InnoDB DEFAULT CHARSET=utf32;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `progetto`
--

LOCK TABLES `progetto` WRITE;
/*!40000 ALTER TABLE `progetto` DISABLE KEYS */;
INSERT INTO `progetto` VALUES ('PG-1','GVNMCC66M01G942U','Commercializzato','AF-2348'),('PG-10','SRTLNZ80A01D612N','Commercializzato','EF-5679'),('PG-11','MCHFLL01E46A509R','Prototipale','EF-2325'),('PG-12','GVNMCC66M01G942U','Pilota','AF-2001'),('PG-13','SRTLNZ80A01D612N','Collaudato','AF-2005'),('PG-14','GVNMCC66M01G942U','Commercializzato','EF-7810'),('PG-15','GVNMCC66M01G942U','Commercializzato','AF-5689'),('PG-2','MCHFLL01E46A509R','Commercializzato','AF-2356'),('PG-3','NCLMRA01M07F839B','Commercializzato','AF-3321'),('PG-4','MCHFLL01E46A509R','Commercializzato','AF-3340'),('PG-5','GVNMCC66M01G942U','Commercializzato','AF-8909'),('PG-6','SRTLNZ80A01D612N','Commercializzato','EF-2219'),('PG-7','NCLMRA01M07F839B','Commercializzato','EF-2222'),('PG-8','MCHFLL01E46A509R','Commercializzato','EF-2322'),('PG-9','GVNMCC66M01G942U','Commercializzato','EF-5678');
/*!40000 ALTER TABLE `progetto` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2022-01-09 19:06:38
