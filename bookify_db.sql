-- MySQL dump 10.13  Distrib 8.0.36, for Win64 (x86_64)
--
-- Host: localhost    Database: bookify_db
-- ------------------------------------------------------
-- Server version	8.0.36

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
-- Table structure for table `approval_logs`
--

DROP TABLE IF EXISTS `approval_logs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `approval_logs` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `booking_id` bigint unsigned NOT NULL,
  `approver_id` bigint unsigned NOT NULL,
  `status` enum('pending','approved','declined') COLLATE utf8mb4_unicode_ci NOT NULL,
  `remarks` text COLLATE utf8mb4_unicode_ci,
  `approved_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `approval_logs_booking_id_foreign` (`booking_id`),
  KEY `approval_logs_approver_id_foreign` (`approver_id`),
  CONSTRAINT `approval_logs_approver_id_foreign` FOREIGN KEY (`approver_id`) REFERENCES `approvers` (`id`),
  CONSTRAINT `approval_logs_booking_id_foreign` FOREIGN KEY (`booking_id`) REFERENCES `bookings` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `approval_logs`
--

LOCK TABLES `approval_logs` WRITE;
/*!40000 ALTER TABLE `approval_logs` DISABLE KEYS */;
/*!40000 ALTER TABLE `approval_logs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `approvers`
--

DROP TABLE IF EXISTS `approvers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `approvers` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `asset_type_id` bigint unsigned NOT NULL,
  `user_id` bigint unsigned NOT NULL,
  `approver_level` int NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `approvers_asset_type_id_foreign` (`asset_type_id`),
  KEY `approvers_user_id_foreign` (`user_id`),
  CONSTRAINT `approvers_asset_type_id_foreign` FOREIGN KEY (`asset_type_id`) REFERENCES `asset_types` (`id`),
  CONSTRAINT `approvers_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=58 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `approvers`
--

LOCK TABLES `approvers` WRITE;
/*!40000 ALTER TABLE `approvers` DISABLE KEYS */;
INSERT INTO `approvers` VALUES (38,1,49,1,'2025-08-14 06:14:17','2025-08-14 06:14:17'),(39,1,50,2,'2025-08-14 06:14:22','2025-08-14 06:14:22'),(41,1,45,1,'2025-08-14 07:54:08','2025-08-14 07:54:08'),(42,1,47,2,'2025-08-14 07:54:12','2025-08-14 07:54:12'),(43,2,49,1,'2025-08-14 09:29:39','2025-08-14 09:29:39'),(44,2,50,2,'2025-08-14 09:29:43','2025-08-14 09:29:43'),(48,2,54,1,'2025-08-19 03:23:23','2025-08-19 03:23:23'),(49,2,54,2,'2025-08-19 03:23:28','2025-08-19 03:23:28'),(52,1,55,1,'2025-08-19 03:25:41','2025-08-19 03:25:41'),(55,2,55,2,'2025-08-19 10:07:05','2025-08-19 10:07:05'),(56,2,45,1,'2025-08-19 10:08:50','2025-08-19 10:08:50'),(57,2,55,2,'2025-08-19 10:08:54','2025-08-19 10:08:54');
/*!40000 ALTER TABLE `approvers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `asset_details`
--

DROP TABLE IF EXISTS `asset_details`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `asset_details` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `asset_type_id` bigint unsigned NOT NULL,
  `asset_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `location` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `brand` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `model` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `color` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `plate_number` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `number_of_seats` int NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `asset_details_asset_type_id_foreign` (`asset_type_id`),
  CONSTRAINT `asset_details_asset_type_id_foreign` FOREIGN KEY (`asset_type_id`) REFERENCES `asset_types` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=26 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `asset_details`
--

LOCK TABLES `asset_details` WRITE;
/*!40000 ALTER TABLE `asset_details` DISABLE KEYS */;
INSERT INTO `asset_details` VALUES (15,2,'Toyota Hiace',NULL,'Toyota','Hiace GL Grandia','Silver','NAX 1234',6,'2025-08-06 09:16:26','2025-08-20 01:16:30'),(20,1,'Mall Admin ','4th floor, Gaisano Mall of Davao',NULL,NULL,NULL,NULL,31,'2025-08-13 02:01:46','2025-08-20 01:16:42'),(21,1,'Leasing Conference Room','4th floor, Gaisano Mall of Davao',NULL,NULL,NULL,NULL,25,'2025-08-13 02:02:07','2025-08-13 02:17:04'),(24,1,'HR Conference Room','UG, Gaisano Mall of Davao',NULL,NULL,NULL,NULL,50,'2025-08-13 02:16:30','2025-08-13 02:16:30');
/*!40000 ALTER TABLE `asset_details` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `asset_files`
--

DROP TABLE IF EXISTS `asset_files`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `asset_files` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `asset_detail_id` bigint unsigned NOT NULL,
  `file_attachments` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `asset_files_asset_detail_id_foreign` (`asset_detail_id`),
  CONSTRAINT `asset_files_asset_detail_id_foreign` FOREIGN KEY (`asset_detail_id`) REFERENCES `asset_details` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `asset_files`
--

LOCK TABLES `asset_files` WRITE;
/*!40000 ALTER TABLE `asset_files` DISABLE KEYS */;
INSERT INTO `asset_files` VALUES (15,15,'asset_images/1754545804_WIGO.jpg','2025-08-07 05:50:04','2025-08-07 05:50:04');
/*!40000 ALTER TABLE `asset_files` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `asset_types`
--

DROP TABLE IF EXISTS `asset_types`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `asset_types` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `asset_types`
--

LOCK TABLES `asset_types` WRITE;
/*!40000 ALTER TABLE `asset_types` DISABLE KEYS */;
INSERT INTO `asset_types` VALUES (1,'Conference room','2025-08-06 09:02:29','2025-08-06 09:02:29'),(2,'Vehicle','2025-08-06 09:02:36','2025-08-06 09:02:36');
/*!40000 ALTER TABLE `asset_types` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `booked_guests`
--

DROP TABLE IF EXISTS `booked_guests`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `booked_guests` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `booking_id` bigint unsigned NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `booked_guests_booking_id_foreign` (`booking_id`),
  CONSTRAINT `booked_guests_booking_id_foreign` FOREIGN KEY (`booking_id`) REFERENCES `bookings` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=141 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `booked_guests`
--

LOCK TABLES `booked_guests` WRITE;
/*!40000 ALTER TABLE `booked_guests` DISABLE KEYS */;
INSERT INTO `booked_guests` VALUES (137,158,'delapos.christian2002@gmail.com','2025-08-22 04:35:29','2025-08-22 04:35:29'),(138,159,'delapos.christian2002@gmail.com','2025-08-22 04:36:06','2025-08-22 04:36:06'),(139,160,'christian.delapos6@gmail.com','2025-08-22 04:39:04','2025-08-22 04:39:04'),(140,161,'christian.delapos6@gmail.com','2025-08-22 04:39:31','2025-08-22 04:39:31');
/*!40000 ALTER TABLE `booked_guests` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `bookings`
--

DROP TABLE IF EXISTS `bookings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `bookings` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `asset_type_id` bigint unsigned NOT NULL,
  `asset_detail_id` bigint unsigned DEFAULT NULL,
  `user_id` bigint unsigned NOT NULL,
  `asset_name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `purpose` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `no_of_seats` int NOT NULL,
  `destination` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `scheduled_date` date NOT NULL,
  `time_from` time NOT NULL,
  `time_to` time NOT NULL,
  `notes` text COLLATE utf8mb4_unicode_ci,
  `status` enum('pending','approved','rejected','ended') COLLATE utf8mb4_unicode_ci NOT NULL,
  `first_approver_name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `first_approved_at` timestamp NULL DEFAULT NULL,
  `second_approver_name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `second_approved_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `disapprove_reason` text COLLATE utf8mb4_unicode_ci,
  PRIMARY KEY (`id`),
  KEY `bookings_asset_type_id_foreign` (`asset_type_id`),
  KEY `bookings_user_id_foreign` (`user_id`),
  KEY `bookings_asset_detail_id_foreign` (`asset_detail_id`),
  CONSTRAINT `bookings_asset_detail_id_foreign` FOREIGN KEY (`asset_detail_id`) REFERENCES `asset_details` (`id`),
  CONSTRAINT `bookings_asset_type_id_foreign` FOREIGN KEY (`asset_type_id`) REFERENCES `asset_types` (`id`),
  CONSTRAINT `bookings_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=162 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bookings`
--

LOCK TABLES `bookings` WRITE;
/*!40000 ALTER TABLE `bookings` DISABLE KEYS */;
INSERT INTO `bookings` VALUES (158,2,NULL,32,NULL,'Test',12,'Test','2025-08-22','12:35:00','14:34:00','test','approved','Christian Delapos','2025-08-22 04:36:30','Christian Approver2','2025-08-22 04:37:15','2025-08-22 04:35:29','2025-08-22 04:37:21',NULL),(159,2,NULL,32,NULL,'test',4,'Test 2','2025-08-22','14:35:00','15:35:00','test','approved','Christian Delapos','2025-08-22 04:36:24','Christian Approver2','2025-08-22 04:36:47','2025-08-22 04:36:06','2025-08-22 04:36:53',NULL),(160,2,NULL,32,NULL,'Test',2,'Test','2025-08-22','12:38:00','13:38:00','TEst','approved','Christian Delapos','2025-08-22 04:40:48','Christian Approver2','2025-08-22 04:41:13','2025-08-22 04:39:04','2025-08-22 04:41:19',NULL),(161,2,NULL,32,NULL,'Test',2,'Test1','2025-08-22','13:39:00','14:39:00','Test','approved','Christian Delapos','2025-08-22 04:40:42','Christian Approver2','2025-08-22 04:41:03','2025-08-22 04:39:31','2025-08-22 04:41:08',NULL);
/*!40000 ALTER TABLE `bookings` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `branches`
--

DROP TABLE IF EXISTS `branches`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `branches` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=47 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `branches`
--

LOCK TABLES `branches` WRITE;
/*!40000 ALTER TABLE `branches` DISABLE KEYS */;
INSERT INTO `branches` VALUES (37,'Bajada','2025-08-06 08:29:24','2025-08-06 08:29:24'),(38,'Quirino','2025-08-13 02:13:26','2025-08-13 02:13:26'),(39,'Azuela','2025-08-13 02:13:34','2025-08-13 02:13:34'),(40,'Toril','2025-08-13 02:13:41','2025-08-13 02:13:41'),(41,'Tagum Mall','2025-08-13 02:13:53','2025-08-13 02:13:53'),(42,'Tagum Center','2025-08-13 02:14:08','2025-08-13 02:14:08'),(43,'Digos Mall','2025-08-13 02:14:17','2025-08-13 02:14:17'),(44,'Digos Center','2025-08-13 02:14:23','2025-08-13 02:14:23'),(45,'GenSan','2025-08-13 02:15:21','2025-08-13 02:15:21'),(46,'Cebu','2025-08-13 02:15:27','2025-08-13 02:15:27');
/*!40000 ALTER TABLE `branches` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `business_units`
--

DROP TABLE IF EXISTS `business_units`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `business_units` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `business_units`
--

LOCK TABLES `business_units` WRITE;
/*!40000 ALTER TABLE `business_units` DISABLE KEYS */;
INSERT INTO `business_units` VALUES (9,'Default Business Unit','2025-08-06 08:24:21','2025-08-06 08:24:21'),(10,'DPS','2025-08-13 01:46:56','2025-08-13 01:46:56'),(11,'SPM','2025-08-13 01:47:02','2025-08-13 01:47:02'),(12,'SPE','2025-08-13 01:47:09','2025-08-13 01:47:09'),(13,'ICT','2025-08-13 02:20:01','2025-08-13 02:20:01'),(14,'FPM','2025-08-14 09:34:53','2025-08-14 09:34:53');
/*!40000 ALTER TABLE `business_units` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cache`
--

DROP TABLE IF EXISTS `cache`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cache` (
  `key` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `value` mediumtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `expiration` int NOT NULL,
  PRIMARY KEY (`key`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cache`
--

LOCK TABLES `cache` WRITE;
/*!40000 ALTER TABLE `cache` DISABLE KEYS */;
/*!40000 ALTER TABLE `cache` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cache_locks`
--

DROP TABLE IF EXISTS `cache_locks`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cache_locks` (
  `key` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `owner` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `expiration` int NOT NULL,
  PRIMARY KEY (`key`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cache_locks`
--

LOCK TABLES `cache_locks` WRITE;
/*!40000 ALTER TABLE `cache_locks` DISABLE KEYS */;
/*!40000 ALTER TABLE `cache_locks` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `company_codes`
--

DROP TABLE IF EXISTS `company_codes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `company_codes` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `company_codes`
--

LOCK TABLES `company_codes` WRITE;
/*!40000 ALTER TABLE `company_codes` DISABLE KEYS */;
INSERT INTO `company_codes` VALUES (8,'Default Company','2025-08-06 08:24:21','2025-08-06 08:24:21'),(9,'DSG Sons Group, Inc','2025-08-13 01:55:23','2025-08-13 01:55:23'),(10,'Gaisano Dadiangas Inc.','2025-08-13 01:56:07','2025-08-13 01:56:07'),(11,'Tagum Commercial & Realty Corp.','2025-08-13 01:56:23','2025-08-13 01:56:23'),(12,'One Great Asia Group Inc.','2025-08-13 01:58:16','2025-08-13 01:58:16');
/*!40000 ALTER TABLE `company_codes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `departments`
--

DROP TABLE IF EXISTS `departments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `departments` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=31 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `departments`
--

LOCK TABLES `departments` WRITE;
/*!40000 ALTER TABLE `departments` DISABLE KEYS */;
INSERT INTO `departments` VALUES (25,'ICT','2025-08-06 08:29:32','2025-08-06 08:29:32'),(26,'SPM','2025-08-13 01:31:32','2025-08-13 01:31:39'),(27,'DPS','2025-08-13 01:31:48','2025-08-13 01:31:48'),(28,'HR','2025-08-13 01:46:48','2025-08-13 01:46:48'),(29,'SPE','2025-08-13 01:47:14','2025-08-13 01:47:14'),(30,'FPM','2025-08-14 09:34:59','2025-08-14 09:34:59');
/*!40000 ALTER TABLE `departments` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `drivers`
--

DROP TABLE IF EXISTS `drivers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `drivers` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `drivers`
--

LOCK TABLES `drivers` WRITE;
/*!40000 ALTER TABLE `drivers` DISABLE KEYS */;
INSERT INTO `drivers` VALUES (11,'Driver 1',1,'2025-08-13 00:55:31','2025-08-13 00:55:31'),(12,'Driver 2',1,'2025-08-13 00:55:37','2025-08-13 00:55:37'),(13,'Driver 3',1,'2025-08-13 00:55:42','2025-08-13 00:55:42');
/*!40000 ALTER TABLE `drivers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `failed_jobs`
--

DROP TABLE IF EXISTS `failed_jobs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `failed_jobs` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `uuid` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `connection` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `failed_jobs`
--

LOCK TABLES `failed_jobs` WRITE;
/*!40000 ALTER TABLE `failed_jobs` DISABLE KEYS */;
INSERT INTO `failed_jobs` VALUES (1,'30712a74-1321-460b-ade5-8b261b91d01e','database','default','{\"uuid\":\"30712a74-1321-460b-ade5-8b261b91d01e\",\"displayName\":\"App\\\\Mail\\\\BookingApprovedMail\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"Illuminate\\\\Mail\\\\SendQueuedMailable\",\"command\":\"O:34:\\\"Illuminate\\\\Mail\\\\SendQueuedMailable\\\":15:{s:8:\\\"mailable\\\";O:28:\\\"App\\\\Mail\\\\BookingApprovedMail\\\":3:{s:7:\\\"booking\\\";O:45:\\\"Illuminate\\\\Contracts\\\\Database\\\\ModelIdentifier\\\":5:{s:5:\\\"class\\\";s:18:\\\"App\\\\Models\\\\Booking\\\";s:2:\\\"id\\\";i:50;s:9:\\\"relations\\\";a:1:{i:0;s:4:\\\"user\\\";}s:10:\\\"connection\\\";s:5:\\\"mysql\\\";s:15:\\\"collectionClass\\\";N;}s:2:\\\"to\\\";a:1:{i:0;a:2:{s:4:\\\"name\\\";N;s:7:\\\"address\\\";s:28:\\\"christian.delapos6@gmail.com\\\";}}s:6:\\\"mailer\\\";s:4:\\\"smtp\\\";}s:5:\\\"tries\\\";N;s:7:\\\"timeout\\\";N;s:13:\\\"maxExceptions\\\";N;s:17:\\\"shouldBeEncrypted\\\";b:0;s:10:\\\"connection\\\";N;s:5:\\\"queue\\\";N;s:5:\\\"delay\\\";N;s:11:\\\"afterCommit\\\";N;s:10:\\\"middleware\\\";a:0:{}s:7:\\\"chained\\\";a:0:{}s:15:\\\"chainConnection\\\";N;s:10:\\\"chainQueue\\\";N;s:19:\\\"chainCatchCallbacks\\\";N;s:3:\\\"job\\\";N;}\"},\"createdAt\":1754460829,\"delay\":null}','Symfony\\Component\\Mailer\\Exception\\TransportException: Connection to \"smtp.gmail.com:587\" has been closed unexpectedly. in D:\\Small-Proj\\schedulink\\vendor\\symfony\\mailer\\Transport\\Smtp\\Stream\\AbstractStream.php:88\nStack trace:\n#0 D:\\Small-Proj\\schedulink\\vendor\\symfony\\mailer\\Transport\\Smtp\\SmtpTransport.php(350): Symfony\\Component\\Mailer\\Transport\\Smtp\\Stream\\AbstractStream->readLine()\n#1 D:\\Small-Proj\\schedulink\\vendor\\symfony\\mailer\\Transport\\Smtp\\SmtpTransport.php(197): Symfony\\Component\\Mailer\\Transport\\Smtp\\SmtpTransport->getFullResponse()\n#2 D:\\Small-Proj\\schedulink\\vendor\\symfony\\mailer\\Transport\\Smtp\\EsmtpTransport.php(150): Symfony\\Component\\Mailer\\Transport\\Smtp\\SmtpTransport->executeCommand()\n#3 D:\\Small-Proj\\schedulink\\vendor\\symfony\\mailer\\Transport\\Smtp\\Auth\\LoginAuthenticator.php(34): Symfony\\Component\\Mailer\\Transport\\Smtp\\EsmtpTransport->executeCommand()\n#4 D:\\Small-Proj\\schedulink\\vendor\\symfony\\mailer\\Transport\\Smtp\\EsmtpTransport.php(243): Symfony\\Component\\Mailer\\Transport\\Smtp\\Auth\\LoginAuthenticator->authenticate()\n#5 D:\\Small-Proj\\schedulink\\vendor\\symfony\\mailer\\Transport\\Smtp\\EsmtpTransport.php(199): Symfony\\Component\\Mailer\\Transport\\Smtp\\EsmtpTransport->handleAuth()\n#6 D:\\Small-Proj\\schedulink\\vendor\\symfony\\mailer\\Transport\\Smtp\\EsmtpTransport.php(150): Symfony\\Component\\Mailer\\Transport\\Smtp\\EsmtpTransport->doEhloCommand()\n#7 D:\\Small-Proj\\schedulink\\vendor\\symfony\\mailer\\Transport\\Smtp\\SmtpTransport.php(255): Symfony\\Component\\Mailer\\Transport\\Smtp\\EsmtpTransport->executeCommand()\n#8 D:\\Small-Proj\\schedulink\\vendor\\symfony\\mailer\\Transport\\Smtp\\SmtpTransport.php(281): Symfony\\Component\\Mailer\\Transport\\Smtp\\SmtpTransport->doHeloCommand()\n#9 D:\\Small-Proj\\schedulink\\vendor\\symfony\\mailer\\Transport\\Smtp\\SmtpTransport.php(211): Symfony\\Component\\Mailer\\Transport\\Smtp\\SmtpTransport->start()\n#10 D:\\Small-Proj\\schedulink\\vendor\\symfony\\mailer\\Transport\\AbstractTransport.php(69): Symfony\\Component\\Mailer\\Transport\\Smtp\\SmtpTransport->doSend()\n#11 D:\\Small-Proj\\schedulink\\vendor\\symfony\\mailer\\Transport\\Smtp\\SmtpTransport.php(138): Symfony\\Component\\Mailer\\Transport\\AbstractTransport->send()\n#12 D:\\Small-Proj\\schedulink\\vendor\\laravel\\framework\\src\\Illuminate\\Mail\\Mailer.php(584): Symfony\\Component\\Mailer\\Transport\\Smtp\\SmtpTransport->send()\n#13 D:\\Small-Proj\\schedulink\\vendor\\laravel\\framework\\src\\Illuminate\\Mail\\Mailer.php(331): Illuminate\\Mail\\Mailer->sendSymfonyMessage()\n#14 D:\\Small-Proj\\schedulink\\vendor\\laravel\\framework\\src\\Illuminate\\Mail\\Mailable.php(207): Illuminate\\Mail\\Mailer->send()\n#15 D:\\Small-Proj\\schedulink\\vendor\\laravel\\framework\\src\\Illuminate\\Support\\Traits\\Localizable.php(19): Illuminate\\Mail\\Mailable->Illuminate\\Mail\\{closure}()\n#16 D:\\Small-Proj\\schedulink\\vendor\\laravel\\framework\\src\\Illuminate\\Mail\\Mailable.php(200): Illuminate\\Mail\\Mailable->withLocale()\n#17 D:\\Small-Proj\\schedulink\\vendor\\laravel\\framework\\src\\Illuminate\\Mail\\SendQueuedMailable.php(82): Illuminate\\Mail\\Mailable->send()\n#18 D:\\Small-Proj\\schedulink\\vendor\\laravel\\framework\\src\\Illuminate\\Container\\BoundMethod.php(36): Illuminate\\Mail\\SendQueuedMailable->handle()\n#19 D:\\Small-Proj\\schedulink\\vendor\\laravel\\framework\\src\\Illuminate\\Container\\Util.php(43): Illuminate\\Container\\BoundMethod::Illuminate\\Container\\{closure}()\n#20 D:\\Small-Proj\\schedulink\\vendor\\laravel\\framework\\src\\Illuminate\\Container\\BoundMethod.php(96): Illuminate\\Container\\Util::unwrapIfClosure()\n#21 D:\\Small-Proj\\schedulink\\vendor\\laravel\\framework\\src\\Illuminate\\Container\\BoundMethod.php(35): Illuminate\\Container\\BoundMethod::callBoundMethod()\n#22 D:\\Small-Proj\\schedulink\\vendor\\laravel\\framework\\src\\Illuminate\\Container\\Container.php(780): Illuminate\\Container\\BoundMethod::call()\n#23 D:\\Small-Proj\\schedulink\\vendor\\laravel\\framework\\src\\Illuminate\\Bus\\Dispatcher.php(132): Illuminate\\Container\\Container->call()\n#24 D:\\Small-Proj\\schedulink\\vendor\\laravel\\framework\\src\\Illuminate\\Pipeline\\Pipeline.php(169): Illuminate\\Bus\\Dispatcher->Illuminate\\Bus\\{closure}()\n#25 D:\\Small-Proj\\schedulink\\vendor\\laravel\\framework\\src\\Illuminate\\Pipeline\\Pipeline.php(126): Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}()\n#26 D:\\Small-Proj\\schedulink\\vendor\\laravel\\framework\\src\\Illuminate\\Bus\\Dispatcher.php(136): Illuminate\\Pipeline\\Pipeline->then()\n#27 D:\\Small-Proj\\schedulink\\vendor\\laravel\\framework\\src\\Illuminate\\Queue\\CallQueuedHandler.php(134): Illuminate\\Bus\\Dispatcher->dispatchNow()\n#28 D:\\Small-Proj\\schedulink\\vendor\\laravel\\framework\\src\\Illuminate\\Pipeline\\Pipeline.php(169): Illuminate\\Queue\\CallQueuedHandler->Illuminate\\Queue\\{closure}()\n#29 D:\\Small-Proj\\schedulink\\vendor\\laravel\\framework\\src\\Illuminate\\Pipeline\\Pipeline.php(126): Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}()\n#30 D:\\Small-Proj\\schedulink\\vendor\\laravel\\framework\\src\\Illuminate\\Queue\\CallQueuedHandler.php(127): Illuminate\\Pipeline\\Pipeline->then()\n#31 D:\\Small-Proj\\schedulink\\vendor\\laravel\\framework\\src\\Illuminate\\Queue\\CallQueuedHandler.php(68): Illuminate\\Queue\\CallQueuedHandler->dispatchThroughMiddleware()\n#32 D:\\Small-Proj\\schedulink\\vendor\\laravel\\framework\\src\\Illuminate\\Queue\\Jobs\\Job.php(102): Illuminate\\Queue\\CallQueuedHandler->call()\n#33 D:\\Small-Proj\\schedulink\\vendor\\laravel\\framework\\src\\Illuminate\\Queue\\Worker.php(444): Illuminate\\Queue\\Jobs\\Job->fire()\n#34 D:\\Small-Proj\\schedulink\\vendor\\laravel\\framework\\src\\Illuminate\\Queue\\Worker.php(394): Illuminate\\Queue\\Worker->process()\n#35 D:\\Small-Proj\\schedulink\\vendor\\laravel\\framework\\src\\Illuminate\\Queue\\Worker.php(180): Illuminate\\Queue\\Worker->runJob()\n#36 D:\\Small-Proj\\schedulink\\vendor\\laravel\\framework\\src\\Illuminate\\Queue\\Console\\WorkCommand.php(148): Illuminate\\Queue\\Worker->daemon()\n#37 D:\\Small-Proj\\schedulink\\vendor\\laravel\\framework\\src\\Illuminate\\Queue\\Console\\WorkCommand.php(131): Illuminate\\Queue\\Console\\WorkCommand->runWorker()\n#38 D:\\Small-Proj\\schedulink\\vendor\\laravel\\framework\\src\\Illuminate\\Container\\BoundMethod.php(36): Illuminate\\Queue\\Console\\WorkCommand->handle()\n#39 D:\\Small-Proj\\schedulink\\vendor\\laravel\\framework\\src\\Illuminate\\Container\\Util.php(43): Illuminate\\Container\\BoundMethod::Illuminate\\Container\\{closure}()\n#40 D:\\Small-Proj\\schedulink\\vendor\\laravel\\framework\\src\\Illuminate\\Container\\BoundMethod.php(96): Illuminate\\Container\\Util::unwrapIfClosure()\n#41 D:\\Small-Proj\\schedulink\\vendor\\laravel\\framework\\src\\Illuminate\\Container\\BoundMethod.php(35): Illuminate\\Container\\BoundMethod::callBoundMethod()\n#42 D:\\Small-Proj\\schedulink\\vendor\\laravel\\framework\\src\\Illuminate\\Container\\Container.php(780): Illuminate\\Container\\BoundMethod::call()\n#43 D:\\Small-Proj\\schedulink\\vendor\\laravel\\framework\\src\\Illuminate\\Console\\Command.php(211): Illuminate\\Container\\Container->call()\n#44 D:\\Small-Proj\\schedulink\\vendor\\symfony\\console\\Command\\Command.php(318): Illuminate\\Console\\Command->execute()\n#45 D:\\Small-Proj\\schedulink\\vendor\\laravel\\framework\\src\\Illuminate\\Console\\Command.php(180): Symfony\\Component\\Console\\Command\\Command->run()\n#46 D:\\Small-Proj\\schedulink\\vendor\\symfony\\console\\Application.php(1092): Illuminate\\Console\\Command->run()\n#47 D:\\Small-Proj\\schedulink\\vendor\\symfony\\console\\Application.php(341): Symfony\\Component\\Console\\Application->doRunCommand()\n#48 D:\\Small-Proj\\schedulink\\vendor\\symfony\\console\\Application.php(192): Symfony\\Component\\Console\\Application->doRun()\n#49 D:\\Small-Proj\\schedulink\\vendor\\laravel\\framework\\src\\Illuminate\\Foundation\\Console\\Kernel.php(197): Symfony\\Component\\Console\\Application->run()\n#50 D:\\Small-Proj\\schedulink\\vendor\\laravel\\framework\\src\\Illuminate\\Foundation\\Application.php(1234): Illuminate\\Foundation\\Console\\Kernel->handle()\n#51 D:\\Small-Proj\\schedulink\\artisan(16): Illuminate\\Foundation\\Application->handleCommand()\n#52 {main}','2025-08-06 06:15:13'),(2,'dc1194c3-aaf6-4421-aeb1-74bd711605a4','database','default','{\"uuid\":\"dc1194c3-aaf6-4421-aeb1-74bd711605a4\",\"displayName\":\"App\\\\Mail\\\\BookingApprovedMail\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"Illuminate\\\\Mail\\\\SendQueuedMailable\",\"command\":\"O:34:\\\"Illuminate\\\\Mail\\\\SendQueuedMailable\\\":15:{s:8:\\\"mailable\\\";O:28:\\\"App\\\\Mail\\\\BookingApprovedMail\\\":4:{s:7:\\\"booking\\\";O:45:\\\"Illuminate\\\\Contracts\\\\Database\\\\ModelIdentifier\\\":5:{s:5:\\\"class\\\";s:18:\\\"App\\\\Models\\\\Booking\\\";s:2:\\\"id\\\";i:53;s:9:\\\"relations\\\";a:1:{i:0;s:4:\\\"user\\\";}s:10:\\\"connection\\\";s:5:\\\"mysql\\\";s:15:\\\"collectionClass\\\";N;}s:4:\\\"type\\\";s:9:\\\"requester\\\";s:2:\\\"to\\\";a:1:{i:0;a:2:{s:4:\\\"name\\\";N;s:7:\\\"address\\\";s:28:\\\"christian.delapos6@gmail.com\\\";}}s:6:\\\"mailer\\\";s:4:\\\"smtp\\\";}s:5:\\\"tries\\\";N;s:7:\\\"timeout\\\";N;s:13:\\\"maxExceptions\\\";N;s:17:\\\"shouldBeEncrypted\\\";b:0;s:10:\\\"connection\\\";N;s:5:\\\"queue\\\";N;s:5:\\\"delay\\\";N;s:11:\\\"afterCommit\\\";N;s:10:\\\"middleware\\\";a:0:{}s:7:\\\"chained\\\";a:0:{}s:15:\\\"chainConnection\\\";N;s:10:\\\"chainQueue\\\";N;s:19:\\\"chainCatchCallbacks\\\";N;s:3:\\\"job\\\";N;}\"},\"createdAt\":1754462229,\"delay\":null}','Symfony\\Component\\Mailer\\Exception\\TransportException: Unable to connect with STARTTLS: stream_socket_enable_crypto(): SSL: An existing connection was forcibly closed by the remote host in D:\\Small-Proj\\schedulink\\vendor\\symfony\\mailer\\Transport\\Smtp\\Stream\\SocketStream.php:171\nStack trace:\n#0 [internal function]: Symfony\\Component\\Mailer\\Transport\\Smtp\\Stream\\SocketStream->Symfony\\Component\\Mailer\\Transport\\Smtp\\Stream\\{closure}()\n#1 D:\\Small-Proj\\schedulink\\vendor\\symfony\\mailer\\Transport\\Smtp\\Stream\\SocketStream.php(174): stream_socket_enable_crypto()\n#2 D:\\Small-Proj\\schedulink\\vendor\\symfony\\mailer\\Transport\\Smtp\\EsmtpTransport.php(185): Symfony\\Component\\Mailer\\Transport\\Smtp\\Stream\\SocketStream->startTLS()\n#3 D:\\Small-Proj\\schedulink\\vendor\\symfony\\mailer\\Transport\\Smtp\\EsmtpTransport.php(150): Symfony\\Component\\Mailer\\Transport\\Smtp\\EsmtpTransport->doEhloCommand()\n#4 D:\\Small-Proj\\schedulink\\vendor\\symfony\\mailer\\Transport\\Smtp\\SmtpTransport.php(255): Symfony\\Component\\Mailer\\Transport\\Smtp\\EsmtpTransport->executeCommand()\n#5 D:\\Small-Proj\\schedulink\\vendor\\symfony\\mailer\\Transport\\Smtp\\SmtpTransport.php(281): Symfony\\Component\\Mailer\\Transport\\Smtp\\SmtpTransport->doHeloCommand()\n#6 D:\\Small-Proj\\schedulink\\vendor\\symfony\\mailer\\Transport\\Smtp\\SmtpTransport.php(211): Symfony\\Component\\Mailer\\Transport\\Smtp\\SmtpTransport->start()\n#7 D:\\Small-Proj\\schedulink\\vendor\\symfony\\mailer\\Transport\\AbstractTransport.php(69): Symfony\\Component\\Mailer\\Transport\\Smtp\\SmtpTransport->doSend()\n#8 D:\\Small-Proj\\schedulink\\vendor\\symfony\\mailer\\Transport\\Smtp\\SmtpTransport.php(138): Symfony\\Component\\Mailer\\Transport\\AbstractTransport->send()\n#9 D:\\Small-Proj\\schedulink\\vendor\\laravel\\framework\\src\\Illuminate\\Mail\\Mailer.php(584): Symfony\\Component\\Mailer\\Transport\\Smtp\\SmtpTransport->send()\n#10 D:\\Small-Proj\\schedulink\\vendor\\laravel\\framework\\src\\Illuminate\\Mail\\Mailer.php(331): Illuminate\\Mail\\Mailer->sendSymfonyMessage()\n#11 D:\\Small-Proj\\schedulink\\vendor\\laravel\\framework\\src\\Illuminate\\Mail\\Mailable.php(207): Illuminate\\Mail\\Mailer->send()\n#12 D:\\Small-Proj\\schedulink\\vendor\\laravel\\framework\\src\\Illuminate\\Support\\Traits\\Localizable.php(19): Illuminate\\Mail\\Mailable->Illuminate\\Mail\\{closure}()\n#13 D:\\Small-Proj\\schedulink\\vendor\\laravel\\framework\\src\\Illuminate\\Mail\\Mailable.php(200): Illuminate\\Mail\\Mailable->withLocale()\n#14 D:\\Small-Proj\\schedulink\\vendor\\laravel\\framework\\src\\Illuminate\\Mail\\SendQueuedMailable.php(82): Illuminate\\Mail\\Mailable->send()\n#15 D:\\Small-Proj\\schedulink\\vendor\\laravel\\framework\\src\\Illuminate\\Container\\BoundMethod.php(36): Illuminate\\Mail\\SendQueuedMailable->handle()\n#16 D:\\Small-Proj\\schedulink\\vendor\\laravel\\framework\\src\\Illuminate\\Container\\Util.php(43): Illuminate\\Container\\BoundMethod::Illuminate\\Container\\{closure}()\n#17 D:\\Small-Proj\\schedulink\\vendor\\laravel\\framework\\src\\Illuminate\\Container\\BoundMethod.php(96): Illuminate\\Container\\Util::unwrapIfClosure()\n#18 D:\\Small-Proj\\schedulink\\vendor\\laravel\\framework\\src\\Illuminate\\Container\\BoundMethod.php(35): Illuminate\\Container\\BoundMethod::callBoundMethod()\n#19 D:\\Small-Proj\\schedulink\\vendor\\laravel\\framework\\src\\Illuminate\\Container\\Container.php(780): Illuminate\\Container\\BoundMethod::call()\n#20 D:\\Small-Proj\\schedulink\\vendor\\laravel\\framework\\src\\Illuminate\\Bus\\Dispatcher.php(132): Illuminate\\Container\\Container->call()\n#21 D:\\Small-Proj\\schedulink\\vendor\\laravel\\framework\\src\\Illuminate\\Pipeline\\Pipeline.php(169): Illuminate\\Bus\\Dispatcher->Illuminate\\Bus\\{closure}()\n#22 D:\\Small-Proj\\schedulink\\vendor\\laravel\\framework\\src\\Illuminate\\Pipeline\\Pipeline.php(126): Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}()\n#23 D:\\Small-Proj\\schedulink\\vendor\\laravel\\framework\\src\\Illuminate\\Bus\\Dispatcher.php(136): Illuminate\\Pipeline\\Pipeline->then()\n#24 D:\\Small-Proj\\schedulink\\vendor\\laravel\\framework\\src\\Illuminate\\Queue\\CallQueuedHandler.php(134): Illuminate\\Bus\\Dispatcher->dispatchNow()\n#25 D:\\Small-Proj\\schedulink\\vendor\\laravel\\framework\\src\\Illuminate\\Pipeline\\Pipeline.php(169): Illuminate\\Queue\\CallQueuedHandler->Illuminate\\Queue\\{closure}()\n#26 D:\\Small-Proj\\schedulink\\vendor\\laravel\\framework\\src\\Illuminate\\Pipeline\\Pipeline.php(126): Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}()\n#27 D:\\Small-Proj\\schedulink\\vendor\\laravel\\framework\\src\\Illuminate\\Queue\\CallQueuedHandler.php(127): Illuminate\\Pipeline\\Pipeline->then()\n#28 D:\\Small-Proj\\schedulink\\vendor\\laravel\\framework\\src\\Illuminate\\Queue\\CallQueuedHandler.php(68): Illuminate\\Queue\\CallQueuedHandler->dispatchThroughMiddleware()\n#29 D:\\Small-Proj\\schedulink\\vendor\\laravel\\framework\\src\\Illuminate\\Queue\\Jobs\\Job.php(102): Illuminate\\Queue\\CallQueuedHandler->call()\n#30 D:\\Small-Proj\\schedulink\\vendor\\laravel\\framework\\src\\Illuminate\\Queue\\Worker.php(444): Illuminate\\Queue\\Jobs\\Job->fire()\n#31 D:\\Small-Proj\\schedulink\\vendor\\laravel\\framework\\src\\Illuminate\\Queue\\Worker.php(394): Illuminate\\Queue\\Worker->process()\n#32 D:\\Small-Proj\\schedulink\\vendor\\laravel\\framework\\src\\Illuminate\\Queue\\Worker.php(180): Illuminate\\Queue\\Worker->runJob()\n#33 D:\\Small-Proj\\schedulink\\vendor\\laravel\\framework\\src\\Illuminate\\Queue\\Console\\WorkCommand.php(148): Illuminate\\Queue\\Worker->daemon()\n#34 D:\\Small-Proj\\schedulink\\vendor\\laravel\\framework\\src\\Illuminate\\Queue\\Console\\WorkCommand.php(131): Illuminate\\Queue\\Console\\WorkCommand->runWorker()\n#35 D:\\Small-Proj\\schedulink\\vendor\\laravel\\framework\\src\\Illuminate\\Container\\BoundMethod.php(36): Illuminate\\Queue\\Console\\WorkCommand->handle()\n#36 D:\\Small-Proj\\schedulink\\vendor\\laravel\\framework\\src\\Illuminate\\Container\\Util.php(43): Illuminate\\Container\\BoundMethod::Illuminate\\Container\\{closure}()\n#37 D:\\Small-Proj\\schedulink\\vendor\\laravel\\framework\\src\\Illuminate\\Container\\BoundMethod.php(96): Illuminate\\Container\\Util::unwrapIfClosure()\n#38 D:\\Small-Proj\\schedulink\\vendor\\laravel\\framework\\src\\Illuminate\\Container\\BoundMethod.php(35): Illuminate\\Container\\BoundMethod::callBoundMethod()\n#39 D:\\Small-Proj\\schedulink\\vendor\\laravel\\framework\\src\\Illuminate\\Container\\Container.php(780): Illuminate\\Container\\BoundMethod::call()\n#40 D:\\Small-Proj\\schedulink\\vendor\\laravel\\framework\\src\\Illuminate\\Console\\Command.php(211): Illuminate\\Container\\Container->call()\n#41 D:\\Small-Proj\\schedulink\\vendor\\symfony\\console\\Command\\Command.php(318): Illuminate\\Console\\Command->execute()\n#42 D:\\Small-Proj\\schedulink\\vendor\\laravel\\framework\\src\\Illuminate\\Console\\Command.php(180): Symfony\\Component\\Console\\Command\\Command->run()\n#43 D:\\Small-Proj\\schedulink\\vendor\\symfony\\console\\Application.php(1092): Illuminate\\Console\\Command->run()\n#44 D:\\Small-Proj\\schedulink\\vendor\\symfony\\console\\Application.php(341): Symfony\\Component\\Console\\Application->doRunCommand()\n#45 D:\\Small-Proj\\schedulink\\vendor\\symfony\\console\\Application.php(192): Symfony\\Component\\Console\\Application->doRun()\n#46 D:\\Small-Proj\\schedulink\\vendor\\laravel\\framework\\src\\Illuminate\\Foundation\\Console\\Kernel.php(197): Symfony\\Component\\Console\\Application->run()\n#47 D:\\Small-Proj\\schedulink\\vendor\\laravel\\framework\\src\\Illuminate\\Foundation\\Application.php(1234): Illuminate\\Foundation\\Console\\Kernel->handle()\n#48 D:\\Small-Proj\\schedulink\\artisan(16): Illuminate\\Foundation\\Application->handleCommand()\n#49 {main}','2025-08-06 06:37:17'),(3,'e55baac2-562c-45d9-87b7-822d88bcfd10','database','default','{\"uuid\":\"e55baac2-562c-45d9-87b7-822d88bcfd10\",\"displayName\":\"App\\\\Mail\\\\BookingApprovedMail\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"Illuminate\\\\Mail\\\\SendQueuedMailable\",\"command\":\"O:34:\\\"Illuminate\\\\Mail\\\\SendQueuedMailable\\\":15:{s:8:\\\"mailable\\\";O:28:\\\"App\\\\Mail\\\\BookingApprovedMail\\\":4:{s:7:\\\"booking\\\";O:45:\\\"Illuminate\\\\Contracts\\\\Database\\\\ModelIdentifier\\\":5:{s:5:\\\"class\\\";s:18:\\\"App\\\\Models\\\\Booking\\\";s:2:\\\"id\\\";i:59;s:9:\\\"relations\\\";a:4:{i:0;s:12:\\\"bookedGuests\\\";i:1;s:4:\\\"user\\\";i:2;s:11:\\\"assetDetail\\\";i:3;s:9:\\\"assetType\\\";}s:10:\\\"connection\\\";s:5:\\\"mysql\\\";s:15:\\\"collectionClass\\\";N;}s:13:\\\"recipientType\\\";s:9:\\\"requester\\\";s:2:\\\"to\\\";a:1:{i:0;a:2:{s:4:\\\"name\\\";N;s:7:\\\"address\\\";s:28:\\\"christian.delapos6@gmail.com\\\";}}s:6:\\\"mailer\\\";s:4:\\\"smtp\\\";}s:5:\\\"tries\\\";N;s:7:\\\"timeout\\\";N;s:13:\\\"maxExceptions\\\";N;s:17:\\\"shouldBeEncrypted\\\";b:0;s:10:\\\"connection\\\";N;s:5:\\\"queue\\\";N;s:5:\\\"delay\\\";N;s:11:\\\"afterCommit\\\";N;s:10:\\\"middleware\\\";a:0:{}s:7:\\\"chained\\\";a:0:{}s:15:\\\"chainConnection\\\";N;s:10:\\\"chainQueue\\\";N;s:19:\\\"chainCatchCallbacks\\\";N;s:3:\\\"job\\\";N;}\"},\"createdAt\":1754465422,\"delay\":null}','ErrorException: Undefined variable $recipientType in D:\\Small-Proj\\schedulink\\storage\\framework\\views\\1ef10548e502b6cb9821f5e9ce10dd73.php:12\nStack trace:\n#0 D:\\Small-Proj\\schedulink\\vendor\\laravel\\framework\\src\\Illuminate\\Foundation\\Bootstrap\\HandleExceptions.php(256): Illuminate\\Foundation\\Bootstrap\\HandleExceptions->handleError()\n#1 D:\\Small-Proj\\schedulink\\storage\\framework\\views\\1ef10548e502b6cb9821f5e9ce10dd73.php(12): Illuminate\\Foundation\\Bootstrap\\HandleExceptions->Illuminate\\Foundation\\Bootstrap\\{closure}()\n#2 D:\\Small-Proj\\schedulink\\vendor\\laravel\\framework\\src\\Illuminate\\Filesystem\\Filesystem.php(123): require(\'...\')\n#3 D:\\Small-Proj\\schedulink\\vendor\\laravel\\framework\\src\\Illuminate\\Filesystem\\Filesystem.php(124): Illuminate\\Filesystem\\Filesystem::Illuminate\\Filesystem\\{closure}()\n#4 D:\\Small-Proj\\schedulink\\vendor\\laravel\\framework\\src\\Illuminate\\View\\Engines\\PhpEngine.php(57): Illuminate\\Filesystem\\Filesystem->getRequire()\n#5 D:\\Small-Proj\\schedulink\\vendor\\livewire\\livewire\\src\\Mechanisms\\ExtendBlade\\ExtendedCompilerEngine.php(22): Illuminate\\View\\Engines\\PhpEngine->evaluatePath()\n#6 D:\\Small-Proj\\schedulink\\vendor\\laravel\\framework\\src\\Illuminate\\View\\Engines\\CompilerEngine.php(88): Livewire\\Mechanisms\\ExtendBlade\\ExtendedCompilerEngine->evaluatePath()\n#7 D:\\Small-Proj\\schedulink\\vendor\\livewire\\livewire\\src\\Mechanisms\\ExtendBlade\\ExtendedCompilerEngine.php(10): Illuminate\\View\\Engines\\CompilerEngine->get()\n#8 D:\\Small-Proj\\schedulink\\vendor\\laravel\\framework\\src\\Illuminate\\View\\View.php(208): Livewire\\Mechanisms\\ExtendBlade\\ExtendedCompilerEngine->get()\n#9 D:\\Small-Proj\\schedulink\\vendor\\laravel\\framework\\src\\Illuminate\\View\\View.php(191): Illuminate\\View\\View->getContents()\n#10 D:\\Small-Proj\\schedulink\\vendor\\laravel\\framework\\src\\Illuminate\\View\\View.php(160): Illuminate\\View\\View->renderContents()\n#11 D:\\Small-Proj\\schedulink\\vendor\\laravel\\framework\\src\\Illuminate\\Mail\\Mailer.php(444): Illuminate\\View\\View->render()\n#12 D:\\Small-Proj\\schedulink\\vendor\\laravel\\framework\\src\\Illuminate\\Mail\\Mailer.php(419): Illuminate\\Mail\\Mailer->renderView()\n#13 D:\\Small-Proj\\schedulink\\vendor\\laravel\\framework\\src\\Illuminate\\Mail\\Mailer.php(312): Illuminate\\Mail\\Mailer->addContent()\n#14 D:\\Small-Proj\\schedulink\\vendor\\laravel\\framework\\src\\Illuminate\\Mail\\Mailable.php(207): Illuminate\\Mail\\Mailer->send()\n#15 D:\\Small-Proj\\schedulink\\vendor\\laravel\\framework\\src\\Illuminate\\Support\\Traits\\Localizable.php(19): Illuminate\\Mail\\Mailable->Illuminate\\Mail\\{closure}()\n#16 D:\\Small-Proj\\schedulink\\vendor\\laravel\\framework\\src\\Illuminate\\Mail\\Mailable.php(200): Illuminate\\Mail\\Mailable->withLocale()\n#17 D:\\Small-Proj\\schedulink\\vendor\\laravel\\framework\\src\\Illuminate\\Mail\\SendQueuedMailable.php(82): Illuminate\\Mail\\Mailable->send()\n#18 D:\\Small-Proj\\schedulink\\vendor\\laravel\\framework\\src\\Illuminate\\Container\\BoundMethod.php(36): Illuminate\\Mail\\SendQueuedMailable->handle()\n#19 D:\\Small-Proj\\schedulink\\vendor\\laravel\\framework\\src\\Illuminate\\Container\\Util.php(43): Illuminate\\Container\\BoundMethod::Illuminate\\Container\\{closure}()\n#20 D:\\Small-Proj\\schedulink\\vendor\\laravel\\framework\\src\\Illuminate\\Container\\BoundMethod.php(96): Illuminate\\Container\\Util::unwrapIfClosure()\n#21 D:\\Small-Proj\\schedulink\\vendor\\laravel\\framework\\src\\Illuminate\\Container\\BoundMethod.php(35): Illuminate\\Container\\BoundMethod::callBoundMethod()\n#22 D:\\Small-Proj\\schedulink\\vendor\\laravel\\framework\\src\\Illuminate\\Container\\Container.php(780): Illuminate\\Container\\BoundMethod::call()\n#23 D:\\Small-Proj\\schedulink\\vendor\\laravel\\framework\\src\\Illuminate\\Bus\\Dispatcher.php(132): Illuminate\\Container\\Container->call()\n#24 D:\\Small-Proj\\schedulink\\vendor\\laravel\\framework\\src\\Illuminate\\Pipeline\\Pipeline.php(169): Illuminate\\Bus\\Dispatcher->Illuminate\\Bus\\{closure}()\n#25 D:\\Small-Proj\\schedulink\\vendor\\laravel\\framework\\src\\Illuminate\\Pipeline\\Pipeline.php(126): Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}()\n#26 D:\\Small-Proj\\schedulink\\vendor\\laravel\\framework\\src\\Illuminate\\Bus\\Dispatcher.php(136): Illuminate\\Pipeline\\Pipeline->then()\n#27 D:\\Small-Proj\\schedulink\\vendor\\laravel\\framework\\src\\Illuminate\\Queue\\CallQueuedHandler.php(134): Illuminate\\Bus\\Dispatcher->dispatchNow()\n#28 D:\\Small-Proj\\schedulink\\vendor\\laravel\\framework\\src\\Illuminate\\Pipeline\\Pipeline.php(169): Illuminate\\Queue\\CallQueuedHandler->Illuminate\\Queue\\{closure}()\n#29 D:\\Small-Proj\\schedulink\\vendor\\laravel\\framework\\src\\Illuminate\\Pipeline\\Pipeline.php(126): Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}()\n#30 D:\\Small-Proj\\schedulink\\vendor\\laravel\\framework\\src\\Illuminate\\Queue\\CallQueuedHandler.php(127): Illuminate\\Pipeline\\Pipeline->then()\n#31 D:\\Small-Proj\\schedulink\\vendor\\laravel\\framework\\src\\Illuminate\\Queue\\CallQueuedHandler.php(68): Illuminate\\Queue\\CallQueuedHandler->dispatchThroughMiddleware()\n#32 D:\\Small-Proj\\schedulink\\vendor\\laravel\\framework\\src\\Illuminate\\Queue\\Jobs\\Job.php(102): Illuminate\\Queue\\CallQueuedHandler->call()\n#33 D:\\Small-Proj\\schedulink\\vendor\\laravel\\framework\\src\\Illuminate\\Queue\\Worker.php(444): Illuminate\\Queue\\Jobs\\Job->fire()\n#34 D:\\Small-Proj\\schedulink\\vendor\\laravel\\framework\\src\\Illuminate\\Queue\\Worker.php(394): Illuminate\\Queue\\Worker->process()\n#35 D:\\Small-Proj\\schedulink\\vendor\\laravel\\framework\\src\\Illuminate\\Queue\\Worker.php(180): Illuminate\\Queue\\Worker->runJob()\n#36 D:\\Small-Proj\\schedulink\\vendor\\laravel\\framework\\src\\Illuminate\\Queue\\Console\\WorkCommand.php(148): Illuminate\\Queue\\Worker->daemon()\n#37 D:\\Small-Proj\\schedulink\\vendor\\laravel\\framework\\src\\Illuminate\\Queue\\Console\\WorkCommand.php(131): Illuminate\\Queue\\Console\\WorkCommand->runWorker()\n#38 D:\\Small-Proj\\schedulink\\vendor\\laravel\\framework\\src\\Illuminate\\Container\\BoundMethod.php(36): Illuminate\\Queue\\Console\\WorkCommand->handle()\n#39 D:\\Small-Proj\\schedulink\\vendor\\laravel\\framework\\src\\Illuminate\\Container\\Util.php(43): Illuminate\\Container\\BoundMethod::Illuminate\\Container\\{closure}()\n#40 D:\\Small-Proj\\schedulink\\vendor\\laravel\\framework\\src\\Illuminate\\Container\\BoundMethod.php(96): Illuminate\\Container\\Util::unwrapIfClosure()\n#41 D:\\Small-Proj\\schedulink\\vendor\\laravel\\framework\\src\\Illuminate\\Container\\BoundMethod.php(35): Illuminate\\Container\\BoundMethod::callBoundMethod()\n#42 D:\\Small-Proj\\schedulink\\vendor\\laravel\\framework\\src\\Illuminate\\Container\\Container.php(780): Illuminate\\Container\\BoundMethod::call()\n#43 D:\\Small-Proj\\schedulink\\vendor\\laravel\\framework\\src\\Illuminate\\Console\\Command.php(211): Illuminate\\Container\\Container->call()\n#44 D:\\Small-Proj\\schedulink\\vendor\\symfony\\console\\Command\\Command.php(318): Illuminate\\Console\\Command->execute()\n#45 D:\\Small-Proj\\schedulink\\vendor\\laravel\\framework\\src\\Illuminate\\Console\\Command.php(180): Symfony\\Component\\Console\\Command\\Command->run()\n#46 D:\\Small-Proj\\schedulink\\vendor\\symfony\\console\\Application.php(1092): Illuminate\\Console\\Command->run()\n#47 D:\\Small-Proj\\schedulink\\vendor\\symfony\\console\\Application.php(341): Symfony\\Component\\Console\\Application->doRunCommand()\n#48 D:\\Small-Proj\\schedulink\\vendor\\symfony\\console\\Application.php(192): Symfony\\Component\\Console\\Application->doRun()\n#49 D:\\Small-Proj\\schedulink\\vendor\\laravel\\framework\\src\\Illuminate\\Foundation\\Console\\Kernel.php(197): Symfony\\Component\\Console\\Application->run()\n#50 D:\\Small-Proj\\schedulink\\vendor\\laravel\\framework\\src\\Illuminate\\Foundation\\Application.php(1234): Illuminate\\Foundation\\Console\\Kernel->handle()\n#51 D:\\Small-Proj\\schedulink\\artisan(16): Illuminate\\Foundation\\Application->handleCommand()\n#52 {main}\n\nNext Illuminate\\View\\ViewException: Undefined variable $recipientType (View: D:\\Small-Proj\\schedulink\\resources\\views\\emails\\booking-approved.blade.php) in D:\\Small-Proj\\schedulink\\storage\\framework\\views\\1ef10548e502b6cb9821f5e9ce10dd73.php:12\nStack trace:\n#0 D:\\Small-Proj\\schedulink\\vendor\\livewire\\livewire\\src\\Mechanisms\\ExtendBlade\\ExtendedCompilerEngine.php(58): Illuminate\\View\\Engines\\CompilerEngine->handleViewException()\n#1 D:\\Small-Proj\\schedulink\\vendor\\laravel\\framework\\src\\Illuminate\\View\\Engines\\PhpEngine.php(59): Livewire\\Mechanisms\\ExtendBlade\\ExtendedCompilerEngine->handleViewException()\n#2 D:\\Small-Proj\\schedulink\\vendor\\livewire\\livewire\\src\\Mechanisms\\ExtendBlade\\ExtendedCompilerEngine.php(22): Illuminate\\View\\Engines\\PhpEngine->evaluatePath()\n#3 D:\\Small-Proj\\schedulink\\vendor\\laravel\\framework\\src\\Illuminate\\View\\Engines\\CompilerEngine.php(88): Livewire\\Mechanisms\\ExtendBlade\\ExtendedCompilerEngine->evaluatePath()\n#4 D:\\Small-Proj\\schedulink\\vendor\\livewire\\livewire\\src\\Mechanisms\\ExtendBlade\\ExtendedCompilerEngine.php(10): Illuminate\\View\\Engines\\CompilerEngine->get()\n#5 D:\\Small-Proj\\schedulink\\vendor\\laravel\\framework\\src\\Illuminate\\View\\View.php(208): Livewire\\Mechanisms\\ExtendBlade\\ExtendedCompilerEngine->get()\n#6 D:\\Small-Proj\\schedulink\\vendor\\laravel\\framework\\src\\Illuminate\\View\\View.php(191): Illuminate\\View\\View->getContents()\n#7 D:\\Small-Proj\\schedulink\\vendor\\laravel\\framework\\src\\Illuminate\\View\\View.php(160): Illuminate\\View\\View->renderContents()\n#8 D:\\Small-Proj\\schedulink\\vendor\\laravel\\framework\\src\\Illuminate\\Mail\\Mailer.php(444): Illuminate\\View\\View->render()\n#9 D:\\Small-Proj\\schedulink\\vendor\\laravel\\framework\\src\\Illuminate\\Mail\\Mailer.php(419): Illuminate\\Mail\\Mailer->renderView()\n#10 D:\\Small-Proj\\schedulink\\vendor\\laravel\\framework\\src\\Illuminate\\Mail\\Mailer.php(312): Illuminate\\Mail\\Mailer->addContent()\n#11 D:\\Small-Proj\\schedulink\\vendor\\laravel\\framework\\src\\Illuminate\\Mail\\Mailable.php(207): Illuminate\\Mail\\Mailer->send()\n#12 D:\\Small-Proj\\schedulink\\vendor\\laravel\\framework\\src\\Illuminate\\Support\\Traits\\Localizable.php(19): Illuminate\\Mail\\Mailable->Illuminate\\Mail\\{closure}()\n#13 D:\\Small-Proj\\schedulink\\vendor\\laravel\\framework\\src\\Illuminate\\Mail\\Mailable.php(200): Illuminate\\Mail\\Mailable->withLocale()\n#14 D:\\Small-Proj\\schedulink\\vendor\\laravel\\framework\\src\\Illuminate\\Mail\\SendQueuedMailable.php(82): Illuminate\\Mail\\Mailable->send()\n#15 D:\\Small-Proj\\schedulink\\vendor\\laravel\\framework\\src\\Illuminate\\Container\\BoundMethod.php(36): Illuminate\\Mail\\SendQueuedMailable->handle()\n#16 D:\\Small-Proj\\schedulink\\vendor\\laravel\\framework\\src\\Illuminate\\Container\\Util.php(43): Illuminate\\Container\\BoundMethod::Illuminate\\Container\\{closure}()\n#17 D:\\Small-Proj\\schedulink\\vendor\\laravel\\framework\\src\\Illuminate\\Container\\BoundMethod.php(96): Illuminate\\Container\\Util::unwrapIfClosure()\n#18 D:\\Small-Proj\\schedulink\\vendor\\laravel\\framework\\src\\Illuminate\\Container\\BoundMethod.php(35): Illuminate\\Container\\BoundMethod::callBoundMethod()\n#19 D:\\Small-Proj\\schedulink\\vendor\\laravel\\framework\\src\\Illuminate\\Container\\Container.php(780): Illuminate\\Container\\BoundMethod::call()\n#20 D:\\Small-Proj\\schedulink\\vendor\\laravel\\framework\\src\\Illuminate\\Bus\\Dispatcher.php(132): Illuminate\\Container\\Container->call()\n#21 D:\\Small-Proj\\schedulink\\vendor\\laravel\\framework\\src\\Illuminate\\Pipeline\\Pipeline.php(169): Illuminate\\Bus\\Dispatcher->Illuminate\\Bus\\{closure}()\n#22 D:\\Small-Proj\\schedulink\\vendor\\laravel\\framework\\src\\Illuminate\\Pipeline\\Pipeline.php(126): Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}()\n#23 D:\\Small-Proj\\schedulink\\vendor\\laravel\\framework\\src\\Illuminate\\Bus\\Dispatcher.php(136): Illuminate\\Pipeline\\Pipeline->then()\n#24 D:\\Small-Proj\\schedulink\\vendor\\laravel\\framework\\src\\Illuminate\\Queue\\CallQueuedHandler.php(134): Illuminate\\Bus\\Dispatcher->dispatchNow()\n#25 D:\\Small-Proj\\schedulink\\vendor\\laravel\\framework\\src\\Illuminate\\Pipeline\\Pipeline.php(169): Illuminate\\Queue\\CallQueuedHandler->Illuminate\\Queue\\{closure}()\n#26 D:\\Small-Proj\\schedulink\\vendor\\laravel\\framework\\src\\Illuminate\\Pipeline\\Pipeline.php(126): Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}()\n#27 D:\\Small-Proj\\schedulink\\vendor\\laravel\\framework\\src\\Illuminate\\Queue\\CallQueuedHandler.php(127): Illuminate\\Pipeline\\Pipeline->then()\n#28 D:\\Small-Proj\\schedulink\\vendor\\laravel\\framework\\src\\Illuminate\\Queue\\CallQueuedHandler.php(68): Illuminate\\Queue\\CallQueuedHandler->dispatchThroughMiddleware()\n#29 D:\\Small-Proj\\schedulink\\vendor\\laravel\\framework\\src\\Illuminate\\Queue\\Jobs\\Job.php(102): Illuminate\\Queue\\CallQueuedHandler->call()\n#30 D:\\Small-Proj\\schedulink\\vendor\\laravel\\framework\\src\\Illuminate\\Queue\\Worker.php(444): Illuminate\\Queue\\Jobs\\Job->fire()\n#31 D:\\Small-Proj\\schedulink\\vendor\\laravel\\framework\\src\\Illuminate\\Queue\\Worker.php(394): Illuminate\\Queue\\Worker->process()\n#32 D:\\Small-Proj\\schedulink\\vendor\\laravel\\framework\\src\\Illuminate\\Queue\\Worker.php(180): Illuminate\\Queue\\Worker->runJob()\n#33 D:\\Small-Proj\\schedulink\\vendor\\laravel\\framework\\src\\Illuminate\\Queue\\Console\\WorkCommand.php(148): Illuminate\\Queue\\Worker->daemon()\n#34 D:\\Small-Proj\\schedulink\\vendor\\laravel\\framework\\src\\Illuminate\\Queue\\Console\\WorkCommand.php(131): Illuminate\\Queue\\Console\\WorkCommand->runWorker()\n#35 D:\\Small-Proj\\schedulink\\vendor\\laravel\\framework\\src\\Illuminate\\Container\\BoundMethod.php(36): Illuminate\\Queue\\Console\\WorkCommand->handle()\n#36 D:\\Small-Proj\\schedulink\\vendor\\laravel\\framework\\src\\Illuminate\\Container\\Util.php(43): Illuminate\\Container\\BoundMethod::Illuminate\\Container\\{closure}()\n#37 D:\\Small-Proj\\schedulink\\vendor\\laravel\\framework\\src\\Illuminate\\Container\\BoundMethod.php(96): Illuminate\\Container\\Util::unwrapIfClosure()\n#38 D:\\Small-Proj\\schedulink\\vendor\\laravel\\framework\\src\\Illuminate\\Container\\BoundMethod.php(35): Illuminate\\Container\\BoundMethod::callBoundMethod()\n#39 D:\\Small-Proj\\schedulink\\vendor\\laravel\\framework\\src\\Illuminate\\Container\\Container.php(780): Illuminate\\Container\\BoundMethod::call()\n#40 D:\\Small-Proj\\schedulink\\vendor\\laravel\\framework\\src\\Illuminate\\Console\\Command.php(211): Illuminate\\Container\\Container->call()\n#41 D:\\Small-Proj\\schedulink\\vendor\\symfony\\console\\Command\\Command.php(318): Illuminate\\Console\\Command->execute()\n#42 D:\\Small-Proj\\schedulink\\vendor\\laravel\\framework\\src\\Illuminate\\Console\\Command.php(180): Symfony\\Component\\Console\\Command\\Command->run()\n#43 D:\\Small-Proj\\schedulink\\vendor\\symfony\\console\\Application.php(1092): Illuminate\\Console\\Command->run()\n#44 D:\\Small-Proj\\schedulink\\vendor\\symfony\\console\\Application.php(341): Symfony\\Component\\Console\\Application->doRunCommand()\n#45 D:\\Small-Proj\\schedulink\\vendor\\symfony\\console\\Application.php(192): Symfony\\Component\\Console\\Application->doRun()\n#46 D:\\Small-Proj\\schedulink\\vendor\\laravel\\framework\\src\\Illuminate\\Foundation\\Console\\Kernel.php(197): Symfony\\Component\\Console\\Application->run()\n#47 D:\\Small-Proj\\schedulink\\vendor\\laravel\\framework\\src\\Illuminate\\Foundation\\Application.php(1234): Illuminate\\Foundation\\Console\\Kernel->handle()\n#48 D:\\Small-Proj\\schedulink\\artisan(16): Illuminate\\Foundation\\Application->handleCommand()\n#49 {main}','2025-08-06 07:30:24'),(4,'68c7969d-360b-4686-91ee-2b252f6be482','database','default','{\"uuid\":\"68c7969d-360b-4686-91ee-2b252f6be482\",\"displayName\":\"App\\\\Mail\\\\BookingApprovedMail\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"Illuminate\\\\Mail\\\\SendQueuedMailable\",\"command\":\"O:34:\\\"Illuminate\\\\Mail\\\\SendQueuedMailable\\\":15:{s:8:\\\"mailable\\\";O:28:\\\"App\\\\Mail\\\\BookingApprovedMail\\\":5:{s:7:\\\"booking\\\";O:45:\\\"Illuminate\\\\Contracts\\\\Database\\\\ModelIdentifier\\\":5:{s:5:\\\"class\\\";s:18:\\\"App\\\\Models\\\\Booking\\\";s:2:\\\"id\\\";i:59;s:9:\\\"relations\\\";a:4:{i:0;s:12:\\\"bookedGuests\\\";i:1;s:4:\\\"user\\\";i:2;s:11:\\\"assetDetail\\\";i:3;s:9:\\\"assetType\\\";}s:10:\\\"connection\\\";s:5:\\\"mysql\\\";s:15:\\\"collectionClass\\\";N;}s:13:\\\"recipientType\\\";s:5:\\\"guest\\\";s:10:\\\"guestEmail\\\";s:24:\\\"sawaljiahmae24@gmail.com\\\";s:2:\\\"to\\\";a:1:{i:0;a:2:{s:4:\\\"name\\\";N;s:7:\\\"address\\\";s:24:\\\"sawaljiahmae24@gmail.com\\\";}}s:6:\\\"mailer\\\";s:4:\\\"smtp\\\";}s:5:\\\"tries\\\";N;s:7:\\\"timeout\\\";N;s:13:\\\"maxExceptions\\\";N;s:17:\\\"shouldBeEncrypted\\\";b:0;s:10:\\\"connection\\\";N;s:5:\\\"queue\\\";N;s:5:\\\"delay\\\";N;s:11:\\\"afterCommit\\\";N;s:10:\\\"middleware\\\";a:0:{}s:7:\\\"chained\\\";a:0:{}s:15:\\\"chainConnection\\\";N;s:10:\\\"chainQueue\\\";N;s:19:\\\"chainCatchCallbacks\\\";N;s:3:\\\"job\\\";N;}\"},\"createdAt\":1754465422,\"delay\":null}','ErrorException: Undefined variable $recipientType in D:\\Small-Proj\\schedulink\\storage\\framework\\views\\1ef10548e502b6cb9821f5e9ce10dd73.php:12\nStack trace:\n#0 D:\\Small-Proj\\schedulink\\vendor\\laravel\\framework\\src\\Illuminate\\Foundation\\Bootstrap\\HandleExceptions.php(256): Illuminate\\Foundation\\Bootstrap\\HandleExceptions->handleError()\n#1 D:\\Small-Proj\\schedulink\\storage\\framework\\views\\1ef10548e502b6cb9821f5e9ce10dd73.php(12): Illuminate\\Foundation\\Bootstrap\\HandleExceptions->Illuminate\\Foundation\\Bootstrap\\{closure}()\n#2 D:\\Small-Proj\\schedulink\\vendor\\laravel\\framework\\src\\Illuminate\\Filesystem\\Filesystem.php(123): require(\'...\')\n#3 D:\\Small-Proj\\schedulink\\vendor\\laravel\\framework\\src\\Illuminate\\Filesystem\\Filesystem.php(124): Illuminate\\Filesystem\\Filesystem::Illuminate\\Filesystem\\{closure}()\n#4 D:\\Small-Proj\\schedulink\\vendor\\laravel\\framework\\src\\Illuminate\\View\\Engines\\PhpEngine.php(57): Illuminate\\Filesystem\\Filesystem->getRequire()\n#5 D:\\Small-Proj\\schedulink\\vendor\\livewire\\livewire\\src\\Mechanisms\\ExtendBlade\\ExtendedCompilerEngine.php(22): Illuminate\\View\\Engines\\PhpEngine->evaluatePath()\n#6 D:\\Small-Proj\\schedulink\\vendor\\laravel\\framework\\src\\Illuminate\\View\\Engines\\CompilerEngine.php(76): Livewire\\Mechanisms\\ExtendBlade\\ExtendedCompilerEngine->evaluatePath()\n#7 D:\\Small-Proj\\schedulink\\vendor\\livewire\\livewire\\src\\Mechanisms\\ExtendBlade\\ExtendedCompilerEngine.php(10): Illuminate\\View\\Engines\\CompilerEngine->get()\n#8 D:\\Small-Proj\\schedulink\\vendor\\laravel\\framework\\src\\Illuminate\\View\\View.php(208): Livewire\\Mechanisms\\ExtendBlade\\ExtendedCompilerEngine->get()\n#9 D:\\Small-Proj\\schedulink\\vendor\\laravel\\framework\\src\\Illuminate\\View\\View.php(191): Illuminate\\View\\View->getContents()\n#10 D:\\Small-Proj\\schedulink\\vendor\\laravel\\framework\\src\\Illuminate\\View\\View.php(160): Illuminate\\View\\View->renderContents()\n#11 D:\\Small-Proj\\schedulink\\vendor\\laravel\\framework\\src\\Illuminate\\Mail\\Mailer.php(444): Illuminate\\View\\View->render()\n#12 D:\\Small-Proj\\schedulink\\vendor\\laravel\\framework\\src\\Illuminate\\Mail\\Mailer.php(419): Illuminate\\Mail\\Mailer->renderView()\n#13 D:\\Small-Proj\\schedulink\\vendor\\laravel\\framework\\src\\Illuminate\\Mail\\Mailer.php(312): Illuminate\\Mail\\Mailer->addContent()\n#14 D:\\Small-Proj\\schedulink\\vendor\\laravel\\framework\\src\\Illuminate\\Mail\\Mailable.php(207): Illuminate\\Mail\\Mailer->send()\n#15 D:\\Small-Proj\\schedulink\\vendor\\laravel\\framework\\src\\Illuminate\\Support\\Traits\\Localizable.php(19): Illuminate\\Mail\\Mailable->Illuminate\\Mail\\{closure}()\n#16 D:\\Small-Proj\\schedulink\\vendor\\laravel\\framework\\src\\Illuminate\\Mail\\Mailable.php(200): Illuminate\\Mail\\Mailable->withLocale()\n#17 D:\\Small-Proj\\schedulink\\vendor\\laravel\\framework\\src\\Illuminate\\Mail\\SendQueuedMailable.php(82): Illuminate\\Mail\\Mailable->send()\n#18 D:\\Small-Proj\\schedulink\\vendor\\laravel\\framework\\src\\Illuminate\\Container\\BoundMethod.php(36): Illuminate\\Mail\\SendQueuedMailable->handle()\n#19 D:\\Small-Proj\\schedulink\\vendor\\laravel\\framework\\src\\Illuminate\\Container\\Util.php(43): Illuminate\\Container\\BoundMethod::Illuminate\\Container\\{closure}()\n#20 D:\\Small-Proj\\schedulink\\vendor\\laravel\\framework\\src\\Illuminate\\Container\\BoundMethod.php(96): Illuminate\\Container\\Util::unwrapIfClosure()\n#21 D:\\Small-Proj\\schedulink\\vendor\\laravel\\framework\\src\\Illuminate\\Container\\BoundMethod.php(35): Illuminate\\Container\\BoundMethod::callBoundMethod()\n#22 D:\\Small-Proj\\schedulink\\vendor\\laravel\\framework\\src\\Illuminate\\Container\\Container.php(780): Illuminate\\Container\\BoundMethod::call()\n#23 D:\\Small-Proj\\schedulink\\vendor\\laravel\\framework\\src\\Illuminate\\Bus\\Dispatcher.php(132): Illuminate\\Container\\Container->call()\n#24 D:\\Small-Proj\\schedulink\\vendor\\laravel\\framework\\src\\Illuminate\\Pipeline\\Pipeline.php(169): Illuminate\\Bus\\Dispatcher->Illuminate\\Bus\\{closure}()\n#25 D:\\Small-Proj\\schedulink\\vendor\\laravel\\framework\\src\\Illuminate\\Pipeline\\Pipeline.php(126): Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}()\n#26 D:\\Small-Proj\\schedulink\\vendor\\laravel\\framework\\src\\Illuminate\\Bus\\Dispatcher.php(136): Illuminate\\Pipeline\\Pipeline->then()\n#27 D:\\Small-Proj\\schedulink\\vendor\\laravel\\framework\\src\\Illuminate\\Queue\\CallQueuedHandler.php(134): Illuminate\\Bus\\Dispatcher->dispatchNow()\n#28 D:\\Small-Proj\\schedulink\\vendor\\laravel\\framework\\src\\Illuminate\\Pipeline\\Pipeline.php(169): Illuminate\\Queue\\CallQueuedHandler->Illuminate\\Queue\\{closure}()\n#29 D:\\Small-Proj\\schedulink\\vendor\\laravel\\framework\\src\\Illuminate\\Pipeline\\Pipeline.php(126): Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}()\n#30 D:\\Small-Proj\\schedulink\\vendor\\laravel\\framework\\src\\Illuminate\\Queue\\CallQueuedHandler.php(127): Illuminate\\Pipeline\\Pipeline->then()\n#31 D:\\Small-Proj\\schedulink\\vendor\\laravel\\framework\\src\\Illuminate\\Queue\\CallQueuedHandler.php(68): Illuminate\\Queue\\CallQueuedHandler->dispatchThroughMiddleware()\n#32 D:\\Small-Proj\\schedulink\\vendor\\laravel\\framework\\src\\Illuminate\\Queue\\Jobs\\Job.php(102): Illuminate\\Queue\\CallQueuedHandler->call()\n#33 D:\\Small-Proj\\schedulink\\vendor\\laravel\\framework\\src\\Illuminate\\Queue\\Worker.php(444): Illuminate\\Queue\\Jobs\\Job->fire()\n#34 D:\\Small-Proj\\schedulink\\vendor\\laravel\\framework\\src\\Illuminate\\Queue\\Worker.php(394): Illuminate\\Queue\\Worker->process()\n#35 D:\\Small-Proj\\schedulink\\vendor\\laravel\\framework\\src\\Illuminate\\Queue\\Worker.php(180): Illuminate\\Queue\\Worker->runJob()\n#36 D:\\Small-Proj\\schedulink\\vendor\\laravel\\framework\\src\\Illuminate\\Queue\\Console\\WorkCommand.php(148): Illuminate\\Queue\\Worker->daemon()\n#37 D:\\Small-Proj\\schedulink\\vendor\\laravel\\framework\\src\\Illuminate\\Queue\\Console\\WorkCommand.php(131): Illuminate\\Queue\\Console\\WorkCommand->runWorker()\n#38 D:\\Small-Proj\\schedulink\\vendor\\laravel\\framework\\src\\Illuminate\\Container\\BoundMethod.php(36): Illuminate\\Queue\\Console\\WorkCommand->handle()\n#39 D:\\Small-Proj\\schedulink\\vendor\\laravel\\framework\\src\\Illuminate\\Container\\Util.php(43): Illuminate\\Container\\BoundMethod::Illuminate\\Container\\{closure}()\n#40 D:\\Small-Proj\\schedulink\\vendor\\laravel\\framework\\src\\Illuminate\\Container\\BoundMethod.php(96): Illuminate\\Container\\Util::unwrapIfClosure()\n#41 D:\\Small-Proj\\schedulink\\vendor\\laravel\\framework\\src\\Illuminate\\Container\\BoundMethod.php(35): Illuminate\\Container\\BoundMethod::callBoundMethod()\n#42 D:\\Small-Proj\\schedulink\\vendor\\laravel\\framework\\src\\Illuminate\\Container\\Container.php(780): Illuminate\\Container\\BoundMethod::call()\n#43 D:\\Small-Proj\\schedulink\\vendor\\laravel\\framework\\src\\Illuminate\\Console\\Command.php(211): Illuminate\\Container\\Container->call()\n#44 D:\\Small-Proj\\schedulink\\vendor\\symfony\\console\\Command\\Command.php(318): Illuminate\\Console\\Command->execute()\n#45 D:\\Small-Proj\\schedulink\\vendor\\laravel\\framework\\src\\Illuminate\\Console\\Command.php(180): Symfony\\Component\\Console\\Command\\Command->run()\n#46 D:\\Small-Proj\\schedulink\\vendor\\symfony\\console\\Application.php(1092): Illuminate\\Console\\Command->run()\n#47 D:\\Small-Proj\\schedulink\\vendor\\symfony\\console\\Application.php(341): Symfony\\Component\\Console\\Application->doRunCommand()\n#48 D:\\Small-Proj\\schedulink\\vendor\\symfony\\console\\Application.php(192): Symfony\\Component\\Console\\Application->doRun()\n#49 D:\\Small-Proj\\schedulink\\vendor\\laravel\\framework\\src\\Illuminate\\Foundation\\Console\\Kernel.php(197): Symfony\\Component\\Console\\Application->run()\n#50 D:\\Small-Proj\\schedulink\\vendor\\laravel\\framework\\src\\Illuminate\\Foundation\\Application.php(1234): Illuminate\\Foundation\\Console\\Kernel->handle()\n#51 D:\\Small-Proj\\schedulink\\artisan(16): Illuminate\\Foundation\\Application->handleCommand()\n#52 {main}\n\nNext Illuminate\\View\\ViewException: Undefined variable $recipientType (View: D:\\Small-Proj\\schedulink\\resources\\views\\emails\\booking-approved.blade.php) in D:\\Small-Proj\\schedulink\\storage\\framework\\views\\1ef10548e502b6cb9821f5e9ce10dd73.php:12\nStack trace:\n#0 D:\\Small-Proj\\schedulink\\vendor\\livewire\\livewire\\src\\Mechanisms\\ExtendBlade\\ExtendedCompilerEngine.php(58): Illuminate\\View\\Engines\\CompilerEngine->handleViewException()\n#1 D:\\Small-Proj\\schedulink\\vendor\\laravel\\framework\\src\\Illuminate\\View\\Engines\\PhpEngine.php(59): Livewire\\Mechanisms\\ExtendBlade\\ExtendedCompilerEngine->handleViewException()\n#2 D:\\Small-Proj\\schedulink\\vendor\\livewire\\livewire\\src\\Mechanisms\\ExtendBlade\\ExtendedCompilerEngine.php(22): Illuminate\\View\\Engines\\PhpEngine->evaluatePath()\n#3 D:\\Small-Proj\\schedulink\\vendor\\laravel\\framework\\src\\Illuminate\\View\\Engines\\CompilerEngine.php(76): Livewire\\Mechanisms\\ExtendBlade\\ExtendedCompilerEngine->evaluatePath()\n#4 D:\\Small-Proj\\schedulink\\vendor\\livewire\\livewire\\src\\Mechanisms\\ExtendBlade\\ExtendedCompilerEngine.php(10): Illuminate\\View\\Engines\\CompilerEngine->get()\n#5 D:\\Small-Proj\\schedulink\\vendor\\laravel\\framework\\src\\Illuminate\\View\\View.php(208): Livewire\\Mechanisms\\ExtendBlade\\ExtendedCompilerEngine->get()\n#6 D:\\Small-Proj\\schedulink\\vendor\\laravel\\framework\\src\\Illuminate\\View\\View.php(191): Illuminate\\View\\View->getContents()\n#7 D:\\Small-Proj\\schedulink\\vendor\\laravel\\framework\\src\\Illuminate\\View\\View.php(160): Illuminate\\View\\View->renderContents()\n#8 D:\\Small-Proj\\schedulink\\vendor\\laravel\\framework\\src\\Illuminate\\Mail\\Mailer.php(444): Illuminate\\View\\View->render()\n#9 D:\\Small-Proj\\schedulink\\vendor\\laravel\\framework\\src\\Illuminate\\Mail\\Mailer.php(419): Illuminate\\Mail\\Mailer->renderView()\n#10 D:\\Small-Proj\\schedulink\\vendor\\laravel\\framework\\src\\Illuminate\\Mail\\Mailer.php(312): Illuminate\\Mail\\Mailer->addContent()\n#11 D:\\Small-Proj\\schedulink\\vendor\\laravel\\framework\\src\\Illuminate\\Mail\\Mailable.php(207): Illuminate\\Mail\\Mailer->send()\n#12 D:\\Small-Proj\\schedulink\\vendor\\laravel\\framework\\src\\Illuminate\\Support\\Traits\\Localizable.php(19): Illuminate\\Mail\\Mailable->Illuminate\\Mail\\{closure}()\n#13 D:\\Small-Proj\\schedulink\\vendor\\laravel\\framework\\src\\Illuminate\\Mail\\Mailable.php(200): Illuminate\\Mail\\Mailable->withLocale()\n#14 D:\\Small-Proj\\schedulink\\vendor\\laravel\\framework\\src\\Illuminate\\Mail\\SendQueuedMailable.php(82): Illuminate\\Mail\\Mailable->send()\n#15 D:\\Small-Proj\\schedulink\\vendor\\laravel\\framework\\src\\Illuminate\\Container\\BoundMethod.php(36): Illuminate\\Mail\\SendQueuedMailable->handle()\n#16 D:\\Small-Proj\\schedulink\\vendor\\laravel\\framework\\src\\Illuminate\\Container\\Util.php(43): Illuminate\\Container\\BoundMethod::Illuminate\\Container\\{closure}()\n#17 D:\\Small-Proj\\schedulink\\vendor\\laravel\\framework\\src\\Illuminate\\Container\\BoundMethod.php(96): Illuminate\\Container\\Util::unwrapIfClosure()\n#18 D:\\Small-Proj\\schedulink\\vendor\\laravel\\framework\\src\\Illuminate\\Container\\BoundMethod.php(35): Illuminate\\Container\\BoundMethod::callBoundMethod()\n#19 D:\\Small-Proj\\schedulink\\vendor\\laravel\\framework\\src\\Illuminate\\Container\\Container.php(780): Illuminate\\Container\\BoundMethod::call()\n#20 D:\\Small-Proj\\schedulink\\vendor\\laravel\\framework\\src\\Illuminate\\Bus\\Dispatcher.php(132): Illuminate\\Container\\Container->call()\n#21 D:\\Small-Proj\\schedulink\\vendor\\laravel\\framework\\src\\Illuminate\\Pipeline\\Pipeline.php(169): Illuminate\\Bus\\Dispatcher->Illuminate\\Bus\\{closure}()\n#22 D:\\Small-Proj\\schedulink\\vendor\\laravel\\framework\\src\\Illuminate\\Pipeline\\Pipeline.php(126): Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}()\n#23 D:\\Small-Proj\\schedulink\\vendor\\laravel\\framework\\src\\Illuminate\\Bus\\Dispatcher.php(136): Illuminate\\Pipeline\\Pipeline->then()\n#24 D:\\Small-Proj\\schedulink\\vendor\\laravel\\framework\\src\\Illuminate\\Queue\\CallQueuedHandler.php(134): Illuminate\\Bus\\Dispatcher->dispatchNow()\n#25 D:\\Small-Proj\\schedulink\\vendor\\laravel\\framework\\src\\Illuminate\\Pipeline\\Pipeline.php(169): Illuminate\\Queue\\CallQueuedHandler->Illuminate\\Queue\\{closure}()\n#26 D:\\Small-Proj\\schedulink\\vendor\\laravel\\framework\\src\\Illuminate\\Pipeline\\Pipeline.php(126): Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}()\n#27 D:\\Small-Proj\\schedulink\\vendor\\laravel\\framework\\src\\Illuminate\\Queue\\CallQueuedHandler.php(127): Illuminate\\Pipeline\\Pipeline->then()\n#28 D:\\Small-Proj\\schedulink\\vendor\\laravel\\framework\\src\\Illuminate\\Queue\\CallQueuedHandler.php(68): Illuminate\\Queue\\CallQueuedHandler->dispatchThroughMiddleware()\n#29 D:\\Small-Proj\\schedulink\\vendor\\laravel\\framework\\src\\Illuminate\\Queue\\Jobs\\Job.php(102): Illuminate\\Queue\\CallQueuedHandler->call()\n#30 D:\\Small-Proj\\schedulink\\vendor\\laravel\\framework\\src\\Illuminate\\Queue\\Worker.php(444): Illuminate\\Queue\\Jobs\\Job->fire()\n#31 D:\\Small-Proj\\schedulink\\vendor\\laravel\\framework\\src\\Illuminate\\Queue\\Worker.php(394): Illuminate\\Queue\\Worker->process()\n#32 D:\\Small-Proj\\schedulink\\vendor\\laravel\\framework\\src\\Illuminate\\Queue\\Worker.php(180): Illuminate\\Queue\\Worker->runJob()\n#33 D:\\Small-Proj\\schedulink\\vendor\\laravel\\framework\\src\\Illuminate\\Queue\\Console\\WorkCommand.php(148): Illuminate\\Queue\\Worker->daemon()\n#34 D:\\Small-Proj\\schedulink\\vendor\\laravel\\framework\\src\\Illuminate\\Queue\\Console\\WorkCommand.php(131): Illuminate\\Queue\\Console\\WorkCommand->runWorker()\n#35 D:\\Small-Proj\\schedulink\\vendor\\laravel\\framework\\src\\Illuminate\\Container\\BoundMethod.php(36): Illuminate\\Queue\\Console\\WorkCommand->handle()\n#36 D:\\Small-Proj\\schedulink\\vendor\\laravel\\framework\\src\\Illuminate\\Container\\Util.php(43): Illuminate\\Container\\BoundMethod::Illuminate\\Container\\{closure}()\n#37 D:\\Small-Proj\\schedulink\\vendor\\laravel\\framework\\src\\Illuminate\\Container\\BoundMethod.php(96): Illuminate\\Container\\Util::unwrapIfClosure()\n#38 D:\\Small-Proj\\schedulink\\vendor\\laravel\\framework\\src\\Illuminate\\Container\\BoundMethod.php(35): Illuminate\\Container\\BoundMethod::callBoundMethod()\n#39 D:\\Small-Proj\\schedulink\\vendor\\laravel\\framework\\src\\Illuminate\\Container\\Container.php(780): Illuminate\\Container\\BoundMethod::call()\n#40 D:\\Small-Proj\\schedulink\\vendor\\laravel\\framework\\src\\Illuminate\\Console\\Command.php(211): Illuminate\\Container\\Container->call()\n#41 D:\\Small-Proj\\schedulink\\vendor\\symfony\\console\\Command\\Command.php(318): Illuminate\\Console\\Command->execute()\n#42 D:\\Small-Proj\\schedulink\\vendor\\laravel\\framework\\src\\Illuminate\\Console\\Command.php(180): Symfony\\Component\\Console\\Command\\Command->run()\n#43 D:\\Small-Proj\\schedulink\\vendor\\symfony\\console\\Application.php(1092): Illuminate\\Console\\Command->run()\n#44 D:\\Small-Proj\\schedulink\\vendor\\symfony\\console\\Application.php(341): Symfony\\Component\\Console\\Application->doRunCommand()\n#45 D:\\Small-Proj\\schedulink\\vendor\\symfony\\console\\Application.php(192): Symfony\\Component\\Console\\Application->doRun()\n#46 D:\\Small-Proj\\schedulink\\vendor\\laravel\\framework\\src\\Illuminate\\Foundation\\Console\\Kernel.php(197): Symfony\\Component\\Console\\Application->run()\n#47 D:\\Small-Proj\\schedulink\\vendor\\laravel\\framework\\src\\Illuminate\\Foundation\\Application.php(1234): Illuminate\\Foundation\\Console\\Kernel->handle()\n#48 D:\\Small-Proj\\schedulink\\artisan(16): Illuminate\\Foundation\\Application->handleCommand()\n#49 {main}','2025-08-06 07:30:24');
/*!40000 ALTER TABLE `failed_jobs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `job_batches`
--

DROP TABLE IF EXISTS `job_batches`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `job_batches` (
  `id` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `total_jobs` int NOT NULL,
  `pending_jobs` int NOT NULL,
  `failed_jobs` int NOT NULL,
  `failed_job_ids` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `options` mediumtext COLLATE utf8mb4_unicode_ci,
  `cancelled_at` int DEFAULT NULL,
  `created_at` int NOT NULL,
  `finished_at` int DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `job_batches`
--

LOCK TABLES `job_batches` WRITE;
/*!40000 ALTER TABLE `job_batches` DISABLE KEYS */;
/*!40000 ALTER TABLE `job_batches` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `jobs`
--

DROP TABLE IF EXISTS `jobs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `jobs` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `queue` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `attempts` tinyint unsigned NOT NULL,
  `reserved_at` int unsigned DEFAULT NULL,
  `available_at` int unsigned NOT NULL,
  `created_at` int unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `jobs_queue_index` (`queue`)
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `jobs`
--

LOCK TABLES `jobs` WRITE;
/*!40000 ALTER TABLE `jobs` DISABLE KEYS */;
/*!40000 ALTER TABLE `jobs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `migrations`
--

DROP TABLE IF EXISTS `migrations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `migrations` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `migrations`
--

LOCK TABLES `migrations` WRITE;
/*!40000 ALTER TABLE `migrations` DISABLE KEYS */;
INSERT INTO `migrations` VALUES (1,'0001_01_01_000001_create_cache_table',1),(2,'0001_01_01_000002_create_jobs_table',1),(3,'2025_07_24_052628_create_business_units_table',1),(4,'2025_07_24_052631_create_company_codes_table',1),(5,'2025_07_24_052633_create_branches_table',1),(6,'2025_07_24_052636_create_departments_table',1),(7,'2025_07_24_052639_create_roles_table',1),(8,'2025_07_24_052642_create_asset_types_table',1),(9,'2025_07_24_052645_create_asset_details_table',1),(10,'2025_07_24_052649_create_asset_files_table',1),(11,'2025_07_24_052651_create_drivers_table',1),(12,'2025_07_24_052654_create_users_table',1),(13,'2025_07_24_052656_create_bookings_table',1),(14,'2025_07_24_052658_create_booked_guests_table',1),(15,'2025_07_24_052701_create_vehicle_driver_assignments_table',1),(16,'2025_07_24_052706_create_approvers_table',1),(17,'2025_07_24_052709_create_approval_logs_table',1),(18,'2025_07_28_043657_create_sessions_table',1),(19,'2025_07_29_000703_make_asset_detail_id_nullable_in_bookings_table',2),(20,'2025_07_31_101710_add_approver_fields_to_bookings_table',3),(21,'2025_07_31_133539_add_disapprove_reason_to_bookings_table',4),(22,'2025_08_05_183334_rename_file_attatchments_column_in_asset_files_table',5);
/*!40000 ALTER TABLE `migrations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `roles`
--

DROP TABLE IF EXISTS `roles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `roles` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` enum('Admin','Approver','User','Driver','Admin Staff') COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `roles`
--

LOCK TABLES `roles` WRITE;
/*!40000 ALTER TABLE `roles` DISABLE KEYS */;
INSERT INTO `roles` VALUES (1,'Admin','2025-08-06 08:25:32','2025-08-06 08:25:32'),(2,'Approver','2025-08-06 08:25:32','2025-08-06 08:25:32'),(3,'Admin Staff','2025-08-06 08:25:32','2025-08-06 08:25:32'),(4,'User','2025-08-06 08:25:32','2025-08-06 08:25:32');
/*!40000 ALTER TABLE `roles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sessions`
--

DROP TABLE IF EXISTS `sessions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sessions` (
  `id` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` bigint unsigned DEFAULT NULL,
  `ip_address` varchar(45) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `user_agent` text COLLATE utf8mb4_unicode_ci,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `last_activity` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `sessions_user_id_index` (`user_id`),
  KEY `sessions_last_activity_index` (`last_activity`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sessions`
--

LOCK TABLES `sessions` WRITE;
/*!40000 ALTER TABLE `sessions` DISABLE KEYS */;
INSERT INTO `sessions` VALUES ('9kvYfhFBjtl5JIJbpV9pgakpzEU5USgQhEwDh6Zf',29,'10.10.99.81','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/139.0.0.0 Safari/537.36 Edg/139.0.0.0','YTo0OntzOjY6Il90b2tlbiI7czo0MDoiOFJRd0FzVGQ3RU5tZWtLcnk3NVJrYlRFM0VxZlhMdkFaa2VLbDVxUSI7czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6Mzk6Imh0dHA6Ly8xMC4xMC45OS44MS9hZG1pbi1zdGFmZi9ib29raW5ncyI7fXM6NTA6ImxvZ2luX3dlYl81OWJhMzZhZGRjMmIyZjk0MDE1ODBmMDE0YzdmNThlYTRlMzA5ODlkIjtpOjI5O30=',1755838027);
/*!40000 ALTER TABLE `sessions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `users` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `branch_id` bigint unsigned NOT NULL,
  `department_id` bigint unsigned NOT NULL,
  `business_unit_id` bigint unsigned NOT NULL,
  `company_code_id` bigint unsigned NOT NULL,
  `role_id` bigint unsigned NOT NULL,
  `first_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `last_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `mobile_number` varchar(15) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `users_branch_id_foreign` (`branch_id`),
  KEY `users_department_id_foreign` (`department_id`),
  KEY `users_business_unit_id_foreign` (`business_unit_id`),
  KEY `users_company_code_id_foreign` (`company_code_id`),
  KEY `users_role_id_foreign` (`role_id`),
  CONSTRAINT `users_branch_id_foreign` FOREIGN KEY (`branch_id`) REFERENCES `branches` (`id`),
  CONSTRAINT `users_business_unit_id_foreign` FOREIGN KEY (`business_unit_id`) REFERENCES `business_units` (`id`),
  CONSTRAINT `users_company_code_id_foreign` FOREIGN KEY (`company_code_id`) REFERENCES `company_codes` (`id`),
  CONSTRAINT `users_department_id_foreign` FOREIGN KEY (`department_id`) REFERENCES `departments` (`id`),
  CONSTRAINT `users_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=60 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (1,1,1,1,1,1,'System','Admin','9123456789','admin@example.com','$2y$12$z93ub436akllQI9JnSXgs.6tTPCBv.yWLJKa4beF50BZ1whiJFwTq',1,'2025-07-27 20:44:27','2025-07-27 20:44:27'),(29,37,25,9,8,3,'Admin','Staff','09486131348','adminstaff@gmail.com','$2y$12$MYS78Yv76XlJK5qcGvUw4OPLfMP8KpnmcUG7PepkT8H.AQIurGSlW',1,'2025-08-06 08:30:53','2025-08-06 08:30:53'),(32,37,25,9,8,4,'Christian','Delapos','09486131348','christian.delapos6@gmail.com','$2y$12$ZyuAQ8j0WKblOjuU4ilbGuQbpGZgX4ELjQGZjEHRf8qsrYPVNdVo2',1,'2025-08-06 08:33:34','2025-08-06 08:33:34'),(37,37,25,13,9,4,'Milene','Silaya','09123456789','milene.silaya@dsgsonsgroup.com','$2y$12$hkiKyAVNwveJvHEdFM3WVeYC5qONsZhfLFdOu4i8hBmxonSoaCG22',1,'2025-08-13 02:38:49','2025-08-13 02:38:49'),(45,37,25,13,9,2,'Rona','Soliva','09486131348','rona@gmail.com','$2y$12$hHvg8w.lf/dtdTLgcF43pOw/uUQZGGQr70QJ4WurUIdU1fNgfv3G2',1,'2025-08-14 00:32:18','2025-08-14 00:32:18'),(47,37,25,13,9,2,'Rexiel','Rexiel','09486131348','rex@gmail.com','$2y$12$Cf42NaD6844/feSo/1EuGuQeb6cBUpdnmXGPgTAGdX/4gpgiNk/ae',1,'2025-08-14 03:06:54','2025-08-14 03:06:54'),(48,37,25,13,9,2,'Ida','Tan','09486131348','ida@gmail.com','$2y$12$oNMpKx4u9h/cvIm22EWGIOSIPt5TayTwsHA/eqtPjIfWy5m1or3hS',1,'2025-08-14 03:07:32','2025-08-14 03:07:32'),(49,37,25,13,9,2,'Jojo','Damo','09123456789','jodamo@gmail.com','$2y$12$jTCd3NhI7R.awK1q6sqSNeRyz3LxSjpz1i9poOOPXgjNDM.ovkFCG',1,'2025-08-14 06:11:45','2025-08-14 09:12:55'),(50,37,25,13,9,2,'FPM','Approver','09874561233','fpmapp@gmail.com','$2y$12$L40HzC9ZTqyUHwKW1OcCIu4uJnro0kEJzOObJZ71OjFU3/RM/Oy.6',1,'2025-08-14 06:14:07','2025-08-14 06:14:07'),(53,37,30,14,9,3,'Maam','Chu','09123654789','mchu@gmail.com','$2y$12$ZnDWmvpnbYgBeKgO2OIteusOFwJxQ5eTQBHLhZSj1aemLR9m3aY3K',1,'2025-08-14 09:38:22','2025-08-14 09:38:22'),(54,37,25,13,9,2,'Christian','Delapos','09486131348','christian.delapos123@gmail.com','$2y$12$7ogQK1oUyYscPu/Z.Q4LQuAgYKqYqvL1GJlYW39LebLIpJ5VrmV82',1,'2025-08-19 02:09:18','2025-08-19 02:09:18'),(55,37,25,13,9,2,'Christian','Approver2','09486131348','christian.delapos2@gmail.com','$2y$12$DP1xRPFikS3rGU13eBVVNOUW6Ig5r43FK6TEFMMowCEYOp6hA9YBu',1,'2025-08-19 03:24:47','2025-08-19 03:25:24'),(56,37,25,13,9,4,'Ida','Tan','09303396963','ict.processanalyst@gaisanogroup.com','$2y$12$pnHTqEG/pk9jy47G6aixaOBzgcaj0j7hCJtnDdQupxUpCrnzcFc1y',1,'2025-08-20 01:17:15','2025-08-20 01:17:15'),(57,37,25,13,9,4,'Rexiel Joy','Macabante','09123456789','r.macabante@gaisanogroup.com','$2y$12$RWtANVxEbIVUlkjDKd/65.N0HWby1WrveQp4piq6SUkGA7LIMYOY.',1,'2025-08-20 01:42:33','2025-08-20 01:42:33'),(58,37,25,13,9,4,'Christian','Delapos','09486131385','christian.delapos26@gmail.com','$2y$12$NU45rvhn.92lvVkD92RcEu6m5k5p/.atzayRBAvGKfgsm2H0jP5Vq',1,'2025-08-22 02:59:53','2025-08-22 02:59:53'),(59,37,25,13,8,4,'test','test','a','christian.delapos116@gmail.com','$2y$12$xNUWjB5yy1Oqkxau43GMH.tGNV2qnYl59ZT7KKnrnBn6fCigY23ly',1,'2025-08-22 03:03:53','2025-08-22 03:03:53');
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `vehicle_driver_assignments`
--

DROP TABLE IF EXISTS `vehicle_driver_assignments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `vehicle_driver_assignments` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `booking_id` bigint unsigned NOT NULL,
  `driver_id` bigint unsigned NOT NULL,
  `asset_detail_id` bigint unsigned NOT NULL,
  `assigned_date` date NOT NULL,
  `assigned_by` bigint unsigned NOT NULL,
  `odometer_start` decimal(10,2) DEFAULT NULL,
  `odometer_end` decimal(10,2) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `vehicle_driver_assignments_booking_id_foreign` (`booking_id`),
  KEY `vehicle_driver_assignments_driver_id_foreign` (`driver_id`),
  KEY `vehicle_driver_assignments_asset_detail_id_foreign` (`asset_detail_id`),
  KEY `vehicle_driver_assignments_assigned_by_foreign` (`assigned_by`),
  CONSTRAINT `vehicle_driver_assignments_asset_detail_id_foreign` FOREIGN KEY (`asset_detail_id`) REFERENCES `asset_details` (`id`),
  CONSTRAINT `vehicle_driver_assignments_assigned_by_foreign` FOREIGN KEY (`assigned_by`) REFERENCES `users` (`id`),
  CONSTRAINT `vehicle_driver_assignments_booking_id_foreign` FOREIGN KEY (`booking_id`) REFERENCES `bookings` (`id`),
  CONSTRAINT `vehicle_driver_assignments_driver_id_foreign` FOREIGN KEY (`driver_id`) REFERENCES `drivers` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=41 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `vehicle_driver_assignments`
--

LOCK TABLES `vehicle_driver_assignments` WRITE;
/*!40000 ALTER TABLE `vehicle_driver_assignments` DISABLE KEYS */;
INSERT INTO `vehicle_driver_assignments` VALUES (39,159,11,15,'2025-08-22',29,123.00,NULL,'2025-08-22 04:38:00','2025-08-22 04:38:00'),(40,161,12,15,'2025-08-22',29,123.00,NULL,'2025-08-22 04:42:43','2025-08-22 04:42:43');
/*!40000 ALTER TABLE `vehicle_driver_assignments` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2025-08-22 12:51:55
