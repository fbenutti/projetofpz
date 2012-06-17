-- MySQL dump 10.13  Distrib 5.5.16, for Win32 (x86)
--
-- Host: localhost    Database: projetofinal
-- ------------------------------------------------------
-- Server version	5.5.15

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
-- Current Database: `projetofinal`
--

CREATE DATABASE /*!32312 IF NOT EXISTS*/ `projetofinal` /*!40100 DEFAULT CHARACTER SET latin1 */;

USE `projetofinal`;

--
-- Current Database: `projetofpz`
--

CREATE DATABASE /*!32312 IF NOT EXISTS*/ `projetofpz` /*!40100 DEFAULT CHARACTER SET latin1 */;

USE `projetofpz`;

--
-- Table structure for table `atividade`
--

DROP TABLE IF EXISTS `atividade`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `atividade` (
  `id_atividade` int(10) NOT NULL AUTO_INCREMENT,
  `descricao` varchar(400) NOT NULL,
  `vagas` int(6) DEFAULT NULL,
  `horario_inicio` varchar(15) DEFAULT NULL,
  `horario_fim` varchar(15) DEFAULT NULL,
  `es_evento` int(10) NOT NULL,
  `es_responsavel` int(10) NOT NULL,
  PRIMARY KEY (`id_atividade`),
  KEY `es_evento` (`es_evento`),
  KEY `es_responsavel` (`es_responsavel`),
  CONSTRAINT `atividade_ibfk_1` FOREIGN KEY (`es_evento`) REFERENCES `evento` (`id_evento`),
  CONSTRAINT `atividade_ibfk_2` FOREIGN KEY (`es_responsavel`) REFERENCES `responsavel` (`id_responsavel`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `atividade`
--

LOCK TABLES `atividade` WRITE;
/*!40000 ALTER TABLE `atividade` DISABLE KEYS */;
/*!40000 ALTER TABLE `atividade` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `evento`
--

DROP TABLE IF EXISTS `evento`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `evento` (
  `id_evento` int(10) NOT NULL AUTO_INCREMENT,
  `nome` varchar(185) NOT NULL,
  `dt_inicio` varchar(15) DEFAULT NULL,
  `dt_fim` varchar(15) DEFAULT NULL,
  `logo` longblob,
  PRIMARY KEY (`id_evento`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `evento`
--

LOCK TABLES `evento` WRITE;
/*!40000 ALTER TABLE `evento` DISABLE KEYS */;
/*!40000 ALTER TABLE `evento` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `inscricao`
--

DROP TABLE IF EXISTS `inscricao`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `inscricao` (
  `id_inscricao` int(10) NOT NULL AUTO_INCREMENT,
  `es_cpf` varchar(18) NOT NULL,
  `es_atividade` int(10) NOT NULL,
  PRIMARY KEY (`id_inscricao`),
  KEY `es_cpf` (`es_cpf`),
  KEY `es_atividade` (`es_atividade`),
  CONSTRAINT `inscricao_ibfk_1` FOREIGN KEY (`es_cpf`) REFERENCES `pessoa` (`cpf`),
  CONSTRAINT `inscricao_ibfk_2` FOREIGN KEY (`es_atividade`) REFERENCES `atividade` (`id_atividade`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `inscricao`
--

LOCK TABLES `inscricao` WRITE;
/*!40000 ALTER TABLE `inscricao` DISABLE KEYS */;
/*!40000 ALTER TABLE `inscricao` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `instituicao`
--

DROP TABLE IF EXISTS `instituicao`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `instituicao` (
  `cnpj` varchar(20) NOT NULL,
  `nome` varchar(100) NOT NULL,
  `email` varchar(100) DEFAULT NULL,
  `cep` varchar(10) DEFAULT NULL,
  `bairro` varchar(100) DEFAULT NULL,
  `cidade` varchar(100) DEFAULT NULL,
  `uf` char(2) DEFAULT NULL,
  `complemento` varchar(40) DEFAULT NULL,
  `numero` int(10) DEFAULT NULL,
  `rua` varchar(40) DEFAULT NULL,
  `telefone` varchar(20) DEFAULT NULL,
  `es_user_name` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`cnpj`),
  KEY `es_user_name` (`es_user_name`),
  CONSTRAINT `instituicao_ibfk_1` FOREIGN KEY (`es_user_name`) REFERENCES `login` (`user_name`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `instituicao`
--

LOCK TABLES `instituicao` WRITE;
/*!40000 ALTER TABLE `instituicao` DISABLE KEYS */;
INSERT INTO `instituicao` VALUES ('41.244.664/0001-83','dunha','gabrieli.santos@rocketmail.com','cep','bairro','SÃ£o JoÃ£o da Boa Vista','SP','',1,'Rua JosÃ© ApolinÃ¡rio Neves','telefone','41.244.664/0001-83');
/*!40000 ALTER TABLE `instituicao` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `login`
--

DROP TABLE IF EXISTS `login`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `login` (
  `user_name` varchar(50) NOT NULL,
  `senha` varchar(50) NOT NULL,
  `tipo` varchar(1) NOT NULL,
  PRIMARY KEY (`user_name`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `login`
--

LOCK TABLES `login` WRITE;
/*!40000 ALTER TABLE `login` DISABLE KEYS */;
INSERT INTO `login` VALUES ('392.267.258-29','1','p'),('41.244.664/0001-83','123456','I');
/*!40000 ALTER TABLE `login` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pessoa`
--

DROP TABLE IF EXISTS `pessoa`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pessoa` (
  `cpf` varchar(18) NOT NULL,
  `nome` varchar(100) NOT NULL,
  `email` varchar(100) DEFAULT NULL,
  `cep` varchar(10) DEFAULT NULL,
  `bairro` varchar(100) DEFAULT NULL,
  `cidade` varchar(100) DEFAULT NULL,
  `uf` char(2) DEFAULT NULL,
  `complemento` varchar(40) DEFAULT NULL,
  `numero` int(10) DEFAULT NULL,
  `rua` varchar(40) DEFAULT NULL,
  `telefone` varchar(20) DEFAULT NULL,
  `es_user_name` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`cpf`),
  KEY `es_user_name` (`es_user_name`),
  CONSTRAINT `pessoa_ibfk_1` FOREIGN KEY (`es_user_name`) REFERENCES `login` (`user_name`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pessoa`
--

LOCK TABLES `pessoa` WRITE;
/*!40000 ALTER TABLE `pessoa` DISABLE KEYS */;
INSERT INTO `pessoa` VALUES ('392.267.258-29','Paulo Ricardo Mancini','pauloxpto@pop.com.br','13874036','Jardim Santo AndrÃ©','SÃ£o JoÃ£o da Boa Vista','SP','',0,'Rua JosÃ© ApolinÃ¡rio Neves','(11) 1111-1111','392.267.258-29');
/*!40000 ALTER TABLE `pessoa` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pessoa_instituicao`
--

DROP TABLE IF EXISTS `pessoa_instituicao`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pessoa_instituicao` (
  `id_pessoa_instituicao` int(10) NOT NULL AUTO_INCREMENT,
  `es_cpf` varchar(18) NOT NULL,
  `es_cnpj` varchar(20) NOT NULL,
  PRIMARY KEY (`id_pessoa_instituicao`),
  KEY `es_cpf` (`es_cpf`),
  KEY `es_cnpj` (`es_cnpj`),
  CONSTRAINT `pessoa_instituicao_ibfk_1` FOREIGN KEY (`es_cpf`) REFERENCES `pessoa` (`cpf`),
  CONSTRAINT `pessoa_instituicao_ibfk_2` FOREIGN KEY (`es_cnpj`) REFERENCES `instituicao` (`cnpj`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pessoa_instituicao`
--

LOCK TABLES `pessoa_instituicao` WRITE;
/*!40000 ALTER TABLE `pessoa_instituicao` DISABLE KEYS */;
/*!40000 ALTER TABLE `pessoa_instituicao` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `responsavel`
--

DROP TABLE IF EXISTS `responsavel`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `responsavel` (
  `id_responsavel` int(10) NOT NULL AUTO_INCREMENT,
  `nome` varchar(100) NOT NULL,
  `email` varchar(100) DEFAULT NULL,
  `cidade` varchar(50) DEFAULT NULL,
  `uf` char(2) DEFAULT NULL,
  `foto` longblob,
  PRIMARY KEY (`id_responsavel`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `responsavel`
--

LOCK TABLES `responsavel` WRITE;
/*!40000 ALTER TABLE `responsavel` DISABLE KEYS */;
/*!40000 ALTER TABLE `responsavel` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2012-06-17 11:32:51
