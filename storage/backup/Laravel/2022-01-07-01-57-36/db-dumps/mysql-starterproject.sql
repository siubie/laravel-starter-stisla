
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

LOCK TABLES `failed_jobs` WRITE;
/*!40000 ALTER TABLE `failed_jobs` DISABLE KEYS */;
/*!40000 ALTER TABLE `failed_jobs` ENABLE KEYS */;
UNLOCK TABLES;
DROP TABLE IF EXISTS `menu_groups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `menu_groups` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `permission_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `icon` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `menu_groups_name_unique` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

LOCK TABLES `menu_groups` WRITE;
/*!40000 ALTER TABLE `menu_groups` DISABLE KEYS */;
INSERT INTO `menu_groups` VALUES (1,'Dashboard','dashboard','fas fa-tachometer-alt',NULL,NULL),(2,'Users Management','user.management','fas fa-users',NULL,NULL),(3,'Role Management','role.permission.management','fas fa-user-tag',NULL,NULL),(4,'Menu Management','menu.management','fas fa-bars',NULL,NULL),(5,'Upload Management','upload.management','fa tes','2021-12-30 23:28:28','2021-12-30 23:28:28');
/*!40000 ALTER TABLE `menu_groups` ENABLE KEYS */;
UNLOCK TABLES;
DROP TABLE IF EXISTS `menu_items`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `menu_items` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `route` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `permission_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `menu_group_id` bigint unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `menu_items_name_unique` (`name`),
  UNIQUE KEY `menu_items_route_unique` (`route`),
  KEY `menu_items_menu_group_id_foreign` (`menu_group_id`),
  CONSTRAINT `menu_items_menu_group_id_foreign` FOREIGN KEY (`menu_group_id`) REFERENCES `menu_groups` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

LOCK TABLES `menu_items` WRITE;
/*!40000 ALTER TABLE `menu_items` DISABLE KEYS */;
INSERT INTO `menu_items` VALUES (1,'Dashboard','dashboard','dashboard',1,NULL,NULL),(2,'User List','user-management/user','user.index',2,NULL,NULL),(3,'Role List','role-and-permission/role','role.index',3,NULL,NULL),(4,'Permission List','role-and-permission/permission','permission.index',3,NULL,NULL),(5,'Permission To Role','role-and-permission/assign','assign.index',3,NULL,NULL),(6,'User To Role','role-and-permission/assign-user','assign.user.index',3,NULL,NULL),(7,'Menu Group','menu-management/menu-group','menu-group.index',4,NULL,NULL),(8,'Menu Item','menu-management/menu-item','menu-item.index',4,NULL,NULL);
/*!40000 ALTER TABLE `menu_items` ENABLE KEYS */;
UNLOCK TABLES;
DROP TABLE IF EXISTS `migrations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `migrations` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

LOCK TABLES `migrations` WRITE;
/*!40000 ALTER TABLE `migrations` DISABLE KEYS */;
INSERT INTO `migrations` VALUES (1,'2014_10_12_000000_create_users_table',1),(2,'2014_10_12_100000_create_password_resets_table',1),(3,'2014_10_12_200000_add_two_factor_columns_to_users_table',1),(4,'2019_08_19_000000_create_failed_jobs_table',1),(5,'2019_12_14_000001_create_personal_access_tokens_table',1),(6,'2021_10_26_232900_create_permission_tables',1),(7,'2021_12_30_215143_create_menu_groups_table',1),(8,'2021_12_31_002402_create_menu_items_table',1);
/*!40000 ALTER TABLE `migrations` ENABLE KEYS */;
UNLOCK TABLES;
DROP TABLE IF EXISTS `model_has_permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `model_has_permissions` (
  `permission_id` bigint unsigned NOT NULL,
  `model_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `model_id` bigint unsigned NOT NULL,
  PRIMARY KEY (`permission_id`,`model_id`,`model_type`),
  KEY `model_has_permissions_model_id_model_type_index` (`model_id`,`model_type`),
  CONSTRAINT `model_has_permissions_permission_id_foreign` FOREIGN KEY (`permission_id`) REFERENCES `permissions` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

LOCK TABLES `model_has_permissions` WRITE;
/*!40000 ALTER TABLE `model_has_permissions` DISABLE KEYS */;
/*!40000 ALTER TABLE `model_has_permissions` ENABLE KEYS */;
UNLOCK TABLES;
DROP TABLE IF EXISTS `model_has_roles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `model_has_roles` (
  `role_id` bigint unsigned NOT NULL,
  `model_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `model_id` bigint unsigned NOT NULL,
  PRIMARY KEY (`role_id`,`model_id`,`model_type`),
  KEY `model_has_roles_model_id_model_type_index` (`model_id`,`model_type`),
  CONSTRAINT `model_has_roles_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

LOCK TABLES `model_has_roles` WRITE;
/*!40000 ALTER TABLE `model_has_roles` DISABLE KEYS */;
INSERT INTO `model_has_roles` VALUES (2,'App\\Models\\User',1),(1,'App\\Models\\User',2);
/*!40000 ALTER TABLE `model_has_roles` ENABLE KEYS */;
UNLOCK TABLES;
DROP TABLE IF EXISTS `password_resets`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `password_resets` (
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  KEY `password_resets_email_index` (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

LOCK TABLES `password_resets` WRITE;
/*!40000 ALTER TABLE `password_resets` DISABLE KEYS */;
/*!40000 ALTER TABLE `password_resets` ENABLE KEYS */;
UNLOCK TABLES;
DROP TABLE IF EXISTS `permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `permissions` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `guard_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `permissions_name_guard_name_unique` (`name`,`guard_name`)
) ENGINE=InnoDB AUTO_INCREMENT=31 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

LOCK TABLES `permissions` WRITE;
/*!40000 ALTER TABLE `permissions` DISABLE KEYS */;
INSERT INTO `permissions` VALUES (1,'dashboard','web','2021-12-30 21:22:42','2021-12-30 21:22:42'),(2,'user.management','web','2021-12-30 21:22:43','2021-12-30 21:22:43'),(3,'role.permission.management','web','2021-12-30 21:22:43','2021-12-30 21:22:43'),(4,'menu.management','web','2021-12-30 21:22:43','2021-12-30 21:22:43'),(5,'user.index','web','2021-12-30 21:22:43','2021-12-30 21:22:43'),(6,'user.create','web','2021-12-30 21:22:43','2021-12-30 21:22:43'),(7,'user.edit','web','2021-12-30 21:22:43','2021-12-30 21:22:43'),(8,'user.destroy','web','2021-12-30 21:22:43','2021-12-30 21:22:43'),(9,'user.import','web','2021-12-30 21:22:43','2021-12-30 21:22:43'),(10,'user.export','web','2021-12-30 21:22:43','2021-12-30 21:22:43'),(11,'role.index','web','2021-12-30 21:22:43','2021-12-30 21:22:43'),(12,'role.create','web','2021-12-30 21:22:43','2021-12-30 21:22:43'),(13,'role.edit','web','2021-12-30 21:22:43','2021-12-30 21:22:43'),(14,'role.destroy','web','2021-12-30 21:22:43','2021-12-30 21:22:43'),(15,'role.import','web','2021-12-30 21:22:43','2021-12-30 21:22:43'),(16,'role.export','web','2021-12-30 21:22:43','2021-12-30 21:22:43'),(17,'permission.index','web','2021-12-30 21:22:43','2021-12-30 21:22:43'),(18,'permission.create','web','2021-12-30 21:22:43','2021-12-30 21:22:43'),(19,'permission.edit','web','2021-12-30 21:22:43','2021-12-30 21:22:43'),(20,'permission.destroy','web','2021-12-30 21:22:43','2021-12-30 21:22:43'),(21,'permission.import','web','2021-12-30 21:22:43','2021-12-30 21:22:43'),(22,'permission.export','web','2021-12-30 21:22:43','2021-12-30 21:22:43'),(23,'assign.index','web','2021-12-30 21:22:43','2021-12-30 21:22:43'),(24,'assign.create','web','2021-12-30 21:22:43','2021-12-30 21:22:43'),(25,'assign.edit','web','2021-12-30 21:22:44','2021-12-30 21:22:44'),(26,'assign.destroy','web','2021-12-30 21:22:44','2021-12-30 21:22:44'),(27,'assign.user.index','web','2021-12-30 21:22:44','2021-12-30 21:22:44'),(28,'assign.user.create','web','2021-12-30 21:22:44','2021-12-30 21:22:44'),(29,'assign.user.edit','web','2021-12-30 21:22:44','2021-12-30 21:22:44'),(30,'upload.management','web','2021-12-30 23:20:13','2021-12-30 23:20:13');
/*!40000 ALTER TABLE `permissions` ENABLE KEYS */;
UNLOCK TABLES;
DROP TABLE IF EXISTS `personal_access_tokens`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `personal_access_tokens` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `tokenable_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tokenable_id` bigint unsigned NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL,
  `abilities` text COLLATE utf8mb4_unicode_ci,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

LOCK TABLES `personal_access_tokens` WRITE;
/*!40000 ALTER TABLE `personal_access_tokens` DISABLE KEYS */;
/*!40000 ALTER TABLE `personal_access_tokens` ENABLE KEYS */;
UNLOCK TABLES;
DROP TABLE IF EXISTS `role_has_permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `role_has_permissions` (
  `permission_id` bigint unsigned NOT NULL,
  `role_id` bigint unsigned NOT NULL,
  PRIMARY KEY (`permission_id`,`role_id`),
  KEY `role_has_permissions_role_id_foreign` (`role_id`),
  CONSTRAINT `role_has_permissions_permission_id_foreign` FOREIGN KEY (`permission_id`) REFERENCES `permissions` (`id`) ON DELETE CASCADE,
  CONSTRAINT `role_has_permissions_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

LOCK TABLES `role_has_permissions` WRITE;
/*!40000 ALTER TABLE `role_has_permissions` DISABLE KEYS */;
INSERT INTO `role_has_permissions` VALUES (1,1),(2,1),(5,1),(1,2),(2,2),(3,2),(4,2),(5,2),(6,2),(7,2),(8,2),(9,2),(10,2),(11,2),(12,2),(13,2),(14,2),(15,2),(16,2),(17,2),(18,2),(19,2),(20,2),(21,2),(22,2),(23,2),(24,2),(25,2),(26,2),(27,2),(28,2),(29,2);
/*!40000 ALTER TABLE `role_has_permissions` ENABLE KEYS */;
UNLOCK TABLES;
DROP TABLE IF EXISTS `roles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `roles` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `guard_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `roles_name_guard_name_unique` (`name`,`guard_name`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

LOCK TABLES `roles` WRITE;
/*!40000 ALTER TABLE `roles` DISABLE KEYS */;
INSERT INTO `roles` VALUES (1,'user','web','2021-12-30 21:22:44','2021-12-30 21:22:44'),(2,'super-admin','web','2021-12-30 21:22:44','2021-12-30 21:22:44');
/*!40000 ALTER TABLE `roles` ENABLE KEYS */;
UNLOCK TABLES;
DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `users` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `two_factor_secret` text COLLATE utf8mb4_unicode_ci,
  `two_factor_recovery_codes` text COLLATE utf8mb4_unicode_ci,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `users_email_unique` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=53 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (1,'SuperAdmin','superadmin@gmail.com',NULL,'$2y$10$dCKXJGAPtpweE0x3Isr.PO9IZ4yaaWT/ROC14J92iiycTh0S/CgUu',NULL,NULL,NULL,'2021-12-30 21:22:42','2021-12-30 21:22:42'),(2,'user','user@gmail.com',NULL,'$2y$10$gGCqQw16PL40JOz0NkkTEO6wVbuGqflwtvlAqRYKtbkmegaLbkB7u',NULL,NULL,NULL,'2021-12-30 21:22:42','2021-12-30 21:22:42'),(3,'Celine Batz','keira.oreilly@example.org','2021-12-30 21:22:42','$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi',NULL,NULL,'So80Ou8qcR','2021-12-30 21:22:42','2021-12-30 21:22:42'),(4,'Bertram Schinner PhD','pollich.wilford@example.org','2021-12-30 21:22:42','$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi',NULL,NULL,'J8I0gn4S81','2021-12-30 21:22:42','2021-12-30 21:22:42'),(5,'Melody Purdy','jones.joanne@example.com','2021-12-30 21:22:42','$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi',NULL,NULL,'Ze49AjyhqL','2021-12-30 21:22:42','2021-12-30 21:22:42'),(6,'Prof. Raleigh Dickinson Sr.','gerlach.erick@example.net','2021-12-30 21:22:42','$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi',NULL,NULL,'R0PF9Bbq9M','2021-12-30 21:22:42','2021-12-30 21:22:42'),(7,'Jasmin Abernathy II','leonardo.ortiz@example.org','2021-12-30 21:22:42','$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi',NULL,NULL,'iWRy9DKRKz','2021-12-30 21:22:42','2021-12-30 21:22:42'),(8,'Bertha Kuhn','velva99@example.com','2021-12-30 21:22:42','$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi',NULL,NULL,'5XdWWLRGYK','2021-12-30 21:22:42','2021-12-30 21:22:42'),(9,'Ara Pfannerstill','bbuckridge@example.net','2021-12-30 21:22:42','$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi',NULL,NULL,'41pN9X0RMy','2021-12-30 21:22:42','2021-12-30 21:22:42'),(10,'Elza Carroll','mosciski.gail@example.net','2021-12-30 21:22:42','$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi',NULL,NULL,'R8IbveIZ9F','2021-12-30 21:22:42','2021-12-30 21:22:42'),(11,'Dr. Olin Goldner I','orn.eulalia@example.org','2021-12-30 21:22:42','$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi',NULL,NULL,'BBGKPCimj1','2021-12-30 21:22:42','2021-12-30 21:22:42'),(12,'Noel Heathcote','gorczany.mohamed@example.net','2021-12-30 21:22:42','$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi',NULL,NULL,'awnmA7kXfy','2021-12-30 21:22:42','2021-12-30 21:22:42'),(13,'Earline Denesik I','hlindgren@example.com','2021-12-30 21:22:42','$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi',NULL,NULL,'MoJevEnHFk','2021-12-30 21:22:42','2021-12-30 21:22:42'),(14,'Leo Lebsack','geovanny28@example.com','2021-12-30 21:22:42','$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi',NULL,NULL,'UhMX8B8cU5','2021-12-30 21:22:42','2021-12-30 21:22:42'),(15,'Carolanne Sauer','mikel.berge@example.net','2021-12-30 21:22:42','$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi',NULL,NULL,'54t2vlDHdE','2021-12-30 21:22:42','2021-12-30 21:22:42'),(16,'Marlin Kling IV','thompson.emil@example.com','2021-12-30 21:22:42','$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi',NULL,NULL,'QBNHpJineg','2021-12-30 21:22:42','2021-12-30 21:22:42'),(17,'Harley Sauer','broderick.ward@example.com','2021-12-30 21:22:42','$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi',NULL,NULL,'JJki7Xab8j','2021-12-30 21:22:42','2021-12-30 21:22:42'),(18,'Jimmie Hamill','lueilwitz.annetta@example.org','2021-12-30 21:22:42','$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi',NULL,NULL,'1mMWR658IH','2021-12-30 21:22:42','2021-12-30 21:22:42'),(19,'Rosetta Ledner','wisozk.kellie@example.net','2021-12-30 21:22:42','$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi',NULL,NULL,'SJ6sDjpTSn','2021-12-30 21:22:42','2021-12-30 21:22:42'),(20,'Trent Crona','roberta.daniel@example.com','2021-12-30 21:22:42','$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi',NULL,NULL,'DlyXFHJ8qi','2021-12-30 21:22:42','2021-12-30 21:22:42'),(21,'Lesly Harris II','adams.marcelle@example.org','2021-12-30 21:22:42','$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi',NULL,NULL,'29FCdgahbD','2021-12-30 21:22:42','2021-12-30 21:22:42'),(22,'Mr. Cristian Koepp','oyundt@example.net','2021-12-30 21:22:42','$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi',NULL,NULL,'9Auz1ruv7u','2021-12-30 21:22:42','2021-12-30 21:22:42'),(23,'Dr. Mariah Kuhlman','frami.garnet@example.org','2021-12-30 21:22:42','$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi',NULL,NULL,'YgfyglwHEX','2021-12-30 21:22:42','2021-12-30 21:22:42'),(24,'Kareem Ryan','prohaska.elijah@example.com','2021-12-30 21:22:42','$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi',NULL,NULL,'Ela2705Bhc','2021-12-30 21:22:42','2021-12-30 21:22:42'),(25,'Prof. Uriel Walker MD','bogisich.elvis@example.org','2021-12-30 21:22:42','$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi',NULL,NULL,'aX87BIItq6','2021-12-30 21:22:42','2021-12-30 21:22:42'),(26,'Darian Rodriguez','mateo.gleason@example.com','2021-12-30 21:22:42','$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi',NULL,NULL,'oZ4GfuLzft','2021-12-30 21:22:42','2021-12-30 21:22:42'),(27,'Rodolfo Becker','deckow.imelda@example.org','2021-12-30 21:22:42','$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi',NULL,NULL,'D1fbwHgF5t','2021-12-30 21:22:42','2021-12-30 21:22:42'),(28,'Tommie Zemlak','svon@example.org','2021-12-30 21:22:42','$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi',NULL,NULL,'DQUM0czkid','2021-12-30 21:22:42','2021-12-30 21:22:42'),(29,'Sierra Crist Sr.','korey.ruecker@example.com','2021-12-30 21:22:42','$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi',NULL,NULL,'c7BlqnQ22t','2021-12-30 21:22:42','2021-12-30 21:22:42'),(30,'Ms. Vergie McGlynn II','randall34@example.net','2021-12-30 21:22:42','$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi',NULL,NULL,'8s0kKroLPX','2021-12-30 21:22:42','2021-12-30 21:22:42'),(31,'Dr. Rossie Auer Sr.','gudrun.zemlak@example.net','2021-12-30 21:22:42','$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi',NULL,NULL,'llWI73WLHK','2021-12-30 21:22:42','2021-12-30 21:22:42'),(32,'Dr. Amani Goldner','ymurazik@example.net','2021-12-30 21:22:42','$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi',NULL,NULL,'0hnNlFv0Eb','2021-12-30 21:22:42','2021-12-30 21:22:42'),(33,'Bill Beahan','schiller.krystel@example.com','2021-12-30 21:22:42','$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi',NULL,NULL,'A9xh9d9xHH','2021-12-30 21:22:42','2021-12-30 21:22:42'),(34,'Jimmy Olson','donnelly.laney@example.org','2021-12-30 21:22:42','$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi',NULL,NULL,'b2js8phnjT','2021-12-30 21:22:42','2021-12-30 21:22:42'),(35,'Mr. Emery Wilkinson DDS','cecil.schowalter@example.com','2021-12-30 21:22:42','$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi',NULL,NULL,'ifyY0BpIYm','2021-12-30 21:22:42','2021-12-30 21:22:42'),(36,'Margarita Ledner II','reichert.art@example.net','2021-12-30 21:22:42','$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi',NULL,NULL,'he2BsmV1Zc','2021-12-30 21:22:42','2021-12-30 21:22:42'),(37,'Mr. Manuel Bode','neoma.schuster@example.org','2021-12-30 21:22:42','$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi',NULL,NULL,'IhcNa6gUDA','2021-12-30 21:22:42','2021-12-30 21:22:42'),(38,'Fern Rohan','zakary11@example.org','2021-12-30 21:22:42','$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi',NULL,NULL,'D32FTxTvOc','2021-12-30 21:22:42','2021-12-30 21:22:42'),(39,'Chance Ankunding Jr.','lowe.hattie@example.com','2021-12-30 21:22:42','$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi',NULL,NULL,'tTA3FsPJTY','2021-12-30 21:22:42','2021-12-30 21:22:42'),(40,'Eddie Runolfsdottir','felicita58@example.net','2021-12-30 21:22:42','$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi',NULL,NULL,'TGCHd2mFWd','2021-12-30 21:22:42','2021-12-30 21:22:42'),(41,'Erica Flatley','wellington.davis@example.com','2021-12-30 21:22:42','$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi',NULL,NULL,'ouH3GHXrjZ','2021-12-30 21:22:42','2021-12-30 21:22:42'),(42,'Lia Kemmer','rjohnson@example.com','2021-12-30 21:22:42','$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi',NULL,NULL,'JwYoCSoa4Q','2021-12-30 21:22:42','2021-12-30 21:22:42'),(43,'Prof. Raymundo Reinger','erik.mertz@example.com','2021-12-30 21:22:42','$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi',NULL,NULL,'zmdmXVZdAo','2021-12-30 21:22:42','2021-12-30 21:22:42'),(44,'Prof. Greg Anderson','mariane.feeney@example.com','2021-12-30 21:22:42','$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi',NULL,NULL,'jrVIpgYWYN','2021-12-30 21:22:42','2021-12-30 21:22:42'),(45,'Junior Denesik','schumm.luz@example.org','2021-12-30 21:22:42','$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi',NULL,NULL,'BSEEaCLsBf','2021-12-30 21:22:42','2021-12-30 21:22:42'),(46,'Dr. Deon Bode','tessie02@example.org','2021-12-30 21:22:42','$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi',NULL,NULL,'cARgmb2vHr','2021-12-30 21:22:42','2021-12-30 21:22:42'),(47,'Treva Daugherty','gustave57@example.net','2021-12-30 21:22:42','$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi',NULL,NULL,'TReCZD2bIu','2021-12-30 21:22:42','2021-12-30 21:22:42'),(48,'Everett McCullough','ellie.kerluke@example.com','2021-12-30 21:22:42','$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi',NULL,NULL,'FOwWVF4iOD','2021-12-30 21:22:42','2021-12-30 21:22:42'),(49,'Rodrigo Sauer','legros.adrian@example.org','2021-12-30 21:22:42','$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi',NULL,NULL,'Hr8EiIxCor','2021-12-30 21:22:42','2021-12-30 21:22:42'),(50,'Roxanne McCullough','feest.brent@example.org','2021-12-30 21:22:42','$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi',NULL,NULL,'TBGNu03AgW','2021-12-30 21:22:42','2021-12-30 21:22:42'),(51,'Alia Koelpin','luettgen.rupert@example.net','2021-12-30 21:22:42','$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi',NULL,NULL,'BT2zLSlWKB','2021-12-30 21:22:42','2021-12-30 21:22:42'),(52,'Jedediah Harber','jaren98@example.org','2021-12-30 21:22:42','$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi',NULL,NULL,'nolWvvBjIe','2021-12-30 21:22:42','2021-12-30 21:22:42');
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

