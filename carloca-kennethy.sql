CREATE DATABASE  IF NOT EXISTS `carloca` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `carloca`;
-- MySQL dump 10.13  Distrib 8.0.29, for Linux (x86_64)
--
-- Host: 127.0.0.1    Database: carloca
-- ------------------------------------------------------
-- Server version	8.0.32

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
-- Table structure for table `ALUGUEL`
--

DROP TABLE IF EXISTS `ALUGUEL`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ALUGUEL` (
  `id` int NOT NULL AUTO_INCREMENT,
  `cliente_id` int NOT NULL,
  `carro_id` int NOT NULL,
  `data_aluguel` date NOT NULL,
  `hora_alguel` time NOT NULL,
  `data_devolução` date NOT NULL,
  `hora_devolução` time NOT NULL,
  `km_aluguel` int NOT NULL,
  `km_devolução` int NOT NULL,
  `unidade_aluguel_id` int NOT NULL,
  `unidade_devolução_id` int NOT NULL,
  `status` enum('em andamento','finalizado','cancelado') NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_UNIQUE` (`id`),
  KEY `fk_ALUGUEL_1_idx` (`cliente_id`),
  KEY `fk_ALUGUEL_2_idx` (`carro_id`),
  KEY `fk_ALUGUEL_3_idx` (`unidade_aluguel_id`),
  KEY `fk_ALUGUEL_4_idx` (`unidade_devolução_id`),
  CONSTRAINT `fk_ALUGUEL_CARRO` FOREIGN KEY (`carro_id`) REFERENCES `CARROS` (`id`),
  CONSTRAINT `fk_ALUGUEL_CLIENTE` FOREIGN KEY (`cliente_id`) REFERENCES `CLIENTES` (`id`),
  CONSTRAINT `fk_ALUGUEL_UNIDADE_1` FOREIGN KEY (`unidade_aluguel_id`) REFERENCES `UNIDADES` (`id`),
  CONSTRAINT `fk_ALUGUEL_UNIDADE_2` FOREIGN KEY (`unidade_devolução_id`) REFERENCES `UNIDADES` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ALUGUEL`
--

LOCK TABLES `ALUGUEL` WRITE;
/*!40000 ALTER TABLE `ALUGUEL` DISABLE KEYS */;
/*!40000 ALTER TABLE `ALUGUEL` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `CARROS`
--

DROP TABLE IF EXISTS `CARROS`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `CARROS` (
  `id` int NOT NULL AUTO_INCREMENT,
  `modelo` varchar(45) NOT NULL,
  `montadora_id` int NOT NULL,
  `cor_id` int NOT NULL,
  `versão` varchar(45) NOT NULL,
  `categoria_id` int NOT NULL,
  `valor_diaria` decimal(9,2) NOT NULL,
  `quilometragem` int NOT NULL,
  `status` enum('disponivel','alugado','manunteção','removido') NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_UNIQUE` (`id`),
  KEY `fk_CARROS_MONTADORAS` (`montadora_id`),
  KEY `fk_CARROS_CORES` (`cor_id`),
  KEY `fk_CARROS_CATEGORIA` (`categoria_id`),
  CONSTRAINT `fk_CARROS_CATEGORIA` FOREIGN KEY (`categoria_id`) REFERENCES `CATEGORIAS` (`id`),
  CONSTRAINT `fk_CARROS_CORES` FOREIGN KEY (`cor_id`) REFERENCES `CORES` (`id`),
  CONSTRAINT `fk_CARROS_MONTADORAS` FOREIGN KEY (`montadora_id`) REFERENCES `MONTADORAS` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `CARROS`
--

LOCK TABLES `CARROS` WRITE;
/*!40000 ALTER TABLE `CARROS` DISABLE KEYS */;
/*!40000 ALTER TABLE `CARROS` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `CATEGORIAS`
--

DROP TABLE IF EXISTS `CATEGORIAS`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `CATEGORIAS` (
  `id` int NOT NULL AUTO_INCREMENT,
  `nome` varchar(45) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_UNIQUE` (`id`),
  UNIQUE KEY `nome_UNIQUE` (`nome`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `CATEGORIAS`
--

LOCK TABLES `CATEGORIAS` WRITE;
/*!40000 ALTER TABLE `CATEGORIAS` DISABLE KEYS */;
/*!40000 ALTER TABLE `CATEGORIAS` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `CLIENTES`
--

DROP TABLE IF EXISTS `CLIENTES`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `CLIENTES` (
  `id` int NOT NULL AUTO_INCREMENT,
  `nome` varchar(45) NOT NULL,
  `email` varchar(45) NOT NULL,
  `cpf` varchar(45) NOT NULL,
  `rua` varchar(45) NOT NULL,
  `numero` varchar(45) NOT NULL,
  `complemento` varchar(45) NOT NULL,
  `bairro` varchar(45) NOT NULL,
  `cidade` varchar(45) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_UNIQUE` (`id`),
  UNIQUE KEY `email_UNIQUE` (`email`),
  UNIQUE KEY `cpf_UNIQUE` (`cpf`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `CLIENTES`
--

LOCK TABLES `CLIENTES` WRITE;
/*!40000 ALTER TABLE `CLIENTES` DISABLE KEYS */;
/*!40000 ALTER TABLE `CLIENTES` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `CORES`
--

DROP TABLE IF EXISTS `CORES`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `CORES` (
  `id` int NOT NULL AUTO_INCREMENT,
  `nome` varchar(45) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_UNIQUE` (`id`),
  UNIQUE KEY `nome_UNIQUE` (`nome`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `CORES`
--

LOCK TABLES `CORES` WRITE;
/*!40000 ALTER TABLE `CORES` DISABLE KEYS */;
/*!40000 ALTER TABLE `CORES` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `MONTADORAS`
--

DROP TABLE IF EXISTS `MONTADORAS`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `MONTADORAS` (
  `id` int NOT NULL AUTO_INCREMENT,
  `nome` varchar(45) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_UNIQUE` (`id`),
  UNIQUE KEY `nome_UNIQUE` (`nome`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `MONTADORAS`
--

LOCK TABLES `MONTADORAS` WRITE;
/*!40000 ALTER TABLE `MONTADORAS` DISABLE KEYS */;
/*!40000 ALTER TABLE `MONTADORAS` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `UNIDADES`
--

DROP TABLE IF EXISTS `UNIDADES`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `UNIDADES` (
  `id` int NOT NULL AUTO_INCREMENT,
  `nome` varchar(45) NOT NULL,
  `rua` varchar(45) NOT NULL,
  `numero` varchar(45) NOT NULL,
  `complemento` varchar(45) NOT NULL,
  `bairro` varchar(45) NOT NULL,
  `cidade` varchar(45) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_UNIQUE` (`id`),
  UNIQUE KEY `nome_UNIQUE` (`nome`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `UNIDADES`
--

LOCK TABLES `UNIDADES` WRITE;
/*!40000 ALTER TABLE `UNIDADES` DISABLE KEYS */;
/*!40000 ALTER TABLE `UNIDADES` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping events for database 'carloca'
--

--
-- Dumping routines for database 'carloca'
--
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-02-24 21:24:58
