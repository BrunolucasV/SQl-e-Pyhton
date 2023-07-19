CREATE DATABASE  IF NOT EXISTS `academia` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `academia`;
-- MySQL dump 10.13  Distrib 8.0.33, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: academia
-- ------------------------------------------------------
-- Server version	8.0.33

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
-- Table structure for table `bonus`
--

DROP TABLE IF EXISTS `bonus`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `bonus` (
  `id_funcionario` int unsigned NOT NULL,
  `alunos` int unsigned DEFAULT NULL,
  PRIMARY KEY (`id_funcionario`),
  CONSTRAINT `bonus_FK` FOREIGN KEY (`id_funcionario`) REFERENCES `funcionario` (`id_funcionairo`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bonus`
--

LOCK TABLES `bonus` WRITE;
/*!40000 ALTER TABLE `bonus` DISABLE KEYS */;
INSERT INTO `bonus` VALUES (1,2),(3,1);
/*!40000 ALTER TABLE `bonus` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cadastro`
--

DROP TABLE IF EXISTS `cadastro`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cadastro` (
  `nome` varchar(100) NOT NULL,
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `email` varchar(100) NOT NULL,
  `telf` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `cadastro_un` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cadastro`
--

LOCK TABLES `cadastro` WRITE;
/*!40000 ALTER TABLE `cadastro` DISABLE KEYS */;
INSERT INTO `cadastro` VALUES ('bruno',1,'bruno@gmail.com','0000000000'),('luiz',2,'luiz@gmail.com','1111111111'),('paula',3,'paula@gmail.com','2222222222');
/*!40000 ALTER TABLE `cadastro` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cadastro_info`
--

DROP TABLE IF EXISTS `cadastro_info`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cadastro_info` (
  `cadastro_id` int unsigned NOT NULL,
  `peso` int unsigned NOT NULL,
  `altura` float NOT NULL,
  `objetivo` text,
  `nacimento` date DEFAULT NULL,
  `cpf` bigint unsigned NOT NULL,
  `id_funcionario` int unsigned NOT NULL,
  PRIMARY KEY (`cadastro_id`,`id_funcionario`),
  UNIQUE KEY `cadastro_info_un` (`cpf`),
  KEY `cadastro_info_FK_1` (`id_funcionario`),
  CONSTRAINT `cadastro_info_FK` FOREIGN KEY (`cadastro_id`) REFERENCES `cadastro` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `cadastro_info_FK_1` FOREIGN KEY (`id_funcionario`) REFERENCES `funcionario` (`id_funcionairo`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cadastro_info`
--

LOCK TABLES `cadastro_info` WRITE;
/*!40000 ALTER TABLE `cadastro_info` DISABLE KEYS */;
INSERT INTO `cadastro_info` VALUES (1,78,1.81,'hipertofia','1998-02-04',12365478925,1),(2,120,1.75,'perca de peso','1999-04-07',15415615641,3),(3,52,1.68,'hipertofia','2004-02-25',11111222145,1);
/*!40000 ALTER TABLE `cadastro_info` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `funcionario`
--

DROP TABLE IF EXISTS `funcionario`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `funcionario` (
  `id_funcionairo` int unsigned NOT NULL AUTO_INCREMENT,
  `telf` varchar(20) NOT NULL,
  `email` varchar(100) NOT NULL,
  `conta` bigint unsigned NOT NULL,
  `cpf` bigint unsigned NOT NULL,
  `nome` varchar(100) NOT NULL,
  PRIMARY KEY (`id_funcionairo`),
  UNIQUE KEY `funcionario_un` (`email`,`conta`,`cpf`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `funcionario`
--

LOCK TABLES `funcionario` WRITE;
/*!40000 ALTER TABLE `funcionario` DISABLE KEYS */;
INSERT INTO `funcionario` VALUES (1,'000000000','marcelo@gmai.com',24124525,12345678900,'marcelo'),(2,'111111111','ana@gmail.com',41485745,47891245007,'ana'),(3,'222222222','paulo@gmail.com',48545494,14554512452,'paulo'),(4,'33333333333','chico@gmail.com',1573,14831294,'chico');
/*!40000 ALTER TABLE `funcionario` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `orcamento`
--

DROP TABLE IF EXISTS `orcamento`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `orcamento` (
  `cadastro_id` int unsigned NOT NULL,
  `pagamento` float NOT NULL,
  `vencimento` datetime DEFAULT NULL,
  PRIMARY KEY (`cadastro_id`),
  CONSTRAINT `orcamento_FK` FOREIGN KEY (`cadastro_id`) REFERENCES `cadastro` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `orcamento`
--

LOCK TABLES `orcamento` WRITE;
/*!40000 ALTER TABLE `orcamento` DISABLE KEYS */;
INSERT INTO `orcamento` VALUES (1,72,'2023-02-15 00:00:00'),(2,72,'2023-05-01 14:52:00'),(3,52,'2024-01-01 00:00:00');
/*!40000 ALTER TABLE `orcamento` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-07-19 20:28:51
