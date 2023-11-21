CREATE DATABASE  IF NOT EXISTS `databasemacchinariestetici` /*!40100 DEFAULT CHARACTER SET utf32 */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `databasemacchinariestetici`;
-- MySQL dump 10.13  Distrib 8.0.27, for Win64 (x86_64)
--
-- Host: localhost    Database: databasemacchinariestetici
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
-- Table structure for table `associazione`
--

DROP TABLE IF EXISTS `associazione`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `associazione` (
  `codice` int NOT NULL AUTO_INCREMENT,
  `Macchinario base` varchar(10) NOT NULL,
  `Macchinario accessorio` varchar(10) NOT NULL,
  PRIMARY KEY (`codice`),
  KEY `macchinario base_idx` (`Macchinario base`),
  KEY `macchinario acessorio_idx` (`Macchinario accessorio`),
  CONSTRAINT `macchinario acessorio` FOREIGN KEY (`Macchinario accessorio`) REFERENCES `macchinario` (`Codice seriale`),
  CONSTRAINT `macchinario base` FOREIGN KEY (`Macchinario base`) REFERENCES `macchinario` (`Codice seriale`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf32;
/*!40101 SET character_set_client = @saved_cs_client */;

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
-- Table structure for table `coinvolgimento ingegnere`
--

DROP TABLE IF EXISTS `coinvolgimento ingegnere`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `coinvolgimento ingegnere` (
  `Codice` int NOT NULL AUTO_INCREMENT,
  `Ingegnere` char(16) NOT NULL,
  `Intervento di manutenzione` int NOT NULL,
  `# ore impiegate` int NOT NULL DEFAULT '0',
  `Data inizio` date NOT NULL,
  `Data fine` date DEFAULT NULL,
  PRIMARY KEY (`Codice`),
  KEY `intervento_di_manutenzione_idx` (`Intervento di manutenzione`),
  KEY `Ingegnere_idx` (`Ingegnere`),
  CONSTRAINT `Ingegnere` FOREIGN KEY (`Ingegnere`) REFERENCES `ingegnere` (`CF`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `intervento_di_manutenzione` FOREIGN KEY (`Intervento di manutenzione`) REFERENCES `intervento di manutenzione` (`# progressivo`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf32;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `coinvolgimento operaio`
--

DROP TABLE IF EXISTS `coinvolgimento operaio`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `coinvolgimento operaio` (
  `Codice` int NOT NULL AUTO_INCREMENT,
  `Intervento di manutenzione` int NOT NULL,
  `Operaio` char(16) NOT NULL,
  `# ore impiegate` varchar(45) NOT NULL,
  `Data inizio` date NOT NULL,
  `Data fine` date DEFAULT NULL,
  PRIMARY KEY (`Codice`),
  KEY `Intervento di manutenzione_idx` (`Intervento di manutenzione`),
  KEY `Operaio_idx` (`Operaio`),
  CONSTRAINT `Intervento di manutenzione` FOREIGN KEY (`Intervento di manutenzione`) REFERENCES `intervento di manutenzione` (`# progressivo`),
  CONSTRAINT `Operaio` FOREIGN KEY (`Operaio`) REFERENCES `operaio` (`CF`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf32;
/*!40101 SET character_set_client = @saved_cs_client */;

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
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf32;
/*!40101 SET character_set_client = @saved_cs_client */;

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
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2021-12-11 14:50:09
