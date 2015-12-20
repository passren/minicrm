CREATE DATABASE  IF NOT EXISTS `minicrm` /*!40100 DEFAULT CHARACTER SET utf8 */;
USE `minicrm`;
-- MySQL dump 10.13  Distrib 5.6.13, for Win32 (x86)
--
-- Host: 127.0.0.1    Database: minicrm-dev
-- ------------------------------------------------------
-- Server version	5.6.23-log

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
-- Table structure for table `activity`
--

DROP TABLE IF EXISTS `activity`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `activity` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `version` bigint(20) NOT NULL,
  `create_user_id` bigint(20) NOT NULL,
  `created_date` datetime NOT NULL,
  `customer_id` bigint(20) NOT NULL,
  `issue` longtext,
  `last_update_user_id` bigint(20) NOT NULL,
  `last_updated_date` datetime NOT NULL,
  `remark` longtext,
  `solution` longtext,
  `summary` varchar(500) NOT NULL,
  `type_id` bigint(20) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_yolprg6gwxcp1b783v8q3w1h` (`create_user_id`),
  KEY `FK_ete5tcw8rix1yel1bqabo6huf` (`customer_id`),
  KEY `FK_ix5u1avo5j6kbtha9oahn44ob` (`last_update_user_id`),
  KEY `FK_pqxm9f3ypyey3wrq7n44e2ya8` (`type_id`),
  CONSTRAINT `FK_ete5tcw8rix1yel1bqabo6huf` FOREIGN KEY (`customer_id`) REFERENCES `customer` (`id`),
  CONSTRAINT `FK_ix5u1avo5j6kbtha9oahn44ob` FOREIGN KEY (`last_update_user_id`) REFERENCES `user` (`id`),
  CONSTRAINT `FK_pqxm9f3ypyey3wrq7n44e2ya8` FOREIGN KEY (`type_id`) REFERENCES `value_set` (`id`),
  CONSTRAINT `FK_yolprg6gwxcp1b783v8q3w1h` FOREIGN KEY (`create_user_id`) REFERENCES `user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `city`
--

DROP TABLE IF EXISTS `city`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `city` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(40) NOT NULL,
  `province_id` bigint(20) NOT NULL,
  `remark` varchar(255) DEFAULT NULL,
  `sort` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_d6wmr68dljice4y25ykax6rfs` (`province_id`),
  CONSTRAINT `FK_d6wmr68dljice4y25ykax6rfs` FOREIGN KEY (`province_id`) REFERENCES `province` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `contact`
--

DROP TABLE IF EXISTS `contact`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `contact` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `version` bigint(20) NOT NULL,
  `cellphone` varchar(20) DEFAULT NULL,
  `create_user_id` bigint(20) NOT NULL,
  `created_date` datetime NOT NULL,
  `customer_id` bigint(20) NOT NULL,
  `department` varchar(30) DEFAULT NULL,
  `deskphone` varchar(20) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `last_update_user_id` bigint(20) NOT NULL,
  `last_updated_date` datetime NOT NULL,
  `name` varchar(50) NOT NULL,
  `position` varchar(30) DEFAULT NULL,
  `qq` varchar(20) DEFAULT NULL,
  `remark` longtext,
  `status_id` bigint(20) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_3hlsf5vnymigpcq5hsdy8cveg` (`create_user_id`),
  KEY `FK_3tg5xm2jws24fhptnehre5gtl` (`customer_id`),
  KEY `FK_fgqygeg0k5jr8sldq2wf0p7y9` (`last_update_user_id`),
  KEY `FK_fta0tx6x9r96nrmq231x9q4pu` (`status_id`),
  CONSTRAINT `FK_3hlsf5vnymigpcq5hsdy8cveg` FOREIGN KEY (`create_user_id`) REFERENCES `user` (`id`),
  CONSTRAINT `FK_3tg5xm2jws24fhptnehre5gtl` FOREIGN KEY (`customer_id`) REFERENCES `customer` (`id`),
  CONSTRAINT `FK_fgqygeg0k5jr8sldq2wf0p7y9` FOREIGN KEY (`last_update_user_id`) REFERENCES `user` (`id`),
  CONSTRAINT `FK_fta0tx6x9r96nrmq231x9q4pu` FOREIGN KEY (`status_id`) REFERENCES `value_set` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `customer`
--

DROP TABLE IF EXISTS `customer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `customer` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `version` bigint(20) NOT NULL,
  `address` varchar(255) DEFAULT NULL,
  `category_id` bigint(20) DEFAULT NULL,
  `city_id` bigint(20) NOT NULL,
  `classification_id` bigint(20) DEFAULT NULL,
  `create_user_id` bigint(20) NOT NULL,
  `created_date` datetime NOT NULL,
  `last_update_user_id` bigint(20) NOT NULL,
  `last_updated_date` datetime NOT NULL,
  `name` varchar(200) NOT NULL,
  `remark` longtext,
  `situation_id` bigint(20) DEFAULT NULL,
  `source_id` bigint(20) DEFAULT NULL,
  `status_id` bigint(20) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UK_crkjmjk1oj8gb6j6t5kt7gcxm` (`name`),
  KEY `FK_6m86ncy1c8dbskwgx3w3tiqsw` (`category_id`),
  KEY `FK_jlc87hfhrhqpq4pc1my9447wf` (`city_id`),
  KEY `FK_r73wg8dlc23h1eigx0d3gd08f` (`classification_id`),
  KEY `FK_uknof74ai0rlyxyx03rxn7gl` (`create_user_id`),
  KEY `FK_qq0q6f6yd4vresx27nuf9frsa` (`last_update_user_id`),
  KEY `FK_aagw3i5c7f21bo427ehqtexnf` (`situation_id`),
  KEY `FK_gvjkct7rr6nk8esinc7m5dfpf` (`source_id`),
  KEY `FK_mtcogn8yyp15euyrhtyxed2md` (`status_id`),
  CONSTRAINT `FK_6m86ncy1c8dbskwgx3w3tiqsw` FOREIGN KEY (`category_id`) REFERENCES `value_set` (`id`),
  CONSTRAINT `FK_aagw3i5c7f21bo427ehqtexnf` FOREIGN KEY (`situation_id`) REFERENCES `value_set` (`id`),
  CONSTRAINT `FK_gvjkct7rr6nk8esinc7m5dfpf` FOREIGN KEY (`source_id`) REFERENCES `value_set` (`id`),
  CONSTRAINT `FK_jlc87hfhrhqpq4pc1my9447wf` FOREIGN KEY (`city_id`) REFERENCES `city` (`id`),
  CONSTRAINT `FK_mtcogn8yyp15euyrhtyxed2md` FOREIGN KEY (`status_id`) REFERENCES `value_set` (`id`),
  CONSTRAINT `FK_qq0q6f6yd4vresx27nuf9frsa` FOREIGN KEY (`last_update_user_id`) REFERENCES `user` (`id`),
  CONSTRAINT `FK_r73wg8dlc23h1eigx0d3gd08f` FOREIGN KEY (`classification_id`) REFERENCES `value_set` (`id`),
  CONSTRAINT `FK_uknof74ai0rlyxyx03rxn7gl` FOREIGN KEY (`create_user_id`) REFERENCES `user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `invoice`
--

DROP TABLE IF EXISTS `invoice`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `invoice` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `version` bigint(20) NOT NULL,
  `create_user_id` bigint(20) NOT NULL,
  `created_date` datetime NOT NULL,
  `invoice_amount` decimal(19,2) NOT NULL,
  `invoice_date` datetime DEFAULT NULL,
  `invoice_number` varchar(255) DEFAULT NULL,
  `invoice_type_id` bigint(20) NOT NULL,
  `last_update_user_id` bigint(20) NOT NULL,
  `last_updated_date` datetime NOT NULL,
  `opportunity_id` bigint(20) NOT NULL,
  `remark` longtext,
  PRIMARY KEY (`id`),
  KEY `FK_g1ef4k48xrwrxijf66wx1bf8p` (`create_user_id`),
  KEY `FK_kk1s6lwwfkbdqosp3re1e8dhg` (`invoice_type_id`),
  KEY `FK_ctrr95ih7ewuw7s6phoas4dg7` (`last_update_user_id`),
  KEY `FK_r533u8nrfgcyp0b3qhrqtch6t` (`opportunity_id`),
  CONSTRAINT `FK_ctrr95ih7ewuw7s6phoas4dg7` FOREIGN KEY (`last_update_user_id`) REFERENCES `user` (`id`),
  CONSTRAINT `FK_g1ef4k48xrwrxijf66wx1bf8p` FOREIGN KEY (`create_user_id`) REFERENCES `user` (`id`),
  CONSTRAINT `FK_kk1s6lwwfkbdqosp3re1e8dhg` FOREIGN KEY (`invoice_type_id`) REFERENCES `value_set` (`id`),
  CONSTRAINT `FK_r533u8nrfgcyp0b3qhrqtch6t` FOREIGN KEY (`opportunity_id`) REFERENCES `opportunity` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `opportunity`
--

DROP TABLE IF EXISTS `opportunity`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `opportunity` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `version` bigint(20) NOT NULL,
  `certification_account` varchar(255) DEFAULT NULL,
  `certification_number` varchar(255) DEFAULT NULL,
  `contract_amount` decimal(19,2) DEFAULT NULL,
  `contract_number` varchar(255) DEFAULT NULL,
  `create_user_id` bigint(20) NOT NULL,
  `created_date` datetime NOT NULL,
  `customer_id` bigint(20) NOT NULL,
  `imp_area` varchar(255) DEFAULT NULL,
  `imp_end_date` datetime DEFAULT NULL,
  `imp_others` varchar(255) DEFAULT NULL,
  `imp_start_date` datetime DEFAULT NULL,
  `imp_status_id` bigint(20) DEFAULT NULL,
  `last_update_user_id` bigint(20) NOT NULL,
  `last_updated_date` datetime NOT NULL,
  `possibility` int(11) NOT NULL,
  `product_id` bigint(20) NOT NULL,
  `remark` longtext,
  `signed_date` datetime DEFAULT NULL,
  `status_id` bigint(20) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_7s9o0jnjs4aus4ilrix32wg8d` (`create_user_id`),
  KEY `FK_qt22sgkju5bgw9pcqm88h0um` (`customer_id`),
  KEY `FK_1nbi5i61r9iowowh6noiejxxg` (`imp_status_id`),
  KEY `FK_840nhbtspjclr81hpuqnvpbik` (`last_update_user_id`),
  KEY `FK_7bbbnd15fe55xfr0rnqplcxyv` (`product_id`),
  KEY `FK_s0scp1n9aji0tw9c1co9wa8ha` (`status_id`),
  CONSTRAINT `FK_1nbi5i61r9iowowh6noiejxxg` FOREIGN KEY (`imp_status_id`) REFERENCES `value_set` (`id`),
  CONSTRAINT `FK_7bbbnd15fe55xfr0rnqplcxyv` FOREIGN KEY (`product_id`) REFERENCES `value_set` (`id`),
  CONSTRAINT `FK_7s9o0jnjs4aus4ilrix32wg8d` FOREIGN KEY (`create_user_id`) REFERENCES `user` (`id`),
  CONSTRAINT `FK_840nhbtspjclr81hpuqnvpbik` FOREIGN KEY (`last_update_user_id`) REFERENCES `user` (`id`),
  CONSTRAINT `FK_qt22sgkju5bgw9pcqm88h0um` FOREIGN KEY (`customer_id`) REFERENCES `customer` (`id`),
  CONSTRAINT `FK_s0scp1n9aji0tw9c1co9wa8ha` FOREIGN KEY (`status_id`) REFERENCES `value_set` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `opportunity_activity`
--

DROP TABLE IF EXISTS `opportunity_activity`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `opportunity_activity` (
  `opportunity_id` bigint(20) NOT NULL,
  `activity_id` bigint(20) NOT NULL,
  PRIMARY KEY (`opportunity_id`,`activity_id`),
  KEY `FK_dngqywl7t0judcvvannodunxb` (`activity_id`),
  CONSTRAINT `FK_6ghurutfu32kx904yfs5773gr` FOREIGN KEY (`opportunity_id`) REFERENCES `opportunity` (`id`),
  CONSTRAINT `FK_dngqywl7t0judcvvannodunxb` FOREIGN KEY (`activity_id`) REFERENCES `activity` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `person`
--

DROP TABLE IF EXISTS `person`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `person` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `version` bigint(20) NOT NULL,
  `created_date` datetime NOT NULL,
  `jobnumber` varchar(255) DEFAULT NULL,
  `jobposition_id` bigint(20) DEFAULT NULL,
  `last_updated_date` datetime NOT NULL,
  `name` varchar(50) NOT NULL,
  `status_id` bigint(20) DEFAULT NULL,
  `supervisor_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_7n6h6bky4qp49e13hygbnfmx4` (`jobposition_id`),
  KEY `FK_6jig8jkahfsdt0y0kbep19mti` (`status_id`),
  KEY `FK_f5hhe53ncti5mbcgvr8eq73th` (`supervisor_id`),
  CONSTRAINT `FK_6jig8jkahfsdt0y0kbep19mti` FOREIGN KEY (`status_id`) REFERENCES `value_set` (`id`),
  CONSTRAINT `FK_7n6h6bky4qp49e13hygbnfmx4` FOREIGN KEY (`jobposition_id`) REFERENCES `value_set` (`id`),
  CONSTRAINT `FK_f5hhe53ncti5mbcgvr8eq73th` FOREIGN KEY (`supervisor_id`) REFERENCES `person` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `person_customer`
--

DROP TABLE IF EXISTS `person_customer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `person_customer` (
  `person_id` bigint(20) NOT NULL,
  `customer_id` bigint(20) NOT NULL,
  PRIMARY KEY (`person_id`,`customer_id`),
  KEY `FK_9opnsgxynmhxp80ctniladvar` (`customer_id`),
  CONSTRAINT `FK_9opnsgxynmhxp80ctniladvar` FOREIGN KEY (`customer_id`) REFERENCES `customer` (`id`),
  CONSTRAINT `FK_e2qijpbj7q0o9s5nm1hipxa5n` FOREIGN KEY (`person_id`) REFERENCES `person` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `province`
--

DROP TABLE IF EXISTS `province`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `province` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(30) NOT NULL,
  `remark` varchar(255) DEFAULT NULL,
  `sort` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UK_ixpn85566lwxgajun8msnplik` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `receivable`
--

DROP TABLE IF EXISTS `receivable`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `receivable` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `version` bigint(20) NOT NULL,
  `create_user_id` bigint(20) NOT NULL,
  `created_date` datetime NOT NULL,
  `last_update_user_id` bigint(20) NOT NULL,
  `last_updated_date` datetime NOT NULL,
  `opportunity_id` bigint(20) NOT NULL,
  `receipt_amount` decimal(19,2) NOT NULL,
  `receipt_date` datetime DEFAULT NULL,
  `receipt_method_id` bigint(20) NOT NULL,
  `remark` longtext,
  PRIMARY KEY (`id`),
  KEY `FK_klorjj08otefcia87kykot5a6` (`create_user_id`),
  KEY `FK_syc33n9nbud5jeqni6oqwqacs` (`last_update_user_id`),
  KEY `FK_896bua4het7i6l7y545k09ml8` (`opportunity_id`),
  KEY `FK_jmkbqpv2c7c58rwu2vhdsvs73` (`receipt_method_id`),
  CONSTRAINT `FK_896bua4het7i6l7y545k09ml8` FOREIGN KEY (`opportunity_id`) REFERENCES `opportunity` (`id`),
  CONSTRAINT `FK_jmkbqpv2c7c58rwu2vhdsvs73` FOREIGN KEY (`receipt_method_id`) REFERENCES `value_set` (`id`),
  CONSTRAINT `FK_klorjj08otefcia87kykot5a6` FOREIGN KEY (`create_user_id`) REFERENCES `user` (`id`),
  CONSTRAINT `FK_syc33n9nbud5jeqni6oqwqacs` FOREIGN KEY (`last_update_user_id`) REFERENCES `user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `role`
--

DROP TABLE IF EXISTS `role`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `role` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `version` bigint(20) NOT NULL,
  `authority` varchar(255) NOT NULL,
  `description` varchar(255) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UK_irsamgnera6angm0prq1kemt2` (`authority`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `service_request`
--

DROP TABLE IF EXISTS `service_request`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `service_request` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `version` bigint(20) NOT NULL,
  `classification_id` bigint(20) NOT NULL,
  `completed_date` datetime DEFAULT NULL,
  `create_user_id` bigint(20) NOT NULL,
  `created_date` datetime NOT NULL,
  `customer_id` bigint(20) NOT NULL,
  `last_update_user_id` bigint(20) NOT NULL,
  `last_updated_date` datetime NOT NULL,
  `maintainer` varchar(255) DEFAULT NULL,
  `name` varchar(500) NOT NULL,
  `owner` varchar(255) DEFAULT NULL,
  `remark` longtext,
  `status_id` bigint(20) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_syjhfeba1fupvgb3gvh0bs01r` (`classification_id`),
  KEY `FK_jotbiar2pijfs666wia58fis3` (`create_user_id`),
  KEY `FK_manafca6lmhj34a9emfiwxnmf` (`customer_id`),
  KEY `FK_qwsemubt3tjjtpmbwxdy0lh4n` (`last_update_user_id`),
  KEY `FK_6ev7f9kjswresw53hnvsou72u` (`status_id`),
  CONSTRAINT `FK_6ev7f9kjswresw53hnvsou72u` FOREIGN KEY (`status_id`) REFERENCES `value_set` (`id`),
  CONSTRAINT `FK_jotbiar2pijfs666wia58fis3` FOREIGN KEY (`create_user_id`) REFERENCES `user` (`id`),
  CONSTRAINT `FK_manafca6lmhj34a9emfiwxnmf` FOREIGN KEY (`customer_id`) REFERENCES `customer` (`id`),
  CONSTRAINT `FK_qwsemubt3tjjtpmbwxdy0lh4n` FOREIGN KEY (`last_update_user_id`) REFERENCES `user` (`id`),
  CONSTRAINT `FK_syjhfeba1fupvgb3gvh0bs01r` FOREIGN KEY (`classification_id`) REFERENCES `value_set` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `version` bigint(20) NOT NULL,
  `account_expired` bit(1) NOT NULL,
  `account_locked` bit(1) NOT NULL,
  `created_date` datetime NOT NULL,
  `enabled` bit(1) NOT NULL,
  `last_updated_date` datetime NOT NULL,
  `password` varchar(255) NOT NULL,
  `password_expired` bit(1) NOT NULL,
  `person_id` bigint(20) DEFAULT NULL,
  `realname` varchar(50) NOT NULL,
  `username` varchar(20) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UK_sb8bbouer5wak8vyiiy4pf2bx` (`username`),
  KEY `FK_skugu4aa786hx4o05wn6cs7q0` (`person_id`),
  CONSTRAINT `FK_skugu4aa786hx4o05wn6cs7q0` FOREIGN KEY (`person_id`) REFERENCES `person` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `user_role`
--

DROP TABLE IF EXISTS `user_role`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user_role` (
  `role_id` bigint(20) NOT NULL,
  `user_id` bigint(20) NOT NULL,
  PRIMARY KEY (`role_id`,`user_id`),
  KEY `FK_apcc8lxk2xnug8377fatvbn04` (`user_id`),
  CONSTRAINT `FK_apcc8lxk2xnug8377fatvbn04` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`),
  CONSTRAINT `FK_it77eq964jhfqtu54081ebtio` FOREIGN KEY (`role_id`) REFERENCES `role` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `value_set`
--

DROP TABLE IF EXISTS `value_set`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `value_set` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `category` varchar(50) NOT NULL,
  `code` varchar(50) NOT NULL,
  `code1` varchar(50) DEFAULT NULL,
  `code2` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2015-12-20 18:40:59
