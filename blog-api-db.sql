/*
SQLyog Community v13.1.8 (64 bit)
MySQL - 10.4.32-MariaDB : Database - skill-test
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`skill-test` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci */;

USE `skill-test`;

/*Table structure for table `activity_log` */

DROP TABLE IF EXISTS `activity_log`;

CREATE TABLE `activity_log` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `log_name` varchar(255) DEFAULT NULL,
  `description` text NOT NULL,
  `subject_type` varchar(255) DEFAULT NULL,
  `event` varchar(255) DEFAULT NULL,
  `subject_id` bigint(20) unsigned DEFAULT NULL,
  `causer_type` varchar(255) DEFAULT NULL,
  `causer_id` bigint(20) unsigned DEFAULT NULL,
  `properties` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL CHECK (json_valid(`properties`)),
  `batch_uuid` char(36) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `subject` (`subject_type`,`subject_id`),
  KEY `causer` (`causer_type`,`causer_id`),
  KEY `activity_log_log_name_index` (`log_name`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `activity_log` */

insert  into `activity_log`(`id`,`log_name`,`description`,`subject_type`,`event`,`subject_id`,`causer_type`,`causer_id`,`properties`,`batch_uuid`,`created_at`,`updated_at`) values 
(1,'default','Created a blog','App\\Models\\Blog',NULL,11,NULL,NULL,'{\"attributes\":{\"title\":\"My first API 2\",\"body\":\"This is my first API endpoint as a full-stack\",\"author_id\":3}}',NULL,'2024-05-18 06:09:46','2024-05-18 06:09:46'),
(2,'default','Created a blog','App\\Models\\Blog',NULL,12,NULL,NULL,'{\"attributes\":{\"title\":\"Test mail\",\"body\":\"mail should be send.\",\"author_id\":1}}',NULL,'2024-05-18 06:46:43','2024-05-18 06:46:43'),
(3,'default','Created a blog','App\\Models\\Blog',NULL,13,NULL,NULL,'{\"attributes\":{\"title\":\"Test mail\",\"body\":\"mail should be send.\",\"author_id\":1}}',NULL,'2024-05-18 06:47:17','2024-05-18 06:47:17'),
(4,'default','Created a blog','App\\Models\\Blog',NULL,14,NULL,NULL,'{\"attributes\":{\"title\":\"Test mail 2\",\"body\":\"mail should be send 2.\",\"author_id\":1}}',NULL,'2024-05-18 06:48:14','2024-05-18 06:48:14'),
(5,'default','Created a blog','App\\Models\\Blog',NULL,15,NULL,NULL,'{\"attributes\":{\"title\":\"Test mail 3\",\"body\":\"mail should be send 3.\",\"author_id\":1}}',NULL,'2024-05-18 06:50:56','2024-05-18 06:50:56'),
(6,'default','Updated a blog','App\\Models\\Blog',NULL,1,NULL,NULL,'{\"attributes\":{\"title\":\"Updated title1\",\"body\":\"Updated\",\"author_id\":1}}',NULL,'2024-05-18 06:54:46','2024-05-18 06:54:46'),
(7,'default','Deleted a blog','App\\Models\\Blog',NULL,3,NULL,NULL,'{\"attributes\":{\"id\":3,\"title\":\"Id velit voluptatem aspernatur.\",\"body\":\"Error dolores porro placeat quia voluptatem quae quia et natus vitae omnis omnis quas.\",\"author_id\":13,\"created_at\":\"2024-05-18T04:47:35.000000Z\",\"updated_at\":\"2024-05-18T04:47:35.000000Z\"}}',NULL,'2024-05-18 06:57:51','2024-05-18 06:57:51');

/*Table structure for table `blogs` */

DROP TABLE IF EXISTS `blogs`;

CREATE TABLE `blogs` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(255) NOT NULL,
  `body` text NOT NULL,
  `author_id` bigint(20) unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `blogs` */

insert  into `blogs`(`id`,`title`,`body`,`author_id`,`created_at`,`updated_at`) values 
(1,'Updated title1','Updated',1,'2024-05-18 04:47:35','2024-05-18 06:54:46'),
(2,'Voluptatibus dolor deserunt natus omnis assumenda.','Aut corrupti sed quia neque ullam consectetur dolores laboriosam et sapiente et et eum.',12,'2024-05-18 04:47:35','2024-05-18 04:47:35'),
(4,'Fugit ad molestiae quia odio voluptates earum consectetur.','Dolore sed consequatur ex ducimus maxime sint quia.',14,'2024-05-18 04:47:35','2024-05-18 04:47:35'),
(5,'Quis iure ipsum dolor quaerat.','Fugiat sint eaque iure aut ut magni sint aspernatur.',15,'2024-05-18 04:47:35','2024-05-18 04:47:35'),
(6,'Aut molestiae laudantium sequi.','Dolor beatae dolores accusantium delectus minus voluptatem ipsum.',16,'2024-05-18 04:47:35','2024-05-18 04:47:35'),
(7,'Molestiae ut aut molestias ea aut aut.','Voluptatum et aliquid in quisquam voluptatem illo eum quia et sunt eos.',17,'2024-05-18 04:47:35','2024-05-18 04:47:35'),
(8,'Repudiandae vel et omnis voluptatem voluptatibus eos non vitae.','Suscipit voluptates et iure et quidem deserunt earum tempore.',18,'2024-05-18 04:47:35','2024-05-18 04:47:35'),
(9,'Illo quam officiis non totam est perspiciatis.','Et est ad laboriosam deserunt voluptatem voluptas aliquam delectus dolorem.',19,'2024-05-18 04:47:35','2024-05-18 04:47:35'),
(10,'Error fuga dolores ut est.','Esse consequatur est expedita dignissimos minus et perspiciatis est eum et sit.',20,'2024-05-18 04:47:35','2024-05-18 04:47:35'),
(11,'My first API 2','This is my first API endpoint as a full-stack',3,'2024-05-18 06:09:46','2024-05-18 06:09:46'),
(12,'Test mail','mail should be send.',1,'2024-05-18 06:46:43','2024-05-18 06:46:43'),
(13,'Test mail','mail should be send.',1,'2024-05-18 06:47:17','2024-05-18 06:47:17'),
(14,'Test mail 2','mail should be send 2.',1,'2024-05-18 06:48:14','2024-05-18 06:48:14'),
(15,'Test mail 3','mail should be send 3.',1,'2024-05-18 06:50:56','2024-05-18 06:50:56');

/*Table structure for table `cache` */

DROP TABLE IF EXISTS `cache`;

CREATE TABLE `cache` (
  `key` varchar(255) NOT NULL,
  `value` mediumtext NOT NULL,
  `expiration` int(11) NOT NULL,
  PRIMARY KEY (`key`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `cache` */

/*Table structure for table `cache_locks` */

DROP TABLE IF EXISTS `cache_locks`;

CREATE TABLE `cache_locks` (
  `key` varchar(255) NOT NULL,
  `owner` varchar(255) NOT NULL,
  `expiration` int(11) NOT NULL,
  PRIMARY KEY (`key`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `cache_locks` */

/*Table structure for table `failed_jobs` */

DROP TABLE IF EXISTS `failed_jobs`;

CREATE TABLE `failed_jobs` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `uuid` varchar(255) NOT NULL,
  `connection` text NOT NULL,
  `queue` text NOT NULL,
  `payload` longtext NOT NULL,
  `exception` longtext NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id`),
  UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `failed_jobs` */

/*Table structure for table `job_batches` */

DROP TABLE IF EXISTS `job_batches`;

CREATE TABLE `job_batches` (
  `id` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `total_jobs` int(11) NOT NULL,
  `pending_jobs` int(11) NOT NULL,
  `failed_jobs` int(11) NOT NULL,
  `failed_job_ids` longtext NOT NULL,
  `options` mediumtext DEFAULT NULL,
  `cancelled_at` int(11) DEFAULT NULL,
  `created_at` int(11) NOT NULL,
  `finished_at` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `job_batches` */

/*Table structure for table `jobs` */

DROP TABLE IF EXISTS `jobs`;

CREATE TABLE `jobs` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `queue` varchar(255) NOT NULL,
  `payload` longtext NOT NULL,
  `attempts` tinyint(3) unsigned NOT NULL,
  `reserved_at` int(10) unsigned DEFAULT NULL,
  `available_at` int(10) unsigned NOT NULL,
  `created_at` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `jobs_queue_index` (`queue`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `jobs` */

/*Table structure for table `migrations` */

DROP TABLE IF EXISTS `migrations`;

CREATE TABLE `migrations` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `migration` varchar(255) NOT NULL,
  `batch` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=28 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `migrations` */

insert  into `migrations`(`id`,`migration`,`batch`) values 
(20,'0001_01_01_000000_create_users_table',1),
(21,'0001_01_01_000001_create_cache_table',1),
(22,'0001_01_01_000002_create_jobs_table',1),
(23,'2024_05_18_023252_create_blogs_table',1),
(24,'2024_05_18_024746_create_personal_access_tokens_table',1),
(25,'2024_05_18_055636_create_activity_log_table',2),
(26,'2024_05_18_055637_add_event_column_to_activity_log_table',2),
(27,'2024_05_18_055638_add_batch_uuid_column_to_activity_log_table',2);

/*Table structure for table `password_reset_tokens` */

DROP TABLE IF EXISTS `password_reset_tokens`;

CREATE TABLE `password_reset_tokens` (
  `email` varchar(255) NOT NULL,
  `token` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `password_reset_tokens` */

/*Table structure for table `personal_access_tokens` */

DROP TABLE IF EXISTS `personal_access_tokens`;

CREATE TABLE `personal_access_tokens` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `tokenable_type` varchar(255) NOT NULL,
  `tokenable_id` bigint(20) unsigned NOT NULL,
  `name` varchar(255) NOT NULL,
  `token` varchar(64) NOT NULL,
  `abilities` text DEFAULT NULL,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `expires_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `personal_access_tokens` */

/*Table structure for table `sessions` */

DROP TABLE IF EXISTS `sessions`;

CREATE TABLE `sessions` (
  `id` varchar(255) NOT NULL,
  `user_id` bigint(20) unsigned DEFAULT NULL,
  `ip_address` varchar(45) DEFAULT NULL,
  `user_agent` text DEFAULT NULL,
  `payload` longtext NOT NULL,
  `last_activity` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `sessions_user_id_index` (`user_id`),
  KEY `sessions_last_activity_index` (`last_activity`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `sessions` */

insert  into `sessions`(`id`,`user_id`,`ip_address`,`user_agent`,`payload`,`last_activity`) values 
('UjjOTtMjuW1272q56LISezXG2rc7TUcLpBTnA5X4',NULL,'127.0.0.1','PostmanRuntime/7.38.0','YTozOntzOjY6Il90b2tlbiI7czo0MDoicEVNb2RvSmJEV3pHMGRPcnAzMWxxQnVmcmdZNE9ZSGxWN0lxaGxVVCI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6Mjc6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMC9sb2dpbiI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=',1716015687);

/*Table structure for table `users` */

DROP TABLE IF EXISTS `users`;

CREATE TABLE `users` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) NOT NULL,
  `remember_token` varchar(100) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `users_email_unique` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `users` */

insert  into `users`(`id`,`name`,`email`,`email_verified_at`,`password`,`remember_token`,`created_at`,`updated_at`) values 
(1,'Dr. Maurice Wintheiser','ezekielvargasgarcia@gmail.com','2024-05-18 04:47:35','$2y$12$I3weHb7FuQu9E1/B1kYVDOcS3bAW4yLFotXFYsOdrMx2MBcjhqE1G','DhjjTKjLUZ','2024-05-18 04:47:35','2024-05-18 04:47:35'),
(2,'Jarrett Dooley','nschmidt@example.net','2024-05-18 04:47:35','$2y$12$I3weHb7FuQu9E1/B1kYVDOcS3bAW4yLFotXFYsOdrMx2MBcjhqE1G','MmqutdJ3dq','2024-05-18 04:47:35','2024-05-18 04:47:35'),
(3,'Zetta Kuhlman','glang@example.net','2024-05-18 04:47:35','$2y$12$I3weHb7FuQu9E1/B1kYVDOcS3bAW4yLFotXFYsOdrMx2MBcjhqE1G','VBFSN8B0JL','2024-05-18 04:47:35','2024-05-18 04:47:35'),
(4,'Donato Morar','kristina.okuneva@example.net','2024-05-18 04:47:35','$2y$12$I3weHb7FuQu9E1/B1kYVDOcS3bAW4yLFotXFYsOdrMx2MBcjhqE1G','s0oRCc85PK','2024-05-18 04:47:35','2024-05-18 04:47:35'),
(5,'Theodora Ledner','don32@example.com','2024-05-18 04:47:35','$2y$12$I3weHb7FuQu9E1/B1kYVDOcS3bAW4yLFotXFYsOdrMx2MBcjhqE1G','huMgwKOl7z','2024-05-18 04:47:35','2024-05-18 04:47:35'),
(6,'Ms. Alexane Hoeger','madaline.upton@example.net','2024-05-18 04:47:35','$2y$12$I3weHb7FuQu9E1/B1kYVDOcS3bAW4yLFotXFYsOdrMx2MBcjhqE1G','LhbaOsF30q','2024-05-18 04:47:35','2024-05-18 04:47:35'),
(7,'Randi Kshlerin Jr.','damaris44@example.com','2024-05-18 04:47:35','$2y$12$I3weHb7FuQu9E1/B1kYVDOcS3bAW4yLFotXFYsOdrMx2MBcjhqE1G','gNxzad7hN7','2024-05-18 04:47:35','2024-05-18 04:47:35'),
(8,'Ms. Alvera Boyer DDS','gutmann.abby@example.org','2024-05-18 04:47:35','$2y$12$I3weHb7FuQu9E1/B1kYVDOcS3bAW4yLFotXFYsOdrMx2MBcjhqE1G','pW68D78PZi','2024-05-18 04:47:35','2024-05-18 04:47:35'),
(9,'Retha Huel','domenica.fisher@example.com','2024-05-18 04:47:35','$2y$12$I3weHb7FuQu9E1/B1kYVDOcS3bAW4yLFotXFYsOdrMx2MBcjhqE1G','bEv8faMEak','2024-05-18 04:47:35','2024-05-18 04:47:35'),
(10,'Rachael Farrell','andre.stoltenberg@example.net','2024-05-18 04:47:35','$2y$12$I3weHb7FuQu9E1/B1kYVDOcS3bAW4yLFotXFYsOdrMx2MBcjhqE1G','bisf2WROa6','2024-05-18 04:47:35','2024-05-18 04:47:35'),
(11,'Isadore Smith','maude74@example.org','2024-05-18 04:47:35','$2y$12$I3weHb7FuQu9E1/B1kYVDOcS3bAW4yLFotXFYsOdrMx2MBcjhqE1G','jZDCVoKROS','2024-05-18 04:47:35','2024-05-18 04:47:35'),
(12,'Lynn Herzog I','bcummerata@example.net','2024-05-18 04:47:35','$2y$12$I3weHb7FuQu9E1/B1kYVDOcS3bAW4yLFotXFYsOdrMx2MBcjhqE1G','Mklyd7E4aU','2024-05-18 04:47:35','2024-05-18 04:47:35'),
(13,'Micheal Walter','dmorissette@example.com','2024-05-18 04:47:35','$2y$12$I3weHb7FuQu9E1/B1kYVDOcS3bAW4yLFotXFYsOdrMx2MBcjhqE1G','ufudLsxyNC','2024-05-18 04:47:35','2024-05-18 04:47:35'),
(14,'Prof. Maximus Davis MD','raoul83@example.net','2024-05-18 04:47:35','$2y$12$I3weHb7FuQu9E1/B1kYVDOcS3bAW4yLFotXFYsOdrMx2MBcjhqE1G','DXR3gf14sZ','2024-05-18 04:47:35','2024-05-18 04:47:35'),
(15,'Sammy Feil','okiehn@example.net','2024-05-18 04:47:35','$2y$12$I3weHb7FuQu9E1/B1kYVDOcS3bAW4yLFotXFYsOdrMx2MBcjhqE1G','cQYCkmx0P2','2024-05-18 04:47:35','2024-05-18 04:47:35'),
(16,'Raquel Abbott','katlyn71@example.org','2024-05-18 04:47:35','$2y$12$I3weHb7FuQu9E1/B1kYVDOcS3bAW4yLFotXFYsOdrMx2MBcjhqE1G','9l8Ntx5WoE','2024-05-18 04:47:35','2024-05-18 04:47:35'),
(17,'Judy Gutkowski','daren83@example.com','2024-05-18 04:47:35','$2y$12$I3weHb7FuQu9E1/B1kYVDOcS3bAW4yLFotXFYsOdrMx2MBcjhqE1G','MCuSEmO7nQ','2024-05-18 04:47:35','2024-05-18 04:47:35'),
(18,'Eddie Aufderhar','daisha41@example.com','2024-05-18 04:47:35','$2y$12$I3weHb7FuQu9E1/B1kYVDOcS3bAW4yLFotXFYsOdrMx2MBcjhqE1G','X8PsSUsAqI','2024-05-18 04:47:35','2024-05-18 04:47:35'),
(19,'Gerald Cole DVM','verner01@example.org','2024-05-18 04:47:35','$2y$12$I3weHb7FuQu9E1/B1kYVDOcS3bAW4yLFotXFYsOdrMx2MBcjhqE1G','pDjxNYGqBo','2024-05-18 04:47:35','2024-05-18 04:47:35'),
(20,'Lemuel Cummerata','mcglynn.jakayla@example.com','2024-05-18 04:47:35','$2y$12$I3weHb7FuQu9E1/B1kYVDOcS3bAW4yLFotXFYsOdrMx2MBcjhqE1G','lvn7mfy55b','2024-05-18 04:47:35','2024-05-18 04:47:35');

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
