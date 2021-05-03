-- phpMyAdmin SQL Dump
-- version 4.8.4
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: May 22, 2020 at 02:44 PM
-- Server version: 10.1.37-MariaDB
-- PHP Version: 7.3.1

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `vipspm_12_migrate`
--

-- --------------------------------------------------------

--
-- Table structure for table `jobs`
--

CREATE TABLE `jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `queue` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8_unicode_ci NOT NULL,
  `attempts` tinyint(3) UNSIGNED NOT NULL,
  `reserved_at` int(10) UNSIGNED DEFAULT NULL,
  `available_at` int(10) UNSIGNED NOT NULL,
  `created_at` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '2019_03_02_125050_create_password_resets_table', 1),
(2, '2019_03_04_060910_create_users_table', 1),
(3, '2019_03_11_055248_create_roles_table', 1),
(4, '2019_03_12_082413_create_departments_table', 1),
(5, '2019_03_28_080744_create_department_role_table', 1),
(6, '2019_03_28_125110_create_mailboxs_table', 1),
(7, '2019_03_29_045017_create_mailboxs_attachment_table', 1),
(8, '2019_03_30_053414_create_menu_table', 1),
(9, '2019_04_08_061711_create_countries_table', 1),
(10, '2019_04_08_061732_create_languages_table', 1),
(11, '2019_04_08_061750_create_locales_table', 1),
(12, '2019_04_08_062349_create_currency_table', 1),
(13, '2019_04_09_063535_create_department_role_menu_table', 1),
(14, '2019_04_09_074557_create_files_table', 1),
(15, '2019_04_09_075257_create_filebrowser_table', 1),
(16, '2019_04_12_121310_create_user_role_department_table', 1),
(17, '2019_04_15_060809_create_user_todos_table', 1),
(18, '2019_04_15_105125_create_todo_user_pivot_table', 1),
(19, '2019_04_16_045924_create_announcements_table', 1),
(20, '2019_04_16_065823_create_holidays_table', 1),
(21, '2019_04_16_074824_create_meetings_table', 1),
(22, '2019_04_16_074836_create_meeting_member_table', 1),
(23, '2019_04_19_054404_create_user_activities_table', 1),
(24, '2019_04_19_063045_create_email_group_table', 1),
(25, '2019_04_19_063114_create_email_template_table', 1),
(26, '2019_04_20_045426_create_team_table', 1),
(27, '2019_04_20_045438_create_team_members_table', 1),
(28, '2019_04_26_051327_create_clients_table', 2),
(29, '2019_04_27_071955_create_settings_table', 2),
(30, '2019_04_29_233943_create_form_table', 2),
(31, '2019_04_29_233948_create_customfields_table', 2),
(32, '2019_05_02_233217_create_projects_table', 2),
(33, '2019_05_02_233608_create_project_user_table', 2),
(34, '2019_05_03_224431_create_project_comments_table', 2),
(35, '2019_05_04_002218_create_project_attachments_table', 2),
(36, '2019_05_04_024503_create_tasks_table', 2),
(37, '2019_05_04_024539_create_task_user_table', 2),
(38, '2019_05_09_210418_create_task_comments_table', 2),
(39, '2019_05_10_034825_create_database_backup_table', 2),
(40, '2019_05_10_222358_create_task_attachments_table', 2),
(41, '2019_05_12_203806_create_defects_table', 2),
(42, '2019_05_12_205620_create_defect_user_table', 2),
(43, '2019_05_12_213505_create_defect_history_table', 2),
(44, '2019_05_15_213459_create_defect_comments_table', 2),
(45, '2019_05_15_231520_create_defect_attachments_table', 2),
(46, '2019_05_16_233252_create_knowledge_base_categories_table', 2),
(47, '2019_05_16_233452_create_knowledge_base_articles_table', 2),
(48, '2019_05_17_224924_create_project_planner_sprints_table', 2),
(49, '2019_05_17_225011_create_project_planner_sprint_members_table', 2),
(50, '2019_05_17_231408_create_project_sprint_tasks_table', 2),
(51, '2019_05_17_231416_create_project_sprint_task_members_table', 2),
(52, '2019_05_19_214115_create_incidents_table', 2),
(53, '2019_05_19_214751_create_incident_user_table', 2),
(54, '2019_05_19_214834_create_incident_history_table', 2),
(55, '2019_05_19_214924_create_incident_attachments_table', 2),
(56, '2019_05_19_214953_create_incident_comments_table', 2),
(57, '2019_07_31_104949_create_jobs_table', 2),
(58, '2020_02_06_182202_create_providers_table', 3),
(59, '2020_02_06_182238_create_appointment_table', 3),
(60, '2019_05_09_234326_create_translations_table', 4),
(61, '2020_02_15_123556_create_modules_table', 4),
(62, '2020_02_15_160826_create_timesheets_table', 4),
(63, '2020_03_04_124408_create_todos_table', 4);

-- --------------------------------------------------------

--
-- Table structure for table `vipscapl_announcements`
--

CREATE TABLE `vipscapl_announcements` (
  `id` int(10) UNSIGNED NOT NULL,
  `user_id` int(10) UNSIGNED NOT NULL,
  `title` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `description` text COLLATE utf8_unicode_ci,
  `status` tinyint(4) NOT NULL DEFAULT '0' COMMENT '0=unpublish,1=publish,2=completed',
  `start_date` date NOT NULL,
  `end_date` date NOT NULL,
  `all_client` tinyint(1) NOT NULL DEFAULT '0' COMMENT '0=none,1=allclient',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `vipscapl_announcements`
--

INSERT INTO `vipscapl_announcements` (`id`, `user_id`, `title`, `description`, `status`, `start_date`, `end_date`, `all_client`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 1, 'Reschedule Team Meeting', '<span style=\"color: rgb(0, 0, 0); font-family: monospace; font-size: medium; white-space: pre-wrap;\">Due to holidays, rescheduling team meeting on monday.</span>', 1, '2020-02-01', '2020-02-13', 1, '2020-02-01 11:37:34', '2020-02-01 11:40:51', NULL),
(2, 1, 'Policy acceptance confirmation', '<span style=\"color: rgb(0, 0, 0); font-family: monospace; font-size: medium; white-space: pre-wrap;\">Team, please send your policy acceptance email before this weekend</span>', 0, '2020-02-03', '2020-02-11', 0, '2020-02-01 11:38:34', '2020-02-01 11:42:20', NULL),
(3, 1, 'Reminder: Food Receipt Submission', '<span style=\"color: rgb(0, 0, 0); font-family: monospace; font-size: medium; white-space: pre-wrap;\">Team, please submit food receipt before 22.12.2019.</span>', 0, '2020-02-08', '2020-02-18', 0, '2020-02-01 11:39:17', '2020-02-01 11:40:37', NULL),
(4, 1, 'Welcome to New Member', '<span style=\"color: rgb(0, 0, 0); font-family: monospace; font-size: medium; white-space: pre-wrap;\">Welcome and intro meeting to new member in developer team.</span>', 1, '2020-02-17', '2020-02-26', 0, '2020-02-01 11:40:06', '2020-02-02 08:29:03', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `vipscapl_appointment`
--

CREATE TABLE `vipscapl_appointment` (
  `id` int(10) UNSIGNED NOT NULL,
  `user_id` int(10) UNSIGNED NOT NULL COMMENT 'Used for requester',
  `title` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `client_id` int(11) DEFAULT NULL,
  `provider_id` int(10) UNSIGNED NOT NULL,
  `attendees` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `start_date_time` datetime NOT NULL,
  `end_date_time` datetime NOT NULL,
  `location` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `note` text COLLATE utf8_unicode_ci,
  `status` tinyint(4) DEFAULT '1' COMMENT '1=Reserved,2=Confirmed,3=Finished,4=Canceled',
  `send_confirmation` int(11) NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `vipscapl_appointment`
--

INSERT INTO `vipscapl_appointment` (`id`, `user_id`, `title`, `client_id`, `provider_id`, `attendees`, `start_date_time`, `end_date_time`, `location`, `note`, `status`, `send_confirmation`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 11, 'Business meeting', NULL, 1, 'Monu Zira', '2020-03-04 08:00:46', '2020-03-04 09:00:46', NULL, NULL, 1, 0, '2020-02-25 12:46:37', '2020-02-25 12:46:37', NULL),
(2, 12, 'Sprint-1 SLD Meeting', NULL, 2, 'Mckenna Corwin', '2020-03-04 09:00:23', '2020-03-04 10:00:23', 'Himalya Hall', '<a href=\"https://www.perfexcrm.com/demo/admin/clients/client/2?contactid=2\" target=\"_blank\" style=\"margin: 0px; padding: 0px; border: 0px; font-variant-numeric: inherit; font-variant-east-asian: inherit; font-stretch: inherit; font-size: 13px; line-height: inherit; font-family: Roboto, &quot;Helvetica Neue&quot;, Helvetica, Arial, sans-serif; vertical-align: baseline; background-color: rgb(255, 255, 255); color: rgb(0, 142, 206);\">Mckenna Corwin</a>', 2, 0, '2020-02-25 12:52:54', '2020-02-25 12:59:11', NULL),
(3, 11, 'QA team meeting with PM', NULL, 3, 'Schmeler Ltd', '2020-03-04 11:00:05', '2020-03-04 12:00:05', 'at Sindhubhavan', '<a href=\"https://www.perfexcrm.com/demo/admin/clients/client/7\" style=\"margin: 0px; padding: 0px; border: 0px; font-variant-numeric: inherit; font-variant-east-asian: inherit; font-stretch: inherit; font-size: 13px; line-height: inherit; font-family: Roboto, &quot;Helvetica Neue&quot;, Helvetica, Arial, sans-serif; vertical-align: baseline; background-color: rgb(255, 255, 255); color: rgb(0, 142, 206);\">Schmeler Ltd</a>', 3, 0, '2020-02-25 12:55:48', '2020-02-25 12:58:54', NULL),
(4, 12, 'Product Release Planning Meeting', NULL, 4, 'all', '2020-03-04 11:00:23', '2020-03-04 11:30:23', 'at JB tower office', NULL, 4, 0, '2020-02-25 12:57:17', '2020-02-25 12:58:36', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `vipscapl_clients`
--

CREATE TABLE `vipscapl_clients` (
  `id` int(10) UNSIGNED NOT NULL,
  `company_name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `company_email` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `user_id` int(10) UNSIGNED NOT NULL,
  `company_phone` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  `company_mobile` varchar(20) COLLATE utf8_unicode_ci NOT NULL,
  `company_zipcode` varchar(10) COLLATE utf8_unicode_ci DEFAULT NULL,
  `company_city` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `company_country` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `company_fax` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `company_address` text COLLATE utf8_unicode_ci,
  `website` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `skype_id` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `facebook` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `twitter` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `linkedin` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `hosting_company` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `host_name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `host_username` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `host_password` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `host_port` varchar(10) COLLATE utf8_unicode_ci DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `vipscapl_clients`
--

INSERT INTO `vipscapl_clients` (`id`, `company_name`, `company_email`, `user_id`, `company_phone`, `company_mobile`, `company_zipcode`, `company_city`, `company_country`, `company_fax`, `company_address`, `website`, `skype_id`, `facebook`, `twitter`, `linkedin`, `hosting_company`, `host_name`, `host_username`, `host_password`, `host_port`, `deleted_at`, `created_at`, `updated_at`) VALUES
(1, 'Leannon, Kemmer And Larkin', 'info@gmail.com', 11, '8985-989-9658', '8985698569', '360001', 'Palo Alto', '226', NULL, 'Extended Bi-Directional Utilisation', 'https://www.google.com', NULL, 'https://www.facebook.com', 'https://twitter.com/', 'https://www.linkedin.com/', NULL, NULL, NULL, NULL, NULL, NULL, '2020-01-30 11:08:01', '2020-01-30 11:08:01'),
(2, 'Vehement Capital Partners', 'info@vehement.com', 12, '8985-989-9658', '8985698569', '360001', 'Rajkot', '37', NULL, 'Front-Line Static Infrastructure', 'https://www.google.com', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020-01-30 11:20:29', '2020-01-30 11:20:29');

-- --------------------------------------------------------

--
-- Table structure for table `vipscapl_countries`
--

CREATE TABLE `vipscapl_countries` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `vipscapl_countries`
--

INSERT INTO `vipscapl_countries` (`id`, `name`) VALUES
(1, 'Afghanistan'),
(2, 'Aringland Islands'),
(3, 'Albania'),
(4, 'Algeria'),
(5, 'American Samoa'),
(6, 'Andorra'),
(7, 'Angola'),
(8, 'Anguilla'),
(9, 'Antarctica'),
(10, 'Antigua and Barbuda'),
(11, 'Argentina'),
(12, 'Armenia'),
(13, 'Aruba'),
(14, 'Australia'),
(15, 'Austria'),
(16, 'Azerbaijan'),
(17, 'Bahamas'),
(18, 'Bahrain'),
(19, 'Bangladesh'),
(20, 'Barbados'),
(21, 'Belarus'),
(22, 'Belgium'),
(23, 'Belize'),
(24, 'Benin'),
(25, 'Bermuda'),
(26, 'Bhutan'),
(27, 'Bolivia'),
(28, 'Bosnia and Herzegovina'),
(29, 'Botswana'),
(30, 'Bouvet Island'),
(31, 'Brazil'),
(32, 'British Indian Ocean territory'),
(33, 'Brunei Darussalam'),
(34, 'Bulgaria'),
(35, 'Burkina Faso'),
(36, 'Burundi'),
(37, 'Cambodia'),
(38, 'Cameroon'),
(39, 'Canada'),
(40, 'Cape Verde'),
(41, 'Cayman Islands'),
(42, 'Central African Republic'),
(43, 'Chad'),
(44, 'Chile'),
(45, 'China'),
(46, 'Christmas Island'),
(47, 'Cocos(Keeling) Islands'),
(48, 'Colombia'),
(49, 'Comoros'),
(50, 'Congo'),
(51, 'Democratic Republic'),
(52, 'Cook Islands'),
(53, 'Costa Rica'),
(54, 'Ivory Coast(Ivory Coast)'),
(55, 'Croatia(Hrvatska)'),
(56, 'Cuba'),
(57, 'Cyprus'),
(58, 'Czech Republic'),
(59, 'Denmark'),
(60, 'Djibouti'),
(61, 'Dominica'),
(62, 'Dominican Republic'),
(63, 'East Timor'),
(64, 'Ecuador'),
(65, 'Egypt'),
(66, 'El Salvador'),
(67, 'Equatorial Guinea'),
(68, 'Eritrea'),
(69, 'Estonia'),
(70, 'Ethiopia'),
(71, 'Falkland Islands'),
(72, 'Faroe Islands'),
(73, 'Fiji'),
(74, 'Finland'),
(75, 'France'),
(76, 'French Guiana'),
(77, 'French Polynesia'),
(78, 'French Southern Territories'),
(79, 'Gabon'),
(80, 'Gambia'),
(81, 'Georgia'),
(82, 'Germany'),
(83, 'Ghana'),
(84, 'Gibraltar'),
(85, 'Greece'),
(86, 'Greenland'),
(87, 'Grenada'),
(88, 'Guadeloupe'),
(89, 'Guam'),
(90, 'Guatemala'),
(91, 'Guinea'),
(92, 'Guinea-Bissau'),
(93, 'Guyana'),
(94, 'Haiti'),
(95, 'Heard and McDonald Islands'),
(96, 'Honduras'),
(97, 'Hong Kong'),
(98, 'Hungary'),
(99, 'Iceland'),
(100, 'India'),
(101, 'Indonesia'),
(102, 'Iran'),
(103, 'Iraq'),
(104, 'Ireland'),
(105, 'Israel'),
(106, 'Italy'),
(107, 'Jamaica'),
(108, 'Japan'),
(109, 'Jordan'),
(110, 'Kazakhstan'),
(111, 'Kenya'),
(112, 'Kiribati'),
(113, 'Korea (north)'),
(114, 'Korea (south)'),
(115, 'Kuwait'),
(116, 'Kyrgyzstan'),
(117, 'Lao People\'s Democratic Republic'),
(118, 'Latvia'),
(119, 'Lebanon'),
(120, 'Lesotho'),
(121, 'Liberia'),
(122, 'Libyan Arab Jamahiriya'),
(123, 'Liechtenstein'),
(124, 'Lithuania'),
(125, 'Luxembourg'),
(126, 'Macao'),
(127, 'Macedonia'),
(128, 'Madagascar'),
(129, 'Malawi'),
(130, 'Malaysia'),
(131, 'Maldives'),
(132, 'Mali'),
(133, 'Malta'),
(134, 'Marshall Islands'),
(135, 'Martinique'),
(136, 'Mauritania'),
(137, 'Mauritius'),
(138, 'Mayotte'),
(139, 'Mexico'),
(140, 'Micronesia'),
(141, 'Moldova'),
(142, 'Monaco'),
(143, 'Mongolia'),
(144, 'Montserrat'),
(145, 'Morocco'),
(146, 'Mozambique'),
(147, 'Myanmar'),
(148, 'Namibia'),
(149, 'Nauru'),
(150, 'Nepal'),
(151, 'Netherlands'),
(152, 'Netherlands Antilles'),
(153, 'New Caledonia'),
(154, 'New Zealand'),
(155, 'Nicaragua'),
(156, 'Niger'),
(157, 'Nigeria'),
(158, 'Niue'),
(159, 'Norfolk Island'),
(160, 'Northern Mariana Islands'),
(161, 'Norway'),
(162, 'Oman'),
(163, 'Pakistan'),
(164, 'Palau'),
(165, 'Palestinian Territories'),
(166, 'Panama'),
(167, 'Papua New Guinea'),
(168, 'Paraguay'),
(169, 'Peru'),
(170, 'Philippines'),
(171, 'Pitcairn'),
(172, 'Poland'),
(173, 'Portugal'),
(174, 'Puerto Rico'),
(175, 'Qatar'),
(176, 'Runion'),
(177, 'Romania'),
(178, 'Russian Federation'),
(179, 'Rwanda'),
(180, 'Saint Helena'),
(181, 'Saint Kitts and Nevis'),
(182, 'Saint Lucia'),
(183, 'Saint Pierre and Miquelon'),
(184, 'Saint Vincent and the Grenadines'),
(185, 'Samoa'),
(186, 'San Marino'),
(187, 'Sao Tome and Principe'),
(188, 'Saudi Arabia'),
(189, 'Senegal'),
(190, 'Serbia and Montenegro'),
(191, 'Seychelles'),
(192, 'Sierra Leone'),
(193, 'Singapore'),
(194, 'Slovakia'),
(195, 'Slovenia'),
(196, 'Solomon Islands'),
(197, 'Somalia'),
(198, 'South Africa'),
(199, 'South Georgia and the South Sandwich Islands'),
(200, 'Spain'),
(201, 'Sri Lanka'),
(202, 'Sudan'),
(203, 'Suriname'),
(204, 'Svalbard and Jan Mayen Islands'),
(205, 'Swaziland'),
(206, 'Sweden'),
(207, 'Switzerland'),
(208, 'Syria'),
(209, 'Taiwan'),
(210, 'Tajikistan'),
(211, 'Tanzania'),
(212, 'Thailand'),
(213, 'Togo'),
(214, 'Tokelau'),
(215, 'Tonga'),
(216, 'Trinidad and Tobago'),
(217, 'Tunisia'),
(218, 'Turkey'),
(219, 'Turkmenistan'),
(220, 'Turks and Caicos Islands'),
(221, 'Tuvalu'),
(222, 'Uganda'),
(223, 'Ukraine'),
(224, 'United Arab Emirates'),
(225, 'United Kingdom'),
(226, 'United States of America'),
(227, 'Uruguay'),
(228, 'Uzbekistan'),
(229, 'Vanuatu'),
(230, 'Vatican City'),
(231, 'Venezuela'),
(232, 'Vietnam'),
(233, 'Virgin Islands (British)'),
(234, 'Virgin Islands (US)'),
(235, 'Wallis and Futuna Islands'),
(236, 'Western Sahara'),
(237, 'Yemen'),
(238, 'Zaire'),
(239, 'Zambia'),
(240, 'Zimbabwe');

-- --------------------------------------------------------

--
-- Table structure for table `vipscapl_currency`
--

CREATE TABLE `vipscapl_currency` (
  `id` int(10) UNSIGNED NOT NULL,
  `code` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `symbol` varchar(255) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `vipscapl_currency`
--

INSERT INTO `vipscapl_currency` (`id`, `code`, `name`, `symbol`) VALUES
(1, 'AUD', 'Australian Dollar', '$'),
(2, 'BAN', 'Bangladesh', 'BDT'),
(3, 'BRL', 'Brazilian Real', 'R$'),
(4, 'CAD', 'Canadian Dollar', '$'),
(5, 'CHF', 'Swiss Franc', 'Fr'),
(6, 'CLP', 'Chilean Peso', '$'),
(7, 'CNY', 'Chinese Yuan', '?'),
(8, 'CZK', 'Czech Koruna', 'K??'),
(9, 'DKK', 'Danish Krone', 'kr'),
(10, 'EUR', 'Euro', '?'),
(11, 'GBP', 'British Pound', '?'),
(12, 'HKD', 'Hong Kong Dollar', '$'),
(13, 'HUF', 'Hungarian Forint', 'Ft'),
(14, 'IDR', 'Indonesian Rupiah', 'Rp'),
(15, 'ILS', 'Israeli New Shekel', '?'),
(16, 'INR', 'Indian Rupee', 'INR'),
(17, 'JPY', 'Japanese Yen', '?'),
(18, 'KRW', 'Korean Won', '?'),
(19, 'MXN', 'Mexican Peso', '$'),
(20, 'MYR', 'Malaysian Ringgit', 'RM'),
(21, 'NOK', 'Norwegian Krone', 'kr'),
(22, 'NZD', 'New Zealand Dollar', '$'),
(23, 'PHP', 'Philippine Peso', '?'),
(24, 'PKR', 'Pakistan Rupee', '?'),
(25, 'PLN', 'Polish Zloty', 'zl'),
(26, 'RUB', 'Russian Ruble', '?'),
(27, 'SEK', 'Swedish Krona', 'kr'),
(28, 'SGD', 'Singapore Dollar', '$'),
(29, 'THB', 'Thai Baht', '?'),
(30, 'TRY', 'Turkish Lira', '?'),
(31, 'TWD', 'Taiwan Dollar', '$'),
(32, 'USD', 'US Dollar', '$'),
(33, 'VEF', 'Bol?var Fuerte', 'Bs.'),
(34, 'ZAR', 'South African Rand', 'R');

-- --------------------------------------------------------

--
-- Table structure for table `vipscapl_custom_fields`
--

CREATE TABLE `vipscapl_custom_fields` (
  `id` int(10) UNSIGNED NOT NULL,
  `form_id` int(10) UNSIGNED NOT NULL,
  `field_label` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `field_column` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `default_value` text COLLATE utf8_unicode_ci,
  `help_text` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `field_type` enum('text','textarea','dropdown','date','checkbox','numeric','url') COLLATE utf8_unicode_ci NOT NULL,
  `is_required` tinyint(1) NOT NULL DEFAULT '0',
  `status` tinyint(1) NOT NULL DEFAULT '1' COMMENT 'false=Inactive,true=Active',
  `show_on_details` tinyint(1) NOT NULL DEFAULT '0',
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `vipscapl_custom_fields`
--

INSERT INTO `vipscapl_custom_fields` (`id`, `form_id`, `field_label`, `field_column`, `default_value`, `help_text`, `field_type`, `is_required`, `status`, `show_on_details`, `deleted_at`, `created_at`, `updated_at`) VALUES
(1, 2, 'Custom Field 1', 'custom_field_1', NULL, 'Help', 'text', 0, 1, 0, NULL, '2020-01-31 05:31:43', '2020-02-11 16:12:21'),
(2, 1, 'Custom Field 1', 'custom_field_1', NULL, 'Custom Field 1', 'text', 0, 1, 1, NULL, '2020-05-18 10:30:26', '2020-05-18 10:30:26'),
(3, 3, 'Custom Field 1', 'custom_field_1', NULL, 'Custom Field 1', 'text', 0, 1, 1, NULL, '2020-05-18 10:30:45', '2020-05-18 10:30:45'),
(4, 4, 'Custom Field 1', 'custom_field_1', NULL, 'Custom Field 1', 'text', 0, 1, 1, NULL, '2020-05-18 10:31:05', '2020-05-18 10:31:05');

-- --------------------------------------------------------

--
-- Table structure for table `vipscapl_database_backups`
--

CREATE TABLE `vipscapl_database_backups` (
  `id` int(10) UNSIGNED NOT NULL,
  `user_id` int(10) UNSIGNED NOT NULL,
  `file_name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '1',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `vipscapl_defects`
--

CREATE TABLE `vipscapl_defects` (
  `id` int(10) UNSIGNED NOT NULL,
  `create_user_id` int(11) NOT NULL,
  `generated_id` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `project_id` int(11) NOT NULL,
  `project_version` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `defect_type` tinyint(4) NOT NULL DEFAULT '1' COMMENT '1=Defects,2=Enhancement',
  `defect_name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `start_date` date DEFAULT NULL,
  `end_date` date DEFAULT NULL,
  `description` text COLLATE utf8_unicode_ci,
  `status` tinyint(4) NOT NULL DEFAULT '1' COMMENT '1=Assigned,2=Closed,3=In Progress,4=Open,5=Solved,6=Re-open,7=Deferred',
  `assigned_group_id` int(11) DEFAULT NULL,
  `assign_member` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `severity` tinyint(4) NOT NULL DEFAULT '1' COMMENT '1=Low,2=Medium,3=High,4=Very High,5=Urgent',
  `notes` text COLLATE utf8_unicode_ci,
  `attachment` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `attachment_hash` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `orders` int(11) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `vipscapl_defects`
--

INSERT INTO `vipscapl_defects` (`id`, `create_user_id`, `generated_id`, `project_id`, `project_version`, `defect_type`, `defect_name`, `start_date`, `end_date`, `description`, `status`, `assigned_group_id`, `assign_member`, `severity`, `notes`, `attachment`, `attachment_hash`, `orders`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 1, 'DEF0001', 1, '1.0', 1, 'Sidebar sub tab not active.', '2020-02-01', '2020-02-01', NULL, 1, 2, '1', 1, NULL, NULL, NULL, NULL, '2020-02-01 10:34:58', '2020-02-01 10:34:58', NULL),
(2, 1, 'DEF0002', 1, '1.0', 1, 'Toggle button is not working.', '2020-02-10', '2020-02-10', NULL, 4, 2, '13', 2, NULL, NULL, NULL, NULL, '2020-02-01 10:37:26', '2020-02-01 10:37:26', NULL),
(3, 1, 'DEF0003', 1, '1.0', 1, 'Header and sidebar missing.', '2020-02-12', '2020-02-12', NULL, 3, 2, '13', 4, NULL, NULL, NULL, NULL, '2020-02-01 10:38:24', '2020-02-01 10:38:24', NULL),
(4, 1, 'DEF0004', 2, '1.0', 1, 'Generate invoice take more time.', '2020-02-13', '2020-02-20', NULL, 3, 2, '13', 2, NULL, NULL, NULL, NULL, '2020-02-01 10:39:53', '2020-02-01 10:39:53', NULL),
(5, 1, 'DEF0005', 2, '1.0', 1, 'Dashboard responsive issue.', '2020-02-19', '2020-03-19', NULL, 3, 2, '13', 5, NULL, NULL, NULL, NULL, '2020-02-01 10:40:43', '2020-02-01 10:40:43', NULL),
(6, 1, 'DEF0006', 2, '1.0', 1, 'Invoice PDF format is not like mentioned in HLD.', '2020-02-28', '2020-02-28', NULL, 5, 2, '13', 4, NULL, NULL, NULL, NULL, '2020-02-01 10:41:40', '2020-02-01 10:41:40', NULL),
(7, 1, 'DEF0007', 1, '1.0', 1, 'Hotel billing page is not working.', '2020-03-11', '2020-03-11', NULL, 5, 2, '13', 1, NULL, NULL, NULL, NULL, '2020-02-01 10:42:21', '2020-02-01 10:42:21', NULL),
(8, 1, 'DEF0008', 1, '1.0', 1, 'Toggle button is not working.', '2020-03-13', '2020-03-13', NULL, 2, 2, '13', 2, NULL, NULL, NULL, NULL, '2020-02-01 10:43:10', '2020-02-01 10:43:10', NULL),
(9, 1, 'DEF0009', 2, '1.0', 1, 'Service is not terminated in service termination module.', '2020-03-16', '2020-03-16', NULL, 2, 2, '13', 3, NULL, NULL, NULL, NULL, '2020-02-01 10:43:55', '2020-02-01 10:43:55', NULL),
(10, 1, 'DEF00010', 1, '1.0', 1, 'Previous cycle invoice amount is not adjust agains current cycle.', '2020-03-19', '2020-03-19', NULL, 2, 2, '13', 5, NULL, NULL, NULL, NULL, '2020-02-01 10:44:43', '2020-02-01 10:44:43', NULL),
(11, 1, 'DEF0011', 1, '1.0', 1, 'Previous cycle invoice amount is not adjust agains current cycle', '2020-03-27', '2020-03-27', NULL, 7, 2, '13', 1, NULL, NULL, NULL, NULL, '2020-02-01 10:45:35', '2020-02-01 10:45:35', NULL),
(12, 1, 'DEF0012', 2, '1.0', 1, 'Generate invoice take more time.', '2020-03-31', '2020-03-31', NULL, 7, 2, '13', 4, NULL, NULL, NULL, NULL, '2020-02-01 10:46:57', '2020-02-01 10:46:57', NULL),
(13, 1, 'DEF0013', 1, '1.0', 1, 'Invoice PDF format is not like mentioned in HLD.', '2020-04-01', '2020-04-01', NULL, 6, 2, '13', 2, NULL, NULL, NULL, NULL, '2020-02-01 10:47:42', '2020-02-01 10:47:42', NULL),
(14, 1, 'DEF0014', 1, '1.0', 1, 'Sidebar sub tab not active.', '2020-04-03', '2020-04-03', NULL, 4, 2, '13', 2, NULL, NULL, NULL, NULL, '2020-02-01 10:51:34', '2020-02-01 10:51:34', NULL),
(15, 1, 'DEF0015', 2, '1.0', 1, 'ToDo list collapse not working.', '2020-04-10', '2020-04-10', NULL, 1, 2, '13', 4, NULL, NULL, NULL, NULL, '2020-02-01 10:53:38', '2020-02-01 10:53:38', NULL),
(16, 1, 'DEF0016', 1, '1.0', 1, 'Previous cycle invoice amount is not adjust agains current cycle.', '2020-04-14', '2020-04-14', NULL, 6, 2, '13', 1, NULL, NULL, NULL, NULL, '2020-02-01 10:54:42', '2020-02-01 10:54:42', NULL),
(17, 13, 'DEF0017', 2, '1.0', 1, 'Generate invoice take more time.', '2020-04-17', '2020-04-17', NULL, 1, 2, '13', 1, NULL, NULL, NULL, NULL, '2020-02-01 11:00:57', '2020-02-01 11:00:57', NULL),
(18, 1, 'DEF0018', 1, '1.0', 1, 'Dashboard responsive issue.', '2020-04-20', '2020-04-20', NULL, 4, 3, '1', 1, NULL, NULL, NULL, NULL, '2020-02-11 04:29:56', '2020-02-11 04:30:26', NULL),
(19, 1, 'DEF0019', 1, '1.0', 1, 'Sidebar sub tab not active.', '2020-04-22', '2020-04-22', NULL, 3, 2, '1', 2, NULL, NULL, NULL, NULL, '2020-02-11 04:31:09', '2020-02-11 04:31:09', NULL),
(20, 1, 'DEF0020', 1, '1.0', 1, 'Header and sidebar missing.', '2020-04-30', '2020-04-30', NULL, 5, 3, '1', 3, NULL, NULL, NULL, NULL, '2020-02-11 04:31:55', '2020-02-11 04:31:55', NULL),
(21, 1, 'DEF0021', 1, '1.0', 1, 'ToDo list collapse not working.', '2020-05-01', '2020-05-01', NULL, 7, 3, '1', 4, NULL, NULL, NULL, NULL, '2020-02-11 04:32:36', '2020-02-11 04:32:36', NULL),
(22, 1, 'DEF0022', 1, '1.0', 1, 'Toggle button is not working.', '2020-05-04', '2020-05-04', NULL, 6, 3, '1', 5, NULL, NULL, NULL, NULL, '2020-02-11 04:33:17', '2020-02-11 04:33:17', NULL),
(23, 1, 'DEF0023', 1, '1.0', 1, 'Invoice PDF format is not like mentioned in HLD.', '2020-05-07', '2020-05-07', NULL, 2, 3, '1', 4, NULL, NULL, NULL, NULL, '2020-02-11 04:33:57', '2020-02-11 04:33:57', NULL),
(24, 11, 'DEF0024', 1, '1.0', 1, 'Service is not terminated in service termination module.', '2020-05-11', '2020-05-11', NULL, 1, 2, '13', 1, NULL, NULL, NULL, NULL, '2020-02-14 10:02:55', '2020-02-14 10:02:55', NULL),
(25, 11, 'DEF0025', 1, '1.0', 1, 'Previous cycle invoice amount is not adjust agains current cycle.', '2020-05-15', '2020-05-15', NULL, 3, 2, '13', 2, NULL, NULL, NULL, NULL, '2020-02-14 11:08:00', '2020-02-14 11:08:00', NULL),
(26, 11, 'DEF0026', 1, '1.0', 1, 'Generate invoice take more time.', '2020-05-18', '2020-05-18', NULL, 3, 2, '13', 4, NULL, NULL, NULL, NULL, '2020-02-14 11:09:04', '2020-02-14 11:10:36', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `vipscapl_defects_history`
--

CREATE TABLE `vipscapl_defects_history` (
  `id` int(10) UNSIGNED NOT NULL,
  `defect_id` int(10) UNSIGNED NOT NULL,
  `description` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `created_by_id` int(11) NOT NULL,
  `commented_by_id` int(11) DEFAULT NULL,
  `solved_by_id` int(11) DEFAULT NULL,
  `closed_by_id` int(11) DEFAULT NULL,
  `updated_by_id` int(11) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `vipscapl_defects_history`
--

INSERT INTO `vipscapl_defects_history` (`id`, `defect_id`, `description`, `created_by_id`, `commented_by_id`, `solved_by_id`, `closed_by_id`, `updated_by_id`, `created_at`, `updated_at`) VALUES
(1, 1, 'Defect information added : <b>Sidebar sub tab not active.</b>', 1, NULL, NULL, NULL, NULL, '2020-02-01 10:35:04', '2020-02-01 10:35:04'),
(2, 2, 'Defect information added : <b>Toggle button is not working.</b>', 1, NULL, NULL, NULL, NULL, '2020-02-01 10:37:26', '2020-02-01 10:37:26'),
(3, 3, 'Defect information added : <b>Header and sidebar missing.</b>', 1, NULL, NULL, NULL, NULL, '2020-02-01 10:38:24', '2020-02-01 10:38:24'),
(4, 4, 'Defect information added : <b>Generate invoice take more time.</b>', 1, NULL, NULL, NULL, NULL, '2020-02-01 10:39:53', '2020-02-01 10:39:53'),
(5, 5, 'Defect information added : <b>Dashboard responsive issue.</b>', 1, NULL, NULL, NULL, NULL, '2020-02-01 10:40:44', '2020-02-01 10:40:44'),
(6, 6, 'Defect information added : <b>Invoice PDF format is not like mentioned in HLD.</b>', 1, NULL, 1, NULL, NULL, '2020-02-01 10:41:40', '2020-02-01 10:41:40'),
(7, 7, 'Defect information added : <b>Hotel billing page is not working.</b>', 1, NULL, 1, NULL, NULL, '2020-02-01 10:42:22', '2020-02-01 10:42:22'),
(8, 8, 'Defect information added : <b>Toggle button is not working.</b>', 1, NULL, NULL, 1, NULL, '2020-02-01 10:43:10', '2020-02-01 10:43:10'),
(9, 9, 'Defect information added : <b>Service is not terminated in service termination module.</b>', 1, NULL, NULL, 1, NULL, '2020-02-01 10:43:55', '2020-02-01 10:43:55'),
(10, 10, 'Defect information added : <b>Previous cycle invoice amount is not adjust agains current cycle.</b>', 1, NULL, NULL, 1, NULL, '2020-02-01 10:44:43', '2020-02-01 10:44:43'),
(11, 11, 'Defect information added : <b>Previous cycle invoice amount is not adjust agains current cycle</b>', 1, NULL, NULL, NULL, NULL, '2020-02-01 10:45:35', '2020-02-01 10:45:35'),
(12, 12, 'Defect information added : <b>Generate invoice take more time.</b>', 1, NULL, NULL, NULL, NULL, '2020-02-01 10:46:57', '2020-02-01 10:46:57'),
(13, 13, 'Defect information added : <b>Invoice PDF format is not like mentioned in HLD.</b>', 1, NULL, NULL, NULL, NULL, '2020-02-01 10:47:43', '2020-02-01 10:47:43'),
(14, 14, 'Defect information added : <b>Sidebar sub tab not active.</b>', 1, NULL, NULL, NULL, NULL, '2020-02-01 10:51:34', '2020-02-01 10:51:34'),
(15, 15, 'Defect information added : <b>ToDo list collapse not working.</b>', 1, NULL, NULL, NULL, NULL, '2020-02-01 10:53:39', '2020-02-01 10:53:39'),
(16, 16, 'Defect information added : <b>Previous cycle invoice amount is not adjust agains current cycle.</b>', 1, NULL, NULL, NULL, NULL, '2020-02-01 10:54:42', '2020-02-01 10:54:42'),
(17, 17, 'Defect information added : <b>Generate invoice take more time.</b>', 13, NULL, NULL, NULL, NULL, '2020-02-01 11:00:57', '2020-02-01 11:00:57'),
(18, 18, 'Defect information added : <b>Dashboard responsive issue.</b>', 1, NULL, NULL, NULL, NULL, '2020-02-11 04:29:56', '2020-02-11 04:29:56'),
(19, 18, 'Defect information updated : <b>Dashboard responsive issue.</b>', 1, NULL, NULL, NULL, 1, '2020-02-11 04:30:26', '2020-02-11 04:30:26'),
(20, 19, 'Defect information added : <b>Sidebar sub tab not active.</b>', 1, NULL, NULL, NULL, NULL, '2020-02-11 04:31:09', '2020-02-11 04:31:09'),
(21, 20, 'Defect information added : <b>Header and sidebar missing.</b>', 1, NULL, 1, NULL, NULL, '2020-02-11 04:31:55', '2020-02-11 04:31:55'),
(22, 21, 'Defect information added : <b>ToDo list collapse not working.</b>', 1, NULL, NULL, NULL, NULL, '2020-02-11 04:32:36', '2020-02-11 04:32:36'),
(23, 22, 'Defect information added : <b>Toggle button is not working.</b>', 1, NULL, NULL, NULL, NULL, '2020-02-11 04:33:17', '2020-02-11 04:33:17'),
(24, 23, 'Defect information added : <b>Invoice PDF format is not like mentioned in HLD.</b>', 1, NULL, NULL, 1, NULL, '2020-02-11 04:33:58', '2020-02-11 04:33:58'),
(25, 24, 'Defect information added : <b>Service is not terminated in service termination module.</b>', 11, NULL, NULL, NULL, NULL, '2020-02-14 10:02:56', '2020-02-14 10:02:56'),
(26, 25, 'Defect information added : <b>Previous cycle invoice amount is not adjust agains current cycle.</b>', 11, NULL, NULL, NULL, NULL, '2020-02-14 11:08:00', '2020-02-14 11:08:00'),
(27, 26, 'Defect information added : <b>Generate invoice take more time.</b>', 11, NULL, 11, NULL, NULL, '2020-02-14 11:09:04', '2020-02-14 11:09:04'),
(28, 26, 'Defect status Changed : <b>Generate invoice take more time.</b>', 11, NULL, NULL, NULL, 11, '2020-02-14 11:10:36', '2020-02-14 11:10:36');

-- --------------------------------------------------------

--
-- Table structure for table `vipscapl_defect_attachments`
--

CREATE TABLE `vipscapl_defect_attachments` (
  `id` int(10) UNSIGNED NOT NULL,
  `defect_id` int(10) UNSIGNED NOT NULL,
  `file_name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `file_hash` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `file_description` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `vipscapl_defect_comments`
--

CREATE TABLE `vipscapl_defect_comments` (
  `id` int(10) UNSIGNED NOT NULL,
  `user_id` int(10) UNSIGNED NOT NULL,
  `defect_id` int(10) UNSIGNED NOT NULL,
  `parent_id` int(11) NOT NULL DEFAULT '0',
  `comment` text COLLATE utf8_unicode_ci NOT NULL,
  `attachments` text COLLATE utf8_unicode_ci,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `vipscapl_defect_user`
--

CREATE TABLE `vipscapl_defect_user` (
  `defect_id` int(10) UNSIGNED NOT NULL,
  `user_id` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `vipscapl_defect_user`
--

INSERT INTO `vipscapl_defect_user` (`defect_id`, `user_id`) VALUES
(1, 1),
(1, 2),
(1, 3),
(1, 4),
(1, 5),
(1, 6),
(1, 7),
(1, 8),
(1, 9),
(1, 10),
(1, 11),
(1, 13),
(2, 1),
(2, 2),
(2, 3),
(2, 4),
(2, 5),
(2, 6),
(2, 7),
(2, 8),
(2, 9),
(2, 10),
(2, 11),
(2, 13),
(3, 1),
(3, 2),
(3, 3),
(3, 4),
(3, 5),
(3, 6),
(3, 7),
(3, 8),
(3, 9),
(3, 10),
(3, 11),
(3, 13),
(4, 1),
(4, 2),
(4, 3),
(4, 4),
(4, 5),
(4, 6),
(4, 7),
(4, 8),
(4, 9),
(4, 10),
(4, 11),
(4, 13),
(5, 1),
(5, 2),
(5, 3),
(5, 4),
(5, 5),
(5, 6),
(5, 7),
(5, 8),
(5, 9),
(5, 10),
(5, 11),
(5, 13),
(6, 1),
(6, 2),
(6, 3),
(6, 4),
(6, 5),
(6, 6),
(6, 7),
(6, 8),
(6, 9),
(6, 10),
(6, 11),
(6, 13),
(7, 1),
(7, 2),
(7, 3),
(7, 4),
(7, 5),
(7, 6),
(7, 7),
(7, 8),
(7, 9),
(7, 10),
(7, 11),
(7, 13),
(8, 1),
(8, 2),
(8, 3),
(8, 4),
(8, 5),
(8, 6),
(8, 7),
(8, 8),
(8, 9),
(8, 10),
(8, 11),
(8, 13),
(9, 1),
(9, 2),
(9, 3),
(9, 4),
(9, 5),
(9, 6),
(9, 7),
(9, 8),
(9, 9),
(9, 10),
(9, 11),
(9, 13),
(10, 1),
(10, 2),
(10, 3),
(10, 4),
(10, 5),
(10, 6),
(10, 7),
(10, 8),
(10, 9),
(10, 10),
(10, 11),
(10, 13),
(11, 1),
(11, 2),
(11, 3),
(11, 4),
(11, 5),
(11, 6),
(11, 7),
(11, 8),
(11, 9),
(11, 10),
(11, 11),
(11, 13),
(12, 1),
(12, 2),
(12, 3),
(12, 4),
(12, 5),
(12, 6),
(12, 7),
(12, 8),
(12, 9),
(12, 10),
(12, 11),
(12, 13),
(13, 1),
(13, 2),
(13, 3),
(13, 4),
(13, 5),
(13, 6),
(13, 7),
(13, 8),
(13, 9),
(13, 10),
(13, 11),
(13, 13),
(14, 1),
(14, 2),
(14, 3),
(14, 4),
(14, 5),
(14, 6),
(14, 7),
(14, 8),
(14, 9),
(14, 10),
(14, 11),
(14, 13),
(15, 1),
(15, 2),
(15, 3),
(15, 4),
(15, 5),
(15, 6),
(15, 7),
(15, 8),
(15, 9),
(15, 10),
(15, 11),
(15, 13),
(16, 1),
(16, 2),
(16, 3),
(16, 4),
(16, 5),
(16, 6),
(16, 7),
(16, 8),
(16, 9),
(16, 10),
(16, 11),
(16, 13),
(17, 1),
(17, 2),
(17, 3),
(17, 4),
(17, 5),
(17, 6),
(17, 7),
(17, 8),
(17, 9),
(17, 10),
(17, 11),
(17, 13),
(18, 1),
(18, 2),
(18, 3),
(18, 4),
(18, 5),
(18, 6),
(18, 7),
(18, 8),
(18, 9),
(18, 10),
(18, 11),
(18, 13),
(19, 1),
(19, 2),
(19, 3),
(19, 4),
(19, 5),
(19, 6),
(19, 7),
(19, 8),
(19, 9),
(19, 10),
(19, 11),
(19, 13),
(20, 1),
(20, 2),
(20, 3),
(20, 4),
(20, 5),
(20, 6),
(20, 7),
(20, 8),
(20, 9),
(20, 10),
(20, 11),
(20, 13),
(21, 1),
(21, 2),
(21, 3),
(21, 4),
(21, 5),
(21, 6),
(21, 7),
(21, 8),
(21, 9),
(21, 10),
(21, 11),
(21, 13),
(22, 1),
(22, 2),
(22, 3),
(22, 4),
(22, 5),
(22, 6),
(22, 7),
(22, 8),
(22, 9),
(22, 10),
(22, 11),
(22, 13),
(23, 1),
(23, 2),
(23, 3),
(23, 4),
(23, 5),
(23, 6),
(23, 7),
(23, 8),
(23, 9),
(23, 10),
(23, 11),
(23, 13),
(24, 1),
(24, 2),
(24, 3),
(24, 4),
(24, 5),
(24, 6),
(24, 7),
(24, 8),
(24, 9),
(24, 10),
(24, 11),
(24, 13),
(25, 1),
(25, 2),
(25, 3),
(25, 4),
(25, 5),
(25, 6),
(25, 7),
(25, 8),
(25, 9),
(25, 10),
(25, 11),
(25, 13),
(26, 1),
(26, 2),
(26, 3),
(26, 4),
(26, 5),
(26, 6),
(26, 7),
(26, 8),
(26, 9),
(26, 10),
(26, 11),
(26, 13);

-- --------------------------------------------------------

--
-- Table structure for table `vipscapl_departments`
--

CREATE TABLE `vipscapl_departments` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `vipscapl_departments`
--

INSERT INTO `vipscapl_departments` (`id`, `name`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 'Administration', '2020-01-30 09:40:38', '2020-01-30 09:40:38', NULL),
(2, 'IT', '2020-01-30 10:00:45', '2020-01-30 10:00:45', NULL),
(3, 'PM', '2020-01-30 10:01:53', '2020-01-30 10:01:53', NULL),
(4, 'Finance', '2020-01-30 10:02:37', '2020-01-30 10:02:37', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `vipscapl_departments_roles`
--

CREATE TABLE `vipscapl_departments_roles` (
  `id` int(10) UNSIGNED NOT NULL,
  `role_id` int(10) UNSIGNED NOT NULL,
  `department_id` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `vipscapl_departments_roles`
--

INSERT INTO `vipscapl_departments_roles` (`id`, `role_id`, `department_id`) VALUES
(1, 1, 1),
(2, 2, 1),
(3, 3, 1),
(4, 1, 2),
(5, 2, 2),
(6, 6, 2),
(7, 7, 2),
(8, 1, 3),
(9, 3, 3),
(10, 2, 3),
(11, 9, 3),
(12, 10, 3),
(13, 7, 3),
(14, 6, 3),
(15, 1, 4),
(16, 12, 4),
(17, 4, 4),
(18, 5, 4);

-- --------------------------------------------------------

--
-- Table structure for table `vipscapl_department_role_menu`
--

CREATE TABLE `vipscapl_department_role_menu` (
  `id` int(10) UNSIGNED NOT NULL,
  `department_id` int(10) UNSIGNED NOT NULL,
  `role_id` int(10) UNSIGNED NOT NULL,
  `menu_id` int(10) UNSIGNED NOT NULL,
  `view` int(11) NOT NULL,
  `created` int(11) NOT NULL,
  `edited` int(11) NOT NULL,
  `deleted` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `vipscapl_department_role_menu`
--

INSERT INTO `vipscapl_department_role_menu` (`id`, `department_id`, `role_id`, `menu_id`, `view`, `created`, `edited`, `deleted`) VALUES
(118, 2, 1, 1, 1, 0, 0, 0),
(119, 2, 2, 1, 1, 0, 0, 0),
(120, 2, 6, 1, 1, 0, 0, 0),
(121, 2, 7, 1, 1, 0, 0, 0),
(122, 2, 1, 2, 2, 0, 0, 0),
(123, 2, 2, 2, 2, 0, 0, 0),
(124, 2, 6, 2, 2, 0, 0, 0),
(125, 2, 7, 2, 2, 0, 0, 0),
(126, 2, 1, 3, 3, 0, 0, 0),
(127, 2, 2, 3, 3, 0, 0, 0),
(128, 2, 6, 3, 3, 0, 0, 0),
(129, 2, 7, 3, 3, 0, 0, 0),
(130, 2, 1, 4, 4, 0, 0, 0),
(131, 2, 2, 4, 4, 0, 0, 0),
(132, 2, 6, 4, 4, 0, 0, 0),
(133, 2, 7, 4, 4, 0, 0, 0),
(134, 2, 1, 5, 5, 0, 0, 0),
(135, 2, 2, 5, 5, 0, 0, 0),
(136, 2, 6, 5, 5, 0, 0, 0),
(137, 2, 7, 5, 5, 0, 0, 0),
(138, 2, 1, 6, 6, 0, 0, 0),
(139, 2, 2, 6, 6, 0, 0, 0),
(140, 2, 6, 6, 6, 0, 0, 0),
(141, 2, 7, 6, 6, 0, 0, 0),
(142, 2, 1, 7, 7, 0, 0, 0),
(143, 2, 2, 7, 7, 0, 0, 0),
(144, 2, 6, 7, 7, 0, 0, 0),
(145, 2, 7, 7, 7, 0, 0, 0),
(150, 2, 1, 9, 9, 0, 0, 0),
(151, 2, 2, 9, 9, 0, 0, 0),
(152, 2, 6, 9, 9, 0, 0, 0),
(153, 2, 7, 9, 9, 0, 0, 0),
(154, 2, 1, 10, 10, 0, 0, 0),
(155, 2, 2, 10, 10, 0, 0, 0),
(156, 2, 6, 10, 10, 0, 0, 0),
(157, 2, 7, 10, 10, 0, 0, 0),
(158, 2, 1, 11, 11, 0, 0, 0),
(159, 2, 2, 11, 11, 0, 0, 0),
(160, 2, 6, 11, 11, 0, 0, 0),
(161, 2, 7, 11, 11, 0, 0, 0),
(162, 2, 1, 12, 12, 0, 0, 0),
(163, 2, 2, 12, 12, 0, 0, 0),
(164, 2, 6, 12, 12, 0, 0, 0),
(165, 2, 7, 12, 12, 0, 0, 0),
(166, 2, 1, 13, 13, 0, 0, 0),
(167, 2, 2, 13, 13, 0, 0, 0),
(168, 2, 6, 13, 13, 0, 0, 0),
(169, 2, 7, 13, 13, 0, 0, 0),
(170, 2, 1, 14, 14, 0, 0, 0),
(171, 2, 2, 14, 14, 0, 0, 0),
(172, 2, 6, 14, 14, 0, 0, 0),
(173, 2, 7, 14, 14, 0, 0, 0),
(174, 2, 1, 15, 15, 0, 0, 0),
(175, 2, 2, 15, 15, 0, 0, 0),
(176, 2, 6, 15, 15, 0, 0, 0),
(177, 2, 7, 15, 15, 0, 0, 0),
(178, 2, 1, 16, 16, 0, 0, 0),
(179, 2, 2, 16, 16, 0, 0, 0),
(180, 2, 6, 16, 16, 0, 0, 0),
(181, 2, 7, 16, 16, 0, 0, 0),
(182, 2, 1, 17, 17, 0, 0, 0),
(183, 2, 2, 17, 17, 0, 0, 0),
(184, 2, 6, 17, 17, 0, 0, 0),
(185, 2, 7, 17, 17, 0, 0, 0),
(186, 2, 1, 18, 18, 0, 0, 0),
(187, 2, 2, 18, 18, 0, 0, 0),
(188, 2, 6, 18, 18, 0, 0, 0),
(189, 2, 7, 18, 18, 0, 0, 0),
(190, 2, 1, 19, 19, 0, 0, 0),
(191, 2, 2, 19, 19, 0, 0, 0),
(192, 2, 6, 19, 19, 0, 0, 0),
(193, 2, 7, 19, 19, 0, 0, 0),
(194, 2, 1, 20, 20, 0, 0, 0),
(195, 2, 2, 20, 20, 0, 0, 0),
(196, 2, 6, 20, 20, 0, 0, 0),
(197, 2, 7, 20, 20, 0, 0, 0),
(198, 2, 1, 21, 21, 0, 0, 0),
(199, 2, 2, 21, 21, 0, 0, 0),
(200, 2, 6, 21, 21, 0, 0, 0),
(201, 2, 7, 21, 21, 0, 0, 0),
(202, 2, 1, 22, 22, 0, 0, 0),
(203, 2, 2, 22, 22, 0, 0, 0),
(204, 2, 6, 22, 22, 0, 0, 0),
(205, 2, 7, 22, 22, 0, 0, 0),
(206, 2, 1, 23, 23, 0, 0, 0),
(207, 2, 2, 23, 23, 0, 0, 0),
(208, 2, 6, 23, 23, 0, 0, 0),
(209, 2, 7, 23, 23, 0, 0, 0),
(210, 2, 1, 24, 24, 0, 0, 0),
(211, 2, 2, 24, 24, 0, 0, 0),
(212, 2, 6, 24, 24, 0, 0, 0),
(213, 2, 7, 24, 24, 0, 0, 0),
(214, 2, 1, 25, 25, 0, 0, 0),
(215, 2, 2, 25, 25, 0, 0, 0),
(216, 2, 6, 25, 25, 0, 0, 0),
(217, 2, 7, 25, 25, 0, 0, 0),
(222, 2, 1, 27, 27, 0, 0, 0),
(223, 2, 2, 27, 27, 0, 0, 0),
(224, 2, 6, 27, 27, 0, 0, 0),
(225, 2, 7, 27, 27, 0, 0, 0),
(226, 2, 1, 28, 28, 0, 0, 0),
(227, 2, 2, 28, 28, 0, 0, 0),
(228, 2, 6, 28, 28, 0, 0, 0),
(229, 2, 7, 28, 28, 0, 0, 0),
(230, 2, 1, 41, 41, 0, 0, 0),
(231, 2, 2, 41, 41, 0, 0, 0),
(232, 2, 6, 41, 41, 0, 0, 0),
(233, 2, 7, 41, 41, 0, 0, 0),
(234, 2, 1, 42, 42, 0, 0, 0),
(235, 2, 2, 42, 42, 0, 0, 0),
(236, 2, 6, 42, 42, 0, 0, 0),
(237, 2, 7, 42, 42, 0, 0, 0),
(238, 2, 1, 43, 43, 0, 0, 0),
(239, 2, 2, 43, 43, 0, 0, 0),
(240, 2, 6, 43, 43, 0, 0, 0),
(241, 2, 7, 43, 43, 0, 0, 0),
(242, 2, 1, 44, 44, 0, 0, 0),
(243, 2, 2, 44, 44, 0, 0, 0),
(244, 2, 6, 44, 44, 0, 0, 0),
(245, 2, 7, 44, 44, 0, 0, 0),
(250, 2, 1, 46, 46, 0, 0, 0),
(251, 2, 2, 46, 46, 0, 0, 0),
(252, 2, 6, 46, 46, 0, 0, 0),
(253, 2, 7, 46, 46, 0, 0, 0),
(254, 2, 1, 47, 47, 0, 0, 0),
(255, 2, 2, 47, 47, 0, 0, 0),
(256, 2, 6, 47, 47, 0, 0, 0),
(257, 2, 7, 47, 47, 0, 0, 0),
(262, 2, 1, 49, 49, 0, 0, 0),
(263, 2, 2, 49, 49, 0, 0, 0),
(264, 2, 6, 49, 49, 0, 0, 0),
(265, 2, 7, 49, 49, 0, 0, 0),
(266, 2, 1, 50, 50, 0, 0, 0),
(267, 2, 2, 50, 50, 0, 0, 0),
(268, 2, 6, 50, 50, 0, 0, 0),
(269, 2, 7, 50, 50, 0, 0, 0),
(270, 2, 1, 51, 51, 0, 0, 0),
(271, 2, 2, 51, 51, 0, 0, 0),
(272, 2, 6, 51, 51, 0, 0, 0),
(273, 2, 7, 51, 51, 0, 0, 0),
(274, 3, 1, 1, 1, 0, 0, 0),
(275, 3, 3, 1, 1, 0, 0, 0),
(276, 3, 2, 1, 1, 0, 0, 0),
(277, 3, 9, 1, 1, 0, 0, 0),
(278, 3, 10, 1, 1, 0, 0, 0),
(279, 3, 7, 1, 1, 0, 0, 0),
(280, 3, 6, 1, 1, 0, 0, 0),
(281, 3, 1, 2, 2, 0, 0, 0),
(282, 3, 3, 2, 2, 0, 0, 0),
(283, 3, 2, 2, 2, 0, 0, 0),
(284, 3, 9, 2, 2, 0, 0, 0),
(285, 3, 10, 2, 2, 0, 0, 0),
(286, 3, 7, 2, 2, 0, 0, 0),
(287, 3, 6, 2, 2, 0, 0, 0),
(288, 3, 1, 3, 3, 0, 0, 0),
(289, 3, 3, 3, 3, 0, 0, 0),
(290, 3, 2, 3, 3, 0, 0, 0),
(291, 3, 9, 3, 3, 0, 0, 0),
(292, 3, 10, 3, 3, 0, 0, 0),
(293, 3, 7, 3, 3, 0, 0, 0),
(294, 3, 6, 3, 3, 0, 0, 0),
(295, 3, 1, 4, 4, 0, 0, 0),
(296, 3, 3, 4, 4, 0, 0, 0),
(297, 3, 2, 4, 4, 0, 0, 0),
(298, 3, 9, 4, 4, 0, 0, 0),
(299, 3, 10, 4, 4, 0, 0, 0),
(300, 3, 7, 4, 4, 0, 0, 0),
(301, 3, 6, 4, 4, 0, 0, 0),
(302, 3, 1, 5, 5, 0, 0, 0),
(303, 3, 3, 5, 5, 0, 0, 0),
(304, 3, 2, 5, 5, 0, 0, 0),
(305, 3, 9, 5, 5, 0, 0, 0),
(306, 3, 10, 5, 5, 0, 0, 0),
(307, 3, 7, 5, 5, 0, 0, 0),
(308, 3, 6, 5, 5, 0, 0, 0),
(309, 3, 1, 6, 6, 0, 0, 0),
(310, 3, 3, 6, 6, 0, 0, 0),
(311, 3, 2, 6, 6, 0, 0, 0),
(312, 3, 9, 6, 6, 0, 0, 0),
(313, 3, 10, 6, 6, 0, 0, 0),
(314, 3, 7, 6, 6, 0, 0, 0),
(315, 3, 6, 6, 6, 0, 0, 0),
(316, 3, 1, 7, 7, 0, 0, 0),
(317, 3, 3, 7, 7, 0, 0, 0),
(318, 3, 2, 7, 7, 0, 0, 0),
(319, 3, 9, 7, 7, 0, 0, 0),
(320, 3, 10, 7, 7, 0, 0, 0),
(321, 3, 7, 7, 7, 0, 0, 0),
(322, 3, 6, 7, 7, 0, 0, 0),
(330, 3, 1, 9, 9, 0, 0, 0),
(331, 3, 3, 9, 9, 0, 0, 0),
(332, 3, 2, 9, 9, 0, 0, 0),
(333, 3, 9, 9, 9, 0, 0, 0),
(334, 3, 10, 9, 9, 0, 0, 0),
(335, 3, 7, 9, 9, 0, 0, 0),
(336, 3, 6, 9, 9, 0, 0, 0),
(337, 3, 1, 10, 10, 0, 0, 0),
(338, 3, 3, 10, 10, 0, 0, 0),
(339, 3, 2, 10, 10, 0, 0, 0),
(340, 3, 9, 10, 10, 0, 0, 0),
(341, 3, 10, 10, 10, 0, 0, 0),
(342, 3, 7, 10, 10, 0, 0, 0),
(343, 3, 6, 10, 10, 0, 0, 0),
(344, 3, 1, 11, 11, 0, 0, 0),
(345, 3, 3, 11, 11, 0, 0, 0),
(346, 3, 2, 11, 11, 0, 0, 0),
(347, 3, 9, 11, 11, 0, 0, 0),
(348, 3, 10, 11, 11, 0, 0, 0),
(349, 3, 7, 11, 11, 0, 0, 0),
(350, 3, 6, 11, 11, 0, 0, 0),
(351, 3, 1, 12, 12, 0, 0, 0),
(352, 3, 3, 12, 12, 0, 0, 0),
(353, 3, 2, 12, 12, 0, 0, 0),
(354, 3, 9, 12, 12, 0, 0, 0),
(355, 3, 10, 12, 12, 0, 0, 0),
(356, 3, 7, 12, 12, 0, 0, 0),
(357, 3, 6, 12, 12, 0, 0, 0),
(358, 3, 1, 13, 13, 0, 0, 0),
(359, 3, 3, 13, 13, 0, 0, 0),
(360, 3, 2, 13, 13, 0, 0, 0),
(361, 3, 9, 13, 13, 0, 0, 0),
(362, 3, 10, 13, 13, 0, 0, 0),
(363, 3, 7, 13, 13, 0, 0, 0),
(364, 3, 6, 13, 13, 0, 0, 0),
(365, 3, 1, 14, 14, 0, 0, 0),
(366, 3, 3, 14, 14, 0, 0, 0),
(367, 3, 2, 14, 14, 0, 0, 0),
(368, 3, 9, 14, 14, 0, 0, 0),
(369, 3, 10, 14, 14, 0, 0, 0),
(370, 3, 7, 14, 14, 0, 0, 0),
(371, 3, 6, 14, 14, 0, 0, 0),
(372, 3, 1, 15, 15, 0, 0, 0),
(373, 3, 3, 15, 15, 0, 0, 0),
(374, 3, 2, 15, 15, 0, 0, 0),
(375, 3, 9, 15, 15, 0, 0, 0),
(376, 3, 10, 15, 15, 0, 0, 0),
(377, 3, 7, 15, 15, 0, 0, 0),
(378, 3, 6, 15, 15, 0, 0, 0),
(379, 3, 1, 16, 16, 0, 0, 0),
(380, 3, 3, 16, 16, 0, 0, 0),
(381, 3, 2, 16, 16, 0, 0, 0),
(382, 3, 9, 16, 16, 0, 0, 0),
(383, 3, 10, 16, 16, 0, 0, 0),
(384, 3, 7, 16, 16, 0, 0, 0),
(385, 3, 6, 16, 16, 0, 0, 0),
(386, 3, 1, 17, 17, 0, 0, 0),
(387, 3, 3, 17, 17, 0, 0, 0),
(388, 3, 2, 17, 17, 0, 0, 0),
(389, 3, 9, 17, 17, 0, 0, 0),
(390, 3, 10, 17, 17, 0, 0, 0),
(391, 3, 7, 17, 17, 0, 0, 0),
(392, 3, 6, 17, 17, 0, 0, 0),
(393, 3, 1, 18, 18, 0, 0, 0),
(394, 3, 3, 18, 18, 0, 0, 0),
(395, 3, 2, 18, 18, 0, 0, 0),
(396, 3, 9, 18, 18, 0, 0, 0),
(397, 3, 10, 18, 18, 0, 0, 0),
(398, 3, 7, 18, 18, 0, 0, 0),
(399, 3, 6, 18, 18, 0, 0, 0),
(400, 3, 1, 19, 19, 0, 0, 0),
(401, 3, 3, 19, 19, 0, 0, 0),
(402, 3, 2, 19, 19, 0, 0, 0),
(403, 3, 9, 19, 19, 0, 0, 0),
(404, 3, 10, 19, 19, 0, 0, 0),
(405, 3, 7, 19, 19, 0, 0, 0),
(406, 3, 6, 19, 19, 0, 0, 0),
(407, 3, 1, 20, 20, 0, 0, 0),
(408, 3, 3, 20, 20, 0, 0, 0),
(409, 3, 2, 20, 20, 0, 0, 0),
(410, 3, 9, 20, 20, 0, 0, 0),
(411, 3, 10, 20, 20, 0, 0, 0),
(412, 3, 7, 20, 20, 0, 0, 0),
(413, 3, 6, 20, 20, 0, 0, 0),
(414, 3, 1, 21, 21, 0, 0, 0),
(415, 3, 3, 21, 21, 0, 0, 0),
(416, 3, 2, 21, 21, 0, 0, 0),
(417, 3, 9, 21, 21, 0, 0, 0),
(418, 3, 10, 21, 21, 0, 0, 0),
(419, 3, 7, 21, 21, 0, 0, 0),
(420, 3, 6, 21, 21, 0, 0, 0),
(421, 3, 1, 22, 22, 0, 0, 0),
(422, 3, 3, 22, 22, 0, 0, 0),
(423, 3, 2, 22, 22, 0, 0, 0),
(424, 3, 9, 22, 22, 0, 0, 0),
(425, 3, 10, 22, 22, 0, 0, 0),
(426, 3, 7, 22, 22, 0, 0, 0),
(427, 3, 6, 22, 22, 0, 0, 0),
(428, 3, 1, 23, 23, 0, 0, 0),
(429, 3, 3, 23, 23, 0, 0, 0),
(430, 3, 2, 23, 23, 0, 0, 0),
(431, 3, 9, 23, 23, 0, 0, 0),
(432, 3, 10, 23, 23, 0, 0, 0),
(433, 3, 7, 23, 23, 0, 0, 0),
(434, 3, 6, 23, 23, 0, 0, 0),
(435, 3, 1, 24, 24, 0, 0, 0),
(436, 3, 3, 24, 24, 0, 0, 0),
(437, 3, 2, 24, 24, 0, 0, 0),
(438, 3, 9, 24, 24, 0, 0, 0),
(439, 3, 10, 24, 24, 0, 0, 0),
(440, 3, 7, 24, 24, 0, 0, 0),
(441, 3, 6, 24, 24, 0, 0, 0),
(442, 3, 1, 25, 25, 0, 0, 0),
(443, 3, 3, 25, 25, 0, 0, 0),
(444, 3, 2, 25, 25, 0, 0, 0),
(445, 3, 9, 25, 25, 0, 0, 0),
(446, 3, 10, 25, 25, 0, 0, 0),
(447, 3, 7, 25, 25, 0, 0, 0),
(448, 3, 6, 25, 25, 0, 0, 0),
(456, 3, 1, 27, 27, 0, 0, 0),
(457, 3, 3, 27, 27, 0, 0, 0),
(458, 3, 2, 27, 27, 0, 0, 0),
(459, 3, 9, 27, 27, 0, 0, 0),
(460, 3, 10, 27, 27, 0, 0, 0),
(461, 3, 7, 27, 27, 0, 0, 0),
(462, 3, 6, 27, 27, 0, 0, 0),
(463, 3, 1, 28, 28, 0, 0, 0),
(464, 3, 3, 28, 28, 0, 0, 0),
(465, 3, 2, 28, 28, 0, 0, 0),
(466, 3, 9, 28, 28, 0, 0, 0),
(467, 3, 10, 28, 28, 0, 0, 0),
(468, 3, 7, 28, 28, 0, 0, 0),
(469, 3, 6, 28, 28, 0, 0, 0),
(470, 3, 1, 41, 41, 0, 0, 0),
(471, 3, 3, 41, 41, 0, 0, 0),
(472, 3, 2, 41, 41, 0, 0, 0),
(473, 3, 9, 41, 41, 0, 0, 0),
(474, 3, 10, 41, 41, 0, 0, 0),
(475, 3, 7, 41, 41, 0, 0, 0),
(476, 3, 6, 41, 41, 0, 0, 0),
(477, 3, 1, 42, 42, 0, 0, 0),
(478, 3, 3, 42, 42, 0, 0, 0),
(479, 3, 2, 42, 42, 0, 0, 0),
(480, 3, 9, 42, 42, 0, 0, 0),
(481, 3, 10, 42, 42, 0, 0, 0),
(482, 3, 7, 42, 42, 0, 0, 0),
(483, 3, 6, 42, 42, 0, 0, 0),
(484, 3, 1, 43, 43, 0, 0, 0),
(485, 3, 3, 43, 43, 0, 0, 0),
(486, 3, 2, 43, 43, 0, 0, 0),
(487, 3, 9, 43, 43, 0, 0, 0),
(488, 3, 10, 43, 43, 0, 0, 0),
(489, 3, 7, 43, 43, 0, 0, 0),
(490, 3, 6, 43, 43, 0, 0, 0),
(491, 3, 1, 44, 44, 0, 0, 0),
(492, 3, 3, 44, 44, 0, 0, 0),
(493, 3, 2, 44, 44, 0, 0, 0),
(494, 3, 9, 44, 44, 0, 0, 0),
(495, 3, 10, 44, 44, 0, 0, 0),
(496, 3, 7, 44, 44, 0, 0, 0),
(497, 3, 6, 44, 44, 0, 0, 0),
(505, 3, 1, 46, 46, 0, 0, 0),
(506, 3, 3, 46, 46, 0, 0, 0),
(507, 3, 2, 46, 46, 0, 0, 0),
(508, 3, 9, 46, 46, 0, 0, 0),
(509, 3, 10, 46, 46, 0, 0, 0),
(510, 3, 7, 46, 46, 0, 0, 0),
(511, 3, 6, 46, 46, 0, 0, 0),
(512, 3, 1, 47, 47, 0, 0, 0),
(513, 3, 3, 47, 47, 0, 0, 0),
(514, 3, 2, 47, 47, 0, 0, 0),
(515, 3, 9, 47, 47, 0, 0, 0),
(516, 3, 10, 47, 47, 0, 0, 0),
(517, 3, 7, 47, 47, 0, 0, 0),
(518, 3, 6, 47, 47, 0, 0, 0),
(526, 3, 1, 49, 49, 0, 0, 0),
(527, 3, 3, 49, 49, 0, 0, 0),
(528, 3, 2, 49, 49, 0, 0, 0),
(529, 3, 9, 49, 49, 0, 0, 0),
(530, 3, 10, 49, 49, 0, 0, 0),
(531, 3, 7, 49, 49, 0, 0, 0),
(532, 3, 6, 49, 49, 0, 0, 0),
(533, 3, 1, 50, 50, 0, 0, 0),
(534, 3, 3, 50, 50, 0, 0, 0),
(535, 3, 2, 50, 50, 0, 0, 0),
(536, 3, 9, 50, 50, 0, 0, 0),
(537, 3, 10, 50, 50, 0, 0, 0),
(538, 3, 7, 50, 50, 0, 0, 0),
(539, 3, 6, 50, 50, 0, 0, 0),
(540, 3, 1, 51, 51, 0, 0, 0),
(541, 3, 3, 51, 51, 0, 0, 0),
(542, 3, 2, 51, 51, 0, 0, 0),
(543, 3, 9, 51, 51, 0, 0, 0),
(544, 3, 10, 51, 51, 0, 0, 0),
(545, 3, 7, 51, 51, 0, 0, 0),
(546, 3, 6, 51, 51, 0, 0, 0),
(547, 4, 1, 1, 1, 0, 0, 0),
(548, 4, 12, 1, 1, 0, 0, 0),
(549, 4, 4, 1, 1, 0, 0, 0),
(550, 4, 5, 1, 1, 0, 0, 0),
(551, 4, 1, 2, 2, 0, 0, 0),
(552, 4, 12, 2, 2, 0, 0, 0),
(553, 4, 4, 2, 2, 0, 0, 0),
(554, 4, 5, 2, 2, 0, 0, 0),
(555, 4, 1, 3, 3, 0, 0, 0),
(556, 4, 12, 3, 3, 0, 0, 0),
(557, 4, 4, 3, 3, 0, 0, 0),
(558, 4, 5, 3, 3, 0, 0, 0),
(559, 4, 1, 4, 4, 0, 0, 0),
(560, 4, 12, 4, 4, 0, 0, 0),
(561, 4, 4, 4, 4, 0, 0, 0),
(562, 4, 5, 4, 4, 0, 0, 0),
(563, 4, 1, 5, 5, 0, 0, 0),
(564, 4, 12, 5, 5, 0, 0, 0),
(565, 4, 4, 5, 5, 0, 0, 0),
(566, 4, 5, 5, 5, 0, 0, 0),
(567, 4, 1, 6, 6, 0, 0, 0),
(568, 4, 12, 6, 6, 0, 0, 0),
(569, 4, 4, 6, 6, 0, 0, 0),
(570, 4, 5, 6, 6, 0, 0, 0),
(571, 4, 1, 7, 7, 0, 0, 0),
(572, 4, 12, 7, 7, 0, 0, 0),
(573, 4, 4, 7, 7, 0, 0, 0),
(574, 4, 5, 7, 7, 0, 0, 0),
(579, 4, 1, 9, 9, 0, 0, 0),
(580, 4, 12, 9, 9, 0, 0, 0),
(581, 4, 4, 9, 9, 0, 0, 0),
(582, 4, 5, 9, 9, 0, 0, 0),
(583, 4, 1, 10, 10, 0, 0, 0),
(584, 4, 12, 10, 10, 0, 0, 0),
(585, 4, 4, 10, 10, 0, 0, 0),
(586, 4, 5, 10, 10, 0, 0, 0),
(587, 4, 1, 11, 11, 0, 0, 0),
(588, 4, 12, 11, 11, 0, 0, 0),
(589, 4, 4, 11, 11, 0, 0, 0),
(590, 4, 5, 11, 11, 0, 0, 0),
(591, 4, 1, 12, 12, 0, 0, 0),
(592, 4, 12, 12, 12, 0, 0, 0),
(593, 4, 4, 12, 12, 0, 0, 0),
(594, 4, 5, 12, 12, 0, 0, 0),
(595, 4, 1, 13, 13, 0, 0, 0),
(596, 4, 12, 13, 13, 0, 0, 0),
(597, 4, 4, 13, 13, 0, 0, 0),
(598, 4, 5, 13, 13, 0, 0, 0),
(599, 4, 1, 14, 14, 0, 0, 0),
(600, 4, 12, 14, 14, 0, 0, 0),
(601, 4, 4, 14, 14, 0, 0, 0),
(602, 4, 5, 14, 14, 0, 0, 0),
(603, 4, 1, 15, 15, 0, 0, 0),
(604, 4, 12, 15, 15, 0, 0, 0),
(605, 4, 4, 15, 15, 0, 0, 0),
(606, 4, 5, 15, 15, 0, 0, 0),
(607, 4, 1, 16, 16, 0, 0, 0),
(608, 4, 12, 16, 16, 0, 0, 0),
(609, 4, 4, 16, 16, 0, 0, 0),
(610, 4, 5, 16, 16, 0, 0, 0),
(611, 4, 1, 17, 17, 0, 0, 0),
(612, 4, 12, 17, 17, 0, 0, 0),
(613, 4, 4, 17, 17, 0, 0, 0),
(614, 4, 5, 17, 17, 0, 0, 0),
(615, 4, 1, 18, 18, 0, 0, 0),
(616, 4, 12, 18, 18, 0, 0, 0),
(617, 4, 4, 18, 18, 0, 0, 0),
(618, 4, 5, 18, 18, 0, 0, 0),
(619, 4, 1, 19, 19, 0, 0, 0),
(620, 4, 12, 19, 19, 0, 0, 0),
(621, 4, 4, 19, 19, 0, 0, 0),
(622, 4, 5, 19, 19, 0, 0, 0),
(623, 4, 1, 20, 20, 0, 0, 0),
(624, 4, 12, 20, 20, 0, 0, 0),
(625, 4, 4, 20, 20, 0, 0, 0),
(626, 4, 5, 20, 20, 0, 0, 0),
(627, 4, 1, 21, 21, 0, 0, 0),
(628, 4, 12, 21, 21, 0, 0, 0),
(629, 4, 4, 21, 21, 0, 0, 0),
(630, 4, 5, 21, 21, 0, 0, 0),
(631, 4, 1, 22, 22, 0, 0, 0),
(632, 4, 12, 22, 22, 0, 0, 0),
(633, 4, 4, 22, 22, 0, 0, 0),
(634, 4, 5, 22, 22, 0, 0, 0),
(635, 4, 1, 23, 23, 0, 0, 0),
(636, 4, 12, 23, 23, 0, 0, 0),
(637, 4, 4, 23, 23, 0, 0, 0),
(638, 4, 5, 23, 23, 0, 0, 0),
(639, 4, 1, 24, 24, 0, 0, 0),
(640, 4, 12, 24, 24, 0, 0, 0),
(641, 4, 4, 24, 24, 0, 0, 0),
(642, 4, 5, 24, 24, 0, 0, 0),
(643, 4, 1, 25, 25, 0, 0, 0),
(644, 4, 12, 25, 25, 0, 0, 0),
(645, 4, 4, 25, 25, 0, 0, 0),
(646, 4, 5, 25, 25, 0, 0, 0),
(651, 4, 1, 27, 27, 0, 0, 0),
(652, 4, 12, 27, 27, 0, 0, 0),
(653, 4, 4, 27, 27, 0, 0, 0),
(654, 4, 5, 27, 27, 0, 0, 0),
(655, 4, 1, 28, 28, 0, 0, 0),
(656, 4, 12, 28, 28, 0, 0, 0),
(657, 4, 4, 28, 28, 0, 0, 0),
(658, 4, 5, 28, 28, 0, 0, 0),
(659, 4, 1, 41, 41, 0, 0, 0),
(660, 4, 12, 41, 41, 0, 0, 0),
(661, 4, 4, 41, 41, 0, 0, 0),
(662, 4, 5, 41, 41, 0, 0, 0),
(663, 4, 1, 42, 42, 0, 0, 0),
(664, 4, 12, 42, 42, 0, 0, 0),
(665, 4, 4, 42, 42, 0, 0, 0),
(666, 4, 5, 42, 42, 0, 0, 0),
(667, 4, 1, 43, 43, 0, 0, 0),
(668, 4, 12, 43, 43, 0, 0, 0),
(669, 4, 4, 43, 43, 0, 0, 0),
(670, 4, 5, 43, 43, 0, 0, 0),
(671, 4, 1, 44, 44, 0, 0, 0),
(672, 4, 12, 44, 44, 0, 0, 0),
(673, 4, 4, 44, 44, 0, 0, 0),
(674, 4, 5, 44, 44, 0, 0, 0),
(679, 4, 1, 46, 46, 0, 0, 0),
(680, 4, 12, 46, 46, 0, 0, 0),
(681, 4, 4, 46, 46, 0, 0, 0),
(682, 4, 5, 46, 46, 0, 0, 0),
(683, 4, 1, 47, 47, 0, 0, 0),
(684, 4, 12, 47, 47, 0, 0, 0),
(685, 4, 4, 47, 47, 0, 0, 0),
(686, 4, 5, 47, 47, 0, 0, 0),
(691, 4, 1, 49, 49, 0, 0, 0),
(692, 4, 12, 49, 49, 0, 0, 0),
(693, 4, 4, 49, 49, 0, 0, 0),
(694, 4, 5, 49, 49, 0, 0, 0),
(695, 4, 1, 50, 50, 0, 0, 0),
(696, 4, 12, 50, 50, 0, 0, 0),
(697, 4, 4, 50, 50, 0, 0, 0),
(698, 4, 5, 50, 50, 0, 0, 0),
(699, 4, 1, 51, 51, 0, 0, 0),
(700, 4, 12, 51, 51, 0, 0, 0),
(701, 4, 4, 51, 51, 0, 0, 0),
(702, 4, 5, 51, 51, 0, 0, 0),
(1137, 1, 1, 3, 3, 3, 3, 0),
(1138, 1, 1, 13, 13, 13, 13, 13),
(1139, 1, 1, 71, 71, 71, 71, 71),
(1140, 1, 1, 2, 2, 2, 2, 2),
(1141, 1, 1, 1, 1, 1, 1, 1),
(1142, 1, 1, 46, 46, 46, 46, 46),
(1143, 1, 1, 15, 15, 15, 15, 15),
(1144, 1, 1, 9, 9, 9, 9, 9),
(1145, 1, 1, 47, 47, 47, 47, 47),
(1146, 1, 1, 49, 49, 49, 49, 49),
(1147, 1, 1, 14, 14, 14, 14, 14),
(1148, 1, 1, 42, 42, 42, 42, 42),
(1149, 1, 1, 43, 43, 43, 43, 43),
(1150, 1, 1, 51, 51, 51, 51, 51),
(1151, 1, 1, 16, 16, 16, 16, 0),
(1152, 1, 1, 44, 44, 44, 44, 44),
(1153, 1, 1, 50, 50, 50, 50, 50),
(1154, 1, 1, 29, 29, 29, 29, 29),
(1155, 1, 1, 12, 12, 12, 12, 12),
(1156, 1, 1, 11, 11, 11, 11, 11),
(1157, 1, 1, 5, 5, 5, 5, 5),
(1158, 1, 1, 10, 10, 10, 10, 10),
(1159, 1, 1, 4, 4, 4, 4, 4),
(1160, 1, 1, 7, 7, 7, 7, 7),
(1161, 1, 1, 6, 6, 6, 6, 6),
(1162, 1, 1, 27, 27, 27, 27, 27),
(1163, 1, 1, 17, 17, 17, 17, 17),
(1164, 1, 1, 21, 21, 21, 21, 21),
(1165, 1, 1, 28, 28, 28, 28, 28),
(1166, 1, 1, 24, 24, 24, 24, 24),
(1167, 1, 1, 20, 20, 20, 20, 20),
(1168, 1, 1, 18, 18, 18, 18, 18),
(1169, 1, 1, 19, 19, 19, 19, 19),
(1170, 1, 1, 22, 22, 22, 22, 22),
(1171, 1, 1, 25, 25, 25, 25, 25),
(1172, 1, 1, 23, 23, 23, 23, 23),
(1198, 1, 3, 71, 71, 71, 71, 71),
(1199, 1, 3, 2, 2, 2, 2, 2),
(1200, 1, 3, 1, 1, 1, 1, 1),
(1201, 1, 3, 46, 46, 46, 46, 46),
(1202, 1, 3, 15, 15, 15, 15, 15),
(1203, 1, 3, 9, 9, 0, 0, 0),
(1204, 1, 3, 47, 47, 47, 47, 47),
(1205, 1, 3, 49, 49, 0, 0, 0),
(1206, 1, 3, 14, 14, 14, 14, 14),
(1207, 1, 3, 42, 42, 0, 0, 0),
(1208, 1, 3, 43, 43, 0, 0, 0),
(1209, 1, 3, 51, 51, 0, 0, 0),
(1210, 1, 3, 44, 44, 44, 44, 44),
(1211, 1, 3, 50, 50, 0, 0, 0),
(1212, 1, 3, 12, 12, 12, 12, 12),
(1213, 1, 3, 10, 10, 10, 10, 10),
(1214, 1, 2, 3, 3, 0, 0, 0),
(1215, 1, 2, 13, 13, 0, 0, 0),
(1216, 1, 2, 71, 71, 71, 71, 71),
(1217, 1, 2, 2, 2, 2, 2, 2),
(1218, 1, 2, 1, 1, 1, 1, 1),
(1219, 1, 2, 46, 46, 46, 46, 46),
(1220, 1, 2, 15, 15, 15, 15, 15),
(1221, 1, 2, 9, 9, 0, 0, 0),
(1222, 1, 2, 47, 47, 47, 47, 47),
(1223, 1, 2, 49, 49, 0, 0, 0),
(1224, 1, 2, 14, 14, 14, 14, 14),
(1225, 1, 2, 42, 42, 0, 0, 0),
(1226, 1, 2, 43, 43, 0, 0, 0),
(1227, 1, 2, 51, 51, 0, 0, 0),
(1228, 1, 2, 44, 44, 44, 44, 44),
(1229, 1, 2, 50, 50, 0, 0, 0),
(1230, 1, 2, 29, 29, 29, 29, 29),
(1231, 1, 2, 12, 12, 12, 12, 12),
(1232, 1, 2, 11, 11, 0, 0, 0),
(1233, 1, 2, 5, 5, 0, 0, 0),
(1234, 1, 2, 10, 10, 0, 0, 0),
(1235, 1, 2, 4, 4, 0, 0, 0),
(1236, 1, 2, 7, 7, 0, 0, 0),
(1237, 1, 2, 6, 6, 0, 0, 0);

-- --------------------------------------------------------

--
-- Table structure for table `vipscapl_email_inbox`
--

CREATE TABLE `vipscapl_email_inbox` (
  `id` int(10) UNSIGNED NOT NULL,
  `user_id` int(10) UNSIGNED NOT NULL,
  `to` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `from` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `subject` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `message_body` text COLLATE utf8_unicode_ci,
  `type` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'inbox' COMMENT 'inbox,sent,draft,trash',
  `view_status` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '2' COMMENT '1=Read 2=Unread',
  `favourites` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0' COMMENT '0= no 1=yes',
  `notify_me` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '1' COMMENT '1=on 0=off',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `vipscapl_email_inbox`
--

INSERT INTO `vipscapl_email_inbox` (`id`, `user_id`, `to`, `from`, `subject`, `message_body`, `type`, `view_status`, `favourites`, `notify_me`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 13, 'admin@gmail.com', 'user@gmail.com', 'Leave request', '<div style=\"color: rgb(51, 51, 51); font-family: &quot;Open Sans&quot;, &quot;Helvetica Neue&quot;, Helvetica, Arial, sans-serif; font-size: 13px;\">I am writing to request for a leave on 1st Feb, 2020, Saturday second half due to I have to go out with family. Kindly grant me the leave.<br></div><div style=\"color: rgb(51, 51, 51); font-family: &quot;Open Sans&quot;, &quot;Helvetica Neue&quot;, Helvetica, Arial, sans-serif; font-size: 13px; outline: none 0px;\"><br></div><div style=\"color: rgb(51, 51, 51); font-family: &quot;Open Sans&quot;, &quot;Helvetica Neue&quot;, Helvetica, Arial, sans-serif; font-size: 13px; outline: none 0px;\">Thank you.</div><div style=\"color: rgb(51, 51, 51); font-family: &quot;Open Sans&quot;, &quot;Helvetica Neue&quot;, Helvetica, Arial, sans-serif; font-size: 13px; outline: none 0px;\">Kevin Bailey</div>', 'inbox', '1', '1', '1', '2020-02-11 03:32:59', '2020-02-11 03:34:12', NULL),
(2, 1, 'user@gmail.com', 'admin@gmail.com', 'Leave request', '<div style=\"color: rgb(51, 51, 51); font-family: &quot;Open Sans&quot;, &quot;Helvetica Neue&quot;, Helvetica, Arial, sans-serif; font-size: 13px;\">Hi,<br></div><div style=\"color: rgb(51, 51, 51); font-family: &quot;Open Sans&quot;, &quot;Helvetica Neue&quot;, Helvetica, Arial, sans-serif; font-size: 13px;\"><br></div><div style=\"color: rgb(51, 51, 51); font-family: &quot;Open Sans&quot;, &quot;Helvetica Neue&quot;, Helvetica, Arial, sans-serif; font-size: 13px;\">Approved.</div><div style=\"color: rgb(51, 51, 51); font-family: &quot;Open Sans&quot;, &quot;Helvetica Neue&quot;, Helvetica, Arial, sans-serif; font-size: 13px;\"><br></div><div style=\"color: rgb(51, 51, 51); font-family: &quot;Open Sans&quot;, &quot;Helvetica Neue&quot;, Helvetica, Arial, sans-serif; font-size: 13px;\">Thanks!</div>', 'inbox', '2', '0', '1', '2020-02-11 03:35:12', '2020-02-11 03:35:12', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `vipscapl_email_inbox_attachment`
--

CREATE TABLE `vipscapl_email_inbox_attachment` (
  `id` int(10) UNSIGNED NOT NULL,
  `mailbox_id` int(10) UNSIGNED DEFAULT NULL,
  `file_name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `file_extension` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `file_size` bigint(20) NOT NULL,
  `file_hash` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `mime_type` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `vipscapl_email_template`
--

CREATE TABLE `vipscapl_email_template` (
  `id` int(10) UNSIGNED NOT NULL,
  `email_group_id` int(10) UNSIGNED DEFAULT NULL,
  `template_name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `template_subject` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `template_body` text COLLATE utf8_unicode_ci,
  `type` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `vipscapl_email_template`
--

INSERT INTO `vipscapl_email_template` (`id`, `email_group_id`, `template_name`, `template_subject`, `template_body`, `type`, `deleted_at`, `created_at`, `updated_at`) VALUES
(1, 1, 'Activate Account', 'Activate Account', '<p>Welcome to {SITE_NAME}!</p>\n                    <p>Thanks for joining {SITE_NAME}. We listed your sign in details below, make sure you keep them safe.</p><p>To verify your email address, please follow this link:<br><big><strong><a href=\"{ACTIVATE_URL}\">Finish your registration...</a></strong></big><br>Link doesn\'t work? Copy the following link to your browser address bar:<br><a href=\"{ACTIVATE_URL}\">{ACTIVATE_URL}</a></p><p><br>Please verify your email within {ACTIVATION_PERIOD} hours, otherwise your registration will become invalid and you will have to register again.<br>Your username: {USERNAME}<br>Your email address: {EMAIL}<br>Your password: {PASSWORD}<br><br>Have fun!<br>The {SITE_NAME} Team</p>', 'activate_account', NULL, NULL, NULL),
(2, 1, 'Change Email', 'Change Email', '<p>New email address on {SITE_NAME}</p>\n                    <p>You have changed your email address for {SITE_NAME}.<br>Follow this link to confirm your new email address:<br><big><strong><a href=\"{NEW_EMAIL_KEY_URL}\">Confirm your new email</a></strong></big><br>Link doesn\'t work? Copy the following link to your browser address bar:<br><a href=\"{NEW_EMAIL_KEY_URL}\">{NEW_EMAIL_KEY_URL}</a><br><br>Your email address: {NEW_EMAIL}<br><br>You received this email, because it was requested by a <a href=\"{SITE_URL}\">{SITE_NAME}</a> user. If you have received this by mistake, please DO NOT click the confirmation link, and simply delete this email. After a short time, the request will be removed from the system.<br><br>Thank you,<br>The {SITE_NAME} Team</p>', 'change_email', NULL, NULL, NULL),
(3, 1, 'Forgot Password', 'Forgot Password', '<p>Forgot your password, huh? No big deal.<br>To create a new password, just follow this link:<br><br><big><strong><a href=\"{PASS_KEY_URL}\">Create a new password</a></strong></big><br>Link doesn\'t work? Copy the following link to your browser address bar:<br><a href=\"{PASS_KEY_URL}\">{PASS_KEY_URL}</a><br>You received this email, because it was requested by a <a href=\"{SITE_URL}\">{SITE_NAME}</a> user.</p>\n                    <p>This is part of the procedure to create a new password on the system. If you DID NOT request a new password then please ignore this email and your password will remain the same.</p>\n                    <p><br>Thank you,<br>The {SITE_NAME} Team</p>', 'forgot_password', NULL, NULL, NULL),
(4, 1, 'Register Email', 'Register Email', '<p>Welcome to {SITE_NAME}</p>\n                    <p>Thanks for joining {SITE_NAME}. We listed your sign in details below, make sure you keep them safe.<br>To open your {SITE_NAME} homepage, please follow this link:<br><big><strong><a href=\"{SITE_URL}\">{SITE_NAME} Account!</a></strong></big><br>Link doesn\'t work? Copy the following link to your browser address bar:<br><a href=\"{SITE_URL}\">{SITE_URL}</a><br>Your username: {USERNAME}<br>Your email address: {EMAIL}<br>Your password: {PASSWORD}<br>Have fun!<br>The {SITE_NAME} Team.<br>&nbsp;</p>', 'register_email', NULL, NULL, NULL),
(5, 1, 'Reset Password', 'Reset Password', '<p>New password on {SITE_NAME}</p>\n                    <p>You have changed your password.<br>Please, keep it in your records so you don\'t forget it.</p>\n                    <p>Your username: {USERNAME}<br>Your email address: {EMAIL}<br>Your new password: {NEW_PASSWORD}<br><br>Thank you,<br>The {SITE_NAME} Team</p>', 'reset_password', NULL, NULL, NULL),
(6, 1, 'Welcome Email', 'Welcome Email', '<p>Hello <strong>{NAME}</strong>,</p>\n                    <p>Welcome to <strong>{COMPANY_NAME}</strong> .Thanks for joining <strong>{COMPANY_NAME}</strong>.</p>\n                    <p>We just wanted to say welcome.</p>\n                    <p>Please contact us if you need any help.</p>\n                    <p>Click here to view your profile: <strong><a href=\"{COMPANY_URL}\">View Profile</a></strong></p>\n                    <p><br>Have fun!<br>The <strong>{COMPANY_NAME}</strong> Team.</p>', 'welcome_email', NULL, NULL, NULL),
(7, 1, 'Meeting', 'Meeting', 'Hi <strong>{NAME}</strong>,\n                    <div><br></div>\n                    <div>A meeting has been scheduled on <strong>{MEETING_DATE}</strong>, in the <strong>{LOCATION}</strong> at <strong>{MEETING_TIME}</strong>.</div>\n                    <div><br></div>\n                    <div>{DESCRIPTION}</div>\n                    <div><br></div>\n                    <div>Have fun!<br>The&nbsp;<strong>{COMPANY_NAME}</strong>&nbsp;Team.<br></div>\n                    <div><br></div>', 'meeting', NULL, NULL, NULL),
(8, 1, 'Announcement', 'Announcement', 'Hi <strong>{NAME}</strong>,\n                    <div><br></div>\n                    <div><strong>{TITLE}</strong></div>\n                    <div><br></div>\n                    <div><strong>Start Date :</strong> {START_DATE}</div>\n                    <div><strong>End Date :</strong> {END_DATE}</div>\n                    <div><br></div>\n                    <div>{DESCRIPTION}</div>\n                    <div><br></div>\n                    <div>Have fun!<br>The&nbsp;<strong>{COMPANY_NAME}</strong>&nbsp;Team.<br></div>\n                    <div><br></div>', 'announcement', NULL, NULL, NULL),
(9, 2, 'Assigned Project', 'Assigned Project', '<p>Hi There,</p><p>A<strong> {PROJECT_NAME}</strong> has been assigned by <strong>{ASSIGNED_BY} </strong>to you.You can view this project by logging in to the portal using the link below:<br><br><big><a href=\"{PROJECT_URL}\"><strong>View Project</strong></a></big><br><br>Best Regards<br>The {SITE_NAME} Team</p><p>&nbsp;</p>', 'assigned_project', NULL, NULL, NULL),
(10, 2, 'Notification Client', 'New Project Created', '<p>Hello, <strong>{CLIENT_NAME}</strong>,<br /><br />we have created a new project with your account.<br /><br />Project name : <strong>{PROJECT_NAME}</strong><br />You can login to see the status of your project by using this link:<br /><big><a href=\"{PROJECT_LINK}\"><strong>View Project</strong></a></big></p><p><br />Best Regards<br />The {SITE_NAME} Team</p><p>&nbsp;</p>', 'notification_client', NULL, NULL, NULL),
(11, 2, 'Complete Projects', 'Project Completed', '<p>Hi <strong>{CLIENT_NAME}</strong>,</p><p>Project : <strong>{PROJECT_NAME}</strong> &nbsp;has been completed.<br />You can view the project by logging into your portal Account:<br /><big><a href=\"{PROJECT_LINK}\"><strong>View Project</strong></a></big><br /><br />Best Regards,<br />The {SITE_NAME} Team</p>', 'complete_projects', NULL, NULL, NULL),
(12, 2, 'Project Comments', 'New Project Comment Received', '<p>Hi There,</p><p>A new comment has been posted by <strong>{POSTED_BY}</strong> to project <strong>{PROJECT_NAME}</strong>.</p><p>You can view the comment using the link below:<br /><big><a href=\"{COMMENT_URL}\"><strong>View Project</strong></a></big><br /><br /><em>{COMMENT_MESSAGE}</em><br /><br />Best Regards,<br />The {SITE_NAME} Team</p>', 'project_comments', NULL, NULL, NULL),
(13, 2, 'Project Attachment', 'New Project Attachment', '<p>Hi There,</p><p>A new file has been uploaded by <strong>{UPLOADED_BY}</strong> to project <strong>{PROJECT_NAME}</strong>.<br />You can view the Project using the link below:<br><br><big><a href=\"{PROJECT_URL}\"><strong>View Project</strong></a></big><br /><br />Best Regards,<br />The {SITE_NAME} Team</p>', 'project_attachment', NULL, NULL, NULL),
(14, 3, 'Task Assigned', 'Task Assigned', '<p>Hi there,</p><p>A new task <strong>{TASK_NAME}</strong> &nbsp;has been assigned to you by <strong>{ASSIGNED_BY}</strong>.</p><p>You can view this task by logging in to the portal using the link below.</p><p><big><strong><a href=\"{TASK_URL}\">View Task</a></strong></big><br><br>Regards<br>The {SITE_NAME} Team</p>', 'task_assigned', NULL, NULL, NULL),
(15, 3, 'Task Comments', 'New Task Comment Received', '<p>Hi There,</p><p>A new comment has been posted by <strong>{POSTED_BY}</strong> to <strong>{TASK_NAME}</strong>.</p><p>You can view the comment using the link below:<br /><big><strong><a href=\"{COMMENT_URL}\">View Comment</a></strong></big><br /><br /><em>{COMMENT_MESSAGE}</em><br /><br />Best Regards,<br />The {SITE_NAME} Team</p>', 'task_comments', NULL, NULL, NULL),
(16, 3, 'Tasks Attachment', 'New Tasks Attachment', '<p>Hi There,</p><p>A new file has been uploaded by <strong>{UPLOADED_BY} </strong>to Task <strong>{TASK_NAME}</strong>.<br>You can view the Task&nbsp;using the link below:</p><p><br><big><a href=\"{TASK_URL}\"><strong>View Task</strong></a></big><br><br>Best Regards,<br>The {SITE_NAME} Team</p>', 'task_attachment', NULL, NULL, NULL),
(17, 3, 'Task Updated', 'Task Updated', '<p>Hi there,</p><p><strong>{TASK_NAME}</strong> has been updated by <strong>{ASSIGNED_BY}</strong>.</p><p>You can view this Task by logging in to the portal using the link below.</p><p><br /><big><strong><a href=\"{TASK_URL}\">View Task</a></strong></big><br /><br />Regards<br />The {SITE_NAME} Team</p>', 'task_updated', NULL, NULL, NULL),
(18, 4, 'Defect Assigned', 'New Defect Assigned', '<p>Hi there,</p><p>A new defect &nbsp;{DEFECT_TITLE} &nbsp;has been assigned to you by {ASSIGNED_BY}.</p><p>You can view this defect by logging in to the portal using the link below.</p><p><br /><big><strong><a href=\"{DEFECT_URL}\">View Defect</a></strong></big><br /><br />Regards<br />The {SITE_NAME} Team</p>', 'defect_assigned', NULL, NULL, NULL),
(19, 4, 'Defect Comments', 'New Defect Comment Received', '<p>Hi there,</p><p>A new comment has been posted by {POSTED_BY} to defect {DEFECT_TITLE}.</p><p>You can view the comment using the link below.</p><p><em>{COMMENT_MESSAGE}</em></p><p><br /><big><strong><a href=\"{COMMENT_URL}\">View Comment</a></strong></big><br><br>Regards<br />The {SITE_NAME} Team</p><p>&nbsp;</p>', 'defect_comments', NULL, NULL, NULL),
(20, 4, 'Defect Attachment', 'New Defect Attachment', '<p>Hi there,</p><p>A new attachment&nbsp;has been uploaded by {UPLOADED_BY} to issue {DEFECT_TITLE}.</p><p>You can view the defect using the link below.</p><p><br /><big><strong><a href=\"{DEFECT_URL}\">View Defect</a></strong></big></p><p><br />Regards<br />The {SITE_NAME} Team</p>', 'defect_attachment', NULL, NULL, NULL),
(21, 4, 'Defect Updated', 'Defect Status Changed', '<p>Hi there,</p><p>Defect {DEFECT_TITLE} has been marked as {STATUS} by {MARKED_BY}.</p><p>You can view this defect by logging in to the portal using the link below.</p><p><big><strong><a href=\"{DEFECT_URL}\">View Defect</a></strong></big><br />Regards<br />The {SITE_NAME} Team</p><p>&nbsp;</p>', 'defect_updated', NULL, NULL, NULL),
(22, 5, 'Incident Assigned', 'New Incident Assigned', '<p>Hi there,</p><p>A new incident &nbsp;<big><strong>{INCIDENT_TITLE}</big></strong> &nbsp;has been assigned to you by {ASSIGNED_BY}.</p><p>You can view this incident by logging in to the portal using the link below.</p><p><br><big><strong><a href=\"{INCIDENT_URL}\">View Incident</a></strong></big><br><br>Regards<br>The {SITE_NAME} Team</p>', 'incident_assigned', NULL, NULL, NULL),
(23, 5, 'Incident Comments', 'New Incident Comment Received', '<p>Hi there,</p><p>A new comment has been posted by {POSTED_BY} to incident {INCIDENT_TITLE}.</p><p>You can view the comment using the link below.</p><p><em>{COMMENT_MESSAGE}</em></p><p><br><big><strong><a href=\"{COMMENT_URL}\">View Comment</a></strong></big><br><br>Regards<br>The {SITE_NAME} Team</p><p>&nbsp;</p>', 'incident_comments', NULL, NULL, NULL),
(24, 5, 'Incident Attachment', 'New Incident Attachment', '<p>Hi there,</p><p>A new attachment&nbsp;has been uploaded by {UPLOADED_BY} to issue {INCIDENT_TITLE}.</p><p>You can view the incident using the link below.</p><p><br><big><strong><a href=\"{INCIDENT_URL}\">View Incident</a></strong></big></p><p><br>Regards<br>The {SITE_NAME} Team</p>', 'incident_attachment', NULL, NULL, NULL),
(25, 5, 'Incident Updated', 'Incident Status Changed', '<p>Hi there,</p><p>Incident {INCIDENT_TITLE} has been marked as {STATUS} by {MARKED_BY}.</p><p>You can view this incident by logging in to the portal using the link below.</p><p><big><strong><a href=\"{INCIDENT_URL}\">View Incident</a></strong></big><br>Regards<br>The {SITE_NAME} Team</p><p>&nbsp;</p>', 'incident_updated', NULL, NULL, NULL),
(26, 6, 'Appointment Mail', 'Appointment Mail', 'Hi <strong>{NAME}</strong>,<br><div>A appointment has been scheduled on <strong>{APPOINTEMENT_DATE}</strong>, in the <strong>{LOCATION}</strong> at <strong>{APPOINTEMENT_TIME}</strong>.</div><br><div>{DESCRIPTION}</div><br><div>Have fun!<br>The&nbsp;<strong>{COMPANY_NAME}</strong>&nbsp;Team.<br></div>', 'appointment_mail', NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `vipscapl_email_template_groups`
--

CREATE TABLE `vipscapl_email_template_groups` (
  `id` int(10) UNSIGNED NOT NULL,
  `email_group_name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `vipscapl_email_template_groups`
--

INSERT INTO `vipscapl_email_template_groups` (`id`, `email_group_name`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 'Account Emails', NULL, NULL, NULL),
(2, 'Project Emails', NULL, NULL, NULL),
(3, 'Task Emails', NULL, NULL, NULL),
(4, 'Defects Email', NULL, NULL, NULL),
(5, 'Incidents Email', NULL, NULL, NULL),
(6, 'Appointment Emails', NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `vipscapl_files`
--

CREATE TABLE `vipscapl_files` (
  `id` int(10) UNSIGNED NOT NULL,
  `user_id` int(10) UNSIGNED NOT NULL,
  `folder_id` int(11) NOT NULL,
  `file_name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `file_extension` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `file_size` bigint(20) NOT NULL,
  `file_hash` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `vipscapl_folders`
--

CREATE TABLE `vipscapl_folders` (
  `id` int(10) UNSIGNED NOT NULL,
  `user_id` int(10) UNSIGNED NOT NULL,
  `folder_name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `parent_folder` int(11) NOT NULL,
  `folder_desc` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `vipscapl_folders`
--

INSERT INTO `vipscapl_folders` (`id`, `user_id`, `folder_name`, `parent_folder`, `folder_desc`, `created_at`, `updated_at`) VALUES
(1, 1, 'CAPL', 0, '', '2020-02-11 03:50:43', '2020-02-11 03:50:43'),
(2, 13, 'CAPL Kevin', 0, '', '2020-02-11 16:22:31', '2020-02-11 16:22:31'),
(3, 11, 'CAPL Eric', 0, '', '2020-02-14 12:00:59', '2020-02-14 12:00:59'),
(4, 1, 'VipsPM', 0, '', '2020-05-18 10:48:13', '2020-05-18 10:48:13'),
(5, 13, 'VipsPM', 0, '', '2020-05-18 11:05:52', '2020-05-18 11:05:52'),
(6, 11, 'VipsPM', 0, '', '2020-05-18 11:29:33', '2020-05-18 11:29:33');

-- --------------------------------------------------------

--
-- Table structure for table `vipscapl_form`
--

CREATE TABLE `vipscapl_form` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `table_name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `status` tinyint(4) NOT NULL DEFAULT '1',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `vipscapl_form`
--

INSERT INTO `vipscapl_form` (`id`, `name`, `table_name`, `status`, `created_at`, `updated_at`) VALUES
(1, 'Project', 'vipscapl_projects', 1, NULL, NULL),
(2, 'Task', 'vipscapl_tasks', 1, NULL, NULL),
(3, 'Defect', 'vipscapl_defects', 1, NULL, NULL),
(4, 'Incident', 'vipscapl_incidents', 1, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `vipscapl_holidays`
--

CREATE TABLE `vipscapl_holidays` (
  `id` int(10) UNSIGNED NOT NULL,
  `event_name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `description` text COLLATE utf8_unicode_ci,
  `date` date NOT NULL,
  `location` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `color` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '#1ab394',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `vipscapl_holidays`
--

INSERT INTO `vipscapl_holidays` (`id`, `event_name`, `description`, `date`, `location`, `color`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 'Makar Sankranti', 'Makar Sankranti', '2020-02-14', 'rajkot', '#191919', '2020-02-03 16:53:36', '2020-02-03 16:53:36', NULL),
(2, 'Republic Day', 'Republic Day', '2020-01-25', 'Rajkot', '#ff5b00', '2020-02-03 16:56:12', '2020-02-03 16:56:12', NULL),
(3, 'Christmas Day', 'Christmas Day', '2019-12-24', 'Rajkot', '#b31a94', '2020-02-03 16:58:32', '2020-02-03 16:58:32', NULL),
(4, 'Vasant Panchami', 'Vasant Panchami', '2020-01-29', 'Rajkot', '#1ab394', '2020-02-03 16:59:42', '2020-02-03 16:59:42', NULL),
(5, 'Guru Ravidas Jayanti', 'Guru Ravidas Jayanti', '2020-02-09', 'Rajkot', '#1ab339', '2020-02-03 17:00:27', '2020-02-03 17:00:27', NULL),
(6, 'Shivaji Jayanti', 'Shivaji Jayanti', '2020-02-19', 'Rajkor', '#57b31a', '2020-02-03 17:01:15', '2020-02-03 17:01:15', NULL),
(7, 'Maha Shivratri', 'Maha Shivratri', '2020-02-21', 'Rajkot', '#ff2020', '2020-02-03 17:02:07', '2020-02-03 17:02:07', NULL),
(8, 'Holika Dahan', 'Holika Dahan', '2020-03-08', 'Rajkot', '#ed6d6d', '2020-02-03 17:02:50', '2020-02-03 17:02:50', NULL),
(9, 'Rama Navami', 'Rama Navami', '2020-04-01', 'Rajkot', '#2f5d54', '2020-02-03 17:03:50', '2020-02-03 17:03:50', NULL),
(10, 'Mahavir Jayanti', 'Mahavir Jayanti', '2020-04-05', 'Rajkot', '#000000', '2020-02-03 17:04:36', '2020-02-03 17:04:36', NULL),
(11, 'Ambedkar Jayanti', 'Ambedkar Jayanti', '2020-04-13', 'Rajkot', '#000000', '2020-02-03 06:51:54', '2020-02-03 06:51:54', NULL),
(12, 'Ramzan Id', 'Ramzan Id', '2020-05-24', 'Rajkot', '#621ab3', '2020-02-03 06:53:43', '2020-02-03 06:53:43', NULL),
(13, 'Buddha Purnima', 'Buddha Purnima', '2020-05-06', 'Rajkot', '#b31a87', '2020-02-03 06:54:31', '2020-02-03 06:54:31', NULL),
(14, 'Parsi New Year', 'Parsi New Year', '2020-08-15', 'Rajkot', '#4d274e', '2020-02-03 06:55:45', '2020-02-03 06:55:45', NULL),
(15, 'Janmashtami', 'Janmashtami', '2020-08-10', 'Rajkot', '#e52c39', '2020-02-03 06:56:26', '2020-02-03 06:56:26', NULL),
(16, 'Diwali', 'Diwali', '2020-11-13', 'Rajkot', '#8c5f7d', '2020-02-03 06:57:52', '2020-02-03 06:57:52', NULL),
(17, 'New Year Eve', 'New Year Eve', '2020-12-30', 'Rajkot', '#694abf', '2020-02-03 06:59:25', '2020-02-03 06:59:25', NULL),
(18, 'Independence Day', '<span style=\"color: rgb(60, 64, 67); font-family: arial, sans-serif; font-size: 14px;\">Independence Day</span>', '2020-08-14', 'Rajkot', '#f85900', '2020-02-03 07:01:10', '2020-02-03 07:01:10', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `vipscapl_incidents`
--

CREATE TABLE `vipscapl_incidents` (
  `id` int(10) UNSIGNED NOT NULL,
  `create_user_id` int(11) NOT NULL,
  `generated_id` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `project_id` int(11) DEFAULT NULL,
  `project_version` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `incident_type` tinyint(4) NOT NULL DEFAULT '1' COMMENT '1=Service Request,2=Info Request',
  `incident_name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `start_date` date DEFAULT NULL,
  `end_date` date DEFAULT NULL,
  `description` text COLLATE utf8_unicode_ci,
  `status` tinyint(4) NOT NULL DEFAULT '1' COMMENT '1=Open,2=Assigned,3=In Progress,4=Solved\n                        ,5=Deferred,6=Re-open,7=Closed',
  `assigned_group_id` int(11) DEFAULT NULL,
  `assign_to` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `priority` tinyint(4) NOT NULL DEFAULT '1' COMMENT '1=Low,2=Medium,3=High,4=Very High,5=Urgent',
  `notes` text COLLATE utf8_unicode_ci,
  `orders` int(11) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `vipscapl_incidents`
--

INSERT INTO `vipscapl_incidents` (`id`, `create_user_id`, `generated_id`, `project_id`, `project_version`, `incident_type`, `incident_name`, `start_date`, `end_date`, `description`, `status`, `assigned_group_id`, `assign_to`, `priority`, `notes`, `orders`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 1, 'INC0001', 1, '1.0', 1, 'Total active customer count is not match with client service portal.', '2020-02-03', '2020-02-03', NULL, 2, 2, '13', 2, NULL, NULL, '2020-02-01 11:56:14', '2020-02-01 11:56:14', NULL),
(2, 1, 'INC0002', 2, '1.0', 2, 'Listing and invoice PDF the amount number formatting not proper.', '2020-02-03', '2020-02-03', NULL, 3, 2, '13', 3, NULL, NULL, '2020-02-01 11:56:50', '2020-02-01 11:56:50', NULL),
(3, 13, 'INC0003', 2, '1.0', 1, 'There are many variations of passages of Lorem Ipsum available, but the majority have suffered alteration in some form, by injected humour, or randomised words which don\'t look even slightly believable', '2020-02-06', '2020-02-06', NULL, 4, 2, '13', 4, NULL, NULL, '2020-02-01 11:58:11', '2020-02-01 11:58:11', NULL),
(4, 13, 'INC0004', 1, '1.0', 1, 'Service activation-termination api is not working in testing environment.', '2020-02-07', '2020-02-07', NULL, 5, 2, '13', 1, NULL, NULL, '2020-02-01 11:58:44', '2020-02-01 11:58:44', NULL),
(5, 13, 'INC0005', 2, '1.0', 2, 'In testing environment send email functionality not workin', '2020-02-10', '2020-02-10', NULL, 5, 2, '13', 5, NULL, NULL, '2020-02-01 11:59:32', '2020-02-01 11:59:32', NULL),
(6, 13, 'INC0006', 1, '1.0', 1, 'Need to implement pagination in invoice pdf.', '2020-02-12', '2020-02-12', NULL, 6, 2, '13', 3, NULL, NULL, '2020-02-01 12:00:10', '2020-02-01 12:00:10', NULL),
(7, 13, 'INC0007', 1, '1.0', 1, 'Group service termination functionality not working.', '2020-03-04', '2020-03-04', NULL, 6, 2, '13', 1, NULL, NULL, '2020-02-01 12:00:44', '2020-02-01 12:00:44', NULL),
(8, 13, 'INC0008', 1, '1.0', 1, 'In customer listing some columns are missing.', '2020-03-12', '2020-03-12', NULL, 1, 2, '13', 2, NULL, NULL, '2020-02-01 12:02:05', '2020-02-01 12:02:05', NULL),
(9, 13, 'INC0009', 2, '1.0', 2, 'Group service termination functionality not working.', '2020-03-19', '2020-03-19', NULL, 7, 2, '13', 2, NULL, NULL, '2020-02-01 12:02:57', '2020-02-01 12:02:57', NULL),
(10, 1, 'INC00010', 1, '1.0', 1, 'Having an issue to create user.', '2020-04-01', '2020-04-01', NULL, 1, 2, '1', 1, NULL, NULL, '2020-02-11 04:35:00', '2020-02-11 04:35:00', NULL),
(11, 1, 'INC0011', 1, '1.0', 1, 'In customer listing some columns are missing.', '2020-04-02', '2020-04-02', NULL, 2, 2, '1', 2, NULL, NULL, '2020-02-11 04:35:25', '2020-02-11 04:35:25', NULL),
(12, 1, 'INC0012', 1, '1.0', 1, 'Listing and invoice PDF the amount number formatting not proper.', '2020-04-14', '2020-04-14', NULL, 3, 2, '1', 3, NULL, NULL, '2020-02-11 04:36:08', '2020-02-11 04:36:08', NULL),
(13, 1, 'INC0013', 1, '1.0', 1, 'In testing environment send email functionality not working.', '2020-04-16', '2020-04-16', NULL, 4, 2, '1', 4, NULL, NULL, '2020-02-11 04:36:41', '2020-02-11 04:36:41', NULL),
(14, 1, 'INC0014', 1, '1.0', 1, 'Group service termination functionality not working.', '2020-04-23', '2020-04-23', NULL, 5, 2, '1', 5, NULL, NULL, '2020-02-11 04:37:11', '2020-02-11 04:37:11', NULL),
(15, 1, 'INC0015', 1, '1.0', 1, 'Camera connection issue.', '2020-05-01', '2020-05-01', NULL, 7, 2, '1', 1, NULL, NULL, '2020-02-11 04:37:49', '2020-02-11 04:37:49', NULL),
(16, 1, 'INC0016', 1, '1.0', 1, 'Need to implement pagination in invoice pdf.', '2020-05-04', '2020-05-04', NULL, 6, 2, '1', 2, NULL, NULL, '2020-02-11 04:38:19', '2020-02-11 04:38:19', NULL),
(17, 11, 'INC0017', 1, '1.0', 1, 'Outstanding report is wrong.', '2020-05-08', '2020-05-08', NULL, 1, 2, '13', 2, NULL, NULL, '2020-02-14 11:13:52', '2020-02-14 11:13:52', NULL),
(18, 11, 'INC0018', 1, '1.0', 1, 'Total active customer count is not match with client service portal.', '2020-05-13', '2020-05-13', NULL, 1, 2, '13', 2, NULL, NULL, '2020-02-14 11:14:19', '2020-02-14 11:14:19', NULL),
(19, 11, 'INC0019', 1, '1.0', 1, 'Service activation-termination api is not working in testing environment.', '2020-05-18', '2020-05-18', NULL, 3, 2, '13', 3, NULL, NULL, '2020-02-14 11:14:47', '2020-02-14 11:14:47', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `vipscapl_incident_attachments`
--

CREATE TABLE `vipscapl_incident_attachments` (
  `id` int(10) UNSIGNED NOT NULL,
  `incident_id` int(10) UNSIGNED NOT NULL,
  `file_name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `file_hash` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `file_description` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `vipscapl_incident_comments`
--

CREATE TABLE `vipscapl_incident_comments` (
  `id` int(10) UNSIGNED NOT NULL,
  `user_id` int(10) UNSIGNED NOT NULL,
  `incident_id` int(10) UNSIGNED NOT NULL,
  `parent_id` int(11) NOT NULL DEFAULT '0',
  `comment` text COLLATE utf8_unicode_ci NOT NULL,
  `attachments` text COLLATE utf8_unicode_ci,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `vipscapl_incident_history`
--

CREATE TABLE `vipscapl_incident_history` (
  `id` int(10) UNSIGNED NOT NULL,
  `incident_id` int(10) UNSIGNED NOT NULL,
  `description` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `created_by_id` int(11) DEFAULT NULL,
  `commented_by_id` int(11) DEFAULT NULL,
  `solved_by_id` int(11) DEFAULT NULL,
  `closed_by_id` int(11) DEFAULT NULL,
  `updated_by_id` int(11) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `vipscapl_incident_history`
--

INSERT INTO `vipscapl_incident_history` (`id`, `incident_id`, `description`, `created_by_id`, `commented_by_id`, `solved_by_id`, `closed_by_id`, `updated_by_id`, `created_at`, `updated_at`) VALUES
(1, 1, 'Incident information added : <b>Total active customer count is not match with client service portal.</b>', 1, NULL, NULL, NULL, NULL, '2020-02-01 11:56:14', '2020-02-01 11:56:14'),
(2, 2, 'Incident information added : <b>Listing and invoice PDF the amount number formatting not proper.</b>', 1, NULL, NULL, NULL, NULL, '2020-02-01 11:56:50', '2020-02-01 11:56:50'),
(3, 3, 'Incident information added : <b>There are many variations of passages of Lorem Ipsum available, but the majority have suffered alteration in some form, by injected humour, or randomised words which don\'t look even slightly believable</b>', 13, NULL, 13, NULL, NULL, '2020-02-01 11:58:11', '2020-02-01 11:58:11'),
(4, 4, 'Incident information added : <b>Service activation-termination api is not working in testing environment.</b>', 13, NULL, NULL, NULL, NULL, '2020-02-01 11:58:44', '2020-02-01 11:58:44'),
(5, 5, 'Incident information added : <b>In testing environment send email functionality not workin</b>', 13, NULL, NULL, NULL, NULL, '2020-02-01 11:59:32', '2020-02-01 11:59:32'),
(6, 6, 'Incident information added : <b>Need to implement pagination in invoice pdf.</b>', 13, NULL, NULL, NULL, NULL, '2020-02-01 12:00:10', '2020-02-01 12:00:10'),
(7, 7, 'Incident information added : <b>Group service termination functionality not working.</b>', 13, NULL, NULL, NULL, NULL, '2020-02-01 12:00:44', '2020-02-01 12:00:44'),
(8, 8, 'Incident information added : <b>In customer listing some columns are missing.</b>', 13, NULL, NULL, NULL, NULL, '2020-02-01 12:02:06', '2020-02-01 12:02:06'),
(9, 9, 'Incident information added : <b>Group service termination functionality not working.</b>', 13, NULL, NULL, 13, NULL, '2020-02-01 12:02:57', '2020-02-01 12:02:57'),
(10, 10, 'Incident information added : <b>Having an issue to create user.</b>', 1, NULL, NULL, NULL, NULL, '2020-02-11 04:35:01', '2020-02-11 04:35:01'),
(11, 11, 'Incident information added : <b>In customer listing some columns are missing.</b>', 1, NULL, NULL, NULL, NULL, '2020-02-11 04:35:25', '2020-02-11 04:35:25'),
(12, 12, 'Incident information added : <b>Listing and invoice PDF the amount number formatting not proper.</b>', 1, NULL, NULL, NULL, NULL, '2020-02-11 04:36:08', '2020-02-11 04:36:08'),
(13, 13, 'Incident information added : <b>In testing environment send email functionality not working.</b>', 1, NULL, 1, NULL, NULL, '2020-02-11 04:36:41', '2020-02-11 04:36:41'),
(14, 14, 'Incident information added : <b>Group service termination functionality not working.</b>', 1, NULL, NULL, NULL, NULL, '2020-02-11 04:37:11', '2020-02-11 04:37:11'),
(15, 15, 'Incident information added : <b>Camera connection issue.</b>', 1, NULL, NULL, 1, NULL, '2020-02-11 04:37:51', '2020-02-11 04:37:51'),
(16, 16, 'Incident information added : <b>Need to implement pagination in invoice pdf.</b>', 1, NULL, NULL, NULL, NULL, '2020-02-11 04:38:19', '2020-02-11 04:38:19'),
(17, 17, 'Incident information added : <b>Outstanding report is wrong.</b>', 11, NULL, NULL, NULL, NULL, '2020-02-14 11:13:52', '2020-02-14 11:13:52'),
(18, 18, 'Incident information added : <b>Total active customer count is not match with client service portal.</b>', 11, NULL, NULL, NULL, NULL, '2020-02-14 11:14:19', '2020-02-14 11:14:19'),
(19, 19, 'Incident information added : <b>Service activation-termination api is not working in testing environment.</b>', 11, NULL, NULL, NULL, NULL, '2020-02-14 11:14:48', '2020-02-14 11:14:48');

-- --------------------------------------------------------

--
-- Table structure for table `vipscapl_incident_user`
--

CREATE TABLE `vipscapl_incident_user` (
  `incident_id` int(10) UNSIGNED NOT NULL,
  `user_id` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `vipscapl_incident_user`
--

INSERT INTO `vipscapl_incident_user` (`incident_id`, `user_id`) VALUES
(1, 1),
(1, 2),
(1, 3),
(1, 4),
(1, 5),
(1, 6),
(1, 7),
(1, 8),
(1, 9),
(1, 10),
(1, 11),
(1, 13),
(2, 1),
(2, 2),
(2, 3),
(2, 4),
(2, 5),
(2, 6),
(2, 7),
(2, 8),
(2, 9),
(2, 10),
(2, 11),
(2, 13),
(3, 1),
(3, 2),
(3, 3),
(3, 4),
(3, 5),
(3, 6),
(3, 7),
(3, 8),
(3, 9),
(3, 10),
(3, 11),
(3, 13),
(4, 1),
(4, 2),
(4, 3),
(4, 4),
(4, 5),
(4, 6),
(4, 7),
(4, 8),
(4, 9),
(4, 10),
(4, 11),
(4, 13),
(5, 1),
(5, 2),
(5, 3),
(5, 4),
(5, 5),
(5, 6),
(5, 7),
(5, 8),
(5, 9),
(5, 10),
(5, 11),
(5, 13),
(6, 1),
(6, 2),
(6, 3),
(6, 4),
(6, 5),
(6, 6),
(6, 7),
(6, 8),
(6, 9),
(6, 10),
(6, 11),
(6, 13),
(7, 1),
(7, 2),
(7, 3),
(7, 4),
(7, 5),
(7, 6),
(7, 7),
(7, 8),
(7, 9),
(7, 10),
(7, 11),
(7, 13),
(8, 1),
(8, 2),
(8, 3),
(8, 4),
(8, 5),
(8, 6),
(8, 7),
(8, 8),
(8, 9),
(8, 10),
(8, 11),
(8, 13),
(9, 1),
(9, 2),
(9, 3),
(9, 4),
(9, 5),
(9, 6),
(9, 7),
(9, 8),
(9, 9),
(9, 10),
(9, 11),
(9, 13),
(10, 1),
(10, 2),
(10, 3),
(10, 4),
(10, 5),
(10, 6),
(10, 7),
(10, 8),
(10, 9),
(10, 10),
(10, 11),
(10, 13),
(11, 1),
(11, 2),
(11, 3),
(11, 4),
(11, 5),
(11, 6),
(11, 7),
(11, 8),
(11, 9),
(11, 10),
(11, 11),
(11, 13),
(12, 1),
(12, 2),
(12, 3),
(12, 4),
(12, 5),
(12, 6),
(12, 7),
(12, 8),
(12, 9),
(12, 10),
(12, 11),
(12, 13),
(13, 1),
(13, 2),
(13, 3),
(13, 4),
(13, 5),
(13, 6),
(13, 7),
(13, 8),
(13, 9),
(13, 10),
(13, 11),
(13, 13),
(14, 1),
(14, 2),
(14, 3),
(14, 4),
(14, 5),
(14, 6),
(14, 7),
(14, 8),
(14, 9),
(14, 10),
(14, 11),
(14, 13),
(15, 1),
(15, 2),
(15, 3),
(15, 4),
(15, 5),
(15, 6),
(15, 7),
(15, 8),
(15, 9),
(15, 10),
(15, 11),
(15, 13),
(16, 1),
(16, 2),
(16, 3),
(16, 4),
(16, 5),
(16, 6),
(16, 7),
(16, 8),
(16, 9),
(16, 10),
(16, 11),
(16, 13),
(17, 1),
(17, 2),
(17, 3),
(17, 4),
(17, 5),
(17, 6),
(17, 7),
(17, 8),
(17, 9),
(17, 10),
(17, 11),
(17, 13),
(18, 1),
(18, 2),
(18, 3),
(18, 4),
(18, 5),
(18, 6),
(18, 7),
(18, 8),
(18, 9),
(18, 10),
(18, 11),
(18, 13),
(19, 1),
(19, 2),
(19, 3),
(19, 4),
(19, 5),
(19, 6),
(19, 7),
(19, 8),
(19, 9),
(19, 10),
(19, 11),
(19, 13);

-- --------------------------------------------------------

--
-- Table structure for table `vipscapl_knowledge_base_article`
--

CREATE TABLE `vipscapl_knowledge_base_article` (
  `id` int(10) UNSIGNED NOT NULL,
  `category_id` int(10) UNSIGNED NOT NULL,
  `user_id` int(10) UNSIGNED NOT NULL,
  `article_title` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `description` text COLLATE utf8_unicode_ci NOT NULL,
  `file_name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `vipscapl_knowledge_base_article`
--

INSERT INTO `vipscapl_knowledge_base_article` (`id`, `category_id`, `user_id`, `article_title`, `description`, `file_name`, `deleted_at`, `created_at`, `updated_at`) VALUES
(1, 1, 1, 'Introduction To The Angular Docs', '<p style=\"font-size: 14px; line-height: 2.4rem; letter-spacing: 0.03rem; color: rgb(68, 68, 68); margin-top: 14px; margin-right: 0px; margin-left: 0px; font-family: Roboto, &quot;Helvetica Neue Light&quot;, &quot;Helvetica Neue&quot;, Helvetica, Arial, &quot;Lucida Grande&quot;, sans-serif;\">These Angular docs help you learn and use the Angular platform and framework, from your first app to optimizing complex enterprise apps. Tutorials and guides include downloadable example to accelerate your projects.</p><div class=\"card-container\" style=\"display: flex; flex-flow: row wrap; margin: 16px 0px; font-family: Roboto, &quot;Helvetica Neue Light&quot;, &quot;Helvetica Neue&quot;, Helvetica, Arial, &quot;Lucida Grande&quot;, sans-serif; font-size: 14px;\"><a href=\"https://angular.io/start\" class=\"docs-card\" title=\"Angular Getting Started\" style=\"font-size: 1.4rem; line-height: 2.4rem; letter-spacing: 0.03rem; color: rgb(25, 118, 210); height: 194px; width: 311.688px; background-color: rgb(255, 255, 255); border-radius: 4px; box-shadow: rgba(10, 16, 20, 0.24) 0px 2px 2px, rgba(10, 16, 20, 0.12) 0px 0px 2px; transition: box-shadow 0.5s ease 0s; max-width: 340px; min-width: 262px; margin: 24px 8px; padding-bottom: 48px; position: relative;\"><section style=\"color: rgb(51, 51, 51); font-size: 2rem; line-height: 2.4rem; margin: 0px; padding: 32px 0px 24px; text-align: center;\">Learn</section><p style=\"font-size: 1.3rem; line-height: 2.4rem; letter-spacing: 0.03rem; color: rgb(68, 68, 68); margin-right: 0px; margin-left: 0px; padding: 0px 16px; text-align: center;\">Create your first Angular app, without any setup</p><p class=\"card-footer\" style=\"font-size: 1.3rem; line-height: 4.8rem; letter-spacing: 0.03rem; color: rgb(110, 110, 110); margin-right: 0px; margin-left: 0px; padding: 0px 16px; text-align: right; bottom: 0px; border-top-width: 0.5px; border-top-color: rgb(219, 219, 219); left: 0px; position: absolute; right: 0px;\">Getting Started</p></a><a href=\"https://angular.io/guide/setup-local\" class=\"docs-card\" title=\"Angular Local Environment Setup\" style=\"font-size: 1.4rem; line-height: 2.4rem; letter-spacing: 0.03rem; color: rgb(25, 118, 210); height: 194px; width: 311.688px; background-color: rgb(255, 255, 255); border-radius: 4px; box-shadow: rgba(10, 16, 20, 0.24) 0px 2px 2px, rgba(10, 16, 20, 0.12) 0px 0px 2px; transition: box-shadow 0.5s ease 0s; max-width: 340px; min-width: 262px; margin: 24px 8px; padding-bottom: 48px; position: relative;\"><section style=\"color: rgb(51, 51, 51); font-size: 2rem; line-height: 2.4rem; margin: 0px; padding: 32px 0px 24px; text-align: center;\">Start Working</section><p style=\"font-size: 1.3rem; line-height: 2.4rem; letter-spacing: 0.03rem; color: rgb(68, 68, 68); margin-right: 0px; margin-left: 0px; padding: 0px 16px; text-align: center;\">Set up your local environment with the Angular CLI</p><p class=\"card-footer\" style=\"font-size: 1.3rem; line-height: 4.8rem; letter-spacing: 0.03rem; color: rgb(110, 110, 110); margin-right: 0px; margin-left: 0px; padding: 0px 16px; text-align: right; bottom: 0px; border-top-width: 0.5px; border-top-color: rgb(219, 219, 219); left: 0px; position: absolute; right: 0px;\">Local Setup</p></a><a href=\"https://angular.io/guide/architecture\" class=\"docs-card\" title=\"Angular Architecture\" style=\"font-size: 1.4rem; line-height: 2.4rem; letter-spacing: 0.03rem; color: rgb(25, 118, 210); height: 194px; width: 311.688px; background-color: rgb(255, 255, 255); border-radius: 4px; box-shadow: rgba(10, 16, 20, 0.24) 0px 2px 2px, rgba(10, 16, 20, 0.12) 0px 0px 2px; transition: box-shadow 0.5s ease 0s; max-width: 340px; min-width: 262px; margin: 24px 8px; padding-bottom: 48px; position: relative;\"><section style=\"color: rgb(51, 51, 51); font-size: 2rem; line-height: 2.4rem; margin: 0px; padding: 32px 0px 24px; text-align: center;\">Explore</section><p style=\"font-size: 1.3rem; line-height: 2.4rem; letter-spacing: 0.03rem; color: rgb(68, 68, 68); margin-right: 0px; margin-left: 0px; padding: 0px 16px; text-align: center;\">Learn more about Angular apps and framework features</p><p class=\"card-footer\" style=\"font-size: 1.3rem; line-height: 4.8rem; letter-spacing: 0.03rem; color: rgb(110, 110, 110); margin-right: 0px; margin-left: 0px; padding: 0px 16px; text-align: right; bottom: 0px; border-top-width: 0.5px; border-top-color: rgb(219, 219, 219); left: 0px; position: absolute; right: 0px;\">Architecture</p></a></div><h2 id=\"assumptions\" style=\"color: rgb(51, 51, 51); font-size: 2.2rem; margin: 32px 0px 24px; clear: both; font-family: Roboto, &quot;Helvetica Neue Light&quot;, &quot;Helvetica Neue&quot;, Helvetica, Arial, &quot;Lucida Grande&quot;, sans-serif;\">Assumptions<a title=\"Link to this heading\" class=\"header-link\" aria-hidden=\"true\" href=\"https://angular.io/docs#assumptions\" style=\"font-size: inherit; line-height: 2.4rem; letter-spacing: 0.03rem; color: rgb(110, 110, 110); margin: 0px 4px; user-select: none; visibility: hidden; display: inline-block; vertical-align: text-top;\"><span class=\"material-icons\" style=\"font-family: &quot;Material Icons&quot;; font-size: 24px; line-height: 1; letter-spacing: normal; display: inline-block; white-space: nowrap; overflow-wrap: normal; direction: ltr; font-feature-settings: &quot;liga&quot;; -webkit-font-smoothing: antialiased;\"></span></a></h2><p style=\"font-size: 14px; line-height: 2.4rem; letter-spacing: 0.03rem; color: rgb(68, 68, 68); margin-top: 14px; margin-right: 0px; margin-left: 0px; font-family: Roboto, &quot;Helvetica Neue Light&quot;, &quot;Helvetica Neue&quot;, Helvetica, Arial, &quot;Lucida Grande&quot;, sans-serif;\">These docs assume that you are already familiar with HTML, CSS,&nbsp;<a href=\"https://developer.mozilla.org/en-US/docs/Web/JavaScript/A_re-introduction_to_JavaScript\" title=\"Learn JavaScript\" style=\"font-size: 1.4rem; line-height: 2.4rem; letter-spacing: 0.03rem; color: rgb(25, 118, 210);\">JavaScript</a>, and some of the tools from the&nbsp;<a href=\"https://developer.mozilla.org/en-US/docs/Web/JavaScript/Language_Resources\" title=\"Latest JavaScript standards\" style=\"font-size: 1.4rem; line-height: 2.4rem; letter-spacing: 0.03rem; color: rgb(25, 118, 210);\">latest standards</a>, such as&nbsp;<a href=\"https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Classes\" title=\"ES2015 Classes\" style=\"font-size: 1.4rem; line-height: 2.4rem; letter-spacing: 0.03rem; color: rgb(25, 118, 210);\">classes</a>&nbsp;and&nbsp;<a href=\"https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Statements/import\" title=\"ES2015 Modules\" style=\"font-size: 1.4rem; line-height: 2.4rem; letter-spacing: 0.03rem; color: rgb(25, 118, 210);\">modules</a>. The code samples are written using&nbsp;<a href=\"https://www.typescriptlang.org/\" title=\"TypeScript\" style=\"font-size: 1.4rem; line-height: 2.4rem; letter-spacing: 0.03rem; color: rgb(25, 118, 210);\">TypeScript</a>. Most Angular code can be written with just the latest JavaScript, using&nbsp;<a href=\"https://www.typescriptlang.org/docs/handbook/classes.html\" title=\"TypeScript Types\" style=\"font-size: 1.4rem; line-height: 2.4rem; letter-spacing: 0.03rem; color: rgb(25, 118, 210);\">types</a>&nbsp;for dependency injection, and using&nbsp;<a href=\"https://www.typescriptlang.org/docs/handbook/decorators.html\" title=\"Decorators\" style=\"font-size: 1.4rem; line-height: 2.4rem; letter-spacing: 0.03rem; color: rgb(25, 118, 210);\">decorators</a>&nbsp;for metadata.</p><h2 id=\"feedback\" style=\"color: rgb(51, 51, 51); font-size: 2.2rem; margin: 32px 0px 24px; clear: both; font-family: Roboto, &quot;Helvetica Neue Light&quot;, &quot;Helvetica Neue&quot;, Helvetica, Arial, &quot;Lucida Grande&quot;, sans-serif;\">Feedback<a title=\"Link to this heading\" class=\"header-link\" aria-hidden=\"true\" href=\"https://angular.io/docs#feedback\" style=\"font-size: inherit; line-height: 2.4rem; letter-spacing: 0.03rem; color: rgb(110, 110, 110); margin: 0px 4px; user-select: none; visibility: hidden; display: inline-block; vertical-align: text-top;\"><span class=\"material-icons\" style=\"font-family: &quot;Material Icons&quot;; font-size: 24px; line-height: 1; letter-spacing: normal; display: inline-block; white-space: nowrap; overflow-wrap: normal; direction: ltr; font-feature-settings: &quot;liga&quot;; -webkit-font-smoothing: antialiased;\"></span></a></h2><h4 id=\"you-can-sit-with-us\" style=\"color: rgb(51, 51, 51); font-size: 1.8rem; margin: 8px 0px; clear: both; font-family: Roboto, &quot;Helvetica Neue Light&quot;, &quot;Helvetica Neue&quot;, Helvetica, Arial, &quot;Lucida Grande&quot;, sans-serif;\">You can sit with us!<a title=\"Link to this heading\" class=\"header-link\" aria-hidden=\"true\" href=\"https://angular.io/docs#you-can-sit-with-us\" style=\"font-size: inherit; line-height: 2.4rem; letter-spacing: 0.03rem; color: rgb(110, 110, 110); margin: 0px 4px; user-select: none; visibility: hidden; display: inline-block; vertical-align: text-top;\"><span class=\"material-icons\" style=\"font-family: &quot;Material Icons&quot;; font-size: 24px; line-height: 1; letter-spacing: normal; display: inline-block; white-space: nowrap; overflow-wrap: normal; direction: ltr; font-feature-settings: &quot;liga&quot;; -webkit-font-smoothing: antialiased;\"></span></a></h4><p style=\"font-size: 14px; line-height: 2.4rem; letter-spacing: 0.03rem; color: rgb(68, 68, 68); margin-top: 14px; margin-right: 0px; margin-left: 0px; font-family: Roboto, &quot;Helvetica Neue Light&quot;, &quot;Helvetica Neue&quot;, Helvetica, Arial, &quot;Lucida Grande&quot;, sans-serif;\">We want to hear from you.&nbsp;<a href=\"https://github.com/angular/angular/issues/new/choose\" title=\"Angular GitHub repository new issue form\" style=\"font-size: 1.4rem; line-height: 2.4rem; letter-spacing: 0.03rem; color: rgb(25, 118, 210);\">Report problems or submit suggestions for future docs.</a></p><p style=\"font-size: 14px; line-height: 2.4rem; letter-spacing: 0.03rem; color: rgb(68, 68, 68); margin-top: 14px; margin-right: 0px; margin-left: 0px; font-family: Roboto, &quot;Helvetica Neue Light&quot;, &quot;Helvetica Neue&quot;, Helvetica, Arial, &quot;Lucida Grande&quot;, sans-serif;\">Contribute to Angular docs by creating&nbsp;<a href=\"https://github.com/angular/angular/pulls\" title=\"Angular Github pull requests\" style=\"font-size: 1.4rem; line-height: 2.4rem; letter-spacing: 0.03rem; color: rgb(25, 118, 210);\">pull requests</a>&nbsp;on the Angular Github repository. See&nbsp;<a href=\"https://github.com/angular/angular/blob/master/CONTRIBUTING.md\" title=\"Contributing guide\" style=\"font-size: 1.4rem; line-height: 2.4rem; letter-spacing: 0.03rem; color: rgb(25, 118, 210);\">Contributing to Angular</a>&nbsp;for information about submission guidelines.</p><p style=\"font-size: 14px; line-height: 2.4rem; letter-spacing: 0.03rem; color: rgb(68, 68, 68); margin-top: 14px; margin-right: 0px; margin-left: 0px; font-family: Roboto, &quot;Helvetica Neue Light&quot;, &quot;Helvetica Neue&quot;, Helvetica, Arial, &quot;Lucida Grande&quot;, sans-serif;\">Our community values respectful, supportive communication. Please consult and adhere to the&nbsp;<a href=\"https://github.com/angular/code-of-conduct/blob/master/CODE_OF_CONDUCT.md\" title=\"Contributor code of conduct\" style=\"font-size: 1.4rem; line-height: 2.4rem; letter-spacing: 0.03rem; color: rgb(25, 118, 210);\">Code of Conduct</a>.</p>', '', NULL, '2020-02-04 03:22:20', '2020-02-04 03:28:36'),
(2, 1, 1, 'Getting Started', '<p style=\"font-size: 14px; line-height: 2.4rem; letter-spacing: 0.03rem; color: rgb(68, 68, 68); margin-top: 14px; margin-right: 0px; margin-left: 0px; font-family: Roboto, &quot;Helvetica Neue Light&quot;, &quot;Helvetica Neue&quot;, Helvetica, Arial, &quot;Lucida Grande&quot;, sans-serif;\">Welcome to Angular!</p><p style=\"font-size: 14px; line-height: 2.4rem; letter-spacing: 0.03rem; color: rgb(68, 68, 68); margin-top: 14px; margin-right: 0px; margin-left: 0px; font-family: Roboto, &quot;Helvetica Neue Light&quot;, &quot;Helvetica Neue&quot;, Helvetica, Arial, &quot;Lucida Grande&quot;, sans-serif;\">This tutorial introduces you to the essentials of Angular by walking you through building a simple e-commerce site with a catalog, shopping cart, and check-out form. It uses the&nbsp;<a href=\"https://stackblitz.com/\" title=\"StackBlitz website\" style=\"font-size: 1.4rem; line-height: 2.4rem; letter-spacing: 0.03rem; color: rgb(25, 118, 210);\">StackBlitz</a>&nbsp;online development environment so you can get started right away.</p><div class=\"alert is-helpful\" style=\"padding: 16px; margin: 24px 0px; font-size: 14px; color: rgb(68, 68, 68); width: 794.188px; clear: both; border-left-width: 8px; border-left-color: rgb(25, 118, 210); background-color: rgba(25, 118, 210, 0.05); font-family: Roboto, &quot;Helvetica Neue Light&quot;, &quot;Helvetica Neue&quot;, Helvetica, Arial, &quot;Lucida Grande&quot;, sans-serif;\"><p style=\"font-size: 1.4rem; line-height: 2.4rem; letter-spacing: 0.03rem; margin: 8px 16px;\">This guide uses the StackBlitz Generator to show you a ready-made, simple application that you can examine and play with interactively. In actual development you will typically use the&nbsp;<a href=\"https://angular.io/guide/glossary#command-line-interface-cli\" style=\"font-size: 1.4rem; line-height: 2.4rem; letter-spacing: 0.03rem; color: rgb(25, 118, 210);\">Angular CLI</a>, a powerful command-line tool that lets you generate and modify applications. For more information, see the&nbsp;<a href=\"https://angular.io/cli\" style=\"font-size: 1.4rem; line-height: 2.4rem; letter-spacing: 0.03rem; color: rgb(25, 118, 210);\">CLI Overview</a>.</p></div><div class=\"callout is-helpful\" style=\"padding: 0px; margin: 24px 0px; font-size: 14px; color: rgb(68, 68, 68); width: 794.188px; clear: both; border-radius: 4px; border-left: 8px solid rgb(25, 118, 210); background: rgba(25, 118, 210, 0.05); border-top-color: rgb(25, 118, 210); border-right-color: rgb(25, 118, 210); border-bottom-color: rgb(25, 118, 210); font-family: Roboto, &quot;Helvetica Neue Light&quot;, &quot;Helvetica Neue&quot;, Helvetica, Arial, &quot;Lucida Grande&quot;, sans-serif;\"><header style=\"margin: 0px; color: rgb(255, 255, 255); line-height: 2.4rem; padding: 8px 16px; text-transform: uppercase; border-radius: 4px 4px 0px 0px; background: rgb(25, 118, 210);\">NEW TO WEB DEVELOPMENT?</header></div>', NULL, NULL, '2020-02-04 03:30:53', '2020-02-04 03:30:53'),
(3, 1, 1, 'Setup', '<p style=\"font-size: 14px; line-height: 2.4rem; letter-spacing: 0.03rem; color: rgb(68, 68, 68); margin-top: 14px; margin-right: 0px; margin-left: 0px; font-family: Roboto, &quot;Helvetica Neue Light&quot;, &quot;Helvetica Neue&quot;, Helvetica, Arial, &quot;Lucida Grande&quot;, sans-serif;\">This guide explains how to set up your environment for Angular development using the&nbsp;<a href=\"https://angular.io/cli\" title=\"CLI command reference\" style=\"font-size: 1.4rem; line-height: 2.4rem; letter-spacing: 0.03rem; color: rgb(25, 118, 210);\">Angular CLI tool</a>. It includes information about prerequisites, installing the CLI, creating an initial workspace and starter app, and running that app locally to verify your setup.</p><div class=\"callout is-helpful\" style=\"padding: 0px; margin: 24px 0px; font-size: 14px; color: rgb(68, 68, 68); width: 794.188px; clear: both; border-radius: 4px; border-left: 8px solid rgb(25, 118, 210); background: rgba(25, 118, 210, 0.05); border-top-color: rgb(25, 118, 210); border-right-color: rgb(25, 118, 210); border-bottom-color: rgb(25, 118, 210); font-family: Roboto, &quot;Helvetica Neue Light&quot;, &quot;Helvetica Neue&quot;, Helvetica, Arial, &quot;Lucida Grande&quot;, sans-serif;\"><header style=\"margin: 0px; color: rgb(255, 255, 255); line-height: 2.4rem; padding: 8px 16px; text-transform: uppercase; border-radius: 4px 4px 0px 0px; background: rgb(25, 118, 210);\">LEARNING ANGULAR</header><p style=\"font-size: 1.4rem; line-height: 2.4rem; letter-spacing: 0.03rem; margin-right: 0px; margin-left: 0px; padding: 16px 24px;\">If you are new to Angular, see&nbsp;<a href=\"https://angular.io/start\" style=\"font-size: 1.4rem; line-height: 2.4rem; letter-spacing: 0.03rem; color: rgb(25, 118, 210);\">Getting Started</a>. Getting Started helps you quickly learn the essentials of Angular, in the context of building a basic online store app. It leverages the&nbsp;<a href=\"https://stackblitz.com/\" style=\"font-size: 1.4rem; line-height: 2.4rem; letter-spacing: 0.03rem; color: rgb(25, 118, 210);\">StackBlitz</a>&nbsp;online development environment, so you don\'t need to set up your local environment until you\'re ready.</p></div>', NULL, NULL, '2020-02-04 03:32:14', '2020-02-04 03:32:14'),
(4, 2, 1, 'Installation', '<ul style=\"margin-right: 0px; margin-bottom: 0px; margin-left: 0px; list-style-type: none; padding: 0px; color: rgb(9, 9, 16); font-family: scandia-web, sans-serif;\"><li style=\"display: block; margin-bottom: 0.5em;\"><a href=\"https://laravel.com/docs/6.x#installation\" style=\"background-image: initial; background-position: initial; background-size: initial; background-repeat: initial; background-attachment: initial; background-origin: initial; background-clip: initial; position: relative; transition: all 0.3s ease 0s; color: rgb(9, 9, 16); font-size: 0.89em;\">Installation</a><ul style=\"margin-top: 0.5em; padding: 0px;\"><li style=\"display: block; margin-bottom: 0.5em; padding-left: 1.5em;\"><a href=\"https://laravel.com/docs/6.x#server-requirements\" style=\"background-image: initial; background-position: initial; background-size: initial; background-repeat: initial; background-attachment: initial; background-origin: initial; background-clip: initial; position: relative; transition: all 0.3s ease 0s; color: rgb(9, 9, 16); font-size: 0.89em;\">Server Requirements</a></li><li style=\"display: block; margin-bottom: 0.5em; padding-left: 1.5em;\"><a href=\"https://laravel.com/docs/6.x#installing-laravel\" style=\"background-image: initial; background-position: initial; background-size: initial; background-repeat: initial; background-attachment: initial; background-origin: initial; background-clip: initial; position: relative; transition: all 0.3s ease 0s; color: rgb(9, 9, 16); font-size: 0.89em;\">Installing Laravel</a></li><li style=\"display: block; margin-bottom: 0.5em; padding-left: 1.5em;\"><a href=\"https://laravel.com/docs/6.x#configuration\" style=\"background-image: initial; background-position: initial; background-size: initial; background-repeat: initial; background-attachment: initial; background-origin: initial; background-clip: initial; position: relative; transition: all 0.3s ease 0s; color: rgb(9, 9, 16); font-size: 0.89em;\">Configuration</a></li></ul></li><li style=\"display: block; margin-bottom: 0.5em;\"><a href=\"https://laravel.com/docs/6.x#web-server-configuration\" style=\"background-image: initial; background-position: initial; background-size: initial; background-repeat: initial; background-attachment: initial; background-origin: initial; background-clip: initial; position: relative; transition: all 0.3s ease 0s; color: rgb(9, 9, 16); font-size: 0.89em;\">Web Server Configuration</a><ul style=\"margin-top: 0.5em; padding: 0px;\"><li style=\"display: block; margin-bottom: 0.5em; padding-left: 1.5em;\"><a href=\"https://laravel.com/docs/6.x#directory-configuration\" style=\"background-image: initial; background-position: initial; background-size: initial; background-repeat: initial; background-attachment: initial; background-origin: initial; background-clip: initial; position: relative; transition: all 0.3s ease 0s; color: rgb(9, 9, 16); font-size: 0.89em;\">Directory Configuration</a></li><li style=\"display: block; margin-bottom: 0.5em; padding-left: 1.5em;\"><a href=\"https://laravel.com/docs/6.x#pretty-urls\" style=\"background-image: initial; background-position: initial; background-size: initial; background-repeat: initial; background-attachment: initial; background-origin: initial; background-clip: initial; position: relative; transition: all 0.3s ease 0s; color: rgb(9, 9, 16); font-size: 0.89em;\">Pretty URLs</a></li></ul></li></ul><p style=\"font-size: 16px; line-height: 1.8em; color: rgba(9, 9, 16, 0.7); margin-bottom: 2em; font-family: scandia-web, sans-serif; letter-spacing: normal;\"><a name=\"installation\" style=\"background-image: initial; background-position: initial; background-size: initial; background-repeat: initial; background-attachment: initial; background-origin: initial; background-clip: initial; position: relative; text-decoration-line: underline; transition: all 0.3s ease 0s; color: rgb(255, 45, 32); display: block; visibility: hidden; top: -45px;\"></a></p><h2 style=\"font-family: scandia-web, sans-serif; font-size: 1.75em; color: rgb(9, 9, 16);\"><a href=\"https://laravel.com/docs/6.x#installation\" style=\"background-image: initial; background-position: initial; background-size: initial; background-repeat: initial; background-attachment: initial; background-origin: initial; background-clip: initial; position: relative; transition: all 0.3s ease 0s; color: rgb(9, 9, 16);\">Installation</a></h2><p style=\"font-size: 16px; line-height: 1.8em; color: rgba(9, 9, 16, 0.7); margin-bottom: 2em; font-family: scandia-web, sans-serif; letter-spacing: normal;\"><a name=\"server-requirements\" style=\"background-image: initial; background-position: initial; background-size: initial; background-repeat: initial; background-attachment: initial; background-origin: initial; background-clip: initial; position: relative; text-decoration-line: underline; transition: all 0.3s ease 0s; color: rgb(255, 45, 32); display: block; visibility: hidden; top: -45px;\"></a></p><h3 style=\"font-family: scandia-web, sans-serif; font-size: 1.25em; line-height: 1.25em; color: rgb(9, 9, 16);\"><a href=\"https://laravel.com/docs/6.x#server-requirements\" style=\"background-image: initial; background-position: initial; background-size: initial; background-repeat: initial; background-attachment: initial; background-origin: initial; background-clip: initial; position: relative; transition: all 0.3s ease 0s; color: rgb(9, 9, 16);\">Server Requirements</a></h3><p style=\"font-size: 16px; line-height: 1.8em; color: rgba(9, 9, 16, 0.7); margin-bottom: 2em; font-family: scandia-web, sans-serif; letter-spacing: normal;\">The Laravel framework has a few system requirements. All of these requirements are satisfied by the&nbsp;<a href=\"https://laravel.com/docs/6.x/homestead\" style=\"background-image: initial; background-position: initial; background-size: initial; background-repeat: initial; background-attachment: initial; background-origin: initial; background-clip: initial; position: relative; text-decoration-line: underline; transition: all 0.3s ease 0s; color: rgb(255, 45, 32);\">Laravel Homestead</a>&nbsp;virtual machine, so it\'s highly recommended that you use Homestead as your local Laravel development environment.</p><p style=\"font-size: 16px; line-height: 1.8em; color: rgba(9, 9, 16, 0.7); margin-bottom: 2em; font-family: scandia-web, sans-serif; letter-spacing: normal;\">However, if you are not using Homestead, you will need to make sure your server meets the following requirements:</p><div class=\"content-list\" style=\"color: rgb(9, 9, 16); font-family: scandia-web, sans-serif;\"><ul style=\"margin-right: 0px; margin-bottom: 2.5em; margin-left: 1.75em; list-style-type: none; padding: 0px;\"><li style=\"position: relative; display: block; padding-left: 1.25em; margin-bottom: 1rem; font-size: 0.89em; color: rgba(9, 9, 16, 0.7); line-height: 1.714em;\">PHP &gt;= 7.2.0</li><li style=\"position: relative; display: block; padding-left: 1.25em; margin-bottom: 1rem; font-size: 0.89em; color: rgba(9, 9, 16, 0.7); line-height: 1.714em;\">BCMath PHP Extension</li><li style=\"position: relative; display: block; padding-left: 1.25em; margin-bottom: 1rem; font-size: 0.89em; color: rgba(9, 9, 16, 0.7); line-height: 1.714em;\">Ctype PHP Extension</li><li style=\"position: relative; display: block; padding-left: 1.25em; margin-bottom: 1rem; font-size: 0.89em; color: rgba(9, 9, 16, 0.7); line-height: 1.714em;\">JSON PHP Extension</li><li style=\"position: relative; display: block; padding-left: 1.25em; margin-bottom: 1rem; font-size: 0.89em; color: rgba(9, 9, 16, 0.7); line-height: 1.714em;\">Mbstring PHP Extension</li><li style=\"position: relative; display: block; padding-left: 1.25em; margin-bottom: 1rem; font-size: 0.89em; color: rgba(9, 9, 16, 0.7); line-height: 1.714em;\">OpenSSL PHP Extension</li><li style=\"position: relative; display: block; padding-left: 1.25em; margin-bottom: 1rem; font-size: 0.89em; color: rgba(9, 9, 16, 0.7); line-height: 1.714em;\">PDO PHP Extension</li><li style=\"position: relative; display: block; padding-left: 1.25em; margin-bottom: 1rem; font-size: 0.89em; color: rgba(9, 9, 16, 0.7); line-height: 1.714em;\">Tokenizer PHP Extension</li><li style=\"position: relative; display: block; padding-left: 1.25em; margin-bottom: 1rem; font-size: 0.89em; color: rgba(9, 9, 16, 0.7); line-height: 1.714em;\">XML PHP Extension</li></ul></div><p style=\"font-size: 16px; line-height: 1.8em; color: rgba(9, 9, 16, 0.7); margin-bottom: 2em; font-family: scandia-web, sans-serif; letter-spacing: normal;\"><a name=\"installing-laravel\" style=\"background-image: initial; background-position: initial; background-size: initial; background-repeat: initial; background-attachment: initial; background-origin: initial; background-clip: initial; position: relative; text-decoration-line: underline; transition: all 0.3s ease 0s; color: rgb(255, 45, 32); display: block; visibility: hidden; top: -45px;\"></a></p><h3 style=\"font-family: scandia-web, sans-serif; font-size: 1.25em; line-height: 1.25em; color: rgb(9, 9, 16);\"><a href=\"https://laravel.com/docs/6.x#installing-laravel\" style=\"background-image: initial; background-position: initial; background-size: initial; background-repeat: initial; background-attachment: initial; background-origin: initial; background-clip: initial; position: relative; transition: all 0.3s ease 0s; color: rgb(9, 9, 16);\">Installing Laravel</a></h3><p style=\"font-size: 16px; line-height: 1.8em; color: rgba(9, 9, 16, 0.7); margin-bottom: 2em; font-family: scandia-web, sans-serif; letter-spacing: normal;\">Laravel utilizes&nbsp;<a href=\"https://getcomposer.org/\" style=\"background-image: initial; background-position: initial; background-size: initial; background-repeat: initial; background-attachment: initial; background-origin: initial; background-clip: initial; position: relative; text-decoration-line: underline; transition: all 0.3s ease 0s; color: rgb(255, 45, 32);\">Composer</a>&nbsp;to manage its dependencies. So, before using Laravel, make sure you have Composer installed on your machine.</p><h4 style=\"font-family: scandia-web, sans-serif; font-size: 16px; color: rgb(9, 9, 16);\">Via Laravel Installer</h4><p style=\"font-size: 16px; line-height: 1.8em; color: rgba(9, 9, 16, 0.7); margin-bottom: 2em; font-family: scandia-web, sans-serif; letter-spacing: normal;\">First, download the Laravel installer using Composer:</p><pre class=\" language-php\" style=\"font-family: monospace, monospace; font-size: 16px; color: rgb(202, 71, 63); background: rgb(251, 251, 253); word-break: normal; overflow-wrap: normal; tab-size: 4; hyphens: none; padding: 1em; margin-top: 0.5em; margin-bottom: 2em; max-width: 100%; box-shadow: rgba(0, 0, 0, 0.075) 0px 1px 1px;\"><code class=\" language-php\" style=\"font-family: source-code-pro, monospace; font-size: 0.8rem; line-height: 1.9; color: rgb(9, 9, 16); background: none; word-spacing: normal; overflow-wrap: normal; tab-size: 4; hyphens: none;\">composer <span class=\"token keyword\" style=\"color: rgb(5, 84, 114);\">global</span> <span class=\"token keyword\" style=\"color: rgb(5, 84, 114);\">require</span> laravel<span class=\"token operator\">/</span>installer</code></pre>', NULL, NULL, '2020-02-04 03:36:27', '2020-02-04 03:36:27'),
(5, 2, 1, 'Configuration', '<h4 style=\"font-family: scandia-web, sans-serif; font-size: 16px; color: rgb(9, 9, 16);\">Public Directory</h4><p style=\"font-size: 16px; line-height: 1.8em; color: rgba(9, 9, 16, 0.7); margin-bottom: 2em; font-family: scandia-web, sans-serif; letter-spacing: normal;\">After installing Laravel, you should configure your web server\'s document/webroot to be the directory. The in this directory serves as the front controller for all HTTP requests entering your application.</p><h4 style=\"font-family: scandia-web, sans-serif; font-size: 16px; color: rgb(9, 9, 16);\">Configuration Files</h4><p style=\"font-size: 16px; line-height: 1.8em; color: rgba(9, 9, 16, 0.7); margin-bottom: 2em; font-family: scandia-web, sans-serif; letter-spacing: normal;\">All of the configuration files for the Laravel framework are stored in the&nbsp;<code class=\" language-php\" style=\"font-family: source-code-pro, monospace; font-size: 0.8rem; line-height: 1.9; color: rgb(202, 71, 63); background: rgb(251, 251, 253); padding: 0px 0.25em; white-space: pre; word-spacing: normal; word-break: normal; overflow-wrap: normal; tab-size: 4; hyphens: none; box-shadow: rgba(0, 0, 0, 0.075) 0px 1px 1px;\">config</code>&nbsp;directory. Each option is documented, so feel free to look through the files and get familiar with the options available to you.</p><h4 style=\"font-family: scandia-web, sans-serif; font-size: 16px; color: rgb(9, 9, 16);\">Directory Permissions</h4><p style=\"font-size: 16px; line-height: 1.8em; color: rgba(9, 9, 16, 0.7); margin-bottom: 2em; font-family: scandia-web, sans-serif; letter-spacing: normal;\">After installing Laravel, you may need to configure some permissions. Directories within the&nbsp;<code class=\" language-php\" style=\"font-family: source-code-pro, monospace; font-size: 0.8rem; line-height: 1.9; color: rgb(202, 71, 63); background: rgb(251, 251, 253); padding: 0px 0.25em; white-space: pre; word-spacing: normal; word-break: normal; overflow-wrap: normal; tab-size: 4; hyphens: none; box-shadow: rgba(0, 0, 0, 0.075) 0px 1px 1px;\">storage</code>&nbsp;and the&nbsp;<code class=\" language-php\" style=\"font-family: source-code-pro, monospace; font-size: 0.8rem; line-height: 1.9; color: rgb(202, 71, 63); background: rgb(251, 251, 253); padding: 0px 0.25em; white-space: pre; word-spacing: normal; word-break: normal; overflow-wrap: normal; tab-size: 4; hyphens: none; box-shadow: rgba(0, 0, 0, 0.075) 0px 1px 1px;\">bootstrap<span class=\"token operator\" style=\"color: rgb(9, 9, 16);\">/</span>cache</code>&nbsp;directories should be writable by your web server or Laravel will not run. If you are using the&nbsp;<a href=\"https://laravel.com/docs/6.x/homestead\" style=\"background-image: initial; background-position: initial; background-size: initial; background-repeat: initial; background-attachment: initial; background-origin: initial; background-clip: initial; position: relative; text-decoration-line: underline; transition: all 0.3s ease 0s; color: rgb(255, 45, 32);\">Homestead</a>&nbsp;virtual machine, these permissions should already be set.</p><h4 style=\"font-family: scandia-web, sans-serif; font-size: 16px; color: rgb(9, 9, 16);\">Application Key</h4><p style=\"font-size: 16px; line-height: 1.8em; color: rgba(9, 9, 16, 0.7); margin-bottom: 2em; font-family: scandia-web, sans-serif; letter-spacing: normal;\">The next thing you should do after installing Laravel is set your application key to a random string. If you installed Laravel via Composer or the Laravel installer, this key has already been set for you by the&nbsp;<code class=\" language-php\" style=\"font-family: source-code-pro, monospace; font-size: 0.8rem; line-height: 1.9; color: rgb(202, 71, 63); background: rgb(251, 251, 253); padding: 0px 0.25em; white-space: pre; word-spacing: normal; word-break: normal; overflow-wrap: normal; tab-size: 4; hyphens: none; box-shadow: rgba(0, 0, 0, 0.075) 0px 1px 1px;\">php artisan key<span class=\"token punctuation\" style=\"color: rgb(9, 9, 16);\">:</span>generate</code>&nbsp;command.</p><p style=\"font-size: 16px; line-height: 1.8em; color: rgba(9, 9, 16, 0.7); margin-bottom: 2em; font-family: scandia-web, sans-serif; letter-spacing: normal;\">Typically, this string should be 32 characters long. The key can be set in the&nbsp;<code class=\" language-php\" style=\"font-family: source-code-pro, monospace; font-size: 0.8rem; line-height: 1.9; color: rgb(202, 71, 63); background: rgb(251, 251, 253); padding: 0px 0.25em; white-space: pre; word-spacing: normal; word-break: normal; overflow-wrap: normal; tab-size: 4; hyphens: none; box-shadow: rgba(0, 0, 0, 0.075) 0px 1px 1px;\"><span class=\"token punctuation\" style=\"color: rgb(9, 9, 16);\">.</span>env</code>&nbsp;environment file. If you have not copied the&nbsp;<code class=\" language-php\" style=\"font-family: source-code-pro, monospace; font-size: 0.8rem; line-height: 1.9; color: rgb(202, 71, 63); background: rgb(251, 251, 253); padding: 0px 0.25em; white-space: pre; word-spacing: normal; word-break: normal; overflow-wrap: normal; tab-size: 4; hyphens: none; box-shadow: rgba(0, 0, 0, 0.075) 0px 1px 1px;\"><span class=\"token punctuation\" style=\"color: rgb(9, 9, 16);\">.</span>env<span class=\"token punctuation\" style=\"color: rgb(9, 9, 16);\">.</span>example</code>&nbsp;file to a new file named&nbsp;<code class=\" language-php\" style=\"font-family: source-code-pro, monospace; font-size: 0.8rem; line-height: 1.9; color: rgb(202, 71, 63); background: rgb(251, 251, 253); padding: 0px 0.25em; white-space: pre; word-spacing: normal; word-break: normal; overflow-wrap: normal; tab-size: 4; hyphens: none; box-shadow: rgba(0, 0, 0, 0.075) 0px 1px 1px;\"><span class=\"token punctuation\" style=\"color: rgb(9, 9, 16);\">.</span>env</code>, you should do that now.&nbsp;If the application key is not set, your user sessions and other encrypted data will not be secure!</p><h4 style=\"font-family: scandia-web, sans-serif; font-size: 16px; color: rgb(9, 9, 16);\">Additional Configuration</h4><p style=\"font-size: 16px; line-height: 1.8em; color: rgba(9, 9, 16, 0.7); margin-bottom: 2em; font-family: scandia-web, sans-serif; letter-spacing: normal;\">Laravel needs almost no other configuration out of the box. You are free to get started developing! However, you may wish to review the&nbsp;<code class=\" language-php\" style=\"font-family: source-code-pro, monospace; font-size: 0.8rem; line-height: 1.9; color: rgb(202, 71, 63); background: rgb(251, 251, 253); padding: 0px 0.25em; white-space: pre; word-spacing: normal; word-break: normal; overflow-wrap: normal; tab-size: 4; hyphens: none; box-shadow: rgba(0, 0, 0, 0.075) 0px 1px 1px;\">config<span class=\"token operator\" style=\"color: rgb(9, 9, 16);\">/</span>app<span class=\"token punctuation\" style=\"color: rgb(9, 9, 16);\">.</span>php</code>&nbsp;file and its documentation. It contains several options such as&nbsp;<code class=\" language-php\" style=\"font-family: source-code-pro, monospace; font-size: 0.8rem; line-height: 1.9; color: rgb(202, 71, 63); background: rgb(251, 251, 253); padding: 0px 0.25em; white-space: pre; word-spacing: normal; word-break: normal; overflow-wrap: normal; tab-size: 4; hyphens: none; box-shadow: rgba(0, 0, 0, 0.075) 0px 1px 1px;\">timezone</code>&nbsp;and&nbsp;<code class=\" language-php\" style=\"font-family: source-code-pro, monospace; font-size: 0.8rem; line-height: 1.9; color: rgb(202, 71, 63); background: rgb(251, 251, 253); padding: 0px 0.25em; white-space: pre; word-spacing: normal; word-break: normal; overflow-wrap: normal; tab-size: 4; hyphens: none; box-shadow: rgba(0, 0, 0, 0.075) 0px 1px 1px;\">locale</code>&nbsp;that you may wish to change according to your application.</p><p style=\"font-size: 16px; line-height: 1.8em; color: rgba(9, 9, 16, 0.7); margin-bottom: 2em; font-family: scandia-web, sans-serif; letter-spacing: normal;\">You may also want to configure a few additional components of Laravel, such as:</p><div class=\"content-list\" style=\"color: rgb(9, 9, 16); font-family: scandia-web, sans-serif;\"><ul style=\"margin-right: 0px; margin-bottom: 2.5em; margin-left: 1.75em; list-style-type: none; padding: 0px;\"><li style=\"position: relative; display: block; padding-left: 1.25em; margin-bottom: 1rem; font-size: 0.89em; color: rgba(9, 9, 16, 0.7); line-height: 1.714em;\"><a href=\"https://laravel.com/docs/6.x/cache#configuration\" style=\"background-image: initial; background-position: initial; background-size: initial; background-repeat: initial; background-attachment: initial; background-origin: initial; background-clip: initial; position: relative; transition: all 0.3s ease 0s; color: rgb(255, 45, 32);\">Cache</a></li><li style=\"position: relative; display: block; padding-left: 1.25em; margin-bottom: 1rem; font-size: 0.89em; color: rgba(9, 9, 16, 0.7); line-height: 1.714em;\"><a href=\"https://laravel.com/docs/6.x/database#configuration\" style=\"background-image: initial; background-position: initial; background-size: initial; background-repeat: initial; background-attachment: initial; background-origin: initial; background-clip: initial; position: relative; transition: all 0.3s ease 0s; color: rgb(255, 45, 32);\">Database</a></li><li style=\"position: relative; display: block; padding-left: 1.25em; margin-bottom: 1rem; font-size: 0.89em; color: rgba(9, 9, 16, 0.7); line-height: 1.714em;\"><a href=\"https://laravel.com/docs/6.x/session#configuration\" style=\"background-image: initial; background-position: initial; background-size: initial; background-repeat: initial; background-attachment: initial; background-origin: initial; background-clip: initial; position: relative; transition: all 0.3s ease 0s; color: rgb(255, 45, 32);\">Session</a></li></ul></div>', NULL, NULL, '2020-02-04 03:38:48', '2020-02-04 03:38:48');
INSERT INTO `vipscapl_knowledge_base_article` (`id`, `category_id`, `user_id`, `article_title`, `description`, `file_name`, `deleted_at`, `created_at`, `updated_at`) VALUES
(6, 2, 1, 'Directory Structure', '<h2 style=\"font-family: scandia-web, sans-serif; font-size: 1.75em; color: rgb(9, 9, 16);\"><a href=\"https://laravel.com/docs/6.x/structure#introduction\" style=\"background-image: initial; background-position: initial; background-size: initial; background-repeat: initial; background-attachment: initial; background-origin: initial; background-clip: initial; position: relative; transition: all 0.3s ease 0s; color: rgb(9, 9, 16);\">Introduction</a></h2><p style=\"font-size: 16px; line-height: 1.8em; color: rgba(9, 9, 16, 0.7); margin-bottom: 2em; font-family: scandia-web, sans-serif; letter-spacing: normal;\">The default Laravel application structure is intended to provide a great starting point for both large and small applications. But you are free to organize your application however you like. Laravel imposes almost no restrictions on where any given class is located - as long as Composer can autoload the class.</p><h4 style=\"font-family: scandia-web, sans-serif; font-size: 16px; color: rgb(9, 9, 16);\">Where Is The Models Directory?</h4><p style=\"font-size: 16px; line-height: 1.8em; color: rgba(9, 9, 16, 0.7); margin-bottom: 2em; font-family: scandia-web, sans-serif; letter-spacing: normal;\">When getting started with Laravel, many developers are confused by the lack of a&nbsp;<code class=\" language-php\" style=\"font-family: source-code-pro, monospace; font-size: 0.8rem; line-height: 1.9; color: rgb(202, 71, 63); background: rgb(251, 251, 253); padding: 0px 0.25em; white-space: pre; word-spacing: normal; word-break: normal; overflow-wrap: normal; tab-size: 4; hyphens: none; box-shadow: rgba(0, 0, 0, 0.075) 0px 1px 1px;\">models</code>&nbsp;directory. However, the lack of such a directory is intentional. We find the word \"models\" ambiguous since it means many different things to many different people. Some developers refer to an application\'s \"model\" as the totality of all of its business logic, while others refer to \"models\" as classes that interact with a relational database.</p><p style=\"font-size: 16px; line-height: 1.8em; color: rgba(9, 9, 16, 0.7); margin-bottom: 2em; font-family: scandia-web, sans-serif; letter-spacing: normal;\">For this reason, we choose to place Eloquent models in the&nbsp;<code class=\" language-php\" style=\"font-family: source-code-pro, monospace; font-size: 0.8rem; line-height: 1.9; color: rgb(202, 71, 63); background: rgb(251, 251, 253); padding: 0px 0.25em; white-space: pre; word-spacing: normal; word-break: normal; overflow-wrap: normal; tab-size: 4; hyphens: none; box-shadow: rgba(0, 0, 0, 0.075) 0px 1px 1px;\">app</code>&nbsp;directory by default, and allow the developer to place them somewhere else if they choose.</p><p style=\"font-size: 16px; line-height: 1.8em; color: rgba(9, 9, 16, 0.7); margin-bottom: 2em; font-family: scandia-web, sans-serif; letter-spacing: normal;\"><a name=\"the-root-directory\" style=\"background-image: initial; background-position: initial; background-size: initial; background-repeat: initial; background-attachment: initial; background-origin: initial; background-clip: initial; position: relative; text-decoration-line: underline; transition: all 0.3s ease 0s; color: rgb(255, 45, 32); display: block; visibility: hidden; top: -45px;\"></a></p><h2 style=\"font-family: scandia-web, sans-serif; font-size: 1.75em; color: rgb(9, 9, 16);\"><a href=\"https://laravel.com/docs/6.x/structure#the-root-directory\" style=\"background-image: initial; background-position: initial; background-size: initial; background-repeat: initial; background-attachment: initial; background-origin: initial; background-clip: initial; position: relative; transition: all 0.3s ease 0s; color: rgb(9, 9, 16);\">The Root Directory</a></h2><p style=\"font-size: 16px; line-height: 1.8em; color: rgba(9, 9, 16, 0.7); margin-bottom: 2em; font-family: scandia-web, sans-serif; letter-spacing: normal;\"><a name=\"the-root-app-directory\" style=\"background-image: initial; background-position: initial; background-size: initial; background-repeat: initial; background-attachment: initial; background-origin: initial; background-clip: initial; position: relative; text-decoration-line: underline; transition: all 0.3s ease 0s; color: rgb(255, 45, 32); display: block; visibility: hidden; top: -45px;\"></a></p><h4 style=\"font-family: scandia-web, sans-serif; font-size: 16px; color: rgb(9, 9, 16);\"><a href=\"https://laravel.com/docs/6.x/structure#the-root-app-directory\" style=\"background-image: initial; background-position: initial; background-size: initial; background-repeat: initial; background-attachment: initial; background-origin: initial; background-clip: initial; position: relative; transition: all 0.3s ease 0s; color: rgb(9, 9, 16);\">The App Directory</a></h4><p style=\"font-size: 16px; line-height: 1.8em; color: rgba(9, 9, 16, 0.7); margin-bottom: 2em; font-family: scandia-web, sans-serif; letter-spacing: normal;\">The&nbsp;<code class=\" language-php\" style=\"font-family: source-code-pro, monospace; font-size: 0.8rem; line-height: 1.9; color: rgb(202, 71, 63); background: rgb(251, 251, 253); padding: 0px 0.25em; white-space: pre; word-spacing: normal; word-break: normal; overflow-wrap: normal; tab-size: 4; hyphens: none; box-shadow: rgba(0, 0, 0, 0.075) 0px 1px 1px;\">app</code>&nbsp;directory contains the core code of your application. We\'ll explore this directory in more detail soon; however, almost all of the classes in your application will be in this directory.</p><p style=\"font-size: 16px; line-height: 1.8em; color: rgba(9, 9, 16, 0.7); margin-bottom: 2em; font-family: scandia-web, sans-serif; letter-spacing: normal;\"><a name=\"the-bootstrap-directory\" style=\"background-image: initial; background-position: initial; background-size: initial; background-repeat: initial; background-attachment: initial; background-origin: initial; background-clip: initial; position: relative; text-decoration-line: underline; transition: all 0.3s ease 0s; color: rgb(255, 45, 32); display: block; visibility: hidden; top: -45px;\"></a></p><h4 style=\"font-family: scandia-web, sans-serif; font-size: 16px; color: rgb(9, 9, 16);\"><a href=\"https://laravel.com/docs/6.x/structure#the-bootstrap-directory\" style=\"background-image: initial; background-position: initial; background-size: initial; background-repeat: initial; background-attachment: initial; background-origin: initial; background-clip: initial; position: relative; transition: all 0.3s ease 0s; color: rgb(9, 9, 16);\">The Bootstrap Directory</a></h4><p style=\"font-size: 16px; line-height: 1.8em; color: rgba(9, 9, 16, 0.7); margin-bottom: 2em; font-family: scandia-web, sans-serif; letter-spacing: normal;\">The&nbsp;<code class=\" language-php\" style=\"font-family: source-code-pro, monospace; font-size: 0.8rem; line-height: 1.9; color: rgb(202, 71, 63); background: rgb(251, 251, 253); padding: 0px 0.25em; white-space: pre; word-spacing: normal; word-break: normal; overflow-wrap: normal; tab-size: 4; hyphens: none; box-shadow: rgba(0, 0, 0, 0.075) 0px 1px 1px;\">bootstrap</code>&nbsp;directory contains the&nbsp;<code class=\" language-php\" style=\"font-family: source-code-pro, monospace; font-size: 0.8rem; line-height: 1.9; color: rgb(202, 71, 63); background: rgb(251, 251, 253); padding: 0px 0.25em; white-space: pre; word-spacing: normal; word-break: normal; overflow-wrap: normal; tab-size: 4; hyphens: none; box-shadow: rgba(0, 0, 0, 0.075) 0px 1px 1px;\">app<span class=\"token punctuation\" style=\"color: rgb(9, 9, 16);\">.</span>php</code>&nbsp;file which bootstraps the framework. This directory also houses a&nbsp;<code class=\" language-php\" style=\"font-family: source-code-pro, monospace; font-size: 0.8rem; line-height: 1.9; color: rgb(202, 71, 63); background: rgb(251, 251, 253); padding: 0px 0.25em; white-space: pre; word-spacing: normal; word-break: normal; overflow-wrap: normal; tab-size: 4; hyphens: none; box-shadow: rgba(0, 0, 0, 0.075) 0px 1px 1px;\">cache</code>&nbsp;directory which contains framework generated files for performance optimization such as the route and services cache files.</p><p style=\"font-size: 16px; line-height: 1.8em; color: rgba(9, 9, 16, 0.7); margin-bottom: 2em; font-family: scandia-web, sans-serif; letter-spacing: normal;\"><a name=\"the-config-directory\" style=\"background-image: initial; background-position: initial; background-size: initial; background-repeat: initial; background-attachment: initial; background-origin: initial; background-clip: initial; position: relative; text-decoration-line: underline; transition: all 0.3s ease 0s; color: rgb(255, 45, 32); display: block; visibility: hidden; top: -45px;\"></a></p><h4 style=\"font-family: scandia-web, sans-serif; font-size: 16px; color: rgb(9, 9, 16);\"><a href=\"https://laravel.com/docs/6.x/structure#the-config-directory\" style=\"background-image: initial; background-position: initial; background-size: initial; background-repeat: initial; background-attachment: initial; background-origin: initial; background-clip: initial; position: relative; transition: all 0.3s ease 0s; color: rgb(9, 9, 16);\">The Config Directory</a></h4><p style=\"font-size: 16px; line-height: 1.8em; color: rgba(9, 9, 16, 0.7); margin-bottom: 2em; font-family: scandia-web, sans-serif; letter-spacing: normal;\">The&nbsp;<code class=\" language-php\" style=\"font-family: source-code-pro, monospace; font-size: 0.8rem; line-height: 1.9; color: rgb(202, 71, 63); background: rgb(251, 251, 253); padding: 0px 0.25em; white-space: pre; word-spacing: normal; word-break: normal; overflow-wrap: normal; tab-size: 4; hyphens: none; box-shadow: rgba(0, 0, 0, 0.075) 0px 1px 1px;\">config</code>&nbsp;directory, as the name implies, contains all of your application\'s configuration files. It\'s a great idea to read through all of these files and familiarize yourself with all of the options available to you.</p><p style=\"font-size: 16px; line-height: 1.8em; color: rgba(9, 9, 16, 0.7); margin-bottom: 2em; font-family: scandia-web, sans-serif; letter-spacing: normal;\"><a name=\"the-database-directory\" style=\"background-image: initial; background-position: initial; background-size: initial; background-repeat: initial; background-attachment: initial; background-origin: initial; background-clip: initial; position: relative; text-decoration-line: underline; transition: all 0.3s ease 0s; color: rgb(255, 45, 32); display: block; visibility: hidden; top: -45px;\"></a></p><h4 style=\"font-family: scandia-web, sans-serif; font-size: 16px; color: rgb(9, 9, 16);\"><a href=\"https://laravel.com/docs/6.x/structure#the-database-directory\" style=\"background-image: initial; background-position: initial; background-size: initial; background-repeat: initial; background-attachment: initial; background-origin: initial; background-clip: initial; position: relative; transition: all 0.3s ease 0s; color: rgb(9, 9, 16);\">The Database Directory</a></h4><p style=\"font-size: 16px; line-height: 1.8em; color: rgba(9, 9, 16, 0.7); margin-bottom: 2em; font-family: scandia-web, sans-serif; letter-spacing: normal;\">The&nbsp;<code class=\" language-php\" style=\"font-family: source-code-pro, monospace; font-size: 0.8rem; line-height: 1.9; color: rgb(202, 71, 63); background: rgb(251, 251, 253); padding: 0px 0.25em; white-space: pre; word-spacing: normal; word-break: normal; overflow-wrap: normal; tab-size: 4; hyphens: none; box-shadow: rgba(0, 0, 0, 0.075) 0px 1px 1px;\">database</code>&nbsp;directory contains your database migrations, model factories, and seeds. If you wish, you may also use this directory to hold an SQLite database.</p><p style=\"font-size: 16px; line-height: 1.8em; color: rgba(9, 9, 16, 0.7); margin-bottom: 2em; font-family: scandia-web, sans-serif; letter-spacing: normal;\"><a name=\"the-public-directory\" style=\"background-image: initial; background-position: initial; background-size: initial; background-repeat: initial; background-attachment: initial; background-origin: initial; background-clip: initial; position: relative; text-decoration-line: underline; transition: all 0.3s ease 0s; color: rgb(255, 45, 32); display: block; visibility: hidden; top: -45px;\"></a></p><h4 style=\"font-family: scandia-web, sans-serif; font-size: 16px; color: rgb(9, 9, 16);\"><a href=\"https://laravel.com/docs/6.x/structure#the-public-directory\" style=\"background-image: initial; background-position: initial; background-size: initial; background-repeat: initial; background-attachment: initial; background-origin: initial; background-clip: initial; position: relative; transition: all 0.3s ease 0s; color: rgb(9, 9, 16);\">The Public Directory</a></h4><p style=\"font-size: 16px; line-height: 1.8em; color: rgba(9, 9, 16, 0.7); margin-bottom: 2em; font-family: scandia-web, sans-serif; letter-spacing: normal;\">The&nbsp;<code class=\" language-php\" style=\"font-family: source-code-pro, monospace; font-size: 0.8rem; line-height: 1.9; color: rgb(202, 71, 63); background: rgb(251, 251, 253); padding: 0px 0.25em; white-space: pre; word-spacing: normal; word-break: normal; overflow-wrap: normal; tab-size: 4; hyphens: none; box-shadow: rgba(0, 0, 0, 0.075) 0px 1px 1px;\"><span class=\"token keyword\" style=\"color: rgb(5, 84, 114);\">public</span></code>&nbsp;directory contains the&nbsp;<code class=\" language-php\" style=\"font-family: source-code-pro, monospace; font-size: 0.8rem; line-height: 1.9; color: rgb(202, 71, 63); background: rgb(251, 251, 253); padding: 0px 0.25em; white-space: pre; word-spacing: normal; word-break: normal; overflow-wrap: normal; tab-size: 4; hyphens: none; box-shadow: rgba(0, 0, 0, 0.075) 0px 1px 1px;\">index<span class=\"token punctuation\" style=\"color: rgb(9, 9, 16);\">.</span>php</code>&nbsp;file, which is the entry point for all requests entering your application and configures autoloading. This directory also houses your assets such as images, JavaScript, and CSS.</p><p style=\"font-size: 16px; line-height: 1.8em; color: rgba(9, 9, 16, 0.7); margin-bottom: 2em; font-family: scandia-web, sans-serif; letter-spacing: normal;\"><a name=\"the-resources-directory\" style=\"background-image: initial; background-position: initial; background-size: initial; background-repeat: initial; background-attachment: initial; background-origin: initial; background-clip: initial; position: relative; text-decoration-line: underline; transition: all 0.3s ease 0s; color: rgb(255, 45, 32); display: block; visibility: hidden; top: -45px;\"></a></p><h4 style=\"font-family: scandia-web, sans-serif; font-size: 16px; color: rgb(9, 9, 16);\"><a href=\"https://laravel.com/docs/6.x/structure#the-resources-directory\" style=\"background-image: initial; background-position: initial; background-size: initial; background-repeat: initial; background-attachment: initial; background-origin: initial; background-clip: initial; position: relative; transition: all 0.3s ease 0s; color: rgb(9, 9, 16);\">The Resources Directory</a></h4><p style=\"font-size: 16px; line-height: 1.8em; color: rgba(9, 9, 16, 0.7); margin-bottom: 2em; font-family: scandia-web, sans-serif; letter-spacing: normal;\">The&nbsp;<code class=\" language-php\" style=\"font-family: source-code-pro, monospace; font-size: 0.8rem; line-height: 1.9; color: rgb(202, 71, 63); background: rgb(251, 251, 253); padding: 0px 0.25em; white-space: pre; word-spacing: normal; word-break: normal; overflow-wrap: normal; tab-size: 4; hyphens: none; box-shadow: rgba(0, 0, 0, 0.075) 0px 1px 1px;\">resources</code>&nbsp;directory contains your views as well as your raw, un-compiled assets such as LESS, SASS, or JavaScript. This directory also houses all of your language files.</p><p style=\"font-size: 16px; line-height: 1.8em; color: rgba(9, 9, 16, 0.7); margin-bottom: 2em; font-family: scandia-web, sans-serif; letter-spacing: normal;\"><a name=\"the-routes-directory\" style=\"background-image: initial; background-position: initial; background-size: initial; background-repeat: initial; background-attachment: initial; background-origin: initial; background-clip: initial; position: relative; text-decoration-line: underline; transition: all 0.3s ease 0s; color: rgb(255, 45, 32); display: block; visibility: hidden; top: -45px;\"></a></p><h4 style=\"font-family: scandia-web, sans-serif; font-size: 16px; color: rgb(9, 9, 16);\"><a href=\"https://laravel.com/docs/6.x/structure#the-routes-directory\" style=\"background-image: initial; background-position: initial; background-size: initial; background-repeat: initial; background-attachment: initial; background-origin: initial; background-clip: initial; position: relative; transition: all 0.3s ease 0s; color: rgb(9, 9, 16);\">The Routes Directory</a></h4><p style=\"font-size: 16px; line-height: 1.8em; color: rgba(9, 9, 16, 0.7); margin-bottom: 2em; font-family: scandia-web, sans-serif; letter-spacing: normal;\">The&nbsp;<code class=\" language-php\" style=\"font-family: source-code-pro, monospace; font-size: 0.8rem; line-height: 1.9; color: rgb(202, 71, 63); background: rgb(251, 251, 253); padding: 0px 0.25em; white-space: pre; word-spacing: normal; word-break: normal; overflow-wrap: normal; tab-size: 4; hyphens: none; box-shadow: rgba(0, 0, 0, 0.075) 0px 1px 1px;\">routes</code>&nbsp;directory contains all of the route definitions for your application. By default, several route files are included with Laravel:&nbsp;<code class=\" language-php\" style=\"font-family: source-code-pro, monospace; font-size: 0.8rem; line-height: 1.9; color: rgb(202, 71, 63); background: rgb(251, 251, 253); padding: 0px 0.25em; white-space: pre; word-spacing: normal; word-break: normal; overflow-wrap: normal; tab-size: 4; hyphens: none; box-shadow: rgba(0, 0, 0, 0.075) 0px 1px 1px;\">web<span class=\"token punctuation\" style=\"color: rgb(9, 9, 16);\">.</span>php</code>,&nbsp;<code class=\" language-php\" style=\"font-family: source-code-pro, monospace; font-size: 0.8rem; line-height: 1.9; color: rgb(202, 71, 63); background: rgb(251, 251, 253); padding: 0px 0.25em; white-space: pre; word-spacing: normal; word-break: normal; overflow-wrap: normal; tab-size: 4; hyphens: none; box-shadow: rgba(0, 0, 0, 0.075) 0px 1px 1px;\">api<span class=\"token punctuation\" style=\"color: rgb(9, 9, 16);\">.</span>php</code>,&nbsp;<code class=\" language-php\" style=\"font-family: source-code-pro, monospace; font-size: 0.8rem; line-height: 1.9; color: rgb(202, 71, 63); background: rgb(251, 251, 253); padding: 0px 0.25em; white-space: pre; word-spacing: normal; word-break: normal; overflow-wrap: normal; tab-size: 4; hyphens: none; box-shadow: rgba(0, 0, 0, 0.075) 0px 1px 1px;\">console<span class=\"token punctuation\" style=\"color: rgb(9, 9, 16);\">.</span>php</code>&nbsp;and&nbsp;<code class=\" language-php\" style=\"font-family: source-code-pro, monospace; font-size: 0.8rem; line-height: 1.9; color: rgb(202, 71, 63); background: rgb(251, 251, 253); padding: 0px 0.25em; white-space: pre; word-spacing: normal; word-break: normal; overflow-wrap: normal; tab-size: 4; hyphens: none; box-shadow: rgba(0, 0, 0, 0.075) 0px 1px 1px;\">channels<span class=\"token punctuation\" style=\"color: rgb(9, 9, 16);\">.</span>php</code>.</p><p style=\"font-size: 16px; line-height: 1.8em; color: rgba(9, 9, 16, 0.7); margin-bottom: 2em; font-family: scandia-web, sans-serif; letter-spacing: normal;\">The&nbsp;<code class=\" language-php\" style=\"font-family: source-code-pro, monospace; font-size: 0.8rem; line-height: 1.9; color: rgb(202, 71, 63); background: rgb(251, 251, 253); padding: 0px 0.25em; white-space: pre; word-spacing: normal; word-break: normal; overflow-wrap: normal; tab-size: 4; hyphens: none; box-shadow: rgba(0, 0, 0, 0.075) 0px 1px 1px;\">web<span class=\"token punctuation\" style=\"color: rgb(9, 9, 16);\">.</span>php</code>&nbsp;file contains routes that the&nbsp;<code class=\" language-php\" style=\"font-family: source-code-pro, monospace; font-size: 0.8rem; line-height: 1.9; color: rgb(202, 71, 63); background: rgb(251, 251, 253); padding: 0px 0.25em; white-space: pre; word-spacing: normal; word-break: normal; overflow-wrap: normal; tab-size: 4; hyphens: none; box-shadow: rgba(0, 0, 0, 0.075) 0px 1px 1px;\">RouteServiceProvider</code>&nbsp;places in the&nbsp;<code class=\" language-php\" style=\"font-family: source-code-pro, monospace; font-size: 0.8rem; line-height: 1.9; color: rgb(202, 71, 63); background: rgb(251, 251, 253); padding: 0px 0.25em; white-space: pre; word-spacing: normal; word-break: normal; overflow-wrap: normal; tab-size: 4; hyphens: none; box-shadow: rgba(0, 0, 0, 0.075) 0px 1px 1px;\">web</code>&nbsp;middleware group, which provides session state, CSRF protection, and cookie encryption. If your application does not offer a stateless, RESTful API, all of your routes will most likely be defined in the&nbsp;<code class=\" language-php\" style=\"font-family: source-code-pro, monospace; font-size: 0.8rem; line-height: 1.9; color: rgb(202, 71, 63); background: rgb(251, 251, 253); padding: 0px 0.25em; white-space: pre; word-spacing: normal; word-break: normal; overflow-wrap: normal; tab-size: 4; hyphens: none; box-shadow: rgba(0, 0, 0, 0.075) 0px 1px 1px;\">web<span class=\"token punctuation\" style=\"color: rgb(9, 9, 16);\">.</span>php</code>&nbsp;file.</p><p style=\"font-size: 16px; line-height: 1.8em; color: rgba(9, 9, 16, 0.7); margin-bottom: 2em; font-family: scandia-web, sans-serif; letter-spacing: normal;\">The&nbsp;<code class=\" language-php\" style=\"font-family: source-code-pro, monospace; font-size: 0.8rem; line-height: 1.9; color: rgb(202, 71, 63); background: rgb(251, 251, 253); padding: 0px 0.25em; white-space: pre; word-spacing: normal; word-break: normal; overflow-wrap: normal; tab-size: 4; hyphens: none; box-shadow: rgba(0, 0, 0, 0.075) 0px 1px 1px;\">api<span class=\"token punctuation\" style=\"color: rgb(9, 9, 16);\">.</span>php</code>&nbsp;file contains routes that the&nbsp;<code class=\" language-php\" style=\"font-family: source-code-pro, monospace; font-size: 0.8rem; line-height: 1.9; color: rgb(202, 71, 63); background: rgb(251, 251, 253); padding: 0px 0.25em; white-space: pre; word-spacing: normal; word-break: normal; overflow-wrap: normal; tab-size: 4; hyphens: none; box-shadow: rgba(0, 0, 0, 0.075) 0px 1px 1px;\">RouteServiceProvider</code>&nbsp;places in the&nbsp;<code class=\" language-php\" style=\"font-family: source-code-pro, monospace; font-size: 0.8rem; line-height: 1.9; color: rgb(202, 71, 63); background: rgb(251, 251, 253); padding: 0px 0.25em; white-space: pre; word-spacing: normal; word-break: normal; overflow-wrap: normal; tab-size: 4; hyphens: none; box-shadow: rgba(0, 0, 0, 0.075) 0px 1px 1px;\">api</code>&nbsp;middleware group, which provides rate limiting. These routes are intended to be stateless, so requests entering the application through these routes are intended to be authenticated via tokens and will not have access to session state.</p><p style=\"font-size: 16px; line-height: 1.8em; color: rgba(9, 9, 16, 0.7); margin-bottom: 2em; font-family: scandia-web, sans-serif; letter-spacing: normal;\">The&nbsp;<code class=\" language-php\" style=\"font-family: source-code-pro, monospace; font-size: 0.8rem; line-height: 1.9; color: rgb(202, 71, 63); background: rgb(251, 251, 253); padding: 0px 0.25em; white-space: pre; word-spacing: normal; word-break: normal; overflow-wrap: normal; tab-size: 4; hyphens: none; box-shadow: rgba(0, 0, 0, 0.075) 0px 1px 1px;\">console<span class=\"token punctuation\" style=\"color: rgb(9, 9, 16);\">.</span>php</code>&nbsp;file is where you may define all of your Closure based console commands. Each Closure is bound to a command instance allowing a simple approach to interacting with each command\'s IO methods. Even though this file does not define HTTP routes, it defines console based entry points (routes) into your application.</p><p style=\"font-size: 16px; line-height: 1.8em; color: rgba(9, 9, 16, 0.7); margin-bottom: 2em; font-family: scandia-web, sans-serif; letter-spacing: normal;\">The&nbsp;<code class=\" language-php\" style=\"font-family: source-code-pro, monospace; font-size: 0.8rem; line-height: 1.9; color: rgb(202, 71, 63); background: rgb(251, 251, 253); padding: 0px 0.25em; white-space: pre; word-spacing: normal; word-break: normal; overflow-wrap: normal; tab-size: 4; hyphens: none; box-shadow: rgba(0, 0, 0, 0.075) 0px 1px 1px;\">channels<span class=\"token punctuation\" style=\"color: rgb(9, 9, 16);\">.</span>php</code>&nbsp;file is where you may register all of the event broadcasting channels that your application supports.</p><p style=\"font-size: 16px; line-height: 1.8em; color: rgba(9, 9, 16, 0.7); margin-bottom: 2em; font-family: scandia-web, sans-serif; letter-spacing: normal;\"><a name=\"the-storage-directory\" style=\"background-image: initial; background-position: initial; background-size: initial; background-repeat: initial; background-attachment: initial; background-origin: initial; background-clip: initial; position: relative; text-decoration-line: underline; transition: all 0.3s ease 0s; color: rgb(255, 45, 32); display: block; visibility: hidden; top: -45px;\"></a></p><h4 style=\"font-family: scandia-web, sans-serif; font-size: 16px; color: rgb(9, 9, 16);\"><a href=\"https://laravel.com/docs/6.x/structure#the-storage-directory\" style=\"background-image: initial; background-position: initial; background-size: initial; background-repeat: initial; background-attachment: initial; background-origin: initial; background-clip: initial; position: relative; transition: all 0.3s ease 0s; color: rgb(9, 9, 16);\">The Storage Directory</a></h4><p style=\"font-size: 16px; line-height: 1.8em; color: rgba(9, 9, 16, 0.7); margin-bottom: 2em; font-family: scandia-web, sans-serif; letter-spacing: normal;\">The&nbsp;<code class=\" language-php\" style=\"font-family: source-code-pro, monospace; font-size: 0.8rem; line-height: 1.9; color: rgb(202, 71, 63); background: rgb(251, 251, 253); padding: 0px 0.25em; white-space: pre; word-spacing: normal; word-break: normal; overflow-wrap: normal; tab-size: 4; hyphens: none; box-shadow: rgba(0, 0, 0, 0.075) 0px 1px 1px;\">storage</code>&nbsp;directory contains your compiled Blade templates, file based sessions, file caches, and other files generated by the framework. This directory is segregated into&nbsp;<code class=\" language-php\" style=\"font-family: source-code-pro, monospace; font-size: 0.8rem; line-height: 1.9; color: rgb(202, 71, 63); background: rgb(251, 251, 253); padding: 0px 0.25em; white-space: pre; word-spacing: normal; word-break: normal; overflow-wrap: normal; tab-size: 4; hyphens: none; box-shadow: rgba(0, 0, 0, 0.075) 0px 1px 1px;\">app</code>,&nbsp;<code class=\" language-php\" style=\"font-family: source-code-pro, monospace; font-size: 0.8rem; line-height: 1.9; color: rgb(202, 71, 63); background: rgb(251, 251, 253); padding: 0px 0.25em; white-space: pre; word-spacing: normal; word-break: normal; overflow-wrap: normal; tab-size: 4; hyphens: none; box-shadow: rgba(0, 0, 0, 0.075) 0px 1px 1px;\">framework</code>, and&nbsp;<code class=\" language-php\" style=\"font-family: source-code-pro, monospace; font-size: 0.8rem; line-height: 1.9; color: rgb(202, 71, 63); background: rgb(251, 251, 253); padding: 0px 0.25em; white-space: pre; word-spacing: normal; word-break: normal; overflow-wrap: normal; tab-size: 4; hyphens: none; box-shadow: rgba(0, 0, 0, 0.075) 0px 1px 1px;\">logs</code>&nbsp;directories. The&nbsp;<code class=\" language-php\" style=\"font-family: source-code-pro, monospace; font-size: 0.8rem; line-height: 1.9; color: rgb(202, 71, 63); background: rgb(251, 251, 253); padding: 0px 0.25em; white-space: pre; word-spacing: normal; word-break: normal; overflow-wrap: normal; tab-size: 4; hyphens: none; box-shadow: rgba(0, 0, 0, 0.075) 0px 1px 1px;\">app</code>&nbsp;directory may be used to store any files generated by your application. The&nbsp;<code class=\" language-php\" style=\"font-family: source-code-pro, monospace; font-size: 0.8rem; line-height: 1.9; color: rgb(202, 71, 63); background: rgb(251, 251, 253); padding: 0px 0.25em; white-space: pre; word-spacing: normal; word-break: normal; overflow-wrap: normal; tab-size: 4; hyphens: none; box-shadow: rgba(0, 0, 0, 0.075) 0px 1px 1px;\">framework</code>&nbsp;directory is used to store framework generated files and caches. Finally, the&nbsp;<code class=\" language-php\" style=\"font-family: source-code-pro, monospace; font-size: 0.8rem; line-height: 1.9; color: rgb(202, 71, 63); background: rgb(251, 251, 253); padding: 0px 0.25em; white-space: pre; word-spacing: normal; word-break: normal; overflow-wrap: normal; tab-size: 4; hyphens: none; box-shadow: rgba(0, 0, 0, 0.075) 0px 1px 1px;\">logs</code>&nbsp;directory contains your application\'s log files.</p><p style=\"font-size: 16px; line-height: 1.8em; color: rgba(9, 9, 16, 0.7); margin-bottom: 2em; font-family: scandia-web, sans-serif; letter-spacing: normal;\">The&nbsp;<code class=\" language-php\" style=\"font-family: source-code-pro, monospace; font-size: 0.8rem; line-height: 1.9; color: rgb(202, 71, 63); background: rgb(251, 251, 253); padding: 0px 0.25em; white-space: pre; word-spacing: normal; word-break: normal; overflow-wrap: normal; tab-size: 4; hyphens: none; box-shadow: rgba(0, 0, 0, 0.075) 0px 1px 1px;\">storage<span class=\"token operator\" style=\"color: rgb(9, 9, 16);\">/</span>app<span class=\"token operator\" style=\"color: rgb(9, 9, 16);\">/</span><span class=\"token keyword\" style=\"color: rgb(5, 84, 114);\">public</span></code>&nbsp;directory may be used to store user-generated files, such as profile avatars, that should be publicly accessible. You should create a symbolic link at&nbsp;<code class=\" language-php\" style=\"font-family: source-code-pro, monospace; font-size: 0.8rem; line-height: 1.9; color: rgb(202, 71, 63); background: rgb(251, 251, 253); padding: 0px 0.25em; white-space: pre; word-spacing: normal; word-break: normal; overflow-wrap: normal; tab-size: 4; hyphens: none; box-shadow: rgba(0, 0, 0, 0.075) 0px 1px 1px;\"><span class=\"token keyword\" style=\"color: rgb(5, 84, 114);\">public</span><span class=\"token operator\" style=\"color: rgb(9, 9, 16);\">/</span>storage</code>&nbsp;which points to this directory. You may create the link using the&nbsp;<code class=\" language-php\" style=\"font-family: source-code-pro, monospace; font-size: 0.8rem; line-height: 1.9; color: rgb(202, 71, 63); background: rgb(251, 251, 253); padding: 0px 0.25em; white-space: pre; word-spacing: normal; word-break: normal; overflow-wrap: normal; tab-size: 4; hyphens: none; box-shadow: rgba(0, 0, 0, 0.075) 0px 1px 1px;\">php artisan storage<span class=\"token punctuation\" style=\"color: rgb(9, 9, 16);\">:</span>link</code>&nbsp;command.</p><p style=\"font-size: 16px; line-height: 1.8em; color: rgba(9, 9, 16, 0.7); margin-bottom: 2em; font-family: scandia-web, sans-serif; letter-spacing: normal;\"><a name=\"the-tests-directory\" style=\"background-image: initial; background-position: initial; background-size: initial; background-repeat: initial; background-attachment: initial; background-origin: initial; background-clip: initial; position: relative; text-decoration-line: underline; transition: all 0.3s ease 0s; color: rgb(255, 45, 32); display: block; visibility: hidden; top: -45px;\"></a></p><h4 style=\"font-family: scandia-web, sans-serif; font-size: 16px; color: rgb(9, 9, 16);\"><a href=\"https://laravel.com/docs/6.x/structure#the-tests-directory\" style=\"background-image: initial; background-position: initial; background-size: initial; background-repeat: initial; background-attachment: initial; background-origin: initial; background-clip: initial; position: relative; transition: all 0.3s ease 0s; color: rgb(9, 9, 16);\">The Tests Directory</a></h4><p style=\"font-size: 16px; line-height: 1.8em; color: rgba(9, 9, 16, 0.7); margin-bottom: 2em; font-family: scandia-web, sans-serif; letter-spacing: normal;\">The&nbsp;<code class=\" language-php\" style=\"font-family: source-code-pro, monospace; font-size: 0.8rem; line-height: 1.9; color: rgb(202, 71, 63); background: rgb(251, 251, 253); padding: 0px 0.25em; white-space: pre; word-spacing: normal; word-break: normal; overflow-wrap: normal; tab-size: 4; hyphens: none; box-shadow: rgba(0, 0, 0, 0.075) 0px 1px 1px;\">tests</code>&nbsp;directory contains your automated tests. An example&nbsp;<a href=\"https://phpunit.de/\" style=\"background-image: initial; background-position: initial; background-size: initial; background-repeat: initial; background-attachment: initial; background-origin: initial; background-clip: initial; position: relative; text-decoration-line: underline; transition: all 0.3s ease 0s; color: rgb(255, 45, 32);\">PHPUnit</a>&nbsp;test is provided out of the box. Each test class should be suffixed with the word&nbsp;<code class=\" language-php\" style=\"font-family: source-code-pro, monospace; font-size: 0.8rem; line-height: 1.9; color: rgb(202, 71, 63); background: rgb(251, 251, 253); padding: 0px 0.25em; white-space: pre; word-spacing: normal; word-break: normal; overflow-wrap: normal; tab-size: 4; hyphens: none; box-shadow: rgba(0, 0, 0, 0.075) 0px 1px 1px;\">Test</code>. You may run your tests using the&nbsp;<code class=\" language-php\" style=\"font-family: source-code-pro, monospace; font-size: 0.8rem; line-height: 1.9; color: rgb(202, 71, 63); background: rgb(251, 251, 253); padding: 0px 0.25em; white-space: pre; word-spacing: normal; word-break: normal; overflow-wrap: normal; tab-size: 4; hyphens: none; box-shadow: rgba(0, 0, 0, 0.075) 0px 1px 1px;\">phpunit</code>&nbsp;or&nbsp;<code class=\" language-php\" style=\"font-family: source-code-pro, monospace; font-size: 0.8rem; line-height: 1.9; color: rgb(202, 71, 63); background: rgb(251, 251, 253); padding: 0px 0.25em; white-space: pre; word-spacing: normal; word-break: normal; overflow-wrap: normal; tab-size: 4; hyphens: none; box-shadow: rgba(0, 0, 0, 0.075) 0px 1px 1px;\">php vendor<span class=\"token operator\" style=\"color: rgb(9, 9, 16);\">/</span>bin<span class=\"token operator\" style=\"color: rgb(9, 9, 16);\">/</span>phpunit</code>&nbsp;commands.</p><p style=\"font-size: 16px; line-height: 1.8em; color: rgba(9, 9, 16, 0.7); margin-bottom: 2em; font-family: scandia-web, sans-serif; letter-spacing: normal;\"><a name=\"the-vendor-directory\" style=\"background-image: initial; background-position: initial; background-size: initial; background-repeat: initial; background-attachment: initial; background-origin: initial; background-clip: initial; position: relative; text-decoration-line: underline; transition: all 0.3s ease 0s; color: rgb(255, 45, 32); display: block; visibility: hidden; top: -45px;\"></a></p><h4 style=\"font-family: scandia-web, sans-serif; font-size: 16px; color: rgb(9, 9, 16);\"><a href=\"https://laravel.com/docs/6.x/structure#the-vendor-directory\" style=\"background-image: initial; background-position: initial; background-size: initial; background-repeat: initial; background-attachment: initial; background-origin: initial; background-clip: initial; position: relative; transition: all 0.3s ease 0s; color: rgb(9, 9, 16);\">The Vendor Directory</a></h4><p style=\"font-size: 16px; line-height: 1.8em; color: rgba(9, 9, 16, 0.7); margin-bottom: 2em; font-family: scandia-web, sans-serif; letter-spacing: normal;\">The&nbsp;<code class=\" language-php\" style=\"font-family: source-code-pro, monospace; font-size: 0.8rem; line-height: 1.9; color: rgb(202, 71, 63); background: rgb(251, 251, 253); padding: 0px 0.25em; white-space: pre; word-spacing: normal; word-break: normal; overflow-wrap: normal; tab-size: 4; hyphens: none; box-shadow: rgba(0, 0, 0, 0.075) 0px 1px 1px;\">vendor</code>&nbsp;directory contains your&nbsp;<a href=\"https://getcomposer.org/\" style=\"background-image: initial; background-position: initial; background-size: initial; background-repeat: initial; background-attachment: initial; background-origin: initial; background-clip: initial; position: relative; text-decoration-line: underline; transition: all 0.3s ease 0s; color: rgb(255, 45, 32);\">Composer</a>&nbsp;dependencies.</p>', NULL, NULL, '2020-02-04 03:46:35', '2020-02-04 03:46:35'),
(7, 3, 1, 'Security Updates', '<p style=\"font-size: 15px; line-height: 1.8em; margin-right: 0px; margin-left: 0px; padding: 0px 0px 20px; color: rgb(70, 70, 70); font-family: proxima-nova, Helvetica, Arial, sans-serif; letter-spacing: normal;\">We know that improving WordPress security can be a terrifying thought for beginners. Especially if you’re not techy. Guess what – you’re not alone.</p><p style=\"font-size: 15px; line-height: 1.8em; margin-right: 0px; margin-left: 0px; padding: 0px 0px 20px; color: rgb(70, 70, 70); font-family: proxima-nova, Helvetica, Arial, sans-serif; letter-spacing: normal;\">We have helped thousands of WordPress users in hardening their WordPress security.</p><p style=\"font-size: 15px; line-height: 1.8em; margin-right: 0px; margin-left: 0px; padding: 0px 0px 20px; color: rgb(70, 70, 70); font-family: proxima-nova, Helvetica, Arial, sans-serif; letter-spacing: normal;\">We will show you how you can improve your WordPress security with just a few clicks (no coding required).</p><p style=\"font-size: 15px; line-height: 1.8em; margin-right: 0px; margin-left: 0px; padding: 0px 0px 20px; color: rgb(70, 70, 70); font-family: proxima-nova, Helvetica, Arial, sans-serif; letter-spacing: normal;\">If you can point-and-click, you can do this!</p><h4 id=\"managedhosting\" style=\"color: rgb(255, 98, 0); font-family: proxima-nova, Helvetica, Arial; margin-right: 0px; margin-bottom: 15px; margin-left: 0px; padding: 0px; font-size: 20px; line-height: 1.6em; font-weight: 700 !important;\">The Role of WordPress Hosting</h4><p style=\"font-size: 15px; line-height: 1.8em; margin-right: 0px; margin-left: 0px; padding: 0px 0px 20px; color: rgb(70, 70, 70); font-family: proxima-nova, Helvetica, Arial, sans-serif; letter-spacing: normal;\">Your&nbsp;<a title=\"How to Choose The Best WordPress Hosting?\" href=\"https://www.wpbeginner.com/wordpress-hosting/\" style=\"color: rgb(234, 106, 27);\">WordPress hosting</a>&nbsp;service plays the most important role in the security of your WordPress site. A good&nbsp;<a title=\"The Truth About Shared WordPress Web Hosting\" href=\"https://www.wpbeginner.com/the-truth-about-shared-wordpress-web-hosting/\" style=\"color: rgb(234, 106, 27);\">shared hosting</a>&nbsp;provider like&nbsp;<a title=\"Bluehost\" href=\"https://www.wpbeginner.com/refer/bluehost/\" target=\"_blank\" rel=\"nofollow noopener\" style=\"color: rgb(234, 106, 27);\">Bluehost</a>&nbsp;or&nbsp;<a title=\"SiteGround\" href=\"https://www.wpbeginner.com/refer/siteground/\" target=\"_blank\" rel=\"nofollow noopener\" style=\"color: rgb(234, 106, 27);\">Siteground</a>&nbsp;take the extra measures to protect their servers against common threats.</p><p style=\"font-size: 15px; line-height: 1.8em; margin-right: 0px; margin-left: 0px; padding: 0px 0px 20px; color: rgb(70, 70, 70); font-family: proxima-nova, Helvetica, Arial, sans-serif; letter-spacing: normal;\">Here is how a good web hosting company works in the background to protect your websites and data.</p><ul style=\"margin-right: 0px; margin-bottom: 0px; margin-left: 0px; padding: 0px 0px 15px; font-size: 15px; color: rgb(70, 70, 70); font-family: proxima-nova, Helvetica, Arial, sans-serif;\"><li style=\"margin: 0px 0px 15px 20px; list-style-type: square;\">They continuously monitor their network for suspicious activity.</li><li style=\"margin: 0px 0px 15px 20px; list-style-type: square;\">All good hosting companies have tools in place to prevent large scale DDOS attacks</li><li style=\"margin: 0px 0px 15px 20px; list-style-type: square;\">They keep their server software and hardware up to date to prevent hackers from exploiting a known security vulnerability in an old version.</li><li style=\"margin: 0px 0px 15px 20px; list-style-type: square;\">They have ready to deploy disaster recovery and accidents plans which allows them to protect your data in case of major accident.</li></ul><p style=\"font-size: 15px; line-height: 1.8em; margin-right: 0px; margin-left: 0px; padding: 0px 0px 20px; color: rgb(70, 70, 70); font-family: proxima-nova, Helvetica, Arial, sans-serif; letter-spacing: normal;\">On a shared hosting plan, you share the server resources with many other customers. This opens the risk of cross-site contamination where a hacker can use a neighboring site to attack your website.</p><p style=\"font-size: 15px; line-height: 1.8em; margin-right: 0px; margin-left: 0px; padding: 0px 0px 20px; color: rgb(70, 70, 70); font-family: proxima-nova, Helvetica, Arial, sans-serif; letter-spacing: normal;\">Using a&nbsp;<a title=\"When Do You Really Need Managed WordPress Hosting?\" href=\"https://www.wpbeginner.com/managed-wordpress-hosting/\" style=\"color: rgb(234, 106, 27);\">managed WordPress hosting</a>&nbsp;service provides a more secure platform for your website. Managed WordPress hosting companies offer automatic backups, automatic WordPress updates, and more advanced security configurations to protect your website</p><p style=\"font-size: 15px; line-height: 1.8em; margin-right: 0px; margin-left: 0px; padding: 0px 0px 20px; color: rgb(70, 70, 70); font-family: proxima-nova, Helvetica, Arial, sans-serif; letter-spacing: normal;\">We recommend&nbsp;<a title=\"WPEngine\" href=\"https://www.wpbeginner.com/refer/wpengine/\" target=\"_blank\" rel=\"nofollow noopener\" style=\"color: rgb(234, 106, 27);\">WPEngine</a>&nbsp;as our preferred managed WordPress hosting provider. They’re also the most popular one in the industry. (See our special&nbsp;<a title=\"WPEngine Coupon\" href=\"https://www.wpbeginner.com/deals/wpengine-coupon/\" style=\"color: rgb(234, 106, 27);\">WPEngine coupon</a>).</p>', NULL, NULL, '2020-02-04 03:56:42', '2020-02-04 03:56:42');
INSERT INTO `vipscapl_knowledge_base_article` (`id`, `category_id`, `user_id`, `article_title`, `description`, `file_name`, `deleted_at`, `created_at`, `updated_at`) VALUES
(8, 3, 1, 'Install WordPress', '<p style=\"box-sizing: inherit; margin: 1em 0px; padding: 0px; overflow-wrap: break-word; color: rgb(50, 55, 60); font-family: &quot;Open Sans&quot;, sans-serif; font-size: 18px; letter-spacing: normal;\">WordPress is well-known for its ease of installation. Under most circumstances, installing WordPress is a very simple process and takes less than five minutes to complete.&nbsp;<a href=\"https://wordpress.org/support/installation/installing-wordpress-at-popular-hosting-companies/\" style=\"box-sizing: inherit; text-decoration-line: underline; color: rgb(0, 115, 170); border: none;\">Many web hosts</a>&nbsp;now offer&nbsp;<a href=\"https://wordpress.org/support/installation/automated-installation/\" style=\"box-sizing: inherit; text-decoration-line: underline; color: rgb(0, 115, 170); border: none;\">tools (e.g. Fantastico) to automatically install WordPress</a>&nbsp;for you. However, if you wish to install WordPress yourself, the following guide will help.</p><h2 class=\"toc-heading\" id=\"things-to-know-before-installing-wordpress\" tabindex=\"-1\" style=\"box-sizing: inherit; margin: 2rem 0px 1rem; padding: 0px; font-family: &quot;Open Sans&quot;, sans-serif; font-size: 1.45rem; clear: left; line-height: 1.5em; color: rgb(50, 55, 60); float: none !important;\">Things to Know Before Installing WordPress&nbsp;<a href=\"https://wordpress.org/support/article/how-to-install-wordpress/#things-to-know-before-installing-wordpress\" class=\"anchor\" style=\"box-sizing: inherit; text-decoration-line: underline; color: rgb(0, 115, 170);\"><span aria-hidden=\"true\" style=\"box-sizing: inherit;\">#</span><span class=\"screen-reader-text\" style=\"box-sizing: inherit; position: absolute !important; margin: -1px; padding: 0px; height: 1px; width: 1px; overflow: hidden; clip: rect(1px, 1px, 1px, 1px); border: 0px; overflow-wrap: normal !important; clip-path: inset(50%);\">Things to Know Before Installing WordPress</span></a></h2><p style=\"box-sizing: inherit; margin: 1em 0px; padding: 0px; overflow-wrap: break-word; color: rgb(50, 55, 60); font-family: &quot;Open Sans&quot;, sans-serif; font-size: 18px; letter-spacing: normal;\">Before you begin the install, there are a few things you need to have and do. Refer the article&nbsp;<a href=\"https://wordpress.org/support/installation/before-you-install/\" style=\"box-sizing: inherit; text-decoration-line: underline; color: rgb(0, 115, 170); border: none;\">Before You Install</a>.<br style=\"box-sizing: inherit;\">If you need multiple WordPress instances, refer&nbsp;<a href=\"https://wordpress.org/support/article/installing-multiple-blogs/\" style=\"box-sizing: inherit; text-decoration-line: underline; color: rgb(0, 115, 170); border: none;\">Installing Multiple WordPress Instances</a>.</p><p class=\"toc-jump\" style=\"box-sizing: inherit; margin: 1em 0px; padding: 0px; overflow-wrap: break-word; position: relative; height: 50px; text-align: right; font-size: 12px; z-index: 1; color: rgb(50, 55, 60); font-family: &quot;Open Sans&quot;, sans-serif; letter-spacing: normal;\"><a href=\"https://wordpress.org/support/article/how-to-install-wordpress/#top\" style=\"box-sizing: inherit; text-decoration-line: underline; color: rgb(0, 115, 170); border: none;\">Top ↑</a></p><h2 class=\"toc-heading\" id=\"basic-instructions\" tabindex=\"-1\" style=\"box-sizing: inherit; margin: 2rem 0px 1rem; padding: 0px; font-family: &quot;Open Sans&quot;, sans-serif; font-size: 1.45rem; clear: left; line-height: 1.5em; color: rgb(50, 55, 60); float: none !important;\"><span id=\"Famous_5-Minute_Installation\" class=\"mw-headline\" style=\"box-sizing: inherit;\">Basic Instructions</span>&nbsp;<a href=\"https://wordpress.org/support/article/how-to-install-wordpress/#basic-instructions\" class=\"anchor\" style=\"box-sizing: inherit; text-decoration-line: underline; color: rgb(0, 115, 170);\"><span aria-hidden=\"true\" style=\"box-sizing: inherit;\">#</span><span class=\"screen-reader-text\" style=\"box-sizing: inherit; position: absolute !important; margin: -1px; padding: 0px; height: 1px; width: 1px; overflow: hidden; clip: rect(1px, 1px, 1px, 1px); border: 0px; overflow-wrap: normal !important; clip-path: inset(50%);\"><span id=\"Famous_5-Minute_Installation\" class=\"mw-headline\" style=\"box-sizing: inherit; position: absolute; margin: -1px; padding: 0px; height: 1px; width: 1px; overflow: hidden; clip: rect(1px, 1px, 1px, 1px); clip-path: inset(50%); border: 0px; overflow-wrap: normal !important;\">Basic Instructions</span></span></a></h2><p style=\"box-sizing: inherit; margin: 1em 0px; padding: 0px; overflow-wrap: break-word; color: rgb(50, 55, 60); font-family: &quot;Open Sans&quot;, sans-serif; font-size: 18px; letter-spacing: normal;\">Here’s the quick version of the instructions for those who are already comfortable with performing such installations. More&nbsp;<a href=\"https://wordpress.org/support/article/how-to-install-wordpress/#detailed-instructions\" style=\"box-sizing: inherit; text-decoration-line: underline; color: rgb(0, 115, 170); border: none;\">detailed instructions</a>&nbsp;follow.</p><ol style=\"box-sizing: inherit; margin-right: 0px; margin-bottom: 1.5em; margin-left: 3em; padding: 0px; list-style-position: initial; list-style-image: initial; color: rgb(50, 55, 60); font-family: &quot;Open Sans&quot;, sans-serif; font-size: 18px;\"><li style=\"box-sizing: inherit; margin: 0px; padding: 0px;\">Download and unzip the WordPress package if you haven’t already.</li><li style=\"box-sizing: inherit; margin: 0px; padding: 0px;\">Create a database for WordPress on your web server, as well as a&nbsp;<a title=\"Glossary\" href=\"https://wordpress.org/support/article/glossary/#mysql\" style=\"box-sizing: inherit; text-decoration-line: underline; color: rgb(0, 115, 170);\">MySQL</a>&nbsp;(or MariaDB) user who has all privileges for accessing and modifying it.</li><li style=\"box-sizing: inherit; margin: 0px; padding: 0px;\">(Optional) Find and rename&nbsp;<tt style=\"box-sizing: inherit; font-family: Monaco, Consolas, &quot;Andale Mono&quot;, &quot;DejaVu Sans Mono&quot;, monospace; font-size: 0.8rem;\">wp-config-sample.php</tt>&nbsp;to&nbsp;<tt style=\"box-sizing: inherit; font-family: Monaco, Consolas, &quot;Andale Mono&quot;, &quot;DejaVu Sans Mono&quot;, monospace; font-size: 0.8rem;\">wp-config.php</tt>, then edit the file (see&nbsp;<a title=\"Editing wp-config.php\" href=\"https://wordpress.org/support/article/editing-wp-config-php/\" style=\"box-sizing: inherit; text-decoration-line: underline; color: rgb(0, 115, 170);\">Editing wp-config.php</a>) and add your database information.<br style=\"box-sizing: inherit;\"><strong style=\"box-sizing: inherit; font-weight: bold;\">Note</strong>: If you are not comfortable with renaming files, step 3 is optional and you can skip it as the install program will create the&nbsp;<tt style=\"box-sizing: inherit; font-family: Monaco, Consolas, &quot;Andale Mono&quot;, &quot;DejaVu Sans Mono&quot;, monospace; font-size: 0.8rem;\">wp-config.php</tt>&nbsp;file for you.</li><li style=\"box-sizing: inherit; margin: 0px; padding: 0px;\">Upload the WordPress files to the desired location on your web server:<ul style=\"box-sizing: inherit; margin-right: 0px; margin-left: 1.5em; padding: 0px; list-style: disc;\"><li style=\"box-sizing: inherit; margin: 0px; padding: 0px;\">If you want to integrate WordPress into the root of your domain (e.g.&nbsp;<tt style=\"box-sizing: inherit; font-family: Monaco, Consolas, &quot;Andale Mono&quot;, &quot;DejaVu Sans Mono&quot;, monospace; font-size: 0.8rem;\">http://example.com/</tt>), move or upload all contents of the unzipped WordPress directory (excluding the WordPress directory itself) into the root directory of your web server.</li><li style=\"box-sizing: inherit; margin: 0px; padding: 0px;\">If you want to have your WordPress installation in its own subdirectory on your website (e.g.&nbsp;<tt style=\"box-sizing: inherit; font-family: Monaco, Consolas, &quot;Andale Mono&quot;, &quot;DejaVu Sans Mono&quot;, monospace; font-size: 0.8rem;\">http://example.com/blog/</tt>), create the&nbsp;<tt style=\"box-sizing: inherit; font-family: Monaco, Consolas, &quot;Andale Mono&quot;, &quot;DejaVu Sans Mono&quot;, monospace; font-size: 0.8rem;\">blog</tt>&nbsp;directory on your server and upload the contents of the unzipped WordPress package to the directory via FTP.</li><li style=\"box-sizing: inherit; margin: 0px; padding: 0px;\"><i style=\"box-sizing: inherit;\"><b style=\"box-sizing: inherit; font-weight: bold;\">Note:</b>&nbsp;If your FTP client has an option to convert file names to lower case, make sure it’s disabled.</i></li></ul></li><li style=\"box-sizing: inherit; margin: 0px; padding: 0px;\">Run the WordPress installation script by accessing the URL in a web browser. This should be the URL where you uploaded the WordPress files.<ul style=\"box-sizing: inherit; margin-right: 0px; margin-left: 1.5em; padding: 0px; list-style: disc;\"><li style=\"box-sizing: inherit; margin: 0px; padding: 0px;\">If you installed WordPress in the root directory, you should visit:&nbsp;<tt style=\"box-sizing: inherit; font-family: Monaco, Consolas, &quot;Andale Mono&quot;, &quot;DejaVu Sans Mono&quot;, monospace; font-size: 0.8rem;\">http://example.com/</tt></li><li style=\"box-sizing: inherit; margin: 0px; padding: 0px;\">If you installed WordPress in its own subdirectory called&nbsp;<tt style=\"box-sizing: inherit; font-family: Monaco, Consolas, &quot;Andale Mono&quot;, &quot;DejaVu Sans Mono&quot;, monospace; font-size: 0.8rem;\">blog</tt>, for example, you should visit:&nbsp;<tt style=\"box-sizing: inherit; font-family: Monaco, Consolas, &quot;Andale Mono&quot;, &quot;DejaVu Sans Mono&quot;, monospace; font-size: 0.8rem;\">http://example.com/blog/</tt></li></ul></li></ol><p style=\"box-sizing: inherit; margin: 1em 0px; padding: 0px; overflow-wrap: break-word; color: rgb(50, 55, 60); font-family: &quot;Open Sans&quot;, sans-serif; font-size: 18px; letter-spacing: normal;\">That’s it! WordPress should now be installed.</p>', NULL, NULL, '2020-02-04 04:20:40', '2020-02-04 04:20:40'),
(9, 3, 1, 'Support', '<h1 style=\"box-sizing: inherit; margin: 2rem 0px 1rem; padding: 0px; font-size: 2.2rem; clear: both; font-family: &quot;Open Sans&quot;, sans-serif; line-height: 1.5; text-align: center; color: rgb(50, 55, 60);\">Getting Started</h1><div class=\"three-up helphub-front-page\" style=\"box-sizing: inherit; margin: 0px; padding: 0px; color: rgb(50, 55, 60); font-family: &quot;Open Sans&quot;, sans-serif; font-size: 18px;\"><a href=\"https://wordpress.org/support/article/first-steps-with-wordpress-b/\" class=\"archive-block\" style=\"box-sizing: inherit; color: inherit; display: inline-block; vertical-align: top; width: 282px; margin-right: 42.2969px; font-size: 0.8rem;\"><article id=\"post-11028844\" class=\"post-11028844 helphub_article type-helphub_article status-publish hentry category-basic-usage category-block-editor category-getting-started\" style=\"box-sizing: inherit;\"><h2 style=\"box-sizing: inherit; margin: 2rem 0px 1rem; padding: 0px; font-family: inherit; font-size: 1.3rem; clear: both; line-height: 1.5;\">First Steps with WordPress</h2><p style=\"box-sizing: inherit; margin: 1em 0px; padding: 0px; overflow-wrap: break-word;\">Note: This page refers to WordPress using the Block Editor. If you are on a older version of WordPress or using the Classic Editor User, […]</p></article></a>&nbsp;<a href=\"https://wordpress.org/support/article/roles-and-capabilities/\" class=\"archive-block\" style=\"box-sizing: inherit; color: inherit; display: inline-block; vertical-align: top; width: 282px; margin-right: 42.2969px; font-size: 0.8rem;\"><article id=\"post-10937050\" class=\"post-10937050 helphub_article type-helphub_article status-publish hentry category-basic-administration category-getting-started category-installation helphub_persona-maintainers helphub_persona-publishers helphub_experience-beginner helphub_experience-experienced helphub_experience-intermediate\" style=\"box-sizing: inherit;\"><h2 style=\"box-sizing: inherit; margin: 2rem 0px 1rem; padding: 0px; font-family: inherit; font-size: 1.3rem; clear: both; line-height: 1.5;\">Roles and Capabilities</h2><p style=\"box-sizing: inherit; margin: 1em 0px; padding: 0px; overflow-wrap: break-word;\">WordPress uses a concept of Roles, designed to give the site owner the ability to control what users can and cannot do within the site. […]</p></article></a>&nbsp;<a href=\"https://wordpress.org/support/article/creating-a-search-page/\" class=\"archive-block\" style=\"box-sizing: inherit; color: inherit; display: inline-block; vertical-align: top; width: 282px; margin-right: 0px; font-size: 0.8rem;\"><article id=\"post-10450778\" class=\"post-10450778 helphub_article type-helphub_article status-publish hentry category-getting-started category-templates category-wordpress-lessons helphub_persona-maintainers helphub_experience-beginner\" style=\"box-sizing: inherit;\"><h2 style=\"box-sizing: inherit; margin: 2rem 0px 1rem; padding: 0px; font-family: inherit; font-size: 1.3rem; clear: both; line-height: 1.5;\">Creating a Search Page</h2><p style=\"box-sizing: inherit; margin: 1em 0px; padding: 0px; overflow-wrap: break-word;\">A Search Page is a WordPress Page with a custom Page template to give users more information for searching your site. Things You Need to […]</p></article></a>&nbsp;<a href=\"https://wordpress.org/support/article/glossary/\" class=\"archive-block\" style=\"box-sizing: inherit; color: inherit; display: inline-block; vertical-align: top; width: 282px; margin-right: 42.2969px; font-size: 0.8rem;\"><article id=\"post-10829891\" class=\"post-10829891 helphub_article type-helphub_article status-publish hentry category-getting-started category-wordpress-help helphub_persona-maintainers helphub_persona-publishers helphub_experience-beginner helphub_experience-experienced helphub_experience-intermediate\" style=\"box-sizing: inherit;\"><h2 style=\"box-sizing: inherit; margin: 2rem 0px 1rem; padding: 0px; font-family: inherit; font-size: 1.3rem; clear: both; line-height: 1.5;\">Glossary</h2><p style=\"box-sizing: inherit; margin: 1em 0px; padding: 0px; overflow-wrap: break-word;\">This document is designed to offer definitions of various terms, exclusive to WordPress, that users may not be familiar with. If you are a contributor […]</p></article></a>&nbsp;<a href=\"https://wordpress.org/support/article/twenty-fifteen/\" class=\"archive-block\" style=\"box-sizing: inherit; color: inherit; display: inline-block; vertical-align: top; width: 282px; margin-right: 42.2969px; font-size: 0.8rem;\"><article id=\"post-10863612\" class=\"post-10863612 helphub_article type-helphub_article status-publish hentry category-getting-started helphub_persona-maintainers helphub_experience-beginner\" style=\"box-sizing: inherit;\"><h2 style=\"box-sizing: inherit; margin: 2rem 0px 1rem; padding: 0px; font-family: inherit; font-size: 1.3rem; clear: both; line-height: 1.5;\">Twenty Fifteen</h2><p style=\"box-sizing: inherit; margin: 1em 0px; padding: 0px; overflow-wrap: break-word;\">Twenty Fifteen is the default theme for WordPress in 2015. It is super-clean, content-focused, and designed to bring a little more simplicity to our blogs. […]</p></article></a>&nbsp;<a href=\"https://wordpress.org/support/article/using-filezilla/\" class=\"archive-block\" style=\"box-sizing: inherit; color: inherit; display: inline-block; vertical-align: top; width: 282px; margin-right: 0px; font-size: 0.8rem;\"><article id=\"post-10853996\" class=\"post-10853996 helphub_article type-helphub_article status-publish hentry category-getting-started category-installation helphub_persona-publishers helphub_experience-beginner\" style=\"box-sizing: inherit;\"><h2 style=\"box-sizing: inherit; margin: 2rem 0px 1rem; padding: 0px; font-family: inherit; font-size: 1.3rem; clear: both; line-height: 1.5;\">Using FileZilla</h2><p style=\"box-sizing: inherit; margin: 1em 0px; padding: 0px; overflow-wrap: break-word;\">FileZilla is an open-source FTP-client and FTP-server developed by Tim Kosse (Germany) et.al. The FTP-client is available for multiple platforms such as Windows, Linux and […]</p></article></a>&nbsp;<a href=\"https://wordpress.org/support/article/content-visibility/\" class=\"archive-block\" style=\"box-sizing: inherit; color: inherit; display: inline-block; vertical-align: top; width: 282px; margin-right: 42.2969px; font-size: 0.8rem;\"><article id=\"post-10853902\" class=\"post-10853902 helphub_article type-helphub_article status-publish hentry category-getting-started category-wordpress-lessons helphub_persona-maintainers helphub_persona-publishers helphub_experience-beginner helphub_experience-intermediate\" style=\"box-sizing: inherit;\"><h2 style=\"box-sizing: inherit; margin: 2rem 0px 1rem; padding: 0px; font-family: inherit; font-size: 1.3rem; clear: both; line-height: 1.5;\">Content Visibility</h2><p style=\"box-sizing: inherit; margin: 1em 0px; padding: 0px; overflow-wrap: break-word;\">Content visibility is about controlling who can see your blog content. WordPress allows you to control the visibility of your posts and Pages on an […]</p></article></a>&nbsp;<a href=\"https://wordpress.org/support/article/posts-screen/\" class=\"archive-block\" style=\"box-sizing: inherit; color: inherit; display: inline-block; vertical-align: top; width: 282px; margin-right: 42.2969px; font-size: 0.8rem;\"><article id=\"post-10853893\" class=\"post-10853893 helphub_article type-helphub_article status-publish hentry category-getting-started category-how-to helphub_persona-maintainers helphub_experience-beginner\" style=\"box-sizing: inherit;\"><h2 style=\"box-sizing: inherit; margin: 2rem 0px 1rem; padding: 0px; font-family: inherit; font-size: 1.3rem; clear: both; line-height: 1.5;\">Posts Screen</h2><p style=\"box-sizing: inherit; margin: 1em 0px; padding: 0px; overflow-wrap: break-word;\">The Posts Screen provides the facility to manage all the Posts in a blog. Via this Screen, Posts can be edited, deleted, and viewed. Filtering, […]</p></article></a>&nbsp;<a href=\"https://wordpress.org/support/article/introduction-to-blogging/\" class=\"archive-block\" style=\"box-sizing: inherit; color: rgb(0, 115, 170); outline: 0px; display: inline-block; vertical-align: top; width: 282px; margin-right: 0px; font-size: 0.8rem;\"><article id=\"post-10851385\" class=\"post-10851385 helphub_article type-helphub_article status-publish hentry category-getting-started helphub_persona-maintainers helphub_experience-beginner\" style=\"box-sizing: inherit;\"><h2 style=\"box-sizing: inherit; margin: 2rem 0px 1rem; padding: 0px; font-family: inherit; font-size: 1.3rem; clear: both; line-height: 1.5;\">Introduction to Blogging</h2><p style=\"box-sizing: inherit; margin: 1em 0px; padding: 0px; overflow-wrap: break-word;\">What is a “blog”? “Blog” is an abbreviated version of “weblog,” which is a term used to describe websites that maintain an ongoing chronicle of […]</p></article></a></div>', NULL, NULL, '2020-02-04 04:22:41', '2020-02-04 04:22:41'),
(10, 4, 1, 'Guides', '<h2 id=\"header-general\" style=\"color: rgb(51, 51, 51); font-family: &quot;Source Sans Pro&quot;, &quot;Open Sans&quot;, Roboto, &quot;San Francisco&quot;, Helvetica, Arial, sans-serif;\">General<a id=\"general\" class=\"anchor\" href=\"https://nodejs.org/en/docs/guides/#general\" aria-labelledby=\"header-general\" style=\"color: rgb(204, 204, 204); border-radius: 2px; word-break: break-word; background-image: inherit; background-position: inherit; background-size: inherit; background-repeat: inherit; background-attachment: inherit; background-origin: inherit; background-clip: inherit; padding: 0px 0.25em;\"></a></h2><ul style=\"color: rgb(51, 51, 51); font-family: &quot;Source Sans Pro&quot;, &quot;Open Sans&quot;, Roboto, &quot;San Francisco&quot;, Helvetica, Arial, sans-serif; font-size: 20px;\"><li><a href=\"https://nodejs.org/en/docs/guides/getting-started-guide/\" style=\"color: rgb(67, 133, 61); border-radius: 2px; word-break: break-word;\">Getting Started Guide</a></li><li><a href=\"https://nodejs.org/en/docs/guides/debugging-getting-started/\" style=\"color: rgb(67, 133, 61); border-radius: 2px; word-break: break-word;\">Debugging - Getting Started</a></li><li><a href=\"https://nodejs.org/en/docs/guides/simple-profiling/\" style=\"color: rgb(67, 133, 61); border-radius: 2px; word-break: break-word;\">Easy profiling for Node.js Applications</a></li><li><a href=\"https://nodejs.org/en/docs/guides/diagnostics-flamegraph/\" style=\"color: rgb(67, 133, 61); border-radius: 2px; word-break: break-word;\">Diagnostics - Flame Graphs</a></li><li><a href=\"https://nodejs.org/en/docs/guides/nodejs-docker-webapp/\" style=\"color: rgb(67, 133, 61); border-radius: 2px; word-break: break-word;\">Dockerizing a Node.js web app</a></li><li><a href=\"https://nodejs.org/en/docs/guides/buffer-constructor-deprecation/\" style=\"color: rgb(67, 133, 61); border-radius: 2px; word-break: break-word;\">Migrating to safe Buffer constructors</a></li></ul><h2 id=\"header-node-js-core-concepts\" style=\"color: rgb(51, 51, 51); font-family: &quot;Source Sans Pro&quot;, &quot;Open Sans&quot;, Roboto, &quot;San Francisco&quot;, Helvetica, Arial, sans-serif;\">Node.js core concepts<a id=\"node-js-core-concepts\" class=\"anchor\" href=\"https://nodejs.org/en/docs/guides/#node-js-core-concepts\" aria-labelledby=\"header-node-js-core-concepts\" style=\"color: rgb(204, 204, 204); border-radius: 2px; word-break: break-word; background-image: inherit; background-position: inherit; background-size: inherit; background-repeat: inherit; background-attachment: inherit; background-origin: inherit; background-clip: inherit; padding: 0px 0.25em;\"></a></h2><ul style=\"color: rgb(51, 51, 51); font-family: &quot;Source Sans Pro&quot;, &quot;Open Sans&quot;, Roboto, &quot;San Francisco&quot;, Helvetica, Arial, sans-serif; font-size: 20px;\"><li><a href=\"https://nodejs.org/en/docs/guides/blocking-vs-non-blocking/\" style=\"color: rgb(67, 133, 61); border-radius: 2px; word-break: break-word;\">Overview of Blocking vs Non-Blocking</a></li><li><a href=\"https://nodejs.org/en/docs/guides/event-loop-timers-and-nexttick/\" style=\"color: rgb(67, 133, 61); border-radius: 2px; word-break: break-word;\">The Node.js Event Loop, Timers, and&nbsp;<code style=\"background-color: rgb(240, 240, 240); font-size: 17px; padding: 0.2em;\">process.nextTick()</code></a></li><li><a href=\"https://nodejs.org/en/docs/guides/dont-block-the-event-loop/\" style=\"color: rgb(67, 133, 61); border-radius: 2px; word-break: break-word;\">Don\'t Block the Event Loop (or the Worker Pool)</a></li><li><a href=\"https://nodejs.org/en/docs/guides/timers-in-node/\" style=\"color: rgb(67, 133, 61); border-radius: 2px; word-break: break-word;\">Timers in Node.js</a></li></ul><h2 id=\"header-module-related-guides\" style=\"color: rgb(51, 51, 51); font-family: &quot;Source Sans Pro&quot;, &quot;Open Sans&quot;, Roboto, &quot;San Francisco&quot;, Helvetica, Arial, sans-serif;\">Module-related guides<a id=\"module-related-guides\" class=\"anchor\" href=\"https://nodejs.org/en/docs/guides/#module-related-guides\" aria-labelledby=\"header-module-related-guides\" style=\"color: rgb(204, 204, 204); border-radius: 2px; word-break: break-word; background-image: inherit; background-position: inherit; background-size: inherit; background-repeat: inherit; background-attachment: inherit; background-origin: inherit; background-clip: inherit; padding: 0px 0.25em;\"></a></h2><ul style=\"color: rgb(51, 51, 51); font-family: &quot;Source Sans Pro&quot;, &quot;Open Sans&quot;, Roboto, &quot;San Francisco&quot;, Helvetica, Arial, sans-serif; font-size: 20px;\"><li><a href=\"https://nodejs.org/en/docs/guides/anatomy-of-an-http-transaction/\" style=\"color: rgb(67, 133, 61); border-radius: 2px; word-break: break-word;\">Anatomy of an HTTP Transaction</a></li><li><a href=\"https://nodejs.org/en/docs/guides/working-with-different-filesystems/\" style=\"color: rgb(67, 133, 61); border-radius: 2px; word-break: break-word;\">Working with Different Filesystems</a></li><li><a href=\"https://nodejs.org/en/docs/guides/backpressuring-in-streams/\" style=\"color: rgb(67, 133, 61); border-radius: 2px; word-break: break-word;\">Backpressuring in Streams</a></li><li><a href=\"https://nodejs.org/en/docs/guides/domain-postmortem/\" style=\"color: rgb(67, 133, 61); border-radius: 2px; word-break: break-word;\">Domain Module Postmortem</a></li><li><a href=\"https://nodejs.org/en/docs/guides/publishing-napi-modules/\" style=\"color: rgb(67, 133, 61); border-radius: 2px; word-break: break-word;\">How to publish N-API package</a></li><li><a href=\"https://nodejs.org/en/docs/guides/abi-stability/\" style=\"color: rgb(67, 133, 61); border-radius: 2px; word-break: break-word;\">ABI Stability</a></li></ul>', NULL, NULL, '2020-02-04 04:29:52', '2020-02-04 04:29:52'),
(11, 4, 1, 'Security', '<h2 id=\"header-reporting-a-bug-in-node-js\" style=\"color: rgb(51, 51, 51); font-family: &quot;Source Sans Pro&quot;, &quot;Open Sans&quot;, Roboto, &quot;San Francisco&quot;, Helvetica, Arial, sans-serif;\">Reporting a Bug in Node.js<a id=\"reporting-a-bug-in-node-js\" class=\"anchor\" href=\"https://nodejs.org/en/security/#reporting-a-bug-in-node-js\" aria-labelledby=\"header-reporting-a-bug-in-node-js\" style=\"color: rgb(204, 204, 204); border-radius: 2px; word-break: break-word; background-image: inherit; background-position: inherit; background-size: inherit; background-repeat: inherit; background-attachment: inherit; background-origin: inherit; background-clip: inherit; padding: 0px 0.25em;\"></a></h2><p style=\"color: rgb(51, 51, 51); font-family: &quot;Source Sans Pro&quot;, &quot;Open Sans&quot;, Roboto, &quot;San Francisco&quot;, Helvetica, Arial, sans-serif; font-size: 20px; letter-spacing: normal;\">Report security bugs in Node.js via&nbsp;<a href=\"https://hackerone.com/nodejs\" style=\"color: rgb(67, 133, 61); border-radius: 2px; padding-right: 2px; padding-left: 2px; margin-right: -2px; margin-left: -2px; word-break: break-word;\">HackerOne</a>.</p><p style=\"color: rgb(51, 51, 51); font-family: &quot;Source Sans Pro&quot;, &quot;Open Sans&quot;, Roboto, &quot;San Francisco&quot;, Helvetica, Arial, sans-serif; font-size: 20px; letter-spacing: normal;\">Your report will be acknowledged within 24 hours, and you’ll receive a more detailed response to your report within 48 hours indicating the next steps in handling your submission.</p><p style=\"color: rgb(51, 51, 51); font-family: &quot;Source Sans Pro&quot;, &quot;Open Sans&quot;, Roboto, &quot;San Francisco&quot;, Helvetica, Arial, sans-serif; font-size: 20px; letter-spacing: normal;\">After the initial reply to your report, the security team will endeavor to keep you informed of the progress being made towards a fix and full announcement, and may ask for additional information or guidance surrounding the reported issue. These updates will be sent at least every five days; in practice, this is more likely to be every 24-48 hours.</p><h3 id=\"header-node-js-bug-bounty-program\" style=\"color: rgb(51, 51, 51); font-family: &quot;Source Sans Pro&quot;, &quot;Open Sans&quot;, Roboto, &quot;San Francisco&quot;, Helvetica, Arial, sans-serif;\">Node.js Bug Bounty Program<a id=\"node-js-bug-bounty-program\" class=\"anchor\" href=\"https://nodejs.org/en/security/#node-js-bug-bounty-program\" aria-labelledby=\"header-node-js-bug-bounty-program\" style=\"color: rgb(204, 204, 204); border-radius: 2px; word-break: break-word; background-image: inherit; background-position: inherit; background-size: inherit; background-repeat: inherit; background-attachment: inherit; background-origin: inherit; background-clip: inherit; padding: 0px 0.25em;\"></a></h3><p style=\"color: rgb(51, 51, 51); font-family: &quot;Source Sans Pro&quot;, &quot;Open Sans&quot;, Roboto, &quot;San Francisco&quot;, Helvetica, Arial, sans-serif; font-size: 20px; letter-spacing: normal;\">The Node.js project engages in an official bug bounty program for security researchers and responsible public disclosures. The program is managed through the HackerOne platform. See&nbsp;<a href=\"https://hackerone.com/nodejs\" style=\"color: rgb(67, 133, 61); border-radius: 2px; padding-right: 2px; padding-left: 2px; margin-right: -2px; margin-left: -2px; word-break: break-word;\">https://hackerone.com/nodejs</a>&nbsp;for further details.</p><h2 id=\"header-reporting-a-bug-in-a-third-party-module\" style=\"color: rgb(51, 51, 51); font-family: &quot;Source Sans Pro&quot;, &quot;Open Sans&quot;, Roboto, &quot;San Francisco&quot;, Helvetica, Arial, sans-serif;\">Reporting a Bug in a third party module<a id=\"reporting-a-bug-in-a-third-party-module\" class=\"anchor\" href=\"https://nodejs.org/en/security/#reporting-a-bug-in-a-third-party-module\" aria-labelledby=\"header-reporting-a-bug-in-a-third-party-module\" style=\"color: rgb(204, 204, 204); border-radius: 2px; word-break: break-word; background-image: inherit; background-position: inherit; background-size: inherit; background-repeat: inherit; background-attachment: inherit; background-origin: inherit; background-clip: inherit; padding: 0px 0.25em;\"></a></h2><p style=\"color: rgb(51, 51, 51); font-family: &quot;Source Sans Pro&quot;, &quot;Open Sans&quot;, Roboto, &quot;San Francisco&quot;, Helvetica, Arial, sans-serif; font-size: 20px; letter-spacing: normal;\">Security bugs in third party modules should be reported to their respective maintainers and should also be coordinated through the Node Ecosystem Security Team via&nbsp;<a href=\"https://hackerone.com/nodejs-ecosystem\" style=\"color: rgb(67, 133, 61); border-radius: 2px; padding-right: 2px; padding-left: 2px; margin-right: -2px; margin-left: -2px; word-break: break-word;\">HackerOne</a>.</p><p style=\"color: rgb(51, 51, 51); font-family: &quot;Source Sans Pro&quot;, &quot;Open Sans&quot;, Roboto, &quot;San Francisco&quot;, Helvetica, Arial, sans-serif; font-size: 20px; letter-spacing: normal;\">Details regarding this process can be found in the&nbsp;<a href=\"https://github.com/nodejs/security-wg/blob/master/processes/third_party_vuln_process.md\" style=\"color: rgb(67, 133, 61); border-radius: 2px; padding-right: 2px; padding-left: 2px; margin-right: -2px; margin-left: -2px; word-break: break-word;\">Security Working Group repository</a>.</p><p style=\"color: rgb(51, 51, 51); font-family: &quot;Source Sans Pro&quot;, &quot;Open Sans&quot;, Roboto, &quot;San Francisco&quot;, Helvetica, Arial, sans-serif; font-size: 20px; letter-spacing: normal;\">Thank you for improving the security of Node.js and its ecosystem. Your efforts and responsible disclosure are greatly appreciated and will be acknowledged.</p><div><br></div>', NULL, NULL, '2020-02-04 04:32:33', '2020-02-04 04:32:33'),
(12, 4, 1, 'Get Involved', '<div id=\"main\" style=\"display: flex; -webkit-box-flex: 1; flex: 1 0 auto; color: rgb(51, 51, 51); font-family: &quot;Source Sans Pro&quot;, &quot;Open Sans&quot;, Roboto, &quot;San Francisco&quot;, Helvetica, Arial, sans-serif; font-size: 20px;\"><div class=\"container has-side-nav\" style=\"width: 980px; max-width: 980px; margin-top: 0px; margin-bottom: 0px; overflow: hidden; padding: 0px 20px;\"><article style=\"margin-left: 220px;\"><h2 id=\"header-community-discussion\">Community Discussion<a id=\"community-discussion\" class=\"anchor\" href=\"https://nodejs.org/en/get-involved/#community-discussion\" aria-labelledby=\"header-community-discussion\" style=\"color: rgb(204, 204, 204); border-radius: 2px; word-break: break-word; background-image: inherit; background-position: inherit; background-size: inherit; background-repeat: inherit; background-attachment: inherit; background-origin: inherit; background-clip: inherit; padding: 0px 0.25em;\"></a></h2><ul><li>The&nbsp;<a href=\"https://github.com/nodejs/node/issues\" style=\"color: rgb(67, 133, 61); border-radius: 2px; word-break: break-word;\">GitHub issues list</a>&nbsp;is the place for discussion of Node.js core features.</li><li>For real-time chat about Node.js development go to&nbsp;<code style=\"background-color: rgb(240, 240, 240); font-size: 17px; padding: 0.2em;\">irc.freenode.net</code>&nbsp;in the&nbsp;<code style=\"background-color: rgb(240, 240, 240); font-size: 17px; padding: 0.2em;\">#node.js</code>&nbsp;channel with an&nbsp;<a href=\"https://en.wikipedia.org/wiki/Comparison_of_Internet_Relay_Chat_clients\" style=\"color: rgb(67, 133, 61); border-radius: 2px; word-break: break-word;\">IRC client</a>&nbsp;or connect in your web browser to the channel using&nbsp;<a href=\"https://webchat.freenode.net/#node.js\" style=\"color: rgb(67, 133, 61); border-radius: 2px; word-break: break-word;\">freenode\'s WebChat</a>.</li><li>The official Node.js Twitter account is&nbsp;<a href=\"https://twitter.com/nodejs\" style=\"color: rgb(67, 133, 61); border-radius: 2px; word-break: break-word;\">nodejs</a>.</li><li>The&nbsp;<a href=\"https://nodejs.org/calendar\" style=\"color: rgb(67, 133, 61); border-radius: 2px; word-break: break-word;\">Node.js Foundation calendar</a>&nbsp;with all public team meetings.</li><li><a href=\"https://newsletter.nodejs.org/\" style=\"color: rgb(67, 133, 61); border-radius: 2px; word-break: break-word;\">Node.js Everywhere</a>&nbsp;is the official Node.js Monthly Newsletter.</li><li><a href=\"https://medium.com/the-node-js-collection\" style=\"color: rgb(67, 133, 61); border-radius: 2px; word-break: break-word;\">Node.js Collection</a>&nbsp;is a collection of community-curated content on Medium.</li><li>The&nbsp;<a href=\"https://github.com/nodejs/community-committee\" style=\"color: rgb(67, 133, 61); border-radius: 2px; word-break: break-word;\">Community Committee</a>&nbsp;is a top-level committee in the Node.js Foundation focused on community-facing efforts.</li><li><a href=\"https://www.nodeslackers.com/\" style=\"color: rgb(67, 133, 61); border-radius: 2px; word-break: break-word;\">Node Slackers</a>&nbsp;is a Node.js-focused Slack community.</li></ul><h2 id=\"header-learning\">Learning<a id=\"learning\" class=\"anchor\" href=\"https://nodejs.org/en/get-involved/#learning\" aria-labelledby=\"header-learning\" style=\"color: rgb(204, 204, 204); border-radius: 2px; word-break: break-word; background-image: inherit; background-position: inherit; background-size: inherit; background-repeat: inherit; background-attachment: inherit; background-origin: inherit; background-clip: inherit; padding: 0px 0.25em;\"></a></h2><ul><li><a href=\"https://nodejs.org/api/\" style=\"color: rgb(67, 133, 61); border-radius: 2px; word-break: break-word;\">Official API reference documentation</a>&nbsp;details the Node.js API.</li><li><a href=\"https://nodeschool.io/\" style=\"color: rgb(67, 133, 61); border-radius: 2px; word-break: break-word;\">NodeSchool.io</a>&nbsp;will teach you Node.js concepts via interactive command-line games.</li><li><a href=\"https://stackoverflow.com/questions/tagged/node.js\" style=\"color: rgb(67, 133, 61); border-radius: 2px; word-break: break-word;\">Stack Overflow Node.js tag</a>&nbsp;collects new information every day.</li><li><a href=\"https://dev.to/t/node\" style=\"color: rgb(67, 133, 61); border-radius: 2px; word-break: break-word;\">The DEV Community Node.js tag</a>&nbsp;is a place to share Node.js projects, articles and tutorials as well as start discussions and ask for feedback on Node.js-related topics. Developers of all skill-levels are welcome to take part.</li><li><a href=\"https://discordapp.com/invite/vUsrbjd\" style=\"color: rgb(67, 133, 61); border-radius: 2px; word-break: break-word;\">Nodeiflux</a>&nbsp;is a friendly community of Node.js backend developers supporting each other on Discord.</li></ul><h2 id=\"header-international-community-sites-and-projects\">International community sites and projects<a id=\"international-community-sites-and-projects\" class=\"anchor\" href=\"https://nodejs.org/en/get-involved/#international-community-sites-and-projects\" aria-labelledby=\"header-international-community-sites-and-projects\" style=\"color: rgb(204, 204, 204); border-radius: 2px; word-break: break-word; background-image: inherit; background-position: inherit; background-size: inherit; background-repeat: inherit; background-attachment: inherit; background-origin: inherit; background-clip: inherit; padding: 0px 0.25em;\"></a></h2><ul><li><a href=\"https://cnodejs.org/\" style=\"color: rgb(67, 133, 61); border-radius: 2px; word-break: break-word;\">Chinese community</a></li><li><a href=\"https://nodehun.blogspot.com/\" style=\"color: rgb(67, 133, 61); border-radius: 2px; word-break: break-word;\">Hungarian (Magyar) community</a></li><li><a href=\"https://www.facebook.com/groups/node.il/\" style=\"color: rgb(67, 133, 61); border-radius: 2px; word-break: break-word;\">Israeli Facebook group for Node.js</a></li><li><a href=\"https://nodejs.jp/\" style=\"color: rgb(67, 133, 61); border-radius: 2px; word-break: break-word;\">Japanese user group</a></li><li><a href=\"https://www.facebook.com/groups/node.es/\" style=\"color: rgb(67, 133, 61); border-radius: 2px; word-break: break-word;\">Spanish language Facebook group for Node.js</a></li><li><a href=\"https://www.facebook.com/nodejs.vn/\" style=\"color: rgb(67, 133, 61); border-radius: 2px; word-break: break-word;\">Vietnamese Node.js community</a></li></ul></article></div></div><a href=\"https://nodejs.org/en/get-involved/#\" id=\"scroll-to-top\" style=\"color: rgb(51, 51, 51); border-radius: 2px; font-size: 1rem; background-color: rgb(240, 240, 240); border: 1px solid rgb(204, 204, 204); position: fixed; bottom: 65.6875px; right: 0px; min-width: 20px; text-align: center; padding: 0px 5px 1px; opacity: 0; animation: 0.5s ease 1s 1 normal forwards running buttonFade; font-family: &quot;Source Sans Pro&quot;, &quot;Open Sans&quot;, Roboto, &quot;San Francisco&quot;, Helvetica, Arial, sans-serif; display: block;\">↑&nbsp;Scroll to top</a><footer style=\"display: flex; flex-shrink: 0; padding: 0px; margin-top: 2em; background-color: rgb(51, 51, 51); color: rgb(51, 51, 51); font-family: &quot;Source Sans Pro&quot;, &quot;Open Sans&quot;, Roboto, &quot;San Francisco&quot;, Helvetica, Arial, sans-serif; font-size: 20px;\"><div class=\"container\" style=\"width: 980px; max-width: 980px; margin-top: 0px; margin-bottom: 0px; overflow: hidden;\"><div class=\"openjsfoundation-footer\" style=\"padding: 1em 20px; font-size: 14px; color: rgb(255, 255, 255); background-image: initial; background-position: initial; background-size: initial; background-repeat: initial; background-attachment: initial; background-origin: initial; background-clip: initial; direction: ltr;\"><div class=\"issue-link-container\" style=\"display: flex; -webkit-box-align: center; align-items: center;\"><a class=\"openjsfoundation-logo\" href=\"https://openjsf.org/\" style=\"color: rgb(204, 204, 204); border-radius: 2px;\"></a></div></div></div></footer>', NULL, NULL, '2020-02-04 04:45:16', '2020-02-04 04:45:16');
INSERT INTO `vipscapl_knowledge_base_article` (`id`, `category_id`, `user_id`, `article_title`, `description`, `file_name`, `deleted_at`, `created_at`, `updated_at`) VALUES
(13, 5, 1, 'Docs', '<header class=\"css-hgc6lu\" style=\"margin: 0px; padding: 0px; box-sizing: inherit; display: flex; -webkit-box-orient: horizontal; -webkit-box-direction: normal; flex-direction: row; flex: 0 1 auto; -webkit-box-pack: justify; justify-content: space-between; -webkit-box-align: baseline; align-items: baseline; color: rgb(0, 0, 0); font-family: -apple-system, BlinkMacSystemFont, &quot;Segoe UI&quot;, Roboto, Oxygen, Ubuntu, Cantarell, &quot;Fira Sans&quot;, &quot;Droid Sans&quot;, &quot;Helvetica Neue&quot;, sans-serif; font-size: medium;\"><h1 class=\"css-1rwyxsf\" style=\"margin: 80px 0px 0px; padding: 0px; box-sizing: inherit; font-size: 60px; color: rgb(40, 44, 52); line-height: 65px; font-weight: 700;\">Getting Started</h1></header><div class=\"css-124oy3v\" style=\"margin: 50px 0px 120px; padding: 0px; box-sizing: inherit; color: rgb(0, 0, 0); font-family: -apple-system, BlinkMacSystemFont, &quot;Segoe UI&quot;, Roboto, Oxygen, Ubuntu, Cantarell, &quot;Fira Sans&quot;, &quot;Droid Sans&quot;, &quot;Helvetica Neue&quot;, sans-serif; font-size: medium;\"><div class=\"css-15weewl\" style=\"margin: 0px; padding: 0px; box-sizing: inherit; line-height: 25px;\"><p style=\"margin-right: 0px; margin-left: 0px; padding: 0px; box-sizing: inherit; font-size: 24px; line-height: 1.7; max-width: 42em; color: rgb(109, 109, 109);\">This page is an overview of the React documentation and related resources.</p><p style=\"margin-top: 30px; margin-right: 0px; margin-left: 0px; padding: 0px; box-sizing: inherit; font-size: 17px; line-height: 1.7; max-width: 42em;\"><span style=\"margin: 0px; padding: 0px; box-sizing: inherit; font-weight: bolder;\">React</span>&nbsp;is a JavaScript library for building user interfaces. Learn what React is all about on&nbsp;<a href=\"https://reactjs.org/\" style=\"margin: 0px; padding: 0px; box-sizing: inherit; background-color: rgba(187, 239, 253, 0.3); color: rgb(26, 26, 26); border-bottom: 1px solid rgba(0, 0, 0, 0.2);\">our homepage</a>&nbsp;or&nbsp;<a href=\"https://reactjs.org/tutorial/tutorial.html\" style=\"margin: 0px; padding: 0px; box-sizing: inherit; background-color: rgba(187, 239, 253, 0.3); color: rgb(26, 26, 26); border-bottom: 1px solid rgba(0, 0, 0, 0.2);\">in the tutorial</a>.</p><hr style=\"margin: 40px 0px -1px; padding: 0px; height: 1px; border-top: none; border-right: none; border-left: none; border-bottom: 1px solid rgb(236, 236, 236);\"><ul style=\"margin: 20px 0px 0px; padding: 0px 0px 0px 20px; box-sizing: inherit; list-style-position: initial; list-style-image: initial; font-size: 16px; color: rgb(26, 26, 26);\"><li style=\"margin: 10px 0px 0px; padding: 0px; box-sizing: inherit;\"><a href=\"https://reactjs.org/docs/getting-started.html#try-react\" style=\"margin: 0px; padding: 0px; box-sizing: inherit; background-color: rgba(187, 239, 253, 0.3); color: rgb(26, 26, 26); border-bottom: 1px solid rgba(0, 0, 0, 0.2);\">Try React</a></li><li style=\"margin: 10px 0px 0px; padding: 0px; box-sizing: inherit;\"><a href=\"https://reactjs.org/docs/getting-started.html#learn-react\" style=\"margin: 0px; padding: 0px; box-sizing: inherit; background-color: rgba(187, 239, 253, 0.3); color: rgb(26, 26, 26); border-bottom: 1px solid rgba(0, 0, 0, 0.2);\">Learn React</a></li><li style=\"margin: 10px 0px 0px; padding: 0px; box-sizing: inherit;\"><a href=\"https://reactjs.org/docs/getting-started.html#staying-informed\" style=\"margin: 0px; padding: 0px; box-sizing: inherit; background-color: rgba(187, 239, 253, 0.3); color: rgb(26, 26, 26); border-bottom: 1px solid rgba(0, 0, 0, 0.2);\">Staying Informed</a></li><li style=\"margin: 10px 0px 0px; padding: 0px; box-sizing: inherit;\"><a href=\"https://reactjs.org/docs/getting-started.html#versioned-documentation\" style=\"margin: 0px; padding: 0px; box-sizing: inherit; background-color: rgba(187, 239, 253, 0.3); color: rgb(26, 26, 26); border-bottom: 1px solid rgba(0, 0, 0, 0.2);\">Versioned Documentation</a></li><li style=\"margin: 10px 0px 0px; padding: 0px; box-sizing: inherit;\"><a href=\"https://reactjs.org/docs/getting-started.html#something-missing\" style=\"margin: 0px; padding: 0px; box-sizing: inherit; background-color: rgba(187, 239, 253, 0.3); color: rgb(26, 26, 26); border-bottom: 1px solid rgba(0, 0, 0, 0.2);\">Something Missing?</a></li></ul><h2 id=\"try-react\" style=\"margin-right: 0px; margin-bottom: 0px; margin-left: 0px; padding: 0px; box-sizing: inherit; line-height: 1.2; font-size: 35px;\"><a href=\"https://reactjs.org/docs/getting-started.html#try-react\" aria-hidden=\"true\" class=\"anchor\" style=\"margin: 0px 0px 0px -20px; padding: 0px 4px 0px 0px; box-sizing: inherit; color: inherit; float: left;\"><svg aria-hidden=\"true\" height=\"16\" version=\"1.1\" viewBox=\"0 0 16 16\" width=\"16\"><path fill-rule=\"evenodd\" d=\"M4 9h1v1H4c-1.5 0-3-1.69-3-3.5S2.55 3 4 3h4c1.45 0 3 1.69 3 3.5 0 1.41-.91 2.72-2 3.25V8.59c.58-.45 1-1.27 1-2.09C10 5.22 8.98 4 8 4H4c-.98 0-2 1.22-2 2.5S3 9 4 9zm9-3h-1v1h1c1 0 2 1.22 2 2.5S13.98 12 13 12H9c-.98 0-2-1.22-2-2.5 0-.83.42-1.64 1-2.09V6.25c-1.09.53-2 1.84-2 3.25C6 11.31 7.55 13 9 13h4c1.45 0 3-1.69 3-3.5S14.5 6 13 6z\"></path></svg></a>Try React</h2><p style=\"margin-top: 30px; margin-right: 0px; margin-left: 0px; padding: 0px; box-sizing: inherit; font-size: 17px; line-height: 1.7; max-width: 42em;\">React has been designed from the start for gradual adoption, and&nbsp;<span style=\"margin: 0px; padding: 0px; box-sizing: inherit; font-weight: bolder;\">you can use as little or as much React as you need.</span>&nbsp;Whether you want to get a taste of React, add some interactivity to a simple HTML page, or start a complex React-powered app, the links in this section will help you get started.</p><h3 id=\"online-playgrounds\" style=\"margin-right: 0px; margin-bottom: 0px; margin-left: 0px; padding: 0px; box-sizing: inherit; font-size: 25px; line-height: 1.3;\"><a href=\"https://reactjs.org/docs/getting-started.html#online-playgrounds\" aria-hidden=\"true\" class=\"anchor\" style=\"margin: 0px 0px 0px -20px; padding: 0px 4px 0px 0px; box-sizing: inherit; color: inherit; float: left;\"><svg aria-hidden=\"true\" height=\"16\" version=\"1.1\" viewBox=\"0 0 16 16\" width=\"16\"><path fill-rule=\"evenodd\" d=\"M4 9h1v1H4c-1.5 0-3-1.69-3-3.5S2.55 3 4 3h4c1.45 0 3 1.69 3 3.5 0 1.41-.91 2.72-2 3.25V8.59c.58-.45 1-1.27 1-2.09C10 5.22 8.98 4 8 4H4c-.98 0-2 1.22-2 2.5S3 9 4 9zm9-3h-1v1h1c1 0 2 1.22 2 2.5S13.98 12 13 12H9c-.98 0-2-1.22-2-2.5 0-.83.42-1.64 1-2.09V6.25c-1.09.53-2 1.84-2 3.25C6 11.31 7.55 13 9 13h4c1.45 0 3-1.69 3-3.5S14.5 6 13 6z\"></path></svg></a>Online Playgrounds</h3><p style=\"margin-top: 20px; margin-right: 0px; margin-left: 0px; padding: 0px; box-sizing: inherit; font-size: 17px; line-height: 1.7; max-width: 42em;\">If you’re interested in playing around with React, you can use an online code playground. Try a Hello World template on&nbsp;<a href=\"https://reactjs.org/redirect-to-codepen/hello-world\" target=\"_blank\" rel=\"noreferrer\" style=\"margin: 0px; padding: 0px; box-sizing: inherit; background-color: rgba(187, 239, 253, 0.3); color: rgb(26, 26, 26); border-bottom: 1px solid rgba(0, 0, 0, 0.2);\">CodePen</a>,&nbsp;<a href=\"https://codesandbox.io/s/new\" target=\"_blank\" rel=\"nofollow noopener noreferrer\" style=\"margin: 0px; padding: 0px; box-sizing: inherit; background-color: rgba(187, 239, 253, 0.3); color: rgb(26, 26, 26); border-bottom: 1px solid rgba(0, 0, 0, 0.2);\">CodeSandbox</a>, or&nbsp;<a href=\"https://glitch.com/edit/#!/remix/starter-react-template\" target=\"_blank\" rel=\"nofollow noopener noreferrer\" style=\"margin: 0px; padding: 0px; box-sizing: inherit; background-color: rgba(187, 239, 253, 0.3); color: rgb(26, 26, 26); border-bottom: 1px solid rgba(0, 0, 0, 0.2);\">Glitch</a>.</p><p style=\"margin-top: 30px; margin-right: 0px; margin-left: 0px; padding: 0px; box-sizing: inherit; font-size: 17px; line-height: 1.7; max-width: 42em;\">If you prefer to use your own text editor, you can also&nbsp;<a href=\"https://raw.githubusercontent.com/reactjs/reactjs.org/master/static/html/single-file-example.html\" target=\"_blank\" rel=\"nofollow noopener noreferrer\" style=\"margin: 0px; padding: 0px; box-sizing: inherit; background-color: rgba(187, 239, 253, 0.3); color: rgb(26, 26, 26); border-bottom: 1px solid rgba(0, 0, 0, 0.2);\">download this HTML file</a>, edit it, and open it from the local filesystem in your browser. It does a slow runtime code transformation, so we’d only recommend using this for simple demos.</p><h3 id=\"add-react-to-a-website\" style=\"margin-right: 0px; margin-bottom: 0px; margin-left: 0px; padding: 0px; box-sizing: inherit; font-size: 25px; line-height: 1.3;\"><a href=\"https://reactjs.org/docs/getting-started.html#add-react-to-a-website\" aria-hidden=\"true\" class=\"anchor\" style=\"margin: 0px 0px 0px -20px; padding: 0px 4px 0px 0px; box-sizing: inherit; color: inherit; float: left;\"><svg aria-hidden=\"true\" height=\"16\" version=\"1.1\" viewBox=\"0 0 16 16\" width=\"16\"><path fill-rule=\"evenodd\" d=\"M4 9h1v1H4c-1.5 0-3-1.69-3-3.5S2.55 3 4 3h4c1.45 0 3 1.69 3 3.5 0 1.41-.91 2.72-2 3.25V8.59c.58-.45 1-1.27 1-2.09C10 5.22 8.98 4 8 4H4c-.98 0-2 1.22-2 2.5S3 9 4 9zm9-3h-1v1h1c1 0 2 1.22 2 2.5S13.98 12 13 12H9c-.98 0-2-1.22-2-2.5 0-.83.42-1.64 1-2.09V6.25c-1.09.53-2 1.84-2 3.25C6 11.31 7.55 13 9 13h4c1.45 0 3-1.69 3-3.5S14.5 6 13 6z\"></path></svg></a>Add React to a Website</h3><p style=\"margin-top: 20px; margin-right: 0px; margin-left: 0px; padding: 0px; box-sizing: inherit; font-size: 17px; line-height: 1.7; max-width: 42em;\">You can&nbsp;<a href=\"https://reactjs.org/docs/add-react-to-a-website.html\" style=\"margin: 0px; padding: 0px; box-sizing: inherit; background-color: rgba(187, 239, 253, 0.3); color: rgb(26, 26, 26); border-bottom: 1px solid rgba(0, 0, 0, 0.2);\">add React to an HTML page in one minute</a>. You can then either gradually expand its presence, or keep it contained to a few dynamic widgets.</p><h3 id=\"create-a-new-react-app\" style=\"margin-right: 0px; margin-bottom: 0px; margin-left: 0px; padding: 0px; box-sizing: inherit; font-size: 25px; line-height: 1.3;\"><a href=\"https://reactjs.org/docs/getting-started.html#create-a-new-react-app\" aria-hidden=\"true\" class=\"anchor\" style=\"margin: 0px 0px 0px -20px; padding: 0px 4px 0px 0px; box-sizing: inherit; color: inherit; float: left;\"><svg aria-hidden=\"true\" height=\"16\" version=\"1.1\" viewBox=\"0 0 16 16\" width=\"16\"><path fill-rule=\"evenodd\" d=\"M4 9h1v1H4c-1.5 0-3-1.69-3-3.5S2.55 3 4 3h4c1.45 0 3 1.69 3 3.5 0 1.41-.91 2.72-2 3.25V8.59c.58-.45 1-1.27 1-2.09C10 5.22 8.98 4 8 4H4c-.98 0-2 1.22-2 2.5S3 9 4 9zm9-3h-1v1h1c1 0 2 1.22 2 2.5S13.98 12 13 12H9c-.98 0-2-1.22-2-2.5 0-.83.42-1.64 1-2.09V6.25c-1.09.53-2 1.84-2 3.25C6 11.31 7.55 13 9 13h4c1.45 0 3-1.69 3-3.5S14.5 6 13 6z\"></path></svg></a>Create a New React App</h3><p style=\"margin-top: 20px; margin-right: 0px; margin-left: 0px; padding: 0px; box-sizing: inherit; font-size: 17px; line-height: 1.7; max-width: 42em;\">When starting a React project, a&nbsp;<a href=\"https://reactjs.org/docs/add-react-to-a-website.html\" style=\"margin: 0px; padding: 0px; box-sizing: inherit; background-color: rgba(187, 239, 253, 0.3); color: rgb(26, 26, 26); border-bottom: 1px solid rgba(0, 0, 0, 0.2);\">simple HTML page with script tags</a>&nbsp;might still be the best option. It only takes a minute to set up!</p><p style=\"margin-top: 30px; margin-right: 0px; margin-left: 0px; padding: 0px; box-sizing: inherit; font-size: 17px; line-height: 1.7; max-width: 42em;\">As your application grows, you might want to consider a more integrated setup. There are several JavaScript toolchains we recommend for larger applications. Each of them can work with little to no configuration and lets you take full advantage of the rich React ecosystem.&nbsp;<a href=\"https://reactjs.org/docs/create-a-new-react-app.html\" style=\"margin: 0px; padding: 0px; box-sizing: inherit; background-color: rgba(187, 239, 253, 0.3); color: rgb(26, 26, 26); border-bottom: 1px solid rgba(0, 0, 0, 0.2);\">Learn how.</a></p><h2 id=\"learn-react\" style=\"margin-right: 0px; margin-bottom: 0px; margin-left: 0px; padding: 0px; box-sizing: inherit; line-height: 1.2; font-size: 35px;\"><a href=\"https://reactjs.org/docs/getting-started.html#learn-react\" aria-hidden=\"true\" class=\"anchor\" style=\"margin: 0px 0px 0px -20px; padding: 0px 4px 0px 0px; box-sizing: inherit; color: inherit; float: left;\"><svg aria-hidden=\"true\" height=\"16\" version=\"1.1\" viewBox=\"0 0 16 16\" width=\"16\"><path fill-rule=\"evenodd\" d=\"M4 9h1v1H4c-1.5 0-3-1.69-3-3.5S2.55 3 4 3h4c1.45 0 3 1.69 3 3.5 0 1.41-.91 2.72-2 3.25V8.59c.58-.45 1-1.27 1-2.09C10 5.22 8.98 4 8 4H4c-.98 0-2 1.22-2 2.5S3 9 4 9zm9-3h-1v1h1c1 0 2 1.22 2 2.5S13.98 12 13 12H9c-.98 0-2-1.22-2-2.5 0-.83.42-1.64 1-2.09V6.25c-1.09.53-2 1.84-2 3.25C6 11.31 7.55 13 9 13h4c1.45 0 3-1.69 3-3.5S14.5 6 13 6z\"></path></svg></a>Learn React</h2><p style=\"margin-top: 30px; margin-right: 0px; margin-left: 0px; padding: 0px; box-sizing: inherit; font-size: 17px; line-height: 1.7; max-width: 42em;\">People come to React from different backgrounds and with different learning styles. Whether you prefer a more theoretical or a practical approach, we hope you’ll find this section helpful.</p><ul style=\"margin: 20px 0px 0px; padding: 0px 0px 0px 20px; box-sizing: inherit; list-style-position: initial; list-style-image: initial; font-size: 16px; color: rgb(26, 26, 26);\"><li style=\"margin: 10px 0px 0px; padding: 0px; box-sizing: inherit;\">If you prefer to&nbsp;<span style=\"margin: 0px; padding: 0px; box-sizing: inherit; font-weight: bolder;\">learn by doing</span>, start with our&nbsp;<a href=\"https://reactjs.org/tutorial/tutorial.html\" style=\"margin: 0px; padding: 0px; box-sizing: inherit; background-color: rgba(187, 239, 253, 0.3); color: rgb(26, 26, 26); border-bottom: 1px solid rgba(0, 0, 0, 0.2);\">practical tutorial</a>.</li><li style=\"margin: 10px 0px 0px; padding: 0px; box-sizing: inherit;\">If you prefer to&nbsp;<span style=\"margin: 0px; padding: 0px; box-sizing: inherit; font-weight: bolder;\">learn concepts step by step</span>, start with our&nbsp;<a href=\"https://reactjs.org/docs/hello-world.html\" style=\"margin: 0px; padding: 0px; box-sizing: inherit; background-color: rgba(187, 239, 253, 0.3); color: rgb(26, 26, 26); border-bottom: 1px solid rgba(0, 0, 0, 0.2);\">guide to main concepts</a>.</li></ul><p style=\"margin-top: 30px; margin-right: 0px; margin-left: 0px; padding: 0px; box-sizing: inherit; font-size: 17px; line-height: 1.7; max-width: 42em;\">Like any unfamiliar technology, React does have a learning curve. With practice and some patience, you&nbsp;<em style=\"margin: 0px; padding: 0px; box-sizing: inherit;\">will</em>&nbsp;get the hang of it.</p><h3 id=\"first-examples\" style=\"margin-right: 0px; margin-bottom: 0px; margin-left: 0px; padding: 0px; box-sizing: inherit; font-size: 25px; line-height: 1.3;\"><a href=\"https://reactjs.org/docs/getting-started.html#first-examples\" aria-hidden=\"true\" class=\"anchor\" style=\"margin: 0px 0px 0px -20px; padding: 0px 4px 0px 0px; box-sizing: inherit; color: inherit; float: left;\"><svg aria-hidden=\"true\" height=\"16\" version=\"1.1\" viewBox=\"0 0 16 16\" width=\"16\"><path fill-rule=\"evenodd\" d=\"M4 9h1v1H4c-1.5 0-3-1.69-3-3.5S2.55 3 4 3h4c1.45 0 3 1.69 3 3.5 0 1.41-.91 2.72-2 3.25V8.59c.58-.45 1-1.27 1-2.09C10 5.22 8.98 4 8 4H4c-.98 0-2 1.22-2 2.5S3 9 4 9zm9-3h-1v1h1c1 0 2 1.22 2 2.5S13.98 12 13 12H9c-.98 0-2-1.22-2-2.5 0-.83.42-1.64 1-2.09V6.25c-1.09.53-2 1.84-2 3.25C6 11.31 7.55 13 9 13h4c1.45 0 3-1.69 3-3.5S14.5 6 13 6z\"></path></svg></a>First Examples</h3><p style=\"margin-top: 20px; margin-right: 0px; margin-left: 0px; padding: 0px; box-sizing: inherit; font-size: 17px; line-height: 1.7; max-width: 42em;\">The&nbsp;<a href=\"https://reactjs.org/\" style=\"margin: 0px; padding: 0px; box-sizing: inherit; background-color: rgba(187, 239, 253, 0.3); color: rgb(26, 26, 26); border-bottom: 1px solid rgba(0, 0, 0, 0.2);\">React homepage</a>&nbsp;contains a few small React examples with a live editor. Even if you don’t know anything about React yet, try changing their code and see how it affects the result.</p><h3 id=\"react-for-beginners\" style=\"margin-right: 0px; margin-bottom: 0px; margin-left: 0px; padding: 0px; box-sizing: inherit; font-size: 25px; line-height: 1.3;\"><a href=\"https://reactjs.org/docs/getting-started.html#react-for-beginners\" aria-hidden=\"true\" class=\"anchor\" style=\"margin: 0px 0px 0px -20px; padding: 0px 4px 0px 0px; box-sizing: inherit; color: inherit; float: left;\"><svg aria-hidden=\"true\" height=\"16\" version=\"1.1\" viewBox=\"0 0 16 16\" width=\"16\"><path fill-rule=\"evenodd\" d=\"M4 9h1v1H4c-1.5 0-3-1.69-3-3.5S2.55 3 4 3h4c1.45 0 3 1.69 3 3.5 0 1.41-.91 2.72-2 3.25V8.59c.58-.45 1-1.27 1-2.09C10 5.22 8.98 4 8 4H4c-.98 0-2 1.22-2 2.5S3 9 4 9zm9-3h-1v1h1c1 0 2 1.22 2 2.5S13.98 12 13 12H9c-.98 0-2-1.22-2-2.5 0-.83.42-1.64 1-2.09V6.25c-1.09.53-2 1.84-2 3.25C6 11.31 7.55 13 9 13h4c1.45 0 3-1.69 3-3.5S14.5 6 13 6z\"></path></svg></a>React for Beginners</h3><p style=\"margin-top: 20px; margin-right: 0px; margin-left: 0px; padding: 0px; box-sizing: inherit; font-size: 17px; line-height: 1.7; max-width: 42em;\">If you feel that the React documentation goes at a faster pace than you’re comfortable with, check out&nbsp;<a href=\"https://www.taniarascia.com/getting-started-with-react/\" target=\"_blank\" rel=\"nofollow noopener noreferrer\" style=\"margin: 0px; padding: 0px; box-sizing: inherit; background-color: rgba(187, 239, 253, 0.3); color: rgb(26, 26, 26); border-bottom: 1px solid rgba(0, 0, 0, 0.2);\">this overview of React by Tania Rascia</a>. It introduces the most important React concepts in a detailed, beginner-friendly way. Once you’re done, give the documentation another try!</p><h3 id=\"react-for-designers\" style=\"margin-right: 0px; margin-bottom: 0px; margin-left: 0px; padding: 0px; box-sizing: inherit; font-size: 25px; line-height: 1.3;\"><a href=\"https://reactjs.org/docs/getting-started.html#react-for-designers\" aria-hidden=\"true\" class=\"anchor\" style=\"margin: 0px 0px 0px -20px; padding: 0px 4px 0px 0px; box-sizing: inherit; color: inherit; float: left;\"><svg aria-hidden=\"true\" height=\"16\" version=\"1.1\" viewBox=\"0 0 16 16\" width=\"16\"><path fill-rule=\"evenodd\" d=\"M4 9h1v1H4c-1.5 0-3-1.69-3-3.5S2.55 3 4 3h4c1.45 0 3 1.69 3 3.5 0 1.41-.91 2.72-2 3.25V8.59c.58-.45 1-1.27 1-2.09C10 5.22 8.98 4 8 4H4c-.98 0-2 1.22-2 2.5S3 9 4 9zm9-3h-1v1h1c1 0 2 1.22 2 2.5S13.98 12 13 12H9c-.98 0-2-1.22-2-2.5 0-.83.42-1.64 1-2.09V6.25c-1.09.53-2 1.84-2 3.25C6 11.31 7.55 13 9 13h4c1.45 0 3-1.69 3-3.5S14.5 6 13 6z\"></path></svg></a>React for Designers</h3><p style=\"margin-top: 20px; margin-right: 0px; margin-left: 0px; padding: 0px; box-sizing: inherit; font-size: 17px; line-height: 1.7; max-width: 42em;\">If you’re coming from a design background,&nbsp;<a href=\"https://reactfordesigners.com/\" target=\"_blank\" rel=\"nofollow noopener noreferrer\" style=\"margin: 0px; padding: 0px; box-sizing: inherit; background-color: rgba(187, 239, 253, 0.3); color: rgb(26, 26, 26); border-bottom: 1px solid rgba(0, 0, 0, 0.2);\">these resources</a>&nbsp;are a great place to get started.</p><h3 id=\"javascript-resources\" style=\"margin-right: 0px; margin-bottom: 0px; margin-left: 0px; padding: 0px; box-sizing: inherit; font-size: 25px; line-height: 1.3;\"><a href=\"https://reactjs.org/docs/getting-started.html#javascript-resources\" aria-hidden=\"true\" class=\"anchor\" style=\"margin: 0px 0px 0px -20px; padding: 0px 4px 0px 0px; box-sizing: inherit; color: inherit; float: left;\"><svg aria-hidden=\"true\" height=\"16\" version=\"1.1\" viewBox=\"0 0 16 16\" width=\"16\"><path fill-rule=\"evenodd\" d=\"M4 9h1v1H4c-1.5 0-3-1.69-3-3.5S2.55 3 4 3h4c1.45 0 3 1.69 3 3.5 0 1.41-.91 2.72-2 3.25V8.59c.58-.45 1-1.27 1-2.09C10 5.22 8.98 4 8 4H4c-.98 0-2 1.22-2 2.5S3 9 4 9zm9-3h-1v1h1c1 0 2 1.22 2 2.5S13.98 12 13 12H9c-.98 0-2-1.22-2-2.5 0-.83.42-1.64 1-2.09V6.25c-1.09.53-2 1.84-2 3.25C6 11.31 7.55 13 9 13h4c1.45 0 3-1.69 3-3.5S14.5 6 13 6z\"></path></svg></a>JavaScript Resources</h3><p style=\"margin-top: 20px; margin-right: 0px; margin-left: 0px; padding: 0px; box-sizing: inherit; font-size: 17px; line-height: 1.7; max-width: 42em;\">The React documentation assumes some familiarity with programming in the JavaScript language. You don’t have to be an expert, but it’s harder to learn both React and JavaScript at the same time.</p><p style=\"margin-top: 30px; margin-right: 0px; margin-left: 0px; padding: 0px; box-sizing: inherit; font-size: 17px; line-height: 1.7; max-width: 42em;\">We recommend going through&nbsp;<a href=\"https://developer.mozilla.org/en-US/docs/Web/JavaScript/A_re-introduction_to_JavaScript\" target=\"_blank\" rel=\"nofollow noopener noreferrer\" style=\"margin: 0px; padding: 0px; box-sizing: inherit; background-color: rgba(187, 239, 253, 0.3); color: rgb(26, 26, 26); border-bottom: 1px solid rgba(0, 0, 0, 0.2);\">this JavaScript overview</a>&nbsp;to check your knowledge level. It will take you between 30 minutes and an hour but you will feel more confident learning React.</p><blockquote style=\"margin: 20px -30px 30px; padding: 20px 45px 20px 26px; box-sizing: inherit; background-color: rgba(255, 229, 100, 0.3); border-left-width: 9px; border-left-color: rgb(255, 229, 100);\"><p style=\"margin-right: 0px; margin-left: 0px; padding: 0px; box-sizing: inherit; font-size: 17px; line-height: 1.7; max-width: 42em; font-weight: 700;\">Tip</p><p style=\"margin-right: 0px; margin-left: 0px; padding: 0px; box-sizing: inherit; font-size: 17px; line-height: 1.7; max-width: 42em;\">Whenever you get confused by something in JavaScript,&nbsp;<a href=\"https://developer.mozilla.org/en-US/docs/Web/JavaScript\" target=\"_blank\" rel=\"nofollow noopener noreferrer\" style=\"margin: 0px; padding: 0px; box-sizing: inherit; background-color: rgba(187, 239, 253, 0.3); color: rgb(26, 26, 26); border-bottom: 1px solid rgba(0, 0, 0, 0.2);\">MDN</a>&nbsp;and&nbsp;<a href=\"https://javascript.info/\" target=\"_blank\" rel=\"nofollow noopener noreferrer\" style=\"margin: 0px; padding: 0px; box-sizing: inherit; background-color: rgba(187, 239, 253, 0.3); color: rgb(26, 26, 26); border-bottom: 1px solid rgba(0, 0, 0, 0.2);\">javascript.info</a>&nbsp;are great websites to check. There are also&nbsp;<a href=\"https://reactjs.org/community/support.html\" style=\"margin: 0px; padding: 0px; box-sizing: inherit; background-color: rgba(187, 239, 253, 0.3); color: rgb(26, 26, 26); border-bottom: 1px solid rgba(0, 0, 0, 0.2);\">community support forums</a>&nbsp;where you can ask for help.</p></blockquote></div></div>', NULL, NULL, '2020-02-04 04:54:54', '2020-02-04 04:54:54'),
(14, 5, 1, 'Load Data Incrementally', '<header class=\"css-hgc6lu\" style=\"margin: 0px; padding: 0px; box-sizing: inherit; display: flex; -webkit-box-orient: horizontal; -webkit-box-direction: normal; flex-direction: row; flex: 0 1 auto; -webkit-box-pack: justify; justify-content: space-between; -webkit-box-align: baseline; align-items: baseline; color: rgb(0, 0, 0); font-family: -apple-system, BlinkMacSystemFont, &quot;Segoe UI&quot;, Roboto, Oxygen, Ubuntu, Cantarell, &quot;Fira Sans&quot;, &quot;Droid Sans&quot;, &quot;Helvetica Neue&quot;, sans-serif; font-size: medium;\"><h1 class=\"css-1rwyxsf\" style=\"margin: 80px 0px 0px; padding: 0px; box-sizing: inherit; font-size: 60px; color: rgb(40, 44, 52); line-height: 65px; font-weight: 700;\">Where To Get Support</h1></header><div class=\"css-124oy3v\" style=\"margin: 50px 0px 120px; padding: 0px; box-sizing: inherit; color: rgb(0, 0, 0); font-family: -apple-system, BlinkMacSystemFont, &quot;Segoe UI&quot;, Roboto, Oxygen, Ubuntu, Cantarell, &quot;Fira Sans&quot;, &quot;Droid Sans&quot;, &quot;Helvetica Neue&quot;, sans-serif; font-size: medium;\"><div class=\"css-15weewl\" style=\"margin: 0px; padding: 0px; box-sizing: inherit; line-height: 25px;\"><p style=\"margin-right: 0px; margin-left: 0px; padding: 0px; box-sizing: inherit; font-size: 24px; line-height: 1.7; max-width: 42em; color: rgb(109, 109, 109);\">React has a community of millions of developers.</p><p style=\"margin-top: 30px; margin-right: 0px; margin-left: 0px; padding: 0px; box-sizing: inherit; font-size: 17px; line-height: 1.7; max-width: 42em;\">On this page we’ve listed some React-related communities that you can be a part of; see the other pages in this section for additional online and in-person learning materials.</p><p style=\"margin-top: 30px; margin-right: 0px; margin-left: 0px; padding: 0px; box-sizing: inherit; font-size: 17px; line-height: 1.7; max-width: 42em;\">Before participating in React’s communities,&nbsp;<a href=\"https://github.com/facebook/react/blob/master/CODE_OF_CONDUCT.md\" target=\"_blank\" rel=\"nofollow noopener noreferrer\" style=\"margin: 0px; padding: 0px; box-sizing: inherit; background-color: rgba(187, 239, 253, 0.3); color: rgb(26, 26, 26); border-bottom: 1px solid rgba(0, 0, 0, 0.2);\">please read our Code of Conduct</a>. We have adopted the&nbsp;<a href=\"https://www.contributor-covenant.org/\" target=\"_blank\" rel=\"nofollow noopener noreferrer\" style=\"margin: 0px; padding: 0px; box-sizing: inherit; background-color: rgba(187, 239, 253, 0.3); color: rgb(26, 26, 26); border-bottom: 1px solid rgba(0, 0, 0, 0.2);\">Contributor Covenant</a>&nbsp;and we expect that all community members adhere to the guidelines within.</p><h2 id=\"stack-overflow\" style=\"margin-right: 0px; margin-bottom: 0px; margin-left: 0px; padding: 0px; box-sizing: inherit; line-height: 1.2; font-size: 35px;\"><a href=\"https://reactjs.org/community/support.html#stack-overflow\" aria-hidden=\"true\" class=\"anchor\" style=\"margin: 0px 0px 0px -20px; padding: 0px 4px 0px 0px; box-sizing: inherit; color: inherit; float: left;\"><svg aria-hidden=\"true\" height=\"16\" version=\"1.1\" viewBox=\"0 0 16 16\" width=\"16\"><path fill-rule=\"evenodd\" d=\"M4 9h1v1H4c-1.5 0-3-1.69-3-3.5S2.55 3 4 3h4c1.45 0 3 1.69 3 3.5 0 1.41-.91 2.72-2 3.25V8.59c.58-.45 1-1.27 1-2.09C10 5.22 8.98 4 8 4H4c-.98 0-2 1.22-2 2.5S3 9 4 9zm9-3h-1v1h1c1 0 2 1.22 2 2.5S13.98 12 13 12H9c-.98 0-2-1.22-2-2.5 0-.83.42-1.64 1-2.09V6.25c-1.09.53-2 1.84-2 3.25C6 11.31 7.55 13 9 13h4c1.45 0 3-1.69 3-3.5S14.5 6 13 6z\"></path></svg></a>Stack Overflow</h2><p style=\"margin-top: 30px; margin-right: 0px; margin-left: 0px; padding: 0px; box-sizing: inherit; font-size: 17px; line-height: 1.7; max-width: 42em;\">Stack Overflow is a popular forum to ask code-level questions or if you’re stuck with a specific error. Read through the&nbsp;<a href=\"https://stackoverflow.com/questions/tagged/reactjs\" target=\"_blank\" rel=\"nofollow noopener noreferrer\" style=\"margin: 0px; padding: 0px; box-sizing: inherit; background-color: rgba(187, 239, 253, 0.3); color: rgb(26, 26, 26); border-bottom: 1px solid rgba(0, 0, 0, 0.2);\">existing questions</a>&nbsp;tagged with&nbsp;<span style=\"margin: 0px; padding: 0px; box-sizing: inherit; font-weight: bolder;\">reactjs</span>&nbsp;or&nbsp;<a href=\"https://stackoverflow.com/questions/ask?tags=reactjs\" target=\"_blank\" rel=\"nofollow noopener noreferrer\" style=\"margin: 0px; padding: 0px; box-sizing: inherit; background-color: rgba(187, 239, 253, 0.3); color: rgb(26, 26, 26); border-bottom: 1px solid rgba(0, 0, 0, 0.2);\">ask your own</a>!</p><h2 id=\"popular-discussion-forums\" style=\"margin-right: 0px; margin-bottom: 0px; margin-left: 0px; padding: 0px; box-sizing: inherit; line-height: 1.2; font-size: 35px;\"><a href=\"https://reactjs.org/community/support.html#popular-discussion-forums\" aria-hidden=\"true\" class=\"anchor\" style=\"margin: 0px 0px 0px -20px; padding: 0px 4px 0px 0px; box-sizing: inherit; color: inherit; float: left;\"><svg aria-hidden=\"true\" height=\"16\" version=\"1.1\" viewBox=\"0 0 16 16\" width=\"16\"><path fill-rule=\"evenodd\" d=\"M4 9h1v1H4c-1.5 0-3-1.69-3-3.5S2.55 3 4 3h4c1.45 0 3 1.69 3 3.5 0 1.41-.91 2.72-2 3.25V8.59c.58-.45 1-1.27 1-2.09C10 5.22 8.98 4 8 4H4c-.98 0-2 1.22-2 2.5S3 9 4 9zm9-3h-1v1h1c1 0 2 1.22 2 2.5S13.98 12 13 12H9c-.98 0-2-1.22-2-2.5 0-.83.42-1.64 1-2.09V6.25c-1.09.53-2 1.84-2 3.25C6 11.31 7.55 13 9 13h4c1.45 0 3-1.69 3-3.5S14.5 6 13 6z\"></path></svg></a>Popular Discussion Forums</h2><p style=\"margin-top: 30px; margin-right: 0px; margin-left: 0px; padding: 0px; box-sizing: inherit; font-size: 17px; line-height: 1.7; max-width: 42em;\">There are many online forums which are a great place for discussion about best practices and application architecture as well as the future of React. If you have an answerable code-level question, Stack Overflow is usually a better fit.</p><p style=\"margin-top: 30px; margin-right: 0px; margin-left: 0px; padding: 0px; box-sizing: inherit; font-size: 17px; line-height: 1.7; max-width: 42em;\">Each community consists of many thousands of React users.</p><ul style=\"margin: 20px 0px 0px; padding: 0px 0px 0px 20px; box-sizing: inherit; list-style-position: initial; list-style-image: initial; font-size: 16px; color: rgb(26, 26, 26);\"><li style=\"margin: 10px 0px 0px; padding: 0px; box-sizing: inherit;\"><a href=\"https://dev.to/t/react\" target=\"_blank\" rel=\"nofollow noopener noreferrer\" style=\"margin: 0px; padding: 0px; box-sizing: inherit; background-color: rgba(187, 239, 253, 0.3); color: rgb(26, 26, 26); border-bottom: 1px solid rgba(0, 0, 0, 0.2);\">DEV’s React community</a></li><li style=\"margin: 10px 0px 0px; padding: 0px; box-sizing: inherit;\"><a href=\"https://hashnode.com/n/reactjs\" target=\"_blank\" rel=\"nofollow noopener noreferrer\" style=\"margin: 0px; padding: 0px; box-sizing: inherit; background-color: rgba(187, 239, 253, 0.3); color: rgb(26, 26, 26); border-bottom: 1px solid rgba(0, 0, 0, 0.2);\">Hashnode’s React community</a></li><li style=\"margin: 10px 0px 0px; padding: 0px; box-sizing: inherit;\"><a href=\"https://discord.gg/reactiflux\" target=\"_blank\" rel=\"nofollow noopener noreferrer\" style=\"margin: 0px; padding: 0px; box-sizing: inherit; background-color: rgba(187, 239, 253, 0.3); color: rgb(26, 26, 26); border-bottom: 1px solid rgba(0, 0, 0, 0.2);\">Reactiflux online chat</a></li><li style=\"margin: 10px 0px 0px; padding: 0px; box-sizing: inherit;\"><a href=\"https://www.reddit.com/r/reactjs/\" target=\"_blank\" rel=\"nofollow noopener noreferrer\" style=\"margin: 0px; padding: 0px; box-sizing: inherit; background-color: rgba(187, 239, 253, 0.3); color: rgb(26, 26, 26); border-bottom: 1px solid rgba(0, 0, 0, 0.2);\">Reddit’s React community</a></li><li style=\"margin: 10px 0px 0px; padding: 0px; box-sizing: inherit;\"><a href=\"https://spectrum.chat/react\" target=\"_blank\" rel=\"nofollow noopener noreferrer\" style=\"margin: 0px; padding: 0px; box-sizing: inherit; background-color: rgba(187, 239, 253, 0.3); color: rgb(26, 26, 26); border-bottom: 1px solid rgba(0, 0, 0, 0.2);\">Spectrum’s React community</a></li><li></li></ul><h2 id=\"news\" style=\"margin-right: 0px; margin-bottom: 0px; margin-left: 0px; padding: 0px; box-sizing: inherit; line-height: 1.2; font-size: 35px;\"><a href=\"https://reactjs.org/community/support.html#news\" aria-hidden=\"true\" class=\"anchor\" style=\"margin: 0px 0px 0px -20px; padding: 0px 4px 0px 0px; box-sizing: inherit; color: inherit; float: left;\"><svg aria-hidden=\"true\" height=\"16\" version=\"1.1\" viewBox=\"0 0 16 16\" width=\"16\"><path fill-rule=\"evenodd\" d=\"M4 9h1v1H4c-1.5 0-3-1.69-3-3.5S2.55 3 4 3h4c1.45 0 3 1.69 3 3.5 0 1.41-.91 2.72-2 3.25V8.59c.58-.45 1-1.27 1-2.09C10 5.22 8.98 4 8 4H4c-.98 0-2 1.22-2 2.5S3 9 4 9zm9-3h-1v1h1c1 0 2 1.22 2 2.5S13.98 12 13 12H9c-.98 0-2-1.22-2-2.5 0-.83.42-1.64 1-2.09V6.25c-1.09.53-2 1.84-2 3.25C6 11.31 7.55 13 9 13h4c1.45 0 3-1.69 3-3.5S14.5 6 13 6z\"></path></svg></a></h2></div></div>', NULL, NULL, '2020-02-04 04:56:07', '2020-02-04 04:56:07');
INSERT INTO `vipscapl_knowledge_base_article` (`id`, `category_id`, `user_id`, `article_title`, `description`, `file_name`, `deleted_at`, `created_at`, `updated_at`) VALUES
(15, 5, 1, 'Downloads', '<h1 style=\"border: none; margin: 10px 0px; padding: 0px; font-family: proxima-nova, &quot;Helvetica Neue&quot;, Helvetica, Roboto, Arial, sans-serif; font-weight: bold; line-height: 40px; color: rgb(72, 72, 72); text-rendering: optimizelegibility; font-size: 39px; background-color: rgb(249, 249, 249);\">Downloads</h1><div class=\"subHeader\" style=\"border: none; margin: 0px 0px 10px; padding: 0px; font-size: 24px; line-height: 30px; color: rgb(72, 72, 72); font-family: proxima-nova, &quot;Helvetica Neue&quot;, Helvetica, Roboto, Arial, sans-serif; background-color: rgb(249, 249, 249);\"></div><p style=\"border: none; margin: 10px 0px; padding: 0px; color: rgb(72, 72, 72); font-family: proxima-nova, &quot;Helvetica Neue&quot;, Helvetica, Roboto, Arial, sans-serif; font-size: medium; letter-spacing: normal; background-color: rgb(249, 249, 249);\">Download the starter kit to get everything you need to&nbsp;<a href=\"https://react-cn.github.io/react/docs/getting-started.html\" style=\"border: none; margin: 0px; padding: 0px; color: rgb(192, 91, 77);\">get started with React</a>. The starter kit includes React and some simple example apps.</p><div class=\"buttons-unit downloads\" style=\"border: none; margin: 30px 0px; padding: 0px; text-align: center; color: rgb(72, 72, 72); font-family: proxima-nova, &quot;Helvetica Neue&quot;, Helvetica, Roboto, Arial, sans-serif; font-size: medium; background-color: rgb(249, 249, 249);\"><a href=\"https://react-cn.github.io/react/downloads/react-0.14.3.zip\" class=\"button\" style=\"border: none; margin: 0px 12px; padding: 8px 16px; color: rgb(250, 250, 250); background: rgb(204, 122, 111); border-radius: 4px; font-size: 24px; display: inline-block; text-shadow: rgba(0, 0, 0, 0.3) 0px 1px 3px; box-shadow: rgba(0, 0, 0, 0.2) 0px 1px 1px;\">Download Starter Kit 0.14.3</a></div><h2 style=\"border: none; margin: 30px 0px 10px; padding: 0px; font-family: proxima-nova, &quot;Helvetica Neue&quot;, Helvetica, Roboto, Arial, sans-serif; font-weight: bold; line-height: 40px; color: rgb(72, 72, 72); text-rendering: optimizelegibility; font-size: 31px; background-color: rgb(249, 249, 249);\"><a class=\"anchor\" name=\"development-vs.-production-builds\" style=\"border: none; margin: -50px 0px 0px; padding: 0px; color: rgb(192, 91, 77); position: absolute;\"></a>Development vs. Production Builds</h2><p style=\"border: none; margin: 10px 0px; padding: 0px; color: rgb(72, 72, 72); font-family: proxima-nova, &quot;Helvetica Neue&quot;, Helvetica, Roboto, Arial, sans-serif; font-size: medium; letter-spacing: normal; background-color: rgb(249, 249, 249);\">We provide two versions of React: an uncompressed version for development and a minified version for production. The development version includes extra warnings about common mistakes, whereas the production version includes extra performance optimizations and strips all error messages.</p><p style=\"border: none; margin: 10px 0px; padding: 0px; color: rgb(72, 72, 72); font-family: proxima-nova, &quot;Helvetica Neue&quot;, Helvetica, Roboto, Arial, sans-serif; font-size: medium; letter-spacing: normal; background-color: rgb(249, 249, 249);\">If you\'re just starting out, make sure to use the development version.</p><h2 style=\"border: none; margin: 30px 0px 10px; padding: 0px; font-family: proxima-nova, &quot;Helvetica Neue&quot;, Helvetica, Roboto, Arial, sans-serif; font-weight: bold; line-height: 40px; color: rgb(72, 72, 72); text-rendering: optimizelegibility; font-size: 31px; background-color: rgb(249, 249, 249);\"><a class=\"anchor\" name=\"individual-downloads\" style=\"border: none; margin: -50px 0px 0px; padding: 0px; color: rgb(192, 91, 77); position: absolute;\"></a>Individual Downloads</h2><h4 style=\"border: none; margin: 10px 0px; padding: 0px; font-family: proxima-nova, &quot;Helvetica Neue&quot;, Helvetica, Roboto, Arial, sans-serif; font-weight: bold; line-height: 20px; color: rgb(72, 72, 72); text-rendering: optimizelegibility; font-size: medium; background-color: rgb(249, 249, 249);\"><a class=\"anchor\" name=\"react-0.14.3-development\" style=\"border: none; margin: -50px 0px 0px; padding: 0px; color: rgb(192, 91, 77); position: absolute;\"></a>React 0.14.3 (development)</h4><p style=\"border: none; margin: 10px 0px; padding: 0px; color: rgb(72, 72, 72); font-family: proxima-nova, &quot;Helvetica Neue&quot;, Helvetica, Roboto, Arial, sans-serif; font-size: medium; letter-spacing: normal; background-color: rgb(249, 249, 249);\">The uncompressed, development version of&nbsp;<a href=\"https://fb.me/react-0.14.3.js\" style=\"border: none; margin: 0px; padding: 0px; color: rgb(192, 91, 77);\">react.js</a>&nbsp;and&nbsp;<a href=\"https://fb.me/react-dom-0.14.3.js\" style=\"border: none; margin: 0px; padding: 0px; color: rgb(192, 91, 77);\">react-dom.js</a>&nbsp;with inline documentation (you need both files).</p><div class=\"highlight\" style=\"border: none; margin: 0px 0px 14px; padding: 30px 14px 14px; color: rgb(51, 51, 51); background: rgb(248, 245, 236); position: relative; border-radius: 0px; overflow: auto; font-family: proxima-nova, &quot;Helvetica Neue&quot;, Helvetica, Roboto, Arial, sans-serif; font-size: medium;\"><pre style=\"border: 0px; margin-bottom: 0px; padding: 0px; background-color: transparent;\"><code class=\"language-html\" data-lang=\"html\" style=\"border: none; margin: 0px; padding: 0px; font-family: source-code-pro, Menlo, Consolas, &quot;Courier New&quot;, monospace; font-size: 13px; line-height: 1.5; color: rgb(99, 124, 132); display: block; background: none;\"><span class=\"nt\" style=\"border: none; margin: 0px; padding: 0px; color: rgb(38, 139, 210);\">&lt;script </span><span class=\"na\" style=\"border: none; margin: 0px; padding: 0px;\">src=</span><span class=\"s\" style=\"border: none; margin: 0px; padding: 0px; color: rgb(54, 149, 142);\">\"https://fb.me/react-0.14.3.js\"</span><span class=\"nt\" style=\"border: none; margin: 0px; padding: 0px; color: rgb(38, 139, 210);\">&gt;&lt;/script&gt;</span>\n<span class=\"nt\" style=\"border: none; margin: 0px; padding: 0px; color: rgb(38, 139, 210);\">&lt;script </span><span class=\"na\" style=\"border: none; margin: 0px; padding: 0px;\">src=</span><span class=\"s\" style=\"border: none; margin: 0px; padding: 0px; color: rgb(54, 149, 142);\">\"https://fb.me/react-dom-0.14.3.js\"</span><span class=\"nt\" style=\"border: none; margin: 0px; padding: 0px; color: rgb(38, 139, 210);\">&gt;&lt;/script&gt;</span>\n</code></pre></div><h4 style=\"border: none; margin: 10px 0px; padding: 0px; font-family: proxima-nova, &quot;Helvetica Neue&quot;, Helvetica, Roboto, Arial, sans-serif; font-weight: bold; line-height: 20px; color: rgb(72, 72, 72); text-rendering: optimizelegibility; font-size: medium; background-color: rgb(249, 249, 249);\"><a class=\"anchor\" name=\"react-0.14.3-production\" style=\"border: none; margin: -50px 0px 0px; padding: 0px; color: rgb(192, 91, 77); position: absolute;\"></a>React 0.14.3 (production)</h4><p style=\"border: none; margin: 10px 0px; padding: 0px; color: rgb(72, 72, 72); font-family: proxima-nova, &quot;Helvetica Neue&quot;, Helvetica, Roboto, Arial, sans-serif; font-size: medium; letter-spacing: normal; background-color: rgb(249, 249, 249);\">The compressed, production version of&nbsp;<a href=\"https://fb.me/react-0.14.3.min.js\" style=\"border: none; margin: 0px; padding: 0px; color: rgb(192, 91, 77);\">react.js</a>&nbsp;and&nbsp;<a href=\"https://fb.me/react-dom-0.14.3.min.js\" style=\"border: none; margin: 0px; padding: 0px; color: rgb(192, 91, 77);\">react-dom.js</a>&nbsp;(you need both).</p><div class=\"highlight\" style=\"border: none; margin: 0px 0px 14px; padding: 30px 14px 14px; color: rgb(51, 51, 51); background: rgb(248, 245, 236); position: relative; border-radius: 0px; overflow: auto; font-family: proxima-nova, &quot;Helvetica Neue&quot;, Helvetica, Roboto, Arial, sans-serif; font-size: medium;\"><pre style=\"border: 0px; margin-bottom: 0px; padding: 0px; background-color: transparent;\"><code class=\"language-html\" data-lang=\"html\" style=\"border: none; margin: 0px; padding: 0px; font-family: source-code-pro, Menlo, Consolas, &quot;Courier New&quot;, monospace; font-size: 13px; line-height: 1.5; color: rgb(99, 124, 132); display: block; background: none;\"><span class=\"nt\" style=\"border: none; margin: 0px; padding: 0px; color: rgb(38, 139, 210);\">&lt;script </span><span class=\"na\" style=\"border: none; margin: 0px; padding: 0px;\">src=</span><span class=\"s\" style=\"border: none; margin: 0px; padding: 0px; color: rgb(54, 149, 142);\">\"https://fb.me/react-0.14.3.min.js\"</span><span class=\"nt\" style=\"border: none; margin: 0px; padding: 0px; color: rgb(38, 139, 210);\">&gt;&lt;/script&gt;</span>\n<span class=\"nt\" style=\"border: none; margin: 0px; padding: 0px; color: rgb(38, 139, 210);\">&lt;script </span><span class=\"na\" style=\"border: none; margin: 0px; padding: 0px;\">src=</span><span class=\"s\" style=\"border: none; margin: 0px; padding: 0px; color: rgb(54, 149, 142);\">\"https://fb.me/react-dom-0.14.3.min.js\"</span><span class=\"nt\" style=\"border: none; margin: 0px; padding: 0px; color: rgb(38, 139, 210);\">&gt;&lt;/script&gt;</span>\n</code></pre></div><h4 style=\"border: none; margin: 10px 0px; padding: 0px; font-family: proxima-nova, &quot;Helvetica Neue&quot;, Helvetica, Roboto, Arial, sans-serif; font-weight: bold; line-height: 20px; color: rgb(72, 72, 72); text-rendering: optimizelegibility; font-size: medium; background-color: rgb(249, 249, 249);\"><a class=\"anchor\" name=\"react-with-add-ons-0.14.3-development\" style=\"border: none; margin: -50px 0px 0px; padding: 0px; color: rgb(192, 91, 77); position: absolute;\"></a>React with Add-Ons 0.14.3 (development)</h4><p style=\"border: none; margin: 10px 0px; padding: 0px; color: rgb(72, 72, 72); font-family: proxima-nova, &quot;Helvetica Neue&quot;, Helvetica, Roboto, Arial, sans-serif; font-size: medium; letter-spacing: normal; background-color: rgb(249, 249, 249);\">The uncompressed, development version of React with&nbsp;<a href=\"https://react-cn.github.io/react/docs/addons.html\" style=\"border: none; margin: 0px; padding: 0px; color: rgb(192, 91, 77);\">optional add-ons</a>.</p><div class=\"highlight\" style=\"border: none; margin: 0px 0px 14px; padding: 30px 14px 14px; color: rgb(51, 51, 51); background: rgb(248, 245, 236); position: relative; border-radius: 0px; overflow: auto; font-family: proxima-nova, &quot;Helvetica Neue&quot;, Helvetica, Roboto, Arial, sans-serif; font-size: medium;\"><pre style=\"border: 0px; margin-bottom: 0px; padding: 0px; background-color: transparent;\"><code class=\"language-html\" data-lang=\"html\" style=\"border: none; margin: 0px; padding: 0px; font-family: source-code-pro, Menlo, Consolas, &quot;Courier New&quot;, monospace; font-size: 13px; line-height: 1.5; color: rgb(99, 124, 132); display: block; background: none;\"><span class=\"nt\" style=\"border: none; margin: 0px; padding: 0px; color: rgb(38, 139, 210);\">&lt;script </span><span class=\"na\" style=\"border: none; margin: 0px; padding: 0px;\">src=</span><span class=\"s\" style=\"border: none; margin: 0px; padding: 0px; color: rgb(54, 149, 142);\">\"https://fb.me/react-with-addons-0.14.3.js\"</span><span class=\"nt\" style=\"border: none; margin: 0px; padding: 0px; color: rgb(38, 139, 210);\">&gt;&lt;/script&gt;</span>\n<span class=\"nt\" style=\"border: none; margin: 0px; padding: 0px; color: rgb(38, 139, 210);\">&lt;script </span><span class=\"na\" style=\"border: none; margin: 0px; padding: 0px;\">src=</span><span class=\"s\" style=\"border: none; margin: 0px; padding: 0px; color: rgb(54, 149, 142);\">\"https://fb.me/react-dom-0.14.3.js\"</span><span class=\"nt\" style=\"border: none; margin: 0px; padding: 0px; color: rgb(38, 139, 210);\">&gt;&lt;/script&gt;</span>\n</code></pre></div><h4 style=\"border: none; margin: 10px 0px; padding: 0px; font-family: proxima-nova, &quot;Helvetica Neue&quot;, Helvetica, Roboto, Arial, sans-serif; font-weight: bold; line-height: 20px; color: rgb(72, 72, 72); text-rendering: optimizelegibility; font-size: medium; background-color: rgb(249, 249, 249);\"><a class=\"anchor\" name=\"react-with-add-ons-0.14.3-production\" style=\"border: none; margin: -50px 0px 0px; padding: 0px; color: rgb(192, 91, 77); position: absolute;\"></a>React with Add-Ons 0.14.3 (production)</h4><p style=\"border: none; margin: 10px 0px; padding: 0px; color: rgb(72, 72, 72); font-family: proxima-nova, &quot;Helvetica Neue&quot;, Helvetica, Roboto, Arial, sans-serif; font-size: medium; letter-spacing: normal; background-color: rgb(249, 249, 249);\">The compressed, production version of React with&nbsp;<a href=\"https://react-cn.github.io/react/docs/addons.html\" style=\"border: none; margin: 0px; padding: 0px; color: rgb(192, 91, 77);\">optional add-ons</a>.</p><div class=\"highlight\" style=\"border: none; margin: 0px 0px 14px; padding: 30px 14px 14px; color: rgb(51, 51, 51); background: rgb(248, 245, 236); position: relative; border-radius: 0px; overflow: auto; font-family: proxima-nova, &quot;Helvetica Neue&quot;, Helvetica, Roboto, Arial, sans-serif; font-size: medium;\"><pre style=\"border: 0px; margin-bottom: 0px; padding: 0px; background-color: transparent;\"><code class=\"language-html\" data-lang=\"html\" style=\"border: none; margin: 0px; padding: 0px; font-family: source-code-pro, Menlo, Consolas, &quot;Courier New&quot;, monospace; font-size: 13px; line-height: 1.5; color: rgb(99, 124, 132); display: block; background: none;\"><span class=\"nt\" style=\"border: none; margin: 0px; padding: 0px; color: rgb(38, 139, 210);\">&lt;script </span><span class=\"na\" style=\"border: none; margin: 0px; padding: 0px;\">src=</span><span class=\"s\" style=\"border: none; margin: 0px; padding: 0px; color: rgb(54, 149, 142);\">\"https://fb.me/react-with-addons-0.14.3.min.js\"</span><span class=\"nt\" style=\"border: none; margin: 0px; padding: 0px; color: rgb(38, 139, 210);\">&gt;&lt;/script&gt;</span>\n<span class=\"nt\" style=\"border: none; margin: 0px; padding: 0px; color: rgb(38, 139, 210);\">&lt;script </span><span class=\"na\" style=\"border: none; margin: 0px; padding: 0px;\">src=</span><span class=\"s\" style=\"border: none; margin: 0px; padding: 0px; color: rgb(54, 149, 142);\">\"https://fb.me/react-dom-0.14.3.min.js\"</span><span class=\"nt\" style=\"border: none; margin: 0px; padding: 0px; color: rgb(38, 139, 210);\">&gt;&lt;/script&gt;</span>\n</code></pre></div><p style=\"border: none; margin: 10px 0px; padding: 0px; color: rgb(72, 72, 72); font-family: proxima-nova, &quot;Helvetica Neue&quot;, Helvetica, Roboto, Arial, sans-serif; font-size: medium; letter-spacing: normal; background-color: rgb(249, 249, 249);\">All scripts are also available via&nbsp;<a href=\"https://cdnjs.com/libraries/react/\" style=\"border: none; margin: 0px; padding: 0px; color: rgb(192, 91, 77);\">CDNJS</a>.</p><h2 style=\"border: none; margin: 30px 0px 10px; padding: 0px; font-family: proxima-nova, &quot;Helvetica Neue&quot;, Helvetica, Roboto, Arial, sans-serif; font-weight: bold; line-height: 40px; color: rgb(72, 72, 72); text-rendering: optimizelegibility; font-size: 31px; background-color: rgb(249, 249, 249);\"><a class=\"anchor\" name=\"npm\" style=\"border: none; margin: -50px 0px 0px; padding: 0px; color: rgb(192, 91, 77); position: absolute;\"></a>npm</h2><p style=\"border: none; margin: 10px 0px; padding: 0px; color: rgb(72, 72, 72); font-family: proxima-nova, &quot;Helvetica Neue&quot;, Helvetica, Roboto, Arial, sans-serif; font-size: medium; letter-spacing: normal; background-color: rgb(249, 249, 249);\">We recommend using React from npm with a bundler like&nbsp;<a href=\"http://browserify.org/\" style=\"border: none; margin: 0px; padding: 0px; color: rgb(192, 91, 77);\">browserify</a>&nbsp;or&nbsp;<a href=\"https://webpack.github.io/\" style=\"border: none; margin: 0px; padding: 0px; color: rgb(192, 91, 77);\">webpack</a>. You can use the&nbsp;<code style=\"border: none; margin: 0px; padding: 1px 3px; font-family: source-code-pro, Menlo, Consolas, &quot;Courier New&quot;, monospace; font-size: 13px; line-height: 1.5; color: rgb(85, 85, 85); background-color: rgba(0, 0, 0, 0.04);\">react</code>&nbsp;and&nbsp;<code style=\"border: none; margin: 0px; padding: 1px 3px; font-family: source-code-pro, Menlo, Consolas, &quot;Courier New&quot;, monospace; font-size: 13px; line-height: 1.5; color: rgb(85, 85, 85); background-color: rgba(0, 0, 0, 0.04);\">react-dom</code>&nbsp;packages. After installing it using&nbsp;<code style=\"border: none; margin: 0px; padding: 1px 3px; font-family: source-code-pro, Menlo, Consolas, &quot;Courier New&quot;, monospace; font-size: 13px; line-height: 1.5; color: rgb(85, 85, 85); background-color: rgba(0, 0, 0, 0.04);\">npm install --save react react-dom</code>, you can use:</p><div class=\"highlight\" style=\"border: none; margin: 0px 0px 14px; padding: 30px 14px 14px; color: rgb(51, 51, 51); background: rgb(248, 245, 236); position: relative; border-radius: 0px; overflow: auto; font-family: proxima-nova, &quot;Helvetica Neue&quot;, Helvetica, Roboto, Arial, sans-serif; font-size: medium;\"><pre style=\"border: 0px; margin-bottom: 0px; padding: 0px; background-color: transparent;\"><code class=\"language-js\" data-lang=\"js\" style=\"border: none; margin: 0px; padding: 0px; font-family: source-code-pro, Menlo, Consolas, &quot;Courier New&quot;, monospace; font-size: 13px; line-height: 1.5; color: rgb(99, 124, 132); display: block; background: none;\"><span class=\"kd\" style=\"border: none; margin: 0px; padding: 0px; color: rgb(38, 139, 210);\">var</span> <span class=\"nx\" style=\"border: none; margin: 0px; padding: 0px;\">React</span> <span class=\"o\" style=\"border: none; margin: 0px; padding: 0px; color: rgb(133, 153, 0);\">=</span> <span class=\"nx\" style=\"border: none; margin: 0px; padding: 0px;\">require</span><span class=\"p\" style=\"border: none; margin: 0px; padding: 0px;\">(</span><span class=\"s1\" style=\"border: none; margin: 0px; padding: 0px; color: rgb(54, 149, 142);\">\'react\'</span><span class=\"p\" style=\"border: none; margin: 0px; padding: 0px;\">);</span>\n<span class=\"kd\" style=\"border: none; margin: 0px; padding: 0px; color: rgb(38, 139, 210);\">var</span> <span class=\"nx\" style=\"border: none; margin: 0px; padding: 0px;\">ReactDOM</span> <span class=\"o\" style=\"border: none; margin: 0px; padding: 0px; color: rgb(133, 153, 0);\">=</span> <span class=\"nx\" style=\"border: none; margin: 0px; padding: 0px;\">require</span><span class=\"p\" style=\"border: none; margin: 0px; padding: 0px;\">(</span><span class=\"s1\" style=\"border: none; margin: 0px; padding: 0px; color: rgb(54, 149, 142);\">\'react-dom\'</span><span class=\"p\" style=\"border: none; margin: 0px; padding: 0px;\">);</span>\n<span class=\"nx\" style=\"border: none; margin: 0px; padding: 0px;\">ReactDOM</span><span class=\"p\" style=\"border: none; margin: 0px; padding: 0px;\">.</span><span class=\"nx\" style=\"border: none; margin: 0px; padding: 0px;\">render</span><span class=\"p\" style=\"border: none; margin: 0px; padding: 0px;\">(</span><span class=\"o\" style=\"border: none; margin: 0px; padding: 0px; color: rgb(133, 153, 0);\">&lt;</span><span class=\"nx\" style=\"border: none; margin: 0px; padding: 0px;\">App</span> <span class=\"o\" style=\"border: none; margin: 0px; padding: 0px; color: rgb(133, 153, 0);\">/&gt;</span><span class=\"p\" style=\"border: none; margin: 0px; padding: 0px;\">,</span> <span class=\"p\" style=\"border: none; margin: 0px; padding: 0px;\">...);</span>\n</code></pre></div><p style=\"border: none; margin: 10px 0px; padding: 0px; color: rgb(72, 72, 72); font-family: proxima-nova, &quot;Helvetica Neue&quot;, Helvetica, Roboto, Arial, sans-serif; font-size: medium; letter-spacing: normal; background-color: rgb(249, 249, 249);\">Each of the&nbsp;<a href=\"https://react-cn.github.io/react/docs/addons.html\" style=\"border: none; margin: 0px; padding: 0px; color: rgb(192, 91, 77);\">add-ons</a>&nbsp;lives in its own package.</p><p style=\"border: none; margin: 10px 0px; padding: 0px; color: rgb(72, 72, 72); font-family: proxima-nova, &quot;Helvetica Neue&quot;, Helvetica, Roboto, Arial, sans-serif; font-size: medium; letter-spacing: normal; background-color: rgb(249, 249, 249);\"><strong style=\"border: none; margin: 0px; padding: 0px;\">Note:</strong>&nbsp;by default, React will be in development mode. To use React in production mode, set the environment variable&nbsp;<code style=\"border: none; margin: 0px; padding: 1px 3px; font-family: source-code-pro, Menlo, Consolas, &quot;Courier New&quot;, monospace; font-size: 13px; line-height: 1.5; color: rgb(85, 85, 85); background-color: rgba(0, 0, 0, 0.04);\">NODE_ENV</code>&nbsp;to&nbsp;<code style=\"border: none; margin: 0px; padding: 1px 3px; font-family: source-code-pro, Menlo, Consolas, &quot;Courier New&quot;, monospace; font-size: 13px; line-height: 1.5; color: rgb(85, 85, 85); background-color: rgba(0, 0, 0, 0.04);\">production</code>&nbsp;(using envify or webpack\'s DefinePlugin). A minifier that performs dead-code elimination such as&nbsp;<a href=\"https://github.com/mishoo/UglifyJS2\" style=\"border: none; margin: 0px; padding: 0px; color: rgb(192, 91, 77);\">UglifyJS</a>&nbsp;is recommended to completely remove the extra code present in development mode.</p><h2 style=\"border: none; margin: 30px 0px 10px; padding: 0px; font-family: proxima-nova, &quot;Helvetica Neue&quot;, Helvetica, Roboto, Arial, sans-serif; font-weight: bold; line-height: 40px; color: rgb(72, 72, 72); text-rendering: optimizelegibility; font-size: 31px; background-color: rgb(249, 249, 249);\"><a class=\"anchor\" name=\"bower\" style=\"border: none; margin: -50px 0px 0px; padding: 0px; color: rgb(192, 91, 77); position: absolute;\"></a>Bower</h2>', NULL, NULL, '2020-02-04 04:59:47', '2020-02-04 04:59:47');

-- --------------------------------------------------------

--
-- Table structure for table `vipscapl_knowledge_base_category`
--

CREATE TABLE `vipscapl_knowledge_base_category` (
  `id` int(10) UNSIGNED NOT NULL,
  `user_id` int(10) UNSIGNED NOT NULL,
  `category_name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `category_logo` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `vipscapl_knowledge_base_category`
--

INSERT INTO `vipscapl_knowledge_base_category` (`id`, `user_id`, `category_name`, `category_logo`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 1, 'Angular', '5e381dcd8ceaa.png', '2020-02-03 07:19:09', '2020-02-03 07:19:09', NULL),
(2, 1, 'Laravel', '5e381e5c1f3bd.png', '2020-02-03 07:21:32', '2020-02-03 07:21:32', NULL),
(3, 1, 'Wordpress', '5e381fbada5ce.png', '2020-02-03 07:24:04', '2020-02-03 07:27:22', NULL),
(4, 1, 'Node.js', '5e38200ac1904.png', '2020-02-03 07:28:42', '2020-02-03 07:28:42', NULL),
(5, 1, 'React Js', '5e3820688d903.svg', '2020-02-03 07:30:16', '2020-02-03 07:30:16', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `vipscapl_languages`
--

CREATE TABLE `vipscapl_languages` (
  `id` int(10) UNSIGNED NOT NULL,
  `code` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `status` tinyint(4) NOT NULL DEFAULT '1' COMMENT '0=inactive,1=active',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `vipscapl_languages`
--

INSERT INTO `vipscapl_languages` (`id`, `code`, `name`, `status`, `created_at`, `updated_at`) VALUES
(1, 'ar', 'Arabic', 1, NULL, NULL),
(2, 'cs', 'Czech', 1, NULL, NULL),
(3, 'da', 'Danish', 1, NULL, NULL),
(4, 'de', 'German', 1, NULL, NULL),
(5, 'el', 'Greek', 1, NULL, NULL),
(6, 'en', 'English', 1, NULL, NULL),
(7, 'es', 'Spanish', 1, NULL, NULL),
(8, 'fr', 'French', 1, NULL, NULL),
(9, 'gu', 'Gujarati', 1, NULL, NULL),
(10, 'hi', 'Hindi', 1, NULL, NULL),
(11, 'id', 'Indonesian', 1, NULL, NULL),
(12, 'it', 'Italian', 1, NULL, NULL),
(13, 'ja', 'Japanese', 1, NULL, NULL),
(14, 'nl', 'Dutch', 1, NULL, NULL),
(15, 'no', 'Norwegian', 1, NULL, NULL),
(16, 'pl', 'Polish', 1, NULL, NULL),
(17, 'pt', 'Portuguese', 1, NULL, NULL),
(18, 'ro', 'Romanian', 1, NULL, NULL),
(19, 'ru', 'Russian', 1, NULL, NULL),
(20, 'tr', 'Turkish', 1, NULL, NULL),
(21, 'zh', 'Chinese', 1, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `vipscapl_locales`
--

CREATE TABLE `vipscapl_locales` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `locale` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `status` tinyint(4) NOT NULL DEFAULT '1' COMMENT '0=inactive,1=active',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `vipscapl_locales`
--

INSERT INTO `vipscapl_locales` (`id`, `name`, `locale`, `status`, `created_at`, `updated_at`) VALUES
(1, 'Afghanistan', 'afghanistan', 1, NULL, NULL),
(2, 'Aringland Islands', 'aringland_islands', 1, NULL, NULL),
(3, 'Albania', 'albania', 1, NULL, NULL),
(4, 'Algeria', 'algeria', 1, NULL, NULL),
(5, 'American Samoa', 'american_samoa', 1, NULL, NULL),
(6, 'Andorra', 'andorra', 1, NULL, NULL),
(7, 'Angola', 'angola', 1, NULL, NULL),
(8, 'Anguilla', 'anguilla', 1, NULL, NULL),
(9, 'Antarctica', 'antarctica', 1, NULL, NULL),
(10, 'Antigua and Barbuda', 'antigua_and_barbuda', 1, NULL, NULL),
(11, 'Argentina', 'argentina', 1, NULL, NULL),
(12, 'Armenia', 'armenia', 1, NULL, NULL),
(13, 'Aruba', 'aruba', 1, NULL, NULL),
(14, 'Australia', 'australia', 1, NULL, NULL),
(15, 'Austria', 'austria', 1, NULL, NULL),
(16, 'Azerbaijan', 'azerbaijan', 1, NULL, NULL),
(17, 'Bahamas', 'bahamas', 1, NULL, NULL),
(18, 'Bahrain', 'bahrain', 1, NULL, NULL),
(19, 'Bangladesh', 'bangladesh', 1, NULL, NULL),
(20, 'Barbados', 'barbados', 1, NULL, NULL),
(21, 'Belarus', 'belarus', 1, NULL, NULL),
(22, 'Belgium', 'belgium', 1, NULL, NULL),
(23, 'Belize', 'belize', 1, NULL, NULL),
(24, 'Benin', 'benin', 1, NULL, NULL),
(25, 'Bermuda', 'bermuda', 1, NULL, NULL),
(26, 'Bhutan', 'bhutan', 1, NULL, NULL),
(27, 'Bolivia', 'bolivia', 1, NULL, NULL),
(28, 'Bosnia and Herzegovina', 'bosnia_and_herzegovina', 1, NULL, NULL),
(29, 'Botswana', 'botswana', 1, NULL, NULL),
(30, 'Bouvet Island', 'bouvet_island', 1, NULL, NULL),
(31, 'Brazil', 'brazil', 1, NULL, NULL),
(32, 'British Indian Ocean territory', 'british_indian_ocean_territory', 1, NULL, NULL),
(33, 'Brunei Darussalam', 'brunei_darussalam', 1, NULL, NULL),
(34, 'Bulgaria', 'bulgaria', 1, NULL, NULL),
(35, 'Burkina Faso', 'burkina_faso', 1, NULL, NULL),
(36, 'Burundi', 'burundi', 1, NULL, NULL),
(37, 'Cambodia', 'cambodia', 1, NULL, NULL),
(38, 'Cameroon', 'cameroon', 1, NULL, NULL),
(39, 'Canada', 'canada', 1, NULL, NULL),
(40, 'Cape Verde', 'cape_verde', 1, NULL, NULL),
(41, 'Cayman Islands', 'cayman_islands', 1, NULL, NULL),
(42, 'Central African Republic', 'central_african_republic', 1, NULL, NULL),
(43, 'Chad', 'chad', 1, NULL, NULL),
(44, 'Chile', 'chile', 1, NULL, NULL),
(45, 'China', 'china', 1, NULL, NULL),
(46, 'Christmas Island', 'christmas_island', 1, NULL, NULL),
(47, 'Cocos(Keeling) Islands', 'cocos_islands', 1, NULL, NULL),
(48, 'Colombia', 'colombia', 1, NULL, NULL),
(49, 'Comoros', 'comoros', 1, NULL, NULL),
(50, 'Congo', 'congo', 1, NULL, NULL),
(51, 'Democratic Republic', 'democratic_republic', 1, NULL, NULL),
(52, 'Cook Islands', 'cook_islands', 1, NULL, NULL),
(53, 'Costa Rica', 'costa_rica', 1, NULL, NULL),
(54, 'Ivory Coast(Ivory Coast)', 'ivory_coast', 1, NULL, NULL),
(55, 'Croatia(Hrvatska)', 'croatia', 1, NULL, NULL),
(56, 'Cuba', 'cuba', 1, NULL, NULL),
(57, 'Cyprus', 'cyprus', 1, NULL, NULL),
(58, 'Czech Republic', 'czech_republic', 1, NULL, NULL),
(59, 'Denmark', 'denmark', 1, NULL, NULL),
(60, 'Djibouti', 'djibouti', 1, NULL, NULL),
(61, 'Dominica', 'dominica', 1, NULL, NULL),
(62, 'Dominican Republic', 'dominican_republic', 1, NULL, NULL),
(63, 'East Timor', 'east_timor', 1, NULL, NULL),
(64, 'Ecuador', 'ecuador', 1, NULL, NULL),
(65, 'Egypt', 'egypt', 1, NULL, NULL),
(66, 'El Salvador', 'el_salvador', 1, NULL, NULL),
(67, 'Equatorial Guinea', 'equatorial_guinea', 1, NULL, NULL),
(68, 'Eritrea', 'eritrea', 1, NULL, NULL),
(69, 'Estonia', 'estonia', 1, NULL, NULL),
(70, 'Ethiopia', 'ethiopia', 1, NULL, NULL),
(71, 'Falkland Islands', 'falkland_islands', 1, NULL, NULL),
(72, 'Faroe Islands', 'faroe_islands', 1, NULL, NULL),
(73, 'Fiji', 'fiji', 1, NULL, NULL),
(74, 'Finland', 'finland', 1, NULL, NULL),
(75, 'France', 'france', 1, NULL, NULL),
(76, 'French Guiana', 'french_guiana', 1, NULL, NULL),
(77, 'French Polynesia', 'french_polynesia', 1, NULL, NULL),
(78, 'French Southern Territories', 'french_southern_territories', 1, NULL, NULL),
(79, 'Gabon', 'gabon', 1, NULL, NULL),
(80, 'Gambia', 'gambia', 1, NULL, NULL),
(81, 'Georgia', 'georgia', 1, NULL, NULL),
(82, 'Germany', 'germany', 1, NULL, NULL),
(83, 'Ghana', 'ghana', 1, NULL, NULL),
(84, 'Gibraltar', 'gibraltar', 1, NULL, NULL),
(85, 'Greece', 'greece', 1, NULL, NULL),
(86, 'Greenland', 'greenland', 1, NULL, NULL),
(87, 'Grenada', 'grenada', 1, NULL, NULL),
(88, 'Guadeloupe', 'guadeloupe', 1, NULL, NULL),
(89, 'Guam', 'guam', 1, NULL, NULL),
(90, 'Guatemala', 'guatemala', 1, NULL, NULL),
(91, 'Guinea', 'guinea', 1, NULL, NULL),
(92, 'Guinea-Bissau', 'guinea_bissau', 1, NULL, NULL),
(93, 'Guyana', 'guyana', 1, NULL, NULL),
(94, 'Haiti', 'haiti', 1, NULL, NULL),
(95, 'Heard and McDonald Islands', 'heard_and_mcdonald_islands', 1, NULL, NULL),
(96, 'Honduras', 'honduras', 1, NULL, NULL),
(97, 'Hong Kong', 'hong_kong', 1, NULL, NULL),
(98, 'Hungary', 'hungary', 1, NULL, NULL),
(99, 'Iceland', 'iceland', 1, NULL, NULL),
(100, 'India', 'india', 1, NULL, NULL),
(101, 'Indonesia', 'indonesia', 1, NULL, NULL),
(102, 'Iran', 'iran', 1, NULL, NULL),
(103, 'Iraq', 'iraq', 1, NULL, NULL),
(104, 'Ireland', 'ireland', 1, NULL, NULL),
(105, 'Israel', 'israel', 1, NULL, NULL),
(106, 'Italy', 'italy', 1, NULL, NULL),
(107, 'Jamaica', 'jamaica', 1, NULL, NULL),
(108, 'Japan', 'japan', 1, NULL, NULL),
(109, 'Jordan', 'jordan', 1, NULL, NULL),
(110, 'Kazakhstan', 'kazakhstan', 1, NULL, NULL),
(111, 'Kenya', 'kenya', 1, NULL, NULL),
(112, 'Kiribati', 'kiribati', 1, NULL, NULL),
(113, 'Korea (north)', 'korea_north', 1, NULL, NULL),
(114, 'Korea (south)', 'korea_south', 1, NULL, NULL),
(115, 'Kuwait', 'kuwait', 1, NULL, NULL),
(116, 'Kyrgyzstan', 'kyrgyzstan', 1, NULL, NULL),
(117, 'Lao People\'s Democratic Republic', 'Lao_peoples_emocratic_republic', 1, NULL, NULL),
(118, 'Latvia', 'latvia', 1, NULL, NULL),
(119, 'Lebanon', 'lebanon', 1, NULL, NULL),
(120, 'Lesotho', 'lesotho', 1, NULL, NULL),
(121, 'Liberia', 'liberia', 1, NULL, NULL),
(122, 'Libyan Arab Jamahiriya', 'libyan_arab_jamahiriya', 1, NULL, NULL),
(123, 'Liechtenstein', 'liechtenstein', 1, NULL, NULL),
(124, 'Lithuania', 'lithuania', 1, NULL, NULL),
(125, 'Luxembourg', 'luxembourg', 1, NULL, NULL),
(126, 'Macao', 'macao', 1, NULL, NULL),
(127, 'Macedonia', 'macedonia', 1, NULL, NULL),
(128, 'Madagascar', 'madagascar', 1, NULL, NULL),
(129, 'Malawi', 'malawi', 1, NULL, NULL),
(130, 'Malaysia', 'malaysia', 1, NULL, NULL),
(131, 'Maldives', 'maldives', 1, NULL, NULL),
(132, 'Mali', 'mali', 1, NULL, NULL),
(133, 'Malta', 'malta', 1, NULL, NULL),
(134, 'Marshall Islands', 'marshall_islands', 1, NULL, NULL),
(135, 'Martinique', 'martinique', 1, NULL, NULL),
(136, 'Mauritania', 'mauritania', 1, NULL, NULL),
(137, 'Mauritius', 'mauritius', 1, NULL, NULL),
(138, 'Mayotte', 'mayotte', 1, NULL, NULL),
(139, 'Mexico', 'mexico', 1, NULL, NULL),
(140, 'Micronesia', 'micronesia', 1, NULL, NULL),
(141, 'Moldova', 'moldova', 1, NULL, NULL),
(142, 'Monaco', 'monaco', 1, NULL, NULL),
(143, 'Mongolia', 'mongolia', 1, NULL, NULL),
(144, 'Montserrat', 'Montserrat', 1, NULL, NULL),
(145, 'Morocco', 'morocco', 1, NULL, NULL),
(146, 'Mozambique', 'mozambique', 1, NULL, NULL),
(147, 'Myanmar', 'myanmar', 1, NULL, NULL),
(148, 'Namibia', 'namibia', 1, NULL, NULL),
(149, 'Nauru', 'nauru', 1, NULL, NULL),
(150, 'Nepal', 'nepal', 1, NULL, NULL),
(151, 'Netherlands', 'netherlands', 1, NULL, NULL),
(152, 'Netherlands Antilles', 'netherlands_antilles', 1, NULL, NULL),
(153, 'New Caledonia', 'new_caledonia', 1, NULL, NULL),
(154, 'New Zealand', 'new_zealand', 1, NULL, NULL),
(155, 'Nicaragua', 'nicaragua', 1, NULL, NULL),
(156, 'Niger', 'niger', 1, NULL, NULL),
(157, 'Nigeria', 'nigeria', 1, NULL, NULL),
(158, 'Niue', 'niue', 1, NULL, NULL),
(159, 'Norfolk Island', 'norfolk_island', 1, NULL, NULL),
(160, 'Northern Mariana Islands', 'northern_mariana_islands', 1, NULL, NULL),
(161, 'Norway', 'norway', 1, NULL, NULL),
(162, 'Oman', 'oman', 1, NULL, NULL),
(163, 'Pakistan', 'pakistan', 1, NULL, NULL),
(164, 'Palau', 'palau', 1, NULL, NULL),
(165, 'Palestinian Territories', 'palestinian_territories', 1, NULL, NULL),
(166, 'Panama', 'panama', 1, NULL, NULL),
(167, 'Papua New Guinea', 'papua_new_guinea', 1, NULL, NULL),
(168, 'Paraguay', 'paraguay', 1, NULL, NULL),
(169, 'Peru', 'peru', 1, NULL, NULL),
(170, 'Philippines', 'philippines', 1, NULL, NULL),
(171, 'Pitcairn', 'pitcairn', 1, NULL, NULL),
(172, 'Poland', 'poland', 1, NULL, NULL),
(173, 'Portugal', 'portugal', 1, NULL, NULL),
(174, 'Puerto Rico', 'puerto_rico', 1, NULL, NULL),
(175, 'Qatar', 'qatar', 1, NULL, NULL),
(176, 'Runion', 'runion', 1, NULL, NULL),
(177, 'Romania', 'romania', 1, NULL, NULL),
(178, 'Russian Federation', 'russian_federation', 1, NULL, NULL),
(179, 'Rwanda', 'rwanda', 1, NULL, NULL),
(180, 'Saint Helena', 'saint_helena', 1, NULL, NULL),
(181, 'Saint Kitts and Nevis', 'saint_kitts_and_nevis', 1, NULL, NULL),
(182, 'Saint Lucia', 'saint_lucia', 1, NULL, NULL),
(183, 'Saint Pierre and Miquelon', 'saint_pierre_and_miquelon', 1, NULL, NULL),
(184, 'Saint Vincent and the Grenadines', 'saint_vincent_and_the_grenadines', 1, NULL, NULL),
(185, 'Samoa', 'samoa', 1, NULL, NULL),
(186, 'San Marino', 'san_marino', 1, NULL, NULL),
(187, 'Sao Tome and Principe', 'sao_tome_and_principe', 1, NULL, NULL),
(188, 'Saudi Arabia', 'saudi_arabia', 1, NULL, NULL),
(189, 'Senegal', 'senegal', 1, NULL, NULL),
(190, 'Serbia and Montenegro', 'serbia_and_montenegro', 1, NULL, NULL),
(191, 'Seychelles', 'seychelles', 1, NULL, NULL),
(192, 'Sierra Leone', 'sierra_leone', 1, NULL, NULL),
(193, 'Singapore', 'singapore', 1, NULL, NULL),
(194, 'Slovakia', 'slovakia', 1, NULL, NULL),
(195, 'Slovenia', 'slovenia', 1, NULL, NULL),
(196, 'Solomon Islands', 'solomon_islands', 1, NULL, NULL),
(197, 'Somalia', 'somalia', 1, NULL, NULL),
(198, 'South Africa', 'south_africa', 1, NULL, NULL),
(199, 'South Georgia and the South Sandwich Islands', 'south_georgia_and_the_south_sandwich_islands', 1, NULL, NULL),
(200, 'Spain', 'spain', 1, NULL, NULL),
(201, 'Sri Lanka', 'sri_lanka', 1, NULL, NULL),
(202, 'Sudan', 'sudan', 1, NULL, NULL),
(203, 'Suriname', 'suriname', 1, NULL, NULL),
(204, 'Svalbard and Jan Mayen Islands', 'svalbard_and_jan_mayen_islands', 1, NULL, NULL),
(205, 'Swaziland', 'swaziland', 1, NULL, NULL),
(206, 'Sweden', 'sweden', 1, NULL, NULL),
(207, 'Switzerland', 'switzerland', 1, NULL, NULL),
(208, 'Syria', 'syria', 1, NULL, NULL),
(209, 'Taiwan', 'taiwan', 1, NULL, NULL),
(210, 'Tajikistan', 'tajikistan', 1, NULL, NULL),
(211, 'Tanzania', 'tanzania', 1, NULL, NULL),
(212, 'Thailand', 'thailand', 1, NULL, NULL),
(213, 'Togo', 'togo', 1, NULL, NULL),
(214, 'Tokelau', 'tokelau', 1, NULL, NULL),
(215, 'Tonga', 'tonga', 1, NULL, NULL),
(216, 'Trinidad and Tobago', 'trinidad_and_tobago', 1, NULL, NULL),
(217, 'Tunisia', 'tunisia', 1, NULL, NULL),
(218, 'Turkey', 'turkey', 1, NULL, NULL),
(219, 'Turkmenistan', 'turkmenistan', 1, NULL, NULL),
(220, 'Turks and Caicos Islands', 'turks_and_caicos_islands', 1, NULL, NULL),
(221, 'Tuvalu', 'tuvalu', 1, NULL, NULL),
(222, 'Uganda', 'uganda', 1, NULL, NULL),
(223, 'Ukraine', 'ukraine', 1, NULL, NULL),
(224, 'United Arab Emirates', 'united_arab_emirates', 1, NULL, NULL),
(225, 'United Kingdom', 'united_kingdom', 1, NULL, NULL),
(226, 'United States of America', 'united_states_of_america', 1, NULL, NULL),
(227, 'Uruguay', 'uruguay', 1, NULL, NULL),
(228, 'Uzbekistan', 'uzbekistan', 1, NULL, NULL),
(229, 'Vanuatu', 'vanuatu', 1, NULL, NULL),
(230, 'Vatican City', 'vatican_city', 1, NULL, NULL),
(231, 'Venezuela', 'venezuela', 1, NULL, NULL),
(232, 'Vietnam', 'vietnam', 1, NULL, NULL),
(233, 'Virgin Islands (British)', 'virgin_islands_british', 1, NULL, NULL),
(234, 'Virgin Islands (US)', 'virgin_islands_us', 1, NULL, NULL),
(235, 'Wallis and Futuna Islands', 'wallis_and_futuna_islands', 1, NULL, NULL),
(236, 'Western Sahara', 'western_sahara', 1, NULL, NULL),
(237, 'Yemen', 'yemen', 1, NULL, NULL),
(238, 'Zaire', 'zaire', 1, NULL, NULL),
(239, 'Zambia', 'zambia', 1, NULL, NULL),
(240, 'Zimbabwe', 'zimbabwe', 1, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `vipscapl_meetings`
--

CREATE TABLE `vipscapl_meetings` (
  `id` int(10) UNSIGNED NOT NULL,
  `organizer_id` int(10) UNSIGNED NOT NULL,
  `title` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `description` text COLLATE utf8_unicode_ci,
  `location` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `start_date` datetime NOT NULL,
  `end_date` datetime NOT NULL,
  `hour_time` varchar(10) COLLATE utf8_unicode_ci DEFAULT NULL,
  `status` tinyint(4) NOT NULL DEFAULT '1',
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `vipscapl_meetings`
--

INSERT INTO `vipscapl_meetings` (`id`, `organizer_id`, `title`, `description`, `location`, `start_date`, `end_date`, `hour_time`, `status`, `deleted_at`, `created_at`, `updated_at`) VALUES
(1, 1, 'Angular V7 workshop', NULL, 'rakot', '2020-08-03 03:00:00', '2020-08-03 04:00:00', '01:00', 1, NULL, '2020-02-01 12:10:27', '2020-05-18 09:33:41'),
(2, 1, 'Code Review', NULL, NULL, '2020-06-06 03:00:24', '2020-06-06 05:10:24', '02:10', 1, NULL, '2020-02-01 12:35:48', '2020-05-18 09:30:28'),
(3, 1, 'CRM project kickoff', NULL, 'Rajkot', '2020-07-10 07:06:16', '2020-07-10 09:06:16', '02:00', 1, NULL, '2020-02-01 12:37:22', '2020-05-18 09:29:42'),
(4, 1, 'Project release and testing.', NULL, 'Rajkot', '2020-08-28 05:00:17', '2020-08-28 06:00:17', '01:00', 1, NULL, '2020-02-01 12:38:39', '2020-05-18 09:28:29'),
(5, 1, 'Angular V7 workshop', NULL, 'Rajkot', '2020-07-16 05:00:59', '2020-07-16 07:00:59', NULL, 1, '2020-02-11 03:48:34', '2020-02-04 05:47:39', '2020-02-11 03:48:34'),
(6, 1, 'Game Zone Project Meeting.', NULL, 'Himalya', '2020-06-10 11:00:00', '2020-06-10 12:00:00', '01:00', 1, NULL, '2020-02-11 04:44:30', '2020-05-18 09:29:08'),
(7, 1, 'Travel System Project Meeting.', NULL, 'Kailash First Floor', '2020-06-11 11:45:34', '2020-06-11 12:45:34', '01:00', 1, NULL, '2020-02-11 04:46:06', '2020-05-18 09:28:49'),
(8, 1, 'PBS Sprint 2 SLD.', NULL, 'Bankai House', '2020-06-30 11:30:55', '2020-06-30 13:30:55', '02:00', 1, NULL, '2020-02-11 04:47:33', '2020-05-18 09:26:46');

-- --------------------------------------------------------

--
-- Table structure for table `vipscapl_meeting_members`
--

CREATE TABLE `vipscapl_meeting_members` (
  `id` int(10) UNSIGNED NOT NULL,
  `user_id` int(10) UNSIGNED NOT NULL,
  `meeting_id` int(10) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `vipscapl_meeting_members`
--

INSERT INTO `vipscapl_meeting_members` (`id`, `user_id`, `meeting_id`, `created_at`, `updated_at`) VALUES
(1, 13, 1, NULL, NULL),
(2, 13, 2, NULL, NULL),
(3, 1, 3, NULL, NULL),
(4, 13, 3, NULL, NULL),
(5, 13, 4, NULL, NULL),
(6, 7, 4, NULL, NULL),
(7, 5, 4, NULL, NULL),
(8, 1, 2, NULL, NULL),
(9, 1, 1, NULL, NULL),
(10, 1, 4, NULL, NULL),
(12, 1, 6, NULL, NULL),
(13, 13, 6, NULL, NULL),
(14, 1, 7, NULL, NULL),
(15, 13, 7, NULL, NULL),
(16, 1, 8, NULL, NULL),
(17, 13, 8, NULL, NULL),
(18, 2, 8, NULL, NULL),
(21, 7, 7, NULL, NULL),
(22, 5, 7, NULL, NULL),
(24, 7, 6, NULL, NULL),
(25, 5, 6, NULL, NULL),
(26, 2, 6, NULL, NULL),
(27, 7, 3, NULL, NULL),
(28, 5, 3, NULL, NULL),
(29, 2, 3, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `vipscapl_menus`
--

CREATE TABLE `vipscapl_menus` (
  `id` int(10) UNSIGNED NOT NULL,
  `parent_menu_id` int(11) NOT NULL,
  `module` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `label` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `text` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `link` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `icon` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `order` int(11) NOT NULL,
  `subscription` tinyint(4) NOT NULL DEFAULT '1' COMMENT '1=subscription 0=unsubscription',
  `status` tinyint(4) NOT NULL DEFAULT '1' COMMENT '1=active 0=inactive'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `vipscapl_menus`
--

INSERT INTO `vipscapl_menus` (`id`, `parent_menu_id`, `module`, `label`, `text`, `link`, `icon`, `order`, `subscription`, `status`) VALUES
(1, 0, 'dashboard', 'dashboard', 'Dashboard', '/dashboard', 'fa fa-dashboard', 4, 1, 1),
(2, 0, 'calendar', 'calendar', 'Calendar', '/calendar', 'fa fa-calendar', 5, 1, 1),
(3, 0, 'admin', 'administration', 'Administration', '#', 'fa fa-user-circle', 6, 1, 1),
(4, 3, 'admin', 'roles', 'Roles', '/roles', 'fa fa-user-circle', 0, 1, 1),
(5, 3, 'admin', 'departments', 'Departments', '/departments', 'fa fa-user-circle', 1, 1, 1),
(6, 3, 'admin', 'users', 'Users', '/users', 'fa fa-user-circle', 2, 1, 1),
(7, 3, 'admin', 'teams', 'Teams', '/teams', 'fa fa-user-circle', 3, 1, 1),
(9, 0, 'utilities', 'holidays', 'Holidays', '/holidays', 'fa fa-calendar-plus-o', 0, 1, 1),
(10, 0, 'admin', 'meetings', 'Meetings', '/meetings', 'fa fa-briefcase', 13, 1, 1),
(11, 0, 'admin', 'clients', 'Clients', '/clients', 'fa fa-user-circle', 15, 1, 1),
(12, 0, 'utilities', 'todos', 'Todos', '/todos', 'fa fa-list-ul', 1, 1, 1),
(13, 0, 'utilities', 'announcements', 'Announcements', '/announcements', 'fa fa-announcements', 2, 1, 1),
(14, 0, 'utilities', 'mailbox', 'Mailbox', '/mailbox', 'fa fa-envelope-o', 3, 1, 1),
(15, 0, 'filemanager', 'file manager', 'File Manager', '/file-browser', 'fa fa-folder', 16, 1, 1),
(16, 0, 'setting', 'settings', 'Settings', '/settings', 'fa fa-cogs', 19, 1, 1),
(17, 16, 'settings', 'company detail', 'Company Detail', '#', 'fa fa-info-circle', 0, 1, 1),
(18, 16, 'settings', 'email settings', 'Email Settings', '#', 'fa fa-envelope', 1, 1, 1),
(19, 16, 'settings', 'email Templates', 'Email Templates', '#', 'fa fa-pencil-square', 2, 1, 1),
(20, 16, 'settings', 'email notifications', 'Email Notifications', '#', 'fa fa-bell-o', 3, 1, 1),
(21, 16, 'settings', 'cronjob', 'Cronjob', '#', 'fa fa-contao', 4, 1, 1),
(22, 16, 'settings', 'menu allocation', 'Menu Allocation', '#', 'fa fa-language', 5, 1, 1),
(23, 16, 'settings', 'theme settings', 'Theme Settings', '#', 'fa fa-compass', 6, 1, 1),
(24, 16, 'settings', 'dashboard settings', 'Dashboard Settings', '#', 'fa fa-cog', 7, 1, 1),
(25, 16, 'settings', 'system settings', 'System Settings', '#', 'fa fa-desktop', 8, 1, 1),
(27, 16, 'settings', 'backup database', 'Backup Database', '#', 'fa fa-database', 9, 1, 1),
(28, 16, 'settings', 'custom fields', 'Custom Fields', '#', 'fa fa-list-alt', 10, 1, 1),
(29, 0, 'pm', 'timesheet', 'Timesheet', '/timesheet', 'fa fa-clock-o', 12, 1, 1),
(41, 0, 'pm', 'project management', 'Project Management', '#', 'fa fa-product-hunt', 0, 1, 0),
(42, 0, 'pm', 'project planner', 'Project Planner', '/projects-planner', 'fa fa-american-sign-language-interpreting', 7, 1, 1),
(43, 0, 'pm', 'projects', 'Projects', '/projects', 'fa fa-product-hunt', 8, 1, 1),
(44, 0, 'pm', 'tasks', 'Tasks', '/tasks', 'fa fa-tasks', 9, 1, 1),
(46, 0, 'pm', 'defects', 'Defects', '/defects', 'fa fa-bug', 10, 1, 1),
(47, 0, 'pm', 'incidents', 'Incidents', '/incidents', 'fa fa-ticket', 11, 1, 1),
(49, 0, 'pm', 'knowledge base', 'Knowledge Base', '/knowledgebase', 'fa fa-graduation-cap', 17, 1, 1),
(50, 3, 'pm', 'team boards', 'Team Boards', '/teamboard', 'fa fa-universal-access', 4, 1, 1),
(51, 0, 'pm', 'reports', 'Reports', '/reports', 'fa fa-bar-chart', 18, 1, 1),
(71, 0, 'crm', 'appointment', 'Appointments', '/appointments', 'fa fa-calendar-times-o', 14, 1, 1);

-- --------------------------------------------------------

--
-- Table structure for table `vipscapl_modules`
--

CREATE TABLE `vipscapl_modules` (
  `id` int(10) UNSIGNED NOT NULL,
  `module_id` int(11) NOT NULL,
  `module_name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `module_slug` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `status` tinyint(4) NOT NULL DEFAULT '1' COMMENT '1=Active,0=Inactive'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `vipscapl_modules`
--

INSERT INTO `vipscapl_modules` (`id`, `module_id`, `module_name`, `module_slug`, `status`) VALUES
(1, 1, 'Project', 'projects', 1),
(2, 2, 'Task', 'task', 1),
(3, 3, 'Defect', 'defect', 1),
(4, 4, 'Incident', 'incident', 1),
(5, 5, 'Meeting', 'meeting', 1),
(6, 6, 'Other', 'other', 1);

-- --------------------------------------------------------

--
-- Table structure for table `vipscapl_password_resets`
--

CREATE TABLE `vipscapl_password_resets` (
  `email` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `vipscapl_projects`
--

CREATE TABLE `vipscapl_projects` (
  `id` int(10) UNSIGNED NOT NULL,
  `user_id` int(11) NOT NULL,
  `generated_id` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `project_name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `project_version` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `client_id` int(11) DEFAULT NULL,
  `progress` int(11) NOT NULL DEFAULT '0',
  `project_hours` tinyint(1) NOT NULL DEFAULT '0' COMMENT '0=Progress Bar,1=Task Hours',
  `start_date` date NOT NULL,
  `end_date` date NOT NULL,
  `billing_type` tinyint(4) DEFAULT NULL COMMENT '1=Fixed Rate,2=Hourly Rate',
  `price_rate` double(15,8) DEFAULT NULL,
  `estimated_hours` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `status` tinyint(4) DEFAULT '1' COMMENT '1=Open,2=InProgress,3=OnHold,4=Cancel,5=Completed',
  `demo_url` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `description` text COLLATE utf8_unicode_ci,
  `project_logo` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `assign_to` tinyint(4) DEFAULT NULL,
  `assign_members` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `notes` text COLLATE utf8_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `vipscapl_projects`
--

INSERT INTO `vipscapl_projects` (`id`, `user_id`, `generated_id`, `project_name`, `project_version`, `client_id`, `progress`, `project_hours`, `start_date`, `end_date`, `billing_type`, `price_rate`, `estimated_hours`, `status`, `demo_url`, `description`, `project_logo`, `assign_to`, `assign_members`, `notes`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 1, 'P00001', 'VipsPM(Angular8 With Laravel)', '1.0', 11, 50, 0, '2020-01-29', '2020-03-29', 2, 12.00000000, '1800:00', 2, NULL, NULL, 'adobe-illustrator.png', 2, '1,2,3,4,9,10,13', NULL, '2020-01-30 12:32:07', '2020-05-18 08:35:06', NULL),
(2, 1, 'P00002', 'Library Management System', '1.0', 11, 40, 0, '2020-01-29', '2020-03-31', 1, 200.00000000, '2000:00', 4, NULL, NULL, 'adobe-photoshop.png', 3, '1,2,13', NULL, '2020-01-30 12:36:31', '2020-05-18 08:34:39', NULL),
(3, 1, 'P00003', 'Billing System', '1.0', 11, 30, 0, '2020-01-29', '2020-02-26', 2, 500.00000000, '100:00', 3, NULL, NULL, 'android.png', 2, '1,2,3,4,13', NULL, '2020-01-30 12:39:05', '2020-05-18 08:35:25', NULL),
(4, 1, 'P00004', 'Game Zone', '1.0', 11, 20, 0, '2020-02-25', '2020-04-29', 1, 100.00000000, '5000:00', 2, NULL, NULL, 'apple.png', 3, '1,2,3,4,5', NULL, '2020-01-30 12:40:40', '2020-05-18 08:35:41', NULL),
(5, 1, 'P00005', 'VipsCRM', '1.0', 11, 10, 0, '2020-02-29', '2020-03-30', 1, 800.00000000, '500:00', 1, NULL, NULL, 'creative-commons.png', 3, '2,3', NULL, '2020-01-30 12:42:19', '2020-05-18 08:36:02', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `vipscapl_project_attachments`
--

CREATE TABLE `vipscapl_project_attachments` (
  `id` int(10) UNSIGNED NOT NULL,
  `project_id` int(10) UNSIGNED NOT NULL,
  `file_name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `file_hash` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `file_description` text COLLATE utf8_unicode_ci,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `vipscapl_project_comments`
--

CREATE TABLE `vipscapl_project_comments` (
  `id` int(10) UNSIGNED NOT NULL,
  `user_id` int(10) UNSIGNED NOT NULL,
  `project_id` int(10) UNSIGNED NOT NULL,
  `parent_id` int(11) NOT NULL DEFAULT '0',
  `comment` text COLLATE utf8_unicode_ci NOT NULL,
  `attachments` text COLLATE utf8_unicode_ci,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `vipscapl_project_sprints`
--

CREATE TABLE `vipscapl_project_sprints` (
  `id` int(10) UNSIGNED NOT NULL,
  `project_id` int(10) UNSIGNED NOT NULL,
  `sprint_name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `start_date` date DEFAULT NULL,
  `end_date` date DEFAULT NULL,
  `hours` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `status` tinyint(4) NOT NULL DEFAULT '1' COMMENT '1=Open,2=InProgress,3=Closed',
  `description` text COLLATE utf8_unicode_ci,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `vipscapl_project_sprints`
--

INSERT INTO `vipscapl_project_sprints` (`id`, `project_id`, `sprint_name`, `start_date`, `end_date`, `hours`, `status`, `description`, `deleted_at`, `created_at`, `updated_at`) VALUES
(1, 1, 'Sprint 1', '2020-03-01', '2020-03-15', NULL, 1, NULL, NULL, '2020-05-18 10:45:28', '2020-05-18 10:45:28');

-- --------------------------------------------------------

--
-- Table structure for table `vipscapl_project_sprint_members`
--

CREATE TABLE `vipscapl_project_sprint_members` (
  `id` int(10) UNSIGNED NOT NULL,
  `project_sprint_id` int(10) UNSIGNED NOT NULL,
  `user_id` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `vipscapl_project_sprint_members`
--

INSERT INTO `vipscapl_project_sprint_members` (`id`, `project_sprint_id`, `user_id`) VALUES
(1, 1, 1),
(2, 1, 2),
(3, 1, 3);

-- --------------------------------------------------------

--
-- Table structure for table `vipscapl_project_sprint_tasks`
--

CREATE TABLE `vipscapl_project_sprint_tasks` (
  `id` int(10) UNSIGNED NOT NULL,
  `project_sprint_id` int(10) UNSIGNED NOT NULL,
  `task_name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `description` text COLLATE utf8_unicode_ci,
  `status` tinyint(4) NOT NULL DEFAULT '1' COMMENT 'Task:1=Open,2=InProgress,3=OnHold,4=Waiting,5=Cancel,6=Completed|Story:1=Open,2=InProgress,3=Closed',
  `type` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `start_date` date DEFAULT NULL,
  `end_date` date DEFAULT NULL,
  `hours` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `vipscapl_project_sprint_task_members`
--

CREATE TABLE `vipscapl_project_sprint_task_members` (
  `id` int(10) UNSIGNED NOT NULL,
  `task_id` int(10) UNSIGNED NOT NULL,
  `user_id` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `vipscapl_project_user`
--

CREATE TABLE `vipscapl_project_user` (
  `user_id` int(10) UNSIGNED NOT NULL,
  `project_id` int(10) UNSIGNED NOT NULL,
  `view` tinyint(1) NOT NULL DEFAULT '1' COMMENT '0=No,1=Yes',
  `edit` tinyint(1) NOT NULL DEFAULT '0' COMMENT '0=No,1=Yes',
  `delete` tinyint(1) NOT NULL DEFAULT '0' COMMENT '0=No,1=Yes'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `vipscapl_project_user`
--

INSERT INTO `vipscapl_project_user` (`user_id`, `project_id`, `view`, `edit`, `delete`) VALUES
(1, 1, 1, 1, 1),
(2, 1, 1, 1, 1),
(3, 1, 1, 1, 1),
(4, 1, 1, 1, 1),
(5, 1, 1, 0, 0),
(6, 1, 1, 0, 0),
(7, 1, 1, 0, 0),
(8, 1, 1, 0, 0),
(9, 1, 1, 1, 1),
(10, 1, 1, 1, 1),
(11, 1, 1, 0, 0),
(13, 1, 1, 1, 1),
(1, 2, 1, 1, 1),
(2, 2, 1, 1, 1),
(3, 2, 1, 0, 0),
(4, 2, 1, 0, 0),
(5, 2, 1, 0, 0),
(6, 2, 1, 0, 0),
(7, 2, 1, 0, 0),
(8, 2, 1, 0, 0),
(9, 2, 1, 0, 0),
(10, 2, 1, 0, 0),
(11, 2, 1, 0, 0),
(13, 2, 1, 1, 1),
(1, 3, 1, 1, 1),
(2, 3, 1, 1, 1),
(3, 3, 1, 1, 1),
(4, 3, 1, 1, 1),
(5, 3, 1, 0, 0),
(6, 3, 1, 0, 0),
(7, 3, 1, 0, 0),
(8, 3, 1, 0, 0),
(9, 3, 1, 0, 0),
(10, 3, 1, 0, 0),
(11, 3, 1, 0, 0),
(13, 3, 1, 1, 1),
(1, 4, 1, 1, 1),
(2, 4, 1, 1, 1),
(3, 4, 1, 1, 1),
(4, 4, 1, 1, 1),
(5, 4, 1, 1, 1),
(6, 4, 1, 0, 0),
(7, 4, 1, 0, 0),
(8, 4, 1, 0, 0),
(9, 4, 1, 0, 0),
(10, 4, 1, 0, 0),
(11, 4, 1, 0, 0),
(13, 4, 1, 0, 0),
(1, 5, 1, 1, 1),
(2, 5, 1, 1, 1),
(3, 5, 1, 1, 1),
(4, 5, 1, 0, 0),
(5, 5, 1, 0, 0),
(6, 5, 1, 0, 0),
(7, 5, 1, 0, 0),
(8, 5, 1, 0, 0),
(9, 5, 1, 0, 0),
(10, 5, 1, 0, 0),
(11, 5, 1, 0, 0),
(13, 5, 1, 0, 0);

-- --------------------------------------------------------

--
-- Table structure for table `vipscapl_providers`
--

CREATE TABLE `vipscapl_providers` (
  `id` int(10) UNSIGNED NOT NULL,
  `firstname` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `lastname` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `color` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `status` tinyint(4) DEFAULT '1' COMMENT '1=Active,0=Inactive',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `vipscapl_providers`
--

INSERT INTO `vipscapl_providers` (`id`, `firstname`, `lastname`, `email`, `color`, `status`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 'Krishnakant', 'Pandya', 'krishnakant@demo.com', '#0e19ce', 1, '2020-02-25 12:44:24', '2020-05-18 10:43:41', NULL),
(2, 'Angelo', 'Sauer', 'angelo@demo.com', '#46ed0a', 1, '2020-02-25 12:50:09', '2020-05-18 10:43:59', NULL),
(3, 'Neal', 'Muller', 'neal@demo.com', '#ed0909', 1, '2020-02-25 12:50:27', '2020-05-18 10:44:13', NULL),
(4, 'Lorenz', 'Kuhic', 'lorenz@demo.com', '#ef860d', 1, '2020-02-25 12:50:46', '2020-05-18 10:44:26', NULL),
(5, 'Weston', 'Effertz', 'weston@gmail.com', '#b04f4f', 1, '2020-02-25 12:51:04', '2020-05-18 10:38:12', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `vipscapl_roles`
--

CREATE TABLE `vipscapl_roles` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `slug` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `description` text COLLATE utf8_unicode_ci,
  `status` enum('1','0') COLLATE utf8_unicode_ci NOT NULL DEFAULT '1' COMMENT '1=active 0=inactive',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `vipscapl_roles`
--

INSERT INTO `vipscapl_roles` (`id`, `name`, `slug`, `description`, `status`, `created_at`, `updated_at`) VALUES
(1, 'Admin', 'admin', 'User has access to all system functionality.', '1', NULL, NULL),
(2, 'Staff', 'staff', 'Staff role.', '1', NULL, NULL),
(3, 'Client', 'client', 'Client role.', '1', NULL, NULL),
(4, 'Administrative Coordinator', 'administrative_coordinator', 'Administrative coordinator role', '1', '2020-01-30 09:50:25', '2020-01-30 09:50:25'),
(5, 'Administrative Support Manager', 'administrative_support_manager', 'Administrative Support Manager', '1', '2020-01-30 09:52:42', '2020-01-30 09:52:42'),
(6, 'Software Engineer', 'software_engineer', 'Software Engineer role', '1', '2020-01-30 09:53:28', '2020-01-30 09:53:28'),
(7, 'Software Tester', 'software_tester', 'Software Tester&nbsp; role', '1', '2020-01-30 09:54:28', '2020-01-30 09:54:28'),
(8, 'Human Resources Manager', 'human_resources_manager', 'Human Resources Manager role', '1', '2020-01-30 09:54:53', '2020-01-30 09:54:53'),
(9, 'Trainer', 'trainer', 'Trainer&nbsp; tole', '1', '2020-01-30 09:55:12', '2020-01-30 09:55:12'),
(10, 'Employee', 'employee', 'Employee role', '1', '2020-01-30 09:55:33', '2020-01-30 09:55:33'),
(11, 'Customer Relationship Manager', 'customer_relationship_manager', 'Customer Relationship Manager role', '1', '2020-01-30 09:56:30', '2020-01-30 09:56:30'),
(12, 'Account Manager', 'account_manager', 'Account Manager Role', '1', '2020-01-30 09:56:51', '2020-01-30 09:56:51');

-- --------------------------------------------------------

--
-- Table structure for table `vipscapl_tasks`
--

CREATE TABLE `vipscapl_tasks` (
  `id` int(10) UNSIGNED NOT NULL,
  `parent_task_id` int(11) NOT NULL DEFAULT '0',
  `generated_id` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `project_id` int(10) UNSIGNED NOT NULL,
  `project_version` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `planned_start_date` date DEFAULT NULL,
  `planned_end_date` date DEFAULT NULL,
  `task_start_date` datetime DEFAULT NULL,
  `task_end_date` datetime DEFAULT NULL,
  `estimated_hours` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `status` tinyint(4) NOT NULL DEFAULT '1' COMMENT '1=Not Started,2=In Progress,3=On Hold,4=Waiting \n                        For Some one,5=Cancel,6=Completed',
  `priority` int(11) NOT NULL COMMENT '1=Urgent,2=Very High,3=High,4=Medium,5=Low',
  `progress` int(11) NOT NULL DEFAULT '0',
  `created_by` int(11) NOT NULL,
  `assign_to` tinyint(4) DEFAULT NULL,
  `description` text COLLATE utf8_unicode_ci,
  `order` bigint(20) NOT NULL DEFAULT '0',
  `notes` text COLLATE utf8_unicode_ci,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `custom_field_1` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `vipscapl_tasks`
--

INSERT INTO `vipscapl_tasks` (`id`, `parent_task_id`, `generated_id`, `name`, `project_id`, `project_version`, `planned_start_date`, `planned_end_date`, `task_start_date`, `task_end_date`, `estimated_hours`, `status`, `priority`, `progress`, `created_by`, `assign_to`, `description`, `order`, `notes`, `deleted_at`, `created_at`, `updated_at`, `custom_field_1`) VALUES
(1, 0, 'T0001', 'Implement hotel billing functionallity', 1, '1.0', '2020-02-01', '2020-02-01', '2020-02-01 00:00:00', '2020-02-01 00:00:00', '10:00', 1, 2, 84, 1, 13, NULL, 1, NULL, NULL, '2020-02-01 09:39:38', '2020-02-01 11:26:35', 'Test'),
(2, 0, 'T0002', 'Implement inventory billing functionallity.', 1, '1.0', '2020-02-02', '2020-02-21', '2020-03-19 10:51:14', '2020-03-19 10:51:14', NULL, 2, 1, 5, 1, 1, NULL, 10, NULL, NULL, '2020-02-01 09:55:08', '2020-02-11 04:27:19', 'test'),
(3, 0, 'T0003', 'Implement hotel billing functionallity.', 1, '1.0', '2020-02-04', '2020-02-04', '2020-02-04 00:00:00', '2020-02-04 00:00:00', NULL, 1, 2, 17, 1, 1, NULL, 1, NULL, NULL, '2020-02-01 09:59:20', '2020-02-11 04:27:19', 'test'),
(4, 0, 'T0004', 'Implement invoice calculation and listing.', 1, '1.0', '2020-02-04', '2020-02-04', '2020-02-04 00:00:00', '2020-02-04 00:00:00', NULL, 3, 3, 44, 1, 13, NULL, 4, NULL, NULL, '2020-02-01 10:08:58', '2020-02-01 11:12:27', 'test'),
(5, 0, 'T0005', 'Design invoice pdf and print format.', 1, '1.0', '2020-02-06', '2020-02-06', '2020-02-06 00:00:00', '2020-02-06 00:00:00', NULL, 4, 4, 56, 1, 13, NULL, 5, NULL, NULL, '2020-02-01 10:10:17', '2020-02-01 10:31:22', 'test'),
(6, 0, 'T0006', 'Implement global search functionality', 1, '1.0', '2020-02-04', '2020-02-04', '2020-02-04 00:00:00', '2020-02-04 00:00:00', NULL, 4, 5, 69, 1, 13, NULL, 6, NULL, NULL, '2020-02-01 10:13:28', '2020-02-01 10:18:39', 'test'),
(7, 0, 'T0007', 'Write migration script.', 2, '1.0', '2020-02-03', '2020-02-20', '2020-02-06 12:08:36', '2020-02-08 12:08:36', NULL, 6, 5, 100, 1, 13, NULL, 7, NULL, NULL, '2020-02-01 11:09:23', '2020-02-11 04:23:25', 'test'),
(8, 0, 'T0008', 'View Theme integration.', 2, '1.0', '2020-02-10', '2020-02-21', '2020-04-14 12:14:06', '2020-04-14 12:14:06', NULL, 6, 4, 100, 1, 13, NULL, 8, NULL, NULL, '2020-02-01 11:14:54', '2020-02-11 04:23:25', 'test'),
(9, 0, 'T0009', 'List all tender template', 2, '1.0', '2020-02-04', '2020-02-22', '2020-04-24 12:18:02', '2020-04-24 12:18:02', NULL, 6, 3, 100, 1, 13, NULL, 9, NULL, NULL, '2020-02-01 11:18:56', '2020-02-11 04:23:25', 'test'),
(10, 0, 'T00010', 'Defect module', 1, '1.0', '2020-02-04', '2020-02-20', '2020-02-06 16:59:08', '2020-02-07 16:59:08', NULL, 1, 3, 36, 1, 1, NULL, 2, NULL, NULL, '2020-02-03 16:01:53', '2020-02-11 04:27:19', 'test'),
(11, 0, 'T0011', 'Dynamic dropdown of project planner', 1, '1.0', '2020-02-03', '2020-02-03', '2020-02-03 17:02:47', '2020-02-03 17:02:47', NULL, 2, 5, 15, 1, 1, NULL, 11, NULL, NULL, '2020-02-03 16:03:09', '2020-02-03 16:03:09', 'test'),
(12, 0, 'T0012', 'Create a crud [ insert update ] in project planner', 1, '1.0', '2020-02-03', '2020-02-03', '2020-02-03 17:03:29', '2020-02-03 17:03:29', NULL, 6, 2, 100, 1, 1, NULL, 19, NULL, NULL, '2020-02-03 16:03:58', '2020-02-11 04:27:19', 'test'),
(13, 0, 'T0013', 'Design Project planner Dropdown issue', 1, '1.0', '2020-02-05', '2020-02-09', '2020-03-10 17:04:21', '2020-03-10 17:04:21', NULL, 6, 4, 100, 1, 1, NULL, 20, NULL, NULL, '2020-02-03 16:04:56', '2020-02-11 04:27:19', 'test'),
(14, 0, 'T0014', 'Create user login ,registration system', 1, '1.0', '2020-02-09', '2020-02-19', '2020-04-16 17:05:11', '2020-04-16 17:05:11', NULL, 6, 2, 60, 1, 1, NULL, 21, NULL, NULL, '2020-02-03 16:05:49', '2020-02-11 04:27:19', 'test'),
(15, 0, 'T0015', 'Form validation of incidents', 1, '1.0', '2020-02-12', '2020-02-18', '2020-04-20 17:05:58', '2020-04-20 17:05:58', NULL, 6, 1, 100, 1, 1, NULL, 22, NULL, NULL, '2020-02-03 16:06:57', '2020-02-11 04:27:19', 'test'),
(16, 0, 'T0016', 'Fixed issue in taskboard and check permission in all module', 1, '1.0', '2020-02-04', '2020-02-17', '2020-04-15 17:07:50', '2020-04-15 17:07:50', NULL, 2, 4, 43, 1, 1, NULL, 12, NULL, NULL, '2020-02-03 16:08:37', '2020-02-11 04:27:19', 'test'),
(17, 0, 'T0017', 'Meeting with chetna regarding office or projects.', 1, '1.0', '2020-02-16', '2020-02-24', '2020-05-01 17:09:03', '2020-05-01 17:09:03', NULL, 2, 2, 70, 1, 1, NULL, 13, NULL, NULL, '2020-02-03 16:09:44', '2020-02-11 04:27:19', 'test'),
(18, 0, 'T0018', 'Gather and add features/other content in documentation and broucher pages', 1, '1.0', '2020-02-18', '2020-02-24', '2020-04-27 17:10:01', '2020-04-27 17:10:01', NULL, 5, 4, 80, 1, 1, NULL, 14, NULL, NULL, '2020-02-03 16:11:02', '2020-02-11 04:42:29', 'test'),
(19, 0, 'T0019', 'Meeting with Chetna mam regarding project status', 1, '1.0', '2020-02-23', '2020-02-29', '2020-05-12 17:12:47', '2020-05-12 17:12:47', NULL, 2, 3, 85, 1, 1, NULL, 15, NULL, NULL, '2020-02-03 16:13:48', '2020-02-11 04:27:19', 'test'),
(20, 0, 'T0020', 'Add remaining tables and fixed design issue in dashboard page', 1, '1.0', '2020-02-26', '2020-02-29', '2020-05-14 17:14:09', '2020-05-14 17:14:09', NULL, 6, 3, 100, 1, 1, NULL, 23, NULL, NULL, '2020-02-03 16:14:49', '2020-02-11 04:27:19', 'test'),
(21, 0, 'T0021', 'Research and make lists of ERP modules for documentation and working on implements annoucment and meeting table on dashboard.', 1, '1.0', '2020-02-24', '2020-02-27', '2020-05-13 17:15:16', '2020-05-13 17:15:16', NULL, 6, 4, 100, 1, 1, NULL, 24, NULL, NULL, '2020-02-03 16:17:32', '2020-02-11 04:27:19', 'test'),
(22, 0, 'T0022', 'Meeting with Admins regarding office matters', 1, '1.0', '2020-02-23', '2020-02-26', '2020-05-08 17:18:40', '2020-05-08 17:18:40', NULL, 6, 2, 100, 1, 1, NULL, 25, NULL, NULL, '2020-02-03 16:19:48', '2020-02-11 04:27:19', 'test'),
(23, 0, 'T0023', 'Team Meeting', 1, '1.0', '2020-02-20', '2020-02-25', '2020-05-06 17:20:27', '2020-05-06 17:20:27', NULL, 6, 3, 100, 1, 1, NULL, 26, NULL, NULL, '2020-02-03 16:21:09', '2020-02-11 04:27:19', 'test'),
(24, 0, 'T0024', 'Discussions regarding gifts and Diwali celebrations', 1, '1.0', '2020-02-05', '2020-02-12', '2020-03-03 17:24:27', '2020-02-03 17:24:27', NULL, 6, 3, 100, 1, 1, NULL, 27, NULL, NULL, '2020-02-03 16:25:04', '2020-02-11 04:27:19', 'test'),
(25, 0, 'T0025', 'Prepare highchart demo for clients.', 1, '1.0', '2020-02-11', '2020-02-18', '2020-04-21 17:25:52', '2020-04-21 17:25:52', NULL, 2, 2, 21, 1, 1, NULL, 16, NULL, NULL, '2020-02-03 16:27:09', '2020-02-11 04:27:19', 'test'),
(26, 0, 'T0026', 'Meeting with Admins and Manjay regarding Site Templates', 1, '1.0', '2020-02-23', '2020-02-28', '2020-05-11 17:27:23', '2020-05-11 17:27:23', NULL, 6, 4, 100, 1, 1, NULL, 28, NULL, NULL, '2020-02-03 16:28:00', '2020-02-11 04:27:19', 'test'),
(27, 0, 'T0027', 'Administration:- CHeck static theme restora and check structure.', 1, '1.0', '2020-02-18', '2020-02-26', '2020-05-04 17:28:24', '2020-05-04 17:28:24', NULL, 2, 5, 41, 1, 1, NULL, 17, NULL, NULL, '2020-02-03 16:29:39', '2020-02-11 04:27:19', 'test'),
(28, 0, 'T0028', 'Diwali Celebrations', 1, '1.0', '2020-02-17', '2020-02-23', '2020-04-28 17:29:48', '2020-04-28 17:29:48', NULL, 5, 2, 33, 1, 1, NULL, 29, NULL, NULL, '2020-02-03 16:31:02', '2020-02-11 04:41:53', 'test'),
(29, 0, 'T0029', 'Fixed design issues and other functionalities issues in all modules.', 1, '1.0', '2020-02-15', '2020-02-17', '2020-04-23 17:31:11', '2020-04-23 17:31:11', NULL, 6, 1, 80, 1, 1, NULL, 30, NULL, NULL, '2020-02-03 16:32:02', '2020-02-11 04:27:19', 'test'),
(30, 0, 'T0030', 'Formate and redesign bugs and incidents pages', 1, '1.0', '2020-02-15', '2020-02-20', '2020-04-29 17:32:18', '2020-04-29 17:32:18', NULL, 2, 3, 3, 1, 1, NULL, 18, NULL, NULL, '2020-02-03 16:33:10', '2020-02-11 04:27:19', 'test'),
(31, 0, 'T0031', 'Meeting with Admins regarding Projects', 1, '1.0', '2020-02-17', '2020-02-26', '2020-05-05 17:34:03', '2020-05-05 17:34:03', NULL, 1, 5, 16, 1, 1, NULL, 3, NULL, NULL, '2020-02-03 16:34:50', '2020-02-11 04:27:19', 'test'),
(32, 0, 'T0032', 'Testing all pages and note issues related to design and guide employees.', 1, '1.0', '2020-02-14', '2020-02-18', '2020-04-22 17:36:01', '2020-04-22 17:36:01', NULL, 1, 1, 70, 1, 1, NULL, 4, NULL, NULL, '2020-02-03 16:36:48', '2020-02-11 04:27:19', 'test'),
(33, 0, 'T0033', 'Review and list bugs front end and backend.', 1, '1.0', '2020-02-17', '2020-02-24', '2020-04-30 17:37:08', '2020-04-30 17:37:08', NULL, 1, 5, 69, 1, 1, NULL, 5, NULL, NULL, '2020-02-03 16:37:59', '2020-02-11 04:27:19', 'test'),
(34, 0, 'T0034', 'Testing all pages and note issues related to design and upload theme.', 1, '1.0', '2020-02-19', '2020-02-27', '2020-05-07 17:38:20', '2020-05-07 17:38:20', NULL, 1, 1, 56, 1, 1, NULL, 6, NULL, NULL, '2020-02-03 16:38:58', '2020-02-11 04:27:19', 'test'),
(35, 0, 'T0035', 'Project setup in viral PC.', 1, '1.0', '2020-03-02', '2020-03-11', '2020-05-15 00:00:00', '2020-05-15 00:00:00', NULL, 1, 3, 68, 1, 1, NULL, 7, NULL, NULL, '2020-02-03 16:40:18', '2020-02-11 04:27:19', 'test'),
(36, 0, 'T0036', 'Create and setup stucture for documentation.', 1, '1.0', '2020-02-06', '2020-02-16', '2020-02-06 17:42:33', '2020-02-08 17:42:33', NULL, 1, 4, 33, 1, 1, NULL, 8, NULL, NULL, '2020-02-03 16:43:23', '2020-02-11 04:27:19', 'test'),
(37, 0, 'T0037', 'Working on fix PMs tool issue.', 1, '1.0', '2020-03-02', '2020-03-11', '2020-05-18 00:00:00', '2020-05-11 00:00:00', NULL, 1, 3, 79, 1, 1, NULL, 9, NULL, NULL, '2020-02-03 16:44:16', '2020-02-11 04:27:19', 'test'),
(38, 0, 'T0038', 'Upgrade system version', 1, '1.0', '2020-02-11', '2020-02-11', '2020-04-09 05:55:39', '2020-04-09 05:55:39', '02:00', 5, 5, 0, 13, 13, NULL, 38, NULL, NULL, '2020-02-11 04:56:49', '2020-02-11 04:56:49', 'test'),
(39, 0, 'T0039', 'Created post invoice listing.', 1, '1.0', '2020-02-11', '2020-02-11', '2020-04-10 17:36:21', '2020-04-10 17:36:21', '00:30', 1, 1, 50, 11, 11, NULL, 39, NULL, NULL, '2020-02-11 16:38:40', '2020-02-11 16:38:40', NULL),
(40, 0, 'T0040', 'Created script for migrate subscription.', 1, '1.0', '2020-02-11', '2020-02-11', '2020-04-08 00:00:00', '2020-04-08 00:00:00', '05:00', 2, 2, 50, 11, 11, NULL, 40, NULL, NULL, '2020-02-11 16:40:11', '2020-02-14 12:08:16', NULL),
(41, 0, 'T0041', 'Check invoice log and report.', 1, '1.0', '2020-02-11', '2020-02-11', '2020-04-13 17:40:26', '2020-04-13 17:40:26', '02:00', 6, 3, 100, 11, 11, NULL, 41, NULL, NULL, '2020-02-11 16:41:12', '2020-02-11 16:41:12', NULL),
(42, 0, 'T0042', 'File manager functionallity.', 1, '1.0', '2020-02-14', '2020-02-14', '2020-04-17 11:09:29', '2020-04-17 11:09:29', '10:00', 1, 1, 40, 1, 11, NULL, 42, NULL, NULL, '2020-02-14 10:10:46', '2020-02-14 10:10:46', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `vipscapl_task_attachments`
--

CREATE TABLE `vipscapl_task_attachments` (
  `id` int(10) UNSIGNED NOT NULL,
  `task_id` int(10) UNSIGNED NOT NULL,
  `file_name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `file_hash` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `file_description` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `vipscapl_task_comments`
--

CREATE TABLE `vipscapl_task_comments` (
  `id` int(10) UNSIGNED NOT NULL,
  `user_id` int(10) UNSIGNED NOT NULL,
  `task_id` int(10) UNSIGNED NOT NULL,
  `parent_id` int(11) NOT NULL DEFAULT '0',
  `comment` text COLLATE utf8_unicode_ci NOT NULL,
  `attachments` text COLLATE utf8_unicode_ci,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `vipscapl_task_user`
--

CREATE TABLE `vipscapl_task_user` (
  `task_id` int(10) UNSIGNED NOT NULL,
  `user_id` int(10) UNSIGNED NOT NULL,
  `view` tinyint(1) NOT NULL DEFAULT '1' COMMENT '0=No,1=Yes',
  `edit` tinyint(1) NOT NULL DEFAULT '0' COMMENT '0=No,1=Yes',
  `delete` tinyint(1) NOT NULL DEFAULT '0' COMMENT '0=No,1=Yes'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `vipscapl_task_user`
--

INSERT INTO `vipscapl_task_user` (`task_id`, `user_id`, `view`, `edit`, `delete`) VALUES
(1, 1, 1, 0, 0),
(1, 2, 1, 0, 0),
(1, 3, 1, 0, 0),
(1, 4, 1, 0, 0),
(1, 5, 1, 0, 0),
(1, 6, 1, 0, 0),
(1, 7, 1, 0, 0),
(1, 8, 1, 0, 0),
(1, 9, 1, 0, 0),
(1, 10, 1, 0, 0),
(1, 11, 1, 0, 0),
(1, 13, 1, 0, 0),
(2, 1, 1, 0, 0),
(2, 2, 1, 0, 0),
(2, 3, 1, 0, 0),
(2, 4, 1, 0, 0),
(2, 5, 1, 0, 0),
(2, 6, 1, 0, 0),
(2, 7, 1, 0, 0),
(2, 8, 1, 0, 0),
(2, 9, 1, 0, 0),
(2, 10, 1, 0, 0),
(2, 11, 1, 0, 0),
(2, 13, 1, 0, 0),
(3, 1, 1, 0, 0),
(3, 2, 1, 0, 0),
(3, 3, 1, 0, 0),
(3, 4, 1, 0, 0),
(3, 5, 1, 0, 0),
(3, 6, 1, 0, 0),
(3, 7, 1, 0, 0),
(3, 8, 1, 0, 0),
(3, 9, 1, 0, 0),
(3, 10, 1, 0, 0),
(3, 11, 1, 0, 0),
(3, 13, 1, 0, 0),
(4, 1, 1, 0, 0),
(4, 2, 1, 0, 0),
(4, 3, 1, 0, 0),
(4, 4, 1, 0, 0),
(4, 5, 1, 0, 0),
(4, 6, 1, 0, 0),
(4, 7, 1, 0, 0),
(4, 8, 1, 0, 0),
(4, 9, 1, 0, 0),
(4, 10, 1, 0, 0),
(4, 11, 1, 0, 0),
(4, 13, 1, 0, 0),
(5, 1, 1, 0, 0),
(5, 2, 1, 0, 0),
(5, 3, 1, 0, 0),
(5, 4, 1, 0, 0),
(5, 5, 1, 0, 0),
(5, 6, 1, 0, 0),
(5, 7, 1, 0, 0),
(5, 8, 1, 0, 0),
(5, 9, 1, 0, 0),
(5, 10, 1, 0, 0),
(5, 11, 1, 0, 0),
(5, 13, 1, 0, 0),
(6, 1, 1, 0, 0),
(6, 2, 1, 0, 0),
(6, 3, 1, 0, 0),
(6, 4, 1, 0, 0),
(6, 5, 1, 0, 0),
(6, 6, 1, 0, 0),
(6, 7, 1, 0, 0),
(6, 8, 1, 0, 0),
(6, 9, 1, 0, 0),
(6, 10, 1, 0, 0),
(6, 11, 1, 0, 0),
(6, 13, 1, 0, 0),
(7, 1, 1, 0, 0),
(7, 2, 1, 0, 0),
(7, 3, 1, 0, 0),
(7, 4, 1, 0, 0),
(7, 5, 1, 0, 0),
(7, 6, 1, 0, 0),
(7, 7, 1, 0, 0),
(7, 8, 1, 0, 0),
(7, 9, 1, 0, 0),
(7, 10, 1, 0, 0),
(7, 11, 1, 0, 0),
(7, 13, 1, 0, 0),
(8, 1, 1, 0, 0),
(8, 2, 1, 0, 0),
(8, 3, 1, 0, 0),
(8, 4, 1, 0, 0),
(8, 5, 1, 0, 0),
(8, 6, 1, 0, 0),
(8, 7, 1, 0, 0),
(8, 8, 1, 0, 0),
(8, 9, 1, 0, 0),
(8, 10, 1, 0, 0),
(8, 11, 1, 0, 0),
(8, 13, 1, 0, 0),
(9, 1, 1, 0, 0),
(9, 2, 1, 0, 0),
(9, 3, 1, 0, 0),
(9, 4, 1, 0, 0),
(9, 5, 1, 0, 0),
(9, 6, 1, 0, 0),
(9, 7, 1, 0, 0),
(9, 8, 1, 0, 0),
(9, 9, 1, 0, 0),
(9, 10, 1, 0, 0),
(9, 11, 1, 0, 0),
(9, 13, 1, 0, 0),
(10, 1, 1, 0, 0),
(10, 2, 1, 0, 0),
(10, 3, 1, 0, 0),
(10, 4, 1, 0, 0),
(10, 5, 1, 0, 0),
(10, 6, 1, 0, 0),
(10, 7, 1, 0, 0),
(10, 8, 1, 0, 0),
(10, 9, 1, 0, 0),
(10, 10, 1, 0, 0),
(10, 11, 1, 0, 0),
(10, 13, 1, 0, 0),
(11, 1, 1, 0, 0),
(11, 2, 1, 0, 0),
(11, 3, 1, 0, 0),
(11, 4, 1, 0, 0),
(11, 5, 1, 0, 0),
(11, 6, 1, 0, 0),
(11, 7, 1, 0, 0),
(11, 8, 1, 0, 0),
(11, 9, 1, 0, 0),
(11, 10, 1, 0, 0),
(11, 11, 1, 0, 0),
(11, 13, 1, 0, 0),
(12, 1, 1, 0, 0),
(12, 2, 1, 0, 0),
(12, 3, 1, 0, 0),
(12, 4, 1, 0, 0),
(12, 5, 1, 0, 0),
(12, 6, 1, 0, 0),
(12, 7, 1, 0, 0),
(12, 8, 1, 0, 0),
(12, 9, 1, 0, 0),
(12, 10, 1, 0, 0),
(12, 11, 1, 0, 0),
(12, 13, 1, 0, 0),
(13, 1, 1, 0, 0),
(13, 2, 1, 0, 0),
(13, 3, 1, 0, 0),
(13, 4, 1, 0, 0),
(13, 5, 1, 0, 0),
(13, 6, 1, 0, 0),
(13, 7, 1, 0, 0),
(13, 8, 1, 0, 0),
(13, 9, 1, 0, 0),
(13, 10, 1, 0, 0),
(13, 11, 1, 0, 0),
(13, 13, 1, 0, 0),
(14, 1, 1, 0, 0),
(14, 2, 1, 0, 0),
(14, 3, 1, 0, 0),
(14, 4, 1, 0, 0),
(14, 5, 1, 0, 0),
(14, 6, 1, 0, 0),
(14, 7, 1, 0, 0),
(14, 8, 1, 0, 0),
(14, 9, 1, 0, 0),
(14, 10, 1, 0, 0),
(14, 11, 1, 0, 0),
(14, 13, 1, 0, 0),
(15, 1, 1, 0, 0),
(15, 2, 1, 0, 0),
(15, 3, 1, 0, 0),
(15, 4, 1, 0, 0),
(15, 5, 1, 0, 0),
(15, 6, 1, 0, 0),
(15, 7, 1, 0, 0),
(15, 8, 1, 0, 0),
(15, 9, 1, 0, 0),
(15, 10, 1, 0, 0),
(15, 11, 1, 0, 0),
(15, 13, 1, 0, 0),
(16, 1, 1, 0, 0),
(16, 2, 1, 0, 0),
(16, 3, 1, 0, 0),
(16, 4, 1, 0, 0),
(16, 5, 1, 0, 0),
(16, 6, 1, 0, 0),
(16, 7, 1, 0, 0),
(16, 8, 1, 0, 0),
(16, 9, 1, 0, 0),
(16, 10, 1, 0, 0),
(16, 11, 1, 0, 0),
(16, 13, 1, 0, 0),
(17, 1, 1, 0, 0),
(17, 2, 1, 0, 0),
(17, 3, 1, 0, 0),
(17, 4, 1, 0, 0),
(17, 5, 1, 0, 0),
(17, 6, 1, 0, 0),
(17, 7, 1, 0, 0),
(17, 8, 1, 0, 0),
(17, 9, 1, 0, 0),
(17, 10, 1, 0, 0),
(17, 11, 1, 0, 0),
(17, 13, 1, 0, 0),
(18, 1, 1, 0, 0),
(18, 2, 1, 0, 0),
(18, 3, 1, 0, 0),
(18, 4, 1, 0, 0),
(18, 5, 1, 0, 0),
(18, 6, 1, 0, 0),
(18, 7, 1, 0, 0),
(18, 8, 1, 0, 0),
(18, 9, 1, 0, 0),
(18, 10, 1, 0, 0),
(18, 11, 1, 0, 0),
(18, 13, 1, 0, 0),
(19, 1, 1, 0, 0),
(19, 2, 1, 0, 0),
(19, 3, 1, 0, 0),
(19, 4, 1, 0, 0),
(19, 5, 1, 0, 0),
(19, 6, 1, 0, 0),
(19, 7, 1, 0, 0),
(19, 8, 1, 0, 0),
(19, 9, 1, 0, 0),
(19, 10, 1, 0, 0),
(19, 11, 1, 0, 0),
(19, 13, 1, 0, 0),
(20, 1, 1, 0, 0),
(20, 2, 1, 0, 0),
(20, 3, 1, 0, 0),
(20, 4, 1, 0, 0),
(20, 5, 1, 0, 0),
(20, 6, 1, 0, 0),
(20, 7, 1, 0, 0),
(20, 8, 1, 0, 0),
(20, 9, 1, 0, 0),
(20, 10, 1, 0, 0),
(20, 11, 1, 0, 0),
(20, 13, 1, 0, 0),
(21, 1, 1, 0, 0),
(21, 2, 1, 0, 0),
(21, 3, 1, 0, 0),
(21, 4, 1, 0, 0),
(21, 5, 1, 0, 0),
(21, 6, 1, 0, 0),
(21, 7, 1, 0, 0),
(21, 8, 1, 0, 0),
(21, 9, 1, 0, 0),
(21, 10, 1, 0, 0),
(21, 11, 1, 0, 0),
(21, 13, 1, 0, 0),
(22, 1, 1, 0, 0),
(22, 2, 1, 0, 0),
(22, 3, 1, 0, 0),
(22, 4, 1, 0, 0),
(22, 5, 1, 0, 0),
(22, 6, 1, 0, 0),
(22, 7, 1, 0, 0),
(22, 8, 1, 0, 0),
(22, 9, 1, 0, 0),
(22, 10, 1, 0, 0),
(22, 11, 1, 0, 0),
(22, 13, 1, 0, 0),
(23, 1, 1, 0, 0),
(23, 2, 1, 0, 0),
(23, 3, 1, 0, 0),
(23, 4, 1, 0, 0),
(23, 5, 1, 0, 0),
(23, 6, 1, 0, 0),
(23, 7, 1, 0, 0),
(23, 8, 1, 0, 0),
(23, 9, 1, 0, 0),
(23, 10, 1, 0, 0),
(23, 11, 1, 0, 0),
(23, 13, 1, 0, 0),
(24, 1, 1, 0, 0),
(24, 2, 1, 0, 0),
(24, 3, 1, 0, 0),
(24, 4, 1, 0, 0),
(24, 5, 1, 0, 0),
(24, 6, 1, 0, 0),
(24, 7, 1, 0, 0),
(24, 8, 1, 0, 0),
(24, 9, 1, 0, 0),
(24, 10, 1, 0, 0),
(24, 11, 1, 0, 0),
(24, 13, 1, 0, 0),
(25, 1, 1, 0, 0),
(25, 2, 1, 0, 0),
(25, 3, 1, 0, 0),
(25, 4, 1, 0, 0),
(25, 5, 1, 0, 0),
(25, 6, 1, 0, 0),
(25, 7, 1, 0, 0),
(25, 8, 1, 0, 0),
(25, 9, 1, 0, 0),
(25, 10, 1, 0, 0),
(25, 11, 1, 0, 0),
(25, 13, 1, 0, 0),
(26, 1, 1, 0, 0),
(26, 2, 1, 0, 0),
(26, 3, 1, 0, 0),
(26, 4, 1, 0, 0),
(26, 5, 1, 0, 0),
(26, 6, 1, 0, 0),
(26, 7, 1, 0, 0),
(26, 8, 1, 0, 0),
(26, 9, 1, 0, 0),
(26, 10, 1, 0, 0),
(26, 11, 1, 0, 0),
(26, 13, 1, 0, 0),
(27, 1, 1, 0, 0),
(27, 2, 1, 0, 0),
(27, 3, 1, 0, 0),
(27, 4, 1, 0, 0),
(27, 5, 1, 0, 0),
(27, 6, 1, 0, 0),
(27, 7, 1, 0, 0),
(27, 8, 1, 0, 0),
(27, 9, 1, 0, 0),
(27, 10, 1, 0, 0),
(27, 11, 1, 0, 0),
(27, 13, 1, 0, 0),
(28, 1, 1, 0, 0),
(28, 2, 1, 0, 0),
(28, 3, 1, 0, 0),
(28, 4, 1, 0, 0),
(28, 5, 1, 0, 0),
(28, 6, 1, 0, 0),
(28, 7, 1, 0, 0),
(28, 8, 1, 0, 0),
(28, 9, 1, 0, 0),
(28, 10, 1, 0, 0),
(28, 11, 1, 0, 0),
(28, 13, 1, 0, 0),
(29, 1, 1, 0, 0),
(29, 2, 1, 0, 0),
(29, 3, 1, 0, 0),
(29, 4, 1, 0, 0),
(29, 5, 1, 0, 0),
(29, 6, 1, 0, 0),
(29, 7, 1, 0, 0),
(29, 8, 1, 0, 0),
(29, 9, 1, 0, 0),
(29, 10, 1, 0, 0),
(29, 11, 1, 0, 0),
(29, 13, 1, 0, 0),
(30, 1, 1, 0, 0),
(30, 2, 1, 0, 0),
(30, 3, 1, 0, 0),
(30, 4, 1, 0, 0),
(30, 5, 1, 0, 0),
(30, 6, 1, 0, 0),
(30, 7, 1, 0, 0),
(30, 8, 1, 0, 0),
(30, 9, 1, 0, 0),
(30, 10, 1, 0, 0),
(30, 11, 1, 0, 0),
(30, 13, 1, 0, 0),
(31, 1, 1, 0, 0),
(31, 2, 1, 0, 0),
(31, 3, 1, 0, 0),
(31, 4, 1, 0, 0),
(31, 5, 1, 0, 0),
(31, 6, 1, 0, 0),
(31, 7, 1, 0, 0),
(31, 8, 1, 0, 0),
(31, 9, 1, 0, 0),
(31, 10, 1, 0, 0),
(31, 11, 1, 0, 0),
(31, 13, 1, 0, 0),
(32, 1, 1, 0, 0),
(32, 2, 1, 0, 0),
(32, 3, 1, 0, 0),
(32, 4, 1, 0, 0),
(32, 5, 1, 0, 0),
(32, 6, 1, 0, 0),
(32, 7, 1, 0, 0),
(32, 8, 1, 0, 0),
(32, 9, 1, 0, 0),
(32, 10, 1, 0, 0),
(32, 11, 1, 0, 0),
(32, 13, 1, 0, 0),
(33, 1, 1, 0, 0),
(33, 2, 1, 0, 0),
(33, 3, 1, 0, 0),
(33, 4, 1, 0, 0),
(33, 5, 1, 0, 0),
(33, 6, 1, 0, 0),
(33, 7, 1, 0, 0),
(33, 8, 1, 0, 0),
(33, 9, 1, 0, 0),
(33, 10, 1, 0, 0),
(33, 11, 1, 0, 0),
(33, 13, 1, 0, 0),
(34, 1, 1, 0, 0),
(34, 2, 1, 0, 0),
(34, 3, 1, 0, 0),
(34, 4, 1, 0, 0),
(34, 5, 1, 0, 0),
(34, 6, 1, 0, 0),
(34, 7, 1, 0, 0),
(34, 8, 1, 0, 0),
(34, 9, 1, 0, 0),
(34, 10, 1, 0, 0),
(34, 11, 1, 0, 0),
(34, 13, 1, 0, 0),
(35, 1, 1, 0, 0),
(35, 2, 1, 0, 0),
(35, 3, 1, 0, 0),
(35, 4, 1, 0, 0),
(35, 5, 1, 0, 0),
(35, 6, 1, 0, 0),
(35, 7, 1, 0, 0),
(35, 8, 1, 0, 0),
(35, 9, 1, 0, 0),
(35, 10, 1, 0, 0),
(35, 11, 1, 0, 0),
(35, 13, 1, 0, 0),
(36, 1, 1, 0, 0),
(36, 2, 1, 0, 0),
(36, 3, 1, 0, 0),
(36, 4, 1, 0, 0),
(36, 5, 1, 0, 0),
(36, 6, 1, 0, 0),
(36, 7, 1, 0, 0),
(36, 8, 1, 0, 0),
(36, 9, 1, 0, 0),
(36, 10, 1, 0, 0),
(36, 11, 1, 0, 0),
(36, 13, 1, 0, 0),
(37, 1, 1, 0, 0),
(37, 2, 1, 0, 0),
(37, 3, 1, 0, 0),
(37, 4, 1, 0, 0),
(37, 5, 1, 0, 0),
(37, 6, 1, 0, 0),
(37, 7, 1, 0, 0),
(37, 8, 1, 0, 0),
(37, 9, 1, 0, 0),
(37, 10, 1, 0, 0),
(37, 11, 1, 0, 0),
(37, 13, 1, 0, 0),
(38, 1, 1, 0, 0),
(38, 2, 1, 0, 0),
(38, 3, 1, 0, 0),
(38, 4, 1, 0, 0),
(38, 5, 1, 0, 0),
(38, 6, 1, 0, 0),
(38, 7, 1, 0, 0),
(38, 8, 1, 0, 0),
(38, 9, 1, 0, 0),
(38, 10, 1, 0, 0),
(38, 11, 1, 0, 0),
(38, 13, 1, 0, 0),
(39, 1, 1, 0, 0),
(39, 2, 1, 0, 0),
(39, 3, 1, 0, 0),
(39, 4, 1, 0, 0),
(39, 5, 1, 0, 0),
(39, 6, 1, 0, 0),
(39, 7, 1, 0, 0),
(39, 8, 1, 0, 0),
(39, 9, 1, 0, 0),
(39, 10, 1, 0, 0),
(39, 11, 1, 0, 0),
(39, 13, 1, 0, 0),
(40, 1, 1, 0, 0),
(40, 2, 1, 0, 0),
(40, 3, 1, 0, 0),
(40, 4, 1, 0, 0),
(40, 5, 1, 0, 0),
(40, 6, 1, 0, 0),
(40, 7, 1, 0, 0),
(40, 8, 1, 0, 0),
(40, 9, 1, 0, 0),
(40, 10, 1, 0, 0),
(40, 11, 1, 0, 0),
(40, 13, 1, 0, 0),
(41, 1, 1, 0, 0),
(41, 2, 1, 0, 0),
(41, 3, 1, 0, 0),
(41, 4, 1, 0, 0),
(41, 5, 1, 0, 0),
(41, 6, 1, 0, 0),
(41, 7, 1, 0, 0),
(41, 8, 1, 0, 0),
(41, 9, 1, 0, 0),
(41, 10, 1, 0, 0),
(41, 11, 1, 0, 0),
(41, 13, 1, 0, 0),
(42, 1, 1, 0, 0),
(42, 2, 1, 0, 0),
(42, 3, 1, 0, 0),
(42, 4, 1, 0, 0),
(42, 5, 1, 0, 0),
(42, 6, 1, 0, 0),
(42, 7, 1, 0, 0),
(42, 8, 1, 0, 0),
(42, 9, 1, 0, 0),
(42, 10, 1, 0, 0),
(42, 11, 1, 0, 0),
(42, 13, 1, 0, 0);

-- --------------------------------------------------------

--
-- Table structure for table `vipscapl_teams`
--

CREATE TABLE `vipscapl_teams` (
  `id` int(10) UNSIGNED NOT NULL,
  `team_name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `team_leader` int(11) NOT NULL,
  `description` text COLLATE utf8_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `vipscapl_teams`
--

INSERT INTO `vipscapl_teams` (`id`, `team_name`, `team_leader`, `description`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 'Management Team', 1, 'Management Team', '2020-01-30 11:46:57', '2020-01-30 11:46:57', NULL),
(2, 'Developer Team', 1, 'Developer Team', '2020-01-30 11:50:36', '2020-01-30 11:50:36', NULL),
(3, 'Designer Team', 1, '<span style=\"color: rgb(33, 37, 41); font-size: 14px; background-color: rgba(0, 0, 0, 0.075);\">Designer Team&nbsp;</span>', '2020-01-30 11:51:31', '2020-01-30 11:51:31', NULL),
(4, 'Administration Team', 1, '<span style=\"color: rgb(33, 37, 41); font-size: 14px;\">Administration Team&nbsp;</span>', '2020-01-30 11:52:14', '2020-01-30 11:52:14', NULL),
(5, 'QA Team', 1, 'QA Team', '2020-01-30 12:02:04', '2020-01-30 12:02:04', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `vipscapl_teams_members`
--

CREATE TABLE `vipscapl_teams_members` (
  `id` int(10) UNSIGNED NOT NULL,
  `team_id` int(10) UNSIGNED NOT NULL,
  `user_id` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `vipscapl_teams_members`
--

INSERT INTO `vipscapl_teams_members` (`id`, `team_id`, `user_id`) VALUES
(1, 1, 1),
(2, 1, 2),
(3, 2, 1),
(4, 2, 2),
(5, 2, 3),
(6, 2, 4),
(7, 2, 5),
(8, 2, 6),
(9, 2, 7),
(10, 2, 8),
(11, 2, 9),
(12, 2, 10),
(13, 2, 13),
(14, 3, 1),
(15, 3, 2),
(16, 3, 3),
(17, 3, 4),
(18, 3, 5),
(19, 3, 6),
(20, 3, 7),
(21, 3, 8),
(22, 3, 9),
(23, 3, 10),
(24, 3, 13),
(25, 4, 1),
(26, 4, 2),
(27, 5, 1),
(28, 5, 2),
(29, 5, 13);

-- --------------------------------------------------------

--
-- Table structure for table `vipscapl_timesheets`
--

CREATE TABLE `vipscapl_timesheets` (
  `id` int(10) UNSIGNED NOT NULL,
  `project_id` int(11) DEFAULT NULL,
  `module_id` int(11) DEFAULT NULL,
  `module_related_id` int(11) DEFAULT NULL,
  `start_time` datetime NOT NULL,
  `end_time` datetime NOT NULL,
  `decimal_time` decimal(8,2) NOT NULL,
  `hour_time` varchar(10) COLLATE utf8_unicode_ci NOT NULL,
  `note` text COLLATE utf8_unicode_ci,
  `created_user_id` int(10) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `vipscapl_todos`
--

CREATE TABLE `vipscapl_todos` (
  `id` int(10) UNSIGNED NOT NULL,
  `user_id` int(10) UNSIGNED NOT NULL,
  `module_id` int(11) NOT NULL,
  `module_related_id` int(11) DEFAULT NULL,
  `description` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `due_date` date DEFAULT NULL,
  `order` int(11) DEFAULT NULL,
  `status` tinyint(4) NOT NULL DEFAULT '1' COMMENT '1=Open, 2=Completed',
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `vipscapl_todos`
--

INSERT INTO `vipscapl_todos` (`id`, `user_id`, `module_id`, `module_related_id`, `description`, `due_date`, `order`, `status`, `deleted_at`, `created_at`, `updated_at`) VALUES
(1, 1, 1, 1, 'Send documents to vips patel.', '2020-05-18', 0, 1, NULL, '2020-05-18 08:51:31', '2020-05-18 08:51:31'),
(2, 1, 2, 37, 'Fixed auto reload dashboard issue.', '2020-05-19', 1, 1, NULL, '2020-05-18 08:53:57', '2020-05-18 08:53:57'),
(3, 1, 3, 23, 'Add previous bill amount in invoice.', '2020-05-18', 2, 1, NULL, '2020-05-18 08:55:20', '2020-05-18 08:55:20'),
(4, 1, 4, 14, 'Verify group service termination API.', '2020-05-20', 3, 1, NULL, '2020-05-18 08:57:55', '2020-05-18 08:58:06'),
(5, 1, 1, 5, 'Prepare the production environment.', '2020-05-18', 4, 2, NULL, '2020-05-18 09:02:32', '2020-05-18 09:02:39'),
(6, 1, 2, 36, 'Prepare testing doc file structure.', '2020-05-19', 5, 2, NULL, '2020-05-18 09:04:29', '2020-05-18 09:04:37'),
(7, 13, 1, 1, 'Send documents to vips patel.', '2020-05-18', 6, 1, NULL, '2020-05-18 10:50:54', '2020-05-18 10:50:54'),
(8, 13, 2, 38, 'Backup source code and database.', '2020-05-19', 7, 1, NULL, '2020-05-18 10:51:55', '2020-05-18 10:51:55'),
(9, 13, 3, 26, 'Debuge incoide generation process.', '2020-05-20', 8, 1, NULL, '2020-05-18 10:52:34', '2020-05-18 10:52:34'),
(10, 13, 4, 19, 'Check different testing credintial.', '2020-05-21', 9, 1, NULL, '2020-05-18 10:53:13', '2020-05-18 10:53:13'),
(11, 13, 1, 5, 'Prepare the local environment.', '2020-05-18', 10, 2, NULL, '2020-05-18 10:58:44', '2020-05-18 10:59:07'),
(12, 11, 1, 1, 'Send documents to vips patel.', '2020-05-18', 11, 1, NULL, '2020-05-18 11:14:32', '2020-05-18 11:14:32'),
(13, 11, 2, 42, 'Upload documents.', '2020-05-18', 12, 1, NULL, '2020-05-18 11:15:15', '2020-05-18 11:15:15'),
(14, 11, 3, 25, 'Report invoice number with reason.', '2020-05-18', 13, 1, NULL, '2020-05-18 11:16:46', '2020-05-18 11:16:46'),
(15, 11, 4, 18, 'Report customer count issue.', '2020-05-18', 14, 1, NULL, '2020-05-18 11:17:53', '2020-05-18 11:17:53'),
(16, 11, 1, 5, 'lorem ipsum dolor sit amet consectetuer adipiscing elita', '2020-05-18', 15, 2, NULL, '2020-05-18 11:19:43', '2020-05-18 11:19:50');

-- --------------------------------------------------------

--
-- Table structure for table `vipscapl_todo_user_pivot`
--

CREATE TABLE `vipscapl_todo_user_pivot` (
  `todo_id` int(10) UNSIGNED NOT NULL,
  `user_id` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `vipscapl_todo_user_pivot`
--

INSERT INTO `vipscapl_todo_user_pivot` (`todo_id`, `user_id`) VALUES
(1, 1),
(1, 13),
(2, 1),
(2, 13),
(3, 1),
(3, 13),
(4, 1),
(4, 13),
(5, 1),
(5, 13),
(6, 1),
(6, 13),
(7, 1),
(7, 13),
(8, 1),
(8, 13),
(9, 11),
(9, 13),
(9, 14),
(10, 11),
(10, 13),
(11, 3),
(11, 11),
(11, 13),
(11, 14);

-- --------------------------------------------------------

--
-- Table structure for table `vipscapl_translations`
--

CREATE TABLE `vipscapl_translations` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `language` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `icon` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `status` tinyint(4) NOT NULL DEFAULT '1' COMMENT '1=Active, 0=Inactive',
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `vipscapl_translations`
--

INSERT INTO `vipscapl_translations` (`id`, `name`, `language`, `icon`, `status`, `deleted_at`, `created_at`, `updated_at`) VALUES
(1, 'English', 'en', 'United-States.png', 1, NULL, NULL, NULL),
(2, 'Chinese', 'zh', 'China.png', 1, NULL, NULL, NULL),
(3, 'Czech', 'cs', 'Czech-Republic.png', 1, NULL, NULL, NULL),
(4, 'French', 'fr', 'France.png', 1, NULL, NULL, NULL),
(5, 'German', 'de', 'Germany.png', 1, NULL, NULL, NULL),
(6, 'Italian', 'it', 'Italy.png', 1, NULL, NULL, NULL),
(7, 'Japanese', 'ja', 'Japan.png', 1, NULL, NULL, NULL),
(8, 'Russian', 'ru', 'Russia.png', 1, NULL, NULL, NULL),
(9, 'Spanish', 'es', 'Spain.png', 1, NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `vipscapl_users`
--

CREATE TABLE `vipscapl_users` (
  `id` int(10) UNSIGNED NOT NULL,
  `user_generated_id` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `firstname` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `lastname` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `username` varchar(160) COLLATE utf8_unicode_ci NOT NULL,
  `email` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `password` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `is_super_admin` tinyint(1) NOT NULL DEFAULT '0',
  `is_client` tinyint(1) NOT NULL DEFAULT '0',
  `is_active` tinyint(1) NOT NULL DEFAULT '0' COMMENT '1=active 0=inactive',
  `email_verified` enum('1','0') COLLATE utf8_unicode_ci NOT NULL DEFAULT '0' COMMENT '1=verified 0=unverified',
  `email_verification_code` varchar(60) COLLATE utf8_unicode_ci DEFAULT NULL,
  `online_status` tinyint(1) NOT NULL DEFAULT '0' COMMENT '1=online 0=offline',
  `avatar` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `last_ip` varchar(45) COLLATE utf8_unicode_ci DEFAULT NULL,
  `last_login` datetime DEFAULT NULL,
  `emp_id` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `city` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `country` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `language` varchar(40) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'en',
  `address` varchar(64) COLLATE utf8_unicode_ci DEFAULT NULL,
  `phone` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  `mobile` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  `skype` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `joining_date` date DEFAULT NULL,
  `gender` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `dob` date DEFAULT NULL,
  `maritial_status` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `father_name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `mother_name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `permission` text COLLATE utf8_unicode_ci,
  `remember_token` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `vipscapl_users`
--

INSERT INTO `vipscapl_users` (`id`, `user_generated_id`, `firstname`, `lastname`, `username`, `email`, `password`, `is_super_admin`, `is_client`, `is_active`, `email_verified`, `email_verification_code`, `online_status`, `avatar`, `last_ip`, `last_login`, `emp_id`, `city`, `country`, `language`, `address`, `phone`, `mobile`, `skype`, `joining_date`, `gender`, `dob`, `maritial_status`, `father_name`, `mother_name`, `permission`, `remember_token`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 'USR0001', 'Vipul', 'Patel', 'vipspatel', 'admin@gmail.com', '$2y$10$gK0gu/WzTD6zlmw4vL1Ei.s9RMd9BD0bYLeTT8agGBI.K4W1ZKEZO', 1, 0, 1, '1', NULL, 0, NULL, '::1', '2020-05-18 16:50:47', 'EMP000001', NULL, '82', 'en', NULL, NULL, NULL, NULL, '2020-02-11', 'male', '2020-02-11', NULL, NULL, NULL, '\"all\"', NULL, '2020-01-30 09:41:53', '2020-05-18 11:22:40', NULL),
(2, 'USR0002', 'Elodia', 'Weisz', 'elodiaweisz', 'elodiaweisz@gmail.com', '$2y$10$p44DpgXcDUCKz7OyxMJqYO0grz89W9GvVx4zBWkmnp7utznjgThhS', 0, 0, 1, '1', 'P6tO50Sxv4laGdr3a9bgaBtqLPDiAgiBXK3W7kFg', 0, '1-man.png', NULL, NULL, 'EMP000002', NULL, '42', 'en', NULL, '8985-985-9896', '8996666666', 'elodiaweisz.skype', '2020-05-18', NULL, '2020-05-18', NULL, NULL, NULL, '\"{\\\"1\\\":[\\\"view\\\",\\\"delete\\\",\\\"edit\\\"]}\"', NULL, '2020-01-30 10:22:34', '2020-05-18 08:39:00', NULL),
(3, 'USR0003', 'Raeann', 'Haner', 'raeannhaner', 'raeannhaner@gmail.com', '$2y$10$CyER6jDAgp/YgI1xACTSneAl7KXPbDpxe/.QCrO.8.tDv3ocgwP.m', 0, 0, 1, '1', 'nWbiT6huMeCX0ZyCdueziS1b4Ds7yD7vrTusKKxR', 0, '1-woman.png', NULL, NULL, 'EMP000003', NULL, '198', 'en', NULL, '9998288608', '9726693398', 'raeannhaner.skype', '2020-05-18', NULL, '2020-05-18', NULL, NULL, NULL, '\"{\\\"1\\\":[\\\"view\\\",\\\"delete\\\",\\\"edit\\\"]}\"', NULL, '2020-01-30 10:27:47', '2020-05-18 08:39:29', NULL),
(4, 'USR0004', 'Junie', 'Landa', 'junielanda', 'junielanda@gmail.com', '$2y$10$Pr/sg2y6lQGTXzo1EdySG.il0iqnTWHkowKYOW/ff2/o459PmevCW', 0, 0, 0, '0', 'a4nMUv7ovRe9kjdqlbwJbOaFIi4GgMkQPcDMWx37', 0, '2-man.png', NULL, NULL, 'EMP000004', NULL, '15', 'en', NULL, NULL, NULL, 'junielanda.skype', '2020-05-18', NULL, '2020-05-18', NULL, NULL, NULL, '\"{\\\"1\\\":[\\\"view\\\",\\\"delete\\\",\\\"edit\\\"]}\"', NULL, '2020-01-30 10:29:43', '2020-05-18 08:40:42', NULL),
(5, 'USR0005', 'Denim', 'Leak', 'denimleak', 'denimleak@gmail.com', '$2y$10$ROOIOEH8uEj4v3bV3.OwbOvZW6GQi4lmVMSAbhu3g6v.fJmvDtsAW', 0, 0, 1, '0', 'lWZRqOp0t9Q2XDp5mH1IMqmvUVCYSZiHIFlVsJXe', 0, '3-man.png', NULL, NULL, 'EMP000005', NULL, '39', 'en', NULL, '8985-985-9896', '8996666666', 'denimleak.skype', '2020-05-18', NULL, '2020-05-18', NULL, NULL, NULL, '\"{\\\"1\\\":[\\\"view\\\",\\\"delete\\\",\\\"edit\\\"]}\"', NULL, '2020-01-30 10:32:32', '2020-05-18 08:41:20', NULL),
(6, 'USR0006', 'Helene', 'Kramer', 'helenekramer', 'helenekramer@gmail.com', '$2y$10$ufdQ6Utuk12kL9aotzqiV.bGvECf3HwvV5onn.o/ZDqcNSa.8K/Ly', 0, 0, 1, '0', 'fttYODhzFnXSEAuXp9pVsA6foxJQ9jwc1usGta8V', 0, '2-woman.png', NULL, NULL, 'EMP000006', NULL, '59', 'en', NULL, '8985-985-9896', '8996666666', 'helenekramer.skype', '2020-05-18', NULL, '2020-05-18', NULL, NULL, NULL, '\"{\\\"1\\\":[\\\"view\\\",\\\"delete\\\",\\\"edit\\\"]}\"', NULL, '2020-01-30 10:34:47', '2020-05-18 08:41:57', NULL),
(7, 'USR0007', 'Troy', 'Russo', 'troyrusso', 'troyrusso@gmail.com', '$2y$10$xzPswCGpdXMlrIKNezJQIupEWbd0PAmYh9bfgxuiEweLHmDBFrKCy', 0, 0, 1, '0', 'UkCiLbmfUnOM4sQvcRHqLdP04nmSgXJl8RczqYNB', 0, '4-man.png', NULL, NULL, 'EMP000007', NULL, '3', 'en', NULL, '8985-985-9896', '8996666666', 'troyrusso,skype', '2020-05-18', NULL, '2020-05-18', NULL, NULL, NULL, '\"{\\\"1\\\":[\\\"view\\\",\\\"delete\\\",\\\"edit\\\"]}\"', NULL, '2020-01-30 10:38:19', '2020-05-18 08:42:33', NULL),
(8, 'USR0008', 'Howard', 'Martinez', 'howardmartinez', 'howardmartinez@gmail.com', '$2y$10$irDpVe68ea8O/DQ0LRp1ueGg50TR36NaLmvOowTB6OgrkFYOgMr/.', 0, 0, 1, '0', 'tyDSICnwxvbNKuADpt8fvhNE1QmbkAyDJSonWbgf', 0, '3-woman.png', NULL, NULL, 'EMP000008', NULL, '8', 'en', NULL, '8985-985-9896', '8996666666', 'howardmartinez.skype', '2020-05-18', NULL, '2020-05-18', NULL, NULL, NULL, '\"{\\\"1\\\":[\\\"view\\\",\\\"delete\\\",\\\"edit\\\"]}\"', NULL, '2020-01-30 10:42:19', '2020-05-18 08:45:45', NULL),
(9, 'USR0009', 'Harry', 'Bennett', 'harrybennett', 'harrybennett@gmail.com', '$2y$10$Ob6rN59z0qxIVsGQenha3udWf1c8gaIU8lJ2sqYWCLdpadvIWdWIu', 0, 0, 0, '0', 'QjdtGl09Cko1zisntRx79awofTbIDUr1co7YbEgJ', 0, '5-man.png', NULL, NULL, 'EMP000009', NULL, '5', 'en', NULL, '8985-985-9896', '8996666666', 'harrybennett.skype', '2020-05-18', NULL, '2020-05-18', NULL, NULL, NULL, '\"{\\\"1\\\":[\\\"view\\\",\\\"delete\\\",\\\"edit\\\"]}\"', NULL, '2020-01-30 10:46:12', '2020-05-18 08:46:11', NULL),
(10, 'USR00010', 'Gilbert', 'Alexander', 'gilbert.alexander', 'gilbert@chetsapp.com', '$2y$10$nfWW//O0Ea3ONFvztHWs/.e8c5.A2p8zmOrv7Xij0HbGbYXXyzOIm', 0, 0, 1, '0', 'em1CfBy5jfuniFp84FX9YXde7GSX0rIGkeNqhnUL', 0, '4-woman.png', NULL, NULL, 'EMP000010', NULL, '8', 'en', NULL, '8985-985-9896', '8996666666', 'gilbert.alexander', '2020-05-18', NULL, '2020-05-18', NULL, NULL, NULL, '\"{\\\"1\\\":[\\\"view\\\",\\\"delete\\\",\\\"edit\\\"]}\"', NULL, '2020-01-30 10:52:49', '2020-05-18 08:46:40', NULL),
(11, 'USR0011', 'Eric', 'Serna', 'eric.serna', 'client@gmail.com', '$2y$10$g3DZxw15mOBTQOanO8ltkOAaC/ASjFu2GsffASgSDo/9KC7kSKRi.', 0, 1, 1, '1', 'lto4V6JzLfhbnnyg4DoGQcoqGsclcWxyWqO1TFUy', 1, NULL, '::1', '2020-05-18 16:52:58', 'EMP000011', NULL, '3', 'en', NULL, '8985-985-9896', '8996666666', 'eric.serna', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020-01-30 11:08:01', '2020-05-18 11:22:58', NULL),
(12, 'USR0012', 'Simone', 'Griffin', 'simone.griffin', 'simone@gmail.com', '$2y$10$cJSDp9AB6WpWF1mVfzlDA.RKjakDUkCXBX5nLTlMeejpt0/NMSLui', 0, 1, 1, '1', 'zPMHnxK0Acsw1md1aUJ5roOb39ROcYaxZdd7HAs1', 0, '4-man.png', NULL, NULL, 'EMP000012', NULL, '8', 'en', NULL, '8985-985-9896', '8996666666', 'simone.griffin', '2020-05-18', NULL, '2020-05-18', NULL, NULL, NULL, NULL, NULL, '2020-01-30 11:20:29', '2020-05-18 10:35:54', NULL),
(13, 'USR0013', 'Kevin', 'Bailey', 'kevin.bailey', 'user@gmail.com', '$2y$10$3JH0nxCGoHYesPVO8W3iJefkDF7bpHWs14L7U75QBVHsYDuP68bY2', 0, 0, 1, '1', 'FQAw400x4kCh11PVjmtaBwkxfwYXRSADl0oomSE7', 0, '6-man.png', '::1', '2020-05-18 16:33:00', 'EMP000013', NULL, '5', 'en', NULL, '8985-985-9896', '8996666666', 'kevin.bailey', '2020-02-11', 'male', '2020-02-11', 'married', NULL, NULL, '\"{\\\"1\\\":[\\\"view\\\",\\\"delete\\\",\\\"edit\\\"]}\"', NULL, '2020-01-30 11:25:59', '2020-05-18 11:13:04', NULL),
(14, 'USR0014', 'Milan', 'Unjiya', 'milan.unjiya', 'milan@chetsapp.com', '$2y$10$MMq5KIp3E3V7KbubEbDHp.G6s2NRKroS7tr4/YsK29/cRrKig44hG', 0, 0, 1, '1', '75j3TDhqkTM2aLgktTPauMfYC5i3AxBRcEwK9mAU', 0, '4-man.png', NULL, NULL, 'EMP0015', NULL, '100', 'en', NULL, NULL, NULL, NULL, '2020-05-18', NULL, '2020-05-18', NULL, NULL, NULL, '\"all\"', NULL, '2020-02-03 07:44:34', '2020-05-18 08:47:50', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `vipscapl_user_activities`
--

CREATE TABLE `vipscapl_user_activities` (
  `id` int(10) UNSIGNED NOT NULL,
  `user_id` int(10) UNSIGNED NOT NULL,
  `module` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `self_parent_id` int(11) DEFAULT NULL,
  `module_field_id` int(11) NOT NULL,
  `diff_for_humans` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `action` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `description` text COLLATE utf8_unicode_ci NOT NULL,
  `ip_address` varchar(45) COLLATE utf8_unicode_ci NOT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `vipscapl_user_activities`
--

INSERT INTO `vipscapl_user_activities` (`id`, `user_id`, `module`, `self_parent_id`, `module_field_id`, `diff_for_humans`, `action`, `description`, `ip_address`, `deleted_at`, `created_at`, `updated_at`) VALUES
(1, 1, 'Role', NULL, 4, '', 'POST', 'Role informantion added : <b>Administrative Coordinator</b>', '127.0.0.1', NULL, '2020-01-30 09:50:25', '2020-01-30 09:50:25'),
(2, 1, 'Role', NULL, 5, '', 'POST', 'Role informantion added : <b>Administrative Support Manager</b>', '127.0.0.1', NULL, '2020-01-30 09:52:42', '2020-01-30 09:52:42'),
(3, 1, 'Role', NULL, 6, '', 'POST', 'Role informantion added : <b>Software Engineer</b>', '127.0.0.1', NULL, '2020-01-30 09:53:28', '2020-01-30 09:53:28'),
(4, 1, 'Role', NULL, 7, '', 'POST', 'Role informantion added : <b>Software Tester</b>', '127.0.0.1', NULL, '2020-01-30 09:54:28', '2020-01-30 09:54:28'),
(5, 1, 'Role', NULL, 8, '', 'POST', 'Role informantion added : <b>Human Resources Manager</b>', '127.0.0.1', NULL, '2020-01-30 09:54:53', '2020-01-30 09:54:53'),
(6, 1, 'Role', NULL, 9, '', 'POST', 'Role informantion added : <b>Trainer</b>', '127.0.0.1', NULL, '2020-01-30 09:55:12', '2020-01-30 09:55:12'),
(7, 1, 'Role', NULL, 10, '', 'POST', 'Role informantion added : <b>Employee</b>', '127.0.0.1', NULL, '2020-01-30 09:55:33', '2020-01-30 09:55:33'),
(8, 1, 'Role', NULL, 11, '', 'POST', 'Role informantion added : <b>Customer Relationship Manager</b>', '127.0.0.1', NULL, '2020-01-30 09:56:30', '2020-01-30 09:56:30'),
(9, 1, 'Role', NULL, 12, '', 'POST', 'Role informantion added : <b>Account Manager</b>', '127.0.0.1', NULL, '2020-01-30 09:56:51', '2020-01-30 09:56:51'),
(10, 1, 'Department', NULL, 2, '', 'POST', 'Department informantion added : <b>IT</b>', '127.0.0.1', NULL, '2020-01-30 10:00:46', '2020-01-30 10:00:46'),
(11, 1, 'Department', NULL, 3, '', 'POST', 'Department informantion added : <b>PM</b>', '127.0.0.1', NULL, '2020-01-30 10:01:55', '2020-01-30 10:01:55'),
(12, 1, 'Department', NULL, 4, '', 'POST', 'Department informantion added : <b>Finance</b>', '127.0.0.1', NULL, '2020-01-30 10:02:38', '2020-01-30 10:02:38'),
(13, 1, 'Department', NULL, 1, '', 'PUT', 'Department informantion updated : <b>Administration</b>', '127.0.0.1', NULL, '2020-01-30 10:02:56', '2020-01-30 10:02:56'),
(14, 1, 'Department', NULL, 1, '', 'PUT', 'Department informantion updated : <b>Administration</b>', '127.0.0.1', NULL, '2020-01-30 10:11:22', '2020-01-30 10:11:22'),
(15, 1, 'Department', NULL, 1, '', 'PUT', 'Department informantion updated : <b>Administration</b>', '127.0.0.1', NULL, '2020-01-30 10:13:39', '2020-01-30 10:13:39'),
(16, 1, 'User', NULL, 2, '', 'POST', 'User informantion added : <b>Elodia Weisz</b>', '127.0.0.1', NULL, '2020-01-30 10:22:34', '2020-01-30 10:22:34'),
(17, 1, 'User', NULL, 3, '', 'POST', 'User informantion added : <b>Raeann Haner</b>', '127.0.0.1', NULL, '2020-01-30 10:27:47', '2020-01-30 10:27:47'),
(18, 1, 'User', NULL, 4, '', 'POST', 'User informantion added : <b>Junie Landa</b>', '127.0.0.1', NULL, '2020-01-30 10:29:43', '2020-01-30 10:29:43'),
(19, 1, 'User', NULL, 5, '', 'POST', 'User informantion added : <b>Denim Leak</b>', '127.0.0.1', NULL, '2020-01-30 10:32:32', '2020-01-30 10:32:32'),
(20, 1, 'User', NULL, 6, '', 'POST', 'User informantion added : <b>Helene Kramer</b>', '127.0.0.1', NULL, '2020-01-30 10:34:47', '2020-01-30 10:34:47'),
(21, 1, 'User', NULL, 7, '', 'POST', 'User informantion added : <b>Troy Russo</b>', '127.0.0.1', NULL, '2020-01-30 10:38:19', '2020-01-30 10:38:19'),
(22, 1, 'User', NULL, 8, '', 'POST', 'User informantion added : <b>Howard Martinez</b>', '127.0.0.1', NULL, '2020-01-30 10:42:19', '2020-01-30 10:42:19'),
(23, 1, 'User', NULL, 9, '', 'POST', 'User informantion added : <b>Harry Bennett</b>', '127.0.0.1', NULL, '2020-01-30 10:46:12', '2020-01-30 10:46:12'),
(24, 1, 'User', NULL, 10, '', 'POST', 'User informantion added : <b>Gilbert Alexander</b>', '127.0.0.1', NULL, '2020-01-30 10:52:49', '2020-01-30 10:52:49'),
(25, 1, 'Client', NULL, 11, '', 'POST', 'Client informantion added : <b>Eric Serna</b>', '127.0.0.1', NULL, '2020-01-30 11:08:01', '2020-01-30 11:08:01'),
(26, 1, 'Client', NULL, 12, '', 'POST', 'Client informantion added : <b>Simone Griffin</b>', '127.0.0.1', NULL, '2020-01-30 11:20:29', '2020-01-30 11:20:29'),
(27, 1, 'User', NULL, 13, '', 'POST', 'User informantion added : <b>Kevin Bailey</b>', '127.0.0.1', NULL, '2020-01-30 11:25:59', '2020-01-30 11:25:59'),
(28, 1, 'User', NULL, 2, '', 'PUT', 'User informantion updated : <b>Elodia Weisz</b>', '127.0.0.1', NULL, '2020-01-30 11:30:37', '2020-01-30 11:30:37'),
(29, 1, 'User', NULL, 10, '', 'PUT', 'User informantion updated : <b>Gilbert Alexander</b>', '127.0.0.1', NULL, '2020-01-30 11:30:42', '2020-01-30 11:30:42'),
(30, 1, 'User', NULL, 3, '', 'PUT', 'User informantion updated : <b>Raeann Haner</b>', '127.0.0.1', NULL, '2020-01-30 11:30:48', '2020-01-30 11:30:48'),
(31, 1, 'User', NULL, 13, '', 'PUT', 'User informantion updated : <b>Kevin Bailey</b>', '127.0.0.1', NULL, '2020-01-30 11:30:57', '2020-01-30 11:30:57'),
(32, 1, 'Team', NULL, 1, '', 'POST', 'Team informantion added : <b>Management Team</b>', '127.0.0.1', NULL, '2020-01-30 11:46:57', '2020-01-30 11:46:57'),
(33, 1, 'Team', NULL, 2, '', 'POST', 'Team informantion added : <b>Developer Team</b>', '127.0.0.1', NULL, '2020-01-30 11:50:36', '2020-01-30 11:50:36'),
(34, 1, 'Team', NULL, 3, '', 'POST', 'Team informantion added : <b>Designer Team</b>', '127.0.0.1', NULL, '2020-01-30 11:51:31', '2020-01-30 11:51:31'),
(35, 1, 'Team', NULL, 4, '', 'POST', 'Team informantion added : <b>Administration Team</b>', '127.0.0.1', NULL, '2020-01-30 11:52:14', '2020-01-30 11:52:14'),
(36, 1, 'Team', NULL, 5, '', 'POST', 'Team informantion added : <b>QA Team</b>', '127.0.0.1', NULL, '2020-01-30 12:02:04', '2020-01-30 12:02:04'),
(37, 1, 'Projects', NULL, 1, '', 'POST', 'Projects informantion added : <b>VipsPM(Angular8 With Laravel)</b>', '127.0.0.1', NULL, '2020-01-30 12:32:07', '2020-01-30 12:32:07'),
(38, 1, 'Projects', NULL, 2, '', 'POST', 'Projects informantion added : <b>Library Management System</b>', '127.0.0.1', NULL, '2020-01-30 12:36:31', '2020-01-30 12:36:31'),
(39, 1, 'Projects', NULL, 3, '', 'POST', 'Projects informantion added : <b>Billing System</b>', '127.0.0.1', NULL, '2020-01-30 12:39:05', '2020-01-30 12:39:05'),
(40, 1, 'Projects', NULL, 4, '', 'POST', 'Projects informantion added : <b>Game Zone</b>', '127.0.0.1', NULL, '2020-01-30 12:40:40', '2020-01-30 12:40:40'),
(41, 1, 'Projects', NULL, 5, '', 'POST', 'Projects informantion added : <b>Travel System</b>', '127.0.0.1', NULL, '2020-01-30 12:42:19', '2020-01-30 12:42:19'),
(42, 1, 'User', NULL, 1, '', 'PUT', 'User informantion updated : <b>Vipul Patel</b>', '127.0.0.1', NULL, '2020-01-30 13:02:03', '2020-01-30 13:02:03'),
(43, 1, 'CustomField', NULL, 1, '', 'POST', 'CustomField informantion added : <b>Test Field</b>', '127.0.0.1', NULL, '2020-01-31 05:31:43', '2020-01-31 05:31:43'),
(44, 1, 'Setting', NULL, 1, '', 'POST', 'Setting informantion added : <b>VipsPM</b>', '127.0.0.1', NULL, '2020-01-31 05:35:25', '2020-01-31 05:35:25'),
(45, 1, 'Setting', NULL, 1, '', 'POST', 'Setting informantion added : <b>ChetsApp Pvt. Ltd.</b>', '127.0.0.1', NULL, '2020-01-31 05:37:26', '2020-01-31 05:37:26'),
(46, 1, 'Task', NULL, 1, '', 'POST', 'Task informantion added : <b>Implement hotel billing functionallity</b>', '123.201.70.29', NULL, '2020-02-01 09:39:38', '2020-02-01 09:39:38'),
(47, 1, 'Task', NULL, 1, '', 'PUT', 'Task informantion updated : <b>Implement hotel billing functionallity</b>', '123.201.70.29', NULL, '2020-02-01 09:40:26', '2020-02-01 09:40:26'),
(48, 1, 'Task', NULL, 2, '', 'POST', 'Task informantion added : <b>Implement inventory billing functionallity.</b>', '123.201.70.29', NULL, '2020-02-01 09:55:08', '2020-02-01 09:55:08'),
(49, 1, 'Task', NULL, 3, '', 'POST', 'Task informantion added : <b>Implement hotel billing functionallity.</b>', '123.201.70.29', NULL, '2020-02-01 09:59:20', '2020-02-01 09:59:20'),
(50, 1, 'Task', NULL, 4, '', 'POST', 'Task informantion added : <b>Implement invoice calculation and listing.</b>', '123.201.70.29', NULL, '2020-02-01 10:08:59', '2020-02-01 10:08:59'),
(51, 1, 'Task', NULL, 5, '', 'POST', 'Task informantion added : <b>Design invoice pdf and print format.</b>', '123.201.70.29', NULL, '2020-02-01 10:10:17', '2020-02-01 10:10:17'),
(52, 1, 'Task', NULL, 6, '', 'POST', 'Task informantion added : <b>Implement global search functionality</b>', '123.201.70.29', NULL, '2020-02-01 10:13:28', '2020-02-01 10:13:28'),
(53, 1, 'Task', NULL, 6, '', 'PUT', 'Task informantion updated : <b>Implement global search functionality</b>', '123.201.70.29', NULL, '2020-02-01 10:18:39', '2020-02-01 10:18:39'),
(54, 1, 'Task', NULL, 5, '', 'PUT', 'Task informantion updated : <b>Design invoice pdf and print format.</b>', '123.201.70.29', NULL, '2020-02-01 10:21:10', '2020-02-01 10:21:10'),
(55, 1, 'Task', NULL, 5, '', 'PUT', 'Task informantion updated : <b>Design invoice pdf and print format.</b>', '123.201.70.29', NULL, '2020-02-01 10:23:44', '2020-02-01 10:23:44'),
(56, 1, 'Task', NULL, 5, '', 'PUT', 'Task informantion updated : <b>Design invoice pdf and print format.</b>', '123.201.70.29', NULL, '2020-02-01 10:31:22', '2020-02-01 10:31:22'),
(57, 1, 'Task', NULL, 3, '', 'PUT', 'Task informantion updated : <b>Implement hotel billing functionallity.</b>', '123.201.70.29', NULL, '2020-02-01 10:33:50', '2020-02-01 10:33:50'),
(58, 1, 'Task', NULL, 3, '', 'PUT', 'Task informantion updated : <b>Implement hotel billing functionallity.</b>', '123.201.70.29', NULL, '2020-02-01 10:34:07', '2020-02-01 10:34:07'),
(59, 1, 'Defect', NULL, 1, '', 'POST', 'Defect informantion added : <b>Sidebar sub tab not active.</b>', '123.201.70.29', NULL, '2020-02-01 10:35:04', '2020-02-01 10:35:04'),
(60, 1, 'Task', NULL, 3, '', 'PUT', 'Task informantion updated : <b>Implement hotel billing functionallity.</b>', '123.201.70.29', NULL, '2020-02-01 10:35:54', '2020-02-01 10:35:54'),
(61, 1, 'Task', NULL, 3, '', 'PUT', 'Task informantion updated : <b>Implement hotel billing functionallity.</b>', '123.201.70.29', NULL, '2020-02-01 10:36:22', '2020-02-01 10:36:22'),
(62, 1, 'Task', NULL, 3, '', 'PUT', 'Task informantion updated : <b>Implement hotel billing functionallity.</b>', '123.201.70.29', NULL, '2020-02-01 10:37:01', '2020-02-01 10:37:01'),
(63, 1, 'Defect', NULL, 2, '', 'POST', 'Defect informantion added : <b>Toggle button is not working.</b>', '123.201.70.29', NULL, '2020-02-01 10:37:26', '2020-02-01 10:37:26'),
(64, 1, 'Defect', NULL, 3, '', 'POST', 'Defect informantion added : <b>Header and sidebar missing.</b>', '123.201.70.29', NULL, '2020-02-01 10:38:24', '2020-02-01 10:38:24'),
(65, 1, 'Defect', NULL, 4, '', 'POST', 'Defect informantion added : <b>Generate invoice take more time.</b>', '123.201.70.29', NULL, '2020-02-01 10:39:53', '2020-02-01 10:39:53'),
(66, 1, 'Defect', NULL, 5, '', 'POST', 'Defect informantion added : <b>Dashboard responsive issue.</b>', '123.201.70.29', NULL, '2020-02-01 10:40:44', '2020-02-01 10:40:44'),
(67, 1, 'Defect', NULL, 6, '', 'POST', 'Defect informantion added : <b>Invoice PDF format is not like mentioned in HLD.</b>', '123.201.70.29', NULL, '2020-02-01 10:41:40', '2020-02-01 10:41:40'),
(68, 1, 'Defect', NULL, 7, '', 'POST', 'Defect informantion added : <b>Hotel billing page is not working.</b>', '123.201.70.29', NULL, '2020-02-01 10:42:22', '2020-02-01 10:42:22'),
(69, 1, 'Defect', NULL, 8, '', 'POST', 'Defect informantion added : <b>Toggle button is not working.</b>', '123.201.70.29', NULL, '2020-02-01 10:43:10', '2020-02-01 10:43:10'),
(70, 1, 'Defect', NULL, 9, '', 'POST', 'Defect informantion added : <b>Service is not terminated in service termination module.</b>', '123.201.70.29', NULL, '2020-02-01 10:43:55', '2020-02-01 10:43:55'),
(71, 1, 'Defect', NULL, 10, '', 'POST', 'Defect informantion added : <b>Previous cycle invoice amount is not adjust agains current cycle.</b>', '123.201.70.29', NULL, '2020-02-01 10:44:43', '2020-02-01 10:44:43'),
(72, 1, 'Defect', NULL, 11, '', 'POST', 'Defect informantion added : <b>Previous cycle invoice amount is not adjust agains current cycle</b>', '123.201.70.29', NULL, '2020-02-01 10:45:35', '2020-02-01 10:45:35'),
(73, 1, 'Defect', NULL, 12, '', 'POST', 'Defect informantion added : <b>Generate invoice take more time.</b>', '123.201.70.29', NULL, '2020-02-01 10:46:57', '2020-02-01 10:46:57'),
(74, 1, 'Defect', NULL, 13, '', 'POST', 'Defect informantion added : <b>Invoice PDF format is not like mentioned in HLD.</b>', '123.201.70.29', NULL, '2020-02-01 10:47:43', '2020-02-01 10:47:43'),
(75, 1, 'Defect', NULL, 14, '', 'POST', 'Defect informantion added : <b>Sidebar sub tab not active.</b>', '123.201.70.29', NULL, '2020-02-01 10:51:34', '2020-02-01 10:51:34'),
(76, 1, 'Defect', NULL, 15, '', 'POST', 'Defect informantion added : <b>ToDo list collapse not working.</b>', '123.201.70.29', NULL, '2020-02-01 10:53:39', '2020-02-01 10:53:39'),
(77, 1, 'Defect', NULL, 16, '', 'POST', 'Defect informantion added : <b>Previous cycle invoice amount is not adjust agains current cycle.</b>', '123.201.70.29', NULL, '2020-02-01 10:54:42', '2020-02-01 10:54:42'),
(78, 13, 'Defect', NULL, 17, '', 'POST', 'Defect informantion added : <b>Generate invoice take more time.</b>', '123.201.70.29', NULL, '2020-02-01 11:00:57', '2020-02-01 11:00:57'),
(79, 1, 'Task', NULL, 7, '', 'POST', 'Task informantion added : <b>Write migration script.</b>', '123.201.70.29', NULL, '2020-02-01 11:09:23', '2020-02-01 11:09:23'),
(80, 1, 'Task', NULL, 4, '', 'PUT', 'Task informantion updated : <b>Implement invoice calculation and listing.</b>', '123.201.70.29', NULL, '2020-02-01 11:12:27', '2020-02-01 11:12:27'),
(81, 1, 'Task', NULL, 8, '', 'POST', 'Task informantion added : <b>View Theme integration.</b>', '123.201.70.29', NULL, '2020-02-01 11:14:55', '2020-02-01 11:14:55'),
(82, 1, 'Task', NULL, 9, '', 'POST', 'Task informantion added : <b>List all tender template</b>', '123.201.70.29', NULL, '2020-02-01 11:18:56', '2020-02-01 11:18:56'),
(83, 1, 'Task', NULL, 1, '', 'PUT', 'Task informantion updated : <b>Implement hotel billing functionallity</b>', '123.201.70.29', NULL, '2020-02-01 11:26:35', '2020-02-01 11:26:35'),
(84, 1, 'Announcement', NULL, 1, '', 'POST', 'Announcement informantion added : <b>Reschedule Team Meeting</b>', '123.201.70.29', NULL, '2020-02-01 11:37:34', '2020-02-01 11:37:34'),
(85, 1, 'Announcement', NULL, 2, '', 'POST', 'Announcement informantion added : <b>Policy acceptance confirmation</b>', '123.201.70.29', NULL, '2020-02-01 11:38:34', '2020-02-01 11:38:34'),
(86, 1, 'Announcement', NULL, 3, '', 'POST', 'Announcement informantion added : <b>Reminder: Food Receipt Submission</b>', '123.201.70.29', NULL, '2020-02-01 11:39:17', '2020-02-01 11:39:17'),
(87, 1, 'Announcement', NULL, 4, '', 'POST', 'Announcement informantion added : <b>Welcome to New Membe</b>', '123.201.70.29', NULL, '2020-02-01 11:40:06', '2020-02-01 11:40:06'),
(88, 1, 'Announcement', NULL, 3, '', 'PUT', 'Announcement informantion updated : <b>Reminder: Food Receipt Submission</b>', '123.201.70.29', NULL, '2020-02-01 11:40:19', '2020-02-01 11:40:19'),
(89, 1, 'Announcement', NULL, 3, '', 'PUT', 'Announcement informantion updated : <b>Reminder: Food Receipt Submission</b>', '123.201.70.29', NULL, '2020-02-01 11:40:37', '2020-02-01 11:40:37'),
(90, 1, 'Announcement', NULL, 1, '', 'PUT', 'Announcement informantion updated : <b>Reschedule Team Meeting</b>', '123.201.70.29', NULL, '2020-02-01 11:40:51', '2020-02-01 11:40:51'),
(91, 1, 'Announcement', NULL, 4, '', 'PUT', 'Announcement informantion updated : <b>Welcome to New Membe</b>', '123.201.70.29', NULL, '2020-02-01 11:42:08', '2020-02-01 11:42:08'),
(92, 1, 'Announcement', NULL, 2, '', 'PUT', 'Announcement informantion updated : <b>Policy acceptance confirmation</b>', '123.201.70.29', NULL, '2020-02-01 11:42:21', '2020-02-01 11:42:21'),
(93, 1, 'ToDo', NULL, 1, '', 'POST', 'ToDo informantion added : <b>Create a solution maintenance plan.</b>', '123.201.70.29', NULL, '2020-02-01 11:43:34', '2020-02-01 11:43:34'),
(94, 1, 'ToDo', NULL, 2, '', 'POST', 'ToDo informantion added : <b>Create new stuff.</b>', '123.201.70.29', NULL, '2020-02-01 11:44:01', '2020-02-01 11:44:01'),
(95, 1, 'ToDo', NULL, 3, '', 'POST', 'ToDo informantion added : <b>Create tasks lists.</b>', '123.201.70.29', NULL, '2020-02-01 11:44:27', '2020-02-01 11:44:27'),
(96, 1, 'ToDo', NULL, 4, '', 'POST', 'ToDo informantion added : <b>Install the history server.</b>', '123.201.70.29', NULL, '2020-02-01 11:45:03', '2020-02-01 11:45:03'),
(97, 1, 'ToDo', NULL, 4, '', 'PUT', 'ToDo informantion updated : <b>Install the history server.</b>', '123.201.70.29', NULL, '2020-02-01 11:45:20', '2020-02-01 11:45:20'),
(98, 1, 'ToDo', NULL, 5, '', 'POST', 'ToDo informantion added : <b>Install the product in the production environment</b>', '123.201.70.29', NULL, '2020-02-01 11:45:45', '2020-02-01 11:45:45'),
(99, 1, 'ToDo', NULL, 6, '', 'POST', 'ToDo informantion added : <b>Prepare the production environment</b>', '123.201.70.29', NULL, '2020-02-01 11:46:18', '2020-02-01 11:46:18'),
(100, 1, 'ToDo', NULL, 7, '', 'POST', 'ToDo informantion added : <b>Schedule jobs.</b>', '123.201.70.29', NULL, '2020-02-01 11:46:43', '2020-02-01 11:46:43'),
(101, 1, 'ToDo', NULL, 8, '', 'POST', 'ToDo informantion added : <b>Send documents to vips patel</b>', '123.201.70.29', NULL, '2020-02-01 11:47:04', '2020-02-01 11:47:04'),
(102, 1, 'Incident', NULL, 1, '', 'POST', 'Incident informantion added : <b>Total active customer count is not match with client service portal.</b>', '123.201.70.29', NULL, '2020-02-01 11:56:14', '2020-02-01 11:56:14'),
(103, 1, 'Incident', NULL, 2, '', 'POST', 'Incident informantion added : <b>Listing and invoice PDF the amount number formatting not proper.</b>', '123.201.70.29', NULL, '2020-02-01 11:56:50', '2020-02-01 11:56:50'),
(104, 13, 'Incident', NULL, 3, '', 'POST', 'Incident informantion added : <b>There are many variations of passages of Lorem Ipsum available, but the majority have suffered alteration in some form, by injected humour, or randomised words which don\'t look even slightly believable</b>', '123.201.70.29', NULL, '2020-02-01 11:58:11', '2020-02-01 11:58:11'),
(105, 13, 'Incident', NULL, 4, '', 'POST', 'Incident informantion added : <b>Service activation-termination api is not working in testing environment.</b>', '123.201.70.29', NULL, '2020-02-01 11:58:44', '2020-02-01 11:58:44'),
(106, 13, 'Incident', NULL, 5, '', 'POST', 'Incident informantion added : <b>In testing environment send email functionality not workin</b>', '123.201.70.29', NULL, '2020-02-01 11:59:32', '2020-02-01 11:59:32'),
(107, 13, 'Incident', NULL, 6, '', 'POST', 'Incident informantion added : <b>Need to implement pagination in invoice pdf.</b>', '123.201.70.29', NULL, '2020-02-01 12:00:10', '2020-02-01 12:00:10'),
(108, 13, 'Incident', NULL, 7, '', 'POST', 'Incident informantion added : <b>Group service termination functionality not working.</b>', '123.201.70.29', NULL, '2020-02-01 12:00:44', '2020-02-01 12:00:44'),
(109, 13, 'Incident', NULL, 8, '', 'POST', 'Incident informantion added : <b>In customer listing some columns are missing.</b>', '123.201.70.29', NULL, '2020-02-01 12:02:06', '2020-02-01 12:02:06'),
(110, 13, 'Incident', NULL, 9, '', 'POST', 'Incident informantion added : <b>Group service termination functionality not working.</b>', '123.201.70.29', NULL, '2020-02-01 12:02:57', '2020-02-01 12:02:57'),
(111, 1, 'Meeting', NULL, 1, '', 'POST', 'Meeting informantion added : <b>Angular V7 workshop</b>', '123.201.70.29', NULL, '2020-02-01 12:10:29', '2020-02-01 12:10:29'),
(112, 1, 'Meeting', NULL, 2, '', 'POST', 'Meeting informantion added : <b>Code Review</b>', '123.201.70.29', NULL, '2020-02-01 12:35:50', '2020-02-01 12:35:50'),
(113, 1, 'Meeting', NULL, 3, '', 'POST', 'Meeting informantion added : <b>CRM project kickoff</b>', '123.201.70.29', NULL, '2020-02-01 12:37:24', '2020-02-01 12:37:24'),
(114, 1, 'Meeting', NULL, 4, '', 'POST', 'Meeting informantion added : <b>Project release and test</b>', '123.201.70.29', NULL, '2020-02-01 12:38:43', '2020-02-01 12:38:43'),
(115, 1, 'Announcement', NULL, 4, '', 'PUT', 'Announcement informantion updated : <b>Welcome to New Member</b>', '157.32.17.53', NULL, '2020-02-02 08:29:03', '2020-02-02 08:29:03'),
(116, 1, 'Task', NULL, 10, '', 'POST', 'Task informantion added : <b>Defect module</b>', '123.201.65.1', NULL, '2020-02-03 16:01:54', '2020-02-03 16:01:54'),
(117, 1, 'Task', NULL, 11, '', 'POST', 'Task informantion added : <b>Dynamic dropdown of project planner</b>', '123.201.65.1', NULL, '2020-02-03 16:03:09', '2020-02-03 16:03:09'),
(118, 1, 'Task', NULL, 12, '', 'POST', 'Task informantion added : <b>Create a crud [ insert update ] in project planner</b>', '123.201.65.1', NULL, '2020-02-03 16:03:58', '2020-02-03 16:03:58'),
(119, 1, 'Task', NULL, 13, '', 'POST', 'Task informantion added : <b>Design Project planner Dropdown issue</b>', '123.201.65.1', NULL, '2020-02-03 16:04:56', '2020-02-03 16:04:56'),
(120, 1, 'Task', NULL, 14, '', 'POST', 'Task informantion added : <b>Create user login ,registration system</b>', '123.201.65.1', NULL, '2020-02-03 16:05:49', '2020-02-03 16:05:49'),
(121, 1, 'Task', NULL, 15, '', 'POST', 'Task informantion added : <b>Form validation of incidents</b>', '123.201.65.1', NULL, '2020-02-03 16:06:57', '2020-02-03 16:06:57'),
(122, 1, 'Task', NULL, 16, '', 'POST', 'Task informantion added : <b>Fixed issue in taskboard and check permission in all module</b>', '123.201.65.1', NULL, '2020-02-03 16:08:37', '2020-02-03 16:08:37'),
(123, 1, 'Task', NULL, 17, '', 'POST', 'Task informantion added : <b>Meeting with chetna regarding office or projects.</b>', '123.201.65.1', NULL, '2020-02-03 16:09:44', '2020-02-03 16:09:44'),
(124, 1, 'Task', NULL, 18, '', 'POST', 'Task informantion added : <b>Gather and add features/other content in documentation and broucher pages</b>', '123.201.65.1', NULL, '2020-02-03 16:11:02', '2020-02-03 16:11:02'),
(125, 1, 'Task', NULL, 19, '', 'POST', 'Task informantion added : <b>Meeting with Chetna mam regarding project status</b>', '123.201.65.1', NULL, '2020-02-03 16:13:49', '2020-02-03 16:13:49'),
(126, 1, 'Task', NULL, 20, '', 'POST', 'Task informantion added : <b>Add remaining tables and fixed design issue in dashboard page</b>', '123.201.65.1', NULL, '2020-02-03 16:14:49', '2020-02-03 16:14:49'),
(127, 1, 'Task', NULL, 21, '', 'POST', 'Task informantion added : <b>Research and make lists of ERP modules for documentation and working on implements annoucment and meeting table on dashboard.</b>', '123.201.65.1', NULL, '2020-02-03 16:17:33', '2020-02-03 16:17:33'),
(128, 1, 'Task', NULL, 22, '', 'POST', 'Task informantion added : <b>Meeting with Admins regarding office matters</b>', '123.201.65.1', NULL, '2020-02-03 16:19:48', '2020-02-03 16:19:48'),
(129, 1, 'Task', NULL, 23, '', 'POST', 'Task informantion added : <b>Team Meeting</b>', '123.201.65.1', NULL, '2020-02-03 16:21:09', '2020-02-03 16:21:09'),
(130, 1, 'Task', NULL, 24, '', 'POST', 'Task informantion added : <b>Discussions regarding gifts and Diwali celebrations</b>', '123.201.65.1', NULL, '2020-02-03 16:25:04', '2020-02-03 16:25:04'),
(131, 1, 'Task', NULL, 25, '', 'POST', 'Task informantion added : <b>Prepare highchart demo for clients.</b>', '123.201.65.1', NULL, '2020-02-03 16:27:09', '2020-02-03 16:27:09'),
(132, 1, 'Task', NULL, 26, '', 'POST', 'Task informantion added : <b>Meeting with Admins and Manjay regarding Site Templates</b>', '123.201.65.1', NULL, '2020-02-03 16:28:00', '2020-02-03 16:28:00'),
(133, 1, 'Task', NULL, 27, '', 'POST', 'Task informantion added : <b>Administration:- CHeck static theme restora and check structure.</b>', '123.201.65.1', NULL, '2020-02-03 16:29:39', '2020-02-03 16:29:39'),
(134, 1, 'Task', NULL, 28, '', 'POST', 'Task informantion added : <b>Diwali Celebrations</b>', '123.201.65.1', NULL, '2020-02-03 16:31:02', '2020-02-03 16:31:02'),
(135, 1, 'Task', NULL, 29, '', 'POST', 'Task informantion added : <b>Fixed design issues and other functionalities issues in all modules.</b>', '123.201.65.1', NULL, '2020-02-03 16:32:02', '2020-02-03 16:32:02'),
(136, 1, 'Task', NULL, 30, '', 'POST', 'Task informantion added : <b>Formate and redesign bugs and incidents pages</b>', '123.201.65.1', NULL, '2020-02-03 16:33:10', '2020-02-03 16:33:10'),
(137, 1, 'Task', NULL, 31, '', 'POST', 'Task informantion added : <b>Meeting with Admins regarding Projects</b>', '219.91.191.37', NULL, '2020-02-03 16:34:50', '2020-02-03 16:34:50'),
(138, 1, 'Task', NULL, 32, '', 'POST', 'Task informantion added : <b>Testing all pages and note issues related to design and guide employees.</b>', '219.91.191.37', NULL, '2020-02-03 16:36:49', '2020-02-03 16:36:49'),
(139, 1, 'Task', NULL, 33, '', 'POST', 'Task informantion added : <b>Review and list bugs front end and backend.</b>', '219.91.191.37', NULL, '2020-02-03 16:37:59', '2020-02-03 16:37:59'),
(140, 1, 'Task', NULL, 34, '', 'POST', 'Task informantion added : <b>Testing all pages and note issues related to design and upload theme.</b>', '219.91.191.37', NULL, '2020-02-03 16:38:58', '2020-02-03 16:38:58'),
(141, 1, 'Task', NULL, 35, '', 'POST', 'Task informantion added : <b>Project setup in viral PC.</b>', '219.91.191.37', NULL, '2020-02-03 16:40:18', '2020-02-03 16:40:18'),
(142, 1, 'Task', NULL, 36, '', 'POST', 'Task informantion added : <b>Create and setup stucture for documentation.</b>', '219.91.191.37', NULL, '2020-02-03 16:43:23', '2020-02-03 16:43:23'),
(143, 1, 'Task', NULL, 37, '', 'POST', 'Task informantion added : <b>Working on fix PMs tool issue.</b>', '219.91.191.37', NULL, '2020-02-03 16:44:16', '2020-02-03 16:44:16'),
(144, 1, 'Holiday', NULL, 1, '', 'POST', 'Holiday informantion added : <b>Makar Sankranti</b>', '219.91.191.37', NULL, '2020-02-03 16:53:36', '2020-02-03 16:53:36'),
(145, 1, 'Holiday', NULL, 2, '', 'POST', 'Holiday informantion added : <b>Republic Day</b>', '219.91.191.37', NULL, '2020-02-03 16:56:13', '2020-02-03 16:56:13'),
(146, 1, 'Holiday', NULL, 3, '', 'POST', 'Holiday informantion added : <b>Christmas Day</b>', '219.91.191.37', NULL, '2020-02-03 16:58:32', '2020-02-03 16:58:32'),
(147, 1, 'Holiday', NULL, 4, '', 'POST', 'Holiday informantion added : <b>Vasant Panchami</b>', '219.91.191.37', NULL, '2020-02-03 16:59:42', '2020-02-03 16:59:42'),
(148, 1, 'Holiday', NULL, 5, '', 'POST', 'Holiday informantion added : <b>Guru Ravidas Jayanti</b>', '219.91.191.37', NULL, '2020-02-03 17:00:28', '2020-02-03 17:00:28'),
(149, 1, 'Holiday', NULL, 6, '', 'POST', 'Holiday informantion added : <b>Shivaji Jayanti</b>', '219.91.191.37', NULL, '2020-02-03 17:01:15', '2020-02-03 17:01:15'),
(150, 1, 'Holiday', NULL, 7, '', 'POST', 'Holiday informantion added : <b>Maha Shivratri</b>', '219.91.191.37', NULL, '2020-02-03 17:02:07', '2020-02-03 17:02:07'),
(151, 1, 'Holiday', NULL, 8, '', 'POST', 'Holiday informantion added : <b>Holika Dahan</b>', '219.91.191.37', NULL, '2020-02-03 17:02:50', '2020-02-03 17:02:50'),
(152, 1, 'Holiday', NULL, 9, '', 'POST', 'Holiday informantion added : <b>Rama Navami</b>', '219.91.191.37', NULL, '2020-02-03 17:03:50', '2020-02-03 17:03:50'),
(153, 1, 'Holiday', NULL, 10, '', 'POST', 'Holiday informantion added : <b>Mahavir Jayanti</b>', '219.91.191.37', NULL, '2020-02-03 17:04:36', '2020-02-03 17:04:36'),
(154, 1, 'Holiday', NULL, 11, '', 'POST', 'Holiday informantion added : <b>Ambedkar Jayanti</b>', '219.91.191.37', NULL, '2020-02-03 06:51:54', '2020-02-03 06:51:54'),
(155, 1, 'Holiday', NULL, 12, '', 'POST', 'Holiday informantion added : <b>Ramzan Id</b>', '219.91.191.37', NULL, '2020-02-03 06:53:43', '2020-02-03 06:53:43'),
(156, 1, 'Holiday', NULL, 13, '', 'POST', 'Holiday informantion added : <b>Buddha Purnima</b>', '219.91.191.37', NULL, '2020-02-03 06:54:31', '2020-02-03 06:54:31'),
(157, 1, 'Holiday', NULL, 14, '', 'POST', 'Holiday informantion added : <b>Parsi New Year</b>', '219.91.191.37', NULL, '2020-02-03 06:55:45', '2020-02-03 06:55:45'),
(158, 1, 'Holiday', NULL, 15, '', 'POST', 'Holiday informantion added : <b>Janmashtami</b>', '219.91.191.37', NULL, '2020-02-03 06:56:27', '2020-02-03 06:56:27'),
(159, 1, 'Holiday', NULL, 16, '', 'POST', 'Holiday informantion added : <b>Diwali</b>', '219.91.191.37', NULL, '2020-02-03 06:57:52', '2020-02-03 06:57:52'),
(160, 1, 'Holiday', NULL, 17, '', 'POST', 'Holiday informantion added : <b>New Year Eve</b>', '219.91.191.37', NULL, '2020-02-03 06:59:25', '2020-02-03 06:59:25'),
(161, 1, 'Holiday', NULL, 18, '', 'POST', 'Holiday informantion added : <b>Independence Day</b>', '219.91.191.37', NULL, '2020-02-03 07:01:10', '2020-02-03 07:01:10'),
(162, 1, 'Meeting', NULL, 2, '', 'PUT', 'Meeting informantion updated : <b>Code Review</b>', '219.91.191.37', NULL, '2020-02-03 07:07:42', '2020-02-03 07:07:42'),
(163, 1, 'Meeting', NULL, 1, '', 'PUT', 'Meeting informantion updated : <b>Angular V7 workshop</b>', '219.91.191.37', NULL, '2020-02-03 07:08:03', '2020-02-03 07:08:03'),
(164, 1, 'Meeting', NULL, 4, '', 'PUT', 'Meeting informantion updated : <b>Project release and test</b>', '219.91.191.37', NULL, '2020-02-03 07:08:26', '2020-02-03 07:08:26'),
(165, 1, 'KnowledgeBaseCategory', NULL, 1, '', 'POST', 'KnowledgeBaseCategory informantion added : <b>Angular</b>', '219.91.191.37', NULL, '2020-02-03 07:19:09', '2020-02-03 07:19:09'),
(166, 1, 'KnowledgeBaseCategory', NULL, 2, '', 'POST', 'KnowledgeBaseCategory informantion added : <b>Laravel</b>', '219.91.191.37', NULL, '2020-02-03 07:21:32', '2020-02-03 07:21:32'),
(167, 1, 'KnowledgeBaseCategory', NULL, 3, '', 'POST', 'KnowledgeBaseCategory informantion added : <b>Wordpress</b>', '219.91.191.37', NULL, '2020-02-03 07:24:04', '2020-02-03 07:24:04'),
(168, 1, 'KnowledgeBaseCategory', NULL, 3, '', 'PUT', 'KnowledgeBaseCategory informantion updated : <b>Wordpress</b>', '219.91.191.37', NULL, '2020-02-03 07:27:22', '2020-02-03 07:27:22'),
(169, 1, 'KnowledgeBaseCategory', NULL, 4, '', 'POST', 'KnowledgeBaseCategory informantion added : <b>Node.js</b>', '219.91.191.37', NULL, '2020-02-03 07:28:42', '2020-02-03 07:28:42'),
(170, 1, 'KnowledgeBaseCategory', NULL, 5, '', 'POST', 'KnowledgeBaseCategory informantion added : <b>React Js</b>', '219.91.191.37', NULL, '2020-02-03 07:30:16', '2020-02-03 07:30:16'),
(171, 1, 'User', NULL, 3, '', 'PUT', 'User informantion updated : <b>Raeann Haner</b>', '219.91.191.37', NULL, '2020-02-03 07:31:30', '2020-02-03 07:31:30'),
(172, 1, 'User', NULL, 3, '', 'PUT', 'User informantion updated : <b>Raeann Haner</b>', '219.91.191.37', NULL, '2020-02-03 07:31:34', '2020-02-03 07:31:34'),
(173, 1, 'User', NULL, 5, '', 'PUT', 'User informantion updated : <b>Denim Leak</b>', '219.91.191.37', NULL, '2020-02-03 07:32:02', '2020-02-03 07:32:02'),
(174, 1, 'User', NULL, 13, '', 'PUT', 'User informantion updated : <b>Kevin Bailey</b>', '219.91.191.37', NULL, '2020-02-03 07:53:28', '2020-02-03 07:53:28'),
(175, 1, 'User', NULL, 14, '', 'PUT', 'User informantion updated : <b>Milan Unjiya</b>', '219.91.191.37', NULL, '2020-02-03 07:57:37', '2020-02-03 07:57:37'),
(176, 1, 'KnowledgeBaseArticle', NULL, 1, '', 'POST', 'KnowledgeBaseArticle informantion added : <b>Introduction</b>', '219.91.191.17', NULL, '2020-02-04 03:22:20', '2020-02-04 03:22:20'),
(177, 1, 'KnowledgeBaseArticle', NULL, 1, '', 'PUT', 'KnowledgeBaseArticle informantion updated : <b>Introduction To The Angular Docs</b>', '219.91.191.17', NULL, '2020-02-04 03:28:36', '2020-02-04 03:28:36'),
(178, 1, 'KnowledgeBaseArticle', NULL, 2, '', 'POST', 'KnowledgeBaseArticle informantion added : <b>Getting Started</b>', '219.91.191.17', NULL, '2020-02-04 03:30:53', '2020-02-04 03:30:53'),
(179, 1, 'KnowledgeBaseArticle', NULL, 3, '', 'POST', 'KnowledgeBaseArticle informantion added : <b>Setup</b>', '219.91.191.17', NULL, '2020-02-04 03:32:14', '2020-02-04 03:32:14'),
(180, 1, 'KnowledgeBaseArticle', NULL, 4, '', 'POST', 'KnowledgeBaseArticle informantion added : <b>Installation</b>', '219.91.191.17', NULL, '2020-02-04 03:36:28', '2020-02-04 03:36:28'),
(181, 1, 'KnowledgeBaseArticle', NULL, 5, '', 'POST', 'KnowledgeBaseArticle informantion added : <b>Configuration</b>', '219.91.191.17', NULL, '2020-02-04 03:38:48', '2020-02-04 03:38:48'),
(182, 1, 'KnowledgeBaseArticle', NULL, 6, '', 'POST', 'KnowledgeBaseArticle informantion added : <b>Directory Structure</b>', '219.91.191.17', NULL, '2020-02-04 03:46:35', '2020-02-04 03:46:35'),
(183, 1, 'KnowledgeBaseArticle', NULL, 7, '', 'POST', 'KnowledgeBaseArticle informantion added : <b>Security Updates</b>', '219.91.191.17', NULL, '2020-02-04 03:56:42', '2020-02-04 03:56:42'),
(184, 1, 'KnowledgeBaseArticle', NULL, 8, '', 'POST', 'KnowledgeBaseArticle informantion added : <b>Install WordPress</b>', '219.91.191.17', NULL, '2020-02-04 04:20:40', '2020-02-04 04:20:40'),
(185, 1, 'KnowledgeBaseArticle', NULL, 9, '', 'POST', 'KnowledgeBaseArticle informantion added : <b>Support</b>', '219.91.191.17', NULL, '2020-02-04 04:22:41', '2020-02-04 04:22:41'),
(186, 1, 'KnowledgeBaseArticle', NULL, 10, '', 'POST', 'KnowledgeBaseArticle informantion added : <b>Guides</b>', '219.91.191.17', NULL, '2020-02-04 04:29:54', '2020-02-04 04:29:54'),
(187, 1, 'KnowledgeBaseArticle', NULL, 11, '', 'POST', 'KnowledgeBaseArticle informantion added : <b>Security</b>', '219.91.191.17', NULL, '2020-02-04 04:32:33', '2020-02-04 04:32:33'),
(188, 1, 'KnowledgeBaseArticle', NULL, 12, '', 'POST', 'KnowledgeBaseArticle informantion added : <b>Get Involved</b>', '219.91.191.17', NULL, '2020-02-04 04:45:16', '2020-02-04 04:45:16'),
(189, 1, 'KnowledgeBaseArticle', NULL, 13, '', 'POST', 'KnowledgeBaseArticle informantion added : <b>Docs</b>', '219.91.191.17', NULL, '2020-02-04 04:54:54', '2020-02-04 04:54:54'),
(190, 1, 'KnowledgeBaseArticle', NULL, 14, '', 'POST', 'KnowledgeBaseArticle informantion added : <b>Load Data Incrementally</b>', '219.91.191.17', NULL, '2020-02-04 04:56:07', '2020-02-04 04:56:07'),
(191, 1, 'KnowledgeBaseArticle', NULL, 15, '', 'POST', 'KnowledgeBaseArticle informantion added : <b>Downloads</b>', '219.91.191.17', NULL, '2020-02-04 04:59:47', '2020-02-04 04:59:47'),
(192, 1, 'Meeting', NULL, 5, '', 'POST', 'Meeting informantion added : <b>Angular V7 workshop</b>', '203.109.114.137', NULL, '2020-02-04 05:47:41', '2020-02-04 05:47:41'),
(193, 1, 'User', NULL, 13, '', 'PUT', 'User informantion updated : <b>Kevin Bailey</b>', '123.201.70.158', NULL, '2020-02-11 03:29:50', '2020-02-11 03:29:50'),
(194, 13, 'Mailbox', NULL, 1, '', 'POST', 'Mailbox informantion added : <b>Leave request</b>', '123.201.70.158', NULL, '2020-02-11 03:32:59', '2020-02-11 03:32:59'),
(195, 1, 'Mailbox', NULL, 1, '', 'POST', 'Mailbox informantion added : <b>Leave request</b>', '123.201.70.158', NULL, '2020-02-11 03:34:02', '2020-02-11 03:34:02'),
(196, 1, 'Mailbox', NULL, 1, '', 'POST', 'Mailbox informantion added : <b>Leave request</b>', '123.201.70.158', NULL, '2020-02-11 03:34:12', '2020-02-11 03:34:12'),
(197, 1, 'Mailbox', NULL, 2, '', 'POST', 'Mailbox informantion added : <b>Leave request</b>', '123.201.70.158', NULL, '2020-02-11 03:35:12', '2020-02-11 03:35:12'),
(198, 1, 'User', NULL, 1, '', 'PUT', 'User informantion updated : <b>Vipul Patel</b>', '123.201.70.158', NULL, '2020-02-11 03:39:27', '2020-02-11 03:39:27'),
(199, 1, 'User', NULL, 1, '', 'PUT', 'User informantion updated : <b>Vipul Patel</b>', '123.201.70.158', NULL, '2020-02-11 03:40:05', '2020-02-11 03:40:05'),
(200, 1, 'Department', NULL, 1, '', 'PUT', 'Department informantion updated : <b>Administration</b>', '123.201.70.158', NULL, '2020-02-11 03:44:34', '2020-02-11 03:44:34'),
(201, 1, 'Department', NULL, 1, '', 'PUT', 'Department informantion updated : <b>Administration</b>', '123.201.70.158', NULL, '2020-02-11 03:46:15', '2020-02-11 03:46:15'),
(202, 1, 'User', NULL, 1, '', 'PUT', 'User informantion updated : <b>Vipul Patel</b>', '123.201.70.158', NULL, '2020-02-11 03:46:34', '2020-02-11 03:46:34'),
(203, 1, 'User', NULL, 2, '', 'PUT', 'User informantion updated : <b>Elodia Weisz</b>', '123.201.70.158', NULL, '2020-02-11 03:46:48', '2020-02-11 03:46:48'),
(204, 1, 'User', NULL, 14, '', 'PUT', 'User informantion updated : <b>Milan Unjiya</b>', '123.201.70.158', NULL, '2020-02-11 03:47:03', '2020-02-11 03:47:03'),
(205, 1, 'User', NULL, 6, '', 'PUT', 'User informantion updated : <b>Helene Kramer</b>', '123.201.70.158', NULL, '2020-02-11 03:47:28', '2020-02-11 03:47:28'),
(206, 1, 'User', NULL, 7, '', 'PUT', 'User informantion updated : <b>Troy Russo</b>', '123.201.70.158', NULL, '2020-02-11 03:47:31', '2020-02-11 03:47:31'),
(207, 1, 'User', NULL, 8, '', 'PUT', 'User informantion updated : <b>Howard Martinez</b>', '123.201.70.158', NULL, '2020-02-11 03:47:34', '2020-02-11 03:47:34'),
(208, 1, 'Meeting', NULL, 5, '', 'DELETE', 'Meeting informantion deleted : <b>Angular V7 workshop</b>', '123.201.70.158', NULL, '2020-02-11 03:48:34', '2020-02-11 03:48:34'),
(209, 1, 'FileBrowser', NULL, 1, '', 'POST', 'FileBrowser informantion added : <b>CAPL</b>', '123.201.70.158', NULL, '2020-02-11 03:50:43', '2020-02-11 03:50:43'),
(210, 1, 'File', NULL, 1, '', 'DELETE', 'File informantion deleted : <b>balance_sheet.pdf</b>', '123.201.70.158', NULL, '2020-02-11 03:51:17', '2020-02-11 03:51:17'),
(211, 1, 'Setting', NULL, 1, '', 'POST', 'Setting informantion added : <b>ChetsApp Pvt. Ltd.</b>', '123.201.70.158', NULL, '2020-02-11 03:53:33', '2020-02-11 03:53:33'),
(212, 1, 'Setting', NULL, 1, '', 'POST', 'Setting informantion added : <b>ChetsApp Pvt. Ltd.</b>', '123.201.70.158', NULL, '2020-02-11 04:00:22', '2020-02-11 04:00:22'),
(213, 1, 'Setting', NULL, 1, '', 'POST', 'Setting informantion added : <b>ChetsApp Pvt. Ltd.</b>', '123.201.70.158', NULL, '2020-02-11 04:00:49', '2020-02-11 04:00:49'),
(214, 1, 'Setting', NULL, 1, '', 'POST', 'Setting informantion added : <b>ChetsApp Pvt. Ltd.</b>', '123.201.70.158', NULL, '2020-02-11 04:01:08', '2020-02-11 04:01:08'),
(215, 1, 'Setting', NULL, 1, '', 'POST', 'Setting informantion added : <b>ChetsApp Pvt. Ltd.</b>', '123.201.70.158', NULL, '2020-02-11 04:01:10', '2020-02-11 04:01:10'),
(216, 1, 'Setting', NULL, 1, '', 'POST', 'Setting informantion added : <b>ChetsApp Pvt. Ltd.</b>', '123.201.70.158', NULL, '2020-02-11 04:02:29', '2020-02-11 04:02:29'),
(217, 1, 'CustomField', NULL, 1, '', 'PUT', 'CustomField informantion updated : <b>Test Field</b>', '123.201.70.158', NULL, '2020-02-11 04:06:37', '2020-02-11 04:06:37'),
(218, 1, 'Projects', NULL, 5, '', 'PUT', 'Projects informantion updated : <b>VipsCRM</b>', '123.201.70.158', NULL, '2020-02-11 04:14:00', '2020-02-11 04:14:00'),
(219, 1, 'Projects', NULL, 4, '', 'POST', 'Projects Status changed : <b>Game Zone</b>', '123.201.70.158', NULL, '2020-02-11 04:14:37', '2020-02-11 04:14:37'),
(220, 1, 'Projects', NULL, 3, '', 'POST', 'Projects Status changed : <b>Billing System</b>', '123.201.70.158', NULL, '2020-02-11 04:14:44', '2020-02-11 04:14:44'),
(221, 1, 'Projects', NULL, 2, '', 'POST', 'Projects Status changed : <b>Library Management System</b>', '123.201.70.158', NULL, '2020-02-11 04:14:51', '2020-02-11 04:14:51'),
(222, 1, 'Projects', NULL, 5, '', 'PUT', 'Projects informantion updated : <b>VipsCRM</b>', '123.201.70.158', NULL, '2020-02-11 04:21:58', '2020-02-11 04:21:58'),
(223, 1, 'Projects', NULL, 4, '', 'PUT', 'Projects informantion updated : <b>Game Zone</b>', '123.201.70.158', NULL, '2020-02-11 04:22:34', '2020-02-11 04:22:34'),
(224, 1, 'Projects', NULL, 3, '', 'PUT', 'Projects informantion updated : <b>Billing System</b>', '123.201.70.158', NULL, '2020-02-11 04:22:59', '2020-02-11 04:22:59'),
(225, 1, 'Projects', NULL, 2, '', 'PUT', 'Projects informantion updated : <b>Library Management System</b>', '123.201.70.158', NULL, '2020-02-11 04:23:25', '2020-02-11 04:23:25'),
(226, 1, 'Projects', NULL, 1, '', 'PUT', 'Projects informantion updated : <b>VipsPM(Angular8 With Laravel)</b>', '123.201.70.158', NULL, '2020-02-11 04:23:53', '2020-02-11 04:23:53'),
(227, 1, 'Defect', NULL, 18, '', 'POST', 'Defect informantion added : <b>Dashboard responsive issue.</b>', '123.201.70.158', NULL, '2020-02-11 04:29:56', '2020-02-11 04:29:56'),
(228, 1, 'Defect', NULL, 18, '', 'PUT', 'Defect informantion updated : <b>Dashboard responsive issue.</b>', '123.201.70.158', NULL, '2020-02-11 04:30:26', '2020-02-11 04:30:26'),
(229, 1, 'Defect', NULL, 19, '', 'POST', 'Defect informantion added : <b>Sidebar sub tab not active.</b>', '123.201.70.158', NULL, '2020-02-11 04:31:09', '2020-02-11 04:31:09'),
(230, 1, 'Defect', NULL, 20, '', 'POST', 'Defect informantion added : <b>Header and sidebar missing.</b>', '123.201.70.158', NULL, '2020-02-11 04:31:55', '2020-02-11 04:31:55'),
(231, 1, 'Defect', NULL, 21, '', 'POST', 'Defect informantion added : <b>ToDo list collapse not working.</b>', '123.201.70.158', NULL, '2020-02-11 04:32:36', '2020-02-11 04:32:36'),
(232, 1, 'Defect', NULL, 22, '', 'POST', 'Defect informantion added : <b>Toggle button is not working.</b>', '123.201.70.158', NULL, '2020-02-11 04:33:17', '2020-02-11 04:33:17'),
(233, 1, 'Defect', NULL, 23, '', 'POST', 'Defect informantion added : <b>Invoice PDF format is not like mentioned in HLD.</b>', '123.201.70.158', NULL, '2020-02-11 04:33:58', '2020-02-11 04:33:58'),
(234, 1, 'Incident', NULL, 10, '', 'POST', 'Incident informantion added : <b>Having an issue to create user.</b>', '123.201.70.158', NULL, '2020-02-11 04:35:01', '2020-02-11 04:35:01'),
(235, 1, 'Incident', NULL, 11, '', 'POST', 'Incident informantion added : <b>In customer listing some columns are missing.</b>', '123.201.70.158', NULL, '2020-02-11 04:35:25', '2020-02-11 04:35:25'),
(236, 1, 'Incident', NULL, 12, '', 'POST', 'Incident informantion added : <b>Listing and invoice PDF the amount number formatting not proper.</b>', '123.201.70.158', NULL, '2020-02-11 04:36:08', '2020-02-11 04:36:08'),
(237, 1, 'Incident', NULL, 13, '', 'POST', 'Incident informantion added : <b>In testing environment send email functionality not working.</b>', '123.201.70.158', NULL, '2020-02-11 04:36:41', '2020-02-11 04:36:41'),
(238, 1, 'Incident', NULL, 14, '', 'POST', 'Incident informantion added : <b>Group service termination functionality not working.</b>', '123.201.70.158', NULL, '2020-02-11 04:37:11', '2020-02-11 04:37:11'),
(239, 1, 'Incident', NULL, 15, '', 'POST', 'Incident informantion added : <b>Camera connection issue.</b>', '123.201.70.158', NULL, '2020-02-11 04:37:51', '2020-02-11 04:37:51'),
(240, 1, 'Incident', NULL, 16, '', 'POST', 'Incident informantion added : <b>Need to implement pagination in invoice pdf.</b>', '123.201.70.158', NULL, '2020-02-11 04:38:19', '2020-02-11 04:38:19'),
(241, 1, 'Projects', NULL, 2, '', 'POST', 'Projects Status changed : <b>Library Management System</b>', '123.201.70.158', NULL, '2020-02-11 04:41:34', '2020-02-11 04:41:34'),
(242, 1, 'Task', NULL, 28, '', 'POST', 'Task Status changed : <b>Diwali Celebrations</b>', '123.201.70.158', NULL, '2020-02-11 04:41:53', '2020-02-11 04:41:53'),
(243, 1, 'Task', NULL, 18, '', 'POST', 'Task Status changed : <b>Gather and add features/other content in documentation and broucher pages</b>', '123.201.70.158', NULL, '2020-02-11 04:42:29', '2020-02-11 04:42:29'),
(244, 1, 'Meeting', NULL, 6, '', 'POST', 'Meeting informantion added : <b>Game Zone Project Meeting</b>', '123.201.70.158', NULL, '2020-02-11 04:44:31', '2020-02-11 04:44:31'),
(245, 1, 'Meeting', NULL, 7, '', 'POST', 'Meeting informantion added : <b>Travel System Project Meeting</b>', '123.201.70.158', NULL, '2020-02-11 04:46:07', '2020-02-11 04:46:07'),
(246, 1, 'Meeting', NULL, 8, '', 'POST', 'Meeting informantion added : <b>PBS Sprint 2 SLD</b>', '123.201.70.158', NULL, '2020-02-11 04:47:34', '2020-02-11 04:47:34'),
(247, 13, 'Task', NULL, 38, '', 'POST', 'Task informantion added : <b>Upgrade system version</b>', '123.201.70.158', NULL, '2020-02-11 04:56:49', '2020-02-11 04:56:49'),
(248, 1, 'CustomField', NULL, 1, '', 'PUT', 'CustomField informantion updated : <b>Test Field</b>', '123.201.70.158', NULL, '2020-02-11 04:58:08', '2020-02-11 04:58:08'),
(249, 1, 'CustomField', NULL, 1, '', 'PUT', 'CustomField informantion updated : <b>Test Field</b>', '123.201.70.158', NULL, '2020-02-11 16:11:26', '2020-02-11 16:11:26'),
(250, 1, 'CustomField', NULL, 1, '', 'PUT', 'CustomField informantion updated : <b>Custom Field</b>', '123.201.70.158', NULL, '2020-02-11 16:11:41', '2020-02-11 16:11:41'),
(251, 1, 'CustomField', NULL, 1, '', 'PUT', 'CustomField informantion updated : <b>Custom Field 1</b>', '123.201.70.158', NULL, '2020-02-11 16:12:21', '2020-02-11 16:12:21'),
(252, 1, 'Department', NULL, 1, '', 'PUT', 'Department informantion updated : <b>Administration</b>', '123.201.70.158', NULL, '2020-02-11 16:14:45', '2020-02-11 16:14:45'),
(253, 13, 'User', NULL, 13, '', 'PUT', 'User informantion updated : <b>Kevin Bailey</b>', '123.201.70.158', NULL, '2020-02-11 16:21:05', '2020-02-11 16:21:05'),
(254, 13, 'User', NULL, 13, '', 'PUT', 'User informantion updated : <b>Kevin Bailey</b>', '123.201.70.158', NULL, '2020-02-11 16:21:11', '2020-02-11 16:21:11'),
(255, 13, 'FileBrowser', NULL, 2, '', 'POST', 'FileBrowser informantion added : <b>CAPL Kevin</b>', '123.201.70.158', NULL, '2020-02-11 16:22:31', '2020-02-11 16:22:31'),
(256, 1, 'Projects', NULL, 1, '', 'PUT', 'Projects informantion updated : <b>VipsPM(Angular8 With Laravel)</b>', '123.201.70.158', NULL, '2020-02-11 16:32:22', '2020-02-11 16:32:22'),
(257, 11, 'Task', NULL, 39, '', 'POST', 'Task informantion added : <b>Created post invoice listing.</b>', '123.201.70.158', NULL, '2020-02-11 16:38:40', '2020-02-11 16:38:40'),
(258, 11, 'Task', NULL, 40, '', 'POST', 'Task informantion added : <b>Created script for migrate subscription.</b>', '123.201.70.158', NULL, '2020-02-11 16:40:11', '2020-02-11 16:40:11'),
(259, 11, 'Task', NULL, 41, '', 'POST', 'Task informantion added : <b>Check invoice log and report.</b>', '123.201.70.158', NULL, '2020-02-11 16:41:12', '2020-02-11 16:41:12'),
(260, 1, 'Setting', NULL, 1, '', 'POST', 'Setting informantion added : <b>ChetsApp Pvt. Ltd.</b>', '123.201.67.147', NULL, '2020-02-12 15:52:21', '2020-02-12 15:52:21'),
(261, 1, 'Department', NULL, 1, '', 'PUT', 'Department informantion updated : <b>Administration</b>', '123.201.68.59', NULL, '2020-02-14 08:55:41', '2020-02-14 08:55:41'),
(262, 1, 'Department', NULL, 1, '', 'PUT', 'Department informantion updated : <b>Administration</b>', '123.201.68.59', NULL, '2020-02-14 08:57:30', '2020-02-14 08:57:30'),
(263, 11, 'Defect', NULL, 24, '', 'POST', 'Defect informantion added : <b>Service is not terminated in service termination module.</b>', '123.201.68.59', NULL, '2020-02-14 10:02:56', '2020-02-14 10:02:56'),
(264, 1, 'Task', NULL, 42, '', 'POST', 'Task informantion added : <b>File manager functionallity.</b>', '123.201.68.59', NULL, '2020-02-14 10:10:46', '2020-02-14 10:10:46'),
(265, 11, 'Defect', NULL, 25, '', 'POST', 'Defect informantion added : <b>Previous cycle invoice amount is not adjust agains current cycle.</b>', '123.201.68.59', NULL, '2020-02-14 11:08:00', '2020-02-14 11:08:00'),
(266, 11, 'Defect', NULL, 26, '', 'POST', 'Defect informantion added : <b>Generate invoice take more time.</b>', '123.201.68.59', NULL, '2020-02-14 11:09:04', '2020-02-14 11:09:04'),
(267, 11, 'Defect', NULL, 26, '', 'POST', 'Defect Status changed : <b>Generate invoice take more time.</b>', '123.201.68.59', NULL, '2020-02-14 11:10:36', '2020-02-14 11:10:36'),
(268, 11, 'Incident', NULL, 17, '', 'POST', 'Incident informantion added : <b>Outstanding report is wrong.</b>', '123.201.68.59', NULL, '2020-02-14 11:13:52', '2020-02-14 11:13:52'),
(269, 11, 'Incident', NULL, 18, '', 'POST', 'Incident informantion added : <b>Total active customer count is not match with client service portal.</b>', '123.201.68.59', NULL, '2020-02-14 11:14:19', '2020-02-14 11:14:19'),
(270, 11, 'Incident', NULL, 19, '', 'POST', 'Incident informantion added : <b>Service activation-termination api is not working in testing environment.</b>', '123.201.68.59', NULL, '2020-02-14 11:14:48', '2020-02-14 11:14:48'),
(271, 11, 'ToDo', NULL, 9, '', 'POST', 'ToDo informantion added : <b>Implement a business system in the test/QA environment.</b>', '123.201.68.59', NULL, '2020-02-14 11:16:48', '2020-02-14 11:16:48'),
(272, 11, 'ToDo', NULL, 10, '', 'POST', 'ToDo informantion added : <b>Install the product in the production environment.</b>', '123.201.68.59', NULL, '2020-02-14 11:17:39', '2020-02-14 11:17:39'),
(273, 11, 'ToDo', NULL, 11, '', 'POST', 'ToDo informantion added : <b>Meeting with developer team.</b>', '123.201.68.59', NULL, '2020-02-14 11:19:50', '2020-02-14 11:19:50'),
(274, 11, 'ToDo', NULL, 10, '', 'PUT', 'ToDo informantion updated : <b>Validate outstanding report.</b>', '123.201.68.59', NULL, '2020-02-14 11:20:21', '2020-02-14 11:20:21'),
(275, 11, 'ToDo', NULL, 9, '', 'PUT', 'ToDo informantion updated : <b>Check transaction log.</b>', '123.201.68.59', NULL, '2020-02-14 11:20:53', '2020-02-14 11:20:53'),
(276, 1, 'Department', NULL, 1, '', 'PUT', 'Department informantion updated : <b>Administration</b>', '123.201.68.59', NULL, '2020-02-14 11:26:28', '2020-02-14 11:26:28'),
(277, 1, 'Department', NULL, 1, '', 'PUT', 'Department informantion updated : <b>Administration</b>', '123.201.68.59', NULL, '2020-02-14 11:59:38', '2020-02-14 11:59:38'),
(278, 11, 'FileBrowser', NULL, 3, '', 'POST', 'FileBrowser informantion added : <b>CAPL Eric</b>', '123.201.68.59', NULL, '2020-02-14 12:00:59', '2020-02-14 12:00:59'),
(279, 11, 'Task', NULL, 40, '', 'PUT', 'Task informantion updated : <b>Created script for migrate subscription.</b>', '123.201.68.59', NULL, '2020-02-14 12:08:16', '2020-02-14 12:08:16'),
(280, 1, 'User', NULL, 2, '', 'PUT', 'User informantion updated : <b>Elodia Weisz</b>', '::1', NULL, '2020-02-20 09:12:18', '2020-02-20 09:12:18'),
(281, 1, 'User', NULL, 3, '', 'PUT', 'User informantion updated : <b>Raeann Haner</b>', '::1', NULL, '2020-02-20 09:14:48', '2020-02-20 09:14:48'),
(282, 1, 'User', NULL, 2, '', 'PUT', 'User informantion updated : <b>Elodia Weisz</b>', '::1', NULL, '2020-02-20 09:16:05', '2020-02-20 09:16:05'),
(283, 1, 'User', NULL, 4, '', 'PUT', 'User informantion updated : <b>Junie Landa</b>', '::1', NULL, '2020-02-20 09:16:31', '2020-02-20 09:16:31'),
(284, 1, 'User', NULL, 5, '', 'PUT', 'User informantion updated : <b>Denim Leak</b>', '::1', NULL, '2020-02-20 09:17:31', '2020-02-20 09:17:31');
INSERT INTO `vipscapl_user_activities` (`id`, `user_id`, `module`, `self_parent_id`, `module_field_id`, `diff_for_humans`, `action`, `description`, `ip_address`, `deleted_at`, `created_at`, `updated_at`) VALUES
(285, 1, 'User', NULL, 6, '', 'PUT', 'User informantion updated : <b>Helene Kramer</b>', '::1', NULL, '2020-02-20 09:18:20', '2020-02-20 09:18:20'),
(286, 1, 'User', NULL, 7, '', 'PUT', 'User informantion updated : <b>Troy Russo</b>', '::1', NULL, '2020-02-20 09:20:35', '2020-02-20 09:20:35'),
(287, 1, 'User', NULL, 8, '', 'PUT', 'User informantion updated : <b>Howard Martinez</b>', '::1', NULL, '2020-02-20 09:21:34', '2020-02-20 09:21:34'),
(288, 1, 'User', NULL, 9, '', 'PUT', 'User informantion updated : <b>Harry Bennett</b>', '::1', NULL, '2020-02-20 09:22:16', '2020-02-20 09:22:16'),
(289, 1, 'User', NULL, 10, '', 'PUT', 'User informantion updated : <b>Gilbert Alexander</b>', '::1', NULL, '2020-02-20 09:23:00', '2020-02-20 09:23:00'),
(290, 1, 'User', NULL, 13, '', 'PUT', 'User informantion updated : <b>Kevin Bailey</b>', '::1', NULL, '2020-02-20 09:23:46', '2020-02-20 09:23:46'),
(291, 1, 'User', NULL, 14, '', 'PUT', 'User informantion updated : <b>Milan Unjiya</b>', '::1', NULL, '2020-02-20 09:24:27', '2020-02-20 09:24:27'),
(292, 1, 'Projects', NULL, 5, '', 'PUT', 'Projects informantion updated : <b>VipsCRM</b>', '::1', NULL, '2020-02-20 09:27:42', '2020-02-20 09:27:42'),
(293, 1, 'Projects', NULL, 4, '', 'PUT', 'Projects informantion updated : <b>Game Zone</b>', '::1', NULL, '2020-02-20 09:28:17', '2020-02-20 09:28:17'),
(294, 1, 'Projects', NULL, 3, '', 'PUT', 'Projects informantion updated : <b>Billing System</b>', '::1', NULL, '2020-02-20 09:29:22', '2020-02-20 09:29:22'),
(295, 1, 'Projects', NULL, 2, '', 'PUT', 'Projects informantion updated : <b>Library Management System</b>', '::1', NULL, '2020-02-20 09:30:01', '2020-02-20 09:30:01'),
(296, 1, 'Projects', NULL, 1, '', 'PUT', 'Projects informantion updated : <b>VipsPM(Angular8 With Laravel)</b>', '::1', NULL, '2020-02-20 09:30:27', '2020-02-20 09:30:27'),
(297, 1, 'Department', NULL, 1, '', 'PUT', 'Department informantion updated : <b>Administration</b>', '::1', NULL, '2020-02-25 12:42:08', '2020-02-25 12:42:08'),
(298, 1, 'Provider', NULL, 1, '', 'POST', 'Provider informantion added : <b>Krishnakant Pandya</b>', '::1', NULL, '2020-02-25 12:44:24', '2020-02-25 12:44:24'),
(299, 1, 'Appointments', NULL, 1, '', 'POST', 'Appointments informantion added : <b></b>', '::1', NULL, '2020-02-25 12:46:37', '2020-02-25 12:46:37'),
(300, 1, 'Provider', NULL, 2, '', 'POST', 'Provider informantion added : <b>Angelo Sauer</b>', '::1', NULL, '2020-02-25 12:50:09', '2020-02-25 12:50:09'),
(301, 1, 'Provider', NULL, 3, '', 'POST', 'Provider informantion added : <b>Neal Muller</b>', '::1', NULL, '2020-02-25 12:50:27', '2020-02-25 12:50:27'),
(302, 1, 'Provider', NULL, 4, '', 'POST', 'Provider informantion added : <b>Lorenz Kuhic</b>', '::1', NULL, '2020-02-25 12:50:46', '2020-02-25 12:50:46'),
(303, 1, 'Provider', NULL, 5, '', 'POST', 'Provider informantion added : <b>Weston Effertz</b>', '::1', NULL, '2020-02-25 12:51:04', '2020-02-25 12:51:04'),
(304, 1, 'Appointments', NULL, 2, '', 'POST', 'Appointments informantion added : <b></b>', '::1', NULL, '2020-02-25 12:52:54', '2020-02-25 12:52:54'),
(305, 1, 'Appointments', NULL, 3, '', 'POST', 'Appointments informantion added : <b></b>', '::1', NULL, '2020-02-25 12:55:48', '2020-02-25 12:55:48'),
(306, 1, 'Appointments', NULL, 4, '', 'POST', 'Appointments informantion added : <b></b>', '::1', NULL, '2020-02-25 12:57:17', '2020-02-25 12:57:17'),
(307, 1, 'Appointments', NULL, 4, '', 'PUT', 'Appointments informantion updated : <b></b>', '::1', NULL, '2020-02-25 12:57:58', '2020-02-25 12:57:58'),
(308, 1, 'Appointments', NULL, 4, '', 'PUT', 'Appointments informantion updated : <b></b>', '::1', NULL, '2020-02-25 12:58:36', '2020-02-25 12:58:36'),
(309, 1, 'Appointments', NULL, 3, '', 'PUT', 'Appointments informantion updated : <b></b>', '::1', NULL, '2020-02-25 12:58:54', '2020-02-25 12:58:54'),
(310, 1, 'Appointments', NULL, 2, '', 'PUT', 'Appointments informantion updated : <b></b>', '::1', NULL, '2020-02-25 12:59:11', '2020-02-25 12:59:11'),
(311, 1, 'Department', NULL, 1, '', 'PUT', 'Department informantion updated : <b>Administration</b>', '::1', NULL, '2020-02-25 13:00:33', '2020-02-25 13:00:33'),
(312, 1, 'Department', NULL, 1, '', 'PUT', 'Department informantion updated : <b>Administration</b>', '::1', NULL, '2020-02-25 13:00:54', '2020-02-25 13:00:54'),
(313, 11, 'Appointments', NULL, 4, '', 'PUT', 'Appointments informantion updated : <b></b>', '::1', NULL, '2020-02-25 13:02:22', '2020-02-25 13:02:22'),
(314, 1, 'Department', NULL, 1, '', 'PUT', 'Department informantion updated : <b>Administration</b>', '::1', NULL, '2020-03-04 05:29:28', '2020-03-04 05:29:28'),
(315, 1, 'Department', NULL, 1, '', 'PUT', 'Department informantion updated : <b>Administration</b>', '::1', NULL, '2020-03-04 05:29:45', '2020-03-04 05:29:45'),
(316, 1, 'Department', NULL, 1, '', 'PUT', 'Department informantion updated : <b>Administration</b>', '::1', NULL, '2020-03-04 05:30:00', '2020-03-04 05:30:00'),
(317, 1, 'Setting', NULL, 1, '', 'POST', 'Setting informantion added : <b>ChetsApp Pvt. Ltd.</b>', '::1', NULL, '2020-03-04 05:34:46', '2020-03-04 05:34:46'),
(318, 1, 'Setting', NULL, 1, '', 'POST', 'Setting informantion added : <b>ChetsApp Pvt. Ltd.</b>', '::1', NULL, '2020-03-04 05:35:03', '2020-03-04 05:35:03'),
(319, 1, 'Setting', NULL, 1, '', 'POST', 'Setting informantion added : <b>ChetsApp Pvt. Ltd.</b>', '::1', NULL, '2020-03-04 05:35:09', '2020-03-04 05:35:09'),
(320, 1, 'Setting', NULL, 1, '', 'POST', 'Setting informantion added : <b>ChetsApp Pvt. Ltd.</b>', '::1', NULL, '2020-03-04 05:35:12', '2020-03-04 05:35:12'),
(321, 1, 'Setting', NULL, 1, '', 'POST', 'Setting informantion added : <b>ChetsApp Pvt. Ltd.</b>', '::1', NULL, '2020-03-04 05:35:23', '2020-03-04 05:35:23'),
(322, 1, 'Setting', NULL, 1, '', 'POST', 'Setting informantion added : <b>ChetsApp Pvt. Ltd.</b>', '::1', NULL, '2020-03-04 05:36:07', '2020-03-04 05:36:07'),
(323, 1, 'Setting', NULL, 1, '', 'POST', 'Setting informantion added : <b>ChetsApp Pvt. Ltd.</b>', '::1', NULL, '2020-03-04 05:36:13', '2020-03-04 05:36:13'),
(324, 1, 'Setting', NULL, 1, '', 'POST', 'Setting informantion added : <b>ChetsApp Pvt. Ltd.</b>', '::1', NULL, '2020-03-04 05:36:18', '2020-03-04 05:36:18'),
(325, 1, 'Setting', NULL, 1, '', 'POST', 'Setting informantion added : <b>ChetsApp Pvt. Ltd.</b>', '::1', NULL, '2020-03-04 05:36:36', '2020-03-04 05:36:36'),
(326, 1, 'Setting', NULL, 1, '', 'POST', 'Setting informantion added : <b>ChetsApp Pvt. Ltd.</b>', '::1', NULL, '2020-03-04 05:36:44', '2020-03-04 05:36:44'),
(327, 1, 'Setting', NULL, 1, '', 'POST', 'Setting informantion added : <b>ChetsApp Pvt. Ltd.</b>', '::1', NULL, '2020-03-04 05:36:48', '2020-03-04 05:36:48'),
(328, 1, 'Setting', NULL, 1, '', 'POST', 'Setting informantion added : <b>ChetsApp Pvt. Ltd.</b>', '::1', NULL, '2020-03-04 05:36:53', '2020-03-04 05:36:53'),
(329, 1, 'Setting', NULL, 1, '', 'POST', 'Setting informantion added : <b>ChetsApp Pvt. Ltd.</b>', '::1', NULL, '2020-03-04 05:36:57', '2020-03-04 05:36:57'),
(330, 1, 'Setting', NULL, 1, '', 'POST', 'Setting informantion added : <b>ChetsApp Pvt. Ltd.</b>', '::1', NULL, '2020-03-04 05:37:15', '2020-03-04 05:37:15'),
(331, 1, 'Setting', NULL, 1, '', 'POST', 'Setting informantion added : <b>ChetsApp Pvt. Ltd.</b>', '::1', NULL, '2020-03-04 05:37:20', '2020-03-04 05:37:20'),
(332, 1, 'Setting', NULL, 1, '', 'POST', 'Setting informantion added : <b>ChetsApp Pvt. Ltd.</b>', '::1', NULL, '2020-03-04 05:37:29', '2020-03-04 05:37:29'),
(333, 1, 'Setting', NULL, 1, '', 'POST', 'Setting informantion added : <b>ChetsApp Pvt. Ltd.</b>', '::1', NULL, '2020-03-04 05:37:35', '2020-03-04 05:37:35'),
(334, 1, 'Setting', NULL, 1, '', 'POST', 'Setting informantion added : <b>ChetsApp Pvt. Ltd.</b>', '::1', NULL, '2020-03-04 05:37:40', '2020-03-04 05:37:40'),
(335, 1, 'Setting', NULL, 1, '', 'POST', 'Setting informantion added : <b>ChetsApp Pvt. Ltd.</b>', '::1', NULL, '2020-03-04 05:37:45', '2020-03-04 05:37:45'),
(336, 1, 'Setting', NULL, 1, '', 'POST', 'Setting informantion added : <b>ChetsApp Pvt. Ltd.</b>', '::1', NULL, '2020-03-04 05:37:48', '2020-03-04 05:37:48'),
(337, 1, 'Setting', NULL, 1, '', 'POST', 'Setting informantion added : <b>ChetsApp Pvt. Ltd.</b>', '::1', NULL, '2020-03-04 05:37:51', '2020-03-04 05:37:51'),
(338, 1, 'Setting', NULL, 1, '', 'POST', 'Setting informantion added : <b>ChetsApp Pvt. Ltd.</b>', '::1', NULL, '2020-03-04 05:38:44', '2020-03-04 05:38:44'),
(339, 1, 'Setting', NULL, 1, '', 'POST', 'Setting informantion added : <b>ChetsApp Pvt. Ltd.</b>', '::1', NULL, '2020-03-04 05:38:48', '2020-03-04 05:38:48'),
(340, 1, 'Setting', NULL, 1, '', 'POST', 'Setting informantion added : <b>ChetsApp Pvt. Ltd.</b>', '::1', NULL, '2020-03-04 05:38:52', '2020-03-04 05:38:52'),
(341, 1, 'Setting', NULL, 1, '', 'POST', 'Setting informantion added : <b>ChetsApp Pvt. Ltd.</b>', '::1', NULL, '2020-03-04 05:39:04', '2020-03-04 05:39:04'),
(342, 1, 'Setting', NULL, 1, '', 'POST', 'Setting informantion added : <b>ChetsApp Pvt. Ltd.</b>', '::1', NULL, '2020-03-04 05:39:08', '2020-03-04 05:39:08'),
(343, 1, 'Setting', NULL, 1, '', 'POST', 'Setting informantion added : <b>ChetsApp Pvt. Ltd.</b>', '::1', NULL, '2020-03-04 05:39:19', '2020-03-04 05:39:19'),
(344, 1, 'Setting', NULL, 1, '', 'POST', 'Setting informantion added : <b>ChetsApp Pvt. Ltd.</b>', '::1', NULL, '2020-03-04 05:39:24', '2020-03-04 05:39:24'),
(345, 1, 'Setting', NULL, 1, '', 'POST', 'Setting informantion added : <b>ChetsApp Pvt. Ltd.</b>', '::1', NULL, '2020-03-04 05:39:29', '2020-03-04 05:39:29'),
(346, 1, 'Setting', NULL, 1, '', 'POST', 'Setting informantion added : <b>ChetsApp Pvt. Ltd.</b>', '::1', NULL, '2020-03-04 05:39:36', '2020-03-04 05:39:36'),
(347, 1, 'Setting', NULL, 1, '', 'POST', 'Setting informantion added : <b>ChetsApp Pvt. Ltd.</b>', '::1', NULL, '2020-03-04 05:39:41', '2020-03-04 05:39:41'),
(348, 1, 'Setting', NULL, 1, '', 'POST', 'Setting informantion added : <b>ChetsApp Pvt. Ltd.</b>', '::1', NULL, '2020-03-04 05:39:59', '2020-03-04 05:39:59'),
(349, 1, 'Setting', NULL, 1, '', 'POST', 'Setting informantion added : <b>ChetsApp Pvt. Ltd.</b>', '::1', NULL, '2020-03-04 05:40:03', '2020-03-04 05:40:03'),
(350, 1, 'Project', 5, 5, NULL, 'PUT', 'Project Updated : <b>VipsCRM</b>', '::1', NULL, '2020-05-18 06:48:38', '2020-05-18 06:48:38'),
(351, 1, 'Project', 1, 1, NULL, 'PUT', 'Project Updated : <b>VipsPM(Angular8 With Laravel)</b>', '::1', NULL, '2020-05-18 08:34:11', '2020-05-18 08:34:11'),
(352, 1, 'Project', 2, 2, NULL, 'PUT', 'Project Updated : <b>Library Management System</b>', '::1', NULL, '2020-05-18 08:34:39', '2020-05-18 08:34:39'),
(353, 1, 'Project', 1, 1, NULL, 'PUT', 'Project Updated : <b>VipsPM(Angular8 With Laravel)</b>', '::1', NULL, '2020-05-18 08:35:06', '2020-05-18 08:35:06'),
(354, 1, 'Project', 3, 3, NULL, 'PUT', 'Project Updated : <b>Billing System</b>', '::1', NULL, '2020-05-18 08:35:25', '2020-05-18 08:35:25'),
(355, 1, 'Project', 4, 4, NULL, 'PUT', 'Project Updated : <b>Game Zone</b>', '::1', NULL, '2020-05-18 08:35:41', '2020-05-18 08:35:41'),
(356, 1, 'Project', 5, 5, NULL, 'PUT', 'Project Updated : <b>VipsCRM</b>', '::1', NULL, '2020-05-18 08:36:02', '2020-05-18 08:36:02'),
(357, 1, 'User', NULL, 2, NULL, 'PUT', 'User Updated : <b>Elodia Weisz</b>', '::1', NULL, '2020-05-18 08:39:00', '2020-05-18 08:39:00'),
(358, 1, 'User', NULL, 3, NULL, 'PUT', 'User Updated : <b>Raeann Haner</b>', '::1', NULL, '2020-05-18 08:39:29', '2020-05-18 08:39:29'),
(359, 1, 'User', NULL, 4, NULL, 'PUT', 'User Updated : <b>Junie Landa</b>', '::1', NULL, '2020-05-18 08:40:42', '2020-05-18 08:40:42'),
(360, 1, 'User', NULL, 5, NULL, 'PUT', 'User Updated : <b>Denim Leak</b>', '::1', NULL, '2020-05-18 08:41:20', '2020-05-18 08:41:20'),
(361, 1, 'User', NULL, 6, NULL, 'PUT', 'User Updated : <b>Helene Kramer</b>', '::1', NULL, '2020-05-18 08:41:57', '2020-05-18 08:41:57'),
(362, 1, 'User', NULL, 7, NULL, 'PUT', 'User Updated : <b>Troy Russo</b>', '::1', NULL, '2020-05-18 08:42:33', '2020-05-18 08:42:33'),
(363, 1, 'User', NULL, 8, NULL, 'PUT', 'User Updated : <b>Howard Martinez</b>', '::1', NULL, '2020-05-18 08:45:45', '2020-05-18 08:45:45'),
(364, 1, 'User', NULL, 9, NULL, 'PUT', 'User Updated : <b>Harry Bennett</b>', '::1', NULL, '2020-05-18 08:46:11', '2020-05-18 08:46:11'),
(365, 1, 'User', NULL, 10, NULL, 'PUT', 'User Updated : <b>Gilbert Alexander</b>', '::1', NULL, '2020-05-18 08:46:40', '2020-05-18 08:46:40'),
(366, 1, 'User', NULL, 13, NULL, 'PUT', 'User Updated : <b>Kevin Bailey</b>', '::1', NULL, '2020-05-18 08:47:25', '2020-05-18 08:47:25'),
(367, 1, 'User', NULL, 14, NULL, 'PUT', 'User Updated : <b>Milan Unjiya</b>', '::1', NULL, '2020-05-18 08:47:50', '2020-05-18 08:47:50'),
(368, 1, 'Setting', NULL, 1, NULL, 'POST', 'Setting Added : <b>ChetsApp Pvt. Ltd.</b>', '::1', NULL, '2020-05-18 08:48:27', '2020-05-18 08:48:27'),
(369, 1, 'Setting', NULL, 1, NULL, 'POST', 'Setting Added : <b>ChetsApp Pvt. Ltd.</b>', '::1', NULL, '2020-05-18 08:48:49', '2020-05-18 08:48:49'),
(370, 1, 'Setting', NULL, 1, NULL, 'POST', 'Setting Added : <b>ChetsApp Pvt. Ltd.</b>', '::1', NULL, '2020-05-18 08:48:58', '2020-05-18 08:48:58'),
(371, 1, 'Setting', NULL, 1, NULL, 'POST', 'Setting Added : <b>ChetsApp Pvt. Ltd.</b>', '::1', NULL, '2020-05-18 08:49:06', '2020-05-18 08:49:06'),
(372, 1, 'Setting', NULL, 1, NULL, 'POST', 'Setting Added : <b>ChetsApp Pvt. Ltd.</b>', '::1', NULL, '2020-05-18 08:49:15', '2020-05-18 08:49:15'),
(373, 1, 'Todo', NULL, 1, NULL, 'POST', 'Todo Added : <b>Send documents to vips patel.</b>', '::1', NULL, '2020-05-18 08:51:31', '2020-05-18 08:51:31'),
(374, 1, 'Todo', NULL, 2, NULL, 'POST', 'Todo Added : <b>Fixed auto reload dashboard issue.</b>', '::1', NULL, '2020-05-18 08:53:57', '2020-05-18 08:53:57'),
(375, 1, 'Todo', NULL, 3, NULL, 'POST', 'Todo Added : <b>Add previous bill amount in invoice.</b>', '::1', NULL, '2020-05-18 08:55:20', '2020-05-18 08:55:20'),
(376, 1, 'Todo', NULL, 4, NULL, 'POST', 'Todo Added : <b>Verify group service termination API.</b>', '::1', NULL, '2020-05-18 08:57:55', '2020-05-18 08:57:55'),
(377, 1, 'Todo', NULL, 4, NULL, 'PUT', 'Todo Updated : <b>Verify group service termination API.</b>', '::1', NULL, '2020-05-18 08:58:06', '2020-05-18 08:58:06'),
(378, 1, 'Todo', NULL, 5, NULL, 'POST', 'Todo Added : <b>Prepare the production environment.</b>', '::1', NULL, '2020-05-18 09:02:32', '2020-05-18 09:02:32'),
(379, 1, 'Todo', NULL, 5, NULL, 'PUT', 'Todo Updated : <b>Prepare the production environment.</b>', '::1', NULL, '2020-05-18 09:02:39', '2020-05-18 09:02:39'),
(380, 1, 'Todo', NULL, 6, NULL, 'POST', 'Todo Added : <b>Prepare testing doc file structure.</b>', '::1', NULL, '2020-05-18 09:04:29', '2020-05-18 09:04:29'),
(381, 1, 'Todo', NULL, 6, NULL, 'PUT', 'Todo Updated : <b>Prepare testing doc file structure.</b>', '::1', NULL, '2020-05-18 09:04:37', '2020-05-18 09:04:37'),
(382, 1, 'Meeting', NULL, 8, NULL, 'PUT', 'Meeting Updated : <b>PBS Sprint 2 SLD</b>', '::1', NULL, '2020-05-18 09:20:44', '2020-05-18 09:20:44'),
(383, 1, 'Meeting', NULL, 8, NULL, 'PUT', 'Meeting Updated : <b>PBS Sprint 2 SLD</b>', '::1', NULL, '2020-05-18 09:23:09', '2020-05-18 09:23:09'),
(384, 1, 'Meeting', NULL, 8, NULL, 'PUT', 'Meeting Updated : <b>PBS Sprint 2 SLD</b>', '::1', NULL, '2020-05-18 09:25:20', '2020-05-18 09:25:20'),
(385, 1, 'Meeting', NULL, 4, NULL, 'PUT', 'Meeting Updated : <b>Project release and testing.</b>', '::1', NULL, '2020-05-18 09:26:35', '2020-05-18 09:26:35'),
(386, 1, 'Meeting', NULL, 8, NULL, 'PUT', 'Meeting Updated : <b>PBS Sprint 2 SLD.</b>', '::1', NULL, '2020-05-18 09:26:46', '2020-05-18 09:26:46'),
(387, 1, 'Meeting', NULL, 4, NULL, 'PUT', 'Meeting Updated : <b>Project release and testing.</b>', '::1', NULL, '2020-05-18 09:28:30', '2020-05-18 09:28:30'),
(388, 1, 'Meeting', NULL, 7, NULL, 'PUT', 'Meeting Updated : <b>Travel System Project Meeting.</b>', '::1', NULL, '2020-05-18 09:28:49', '2020-05-18 09:28:49'),
(389, 1, 'Meeting', NULL, 6, NULL, 'PUT', 'Meeting Updated : <b>Game Zone Project Meeting.</b>', '::1', NULL, '2020-05-18 09:29:08', '2020-05-18 09:29:08'),
(390, 1, 'Meeting', NULL, 3, NULL, 'PUT', 'Meeting Updated : <b>CRM project kickoff</b>', '::1', NULL, '2020-05-18 09:29:42', '2020-05-18 09:29:42'),
(391, 1, 'Meeting', NULL, 2, NULL, 'PUT', 'Meeting Updated : <b>Code Review</b>', '::1', NULL, '2020-05-18 09:30:28', '2020-05-18 09:30:28'),
(392, 1, 'Meeting', NULL, 8, NULL, 'PUT', 'Meeting Updated : <b>PBS Sprint 2 SLD.</b>', '::1', NULL, '2020-05-18 09:32:45', '2020-05-18 09:32:45'),
(393, 1, 'Meeting', NULL, 7, NULL, 'PUT', 'Meeting Updated : <b>Travel System Project Meeting.</b>', '::1', NULL, '2020-05-18 09:33:13', '2020-05-18 09:33:13'),
(394, 1, 'Meeting', NULL, 1, NULL, 'PUT', 'Meeting Updated : <b>Angular V7 workshop</b>', '::1', NULL, '2020-05-18 09:33:41', '2020-05-18 09:33:41'),
(395, 1, 'Setting', NULL, 1, NULL, 'POST', 'Setting Added : <b>ChetsApp Pvt. Ltd.</b>', '::1', NULL, '2020-05-18 10:09:55', '2020-05-18 10:09:55'),
(396, 1, 'Setting', NULL, 1, NULL, 'POST', 'Setting Added : <b>ChetsApp Pvt. Ltd.</b>', '::1', NULL, '2020-05-18 10:10:56', '2020-05-18 10:10:56'),
(397, 1, 'Department', NULL, 1, NULL, 'PUT', 'Department Updated : <b>Administration</b>', '::1', NULL, '2020-05-18 10:17:25', '2020-05-18 10:17:25'),
(398, 1, 'Department', NULL, 1, NULL, 'PUT', 'Department Updated : <b>Administration</b>', '::1', NULL, '2020-05-18 10:19:32', '2020-05-18 10:19:32'),
(399, 1, 'Department', NULL, 1, NULL, 'PUT', 'Department Updated : <b>Administration</b>', '::1', NULL, '2020-05-18 10:21:04', '2020-05-18 10:21:04'),
(400, 1, 'Setting', NULL, 1, NULL, 'POST', 'Setting Added : <b>ChetsApp Pvt. Ltd.</b>', '::1', NULL, '2020-05-18 10:29:29', '2020-05-18 10:29:29'),
(401, 1, 'CustomField', NULL, 2, NULL, 'POST', 'Custom Field Added : <b>Custom Field 1</b>', '::1', NULL, '2020-05-18 10:30:26', '2020-05-18 10:30:26'),
(402, 1, 'CustomField', NULL, 3, NULL, 'POST', 'Custom Field Added : <b>Custom Field 1</b>', '::1', NULL, '2020-05-18 10:30:45', '2020-05-18 10:30:45'),
(403, 1, 'CustomField', NULL, 4, NULL, 'POST', 'Custom Field Added : <b>Custom Field 1</b>', '::1', NULL, '2020-05-18 10:31:05', '2020-05-18 10:31:05'),
(404, 1, 'User', NULL, 12, NULL, 'PUT', 'User Updated : <b>Simone Griffin</b>', '::1', NULL, '2020-05-18 10:35:54', '2020-05-18 10:35:54'),
(405, 1, 'Provider', NULL, 5, NULL, 'PUT', 'Provider Updated : <b>Weston Effertz</b>', '::1', NULL, '2020-05-18 10:38:12', '2020-05-18 10:38:12'),
(406, 1, 'Provider', NULL, 4, NULL, 'PUT', 'Provider Updated : <b>Lorenz Kuhic</b>', '::1', NULL, '2020-05-18 10:40:08', '2020-05-18 10:40:08'),
(407, 1, 'Provider', NULL, 3, NULL, 'PUT', 'Provider Updated : <b>Neal Muller</b>', '::1', NULL, '2020-05-18 10:41:14', '2020-05-18 10:41:14'),
(408, 1, 'Provider', NULL, 2, NULL, 'PUT', 'Provider Updated : <b>Angelo Sauer</b>', '::1', NULL, '2020-05-18 10:43:03', '2020-05-18 10:43:03'),
(409, 1, 'Provider', NULL, 1, NULL, 'PUT', 'Provider Updated : <b>Krishnakant Pandya</b>', '::1', NULL, '2020-05-18 10:43:41', '2020-05-18 10:43:41'),
(410, 1, 'Provider', NULL, 2, NULL, 'PUT', 'Provider Updated : <b>Angelo Sauer</b>', '::1', NULL, '2020-05-18 10:43:59', '2020-05-18 10:43:59'),
(411, 1, 'Provider', NULL, 3, NULL, 'PUT', 'Provider Updated : <b>Neal Muller</b>', '::1', NULL, '2020-05-18 10:44:13', '2020-05-18 10:44:13'),
(412, 1, 'Provider', NULL, 4, NULL, 'PUT', 'Provider Updated : <b>Lorenz Kuhic</b>', '::1', NULL, '2020-05-18 10:44:26', '2020-05-18 10:44:26'),
(413, 1, 'ProjectPlannerSprint', NULL, 1, NULL, 'POST', 'Project Planner Sprint Added : <b>Sprint 1</b>', '::1', NULL, '2020-05-18 10:45:28', '2020-05-18 10:45:28'),
(414, 1, 'FileBrowser', NULL, 4, NULL, 'POST', 'File Browser Added : <b>VipsPM</b>', '::1', NULL, '2020-05-18 10:48:13', '2020-05-18 10:48:13'),
(415, 13, 'Todo', NULL, 7, NULL, 'POST', 'Todo Added : <b>Send documents to vips patel.</b>', '::1', NULL, '2020-05-18 10:50:54', '2020-05-18 10:50:54'),
(416, 13, 'Todo', NULL, 8, NULL, 'POST', 'Todo Added : <b>Backup source code and database.</b>', '::1', NULL, '2020-05-18 10:51:55', '2020-05-18 10:51:55'),
(417, 13, 'Todo', NULL, 9, NULL, 'POST', 'Todo Added : <b>Debuge incoide generation process.</b>', '::1', NULL, '2020-05-18 10:52:34', '2020-05-18 10:52:34'),
(418, 13, 'Todo', NULL, 10, NULL, 'POST', 'Todo Added : <b>Check different testing credintial.</b>', '::1', NULL, '2020-05-18 10:53:13', '2020-05-18 10:53:13'),
(419, 13, 'Todo', NULL, 11, NULL, 'POST', 'Todo Added : <b>Prepare the local environment.</b>', '::1', NULL, '2020-05-18 10:58:44', '2020-05-18 10:58:44'),
(420, 13, 'Todo', NULL, 11, NULL, 'PUT', 'Todo Updated : <b>Prepare the local environment.</b>', '::1', NULL, '2020-05-18 10:59:07', '2020-05-18 10:59:07'),
(421, 1, 'Department', NULL, 1, NULL, 'PUT', 'Department Updated : <b>Administration</b>', '::1', NULL, '2020-05-18 11:02:36', '2020-05-18 11:02:36'),
(422, 13, 'FileBrowser', NULL, 5, NULL, 'POST', 'File Browser Added : <b>VipsPM</b>', '::1', NULL, '2020-05-18 11:05:52', '2020-05-18 11:05:52'),
(423, 11, 'Todo', NULL, 12, NULL, 'POST', 'Todo Added : <b>Send documents to vips patel.</b>', '::1', NULL, '2020-05-18 11:14:32', '2020-05-18 11:14:32'),
(424, 11, 'Todo', NULL, 13, NULL, 'POST', 'Todo Added : <b>Upload documents.</b>', '::1', NULL, '2020-05-18 11:15:15', '2020-05-18 11:15:15'),
(425, 11, 'Todo', NULL, 14, NULL, 'POST', 'Todo Added : <b>Report invoice number with reason.</b>', '::1', NULL, '2020-05-18 11:16:46', '2020-05-18 11:16:46'),
(426, 11, 'Todo', NULL, 15, NULL, 'POST', 'Todo Added : <b>Report customer count issue.</b>', '::1', NULL, '2020-05-18 11:17:53', '2020-05-18 11:17:53'),
(427, 11, 'Todo', NULL, 16, NULL, 'POST', 'Todo Added : <b>lorem ipsum dolor sit amet consectetuer adipiscing elita</b>', '::1', NULL, '2020-05-18 11:19:43', '2020-05-18 11:19:43'),
(428, 11, 'Todo', NULL, 16, NULL, 'PUT', 'Todo Updated : <b>lorem ipsum dolor sit amet consectetuer adipiscing elita</b>', '::1', NULL, '2020-05-18 11:19:50', '2020-05-18 11:19:50'),
(429, 11, 'FileBrowser', NULL, 6, NULL, 'POST', 'File Browser Added : <b>VipsPM</b>', '::1', NULL, '2020-05-18 11:29:33', '2020-05-18 11:29:33');

-- --------------------------------------------------------

--
-- Table structure for table `vipscapl_user_role_department`
--

CREATE TABLE `vipscapl_user_role_department` (
  `id` int(10) UNSIGNED NOT NULL,
  `department_id` int(10) UNSIGNED NOT NULL,
  `role_id` int(10) UNSIGNED NOT NULL,
  `user_id` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `vipscapl_user_role_department`
--

INSERT INTO `vipscapl_user_role_department` (`id`, `department_id`, `role_id`, `user_id`) VALUES
(13, 1, 3, 11),
(14, 1, 3, 12),
(20, 1, 1, 1),
(23, 1, 2, 3),
(24, 1, 1, 2),
(25, 1, 2, 4),
(26, 1, 2, 5),
(27, 1, 2, 6),
(28, 1, 2, 7),
(29, 1, 2, 8),
(30, 1, 2, 9),
(31, 1, 2, 10),
(32, 1, 2, 13),
(33, 1, 2, 14);

-- --------------------------------------------------------

--
-- Table structure for table `vipscapl_user_settings`
--

CREATE TABLE `vipscapl_user_settings` (
  `id` int(10) UNSIGNED NOT NULL,
  `company_name` varchar(150) COLLATE utf8_unicode_ci DEFAULT NULL,
  `company_legal_name` varchar(150) COLLATE utf8_unicode_ci DEFAULT NULL,
  `company_short_name` varchar(50) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'VipsPM',
  `contact_person` varchar(150) COLLATE utf8_unicode_ci DEFAULT NULL,
  `company_address` text COLLATE utf8_unicode_ci,
  `company_country` bigint(20) NOT NULL DEFAULT '8',
  `company_city` varchar(150) COLLATE utf8_unicode_ci DEFAULT NULL,
  `company_zipcode` varchar(10) COLLATE utf8_unicode_ci DEFAULT NULL,
  `company_phone` varchar(15) COLLATE utf8_unicode_ci DEFAULT NULL,
  `company_email` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `company_website` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `company_from_email` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `post_mark` tinyint(1) NOT NULL DEFAULT '0',
  `smtp_protocol` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `smtp_host` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `smtp_user` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `smtp_password` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `smtp_port` varchar(10) COLLATE utf8_unicode_ci DEFAULT NULL,
  `smtp_encryption` varchar(10) COLLATE utf8_unicode_ci DEFAULT NULL,
  `sparkpost_secret` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `mailgun_domain` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `mailgun_secret` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `mandrill_secret` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `is_announcement_notification` tinyint(1) NOT NULL DEFAULT '0',
  `active_cronjob` tinyint(1) NOT NULL DEFAULT '1',
  `automatic_backup` tinyint(1) NOT NULL DEFAULT '0',
  `daily_report_emails` text COLLATE utf8_unicode_ci,
  `last_autobackup` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  `cronjob_link` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `last_cronjob_run` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `login_background` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `company_logo` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `company_sidebar_logo` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `sidebar_background_images` text COLLATE utf8_unicode_ci,
  `is_announcement_dashboard` tinyint(1) NOT NULL DEFAULT '1',
  `is_activities_dashboard` tinyint(1) NOT NULL DEFAULT '1',
  `is_todos_dashboard` tinyint(1) NOT NULL DEFAULT '1',
  `is_meetings_dashboard` tinyint(1) NOT NULL DEFAULT '1',
  `is_projects_dashboard` tinyint(1) NOT NULL DEFAULT '1',
  `is_tasks_dashboard` tinyint(1) NOT NULL DEFAULT '1',
  `is_defects_dashboard` tinyint(1) NOT NULL DEFAULT '1',
  `is_incidents_dashboard` tinyint(1) NOT NULL DEFAULT '1',
  `default_language` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `default_locale` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `timezone` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `tables_pagination_limit` int(11) NOT NULL DEFAULT '10',
  `date_format` varchar(50) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'YYYY-MM-DD',
  `time_format` varchar(50) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'HH:mm',
  `date_time_format` varchar(50) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'YYYY-MM-DD hh:mm A',
  `purchase_key` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `unique_coder` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `update_url` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `is_collapsed_menu` tinyint(1) NOT NULL DEFAULT '0',
  `is_sidebar_background` tinyint(1) NOT NULL DEFAULT '1',
  `theme_layout` varchar(50) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'light',
  `sidebar_bg_color` varchar(100) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'pomegranate-gr',
  `sidebar_transparent_bg_image` varchar(100) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'bg_glass_1',
  `sidebar_bg_custom_color` varchar(50) COLLATE utf8_unicode_ci NOT NULL DEFAULT '#000000',
  `sidebar_font_color` varchar(50) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'black',
  `sidebar_width` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `sidebar_bg_image` int(11) NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `product_version` varchar(10) COLLATE utf8_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `vipscapl_user_settings`
--

INSERT INTO `vipscapl_user_settings` (`id`, `company_name`, `company_legal_name`, `company_short_name`, `contact_person`, `company_address`, `company_country`, `company_city`, `company_zipcode`, `company_phone`, `company_email`, `company_website`, `company_from_email`, `post_mark`, `smtp_protocol`, `smtp_host`, `smtp_user`, `smtp_password`, `smtp_port`, `smtp_encryption`, `sparkpost_secret`, `mailgun_domain`, `mailgun_secret`, `mandrill_secret`, `is_announcement_notification`, `active_cronjob`, `automatic_backup`, `daily_report_emails`, `last_autobackup`, `cronjob_link`, `last_cronjob_run`, `login_background`, `company_logo`, `company_sidebar_logo`, `sidebar_background_images`, `is_announcement_dashboard`, `is_activities_dashboard`, `is_todos_dashboard`, `is_meetings_dashboard`, `is_projects_dashboard`, `is_tasks_dashboard`, `is_defects_dashboard`, `is_incidents_dashboard`, `default_language`, `default_locale`, `timezone`, `tables_pagination_limit`, `date_format`, `time_format`, `date_time_format`, `purchase_key`, `unique_coder`, `update_url`, `is_collapsed_menu`, `is_sidebar_background`, `theme_layout`, `sidebar_bg_color`, `sidebar_transparent_bg_image`, `sidebar_bg_custom_color`, `sidebar_font_color`, `sidebar_width`, `sidebar_bg_image`, `created_at`, `updated_at`, `product_version`) VALUES
(1, 'ChetsApp Pvt. Ltd.', 'ChetsApp Pvt. Ltd.', 'VipsPM', 'Vipul Patel', 'Panchnath Main Road, Near GPO,Harihar Chowk, Panchnath Plot,', 8, NULL, '360001', '8985-989-9658', 'info@chetsapp.com', 'https://chetsapp.com/', 'info@chetsapp.com', 0, 'smtp', 'smtp.gmail.com', 'demo@gmail.com', 'Demo123!', '587', 'tls', NULL, NULL, NULL, NULL, 0, 0, 0, 'admin@demo.com,user@demo.com', '0', NULL, '1589796607', NULL, NULL, NULL, NULL, 1, 1, 1, 1, 1, 1, 1, 1, NULL, NULL, 'Asia/Kolkata', 10, 'DD-MM-YYYY', 'HH:mm', 'DD-MM-YYYY HH:mm', NULL, NULL, NULL, 0, 1, 'light', 'purple-bliss-gr', 'bg_glass_1', '#161414', 'white', 'small', 1, '2020-01-30 09:41:53', '2020-05-18 10:29:29', '1.2');

-- --------------------------------------------------------

--
-- Table structure for table `vipscapl_user_todos`
--

CREATE TABLE `vipscapl_user_todos` (
  `id` int(10) UNSIGNED NOT NULL,
  `user_id` int(10) UNSIGNED NOT NULL,
  `title` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `status` tinyint(4) NOT NULL DEFAULT '1' COMMENT '1=not_started, 2=in_progress, 3=on_hold, 4=completed',
  `due_date` date NOT NULL,
  `order` int(11) DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `vipscapl_user_todos`
--

INSERT INTO `vipscapl_user_todos` (`id`, `user_id`, `title`, `status`, `due_date`, `order`, `deleted_at`, `created_at`, `updated_at`) VALUES
(1, 1, 'Create a solution maintenance plan.', 2, '2020-02-03', NULL, NULL, '2020-02-01 11:43:34', '2020-02-01 11:43:34'),
(2, 1, 'Create new stuff.', 3, '2020-02-05', NULL, NULL, '2020-02-01 11:44:01', '2020-02-01 11:44:01'),
(3, 1, 'Create tasks lists.', 4, '2020-02-09', NULL, NULL, '2020-02-01 11:44:27', '2020-02-01 11:44:27'),
(4, 1, 'Install the history server.', 1, '2020-02-16', NULL, NULL, '2020-02-01 11:45:03', '2020-02-01 11:45:03'),
(5, 1, 'Install the product in the production environment', 4, '2020-02-11', NULL, NULL, '2020-02-01 11:45:45', '2020-02-01 11:45:45'),
(6, 1, 'Prepare the production environment', 3, '2020-02-14', NULL, NULL, '2020-02-01 11:46:18', '2020-02-01 11:46:18'),
(7, 1, 'Schedule jobs.', 2, '2020-02-19', NULL, NULL, '2020-02-01 11:46:43', '2020-02-01 11:46:43'),
(8, 1, 'Send documents to vips patel', 3, '2020-02-29', NULL, NULL, '2020-02-01 11:47:04', '2020-02-01 11:47:04'),
(9, 11, 'Check transaction log.', 1, '2020-02-15', NULL, NULL, '2020-02-14 11:16:48', '2020-02-14 11:20:53'),
(10, 11, 'Validate outstanding report.', 2, '2020-02-16', NULL, NULL, '2020-02-14 11:17:37', '2020-02-14 11:20:21'),
(11, 11, 'Meeting with developer team.', 4, '2020-02-14', NULL, NULL, '2020-02-14 11:19:50', '2020-02-14 11:19:50');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `jobs`
--
ALTER TABLE `jobs`
  ADD PRIMARY KEY (`id`),
  ADD KEY `jobs_queue_index` (`queue`);

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `vipscapl_announcements`
--
ALTER TABLE `vipscapl_announcements`
  ADD PRIMARY KEY (`id`),
  ADD KEY `vipscapl_announcements_user_id_foreign` (`user_id`);

--
-- Indexes for table `vipscapl_appointment`
--
ALTER TABLE `vipscapl_appointment`
  ADD PRIMARY KEY (`id`),
  ADD KEY `vipscapl_appointment_user_id_index` (`user_id`),
  ADD KEY `vipscapl_appointment_provider_id_index` (`provider_id`);

--
-- Indexes for table `vipscapl_clients`
--
ALTER TABLE `vipscapl_clients`
  ADD PRIMARY KEY (`id`),
  ADD KEY `vipscapl_clients_user_id_foreign` (`user_id`);

--
-- Indexes for table `vipscapl_countries`
--
ALTER TABLE `vipscapl_countries`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `vipscapl_currency`
--
ALTER TABLE `vipscapl_currency`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `vipscapl_custom_fields`
--
ALTER TABLE `vipscapl_custom_fields`
  ADD PRIMARY KEY (`id`),
  ADD KEY `vipscapl_custom_fields_form_id_foreign` (`form_id`);

--
-- Indexes for table `vipscapl_database_backups`
--
ALTER TABLE `vipscapl_database_backups`
  ADD PRIMARY KEY (`id`),
  ADD KEY `vipscapl_database_backups_user_id_foreign` (`user_id`);

--
-- Indexes for table `vipscapl_defects`
--
ALTER TABLE `vipscapl_defects`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `vipscapl_defects_history`
--
ALTER TABLE `vipscapl_defects_history`
  ADD PRIMARY KEY (`id`),
  ADD KEY `vipscapl_defects_history_defect_id_foreign` (`defect_id`);

--
-- Indexes for table `vipscapl_defect_attachments`
--
ALTER TABLE `vipscapl_defect_attachments`
  ADD PRIMARY KEY (`id`),
  ADD KEY `vipscapl_defect_attachments_defect_id_index` (`defect_id`);

--
-- Indexes for table `vipscapl_defect_comments`
--
ALTER TABLE `vipscapl_defect_comments`
  ADD PRIMARY KEY (`id`),
  ADD KEY `vipscapl_defect_comments_user_id_foreign` (`user_id`),
  ADD KEY `vipscapl_defect_comments_defect_id_index` (`defect_id`);

--
-- Indexes for table `vipscapl_defect_user`
--
ALTER TABLE `vipscapl_defect_user`
  ADD PRIMARY KEY (`defect_id`,`user_id`),
  ADD KEY `vipscapl_defect_user_defect_id_index` (`defect_id`),
  ADD KEY `vipscapl_defect_user_user_id_index` (`user_id`);

--
-- Indexes for table `vipscapl_departments`
--
ALTER TABLE `vipscapl_departments`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `vipscapl_departments_name_deleted_at_unique` (`name`,`deleted_at`);

--
-- Indexes for table `vipscapl_departments_roles`
--
ALTER TABLE `vipscapl_departments_roles`
  ADD PRIMARY KEY (`id`),
  ADD KEY `vipscapl_departments_roles_role_id_index` (`role_id`),
  ADD KEY `vipscapl_departments_roles_department_id_index` (`department_id`);

--
-- Indexes for table `vipscapl_department_role_menu`
--
ALTER TABLE `vipscapl_department_role_menu`
  ADD PRIMARY KEY (`id`),
  ADD KEY `vipscapl_department_role_menu_department_id_index` (`department_id`),
  ADD KEY `vipscapl_department_role_menu_role_id_index` (`role_id`),
  ADD KEY `vipscapl_department_role_menu_menu_id_index` (`menu_id`);

--
-- Indexes for table `vipscapl_email_inbox`
--
ALTER TABLE `vipscapl_email_inbox`
  ADD PRIMARY KEY (`id`),
  ADD KEY `vipscapl_email_inbox_user_id_foreign` (`user_id`);

--
-- Indexes for table `vipscapl_email_inbox_attachment`
--
ALTER TABLE `vipscapl_email_inbox_attachment`
  ADD PRIMARY KEY (`id`),
  ADD KEY `vipscapl_email_inbox_attachment_mailbox_id_foreign` (`mailbox_id`);

--
-- Indexes for table `vipscapl_email_template`
--
ALTER TABLE `vipscapl_email_template`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `vipscapl_email_template_template_name_deleted_at_unique` (`template_name`,`deleted_at`),
  ADD KEY `vipscapl_email_template_email_group_id_foreign` (`email_group_id`);

--
-- Indexes for table `vipscapl_email_template_groups`
--
ALTER TABLE `vipscapl_email_template_groups`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `vipscapl_files`
--
ALTER TABLE `vipscapl_files`
  ADD PRIMARY KEY (`id`),
  ADD KEY `vipscapl_files_user_id_foreign` (`user_id`);

--
-- Indexes for table `vipscapl_folders`
--
ALTER TABLE `vipscapl_folders`
  ADD PRIMARY KEY (`id`),
  ADD KEY `vipscapl_folders_user_id_foreign` (`user_id`);

--
-- Indexes for table `vipscapl_form`
--
ALTER TABLE `vipscapl_form`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `vipscapl_holidays`
--
ALTER TABLE `vipscapl_holidays`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `vipscapl_incidents`
--
ALTER TABLE `vipscapl_incidents`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `vipscapl_incident_attachments`
--
ALTER TABLE `vipscapl_incident_attachments`
  ADD PRIMARY KEY (`id`),
  ADD KEY `vipscapl_incident_attachments_incident_id_index` (`incident_id`);

--
-- Indexes for table `vipscapl_incident_comments`
--
ALTER TABLE `vipscapl_incident_comments`
  ADD PRIMARY KEY (`id`),
  ADD KEY `vipscapl_incident_comments_user_id_foreign` (`user_id`),
  ADD KEY `vipscapl_incident_comments_incident_id_index` (`incident_id`);

--
-- Indexes for table `vipscapl_incident_history`
--
ALTER TABLE `vipscapl_incident_history`
  ADD PRIMARY KEY (`id`),
  ADD KEY `vipscapl_incident_history_incident_id_foreign` (`incident_id`);

--
-- Indexes for table `vipscapl_incident_user`
--
ALTER TABLE `vipscapl_incident_user`
  ADD PRIMARY KEY (`incident_id`,`user_id`),
  ADD KEY `vipscapl_incident_user_incident_id_index` (`incident_id`),
  ADD KEY `vipscapl_incident_user_user_id_index` (`user_id`);

--
-- Indexes for table `vipscapl_knowledge_base_article`
--
ALTER TABLE `vipscapl_knowledge_base_article`
  ADD PRIMARY KEY (`id`),
  ADD KEY `vipscapl_knowledge_base_article_user_id_foreign` (`user_id`),
  ADD KEY `vipscapl_knowledge_base_article_category_id_index` (`category_id`);

--
-- Indexes for table `vipscapl_knowledge_base_category`
--
ALTER TABLE `vipscapl_knowledge_base_category`
  ADD PRIMARY KEY (`id`),
  ADD KEY `vipscapl_knowledge_base_category_user_id_foreign` (`user_id`);

--
-- Indexes for table `vipscapl_languages`
--
ALTER TABLE `vipscapl_languages`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `vipscapl_locales`
--
ALTER TABLE `vipscapl_locales`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `vipscapl_meetings`
--
ALTER TABLE `vipscapl_meetings`
  ADD PRIMARY KEY (`id`),
  ADD KEY `vipscapl_meetings_organizer_id_foreign` (`organizer_id`);

--
-- Indexes for table `vipscapl_meeting_members`
--
ALTER TABLE `vipscapl_meeting_members`
  ADD PRIMARY KEY (`id`),
  ADD KEY `vipscapl_meeting_members_user_id_foreign` (`user_id`),
  ADD KEY `vipscapl_meeting_members_meeting_id_foreign` (`meeting_id`);

--
-- Indexes for table `vipscapl_menus`
--
ALTER TABLE `vipscapl_menus`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `vipscapl_modules`
--
ALTER TABLE `vipscapl_modules`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `vipscapl_password_resets`
--
ALTER TABLE `vipscapl_password_resets`
  ADD KEY `vipscapl_password_resets_email_index` (`email`);

--
-- Indexes for table `vipscapl_projects`
--
ALTER TABLE `vipscapl_projects`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `vipscapl_projects_project_name_deleted_at_unique` (`project_name`,`deleted_at`);

--
-- Indexes for table `vipscapl_project_attachments`
--
ALTER TABLE `vipscapl_project_attachments`
  ADD PRIMARY KEY (`id`),
  ADD KEY `vipscapl_project_attachments_project_id_foreign` (`project_id`);

--
-- Indexes for table `vipscapl_project_comments`
--
ALTER TABLE `vipscapl_project_comments`
  ADD PRIMARY KEY (`id`),
  ADD KEY `vipscapl_project_comments_user_id_foreign` (`user_id`),
  ADD KEY `vipscapl_project_comments_project_id_foreign` (`project_id`);

--
-- Indexes for table `vipscapl_project_sprints`
--
ALTER TABLE `vipscapl_project_sprints`
  ADD PRIMARY KEY (`id`),
  ADD KEY `vipscapl_project_sprints_project_id_foreign` (`project_id`);

--
-- Indexes for table `vipscapl_project_sprint_members`
--
ALTER TABLE `vipscapl_project_sprint_members`
  ADD PRIMARY KEY (`id`),
  ADD KEY `vipscapl_project_sprint_members_project_sprint_id_foreign` (`project_sprint_id`),
  ADD KEY `vipscapl_project_sprint_members_user_id_foreign` (`user_id`);

--
-- Indexes for table `vipscapl_project_sprint_tasks`
--
ALTER TABLE `vipscapl_project_sprint_tasks`
  ADD PRIMARY KEY (`id`),
  ADD KEY `vipscapl_project_sprint_tasks_project_sprint_id_foreign` (`project_sprint_id`);

--
-- Indexes for table `vipscapl_project_sprint_task_members`
--
ALTER TABLE `vipscapl_project_sprint_task_members`
  ADD PRIMARY KEY (`id`),
  ADD KEY `vipscapl_project_sprint_task_members_task_id_foreign` (`task_id`),
  ADD KEY `vipscapl_project_sprint_task_members_user_id_foreign` (`user_id`);

--
-- Indexes for table `vipscapl_project_user`
--
ALTER TABLE `vipscapl_project_user`
  ADD PRIMARY KEY (`project_id`,`user_id`),
  ADD KEY `vipscapl_project_user_user_id_index` (`user_id`),
  ADD KEY `vipscapl_project_user_project_id_index` (`project_id`);

--
-- Indexes for table `vipscapl_providers`
--
ALTER TABLE `vipscapl_providers`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `vipscapl_roles`
--
ALTER TABLE `vipscapl_roles`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `vipscapl_roles_slug_unique` (`slug`);

--
-- Indexes for table `vipscapl_tasks`
--
ALTER TABLE `vipscapl_tasks`
  ADD PRIMARY KEY (`id`),
  ADD KEY `vipscapl_tasks_project_id_index` (`project_id`);

--
-- Indexes for table `vipscapl_task_attachments`
--
ALTER TABLE `vipscapl_task_attachments`
  ADD PRIMARY KEY (`id`),
  ADD KEY `vipscapl_task_attachments_task_id_index` (`task_id`);

--
-- Indexes for table `vipscapl_task_comments`
--
ALTER TABLE `vipscapl_task_comments`
  ADD PRIMARY KEY (`id`),
  ADD KEY `vipscapl_task_comments_user_id_foreign` (`user_id`),
  ADD KEY `vipscapl_task_comments_task_id_index` (`task_id`);

--
-- Indexes for table `vipscapl_task_user`
--
ALTER TABLE `vipscapl_task_user`
  ADD PRIMARY KEY (`task_id`,`user_id`),
  ADD KEY `vipscapl_task_user_task_id_index` (`task_id`),
  ADD KEY `vipscapl_task_user_user_id_index` (`user_id`);

--
-- Indexes for table `vipscapl_teams`
--
ALTER TABLE `vipscapl_teams`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `vipscapl_teams_members`
--
ALTER TABLE `vipscapl_teams_members`
  ADD PRIMARY KEY (`id`),
  ADD KEY `vipscapl_teams_members_team_id_foreign` (`team_id`),
  ADD KEY `vipscapl_teams_members_user_id_foreign` (`user_id`);

--
-- Indexes for table `vipscapl_timesheets`
--
ALTER TABLE `vipscapl_timesheets`
  ADD PRIMARY KEY (`id`),
  ADD KEY `vipscapl_timesheets_created_user_id_index` (`created_user_id`);

--
-- Indexes for table `vipscapl_todos`
--
ALTER TABLE `vipscapl_todos`
  ADD PRIMARY KEY (`id`),
  ADD KEY `vipscapl_todos_user_id_foreign` (`user_id`);

--
-- Indexes for table `vipscapl_todo_user_pivot`
--
ALTER TABLE `vipscapl_todo_user_pivot`
  ADD PRIMARY KEY (`todo_id`,`user_id`),
  ADD KEY `vipscapl_todo_user_pivot_todo_id_index` (`todo_id`),
  ADD KEY `vipscapl_todo_user_pivot_user_id_index` (`user_id`);

--
-- Indexes for table `vipscapl_translations`
--
ALTER TABLE `vipscapl_translations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `vipscapl_users`
--
ALTER TABLE `vipscapl_users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `vipscapl_users_username_deleted_at_unique` (`username`,`deleted_at`),
  ADD UNIQUE KEY `vipscapl_users_email_deleted_at_unique` (`email`,`deleted_at`);

--
-- Indexes for table `vipscapl_user_activities`
--
ALTER TABLE `vipscapl_user_activities`
  ADD PRIMARY KEY (`id`),
  ADD KEY `vipscapl_user_activities_user_id_foreign` (`user_id`);

--
-- Indexes for table `vipscapl_user_role_department`
--
ALTER TABLE `vipscapl_user_role_department`
  ADD PRIMARY KEY (`id`),
  ADD KEY `vipscapl_user_role_department_department_id_index` (`department_id`),
  ADD KEY `vipscapl_user_role_department_role_id_index` (`role_id`),
  ADD KEY `vipscapl_user_role_department_user_id_index` (`user_id`);

--
-- Indexes for table `vipscapl_user_settings`
--
ALTER TABLE `vipscapl_user_settings`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `vipscapl_user_todos`
--
ALTER TABLE `vipscapl_user_todos`
  ADD PRIMARY KEY (`id`),
  ADD KEY `vipscapl_user_todos_user_id_foreign` (`user_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `jobs`
--
ALTER TABLE `jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=64;

--
-- AUTO_INCREMENT for table `vipscapl_announcements`
--
ALTER TABLE `vipscapl_announcements`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `vipscapl_appointment`
--
ALTER TABLE `vipscapl_appointment`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `vipscapl_clients`
--
ALTER TABLE `vipscapl_clients`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `vipscapl_countries`
--
ALTER TABLE `vipscapl_countries`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=241;

--
-- AUTO_INCREMENT for table `vipscapl_currency`
--
ALTER TABLE `vipscapl_currency`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=35;

--
-- AUTO_INCREMENT for table `vipscapl_custom_fields`
--
ALTER TABLE `vipscapl_custom_fields`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `vipscapl_database_backups`
--
ALTER TABLE `vipscapl_database_backups`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `vipscapl_defects`
--
ALTER TABLE `vipscapl_defects`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=27;

--
-- AUTO_INCREMENT for table `vipscapl_defects_history`
--
ALTER TABLE `vipscapl_defects_history`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=29;

--
-- AUTO_INCREMENT for table `vipscapl_defect_attachments`
--
ALTER TABLE `vipscapl_defect_attachments`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `vipscapl_defect_comments`
--
ALTER TABLE `vipscapl_defect_comments`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `vipscapl_departments`
--
ALTER TABLE `vipscapl_departments`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `vipscapl_departments_roles`
--
ALTER TABLE `vipscapl_departments_roles`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

--
-- AUTO_INCREMENT for table `vipscapl_department_role_menu`
--
ALTER TABLE `vipscapl_department_role_menu`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1238;

--
-- AUTO_INCREMENT for table `vipscapl_email_inbox`
--
ALTER TABLE `vipscapl_email_inbox`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `vipscapl_email_inbox_attachment`
--
ALTER TABLE `vipscapl_email_inbox_attachment`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `vipscapl_email_template`
--
ALTER TABLE `vipscapl_email_template`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=27;

--
-- AUTO_INCREMENT for table `vipscapl_email_template_groups`
--
ALTER TABLE `vipscapl_email_template_groups`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `vipscapl_files`
--
ALTER TABLE `vipscapl_files`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `vipscapl_folders`
--
ALTER TABLE `vipscapl_folders`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `vipscapl_form`
--
ALTER TABLE `vipscapl_form`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `vipscapl_holidays`
--
ALTER TABLE `vipscapl_holidays`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

--
-- AUTO_INCREMENT for table `vipscapl_incidents`
--
ALTER TABLE `vipscapl_incidents`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;

--
-- AUTO_INCREMENT for table `vipscapl_incident_attachments`
--
ALTER TABLE `vipscapl_incident_attachments`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `vipscapl_incident_comments`
--
ALTER TABLE `vipscapl_incident_comments`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `vipscapl_incident_history`
--
ALTER TABLE `vipscapl_incident_history`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;

--
-- AUTO_INCREMENT for table `vipscapl_knowledge_base_article`
--
ALTER TABLE `vipscapl_knowledge_base_article`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT for table `vipscapl_knowledge_base_category`
--
ALTER TABLE `vipscapl_knowledge_base_category`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `vipscapl_languages`
--
ALTER TABLE `vipscapl_languages`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;

--
-- AUTO_INCREMENT for table `vipscapl_locales`
--
ALTER TABLE `vipscapl_locales`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=241;

--
-- AUTO_INCREMENT for table `vipscapl_meetings`
--
ALTER TABLE `vipscapl_meetings`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `vipscapl_meeting_members`
--
ALTER TABLE `vipscapl_meeting_members`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=30;

--
-- AUTO_INCREMENT for table `vipscapl_menus`
--
ALTER TABLE `vipscapl_menus`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=72;

--
-- AUTO_INCREMENT for table `vipscapl_modules`
--
ALTER TABLE `vipscapl_modules`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `vipscapl_projects`
--
ALTER TABLE `vipscapl_projects`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `vipscapl_project_attachments`
--
ALTER TABLE `vipscapl_project_attachments`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `vipscapl_project_comments`
--
ALTER TABLE `vipscapl_project_comments`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `vipscapl_project_sprints`
--
ALTER TABLE `vipscapl_project_sprints`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `vipscapl_project_sprint_members`
--
ALTER TABLE `vipscapl_project_sprint_members`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `vipscapl_project_sprint_tasks`
--
ALTER TABLE `vipscapl_project_sprint_tasks`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `vipscapl_project_sprint_task_members`
--
ALTER TABLE `vipscapl_project_sprint_task_members`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `vipscapl_providers`
--
ALTER TABLE `vipscapl_providers`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `vipscapl_roles`
--
ALTER TABLE `vipscapl_roles`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `vipscapl_tasks`
--
ALTER TABLE `vipscapl_tasks`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=43;

--
-- AUTO_INCREMENT for table `vipscapl_task_attachments`
--
ALTER TABLE `vipscapl_task_attachments`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `vipscapl_task_comments`
--
ALTER TABLE `vipscapl_task_comments`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `vipscapl_teams`
--
ALTER TABLE `vipscapl_teams`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `vipscapl_teams_members`
--
ALTER TABLE `vipscapl_teams_members`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=30;

--
-- AUTO_INCREMENT for table `vipscapl_timesheets`
--
ALTER TABLE `vipscapl_timesheets`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `vipscapl_todos`
--
ALTER TABLE `vipscapl_todos`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT for table `vipscapl_translations`
--
ALTER TABLE `vipscapl_translations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `vipscapl_users`
--
ALTER TABLE `vipscapl_users`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT for table `vipscapl_user_activities`
--
ALTER TABLE `vipscapl_user_activities`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=430;

--
-- AUTO_INCREMENT for table `vipscapl_user_role_department`
--
ALTER TABLE `vipscapl_user_role_department`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=34;

--
-- AUTO_INCREMENT for table `vipscapl_user_settings`
--
ALTER TABLE `vipscapl_user_settings`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `vipscapl_user_todos`
--
ALTER TABLE `vipscapl_user_todos`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `vipscapl_announcements`
--
ALTER TABLE `vipscapl_announcements`
  ADD CONSTRAINT `vipscapl_announcements_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `vipscapl_users` (`id`);

--
-- Constraints for table `vipscapl_appointment`
--
ALTER TABLE `vipscapl_appointment`
  ADD CONSTRAINT `vipscapl_appointment_provider_id_foreign` FOREIGN KEY (`provider_id`) REFERENCES `vipscapl_providers` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `vipscapl_appointment_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `vipscapl_users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `vipscapl_clients`
--
ALTER TABLE `vipscapl_clients`
  ADD CONSTRAINT `vipscapl_clients_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `vipscapl_users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `vipscapl_custom_fields`
--
ALTER TABLE `vipscapl_custom_fields`
  ADD CONSTRAINT `vipscapl_custom_fields_form_id_foreign` FOREIGN KEY (`form_id`) REFERENCES `vipscapl_form` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `vipscapl_database_backups`
--
ALTER TABLE `vipscapl_database_backups`
  ADD CONSTRAINT `vipscapl_database_backups_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `vipscapl_users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `vipscapl_defects_history`
--
ALTER TABLE `vipscapl_defects_history`
  ADD CONSTRAINT `vipscapl_defects_history_defect_id_foreign` FOREIGN KEY (`defect_id`) REFERENCES `vipscapl_defects` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `vipscapl_defect_attachments`
--
ALTER TABLE `vipscapl_defect_attachments`
  ADD CONSTRAINT `vipscapl_defect_attachments_defect_id_foreign` FOREIGN KEY (`defect_id`) REFERENCES `vipscapl_defects` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `vipscapl_defect_comments`
--
ALTER TABLE `vipscapl_defect_comments`
  ADD CONSTRAINT `vipscapl_defect_comments_defect_id_foreign` FOREIGN KEY (`defect_id`) REFERENCES `vipscapl_defects` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `vipscapl_defect_comments_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `vipscapl_users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `vipscapl_defect_user`
--
ALTER TABLE `vipscapl_defect_user`
  ADD CONSTRAINT `vipscapl_defect_user_defect_id_foreign` FOREIGN KEY (`defect_id`) REFERENCES `vipscapl_defects` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `vipscapl_defect_user_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `vipscapl_users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `vipscapl_departments_roles`
--
ALTER TABLE `vipscapl_departments_roles`
  ADD CONSTRAINT `vipscapl_departments_roles_department_id_foreign` FOREIGN KEY (`department_id`) REFERENCES `vipscapl_departments` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `vipscapl_departments_roles_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `vipscapl_roles` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `vipscapl_department_role_menu`
--
ALTER TABLE `vipscapl_department_role_menu`
  ADD CONSTRAINT `vipscapl_department_role_menu_department_id_foreign` FOREIGN KEY (`department_id`) REFERENCES `vipscapl_departments` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `vipscapl_department_role_menu_menu_id_foreign` FOREIGN KEY (`menu_id`) REFERENCES `vipscapl_menus` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `vipscapl_department_role_menu_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `vipscapl_roles` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `vipscapl_email_inbox`
--
ALTER TABLE `vipscapl_email_inbox`
  ADD CONSTRAINT `vipscapl_email_inbox_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `vipscapl_users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `vipscapl_email_inbox_attachment`
--
ALTER TABLE `vipscapl_email_inbox_attachment`
  ADD CONSTRAINT `vipscapl_email_inbox_attachment_mailbox_id_foreign` FOREIGN KEY (`mailbox_id`) REFERENCES `vipscapl_email_inbox` (`id`) ON DELETE SET NULL;

--
-- Constraints for table `vipscapl_email_template`
--
ALTER TABLE `vipscapl_email_template`
  ADD CONSTRAINT `vipscapl_email_template_email_group_id_foreign` FOREIGN KEY (`email_group_id`) REFERENCES `vipscapl_email_template_groups` (`id`) ON DELETE SET NULL;

--
-- Constraints for table `vipscapl_files`
--
ALTER TABLE `vipscapl_files`
  ADD CONSTRAINT `vipscapl_files_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `vipscapl_users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `vipscapl_folders`
--
ALTER TABLE `vipscapl_folders`
  ADD CONSTRAINT `vipscapl_folders_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `vipscapl_users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `vipscapl_incident_attachments`
--
ALTER TABLE `vipscapl_incident_attachments`
  ADD CONSTRAINT `vipscapl_incident_attachments_incident_id_foreign` FOREIGN KEY (`incident_id`) REFERENCES `vipscapl_incidents` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `vipscapl_incident_comments`
--
ALTER TABLE `vipscapl_incident_comments`
  ADD CONSTRAINT `vipscapl_incident_comments_incident_id_foreign` FOREIGN KEY (`incident_id`) REFERENCES `vipscapl_incidents` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `vipscapl_incident_comments_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `vipscapl_users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `vipscapl_incident_history`
--
ALTER TABLE `vipscapl_incident_history`
  ADD CONSTRAINT `vipscapl_incident_history_incident_id_foreign` FOREIGN KEY (`incident_id`) REFERENCES `vipscapl_incidents` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `vipscapl_incident_user`
--
ALTER TABLE `vipscapl_incident_user`
  ADD CONSTRAINT `vipscapl_incident_user_incident_id_foreign` FOREIGN KEY (`incident_id`) REFERENCES `vipscapl_incidents` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `vipscapl_incident_user_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `vipscapl_users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `vipscapl_knowledge_base_article`
--
ALTER TABLE `vipscapl_knowledge_base_article`
  ADD CONSTRAINT `vipscapl_knowledge_base_article_category_id_foreign` FOREIGN KEY (`category_id`) REFERENCES `vipscapl_knowledge_base_category` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `vipscapl_knowledge_base_article_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `vipscapl_users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `vipscapl_knowledge_base_category`
--
ALTER TABLE `vipscapl_knowledge_base_category`
  ADD CONSTRAINT `vipscapl_knowledge_base_category_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `vipscapl_users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `vipscapl_meetings`
--
ALTER TABLE `vipscapl_meetings`
  ADD CONSTRAINT `vipscapl_meetings_organizer_id_foreign` FOREIGN KEY (`organizer_id`) REFERENCES `vipscapl_users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `vipscapl_meeting_members`
--
ALTER TABLE `vipscapl_meeting_members`
  ADD CONSTRAINT `vipscapl_meeting_members_meeting_id_foreign` FOREIGN KEY (`meeting_id`) REFERENCES `vipscapl_meetings` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `vipscapl_meeting_members_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `vipscapl_users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `vipscapl_project_attachments`
--
ALTER TABLE `vipscapl_project_attachments`
  ADD CONSTRAINT `vipscapl_project_attachments_project_id_foreign` FOREIGN KEY (`project_id`) REFERENCES `vipscapl_projects` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `vipscapl_project_comments`
--
ALTER TABLE `vipscapl_project_comments`
  ADD CONSTRAINT `vipscapl_project_comments_project_id_foreign` FOREIGN KEY (`project_id`) REFERENCES `vipscapl_projects` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `vipscapl_project_comments_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `vipscapl_users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `vipscapl_project_sprints`
--
ALTER TABLE `vipscapl_project_sprints`
  ADD CONSTRAINT `vipscapl_project_sprints_project_id_foreign` FOREIGN KEY (`project_id`) REFERENCES `vipscapl_projects` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `vipscapl_project_sprint_members`
--
ALTER TABLE `vipscapl_project_sprint_members`
  ADD CONSTRAINT `vipscapl_project_sprint_members_project_sprint_id_foreign` FOREIGN KEY (`project_sprint_id`) REFERENCES `vipscapl_project_sprints` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `vipscapl_project_sprint_members_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `vipscapl_users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `vipscapl_project_sprint_tasks`
--
ALTER TABLE `vipscapl_project_sprint_tasks`
  ADD CONSTRAINT `vipscapl_project_sprint_tasks_project_sprint_id_foreign` FOREIGN KEY (`project_sprint_id`) REFERENCES `vipscapl_project_sprints` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `vipscapl_project_sprint_task_members`
--
ALTER TABLE `vipscapl_project_sprint_task_members`
  ADD CONSTRAINT `vipscapl_project_sprint_task_members_task_id_foreign` FOREIGN KEY (`task_id`) REFERENCES `vipscapl_project_sprint_tasks` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `vipscapl_project_sprint_task_members_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `vipscapl_users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `vipscapl_project_user`
--
ALTER TABLE `vipscapl_project_user`
  ADD CONSTRAINT `vipscapl_project_user_project_id_foreign` FOREIGN KEY (`project_id`) REFERENCES `vipscapl_projects` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `vipscapl_project_user_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `vipscapl_users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `vipscapl_tasks`
--
ALTER TABLE `vipscapl_tasks`
  ADD CONSTRAINT `vipscapl_tasks_project_id_foreign` FOREIGN KEY (`project_id`) REFERENCES `vipscapl_projects` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `vipscapl_task_attachments`
--
ALTER TABLE `vipscapl_task_attachments`
  ADD CONSTRAINT `vipscapl_task_attachments_task_id_foreign` FOREIGN KEY (`task_id`) REFERENCES `vipscapl_tasks` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `vipscapl_task_comments`
--
ALTER TABLE `vipscapl_task_comments`
  ADD CONSTRAINT `vipscapl_task_comments_task_id_foreign` FOREIGN KEY (`task_id`) REFERENCES `vipscapl_tasks` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `vipscapl_task_comments_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `vipscapl_users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `vipscapl_task_user`
--
ALTER TABLE `vipscapl_task_user`
  ADD CONSTRAINT `vipscapl_task_user_task_id_foreign` FOREIGN KEY (`task_id`) REFERENCES `vipscapl_tasks` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `vipscapl_task_user_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `vipscapl_users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `vipscapl_teams_members`
--
ALTER TABLE `vipscapl_teams_members`
  ADD CONSTRAINT `vipscapl_teams_members_team_id_foreign` FOREIGN KEY (`team_id`) REFERENCES `vipscapl_teams` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `vipscapl_teams_members_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `vipscapl_users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `vipscapl_timesheets`
--
ALTER TABLE `vipscapl_timesheets`
  ADD CONSTRAINT `vipscapl_timesheets_created_user_id_foreign` FOREIGN KEY (`created_user_id`) REFERENCES `vipscapl_users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `vipscapl_todos`
--
ALTER TABLE `vipscapl_todos`
  ADD CONSTRAINT `vipscapl_todos_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `vipscapl_users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `vipscapl_todo_user_pivot`
--
ALTER TABLE `vipscapl_todo_user_pivot`
  ADD CONSTRAINT `vipscapl_todo_user_pivot_todo_id_foreign` FOREIGN KEY (`todo_id`) REFERENCES `vipscapl_user_todos` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `vipscapl_todo_user_pivot_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `vipscapl_users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `vipscapl_user_activities`
--
ALTER TABLE `vipscapl_user_activities`
  ADD CONSTRAINT `vipscapl_user_activities_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `vipscapl_users` (`id`);

--
-- Constraints for table `vipscapl_user_role_department`
--
ALTER TABLE `vipscapl_user_role_department`
  ADD CONSTRAINT `vipscapl_user_role_department_department_id_foreign` FOREIGN KEY (`department_id`) REFERENCES `vipscapl_departments` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `vipscapl_user_role_department_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `vipscapl_roles` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `vipscapl_user_role_department_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `vipscapl_users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `vipscapl_user_todos`
--
ALTER TABLE `vipscapl_user_todos`
  ADD CONSTRAINT `vipscapl_user_todos_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `vipscapl_users` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
