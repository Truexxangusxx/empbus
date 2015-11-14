-- MySQL dump 10.13  Distrib 5.6.24, for Win64 (x86_64)
--
-- Host: localhost    Database: empbus
-- ------------------------------------------------------
-- Server version	5.6.27

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
-- Table structure for table `actividad`
--

DROP TABLE IF EXISTS `actividad`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `actividad` (
  `idactividad` int(11) NOT NULL AUTO_INCREMENT,
  `Descripcion` varchar(100) DEFAULT NULL,
  `Codigo` varchar(50) DEFAULT NULL,
  `Activo` bit(1) DEFAULT b'1',
  `Usuario` varchar(20) DEFAULT NULL,
  `FechaRegistro` datetime DEFAULT NULL,
  `UsuarioModificacion` varchar(20) DEFAULT NULL,
  `FechaModificacion` datetime DEFAULT NULL,
  PRIMARY KEY (`idactividad`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `actividad`
--

LOCK TABLES `actividad` WRITE;
/*!40000 ALTER TABLE `actividad` DISABLE KEYS */;
INSERT INTO `actividad` VALUES (1,'actividad1','act001','','admin','2015-07-22 00:00:00',NULL,NULL),(2,'actividad2','act002','','admin','2015-07-22 00:00:00',NULL,NULL),(3,'actividad2sadasd','asdasda','\0','admin','2015-07-22 00:00:00',NULL,NULL);
/*!40000 ALTER TABLE `actividad` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ajuste`
--

DROP TABLE IF EXISTS `ajuste`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ajuste` (
  `idajuste` int(11) NOT NULL AUTO_INCREMENT,
  `Descripcion` varchar(100) DEFAULT NULL,
  `Codigo` varchar(50) DEFAULT NULL,
  `Activo` bit(1) DEFAULT b'1',
  `Usuario` varchar(20) DEFAULT NULL,
  `FechaRegistro` datetime DEFAULT NULL,
  `UsuarioModificacion` varchar(20) DEFAULT NULL,
  `FechaModificacion` datetime DEFAULT NULL,
  PRIMARY KEY (`idajuste`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ajuste`
--

LOCK TABLES `ajuste` WRITE;
/*!40000 ALTER TABLE `ajuste` DISABLE KEYS */;
INSERT INTO `ajuste` VALUES (1,'ajuste002','aj001','\0','admin','2015-07-02 00:00:00',NULL,NULL),(2,'ajuste002','aj002','','admin','2015-07-02 00:00:00',NULL,NULL),(3,'ajuste003','aj003','','admin','2015-07-02 00:00:00',NULL,NULL);
/*!40000 ALTER TABLE `ajuste` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `almacen`
--

DROP TABLE IF EXISTS `almacen`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `almacen` (
  `idAlmacen` int(11) NOT NULL AUTO_INCREMENT,
  `idSucursal` int(11) NOT NULL,
  `Descripcion` varchar(50) DEFAULT NULL,
  `Codigo` varchar(10) DEFAULT NULL,
  `Activo` bit(1) DEFAULT b'1',
  `Usuario` varchar(20) DEFAULT NULL,
  `FechaRegistro` datetime DEFAULT NULL,
  `UsuarioModificacion` varchar(20) DEFAULT NULL,
  `FechaModificacion` datetime DEFAULT NULL,
  PRIMARY KEY (`idAlmacen`),
  KEY `fk_Almacen_Sucursal1_idx` (`idSucursal`),
  CONSTRAINT `fk_Almacen_Sucursal1` FOREIGN KEY (`idSucursal`) REFERENCES `sucursal` (`idSucursal`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `almacen`
--

LOCK TABLES `almacen` WRITE;
/*!40000 ALTER TABLE `almacen` DISABLE KEYS */;
INSERT INTO `almacen` VALUES (1,3,'Almacen1','A1','','admin','2013-02-22 00:00:00','admin','2013-02-22 00:00:00'),(2,3,'Almacen2','A2','','admin','2013-02-22 00:00:00',NULL,NULL),(3,2,'Almacen3','A3','\0','admin','2013-02-22 00:00:00','admin','2013-02-22 00:00:00');
/*!40000 ALTER TABLE `almacen` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `aporte`
--

DROP TABLE IF EXISTS `aporte`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `aporte` (
  `idAporte` int(11) NOT NULL AUTO_INCREMENT,
  `Descripcion` varchar(50) DEFAULT NULL,
  `Valor` decimal(4,2) DEFAULT NULL,
  `Activo` bit(1) DEFAULT b'1',
  `Usuario` varchar(20) DEFAULT NULL,
  `FechaRegistro` datetime DEFAULT NULL,
  `UsuarioModificacion` varchar(20) DEFAULT NULL,
  `FechaModificacion` datetime DEFAULT NULL,
  PRIMARY KEY (`idAporte`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `aporte`
--

LOCK TABLES `aporte` WRITE;
/*!40000 ALTER TABLE `aporte` DISABLE KEYS */;
INSERT INTO `aporte` VALUES (1,'primer aporte 1',23.45,'\0','admin','2014-04-27 00:00:00','admin',NULL),(2,'1er Aporte',3.50,'','admin','2014-04-27 00:00:00',NULL,NULL),(3,'2do Aporte',5.30,'','admin','2014-04-27 00:00:00',NULL,NULL);
/*!40000 ALTER TABLE `aporte` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `asiento`
--

DROP TABLE IF EXISTS `asiento`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `asiento` (
  `idAsiento` int(11) NOT NULL AUTO_INCREMENT,
  `idSubdiario` int(11) DEFAULT NULL,
  `idSucursal` int(11) DEFAULT NULL,
  `idMoneda` int(11) DEFAULT NULL,
  `Numero` varchar(20) DEFAULT NULL,
  `Periodo` varchar(20) DEFAULT NULL,
  `Fecha` datetime DEFAULT NULL,
  `TipoCambio` decimal(4,2) DEFAULT NULL,
  `Glosa` varchar(200) DEFAULT NULL,
  `Activo` bit(1) DEFAULT b'1',
  `Usuario` varchar(20) DEFAULT NULL,
  `FechaRegistro` datetime DEFAULT NULL,
  `UsuarioModificacion` varchar(20) DEFAULT NULL,
  `FechaModificacion` datetime DEFAULT NULL,
  `idIngreso` int(11) DEFAULT NULL,
  `idSalida` int(11) DEFAULT NULL,
  PRIMARY KEY (`idAsiento`),
  KEY `fk_Asiento_Subdiario1_idx` (`idSubdiario`),
  KEY `fk_Asiento_sucursal1_idx` (`idSucursal`),
  KEY `fk_Asiento_moneda1_idx` (`idMoneda`),
  KEY `fk_Asiento_ingreso1_idx` (`idIngreso`),
  KEY `fk_Asiento_salida1_idx` (`idSalida`),
  CONSTRAINT `fk_Asiento_Subdiario1` FOREIGN KEY (`idSubdiario`) REFERENCES `subdiario` (`idSubdiario`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_Asiento_ingreso1` FOREIGN KEY (`idIngreso`) REFERENCES `ingreso` (`idIngreso`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_Asiento_moneda1` FOREIGN KEY (`idMoneda`) REFERENCES `moneda` (`idMoneda`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_Asiento_salida1` FOREIGN KEY (`idSalida`) REFERENCES `salida` (`idSalida`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_Asiento_sucursal1` FOREIGN KEY (`idSucursal`) REFERENCES `sucursal` (`idSucursal`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=66 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `asiento`
--

LOCK TABLES `asiento` WRITE;
/*!40000 ALTER TABLE `asiento` DISABLE KEYS */;
INSERT INTO `asiento` VALUES (1,1,2,7,'','Enero 2014','2015-06-27 00:00:00',2.53,'dfdfdfsdfsds','','admin','2015-06-27 00:00:00',NULL,NULL,NULL,NULL),(2,1,2,7,'','Enero 2014','0006-01-01 00:00:00',2.53,'aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa','','admin','2015-06-27 00:00:00',NULL,NULL,NULL,NULL),(3,1,2,7,'','Enero 2014','0006-01-01 00:00:00',2.53,'bbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbb','','admin','2015-06-27 00:00:00',NULL,NULL,NULL,NULL),(4,1,2,7,'','Enero 2014','0006-01-01 00:00:00',2.53,'ccccccccccccccccccccccccccccc','','admin','2015-06-27 00:00:00',NULL,NULL,NULL,NULL),(5,1,2,7,'','Enero 2014','0006-01-01 00:00:00',2.53,'ddddddddddddddddddddddddddd','','admin','2015-06-27 00:00:00',NULL,NULL,NULL,NULL),(6,2,3,8,'','Enero 2014','2015-06-30 00:00:00',2.53,'fffffffffffffffffffffffffffffff','','admin','2015-06-27 00:00:00',NULL,'2015-06-29 00:00:00',NULL,NULL),(7,1,3,8,NULL,'Enero 2014','2015-06-10 00:00:00',2.55,'gggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggg','','admin','2015-06-29 00:00:00',NULL,NULL,NULL,NULL),(8,1,2,8,'000001','Enero 2015','2015-06-30 00:00:00',2.55,'hhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhh','','admin','2015-06-29 00:00:00',NULL,NULL,NULL,NULL),(9,1,2,8,'000001','Enero 2015','2015-06-30 00:00:00',2.55,'ggggggggggggggggggggggggggggggggggggggggggggggggggggggggggg','','admin','2015-07-01 00:00:00',NULL,NULL,NULL,NULL),(10,1,2,8,'000001','Enero 2015','2015-06-30 00:00:00',2.55,'iiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiii','','admin','2015-07-01 00:00:00',NULL,NULL,NULL,NULL),(11,1,2,8,'000001','Enero 2015','2015-06-30 00:00:00',2.55,'jjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjj','','admin','2015-07-01 00:00:00',NULL,NULL,NULL,NULL),(12,1,2,8,'000001','Enero 2015','2015-06-30 00:00:00',2.55,'kkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkk','','admin','2015-07-01 00:00:00',NULL,NULL,NULL,NULL),(13,1,2,8,'000002','Enero 2015','2015-06-30 00:00:00',2.55,'lllllllllllllllllllllllllllllllllllll','','admin','2015-07-01 00:00:00',NULL,NULL,NULL,NULL),(14,1,2,8,'000003','Enero 2015','2015-06-30 00:00:00',2.55,'lllllllllllllllllllllllllllllllllllll','','admin','2015-08-20 00:00:00',NULL,'2015-08-21 00:00:00',NULL,NULL),(15,1,2,8,'000004','Enero 2015','2015-06-30 00:00:00',2.55,'gggggggggggggggggggggggggggg','','admin','2015-08-23 00:00:00',NULL,NULL,NULL,NULL),(54,1,NULL,8,'000016','Enero 2015','2013-03-13 00:00:00',2.55,'000003','','admin','2015-09-14 00:00:00',NULL,NULL,NULL,NULL),(55,1,NULL,8,'000017','Enero 2015','2013-03-13 00:00:00',2.55,'000004','','admin','2015-09-19 00:00:00',NULL,NULL,NULL,NULL),(56,1,NULL,8,'000018','Enero 2015','2015-03-11 00:00:00',2.55,'000005','','admin','2015-09-19 00:00:00',NULL,NULL,NULL,NULL),(57,1,NULL,8,'000019','Enero 2015','2015-03-11 00:00:00',2.55,'','\0','admin','2015-09-19 00:00:00','admin','2015-10-27 00:00:00',17,NULL),(58,1,NULL,NULL,'000020','Enero 2015','2014-04-01 00:00:00',NULL,'000001','','admin','2015-09-28 00:00:00',NULL,NULL,NULL,NULL),(59,2,NULL,NULL,'000021','Enero 2015','2014-04-01 00:00:00',NULL,'000002','','admin','2015-09-28 00:00:00',NULL,NULL,NULL,NULL),(60,2,NULL,NULL,'000022','Enero 2015','2014-04-01 00:00:00',NULL,'000003','','admin','2015-09-28 00:00:00',NULL,NULL,NULL,NULL),(61,1,NULL,NULL,'000023','Enero 2015','2014-04-01 00:00:00',NULL,'000004','','admin','2015-09-28 00:00:00',NULL,NULL,NULL,NULL),(62,1,NULL,NULL,'000024','Enero 2015','2014-04-01 00:00:00',NULL,'000005','','admin','2015-09-28 00:00:00',NULL,NULL,NULL,16),(63,2,NULL,NULL,'000025','Enero 2015','2014-04-01 00:00:00',NULL,'000006','','admin','2015-09-28 00:00:00',NULL,NULL,NULL,17),(64,2,NULL,NULL,'000026','Enero 2015','2014-04-01 00:00:00',NULL,'000007','','admin','2015-09-28 00:00:00',NULL,NULL,NULL,18),(65,2,NULL,NULL,'000027','Enero 2015','2014-04-01 00:00:00',NULL,'','\0','admin','2015-09-28 00:00:00','admin','2015-10-27 00:00:00',NULL,19);
/*!40000 ALTER TABLE `asiento` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `caracteristicas`
--

DROP TABLE IF EXISTS `caracteristicas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `caracteristicas` (
  `idCaracteristicas` int(11) NOT NULL AUTO_INCREMENT,
  `idTipoCaracteristica` int(11) NOT NULL,
  `Descripcion` varchar(50) DEFAULT NULL,
  `Documento` varchar(50) DEFAULT NULL,
  `Activo` bit(1) DEFAULT b'1',
  `Usuario` varchar(20) DEFAULT NULL,
  `FechaRegistro` datetime DEFAULT NULL,
  `UsuarioModificacion` varchar(20) DEFAULT NULL,
  `FechaModificacion` datetime DEFAULT NULL,
  PRIMARY KEY (`idCaracteristicas`),
  KEY `fk_Caracteristicas_TipoCaracteristica1_idx` (`idTipoCaracteristica`),
  CONSTRAINT `fk_Caracteristicas_TipoCaracteristica1` FOREIGN KEY (`idTipoCaracteristica`) REFERENCES `tipocaracteristica` (`idTipoCaracteristica`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `caracteristicas`
--

LOCK TABLES `caracteristicas` WRITE;
/*!40000 ALTER TABLE `caracteristicas` DISABLE KEYS */;
INSERT INTO `caracteristicas` VALUES (1,1,'Std','Cotizacion','',NULL,NULL,NULL,NULL),(2,1,'Repujado','Cotizacion','',NULL,NULL,NULL,NULL),(3,1,'Otros','Cotizacion','',NULL,NULL,NULL,NULL),(4,2,'Tela','Cotizacion','',NULL,NULL,NULL,NULL),(5,2,'Vinil','Cotizacion','',NULL,NULL,NULL,NULL),(6,2,'Otros','Cotizacion','',NULL,NULL,NULL,NULL),(7,3,'Tela','Cotizacion','',NULL,NULL,NULL,NULL),(8,3,'Vinil','Cotizacion','',NULL,NULL,NULL,NULL),(9,3,'Otros','Cotizacion','',NULL,NULL,NULL,NULL),(10,4,'Tapizon','Cotizacion','',NULL,NULL,NULL,NULL),(11,4,'Vinil','Cotizacion','',NULL,NULL,NULL,NULL),(12,4,'Otros','Cotizacion','',NULL,NULL,NULL,NULL);
/*!40000 ALTER TABLE `caracteristicas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `centrocosto`
--

DROP TABLE IF EXISTS `centrocosto`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `centrocosto` (
  `idCentroCosto` int(11) NOT NULL AUTO_INCREMENT,
  `Codigo` varchar(5) DEFAULT NULL,
  `Descripcion` varchar(50) DEFAULT NULL,
  `Activo` bit(1) DEFAULT b'1',
  `Usuario` varchar(20) DEFAULT NULL,
  `FechaRegistro` datetime DEFAULT NULL,
  `UsuarioModificacion` varchar(20) DEFAULT NULL,
  `FechaModificacion` datetime DEFAULT NULL,
  PRIMARY KEY (`idCentroCosto`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `centrocosto`
--

LOCK TABLES `centrocosto` WRITE;
/*!40000 ALTER TABLE `centrocosto` DISABLE KEYS */;
INSERT INTO `centrocosto` VALUES (1,'01','Ventas','','admin','2013-03-03 00:00:00','admin','2013-03-03 00:00:00'),(2,'02','Produccion','','admin','2013-03-03 00:00:00',NULL,NULL),(3,'02','Produccioncvxcvx','\0','admin','2013-03-03 00:00:00','admin','2013-03-03 00:00:00');
/*!40000 ALTER TABLE `centrocosto` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `clase`
--

DROP TABLE IF EXISTS `clase`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `clase` (
  `idClase` int(11) NOT NULL AUTO_INCREMENT,
  `Descripcion` varchar(100) DEFAULT NULL,
  `Codigo` varchar(50) DEFAULT NULL,
  `Activo` bit(1) DEFAULT b'1',
  `Usuario` varchar(20) DEFAULT NULL,
  `FechaRegistro` datetime DEFAULT NULL,
  `UsuarioModificacion` varchar(20) DEFAULT NULL,
  `FechaModificacion` datetime DEFAULT NULL,
  PRIMARY KEY (`idClase`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `clase`
--

LOCK TABLES `clase` WRITE;
/*!40000 ALTER TABLE `clase` DISABLE KEYS */;
INSERT INTO `clase` VALUES (1,'clase2','c002','\0','admin','2015-07-02 00:00:00',NULL,NULL),(2,'clase1','c001','','admin','2015-07-02 00:00:00',NULL,NULL),(3,'clase3','c003','','admin','2015-07-02 00:00:00',NULL,NULL),(4,'clase4','c004','','admin','2015-07-02 00:00:00',NULL,NULL);
/*!40000 ALTER TABLE `clase` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `clienteproveedor`
--

DROP TABLE IF EXISTS `clienteproveedor`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `clienteproveedor` (
  `idClienteProveedor` int(11) NOT NULL AUTO_INCREMENT,
  `RazonSocial` varchar(50) DEFAULT NULL,
  `RUC` varchar(15) DEFAULT NULL,
  `DNI` varchar(12) DEFAULT NULL,
  `Telefono1` varchar(20) DEFAULT NULL,
  `Telefono2` varchar(20) DEFAULT NULL,
  `Correo` varchar(50) DEFAULT NULL,
  `Contacto` varchar(50) DEFAULT NULL,
  `Direccion` varchar(50) DEFAULT NULL,
  `Activo` bit(1) DEFAULT b'1',
  `Usuario` varchar(20) DEFAULT NULL,
  `FechaRegistro` datetime DEFAULT NULL,
  `UsuarioModificacion` varchar(20) DEFAULT NULL,
  `FechaModificacion` datetime DEFAULT NULL,
  PRIMARY KEY (`idClienteProveedor`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `clienteproveedor`
--

LOCK TABLES `clienteproveedor` WRITE;
/*!40000 ALTER TABLE `clienteproveedor` DISABLE KEYS */;
INSERT INTO `clienteproveedor` VALUES (1,'cliente x','x','123','123','123','algo@','alguien','xxx','','admin','2013-02-01 00:00:00','admin','2013-02-10 00:00:00'),(2,'segundo','123123','234234','234234','234234','cesar@','cesar','trujillo','','admin','2013-02-01 00:00:00','admin','2013-02-02 00:00:00'),(3,'sgm computer','28474589','233489589','38457','34894893','sgm@','raul','trujillo monserrate','','admin','2013-02-03 00:00:00',NULL,NULL),(4,'alca','2894895','385903','38457','34894893','alca@','lucho','trujillo ricardo palma','','admin','2013-02-03 00:00:00',NULL,NULL),(5,'rodajito','39056563','4645343','3464564','34894893','rodajo@','cesar','trujillo villareal','','admin','2013-02-03 00:00:00',NULL,NULL),(6,'Carlos Medina Carranza','44242387','44242387','123123','123123','angus','Carlos Medina Carranza','santa maria','','admin','2013-03-04 00:00:00',NULL,NULL);
/*!40000 ALTER TABLE `clienteproveedor` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `configuracion`
--

DROP TABLE IF EXISTS `configuracion`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `configuracion` (
  `idConfiguracion` int(11) NOT NULL AUTO_INCREMENT,
  `idFamilia` int(11) DEFAULT NULL,
  `idSubdiario` int(11) DEFAULT NULL,
  `Descripcion` varchar(200) DEFAULT NULL,
  `Activo` bit(1) DEFAULT b'1',
  `Usuario` varchar(20) DEFAULT NULL,
  `FechaRegistro` datetime DEFAULT NULL,
  `UsuarioModificacion` varchar(20) DEFAULT NULL,
  `FechaModificacion` datetime DEFAULT NULL,
  PRIMARY KEY (`idConfiguracion`),
  KEY `fk_Configuracion_familia1_idx` (`idFamilia`),
  KEY `fk_Configuracion_Subdiario1_idx` (`idSubdiario`),
  CONSTRAINT `fk_Configuracion_Subdiario1` FOREIGN KEY (`idSubdiario`) REFERENCES `subdiario` (`idSubdiario`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_Configuracion_familia1` FOREIGN KEY (`idFamilia`) REFERENCES `familia` (`idFamilia`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=27 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `configuracion`
--

LOCK TABLES `configuracion` WRITE;
/*!40000 ALTER TABLE `configuracion` DISABLE KEYS */;
INSERT INTO `configuracion` VALUES (24,3,1,'plus ingreso','','admin','2015-09-01 00:00:00','admin','2015-09-14 00:00:00'),(25,1,1,'plus ingreso','','admin','2015-09-14 00:00:00',NULL,NULL),(26,3,2,'salida','','admin','2015-09-28 00:00:00',NULL,NULL);
/*!40000 ALTER TABLE `configuracion` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `configuracionalmacen`
--

DROP TABLE IF EXISTS `configuracionalmacen`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `configuracionalmacen` (
  `idconfiguracionalmacen` int(11) NOT NULL AUTO_INCREMENT,
  `idFamilia` int(11) DEFAULT NULL,
  `idCuentaExistencias` int(11) DEFAULT NULL,
  `idCuentaCompras` int(11) DEFAULT NULL,
  `idCuentaVariacionExistencias` int(11) DEFAULT NULL,
  `idCuentaTransferencia` int(11) DEFAULT NULL,
  `idCuentaProducto` int(11) DEFAULT NULL,
  `idCuentaVariacionProducto` int(11) DEFAULT NULL,
  `Descripcion` varchar(100) DEFAULT NULL,
  `Activo` bit(1) DEFAULT b'1',
  `Usuario` varchar(20) DEFAULT NULL,
  `FechaRegistro` datetime DEFAULT NULL,
  `UsuarioModificacion` varchar(20) DEFAULT NULL,
  `FechaModificacion` datetime DEFAULT NULL,
  PRIMARY KEY (`idconfiguracionalmacen`),
  KEY `fk_configuracionalmacen_familia1_idx` (`idFamilia`),
  KEY `fk_configuracionalmacen_Cuenta1_idx` (`idCuentaExistencias`),
  KEY `fk_configuracionalmacen_Cuenta2_idx` (`idCuentaCompras`),
  KEY `fk_configuracionalmacen_Cuenta3_idx` (`idCuentaVariacionExistencias`),
  KEY `fk_configuracionalmacen_Cuenta4_idx` (`idCuentaTransferencia`),
  KEY `fk_configuracionalmacen_Cuenta5_idx` (`idCuentaProducto`),
  KEY `fk_configuracionalmacen_Cuenta6_idx` (`idCuentaVariacionProducto`),
  CONSTRAINT `fk_configuracionalmacen_Cuenta1` FOREIGN KEY (`idCuentaExistencias`) REFERENCES `cuenta` (`idCuenta`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_configuracionalmacen_Cuenta2` FOREIGN KEY (`idCuentaCompras`) REFERENCES `cuenta` (`idCuenta`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_configuracionalmacen_Cuenta3` FOREIGN KEY (`idCuentaVariacionExistencias`) REFERENCES `cuenta` (`idCuenta`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_configuracionalmacen_Cuenta4` FOREIGN KEY (`idCuentaTransferencia`) REFERENCES `cuenta` (`idCuenta`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_configuracionalmacen_Cuenta5` FOREIGN KEY (`idCuentaProducto`) REFERENCES `cuenta` (`idCuenta`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_configuracionalmacen_Cuenta6` FOREIGN KEY (`idCuentaVariacionProducto`) REFERENCES `cuenta` (`idCuenta`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_configuracionalmacen_familia1` FOREIGN KEY (`idFamilia`) REFERENCES `familia` (`idFamilia`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `configuracionalmacen`
--

LOCK TABLES `configuracionalmacen` WRITE;
/*!40000 ALTER TABLE `configuracionalmacen` DISABLE KEYS */;
INSERT INTO `configuracionalmacen` VALUES (1,1,3,3,5,5,4,4,'cxxvcvxc','','admin','2015-07-14 00:00:00','admin','2015-07-14 00:00:00'),(2,1,3,3,5,5,4,4,'cxxvcvxc','','admin','2015-07-14 00:00:00',NULL,NULL),(3,1,3,3,3,3,3,3,'cxxvcvxc','','admin','2015-07-14 00:00:00','admin','2015-07-14 00:00:00');
/*!40000 ALTER TABLE `configuracionalmacen` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `configuracioncuenta`
--

DROP TABLE IF EXISTS `configuracioncuenta`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `configuracioncuenta` (
  `idconfiguracioncuenta` int(11) NOT NULL AUTO_INCREMENT,
  `Descripcion` varchar(100) DEFAULT NULL,
  `idtipoconfiguracioncuenta` int(11) DEFAULT NULL,
  `idtipoauxiliar` int(11) DEFAULT NULL,
  `idNaturaleza` int(11) DEFAULT NULL,
  `idClase` int(11) DEFAULT NULL,
  `idtipocambiocuenta` int(11) DEFAULT NULL,
  `idajuste` int(11) DEFAULT NULL,
  `idCuenta` int(11) DEFAULT NULL,
  `idCuentaAbono` int(11) DEFAULT NULL,
  `idCuentaCargo` int(11) DEFAULT NULL,
  `idMoneda` int(11) DEFAULT NULL,
  `ExigeCC` bit(1) DEFAULT NULL,
  `Activo` bit(1) DEFAULT b'1',
  `Usuario` varchar(20) DEFAULT NULL,
  `FechaRegistro` datetime DEFAULT NULL,
  `UsuarioModificacion` varchar(20) DEFAULT NULL,
  `FechaModificacion` datetime DEFAULT NULL,
  PRIMARY KEY (`idconfiguracioncuenta`),
  KEY `fk_configuracioncuenta_tipoconfiguracioncuenta1_idx` (`idtipoconfiguracioncuenta`),
  KEY `fk_configuracioncuenta_tipoauxiliar1_idx` (`idtipoauxiliar`),
  KEY `fk_configuracioncuenta_naturaleza1_idx` (`idNaturaleza`),
  KEY `fk_configuracioncuenta_clase1_idx` (`idClase`),
  KEY `fk_configuracioncuenta_tipocambiocuenta1_idx` (`idtipocambiocuenta`),
  KEY `fk_configuracioncuenta_ajuste1_idx` (`idajuste`),
  KEY `fk_configuracioncuenta_Cuenta1_idx` (`idCuenta`),
  KEY `fk_configuracioncuenta_Cuenta2_idx` (`idCuentaAbono`),
  KEY `fk_configuracioncuenta_Cuenta3_idx` (`idCuentaCargo`),
  KEY `fk_configuracioncuenta_moneda1_idx` (`idMoneda`),
  CONSTRAINT `fk_configuracioncuenta_Cuenta1` FOREIGN KEY (`idCuenta`) REFERENCES `cuenta` (`idCuenta`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_configuracioncuenta_Cuenta2` FOREIGN KEY (`idCuentaAbono`) REFERENCES `cuenta` (`idCuenta`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_configuracioncuenta_Cuenta3` FOREIGN KEY (`idCuentaCargo`) REFERENCES `cuenta` (`idCuenta`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_configuracioncuenta_ajuste1` FOREIGN KEY (`idajuste`) REFERENCES `ajuste` (`idajuste`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_configuracioncuenta_clase1` FOREIGN KEY (`idClase`) REFERENCES `clase` (`idClase`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_configuracioncuenta_moneda1` FOREIGN KEY (`idMoneda`) REFERENCES `moneda` (`idMoneda`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_configuracioncuenta_naturaleza1` FOREIGN KEY (`idNaturaleza`) REFERENCES `naturaleza` (`idNaturaleza`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_configuracioncuenta_tipoauxiliar1` FOREIGN KEY (`idtipoauxiliar`) REFERENCES `tipoauxiliar` (`idtipoauxiliar`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_configuracioncuenta_tipocambiocuenta1` FOREIGN KEY (`idtipocambiocuenta`) REFERENCES `tipocambiocuenta` (`idtipocambiocuenta`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_configuracioncuenta_tipoconfiguracioncuenta1` FOREIGN KEY (`idtipoconfiguracioncuenta`) REFERENCES `tipoconfiguracioncuenta` (`idtipoconfiguracioncuenta`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `configuracioncuenta`
--

LOCK TABLES `configuracioncuenta` WRITE;
/*!40000 ALTER TABLE `configuracioncuenta` DISABLE KEYS */;
INSERT INTO `configuracioncuenta` VALUES (1,'cuarta configuracion',1,3,3,3,3,3,3,4,5,8,'\0','','admin','2015-07-04 00:00:00','admin','2015-07-04 00:00:00'),(2,'cuarta configuracion',1,3,3,3,3,3,3,4,5,8,'\0','','admin','2015-07-04 00:00:00','admin','2015-07-04 00:00:00'),(3,'cuarta configuracion',1,3,3,3,3,3,3,4,5,8,'\0','','admin','2015-07-04 00:00:00','admin','2015-07-04 00:00:00'),(4,'cuarta configuracion',2,3,3,3,3,3,3,5,4,8,'','','admin','2015-07-04 00:00:00','admin','2015-07-04 00:00:00');
/*!40000 ALTER TABLE `configuracioncuenta` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cotizacion`
--

DROP TABLE IF EXISTS `cotizacion`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cotizacion` (
  `idCotizacion` int(11) NOT NULL AUTO_INCREMENT,
  `idClienteProveedor` int(11) NOT NULL,
  `idModeloChasis` int(11) NOT NULL,
  `idProducto` int(11) NOT NULL,
  `idCentroCosto` int(11) NOT NULL,
  `Serie` varchar(20) DEFAULT NULL,
  `Fecha` datetime DEFAULT NULL,
  `NumeroChasis` int(11) DEFAULT NULL,
  `NumeroAsientos` int(11) DEFAULT NULL,
  `NumeroParabrisas` int(11) DEFAULT NULL,
  `Ventanas` varchar(50) DEFAULT NULL,
  `TipoCarroceria` varchar(50) DEFAULT NULL,
  `ColorFondo` varchar(200) DEFAULT NULL,
  `ColorArtes` varchar(200) DEFAULT NULL,
  `ColorOtros` varchar(200) DEFAULT NULL,
  `Observaciones` varchar(200) DEFAULT NULL,
  `Activo` bit(1) DEFAULT b'1',
  `Usuario` varchar(20) DEFAULT NULL,
  `FechaRegistro` datetime DEFAULT NULL,
  `UsuarioModificacion` varchar(20) DEFAULT NULL,
  `FechaModificacion` datetime DEFAULT NULL,
  `Estado` varchar(20) DEFAULT 'Activo',
  `Monto` decimal(9,3) DEFAULT NULL,
  PRIMARY KEY (`idCotizacion`),
  KEY `fk_Cotizacion_ClienteProveedor1_idx` (`idClienteProveedor`),
  KEY `fk_Cotizacion_ModeloChasis1_idx` (`idModeloChasis`),
  KEY `fk_Cotizacion_Producto1_idx` (`idProducto`),
  KEY `fk_Cotizacion_CentroCosto1_idx` (`idCentroCosto`),
  CONSTRAINT `fk_Cotizacion_CentroCosto1` FOREIGN KEY (`idCentroCosto`) REFERENCES `centrocosto` (`idCentroCosto`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_Cotizacion_ClienteProveedor1` FOREIGN KEY (`idClienteProveedor`) REFERENCES `clienteproveedor` (`idClienteProveedor`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_Cotizacion_ModeloChasis1` FOREIGN KEY (`idModeloChasis`) REFERENCES `modelochasis` (`idModeloChasis`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_Cotizacion_Producto1` FOREIGN KEY (`idProducto`) REFERENCES `producto` (`idProducto`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=170 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cotizacion`
--

LOCK TABLES `cotizacion` WRITE;
/*!40000 ALTER TABLE `cotizacion` DISABLE KEYS */;
INSERT INTO `cotizacion` VALUES (4,3,1,0,0,'','2013-02-12 00:00:00',2,2,2,'Pegado','Andino','sadasd','asd','asdasdas',NULL,'\0','admin','2013-02-08 00:00:00','admin','2013-03-01 00:00:00','Aprobado',NULL),(5,3,1,0,0,'','2013-02-12 00:00:00',2,2,2,'Pegado','Andino','sadasd','asd','asdasdas',NULL,'\0','admin','2013-02-08 00:00:00','admin','2013-03-01 00:00:00','Aprobado',NULL),(6,3,1,0,0,'','2013-02-12 00:00:00',2,2,2,'Pegado','Andino','sadasd','asd','asdasdas',NULL,'','admin','2013-02-08 00:00:00','admin','2013-03-01 00:00:00','Aprobado',NULL),(7,1,2,0,0,NULL,'2013-02-01 00:00:00',3,5,6,'Pegado','Urbano','amarillo patito','verde lima limon','rojo pasion','vamos a verlo','','admin','2013-02-10 00:00:00','admin','2013-03-01 00:00:00','Aprobado',NULL),(8,4,2,0,0,NULL,'2013-02-01 00:00:00',3,2,4,'Pegado','Costero','asdas','dasd','asdasda','adfasdasda','','admin','2013-02-12 00:00:00','admin','2013-03-01 00:00:00','Aprobado',NULL),(9,5,1,0,0,'jeje','2013-02-12 00:00:00',5,4,3,'Pegado','Urbano','sd','fsdf','sdfs','sdfsdf','','admin','2013-02-12 00:00:00','admin','2013-03-01 00:00:00','Aprobado',NULL),(10,5,1,0,0,NULL,'2013-02-12 00:00:00',5,4,3,'Pegado','Urbano','sd','fsdf','sdfs','sdfsdf','','admin','2013-02-12 00:00:00','admin','2013-03-01 00:00:00','Aprobado',NULL),(11,5,1,0,0,NULL,'2013-02-12 00:00:00',5,4,3,'Pegado','Urbano','sd','fsdf','sdfs','sdfsdf','','admin','2013-02-12 00:00:00','admin','2013-03-01 00:00:00','Aprobado',NULL),(12,5,1,0,0,'000000','2013-02-12 00:00:00',5,4,3,'Pegado','Urbano','sd','fsdf','sdfs','sdfsdf','','admin','2013-02-12 00:00:00','admin','2013-03-01 00:00:00','Aprobado',NULL),(13,5,1,0,0,NULL,'2013-02-12 00:00:00',5,4,3,'Pegado','Urbano','sd','fsdf','sdfs','sdfsdf','','admin','2013-02-12 00:00:00','admin','2013-03-01 00:00:00','Aprobado',NULL),(14,5,1,0,0,'000001','2013-02-12 00:00:00',5,4,3,'Pegado','Urbano','sd','fsdf','sdfs','sdfsdf','','admin','2013-02-12 00:00:00','admin','2013-03-01 00:00:00','Aprobado',NULL),(15,5,1,0,0,'000001','2013-02-12 00:00:00',5,4,3,'Pegado','Urbano','sd','fsdf','sdfs','sdfsdf','','admin','2013-02-12 00:00:00','admin','2013-03-01 00:00:00','Aprobado',NULL),(16,5,1,0,0,'000001','2013-02-12 00:00:00',5,4,3,'Pegado','Urbano','sd','fsdf','sdfs','sdfsdf','','admin','2013-02-12 00:00:00','admin','2013-03-01 00:00:00','Aprobado',NULL),(17,5,1,0,0,'000001','2013-02-12 00:00:00',5,4,3,'Pegado','Urbano','sd','fsdf','sdfs','sdfsdf','','admin','2013-02-12 00:00:00','admin','2013-03-01 00:00:00','Aprobado',NULL),(18,5,1,0,0,'000002','2013-02-12 00:00:00',5,4,3,'Pegado','Urbano','sd','fsdf','sdfs','sdfsdf','','admin','2013-02-12 00:00:00','admin','2013-03-01 00:00:00','Aprobado',NULL),(19,3,1,0,0,'000003','2013-01-13 00:00:00',3,3,3,'Pegado','Andino','asd','dasd','asdasa','asdas','','admin','2013-02-13 00:00:00','admin','2013-03-01 00:00:00','Aprobado',NULL),(20,1,1,0,0,'000004','2013-01-13 00:00:00',32,32,32,'Pegado','Andino','eqeqe','43q3eq','e3eq','1asdasedasa','\0','admin','2013-02-13 00:00:00','admin','2013-03-01 00:00:00','Aprobado',NULL),(21,4,1,0,0,'000005','2013-01-13 00:00:00',3,4,5,'Pegado','Andino','4534ddfsd','34d53fsd','43d5fsdfsd','sde5d435','','admin','2013-02-13 00:00:00','admin','2013-03-01 00:00:00','Aprobado',NULL),(22,5,1,0,0,'000006','2013-01-13 00:00:00',4,4,4,'Pegado','Andino','4534ddfsd','34d53fsd','43d5fsdfsd','sde5d435','','admin','2013-02-13 00:00:00','admin','2013-03-01 00:00:00','Aprobado',NULL),(23,2,1,0,0,'000007','2013-01-13 00:00:00',4,5,6,'Pegado','Andino','fsd','fsd','dfsd','sdfs','','admin','2013-02-13 00:00:00','admin','2013-03-01 00:00:00','Aprobado',NULL),(24,1,1,0,0,'000008','2013-01-13 00:00:00',4,4,4,'Pegado','Andino','fsdf','s','dfsd','sf','','admin','2013-02-13 00:00:00','admin','2013-03-01 00:00:00','Aprobado',NULL),(25,1,1,0,0,'000009','2013-01-13 00:00:00',7,7,7,'Pegado','Andino','7','7','7','7','','admin','2013-02-13 00:00:00','admin','2013-03-01 00:00:00','Aprobado',NULL),(26,4,1,0,0,'000010','2013-01-14 00:00:00',7,7,7,'Pegado','Andino','7','7','7','7','','admin','2013-02-13 00:00:00','admin','2013-03-01 00:00:00','Aprobado',NULL),(27,3,1,0,0,'000011','2013-01-13 00:00:00',3,3,3,'Pegado','Andino','3','3','3','3','','admin','2013-02-13 00:00:00','admin','2013-03-01 00:00:00','Aprobado',NULL),(28,1,1,0,0,'000012','2013-01-13 00:00:00',4,4,4,'Pegado','Andino','4','4','4','4','','admin','2013-02-13 00:00:00','admin','2013-03-01 00:00:00','Aprobado',NULL),(29,2,1,0,0,'000013','2013-01-13 00:00:00',5,5,5,'Pegado','Andino','5','5','5','5','','admin','2013-02-13 00:00:00','admin','2013-03-01 00:00:00','Aprobado',NULL),(30,1,1,0,0,'000014','2013-01-13 00:00:00',4,4,4,'Pegado','Andino','4','4','4','4','','admin','2013-02-13 00:00:00','admin','2013-03-01 00:00:00','Aprobado',NULL),(31,1,1,0,0,'000015','2013-01-13 00:00:00',5,5,5,'Pegado','Andino','5','5','5','5','','admin','2013-02-13 00:00:00','admin','2013-03-01 00:00:00','Aprobado',NULL),(32,1,1,0,0,'000016','2013-01-13 00:00:00',2,2,2,'Pegado','Andino','2','2','2','2','','admin','2013-02-13 00:00:00','admin','2013-03-01 00:00:00','Aprobado',NULL),(33,1,1,0,0,'000017','2013-01-13 00:00:00',2,2,2,'Pegado','Andino','2','2','2','2','','admin','2013-02-13 00:00:00','admin','2013-03-01 00:00:00','Aprobado',NULL),(34,2,1,0,0,'000018','2013-01-13 00:00:00',1,1,1,'Pegado','Andino','1','1','1','1','','admin','2013-02-13 00:00:00','admin','2013-03-01 00:00:00','Aprobado',NULL),(35,2,1,0,0,'000019','2013-01-13 00:00:00',2,2,2,'Pegado','Andino','2','2','2','2','','admin','2013-02-13 00:00:00','admin','2013-03-01 00:00:00','Aprobado',NULL),(36,1,1,0,0,'000020','2013-01-13 00:00:00',4,4,4,'Pegado','Andino','4','4','4','4','','admin','2013-02-13 00:00:00','admin','2013-03-01 00:00:00','Aprobado',NULL),(37,3,1,0,0,'000021','2013-01-13 00:00:00',4,4,4,'Pegado','Andino','4','4','4','4','','admin','2013-02-13 00:00:00','admin','2013-03-01 00:00:00','Aprobado',NULL),(38,2,1,0,0,'000022','2013-01-13 00:00:00',3,3,3,'Pegado','Andino','3','3','3','3','','admin','2013-02-13 00:00:00','admin','2013-03-01 00:00:00','Aprobado',NULL),(39,4,1,0,0,'000023','2013-01-13 00:00:00',1,1,1,'Pegado','Andino','1','1','1','1','','admin','2013-02-13 00:00:00','admin','2013-03-01 00:00:00','Aprobado',NULL),(40,1,1,0,0,'000024','2013-01-13 00:00:00',4,4,4,'Pegado','Andino','4','4','4','4','','admin','2013-02-13 00:00:00','admin','2013-03-01 00:00:00','Aprobado',NULL),(41,5,1,0,0,'000025','2013-01-18 00:00:00',4,4,4,'Pegado','Andino','4534ddfsd','34d53fsd','43d5fsdfsd','sde5d435','','admin','2013-02-18 00:00:00','admin','2013-03-01 00:00:00','Aprobado',NULL),(42,5,1,0,0,'000026','2013-02-18 00:00:00',4,4,4,'Pegado','Andino','4534ddfsd','34d53fsd','43d5fsdfsd','sde5d435','','admin','2013-02-18 00:00:00','admin','2013-03-01 00:00:00','Aprobado',NULL),(43,3,2,0,0,'000027','2013-02-19 00:00:00',3,3,3,'Pegado','Costero','3','3','3','3','','admin','2013-02-19 00:00:00','admin','2013-03-01 00:00:00','Aprobado',NULL),(44,3,2,0,0,'000028','2013-02-27 00:00:00',2,2,2,'Pegado','Urbano','khkfes','dfdsg','fsgfd','jgykj','','admin','2013-02-27 00:00:00','admin','2013-03-01 00:00:00','Aprobado',NULL),(45,3,2,0,0,'000029','2013-02-27 00:00:00',4,5,5,'Pegado','Urbano','dfsdf','sdfsd','fsdfsdfs','con lista de caracteristicas','','admin','2013-02-27 00:00:00','admin','2013-03-01 00:00:00','Aprobado',NULL),(46,1,2,0,0,'000030','2013-02-27 00:00:00',10,10,10,'Estandar','Costero','sadas','dasd','asdasd','asdasdasdasdas','','admin','2013-02-27 00:00:00','admin','2013-03-01 00:00:00','Aprobado',NULL),(47,3,2,0,0,'000031','2013-02-27 00:00:00',5,5,5,'Pegado','Urbano','dasdasd','asdas','dasdasa','fdgfdgdf','','admin','2013-02-27 00:00:00','admin','2013-03-01 00:00:00','Aprobado',NULL),(48,3,2,0,0,'000032','2013-02-27 00:00:00',2,2,2,'Pegado','Costero','asdasd','asd','asdas','dasdsa','','admin','2013-02-27 00:00:00','admin','2013-03-01 00:00:00','Aprobado',NULL),(49,3,3,0,0,'000033','2013-02-27 00:00:00',5,5,2,'Pegado','Urbano','asdasdasd','asdasdas','dasdasda','sdasdasda','','admin','2013-02-27 00:00:00','admin','2013-03-01 00:00:00','Aprobado',NULL),(50,4,1,0,0,'000034','2013-02-27 00:00:00',3,4,4,'Pegado','Urbano','asd','asd','asda','sdasds','','admin','2013-02-27 00:00:00','admin','2013-03-01 00:00:00','Aprobado',NULL),(51,3,2,0,0,'000035','2013-02-27 00:00:00',3,4,2,'Estandar','Costero','dsf','sd','fsdf','fdfs','','admin','2013-02-27 00:00:00','admin','2013-03-01 00:00:00','Aprobado',NULL),(52,3,2,0,0,'000036','2013-02-27 00:00:00',2,2,3,'Pegado','Costero','12312','3123','12312','3123121','','admin','2013-02-27 00:00:00','admin','2013-03-01 00:00:00','Aprobado',NULL),(53,3,3,0,0,'000037','2013-02-27 00:00:00',5,5,5,'Pegado','Urbano','ad','asda','das','sdasda','','admin','2013-02-27 00:00:00','admin','2013-03-01 00:00:00','Aprobado',NULL),(54,3,3,0,0,'000038','2013-02-27 00:00:00',3,3,3,'Pegado','Urbano','asda','sdas','dasda','asdasdas','','admin','2013-02-27 00:00:00','admin','2013-03-01 00:00:00','Aprobado',NULL),(55,3,2,0,0,'000039','2013-02-27 00:00:00',4,4,4,'Pegado','Urbano','dasda','sda','dasd','asdasda','','admin','2013-02-27 00:00:00','admin','2013-03-01 00:00:00','Aprobado',NULL),(56,3,1,0,0,'000040','2013-02-27 00:00:00',0,0,0,'Estandar','Andino','asd','asda','sdasd','dasdasda','','admin','2013-02-27 00:00:00','admin','2013-03-01 00:00:00','Aprobado',NULL),(57,3,1,0,0,'000041','2013-02-27 00:00:00',0,0,0,'Pegado','Andino','sdsad','asd','asdasda','asdasdas','','admin','2013-02-27 00:00:00','admin','2013-03-01 00:00:00','Aprobado',NULL),(58,2,1,0,0,'000042','2013-02-27 00:00:00',4,4,4,'Pegado','Andino','asdas','asd','dasd','asdasdas','','admin','2013-02-27 00:00:00','admin','2013-03-01 00:00:00','Aprobado',NULL),(59,3,1,0,0,'000043','2013-02-27 00:00:00',0,0,0,'Estandar','Andino','','','','','','admin','2013-02-27 00:00:00','admin','2013-03-01 00:00:00','Aprobado',NULL),(60,3,2,0,0,'000044','2013-02-27 00:00:00',3,4,1,'Pegado','Costero','asd','asd','asda','dasda','','admin','2013-02-27 00:00:00','admin','2013-03-01 00:00:00','Aprobado',NULL),(61,2,1,0,0,'000045','2013-02-27 00:00:00',3,3,3,'Pegado','Costero','','','','','','admin','2013-02-27 00:00:00','admin','2013-03-01 00:00:00','Aprobado',NULL),(62,2,1,0,0,'000045','2013-02-27 00:00:00',3,3,3,'Pegado','Costero','','','','','','admin','2013-02-27 00:00:00','admin','2013-03-01 00:00:00','Aprobado',NULL),(63,2,1,0,0,'000045','2013-02-27 00:00:00',3,3,3,'Pegado','Costero','','','','','','admin','2013-02-27 00:00:00','admin','2013-03-01 00:00:00','Aprobado',NULL),(64,2,1,0,0,'000045','2013-02-27 00:00:00',3,3,3,'Pegado','Costero','','','','','','admin','2013-02-27 00:00:00','admin','2013-03-01 00:00:00','Aprobado',NULL),(65,2,1,0,0,'000045','2013-02-27 00:00:00',3,3,3,'Pegado','Costero','','','','','','admin','2013-02-27 00:00:00','admin','2013-03-01 00:00:00','Aprobado',NULL),(66,2,1,0,0,'000045','2013-02-27 00:00:00',3,3,3,'Pegado','Costero','','','','','','admin','2013-02-27 00:00:00','admin','2013-03-01 00:00:00','Aprobado',NULL),(67,2,1,0,0,'000045','2013-02-27 00:00:00',3,3,3,'Pegado','Costero','','','','','','admin','2013-02-27 00:00:00','admin','2013-03-01 00:00:00','Aprobado',NULL),(68,2,1,0,0,'000045','2013-02-27 00:00:00',3,3,3,'Pegado','Costero','','','','','','admin','2013-02-27 00:00:00','admin','2013-03-01 00:00:00','Aprobado',NULL),(69,2,1,0,0,'000045','2013-02-27 00:00:00',3,3,3,'Pegado','Costero','','','','','','admin','2013-02-27 00:00:00','admin','2013-03-01 00:00:00','Aprobado',NULL),(70,2,1,0,0,'000045','2013-02-27 00:00:00',3,3,3,'Pegado','Costero','','','','','','admin','2013-02-27 00:00:00','admin','2013-03-01 00:00:00','Aprobado',NULL),(71,2,1,0,0,'000045','2013-02-27 00:00:00',3,3,3,'Pegado','Costero','','','','','','admin','2013-02-27 00:00:00','admin','2013-03-01 00:00:00','Aprobado',NULL),(72,3,1,0,0,'000045','2013-02-27 00:00:00',0,0,0,'Estandar','Andino','','','','','','admin','2013-02-27 00:00:00','admin','2013-03-01 00:00:00','Aprobado',NULL),(73,2,1,0,0,'000046','2013-02-27 00:00:00',3,3,3,'Pegado','Costero','','','','','','admin','2013-02-27 00:00:00','admin','2013-03-01 00:00:00','Aprobado',NULL),(74,3,1,0,0,'000046','2013-02-27 00:00:00',0,0,0,'Estandar','Andino','','','','','','admin','2013-02-27 00:00:00','admin','2013-03-01 00:00:00','Aprobado',NULL),(75,3,1,0,0,'000047','2013-02-27 00:00:00',0,0,0,'Estandar','Andino','','','','','','admin','2013-02-27 00:00:00','admin','2013-03-01 00:00:00','Aprobado',NULL),(76,3,1,0,0,'000048','2013-02-27 00:00:00',0,0,0,'Estandar','Andino','','','','','','admin','2013-02-27 00:00:00','admin','2013-03-01 00:00:00','Aprobado',NULL),(77,3,1,0,0,'000049','2013-02-27 00:00:00',0,0,0,'Estandar','Andino','','','','','','admin','2013-02-27 00:00:00','admin','2013-03-01 00:00:00','Aprobado',NULL),(78,4,1,0,0,'000050','2013-02-27 00:00:00',0,0,0,'Estandar','Andino','','','','','','admin','2013-02-27 00:00:00','admin','2013-03-01 00:00:00','Aprobado',NULL),(79,4,1,0,0,'000051','2013-02-27 00:00:00',0,0,0,'Estandar','Andino','','','','','','admin','2013-02-27 00:00:00','admin','2013-03-01 00:00:00','Aprobado',NULL),(80,3,1,0,0,'000052','2013-02-27 00:00:00',0,0,0,'Estandar','Andino','','','','','','admin','2013-02-27 00:00:00','admin','2013-03-01 00:00:00','Aprobado',NULL),(81,3,1,0,0,'000053','2013-01-27 00:00:00',3,3,3,'Estandar','Andino','','','','','','admin','2013-02-27 00:00:00','admin','2013-03-01 00:00:00','Aprobado',NULL),(82,3,1,0,0,'000054','2013-01-27 00:00:00',4,5,3,'Estandar','Andino','','','','','','admin','2013-02-27 00:00:00','admin','2013-03-01 00:00:00','Aprobado',NULL),(83,3,1,0,0,'000055','2013-01-27 00:00:00',2,2,2,'Estandar','Andino','','','','','','admin','2013-02-27 00:00:00','admin','2013-03-01 00:00:00','Aprobado',NULL),(84,2,1,0,0,'000056','2013-01-27 00:00:00',4,4,4,'Estandar','Andino','sdfsd','sdf','sdf','fsdfsd','','admin','2013-02-27 00:00:00','admin','2013-03-01 00:00:00','Aprobado',NULL),(85,3,1,0,0,'000057','2013-02-27 00:00:00',0,0,0,'Estandar','Andino','','','','','','admin','2013-02-27 00:00:00','admin','2013-03-01 00:00:00','Aprobado',NULL),(86,3,1,0,0,'000058','2013-02-27 00:00:00',0,0,0,'Estandar','Andino','','','','','','admin','2013-02-27 00:00:00','admin','2013-03-01 00:00:00','Aprobado',NULL),(87,3,1,0,0,'000059','2013-02-27 00:00:00',0,0,0,'Estandar','Andino','','','','','','admin','2013-02-27 00:00:00','admin','2013-03-01 00:00:00','Aprobado',NULL),(88,3,1,0,0,'000060','2013-02-27 00:00:00',0,0,0,'Estandar','Andino','','','','','','admin','2013-02-27 00:00:00','admin','2013-03-01 00:00:00','Aprobado',NULL),(89,3,1,0,0,'000061','2013-02-27 00:00:00',0,0,0,'Estandar','Andino','','','','','','admin','2013-02-27 00:00:00','admin','2013-03-01 00:00:00','Aprobado',NULL),(90,3,1,0,0,'000062','2013-02-27 00:00:00',0,0,0,'Estandar','Andino','','','','','','admin','2013-02-27 00:00:00','admin','2013-03-01 00:00:00','Aprobado',NULL),(91,1,3,0,0,'000063','2013-02-27 00:00:00',10,10,10,'Pegado','Transporte Personal','cf','ca','co','ultimo ingresado','','admin','2013-02-27 00:00:00','admin','2013-03-01 00:00:00','Aprobado',NULL),(92,1,3,0,0,'000064','2013-02-27 00:00:00',111,11,11,'Pegado','Transporte Personal','cf','ca','co','ultimo ingresado','','admin','2013-02-28 00:00:00','admin','2013-03-01 00:00:00','Aprobado',NULL),(93,1,3,0,0,'000065','2013-02-27 00:00:00',5,5,5,'Pegado','Transporte Personal','cf','ca','co','ultimo ingresado','','admin','2013-02-28 00:00:00','admin','2013-03-01 00:00:00','Aprobado',NULL),(94,1,3,0,0,'000066','2013-02-27 00:00:00',90,90,90,'Pegado','Transporte Personal','cf','ca','co','ultimo ingresado','','admin','2013-02-28 00:00:00','admin','2013-03-01 00:00:00','Aprobado',NULL),(95,1,3,0,0,'000067','2013-02-27 00:00:00',90,90,90,'Pegado','Transporte Personal','cf','ca','co','ultimo ingresado','','admin','2013-02-28 00:00:00','admin','2013-03-01 00:00:00','Aprobado',NULL),(96,1,3,0,0,'000068','2013-02-27 00:00:00',900,900,900,'Pegado','Transporte Personal','cf','ca','co','ultimo ingresado','','admin','2013-02-28 00:00:00','admin','2013-03-01 00:00:00','Aprobado',NULL),(97,1,3,0,0,'000069','2013-02-27 00:00:00',99,99,99,'Pegado','Transporte Personal','cf','ca','co','ultimo ingresado','','admin','2013-02-28 00:00:00','admin','2013-03-01 00:00:00','Aprobado',NULL),(98,1,3,0,0,'000070','2013-02-27 00:00:00',9000,9000,9000,'Pegado','Transporte Personal','cf','ca','co','ultimo ingresado','','admin','2013-02-28 00:00:00','admin','2013-03-01 00:00:00','Aprobado',NULL),(99,1,3,0,0,NULL,'2013-02-27 00:00:00',9000,9000,9000,'Pegado','Transporte Personal','cf','ca','co','ultimo ingresado','','admin','2013-02-28 00:00:00','admin','2013-03-01 00:00:00','Aprobado',NULL),(100,1,3,0,0,NULL,'2013-02-27 00:00:00',9000,9000,9000,'Pegado','Transporte Personal','cf','ca','co','ultimo ingresado','','admin','2013-02-28 00:00:00','admin','2013-03-01 00:00:00','Aprobado',NULL),(101,1,3,0,0,NULL,'2013-02-27 00:00:00',9000,9000,9000,'Pegado','Transporte Personal','cf','ca','co','ultimo ingresado','','admin','2013-02-28 00:00:00','admin','2013-03-01 00:00:00','Aprobado',NULL),(102,1,3,0,0,NULL,'2013-02-27 00:00:00',9000,9000,9000,'Pegado','Transporte Personal','cf','ca','co','ultimo ingresado','','admin','2013-02-28 00:00:00','admin','2013-03-01 00:00:00','Aprobado',NULL),(103,1,3,0,0,NULL,'2013-02-27 00:00:00',9000,9000,9000,'Pegado','Transporte Personal','cf','ca','co','ultimo ingresado','','admin','2013-02-28 00:00:00','admin','2013-03-01 00:00:00','Aprobado',NULL),(104,1,3,0,0,NULL,'2013-02-27 00:00:00',9000,9000,9000,'Pegado','Transporte Personal','cf','ca','co','ultimo ingresado','','admin','2013-02-28 00:00:00','admin','2013-03-01 00:00:00','Aprobado',NULL),(105,1,3,0,0,'xxx','2013-02-27 00:00:00',9000,9000,9000,'Pegado','Transporte Personal','cf','ca','co','ultimo ingresado','','admin','2013-02-28 00:00:00','admin','2013-03-01 00:00:00','Aprobado',NULL),(106,1,3,0,0,'xxx','2013-02-27 00:00:00',9000,9000,9000,'Pegado','Transporte Personal','cf','ca','co','ultimo ingresado','','admin','2013-02-28 00:00:00','admin','2013-03-01 00:00:00','Aprobado',NULL),(107,1,3,0,0,'xxx','2013-02-27 00:00:00',9000,9000,9000,'Pegado','Transporte Personal','cf','ca','co','ultimo ingresado','','admin','2013-02-28 00:00:00','admin','2013-03-01 00:00:00','Aprobado',NULL),(108,1,3,0,0,'xxx','2013-02-27 00:00:00',9000,9000,9000,'Pegado','Transporte Personal','cf','ca','co','ultimo ingresado','','admin','2013-02-28 00:00:00','admin','2013-03-01 00:00:00','Aprobado',NULL),(109,1,3,0,0,'xxx','2013-02-27 00:00:00',9000,9000,9000,'Pegado','Transporte Personal','cf','ca','co','ultimo ingresado','','admin','2013-02-28 00:00:00','admin','2013-03-01 00:00:00','Aprobado',NULL),(110,1,3,0,0,'xxx','2013-02-27 00:00:00',9000,9000,9000,'Pegado','Transporte Personal','cf','ca','co','ultimo ingresado','','admin','2013-02-28 00:00:00','admin','2013-03-01 00:00:00','Aprobado',NULL),(111,1,3,0,0,NULL,'2013-02-27 00:00:00',9000,9000,9000,'Pegado','Transporte Personal','cf','ca','co','ultimo ingresado','','admin','2013-02-28 00:00:00','admin','2013-03-01 00:00:00','Aprobado',NULL),(112,1,3,0,0,NULL,'2013-02-27 00:00:00',9000,9000,9000,'Pegado','Transporte Personal','cf','ca','co','ultimo ingresado','','admin','2013-02-28 00:00:00','admin','2013-03-01 00:00:00','Aprobado',NULL),(113,1,3,0,0,'201302-000001','2013-02-27 00:00:00',9000,9000,9000,'Pegado','Transporte Personal','cf','ca','co','ultimo ingresado','','admin','2013-02-28 00:00:00','admin','2013-03-01 00:00:00','Aprobado',NULL),(114,1,3,0,0,'201302-000001','2013-02-27 00:00:00',90,90,90,'Pegado','Transporte Personal','cf','ca','co','ultimo ingresado','','admin','2013-02-28 00:00:00','admin','2013-03-01 00:00:00','Aprobado',NULL),(115,1,3,0,0,'201302-000001','2013-02-27 00:00:00',90,90,90,'Pegado','Transporte Personal','cf','ca','co','ultimo ingresado','','admin','2013-02-28 00:00:00','admin','2013-03-01 00:00:00','Aprobado',NULL),(116,1,3,0,0,'201302-000001','2013-02-27 00:00:00',90,90,90,'Pegado','Transporte Personal','cf','ca','co','ultimo ingresado','','admin','2013-02-28 00:00:00','admin','2013-03-01 00:00:00','Aprobado',NULL),(117,1,3,0,0,'201302-000001','2013-02-27 00:00:00',90,90,90,'Pegado','Transporte Personal','cf','ca','co','ultimo ingresado','','admin','2013-02-28 00:00:00','admin','2013-03-01 00:00:00','Aprobado',NULL),(118,1,3,0,0,'xxx','2013-02-27 00:00:00',90,90,90,'Pegado','Transporte Personal','cf','ca','co','ultimo ingresado','','admin','2013-02-28 00:00:00','admin','2013-03-01 00:00:00','Aprobado',NULL),(119,1,3,0,0,'xxx','2013-02-27 00:00:00',900,900,900,'Pegado','Transporte Personal','cf','ca','co','ultimo ingresado','','admin','2013-02-28 00:00:00','admin','2013-03-01 00:00:00','Aprobado',NULL),(120,1,3,0,0,'xxx','2013-02-27 00:00:00',900,900,900,'Pegado','Transporte Personal','cf','ca','co','ultimo ingresado','','admin','2013-02-28 00:00:00','admin','2013-03-01 00:00:00','Aprobado',NULL),(121,1,3,0,0,'xxx','2013-02-27 00:00:00',900,900,900,'Pegado','Transporte Personal','cf','ca','co','ultimo ingresado','','admin','2013-02-28 00:00:00','admin','2013-03-01 00:00:00','Aprobado',NULL),(122,1,3,0,0,'xxx','2013-02-27 00:00:00',900,900,900,'Pegado','Transporte Personal','cf','ca','co','ultimo ingresado','','admin','2013-02-28 00:00:00','admin','2013-03-01 00:00:00','Aprobado',NULL),(123,1,3,0,0,'xxx','2013-02-27 00:00:00',900,900,900,'Pegado','Transporte Personal','cf','ca','co','ultimo ingresado','','admin','2013-02-28 00:00:00','admin','2013-03-01 00:00:00','Aprobado',NULL),(124,1,3,0,0,'xxx','2013-02-27 00:00:00',900,900,900,'Pegado','Transporte Personal','cf','ca','co','ultimo ingresado','','admin','2013-02-28 00:00:00','admin','2013-03-01 00:00:00','Aprobado',NULL),(125,1,3,0,0,'xxx','2013-02-27 00:00:00',900,900,900,'Pegado','Transporte Personal','cf','ca','co','ultimo ingresado','','admin','2013-02-28 00:00:00','admin','2013-03-01 00:00:00','Aprobado',NULL),(126,1,3,0,0,NULL,'2013-02-27 00:00:00',90,90,90,'Pegado','Transporte Personal','cf','ca','co','ultimo ingresado','','admin','2013-02-28 00:00:00','admin','2013-03-01 00:00:00','Aprobado',NULL),(127,1,3,0,0,NULL,'2013-02-27 00:00:00',90,90,90,'Pegado','Transporte Personal','cf','ca','co','ultimo ingresado','','admin','2013-02-28 00:00:00','admin','2013-03-01 00:00:00','Aprobado',NULL),(128,1,3,0,0,NULL,'2013-02-27 00:00:00',90,90,90,'Pegado','Transporte Personal','cf','ca','co','ultimo ingresado','','admin','2013-02-28 00:00:00','admin','2013-03-01 00:00:00','Aprobado',NULL),(129,1,3,0,0,NULL,'2013-02-27 00:00:00',90,90,90,'Pegado','Transporte Personal','cf','ca','co','ultimo ingresado','','admin','2013-02-28 00:00:00','admin','2013-03-01 00:00:00','Aprobado',NULL),(130,1,3,0,0,NULL,'2013-02-27 00:00:00',90,90,90,'Pegado','Transporte Personal','cf','ca','co','ultimo ingresado','','admin','2013-02-28 00:00:00','admin','2013-03-01 00:00:00','Aprobado',NULL),(131,1,3,0,0,'201302-000001','2013-02-27 00:00:00',90,90,90,'Pegado','Transporte Personal','cf','ca','co','ultimo ingresado','','admin','2013-02-28 00:00:00','admin','2013-03-01 00:00:00','Aprobado',NULL),(132,1,3,0,0,'201302-000000','2013-02-27 00:00:00',90,90,90,'Pegado','Transporte Personal','cf','ca','co','ultimo ingresado','','admin','2013-02-28 00:00:00','admin','2013-03-01 00:00:00','Aprobado',NULL),(133,1,3,0,0,'201302-000000','2013-02-27 00:00:00',90,90,90,'Pegado','Transporte Personal','cf','ca','co','ultimo ingresado','','admin','2013-02-28 00:00:00','admin','2013-03-01 00:00:00','Aprobado',NULL),(134,1,3,0,0,'201302-000000','2013-02-27 00:00:00',90,90,90,'Pegado','Transporte Personal','cf','ca','co','ultimo ingresado','','admin','2013-02-28 00:00:00','admin','2013-03-01 00:00:00','Aprobado',NULL),(135,1,3,0,0,'201302-000001','2013-02-27 00:00:00',90,90,90,'Pegado','Transporte Personal','cf','ca','co','ultimo ingresado','','admin','2013-02-28 00:00:00','admin','2013-03-01 00:00:00','Aprobado',NULL),(136,1,3,0,0,'201302-000002','2013-02-27 00:00:00',90,90,90,'Pegado','Transporte Personal','cf','ca','co','ultimo ingresado','','admin','2013-02-28 00:00:00','admin','2013-03-01 00:00:00','Aprobado',NULL),(137,1,3,0,0,NULL,'2013-02-27 00:00:00',90,90,90,'Pegado','Transporte Personal','cf','ca','co','ultimo ingresado','','admin','2013-02-28 00:00:00','admin','2013-03-01 00:00:00','Aprobado',NULL),(138,1,3,0,0,NULL,'2013-02-27 00:00:00',90,90,90,'Pegado','Transporte Personal','cf','ca','co','ultimo ingresado','','admin','2013-02-28 00:00:00','admin','2013-03-01 00:00:00','Aprobado',NULL),(139,1,3,0,0,NULL,'2013-02-27 00:00:00',90,90,90,'Pegado','Transporte Personal','cf','ca','co','ultimo ingresado','','admin','2013-02-28 00:00:00','admin','2013-03-01 00:00:00','Aprobado',NULL),(140,1,3,0,0,NULL,'2013-02-27 00:00:00',90,90,90,'Pegado','Transporte Personal','cf','ca','co','ultimo ingresado','','admin','2013-02-28 00:00:00','admin','2013-03-01 00:00:00','Aprobado',NULL),(141,1,3,0,0,'201302-000001','2013-02-27 00:00:00',90,90,90,'Pegado','Transporte Personal','cf','ca','co','ultimo ingresado','','admin','2013-02-28 00:00:00','admin','2013-03-01 00:00:00','Aprobado',NULL),(142,1,3,0,0,'201302-000002','2013-02-27 00:00:00',90,90,90,'Pegado','Transporte Personal','cf','ca','co','ultimo ingresado','','admin','2013-02-28 00:00:00','admin','2013-03-01 00:00:00','Aprobado',NULL),(143,1,3,0,0,'201302-000003','2013-02-27 00:00:00',90,90,90,'Pegado','Transporte Personal','cf','ca','co','ultimo ingresado','','admin','2013-02-28 00:00:00','admin','2013-03-01 00:00:00','Aprobado',NULL),(144,1,3,0,0,'201302-000004','2013-02-27 00:00:00',90,90,90,'Pegado','Transporte Personal','cf','ca','co','ultimo ingresado','','admin','2013-02-28 00:00:00','admin','2013-03-01 00:00:00','Aprobado',NULL),(145,1,3,0,0,'201302-000005','2013-02-27 00:00:00',90,90,90,'Pegado','Transporte Personal','cf','ca','co','ultimo ingresado','','admin','2013-02-28 00:00:00','admin','2013-03-01 00:00:00','Aprobado',NULL),(146,1,3,0,0,'201302-000006','2013-02-27 00:00:00',90,90,90,'Pegado','Transporte Personal','cf','ca','co','ultimo ingresado','','admin','2013-02-28 00:00:00','admin','2013-03-01 00:00:00','Aprobado',NULL),(147,1,3,0,0,'201302-000007','2013-02-27 00:00:00',90,90,90,'Pegado','Transporte Personal','cf','ca','co','ultimo ingresado','','admin','2013-02-28 00:00:00','admin','2013-03-01 00:00:00','Aprobado',NULL),(148,1,3,0,0,'201302-000008','2013-02-27 00:00:00',90,90,90,'Pegado','Transporte Personal','cf','ca','co','ultimo ingresado','','admin','2013-02-28 00:00:00','admin','2013-03-01 00:00:00','Aprobado',510.000),(149,1,3,0,0,'201302-000009','2013-02-27 00:00:00',90,90,90,'Pegado','Transporte Personal','cf','ca','co','ultimo ingresado','','admin','2013-02-28 00:00:00','admin','2013-03-01 00:00:00','Aprobado',600.000),(150,1,3,0,0,'201302-000010','2013-02-27 00:00:00',90,90,90,'Pegado','Transporte Personal','cf','ca','co','ultimo ingresado','','admin','2013-02-28 00:00:00','admin','2013-03-01 00:00:00','Aprobado',210.000),(151,1,3,0,0,'201302-000011','2013-02-27 00:00:00',90,90,90,'Pegado','Transporte Personal','cf','ca','co','ultimo ingresado','','admin','2013-02-28 00:00:00','admin','2013-03-01 00:00:00','Aprobado',240.000),(152,1,3,0,0,'201302-000012','2013-02-27 00:00:00',90,90,90,'Pegado','Transporte Personal','cf','ca','co','ultimo ingresado','','admin','2013-02-28 00:00:00','admin','2013-03-01 00:00:00','Aprobado',600.000),(153,1,3,0,0,'201302-000013','2013-02-27 00:00:00',90,90,90,'Pegado','Transporte Personal','cf','ca','co','ultimo ingresado','','admin','2013-02-28 00:00:00','admin','2013-03-01 00:00:00','Aprobado',350.000),(154,1,3,0,0,'201302-000014','2013-02-27 00:00:00',90,90,90,'Pegado','Transporte Personal','cf','ca','co','ultimo ingresado','','admin','2013-02-28 00:00:00','admin','2013-03-01 00:00:00','Aprobado',35.000),(155,1,3,0,0,'201303-000001','2013-03-01 00:00:00',8,8,8,'Pegado','Transporte Personal','cf','ca','co','ultimo ingresado','','admin','2013-03-01 00:00:00','admin','2013-03-01 00:00:00','Aprobado',70.000),(156,1,3,0,0,'201303-000002','2013-03-01 00:00:00',8,8,8,'Pegado','Transporte Personal','cf','ca','co','ultimo ingresado','','admin','2013-03-01 00:00:00','admin','2013-03-01 00:00:00','Aprobado',70.000),(157,1,3,0,0,'201303-000003','2013-03-01 00:00:00',8,8,8,'Pegado','Transporte Personal','cf','ca','co','ultimo ingresado','','admin','2013-03-01 00:00:00','admin','2013-03-01 00:00:00','Aprobado',70.000),(158,1,3,0,0,'201303-000004','2013-03-01 00:00:00',8,8,8,'Pegado','Transporte Personal','cf','ca','co','ultimo ingresado','','admin','2013-03-01 00:00:00','admin','2013-03-01 00:00:00','Aprobado',70.000),(159,1,3,0,0,'201303-000005','2013-03-01 00:00:00',8,8,8,'Pegado','Transporte Personal','cf','ca','co','ultimo ingresado','','admin','2013-03-03 00:00:00','admin','2013-03-03 00:00:00','Aprobado',70.000),(160,1,3,0,0,'201303-000006','2013-03-01 00:00:00',7,8,8,'Pegado','Transporte Personal','sd','ca','co','ultimo ingresado','','admin','2013-03-21 00:00:00','admin','2013-03-21 00:00:00','Aprobado',74.000),(161,3,3,6,2,'201304-000001','2013-03-01 00:00:00',7,8,8,'Pegado','Transporte Personal','sd','ca','co','ultimo ingresado','','admin','2013-04-03 00:00:00','admin','2013-04-03 00:00:00','Aprobado',74.000),(164,3,2,2,2,'201304-000002','2013-04-19 00:00:00',2535,4,4,'Pegado','Costero','','','','vamos probando','','admin','2013-04-19 00:00:00','admin','2013-04-19 00:00:00','Aprobado',25.000),(165,3,2,2,2,'201312-000001','2013-04-19 00:00:00',6528,6,6,'Pegado','Costero','','','','creado despues de tiempo','','admin','2013-12-29 00:00:00','admin','2013-12-29 00:00:00','Aprobado',25.000),(166,4,2,2,2,'201401-000001','2014-01-01 00:00:00',6528,6,6,'Pegado','Costero','','','','creado despues de tiempo','','admin','2014-01-25 00:00:00','admin','2014-01-25 00:00:00','Aprobado',25.000),(167,5,2,2,2,'201402-000001','2014-02-16 00:00:00',123456,20,10,'Estandar','Urbano','rosa','turquesa','amarillo patito','colorido','','admin','2014-02-16 00:00:00','admin','2014-02-18 00:00:00','Aprobado',155.000),(168,1,2,2,2,'201402-000002','2014-02-16 00:00:00',123456,20,10,'Estandar','Urbano','rosa','turquesa','amarillo patito','colorido','','admin','2014-02-25 00:00:00','admin','2014-02-25 00:00:00','Aprobado',187.000),(169,3,2,2,2,'201403-000001','2014-02-16 00:00:00',123456,20,10,'Estandar','Urbano','rosa','turquesa','amarillo patito','colorido','','admin','2014-03-24 00:00:00','admin','2014-07-20 00:00:00','Aprobado',2420.000);
/*!40000 ALTER TABLE `cotizacion` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cotizacioncaracteristicas`
--

DROP TABLE IF EXISTS `cotizacioncaracteristicas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cotizacioncaracteristicas` (
  `idCotizacionCaracteristicas` int(11) NOT NULL AUTO_INCREMENT,
  `idCotizacion` int(11) NOT NULL,
  `idCaracteristicas` int(11) NOT NULL,
  `Estado` int(11) DEFAULT NULL,
  `Valor` varchar(50) DEFAULT NULL,
  `Activo` bit(1) DEFAULT b'1',
  `Usuario` varchar(20) DEFAULT NULL,
  `FechaRegistro` datetime DEFAULT NULL,
  `UsuarioModificacion` varchar(20) DEFAULT NULL,
  `FechaModificacion` datetime DEFAULT NULL,
  PRIMARY KEY (`idCotizacionCaracteristicas`),
  KEY `fk_CotizacionCaracteristicas_Cotizacion1_idx` (`idCotizacion`),
  KEY `fk_CotizacionCaracteristicas_Caracteristicas1_idx` (`idCaracteristicas`),
  CONSTRAINT `fk_CotizacionCaracteristicas_Caracteristicas1` FOREIGN KEY (`idCaracteristicas`) REFERENCES `caracteristicas` (`idCaracteristicas`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_CotizacionCaracteristicas_Cotizacion1` FOREIGN KEY (`idCotizacion`) REFERENCES `cotizacion` (`idCotizacion`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=1262 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cotizacioncaracteristicas`
--

LOCK TABLES `cotizacioncaracteristicas` WRITE;
/*!40000 ALTER TABLE `cotizacioncaracteristicas` DISABLE KEYS */;
INSERT INTO `cotizacioncaracteristicas` VALUES (1,53,1,0,'','','admin','2013-02-27 00:00:00',NULL,NULL),(2,53,2,0,'','','admin','2013-02-27 00:00:00',NULL,NULL),(3,53,3,0,'asdasda','','admin','2013-02-27 00:00:00',NULL,NULL),(4,53,4,0,'','','admin','2013-02-27 00:00:00',NULL,NULL),(5,53,5,0,'','','admin','2013-02-27 00:00:00',NULL,NULL),(6,53,6,0,'asdasdasda','','admin','2013-02-27 00:00:00',NULL,NULL),(7,53,7,0,'','','admin','2013-02-27 00:00:00',NULL,NULL),(8,53,8,0,'','','admin','2013-02-27 00:00:00',NULL,NULL),(9,53,9,0,'dasdas','','admin','2013-02-27 00:00:00',NULL,NULL),(10,53,10,0,'','','admin','2013-02-27 00:00:00',NULL,NULL),(11,53,11,0,'','','admin','2013-02-27 00:00:00',NULL,NULL),(12,53,12,0,'dasdas','','admin','2013-02-27 00:00:00',NULL,NULL),(13,54,1,1,'','','admin','2013-02-27 00:00:00',NULL,NULL),(14,54,2,1,'','','admin','2013-02-27 00:00:00',NULL,NULL),(15,54,3,1,'','','admin','2013-02-27 00:00:00',NULL,NULL),(16,54,4,1,'','','admin','2013-02-27 00:00:00',NULL,NULL),(17,54,5,1,'','','admin','2013-02-27 00:00:00',NULL,NULL),(18,54,6,1,'','','admin','2013-02-27 00:00:00',NULL,NULL),(19,54,7,1,'','','admin','2013-02-27 00:00:00',NULL,NULL),(20,54,8,1,'','','admin','2013-02-27 00:00:00',NULL,NULL),(21,54,9,1,'adsasda','','admin','2013-02-27 00:00:00',NULL,NULL),(22,54,10,1,'','','admin','2013-02-27 00:00:00',NULL,NULL),(23,54,11,1,'','','admin','2013-02-27 00:00:00',NULL,NULL),(24,54,12,1,'dasdas','','admin','2013-02-27 00:00:00',NULL,NULL),(25,56,1,1,'','','admin','2013-02-27 00:00:00',NULL,NULL),(26,56,2,1,'','','admin','2013-02-27 00:00:00',NULL,NULL),(27,56,3,1,'','','admin','2013-02-27 00:00:00',NULL,NULL),(28,56,4,1,'','','admin','2013-02-27 00:00:00',NULL,NULL),(29,56,5,1,'','','admin','2013-02-27 00:00:00',NULL,NULL),(30,56,6,1,'','','admin','2013-02-27 00:00:00',NULL,NULL),(31,56,7,1,'','','admin','2013-02-27 00:00:00',NULL,NULL),(32,56,8,1,'','','admin','2013-02-27 00:00:00',NULL,NULL),(33,56,9,1,'asdasdas','','admin','2013-02-27 00:00:00',NULL,NULL),(34,56,10,1,'','','admin','2013-02-27 00:00:00',NULL,NULL),(35,56,11,1,'','','admin','2013-02-27 00:00:00',NULL,NULL),(36,56,12,1,'dasdasa','','admin','2013-02-27 00:00:00',NULL,NULL),(37,79,1,NULL,'true','','admin','2013-02-27 00:00:00',NULL,NULL),(38,79,2,NULL,'true','','admin','2013-02-27 00:00:00',NULL,NULL),(39,79,3,NULL,'true','','admin','2013-02-27 00:00:00',NULL,NULL),(40,79,4,NULL,'true','','admin','2013-02-27 00:00:00',NULL,NULL),(41,79,5,NULL,'true','','admin','2013-02-27 00:00:00',NULL,NULL),(42,79,6,NULL,'true','','admin','2013-02-27 00:00:00',NULL,NULL),(43,79,7,NULL,'true','','admin','2013-02-27 00:00:00',NULL,NULL),(44,79,8,NULL,'true','','admin','2013-02-27 00:00:00',NULL,NULL),(45,79,9,NULL,'true','','admin','2013-02-27 00:00:00',NULL,NULL),(46,79,10,NULL,'true','','admin','2013-02-27 00:00:00',NULL,NULL),(47,79,11,NULL,'true','','admin','2013-02-27 00:00:00',NULL,NULL),(48,79,12,NULL,'true','','admin','2013-02-27 00:00:00',NULL,NULL),(49,80,1,NULL,'true','','admin','2013-02-27 00:00:00',NULL,NULL),(50,80,2,NULL,'true','','admin','2013-02-27 00:00:00',NULL,NULL),(51,80,3,NULL,'true','','admin','2013-02-27 00:00:00',NULL,NULL),(52,80,4,NULL,'true','','admin','2013-02-27 00:00:00',NULL,NULL),(53,80,5,NULL,'true','','admin','2013-02-27 00:00:00',NULL,NULL),(54,80,6,NULL,'true','','admin','2013-02-27 00:00:00',NULL,NULL),(55,80,7,NULL,'true','','admin','2013-02-27 00:00:00',NULL,NULL),(56,80,8,NULL,'true','','admin','2013-02-27 00:00:00',NULL,NULL),(57,80,9,NULL,'true','','admin','2013-02-27 00:00:00',NULL,NULL),(58,80,10,NULL,'true','','admin','2013-02-27 00:00:00',NULL,NULL),(59,80,11,NULL,'true','','admin','2013-02-27 00:00:00',NULL,NULL),(60,80,12,NULL,'true','','admin','2013-02-27 00:00:00',NULL,NULL),(61,81,1,NULL,'1','','admin','2013-02-27 00:00:00',NULL,NULL),(62,81,2,NULL,'2','','admin','2013-02-27 00:00:00',NULL,NULL),(63,81,3,NULL,'3','','admin','2013-02-27 00:00:00',NULL,NULL),(64,81,4,NULL,'4','','admin','2013-02-27 00:00:00',NULL,NULL),(65,81,5,NULL,'5','','admin','2013-02-27 00:00:00',NULL,NULL),(66,81,6,NULL,'6','','admin','2013-02-27 00:00:00',NULL,NULL),(67,81,7,NULL,'7','','admin','2013-02-27 00:00:00',NULL,NULL),(68,81,8,NULL,'8','','admin','2013-02-27 00:00:00',NULL,NULL),(69,81,9,NULL,'9','','admin','2013-02-27 00:00:00',NULL,NULL),(70,81,10,NULL,'10','','admin','2013-02-27 00:00:00',NULL,NULL),(71,81,11,NULL,'11','','admin','2013-02-27 00:00:00',NULL,NULL),(72,81,12,NULL,'12','','admin','2013-02-27 00:00:00',NULL,NULL),(73,82,1,NULL,'','','admin','2013-02-27 00:00:00',NULL,NULL),(74,82,2,NULL,'','','admin','2013-02-27 00:00:00',NULL,NULL),(75,82,3,NULL,'','','admin','2013-02-27 00:00:00',NULL,NULL),(76,82,4,NULL,'','','admin','2013-02-27 00:00:00',NULL,NULL),(77,82,5,NULL,'','','admin','2013-02-27 00:00:00',NULL,NULL),(78,82,6,NULL,'','','admin','2013-02-27 00:00:00',NULL,NULL),(79,82,7,NULL,'aaaaa','','admin','2013-02-27 00:00:00',NULL,NULL),(80,82,8,NULL,'bbbbbb','','admin','2013-02-27 00:00:00',NULL,NULL),(81,82,9,NULL,'cccccccccc','','admin','2013-02-27 00:00:00',NULL,NULL),(82,82,10,NULL,'ddddddddd','','admin','2013-02-27 00:00:00',NULL,NULL),(83,82,11,NULL,'eeeeeeeeeeee','','admin','2013-02-27 00:00:00',NULL,NULL),(84,82,12,NULL,'fffffffffffff','','admin','2013-02-27 00:00:00',NULL,NULL),(85,83,1,NULL,'0','','admin','2013-02-27 00:00:00',NULL,NULL),(86,83,2,NULL,'0','','admin','2013-02-27 00:00:00',NULL,NULL),(87,83,3,NULL,'0','','admin','2013-02-27 00:00:00',NULL,NULL),(88,83,4,NULL,'0','','admin','2013-02-27 00:00:00',NULL,NULL),(89,83,5,NULL,'0','','admin','2013-02-27 00:00:00',NULL,NULL),(90,83,6,NULL,'0','','admin','2013-02-27 00:00:00',NULL,NULL),(91,83,7,NULL,'0','','admin','2013-02-27 00:00:00',NULL,NULL),(92,83,8,NULL,'0','','admin','2013-02-27 00:00:00',NULL,NULL),(93,83,9,NULL,'0','','admin','2013-02-27 00:00:00',NULL,NULL),(94,83,10,NULL,'0','','admin','2013-02-27 00:00:00',NULL,NULL),(95,83,11,NULL,'0','','admin','2013-02-27 00:00:00',NULL,NULL),(96,83,12,NULL,'0','','admin','2013-02-27 00:00:00',NULL,NULL),(97,84,1,NULL,'true','','admin','2013-02-27 00:00:00',NULL,NULL),(98,84,2,NULL,'true','','admin','2013-02-27 00:00:00',NULL,NULL),(99,84,3,NULL,'true','','admin','2013-02-27 00:00:00',NULL,NULL),(100,84,4,NULL,'true','','admin','2013-02-27 00:00:00',NULL,NULL),(101,84,5,NULL,'true','','admin','2013-02-27 00:00:00',NULL,NULL),(102,84,6,NULL,'true','','admin','2013-02-27 00:00:00',NULL,NULL),(103,84,7,NULL,'true','','admin','2013-02-27 00:00:00',NULL,NULL),(104,84,8,NULL,'true','','admin','2013-02-27 00:00:00',NULL,NULL),(105,84,9,NULL,'true','','admin','2013-02-27 00:00:00',NULL,NULL),(106,84,10,NULL,'true','','admin','2013-02-27 00:00:00',NULL,NULL),(107,84,11,NULL,'true','','admin','2013-02-27 00:00:00',NULL,NULL),(108,84,12,NULL,'true','','admin','2013-02-27 00:00:00',NULL,NULL),(109,85,1,NULL,'15','','admin','2013-02-27 00:00:00',NULL,NULL),(110,85,2,NULL,'15','','admin','2013-02-27 00:00:00',NULL,NULL),(111,85,3,NULL,'15','','admin','2013-02-27 00:00:00',NULL,NULL),(112,85,4,NULL,'15','','admin','2013-02-27 00:00:00',NULL,NULL),(113,85,5,NULL,'15','','admin','2013-02-27 00:00:00',NULL,NULL),(114,85,6,NULL,'15','','admin','2013-02-27 00:00:00',NULL,NULL),(115,85,7,NULL,'15','','admin','2013-02-27 00:00:00',NULL,NULL),(116,85,8,NULL,'15','','admin','2013-02-27 00:00:00',NULL,NULL),(117,85,9,NULL,'15','','admin','2013-02-27 00:00:00',NULL,NULL),(118,85,10,NULL,'15','','admin','2013-02-27 00:00:00',NULL,NULL),(119,85,11,NULL,'15','','admin','2013-02-27 00:00:00',NULL,NULL),(120,85,12,NULL,'15','','admin','2013-02-27 00:00:00',NULL,NULL),(121,86,1,NULL,'1','','admin','2013-02-27 00:00:00',NULL,NULL),(122,86,2,NULL,'1','','admin','2013-02-27 00:00:00',NULL,NULL),(123,86,3,NULL,'1','','admin','2013-02-27 00:00:00',NULL,NULL),(124,86,4,NULL,'1','','admin','2013-02-27 00:00:00',NULL,NULL),(125,86,5,NULL,'1','','admin','2013-02-27 00:00:00',NULL,NULL),(126,86,6,NULL,'1','','admin','2013-02-27 00:00:00',NULL,NULL),(127,86,7,NULL,'1','','admin','2013-02-27 00:00:00',NULL,NULL),(128,86,8,NULL,'1','','admin','2013-02-27 00:00:00',NULL,NULL),(129,86,9,NULL,'1','','admin','2013-02-27 00:00:00',NULL,NULL),(130,86,10,NULL,'1','','admin','2013-02-27 00:00:00',NULL,NULL),(131,86,11,NULL,'1','','admin','2013-02-27 00:00:00',NULL,NULL),(132,86,12,NULL,'1','','admin','2013-02-27 00:00:00',NULL,NULL),(133,87,1,NULL,'1','','admin','2013-02-27 00:00:00',NULL,NULL),(134,87,2,NULL,'0','','admin','2013-02-27 00:00:00',NULL,NULL),(135,87,3,NULL,'0','','admin','2013-02-27 00:00:00',NULL,NULL),(136,87,4,NULL,'0','','admin','2013-02-27 00:00:00',NULL,NULL),(137,87,5,NULL,'1','','admin','2013-02-27 00:00:00',NULL,NULL),(138,87,6,NULL,'0','','admin','2013-02-27 00:00:00',NULL,NULL),(139,87,7,NULL,'0','','admin','2013-02-27 00:00:00',NULL,NULL),(140,87,8,NULL,'1','','admin','2013-02-27 00:00:00',NULL,NULL),(141,87,9,NULL,'0','','admin','2013-02-27 00:00:00',NULL,NULL),(142,87,10,NULL,'0','','admin','2013-02-27 00:00:00',NULL,NULL),(143,87,11,NULL,'1','','admin','2013-02-27 00:00:00',NULL,NULL),(144,87,12,NULL,'0','','admin','2013-02-27 00:00:00',NULL,NULL),(145,80,2,1,'sdasda','','admin','2013-02-27 00:00:00',NULL,NULL),(146,90,1,1,'','','admin','2013-02-27 00:00:00',NULL,NULL),(147,90,2,0,'','','admin','2013-02-27 00:00:00',NULL,NULL),(148,90,3,0,'','','admin','2013-02-27 00:00:00',NULL,NULL),(149,90,4,1,'','','admin','2013-02-27 00:00:00',NULL,NULL),(150,90,5,0,'','','admin','2013-02-27 00:00:00',NULL,NULL),(151,90,6,0,'','','admin','2013-02-27 00:00:00',NULL,NULL),(152,90,7,0,'','','admin','2013-02-27 00:00:00',NULL,NULL),(153,90,8,1,'','','admin','2013-02-27 00:00:00',NULL,NULL),(154,90,9,0,'','','admin','2013-02-27 00:00:00',NULL,NULL),(155,90,10,0,'','','admin','2013-02-27 00:00:00',NULL,NULL),(156,90,11,1,'','','admin','2013-02-27 00:00:00',NULL,NULL),(157,90,12,0,'','','admin','2013-02-27 00:00:00',NULL,NULL),(158,91,1,1,'','','admin','2013-02-27 00:00:00',NULL,NULL),(159,91,2,0,'','','admin','2013-02-27 00:00:00',NULL,NULL),(160,91,3,0,'','','admin','2013-02-27 00:00:00',NULL,NULL),(161,91,4,1,'','','admin','2013-02-27 00:00:00',NULL,NULL),(162,91,5,0,'','','admin','2013-02-27 00:00:00',NULL,NULL),(163,91,6,0,'','','admin','2013-02-27 00:00:00',NULL,NULL),(164,91,7,0,'','','admin','2013-02-27 00:00:00',NULL,NULL),(165,91,8,0,'','','admin','2013-02-27 00:00:00',NULL,NULL),(166,91,9,1,'otro lateral','','admin','2013-02-27 00:00:00',NULL,NULL),(167,91,10,0,'','','admin','2013-02-27 00:00:00',NULL,NULL),(168,91,11,1,'','','admin','2013-02-27 00:00:00',NULL,NULL),(169,91,12,0,'','','admin','2013-02-27 00:00:00',NULL,NULL),(170,92,1,1,'','','admin','2013-02-28 00:00:00',NULL,NULL),(171,92,2,0,'','','admin','2013-02-28 00:00:00',NULL,NULL),(172,92,3,0,'','','admin','2013-02-28 00:00:00',NULL,NULL),(173,92,4,1,'','','admin','2013-02-28 00:00:00',NULL,NULL),(174,92,5,0,'','','admin','2013-02-28 00:00:00',NULL,NULL),(175,92,6,0,'','','admin','2013-02-28 00:00:00',NULL,NULL),(176,92,7,0,'','','admin','2013-02-28 00:00:00',NULL,NULL),(177,92,8,0,'','','admin','2013-02-28 00:00:00',NULL,NULL),(178,92,9,1,'otro lateral','','admin','2013-02-28 00:00:00',NULL,NULL),(179,92,10,0,'','','admin','2013-02-28 00:00:00',NULL,NULL),(180,92,11,1,'','','admin','2013-02-28 00:00:00',NULL,NULL),(181,92,12,0,'','','admin','2013-02-28 00:00:00',NULL,NULL),(182,93,1,1,'','','admin','2013-02-28 00:00:00',NULL,NULL),(183,93,2,0,'','','admin','2013-02-28 00:00:00',NULL,NULL),(184,93,3,0,'','','admin','2013-02-28 00:00:00',NULL,NULL),(185,93,4,1,'','','admin','2013-02-28 00:00:00',NULL,NULL),(186,93,5,0,'','','admin','2013-02-28 00:00:00',NULL,NULL),(187,93,6,0,'','','admin','2013-02-28 00:00:00',NULL,NULL),(188,93,7,0,'','','admin','2013-02-28 00:00:00',NULL,NULL),(189,93,8,0,'','','admin','2013-02-28 00:00:00',NULL,NULL),(190,93,9,1,'otro lateral','','admin','2013-02-28 00:00:00',NULL,NULL),(191,93,10,0,'','','admin','2013-02-28 00:00:00',NULL,NULL),(192,93,11,1,'','','admin','2013-02-28 00:00:00',NULL,NULL),(193,93,12,0,'','','admin','2013-02-28 00:00:00',NULL,NULL),(194,94,1,1,'','\0','admin','2013-02-28 00:00:00','admin','2013-02-28 00:00:00'),(195,94,2,0,'','\0','admin','2013-02-28 00:00:00','admin','2013-02-28 00:00:00'),(196,94,3,0,'','\0','admin','2013-02-28 00:00:00','admin','2013-02-28 00:00:00'),(197,94,4,1,'','\0','admin','2013-02-28 00:00:00','admin','2013-02-28 00:00:00'),(198,94,5,0,'','\0','admin','2013-02-28 00:00:00','admin','2013-02-28 00:00:00'),(199,94,6,0,'','\0','admin','2013-02-28 00:00:00','admin','2013-02-28 00:00:00'),(200,94,7,0,'','\0','admin','2013-02-28 00:00:00','admin','2013-02-28 00:00:00'),(201,94,8,0,'','\0','admin','2013-02-28 00:00:00','admin','2013-02-28 00:00:00'),(202,94,9,1,'otro lateral','\0','admin','2013-02-28 00:00:00','admin','2013-02-28 00:00:00'),(203,94,10,0,'','\0','admin','2013-02-28 00:00:00','admin','2013-02-28 00:00:00'),(204,94,11,1,'','\0','admin','2013-02-28 00:00:00','admin','2013-02-28 00:00:00'),(205,94,12,0,'','\0','admin','2013-02-28 00:00:00','admin','2013-02-28 00:00:00'),(206,94,1,1,'','','admin','2013-02-28 00:00:00',NULL,NULL),(207,94,2,0,'','','admin','2013-02-28 00:00:00',NULL,NULL),(208,94,3,0,'','','admin','2013-02-28 00:00:00',NULL,NULL),(209,94,4,1,'','','admin','2013-02-28 00:00:00',NULL,NULL),(210,94,5,0,'','','admin','2013-02-28 00:00:00',NULL,NULL),(211,94,6,0,'','','admin','2013-02-28 00:00:00',NULL,NULL),(212,94,7,0,'','','admin','2013-02-28 00:00:00',NULL,NULL),(213,94,8,0,'','','admin','2013-02-28 00:00:00',NULL,NULL),(214,94,9,1,'otro lateral','','admin','2013-02-28 00:00:00',NULL,NULL),(215,94,10,0,'','','admin','2013-02-28 00:00:00',NULL,NULL),(216,94,11,1,'','','admin','2013-02-28 00:00:00',NULL,NULL),(217,94,12,0,'','','admin','2013-02-28 00:00:00',NULL,NULL),(218,95,1,1,'','','admin','2013-02-28 00:00:00',NULL,NULL),(219,95,2,0,'','','admin','2013-02-28 00:00:00',NULL,NULL),(220,95,3,0,'','','admin','2013-02-28 00:00:00',NULL,NULL),(221,95,4,1,'','','admin','2013-02-28 00:00:00',NULL,NULL),(222,95,5,0,'','','admin','2013-02-28 00:00:00',NULL,NULL),(223,95,6,0,'','','admin','2013-02-28 00:00:00',NULL,NULL),(224,95,7,0,'','','admin','2013-02-28 00:00:00',NULL,NULL),(225,95,8,0,'','','admin','2013-02-28 00:00:00',NULL,NULL),(226,95,9,1,'otro lateral','','admin','2013-02-28 00:00:00',NULL,NULL),(227,95,10,0,'','','admin','2013-02-28 00:00:00',NULL,NULL),(228,95,11,1,'','','admin','2013-02-28 00:00:00',NULL,NULL),(229,95,12,0,'','','admin','2013-02-28 00:00:00',NULL,NULL),(230,96,1,1,'','','admin','2013-02-28 00:00:00',NULL,NULL),(231,96,2,0,'','','admin','2013-02-28 00:00:00',NULL,NULL),(232,96,3,0,'','','admin','2013-02-28 00:00:00',NULL,NULL),(233,96,4,1,'','','admin','2013-02-28 00:00:00',NULL,NULL),(234,96,5,0,'','','admin','2013-02-28 00:00:00',NULL,NULL),(235,96,6,0,'','','admin','2013-02-28 00:00:00',NULL,NULL),(236,96,7,0,'','','admin','2013-02-28 00:00:00',NULL,NULL),(237,96,8,0,'','','admin','2013-02-28 00:00:00',NULL,NULL),(238,96,9,1,'otro lateral','','admin','2013-02-28 00:00:00',NULL,NULL),(239,96,10,0,'','','admin','2013-02-28 00:00:00',NULL,NULL),(240,96,11,1,'','','admin','2013-02-28 00:00:00',NULL,NULL),(241,96,12,0,'','','admin','2013-02-28 00:00:00',NULL,NULL),(242,97,1,1,'','','admin','2013-02-28 00:00:00',NULL,NULL),(243,97,2,0,'','','admin','2013-02-28 00:00:00',NULL,NULL),(244,97,3,0,'','','admin','2013-02-28 00:00:00',NULL,NULL),(245,97,4,1,'','','admin','2013-02-28 00:00:00',NULL,NULL),(246,97,5,0,'','','admin','2013-02-28 00:00:00',NULL,NULL),(247,97,6,0,'','','admin','2013-02-28 00:00:00',NULL,NULL),(248,97,7,0,'','','admin','2013-02-28 00:00:00',NULL,NULL),(249,97,8,0,'','','admin','2013-02-28 00:00:00',NULL,NULL),(250,97,9,1,'otro lateral','','admin','2013-02-28 00:00:00',NULL,NULL),(251,97,10,0,'','','admin','2013-02-28 00:00:00',NULL,NULL),(252,97,11,1,'','','admin','2013-02-28 00:00:00',NULL,NULL),(253,97,12,0,'','','admin','2013-02-28 00:00:00',NULL,NULL),(254,98,1,1,'','\0','admin','2013-02-28 00:00:00','admin','2013-02-28 00:00:00'),(255,98,2,0,'','\0','admin','2013-02-28 00:00:00','admin','2013-02-28 00:00:00'),(256,98,3,0,'','\0','admin','2013-02-28 00:00:00','admin','2013-02-28 00:00:00'),(257,98,4,1,'','\0','admin','2013-02-28 00:00:00','admin','2013-02-28 00:00:00'),(258,98,5,0,'','\0','admin','2013-02-28 00:00:00','admin','2013-02-28 00:00:00'),(259,98,6,0,'','\0','admin','2013-02-28 00:00:00','admin','2013-02-28 00:00:00'),(260,98,7,0,'','\0','admin','2013-02-28 00:00:00','admin','2013-02-28 00:00:00'),(261,98,8,0,'','\0','admin','2013-02-28 00:00:00','admin','2013-02-28 00:00:00'),(262,98,9,1,'otro lateral','\0','admin','2013-02-28 00:00:00','admin','2013-02-28 00:00:00'),(263,98,10,0,'','\0','admin','2013-02-28 00:00:00','admin','2013-02-28 00:00:00'),(264,98,11,1,'','\0','admin','2013-02-28 00:00:00','admin','2013-02-28 00:00:00'),(265,98,12,0,'','\0','admin','2013-02-28 00:00:00','admin','2013-02-28 00:00:00'),(266,98,1,1,'','\0','admin','2013-02-28 00:00:00','admin','2013-02-28 00:00:00'),(267,98,2,0,'','\0','admin','2013-02-28 00:00:00','admin','2013-02-28 00:00:00'),(268,98,3,0,'','\0','admin','2013-02-28 00:00:00','admin','2013-02-28 00:00:00'),(269,98,4,1,'','\0','admin','2013-02-28 00:00:00','admin','2013-02-28 00:00:00'),(270,98,5,0,'','\0','admin','2013-02-28 00:00:00','admin','2013-02-28 00:00:00'),(271,98,6,0,'','\0','admin','2013-02-28 00:00:00','admin','2013-02-28 00:00:00'),(272,98,7,0,'','\0','admin','2013-02-28 00:00:00','admin','2013-02-28 00:00:00'),(273,98,8,0,'','\0','admin','2013-02-28 00:00:00','admin','2013-02-28 00:00:00'),(274,98,9,1,'otro lateral','\0','admin','2013-02-28 00:00:00','admin','2013-02-28 00:00:00'),(275,98,10,0,'','\0','admin','2013-02-28 00:00:00','admin','2013-02-28 00:00:00'),(276,98,11,1,'','\0','admin','2013-02-28 00:00:00','admin','2013-02-28 00:00:00'),(277,98,12,0,'','\0','admin','2013-02-28 00:00:00','admin','2013-02-28 00:00:00'),(278,98,1,1,'','','admin','2013-02-28 00:00:00',NULL,NULL),(279,98,2,0,'','','admin','2013-02-28 00:00:00',NULL,NULL),(280,98,3,0,'','','admin','2013-02-28 00:00:00',NULL,NULL),(281,98,4,1,'','','admin','2013-02-28 00:00:00',NULL,NULL),(282,98,5,0,'','','admin','2013-02-28 00:00:00',NULL,NULL),(283,98,6,0,'','','admin','2013-02-28 00:00:00',NULL,NULL),(284,98,7,0,'','','admin','2013-02-28 00:00:00',NULL,NULL),(285,98,8,0,'','','admin','2013-02-28 00:00:00',NULL,NULL),(286,98,9,1,'otro lateral','','admin','2013-02-28 00:00:00',NULL,NULL),(287,98,10,0,'','','admin','2013-02-28 00:00:00',NULL,NULL),(288,98,11,1,'','','admin','2013-02-28 00:00:00',NULL,NULL),(289,98,12,0,'','','admin','2013-02-28 00:00:00',NULL,NULL),(290,99,1,1,'','','admin','2013-02-28 00:00:00',NULL,NULL),(291,99,2,0,'','','admin','2013-02-28 00:00:00',NULL,NULL),(292,99,3,0,'','','admin','2013-02-28 00:00:00',NULL,NULL),(293,99,4,1,'','','admin','2013-02-28 00:00:00',NULL,NULL),(294,99,5,0,'','','admin','2013-02-28 00:00:00',NULL,NULL),(295,99,6,0,'','','admin','2013-02-28 00:00:00',NULL,NULL),(296,99,7,0,'','','admin','2013-02-28 00:00:00',NULL,NULL),(297,99,8,0,'','','admin','2013-02-28 00:00:00',NULL,NULL),(298,99,9,1,'otro lateral','','admin','2013-02-28 00:00:00',NULL,NULL),(299,99,10,0,'','','admin','2013-02-28 00:00:00',NULL,NULL),(300,99,11,1,'','','admin','2013-02-28 00:00:00',NULL,NULL),(301,99,12,0,'','','admin','2013-02-28 00:00:00',NULL,NULL),(302,100,1,1,'','','admin','2013-02-28 00:00:00',NULL,NULL),(303,100,2,0,'','','admin','2013-02-28 00:00:00',NULL,NULL),(304,100,3,0,'','','admin','2013-02-28 00:00:00',NULL,NULL),(305,100,4,1,'','','admin','2013-02-28 00:00:00',NULL,NULL),(306,100,5,0,'','','admin','2013-02-28 00:00:00',NULL,NULL),(307,100,6,0,'','','admin','2013-02-28 00:00:00',NULL,NULL),(308,100,7,0,'','','admin','2013-02-28 00:00:00',NULL,NULL),(309,100,8,0,'','','admin','2013-02-28 00:00:00',NULL,NULL),(310,100,9,1,'otro lateral','','admin','2013-02-28 00:00:00',NULL,NULL),(311,100,10,0,'','','admin','2013-02-28 00:00:00',NULL,NULL),(312,100,11,1,'','','admin','2013-02-28 00:00:00',NULL,NULL),(313,100,12,0,'','','admin','2013-02-28 00:00:00',NULL,NULL),(314,101,1,1,'','','admin','2013-02-28 00:00:00',NULL,NULL),(315,101,2,0,'','','admin','2013-02-28 00:00:00',NULL,NULL),(316,101,3,0,'','','admin','2013-02-28 00:00:00',NULL,NULL),(317,101,4,1,'','','admin','2013-02-28 00:00:00',NULL,NULL),(318,101,5,0,'','','admin','2013-02-28 00:00:00',NULL,NULL),(319,101,6,0,'','','admin','2013-02-28 00:00:00',NULL,NULL),(320,101,7,0,'','','admin','2013-02-28 00:00:00',NULL,NULL),(321,101,8,0,'','','admin','2013-02-28 00:00:00',NULL,NULL),(322,101,9,1,'otro lateral','','admin','2013-02-28 00:00:00',NULL,NULL),(323,101,10,0,'','','admin','2013-02-28 00:00:00',NULL,NULL),(324,101,11,1,'','','admin','2013-02-28 00:00:00',NULL,NULL),(325,101,12,0,'','','admin','2013-02-28 00:00:00',NULL,NULL),(326,102,1,1,'','','admin','2013-02-28 00:00:00',NULL,NULL),(327,102,2,0,'','','admin','2013-02-28 00:00:00',NULL,NULL),(328,102,3,0,'','','admin','2013-02-28 00:00:00',NULL,NULL),(329,102,4,1,'','','admin','2013-02-28 00:00:00',NULL,NULL),(330,102,5,0,'','','admin','2013-02-28 00:00:00',NULL,NULL),(331,102,6,0,'','','admin','2013-02-28 00:00:00',NULL,NULL),(332,102,7,0,'','','admin','2013-02-28 00:00:00',NULL,NULL),(333,102,8,0,'','','admin','2013-02-28 00:00:00',NULL,NULL),(334,102,9,1,'otro lateral','','admin','2013-02-28 00:00:00',NULL,NULL),(335,102,10,0,'','','admin','2013-02-28 00:00:00',NULL,NULL),(336,102,11,1,'','','admin','2013-02-28 00:00:00',NULL,NULL),(337,102,12,0,'','','admin','2013-02-28 00:00:00',NULL,NULL),(338,103,1,1,'','','admin','2013-02-28 00:00:00',NULL,NULL),(339,103,2,0,'','','admin','2013-02-28 00:00:00',NULL,NULL),(340,103,3,0,'','','admin','2013-02-28 00:00:00',NULL,NULL),(341,103,4,1,'','','admin','2013-02-28 00:00:00',NULL,NULL),(342,103,5,0,'','','admin','2013-02-28 00:00:00',NULL,NULL),(343,103,6,0,'','','admin','2013-02-28 00:00:00',NULL,NULL),(344,103,7,0,'','','admin','2013-02-28 00:00:00',NULL,NULL),(345,103,8,0,'','','admin','2013-02-28 00:00:00',NULL,NULL),(346,103,9,1,'otro lateral','','admin','2013-02-28 00:00:00',NULL,NULL),(347,103,10,0,'','','admin','2013-02-28 00:00:00',NULL,NULL),(348,103,11,1,'','','admin','2013-02-28 00:00:00',NULL,NULL),(349,103,12,0,'','','admin','2013-02-28 00:00:00',NULL,NULL),(350,104,1,1,'','','admin','2013-02-28 00:00:00',NULL,NULL),(351,104,2,0,'','','admin','2013-02-28 00:00:00',NULL,NULL),(352,104,3,0,'','','admin','2013-02-28 00:00:00',NULL,NULL),(353,104,4,1,'','','admin','2013-02-28 00:00:00',NULL,NULL),(354,104,5,0,'','','admin','2013-02-28 00:00:00',NULL,NULL),(355,104,6,0,'','','admin','2013-02-28 00:00:00',NULL,NULL),(356,104,7,0,'','','admin','2013-02-28 00:00:00',NULL,NULL),(357,104,8,0,'','','admin','2013-02-28 00:00:00',NULL,NULL),(358,104,9,1,'otro lateral','','admin','2013-02-28 00:00:00',NULL,NULL),(359,104,10,0,'','','admin','2013-02-28 00:00:00',NULL,NULL),(360,104,11,1,'','','admin','2013-02-28 00:00:00',NULL,NULL),(361,104,12,0,'','','admin','2013-02-28 00:00:00',NULL,NULL),(362,105,1,1,'','','admin','2013-02-28 00:00:00',NULL,NULL),(363,105,2,0,'','','admin','2013-02-28 00:00:00',NULL,NULL),(364,105,3,0,'','','admin','2013-02-28 00:00:00',NULL,NULL),(365,105,4,1,'','','admin','2013-02-28 00:00:00',NULL,NULL),(366,105,5,0,'','','admin','2013-02-28 00:00:00',NULL,NULL),(367,105,6,0,'','','admin','2013-02-28 00:00:00',NULL,NULL),(368,105,7,0,'','','admin','2013-02-28 00:00:00',NULL,NULL),(369,105,8,0,'','','admin','2013-02-28 00:00:00',NULL,NULL),(370,105,9,1,'otro lateral','','admin','2013-02-28 00:00:00',NULL,NULL),(371,105,10,0,'','','admin','2013-02-28 00:00:00',NULL,NULL),(372,105,11,1,'','','admin','2013-02-28 00:00:00',NULL,NULL),(373,105,12,0,'','','admin','2013-02-28 00:00:00',NULL,NULL),(374,106,1,1,'','','admin','2013-02-28 00:00:00',NULL,NULL),(375,106,2,0,'','','admin','2013-02-28 00:00:00',NULL,NULL),(376,106,3,0,'','','admin','2013-02-28 00:00:00',NULL,NULL),(377,106,4,1,'','','admin','2013-02-28 00:00:00',NULL,NULL),(378,106,5,0,'','','admin','2013-02-28 00:00:00',NULL,NULL),(379,106,6,0,'','','admin','2013-02-28 00:00:00',NULL,NULL),(380,106,7,0,'','','admin','2013-02-28 00:00:00',NULL,NULL),(381,106,8,0,'','','admin','2013-02-28 00:00:00',NULL,NULL),(382,106,9,1,'otro lateral','','admin','2013-02-28 00:00:00',NULL,NULL),(383,106,10,0,'','','admin','2013-02-28 00:00:00',NULL,NULL),(384,106,11,1,'','','admin','2013-02-28 00:00:00',NULL,NULL),(385,106,12,0,'','','admin','2013-02-28 00:00:00',NULL,NULL),(386,107,1,1,'','','admin','2013-02-28 00:00:00',NULL,NULL),(387,107,2,0,'','','admin','2013-02-28 00:00:00',NULL,NULL),(388,107,3,0,'','','admin','2013-02-28 00:00:00',NULL,NULL),(389,107,4,1,'','','admin','2013-02-28 00:00:00',NULL,NULL),(390,107,5,0,'','','admin','2013-02-28 00:00:00',NULL,NULL),(391,107,6,0,'','','admin','2013-02-28 00:00:00',NULL,NULL),(392,107,7,0,'','','admin','2013-02-28 00:00:00',NULL,NULL),(393,107,8,0,'','','admin','2013-02-28 00:00:00',NULL,NULL),(394,107,9,1,'otro lateral','','admin','2013-02-28 00:00:00',NULL,NULL),(395,107,10,0,'','','admin','2013-02-28 00:00:00',NULL,NULL),(396,107,11,1,'','','admin','2013-02-28 00:00:00',NULL,NULL),(397,107,12,0,'','','admin','2013-02-28 00:00:00',NULL,NULL),(398,108,1,1,'','','admin','2013-02-28 00:00:00',NULL,NULL),(399,108,2,0,'','','admin','2013-02-28 00:00:00',NULL,NULL),(400,108,3,0,'','','admin','2013-02-28 00:00:00',NULL,NULL),(401,108,4,1,'','','admin','2013-02-28 00:00:00',NULL,NULL),(402,108,5,0,'','','admin','2013-02-28 00:00:00',NULL,NULL),(403,108,6,0,'','','admin','2013-02-28 00:00:00',NULL,NULL),(404,108,7,0,'','','admin','2013-02-28 00:00:00',NULL,NULL),(405,108,8,0,'','','admin','2013-02-28 00:00:00',NULL,NULL),(406,108,9,1,'otro lateral','','admin','2013-02-28 00:00:00',NULL,NULL),(407,108,10,0,'','','admin','2013-02-28 00:00:00',NULL,NULL),(408,108,11,1,'','','admin','2013-02-28 00:00:00',NULL,NULL),(409,108,12,0,'','','admin','2013-02-28 00:00:00',NULL,NULL),(410,109,1,1,'','','admin','2013-02-28 00:00:00',NULL,NULL),(411,109,2,0,'','','admin','2013-02-28 00:00:00',NULL,NULL),(412,109,3,0,'','','admin','2013-02-28 00:00:00',NULL,NULL),(413,109,4,1,'','','admin','2013-02-28 00:00:00',NULL,NULL),(414,109,5,0,'','','admin','2013-02-28 00:00:00',NULL,NULL),(415,109,6,0,'','','admin','2013-02-28 00:00:00',NULL,NULL),(416,109,7,0,'','','admin','2013-02-28 00:00:00',NULL,NULL),(417,109,8,0,'','','admin','2013-02-28 00:00:00',NULL,NULL),(418,109,9,1,'otro lateral','','admin','2013-02-28 00:00:00',NULL,NULL),(419,109,10,0,'','','admin','2013-02-28 00:00:00',NULL,NULL),(420,109,11,1,'','','admin','2013-02-28 00:00:00',NULL,NULL),(421,109,12,0,'','','admin','2013-02-28 00:00:00',NULL,NULL),(422,110,1,1,'','','admin','2013-02-28 00:00:00',NULL,NULL),(423,110,2,0,'','','admin','2013-02-28 00:00:00',NULL,NULL),(424,110,3,0,'','','admin','2013-02-28 00:00:00',NULL,NULL),(425,110,4,1,'','','admin','2013-02-28 00:00:00',NULL,NULL),(426,110,5,0,'','','admin','2013-02-28 00:00:00',NULL,NULL),(427,110,6,0,'','','admin','2013-02-28 00:00:00',NULL,NULL),(428,110,7,0,'','','admin','2013-02-28 00:00:00',NULL,NULL),(429,110,8,0,'','','admin','2013-02-28 00:00:00',NULL,NULL),(430,110,9,1,'otro lateral','','admin','2013-02-28 00:00:00',NULL,NULL),(431,110,10,0,'','','admin','2013-02-28 00:00:00',NULL,NULL),(432,110,11,1,'','','admin','2013-02-28 00:00:00',NULL,NULL),(433,110,12,0,'','','admin','2013-02-28 00:00:00',NULL,NULL),(434,111,1,1,'','','admin','2013-02-28 00:00:00',NULL,NULL),(435,111,2,0,'','','admin','2013-02-28 00:00:00',NULL,NULL),(436,111,3,0,'','','admin','2013-02-28 00:00:00',NULL,NULL),(437,111,4,1,'','','admin','2013-02-28 00:00:00',NULL,NULL),(438,111,5,0,'','','admin','2013-02-28 00:00:00',NULL,NULL),(439,111,6,0,'','','admin','2013-02-28 00:00:00',NULL,NULL),(440,111,7,0,'','','admin','2013-02-28 00:00:00',NULL,NULL),(441,111,8,0,'','','admin','2013-02-28 00:00:00',NULL,NULL),(442,111,9,1,'otro lateral','','admin','2013-02-28 00:00:00',NULL,NULL),(443,111,10,0,'','','admin','2013-02-28 00:00:00',NULL,NULL),(444,111,11,1,'','','admin','2013-02-28 00:00:00',NULL,NULL),(445,111,12,0,'','','admin','2013-02-28 00:00:00',NULL,NULL),(446,112,1,1,'','','admin','2013-02-28 00:00:00',NULL,NULL),(447,112,2,0,'','','admin','2013-02-28 00:00:00',NULL,NULL),(448,112,3,0,'','','admin','2013-02-28 00:00:00',NULL,NULL),(449,112,4,1,'','','admin','2013-02-28 00:00:00',NULL,NULL),(450,112,5,0,'','','admin','2013-02-28 00:00:00',NULL,NULL),(451,112,6,0,'','','admin','2013-02-28 00:00:00',NULL,NULL),(452,112,7,0,'','','admin','2013-02-28 00:00:00',NULL,NULL),(453,112,8,0,'','','admin','2013-02-28 00:00:00',NULL,NULL),(454,112,9,1,'otro lateral','','admin','2013-02-28 00:00:00',NULL,NULL),(455,112,10,0,'','','admin','2013-02-28 00:00:00',NULL,NULL),(456,112,11,1,'','','admin','2013-02-28 00:00:00',NULL,NULL),(457,112,12,0,'','','admin','2013-02-28 00:00:00',NULL,NULL),(458,113,1,1,'','','admin','2013-02-28 00:00:00',NULL,NULL),(459,113,2,0,'','','admin','2013-02-28 00:00:00',NULL,NULL),(460,113,3,0,'','','admin','2013-02-28 00:00:00',NULL,NULL),(461,113,4,1,'','','admin','2013-02-28 00:00:00',NULL,NULL),(462,113,5,0,'','','admin','2013-02-28 00:00:00',NULL,NULL),(463,113,6,0,'','','admin','2013-02-28 00:00:00',NULL,NULL),(464,113,7,0,'','','admin','2013-02-28 00:00:00',NULL,NULL),(465,113,8,0,'','','admin','2013-02-28 00:00:00',NULL,NULL),(466,113,9,1,'otro lateral','','admin','2013-02-28 00:00:00',NULL,NULL),(467,113,10,0,'','','admin','2013-02-28 00:00:00',NULL,NULL),(468,113,11,1,'','','admin','2013-02-28 00:00:00',NULL,NULL),(469,113,12,0,'','','admin','2013-02-28 00:00:00',NULL,NULL),(470,114,1,1,'','','admin','2013-02-28 00:00:00',NULL,NULL),(471,114,2,0,'','','admin','2013-02-28 00:00:00',NULL,NULL),(472,114,3,0,'','','admin','2013-02-28 00:00:00',NULL,NULL),(473,114,4,1,'','','admin','2013-02-28 00:00:00',NULL,NULL),(474,114,5,0,'','','admin','2013-02-28 00:00:00',NULL,NULL),(475,114,6,0,'','','admin','2013-02-28 00:00:00',NULL,NULL),(476,114,7,0,'','','admin','2013-02-28 00:00:00',NULL,NULL),(477,114,8,0,'','','admin','2013-02-28 00:00:00',NULL,NULL),(478,114,9,1,'otro lateral','','admin','2013-02-28 00:00:00',NULL,NULL),(479,114,10,0,'','','admin','2013-02-28 00:00:00',NULL,NULL),(480,114,11,1,'','','admin','2013-02-28 00:00:00',NULL,NULL),(481,114,12,0,'','','admin','2013-02-28 00:00:00',NULL,NULL),(482,115,1,1,'','','admin','2013-02-28 00:00:00',NULL,NULL),(483,115,2,0,'','','admin','2013-02-28 00:00:00',NULL,NULL),(484,115,3,0,'','','admin','2013-02-28 00:00:00',NULL,NULL),(485,115,4,1,'','','admin','2013-02-28 00:00:00',NULL,NULL),(486,115,5,0,'','','admin','2013-02-28 00:00:00',NULL,NULL),(487,115,6,0,'','','admin','2013-02-28 00:00:00',NULL,NULL),(488,115,7,0,'','','admin','2013-02-28 00:00:00',NULL,NULL),(489,115,8,0,'','','admin','2013-02-28 00:00:00',NULL,NULL),(490,115,9,1,'otro lateral','','admin','2013-02-28 00:00:00',NULL,NULL),(491,115,10,0,'','','admin','2013-02-28 00:00:00',NULL,NULL),(492,115,11,1,'','','admin','2013-02-28 00:00:00',NULL,NULL),(493,115,12,0,'','','admin','2013-02-28 00:00:00',NULL,NULL),(494,116,1,1,'','','admin','2013-02-28 00:00:00',NULL,NULL),(495,116,2,0,'','','admin','2013-02-28 00:00:00',NULL,NULL),(496,116,3,0,'','','admin','2013-02-28 00:00:00',NULL,NULL),(497,116,4,1,'','','admin','2013-02-28 00:00:00',NULL,NULL),(498,116,5,0,'','','admin','2013-02-28 00:00:00',NULL,NULL),(499,116,6,0,'','','admin','2013-02-28 00:00:00',NULL,NULL),(500,116,7,0,'','','admin','2013-02-28 00:00:00',NULL,NULL),(501,116,8,0,'','','admin','2013-02-28 00:00:00',NULL,NULL),(502,116,9,1,'otro lateral','','admin','2013-02-28 00:00:00',NULL,NULL),(503,116,10,0,'','','admin','2013-02-28 00:00:00',NULL,NULL),(504,116,11,1,'','','admin','2013-02-28 00:00:00',NULL,NULL),(505,116,12,0,'','','admin','2013-02-28 00:00:00',NULL,NULL),(506,117,1,1,'','','admin','2013-02-28 00:00:00',NULL,NULL),(507,117,2,0,'','','admin','2013-02-28 00:00:00',NULL,NULL),(508,117,3,0,'','','admin','2013-02-28 00:00:00',NULL,NULL),(509,117,4,1,'','','admin','2013-02-28 00:00:00',NULL,NULL),(510,117,5,0,'','','admin','2013-02-28 00:00:00',NULL,NULL),(511,117,6,0,'','','admin','2013-02-28 00:00:00',NULL,NULL),(512,117,7,0,'','','admin','2013-02-28 00:00:00',NULL,NULL),(513,117,8,0,'','','admin','2013-02-28 00:00:00',NULL,NULL),(514,117,9,1,'otro lateral','','admin','2013-02-28 00:00:00',NULL,NULL),(515,117,10,0,'','','admin','2013-02-28 00:00:00',NULL,NULL),(516,117,11,1,'','','admin','2013-02-28 00:00:00',NULL,NULL),(517,117,12,0,'','','admin','2013-02-28 00:00:00',NULL,NULL),(518,118,1,1,'','','admin','2013-02-28 00:00:00',NULL,NULL),(519,118,2,0,'','','admin','2013-02-28 00:00:00',NULL,NULL),(520,118,3,0,'','','admin','2013-02-28 00:00:00',NULL,NULL),(521,118,4,1,'','','admin','2013-02-28 00:00:00',NULL,NULL),(522,118,5,0,'','','admin','2013-02-28 00:00:00',NULL,NULL),(523,118,6,0,'','','admin','2013-02-28 00:00:00',NULL,NULL),(524,118,7,0,'','','admin','2013-02-28 00:00:00',NULL,NULL),(525,118,8,0,'','','admin','2013-02-28 00:00:00',NULL,NULL),(526,118,9,1,'otro lateral','','admin','2013-02-28 00:00:00',NULL,NULL),(527,118,10,0,'','','admin','2013-02-28 00:00:00',NULL,NULL),(528,118,11,1,'','','admin','2013-02-28 00:00:00',NULL,NULL),(529,118,12,0,'','','admin','2013-02-28 00:00:00',NULL,NULL),(530,119,1,1,'','','admin','2013-02-28 00:00:00',NULL,NULL),(531,119,2,0,'','','admin','2013-02-28 00:00:00',NULL,NULL),(532,119,3,0,'','','admin','2013-02-28 00:00:00',NULL,NULL),(533,119,4,1,'','','admin','2013-02-28 00:00:00',NULL,NULL),(534,119,5,0,'','','admin','2013-02-28 00:00:00',NULL,NULL),(535,119,6,0,'','','admin','2013-02-28 00:00:00',NULL,NULL),(536,119,7,0,'','','admin','2013-02-28 00:00:00',NULL,NULL),(537,119,8,0,'','','admin','2013-02-28 00:00:00',NULL,NULL),(538,119,9,1,'otro lateral','','admin','2013-02-28 00:00:00',NULL,NULL),(539,119,10,0,'','','admin','2013-02-28 00:00:00',NULL,NULL),(540,119,11,1,'','','admin','2013-02-28 00:00:00',NULL,NULL),(541,119,12,0,'','','admin','2013-02-28 00:00:00',NULL,NULL),(542,120,1,1,'','','admin','2013-02-28 00:00:00',NULL,NULL),(543,120,2,0,'','','admin','2013-02-28 00:00:00',NULL,NULL),(544,120,3,0,'','','admin','2013-02-28 00:00:00',NULL,NULL),(545,120,4,1,'','','admin','2013-02-28 00:00:00',NULL,NULL),(546,120,5,0,'','','admin','2013-02-28 00:00:00',NULL,NULL),(547,120,6,0,'','','admin','2013-02-28 00:00:00',NULL,NULL),(548,120,7,0,'','','admin','2013-02-28 00:00:00',NULL,NULL),(549,120,8,0,'','','admin','2013-02-28 00:00:00',NULL,NULL),(550,120,9,1,'otro lateral','','admin','2013-02-28 00:00:00',NULL,NULL),(551,120,10,0,'','','admin','2013-02-28 00:00:00',NULL,NULL),(552,120,11,1,'','','admin','2013-02-28 00:00:00',NULL,NULL),(553,120,12,0,'','','admin','2013-02-28 00:00:00',NULL,NULL),(554,121,1,1,'','','admin','2013-02-28 00:00:00',NULL,NULL),(555,121,2,0,'','','admin','2013-02-28 00:00:00',NULL,NULL),(556,121,3,0,'','','admin','2013-02-28 00:00:00',NULL,NULL),(557,121,4,1,'','','admin','2013-02-28 00:00:00',NULL,NULL),(558,121,5,0,'','','admin','2013-02-28 00:00:00',NULL,NULL),(559,121,6,0,'','','admin','2013-02-28 00:00:00',NULL,NULL),(560,121,7,0,'','','admin','2013-02-28 00:00:00',NULL,NULL),(561,121,8,0,'','','admin','2013-02-28 00:00:00',NULL,NULL),(562,121,9,1,'otro lateral','','admin','2013-02-28 00:00:00',NULL,NULL),(563,121,10,0,'','','admin','2013-02-28 00:00:00',NULL,NULL),(564,121,11,1,'','','admin','2013-02-28 00:00:00',NULL,NULL),(565,121,12,0,'','','admin','2013-02-28 00:00:00',NULL,NULL),(566,122,1,1,'','','admin','2013-02-28 00:00:00',NULL,NULL),(567,122,2,0,'','','admin','2013-02-28 00:00:00',NULL,NULL),(568,122,3,0,'','','admin','2013-02-28 00:00:00',NULL,NULL),(569,122,4,1,'','','admin','2013-02-28 00:00:00',NULL,NULL),(570,122,5,0,'','','admin','2013-02-28 00:00:00',NULL,NULL),(571,122,6,0,'','','admin','2013-02-28 00:00:00',NULL,NULL),(572,122,7,0,'','','admin','2013-02-28 00:00:00',NULL,NULL),(573,122,8,0,'','','admin','2013-02-28 00:00:00',NULL,NULL),(574,122,9,1,'otro lateral','','admin','2013-02-28 00:00:00',NULL,NULL),(575,122,10,0,'','','admin','2013-02-28 00:00:00',NULL,NULL),(576,122,11,1,'','','admin','2013-02-28 00:00:00',NULL,NULL),(577,122,12,0,'','','admin','2013-02-28 00:00:00',NULL,NULL),(578,123,1,1,'','','admin','2013-02-28 00:00:00',NULL,NULL),(579,123,2,0,'','','admin','2013-02-28 00:00:00',NULL,NULL),(580,123,3,0,'','','admin','2013-02-28 00:00:00',NULL,NULL),(581,123,4,1,'','','admin','2013-02-28 00:00:00',NULL,NULL),(582,123,5,0,'','','admin','2013-02-28 00:00:00',NULL,NULL),(583,123,6,0,'','','admin','2013-02-28 00:00:00',NULL,NULL),(584,123,7,0,'','','admin','2013-02-28 00:00:00',NULL,NULL),(585,123,8,0,'','','admin','2013-02-28 00:00:00',NULL,NULL),(586,123,9,1,'otro lateral','','admin','2013-02-28 00:00:00',NULL,NULL),(587,123,10,0,'','','admin','2013-02-28 00:00:00',NULL,NULL),(588,123,11,1,'','','admin','2013-02-28 00:00:00',NULL,NULL),(589,123,12,0,'','','admin','2013-02-28 00:00:00',NULL,NULL),(590,124,1,1,'','','admin','2013-02-28 00:00:00',NULL,NULL),(591,124,2,0,'','','admin','2013-02-28 00:00:00',NULL,NULL),(592,124,3,0,'','','admin','2013-02-28 00:00:00',NULL,NULL),(593,124,4,1,'','','admin','2013-02-28 00:00:00',NULL,NULL),(594,124,5,0,'','','admin','2013-02-28 00:00:00',NULL,NULL),(595,124,6,0,'','','admin','2013-02-28 00:00:00',NULL,NULL),(596,124,7,0,'','','admin','2013-02-28 00:00:00',NULL,NULL),(597,124,8,0,'','','admin','2013-02-28 00:00:00',NULL,NULL),(598,124,9,1,'otro lateral','','admin','2013-02-28 00:00:00',NULL,NULL),(599,124,10,0,'','','admin','2013-02-28 00:00:00',NULL,NULL),(600,124,11,1,'','','admin','2013-02-28 00:00:00',NULL,NULL),(601,124,12,0,'','','admin','2013-02-28 00:00:00',NULL,NULL),(602,125,1,1,'','','admin','2013-02-28 00:00:00',NULL,NULL),(603,125,2,0,'','','admin','2013-02-28 00:00:00',NULL,NULL),(604,125,3,0,'','','admin','2013-02-28 00:00:00',NULL,NULL),(605,125,4,1,'','','admin','2013-02-28 00:00:00',NULL,NULL),(606,125,5,0,'','','admin','2013-02-28 00:00:00',NULL,NULL),(607,125,6,0,'','','admin','2013-02-28 00:00:00',NULL,NULL),(608,125,7,0,'','','admin','2013-02-28 00:00:00',NULL,NULL),(609,125,8,0,'','','admin','2013-02-28 00:00:00',NULL,NULL),(610,125,9,1,'otro lateral','','admin','2013-02-28 00:00:00',NULL,NULL),(611,125,10,0,'','','admin','2013-02-28 00:00:00',NULL,NULL),(612,125,11,1,'','','admin','2013-02-28 00:00:00',NULL,NULL),(613,125,12,0,'','','admin','2013-02-28 00:00:00',NULL,NULL),(614,126,1,1,'','','admin','2013-02-28 00:00:00',NULL,NULL),(615,126,2,0,'','','admin','2013-02-28 00:00:00',NULL,NULL),(616,126,3,0,'','','admin','2013-02-28 00:00:00',NULL,NULL),(617,126,4,1,'','','admin','2013-02-28 00:00:00',NULL,NULL),(618,126,5,0,'','','admin','2013-02-28 00:00:00',NULL,NULL),(619,126,6,0,'','','admin','2013-02-28 00:00:00',NULL,NULL),(620,126,7,0,'','','admin','2013-02-28 00:00:00',NULL,NULL),(621,126,8,0,'','','admin','2013-02-28 00:00:00',NULL,NULL),(622,126,9,1,'otro lateral','','admin','2013-02-28 00:00:00',NULL,NULL),(623,126,10,0,'','','admin','2013-02-28 00:00:00',NULL,NULL),(624,126,11,1,'','','admin','2013-02-28 00:00:00',NULL,NULL),(625,126,12,0,'','','admin','2013-02-28 00:00:00',NULL,NULL),(626,127,1,1,'','','admin','2013-02-28 00:00:00',NULL,NULL),(627,127,2,0,'','','admin','2013-02-28 00:00:00',NULL,NULL),(628,127,3,0,'','','admin','2013-02-28 00:00:00',NULL,NULL),(629,127,4,1,'','','admin','2013-02-28 00:00:00',NULL,NULL),(630,127,5,0,'','','admin','2013-02-28 00:00:00',NULL,NULL),(631,127,6,0,'','','admin','2013-02-28 00:00:00',NULL,NULL),(632,127,7,0,'','','admin','2013-02-28 00:00:00',NULL,NULL),(633,127,8,0,'','','admin','2013-02-28 00:00:00',NULL,NULL),(634,127,9,1,'otro lateral','','admin','2013-02-28 00:00:00',NULL,NULL),(635,127,10,0,'','','admin','2013-02-28 00:00:00',NULL,NULL),(636,127,11,1,'','','admin','2013-02-28 00:00:00',NULL,NULL),(637,127,12,0,'','','admin','2013-02-28 00:00:00',NULL,NULL),(638,128,1,1,'','','admin','2013-02-28 00:00:00',NULL,NULL),(639,128,2,0,'','','admin','2013-02-28 00:00:00',NULL,NULL),(640,128,3,0,'','','admin','2013-02-28 00:00:00',NULL,NULL),(641,128,4,1,'','','admin','2013-02-28 00:00:00',NULL,NULL),(642,128,5,0,'','','admin','2013-02-28 00:00:00',NULL,NULL),(643,128,6,0,'','','admin','2013-02-28 00:00:00',NULL,NULL),(644,128,7,0,'','','admin','2013-02-28 00:00:00',NULL,NULL),(645,128,8,0,'','','admin','2013-02-28 00:00:00',NULL,NULL),(646,128,9,1,'otro lateral','','admin','2013-02-28 00:00:00',NULL,NULL),(647,128,10,0,'','','admin','2013-02-28 00:00:00',NULL,NULL),(648,128,11,1,'','','admin','2013-02-28 00:00:00',NULL,NULL),(649,128,12,0,'','','admin','2013-02-28 00:00:00',NULL,NULL),(650,129,1,1,'','','admin','2013-02-28 00:00:00',NULL,NULL),(651,129,2,0,'','','admin','2013-02-28 00:00:00',NULL,NULL),(652,129,3,0,'','','admin','2013-02-28 00:00:00',NULL,NULL),(653,129,4,1,'','','admin','2013-02-28 00:00:00',NULL,NULL),(654,129,5,0,'','','admin','2013-02-28 00:00:00',NULL,NULL),(655,129,6,0,'','','admin','2013-02-28 00:00:00',NULL,NULL),(656,129,7,0,'','','admin','2013-02-28 00:00:00',NULL,NULL),(657,129,8,0,'','','admin','2013-02-28 00:00:00',NULL,NULL),(658,129,9,1,'otro lateral','','admin','2013-02-28 00:00:00',NULL,NULL),(659,129,10,0,'','','admin','2013-02-28 00:00:00',NULL,NULL),(660,129,11,1,'','','admin','2013-02-28 00:00:00',NULL,NULL),(661,129,12,0,'','','admin','2013-02-28 00:00:00',NULL,NULL),(662,130,1,1,'','','admin','2013-02-28 00:00:00',NULL,NULL),(663,130,2,0,'','','admin','2013-02-28 00:00:00',NULL,NULL),(664,130,3,0,'','','admin','2013-02-28 00:00:00',NULL,NULL),(665,130,4,1,'','','admin','2013-02-28 00:00:00',NULL,NULL),(666,130,5,0,'','','admin','2013-02-28 00:00:00',NULL,NULL),(667,130,6,0,'','','admin','2013-02-28 00:00:00',NULL,NULL),(668,130,7,0,'','','admin','2013-02-28 00:00:00',NULL,NULL),(669,130,8,0,'','','admin','2013-02-28 00:00:00',NULL,NULL),(670,130,9,1,'otro lateral','','admin','2013-02-28 00:00:00',NULL,NULL),(671,130,10,0,'','','admin','2013-02-28 00:00:00',NULL,NULL),(672,130,11,1,'','','admin','2013-02-28 00:00:00',NULL,NULL),(673,130,12,0,'','','admin','2013-02-28 00:00:00',NULL,NULL),(674,131,1,1,'','','admin','2013-02-28 00:00:00',NULL,NULL),(675,131,2,0,'','','admin','2013-02-28 00:00:00',NULL,NULL),(676,131,3,0,'','','admin','2013-02-28 00:00:00',NULL,NULL),(677,131,4,1,'','','admin','2013-02-28 00:00:00',NULL,NULL),(678,131,5,0,'','','admin','2013-02-28 00:00:00',NULL,NULL),(679,131,6,0,'','','admin','2013-02-28 00:00:00',NULL,NULL),(680,131,7,0,'','','admin','2013-02-28 00:00:00',NULL,NULL),(681,131,8,0,'','','admin','2013-02-28 00:00:00',NULL,NULL),(682,131,9,1,'otro lateral','','admin','2013-02-28 00:00:00',NULL,NULL),(683,131,10,0,'','','admin','2013-02-28 00:00:00',NULL,NULL),(684,131,11,1,'','','admin','2013-02-28 00:00:00',NULL,NULL),(685,131,12,0,'','','admin','2013-02-28 00:00:00',NULL,NULL),(686,132,1,1,'','','admin','2013-02-28 00:00:00',NULL,NULL),(687,132,2,0,'','','admin','2013-02-28 00:00:00',NULL,NULL),(688,132,3,0,'','','admin','2013-02-28 00:00:00',NULL,NULL),(689,132,4,1,'','','admin','2013-02-28 00:00:00',NULL,NULL),(690,132,5,0,'','','admin','2013-02-28 00:00:00',NULL,NULL),(691,132,6,0,'','','admin','2013-02-28 00:00:00',NULL,NULL),(692,132,7,0,'','','admin','2013-02-28 00:00:00',NULL,NULL),(693,132,8,0,'','','admin','2013-02-28 00:00:00',NULL,NULL),(694,132,9,1,'otro lateral','','admin','2013-02-28 00:00:00',NULL,NULL),(695,132,10,0,'','','admin','2013-02-28 00:00:00',NULL,NULL),(696,132,11,1,'','','admin','2013-02-28 00:00:00',NULL,NULL),(697,132,12,0,'','','admin','2013-02-28 00:00:00',NULL,NULL),(698,133,1,1,'','','admin','2013-02-28 00:00:00',NULL,NULL),(699,133,2,0,'','','admin','2013-02-28 00:00:00',NULL,NULL),(700,133,3,0,'','','admin','2013-02-28 00:00:00',NULL,NULL),(701,133,4,1,'','','admin','2013-02-28 00:00:00',NULL,NULL),(702,133,5,0,'','','admin','2013-02-28 00:00:00',NULL,NULL),(703,133,6,0,'','','admin','2013-02-28 00:00:00',NULL,NULL),(704,133,7,0,'','','admin','2013-02-28 00:00:00',NULL,NULL),(705,133,8,0,'','','admin','2013-02-28 00:00:00',NULL,NULL),(706,133,9,1,'otro lateral','','admin','2013-02-28 00:00:00',NULL,NULL),(707,133,10,0,'','','admin','2013-02-28 00:00:00',NULL,NULL),(708,133,11,1,'','','admin','2013-02-28 00:00:00',NULL,NULL),(709,133,12,0,'','','admin','2013-02-28 00:00:00',NULL,NULL),(710,134,1,1,'','','admin','2013-02-28 00:00:00',NULL,NULL),(711,134,2,0,'','','admin','2013-02-28 00:00:00',NULL,NULL),(712,134,3,0,'','','admin','2013-02-28 00:00:00',NULL,NULL),(713,134,4,1,'','','admin','2013-02-28 00:00:00',NULL,NULL),(714,134,5,0,'','','admin','2013-02-28 00:00:00',NULL,NULL),(715,134,6,0,'','','admin','2013-02-28 00:00:00',NULL,NULL),(716,134,7,0,'','','admin','2013-02-28 00:00:00',NULL,NULL),(717,134,8,0,'','','admin','2013-02-28 00:00:00',NULL,NULL),(718,134,9,1,'otro lateral','','admin','2013-02-28 00:00:00',NULL,NULL),(719,134,10,0,'','','admin','2013-02-28 00:00:00',NULL,NULL),(720,134,11,1,'','','admin','2013-02-28 00:00:00',NULL,NULL),(721,134,12,0,'','','admin','2013-02-28 00:00:00',NULL,NULL),(722,135,1,1,'','','admin','2013-02-28 00:00:00',NULL,NULL),(723,135,2,0,'','','admin','2013-02-28 00:00:00',NULL,NULL),(724,135,3,0,'','','admin','2013-02-28 00:00:00',NULL,NULL),(725,135,4,1,'','','admin','2013-02-28 00:00:00',NULL,NULL),(726,135,5,0,'','','admin','2013-02-28 00:00:00',NULL,NULL),(727,135,6,0,'','','admin','2013-02-28 00:00:00',NULL,NULL),(728,135,7,0,'','','admin','2013-02-28 00:00:00',NULL,NULL),(729,135,8,0,'','','admin','2013-02-28 00:00:00',NULL,NULL),(730,135,9,1,'otro lateral','','admin','2013-02-28 00:00:00',NULL,NULL),(731,135,10,0,'','','admin','2013-02-28 00:00:00',NULL,NULL),(732,135,11,1,'','','admin','2013-02-28 00:00:00',NULL,NULL),(733,135,12,0,'','','admin','2013-02-28 00:00:00',NULL,NULL),(734,136,1,1,'','','admin','2013-02-28 00:00:00',NULL,NULL),(735,136,2,0,'','','admin','2013-02-28 00:00:00',NULL,NULL),(736,136,3,0,'','','admin','2013-02-28 00:00:00',NULL,NULL),(737,136,4,1,'','','admin','2013-02-28 00:00:00',NULL,NULL),(738,136,5,0,'','','admin','2013-02-28 00:00:00',NULL,NULL),(739,136,6,0,'','','admin','2013-02-28 00:00:00',NULL,NULL),(740,136,7,0,'','','admin','2013-02-28 00:00:00',NULL,NULL),(741,136,8,0,'','','admin','2013-02-28 00:00:00',NULL,NULL),(742,136,9,1,'otro lateral','','admin','2013-02-28 00:00:00',NULL,NULL),(743,136,10,0,'','','admin','2013-02-28 00:00:00',NULL,NULL),(744,136,11,1,'','','admin','2013-02-28 00:00:00',NULL,NULL),(745,136,12,0,'','','admin','2013-02-28 00:00:00',NULL,NULL),(746,137,1,1,'','','admin','2013-02-28 00:00:00',NULL,NULL),(747,137,2,0,'','','admin','2013-02-28 00:00:00',NULL,NULL),(748,137,3,0,'','','admin','2013-02-28 00:00:00',NULL,NULL),(749,137,4,1,'','','admin','2013-02-28 00:00:00',NULL,NULL),(750,137,5,0,'','','admin','2013-02-28 00:00:00',NULL,NULL),(751,137,6,0,'','','admin','2013-02-28 00:00:00',NULL,NULL),(752,137,7,0,'','','admin','2013-02-28 00:00:00',NULL,NULL),(753,137,8,0,'','','admin','2013-02-28 00:00:00',NULL,NULL),(754,137,9,1,'otro lateral','','admin','2013-02-28 00:00:00',NULL,NULL),(755,137,10,0,'','','admin','2013-02-28 00:00:00',NULL,NULL),(756,137,11,1,'','','admin','2013-02-28 00:00:00',NULL,NULL),(757,137,12,0,'','','admin','2013-02-28 00:00:00',NULL,NULL),(758,138,1,1,'','','admin','2013-02-28 00:00:00',NULL,NULL),(759,138,2,0,'','','admin','2013-02-28 00:00:00',NULL,NULL),(760,138,3,0,'','','admin','2013-02-28 00:00:00',NULL,NULL),(761,138,4,1,'','','admin','2013-02-28 00:00:00',NULL,NULL),(762,138,5,0,'','','admin','2013-02-28 00:00:00',NULL,NULL),(763,138,6,0,'','','admin','2013-02-28 00:00:00',NULL,NULL),(764,138,7,0,'','','admin','2013-02-28 00:00:00',NULL,NULL),(765,138,8,0,'','','admin','2013-02-28 00:00:00',NULL,NULL),(766,138,9,1,'otro lateral','','admin','2013-02-28 00:00:00',NULL,NULL),(767,138,10,0,'','','admin','2013-02-28 00:00:00',NULL,NULL),(768,138,11,1,'','','admin','2013-02-28 00:00:00',NULL,NULL),(769,138,12,0,'','','admin','2013-02-28 00:00:00',NULL,NULL),(770,139,1,1,'','','admin','2013-02-28 00:00:00',NULL,NULL),(771,139,2,0,'','','admin','2013-02-28 00:00:00',NULL,NULL),(772,139,3,0,'','','admin','2013-02-28 00:00:00',NULL,NULL),(773,139,4,1,'','','admin','2013-02-28 00:00:00',NULL,NULL),(774,139,5,0,'','','admin','2013-02-28 00:00:00',NULL,NULL),(775,139,6,0,'','','admin','2013-02-28 00:00:00',NULL,NULL),(776,139,7,0,'','','admin','2013-02-28 00:00:00',NULL,NULL),(777,139,8,0,'','','admin','2013-02-28 00:00:00',NULL,NULL),(778,139,9,1,'otro lateral','','admin','2013-02-28 00:00:00',NULL,NULL),(779,139,10,0,'','','admin','2013-02-28 00:00:00',NULL,NULL),(780,139,11,1,'','','admin','2013-02-28 00:00:00',NULL,NULL),(781,139,12,0,'','','admin','2013-02-28 00:00:00',NULL,NULL),(782,140,1,1,'','','admin','2013-02-28 00:00:00',NULL,NULL),(783,140,2,0,'','','admin','2013-02-28 00:00:00',NULL,NULL),(784,140,3,0,'','','admin','2013-02-28 00:00:00',NULL,NULL),(785,140,4,1,'','','admin','2013-02-28 00:00:00',NULL,NULL),(786,140,5,0,'','','admin','2013-02-28 00:00:00',NULL,NULL),(787,140,6,0,'','','admin','2013-02-28 00:00:00',NULL,NULL),(788,140,7,0,'','','admin','2013-02-28 00:00:00',NULL,NULL),(789,140,8,0,'','','admin','2013-02-28 00:00:00',NULL,NULL),(790,140,9,1,'otro lateral','','admin','2013-02-28 00:00:00',NULL,NULL),(791,140,10,0,'','','admin','2013-02-28 00:00:00',NULL,NULL),(792,140,11,1,'','','admin','2013-02-28 00:00:00',NULL,NULL),(793,140,12,0,'','','admin','2013-02-28 00:00:00',NULL,NULL),(794,141,1,1,'','','admin','2013-02-28 00:00:00',NULL,NULL),(795,141,2,0,'','','admin','2013-02-28 00:00:00',NULL,NULL),(796,141,3,0,'','','admin','2013-02-28 00:00:00',NULL,NULL),(797,141,4,1,'','','admin','2013-02-28 00:00:00',NULL,NULL),(798,141,5,0,'','','admin','2013-02-28 00:00:00',NULL,NULL),(799,141,6,0,'','','admin','2013-02-28 00:00:00',NULL,NULL),(800,141,7,0,'','','admin','2013-02-28 00:00:00',NULL,NULL),(801,141,8,0,'','','admin','2013-02-28 00:00:00',NULL,NULL),(802,141,9,1,'otro lateral','','admin','2013-02-28 00:00:00',NULL,NULL),(803,141,10,0,'','','admin','2013-02-28 00:00:00',NULL,NULL),(804,141,11,1,'','','admin','2013-02-28 00:00:00',NULL,NULL),(805,141,12,0,'','','admin','2013-02-28 00:00:00',NULL,NULL),(806,142,1,1,'','','admin','2013-02-28 00:00:00',NULL,NULL),(807,142,2,0,'','','admin','2013-02-28 00:00:00',NULL,NULL),(808,142,3,0,'','','admin','2013-02-28 00:00:00',NULL,NULL),(809,142,4,1,'','','admin','2013-02-28 00:00:00',NULL,NULL),(810,142,5,0,'','','admin','2013-02-28 00:00:00',NULL,NULL),(811,142,6,0,'','','admin','2013-02-28 00:00:00',NULL,NULL),(812,142,7,0,'','','admin','2013-02-28 00:00:00',NULL,NULL),(813,142,8,0,'','','admin','2013-02-28 00:00:00',NULL,NULL),(814,142,9,1,'otro lateral','','admin','2013-02-28 00:00:00',NULL,NULL),(815,142,10,0,'','','admin','2013-02-28 00:00:00',NULL,NULL),(816,142,11,1,'','','admin','2013-02-28 00:00:00',NULL,NULL),(817,142,12,0,'','','admin','2013-02-28 00:00:00',NULL,NULL),(818,143,1,1,'','','admin','2013-02-28 00:00:00',NULL,NULL),(819,143,2,0,'','','admin','2013-02-28 00:00:00',NULL,NULL),(820,143,3,0,'','','admin','2013-02-28 00:00:00',NULL,NULL),(821,143,4,1,'','','admin','2013-02-28 00:00:00',NULL,NULL),(822,143,5,0,'','','admin','2013-02-28 00:00:00',NULL,NULL),(823,143,6,0,'','','admin','2013-02-28 00:00:00',NULL,NULL),(824,143,7,0,'','','admin','2013-02-28 00:00:00',NULL,NULL),(825,143,8,0,'','','admin','2013-02-28 00:00:00',NULL,NULL),(826,143,9,1,'otro lateral','','admin','2013-02-28 00:00:00',NULL,NULL),(827,143,10,0,'','','admin','2013-02-28 00:00:00',NULL,NULL),(828,143,11,1,'','','admin','2013-02-28 00:00:00',NULL,NULL),(829,143,12,0,'','','admin','2013-02-28 00:00:00',NULL,NULL),(830,144,1,1,'','','admin','2013-02-28 00:00:00',NULL,NULL),(831,144,2,0,'','','admin','2013-02-28 00:00:00',NULL,NULL),(832,144,3,0,'','','admin','2013-02-28 00:00:00',NULL,NULL),(833,144,4,1,'','','admin','2013-02-28 00:00:00',NULL,NULL),(834,144,5,0,'','','admin','2013-02-28 00:00:00',NULL,NULL),(835,144,6,0,'','','admin','2013-02-28 00:00:00',NULL,NULL),(836,144,7,0,'','','admin','2013-02-28 00:00:00',NULL,NULL),(837,144,8,0,'','','admin','2013-02-28 00:00:00',NULL,NULL),(838,144,9,1,'otro lateral','','admin','2013-02-28 00:00:00',NULL,NULL),(839,144,10,0,'','','admin','2013-02-28 00:00:00',NULL,NULL),(840,144,11,1,'','','admin','2013-02-28 00:00:00',NULL,NULL),(841,144,12,0,'','','admin','2013-02-28 00:00:00',NULL,NULL),(842,145,1,1,'','','admin','2013-02-28 00:00:00',NULL,NULL),(843,145,2,0,'','','admin','2013-02-28 00:00:00',NULL,NULL),(844,145,3,0,'','','admin','2013-02-28 00:00:00',NULL,NULL),(845,145,4,1,'','','admin','2013-02-28 00:00:00',NULL,NULL),(846,145,5,0,'','','admin','2013-02-28 00:00:00',NULL,NULL),(847,145,6,0,'','','admin','2013-02-28 00:00:00',NULL,NULL),(848,145,7,0,'','','admin','2013-02-28 00:00:00',NULL,NULL),(849,145,8,0,'','','admin','2013-02-28 00:00:00',NULL,NULL),(850,145,9,1,'otro lateral','','admin','2013-02-28 00:00:00',NULL,NULL),(851,145,10,0,'','','admin','2013-02-28 00:00:00',NULL,NULL),(852,145,11,1,'','','admin','2013-02-28 00:00:00',NULL,NULL),(853,145,12,0,'','','admin','2013-02-28 00:00:00',NULL,NULL),(854,146,1,1,'','','admin','2013-02-28 00:00:00',NULL,NULL),(855,146,2,0,'','','admin','2013-02-28 00:00:00',NULL,NULL),(856,146,3,0,'','','admin','2013-02-28 00:00:00',NULL,NULL),(857,146,4,1,'','','admin','2013-02-28 00:00:00',NULL,NULL),(858,146,5,0,'','','admin','2013-02-28 00:00:00',NULL,NULL),(859,146,6,0,'','','admin','2013-02-28 00:00:00',NULL,NULL),(860,146,7,0,'','','admin','2013-02-28 00:00:00',NULL,NULL),(861,146,8,0,'','','admin','2013-02-28 00:00:00',NULL,NULL),(862,146,9,1,'otro lateral','','admin','2013-02-28 00:00:00',NULL,NULL),(863,146,10,0,'','','admin','2013-02-28 00:00:00',NULL,NULL),(864,146,11,1,'','','admin','2013-02-28 00:00:00',NULL,NULL),(865,146,12,0,'','','admin','2013-02-28 00:00:00',NULL,NULL),(866,147,1,0,'','','admin','2013-02-28 00:00:00',NULL,NULL),(867,147,2,1,'','','admin','2013-02-28 00:00:00',NULL,NULL),(868,147,3,0,'','','admin','2013-02-28 00:00:00',NULL,NULL),(869,147,4,1,'','','admin','2013-02-28 00:00:00',NULL,NULL),(870,147,5,0,'','','admin','2013-02-28 00:00:00',NULL,NULL),(871,147,6,0,'','','admin','2013-02-28 00:00:00',NULL,NULL),(872,147,7,0,'','','admin','2013-02-28 00:00:00',NULL,NULL),(873,147,8,0,'','','admin','2013-02-28 00:00:00',NULL,NULL),(874,147,9,1,'otro lateral','','admin','2013-02-28 00:00:00',NULL,NULL),(875,147,10,0,'','','admin','2013-02-28 00:00:00',NULL,NULL),(876,147,11,1,'','','admin','2013-02-28 00:00:00',NULL,NULL),(877,147,12,0,'','','admin','2013-02-28 00:00:00',NULL,NULL),(878,148,1,0,'','','admin','2013-02-28 00:00:00',NULL,NULL),(879,148,2,1,'','','admin','2013-02-28 00:00:00',NULL,NULL),(880,148,3,0,'','','admin','2013-02-28 00:00:00',NULL,NULL),(881,148,4,1,'','','admin','2013-02-28 00:00:00',NULL,NULL),(882,148,5,0,'','','admin','2013-02-28 00:00:00',NULL,NULL),(883,148,6,0,'','','admin','2013-02-28 00:00:00',NULL,NULL),(884,148,7,0,'','','admin','2013-02-28 00:00:00',NULL,NULL),(885,148,8,0,'','','admin','2013-02-28 00:00:00',NULL,NULL),(886,148,9,1,'otro lateral','','admin','2013-02-28 00:00:00',NULL,NULL),(887,148,10,0,'','','admin','2013-02-28 00:00:00',NULL,NULL),(888,148,11,1,'','','admin','2013-02-28 00:00:00',NULL,NULL),(889,148,12,0,'','','admin','2013-02-28 00:00:00',NULL,NULL),(890,150,1,1,'','\0','admin','2013-02-28 00:00:00','admin','2013-02-28 00:00:00'),(891,150,2,0,'','\0','admin','2013-02-28 00:00:00','admin','2013-02-28 00:00:00'),(892,150,3,0,'','\0','admin','2013-02-28 00:00:00','admin','2013-02-28 00:00:00'),(893,150,4,1,'','\0','admin','2013-02-28 00:00:00','admin','2013-02-28 00:00:00'),(894,150,5,0,'','\0','admin','2013-02-28 00:00:00','admin','2013-02-28 00:00:00'),(895,150,6,0,'','\0','admin','2013-02-28 00:00:00','admin','2013-02-28 00:00:00'),(896,150,7,0,'','\0','admin','2013-02-28 00:00:00','admin','2013-02-28 00:00:00'),(897,150,8,0,'','\0','admin','2013-02-28 00:00:00','admin','2013-02-28 00:00:00'),(898,150,9,1,'otro lateral','\0','admin','2013-02-28 00:00:00','admin','2013-02-28 00:00:00'),(899,150,10,0,'','\0','admin','2013-02-28 00:00:00','admin','2013-02-28 00:00:00'),(900,150,11,1,'','\0','admin','2013-02-28 00:00:00','admin','2013-02-28 00:00:00'),(901,150,12,0,'','\0','admin','2013-02-28 00:00:00','admin','2013-02-28 00:00:00'),(902,150,1,1,'','','admin','2013-02-28 00:00:00',NULL,NULL),(903,150,2,0,'','','admin','2013-02-28 00:00:00',NULL,NULL),(904,150,3,0,'','','admin','2013-02-28 00:00:00',NULL,NULL),(905,150,4,1,'','','admin','2013-02-28 00:00:00',NULL,NULL),(906,150,5,0,'','','admin','2013-02-28 00:00:00',NULL,NULL),(907,150,6,0,'','','admin','2013-02-28 00:00:00',NULL,NULL),(908,150,7,0,'','','admin','2013-02-28 00:00:00',NULL,NULL),(909,150,8,0,'','','admin','2013-02-28 00:00:00',NULL,NULL),(910,150,9,1,'otro lateral','','admin','2013-02-28 00:00:00',NULL,NULL),(911,150,10,0,'','','admin','2013-02-28 00:00:00',NULL,NULL),(912,150,11,1,'','','admin','2013-02-28 00:00:00',NULL,NULL),(913,150,12,0,'','','admin','2013-02-28 00:00:00',NULL,NULL),(914,151,1,1,'','\0','admin','2013-02-28 00:00:00','admin','2013-02-28 00:00:00'),(915,151,2,0,'','\0','admin','2013-02-28 00:00:00','admin','2013-02-28 00:00:00'),(916,151,3,0,'','\0','admin','2013-02-28 00:00:00','admin','2013-02-28 00:00:00'),(917,151,4,1,'','\0','admin','2013-02-28 00:00:00','admin','2013-02-28 00:00:00'),(918,151,5,0,'','\0','admin','2013-02-28 00:00:00','admin','2013-02-28 00:00:00'),(919,151,6,0,'','\0','admin','2013-02-28 00:00:00','admin','2013-02-28 00:00:00'),(920,151,7,0,'','\0','admin','2013-02-28 00:00:00','admin','2013-02-28 00:00:00'),(921,151,8,0,'','\0','admin','2013-02-28 00:00:00','admin','2013-02-28 00:00:00'),(922,151,9,1,'otro lateral','\0','admin','2013-02-28 00:00:00','admin','2013-02-28 00:00:00'),(923,151,10,0,'','\0','admin','2013-02-28 00:00:00','admin','2013-02-28 00:00:00'),(924,151,11,1,'','\0','admin','2013-02-28 00:00:00','admin','2013-02-28 00:00:00'),(925,151,12,0,'','\0','admin','2013-02-28 00:00:00','admin','2013-02-28 00:00:00'),(926,151,1,1,'','','admin','2013-02-28 00:00:00',NULL,NULL),(927,151,2,0,'','','admin','2013-02-28 00:00:00',NULL,NULL),(928,151,3,0,'','','admin','2013-02-28 00:00:00',NULL,NULL),(929,151,4,1,'','','admin','2013-02-28 00:00:00',NULL,NULL),(930,151,5,0,'','','admin','2013-02-28 00:00:00',NULL,NULL),(931,151,6,0,'','','admin','2013-02-28 00:00:00',NULL,NULL),(932,151,7,0,'','','admin','2013-02-28 00:00:00',NULL,NULL),(933,151,8,0,'','','admin','2013-02-28 00:00:00',NULL,NULL),(934,151,9,1,'otro lateral','','admin','2013-02-28 00:00:00',NULL,NULL),(935,151,10,0,'','','admin','2013-02-28 00:00:00',NULL,NULL),(936,151,11,1,'','','admin','2013-02-28 00:00:00',NULL,NULL),(937,151,12,0,'','','admin','2013-02-28 00:00:00',NULL,NULL),(938,152,1,1,'','','admin','2013-02-28 00:00:00',NULL,NULL),(939,152,2,0,'','','admin','2013-02-28 00:00:00',NULL,NULL),(940,152,3,0,'','','admin','2013-02-28 00:00:00',NULL,NULL),(941,152,4,1,'','','admin','2013-02-28 00:00:00',NULL,NULL),(942,152,5,0,'','','admin','2013-02-28 00:00:00',NULL,NULL),(943,152,6,0,'','','admin','2013-02-28 00:00:00',NULL,NULL),(944,152,7,0,'','','admin','2013-02-28 00:00:00',NULL,NULL),(945,152,8,0,'','','admin','2013-02-28 00:00:00',NULL,NULL),(946,152,9,1,'otro lateral','','admin','2013-02-28 00:00:00',NULL,NULL),(947,152,10,0,'','','admin','2013-02-28 00:00:00',NULL,NULL),(948,152,11,1,'','','admin','2013-02-28 00:00:00',NULL,NULL),(949,152,12,0,'','','admin','2013-02-28 00:00:00',NULL,NULL),(950,153,1,1,'','','admin','2013-02-28 00:00:00',NULL,NULL),(951,153,2,0,'','','admin','2013-02-28 00:00:00',NULL,NULL),(952,153,3,0,'','','admin','2013-02-28 00:00:00',NULL,NULL),(953,153,4,1,'','','admin','2013-02-28 00:00:00',NULL,NULL),(954,153,5,0,'','','admin','2013-02-28 00:00:00',NULL,NULL),(955,153,6,0,'','','admin','2013-02-28 00:00:00',NULL,NULL),(956,153,7,0,'','','admin','2013-02-28 00:00:00',NULL,NULL),(957,153,8,0,'','','admin','2013-02-28 00:00:00',NULL,NULL),(958,153,9,1,'otro lateral','','admin','2013-02-28 00:00:00',NULL,NULL),(959,153,10,0,'','','admin','2013-02-28 00:00:00',NULL,NULL),(960,153,11,1,'','','admin','2013-02-28 00:00:00',NULL,NULL),(961,153,12,0,'','','admin','2013-02-28 00:00:00',NULL,NULL),(962,154,1,1,'','\0','admin','2013-02-28 00:00:00','admin','2013-02-28 00:00:00'),(963,154,2,0,'','\0','admin','2013-02-28 00:00:00','admin','2013-02-28 00:00:00'),(964,154,3,0,'','\0','admin','2013-02-28 00:00:00','admin','2013-02-28 00:00:00'),(965,154,4,1,'','\0','admin','2013-02-28 00:00:00','admin','2013-02-28 00:00:00'),(966,154,5,0,'','\0','admin','2013-02-28 00:00:00','admin','2013-02-28 00:00:00'),(967,154,6,0,'','\0','admin','2013-02-28 00:00:00','admin','2013-02-28 00:00:00'),(968,154,7,0,'','\0','admin','2013-02-28 00:00:00','admin','2013-02-28 00:00:00'),(969,154,8,0,'','\0','admin','2013-02-28 00:00:00','admin','2013-02-28 00:00:00'),(970,154,9,1,'otro lateral','\0','admin','2013-02-28 00:00:00','admin','2013-02-28 00:00:00'),(971,154,10,0,'','\0','admin','2013-02-28 00:00:00','admin','2013-02-28 00:00:00'),(972,154,11,1,'','\0','admin','2013-02-28 00:00:00','admin','2013-02-28 00:00:00'),(973,154,12,0,'','\0','admin','2013-02-28 00:00:00','admin','2013-02-28 00:00:00'),(974,154,1,1,'','','admin','2013-02-28 00:00:00',NULL,NULL),(975,154,2,0,'','','admin','2013-02-28 00:00:00',NULL,NULL),(976,154,3,0,'','','admin','2013-02-28 00:00:00',NULL,NULL),(977,154,4,1,'','','admin','2013-02-28 00:00:00',NULL,NULL),(978,154,5,0,'','','admin','2013-02-28 00:00:00',NULL,NULL),(979,154,6,0,'','','admin','2013-02-28 00:00:00',NULL,NULL),(980,154,7,0,'','','admin','2013-02-28 00:00:00',NULL,NULL),(981,154,8,0,'','','admin','2013-02-28 00:00:00',NULL,NULL),(982,154,9,1,'otro lateral','','admin','2013-02-28 00:00:00',NULL,NULL),(983,154,10,0,'','','admin','2013-02-28 00:00:00',NULL,NULL),(984,154,11,1,'','','admin','2013-02-28 00:00:00',NULL,NULL),(985,154,12,0,'','','admin','2013-02-28 00:00:00',NULL,NULL),(986,155,1,0,'','','admin','2013-03-01 00:00:00',NULL,NULL),(987,155,2,0,'','','admin','2013-03-01 00:00:00',NULL,NULL),(988,155,3,1,'otro tapizado','','admin','2013-03-01 00:00:00',NULL,NULL),(989,155,4,1,'','','admin','2013-03-01 00:00:00',NULL,NULL),(990,155,5,0,'','','admin','2013-03-01 00:00:00',NULL,NULL),(991,155,6,0,'','','admin','2013-03-01 00:00:00',NULL,NULL),(992,155,7,0,'','','admin','2013-03-01 00:00:00',NULL,NULL),(993,155,8,0,'','','admin','2013-03-01 00:00:00',NULL,NULL),(994,155,9,1,'otro lateral','','admin','2013-03-01 00:00:00',NULL,NULL),(995,155,10,0,'','','admin','2013-03-01 00:00:00',NULL,NULL),(996,155,11,1,'','','admin','2013-03-01 00:00:00',NULL,NULL),(997,155,12,0,'','','admin','2013-03-01 00:00:00',NULL,NULL),(998,156,1,0,'','','admin','2013-03-01 00:00:00',NULL,NULL),(999,156,2,0,'','','admin','2013-03-01 00:00:00',NULL,NULL),(1000,156,3,1,'otro tapizado','','admin','2013-03-01 00:00:00',NULL,NULL),(1001,156,4,1,'','','admin','2013-03-01 00:00:00',NULL,NULL),(1002,156,5,0,'','','admin','2013-03-01 00:00:00',NULL,NULL),(1003,156,6,0,'','','admin','2013-03-01 00:00:00',NULL,NULL),(1004,156,7,0,'','','admin','2013-03-01 00:00:00',NULL,NULL),(1005,156,8,0,'','','admin','2013-03-01 00:00:00',NULL,NULL),(1006,156,9,1,'otro lateral','','admin','2013-03-01 00:00:00',NULL,NULL),(1007,156,10,0,'','','admin','2013-03-01 00:00:00',NULL,NULL),(1008,156,11,1,'','','admin','2013-03-01 00:00:00',NULL,NULL),(1009,156,12,0,'','','admin','2013-03-01 00:00:00',NULL,NULL),(1010,157,1,0,'','','admin','2013-03-01 00:00:00',NULL,NULL),(1011,157,2,0,'','','admin','2013-03-01 00:00:00',NULL,NULL),(1012,157,3,1,'otro tapizado','','admin','2013-03-01 00:00:00',NULL,NULL),(1013,157,4,1,'','','admin','2013-03-01 00:00:00',NULL,NULL),(1014,157,5,0,'','','admin','2013-03-01 00:00:00',NULL,NULL),(1015,157,6,0,'','','admin','2013-03-01 00:00:00',NULL,NULL),(1016,157,7,0,'','','admin','2013-03-01 00:00:00',NULL,NULL),(1017,157,8,0,'','','admin','2013-03-01 00:00:00',NULL,NULL),(1018,157,9,1,'otro lateral','','admin','2013-03-01 00:00:00',NULL,NULL),(1019,157,10,0,'','','admin','2013-03-01 00:00:00',NULL,NULL),(1020,157,11,1,'','','admin','2013-03-01 00:00:00',NULL,NULL),(1021,157,12,0,'','','admin','2013-03-01 00:00:00',NULL,NULL),(1022,158,1,0,'','','admin','2013-03-01 00:00:00',NULL,NULL),(1023,158,2,0,'','','admin','2013-03-01 00:00:00',NULL,NULL),(1024,158,3,1,'otro tapizado','','admin','2013-03-01 00:00:00',NULL,NULL),(1025,158,4,1,'','','admin','2013-03-01 00:00:00',NULL,NULL),(1026,158,5,0,'','','admin','2013-03-01 00:00:00',NULL,NULL),(1027,158,6,0,'','','admin','2013-03-01 00:00:00',NULL,NULL),(1028,158,7,0,'','','admin','2013-03-01 00:00:00',NULL,NULL),(1029,158,8,0,'','','admin','2013-03-01 00:00:00',NULL,NULL),(1030,158,9,1,'otro lateral','','admin','2013-03-01 00:00:00',NULL,NULL),(1031,158,10,0,'','','admin','2013-03-01 00:00:00',NULL,NULL),(1032,158,11,1,'','','admin','2013-03-01 00:00:00',NULL,NULL),(1033,158,12,0,'','','admin','2013-03-01 00:00:00',NULL,NULL),(1034,159,1,0,'','','admin','2013-03-03 00:00:00',NULL,NULL),(1035,159,2,0,'','','admin','2013-03-03 00:00:00',NULL,NULL),(1036,159,3,1,'otro tapizado','','admin','2013-03-03 00:00:00',NULL,NULL),(1037,159,4,1,'','','admin','2013-03-03 00:00:00',NULL,NULL),(1038,159,5,0,'','','admin','2013-03-03 00:00:00',NULL,NULL),(1039,159,6,0,'','','admin','2013-03-03 00:00:00',NULL,NULL),(1040,159,7,0,'','','admin','2013-03-03 00:00:00',NULL,NULL),(1041,159,8,0,'','','admin','2013-03-03 00:00:00',NULL,NULL),(1042,159,9,1,'otro lateral','','admin','2013-03-03 00:00:00',NULL,NULL),(1043,159,10,0,'','','admin','2013-03-03 00:00:00',NULL,NULL),(1044,159,11,1,'','','admin','2013-03-03 00:00:00',NULL,NULL),(1045,159,12,0,'','','admin','2013-03-03 00:00:00',NULL,NULL),(1046,160,1,1,'','','admin','2013-03-21 00:00:00',NULL,NULL),(1047,160,2,0,'','','admin','2013-03-21 00:00:00',NULL,NULL),(1048,160,3,0,'otro tapizado','','admin','2013-03-21 00:00:00',NULL,NULL),(1049,160,4,1,'','','admin','2013-03-21 00:00:00',NULL,NULL),(1050,160,5,0,'','','admin','2013-03-21 00:00:00',NULL,NULL),(1051,160,6,0,'','','admin','2013-03-21 00:00:00',NULL,NULL),(1052,160,7,0,'','','admin','2013-03-21 00:00:00',NULL,NULL),(1053,160,8,0,'','','admin','2013-03-21 00:00:00',NULL,NULL),(1054,160,9,1,'otro lateral','','admin','2013-03-21 00:00:00',NULL,NULL),(1055,160,10,0,'','','admin','2013-03-21 00:00:00',NULL,NULL),(1056,160,11,1,'','','admin','2013-03-21 00:00:00',NULL,NULL),(1057,160,12,0,'','','admin','2013-03-21 00:00:00',NULL,NULL),(1058,161,1,1,'','\0','admin','2013-04-03 00:00:00','admin','2013-04-03 00:00:00'),(1059,161,2,0,'','\0','admin','2013-04-03 00:00:00','admin','2013-04-03 00:00:00'),(1060,161,3,0,'otro tapizado','\0','admin','2013-04-03 00:00:00','admin','2013-04-03 00:00:00'),(1061,161,4,1,'','\0','admin','2013-04-03 00:00:00','admin','2013-04-03 00:00:00'),(1062,161,5,0,'','\0','admin','2013-04-03 00:00:00','admin','2013-04-03 00:00:00'),(1063,161,6,0,'','\0','admin','2013-04-03 00:00:00','admin','2013-04-03 00:00:00'),(1064,161,7,0,'','\0','admin','2013-04-03 00:00:00','admin','2013-04-03 00:00:00'),(1065,161,8,0,'','\0','admin','2013-04-03 00:00:00','admin','2013-04-03 00:00:00'),(1066,161,9,1,'otro lateral','\0','admin','2013-04-03 00:00:00','admin','2013-04-03 00:00:00'),(1067,161,10,0,'','\0','admin','2013-04-03 00:00:00','admin','2013-04-03 00:00:00'),(1068,161,11,1,'','\0','admin','2013-04-03 00:00:00','admin','2013-04-03 00:00:00'),(1069,161,12,0,'','\0','admin','2013-04-03 00:00:00','admin','2013-04-03 00:00:00'),(1070,161,1,1,'','','admin','2013-04-03 00:00:00',NULL,NULL),(1071,161,2,0,'','','admin','2013-04-03 00:00:00',NULL,NULL),(1072,161,3,0,'otro tapizado','','admin','2013-04-03 00:00:00',NULL,NULL),(1073,161,4,1,'','','admin','2013-04-03 00:00:00',NULL,NULL),(1074,161,5,0,'','','admin','2013-04-03 00:00:00',NULL,NULL),(1075,161,6,0,'','','admin','2013-04-03 00:00:00',NULL,NULL),(1076,161,7,0,'','','admin','2013-04-03 00:00:00',NULL,NULL),(1077,161,8,0,'','','admin','2013-04-03 00:00:00',NULL,NULL),(1078,161,9,1,'otro lateral','','admin','2013-04-03 00:00:00',NULL,NULL),(1079,161,10,0,'','','admin','2013-04-03 00:00:00',NULL,NULL),(1080,161,11,1,'','','admin','2013-04-03 00:00:00',NULL,NULL),(1081,161,12,0,'','','admin','2013-04-03 00:00:00',NULL,NULL),(1082,164,1,0,'','\0','admin','2013-04-19 00:00:00','admin','2013-04-19 00:00:00'),(1083,164,2,0,'','\0','admin','2013-04-19 00:00:00','admin','2013-04-19 00:00:00'),(1084,164,3,0,'','\0','admin','2013-04-19 00:00:00','admin','2013-04-19 00:00:00'),(1085,164,4,0,'','\0','admin','2013-04-19 00:00:00','admin','2013-04-19 00:00:00'),(1086,164,5,0,'','\0','admin','2013-04-19 00:00:00','admin','2013-04-19 00:00:00'),(1087,164,6,0,'','\0','admin','2013-04-19 00:00:00','admin','2013-04-19 00:00:00'),(1088,164,7,0,'','\0','admin','2013-04-19 00:00:00','admin','2013-04-19 00:00:00'),(1089,164,8,0,'','\0','admin','2013-04-19 00:00:00','admin','2013-04-19 00:00:00'),(1090,164,9,0,'','\0','admin','2013-04-19 00:00:00','admin','2013-04-19 00:00:00'),(1091,164,10,0,'','\0','admin','2013-04-19 00:00:00','admin','2013-04-19 00:00:00'),(1092,164,11,0,'','\0','admin','2013-04-19 00:00:00','admin','2013-04-19 00:00:00'),(1093,164,12,0,'','\0','admin','2013-04-19 00:00:00','admin','2013-04-19 00:00:00'),(1094,164,1,1,'','','admin','2013-04-19 00:00:00',NULL,NULL),(1095,164,2,1,'','','admin','2013-04-19 00:00:00',NULL,NULL),(1096,164,3,0,'','','admin','2013-04-19 00:00:00',NULL,NULL),(1097,164,4,0,'','','admin','2013-04-19 00:00:00',NULL,NULL),(1098,164,5,1,'','','admin','2013-04-19 00:00:00',NULL,NULL),(1099,164,6,0,'','','admin','2013-04-19 00:00:00',NULL,NULL),(1100,164,7,0,'','','admin','2013-04-19 00:00:00',NULL,NULL),(1101,164,8,1,'','','admin','2013-04-19 00:00:00',NULL,NULL),(1102,164,9,0,'','','admin','2013-04-19 00:00:00',NULL,NULL),(1103,164,10,1,'','','admin','2013-04-19 00:00:00',NULL,NULL),(1104,164,11,1,'','','admin','2013-04-19 00:00:00',NULL,NULL),(1105,164,12,0,'','','admin','2013-04-19 00:00:00',NULL,NULL),(1106,165,1,1,'','\0','admin','2013-12-29 00:00:00','admin','2013-12-29 00:00:00'),(1107,165,2,1,'','\0','admin','2013-12-29 00:00:00','admin','2013-12-29 00:00:00'),(1108,165,3,0,'','\0','admin','2013-12-29 00:00:00','admin','2013-12-29 00:00:00'),(1109,165,4,0,'','\0','admin','2013-12-29 00:00:00','admin','2013-12-29 00:00:00'),(1110,165,5,1,'','\0','admin','2013-12-29 00:00:00','admin','2013-12-29 00:00:00'),(1111,165,6,0,'','\0','admin','2013-12-29 00:00:00','admin','2013-12-29 00:00:00'),(1112,165,7,0,'','\0','admin','2013-12-29 00:00:00','admin','2013-12-29 00:00:00'),(1113,165,8,1,'','\0','admin','2013-12-29 00:00:00','admin','2013-12-29 00:00:00'),(1114,165,9,0,'','\0','admin','2013-12-29 00:00:00','admin','2013-12-29 00:00:00'),(1115,165,10,1,'','\0','admin','2013-12-29 00:00:00','admin','2013-12-29 00:00:00'),(1116,165,11,1,'','\0','admin','2013-12-29 00:00:00','admin','2013-12-29 00:00:00'),(1117,165,12,0,'','\0','admin','2013-12-29 00:00:00','admin','2013-12-29 00:00:00'),(1118,165,1,1,'','\0','admin','2013-12-29 00:00:00','admin','2013-12-29 00:00:00'),(1119,165,2,1,'','\0','admin','2013-12-29 00:00:00','admin','2013-12-29 00:00:00'),(1120,165,3,0,'','\0','admin','2013-12-29 00:00:00','admin','2013-12-29 00:00:00'),(1121,165,4,0,'','\0','admin','2013-12-29 00:00:00','admin','2013-12-29 00:00:00'),(1122,165,5,1,'','\0','admin','2013-12-29 00:00:00','admin','2013-12-29 00:00:00'),(1123,165,6,0,'','\0','admin','2013-12-29 00:00:00','admin','2013-12-29 00:00:00'),(1124,165,7,0,'','\0','admin','2013-12-29 00:00:00','admin','2013-12-29 00:00:00'),(1125,165,8,1,'','\0','admin','2013-12-29 00:00:00','admin','2013-12-29 00:00:00'),(1126,165,9,0,'','\0','admin','2013-12-29 00:00:00','admin','2013-12-29 00:00:00'),(1127,165,10,1,'','\0','admin','2013-12-29 00:00:00','admin','2013-12-29 00:00:00'),(1128,165,11,1,'','\0','admin','2013-12-29 00:00:00','admin','2013-12-29 00:00:00'),(1129,165,12,0,'','\0','admin','2013-12-29 00:00:00','admin','2013-12-29 00:00:00'),(1130,165,1,1,'','','admin','2013-12-29 00:00:00',NULL,NULL),(1131,165,2,1,'','','admin','2013-12-29 00:00:00',NULL,NULL),(1132,165,3,0,'','','admin','2013-12-29 00:00:00',NULL,NULL),(1133,165,4,0,'','','admin','2013-12-29 00:00:00',NULL,NULL),(1134,165,5,1,'','','admin','2013-12-29 00:00:00',NULL,NULL),(1135,165,6,1,'','','admin','2013-12-29 00:00:00',NULL,NULL),(1136,165,7,0,'','','admin','2013-12-29 00:00:00',NULL,NULL),(1137,165,8,1,'','','admin','2013-12-29 00:00:00',NULL,NULL),(1138,165,9,0,'','','admin','2013-12-29 00:00:00',NULL,NULL),(1139,165,10,1,'','','admin','2013-12-29 00:00:00',NULL,NULL),(1140,165,11,1,'','','admin','2013-12-29 00:00:00',NULL,NULL),(1141,165,12,0,'','','admin','2013-12-29 00:00:00',NULL,NULL),(1142,166,1,1,'','','admin','2014-01-25 00:00:00',NULL,NULL),(1143,166,2,1,'','','admin','2014-01-25 00:00:00',NULL,NULL),(1144,166,3,0,'','','admin','2014-01-25 00:00:00',NULL,NULL),(1145,166,4,0,'','','admin','2014-01-25 00:00:00',NULL,NULL),(1146,166,5,1,'','','admin','2014-01-25 00:00:00',NULL,NULL),(1147,166,6,1,'','','admin','2014-01-25 00:00:00',NULL,NULL),(1148,166,7,0,'','','admin','2014-01-25 00:00:00',NULL,NULL),(1149,166,8,1,'','','admin','2014-01-25 00:00:00',NULL,NULL),(1150,166,9,0,'','','admin','2014-01-25 00:00:00',NULL,NULL),(1151,166,10,1,'','','admin','2014-01-25 00:00:00',NULL,NULL),(1152,166,11,1,'','','admin','2014-01-25 00:00:00',NULL,NULL),(1153,166,12,0,'','','admin','2014-01-25 00:00:00',NULL,NULL),(1154,167,1,0,'','\0','admin','2014-02-16 00:00:00','admin','2014-02-18 00:00:00'),(1155,167,2,1,'','\0','admin','2014-02-16 00:00:00','admin','2014-02-18 00:00:00'),(1156,167,3,0,'','\0','admin','2014-02-16 00:00:00','admin','2014-02-18 00:00:00'),(1157,167,4,1,'','\0','admin','2014-02-16 00:00:00','admin','2014-02-18 00:00:00'),(1158,167,5,0,'','\0','admin','2014-02-16 00:00:00','admin','2014-02-18 00:00:00'),(1159,167,6,0,'','\0','admin','2014-02-16 00:00:00','admin','2014-02-18 00:00:00'),(1160,167,7,0,'','\0','admin','2014-02-16 00:00:00','admin','2014-02-18 00:00:00'),(1161,167,8,1,'','\0','admin','2014-02-16 00:00:00','admin','2014-02-18 00:00:00'),(1162,167,9,0,'','\0','admin','2014-02-16 00:00:00','admin','2014-02-18 00:00:00'),(1163,167,10,0,'','\0','admin','2014-02-16 00:00:00','admin','2014-02-18 00:00:00'),(1164,167,11,0,'','\0','admin','2014-02-16 00:00:00','admin','2014-02-18 00:00:00'),(1165,167,12,1,'otro espaldar','\0','admin','2014-02-16 00:00:00','admin','2014-02-18 00:00:00'),(1166,167,1,0,'','\0','admin','2014-02-18 00:00:00','admin','2014-02-18 00:00:00'),(1167,167,2,1,'','\0','admin','2014-02-18 00:00:00','admin','2014-02-18 00:00:00'),(1168,167,3,0,'','\0','admin','2014-02-18 00:00:00','admin','2014-02-18 00:00:00'),(1169,167,4,1,'','\0','admin','2014-02-18 00:00:00','admin','2014-02-18 00:00:00'),(1170,167,5,0,'','\0','admin','2014-02-18 00:00:00','admin','2014-02-18 00:00:00'),(1171,167,6,0,'','\0','admin','2014-02-18 00:00:00','admin','2014-02-18 00:00:00'),(1172,167,7,0,'','\0','admin','2014-02-18 00:00:00','admin','2014-02-18 00:00:00'),(1173,167,8,1,'','\0','admin','2014-02-18 00:00:00','admin','2014-02-18 00:00:00'),(1174,167,9,0,'','\0','admin','2014-02-18 00:00:00','admin','2014-02-18 00:00:00'),(1175,167,10,0,'','\0','admin','2014-02-18 00:00:00','admin','2014-02-18 00:00:00'),(1176,167,11,0,'','\0','admin','2014-02-18 00:00:00','admin','2014-02-18 00:00:00'),(1177,167,12,1,'otro espaldar','\0','admin','2014-02-18 00:00:00','admin','2014-02-18 00:00:00'),(1178,167,1,0,'','','admin','2014-02-18 00:00:00',NULL,NULL),(1179,167,2,1,'','','admin','2014-02-18 00:00:00',NULL,NULL),(1180,167,3,0,'','','admin','2014-02-18 00:00:00',NULL,NULL),(1181,167,4,1,'','','admin','2014-02-18 00:00:00',NULL,NULL),(1182,167,5,0,'','','admin','2014-02-18 00:00:00',NULL,NULL),(1183,167,6,0,'','','admin','2014-02-18 00:00:00',NULL,NULL),(1184,167,7,0,'','','admin','2014-02-18 00:00:00',NULL,NULL),(1185,167,8,1,'','','admin','2014-02-18 00:00:00',NULL,NULL),(1186,167,9,0,'','','admin','2014-02-18 00:00:00',NULL,NULL),(1187,167,10,0,'','','admin','2014-02-18 00:00:00',NULL,NULL),(1188,167,11,0,'','','admin','2014-02-18 00:00:00',NULL,NULL),(1189,167,12,1,'otro espaldar','','admin','2014-02-18 00:00:00',NULL,NULL),(1190,168,1,0,'','','admin','2014-02-25 00:00:00',NULL,NULL),(1191,168,2,1,'','','admin','2014-02-25 00:00:00',NULL,NULL),(1192,168,3,0,'','','admin','2014-02-25 00:00:00',NULL,NULL),(1193,168,4,1,'','','admin','2014-02-25 00:00:00',NULL,NULL),(1194,168,5,0,'','','admin','2014-02-25 00:00:00',NULL,NULL),(1195,168,6,0,'','','admin','2014-02-25 00:00:00',NULL,NULL),(1196,168,7,0,'','','admin','2014-02-25 00:00:00',NULL,NULL),(1197,168,8,1,'','','admin','2014-02-25 00:00:00',NULL,NULL),(1198,168,9,0,'','','admin','2014-02-25 00:00:00',NULL,NULL),(1199,168,10,0,'','','admin','2014-02-25 00:00:00',NULL,NULL),(1200,168,11,0,'','','admin','2014-02-25 00:00:00',NULL,NULL),(1201,168,12,1,'otro espaldar','','admin','2014-02-25 00:00:00',NULL,NULL),(1202,169,1,0,'','\0','admin','2014-03-24 00:00:00','admin','2014-07-20 00:00:00'),(1203,169,2,1,'','\0','admin','2014-03-24 00:00:00','admin','2014-07-20 00:00:00'),(1204,169,3,0,'','\0','admin','2014-03-24 00:00:00','admin','2014-07-20 00:00:00'),(1205,169,4,1,'','\0','admin','2014-03-24 00:00:00','admin','2014-07-20 00:00:00'),(1206,169,5,0,'','\0','admin','2014-03-24 00:00:00','admin','2014-07-20 00:00:00'),(1207,169,6,0,'','\0','admin','2014-03-24 00:00:00','admin','2014-07-20 00:00:00'),(1208,169,7,0,'','\0','admin','2014-03-24 00:00:00','admin','2014-07-20 00:00:00'),(1209,169,8,1,'','\0','admin','2014-03-24 00:00:00','admin','2014-07-20 00:00:00'),(1210,169,9,0,'','\0','admin','2014-03-24 00:00:00','admin','2014-07-20 00:00:00'),(1211,169,10,0,'','\0','admin','2014-03-24 00:00:00','admin','2014-07-20 00:00:00'),(1212,169,11,0,'','\0','admin','2014-03-24 00:00:00','admin','2014-07-20 00:00:00'),(1213,169,12,1,'otro espaldar','\0','admin','2014-03-24 00:00:00','admin','2014-07-20 00:00:00'),(1214,169,1,0,'','\0','admin','2014-07-20 00:00:00','admin','2014-07-20 00:00:00'),(1215,169,2,1,'','\0','admin','2014-07-20 00:00:00','admin','2014-07-20 00:00:00'),(1216,169,3,0,'','\0','admin','2014-07-20 00:00:00','admin','2014-07-20 00:00:00'),(1217,169,4,1,'','\0','admin','2014-07-20 00:00:00','admin','2014-07-20 00:00:00'),(1218,169,5,0,'','\0','admin','2014-07-20 00:00:00','admin','2014-07-20 00:00:00'),(1219,169,6,0,'','\0','admin','2014-07-20 00:00:00','admin','2014-07-20 00:00:00'),(1220,169,7,0,'','\0','admin','2014-07-20 00:00:00','admin','2014-07-20 00:00:00'),(1221,169,8,1,'','\0','admin','2014-07-20 00:00:00','admin','2014-07-20 00:00:00'),(1222,169,9,0,'','\0','admin','2014-07-20 00:00:00','admin','2014-07-20 00:00:00'),(1223,169,10,0,'','\0','admin','2014-07-20 00:00:00','admin','2014-07-20 00:00:00'),(1224,169,11,0,'','\0','admin','2014-07-20 00:00:00','admin','2014-07-20 00:00:00'),(1225,169,12,1,'otro espaldar','\0','admin','2014-07-20 00:00:00','admin','2014-07-20 00:00:00'),(1226,169,1,0,'','\0','admin','2014-07-20 00:00:00','admin','2014-07-20 00:00:00'),(1227,169,2,1,'','\0','admin','2014-07-20 00:00:00','admin','2014-07-20 00:00:00'),(1228,169,3,0,'','\0','admin','2014-07-20 00:00:00','admin','2014-07-20 00:00:00'),(1229,169,4,1,'','\0','admin','2014-07-20 00:00:00','admin','2014-07-20 00:00:00'),(1230,169,5,0,'','\0','admin','2014-07-20 00:00:00','admin','2014-07-20 00:00:00'),(1231,169,6,0,'','\0','admin','2014-07-20 00:00:00','admin','2014-07-20 00:00:00'),(1232,169,7,0,'','\0','admin','2014-07-20 00:00:00','admin','2014-07-20 00:00:00'),(1233,169,8,1,'','\0','admin','2014-07-20 00:00:00','admin','2014-07-20 00:00:00'),(1234,169,9,0,'','\0','admin','2014-07-20 00:00:00','admin','2014-07-20 00:00:00'),(1235,169,10,0,'','\0','admin','2014-07-20 00:00:00','admin','2014-07-20 00:00:00'),(1236,169,11,0,'','\0','admin','2014-07-20 00:00:00','admin','2014-07-20 00:00:00'),(1237,169,12,1,'otro espaldar','\0','admin','2014-07-20 00:00:00','admin','2014-07-20 00:00:00'),(1238,169,1,0,'','\0','admin','2014-07-20 00:00:00','admin','2014-07-20 00:00:00'),(1239,169,2,1,'','\0','admin','2014-07-20 00:00:00','admin','2014-07-20 00:00:00'),(1240,169,3,0,'','\0','admin','2014-07-20 00:00:00','admin','2014-07-20 00:00:00'),(1241,169,4,1,'','\0','admin','2014-07-20 00:00:00','admin','2014-07-20 00:00:00'),(1242,169,5,0,'','\0','admin','2014-07-20 00:00:00','admin','2014-07-20 00:00:00'),(1243,169,6,0,'','\0','admin','2014-07-20 00:00:00','admin','2014-07-20 00:00:00'),(1244,169,7,0,'','\0','admin','2014-07-20 00:00:00','admin','2014-07-20 00:00:00'),(1245,169,8,1,'','\0','admin','2014-07-20 00:00:00','admin','2014-07-20 00:00:00'),(1246,169,9,0,'','\0','admin','2014-07-20 00:00:00','admin','2014-07-20 00:00:00'),(1247,169,10,0,'','\0','admin','2014-07-20 00:00:00','admin','2014-07-20 00:00:00'),(1248,169,11,0,'','\0','admin','2014-07-20 00:00:00','admin','2014-07-20 00:00:00'),(1249,169,12,1,'otro espaldar','\0','admin','2014-07-20 00:00:00','admin','2014-07-20 00:00:00'),(1250,169,1,0,'','','admin','2014-07-20 00:00:00',NULL,NULL),(1251,169,2,1,'','','admin','2014-07-20 00:00:00',NULL,NULL),(1252,169,3,0,'','','admin','2014-07-20 00:00:00',NULL,NULL),(1253,169,4,1,'','','admin','2014-07-20 00:00:00',NULL,NULL),(1254,169,5,0,'','','admin','2014-07-20 00:00:00',NULL,NULL),(1255,169,6,0,'','','admin','2014-07-20 00:00:00',NULL,NULL),(1256,169,7,0,'','','admin','2014-07-20 00:00:00',NULL,NULL),(1257,169,8,1,'','','admin','2014-07-20 00:00:00',NULL,NULL),(1258,169,9,0,'','','admin','2014-07-20 00:00:00',NULL,NULL),(1259,169,10,0,'','','admin','2014-07-20 00:00:00',NULL,NULL),(1260,169,11,0,'','','admin','2014-07-20 00:00:00',NULL,NULL),(1261,169,12,1,'otro espaldar','','admin','2014-07-20 00:00:00',NULL,NULL);
/*!40000 ALTER TABLE `cotizacioncaracteristicas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cotizacionproducto`
--

DROP TABLE IF EXISTS `cotizacionproducto`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cotizacionproducto` (
  `idCotizacionProducto` int(11) NOT NULL AUTO_INCREMENT,
  `idCotizacion` int(11) NOT NULL,
  `idProducto` int(11) NOT NULL,
  `Cantidad` int(11) DEFAULT NULL,
  `Activo` bit(1) DEFAULT b'1',
  `Usuario` varchar(20) DEFAULT NULL,
  `FechaRegistro` datetime DEFAULT NULL,
  `UsuarioModificacion` varchar(20) DEFAULT NULL,
  `FechaModificacion` datetime DEFAULT NULL,
  `Precio` decimal(9,3) DEFAULT NULL,
  PRIMARY KEY (`idCotizacionProducto`),
  KEY `fk_CotizacionProducto_Cotizacion1_idx` (`idCotizacion`),
  KEY `fk_CotizacionProducto_Producto1_idx` (`idProducto`),
  CONSTRAINT `fk_CotizacionProducto_Cotizacion1` FOREIGN KEY (`idCotizacion`) REFERENCES `cotizacion` (`idCotizacion`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_CotizacionProducto_Producto1` FOREIGN KEY (`idProducto`) REFERENCES `producto` (`idProducto`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=303 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cotizacionproducto`
--

LOCK TABLES `cotizacionproducto` WRITE;
/*!40000 ALTER TABLE `cotizacionproducto` DISABLE KEYS */;
INSERT INTO `cotizacionproducto` VALUES (1,6,2,3,'','admin','2013-02-08 00:00:00',NULL,NULL,0.000),(2,6,3,3,'','admin','2013-02-08 00:00:00',NULL,NULL,0.000),(3,6,2,2,'','admin','2013-02-08 00:00:00',NULL,NULL,0.000),(4,6,3,2,'','admin','2013-02-08 00:00:00',NULL,NULL,0.000),(5,7,3,1,'','admin','2013-02-10 00:00:00',NULL,NULL,0.000),(6,7,2,2,'','admin','2013-02-10 00:00:00',NULL,NULL,0.000),(7,8,2,2,'','admin','2013-02-12 00:00:00',NULL,NULL,0.000),(8,8,3,4,'','admin','2013-02-12 00:00:00',NULL,NULL,0.000),(10,9,2,3,'','admin','2013-02-12 00:00:00',NULL,NULL,0.000),(11,9,3,1,'','admin','2013-02-12 00:00:00',NULL,NULL,0.000),(13,10,2,3,'','admin','2013-02-12 00:00:00',NULL,NULL,0.000),(14,10,3,1,'','admin','2013-02-12 00:00:00',NULL,NULL,0.000),(16,11,2,3,'','admin','2013-02-12 00:00:00',NULL,NULL,0.000),(17,11,3,1,'','admin','2013-02-12 00:00:00',NULL,NULL,0.000),(19,12,2,3,'','admin','2013-02-12 00:00:00',NULL,NULL,0.000),(20,12,3,1,'','admin','2013-02-12 00:00:00',NULL,NULL,0.000),(22,13,2,3,'','admin','2013-02-12 00:00:00',NULL,NULL,0.000),(23,13,3,1,'','admin','2013-02-12 00:00:00',NULL,NULL,0.000),(25,14,2,3,'','admin','2013-02-12 00:00:00',NULL,NULL,0.000),(26,14,3,1,'','admin','2013-02-12 00:00:00',NULL,NULL,0.000),(28,15,2,3,'','admin','2013-02-12 00:00:00',NULL,NULL,0.000),(29,15,3,1,'','admin','2013-02-12 00:00:00',NULL,NULL,0.000),(31,16,2,3,'','admin','2013-02-12 00:00:00',NULL,NULL,0.000),(32,16,3,1,'','admin','2013-02-12 00:00:00',NULL,NULL,0.000),(34,17,2,3,'','admin','2013-02-12 00:00:00',NULL,NULL,0.000),(35,17,3,1,'','admin','2013-02-12 00:00:00',NULL,NULL,0.000),(37,18,2,3,'','admin','2013-02-12 00:00:00',NULL,NULL,0.000),(38,18,3,1,'','admin','2013-02-12 00:00:00',NULL,NULL,0.000),(39,19,2,2,'','admin','2013-02-13 00:00:00',NULL,NULL,0.000),(40,20,4,2,'','admin','2013-02-13 00:00:00',NULL,NULL,0.000),(41,20,3,1,'','admin','2013-02-13 00:00:00',NULL,NULL,0.000),(43,21,3,1,'','admin','2013-02-13 00:00:00',NULL,NULL,0.000),(44,21,4,2,'','admin','2013-02-13 00:00:00',NULL,NULL,0.000),(46,22,3,1,'','admin','2013-02-13 00:00:00',NULL,NULL,0.000),(47,22,4,2,'','admin','2013-02-13 00:00:00',NULL,NULL,0.000),(49,23,3,1,'','admin','2013-02-13 00:00:00',NULL,NULL,0.000),(50,23,4,2,'','admin','2013-02-13 00:00:00',NULL,NULL,0.000),(51,23,2,3,'','admin','2013-02-13 00:00:00',NULL,NULL,0.000),(52,24,3,1,'','admin','2013-02-13 00:00:00',NULL,NULL,0.000),(53,24,4,2,'','admin','2013-02-13 00:00:00',NULL,NULL,0.000),(54,24,2,3,'','admin','2013-02-13 00:00:00',NULL,NULL,0.000),(55,25,3,2,'','admin','2013-02-13 00:00:00',NULL,NULL,0.000),(56,26,2,3,'','admin','2013-02-13 00:00:00',NULL,NULL,0.000),(57,26,3,1,'','admin','2013-02-13 00:00:00',NULL,NULL,0.000),(59,27,3,1,'','admin','2013-02-13 00:00:00',NULL,NULL,0.000),(60,27,2,1,'','admin','2013-02-13 00:00:00',NULL,NULL,0.000),(62,28,2,4,'','admin','2013-02-13 00:00:00',NULL,NULL,0.000),(63,28,3,1,'','admin','2013-02-13 00:00:00',NULL,NULL,0.000),(65,29,2,4,'','admin','2013-02-13 00:00:00',NULL,NULL,0.000),(66,29,3,1,'','admin','2013-02-13 00:00:00',NULL,NULL,0.000),(68,30,2,2,'','admin','2013-02-13 00:00:00',NULL,NULL,0.000),(69,31,2,3,'','admin','2013-02-13 00:00:00',NULL,NULL,0.000),(70,32,3,1,'','admin','2013-02-13 00:00:00',NULL,NULL,0.000),(71,33,4,2,'','admin','2013-02-13 00:00:00',NULL,NULL,0.000),(72,34,2,4,'','admin','2013-02-13 00:00:00',NULL,NULL,0.000),(73,35,3,4,'','admin','2013-02-13 00:00:00',NULL,NULL,0.000),(74,36,2,3,'','admin','2013-02-13 00:00:00',NULL,NULL,0.000),(75,37,2,4,'','admin','2013-02-13 00:00:00',NULL,NULL,0.000),(76,38,3,2,'','admin','2013-02-13 00:00:00',NULL,NULL,0.000),(77,39,3,2,'','admin','2013-02-13 00:00:00',NULL,NULL,0.000),(78,40,2,2,'','admin','2013-02-13 00:00:00',NULL,NULL,0.000),(79,41,6,2,'','admin','2013-02-18 00:00:00',NULL,NULL,0.000),(80,41,3,1,'','admin','2013-02-18 00:00:00',NULL,NULL,0.000),(82,42,4,2,'','admin','2013-02-18 00:00:00',NULL,NULL,0.000),(83,42,8,2,'','admin','2013-02-18 00:00:00',NULL,NULL,0.000),(84,43,4,1,'','admin','2013-02-19 00:00:00',NULL,NULL,0.000),(85,43,5,2,'','admin','2013-02-19 00:00:00',NULL,NULL,0.000),(86,44,2,4,'','admin','2013-02-27 00:00:00',NULL,NULL,0.000),(87,44,4,9,'','admin','2013-02-27 00:00:00',NULL,NULL,0.000),(88,45,2,4,'','admin','2013-02-27 00:00:00',NULL,NULL,0.000),(89,45,3,4,'','admin','2013-02-27 00:00:00',NULL,NULL,0.000),(90,45,5,4,'','admin','2013-02-27 00:00:00',NULL,NULL,0.000),(91,46,2,4,'','admin','2013-02-27 00:00:00',NULL,NULL,0.000),(92,46,5,4,'','admin','2013-02-27 00:00:00',NULL,NULL,0.000),(93,46,7,4,'','admin','2013-02-27 00:00:00',NULL,NULL,0.000),(94,46,9,4,'','admin','2013-02-27 00:00:00',NULL,NULL,0.000),(98,47,2,3,'','admin','2013-02-27 00:00:00',NULL,NULL,0.000),(99,47,4,3,'','admin','2013-02-27 00:00:00',NULL,NULL,0.000),(101,48,2,3,'','admin','2013-02-27 00:00:00',NULL,NULL,0.000),(102,48,5,3,'','admin','2013-02-27 00:00:00',NULL,NULL,0.000),(104,53,5,4,'','admin','2013-02-27 00:00:00',NULL,NULL,0.000),(105,53,6,34,'','admin','2013-02-27 00:00:00',NULL,NULL,0.000),(106,53,5,4,'','admin','2013-02-27 00:00:00',NULL,NULL,0.000),(107,54,5,4,'','admin','2013-02-27 00:00:00',NULL,NULL,0.000),(108,54,7,4,'','admin','2013-02-27 00:00:00',NULL,NULL,0.000),(110,56,4,4,'','admin','2013-02-27 00:00:00',NULL,NULL,0.000),(111,56,9,4,'','admin','2013-02-27 00:00:00',NULL,NULL,0.000),(112,56,4,4,'','admin','2013-02-27 00:00:00',NULL,NULL,0.000),(113,72,5,4,'','admin','2013-02-27 00:00:00',NULL,NULL,0.000),(114,72,8,2,'','admin','2013-02-27 00:00:00',NULL,NULL,0.000),(116,74,5,4,'','admin','2013-02-27 00:00:00',NULL,NULL,0.000),(117,74,8,2,'','admin','2013-02-27 00:00:00',NULL,NULL,0.000),(119,75,5,4,'','admin','2013-02-27 00:00:00',NULL,NULL,0.000),(120,75,8,2,'','admin','2013-02-27 00:00:00',NULL,NULL,0.000),(122,76,8,2,'','admin','2013-02-27 00:00:00',NULL,NULL,0.000),(123,76,5,5,'','admin','2013-02-27 00:00:00',NULL,NULL,0.000),(125,77,10,4,'','admin','2013-02-27 00:00:00',NULL,NULL,0.000),(126,77,10,4,'','admin','2013-02-27 00:00:00',NULL,NULL,0.000),(128,78,5,5,'','admin','2013-02-27 00:00:00',NULL,NULL,0.000),(129,78,5,5,'','admin','2013-02-27 00:00:00',NULL,NULL,0.000),(131,79,5,5,'','admin','2013-02-27 00:00:00',NULL,NULL,0.000),(132,79,5,5,'','admin','2013-02-27 00:00:00',NULL,NULL,0.000),(134,80,10,4,'','admin','2013-02-27 00:00:00',NULL,NULL,0.000),(135,80,2,4,'','admin','2013-02-27 00:00:00',NULL,NULL,0.000),(137,81,8,3,'','admin','2013-02-27 00:00:00',NULL,NULL,0.000),(138,81,2,3,'','admin','2013-02-27 00:00:00',NULL,NULL,0.000),(140,82,5,4,'','admin','2013-02-27 00:00:00',NULL,NULL,0.000),(141,82,6,4,'','admin','2013-02-27 00:00:00',NULL,NULL,0.000),(143,83,5,4,'','admin','2013-02-27 00:00:00',NULL,NULL,0.000),(144,83,2,4,'','admin','2013-02-27 00:00:00',NULL,NULL,0.000),(146,84,4,4,'','admin','2013-02-27 00:00:00',NULL,NULL,0.000),(147,84,8,6,'','admin','2013-02-27 00:00:00',NULL,NULL,0.000),(149,85,5,3,'','admin','2013-02-27 00:00:00',NULL,NULL,0.000),(150,86,4,4,'','admin','2013-02-27 00:00:00',NULL,NULL,0.000),(151,87,5,4,'','admin','2013-02-27 00:00:00',NULL,NULL,0.000),(152,88,4,5,'','admin','2013-02-27 00:00:00',NULL,NULL,0.000),(153,89,4,5,'','admin','2013-02-27 00:00:00',NULL,NULL,0.000),(154,90,4,5,'','admin','2013-02-27 00:00:00',NULL,NULL,0.000),(155,90,2,4,'','admin','2013-02-27 00:00:00',NULL,NULL,0.000),(157,91,3,4,'','admin','2013-02-27 00:00:00',NULL,NULL,0.000),(158,91,2,4,'','admin','2013-02-27 00:00:00',NULL,NULL,0.000),(159,94,6,2,'','admin','2013-02-28 00:00:00',NULL,NULL,0.000),(160,94,2,3,'','admin','2013-02-28 00:00:00',NULL,NULL,0.000),(161,98,6,2,'\0','admin','2013-02-28 00:00:00','admin','2013-02-28 00:00:00',0.000),(162,98,2,3,'\0','admin','2013-02-28 00:00:00','admin','2013-02-28 00:00:00',0.000),(164,98,6,2,'\0','admin','2013-02-28 00:00:00','admin','2013-02-28 00:00:00',0.000),(165,98,2,3,'\0','admin','2013-02-28 00:00:00','admin','2013-02-28 00:00:00',0.000),(166,98,6,2,'','admin','2013-02-28 00:00:00',NULL,NULL,0.000),(167,98,2,3,'','admin','2013-02-28 00:00:00',NULL,NULL,0.000),(168,99,6,2,'','admin','2013-02-28 00:00:00',NULL,NULL,0.000),(169,99,2,3,'','admin','2013-02-28 00:00:00',NULL,NULL,0.000),(170,108,5,5,'','admin','2013-02-28 00:00:00',NULL,NULL,0.000),(171,114,6,2,'','admin','2013-02-28 00:00:00',NULL,NULL,0.000),(172,114,2,3,'','admin','2013-02-28 00:00:00',NULL,NULL,0.000),(174,115,6,2,'','admin','2013-02-28 00:00:00',NULL,NULL,0.000),(175,115,2,3,'','admin','2013-02-28 00:00:00',NULL,NULL,0.000),(177,116,6,2,'','admin','2013-02-28 00:00:00',NULL,NULL,0.000),(178,116,2,3,'','admin','2013-02-28 00:00:00',NULL,NULL,0.000),(179,117,6,2,'','admin','2013-02-28 00:00:00',NULL,NULL,0.000),(180,117,2,3,'','admin','2013-02-28 00:00:00',NULL,NULL,0.000),(182,118,6,2,'','admin','2013-02-28 00:00:00',NULL,NULL,0.000),(183,118,2,3,'','admin','2013-02-28 00:00:00',NULL,NULL,0.000),(185,126,6,2,'','admin','2013-02-28 00:00:00',NULL,NULL,0.000),(186,126,2,3,'','admin','2013-02-28 00:00:00',NULL,NULL,0.000),(188,127,6,2,'','admin','2013-02-28 00:00:00',NULL,NULL,0.000),(189,127,2,3,'','admin','2013-02-28 00:00:00',NULL,NULL,0.000),(191,128,6,2,'','admin','2013-02-28 00:00:00',NULL,NULL,0.000),(192,128,2,3,'','admin','2013-02-28 00:00:00',NULL,NULL,0.000),(194,129,6,2,'','admin','2013-02-28 00:00:00',NULL,NULL,0.000),(195,129,2,3,'','admin','2013-02-28 00:00:00',NULL,NULL,0.000),(197,130,6,2,'','admin','2013-02-28 00:00:00',NULL,NULL,0.000),(198,130,2,3,'','admin','2013-02-28 00:00:00',NULL,NULL,0.000),(200,131,6,2,'','admin','2013-02-28 00:00:00',NULL,NULL,0.000),(201,131,2,3,'','admin','2013-02-28 00:00:00',NULL,NULL,0.000),(203,132,6,2,'','admin','2013-02-28 00:00:00',NULL,NULL,0.000),(204,132,2,3,'','admin','2013-02-28 00:00:00',NULL,NULL,0.000),(206,133,6,2,'','admin','2013-02-28 00:00:00',NULL,NULL,0.000),(207,133,2,3,'','admin','2013-02-28 00:00:00',NULL,NULL,0.000),(209,134,6,2,'','admin','2013-02-28 00:00:00',NULL,NULL,0.000),(210,134,2,3,'','admin','2013-02-28 00:00:00',NULL,NULL,0.000),(212,135,6,2,'','admin','2013-02-28 00:00:00',NULL,NULL,0.000),(213,135,2,3,'','admin','2013-02-28 00:00:00',NULL,NULL,0.000),(215,136,6,2,'','admin','2013-02-28 00:00:00',NULL,NULL,0.000),(216,136,2,3,'','admin','2013-02-28 00:00:00',NULL,NULL,0.000),(218,137,6,2,'','admin','2013-02-28 00:00:00',NULL,NULL,0.000),(219,137,2,3,'','admin','2013-02-28 00:00:00',NULL,NULL,0.000),(221,138,6,2,'','admin','2013-02-28 00:00:00',NULL,NULL,0.000),(222,138,2,3,'','admin','2013-02-28 00:00:00',NULL,NULL,0.000),(224,139,6,2,'','admin','2013-02-28 00:00:00',NULL,NULL,0.000),(225,139,2,3,'','admin','2013-02-28 00:00:00',NULL,NULL,0.000),(227,140,6,2,'','admin','2013-02-28 00:00:00',NULL,NULL,0.000),(228,140,2,3,'','admin','2013-02-28 00:00:00',NULL,NULL,0.000),(230,141,6,2,'','admin','2013-02-28 00:00:00',NULL,NULL,0.000),(231,141,2,3,'','admin','2013-02-28 00:00:00',NULL,NULL,0.000),(233,142,6,2,'','admin','2013-02-28 00:00:00',NULL,NULL,0.000),(234,142,2,3,'','admin','2013-02-28 00:00:00',NULL,NULL,0.000),(236,143,6,2,'','admin','2013-02-28 00:00:00',NULL,NULL,0.000),(237,143,2,3,'','admin','2013-02-28 00:00:00',NULL,NULL,0.000),(239,144,6,2,'','admin','2013-02-28 00:00:00',NULL,NULL,0.000),(240,144,2,3,'','admin','2013-02-28 00:00:00',NULL,NULL,0.000),(242,145,6,2,'','admin','2013-02-28 00:00:00',NULL,NULL,0.000),(243,145,2,3,'','admin','2013-02-28 00:00:00',NULL,NULL,0.000),(245,146,6,2,'','admin','2013-02-28 00:00:00',NULL,NULL,0.000),(246,147,6,2,'','admin','2013-02-28 00:00:00',NULL,NULL,0.000),(247,148,6,2,'','admin','2013-02-28 00:00:00',NULL,NULL,NULL),(248,148,2,5,'','admin','2013-02-28 00:00:00',NULL,NULL,NULL),(249,148,9,2,'','admin','2013-02-28 00:00:00',NULL,NULL,NULL),(250,150,2,3,'\0','admin','2013-02-28 00:00:00','admin','2013-02-28 00:00:00',NULL),(251,150,2,5,'','admin','2013-02-28 00:00:00',NULL,NULL,NULL),(252,150,6,5,'','admin','2013-02-28 00:00:00',NULL,NULL,NULL),(253,151,2,2,'\0','admin','2013-02-28 00:00:00','admin','2013-02-28 00:00:00',7.000),(254,151,6,2,'\0','admin','2013-02-28 00:00:00','admin','2013-02-28 00:00:00',5.000),(255,151,2,2,'','admin','2013-02-28 00:00:00',NULL,NULL,NULL),(256,152,2,5,'','admin','2013-02-28 00:00:00',NULL,NULL,7.000),(257,152,6,5,'','admin','2013-02-28 00:00:00',NULL,NULL,5.000),(258,153,2,5,'','admin','2013-02-28 00:00:00',NULL,NULL,7.000),(259,154,2,5,'\0','admin','2013-02-28 00:00:00','admin','2013-02-28 00:00:00',7.000),(260,154,6,5,'\0','admin','2013-02-28 00:00:00','admin','2013-02-28 00:00:00',5.000),(261,154,2,5,'','admin','2013-02-28 00:00:00',NULL,NULL,7.000),(262,155,2,5,'','admin','2013-03-01 00:00:00',NULL,NULL,7.000),(263,155,7,5,'','admin','2013-03-01 00:00:00',NULL,NULL,7.000),(264,156,2,5,'','admin','2013-03-01 00:00:00',NULL,NULL,7.000),(265,156,7,5,'','admin','2013-03-01 00:00:00',NULL,NULL,7.000),(266,157,2,5,'','admin','2013-03-01 00:00:00',NULL,NULL,7.000),(267,157,7,5,'','admin','2013-03-01 00:00:00',NULL,NULL,7.000),(268,158,2,5,'','admin','2013-03-01 00:00:00',NULL,NULL,7.000),(269,158,7,5,'','admin','2013-03-01 00:00:00',NULL,NULL,7.000),(270,159,2,5,'','admin','2013-03-03 00:00:00',NULL,NULL,7.000),(271,159,7,5,'','admin','2013-03-03 00:00:00',NULL,NULL,7.000),(272,160,2,5,'','admin','2013-03-21 00:00:00',NULL,NULL,7.000),(273,160,4,3,'','admin','2013-03-21 00:00:00',NULL,NULL,8.000),(274,160,6,3,'','admin','2013-03-21 00:00:00',NULL,NULL,5.000),(275,161,2,5,'\0','admin','2013-04-03 00:00:00','admin','2013-04-03 00:00:00',7.000),(276,161,4,3,'\0','admin','2013-04-03 00:00:00','admin','2013-04-03 00:00:00',8.000),(277,161,6,3,'\0','admin','2013-04-03 00:00:00','admin','2013-04-03 00:00:00',5.000),(278,161,2,5,'','admin','2013-04-03 00:00:00',NULL,NULL,7.000),(279,161,4,3,'','admin','2013-04-03 00:00:00',NULL,NULL,8.000),(280,161,6,3,'','admin','2013-04-03 00:00:00',NULL,NULL,5.000),(281,164,6,5,'','admin','2013-04-19 00:00:00',NULL,NULL,5.000),(282,165,6,5,'\0','admin','2013-12-29 00:00:00','admin','2013-12-29 00:00:00',5.000),(283,165,6,5,'\0','admin','2013-12-29 00:00:00','admin','2013-12-29 00:00:00',5.000),(284,165,6,5,'','admin','2013-12-29 00:00:00',NULL,NULL,5.000),(285,166,6,5,'','admin','2014-01-25 00:00:00',NULL,NULL,5.000),(286,166,12,2,'','admin','2014-01-25 00:00:00',NULL,NULL,0.000),(287,166,11,2,'','admin','2014-01-25 00:00:00',NULL,NULL,0.000),(288,167,11,2,'\0','admin','2014-02-16 00:00:00','admin','2014-02-18 00:00:00',60.000),(289,167,7,5,'\0','admin','2014-02-16 00:00:00','admin','2014-02-18 00:00:00',7.000),(290,167,5,15,'\0','admin','2014-02-16 00:00:00','admin','2014-02-18 00:00:00',9.000),(291,167,11,2,'\0','admin','2014-02-18 00:00:00','admin','2014-02-18 00:00:00',60.000),(292,167,11,2,'','admin','2014-02-18 00:00:00',NULL,NULL,60.000),(293,168,11,2,'','admin','2014-02-25 00:00:00',NULL,NULL,60.000),(294,168,9,4,'','admin','2014-02-25 00:00:00',NULL,NULL,8.000),(295,169,11,2,'\0','admin','2014-03-24 00:00:00','admin','2014-07-20 00:00:00',60.000),(296,169,9,4,'\0','admin','2014-03-24 00:00:00','admin','2014-07-20 00:00:00',8.000),(297,169,9,4,'\0','admin','2014-07-20 00:00:00','admin','2014-07-20 00:00:00',8.000),(298,169,9,4,'\0','admin','2014-07-20 00:00:00','admin','2014-07-20 00:00:00',8.000),(299,169,9,4,'\0','admin','2014-07-20 00:00:00','admin','2014-07-20 00:00:00',8.000),(300,169,2,5,'\0','admin','2014-07-20 00:00:00','admin','2014-07-20 00:00:00',35.000),(301,169,9,4,'','admin','2014-07-20 00:00:00',NULL,NULL,8.000),(302,169,2,5,'','admin','2014-07-20 00:00:00',NULL,NULL,35.000);
/*!40000 ALTER TABLE `cotizacionproducto` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cuenta`
--

DROP TABLE IF EXISTS `cuenta`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cuenta` (
  `idCuenta` int(11) NOT NULL AUTO_INCREMENT,
  `Descripcion` varchar(50) DEFAULT NULL,
  `Codigo` varchar(10) DEFAULT NULL,
  `Activo` bit(1) DEFAULT b'1',
  `Usuario` varchar(20) DEFAULT NULL,
  `FechaRegistro` datetime DEFAULT NULL,
  `UsuarioModificacion` varchar(20) DEFAULT NULL,
  `FechaModificacion` datetime DEFAULT NULL,
  PRIMARY KEY (`idCuenta`)
) ENGINE=InnoDB AUTO_INCREMENT=30 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cuenta`
--

LOCK TABLES `cuenta` WRITE;
/*!40000 ALTER TABLE `cuenta` DISABLE KEYS */;
INSERT INTO `cuenta` VALUES (1,'primera cuenta','3562499','\0','admin','2014-07-17 00:00:00','admin','2014-07-17 00:00:00'),(2,'segunda cuenta','43534',NULL,'admin','2014-07-17 00:00:00',NULL,NULL),(3,'tercera cuenta 3','76574333','','admin','2014-07-17 00:00:00','admin','2014-07-17 00:00:00'),(4,'cuarta cuenta','84642','','admin','2014-07-19 00:00:00',NULL,NULL),(5,'cuenta1','c1','','admin','2015-03-22 00:00:00',NULL,NULL),(6,'CUENTAS DE ORDEN','0','',NULL,NULL,NULL,NULL),(7,'Bienes y valores entregados','1','',NULL,NULL,NULL,NULL),(8,'Derechos sobre instrumentos financieros','2','',NULL,NULL,NULL,NULL),(9,'Otras cuentas de orden deudoras','3','',NULL,NULL,NULL,NULL),(10,'Gastos depreciación','3901','',NULL,NULL,NULL,NULL),(11,'Deudoras por contra','4','',NULL,NULL,NULL,NULL),(12,'Bienes y valores recibidos','6','',NULL,NULL,NULL,NULL),(13,'Compromisos sobre instrumentos financieros','7','',NULL,NULL,NULL,NULL),(14,'Otras cuentas de orden acreedoras','8','',NULL,NULL,NULL,NULL),(15,'Gastos depreciacion','8901','',NULL,NULL,NULL,NULL),(16,'Acreedoras por contra','9','',NULL,NULL,NULL,NULL),(17,'ACTIVO','1','',NULL,NULL,NULL,NULL),(18,'EFECTIVO Y EQUIVALENTES DE EFECTIVO.','10','',NULL,NULL,NULL,NULL),(19,'CAJA.','101','',NULL,NULL,NULL,NULL),(20,'CAJA - M.N.  NS.','1011','',NULL,NULL,NULL,NULL),(21,'CAJA PRINCIPAL - M.N. NS.','101101','',NULL,NULL,NULL,NULL),(22,'FONDOS FIJOS.','102','',NULL,NULL,NULL,NULL),(23,'FONDO FIJO - M.N.  NS.','1021','',NULL,NULL,NULL,NULL),(24,'FONDO FIJO - M.N. NS. - TRUJILLO','102101','',NULL,NULL,NULL,NULL),(25,'FONDO FIJO - M.E.  US$.','1022','',NULL,NULL,NULL,NULL),(26,'EFECTIVO EN TRANSITO.','103','',NULL,NULL,NULL,NULL),(27,'EFECTIVO EN TRANSITO - M.N.  NS.','1031','',NULL,NULL,NULL,NULL),(28,'EFECTIVO EN TRANSITO - M.N. NS.','103101','',NULL,NULL,NULL,NULL),(29,'EFECTIVO EN TRANSITO - M.E.  US$.','1032','',NULL,NULL,NULL,NULL);
/*!40000 ALTER TABLE `cuenta` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `detalleasiento`
--

DROP TABLE IF EXISTS `detalleasiento`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `detalleasiento` (
  `iddetalleasiento` int(11) NOT NULL AUTO_INCREMENT,
  `idAsiento` int(11) NOT NULL,
  `idCentroCosto` int(11) DEFAULT NULL,
  `idCuenta` int(11) DEFAULT NULL,
  `CargoMN` decimal(8,2) DEFAULT NULL,
  `AbonoMN` decimal(8,2) DEFAULT NULL,
  `CargoME` decimal(8,2) DEFAULT NULL,
  `AbonoME` decimal(8,2) DEFAULT NULL,
  `Glosa` varchar(200) DEFAULT NULL,
  `Activo` bit(1) DEFAULT b'1',
  `Usuario` varchar(20) DEFAULT NULL,
  `FechaRegistro` datetime DEFAULT NULL,
  `UsuarioModificacion` varchar(20) DEFAULT NULL,
  `FechaModificacion` datetime DEFAULT NULL,
  PRIMARY KEY (`iddetalleasiento`),
  KEY `fk_detalleasiento_Asiento1_idx` (`idAsiento`),
  KEY `fk_detalleasiento_centrocosto1_idx` (`idCentroCosto`),
  KEY `fk_detalleasiento_Cuenta1_idx` (`idCuenta`),
  CONSTRAINT `fk_detalleasiento_Asiento1` FOREIGN KEY (`idAsiento`) REFERENCES `asiento` (`idAsiento`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_detalleasiento_Cuenta1` FOREIGN KEY (`idCuenta`) REFERENCES `cuenta` (`idCuenta`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_detalleasiento_centrocosto1` FOREIGN KEY (`idCentroCosto`) REFERENCES `centrocosto` (`idCentroCosto`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=228 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `detalleasiento`
--

LOCK TABLES `detalleasiento` WRITE;
/*!40000 ALTER TABLE `detalleasiento` DISABLE KEYS */;
INSERT INTO `detalleasiento` VALUES (1,14,1,3,100.00,100.00,30.00,30.00,'primero','',NULL,NULL,NULL,NULL),(2,14,2,10,80.00,80.00,20.00,20.00,'segundo','',NULL,NULL,NULL,NULL),(3,15,1,3,100.00,100.00,30.00,30.00,'primero','',NULL,NULL,NULL,NULL),(4,15,2,10,80.00,80.00,20.00,20.00,'segundo','',NULL,NULL,NULL,NULL),(5,54,1,3,40.00,0.00,128.00,0.00,'comentario del subdiario','',NULL,NULL,NULL,NULL),(6,54,1,4,40.00,0.00,128.00,0.00,'comentario del subdiario','',NULL,NULL,NULL,NULL),(7,54,1,10,40.00,0.00,128.00,0.00,'comentario del subdiario','',NULL,NULL,NULL,NULL),(8,54,1,10,0.00,40.00,0.00,128.00,'comentario del subdiario','',NULL,NULL,NULL,NULL),(9,54,2,5,0.00,40.00,0.00,128.00,'comentario del subdiario','',NULL,NULL,NULL,NULL),(10,54,2,6,0.00,40.00,0.00,128.00,'comentario del subdiario','',NULL,NULL,NULL,NULL),(11,54,1,3,40.00,0.00,128.00,0.00,'comentario del subdiario','',NULL,NULL,NULL,NULL),(12,54,1,4,40.00,0.00,128.00,0.00,'comentario del subdiario','',NULL,NULL,NULL,NULL),(13,54,1,10,40.00,0.00,128.00,0.00,'comentario del subdiario','',NULL,NULL,NULL,NULL),(14,54,1,10,0.00,40.00,0.00,128.00,'comentario del subdiario','',NULL,NULL,NULL,NULL),(15,54,2,5,0.00,40.00,0.00,128.00,'comentario del subdiario','',NULL,NULL,NULL,NULL),(16,54,2,6,0.00,40.00,0.00,128.00,'comentario del subdiario','',NULL,NULL,NULL,NULL),(20,54,1,3,15.00,0.00,48.00,0.00,'comentario del subdiario','',NULL,NULL,NULL,NULL),(21,54,1,4,15.00,0.00,48.00,0.00,'comentario del subdiario','',NULL,NULL,NULL,NULL),(22,54,1,10,15.00,0.00,48.00,0.00,'comentario del subdiario','',NULL,NULL,NULL,NULL),(23,54,1,10,0.00,15.00,0.00,48.00,'comentario del subdiario','',NULL,NULL,NULL,NULL),(24,54,2,5,0.00,15.00,0.00,48.00,'comentario del subdiario','',NULL,NULL,NULL,NULL),(25,54,2,6,0.00,15.00,0.00,48.00,'comentario del subdiario','',NULL,NULL,NULL,NULL),(26,54,1,3,15.00,0.00,48.00,0.00,'comentario del subdiario','',NULL,NULL,NULL,NULL),(27,54,1,4,15.00,0.00,48.00,0.00,'comentario del subdiario','',NULL,NULL,NULL,NULL),(28,54,1,10,15.00,0.00,48.00,0.00,'comentario del subdiario','',NULL,NULL,NULL,NULL),(29,54,1,10,0.00,15.00,0.00,48.00,'comentario del subdiario','',NULL,NULL,NULL,NULL),(30,54,2,5,0.00,15.00,0.00,48.00,'comentario del subdiario','',NULL,NULL,NULL,NULL),(31,54,2,6,0.00,15.00,0.00,48.00,'comentario del subdiario','',NULL,NULL,NULL,NULL),(32,55,1,3,40.00,0.00,128.00,0.00,'comentario del subdiario','',NULL,NULL,NULL,NULL),(33,55,1,4,40.00,0.00,128.00,0.00,'comentario del subdiario','',NULL,NULL,NULL,NULL),(34,55,1,10,40.00,0.00,128.00,0.00,'comentario del subdiario','',NULL,NULL,NULL,NULL),(35,55,1,10,0.00,40.00,0.00,128.00,'comentario del subdiario','',NULL,NULL,NULL,NULL),(36,55,2,5,0.00,40.00,0.00,128.00,'comentario del subdiario','',NULL,NULL,NULL,NULL),(37,55,2,6,0.00,40.00,0.00,128.00,'comentario del subdiario','',NULL,NULL,NULL,NULL),(38,55,1,3,40.00,0.00,128.00,0.00,'comentario del subdiario','',NULL,NULL,NULL,NULL),(39,55,1,4,40.00,0.00,128.00,0.00,'comentario del subdiario','',NULL,NULL,NULL,NULL),(40,55,1,10,40.00,0.00,128.00,0.00,'comentario del subdiario','',NULL,NULL,NULL,NULL),(41,55,1,10,0.00,40.00,0.00,128.00,'comentario del subdiario','',NULL,NULL,NULL,NULL),(42,55,2,5,0.00,40.00,0.00,128.00,'comentario del subdiario','',NULL,NULL,NULL,NULL),(43,55,2,6,0.00,40.00,0.00,128.00,'comentario del subdiario','',NULL,NULL,NULL,NULL),(47,55,1,3,15.00,0.00,48.00,0.00,'comentario del subdiario','',NULL,NULL,NULL,NULL),(48,55,1,4,15.00,0.00,48.00,0.00,'comentario del subdiario','',NULL,NULL,NULL,NULL),(49,55,1,10,15.00,0.00,48.00,0.00,'comentario del subdiario','',NULL,NULL,NULL,NULL),(50,55,1,10,0.00,15.00,0.00,48.00,'comentario del subdiario','',NULL,NULL,NULL,NULL),(51,55,2,5,0.00,15.00,0.00,48.00,'comentario del subdiario','',NULL,NULL,NULL,NULL),(52,55,2,6,0.00,15.00,0.00,48.00,'comentario del subdiario','',NULL,NULL,NULL,NULL),(53,55,1,3,15.00,0.00,48.00,0.00,'comentario del subdiario','',NULL,NULL,NULL,NULL),(54,55,1,4,15.00,0.00,48.00,0.00,'comentario del subdiario','',NULL,NULL,NULL,NULL),(55,55,1,10,15.00,0.00,48.00,0.00,'comentario del subdiario','',NULL,NULL,NULL,NULL),(56,55,1,10,0.00,15.00,0.00,48.00,'comentario del subdiario','',NULL,NULL,NULL,NULL),(57,55,2,5,0.00,15.00,0.00,48.00,'comentario del subdiario','',NULL,NULL,NULL,NULL),(58,55,2,6,0.00,15.00,0.00,48.00,'comentario del subdiario','',NULL,NULL,NULL,NULL),(77,56,1,3,40.00,0.00,128.00,0.00,'comentario del subdiario','',NULL,NULL,NULL,NULL),(78,56,1,4,40.00,0.00,128.00,0.00,'comentario del subdiario','',NULL,NULL,NULL,NULL),(79,56,1,10,40.00,0.00,128.00,0.00,'comentario del subdiario','',NULL,NULL,NULL,NULL),(80,56,1,10,0.00,40.00,0.00,128.00,'comentario del subdiario','',NULL,NULL,NULL,NULL),(81,56,2,5,0.00,40.00,0.00,128.00,'comentario del subdiario','',NULL,NULL,NULL,NULL),(82,56,2,6,0.00,40.00,0.00,128.00,'comentario del subdiario','',NULL,NULL,NULL,NULL),(83,56,1,3,40.00,0.00,128.00,0.00,'comentario del subdiario','',NULL,NULL,NULL,NULL),(84,56,1,4,40.00,0.00,128.00,0.00,'comentario del subdiario','',NULL,NULL,NULL,NULL),(85,56,1,10,40.00,0.00,128.00,0.00,'comentario del subdiario','',NULL,NULL,NULL,NULL),(86,56,1,10,0.00,40.00,0.00,128.00,'comentario del subdiario','',NULL,NULL,NULL,NULL),(87,56,2,5,0.00,40.00,0.00,128.00,'comentario del subdiario','',NULL,NULL,NULL,NULL),(88,56,2,6,0.00,40.00,0.00,128.00,'comentario del subdiario','',NULL,NULL,NULL,NULL),(92,56,1,3,174.00,0.00,556.80,0.00,'comentario del subdiario','',NULL,NULL,NULL,NULL),(93,56,1,4,174.00,0.00,556.80,0.00,'comentario del subdiario','',NULL,NULL,NULL,NULL),(94,56,1,10,174.00,0.00,556.80,0.00,'comentario del subdiario','',NULL,NULL,NULL,NULL),(95,56,1,10,0.00,174.00,0.00,556.80,'comentario del subdiario','',NULL,NULL,NULL,NULL),(96,56,2,5,0.00,174.00,0.00,556.80,'comentario del subdiario','',NULL,NULL,NULL,NULL),(97,56,2,6,0.00,174.00,0.00,556.80,'comentario del subdiario','',NULL,NULL,NULL,NULL),(98,56,1,3,174.00,0.00,556.80,0.00,'comentario del subdiario','',NULL,NULL,NULL,NULL),(99,56,1,4,174.00,0.00,556.80,0.00,'comentario del subdiario','',NULL,NULL,NULL,NULL),(100,56,1,10,174.00,0.00,556.80,0.00,'comentario del subdiario','',NULL,NULL,NULL,NULL),(101,56,1,10,0.00,174.00,0.00,556.80,'comentario del subdiario','',NULL,NULL,NULL,NULL),(102,56,2,5,0.00,174.00,0.00,556.80,'comentario del subdiario','',NULL,NULL,NULL,NULL),(103,56,2,6,0.00,174.00,0.00,556.80,'comentario del subdiario','',NULL,NULL,NULL,NULL),(107,57,1,3,40.00,0.00,128.00,0.00,'comentario del subdiario','\0',NULL,NULL,NULL,NULL),(108,57,1,4,40.00,0.00,128.00,0.00,'comentario del subdiario','\0',NULL,NULL,NULL,NULL),(109,57,1,10,40.00,0.00,128.00,0.00,'comentario del subdiario','\0',NULL,NULL,NULL,NULL),(110,57,1,10,0.00,40.00,0.00,128.00,'comentario del subdiario','\0',NULL,NULL,NULL,NULL),(111,57,2,5,0.00,40.00,0.00,128.00,'comentario del subdiario','\0',NULL,NULL,NULL,NULL),(112,57,2,6,0.00,40.00,0.00,128.00,'comentario del subdiario','\0',NULL,NULL,NULL,NULL),(113,57,1,3,40.00,0.00,128.00,0.00,'comentario del subdiario','\0',NULL,NULL,NULL,NULL),(114,57,1,4,40.00,0.00,128.00,0.00,'comentario del subdiario','\0',NULL,NULL,NULL,NULL),(115,57,1,10,40.00,0.00,128.00,0.00,'comentario del subdiario','\0',NULL,NULL,NULL,NULL),(116,57,1,10,0.00,40.00,0.00,128.00,'comentario del subdiario','\0',NULL,NULL,NULL,NULL),(117,57,2,5,0.00,40.00,0.00,128.00,'comentario del subdiario','\0',NULL,NULL,NULL,NULL),(118,57,2,6,0.00,40.00,0.00,128.00,'comentario del subdiario','\0',NULL,NULL,NULL,NULL),(122,57,1,3,250.00,0.00,800.00,0.00,'comentario del subdiario','\0',NULL,NULL,NULL,NULL),(123,57,1,4,250.00,0.00,800.00,0.00,'comentario del subdiario','\0',NULL,NULL,NULL,NULL),(124,57,1,10,250.00,0.00,800.00,0.00,'comentario del subdiario','\0',NULL,NULL,NULL,NULL),(125,57,1,10,0.00,250.00,0.00,800.00,'comentario del subdiario','\0',NULL,NULL,NULL,NULL),(126,57,2,5,0.00,250.00,0.00,800.00,'comentario del subdiario','\0',NULL,NULL,NULL,NULL),(127,57,2,6,0.00,250.00,0.00,800.00,'comentario del subdiario','\0',NULL,NULL,NULL,NULL),(128,57,1,3,250.00,0.00,800.00,0.00,'comentario del subdiario','\0',NULL,NULL,NULL,NULL),(129,57,1,4,250.00,0.00,800.00,0.00,'comentario del subdiario','\0',NULL,NULL,NULL,NULL),(130,57,1,10,250.00,0.00,800.00,0.00,'comentario del subdiario','\0',NULL,NULL,NULL,NULL),(131,57,1,10,0.00,250.00,0.00,800.00,'comentario del subdiario','\0',NULL,NULL,NULL,NULL),(132,57,2,5,0.00,250.00,0.00,800.00,'comentario del subdiario','\0',NULL,NULL,NULL,NULL),(133,57,2,6,0.00,250.00,0.00,800.00,'comentario del subdiario','\0',NULL,NULL,NULL,NULL),(137,57,1,3,40.00,0.00,128.00,0.00,'comentario del subdiario','',NULL,NULL,NULL,NULL),(138,57,1,4,40.00,0.00,128.00,0.00,'comentario del subdiario','',NULL,NULL,NULL,NULL),(139,57,1,10,40.00,0.00,128.00,0.00,'comentario del subdiario','',NULL,NULL,NULL,NULL),(140,57,1,10,0.00,40.00,0.00,128.00,'comentario del subdiario','',NULL,NULL,NULL,NULL),(141,57,2,5,0.00,40.00,0.00,128.00,'comentario del subdiario','',NULL,NULL,NULL,NULL),(142,57,2,6,0.00,40.00,0.00,128.00,'comentario del subdiario','',NULL,NULL,NULL,NULL),(143,57,1,3,40.00,0.00,128.00,0.00,'comentario del subdiario','',NULL,NULL,NULL,NULL),(144,57,1,4,40.00,0.00,128.00,0.00,'comentario del subdiario','',NULL,NULL,NULL,NULL),(145,57,1,10,40.00,0.00,128.00,0.00,'comentario del subdiario','',NULL,NULL,NULL,NULL),(146,57,1,10,0.00,40.00,0.00,128.00,'comentario del subdiario','',NULL,NULL,NULL,NULL),(147,57,2,5,0.00,40.00,0.00,128.00,'comentario del subdiario','',NULL,NULL,NULL,NULL),(148,57,2,6,0.00,40.00,0.00,128.00,'comentario del subdiario','',NULL,NULL,NULL,NULL),(149,60,1,3,240.00,0.00,768.00,0.00,'comentario del subdiario','',NULL,NULL,NULL,NULL),(150,60,1,4,240.00,0.00,768.00,0.00,'comentario del subdiario','',NULL,NULL,NULL,NULL),(151,60,1,10,240.00,0.00,768.00,0.00,'comentario del subdiario','',NULL,NULL,NULL,NULL),(152,60,1,10,0.00,240.00,0.00,768.00,'comentario del subdiario','',NULL,NULL,NULL,NULL),(153,60,2,5,0.00,240.00,0.00,768.00,'comentario del subdiario','',NULL,NULL,NULL,NULL),(154,60,2,6,0.00,240.00,0.00,768.00,'comentario del subdiario','',NULL,NULL,NULL,NULL),(155,60,1,3,240.00,0.00,768.00,0.00,'comentario del subdiario','',NULL,NULL,NULL,NULL),(156,60,1,4,240.00,0.00,768.00,0.00,'comentario del subdiario','',NULL,NULL,NULL,NULL),(157,60,1,10,240.00,0.00,768.00,0.00,'comentario del subdiario','',NULL,NULL,NULL,NULL),(158,60,1,10,0.00,240.00,0.00,768.00,'comentario del subdiario','',NULL,NULL,NULL,NULL),(159,60,2,5,0.00,240.00,0.00,768.00,'comentario del subdiario','',NULL,NULL,NULL,NULL),(160,60,2,6,0.00,240.00,0.00,768.00,'comentario del subdiario','',NULL,NULL,NULL,NULL),(161,60,1,3,240.00,0.00,768.00,0.00,'comentario del subdiario','',NULL,NULL,NULL,NULL),(162,60,1,10,0.00,240.00,0.00,768.00,'comentario del subdiario','',NULL,NULL,NULL,NULL),(164,61,1,3,240.00,0.00,768.00,0.00,'comentario del subdiario','',NULL,NULL,NULL,NULL),(165,61,1,4,240.00,0.00,768.00,0.00,'comentario del subdiario','',NULL,NULL,NULL,NULL),(166,61,1,10,240.00,0.00,768.00,0.00,'comentario del subdiario','',NULL,NULL,NULL,NULL),(167,61,1,10,0.00,240.00,0.00,768.00,'comentario del subdiario','',NULL,NULL,NULL,NULL),(168,61,2,5,0.00,240.00,0.00,768.00,'comentario del subdiario','',NULL,NULL,NULL,NULL),(169,61,2,6,0.00,240.00,0.00,768.00,'comentario del subdiario','',NULL,NULL,NULL,NULL),(170,61,1,3,240.00,0.00,768.00,0.00,'comentario del subdiario','',NULL,NULL,NULL,NULL),(171,61,1,4,240.00,0.00,768.00,0.00,'comentario del subdiario','',NULL,NULL,NULL,NULL),(172,61,1,10,240.00,0.00,768.00,0.00,'comentario del subdiario','',NULL,NULL,NULL,NULL),(173,61,1,10,0.00,240.00,0.00,768.00,'comentario del subdiario','',NULL,NULL,NULL,NULL),(174,61,2,5,0.00,240.00,0.00,768.00,'comentario del subdiario','',NULL,NULL,NULL,NULL),(175,61,2,6,0.00,240.00,0.00,768.00,'comentario del subdiario','',NULL,NULL,NULL,NULL),(176,61,1,3,240.00,0.00,768.00,0.00,'comentario del subdiario','',NULL,NULL,NULL,NULL),(177,61,1,10,0.00,240.00,0.00,768.00,'comentario del subdiario','',NULL,NULL,NULL,NULL),(179,62,1,3,240.00,0.00,768.00,0.00,'comentario del subdiario','',NULL,NULL,NULL,NULL),(180,62,1,4,240.00,0.00,768.00,0.00,'comentario del subdiario','',NULL,NULL,NULL,NULL),(181,62,1,10,240.00,0.00,768.00,0.00,'comentario del subdiario','',NULL,NULL,NULL,NULL),(182,62,1,10,0.00,240.00,0.00,768.00,'comentario del subdiario','',NULL,NULL,NULL,NULL),(183,62,2,5,0.00,240.00,0.00,768.00,'comentario del subdiario','',NULL,NULL,NULL,NULL),(184,62,2,6,0.00,240.00,0.00,768.00,'comentario del subdiario','',NULL,NULL,NULL,NULL),(185,62,1,3,240.00,0.00,768.00,0.00,'comentario del subdiario','',NULL,NULL,NULL,NULL),(186,62,1,4,240.00,0.00,768.00,0.00,'comentario del subdiario','',NULL,NULL,NULL,NULL),(187,62,1,10,240.00,0.00,768.00,0.00,'comentario del subdiario','',NULL,NULL,NULL,NULL),(188,62,1,10,0.00,240.00,0.00,768.00,'comentario del subdiario','',NULL,NULL,NULL,NULL),(189,62,2,5,0.00,240.00,0.00,768.00,'comentario del subdiario','',NULL,NULL,NULL,NULL),(190,62,2,6,0.00,240.00,0.00,768.00,'comentario del subdiario','',NULL,NULL,NULL,NULL),(191,62,1,3,240.00,0.00,768.00,0.00,'comentario del subdiario','',NULL,NULL,NULL,NULL),(192,62,1,10,0.00,240.00,0.00,768.00,'comentario del subdiario','',NULL,NULL,NULL,NULL),(194,63,1,3,240.00,0.00,768.00,0.00,'comentario del subdiario','',NULL,NULL,NULL,NULL),(195,63,1,4,240.00,0.00,768.00,0.00,'comentario del subdiario','',NULL,NULL,NULL,NULL),(196,63,1,10,240.00,0.00,768.00,0.00,'comentario del subdiario','',NULL,NULL,NULL,NULL),(197,63,1,10,0.00,240.00,0.00,768.00,'comentario del subdiario','',NULL,NULL,NULL,NULL),(198,63,2,5,0.00,240.00,0.00,768.00,'comentario del subdiario','',NULL,NULL,NULL,NULL),(199,63,2,6,0.00,240.00,0.00,768.00,'comentario del subdiario','',NULL,NULL,NULL,NULL),(200,63,1,3,240.00,0.00,768.00,0.00,'comentario del subdiario','',NULL,NULL,NULL,NULL),(201,63,1,4,240.00,0.00,768.00,0.00,'comentario del subdiario','',NULL,NULL,NULL,NULL),(202,63,1,10,240.00,0.00,768.00,0.00,'comentario del subdiario','',NULL,NULL,NULL,NULL),(203,63,1,10,0.00,240.00,0.00,768.00,'comentario del subdiario','',NULL,NULL,NULL,NULL),(204,63,2,5,0.00,240.00,0.00,768.00,'comentario del subdiario','',NULL,NULL,NULL,NULL),(205,63,2,6,0.00,240.00,0.00,768.00,'comentario del subdiario','',NULL,NULL,NULL,NULL),(206,63,1,3,240.00,0.00,768.00,0.00,'comentario del subdiario','',NULL,NULL,NULL,NULL),(207,63,1,10,0.00,240.00,0.00,768.00,'comentario del subdiario','',NULL,NULL,NULL,NULL),(209,64,1,3,240.00,0.00,768.00,0.00,'comentario del subdiario','',NULL,NULL,NULL,NULL),(210,64,1,4,240.00,0.00,768.00,0.00,'comentario del subdiario','',NULL,NULL,NULL,NULL),(211,64,1,10,240.00,0.00,768.00,0.00,'comentario del subdiario','',NULL,NULL,NULL,NULL),(212,64,1,10,0.00,240.00,0.00,768.00,'comentario del subdiario','',NULL,NULL,NULL,NULL),(213,64,2,5,0.00,240.00,0.00,768.00,'comentario del subdiario','',NULL,NULL,NULL,NULL),(214,64,2,6,0.00,240.00,0.00,768.00,'comentario del subdiario','',NULL,NULL,NULL,NULL),(215,64,1,3,240.00,0.00,768.00,0.00,'comentario del subdiario','',NULL,NULL,NULL,NULL),(216,64,1,4,240.00,0.00,768.00,0.00,'comentario del subdiario','',NULL,NULL,NULL,NULL),(217,64,1,10,240.00,0.00,768.00,0.00,'comentario del subdiario','',NULL,NULL,NULL,NULL),(218,64,1,10,0.00,240.00,0.00,768.00,'comentario del subdiario','',NULL,NULL,NULL,NULL),(219,64,2,5,0.00,240.00,0.00,768.00,'comentario del subdiario','',NULL,NULL,NULL,NULL),(220,64,2,6,0.00,240.00,0.00,768.00,'comentario del subdiario','',NULL,NULL,NULL,NULL),(221,64,1,3,240.00,0.00,768.00,0.00,'comentario del subdiario','',NULL,NULL,NULL,NULL),(222,64,1,10,0.00,240.00,0.00,768.00,'comentario del subdiario','',NULL,NULL,NULL,NULL),(224,65,1,3,240.00,0.00,768.00,0.00,'comentario del subdiario','\0',NULL,NULL,NULL,NULL),(225,65,1,10,0.00,240.00,0.00,768.00,'comentario del subdiario','\0',NULL,NULL,NULL,NULL),(226,65,1,3,240.00,0.00,768.00,0.00,'comentario del subdiario','',NULL,NULL,NULL,NULL),(227,65,1,10,0.00,240.00,0.00,768.00,'comentario del subdiario','',NULL,NULL,NULL,NULL);
/*!40000 ALTER TABLE `detalleasiento` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `detalleconfiguracion`
--

DROP TABLE IF EXISTS `detalleconfiguracion`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `detalleconfiguracion` (
  `iddetalleconfiguracion` int(11) NOT NULL AUTO_INCREMENT,
  `idConfiguracion` int(11) DEFAULT NULL,
  `idCuenta` int(11) DEFAULT NULL,
  `idCentroCosto` int(11) DEFAULT NULL,
  `Cargo` bit(1) DEFAULT NULL,
  `Activo` bit(1) DEFAULT b'1',
  PRIMARY KEY (`iddetalleconfiguracion`),
  KEY `fk_detalleconfiguracion_Cuenta1_idx` (`idCuenta`),
  KEY `fk_detalleconfiguracion_centrocosto1_idx` (`idCentroCosto`),
  KEY `fk_detalleconfiguracion_configuracion1_idx` (`idConfiguracion`),
  CONSTRAINT `fk_detalleconfiguracion_Cuenta1` FOREIGN KEY (`idCuenta`) REFERENCES `cuenta` (`idCuenta`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_detalleconfiguracion_centrocosto1` FOREIGN KEY (`idCentroCosto`) REFERENCES `centrocosto` (`idCentroCosto`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_detalleconfiguracion_configuracion1` FOREIGN KEY (`idConfiguracion`) REFERENCES `configuracion` (`idConfiguracion`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=96 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `detalleconfiguracion`
--

LOCK TABLES `detalleconfiguracion` WRITE;
/*!40000 ALTER TABLE `detalleconfiguracion` DISABLE KEYS */;
INSERT INTO `detalleconfiguracion` VALUES (70,24,3,1,'','\0'),(71,24,4,1,'','\0'),(72,24,10,1,'','\0'),(73,24,10,1,'\0','\0'),(74,24,5,2,'\0','\0'),(75,24,6,2,'\0','\0'),(76,24,3,1,'','\0'),(77,24,4,1,'','\0'),(78,24,10,1,'','\0'),(79,24,10,1,'\0','\0'),(80,24,5,2,'\0','\0'),(81,24,6,2,'\0','\0'),(82,24,3,1,'',''),(83,24,4,1,'',''),(84,24,10,1,'',''),(85,24,10,1,'\0',''),(86,24,5,2,'\0',''),(87,24,6,2,'\0',''),(88,25,3,1,'',''),(89,25,4,1,'',''),(90,25,10,1,'',''),(91,25,10,1,'\0',''),(92,25,5,2,'\0',''),(93,25,6,2,'\0',''),(94,26,3,1,'',''),(95,26,10,1,'\0','');
/*!40000 ALTER TABLE `detalleconfiguracion` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `detalleconfiguracionalmacen`
--

DROP TABLE IF EXISTS `detalleconfiguracionalmacen`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `detalleconfiguracionalmacen` (
  `iddetalleconfiguracionalmacen` int(11) NOT NULL AUTO_INCREMENT,
  `idconfiguracionalmacen` int(11) DEFAULT NULL,
  `idCuenta` int(11) DEFAULT NULL,
  `idCentroCosto` int(11) DEFAULT NULL,
  `Activo` bit(1) DEFAULT b'1',
  PRIMARY KEY (`iddetalleconfiguracionalmacen`),
  KEY `fk_detalleconfiguracionalmacen_configuracionalmacen1_idx` (`idconfiguracionalmacen`),
  KEY `fk_detalleconfiguracionalmacen_Cuenta1_idx` (`idCuenta`),
  KEY `fk_detalleconfiguracionalmacen_centrocosto1_idx` (`idCentroCosto`),
  CONSTRAINT `fk_detalleconfiguracionalmacen_Cuenta1` FOREIGN KEY (`idCuenta`) REFERENCES `cuenta` (`idCuenta`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_detalleconfiguracionalmacen_centrocosto1` FOREIGN KEY (`idCentroCosto`) REFERENCES `centrocosto` (`idCentroCosto`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_detalleconfiguracionalmacen_configuracionalmacen1` FOREIGN KEY (`idconfiguracionalmacen`) REFERENCES `configuracionalmacen` (`idconfiguracionalmacen`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `detalleconfiguracionalmacen`
--

LOCK TABLES `detalleconfiguracionalmacen` WRITE;
/*!40000 ALTER TABLE `detalleconfiguracionalmacen` DISABLE KEYS */;
INSERT INTO `detalleconfiguracionalmacen` VALUES (1,3,3,1,'\0'),(2,3,4,2,'\0'),(3,3,3,1,''),(4,3,4,2,''),(5,3,4,1,''),(6,1,3,1,'\0'),(7,1,4,2,'\0'),(8,1,3,1,'');
/*!40000 ALTER TABLE `detalleconfiguracionalmacen` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `detallefactura`
--

DROP TABLE IF EXISTS `detallefactura`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `detallefactura` (
  `idDetalleFactura` int(11) NOT NULL AUTO_INCREMENT,
  `idFactura` int(11) NOT NULL,
  `idProducto` int(11) NOT NULL,
  `Cantidad` smallint(6) DEFAULT NULL,
  `Precio` decimal(8,2) DEFAULT NULL,
  `SubTotal` decimal(8,2) DEFAULT NULL,
  `Activo` bit(1) DEFAULT b'1',
  `Usuario` varchar(20) DEFAULT NULL,
  `FechaRegistro` datetime DEFAULT NULL,
  `UsuarioModificacion` varchar(20) DEFAULT NULL,
  `FechaModificacion` datetime DEFAULT NULL,
  PRIMARY KEY (`idDetalleFactura`),
  KEY `fk_DetalleFactura_producto1_idx` (`idProducto`),
  KEY `fk_DetalleFactura_Factura1_idx` (`idFactura`),
  CONSTRAINT `fk_DetalleFactura_Factura1` FOREIGN KEY (`idFactura`) REFERENCES `factura` (`idFactura`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_DetalleFactura_producto1` FOREIGN KEY (`idProducto`) REFERENCES `producto` (`idProducto`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `detallefactura`
--

LOCK TABLES `detallefactura` WRITE;
/*!40000 ALTER TABLE `detallefactura` DISABLE KEYS */;
INSERT INTO `detallefactura` VALUES (1,10,5,3,34.00,102.00,'\0','admin','2014-08-09 00:00:00','admin','2014-08-09 00:00:00'),(2,10,10,5,65.00,325.00,'\0','admin','2014-08-09 00:00:00','admin','2014-08-09 00:00:00'),(3,10,5,3,34.00,102.00,'\0','admin','2014-08-09 00:00:00','admin','2014-08-09 00:00:00'),(4,10,10,5,65.00,325.00,'\0','admin','2014-08-09 00:00:00','admin','2014-08-09 00:00:00'),(5,10,5,3,34.00,102.00,'','admin','2014-08-09 00:00:00',NULL,NULL),(6,10,10,5,65.00,325.00,'','admin','2014-08-09 00:00:00',NULL,NULL);
/*!40000 ALTER TABLE `detallefactura` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `detalleguia`
--

DROP TABLE IF EXISTS `detalleguia`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `detalleguia` (
  `idDetalleGuia` int(11) NOT NULL AUTO_INCREMENT,
  `idGuia` int(11) DEFAULT NULL,
  `idProducto` int(11) DEFAULT NULL,
  `Cantidad` smallint(6) DEFAULT NULL,
  `Precio` decimal(8,2) DEFAULT NULL,
  `SubTotal` decimal(8,2) DEFAULT NULL,
  `Activo` bit(1) DEFAULT b'1',
  `Usuario` varchar(20) DEFAULT NULL,
  `FechaRegistro` datetime DEFAULT NULL,
  `UsuarioModificacion` varchar(20) DEFAULT NULL,
  `FechaModificacion` datetime DEFAULT NULL,
  PRIMARY KEY (`idDetalleGuia`),
  KEY `fk_DetalleGuia_Guia1_idx` (`idGuia`),
  KEY `fk_DetalleGuia_producto1_idx` (`idProducto`),
  CONSTRAINT `fk_DetalleGuia_Guia1` FOREIGN KEY (`idGuia`) REFERENCES `guia` (`idGuia`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_DetalleGuia_producto1` FOREIGN KEY (`idProducto`) REFERENCES `producto` (`idProducto`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `detalleguia`
--

LOCK TABLES `detalleguia` WRITE;
/*!40000 ALTER TABLE `detalleguia` DISABLE KEYS */;
INSERT INTO `detalleguia` VALUES (1,8,2,5,5.00,25.00,'\0','admin','2014-11-28 00:00:00','admin','2014-11-28 00:00:00'),(2,8,6,2,2.00,4.00,'\0','admin','2014-11-28 00:00:00','admin','2014-11-28 00:00:00'),(3,8,2,5,5.00,25.00,'','admin','2014-11-28 00:00:00',NULL,NULL),(4,8,9,3,3.00,9.00,'','admin','2014-11-28 00:00:00',NULL,NULL);
/*!40000 ALTER TABLE `detalleguia` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `detalleprovision`
--

DROP TABLE IF EXISTS `detalleprovision`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `detalleprovision` (
  `idDetalleProvision` int(11) NOT NULL AUTO_INCREMENT,
  `idProvision` int(11) DEFAULT NULL,
  `idIngreso` int(11) DEFAULT NULL,
  `idCuenta` int(11) DEFAULT NULL,
  `idCentroCosto` int(11) DEFAULT NULL,
  `idOrdenProduccion` int(11) DEFAULT NULL,
  `Importe` decimal(8,2) DEFAULT NULL,
  `Activo` bit(1) DEFAULT b'1',
  `Usuario` varchar(20) DEFAULT NULL,
  `FechaRegistro` datetime DEFAULT NULL,
  `UsuarioModificacion` varchar(20) DEFAULT NULL,
  `FechaModificacion` datetime DEFAULT NULL,
  `Descripcion` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`idDetalleProvision`),
  KEY `fk_DetalleProvision_ingreso1_idx` (`idIngreso`),
  KEY `fk_DetalleProvision_Cuenta1_idx` (`idCuenta`),
  KEY `fk_DetalleProvision_centrocosto1_idx` (`idCentroCosto`),
  KEY `fk_DetalleProvision_provision1_idx` (`idProvision`),
  KEY `fk_DetalleProvision_ordenproduccion1_idx` (`idOrdenProduccion`),
  CONSTRAINT `fk_DetalleProvision_Cuenta1` FOREIGN KEY (`idCuenta`) REFERENCES `cuenta` (`idCuenta`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_DetalleProvision_centrocosto1` FOREIGN KEY (`idCentroCosto`) REFERENCES `centrocosto` (`idCentroCosto`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_DetalleProvision_ingreso1` FOREIGN KEY (`idIngreso`) REFERENCES `ingreso` (`idIngreso`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_DetalleProvision_ordenproduccion1` FOREIGN KEY (`idOrdenProduccion`) REFERENCES `ordenproduccion` (`idOrdenProduccion`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_DetalleProvision_provision1` FOREIGN KEY (`idProvision`) REFERENCES `provision` (`idProvision`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=63 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `detalleprovision`
--

LOCK TABLES `detalleprovision` WRITE;
/*!40000 ALTER TABLE `detalleprovision` DISABLE KEYS */;
INSERT INTO `detalleprovision` VALUES (1,43,11,3,1,NULL,10.00,'','admin','2014-07-20 00:00:00',NULL,NULL,NULL),(2,43,10,3,1,NULL,9.00,'','admin','2014-07-20 00:00:00',NULL,NULL,NULL),(3,44,NULL,3,1,NULL,521554.00,'\0','admin','2014-07-22 00:00:00',NULL,NULL,NULL),(4,44,NULL,3,1,NULL,521554.00,'\0','admin','2014-07-25 00:00:00',NULL,NULL,NULL),(5,44,6,3,1,NULL,2222.00,'\0','admin','2014-07-25 00:00:00',NULL,NULL,NULL),(6,44,NULL,3,1,NULL,521554.00,'\0','admin','2014-07-26 00:00:00',NULL,NULL,NULL),(7,44,6,3,1,NULL,2222.00,'\0','admin','2014-07-26 00:00:00',NULL,NULL,NULL),(8,44,NULL,3,1,NULL,521554.00,'\0','admin','2014-07-26 00:00:00',NULL,NULL,NULL),(9,44,6,3,1,NULL,2222.00,'\0','admin','2014-07-26 00:00:00',NULL,NULL,NULL),(10,44,NULL,3,1,NULL,521554.00,'\0','admin','2015-01-07 00:00:00',NULL,NULL,NULL),(11,44,6,3,1,NULL,2222.00,'\0','admin','2015-01-07 00:00:00',NULL,NULL,NULL),(12,44,NULL,4,2,NULL,63.00,'\0','admin','2015-01-07 00:00:00',NULL,NULL,NULL),(13,44,NULL,3,1,NULL,212.00,'\0','admin','2015-04-26 00:00:00',NULL,NULL,NULL),(14,44,NULL,4,2,NULL,55.00,'\0','admin','2015-04-26 00:00:00',NULL,NULL,NULL),(15,44,NULL,3,1,NULL,212.00,'\0','admin','2015-04-26 00:00:00',NULL,NULL,NULL),(16,44,NULL,4,2,NULL,55.00,'\0','admin','2015-04-26 00:00:00',NULL,NULL,NULL),(17,44,NULL,5,1,NULL,212.00,'\0','admin','2015-04-26 00:00:00',NULL,NULL,NULL),(18,44,NULL,5,1,NULL,55.00,'\0','admin','2015-04-26 00:00:00',NULL,NULL,NULL),(19,44,NULL,3,1,NULL,212.00,'\0','admin','2015-04-26 00:00:00',NULL,NULL,NULL),(20,44,NULL,3,1,NULL,55.00,'\0','admin','2015-04-26 00:00:00',NULL,NULL,NULL),(21,44,NULL,3,1,NULL,212.00,'\0','admin','2015-04-26 00:00:00',NULL,NULL,NULL),(22,44,NULL,3,1,NULL,55.00,'\0','admin','2015-04-26 00:00:00',NULL,NULL,NULL),(23,44,NULL,3,2,NULL,212.00,'\0','admin','2015-04-26 00:00:00',NULL,NULL,NULL),(24,44,NULL,3,2,NULL,55.00,'\0','admin','2015-04-26 00:00:00',NULL,NULL,NULL),(25,44,10,3,2,NULL,212.00,'\0','admin','2015-04-26 00:00:00',NULL,NULL,NULL),(26,44,11,3,2,NULL,55.00,'\0','admin','2015-04-26 00:00:00',NULL,NULL,NULL),(27,44,10,3,2,NULL,212.00,'\0','admin','2015-05-17 00:00:00',NULL,NULL,NULL),(28,44,11,3,2,NULL,55.00,'\0','admin','2015-05-17 00:00:00',NULL,NULL,NULL),(29,44,10,3,1,NULL,212.00,'\0','admin','2015-05-17 00:00:00',NULL,NULL,NULL),(31,44,10,3,1,NULL,212.00,'\0','admin','2015-05-17 00:00:00',NULL,NULL,NULL),(32,44,11,4,2,NULL,55.00,'\0','admin','2015-05-17 00:00:00',NULL,NULL,NULL),(33,44,10,3,1,NULL,212.00,'\0','admin','2015-06-25 00:00:00',NULL,NULL,NULL),(34,44,11,4,2,NULL,55.00,'\0','admin','2015-06-25 00:00:00',NULL,NULL,NULL),(35,44,10,3,1,NULL,212.00,'\0','admin','2015-06-25 00:00:00',NULL,NULL,NULL),(36,44,11,4,2,NULL,55.00,'\0','admin','2015-06-25 00:00:00',NULL,NULL,NULL),(37,44,10,3,1,NULL,212.00,'\0','admin','2015-06-25 00:00:00',NULL,NULL,NULL),(38,44,11,4,2,NULL,55.00,'\0','admin','2015-06-25 00:00:00',NULL,NULL,NULL),(39,44,10,3,1,14,212.00,'','admin','2015-06-25 00:00:00',NULL,NULL,'descripcion 1'),(40,44,11,4,2,16,55.00,'','admin','2015-06-25 00:00:00',NULL,NULL,'descripcion 2'),(41,45,6,3,1,13,7.00,'\0','admin','2015-06-25 00:00:00',NULL,NULL,'askdjansdn'),(42,45,7,4,2,14,17.00,'\0','admin','2015-06-25 00:00:00',NULL,NULL,'adsdkakjsfbksjdbkjn'),(43,45,8,5,1,15,17.00,'\0','admin','2015-06-25 00:00:00',NULL,NULL,'sadajksfskjfnkjfnskjl'),(44,45,9,3,1,16,48.00,'\0','admin','2015-06-25 00:00:00',NULL,NULL,'fjsdfkjshdkjfsdk'),(45,45,6,3,1,13,7.00,'','admin','2015-06-25 00:00:00',NULL,NULL,'askdjansdn'),(46,45,9,3,1,16,48.00,'','admin','2015-06-25 00:00:00',NULL,NULL,'fjsdfkjshdkjfsdk'),(47,45,7,4,2,14,17.00,'','admin','2015-06-25 00:00:00',NULL,NULL,'adsdkakjsfbksjdbkjn'),(48,45,8,5,1,15,17.00,'','admin','2015-06-25 00:00:00',NULL,NULL,'sadajksfskjfnkjfnskjl'),(49,46,NULL,3,1,13,0.00,'','admin','2015-06-25 00:00:00',NULL,NULL,'asdakjdfhsdkjfhk'),(50,46,NULL,4,2,14,0.00,'','admin','2015-06-25 00:00:00',NULL,NULL,'asdasdasd'),(51,47,NULL,3,1,13,0.00,'\0','admin','2015-06-25 00:00:00',NULL,NULL,'asdakjdfhsdkjfhk'),(52,47,NULL,4,2,14,0.00,'\0','admin','2015-06-25 00:00:00',NULL,NULL,'asdasdasd'),(53,47,NULL,3,1,13,100.00,'\0','admin','2015-06-25 00:00:00',NULL,NULL,'asdakjdfhsdkjfhk'),(54,47,NULL,4,2,14,100.00,'\0','admin','2015-06-25 00:00:00',NULL,NULL,'asdasdasd'),(55,47,NULL,3,1,13,100.00,'','admin','2015-06-25 00:00:00',NULL,NULL,'asdakjdfhsdkjfhk'),(56,47,NULL,4,2,14,100.00,'','admin','2015-06-25 00:00:00',NULL,NULL,'asdasdasd'),(57,48,NULL,3,1,13,100.00,'\0','admin','2015-06-27 00:00:00',NULL,NULL,'asdakjdfhsdkjfhk'),(58,48,NULL,4,2,14,100.00,'\0','admin','2015-06-27 00:00:00',NULL,NULL,'asdasdasd'),(59,49,NULL,3,1,13,100.00,'','admin','2015-06-27 00:00:00',NULL,NULL,'asdakjdfhsdkjfhk'),(60,49,NULL,4,2,14,100.00,'','admin','2015-06-27 00:00:00',NULL,NULL,'asdasdasd'),(61,48,NULL,3,1,13,100.00,'','admin','2015-06-27 00:00:00',NULL,NULL,'asdakjdfhsdkjfhk'),(62,48,NULL,4,2,14,100.00,'','admin','2015-06-27 00:00:00',NULL,NULL,'asdasdasd');
/*!40000 ALTER TABLE `detalleprovision` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `detalletareo`
--

DROP TABLE IF EXISTS `detalletareo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `detalletareo` (
  `idDetalleTareo` int(11) NOT NULL AUTO_INCREMENT,
  `idTareo` int(11) DEFAULT NULL,
  `idEmpleado` int(11) DEFAULT NULL,
  `idOrdenProduccion` int(11) DEFAULT NULL,
  `idactividad` int(11) DEFAULT NULL,
  `idCentroCosto` int(11) DEFAULT NULL,
  `Descripcion` varchar(150) DEFAULT NULL,
  `HoraInicio` decimal(4,2) DEFAULT NULL,
  `HoraFin` decimal(4,2) DEFAULT NULL,
  `Horas` decimal(4,2) DEFAULT NULL,
  `Activo` bit(1) DEFAULT b'1',
  `Usuario` varchar(20) DEFAULT NULL,
  `FechaRegistro` datetime DEFAULT NULL,
  `UsuarioModificacion` varchar(20) DEFAULT NULL,
  `FechaModificacion` datetime DEFAULT NULL,
  PRIMARY KEY (`idDetalleTareo`),
  KEY `fk_DetalleTareo_empleado1_idx` (`idEmpleado`),
  KEY `fk_DetalleTareo_ordenproduccion1_idx` (`idOrdenProduccion`),
  KEY `fk_DetalleTareo_actividad1_idx` (`idactividad`),
  KEY `fk_DetalleTareo_centrocosto1_idx` (`idCentroCosto`),
  KEY `fk_DetalleTareo_Tareo1_idx` (`idTareo`),
  CONSTRAINT `fk_DetalleTareo_Tareo1` FOREIGN KEY (`idTareo`) REFERENCES `tareo` (`idTareo`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_DetalleTareo_actividad1` FOREIGN KEY (`idactividad`) REFERENCES `actividad` (`idactividad`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_DetalleTareo_centrocosto1` FOREIGN KEY (`idCentroCosto`) REFERENCES `centrocosto` (`idCentroCosto`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_DetalleTareo_empleado1` FOREIGN KEY (`idEmpleado`) REFERENCES `empleado` (`idEmpleado`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_DetalleTareo_ordenproduccion1` FOREIGN KEY (`idOrdenProduccion`) REFERENCES `ordenproduccion` (`idOrdenProduccion`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `detalletareo`
--

LOCK TABLES `detalletareo` WRITE;
/*!40000 ALTER TABLE `detalletareo` DISABLE KEYS */;
INSERT INTO `detalletareo` VALUES (1,NULL,3,13,2,1,'null',9.18,15.40,0.00,'','admin','2015-07-28 00:00:00',NULL,NULL),(2,7,29,10,1,1,'null',9.15,17.45,0.00,'','admin','2015-07-28 00:00:00',NULL,NULL),(3,8,29,10,1,1,'null',9.15,17.45,0.00,'','admin','2015-07-28 00:00:00',NULL,NULL),(4,8,4,16,1,2,'null',9.15,17.45,8.30,'','admin','2015-07-28 00:00:00',NULL,NULL),(5,9,29,10,1,1,'null',9.15,17.45,0.00,'','admin','2015-07-28 00:00:00',NULL,NULL),(6,9,4,16,1,2,'null',9.15,17.45,8.30,'','admin','2015-07-28 00:00:00',NULL,NULL),(7,10,29,10,1,1,'null',9.15,17.45,0.00,'\0','admin','2015-07-28 00:00:00',NULL,NULL),(8,10,4,16,1,2,'null',9.15,17.45,8.30,'\0','admin','2015-07-28 00:00:00',NULL,NULL),(9,11,29,10,1,1,'null',9.15,17.45,0.00,'','admin','2015-07-28 00:00:00',NULL,NULL),(10,11,4,16,1,2,'null',9.15,17.45,8.30,'','admin','2015-07-28 00:00:00',NULL,NULL),(11,12,29,10,1,1,'null',9.15,17.45,0.00,'','admin','2015-07-28 00:00:00',NULL,NULL),(12,12,4,16,1,2,'null',9.15,17.45,8.30,'','admin','2015-07-28 00:00:00',NULL,NULL),(13,13,29,10,1,1,'null',9.15,17.45,0.00,'\0','admin','2015-07-28 00:00:00',NULL,NULL),(14,13,4,16,1,2,'null',9.15,17.45,8.30,'\0','admin','2015-07-28 00:00:00',NULL,NULL),(15,13,29,10,1,1,'null',9.15,17.45,0.00,'\0','admin','2015-07-28 00:00:00',NULL,NULL),(16,13,4,16,1,2,'null',9.15,17.45,8.30,'\0','admin','2015-07-28 00:00:00',NULL,NULL),(17,13,29,10,1,1,'null',9.15,17.45,0.00,'\0','admin','2015-07-28 00:00:00',NULL,NULL),(18,13,4,16,1,2,'null',9.15,17.45,8.30,'\0','admin','2015-07-28 00:00:00',NULL,NULL),(19,13,29,10,1,1,'null',9.15,17.45,0.00,'','admin','2015-07-28 00:00:00',NULL,NULL),(20,13,4,16,1,2,'null',9.15,17.45,8.30,'','admin','2015-07-28 00:00:00',NULL,NULL),(21,13,1,16,2,1,'null',15.15,16.12,0.57,'','admin','2015-07-28 00:00:00',NULL,NULL);
/*!40000 ALTER TABLE `detalletareo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `empleado`
--

DROP TABLE IF EXISTS `empleado`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `empleado` (
  `idEmpleado` int(11) NOT NULL AUTO_INCREMENT,
  `Nombre` varchar(100) DEFAULT NULL,
  `DNI` varchar(15) DEFAULT NULL,
  `Direccion` varchar(200) DEFAULT NULL,
  `Codigo` varchar(20) DEFAULT NULL,
  `Telefono1` varchar(20) DEFAULT NULL,
  `Telefono2` varchar(20) DEFAULT NULL,
  `Puesto` varchar(50) DEFAULT NULL,
  `Activo` bit(1) DEFAULT b'1',
  `Usuario` varchar(20) DEFAULT NULL,
  `FechaRegistro` datetime DEFAULT NULL,
  `UsuarioModificacion` varchar(20) DEFAULT NULL,
  `FechaModificacion` datetime DEFAULT NULL,
  PRIMARY KEY (`idEmpleado`)
) ENGINE=InnoDB AUTO_INCREMENT=30 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `empleado`
--

LOCK TABLES `empleado` WRITE;
/*!40000 ALTER TABLE `empleado` DISABLE KEYS */;
INSERT INTO `empleado` VALUES (1,'Jose Rodriguez Muñoz','1231231','laredo','1231231','1231231','12314523','soldador','','admin','2013-03-09 00:00:00',NULL,NULL),(2,'victor mu&#195;±oz rodriguez','423423','moche','342342','34242','342342','mecanico','\0','admin','2013-03-09 00:00:00','admin','2013-03-09 00:00:00'),(3,'cesar muÃ±oz sandoval','34342','larco','3423323','345234','3423','pintor','','admin','2013-03-09 00:00:00',NULL,NULL),(4,'Carlos Molina Mora','324342','san vicente','34453','34543','324234','mecanico','','admin','2013-03-09 00:00:00',NULL,NULL),(5,'Maria Merino Medina','342342','razuri','1232432','45353453','34534534','secre','','admin','2013-03-09 00:00:00',NULL,NULL),(26,'carla muÃ±oz','23234234','moche','38547','343478','3473478','seguridad','\0','admin','2013-04-16 00:00:00','admin','2015-07-24 00:00:00'),(27,'carla muÃ±oz','34457834','moche','2384589','348458','344534','seguridad','\0','admin','2013-04-16 00:00:00','admin','2015-07-24 00:00:00'),(28,'carla muÃ±oz','23347','moche','377','4t45893478','349348934','seguridad','\0','admin','2013-04-16 00:00:00','admin','2015-07-24 00:00:00'),(29,'carla muñoz','3423','mmoche','3423','34242','23424','seguridad','','admin','2013-04-16 00:00:00',NULL,NULL);
/*!40000 ALTER TABLE `empleado` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `estandar`
--

DROP TABLE IF EXISTS `estandar`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `estandar` (
  `idEstandar` int(11) NOT NULL AUTO_INCREMENT,
  `idProductoPrincipal` int(11) NOT NULL,
  `idProducto` int(11) NOT NULL,
  `Cantidad` smallint(6) DEFAULT NULL,
  `Activo` bit(1) DEFAULT b'1',
  `Usuario` varchar(20) DEFAULT NULL,
  `FechaRegistro` datetime DEFAULT NULL,
  `UsuarioModificacion` varchar(20) DEFAULT NULL,
  `FechaModificacion` datetime DEFAULT NULL,
  PRIMARY KEY (`idEstandar`),
  KEY `fk_Estandar_Producto1_idx` (`idProductoPrincipal`),
  KEY `fk_Estandar_Producto2_idx` (`idProducto`),
  CONSTRAINT `fk_Estandar_Producto1` FOREIGN KEY (`idProductoPrincipal`) REFERENCES `producto` (`idProducto`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_Estandar_Producto2` FOREIGN KEY (`idProducto`) REFERENCES `producto` (`idProducto`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `estandar`
--

LOCK TABLES `estandar` WRITE;
/*!40000 ALTER TABLE `estandar` DISABLE KEYS */;
INSERT INTO `estandar` VALUES (1,2,6,3,'\0','admin','2013-03-09 00:00:00','admin','2013-03-11 00:00:00'),(2,2,7,3,'\0','admin','2013-03-09 00:00:00','admin','2013-03-11 00:00:00'),(3,2,9,4,'\0','admin','2013-03-09 00:00:00','admin','2013-03-11 00:00:00'),(4,2,6,3,'\0','admin','2013-03-09 00:00:00','admin','2013-03-11 00:00:00'),(5,2,7,3,'\0','admin','2013-03-09 00:00:00','admin','2013-03-11 00:00:00'),(6,2,9,4,'\0','admin','2013-03-09 00:00:00','admin','2013-03-11 00:00:00'),(7,7,11,2,'\0','admin','2013-03-11 00:00:00','admin','2013-03-11 00:00:00'),(8,2,10,2,'','admin','2013-03-11 00:00:00',NULL,NULL),(9,2,4,3,'','admin','2013-03-11 00:00:00',NULL,NULL),(10,7,11,2,'','admin','2013-03-11 00:00:00',NULL,NULL),(11,7,4,1,'','admin','2013-03-11 00:00:00',NULL,NULL);
/*!40000 ALTER TABLE `estandar` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `factura`
--

DROP TABLE IF EXISTS `factura`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `factura` (
  `idFactura` int(11) NOT NULL AUTO_INCREMENT,
  `Periodo` varchar(15) DEFAULT NULL,
  `Numero` varchar(15) DEFAULT NULL,
  `idPuntoVenta` int(11) NOT NULL,
  `idTipoVenta` int(11) NOT NULL,
  `idCotizacion` int(11) DEFAULT NULL,
  `idOrdenProduccion` int(11) DEFAULT NULL,
  `idClienteProveedor` int(11) NOT NULL,
  `DCliente` varchar(100) DEFAULT NULL,
  `DocumentoIdentidad` varchar(20) DEFAULT NULL,
  `idTipoDocumento` int(11) NOT NULL,
  `Serie` varchar(20) DEFAULT NULL,
  `NumeroDocumento` varchar(20) DEFAULT NULL,
  `Fecha` datetime DEFAULT NULL,
  `TipoCambio` decimal(4,2) DEFAULT NULL,
  `idFormaPago` int(11) NOT NULL,
  `FechaVencimiento` datetime DEFAULT NULL,
  `idMoneda` int(11) NOT NULL,
  `Glosa` varchar(200) DEFAULT NULL,
  `Igv` decimal(4,2) DEFAULT NULL,
  `DPercepcion` decimal(4,2) DEFAULT NULL,
  `idServicio` int(11) NOT NULL,
  `Referencia` varchar(20) DEFAULT NULL,
  `SerieGuia` varchar(20) DEFAULT NULL,
  `NumeroGuia` varchar(20) DEFAULT NULL,
  `Documento` varchar(20) DEFAULT NULL,
  `Aplicar` bit(1) DEFAULT NULL,
  `Importe` decimal(8,2) DEFAULT NULL,
  `Activo` bit(1) DEFAULT b'1',
  `Usuario` varchar(20) DEFAULT NULL,
  `FechaRegistro` datetime DEFAULT NULL,
  `UsuarioModificacion` varchar(20) DEFAULT NULL,
  `CotizacionOP` varchar(20) DEFAULT NULL,
  `FechaModificacion` datetime DEFAULT NULL,
  PRIMARY KEY (`idFactura`),
  KEY `fk_Factura_PuntoVenta1_idx` (`idPuntoVenta`),
  KEY `fk_Factura_TipoVenta1_idx` (`idTipoVenta`),
  KEY `fk_Factura_cotizacion1_idx` (`idCotizacion`),
  KEY `fk_Factura_ordenproduccion1_idx` (`idOrdenProduccion`),
  KEY `fk_Factura_clienteproveedor1_idx` (`idClienteProveedor`),
  KEY `fk_Factura_TipoDocumento1_idx` (`idTipoDocumento`),
  KEY `fk_Factura_formapago1_idx` (`idFormaPago`),
  KEY `fk_Factura_moneda1_idx` (`idMoneda`),
  KEY `fk_Factura_Servicio1_idx` (`idServicio`),
  CONSTRAINT `fk_Factura_PuntoVenta1` FOREIGN KEY (`idPuntoVenta`) REFERENCES `puntoventa` (`idPuntoVenta`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_Factura_Servicio1` FOREIGN KEY (`idServicio`) REFERENCES `servicio` (`idServicio`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_Factura_TipoDocumento1` FOREIGN KEY (`idTipoDocumento`) REFERENCES `tipodocumento` (`idTipoDocumento`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_Factura_TipoVenta1` FOREIGN KEY (`idTipoVenta`) REFERENCES `tipoventa` (`idTipoVenta`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_Factura_clienteproveedor1` FOREIGN KEY (`idClienteProveedor`) REFERENCES `clienteproveedor` (`idClienteProveedor`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_Factura_cotizacion1` FOREIGN KEY (`idCotizacion`) REFERENCES `cotizacion` (`idCotizacion`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_Factura_formapago1` FOREIGN KEY (`idFormaPago`) REFERENCES `formapago` (`idFormaPago`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_Factura_moneda1` FOREIGN KEY (`idMoneda`) REFERENCES `moneda` (`idMoneda`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_Factura_ordenproduccion1` FOREIGN KEY (`idOrdenProduccion`) REFERENCES `ordenproduccion` (`idOrdenProduccion`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `factura`
--

LOCK TABLES `factura` WRITE;
/*!40000 ALTER TABLE `factura` DISABLE KEYS */;
INSERT INTO `factura` VALUES (6,'Enero 2014','000001',2,1,NULL,16,3,NULL,'28474589',1,'dsa','das','2014-08-03 00:00:00',3.40,2,'2014-08-19 00:00:00',9,'dsada',19.10,3.50,1,'sda','dsa','das','dsa','',852.00,'','admin','2014-08-03 00:00:00',NULL,'OP-000004/2014',NULL),(7,'Enero 2014','000002',2,1,NULL,16,3,'','28474589',1,'dsa','das','0009-02-03 00:00:00',3.40,2,'0025-02-03 00:00:00',9,'dsada',19.10,3.50,1,'sda','dsa','das','dsa','',852.00,'','admin','2014-08-04 00:00:00',NULL,'OP-000004/2014',NULL),(8,'Enero 2014','000003',2,1,NULL,16,2,'segundo','123123',1,'dsa','das','0003-02-09 00:00:00',3.40,2,'0003-02-25 00:00:00',9,'dsada',19.10,3.50,1,'sda','dsa','das','dsa','',852.00,'','admin','2014-08-04 00:00:00',NULL,'OP-000004/2014',NULL),(9,'Enero 2014','000004',2,1,NULL,16,2,'segundo','123123',1,'dsa','das','0009-02-03 00:00:00',3.40,2,'0025-02-03 00:00:00',9,'dsada',19.10,8.90,1,'sda','dsa','das','dsa','',852.00,'','admin','2014-08-04 00:00:00',NULL,'OP-000004/2014',NULL),(10,'Enero 2014','000005',2,1,NULL,16,2,'segundo','123123',1,'dsa','das','2014-08-01 00:00:00',3.40,3,'2014-08-09 00:00:00',9,'dsada',19.10,8.90,1,'sda','dsa','das','dsa','',852.00,'','admin','2014-08-09 00:00:00','admin','OP-000004/2014','2014-08-09 00:00:00');
/*!40000 ALTER TABLE `factura` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `familia`
--

DROP TABLE IF EXISTS `familia`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `familia` (
  `idFamilia` int(11) NOT NULL AUTO_INCREMENT,
  `idCuenta` int(11) DEFAULT NULL,
  `Descripcion` varchar(50) CHARACTER SET latin1 DEFAULT NULL,
  `Codigo` varchar(5) CHARACTER SET latin1 DEFAULT NULL,
  `Activo` bit(1) DEFAULT b'1',
  `Usuario` varchar(20) CHARACTER SET latin1 DEFAULT NULL,
  `FechaRegistro` datetime DEFAULT NULL,
  `UsuarioModificacion` varchar(20) CHARACTER SET latin1 DEFAULT NULL,
  `FechaModificacion` datetime DEFAULT NULL,
  PRIMARY KEY (`idFamilia`),
  KEY `fk_familia_Cuenta1_idx` (`idCuenta`),
  CONSTRAINT `fk_familia_Cuenta1` FOREIGN KEY (`idCuenta`) REFERENCES `cuenta` (`idCuenta`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `familia`
--

LOCK TABLES `familia` WRITE;
/*!40000 ALTER TABLE `familia` DISABLE KEYS */;
INSERT INTO `familia` VALUES (1,3,'Carroceria','crr','','admin','2013-02-14 00:00:00','admin','2015-01-31 00:00:00'),(2,NULL,'Ventanas','vt','\0','admin','2013-02-14 00:00:00','admin','2013-02-14 00:00:00'),(3,4,'Vidrio','vd','','admin','2013-02-14 00:00:00','admin','2015-01-31 00:00:00'),(4,3,'plus','p03','','admin','2014-01-09 00:00:00','admin','2015-01-31 00:00:00'),(5,NULL,'','','\0','admin','2014-01-14 00:00:00','admin','2014-01-14 00:00:00'),(6,NULL,'','','\0','admin','2014-01-14 00:00:00','admin','2014-01-14 00:00:00'),(7,NULL,'familia test','ft1','\0','admin','2014-02-01 00:00:00','admin','2014-02-01 00:00:00'),(8,4,'llantas','l001','','admin','2015-01-31 00:00:00',NULL,NULL);
/*!40000 ALTER TABLE `familia` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `formapago`
--

DROP TABLE IF EXISTS `formapago`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `formapago` (
  `idFormaPago` int(11) NOT NULL AUTO_INCREMENT,
  `Descripcion` varchar(50) DEFAULT NULL,
  `Activo` bit(1) DEFAULT b'1',
  `Usuario` varchar(20) DEFAULT NULL,
  `FechaRegistro` datetime DEFAULT NULL,
  `UsuarioModificacion` varchar(20) DEFAULT NULL,
  `FechaModificacion` datetime DEFAULT NULL,
  PRIMARY KEY (`idFormaPago`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `formapago`
--

LOCK TABLES `formapago` WRITE;
/*!40000 ALTER TABLE `formapago` DISABLE KEYS */;
INSERT INTO `formapago` VALUES (1,'Efectivo','','admin','2013-02-24 00:00:00',NULL,NULL),(2,'Credito 10 dias','','admin','2013-02-24 00:00:00',NULL,NULL),(3,'Credito 30 dias','','admin','2013-02-24 00:00:00',NULL,NULL);
/*!40000 ALTER TABLE `formapago` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `guia`
--

DROP TABLE IF EXISTS `guia`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `guia` (
  `idGuia` int(11) NOT NULL AUTO_INCREMENT,
  `idTipoMovimiento` int(11) NOT NULL,
  `idOrdenProduccion` int(11) NOT NULL,
  `idClienteProveedor` int(11) NOT NULL,
  `idAlmacen` int(11) NOT NULL,
  `Periodo` varchar(20) DEFAULT NULL,
  `Numero` varchar(20) DEFAULT NULL,
  `Fecha` datetime DEFAULT NULL,
  `TipoCambio` decimal(4,2) DEFAULT NULL,
  `Serie` varchar(20) DEFAULT NULL,
  `NumeroDocumento` varchar(20) DEFAULT NULL,
  `Referencia` varchar(20) DEFAULT NULL,
  `Observaciones` varchar(200) DEFAULT NULL,
  `Activo` bit(1) DEFAULT b'1',
  `Usuario` varchar(20) DEFAULT NULL,
  `FechaRegistro` datetime DEFAULT NULL,
  `UsuarioModificacion` varchar(20) DEFAULT NULL,
  `FechaModificacion` datetime DEFAULT NULL,
  PRIMARY KEY (`idGuia`),
  KEY `fk_Guia_tipomovimiento1_idx` (`idTipoMovimiento`),
  KEY `fk_Guia_ordenproduccion1_idx` (`idOrdenProduccion`),
  KEY `fk_Guia_clienteproveedor1_idx` (`idClienteProveedor`),
  KEY `fk_Guia_almacen1_idx` (`idAlmacen`),
  CONSTRAINT `fk_Guia_almacen1` FOREIGN KEY (`idAlmacen`) REFERENCES `almacen` (`idAlmacen`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_Guia_clienteproveedor1` FOREIGN KEY (`idClienteProveedor`) REFERENCES `clienteproveedor` (`idClienteProveedor`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_Guia_ordenproduccion1` FOREIGN KEY (`idOrdenProduccion`) REFERENCES `ordenproduccion` (`idOrdenProduccion`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_Guia_tipomovimiento1` FOREIGN KEY (`idTipoMovimiento`) REFERENCES `tipomovimiento` (`idTipoMovimiento`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `guia`
--

LOCK TABLES `guia` WRITE;
/*!40000 ALTER TABLE `guia` DISABLE KEYS */;
INSERT INTO `guia` VALUES (4,3,16,3,1,'Enero 2014','000006','2014-08-10 00:00:00',2.55,'das','dasd','dsa',NULL,'','admin','2014-08-10 00:00:00',NULL,NULL),(5,3,16,3,1,'Enero 2014','000007','0016-02-04 00:00:00',2.55,'das','xxxxxxxxx','dsa','','','admin','2014-09-08 00:00:00',NULL,NULL),(6,3,16,3,1,'Enero 2014','000008','0004-02-16 00:00:00',2.55,'das','xxxxxxxxx','dsa','','','admin','2014-11-11 00:00:00',NULL,NULL),(7,3,16,3,1,'Enero 2014','000009','0016-02-04 00:00:00',2.55,'das','xxxxxxxxx','dsa','','','admin','2014-11-28 00:00:00',NULL,NULL),(8,3,16,3,1,'Enero 2014','000010','0004-02-16 00:00:00',2.55,'das','xxxxxxxxx','dsa','sdfsdfs','','admin','2014-11-28 00:00:00','admin','2014-11-28 00:00:00');
/*!40000 ALTER TABLE `guia` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `igv`
--

DROP TABLE IF EXISTS `igv`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `igv` (
  `idIGV` int(11) NOT NULL AUTO_INCREMENT,
  `Valor` decimal(6,3) DEFAULT NULL,
  `Activo` bit(1) DEFAULT b'1',
  `Usuario` varchar(20) DEFAULT NULL,
  `FechaRegistro` datetime DEFAULT NULL,
  `UsuarioModificacion` varchar(20) DEFAULT NULL,
  `FechaModificacion` datetime DEFAULT NULL,
  PRIMARY KEY (`idIGV`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `igv`
--

LOCK TABLES `igv` WRITE;
/*!40000 ALTER TABLE `igv` DISABLE KEYS */;
INSERT INTO `igv` VALUES (1,198.000,'\0','admin','2013-02-23 00:00:00',NULL,'2014-04-27 00:00:00'),(2,NULL,'\0',NULL,'2014-04-26 00:00:00',NULL,NULL),(3,NULL,'\0',NULL,'2014-04-26 00:00:00',NULL,NULL),(4,197.000,'\0','admin','2014-04-27 00:00:00',NULL,NULL),(5,197.000,'\0','admin','2014-04-27 00:00:00',NULL,NULL),(6,18.000,'','admin','2014-04-27 00:00:00',NULL,'2015-07-02 00:00:00');
/*!40000 ALTER TABLE `igv` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ingreso`
--

DROP TABLE IF EXISTS `ingreso`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ingreso` (
  `idIngreso` int(11) NOT NULL AUTO_INCREMENT,
  `idAlmacen` int(11) NOT NULL,
  `idTipoMovimiento` int(11) NOT NULL,
  `idOrdenCompra` int(11) DEFAULT NULL,
  `idClienteProveedor` int(11) NOT NULL,
  `idMoneda` int(11) NOT NULL,
  `Fecha` datetime DEFAULT NULL,
  `Numero` varchar(20) DEFAULT NULL,
  `TipoCambio` decimal(6,3) DEFAULT NULL,
  `GuiaRemision` varchar(20) DEFAULT NULL,
  `FacturaProveedor` varchar(20) DEFAULT NULL,
  `FechaDocumento` datetime DEFAULT NULL,
  `ProvisionCompra` varchar(20) DEFAULT NULL,
  `TipoCambioMoneda` decimal(6,3) DEFAULT NULL,
  `Monto` decimal(9,3) DEFAULT NULL,
  `Observaciones` varchar(200) DEFAULT NULL,
  `Activo` bit(1) DEFAULT b'1',
  `Usuario` varchar(20) DEFAULT NULL,
  `FechaRegistro` datetime DEFAULT NULL,
  `UsuarioModificacion` varchar(20) DEFAULT NULL,
  `FechaModificacion` datetime DEFAULT NULL,
  `idSubdiario` int(11) DEFAULT NULL,
  PRIMARY KEY (`idIngreso`),
  KEY `fk_Ingreso_Almacen1_idx` (`idAlmacen`),
  KEY `fk_Ingreso_TipoMovimiento1_idx` (`idTipoMovimiento`),
  KEY `fk_Ingreso_OrdenCompra1_idx` (`idOrdenCompra`),
  KEY `fk_Ingreso_ClienteProveedor1_idx` (`idClienteProveedor`),
  KEY `fk_Ingreso_Moneda1_idx` (`idMoneda`),
  KEY `fk_ingreso_Subdiario1_idx` (`idSubdiario`),
  CONSTRAINT `fk_Ingreso_Almacen1` FOREIGN KEY (`idAlmacen`) REFERENCES `almacen` (`idAlmacen`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_Ingreso_ClienteProveedor1` FOREIGN KEY (`idClienteProveedor`) REFERENCES `clienteproveedor` (`idClienteProveedor`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_Ingreso_Moneda1` FOREIGN KEY (`idMoneda`) REFERENCES `moneda` (`idMoneda`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_Ingreso_OrdenCompra1` FOREIGN KEY (`idOrdenCompra`) REFERENCES `ordencompra` (`idOrdenCompra`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_Ingreso_TipoMovimiento1` FOREIGN KEY (`idTipoMovimiento`) REFERENCES `tipomovimiento` (`idTipoMovimiento`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_ingreso_Subdiario1` FOREIGN KEY (`idSubdiario`) REFERENCES `subdiario` (`idSubdiario`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ingreso`
--

LOCK TABLES `ingreso` WRITE;
/*!40000 ALTER TABLE `ingreso` DISABLE KEYS */;
INSERT INTO `ingreso` VALUES (2,2,3,30,4,9,'2013-03-03 00:00:00','000001',2.550,'asdas','dasda','2013-03-03 00:00:00','dasdas',0.000,7.000,'asdasdasd','','admin','2013-03-03 00:00:00','admin','2015-10-27 00:00:00',NULL),(3,2,3,31,5,9,'2013-03-03 00:00:00','000002',2.550,'dadsad','asdas','2013-03-03 00:00:00','dsasda',0.000,7.000,'','','admin','2013-03-03 00:00:00','admin','2015-10-27 00:00:00',NULL),(4,1,1,31,3,8,'2013-03-04 00:00:00','000003',2.550,'qqq','aaaa','2013-03-04 00:00:00','444444',0.000,14.000,'otro mas','','admin','2013-03-04 00:00:00','admin','2015-10-27 00:00:00',NULL),(5,1,1,31,4,8,'2013-03-04 00:00:00','000004',2.550,'ww','aeaewa','2013-03-04 00:00:00','sasasd',0.000,7.000,'la tercera entrega','','admin','2013-03-04 00:00:00','admin','2015-10-27 00:00:00',NULL),(6,2,3,33,5,8,'2013-03-11 00:00:00','000005',2.550,'123123','123123','2013-03-05 00:00:00','3asdasa',0.000,7.000,'hgfhgfhf','','admin','2013-03-11 00:00:00','admin','2015-10-27 00:00:00',NULL),(7,2,3,33,5,8,'2013-03-13 00:00:00','000006',2.550,'www','www','2013-03-09 00:00:00','www',0.000,17.000,'dos ingresos','','admin','2013-03-13 00:00:00','admin','2015-10-27 00:00:00',NULL),(8,2,3,33,5,8,'2013-03-13 00:00:00','000007',2.550,'www','www','2013-03-09 00:00:00','www',0.000,17.000,'dos ingresos','','admin','2013-03-13 00:00:00','admin','2015-10-27 00:00:00',NULL),(9,1,1,33,3,8,'2013-03-13 00:00:00','000008',2.550,'aaa','aaa','2013-03-26 00:00:00',NULL,0.000,48.000,'vamos a verlo','','admin','2013-03-13 00:00:00','admin','2015-10-27 00:00:00',1),(10,1,1,32,2,8,'2013-03-13 00:00:00','000009',2.550,'xxx','xxx','2013-03-08 00:00:00',NULL,0.000,48.000,'sdasadsa','','admin','2013-03-13 00:00:00','admin','2015-10-27 00:00:00',1),(11,1,1,32,3,8,'2013-03-13 00:00:00','000010',2.550,'www','www','2013-03-12 00:00:00',NULL,0.000,55.000,'dasdasdasa','','admin','2013-03-13 00:00:00','admin','2015-10-27 00:00:00',1),(12,1,1,32,3,8,'2013-03-13 00:00:00','000001',2.550,'www','www','2013-03-12 00:00:00',NULL,0.000,55.000,'dasdasdasa','','admin','2015-09-14 00:00:00','admin','2015-10-27 00:00:00',1),(13,1,1,32,3,8,'2013-03-13 00:00:00','000002',2.550,'www','www','2013-03-12 00:00:00',NULL,0.000,55.000,'dasdasdasa','','admin','2015-09-14 00:00:00','admin','2015-10-27 00:00:00',1),(14,1,1,32,3,8,'2013-03-13 00:00:00','000003',2.550,'www','www','2013-03-12 00:00:00',NULL,0.000,55.000,'dasdasdasa','','admin','2015-09-14 00:00:00','admin','2015-10-27 00:00:00',1),(15,1,1,32,3,8,'2015-03-11 00:00:00','000004',2.550,'www','www','2013-03-12 00:00:00',NULL,0.000,40.000,'dasdasdasa','','admin','2015-09-19 00:00:00','admin','2015-10-27 00:00:00',1),(16,1,1,32,3,8,'2015-03-11 00:00:00','000005',2.550,'www','www','2013-03-12 00:00:00',NULL,0.000,40.000,'dasdasdasa','','admin','2015-09-19 00:00:00','admin','2015-10-27 00:00:00',1),(17,1,1,32,3,8,'2015-03-11 00:00:00','000006',2.550,'www','www','2013-03-12 00:00:00',NULL,0.000,40.000,'dasdasdasa','\0','admin','2015-09-19 00:00:00','admin','2015-10-27 00:00:00',1);
/*!40000 ALTER TABLE `ingreso` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ingresoproducto`
--

DROP TABLE IF EXISTS `ingresoproducto`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ingresoproducto` (
  `idIngresoProducto` int(11) NOT NULL AUTO_INCREMENT,
  `idIngreso` int(11) NOT NULL,
  `idProducto` int(11) NOT NULL,
  `idCentroCosto` int(11) NOT NULL,
  `Cantidad` int(11) DEFAULT NULL,
  `Precio` decimal(9,3) DEFAULT NULL,
  `Importe` decimal(9,3) DEFAULT NULL,
  `Activo` bit(1) DEFAULT b'1',
  `Usuario` varchar(20) DEFAULT NULL,
  `FechaRegistro` datetime DEFAULT NULL,
  `UsuarioModificacion` varchar(20) DEFAULT NULL,
  `FechaModificacion` datetime DEFAULT NULL,
  PRIMARY KEY (`idIngresoProducto`),
  KEY `fk_IngresoProducto_Ingreso1_idx` (`idIngreso`),
  KEY `fk_IngresoProducto_Producto1_idx` (`idProducto`),
  KEY `fk_IngresoProducto_CentroCosto1_idx` (`idCentroCosto`),
  CONSTRAINT `fk_IngresoProducto_CentroCosto1` FOREIGN KEY (`idCentroCosto`) REFERENCES `centrocosto` (`idCentroCosto`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_IngresoProducto_Ingreso1` FOREIGN KEY (`idIngreso`) REFERENCES `ingreso` (`idIngreso`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_IngresoProducto_Producto1` FOREIGN KEY (`idProducto`) REFERENCES `producto` (`idProducto`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=41 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ingresoproducto`
--

LOCK TABLES `ingresoproducto` WRITE;
/*!40000 ALTER TABLE `ingresoproducto` DISABLE KEYS */;
INSERT INTO `ingresoproducto` VALUES (1,2,2,1,1,7.000,7.000,'','admin','2013-03-03 00:00:00',NULL,NULL),(2,3,2,1,1,7.000,7.000,'','admin','2013-03-03 00:00:00',NULL,NULL),(3,4,2,2,2,7.000,14.000,'','admin','2013-03-04 00:00:00',NULL,NULL),(4,5,2,2,1,7.000,7.000,'','admin','2013-03-04 00:00:00',NULL,NULL),(5,6,2,1,1,7.000,7.000,'','admin','2013-03-11 00:00:00',NULL,NULL),(6,7,7,2,1,7.000,7.000,'','admin','2013-03-13 00:00:00',NULL,NULL),(7,7,6,2,2,5.000,10.000,'','admin','2013-03-13 00:00:00',NULL,NULL),(8,8,7,2,1,7.000,7.000,'','admin','2013-03-13 00:00:00',NULL,NULL),(9,8,6,2,2,5.000,10.000,'','admin','2013-03-13 00:00:00',NULL,NULL),(10,9,6,2,4,5.000,20.000,'\0','admin','2013-03-13 00:00:00','admin','2015-08-26 00:00:00'),(11,9,7,2,4,7.000,28.000,'\0','admin','2013-03-13 00:00:00','admin','2015-08-26 00:00:00'),(12,10,9,1,5,8.000,40.000,'\0','admin','2013-03-13 00:00:00','admin','2013-03-20 00:00:00'),(13,11,9,1,5,8.000,40.000,'\0','admin','2013-03-13 00:00:00','admin','2015-08-26 00:00:00'),(14,11,10,2,5,3.000,15.000,'\0','admin','2013-03-13 00:00:00','admin','2015-08-26 00:00:00'),(15,10,9,1,4,8.000,32.000,'\0','admin','2013-03-20 00:00:00','admin','2013-03-20 00:00:00'),(16,10,9,1,4,8.000,32.000,'\0','admin','2013-03-20 00:00:00','admin','2013-03-20 00:00:00'),(17,10,9,1,4,8.000,32.000,'\0','admin','2013-03-20 00:00:00','admin','2013-03-20 00:00:00'),(18,10,7,2,4,7.000,28.000,'\0','admin','2013-03-20 00:00:00','admin','2013-03-21 00:00:00'),(19,10,9,2,6,8.000,48.000,'\0','admin','2013-03-21 00:00:00','admin','2015-08-26 00:00:00'),(20,11,9,1,5,8.000,40.000,'','admin','2015-08-26 00:00:00',NULL,NULL),(21,11,10,2,5,3.000,15.000,'','admin','2015-08-26 00:00:00',NULL,NULL),(22,10,9,2,6,8.000,48.000,'','admin','2015-08-26 00:00:00',NULL,NULL),(23,9,6,2,4,5.000,20.000,'','admin','2015-08-26 00:00:00',NULL,NULL),(24,9,7,2,4,7.000,28.000,'','admin','2015-08-26 00:00:00',NULL,NULL),(25,12,9,1,5,8.000,40.000,'','admin','2015-09-14 00:00:00',NULL,NULL),(26,12,10,2,5,3.000,15.000,'','admin','2015-09-14 00:00:00',NULL,NULL),(27,13,9,1,5,8.000,40.000,'','admin','2015-09-14 00:00:00',NULL,NULL),(28,13,10,2,5,3.000,15.000,'','admin','2015-09-14 00:00:00',NULL,NULL),(29,14,9,1,5,8.000,40.000,'','admin','2015-09-14 00:00:00',NULL,NULL),(30,14,10,2,5,3.000,15.000,'','admin','2015-09-14 00:00:00',NULL,NULL),(31,15,9,1,5,8.000,40.000,'\0','admin','2015-09-19 00:00:00','admin','2015-09-19 00:00:00'),(32,15,10,2,5,3.000,15.000,'\0','admin','2015-09-19 00:00:00','admin','2015-09-19 00:00:00'),(33,15,9,1,5,8.000,40.000,'\0','admin','2015-09-19 00:00:00','admin','2015-09-19 00:00:00'),(34,15,9,1,5,8.000,40.000,'','admin','2015-09-19 00:00:00',NULL,NULL),(35,16,9,1,5,8.000,40.000,'\0','admin','2015-09-19 00:00:00','admin','2015-09-19 00:00:00'),(36,16,10,2,6,29.000,174.000,'\0','admin','2015-09-19 00:00:00','admin','2015-09-19 00:00:00'),(37,16,9,1,5,8.000,40.000,'','admin','2015-09-19 00:00:00',NULL,NULL),(38,17,9,1,5,8.000,40.000,'\0','admin','2015-09-19 00:00:00','admin','2015-09-19 00:00:00'),(39,17,12,2,5,50.000,250.000,'\0','admin','2015-09-19 00:00:00','admin','2015-09-19 00:00:00'),(40,17,9,1,5,8.000,40.000,'','admin','2015-09-19 00:00:00',NULL,NULL);
/*!40000 ALTER TABLE `ingresoproducto` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `listamateriales`
--

DROP TABLE IF EXISTS `listamateriales`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `listamateriales` (
  `idListaMateriales` int(11) NOT NULL AUTO_INCREMENT,
  `idProductoTerminado` int(11) NOT NULL,
  PRIMARY KEY (`idListaMateriales`),
  KEY `fk_ListaMateriales_Producto1_idx` (`idProductoTerminado`),
  CONSTRAINT `fk_ListaMateriales_Producto1` FOREIGN KEY (`idProductoTerminado`) REFERENCES `producto` (`idProducto`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `listamateriales`
--

LOCK TABLES `listamateriales` WRITE;
/*!40000 ALTER TABLE `listamateriales` DISABLE KEYS */;
/*!40000 ALTER TABLE `listamateriales` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `listaprecio`
--

DROP TABLE IF EXISTS `listaprecio`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `listaprecio` (
  `idListaPrecio` int(11) NOT NULL AUTO_INCREMENT,
  `idProducto` int(11) NOT NULL,
  `Precio` decimal(9,3) DEFAULT NULL,
  `TipoCambio` decimal(6,3) DEFAULT NULL,
  `Fecha` datetime DEFAULT NULL,
  `Estado` bit(1) DEFAULT b'1',
  `Activo` bit(1) DEFAULT b'1',
  `Usuario` varchar(20) DEFAULT NULL,
  `FechaRegistro` datetime DEFAULT NULL,
  `UsuarioModificacion` varchar(20) DEFAULT NULL,
  `FechaModificacion` datetime DEFAULT NULL,
  PRIMARY KEY (`idListaPrecio`),
  KEY `fk_ListaPrecio_Producto1_idx` (`idProducto`),
  CONSTRAINT `fk_ListaPrecio_Producto1` FOREIGN KEY (`idProducto`) REFERENCES `producto` (`idProducto`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=28 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `listaprecio`
--

LOCK TABLES `listaprecio` WRITE;
/*!40000 ALTER TABLE `listaprecio` DISABLE KEYS */;
INSERT INTO `listaprecio` VALUES (4,2,5.000,5.000,'2013-02-19 00:00:00','\0','\0','admin','2013-02-19 00:00:00','admin','2014-02-01 00:00:00'),(5,2,3.000,3.000,'2013-02-19 00:00:00','\0','','admin','2013-02-19 00:00:00','admin','2014-02-01 00:00:00'),(6,2,7.000,7.000,'2013-02-01 00:00:00','\0','','admin','2013-02-19 00:00:00','admin','2014-02-01 00:00:00'),(7,3,7.000,7.000,'2013-02-19 00:00:00','','','admin','2013-02-19 00:00:00',NULL,NULL),(8,4,8.000,8.000,'2013-02-19 00:00:00','','','admin','2013-02-19 00:00:00',NULL,NULL),(9,5,9.000,9.000,'2013-02-18 00:00:00','','','admin','2013-02-19 00:00:00',NULL,NULL),(10,8,3.000,4.000,'2013-02-25 00:00:00','','','admin','2013-02-25 00:00:00',NULL,NULL),(11,10,3.000,4.000,'2013-02-25 00:00:00','\0','','admin','2013-02-25 00:00:00','admin','2014-01-07 00:00:00'),(12,6,5.000,4.000,'2013-02-25 00:00:00','\0','','admin','2013-02-25 00:00:00','admin','2014-02-01 00:00:00'),(13,7,7.000,4.000,'2013-02-25 00:00:00','','','admin','2013-02-25 00:00:00',NULL,NULL),(14,9,8.000,4.000,'2013-02-25 00:00:00','','','admin','2013-02-25 00:00:00',NULL,NULL),(15,10,29.000,2.870,'2014-01-23 00:00:00','','','admin','2014-01-07 00:00:00',NULL,NULL),(22,12,50.000,2.500,'2014-01-28 00:00:00','','','admin','2014-01-28 00:00:00',NULL,NULL),(24,6,12.000,2.800,'2014-01-31 00:00:00','','','admin','2014-01-31 00:00:00','admin','2014-02-01 00:00:00'),(25,2,35.000,2.500,'2014-02-04 00:00:00','','','admin','2014-02-01 00:00:00','admin','2014-02-01 00:00:00'),(26,11,55.000,2.800,'2014-02-01 00:00:00','\0','','admin','2014-02-01 00:00:00','admin','2014-02-01 00:00:00'),(27,11,60.000,2.700,'2014-02-01 00:00:00','','','admin','2014-02-01 00:00:00',NULL,NULL);
/*!40000 ALTER TABLE `listaprecio` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `modelochasis`
--

DROP TABLE IF EXISTS `modelochasis`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `modelochasis` (
  `idModeloChasis` int(11) NOT NULL AUTO_INCREMENT,
  `Descripcion` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`idModeloChasis`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `modelochasis`
--

LOCK TABLES `modelochasis` WRITE;
/*!40000 ALTER TABLE `modelochasis` DISABLE KEYS */;
INSERT INTO `modelochasis` VALUES (1,'MB915'),(2,'MB1721'),(3,'0500R');
/*!40000 ALTER TABLE `modelochasis` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `modulo`
--

DROP TABLE IF EXISTS `modulo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `modulo` (
  `idModulo` int(11) NOT NULL AUTO_INCREMENT,
  `Descripcion` varchar(50) DEFAULT NULL,
  `Activo` bit(1) DEFAULT b'1',
  `Usuario` varchar(20) DEFAULT NULL,
  `FechaRegistro` datetime DEFAULT NULL,
  `UsuarioModificacion` varchar(20) DEFAULT NULL,
  `FechaModificacion` datetime DEFAULT NULL,
  PRIMARY KEY (`idModulo`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `modulo`
--

LOCK TABLES `modulo` WRITE;
/*!40000 ALTER TABLE `modulo` DISABLE KEYS */;
INSERT INTO `modulo` VALUES (1,'Usuario','','admin','2013-01-07 00:00:00',NULL,NULL),(2,'Ventas','','admin','2013-01-09 00:00:00',NULL,NULL),(3,'Produccion','','admin','2013-01-09 00:00:00',NULL,NULL);
/*!40000 ALTER TABLE `modulo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `moneda`
--

DROP TABLE IF EXISTS `moneda`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `moneda` (
  `idMoneda` int(11) NOT NULL AUTO_INCREMENT,
  `Descripcion` varchar(50) DEFAULT NULL,
  `DescripcionCorta` varchar(10) DEFAULT NULL,
  `Simbolo` varchar(5) DEFAULT NULL,
  `Local` bit(1) DEFAULT NULL,
  `Activo` bit(1) DEFAULT b'1',
  `Usuario` varchar(20) DEFAULT NULL,
  `FechaRegistro` datetime DEFAULT NULL,
  `UsuarioModificacion` varchar(20) DEFAULT NULL,
  `FechaModificacion` datetime DEFAULT NULL,
  PRIMARY KEY (`idMoneda`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `moneda`
--

LOCK TABLES `moneda` WRITE;
/*!40000 ALTER TABLE `moneda` DISABLE KEYS */;
INSERT INTO `moneda` VALUES (7,'Nuevo Sol','Sol','s/.','','','admin','2013-02-23 00:00:00',NULL,NULL),(8,'Dolar','USD','$',NULL,'','admin','2013-02-23 00:00:00',NULL,NULL),(9,'Euro','EU','€',NULL,'','admin','2013-02-23 00:00:00',NULL,NULL);
/*!40000 ALTER TABLE `moneda` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `naturaleza`
--

DROP TABLE IF EXISTS `naturaleza`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `naturaleza` (
  `idNaturaleza` int(11) NOT NULL AUTO_INCREMENT,
  `Descripcion` varchar(100) DEFAULT NULL,
  `Codigo` varchar(50) DEFAULT NULL,
  `Activo` bit(1) DEFAULT b'1',
  `Usuario` varchar(20) DEFAULT NULL,
  `FechaRegistro` datetime DEFAULT NULL,
  `UsuarioModificacion` varchar(20) DEFAULT NULL,
  `FechaModificacion` datetime DEFAULT NULL,
  PRIMARY KEY (`idNaturaleza`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `naturaleza`
--

LOCK TABLES `naturaleza` WRITE;
/*!40000 ALTER TABLE `naturaleza` DISABLE KEYS */;
INSERT INTO `naturaleza` VALUES (1,'naturaleza 2','n001','\0','admin','2015-07-02 00:00:00',NULL,NULL),(2,'naturaleza 2','n002','','admin','2015-07-02 00:00:00',NULL,NULL),(3,'naturaleza 3','n003','','admin','2015-07-02 00:00:00',NULL,NULL);
/*!40000 ALTER TABLE `naturaleza` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `numeroasiento`
--

DROP TABLE IF EXISTS `numeroasiento`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `numeroasiento` (
  `idnumeroasiento` int(11) NOT NULL AUTO_INCREMENT,
  `Anio` int(11) DEFAULT NULL,
  `Mes` varchar(50) DEFAULT NULL,
  `Numero` int(11) DEFAULT NULL,
  PRIMARY KEY (`idnumeroasiento`)
) ENGINE=InnoDB AUTO_INCREMENT=37 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `numeroasiento`
--

LOCK TABLES `numeroasiento` WRITE;
/*!40000 ALTER TABLE `numeroasiento` DISABLE KEYS */;
INSERT INTO `numeroasiento` VALUES (1,2015,'Enero',27),(2,2015,'Febrero',0),(3,2015,'Marzo',0),(4,2015,'Abril',0),(5,2015,'Mayo',0),(6,2015,'Junio',0),(7,2015,'Julio',0),(8,2015,'Agosto',0),(9,2015,'Setiembre',0),(10,2015,'Octubre',0),(11,2015,'Noviembre',0),(12,2015,'Diciembre',0),(13,2016,'Enero',0),(14,2016,'Febrero',0),(15,2016,'Marzo',0),(16,2016,'Abril',0),(17,2016,'Mayo',0),(18,2016,'Junio',0),(19,2016,'Julio',0),(20,2016,'Agosto',0),(21,2016,'Setiembre',0),(22,2016,'Octubre',0),(23,2016,'Noviembre',0),(24,2016,'Diciembre',0),(25,2017,'Enero',0),(26,2017,'Febrero',0),(27,2017,'Marzo',0),(28,2017,'Abril',0),(29,2017,'Mayo',0),(30,2017,'Junio',0),(31,2017,'Julio',0),(32,2017,'Agosto',0),(33,2017,'Setiembre',0),(34,2017,'Octubre',0),(35,2017,'Noviembre',0),(36,2017,'Diciembre',0);
/*!40000 ALTER TABLE `numeroasiento` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `numerofactura`
--

DROP TABLE IF EXISTS `numerofactura`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `numerofactura` (
  `idNumeroFactura` int(11) NOT NULL AUTO_INCREMENT,
  `Ano` smallint(6) DEFAULT NULL,
  `mes` varchar(20) DEFAULT NULL,
  `Numero` varchar(20) DEFAULT NULL,
  `Activo` bit(1) DEFAULT b'1',
  `Usuario` varchar(20) DEFAULT NULL,
  `FechaRegistro` datetime DEFAULT NULL,
  `UsuarioModificacion` varchar(20) DEFAULT NULL,
  `FechaModificacion` datetime DEFAULT NULL,
  PRIMARY KEY (`idNumeroFactura`)
) ENGINE=InnoDB AUTO_INCREMENT=49 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `numerofactura`
--

LOCK TABLES `numerofactura` WRITE;
/*!40000 ALTER TABLE `numerofactura` DISABLE KEYS */;
INSERT INTO `numerofactura` VALUES (1,2013,'Enero','0','','admin','2014-08-03 00:00:00',NULL,NULL),(2,2013,'Febrero','0','','admin','2014-08-03 00:00:00',NULL,NULL),(3,2013,'Marzo','0','','admin','2014-08-03 00:00:00',NULL,NULL),(4,2013,'Abril','0','','admin','2014-08-03 00:00:00',NULL,NULL),(5,2013,'Mayo','0','','admin','2014-08-03 00:00:00',NULL,NULL),(6,2013,'Junio','0','','admin','2014-08-03 00:00:00',NULL,NULL),(7,2013,'Julio','0','','admin','2014-08-03 00:00:00',NULL,NULL),(8,2013,'Agosto','0','','admin','2014-08-03 00:00:00',NULL,NULL),(9,2013,'Septiembre','0','','admin','2014-08-03 00:00:00',NULL,NULL),(10,2013,'Octubre','0','','admin','2014-08-03 00:00:00',NULL,NULL),(11,2013,'Noviembre','0','','admin','2014-08-03 00:00:00',NULL,NULL),(12,2013,'Diciembre','0','','admin','2014-08-03 00:00:00',NULL,NULL),(13,2014,'Enero','5','','admin','2014-08-03 00:00:00','admin','2014-08-09 00:00:00'),(14,2014,'Febrero','0','','admin','2014-08-03 00:00:00',NULL,NULL),(15,2014,'Marzo','0','','admin','2014-08-03 00:00:00',NULL,NULL),(16,2014,'Abril','0','','admin','2014-08-03 00:00:00',NULL,NULL),(17,2014,'Mayo','0','','admin','2014-08-03 00:00:00',NULL,NULL),(18,2014,'Junio','0','','admin','2014-08-03 00:00:00',NULL,NULL),(19,2014,'Julio','0','','admin','2014-08-03 00:00:00',NULL,NULL),(20,2014,'Agosto','0','','admin','2014-08-03 00:00:00',NULL,NULL),(21,2014,'Septiembre','0','','admin','2014-08-03 00:00:00',NULL,NULL),(22,2014,'Octubre','0','','admin','2014-08-03 00:00:00',NULL,NULL),(23,2014,'Noviembre','0','','admin','2014-08-03 00:00:00',NULL,NULL),(24,2014,'Diciembre','0','','admin','2014-08-03 00:00:00',NULL,NULL),(25,2015,'Enero','0','','admin','2014-08-03 00:00:00',NULL,NULL),(26,2015,'Febrero','0','','admin','2014-08-03 00:00:00',NULL,NULL),(27,2015,'Marzo','0','','admin','2014-08-03 00:00:00',NULL,NULL),(28,2015,'Abril','0','','admin','2014-08-03 00:00:00',NULL,NULL),(29,2015,'Mayo','0','','admin','2014-08-03 00:00:00',NULL,NULL),(30,2015,'Junio','0','','admin','2014-08-03 00:00:00',NULL,NULL),(31,2015,'Julio','0','','admin','2014-08-03 00:00:00',NULL,NULL),(32,2015,'Agosto','0','','admin','2014-08-03 00:00:00',NULL,NULL),(33,2015,'Septiembre','0','','admin','2014-08-03 00:00:00',NULL,NULL),(34,2015,'Octubre','0','','admin','2014-08-03 00:00:00',NULL,NULL),(35,2015,'Noviembre','0','','admin','2014-08-03 00:00:00',NULL,NULL),(36,2015,'Diciembre','0','','admin','2014-08-03 00:00:00',NULL,NULL),(37,2016,'Enero','0','','admin','2014-08-03 00:00:00',NULL,NULL),(38,2016,'Febrero','0','','admin','2014-08-03 00:00:00',NULL,NULL),(39,2016,'Marzo','0','','admin','2014-08-03 00:00:00',NULL,NULL),(40,2016,'Abril','0','','admin','2014-08-03 00:00:00',NULL,NULL),(41,2016,'Mayo','0','','admin','2014-08-03 00:00:00',NULL,NULL),(42,2016,'Junio','0','','admin','2014-08-03 00:00:00',NULL,NULL),(43,2016,'Julio','0','','admin','2014-08-03 00:00:00',NULL,NULL),(44,2016,'Agosto','0','','admin','2014-08-03 00:00:00',NULL,NULL),(45,2016,'Septiembre','0','','admin','2014-08-03 00:00:00',NULL,NULL),(46,2016,'Octubre','0','','admin','2014-08-03 00:00:00',NULL,NULL),(47,2016,'Noviembre','0','','admin','2014-08-03 00:00:00',NULL,NULL),(48,2016,'Diciembre','0','','admin','2014-08-03 00:00:00',NULL,NULL);
/*!40000 ALTER TABLE `numerofactura` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `numeroguia`
--

DROP TABLE IF EXISTS `numeroguia`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `numeroguia` (
  `idNumeroGuia` int(11) NOT NULL AUTO_INCREMENT,
  `Ano` smallint(6) DEFAULT NULL,
  `Mes` tinyint(4) DEFAULT NULL,
  `DMes` varchar(20) DEFAULT NULL,
  `Numero` int(11) DEFAULT NULL,
  `Activo` bit(1) DEFAULT b'1',
  `Usuario` varchar(20) DEFAULT NULL,
  `FechaRegistro` datetime DEFAULT NULL,
  `UsuarioModificacion` varchar(20) DEFAULT NULL,
  `FechaModificacion` datetime DEFAULT NULL,
  PRIMARY KEY (`idNumeroGuia`)
) ENGINE=InnoDB AUTO_INCREMENT=49 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `numeroguia`
--

LOCK TABLES `numeroguia` WRITE;
/*!40000 ALTER TABLE `numeroguia` DISABLE KEYS */;
INSERT INTO `numeroguia` VALUES (1,2013,1,'Enero',0,'','admin','2014-08-10 00:00:00',NULL,NULL),(2,2013,2,'Febrero',0,'','admin','2014-08-10 00:00:00',NULL,NULL),(3,2013,3,'Marzo',0,'','admin','2014-08-10 00:00:00',NULL,NULL),(4,2013,4,'Abril',0,'','admin','2014-08-10 00:00:00',NULL,NULL),(5,2013,5,'Mayo',0,'','admin','2014-08-10 00:00:00',NULL,NULL),(6,2013,6,'Junio',0,'','admin','2014-08-10 00:00:00',NULL,NULL),(7,2013,7,'Julio',0,'','admin','2014-08-10 00:00:00',NULL,NULL),(8,2013,8,'Agosto',0,'','admin','2014-08-10 00:00:00',NULL,NULL),(9,2013,9,'Septiembre',0,'','admin','2014-08-10 00:00:00',NULL,NULL),(10,2013,10,'Octubre',0,'','admin','2014-08-10 00:00:00',NULL,NULL),(11,2013,11,'Noviembre',0,'','admin','2014-08-10 00:00:00',NULL,NULL),(12,2013,12,'Diciembre',0,'','admin','2014-08-10 00:00:00',NULL,NULL),(13,2014,1,'Enero',10,'','admin','2014-08-10 00:00:00','admin','2014-11-28 00:00:00'),(14,2014,2,'Febrero',0,'','admin','2014-08-10 00:00:00',NULL,NULL),(15,2014,3,'Marzo',0,'','admin','2014-08-10 00:00:00',NULL,NULL),(16,2014,4,'Abril',0,'','admin','2014-08-10 00:00:00',NULL,NULL),(17,2014,5,'Mayo',0,'','admin','2014-08-10 00:00:00',NULL,NULL),(18,2014,6,'Junio',0,'','admin','2014-08-10 00:00:00',NULL,NULL),(19,2014,7,'Julio',0,'','admin','2014-08-10 00:00:00',NULL,NULL),(20,2014,8,'Agosto',0,'','admin','2014-08-10 00:00:00',NULL,NULL),(21,2014,9,'Septiembre',0,'','admin','2014-08-10 00:00:00',NULL,NULL),(22,2014,10,'Octubre',0,'','admin','2014-08-10 00:00:00',NULL,NULL),(23,2014,11,'Noviembre',0,'','admin','2014-08-10 00:00:00',NULL,NULL),(24,2014,12,'Diciembre',0,'','admin','2014-08-10 00:00:00',NULL,NULL),(25,2015,1,'Enero',0,'','admin','2014-08-10 00:00:00',NULL,NULL),(26,2015,2,'Febrero',0,'','admin','2014-08-10 00:00:00',NULL,NULL),(27,2015,3,'Marzo',0,'','admin','2014-08-10 00:00:00',NULL,NULL),(28,2015,4,'Abril',0,'','admin','2014-08-10 00:00:00',NULL,NULL),(29,2015,5,'Mayo',0,'','admin','2014-08-10 00:00:00',NULL,NULL),(30,2015,6,'Junio',0,'','admin','2014-08-10 00:00:00',NULL,NULL),(31,2015,7,'Julio',0,'','admin','2014-08-10 00:00:00',NULL,NULL),(32,2015,8,'Agosto',0,'','admin','2014-08-10 00:00:00',NULL,NULL),(33,2015,9,'Septiembre',0,'','admin','2014-08-10 00:00:00',NULL,NULL),(34,2015,10,'Octubre',0,'','admin','2014-08-10 00:00:00',NULL,NULL),(35,2015,11,'Noviembre',0,'','admin','2014-08-10 00:00:00',NULL,NULL),(36,2015,12,'Diciembre',0,'','admin','2014-08-10 00:00:00',NULL,NULL),(37,2016,1,'Enero',0,'','admin','2014-08-10 00:00:00',NULL,NULL),(38,2016,2,'Febrero',0,'','admin','2014-08-10 00:00:00',NULL,NULL),(39,2016,3,'Marzo',0,'','admin','2014-08-10 00:00:00',NULL,NULL),(40,2016,4,'Abril',0,'','admin','2014-08-10 00:00:00',NULL,NULL),(41,2016,5,'Mayo',0,'','admin','2014-08-10 00:00:00',NULL,NULL),(42,2016,6,'Junio',0,'','admin','2014-08-10 00:00:00',NULL,NULL),(43,2016,7,'Julio',0,'','admin','2014-08-10 00:00:00',NULL,NULL),(44,2016,8,'Agosto',0,'','admin','2014-08-10 00:00:00',NULL,NULL),(45,2016,9,'Septiembre',0,'','admin','2014-08-10 00:00:00',NULL,NULL),(46,2016,10,'Octubre',0,'','admin','2014-08-10 00:00:00',NULL,NULL),(47,2016,11,'Noviembre',0,'','admin','2014-08-10 00:00:00',NULL,NULL),(48,2016,12,'Diciembre',0,'','admin','2014-08-10 00:00:00',NULL,NULL);
/*!40000 ALTER TABLE `numeroguia` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `numeromovimiento`
--

DROP TABLE IF EXISTS `numeromovimiento`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `numeromovimiento` (
  `idNumeroMovimiento` int(11) NOT NULL AUTO_INCREMENT,
  `Ano` smallint(6) DEFAULT NULL,
  `Numero` int(11) DEFAULT NULL,
  `Tipo` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`idNumeroMovimiento`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `numeromovimiento`
--

LOCK TABLES `numeromovimiento` WRITE;
/*!40000 ALTER TABLE `numeromovimiento` DISABLE KEYS */;
INSERT INTO `numeromovimiento` VALUES (1,2013,10,'ingreso'),(2,2014,0,'ingreso'),(3,2015,6,'ingreso'),(4,2016,0,'ingreso'),(5,2013,5,'salida'),(6,2014,6,'salida'),(7,2015,8,'salida'),(8,2016,0,'salida');
/*!40000 ALTER TABLE `numeromovimiento` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `numerooc`
--

DROP TABLE IF EXISTS `numerooc`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `numerooc` (
  `idNumeroOC` int(11) NOT NULL AUTO_INCREMENT,
  `Ano` smallint(6) DEFAULT NULL,
  `Numero` int(11) DEFAULT NULL,
  `Codigo` varchar(5) DEFAULT NULL,
  `Documento` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`idNumeroOC`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `numerooc`
--

LOCK TABLES `numerooc` WRITE;
/*!40000 ALTER TABLE `numerooc` DISABLE KEYS */;
INSERT INTO `numerooc` VALUES (1,2013,3,'OC','OrdenCompra'),(2,2014,1,'OC','OrdenCompra'),(3,2015,0,'OC','OrdenCompra'),(4,2016,0,'OC','OrdenCompra');
/*!40000 ALTER TABLE `numerooc` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `numeroop`
--

DROP TABLE IF EXISTS `numeroop`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `numeroop` (
  `idNumeroOP` int(11) NOT NULL AUTO_INCREMENT,
  `idTipoOrdenProduccion` int(11) NOT NULL,
  `Ano` smallint(6) DEFAULT NULL,
  `Numero` int(11) DEFAULT NULL,
  PRIMARY KEY (`idNumeroOP`),
  KEY `fk_NumeroOP_TipoOrdenProduccion1_idx` (`idTipoOrdenProduccion`),
  CONSTRAINT `fk_NumeroOP_TipoOrdenProduccion1` FOREIGN KEY (`idTipoOrdenProduccion`) REFERENCES `tipoordenproduccion` (`idTipoOrdenProduccion`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `numeroop`
--

LOCK TABLES `numeroop` WRITE;
/*!40000 ALTER TABLE `numeroop` DISABLE KEYS */;
INSERT INTO `numeroop` VALUES (1,1,2013,9),(2,1,2014,4),(3,1,2015,0),(4,1,2016,0),(5,2,2013,0),(6,2,2014,0),(7,2,2015,0),(8,2,2016,0),(9,3,2013,1),(10,3,2014,0),(11,3,2015,0),(12,3,2016,0),(13,4,2013,0),(14,4,2014,0),(15,4,2015,0),(16,4,2016,0);
/*!40000 ALTER TABLE `numeroop` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `numeroos`
--

DROP TABLE IF EXISTS `numeroos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `numeroos` (
  `idNumeroOS` int(11) NOT NULL AUTO_INCREMENT,
  `Ano` smallint(6) DEFAULT NULL,
  `Numero` int(11) DEFAULT NULL,
  PRIMARY KEY (`idNumeroOS`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `numeroos`
--

LOCK TABLES `numeroos` WRITE;
/*!40000 ALTER TABLE `numeroos` DISABLE KEYS */;
INSERT INTO `numeroos` VALUES (1,2013,7),(2,2014,0),(3,2015,0),(4,2016,0);
/*!40000 ALTER TABLE `numeroos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `numerope`
--

DROP TABLE IF EXISTS `numerope`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `numerope` (
  `idNumero` int(11) NOT NULL AUTO_INCREMENT,
  `Ano` smallint(6) DEFAULT NULL,
  `Numero` int(11) DEFAULT NULL,
  PRIMARY KEY (`idNumero`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `numerope`
--

LOCK TABLES `numerope` WRITE;
/*!40000 ALTER TABLE `numerope` DISABLE KEYS */;
INSERT INTO `numerope` VALUES (1,2013,9),(2,2014,9),(3,2015,0),(4,2016,0);
/*!40000 ALTER TABLE `numerope` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `numeroprovision`
--

DROP TABLE IF EXISTS `numeroprovision`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `numeroprovision` (
  `idNumeroProvision` int(11) NOT NULL AUTO_INCREMENT,
  `Ano` smallint(6) DEFAULT NULL,
  `Mes` varchar(15) DEFAULT NULL,
  `Numero` int(11) DEFAULT NULL,
  `Usuario` varchar(20) DEFAULT NULL,
  `FechaRegistro` datetime DEFAULT NULL,
  `UsuarioModificacion` varchar(20) DEFAULT NULL,
  `FechaModificacion` datetime DEFAULT NULL,
  PRIMARY KEY (`idNumeroProvision`)
) ENGINE=InnoDB AUTO_INCREMENT=112 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `numeroprovision`
--

LOCK TABLES `numeroprovision` WRITE;
/*!40000 ALTER TABLE `numeroprovision` DISABLE KEYS */;
INSERT INTO `numeroprovision` VALUES (64,2013,'Enero',0,'admin','2014-06-14 00:00:00',NULL,NULL),(65,2013,'Febrero',0,'admin','2014-06-14 00:00:00',NULL,NULL),(66,2013,'Marzo',0,'admin','2014-06-14 00:00:00',NULL,NULL),(67,2013,'Abril',0,'admin','2014-06-14 00:00:00',NULL,NULL),(68,2013,'Mayo',0,'admin','2014-06-14 00:00:00',NULL,NULL),(69,2013,'Junio',0,'admin','2014-06-14 00:00:00',NULL,NULL),(70,2013,'Julio',0,'admin','2014-06-14 00:00:00',NULL,NULL),(71,2013,'Agosto',0,'admin','2014-06-14 00:00:00',NULL,NULL),(72,2013,'Septiembre',0,'admin','2014-06-14 00:00:00',NULL,NULL),(73,2013,'Octubre',0,'admin','2014-06-14 00:00:00',NULL,NULL),(74,2013,'Noviembre',0,'admin','2014-06-14 00:00:00',NULL,NULL),(75,2013,'Diciembre',0,'admin','2014-06-14 00:00:00',NULL,NULL),(76,2014,'Enero',29,'admin','2014-06-14 00:00:00','admin','2015-06-27 00:00:00'),(77,2014,'Febrero',0,'admin','2014-06-14 00:00:00',NULL,NULL),(78,2014,'Marzo',0,'admin','2014-06-14 00:00:00',NULL,NULL),(79,2014,'Abril',0,'admin','2014-06-14 00:00:00',NULL,NULL),(80,2014,'Mayo',0,'admin','2014-06-14 00:00:00',NULL,NULL),(81,2014,'Junio',0,'admin','2014-06-14 00:00:00',NULL,NULL),(82,2014,'Julio',0,'admin','2014-06-14 00:00:00',NULL,NULL),(83,2014,'Agosto',0,'admin','2014-06-14 00:00:00',NULL,NULL),(84,2014,'Septiembre',0,'admin','2014-06-14 00:00:00',NULL,NULL),(85,2014,'Octubre',0,'admin','2014-06-14 00:00:00',NULL,NULL),(86,2014,'Noviembre',0,'admin','2014-06-14 00:00:00',NULL,NULL),(87,2014,'Diciembre',0,'admin','2014-06-14 00:00:00',NULL,NULL),(88,2015,'Enero',0,'admin','2014-06-14 00:00:00',NULL,NULL),(89,2015,'Febrero',0,'admin','2014-06-14 00:00:00',NULL,NULL),(90,2015,'Marzo',0,'admin','2014-06-14 00:00:00',NULL,NULL),(91,2015,'Abril',0,'admin','2014-06-14 00:00:00',NULL,NULL),(92,2015,'Mayo',0,'admin','2014-06-14 00:00:00',NULL,NULL),(93,2015,'Junio',0,'admin','2014-06-14 00:00:00',NULL,NULL),(94,2015,'Julio',0,'admin','2014-06-14 00:00:00',NULL,NULL),(95,2015,'Agosto',0,'admin','2014-06-14 00:00:00',NULL,NULL),(96,2015,'Septiembre',0,'admin','2014-06-14 00:00:00',NULL,NULL),(97,2015,'Octubre',0,'admin','2014-06-14 00:00:00',NULL,NULL),(98,2015,'Noviembre',0,'admin','2014-06-14 00:00:00',NULL,NULL),(99,2015,'Diciembre',0,'admin','2014-06-14 00:00:00',NULL,NULL),(100,2016,'Enero',0,'admin','2014-06-14 00:00:00',NULL,NULL),(101,2016,'Febrero',0,'admin','2014-06-14 00:00:00',NULL,NULL),(102,2016,'Marzo',0,'admin','2014-06-14 00:00:00',NULL,NULL),(103,2016,'Abril',0,'admin','2014-06-14 00:00:00',NULL,NULL),(104,2016,'Mayo',0,'admin','2014-06-14 00:00:00',NULL,NULL),(105,2016,'Junio',0,'admin','2014-06-14 00:00:00',NULL,NULL),(106,2016,'Julio',0,'admin','2014-06-14 00:00:00',NULL,NULL),(107,2016,'Agosto',0,'admin','2014-06-14 00:00:00',NULL,NULL),(108,2016,'Septiembre',0,'admin','2014-06-14 00:00:00',NULL,NULL),(109,2016,'Octubre',0,'admin','2014-06-14 00:00:00',NULL,NULL),(110,2016,'Noviembre',0,'admin','2014-06-14 00:00:00',NULL,NULL),(111,2016,'Diciembre',0,'admin','2014-06-14 00:00:00',NULL,NULL);
/*!40000 ALTER TABLE `numeroprovision` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `numeroserie`
--

DROP TABLE IF EXISTS `numeroserie`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `numeroserie` (
  `idNumeroSerie` int(11) NOT NULL AUTO_INCREMENT,
  `Ano` smallint(6) DEFAULT NULL,
  `Mes` tinyint(4) DEFAULT NULL,
  `Numero` int(11) DEFAULT NULL,
  `Serie` int(11) DEFAULT NULL,
  `Documento` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`idNumeroSerie`)
) ENGINE=InnoDB AUTO_INCREMENT=39 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `numeroserie`
--

LOCK TABLES `numeroserie` WRITE;
/*!40000 ALTER TABLE `numeroserie` DISABLE KEYS */;
INSERT INTO `numeroserie` VALUES (3,2013,1,0,0,'Cotizacion'),(4,2013,2,14,0,'Cotizacion'),(5,2013,3,6,0,'Cotizacion'),(6,2013,4,2,0,'Cotizacion'),(7,2013,5,0,0,'Cotizacion'),(8,2013,6,0,0,'Cotizacion'),(9,2013,7,0,0,'Cotizacion'),(10,2013,8,0,0,'Cotizacion'),(11,2013,9,0,0,'Cotizacion'),(12,2013,10,0,0,'Cotizacion'),(13,2013,11,0,0,'Cotizacion'),(14,2013,12,1,0,'Cotizacion'),(15,2014,1,1,0,'Cotizacion'),(16,2014,2,2,0,'Cotizacion'),(17,2014,3,1,0,'Cotizacion'),(18,2014,4,0,0,'Cotizacion'),(19,2014,5,0,0,'Cotizacion'),(20,2014,6,0,0,'Cotizacion'),(21,2014,7,0,0,'Cotizacion'),(22,2014,8,0,0,'Cotizacion'),(23,2014,9,0,0,'Cotizacion'),(24,2014,10,0,0,'Cotizacion'),(25,2014,11,0,0,'Cotizacion'),(26,2014,12,0,0,'Cotizacion'),(27,2015,1,0,0,'Cotizacion'),(28,2015,2,0,0,'Cotizacion'),(29,2015,3,0,0,'Cotizacion'),(30,2015,4,0,0,'Cotizacion'),(31,2015,5,0,0,'Cotizacion'),(32,2015,6,0,0,'Cotizacion'),(33,2015,7,0,0,'Cotizacion'),(34,2015,8,0,0,'Cotizacion'),(35,2015,9,0,0,'Cotizacion'),(36,2015,10,0,0,'Cotizacion'),(37,2015,11,0,0,'Cotizacion'),(38,2015,12,0,0,'Cotizacion');
/*!40000 ALTER TABLE `numeroserie` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `numerotareo`
--

DROP TABLE IF EXISTS `numerotareo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `numerotareo` (
  `idnumerotareo` int(11) NOT NULL AUTO_INCREMENT,
  `Anio` int(11) DEFAULT NULL,
  `Mes` varchar(50) DEFAULT NULL,
  `Numero` int(11) DEFAULT NULL,
  PRIMARY KEY (`idnumerotareo`)
) ENGINE=InnoDB AUTO_INCREMENT=37 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `numerotareo`
--

LOCK TABLES `numerotareo` WRITE;
/*!40000 ALTER TABLE `numerotareo` DISABLE KEYS */;
INSERT INTO `numerotareo` VALUES (1,2015,'Enero',13),(2,2015,'Febrero',0),(3,2015,'Marzo',0),(4,2015,'Abril',0),(5,2015,'Mayo',0),(6,2015,'Junio',0),(7,2015,'Julio',0),(8,2015,'Agosto',0),(9,2015,'Setiembre',0),(10,2015,'Octubre',0),(11,2015,'Noviembre',0),(12,2015,'Diciembre',0),(13,2016,'Enero',0),(14,2016,'Febrero',0),(15,2016,'Marzo',0),(16,2016,'Abril',0),(17,2016,'Mayo',0),(18,2016,'Junio',0),(19,2016,'Julio',0),(20,2016,'Agosto',0),(21,2016,'Setiembre',0),(22,2016,'Octubre',0),(23,2016,'Noviembre',0),(24,2016,'Diciembre',0),(25,2017,'Enero',0),(26,2017,'Febrero',0),(27,2017,'Marzo',0),(28,2017,'Abril',0),(29,2017,'Mayo',0),(30,2017,'Junio',0),(31,2017,'Julio',0),(32,2017,'Agosto',0),(33,2017,'Setiembre',0),(34,2017,'Octubre',0),(35,2017,'Noviembre',0),(36,2017,'Diciembre',0);
/*!40000 ALTER TABLE `numerotareo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `opcion`
--

DROP TABLE IF EXISTS `opcion`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `opcion` (
  `idOpcion` int(11) NOT NULL AUTO_INCREMENT,
  `idModulo` int(11) NOT NULL,
  `Descripcion` varchar(50) DEFAULT NULL,
  `Activo` bit(1) DEFAULT b'1',
  `Usuario` varchar(20) DEFAULT NULL,
  `FechaRegistro` datetime DEFAULT NULL,
  `UsuarioModificacion` varchar(20) DEFAULT NULL,
  `FechaModificacion` datetime DEFAULT NULL,
  PRIMARY KEY (`idOpcion`),
  KEY `fk_Opcion_Modulo_idx` (`idModulo`),
  CONSTRAINT `fk_Opcion_Modulo` FOREIGN KEY (`idModulo`) REFERENCES `modulo` (`idModulo`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `opcion`
--

LOCK TABLES `opcion` WRITE;
/*!40000 ALTER TABLE `opcion` DISABLE KEYS */;
INSERT INTO `opcion` VALUES (6,1,'Inicio Usuario','','admin','2013-01-17 00:00:00',NULL,NULL),(7,1,'Grabar Usuario','','admin','2013-01-17 00:00:00',NULL,NULL),(8,1,'Buscar Usuario','','admin','2013-01-17 00:00:00',NULL,NULL),(9,1,'Editar Usuario','','admin','2013-01-17 00:00:00',NULL,NULL),(10,1,'Eliminar Usuario','','admin','2013-01-17 00:00:00',NULL,NULL),(11,1,'Administrar Usuario','','admin','2013-01-17 00:00:00',NULL,NULL),(12,1,'Inicio Permiso','','admin','2013-01-17 00:00:00',NULL,NULL),(13,1,'Grabar Permiso','','admin','2013-01-17 00:00:00',NULL,NULL),(14,1,'Buscar Permiso','','admin','2013-01-17 00:00:00',NULL,NULL),(15,1,'Eliminar Permiso','','admin','2013-01-17 00:00:00',NULL,NULL),(16,1,'Administrar Permiso','','admin','2013-01-17 00:00:00',NULL,NULL);
/*!40000 ALTER TABLE `opcion` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ordencompra`
--

DROP TABLE IF EXISTS `ordencompra`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ordencompra` (
  `idOrdenCompra` int(11) NOT NULL AUTO_INCREMENT,
  `idSucursal` int(11) NOT NULL,
  `idFormaPago` int(11) NOT NULL,
  `idMoneda` int(11) NOT NULL,
  `idClienteProveedor` int(11) NOT NULL,
  `Fecha` datetime DEFAULT NULL,
  `TipoCambio` decimal(6,3) DEFAULT NULL,
  `FechaEntrega` datetime DEFAULT NULL,
  `Observaciones` varchar(200) DEFAULT NULL,
  `IGV` decimal(6,3) DEFAULT NULL,
  `SubTotal` decimal(9,3) DEFAULT NULL,
  `Total` decimal(9,3) DEFAULT NULL,
  `Numero` varchar(20) DEFAULT NULL,
  `Estado` varchar(20) DEFAULT 'Activo',
  `Afecto` bit(1) DEFAULT b'1',
  `Activo` bit(1) DEFAULT b'1',
  `Usuario` varchar(20) DEFAULT NULL,
  `FechaRegistro` datetime DEFAULT NULL,
  `UsuarioModificacion` varchar(20) DEFAULT NULL,
  `FechaModificacion` datetime DEFAULT NULL,
  PRIMARY KEY (`idOrdenCompra`),
  KEY `fk_OrdenCompra_Sucursal1_idx` (`idSucursal`),
  KEY `fk_OrdenCompra_FormaPago1_idx` (`idFormaPago`),
  KEY `fk_OrdenCompra_Moneda1_idx` (`idMoneda`),
  KEY `fk_OrdenCompra_ClienteProveedor1_idx` (`idClienteProveedor`),
  CONSTRAINT `fk_OrdenCompra_ClienteProveedor1` FOREIGN KEY (`idClienteProveedor`) REFERENCES `clienteproveedor` (`idClienteProveedor`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_OrdenCompra_FormaPago1` FOREIGN KEY (`idFormaPago`) REFERENCES `formapago` (`idFormaPago`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_OrdenCompra_Moneda1` FOREIGN KEY (`idMoneda`) REFERENCES `moneda` (`idMoneda`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_OrdenCompra_Sucursal1` FOREIGN KEY (`idSucursal`) REFERENCES `sucursal` (`idSucursal`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=35 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ordencompra`
--

LOCK TABLES `ordencompra` WRITE;
/*!40000 ALTER TABLE `ordencompra` DISABLE KEYS */;
INSERT INTO `ordencompra` VALUES (30,3,2,9,3,'2013-02-26 00:00:00',0.290,'2013-02-28 00:00:00','dasa',19.000,22.680,28.000,'xxx','Activo','','','admin','2013-02-26 00:00:00','admin','2014-05-21 00:00:00'),(31,3,3,8,5,'2013-03-01 00:00:00',0.390,'2013-03-25 00:00:00','vamos a verlo',19.000,48.600,60.000,'OC-000001/2013','Aprobado','','','admin','2013-03-01 00:00:00','admin','2014-05-21 00:00:00'),(32,3,2,9,3,'2013-03-04 00:00:00',0.290,'2013-03-31 00:00:00','otro mas',18.000,125.460,153.000,'OC-000002/2013','Activo','','','admin','2013-03-04 00:00:00','admin','2014-05-21 00:00:00'),(33,2,1,7,1,'2013-03-04 00:00:00',1.000,'2013-03-31 00:00:00','y otro mas',19.000,93.150,115.000,'OC-000003/2013','Activo','','','admin','2013-03-04 00:00:00','admin','2014-11-01 00:00:00'),(34,2,1,7,3,'2014-11-01 00:00:00',1.000,'2014-11-13 00:00:00','probando error',19.100,271.000,271.000,'OC-000001/2014','Activo','\0','','admin','2014-11-01 00:00:00','admin','2014-11-01 00:00:00');
/*!40000 ALTER TABLE `ordencompra` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ordencompraproducto`
--

DROP TABLE IF EXISTS `ordencompraproducto`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ordencompraproducto` (
  `idOrdenCompraProducto` int(11) NOT NULL AUTO_INCREMENT,
  `idOrdenCompra` int(11) NOT NULL,
  `idProducto` int(11) NOT NULL,
  `Cantidad` int(11) DEFAULT NULL,
  `PrecioUnitario` decimal(9,3) DEFAULT NULL,
  `Descuento` decimal(6,3) DEFAULT NULL,
  `Importe` decimal(9,3) DEFAULT NULL,
  `Glosa` varchar(200) DEFAULT NULL,
  `Activo` bit(1) DEFAULT b'1',
  `Usuario` varchar(20) DEFAULT NULL,
  `FechaRegistro` datetime DEFAULT NULL,
  `UsuarioModificacion` varchar(20) DEFAULT NULL,
  `FechaModificacion` datetime DEFAULT NULL,
  PRIMARY KEY (`idOrdenCompraProducto`),
  KEY `fk_OrdenCompraProducto_OrdenCompra1_idx` (`idOrdenCompra`),
  KEY `fk_OrdenCompraProducto_Producto1_idx` (`idProducto`),
  CONSTRAINT `fk_OrdenCompraProducto_OrdenCompra1` FOREIGN KEY (`idOrdenCompra`) REFERENCES `ordencompra` (`idOrdenCompra`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_OrdenCompraProducto_Producto1` FOREIGN KEY (`idProducto`) REFERENCES `producto` (`idProducto`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=36 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ordencompraproducto`
--

LOCK TABLES `ordencompraproducto` WRITE;
/*!40000 ALTER TABLE `ordencompraproducto` DISABLE KEYS */;
INSERT INTO `ordencompraproducto` VALUES (1,30,2,4,7.000,1.000,28.000,'asdas','\0','admin','2013-02-26 00:00:00','admin','2014-05-21 00:00:00'),(2,31,2,5,7.000,5.000,35.000,'asdasd','\0','admin','2013-03-01 00:00:00','admin','2014-05-21 00:00:00'),(3,31,6,5,5.000,5.000,25.000,'asdad','\0','admin','2013-03-01 00:00:00','admin','2014-05-21 00:00:00'),(4,31,2,5,7.000,5.000,35.000,'asdasd','\0','admin','2013-03-01 00:00:00','admin','2014-05-21 00:00:00'),(5,31,6,5,5.000,5.000,25.000,'asdad','\0','admin','2013-03-01 00:00:00','admin','2014-05-21 00:00:00'),(6,31,6,5,5.000,5.000,25.000,'asdad','\0','admin','2013-03-02 00:00:00','admin','2014-05-21 00:00:00'),(7,31,2,5,7.000,5.000,35.000,'asdasd','\0','admin','2013-03-02 00:00:00','admin','2014-05-21 00:00:00'),(8,32,6,5,5.000,0.000,25.000,'vadsa','\0','admin','2013-03-04 00:00:00','admin','2014-05-21 00:00:00'),(9,32,7,8,7.000,0.000,56.000,'asda','\0','admin','2013-03-04 00:00:00','admin','2014-05-21 00:00:00'),(10,32,9,9,8.000,0.000,72.000,'','\0','admin','2013-03-04 00:00:00','admin','2014-05-21 00:00:00'),(11,33,4,5,8.000,0.000,40.000,'asda','\0','admin','2013-03-04 00:00:00','admin','2014-11-01 00:00:00'),(12,33,3,3,7.000,0.000,21.000,'','\0','admin','2013-03-04 00:00:00','admin','2014-11-01 00:00:00'),(13,33,5,6,9.000,0.000,54.000,'as','\0','admin','2013-03-04 00:00:00','admin','2014-11-01 00:00:00'),(14,32,6,5,5.000,0.000,25.000,'vadsa','\0','admin','2013-03-04 00:00:00','admin','2014-05-21 00:00:00'),(15,32,7,8,7.000,0.000,56.000,'asda','\0','admin','2013-03-04 00:00:00','admin','2014-05-21 00:00:00'),(16,32,9,9,8.000,0.000,72.000,'','\0','admin','2013-03-04 00:00:00','admin','2014-05-21 00:00:00'),(17,33,4,5,8.000,0.000,40.000,'asda','\0','admin','2014-05-21 00:00:00','admin','2014-11-01 00:00:00'),(18,33,3,3,7.000,0.000,21.000,'','\0','admin','2014-05-21 00:00:00','admin','2014-11-01 00:00:00'),(19,33,5,6,9.000,0.000,54.000,'as','\0','admin','2014-05-21 00:00:00','admin','2014-11-01 00:00:00'),(20,32,6,5,5.000,0.000,25.000,'vadsa','','admin','2014-05-21 00:00:00',NULL,NULL),(21,32,7,8,7.000,0.000,56.000,'asda','','admin','2014-05-21 00:00:00',NULL,NULL),(22,32,9,9,8.000,0.000,72.000,'','','admin','2014-05-21 00:00:00',NULL,NULL),(23,31,6,5,5.000,5.000,25.000,'asdad','','admin','2014-05-21 00:00:00',NULL,NULL),(24,31,2,5,7.000,5.000,35.000,'asdasd','','admin','2014-05-21 00:00:00',NULL,NULL),(25,30,2,4,7.000,1.000,28.000,'asdas','','admin','2014-05-21 00:00:00',NULL,NULL),(26,33,4,5,8.000,0.000,40.000,'asda','','admin','2014-11-01 00:00:00',NULL,NULL),(27,33,5,6,9.000,0.000,54.000,'as','','admin','2014-11-01 00:00:00',NULL,NULL),(28,33,3,3,7.000,0.000,21.000,'','','admin','2014-11-01 00:00:00',NULL,NULL),(29,34,2,5,35.000,2.000,175.000,'primer item','\0','admin','2014-11-01 00:00:00','admin','2014-11-01 00:00:00'),(30,34,6,8,12.000,2.000,96.000,'segundo item','\0','admin','2014-11-01 00:00:00','admin','2014-11-01 00:00:00'),(31,34,2,5,35.000,2.000,175.000,'primer item','\0','admin','2014-11-01 00:00:00','admin','2014-11-01 00:00:00'),(32,34,6,8,12.000,2.000,96.000,'segundo item','\0','admin','2014-11-01 00:00:00','admin','2014-11-01 00:00:00'),(33,34,6,8,12.000,2.000,96.000,'segundo item','','admin','2014-11-01 00:00:00',NULL,NULL),(34,34,2,5,35.000,2.000,175.000,'primer item','','admin','2014-11-01 00:00:00',NULL,NULL),(35,34,7,0,7.000,0.000,0.000,'','','admin','2014-11-01 00:00:00',NULL,NULL);
/*!40000 ALTER TABLE `ordencompraproducto` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ordenproduccion`
--

DROP TABLE IF EXISTS `ordenproduccion`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ordenproduccion` (
  `idOrdenProduccion` int(11) NOT NULL AUTO_INCREMENT,
  `idSucursal` int(11) DEFAULT NULL,
  `idCotizacion` int(11) DEFAULT NULL,
  `idProducto` int(11) NOT NULL,
  `idTipoOrdenProduccion` int(11) NOT NULL,
  `idCentroCosto` int(11) NOT NULL,
  `idClienteProveedor` int(11) NOT NULL,
  `Fecha` datetime DEFAULT NULL,
  `numero` varchar(20) DEFAULT NULL,
  `FechaInicio` datetime DEFAULT NULL,
  `FechaTermino` datetime DEFAULT NULL,
  `Observaciones` varchar(200) DEFAULT NULL,
  `Monto` decimal(9,3) DEFAULT NULL,
  `Estado` varchar(20) DEFAULT 'Aprobado',
  `PedidoGenerado` bit(1) DEFAULT b'0',
  `Activo` bit(1) DEFAULT b'1',
  `Usuario` varchar(20) DEFAULT NULL,
  `FechaRegistro` datetime DEFAULT NULL,
  `UsuarioModificacion` varchar(20) DEFAULT NULL,
  `FechaModificacion` datetime DEFAULT NULL,
  PRIMARY KEY (`idOrdenProduccion`),
  KEY `fk_OrdenProduccion_Sucursal1_idx` (`idSucursal`),
  KEY `fk_OrdenProduccion_Cotizacion1_idx` (`idCotizacion`),
  KEY `fk_OrdenProduccion_Producto1_idx` (`idProducto`),
  KEY `fk_OrdenProduccion_TipoOrdenProduccion1_idx` (`idTipoOrdenProduccion`),
  KEY `fk_OrdenProduccion_CentroCosto1_idx` (`idCentroCosto`),
  KEY `fk_OrdenProduccion_ClienteProveedor1_idx` (`idClienteProveedor`),
  CONSTRAINT `fk_OrdenProduccion_CentroCosto1` FOREIGN KEY (`idCentroCosto`) REFERENCES `centrocosto` (`idCentroCosto`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_OrdenProduccion_ClienteProveedor1` FOREIGN KEY (`idClienteProveedor`) REFERENCES `clienteproveedor` (`idClienteProveedor`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_OrdenProduccion_Cotizacion1` FOREIGN KEY (`idCotizacion`) REFERENCES `cotizacion` (`idCotizacion`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_OrdenProduccion_Producto1` FOREIGN KEY (`idProducto`) REFERENCES `producto` (`idProducto`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_OrdenProduccion_Sucursal1` FOREIGN KEY (`idSucursal`) REFERENCES `sucursal` (`idSucursal`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_OrdenProduccion_TipoOrdenProduccion1` FOREIGN KEY (`idTipoOrdenProduccion`) REFERENCES `tipoordenproduccion` (`idTipoOrdenProduccion`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ordenproduccion`
--

LOCK TABLES `ordenproduccion` WRITE;
/*!40000 ALTER TABLE `ordenproduccion` DISABLE KEYS */;
INSERT INTO `ordenproduccion` VALUES (1,NULL,154,0,0,0,0,'2013-02-28 00:00:00','000001',NULL,NULL,NULL,35.000,'Aprobado','\0','\0',NULL,NULL,NULL,NULL),(2,NULL,154,0,0,0,0,'2013-02-28 00:00:00','OP-000002/2013',NULL,NULL,NULL,35.000,'Aprobado','\0','',NULL,NULL,NULL,NULL),(3,2,148,0,0,0,0,'2013-02-28 00:00:00','OP-000003/2013','2013-03-01 00:00:00','2013-03-31 00:00:00','',510.000,'Aprobado','\0','',NULL,NULL,'admin','2013-03-01 00:00:00'),(4,2,155,2,0,1,0,'2013-03-01 00:00:00','OP-000004/2013','2013-03-01 00:00:00','2013-03-31 00:00:00','',70.000,'Aprobado','\0','','admin','2013-03-01 00:00:00','admin','2013-03-21 00:00:00'),(5,2,150,2,1,0,0,'2013-03-01 00:00:00','','2013-03-01 00:00:00','2013-03-31 00:00:00','',210.000,'Aprobado','\0','','admin','2013-03-01 00:00:00','admin','2013-03-01 00:00:00'),(6,NULL,156,2,1,0,0,'2013-03-01 00:00:00','xxx',NULL,NULL,NULL,70.000,'Aprobado','\0','','admin','2013-03-01 00:00:00',NULL,NULL),(7,2,157,2,1,0,0,'2013-03-01 00:00:00','OP-000005/2013','2013-03-01 00:00:00','2013-03-31 00:00:00','vamos viendo si se graba la glosa o comentario',70.000,'Aprobado','\0','','admin','2013-03-01 00:00:00','admin','2013-03-01 00:00:00'),(8,2,NULL,2,3,0,0,'2013-03-01 00:00:00','OR-000001/2013','2013-03-01 00:00:00','2013-03-31 00:00:00','orden de reparacion papa',200.000,'Aprobado','\0','','admin','2013-03-01 00:00:00',NULL,NULL),(9,3,159,2,1,2,3,'2013-03-03 00:00:00','OP-000006/2013','2013-03-03 00:00:00','2013-03-31 00:00:00','de las ultimas',70.000,'Aprobado','\0','','admin','2013-03-03 00:00:00','admin','2013-03-03 00:00:00'),(10,3,161,6,1,1,3,'2013-04-03 00:00:00','OP-000007/2013','2013-04-02 00:00:00','2013-04-24 00:00:00','',74.000,'Aprobado','\0','','admin','2013-04-03 00:00:00','admin','2013-04-24 00:00:00'),(11,NULL,164,2,1,2,3,'2013-04-19 00:00:00','OP-000008/2013',NULL,NULL,NULL,0.000,'Aprobado','\0','','admin','2013-04-19 00:00:00',NULL,NULL),(12,NULL,165,2,1,2,3,'2013-12-29 00:00:00','OP-000009/2013',NULL,NULL,NULL,25.000,'Aprobado','\0','','admin','2013-12-29 00:00:00',NULL,NULL),(13,2,166,2,1,2,4,'2014-01-25 00:00:00','OP-000001/2014','2014-01-01 00:00:00','2014-01-31 00:00:00','orden de produccion para alca',25.000,'Aprobado','\0','','admin','2014-01-25 00:00:00','admin','2014-01-25 00:00:00'),(14,NULL,167,3,1,2,5,'2014-02-16 00:00:00','OP-000002/2014',NULL,NULL,NULL,290.000,'Aprobado','\0','','admin','2014-02-16 00:00:00',NULL,NULL),(15,NULL,168,2,1,2,1,'2014-02-25 00:00:00','OP-000003/2014','2014-02-25 00:00:00',NULL,NULL,187.000,'Aprobado','','','admin','2014-02-25 00:00:00','admin','2014-03-03 00:00:00'),(16,2,169,2,1,2,3,'2014-03-24 00:00:00','OP-000004/2014','2014-03-24 00:00:00','2014-07-31 00:00:00','',1870.000,'Aprobado','','','admin','2014-03-24 00:00:00','admin','2014-07-26 00:00:00');
/*!40000 ALTER TABLE `ordenproduccion` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ordenservicio`
--

DROP TABLE IF EXISTS `ordenservicio`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ordenservicio` (
  `idOrdenServicio` int(11) NOT NULL,
  `idCentroCosto` int(11) NOT NULL,
  `idFormaPago` int(11) NOT NULL,
  `idMoneda` int(11) NOT NULL,
  `idClienteProveedor` int(11) NOT NULL,
  `idSucursal` int(11) DEFAULT NULL,
  `Fecha` datetime DEFAULT NULL,
  `TipoCambio` decimal(6,3) DEFAULT NULL,
  `FechaEntrega` datetime DEFAULT NULL,
  `Observaciones` varchar(200) DEFAULT NULL,
  `IGV` decimal(6,3) DEFAULT NULL,
  `Subtotal` decimal(9,3) DEFAULT NULL,
  `Monto` decimal(9,3) DEFAULT NULL,
  `Numero` varchar(20) DEFAULT NULL,
  `Estado` varchar(20) DEFAULT 'Activo',
  `Afecto` bit(1) DEFAULT b'1',
  `Activo` bit(1) DEFAULT b'1',
  `Usuario` varchar(20) DEFAULT NULL,
  `FechaRegistro` datetime DEFAULT NULL,
  `UsuarioModificacion` varchar(20) DEFAULT NULL,
  `FechaModificacion` datetime DEFAULT NULL,
  PRIMARY KEY (`idOrdenServicio`),
  KEY `fk_OrdenServicio_CentroCosto1_idx` (`idCentroCosto`),
  KEY `fk_OrdenServicio_FormaPago1_idx` (`idFormaPago`),
  KEY `fk_OrdenServicio_Moneda1_idx` (`idMoneda`),
  KEY `fk_OrdenServicio_ClienteProveedor1_idx` (`idClienteProveedor`),
  KEY `fk_OrdenServicio_Sucursal1_idx` (`idSucursal`),
  CONSTRAINT `fk_OrdenServicio_CentroCosto1` FOREIGN KEY (`idCentroCosto`) REFERENCES `centrocosto` (`idCentroCosto`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_OrdenServicio_ClienteProveedor1` FOREIGN KEY (`idClienteProveedor`) REFERENCES `clienteproveedor` (`idClienteProveedor`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_OrdenServicio_FormaPago1` FOREIGN KEY (`idFormaPago`) REFERENCES `formapago` (`idFormaPago`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_OrdenServicio_Moneda1` FOREIGN KEY (`idMoneda`) REFERENCES `moneda` (`idMoneda`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_OrdenServicio_Sucursal1` FOREIGN KEY (`idSucursal`) REFERENCES `sucursal` (`idSucursal`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ordenservicio`
--

LOCK TABLES `ordenservicio` WRITE;
/*!40000 ALTER TABLE `ordenservicio` DISABLE KEYS */;
INSERT INTO `ordenservicio` VALUES (1,2,3,8,6,2,'2013-03-06 00:00:00',0.390,'2013-03-30 00:00:00','sdfsfsdfs',190.000,-32.400,36.000,'OS-000001/2013','Activo','','','admin','2013-03-06 00:00:00','admin','2014-05-21 00:00:00'),(2,2,3,9,6,2,'2013-03-06 00:00:00',0.290,'2013-03-30 00:00:00','ghjg',190.000,-46.800,52.000,'OS-000002/2013','Activo','','','admin','2013-03-06 00:00:00','admin','2014-05-21 00:00:00'),(3,2,3,8,6,2,'2013-03-06 00:00:00',0.390,'2013-03-30 00:00:00','vamos a verlo',190.000,-54.000,60.000,'OS-000003/2013','Activo','','','admin','2013-03-06 00:00:00','admin','2014-05-21 00:00:00'),(4,2,3,8,6,2,'2013-03-06 00:00:00',0.390,'2013-03-30 00:00:00','',190.000,-61.200,68.000,'OS-000004/2013','Activo','','','admin','2013-03-06 00:00:00','admin','2014-05-21 00:00:00'),(5,2,3,8,6,2,'2013-03-06 00:00:00',0.390,'2013-03-30 00:00:00','',19.000,51.030,63.000,'OS-000005/2013','Activo','','','admin','2013-03-06 00:00:00','admin','2014-05-21 00:00:00'),(6,2,3,8,6,2,'2013-03-06 00:00:00',0.390,'2013-03-30 00:00:00','',19.000,17.010,21.000,'OS-000006/2013','Activo','','','admin','2013-03-11 00:00:00','admin','2014-05-21 00:00:00'),(7,2,2,8,5,3,'2013-03-12 00:00:00',0.390,'2013-03-31 00:00:00','',19.000,5.670,7.000,'OS-000007/2013','Activo','','','admin','2013-03-12 00:00:00','admin','2014-05-21 00:00:00');
/*!40000 ALTER TABLE `ordenservicio` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ordenservicioproducto`
--

DROP TABLE IF EXISTS `ordenservicioproducto`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ordenservicioproducto` (
  `idOrdenServicioProducto` int(11) NOT NULL AUTO_INCREMENT,
  `idOrdenServicio` int(11) NOT NULL,
  `idProducto` int(11) NOT NULL,
  `idOrdenProduccion` int(11) DEFAULT NULL,
  `Cantidad` int(11) DEFAULT NULL,
  `PrecioUnitario` decimal(9,3) DEFAULT NULL,
  `Descuento` decimal(9,3) DEFAULT NULL,
  `Importe` decimal(9,3) DEFAULT NULL,
  `Glosa` varchar(200) DEFAULT NULL,
  `Activo` bit(1) DEFAULT b'1',
  `Usuario` varchar(20) DEFAULT NULL,
  `FechaRegistro` datetime DEFAULT NULL,
  `UsuarioModificacion` varchar(20) DEFAULT NULL,
  `FechaModificacion` datetime DEFAULT NULL,
  PRIMARY KEY (`idOrdenServicioProducto`),
  KEY `fk_OrdenServicioProducto_OrdenServicio1_idx` (`idOrdenServicio`),
  KEY `fk_OrdenServicioProducto_Producto1_idx` (`idProducto`),
  KEY `fk_OrdenServicioProducto_OrdenProduccion1_idx` (`idOrdenProduccion`),
  CONSTRAINT `fk_OrdenServicioProducto_OrdenProduccion1` FOREIGN KEY (`idOrdenProduccion`) REFERENCES `ordenproduccion` (`idOrdenProduccion`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_OrdenServicioProducto_OrdenServicio1` FOREIGN KEY (`idOrdenServicio`) REFERENCES `ordenservicio` (`idOrdenServicio`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_OrdenServicioProducto_Producto1` FOREIGN KEY (`idProducto`) REFERENCES `producto` (`idProducto`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=28 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ordenservicioproducto`
--

LOCK TABLES `ordenservicioproducto` WRITE;
/*!40000 ALTER TABLE `ordenservicioproducto` DISABLE KEYS */;
INSERT INTO `ordenservicioproducto` VALUES (5,5,7,7,4,7.000,3.000,28.000,'f','\0','admin','2013-03-06 00:00:00','admin','2014-05-21 00:00:00'),(6,5,2,3,5,7.000,0.000,35.000,'sdf','\0','admin','2013-03-06 00:00:00','admin','2014-05-21 00:00:00'),(7,6,7,4,3,7.000,0.000,21.000,'asda','\0','admin','2013-03-11 00:00:00','admin','2014-05-21 00:00:00'),(8,6,7,4,3,7.000,0.000,21.000,'asda','\0','admin','2013-03-11 00:00:00','admin','2014-05-21 00:00:00'),(9,6,7,4,3,7.000,0.000,21.000,'asda','\0','admin','2013-03-11 00:00:00','admin','2014-05-21 00:00:00'),(10,6,7,4,3,7.000,0.000,21.000,'asda','\0','admin','2013-03-11 00:00:00','admin','2014-05-21 00:00:00'),(11,6,7,4,3,7.000,0.000,21.000,'asda','\0','admin','2013-03-11 00:00:00','admin','2014-05-21 00:00:00'),(12,6,7,4,3,7.000,0.000,21.000,'asda','\0','admin','2013-03-11 00:00:00','admin','2014-05-21 00:00:00'),(13,6,7,4,3,7.000,0.000,21.000,'asda','\0','admin','2013-03-11 00:00:00','admin','2014-05-21 00:00:00'),(14,6,7,4,3,7.000,0.000,21.000,'asda','\0','admin','2013-03-11 00:00:00','admin','2014-05-21 00:00:00'),(15,6,7,4,3,7.000,0.000,21.000,'asda','\0','admin','2013-03-11 00:00:00','admin','2014-05-21 00:00:00'),(16,6,7,4,3,7.000,0.000,21.000,'asda','\0','admin','2013-03-11 00:00:00','admin','2014-05-21 00:00:00'),(17,5,7,7,4,7.000,3.000,28.000,'f','\0','admin','2013-03-11 00:00:00','admin','2014-05-21 00:00:00'),(18,5,2,3,5,7.000,0.000,35.000,'sdf','\0','admin','2013-03-11 00:00:00','admin','2014-05-21 00:00:00'),(19,7,7,9,1,7.000,0.000,7.000,'probando','\0','admin','2013-03-12 00:00:00','admin','2014-05-21 00:00:00'),(20,7,7,9,1,7.000,0.000,7.000,'probando','\0','admin','2013-03-12 00:00:00','admin','2014-05-21 00:00:00'),(21,7,7,9,1,7.000,0.000,7.000,'probando','\0','admin','2013-03-12 00:00:00','admin','2014-05-21 00:00:00'),(22,7,7,9,1,7.000,0.000,7.000,'probando','\0','admin','2013-03-12 00:00:00','admin','2014-05-21 00:00:00'),(23,7,7,9,1,7.000,0.000,7.000,'probando','\0','admin','2013-03-12 00:00:00','admin','2014-05-21 00:00:00'),(24,7,7,9,1,7.000,0.000,7.000,'probando','','admin','2014-05-21 00:00:00',NULL,NULL),(25,6,7,4,3,7.000,0.000,21.000,'asda','','admin','2014-05-21 00:00:00',NULL,NULL),(26,5,7,7,4,7.000,3.000,28.000,'f','','admin','2014-05-21 00:00:00',NULL,NULL),(27,5,2,3,5,7.000,0.000,35.000,'sdf','','admin','2014-05-21 00:00:00',NULL,NULL);
/*!40000 ALTER TABLE `ordenservicioproducto` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pedido`
--

DROP TABLE IF EXISTS `pedido`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pedido` (
  `idPedido` int(11) NOT NULL AUTO_INCREMENT,
  `idCentroCosto` int(11) NOT NULL,
  `idOrdenProduccion` int(11) DEFAULT NULL,
  `idEmpleado` int(11) DEFAULT NULL,
  `Estado` varchar(20) DEFAULT 'Activo',
  `Numero` varchar(20) DEFAULT NULL,
  `Fecha` datetime DEFAULT NULL,
  `Observaciones` varchar(200) DEFAULT NULL,
  `Activo` bit(1) DEFAULT b'1',
  `Usuario` varchar(20) DEFAULT NULL,
  `FechaRegistro` datetime DEFAULT NULL,
  `UsuarioModificacion` varchar(20) DEFAULT NULL,
  `FechaModificacion` datetime DEFAULT NULL,
  PRIMARY KEY (`idPedido`),
  KEY `fk_Pedido_CentroCosto1_idx` (`idCentroCosto`),
  KEY `fk_Pedido_OrdenProduccion1_idx` (`idOrdenProduccion`),
  KEY `fk_Pedido_Empleado1_idx` (`idEmpleado`),
  CONSTRAINT `fk_Pedido_CentroCosto1` FOREIGN KEY (`idCentroCosto`) REFERENCES `centrocosto` (`idCentroCosto`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_Pedido_Empleado1` FOREIGN KEY (`idEmpleado`) REFERENCES `empleado` (`idEmpleado`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_Pedido_OrdenProduccion1` FOREIGN KEY (`idOrdenProduccion`) REFERENCES `ordenproduccion` (`idOrdenProduccion`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=30 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pedido`
--

LOCK TABLES `pedido` WRITE;
/*!40000 ALTER TABLE `pedido` DISABLE KEYS */;
INSERT INTO `pedido` VALUES (6,2,7,4,'Activo','PE-000001/2013','2013-03-10 00:00:00',NULL,'','admin','2013-03-10 00:00:00',NULL,NULL),(7,2,7,4,'Activo','PE-000002/2013','2013-03-10 00:00:00',NULL,'','admin','2013-03-10 00:00:00',NULL,NULL),(8,2,7,4,'Activo','PE-000003/2013','2013-03-10 00:00:00',NULL,'','admin','2013-03-10 00:00:00',NULL,NULL),(9,2,7,4,'Activo','PE-000004/2013','2013-03-10 00:00:00',NULL,'','admin','2013-03-10 00:00:00',NULL,NULL),(10,2,7,4,'Activo','PE-000005/2013','2013-03-10 00:00:00',NULL,'','admin','2013-03-10 00:00:00',NULL,NULL),(11,1,7,4,'Activo','PE-000006/2013','2013-03-10 00:00:00',NULL,'','admin','2013-03-10 00:00:00','admin','2013-03-11 00:00:00'),(12,1,7,4,'Activo','PE-000007/2013','2013-03-10 00:00:00',NULL,'','admin','2013-03-10 00:00:00','admin','2013-03-10 00:00:00'),(13,2,7,4,'Activo','PE-000008/2013','2013-03-11 00:00:00',NULL,'','admin','2013-03-11 00:00:00','admin','2013-03-11 00:00:00'),(14,2,9,5,'Activo','PE-000009/2013','2013-03-12 00:00:00','comentario editado','','admin','2013-03-12 00:00:00','admin','2013-04-19 00:00:00'),(17,2,15,1,'Activo','PE-000001/2014',NULL,NULL,'','admin','2014-02-27 00:00:00',NULL,NULL),(21,1,NULL,NULL,'Activo',NULL,NULL,NULL,'',NULL,NULL,NULL,NULL),(22,2,15,NULL,'Activo','PE-000002/2014',NULL,'','','admin','2014-02-27 00:00:00',NULL,NULL),(23,2,15,NULL,'Activo','PE-000003/2014',NULL,'','','admin','2014-03-03 00:00:00',NULL,NULL),(24,2,15,NULL,'Activo','PE-000004/2014',NULL,'','','admin','2014-03-03 00:00:00',NULL,NULL),(25,2,15,NULL,'Activo','PE-000005/2014',NULL,'','','admin','2014-03-03 00:00:00',NULL,NULL),(26,2,15,NULL,'Activo','PE-000006/2014',NULL,'','','admin','2014-03-03 00:00:00',NULL,NULL),(27,2,15,NULL,'Activo','PE-000007/2014',NULL,'','','admin','2014-03-03 00:00:00',NULL,NULL),(28,2,15,4,'Activo','PE-000008/2014','2014-03-11 00:00:00','sadasdasda','','admin','2014-03-03 00:00:00','admin','2014-03-11 00:00:00'),(29,2,16,4,'Activo','PE-000009/2014','2014-03-24 00:00:00','veamos como sale','','admin','2014-03-24 00:00:00','admin','2014-03-24 00:00:00');
/*!40000 ALTER TABLE `pedido` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pedidoproducto`
--

DROP TABLE IF EXISTS `pedidoproducto`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pedidoproducto` (
  `idPedidoProducto` int(11) NOT NULL AUTO_INCREMENT,
  `idPedido` int(11) NOT NULL,
  `idProducto` int(11) NOT NULL,
  `Cantidad` smallint(6) DEFAULT NULL,
  `Glosa` varchar(100) DEFAULT NULL,
  `Activo` bit(1) DEFAULT b'1',
  `Usuario` varchar(20) DEFAULT NULL,
  `FechaRegistro` datetime DEFAULT NULL,
  `UsuarioModificacion` varchar(20) DEFAULT NULL,
  `FechaModificacion` datetime DEFAULT NULL,
  PRIMARY KEY (`idPedidoProducto`),
  KEY `fk_PedidoProducto_Pedido1_idx` (`idPedido`),
  KEY `fk_PedidoProducto_Producto1_idx` (`idProducto`),
  CONSTRAINT `fk_PedidoProducto_Pedido1` FOREIGN KEY (`idPedido`) REFERENCES `pedido` (`idPedido`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_PedidoProducto_Producto1` FOREIGN KEY (`idProducto`) REFERENCES `producto` (`idProducto`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=92 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pedidoproducto`
--

LOCK TABLES `pedidoproducto` WRITE;
/*!40000 ALTER TABLE `pedidoproducto` DISABLE KEYS */;
INSERT INTO `pedidoproducto` VALUES (4,10,2,2,'3','','admin','2013-03-10 00:00:00',NULL,NULL),(5,11,2,2,'3','\0','admin','2013-03-10 00:00:00','admin','2013-03-11 00:00:00'),(6,12,2,2,'3','\0','admin','2013-03-10 00:00:00','admin','2013-03-10 00:00:00'),(7,12,2,2,'3','\0','admin','2013-03-10 00:00:00','admin','2013-03-10 00:00:00'),(8,12,6,3,'adas','\0','admin','2013-03-10 00:00:00','admin','2013-03-10 00:00:00'),(9,12,2,2,'3','\0','admin','2013-03-10 00:00:00','admin','2013-03-10 00:00:00'),(10,12,6,3,'adas','\0','admin','2013-03-10 00:00:00','admin','2013-03-10 00:00:00'),(11,12,2,2,'3','\0','admin','2013-03-10 00:00:00','admin','2013-03-10 00:00:00'),(12,12,6,3,'adas','\0','admin','2013-03-10 00:00:00','admin','2013-03-10 00:00:00'),(13,12,2,2,'3','\0','admin','2013-03-10 00:00:00','admin','2013-03-10 00:00:00'),(14,12,6,3,'adas','\0','admin','2013-03-10 00:00:00','admin','2013-03-10 00:00:00'),(15,12,2,2,'3','\0','admin','2013-03-10 00:00:00','admin','2013-03-10 00:00:00'),(16,12,6,3,'adas','\0','admin','2013-03-10 00:00:00','admin','2013-03-10 00:00:00'),(17,12,2,2,'3','\0','admin','2013-03-10 00:00:00','admin','2013-03-10 00:00:00'),(18,12,6,3,'adas','\0','admin','2013-03-10 00:00:00','admin','2013-03-10 00:00:00'),(19,12,2,2,'3','\0','admin','2013-03-10 00:00:00','admin','2013-03-10 00:00:00'),(20,12,6,3,'adas','\0','admin','2013-03-10 00:00:00','admin','2013-03-10 00:00:00'),(21,12,2,2,'3','\0','admin','2013-03-10 00:00:00','admin','2013-03-10 00:00:00'),(22,12,6,3,'adas','\0','admin','2013-03-10 00:00:00','admin','2013-03-10 00:00:00'),(23,12,2,2,'3','\0','admin','2013-03-10 00:00:00','admin','2013-03-10 00:00:00'),(24,12,6,3,'adas','\0','admin','2013-03-10 00:00:00','admin','2013-03-10 00:00:00'),(25,12,2,2,'3','\0','admin','2013-03-10 00:00:00','admin','2013-03-10 00:00:00'),(26,12,6,3,'adas','\0','admin','2013-03-10 00:00:00','admin','2013-03-10 00:00:00'),(27,12,2,2,'3','\0','admin','2013-03-10 00:00:00','admin','2013-03-10 00:00:00'),(28,12,6,3,'adas','\0','admin','2013-03-10 00:00:00','admin','2013-03-10 00:00:00'),(29,12,2,2,'3','\0','admin','2013-03-10 00:00:00','admin','2013-03-10 00:00:00'),(30,12,6,3,'adas','\0','admin','2013-03-10 00:00:00','admin','2013-03-10 00:00:00'),(31,12,2,2,'3','\0','admin','2013-03-10 00:00:00','admin','2013-03-10 00:00:00'),(32,12,6,3,'adas','\0','admin','2013-03-10 00:00:00','admin','2013-03-10 00:00:00'),(33,12,2,2,'3','\0','admin','2013-03-10 00:00:00','admin','2013-03-10 00:00:00'),(34,12,6,3,'adas','\0','admin','2013-03-10 00:00:00','admin','2013-03-10 00:00:00'),(35,12,9,3,'ada','\0','admin','2013-03-10 00:00:00','admin','2013-03-10 00:00:00'),(36,12,2,2,'3','\0','admin','2013-03-10 00:00:00','admin','2013-03-10 00:00:00'),(37,12,6,3,'adas','\0','admin','2013-03-10 00:00:00','admin','2013-03-10 00:00:00'),(38,12,9,3,'ada','\0','admin','2013-03-10 00:00:00','admin','2013-03-10 00:00:00'),(39,12,2,2,'3','\0','admin','2013-03-10 00:00:00','admin','2013-03-10 00:00:00'),(40,12,6,3,'adas','\0','admin','2013-03-10 00:00:00','admin','2013-03-10 00:00:00'),(41,12,9,3,'ada','\0','admin','2013-03-10 00:00:00','admin','2013-03-10 00:00:00'),(42,12,2,2,'3','\0','admin','2013-03-10 00:00:00','admin','2013-03-10 00:00:00'),(43,12,6,3,'adas','\0','admin','2013-03-10 00:00:00','admin','2013-03-10 00:00:00'),(44,12,9,3,'ada','\0','admin','2013-03-10 00:00:00','admin','2013-03-10 00:00:00'),(45,12,2,2,'3','\0','admin','2013-03-10 00:00:00','admin','2013-03-10 00:00:00'),(46,12,6,3,'adas','\0','admin','2013-03-10 00:00:00','admin','2013-03-10 00:00:00'),(47,12,9,3,'ada','\0','admin','2013-03-10 00:00:00','admin','2013-03-10 00:00:00'),(48,12,2,2,'3','','admin','2013-03-10 00:00:00',NULL,NULL),(49,12,6,3,'adas','','admin','2013-03-10 00:00:00',NULL,NULL),(50,12,9,3,'ada','','admin','2013-03-10 00:00:00',NULL,NULL),(51,11,2,2,'3','','admin','2013-03-11 00:00:00',NULL,NULL),(52,13,6,3,'adas','\0','admin','2013-03-11 00:00:00','admin','2013-03-11 00:00:00'),(53,13,9,3,'ada','\0','admin','2013-03-11 00:00:00','admin','2013-03-11 00:00:00'),(54,13,3,1,'bus','\0','admin','2013-03-11 00:00:00','admin','2013-03-11 00:00:00'),(55,13,6,3,'adas','\0','admin','2013-03-11 00:00:00','admin','2013-03-11 00:00:00'),(56,13,9,3,'ada','\0','admin','2013-03-11 00:00:00','admin','2013-03-11 00:00:00'),(57,13,3,1,'bus','\0','admin','2013-03-11 00:00:00','admin','2013-03-11 00:00:00'),(58,13,6,3,'adas','','admin','2013-03-11 00:00:00',NULL,NULL),(59,13,9,3,'ada','','admin','2013-03-11 00:00:00',NULL,NULL),(60,13,3,1,'bus','','admin','2013-03-11 00:00:00',NULL,NULL),(61,14,7,3,'veamos','\0','admin','2013-03-12 00:00:00','admin','2013-04-19 00:00:00'),(62,14,4,1,'','\0','admin','2013-03-12 00:00:00','admin','2013-04-19 00:00:00'),(63,14,7,3,'veamos','\0','admin','2013-03-12 00:00:00','admin','2013-04-19 00:00:00'),(64,14,7,3,'veamos','\0','admin','2013-03-12 00:00:00','admin','2013-04-19 00:00:00'),(65,14,7,3,'veamos','\0','admin','2013-03-21 00:00:00','admin','2013-04-19 00:00:00'),(66,14,7,3,'veamos','\0','admin','2013-03-21 00:00:00','admin','2013-04-19 00:00:00'),(67,14,7,3,'veamos','\0','admin','2013-04-19 00:00:00','admin','2013-04-19 00:00:00'),(68,14,7,3,'veamos','\0','admin','2013-04-19 00:00:00','admin','2013-04-19 00:00:00'),(69,14,7,3,'veamos','','admin','2013-04-19 00:00:00',NULL,NULL),(70,17,10,2,'','','admin','2014-02-27 00:00:00',NULL,NULL),(71,17,4,3,'','','admin','2014-02-27 00:00:00',NULL,NULL),(72,22,10,2,'','','admin','2014-02-27 00:00:00',NULL,NULL),(73,22,4,3,'','','admin','2014-02-27 00:00:00',NULL,NULL),(74,23,10,2,'','','admin','2014-03-03 00:00:00',NULL,NULL),(75,23,4,3,'','','admin','2014-03-03 00:00:00',NULL,NULL),(76,24,10,2,'','','admin','2014-03-03 00:00:00',NULL,NULL),(77,24,4,3,'','','admin','2014-03-03 00:00:00',NULL,NULL),(78,25,10,2,'','','admin','2014-03-03 00:00:00',NULL,NULL),(79,25,4,3,'','','admin','2014-03-03 00:00:00',NULL,NULL),(80,26,10,2,'','','admin','2014-03-03 00:00:00',NULL,NULL),(81,26,4,3,'','','admin','2014-03-03 00:00:00',NULL,NULL),(82,27,10,2,'','','admin','2014-03-03 00:00:00',NULL,NULL),(83,27,4,3,'','','admin','2014-03-03 00:00:00',NULL,NULL),(84,28,10,2,'','\0','admin','2014-03-03 00:00:00','admin','2014-03-11 00:00:00'),(85,28,4,3,'','\0','admin','2014-03-03 00:00:00','admin','2014-03-11 00:00:00'),(86,28,10,2,'','','admin','2014-03-11 00:00:00',NULL,NULL),(87,28,4,3,'','','admin','2014-03-11 00:00:00',NULL,NULL),(88,29,10,2,'','\0','admin','2014-03-24 00:00:00','admin','2014-03-24 00:00:00'),(89,29,4,3,'','\0','admin','2014-03-24 00:00:00','admin','2014-03-24 00:00:00'),(90,29,10,2,'','','admin','2014-03-24 00:00:00',NULL,NULL),(91,29,4,3,'','','admin','2014-03-24 00:00:00',NULL,NULL);
/*!40000 ALTER TABLE `pedidoproducto` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `percepcion`
--

DROP TABLE IF EXISTS `percepcion`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `percepcion` (
  `idPercepcion` int(11) NOT NULL AUTO_INCREMENT,
  `Descripcion` varchar(50) DEFAULT NULL,
  `Valor` decimal(4,2) DEFAULT NULL,
  `Activo` bit(1) DEFAULT b'1',
  `Usuario` varchar(20) DEFAULT NULL,
  `FechaRegistro` datetime DEFAULT NULL,
  `UsuarioModificacion` varchar(20) DEFAULT NULL,
  `FechaModificacion` datetime DEFAULT NULL,
  PRIMARY KEY (`idPercepcion`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `percepcion`
--

LOCK TABLES `percepcion` WRITE;
/*!40000 ALTER TABLE `percepcion` DISABLE KEYS */;
INSERT INTO `percepcion` VALUES (1,'primera percepcion',64.11,'\0','admin','2014-04-27 00:00:00','admin','2014-04-27 00:00:00'),(2,'1ra percepcion',3.50,'','admin','2014-04-27 00:00:00',NULL,NULL),(3,'2da percepcion',8.90,'','admin','2014-04-27 00:00:00',NULL,NULL);
/*!40000 ALTER TABLE `percepcion` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `periodo`
--

DROP TABLE IF EXISTS `periodo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `periodo` (
  `idPeriodo` int(11) NOT NULL AUTO_INCREMENT,
  `Anio` smallint(6) DEFAULT NULL,
  `Mes` varchar(20) DEFAULT NULL,
  `Activo` bit(1) DEFAULT b'1',
  `Usuario` varchar(20) DEFAULT NULL,
  `FechaRegistro` datetime DEFAULT NULL,
  `UsuarioModificacion` varchar(20) DEFAULT NULL,
  `FechaModificacion` datetime DEFAULT NULL,
  PRIMARY KEY (`idPeriodo`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `periodo`
--

LOCK TABLES `periodo` WRITE;
/*!40000 ALTER TABLE `periodo` DISABLE KEYS */;
INSERT INTO `periodo` VALUES (1,2015,'Enero','','admin','2014-04-29 00:00:00',NULL,NULL);
/*!40000 ALTER TABLE `periodo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `permiso`
--

DROP TABLE IF EXISTS `permiso`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `permiso` (
  `idPermiso` int(11) NOT NULL AUTO_INCREMENT,
  `idUsuario` int(11) NOT NULL,
  `idOpcion` int(11) NOT NULL,
  `Activo` bit(1) DEFAULT b'1',
  `Usuario` varchar(20) DEFAULT NULL,
  `FechaRegistro` datetime DEFAULT NULL,
  `UsuarioModificacion` varchar(20) DEFAULT NULL,
  `FechaModificacion` datetime DEFAULT NULL,
  PRIMARY KEY (`idPermiso`),
  KEY `fk_Permiso_Usuario1_idx` (`idUsuario`),
  KEY `fk_Permiso_Opcion1_idx` (`idOpcion`),
  CONSTRAINT `fk_Permiso_Opcion1` FOREIGN KEY (`idOpcion`) REFERENCES `opcion` (`idOpcion`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_Permiso_Usuario1` FOREIGN KEY (`idUsuario`) REFERENCES `usuario` (`idUsuario`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `permiso`
--

LOCK TABLES `permiso` WRITE;
/*!40000 ALTER TABLE `permiso` DISABLE KEYS */;
INSERT INTO `permiso` VALUES (21,1,10,'\0','admin','2013-01-17 00:00:00',NULL,NULL),(22,1,9,'','admin','2013-01-17 00:00:00',NULL,NULL);
/*!40000 ALTER TABLE `permiso` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `producto`
--

DROP TABLE IF EXISTS `producto`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `producto` (
  `idProducto` int(11) NOT NULL AUTO_INCREMENT,
  `idTipoProducto` int(11) NOT NULL,
  `Descripcion` varchar(50) DEFAULT NULL,
  `Codigo` varchar(10) DEFAULT NULL,
  `Contador` int(11) DEFAULT NULL,
  `UmCompra` decimal(9,3) DEFAULT NULL,
  `UmConsumo` decimal(9,3) DEFAULT NULL,
  `idUnidadMedidaCompra` int(11) NOT NULL,
  `idUnidadMedidaConsumo` int(11) NOT NULL,
  `Conversion` decimal(9,3) DEFAULT NULL,
  `Activo` bit(1) DEFAULT b'1',
  `Usuario` varchar(20) DEFAULT NULL,
  `FechaRegistro` datetime DEFAULT NULL,
  `UsuarioModificacion` varchar(20) DEFAULT NULL,
  `FechaModificacion` datetime DEFAULT NULL,
  `idFamilia` int(11) NOT NULL,
  PRIMARY KEY (`idProducto`),
  KEY `fk_Producto_UnidadMedida1_idx` (`idUnidadMedidaCompra`),
  KEY `fk_Producto_UnidadMedida2_idx` (`idUnidadMedidaConsumo`),
  KEY `fk_Producto_TipoProducto1_idx` (`idTipoProducto`),
  KEY `fk_Producto_Familia1_idx` (`idFamilia`),
  CONSTRAINT `fk_Producto_Familia1` FOREIGN KEY (`idFamilia`) REFERENCES `familia` (`idFamilia`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_Producto_TipoProducto1` FOREIGN KEY (`idTipoProducto`) REFERENCES `tipoproducto` (`idTipoProducto`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_Producto_UnidadMedida1` FOREIGN KEY (`idUnidadMedidaCompra`) REFERENCES `unidadmedida` (`idUnidadMedida`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_Producto_UnidadMedida2` FOREIGN KEY (`idUnidadMedidaConsumo`) REFERENCES `unidadmedida` (`idUnidadMedida`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `producto`
--

LOCK TABLES `producto` WRITE;
/*!40000 ALTER TABLE `producto` DISABLE KEYS */;
INSERT INTO `producto` VALUES (1,3,'primer prod term','prm',1,2300.000,0.000,4,5,100.000,'\0',NULL,'2013-01-29 00:00:00','admin','2013-02-01 00:00:00',1),(2,3,'2do producto termi','prt',2,900.000,9.000,4,5,100.000,'',NULL,'2013-01-29 00:00:00','admin','2013-02-01 00:00:00',1),(3,3,'Bus Cama','bsc',3,100.000,100000.000,2,1,1000.000,'','admin','2013-02-03 00:00:00',NULL,NULL,1),(4,2,'pixxx','',4,0.000,0.000,1,2,0.000,'','admin','2013-02-10 00:00:00','admin','2013-02-13 00:00:00',1),(5,3,'auto parte','ap',5,0.000,0.000,1,1,0.000,'','admin','2013-02-13 00:00:00',NULL,NULL,1),(6,2,'Vidrio 22',NULL,1,3.000,3.000,1,1,4.000,'','admin','2013-02-14 00:00:00','admin','2014-01-14 00:00:00',3),(7,2,'Vidrio 3','vd0002',2,3.000,3.000,1,1,4.000,'','admin','2013-02-14 00:00:00',NULL,NULL,3),(8,3,'carro 1987','crr0006',6,24.000,24.000,1,1,42.000,'','admin','2013-02-14 00:00:00',NULL,NULL,1),(9,2,'vidrio 4','vd0003',3,3.000,3.000,1,1,3.000,'','admin','2013-02-14 00:00:00',NULL,NULL,3),(10,2,'casi carroceria','crr0007',7,12.000,12.000,1,1,12.000,'','admin','2013-02-18 00:00:00',NULL,NULL,1),(11,4,'Espejo retrovisor',NULL,4,20.000,20.000,3,3,1.000,'','admin','2013-03-11 00:00:00','admin','2013-04-03 00:00:00',3),(12,2,'Parabrisas rigido','vd0005',5,15.000,15.000,4,4,1.000,'','admin','2013-04-03 00:00:00',NULL,NULL,3),(13,2,'cajon','crr0008',8,20.500,18.000,5,5,1.800,'','admin','2014-02-02 00:00:00',NULL,NULL,1);
/*!40000 ALTER TABLE `producto` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `provision`
--

DROP TABLE IF EXISTS `provision`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `provision` (
  `idProvision` int(11) NOT NULL AUTO_INCREMENT,
  `Numero` varchar(15) DEFAULT NULL,
  `Periodo` varchar(15) DEFAULT NULL,
  `Fecha` datetime DEFAULT NULL,
  `ServicioCompra` varchar(20) DEFAULT NULL,
  `Codigo` varchar(20) DEFAULT NULL,
  `RazonSocial` varchar(100) DEFAULT NULL,
  `Ruc` varchar(15) DEFAULT NULL,
  `Glosa` varchar(100) DEFAULT NULL,
  `TipoDocumento` varchar(5) DEFAULT NULL,
  `Serie` varchar(20) DEFAULT NULL,
  `NumeroDocumento` varchar(15) DEFAULT NULL,
  `FechaDocumento` datetime DEFAULT NULL,
  `FechaVencimiento` datetime DEFAULT NULL,
  `TipoCambio` decimal(4,2) DEFAULT NULL,
  `TipoAdquisicion` decimal(4,2) DEFAULT NULL,
  `Igv` decimal(4,2) DEFAULT NULL,
  `Percepcion` decimal(4,2) DEFAULT NULL,
  `Renta` decimal(4,2) DEFAULT NULL,
  `Aporte` decimal(4,2) DEFAULT NULL,
  `Tasa` decimal(4,2) DEFAULT NULL,
  `Importe` decimal(8,2) DEFAULT NULL,
  `BaseAfecta` decimal(8,2) DEFAULT NULL,
  `Inafecto` decimal(8,2) DEFAULT NULL,
  `IgvDocumento` decimal(8,2) DEFAULT NULL,
  `PercepcionAfecta` decimal(8,2) DEFAULT NULL,
  `RentaAfecta` decimal(8,2) DEFAULT NULL,
  `AportePension` decimal(8,2) DEFAULT NULL,
  `Total` decimal(8,2) DEFAULT NULL,
  `Activo` bit(1) DEFAULT b'1',
  `Usuario` varchar(20) DEFAULT NULL,
  `FechaRegistro` datetime DEFAULT NULL,
  `UsuarioModificacion` varchar(20) DEFAULT NULL,
  `FechaModificacion` datetime DEFAULT NULL,
  `idOrdenCompra` int(11) DEFAULT NULL,
  `idSucursal` int(11) DEFAULT NULL,
  `idTipoCompra` int(11) DEFAULT NULL,
  `idFormaPago` int(11) DEFAULT NULL,
  `idMoneda` int(11) DEFAULT NULL,
  `idOrdenServicio` int(11) DEFAULT NULL,
  PRIMARY KEY (`idProvision`),
  KEY `fk_provision_sucursal1_idx` (`idSucursal`),
  KEY `fk_provision_tipocompra1_idx` (`idTipoCompra`),
  KEY `fk_provision_formapago1_idx` (`idFormaPago`),
  KEY `fk_provision_moneda1_idx` (`idMoneda`),
  KEY `fk_provision_ordencompra1_idx` (`idOrdenCompra`),
  KEY `fk_provision_ordenservicio1_idx` (`idOrdenServicio`),
  CONSTRAINT `fk_provision_formapago1` FOREIGN KEY (`idFormaPago`) REFERENCES `formapago` (`idFormaPago`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_provision_moneda1` FOREIGN KEY (`idMoneda`) REFERENCES `moneda` (`idMoneda`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_provision_ordencompra1` FOREIGN KEY (`idOrdenCompra`) REFERENCES `ordencompra` (`idOrdenCompra`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_provision_ordenservicio1` FOREIGN KEY (`idOrdenServicio`) REFERENCES `ordenservicio` (`idOrdenServicio`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_provision_sucursal1` FOREIGN KEY (`idSucursal`) REFERENCES `sucursal` (`idSucursal`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_provision_tipocompra1` FOREIGN KEY (`idTipoCompra`) REFERENCES `tipocompra` (`idTipoCompra`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=50 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `provision`
--

LOCK TABLES `provision` WRITE;
/*!40000 ALTER TABLE `provision` DISABLE KEYS */;
INSERT INTO `provision` VALUES (29,'000009','Enero 2014','2014-06-04 00:00:00','OC-000003/2013','x','cliente x','x','dsaas','01','da','das','2014-06-18 00:00:00','2014-06-15 00:00:00',3.40,0.00,19.10,3.50,15.30,3.50,37.43,0.00,93.15,0.00,21.85,4.03,17.60,4.03,115.00,'','admin','2014-06-21 00:00:00',NULL,NULL,33,2,2,1,9,NULL),(30,'000010','Enero 2014','2014-06-18 00:00:00','OC-000002/2013','28474589','sgm computer','28474589','sadas','01','dasd','as','2014-06-12 00:00:00','2014-06-03 00:00:00',3.40,0.00,19.10,3.50,15.30,3.50,37.43,0.00,125.46,0.00,27.54,5.36,23.41,5.36,153.00,'','admin','2014-06-21 00:00:00',NULL,NULL,32,2,2,1,9,NULL),(31,'000011','Enero 2014','2014-06-18 00:00:00','OC-000003/2013','x','cliente x','x','sada','01','sda','das','2014-06-04 00:00:00','2014-06-23 00:00:00',2.55,0.00,19.10,3.50,15.30,3.50,37.43,0.00,93.15,0.00,21.85,4.03,17.60,4.03,115.00,'','admin','2014-06-21 00:00:00',NULL,NULL,33,2,2,1,8,NULL),(32,'000012','Enero 2014','0023-12-05 00:00:00','OC-000003/2013','x','cliente x','x','sada','01','sda','das','0009-12-05 00:00:00','0028-12-04 00:00:00',2.55,0.00,19.10,3.50,15.30,3.50,37.43,0.00,93.15,0.00,21.85,4.03,17.60,4.03,115.00,'','admin','2014-06-21 00:00:00',NULL,NULL,33,2,2,1,8,NULL),(33,'000013','Enero 2014','0023-12-05 00:00:00','OC-000003/2013','x','cliente x','x','sada','01','sda','das','0009-12-05 00:00:00','0028-12-04 00:00:00',2.55,0.00,19.10,3.50,15.30,3.50,37.43,12314.00,93.15,0.00,21.85,4.03,17.60,4.03,115.00,'','admin','2014-06-21 00:00:00',NULL,NULL,33,2,2,1,8,NULL),(34,'000014','Enero 2014','0023-12-05 00:00:00','OC-000003/2013','x','cliente x','x','sada','01','sda','das','0009-12-05 00:00:00','0028-12-04 00:00:00',2.55,0.00,19.10,3.50,15.30,3.50,37.43,5555.00,93.15,0.00,21.85,4.03,17.60,4.03,115.00,'','admin','2014-06-22 00:00:00',NULL,NULL,33,2,2,1,8,NULL),(35,'000015','Enero 2014','0023-12-05 00:00:00','OC-000003/2013','x','cliente x','x','sada','01','sda','das','0009-12-05 00:00:00','0028-12-04 00:00:00',2.55,0.00,19.10,3.50,15.30,3.50,37.43,6666.00,93.15,0.00,21.85,4.03,17.60,4.03,115.00,'','admin','2014-06-22 00:00:00',NULL,NULL,33,2,2,1,8,NULL),(36,'000016','Enero 2014','0023-12-05 00:00:00','OC-000003/2013','x','cliente x','x','sada','01','sda','das','0009-12-05 00:00:00','0028-12-04 00:00:00',2.55,5.90,19.10,8.90,25.90,3.50,37.43,2222.00,93.15,0.00,21.85,10.24,29.79,4.03,115.00,'','admin','2014-06-22 00:00:00','admin','2014-06-28 00:00:00',33,2,2,1,8,NULL),(37,'000017','Enero 2014','0023-12-05 00:00:00','OC-000003/2013','x','cliente x','x','sada','01','sda','das','0009-12-05 00:00:00','0028-12-04 00:00:00',2.55,5.90,19.10,8.90,25.90,3.50,37.43,2222.00,93.15,0.00,21.85,10.24,29.79,4.03,115.00,'','admin','2014-07-20 00:00:00',NULL,NULL,33,2,2,1,8,NULL),(38,'000018','Enero 2014','0023-12-05 00:00:00','OC-000003/2013','x','cliente x','x','sada','01','sda','das','0009-12-05 00:00:00','0028-12-04 00:00:00',2.55,5.90,19.10,8.90,25.90,3.50,37.43,2222.00,93.15,0.00,21.85,10.24,29.79,4.03,115.00,'','admin','2014-07-20 00:00:00','admin','2014-07-20 00:00:00',33,2,2,1,8,NULL),(39,'000019','Enero 2014','0023-12-05 00:00:00','OC-000003/2013','x','cliente x','x','sada','01','sda','das','0009-12-05 00:00:00','0028-12-04 00:00:00',2.55,5.90,19.10,8.90,25.90,3.50,37.43,2222.00,93.15,0.00,21.85,10.24,29.79,4.03,115.00,'','admin','2014-07-20 00:00:00',NULL,NULL,33,2,2,1,8,NULL),(40,'000020','Enero 2014','0023-12-05 00:00:00','OC-000003/2013','x','cliente x','x','sada','01','sda','das','0009-12-05 00:00:00','0028-12-04 00:00:00',2.55,5.90,19.10,8.90,25.90,3.50,37.43,2222.00,93.15,0.00,21.85,10.24,29.79,4.03,115.00,'','admin','2014-07-20 00:00:00',NULL,NULL,33,2,2,1,8,NULL),(41,'000021','Enero 2014','0023-12-05 00:00:00','OC-000003/2013','x','cliente x','x','sada','01','sda','das','0009-12-05 00:00:00','0028-12-04 00:00:00',2.55,5.90,19.10,8.90,25.90,3.50,37.43,2222.00,93.15,0.00,21.85,10.24,29.79,4.03,115.00,'','admin','2014-07-20 00:00:00',NULL,NULL,33,2,2,1,8,NULL),(42,'000022','Enero 2014','0023-12-05 00:00:00','OC-000003/2013','x','cliente x','x','sada','01','sda','das','0009-12-05 00:00:00','0028-12-04 00:00:00',2.55,5.90,19.10,8.90,25.90,3.50,37.43,2222.00,93.15,0.00,21.85,10.24,29.79,4.03,115.00,'','admin','2014-07-20 00:00:00',NULL,NULL,33,2,2,1,8,NULL),(43,'000023','Enero 2014','0023-12-05 00:00:00','OC-000003/2013','x','cliente x','x','sada','01','sda','das','0009-12-05 00:00:00','0028-12-04 00:00:00',2.55,5.90,19.10,8.90,25.90,3.50,37.43,2222.00,93.15,0.00,21.85,10.24,29.79,4.03,115.00,'','admin','2014-07-20 00:00:00',NULL,NULL,33,2,2,1,8,NULL),(44,'000024','Enero 2014','0023-12-05 00:00:00','OC-000002/2013','28474589','sgm computer','28474589','sada','01','sda','das','0009-12-05 00:00:00','0028-12-04 00:00:00',2.55,5.90,19.10,8.90,25.90,3.50,37.43,2222.00,125.46,0.00,27.54,13.62,39.63,5.36,153.00,'','admin','2014-07-22 00:00:00','admin','2015-06-25 00:00:00',32,2,2,1,8,NULL),(45,'000025','Enero 2014','2015-06-25 00:00:00','OC-000003/2013','x','cliente x','x','veamos si funnca','03','123456','00006','2015-06-25 00:00:00','2015-06-25 00:00:00',2.55,18.75,19.10,8.90,5.70,5.30,5.30,0.00,93.15,271.00,21.85,10.24,6.56,6.10,115.00,'','admin','2015-06-25 00:00:00','admin','2015-06-25 00:00:00',33,3,3,2,8,NULL),(46,'000026','Enero 2014','2015-06-25 00:00:00','OS-000007/2013','39056563','rodajito','39056563','dsfsdfsdf','01','sadas','adsda','2015-06-25 00:00:00','2015-06-25 00:00:00',3.40,18.75,19.10,3.50,15.30,3.50,5.30,0.00,5.67,0.00,1.33,0.25,1.07,0.25,7.00,'','admin','2015-06-25 00:00:00',NULL,NULL,NULL,2,2,1,9,7),(47,'000027','Enero 2014','2015-06-25 00:00:00','OS-000007/2013','39056563','rodajito','39056563','dsfsdfsdf','01','sadas','adsda','2015-06-25 00:00:00','2015-06-25 00:00:00',3.40,18.75,19.10,3.50,15.30,3.50,5.30,0.00,5.67,0.00,1.33,0.25,1.07,0.25,200.00,'','admin','2015-06-25 00:00:00','admin','2015-06-25 00:00:00',NULL,2,2,1,9,7),(48,'000028','Enero 2014','2015-06-25 00:00:00','OS-000007/2013','39056563','rodajito','39056563','dsfsdfsdf','01','cccccccc','adsda','2015-06-25 00:00:00','2015-06-25 00:00:00',3.40,18.75,19.10,3.50,15.30,3.50,5.30,0.00,5.67,0.00,1.33,0.25,1.07,0.25,200.00,'','admin','2015-06-27 00:00:00','admin','2015-06-27 00:00:00',NULL,2,2,1,9,7),(49,'000029','Enero 2014','2015-06-25 00:00:00','OS-000007/2013','39056563','rodajito','39056563','dsfsdfsdf','01','bbbbbbbb','adsda','2015-06-25 00:00:00','2015-06-25 00:00:00',3.40,18.75,19.10,3.50,15.30,3.50,5.30,0.00,5.67,0.00,1.33,0.25,1.07,0.25,200.00,'','admin','2015-06-27 00:00:00',NULL,NULL,NULL,2,2,1,9,7);
/*!40000 ALTER TABLE `provision` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `puntoventa`
--

DROP TABLE IF EXISTS `puntoventa`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `puntoventa` (
  `idPuntoVenta` int(11) NOT NULL AUTO_INCREMENT,
  `Descripcion` varchar(50) DEFAULT NULL,
  `Codigo` varchar(20) DEFAULT NULL,
  `Activo` bit(1) DEFAULT b'1',
  `Usuario` varchar(20) DEFAULT NULL,
  `FechaRegistro` datetime DEFAULT NULL,
  `UsuarioModificacion` varchar(20) DEFAULT NULL,
  `FechaModificacion` datetime DEFAULT NULL,
  PRIMARY KEY (`idPuntoVenta`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `puntoventa`
--

LOCK TABLES `puntoventa` WRITE;
/*!40000 ALTER TABLE `puntoventa` DISABLE KEYS */;
INSERT INTO `puntoventa` VALUES (1,NULL,NULL,'','admin','2014-07-29 00:00:00',NULL,NULL),(2,'segundo punto','p002','','admin','2014-07-29 00:00:00',NULL,NULL);
/*!40000 ALTER TABLE `puntoventa` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `renta`
--

DROP TABLE IF EXISTS `renta`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `renta` (
  `idRenta` int(11) NOT NULL AUTO_INCREMENT,
  `Descripcion` varchar(50) DEFAULT NULL,
  `Valor` decimal(4,2) DEFAULT NULL,
  `Activo` bit(1) DEFAULT b'1',
  `Usuario` varchar(20) DEFAULT NULL,
  `FechaRegistro` datetime DEFAULT NULL,
  `UsuarioModificacion` varchar(20) DEFAULT NULL,
  `FechaModificacion` datetime DEFAULT NULL,
  PRIMARY KEY (`idRenta`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `renta`
--

LOCK TABLES `renta` WRITE;
/*!40000 ALTER TABLE `renta` DISABLE KEYS */;
INSERT INTO `renta` VALUES (1,'primera renta 1',NULL,'\0','admin','2014-04-27 00:00:00','admin','2014-04-27 00:00:00'),(2,'1ra renta',15.30,'','admin','2014-04-27 00:00:00','admin','2014-05-23 00:00:00'),(3,'2da renta',5.70,'','admin','2014-04-27 00:00:00','admin','2014-05-23 00:00:00'),(4,'3ra renta',25.90,'','admin','2014-05-23 00:00:00',NULL,NULL);
/*!40000 ALTER TABLE `renta` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `salida`
--

DROP TABLE IF EXISTS `salida`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `salida` (
  `idSalida` int(11) NOT NULL AUTO_INCREMENT,
  `idAlmacen` int(11) NOT NULL,
  `idTipoMovimiento` int(11) NOT NULL,
  `idClienteProveedor` int(11) DEFAULT NULL,
  `idEmpleado` int(11) NOT NULL,
  `idPedido` int(11) NOT NULL,
  `Fecha` datetime DEFAULT NULL,
  `Numero` varchar(20) DEFAULT NULL,
  `TipoCambio` decimal(6,3) DEFAULT NULL,
  `Observaciones` varchar(200) DEFAULT NULL,
  `TipoCambioMoneda` decimal(6,3) DEFAULT NULL,
  `Activo` bit(1) DEFAULT b'1',
  `Usuario` varchar(20) DEFAULT NULL,
  `FechaRegistro` datetime DEFAULT NULL,
  `UsuarioModificacion` varchar(20) DEFAULT NULL,
  `FechaModificacion` datetime DEFAULT NULL,
  `Salidacol` varchar(45) DEFAULT NULL,
  `idSubdiario` int(11) DEFAULT NULL,
  PRIMARY KEY (`idSalida`),
  KEY `fk_Salida_Almacen1_idx` (`idAlmacen`),
  KEY `fk_Salida_TipoMovimiento1_idx` (`idTipoMovimiento`),
  KEY `fk_Salida_ClienteProveedor1_idx` (`idClienteProveedor`),
  KEY `fk_Salida_Empleado1_idx` (`idEmpleado`),
  KEY `fk_salida_pedido1_idx` (`idPedido`),
  KEY `fk_salida_Subdiario1_idx` (`idSubdiario`),
  CONSTRAINT `fk_Salida_Almacen1` FOREIGN KEY (`idAlmacen`) REFERENCES `almacen` (`idAlmacen`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_Salida_ClienteProveedor1` FOREIGN KEY (`idClienteProveedor`) REFERENCES `clienteproveedor` (`idClienteProveedor`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_Salida_Empleado1` FOREIGN KEY (`idEmpleado`) REFERENCES `empleado` (`idEmpleado`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_Salida_TipoMovimiento1` FOREIGN KEY (`idTipoMovimiento`) REFERENCES `tipomovimiento` (`idTipoMovimiento`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_salida_Subdiario1` FOREIGN KEY (`idSubdiario`) REFERENCES `subdiario` (`idSubdiario`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_salida_pedido1` FOREIGN KEY (`idPedido`) REFERENCES `pedido` (`idPedido`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `salida`
--

LOCK TABLES `salida` WRITE;
/*!40000 ALTER TABLE `salida` DISABLE KEYS */;
INSERT INTO `salida` VALUES (1,0,0,0,1,0,'2013-03-04 00:00:00','',2.550,'',0.000,'','admin','2013-03-04 00:00:00','admin','2015-10-27 00:00:00',NULL,NULL),(2,0,0,0,1,0,'2013-03-04 00:00:00','000002',2.550,'',0.000,'','admin','2013-03-04 00:00:00','admin','2015-10-27 00:00:00',NULL,NULL),(3,2,3,6,1,0,'2013-03-06 00:00:00','000003',2.550,'probando',0.000,'','admin','2013-03-06 00:00:00','admin','2015-10-27 00:00:00',NULL,NULL),(4,2,3,6,1,0,'2013-03-20 00:00:00','000004',2.550,'segunda salida',0.000,'','admin','2013-03-20 00:00:00','admin','2015-10-27 00:00:00',NULL,NULL),(5,1,3,NULL,1,0,'2013-04-16 00:00:00','000005',2.550,'veamos',0.000,'','admin','2013-04-16 00:00:00','admin','2015-10-27 00:00:00',NULL,NULL),(6,1,3,NULL,4,14,'2014-03-10 00:00:00','000001',2.550,'dasdasdasdas',0.000,'','admin','2014-03-10 00:00:00','admin','2015-10-27 00:00:00',NULL,NULL),(7,1,1,NULL,4,28,'2014-03-11 00:00:00','000002',2.550,'jhgj',0.000,'','admin','2014-03-11 00:00:00','admin','2015-10-27 00:00:00',NULL,NULL),(8,1,3,NULL,4,29,'2014-03-24 00:00:00','000003',0.000,'una salida',0.000,'','admin','2014-03-24 00:00:00','admin','2015-10-27 00:00:00',NULL,NULL),(9,2,3,NULL,4,29,'2014-04-01 00:00:00','000004',NULL,'asdasdasd',NULL,'','admin','2014-04-01 00:00:00','admin','2015-10-27 00:00:00',NULL,NULL),(10,2,3,NULL,4,28,'2014-04-01 00:00:00','000005',NULL,'asdasdasdasdasa',NULL,'','admin','2014-04-01 00:00:00','admin','2015-10-27 00:00:00',NULL,NULL),(11,2,3,NULL,4,28,'2014-04-01 00:00:00','000006',NULL,'asdasdasdasdasa',NULL,'','admin','2014-04-01 00:00:00','admin','2015-10-27 00:00:00',NULL,NULL),(12,2,3,NULL,4,28,'2014-04-01 00:00:00','000001',NULL,'asdasdasdasdasa',NULL,'','admin','2015-09-28 00:00:00','admin','2015-10-27 00:00:00',NULL,1),(13,2,3,NULL,4,28,'2014-04-01 00:00:00','000002',NULL,'asdasdasdasdasa',NULL,'','admin','2015-09-28 00:00:00','admin','2015-10-27 00:00:00',NULL,2),(14,2,3,NULL,4,28,'2014-04-01 00:00:00','000003',NULL,'asdasdasdasdasa',NULL,'','admin','2015-09-28 00:00:00','admin','2015-10-27 00:00:00',NULL,2),(15,2,3,NULL,4,28,'2014-04-01 00:00:00','000004',NULL,'asdasdasdasdasa',NULL,'','admin','2015-09-28 00:00:00','admin','2015-10-27 00:00:00',NULL,1),(16,2,3,NULL,4,28,'2014-04-01 00:00:00','000005',NULL,'asdasdasdasdasa',NULL,'','admin','2015-09-28 00:00:00','admin','2015-10-27 00:00:00',NULL,1),(17,2,3,NULL,4,28,'2014-04-01 00:00:00','000006',NULL,'asdasdasdasdasa',NULL,'','admin','2015-09-28 00:00:00','admin','2015-10-27 00:00:00',NULL,2),(18,2,3,NULL,4,28,'2014-04-01 00:00:00','000007',NULL,'asdasdasdasdasa',NULL,'','admin','2015-09-28 00:00:00','admin','2015-10-27 00:00:00',NULL,2),(19,2,3,NULL,4,28,'2014-04-01 00:00:00','000008',0.000,'asdasdasdasdasa',0.000,'\0','admin','2015-09-28 00:00:00','admin','2015-10-27 00:00:00',NULL,2);
/*!40000 ALTER TABLE `salida` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `salidaproducto`
--

DROP TABLE IF EXISTS `salidaproducto`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `salidaproducto` (
  `idSalidaProducto` int(11) NOT NULL AUTO_INCREMENT,
  `idSalida` int(11) NOT NULL,
  `idProducto` int(11) NOT NULL,
  `idCentroCosto` int(11) NOT NULL,
  `Cantidad` int(11) DEFAULT NULL,
  `Precio` decimal(9,3) DEFAULT NULL,
  `Importe` decimal(9,3) DEFAULT NULL,
  `Estandar` int(11) DEFAULT NULL,
  `Activo` bit(1) DEFAULT b'1',
  `Usuario` varchar(20) DEFAULT NULL,
  `FechaRegistro` datetime DEFAULT NULL,
  `UsuarioModificacion` varchar(20) DEFAULT NULL,
  `FechaModificacion` datetime DEFAULT NULL,
  PRIMARY KEY (`idSalidaProducto`),
  KEY `fk_SalidaProducto_Salida1_idx` (`idSalida`),
  KEY `fk_SalidaProducto_Producto1_idx` (`idProducto`),
  KEY `fk_SalidaProducto_CentroCosto1_idx` (`idCentroCosto`),
  CONSTRAINT `fk_SalidaProducto_CentroCosto1` FOREIGN KEY (`idCentroCosto`) REFERENCES `centrocosto` (`idCentroCosto`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_SalidaProducto_Producto1` FOREIGN KEY (`idProducto`) REFERENCES `producto` (`idProducto`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_SalidaProducto_Salida1` FOREIGN KEY (`idSalida`) REFERENCES `salida` (`idSalida`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=26 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `salidaproducto`
--

LOCK TABLES `salidaproducto` WRITE;
/*!40000 ALTER TABLE `salidaproducto` DISABLE KEYS */;
INSERT INTO `salidaproducto` VALUES (1,0,0,0,1,7.000,7.000,NULL,'','admin','2013-03-04 00:00:00',NULL,NULL),(2,0,0,0,1,7.000,7.000,NULL,'','admin','2013-03-04 00:00:00',NULL,NULL),(3,3,2,2,4,7.000,28.000,NULL,'','admin','2013-03-06 00:00:00',NULL,NULL),(4,3,6,2,2,5.000,10.000,NULL,'','admin','2013-03-06 00:00:00',NULL,NULL),(5,4,9,1,5,8.000,40.000,NULL,'','admin','2013-03-20 00:00:00',NULL,NULL),(6,5,2,1,2,7.000,14.000,0,'\0','admin','2013-04-16 00:00:00','admin','2013-04-18 00:00:00'),(7,5,2,1,1,7.000,7.000,0,'\0','admin','2013-04-18 00:00:00','admin','2013-12-29 00:00:00'),(8,5,2,1,1,7.000,7.000,0,'','admin','2013-12-29 00:00:00',NULL,NULL),(9,6,2,2,4,35.000,140.000,0,'','admin','2014-03-10 00:00:00',NULL,NULL),(10,7,2,2,5,35.000,175.000,0,'','admin','2014-03-11 00:00:00',NULL,NULL),(11,8,7,2,5,7.000,35.000,0,'\0','admin','2014-03-24 00:00:00','admin','2014-03-31 00:00:00'),(12,8,7,2,5,7.000,35.000,0,'','admin','2014-03-31 00:00:00',NULL,NULL),(13,9,2,2,5,35.000,175.000,0,'','admin','2014-04-01 00:00:00',NULL,NULL),(14,10,11,2,4,60.000,240.000,0,'','admin','2014-04-01 00:00:00',NULL,NULL),(15,11,11,2,4,60.000,240.000,0,'','admin','2014-04-01 00:00:00',NULL,NULL),(16,12,11,2,4,60.000,240.000,0,'','admin','2015-09-28 00:00:00',NULL,NULL),(17,13,11,2,4,60.000,240.000,0,'','admin','2015-09-28 00:00:00',NULL,NULL),(18,14,11,2,4,60.000,240.000,0,'','admin','2015-09-28 00:00:00',NULL,NULL),(19,15,11,2,4,60.000,240.000,0,'','admin','2015-09-28 00:00:00',NULL,NULL),(20,16,11,2,4,60.000,240.000,0,'','admin','2015-09-28 00:00:00',NULL,NULL),(21,17,11,2,4,60.000,240.000,0,'','admin','2015-09-28 00:00:00',NULL,NULL),(22,18,11,2,4,60.000,240.000,0,'','admin','2015-09-28 00:00:00',NULL,NULL),(23,19,11,2,4,60.000,240.000,0,'\0','admin','2015-09-28 00:00:00','admin','2015-10-04 00:00:00'),(24,19,11,2,4,60.000,240.000,0,'\0','admin','2015-10-04 00:00:00','admin','2015-10-04 00:00:00'),(25,19,11,2,4,60.000,240.000,0,'','admin','2015-10-04 00:00:00',NULL,NULL);
/*!40000 ALTER TABLE `salidaproducto` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `servicio`
--

DROP TABLE IF EXISTS `servicio`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `servicio` (
  `idServicio` int(11) NOT NULL AUTO_INCREMENT,
  `Descripcion` varchar(50) DEFAULT NULL,
  `Codigo` varchar(20) DEFAULT NULL,
  `Activo` bit(1) DEFAULT b'1',
  `Usuario` varchar(20) DEFAULT NULL,
  `FechaRegistro` datetime DEFAULT NULL,
  `UsuarioModificacion` varchar(20) DEFAULT NULL,
  `FechaModificacion` datetime DEFAULT NULL,
  PRIMARY KEY (`idServicio`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `servicio`
--

LOCK TABLES `servicio` WRITE;
/*!40000 ALTER TABLE `servicio` DISABLE KEYS */;
INSERT INTO `servicio` VALUES (1,'primer servicio','001','','admin','2014-08-03 00:00:00',NULL,NULL),(2,'segndi servicio','002','','admin','2014-08-03 00:00:00',NULL,NULL),(3,'cccccc','0dasda','\0','admin','2014-08-03 00:00:00','admin','2014-08-03 00:00:00');
/*!40000 ALTER TABLE `servicio` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `stock`
--

DROP TABLE IF EXISTS `stock`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `stock` (
  `idStock` int(11) NOT NULL AUTO_INCREMENT,
  `idAlmacen` int(11) NOT NULL,
  `idProducto` int(11) NOT NULL,
  `Cantidad` int(11) DEFAULT NULL,
  `Activo` bit(1) DEFAULT b'1',
  `Usuario` varchar(20) DEFAULT NULL,
  `FechaRegistro` datetime DEFAULT NULL,
  `UsuarioModificacion` varchar(20) DEFAULT NULL,
  `FechaModificacion` datetime DEFAULT NULL,
  PRIMARY KEY (`idStock`),
  KEY `fk_Stock_Almacen1_idx` (`idAlmacen`),
  KEY `fk_Stock_Producto1_idx` (`idProducto`),
  CONSTRAINT `fk_Stock_Almacen1` FOREIGN KEY (`idAlmacen`) REFERENCES `almacen` (`idAlmacen`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_Stock_Producto1` FOREIGN KEY (`idProducto`) REFERENCES `producto` (`idProducto`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=31 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `stock`
--

LOCK TABLES `stock` WRITE;
/*!40000 ALTER TABLE `stock` DISABLE KEYS */;
INSERT INTO `stock` VALUES (1,3,1,0,'','admin','2013-03-03 00:00:00',NULL,NULL),(2,1,1,0,'','admin','2013-03-03 00:00:00',NULL,NULL),(3,2,1,0,'','admin','2013-03-03 00:00:00',NULL,NULL),(4,3,2,0,'','admin','2013-03-03 00:00:00',NULL,NULL),(5,1,2,-9,'','admin','2013-03-03 00:00:00','admin','2014-03-11 00:00:00'),(6,2,2,-7,'','admin','2013-03-03 00:00:00','admin','2014-04-01 00:00:00'),(7,3,3,0,'','admin','2013-03-03 00:00:00',NULL,NULL),(8,1,3,0,'','admin','2013-03-03 00:00:00',NULL,NULL),(9,2,3,0,'','admin','2013-03-03 00:00:00',NULL,NULL),(10,3,4,0,'','admin','2013-03-03 00:00:00',NULL,NULL),(11,1,4,0,'','admin','2013-03-03 00:00:00',NULL,NULL),(12,2,4,0,'','admin','2013-03-03 00:00:00',NULL,NULL),(13,3,5,0,'','admin','2013-03-03 00:00:00',NULL,NULL),(14,1,5,0,'','admin','2013-03-03 00:00:00',NULL,NULL),(15,2,5,0,'','admin','2013-03-03 00:00:00',NULL,NULL),(16,3,6,0,'','admin','2013-03-03 00:00:00',NULL,NULL),(17,1,6,4,'','admin','2013-03-03 00:00:00','admin','2015-08-26 00:00:00'),(18,2,6,2,'','admin','2013-03-03 00:00:00','admin','2013-03-13 00:00:00'),(19,3,7,0,'','admin','2013-03-03 00:00:00',NULL,NULL),(20,1,7,-1,'','admin','2013-03-03 00:00:00','admin','2015-08-26 00:00:00'),(21,2,7,2,'','admin','2013-03-03 00:00:00','admin','2013-03-13 00:00:00'),(22,3,8,0,'','admin','2013-03-03 00:00:00',NULL,NULL),(23,1,8,0,'','admin','2013-03-03 00:00:00',NULL,NULL),(24,2,8,0,'','admin','2013-03-03 00:00:00',NULL,NULL),(25,3,9,0,'','admin','2013-03-03 00:00:00',NULL,NULL),(26,1,9,75,'','admin','2013-03-03 00:00:00','admin','2015-09-19 00:00:00'),(27,2,9,-5,'','admin','2013-03-03 00:00:00','admin','2013-03-20 00:00:00'),(28,3,10,0,'','admin','2013-03-03 00:00:00',NULL,NULL),(29,1,10,20,'','admin','2013-03-03 00:00:00','admin','2015-09-19 00:00:00'),(30,2,10,0,'','admin','2013-03-03 00:00:00',NULL,NULL);
/*!40000 ALTER TABLE `stock` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `subdiario`
--

DROP TABLE IF EXISTS `subdiario`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `subdiario` (
  `idSubdiario` int(11) NOT NULL AUTO_INCREMENT,
  `Descripcion` varchar(100) DEFAULT NULL,
  `Codigo` varchar(50) DEFAULT NULL,
  `Activo` bit(1) DEFAULT b'1',
  `Usuario` varchar(20) DEFAULT NULL,
  `FechaRegistro` datetime DEFAULT NULL,
  `UsuarioModificacion` varchar(20) DEFAULT NULL,
  `FechaModificacion` datetime DEFAULT NULL,
  PRIMARY KEY (`idSubdiario`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `subdiario`
--

LOCK TABLES `subdiario` WRITE;
/*!40000 ALTER TABLE `subdiario` DISABLE KEYS */;
INSERT INTO `subdiario` VALUES (1,'Entrada de almacen','EA','','admin','2015-06-27 00:00:00','admin','2015-07-30 00:00:00'),(2,'Salida de almacen','SA','','admin','2015-06-27 00:00:00','admin','2015-07-30 00:00:00'),(3,'Ingreso por compras','IC','','admin','2015-06-27 00:00:00','admin','2015-07-30 00:00:00'),(4,'subdiario6','c0006','\0','admin','2015-06-27 00:00:00','admin','2015-06-27 00:00:00'),(5,'Provisiones de facturas','PF','','admin','2015-07-30 00:00:00',NULL,NULL),(6,'Pagos recibidos','PR','','admin','2015-07-30 00:00:00','admin','2015-07-30 00:00:00'),(7,'Pagos efectuados','PE','','admin','2015-07-30 00:00:00','admin','2015-08-03 00:00:00');
/*!40000 ALTER TABLE `subdiario` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sucursal`
--

DROP TABLE IF EXISTS `sucursal`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sucursal` (
  `idSucursal` int(11) NOT NULL AUTO_INCREMENT,
  `Descripcion` varchar(50) DEFAULT NULL,
  `Direccion` varchar(80) DEFAULT NULL,
  `Activo` bit(1) DEFAULT b'1',
  `Usuario` varchar(20) DEFAULT NULL,
  `FechaRegistro` datetime DEFAULT NULL,
  `UsuarioModificacion` varchar(20) DEFAULT NULL,
  `FechaModificacion` datetime DEFAULT NULL,
  PRIMARY KEY (`idSucursal`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sucursal`
--

LOCK TABLES `sucursal` WRITE;
/*!40000 ALTER TABLE `sucursal` DISABLE KEYS */;
INSERT INTO `sucursal` VALUES (1,'Planta principal','carretera industrial 701','\0','admin','2013-02-21 00:00:00','admin','2013-02-21 00:00:00'),(2,'Planta secundaria','carretera industrial 700','','admin','2013-02-21 00:00:00',NULL,NULL),(3,'Sucursal 2','Carretera industrial 800','','admin','2013-02-22 00:00:00',NULL,NULL);
/*!40000 ALTER TABLE `sucursal` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tabla`
--

DROP TABLE IF EXISTS `tabla`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tabla` (
  `idtabla` int(11) DEFAULT NULL,
  `Descripcion` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tabla`
--

LOCK TABLES `tabla` WRITE;
/*!40000 ALTER TABLE `tabla` DISABLE KEYS */;
/*!40000 ALTER TABLE `tabla` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tareo`
--

DROP TABLE IF EXISTS `tareo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tareo` (
  `idTareo` int(11) NOT NULL AUTO_INCREMENT,
  `idSucursal` int(11) DEFAULT NULL,
  `idEmpleado` int(11) DEFAULT NULL,
  `Periodo` varchar(50) DEFAULT NULL,
  `Numero` varchar(50) DEFAULT NULL,
  `Fecha` datetime DEFAULT NULL,
  `TipoCambio` decimal(4,2) DEFAULT NULL,
  `Observaciones` varchar(200) DEFAULT NULL,
  `TotalHoras` decimal(4,2) DEFAULT NULL,
  `Activo` bit(1) DEFAULT b'1',
  `Usuario` varchar(20) DEFAULT NULL,
  `FechaRegistro` datetime DEFAULT NULL,
  `UsuarioModificacion` varchar(20) DEFAULT NULL,
  `FechaModificacion` datetime DEFAULT NULL,
  PRIMARY KEY (`idTareo`),
  KEY `fk_Tareo_sucursal1_idx` (`idSucursal`),
  KEY `fk_Tareo_empleado1_idx` (`idEmpleado`),
  CONSTRAINT `fk_Tareo_empleado1` FOREIGN KEY (`idEmpleado`) REFERENCES `empleado` (`idEmpleado`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_Tareo_sucursal1` FOREIGN KEY (`idSucursal`) REFERENCES `sucursal` (`idSucursal`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tareo`
--

LOCK TABLES `tareo` WRITE;
/*!40000 ALTER TABLE `tareo` DISABLE KEYS */;
INSERT INTO `tareo` VALUES (3,2,1,'Enero 2015','','2015-07-27 00:00:00',3.00,'ssdfsdfsd',0.00,'','admin','2015-07-27 00:00:00',NULL,NULL),(4,2,1,'Enero 2015','','2015-07-28 00:00:00',0.00,'bbbnvbv',0.00,'','admin','2015-07-28 00:00:00',NULL,NULL),(5,2,1,'Enero 2015','','2015-07-28 00:00:00',3.00,'sdfdddfd',0.00,'','admin','2015-07-28 00:00:00',NULL,NULL),(6,2,1,'Enero 2015','','2015-07-28 00:00:00',3.00,'llllllllllllllllllllllllllllll',0.00,'','admin','2015-07-28 00:00:00',NULL,NULL),(7,2,4,'Enero 2015','000007','2015-07-28 00:00:00',3.00,'hhhhhhhhhhhhh',0.00,'','admin','2015-07-28 00:00:00',NULL,NULL),(8,2,4,'Enero 2015','000008','0034-01-05 00:00:00',3.00,'hhhhhhhhhhhhh',0.00,'','admin','2015-07-28 00:00:00',NULL,NULL),(9,2,4,'Enero 2015','000009','0034-01-05 00:00:00',3.00,'hhhhhhhhhhhhh',8.00,'','admin','2015-07-28 00:00:00',NULL,NULL),(10,2,4,'Enero 2015','000010','0034-01-05 00:00:00',3.00,'yyyyyyyyyyyyyyy',8.00,'','admin','2015-07-28 00:00:00','admin','2015-07-28 00:00:00'),(11,2,4,'Enero 2015','000011','0034-01-05 00:00:00',3.00,'yyyyyyyyyyyyyyy',8.00,'','admin','2015-07-28 00:00:00',NULL,NULL),(12,2,4,'Enero 2015','000012','0034-01-05 00:00:00',3.00,'yyyyyyyyyyyyyyy',8.00,'','admin','2015-07-28 00:00:00',NULL,NULL),(13,2,4,'Enero 2015','000013','2015-07-28 00:00:00',3.01,'yyyyyyyyyyyyyyy',8.87,'','admin','2015-07-28 00:00:00','admin','2015-07-28 00:00:00');
/*!40000 ALTER TABLE `tareo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tasa`
--

DROP TABLE IF EXISTS `tasa`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tasa` (
  `idTasa` int(11) NOT NULL AUTO_INCREMENT,
  `Descripcion` varchar(50) DEFAULT NULL,
  `Valor` decimal(4,2) DEFAULT NULL,
  `Activo` bit(1) DEFAULT b'1',
  `Usuario` varchar(20) DEFAULT NULL,
  `FechaRegistro` datetime DEFAULT NULL,
  `UsuarioModificacion` varchar(20) DEFAULT NULL,
  `FechaModificacion` datetime DEFAULT NULL,
  PRIMARY KEY (`idTasa`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tasa`
--

LOCK TABLES `tasa` WRITE;
/*!40000 ALTER TABLE `tasa` DISABLE KEYS */;
INSERT INTO `tasa` VALUES (1,'primera tasa 1',23.55,'\0','admin','2014-04-27 00:00:00','admin','2014-04-27 00:00:00'),(2,'1ra tasa',37.43,'','admin','2014-04-27 00:00:00','admin','2014-04-27 00:00:00'),(3,'2da tasa',5.30,'','admin','2014-04-27 00:00:00',NULL,NULL);
/*!40000 ALTER TABLE `tasa` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tipoadquisicion`
--

DROP TABLE IF EXISTS `tipoadquisicion`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tipoadquisicion` (
  `idTipoAdquisicion` int(11) NOT NULL AUTO_INCREMENT,
  `Descripcion` varchar(50) DEFAULT NULL,
  `Valor` decimal(4,2) DEFAULT NULL,
  `Activo` bit(1) DEFAULT b'1',
  `Usuario` varchar(20) DEFAULT NULL,
  `FechaRegistro` datetime DEFAULT NULL,
  `UsuarioModificacion` varchar(20) DEFAULT NULL,
  `FechaModificacion` datetime DEFAULT NULL,
  PRIMARY KEY (`idTipoAdquisicion`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tipoadquisicion`
--

LOCK TABLES `tipoadquisicion` WRITE;
/*!40000 ALTER TABLE `tipoadquisicion` DISABLE KEYS */;
INSERT INTO `tipoadquisicion` VALUES (1,'destino gravado242',NULL,'\0','admin','2014-04-26 00:00:00','admin','2014-04-26 00:00:00'),(2,'Tipo Adquisicion 1',15.50,'','admin','2014-05-11 00:00:00','admin','2014-06-15 00:00:00'),(3,'Tipo Adquisicion 2',18.75,'','admin','2014-05-11 00:00:00','admin','2014-06-22 00:00:00'),(4,'Tipo Adquisicion 3',NULL,'\0','admin','2014-05-11 00:00:00','admin','2014-06-15 00:00:00'),(5,'Tipo Adquisicion 3',5.90,'','admin','2014-06-15 00:00:00',NULL,NULL);
/*!40000 ALTER TABLE `tipoadquisicion` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tipoauxiliar`
--

DROP TABLE IF EXISTS `tipoauxiliar`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tipoauxiliar` (
  `idtipoauxiliar` int(11) NOT NULL AUTO_INCREMENT,
  `Descripcion` varchar(100) DEFAULT NULL,
  `Codigo` varchar(50) DEFAULT NULL,
  `Activo` bit(1) DEFAULT b'1',
  `Usuario` varchar(20) DEFAULT NULL,
  `FechaRegistro` datetime DEFAULT NULL,
  `UsuarioModificacion` varchar(20) DEFAULT NULL,
  `FechaModificacion` datetime DEFAULT NULL,
  PRIMARY KEY (`idtipoauxiliar`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tipoauxiliar`
--

LOCK TABLES `tipoauxiliar` WRITE;
/*!40000 ALTER TABLE `tipoauxiliar` DISABLE KEYS */;
INSERT INTO `tipoauxiliar` VALUES (1,'auxi02','a001','\0','admin','2015-07-02 00:00:00',NULL,NULL),(2,'auxi02','a002','','admin','2015-07-02 00:00:00',NULL,NULL),(3,'auxi03','a003','','admin','2015-07-02 00:00:00',NULL,NULL);
/*!40000 ALTER TABLE `tipoauxiliar` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tipocambio`
--

DROP TABLE IF EXISTS `tipocambio`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tipocambio` (
  `idTipoCambio` int(11) NOT NULL AUTO_INCREMENT,
  `idMonedaPago` int(11) NOT NULL,
  `idMonedaCobra` int(11) NOT NULL,
  `Valor` decimal(6,3) DEFAULT NULL,
  `Fecha` datetime DEFAULT NULL,
  `Activo` bit(1) DEFAULT b'1',
  `Usuario` varchar(20) DEFAULT NULL,
  `FechaRegistro` datetime DEFAULT NULL,
  `UsuarioModificacion` varchar(20) DEFAULT NULL,
  `FechaModificacion` datetime DEFAULT NULL,
  PRIMARY KEY (`idTipoCambio`),
  KEY `fk_TipoCambio_Moneda1_idx` (`idMonedaPago`),
  KEY `fk_TipoCambio_Moneda2_idx` (`idMonedaCobra`),
  CONSTRAINT `fk_TipoCambio_Moneda1` FOREIGN KEY (`idMonedaPago`) REFERENCES `moneda` (`idMoneda`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_TipoCambio_Moneda2` FOREIGN KEY (`idMonedaCobra`) REFERENCES `moneda` (`idMoneda`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tipocambio`
--

LOCK TABLES `tipocambio` WRITE;
/*!40000 ALTER TABLE `tipocambio` DISABLE KEYS */;
INSERT INTO `tipocambio` VALUES (1,8,9,1.320,'2014-08-10 00:00:00','','admin','2013-02-23 00:00:00','admin','2015-06-30 00:00:00'),(2,7,8,2.550,'2014-08-10 00:00:00','\0','admin','2013-02-23 00:00:00','admin','2015-06-30 00:00:00'),(3,7,9,3.400,'2014-08-10 00:00:00','\0','admin','2013-02-23 00:00:00','admin','2015-06-30 00:00:00'),(4,9,8,0.760,'2014-08-10 00:00:00','','admin','2013-02-23 00:00:00','admin','2015-06-30 00:00:00'),(5,9,7,0.290,'2014-08-10 00:00:00','','admin','2013-02-23 00:00:00','admin','2015-06-30 00:00:00'),(6,8,7,0.390,'2014-08-10 00:00:00','','admin','2013-02-23 00:00:00','admin','2015-06-30 00:00:00'),(7,9,7,0.250,'2014-08-12 00:00:00','',NULL,NULL,'admin','2015-06-30 00:00:00'),(8,7,8,3.010,'2015-07-24 00:00:00','\0',NULL,NULL,'admin','2015-07-24 00:00:00'),(9,7,9,3.460,'2015-07-27 00:00:00','',NULL,NULL,'admin','2015-07-27 00:00:00'),(10,7,8,302.000,'2015-06-30 00:00:00','\0','admin','2015-06-30 00:00:00','admin','2015-06-30 00:00:00'),(11,7,8,312.000,'2015-06-29 00:00:00','\0','admin','2015-06-30 00:00:00','admin','2015-06-30 00:00:00'),(12,7,8,3.010,'2015-07-28 00:00:00','','admin','2015-06-30 00:00:00','admin','2015-07-28 00:00:00'),(13,7,7,1.000,'2015-06-30 00:00:00','','admin','2015-06-30 00:00:00',NULL,NULL),(14,7,8,3.000,'2015-07-24 00:00:00','\0','admin','2015-07-01 00:00:00','admin','2015-07-24 00:00:00'),(15,7,8,3.170,'2015-07-24 00:00:00','\0','admin','2015-07-02 00:00:00','admin','2015-07-24 00:00:00'),(16,7,8,3.200,'2015-07-24 00:00:00','\0','admin','2015-07-24 00:00:00','admin','2015-07-24 00:00:00'),(17,7,8,3.300,'2015-07-24 00:00:00','\0','admin','2015-07-24 00:00:00','admin','2015-07-24 00:00:00'),(18,7,8,3.200,'2015-07-27 00:00:00','','admin','2015-07-24 00:00:00','admin','2015-07-27 00:00:00');
/*!40000 ALTER TABLE `tipocambio` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tipocambiocuenta`
--

DROP TABLE IF EXISTS `tipocambiocuenta`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tipocambiocuenta` (
  `idtipocambiocuenta` int(11) NOT NULL AUTO_INCREMENT,
  `Descripcion` varchar(100) DEFAULT NULL,
  `Codigo` varchar(50) DEFAULT NULL,
  `Activo` bit(1) DEFAULT b'1',
  `Usuario` varchar(20) DEFAULT NULL,
  `FechaRegistro` datetime DEFAULT NULL,
  `UsuarioModificacion` varchar(20) DEFAULT NULL,
  `FechaModificacion` datetime DEFAULT NULL,
  PRIMARY KEY (`idtipocambiocuenta`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tipocambiocuenta`
--

LOCK TABLES `tipocambiocuenta` WRITE;
/*!40000 ALTER TABLE `tipocambiocuenta` DISABLE KEYS */;
INSERT INTO `tipocambiocuenta` VALUES (1,'tipocambio002','tp001','\0','admin','2015-07-02 00:00:00',NULL,NULL),(2,'tipocambio002','tp002','','admin','2015-07-02 00:00:00',NULL,NULL),(3,'tipocambio003','tp003','','admin','2015-07-02 00:00:00',NULL,NULL);
/*!40000 ALTER TABLE `tipocambiocuenta` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tipocaracteristica`
--

DROP TABLE IF EXISTS `tipocaracteristica`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tipocaracteristica` (
  `idTipoCaracteristica` int(11) NOT NULL AUTO_INCREMENT,
  `Descripcion` varchar(50) DEFAULT NULL,
  `Activo` bit(1) DEFAULT b'1',
  `Usuario` varchar(20) DEFAULT NULL,
  `FechaRegistro` datetime DEFAULT NULL,
  `UsuarioModificacion` varchar(20) DEFAULT NULL,
  `FechaModificacion` datetime DEFAULT NULL,
  PRIMARY KEY (`idTipoCaracteristica`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tipocaracteristica`
--

LOCK TABLES `tipocaracteristica` WRITE;
/*!40000 ALTER TABLE `tipocaracteristica` DISABLE KEYS */;
INSERT INTO `tipocaracteristica` VALUES (1,'Tapizado','',NULL,NULL,NULL,NULL),(2,'Frente','',NULL,NULL,NULL,NULL),(3,'Lateral','',NULL,NULL,NULL,NULL),(4,'Espaldar','',NULL,NULL,NULL,NULL);
/*!40000 ALTER TABLE `tipocaracteristica` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tipocompra`
--

DROP TABLE IF EXISTS `tipocompra`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tipocompra` (
  `idTipoCompra` int(11) NOT NULL AUTO_INCREMENT,
  `Codigo` varchar(10) DEFAULT NULL,
  `Descripcion` varchar(50) DEFAULT NULL,
  `Activo` bit(1) DEFAULT b'1',
  `Usuario` varchar(20) DEFAULT NULL,
  `FechaRegistro` datetime DEFAULT NULL,
  `UsuarioModificacion` varchar(20) DEFAULT NULL,
  `FechaModificacion` datetime DEFAULT NULL,
  PRIMARY KEY (`idTipoCompra`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tipocompra`
--

LOCK TABLES `tipocompra` WRITE;
/*!40000 ALTER TABLE `tipocompra` DISABLE KEYS */;
INSERT INTO `tipocompra` VALUES (1,'c00111','primer tipo de compra','\0',NULL,NULL,NULL,NULL),(2,'c002','segundo tipo de compra','','admin','2014-04-25 00:00:00',NULL,NULL),(3,'c003','tercer tipo de compra','','admin','2014-04-26 00:00:00',NULL,NULL),(4,'c5555','tipo de compra de prueba','\0','admin','2014-04-26 00:00:00','admin','2014-04-26 00:00:00');
/*!40000 ALTER TABLE `tipocompra` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tipoconfiguracioncuenta`
--

DROP TABLE IF EXISTS `tipoconfiguracioncuenta`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tipoconfiguracioncuenta` (
  `idtipoconfiguracioncuenta` int(11) NOT NULL AUTO_INCREMENT,
  `Descripcion` varchar(100) DEFAULT NULL,
  `Codigo` varchar(50) DEFAULT NULL,
  `Activo` bit(1) DEFAULT b'1',
  `Usuario` varchar(20) DEFAULT NULL,
  `FechaRegistro` datetime DEFAULT NULL,
  `UsuarioModificacion` varchar(20) DEFAULT NULL,
  `FechaModificacion` datetime DEFAULT NULL,
  PRIMARY KEY (`idtipoconfiguracioncuenta`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tipoconfiguracioncuenta`
--

LOCK TABLES `tipoconfiguracioncuenta` WRITE;
/*!40000 ALTER TABLE `tipoconfiguracioncuenta` DISABLE KEYS */;
INSERT INTO `tipoconfiguracioncuenta` VALUES (1,'Divisionaria','d001','',NULL,NULL,NULL,NULL),(2,'Analisis','a001','',NULL,NULL,NULL,NULL);
/*!40000 ALTER TABLE `tipoconfiguracioncuenta` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tipodocumento`
--

DROP TABLE IF EXISTS `tipodocumento`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tipodocumento` (
  `idTipoDocumento` int(11) NOT NULL AUTO_INCREMENT,
  `Descripcion` varchar(50) DEFAULT NULL,
  `Codigo` varchar(20) DEFAULT NULL,
  `Activo` bit(1) DEFAULT b'1',
  `Usuario` varchar(20) DEFAULT NULL,
  `FechaRegistro` datetime DEFAULT NULL,
  `UsuarioModificacion` varchar(20) DEFAULT NULL,
  `FechaModificacion` datetime DEFAULT NULL,
  PRIMARY KEY (`idTipoDocumento`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tipodocumento`
--

LOCK TABLES `tipodocumento` WRITE;
/*!40000 ALTER TABLE `tipodocumento` DISABLE KEYS */;
INSERT INTO `tipodocumento` VALUES (1,'factura','05','','admin','2014-08-02 00:00:00',NULL,'2014-08-02 00:00:00'),(2,'boleta','01','','admin','2014-08-02 00:00:00',NULL,NULL),(3,'asda','asda','\0','admin','2014-08-02 00:00:00',NULL,'2014-08-02 00:00:00');
/*!40000 ALTER TABLE `tipodocumento` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tipomovimiento`
--

DROP TABLE IF EXISTS `tipomovimiento`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tipomovimiento` (
  `idTipoMovimiento` int(11) NOT NULL AUTO_INCREMENT,
  `Descripcion` varchar(50) DEFAULT NULL,
  `Codigo` varchar(20) DEFAULT NULL,
  `Activo` bit(1) DEFAULT b'1',
  `Usuario` varchar(20) DEFAULT NULL,
  `FechaRegistro` datetime DEFAULT NULL,
  `UsuarioModificacion` varchar(20) DEFAULT NULL,
  `FechaModificacion` datetime DEFAULT NULL,
  PRIMARY KEY (`idTipoMovimiento`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tipomovimiento`
--

LOCK TABLES `tipomovimiento` WRITE;
/*!40000 ALTER TABLE `tipomovimiento` DISABLE KEYS */;
INSERT INTO `tipomovimiento` VALUES (1,'ingreso regular','ir','','admin','2013-03-03 00:00:00',NULL,NULL),(2,'salida por transferencia','st1','\0','admin','2013-03-03 00:00:00','admin','2013-03-03 00:00:00'),(3,'salida regular','sr','','admin','2013-03-03 00:00:00',NULL,NULL);
/*!40000 ALTER TABLE `tipomovimiento` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tipoordenproduccion`
--

DROP TABLE IF EXISTS `tipoordenproduccion`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tipoordenproduccion` (
  `idTipoOrdenProduccion` int(11) NOT NULL AUTO_INCREMENT,
  `Descripcion` varchar(50) DEFAULT NULL,
  `Codigo` varchar(5) DEFAULT NULL,
  `Activo` bit(1) DEFAULT b'1',
  `Usuario` varchar(20) DEFAULT NULL,
  `FechaRegistro` datetime DEFAULT NULL,
  `UsuarioModificacion` varchar(20) DEFAULT NULL,
  `FechaModificacion` datetime DEFAULT NULL,
  PRIMARY KEY (`idTipoOrdenProduccion`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tipoordenproduccion`
--

LOCK TABLES `tipoordenproduccion` WRITE;
/*!40000 ALTER TABLE `tipoordenproduccion` DISABLE KEYS */;
INSERT INTO `tipoordenproduccion` VALUES (1,'Orden de Produccion','OP','','admin','2013-03-01 00:00:00',NULL,NULL),(2,'Orden de Garantia','OG','','admin','2013-03-01 00:00:00',NULL,NULL),(3,'Orden de Reparacion','OR','','admin','2013-03-01 00:00:00',NULL,NULL),(4,'Orden de Autopartes','OA','','admin','2013-03-01 00:00:00',NULL,NULL);
/*!40000 ALTER TABLE `tipoordenproduccion` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tipoproducto`
--

DROP TABLE IF EXISTS `tipoproducto`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tipoproducto` (
  `idTipoProducto` int(11) NOT NULL AUTO_INCREMENT,
  `Descripcion` varchar(50) DEFAULT NULL,
  `Codigo` varchar(3) DEFAULT NULL,
  `Activo` bit(1) DEFAULT b'1',
  `Usuario` varchar(20) DEFAULT NULL,
  `FechaRegistro` datetime DEFAULT NULL,
  `UsuarioModificacion` varchar(20) DEFAULT NULL,
  `FechaModificacion` datetime DEFAULT NULL,
  PRIMARY KEY (`idTipoProducto`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tipoproducto`
--

LOCK TABLES `tipoproducto` WRITE;
/*!40000 ALTER TABLE `tipoproducto` DISABLE KEYS */;
INSERT INTO `tipoproducto` VALUES (1,NULL,NULL,'','admin','2013-01-16 00:00:00',NULL,NULL),(2,'Producto Intermedio','PI','','admin','2013-01-16 00:00:00','admin','2014-02-01 00:00:00'),(3,'Producto Terminado','PT','','admin','2013-01-16 00:00:00','admin','2014-01-14 00:00:00'),(4,'Materia Prima','MP','','admin','2013-01-16 00:00:00','admin','2013-02-13 00:00:00'),(5,'Materia Intermedia','MI','\0','admin','2013-01-16 00:00:00',NULL,NULL),(6,'Servicios','SV','','admin','2013-02-13 00:00:00','admin','2013-03-21 00:00:00'),(7,'tipo producto test','tpt','\0','admin','2014-02-01 00:00:00',NULL,NULL);
/*!40000 ALTER TABLE `tipoproducto` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tipoventa`
--

DROP TABLE IF EXISTS `tipoventa`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tipoventa` (
  `idTipoVenta` int(11) NOT NULL AUTO_INCREMENT,
  `Descripcion` varchar(50) DEFAULT NULL,
  `Codigo` varchar(20) DEFAULT NULL,
  `Activo` bit(1) DEFAULT b'1',
  `Usuario` varchar(20) DEFAULT NULL,
  `FechaRegistro` datetime DEFAULT NULL,
  `UsuarioModificacion` varchar(20) DEFAULT NULL,
  `FechaModificacion` datetime DEFAULT NULL,
  PRIMARY KEY (`idTipoVenta`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tipoventa`
--

LOCK TABLES `tipoventa` WRITE;
/*!40000 ALTER TABLE `tipoventa` DISABLE KEYS */;
INSERT INTO `tipoventa` VALUES (1,'pRIMER tipo de venta','tp001','','admin','2014-07-30 00:00:00',NULL,'2014-07-30 00:00:00'),(2,'SDASDAS','DASDAS','\0','admin','2014-07-30 00:00:00',NULL,'2014-07-30 00:00:00');
/*!40000 ALTER TABLE `tipoventa` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `unidadmedida`
--

DROP TABLE IF EXISTS `unidadmedida`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `unidadmedida` (
  `idUnidadMedida` int(11) NOT NULL AUTO_INCREMENT,
  `Descripcion` varchar(50) DEFAULT NULL,
  `Simbolo` varchar(5) DEFAULT NULL,
  `Activo` bit(1) DEFAULT b'1',
  `Usuario` varchar(20) DEFAULT NULL,
  `FechaRegistro` datetime DEFAULT NULL,
  `UsuarioModificacion` varchar(20) DEFAULT NULL,
  `FechaModificacion` datetime DEFAULT NULL,
  PRIMARY KEY (`idUnidadMedida`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `unidadmedida`
--

LOCK TABLES `unidadmedida` WRITE;
/*!40000 ALTER TABLE `unidadmedida` DISABLE KEYS */;
INSERT INTO `unidadmedida` VALUES (1,'Gramos','gr','','admin','2013-01-29 00:00:00',NULL,NULL),(2,'kilogramos','kg','','admin','2013-01-29 00:00:00',NULL,NULL),(3,'Milimetro','mm','','admin','2013-01-29 00:00:00',NULL,NULL),(4,'Centimetros','cm','','admin','2013-01-29 00:00:00',NULL,NULL),(5,'Metros','m','','admin','2013-01-29 00:00:00',NULL,NULL);
/*!40000 ALTER TABLE `unidadmedida` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `usuario`
--

DROP TABLE IF EXISTS `usuario`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `usuario` (
  `idUsuario` int(11) NOT NULL AUTO_INCREMENT,
  `Nick` varchar(20) DEFAULT NULL,
  `Password` varchar(12) DEFAULT NULL,
  `Nombre` varchar(50) DEFAULT NULL,
  `Email` varchar(50) DEFAULT NULL,
  `Activo` bit(1) DEFAULT b'1',
  `Usuario` varchar(20) DEFAULT NULL,
  `FechaRegistro` datetime DEFAULT NULL,
  `UsuarioModificacion` varchar(20) DEFAULT NULL,
  `FechaModificacion` datetime DEFAULT NULL,
  PRIMARY KEY (`idUsuario`)
) ENGINE=InnoDB AUTO_INCREMENT=89 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `usuario`
--

LOCK TABLES `usuario` WRITE;
/*!40000 ALTER TABLE `usuario` DISABLE KEYS */;
INSERT INTO `usuario` VALUES (1,'admin','123','Carlos Medina Carranza','angus@gg.com','',NULL,NULL,NULL,NULL),(2,'efarfan','123','Eduardo Farfan','eduardo@','',NULL,NULL,NULL,NULL),(42,'admin','123','tryr','tyrt','\0',NULL,NULL,NULL,NULL),(43,'admin','123','fsdfs','sfsd','\0',NULL,NULL,NULL,NULL),(44,'admin','123','rter','tere','\0',NULL,NULL,NULL,NULL),(45,'admin','123','asdas','dasdasda','\0',NULL,NULL,NULL,NULL),(46,'admin','123','tyryrty','rtyrtyr','\0',NULL,NULL,NULL,NULL),(47,'admin','123','tyryrty','rtyrtyr','\0',NULL,NULL,NULL,NULL),(48,'admin','123','fghfghfg','hfghfg','\0',NULL,NULL,NULL,NULL),(49,'admin','123','fghfghfg','hfghfg','\0',NULL,NULL,NULL,NULL),(50,'admin','123','rtete','rterte','\0',NULL,NULL,NULL,NULL),(51,'admin','123','tytytry','rtyrtyr','\0',NULL,NULL,NULL,NULL),(52,'admin','123','ada','dsadsa','\0',NULL,NULL,NULL,NULL),(53,'admin','123','hgfh','fghfg','\0',NULL,NULL,NULL,NULL),(54,'admin','123','ttrytr','yrtyr','\0',NULL,NULL,NULL,NULL),(55,'admin','123','gfhfg','hfghfgf','\0',NULL,NULL,NULL,NULL),(56,'admin','123','gfhfg','hfghfgf','\0',NULL,NULL,NULL,NULL),(57,'admin','123','wew','eqweqw','\0',NULL,NULL,NULL,NULL),(58,'admin','123','rewrwe','werwerw','\0',NULL,NULL,NULL,NULL),(59,'admin','123','rtert','erterte','\0',NULL,NULL,NULL,NULL),(60,'admin','123','fdgdfgdfgd','fgdfgdfgdfgd','\0',NULL,NULL,NULL,NULL),(61,'admin','123','reterter','tertertere','\0',NULL,NULL,NULL,NULL),(62,'admin','123','fsdfsdf','sdfsdf','\0',NULL,NULL,NULL,NULL),(63,'admin','123','fsdfsdf','sdfsdf','\0',NULL,NULL,NULL,NULL),(64,'admin','123','erwer','werwerw','\0',NULL,NULL,NULL,NULL),(65,'admin','123','asdasd','asdasdas','\0',NULL,NULL,NULL,NULL),(66,'admin','123','xdfccbvcbcvbc','vbcvbcvbcvbcvbcvbc','\0',NULL,NULL,NULL,NULL),(67,'admin','123','dfgdfg','dfgdfd','\0',NULL,NULL,NULL,NULL),(68,'admin','123','ghjh','gjgh','\0',NULL,NULL,NULL,NULL),(69,'admin','123','fgddf','gdfd','\0',NULL,NULL,NULL,NULL),(70,'admin','123','gj','hghjg','\0',NULL,NULL,NULL,NULL),(71,'admin','123','fdgd','gdfgd','\0',NULL,NULL,NULL,NULL),(72,'admin','123','123','123','\0',NULL,NULL,NULL,NULL),(73,'admin','123','','','\0',NULL,NULL,NULL,NULL),(74,'admin','123','','','\0',NULL,NULL,NULL,NULL),(75,'admin','123','aaaaaaaa','aaaaaaaaaaaa','\0',NULL,NULL,NULL,NULL),(76,'jose','123','jose martinez','jmartinez@','\0',NULL,NULL,NULL,NULL),(77,'jfernandez','123','Jose Fernandez','jfernandez@hotmail.com','\0',NULL,NULL,NULL,NULL),(78,'admin','123','vamos a verlo','veamos','\0',NULL,NULL,NULL,NULL),(79,'admin','123','wadasdas','dasdasdas','\0',NULL,NULL,NULL,NULL),(80,'admin','123','gdfgd','fgdfgdf','\0',NULL,NULL,NULL,NULL),(81,'admin','123','','','\0',NULL,NULL,NULL,NULL),(82,'admin','123','','','\0',NULL,NULL,NULL,NULL),(83,'angus','123','carlos medina carranza','cmedina@','\0',NULL,NULL,NULL,NULL),(84,'admin','123','Infiltrado','infiltrad@hotmail','\0',NULL,NULL,NULL,NULL),(85,'admin','123','otro infiltrado','anonimus@','\0',NULL,NULL,NULL,NULL),(86,'arios','123','Alejandra Rios Vidal','arios@bus.com','',NULL,NULL,NULL,NULL),(87,'jfernandez','123','jose fernandez','jfernandez@buss.com','\0',NULL,NULL,NULL,NULL),(88,'jfernando2','3858w','fernando','fer@buss.com','',NULL,NULL,NULL,NULL);
/*!40000 ALTER TABLE `usuario` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping routines for database 'empbus'
--
/*!50003 DROP FUNCTION IF EXISTS `cast_to_bit` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `cast_to_bit`(N varchar(10)) RETURNS bit(1)
BEGIN

return case N when 'true' then 1 else 0 end;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `p` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `p`()
BEGIN
DECLARE exit handler for sqlexception
BEGIN
	ROLLBACK;
	SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Error inesperado';
END;
  
DECLARE exit handler for sqlwarning
 BEGIN
    -- WARNING
 ROLLBACK;
END;

START TRANSACTION;


INSERT INTO tabla(idtabla,descripcion)
SELECT 1,'tercera TABLA';
INSERT INTO tabla(idtabla,descripcion)
SELECT 'asdas','cuarta TABLA';

    
COMMIT;


END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `prueba` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `prueba`()
begin 

declare prmintidAsiento int;
call uspInsAsiento('Enero 2015',1,curdate(),null,8,3.15,'prueba','','<root></root>',prmintidAsiento , 'admin');

select prmintidAsiento;


end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `uspGetactividad` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `uspGetactividad`(idactividad INT)
select c.idactividad,c.Descripcion, c.Codigo
from actividad c
where c.idactividad = idactividad ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `uspGetajuste` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `uspGetajuste`(idajuste INT)
select c.idajuste,c.Descripcion, c.Codigo
from ajuste c
where c.idajuste = idajuste ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `uspGetAlmacen` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `uspGetAlmacen`(IN id INT)
SELECT IdAlmacen,IdSucursal,Descripcion,Codigo FROM Almacen
WHERE IdAlmacen = id LIMIT 1 ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `uspGetAporte` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `uspGetAporte`(IN id INT)
SELECT idAporte,Descripcion,Valor FROM Aporte
WHERE idAporte = id LIMIT 1 ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `uspGetAsiento` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `uspGetAsiento`(idasiento INT)
Select a.numero, a.periodo, a.idasiento, a.idsubdiario, sub.descripcion as DSubdiario, sub.codigo as CODSubdiario, DATE_FORMAT(a.Fecha,'%d-%m-%Y') as Fecha
,suc.Descripcion as DSucursal, a.idsucursal, a.idmoneda, m.Descripcion as DMoneda, a.tipocambio, a.glosa
from asiento a
inner join Subdiario sub on sub.idsubdiario = a.idsubdiario
left join Sucursal suc on suc.idsucursal = a.idsucursal
left join Moneda m on m.idmoneda = a.idmoneda
where a.Activo = 1 and a.idasiento = idasiento ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `uspGetCentroCosto` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `uspGetCentroCosto`(IN id INT)
SELECT IdCentroCosto,Descripcion,Codigo FROM CentroCosto
WHERE IdCentroCosto = id LIMIT 1 ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `uspGetClase` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `uspGetClase`(idclase INT)
select c.idclase,c.Descripcion, c.Codigo
from clase c
where c.idclase = idclase ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `uspGetClienteProveedor` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `uspGetClienteProveedor`(IN id INT)
SELECT IdClienteProveedor,RazonSocial,Ruc,Dni,Telefono1,Telefono2,Correo,Contacto,Direccion FROM ClienteProveedor
WHERE IdClienteProveedor = id LIMIT 1 ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `uspGetConfiguracion` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `uspGetConfiguracion`(idConfiguracion int)
SELECT t.idConfiguracion
,t.idSubdiario
,s.Descripcion as dsubdiario
,s.Codigo as codsubdiario
,t.idFamilia
,f.Descripcion as dfamilia
,f.Codigo as codfamilia
,t.Descripcion
FROM Configuracion t
left JOIN Subdiario s on s.idSubdiario = t.idSubdiario
left JOIN Familia f on f.idFamilia = t.idFamilia
where t.idConfiguracion = idConfiguracion ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `uspGetConfiguracionAlmacen` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `uspGetConfiguracionAlmacen`(idConfiguracionAlmacen int)
SELECT t.idconfiguracionalmacen 
,t.idFamilia
,t.idCuentaExistencias
,t.idCuentaCompras
,t.idCuentaVariacionExistencias
,t.idCuentaTransferencia
,t.idCuentaProducto
,t.idCuentaVariacionProducto
,t.Descripcion
,f.Descripcion as dfamilia
,f.Codigo as codfamilia
,c1.descripcion as dCuentaExistencias
,c1.codigo as codCuentaExistencias
,c2.Descripcion as dCuentaCompras
,c2.Codigo as codCuentaCompras
,c3.Descripcion as dCuentaVariacionExistencias
,c3.Codigo as codCuentaVariacionExistencias
,c4.Descripcion as dCuentaTransferencia
,c4.Codigo as codCuentaTransferencia
,c5.Descripcion as dCuentaProducto
,c5.Codigo as codCuentaProducto
,c6.Descripcion as dCuentaVariacionProducto
,c6.Codigo as codCuentaVariacionProducto
FROM ConfiguracionAlmacen t
left JOIN familia f on f.idfamilia = t.idfamilia
left JOIN Cuenta c1 on c1.idCuenta = t.idCuentaExistencias
left JOIN Cuenta c2 on c2.idCuenta = t.idCuentaCompras
left JOIN Cuenta c3 on c3.idCuenta = t.idCuentaVariacionExistencias
left JOIN Cuenta c4 on c4.idCuenta = t.idCuentaTransferencia
left JOIN Cuenta c5 on c5.idCuenta = t.idCuentaProducto
left JOIN Cuenta c6 on c6.idCuenta = t.idCuentaVariacionProducto
where t.idconfiguracionalmacen = idconfiguracionalmacen ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `uspGetConfiguracionCuenta` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `uspGetConfiguracionCuenta`(idConfiguracionCuenta int)
select t.idConfiguracionCuenta, t.idcuenta, t.descripcion, t.IdTipoConfiguracionCuenta, t.ExigeCC, t.IdClase, t.IdNaturaleza, t.IdMoneda, t.IdTipoAuxiliar, t.IdAjuste
, t.IdTipoCambioCuenta, t.IdCuentaabono, t.idcuentacargo, cu.Descripcion as DCuenta, ca.Descripcion as Dabono, cc.Descripcion as dcargo
, cu.codigo as codcuenta, cc.codigo as codcargo, ca.Codigo as codabono
from ConfiguracionCuenta t
inner join TipoConfiguracionCuenta tcc on tcc.IdTipoConfiguracionCuenta = t.IdTipoConfiguracionCuenta
left join Clase c on c.idClase = t.idclase
left join Naturaleza n on n.idNaturaleza = t.idNaturaleza
left join Moneda m on m.idMoneda = t.idMoneda
left join TipoAuxiliar ta on ta.idtipoauxiliar = t.idtipoauxiliar
left join Ajuste a on a.idajuste = t.idajuste
left join TipoCambioCuenta tc on tc.idtipocambiocuenta = t.idtipocambiocuenta
left join Cuenta ca on ca.idCuenta = t.idcuentaabono
left join cuenta cc on cc.idCuenta = t.idcuentacargo
left join cuenta cu on cu.idCuenta = t.idCuenta
where t.idConfiguracionCuenta  = idConfiguracionCuenta ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `uspGetCotizacion` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `uspGetCotizacion`(IN idCotizacion INT)
SELECT c.idcotizacion,c.idclienteproveedor,c.idmodelochasis, DATE_FORMAT(c.Fecha,'%Y-%m-%d') as Fecha,c.Numerochasis,c.Numeroasientos
,c.Numeroparabrisas,c.Ventanas,c.Tipocarroceria,c.Colorfondo,c.Colorartes,c.Colorotros,c.Observaciones,c.Serie
, cp.RazonSocial as DClienteProveedor, c.Estado, c.Monto, c.idProducto, p.Descripcion AS DProducto, p.Codigo as CodigoProducto
, cc.idCentroCosto, cc.Descripcion as DCentroCosto, cp.Ruc, mc.Descripcion as DModeloChasis
FROM Cotizacion c
INNER JOIN ClienteProveedor cp on cp.idClienteProveedor = c.idClienteProveedor
INNER JOIN Producto p on p.idProducto = c.idProducto
INNER JOIN CentroCosto cc on cc.idCentroCosto = c.idCentroCosto
INNER JOIN modelochasis mc on mc.idModeloChasis = c.idModeloChasis
WHERE c.idCotizacion = idCotizacion and c.Activo = 1 ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `uspGetCotizacionProducto` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `uspGetCotizacionProducto`(IN idCotizacion INT)
SELECT c.idCotizacionProducto, c.idCotizacion, c.idProducto, c.Cantidad, p.Descripcion as DProducto
FROM CotizacionProducto c
INNER JOIN Producto p on p.idProducto = c.idProducto
WHERE c.idCotizacion = idCotizacion ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `uspGetCuenta` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `uspGetCuenta`(IN id INT)
SELECT IdCuenta,Descripcion,Codigo FROM Cuenta
WHERE IdCuenta = id LIMIT 1 ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `uspGetEmpleado` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `uspGetEmpleado`(IN id INT)
SELECT IdEmpleado,Nombre,DNI,Direccion,Codigo,Telefono1,Telefono2,Puesto FROM Empleado
WHERE IdEmpleado = id LIMIT 1 ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `uspGetFactura` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `uspGetFactura`(IN id INT)
SELECT IdFactura,Periodo,Numero,IdPuntoVenta,IdTipoVenta,IdCotizacion,IdOrdenProduccion,IdClienteProveedor,DocumentoIdentidad,idTipoDocumento,Serie
,NumeroDocumento,DATE_FORMAT(Fecha,'%d-%m-%Y') AS Fecha,TipoCambio,IdFormaPago,DATE_FORMAT(FechaVencimiento,'%d-%m-%Y') AS FechaVencimiento,IdMoneda,Glosa,Igv,DPercepcion,IdServicio,Referencia,SerieGuia,NumeroGuia,Documento
,Importe,Aplicar,DCliente,CotizacionOP
FROM Factura
WHERE IdFactura = id LIMIT 1 ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `uspGetFamilia` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `uspGetFamilia`(IN id INT)
SELECT f.IdFamilia,f.Descripcion,f.Codigo,c.idCuenta,c.Descripcion as DCuenta
FROM Familia f
LEFT JOIN Cuenta c on f.idCuenta = c.idCuenta
WHERE IdFamilia = id LIMIT 1 ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `uspGetGuia` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `uspGetGuia`(IN id INT)
SELECT g.IdGuia,g.Periodo,g.Numero,g.Fecha,g.TipoCambio,g.Serie,g.NumeroDocumento,g.IdTipoMovimiento,g.Referencia,g.IdOrdenProduccion
,g.IdClienteProveedor,g.IdAlmacen,g.Observaciones, op.Numero as DOrdenProduccion, cp.RazonSocial as DClienteProveedor
FROM Guia g
INNER JOIN OrdenProduccion op on op.idOrdenProduccion = g.idOrdenProduccion
INNER JOIN clienteproveedor cp on cp.idClienteProveedor = g.idClienteProveedor
WHERE IdGuia = id LIMIT 1 ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `uspGetIGV` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `uspGetIGV`()
SELECT idIGV, Valor 
FROM IGV 
WHERE Activo = 1
LIMIT 1 ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `uspGetIngreso` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `uspGetIngreso`(idIngreso INT)
SELECT i.idIngreso,i.idAlmacen, a.Descripcion as DAlmacen,i.idTipoMovimiento, tm.Descripcion as DTipoMovimiento
,i.idOrdenCompra, oc.Numero as DOrdenCompra,i.idClienteProveedor, cp.RazonSocial as DClienteProveedor,i.idMoneda
, m.Descripcion as DMoneda,DATE_FORMAT(i.Fecha,'%d-%m-%Y') as Fecha,i.Numero,i.TipoCambio,i.GuiaRemision,i.FacturaProveedor
,DATE_FORMAT(i.FechaDocumento,'%d-%m-%Y') as FechaDocumento,i.ProvisionCompra,i.TipoCambioMoneda,i.Monto,i.Observaciones, i.idSubdiario
FROM Ingreso i
INNER JOIN Almacen a on a.idAlmacen = i.idAlmacen
INNER JOIN TipoMovimiento tm on tm.idTipoMovimiento = i.idTipoMovimiento
INNER JOIN OrdenCompra oc on oc.idOrdenCompra = i.idOrdenCompra
INNER JOIN ClienteProveedor cp on cp.idClienteProveedor = i.idClienteProveedor
INNER JOIN Moneda m on m.idMoneda = i.idMoneda
WHERE i.idIngreso = idIngreso ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `uspGetListaPrecio` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `uspGetListaPrecio`(IN id INT)
SELECT IdListaPrecio,IdProducto,Precio,TipoCambio,Fecha,Estado FROM ListaPrecio
WHERE IdListaPrecio = id LIMIT 1 ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `uspGetMonedaLocal` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `uspGetMonedaLocal`()
SELECT idMoneda,Descripcion,DescripcionCorta,Simbolo 
FROM moneda
WHERE local = 1 LIMIT 1 ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `uspGetNaturaleza` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `uspGetNaturaleza`(idNaturaleza INT)
select c.idNaturaleza,c.Descripcion, c.Codigo
from Naturaleza c
where c.idNaturaleza = idNaturaleza ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `uspGetNumeroSerie` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `uspGetNumeroSerie`(IN Documento VARCHAR(20))
SELECT n.Numero, n.Serie + 1 as Serie
FROM NumeroSerie n
WHERE n.Documento = Documento ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `uspGetOrdenCompra` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `uspGetOrdenCompra`(IN idOrdenCompra INT)
SELECT oc.idOrdenCompra,oc.idSucursal,s.Descripcion as DSucursal,oc.idFormaPago,fp.Descripcion as DFormaPago,oc.idMoneda
,m.Descripcion as DMoneda,oc.idClienteProveedor,cp.RazonSocial as DClienteProveedor,DATE_FORMAT(oc.Fecha,'%d-%m-%Y') as Fecha
,oc.TipoCambio,DATE_FORMAT(oc.FechaEntrega,'%d-%m-%Y') as FechaEntrega,oc.Observaciones,oc.IGV,oc.Subtotal,oc.Total,oc.Numero,oc.Estado
,cp.Ruc, oc.Afecto
FROM OrdenCompra oc
INNER JOIN Sucursal s on s.idSucursal = oc.idSucursal
INNER JOIN FormaPago fp on fp.idFormaPago = oc.idFormaPago
INNER JOIN Moneda m on m.idMoneda = oc.idMoneda
INNER JOIN ClienteProveedor cp on cp.idClienteProveedor = oc.idClienteProveedor
WHERE oc.idOrdenCompra = idOrdenCompra ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `uspGetOrdenProduccion` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `uspGetOrdenProduccion`(IN idOrdenProduccion INT)
SELECT op.idOrdenProduccion, COALESCE(op.idSucursal,0) as idSucursal, COALESCE(s.Descripcion,'') as DSucursal, op.idProducto
, p.Descripcion as DProductoPrincipal ,DATE_FORMAT(op.Fecha,'%d-%m-%Y') as Fecha, op.Numero, coalesce(DATE_FORMAT(op.FechaInicio,'%d-%m-%Y'),'') as FechaInicio
, coalesce(DATE_FORMAT(op.FechaTermino,'%d-%m-%Y'),'') as FechaTermino, coalesce(op.Observaciones,'') as Observaciones, op.idCotizacion, c.Serie as DCotizacion
, op.Estado, op.Monto, op.idTipoOrdenProduccion, op.idCentroCosto, cc.Descripcion as DCentroCosto, op.idClienteProveedor
, cp.RazonSocial as DClienteProveedor
FROM OrdenProduccion op
LEFT JOIN Producto p on p.idProducto = op.idProducto
LEFT JOIN Cotizacion c on c.idCotizacion = op.idCotizacion
LEFT JOIN Sucursal s on s.idSucursal = op.idSucursal
LEFT JOIN CentroCosto cc on cc.idCentroCosto = op.idCentroCosto
LEFT JOIN ClienteProveedor cp on cp.idClienteProveedor = op.idClienteProveedor
WHERE op.idOrdenProduccion = idOrdenProduccion ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `uspGetOrdenServicio` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `uspGetOrdenServicio`(idOrdenServicio INT)
SELECT o.idOrdenServicio,o.idCentroCosto, cc.Descripcion as DCentroCosto,o.idFormaPago, fp.Descripcion as DFormaPago,o.idMoneda
, m.Descripcion as DMoneda,o.idClienteProveedor, cp.RazonSocial as DClienteProveedor,DATE_FORMAT(o.Fecha,'%d-%m-%Y')  as Fecha
,o.TipoCambio,DATE_FORMAT(o.FechaEntrega,'%d-%m-%Y') as FechaEntrega,o.Observaciones,o.IGV,o.Subtotal,o.Monto,o.Numero,o.Estado
,o.idSucursal, s.Descripcion as DSucursal, cp.RUC as rucProveedor, o.Afecto
FROM OrdenServicio o
INNER JOIN CentroCosto cc on cc.idCentroCosto = o.idCentroCosto
INNER JOIN FormaPago fp on fp.idFormaPago = o.idFormaPago
INNER JOIN Moneda m on m.idMoneda = o.idMoneda
INNER JOIN ClienteProveedor cp on cp.idClienteProveedor = o.idClienteProveedor
INNER JOIN Sucursal s on s.idSucursal = o.idSucursal
WHERE o.idOrdenServicio = idOrdenServicio ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `uspGetPedido` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `uspGetPedido`(idPedido INT)
SELECT p.idPedido,p.idCentroCosto, cc.Descripcion as DCentroCosto,p.idOrdenProduccion, op.Numero as DOrdenProduccion ,p.idEmpleado
, e.Nombre as DEmpleado,p.Estado,p.Numero, DATE_FORMAT(p.Fecha,'%d-%m-%Y') as Fecha, p.Observaciones
FROM Pedido p
INNER JOIN CentroCosto cc on cc.idCentroCosto = p.idCentroCosto
LEFT JOIN Empleado e on e.idEmpleado = p.idEmpleado
LEFT JOIN OrdenProduccion op on op.idOrdenProduccion = p.idOrdenProduccion
WHERE p.idPedido = idPedido LIMIT 1 ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `uspGetPercepcion` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `uspGetPercepcion`(IN id INT)
SELECT idPercepcion,Descripcion,Valor FROM Percepcion
WHERE idPercepcion = id LIMIT 1 ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `uspGetPeriodo` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `uspGetPeriodo`(IN id INT)
SELECT idPeriodo,Anio,Mes FROM Periodo
WHERE idPeriodo = id LIMIT 1 ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `uspGetPermiso` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `uspGetPermiso`(IN idUsuario INT, IN Opcion VARCHAR(50))
begin
SELECT count(*) as Cantidad
FROM Permiso p
INNER JOIN Opcion o on o.idOpcion = p.idOpcion
WHERE p.idUsuario = idUsuario and p.Activo = 1 and o.Descripcion = Opcion;
end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `uspGetProducto` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `uspGetProducto`(IN idProducto INT)
SELECT p.idProducto,p.idtipoproducto,tp.descripcion as DTipoProducto,p.Descripcion,p.Codigo,p.Contador,p.Umcompra,p.Umconsumo
,p.idunidadmedidacompra,p.idunidadmedidaconsumo,p.Conversion,p.IdFamilia,f.Descripcion as DFamilia,um.Simbolo as DUnidadMedidaCompra
,um2.Simbolo as DUnidadMedidaConsumo,lp.Precio
FROM Producto p
INNER JOIN TipoProducto tp on tp.idTipoProducto = p.idTipoProducto
INNER JOIN Familia f on f.idFamilia = p.idFamilia
INNER JOIN UnidadMedida um on um.idUnidadMedida = p.idUnidadMedidaCompra
INNER JOIN UnidadMedida um2 on um2.idUnidadMedida = p.idUnidadMedidaConsumo
LEFT JOIN ListaPrecio lp on lp.idProducto = p.idProducto and lp.Activo = 1 and lp.Estado = 1
WHERE p.idProducto = idProducto LIMIT 1 ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `uspGetProvision` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `uspGetProvision`(idProvision int)
SELECT p.idProvision,Numero,Periodo,DATE_FORMAT(Fecha,'%d-%m-%Y') as Fecha,ServicioCompra,Codigo,RazonSocial,Ruc,Glosa,TipoDocumento,Serie,NumeroDocumento,DATE_FORMAT(FechaDocumento,'%d-%m-%Y') as FechaDocumento
,DATE_FORMAT(FechaVencimiento,'%d-%m-%Y') as FechaVencimiento,TipoCambio,TipoAdquisicion,Igv,Percepcion,Renta,Aporte,Tasa,Importe,BaseAfecta,Inafecto,IgvDocumento,PercepcionAfecta
,RentaAfecta,AportePension,Total,Activo,idOrdenCompra,idSucursal,idTipoCompra,idFormaPago,idMoneda,idOrdenServicio
FROM provision p
WHERE p.idProvision = idProvision LIMIT 1 ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `uspGetPuntoVenta` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `uspGetPuntoVenta`(IN id INT)
SELECT IdPuntoVenta,Descripcion,Codigo FROM PuntoVenta
WHERE IdPuntoVenta = id LIMIT 1 ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `uspGetRenta` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `uspGetRenta`(IN id INT)
SELECT idRenta,Descripcion,Valor FROM Renta
WHERE idRenta = id LIMIT 1 ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `uspGetSalida` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `uspGetSalida`(idSalida INT)
SELECT s.idSalida,s.idAlmacen,s.idTipoMovimiento,s.idPedido,s.idEmpleado,0 as idMoneda,DATE_FORMAT(s.Fecha,'%d-%m-%Y') as Fecha,s.Numero,s.TipoCambio
,s.Observaciones,s.TipoCambioMoneda, a.Descripcion as DAlmacen, tm.Descripcion as DTipoMovimiento, p.Numero as DOrdenProduccion
,e.Nombre as DEmpleado, '' as DMoneda, s.idsubdiario
FROM Salida s
INNER JOIN Almacen a on a.idAlmacen = s.idAlmacen
INNER JOIN TipoMovimiento tm on tm.idTipoMovimiento = s.idTipoMovimiento 
INNER JOIN pedido p on p.idPedido = s.idPedido 
INNER JOIN Empleado e on e.idEmpleado = s.idEmpleado
WHERE s.idSalida = idSalida LIMIT 1 ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `uspGetServicio` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `uspGetServicio`(IN id INT)
SELECT IdServicio,Descripcion,Codigo FROM Servicio
WHERE IdServicio = id LIMIT 1 ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `uspGetStock` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `uspGetStock`(idAlmacen INT,idProducto INT)
SELECT s.Cantidad
FROM Stock s
INNER JOIN Producto p on p.idProducto = s.idProducto
WHERE s.idAlmacen = idAlmacen and s.idProducto = idProducto LIMIT 1 ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `uspGetSubdiario` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `uspGetSubdiario`(IN id INT)
SELECT idSubdiario,Descripcion,Codigo FROM Subdiario
WHERE idSubdiario = id LIMIT 1 ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `uspGetSucursal` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `uspGetSucursal`(IN id INT)
SELECT IdSucursal,Descripcion,Direccion FROM Sucursal
WHERE IdSucursal = id LIMIT 1 ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `uspGetTareo` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `uspGetTareo`(idtareo int)
select t.idtareo
,t.periodo
,t.numero
,DATE_FORMAT(t.Fecha,'%d-%m-%Y') as Fecha
,t.tipocambio 
,t.idsucursal 
,s.Descripcion as dsucursal
,t.idempleado 
,e.nombre as dempleado
,e.Codigo as codempleado
,t.observaciones 
,t.totalhoras 
from tareo t
inner join sucursal s on s.idsucursal = t.idsucursal
inner join empleado e on e.idEmpleado = t.idempleado
where t.idtareo = idtareo ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `uspGetTasa` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `uspGetTasa`(IN id INT)
SELECT idTasa,Descripcion,Valor FROM Tasa
WHERE idTasa = id LIMIT 1 ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `uspGetTipoAdquisicion` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `uspGetTipoAdquisicion`(IN id INT)
SELECT idTipoAdquisicion,Descripcion,Valor FROM TipoAdquisicion
WHERE idTipoAdquisicion = id LIMIT 1 ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `uspGettipoauxiliar` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `uspGettipoauxiliar`(idtipoauxiliar INT)
select c.idtipoauxiliar,c.Descripcion, c.Codigo
from tipoauxiliar c
where c.idtipoauxiliar = idtipoauxiliar ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `uspGetTipoCambio` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `uspGetTipoCambio`(IN MonedaPago INT, IN MonedaCobra INT)
SELECT tc.idTipoCambio, tc.idMonedaPago, m.Descripcion as DMonedaPago, tc.idMonedaCobra, m2.Descripcion as DMonedaCobra, tc.Valor 
FROM TipoCambio tc
INNER JOIN Moneda m on m.idMoneda = tc.idMonedaPago
INNER JOIN Moneda m2 on m2.idMoneda = tc.idMonedaCobra
WHERE tc.idMonedaPago = MonedaPago and tc.idMonedaCobra = MonedaCobra and tc.Activo = 1 LIMIT 1 ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `uspGettipocambiocuenta` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `uspGettipocambiocuenta`(idtipocambiocuenta INT)
select c.idtipocambiocuenta,c.Descripcion, c.Codigo
from tipocambiocuenta c
where c.idtipocambiocuenta = idtipocambiocuenta ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `uspGetTipoCambioPorFechaSoles` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `uspGetTipoCambioPorFechaSoles`(Fecha DATETIME,idMonedaPago INT, moneda INT)
SELECT t.idtipocambio, t.idMonedaCobra, t.idmonedapago, m.descripcion AS DMonedaPago, m2.Descripcion as DMonedaCobra, t.Valor FROM tipocambio t
INNER JOIN Moneda m on m.idMoneda = t.idMonedaPago 
LEFT JOIN Moneda m2 on m2.idmoneda = moneda
WHERE t.Fecha = Fecha and t.idMonedaCobra= moneda and t.idMonedaPago = idMonedaPago and t.activo = 1
LIMIT 1 ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `uspGetTipoCompra` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `uspGetTipoCompra`(IN id INT)
SELECT idTipoCompra,Descripcion,Codigo FROM TipoCompra
WHERE idTipoCompra = id LIMIT 1 ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `uspGettipoconfiguracioncuenta` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `uspGettipoconfiguracioncuenta`(idtipoconfiguracioncuenta INT)
select c.idtipoconfiguracioncuenta,c.Descripcion, c.Codigo
from tipoconfiguracioncuenta c
where c.idtipoconfiguracioncuenta = idtipoconfiguracioncuenta ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `uspGetTipoDocumento` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `uspGetTipoDocumento`(IN id INT)
SELECT IdTipoDocumento,Descripcion,Codigo FROM TipoDocumento
WHERE IdTipoDocumento = id LIMIT 1 ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `uspGetTipoMovimiento` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `uspGetTipoMovimiento`(IN id INT)
SELECT IdTipoMovimiento,Descripcion,Codigo FROM TipoMovimiento
WHERE IdTipoMovimiento = id LIMIT 1 ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `uspGetTipoProducto` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `uspGetTipoProducto`(IN id INT)
SELECT idTipoProducto,Descripcion,Codigo FROM TipoProducto
WHERE idTipoProducto = id LIMIT 1 ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `uspGetTipoVenta` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `uspGetTipoVenta`(IN id INT)
SELECT IdTipoVenta,Descripcion,Codigo FROM TipoVenta
WHERE IdTipoVenta = id LIMIT 1 ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `uspGetUltimaAsiento` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `uspGetUltimaAsiento`()
Select max(idasiento) as idasiento
from asiento
where Activo = 1 ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `uspGetUltimaConfiguracion` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `uspGetUltimaConfiguracion`()
select ifnull(max(idConfiguracion),0)  as idConfiguracion
from Configuracion ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `uspGetUltimaConfiguracionAlmacen` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `uspGetUltimaConfiguracionAlmacen`()
select ifnull(max(idConfiguracionAlmacen),0)  as idConfiguracionAlmacen
from ConfiguracionAlmacen ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `uspGetUltimaConfiguracionCuenta` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `uspGetUltimaConfiguracionCuenta`()
select max(idConfiguracionCuenta) as idConfiguracionCuenta
from ConfiguracionCuenta ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `uspGetUltimaFactura` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `uspGetUltimaFactura`()
SELECT MAX(idFactura)  as idFactura
FROM Factura 
WHERE Activo = 1
LIMIT 1 ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `uspGetUltimaGuia` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `uspGetUltimaGuia`()
SELECT MAX(idGuia)  as idGuia
FROM Guia 
WHERE Activo = 1
LIMIT 1 ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `uspGetUltimaSalida` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `uspGetUltimaSalida`()
SELECT MAX(idSalida) as idSalida 
FROM Salida
WHERE Activo = 1 ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `uspGetUltimaTareo` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `uspGetUltimaTareo`()
select ifnull(max(idtareo),0)  as idtareo
from tareo ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `uspGetUltimoIdCotizacion` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `uspGetUltimoIdCotizacion`()
SELECT MAX(idCotizacion) as idCotizacion
FROM Cotizacion
WHERE Activo = 1 LIMIT 1 ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `uspGetUltimoIdOrdenCompra` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `uspGetUltimoIdOrdenCompra`()
SELECT MAX(o.idOrdenCompra) AS idOrdenCompra 
FROM OrdenCompra o
WHERE o.Activo = 1 ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `uspGetUltimoIdOrdenProduccion` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `uspGetUltimoIdOrdenProduccion`()
SELECT MAX(idOrdenProduccion) as idOrdenProduccion FROM OrdenProduccion WHERE Activo = 1 ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `uspGetUltimoIdOrdenServicio` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `uspGetUltimoIdOrdenServicio`()
SELECT MAX(idOrdenServicio) as idOrdenServicio 
FROM OrdenServicio
WHERE Activo = 1 ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `uspGetUltimoIdProvision` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `uspGetUltimoIdProvision`()
SELECT MAX(idProvision) as idProvision FROM Provision LIMIT 1 ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `uspGetUltimoIngreso` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `uspGetUltimoIngreso`()
SELECT MAX(idIngreso) as idIngreso FROM Ingreso 
WHERE Activo = 1 LIMIT 1 ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `uspGetUltimoPedido` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `uspGetUltimoPedido`()
SELECT MAX(p.idPedido) as idPedido
FROM Pedido p 
WHERE p.Activo = 1 LIMIT 1 ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `uspGetUsuario` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `uspGetUsuario`(IN id INT)
SELECT idUsuario,Nick,Password,Nombre,Email FROM Usuario
WHERE idUsuario = id LIMIT 1 ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `uspGetUsuarioValido` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `uspGetUsuarioValido`(IN Nick VARCHAR(20), IN Password VARCHAR(12))
SELECT idUsuario,Nick,Password,Nombre,Email FROM Usuario u
WHERE u.Nick = Nick and u.Password = Password LIMIT 1 ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `uspImpCotizacion` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `uspImpCotizacion`(IN idCotizacion INT)
SELECT c.idCotizacion, c.idClienteProveedor, cp.RazonSocial as DClienteProveedor, c.idModeloChasis, m.Descripcion as DModeloChasis, c.Serie
, DATE_FORMAT(c.Fecha,'%m-%d-%Y') as Fecha, c.NumeroChasis, c.TipoCarroceria, c.NumeroChasis, c.NumeroAsientos, c.NumeroParabrisas, c.Ventanas
, c.ColorFondo, c.ColorArtes, c.ColorOtros, c.Observaciones,ctp.idProducto, p.Descripcion, ctp.Cantidad
FROM Cotizacion c
INNER JOIN CotizacionProducto ctp on ctp.idCotizacion = c.idCotizacion
INNER JOIN ModeloChasis m on m.idModeloChasis = c.idModeloChasis
INNER JOIN ClienteProveedor cp on cp.idClienteProveedor = c.idClienteProveedor
INNER JOIN Producto p on p.idProducto = ctp.idProducto
WHERE c.Activo = 1 and (c.idCotizacion = idCotizacion) ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `uspInsactividad` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `uspInsactividad`(Descripcion varchar(100), Codigo varchar(50), usuario varchar(20))
insert into actividad(Descripcion, Codigo, usuario,fecharegistro)
select Descripcion, Codigo, usuario,curdate() ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `uspInsajuste` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `uspInsajuste`(Descripcion varchar(100), Codigo varchar(50), usuario varchar(20))
insert into ajuste(Descripcion, Codigo, usuario,fecharegistro)
select Descripcion, Codigo, usuario,curdate() ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `uspInsAlmacen` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `uspInsAlmacen`(IN IdSucursal INT, IN Descripcion VARCHAR(50), IN Codigo VARCHAR(10), IN Usuario VARCHAR(20))
INSERT INTO Almacen(IdSucursal,Descripcion,Codigo,Usuario,FechaRegistro)
VALUES(IdSucursal,Descripcion,Codigo,Usuario,CURDATE()) ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `uspInsAporte` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `uspInsAporte`(IN Descripcion VARCHAR(50), IN Valor DECIMAL(4,2), Usuario VARCHAR(20))
INSERT INTO Aporte(Descripcion,Valor,FechaRegistro,Usuario)
VALUES(Descripcion,Valor,curdate(),Usuario) ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `uspInsAsiento` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `uspInsAsiento`(Periodo varchar(20),idSubdiario INT,Fecha datetime,idSucursal int,idMoneda int,tipocambio decimal(4,2),glosa varchar(200),numero varchar(20),xml varchar(4000),OUT idAsiento int, usuario VARCHAR(20), idingreso int, idsalida int)
begin

declare i int;
declare nmax int;
declare prmintNumero INT;
declare prmstrNumero VARCHAR(20);
SET prmintNumero = (SELECT n.Numero FROM NumeroAsiento n WHERE concat(n.Mes,' ', n.Anio) = Periodo LIMIT 1);
SET prmintNumero = prmintNumero + 1;
set i = 1;
set nmax = ExtractValue(xml, 'count(//DetalleAsiento)'); 

CASE length(prmintNumero)
    WHEN 1 THEN SET prmstrNumero = CONCAT('00000',prmintNumero);
    WHEN 2 THEN SET prmstrNumero = CONCAT('0000',prmintNumero);
	WHEN 3 THEN SET prmstrNumero = CONCAT('000',prmintNumero);
	WHEN 4 THEN SET prmstrNumero = CONCAT('00',prmintNumero);
	WHEN 5 THEN SET prmstrNumero = CONCAT('0',prmintNumero);    
	ELSE SET prmstrNumero = prmintNumero;
END CASE;


insert into asiento(Periodo,idSubdiario,Fecha,idSucursal,idMoneda,tipocambio,glosa,numero,usuario,fecharegistro,idingreso )
select Periodo,idSubdiario,Fecha,idSucursal,idMoneda,tipocambio,glosa,prmstrNumero,usuario,curdate(),idingreso ;
SET idAsiento = LAST_INSERT_ID();


UPDATE numeroasiento n 
SET n.Numero = prmintNumero
WHERE concat(n.Mes,' ', n.Anio) = Periodo;


while i <= nmax do
INSERT INTO detalleAsiento(idAsiento
,idCuenta
,idCentroCosto
,CargoMN
,AbonoMN
,CargoME
,AbonoME
,Glosa)
SELECT idAsiento
, ExtractValue(xml, '//DetalleAsiento[$i]/idCuenta')
, ExtractValue(xml, '//DetalleAsiento[$i]/idCentroCosto')
, ExtractValue(xml, '//DetalleAsiento[$i]/CargoMN')
, ExtractValue(xml, '//DetalleAsiento[$i]/AbonoMN')
, ExtractValue(xml, '//DetalleAsiento[$i]/CargoME')
, ExtractValue(xml, '//DetalleAsiento[$i]/AbonoME')
, ExtractValue(xml, '//DetalleAsiento[$i]/Glosa');
SET i=i+1;
end while;


end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `uspInsCentroCosto` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `uspInsCentroCosto`(IN Descripcion VARCHAR(50), IN Codigo VARCHAR(50), Usuario VARCHAR(20))
INSERT INTO CentroCosto(Descripcion,Codigo, Usuario,FechaRegistro)
VALUES(Descripcion,Codigo,Usuario,CURDATE()) ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `uspInsClase` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `uspInsClase`(Descripcion varchar(100), Codigo varchar(50), usuario varchar(20))
insert into clase(Descripcion, Codigo, usuario,fecharegistro)
select Descripcion, Codigo, usuario,curdate() ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `uspInsClienteProveedor` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `uspInsClienteProveedor`(IN RazonSocial VARCHAR(50), IN Ruc VARCHAR(15), IN Dni VARCHAR(12), IN Telefono1 VARCHAR(20), IN Telefono2 VARCHAR(20), IN Correo VARCHAR(50), IN Contacto VARCHAR(50), IN Usuario VARCHAR(20), IN Direccion VARCHAR(50))
    NO SQL
begin
DECLARE error INT DEFAULT 0;
DECLARE specialty CONDITION FOR SQLSTATE '45000';
SET ERROR = (SELECT COUNT(*) FROM ClienteProveedor t WHERE t.RazonSocial = RazonSocial AND activo = 1 LIMIT 1);

IF error = 0 THEN
	INSERT INTO ClienteProveedor(RazonSocial,Ruc,Dni,Telefono1,Telefono2,Correo,Contacto,Usuario,FechaRegistro,Direccion)
	VALUES(RazonSocial,Ruc,Dni,Telefono1,Telefono2,Correo,Contacto,Usuario,CURDATE(),Direccion);
ELSEIF error > 0 THEN
	SIGNAL SQLSTATE '45000'
	SET MESSAGE_TEXT = 'El Cliente o Proveedor ya existe';	
END IF;

end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `uspInsConfiguracion` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `uspInsConfiguracion`(OUT idConfiguracion integer
,idSubdiario integer
,idFamilia integer
,Descripcion text, usuario text,xml varchar(4000))
BEGIN 
declare i int;
declare nmax int;
DECLARE exit handler for sqlexception
BEGIN
	ROLLBACK;
	SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Error inesperado';
END;
  
DECLARE exit handler for sqlwarning
 BEGIN
    -- WARNING
 ROLLBACK;
END;


set i = 1;
set nmax = ExtractValue(xml, 'count(//DetalleConfiguracion)'); 


START TRANSACTION;

insert into Configuracion(idSubdiario
,idFamilia
,Descripcion
,Usuario
,FechaRegistro)
SELECT idSubdiario
,idFamilia
,Descripcion
,usuario
,curdate();
set idConfiguracion = LAST_INSERT_ID();

while i <= nmax do
INSERT INTO detalleConfiguracion(idConfiguracion
,idCuenta
,idCentroCosto
,Cargo)
SELECT idConfiguracion
, ExtractValue(xml, '//DetalleConfiguracion[$i]/idCuenta')
, ExtractValue(xml, '//DetalleConfiguracion[$i]/idCentroCosto')
, cast_to_bit(ExtractValue(xml, '//DetalleConfiguracion[$i]/Cargo'));
SET i=i+1;
end while;


COMMIT;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `uspInsConfiguracionAlmacen` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `uspInsConfiguracionAlmacen`(OUT idConfiguracionAlmacen int,idFamilia int, Descripcion text, idCuentaExistencias int, idCuentaCompras int, idCuentaVariacionExistencias int, idCuentaTransferencia int, idCuentaProducto int, idCuentaVariacionProducto int, usuario text,xml text)
begin 

declare i int;
declare nmax int;
set i = 1;
set nmax = ExtractValue(xml, 'count(//DetalleConfiguracionAlmacen)'); 


insert into ConfiguracionAlmacen(idFamilia
,idCuentaExistencias
,idCuentaCompras
,idCuentaVariacionExistencias
,idCuentaTransferencia
,idCuentaProducto
,idCuentaVariacionProducto
,Descripcion
,Usuario
,FechaRegistro)
SELECT idFamilia
,idCuentaExistencias
,idCuentaCompras
,idCuentaVariacionExistencias
,idCuentaTransferencia
,idCuentaProducto
,idCuentaVariacionProducto
,Descripcion
,usuario
,curdate();
set idConfiguracionAlmacen = LAST_INSERT_ID();

while i <= nmax do
INSERT INTO detalleConfiguracionAlmacen(idConfiguracionAlmacen,idcentrocosto,idcuenta)
SELECT idConfiguracionAlmacen, ExtractValue(xml, '//DetalleConfiguracionAlmacen[$i]/IdCentroCosto'), ExtractValue(xml, '//DetalleConfiguracionAlmacen[$i]/IdCuenta');
SET i=i+1;
end while;

end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `uspInsConfiguracionCuenta` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `uspInsConfiguracionCuenta`(out idConfiguracionCuenta int, idcuenta int, descripcion text, IdTipoConfiguracionCuenta int, ExigeCC bit, IdClase int, IdNaturaleza int, IdMoneda int, IdTipoAuxiliar int, IdAjuste int, IdTipoCambioCuenta int,idcuentacargo  int, IdCuentaabono int, usuario text)
begin
insert into ConfiguracionCuenta(idcuenta, descripcion, IdTipoConfiguracionCuenta, ExigeCC, IdClase, IdNaturaleza, IdMoneda, IdTipoAuxiliar, IdAjuste, IdTipoCambioCuenta, IdCuentaabono, idcuentacargo, usuario, FechaRegistro)
select idcuenta, descripcion, IdTipoConfiguracionCuenta, ExigeCC, IdClase, IdNaturaleza, IdMoneda, IdTipoAuxiliar, IdAjuste, IdTipoCambioCuenta, IdCuentaabono, idcuentacargo, usuario, curdate();
SET idConfiguracionCuenta = LAST_INSERT_ID();
end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `uspInsCotizacion` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `uspInsCotizacion`(IN IdClienteProveedor INT, IN IdModeloChasis INT, IN Fecha VARCHAR(50), IN NumeroChasis INT, IN NumeroAsientos INT, IN NumeroParabrisas INT, IN Ventanas VARCHAR(50), IN TipoCarroceria VARCHAR(50), IN ColorFondo VARCHAR(50), IN ColorArtes VARCHAR(50), IN ColorOtros VARCHAR(50), IN Observaciones VARCHAR(200), IN Usuario VARCHAR(20), IN xml VARCHAR(4000), IN xmlCaracteristicas VARCHAR(4000), OUT UltimoID INT, IN Monto DECIMAL(9,3), idProducto INT, idCentroCosto INT)
begin
declare i int;
declare nmax int;
declare nmaxCaracteristicas int;
declare id int;
declare lastid int;
declare prmintSerie INT;
declare NumSerie VARCHAR(6);
declare mes VARCHAR(5);
set i = 1;
set nmax = ExtractValue(xml, 'count(//CotizacionProducto)'); 
set nmaxCaracteristicas = ExtractValue(xmlCaracteristicas, 'count(//CotizacionCaracteristicas)'); 

set prmintSerie = (SELECT n.Numero FROM NumeroSerie n WHERE n.Documento = 'Cotizacion' and n.Ano = year(curdate()) and n.Mes = month(curdate()) LIMIT 1);
set prmintSerie = prmintSerie + 1;

CASE length(month(curdate()))
    WHEN 1 THEN SET mes = CONCAT('0',month(curdate()));    
	ELSE SET mes = month(curdate());
END CASE;

CASE length(prmintSerie)
    WHEN 1 THEN SET NumSerie = CONCAT('00000',prmintSerie);
    WHEN 2 THEN SET NumSerie = CONCAT('0000',prmintSerie);
	WHEN 3 THEN SET NumSerie = CONCAT('000',prmintSerie);
	WHEN 4 THEN SET NumSerie = CONCAT('00',prmintSerie);
	WHEN 5 THEN SET NumSerie = CONCAT('0',prmintSerie);    
	ELSE SET NumSerie = prmintSerie;
END CASE;


INSERT INTO Cotizacion(IdClienteProveedor, IdModeloChasis, Fecha, NumeroChasis, NumeroAsientos, NumeroParabrisas, Ventanas, TipoCarroceria, ColorFondo, ColorArtes, ColorOtros, Observaciones, Usuario, FechaRegistro, Serie, Monto, idProducto, idCentroCosto)
SELECT IdClienteProveedor, IdModeloChasis, Fecha, NumeroChasis, NumeroAsientos, NumeroParabrisas, Ventanas, TipoCarroceria, ColorFondo, ColorArtes, ColorOtros, Observaciones, Usuario, CURDATE(), concat(year(curdate()),mes,'-',NumSerie), Monto, idProducto, idCentroCosto;

set lastid = LAST_INSERT_ID();
SET UltimoID = LAST_INSERT_ID();

UPDATE NumeroSerie n
SET n.Numero = prmintSerie
WHERE n.Documento = 'Cotizacion' and n.Ano = year(curdate()) and n.Mes = month(curdate());


while i <= nmax do
INSERT INTO CotizacionProducto(idCotizacion,idProducto,Cantidad,Usuario,FechaRegistro,Precio)
SELECT lastid, ExtractValue(xml, '//CotizacionProducto[$i]/idProducto'), ExtractValue(xml, '//CotizacionProducto[$i]/Cantidad'), Usuario, CURDATE(), ExtractValue(xml, '//CotizacionProducto[$i]/Precio');
SET i=i+1;
end while;



set i = 1;
while i <= nmaxCaracteristicas do
INSERT INTO CotizacionCaracteristicas(idCotizacion, idCaracteristicas, Estado, Valor, Usuario, FechaRegistro)
SELECT lastid, ExtractValue(xmlCaracteristicas, '//CotizacionCaracteristicas[$i]/idCaracteristicas'), ExtractValue(xmlCaracteristicas, '//CotizacionCaracteristicas[$i]/Estado'), ExtractValue(xmlCaracteristicas, '//CotizacionCaracteristicas[$i]/Valor'), Usuario,CURDATE();
SET i=i+1;
end while;

end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `uspInsCuenta` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `uspInsCuenta`(IN Descripcion VARCHAR(50), IN Codigo VARCHAR(20), Usuario VARCHAR(20))
INSERT INTO Cuenta(Descripcion,Codigo,Usuario,FechaRegistro)
VALUES(Descripcion,Codigo,Usuario,CURDATE()) ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `uspInsEmpleado` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `uspInsEmpleado`(IN Nombre VARCHAR(50), IN DNI VARCHAR(50), IN Direccion VARCHAR(50), IN Codigo VARCHAR(50), IN Telefono1 VARCHAR(50), IN Telefono2 VARCHAR(50), IN Puesto VARCHAR(50), Usuario VARCHAR(20))
INSERT INTO Empleado(Nombre,DNI,Direccion,Codigo,Telefono1,Telefono2,Puesto,Usuario,FechaRegistro)
VALUES(Nombre,DNI,Direccion,Codigo,Telefono1,Telefono2,Puesto,Usuario,CURDATE()) ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `uspInsEstandar` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `uspInsEstandar`(xml VARCHAR(4000), Usuario VARCHAR(20))
begin
declare i int;
declare nmax int;

set i = 1;
set nmax = ExtractValue(xml, 'count(//Estandar)'); 

UPDATE Estandar e
SET e.Activo = 0
,e.UsuarioModificacion = Usuario
,e.FechaModificacion = CURDATE()
WHERE e.idProductoPrincipal = ExtractValue(xml, '//Estandar[1]/idProductoPrincipal');

while i <= nmax do
INSERT INTO Estandar(idProductoPrincipal,idProducto,Cantidad,Usuario,FechaRegistro)
SELECT ExtractValue(xml, '//Estandar[$i]/idProductoPrincipal'),ExtractValue(xml, '//Estandar[$i]/idProducto'),ExtractValue(xml, '//Estandar[$i]/Cantidad'),Usuario,CURDATE();
SET i=i+1;
end while;


END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `uspInsFactura` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `uspInsFactura`(IN Periodo VARCHAR(50), IN Numero VARCHAR(50), IN IdPuntoVenta INT, IN IdTipoVenta INT, IN IdCotizacion INT, IN IdOrdenProduccion INT, IN IdClienteProveedor INT, IN DCliente VARCHAR(50), IN DocumentoIdentidad VARCHAR(50), IN IdTipoDocumento INT, IN Serie VARCHAR(50), IN NumeroDocumento VARCHAR(50), IN Fecha VARCHAR(50), IN TipoCambio DECIMAL(8,2), IN IdFormaPago INT, IN FechaVencimiento VARCHAR(50), IN IdMoneda INT, IN Glosa VARCHAR(50), IN Igv DECIMAL(8,2), IN DPercepcion DECIMAL(8,2), IN IdPercepcion INT, IN IdServicio INT, IN Referencia VARCHAR(50), IN SerieGuia VARCHAR(50), IN NumeroGuia VARCHAR(50), IN Documento VARCHAR(50), IN Aplicar BIT, IN Importe DECIMAL(8,2), IN CotizacionOP VARCHAR(50), Usuario VARCHAR(20), xml VARCHAR(4000))
begin

declare lastid int;
declare i int;
declare nmax int;

declare prmintNumero INT;
declare prmstrNumero VARCHAR(20);

SET prmintNumero = (SELECT n.Numero FROM Numerofactura n WHERE concat(n.Mes,' ', n.Ano) = Periodo LIMIT 1);
SET prmintNumero = prmintNumero + 1;

set i = 1;
set nmax = ExtractValue(xml, 'count(//DetalleFactura)'); 


CASE length(prmintNumero)
    WHEN 1 THEN SET prmstrNumero = CONCAT('00000',prmintNumero);
    WHEN 2 THEN SET prmstrNumero = CONCAT('0000',prmintNumero);
	WHEN 3 THEN SET prmstrNumero = CONCAT('000',prmintNumero);
	WHEN 4 THEN SET prmstrNumero = CONCAT('00',prmintNumero);
	WHEN 5 THEN SET prmstrNumero = CONCAT('0',prmintNumero);    
	ELSE SET prmstrNumero = prmintNumero;
END CASE;

INSERT INTO Factura(Periodo,Numero,IdPuntoVenta,IdTipoVenta,IdCotizacion,IdOrdenProduccion,IdClienteProveedor,DCliente,DocumentoIdentidad,IdTipoDocumento,Serie,NumeroDocumento,Fecha,TipoCambio,IdFormaPago,FechaVencimiento,IdMoneda,Glosa,Igv,DPercepcion,IdServicio,Referencia,SerieGuia,NumeroGuia,Documento,Aplicar,Importe,CotizacionOP,Usuario,FechaRegistro)
VALUES(Periodo,prmstrNumero,IdPuntoVenta,IdTipoVenta,nullif(IdCotizacion,0),nullif(IdOrdenProduccion,0),IdClienteProveedor,DCliente,DocumentoIdentidad,IdTipoDocumento,Serie,NumeroDocumento,Fecha,TipoCambio,IdFormaPago,FechaVencimiento,IdMoneda,Glosa,Igv,DPercepcion,IdServicio,Referencia,SerieGuia,NumeroGuia,Documento,Aplicar,Importe,CotizacionOP,Usuario,curdate());

UPDATE Numerofactura n 
SET n.Numero = prmintNumero
,n.FechaModificacion = curdate()
,n.UsuarioModificacion = Usuario
WHERE concat(n.Mes,' ', n.Ano) = Periodo;


set lastid = LAST_INSERT_ID();

while i <= nmax do
INSERT INTO detalleFactura(idFactura,idProducto,Cantidad,Precio,SubTotal,Usuario,FechaRegistro)
SELECT lastid, ExtractValue(xml, '//DetalleFactura[$i]/IdProducto') , ExtractValue(xml, '//DetalleFactura[$i]/Cantidad'), ExtractValue(xml, '//DetalleFactura[$i]/Precio'), ExtractValue(xml, '//DetalleFactura[$i]/SubTotal'), Usuario, CURDATE();
SET i=i+1;
end while;


END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `uspInsFamilia` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `uspInsFamilia`(IN Descripcion VARCHAR(50), IN Codigo VARCHAR(5), IN Usuario VARCHAR(20), idCuenta INT)
INSERT INTO Familia(Descripcion,Codigo,Usuario,FechaRegistro,idCuenta)
VALUES(Descripcion,Codigo,Usuario,CURDATE(),idCuenta) ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `uspInsGuia` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `uspInsGuia`(IN Periodo VARCHAR(50), IN Numero VARCHAR(50), IN Fecha VARCHAR(50), IN TipoCambio DECIMAL(8,2), IN Serie VARCHAR(50), IN NumeroDocumento VARCHAR(50), IN IdTipoMovimiento INT, IN Referencia VARCHAR(50), IN IdOrdenProduccion INT, IN IdClienteProveedor INT, IN IdAlmacen INT, IN Observaciones VARCHAR(50), Usuario VARCHAR(20), xml VARCHAR(4000))
begin

declare prmintNumero INT;
declare prmstrNumero VARCHAR(20);

declare lastid int;
declare i int;
declare nmax int;

SET prmintNumero = (SELECT n.Numero FROM numeroguia n WHERE concat(n.DMes,' ', n.Ano) = Periodo LIMIT 1);
SET prmintNumero = prmintNumero + 1;

set i = 1;
set nmax = ExtractValue(xml, 'count(//DetalleGuia)'); 

CASE length(prmintNumero)
    WHEN 1 THEN SET prmstrNumero = CONCAT('00000',prmintNumero);
    WHEN 2 THEN SET prmstrNumero = CONCAT('0000',prmintNumero);
	WHEN 3 THEN SET prmstrNumero = CONCAT('000',prmintNumero);
	WHEN 4 THEN SET prmstrNumero = CONCAT('00',prmintNumero);
	WHEN 5 THEN SET prmstrNumero = CONCAT('0',prmintNumero);    
	ELSE SET prmstrNumero = prmintNumero;
END CASE;


INSERT INTO Guia(Periodo,Numero,Fecha,TipoCambio,Serie,NumeroDocumento,IdTipoMovimiento,Referencia,IdOrdenProduccion,IdClienteProveedor,IdAlmacen,Observaciones,Usuario,FechaRegistro)
VALUES(Periodo,prmstrNumero,Fecha,TipoCambio,Serie,NumeroDocumento,IdTipoMovimiento,Referencia,IdOrdenProduccion,IdClienteProveedor,IdAlmacen,Observaciones,Usuario,curdate());


UPDATE numeroguia n 
SET n.Numero = prmintNumero
,n.FechaModificacion = curdate()
,n.UsuarioModificacion = Usuario
WHERE concat(n.DMes,' ', n.Ano) = Periodo;



set lastid = LAST_INSERT_ID();

while i <= nmax do
INSERT INTO detalleGuia(idGuia,idProducto,Cantidad,Precio,SubTotal,Usuario,FechaRegistro)
SELECT lastid, ExtractValue(xml, '//DetalleGuia[$i]/IdProducto') , ExtractValue(xml, '//DetalleGuia[$i]/Cantidad'), ExtractValue(xml, '//DetalleGuia[$i]/Precio'), ExtractValue(xml, '//DetalleGuia[$i]/SubTotal'), Usuario, CURDATE();
SET i=i+1;
end while;


end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `uspInsIGV` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `uspInsIGV`(IN Valor DECIMAL(6,3), IN Usuario VARCHAR(20))
BEGIN
UPDATE IGV t
SET t.Activo = 0;
INSERT INTO IGV(Valor,FechaRegistro,Usuario)
VALUES(Valor,curdate(),Usuario);
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `uspInsIngreso` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `uspInsIngreso`(OUT idIngreso INT,IN IdAlmacen INT, IN IdTipoMovimiento INT, IN IdOrdenCompra INT, IN IdClienteProveedor INT, IN IdMoneda INT, IN Fecha VARCHAR(50), IN Numero VARCHAR(50), IN TipoCambio DECIMAL(8,2), IN GuiaRemision VARCHAR(50), IN FacturaProveedor VARCHAR(50), IN FechaDocumento VARCHAR(50), IN ProvisionCompra VARCHAR(50), IN TipoCambioMoneda DECIMAL(8,2), IN Monto DECIMAL(8,2), IN Observaciones VARCHAR(50),Usuario VARCHAR(20), xml VARCHAR(4000), idsubdiario int)
BEGIN 
declare i INT;
declare nmax INT;
declare lastid INT;
declare prmintNumero INT;
declare prmstrNumero VARCHAR(20);
declare prmintCantidad INT;
declare prmintidAsiento int;

set i = 1;
set nmax = ExtractValue(xml, 'count(//IngresoProducto)'); 
set prmintNumero = (SELECT n.Numero FROM NumeroMovimiento n WHERE n.Ano = YEAR(CURDATE()) and n.Tipo = 'ingreso' LIMIT 1);
set prmintNumero = prmintNumero + 1;

CASE length(prmintNumero)
    WHEN 1 THEN SET prmstrNumero = CONCAT('00000',prmintNumero);
    WHEN 2 THEN SET prmstrNumero = CONCAT('0000',prmintNumero);
	WHEN 3 THEN SET prmstrNumero = CONCAT('000',prmintNumero);
	WHEN 4 THEN SET prmstrNumero = CONCAT('00',prmintNumero);
	WHEN 5 THEN SET prmstrNumero = CONCAT('0',prmintNumero);    
	ELSE SET prmstrNumero = prmintNumero;
END CASE;


INSERT INTO Ingreso(IdAlmacen,IdTipoMovimiento,IdOrdenCompra,IdClienteProveedor,IdMoneda,Fecha,Numero,TipoCambio,GuiaRemision,FacturaProveedor,FechaDocumento,ProvisionCompra,TipoCambioMoneda,Monto,Observaciones,Usuario,FechaRegistro,idsubdiario)
VALUES(IdAlmacen,IdTipoMovimiento,IdOrdenCompra,IdClienteProveedor,IdMoneda,Fecha,prmstrNumero,TipoCambio,GuiaRemision,FacturaProveedor,FechaDocumento,ProvisionCompra,TipoCambioMoneda,Monto,Observaciones,Usuario,CURDATE(),idsubdiario);
SET lastid = LAST_INSERT_ID();
SET idIngreso = lastid;

UPDATE NumeroMovimiento n
SET n.Numero = prmintNumero
WHERE n.Ano = YEAR(CURDATE()) and n.Tipo = 'ingreso';


-- para el asiento----------------
call uspInsAsiento((select concat(mes, ' ',anio) as periodo from periodo where activo = 1),idSubdiario,Fecha,null,idMoneda,tipocambio,prmstrNumero,'','<root></root>',prmintidAsiento, usuario,lastid,null);


while i <= nmax do
INSERT INTO IngresoProducto(idIngreso,idProducto,idCentroCosto,Cantidad,Precio,Importe,Usuario,FechaRegistro)
SELECT lastid, ExtractValue(xml, '//IngresoProducto[$i]/idProducto'), ExtractValue(xml, '//IngresoProducto[$i]/idCentroCosto'), ExtractValue(xml, '//IngresoProducto[$i]/Cantidad'), ExtractValue(xml, '//IngresoProducto[$i]/Precio'), ExtractValue(xml, '//IngresoProducto[$i]/Importe'),Usuario,CURDATE();

set prmintCantidad = (SELECT s.Cantidad FROM Stock s WHERE s.idAlmacen = idAlmacen and s.idProducto = ExtractValue(xml, '//IngresoProducto[$i]/idProducto'));
set prmintCantidad = prmintCantidad + ExtractValue(xml, '//IngresoProducto[$i]/Cantidad');

UPDATE Stock s
SET s.Cantidad = prmintCantidad
,s.UsuarioModificacion = Usuario
,s.FechaModificacion = CURDATE()
WHERE s.idAlmacen = idAlmacen and s.idProducto = ExtractValue(xml, '//IngresoProducto[$i]/idProducto');


-- detalle asiento---------------
INSERT INTO detalleasiento(idAsiento,idCentroCosto,idCuenta,CargoMN,AbonoMN,CargoME,AbonoME,Glosa)
select prmintidAsiento, dc.idcentrocosto
,dc.idcuenta
,(case dc.cargo when 1 then ExtractValue(xml, '//IngresoProducto[$i]/Importe') else 0 end) as CargoMN 
,(case dc.cargo when 1 then 0 else ExtractValue(xml, '//IngresoProducto[$i]/Importe') end) as AbonoMN
,(case dc.cargo when 1 then ExtractValue(xml, '//IngresoProducto[$i]/Importe')*3.2 else 0 end) as CargoME 
,(case dc.cargo when 1 then 0 else ExtractValue(xml, '//IngresoProducto[$i]/Importe')*3.2 end) as AbonoME
, 'comentario del subdiario' as Glosa
from configuracion c
inner join detalleconfiguracion dc on dc.idconfiguracion = c.idconfiguracion
where dc.activo = 1 and c.idsubdiario = idsubdiario and c.idfamilia = (select p.idfamilia from producto p where p.idproducto = ExtractValue(xml, '//IngresoProducto[$i]/idProducto'))
;


SET i=i+1;
end while;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `uspInsListaPrecio` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `uspInsListaPrecio`(IN IdProducto INT, IN Precio DECIMAL(9,3), IN TipoCambio DECIMAL(6,3), IN Fecha DATETIME, IN Usuario VARCHAR(20))
begin
UPDATE ListaPrecio t
SET t.Estado = 0
,t.UsuarioModificacion = Usuario
,t.FechaModificacion = CURDATE()
WHERE t.idProducto = idProducto;
INSERT INTO ListaPrecio(IdProducto,Precio,TipoCambio,Fecha,Usuario,FechaRegistro)
VALUES(IdProducto,Precio,TipoCambio,Fecha,Usuario,CURDATE());
end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `uspInsNaturaleza` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `uspInsNaturaleza`(Descripcion varchar(100), Codigo varchar(50), usuario varchar(20))
insert into Naturaleza(Descripcion, Codigo, usuario,fecharegistro)
select Descripcion, Codigo, usuario,curdate() ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `uspInsOrdenCompra` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `uspInsOrdenCompra`(idSucursal INT,idFormaPago INT, idMoneda INT,idClienteProveedor INT,Fecha DATETIME,TipoCambio DECIMAL(6,3),FechaEntrega DATETIME,Observaciones VARCHAR(200),IGV DECIMAL(6,3),Subtotal DECIMAL(6,3),Total DECIMAL(9,3),IN Usuario VARCHAR(20), IN xml VARCHAR(4000),OUT idOrdenCompra INT, Afecto BIT)
begin
declare error int;
declare i int;
declare nmax int;
declare id int;
declare lastid int;
declare prmintNumero INT;
declare prmstrNumero VARCHAR(20);

set i = 1;
set nmax = ExtractValue(xml, 'count(//OrdenCompraProducto)'); 
SET prmintNumero = (SELECT n.Numero FROM NumeroOC n WHERE n.Ano = year(curdate()) LIMIT 1);
SET prmintNumero = prmintNumero + 1;

CASE length(prmintNumero)
    WHEN 1 THEN SET prmstrNumero = CONCAT('00000',prmintNumero);
    WHEN 2 THEN SET prmstrNumero = CONCAT('0000',prmintNumero);
	WHEN 3 THEN SET prmstrNumero = CONCAT('000',prmintNumero);
	WHEN 4 THEN SET prmstrNumero = CONCAT('00',prmintNumero);
	WHEN 5 THEN SET prmstrNumero = CONCAT('0',prmintNumero);    
	ELSE SET prmstrNumero = prmintNumero;
END CASE;

INSERT INTO OrdenCompra(idSucursal,idFormaPago,idMoneda,idClienteProveedor,Fecha,TipoCambio,FechaEntrega,Observaciones,IGV,Subtotal,Total,Numero,Usuario, FechaRegistro, Afecto)
SELECT idSucursal,idFormaPago,idMoneda,idClienteProveedor,Fecha,TipoCambio,FechaEntrega,Observaciones,IGV,Subtotal,Total,CONCAT('OC-',prmstrNumero,'/',YEAR(CURDATE())),Usuario, CURDATE(), Afecto;

SET lastid = LAST_INSERT_ID();
SET idOrdenCompra = lastid;


UPDATE NumeroOC n 
SET n.Numero = prmintNumero
WHERE n.Ano = year(curdate());

while i <= nmax do
INSERT INTO OrdenCompraProducto(idOrdenCompra,idProducto,Cantidad,PrecioUnitario,Descuento,Importe,Glosa,Usuario,FechaRegistro)
SELECT lastid, ExtractValue(xml, '//OrdenCompraProducto[$i]/idProducto') ,ExtractValue(xml, '//OrdenCompraProducto[$i]/Cantidad'),ExtractValue(xml, '//OrdenCompraProducto[$i]/PrecioUnitario'), ExtractValue(xml, '//OrdenCompraProducto[$i]/Descuento') ,ExtractValue(xml, '//OrdenCompraProducto[$i]/Importe'),ExtractValue(xml, '//OrdenCompraProducto[$i]/Glosa'),Usuario,CURDATE();
SET i=i+1;
end while;


END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `uspInsOrdenProduccion` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `uspInsOrdenProduccion`(OUT idOrdenProduccion INT,idSucursal INT,idProducto INT,idTipoOrdenProduccion INT,Fecha DATETIME,FechaInicio DATETIME,FechaTermino DATETIME,Observaciones VARCHAR(200),Monto DECIMAL(9,3), Usuario VARCHAR(20),idCentroCosto INT, idClienteProveedor INT)
begin

DECLARE prmstrNumero VARCHAR(20);
DECLARE prmintNumero INT;
DECLARE prmstrCodigo VARCHAR(20);

SET prmintNumero = (SELECT n.Numero FROM NumeroOP n WHERE n.Ano = year(curdate()) and n.idTipoOrdenProduccion = idTipoOrdenProduccion LIMIT 1);
SET prmintNumero = prmintNumero + 1;
SET prmstrCodigo = (SELECT t.Codigo FROM TipoOrdenProduccion t WHERE t.idTipoOrdenProduccion = idTipoOrdenProduccion LIMIT 1);

CASE length(prmintNumero)
    WHEN 1 THEN SET prmstrNumero = CONCAT('00000',prmintNumero);
    WHEN 2 THEN SET prmstrNumero = CONCAT('0000',prmintNumero);
	WHEN 3 THEN SET prmstrNumero = CONCAT('000',prmintNumero);
	WHEN 4 THEN SET prmstrNumero = CONCAT('00',prmintNumero);
	WHEN 5 THEN SET prmstrNumero = CONCAT('0',prmintNumero);    
	ELSE SET prmstrNumero = prmintNumero;
END CASE;

INSERT INTO OrdenProduccion(idSucursal,idProducto,idTipoOrdenProduccion,Fecha,FechaInicio,FechaTermino,Observaciones,Monto,Numero,Usuario,FechaRegistro,idCentroCosto,idClienteProveedor)
SELECT idSucursal,idProducto,idTipoOrdenProduccion,Fecha,FechaInicio,FechaTermino,Observaciones,Monto,concat(prmstrCodigo,'-',prmstrNumero,'/',YEAR(CURDATE())),Usuario,CURDATE(),idCentroCosto,idClienteProveedor;

SET idOrdenProduccion = LAST_INSERT_ID();

UPDATE NumeroOP n
SET n.Numero = prmintNumero
WHERE n.Ano = year(curdate()) and n.idTipoOrdenProduccion = idTipoOrdenProduccion ;



end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `uspInsOrdenServicio` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `uspInsOrdenServicio`(OUT idOrdenServicio INT,idCentroCosto INT,idFormaPago INT,idMoneda INT,idClienteProveedor INT,Fecha DATETIME,TipoCambio DECIMAL(6,3),FechaEntrega DATETIME,Observaciones VARCHAR(200),IGV DECIMAL(6,3),Subtotal DECIMAL(6,3),Monto DECIMAL(6,3),Numero VARCHAR(20),Usuario VARCHAR(20),xml VARCHAR(4000), idSucursal INT, Afecto BIT)
begin
declare error int;
declare i int;
declare nmax int;
declare id int;
declare lastid int;
declare prmintNumero INT;
declare prmstrNumero VARCHAR(20);

set i = 1;
set nmax = ExtractValue(xml, 'count(//OrdenServicioProducto)'); 
SET prmintNumero = (SELECT n.Numero FROM NumeroOS n WHERE n.Ano = year(curdate()) LIMIT 1);
SET prmintNumero = prmintNumero + 1;

CASE length(prmintNumero)
    WHEN 1 THEN SET prmstrNumero = CONCAT('00000',prmintNumero);
    WHEN 2 THEN SET prmstrNumero = CONCAT('0000',prmintNumero);
	WHEN 3 THEN SET prmstrNumero = CONCAT('000',prmintNumero);
	WHEN 4 THEN SET prmstrNumero = CONCAT('00',prmintNumero);
	WHEN 5 THEN SET prmstrNumero = CONCAT('0',prmintNumero);    
	ELSE SET prmstrNumero = prmintNumero;
END CASE;

INSERT INTO OrdenServicio(idOrdenServicio,idCentroCosto,idFormaPago,idMoneda,idClienteProveedor,Fecha,TipoCambio,FechaEntrega,Observaciones,IGV,Subtotal,Monto,Numero,Usuario, FechaRegistro, idSucursal,Afecto)
SELECT idOrdenServicio,idCentroCosto,idFormaPago,idMoneda,idClienteProveedor,Fecha,TipoCambio,FechaEntrega,Observaciones,IGV,Subtotal,Monto,CONCAT('OS-',prmstrNumero,'/',YEAR(CURDATE())),Usuario, CURDATE(), idSucursal, Afecto;

SET lastid = LAST_INSERT_ID();
SET idOrdenServicio = lastid;

UPDATE NumeroOS n 
SET n.Numero = prmintNumero
WHERE n.Ano = year(curdate());

while i <= nmax do
INSERT INTO OrdenServicioProducto(idOrdenServicio,idProducto,idOrdenProduccion,Cantidad,PrecioUnitario,Descuento,Importe,Glosa,Usuario,FechaRegistro)
SELECT lastid, ExtractValue(xml, '//OrdenServicioProducto[$i]/idProducto'), ExtractValue(xml, '//OrdenServicioProducto[$i]/idOrdenProduccion'), ExtractValue(xml, '//OrdenServicioProducto[$i]/Cantidad'), ExtractValue(xml, '//OrdenServicioProducto[$i]/PrecioUnitario'), ExtractValue(xml, '//OrdenServicioProducto[$i]/Descuento'), ExtractValue(xml, '//OrdenServicioProducto[$i]/Importe'), ExtractValue(xml, '//OrdenServicioProducto[$i]/Glosa'),Usuario,CURDATE();
SET i=i+1;
end while;


END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `uspInsPedido` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `uspInsPedido`(OUT idPedido INT,idCentroCosto INT,idOrdenProduccion INT ,idEmpleado INT ,Estado VARCHAR(20),Numero VARCHAR(20),Fecha DATETIME, Usuario VARCHAR(20), xml VARCHAR(4000), Observaciones VARCHAR(200))
BEGIN
declare i int;
declare nmax int;
declare lastid int;
declare prmintNumero INT;
declare prmstrNumero VARCHAR(20);

set i = 1;
set nmax = ExtractValue(xml, 'count(//PedidoProducto)'); 
set prmintNumero = (SELECT n.Numero FROM NumeroPE n WHERE n.Ano = year(curdate()) LIMIT 1);
set prmintNumero = prmintNumero + 1;

CASE length(prmintNumero)
    WHEN 1 THEN SET prmstrNumero = CONCAT('00000',prmintNumero);
    WHEN 2 THEN SET prmstrNumero = CONCAT('0000',prmintNumero);
	WHEN 3 THEN SET prmstrNumero = CONCAT('000',prmintNumero);
	WHEN 4 THEN SET prmstrNumero = CONCAT('00',prmintNumero);
	WHEN 5 THEN SET prmstrNumero = CONCAT('0',prmintNumero);    
	ELSE SET prmstrNumero = prmintNumero;
END CASE;


INSERT INTO Pedido(idCentroCosto,idOrdenProduccion,idEmpleado,Numero,Fecha,Usuario,FechaRegistro, Observaciones)
SELECT idCentroCosto,idOrdenProduccion,case idEmpleado when 0 then null else idEmpleado end,CONCAT('PE-',prmstrNumero,'/',year(curdate())),Fecha,Usuario,CURDATE(), Observaciones;

SET lastid = LAST_INSERT_ID();
SET idPedido = lastid;

UPDATE NumeroPE n
SET Numero = prmintNumero
WHERE n.Ano = year(curdate());

while i <= nmax do
INSERT INTO PedidoProducto(idPedido,idProducto,Cantidad,Glosa,Usuario,FechaRegistro)
SELECT lastid, ExtractValue(xml, '//PedidoProducto[$i]/idProducto'), ExtractValue(xml, '//PedidoProducto[$i]/Cantidad'), ExtractValue(xml, '//PedidoProducto[$i]/Glosa'),Usuario,CURDATE();
SET i=i+1;
end while;


END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `uspInsPercepcion` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `uspInsPercepcion`(IN Descripcion VARCHAR(50), IN Valor DECIMAL(4,2), Usuario VARCHAR(20))
INSERT INTO Percepcion(Descripcion,Valor,FechaRegistro,Usuario)
VALUES(Descripcion,Valor,curdate(),Usuario) ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `uspInsPeriodo` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `uspInsPeriodo`(IN Anio INT, IN Mes VARCHAR(50), Usuario VARCHAR(20))
begin
INSERT INTO Periodo(Anio,Mes,FechaRegistro,Usuario)
VALUES(Anio,Mes,curdate(),Usuario);
end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `uspInsPermiso` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `uspInsPermiso`(xml VARCHAR(500))
begin
declare i int;
declare nmax int;
declare id int;
set i = 1;
set nmax = ExtractValue(xml, 'count(//Permiso)'); 

CREATE TEMPORARY TABLE tabla
(
idUsuario INT,
idOpcion INT,
usuario VARCHAR(20),
Fecha DATETIME
) ;

while i <= nmax do
INSERT INTO tabla(idUsuario, idOpcion, Usuario, Fecha)
SELECT ExtractValue(xml, '//Permiso[$i]/idUsuario') AS idUsuario ,ExtractValue(xml, '//Permiso[$i]/idOpcion') AS idOpcion,ExtractValue(xml, '//Permiso[$i]/Usuario') as Usuario,CURDATE() as Fecha;
SET i=i+1;
end while;

INSERT INTO Permiso(idUsuario,idOpcion,Usuario,FechaRegistro)
SELECT t.idUsuario, t.idOpcion, t.Usuario, t.Fecha FROM tabla t
LEFT JOIN Permiso p on p.idOpcion = t.idOpcion and p.idUsuario = t.idUsuario and p.Activo = 1
WHERE p.idPermiso is null;

SET id = (SELECT idUsuario FROM tabla LIMIT 1);
UPDATE Permiso p
LEFT JOIN tabla t on p.idOpcion = t.idOpcion 
SET p.Activo = 0,
p.UsuarioModificacion = t.Usuario,
p.FechaModificacion = t.Fecha
WHERE p.idUsuario = id and t.idUsuario is null;

DROP TABLE tabla;
end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `uspInsProducto` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `uspInsProducto`(IN idTipoProducto INT, IN Descripcion VARCHAR(50), IN Codigo VARCHAR(3), IN UmCompra DECIMAL(9,3), IN UmConsumo DECIMAL(9,3), IN idUnidadMedidaCompra INT, IN idUnidadMedidaConsumo INT, IN Conversion DECIMAL(9,3), IN Usuario VARCHAR(20), IN idFamilia INT)
begin
DECLARE cod VARCHAR(10);
DECLARE i INT;
SET i = (SELECT COUNT(*) FROM producto p WHERE p.idFamilia = idFamilia LIMIT 1) + 1;
SET cod = (SELECT f.Codigo FROM Familia f where f.idFamilia = idFamilia LIMIT 1);

CASE length(i)
    WHEN 1 THEN SET cod = CONCAT(cod,'000',i);
    WHEN 2 THEN SET cod = CONCAT(cod,'00',i);
	WHEN 3 THEN SET cod = CONCAT(cod,'0',i);	
	ELSE SET cod = CONCAT(cod,i);	
END CASE;

INSERT INTO Producto(idTipoProducto, Descripcion, Codigo, UmCompra, UmConsumo, idUnidadMedidaCompra, idUnidadMedidaConsumo, Conversion, Usuario, FechaRegistro, Contador, idFamilia)
SELECT idTipoProducto, Descripcion, cod, UmCompra, UmConsumo, idUnidadMedidaCompra, idUnidadMedidaConsumo, Conversion, Usuario, CURDATE(), i, idFamilia;
end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `uspInsProvision` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `uspInsProvision`(Periodo VARCHAR(15), Fecha DATETIME, idOrdenCompra INT, idOrdenServicio INT, ServicioCompra VARCHAR(20), idSucursal INT, idTipoCompra INT, Codigo VARCHAR(20), RazonSocial VARCHAR(100), Ruc VARCHAR(15), Glosa VARCHAR(100), TipoDocumento VARCHAR(5), Serie VARCHAR(20), NumeroDocumento VARCHAR(15), FechaDocumento DATETIME, idFormaPago INT, FechaVencimiento DATETIME, idMoneda INT, TipoCambio DECIMAL(4,2), TipoAdquisicion DECIMAL(4,2), Igv DECIMAL(4,2), Percepcion DECIMAL(4,2), Renta DECIMAL(4,2), Aporte DECIMAL(4,2), Tasa DECIMAL(4,2), Importe DECIMAL(8,2), BaseAfecta DECIMAL(8,2), Inafecto DECIMAL(8,2), IgvDocumento DECIMAL(8,2), PercepcionAfecta DECIMAL(8,2), RentaAfecta DECIMAL(8,2), AportePension DECIMAL(8,2), Total DECIMAL(8,2), usuario VARCHAR(20), xml VARCHAR(4000))
BEGIN

declare lastid int;
declare i int;
declare nmax int;
declare prmintNumero INT;
declare prmstrNumero VARCHAR(20);

SET prmintNumero = (SELECT n.Numero FROM NumeroProvision n WHERE concat(n.Mes,' ', n.Ano) = Periodo LIMIT 1);
SET prmintNumero = prmintNumero + 1;
set i = 1;
set nmax = ExtractValue(xml, 'count(//DetalleProvision)'); 

CASE length(prmintNumero)
    WHEN 1 THEN SET prmstrNumero = CONCAT('00000',prmintNumero);
    WHEN 2 THEN SET prmstrNumero = CONCAT('0000',prmintNumero);
	WHEN 3 THEN SET prmstrNumero = CONCAT('000',prmintNumero);
	WHEN 4 THEN SET prmstrNumero = CONCAT('00',prmintNumero);
	WHEN 5 THEN SET prmstrNumero = CONCAT('0',prmintNumero);    
	ELSE SET prmstrNumero = prmintNumero;
END CASE;

INSERT INTO Provision(Numero,Periodo,Fecha,idOrdenCompra,idOrdenServicio,ServicioCompra,idSucursal,idTipoCompra,Codigo,RazonSocial,Ruc,Glosa,TipoDocumento,Serie,NumeroDocumento,FechaDocumento,idFormaPago,FechaVencimiento,idMoneda,TipoCambio,TipoAdquisicion,Igv,Percepcion,Renta,Aporte,Tasa,Importe,BaseAfecta,Inafecto,IgvDocumento,PercepcionAfecta,RentaAfecta,AportePension,Total,FechaRegistro,Usuario)
VALUES(prmstrNumero,Periodo,Fecha,nullif(idOrdenCompra,0),nullif(idOrdenServicio,0),ServicioCompra,idSucursal,idTipoCompra,Codigo,RazonSocial,Ruc,Glosa,TipoDocumento,Serie,NumeroDocumento,FechaDocumento,idFormaPago,FechaVencimiento,idMoneda,TipoCambio,TipoAdquisicion,Igv,Percepcion,Renta,Aporte,Tasa,Importe,BaseAfecta,Inafecto,IgvDocumento,PercepcionAfecta,RentaAfecta,AportePension,Total,curdate(),Usuario);

UPDATE NumeroProvision n 
SET n.Numero = prmintNumero
,n.FechaModificacion = curdate()
,n.UsuarioModificacion = Usuario
WHERE concat(n.Mes,' ', n.Ano) = Periodo;

set lastid = LAST_INSERT_ID();

while i <= nmax do
INSERT INTO detalleprovision(idProvision,idIngreso,idCuenta,idCentroCosto,Importe,Usuario,FechaRegistro,idOrdenProduccion,Descripcion)
SELECT lastid, nullif(ExtractValue(xml, '//DetalleProvision[$i]/IdIngreso'),0) , ExtractValue(xml, '//DetalleProvision[$i]/IdCuenta'), ExtractValue(xml, '//DetalleProvision[$i]/IdCentroCosto'), ExtractValue(xml, '//DetalleProvision[$i]/Importe'), Usuario, CURDATE(), ExtractValue(xml, '//DetalleProvision[$i]/idOrdenProduccion'), ExtractValue(xml, '//DetalleProvision[$i]/Descripcion');
SET i=i+1;
end while;

describe detalleprovision;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `uspInsPuntoVenta` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `uspInsPuntoVenta`(IN Descripcion VARCHAR(50), IN Codigo VARCHAR(20), Usuario VARCHAR(20))
INSERT INTO PuntoVenta(Descripcion,Codigo,Usuario,FechaRegistro)
VALUES(Descripcion,Codigo,Usuario,CURDATE()) ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `uspInsRenta` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `uspInsRenta`(IN Descripcion VARCHAR(50), Valor decimal(4,2), Usuario VARCHAR(20))
INSERT INTO Renta(Descripcion,FechaRegistro,Valor,Usuario)
VALUES(Descripcion,curdate(),Valor,Usuario) ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `uspInsSalida` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `uspInsSalida`(OUT idSalida INT,idAlmacen INT,idTipoMovimiento INT,idPedido INT,idEmpleado INT,idMoneda INT,Fecha DATETIME,Numero VARCHAR(20),TipoCambio DECIMAL(6,3),Observaciones VARCHAR(200),TipoCambioMoneda DECIMAL(6,3),Usuario VARCHAR(20), xml VARCHAR(4000), idsubdiario int)
BEGIN 
declare i INT;
declare nmax INT;
declare lastid INT;
declare prmintNumero INT;
declare prmstrNumero VARCHAR(20);
declare prmintCantidad INT;
declare prmintidAsiento int;

set i = 1;
set nmax = ExtractValue(xml, 'count(//SalidaProducto)'); 
set prmintNumero = (SELECT n.Numero FROM NumeroMovimiento n WHERE n.Ano = YEAR(CURDATE()) and n.Tipo = 'salida' LIMIT 1);
set prmintNumero = prmintNumero + 1;

CASE length(prmintNumero)
    WHEN 1 THEN SET prmstrNumero = CONCAT('00000',prmintNumero);
    WHEN 2 THEN SET prmstrNumero = CONCAT('0000',prmintNumero);
	WHEN 3 THEN SET prmstrNumero = CONCAT('000',prmintNumero);
	WHEN 4 THEN SET prmstrNumero = CONCAT('00',prmintNumero);
	WHEN 5 THEN SET prmstrNumero = CONCAT('0',prmintNumero);    
	ELSE SET prmstrNumero = prmintNumero;
END CASE;


INSERT INTO Salida(idAlmacen,idTipoMovimiento,idPedido,idEmpleado,Fecha,Numero,Observaciones,Usuario,FechaRegistro,idsubdiario)
VALUES(idAlmacen,idTipoMovimiento,idPedido,idEmpleado,Fecha,prmstrNumero,Observaciones,Usuario,CURDATE(),idsubdiario);
SET lastid = LAST_INSERT_ID();
SET idSalida = lastid;

UPDATE NumeroMovimiento n
SET n.Numero = prmintNumero
WHERE n.Ano = YEAR(CURDATE()) and n.Tipo = 'salida';



-- para el asiento----------------
call uspInsAsiento((select concat(mes, ' ',anio) as periodo from periodo where activo = 1),idSubdiario,Fecha,null,null,null,prmstrNumero,'','<root></root>',prmintidAsiento, usuario,null,lastid);
update asiento a
set a.idsalida = lastid
where a.idasiento = prmintidAsiento;



while i <= nmax do						
INSERT INTO SalidaProducto(idSalida,idProducto,idCentroCosto,Cantidad,Precio,Importe,Usuario,FechaRegistro,Estandar)
SELECT lastid, ExtractValue(xml, '//SalidaProducto[$i]/idProducto'), ExtractValue(xml, '//SalidaProducto[$i]/idCentroCosto'), ExtractValue(xml, '//SalidaProducto[$i]/Cantidad'), ExtractValue(xml, '//SalidaProducto[$i]/Precio'), ExtractValue(xml, '//SalidaProducto[$i]/Importe'),Usuario,CURDATE(), ExtractValue(xml, '//SalidaProducto[$i]/Estandar');

set prmintCantidad = (SELECT s.Cantidad FROM Stock s WHERE s.idAlmacen = idAlmacen and s.idProducto = ExtractValue(xml, '//SalidaProducto[$i]/idProducto'));
set prmintCantidad = prmintCantidad - ExtractValue(xml, '//SalidaProducto[$i]/Cantidad');

UPDATE Stock s
SET s.Cantidad = prmintCantidad
,s.UsuarioModificacion = Usuario
,s.FechaModificacion = CURDATE()
WHERE s.idAlmacen = idAlmacen and s.idProducto = ExtractValue(xml, '//SalidaProducto[$i]/idProducto');


-- detalle asiento---------------
INSERT INTO detalleasiento(idAsiento,idCentroCosto,idCuenta,CargoMN,AbonoMN,CargoME,AbonoME,Glosa)
select prmintidAsiento, dc.idcentrocosto
,dc.idcuenta
,(case dc.cargo when 1 then ExtractValue(xml, '//SalidaProducto[$i]/Importe') else 0 end) as CargoMN 
,(case dc.cargo when 1 then 0 else ExtractValue(xml, '//SalidaProducto[$i]/Importe') end) as AbonoMN
,(case dc.cargo when 1 then ExtractValue(xml, '//SalidaProducto[$i]/Importe')*3.2 else 0 end) as CargoME 
,(case dc.cargo when 1 then 0 else ExtractValue(xml, '//SalidaProducto[$i]/Importe')*3.2 end) as AbonoME
, 'comentario del subdiario' as Glosa
from configuracion c
inner join detalleconfiguracion dc on dc.idconfiguracion = c.idconfiguracion
where dc.activo = 1 and c.idsubdiario = idsubdiario and c.idfamilia = (select p.idfamilia from producto p where p.idproducto = ExtractValue(xml, '//SalidaProducto[$i]/idProducto'))
;


SET i=i+1;
end while;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `uspInsServicio` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `uspInsServicio`(IN Descripcion VARCHAR(50), IN Codigo VARCHAR(50),Usuario VARCHAR(20))
INSERT INTO Servicio(Descripcion,Codigo,usuario,fecharegistro)
VALUES(Descripcion,Codigo,Usuario,curdate()) ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `uspInsSubdiario` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `uspInsSubdiario`(IN Descripcion VARCHAR(50), IN Codigo VARCHAR(50), IN Usuario VARCHAR(20))
INSERT INTO Subdiario(Descripcion,Codigo,Usuario,FechaRegistro)
VALUES(Descripcion,Codigo,Usuario,CURDATE()) ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `uspInsSucursal` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `uspInsSucursal`(IN Descripcion VARCHAR(50), IN Direccion VARCHAR(80), IN Usuario VARCHAR(20))
INSERT INTO Sucursal(Descripcion,Direccion,Usuario,FechaRegistro)
VALUES(Descripcion,Direccion,Usuario,CURDATE()) ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `uspInsTareo` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `uspInsTareo`(out idtareo int,periodo text,numero text,fecha datetime,tipocambio decimal(4,2),idsucursal int,idempleado int,observaciones text,totalhoras decimal(4,2),usuario text,xml text)
begin

declare lastid int;
declare i int;
declare nmax int;

declare prmintNumero INT;
declare prmstrNumero VARCHAR(20);

SET prmintNumero = (SELECT n.Numero FROM Numerotareo n WHERE concat(n.Mes,' ', n.Anio) = Periodo LIMIT 1);
SET prmintNumero = prmintNumero + 1;

set i = 1;
set nmax = ExtractValue(xml, 'count(//DetalleTareo)'); 


CASE length(prmintNumero)
    WHEN 1 THEN SET prmstrNumero = CONCAT('00000',prmintNumero);
    WHEN 2 THEN SET prmstrNumero = CONCAT('0000',prmintNumero);
	WHEN 3 THEN SET prmstrNumero = CONCAT('000',prmintNumero);
	WHEN 4 THEN SET prmstrNumero = CONCAT('00',prmintNumero);
	WHEN 5 THEN SET prmstrNumero = CONCAT('0',prmintNumero);    
	ELSE SET prmstrNumero = prmintNumero;
END CASE;

insert into tareo(periodo,numero,fecha ,tipocambio ,idsucursal ,idempleado ,observaciones ,totalhoras ,usuario, fecharegistro)
select periodo,prmstrNumero,fecha ,tipocambio ,idsucursal ,idempleado ,observaciones ,totalhoras ,usuario, curdate();

UPDATE Numerotareo n 
SET n.Numero = prmintNumero
WHERE concat(n.Mes,' ', n.Anio) = Periodo;


set idtareo = LAST_INSERT_ID();
set lastid = idtareo;

while i <= nmax do
INSERT INTO detalletareo(idTareo
,idEmpleado
,idOrdenProduccion
,idActividad
,idCentroCosto
,Descripcion
,HoraInicio
,HoraFin
,Horas
,Usuario,FechaRegistro)
SELECT lastid
, ExtractValue(xml, '//DetalleTareo[$i]/idEmpleado') 
, ExtractValue(xml, '//DetalleTareo[$i]/idOrdenProduccion')
, ExtractValue(xml, '//DetalleTareo[$i]/idActividad')
, ExtractValue(xml, '//DetalleTareo[$i]/idCentroCosto')
, ExtractValue(xml, '//DetalleTareo[$i]/Descripcion') 
, ExtractValue(xml, '//DetalleTareo[$i]/HoraInicio')
, ExtractValue(xml, '//DetalleTareo[$i]/HoraFin')
, ExtractValue(xml, '//DetalleTareo[$i]/Horas')
, Usuario, CURDATE();
SET i=i+1;
end while;


END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `uspInsTasa` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `uspInsTasa`(IN Descripcion VARCHAR(50), IN Valor DECIMAL(4,2), Usuario VARCHAR(20))
INSERT INTO Tasa(Descripcion,Valor,FechaRegistro,Usuario)
VALUES(Descripcion,Valor,curdate(),Usuario) ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `uspInsTipoAdquisicion` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `uspInsTipoAdquisicion`(IN Descripcion VARCHAR(50), Valor DECIMAL(4,2), Usuario VARCHAR(20))
INSERT INTO TipoAdquisicion(Descripcion,FechaRegistro,Usuario,Valor)
VALUES(Descripcion,curdate(),Usuario,Valor) ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `uspInstipoauxiliar` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `uspInstipoauxiliar`(Descripcion varchar(100), Codigo varchar(50), usuario varchar(20))
insert into tipoauxiliar(Descripcion, Codigo, usuario,fecharegistro)
select Descripcion, Codigo, usuario,curdate() ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `uspInsTipoCambio` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `uspInsTipoCambio`(idMonedaCobra INT, idMonedaPago int, Valor decimal(6,3), Fecha datetime,Usuario varchar(20))
begin

Update tipocambio t
set t.activo = 0
,t.usuariomodificacion = Usuario
,t.fechamodificacion = curdate()
where t.idmonedacobra = idmonedacobra and t.idmonedapago = idmonedapago and t.fecha = fecha;

insert into tipocambio(idMonedaCobra,idMonedaPago,Valor,Fecha,Usuario,FechaRegistro)
select idMonedaCobra,idMonedaPago,Valor,Fecha,Usuario,curdate();
end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `uspInstipocambiocuenta` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `uspInstipocambiocuenta`(Descripcion varchar(100), Codigo varchar(50), usuario varchar(20))
insert into tipocambiocuenta(Descripcion, Codigo, usuario,fecharegistro)
select Descripcion, Codigo, usuario,curdate() ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `uspInsTipoCompra` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `uspInsTipoCompra`(IN Descripcion VARCHAR(50), IN Codigo VARCHAR(50), Usuario VARCHAR(20))
INSERT INTO TipoCompra(Descripcion,Codigo, FechaRegistro,Usuario)
VALUES(Descripcion,Codigo,CURDATE(),Usuario) ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `uspInstipoconfiguracioncuenta` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `uspInstipoconfiguracioncuenta`(Descripcion varchar(100), Codigo varchar(50), usuario varchar(20))
insert into tipoconfiguracioncuenta(Descripcion, Codigo, usuario,fecharegistro)
select Descripcion, Codigo, usuario,curdate() ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `uspInsTipoDocumento` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `uspInsTipoDocumento`(IN Descripcion VARCHAR(50), IN Codigo VARCHAR(50), Usuario VARCHAR(20))
INSERT INTO TipoDocumento(Descripcion,Codigo,Usuario,FechaRegistro)
VALUES(Descripcion,Codigo,Usuario,curdate()) ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `uspInsTipoMovimiento` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `uspInsTipoMovimiento`(IN Descripcion VARCHAR(50), IN Codigo VARCHAR(50), IN Usuario VARCHAR(20))
INSERT INTO TipoMovimiento(Descripcion,Codigo,Usuario,FechaRegistro)
VALUES(Descripcion,Codigo,Usuario,CURDATE()) ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `uspInsTipoProducto` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `uspInsTipoProducto`(IN Descripcion VARCHAR(50), IN Codigo VARCHAR(50), IN Usuario VARCHAR(20))
INSERT INTO TipoProducto(Descripcion,Codigo,Usuario,FechaRegistro)
VALUES(Descripcion,Codigo,Usuario,CURDATE()) ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `uspInsTipoVenta` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `uspInsTipoVenta`(IN Descripcion VARCHAR(50), IN Codigo VARCHAR(50), Usuario VARCHAR(20))
INSERT INTO TipoVenta(Descripcion,Codigo,Usuario,FechaRegistro)
VALUES(Descripcion,Codigo,Usuario,curdate()) ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `uspInsUsuario` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `uspInsUsuario`(IN Nick VARCHAR(20), IN Password VARCHAR(12), IN Nombre VARCHAR(50), IN Email VARCHAR(50))
    NO SQL
begin
DECLARE error INT DEFAULT 0;
DECLARE specialty CONDITION FOR SQLSTATE '45000';
SET ERROR = (SELECT COUNT(*) FROM Usuario t WHERE t.Nick = Nick AND activo = 1 LIMIT 1);

IF error = 0 THEN
	INSERT INTO Usuario(Nick,Password,Nombre,Email)
	VALUES(Nick,Password,Nombre,Email);
ELSEIF error > 0 THEN
	SIGNAL SQLSTATE '45000'
	SET MESSAGE_TEXT = 'El usuario ya existe';	
END IF;

end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `uspListactividad` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `uspListactividad`(descripcion varchar(100))
select c.idactividad,c.Descripcion, c.Codigo
from actividad c
where c.descripcion like concat('%',descripcion,'%') and c.activo = 1 ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `uspListajuste` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `uspListajuste`(descripcion varchar(100))
select c.idajuste,c.Descripcion, c.Codigo
from ajuste c
where c.descripcion like concat('%',descripcion,'%') and c.activo = 1 ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `uspListAlmacen` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `uspListAlmacen`(IN Descripcion VARCHAR(50))
SELECT a.idAlmacen, a.idSucursal, s.Descripcion as DSucursal, a.Descripcion, a.Codigo
FROM Almacen a
INNER JOIN Sucursal s on s.idSucursal = a.idSucursal
WHERE a.Activo = 1 and a.Descripcion like CONCAT('%',Descripcion,'%') ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `uspListAporte` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `uspListAporte`(Descripcion VARCHAR(50))
SELECT t.idAporte, t.Descripcion, t.Valor FROM Aporte t
WHERE t.Descripcion like concat('%',Descripcion,'%') and t.Activo = 1
LIMIT 100 ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `uspListAsiento` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `uspListAsiento`(numero varchar(20))
Select a.numero, a.periodo, a.idasiento, a.idsubdiario, sub.descripcion as DSubdiario, sub.codigo as CODSubdiario, a.Fecha
,suc.Descripcion as DSucursal, a.idsucursal, a.idmoneda, m.Descripcion as DMoneda, a.tipocambio, a.glosa
from asiento a
inner join Subdiario sub on sub.idsubdiario = a.idsubdiario
left join Sucursal suc on suc.idsucursal = a.idsucursal
left join Moneda m on m.idmoneda = a.idmoneda
where a.Activo = 1 and a.numero like concat('%',numero,'%') ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `uspListCaracteristicaCotizacion` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `uspListCaracteristicaCotizacion`()
SELECT c.idTipoCaracteristica, tc.Descripcion as DTipoCaracteristica, c.idCaracteristicas, c.Descripcion as DCaracteristicas  
FROM Caracteristicas c
INNER JOIN TipoCaracteristica tc on tc.idTipoCaracteristica = c.idTipoCaracteristica
WHERE c.Documento = 'Cotizacion' and tc.Activo = 1 and c.Activo = 1 ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `uspListCentroCosto` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `uspListCentroCosto`(IN Descripcion VARCHAR(50), Codigo VARCHAR(20))
SELECT c.idCentroCosto, c.Descripcion, c.Codigo FROM CentroCosto c
WHERE c.Descripcion like CONCAT('%',Descripcion,'%') and c.Activo = 1 and c.Codigo like CONCAT('%',Codigo,'%') ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `uspListClase` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `uspListClase`(descripcion varchar(100))
select c.idclase,c.Descripcion, c.Codigo
from clase c
where c.descripcion like concat('%',descripcion,'%') and c.activo = 1 ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `uspListClienteProveedor` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `uspListClienteProveedor`(IN RazonSocial VARCHAR(50), IN Ruc VARCHAR(15))
SELECT c.IdClienteProveedor,c.RazonSocial,c.Ruc,c.Dni,c.Telefono1,c.Telefono2,c.Correo,c.Contacto,c.Direccion
FROM ClienteProveedor c
WHERE c.RazonSocial LIKE CONCAT('%',RazonSocial,'%') AND (c.Ruc = Ruc OR Ruc = '') AND c.Activo = 1 ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `uspListConfiguracion` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `uspListConfiguracion`(descripcion text)
SELECT t.idConfiguracion
,t.idSubdiario
,s.Descripcion as dsubdiario
,s.Codigo as codsubdiario
,t.idFamilia
,f.Descripcion as dfamilia
,f.Codigo as codfamilia
,t.Descripcion
FROM Configuracion t
left JOIN Subdiario s on s.idSubdiario = t.idSubdiario
left JOIN Familia f on f.idFamilia = t.idFamilia
where t.descripcion like concat('%',descripcion,'%') ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `uspListConfiguracionAlmacen` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `uspListConfiguracionAlmacen`(descripcion text)
SELECT t.idconfiguracionalmacen
,t.idFamilia
,t.idCuentaExistencias
,t.idCuentaCompras
,t.idCuentaVariacionExistencias
,t.idCuentaTransferencia
,t.idCuentaProducto
,t.idCuentaVariacionProducto
,t.Descripcion
,f.Descripcion as dfamilia
,f.Codigo as codfamilia
,c1.descripcion as dCuentaExistencias
,c1.codigo as codCuentaExistencias
,c2.Descripcion as dCuentaCompras
,c2.Codigo as codCuentaCompras
,c3.Descripcion as dCuentaVariacionExistencias
,c3.Codigo as codCuentaVariacionExistencias
,c4.Descripcion as dCuentaTransferencia
,c4.Codigo as codCuentaTransferencia
,c5.Descripcion as dCuentaProducto
,c5.Codigo as codCuentaProducto
,c6.Descripcion as dCuentaVariacionProducto
,c6.Codigo as codCuentaVariacionProducto
FROM ConfiguracionAlmacen t
left JOIN familia f on f.idfamilia = t.idfamilia
left JOIN Cuenta c1 on c1.idCuenta = t.idCuentaExistencias
left JOIN Cuenta c2 on c2.idCuenta = t.idCuentaCompras
left JOIN Cuenta c3 on c3.idCuenta = t.idCuentaVariacionExistencias
left JOIN Cuenta c4 on c4.idCuenta = t.idCuentaTransferencia
left JOIN Cuenta c5 on c5.idCuenta = t.idCuentaProducto
left JOIN Cuenta c6 on c6.idCuenta = t.idCuentaVariacionProducto
where t.descripcion like concat('%',descripcion,'%') ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `uspListConfiguracionCuenta` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `uspListConfiguracionCuenta`(descripcion text)
select t.idConfiguracionCuenta, t.idcuenta, t.descripcion, t.IdTipoConfiguracionCuenta, t.ExigeCC, t.IdClase, t.IdNaturaleza, t.IdMoneda, t.IdTipoAuxiliar, t.IdAjuste
, t.IdTipoCambioCuenta, t.IdCuentaabono, t.idcuentacargo, cu.Descripcion as DCuenta, ca.Descripcion as Dabono, cc.Descripcion as dcargo
, cu.codigo as codcuenta, cc.codigo as codcargo, ca.Codigo as codabono
from ConfiguracionCuenta t
inner join TipoConfiguracionCuenta tcc on tcc.IdTipoConfiguracionCuenta = t.IdTipoConfiguracionCuenta
left join Clase c on c.idClase = t.idclase
left join Naturaleza n on n.idNaturaleza = t.idNaturaleza
left join Moneda m on m.idMoneda = t.idMoneda
left join TipoAuxiliar ta on ta.idtipoauxiliar = t.idtipoauxiliar
left join Ajuste a on a.idajuste = t.idajuste
left join TipoCambioCuenta tc on tc.idtipocambiocuenta = t.idtipocambiocuenta
left join Cuenta ca on ca.idCuenta = t.idcuentaabono
left join cuenta cc on cc.idCuenta = t.idcuentacargo
left join cuenta cu on cu.idCuenta = t.idCuenta
where t.descripcion like concat('%',descripcion,'%') ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `uspListCotizacion` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `uspListCotizacion`(IN idCliente INT, IN Serie VARCHAR(6))
SELECT c.idCotizacion, c.idClienteProveedor, cp.RazonSocial as DClienteProveedor, c.idModeloChasis
, m.Descripcion as DModeloChasis, c.Serie, DATE_FORMAT(c.Fecha,'%d-%m-%Y') as Fecha, c.NumeroChasis, c.TipoCarroceria
, c.NumeroAsientos, c.NumeroParabrisas, c.Ventanas, c.Observaciones, c.ColorFondo, c.ColorArtes, c.ColorOtros
FROM Cotizacion c
INNER JOIN ModeloChasis m on m.idModeloChasis = c.idModeloChasis
INNER JOIN ClienteProveedor cp on cp.idClienteProveedor = c.idClienteProveedor
WHERE c.Activo = 1 and (idCliente = 0 or c.idClienteProveedor = idCliente) and c.Serie like concat('%',Serie,'%') 
ORDER BY c.idCotizacion desc
LIMIT 100 ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `uspListCotizacionCaracteristicas` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `uspListCotizacionCaracteristicas`(IN idCotizacion INT)
SELECT cc.idCotizacionCaracteristicas, cc.idCotizacion, cc.idCaracteristicas, cc.Valor, cc.Estado, c.Descripcion as DCaracteristicas
,tc.Descripcion as DTipoCaracteristica 
FROM CotizacionCaracteristicas cc
INNER JOIN Caracteristicas c on c.idCaracteristicas = cc.idCaracteristicas
INNER JOIN TipoCaracteristica tc on tc.idTipoCaracteristica = c.idTipoCaracteristica
WHERE cc.idCotizacion = idCotizacion and cc.Activo = 1

UNION

SELECT 0, idCotizacion, c.idCaracteristicas, '', 0, c.Descripcion as DCaracteristicas
,tc.Descripcion as DTipoCaracteristica 
FROM Caracteristicas c 
INNER JOIN TipoCaracteristica tc on tc.idTipoCaracteristica = c.idTipoCaracteristica
LEFT JOIN CotizacionCaracteristicas cc on c.idCaracteristicas = cc.idCaracteristicas
WHERE cc.idCotizacion = idCotizacion and cc.Activo = 1 and c.Activo = 1 and cc.idCaracteristicas is null ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `uspListCotizacionProducto` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `uspListCotizacionProducto`(IN idCotizacion INT)
SELECT cp.idCotizacionProducto, cp.idCotizacion, cp.idProducto, cp.Cantidad, p.Descripcion as DProducto, p.Codigo as CodigoProducto
,cp.Precio, (cp.Precio * cp.Cantidad) as SubTotal
FROM CotizacionProducto cp
INNER JOIN Producto p on p.idProducto = cp.idProducto
WHERE cp.idCotizacion = idCotizacion and cp.Activo = 1 ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `uspListCuenta` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `uspListCuenta`(Descripcion VARCHAR(50), Codigo VARCHAR(20))
SELECT t.idCuenta, t.Descripcion, t.Codigo
FROM Cuenta t
WHERE t.Descripcion like Concat('%',Descripcion,'%') and t.activo = 1 AND t.Codigo like CONCAT('%',Codigo,'%') ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `uspListDetalleAsiento` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `uspListDetalleAsiento`(idasiento int)
select
da.idasiento
,da.iddetalleasiento
,da.idCuenta
,c.descripcion as dcuenta
,c.codigo as codcuenta
,da.idCentroCosto
,cc.descripcion as dcentrocosto
,cc.codigo as codcentrocosto
,da.CargoMN
,da.AbonoMN
,da.CargoME
,da.AbonoME
,da.Glosa
from detalleasiento da
inner join cuenta c on c.idcuenta = da.idcuenta
inner join centrocosto cc on cc.idcentrocosto = da.idcentrocosto
where da.idasiento = idasiento and da.activo = 1 ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `uspListDetalleConfiguracionAbono` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `uspListDetalleConfiguracionAbono`(idConfiguracion int)
select iddetalleConfiguracion
,t.idConfiguracion
,c.idCuenta
,c.descripcion as dCuenta
,c.codigo as codCuenta
,cc.idCentroCosto
,cc.descripcion as dCentroCosto
,cc.codigo as codCentroCosto
,t.Cargo
from detalleConfiguracion t
inner join Configuracion ca on ca.idConfiguracion = t.idConfiguracion
inner join cuenta c on c.idcuenta = t.idcuenta
inner join centrocosto cc on cc.idcentrocosto = t.idcentrocosto
where t.activo = 1 and t.idConfiguracion = idConfiguracion and t.Cargo = 0 ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `uspListDetalleConfiguracionAlmacen` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `uspListDetalleConfiguracionAlmacen`(idconfiguracionalmacen int)
select iddetalleConfiguracionalmacen
,t.idconfiguracionalmacen
,c.idCuenta
,c.descripcion as dCuenta
,c.codigo as codCuenta
,cc.idCentroCosto
,cc.descripcion as dCentroCosto
,cc.codigo as codCentroCosto
from detalleConfiguracionalmacen t
inner join configuracionalmacen ca on ca.idconfiguracionalmacen = t.idconfiguracionalmacen
inner join cuenta c on c.idcuenta = t.idcuenta
inner join centrocosto cc on cc.idcentrocosto = t.idcentrocosto
where t.activo = 1 and t.idconfiguracionalmacen = idconfiguracionalmacen ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `uspListDetalleConfiguracionCargo` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `uspListDetalleConfiguracionCargo`(idConfiguracion int)
select iddetalleConfiguracion
,t.idConfiguracion
,c.idCuenta
,c.descripcion as dCuenta
,c.codigo as codCuenta
,cc.idCentroCosto
,cc.descripcion as dCentroCosto
,cc.codigo as codCentroCosto
,t.Cargo
from detalleConfiguracion t
inner join Configuracion ca on ca.idConfiguracion = t.idConfiguracion
inner join cuenta c on c.idcuenta = t.idcuenta
inner join centrocosto cc on cc.idcentrocosto = t.idcentrocosto
where t.activo = 1 and t.idConfiguracion = idConfiguracion and t.Cargo = 1 ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `uspListDetalleFactrua` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `uspListDetalleFactrua`(idFactura INT)
SELECT d.iddetallefactura, d.idproducto, d.idfactura, p.descripcion as DProducto, d.cantidad, d.precio, d.SubTotal 
from detallefactura d
inner join producto p on p.idproducto = d.idProducto
where d.idFactura = idFactura and d.activo = 1 ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `uspListDetalleGuia` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `uspListDetalleGuia`(idGuia INT)
SELECT d.iddetalleGuia, d.idproducto, d.idGuia, p.descripcion as DProducto, d.cantidad, d.precio, d.SubTotal 
from detalleGuia d
inner join producto p on p.idproducto = d.idProducto
where d.idGuia = idGuia and d.activo = 1 ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `uspListDetalleProvision` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `uspListDetalleProvision`(idProvision INT)
SELECT 
dp.idDetalleProvision
,dp.idProvision
,dp.idIngreso
,i.Numero as DIngreso
,dp.idCuenta
,c.Descripcion as DCuenta
,dp.idCentroCosto
,cc.Descripcion as DCentroCosto
,cc.Codigo
,dp.Importe 
,dp.idOrdenProduccion
,op.Numero as DOrdenProduccion
,dp.Descripcion
FROM detalleprovision dp
INNER JOIN Cuenta c on c.idCuenta = dp.idCuenta
INNER JOIN centrocosto cc on cc.idCentroCosto = dp.idCentroCosto
INNER JOIN OrdenProduccion op on op.idOrdenProduccion = dp.idOrdenProduccion
LEFT JOIN Ingreso i on i.idIngreso = dp.idIngreso
WHERE dp.idProvision = idProvision and dp.Activo = 1 ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `uspListDetalleProvisionOC` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `uspListDetalleProvisionOC`(idOrdenCompra int, idProvision INT)
begin

declare count int;

set count = (select count(*) from detalleprovision t where t.idProvision = idProvision and t.activo = 1);

if count > 0 then

SELECT 
dp.idDetalleProvision
,dp.idProvision
,dp.idIngreso
,i.Numero as Referencia
,dp.idCuenta
,c.Descripcion as DCuenta
,dp.idCentroCosto
,cc.Descripcion as DCentroCosto
,dp.Importe 
FROM detalleprovision dp
INNER JOIN Cuenta c on c.idCuenta = dp.idCuenta
INNER JOIN centrocosto cc on cc.idCentroCosto = dp.idCentroCosto
LEFT JOIN Ingreso i on i.idIngreso = dp.idIngreso
WHERE dp.idProvision = idProvision and dp.Activo = 1;

else

select o.idOrdenCompra, i.Numero as Referencia
, sum(ip.Importe) as Importe, i.idIngreso
from ingresoproducto ip
inner join ingreso i on i.idingreso = ip.idingreso
inner join ordencompra o on o.idOrdenCompra = i.idOrdenCompra
inner join producto p on p.idProducto = ip.idProducto
where o.idordencompra = idOrdenCompra
group by i.idingreso;

end if;



end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `uspListDetalleTareo` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `uspListDetalleTareo`(idtareo int)
select
 t.iddetalletareo
,t.idtareo
,t.idEmpleado
,e.nombre as dempleado
,e.codigo as codempleado
,t.idOrdenProduccion
,o.numero as dordenproduccion
,t.idActividad
,a.descripcion as dactividad
,a.codigo as codactividad
,t.idCentroCosto
,c.descripcion as dcentrocosto
,c.codigo as codcentrocosto
,t.Descripcion
,t.HoraInicio
,t.HoraFin
,t.Horas
from detalletareo t
inner join empleado e on e.idempleado = t.idempleado
inner join ordenproduccion o on o.idordenproduccion = t.idordenproduccion
inner join actividad a on a.idactividad = t.idactividad
inner join centrocosto c on c.idcentrocosto = t.idcentrocosto
where t.idtareo = idtareo and t.activo = 1 ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `uspListEmpleado` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `uspListEmpleado`(IN Nombre VARCHAR(100))
SELECT e.IdEmpleado,e.Nombre,e.DNI,e.Direccion,e.Codigo,e.Telefono1,e.Telefono2,e.Puesto 
FROM Empleado e
WHERE e.Nombre like CONCAT('%',Nombre,'%') and e.Activo = 1 ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `uspListEstandar` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `uspListEstandar`(idProducto INT)
SELECT e.idEstandar, e.idProductoPrincipal, p1.Codigo as CodigoProductoPrincipal, p1.Descripcion as DProductoPrincipal
,e.idProducto, p2.Codigo as CodigoProducto, p2.Descripcion as DProducto, e.Cantidad
FROM Estandar e
INNER JOIN Producto p1 on p1.idProducto = e.idProductoPrincipal
INNER JOIN Producto p2 on p2.idProducto = e.idProducto
WHERE e.idProductoPrincipal = idProducto and e.Activo = 1 ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `uspListEstandarPorOP` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `uspListEstandarPorOP`(idOrdenProduccion INT)
SELECT o.idOrdenProduccion, o.Numero, sum(e.Cantidad) as Cantidad, p2.idProducto, p2.Descripcion as DProducto
FROM OrdenProduccion o
INNER JOIN Cotizacion c on c.idCotizacion = o.idCotizacion
INNER JOIN CotizacionProducto cp on cp.idCotizacion = c.idCotizacion and cp.Activo = 1
INNER JOIN Producto p on p.idProducto = cp.idProducto
INNER JOIN Estandar e on e.idProductoPrincipal = p.idProducto and e.Activo = 1
INNER JOIN Producto p2 on p2.idProducto = e.idProducto
WHERE o.idOrdenProduccion = idOrdenProduccion
group by o.idOrdenProduccion, o.Numero, p2.Descripcion, p2.idProducto ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `uspListFactura` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `uspListFactura`(Numero VARCHAR(20))
SELECT f.IdFactura,f.Periodo,f.Numero,f.Fecha,f.Importe,f.DCliente,f.CotizacionOP
FROM Factura f
WHERE f.activo = 1 and f.numero like concat('%',Numero,'%')
LIMIT 100 ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `uspListFamilia` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `uspListFamilia`(IN Descripcion text, Codigo text)
SELECT f.idFamilia, f.Descripcion, f.Codigo, c.idCuenta, c.Descripcion as DCuenta 
FROM Familia f
LEFT JOIN Cuenta c on f.idCuenta = c.idCuenta
WHERE f.Activo = 1 and f.Descripcion like CONCAT('%',Descripcion,'%') and f.Codigo like CONCAT('%',Codigo,'%') ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `uspListFormaPago` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `uspListFormaPago`(IN Descripcion VARCHAR(50))
SELECT f.idFormaPago, f.Descripcion
FROM FormaPago f
WHERE f.Descripcion LIKE CONCAT('%',Descripcion,'%') and Activo = 1 ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `uspListIGV` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `uspListIGV`(Activo BIT)
SELECT t.idIGV, t.Valor, t.Activo FROM IGV t
WHERE (t.Activo = 1 and Activo = 0) OR Activo = 1 ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `uspListIngreso` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `uspListIngreso`(IN Numero VARCHAR(20))
SELECT i.idIngreso,i.idAlmacen,i.idTipoMovimiento,i.idOrdenCompra,i.idClienteProveedor,i.idMoneda,i.Fecha,i.Numero,i.TipoCambio,i.GuiaRemision
,i.FacturaProveedor,i.FechaDocumento,i.ProvisionCompra,i.TipoCambioMoneda,i.Monto,i.Observaciones, a.Descripcion as DAlmacen
,tm.Descripcion as DTipoMovimiento, oc.Numero as DOrdenCompra, cp.RazonSocial as DClienteProveedor, m.Descripcion as DMoneda
FROM Ingreso i
INNER JOIN Almacen a on a.idAlmacen = i.idAlmacen
INNER JOIN TipoMovimiento tm on tm.idTipoMovimiento = i.idTipoMovimiento
INNER JOIN OrdenCompra oc on oc.idOrdenCompra = i.idOrdenCompra
INNER JOIN ClienteProveedor cp on cp.idClienteProveedor = i.idClienteProveedor
left JOIN Moneda m on m.idMoneda = i.idMoneda
WHERE i.Numero like CONCAT('%',Numero,'%') and i.Activo = 1
ORDER BY 1 DESC ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `uspListIngresoPorOC` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `uspListIngresoPorOC`(Numero VARCHAR(20), IN idOrdenCompra INT)
SELECT i.idIngreso,i.idAlmacen,i.idTipoMovimiento,i.idOrdenCompra,i.idClienteProveedor,i.idMoneda,i.Fecha,i.Numero,i.TipoCambio,i.GuiaRemision
,i.FacturaProveedor,i.FechaDocumento,i.ProvisionCompra,i.TipoCambioMoneda,i.Monto,i.Observaciones, a.Descripcion as DAlmacen
,tm.Descripcion as DTipoMovimiento, oc.Numero as DOrdenCompra, cp.RazonSocial as DClienteProveedor, m.Descripcion as DMoneda
FROM Ingreso i
INNER JOIN Almacen a on a.idAlmacen = i.idAlmacen
INNER JOIN TipoMovimiento tm on tm.idTipoMovimiento = i.idTipoMovimiento
INNER JOIN OrdenCompra oc on oc.idOrdenCompra = i.idOrdenCompra
INNER JOIN ClienteProveedor cp on cp.idClienteProveedor = i.idClienteProveedor
INNER JOIN Moneda m on m.idMoneda = i.idMoneda
WHERE i.Numero like CONCAT('%',Numero,'%') AND i.idOrdenCompra = idOrdenCompra and i.Activo = 1
ORDER BY 1 DESC
LIMIT 100 ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `uspListIngresoProducto` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `uspListIngresoProducto`(idIngreso INT)
SELECT ip.idIngresoProducto,ip.idIngreso,ip.idProducto,ip.idCentroCosto,ip.Cantidad,ip.Precio,ip.Importe, i.Numero as DIngreso
,p.Descripcion as DProducto, cc.Descripcion as DCentroCosto, p.Codigo, p.idUnidadMedidaCompra, um.Simbolo as DUnidadMedida
FROM IngresoProducto ip
INNER JOIN Ingreso i on i.idIngreso = ip.idIngreso
INNER JOIN Producto p on p.idProducto = ip.idProducto
INNER JOIN CentroCosto cc on cc.idCentroCosto = ip.idCentroCosto
INNER JOIN UnidadMedida um on um.idUnidadMedida = p.idUnidadMedidaCompra
WHERE ip.idIngreso = idIngreso and ip.Activo = 1 ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `uspListListaPrecio` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `uspListListaPrecio`(IN idProducto INT, IN Estado BIT)
SELECT lp.idListaPrecio, lp.idProducto, p.Descripcion as DProducto, lp.Precio, lp.TipoCambio, DATE_FORMAT(lp.Fecha,'%d-%m-%Y') as Fecha, lp.Estado
FROM ListaPrecio lp
INNER JOIN Producto p on p.idProducto = lp.idProducto and lp.Activo = 1  
WHERE (lp.idProducto = idProducto or idProducto = 0) and (lp.Estado = 1 or lp.Estado <> Estado) ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `uspListModeloChasis` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `uspListModeloChasis`(IN Descripcion VARCHAR(50))
SELECT m.idModeloChasis, m.Descripcion 
FROM ModeloChasis m
WHERE m.Descripcion LIKE CONCAT('%',Descripcion,'%') ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `uspListModulo` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `uspListModulo`(IN Descripcion VARCHAR(50))
SELECT idModulo,m.Descripcion FROM Modulo m
WHERE m.Descripcion like concat('%',Descripcion,'%') and m.Activo = 1 ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `uspListMoneda` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `uspListMoneda`(IN Descripcion VARCHAR(50))
SELECT m.idMoneda, m.Descripcion, m.DescripcionCorta, m.Simbolo
FROM Moneda m
WHERE m.Activo = 1 and m.Descripcion like CONCAT('%',Descripcion,'%') ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `uspListNaturaleza` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `uspListNaturaleza`(descripcion varchar(100))
select c.idNaturaleza,c.Descripcion, c.Codigo
from Naturaleza c
where c.descripcion like concat('%',descripcion,'%') and c.activo = 1 ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `uspListOpcionPorModulo` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `uspListOpcionPorModulo`(IN idModulo INT)
SELECT m.idOpcion,m.Descripcion FROM Opcion m
WHERE m.idModulo = idModulo and m.Activo = 1 ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `uspListOrdenCompra` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `uspListOrdenCompra`(IN Numero VARCHAR(20))
SELECT oc.idOrdenCompra,oc.idSucursal,s.Descripcion as DSucursal,oc.idFormaPago,fp.Descripcion as DFormaPago,oc.idMoneda
,m.Descripcion as DMoneda,oc.idClienteProveedor,cp.RazonSocial as DClienteProveedor,DATE_FORMAT(oc.Fecha,'%d-%m-%Y') as Fecha
,oc.TipoCambio,DATE_FORMAT(oc.FechaEntrega,'%d-%m-%Y') as FechaEntrega,oc.Observaciones,oc.IGV,oc.Subtotal,oc.Total,oc.Numero,oc.Estado,oc.Afecto
FROM OrdenCompra oc
INNER JOIN Sucursal s on s.idSucursal = oc.idSucursal
INNER JOIN FormaPago fp on fp.idFormaPago = oc.idFormaPago
INNER JOIN Moneda m on m.idMoneda = oc.idMoneda
INNER JOIN ClienteProveedor cp on cp.idClienteProveedor = oc.idClienteProveedor
WHERE oc.Activo = 1 and oc.Numero LIKE CONCAT('%',Numero,'%')
ORDER BY oc.idOrdenCompra DESC ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `uspListOrdenCompraProducto` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `uspListOrdenCompraProducto`(IN idOrdenCompra INT)
SELECT oc.idOrdenCompraProducto,oc.idOrdenCompra,oc.idProducto,oc.Cantidad,oc.PrecioUnitario,oc.Descuento,oc.Importe,oc.Glosa 
,p.Descripcion as DProducto, p.Codigo, u.Simbolo as DUnidadMedida
FROM OrdenCompraproducto oc
INNER JOIN Producto p on p.idProducto = oc.idProducto
INNER JOIN UnidadMedida u on u.idUnidadMedida = p.idUnidadMedidaCompra
WHERE oc.idOrdenCompra = idOrdenCompra and oc.Activo = 1 ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `uspListOrdenProduccion` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `uspListOrdenProduccion`(IN Numero VARCHAR(20))
SELECT op.idOrdenProduccion, COALESCE(op.idSucursal,0) as idSucursal, COALESCE(s.Descripcion,'') as DSucursal, op.idProducto
, p.Descripcion as DProductoPrincipal ,DATE_FORMAT(op.Fecha,'%d-%m-%Y') as Fecha, op.Numero, coalesce(DATE_FORMAT(op.FechaInicio,'%d-%m-%Y'),'') as FechaInicio
, coalesce(DATE_FORMAT(op.FechaTermino,'%d-%m-%Y'),'') as FechaTermino, coalesce(op.Observaciones,'') as Observaciones, op.idCotizacion, c.Serie as DCotizacion
, op.Estado, op.Monto, op.idTipoOrdenProduccion, op.idCentroCosto, cc.Descripcion as DCentroCosto, op.idClienteProveedor
, cp.RazonSocial as DClienteProveedor
FROM OrdenProduccion op
LEFT JOIN Producto p on p.idProducto = op.idProducto
LEFT JOIN Cotizacion c on c.idCotizacion = op.idCotizacion
LEFT JOIN Sucursal s on s.idSucursal = op.idSucursal
LEFT JOIN CentroCosto cc on cc.idCentroCosto = op.idCentroCosto
LEFT JOIN ClienteProveedor cp on cp.idClienteProveedor = op.idClienteProveedor
WHERE op.Numero like CONCAT('%',Numero,'%') and op.Activo = 1
ORDER BY op.idOrdenProduccion DESC ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `uspListOrdenServicio` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `uspListOrdenServicio`(Numero VARCHAR(20))
SELECT os.idOrdenServicio,os.idCentroCosto,os.idFormaPago,os.idMoneda,os.idClienteProveedor,os.idSucursal
,DATE_FORMAT(os.Fecha,'%d-%m-%Y') as Fecha,os.TipoCambio,os.FechaEntrega,os.Observaciones,os.IGV,os.Subtotal,os.Monto,os.Numero
,os.Estado, cc.Descripcion as DCentroCosto, fp.Descripcion as DFormaPago, m.Descripcion as DMoneda, cp.RazonSocial as DClienteProveedor
,s.Descripcion as DSucursal, os.Afecto
FROM OrdenServicio os
INNER JOIN CentroCosto cc on cc.idCentroCosto = os.idCentroCosto
INNER JOIN FormaPago fp on fp.idFormaPago = os.idFormaPago
INNER JOIN Moneda m on m.idMoneda = os.idMoneda
INNER JOIN ClienteProveedor cp on cp.idClienteProveedor = os.idClienteProveedor
INNER JOIN Sucursal s on s.idSucursal = os.idSucursal
WHERE os.Numero like CONCAT('%',Numero,'%') and os.Activo = 1
ORDER BY os.idOrdenServicio DESC ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `uspListOrdenServicioProducto` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `uspListOrdenServicioProducto`(idOrdenServicio INT)
SELECT osp.idOrdenServicioProducto,osp.idOrdenServicio,osp.idProducto,osp.idOrdenProduccion,osp.Cantidad,osp.PrecioUnitario,osp.Descuento,osp.Importe,osp.Glosa
,op.Numero as DOrdenProduccion,p.Descripcion as DProducto,um.simbolo as DUnidadMedida,p.Codigo
FROM OrdenServicioProducto osp
INNER JOIN OrdenProduccion op ON op.idOrdenProduccion = osp.idOrdenProduccion
INNER JOIN Producto p on p.idProducto = osp.idProducto
INNER JOIN UnidadMedida um on um.idUnidadMedida = p.idUnidadMedidaCompra
WHERE osp.idOrdenServicio = idOrdenServicio and osp.Activo = 1 ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `uspListPedido` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `uspListPedido`(Numero VARCHAR(20))
SELECT p.idPedido,p.idCentroCosto,p.idOrdenProduccion,p.idEmpleado,p.Estado,p.Numero,DATE_FORMAT(p.Fecha,'%d-%m-%Y') as Fecha
,cc.Descripcion as DCentroCosto, e.Nombre as DEmpleado, op.Numero as DOrdenProduccion
FROM Pedido p
INNER JOIN CentroCosto cc on cc.idCentroCosto = p.idCentroCosto
LEFT JOIN Empleado e on e.idEmpleado = p.idEmpleado
LEFT JOIN OrdenProduccion op on op.idOrdenProduccion = p.idOrdenProduccion
WHERE p.Activo = 1 and p.Numero like CONCAT('%',Numero,'%')
ORDER BY p.idPedido DESC ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `uspListPedidoProducto` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `uspListPedidoProducto`(idPedido INT)
SELECT pp.idPedidoProducto,pp.idPedido,pp.idProducto, p.Codigo as CodigoProducto, p.Descripcion as DProducto,pp.Cantidad,pp.Glosa
FROM PedidoProducto pp
INNER JOIN Producto p on p.idProducto = pp.idProducto 
WHERE pp.idPedido = idPedido and pp.Activo = 1 ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `uspListPercepcion` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `uspListPercepcion`(Descripcion VARCHAR(20))
SELECT t.idPercepcion, t.Descripcion, t.Valor FROM Percepcion t
WHERE t.Descripcion like concat('%',Descripcion,'%') and t.Activo = 1 ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `uspListPeriodo` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `uspListPeriodo`(Activo BIT)
SELECT t.idPeriodo, t.Anio, t.Mes, t.Activo FROM Periodo t
WHERE (t.Activo = 1 and Activo = 0) OR Activo = 1 ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `uspListPermiso` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `uspListPermiso`(IN idUsuario INT)
begin
SELECT m.idModulo, m.Descripcion as DModulo, p.idOpcion, o.Descripcion as DOpcion, p.idUsuario, u.Nick as DUsuario
FROM Permiso p
INNER JOIN Opcion o on o.idOpcion = p.idOpcion
INNER JOIN Modulo m on m.idModulo = o.idModulo
INNER JOIN Usuario u on u.idUsuario = p.idUsuario
WHERE p.idUsuario = idUsuario and p.Activo = 1;
end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `uspListProducto` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `uspListProducto`(IN idFamilia INT, IN Descripcion VARCHAR(50))
SELECT p.idProducto, p.idTipoProducto, p.Descripcion, p.Codigo, p.UmCompra, p.UmConsumo, p.idUnidadMedidaCompra, p.idUnidadMedidaConsumo, p.Conversion
, tp.Descripcion AS DTipoProducto, u1.Simbolo AS DUnidadMedidaCompra, u2.Simbolo AS DUnidadMedidaConsumo, p.idFamilia
, f.Descripcion as DFamilia, lp.Precio
FROM Producto p
INNER JOIN TipoProducto tp on tp.idTipoProducto = p.idTipoProducto
INNER JOIN UnidadMedida u1 on u1.idUnidadMedida = p.idUnidadMedidaCompra
INNER JOIN UnidadMedida u2 on u2.idUnidadMedida = p.idUnidadMedidaConsumo
INNER JOIN Familia f on f.idFamilia = p.idFamilia
LEFT JOIN ListaPrecio lp on lp.idProducto = p.idProducto and lp.Activo = 1 and lp.Estado = 1
WHERE (p.idFamilia = idFamilia or idFamilia = 0) and (p.Descripcion LIKE CONCAT('%',Descripcion,'%')) and p.Activo = 1 ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `uspListProvision` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `uspListProvision`(Numero VARCHAR(15))
SELECT idProvision,p.Numero,Periodo,Fecha,ServicioCompra,Codigo,RazonSocial,Ruc,Glosa,TipoDocumento,Serie,NumeroDocumento,FechaDocumento
,FechaVencimiento,TipoCambio,TipoAdquisicion,Igv,Percepcion,Renta,Aporte,Tasa,Importe,BaseAfecta,Inafecto,IgvDocumento,PercepcionAfecta,RentaAfecta
,AportePension,Total,Activo,Usuario,FechaRegistro,UsuarioModificacion,FechaModificacion,idOrdenCompra,idSucursal,idTipoCompra,idFormaPago,idMoneda
,idOrdenServicio
FROM Provision p 
WHERE p.Numero like CONCAT('%',Numero,'%') LIMIT 100 ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `uspListPuntoVenta` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `uspListPuntoVenta`(Descripcion VARCHAR(50))
SELECT t.IdPuntoVenta,t.Descripcion,t.Codigo
FROM PuntoVenta t
WHERE t.Activo = 1 and t.Descripcion like concat('%',Descripcion,'%')
LIMIT 100 ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `uspListReferenciaMaterialesOP` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `uspListReferenciaMaterialesOP`(IN idOrdenProduccion INT)
SELECT p.idProducto, p.Descripcion as DProducto, p.Codigo as CodigoProducto, sp.Cantidad, DATE_FORMAT(s.Fecha,'%d-%m-%Y') as Fecha
,su.idSucursal, su.Descripcion as DSucursal , a.idAlmacen, a.Descripcion as DAlmacen, s.Numero
FROM SalidaProducto sp
INNER JOIN Salida s on s.idSalida = sp.idSalida
INNER JOIN Almacen a on a.idAlmacen = s.idAlmacen
INNER JOIN Producto p on p.idProducto = sp.idProducto
INNER JOIN Sucursal su on su.idSucursal = a.idSucursal
INNER JOIN Pedido pd on pd.idPedido = s.idPedido
WHERE sp.Activo = 1 and pd.idOrdenProduccion = idOrdenProduccion ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `uspListReferenciaOrdenCompra` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `uspListReferenciaOrdenCompra`(IN idOrdenCompra INT)
SELECT p.idProducto, p.Descripcion as DProducto, p.Codigo as CodigoProducto, ip.Cantidad, DATE_FORMAT(i.Fecha,'%d-%m-%Y') as Fecha
,s.idSucursal, s.Descripcion as DSucursal , a.idAlmacen, a.Descripcion as DAlmacen, i.Numero
FROM IngresoProducto ip
INNER JOIN Ingreso i on i.idIngreso = ip.idIngreso
INNER JOIN Almacen a on a.idAlmacen = i.idAlmacen
INNER JOIN Producto p on p.idProducto = ip.idProducto
INNER JOIN Sucursal s on s.idSucursal = a.idSucursal
WHERE ip.Activo = 1 and i.idOrdenCompra = idOrdenCompra ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `uspListReferenciaServiciosOP` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `uspListReferenciaServiciosOP`(idOrdenProduccion INT)
SELECT osp.idOrdenServicio, os.Numero as DOrdenServicio, DATE_FORMAT(os.Fecha,'%d-%m-%Y') as Fecha, os.IdCentroCosto
, cc.Descripcion as DCentroCosto, osp.idProducto, p.Descripcion as DProducto, osp.Cantidad, osp.Importe
FROM OrdenServicioProducto osp
INNER JOIN OrdenServicio os on os.idOrdenServicio = osp.idOrdenServicio
INNER JOIN CentroCosto cc on cc.idCentroCosto = os.idCentroCosto
INNER JOIN Producto p on p.idProducto = osp.idProducto
WHERE osp.Activo = 1 and osp.idOrdenProduccion = idOrdenProduccion ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `uspListRenta` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `uspListRenta`(Descripcion VARCHAR(20))
SELECT t.idRenta, t.Descripcion, t.Valor FROM Renta t
WHERE t.Descripcion like concat('%',Descripcion,'%') and t.Activo = 1
LIMIT 100 ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `uspListSalida` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `uspListSalida`(Numero VARCHAR(20), idPedido INT)
SELECT s.idSalida,s.idAlmacen,s.idTipoMovimiento,s.idPedido,s.idEmpleado,0 as idMoneda,DATE_FORMAT(s.Fecha,'%d-%m-%Y') as Fecha,s.Numero,s.TipoCambio
,s.Observaciones,s.TipoCambioMoneda, a.Descripcion as DAlmacen, tm.Descripcion as DTipoMovimiento, p.Numero as DPedido
,e.Nombre as DEmpleado, '' as DMoneda
FROM Salida s
INNER JOIN Almacen a on a.idAlmacen = s.idAlmacen
INNER JOIN TipoMovimiento tm on tm.idTipoMovimiento = s.idTipoMovimiento 
INNER JOIN Pedido p on p.idPedido = s.idPedido
INNER JOIN Empleado e on e.idEmpleado = s.idEmpleado
WHERE ((s.Numero LIKE CONCAT('%',Numero,'%')) and (s.idPedido = idPedido or idPedido = 0)) AND s.Activo = 1 
ORDER BY 1 DESC LIMIT 100 ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `uspListSalidaProducto` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `uspListSalidaProducto`(idSalida INT)
SELECT sp.idSalidaProducto,sp.idSalida,sp.idProducto,sp.idCentroCosto,sp.Cantidad,sp.Precio,sp.Importe, p.Descripcion as DProducto
,p.Codigo, um.Simbolo as DUnidadMedida, cc.Descripcion as DCentroCosto, sum(s.Cantidad) as Stock, coalesce(sp.Estandar,0) as Estandar
FROM SalidaProducto sp
INNER JOIN Producto p on p.idProducto = sp.idProducto
INNER JOIN CentroCosto cc on cc.idCentroCosto = sp.idCentroCosto
INNER JOIN UnidadMedida um on um.idUnidadMedida = p.idUnidadMedidaCompra
LEFT JOIN Stock s on s.idProducto = sp.idProducto
WHERE sp.idSalida = idSalida and sp.Activo = 1
GROUP BY sp.idSalidaProducto ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `uspListServicio` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `uspListServicio`(Descripcion VARCHAR(50))
SELECT t.IdServicio,t.Descripcion,t.Codigo 
FROM Servicio t
WHERE t.activo=1 and t.descripcion like concat('%',Descripcion,'%')
LIMIT 100 ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `uspListSubdiario` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `uspListSubdiario`(IN Descripcion VARCHAR(50))
SELECT t.idSubdiario,t.Descripcion,t.Codigo FROM Subdiario t
WHERE t.Descripcion like concat('%',Descripcion,'%') and t.Activo = 1 ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `uspListSucursal` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `uspListSucursal`(IN Descripcion VARCHAR(50))
SELECT s.IdSucursal,s.Descripcion,s.Direccion 
FROM Sucursal s
WHERE s.Activo = 1 and s.Descripcion like CONCAT('%',Descripcion,'%') ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `uspListTareo` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `uspListTareo`(numero text)
select t.idtareo
,t.periodo
,t.numero
,t.fecha 
,t.tipocambio 
,t.idsucursal 
,s.Descripcion as dsucursal
,t.idempleado 
,e.nombre as dempleado
,e.Codigo as codempleado
,t.observaciones 
,t.totalhoras 
from tareo t
inner join sucursal s on s.idsucursal = t.idsucursal
inner join empleado e on e.idEmpleado = t.idempleado
where t.numero like concat('%',idtareo,'%') and t.activo = 1 ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `uspListTasa` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `uspListTasa`(Descripcion VARCHAR(50))
SELECT t.idTasa, t.Descripcion, t.Valor FROM Tasa t
WHERE t.Descripcion like concat('%',Descripcion,'%') and t.Activo = 1
LIMIT 100 ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `uspListTipoAdquisicion` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `uspListTipoAdquisicion`(Descripcion VARCHAR(50))
SELECT t.idTipoAdquisicion, t.Descripcion, t.Valor FROM TipoAdquisicion t
WHERE t.Descripcion like concat('%',Descripcion,'%') and t.Activo = 1
LIMIT 100 ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `uspListtipoauxiliar` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `uspListtipoauxiliar`(descripcion varchar(100))
select c.idtipoauxiliar,c.Descripcion, c.Codigo
from tipoauxiliar c
where c.descripcion like concat('%',descripcion,'%') and c.activo = 1 ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `uspListTipoCambio` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `uspListTipoCambio`(Fecha varchar(20), idMonedaPago INT, idMonedaCobra int)
select tc.idtipocambio, tc.idMonedaPago, mp.Descripcion as DMonedaPago, tc.idMonedaCobra, mc.Descripcion as DMonedaCobra, tc.Valor
, DATE_FORMAT(tc.Fecha,'%d-%m-%Y') AS Fecha
from tipocambio tc
inner join Moneda mp on tc.idMonedaPago = mp.idMoneda
inner join Moneda mc on tc.idMonedaCobra = mc.idmoneda
where tc.Fecha like concat('%',Fecha,'%') and (idmonedapago = 0 or tc.idmonedapago = idmonedapago) 
and (tc.idmonedacobra = idmonedacobra or idmonedacobra = 0) and tc.activo = 1 ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `uspListtipocambiocuenta` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `uspListtipocambiocuenta`(descripcion varchar(100))
select c.idtipocambiocuenta,c.Descripcion, c.Codigo
from tipocambiocuenta c
where c.descripcion like concat('%',descripcion,'%') and c.activo = 1 ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `uspListTipoCompra` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `uspListTipoCompra`(Descripcion VARCHAR(50))
SELECT tc.idTipoCompra, tc.Descripcion, tc.Codigo FROM tipocompra tc
WHERE tc.Descripcion like CONCAT('%',Descripcion,'%') and tc.activo = 1
LIMIT 100 ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `uspListtipoconfiguracioncuenta` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `uspListtipoconfiguracioncuenta`(descripcion varchar(100))
select c.idtipoconfiguracioncuenta,c.Descripcion, c.Codigo
from tipoconfiguracioncuenta c
where c.descripcion like concat('%',descripcion,'%') and c.activo = 1 ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `uspListTipoDocumento` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `uspListTipoDocumento`(Descripcion VARCHAR(50))
SELECT t.IdTipoDocumento,t.Descripcion,t.Codigo 
FROM TipoDocumento t
WHERE t.activo = 1 and t.descripcion like concat('%',Descripcion,'%')
LIMIT 100 ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `uspListTipoMovimiento` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `uspListTipoMovimiento`(IN Descripcion VARCHAR(50))
SELECT t.IdTipoMovimiento,t.Descripcion,t.Codigo 
FROM TipoMovimiento t
WHERE t.Descripcion like CONCAT('%',Descripcion,'%') and Activo = 1 ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `uspListTipoOrdenProduccion` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `uspListTipoOrdenProduccion`(IN Descripcion VARCHAR(50))
SELECT t.idTipoOrdenProduccion, t.Descripcion, t.Codigo
FROM TipoOrdenProduccion t
WHERE t.Descripcion like CONCAT('%',Descripcion,'%') ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `uspListTipoProducto` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `uspListTipoProducto`(IN Descripcion VARCHAR(50))
SELECT t.idTipoProducto,t.Descripcion,t.Codigo FROM TipoProducto t
WHERE t.Descripcion like concat('%',Descripcion,'%') and t.Activo = 1 ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `uspListTipoVenta` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `uspListTipoVenta`(Descripcion VARCHAR(50))
SELECT t.IdTipoVenta,t.Descripcion,t.Codigo 
FROM TipoVenta t
WHERE t.Descripcion like CONCAT('%',Descripcion,'%') AND t.Activo = 1 LIMIT 100 ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `uspListUnidadMedida` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `uspListUnidadMedida`(IN Simbolo VARCHAR(5))
SELECT u.idUnidadMedida, u.Descripcion, u.Simbolo FROM UnidadMedida u
WHERE u.Simbolo like CONCAT('%',Simbolo,'%') ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `uspListUsuario` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `uspListUsuario`(IN Nick VARCHAR(20))
SELECT idUsuario,u.Nick,Password,Nombre,Email FROM Usuario u
WHERE u.Nick like concat('%',Nick,'%') and u.Activo = 1 ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `uspUpdactividad` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `uspUpdactividad`(idactividad int, Descripcion varchar(100), Codigo varchar(50), usuario varchar(20))
update actividad c
set c.Descripcion = Descripcion 
, c.Codigo = Codigo 
, c.UsuarioModificacion = UsuarioModificacion 
,c.fechamodificacion = fechamodificacion 
where c.idactividad = idactividad ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `uspUpdajuste` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `uspUpdajuste`(idajuste int, Descripcion varchar(100), Codigo varchar(50), usuario varchar(20))
update ajuste c
set c.Descripcion = Descripcion 
, c.Codigo = Codigo 
, c.UsuarioModificacion = UsuarioModificacion 
,c.fechamodificacion = fechamodificacion 
where c.idajuste = idajuste ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `uspUpdAlmacen` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `uspUpdAlmacen`(IN IdAlmacen INT, IN IdSucursal INT, IN Descripcion VARCHAR(50), IN Codigo VARCHAR(10), IN Usuario VARCHAR(20))
UPDATE Almacen t
SET t.IdSucursal = IdSucursal
,t.Descripcion = Descripcion
,t.Codigo = Codigo
,t.UsuarioModificacion = Usuario
,t.FechaModificacion = CURDATE()
WHERE t.IdAlmacen = IdAlmacen ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `uspUpdAporte` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `uspUpdAporte`(IN idAporte INT, IN Descripcion VARCHAR(50), IN Valor DECIMAL(4,2), Usuario VARCHAR(20))
UPDATE Aporte t
SET t.Descripcion = Descripcion
,t.Valor = Valor
,t.FechaModificacion = FechaModificacion
,t.UsuarioModificacion = Usuario
WHERE t.idAporte = idAporte ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `uspUpdAprobarCotizacion` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `uspUpdAprobarCotizacion`(IN idCotizacion INT, IN Usuario VARCHAR(20))
begin

DECLARE error INT DEFAULT 0;
DECLARE specialty CONDITION FOR SQLSTATE '45000';
DECLARE prmstrNumero VARCHAR(20);
DECLARE prmintNumero INT;
DECLARE prmintIdProducto INT;

SET ERROR = (SELECT COUNT(*) FROM OrdenProduccion o WHERE o.idCotizacion = idCotizacion AND activo = 1 LIMIT 1);
SET prmintNumero = (SELECT n.Numero FROM NumeroOP n WHERE n.Ano = year(curdate()) and n.idTipoOrdenProduccion = 1 LIMIT 1);
SET prmintNumero = prmintNumero + 1;
/*
SET prmintIdProducto = (
select c.idProducto from cotizacionproducto c
where c.idcotizacionproducto in(
select min(idcotizacionproducto) from cotizacionproducto cp
where cp.idcotizacion = idcotizacion) LIMIT 1);
*/
IF error = 0 THEN

CASE length(prmintNumero)
    WHEN 1 THEN SET prmstrNumero = CONCAT('00000',prmintNumero);
    WHEN 2 THEN SET prmstrNumero = CONCAT('0000',prmintNumero);
	WHEN 3 THEN SET prmstrNumero = CONCAT('000',prmintNumero);
	WHEN 4 THEN SET prmstrNumero = CONCAT('00',prmintNumero);
	WHEN 5 THEN SET prmstrNumero = CONCAT('0',prmintNumero);    
	ELSE SET prmstrNumero = prmintNumero;
END CASE;

UPDATE Cotizacion c
SET Estado = 'Aprobado'
,UsuarioModificacion = Usuario
,FechaModificacion = CURDATE()
WHERE c.idCotizacion = idCotizacion;

INSERT INTO OrdenProduccion(idCotizacion,Fecha,numero,Monto,idProducto,Usuario,FechaRegistro,idTipoOrdenProduccion, idCentroCosto, idClienteProveedor, FechaInicio)
SELECT c.idCotizacion, CURDATE(), concat('OP-',prmstrNumero,'/',YEAR(CURDATE())), c.Monto, idProducto,Usuario,CURDATE(),1, idCentroCosto, idClienteProveedor,CURDATE() 
FROM Cotizacion c
WHERE c.idCotizacion = idCotizacion;

UPDATE NumeroOP n
SET n.Numero = prmintNumero
WHERE n.Ano = year(curdate()) and n.idTipoOrdenProduccion = 1 ;


ELSEIF error > 0 THEN
	SIGNAL SQLSTATE '45000'
	SET MESSAGE_TEXT = 'Esta Cotizacion ya cuenta con OP';
END IF;


end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `uspUpdAprobarOrdenCompra` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `uspUpdAprobarOrdenCompra`(IN idOrdenCompra INT, Usuario VARCHAR(20))
UPDATE OrdenCompra o
SET o.Estado = 'Aprobado'
,o.UsuarioModificacion = Usuario
,o.FechaModificacion = CURDATE()
WHERE o.idOrdenCompra = idOrdenCompra ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `uspUpdAsiento` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `uspUpdAsiento`(idAsiento INT, Periodo varchar(20),idSubdiario INT,Fecha datetime,idSucursal int,idMoneda int,tipocambio decimal(4,2),glosa varchar(200),numero varchar(20),xml varchar(4000), usuario VARCHAR(20), idingreso int, idsalida int)
begin

declare i int;
declare nmax int;
set i = 1;
set nmax = ExtractValue(xml, 'count(//DetalleAsiento)'); 

update asiento a
set a.idSubdiario = idSubdiario 
,a.Fecha = Fecha 
,a.idSucursal = idSucursal 
,a.idMoneda = idMoneda 
,a.tipocambio = tipocambio 
,a.glosa = glosa 
,a.usuario = usuario 
,a.fechamodificacion = curdate()
where a.idAsiento = idAsiento;


update detalleAsiento t
set t.activo = 0
where t.idAsiento = idAsiento;

while i <= nmax do
INSERT INTO detalleAsiento(idAsiento
,idCuenta
,idCentroCosto
,CargoMN
,AbonoMN
,CargoME
,AbonoME
,Glosa)
SELECT idAsiento
, ExtractValue(xml, '//DetalleAsiento[$i]/idCuenta')
, ExtractValue(xml, '//DetalleAsiento[$i]/idCentroCosto')
, ExtractValue(xml, '//DetalleAsiento[$i]/CargoMN')
, ExtractValue(xml, '//DetalleAsiento[$i]/AbonoMN')
, ExtractValue(xml, '//DetalleAsiento[$i]/CargoME')
, ExtractValue(xml, '//DetalleAsiento[$i]/AbonoME')
, ExtractValue(xml, '//DetalleAsiento[$i]/Glosa');
SET i=i+1;
end while;



end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `uspUpdCentroCosto` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `uspUpdCentroCosto`(IN IdCentroCosto INT, IN Descripcion VARCHAR(50), IN Codigo VARCHAR(50), Usuario VARCHAR(20))
UPDATE CentroCosto t
SET t.Descripcion = Descripcion
,t.Codigo = Codigo
,t.UsuarioModificacion = Usuario
,t.FechaModificacion = CURDATE()
WHERE t.IdCentroCosto = IdCentroCosto ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `uspUpdClase` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `uspUpdClase`(idclase int, Descripcion varchar(100), Codigo varchar(50), usuario varchar(20))
update clase c
set c.Descripcion = Descripcion 
, c.Codigo = Codigo 
, c.UsuarioModificacion = UsuarioModificacion 
,c.fechamodificacion = fechamodificacion 
where c.idclase = idclase ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `uspUpdClienteProveedor` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `uspUpdClienteProveedor`(IN IdClienteProveedor INT, IN RazonSocial VARCHAR(50), IN Ruc VARCHAR(15), IN Dni VARCHAR(12), IN Telefono1 VARCHAR(20), IN Telefono2 VARCHAR(20), IN Correo VARCHAR(50), IN Contacto VARCHAR(50), IN Usuario VARCHAR(20), IN Direccion VARCHAR(50))
UPDATE ClienteProveedor t
SET t.RazonSocial = RazonSocial
,t.Ruc = Ruc
,t.Dni = Dni
,t.Telefono1 = Telefono1
,t.Telefono2 = Telefono2
,t.Correo = Correo
,t.Contacto = Contacto
,t.UsuarioModificacion = Usuario
,t.FechaModificacion = CURDATE()
,t.Direccion = Direccion
WHERE t.IdClienteProveedor = IdClienteProveedor ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `uspUpdConfiguracion` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `uspUpdConfiguracion`(idConfiguracion integer
,idSubdiario integer
,idFamilia integer
,Descripcion text, usuario text,xml text)
begin

declare i int;
declare nmax int;
set i = 1;
set nmax = ExtractValue(xml, 'count(//DetalleConfiguracion)'); 

update Configuracion t
set t.idSubdiario = idSubdiario 
,t.idFamilia = idFamilia 
,t.Descripcion = Descripcion 
,t.UsuarioModificacion = usuario
,t.FechaModificacion = curdate()
where t.idConfiguracion = idConfiguracion;

update detalleConfiguracion t
set t.activo = 0
where t.idConfiguracion = idConfiguracion;

while i <= nmax do
INSERT INTO detalleConfiguracion(idConfiguracion
,idCuenta
,idCentroCosto
,Cargo)
SELECT idConfiguracion
, ExtractValue(xml, '//DetalleConfiguracion[$i]/idCuenta')
, ExtractValue(xml, '//DetalleConfiguracion[$i]/idCentroCosto')
, cast_to_bit(ExtractValue(xml, '//DetalleConfiguracion[$i]/Cargo'));
SET i=i+1;
end while;


end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `uspUpdConfiguracionAlmacen` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `uspUpdConfiguracionAlmacen`(idConfiguracionAlmacen int,idFamilia int, Descripcion text, idCuentaExistencias int, idCuentaCompras int, idCuentaVariacionExistencias int, idCuentaTransferencia int, idCuentaProducto int, idCuentaVariacionProducto int,usuario text,xml text)
begin

declare i int;
declare nmax int;
set i = 1;
set nmax = ExtractValue(xml, 'count(//DetalleConfiguracionAlmacen)'); 

update ConfiguracionAlmacen t
set t.idFamilia = idFamilia 
,t.idCuentaExistencias = idCuentaExistencias 
,t.idCuentaCompras = idCuentaCompras 
,t.idCuentaVariacionExistencias = idCuentaVariacionExistencias 
,t.idCuentaTransferencia = idCuentaTransferencia 
,t.idCuentaProducto = idCuentaProducto 
,t.idCuentaVariacionProducto = idCuentaVariacionProducto 
,t.Descripcion = Descripcion 
,t.UsuarioModificacion = usuario
,t.FechaModificacion = curdate()
where t.idConfiguracionAlmacen = idConfiguracionAlmacen;

update detalleConfiguracionAlmacen t
set t.activo = 0
where t.idConfiguracionAlmacen = idConfiguracionAlmacen;

while i <= nmax do
INSERT INTO detalleConfiguracionAlmacen(idConfiguracionAlmacen,idcentrocosto,idcuenta)
SELECT idConfiguracionAlmacen, ExtractValue(xml, '//DetalleConfiguracionAlmacen[$i]/IdCentroCosto'), ExtractValue(xml, '//DetalleConfiguracionAlmacen[$i]/IdCuenta');
SET i=i+1;
end while;


end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `uspUpdConfiguracionCuenta` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `uspUpdConfiguracionCuenta`(idConfiguracionCuenta int, idcuenta int, descripcion text, IdTipoConfiguracionCuenta int, ExigeCC bit, IdClase int, IdNaturaleza int, IdMoneda int, IdTipoAuxiliar int, IdAjuste int, IdTipoCambioCuenta int, idcuentacargo int, IdCuentaabono int, usuario text)
update ConfiguracionCuenta t
set t.idcuenta = idcuenta 
,t.descripcion = descripcion 
,t.IdTipoConfiguracionCuenta = IdTipoConfiguracionCuenta 
,t.ExigeCC = ExigeCC 
,t.IdClase = IdClase 
,t.IdNaturaleza = IdNaturaleza 
,t.IdMoneda = IdMoneda 
,t.IdTipoAuxiliar = IdTipoAuxiliar 
,t.IdAjuste = IdAjuste 
,t.IdTipoCambioCuenta = IdTipoCambioCuenta 
,t.IdCuentaabono = IdCuentaabono 
,t.idcuentacargo = idcuentacargo 
,t.usuariomodificacion = usuario 
,t.Fechamodificacion = curdate()
where t.idConfiguracionCuenta = idConfiguracionCuenta ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `uspUpdCotizacion` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `uspUpdCotizacion`(IN IdCotizacion INT, IN IdClienteProveedor INT, IN IdModeloChasis INT, IN Fecha VARCHAR(50), IN NumeroChasis INT, IN NumeroAsientos INT, IN NumeroParabrisas INT, IN Ventanas VARCHAR(50), IN TipoCarroceria VARCHAR(50), IN ColorFondo VARCHAR(50), IN ColorArtes VARCHAR(50), IN ColorOtros VARCHAR(50), IN Observaciones VARCHAR(50), IN Usuario VARCHAR(20), IN xml VARCHAR(4000), IN xmlCaracteristicas VARCHAR(4000),IN Monto DECIMAL(9,3), idProducto INT, idCentroCosto INT)
begin
declare i int;
declare nmax int;
declare nmaxCaracteristicas int;
declare id int;
declare lastid int;
declare prmintSerie INT;
declare NumSerie VARCHAR(6);
set i = 1;
set nmax = ExtractValue(xml, 'count(//CotizacionProducto)'); 
set nmaxCaracteristicas = ExtractValue(xmlCaracteristicas, 'count(//CotizacionCaracteristicas)'); 

UPDATE Cotizacion c
SET c.IdClienteProveedor = IdClienteProveedor
,c.IdModeloChasis = IdModeloChasis
,c.Fecha = Fecha
,c.NumeroChasis = NumeroChasis
,c.NumeroAsientos = NumeroAsientos
,c.NumeroParabrisas = NumeroParabrisas
,c.Ventanas = Ventanas
,c.TipoCarroceria = TipoCarroceria
,c.ColorFondo = ColorFondo
,c.ColorArtes = ColorArtes
,c.ColorOtros = ColorOtros
,c.Observaciones = Observaciones
,c.UsuarioModificacion = Usuario
,c.FechaModificacion = CURDATE()
,c.Monto = Monto
,c.idProducto = idProducto
,c.idCentroCosto = idCentroCosto
WHERE c.idCotizacion = idCotizacion;

set lastid = idCotizacion;

UPDATE CotizacionProducto cp
SET cp.Activo = 0
,cp.UsuarioModificacion = Usuario
,cp.FechaModificacion = CURDATE()
WHERE cp.idCotizacion = idCotizacion;

UPDATE CotizacionCaracteristicas cc
SET cc.Activo = 0
,cc.UsuarioModificacion = Usuario
,cc.FechaModificacion = CURDATE()
WHERE cc.idCotizacion = idCotizacion;

while i <= nmax do
INSERT INTO CotizacionProducto(idCotizacion,idProducto,Cantidad,Usuario,FechaRegistro,Precio)
SELECT lastid , ExtractValue(xml, '//CotizacionProducto[$i]/idProducto') ,ExtractValue(xml, '//CotizacionProducto[$i]/Cantidad'),ExtractValue(xml, '//CotizacionProducto[$i]/Usuario'),CURDATE(),ExtractValue(xml, '//CotizacionProducto[$i]/Precio');
SET i=i+1;
end while;

set i = 1;
while i <= nmaxCaracteristicas do
INSERT INTO CotizacionCaracteristicas(idCotizacion, idCaracteristicas, Estado, Valor, Usuario, FechaRegistro)
SELECT lastid, ExtractValue(xmlCaracteristicas, '//CotizacionCaracteristicas[$i]/idCaracteristicas'), ExtractValue(xmlCaracteristicas, '//CotizacionCaracteristicas[$i]/Estado'), ExtractValue(xmlCaracteristicas, '//CotizacionCaracteristicas[$i]/Valor'), Usuario,CURDATE();
SET i=i+1;
end while;

end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `uspUpdCuenta` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `uspUpdCuenta`(IN IdCuenta INT, IN Descripcion VARCHAR(50), IN Codigo VARCHAR(50), Usuario VARCHAR(20))
UPDATE Cuenta t
SET t.Descripcion = Descripcion
,t.Codigo = Codigo
,t.UsuarioModificacion = Usuario
,t.FechaModificacion = curdate()
WHERE t.IdCuenta = IdCuenta ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `uspUpdEmpleado` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `uspUpdEmpleado`(IN IdEmpleado INT, IN Nombre VARCHAR(50), IN DNI VARCHAR(50), IN Direccion VARCHAR(50), IN Codigo VARCHAR(50), IN Telefono1 VARCHAR(50), IN Telefono2 VARCHAR(50), IN Puesto VARCHAR(50), Usuario VARCHAR(20))
UPDATE Empleado t
SET t.Nombre = Nombre
,t.DNI = DNI
,t.Direccion = Direccion
,t.Codigo = Codigo
,t.Telefono1 = Telefono1
,t.Telefono2 = Telefono2
,t.Puesto = Puesto
,t.UsuarioModificacion = Usuario
,t.FechaModificacion = CURDATE()
WHERE t.IdEmpleado = IdEmpleado ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `uspUpdFactura` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `uspUpdFactura`(IN IdFactura INT, IN Periodo VARCHAR(50), IN Numero VARCHAR(50), IN IdPuntoVenta INT, IN IdTipoVenta INT, IN IdCotizacion INT, IN IdOrdenProduccion INT, IN IdClienteProveedor INT, IN DCliente VARCHAR(50), IN DocumentoIdentidad VARCHAR(50), IN IdTipoDocumento INT, IN Serie VARCHAR(50), IN NumeroDocumento VARCHAR(50), IN Fecha VARCHAR(50), IN TipoCambio DECIMAL(8,2), IN IdFormaPago INT, IN FechaVencimiento VARCHAR(50), IN IdMoneda INT, IN Glosa VARCHAR(50), IN Igv DECIMAL(8,2), IN DPercepcion DECIMAL(8,2), IN IdPercepcion INT, IN IdServicio INT, IN Referencia VARCHAR(50), IN SerieGuia VARCHAR(50), IN NumeroGuia VARCHAR(50), IN Documento VARCHAR(50), IN Aplicar BIT, IN Importe DECIMAL(8,2), IN CotizacionOP VARCHAR(50), Usuario VARCHAR(20), xml VARCHAR(4000))
begin

declare lastid int;
declare i int;
declare nmax int;

set i = 1;
set nmax = ExtractValue(xml, 'count(//DetalleFactura)'); 


UPDATE Factura t
SET t.IdPuntoVenta = IdPuntoVenta
,t.IdTipoVenta = IdTipoVenta
,t.IdCotizacion = nullif(IdCotizacion,0) 
,t.IdOrdenProduccion = nullif(IdOrdenProduccion,0)
,t.IdClienteProveedor = IdClienteProveedor
,t.DCliente = DCliente
,t.DocumentoIdentidad = DocumentoIdentidad
,t.IdTipoDocumento = IdTipoDocumento
,t.Serie = Serie
,t.NumeroDocumento = NumeroDocumento
,t.Fecha = Fecha
,t.TipoCambio = TipoCambio
,t.IdFormaPago = IdFormaPago
,t.FechaVencimiento = FechaVencimiento
,t.IdMoneda = IdMoneda
,t.Glosa = Glosa
,t.Igv = Igv
,t.DPercepcion = DPercepcion
,t.IdServicio = IdServicio
,t.Referencia = Referencia
,t.SerieGuia = SerieGuia
,t.NumeroGuia = NumeroGuia
,t.Documento = Documento
,t.Aplicar = Aplicar
,t.Importe = Importe
,t.CotizacionOP = CotizacionOP
,t.UsuarioModificacion = Usuario
,t.FechaModificacion = curdate()
WHERE t.IdFactura = IdFactura;

update detalleFactura t
set t.activo = 0
,t.UsuarioModificacion = Usuario
,t.FechaModificacion = curdate()
where t.idfactura = idfactura;

while i <= nmax do
INSERT INTO detalleFactura(idFactura,idProducto,Cantidad,Precio,SubTotal,Usuario,FechaRegistro)
SELECT IdFactura, ExtractValue(xml, '//DetalleFactura[$i]/IdProducto') , ExtractValue(xml, '//DetalleFactura[$i]/Cantidad'), ExtractValue(xml, '//DetalleFactura[$i]/Precio'), ExtractValue(xml, '//DetalleFactura[$i]/SubTotal'), Usuario, CURDATE();
SET i=i+1;
end while;


END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `uspUpdFamilia` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `uspUpdFamilia`(IN IdFamilia INT, IN Descripcion VARCHAR(50), IN Codigo VARCHAR(5), IN Usuario VARCHAR(20), idCuenta INT)
UPDATE Familia t
SET t.Descripcion = Descripcion
,t.Codigo = Codigo
,t.idCuenta = idCuenta
,t.UsuarioModificacion = Usuario
,t.FechaModificacion = CURDATE()
WHERE t.IdFamilia = IdFamilia ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `uspUpdGenerarPedido` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `uspUpdGenerarPedido`(OUT idPedido INT,idCentroCosto INT,idOrdenProduccion INT ,idEmpleado INT ,Estado VARCHAR(20),Numero VARCHAR(20),Fecha DATETIME, Usuario VARCHAR(20), xml VARCHAR(4000), Observaciones VARCHAR(200))
begin

DECLARE error INT DEFAULT 0;
DECLARE specialty CONDITION FOR SQLSTATE '45000';
declare i int;
declare nmax int;
declare lastid int;
declare prmintNumero INT;
declare prmstrNumero VARCHAR(20);

SET ERROR = (SELECT COUNT(*) FROM OrdenProduccion o WHERE o.idOrdenProduccion = idOrdenProduccion AND o.PedidoGenerado = 1 LIMIT 1);

IF error = 0 THEN

set i = 1;
set nmax = ExtractValue(xml, 'count(//PedidoProducto)'); 
set prmintNumero = (SELECT n.Numero FROM NumeroPE n WHERE n.Ano = year(curdate()) LIMIT 1);
set prmintNumero = prmintNumero + 1;

CASE length(prmintNumero)
    WHEN 1 THEN SET prmstrNumero = CONCAT('00000',prmintNumero);
    WHEN 2 THEN SET prmstrNumero = CONCAT('0000',prmintNumero);
	WHEN 3 THEN SET prmstrNumero = CONCAT('000',prmintNumero);
	WHEN 4 THEN SET prmstrNumero = CONCAT('00',prmintNumero);
	WHEN 5 THEN SET prmstrNumero = CONCAT('0',prmintNumero);    
	ELSE SET prmstrNumero = prmintNumero;
END CASE;


INSERT INTO Pedido(idCentroCosto,idOrdenProduccion,idEmpleado,Numero,Fecha,Usuario,FechaRegistro, Observaciones)
SELECT idCentroCosto,idOrdenProduccion,case idEmpleado when 0 then null else idEmpleado end,CONCAT('PE-',prmstrNumero,'/',year(curdate())),Fecha,Usuario,CURDATE(), Observaciones;

SET lastid = LAST_INSERT_ID();
SET idPedido = lastid;

UPDATE NumeroPE n
SET Numero = prmintNumero
WHERE n.Ano = year(curdate());

while i <= nmax do
INSERT INTO PedidoProducto(idPedido,idProducto,Cantidad,Glosa,Usuario,FechaRegistro)
SELECT lastid, ExtractValue(xml, '//PedidoProducto[$i]/idProducto'), ExtractValue(xml, '//PedidoProducto[$i]/Cantidad'), ExtractValue(xml, '//PedidoProducto[$i]/Glosa'),Usuario,CURDATE();
SET i=i+1;
end while;


UPDATE OrdenProduccion o
SET o.PedidoGenerado = 1
,o.UsuarioModificacion = Usuario
,o.FechaModificacion = CURDATE()
WHERE o.idOrdenProduccion = idOrdenProduccion;


ELSEIF error > 0 THEN
	SIGNAL SQLSTATE '45000'
	SET MESSAGE_TEXT = 'Esta Orden de produccion ya tiene un pedido generado';
END IF;

end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `uspUpdGuia` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `uspUpdGuia`(idGuia INT, Periodo VARCHAR(50), IN Numero VARCHAR(50), IN Fecha VARCHAR(50), IN TipoCambio DECIMAL(8,2), IN Serie VARCHAR(50), IN NumeroDocumento VARCHAR(50), IN IdTipoMovimiento INT, IN Referencia VARCHAR(50), IN IdOrdenProduccion INT, IN IdClienteProveedor INT, IN IdAlmacen INT, IN Observaciones VARCHAR(50), Usuario VARCHAR(20), xml VARCHAR(4000))
begin

declare i int;
declare nmax int;

set i = 1;
set nmax = ExtractValue(xml, 'count(//DetalleGuia)'); 

UPDATE Guia t
SET t.Periodo = Periodo
,t.Fecha = Fecha
,t.TipoCambio = TipoCambio
,t.Serie = Serie
,t.NumeroDocumento = NumeroDocumento
,t.IdTipoMovimiento = IdTipoMovimiento
,t.Referencia = Referencia
,t.IdOrdenProduccion = IdOrdenProduccion
,t.IdClienteProveedor = IdClienteProveedor
,t.IdAlmacen = IdAlmacen
,t.Observaciones = Observaciones
,t.UsuarioModificacion = Usuario
,t.FechaModificacion = curdate()
WHERE t.idGuia = idGuia;


update detalleguia t
set t.activo = 0
,t.UsuarioModificacion = Usuario
,t.FechaModificacion = curdate()
where t.idguia = idguia;

while i <= nmax do
INSERT INTO detalleguia(idguia,idProducto,Cantidad,Precio,SubTotal,Usuario,FechaRegistro)
SELECT Idguia, ExtractValue(xml, '//DetalleGuia[$i]/IdProducto') , ExtractValue(xml, '//DetalleGuia[$i]/Cantidad'), ExtractValue(xml, '//DetalleGuia[$i]/Precio'), ExtractValue(xml, '//DetalleGuia[$i]/SubTotal'), Usuario, CURDATE();
SET i=i+1;
end while;


end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `uspUpdIGV` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `uspUpdIGV`(IN idIGV INT, IN Valor DECIMAL(6,3), IN Usuario VARCHAR(20))
UPDATE IGV t
SET t.Valor = Valor
,t.FechaModificacion = curdate()
,t.UsuarioModificacion = UsuarioModificacion
WHERE t.idIGV = idIGV ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `uspUpdInactivaractividad` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `uspUpdInactivaractividad`(idactividad int)
update actividad c
set c.Activo = 0
, c.UsuarioModificacion = UsuarioModificacion 
,c.fechamodificacion = fechamodificacion 
where c.idactividad = idactividad ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `uspUpdInactivarajuste` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `uspUpdInactivarajuste`(idajuste int)
update ajuste c
set c.Activo = 0
, c.UsuarioModificacion = UsuarioModificacion 
,c.fechamodificacion = fechamodificacion 
where c.idajuste = idajuste ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `uspUpdInactivarAlmacen` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `uspUpdInactivarAlmacen`(IN IdAlmacen INT, IN Usuario VARCHAR(20))
UPDATE Almacen t
SET t.Activo = 0
,t.UsuarioModificacion = Usuario
,t.FechaModificacion = CURDATE()
WHERE t.IdAlmacen = IdAlmacen ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `uspUpdInactivarAporte` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `uspUpdInactivarAporte`(IN idAporte INT, Usuario VARCHAR(20))
UPDATE Aporte t
SET t.Activo = 0
,t.FechaModificacion = FechaModificacion
,t.UsuarioModificacion = Usuario
WHERE t.idAporte = idAporte ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `uspUpdInactivarAsiento` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `uspUpdInactivarAsiento`(IN IdAsiento INT, IN Usuario VARCHAR(20))
UPDATE Asiento t
SET t.Activo = 0
,t.UsuarioModificacion = Usuario
,t.FechaModificacion = CURDATE()
WHERE t.IdAsiento = IdAsiento ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `uspUpdInactivarCentroCosto` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `uspUpdInactivarCentroCosto`(IN IdCentroCosto INT, Usuario VARCHAR(20))
UPDATE CentroCosto t
SET t.Activo = 0
,t.UsuarioModificacion = Usuario
,t.FechaModificacion = CURDATE()
WHERE t.IdCentroCosto = IdCentroCosto ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `uspUpdInactivarClase` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `uspUpdInactivarClase`(idclase int)
update clase c
set c.Activo = 0
, c.UsuarioModificacion = UsuarioModificacion 
,c.fechamodificacion = fechamodificacion 
where c.idclase = idclase ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `uspUpdInactivarClienteProveedor` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `uspUpdInactivarClienteProveedor`(IN IdClienteProveedor INT, IN Usuario VARCHAR(20))
UPDATE ClienteProveedor t
SET t.Activo = 0
,t.UsuarioModificacion = Usuario
,t.FechaModificacion = CURDATE()
WHERE t.IdClienteProveedor = IdClienteProveedor ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `uspUpdInactivarConfiguracion` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `uspUpdInactivarConfiguracion`(idConfiguracion int,usuario text)
update Configuracion t
set t.Activo = 0
,t.UsuarioModificacion = usuario
,t.FechaModificacion = curdate()
where t.idConfiguracion = idConfiguracion ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `uspUpdInactivarConfiguracionAlmacen` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `uspUpdInactivarConfiguracionAlmacen`(idConfiguracionAlmacen int,usuario text)
update ConfiguracionAlmacen t
set t.Activo = 0
,t.UsuarioModificacion = usuario
,t.FechaModificacion = curdate()
where t.idConfiguracionAlmacen = idConfiguracionAlmacen ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `uspUpdInactivarCotizacion` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `uspUpdInactivarCotizacion`(IN idCotizacion INT, IN Usuario VARCHAR(20))
UPDATE Cotizacion c
SET c.Activo = 0
,c.UsuarioModificacion = Usuario
,c.FechaModificacion = CURDATE()
WHERE c.idCotizacion = idCotizacion ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `uspUpdInactivarCuenta` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `uspUpdInactivarCuenta`(IN IdCuenta INT, Usuario VARCHAR(20))
UPDATE Cuenta t
SET t.Activo = 0
,t.UsuarioModificacion = Usuario
,t.FechaModificacion = CURDATE()
WHERE t.IdCuenta = IdCuenta ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `uspUpdInactivarEmpleado` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `uspUpdInactivarEmpleado`(IN IdEmpleado INT, Usuario VARCHAR(20))
UPDATE Empleado t
SET t.Activo = 0
,t.UsuarioModificacion = Usuario
,t.FechaModificacion = CURDATE()
WHERE t.IdEmpleado = IdEmpleado ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `uspUpdInactivarFactura` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `uspUpdInactivarFactura`(IN IdFactura INT)
UPDATE Factura t
SET t.Activo = 0
WHERE t.IdFactura = IdFactura ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `uspUpdInactivarFamilia` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `uspUpdInactivarFamilia`(IN IdFamilia INT, IN Usuario VARCHAR(20))
UPDATE Familia t
SET t.Activo = 0
,t.UsuarioModificacion = Usuario
,t.FechaModificacion = CURDATE()
WHERE t.IdFamilia = IdFamilia ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `uspUpdInactivarGuia` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `uspUpdInactivarGuia`(IN IdGuia INT)
UPDATE Guia t
SET t.Activo = 0
WHERE t.IdGuia = IdGuia ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `uspUpdInactivarIngreso` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `uspUpdInactivarIngreso`(IN IdIngreso INT, IN Usuario VARCHAR(20))
begin
call uspUpdInactivarAsiento((select coalesce(a.idasiento,0) from asiento a where a.idingreso = idingreso limit 1), Usuario);
UPDATE Ingreso t
SET t.Activo = 0
,t.UsuarioModificacion = Usuario
,t.FechaModificacion = CURDATE()
WHERE t.IdIngreso = IdIngreso;
end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `uspUpdInactivarListaPrecio` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `uspUpdInactivarListaPrecio`(IN IdListaPrecio INT, IN Usuario VARCHAR(20))
UPDATE ListaPrecio t
SET t.Activo = 0
,t.UsuarioModificacion = Usuario
,t.FechaModificacion = CURDATE()
WHERE t.IdListaPrecio = IdListaPrecio ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `uspUpdInactivarNaturaleza` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `uspUpdInactivarNaturaleza`(idNaturaleza int)
update Naturaleza c
set c.Activo = 0
, c.UsuarioModificacion = UsuarioModificacion 
,c.fechamodificacion = fechamodificacion 
where c.idNaturaleza = idNaturaleza ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `uspUpdInactivarPercepcion` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `uspUpdInactivarPercepcion`(IN idPercepcion INT, Usuario VARCHAR(20))
UPDATE Percepcion t
SET t.Activo = 0
,t.FechaModificacion = curdate()
,t.UsuarioModificacion = Usuario
WHERE t.idPercepcion = idPercepcion ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `uspUpdInactivarProducto` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `uspUpdInactivarProducto`(IN idProducto INT, IN Usuario VARCHAR(20))
begin
UPDATE Producto p
SET p.Activo = 0
,p.UsuarioModificacion = Usuario
,p.FechaModificacion = CURDATE()
WHERE p.idProducto = idProducto;
end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `uspUpdInactivarPuntoVenta` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `uspUpdInactivarPuntoVenta`(IN IdPuntoVenta INT, Usuario VARCHAR(20))
UPDATE PuntoVenta t
SET t.Activo = 0
,t.UsuarioModificacion = Usuario
,t.FechaModificacion = curdate()
WHERE t.IdPuntoVenta = IdPuntoVenta ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `uspUpdInactivarRenta` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `uspUpdInactivarRenta`(IN idRenta INT, Usuario VARCHAR(20))
UPDATE Renta t
SET t.Activo = 0
,t.FechaModificacion = curdate()
,t.UsuarioModificacion = Usuario
WHERE t.idRenta = idRenta ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `uspUpdInactivarSalida` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `uspUpdInactivarSalida`(IN IdSalida INT, IN Usuario VARCHAR(20))
begin
call uspUpdInactivarAsiento((select coalesce(a.idasiento,0) from asiento a where a.idsalida = idsalida limit 1), Usuario);
UPDATE Salida t
SET t.Activo = 0
,t.UsuarioModificacion = Usuario
,t.FechaModificacion = CURDATE()
WHERE t.IdSalida = IdSalida;
end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `uspUpdInactivarServicio` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `uspUpdInactivarServicio`(IN IdServicio INT,Usuario VARCHAR(20))
UPDATE Servicio t
SET t.Activo = 0
,t.UsuarioModificacion = Usuario
,t.FechaModificacion = curdate()
WHERE t.IdServicio = IdServicio ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `uspUpdInactivarSubdiario` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `uspUpdInactivarSubdiario`(IN idSubdiario INT)
UPDATE Subdiario t
SET t.Activo = 0
WHERE t.idSubdiario = idSubdiario ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `uspUpdInactivarSucursal` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `uspUpdInactivarSucursal`(IN IdSucursal INT, IN Usuario VARCHAR(20))
UPDATE Sucursal t
SET t.Activo = 0
,t.UsuarioModificacion = Usuario
,t.FechaModificacion = CURDATE()
WHERE t.IdSucursal = IdSucursal ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `uspUpdInactivarTareo` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `uspUpdInactivarTareo`(idtareo int,usuario text)
update tareo t
set t.activo = 0
,t.usuariomodificacion = usuario 
,t.fechamodificacion = curdate()
where t.idtareo = idtareo ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `uspUpdInactivarTasa` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `uspUpdInactivarTasa`(IN idTasa INT, Usuario VARCHAR(20))
UPDATE Tasa t
SET t.Activo = 0
,t.FechaModificacion = curdate()
,UsuarioModificacion = Usuario
WHERE t.idTasa = idTasa ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `uspUpdInactivarTipoAdquisicion` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `uspUpdInactivarTipoAdquisicion`(IN idTipoAdquisicion INT, Usuario VARCHAR(20))
UPDATE TipoAdquisicion t
SET t.Activo = 0
,t.FechaModificacion = curdate()
,t.UsuarioModificacion = Usuario
WHERE t.idTipoAdquisicion = idTipoAdquisicion ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `uspUpdInactivartipoauxiliar` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `uspUpdInactivartipoauxiliar`(idtipoauxiliar int)
update tipoauxiliar c
set c.Activo = 0
, c.UsuarioModificacion = UsuarioModificacion 
,c.fechamodificacion = fechamodificacion 
where c.idtipoauxiliar = idtipoauxiliar ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `uspUpdInactivarTipoCambio` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `uspUpdInactivarTipoCambio`(idTipoCambio INT, usuario varchar(20))
begin
Update tipocambio t
set t.Activo = 0
,t.usuariomodificacion = usuario
,t.fechamodificacion = curdate()
where t.idTipoCambio = idTipoCambio;
end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `uspUpdInactivartipocambiocuenta` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `uspUpdInactivartipocambiocuenta`(idtipocambiocuenta int)
update tipocambiocuenta c
set c.Activo = 0
, c.UsuarioModificacion = UsuarioModificacion 
,c.fechamodificacion = fechamodificacion 
where c.idtipocambiocuenta = idtipocambiocuenta ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `uspUpdInactivarTipoCompra` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `uspUpdInactivarTipoCompra`(IN idTipoCompra INT, Usuario VARCHAR(20))
UPDATE TipoCompra t
SET t.Activo = 0
,t.FechaModificacion = curdate()
,t.UsuarioModificacion = Usuario
WHERE t.idTipoCompra = idTipoCompra ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `uspUpdInactivartipoconfiguracioncuenta` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `uspUpdInactivartipoconfiguracioncuenta`(idtipoconfiguracioncuenta int)
update tipoconfiguracioncuenta c
set c.Activo = 0
, c.UsuarioModificacion = UsuarioModificacion 
,c.fechamodificacion = fechamodificacion 
where c.idtipoconfiguracioncuenta = idtipoconfiguracioncuenta ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `uspUpdInactivarTipoDocumento` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `uspUpdInactivarTipoDocumento`(IN IdTipoDocumento INT, Usuario VARCHAR(20))
UPDATE TipoDocumento t
SET t.Activo = 0
,t.Usuario = Usuario
,t.FechaModificacion = curdate()
WHERE t.IdTipoDocumento = IdTipoDocumento ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `uspUpdInactivarTipoMovimiento` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `uspUpdInactivarTipoMovimiento`(IN IdTipoMovimiento INT, IN Usuario VARCHAR(20))
UPDATE TipoMovimiento t
SET t.Activo = 0
,t.UsuarioModificacion = Usuario
,t.FechaModificacion = CURDATE()
WHERE t.IdTipoMovimiento = IdTipoMovimiento ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `uspUpdInactivarTipoProducto` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `uspUpdInactivarTipoProducto`(IN idTipoProducto INT)
UPDATE TipoProducto t
SET t.Activo = 0
WHERE t.idTipoProducto = idTipoProducto ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `uspUpdInactivarTipoVenta` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `uspUpdInactivarTipoVenta`(IN IdTipoVenta INT, Usuario VARCHAR(20))
UPDATE TipoVenta t
SET t.Activo = 0
,t.Usuario = Usuario
,t.FechaModificacion = CURDATE()
WHERE t.IdTipoVenta = IdTipoVenta ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `uspUpdInactivarUsuario` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `uspUpdInactivarUsuario`(IN idUsuario INT)
UPDATE Usuario t
SET t.Activo = 0
WHERE t.idUsuario = idUsuario ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `uspUpdIngreso` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `uspUpdIngreso`(idIngreso INT,IN IdAlmacen INT, IN IdTipoMovimiento INT, IN IdOrdenCompra INT, IN IdClienteProveedor INT, IN IdMoneda INT, IN Fecha VARCHAR(50), IN Numero VARCHAR(50), IN TipoCambio DECIMAL(8,2), IN GuiaRemision VARCHAR(50), IN FacturaProveedor VARCHAR(50), IN FechaDocumento VARCHAR(50), IN ProvisionCompra VARCHAR(50), IN TipoCambioMoneda DECIMAL(8,2), IN Monto DECIMAL(8,2), IN Observaciones VARCHAR(50),Usuario VARCHAR(20), xml VARCHAR(4000), idsubdiario int)
BEGIN 
declare i INT;
declare nmax INT;
declare lastid INT;
declare prmintCantidad INT;
declare idasiento INT;
declare periodo varchar(20);

set i = 1;
set nmax = ExtractValue(xml, 'count(//IngresoProducto)'); 

UPDATE Ingreso i
SET i.IdAlmacen = idAlmacen
,i.IdTipoMovimiento = idTipoMovimiento
,i.IdOrdenCompra = idOrdenCompra
,i.IdClienteProveedor = idClienteProveedor
,i.IdMoneda = idMoneda
,i.Fecha = Fecha
,i.TipoCambio = TipoCambio
,i.GuiaRemision = GuiaRemision
,i.FacturaProveedor = FacturaProveedor
,i.FechaDocumento = FechaDocumento
,i.ProvisionCompra = ProvisionCompra
,i.TipoCambioMoneda = TipoCambioMoneda
,i.Monto = Monto
,i.Observaciones = Observaciones
,i.UsuarioModificacion = Usuario
,i.FechaModificacion = CURDATE()
,i.idsubdiario = idsubdiario
WHERE i.idIngreso = idIngreso;


UPDATE Stock s
INNER JOIN Ingreso i on s.idAlmacen = i.idAlmacen 
INNER JOIN IngresoProducto ip on i.idIngreso = ip.idIngreso and ip.Activo = 1
INNER JOIN Almacen a on a.idAlmacen = s.idAlmacen
INNER JOIN Producto p on p.idProducto = s.idProducto
SET S.Cantidad = s.Cantidad - ip.Cantidad
WHERE i.IdIngreso = idIngreso and s.idProducto = ip.idProducto;

UPDATE IngresoProducto ip
SET ip.Activo = 0
,UsuarioModificacion = Usuario
,FechaModificacion = CURDATE()
WHERE ip.idIngreso = idIngreso and ip.Activo = 1;



-- para el asiento----------------
set idasiento = (select coalesce(a.idasiento,0) from asiento a where a.idIngreso = idIngreso limit 1);
call uspUpdAsiento(idasiento, '',idSubdiario,Fecha,null,idMoneda,tipocambio,'','','<root></root>', usuario,idIngreso,null);



while i <= nmax do
INSERT INTO IngresoProducto(idIngreso,idProducto,idCentroCosto,Cantidad,Precio,Importe,Usuario,FechaRegistro)
SELECT idIngreso, ExtractValue(xml, '//IngresoProducto[$i]/idProducto'), ExtractValue(xml, '//IngresoProducto[$i]/idCentroCosto'), ExtractValue(xml, '//IngresoProducto[$i]/Cantidad'), ExtractValue(xml, '//IngresoProducto[$i]/Precio'), ExtractValue(xml, '//IngresoProducto[$i]/Importe'),Usuario,CURDATE();

set prmintCantidad = (SELECT s.Cantidad FROM Stock s WHERE s.idAlmacen = idAlmacen and s.idProducto = ExtractValue(xml, '//IngresoProducto[$i]/idProducto'));
set prmintCantidad = prmintCantidad + ExtractValue(xml, '//IngresoProducto[$i]/Cantidad');

UPDATE Stock s
SET s.Cantidad = prmintCantidad
,s.UsuarioModificacion = Usuario
,s.FechaModificacion = CURDATE()
WHERE s.idAlmacen = idAlmacen and s.idProducto = ExtractValue(xml, '//IngresoProducto[$i]/idProducto');


-- detalle asiento---------------
update detalleasiento d
set d.activo = 0
where d.idAsiento = idAsiento;
INSERT INTO detalleasiento(idAsiento,idCentroCosto,idCuenta,CargoMN,AbonoMN,CargoME,AbonoME,Glosa)
select idAsiento, dc.idcentrocosto
,dc.idcuenta
,(case dc.cargo when 1 then ExtractValue(xml, '//IngresoProducto[$i]/Importe') else 0 end) as CargoMN 
,(case dc.cargo when 1 then 0 else ExtractValue(xml, '//IngresoProducto[$i]/Importe') end) as AbonoMN
,(case dc.cargo when 1 then ExtractValue(xml, '//IngresoProducto[$i]/Importe')*3.2 else 0 end) as CargoME 
,(case dc.cargo when 1 then 0 else ExtractValue(xml, '//IngresoProducto[$i]/Importe')*3.2 end) as AbonoME
, 'comentario del subdiario' as Glosa
from configuracion c
inner join detalleconfiguracion dc on dc.idconfiguracion = c.idconfiguracion
where dc.activo = 1 and c.idsubdiario = idsubdiario and c.idfamilia = (select p.idfamilia from producto p where p.idproducto = ExtractValue(xml, '//IngresoProducto[$i]/idProducto'))
;




SET i=i+1;
end while;


END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `uspUpdListaPrecio` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `uspUpdListaPrecio`(IN IdListaPrecio INT, IN IdProducto INT, IN Precio DECIMAL(9,3), IN TipoCambio DECIMAL(6,3), IN Fecha VARCHAR(50), IN Estado BIT, IN Usuario VARCHAR(20))
    NO SQL
begin

IF Estado = 1 THEN

UPDATE ListaPrecio t
SET t.Estado = 0
,t.UsuarioModificacion = Usuario
,t.FechaModificacion = CURDATE()
WHERE t.idProducto = idProducto;

UPDATE ListaPrecio t
SET t.IdProducto = IdProducto
,t.Precio = Precio
,t.TipoCambio = TipoCambio
,t.Fecha = Fecha
,t.Estado = Estado
,t.UsuarioModificacion = Usuario
,t.FechaModificacion = CURDATE()
WHERE t.IdListaPrecio = IdListaPrecio;

ELSEIF Estado = 0 THEN

UPDATE ListaPrecio t
SET t.IdProducto = IdProducto
,t.Precio = Precio
,t.TipoCambio = TipoCambio
,t.Fecha = Fecha
,t.Estado = Estado
,t.UsuarioModificacion = Usuario
,t.FechaModificacion = CURDATE()
WHERE t.IdListaPrecio = IdListaPrecio;
	
END IF;

end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `uspUpdNaturaleza` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `uspUpdNaturaleza`(idNaturaleza int, Descripcion varchar(100), Codigo varchar(50), usuario varchar(20))
update Naturaleza c
set c.Descripcion = Descripcion 
, c.Codigo = Codigo 
, c.UsuarioModificacion = UsuarioModificacion 
,c.fechamodificacion = fechamodificacion 
where c.idNaturaleza = idNaturaleza ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `uspUpdOrdenCompra` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `uspUpdOrdenCompra`(IN idOrdenCompra INT,idSucursal INT,idFormaPago INT, idMoneda INT,idClienteProveedor INT,Fecha DATETIME,TipoCambio DECIMAL(6,3),FechaEntrega DATETIME,Observaciones VARCHAR(200),IGV DECIMAL(6,3),Subtotal DECIMAL(6,3),Total DECIMAL(9,3),IN Usuario VARCHAR(20), IN xml VARCHAR(4000), Afecto BIT)
begin
declare error int;
declare i int;
declare nmax int;

set nmax = ExtractValue(xml, 'count(//OrdenCompraProducto)'); 

UPDATE OrdenCompra oc
SET oc.idSucursal = idSucursal
,oc.idFormaPago = idFormaPago
,oc.idMoneda = idMoneda
,oc.idClienteProveedor = idClienteProveedor
,oc.Fecha = Fecha
,oc.TipoCambio = TipoCambio
,oc.FechaEntrega = FechaEntrega
,oc.Observaciones = Observaciones
,oc.IGV = IGV
,oc.Subtotal = Subtotal
,oc.Total = Total
,oc.UsuarioModificacion = Usuario
,oc.FechaModificacion = CURDATE()
,oc.Afecto = Afecto
WHERE oc.idOrdenCompra = idOrdenCompra;


UPDATE OrdenCompraProducto o
SET o.Activo = 0
,o.UsuarioModificacion = Usuario
,o.FechaModificacion = CURDATE()
WHERE o.idOrdenCompra = idOrdenCompra;

set i = 1;
while i <= nmax do
INSERT INTO OrdenCompraProducto(idOrdenCompra,idProducto,Cantidad,PrecioUnitario,Descuento,Importe,Glosa,Usuario,FechaRegistro)
SELECT idOrdenCompra, ExtractValue(xml, '//OrdenCompraProducto[$i]/idProducto') ,ExtractValue(xml, '//OrdenCompraProducto[$i]/Cantidad'),ExtractValue(xml, '//OrdenCompraProducto[$i]/PrecioUnitario'), ExtractValue(xml, '//OrdenCompraProducto[$i]/Descuento') ,ExtractValue(xml, '//OrdenCompraProducto[$i]/Importe'),ExtractValue(xml, '//OrdenCompraProducto[$i]/Glosa'),Usuario,CURDATE();
SET i=i+1;
end while;

end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `uspUpdOrdenProduccion` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `uspUpdOrdenProduccion`(idOrdenProduccion INT,idSucursal INT,idProducto INT,Fecha DATETIME,numero VARCHAR(20),FechaInicio DATETIME,FechaTermino DATETIME,Observaciones VARCHAR(200),Monto DECIMAL(9,3),Usuario VARCHAR(20),idCentroCosto INT, idClienteProveedor INT)
UPDATE OrdenProduccion o
set o.idSucursal = idSucursal 
,o.idProducto = idProducto 
,o.Fecha = Fecha 
,o.numero = numero 
,o.FechaInicio = FechaInicio
,o.FechaTermino = FechaTermino
,o.Observaciones = Observaciones
,o.Monto = Monto 
,o.idCentroCosto = idCentroCosto
,o.idClienteProveedor = idClienteProveedor
,o.UsuarioModificacion = Usuario
,o.FechaModificacion = CURDATE()
WHERE o.idOrdenProduccion = idOrdenProduccion ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `uspUpdOrdenServicio` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `uspUpdOrdenServicio`(idOrdenServicio INT,idCentroCosto INT,idFormaPago INT,idMoneda INT,idClienteProveedor INT,Fecha DATETIME,TipoCambio DECIMAL(6,3),FechaEntrega DATETIME,Observaciones VARCHAR(200),IGV DECIMAL(6,3),Subtotal DECIMAL(6,3),Monto DECIMAL(6,3),Numero VARCHAR(20),Usuario VARCHAR(20),xml VARCHAR(4000), idSucursal INT, Afecto BIT)
begin
declare error int;
declare i int;
declare nmax int;

set i = 1;
set nmax = ExtractValue(xml, 'count(//OrdenServicioProducto)'); 

UPDATE OrdenServicio os
SET os.idCentroCosto = idCentroCosto
,os.idFormaPago = idFormaPago 
,os.idMoneda = idMoneda
,os.idClienteProveedor = idClienteProveedor 
,os.Fecha = Fecha 
,os.TipoCambio = TipoCambio 
,os.FechaEntrega = FechaEntrega 
,os.Observaciones = Observaciones 
,os.IGV = IGV 
,os.Subtotal = Subtotal 
,os.Monto = Monto 
,os.idSucursal = idSucursal 
,os.UsuarioModificacion = Usuario
,os.FechaModificacion = CURDATE()
,os.Afecto = Afecto
WHERE os.idOrdenServicio = idOrdenServicio;

UPDATE OrdenServicioProducto osp
SET osp.Activo = 0
,osp.UsuarioModificacion = Usuario
,osp.FechaModificacion = CURDATE()
WHERE osp.idOrdenServicio = idOrdenServicio;

while i <= nmax do
INSERT INTO OrdenServicioProducto(idOrdenServicio,idProducto,idOrdenProduccion,Cantidad,PrecioUnitario,Descuento,Importe,Glosa,Usuario,FechaRegistro)
SELECT idOrdenServicio, ExtractValue(xml, '//OrdenServicioProducto[$i]/idProducto'), ExtractValue(xml, '//OrdenServicioProducto[$i]/idOrdenProduccion'), ExtractValue(xml, '//OrdenServicioProducto[$i]/Cantidad'), ExtractValue(xml, '//OrdenServicioProducto[$i]/PrecioUnitario'), ExtractValue(xml, '//OrdenServicioProducto[$i]/Descuento'), ExtractValue(xml, '//OrdenServicioProducto[$i]/Importe'), ExtractValue(xml, '//OrdenServicioProducto[$i]/Glosa'),Usuario,CURDATE();
SET i=i+1;
end while;


END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `uspUpdPedido` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `uspUpdPedido`(idPedido INT,idCentroCosto INT,idOrdenProduccion INT ,idEmpleado INT ,Estado VARCHAR(20),Numero VARCHAR(20),Fecha DATETIME, Usuario VARCHAR(20), xml VARCHAR(4000), Observaciones VARCHAR(200))
BEGIN
declare i int;
declare nmax int;

set i = 1;
set nmax = ExtractValue(xml, 'count(//PedidoProducto)'); 
 
UPDATE Pedido p
SET p.idCentroCosto = idCentroCosto
,p.idOrdenProduccion = idOrdenProduccion
,p.idEmpleado = idEmpleado
,p.Fecha = Fecha
,p.UsuarioModificacion = Usuario
,p.FechaModificacion = CURDATE()
,p.Observaciones = Observaciones
WHERE p.idPedido = idPedido;


UPDATE PedidoProducto pp
SET pp.Activo = 0
,pp.UsuarioModificacion = Usuario
,pp.FechaModificacion = CURDATE()
WHERE pp.idPedido = idPedido;

while i <= nmax do
INSERT INTO PedidoProducto(idPedido,idProducto,Cantidad,Glosa,Usuario,FechaRegistro)
SELECT idPedido, ExtractValue(xml, '//PedidoProducto[$i]/idProducto'), ExtractValue(xml, '//PedidoProducto[$i]/Cantidad'), ExtractValue(xml, '//PedidoProducto[$i]/Glosa'),Usuario,CURDATE();
SET i=i+1;
end while;


END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `uspUpdPercepcion` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `uspUpdPercepcion`(IN idPercepcion INT, IN Descripcion VARCHAR(50), IN Valor DECIMAL(4,2), Usuario VARCHAR(20))
UPDATE Percepcion t
SET t.Descripcion = Descripcion
,t.Valor = Valor
,t.FechaModificacion = curdate()
,t.UsuarioModificacion = Usuario
WHERE t.idPercepcion = idPercepcion ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `uspUpdPeriodo` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `uspUpdPeriodo`(IN idPeriodo INT, IN Anio INT, IN Mes VARCHAR(50), Usuario VARCHAR(20))
UPDATE Periodo t
SET t.Anio = Anio
,t.Mes = Mes
,t.FechaModificacion = curdate()
,t.UsuarioModificacion = Usuario
WHERE t.idPeriodo = idPeriodo ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `uspUpdProducto` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `uspUpdProducto`(IN idProducto INT, IN idTipoProducto INT, IN Descripcion VARCHAR(50), IN Codigo VARCHAR(3), IN UmCompra DECIMAL(9,3), IN UmConsumo DECIMAL(9,3), IN idUnidadMedidaCompra INT, IN idUnidadMedidaConsumo INT, IN Conversion DECIMAL(9,3) , IN Usuario VARCHAR(20), IN idFamilia INT)
begin
UPDATE Producto p
SET p.Descripcion = Descripcion
,p.Codigo = Codigo
,p.UmCompra = UmCompra
,p.UmConsumo = UmConsumo
,p.idUnidadMedidaCompra = idUnidadMedidaCompra
,p.idUnidadMedidaConsumo = idUnidadMedidaConsumo
,p.Conversion = Conversion
,p.UsuarioModificacion = Usuario
,p.FechaModificacion = CURDATE()
,p.idFamilia = idFamilia
WHERE p.idProducto = idProducto;
end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `uspUpdProvision` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `uspUpdProvision`(idProvision INT, Fecha DATETIME, idOrdenCompra INT, idOrdenServicio INT, ServicioCompra VARCHAR(20), idSucursal INT, idTipoCompra INT, Codigo VARCHAR(20), RazonSocial VARCHAR(100), Ruc VARCHAR(15), Glosa VARCHAR(100), TipoDocumento VARCHAR(5), Serie VARCHAR(20), NumeroDocumento VARCHAR(15), FechaDocumento DATETIME, idFormaPago INT, FechaVencimiento DATETIME, idMoneda INT, TipoCambio DECIMAL(4,2), TipoAdquisicion DECIMAL(4,2), Igv DECIMAL(4,2), Percepcion DECIMAL(4,2), Renta DECIMAL(4,2), Aporte DECIMAL(4,2), Tasa DECIMAL(4,2), Importe DECIMAL(8,2), BaseAfecta DECIMAL(8,2), Inafecto DECIMAL(8,2), IgvDocumento DECIMAL(8,2), PercepcionAfecta DECIMAL(8,2), RentaAfecta DECIMAL(8,2), AportePension DECIMAL(8,2), Total DECIMAL(8,2), usuario VARCHAR(20), xml VARCHAR(4000))
begin

declare i int;
declare nmax int;

set i = 1;
set nmax = ExtractValue(xml, 'count(//DetalleProvision)'); 

UPDATE Provision p
SET p.Fecha = Fecha
,p.idOrdenCompra = nullif(idOrdenCompra,0)
,p.idOrdenServicio = nullif(idOrdenServicio,0)
,p.ServicioCompra = ServicioCompra
,p.idSucursal = idSucursal
,p.idTipoCompra = idTipoCompra
,p.Codigo = Codigo
,p.RazonSocial = RazonSocial
,p.Ruc = Ruc
,p.Glosa = Glosa
,p.TipoDocumento = TipoDocumento
,p.Serie = Serie
,p.NumeroDocumento = NumeroDocumento
,p.FechaDocumento = FechaDocumento
,p.idFormaPago = idFormaPago
,p.FechaVencimiento = FechaVencimiento
,p.idMoneda = idMoneda
,p.TipoCambio = TipoCambio
,p.TipoAdquisicion = TipoAdquisicion
,p.Igv = Igv
,p.Percepcion = Percepcion
,p.Renta = Renta
,p.Aporte = Aporte
,p.Tasa = Tasa
,p.Importe = Importe
,p.BaseAfecta = BaseAfecta
,p.Inafecto = Inafecto
,p.IgvDocumento = IgvDocumento
,p.PercepcionAfecta = PercepcionAfecta
,p.RentaAfecta = RentaAfecta
,p.AportePension = AportePension
,p.Total = Total
,p.FechaModificacion = curdate()
,p.UsuarioModificacion = Usuario
WHERE p.idProvision = idProvision;

UPDATE detalleprovision dp
SET dp.Activo = 0
WHERE dp.idProvision = idProvision;

while i <= nmax do
INSERT INTO detalleprovision(idProvision,idIngreso,idCuenta,idCentroCosto,Importe,Usuario,FechaRegistro,idOrdenProduccion,Descripcion)
SELECT idProvision, nullif(ExtractValue(xml, '//DetalleProvision[$i]/IdIngreso'),0) , ExtractValue(xml, '//DetalleProvision[$i]/IdCuenta'), ExtractValue(xml, '//DetalleProvision[$i]/IdCentroCosto'), ExtractValue(xml, '//DetalleProvision[$i]/Importe'), Usuario, CURDATE(),ExtractValue(xml, '//DetalleProvision[$i]/idOrdenProduccion'),ExtractValue(xml, '//DetalleProvision[$i]/Descripcion ');
SET i=i+1;
end while;

end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `uspUpdPuntoVenta` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `uspUpdPuntoVenta`(IN IdPuntoVenta INT, IN Descripcion VARCHAR(50), IN Codigo VARCHAR(50), Usuario VARCHAR(20))
UPDATE PuntoVenta t
SET t.Descripcion = Descripcion
,t.Codigo = Codigo
,t.UsuarioModificacion = Usuario
,t.FechaModificacion = curdate()
WHERE t.IdPuntoVenta = IdPuntoVenta ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `uspUpdRenta` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `uspUpdRenta`(IN idRenta INT, IN Descripcion VARCHAR(50), Valor DECIMAL(4,2), Usuario VARCHAR(20))
UPDATE Renta t
SET t.Descripcion = Descripcion
,t.Valor = Valor
,t.FechaModificacion = curdate()
,t.UsuarioModificacion = Usuario
WHERE t.idRenta = idRenta ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `uspUpdSalida` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `uspUpdSalida`(idSalida INT,idAlmacen INT,idTipoMovimiento INT,idPedido INT,idEmpleado INT,idMoneda INT,Fecha DATETIME,Numero VARCHAR(20),TipoCambio DECIMAL(6,3),Observaciones VARCHAR(200),TipoCambioMoneda DECIMAL(6,3),Usuario VARCHAR(20), xml VARCHAR(4000), idsubdiario int)
BEGIN 
declare i INT;
declare nmax INT;
declare prmintCantidad INT;
declare idasiento INT;

set i = 1;
set nmax = ExtractValue(xml, 'count(//SalidaProducto)'); 

UPDATE Salida s
SET s.IdAlmacen = idAlmacen
,s.idTipoMovimiento = idTipoMovimiento
,s.idPedido = idPedido
,s.idClienteProveedor = idClienteProveedor
,s.idEmpleado = idEmpleado
,s.Fecha = Fecha
,s.TipoCambio = TipoCambio
,s.Observaciones = Observaciones
,s.TipoCambioMoneda = TipoCambioMoneda
,s.UsuarioModificacion = Usuario
,s.FechaModificacion = CURDATE()
WHERE s.idSalida = idSalida;


UPDATE Stock s
INNER JOIN Salida sa on s.idAlmacen = sa.idAlmacen
INNER JOIN SalidaProducto sp on sa.idSalida = sp.idSalida and sp.Activo = 1
INNER JOIN Almacen a on a.idAlmacen = s.idAlmacen
INNER JOIN Producto p on p.idProducto = s.idProducto
SET S.Cantidad = s.Cantidad + sp.Cantidad
WHERE sa.IdSalida = idSalida and s.idProducto = sp.idProducto;

UPDATE SalidaProducto sp
SET sp.Activo = 0
,sp.UsuarioModificacion = Usuario
,sp.FechaModificacion = CURDATE()
WHERE sp.idSalida = idSalida and sp.Activo = 1;


-- para el asiento----------------
set idasiento = (select coalesce(a.idasiento,0) from asiento a where a.idsalida = idsalida limit 1);
call uspUpdAsiento(idasiento, '',idSubdiario,Fecha,null,null,null,'','','<root></root>', usuario,null,null);



while i <= nmax do
INSERT INTO SalidaProducto(idSalida,idProducto,idCentroCosto,Cantidad,Precio,Importe,Usuario,FechaRegistro,Estandar)
SELECT idSalida, ExtractValue(xml, '//SalidaProducto[$i]/idProducto'), ExtractValue(xml, '//SalidaProducto[$i]/idCentroCosto'), ExtractValue(xml, '//SalidaProducto[$i]/Cantidad'), ExtractValue(xml, '//SalidaProducto[$i]/Precio'), ExtractValue(xml, '//SalidaProducto[$i]/Importe'),Usuario,CURDATE(), ExtractValue(xml, '//SalidaProducto[$i]/Estandar');

set prmintCantidad = (SELECT s.Cantidad FROM Stock s WHERE s.idAlmacen = idAlmacen and s.idProducto = ExtractValue(xml, '//SalidaProducto[$i]/idProducto'));
set prmintCantidad = prmintCantidad - ExtractValue(xml, '//SalidaProducto[$i]/Cantidad');

UPDATE Stock s
SET s.Cantidad = prmintCantidad
,s.UsuarioModificacion = Usuario
,s.FechaModificacion = CURDATE()
WHERE s.idAlmacen = idAlmacen and s.idProducto = ExtractValue(xml, '//SalidaProducto[$i]/idProducto');



-- detalle asiento---------------
update detalleasiento d
set d.activo = 0
where d.idAsiento = idAsiento;
INSERT INTO detalleasiento(idAsiento,idCentroCosto,idCuenta,CargoMN,AbonoMN,CargoME,AbonoME,Glosa)
select idAsiento, dc.idcentrocosto
,dc.idcuenta
,(case dc.cargo when 1 then ExtractValue(xml, '//SalidaProducto[$i]/Importe') else 0 end) as CargoMN 
,(case dc.cargo when 1 then 0 else ExtractValue(xml, '//SalidaProducto[$i]/Importe') end) as AbonoMN
,(case dc.cargo when 1 then ExtractValue(xml, '//SalidaProducto[$i]/Importe')*3.2 else 0 end) as CargoME 
,(case dc.cargo when 1 then 0 else ExtractValue(xml, '//SalidaProducto[$i]/Importe')*3.2 end) as AbonoME
, 'comentario del subdiario' as Glosa
from configuracion c
inner join detalleconfiguracion dc on dc.idconfiguracion = c.idconfiguracion
where dc.activo = 1 and c.idsubdiario = idsubdiario and c.idfamilia = (select p.idfamilia from producto p where p.idproducto = ExtractValue(xml, '//SalidaProducto[$i]/idProducto'))
;



SET i=i+1;
end while;


END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `uspUpdServicio` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `uspUpdServicio`(IN IdServicio INT, IN Descripcion VARCHAR(50), IN Codigo VARCHAR(50),Usuario VARCHAR(20))
UPDATE Servicio t
SET t.Descripcion = Descripcion
,t.Codigo = Codigo
,t.UsuarioModificacion = Usuario
,t.FechaModificacion = curdate()
WHERE t.IdServicio = IdServicio ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `uspUpdSubdiario` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `uspUpdSubdiario`(IN idSubdiario INT, IN Descripcion VARCHAR(50), IN Codigo VARCHAR(50), IN UsuarioModificacion VARCHAR(20))
UPDATE Subdiario t
SET t.Descripcion = Descripcion
,t.Codigo = Codigo
,t.UsuarioModificacion = UsuarioModificacion
,t.FechaModificacion = CURDATE()
WHERE t.idSubdiario = idSubdiario ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `uspUpdSucursal` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `uspUpdSucursal`(IN IdSucursal INT, IN Descripcion VARCHAR(50), IN Direccion VARCHAR(50), IN Usuario VARCHAR(20))
UPDATE Sucursal t
SET t.Descripcion = Descripcion
,t.Direccion = Direccion
,t.UsuarioModificacion = Usuario
,t.FechaModificacion = CURDATE()
WHERE t.IdSucursal = IdSucursal ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `uspUpdTareo` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `uspUpdTareo`(idtareo int,periodo text,numero text,fecha datetime,tipocambio decimal(4,2),idsucursal int,idempleado int,observaciones text,totalhoras decimal(4,2),usuario text,xml text)
begin

declare i int;
declare nmax int;

set i = 1;
set nmax = ExtractValue(xml, 'count(//DetalleTareo)'); 


update tareo t
set t.periodo = periodo 
,t.fecha  = fecha  
,t.tipocambio =  tipocambio 
,t.idsucursal  = idsucursal  
,t.idempleado  = idempleado  
,t.observaciones  = observaciones  
,t.totalhoras  = totalhoras  
,t.usuariomodificacion = usuario 
,t.fechamodificacion = curdate()
where t.idtareo = idtareo;


update detalletareo t
set t.activo = 0
where t.idtareo = idtareo;


while i <= nmax do
INSERT INTO detalletareo(idTareo
,idEmpleado
,idOrdenProduccion
,idActividad
,idCentroCosto
,Descripcion
,HoraInicio
,HoraFin
,Horas
,Usuario,FechaRegistro)
SELECT idtareo
, ExtractValue(xml, '//DetalleTareo[$i]/idEmpleado') 
, ExtractValue(xml, '//DetalleTareo[$i]/idOrdenProduccion')
, ExtractValue(xml, '//DetalleTareo[$i]/idActividad')
, ExtractValue(xml, '//DetalleTareo[$i]/idCentroCosto')
, ExtractValue(xml, '//DetalleTareo[$i]/Descripcion') 
, ExtractValue(xml, '//DetalleTareo[$i]/HoraInicio')
, ExtractValue(xml, '//DetalleTareo[$i]/HoraFin')
, ExtractValue(xml, '//DetalleTareo[$i]/Horas')
, Usuario, CURDATE();
SET i=i+1;
end while;


END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `uspUpdTasa` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `uspUpdTasa`(IN idTasa INT, IN Descripcion VARCHAR(50), IN Valor DECIMAL(4,2), Usuario VARCHAR(20))
UPDATE Tasa t
SET t.Descripcion = Descripcion
,t.Valor = Valor
,t.FechaModificacion = curdate()
,UsuarioModificacion = Usuario
WHERE t.idTasa = idTasa ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `uspUpdTipoAdquisicion` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `uspUpdTipoAdquisicion`(IN idTipoAdquisicion INT, IN Descripcion VARCHAR(50), Valor DECIMAL(4,2), Usuario VARCHAR(20))
UPDATE TipoAdquisicion t
SET t.Descripcion = Descripcion
,t.FechaModificacion = curdate()
,t.UsuarioModificacion = Usuario
,t.Valor = Valor
WHERE t.idTipoAdquisicion = idTipoAdquisicion ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `uspUpdtipoauxiliar` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `uspUpdtipoauxiliar`(idtipoauxiliar int, Descripcion varchar(100), Codigo varchar(50), usuario varchar(20))
update tipoauxiliar c
set c.Descripcion = Descripcion 
, c.Codigo = Codigo 
, c.UsuarioModificacion = UsuarioModificacion 
,c.fechamodificacion = fechamodificacion 
where c.idtipoauxiliar = idtipoauxiliar ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `uspUpdTipoCambio` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `uspUpdTipoCambio`(idTipoCambio INT, idMonedaCobra INT, idMonedaPago int, Valor decimal(6,3), Fecha datetime,Usuario varchar(20))
begin

Update tipocambio t
set t.activo = 0
,t.usuariomodificacion = Usuario
,t.fechamodificacion = curdate()
where t.idmonedacobra = idmonedacobra and t.idmonedapago = idmonedapago and t.fecha = fecha;


Update tipocambio t
set t.idMonedaCobra = idMonedaCobra 
,t.idMonedaPago = idMonedaPago 
,t.Valor = Valor 
,t.Fecha = Fecha 
,t.usuariomodificacion = Usuario
,t.fechamodificacion = curdate()
where t.idTipoCambio = idTipoCambio;
end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `uspUpdtipocambiocuenta` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `uspUpdtipocambiocuenta`(idtipocambiocuenta int, Descripcion varchar(100), Codigo varchar(50), usuario varchar(20))
update tipocambiocuenta c
set c.Descripcion = Descripcion 
, c.Codigo = Codigo 
, c.UsuarioModificacion = UsuarioModificacion 
,c.fechamodificacion = fechamodificacion 
where c.idtipocambiocuenta = idtipocambiocuenta ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `uspUpdTipoCompra` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `uspUpdTipoCompra`(IN idTipoCompra INT, IN Descripcion VARCHAR(50), IN Codigo VARCHAR(50), Usuario VARCHAR(20))
UPDATE TipoCompra t
SET t.Descripcion = Descripcion
,t.Codigo = Codigo
,t.FechaModificacion = curdate()
,t.UsuarioModificacion = Usuario
WHERE t.idTipoCompra = idTipoCompra ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `uspUpdtipoconfiguracioncuenta` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `uspUpdtipoconfiguracioncuenta`(idtipoconfiguracioncuenta int, Descripcion varchar(100), Codigo varchar(50), usuario varchar(20))
update tipoconfiguracioncuenta c
set c.Descripcion = Descripcion 
, c.Codigo = Codigo 
, c.UsuarioModificacion = UsuarioModificacion 
,c.fechamodificacion = fechamodificacion 
where c.idtipoconfiguracioncuenta = idtipoconfiguracioncuenta ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `uspUpdTipoDocumento` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `uspUpdTipoDocumento`(IN IdTipoDocumento INT, IN Descripcion VARCHAR(50), IN Codigo VARCHAR(50), Usuario VARCHAR(20))
UPDATE TipoDocumento t
SET t.Descripcion = Descripcion
,t.Codigo = Codigo
,t.Usuario = Usuario
,t.FechaModificacion = curdate()
WHERE t.IdTipoDocumento = IdTipoDocumento ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `uspUpdTipoMovimiento` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `uspUpdTipoMovimiento`(IN IdTipoMovimiento INT, IN Descripcion VARCHAR(50), IN Codigo VARCHAR(50), IN Usuario VARCHAR(20))
UPDATE TipoMovimiento t
SET t.Descripcion = Descripcion
,t.Codigo = Codigo
,t.UsuarioModificacion = Usuario
,t.FechaModificacion = CURDATE()
WHERE t.IdTipoMovimiento = IdTipoMovimiento ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `uspUpdTipoProducto` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `uspUpdTipoProducto`(IN idTipoProducto INT, IN Descripcion VARCHAR(50), IN Codigo VARCHAR(50), IN UsuarioModificacion VARCHAR(20))
UPDATE TipoProducto t
SET t.Descripcion = Descripcion
,t.Codigo = Codigo
,t.UsuarioModificacion = UsuarioModificacion
,t.FechaModificacion = CURDATE()
WHERE t.idTipoProducto = idTipoProducto ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `uspUpdTipoVenta` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `uspUpdTipoVenta`(IN IdTipoVenta INT, IN Descripcion VARCHAR(50), IN Codigo VARCHAR(50), Usuario VARCHAR(20))
UPDATE TipoVenta t
SET t.Descripcion = Descripcion
,t.Codigo = Codigo
,t.Usuario = Usuario
,t.FechaModificacion = CURDATE()
WHERE t.IdTipoVenta = IdTipoVenta ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `uspUpdUsuario` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `uspUpdUsuario`(IN idUsuario INT, IN Nick VARCHAR(20), IN Password VARCHAR(12), IN Nombre VARCHAR(50), IN Email VARCHAR(50))
UPDATE Usuario t
SET t.Nick = Nick
,t.Password = Password
,t.Nombre = Nombre
,t.Email = Email
WHERE t.idUsuario = idUsuario ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2015-11-14 16:49:31
