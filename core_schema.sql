CREATE DATABASE  IF NOT EXISTS `mydb` /*!40100 DEFAULT CHARACTER SET utf8mb3 */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `mydb`;
-- MySQL dump 10.13  Distrib 8.0.36, for Linux (x86_64)
--
-- Host: localhost    Database: mydb
-- ------------------------------------------------------
-- Server version	8.0.45-0ubuntu0.24.04.1

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
-- Table structure for table `AVALIAÇÃO`
--

DROP TABLE IF EXISTS `AVALIAÇÃO`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `AVALIAÇÃO` (
  `ID_Avaliação` int NOT NULL,
  `classificação` int NOT NULL,
  `comentario` text NOT NULL,
  `data` date NOT NULL,
  `PARTICIPANTE_ID_Participante` int NOT NULL,
  `EVENTO_ID_Evento` int NOT NULL,
  PRIMARY KEY (`ID_Avaliação`),
  KEY `fk_AVALIAÇÃO_PARTICIPANTE1_idx` (`PARTICIPANTE_ID_Participante`),
  KEY `fk_AVALIAÇÃO_EVENTO1_idx` (`EVENTO_ID_Evento`),
  CONSTRAINT `fk_AVALIAÇÃO_EVENTO1` FOREIGN KEY (`EVENTO_ID_Evento`) REFERENCES `EVENTO` (`ID_Evento`),
  CONSTRAINT `fk_AVALIAÇÃO_PARTICIPANTE1` FOREIGN KEY (`PARTICIPANTE_ID_Participante`) REFERENCES `PARTICIPANTE` (`ID_Participante`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `AVALIAÇÃO`
--

LOCK TABLES `AVALIAÇÃO` WRITE;
/*!40000 ALTER TABLE `AVALIAÇÃO` DISABLE KEYS */;
/*!40000 ALTER TABLE `AVALIAÇÃO` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `BILHETE`
--

DROP TABLE IF EXISTS `BILHETE`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `BILHETE` (
  `ID_Bilhete` int NOT NULL,
  `numero_lugar` varchar(100) NOT NULL,
  `data_emissão` date NOT NULL,
  `INSCRIÇÃO_ID_Inscriação` int NOT NULL,
  `CATEGORIA_ID_Categoria` int NOT NULL,
  PRIMARY KEY (`ID_Bilhete`),
  KEY `fk_BILHETE_INSCRIÇÃO1_idx` (`INSCRIÇÃO_ID_Inscriação`),
  KEY `fk_BILHETE_CATEGORIA1_idx` (`CATEGORIA_ID_Categoria`),
  CONSTRAINT `fk_BILHETE_CATEGORIA1` FOREIGN KEY (`CATEGORIA_ID_Categoria`) REFERENCES `CATEGORIA` (`ID_Categoria`),
  CONSTRAINT `fk_BILHETE_INSCRIÇÃO1` FOREIGN KEY (`INSCRIÇÃO_ID_Inscriação`) REFERENCES `INSCRIÇÃO` (`ID_Inscriação`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `BILHETE`
--

LOCK TABLES `BILHETE` WRITE;
/*!40000 ALTER TABLE `BILHETE` DISABLE KEYS */;
/*!40000 ALTER TABLE `BILHETE` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `CATEGORIA`
--

DROP TABLE IF EXISTS `CATEGORIA`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `CATEGORIA` (
  `ID_Categoria` int NOT NULL,
  `nomw` varchar(45) NOT NULL,
  `preço` decimal(8,2) NOT NULL,
  PRIMARY KEY (`ID_Categoria`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `CATEGORIA`
--

LOCK TABLES `CATEGORIA` WRITE;
/*!40000 ALTER TABLE `CATEGORIA` DISABLE KEYS */;
/*!40000 ALTER TABLE `CATEGORIA` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ESPAÇO`
--

DROP TABLE IF EXISTS `ESPAÇO`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ESPAÇO` (
  `ID_Espaço` int NOT NULL,
  `nome` varchar(100) NOT NULL,
  `morada` varchar(200) NOT NULL,
  `cidade` varchar(45) NOT NULL,
  `capacidade_total` int NOT NULL,
  PRIMARY KEY (`ID_Espaço`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ESPAÇO`
--

LOCK TABLES `ESPAÇO` WRITE;
/*!40000 ALTER TABLE `ESPAÇO` DISABLE KEYS */;
INSERT INTO `ESPAÇO` VALUES (1,'Exponor','Rotunda da Exponor','Matosinhos',5000);
/*!40000 ALTER TABLE `ESPAÇO` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `EVENTO`
--

DROP TABLE IF EXISTS `EVENTO`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `EVENTO` (
  `ID_Evento` int NOT NULL,
  `nome` varchar(100) NOT NULL,
  `descrição` text NOT NULL,
  `data_inicio` date NOT NULL,
  `data_fim` date NOT NULL,
  `capacidade_total` int NOT NULL,
  `estado` varchar(20) NOT NULL,
  `ESPAÇO_ID_Espaço` int NOT NULL,
  PRIMARY KEY (`ID_Evento`),
  KEY `fk_EVENTO_ESPAÇO1_idx` (`ESPAÇO_ID_Espaço`),
  KEY `idx_evento_data` (`data_inicio`),
  CONSTRAINT `fk_EVENTO_ESPAÇO1` FOREIGN KEY (`ESPAÇO_ID_Espaço`) REFERENCES `ESPAÇO` (`ID_Espaço`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `EVENTO`
--

LOCK TABLES `EVENTO` WRITE;
/*!40000 ALTER TABLE `EVENTO` DISABLE KEYS */;
INSERT INTO `EVENTO` VALUES (1,'Tech Conference 2026','Evento de Tecnologia','2026-05-15','2026-05-17',5000,'Ativo',1);
/*!40000 ALTER TABLE `EVENTO` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `FIGURA`
--

DROP TABLE IF EXISTS `FIGURA`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `FIGURA` (
  `ID_Figura` int NOT NULL,
  `nome` varchar(100) NOT NULL,
  `tipo` varchar(45) NOT NULL,
  `biografia` text NOT NULL,
  PRIMARY KEY (`ID_Figura`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `FIGURA`
--

LOCK TABLES `FIGURA` WRITE;
/*!40000 ALTER TABLE `FIGURA` DISABLE KEYS */;
/*!40000 ALTER TABLE `FIGURA` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `FIGURA_has_SESSÃO`
--

DROP TABLE IF EXISTS `FIGURA_has_SESSÃO`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `FIGURA_has_SESSÃO` (
  `FIGURA_ID_Figura` int NOT NULL,
  `SESSÃO_ID_Sessão` int NOT NULL,
  PRIMARY KEY (`FIGURA_ID_Figura`,`SESSÃO_ID_Sessão`),
  KEY `fk_FIGURA_has_SESSÃO_SESSÃO1_idx` (`SESSÃO_ID_Sessão`),
  KEY `fk_FIGURA_has_SESSÃO_FIGURA1_idx` (`FIGURA_ID_Figura`),
  CONSTRAINT `fk_FIGURA_has_SESSÃO_FIGURA1` FOREIGN KEY (`FIGURA_ID_Figura`) REFERENCES `FIGURA` (`ID_Figura`),
  CONSTRAINT `fk_FIGURA_has_SESSÃO_SESSÃO1` FOREIGN KEY (`SESSÃO_ID_Sessão`) REFERENCES `SESSÃO` (`ID_Sessão`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `FIGURA_has_SESSÃO`
--

LOCK TABLES `FIGURA_has_SESSÃO` WRITE;
/*!40000 ALTER TABLE `FIGURA_has_SESSÃO` DISABLE KEYS */;
/*!40000 ALTER TABLE `FIGURA_has_SESSÃO` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `INSCRIÇÃO`
--

DROP TABLE IF EXISTS `INSCRIÇÃO`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `INSCRIÇÃO` (
  `ID_Inscriação` int NOT NULL,
  `data_inscrição` datetime NOT NULL,
  `estado` varchar(20) NOT NULL,
  `valor_pago` decimal(8,2) NOT NULL,
  `PARTICIPANTE_ID_Participante` int NOT NULL,
  `EVENTO_ID_Evento` int NOT NULL,
  PRIMARY KEY (`ID_Inscriação`),
  KEY `fk_INSCRIÇÃO_PARTICIPANTE1_idx` (`PARTICIPANTE_ID_Participante`),
  KEY `fk_INSCRIÇÃO_EVENTO1_idx` (`EVENTO_ID_Evento`),
  CONSTRAINT `fk_INSCRIÇÃO_EVENTO1` FOREIGN KEY (`EVENTO_ID_Evento`) REFERENCES `EVENTO` (`ID_Evento`),
  CONSTRAINT `fk_INSCRIÇÃO_PARTICIPANTE1` FOREIGN KEY (`PARTICIPANTE_ID_Participante`) REFERENCES `PARTICIPANTE` (`ID_Participante`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `INSCRIÇÃO`
--

LOCK TABLES `INSCRIÇÃO` WRITE;
/*!40000 ALTER TABLE `INSCRIÇÃO` DISABLE KEYS */;
INSERT INTO `INSCRIÇÃO` VALUES (1,'2026-05-01 10:00:00','Confirmada',50.00,10,1);
/*!40000 ALTER TABLE `INSCRIÇÃO` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `trg_valida_pagamento` BEFORE INSERT ON `INSCRIÇÃO` FOR EACH ROW BEGIN
    IF NEW.valor_pago < 0 THEN
        SET NEW.valor_pago = 0;
    END IF;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `ORGANIZADOR`
--

DROP TABLE IF EXISTS `ORGANIZADOR`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ORGANIZADOR` (
  `ID_Organizador` int NOT NULL,
  `organização` varchar(100) NOT NULL,
  `nif` varchar(45) NOT NULL,
  `UTILIZADOR_ID_Utilizador` int NOT NULL,
  PRIMARY KEY (`ID_Organizador`),
  KEY `fk_ORGANIZADOR_UTILIZADOR_idx` (`UTILIZADOR_ID_Utilizador`),
  CONSTRAINT `fk_ORGANIZADOR_UTILIZADOR` FOREIGN KEY (`UTILIZADOR_ID_Utilizador`) REFERENCES `UTILIZADOR` (`ID_Utilizador`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ORGANIZADOR`
--

LOCK TABLES `ORGANIZADOR` WRITE;
/*!40000 ALTER TABLE `ORGANIZADOR` DISABLE KEYS */;
/*!40000 ALTER TABLE `ORGANIZADOR` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `PARTICIPANTE`
--

DROP TABLE IF EXISTS `PARTICIPANTE`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `PARTICIPANTE` (
  `ID_Participante` int NOT NULL,
  `nacionalidade` varchar(45) NOT NULL,
  `data_nascimento` date NOT NULL,
  `UTILIZADOR_ID_Utilizador` int NOT NULL,
  PRIMARY KEY (`ID_Participante`),
  KEY `fk_PARTICIPANTE_UTILIZADOR1_idx` (`UTILIZADOR_ID_Utilizador`),
  CONSTRAINT `fk_PARTICIPANTE_UTILIZADOR1` FOREIGN KEY (`UTILIZADOR_ID_Utilizador`) REFERENCES `UTILIZADOR` (`ID_Utilizador`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `PARTICIPANTE`
--

LOCK TABLES `PARTICIPANTE` WRITE;
/*!40000 ALTER TABLE `PARTICIPANTE` DISABLE KEYS */;
INSERT INTO `PARTICIPANTE` VALUES (10,'Portuguesa','2000-01-01',10);
/*!40000 ALTER TABLE `PARTICIPANTE` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `PATROCINADOR`
--

DROP TABLE IF EXISTS `PATROCINADOR`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `PATROCINADOR` (
  `ID_Patrocinador` int NOT NULL,
  `nome` varchar(100) NOT NULL,
  `nif` int NOT NULL,
  `email` varchar(100) NOT NULL,
  PRIMARY KEY (`ID_Patrocinador`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `PATROCINADOR`
--

LOCK TABLES `PATROCINADOR` WRITE;
/*!40000 ALTER TABLE `PATROCINADOR` DISABLE KEYS */;
/*!40000 ALTER TABLE `PATROCINADOR` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `PATROCINADOR_has_EVENTO`
--

DROP TABLE IF EXISTS `PATROCINADOR_has_EVENTO`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `PATROCINADOR_has_EVENTO` (
  `PATROCINADOR_ID_Patrocinador` int NOT NULL,
  `EVENTO_ID_Evento` int NOT NULL,
  PRIMARY KEY (`PATROCINADOR_ID_Patrocinador`,`EVENTO_ID_Evento`),
  KEY `fk_PATROCINADOR_has_EVENTO_EVENTO1_idx` (`EVENTO_ID_Evento`),
  KEY `fk_PATROCINADOR_has_EVENTO_PATROCINADOR1_idx` (`PATROCINADOR_ID_Patrocinador`),
  CONSTRAINT `fk_PATROCINADOR_has_EVENTO_EVENTO1` FOREIGN KEY (`EVENTO_ID_Evento`) REFERENCES `EVENTO` (`ID_Evento`),
  CONSTRAINT `fk_PATROCINADOR_has_EVENTO_PATROCINADOR1` FOREIGN KEY (`PATROCINADOR_ID_Patrocinador`) REFERENCES `PATROCINADOR` (`ID_Patrocinador`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `PATROCINADOR_has_EVENTO`
--

LOCK TABLES `PATROCINADOR_has_EVENTO` WRITE;
/*!40000 ALTER TABLE `PATROCINADOR_has_EVENTO` DISABLE KEYS */;
/*!40000 ALTER TABLE `PATROCINADOR_has_EVENTO` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `SALA`
--

DROP TABLE IF EXISTS `SALA`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `SALA` (
  `ID_Sala` int NOT NULL,
  `nome` varchar(50) NOT NULL,
  `capacidade` int NOT NULL,
  `ESPAÇO_ID_Espaço` int NOT NULL,
  PRIMARY KEY (`ID_Sala`),
  KEY `fk_SALA_ESPAÇO1_idx` (`ESPAÇO_ID_Espaço`),
  CONSTRAINT `fk_SALA_ESPAÇO1` FOREIGN KEY (`ESPAÇO_ID_Espaço`) REFERENCES `ESPAÇO` (`ID_Espaço`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `SALA`
--

LOCK TABLES `SALA` WRITE;
/*!40000 ALTER TABLE `SALA` DISABLE KEYS */;
INSERT INTO `SALA` VALUES (5,'Auditório Principal',500,1);
/*!40000 ALTER TABLE `SALA` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `SESSÃO`
--

DROP TABLE IF EXISTS `SESSÃO`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `SESSÃO` (
  `ID_Sessão` int NOT NULL,
  `titulo` varchar(150) NOT NULL,
  `descrição` text NOT NULL,
  `data_sessão` date NOT NULL,
  `hora_inicio` time NOT NULL,
  `hora_fim` time NOT NULL,
  `EVENTO_ID_Evento` int NOT NULL,
  `SALA_ID_Sala` int NOT NULL,
  PRIMARY KEY (`ID_Sessão`),
  KEY `fk_SESSÃO_EVENTO1_idx` (`EVENTO_ID_Evento`),
  KEY `fk_SESSÃO_SALA1_idx` (`SALA_ID_Sala`),
  CONSTRAINT `fk_SESSÃO_EVENTO1` FOREIGN KEY (`EVENTO_ID_Evento`) REFERENCES `EVENTO` (`ID_Evento`),
  CONSTRAINT `fk_SESSÃO_SALA1` FOREIGN KEY (`SALA_ID_Sala`) REFERENCES `SALA` (`ID_Sala`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `SESSÃO`
--

LOCK TABLES `SESSÃO` WRITE;
/*!40000 ALTER TABLE `SESSÃO` DISABLE KEYS */;
INSERT INTO `SESSÃO` VALUES (20,'Keynote Inteligência Artificial','Abertura','2026-05-15','10:00:00','12:00:00',1,5);
/*!40000 ALTER TABLE `SESSÃO` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `STAFF`
--

DROP TABLE IF EXISTS `STAFF`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `STAFF` (
  `ID_Staff` int NOT NULL,
  `nome` varchar(100) NOT NULL,
  `função` varchar(45) NOT NULL,
  `EVENTO_ID_Evento` int NOT NULL,
  PRIMARY KEY (`ID_Staff`),
  KEY `fk_STAFF_EVENTO1_idx` (`EVENTO_ID_Evento`),
  CONSTRAINT `fk_STAFF_EVENTO1` FOREIGN KEY (`EVENTO_ID_Evento`) REFERENCES `EVENTO` (`ID_Evento`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `STAFF`
--

LOCK TABLES `STAFF` WRITE;
/*!40000 ALTER TABLE `STAFF` DISABLE KEYS */;
/*!40000 ALTER TABLE `STAFF` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `UTILIZADOR`
--

DROP TABLE IF EXISTS `UTILIZADOR`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `UTILIZADOR` (
  `ID_Utilizador` int NOT NULL,
  `nome` varchar(100) NOT NULL,
  `email` varchar(100) NOT NULL,
  `password` varchar(255) NOT NULL,
  `telefone` varchar(20) NOT NULL,
  PRIMARY KEY (`ID_Utilizador`),
  KEY `idx_utilizador_email` (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `UTILIZADOR`
--

LOCK TABLES `UTILIZADOR` WRITE;
/*!40000 ALTER TABLE `UTILIZADOR` DISABLE KEYS */;
INSERT INTO `UTILIZADOR` VALUES (10,'Gonçalo Pereira','goncalo@email.com','hash123','912345678');
/*!40000 ALTER TABLE `UTILIZADOR` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `vw_agenda_eventos`
--

DROP TABLE IF EXISTS `vw_agenda_eventos`;
/*!50001 DROP VIEW IF EXISTS `vw_agenda_eventos`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `vw_agenda_eventos` AS SELECT 
 1 AS `Evento`,
 1 AS `Sessão`,
 1 AS `Data`,
 1 AS `Hora_Início`,
 1 AS `Sala`*/;
SET character_set_client = @saved_cs_client;

--
-- Dumping events for database 'mydb'
--

--
-- Dumping routines for database 'mydb'
--
/*!50003 DROP FUNCTION IF EXISTS `fn_vagas_disponiveis` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `fn_vagas_disponiveis`(p_evento_id INT) RETURNS int
    READS SQL DATA
BEGIN
    DECLARE v_capacidade INT;
    DECLARE v_inscritos INT;
    
    -- Obter a capacidade total do evento
    SELECT capacidade_total INTO v_capacidade 
    FROM EVENTO WHERE ID_Evento = p_evento_id;
    
    -- Obter o total de inscrições já PAGAS para esse evento
    SELECT COUNT(*) INTO v_inscritos 
    FROM INSCRIÇÃO 
    WHERE EVENTO_ID_Evento = p_evento_id AND estado = 'Pago';
    
    -- Devolver os lugares que sobram
    RETURN v_capacidade - v_inscritos;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_confirmar_inscricao` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_confirmar_inscricao`(IN p_id_inscricao INT)
BEGIN
    UPDATE INSCRIÇÃO 
    SET estado = 'Pago' 
    WHERE id_inscricao = p_id_inscricao;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Final view structure for view `vw_agenda_eventos`
--

/*!50001 DROP VIEW IF EXISTS `vw_agenda_eventos`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `vw_agenda_eventos` AS select `E`.`nome` AS `Evento`,`S`.`titulo` AS `Sessão`,`S`.`data_sessão` AS `Data`,`S`.`hora_inicio` AS `Hora_Início`,`SA`.`nome` AS `Sala` from ((`EVENTO` `E` join `SESSÃO` `S` on((`E`.`ID_Evento` = `S`.`EVENTO_ID_Evento`))) join `SALA` `SA` on((`S`.`SALA_ID_Sala` = `SA`.`ID_Sala`))) */;
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

-- Dump completed on 2026-05-06 15:50:43
