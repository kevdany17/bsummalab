-- MySQL dump 10.13  Distrib 5.6.26, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: bsumma
-- ------------------------------------------------------
-- Server version	5.6.26-log

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
-- Table structure for table `cliente_equipos`
--

DROP TABLE IF EXISTS `cliente_equipos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cliente_equipos` (
  `id_cliente` varchar(35) DEFAULT NULL,
  `id_equipo` varchar(15) DEFAULT NULL,
  KEY `id_cliente` (`id_cliente`),
  KEY `id_equipo` (`id_equipo`),
  CONSTRAINT `cliente_equipos_ibfk_1` FOREIGN KEY (`id_cliente`) REFERENCES `clientes` (`id`),
  CONSTRAINT `cliente_equipos_ibfk_2` FOREIGN KEY (`id_equipo`) REFERENCES `equipos` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cliente_equipos`
--

LOCK TABLES `cliente_equipos` WRITE;
/*!40000 ALTER TABLE `cliente_equipos` DISABLE KEYS */;
/*!40000 ALTER TABLE `cliente_equipos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `clientes`
--

DROP TABLE IF EXISTS `clientes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `clientes` (
  `id` varchar(35) NOT NULL,
  `nombre` varchar(40) DEFAULT NULL,
  `telefono` varchar(15) DEFAULT NULL,
  `correo` varchar(40) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `clientes`
--

LOCK TABLES `clientes` WRITE;
/*!40000 ALTER TABLE `clientes` DISABLE KEYS */;
INSERT INTO `clientes` VALUES ('da19457edcd16e8dc6c4e789127291ea','Gonzalo Pineda','921886287','dkhrj1.6@gmail.com');
/*!40000 ALTER TABLE `clientes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `equipos`
--

DROP TABLE IF EXISTS `equipos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `equipos` (
  `id` varchar(15) NOT NULL,
  `id_cliente` varchar(32) DEFAULT NULL,
  `fecha_ingreso` date DEFAULT NULL,
  `marca` varchar(20) DEFAULT NULL,
  `modelo` varchar(20) DEFAULT NULL,
  `tipo` varchar(30) DEFAULT NULL,
  `sistema` varchar(40) DEFAULT NULL,
  `ram` varchar(30) DEFAULT NULL,
  `hdd` varchar(20) DEFAULT NULL,
  `licencia` varchar(60) DEFAULT NULL,
  `diagnostico` text,
  `observaciones` text,
  `estado` varchar(20) DEFAULT NULL,
  `fecha_entrega` date DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `equipos`
--

LOCK TABLES `equipos` WRITE;
/*!40000 ALTER TABLE `equipos` DISABLE KEYS */;
INSERT INTO `equipos` VALUES ('306508032','da19457edcd16e8dc6c4e789127291ea','2017-06-02','LG','LG678','Windows 8 32bits','Laptop','4gb','500gb','8127381532765634521534215432','rapido','Kit Anvanzado','Ingreso','2017-06-17');
/*!40000 ALTER TABLE `equipos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `personal_equipos`
--

DROP TABLE IF EXISTS `personal_equipos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `personal_equipos` (
  `id_personal` int(11) DEFAULT NULL,
  `id_equipo` varchar(15) DEFAULT NULL,
  KEY `id_personal` (`id_personal`),
  KEY `id_equipo` (`id_equipo`),
  CONSTRAINT `personal_equipos_ibfk_1` FOREIGN KEY (`id_personal`) REFERENCES `usuarios` (`id`),
  CONSTRAINT `personal_equipos_ibfk_2` FOREIGN KEY (`id_equipo`) REFERENCES `equipos` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `personal_equipos`
--

LOCK TABLES `personal_equipos` WRITE;
/*!40000 ALTER TABLE `personal_equipos` DISABLE KEYS */;
/*!40000 ALTER TABLE `personal_equipos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `servicios`
--

DROP TABLE IF EXISTS `servicios`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `servicios` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(40) DEFAULT NULL,
  `costo` int(5) DEFAULT NULL,
  `detalles` tinytext,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `servicios`
--

LOCK TABLES `servicios` WRITE;
/*!40000 ALTER TABLE `servicios` DISABLE KEYS */;
INSERT INTO `servicios` VALUES (1,'Kit Basico',150,'Por Especificar'),(2,'KitAdvance',200,'Por Especificar'),(3,'KitPro',250,'Por Especificar'),(4,'Kit SuperPro',450,'Una super Jalada');
/*!40000 ALTER TABLE `servicios` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `servicios_equipos`
--

DROP TABLE IF EXISTS `servicios_equipos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `servicios_equipos` (
  `id_servicios` int(11) DEFAULT NULL,
  `id_equipo` varchar(15) DEFAULT NULL,
  KEY `id_servicios` (`id_servicios`),
  KEY `id_equipo` (`id_equipo`),
  CONSTRAINT `servicios_equipos_ibfk_1` FOREIGN KEY (`id_servicios`) REFERENCES `servicios` (`id`),
  CONSTRAINT `servicios_equipos_ibfk_2` FOREIGN KEY (`id_equipo`) REFERENCES `equipos` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `servicios_equipos`
--

LOCK TABLES `servicios_equipos` WRITE;
/*!40000 ALTER TABLE `servicios_equipos` DISABLE KEYS */;
INSERT INTO `servicios_equipos` VALUES (2,'306508032');
/*!40000 ALTER TABLE `servicios_equipos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `usuarios`
--

DROP TABLE IF EXISTS `usuarios`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `usuarios` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `usuario` varchar(18) NOT NULL,
  `contrasena` varchar(35) NOT NULL,
  `perfil` varchar(10) NOT NULL DEFAULT 'Tecnico',
  `nombre` varchar(45) NOT NULL,
  `correo` varchar(45) NOT NULL,
  `telefono` varchar(15) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `usuarios`
--

LOCK TABLES `usuarios` WRITE;
/*!40000 ALTER TABLE `usuarios` DISABLE KEYS */;
INSERT INTO `usuarios` VALUES (1,'tecnico','8f243d48b667ab0384570a93379122e7','Tecnico','Técnico','prueba@gmail.com','10100011'),(2,'admon','9dfb157eb256bc802c146b3111685d03','Admin','UMMALab ','administrador@gmail.com','9511428983');
/*!40000 ALTER TABLE `usuarios` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2017-06-09 10:56:34
