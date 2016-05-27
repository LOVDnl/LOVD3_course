-- This template is for the course installations at the Leiden University Medical Center.
-- If you wish to set up your own LOVD3 course installations, please contact us here:
-- http://www.lovd.nl/3.0/contact?courses
-- We're happy to help!

SET FOREIGN_KEY_CHECKS=0; -- Necessary because we're dropping the tables and recreating them.

-- MySQL dump 10.13  Distrib 5.5.43, for debian-linux-gnu (x86_64)
--
-- Host: localhost    Database: lovd3_training
-- ------------------------------------------------------
-- Server version	5.5.43-0ubuntu0.14.04.1-log

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
-- Table structure for table `lovd_training_master_active_columns`
--

DROP TABLE IF EXISTS `lovd_training_master_active_columns`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `lovd_training_master_active_columns` (
  `colid` varchar(100) NOT NULL,
  `created_by` smallint(5) unsigned zerofill DEFAULT NULL,
  `created_date` datetime NOT NULL,
  PRIMARY KEY (`colid`),
  KEY `created_by` (`created_by`),
  CONSTRAINT `lovd_training_master_active_columns_fk_colid` FOREIGN KEY (`colid`) REFERENCES `lovd_training_master_columns` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `lovd_training_master_active_columns_fk_created_by` FOREIGN KEY (`created_by`) REFERENCES `lovd_training_master_users` (`id`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `lovd_training_master_active_columns`
--
-- ORDER BY:  `colid`

LOCK TABLES `lovd_training_master_active_columns` WRITE;
/*!40000 ALTER TABLE `lovd_training_master_active_columns` DISABLE KEYS */;
INSERT INTO `lovd_training_master_active_columns` VALUES ('Individual/Lab_ID',00000,'2015-02-26 09:58:09');
INSERT INTO `lovd_training_master_active_columns` VALUES ('Individual/Reference',00000,'2015-02-26 09:58:09');
INSERT INTO `lovd_training_master_active_columns` VALUES ('Individual/Remarks',00000,'2015-02-26 09:58:09');
INSERT INTO `lovd_training_master_active_columns` VALUES ('Individual/Remarks_Non_Public',00000,'2015-02-26 09:58:09');
INSERT INTO `lovd_training_master_active_columns` VALUES ('Phenotype/Additional',00000,'2015-02-26 09:58:09');
INSERT INTO `lovd_training_master_active_columns` VALUES ('Phenotype/Age',00000,'2015-02-26 09:58:10');
INSERT INTO `lovd_training_master_active_columns` VALUES ('Phenotype/Inheritance',00000,'2015-02-26 09:58:09');
INSERT INTO `lovd_training_master_active_columns` VALUES ('Screening/Technique',00000,'2015-02-26 09:58:09');
INSERT INTO `lovd_training_master_active_columns` VALUES ('Screening/Template',00000,'2015-02-26 09:58:09');
INSERT INTO `lovd_training_master_active_columns` VALUES ('VariantOnGenome/DBID',00000,'2015-02-26 09:58:09');
INSERT INTO `lovd_training_master_active_columns` VALUES ('VariantOnGenome/DNA',00000,'2015-02-26 09:58:09');
INSERT INTO `lovd_training_master_active_columns` VALUES ('VariantOnGenome/Frequency',00000,'2015-02-26 09:58:09');
INSERT INTO `lovd_training_master_active_columns` VALUES ('VariantOnGenome/Reference',00000,'2015-02-26 09:58:09');
INSERT INTO `lovd_training_master_active_columns` VALUES ('VariantOnTranscript/DNA',00000,'2015-02-26 09:58:10');
INSERT INTO `lovd_training_master_active_columns` VALUES ('VariantOnTranscript/Exon',00000,'2015-02-26 09:58:10');
INSERT INTO `lovd_training_master_active_columns` VALUES ('VariantOnTranscript/Protein',00000,'2015-02-26 09:58:10');
INSERT INTO `lovd_training_master_active_columns` VALUES ('VariantOnTranscript/RNA',00000,'2015-02-26 09:58:10');
/*!40000 ALTER TABLE `lovd_training_master_active_columns` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `lovd_training_master_alleles`
--

DROP TABLE IF EXISTS `lovd_training_master_alleles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `lovd_training_master_alleles` (
  `id` tinyint(2) unsigned NOT NULL,
  `name` varchar(20) NOT NULL,
  `display_order` tinyint(1) unsigned NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `lovd_training_master_alleles`
--
-- ORDER BY:  `id`

LOCK TABLES `lovd_training_master_alleles` WRITE;
/*!40000 ALTER TABLE `lovd_training_master_alleles` DISABLE KEYS */;
INSERT INTO `lovd_training_master_alleles` VALUES (0,'Unknown',1);
INSERT INTO `lovd_training_master_alleles` VALUES (1,'Parent #1',6);
INSERT INTO `lovd_training_master_alleles` VALUES (2,'Parent #2',7);
INSERT INTO `lovd_training_master_alleles` VALUES (3,'Both (homozygous)',8);
INSERT INTO `lovd_training_master_alleles` VALUES (10,'Paternal (inferred)',3);
INSERT INTO `lovd_training_master_alleles` VALUES (11,'Paternal (confirmed)',2);
INSERT INTO `lovd_training_master_alleles` VALUES (20,'Maternal (inferred)',5);
INSERT INTO `lovd_training_master_alleles` VALUES (21,'Maternal (confirmed)',4);
/*!40000 ALTER TABLE `lovd_training_master_alleles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `lovd_training_master_chromosomes`
--

DROP TABLE IF EXISTS `lovd_training_master_chromosomes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `lovd_training_master_chromosomes` (
  `name` varchar(2) NOT NULL,
  `sort_id` tinyint(3) unsigned NOT NULL,
  `hg18_id_ncbi` varchar(20) NOT NULL,
  `hg19_id_ncbi` varchar(20) NOT NULL,
  PRIMARY KEY (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `lovd_training_master_chromosomes`
--
-- ORDER BY:  `name`

LOCK TABLES `lovd_training_master_chromosomes` WRITE;
/*!40000 ALTER TABLE `lovd_training_master_chromosomes` DISABLE KEYS */;
INSERT INTO `lovd_training_master_chromosomes` VALUES ('1',1,'NC_000001.9','NC_000001.10');
INSERT INTO `lovd_training_master_chromosomes` VALUES ('10',10,'NC_000010.9','NC_000010.10');
INSERT INTO `lovd_training_master_chromosomes` VALUES ('11',11,'NC_000011.8','NC_000011.9');
INSERT INTO `lovd_training_master_chromosomes` VALUES ('12',12,'NC_000012.10','NC_000012.11');
INSERT INTO `lovd_training_master_chromosomes` VALUES ('13',13,'NC_000013.9','NC_000013.10');
INSERT INTO `lovd_training_master_chromosomes` VALUES ('14',14,'NC_000014.7','NC_000014.8');
INSERT INTO `lovd_training_master_chromosomes` VALUES ('15',15,'NC_000015.8','NC_000015.9');
INSERT INTO `lovd_training_master_chromosomes` VALUES ('16',16,'NC_000016.8','NC_000016.9');
INSERT INTO `lovd_training_master_chromosomes` VALUES ('17',17,'NC_000017.9','NC_000017.10');
INSERT INTO `lovd_training_master_chromosomes` VALUES ('18',18,'NC_000018.8','NC_000018.9');
INSERT INTO `lovd_training_master_chromosomes` VALUES ('19',19,'NC_000019.8','NC_000019.9');
INSERT INTO `lovd_training_master_chromosomes` VALUES ('2',2,'NC_000002.10','NC_000002.11');
INSERT INTO `lovd_training_master_chromosomes` VALUES ('20',20,'NC_000020.9','NC_000020.10');
INSERT INTO `lovd_training_master_chromosomes` VALUES ('21',21,'NC_000021.7','NC_000021.8');
INSERT INTO `lovd_training_master_chromosomes` VALUES ('22',22,'NC_000022.9','NC_000022.10');
INSERT INTO `lovd_training_master_chromosomes` VALUES ('3',3,'NC_000003.10','NC_000003.11');
INSERT INTO `lovd_training_master_chromosomes` VALUES ('4',4,'NC_000004.10','NC_000004.11');
INSERT INTO `lovd_training_master_chromosomes` VALUES ('5',5,'NC_000005.8','NC_000005.9');
INSERT INTO `lovd_training_master_chromosomes` VALUES ('6',6,'NC_000006.10','NC_000006.11');
INSERT INTO `lovd_training_master_chromosomes` VALUES ('7',7,'NC_000007.12','NC_000007.13');
INSERT INTO `lovd_training_master_chromosomes` VALUES ('8',8,'NC_000008.9','NC_000008.10');
INSERT INTO `lovd_training_master_chromosomes` VALUES ('9',9,'NC_000009.10','NC_000009.11');
INSERT INTO `lovd_training_master_chromosomes` VALUES ('M',25,'NC_001807.4','NC_012920.1');
INSERT INTO `lovd_training_master_chromosomes` VALUES ('X',23,'NC_000023.9','NC_000023.10');
INSERT INTO `lovd_training_master_chromosomes` VALUES ('Y',24,'NC_000024.8','NC_000024.9');
/*!40000 ALTER TABLE `lovd_training_master_chromosomes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `lovd_training_master_columns`
--

DROP TABLE IF EXISTS `lovd_training_master_columns`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `lovd_training_master_columns` (
  `id` varchar(100) NOT NULL,
  `col_order` tinyint(3) unsigned NOT NULL,
  `width` smallint(5) unsigned NOT NULL,
  `hgvs` tinyint(1) NOT NULL,
  `standard` tinyint(1) NOT NULL,
  `mandatory` tinyint(1) NOT NULL,
  `head_column` varchar(50) NOT NULL,
  `description_form` text NOT NULL,
  `description_legend_short` text NOT NULL,
  `description_legend_full` text NOT NULL,
  `mysql_type` varchar(255) NOT NULL,
  `form_type` text NOT NULL,
  `select_options` text NOT NULL,
  `preg_pattern` varchar(255) NOT NULL,
  `public_view` tinyint(1) NOT NULL,
  `public_add` tinyint(1) NOT NULL,
  `allow_count_all` tinyint(1) NOT NULL,
  `created_by` smallint(5) unsigned zerofill DEFAULT NULL,
  `created_date` datetime NOT NULL,
  `edited_by` smallint(5) unsigned zerofill DEFAULT NULL,
  `edited_date` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `created_by` (`created_by`),
  KEY `edited_by` (`edited_by`),
  CONSTRAINT `lovd_training_master_columns_fk_created_by` FOREIGN KEY (`created_by`) REFERENCES `lovd_training_master_users` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `lovd_training_master_columns_fk_edited_by` FOREIGN KEY (`edited_by`) REFERENCES `lovd_training_master_users` (`id`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `lovd_training_master_columns`
--
-- ORDER BY:  `id`

LOCK TABLES `lovd_training_master_columns` WRITE;
/*!40000 ALTER TABLE `lovd_training_master_columns` DISABLE KEYS */;
INSERT INTO `lovd_training_master_columns` VALUES ('Individual/Age_of_death',248,100,0,0,0,'Age of death','Type 35y for 35 years, 04y08m for 4 years and 8 months, 18y? for around 18 years, >54y for still alive at 55, ? for unknown.','The age at which the individual deceased, if known and applicable. 04y08m = 4 years and 8 months.','The age at which the individual deceased, if known and applicable.\r\n<UL style=\"margin-top:0px;\">\r\n  <LI>35y = 35 years</LI>\r\n  <LI>04y08m = 4 years and 8 months</LI>\r\n  <LI>18y? = around 18 years</LI>\r\n  <LI>&gt;54y = still alive at 55</LI>\r\n  <LI>? = unknown</LI>\r\n</UL>','VARCHAR(12)','Age of death|The age at which the individual deceased, if known and applicable. Numbers lower than 10 should be prefixed by a zero and the field should always begin with years, to facilitate sorting on this column.|text|10','','/^([<>]?\\d{2,3}y(\\d{2}m(\\d{2}d)?)?)?\\??$/',1,1,1,00000,'2015-02-26 09:58:08',NULL,NULL);
INSERT INTO `lovd_training_master_columns` VALUES ('Individual/Consanguinity',240,40,0,0,0,'Consanguinity','Indicates whether the parents are related (consanguineous), not related (non-consanguineous) or whether consanguinity is not known (unknown)','Indicates whether the parents are related (consanguineous), not related (non-consanguineous) or whether consanguinity is not known (unknown)','Indicates whether the parents are related (consanguineous), not related (non-consanguineous) or whether consanguinity is not known (unknown)','VARCHAR(100)','Consanguinity||select|1|--Not specified--|false|false','? = Unknown\r\nno = Non-consanguineous parents\r\nyes = Consanguineous parents','',1,1,1,00000,'2015-02-26 09:58:08',NULL,NULL);
INSERT INTO `lovd_training_master_columns` VALUES ('Individual/Death/Cause',249,150,0,0,0,'Cause of death','','The cause of the individual\'s death, if known and applicable.','The cause of the individual\'s death, if known and applicable.','VARCHAR(255)','Cause of death|The cause of the individual\'s death, if known and applicable.|text|30','','',1,1,1,00000,'2015-02-26 09:58:08',NULL,NULL);
INSERT INTO `lovd_training_master_columns` VALUES ('Individual/Gender',3,70,0,0,0,'Gender','','Individual\'s gender.','The gender of the reported individual.','VARCHAR(100)','Gender||select|1|--Not specified--|false|false','? = Unknown\r\nF = Female\r\nM = Male\r\nrF = Raised as female\r\nrM = Raised as male','',1,1,1,00000,'2015-02-26 09:58:08',NULL,NULL);
INSERT INTO `lovd_training_master_columns` VALUES ('Individual/Lab_ID',1,80,1,1,1,'Lab-ID','','The individual\'s ID in the hospital, diagnostic laboratory or in the publication.','The individual\'s ID in the hospital, diagnostic laboratory or in the publication.','VARCHAR(15)','Lab ID||text|15','','',0,1,0,00000,'2015-02-26 09:58:08',NULL,NULL);
INSERT INTO `lovd_training_master_columns` VALUES ('Individual/Origin/Ethnic',201,200,0,0,0,'Ethnic origin','Ethnic origin of individual; e.g. African, Caucasian, gypsy, jew (Ashkenazi).','Ethnic origin of individual; e.g. African, Caucasian, gypsy, jew (Ashkenazi).','The ethnic origin of the individual; e.g. African, Caucasian, gypsy, jew (Ashkenazi).','VARCHAR(50)','Ethnic origin|If mixed, please indicate origin of father and mother, if known.|text|20','','',1,1,1,00000,'2015-02-26 09:58:08',NULL,NULL);
INSERT INTO `lovd_training_master_columns` VALUES ('Individual/Origin/Geographic',200,200,0,0,0,'Geographic origin','Geographic origin of individual; Belgium = individual\'s origin is Belgium, (France) = reported by laboratory in France, individual\'s origin not sure.','Geographic origin of individual; Belgium = individual\'s origin is Belgium, (France) = reported by laboratory in France, individual\'s origin not sure.','The geographic origin of the individual (country and/or region); Belgium = individual\'s origin is Belgium, (France) = reported by laboratory in France, individual\'s origin not sure.','VARCHAR(50)','Geographic origin|If mixed, please indicate origin of father and mother, if known.|text|30','','',1,1,1,00000,'2015-02-26 09:58:08',NULL,NULL);
INSERT INTO `lovd_training_master_columns` VALUES ('Individual/Origin/Population',202,200,0,0,0,'Population','','Individual population.','Additional information on the individual\'s population.','VARCHAR(50)','Individual population||text|30','','',1,1,1,00000,'2015-02-26 09:58:08',NULL,NULL);
INSERT INTO `lovd_training_master_columns` VALUES ('Individual/Reference',2,200,1,1,0,'Reference','','Reference to publication describing the individual/family.','Reference to publication describing the individual/family, possibly giving more phenotypic details than listed in this database entry, including link to PubMed or other source, e.g. \"den Dunnen ASHG2003 P2346\". References in the &quot;Country:City&quot; format indicate that the variant was submitted directly to this database by the laboratory indicated.','VARCHAR(200)','Reference||text|50','','',1,1,1,00000,'2015-02-26 09:58:08',NULL,NULL);
INSERT INTO `lovd_training_master_columns` VALUES ('Individual/Remarks',250,200,0,1,0,'Remarks','','Remarks about the individual.','Remarks about the individual.','TEXT','Remarks|Only provide data that do not belong in any other field.|textarea|50|3','','',1,1,1,00000,'2015-02-26 09:58:08',NULL,NULL);
INSERT INTO `lovd_training_master_columns` VALUES ('Individual/Remarks_Non_Public',251,200,0,1,0,'Remarks (non public)','','Non-public remarks about the individual.','Non-public remarks about the individual.','TEXT','Remarks (non public)||textarea|50|3','','',0,0,0,00000,'2015-02-26 09:58:08',NULL,NULL);
INSERT INTO `lovd_training_master_columns` VALUES ('Phenotype/Additional',250,200,0,1,0,'Phenotype details','Additional information on the phenotype of the individual.','Additional information on the phenotype of the individual.','Additional information on the phenotype of the individual.','TEXT','Additional phenotype details||textarea|40|4','','',1,1,1,00000,'2015-02-26 09:58:08',NULL,NULL);
INSERT INTO `lovd_training_master_columns` VALUES ('Phenotype/Age',10,100,0,0,0,'Age examined','Type 35y for 35 years, 04y08m for 4 years and 8 months, 18y? for around 18 years, >54y for older than 54, ? for unknown.','The age at which the individual was examined, if known. 04y08m = 4 years and 8 months.','The age at which the individual was examined, if known.\r\n<UL style=\"margin-top:0px;\">\r\n  <LI>35y = 35 years</LI>\r\n  <LI>04y08m = 4 years and 8 months</LI>\r\n  <LI>18y? = around 18 years</LI>\r\n  <LI>&gt;54y = older than 54</LI>\r\n  <LI>? = unknown</LI>\r\n</UL>','VARCHAR(12)','Age at examination|The age at which the individual was examined, if known. Numbers lower than 10 should be prefixed by a zero and the field should always begin with years, to facilitate sorting on this column.|text|10','','/^([<>]?\\d{2,3}y(\\d{2}m(\\d{2}d)?)?)?\\??$/',1,1,1,00000,'2015-02-26 09:58:08',NULL,NULL);
INSERT INTO `lovd_training_master_columns` VALUES ('Phenotype/Age/Onset',1,100,0,0,0,'Age of onset','Type 35y for 35 years, 04y08m for 4 years and 8 months, 18y? for around 18 years, >54y for older than 54, ? for unknown.','The age at which the first symptoms of the disease appeared in the individual, if known. 04y08m = 4 years and 8 months.','The age at which the first symptoms appeared in the individual, if known.\r\n<UL style=\"margin-top:0px;\">\r\n  <LI>35y = 35 years</LI>\r\n  <LI>04y08m = 4 years and 8 months</LI>\r\n  <LI>18y? = around 18 years</LI>\r\n  <LI>&gt;54y = older than 54</LI>\r\n  <LI>? = unknown</LI>\r\n</UL>','VARCHAR(12)','Age of onset|The age at which the first symptoms appeared in the individual, if known. Numbers lower than 10 should be prefixed by a zero and the field should always begin with years, to facilitate sorting on this column.|text|10','','/^([<>]?\\d{2,3}y(\\d{2}m(\\d{2}d)?)?)?\\??$/',1,1,1,00000,'2015-02-26 09:58:08',NULL,NULL);
INSERT INTO `lovd_training_master_columns` VALUES ('Phenotype/Date',5,80,0,0,0,'Date','Format: YYYY-MM-DD.','Date the phenotype was observed.','Date the phenotype was observed, in YYYY-MM-DD format.','DATE','Date||text|10','','',1,1,1,00000,'2015-02-26 09:58:08',NULL,NULL);
INSERT INTO `lovd_training_master_columns` VALUES ('Phenotype/Inheritance',254,200,1,1,0,'Inheritance','Indicates the inheritance of the phenotype in the family; unknown, familial (autosomal/X-linked, dominant/ recessive), paternal (Y-linked), maternal (mitochondrial), isolated (sporadic) or complex','Indicates the inheritance of the phenotype in the family; unknown, familial (autosomal/X-linked, dominant/ recessive), paternal (Y-linked), maternal (mitochondrial), isolated (sporadic) or complex','Indicates the inheritance of the phenotype in the family; unknown, familial (autosomal/X-linked, dominant/ recessive), paternal (Y-linked), maternal (mitochondrial), isolated (sporadic) or complex','VARCHAR(50)','Inheritance||select|1|--Not specified--|false|false','Unknown\r\nFamilial\r\nFamilial, autosomal dominant\r\nFamilial, autosomal recessive\r\nFamilial, X-linked dominant\r\nFamilial, X-linked dominant, male sparing\r\nFamilial, X-linked recessive\r\nPaternal, Y-linked\r\nMaternal, mitochondrial\r\nIsolated (sporadic)\r\nComplex','',1,1,1,00000,'2015-02-26 09:58:08',NULL,NULL);
INSERT INTO `lovd_training_master_columns` VALUES ('Phenotype/Length',200,100,0,0,0,'Length','','Length of the individual, in cm.','Length of the individual, in centimeters (cm).','SMALLINT(3) UNSIGNED','Length of individual (cm)|Length of individual, in centimeters.|text|3','','',1,1,1,00000,'2015-02-26 09:58:08',NULL,NULL);
INSERT INTO `lovd_training_master_columns` VALUES ('Screening/Date',1,80,0,0,0,'Date','Format: YYYY-MM-DD.','Date the detection technique was performed.','Date the detection technique was performed, in YYYY-MM-DD format.','DATE','Date||text|10','','',1,1,1,00000,'2015-02-26 09:58:08',NULL,NULL);
INSERT INTO `lovd_training_master_columns` VALUES ('Screening/Technique',3,200,1,1,1,'Technique','Technique(s) used to identify the sequence variant; select multiple when more were used. For SEQ-NG, please indicate in the variant\'s remarks field the number of reads showing the variant (e.g. 47/96 reads, 123/123 reads), and create a second screening if you confirmed a variant using another method (e.g. SEQ).','Technique(s) used to identify the sequence variant.','Technique(s) used to identify the sequence variant.','TEXT','Technique(s) used||select|5|false|true|false','? = Unknown\r\narrayCGH = array for Comparative Genomic Hybridisation\r\narraySEQ = array for resequencing\r\narraySNP = array for SNP typing\r\narrayCNV = array for Copy Number Variation (SNP and CNV probes)\r\nBESS = Base Excision Sequence Scanning\r\nCMC = Chemical Mismatch Cleavage\r\nCSCE = Conformation Sensitive Capillary Electrophoresis\r\nDGGE = Denaturing-Gradient Gel-Electrophoresis\r\nDHPLC = Denaturing High-Performance Liquid Chromatography\r\nDOVAM = Detection Of Virtually All Mutations (SSCA variant)\r\nddF = dideoxy Fingerprinting\r\nDSCA = Double-Strand DNA Conformation Analysis\r\nEMC = Enzymatic Mismatch Cleavage\r\nHD = HeteroDuplex analysis\r\nMCA = high-resolution Melting Curve Analysis (hrMCA)\r\nIHC = Immuno-Histo-Chemistry\r\nMAPH = Multiplex Amplifiable Probe Hybridisation\r\nMLPA = Multiplex Ligation-dependent Probe Amplification\r\nSEQ-NG = Next-Generation Sequencing\r\nSEQ-NG-H = Next-Generation Sequencing - Helicos\r\nSEQ-NG-I = Next-Generation Sequencing - Illumina/Solexa\r\nSEQ-NG-R = Next-Generation Sequencing - Roche/454\r\nSEQ-NG-S = Next-Generation Sequencing - SOLiD\r\nNorthern = Northern blotting\r\nPCR = Polymerase Chain Reaction\r\nPCRdig = PCR + restriction enzyme digestion\r\nPCRlr = PCR, long-range\r\nPCRm = PCR, multiplex\r\nPCRq = PCR, quantitative\r\nPAGE = Poly-Acrylamide Gel-Electrophoresis\r\nPTT = Protein Truncation Test\r\nPFGE = Pulsed-Field Gel-Electrophoresis (+Southern)\r\nRT-PCR = Reverse Transcription and PCR\r\nSEQ = SEQuencing\r\nSBE = Single Base Extension\r\nSSCA = Single-Strand DNA Conformation polymorphism Analysis (SSCP)\r\nSSCAf = SSCA, fluorescent (SSCP)\r\nSouthern = Southern blotting\r\nTaqMan = TaqMan assay\r\nWestern = Western Blotting','',1,1,1,00000,'2015-02-26 09:58:08',NULL,NULL);
INSERT INTO `lovd_training_master_columns` VALUES ('Screening/Template',2,80,1,1,1,'Template','','Template(s) used to detect the sequence variant; DNA = genomic DNA, RNA = RNA (cDNA).','Template(s) used to detect the sequence variant; DNA = genomic DNA, RNA = RNA (cDNA).','TEXT','Detection template||select|3|false|true|false','DNA\r\nRNA = RNA (cDNA)\r\nProtein\r\n? = unknown','',1,1,1,00000,'2015-02-26 09:58:08',NULL,NULL);
INSERT INTO `lovd_training_master_columns` VALUES ('Screening/Tissue',4,100,0,0,1,'Tissue','','Tissue type used for the detection of sequence variants.','Tissue type used for the detection of sequence variants.','VARCHAR(25)','Tissue||text|20','','',1,1,1,00000,'2015-02-26 09:58:08',NULL,NULL);
INSERT INTO `lovd_training_master_columns` VALUES ('VariantOnGenome/Conservation_score/GERP',4,100,0,0,0,'GERP conservation','','Conservation score as calculated by GERP.','The Conservation score as calculated by GERP.','DECIMAL(5,3)','GERP conservation score||text|6','','',1,1,1,00000,'2015-02-26 09:58:08',NULL,NULL);
INSERT INTO `lovd_training_master_columns` VALUES ('VariantOnGenome/DBID',7,120,1,1,1,'DB-ID','NOTE: This field will be predicted and filled in by LOVD, if left empty.','Database ID of variant starting with the HGNC gene symbol, followed by an underscore (_) and a six digit number (e.g. DMD_012345). _000000 is used for variants where DNA was not analysed (change predicted from RNA analysis), variants seen in animal models or variants not seen in humans but functionally tested in vitro.','Database ID of variant, grouping multiple observations of the same variant together, starting with the HGNC gene symbol, followed by an underscore (_) and a six digit number (e.g. DMD_012345). _000000 is used for variants where DNA was not analysed (change predicted from RNA analysis), variants seen in animal models or variants not seen in humans but functionally tested in vitro.','VARCHAR(50)','ID|This ID is used to group multiple observations of the same variant together. This field will be predicted and filled in by LOVD when left empty. The ID starts with the HGNC gene symbol of the transcript most influenced by the variant or otherwise the closest gene, followed by an underscore (_) and a six digit number (e.g. DMD_012345). _000000 is used for variants where DNA was not analysed (change predicted from RNA analysis), variants seen in animal models or variants not seen in humans but functionally tested in vitro.|text|20','','/^(chr(\\d{1,2}|[XYM])|(C(\\d{1,2}|[XYM])orf[\\d][\\dA-Z]*-|[A-Z][A-Z0-9]+-)?(C(\\d{1,2}|[XYM])orf[\\d][\\dA-Z]*|[A-Z][A-Z0-9-]+))_\\d{6}$/',1,0,1,00000,'2015-02-26 09:58:08',NULL,NULL);
INSERT INTO `lovd_training_master_columns` VALUES ('VariantOnGenome/dbSNP',8,120,0,0,0,'dbSNP ID','','The dbSNP ID.','The dbSNP ID.','VARCHAR(15)','dbSNP ID|If available, please fill in the dbSNP ID, such as rs12345678.|text|10','','/^[rs]s\\d+$/',1,1,1,00000,'2015-02-26 09:58:08',NULL,NULL);
INSERT INTO `lovd_training_master_columns` VALUES ('VariantOnGenome/DNA',2,200,1,1,1,'DNA change (genomic)','','Description of variant at DNA level, based on the genomic DNA reference sequence (following HGVS recommendations).','Description of variant at DNA level, based on the genomic DNA reference sequence (following HGVS recommendations).<BR>\r\n<UL style=\"margin-top : 0px;\">\r\n  <LI>g.12345678C>T</LI>\r\n  <LI>g.12345678_12345890del</LI>\r\n  <LI>g.12345678_12345890dup</LI>\r\n</UL>','VARCHAR(100)','Genomic DNA change (HGVS format)|Description of variant at DNA level, based on the genomic DNA reference sequence (following HGVS recommendations); e.g. g.12345678C>T, g.12345678_12345890del, g.12345678_12345890dup.|text|30','','',1,1,1,00000,'2015-02-26 09:58:08',NULL,NULL);
INSERT INTO `lovd_training_master_columns` VALUES ('VariantOnGenome/Frequency',9,90,0,1,0,'Frequency','','Frequency in which the variant was found; e.g 5/760 chromosomes (in 5 of 760 chromosomes tested), 1/33 patients (in 1 of 33 patients analysed in study), 0.05 controls (in 5% of control cases tested).','Frequency in which the variant was found; e.g 5/760 chromosomes (in 5 of 760 chromosomes tested), 1/33 patients (in 1 of 33 patients analysed in study), 0.05 controls (in 5% of control cases tested).','VARCHAR(15)','Frequency|Frequency in which the variant was found; e.g 5/760 chromosomes (in 5 of 760 chromosomes tested), 1/33 patients (in 1 of 33 patients analysed in study), 0.05 controls (in 5% of control cases tested). Preferred format is 3/75, not 0.04.|text|10','','',1,1,1,00000,'2015-02-26 09:58:08',NULL,NULL);
INSERT INTO `lovd_training_master_columns` VALUES ('VariantOnGenome/Genetic_origin',11,200,0,0,1,'Genetic origin','','Origin of variant; unknown, germline (inherited), somatic, de novo, from parental disomy (maternal or paternal) or in vitro (cloned) when tested for functional consequences.','Origin of variant; unknown, germline (inherited), somatic, de novo, from parental disomy (maternal or paternal) or in vitro (cloned) when tested for functional consequences.','VARCHAR(100)','Genetic origin||select|1|--Not specified--|false|false','Unknown\r\nGermline (inherited)\r\nSomatic\r\nDe novo\r\nUniparental disomy\r\nUniparental disomy, maternal allele\r\nUniparental disomy, paternal allele\r\nIn vitro (cloned)','',1,1,1,00000,'2015-02-26 09:58:08',NULL,NULL);
INSERT INTO `lovd_training_master_columns` VALUES ('VariantOnGenome/Published_as',3,200,0,0,0,'Published as','Variant as originally reported (e.g. 521delT); provide only when different from \"DNA change\".','Variant as originally reported (e.g. 521delT); listed only when different from \"DNA change\". Variants seen in animal models, tested in vitro, predicted from RNA analysis, etc. are described between brackets like c.(456C>G).','Variant as originally reported (e.g. 521delT); listed only when different from \"DNA change\". Variants seen in animal models, tested in vitro, predicted from RNA analysis, etc. are described between brackets like c.(456C>G).','VARCHAR(100)','Published as|Variants seen in animal models, tested in vitro, predicted from RNA analysis, etc. are described between brackets like c.(456C>G).|text|30','','',1,1,1,00000,'2015-02-26 09:58:08',NULL,NULL);
INSERT INTO `lovd_training_master_columns` VALUES ('VariantOnGenome/Reference',6,200,1,1,0,'Reference','','Reference to publication describing the variant.','Reference to publication describing the variant, including links to OMIM (when available), PubMed or or other source, e.g. \"den Dunnen ASHG2003 P2346\".','VARCHAR(255)','Reference||text|50','','',1,1,1,00000,'2015-02-26 09:58:08',NULL,NULL);
INSERT INTO `lovd_training_master_columns` VALUES ('VariantOnGenome/Remarks',10,200,0,0,0,'Variant remarks','Remarks regarding the variant described, e.g. germline mosaicism in mother, 345 kb deletion, muscle RNA analysed, not in 200 control chromosomes tested, on founder haplotype, etc.','Remarks regarding the variant described.','Remarks regarding the variant described, e.g. germline mosaicism in mother, 345 kb deletion, muscle RNA analysed, not in 200 control chromosomes tested, on founder haplotype, etc.','TEXT','Remarks||textarea|50|3','','',1,1,1,00000,'2015-02-26 09:58:08',NULL,NULL);
INSERT INTO `lovd_training_master_columns` VALUES ('VariantOnGenome/Restriction_site',5,75,0,0,0,'Re-site','','Restriction enzyme recognition site created (+) or destroyed (-).','Restriction enzyme recognition site created (+) or destroyed (-); e.g. BglII+, BamHI-.','VARCHAR(25)','Re-site|Restriction enzyme recognition site created (+) or destroyed (-); e.g. BglII+, BamHI-|text|10','','',1,1,1,00000,'2015-02-26 09:58:08',NULL,NULL);
INSERT INTO `lovd_training_master_columns` VALUES ('VariantOnGenome/Segregation',12,40,0,0,0,'Segregation','Indicates whether the variant segregates with the phenotype (yes), does not segregate with the phenotype (no) or segregation is unknown (?)','Indicates whether the variant segregates with the phenotype (yes), does not segregate with the phenotype (no) or segregation is unknown (?)','Indicates whether the variant segregates with the phenotype (yes), does not segregate with the phenotype (no) or segregation is unknown (?)','VARCHAR(100)','Segregation||select|1|--Not specified--|false|false','? = Unknown\r\nyes = Segregates with phenotype\r\nno = Does not segregate with phenotype','',1,1,1,00000,'2015-02-26 09:58:08',NULL,NULL);
INSERT INTO `lovd_training_master_columns` VALUES ('VariantOnGenome/Type',1,200,0,0,1,'Type','','Type of variant at DNA level.','Type of variant at DNA level; note that the variant type can also be derived from the variant description (for all levels).','VARCHAR(100)','Type of variant (DNA level)|Type of variant at DNA level; note that the variant type can also be derived from the variant description (for all levels).|select|1|true|false|false','Substitution\r\nDeletion\r\nDuplication\r\nInsertion\r\nInversion\r\nInsertion/Deletion\r\nTranslocation\r\nOther/Complex','',1,1,1,00000,'2015-02-26 09:58:08',NULL,NULL);
INSERT INTO `lovd_training_master_columns` VALUES ('VariantOnTranscript/Distance_to_splice_site',10,150,0,0,0,'Splice distance','','The distance to the nearest splice site.','The distance to the nearest splice site.','MEDIUMINT(8) UNSIGNED','Distance to splice site||text|8','','',1,1,1,00000,'2015-02-26 09:58:08',NULL,NULL);
INSERT INTO `lovd_training_master_columns` VALUES ('VariantOnTranscript/DNA',3,200,1,1,1,'DNA change (cDNA)','','Description of variant at DNA level, based on a coding DNA reference sequence (following HGVS recommendations).','Description of variant at DNA level, based on a coding DNA reference sequence (following HGVS recommendations); e.g. c.123C>T, c.123_145del, c.123_126dup.','VARCHAR(100)','DNA change (HGVS format)|Description of variant at DNA level, based on a coding DNA reference sequence (following HGVS recommendations); e.g. c.123C>T, c.123_145del, c.123_126dup.|text|30','','',1,1,1,00000,'2015-02-26 09:58:08',NULL,NULL);
INSERT INTO `lovd_training_master_columns` VALUES ('VariantOnTranscript/Exon',2,50,0,1,1,'Exon','','Number of exon/intron containing the variant.','Number of exon/intron containing variant; 2 = exon 2, 12i = intron 12, 2i_7i = exons 3 to 7, 8i_9 = border intron 8/exon 9.','VARCHAR(7)','Exon|Format: 2 = exon 2, 12i = intron 12, 2i_7i = exons 3 to 7, 8i_9 = border intron 8/exon 9.|text|7','','',1,1,1,00000,'2015-02-26 09:58:08',NULL,NULL);
INSERT INTO `lovd_training_master_columns` VALUES ('VariantOnTranscript/GVS/Function',9,200,0,0,0,'GVS function','','Functional annotation of this position from the Genome Variation Server.','The functional annotation of this position from the Genome Variation Server.','VARCHAR(100)','GVS function||select|1|true|false|false','intergenic\r\nnear-gene-5\r\nutr-5\r\ncoding\r\ncoding-near-splice\r\ncodingComplex\r\ncodingComplex-near-splice\r\nframeshift\r\nframeshift-near-splice\r\nsplice-5\r\nintron\r\nsplice-3\r\nutr-3\r\nnear-gene-3','',1,1,1,00000,'2015-02-26 09:58:08',NULL,NULL);
INSERT INTO `lovd_training_master_columns` VALUES ('VariantOnTranscript/Location',1,200,0,0,1,'Location','','Location of variant at DNA level.','Location of variant at DNA level; note that the variant location can also be derived from the variant description.','VARCHAR(100)','Location of variant|The variant location can also be derived from the variant description|select|1|true|false|false','5\' gene flanking\r\n5\' UTR\r\nExon\r\nIntron\r\n3\' UTR\r\n3\' gene flanking','',1,1,1,00000,'2015-02-26 09:58:08',NULL,NULL);
INSERT INTO `lovd_training_master_columns` VALUES ('VariantOnTranscript/PolyPhen',8,200,0,0,0,'PolyPhen prediction','','Effect of variant, predicted by PolyPhen.','Effect of variant, predicted by PolyPhen.','VARCHAR(100)','PolyPhen prediction|Effect of variant, predicted by PolyPhen|select|1|true|false|false','benign = Benign\r\npossiblyDamaging = Possibly damaging\r\nprobablyDamaging = Probably damaging\r\nnoPrediction = No prediction','',1,1,1,00000,'2015-02-26 09:58:08',NULL,NULL);
INSERT INTO `lovd_training_master_columns` VALUES ('VariantOnTranscript/Position',5,100,0,0,0,'Position','','Position of variant in coding DNA sequence.','Position of variant in coding DNA sequence; note that coding DNA position can also be derived from the variant description.','MEDIUMINT(5)','cDNA position|Note that cDNA position can be derived from the variant description.|text|5','','',1,1,1,00000,'2015-02-26 09:58:08',NULL,NULL);
INSERT INTO `lovd_training_master_columns` VALUES ('VariantOnTranscript/Protein',7,200,1,1,1,'Protein','','Description of variant at protein level (following HGVS recommendations).','Description of variant at protein level (following HGVS recommendations).<BR>\r\n<UL style=\"margin-top : 0px;\">\r\n  <LI>p.(Arg345Pro) = change predicted from DNA (RNA not analysed)</LI>\r\n  <LI>p.Arg345Pro = change derived from RNA analysis</LI>\r\n  <LI>p.? = unknown effect</LI>\r\n  <LI>p.0? = probably no protein produced</LI>\r\n</UL>','VARCHAR(100)','Protein change (HGVS format)|Description of variant at protein level (following HGVS recommendations); e.g. p.(Arg345Pro) = change predicted from DNA (RNA not analysed), p.Arg345Pro = change derived from RNA analysis, p.0 (no protein produced), p.? (unknown effect).|text|30','','',1,1,1,00000,'2015-02-26 09:58:08',NULL,NULL);
INSERT INTO `lovd_training_master_columns` VALUES ('VariantOnTranscript/Published_as',4,200,0,0,0,'Published as','Variant as originally reported (e.g. 521delT); provide only when different from \"DNA change\".','Variant as originally reported (e.g. 521delT); listed only when different from \"DNA change\". Variants seen in animal models, tested in vitro, predicted from RNA analysis, etc. are described between brackets like c.(456C>G).','Variant as originally reported (e.g. 521delT); listed only when different from \"DNA change\". Variants seen in animal models, tested in vitro, predicted from RNA analysis, etc. are described between brackets like c.(456C>G).','VARCHAR(100)','Published as|Variants seen in animal models, tested in vitro, predicted from RNA analysis, etc. are described between brackets like c.(456C>G).|text|30','','',1,1,1,00000,'2015-02-26 09:58:08',NULL,NULL);
INSERT INTO `lovd_training_master_columns` VALUES ('VariantOnTranscript/RNA',6,200,1,1,1,'RNA change','','Description of variant at RNA level (following HGVS recommendations).','Description of variant at RNA level (following HGVS recommendations).<BR>\r\n<UL style=\"margin-top : 0px;\">\r\n  <LI>r.123c>u</LI>\r\n  <LI>r.? = unknown</LI>\r\n  <LI>r.(?) = RNA not analysed but probably transcribed copy of DNA variant</LI>\r\n  <LI>r.spl? = RNA not analysed but variant probably affects splicing</LI>\r\n  <LI>r.(spl?) = RNA not analysed but variant may affect splicing</LI>\r\n  <LI>r.0? = change expected to abolish transcription</LI>\r\n</UL>','VARCHAR(100)','RNA change (HGVS format)|Description of variant at RNA level (following HGVS recommendations); e.g. r.123c>u, r.? = unknown, r.(?) = RNA not analysed but probably transcribed copy of DNA variant, r.spl? = RNA not analysed but variant probably affects splicing, r.(spl?) = RNA not analysed but variant may affect splicing.|text|30','','',1,1,1,00000,'2015-02-26 09:58:08',NULL,NULL);
/*!40000 ALTER TABLE `lovd_training_master_columns` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `lovd_training_master_columns2links`
--

DROP TABLE IF EXISTS `lovd_training_master_columns2links`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `lovd_training_master_columns2links` (
  `colid` varchar(100) NOT NULL,
  `linkid` tinyint(3) unsigned zerofill NOT NULL,
  PRIMARY KEY (`colid`,`linkid`),
  KEY `linkid` (`linkid`),
  CONSTRAINT `lovd_training_master_columns2links_fk_colid` FOREIGN KEY (`colid`) REFERENCES `lovd_training_master_columns` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `lovd_training_master_columns2links_fk_linkid` FOREIGN KEY (`linkid`) REFERENCES `lovd_training_master_links` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `lovd_training_master_columns2links`
--
-- ORDER BY:  `colid`,`linkid`

LOCK TABLES `lovd_training_master_columns2links` WRITE;
/*!40000 ALTER TABLE `lovd_training_master_columns2links` DISABLE KEYS */;
INSERT INTO `lovd_training_master_columns2links` VALUES ('Individual/Reference',001);
INSERT INTO `lovd_training_master_columns2links` VALUES ('VariantOnGenome/Reference',001);
INSERT INTO `lovd_training_master_columns2links` VALUES ('VariantOnGenome/Reference',002);
INSERT INTO `lovd_training_master_columns2links` VALUES ('VariantOnGenome/Reference',003);
INSERT INTO `lovd_training_master_columns2links` VALUES ('VariantOnGenome/Reference',004);
/*!40000 ALTER TABLE `lovd_training_master_columns2links` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `lovd_training_master_config`
--

DROP TABLE IF EXISTS `lovd_training_master_config`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `lovd_training_master_config` (
  `system_title` varchar(255) NOT NULL,
  `institute` varchar(255) NOT NULL,
  `location_url` varchar(255) NOT NULL,
  `email_address` varchar(75) NOT NULL,
  `send_admin_submissions` tinyint(1) NOT NULL,
  `api_feed_history` tinyint(2) unsigned NOT NULL,
  `refseq_build` varchar(4) NOT NULL,
  `proxy_host` varchar(255) NOT NULL,
  `proxy_port` smallint(5) unsigned DEFAULT NULL,
  `proxy_username` varchar(255) NOT NULL,
  `proxy_password` varchar(255) NOT NULL,
  `logo_uri` varchar(100) NOT NULL DEFAULT 'gfx/LOVD3_logo145x50.jpg',
  `mutalyzer_soap_url` varchar(100) NOT NULL DEFAULT 'https://mutalyzer.nl/services',
  `omim_apikey` varchar(40) NOT NULL,
  `send_stats` tinyint(1) NOT NULL,
  `include_in_listing` tinyint(1) NOT NULL,
  `lock_users` tinyint(1) NOT NULL,
  `allow_unlock_accounts` tinyint(1) NOT NULL,
  `allow_submitter_mods` tinyint(1) NOT NULL,
  `allow_count_hidden_entries` tinyint(1) NOT NULL,
  `use_ssl` tinyint(1) NOT NULL,
  `use_versioning` tinyint(1) NOT NULL,
  `lock_uninstall` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `lovd_training_master_config`
--

LOCK TABLES `lovd_training_master_config` WRITE;
/*!40000 ALTER TABLE `lovd_training_master_config` DISABLE KEYS */;
INSERT INTO `lovd_training_master_config` VALUES ('LOVD - Leiden Open Variation Database','Leiden University Medical Center','http://courses.lovd.nl/LOVD3/master/','noreply@LOVD.nl',0,0,'hg19','',NULL,'','','gfx/LOVD3_logo145x50.jpg','https://mutalyzer.nl/services','',0,0,1,1,1,0,0,0,0);
/*!40000 ALTER TABLE `lovd_training_master_config` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `lovd_training_master_countries`
--

DROP TABLE IF EXISTS `lovd_training_master_countries`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `lovd_training_master_countries` (
  `id` char(2) NOT NULL,
  `name` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `lovd_training_master_countries`
--
-- ORDER BY:  `id`

LOCK TABLES `lovd_training_master_countries` WRITE;
/*!40000 ALTER TABLE `lovd_training_master_countries` DISABLE KEYS */;
INSERT INTO `lovd_training_master_countries` VALUES ('AD','Andorra');
INSERT INTO `lovd_training_master_countries` VALUES ('AE','United Arab Emirates');
INSERT INTO `lovd_training_master_countries` VALUES ('AF','Afghanistan');
INSERT INTO `lovd_training_master_countries` VALUES ('AG','Antigua and Barbuda');
INSERT INTO `lovd_training_master_countries` VALUES ('AI','Anguilla');
INSERT INTO `lovd_training_master_countries` VALUES ('AL','Albania');
INSERT INTO `lovd_training_master_countries` VALUES ('AM','Armenia');
INSERT INTO `lovd_training_master_countries` VALUES ('AN','Netherlands Antilles');
INSERT INTO `lovd_training_master_countries` VALUES ('AO','Angola');
INSERT INTO `lovd_training_master_countries` VALUES ('AQ','Antarctica');
INSERT INTO `lovd_training_master_countries` VALUES ('AR','Argentina');
INSERT INTO `lovd_training_master_countries` VALUES ('AS','American Samoa');
INSERT INTO `lovd_training_master_countries` VALUES ('AT','Austria');
INSERT INTO `lovd_training_master_countries` VALUES ('AU','Australia');
INSERT INTO `lovd_training_master_countries` VALUES ('AW','Aruba');
INSERT INTO `lovd_training_master_countries` VALUES ('AX','Åland Islands');
INSERT INTO `lovd_training_master_countries` VALUES ('AZ','Azerbaijan');
INSERT INTO `lovd_training_master_countries` VALUES ('BA','Bosnia and Herzegovina');
INSERT INTO `lovd_training_master_countries` VALUES ('BB','Barbados');
INSERT INTO `lovd_training_master_countries` VALUES ('BD','Bangladesh');
INSERT INTO `lovd_training_master_countries` VALUES ('BE','Belgium');
INSERT INTO `lovd_training_master_countries` VALUES ('BF','Burkina Faso');
INSERT INTO `lovd_training_master_countries` VALUES ('BG','Bulgaria');
INSERT INTO `lovd_training_master_countries` VALUES ('BH','Bahrain');
INSERT INTO `lovd_training_master_countries` VALUES ('BI','Burundi');
INSERT INTO `lovd_training_master_countries` VALUES ('BJ','Benin');
INSERT INTO `lovd_training_master_countries` VALUES ('BL','Saint Barthélemy');
INSERT INTO `lovd_training_master_countries` VALUES ('BM','Bermuda');
INSERT INTO `lovd_training_master_countries` VALUES ('BN','Brunei Darussalam');
INSERT INTO `lovd_training_master_countries` VALUES ('BO','Bolivia (Plurinational State of)');
INSERT INTO `lovd_training_master_countries` VALUES ('BR','Brazil');
INSERT INTO `lovd_training_master_countries` VALUES ('BS','Bahamas');
INSERT INTO `lovd_training_master_countries` VALUES ('BT','Bhutan');
INSERT INTO `lovd_training_master_countries` VALUES ('BV','Bouvet Island');
INSERT INTO `lovd_training_master_countries` VALUES ('BW','Botswana');
INSERT INTO `lovd_training_master_countries` VALUES ('BY','Belarus');
INSERT INTO `lovd_training_master_countries` VALUES ('BZ','Belize');
INSERT INTO `lovd_training_master_countries` VALUES ('CA','Canada');
INSERT INTO `lovd_training_master_countries` VALUES ('CC','Cocos (Keeling) Islands');
INSERT INTO `lovd_training_master_countries` VALUES ('CD','Congo (Democratic Republic of the)');
INSERT INTO `lovd_training_master_countries` VALUES ('CF','Central African Republic');
INSERT INTO `lovd_training_master_countries` VALUES ('CG','Congo');
INSERT INTO `lovd_training_master_countries` VALUES ('CH','Switzerland');
INSERT INTO `lovd_training_master_countries` VALUES ('CI','Côte D\'Ivoire (Ivory Coast)');
INSERT INTO `lovd_training_master_countries` VALUES ('CK','Cook Islands');
INSERT INTO `lovd_training_master_countries` VALUES ('CL','Chile');
INSERT INTO `lovd_training_master_countries` VALUES ('CM','Cameroon');
INSERT INTO `lovd_training_master_countries` VALUES ('CN','China');
INSERT INTO `lovd_training_master_countries` VALUES ('CO','Colombia');
INSERT INTO `lovd_training_master_countries` VALUES ('CR','Costa Rica');
INSERT INTO `lovd_training_master_countries` VALUES ('CU','Cuba');
INSERT INTO `lovd_training_master_countries` VALUES ('CV','Cape Verde');
INSERT INTO `lovd_training_master_countries` VALUES ('CX','Christmas Island');
INSERT INTO `lovd_training_master_countries` VALUES ('CY','Cyprus');
INSERT INTO `lovd_training_master_countries` VALUES ('CZ','Czech Republic');
INSERT INTO `lovd_training_master_countries` VALUES ('DE','Germany');
INSERT INTO `lovd_training_master_countries` VALUES ('DJ','Djibouti');
INSERT INTO `lovd_training_master_countries` VALUES ('DK','Denmark');
INSERT INTO `lovd_training_master_countries` VALUES ('DM','Dominica');
INSERT INTO `lovd_training_master_countries` VALUES ('DO','Dominican Republic');
INSERT INTO `lovd_training_master_countries` VALUES ('DZ','Algeria');
INSERT INTO `lovd_training_master_countries` VALUES ('EC','Ecuador');
INSERT INTO `lovd_training_master_countries` VALUES ('EE','Estonia');
INSERT INTO `lovd_training_master_countries` VALUES ('EG','Egypt');
INSERT INTO `lovd_training_master_countries` VALUES ('EH','Western Sahara');
INSERT INTO `lovd_training_master_countries` VALUES ('ER','Eritrea');
INSERT INTO `lovd_training_master_countries` VALUES ('ES','Spain');
INSERT INTO `lovd_training_master_countries` VALUES ('ET','Ethiopia');
INSERT INTO `lovd_training_master_countries` VALUES ('FI','Finland');
INSERT INTO `lovd_training_master_countries` VALUES ('FJ','Fiji');
INSERT INTO `lovd_training_master_countries` VALUES ('FK','Falkland Islands (Malvinas)');
INSERT INTO `lovd_training_master_countries` VALUES ('FM','Micronesia (Federated States of)');
INSERT INTO `lovd_training_master_countries` VALUES ('FO','Faroe Islands');
INSERT INTO `lovd_training_master_countries` VALUES ('FR','France');
INSERT INTO `lovd_training_master_countries` VALUES ('GA','Gabon');
INSERT INTO `lovd_training_master_countries` VALUES ('GB','United Kingdom (Great Britain)');
INSERT INTO `lovd_training_master_countries` VALUES ('GD','Grenada');
INSERT INTO `lovd_training_master_countries` VALUES ('GE','Georgia');
INSERT INTO `lovd_training_master_countries` VALUES ('GF','French Guiana');
INSERT INTO `lovd_training_master_countries` VALUES ('GG','Guernsey');
INSERT INTO `lovd_training_master_countries` VALUES ('GH','Ghana');
INSERT INTO `lovd_training_master_countries` VALUES ('GI','Gibraltar');
INSERT INTO `lovd_training_master_countries` VALUES ('GL','Greenland');
INSERT INTO `lovd_training_master_countries` VALUES ('GM','Gambia');
INSERT INTO `lovd_training_master_countries` VALUES ('GN','Guinea');
INSERT INTO `lovd_training_master_countries` VALUES ('GP','Guadeloupe');
INSERT INTO `lovd_training_master_countries` VALUES ('GQ','Equatorial Guinea');
INSERT INTO `lovd_training_master_countries` VALUES ('GR','Greece');
INSERT INTO `lovd_training_master_countries` VALUES ('GS','South Georgia and The South Sandwich Islands');
INSERT INTO `lovd_training_master_countries` VALUES ('GT','Guatemala');
INSERT INTO `lovd_training_master_countries` VALUES ('GU','Guam');
INSERT INTO `lovd_training_master_countries` VALUES ('GW','Guinea-Bissau');
INSERT INTO `lovd_training_master_countries` VALUES ('GY','Guyana');
INSERT INTO `lovd_training_master_countries` VALUES ('HK','Hong Kong');
INSERT INTO `lovd_training_master_countries` VALUES ('HM','Heard Island and McDonald Islands');
INSERT INTO `lovd_training_master_countries` VALUES ('HN','Honduras');
INSERT INTO `lovd_training_master_countries` VALUES ('HR','Croatia');
INSERT INTO `lovd_training_master_countries` VALUES ('HT','Haiti');
INSERT INTO `lovd_training_master_countries` VALUES ('HU','Hungary');
INSERT INTO `lovd_training_master_countries` VALUES ('ID','Indonesia');
INSERT INTO `lovd_training_master_countries` VALUES ('IE','Ireland');
INSERT INTO `lovd_training_master_countries` VALUES ('IL','Israel');
INSERT INTO `lovd_training_master_countries` VALUES ('IM','Isle of Man');
INSERT INTO `lovd_training_master_countries` VALUES ('IN','India');
INSERT INTO `lovd_training_master_countries` VALUES ('IO','British Indian Ocean Territory');
INSERT INTO `lovd_training_master_countries` VALUES ('IQ','Iraq');
INSERT INTO `lovd_training_master_countries` VALUES ('IR','Iran (Islamic Republic of)');
INSERT INTO `lovd_training_master_countries` VALUES ('IS','Iceland');
INSERT INTO `lovd_training_master_countries` VALUES ('IT','Italy');
INSERT INTO `lovd_training_master_countries` VALUES ('JE','Jersey');
INSERT INTO `lovd_training_master_countries` VALUES ('JM','Jamaica');
INSERT INTO `lovd_training_master_countries` VALUES ('JO','Jordan');
INSERT INTO `lovd_training_master_countries` VALUES ('JP','Japan');
INSERT INTO `lovd_training_master_countries` VALUES ('KE','Kenya');
INSERT INTO `lovd_training_master_countries` VALUES ('KG','Kyrgyzstan');
INSERT INTO `lovd_training_master_countries` VALUES ('KH','Cambodia');
INSERT INTO `lovd_training_master_countries` VALUES ('KI','Kiribati');
INSERT INTO `lovd_training_master_countries` VALUES ('KM','Comoros');
INSERT INTO `lovd_training_master_countries` VALUES ('KN','Saint Kitts and Nevis');
INSERT INTO `lovd_training_master_countries` VALUES ('KP','Korea (North) (Democratic People\'s Republic of)');
INSERT INTO `lovd_training_master_countries` VALUES ('KR','Korea (South) (Republic of)');
INSERT INTO `lovd_training_master_countries` VALUES ('KW','Kuwait');
INSERT INTO `lovd_training_master_countries` VALUES ('KY','Cayman Islands');
INSERT INTO `lovd_training_master_countries` VALUES ('KZ','Kazakhstan');
INSERT INTO `lovd_training_master_countries` VALUES ('LA','Lao People\'s Democratic Republic');
INSERT INTO `lovd_training_master_countries` VALUES ('LB','Lebanon');
INSERT INTO `lovd_training_master_countries` VALUES ('LC','Saint Lucia');
INSERT INTO `lovd_training_master_countries` VALUES ('LI','Liechtenstein');
INSERT INTO `lovd_training_master_countries` VALUES ('LK','Sri Lanka');
INSERT INTO `lovd_training_master_countries` VALUES ('LR','Liberia');
INSERT INTO `lovd_training_master_countries` VALUES ('LS','Lesotho');
INSERT INTO `lovd_training_master_countries` VALUES ('LT','Lithuania');
INSERT INTO `lovd_training_master_countries` VALUES ('LU','Luxembourg');
INSERT INTO `lovd_training_master_countries` VALUES ('LV','Latvia');
INSERT INTO `lovd_training_master_countries` VALUES ('LY','Libya');
INSERT INTO `lovd_training_master_countries` VALUES ('MA','Morocco');
INSERT INTO `lovd_training_master_countries` VALUES ('MC','Monaco');
INSERT INTO `lovd_training_master_countries` VALUES ('MD','Moldova (Republic of)');
INSERT INTO `lovd_training_master_countries` VALUES ('ME','Montenegro');
INSERT INTO `lovd_training_master_countries` VALUES ('MF','Saint Martin');
INSERT INTO `lovd_training_master_countries` VALUES ('MG','Madagascar');
INSERT INTO `lovd_training_master_countries` VALUES ('MH','Marshall Islands');
INSERT INTO `lovd_training_master_countries` VALUES ('MK','Macedonia (the former Yugoslav Republic of)');
INSERT INTO `lovd_training_master_countries` VALUES ('ML','Mali');
INSERT INTO `lovd_training_master_countries` VALUES ('MM','Myanmar');
INSERT INTO `lovd_training_master_countries` VALUES ('MN','Mongolia');
INSERT INTO `lovd_training_master_countries` VALUES ('MO','Macao');
INSERT INTO `lovd_training_master_countries` VALUES ('MP','Northern Mariana Islands');
INSERT INTO `lovd_training_master_countries` VALUES ('MQ','Martinique');
INSERT INTO `lovd_training_master_countries` VALUES ('MR','Mauritania');
INSERT INTO `lovd_training_master_countries` VALUES ('MS','Montserrat');
INSERT INTO `lovd_training_master_countries` VALUES ('MT','Malta');
INSERT INTO `lovd_training_master_countries` VALUES ('MU','Mauritius');
INSERT INTO `lovd_training_master_countries` VALUES ('MV','Maldives');
INSERT INTO `lovd_training_master_countries` VALUES ('MW','Malawi');
INSERT INTO `lovd_training_master_countries` VALUES ('MX','Mexico');
INSERT INTO `lovd_training_master_countries` VALUES ('MY','Malaysia');
INSERT INTO `lovd_training_master_countries` VALUES ('MZ','Mozambique');
INSERT INTO `lovd_training_master_countries` VALUES ('NA','Namibia');
INSERT INTO `lovd_training_master_countries` VALUES ('NC','New Caledonia');
INSERT INTO `lovd_training_master_countries` VALUES ('NE','Niger');
INSERT INTO `lovd_training_master_countries` VALUES ('NF','Norfolk Island');
INSERT INTO `lovd_training_master_countries` VALUES ('NG','Nigeria');
INSERT INTO `lovd_training_master_countries` VALUES ('NI','Nicaragua');
INSERT INTO `lovd_training_master_countries` VALUES ('NL','Netherlands');
INSERT INTO `lovd_training_master_countries` VALUES ('NO','Norway');
INSERT INTO `lovd_training_master_countries` VALUES ('NP','Nepal');
INSERT INTO `lovd_training_master_countries` VALUES ('NR','Nauru');
INSERT INTO `lovd_training_master_countries` VALUES ('NU','Niue');
INSERT INTO `lovd_training_master_countries` VALUES ('NZ','New Zealand');
INSERT INTO `lovd_training_master_countries` VALUES ('OM','Oman');
INSERT INTO `lovd_training_master_countries` VALUES ('PA','Panama');
INSERT INTO `lovd_training_master_countries` VALUES ('PE','Peru');
INSERT INTO `lovd_training_master_countries` VALUES ('PF','French Polynesia');
INSERT INTO `lovd_training_master_countries` VALUES ('PG','Papua New Guinea');
INSERT INTO `lovd_training_master_countries` VALUES ('PH','Philippines');
INSERT INTO `lovd_training_master_countries` VALUES ('PK','Pakistan');
INSERT INTO `lovd_training_master_countries` VALUES ('PL','Poland');
INSERT INTO `lovd_training_master_countries` VALUES ('PM','Saint Pierre and Miquelon');
INSERT INTO `lovd_training_master_countries` VALUES ('PN','Pitcairn');
INSERT INTO `lovd_training_master_countries` VALUES ('PR','Puerto Rico');
INSERT INTO `lovd_training_master_countries` VALUES ('PS','Palestinian Territory');
INSERT INTO `lovd_training_master_countries` VALUES ('PT','Portugal');
INSERT INTO `lovd_training_master_countries` VALUES ('PW','Palau');
INSERT INTO `lovd_training_master_countries` VALUES ('PY','Paraguay');
INSERT INTO `lovd_training_master_countries` VALUES ('QA','Qatar');
INSERT INTO `lovd_training_master_countries` VALUES ('RE','Réunion');
INSERT INTO `lovd_training_master_countries` VALUES ('RO','Romania');
INSERT INTO `lovd_training_master_countries` VALUES ('RS','Serbia');
INSERT INTO `lovd_training_master_countries` VALUES ('RU','Russian Federation');
INSERT INTO `lovd_training_master_countries` VALUES ('RW','Rwanda');
INSERT INTO `lovd_training_master_countries` VALUES ('SA','Saudi Arabia');
INSERT INTO `lovd_training_master_countries` VALUES ('SB','Solomon Islands');
INSERT INTO `lovd_training_master_countries` VALUES ('SC','Seychelles');
INSERT INTO `lovd_training_master_countries` VALUES ('SD','Sudan');
INSERT INTO `lovd_training_master_countries` VALUES ('SE','Sweden');
INSERT INTO `lovd_training_master_countries` VALUES ('SG','Singapore');
INSERT INTO `lovd_training_master_countries` VALUES ('SH','Saint Helena, Ascension and Tristan da Cunha');
INSERT INTO `lovd_training_master_countries` VALUES ('SI','Slovenia');
INSERT INTO `lovd_training_master_countries` VALUES ('SJ','Svalbard and Jan Mayen');
INSERT INTO `lovd_training_master_countries` VALUES ('SK','Slovakia');
INSERT INTO `lovd_training_master_countries` VALUES ('SL','Sierra Leone');
INSERT INTO `lovd_training_master_countries` VALUES ('SM','San Marino');
INSERT INTO `lovd_training_master_countries` VALUES ('SN','Senegal');
INSERT INTO `lovd_training_master_countries` VALUES ('SO','Somalia');
INSERT INTO `lovd_training_master_countries` VALUES ('SR','Suriname');
INSERT INTO `lovd_training_master_countries` VALUES ('SS','South Sudan');
INSERT INTO `lovd_training_master_countries` VALUES ('ST','Sao Tome and Principe');
INSERT INTO `lovd_training_master_countries` VALUES ('SV','El Salvador');
INSERT INTO `lovd_training_master_countries` VALUES ('SY','Syrian Arab Republic');
INSERT INTO `lovd_training_master_countries` VALUES ('SZ','Swaziland');
INSERT INTO `lovd_training_master_countries` VALUES ('TC','Turks and Caicos Islands');
INSERT INTO `lovd_training_master_countries` VALUES ('TD','Chad');
INSERT INTO `lovd_training_master_countries` VALUES ('TF','French Southern Territories');
INSERT INTO `lovd_training_master_countries` VALUES ('TG','Togo');
INSERT INTO `lovd_training_master_countries` VALUES ('TH','Thailand');
INSERT INTO `lovd_training_master_countries` VALUES ('TJ','Tajikistan');
INSERT INTO `lovd_training_master_countries` VALUES ('TK','Tokelau');
INSERT INTO `lovd_training_master_countries` VALUES ('TL','Timor-Leste');
INSERT INTO `lovd_training_master_countries` VALUES ('TM','Turkmenistan');
INSERT INTO `lovd_training_master_countries` VALUES ('TN','Tunisia');
INSERT INTO `lovd_training_master_countries` VALUES ('TO','Tonga');
INSERT INTO `lovd_training_master_countries` VALUES ('TR','Turkey');
INSERT INTO `lovd_training_master_countries` VALUES ('TT','Trinidad and Tobago');
INSERT INTO `lovd_training_master_countries` VALUES ('TV','Tuvalu');
INSERT INTO `lovd_training_master_countries` VALUES ('TW','Taiwan');
INSERT INTO `lovd_training_master_countries` VALUES ('TZ','Tanzania (United Republic of)');
INSERT INTO `lovd_training_master_countries` VALUES ('UA','Ukraine');
INSERT INTO `lovd_training_master_countries` VALUES ('UG','Uganda');
INSERT INTO `lovd_training_master_countries` VALUES ('UM','United States Minor Outlying Islands');
INSERT INTO `lovd_training_master_countries` VALUES ('US','United States');
INSERT INTO `lovd_training_master_countries` VALUES ('UY','Uruguay');
INSERT INTO `lovd_training_master_countries` VALUES ('UZ','Uzbekistan');
INSERT INTO `lovd_training_master_countries` VALUES ('VA','Holy See (Vatican City State)');
INSERT INTO `lovd_training_master_countries` VALUES ('VC','Saint Vincent and The Grenadines');
INSERT INTO `lovd_training_master_countries` VALUES ('VE','Venezuela (Bolivarian Republic of)');
INSERT INTO `lovd_training_master_countries` VALUES ('VG','Virgin Islands (British)');
INSERT INTO `lovd_training_master_countries` VALUES ('VI','Virgin Islands (U.S.)');
INSERT INTO `lovd_training_master_countries` VALUES ('VN','Viet Nam');
INSERT INTO `lovd_training_master_countries` VALUES ('VU','Vanuatu');
INSERT INTO `lovd_training_master_countries` VALUES ('WF','Wallis and Futuna');
INSERT INTO `lovd_training_master_countries` VALUES ('WS','Samoa');
INSERT INTO `lovd_training_master_countries` VALUES ('YE','Yemen');
INSERT INTO `lovd_training_master_countries` VALUES ('YT','Mayotte');
INSERT INTO `lovd_training_master_countries` VALUES ('ZA','South Africa');
INSERT INTO `lovd_training_master_countries` VALUES ('ZM','Zambia');
INSERT INTO `lovd_training_master_countries` VALUES ('ZW','Zimbabwe');
/*!40000 ALTER TABLE `lovd_training_master_countries` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `lovd_training_master_data_status`
--

DROP TABLE IF EXISTS `lovd_training_master_data_status`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `lovd_training_master_data_status` (
  `id` tinyint(1) unsigned NOT NULL,
  `name` varchar(15) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `lovd_training_master_data_status`
--
-- ORDER BY:  `id`

LOCK TABLES `lovd_training_master_data_status` WRITE;
/*!40000 ALTER TABLE `lovd_training_master_data_status` DISABLE KEYS */;
INSERT INTO `lovd_training_master_data_status` VALUES (1,'In progress');
INSERT INTO `lovd_training_master_data_status` VALUES (2,'Pending');
INSERT INTO `lovd_training_master_data_status` VALUES (4,'Non public');
INSERT INTO `lovd_training_master_data_status` VALUES (7,'Marked');
INSERT INTO `lovd_training_master_data_status` VALUES (9,'Public');
/*!40000 ALTER TABLE `lovd_training_master_data_status` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `lovd_training_master_diseases`
--

DROP TABLE IF EXISTS `lovd_training_master_diseases`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `lovd_training_master_diseases` (
  `id` smallint(5) unsigned zerofill NOT NULL AUTO_INCREMENT,
  `symbol` varchar(15) NOT NULL,
  `name` varchar(255) NOT NULL,
  `id_omim` int(10) unsigned DEFAULT NULL,
  `created_by` smallint(5) unsigned zerofill DEFAULT NULL,
  `created_date` datetime NOT NULL,
  `edited_by` smallint(5) unsigned zerofill DEFAULT NULL,
  `edited_date` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_omim` (`id_omim`),
  KEY `created_by` (`created_by`),
  KEY `edited_by` (`edited_by`),
  CONSTRAINT `lovd_training_master_diseases_fk_created_by` FOREIGN KEY (`created_by`) REFERENCES `lovd_training_master_users` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `lovd_training_master_diseases_fk_edited_by` FOREIGN KEY (`edited_by`) REFERENCES `lovd_training_master_users` (`id`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `lovd_training_master_diseases`
--
-- ORDER BY:  `id`

LOCK TABLES `lovd_training_master_diseases` WRITE;
/*!40000 ALTER TABLE `lovd_training_master_diseases` DISABLE KEYS */;
INSERT INTO `lovd_training_master_diseases` VALUES (00000,'Healty/Control','Healthy individual / control',NULL,00000,'2015-02-26 09:58:10',NULL,NULL);
/*!40000 ALTER TABLE `lovd_training_master_diseases` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `lovd_training_master_external_sources`
--

DROP TABLE IF EXISTS `lovd_training_master_external_sources`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `lovd_training_master_external_sources` (
  `id` varchar(15) NOT NULL,
  `url` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `lovd_training_master_external_sources`
--
-- ORDER BY:  `id`

LOCK TABLES `lovd_training_master_external_sources` WRITE;
/*!40000 ALTER TABLE `lovd_training_master_external_sources` DISABLE KEYS */;
INSERT INTO `lovd_training_master_external_sources` VALUES ('entrez','http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?db=gene&cmd=Retrieve&dopt=full_report&list_uids={{ ID }}');
INSERT INTO `lovd_training_master_external_sources` VALUES ('genbank','http://www.ncbi.nlm.nih.gov/nuccore/{{ ID }}');
INSERT INTO `lovd_training_master_external_sources` VALUES ('genecards','http://www.genecards.org/cgi-bin/carddisp.pl?gene={{ ID }}');
INSERT INTO `lovd_training_master_external_sources` VALUES ('genetests','http://www.ncbi.nlm.nih.gov/sites/GeneTests/lab/gene/{{ ID }}');
INSERT INTO `lovd_training_master_external_sources` VALUES ('hgmd','http://www.hgmd.cf.ac.uk/ac/gene.php?gene={{ ID }}');
INSERT INTO `lovd_training_master_external_sources` VALUES ('hgnc','http://www.genenames.org/data/hgnc_data.php?hgnc_id={{ ID }}');
INSERT INTO `lovd_training_master_external_sources` VALUES ('omim','http://www.omim.org/entry/{{ ID }}');
INSERT INTO `lovd_training_master_external_sources` VALUES ('pubmed_gene','http://www.ncbi.nlm.nih.gov/pubmed?LinkName=gene_pubmed&from_uid={{ ID }}');
INSERT INTO `lovd_training_master_external_sources` VALUES ('uniprot','http://www.uniprot.org/uniprot/{{ ID }}');
/*!40000 ALTER TABLE `lovd_training_master_external_sources` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `lovd_training_master_genes`
--

DROP TABLE IF EXISTS `lovd_training_master_genes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `lovd_training_master_genes` (
  `id` varchar(25) NOT NULL,
  `name` varchar(255) NOT NULL,
  `chromosome` varchar(2) DEFAULT NULL,
  `chrom_band` varchar(20) NOT NULL,
  `imprinting` varchar(10) NOT NULL DEFAULT 'unknown',
  `refseq_genomic` varchar(15) NOT NULL,
  `refseq_UD` varchar(25) NOT NULL,
  `reference` varchar(255) NOT NULL,
  `url_homepage` varchar(255) NOT NULL,
  `url_external` text NOT NULL,
  `allow_download` tinyint(1) NOT NULL,
  `allow_index_wiki` tinyint(1) NOT NULL,
  `id_hgnc` int(10) unsigned NOT NULL,
  `id_entrez` int(10) unsigned DEFAULT NULL,
  `id_omim` int(10) unsigned DEFAULT NULL,
  `show_hgmd` tinyint(1) NOT NULL,
  `show_genecards` tinyint(1) NOT NULL,
  `show_genetests` tinyint(1) NOT NULL,
  `note_index` text NOT NULL,
  `note_listing` text NOT NULL,
  `refseq` varchar(1) NOT NULL,
  `refseq_url` varchar(255) NOT NULL,
  `disclaimer` tinyint(1) unsigned NOT NULL,
  `disclaimer_text` text NOT NULL,
  `header` text NOT NULL,
  `header_align` tinyint(1) NOT NULL,
  `footer` text NOT NULL,
  `footer_align` tinyint(1) NOT NULL,
  `created_by` smallint(5) unsigned zerofill DEFAULT NULL,
  `created_date` datetime NOT NULL,
  `edited_by` smallint(5) unsigned zerofill DEFAULT NULL,
  `edited_date` datetime DEFAULT NULL,
  `updated_by` smallint(5) unsigned zerofill DEFAULT NULL,
  `updated_date` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_hgnc` (`id_hgnc`),
  KEY `chromosome` (`chromosome`),
  KEY `created_by` (`created_by`),
  KEY `edited_by` (`edited_by`),
  KEY `updated_by` (`updated_by`),
  CONSTRAINT `lovd_training_master_genes_fk_chromosome` FOREIGN KEY (`chromosome`) REFERENCES `lovd_training_master_chromosomes` (`name`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `lovd_training_master_genes_fk_created_by` FOREIGN KEY (`created_by`) REFERENCES `lovd_training_master_users` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `lovd_training_master_genes_fk_edited_by` FOREIGN KEY (`edited_by`) REFERENCES `lovd_training_master_users` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `lovd_training_master_genes_fk_updated_by` FOREIGN KEY (`updated_by`) REFERENCES `lovd_training_master_users` (`id`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `lovd_training_master_genes`
--
-- ORDER BY:  `id`

LOCK TABLES `lovd_training_master_genes` WRITE;
/*!40000 ALTER TABLE `lovd_training_master_genes` DISABLE KEYS */;
INSERT INTO `lovd_training_master_genes` VALUES ('TTC8','tetratricopeptide repeat domain 8','14','q31.3','unknown','NC_000014.8','UD_128755891787','','','',0,0,20087,123016,608132,1,1,1,'','','','',1,'','',-1,'',-1,00001,'2015-02-26 09:58:16',NULL,NULL,NULL,NULL);
/*!40000 ALTER TABLE `lovd_training_master_genes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `lovd_training_master_genes2diseases`
--

DROP TABLE IF EXISTS `lovd_training_master_genes2diseases`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `lovd_training_master_genes2diseases` (
  `geneid` varchar(25) NOT NULL,
  `diseaseid` smallint(5) unsigned zerofill NOT NULL,
  PRIMARY KEY (`geneid`,`diseaseid`),
  KEY `diseaseid` (`diseaseid`),
  CONSTRAINT `lovd_training_master_genes2diseases_fk_diseaseid` FOREIGN KEY (`diseaseid`) REFERENCES `lovd_training_master_diseases` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `lovd_training_master_genes2diseases_fk_geneid` FOREIGN KEY (`geneid`) REFERENCES `lovd_training_master_genes` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `lovd_training_master_genes2diseases`
--
-- ORDER BY:  `geneid`,`diseaseid`

LOCK TABLES `lovd_training_master_genes2diseases` WRITE;
/*!40000 ALTER TABLE `lovd_training_master_genes2diseases` DISABLE KEYS */;
/*!40000 ALTER TABLE `lovd_training_master_genes2diseases` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `lovd_training_master_individuals`
--

DROP TABLE IF EXISTS `lovd_training_master_individuals`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `lovd_training_master_individuals` (
  `id` mediumint(8) unsigned zerofill NOT NULL AUTO_INCREMENT,
  `fatherid` mediumint(8) unsigned zerofill DEFAULT NULL,
  `motherid` mediumint(8) unsigned zerofill DEFAULT NULL,
  `panelid` mediumint(8) unsigned zerofill DEFAULT NULL,
  `panel_size` mediumint(8) unsigned NOT NULL DEFAULT '1',
  `owned_by` smallint(5) unsigned zerofill DEFAULT NULL,
  `statusid` tinyint(1) unsigned DEFAULT NULL,
  `created_by` smallint(5) unsigned zerofill DEFAULT NULL,
  `created_date` datetime NOT NULL,
  `edited_by` smallint(5) unsigned zerofill DEFAULT NULL,
  `edited_date` datetime DEFAULT NULL,
  `Individual/Lab_ID` varchar(15) DEFAULT NULL,
  `Individual/Reference` varchar(200) DEFAULT NULL,
  `Individual/Remarks` text,
  `Individual/Remarks_Non_Public` text,
  PRIMARY KEY (`id`),
  KEY `fatherid` (`fatherid`),
  KEY `motherid` (`motherid`),
  KEY `owned_by` (`owned_by`),
  KEY `statusid` (`statusid`),
  KEY `created_by` (`created_by`),
  KEY `edited_by` (`edited_by`),
  KEY `lovd_training_master_individuals_fk_panelid` (`panelid`),
  CONSTRAINT `lovd_training_master_individuals_fk_created_by` FOREIGN KEY (`created_by`) REFERENCES `lovd_training_master_users` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `lovd_training_master_individuals_fk_edited_by` FOREIGN KEY (`edited_by`) REFERENCES `lovd_training_master_users` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `lovd_training_master_individuals_fk_fatherid` FOREIGN KEY (`fatherid`) REFERENCES `lovd_training_master_individuals` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `lovd_training_master_individuals_fk_motherid` FOREIGN KEY (`motherid`) REFERENCES `lovd_training_master_individuals` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `lovd_training_master_individuals_fk_owned_by` FOREIGN KEY (`owned_by`) REFERENCES `lovd_training_master_users` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `lovd_training_master_individuals_fk_panelid` FOREIGN KEY (`panelid`) REFERENCES `lovd_training_master_individuals` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `lovd_training_master_individuals_fk_statusid` FOREIGN KEY (`statusid`) REFERENCES `lovd_training_master_data_status` (`id`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `lovd_training_master_individuals`
--
-- ORDER BY:  `id`

LOCK TABLES `lovd_training_master_individuals` WRITE;
/*!40000 ALTER TABLE `lovd_training_master_individuals` DISABLE KEYS */;
/*!40000 ALTER TABLE `lovd_training_master_individuals` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `lovd_training_master_individuals2diseases`
--

DROP TABLE IF EXISTS `lovd_training_master_individuals2diseases`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `lovd_training_master_individuals2diseases` (
  `individualid` mediumint(8) unsigned zerofill NOT NULL,
  `diseaseid` smallint(5) unsigned zerofill NOT NULL,
  PRIMARY KEY (`individualid`,`diseaseid`),
  KEY `diseaseid` (`diseaseid`),
  CONSTRAINT `lovd_training_master_individuals2diseases_fk_diseaseid` FOREIGN KEY (`diseaseid`) REFERENCES `lovd_training_master_diseases` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `lovd_training_master_individuals2diseases_fk_individualid` FOREIGN KEY (`individualid`) REFERENCES `lovd_training_master_individuals` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `lovd_training_master_individuals2diseases`
--
-- ORDER BY:  `individualid`,`diseaseid`

LOCK TABLES `lovd_training_master_individuals2diseases` WRITE;
/*!40000 ALTER TABLE `lovd_training_master_individuals2diseases` DISABLE KEYS */;
/*!40000 ALTER TABLE `lovd_training_master_individuals2diseases` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `lovd_training_master_links`
--

DROP TABLE IF EXISTS `lovd_training_master_links`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `lovd_training_master_links` (
  `id` tinyint(3) unsigned zerofill NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  `pattern_text` varchar(25) NOT NULL,
  `replace_text` text NOT NULL,
  `description` text NOT NULL,
  `created_by` smallint(5) unsigned zerofill DEFAULT NULL,
  `created_date` datetime NOT NULL,
  `edited_by` smallint(5) unsigned zerofill DEFAULT NULL,
  `edited_date` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`),
  UNIQUE KEY `pattern_text` (`pattern_text`),
  KEY `created_by` (`created_by`),
  KEY `edited_by` (`edited_by`),
  CONSTRAINT `lovd_training_master_links_fk_created_by` FOREIGN KEY (`created_by`) REFERENCES `lovd_training_master_users` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `lovd_training_master_links_fk_edited_by` FOREIGN KEY (`edited_by`) REFERENCES `lovd_training_master_users` (`id`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `lovd_training_master_links`
--
-- ORDER BY:  `id`

LOCK TABLES `lovd_training_master_links` WRITE;
/*!40000 ALTER TABLE `lovd_training_master_links` DISABLE KEYS */;
INSERT INTO `lovd_training_master_links` VALUES (001,'PubMed','{PMID:[1]:[2]}','<A href=\"http://www.ncbi.nlm.nih.gov/pubmed/[2]\" target=\"_blank\">[1]</A>','Links to abstracts in the PubMed database.\r\n[1] = The name of the author(s), possibly followed by the year of publication.\r\n[2] = The PubMed ID.\r\n\r\nExample:\r\n{PMID:Fokkema et al. (2011):21520333}',00000,'2015-02-26 09:58:11',NULL,NULL);
INSERT INTO `lovd_training_master_links` VALUES (002,'DbSNP','{dbSNP:[1]}','<A href=\"http://www.ncbi.nlm.nih.gov/SNP/snp_ref.cgi?rs=[1]\" target=\"_blank\">dbSNP</A>','Links to the DbSNP database.\r\n[1] = The DbSNP ID.\r\n\r\nExamples:\r\n{dbSNP:rs193143796}\r\n{dbSNP:193143796}',00000,'2015-02-26 09:58:11',NULL,NULL);
INSERT INTO `lovd_training_master_links` VALUES (003,'GenBank','{GenBank:[1]}','<A href=\"http://www.ncbi.nlm.nih.gov/entrez/viewer.fcgi?cmd=Retrieve&amp;db=nucleotide&amp;dopt=GenBank&amp;list_uids=[1]\" target=\"_blank\">GenBank</A>','Links to GenBank sequences.\r\n[1] = The GenBank ID.\r\n\r\nExamples:\r\n{GenBank:NG_012232.1}\r\n{GenBank:NC_000001.10}',00000,'2015-02-26 09:58:11',NULL,NULL);
INSERT INTO `lovd_training_master_links` VALUES (004,'OMIM','{OMIM:[1]:[2]}','<A href=\"http://www.omim.org/entry/[1]#[2]\" target=\"_blank\">(OMIM [2])</A>','Links to an allelic variant on the gene\'s OMIM page.\r\n[1] = The OMIM gene ID.\r\n[2] = The number of the OMIM allelic variant on that page.\r\n\r\nExamples:\r\n{OMIM:300377:0021}\r\n{OMIM:188840:0003}',00000,'2015-02-26 09:58:11',NULL,NULL);
/*!40000 ALTER TABLE `lovd_training_master_links` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `lovd_training_master_logs`
--

DROP TABLE IF EXISTS `lovd_training_master_logs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `lovd_training_master_logs` (
  `name` varchar(10) NOT NULL,
  `date` datetime NOT NULL,
  `mtime` mediumint(6) unsigned zerofill NOT NULL,
  `userid` smallint(5) unsigned zerofill DEFAULT NULL,
  `event` varchar(20) NOT NULL,
  `log` text NOT NULL,
  PRIMARY KEY (`name`,`date`,`mtime`),
  KEY `userid` (`userid`),
  CONSTRAINT `lovd_training_master_logs_fk_userid` FOREIGN KEY (`userid`) REFERENCES `lovd_training_master_users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `lovd_training_master_logs`
--
-- ORDER BY:  `name`,`date`,`mtime`

LOCK TABLES `lovd_training_master_logs` WRITE;
/*!40000 ALTER TABLE `lovd_training_master_logs` DISABLE KEYS */;
INSERT INTO `lovd_training_master_logs` VALUES ('Install','2015-02-26 09:58:13',285793,00001,'Installation','Installation of LOVD 3.0-13 complete');
/*!40000 ALTER TABLE `lovd_training_master_logs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `lovd_training_master_modules`
--

DROP TABLE IF EXISTS `lovd_training_master_modules`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `lovd_training_master_modules` (
  `id` varchar(15) NOT NULL,
  `name` varchar(50) NOT NULL,
  `version` varchar(15) NOT NULL,
  `description` varchar(255) NOT NULL,
  `active` tinyint(1) NOT NULL,
  `settings` text NOT NULL,
  `installed_date` date NOT NULL,
  `updated_date` date DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `lovd_training_master_modules`
--
-- ORDER BY:  `id`

LOCK TABLES `lovd_training_master_modules` WRITE;
/*!40000 ALTER TABLE `lovd_training_master_modules` DISABLE KEYS */;
/*!40000 ALTER TABLE `lovd_training_master_modules` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `lovd_training_master_phenotypes`
--

DROP TABLE IF EXISTS `lovd_training_master_phenotypes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `lovd_training_master_phenotypes` (
  `id` int(10) unsigned zerofill NOT NULL AUTO_INCREMENT,
  `diseaseid` smallint(5) unsigned zerofill NOT NULL,
  `individualid` mediumint(8) unsigned zerofill NOT NULL,
  `owned_by` smallint(5) unsigned zerofill DEFAULT NULL,
  `statusid` tinyint(1) unsigned DEFAULT NULL,
  `created_by` smallint(5) unsigned zerofill DEFAULT NULL,
  `created_date` datetime NOT NULL,
  `edited_by` smallint(5) unsigned zerofill DEFAULT NULL,
  `edited_date` datetime DEFAULT NULL,
  `Phenotype/Additional` text,
  `Phenotype/Inheritance` varchar(50) DEFAULT NULL,
  `Phenotype/Age` varchar(12) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `diseaseid` (`diseaseid`),
  KEY `individualid` (`individualid`),
  KEY `owned_by` (`owned_by`),
  KEY `statusid` (`statusid`),
  KEY `created_by` (`created_by`),
  KEY `edited_by` (`edited_by`),
  CONSTRAINT `lovd_training_master_phenotypes_fk_created_by` FOREIGN KEY (`created_by`) REFERENCES `lovd_training_master_users` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `lovd_training_master_phenotypes_fk_diseaseid` FOREIGN KEY (`diseaseid`) REFERENCES `lovd_training_master_diseases` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `lovd_training_master_phenotypes_fk_edited_by` FOREIGN KEY (`edited_by`) REFERENCES `lovd_training_master_users` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `lovd_training_master_phenotypes_fk_individualid` FOREIGN KEY (`individualid`) REFERENCES `lovd_training_master_individuals` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `lovd_training_master_phenotypes_fk_owned_by` FOREIGN KEY (`owned_by`) REFERENCES `lovd_training_master_users` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `lovd_training_master_phenotypes_fk_statusid` FOREIGN KEY (`statusid`) REFERENCES `lovd_training_master_data_status` (`id`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `lovd_training_master_phenotypes`
--
-- ORDER BY:  `id`

LOCK TABLES `lovd_training_master_phenotypes` WRITE;
/*!40000 ALTER TABLE `lovd_training_master_phenotypes` DISABLE KEYS */;
/*!40000 ALTER TABLE `lovd_training_master_phenotypes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `lovd_training_master_screenings`
--

DROP TABLE IF EXISTS `lovd_training_master_screenings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `lovd_training_master_screenings` (
  `id` int(10) unsigned zerofill NOT NULL AUTO_INCREMENT,
  `individualid` mediumint(8) unsigned zerofill NOT NULL,
  `variants_found` tinyint(1) NOT NULL DEFAULT '1',
  `owned_by` smallint(5) unsigned zerofill DEFAULT NULL,
  `created_by` smallint(5) unsigned zerofill DEFAULT NULL,
  `created_date` datetime NOT NULL,
  `edited_by` smallint(5) unsigned zerofill DEFAULT NULL,
  `edited_date` datetime DEFAULT NULL,
  `Screening/Technique` text,
  `Screening/Template` text,
  PRIMARY KEY (`id`),
  KEY `individualid` (`individualid`),
  KEY `owned_by` (`owned_by`),
  KEY `created_by` (`created_by`),
  KEY `edited_by` (`edited_by`),
  CONSTRAINT `lovd_training_master_screenings_fk_created_by` FOREIGN KEY (`created_by`) REFERENCES `lovd_training_master_users` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `lovd_training_master_screenings_fk_edited_by` FOREIGN KEY (`edited_by`) REFERENCES `lovd_training_master_users` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `lovd_training_master_screenings_fk_individualid` FOREIGN KEY (`individualid`) REFERENCES `lovd_training_master_individuals` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `lovd_training_master_screenings_fk_owned_by` FOREIGN KEY (`owned_by`) REFERENCES `lovd_training_master_users` (`id`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `lovd_training_master_screenings`
--
-- ORDER BY:  `id`

LOCK TABLES `lovd_training_master_screenings` WRITE;
/*!40000 ALTER TABLE `lovd_training_master_screenings` DISABLE KEYS */;
/*!40000 ALTER TABLE `lovd_training_master_screenings` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `lovd_training_master_screenings2genes`
--

DROP TABLE IF EXISTS `lovd_training_master_screenings2genes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `lovd_training_master_screenings2genes` (
  `screeningid` int(10) unsigned zerofill NOT NULL,
  `geneid` varchar(25) NOT NULL,
  PRIMARY KEY (`screeningid`,`geneid`),
  KEY `screeningid` (`screeningid`),
  KEY `geneid` (`geneid`),
  CONSTRAINT `lovd_training_master_screenings2genes_fk_geneid` FOREIGN KEY (`geneid`) REFERENCES `lovd_training_master_genes` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `lovd_training_master_screenings2genes_fk_screeningid` FOREIGN KEY (`screeningid`) REFERENCES `lovd_training_master_screenings` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `lovd_training_master_screenings2genes`
--
-- ORDER BY:  `screeningid`,`geneid`

LOCK TABLES `lovd_training_master_screenings2genes` WRITE;
/*!40000 ALTER TABLE `lovd_training_master_screenings2genes` DISABLE KEYS */;
/*!40000 ALTER TABLE `lovd_training_master_screenings2genes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `lovd_training_master_screenings2variants`
--

DROP TABLE IF EXISTS `lovd_training_master_screenings2variants`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `lovd_training_master_screenings2variants` (
  `screeningid` int(10) unsigned zerofill NOT NULL,
  `variantid` int(10) unsigned zerofill NOT NULL,
  PRIMARY KEY (`screeningid`,`variantid`),
  KEY `screeningid` (`screeningid`),
  KEY `variantid` (`variantid`),
  CONSTRAINT `lovd_training_master_screenings2variants_fk_screeningid` FOREIGN KEY (`screeningid`) REFERENCES `lovd_training_master_screenings` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `lovd_training_master_screenings2variants_fk_variantid` FOREIGN KEY (`variantid`) REFERENCES `lovd_training_master_variants` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `lovd_training_master_screenings2variants`
--
-- ORDER BY:  `screeningid`,`variantid`

LOCK TABLES `lovd_training_master_screenings2variants` WRITE;
/*!40000 ALTER TABLE `lovd_training_master_screenings2variants` DISABLE KEYS */;
/*!40000 ALTER TABLE `lovd_training_master_screenings2variants` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `lovd_training_master_shared_columns`
--

DROP TABLE IF EXISTS `lovd_training_master_shared_columns`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `lovd_training_master_shared_columns` (
  `geneid` varchar(25) DEFAULT NULL,
  `diseaseid` smallint(5) unsigned zerofill DEFAULT NULL,
  `colid` varchar(100) NOT NULL,
  `col_order` tinyint(3) unsigned NOT NULL,
  `width` smallint(5) unsigned NOT NULL,
  `mandatory` tinyint(1) NOT NULL,
  `description_form` text NOT NULL,
  `description_legend_short` text NOT NULL,
  `description_legend_full` text NOT NULL,
  `select_options` text NOT NULL,
  `public_view` tinyint(1) NOT NULL,
  `public_add` tinyint(1) NOT NULL,
  `created_by` smallint(5) unsigned zerofill DEFAULT NULL,
  `created_date` datetime NOT NULL,
  `edited_by` smallint(5) unsigned zerofill DEFAULT NULL,
  `edited_date` datetime DEFAULT NULL,
  UNIQUE KEY `geneid` (`geneid`,`colid`),
  UNIQUE KEY `diseaseid` (`diseaseid`,`colid`),
  KEY `colid` (`colid`),
  KEY `created_by` (`created_by`),
  KEY `edited_by` (`edited_by`),
  CONSTRAINT `lovd_training_master_shared_columns_fk_colid` FOREIGN KEY (`colid`) REFERENCES `lovd_training_master_active_columns` (`colid`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `lovd_training_master_shared_columns_fk_created_by` FOREIGN KEY (`created_by`) REFERENCES `lovd_training_master_users` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `lovd_training_master_shared_columns_fk_diseaseid` FOREIGN KEY (`diseaseid`) REFERENCES `lovd_training_master_diseases` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `lovd_training_master_shared_columns_fk_edited_by` FOREIGN KEY (`edited_by`) REFERENCES `lovd_training_master_users` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `lovd_training_master_shared_columns_fk_geneid` FOREIGN KEY (`geneid`) REFERENCES `lovd_training_master_genes` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `lovd_training_master_shared_columns`
--
-- ORDER BY:  `geneid`,`colid`

LOCK TABLES `lovd_training_master_shared_columns` WRITE;
/*!40000 ALTER TABLE `lovd_training_master_shared_columns` DISABLE KEYS */;
INSERT INTO `lovd_training_master_shared_columns` VALUES (NULL,00000,'Phenotype/Age',0,100,0,'Type 35y for 35 years, 04y08m for 4 years and 8 months, 18y? for around 18 years, >54y for older than 54, ? for unknown.','The age at which the individual was examined, if known. 04y08m = 4 years and 8 months.','The age at which the individual was examined, if known.\r\n<UL style=\"margin-top:0px;\">\r\n  <LI>35y = 35 years</LI>\r\n  <LI>04y08m = 4 years and 8 months</LI>\r\n  <LI>18y? = around 18 years</LI>\r\n  <LI>&gt;54y = older than 54</LI>\r\n  <LI>? = unknown</LI>\r\n</UL>','',1,1,00000,'2015-02-26 09:58:10',NULL,NULL);
INSERT INTO `lovd_training_master_shared_columns` VALUES ('TTC8',NULL,'VariantOnTranscript/DNA',3,200,1,'','Description of variant at DNA level, based on a coding DNA reference sequence (following HGVS recommendations).','Description of variant at DNA level, based on a coding DNA reference sequence (following HGVS recommendations); e.g. c.123C>T, c.123_145del, c.123_126dup.','',1,1,00001,'2015-02-26 09:58:16',NULL,NULL);
INSERT INTO `lovd_training_master_shared_columns` VALUES ('TTC8',NULL,'VariantOnTranscript/Exon',2,50,1,'','Number of exon/intron containing the variant.','Number of exon/intron containing variant; 2 = exon 2, 12i = intron 12, 2i_7i = exons 3 to 7, 8i_9 = border intron 8/exon 9.','',1,1,00001,'2015-02-26 09:58:16',NULL,NULL);
INSERT INTO `lovd_training_master_shared_columns` VALUES ('TTC8',NULL,'VariantOnTranscript/Protein',7,200,1,'','Description of variant at protein level (following HGVS recommendations).','Description of variant at protein level (following HGVS recommendations).<BR>\r\n<UL style=\"margin-top : 0px;\">\r\n  <LI>p.(Arg345Pro) = change predicted from DNA (RNA not analysed)</LI>\r\n  <LI>p.Arg345Pro = change derived from RNA analysis</LI>\r\n  <LI>p.? = unknown effect</LI>\r\n  <LI>p.0? = probably no protein produced</LI>\r\n</UL>','',1,1,00001,'2015-02-26 09:58:16',NULL,NULL);
INSERT INTO `lovd_training_master_shared_columns` VALUES ('TTC8',NULL,'VariantOnTranscript/RNA',6,200,1,'','Description of variant at RNA level (following HGVS recommendations).','Description of variant at RNA level (following HGVS recommendations).<BR>\r\n<UL style=\"margin-top : 0px;\">\r\n  <LI>r.123c>u</LI>\r\n  <LI>r.? = unknown</LI>\r\n  <LI>r.(?) = RNA not analysed but probably transcribed copy of DNA variant</LI>\r\n  <LI>r.spl? = RNA not analysed but variant probably affects splicing</LI>\r\n  <LI>r.(spl?) = RNA not analysed but variant may affect splicing</LI>\r\n  <LI>r.0? = change expected to abolish transcription</LI>\r\n</UL>','',1,1,00001,'2015-02-26 09:58:16',NULL,NULL);
/*!40000 ALTER TABLE `lovd_training_master_shared_columns` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `lovd_training_master_status`
--

DROP TABLE IF EXISTS `lovd_training_master_status`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `lovd_training_master_status` (
  `lock_update` tinyint(1) NOT NULL,
  `version` varchar(15) NOT NULL,
  `signature` char(32) NOT NULL,
  `update_checked_date` datetime DEFAULT NULL,
  `update_version` varchar(15) DEFAULT NULL,
  `update_level` tinyint(1) unsigned DEFAULT NULL,
  `update_description` text,
  `update_released_date` date DEFAULT NULL,
  `installed_date` date NOT NULL,
  `updated_date` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `lovd_training_master_status`
--

LOCK TABLES `lovd_training_master_status` WRITE;
/*!40000 ALTER TABLE `lovd_training_master_status` DISABLE KEYS */;
INSERT INTO `lovd_training_master_status` VALUES (0,'3.0-13','training_course_LOVD3/master','2015-04-21 13:47:15','3.0-13',0,'',NULL,'2015-02-26',NULL);
/*!40000 ALTER TABLE `lovd_training_master_status` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `lovd_training_master_transcripts`
--

DROP TABLE IF EXISTS `lovd_training_master_transcripts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `lovd_training_master_transcripts` (
  `id` smallint(5) unsigned zerofill NOT NULL AUTO_INCREMENT,
  `geneid` varchar(25) NOT NULL,
  `name` varchar(255) NOT NULL,
  `id_mutalyzer` tinyint(3) unsigned zerofill DEFAULT NULL,
  `id_ncbi` varchar(255) NOT NULL,
  `id_ensembl` varchar(255) NOT NULL,
  `id_protein_ncbi` varchar(255) NOT NULL,
  `id_protein_ensembl` varchar(255) NOT NULL,
  `id_protein_uniprot` varchar(8) NOT NULL,
  `position_c_mrna_start` smallint(5) NOT NULL,
  `position_c_mrna_end` mediumint(8) unsigned NOT NULL,
  `position_c_cds_end` mediumint(8) unsigned NOT NULL,
  `position_g_mrna_start` int(10) unsigned NOT NULL,
  `position_g_mrna_end` int(10) unsigned NOT NULL,
  `created_by` smallint(5) unsigned zerofill DEFAULT NULL,
  `created_date` datetime NOT NULL,
  `edited_by` smallint(5) unsigned zerofill DEFAULT NULL,
  `edited_date` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_ncbi` (`id_ncbi`),
  KEY `geneid` (`geneid`),
  KEY `created_by` (`created_by`),
  KEY `edited_by` (`edited_by`),
  CONSTRAINT `lovd_training_master_transcripts_fk_created_by` FOREIGN KEY (`created_by`) REFERENCES `lovd_training_master_users` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `lovd_training_master_transcripts_fk_edited_by` FOREIGN KEY (`edited_by`) REFERENCES `lovd_training_master_users` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `lovd_training_master_transcripts_fk_geneid` FOREIGN KEY (`geneid`) REFERENCES `lovd_training_master_genes` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `lovd_training_master_transcripts`
--
-- ORDER BY:  `id`

LOCK TABLES `lovd_training_master_transcripts` WRITE;
/*!40000 ALTER TABLE `lovd_training_master_transcripts` DISABLE KEYS */;
INSERT INTO `lovd_training_master_transcripts` VALUES (00001,'TTC8','transcript variant 1',001,'NM_144596.2','','NP_653197.2','','',-74,2129,1548,89290978,89344335,00001,'2015-02-26 09:58:55',NULL,NULL);
INSERT INTO `lovd_training_master_transcripts` VALUES (00002,'TTC8','transcript variant 2',002,'NM_198309.2','','NP_938051.1','','',-74,2099,1518,89290978,89344335,00001,'2015-02-26 09:58:55',NULL,NULL);
/*!40000 ALTER TABLE `lovd_training_master_transcripts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `lovd_training_master_users`
--

DROP TABLE IF EXISTS `lovd_training_master_users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `lovd_training_master_users` (
  `id` smallint(5) unsigned zerofill NOT NULL AUTO_INCREMENT,
  `orcid_id` char(19) DEFAULT NULL,
  `orcid_confirmed` tinyint(1) NOT NULL DEFAULT '0',
  `name` varchar(75) NOT NULL,
  `institute` varchar(255) NOT NULL,
  `department` varchar(255) NOT NULL,
  `telephone` varchar(50) NOT NULL,
  `address` text NOT NULL,
  `city` varchar(255) NOT NULL,
  `countryid` char(2) DEFAULT NULL,
  `email` text NOT NULL,
  `email_confirmed` tinyint(1) NOT NULL DEFAULT '0',
  `reference` varchar(50) NOT NULL,
  `username` varchar(20) NOT NULL,
  `password` char(50) NOT NULL,
  `password_autogen` char(50) DEFAULT NULL,
  `password_force_change` tinyint(1) NOT NULL,
  `phpsessid` char(32) DEFAULT NULL,
  `saved_work` text,
  `level` tinyint(1) unsigned NOT NULL,
  `allowed_ip` varchar(255) NOT NULL,
  `login_attempts` tinyint(1) unsigned NOT NULL,
  `last_login` datetime DEFAULT NULL,
  `created_by` smallint(5) unsigned zerofill DEFAULT NULL,
  `created_date` datetime NOT NULL,
  `edited_by` smallint(5) unsigned zerofill DEFAULT NULL,
  `edited_date` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`),
  UNIQUE KEY `orcid_id` (`orcid_id`),
  KEY `countryid` (`countryid`),
  KEY `created_by` (`created_by`),
  KEY `edited_by` (`edited_by`),
  CONSTRAINT `lovd_training_master_users_fk_countryid` FOREIGN KEY (`countryid`) REFERENCES `lovd_training_master_countries` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `lovd_training_master_users_fk_created_by` FOREIGN KEY (`created_by`) REFERENCES `lovd_training_master_users` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `lovd_training_master_users_fk_edited_by` FOREIGN KEY (`edited_by`) REFERENCES `lovd_training_master_users` (`id`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `lovd_training_master_users`
--
-- ORDER BY:  `id`

LOCK TABLES `lovd_training_master_users` WRITE;
/*!40000 ALTER TABLE `lovd_training_master_users` DISABLE KEYS */;
INSERT INTO `lovd_training_master_users` VALUES (00000,NULL,0,'LOVD','','','','','',NULL,'',0,'','','',NULL,0,NULL,NULL,0,'',9,NULL,00000,'2015-02-26 09:58:06',NULL,NULL);
INSERT INTO `lovd_training_master_users` VALUES (00001,NULL,0,'LOVD3 Admin','Leiden University Medical Center','Human Genetics','+31 (0)71 526 9438','Einthovenweg 20\r\n2333 ZC Leiden','Leiden','NL','admin@LOVD.nl',0,'','admin','539a45ca86b9bc684556be3800a24471:78c3fb3f:43786111','',0,'sg8idhc1e571o0269a1n0rt0t5','',9,'*',0,'2015-04-10 14:00:24',00001,'2015-02-26 09:58:06',NULL,NULL);
INSERT INTO `lovd_training_master_users` VALUES (00002,NULL,0,'Manager','Leiden University Medical Center','Human Genetics','','Einthovenweg 20\r\n2333 ZC Leiden','Leiden','NL','managertest@lovd.nl',0,'','manager','a59a8889cd86525e67fa2b0f60a9c486:1bb08979:76a2dc8f','',0,'rknu0kpebmtvom0nmpqqgk5cf5',NULL,7,'*',0,'2015-04-21 13:47:51',00001,'2015-02-26 09:58:19',00002,'2015-04-15 17:36:44');
INSERT INTO `lovd_training_master_users` VALUES (00003,NULL,0,'Curator','Leiden University Medical Center','Human Genetics','','Einthovenweg 20\r\n2333 ZC Leiden','Leiden','NL','curatortest@lovd.nl',0,'','curator','a954c9b81d78003ba78ec4ee68591697:f5e62bdf:fae8e165',NULL,0,NULL,NULL,1,'*',0,NULL,00001,'2015-02-26 09:58:20',00002,'2015-04-21 13:47:53');
INSERT INTO `lovd_training_master_users` VALUES (00004,NULL,0,'Submitter','Leiden University Medical Center','Human Genetics','','Einthovenweg 20\r\n2333 ZC Leiden','Leiden','NL','submitter@LOVD.nl',0,'','submitter','1df00d5f7a30c75eaab64430239a9744:9515dbd0:20a50d41',NULL,0,NULL,NULL,1,'*',0,NULL,00001,'2015-02-26 09:58:21',NULL,NULL);
/*!40000 ALTER TABLE `lovd_training_master_users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `lovd_training_master_users2genes`
--

DROP TABLE IF EXISTS `lovd_training_master_users2genes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `lovd_training_master_users2genes` (
  `userid` smallint(5) unsigned zerofill NOT NULL,
  `geneid` varchar(25) NOT NULL,
  `allow_edit` tinyint(1) NOT NULL,
  `show_order` tinyint(2) unsigned NOT NULL DEFAULT '1',
  PRIMARY KEY (`userid`,`geneid`),
  KEY `geneid` (`geneid`),
  CONSTRAINT `lovd_training_master_users2genes_fk_geneid` FOREIGN KEY (`geneid`) REFERENCES `lovd_training_master_genes` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `lovd_training_master_users2genes_fk_userid` FOREIGN KEY (`userid`) REFERENCES `lovd_training_master_users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `lovd_training_master_users2genes`
--
-- ORDER BY:  `userid`,`geneid`

LOCK TABLES `lovd_training_master_users2genes` WRITE;
/*!40000 ALTER TABLE `lovd_training_master_users2genes` DISABLE KEYS */;
INSERT INTO `lovd_training_master_users2genes` VALUES (00001,'TTC8',1,1);
INSERT INTO `lovd_training_master_users2genes` VALUES (00003,'TTC8',1,2);
/*!40000 ALTER TABLE `lovd_training_master_users2genes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `lovd_training_master_variant_effect`
--

DROP TABLE IF EXISTS `lovd_training_master_variant_effect`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `lovd_training_master_variant_effect` (
  `id` tinyint(2) unsigned zerofill NOT NULL,
  `name` varchar(5) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `lovd_training_master_variant_effect`
--
-- ORDER BY:  `id`

LOCK TABLES `lovd_training_master_variant_effect` WRITE;
/*!40000 ALTER TABLE `lovd_training_master_variant_effect` DISABLE KEYS */;
INSERT INTO `lovd_training_master_variant_effect` VALUES (00,'./.');
INSERT INTO `lovd_training_master_variant_effect` VALUES (01,'./-');
INSERT INTO `lovd_training_master_variant_effect` VALUES (03,'./-?');
INSERT INTO `lovd_training_master_variant_effect` VALUES (05,'./?');
INSERT INTO `lovd_training_master_variant_effect` VALUES (07,'./+?');
INSERT INTO `lovd_training_master_variant_effect` VALUES (09,'./+');
INSERT INTO `lovd_training_master_variant_effect` VALUES (10,'-/.');
INSERT INTO `lovd_training_master_variant_effect` VALUES (11,'-/-');
INSERT INTO `lovd_training_master_variant_effect` VALUES (13,'-/-?');
INSERT INTO `lovd_training_master_variant_effect` VALUES (15,'-/?');
INSERT INTO `lovd_training_master_variant_effect` VALUES (17,'-/+?');
INSERT INTO `lovd_training_master_variant_effect` VALUES (19,'-/+');
INSERT INTO `lovd_training_master_variant_effect` VALUES (30,'-?/.');
INSERT INTO `lovd_training_master_variant_effect` VALUES (31,'-?/-');
INSERT INTO `lovd_training_master_variant_effect` VALUES (33,'-?/-?');
INSERT INTO `lovd_training_master_variant_effect` VALUES (35,'-?/?');
INSERT INTO `lovd_training_master_variant_effect` VALUES (37,'-?/+?');
INSERT INTO `lovd_training_master_variant_effect` VALUES (39,'-?/+');
INSERT INTO `lovd_training_master_variant_effect` VALUES (50,'?/.');
INSERT INTO `lovd_training_master_variant_effect` VALUES (51,'?/-');
INSERT INTO `lovd_training_master_variant_effect` VALUES (53,'?/-?');
INSERT INTO `lovd_training_master_variant_effect` VALUES (55,'?/?');
INSERT INTO `lovd_training_master_variant_effect` VALUES (57,'?/+?');
INSERT INTO `lovd_training_master_variant_effect` VALUES (59,'?/+');
INSERT INTO `lovd_training_master_variant_effect` VALUES (70,'+?/.');
INSERT INTO `lovd_training_master_variant_effect` VALUES (71,'+?/-');
INSERT INTO `lovd_training_master_variant_effect` VALUES (73,'+?/-?');
INSERT INTO `lovd_training_master_variant_effect` VALUES (75,'+?/?');
INSERT INTO `lovd_training_master_variant_effect` VALUES (77,'+?/+?');
INSERT INTO `lovd_training_master_variant_effect` VALUES (79,'+?/+');
INSERT INTO `lovd_training_master_variant_effect` VALUES (90,'+/.');
INSERT INTO `lovd_training_master_variant_effect` VALUES (91,'+/-');
INSERT INTO `lovd_training_master_variant_effect` VALUES (93,'+/-?');
INSERT INTO `lovd_training_master_variant_effect` VALUES (95,'+/?');
INSERT INTO `lovd_training_master_variant_effect` VALUES (97,'+/+?');
INSERT INTO `lovd_training_master_variant_effect` VALUES (99,'+/+');
/*!40000 ALTER TABLE `lovd_training_master_variant_effect` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `lovd_training_master_variants`
--

DROP TABLE IF EXISTS `lovd_training_master_variants`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `lovd_training_master_variants` (
  `id` int(10) unsigned zerofill NOT NULL AUTO_INCREMENT,
  `allele` tinyint(2) unsigned NOT NULL,
  `effectid` tinyint(2) unsigned zerofill DEFAULT NULL,
  `chromosome` varchar(2) DEFAULT NULL,
  `position_g_start` int(10) unsigned DEFAULT NULL,
  `position_g_end` int(10) unsigned DEFAULT NULL,
  `type` varchar(10) DEFAULT NULL,
  `mapping_flags` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `average_frequency` float unsigned DEFAULT NULL,
  `owned_by` smallint(5) unsigned zerofill DEFAULT NULL,
  `statusid` tinyint(1) unsigned DEFAULT NULL,
  `created_by` smallint(5) unsigned zerofill DEFAULT NULL,
  `created_date` datetime NOT NULL,
  `edited_by` smallint(5) unsigned zerofill DEFAULT NULL,
  `edited_date` datetime DEFAULT NULL,
  `VariantOnGenome/DBID` varchar(50) DEFAULT NULL,
  `VariantOnGenome/DNA` varchar(100) DEFAULT NULL,
  `VariantOnGenome/Frequency` varchar(15) DEFAULT NULL,
  `VariantOnGenome/Reference` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `allele` (`allele`),
  KEY `effectid` (`effectid`),
  KEY `chromosome` (`chromosome`,`position_g_start`,`position_g_end`),
  KEY `average_frequency` (`average_frequency`),
  KEY `owned_by` (`owned_by`),
  KEY `statusid` (`statusid`),
  KEY `created_by` (`created_by`),
  KEY `edited_by` (`edited_by`),
  CONSTRAINT `lovd_training_master_variants_fk_allele` FOREIGN KEY (`allele`) REFERENCES `lovd_training_master_alleles` (`id`) ON UPDATE CASCADE,
  CONSTRAINT `lovd_training_master_variants_fk_chromosome` FOREIGN KEY (`chromosome`) REFERENCES `lovd_training_master_chromosomes` (`name`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `lovd_training_master_variants_fk_created_by` FOREIGN KEY (`created_by`) REFERENCES `lovd_training_master_users` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `lovd_training_master_variants_fk_edited_by` FOREIGN KEY (`edited_by`) REFERENCES `lovd_training_master_users` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `lovd_training_master_variants_fk_effectid` FOREIGN KEY (`effectid`) REFERENCES `lovd_training_master_variant_effect` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `lovd_training_master_variants_fk_owned_by` FOREIGN KEY (`owned_by`) REFERENCES `lovd_training_master_users` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `lovd_training_master_variants_fk_statusid` FOREIGN KEY (`statusid`) REFERENCES `lovd_training_master_data_status` (`id`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `lovd_training_master_variants`
--
-- ORDER BY:  `id`

LOCK TABLES `lovd_training_master_variants` WRITE;
/*!40000 ALTER TABLE `lovd_training_master_variants` DISABLE KEYS */;
/*!40000 ALTER TABLE `lovd_training_master_variants` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `lovd_training_master_variants_on_transcripts`
--

DROP TABLE IF EXISTS `lovd_training_master_variants_on_transcripts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `lovd_training_master_variants_on_transcripts` (
  `id` int(10) unsigned zerofill NOT NULL,
  `transcriptid` smallint(5) unsigned zerofill NOT NULL,
  `effectid` tinyint(2) unsigned zerofill DEFAULT NULL,
  `position_c_start` mediumint(9) DEFAULT NULL,
  `position_c_start_intron` int(11) DEFAULT NULL,
  `position_c_end` mediumint(9) DEFAULT NULL,
  `position_c_end_intron` int(11) DEFAULT NULL,
  `VariantOnTranscript/DNA` varchar(100) DEFAULT NULL,
  `VariantOnTranscript/Exon` varchar(7) DEFAULT NULL,
  `VariantOnTranscript/Protein` varchar(100) DEFAULT NULL,
  `VariantOnTranscript/RNA` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`,`transcriptid`),
  KEY `transcriptid` (`transcriptid`),
  KEY `effectid` (`effectid`),
  KEY `position_c_start` (`position_c_start`,`position_c_end`),
  KEY `position_c_start_2` (`position_c_start`,`position_c_start_intron`,`position_c_end`,`position_c_end_intron`),
  CONSTRAINT `lovd_training_master_variants_on_transcripts_fk_effectid` FOREIGN KEY (`effectid`) REFERENCES `lovd_training_master_variant_effect` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `lovd_training_master_variants_on_transcripts_fk_id` FOREIGN KEY (`id`) REFERENCES `lovd_training_master_variants` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `lovd_training_master_variants_on_transcripts_fk_transcriptid` FOREIGN KEY (`transcriptid`) REFERENCES `lovd_training_master_transcripts` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `lovd_training_master_variants_on_transcripts`
--
-- ORDER BY:  `id`,`transcriptid`

LOCK TABLES `lovd_training_master_variants_on_transcripts` WRITE;
/*!40000 ALTER TABLE `lovd_training_master_variants_on_transcripts` DISABLE KEYS */;
/*!40000 ALTER TABLE `lovd_training_master_variants_on_transcripts` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2015-04-24 10:20:14

SET FOREIGN_KEY_CHECKS=1;
