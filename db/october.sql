-- --------------------------------------------------------
-- Host:                         127.0.0.1
-- Server version:               10.1.13-MariaDB - mariadb.org binary distribution
-- Server OS:                    Win32
-- HeidiSQL Version:             9.3.0.4984
-- --------------------------------------------------------


-- Dumping structure for table october.backend_access_log
CREATE TABLE IF NOT EXISTS `backend_access_log` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(10) unsigned NOT NULL,
  `ip_address` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Dumping data for table october.backend_access_log: ~3 rows (approximately)
/*!40000 ALTER TABLE `backend_access_log` DISABLE KEYS */;
REPLACE INTO `backend_access_log` (`id`, `user_id`, `ip_address`, `created_at`, `updated_at`) VALUES
	(1, 1, '127.0.0.1', '2016-09-21 03:11:52', '2016-09-21 03:11:52'),
	(2, 2, '127.0.0.1', '2016-09-21 09:50:26', '2016-09-21 09:50:26'),
	(3, 1, '127.0.0.1', '2016-09-21 09:52:24', '2016-09-21 09:52:24'),
	(4, 1, '127.0.0.1', '2017-01-04 04:41:24', '2017-01-04 04:41:24'),
	(5, 1, '127.0.0.1', '2017-01-04 08:49:36', '2017-01-04 08:49:36');
/*!40000 ALTER TABLE `backend_access_log` ENABLE KEYS */;


-- Dumping structure for table october.backend_users
CREATE TABLE IF NOT EXISTS `backend_users` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `first_name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `last_name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `login` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `password` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `activation_code` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `persist_code` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `reset_password_code` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `permissions` text COLLATE utf8_unicode_ci,
  `is_activated` tinyint(1) NOT NULL DEFAULT '0',
  `activated_at` timestamp NULL DEFAULT NULL,
  `last_login` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `is_superuser` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `login_unique` (`login`),
  UNIQUE KEY `email_unique` (`email`),
  KEY `act_code_index` (`activation_code`),
  KEY `reset_code_index` (`reset_password_code`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Dumping data for table october.backend_users: ~2 rows (approximately)
/*!40000 ALTER TABLE `backend_users` DISABLE KEYS */;
REPLACE INTO `backend_users` (`id`, `first_name`, `last_name`, `login`, `email`, `password`, `activation_code`, `persist_code`, `reset_password_code`, `permissions`, `is_activated`, `activated_at`, `last_login`, `created_at`, `updated_at`, `is_superuser`) VALUES
	(1, 'Admin', 'Person', 'kienbt', 'admin@kienbt.dev', '$2y$10$beOrzVo7jmEhwHvBOan8Y.udjpoFu7WOPaoGaOcsAq2.j6CgxDUUG', NULL, '$2y$10$aVwVNmJKBSdHo0ppkmAU3.KCGgiZdqpM2teaO9SmGFFaM2mpKUANS', NULL, '', 1, NULL, '2017-01-04 08:49:36', '2016-09-21 03:10:37', '2017-01-04 08:49:36', 1),
	(2, 'Administrator', 'Website', 'administrator', 'administrator@kienbt.dev', '$2y$10$zaRuVp1/qvu5149Rn9gmQ.8z8UQs9ujTDSA91K7pdEl.8PbBy308m', NULL, '$2y$10$jbk7fZ.S3q6vN0OEw7fBhOLyno3x7tuxY3A2juxd/f8VVrt1KHZOu', NULL, '', 0, NULL, '2016-09-21 09:50:25', '2016-09-21 09:49:23', '2016-09-21 09:50:25', 0);
/*!40000 ALTER TABLE `backend_users` ENABLE KEYS */;


-- Dumping structure for table october.backend_users_groups
CREATE TABLE IF NOT EXISTS `backend_users_groups` (
  `user_id` int(10) unsigned NOT NULL,
  `user_group_id` int(10) unsigned NOT NULL,
  PRIMARY KEY (`user_id`,`user_group_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Dumping data for table october.backend_users_groups: ~2 rows (approximately)
/*!40000 ALTER TABLE `backend_users_groups` DISABLE KEYS */;
REPLACE INTO `backend_users_groups` (`user_id`, `user_group_id`) VALUES
	(1, 2),
	(2, 2);
/*!40000 ALTER TABLE `backend_users_groups` ENABLE KEYS */;


-- Dumping structure for table october.backend_user_groups
CREATE TABLE IF NOT EXISTS `backend_user_groups` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `permissions` text COLLATE utf8_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `code` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `description` text COLLATE utf8_unicode_ci,
  `is_new_user_default` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `name_unique` (`name`),
  KEY `code_index` (`code`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Dumping data for table october.backend_user_groups: ~2 rows (approximately)
/*!40000 ALTER TABLE `backend_user_groups` DISABLE KEYS */;
REPLACE INTO `backend_user_groups` (`id`, `name`, `permissions`, `created_at`, `updated_at`, `code`, `description`, `is_new_user_default`) VALUES
	(1, 'Owners', '{"cms.manage_layouts":"1","cms.manage_partials":"1","cms.manage_themes":"1","media.manage_media":"1","cms.manage_assets":"1","cms.manage_pages":"1","cms.manage_content":"1","system.manage_updates":"1","backend.manage_editor":"1","backend.manage_preferences":"1","backend.manage_users":"1","backend.manage_branding":"1","backend.access_dashboard":"1","system.manage_mail_templates":"1","system.manage_mail_settings":"1","system.access_logs":"1","indikator.backend.trash":"1"}', '2016-09-21 03:10:37', '2016-09-21 10:01:56', 'owners', 'Default group for website owners.', 1),
	(2, 'Administrator', '{"media.manage_media":"1","rainlab.pages.manage_menus":"1","rainlab.pages.manage_pages":"1","rainlab.blog.access_categories":"1","rainlab.blog.access_other_posts":"1","rainlab.blog.access_publish":"1","rainlab.blog.access_posts":"1","rainlab.blog.access_import_export":"1","backend.manage_preferences":"1","backend.manage_users":"1","backend.manage_branding":"1","backend.access_dashboard":"1","system.manage_mail_templates":"1","system.manage_mail_settings":"1","system.access_logs":"1"}', '2016-09-21 09:48:22', '2016-09-22 02:22:36', 'administrator', '', 0);
/*!40000 ALTER TABLE `backend_user_groups` ENABLE KEYS */;


-- Dumping structure for table october.backend_user_preferences
CREATE TABLE IF NOT EXISTS `backend_user_preferences` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(10) unsigned NOT NULL,
  `namespace` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `group` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `item` varchar(150) COLLATE utf8_unicode_ci NOT NULL,
  `value` text COLLATE utf8_unicode_ci,
  PRIMARY KEY (`id`),
  KEY `user_item_index` (`user_id`,`namespace`,`group`,`item`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Dumping data for table october.backend_user_preferences: ~3 rows (approximately)
/*!40000 ALTER TABLE `backend_user_preferences` DISABLE KEYS */;
REPLACE INTO `backend_user_preferences` (`id`, `user_id`, `namespace`, `group`, `item`, `value`) VALUES
	(1, 1, 'backend', 'reportwidgets', 'dashboard', '{"welcome":{"class":"Backend\\\\ReportWidgets\\\\Welcome","sortOrder":"50","configuration":{"title":"Welcome","ocWidgetWidth":6,"ocWidgetNewRow":null}},"systemStatus":{"class":"System\\\\ReportWidgets\\\\Status","sortOrder":"60","configuration":{"title":"System status","ocWidgetWidth":6,"ocWidgetNewRow":null}},"activeTheme":{"class":"Cms\\\\ReportWidgets\\\\ActiveTheme","sortOrder":"70","configuration":{"title":"Website","ocWidgetWidth":4,"ocWidgetNewRow":null}},"report_container_dashboard_5":{"class":"Indikator\\\\Backend\\\\ReportWidgets\\\\Status","configuration":{"title":"System status plus","webpage":true,"updates":true,"plugins":true,"themes":true,"ocWidgetWidth":"3","ocWidgetNewRow":null},"sortOrder":"72"},"report_container_dashboard_6":{"class":"Indikator\\\\Backend\\\\ReportWidgets\\\\Images","configuration":{"title":"Random images","category":"nightlife","type":"simple","number":6,"width":960,"height":540,"ocWidgetWidth":"6","ocWidgetNewRow":null},"sortOrder":"73"},"report_container_dashboard_7":{"class":"Romanov\\\\ClearCacheWidget\\\\ReportWidgets\\\\ClearCache","configuration":{"title":"Clear Cache","radius":"200","delthumbs":false,"ocWidgetWidth":"3","ocWidgetNewRow":null,"nochart":null,"thumbspath":null,"thumb_regex":null},"sortOrder":"74"}}'),
	(2, 1, 'backend', 'backend', 'preferences', '{"locale":"en","fallback_locale":"en","timezone":"Asia\\/Ho_Chi_Minh","editor_font_size":"12","editor_word_wrap":"fluid","editor_code_folding":"manual","editor_tab_size":"2","editor_theme":"xcode","editor_show_invisibles":"0","editor_highlight_active_line":"1","editor_use_hard_tabs":"1","editor_show_gutter":"1","editor_auto_closing":"1","editor_autocompletion":"live","editor_enable_snippets":"0","editor_display_indent_guides":"0","editor_show_print_margin":"0","rounded_avatar":"1","topmenu_label":"0","sidebar_description":"1","sidebar_search":"1","more_themes":"1","focus_searchfield":"1","form_clearbutton":"0","virtual_keyboard":"0","delete_plugin":"0","enabled_gzip":"1","user_id":"1"}'),
	(3, 1, 'backend', 'hints', 'hidden', '{"indikator_trash_hint":1,"builder-version-rollback":1,"builder-version-apply":1}');
/*!40000 ALTER TABLE `backend_user_preferences` ENABLE KEYS */;


-- Dumping structure for table october.backend_user_throttle
CREATE TABLE IF NOT EXISTS `backend_user_throttle` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(10) unsigned DEFAULT NULL,
  `ip_address` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `attempts` int(11) NOT NULL DEFAULT '0',
  `last_attempt_at` timestamp NULL DEFAULT NULL,
  `is_suspended` tinyint(1) NOT NULL DEFAULT '0',
  `suspended_at` timestamp NULL DEFAULT NULL,
  `is_banned` tinyint(1) NOT NULL DEFAULT '0',
  `banned_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `backend_user_throttle_user_id_index` (`user_id`),
  KEY `backend_user_throttle_ip_address_index` (`ip_address`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Dumping data for table october.backend_user_throttle: ~2 rows (approximately)
/*!40000 ALTER TABLE `backend_user_throttle` DISABLE KEYS */;
REPLACE INTO `backend_user_throttle` (`id`, `user_id`, `ip_address`, `attempts`, `last_attempt_at`, `is_suspended`, `suspended_at`, `is_banned`, `banned_at`) VALUES
	(1, 1, '127.0.0.1', 0, NULL, 0, NULL, 0, NULL),
	(2, 2, '127.0.0.1', 0, NULL, 0, NULL, 0, NULL);
/*!40000 ALTER TABLE `backend_user_throttle` ENABLE KEYS */;


-- Dumping structure for table october.cache
CREATE TABLE IF NOT EXISTS `cache` (
  `key` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `value` text COLLATE utf8_unicode_ci NOT NULL,
  `expiration` int(11) NOT NULL,
  UNIQUE KEY `cache_key_unique` (`key`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Dumping data for table october.cache: ~0 rows (approximately)
/*!40000 ALTER TABLE `cache` DISABLE KEYS */;
/*!40000 ALTER TABLE `cache` ENABLE KEYS */;


-- Dumping structure for table october.cms_theme_data
CREATE TABLE IF NOT EXISTS `cms_theme_data` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `theme` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `data` mediumtext COLLATE utf8_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `cms_theme_data_theme_index` (`theme`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Dumping data for table october.cms_theme_data: ~0 rows (approximately)
/*!40000 ALTER TABLE `cms_theme_data` DISABLE KEYS */;
/*!40000 ALTER TABLE `cms_theme_data` ENABLE KEYS */;


-- Dumping structure for table october.deferred_bindings
CREATE TABLE IF NOT EXISTS `deferred_bindings` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `master_type` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `master_field` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `slave_type` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `slave_id` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `session_key` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `is_bind` tinyint(1) NOT NULL DEFAULT '1',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `deferred_bindings_master_type_index` (`master_type`),
  KEY `deferred_bindings_master_field_index` (`master_field`),
  KEY `deferred_bindings_slave_type_index` (`slave_type`),
  KEY `deferred_bindings_slave_id_index` (`slave_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Dumping data for table october.deferred_bindings: ~0 rows (approximately)
/*!40000 ALTER TABLE `deferred_bindings` DISABLE KEYS */;
/*!40000 ALTER TABLE `deferred_bindings` ENABLE KEYS */;


-- Dumping structure for table october.failed_jobs
CREATE TABLE IF NOT EXISTS `failed_jobs` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `connection` text COLLATE utf8_unicode_ci NOT NULL,
  `queue` text COLLATE utf8_unicode_ci NOT NULL,
  `payload` text COLLATE utf8_unicode_ci NOT NULL,
  `failed_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Dumping data for table october.failed_jobs: ~0 rows (approximately)
/*!40000 ALTER TABLE `failed_jobs` DISABLE KEYS */;
/*!40000 ALTER TABLE `failed_jobs` ENABLE KEYS */;


-- Dumping structure for table october.indikator_backend_trash
CREATE TABLE IF NOT EXISTS `indikator_backend_trash` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `type` varchar(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT '1',
  `path` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `size` varchar(8) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Dumping data for table october.indikator_backend_trash: ~0 rows (approximately)
/*!40000 ALTER TABLE `indikator_backend_trash` DISABLE KEYS */;
/*!40000 ALTER TABLE `indikator_backend_trash` ENABLE KEYS */;


-- Dumping structure for table october.jobs
CREATE TABLE IF NOT EXISTS `jobs` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `queue` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `payload` text COLLATE utf8_unicode_ci NOT NULL,
  `attempts` tinyint(3) unsigned NOT NULL,
  `reserved` tinyint(3) unsigned NOT NULL,
  `reserved_at` int(10) unsigned DEFAULT NULL,
  `available_at` int(10) unsigned NOT NULL,
  `created_at` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Dumping data for table october.jobs: ~0 rows (approximately)
/*!40000 ALTER TABLE `jobs` DISABLE KEYS */;
/*!40000 ALTER TABLE `jobs` ENABLE KEYS */;


-- Dumping structure for table october.kienbt_digitalproduct_categories
CREATE TABLE IF NOT EXISTS `kienbt_digitalproduct_categories` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `slug` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `meta_title` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `meta_description` text COLLATE utf8_unicode_ci NOT NULL,
  `sort_order` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `parent_id` int(11) DEFAULT NULL,
  `nest_left` int(11) DEFAULT NULL,
  `nest_right` int(11) DEFAULT NULL,
  `nest_depth` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `kienbt_digitalproduct_categories_slug_unique` (`slug`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Dumping data for table october.kienbt_digitalproduct_categories: ~0 rows (approximately)
/*!40000 ALTER TABLE `kienbt_digitalproduct_categories` DISABLE KEYS */;
/*!40000 ALTER TABLE `kienbt_digitalproduct_categories` ENABLE KEYS */;


-- Dumping structure for table october.kienbt_digitalproduct_category_product
CREATE TABLE IF NOT EXISTS `kienbt_digitalproduct_category_product` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `category_id` int(10) unsigned NOT NULL,
  `product_id` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Dumping data for table october.kienbt_digitalproduct_category_product: ~0 rows (approximately)
/*!40000 ALTER TABLE `kienbt_digitalproduct_category_product` DISABLE KEYS */;
/*!40000 ALTER TABLE `kienbt_digitalproduct_category_product` ENABLE KEYS */;


-- Dumping structure for table october.kienbt_digitalproduct_discounts
CREATE TABLE IF NOT EXISTS `kienbt_digitalproduct_discounts` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `guid` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `code` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `product_id` int(11) DEFAULT NULL,
  `total_to_reach` decimal(10,0) DEFAULT NULL,
  `type` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'Rate',
  `trigger` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'Code',
  `rate` int(10) unsigned DEFAULT NULL,
  `amount` decimal(10,0) DEFAULT NULL,
  `alternate_price` decimal(10,0) DEFAULT NULL,
  `max_number_of_usages` int(10) unsigned DEFAULT NULL,
  `expires` datetime DEFAULT NULL,
  `number_of_usages` int(10) unsigned DEFAULT NULL,
  `number_of_usages_uncompleted` int(10) unsigned DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Dumping data for table october.kienbt_digitalproduct_discounts: ~0 rows (approximately)
/*!40000 ALTER TABLE `kienbt_digitalproduct_discounts` DISABLE KEYS */;
/*!40000 ALTER TABLE `kienbt_digitalproduct_discounts` ENABLE KEYS */;


-- Dumping structure for table october.kienbt_digitalproduct_orders
CREATE TABLE IF NOT EXISTS `kienbt_digitalproduct_orders` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `token` char(36) COLLATE utf8_unicode_ci NOT NULL,
  `invoice_number` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `creation_date` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `status` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `phone` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `items_total` double(8,2) NOT NULL,
  `subtotal` double(8,2) NOT NULL,
  `notes` text COLLATE utf8_unicode_ci,
  `ip_address` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `user_id` char(36) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `kienbt_digitalproduct_orders_token_unique` (`token`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Dumping data for table october.kienbt_digitalproduct_orders: ~0 rows (approximately)
/*!40000 ALTER TABLE `kienbt_digitalproduct_orders` DISABLE KEYS */;
/*!40000 ALTER TABLE `kienbt_digitalproduct_orders` ENABLE KEYS */;


-- Dumping structure for table october.kienbt_digitalproduct_order_items
CREATE TABLE IF NOT EXISTS `kienbt_digitalproduct_order_items` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `unique_id` char(36) COLLATE utf8_unicode_ci NOT NULL,
  `product_id` int(11) NOT NULL,
  `order_id` int(11) NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `total_price` double(8,2) NOT NULL,
  `added_on` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Dumping data for table october.kienbt_digitalproduct_order_items: ~0 rows (approximately)
/*!40000 ALTER TABLE `kienbt_digitalproduct_order_items` DISABLE KEYS */;
/*!40000 ALTER TABLE `kienbt_digitalproduct_order_items` ENABLE KEYS */;


-- Dumping structure for table october.kienbt_digitalproduct_products
CREATE TABLE IF NOT EXISTS `kienbt_digitalproduct_products` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `user_defined_id` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `slug` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `price` double(8,2) NOT NULL,
  `description_short` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `description` text COLLATE utf8_unicode_ci,
  `meta_title` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `meta_description` text COLLATE utf8_unicode_ci,
  `published` tinyint(1) NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `kienbt_digitalproduct_products_slug_unique` (`slug`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Dumping data for table october.kienbt_digitalproduct_products: ~0 rows (approximately)
/*!40000 ALTER TABLE `kienbt_digitalproduct_products` DISABLE KEYS */;
/*!40000 ALTER TABLE `kienbt_digitalproduct_products` ENABLE KEYS */;


-- Dumping structure for table october.migrations
CREATE TABLE IF NOT EXISTS `migrations` (
  `migration` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Dumping data for table october.migrations: ~31 rows (approximately)
/*!40000 ALTER TABLE `migrations` DISABLE KEYS */;
REPLACE INTO `migrations` (`migration`, `batch`) VALUES
	('2013_10_01_000001_Db_Deferred_Bindings', 1),
	('2013_10_01_000002_Db_System_Files', 1),
	('2013_10_01_000003_Db_System_Plugin_Versions', 1),
	('2013_10_01_000004_Db_System_Plugin_History', 1),
	('2013_10_01_000005_Db_System_Settings', 1),
	('2013_10_01_000006_Db_System_Parameters', 1),
	('2013_10_01_000007_Db_System_Add_Disabled_Flag', 1),
	('2013_10_01_000008_Db_System_Mail_Templates', 1),
	('2013_10_01_000009_Db_System_Mail_Layouts', 1),
	('2014_10_01_000010_Db_Jobs', 1),
	('2014_10_01_000011_Db_System_Event_Logs', 1),
	('2014_10_01_000012_Db_System_Request_Logs', 1),
	('2014_10_01_000013_Db_System_Sessions', 1),
	('2015_10_01_000014_Db_System_Mail_Layout_Rename', 1),
	('2015_10_01_000015_Db_System_Add_Frozen_Flag', 1),
	('2015_10_01_000016_Db_Cache', 1),
	('2015_10_01_000017_Db_System_Revisions', 1),
	('2015_10_01_000018_Db_FailedJobs', 1),
	('2016_10_01_000019_Db_System_Plugin_History_Detail_Text', 1),
	('2016_10_01_000020_Db_System_Timestamp_Fix', 1),
	('2013_10_01_000001_Db_Backend_Users', 2),
	('2013_10_01_000002_Db_Backend_User_Groups', 2),
	('2013_10_01_000003_Db_Backend_Users_Groups', 2),
	('2013_10_01_000004_Db_Backend_User_Throttle', 2),
	('2014_01_04_000005_Db_Backend_User_Preferences', 2),
	('2014_10_01_000006_Db_Backend_Access_Log', 2),
	('2014_10_01_000007_Db_Backend_Add_Description_Field', 2),
	('2015_10_01_000008_Db_Backend_Add_Superuser_Flag', 2),
	('2016_10_01_000009_Db_Backend_Timestamp_Fix', 2),
	('2014_10_01_000001_Db_Cms_Theme_Data', 3),
	('2016_10_01_000002_Db_Cms_Timestamp_Fix', 3);
/*!40000 ALTER TABLE `migrations` ENABLE KEYS */;


-- Dumping structure for table october.offline_snipcartshop_categories
CREATE TABLE IF NOT EXISTS `offline_snipcartshop_categories` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `slug` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `meta_title` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `meta_description` text COLLATE utf8_unicode_ci NOT NULL,
  `sort_order` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `parent_id` int(11) DEFAULT NULL,
  `nest_left` int(11) DEFAULT NULL,
  `nest_right` int(11) DEFAULT NULL,
  `nest_depth` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `offline_snipcartshop_categories_slug_unique` (`slug`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Dumping data for table october.offline_snipcartshop_categories: ~0 rows (approximately)
/*!40000 ALTER TABLE `offline_snipcartshop_categories` DISABLE KEYS */;
/*!40000 ALTER TABLE `offline_snipcartshop_categories` ENABLE KEYS */;


-- Dumping structure for table october.offline_snipcartshop_category_product
CREATE TABLE IF NOT EXISTS `offline_snipcartshop_category_product` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `category_id` int(10) unsigned NOT NULL,
  `product_id` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Dumping data for table october.offline_snipcartshop_category_product: ~0 rows (approximately)
/*!40000 ALTER TABLE `offline_snipcartshop_category_product` DISABLE KEYS */;
/*!40000 ALTER TABLE `offline_snipcartshop_category_product` ENABLE KEYS */;


-- Dumping structure for table october.offline_snipcartshop_discounts
CREATE TABLE IF NOT EXISTS `offline_snipcartshop_discounts` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `guid` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `code` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `product_id` int(11) DEFAULT NULL,
  `total_to_reach` decimal(10,0) DEFAULT NULL,
  `type` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'Rate',
  `trigger` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'Code',
  `rate` int(10) unsigned DEFAULT NULL,
  `amount` decimal(10,0) DEFAULT NULL,
  `alternate_price` decimal(10,0) DEFAULT NULL,
  `max_number_of_usages` int(10) unsigned DEFAULT NULL,
  `expires` datetime DEFAULT NULL,
  `number_of_usages` int(10) unsigned DEFAULT NULL,
  `number_of_usages_uncompleted` int(10) unsigned DEFAULT NULL,
  `shipping_description` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `shipping_cost` decimal(10,0) DEFAULT NULL,
  `shipping_guaranteed_days_to_delivery` int(10) unsigned DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Dumping data for table october.offline_snipcartshop_discounts: ~0 rows (approximately)
/*!40000 ALTER TABLE `offline_snipcartshop_discounts` DISABLE KEYS */;
/*!40000 ALTER TABLE `offline_snipcartshop_discounts` ENABLE KEYS */;


-- Dumping structure for table october.offline_snipcartshop_orders
CREATE TABLE IF NOT EXISTS `offline_snipcartshop_orders` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `token` char(36) COLLATE utf8_unicode_ci NOT NULL,
  `invoice_number` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `currency` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `creation_date` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `modification_date` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `completion_date` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `status` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `payment_status` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `will_be_paid_later` tinyint(1) NOT NULL,
  `shipping_address_same_as_billing` tinyint(1) NOT NULL,
  `billing_address` text COLLATE utf8_unicode_ci NOT NULL,
  `shipping_address` text COLLATE utf8_unicode_ci NOT NULL,
  `credit_card_last4_digits` varchar(4) COLLATE utf8_unicode_ci NOT NULL,
  `tracking_number` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `tracking_url` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `shipping_fees` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `shipping_provider` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `shipping_method` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `card_holder_name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `card_type` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `payment_method` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `payment_gateway_used` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `tax_provider` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `lang` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `refunds_amount` double(8,2) DEFAULT NULL,
  `adjusted_amount` double(8,2) DEFAULT NULL,
  `rebate_amount` double(8,2) DEFAULT NULL,
  `taxes` text COLLATE utf8_unicode_ci NOT NULL,
  `items_total` double(8,2) NOT NULL,
  `subtotal` double(8,2) NOT NULL,
  `taxable_total` double(8,2) NOT NULL,
  `grand_total` double(8,2) NOT NULL,
  `total_weight` int(11) NOT NULL,
  `total_rebate_rate` int(11) NOT NULL,
  `notes` text COLLATE utf8_unicode_ci,
  `custom_fields` text COLLATE utf8_unicode_ci,
  `shipping_enabled` tinyint(1) DEFAULT NULL,
  `payment_transaction_id` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `metadata` text COLLATE utf8_unicode_ci NOT NULL,
  `ip_address` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `user_id` char(36) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `offline_snipcartshop_orders_token_unique` (`token`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Dumping data for table october.offline_snipcartshop_orders: ~0 rows (approximately)
/*!40000 ALTER TABLE `offline_snipcartshop_orders` DISABLE KEYS */;
/*!40000 ALTER TABLE `offline_snipcartshop_orders` ENABLE KEYS */;


-- Dumping structure for table october.offline_snipcartshop_order_items
CREATE TABLE IF NOT EXISTS `offline_snipcartshop_order_items` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `unique_id` char(36) COLLATE utf8_unicode_ci NOT NULL,
  `product_id` int(11) NOT NULL,
  `order_id` int(11) NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `price` double(8,2) NOT NULL,
  `total_price` double(8,2) NOT NULL,
  `quantity` int(11) NOT NULL,
  `max_quantity` int(11) NOT NULL,
  `url` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `weight` int(11) DEFAULT NULL,
  `width` int(11) DEFAULT NULL,
  `length` int(11) DEFAULT NULL,
  `height` int(11) DEFAULT NULL,
  `total_weight` double(8,2) NOT NULL,
  `description` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `image` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `stackable` tinyint(1) NOT NULL,
  `duplicatable` tinyint(1) NOT NULL,
  `shippable` tinyint(1) NOT NULL,
  `taxable` tinyint(1) NOT NULL,
  `custom_fields` text COLLATE utf8_unicode_ci NOT NULL,
  `taxes` text COLLATE utf8_unicode_ci NOT NULL,
  `added_on` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Dumping data for table october.offline_snipcartshop_order_items: ~0 rows (approximately)
/*!40000 ALTER TABLE `offline_snipcartshop_order_items` DISABLE KEYS */;
/*!40000 ALTER TABLE `offline_snipcartshop_order_items` ENABLE KEYS */;


-- Dumping structure for table october.offline_snipcartshop_products
CREATE TABLE IF NOT EXISTS `offline_snipcartshop_products` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `user_defined_id` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `slug` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `price` text COLLATE utf8_unicode_ci NOT NULL,
  `description_short` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `description` text COLLATE utf8_unicode_ci,
  `meta_title` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `meta_description` text COLLATE utf8_unicode_ci,
  `weight` int(10) unsigned DEFAULT NULL,
  `width` int(10) unsigned DEFAULT NULL,
  `length` int(10) unsigned DEFAULT NULL,
  `height` int(10) unsigned DEFAULT NULL,
  `quantity_default` int(10) unsigned DEFAULT NULL,
  `quantity_max` int(10) unsigned DEFAULT NULL,
  `quantity_min` int(10) unsigned DEFAULT NULL,
  `stock` int(11) DEFAULT '0',
  `properties` text COLLATE utf8_unicode_ci,
  `links` text COLLATE utf8_unicode_ci,
  `inventory_management_method` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'single',
  `allow_out_of_stock_purchases` tinyint(1) NOT NULL DEFAULT '0',
  `stackable` tinyint(1) NOT NULL DEFAULT '1',
  `shippable` tinyint(1) NOT NULL DEFAULT '1',
  `taxable` tinyint(1) NOT NULL DEFAULT '1',
  `published` tinyint(1) NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `offline_snipcartshop_products_slug_unique` (`slug`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Dumping data for table october.offline_snipcartshop_products: ~0 rows (approximately)
/*!40000 ALTER TABLE `offline_snipcartshop_products` DISABLE KEYS */;
/*!40000 ALTER TABLE `offline_snipcartshop_products` ENABLE KEYS */;


-- Dumping structure for table october.offline_snipcartshop_product_accessory
CREATE TABLE IF NOT EXISTS `offline_snipcartshop_product_accessory` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `product_id` int(10) unsigned NOT NULL,
  `accessory_id` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Dumping data for table october.offline_snipcartshop_product_accessory: ~0 rows (approximately)
/*!40000 ALTER TABLE `offline_snipcartshop_product_accessory` DISABLE KEYS */;
/*!40000 ALTER TABLE `offline_snipcartshop_product_accessory` ENABLE KEYS */;


-- Dumping structure for table october.offline_snipcartshop_product_custom_fields
CREATE TABLE IF NOT EXISTS `offline_snipcartshop_product_custom_fields` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `product_id` int(10) unsigned NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `type` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'text',
  `options` text COLLATE utf8_unicode_ci,
  `required` tinyint(1) NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Dumping data for table october.offline_snipcartshop_product_custom_fields: ~0 rows (approximately)
/*!40000 ALTER TABLE `offline_snipcartshop_product_custom_fields` DISABLE KEYS */;
/*!40000 ALTER TABLE `offline_snipcartshop_product_custom_fields` ENABLE KEYS */;


-- Dumping structure for table october.offline_snipcartshop_product_custom_field_options
CREATE TABLE IF NOT EXISTS `offline_snipcartshop_product_custom_field_options` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `custom_field_id` int(10) unsigned NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `price` int(11) DEFAULT NULL,
  `sort_order` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Dumping data for table october.offline_snipcartshop_product_custom_field_options: ~0 rows (approximately)
/*!40000 ALTER TABLE `offline_snipcartshop_product_custom_field_options` DISABLE KEYS */;
/*!40000 ALTER TABLE `offline_snipcartshop_product_custom_field_options` ENABLE KEYS */;


-- Dumping structure for table october.offline_snipcartshop_product_variants
CREATE TABLE IF NOT EXISTS `offline_snipcartshop_product_variants` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `product_id` int(10) unsigned NOT NULL,
  `stock` int(11) DEFAULT NULL,
  `allow_out_of_stock_purchases` tinyint(1) NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Dumping data for table october.offline_snipcartshop_product_variants: ~0 rows (approximately)
/*!40000 ALTER TABLE `offline_snipcartshop_product_variants` DISABLE KEYS */;
/*!40000 ALTER TABLE `offline_snipcartshop_product_variants` ENABLE KEYS */;


-- Dumping structure for table october.offline_snipcartshop_product_variant_custom_field_option
CREATE TABLE IF NOT EXISTS `offline_snipcartshop_product_variant_custom_field_option` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `variant_id` int(10) unsigned NOT NULL,
  `custom_field_option_id` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Dumping data for table october.offline_snipcartshop_product_variant_custom_field_option: ~0 rows (approximately)
/*!40000 ALTER TABLE `offline_snipcartshop_product_variant_custom_field_option` DISABLE KEYS */;
/*!40000 ALTER TABLE `offline_snipcartshop_product_variant_custom_field_option` ENABLE KEYS */;


-- Dumping structure for table october.rainlab_blog_categories
CREATE TABLE IF NOT EXISTS `rainlab_blog_categories` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `slug` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `code` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `description` text COLLATE utf8_unicode_ci,
  `parent_id` int(10) unsigned DEFAULT NULL,
  `nest_left` int(11) DEFAULT NULL,
  `nest_right` int(11) DEFAULT NULL,
  `nest_depth` int(11) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `rainlab_blog_categories_slug_index` (`slug`),
  KEY `rainlab_blog_categories_parent_id_index` (`parent_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Dumping data for table october.rainlab_blog_categories: ~0 rows (approximately)
/*!40000 ALTER TABLE `rainlab_blog_categories` DISABLE KEYS */;
REPLACE INTO `rainlab_blog_categories` (`id`, `name`, `slug`, `code`, `description`, `parent_id`, `nest_left`, `nest_right`, `nest_depth`, `created_at`, `updated_at`) VALUES
	(1, 'Uncategorized', 'uncategorized', NULL, NULL, NULL, 1, 2, 0, '2016-09-21 04:39:43', '2016-09-21 04:39:43');
/*!40000 ALTER TABLE `rainlab_blog_categories` ENABLE KEYS */;


-- Dumping structure for table october.rainlab_blog_posts
CREATE TABLE IF NOT EXISTS `rainlab_blog_posts` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(10) unsigned DEFAULT NULL,
  `title` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `slug` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `excerpt` text COLLATE utf8_unicode_ci,
  `content` text COLLATE utf8_unicode_ci,
  `content_html` text COLLATE utf8_unicode_ci,
  `published_at` timestamp NULL DEFAULT NULL,
  `published` tinyint(1) NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `rainlab_blog_posts_user_id_index` (`user_id`),
  KEY `rainlab_blog_posts_slug_index` (`slug`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Dumping data for table october.rainlab_blog_posts: ~3 rows (approximately)
/*!40000 ALTER TABLE `rainlab_blog_posts` DISABLE KEYS */;
REPLACE INTO `rainlab_blog_posts` (`id`, `user_id`, `title`, `slug`, `excerpt`, `content`, `content_html`, `published_at`, `published`, `created_at`, `updated_at`) VALUES
	(1, NULL, 'First blog post kien', 'first-blog-post', 'The first ever blog post is here. It might be a good idea to update this post with some more relevant content.', 'This is your first ever **blog post**! It might be a good idea to update this post with some more relevant content.\r\n\r\nYou can edit this content by selecting **Blog** from the administration back-end menu.\r\n\r\n*Enjoy the good times!*\r\n<a href="https://google.com" target="_blank">asdasd</a>', '<p>This is your first ever <strong>blog post</strong>! It might be a good idea to update this post with some more relevant content.</p>\n<p>You can edit this content by selecting <strong>Blog</strong> from the administration back-end menu.</p>\n<p><em>Enjoy the good times!</em>\n<a href="https://google.com" target="_blank">asdasd</a></p>', '2016-09-21 04:39:43', 1, '2016-09-21 04:39:43', '2016-11-05 06:59:03'),
	(2, 1, 'The second post', 'the-second-post', '', 'second post here', '<p>second post here</p>', '2016-12-19 04:55:18', 1, '2016-09-22 02:47:15', '2016-12-19 04:55:20'),
	(3, 1, 'hello world', 'hello-world', '', 'missing someone????', '<p>missing someone????</p>', '2016-11-05 07:54:02', 1, '2016-11-05 07:53:49', '2016-11-05 07:54:04');
/*!40000 ALTER TABLE `rainlab_blog_posts` ENABLE KEYS */;


-- Dumping structure for table october.rainlab_blog_posts_categories
CREATE TABLE IF NOT EXISTS `rainlab_blog_posts_categories` (
  `post_id` int(10) unsigned NOT NULL,
  `category_id` int(10) unsigned NOT NULL,
  PRIMARY KEY (`post_id`,`category_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Dumping data for table october.rainlab_blog_posts_categories: ~2 rows (approximately)
/*!40000 ALTER TABLE `rainlab_blog_posts_categories` DISABLE KEYS */;
REPLACE INTO `rainlab_blog_posts_categories` (`post_id`, `category_id`) VALUES
	(1, 1),
	(2, 1);
/*!40000 ALTER TABLE `rainlab_blog_posts_categories` ENABLE KEYS */;


-- Dumping structure for table october.rainlab_translate_attributes
CREATE TABLE IF NOT EXISTS `rainlab_translate_attributes` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `locale` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `model_id` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `model_type` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `attribute_data` mediumtext COLLATE utf8_unicode_ci,
  PRIMARY KEY (`id`),
  KEY `rainlab_translate_attributes_locale_index` (`locale`),
  KEY `rainlab_translate_attributes_model_id_index` (`model_id`),
  KEY `rainlab_translate_attributes_model_type_index` (`model_type`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Dumping data for table october.rainlab_translate_attributes: ~0 rows (approximately)
/*!40000 ALTER TABLE `rainlab_translate_attributes` DISABLE KEYS */;
/*!40000 ALTER TABLE `rainlab_translate_attributes` ENABLE KEYS */;


-- Dumping structure for table october.rainlab_translate_indexes
CREATE TABLE IF NOT EXISTS `rainlab_translate_indexes` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `locale` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `model_id` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `model_type` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `item` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `value` mediumtext COLLATE utf8_unicode_ci,
  PRIMARY KEY (`id`),
  KEY `rainlab_translate_indexes_locale_index` (`locale`),
  KEY `rainlab_translate_indexes_model_id_index` (`model_id`),
  KEY `rainlab_translate_indexes_model_type_index` (`model_type`),
  KEY `rainlab_translate_indexes_item_index` (`item`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Dumping data for table october.rainlab_translate_indexes: ~0 rows (approximately)
/*!40000 ALTER TABLE `rainlab_translate_indexes` DISABLE KEYS */;
/*!40000 ALTER TABLE `rainlab_translate_indexes` ENABLE KEYS */;


-- Dumping structure for table october.rainlab_translate_locales
CREATE TABLE IF NOT EXISTS `rainlab_translate_locales` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `code` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `is_default` tinyint(1) NOT NULL DEFAULT '0',
  `is_enabled` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `rainlab_translate_locales_code_index` (`code`),
  KEY `rainlab_translate_locales_name_index` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Dumping data for table october.rainlab_translate_locales: ~1 rows (approximately)
/*!40000 ALTER TABLE `rainlab_translate_locales` DISABLE KEYS */;
REPLACE INTO `rainlab_translate_locales` (`id`, `code`, `name`, `is_default`, `is_enabled`) VALUES
	(1, 'en', 'English', 1, 1);
/*!40000 ALTER TABLE `rainlab_translate_locales` ENABLE KEYS */;


-- Dumping structure for table october.rainlab_translate_messages
CREATE TABLE IF NOT EXISTS `rainlab_translate_messages` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `code` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `message_data` mediumtext COLLATE utf8_unicode_ci,
  PRIMARY KEY (`id`),
  KEY `rainlab_translate_messages_code_index` (`code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Dumping data for table october.rainlab_translate_messages: ~0 rows (approximately)
/*!40000 ALTER TABLE `rainlab_translate_messages` DISABLE KEYS */;
/*!40000 ALTER TABLE `rainlab_translate_messages` ENABLE KEYS */;


-- Dumping structure for table october.sessions
CREATE TABLE IF NOT EXISTS `sessions` (
  `id` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `payload` text COLLATE utf8_unicode_ci,
  `last_activity` int(11) DEFAULT NULL,
  UNIQUE KEY `sessions_id_unique` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Dumping data for table october.sessions: ~0 rows (approximately)
/*!40000 ALTER TABLE `sessions` DISABLE KEYS */;
/*!40000 ALTER TABLE `sessions` ENABLE KEYS */;


-- Dumping structure for table october.system_event_logs
CREATE TABLE IF NOT EXISTS `system_event_logs` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `level` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `message` text COLLATE utf8_unicode_ci,
  `details` mediumtext COLLATE utf8_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `system_event_logs_level_index` (`level`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Dumping data for table october.system_event_logs: ~7 rows (approximately)
/*!40000 ALTER TABLE `system_event_logs` DISABLE KEYS */;
REPLACE INTO `system_event_logs` (`id`, `level`, `message`, `details`, `created_at`, `updated_at`) VALUES
	(1, 'warning', '[OFFLINE.ResponsiveImages] Could not process image http://cms.kienbt.dev/themes/responsiv-flat/assets/images/blog/post2.jpg', NULL, '2016-11-05 04:03:56', '2016-11-05 04:03:56'),
	(2, 'warning', '[OFFLINE.ResponsiveImages] Could not process image http://cms.kienbt.dev/themes/responsiv-flat/assets/images/portfolio/thumbs/project4.jpg', NULL, '2016-11-05 04:12:21', '2016-11-05 04:12:21'),
	(3, 'error', 'exception \'Symfony\\Component\\Debug\\Exception\\FatalErrorException\' with message \'syntax error, unexpected \'url\' (T_STRING), expecting function (T_FUNCTION)\' in D:\\xampp\\htdocs\\install-master\\storage\\cms\\cache\\64\\27\\blog.htm.php:4\nStack trace:\n#0 {main}', NULL, '2016-11-05 07:19:12', '2016-11-05 07:19:12'),
	(4, 'error', 'exception \'Twig_Error_Syntax\' with message \'Unexpected "dump" tag (expecting closing tag for the "for" tag defined near line 12) in "D:\\xampp\\htdocs\\install-master/themes/responsiv-flat/pages/blog/blog.htm" at line 12.\' in D:\\xampp\\htdocs\\install-master\\vendor\\twig\\twig\\lib\\Twig\\Parser.php:172\nStack trace:\n#0 D:\\xampp\\htdocs\\install-master\\vendor\\twig\\twig\\lib\\Twig\\TokenParser\\For.php(40): Twig_Parser->subparse(Array)\n#1 D:\\xampp\\htdocs\\install-master\\vendor\\twig\\twig\\lib\\Twig\\Parser.php(187): Twig_TokenParser_For->parse(Object(Twig_Token))\n#2 D:\\xampp\\htdocs\\install-master\\vendor\\twig\\twig\\lib\\Twig\\Parser.php(100): Twig_Parser->subparse(NULL, false)\n#3 D:\\xampp\\htdocs\\install-master\\vendor\\twig\\twig\\lib\\Twig\\Environment.php(645): Twig_Parser->parse(Object(Twig_TokenStream))\n#4 D:\\xampp\\htdocs\\install-master\\vendor\\twig\\twig\\lib\\Twig\\Environment.php(705): Twig_Environment->parse(Object(Twig_TokenStream))\n#5 D:\\xampp\\htdocs\\install-master\\vendor\\twig\\twig\\lib\\Twig\\Environment.php(406): Twig_Environment->compileSource(\'<section id="la...\', \'D:\\\\xampp\\\\htdocs...\')\n#6 D:\\xampp\\htdocs\\install-master\\modules\\cms\\classes\\Controller.php(376): Twig_Environment->loadTemplate(\'D:\\\\xampp\\\\htdocs...\')\n#7 D:\\xampp\\htdocs\\install-master\\modules\\cms\\classes\\Controller.php(215): Cms\\Classes\\Controller->runPage(Object(Cms\\Classes\\Page))\n#8 D:\\xampp\\htdocs\\install-master\\modules\\cms\\classes\\CmsController.php(48): Cms\\Classes\\Controller->run(\'blog\')\n#9 [internal function]: Cms\\Classes\\CmsController->run(\'blog\')\n#10 D:\\xampp\\htdocs\\install-master\\vendor\\laravel\\framework\\src\\Illuminate\\Routing\\Controller.php(256): call_user_func_array(Array, Array)\n#11 D:\\xampp\\htdocs\\install-master\\vendor\\laravel\\framework\\src\\Illuminate\\Routing\\ControllerDispatcher.php(164): Illuminate\\Routing\\Controller->callAction(\'run\', Array)\n#12 D:\\xampp\\htdocs\\install-master\\vendor\\laravel\\framework\\src\\Illuminate\\Routing\\ControllerDispatcher.php(112): Illuminate\\Routing\\ControllerDispatcher->call(Object(Cms\\Classes\\CmsController), Object(Illuminate\\Routing\\Route), \'run\')\n#13 [internal function]: Illuminate\\Routing\\ControllerDispatcher->Illuminate\\Routing\\{closure}(Object(Illuminate\\Http\\Request))\n#14 D:\\xampp\\htdocs\\install-master\\vendor\\laravel\\framework\\src\\Illuminate\\Pipeline\\Pipeline.php(139): call_user_func(Object(Closure), Object(Illuminate\\Http\\Request))\n#15 [internal function]: Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}(Object(Illuminate\\Http\\Request))\n#16 D:\\xampp\\htdocs\\install-master\\vendor\\laravel\\framework\\src\\Illuminate\\Pipeline\\Pipeline.php(103): call_user_func(Object(Closure), Object(Illuminate\\Http\\Request))\n#17 D:\\xampp\\htdocs\\install-master\\vendor\\laravel\\framework\\src\\Illuminate\\Routing\\ControllerDispatcher.php(114): Illuminate\\Pipeline\\Pipeline->then(Object(Closure))\n#18 D:\\xampp\\htdocs\\install-master\\vendor\\laravel\\framework\\src\\Illuminate\\Routing\\ControllerDispatcher.php(69): Illuminate\\Routing\\ControllerDispatcher->callWithinStack(Object(Cms\\Classes\\CmsController), Object(Illuminate\\Routing\\Route), Object(Illuminate\\Http\\Request), \'run\')\n#19 D:\\xampp\\htdocs\\install-master\\vendor\\laravel\\framework\\src\\Illuminate\\Routing\\Route.php(203): Illuminate\\Routing\\ControllerDispatcher->dispatch(Object(Illuminate\\Routing\\Route), Object(Illuminate\\Http\\Request), \'Cms\\\\Classes\\\\Cms...\', \'run\')\n#20 D:\\xampp\\htdocs\\install-master\\vendor\\laravel\\framework\\src\\Illuminate\\Routing\\Route.php(134): Illuminate\\Routing\\Route->runWithCustomDispatcher(Object(Illuminate\\Http\\Request))\n#21 D:\\xampp\\htdocs\\install-master\\vendor\\laravel\\framework\\src\\Illuminate\\Routing\\Router.php(708): Illuminate\\Routing\\Route->run(Object(Illuminate\\Http\\Request))\n#22 [internal function]: Illuminate\\Routing\\Router->Illuminate\\Routing\\{closure}(Object(Illuminate\\Http\\Request))\n#23 D:\\xampp\\htdocs\\install-master\\vendor\\laravel\\framework\\src\\Illuminate\\Pipeline\\Pipeline.php(139): call_user_func(Object(Closure), Object(Illuminate\\Http\\Request))\n#24 [internal function]: Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}(Object(Illuminate\\Http\\Request))\n#25 D:\\xampp\\htdocs\\install-master\\vendor\\laravel\\framework\\src\\Illuminate\\Pipeline\\Pipeline.php(103): call_user_func(Object(Closure), Object(Illuminate\\Http\\Request))\n#26 D:\\xampp\\htdocs\\install-master\\vendor\\laravel\\framework\\src\\Illuminate\\Routing\\Router.php(710): Illuminate\\Pipeline\\Pipeline->then(Object(Closure))\n#27 D:\\xampp\\htdocs\\install-master\\vendor\\laravel\\framework\\src\\Illuminate\\Routing\\Router.php(675): Illuminate\\Routing\\Router->runRouteWithinStack(Object(Illuminate\\Routing\\Route), Object(Illuminate\\Http\\Request))\n#28 D:\\xampp\\htdocs\\install-master\\vendor\\laravel\\framework\\src\\Illuminate\\Routing\\Router.php(635): Illuminate\\Routing\\Router->dispatchToRoute(Object(Illuminate\\Http\\Request))\n#29 D:\\xampp\\htdocs\\install-master\\vendor\\laravel\\framework\\src\\Illuminate\\Foundation\\Http\\Kernel.php(236): Illuminate\\Routing\\Router->dispatch(Object(Illuminate\\Http\\Request))\n#30 [internal function]: Illuminate\\Foundation\\Http\\Kernel->Illuminate\\Foundation\\Http\\{closure}(Object(Illuminate\\Http\\Request))\n#31 D:\\xampp\\htdocs\\install-master\\vendor\\laravel\\framework\\src\\Illuminate\\Pipeline\\Pipeline.php(139): call_user_func(Object(Closure), Object(Illuminate\\Http\\Request))\n#32 D:\\xampp\\htdocs\\install-master\\plugins\\offline\\responsiveimages\\classes\\ResponsiveImagesMiddleware.php(28): Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}(Object(Illuminate\\Http\\Request))\n#33 [internal function]: OFFLINE\\ResponsiveImages\\Classes\\ResponsiveImagesMiddleware->handle(Object(Illuminate\\Http\\Request), Object(Closure))\n#34 D:\\xampp\\htdocs\\install-master\\vendor\\laravel\\framework\\src\\Illuminate\\Pipeline\\Pipeline.php(124): call_user_func_array(Array, Array)\n#35 D:\\xampp\\htdocs\\install-master\\vendor\\laravel\\framework\\src\\Illuminate\\View\\Middleware\\ShareErrorsFromSession.php(49): Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}(Object(Illuminate\\Http\\Request))\n#36 [internal function]: Illuminate\\View\\Middleware\\ShareErrorsFromSession->handle(Object(Illuminate\\Http\\Request), Object(Closure))\n#37 D:\\xampp\\htdocs\\install-master\\vendor\\laravel\\framework\\src\\Illuminate\\Pipeline\\Pipeline.php(124): call_user_func_array(Array, Array)\n#38 D:\\xampp\\htdocs\\install-master\\vendor\\laravel\\framework\\src\\Illuminate\\Session\\Middleware\\StartSession.php(62): Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}(Object(Illuminate\\Http\\Request))\n#39 [internal function]: Illuminate\\Session\\Middleware\\StartSession->handle(Object(Illuminate\\Http\\Request), Object(Closure))\n#40 D:\\xampp\\htdocs\\install-master\\vendor\\laravel\\framework\\src\\Illuminate\\Pipeline\\Pipeline.php(124): call_user_func_array(Array, Array)\n#41 D:\\xampp\\htdocs\\install-master\\vendor\\laravel\\framework\\src\\Illuminate\\Cookie\\Middleware\\AddQueuedCookiesToResponse.php(37): Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}(Object(Illuminate\\Http\\Request))\n#42 [internal function]: Illuminate\\Cookie\\Middleware\\AddQueuedCookiesToResponse->handle(Object(Illuminate\\Http\\Request), Object(Closure))\n#43 D:\\xampp\\htdocs\\install-master\\vendor\\laravel\\framework\\src\\Illuminate\\Pipeline\\Pipeline.php(124): call_user_func_array(Array, Array)\n#44 D:\\xampp\\htdocs\\install-master\\vendor\\laravel\\framework\\src\\Illuminate\\Cookie\\Middleware\\EncryptCookies.php(59): Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}(Object(Illuminate\\Http\\Request))\n#45 [internal function]: Illuminate\\Cookie\\Middleware\\EncryptCookies->handle(Object(Illuminate\\Http\\Request), Object(Closure))\n#46 D:\\xampp\\htdocs\\install-master\\vendor\\laravel\\framework\\src\\Illuminate\\Pipeline\\Pipeline.php(124): call_user_func_array(Array, Array)\n#47 D:\\xampp\\htdocs\\install-master\\vendor\\laravel\\framework\\src\\Illuminate\\Foundation\\Http\\Middleware\\CheckForMaintenanceMode.php(44): Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}(Object(Illuminate\\Http\\Request))\n#48 [internal function]: Illuminate\\Foundation\\Http\\Middleware\\CheckForMaintenanceMode->handle(Object(Illuminate\\Http\\Request), Object(Closure))\n#49 D:\\xampp\\htdocs\\install-master\\vendor\\laravel\\framework\\src\\Illuminate\\Pipeline\\Pipeline.php(124): call_user_func_array(Array, Array)\n#50 [internal function]: Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}(Object(Illuminate\\Http\\Request))\n#51 D:\\xampp\\htdocs\\install-master\\vendor\\laravel\\framework\\src\\Illuminate\\Pipeline\\Pipeline.php(103): call_user_func(Object(Closure), Object(Illuminate\\Http\\Request))\n#52 D:\\xampp\\htdocs\\install-master\\vendor\\laravel\\framework\\src\\Illuminate\\Foundation\\Http\\Kernel.php(122): Illuminate\\Pipeline\\Pipeline->then(Object(Closure))\n#53 D:\\xampp\\htdocs\\install-master\\vendor\\laravel\\framework\\src\\Illuminate\\Foundation\\Http\\Kernel.php(87): Illuminate\\Foundation\\Http\\Kernel->sendRequestThroughRouter(Object(Illuminate\\Http\\Request))\n#54 D:\\xampp\\htdocs\\install-master\\index.php(44): Illuminate\\Foundation\\Http\\Kernel->handle(Object(Illuminate\\Http\\Request))\n#55 {main}', NULL, '2016-11-05 08:31:09', '2016-11-05 08:31:09'),
	(5, 'error', 'exception \'Symfony\\Component\\Debug\\Exception\\FatalErrorException\' with message \'syntax error, unexpected \'123123\' (T_LNUMBER), expecting function (T_FUNCTION)\' in D:\\xampp\\htdocs\\install-master\\storage\\cms\\cache\\64\\27\\blog.htm.php:4\nStack trace:\n#0 {main}', NULL, '2016-11-05 09:16:39', '2016-11-05 09:16:39'),
	(6, 'error', 'exception \'Symfony\\Component\\Debug\\Exception\\FatalErrorException\' with message \'Class \'RainLab\\Translate\\Behaviors\\TranslatableModel\' not found\' in D:\\xampp\\htdocs\\install-master\\vendor\\october\\rain\\src\\Extension\\ExtendableTrait.php:196\nStack trace:\n#0 {main}', NULL, '2017-01-04 04:32:33', '2017-01-04 04:32:33'),
	(7, 'error', 'exception \'Exception\' with message \'Stop everything!!! This file already exists: D:\\xampp\\htdocs\\install-master/plugins/kienbt/digitalproduct/Plugin.php\' in D:\\xampp\\htdocs\\install-master\\vendor\\october\\rain\\src\\Scaffold\\GeneratorCommand.php:117\nStack trace:\n#0 D:\\xampp\\htdocs\\install-master\\vendor\\october\\rain\\src\\Scaffold\\GeneratorCommand.php(84): October\\Rain\\Scaffold\\GeneratorCommand->makeStub(\'plugin/plugin.s...\')\n#1 D:\\xampp\\htdocs\\install-master\\vendor\\october\\rain\\src\\Scaffold\\GeneratorCommand.php(62): October\\Rain\\Scaffold\\GeneratorCommand->makeStubs()\n#2 [internal function]: October\\Rain\\Scaffold\\GeneratorCommand->fire()\n#3 D:\\xampp\\htdocs\\install-master\\vendor\\laravel\\framework\\src\\Illuminate\\Container\\Container.php(507): call_user_func_array(Array, Array)\n#4 D:\\xampp\\htdocs\\install-master\\vendor\\laravel\\framework\\src\\Illuminate\\Console\\Command.php(150): Illuminate\\Container\\Container->call(Array)\n#5 D:\\xampp\\htdocs\\install-master\\vendor\\symfony\\console\\Command\\Command.php(256): Illuminate\\Console\\Command->execute(Object(Symfony\\Component\\Console\\Input\\ArgvInput), Object(Symfony\\Component\\Console\\Output\\ConsoleOutput))\n#6 D:\\xampp\\htdocs\\install-master\\vendor\\laravel\\framework\\src\\Illuminate\\Console\\Command.php(136): Symfony\\Component\\Console\\Command\\Command->run(Object(Symfony\\Component\\Console\\Input\\ArgvInput), Object(Symfony\\Component\\Console\\Output\\ConsoleOutput))\n#7 D:\\xampp\\htdocs\\install-master\\vendor\\symfony\\console\\Application.php(846): Illuminate\\Console\\Command->run(Object(Symfony\\Component\\Console\\Input\\ArgvInput), Object(Symfony\\Component\\Console\\Output\\ConsoleOutput))\n#8 D:\\xampp\\htdocs\\install-master\\vendor\\symfony\\console\\Application.php(190): Symfony\\Component\\Console\\Application->doRunCommand(Object(October\\Rain\\Scaffold\\Console\\CreatePlugin), Object(Symfony\\Component\\Console\\Input\\ArgvInput), Object(Symfony\\Component\\Console\\Output\\ConsoleOutput))\n#9 D:\\xampp\\htdocs\\install-master\\vendor\\symfony\\console\\Application.php(121): Symfony\\Component\\Console\\Application->doRun(Object(Symfony\\Component\\Console\\Input\\ArgvInput), Object(Symfony\\Component\\Console\\Output\\ConsoleOutput))\n#10 D:\\xampp\\htdocs\\install-master\\vendor\\laravel\\framework\\src\\Illuminate\\Foundation\\Console\\Kernel.php(107): Symfony\\Component\\Console\\Application->run(Object(Symfony\\Component\\Console\\Input\\ArgvInput), Object(Symfony\\Component\\Console\\Output\\ConsoleOutput))\n#11 D:\\xampp\\htdocs\\install-master\\artisan(36): Illuminate\\Foundation\\Console\\Kernel->handle(Object(Symfony\\Component\\Console\\Input\\ArgvInput), Object(Symfony\\Component\\Console\\Output\\ConsoleOutput))\n#12 {main}', NULL, '2017-01-04 04:58:37', '2017-01-04 04:58:37');
/*!40000 ALTER TABLE `system_event_logs` ENABLE KEYS */;


-- Dumping structure for table october.system_files
CREATE TABLE IF NOT EXISTS `system_files` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `disk_name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `file_name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `file_size` int(11) NOT NULL,
  `content_type` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `title` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `description` text COLLATE utf8_unicode_ci,
  `field` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `attachment_id` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `attachment_type` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `is_public` tinyint(1) NOT NULL DEFAULT '1',
  `sort_order` int(11) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `system_files_field_index` (`field`),
  KEY `system_files_attachment_id_index` (`attachment_id`),
  KEY `system_files_attachment_type_index` (`attachment_type`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Dumping data for table october.system_files: ~2 rows (approximately)
/*!40000 ALTER TABLE `system_files` DISABLE KEYS */;
REPLACE INTO `system_files` (`id`, `disk_name`, `file_name`, `file_size`, `content_type`, `title`, `description`, `field`, `attachment_id`, `attachment_type`, `is_public`, `sort_order`, `created_at`, `updated_at`) VALUES
	(1, '57e21569ee843572886196.jpg', 'picture.jpg', 25720, 'image/jpeg', NULL, NULL, 'avatar', '1', 'Backend\\Models\\User', 1, 1, '2016-09-21 05:06:50', '2016-09-21 05:06:52'),
	(2, '581d810846277317699376.jpg', 'picture.jpg', 25720, 'image/jpeg', NULL, NULL, 'featured_images', '1', 'RainLab\\Blog\\Models\\Post', 1, 1, '2016-11-05 06:49:44', '2016-11-05 07:13:55');
/*!40000 ALTER TABLE `system_files` ENABLE KEYS */;


-- Dumping structure for table october.system_mail_layouts
CREATE TABLE IF NOT EXISTS `system_mail_layouts` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `code` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `content_html` text COLLATE utf8_unicode_ci,
  `content_text` text COLLATE utf8_unicode_ci,
  `content_css` text COLLATE utf8_unicode_ci,
  `is_locked` tinyint(1) NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Dumping data for table october.system_mail_layouts: ~2 rows (approximately)
/*!40000 ALTER TABLE `system_mail_layouts` DISABLE KEYS */;
REPLACE INTO `system_mail_layouts` (`id`, `name`, `code`, `content_html`, `content_text`, `content_css`, `is_locked`, `created_at`, `updated_at`) VALUES
	(1, 'Default', 'default', '<html>\n    <head>\n        <style type="text/css" media="screen">\n            {{ css|raw }}\n        </style>\n    </head>\n    <body>\n        {{ content|raw }}\n    </body>\n</html>', '{{ content|raw }}', 'a, a:hover {\n    text-decoration: none;\n    color: #0862A2;\n    font-weight: bold;\n}\n\ntd, tr, th, table {\n    padding: 0px;\n    margin: 0px;\n}\n\np {\n    margin: 10px 0;\n}', 1, '2016-09-21 03:10:36', '2016-09-21 03:10:36'),
	(2, 'System', 'system', '<html>\n    <head>\n        <style type="text/css" media="screen">\n            {{ css|raw }}\n        </style>\n    </head>\n    <body>\n        {{ content|raw }}\n        <hr />\n        <p>This is an automatic message. Please do not reply to it.</p>\n    </body>\n</html>', '{{ content|raw }}\n\n\n---\nThis is an automatic message. Please do not reply to it.', 'a, a:hover {\n    text-decoration: none;\n    color: #0862A2;\n    font-weight: bold;\n}\n\ntd, tr, th, table {\n    padding: 0px;\n    margin: 0px;\n}\n\np {\n    margin: 10px 0;\n}', 1, '2016-09-21 03:10:36', '2016-09-21 03:10:36');
/*!40000 ALTER TABLE `system_mail_layouts` ENABLE KEYS */;


-- Dumping structure for table october.system_mail_templates
CREATE TABLE IF NOT EXISTS `system_mail_templates` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `code` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `subject` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `description` text COLLATE utf8_unicode_ci,
  `content_html` text COLLATE utf8_unicode_ci,
  `content_text` text COLLATE utf8_unicode_ci,
  `layout_id` int(11) DEFAULT NULL,
  `is_custom` tinyint(1) NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `system_mail_templates_layout_id_index` (`layout_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Dumping data for table october.system_mail_templates: ~2 rows (approximately)
/*!40000 ALTER TABLE `system_mail_templates` DISABLE KEYS */;
REPLACE INTO `system_mail_templates` (`id`, `code`, `subject`, `description`, `content_html`, `content_text`, `layout_id`, `is_custom`, `created_at`, `updated_at`) VALUES
	(1, 'backend::mail.invite', NULL, 'Invitation for newly created administrators.', NULL, NULL, 2, 0, '2016-09-21 10:04:25', '2016-09-21 10:04:25'),
	(2, 'backend::mail.restore', NULL, 'Password reset instructions for backend-end administrators.', NULL, NULL, 2, 0, '2016-09-21 10:04:25', '2016-09-21 10:04:25');
/*!40000 ALTER TABLE `system_mail_templates` ENABLE KEYS */;


-- Dumping structure for table october.system_parameters
CREATE TABLE IF NOT EXISTS `system_parameters` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `namespace` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `group` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `item` varchar(150) COLLATE utf8_unicode_ci NOT NULL,
  `value` text COLLATE utf8_unicode_ci,
  PRIMARY KEY (`id`),
  KEY `item_index` (`namespace`,`group`,`item`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Dumping data for table october.system_parameters: ~5 rows (approximately)
/*!40000 ALTER TABLE `system_parameters` DISABLE KEYS */;
REPLACE INTO `system_parameters` (`id`, `namespace`, `group`, `item`, `value`) VALUES
	(1, 'system', 'update', 'count', '0'),
	(2, 'system', 'core', 'hash', '"305de721d2f8e9580ef858a799dea70b"'),
	(3, 'system', 'core', 'build', '"382"'),
	(4, 'system', 'update', 'retry', '1483585567'),
	(5, 'system', 'theme', 'history', '{"Responsiv.Flat":"responsiv-flat"}'),
	(6, 'cms', 'theme', 'active', '"responsiv-flat"');
/*!40000 ALTER TABLE `system_parameters` ENABLE KEYS */;


-- Dumping structure for table october.system_plugin_history
CREATE TABLE IF NOT EXISTS `system_plugin_history` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `code` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `type` varchar(20) COLLATE utf8_unicode_ci NOT NULL,
  `version` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `detail` text COLLATE utf8_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `system_plugin_history_code_index` (`code`),
  KEY `system_plugin_history_type_index` (`type`)
) ENGINE=InnoDB AUTO_INCREMENT=253 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Dumping data for table october.system_plugin_history: ~230 rows (approximately)
/*!40000 ALTER TABLE `system_plugin_history` DISABLE KEYS */;
REPLACE INTO `system_plugin_history` (`id`, `code`, `type`, `version`, `detail`, `created_at`) VALUES
	(1, 'October.Demo', 'comment', '1.0.1', 'First version of Demo', '2016-09-21 03:10:36'),
	(2, 'Indikator.Backend', 'comment', '1.0.0', 'First version of Backend Plus.', '2016-09-21 03:58:53'),
	(3, 'Indikator.Backend', 'comment', '1.0.1', 'Fixed the update count issue.', '2016-09-21 03:58:54'),
	(4, 'Indikator.Backend', 'comment', '1.0.2', 'Added Last logins widget.', '2016-09-21 03:58:54'),
	(5, 'Indikator.Backend', 'comment', '1.0.3', 'Added RSS viewer widget.', '2016-09-21 03:58:54'),
	(6, 'Indikator.Backend', 'comment', '1.0.4', 'Minor improvements and bugfix.', '2016-09-21 03:58:54'),
	(7, 'Indikator.Backend', 'comment', '1.0.5', 'Added Random images widget.', '2016-09-21 03:58:54'),
	(8, 'Indikator.Backend', 'comment', '1.0.6', 'Added virtual keyboard option.', '2016-09-21 03:58:54'),
	(9, 'Indikator.Backend', 'script', '1.1.0', 'Improving the Random images widget with slideshow.', '2016-09-21 03:58:54'),
	(10, 'Indikator.Backend', 'script', '1.1.0', 'Added Turkish translation (thanks to mahony0).', '2016-09-21 03:58:54'),
	(11, 'Indikator.Backend', 'script', '1.1.0', 'Fixed the URL path issue by virtual keyboard.', '2016-09-21 03:58:54'),
	(12, 'Indikator.Backend', 'comment', '1.1.0', 'Added Lorem ipsum components (image and text).', '2016-09-21 03:58:54'),
	(13, 'Indikator.Backend', 'comment', '1.1.1', 'Hide the "Find more themes" link.', '2016-09-21 03:58:54'),
	(14, 'Indikator.Backend', 'comment', '1.1.2', 'Added German translation.', '2016-09-21 03:58:54'),
	(15, 'Indikator.Backend', 'comment', '1.1.3', 'The widgets work on localhost too.', '2016-09-21 03:58:54'),
	(16, 'Indikator.Backend', 'comment', '1.1.4', 'Added Spanish translation (thanks to jh2odo).', '2016-09-21 03:58:54'),
	(17, 'Indikator.Backend', 'comment', '1.2.0', 'All features are working on the whole backend.', '2016-09-21 03:58:55'),
	(18, 'Indikator.Backend', 'comment', '1.2.1', 'Rounded profile image is optional in top menu.', '2016-09-21 03:58:55'),
	(19, 'Indikator.Backend', 'comment', '1.2.2', 'Fixed the authenticated user bug.', '2016-09-21 03:58:55'),
	(20, 'Indikator.Backend', 'comment', '1.2.3', 'Hide the Media menu optional in top menu.', '2016-09-21 03:58:55'),
	(21, 'Indikator.Backend', 'comment', '1.2.4', 'Minor improvements and bugfix.', '2016-09-21 03:58:55'),
	(22, 'Indikator.Backend', 'comment', '1.2.5', 'Renamed the name of backend widgets.', '2016-09-21 03:58:55'),
	(23, 'Indikator.Backend', 'comment', '1.2.6', 'Improved the automatic search focus.', '2016-09-21 03:58:55'),
	(24, 'Indikator.Backend', 'comment', '1.2.7', 'Minor improvements.', '2016-09-21 03:58:55'),
	(25, 'Indikator.Backend', 'comment', '1.2.8', 'Fixed the hiding Media menu issue.', '2016-09-21 03:58:55'),
	(26, 'Indikator.Backend', 'comment', '1.2.9', 'Improved the widget exception handling.', '2016-09-21 03:58:56'),
	(27, 'Indikator.Backend', 'comment', '1.3.0', 'Added 2 new options for Settings.', '2016-09-21 03:58:56'),
	(28, 'Indikator.Backend', 'comment', '1.3.1', 'Fixed the search field hide issue.', '2016-09-21 03:58:56'),
	(29, 'Indikator.Backend', 'comment', '1.3.2', 'Delete only demo folder instead of october.', '2016-09-21 03:58:56'),
	(30, 'Indikator.Backend', 'comment', '1.3.3', 'Added clear button option to form fields.', '2016-09-21 03:58:56'),
	(31, 'Indikator.Backend', 'comment', '1.3.4', 'Improved the Media menu hiding.', '2016-09-21 03:58:56'),
	(32, 'Indikator.Backend', 'comment', '1.3.5', 'Fixed the automatically focus option.', '2016-09-21 03:58:56'),
	(33, 'Indikator.Backend', 'comment', '1.3.6', 'Added the Cache dashboard widget.', '2016-09-21 03:58:56'),
	(34, 'Indikator.Backend', 'comment', '1.4.0', 'Added 2 new form widgets.', '2016-09-21 03:58:57'),
	(35, 'Indikator.Backend', 'comment', '1.4.1', 'Added new colorpicker form widget.', '2016-09-21 03:58:57'),
	(36, 'Indikator.Backend', 'comment', '1.4.2', 'Minor improvements.', '2016-09-21 03:58:57'),
	(37, 'Indikator.Backend', 'comment', '1.4.3', 'Improved the Cache dashboard widget.', '2016-09-21 03:58:57'),
	(38, 'Indikator.Backend', 'comment', '1.4.4', 'Updated for latest October.', '2016-09-21 03:58:57'),
	(39, 'Indikator.Backend', 'comment', '1.4.5', 'Minor improvements and bugfix.', '2016-09-21 03:58:57'),
	(40, 'Indikator.Backend', 'comment', '1.4.6', 'Improved the UI and fixed bug.', '2016-09-21 03:58:57'),
	(41, 'Indikator.Backend', 'comment', '1.4.7', 'Hide the label in top menu.', '2016-09-21 03:58:57'),
	(42, 'Indikator.Backend', 'comment', '1.4.8', 'Enable the gzip compression.', '2016-09-21 03:58:58'),
	(43, 'Indikator.Backend', 'script', '1.5.0', 'create_trash_table.php', '2016-09-21 03:58:59'),
	(44, 'Indikator.Backend', 'comment', '1.5.0', 'Delete the unused files and folders.', '2016-09-21 03:58:59'),
	(45, 'Indikator.Backend', 'comment', '1.5.1', 'Minor improvements and bugfix.', '2016-09-21 03:58:59'),
	(46, 'Indikator.Backend', 'comment', '1.5.2', 'Improved the Trash items page.', '2016-09-21 03:58:59'),
	(47, 'RainLab.Blog', 'script', '1.0.1', 'create_posts_table.php', '2016-09-21 04:39:41'),
	(48, 'RainLab.Blog', 'script', '1.0.1', 'create_categories_table.php', '2016-09-21 04:39:43'),
	(49, 'RainLab.Blog', 'script', '1.0.1', 'seed_all_tables.php', '2016-09-21 04:39:43'),
	(50, 'RainLab.Blog', 'comment', '1.0.1', 'Initialize plugin.', '2016-09-21 04:39:43'),
	(51, 'RainLab.Blog', 'comment', '1.0.2', 'Added the processed HTML content column to the posts table.', '2016-09-21 04:39:43'),
	(52, 'RainLab.Blog', 'comment', '1.0.3', 'Category component has been merged with Posts component.', '2016-09-21 04:39:43'),
	(53, 'RainLab.Blog', 'comment', '1.0.4', 'Improvements to the Posts list management UI.', '2016-09-21 04:39:43'),
	(54, 'RainLab.Blog', 'comment', '1.0.5', 'Removes the Author column from blog post list.', '2016-09-21 04:39:43'),
	(55, 'RainLab.Blog', 'comment', '1.0.6', 'Featured images now appear in the Post component.', '2016-09-21 04:39:43'),
	(56, 'RainLab.Blog', 'comment', '1.0.7', 'Added support for the Static Pages menus.', '2016-09-21 04:39:44'),
	(57, 'RainLab.Blog', 'comment', '1.0.8', 'Added total posts to category list.', '2016-09-21 04:39:44'),
	(58, 'RainLab.Blog', 'comment', '1.0.9', 'Added support for the Sitemap plugin.', '2016-09-21 04:39:44'),
	(59, 'RainLab.Blog', 'comment', '1.0.10', 'Added permission to prevent users from seeing posts they did not create.', '2016-09-21 04:39:44'),
	(60, 'RainLab.Blog', 'comment', '1.0.11', 'Deprecate "idParam" component property in favour of "slug" property.', '2016-09-21 04:39:44'),
	(61, 'RainLab.Blog', 'comment', '1.0.12', 'Fixes issue where images cannot be uploaded caused by latest Markdown library.', '2016-09-21 04:39:44'),
	(62, 'RainLab.Blog', 'comment', '1.0.13', 'Fixes problem with providing pages to Sitemap and Pages plugins.', '2016-09-21 04:39:44'),
	(63, 'RainLab.Blog', 'comment', '1.0.14', 'Add support for CSRF protection feature added to core.', '2016-09-21 04:39:44'),
	(64, 'RainLab.Blog', 'comment', '1.1.0', 'Replaced the Post editor with the new core Markdown editor.', '2016-09-21 04:39:44'),
	(65, 'RainLab.Blog', 'comment', '1.1.1', 'Posts can now be imported and exported.', '2016-09-21 04:39:45'),
	(66, 'RainLab.Blog', 'comment', '1.1.2', 'Posts are no longer visible if the published date has not passed.', '2016-09-21 04:39:45'),
	(67, 'RainLab.Blog', 'comment', '1.1.3', 'Added a New Post shortcut button to the blog menu.', '2016-09-21 04:39:45'),
	(68, 'RainLab.Blog', 'script', '1.2.0', 'categories_add_nested_fields.php', '2016-09-21 04:39:45'),
	(69, 'RainLab.Blog', 'comment', '1.2.0', 'Categories now support nesting.', '2016-09-21 04:39:46'),
	(70, 'RainLab.Blog', 'comment', '1.2.1', 'Post slugs now must be unique.', '2016-09-21 04:39:46'),
	(71, 'RainLab.Blog', 'comment', '1.2.2', 'Fixes issue on new installs.', '2016-09-21 04:39:46'),
	(72, 'RainLab.Blog', 'comment', '1.2.3', 'Minor user interface update.', '2016-09-21 04:39:46'),
	(73, 'RainLab.Blog', 'script', '1.2.4', 'update_timestamp_nullable.php', '2016-09-21 04:39:46'),
	(74, 'RainLab.Blog', 'comment', '1.2.4', 'Database maintenance. Updated all timestamp columns to be nullable.', '2016-09-21 04:39:46'),
	(75, 'RainLab.Blog', 'comment', '1.2.5', 'Added translation support for blog posts.', '2016-09-21 04:39:46'),
	(76, 'RainLab.Blog', 'comment', '1.2.6', 'The published field can now supply a time with the date.', '2016-09-21 04:39:46'),
	(77, 'RainLab.Blog', 'comment', '1.2.7', 'Introduced a new RSS feed component.', '2016-09-21 04:39:46'),
	(78, 'RainLab.Blog', 'comment', '1.2.8', 'Fixes issue with translated `content_html` attribute on blog posts.', '2016-09-21 04:39:46'),
	(79, 'RainLab.Blog', 'comment', '1.2.9', 'Added translation support for blog categories.', '2016-09-21 04:39:46'),
	(80, 'RainLab.Pages', 'comment', '1.0.1', 'Implemented the static pages management and the Static Page component.', '2016-09-21 04:54:41'),
	(81, 'RainLab.Pages', 'comment', '1.0.2', 'Fixed the page preview URL.', '2016-09-21 04:54:41'),
	(82, 'RainLab.Pages', 'comment', '1.0.3', 'Implemented menus.', '2016-09-21 04:54:41'),
	(83, 'RainLab.Pages', 'comment', '1.0.4', 'Implemented the content block management and placeholder support.', '2016-09-21 04:54:41'),
	(84, 'RainLab.Pages', 'comment', '1.0.5', 'Added support for the Sitemap plugin.', '2016-09-21 04:54:41'),
	(85, 'RainLab.Pages', 'comment', '1.0.6', 'Minor updates to the internal API.', '2016-09-21 04:54:41'),
	(86, 'RainLab.Pages', 'comment', '1.0.7', 'Added the Snippets feature.', '2016-09-21 04:54:42'),
	(87, 'RainLab.Pages', 'comment', '1.0.8', 'Minor improvements to the code.', '2016-09-21 04:54:42'),
	(88, 'RainLab.Pages', 'comment', '1.0.9', 'Fixes issue where Snippet tab is missing from the Partials form.', '2016-09-21 04:54:42'),
	(89, 'RainLab.Pages', 'comment', '1.0.10', 'Add translations for various locales.', '2016-09-21 04:54:42'),
	(90, 'RainLab.Pages', 'comment', '1.0.11', 'Fixes issue where placeholders tabs were missing from Page form.', '2016-09-21 04:54:42'),
	(91, 'RainLab.Pages', 'comment', '1.0.12', 'Implement Media Manager support.', '2016-09-21 04:54:42'),
	(92, 'RainLab.Pages', 'script', '1.1.0', 'snippets_rename_viewbag_properties.php', '2016-09-21 04:54:42'),
	(93, 'RainLab.Pages', 'comment', '1.1.0', 'Adds meta title and description to pages. Adds |staticPage filter.', '2016-09-21 04:54:42'),
	(94, 'RainLab.Pages', 'comment', '1.1.1', 'Add support for Syntax Fields.', '2016-09-21 04:54:42'),
	(95, 'RainLab.Pages', 'comment', '1.1.2', 'Static Breadcrumbs component now respects the hide from navigation setting.', '2016-09-21 04:54:42'),
	(96, 'RainLab.Pages', 'comment', '1.1.3', 'Minor back-end styling fix.', '2016-09-21 04:54:42'),
	(97, 'RainLab.Pages', 'comment', '1.1.4', 'Minor fix to the StaticPage component API.', '2016-09-21 04:54:42'),
	(98, 'RainLab.Pages', 'comment', '1.1.5', 'Fixes bug when using syntax fields.', '2016-09-21 04:54:42'),
	(99, 'RainLab.Pages', 'comment', '1.1.6', 'Minor styling fix to the back-end UI.', '2016-09-21 04:54:42'),
	(100, 'RainLab.Pages', 'comment', '1.1.7', 'Improved menu item form to include css class, open in a new window and hidden flag.', '2016-09-21 04:54:43'),
	(101, 'RainLab.Pages', 'comment', '1.1.8', 'Improved the output of snippet partials when saved.', '2016-09-21 04:54:43'),
	(102, 'RainLab.Pages', 'comment', '1.1.9', 'Minor update to snippet inspector internal API.', '2016-09-21 04:54:43'),
	(103, 'RainLab.Pages', 'comment', '1.1.10', 'Fixes a bug where selecting a layout causes permanent unsaved changes.', '2016-09-21 04:54:43'),
	(104, 'RainLab.Pages', 'comment', '1.1.11', 'Add support for repeater syntax field.', '2016-09-21 04:54:43'),
	(105, 'RainLab.Pages', 'comment', '1.2.0', 'Added support for translations, UI updates.', '2016-09-21 04:54:43'),
	(106, 'RainLab.Pages', 'comment', '1.2.1', 'Use nice titles when listing the content files.', '2016-09-21 04:54:43'),
	(107, 'RainLab.Pages', 'comment', '1.2.2', 'Minor styling update.', '2016-09-21 04:54:43'),
	(108, 'RainLab.Pages', 'comment', '1.2.3', 'Snippets can now be moved by dragging them.', '2016-09-21 04:54:43'),
	(109, 'RainLab.Pages', 'comment', '1.2.4', 'Fixes a bug where the cursor is misplaced when editing text files.', '2016-09-21 04:54:43'),
	(110, 'RainLab.Pages', 'comment', '1.2.5', 'Fixes a bug where the parent page is lost upon changing a page layout.', '2016-09-21 04:54:43'),
	(111, 'RainLab.Pages', 'comment', '1.2.6', 'Shared view variables are now passed to static pages.', '2016-09-21 04:54:43'),
	(112, 'RainLab.Pages', 'comment', '1.2.7', 'Fixes issue with duplicating properties when adding multiple snippets on the same page.', '2016-09-21 04:54:43'),
	(113, 'RainLab.Pages', 'comment', '1.2.8', 'Fixes a bug where creating a content block without extension doesn\'t save the contents to file.', '2016-09-21 04:54:43'),
	(114, 'RainLab.Pages', 'comment', '1.2.9', 'Add conditional support for translating page URLs.', '2016-09-21 04:54:43'),
	(115, 'Romanov.ClearCacheWidget', 'comment', '1.0.1', 'First version of ClearCacheWidget', '2016-09-21 07:18:57'),
	(116, 'Romanov.ClearCacheWidget', 'comment', '1.0.2', 'Translate for brazilian portuguese', '2016-09-21 07:18:57'),
	(117, 'Romanov.ClearCacheWidget', 'comment', '1.0.3', 'Some fix', '2016-09-21 07:18:57'),
	(118, 'Romanov.ClearCacheWidget', 'comment', '1.0.4', 'Fix chart', '2016-09-21 07:18:57'),
	(119, 'Romanov.ClearCacheWidget', 'comment', '1.0.5', 'Add chart size property', '2016-09-21 07:18:57'),
	(120, 'Romanov.ClearCacheWidget', 'comment', '1.0.6', 'Add cs_CZ locale', '2016-09-21 07:18:57'),
	(121, 'Romanov.ClearCacheWidget', 'comment', '1.1.0', 'Added functionality to delete thumbs images. (set up in widget settings)', '2016-09-21 07:18:57'),
	(122, 'Romanov.ClearCacheWidget', 'comment', '1.1.1', 'Ability to specify the path to the folder preview. (set up in widget settings)', '2016-09-21 07:18:57'),
	(123, 'Romanov.ClearCacheWidget', 'comment', '1.1.2', 'Some fix. For those who use PHP version below 5.5', '2016-09-21 07:18:57'),
	(124, 'Romanov.ClearCacheWidget', 'comment', '1.1.3', 'Update cs_CZ locale', '2016-09-21 07:18:57'),
	(125, 'Romanov.ClearCacheWidget', 'comment', '1.1.4', 'Fix ErrorException', '2016-09-21 07:18:57'),
	(126, 'Romanov.ClearCacheWidget', 'comment', '1.1.5', 'Add french and italian locales', '2016-09-21 07:18:58'),
	(127, 'Romanov.ClearCacheWidget', 'comment', '1.2.0', 'Add property \'Regex for thumb file names\'', '2016-09-21 07:18:58'),
	(128, 'Romanov.ClearCacheWidget', 'comment', '1.2.1', 'Add the Hungarian translation', '2016-09-21 07:18:58'),
	(129, 'OFFLINE.ResponsiveImages', 'comment', '1.0.1', 'First version of ResponsiveImages', '2016-09-21 07:36:42'),
	(130, 'OFFLINE.ResponsiveImages', 'script', '1.0.2', 'Fixed broken media manager when using custom backend url', '2016-09-21 07:36:43'),
	(131, 'OFFLINE.ResponsiveImages', 'comment', '1.0.2', 'Fixed encoding problems', '2016-09-21 07:36:43'),
	(132, 'OFFLINE.ResponsiveImages', 'comment', '1.0.3', 'Added alternative-src config option to support jQuery.lazyLoad plugin', '2016-09-21 07:36:43'),
	(133, 'Mey.Breadcrumbs', 'comment', '1.0.1', 'First version of Breadcrumbs', '2016-09-21 09:01:15'),
	(134, 'Mey.Breadcrumbs', 'comment', '1.0.2', 'Update how the menu works', '2016-09-21 09:01:15'),
	(135, 'Mey.Breadcrumbs', 'comment', '1.0.3', 'Add the option to set the crumb title using a DOM element that lives on the page. This is helpful for pages that use :slug type routing.', '2016-09-21 09:01:16'),
	(136, 'Mey.Breadcrumbs', 'comment', '1.0.4', 'Pages are now sorted by title in the dropdown menu in the breadcrumbs tab.', '2016-09-21 09:01:16'),
	(137, 'Mey.Breadcrumbs', 'comment', '1.0.5', 'Update to fix the page sorting issue. Pages now sort alphabetically in the dropdown menu. Also a better icon choice.', '2016-09-21 09:01:16'),
	(138, 'Mey.Breadcrumbs', 'comment', '1.0.6', 'Internal updates and bug fixes.', '2016-09-21 09:01:16'),
	(139, 'Mey.Breadcrumbs', 'comment', '1.0.7', 'Bug fix for those who use element titles. Now no error will be thrown if the element does not exist on the page.', '2016-09-21 09:01:16'),
	(140, 'Mey.Breadcrumbs', 'comment', '1.0.8', 'Updated menu to be much more logical. Also gave some more context to he menu dropdown.', '2016-09-21 09:01:16'),
	(141, 'Mey.Breadcrumbs', 'comment', '1.0.9', 'Update to be compatible with the latest october build.', '2016-09-21 09:01:17'),
	(142, 'Mey.Breadcrumbs', 'comment', '1.0.10', 'Fix for compatibility with 286 build.', '2016-09-21 09:01:17'),
	(143, 'Indikator.Backend', 'comment', '1.5.3', 'Expanded the Trash items page.', '2016-11-05 04:00:30'),
	(144, 'Indikator.Backend', 'comment', '1.5.4', 'Minor improvements.', '2016-11-05 04:00:30'),
	(145, 'Indikator.Backend', 'comment', '1.5.5', 'Added tooltip when hiding the labels.', '2016-11-05 04:00:30'),
	(146, 'Indikator.Backend', 'comment', '1.5.6', 'Fixed the page overflow issue.', '2016-11-05 04:00:30'),
	(147, 'OFFLINE.ResponsiveImages', 'comment', '1.0.4', 'Fixed handling of filenames containing spaces (Thanks to webeks!)', '2016-11-05 04:00:30'),
	(148, 'OFFLINE.ResponsiveImages', 'comment', '1.1.0', 'Added settings page, support for lazy-loading plugins and responsive class attributes', '2016-11-05 04:00:30'),
	(149, 'OFFLINE.ResponsiveImages', 'comment', '1.1.1', 'Added compatibility with current edgeUpdate builds', '2016-11-05 04:00:30'),
	(150, 'RainLab.Blog', 'comment', '1.2.10', 'Added translation support for post slugs.', '2016-11-05 04:00:30'),
	(151, 'RainLab.Blog', 'comment', '1.2.11', 'Fixes bug where excerpt is not translated.', '2016-11-05 04:00:30'),
	(152, 'RainLab.Blog', 'comment', '1.2.12', 'Description field added to category form.', '2016-11-05 04:00:30'),
	(153, 'RainLab.Blog', 'comment', '1.2.13', 'Improved support for Static Pages menus, added a blog post and all blog posts.', '2016-11-05 04:00:30'),
	(154, 'RainLab.Pages', 'comment', '1.2.10', 'Streamline generation of URLs to use the new Cms::url helper.', '2016-11-05 04:00:31'),
	(155, 'Indikator.Backend', 'comment', '1.5.7', 'Added the context menu feature.', '2016-12-19 04:26:47'),
	(156, 'Indikator.Backend', 'comment', '1.5.8', 'Improved the context menu.', '2016-12-19 04:26:47'),
	(157, 'RainLab.Blog', 'comment', '1.2.14', 'Added post exception property to the post list component, useful for showing related posts.', '2016-12-19 04:26:47'),
	(158, 'RainLab.Pages', 'comment', '1.2.11', 'Implements repeater usage with translate plugin.', '2016-12-19 04:26:48'),
	(159, 'RainLab.Pages', 'comment', '1.2.12', 'Fixes minor issue when using snippets and switching the application locale.', '2016-12-19 04:26:48'),
	(160, 'OFFLINE.SnipcartShop', 'script', '1.0.1', 'builder_table_create_offline_snipcartshop_products.php', '2017-01-04 04:13:54'),
	(161, 'OFFLINE.SnipcartShop', 'script', '1.0.1', 'builder_table_create_offline_snipcartshop_product_variants.php', '2017-01-04 04:13:55'),
	(162, 'OFFLINE.SnipcartShop', 'script', '1.0.1', 'builder_table_create_offline_snipcartshop_product_custom_fields.php', '2017-01-04 04:13:55'),
	(163, 'OFFLINE.SnipcartShop', 'script', '1.0.1', 'builder_table_create_offline_snipcartshop_product_custom_field_options.php', '2017-01-04 04:13:55'),
	(164, 'OFFLINE.SnipcartShop', 'script', '1.0.1', 'builder_table_create_offline_snipcartshop_product_variant_custom_field_option.php', '2017-01-04 04:13:56'),
	(165, 'OFFLINE.SnipcartShop', 'script', '1.0.1', 'builder_table_create_offline_snipcartshop_categories.php', '2017-01-04 04:13:57'),
	(166, 'OFFLINE.SnipcartShop', 'script', '1.0.1', 'builder_table_create_offline_snipcartshop_category_product.php', '2017-01-04 04:13:57'),
	(167, 'OFFLINE.SnipcartShop', 'script', '1.0.1', 'builder_table_create_offline_snipcartshop_orders.php', '2017-01-04 04:13:57'),
	(168, 'OFFLINE.SnipcartShop', 'script', '1.0.1', 'builder_table_create_offline_snipcartshop_order_items.php', '2017-01-04 04:13:58'),
	(169, 'OFFLINE.SnipcartShop', 'script', '1.0.1', 'builder_table_create_offline_snipcartshop_discounts.php', '2017-01-04 04:13:58'),
	(170, 'OFFLINE.SnipcartShop', 'comment', '1.0.1', 'Initial release.', '2017-01-04 04:13:58'),
	(171, 'OFFLINE.SnipcartShop', 'script', '1.0.2', 'builder_table_update_offline_snipcartshop_products.php', '2017-01-04 04:13:59'),
	(172, 'OFFLINE.SnipcartShop', 'comment', '1.0.2', 'Added support for product attributes, downloads and links // Optimized price validation', '2017-01-04 04:13:59'),
	(173, 'OFFLINE.SnipcartShop', 'script', '1.0.3', 'builder_table_create_offline_snipcartshop_product_accessory.php', '2017-01-04 04:13:59'),
	(174, 'OFFLINE.SnipcartShop', 'comment', '1.0.3', 'Added support for product accessories', '2017-01-04 04:13:59'),
	(175, 'RainLab.Translate', 'script', '1.0.1', 'create_messages_table.php', '2017-01-04 04:32:56'),
	(176, 'RainLab.Translate', 'script', '1.0.1', 'create_attributes_table.php', '2017-01-04 04:32:58'),
	(177, 'RainLab.Translate', 'script', '1.0.1', 'create_locales_table.php', '2017-01-04 04:32:59'),
	(178, 'RainLab.Translate', 'script', '1.0.1', 'seed_all_tables.php', '2017-01-04 04:32:59'),
	(179, 'RainLab.Translate', 'comment', '1.0.1', 'First version of Translate', '2017-01-04 04:32:59'),
	(180, 'RainLab.Translate', 'comment', '1.0.2', 'Languages and Messages can now be deleted.', '2017-01-04 04:32:59'),
	(181, 'RainLab.Translate', 'comment', '1.0.3', 'Minor updates for latest October release.', '2017-01-04 04:32:59'),
	(182, 'RainLab.Translate', 'comment', '1.0.4', 'Locale cache will clear when updating a language.', '2017-01-04 04:33:00'),
	(183, 'RainLab.Translate', 'comment', '1.0.5', 'Add Spanish language and fix plugin config.', '2017-01-04 04:33:00'),
	(184, 'RainLab.Translate', 'comment', '1.0.6', 'Minor improvements to the code.', '2017-01-04 04:33:00'),
	(185, 'RainLab.Translate', 'comment', '1.0.7', 'Fixes major bug where translations are skipped entirely!', '2017-01-04 04:33:00'),
	(186, 'RainLab.Translate', 'comment', '1.0.8', 'Minor bug fixes.', '2017-01-04 04:33:00'),
	(187, 'RainLab.Translate', 'comment', '1.0.9', 'Fixes an issue where newly created models lose their translated values.', '2017-01-04 04:33:00'),
	(188, 'RainLab.Translate', 'comment', '1.0.10', 'Minor fix for latest build.', '2017-01-04 04:33:00'),
	(189, 'RainLab.Translate', 'comment', '1.0.11', 'Fix multilingual rich editor when used in stretch mode.', '2017-01-04 04:33:00'),
	(190, 'RainLab.Translate', 'comment', '1.1.0', 'Introduce compatibility with RainLab.Pages plugin.', '2017-01-04 04:33:00'),
	(191, 'RainLab.Translate', 'comment', '1.1.1', 'Minor UI fix to the language picker.', '2017-01-04 04:33:00'),
	(192, 'RainLab.Translate', 'comment', '1.1.2', 'Add support for translating Static Content files.', '2017-01-04 04:33:00'),
	(193, 'RainLab.Translate', 'comment', '1.1.3', 'Improved support for the multilingual rich editor.', '2017-01-04 04:33:00'),
	(194, 'RainLab.Translate', 'comment', '1.1.4', 'Adds new multilingual markdown editor.', '2017-01-04 04:33:00'),
	(195, 'RainLab.Translate', 'comment', '1.1.5', 'Minor update to the multilingual control API.', '2017-01-04 04:33:00'),
	(196, 'RainLab.Translate', 'comment', '1.1.6', 'Minor improvements in the message editor.', '2017-01-04 04:33:01'),
	(197, 'RainLab.Translate', 'comment', '1.1.7', 'Fixes bug not showing content when first loading multilingual textarea controls.', '2017-01-04 04:33:01'),
	(198, 'RainLab.Translate', 'comment', '1.2.0', 'CMS pages now support translating the URL.', '2017-01-04 04:33:01'),
	(199, 'RainLab.Translate', 'comment', '1.2.1', 'Minor update in the rich editor and code editor language control position.', '2017-01-04 04:33:01'),
	(200, 'RainLab.Translate', 'comment', '1.2.2', 'Static Pages now support translating the URL.', '2017-01-04 04:33:01'),
	(201, 'RainLab.Translate', 'comment', '1.2.3', 'Fixes Rich Editor when inserting a page link.', '2017-01-04 04:33:01'),
	(202, 'RainLab.Translate', 'script', '1.2.4', 'create_indexes_table.php', '2017-01-04 04:33:03'),
	(203, 'RainLab.Translate', 'comment', '1.2.4', 'Translatable attributes can now be declared as indexes.', '2017-01-04 04:33:03'),
	(204, 'RainLab.Translate', 'comment', '1.2.5', 'Adds new multilingual repeater form widget.', '2017-01-04 04:33:03'),
	(205, 'RainLab.Translate', 'comment', '1.2.6', 'Fixes repeater usage with static pages plugin.', '2017-01-04 04:33:03'),
	(206, 'RainLab.Translate', 'comment', '1.2.7', 'Fixes placeholder usage with static pages plugin.', '2017-01-04 04:33:03'),
	(208, 'RainLab.Builder', 'comment', '1.0.1', 'Initialize plugin.', '2017-01-04 07:03:58'),
	(209, 'RainLab.Builder', 'comment', '1.0.2', 'Fixes the problem with selecting a plugin. Minor localization corrections. Configuration files in the list and form behaviors are now autocomplete.', '2017-01-04 07:03:58'),
	(210, 'RainLab.Builder', 'comment', '1.0.3', 'Improved handling of the enum data type.', '2017-01-04 07:03:58'),
	(211, 'RainLab.Builder', 'comment', '1.0.4', 'Added user permissions to work with the Builder.', '2017-01-04 07:03:58'),
	(212, 'RainLab.Builder', 'comment', '1.0.5', 'Fixed permissions registration.', '2017-01-04 07:03:58'),
	(213, 'RainLab.Builder', 'comment', '1.0.6', 'Fixed front-end record ordering in the Record List component.', '2017-01-04 07:03:58'),
	(214, 'RainLab.Builder', 'comment', '1.0.7', 'Builder settings are now protected with user permissions. The database table column list is scrollable now. Minor code cleanup.', '2017-01-04 07:03:58'),
	(215, 'RainLab.Builder', 'comment', '1.0.8', 'Added the Reorder Controller behavior.', '2017-01-04 07:03:58'),
	(216, 'RainLab.Builder', 'comment', '1.0.9', 'Minor API and UI updates.', '2017-01-04 07:03:58'),
	(217, 'RainLab.Builder', 'comment', '1.0.10', 'Minor styling update.', '2017-01-04 07:03:58'),
	(218, 'RainLab.Builder', 'comment', '1.0.11', 'Fixed a bug where clicking placeholder in a repeater would open Inspector. Fixed a problem with saving forms with repeaters in tabs. Minor style fix.', '2017-01-04 07:03:58'),
	(232, 'Kienbt.Digitalproduct', 'comment', '1.0.1', 'Initialize plugin.', '2017-01-04 07:40:19'),
	(233, 'Kienbt.Digitalproduct', 'script', '1.0.2', 'builder_table_create_kienbt_digitalproduct_categories.php', '2017-01-04 07:40:20'),
	(234, 'Kienbt.Digitalproduct', 'comment', '1.0.2', 'Created table kienbt_digitalproduct_categories', '2017-01-04 07:40:20'),
	(235, 'Kienbt.Digitalproduct', 'script', '1.0.3', 'builder_table_create_kienbt_digitalproduct_category_product.php', '2017-01-04 07:41:46'),
	(236, 'Kienbt.Digitalproduct', 'comment', '1.0.3', 'Created table kienbt_digitalproduct_category_product', '2017-01-04 07:41:46'),
	(239, 'Kienbt.Digitalproduct', 'script', '1.0.4', 'builder_table_create_kienbt_digitalproduct_discounts.php', '2017-01-04 07:49:22'),
	(240, 'Kienbt.Digitalproduct', 'comment', '1.0.4', 'Created table kienbt_digitalproduct_discounts', '2017-01-04 07:49:22'),
	(243, 'Kienbt.Digitalproduct', 'script', '1.0.5', 'builder_table_create_kienbt_digitalproduct_order_items.php', '2017-01-04 07:57:45'),
	(244, 'Kienbt.Digitalproduct', 'comment', '1.0.5', 'Created table kienbt_digitalproduct_order_items', '2017-01-04 07:57:45'),
	(247, 'Kienbt.Digitalproduct', 'script', '1.0.6', 'builder_table_create_kienbt_digitalproduct_orders.php', '2017-01-04 08:15:27'),
	(248, 'Kienbt.Digitalproduct', 'comment', '1.0.6', 'Created table kienbt_digitalproduct_orders', '2017-01-04 08:15:27'),
	(251, 'Kienbt.Digitalproduct', 'script', '1.0.7', 'builder_table_create_kienbt_digitalproduct_products.php', '2017-01-04 08:38:49'),
	(252, 'Kienbt.Digitalproduct', 'comment', '1.0.7', 'Created table kienbt_digitalproduct_products', '2017-01-04 08:38:50');
/*!40000 ALTER TABLE `system_plugin_history` ENABLE KEYS */;


-- Dumping structure for table october.system_plugin_versions
CREATE TABLE IF NOT EXISTS `system_plugin_versions` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `code` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `version` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `is_disabled` tinyint(1) NOT NULL DEFAULT '0',
  `is_frozen` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `system_plugin_versions_code_index` (`code`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Dumping data for table october.system_plugin_versions: ~11 rows (approximately)
/*!40000 ALTER TABLE `system_plugin_versions` DISABLE KEYS */;
REPLACE INTO `system_plugin_versions` (`id`, `code`, `version`, `created_at`, `is_disabled`, `is_frozen`) VALUES
	(1, 'October.Demo', '1.0.1', '2016-09-21 03:10:36', 0, 0),
	(2, 'Indikator.Backend', '1.5.8', '2016-12-19 04:26:47', 0, 0),
	(3, 'RainLab.Blog', '1.2.14', '2016-12-19 04:26:47', 0, 0),
	(4, 'RainLab.Pages', '1.2.12', '2016-12-19 04:26:48', 0, 0),
	(5, 'Romanov.ClearCacheWidget', '1.2.1', '2016-09-21 07:18:58', 0, 0),
	(6, 'OFFLINE.ResponsiveImages', '1.1.1', '2016-11-05 04:00:30', 0, 0),
	(7, 'Mey.Breadcrumbs', '1.0.10', '2016-09-21 09:01:17', 0, 0),
	(8, 'OFFLINE.SnipcartShop', '1.0.3', '2017-01-04 04:13:59', 0, 0),
	(9, 'RainLab.Translate', '1.2.7', '2017-01-04 04:33:03', 0, 0),
	(11, 'RainLab.Builder', '1.0.11', '2017-01-04 07:03:59', 0, 0),
	(13, 'Kienbt.Digitalproduct', '1.0.7', '2017-01-04 08:38:50', 0, 0);
/*!40000 ALTER TABLE `system_plugin_versions` ENABLE KEYS */;


-- Dumping structure for table october.system_request_logs
CREATE TABLE IF NOT EXISTS `system_request_logs` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `status_code` int(11) DEFAULT NULL,
  `url` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `referer` text COLLATE utf8_unicode_ci,
  `count` int(11) NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Dumping data for table october.system_request_logs: ~9 rows (approximately)
/*!40000 ALTER TABLE `system_request_logs` DISABLE KEYS */;
REPLACE INTO `system_request_logs` (`id`, `status_code`, `url`, `referer`, `count`, `created_at`, `updated_at`) VALUES
	(1, 404, 'http://cms.kienbt.dev/install_files/images/leaves.png', '["http:\\/\\/cms.kienbt.dev\\/install_files\\/css\\/vendor.css"]', 1, '2016-09-21 03:10:45', '2016-09-21 03:10:45'),
	(2, 404, 'http://cms.kienbt.dev/backend/rainlab/css/theme.css', '["http:\\/\\/cms.kienbt.dev\\/backend\\/rainlab\\/pages"]', 1, '2016-09-21 04:55:48', '2016-09-21 04:55:48'),
	(3, 404, 'http://cms.kienbt.dev/themes/responsiv-flat/assets/images/switch/mask.png', '["http:\\/\\/cms.kienbt.dev\\/combine\\/7d9b6aecf5a0f739c1f0d44be8e017ec-1474444171"]', 4, '2016-09-21 08:12:50', '2016-12-19 04:51:20'),
	(4, 404, 'http://cms.kienbt.dev/first-blog-post', NULL, 2, '2016-09-21 09:20:16', '2016-11-05 06:50:07'),
	(5, 404, 'http://cms.kienbt.dev/favicon.ico', '["http:\\/\\/cms.kienbt.dev\\/backend\\/backend\\/auth\\/signin"]', 6, '2016-09-21 09:50:18', '2017-01-04 08:49:29'),
	(6, 404, 'http://cms.kienbt.dev/404', '["http:\\/\\/cms.kienbt.dev\\/signin"]', 2, '2016-11-05 04:10:50', '2016-11-05 04:11:15'),
	(7, 404, 'http://cms.kienbt.dev/first-blog-post.html', NULL, 1, '2016-11-05 06:50:13', '2016-11-05 06:50:13'),
	(8, 404, 'http://cms.kienbt.dev/blog/first-blog-post', NULL, 1, '2016-11-05 07:15:52', '2016-11-05 07:15:52'),
	(9, 404, 'http://cms.kienbt.dev/blog/first-blog-post.html', NULL, 1, '2016-11-05 07:15:56', '2016-11-05 07:15:56'),
	(10, 404, 'http://cms.kienbt.dev/blog/post/first-blog-post', NULL, 1, '2016-11-05 07:16:02', '2016-11-05 07:16:02'),
	(11, 404, 'http://cms.kienbt.dev/blog/post/first-blog-post.html', NULL, 1, '2016-11-05 07:16:06', '2016-11-05 07:16:06');
/*!40000 ALTER TABLE `system_request_logs` ENABLE KEYS */;


-- Dumping structure for table october.system_revisions
CREATE TABLE IF NOT EXISTS `system_revisions` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(10) unsigned DEFAULT NULL,
  `field` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `cast` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `old_value` text COLLATE utf8_unicode_ci,
  `new_value` text COLLATE utf8_unicode_ci,
  `revisionable_type` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `revisionable_id` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `system_revisions_revisionable_id_revisionable_type_index` (`revisionable_id`,`revisionable_type`),
  KEY `system_revisions_user_id_index` (`user_id`),
  KEY `system_revisions_field_index` (`field`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Dumping data for table october.system_revisions: ~0 rows (approximately)
/*!40000 ALTER TABLE `system_revisions` DISABLE KEYS */;
/*!40000 ALTER TABLE `system_revisions` ENABLE KEYS */;


-- Dumping structure for table october.system_settings
CREATE TABLE IF NOT EXISTS `system_settings` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `item` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `value` mediumtext COLLATE utf8_unicode_ci,
  PRIMARY KEY (`id`),
  KEY `system_settings_item_index` (`item`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Dumping data for table october.system_settings: ~1 rows (approximately)
/*!40000 ALTER TABLE `system_settings` DISABLE KEYS */;
REPLACE INTO `system_settings` (`id`, `item`, `value`) VALUES
	(1, 'backend_brand_settings', '{"app_name":"OctoberCMS","app_tagline":"Getting back to basics","primary_color":"#34495e","secondary_color":"#93474d","accent_color":"#9b59b6","menu_mode":"inline","custom_css":""}'),
	(2, 'cms_maintenance_settings', '{"is_enabled":"0","cms_page":"404.htm","theme_map":{"responsiv-flat":"404.htm"}}'),
	(3, 'rainlab_builder_settings', '{"author_name":"Kienbt","author_namespace":"Kienbt"}');
/*!40000 ALTER TABLE `system_settings` ENABLE KEYS */;
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
