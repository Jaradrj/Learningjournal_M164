-- MySQL dump 10.13  Distrib 8.0.41, for Win64 (x86_64)
--
-- Host: localhost    Database: freifaecher
-- ------------------------------------------------------
-- Server version	8.0.41

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `freifach`
--

DROP TABLE IF EXISTS `freifach`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `freifach` (
  `idfreifach` int NOT NULL,
  `beschreibung` varchar(45) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tag` varchar(45) COLLATE utf8mb4_unicode_ci NOT NULL,
  `zimmer` varchar(45) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`idfreifach`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `freifach`
--

LOCK TABLES `freifach` WRITE;
/*!40000 ALTER TABLE `freifach` DISABLE KEYS */;
INSERT INTO `freifach` VALUES (1,'Elektronik','Di','110'),(2,'Tanz','Mo','112'),(3,'Chor','Mi','Aula'),(4,'Mathe','Do','119');
/*!40000 ALTER TABLE `freifach` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `klasse`
--

DROP TABLE IF EXISTS `klasse`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `klasse` (
  `idklasse` varchar(5) COLLATE utf8mb4_unicode_ci NOT NULL,
  `lehrperson_idlehrperson` int NOT NULL,
  PRIMARY KEY (`idklasse`),
  KEY `fk_klasse_lehrperson1_idx` (`lehrperson_idlehrperson`),
  CONSTRAINT `fk_klasse_lehrperson1` FOREIGN KEY (`lehrperson_idlehrperson`) REFERENCES `lehrperson` (`idlehrperson`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `klasse`
--

LOCK TABLES `klasse` WRITE;
/*!40000 ALTER TABLE `klasse` DISABLE KEYS */;
INSERT INTO `klasse` VALUES ('11a',1),('12a',2),('11b',3),('12c',4);
/*!40000 ALTER TABLE `klasse` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `lehrperson`
--

DROP TABLE IF EXISTS `lehrperson`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `lehrperson` (
  `idlehrperson` int NOT NULL,
  `name` varchar(45) COLLATE utf8mb4_unicode_ci NOT NULL,
  `geburtsdatum` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`idlehrperson`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `lehrperson`
--

LOCK TABLES `lehrperson` WRITE;
/*!40000 ALTER TABLE `lehrperson` DISABLE KEYS */;
INSERT INTO `lehrperson` VALUES (1,'Lempel Theo',NULL),(2,'Breier Guido',NULL),(3,'Sommer Inge',NULL),(4,'Klausen Franz',NULL),(5,'Klee Horst',NULL),(6,'Trampel Donald',NULL),(7,'Rohner Sonja',NULL);
/*!40000 ALTER TABLE `lehrperson` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `schueler`
--

DROP TABLE IF EXISTS `schueler`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `schueler` (
  `idschueler` int NOT NULL,
  `name` varchar(45) COLLATE utf8mb4_unicode_ci NOT NULL,
  `geburtsdatum` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `klasse_idklasse` varchar(5) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`idschueler`),
  KEY `fk_schueler_klasse1_idx` (`klasse_idklasse`),
  CONSTRAINT `fk_schueler_klasse1` FOREIGN KEY (`klasse_idklasse`) REFERENCES `klasse` (`idklasse`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `schueler`
--

LOCK TABLES `schueler` WRITE;
/*!40000 ALTER TABLE `schueler` DISABLE KEYS */;
INSERT INTO `schueler` VALUES (1,'Juergens Ulla',NULL,'11a'),(2,'Schmidt Harry',NULL,'12a'),(3,'Jaeger Sepp',NULL,'11a'),(4,'Olsen Evan',NULL,'11b'),(5,'Juergens Tom',NULL,'12a'),(6,'Hasler Justus',NULL,'11b'),(8,'Kustov Igor',NULL,'12c'),(9,'Pelka Teresa','02.11.2001','3'),(10,'Schwinghammer Gelbert','18.12.2003','2'),(11,'Kast Cedric',NULL,'12c'),(12,'Hieber Friedlinde','26.04.2004','1'),(13,'Vitt Milan','14.07.2002','2'),(14,'Graßhoff Kord','02.12.2000','3'),(15,'Elsäßer Tilman','24.02.2002','3'),(16,'Storch Leonie','05.04.2004','1'),(17,'Dippel Ignaz','17.01.2003','2'),(18,'Materna Reginbert','18.06.2003','2'),(19,'Buss Irene','16.11.2003','4'),(20,'Ullrich Hatto','29.01.2003','2'),(21,'Harrison Diethart','02.02.2001','2'),(22,'Triebel Walbert','02.05.2003','3'),(23,'Göricke Marga','14.04.2002','3'),(24,'Selig Cäcilie','21.11.2001','3'),(25,'Dams Rupertus','11.04.2004','2'),(26,'Chen Matthäus','12.05.2001','2'),(27,'Horn Liselore','02.03.2002','2'),(28,'Dambach Burgel','15.07.2004','3'),(29,'Gutjahr Stefanie','03.07.2001','2'),(30,'Gutsch Can','23.11.2001','2'),(31,'Mühlberg Annelen','15.10.2001','4'),(32,'Ellermann Regina','14.08.2002','1'),(33,'Bartosch Effi','29.11.2001','4'),(34,'Hahne Anabel','11.10.2003','3'),(35,'Schmahl Hadburg','13.04.2003','3'),(36,'Bruno Korinna','21.09.2001','3'),(37,'Riesen Lina','04.05.2002','3'),(38,'Wengert Dieterich','20.05.2004','3'),(39,'Biehler Xaverius','26.09.2002','1'),(40,'Plath Theolinde','08.11.2003','3'),(41,'Wörle Freimut','26.06.2002','2'),(42,'Hoang Erkmar','22.10.2003','2'),(43,'Haslbeck Quentin','18.02.2001','4'),(44,'Schöttler Irmentraut','19.02.2000','2'),(45,'Brech Tomas','20.04.2003','1'),(46,'Watkins Annegreth','15.01.2001','3'),(47,'Knoth Nora','25.09.2001','2'),(48,'Beek Claudius','22.09.2003','3'),(49,'James Nelli','30.05.2001','1'),(50,'Spengler Wolrad','20.01.2002','3'),(51,'Dornieden Gundhilde','18.10.2002','3'),(52,'Heigl Gunda','09.05.2002','1'),(53,'Riedmann Ringo','12.08.2001','3'),(54,'Grabowski Hans','06.12.2002','4'),(55,'Kraemer Karlhans','27.09.2001','4'),(56,'Abbott Eckhart','10.10.2000','3'),(57,'Plötz Collin','27.11.2002','1'),(58,'Wells Hariolf','26.08.2003','3'),(59,'Dix Neidhardt','03.07.2000','2'),(60,'Daus Annetraude','11.10.2001','2'),(61,'Lackner Gerritdina','09.06.2002','3'),(62,'Bätz Dela','16.04.2001','3'),(63,'Wenisch Monique','20.04.2000','1'),(64,'Molzahn Gerta','06.03.2004','2'),(65,'Katrin Siegwald','02.05.2001','4'),(66,'Wißmann Theres','08.05.2000','3'),(67,'Waldner Karlfried','16.08.2002','2'),(68,'Landgraf Joel','24.10.2001','3'),(69,'Otter Runald','14.09.2004','3'),(70,'Kuhnle Angelina','24.07.2003','2'),(71,'Hüttemann Timotheus','01.06.2000','4'),(72,'Haaf Willehad','08.10.2001','3'),(73,'Wiemann Elenore','11.10.2003','3'),(74,'Liebing Marold','25.12.2003','3'),(75,'Wise Dorette','24.06.2002','2'),(76,'Briel Ilsetraud','04.07.2003','3'),(77,'Giesecke Dario','14.06.2003','2'),(78,'Wever Claudia','01.12.2003','2'),(79,'Kilger Priska','12.02.2004','1'),(80,'Schwalb Tristan','11.12.2001','2'),(81,'Bulut Sunhild','14.01.2001','2'),(82,'Blumenthal Muhammed','02.11.2002','2'),(83,'Lämmel Margareta','28.11.2003','3'),(84,'Drescher Caroline','24.01.2000','3'),(85,'Biel Biggy','31.05.2002','2'),(86,'Schmidhuber Jannis','10.02.2004','2'),(87,'Kleinke Doritta','23.02.2001','2'),(88,'Kuhnle Gerhart','09.08.2002','3'),(89,'Kluger Inge','17.04.2000','2'),(90,'Gerd Neidhard','21.06.2002','2'),(91,'Hüttinger Ignaz','27.04.2004','1'),(92,'Oßwald Verona','16.02.2002','1'),(93,'Adolph Sonnhilde','22.09.2000','3'),(94,'Biberger Gerold','28.02.2000','4'),(95,'Tröger Waldtraud','25.01.2003','3'),(96,'Hennicke Heidi','01.12.2002','2'),(97,'Jäschke Renatus','15.11.2002','2'),(98,'Reimers Lindhilde','12.01.2001','2'),(99,'Dresler Adelhard','16.02.2002','1'),(100,'Stokes Christoph','26.08.2004','3'),(101,'Ziesche Rainhard','14.09.2004','2'),(102,'Gugel Elfi','02.05.2000','3'),(103,'Hommel Borka','11.01.2002','3'),(104,'Jentzsch Burghardt','27.10.2004','3'),(105,'Schu Reinmar','23.09.2000','4'),(106,'Stuber Adolph','05.01.2001','3'),(107,'Davis Jeremy','06.06.2003','1'),(108,'Tomaszewski Malwine','27.01.2004','2'),(109,'Bräuer Edeltraudt','05.03.2000','2'),(110,'Hellwig Iven','30.09.2003','3'),(111,'Petri Arntraud','02.02.2001','4'),(112,'Zacher Annerose','24.05.2004','3'),(113,'Brettschneider Elisabeth','27.05.2001','1'),(114,'Gerlinger Carolin','15.01.2003','2'),(115,'Speiser Emily','11.07.2001','4'),(116,'Wendorf Silvia','28.10.2002','1'),(117,'Hühn Kreszentia','07.08.2003','2'),(118,'Buder Annehilde','16.07.2004','1'),(119,'Nirschl Laurin','27.03.2000','4'),(120,'Schoof Reinhart','06.04.2001','1'),(121,'Tessmer Notfried','14.12.2003','2'),(122,'Welk Yvonne','08.05.2002','3'),(123,'Ellis Torben','21.12.2001','4'),(124,'Laber Karlhorst','15.10.2001','3'),(125,'Edinger Renilde','12.06.2002','3'),(126,'Schupp Adelgund','17.01.2004','3'),(127,'Fey Arnhild','27.06.2003','2'),(128,'Steer Ayleen','10.07.2003','3'),(129,'Kopplin Felizitas','22.04.2002','3'),(130,'Kannenberg Siegward','14.09.2003','1'),(131,'Jovanovic Rebekka','06.08.2002','2'),(132,'Dirks Anje','23.12.2000','3'),(133,'Kohlmann Ekhard','22.06.2000','1'),(134,'Broll Ferdinand','01.10.2004','1'),(135,'Belzer Neidhard','20.04.2004','3'),(136,'Schmelzer Wendel','13.09.2000','1'),(137,'Meding Karlhorst','01.09.2004','2'),(138,'Gulde Babsi','14.12.2004','1'),(139,'Dobmeier Sturmhard','06.05.2003','2'),(140,'Mohn Holmer','30.10.2003','3'),(141,'Curtis Rochus','17.07.2004','3'),(142,'Biallas Fidelius','26.05.2001','2'),(143,'Grimm Samira','12.03.2000','2'),(144,'Sill Andrea','05.08.2000','3'),(145,'Reid Sybill','19.05.2002','3'),(146,'Marth Arwed','18.02.2001','3'),(147,'Haschke Biggy','17.01.2003','4'),(148,'Renger Heimwald','07.05.2001','4'),(149,'Kratzsch Agatha','12.03.2002','2'),(150,'Buschmann Elsemarie','08.03.2003','4'),(151,'Hüppe Hippolytus','02.12.2003','1'),(152,'Graichen Florenz','05.12.2003','2'),(153,'Schleich Günther','11.04.2000','2'),(154,'Mucha Hanshelmut','16.04.2002','4'),(155,'Wolke Ortrun','18.10.2000','1'),(156,'Gerl Hermi','28.07.2001','3'),(157,'Wesch Augustine','27.02.2002','4'),(158,'Gassen Sieghardt','15.11.2000','3'),(159,'Köpke Cordian','29.01.2000','2'),(160,'Küspert Gotlind','06.03.2001','2'),(161,'Isermann Martrud','14.07.2003','2'),(162,'Klütsch Lennox','16.01.2003','1'),(163,'Lieder Ilseruth','13.06.2002','3'),(164,'Nell Uranius','10.09.2004','2'),(165,'Helmecke Otfried','19.01.2004','3'),(166,'Huesmann Gudula','07.03.2000','2'),(167,'Khan Emelie','04.11.2001','2'),(168,'Berberich Iris','29.11.2003','4'),(169,'Faß Iselore','07.12.2000','3'),(170,'Redeker Carsten','03.05.2004','3'),(171,'Gattermann Erla','07.09.2001','2'),(172,'Olson Isabella','29.06.2002','3'),(173,'Hempen Otheinrich','03.04.2003','3'),(174,'Brunn Emmerich','04.09.2000','3'),(175,'Kappes Reimo','14.12.2000','1'),(176,'Dursun Frohwald','24.06.2001','4'),(177,'Rauhut Hartmann','27.11.2002','4'),(178,'Schönberger Edelgard','27.04.2004','3'),(179,'Köber Heideliese','16.12.2003','3'),(180,'Köpp Janik','25.03.2002','1'),(181,'Stern Roselius','26.01.2001','2'),(182,'Renate Deborah','24.06.2003','1'),(183,'Baden Emmaliese','06.06.2003','2'),(184,'Meinert Didi','19.06.2004','4'),(185,'Hinkelmann Kirsten','27.11.2003','2'),(186,'Henne Erdmuthe','22.08.2000','1'),(187,'Esche Ann','17.07.2000','1'),(188,'Lück Marianne','01.10.2001','4'),(189,'Wöhrmann Eberhardt','02.05.2000','1'),(190,'Kühnast Juliana','18.11.2000','4'),(191,'Brinker Loisl','17.07.2003','2'),(192,'Perl Lewin','09.01.2000','4'),(193,'Reil Gereon','20.10.2002','2'),(194,'Leistner Vincent','28.07.2003','2'),(195,'Möser Alyssa','25.01.2000','2'),(196,'Gronau Juri','07.08.2000','3'),(197,'Hinck Dorkas','08.01.2003','3'),(198,'Gratz Burghild','09.01.2004','2'),(199,'Rödl Can','22.01.2000','2'),(200,'Fasel Mandy','11.11.2000','3'),(201,'Berens Cäcilia','16.07.2001','2'),(202,'Lüdemann Liam','03.02.2002','4'),(203,'Bachmann Karla','29.01.2004','1'),(204,'Kerst Benno','10.10.2003','3'),(205,'Preller Elisabeth','12.01.2001','3'),(206,'Lösche Arthur','07.12.2002','3'),(207,'Weigold Ingeruth','13.04.2004','3'),(208,'Schiele Gerfried','25.11.2004','1'),(209,'Matschke Berno','30.09.2001','4'),(210,'Kluge Reinmar','02.04.2003','2'),(211,'Gerding Marcel','11.05.2003','3'),(212,'Vos Konstanze','02.10.2003','4'),(213,'Cords Malve','23.06.2004','4'),(214,'Ziebell Carlotta','26.01.2000','2'),(215,'Dietzsch Ishild','24.08.2001','2'),(216,'Stöckle Edelfriede','22.02.2004','2'),(217,'Eckermann Christella','14.09.2000','2'),(218,'Larson Lona','10.03.2004','1'),(219,'Rack Janette','28.12.2003','3'),(220,'Stocker Simon','03.01.2004','2'),(221,'Penzkofer Jessika','04.10.2004','2'),(222,'Nußbaumer Margund','19.11.2001','2'),(223,'Gräfe Natascha','31.07.2004','4'),(224,'Pradel Mariegret','07.11.2001','3'),(225,'Schlag Selma','12.06.2004','3'),(226,'Huppert Friedmar','28.02.2002','1'),(227,'Mildner Jaqueline','16.10.2000','1'),(228,'Eschbach Ramona','22.03.2002','1'),(229,'Tonn Erni','28.03.2004','2'),(230,'Remondis Irmin','24.10.2003','3'),(231,'Penzkofer Eckbert','18.03.2002','2'),(232,'Martel Merlind','10.11.2001','3'),(233,'Stoll Friedhardt','08.03.2000','2'),(234,'Vieten Eric','18.03.2003','1'),(235,'Stach Liam','10.06.2002','3'),(236,'Feth Reginbert','27.01.2002','2'),(237,'Koob Friederun','21.07.2002','3'),(238,'Freiberg Bernhardt','14.05.2002','2'),(239,'Wicklein Elia','03.12.2002','2'),(240,'Westphal Valeska','21.04.2004','1'),(241,'Köllner Reinhart','10.03.2000','4'),(242,'Drewes Ingetraud','16.10.2001','1'),(243,'Genz Iris','07.04.2003','2'),(244,'Schwinn Annegret','06.05.2004','3'),(245,'Leinweber Sigtraud','26.05.2004','3'),(246,'Dachs Mario','18.01.2003','3'),(247,'Lieber Walfried','02.09.2001','2'),(248,'Heidorn Linde','14.06.2002','4'),(249,'Koss Robby','02.03.2004','1'),(250,'Niggemeier Monja','30.01.2001','2'),(251,'Berk Karlernst','08.02.2004','3'),(252,'Hornberger Hardy','25.05.2000','3'),(253,'Kagerer Sergius','04.04.2001','4'),(254,'Husemann Idamarie','30.05.2000','4'),(255,'Strohmeier Mandy','21.09.2004','3'),(256,'Töpfer Sonja','27.11.2004','4'),(257,'Claas Elsa','28.02.2004','2'),(258,'Emde Olivia','08.11.2003','1'),(259,'Weiß Chantal','28.10.2001','1'),(260,'Voß Hansludwig','13.01.2001','1'),(261,'Stühler Kimberley','21.11.2002','2'),(262,'Rebmann Utta','15.01.2003','2'),(263,'Lins Dorlinde','20.08.2004','2'),(264,'Böke Trautlinde','22.11.2003','3'),(265,'Schomaker Burghard','20.04.2002','2'),(266,'Oesterreich Amelie','02.01.2003','3'),(267,'Bührmann Editha','26.11.2003','1'),(268,'Loosen Jonathan','29.05.2002','2'),(269,'Pfitzner Erdfried','17.03.2002','1'),(270,'Bretthauer Berit','01.06.2002','2'),(271,'Roden Fabian','10.12.2000','2'),(272,'Schumann Walter','06.05.2001','2'),(273,'Karp John','09.06.2003','2'),(274,'Weh Jens','19.04.2003','4'),(275,'Weiß Adele','25.04.2000','1'),(276,'Blau Mechthilde','16.03.2004','3'),(277,'Hüttinger Elfie','07.11.2000','1'),(278,'Bekker Rainhardt','13.04.2004','4'),(279,'Genz Elke','25.01.2000','4'),(280,'Schriever Ute','08.06.2003','3'),(281,'Wenzl Anka','02.02.2000','2'),(282,'Repp Robin','25.01.2003','3'),(283,'Felgner Raimar','10.06.2000','3'),(284,'Normann Trauthilde','16.07.2003','3'),(285,'Neumüller Hartwig','15.04.2003','2'),(286,'Sauerborn Eckardt','14.04.2003','2'),(287,'Deeg Heimgard','06.03.2004','1'),(288,'Beth Ortrud','04.01.2002','3'),(289,'Engelhardt Larissa','31.08.2000','3'),(290,'Fokken Gundhard','',''),(291,'Janisch Fabian','10.05.2001','2'),(292,'Quinn Roselinde','10.08.2002','2'),(293,'Lay Clementine','12.05.2001','4'),(294,'Lück Burgel','11.09.2003','3'),(295,'Schwandt Karsta','19.12.2004','4'),(296,'Schwichtenberg Thusnelda','26.03.2003','1'),(297,'Röhm Harro','07.02.2002','3'),(298,'Hermanns Dionys','30.08.2002','1'),(299,'Orhan Bastian','10.08.2004','2');
/*!40000 ALTER TABLE `schueler` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `schueler_has_freifach`
--

DROP TABLE IF EXISTS `schueler_has_freifach`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `schueler_has_freifach` (
  `schueler_idschueler` int NOT NULL,
  `freifach_idfreifach` int NOT NULL,
  PRIMARY KEY (`schueler_idschueler`,`freifach_idfreifach`),
  KEY `fk_schueler_has_freifach_freifach1_idx` (`freifach_idfreifach`),
  KEY `fk_schueler_has_freifach_schueler_idx` (`schueler_idschueler`),
  CONSTRAINT `fk_schueler_has_freifach_freifach1` FOREIGN KEY (`freifach_idfreifach`) REFERENCES `freifach` (`idfreifach`),
  CONSTRAINT `fk_schueler_has_freifach_schueler` FOREIGN KEY (`schueler_idschueler`) REFERENCES `schueler` (`idschueler`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `schueler_has_freifach`
--

LOCK TABLES `schueler_has_freifach` WRITE;
/*!40000 ALTER TABLE `schueler_has_freifach` DISABLE KEYS */;
INSERT INTO `schueler_has_freifach` VALUES (3,1),(5,1),(8,1),(11,1),(1,2),(3,2),(4,2),(2,3),(3,3),(6,3),(6,4),(8,4),(11,4);
/*!40000 ALTER TABLE `schueler_has_freifach` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2025-07-01  8:22:58
