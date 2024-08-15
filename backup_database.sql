-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: db-server-1:3306
-- Tempo de geração: 05/08/2024 às 21:20
-- Versão do servidor: 10.10.3-MariaDB-1:10.10.3+maria~ubu2204
-- Versão do PHP: 8.1.15

SET FOREIGN_KEY_CHECKS=0;
SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Banco de dados: `u301289665_ybdownload`
--
CREATE DATABASE IF NOT EXISTS `u301289665_ybdownload` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
USE `u301289665_ybdownload`;

-- --------------------------------------------------------

--
-- Estrutura stand-in para view `cnt_access_modules`
-- (Veja abaixo para a visão atual)
--
DROP VIEW IF EXISTS `cnt_access_modules`;
CREATE TABLE IF NOT EXISTS `cnt_access_modules` (
`id` int(11)
,`created_at` timestamp
,`module_id` int(11)
,`type_id_module` int(11)
,`type_module` varchar(255)
,`allow` varchar(5)
,`module` varchar(255)
,`label` varchar(255)
,`icon` varchar(255)
,`path_module` varchar(255)
,`updated_at` timestamp
,`level_id` int(11)
,`level` int(11)
,`description` varchar(255)
,`home_path` varchar(255)
,`current` varchar(255)
);

-- --------------------------------------------------------

--
-- Estrutura stand-in para view `cnt_access_modules_v2`
-- (Veja abaixo para a visão atual)
--
DROP VIEW IF EXISTS `cnt_access_modules_v2`;
CREATE TABLE IF NOT EXISTS `cnt_access_modules_v2` (
`id` int(11)
,`created_at` timestamp
,`module_id` int(11)
,`module` mediumtext
,`updated_at` timestamp
,`level_id` int(11)
,`level` int(11)
,`description` varchar(255)
,`home_path` varchar(255)
);

-- --------------------------------------------------------

--
-- Estrutura stand-in para view `cnt_apis`
-- (Veja abaixo para a visão atual)
--
DROP VIEW IF EXISTS `cnt_apis`;
CREATE TABLE IF NOT EXISTS `cnt_apis` (
`user_id` int(11)
,`user_name` varchar(255)
,`user_email` varchar(255)
,`id` int(11)
,`api_key` varchar(255)
,`api_name` varchar(255)
,`api_description` varchar(255)
,`api_path` varchar(255)
,`active` int(1)
,`status_id` int(11)
);

-- --------------------------------------------------------

--
-- Estrutura stand-in para view `cnt_email_alarmes`
-- (Veja abaixo para a visão atual)
--
DROP VIEW IF EXISTS `cnt_email_alarmes`;
CREATE TABLE IF NOT EXISTS `cnt_email_alarmes` (
`id` int(11)
,`name` varchar(255)
,`email` varchar(255)
,`email_verified` int(11)
,`created_at` timestamp
,`updated_at` timestamp
,`status_id` int(11)
,`status` int(11)
,`description` varchar(255)
,`status_verified_id` int(11)
,`status_verified` varchar(255)
);

-- --------------------------------------------------------

--
-- Estrutura stand-in para view `cnt_events_status`
-- (Veja abaixo para a visão atual)
--
DROP VIEW IF EXISTS `cnt_events_status`;
CREATE TABLE IF NOT EXISTS `cnt_events_status` (
`id` int(11)
,`status` varchar(255)
,`created_at` timestamp
,`updated_at` timestamp
,`description` varchar(255)
,`color_id` int(11)
,`color` varchar(255)
,`text_color_id` int(11)
,`text_color` varchar(255)
);

-- --------------------------------------------------------

--
-- Estrutura stand-in para view `cnt_logs`
-- (Veja abaixo para a visão atual)
--
DROP VIEW IF EXISTS `cnt_logs`;
CREATE TABLE IF NOT EXISTS `cnt_logs` (
`id` int(11)
,`id_user` int(11)
,`application` varchar(255)
,`created_at` timestamp
,`data` mediumtext
,`token` varchar(255)
,`name` varchar(255)
,`login` varchar(255)
);

-- --------------------------------------------------------

--
-- Estrutura stand-in para view `cnt_modules`
-- (Veja abaixo para a visão atual)
--
DROP VIEW IF EXISTS `cnt_modules`;
CREATE TABLE IF NOT EXISTS `cnt_modules` (
`id` int(11)
,`created_at` timestamp
,`module` varchar(255)
,`label` varchar(255)
,`icon` varchar(255)
,`path_module` varchar(255)
,`updated_at` timestamp
,`type_id` int(11)
,`current` varchar(255)
,`allow_sysadmin` tinyint(1)
,`type` varchar(255)
,`description` varchar(255)
);

-- --------------------------------------------------------

--
-- Estrutura stand-in para view `cnt_settings_smtp`
-- (Veja abaixo para a visão atual)
--
DROP VIEW IF EXISTS `cnt_settings_smtp`;
CREATE TABLE IF NOT EXISTS `cnt_settings_smtp` (
`id` int(11)
,`created_at` timestamp
,`host` varchar(255)
,`port` int(11)
,`username` varchar(255)
,`password` varchar(255)
,`from_name` varchar(255)
,`id_apikey` int(11)
,`status_id` int(11)
,`status_description` varchar(255)
,`updated_at` timestamp
,`api_key` varchar(255)
);

-- --------------------------------------------------------

--
-- Estrutura stand-in para view `cnt_temp_users`
-- (Veja abaixo para a visão atual)
--
DROP VIEW IF EXISTS `cnt_temp_users`;
CREATE TABLE IF NOT EXISTS `cnt_temp_users` (
`id` int(11)
,`name` varchar(255)
,`login` varchar(255)
,`email` varchar(255)
,`user_id` int(11)
,`department_id` int(11)
,`password` varchar(255)
,`created_at` timestamp
,`updated_at` timestamp
,`id_status` int(11)
,`status_user` varchar(255)
);

-- --------------------------------------------------------

--
-- Estrutura stand-in para view `cnt_users`
-- (Veja abaixo para a visão atual)
--
DROP VIEW IF EXISTS `cnt_users`;
CREATE TABLE IF NOT EXISTS `cnt_users` (
`id` int(11)
,`name` varchar(255)
,`login` varchar(255)
,`email` varchar(255)
,`password` varchar(255)
,`id_nivel` int(11)
,`access` int(11)
,`created_at` timestamp
,`updated_at` timestamp
,`level_description` varchar(255)
,`home_path` varchar(255)
,`id_status` int(11)
,`status_user` varchar(255)
);

-- --------------------------------------------------------

--
-- Estrutura para tabela `tb_access_level`
--

DROP TABLE IF EXISTS `tb_access_level`;
CREATE TABLE IF NOT EXISTS `tb_access_level` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `level` int(11) DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `home_path` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Despejando dados para a tabela `tb_access_level`
--

INSERT INTO `tb_access_level` (`id`, `level`, `description`, `created_at`, `updated_at`, `home_path`) VALUES
(-1, -1, 'sysadmin', '2023-06-06 12:57:43', '2023-12-18 18:35:26', '/application'),
(0, 0, 'Selecione...', '2023-01-31 00:00:00', NULL, ''),
(1, 1, 'admin', '2024-06-12 00:12:25', NULL, '/application');

-- --------------------------------------------------------

--
-- Estrutura para tabela `tb_access_modules`
--

DROP TABLE IF EXISTS `tb_access_modules`;
CREATE TABLE IF NOT EXISTS `tb_access_modules` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `created_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `module_id` int(11) NOT NULL,
  `level_id` int(11) NOT NULL,
  `allow` tinyint(1) NOT NULL DEFAULT 1,
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  PRIMARY KEY (`id`),
  KEY `level_id` (`level_id`),
  KEY `module_id` (`module_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3066 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Despejando dados para a tabela `tb_access_modules`
--

INSERT INTO `tb_access_modules` (`id`, `created_at`, `module_id`, `level_id`, `allow`, `updated_at`) VALUES
(3005, '2024-06-18 23:04:39', 1, -1, 1, '2024-06-18 23:04:39'),
(3006, '2024-06-18 23:04:39', 99, -1, 1, '2024-06-18 23:04:39'),
(3007, '2024-06-18 23:04:39', 103, -1, 1, '2024-06-18 23:04:39'),
(3008, '2024-06-18 23:04:39', 124, -1, 1, '2024-06-18 23:04:39'),
(3009, '2024-06-18 23:04:39', 4, -1, 1, '2024-06-18 23:04:39'),
(3010, '2024-06-18 23:04:39', 5, -1, 1, '2024-06-18 23:04:39'),
(3011, '2024-06-18 23:04:39', 6, -1, 1, '2024-06-18 23:04:39'),
(3012, '2024-06-18 23:04:39', 12, -1, 1, '2024-06-18 23:04:39'),
(3013, '2024-06-18 23:04:39', 17, -1, 1, '2024-06-18 23:04:39'),
(3014, '2024-06-18 23:04:39', 18, -1, 1, '2024-06-18 23:04:39'),
(3015, '2024-06-18 23:04:39', 19, -1, 1, '2024-06-18 23:04:39'),
(3016, '2024-06-18 23:04:39', 21, -1, 1, '2024-06-18 23:04:39'),
(3017, '2024-06-18 23:04:39', 22, -1, 1, '2024-06-18 23:04:39'),
(3018, '2024-06-18 23:04:39', 23, -1, 1, '2024-06-18 23:04:39'),
(3019, '2024-06-18 23:04:39', 29, -1, 1, '2024-06-18 23:04:39'),
(3020, '2024-06-18 23:04:39', 30, -1, 1, '2024-06-18 23:04:39'),
(3021, '2024-06-18 23:04:39', 31, -1, 1, '2024-06-18 23:04:39'),
(3022, '2024-06-18 23:04:39', 35, -1, 1, '2024-06-18 23:04:39'),
(3023, '2024-06-18 23:04:39', 36, -1, 1, '2024-06-18 23:04:39'),
(3024, '2024-06-18 23:04:39', 37, -1, 1, '2024-06-18 23:04:39'),
(3025, '2024-06-18 23:04:39', 40, -1, 1, '2024-06-18 23:04:39'),
(3026, '2024-06-18 23:04:39', 41, -1, 1, '2024-06-18 23:04:39'),
(3027, '2024-06-18 23:04:39', 42, -1, 1, '2024-06-18 23:04:39'),
(3028, '2024-06-18 23:04:39', 112, -1, 1, '2024-06-18 23:04:39'),
(3029, '2024-06-18 23:04:39', 113, -1, 1, '2024-06-18 23:04:39'),
(3030, '2024-06-18 23:04:39', 114, -1, 1, '2024-06-18 23:04:39'),
(3031, '2024-06-18 23:04:39', 119, -1, 1, '2024-06-18 23:04:39'),
(3032, '2024-06-18 23:04:39', 120, -1, 1, '2024-06-18 23:04:40'),
(3033, '2024-06-18 23:04:40', 121, -1, 1, '2024-06-18 23:04:40'),
(3034, '2024-06-18 23:04:40', 125, -1, 1, '2024-06-18 23:04:40'),
(3035, '2024-06-18 23:04:40', 126, -1, 1, '2024-06-18 23:04:40'),
(3036, '2024-06-18 23:04:40', 127, -1, 1, '2024-06-18 23:04:40'),
(3037, '2024-06-18 23:04:40', 7, -1, 1, '2024-06-18 23:04:40'),
(3038, '2024-06-18 23:04:40', 10, -1, 1, '2024-06-18 23:04:40'),
(3039, '2024-06-18 23:04:40', 11, -1, 1, '2024-06-18 23:04:40'),
(3040, '2024-06-18 23:04:40', 20, -1, 1, '2024-06-18 23:04:40'),
(3041, '2024-06-18 23:04:40', 24, -1, 1, '2024-06-18 23:04:40'),
(3042, '2024-06-18 23:04:40', 25, -1, 1, '2024-06-18 23:04:40'),
(3043, '2024-06-18 23:04:40', 26, -1, 1, '2024-06-18 23:04:40'),
(3044, '2024-06-18 23:04:40', 32, -1, 1, '2024-06-18 23:04:40'),
(3045, '2024-06-18 23:04:40', 34, -1, 1, '2024-06-18 23:04:40'),
(3046, '2024-06-18 23:04:40', 95, -1, 1, '2024-06-18 23:04:40'),
(3047, '2024-06-18 23:04:40', 97, -1, 1, '2024-06-18 23:04:40'),
(3048, '2024-06-18 23:04:40', 100, -1, 1, '2024-06-18 23:04:40'),
(3049, '2024-06-18 23:04:40', 115, -1, 1, '2024-06-18 23:04:40'),
(3050, '2024-06-18 23:04:40', 116, -1, 1, '2024-06-18 23:04:40'),
(3051, '2024-06-18 23:04:40', 117, -1, 1, '2024-06-18 23:04:40'),
(3052, '2024-06-18 23:04:40', 122, -1, 1, '2024-06-18 23:04:40'),
(3053, '2024-06-18 23:04:40', 128, -1, 1, '2024-06-18 23:04:40'),
(3054, '2024-06-18 23:04:40', 13, -1, 1, '2024-06-18 23:04:40'),
(3055, '2024-06-18 23:04:40', 14, -1, 1, '2024-06-18 23:04:40'),
(3056, '2024-06-18 23:04:40', 15, -1, 1, '2024-06-18 23:04:40'),
(3057, '2024-06-18 23:04:40', 16, -1, 1, '2024-06-18 23:04:40'),
(3058, '2024-06-18 23:04:40', 27, -1, 1, '2024-06-18 23:04:40'),
(3059, '2024-06-18 23:04:40', 28, -1, 1, '2024-06-18 23:04:40'),
(3060, '2024-06-18 23:04:40', 33, -1, 1, '2024-06-18 23:04:40'),
(3061, '2024-06-18 23:04:40', 96, -1, 1, '2024-06-18 23:04:40'),
(3062, '2024-06-18 23:04:40', 111, -1, 1, '2024-06-18 23:04:40'),
(3063, '2024-06-18 23:04:40', 118, -1, 1, '2024-06-18 23:04:40'),
(3064, '2024-06-18 23:04:40', 101, -1, 1, '2024-06-18 23:04:40'),
(3065, '2024-06-18 23:04:40', 102, -1, 1, '2024-06-18 23:04:40');

-- --------------------------------------------------------

--
-- Estrutura para tabela `tb_active_account_users`
--

DROP TABLE IF EXISTS `tb_active_account_users`;
CREATE TABLE IF NOT EXISTS `tb_active_account_users` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_user` int(11) NOT NULL,
  `token` varchar(1020) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `expiration_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `status_token` int(11) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`),
  KEY `status_token` (`status_token`),
  KEY `fk_id_user` (`id_user`)
) ENGINE=InnoDB AUTO_INCREMENT=87 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Despejando dados para a tabela `tb_active_account_users`
--

INSERT INTO `tb_active_account_users` (`id`, `id_user`, `token`, `created_at`, `expiration_at`, `updated_at`, `status_token`) VALUES
(86, 48, 'eyJhbGciOiJBMjU2S1ciLCJlbmMiOiJBMjU2Q0JDLUhTNTEyIiwiemlwIjoiREVGIn0.XOq96XQpPyCsoKLnM-SIX_I_xQf9vex9hxRx2r676xLwl6tZjkmyJYIMa50WOZsaS31L-Xb_5pMl5ecCG7DA6GLFG3EI8OA1.8syhu9V8to-h8mzxnDX86w.nZTMrHmSyl--a-eIQiqzNmzFCT1qTjQy2N44x6bBAnWy3UU_xoCaC8SuaLkIqIxJUa9VJtFlA0R7dbbNPKPabLupaziC33GV0BJRee4NbcU0kbQo8CTuPgs9c_bP-HvY1G9igz3u4YXc_0Ui0-SIrhv1qoQIhm-hg-q9YuLUms4PuBfAKQs6KEHqnwmLJb0dr54-8cRsRX-isylfMdPBM-XCLaaWzjzPRChcf8qJZK6rxJSEsKFjo5ZLBgQW_MSKM8w74Qi7IxTYxRwchw0p858P0P8X5BkD9kLuoMLz19uPajB_e588Lk2dyvGuzXKE0XrhZqNNheRBXBUtOx-eaw.mq99M_DdhfVUY14cz8KSnFWkfO24FhmFZ5DuJVXE6Lc', '2024-06-12 00:12:10', '2024-06-12 00:27:10', '2024-06-12 00:13:51', 1);

-- --------------------------------------------------------

--
-- Estrutura para tabela `tb_apis`
--

DROP TABLE IF EXISTS `tb_apis`;
CREATE TABLE IF NOT EXISTS `tb_apis` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `created_at` timestamp NULL DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  `api_key` varchar(255) NOT NULL,
  `api_name` varchar(255) NOT NULL,
  `api_description` varchar(255) DEFAULT NULL,
  `api_path` varchar(255) DEFAULT NULL,
  `active` int(1) NOT NULL,
  `status_id` int(11) NOT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `user_id` (`user_id`),
  KEY `fk_status_id_api` (`status_id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Despejando dados para a tabela `tb_apis`
--

INSERT INTO `tb_apis` (`id`, `created_at`, `user_id`, `api_key`, `api_name`, `api_description`, `api_path`, `active`, `status_id`, `updated_at`) VALUES
(1, '2023-06-22 10:33:22', -1, 'cbde0f8d35b6443168614339a04fd739', 'Api Auth Token', 'Apikey usada para gerar o token JWE', '/api/v1/auth', 1, 1, NULL),
(2, '2023-06-22 17:46:56', -1, 'bSf9Dp6gqZuxHXBjJW4hW9vK8VX2u', 'Apikey Active Account', 'Apikey usada exclusivamante para ativação de conta', '/email/active-account', 1, 1, '2023-12-21 14:44:29'),
(3, '2023-06-22 10:33:22', -1, 'cbde0f8d35b6443168614339a04fd739', 'Apikey Personal Finance Tracker', 'Apikey usada consumir a rota que retorna as informações da API', '/api/v1', 1, 1, NULL),
(4, '2023-06-22 10:33:22', -1, 'cbde0f8d35b6443168614339a04fd739', 'Testes', 'Apikey testes', '/api/v1/email/active-account', 1, 1, NULL),
(5, '2023-08-14 21:21:44', -1, 'S5BZ9w67GCimUprQzStF8XjWiCQhlnhB', 'Apikey Orders', 'Apikey Orders', '/api/v1/orders', 1, 1, NULL),
(6, '2023-06-22 10:33:22', -1, 'cbde0f8d35b6443168614339a04fd739', 'Api Auth Token', 'Apikey usada para validar o token JWE', '/api/v1/check', 1, 1, NULL);

-- --------------------------------------------------------

--
-- Estrutura para tabela `tb_category`
--

DROP TABLE IF EXISTS `tb_category`;
CREATE TABLE IF NOT EXISTS `tb_category` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `created_at` timestamp NULL DEFAULT NULL,
  `description` varchar(255) NOT NULL,
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Despejando dados para a tabela `tb_category`
--

INSERT INTO `tb_category` (`id`, `created_at`, `description`, `updated_at`) VALUES
(1, '2024-06-18 17:34:25', 'SANDALHA', '2024-06-18 20:36:19'),
(2, '2024-06-19 16:22:08', 'CHINELO', '2024-06-19 19:22:17');

-- --------------------------------------------------------

--
-- Estrutura para tabela `tb_color`
--

DROP TABLE IF EXISTS `tb_color`;
CREATE TABLE IF NOT EXISTS `tb_color` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `color` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Despejando dados para a tabela `tb_color`
--

INSERT INTO `tb_color` (`id`, `color`) VALUES
(1, 'yellow'),
(2, 'green'),
(3, 'red'),
(4, 'blue'),
(5, 'gray'),
(6, 'orange'),
(7, 'pink'),
(8, 'purple'),
(9, 'white'),
(10, 'black');

-- --------------------------------------------------------

--
-- Estrutura para tabela `tb_control_token`
--

DROP TABLE IF EXISTS `tb_control_token`;
CREATE TABLE IF NOT EXISTS `tb_control_token` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `encrypted_key` varchar(510) NOT NULL,
  `hash_token` varchar(255) NOT NULL,
  `token` varchar(510) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estrutura para tabela `tb_days_of_week`
--

DROP TABLE IF EXISTS `tb_days_of_week`;
CREATE TABLE IF NOT EXISTS `tb_days_of_week` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `number_day` int(11) NOT NULL,
  `short_description` varchar(255) NOT NULL,
  `long_description` varchar(255) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' ON UPDATE current_timestamp(),
  PRIMARY KEY (`id`),
  UNIQUE KEY `number_day` (`number_day`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Despejando dados para a tabela `tb_days_of_week`
--

INSERT INTO `tb_days_of_week` (`id`, `number_day`, `short_description`, `long_description`, `created_at`, `updated_at`) VALUES
(1, 1, 'Dom', 'Domingo', '2023-05-30 15:28:27', '2023-05-30 11:30:38'),
(2, 2, 'Seg', 'Segunda-Feira', '2023-05-30 15:30:26', '2023-05-30 12:29:43'),
(3, 3, 'Ter', 'Terça-Feira', '2023-05-30 15:30:26', '2023-05-30 12:34:48'),
(4, 4, 'Qua', 'Quarta-Feira', '2023-05-30 15:30:26', '2023-05-30 12:33:52'),
(5, 5, 'Qui', 'Quinta-Feira', '2023-05-30 15:30:26', '2023-05-30 12:27:56'),
(6, 6, 'Sex', 'Sexta-Feira', '2023-05-30 15:30:26', '2023-05-30 12:23:59'),
(7, 7, 'Sab', 'Sábado', '2023-05-30 15:30:26', '2023-05-30 12:22:02');

-- --------------------------------------------------------

--
-- Estrutura para tabela `tb_email_alarmes`
--

DROP TABLE IF EXISTS `tb_email_alarmes`;
CREATE TABLE IF NOT EXISTS `tb_email_alarmes` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `status` int(11) NOT NULL,
  `email_verified` int(11) NOT NULL DEFAULT 1,
  `created_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id`),
  KEY `id_status_email` (`status`),
  KEY `id_status_verified` (`email_verified`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Despejando dados para a tabela `tb_email_alarmes`
--

INSERT INTO `tb_email_alarmes` (`id`, `name`, `email`, `status`, `email_verified`, `created_at`, `updated_at`) VALUES
(3, 'Walter Moura', 'walter.araujo.dw@gmail.com', 2, 2, '2023-12-21 14:27:41', '2023-12-21 14:27:41');

-- --------------------------------------------------------

--
-- Estrutura para tabela `tb_events_status`
--

DROP TABLE IF EXISTS `tb_events_status`;
CREATE TABLE IF NOT EXISTS `tb_events_status` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `status` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' ON UPDATE current_timestamp(),
  `description` varchar(255) NOT NULL,
  `color_id` int(11) NOT NULL,
  `text_color_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `status_event` (`status`),
  KEY `color_id` (`color_id`),
  KEY `text_color_id` (`text_color_id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Despejando dados para a tabela `tb_events_status`
--

INSERT INTO `tb_events_status` (`id`, `status`, `created_at`, `updated_at`, `description`, `color_id`, `text_color_id`) VALUES
(1, 'PENDENTE_CONFIRMAR', '2023-02-20 14:20:21', '2023-12-19 20:37:02', 'PENDENTE CONFIRMAR', 1, 10),
(2, 'AGENDADO', '2023-02-20 14:20:21', '2023-02-27 20:48:52', 'AGENDADO', 6, 9),
(3, 'CONFIRMADO', '2023-02-20 14:20:53', '2023-02-27 20:48:56', 'CONFIRMADO', 2, 9),
(4, 'CANCELADO', '2023-05-27 22:47:16', '0000-00-00 00:00:00', 'CANCELADO', 3, 9),
(6, 'EM_ABERTO', '2024-01-12 13:36:58', '0000-00-00 00:00:00', 'EM ABERTO', 8, 9);

-- --------------------------------------------------------

--
-- Estrutura para tabela `tb_log`
--

DROP TABLE IF EXISTS `tb_log`;
CREATE TABLE IF NOT EXISTS `tb_log` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_user` int(11) DEFAULT NULL,
  `application` varchar(255) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT current_timestamp(),
  `data` mediumtext DEFAULT NULL,
  `token` varchar(255) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `login` (`id_user`)
) ENGINE=InnoDB AUTO_INCREMENT=235 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Despejando dados para a tabela `tb_log`
--

INSERT INTO `tb_log` (`id`, `id_user`, `application`, `created_at`, `data`, `token`) VALUES
(1, -1, 'App\\Controller\\Application\\AdvancedSettings->getConfig', '2024-06-18 00:26:51', 'Acesso a página de configurações avançadas.', 'E961629B-8FAA-39CB-794B-37162E7ACF05'),
(2, -1, 'App\\Controller\\Application\\AdvancedSettings->getConfig', '2024-06-18 00:52:23', 'Acesso a página de configurações avançadas.', 'E961629B-8FAA-39CB-794B-37162E7ACF05'),
(3, -1, 'App\\Controller\\Application\\TypeModule->getNewTypeModule', '2024-06-18 00:52:30', 'Acesso a página tipo módulos.', 'E961629B-8FAA-39CB-794B-37162E7ACF05'),
(4, -1, 'App\\Controller\\Application\\TypeModule->getEditTypeModule', '2024-06-18 00:53:08', 'Acesso a página tipo módulos.', 'E961629B-8FAA-39CB-794B-37162E7ACF05'),
(5, -1, 'App\\Controller\\Application\\AdvancedSettings->getConfig', '2024-06-18 00:53:10', 'Acesso a página de configurações avançadas.', 'E961629B-8FAA-39CB-794B-37162E7ACF05'),
(6, -1, 'App\\Controller\\Application\\Module->getNewModule', '2024-06-18 00:53:25', 'Acesso a página de módulos.', 'E961629B-8FAA-39CB-794B-37162E7ACF05'),
(7, -1, 'App\\Controller\\Application\\Module->getNewModule', '2024-06-18 00:53:34', 'Acesso a página de módulos.', 'E961629B-8FAA-39CB-794B-37162E7ACF05'),
(8, -1, 'App\\Controller\\Application\\AdvancedSettings->getConfig', '2024-06-18 00:53:35', 'Acesso a página de configurações avançadas.', 'E961629B-8FAA-39CB-794B-37162E7ACF05'),
(9, -1, 'App\\Controller\\Application\\Module->getEditModule', '2024-06-18 00:53:38', 'Acesso a página de módulos.', 'E961629B-8FAA-39CB-794B-37162E7ACF05'),
(10, -1, 'App\\Controller\\Application\\AdvancedSettings->getConfig', '2024-06-18 00:54:48', 'Acesso a página de configurações avançadas.', 'E961629B-8FAA-39CB-794B-37162E7ACF05'),
(11, -1, 'App\\Controller\\Application\\Module->getEditModule', '2024-06-18 00:58:31', 'Acesso a página de módulos.', 'E961629B-8FAA-39CB-794B-37162E7ACF05'),
(12, -1, 'App\\Controller\\Application\\AdvancedSettings->getConfig', '2024-06-18 00:58:34', 'Acesso a página de configurações avançadas.', 'E961629B-8FAA-39CB-794B-37162E7ACF05'),
(13, -1, 'App\\Controller\\Application\\AccessModule->getEditAccessModule', '2024-06-18 00:58:38', 'Acesso a página de associar módulos.', 'E961629B-8FAA-39CB-794B-37162E7ACF05'),
(14, -1, 'App\\Controller\\Application\\AccessModule->getEditAccessModule', '2024-06-18 00:58:47', 'Acesso a página de associar módulos.', 'E961629B-8FAA-39CB-794B-37162E7ACF05'),
(15, -1, 'App\\Controller\\Application\\AdvancedSettings->getConfig', '2024-06-18 00:59:13', 'Acesso a página de configurações avançadas.', 'E961629B-8FAA-39CB-794B-37162E7ACF05'),
(16, -1, 'App\\Controller\\Login\\Login->setLogin', '2024-06-18 20:18:45', 'Usuário logado com sucesso.', '2E2C8963-BB47-07D5-E1BD-ECBE0AF80370'),
(17, -1, 'App\\Controller\\Login\\Login->setLogin', '2024-06-18 21:42:42', 'Usuário logado com sucesso.', '3120E785-B253-81B7-D253-D586D6B05727'),
(18, -1, 'App\\Controller\\Application\\StockMaintenance->getHome', '2024-06-18 21:59:08', 'Acesso a página de apikey.', '3120E785-B253-81B7-D253-D586D6B05727'),
(19, -1, 'App\\Controller\\Application\\StockMaintenance->getHome', '2024-06-18 22:01:13', 'Acesso a página de apikey.', '3120E785-B253-81B7-D253-D586D6B05727'),
(20, -1, 'App\\Controller\\Application\\StockMaintenance->getHome', '2024-06-18 22:01:59', 'Acesso a página de apikey.', '3120E785-B253-81B7-D253-D586D6B05727'),
(21, -1, 'App\\Controller\\Application\\AdvancedSettings->getConfig', '2024-06-18 22:07:51', 'Acesso a página de configurações avançadas.', '3120E785-B253-81B7-D253-D586D6B05727'),
(22, -1, 'App\\Controller\\Application\\AccessModule->getEditAccessModule', '2024-06-18 22:07:58', 'Acesso a página de associar módulos.', '3120E785-B253-81B7-D253-D586D6B05727'),
(23, -1, 'App\\Controller\\Application\\AccessModule->getEditAccessModule', '2024-06-18 22:08:38', 'Acesso a página de associar módulos.', '3120E785-B253-81B7-D253-D586D6B05727'),
(24, -1, 'App\\Controller\\Application\\AdvancedSettings->getConfig', '2024-06-18 22:08:40', 'Acesso a página de configurações avançadas.', '3120E785-B253-81B7-D253-D586D6B05727'),
(25, -1, 'App\\Controller\\Application\\AccessModule->getEditAccessModule', '2024-06-18 22:08:50', 'Acesso a página de associar módulos.', '3120E785-B253-81B7-D253-D586D6B05727'),
(26, -1, 'App\\Controller\\Application\\AccessModule->getEditAccessModule', '2024-06-18 22:08:55', 'Acesso a página de associar módulos.', '3120E785-B253-81B7-D253-D586D6B05727'),
(27, -1, 'App\\Controller\\Application\\AdvancedSettings->getConfig', '2024-06-18 22:08:57', 'Acesso a página de configurações avançadas.', '3120E785-B253-81B7-D253-D586D6B05727'),
(28, -1, 'App\\Controller\\Application\\AdvancedSettings->getConfig', '2024-06-18 22:12:15', 'Acesso a página de configurações avançadas.', '3120E785-B253-81B7-D253-D586D6B05727'),
(29, -1, 'App\\Controller\\Application\\StockMaintenance->getHome', '2024-06-18 22:14:13', 'Acesso a página de apikey.', '3120E785-B253-81B7-D253-D586D6B05727'),
(30, -1, 'App\\Controller\\Application\\AdvancedSettings->getConfig', '2024-06-18 22:19:17', 'Acesso a página de configurações avançadas.', '3120E785-B253-81B7-D253-D586D6B05727'),
(31, -1, 'App\\Controller\\Application\\Module->getNewModule', '2024-06-18 22:19:26', 'Acesso a página de módulos.', '3120E785-B253-81B7-D253-D586D6B05727'),
(32, -1, 'App\\Controller\\Application\\Module->getEditModule', '2024-06-18 22:19:46', 'Acesso a página de módulos.', '3120E785-B253-81B7-D253-D586D6B05727'),
(33, -1, 'App\\Controller\\Application\\Module->getNewModule', '2024-06-18 22:23:13', 'Acesso a página de módulos.', '3120E785-B253-81B7-D253-D586D6B05727'),
(34, -1, 'App\\Controller\\Application\\Module->getEditModule', '2024-06-18 22:23:33', 'Acesso a página de módulos.', '3120E785-B253-81B7-D253-D586D6B05727'),
(35, -1, 'App\\Controller\\Application\\Module->getNewModule', '2024-06-18 22:23:45', 'Acesso a página de módulos.', '3120E785-B253-81B7-D253-D586D6B05727'),
(36, -1, 'App\\Controller\\Application\\Module->getEditModule', '2024-06-18 22:24:04', 'Acesso a página de módulos.', '3120E785-B253-81B7-D253-D586D6B05727'),
(37, -1, 'App\\Controller\\Application\\AdvancedSettings->getConfig', '2024-06-18 22:25:19', 'Acesso a página de configurações avançadas.', '3120E785-B253-81B7-D253-D586D6B05727'),
(38, -1, 'App\\Controller\\Application\\AdvancedSettings->getConfig', '2024-06-18 22:27:02', 'Acesso a página de configurações avançadas.', '3120E785-B253-81B7-D253-D586D6B05727'),
(39, -1, 'App\\Controller\\Application\\Module->getNewModule', '2024-06-18 22:27:04', 'Acesso a página de módulos.', '3120E785-B253-81B7-D253-D586D6B05727'),
(40, -1, 'App\\Controller\\Application\\Module->getEditModule', '2024-06-18 22:27:31', 'Acesso a página de módulos.', '3120E785-B253-81B7-D253-D586D6B05727'),
(41, -1, 'App\\Controller\\Application\\AdvancedSettings->getConfig', '2024-06-18 22:27:33', 'Acesso a página de configurações avançadas.', '3120E785-B253-81B7-D253-D586D6B05727'),
(42, -1, 'App\\Controller\\Application\\AdvancedSettings->getConfig', '2024-06-18 22:29:39', 'Acesso a página de configurações avançadas.', '3120E785-B253-81B7-D253-D586D6B05727'),
(43, -1, 'App\\Controller\\Application\\AdvancedSettings->getConfig', '2024-06-18 22:34:35', 'Acesso a página de configurações avançadas.', '3120E785-B253-81B7-D253-D586D6B05727'),
(44, -1, 'App\\Controller\\Application\\AccessModule->getEditAccessModule', '2024-06-18 22:34:42', 'Acesso a página de associar módulos.', '3120E785-B253-81B7-D253-D586D6B05727'),
(45, -1, 'App\\Controller\\Application\\AccessModule->getEditAccessModule', '2024-06-18 22:34:54', 'Acesso a página de associar módulos.', '3120E785-B253-81B7-D253-D586D6B05727'),
(46, -1, 'App\\Controller\\Application\\StockMaintenance->getHome', '2024-06-18 22:34:55', 'Acesso a página de manutenção estoque.', '3120E785-B253-81B7-D253-D586D6B05727'),
(47, -1, 'App\\Controller\\Application\\AdvancedSettings->getConfig', '2024-06-18 22:35:08', 'Acesso a página de configurações avançadas.', '3120E785-B253-81B7-D253-D586D6B05727'),
(48, -1, 'App\\Controller\\Application\\AccessModule->getEditAccessModule', '2024-06-18 22:35:12', 'Acesso a página de associar módulos.', '3120E785-B253-81B7-D253-D586D6B05727'),
(49, -1, 'App\\Controller\\Application\\StockMaintenance->getHome', '2024-06-18 22:35:20', 'Acesso a página de manutenção estoque.', '3120E785-B253-81B7-D253-D586D6B05727'),
(50, -1, 'App\\Controller\\Application\\AdvancedSettings->getConfig', '2024-06-18 22:35:23', 'Acesso a página de configurações avançadas.', '3120E785-B253-81B7-D253-D586D6B05727'),
(51, -1, 'App\\Controller\\Application\\AccessModule->getEditAccessModule', '2024-06-18 22:35:32', 'Acesso a página de associar módulos.', '3120E785-B253-81B7-D253-D586D6B05727'),
(52, -1, 'App\\Controller\\Application\\AccessModule->getEditAccessModule', '2024-06-18 22:35:45', 'Acesso a página de associar módulos.', '3120E785-B253-81B7-D253-D586D6B05727'),
(53, -1, 'App\\Controller\\Application\\StockMaintenance->getHome', '2024-06-18 22:35:47', 'Acesso a página de manutenção estoque.', '3120E785-B253-81B7-D253-D586D6B05727'),
(54, -1, 'App\\Controller\\Application\\StockMaintenance->getHome', '2024-06-18 22:36:38', 'Acesso a página de manutenção estoque.', '3120E785-B253-81B7-D253-D586D6B05727'),
(55, -1, 'App\\Controller\\Application\\Login->setLogout', '2024-06-18 23:00:09', 'Realizado logout do usuário.', '3120E785-B253-81B7-D253-D586D6B05727'),
(56, -1, 'App\\Controller\\Login\\Login->setLogin', '2024-06-18 23:04:26', 'Usuário logado com sucesso.', '391775B7-B8C5-DB40-7829-4717B7E97268'),
(57, -1, 'App\\Controller\\Application\\StockMaintenance->getHome', '2024-06-18 23:04:29', 'Acesso a página de manutenção estoque.', '391775B7-B8C5-DB40-7829-4717B7E97268'),
(58, -1, 'App\\Controller\\Application\\AdvancedSettings->getConfig', '2024-06-18 23:04:33', 'Acesso a página de configurações avançadas.', '391775B7-B8C5-DB40-7829-4717B7E97268'),
(59, -1, 'App\\Controller\\Application\\AccessModule->getEditAccessModule', '2024-06-18 23:04:37', 'Acesso a página de associar módulos.', '391775B7-B8C5-DB40-7829-4717B7E97268'),
(60, -1, 'App\\Controller\\Application\\AccessModule->getEditAccessModule', '2024-06-18 23:04:40', 'Acesso a página de associar módulos.', '391775B7-B8C5-DB40-7829-4717B7E97268'),
(61, -1, 'App\\Controller\\Login\\Login->setLogin', '2024-06-19 14:15:39', 'Usuário logado com sucesso.', '6F78AA96-C5C5-7A80-22FC-3CDDC08466B6'),
(62, -1, 'App\\Controller\\Application\\StockMaintenance->getHome', '2024-06-19 14:15:59', 'Acesso a página de manutenção estoque.', '6F78AA96-C5C5-7A80-22FC-3CDDC08466B6'),
(63, -1, 'App\\Controller\\Application\\StockMaintenance->getHome', '2024-06-19 14:58:20', 'Acesso a página de manutenção estoque.', '6F78AA96-C5C5-7A80-22FC-3CDDC08466B6'),
(64, -1, 'App\\Controller\\Application\\StockMaintenance->getHome', '2024-06-19 14:58:26', 'Acesso a página de manutenção estoque.', '6F78AA96-C5C5-7A80-22FC-3CDDC08466B6'),
(65, -1, 'App\\Controller\\Application\\StockMaintenance->getHome', '2024-06-19 14:59:11', 'Acesso a página de manutenção estoque.', '6F78AA96-C5C5-7A80-22FC-3CDDC08466B6'),
(66, -1, 'App\\Controller\\Application\\StockMaintenance->getHome', '2024-06-19 15:03:16', 'Acesso a página de manutenção estoque.', '6F78AA96-C5C5-7A80-22FC-3CDDC08466B6'),
(67, -1, 'App\\Controller\\Application\\StockMaintenance->getHome', '2024-06-19 15:26:49', 'Acesso a página de manutenção estoque.', '6F78AA96-C5C5-7A80-22FC-3CDDC08466B6'),
(68, -1, 'App\\Controller\\Application\\StockMaintenance->getHome', '2024-06-19 15:33:47', 'Acesso a página de manutenção estoque.', '6F78AA96-C5C5-7A80-22FC-3CDDC08466B6'),
(69, -1, 'App\\Controller\\Application\\Product->getNewProduct', '2024-06-19 15:34:40', 'Acesso a página de produto.', '6F78AA96-C5C5-7A80-22FC-3CDDC08466B6'),
(70, -1, 'App\\Controller\\Login\\Login->setLogin', '2024-06-19 18:02:45', 'Usuário logado com sucesso.', '10403E7D-1814-4D09-129C-4EB88969D4F9'),
(71, -1, 'App\\Controller\\Application\\StockMaintenance->getHome', '2024-06-19 18:05:11', 'Acesso a página de manutenção estoque.', '10403E7D-1814-4D09-129C-4EB88969D4F9'),
(72, -1, 'App\\Controller\\Application\\Product->getNewProduct', '2024-06-19 18:05:19', 'Acesso a página de produto.', '10403E7D-1814-4D09-129C-4EB88969D4F9'),
(73, -1, 'App\\Controller\\Application\\Product->getNewProduct', '2024-06-19 18:17:35', 'Acesso a página de produto.', '10403E7D-1814-4D09-129C-4EB88969D4F9'),
(74, -1, 'App\\Controller\\Application\\Product->getNewProduct', '2024-06-19 18:22:51', 'Acesso a página de produto.', '10403E7D-1814-4D09-129C-4EB88969D4F9'),
(75, -1, 'App\\Controller\\Application\\Product->getNewProduct', '2024-06-19 18:24:39', 'Acesso a página de produto.', '10403E7D-1814-4D09-129C-4EB88969D4F9'),
(76, -1, 'App\\Controller\\Application\\Product->getNewProduct', '2024-06-19 18:24:42', 'Acesso a página de produto.', '10403E7D-1814-4D09-129C-4EB88969D4F9'),
(77, -1, 'App\\Controller\\Application\\Product->getNewProduct', '2024-06-19 18:24:42', 'Acesso a página de produto.', '10403E7D-1814-4D09-129C-4EB88969D4F9'),
(78, -1, 'App\\Controller\\Application\\Product->getNewProduct', '2024-06-19 18:27:39', 'Acesso a página de produto.', '10403E7D-1814-4D09-129C-4EB88969D4F9'),
(79, -1, 'App\\Controller\\Application\\Product->getNewProduct', '2024-06-19 18:28:25', 'Acesso a página de produto.', '10403E7D-1814-4D09-129C-4EB88969D4F9'),
(80, -1, 'App\\Controller\\Application\\Product->getNewProduct', '2024-06-19 18:29:17', 'Acesso a página de produto.', '10403E7D-1814-4D09-129C-4EB88969D4F9'),
(81, -1, 'App\\Controller\\Application\\Product->getNewProduct', '2024-06-19 18:30:14', 'Acesso a página de produto.', '10403E7D-1814-4D09-129C-4EB88969D4F9'),
(82, -1, 'App\\Controller\\Application\\Product->getNewProduct', '2024-06-19 18:33:49', 'Acesso a página de produto.', '10403E7D-1814-4D09-129C-4EB88969D4F9'),
(83, -1, 'App\\Controller\\Application\\Product->getNewProduct', '2024-06-19 18:35:40', 'Acesso a página de produto.', '10403E7D-1814-4D09-129C-4EB88969D4F9'),
(84, -1, 'App\\Controller\\Application\\Product->getNewProduct', '2024-06-19 18:38:22', 'Acesso a página de produto.', '10403E7D-1814-4D09-129C-4EB88969D4F9'),
(85, -1, 'App\\Controller\\Application\\Product->getNewProduct', '2024-06-19 18:38:55', 'Acesso a página de produto.', '10403E7D-1814-4D09-129C-4EB88969D4F9'),
(86, -1, 'App\\Controller\\Application\\Product->getNewProduct', '2024-06-19 18:41:34', 'Acesso a página de produto.', '10403E7D-1814-4D09-129C-4EB88969D4F9'),
(87, -1, 'App\\Controller\\Application\\Product->getNewProduct', '2024-06-19 18:41:38', 'Acesso a página de produto.', '10403E7D-1814-4D09-129C-4EB88969D4F9'),
(88, -1, 'App\\Controller\\Application\\Product->getNewProduct', '2024-06-19 18:51:18', 'Acesso a página de produto.', '10403E7D-1814-4D09-129C-4EB88969D4F9'),
(89, -1, 'App\\Controller\\Application\\Product->getNewProduct', '2024-06-19 18:53:50', 'Acesso a página de produto.', '10403E7D-1814-4D09-129C-4EB88969D4F9'),
(90, -1, 'App\\Controller\\Application\\Product->getNewProduct', '2024-06-19 18:55:10', 'Acesso a página de produto.', '10403E7D-1814-4D09-129C-4EB88969D4F9'),
(91, -1, 'App\\Controller\\Application\\Product->getNewProduct', '2024-06-19 18:57:51', 'Acesso a página de produto.', '10403E7D-1814-4D09-129C-4EB88969D4F9'),
(92, -1, 'App\\Controller\\Application\\Product->getNewProduct', '2024-06-19 18:58:46', 'Acesso a página de produto.', '10403E7D-1814-4D09-129C-4EB88969D4F9'),
(93, -1, 'App\\Controller\\Application\\Product->getNewProduct', '2024-06-19 18:58:48', 'Acesso a página de produto.', '10403E7D-1814-4D09-129C-4EB88969D4F9'),
(94, -1, 'App\\Controller\\Application\\Product->getNewProduct', '2024-06-19 18:58:48', 'Acesso a página de produto.', '10403E7D-1814-4D09-129C-4EB88969D4F9'),
(95, -1, 'App\\Controller\\Application\\Product->getNewProduct', '2024-06-19 18:58:49', 'Acesso a página de produto.', '10403E7D-1814-4D09-129C-4EB88969D4F9'),
(96, -1, 'App\\Controller\\Application\\Product->getNewProduct', '2024-06-19 18:58:49', 'Acesso a página de produto.', '10403E7D-1814-4D09-129C-4EB88969D4F9'),
(97, -1, 'App\\Controller\\Application\\Product->getNewProduct', '2024-06-19 19:01:10', 'Acesso a página de produto.', '10403E7D-1814-4D09-129C-4EB88969D4F9'),
(98, -1, 'App\\Controller\\Application\\Product->getNewProduct', '2024-06-19 19:01:12', 'Acesso a página de produto.', '10403E7D-1814-4D09-129C-4EB88969D4F9'),
(99, -1, 'App\\Controller\\Application\\Product->getNewProduct', '2024-06-19 19:01:14', 'Acesso a página de produto.', '10403E7D-1814-4D09-129C-4EB88969D4F9'),
(100, -1, 'App\\Controller\\Application\\Product->getNewProduct', '2024-06-19 19:03:48', 'Acesso a página de produto.', '10403E7D-1814-4D09-129C-4EB88969D4F9'),
(101, -1, 'App\\Controller\\Application\\Product->getNewProduct', '2024-06-19 19:03:51', 'Acesso a página de produto.', '10403E7D-1814-4D09-129C-4EB88969D4F9'),
(102, -1, 'App\\Controller\\Application\\Product->getNewProduct', '2024-06-19 19:04:29', 'Acesso a página de produto.', '10403E7D-1814-4D09-129C-4EB88969D4F9'),
(103, -1, 'App\\Controller\\Application\\Product->getNewProduct', '2024-06-19 19:05:57', 'Acesso a página de produto.', '10403E7D-1814-4D09-129C-4EB88969D4F9'),
(104, -1, 'App\\Controller\\Application\\Product->getNewProduct', '2024-06-19 19:05:59', 'Acesso a página de produto.', '10403E7D-1814-4D09-129C-4EB88969D4F9'),
(105, -1, 'App\\Controller\\Application\\Product->getNewProduct', '2024-06-19 19:05:59', 'Acesso a página de produto.', '10403E7D-1814-4D09-129C-4EB88969D4F9'),
(106, -1, 'App\\Controller\\Application\\Product->getNewProduct', '2024-06-19 19:06:00', 'Acesso a página de produto.', '10403E7D-1814-4D09-129C-4EB88969D4F9'),
(107, -1, 'App\\Controller\\Application\\Product->getNewProduct', '2024-06-19 19:07:12', 'Acesso a página de produto.', '10403E7D-1814-4D09-129C-4EB88969D4F9'),
(108, -1, 'App\\Controller\\Application\\Product->getNewProduct', '2024-06-19 19:09:12', 'Acesso a página de produto.', '10403E7D-1814-4D09-129C-4EB88969D4F9'),
(109, -1, 'App\\Controller\\Application\\Product->getNewProduct', '2024-06-19 19:11:16', 'Acesso a página de produto.', '10403E7D-1814-4D09-129C-4EB88969D4F9'),
(110, -1, 'App\\Controller\\Application\\Product->getNewProduct', '2024-06-19 19:12:55', 'Acesso a página de produto.', '10403E7D-1814-4D09-129C-4EB88969D4F9'),
(111, -1, 'App\\Controller\\Application\\Product->getNewProduct', '2024-06-19 19:15:02', 'Acesso a página de produto.', '10403E7D-1814-4D09-129C-4EB88969D4F9'),
(112, -1, 'App\\Controller\\Application\\Product->getNewProduct', '2024-06-19 19:16:05', 'Acesso a página de produto.', '10403E7D-1814-4D09-129C-4EB88969D4F9'),
(113, -1, 'App\\Controller\\Application\\Product->getNewProduct', '2024-06-19 19:35:46', 'Acesso a página de produto.', '10403E7D-1814-4D09-129C-4EB88969D4F9'),
(114, -1, 'App\\Controller\\Application\\Product->getNewProduct', '2024-06-19 19:53:50', 'Acesso a página de produto.', '10403E7D-1814-4D09-129C-4EB88969D4F9'),
(115, -1, 'App\\Controller\\Application\\Product->getNewProduct', '2024-06-19 19:54:33', 'Acesso a página de produto.', '10403E7D-1814-4D09-129C-4EB88969D4F9'),
(116, -1, 'App\\Controller\\Application\\Product->getNewProduct', '2024-06-19 20:00:35', 'Acesso a página de produto.', '10403E7D-1814-4D09-129C-4EB88969D4F9'),
(117, -1, 'App\\Controller\\Application\\Product->getNewProduct', '2024-06-19 20:00:50', 'Acesso a página de produto.', '10403E7D-1814-4D09-129C-4EB88969D4F9'),
(118, -1, 'App\\Controller\\Application\\Product->getNewProduct', '2024-06-19 20:02:25', 'Acesso a página de produto.', '10403E7D-1814-4D09-129C-4EB88969D4F9'),
(119, -1, 'App\\Controller\\Application\\Product->getNewProduct', '2024-06-19 20:13:47', 'Acesso a página de produto.', '10403E7D-1814-4D09-129C-4EB88969D4F9'),
(120, -1, 'App\\Controller\\Application\\Product->getNewProduct', '2024-06-19 20:14:47', 'Acesso a página de produto.', '10403E7D-1814-4D09-129C-4EB88969D4F9'),
(121, -1, 'App\\Controller\\Application\\Product->getNewProduct', '2024-06-19 20:14:52', 'Acesso a página de produto.', '10403E7D-1814-4D09-129C-4EB88969D4F9'),
(122, -1, 'App\\Controller\\Application\\Product->getNewProduct', '2024-06-19 20:16:44', 'Acesso a página de produto.', '10403E7D-1814-4D09-129C-4EB88969D4F9'),
(123, -1, 'App\\Controller\\Application\\Product->getNewProduct', '2024-06-19 20:17:13', 'Acesso a página de produto.', '10403E7D-1814-4D09-129C-4EB88969D4F9'),
(124, -1, 'App\\Controller\\Application\\Product->getNewProduct', '2024-06-19 20:17:59', 'Acesso a página de produto.', '10403E7D-1814-4D09-129C-4EB88969D4F9'),
(125, -1, 'App\\Controller\\Application\\StockMaintenance->getHome', '2024-06-19 20:18:04', 'Acesso a página de manutenção estoque.', '10403E7D-1814-4D09-129C-4EB88969D4F9'),
(126, -1, 'App\\Controller\\Application\\Product->getNewProduct', '2024-06-19 20:18:05', 'Acesso a página de produto.', '10403E7D-1814-4D09-129C-4EB88969D4F9'),
(127, -1, 'App\\Controller\\Application\\Product->getNewProduct', '2024-06-19 20:19:55', 'Acesso a página de produto.', '10403E7D-1814-4D09-129C-4EB88969D4F9'),
(128, -1, 'App\\Controller\\Application\\Product->getNewProduct', '2024-06-19 20:21:22', 'Acesso a página de produto.', '10403E7D-1814-4D09-129C-4EB88969D4F9'),
(129, -1, 'App\\Controller\\Application\\Product->getNewProduct', '2024-06-19 20:28:37', 'Acesso a página de produto.', '10403E7D-1814-4D09-129C-4EB88969D4F9'),
(130, -1, 'App\\Controller\\Application\\Product->getNewProduct', '2024-06-19 20:40:36', 'Acesso a página de produto.', '10403E7D-1814-4D09-129C-4EB88969D4F9'),
(131, -1, 'App\\Controller\\Application\\Product->getNewProduct', '2024-06-19 20:46:42', 'Acesso a página de produto.', '10403E7D-1814-4D09-129C-4EB88969D4F9'),
(132, -1, 'App\\Controller\\Application\\Product->getNewProduct', '2024-06-19 20:54:01', 'Acesso a página de produto.', '10403E7D-1814-4D09-129C-4EB88969D4F9'),
(133, -1, 'App\\Controller\\Application\\Product->getNewProduct', '2024-06-19 20:54:40', 'Acesso a página de produto.', '10403E7D-1814-4D09-129C-4EB88969D4F9'),
(134, -1, 'App\\Controller\\Application\\StockMaintenance->getHome', '2024-06-19 20:54:42', 'Acesso a página de manutenção estoque.', '10403E7D-1814-4D09-129C-4EB88969D4F9'),
(135, -1, 'App\\Controller\\Application\\StockMaintenance->getHome', '2024-06-19 20:55:28', 'Acesso a página de manutenção estoque.', '10403E7D-1814-4D09-129C-4EB88969D4F9'),
(136, -1, 'App\\Controller\\Application\\Product->getEditProduct', '2024-06-19 20:55:33', 'Acesso a página de produto.', '10403E7D-1814-4D09-129C-4EB88969D4F9'),
(137, -1, 'App\\Controller\\Application\\StockMaintenance->getHome', '2024-06-19 20:57:07', 'Acesso a página de manutenção estoque.', '10403E7D-1814-4D09-129C-4EB88969D4F9'),
(138, -1, 'App\\Controller\\Application\\Product->getNewProduct', '2024-06-19 20:57:10', 'Acesso a página de produto.', '10403E7D-1814-4D09-129C-4EB88969D4F9'),
(139, -1, 'App\\Controller\\Application\\StockMaintenance->getHome', '2024-06-19 20:57:14', 'Acesso a página de manutenção estoque.', '10403E7D-1814-4D09-129C-4EB88969D4F9'),
(140, -1, 'App\\Controller\\Application\\Product->getEditProduct', '2024-06-19 20:59:43', 'Acesso a página de produto.', '10403E7D-1814-4D09-129C-4EB88969D4F9'),
(141, -1, 'App\\Controller\\Application\\Product->getEditProduct', '2024-06-19 21:08:57', 'Acesso a página de produto.', '10403E7D-1814-4D09-129C-4EB88969D4F9'),
(142, -1, 'App\\Controller\\Application\\Product->getEditProduct', '2024-06-19 21:10:38', 'Acesso a página de produto.', '10403E7D-1814-4D09-129C-4EB88969D4F9'),
(143, -1, 'App\\Controller\\Application\\Product->getEditProduct', '2024-06-19 21:10:40', 'Acesso a página de produto.', '10403E7D-1814-4D09-129C-4EB88969D4F9'),
(144, -1, 'App\\Controller\\Application\\Product->getEditProduct', '2024-06-19 21:10:41', 'Acesso a página de produto.', '10403E7D-1814-4D09-129C-4EB88969D4F9'),
(145, -1, 'App\\Controller\\Application\\StockMaintenance->getHome', '2024-06-19 21:13:44', 'Acesso a página de manutenção estoque.', '10403E7D-1814-4D09-129C-4EB88969D4F9'),
(146, -1, 'App\\Controller\\Application\\Product->getEditProduct', '2024-06-19 21:13:47', 'Acesso a página de produto.', '10403E7D-1814-4D09-129C-4EB88969D4F9'),
(147, -1, 'App\\Controller\\Application\\StockMaintenance->getHome', '2024-06-19 21:13:49', 'Acesso a página de manutenção estoque.', '10403E7D-1814-4D09-129C-4EB88969D4F9'),
(148, -1, 'App\\Controller\\Application\\Product->getEditProduct', '2024-06-19 21:13:51', 'Acesso a página de produto.', '10403E7D-1814-4D09-129C-4EB88969D4F9'),
(149, -1, 'App\\Controller\\Application\\Product->getEditProduct', '2024-06-19 21:15:06', 'Acesso a página de produto.', '10403E7D-1814-4D09-129C-4EB88969D4F9'),
(150, -1, 'App\\Controller\\Application\\Product->getEditProduct', '2024-06-19 21:15:34', 'Acesso a página de produto.', '10403E7D-1814-4D09-129C-4EB88969D4F9'),
(151, -1, 'App\\Controller\\Application\\StockMaintenance->getHome', '2024-06-19 21:15:39', 'Acesso a página de manutenção estoque.', '10403E7D-1814-4D09-129C-4EB88969D4F9'),
(152, -1, 'App\\Controller\\Application\\StockMaintenance->getHome', '2024-06-20 01:37:45', 'Acesso a página de manutenção estoque.', '10403E7D-1814-4D09-129C-4EB88969D4F9'),
(153, -1, 'App\\Controller\\Application\\Product->getNewProduct', '2024-06-20 01:37:48', 'Acesso a página de produto.', '10403E7D-1814-4D09-129C-4EB88969D4F9'),
(154, -1, 'App\\Controller\\Application\\StockMaintenance->getHome', '2024-06-20 01:39:46', 'Acesso a página de manutenção estoque.', '10403E7D-1814-4D09-129C-4EB88969D4F9'),
(155, -1, 'App\\Controller\\Application\\Product->getNewProduct', '2024-06-20 01:40:10', 'Acesso a página de produto.', '10403E7D-1814-4D09-129C-4EB88969D4F9'),
(156, -1, 'App\\Controller\\Application\\Product->getNewProduct', '2024-06-20 01:40:35', 'Acesso a página de produto.', '10403E7D-1814-4D09-129C-4EB88969D4F9'),
(157, -1, 'App\\Controller\\Application\\StockMaintenance->getHome', '2024-06-20 01:40:43', 'Acesso a página de manutenção estoque.', '10403E7D-1814-4D09-129C-4EB88969D4F9'),
(158, -1, 'App\\Controller\\Application\\Product->getEditProduct', '2024-06-20 01:40:53', 'Acesso a página de produto.', '10403E7D-1814-4D09-129C-4EB88969D4F9'),
(159, -1, 'App\\Controller\\Application\\StockMaintenance->getHome', '2024-06-20 12:20:34', 'Acesso a página de manutenção estoque.', '10403E7D-1814-4D09-129C-4EB88969D4F9'),
(160, -1, 'App\\Controller\\Application\\Product->getNewProduct', '2024-06-20 12:20:36', 'Acesso a página de produto.', '10403E7D-1814-4D09-129C-4EB88969D4F9'),
(161, -1, 'App\\Controller\\Application\\Product->getNewProduct', '2024-06-20 12:21:25', 'Acesso a página de produto.', '10403E7D-1814-4D09-129C-4EB88969D4F9'),
(162, -1, 'App\\Controller\\Application\\StockMaintenance->getHome', '2024-06-20 12:25:57', 'Acesso a página de manutenção estoque.', '10403E7D-1814-4D09-129C-4EB88969D4F9'),
(163, -1, 'App\\Controller\\Application\\Product->getNewProduct', '2024-06-20 12:26:01', 'Acesso a página de produto.', '10403E7D-1814-4D09-129C-4EB88969D4F9'),
(164, -1, 'App\\Controller\\Application\\Product->getNewProduct', '2024-06-20 12:28:40', 'Acesso a página de produto.', '10403E7D-1814-4D09-129C-4EB88969D4F9'),
(165, -1, 'App\\Controller\\Application\\StockMaintenance->getHome', '2024-06-20 12:28:42', 'Acesso a página de manutenção estoque.', '10403E7D-1814-4D09-129C-4EB88969D4F9'),
(166, -1, 'App\\Controller\\Application\\Product->getNewProduct', '2024-06-20 12:28:46', 'Acesso a página de produto.', '10403E7D-1814-4D09-129C-4EB88969D4F9'),
(167, -1, 'App\\Controller\\Application\\Product->getNewProduct', '2024-06-20 12:29:18', 'Acesso a página de produto.', '10403E7D-1814-4D09-129C-4EB88969D4F9'),
(168, -1, 'App\\Controller\\Application\\StockMaintenance->getHome', '2024-06-20 12:30:59', 'Acesso a página de manutenção estoque.', '10403E7D-1814-4D09-129C-4EB88969D4F9'),
(169, -1, 'App\\Controller\\Application\\Product->getNewProduct', '2024-06-20 12:31:03', 'Acesso a página de produto.', '10403E7D-1814-4D09-129C-4EB88969D4F9'),
(170, -1, 'App\\Controller\\Application\\Product->getNewProduct', '2024-06-20 12:31:34', 'Acesso a página de produto.', '10403E7D-1814-4D09-129C-4EB88969D4F9'),
(171, -1, 'App\\Controller\\Application\\Product->getNewProduct', '2024-06-20 12:38:52', 'Acesso a página de produto.', '10403E7D-1814-4D09-129C-4EB88969D4F9'),
(172, -1, 'App\\Controller\\Application\\Product->getNewProduct', '2024-06-20 12:38:57', 'Acesso a página de produto.', '10403E7D-1814-4D09-129C-4EB88969D4F9'),
(173, -1, 'App\\Controller\\Application\\StockMaintenance->getHome', '2024-06-20 12:39:03', 'Acesso a página de manutenção estoque.', '10403E7D-1814-4D09-129C-4EB88969D4F9'),
(174, -1, 'App\\Controller\\Application\\StockMaintenance->getHome', '2024-06-20 12:39:27', 'Acesso a página de manutenção estoque.', '10403E7D-1814-4D09-129C-4EB88969D4F9'),
(175, -1, 'App\\Controller\\Application\\Product->getNewProduct', '2024-06-20 12:39:28', 'Acesso a página de produto.', '10403E7D-1814-4D09-129C-4EB88969D4F9'),
(176, -1, 'App\\Controller\\Application\\Product->getNewProduct', '2024-06-20 12:40:30', 'Acesso a página de produto.', '10403E7D-1814-4D09-129C-4EB88969D4F9'),
(177, -1, 'App\\Controller\\Application\\StockMaintenance->getHome', '2024-06-20 12:42:03', 'Acesso a página de manutenção estoque.', '10403E7D-1814-4D09-129C-4EB88969D4F9'),
(178, -1, 'App\\Controller\\Application\\Product->getNewProduct', '2024-06-20 12:42:06', 'Acesso a página de produto.', '10403E7D-1814-4D09-129C-4EB88969D4F9'),
(179, -1, 'App\\Controller\\Application\\StockMaintenance->getHome', '2024-06-20 12:43:51', 'Acesso a página de manutenção estoque.', '10403E7D-1814-4D09-129C-4EB88969D4F9'),
(180, -1, 'App\\Controller\\Application\\Product->getNewProduct', '2024-06-20 12:43:57', 'Acesso a página de produto.', '10403E7D-1814-4D09-129C-4EB88969D4F9'),
(181, -1, 'App\\Controller\\Application\\Product->getNewProduct', '2024-06-20 12:45:07', 'Acesso a página de produto.', '10403E7D-1814-4D09-129C-4EB88969D4F9'),
(182, -1, 'App\\Controller\\Application\\StockMaintenance->getHome', '2024-06-20 12:50:44', 'Acesso a página de manutenção estoque.', '10403E7D-1814-4D09-129C-4EB88969D4F9'),
(183, -1, 'App\\Controller\\Application\\Product->getNewProduct', '2024-06-20 12:50:47', 'Acesso a página de produto.', '10403E7D-1814-4D09-129C-4EB88969D4F9'),
(184, -1, 'App\\Controller\\Application\\Product->getEditProduct', '2024-06-20 12:51:41', 'Acesso a página de produto.', '10403E7D-1814-4D09-129C-4EB88969D4F9'),
(185, -1, 'App\\Controller\\Application\\Product->getNewProduct', '2024-06-21 15:14:48', 'Acesso a página de produto.', '10403E7D-1814-4D09-129C-4EB88969D4F9'),
(186, -1, 'App\\Controller\\Application\\StockMaintenance->getHome', '2024-06-21 15:14:52', 'Acesso a página de manutenção estoque.', '10403E7D-1814-4D09-129C-4EB88969D4F9'),
(187, -1, 'App\\Controller\\Application\\Login->setLogout', '2024-06-21 15:14:57', 'Realizado logout do usuário.', '10403E7D-1814-4D09-129C-4EB88969D4F9'),
(188, -1, 'App\\Controller\\Login\\Login->setLogin', '2024-06-21 15:14:59', 'Usuário logado com sucesso.', '6805C9B8-67EC-9185-8305-6BAF09F0B293'),
(189, -1, 'App\\Controller\\Application\\StockMaintenance->getHome', '2024-06-21 15:15:03', 'Acesso a página de manutenção estoque.', '6805C9B8-67EC-9185-8305-6BAF09F0B293'),
(190, -1, 'App\\Controller\\Login\\Login->setLogin', '2024-06-21 17:26:31', 'Usuário logado com sucesso.', '77CDAACD-1647-FCD2-BF06-D39496601D04'),
(191, -1, 'App\\Controller\\Application\\StockMaintenance->getHome', '2024-06-21 17:28:33', 'Acesso a página de manutenção estoque.', '77CDAACD-1647-FCD2-BF06-D39496601D04'),
(192, -1, 'App\\Controller\\Application\\StockMaintenance->getHome', '2024-06-21 17:55:16', 'Acesso a página de manutenção estoque.', '77CDAACD-1647-FCD2-BF06-D39496601D04'),
(193, -1, 'App\\Controller\\Application\\StockMaintenance->getHome', '2024-06-21 18:07:58', 'Acesso a página de manutenção estoque.', '77CDAACD-1647-FCD2-BF06-D39496601D04'),
(194, -1, 'App\\Controller\\Application\\Product->getNewProduct', '2024-06-21 18:08:05', 'Acesso a página de produto.', '77CDAACD-1647-FCD2-BF06-D39496601D04'),
(195, -1, 'App\\Controller\\Application\\Product->getNewProduct', '2024-06-21 18:09:45', 'Acesso a página de produto.', '77CDAACD-1647-FCD2-BF06-D39496601D04'),
(196, -1, 'App\\Controller\\Application\\Product->getNewProduct', '2024-06-21 18:12:53', 'Acesso a página de produto.', '77CDAACD-1647-FCD2-BF06-D39496601D04'),
(197, -1, 'App\\Controller\\Application\\Product->getNewProduct', '2024-06-21 18:14:02', 'Acesso a página de produto.', '77CDAACD-1647-FCD2-BF06-D39496601D04'),
(198, -1, 'App\\Controller\\Login\\Login->setLogin', '2024-06-21 20:31:20', 'Usuário logado com sucesso.', '3E23326F-5E9B-54CD-A002-343818F92BAC'),
(199, -1, 'App\\Controller\\Application\\AdvancedSettings->getConfig', '2024-06-21 20:31:25', 'Acesso a página de configurações avançadas.', '3E23326F-5E9B-54CD-A002-343818F92BAC'),
(200, -1, 'App\\Controller\\Application\\AdvancedSettings->getConfig', '2024-06-21 20:31:37', 'Acesso a página de configurações avançadas.', '3E23326F-5E9B-54CD-A002-343818F92BAC'),
(201, -1, 'App\\Controller\\Application\\StockMaintenance->getHome', '2024-06-21 20:32:23', 'Acesso a página de manutenção estoque.', '3E23326F-5E9B-54CD-A002-343818F92BAC'),
(202, -1, 'App\\Controller\\Application\\AdvancedSettings->getConfig', '2024-06-21 20:32:33', 'Acesso a página de configurações avançadas.', '3E23326F-5E9B-54CD-A002-343818F92BAC'),
(203, -1, 'App\\Controller\\Application\\Login->setLogout', '2024-06-21 20:33:20', 'Realizado logout do usuário.', '3E23326F-5E9B-54CD-A002-343818F92BAC'),
(204, -1, 'App\\Controller\\Login\\Login->setLogin', '2024-06-21 20:58:04', 'Usuário logado com sucesso.', 'AA4E0C2B-392E-A640-8B5B-FE904E847156'),
(205, -1, 'App\\Controller\\Application\\AdvancedSettings->getConfig', '2024-06-21 20:58:06', 'Acesso a página de configurações avançadas.', 'AA4E0C2B-392E-A640-8B5B-FE904E847156'),
(206, -1, 'App\\Controller\\Application\\AdvancedSettings->getConfig', '2024-06-21 20:58:34', 'Acesso a página de configurações avançadas.', 'AA4E0C2B-392E-A640-8B5B-FE904E847156'),
(207, -1, 'App\\Controller\\Application\\AdvancedSettings->getConfig', '2024-06-21 20:58:35', 'Acesso a página de configurações avançadas.', 'AA4E0C2B-392E-A640-8B5B-FE904E847156'),
(208, -1, 'App\\Controller\\Application\\AdvancedSettings->getConfig', '2024-06-21 20:58:36', 'Acesso a página de configurações avançadas.', 'AA4E0C2B-392E-A640-8B5B-FE904E847156'),
(209, -1, 'App\\Controller\\Application\\AdvancedSettings->getConfig', '2024-06-21 20:58:36', 'Acesso a página de configurações avançadas.', 'AA4E0C2B-392E-A640-8B5B-FE904E847156'),
(210, -1, 'App\\Controller\\Application\\AdvancedSettings->getConfig', '2024-06-21 20:58:36', 'Acesso a página de configurações avançadas.', 'AA4E0C2B-392E-A640-8B5B-FE904E847156'),
(211, -1, 'App\\Controller\\Application\\AdvancedSettings->getConfig', '2024-06-21 20:58:36', 'Acesso a página de configurações avançadas.', 'AA4E0C2B-392E-A640-8B5B-FE904E847156'),
(212, -1, 'App\\Controller\\Application\\AdvancedSettings->getConfig', '2024-06-21 20:58:36', 'Acesso a página de configurações avançadas.', 'AA4E0C2B-392E-A640-8B5B-FE904E847156'),
(213, -1, 'App\\Controller\\Application\\AdvancedSettings->getConfig', '2024-06-21 20:58:37', 'Acesso a página de configurações avançadas.', 'AA4E0C2B-392E-A640-8B5B-FE904E847156'),
(214, -1, 'App\\Controller\\Login\\Login->setLogin', '2024-06-21 20:59:00', 'Usuário logado com sucesso.', '0FB5C28B-F582-B314-5963-673B69C51503'),
(215, -1, 'App\\Controller\\Application\\AdvancedSettings->getConfig', '2024-06-21 20:59:02', 'Acesso a página de configurações avançadas.', '0FB5C28B-F582-B314-5963-673B69C51503'),
(216, -1, 'App\\Controller\\Application\\StockMaintenance->getHome', '2024-06-21 20:59:08', 'Acesso a página de manutenção estoque.', '0FB5C28B-F582-B314-5963-673B69C51503'),
(217, -1, 'App\\Controller\\Application\\Login->setLogout', '2024-06-21 20:59:12', 'Realizado logout do usuário.', '0FB5C28B-F582-B314-5963-673B69C51503'),
(218, -1, 'App\\Controller\\Login\\Login->setLogin', '2024-06-21 21:00:59', 'Usuário logado com sucesso.', '6C52CABC-512B-5A54-B35D-323E404BABF7'),
(219, -1, 'App\\Controller\\Application\\StockMaintenance->getHome', '2024-06-21 21:01:02', 'Acesso a página de manutenção estoque.', '6C52CABC-512B-5A54-B35D-323E404BABF7'),
(220, -1, 'App\\Controller\\Application\\AdvancedSettings->getConfig', '2024-06-21 21:01:04', 'Acesso a página de configurações avançadas.', '6C52CABC-512B-5A54-B35D-323E404BABF7'),
(221, -1, 'App\\Controller\\Application\\AdvancedSettings->getConfig', '2024-06-21 21:07:20', 'Acesso a página de configurações avançadas.', 'AA4E0C2B-392E-A640-8B5B-FE904E847156'),
(222, -1, 'App\\Controller\\Application\\Login->setLogout', '2024-06-21 21:07:25', 'Realizado logout do usuário.', 'AA4E0C2B-392E-A640-8B5B-FE904E847156'),
(223, -1, 'App\\Controller\\Login\\Login->setLogin', '2024-06-21 21:07:27', 'Usuário logado com sucesso.', 'AA547B7A-AF8E-B945-B453-290F06A86C9D'),
(224, -1, 'App\\Controller\\Application\\StockMaintenance->getHome', '2024-06-21 21:07:29', 'Acesso a página de manutenção estoque.', 'AA547B7A-AF8E-B945-B453-290F06A86C9D'),
(225, -1, 'App\\Controller\\Application\\AdvancedSettings->getConfig', '2024-06-21 21:07:35', 'Acesso a página de configurações avançadas.', 'AA547B7A-AF8E-B945-B453-290F06A86C9D'),
(226, -1, 'App\\Controller\\Application\\AdvancedSettings->getConfig', '2024-06-21 21:10:58', 'Acesso a página de configurações avançadas.', 'AA547B7A-AF8E-B945-B453-290F06A86C9D'),
(227, -1, 'App\\Controller\\Application\\AdvancedSettings->getConfig', '2024-06-21 21:11:00', 'Acesso a página de configurações avançadas.', 'AA547B7A-AF8E-B945-B453-290F06A86C9D'),
(228, -1, 'App\\Controller\\Application\\AdvancedSettings->getConfig', '2024-06-21 21:11:01', 'Acesso a página de configurações avançadas.', 'AA547B7A-AF8E-B945-B453-290F06A86C9D'),
(229, -1, 'App\\Controller\\Application\\AdvancedSettings->getConfig', '2024-06-21 21:11:02', 'Acesso a página de configurações avançadas.', 'AA547B7A-AF8E-B945-B453-290F06A86C9D'),
(230, -1, 'App\\Controller\\Application\\AdvancedSettings->getConfig', '2024-06-21 21:11:02', 'Acesso a página de configurações avançadas.', 'AA547B7A-AF8E-B945-B453-290F06A86C9D'),
(231, -1, 'App\\Controller\\Application\\AdvancedSettings->getConfig', '2024-06-21 21:12:11', 'Acesso a página de configurações avançadas.', 'AA547B7A-AF8E-B945-B453-290F06A86C9D'),
(232, -1, 'App\\Controller\\Application\\StockMaintenance->getHome', '2024-06-21 21:13:09', 'Acesso a página de manutenção estoque.', 'AA547B7A-AF8E-B945-B453-290F06A86C9D'),
(233, -1, 'App\\Controller\\Application\\AdvancedSettings->getConfig', '2024-06-21 21:13:11', 'Acesso a página de configurações avançadas.', 'AA547B7A-AF8E-B945-B453-290F06A86C9D'),
(234, -1, 'App\\Controller\\Application\\Login->setLogout', '2024-06-21 21:13:21', 'Realizado logout do usuário.', '6C52CABC-512B-5A54-B35D-323E404BABF7');

-- --------------------------------------------------------

--
-- Estrutura para tabela `tb_modules`
--

DROP TABLE IF EXISTS `tb_modules`;
CREATE TABLE IF NOT EXISTS `tb_modules` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `created_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `module` varchar(255) NOT NULL,
  `label` varchar(255) NOT NULL,
  `icon` varchar(255) NOT NULL,
  `path_module` varchar(255) NOT NULL,
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `type_id` int(11) NOT NULL,
  `allow_sysadmin` tinyint(1) NOT NULL DEFAULT 0,
  `current` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `type_id` (`type_id`)
) ENGINE=InnoDB AUTO_INCREMENT=129 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Despejando dados para a tabela `tb_modules`
--

INSERT INTO `tb_modules` (`id`, `created_at`, `module`, `label`, `icon`, `path_module`, `updated_at`, `type_id`, `allow_sysadmin`, `current`) VALUES
(1, '2023-03-27 11:58:15', 'home', 'Home', 'fas  fa-home', '/home', '2024-06-04 22:16:59', 1, 0, NULL),
(4, '2023-03-27 11:59:53', 'btn-cadastrar-user', 'Cadastrar Usuários', 'null', 'null', '2023-03-28 00:28:15', 2, 0, NULL),
(5, '2023-03-27 11:59:53', 'btn-edit-user', 'Editar Usuário', 'null', 'null', '2023-03-28 00:28:15', 2, 0, NULL),
(6, '2023-03-27 11:59:53', 'btn-delete-user', 'Excluir Usuário', 'null', 'null', '2023-03-28 00:28:15', 2, 0, NULL),
(7, '2023-03-27 11:59:53', 'page-manager-user', 'Página Gestão Usuários', 'null', 'null', '2023-03-28 00:28:15', 3, 0, NULL),
(10, '2023-03-28 23:33:27', 'page-advanced-settings', 'Página Configurações Avançadas', 'null', 'null', '2023-06-21 01:17:02', 3, 0, NULL),
(11, '2023-03-31 00:12:26', 'page-home', 'Home', 'null', 'null', '2023-06-23 21:11:58', 3, 0, NULL),
(12, '2023-05-09 22:31:57', 'btn-update-password', 'Alterar Senha', 'null', 'null', '2023-05-09 22:31:57', 2, 0, NULL),
(13, '2023-06-05 22:18:34', 'level', 'Nível', 'null', '#dadosNivel', '2023-06-05 22:19:27', 5, 0, NULL),
(14, '2023-06-05 22:20:18', 'type-module', 'Tipo Módulos', 'null', '#dadosTypeModules', '2023-06-05 23:19:56', 5, 1, NULL),
(15, '2023-06-05 22:21:14', 'modules', 'Módulos', 'null', '#dadosModules', '2023-06-05 23:20:14', 5, 1, NULL),
(16, '2023-06-05 22:22:46', 'access-modules', 'Associar Módulos', 'null', '#dadosAccessModules', '2023-06-06 00:23:13', 5, 0, NULL),
(17, '2023-06-05 22:27:25', 'btn-edit-level', 'Editar Nivel', 'null', 'null', '2023-06-05 22:27:25', 2, 0, NULL),
(18, '2023-06-05 22:28:07', 'btn-delete-level', 'Excluir Nivel', 'null', 'null', '2023-06-05 22:28:07', 2, 0, NULL),
(19, '2023-06-05 22:29:18', 'btn-create-level', 'Cadastrar Nível', 'null', 'null', '2023-06-05 22:29:18', 2, 0, NULL),
(20, '2023-06-05 22:30:34', 'page-manager-level', 'Página Gestão Niveis', 'null', 'null', '2023-06-05 22:31:01', 3, 0, NULL),
(21, '2023-06-05 22:31:52', 'btn-create-access-module', 'Associar Módulos', 'null', 'null', '2023-06-06 00:23:52', 2, 0, NULL),
(22, '2023-06-05 22:33:11', 'btn-edit-access-module', 'Editar Módulo Associado', 'null', 'null', '2023-06-06 00:23:50', 2, 0, NULL),
(23, '2023-06-05 22:33:53', 'btn-delete-access-module', 'Excluir Módulo Associado', 'null', 'null', '2023-06-06 00:23:36', 2, 0, NULL),
(24, '2023-06-05 22:35:00', 'page-manager-type-module', 'Página Gestão Tipo Módulo', 'null', 'null', '2023-06-05 23:20:42', 3, 1, NULL),
(25, '2023-06-05 23:33:02', 'page-manager-module', 'Página Gestão De Módulos', 'null', 'null', '2023-06-06 00:23:39', 3, 1, NULL),
(26, '2023-06-06 00:17:30', 'page-manager-access-modules', 'Página Associar Módulos', 'null', 'null', '2023-06-21 01:18:55', 3, 0, NULL),
(27, '2023-06-20 17:47:52', 'users', 'Gestão Usuários', 'null', '#dadosCreateUser', '2023-12-19 00:05:58', 5, 0, NULL),
(28, '2023-06-23 00:42:18', 'smtp-settings', 'Configuração Smtp', 'null', '#dadosSmtpSettings', '2023-12-19 00:05:58', 5, 0, NULL),
(29, '2023-06-23 01:05:59', 'btn-create-smtp', 'Cadastrar Smtp', 'null', 'null', '2023-12-19 00:05:58', 2, 0, NULL),
(30, '2023-06-23 01:13:56', 'btn-edit-smtp', 'Editar Configuração Smtp', 'null', 'null', '2023-12-19 00:05:58', 2, 0, NULL),
(31, '2023-06-23 01:14:23', 'btn-delete-smtp', 'Excluir Configuração Smtp', 'null', 'null', '2023-12-19 00:05:58', 2, 0, NULL),
(32, '2023-06-23 12:45:51', 'page-manager-settings-smtp', 'Página Configuração Smtp', 'null', 'null', '2023-12-19 00:05:58', 3, 0, NULL),
(33, '2023-06-23 17:12:23', 'email-alert-configuration', 'Emails Alertas', 'null', '#dadosEmailAlertConfiguration', '2023-06-23 17:15:00', 5, 0, NULL),
(34, '2023-06-26 20:10:30', 'page-manger-email-alarmes', 'Página Configuração E-mail Alarmes', 'null', 'null', '2023-12-19 00:05:58', 3, 0, NULL),
(35, '2023-06-26 20:56:27', 'btn-create-email-alerts', 'Cadastrar Email Alertas', 'null', 'null', '2023-06-26 20:56:49', 2, 0, NULL),
(36, '2023-06-26 20:59:33', 'btn-edit-email-alert', 'Editar E-mail Alertas', 'null', 'null', '2023-12-19 00:05:58', 2, 0, NULL),
(37, '2023-06-26 21:00:02', 'btn-delete-email-alert', 'Excluir Email Alertas', 'null', 'null', '2023-12-19 00:05:58', 2, 0, NULL),
(40, '2023-08-08 22:44:46', 'btn-created-apikey', 'Criar Apikeu', 'null', 'null', '2023-12-20 21:57:45', 2, 0, NULL),
(41, '2023-08-08 22:45:19', 'btn-edit-apikey', 'Editar Apiky', 'null', 'null', '2023-12-20 21:58:31', 2, 0, NULL),
(42, '2023-08-08 22:56:09', 'btn-delete-apikey', 'Deletar Apikey', 'null', 'null', '2023-12-20 21:58:56', 2, 0, NULL),
(95, '2023-12-20 21:16:26', 'page-api-key', 'Página ApiKey', 'null', 'null', '2023-12-20 21:16:26', 3, 0, NULL),
(96, '2023-12-20 21:20:58', 'apikey', 'Apikey', 'null', '#dadosApikey', '2023-12-20 21:25:49', 5, 0, NULL),
(97, '2023-12-21 19:03:21', 'page-update-password', 'Update Password', 'null', 'null', '2023-12-21 19:12:35', 3, 0, NULL),
(99, '2023-03-27 11:59:53', 'advanced-settings', 'Configurações Avançadas', 'fas fa-cogs', '/advanced-settings', '2024-01-15 19:13:24', 1, 0, NULL),
(100, '2023-12-21 21:52:16', 'page-monitoring', 'Página de Monitoramento', 'null', 'null', '2023-12-21 23:03:38', 3, 0, NULL),
(101, '2023-12-21 22:19:22', 'session-login', 'Sessões de usuário', 'null', '#dadosSessionLogin', '2023-12-21 22:19:22', 8, 0, NULL),
(102, '2023-12-21 22:20:28', 'log', 'Logs Aplicação', 'null', '#dadosLogsSistema', '2023-12-21 22:20:28', 8, 0, NULL),
(103, '2023-12-21 23:00:26', 'monitoring', 'Monitoramento', 'fas fa-gauge', '/monitoring', '2024-01-15 19:13:15', 1, 0, NULL),
(111, '2024-01-22 23:31:47', 'temp-users', 'Aprovar Usuários', 'null', '#tempUsers', '2024-01-22 23:31:47', 5, 0, NULL),
(112, '2024-01-22 23:55:31', 'btn-create-temp-users', 'Cadastrar Usuário Temp', 'null', 'null', '2024-01-22 23:55:31', 2, 0, NULL),
(113, '2024-01-22 23:57:37', 'btn-edit-temp-users', 'Editar Usuários Temp', 'null', 'null', '2024-01-22 23:57:37', 2, 0, NULL),
(114, '2024-01-22 23:59:21', 'btn-delete-temp-users', 'Deletar Usuário Temp', 'null', 'null', '2024-01-22 23:59:21', 2, 0, NULL),
(115, '2024-01-23 00:24:38', 'page-manager-temp-users', 'Página Usuários Temp', 'null', 'null', '2024-01-23 00:24:38', 3, 0, NULL),
(116, '2024-01-23 20:57:05', 'page-approved-temp-users', 'Página Aprovar Usuário Temp', 'null', 'null', '2024-01-23 20:57:05', 3, 0, NULL),
(117, '2024-01-23 20:57:39', 'page-reproved-temp-user', 'Página Reprovar Usuário Temp', 'null', 'null', '2024-01-23 20:57:39', 3, 0, NULL),
(118, '2024-05-28 23:47:32', 'organization', 'Configurações Organização', 'null', '#dadosOrganization', '2024-05-28 23:47:32', 5, 0, NULL),
(119, '2024-05-28 23:48:01', 'btn-create-organization', 'Cadastrar Organização', 'null', 'null', '2024-05-28 23:48:01', 2, 0, NULL),
(120, '2024-05-28 23:48:32', 'btn-edit-organization', 'Editar Organização', 'null', 'null', '2024-05-28 23:48:32', 2, 0, NULL),
(121, '2024-05-28 23:48:57', 'btn-delete-organization', 'Excluir Organização', 'null', 'null', '2024-05-28 23:48:57', 2, 0, NULL),
(122, '2024-05-28 23:49:25', 'page-organization', 'Página Organização', 'null', 'null', '2024-05-28 23:49:25', 3, 0, NULL),
(124, '2024-06-18 00:58:31', 'stock-maintenance', 'Gestão de Estoque', 'fa-solid fa-boxes-stacked', '/stock-maintenance', '2024-06-18 00:58:31', 1, 0, NULL),
(125, '2024-06-18 22:19:46', 'btn-create-product', 'Cadastrar Produto', 'null', 'null', '2024-06-18 22:19:46', 2, 0, NULL),
(126, '2024-06-18 22:23:32', 'btn-edit-product', 'Editar Produto', 'null', 'null', '2024-06-18 22:23:32', 2, 0, NULL),
(127, '2024-06-18 22:24:04', 'btn-delete-product', 'Excluir Produto', 'null', 'null', '2024-06-18 22:24:04', 2, 0, NULL),
(128, '2024-06-18 22:27:31', 'page-stock-maintenance', 'Página controle de estoque', 'null', 'null', '2024-06-18 22:27:31', 3, 0, NULL);

-- --------------------------------------------------------

--
-- Estrutura para tabela `tb_month`
--

DROP TABLE IF EXISTS `tb_month`;
CREATE TABLE IF NOT EXISTS `tb_month` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `created_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `number_month` int(11) NOT NULL,
  `short_description` varchar(255) NOT NULL,
  `long_description` varchar(255) NOT NULL,
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Despejando dados para a tabela `tb_month`
--

INSERT INTO `tb_month` (`id`, `created_at`, `number_month`, `short_description`, `long_description`, `updated_at`) VALUES
(1, '2023-03-08 21:01:58', 1, 'Jan', 'Janeiro', '2023-03-09 00:02:12'),
(2, '2023-03-08 21:01:58', 2, 'Fev', 'Fevereiro', '2023-03-09 00:06:42'),
(3, '2023-03-08 21:01:58', 3, 'Mar', 'Março', '2023-03-09 00:06:42'),
(4, '2023-03-08 21:01:58', 4, 'Abr', 'Abril', '2023-03-09 00:06:42'),
(5, '2023-03-08 21:01:58', 5, 'Mai', 'Maio', '2023-03-09 00:06:42'),
(6, '2023-03-08 21:01:58', 6, 'Jun', 'Junho', '2023-03-09 00:06:42'),
(7, '2023-03-08 21:01:58', 7, 'Jul', 'Julho', '2023-03-09 00:06:42'),
(8, '2023-03-08 21:01:58', 8, 'Ago', 'Agosto', '2023-03-09 00:06:42'),
(9, '2023-03-08 21:01:58', 9, 'Set', 'Setembro', '2023-03-09 00:06:42'),
(10, '2023-03-08 21:01:58', 10, 'Out', 'Outubro', '2023-03-09 00:06:42'),
(11, '2023-03-08 21:01:58', 11, 'Nov', 'Novembro', '2023-03-09 00:06:42'),
(12, '2023-03-08 21:01:58', 12, 'Dez', 'Dezembro', '2023-03-09 00:06:42');

-- --------------------------------------------------------

--
-- Estrutura para tabela `tb_organization`
--

DROP TABLE IF EXISTS `tb_organization`;
CREATE TABLE IF NOT EXISTS `tb_organization` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `short_name` varchar(255) NOT NULL,
  `full_name` varchar(255) NOT NULL,
  `site` varchar(255) NOT NULL,
  `description` varchar(255) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `development` varchar(255) NOT NULL DEFAULT 'Developed By SleyersX',
  `version` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `full_name` (`full_name`),
  UNIQUE KEY `short_name` (`short_name`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Despejando dados para a tabela `tb_organization`
--

INSERT INTO `tb_organization` (`id`, `short_name`, `full_name`, `site`, `description`, `created_at`, `updated_at`, `development`, `version`) VALUES
(1, 'Estoque Fácil', 'Estoque Fácil', 'http://localhost/stock-control', 'Seja bem-vindo ao painel de administração Controle de Estoque', '0000-00-00 00:00:00', '2024-06-17 23:42:56', 'Walter Moura', '0.01');

-- --------------------------------------------------------

--
-- Estrutura para tabela `tb_password_temp`
--

DROP TABLE IF EXISTS `tb_password_temp`;
CREATE TABLE IF NOT EXISTS `tb_password_temp` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `created_at` timestamp NULL DEFAULT current_timestamp(),
  `password` varchar(255) NOT NULL,
  `id_user` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `id_user_` (`id_user`)
) ENGINE=InnoDB AUTO_INCREMENT=66 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Despejando dados para a tabela `tb_password_temp`
--

INSERT INTO `tb_password_temp` (`id`, `created_at`, `password`, `id_user`) VALUES
(65, '2024-06-12 00:12:06', 'cytneHVPY25Id2UrZkRybndudGNPNVo3a2RRYkREVXdzdG80MVdvTGFSTT06OiaEDhSBr2jAf9vcCIOXv7Q=', 48);

-- --------------------------------------------------------

--
-- Estrutura para tabela `tb_password_temp_users`
--

DROP TABLE IF EXISTS `tb_password_temp_users`;
CREATE TABLE IF NOT EXISTS `tb_password_temp_users` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `created_at` timestamp NULL DEFAULT current_timestamp(),
  `password` varchar(255) NOT NULL,
  `id_user` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `id_user_` (`id_user`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estrutura para tabela `tb_sessions_login`
--

DROP TABLE IF EXISTS `tb_sessions_login`;
CREATE TABLE IF NOT EXISTS `tb_sessions_login` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `data_inicio` timestamp NULL DEFAULT NULL,
  `token` varchar(999) NOT NULL,
  `id_user` int(11) NOT NULL,
  `login_user` text NOT NULL,
  `name_user` text NOT NULL,
  `user_agent` text DEFAULT NULL,
  `remote_addr` text DEFAULT NULL,
  `remote_host` text DEFAULT NULL,
  `remote_port` text DEFAULT NULL,
  `tempo_inativo` int(11) NOT NULL DEFAULT 0,
  `data_fim` timestamp NULL DEFAULT NULL ON UPDATE current_timestamp(),
  `tempo_final` int(11) DEFAULT 0,
  PRIMARY KEY (`id`),
  UNIQUE KEY `token` (`token`) USING HASH,
  KEY `id_user` (`id_user`)
) ENGINE=InnoDB AUTO_INCREMENT=1411 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Despejando dados para a tabela `tb_sessions_login`
--

INSERT INTO `tb_sessions_login` (`id`, `data_inicio`, `token`, `id_user`, `login_user`, `name_user`, `user_agent`, `remote_addr`, `remote_host`, `remote_port`, `tempo_inativo`, `data_fim`, `tempo_final`) VALUES
(237, '2023-06-06 13:08:11', 'F942498F-B164-A54F-566D-99EF87294662', -1, 'sysadmin', 'Walter Moura', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/113.0.0.0 Safari/537.36', '191.36.128.215', NULL, '23508', 0, NULL, 0),
(238, '2023-06-06 13:08:21', '147791AC-A560-5B67-B0E9-194EC5465B30', -1, 'sysadmin', 'Walter Moura', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/113.0.0.0 Safari/537.36', '191.36.128.215', NULL, '23508', 0, '2023-06-06 13:58:37', 8),
(242, '2023-06-06 13:58:41', 'BAC70E4A-1495-4B34-D245-9355E00D98E0', -1, 'sysadmin', 'Walter Moura', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/113.0.0.0 Safari/537.36', '191.36.128.215', NULL, '22997', 12, '2023-06-06 15:24:49', 17),
(245, '2023-06-07 21:45:37', '2444E237-FAF0-DB7B-0CA8-B6A185F0AEB6', -1, 'sysadmin', 'Walter Moura', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/113.0.0.0 Safari/537.36', '191.36.128.215', NULL, '11829', 0, NULL, 0),
(246, '2023-06-07 21:45:48', 'F5AAAA7B-F64B-10DF-1E40-EAE5819244EF', -1, 'sysadmin', 'Walter Moura', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/113.0.0.0 Safari/537.36', '191.36.128.215', NULL, '11829', 12, '2023-06-07 22:47:25', 12),
(252, '2023-06-09 22:16:52', '5ED2DCCF-A8B7-BA44-4358-E6B8DBCA670B', -1, 'sysadmin', 'Walter Moura', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/113.0.0.0 Safari/537.36', '191.36.128.215', NULL, '12172', 12, '2023-06-09 23:18:21', 12),
(257, '2023-06-12 12:47:47', '62DEAF41-324E-1B1B-891C-0C1DAB2881CF', -1, 'sysadmin', 'Walter Moura', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/113.0.0.0 Safari/537.36', '191.36.128.197', NULL, '44106', 0, NULL, 0),
(258, '2023-06-12 12:47:52', 'DFD6B548-C432-FB66-2660-E5BBA9162BB0', -1, 'sysadmin', 'Walter Moura', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/113.0.0.0 Safari/537.36', '191.36.128.197', NULL, '44106', 12, '2023-06-12 14:29:21', 20),
(260, '2023-06-13 15:26:07', '77E6C156-2A0B-13A3-FCE8-6B7699143F0A', -1, 'sysadmin', 'Walter Moura', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/113.0.0.0 Safari/537.36', '191.36.128.222', NULL, '58452', 12, '2023-06-13 16:31:12', 12),
(269, '2023-06-16 22:01:56', '7F4423F3-5070-BA2F-59F0-F1C4692432C9', -1, 'sysadmin', 'Walter Moura', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/114.0.0.0 Safari/537.36', '191.36.128.215', NULL, '52423', 0, NULL, 0),
(270, '2023-06-16 22:02:00', '19968681-68DA-2E8E-44CE-A58922C687BB', -1, 'sysadmin', 'Walter Moura', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/114.0.0.0 Safari/537.36', '191.36.128.215', NULL, '52423', 12, '2023-06-16 23:07:43', 13),
(272, '2023-06-17 01:13:46', '09A28368-95F8-1D97-5A23-CDD79A5C6E43', -1, 'sysadmin', 'Walter Moura', 'Mozilla/5.0 (Linux; Android 10; K) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/114.0.0.0 Mobile Safari/537.36', '191.36.128.218', NULL, '30668', 1, '2023-06-17 01:21:31', 1),
(275, '2023-06-17 16:55:44', 'A94712FF-8250-1028-E972-8406F4355D52', -1, 'sysadmin', 'Walter Moura', 'Mozilla/5.0 (Linux; Android 10; K) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/114.0.0.0 Mobile Safari/537.36', '191.36.130.165', NULL, '63349', 0, '2023-06-17 19:42:34', 6),
(276, '2023-06-18 16:50:43', 'BE0145C0-40F1-EB21-5638-0B685BC61C62', -1, 'sysadmin', 'Walter Moura', 'Mozilla/5.0 (Linux; Android 10; K) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/114.0.0.0 Mobile Safari/537.36', '191.36.128.197', NULL, '61207', 3, '2023-06-18 17:52:57', 3),
(277, '2023-06-18 20:11:31', '729D3A66-D23A-F0B5-8CC8-D78282064B8C', -1, 'sysadmin', 'Walter Moura', 'Mozilla/5.0 (Linux; Android 10; K) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/114.0.0.0 Mobile Safari/537.36', '191.36.128.222', NULL, '35782', 0, '2023-06-18 20:14:06', 0),
(281, '2023-06-19 00:15:24', '93CB1F5F-2A97-0F7B-8310-4ECFEE5935EC', -1, 'sysadmin', 'Walter Moura', 'Mozilla/5.0 (Linux; Android 10; K) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/114.0.0.0 Mobile Safari/537.36', '191.36.128.215', NULL, '45707', 0, '2023-06-19 00:19:59', 0),
(282, '2023-06-19 18:06:25', '9F9E480D-606B-7795-9728-4CE316C21225', -1, 'sysadmin', 'Walter Moura', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/114.0.0.0 Safari/537.36', '191.36.128.215', NULL, '53244', 0, NULL, 0),
(283, '2023-06-19 18:06:38', '22B805DB-FBC2-E1CA-42A1-90D9DA045010', -1, 'sysadmin', 'Walter Moura', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/114.0.0.0 Safari/537.36', '191.36.128.215', NULL, '53244', 0, '2023-06-19 18:18:20', 1),
(284, '2023-06-21 19:33:43', '8FAF156A-C521-33BF-B296-E52562F5B3A5', -1, 'sysadmin', 'Walter Moura', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/114.0.0.0 Safari/537.36', '191.36.128.197', NULL, '59383', 0, NULL, 0),
(285, '2023-06-21 19:33:47', '518D21FC-EB60-3EA6-EBA2-720F1846BA7D', -1, 'sysadmin', 'Walter Moura', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/114.0.0.0 Safari/537.36', '191.36.128.197', NULL, '59383', 12, '2023-06-21 21:12:29', 19),
(289, '2023-06-23 22:14:54', '37529AEE-600A-0B13-79B4-86C424C5F757', -1, 'sysadmin', 'Walter Moura', 'Mozilla/5.0 (Linux; Android 10; K) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/114.0.0.0 Mobile Safari/537.36', '191.36.128.215', NULL, '31254', 3, '2023-06-24 23:20:19', 16),
(290, '2023-06-25 17:38:42', '1DDCA656-C03E-2DB5-9AAF-F9F619260408', -1, 'sysadmin', 'Walter Moura', 'Mozilla/5.0 (Linux; Android 10; K) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/114.0.0.0 Mobile Safari/537.36', '191.36.128.197', NULL, '33237', 0, '2023-06-25 17:39:15', 0),
(294, '2023-06-28 16:08:32', 'B850741D-D1B1-432D-EEF4-8EBFFD9832A7', -1, 'sysadmin', 'Walter Moura', 'Mozilla/5.0 (Linux; Android 10; K) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/114.0.0.0 Mobile Safari/537.36', '2804:214:82cb:1a38:501c:6d16:7820:d7af', NULL, '58898', 1, '2023-06-28 19:57:25', 1),
(298, '2023-06-30 14:23:37', 'FF846C1B-5EA3-D7E7-F8AE-436778B93151', -1, 'sysadmin', 'Walter Moura', 'okhttp/4.10.0', '34.95.180.154', NULL, '37240', 0, NULL, 0),
(299, '2023-06-30 14:23:55', '9A12D8B6-7133-93B1-3E7F-27EEFD403BC9', -1, 'sysadmin', 'Walter Moura', 'okhttp/4.10.0', '34.95.180.154', NULL, '57396', 0, NULL, 0),
(300, '2023-06-30 14:25:11', '125951A6-92BA-312D-EEF2-F9946C25D8BB', -1, 'sysadmin', 'Walter Moura', 'okhttp/4.10.0', '34.95.180.154', NULL, '54262', 0, NULL, 0),
(301, '2023-06-30 14:25:24', '4A1FFC4B-4EDB-D1D0-F7FD-66E8FC441C19', -1, 'sysadmin', 'Walter Moura', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/114.0.0.0 Safari/537.36', '191.36.128.222', NULL, '45183', 0, NULL, 0),
(302, '2023-06-30 14:25:29', '1ADED139-5828-56C3-EB28-FA85EA201006', -1, 'sysadmin', 'Walter Moura', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/114.0.0.0 Safari/537.36', '191.36.128.222', NULL, '45183', 12, '2023-06-30 15:54:04', 17),
(303, '2023-06-30 14:28:18', 'DF481B75-A9D6-46BE-A353-57BF7D23B7C8', -1, 'sysadmin', 'Walter Moura', 'okhttp/4.10.0', '34.95.180.154', NULL, '54140', 0, NULL, 0),
(304, '2023-06-30 14:48:48', 'B6069199-23A9-C426-A8C2-C8733FC6BC7F', -1, 'sysadmin', 'Walter Moura', 'okhttp/4.10.0', '34.95.180.154', NULL, '39094', 0, NULL, 0),
(307, '2023-07-01 12:19:54', 'F0E71DD9-C34A-C6CF-933B-A01589A7A075', -1, 'sysadmin', 'Walter Moura', 'Mozilla/5.0 (Linux; Android 10; K) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/114.0.0.0 Mobile Safari/537.36', '191.36.130.165', NULL, '36309', 2, '2023-07-01 20:29:57', 2),
(312, '2023-07-02 17:55:32', 'EB4A08B4-925E-C39F-C33B-803DD1FC06AD', -1, 'sysadmin', 'Walter Moura', 'Mozilla/5.0 (Linux; Android 10; K) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/114.0.0.0 Mobile Safari/537.36', '191.36.128.215', NULL, '11662', 2, '2023-07-02 18:15:58', 2),
(314, '2023-07-02 21:22:09', '28F29903-6F73-A713-9058-1F8166AAF6D8', -1, 'sysadmin', 'Walter Moura', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/114.0.0.0 Safari/537.36', '191.36.130.165', NULL, '4155', 12, '2023-07-02 22:42:00', 15),
(316, '2023-07-02 23:45:56', '997E1C5C-E420-94D6-5B7C-15897757642E', -1, 'sysadmin', 'Walter Moura', 'Mozilla/5.0 (Linux; Android 10; K) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/114.0.0.0 Mobile Safari/537.36', '2804:7f0:b341:3766:79bb:16d6:fa32:a0fd', NULL, '36412', 1, '2023-07-02 23:57:59', 1),
(317, '2023-07-04 13:37:06', '607144FB-9564-F1F8-0F60-B19FE0655366', -1, 'sysadmin', 'Walter Moura', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/114.0.0.0 Safari/537.36', '191.36.128.215', NULL, '4370', 12, '2023-07-04 14:38:01', 12),
(318, '2023-07-05 21:03:33', '45ADFE26-1755-D31A-3A52-3A4718967F43', -1, 'sysadmin', 'Walter Moura', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/114.0.0.0 Safari/537.36', '191.36.128.199', NULL, '30036', 12, '2023-07-05 22:04:22', 12),
(321, '2023-07-08 09:50:49', '20FA3BB1-6EA0-5887-04B3-4FA6690E0D00', -1, 'sysadmin', 'Walter Moura', 'Mozilla/5.0 (Linux; Android 10; K) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/114.0.0.0 Mobile Safari/537.36', '191.36.128.197', NULL, '5498', 2, '2023-07-08 10:19:24', 2),
(330, '2023-07-11 21:10:51', 'FD4FDE6F-9064-28BD-B024-F7860C76C03D', -1, 'sysadmin', 'Walter Moura', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/114.0.0.0 Safari/537.36', '191.36.128.214', NULL, '48595', 0, NULL, 0),
(331, '2023-07-11 21:10:54', '6F81AA25-F4E9-35A2-B10C-C42202816FF1', -1, 'sysadmin', 'Walter Moura', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/114.0.0.0 Safari/537.36', '191.36.128.214', NULL, '48595', 12, '2023-07-11 22:18:08', 12),
(335, '2023-07-12 22:59:47', '5B27E5D8-129F-7D6A-C282-D873F8A678CC', -1, 'sysadmin', 'Walter Moura', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/114.0.0.0 Safari/537.36', '191.36.130.136', NULL, '15225', 0, '2023-07-12 23:03:23', 0),
(338, '2023-07-14 17:39:49', '5796A1D9-8B88-63CC-4187-88017BDFCACF', -1, 'sysadmin', 'Walter Moura', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/114.0.0.0 Safari/537.36', '2804:7f0:b341:3766:d8fb:17a2:ea52:6b86', NULL, '38652', 12, '2023-07-14 18:52:23', 13),
(340, '2023-07-15 13:25:40', '7AAD80E2-2A1E-C2C2-6D8F-D767A4C881FB', -1, 'sysadmin', 'Walter Moura', 'Mozilla/5.0 (Linux; Android 10; K) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/114.0.0.0 Mobile Safari/537.36', '191.36.130.41', NULL, '41938', 0, '2023-07-15 13:25:58', 0),
(342, '2023-07-15 13:34:51', 'D6A70379-E88A-95AF-6E98-51BEC1A7B6AF', -1, 'sysadmin', 'Walter Moura', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/114.0.0.0 Safari/537.36', '191.36.130.41', NULL, '24360', 0, '2023-07-15 13:51:37', 2),
(345, '2023-07-15 13:52:49', '951098DC-3515-4397-24BB-6802B61059B7', -1, 'sysadmin', 'Walter Moura', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/114.0.0.0 Safari/537.36', '191.36.130.41', NULL, '11772', 11, '2023-07-15 14:48:25', 11),
(346, '2023-07-16 16:40:16', '6C4185D4-C799-AD39-7F17-9EEA864D2DCB', -1, 'sysadmin', 'Walter Moura', 'Mozilla/5.0 (Linux; Android 10; K) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/114.0.0.0 Mobile Safari/537.36', '2804:214:8120:85e8:4091:41d0:a7b:b2df', NULL, '14836', 1, '2023-07-16 17:33:48', 1),
(349, '2023-07-17 23:54:46', '9C1CF1C0-1220-F29E-0CB2-72F34B6D9EB5', -1, 'sysadmin', 'Walter Moura', 'Mozilla/5.0 (Linux; Android 10; K) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/114.0.0.0 Mobile Safari/537.36', '191.36.128.222', NULL, '57920', 1, '2023-07-18 13:06:23', 4),
(350, '2023-07-18 12:57:44', '5403C1D0-E64A-542C-EEBC-252393D79E86', -1, 'sysadmin', 'Walter Moura', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/114.0.0.0 Safari/537.36', '191.36.128.199', NULL, '22490', 12, '2023-07-18 13:58:08', 12),
(356, '2023-07-20 00:25:18', 'CE302B0B-5E6A-B8E2-0003-85BE7C972A76', -1, 'sysadmin', 'Walter Moura', 'Mozilla/5.0 (Linux; Android 10; K) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/114.0.0.0 Mobile Safari/537.36', '191.36.130.231', NULL, '15566', 1, '2023-07-20 00:52:30', 1),
(359, '2023-07-22 13:34:21', '23929966-219B-9748-C1C5-1ACEAE9E4C94', -1, 'sysadmin', 'Walter Moura', 'Mozilla/5.0 (Linux; Android 10; K) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/114.0.0.0 Mobile Safari/537.36', '191.36.130.228', NULL, '10948', 0, '2023-07-22 14:06:15', 2),
(360, '2023-07-22 14:07:41', '98CB1AA9-94D0-FC4D-E2DA-6C6F700ACF0E', -1, 'sysadmin', 'Walter Moura', 'Mozilla/5.0 (Linux; Android 10; K) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/114.0.0.0 Mobile Safari/537.36', '191.36.130.231', NULL, '49222', 1, '2023-07-22 14:17:42', 1),
(362, '2023-07-22 22:34:10', 'ADE289CF-7D3D-1E17-D42A-C8575365B1A2', -1, 'sysadmin', 'Walter Moura', 'Mozilla/5.0 (Linux; Android 10; K) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/114.0.0.0 Mobile Safari/537.36', '200.173.172.207', NULL, '36218', 1, '2023-07-22 22:49:16', 1),
(364, '2023-07-24 17:16:51', 'FE2371AD-AFFB-90AB-A2A1-1D9D69F6EAAE', -1, 'sysadmin', 'Walter Moura', 'Mozilla/5.0 (Linux; Android 10; K) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/114.0.0.0 Mobile Safari/537.36', '191.36.128.218', NULL, '47656', 1, '2023-07-24 21:40:05', 1),
(382, '2023-08-02 13:25:04', 'AFDC63EB-9DCC-3927-7426-EB5199EBBEDE', -1, 'sysadmin', 'Walter Moura', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/115.0.0.0 Safari/537.36', '2804:38a:a147:3b3d:e8b7:a465:a16:2326', NULL, '36260', 12, '2023-08-02 14:42:03', 14),
(385, '2023-08-02 22:43:17', '99DC1BCD-3251-921F-DA5B-9077BEF06901', -1, 'sysadmin', 'Walter Moura', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/115.0.0.0 Safari/537.36', '191.36.130.201', NULL, '60136', 0, NULL, 0),
(386, '2023-08-02 22:43:23', '3BF90C6D-FF81-A649-C3E2-787E658E120A', -1, 'sysadmin', 'Walter Moura', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/115.0.0.0 Safari/537.36', '191.36.130.201', NULL, '28572', 8, '2023-08-03 00:15:06', 14),
(406, '2023-08-16 09:28:59', 'F935E351-1D54-507D-8843-93B6D27EC7B7', -1, 'sysadmin', 'Walter Moura', 'Mozilla/5.0 (Linux; Android 10; K) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/115.0.0.0 Mobile Safari/537.36', '179.97.162.54', NULL, '49528', 4, '2023-08-16 21:26:03', 8),
(409, '2023-08-17 22:06:23', '8736891C-1CD9-6FC0-5DC5-F15B70877315', -1, 'sysadmin', 'Walter Moura', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/115.0.0.0 Safari/537.36', '2804:7f0:b341:a72a:2d75:d020:c921:b9e7', NULL, '59256', 0, NULL, 0),
(410, '2023-08-17 22:06:29', 'A8FD81A5-4EAD-9EDB-E51C-DA182529FEDC', -1, 'sysadmin', 'Walter Moura', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/115.0.0.0 Safari/537.36', '2804:7f0:b341:a72a:2d75:d020:c921:b9e7', NULL, '47404', 12, '2023-08-17 23:06:39', 12),
(411, '2023-08-18 19:26:22', '473BD0D5-599D-5DE0-EE3F-75E8FC17A9FC', -1, 'sysadmin', 'Walter Moura', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/115.0.0.0 Safari/537.36', '2804:7f0:b341:a72a:d8c7:f8a2:bd3f:1218', NULL, '44374', 12, '2023-08-18 20:27:19', 12),
(417, '2023-08-20 20:31:46', '435092C1-BF1F-C515-73BF-21E7C5FD852E', -1, 'sysadmin', 'Walter Moura', 'Mozilla/5.0 (Linux; Android 10; K) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/116.0.0.0 Mobile Safari/537.36', '191.36.128.222', NULL, '17466', 0, '2023-08-20 20:32:47', 0),
(420, '2023-08-21 12:09:31', '63A031C0-182B-40DB-3000-5E665D12B0D7', -1, 'sysadmin', 'Walter Moura', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/115.0.0.0 Safari/537.36', '2804:7f0:b341:a72a:11be:9f02:8080:defe', NULL, '33890', 12, '2023-08-21 13:15:38', 12),
(421, '2023-08-21 16:15:07', '56A1A57B-FA4E-2D1A-1CAC-5BBDB200F546', -1, 'sysadmin', 'Walter Moura', 'Mozilla/5.0 (Linux; Android 10; K) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/116.0.0.0 Mobile Safari/537.36', '191.36.128.181', NULL, '35594', 0, '2023-08-21 16:15:16', 0),
(423, '2023-08-23 15:24:54', '51FBF638-AE9E-C72C-0B3A-E17F044E7389', -1, 'sysadmin', 'Walter Moura', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/115.0.0.0 Safari/537.36', '191.36.128.195', NULL, '59684', 12, '2023-08-23 16:31:37', 13),
(425, '2023-08-23 23:19:25', '364CE2A7-FC14-1128-0BC6-5A5B7C3587A7', -1, 'sysadmin', 'Walter Moura', 'Mozilla/5.0 (Linux; Android 10; K) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/116.0.0.0 Mobile Safari/537.36', '191.36.130.193', NULL, '28252', 1, '2023-08-23 23:24:29', 1),
(427, '2023-08-24 09:42:33', '324DFD0C-A5AD-E8A7-B209-9C77BC1CAC15', -1, 'sysadmin', 'Walter Moura', 'Mozilla/5.0 (Linux; Android 10; K) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/116.0.0.0 Mobile Safari/537.36', '191.36.128.183', NULL, '51786', 0, '2023-08-24 09:43:20', 0),
(428, '2023-08-24 16:43:25', 'E8136498-0748-6177-E3A5-0BE2FC1E895D', -1, 'sysadmin', 'Walter Moura', 'Mozilla/5.0 (Linux; Android 10; K) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/116.0.0.0 Mobile Safari/537.36', '2804:7f0:b341:a72a:5c6a:cf10:d2de:2fef', NULL, '60220', 1, '2023-08-25 01:10:26', 1),
(430, '2023-08-26 12:32:55', '5584D0F4-8957-4589-5721-13E9721BCB58', -1, 'sysadmin', 'Walter Moura', 'Mozilla/5.0 (Linux; Android 10; K) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/116.0.0.0 Mobile Safari/537.36', '191.36.128.181', NULL, '23652', 1, '2023-08-26 13:32:50', 3),
(432, '2023-08-27 20:11:32', 'AFD9A507-8145-1409-A587-34B561B265D1', -1, 'sysadmin', 'Walter Moura', 'Mozilla/5.0 (Linux; Android 10; K) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/116.0.0.0 Mobile Safari/537.36', '191.36.128.199', NULL, '15888', 1, '2023-08-27 23:18:59', 4),
(435, '2023-08-30 20:54:23', 'BE604175-2E95-AE12-2A8D-49C3F6E9BB38', -1, 'sysadmin', 'Walter Moura', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/116.0.0.0 Safari/537.36', '2804:7f0:b341:316b:f9ca:c900:2ac5:921', NULL, '47192', 0, NULL, 0),
(436, '2023-08-30 20:54:28', 'E8943E2D-BF6E-8925-5C4B-2FD5EE51A56D', -1, 'sysadmin', 'Walter Moura', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/116.0.0.0 Safari/537.36', '2804:7f0:b341:316b:f9ca:c900:2ac5:921', NULL, '31306', 12, '2023-08-31 12:15:13', 12),
(438, '2023-09-01 21:04:52', '61E4075B-72CC-E5F2-6CDF-FD7D3F5935A5', -1, 'sysadmin', 'Walter Moura', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/116.0.0.0 Safari/537.36', '2804:7f0:b341:316b:75ae:8234:ad4c:cd6a', NULL, '65486', 12, '2023-09-01 22:48:14', 19),
(440, '2023-09-02 12:12:31', '7DDBEC6A-9F62-81F3-B27D-4FF92E43F7A8', -1, 'sysadmin', 'Walter Moura', 'Mozilla/5.0 (Linux; Android 10; K) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/116.0.0.0 Mobile Safari/537.36', '2804:214:8100:72fc:5d87:2ac1:510e:155f', NULL, '58290', 0, '2023-09-02 12:12:59', 0),
(441, '2023-09-03 21:00:36', 'D0DB80A8-8BFD-053D-D0E6-F1FD71F68A12', -1, 'sysadmin', 'Walter Moura', 'Mozilla/5.0 (Linux; Android 10; K) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/116.0.0.0 Mobile Safari/537.36', '189.40.91.55', NULL, '65166', 1, '2023-09-03 23:59:11', 5),
(442, '2023-09-07 00:24:44', '3548EBD6-4360-D460-D5EF-06507D5C1C6A', -1, 'sysadmin', 'Walter Moura', 'Mozilla/5.0 (Linux; Android 10; K) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/116.0.0.0 Mobile Safari/537.36', '2804:214:82d3:72b6:2c27:ee56:8006:19de', NULL, '35102', 0, '2023-09-07 00:25:47', 0),
(443, '2023-09-08 10:52:07', '513AC7DA-3024-106C-CEBA-4C33649C57D0', -1, 'sysadmin', 'Walter Moura', 'Mozilla/5.0 (Linux; Android 10; K) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/116.0.0.0 Mobile Safari/537.36', '189.40.88.158', NULL, '52178', 0, '2023-09-08 10:52:42', 0),
(444, '2023-09-08 11:38:03', '9B0AF42C-7668-798C-C529-D942C1A8A2F2', -1, 'sysadmin', 'Walter Moura', 'Mozilla/5.0 (Linux; Android 10; K) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/116.0.0.0 Mobile Safari/537.36', '189.40.88.158', NULL, '17444', 1, '2023-09-08 12:21:09', 4),
(446, '2023-09-08 23:19:25', '82E4B368-9A57-AE36-4297-41FC0FA392BA', -1, 'sysadmin', 'Walter Moura', 'Mozilla/5.0 (Linux; Android 10; K) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/116.0.0.0 Mobile Safari/537.36', '191.36.128.181', NULL, '42088', 0, '2023-09-08 23:19:43', 0),
(453, '2023-09-16 16:23:59', '298D6A1B-B2E3-9D9A-6E81-B7B66B4AC165', -1, 'sysadmin', 'Walter Moura', 'Mozilla/5.0 (Linux; Android 10; K) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/117.0.0.0 Mobile Safari/537.36', '191.36.128.199', NULL, '55516', 0, '2023-09-16 16:24:16', 0),
(454, '2023-09-16 16:29:23', '4848A87E-52CD-4527-BF7A-C92391B46164', -1, 'sysadmin', 'Walter Moura', 'Mozilla/5.0 (Linux; Android 10; K) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/117.0.0.0 Mobile Safari/537.36', '191.36.128.199', NULL, '54430', 0, '2023-09-16 19:09:54', 0),
(456, '2023-09-16 20:08:25', 'EC2CDEBF-DC11-6F98-91E3-38D4F374CE67', -1, 'sysadmin', 'Walter Moura', 'Mozilla/5.0 (Linux; Android 10; K) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/117.0.0.0 Mobile Safari/537.36', '191.36.130.165', NULL, '46568', 0, '2023-09-16 20:13:20', 0),
(458, '2023-09-17 22:08:55', 'B3275B6F-3856-5FD1-B895-C79D623B776D', -1, 'sysadmin', 'Walter Moura', 'Mozilla/5.0 (Linux; Android 10; K) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/117.0.0.0 Mobile Safari/537.36', '2804:214:8111:3d2:c00e:af4d:fab3:359f', NULL, '19216', 0, '2023-09-17 22:14:33', 0),
(459, '2023-09-18 00:55:26', '2E7952B3-BAC8-E740-0C2E-56B7483E8825', -1, 'sysadmin', 'Walter Moura', 'Mozilla/5.0 (Linux; Android 10; K) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/117.0.0.0 Mobile Safari/537.36', '2804:214:8111:3d2:c00e:af4d:fab3:359f', NULL, '43086', 0, '2023-09-18 16:27:33', 2),
(463, '2023-09-21 10:13:10', '5A70EA9B-1E7D-0154-4A13-9CBCB19F6ECF', -1, 'sysadmin', 'Walter Moura', 'Mozilla/5.0 (Linux; Android 10; K) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/117.0.0.0 Mobile Safari/537.36', '191.36.128.199', NULL, '30350', 0, '2023-09-21 10:13:42', 0),
(464, '2023-09-22 22:40:06', 'E46F3CBA-E04A-9E35-D81B-3234EF46D5D0', -1, 'sysadmin', 'Walter Moura', 'Mozilla/5.0 (Linux; Android 10; K) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/117.0.0.0 Mobile Safari/537.36', '191.36.128.161', NULL, '35990', 0, '2023-09-22 22:53:35', 0),
(466, '2023-09-24 22:37:55', 'AACF5A48-B5FE-8C4B-3EF8-44C14840220B', -1, 'sysadmin', 'Walter Moura', 'Mozilla/5.0 (Linux; Android 10; K) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/117.0.0.0 Mobile Safari/537.36', '2804:214:860a:488a:388c:c162:829b:38bb', NULL, '38882', 1, '2023-09-24 23:14:20', 4),
(473, '2023-10-02 21:22:04', '6E4711DE-41A0-57FB-9924-8D35F376EB32', -1, 'sysadmin', 'Walter Moura', 'Mozilla/5.0 (Linux; Android 10; K) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/117.0.0.0 Mobile Safari/537.36', '2804:214:8618:cbf:bc72:6b32:5428:72c8', NULL, '62396', 1, '2023-10-02 22:17:22', 1),
(475, '2023-10-04 21:09:16', 'CCEE21BA-1BA5-841E-CD00-7CE03CA6665D', -1, 'sysadmin', 'Walter Moura', 'Mozilla/5.0 (Linux; Android 10; K) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/117.0.0.0 Mobile Safari/537.36', '191.36.128.183', NULL, '54806', 0, '2023-10-04 21:10:45', 0),
(479, '2023-10-05 14:30:43', '7614E747-E2B9-4999-B2F5-7BAD3BEBE190', -1, 'sysadmin', 'Walter Moura', 'Mozilla/5.0 (Linux; Android 10; K) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/117.0.0.0 Mobile Safari/537.36', '191.36.128.183', NULL, '31290', 0, '2023-10-05 14:30:46', 0),
(480, '2023-10-06 01:42:00', '1496C38C-604C-47BB-9E0D-4EA9FA56260B', -1, 'sysadmin', 'Walter Moura', 'Mozilla/5.0 (Linux; Android 10; K) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/117.0.0.0 Mobile Safari/537.36', '191.36.128.161', NULL, '17548', 1, '2023-10-06 01:48:52', 1),
(482, '2023-10-08 15:44:56', '0B005FE7-C191-6DFE-0158-755F7D6F2840', -1, 'sysadmin', 'Walter Moura', 'Mozilla/5.0 (Linux; Android 10; K) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/117.0.0.0 Mobile Safari/537.36', '2804:214:8101:37ad:bc90:8829:53b1:ef0a', NULL, '57192', 3, '2023-10-08 16:11:57', 3),
(487, '2023-10-11 20:47:07', '1E7801E3-7ECE-07AF-1759-81C1C3C017E4', -1, 'sysadmin', 'Walter Moura', 'Mozilla/5.0 (Linux; Android 10; K) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/117.0.0.0 Mobile Safari/537.36', '191.36.128.161', NULL, '21956', 0, '2023-10-11 20:47:43', 0),
(491, '2023-10-19 00:10:26', '71932853-C7CA-5F7B-2343-5B9A72566161', -1, 'sysadmin', 'Walter Moura', 'Mozilla/5.0 (Linux; Android 10; K) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/117.0.0.0 Mobile Safari/537.36', '2804:214:8612:c5ad:8cb7:80b:976:8ee5', NULL, '39140', 1, '2023-10-19 00:19:35', 1),
(493, '2023-10-31 12:31:46', '20F1F4FE-801D-4FDF-4CB2-F55F3FB0965A', -1, 'sysadmin', 'Walter Moura', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/118.0.0.0 Safari/537.36', '191.36.128.163', NULL, '52060', 0, NULL, 0),
(494, '2023-10-31 12:31:52', 'BE97D3B4-AC3C-C925-1570-A36D65F338B3', -1, 'sysadmin', 'Walter Moura', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/118.0.0.0 Safari/537.36', '191.36.128.163', NULL, '39220', 12, '2023-10-31 15:51:08', 35),
(495, '2023-11-01 14:50:59', '72BC9541-AB5B-0592-F50E-EE7CB7EDB1E6', -1, 'sysadmin', 'Walter Moura', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/118.0.0.0 Safari/537.36', '191.36.128.195', NULL, '28452', 12, '2023-11-01 15:51:49', 12),
(496, '2023-11-01 16:30:10', 'DEB82821-D0EE-0EB4-6CB3-D7174B4B3A89', -1, 'sysadmin', 'Walter Moura', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/118.0.0.0 Safari/537.36', '191.36.128.195', NULL, '60084', 12, '2023-11-01 17:31:49', 12),
(498, '2023-11-05 10:30:04', 'FAF44A1A-DF1F-FA14-025C-42A2788CC1D1', -1, 'sysadmin', 'Walter Moura', 'Mozilla/5.0 (Linux; Android 10; K) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/118.0.0.0 Mobile Safari/537.36', '2804:214:8612:f4b5:58ad:9951:a2f5:b629', NULL, '29712', 1, '2023-11-05 10:56:12', 1),
(499, '2023-11-05 17:18:10', 'E4E075BB-4745-2D0B-8CF7-6DEB2202CEDB', -1, 'sysadmin', 'Walter Moura', 'Mozilla/5.0 (Linux; Android 10; K) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/119.0.0.0 Mobile Safari/537.36', '191.36.128.201', NULL, '14354', 1, '2023-11-05 17:29:45', 2),
(507, '2023-11-10 23:14:36', '185B0CD0-75A6-BD4D-74B1-7CCA96AE5B97', -1, 'sysadmin', 'Walter Moura', 'Mozilla/5.0 (Linux; Android 10; K) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/119.0.0.0 Mobile Safari/537.36', '191.36.128.201', NULL, '43450', 0, '2023-11-10 23:14:53', 0),
(509, '2023-11-11 15:28:57', '1DC9E44C-B08C-37D1-54FA-36C736BE0A54', -1, 'sysadmin', 'Walter Moura', 'Mozilla/5.0 (Linux; Android 10; K) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/119.0.0.0 Mobile Safari/537.36', '191.36.131.96', NULL, '56752', 0, '2023-11-11 15:29:19', 0),
(513, '2023-11-15 13:00:14', '501F87BF-BE31-0CBB-A7D4-05C16B1271E9', -1, 'sysadmin', 'Walter Moura', 'Mozilla/5.0 (Linux; Android 10; K) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/119.0.0.0 Mobile Safari/537.36', '2a02:4780:13:c0de::3', NULL, '21522', 1, '2023-11-15 15:50:44', 3),
(516, '2023-11-18 10:09:30', '235F7797-6A10-7C5A-0DF5-AEA5612E151C', -1, 'sysadmin', 'Walter Moura', 'Mozilla/5.0 (Linux; Android 10; K) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/119.0.0.0 Mobile Safari/537.36', '2804:7f0:b341:64d4:5d33:8fc6:822f:c7f3', NULL, '27162', 0, '2023-11-18 10:11:08', 0),
(519, '2023-11-18 19:01:29', '75845E9E-575E-FAF0-8155-20B625D49430', -1, 'sysadmin', 'Walter Moura', 'Mozilla/5.0 (Linux; Android 10; K) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/119.0.0.0 Mobile Safari/537.36', '191.36.131.5', NULL, '15046', 0, '2023-11-18 19:05:30', 0),
(520, '2023-11-20 22:59:47', 'C16F38C9-6802-500B-8625-B57FF2BCC806', -1, 'sysadmin', 'Walter Moura', 'Mozilla/5.0 (Linux; Android 10; K) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/119.0.0.0 Mobile Safari/537.36', '2804:214:8615:8da0:70cc:38f:5423:b1fa', NULL, '43178', 1, '2023-11-20 23:04:52', 1),
(521, '2023-11-21 18:51:23', '9E226239-23A3-FC45-6619-4E0BA6FC64F4', -1, 'sysadmin', 'Walter Moura', 'Mozilla/5.0 (Linux; Android 10; K) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/119.0.0.0 Mobile Safari/537.36', '191.36.128.198', NULL, '56042', 0, '2023-11-21 18:52:31', 0),
(522, '2023-11-22 11:57:50', 'D5E18D07-D63C-9592-E204-14729ADB3AE6', -1, 'sysadmin', 'Walter Moura', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/119.0.0.0 Safari/537.36 Edg/119.0.0.0', '191.36.128.198', NULL, '22936', 0, NULL, 0),
(523, '2023-11-22 11:58:01', 'D3AAAF7C-CFFC-1835-904A-1B7099653147', -1, 'sysadmin', 'Walter Moura', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/119.0.0.0 Safari/537.36 Edg/119.0.0.0', '191.36.128.198', NULL, '18206', 12, '2023-11-22 13:14:04', 15),
(524, '2023-11-26 18:35:48', '12C3D8AB-119C-BF64-7A38-70A84B6B2592', -1, 'sysadmin', 'Walter Moura', 'Mozilla/5.0 (Linux; Android 10; K) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/119.0.0.0 Mobile Safari/537.36', '191.36.128.198', NULL, '44686', 2, '2023-11-27 01:29:05', 2),
(526, '2023-11-28 15:22:40', '062E20F8-DDD2-8663-648F-16ADBEB4B65D', -1, 'sysadmin', 'Walter Moura', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/119.0.0.0 Safari/537.36', '191.36.128.200', NULL, '48424', 0, NULL, 0),
(527, '2023-11-28 15:22:46', 'D4E04D53-1B87-F98F-414B-66AAB26511F2', -1, 'sysadmin', 'Walter Moura', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/119.0.0.0 Safari/537.36', '191.36.128.200', NULL, '22764', 12, '2023-11-28 16:39:19', 12),
(528, '2023-11-28 17:52:30', '38114D86-8052-5963-5299-9B9B34A06801', -1, 'sysadmin', 'Walter Moura', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/119.0.0.0 Safari/537.36', '191.36.128.200', NULL, '58290', 0, '2023-11-28 17:57:58', 0),
(529, '2023-11-28 17:58:01', 'B01CFDA1-1303-265A-0006-7046BA4CE2E3', -1, 'sysadmin', 'Walter Moura', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/119.0.0.0 Safari/537.36', '191.36.128.200', NULL, '36954', 12, '2023-11-28 18:58:18', 12),
(530, '2023-11-28 19:26:06', '6D62E310-56EB-E087-A616-34DEB15D546E', -1, 'sysadmin', 'Walter Moura', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/119.0.0.0 Safari/537.36', '191.36.128.198', NULL, '20900', 12, '2023-11-28 21:07:18', 15),
(535, '2023-11-28 20:12:21', 'ED823CF7-231B-3703-DB06-36A7D4D9B39A', -1, 'sysadmin', 'Walter Moura', 'Mozilla/5.0 (Linux; Android 10; K) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/119.0.0.0 Mobile Safari/537.36 EdgA/119.0.0.0', '2804:7f0:b341:64d4:5d33:8fc6:822f:c7f3', NULL, '41448', 1, '2023-11-28 20:25:19', 1),
(536, '2023-11-29 00:52:18', '67ADE3C9-ADEE-34C7-F8EE-15BCE2E9950A', -1, 'sysadmin', 'Walter Moura', 'Mozilla/5.0 (Linux; Android 10; K) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/119.0.0.0 Mobile Safari/537.36', '191.36.128.161', NULL, '23046', 1, '2023-11-29 01:16:26', 4),
(537, '2023-11-29 09:37:42', '0D80A0EE-E044-3228-6E59-D89FD1F3B16B', -1, 'sysadmin', 'Walter Moura', 'Mozilla/5.0 (Linux; Android 10; K) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/119.0.0.0 Mobile Safari/537.36', '179.228.88.68', NULL, '53088', 0, '2023-11-29 09:38:19', 0),
(538, '2023-11-29 13:24:16', '103F4FE1-6841-207D-3463-43134639CC25', -1, 'sysadmin', 'Walter Moura', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/119.0.0.0 Safari/537.36', '191.36.128.161', NULL, '30624', 12, '2023-11-29 14:36:41', 13),
(539, '2023-11-30 18:13:46', 'BC664104-968A-50F8-B50C-2555E854E96F', -1, 'sysadmin', 'Walter Moura', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/119.0.0.0 Safari/537.36', '191.36.128.172', NULL, '60670', 12, '2023-11-30 19:13:51', 12),
(540, '2023-12-01 22:25:02', 'D8144E9F-CEEA-F198-659E-C0E9BBD6EF70', -1, 'sysadmin', 'Walter Moura', 'Mozilla/5.0 (Linux; Android 10; K) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/119.0.0.0 Mobile Safari/537.36', '2804:7f0:b341:64d4:5d33:8fc6:822f:c7f3', NULL, '11088', 0, '2023-12-01 22:44:44', 1),
(542, '2023-12-02 12:16:17', '2213E706-31B6-3950-7C44-DEB1E44ED747', -1, 'sysadmin', 'Walter Moura', 'Mozilla/5.0 (Linux; Android 10; K) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/119.0.0.0 Mobile Safari/537.36', '191.36.131.17', NULL, '64312', 0, '2023-12-02 12:16:51', 0),
(543, '2023-12-03 19:45:09', '5837B5E9-BC9A-EC3C-2437-4CE7CD0ABDC3', -1, 'sysadmin', 'Walter Moura', 'Mozilla/5.0 (Linux; Android 10; K) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/119.0.0.0 Mobile Safari/537.36', '2804:214:82bb:3461:fc94:1411:5310:d578', NULL, '21448', 0, '2023-12-03 19:47:48', 0),
(545, '2023-12-06 16:25:06', 'A5B12735-9940-3C31-672B-6E73728ED82E', -1, 'sysadmin', 'Walter Moura', 'Mozilla/5.0 (Linux; Android 10; K) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/119.0.0.0 Mobile Safari/537.36', '191.36.128.193', NULL, '47024', 0, '2023-12-06 16:25:19', 0),
(546, '2023-12-06 20:51:33', '8E9FC69D-0E20-455D-6620-7547976776A7', -1, 'sysadmin', 'Walter Moura', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/119.0.0.0 Safari/537.36 Edg/119.0.0.0', '191.36.128.200', NULL, '62912', 0, NULL, 0),
(547, '2023-12-06 20:51:35', '14BF2559-07A9-3D2A-0122-64AE62651C0D', -1, 'sysadmin', 'Walter Moura', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/119.0.0.0 Safari/537.36 Edg/119.0.0.0', '191.36.128.200', NULL, '62958', 12, '2023-12-07 13:06:02', 24),
(549, '2023-12-07 13:37:09', 'CC914C8B-285E-6BBF-EE91-41B677C26F7A', -1, 'sysadmin', 'Walter Moura', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/119.0.0.0 Safari/537.36 Edg/119.0.0.0', '191.36.128.201', NULL, '48874', 12, '2023-12-07 14:55:42', 14),
(550, '2023-12-08 15:08:01', 'CEFC6E21-7D97-911D-5519-39694CA461D5', -1, 'sysadmin', 'Walter Moura', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/119.0.0.0 Safari/537.36 Edg/119.0.0.0', '191.36.128.171', NULL, '53676', 0, '2023-12-08 16:54:16', 18),
(554, '2023-12-09 18:07:17', '9854A6F1-7901-4571-B6D9-A1CF19D0A015', -1, 'sysadmin', 'Walter Moura', 'Mozilla/5.0 (Linux; Android 10; K) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/120.0.0.0 Mobile Safari/537.36', '2804:214:8111:bf04:6188:6e5b:61fe:15bf', NULL, '49556', 0, '2023-12-09 18:38:42', 1),
(557, '2023-12-10 21:51:59', 'FBD25801-29BD-0BD1-CA33-8254D2987894', -1, 'sysadmin', 'Walter Moura', 'Mozilla/5.0 (Linux; Android 10; K) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/120.0.0.0 Mobile Safari/537.36', '191.36.128.171', NULL, '39694', 0, '2023-12-10 21:52:04', 0),
(558, '2023-12-11 23:02:01', '993793DB-C61F-0A83-2625-63D7DE113AB1', -1, 'sysadmin', 'Walter Moura', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/120.0.0.0 Safari/537.36', '191.36.128.161', NULL, '44860', 0, NULL, 0),
(559, '2023-12-11 23:02:17', 'D3C517D9-EEF1-F6D0-E26B-45ACD12B0C7A', -1, 'sysadmin', 'Walter Moura', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/120.0.0.0 Safari/537.36', '191.36.128.161', NULL, '29978', 12, '2023-12-12 12:43:49', 12),
(560, '2023-12-11 23:34:47', '1DDF5AB5-CD68-BEFA-4223-2A613535F234', -1, 'sysadmin', 'Walter Moura', 'Mozilla/5.0 (Linux; Android 10; K) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/120.0.0.0 Mobile Safari/537.36', '191.36.128.161', NULL, '29056', 0, '2023-12-11 23:36:15', 0),
(561, '2023-12-12 11:40:47', '59187530-0296-5DF7-8D59-384B597B0663', -1, 'sysadmin', 'Walter Moura', 'Mozilla/5.0 (Linux; Android 10; K) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/120.0.0.0 Mobile Safari/537.36', '191.36.128.171', NULL, '11148', 0, '2023-12-12 11:43:00', 0),
(562, '2023-12-12 23:12:51', '0688A4D0-5EB2-7D01-E3E6-3BC5FE8BD6B4', -1, 'sysadmin', 'Walter Moura', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/120.0.0.0 Safari/537.36', '191.36.128.170', NULL, '41510', 0, NULL, 0),
(563, '2023-12-12 23:13:00', '3FFF53C1-6CC3-7D43-1F69-B8D6972AE0E7', -1, 'sysadmin', 'Walter Moura', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/120.0.0.0 Safari/537.36', '191.36.128.170', NULL, '58396', 0, '2023-12-13 00:27:55', 14),
(565, '2023-12-13 00:16:03', 'A233511F-093D-5709-7C83-8D2C1A99FAA9', -1, 'sysadmin', 'Walter Moura', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/120.0.0.0 Safari/537.36', '191.36.128.170', NULL, '20906', 0, NULL, 0),
(566, '2023-12-13 00:16:09', 'E5A4F844-8553-3F01-99C8-AAC41368787B', -1, 'sysadmin', 'Walter Moura', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/120.0.0.0 Safari/537.36', '191.36.128.170', NULL, '20092', 0, '2023-12-13 00:19:48', 0),
(568, '2023-12-13 14:51:42', '4C3BE10D-6AFA-815A-2A75-2E8B426F3C4E', -1, 'sysadmin', 'Walter Moura', 'Mozilla/5.0 (Linux; Android 10; K) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/120.0.0.0 Mobile Safari/537.36', '2804:214:82ae:49fc:1b1:b8e6:60d6:40ec', NULL, '17326', 0, '2023-12-13 14:52:24', 0),
(569, '2023-12-13 15:31:29', 'A83C5619-CE94-D874-787B-3DD3B3C2273A', -1, 'sysadmin', 'Walter Moura', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/120.0.0.0 Safari/537.36 Edg/120.0.0.0', '191.36.128.161', NULL, '47026', 0, NULL, 0),
(570, '2023-12-13 15:31:31', '3685BD41-ACF1-81E1-CC4A-BBD50E5BBDB1', -1, 'sysadmin', 'Walter Moura', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/120.0.0.0 Safari/537.36 Edg/120.0.0.0', '191.36.128.161', NULL, '47054', 12, '2023-12-13 16:32:09', 12),
(571, '2023-12-13 20:33:19', '3B39A54D-A6B7-F751-D75E-9026EDC806CF', -1, 'sysadmin', 'Walter Moura', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/120.0.0.0 Safari/537.36 Edg/120.0.0.0', '191.36.128.171', NULL, '60824', 12, '2023-12-14 19:05:35', 22),
(576, '2023-12-14 17:16:36', '0C0D09C5-D44E-BA7E-B035-7D36E1DAC862', -1, 'sysadmin', 'Walter Moura', 'Mozilla/5.0 (Linux; Android 10; K) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/120.0.0.0 Mobile Safari/537.36', '2804:7f0:b341:64d4:bc5e:24d8:a004:aff2', NULL, '43168', 1, '2023-12-15 08:59:48', 1),
(577, '2023-12-14 20:43:06', '9B93D281-A808-C52C-D3F0-EC91A96D7B86', -1, 'sysadmin', 'Walter Moura', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/120.0.0.0 Safari/537.36 Edg/120.0.0.0', '191.36.128.171', NULL, '10570', 12, '2023-12-15 13:46:28', 24),
(578, '2023-12-17 02:17:49', '4E5E3172-C652-2A8D-4E97-849C475549C3', -1, 'sysadmin', 'Walter Moura', 'Mozilla/5.0 (Linux; Android 10; K) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/120.0.0.0 Mobile Safari/537.36', '2804:214:8133:a46d:315d:c7ed:a83:a6a1', NULL, '20568', 0, '2023-12-17 21:32:44', 2),
(580, '2023-12-18 11:03:18', '523E8C4E-8DEB-F753-BD1B-1E2CD90AE32E', -1, 'sysadmin', 'Walter Moura', 'Mozilla/5.0 (Linux; Android 10; K) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/120.0.0.0 Mobile Safari/537.36', '2804:214:82a1:70f3:412c:9ce1:d739:ece9', NULL, '43088', 1, '2023-12-18 11:33:22', 1),
(581, '2023-12-18 17:49:34', '48386FFF-7FBB-9D8E-CB9D-11B08EBA801F', -1, 'sysadmin', 'Walter Moura', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/120.0.0.0 Safari/537.36 Edg/120.0.0.0', '191.36.128.161', NULL, '56662', 0, NULL, 0),
(582, '2023-12-18 17:49:36', '3720160D-6131-D29F-E229-579B87EA9C7A', -1, 'sysadmin', 'Walter Moura', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/120.0.0.0 Safari/537.36 Edg/120.0.0.0', '191.36.128.161', NULL, '56696', 0, '2023-12-18 18:22:14', 2),
(583, '2023-12-18 18:19:46', '5D085A88-53F2-D291-8F5D-E39B1A477876', -1, 'sysadmin', 'Walter Moura', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/120.0.0.0 Safari/537.36', '191.36.128.170', NULL, '12870', 0, NULL, 0),
(584, '2023-12-18 18:19:53', 'CD5433B5-B797-5F48-F043-C7FDF378BFC6', -1, 'sysadmin', 'Walter Moura', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/120.0.0.0 Safari/537.36', '191.36.128.170', NULL, '63730', 0, '2023-12-18 18:20:05', 0),
(585, '2023-12-18 18:21:12', '50C781FF-81A1-42B5-894B-2BF36808E8CE', -1, 'sysadmin', 'Walter Moura', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/120.0.0.0 Safari/537.36', '191.36.128.170', NULL, '33643', 12, '2023-12-18 19:22:03', 12),
(586, '2023-12-18 18:35:07', '29BACF55-E1E0-3B37-113C-4327B2656093', -1, 'sysadmin', 'Walter Moura', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/120.0.0.0 Safari/537.36 Edg/120.0.0.0', '191.36.128.170', NULL, '26170', 0, '2023-12-18 18:37:46', 0),
(587, '2023-12-18 19:29:14', '49740742-7410-31D1-0D3F-338DCAD44799', -1, 'sysadmin', 'Walter Moura', 'Mozilla/5.0 (Linux; Android 10; K) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/120.0.0.0 Mobile Safari/537.36', '2804:7f0:b341:64d4:bc5e:24d8:a004:aff2', NULL, '50550', 0, NULL, 0),
(588, '2023-12-18 19:29:27', 'D7C75EB3-C554-B870-5B5C-5482A1E0E945', -1, 'sysadmin', 'Walter Moura', 'Mozilla/5.0 (Linux; Android 10; K) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/120.0.0.0 Mobile Safari/537.36', '2804:7f0:b341:64d4:bc5e:24d8:a004:aff2', NULL, '50550', 1, '2023-12-18 20:31:56', 1),
(589, '2023-12-18 19:49:07', 'F93533B2-696F-E587-D55F-A42AFB4664CE', -1, 'sysadmin', 'Walter Moura', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/120.0.0.0 Safari/537.36 Edg/120.0.0.0', '191.36.128.161', NULL, '11817', 12, '2023-12-18 20:50:03', 12),
(590, '2023-12-18 21:52:20', 'EDCE8E1D-463A-9C0A-480A-0586D76FF134', -1, 'sysadmin', 'Walter Moura', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/120.0.0.0 Safari/537.36', '191.36.128.168', NULL, '32451', 0, '2023-12-18 22:48:34', 7),
(594, '2023-12-18 23:31:43', '5A7917E7-A001-9406-2CFB-EDF4279E95E6', -1, 'sysadmin', 'Walter Moura', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/120.0.0.0 Safari/537.36 Edg/120.0.0.0', '192.168.65.1', NULL, '60453', 0, NULL, 0),
(595, '2023-12-18 23:35:18', '130FFF2C-9877-A1BA-B6D7-30AC0D41ACAC', -1, 'sysadmin', 'Walter Moura', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/120.0.0.0 Safari/537.36 Edg/120.0.0.0', '192.168.65.1', NULL, '60929', 12, '2023-12-19 12:48:17', 14),
(596, '2023-12-19 14:30:51', 'ACE91400-402F-4BB2-34F9-6A9C63DC2A93', -1, 'sysadmin', 'Walter Moura', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/120.0.0.0 Safari/537.36 Edg/120.0.0.0', '192.168.65.1', NULL, '62110', 0, '2023-12-19 14:46:09', 2),
(597, '2023-12-19 14:35:34', 'D5632BD6-B4B6-B4E2-24A1-3592AC608645', -1, 'sysadmin', 'Walter Moura', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/120.0.0.0 Safari/537.36 Edg/120.0.0.0', '192.168.65.1', NULL, '62138', 0, NULL, 0),
(598, '2023-12-19 14:46:27', 'BCF69297-5643-975B-9D71-6AAA32022D9D', -1, 'sysadmin', 'Walter Moura', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/120.0.0.0 Safari/537.36 Edg/120.0.0.0', '192.168.65.1', NULL, '62194', 0, '2023-12-19 15:03:58', 3),
(599, '2023-12-19 15:04:42', '6BD6ECEC-A6B9-EEF5-4631-013E8D118BC5', -1, 'sysadmin', 'Walter Moura', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/120.0.0.0 Safari/537.36', '192.168.65.1', NULL, '62346', 12, '2023-12-19 16:32:17', 16),
(600, '2023-12-19 18:11:49', 'CB4A5C1A-889A-337A-8766-40367868DD72', -1, 'sysadmin', 'Walter Moura', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/120.0.0.0 Safari/537.36', '192.168.65.1', NULL, '62823', 12, '2023-12-20 16:06:26', 41),
(603, '2023-12-20 18:16:17', 'CF7027F6-3A4B-977B-57E1-70F50F49D57D', -1, 'sysadmin', 'Walter Moura', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/120.0.0.0 Safari/537.36', '192.168.65.1', NULL, '17789', 0, '2023-12-21 12:37:30', 30),
(605, '2023-12-21 12:37:34', '31267F8B-6766-D183-5CC4-95B4AA8B87A9', -1, 'sysadmin', 'Walter Moura', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/120.0.0.0 Safari/537.36', '192.168.65.1', NULL, '20035', 0, '2023-12-21 12:49:13', 1),
(606, '2023-12-21 12:49:37', 'CC1DFA17-1F47-6F84-4567-C2259EEAEB7C', -1, 'sysadmin', 'Walter Moura', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/120.0.0.0 Safari/537.36', '192.168.65.1', NULL, '20119', 3, '2023-12-21 14:59:32', 22),
(607, '2023-12-21 15:45:14', '0D85ED02-0DEC-893A-71AB-68C60AC359A0', -1, 'sysadmin', 'Walter Moura', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/120.0.0.0 Safari/537.36', '192.168.65.1', NULL, '20742', 12, '2023-12-21 17:06:57', 14),
(611, '2023-12-21 18:47:42', 'DE962BE5-3A2E-7472-18DD-7867CEE47A78', -1, 'sysadmin', 'Walter Moura', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/120.0.0.0 Safari/537.36', '191.36.128.170', NULL, '52580', 0, NULL, 0),
(612, '2023-12-21 18:49:25', 'ED0BE707-517A-2066-161F-114EB75E2C8A', -1, 'sysadmin', 'Walter Moura', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/120.0.0.0 Safari/537.36', '191.36.128.168', NULL, '46380', 0, NULL, 0),
(613, '2023-12-21 18:49:29', '76866359-B5BB-68D0-6B65-6C3BC72B27D3', -1, 'sysadmin', 'Walter Moura', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/120.0.0.0 Safari/537.36', '191.36.128.168', NULL, '46380', 12, '2023-12-21 22:07:57', 28),
(616, '2023-12-21 20:58:45', 'E092EB5E-70C8-F935-3F5A-ECB1F14493B4', -1, 'sysadmin', 'Sys Admin', 'Mozilla/5.0 (Linux; Android 10; K) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/120.0.0.0 Mobile Safari/537.36', '2804:7f0:b341:64d4:2400:7ad0:7926:41dd', NULL, '61506', 0, NULL, 0),
(617, '2023-12-21 20:58:48', 'EF7AC1BA-22D8-233D-1E17-273B73E2DC8E', -1, 'sysadmin', 'Sys Admin', 'Mozilla/5.0 (Linux; Android 10; K) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/120.0.0.0 Mobile Safari/537.36', '2804:7f0:b341:64d4:2400:7ad0:7926:41dd', NULL, '61538', 0, '2023-12-21 20:58:51', 0),
(619, '2023-12-21 22:57:29', '990F201B-C013-6579-6B1E-3A4A4496E446', -1, 'sysadmin', 'Sys Admin', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/120.0.0.0 Safari/537.36', '191.36.128.172', NULL, '52394', 12, '2023-12-22 00:12:58', 12),
(623, '2023-12-22 00:31:46', '4B5CA4B2-C070-15B0-B246-BEA04EE0CD2C', -1, 'sysadmin', 'Sys Admin', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/120.0.0.0 Safari/537.36', '191.36.128.164', NULL, '57584', 0, '2023-12-22 00:32:25', 0),
(624, '2023-12-22 00:34:08', '9B979816-5B1C-838D-8281-62DB0FFE857A', -1, 'sysadmin', 'Sys Admin', 'Mozilla/5.0 (Linux; Android 10; K) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/120.0.0.0 Mobile Safari/537.36', '2804:7f0:b341:64d4:2400:7ad0:7926:41dd', NULL, '20824', 0, NULL, 0),
(625, '2023-12-22 00:34:12', 'CE326DC9-0C2A-76A3-81CF-A60657D73B67', -1, 'sysadmin', 'Sys Admin', 'Mozilla/5.0 (Linux; Android 10; K) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/120.0.0.0 Mobile Safari/537.36', '2804:7f0:b341:64d4:2400:7ad0:7926:41dd', NULL, '42180', 0, '2023-12-22 00:49:39', 0),
(626, '2023-12-22 01:00:59', 'DC61020E-1E3A-C87D-01F7-09B16FD98C28', -1, 'sysadmin', 'Sys Admin', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/120.0.0.0 Safari/537.36 Edg/120.0.0.0', '191.36.128.170', NULL, '34976', 0, '2023-12-22 12:10:12', 4),
(627, '2023-12-22 12:18:10', '398FA455-CDDB-45E0-2C87-E4972131296B', -1, 'sysadmin', 'Sys Admin', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/120.0.0.0 Safari/537.36 Edg/120.0.0.0', '191.36.128.164', NULL, '15266', 12, '2023-12-22 13:18:47', 12),
(628, '2023-12-22 13:46:57', '95096277-21EF-E67F-3030-5FBDB9070387', -1, 'sysadmin', 'Sys Admin', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/120.0.0.0 Safari/537.36 Edg/120.0.0.0', '191.36.128.168', NULL, '34122', 0, '2023-12-22 14:31:39', 7);
INSERT INTO `tb_sessions_login` (`id`, `data_inicio`, `token`, `id_user`, `login_user`, `name_user`, `user_agent`, `remote_addr`, `remote_host`, `remote_port`, `tempo_inativo`, `data_fim`, `tempo_final`) VALUES
(630, '2023-12-22 15:19:25', 'DD1390F8-7C66-78B4-585B-C688484B31DD', -1, 'sysadmin', 'Sys Admin', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/120.0.0.0 Safari/537.36', '191.36.128.172', NULL, '40592', 0, NULL, 0),
(631, '2023-12-22 15:19:28', '5B9601DB-113E-FEFD-1095-E03441DD9B89', -1, 'sysadmin', 'Sys Admin', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/120.0.0.0 Safari/537.36', '191.36.128.168', NULL, '33928', 0, '2023-12-22 15:21:34', 0),
(645, '2023-12-26 22:19:14', '3B70B1CC-7759-9A33-2C8A-FC0CEBBDED39', -1, 'sysadmin', 'Sys Admin', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/120.0.0.0 Safari/537.36', '191.36.128.164', NULL, '46480', 12, '2023-12-27 12:05:48', 12),
(653, '2023-12-29 23:45:25', '58C0943A-109E-32CE-3BF1-D6DEC8BC786F', -1, 'sysadmin', 'Sys Admin', 'Mozilla/5.0 (Linux; Android 10; K) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/120.0.0.0 Mobile Safari/537.36', '191.36.128.161', NULL, '18564', 1, '2023-12-30 13:36:54', 1),
(668, '2024-01-02 19:54:43', '2B2F5047-F6ED-1587-0098-2645044CC1F2', -1, 'sysadmin', 'Sys Admin', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/120.0.0.0 Safari/537.36', '191.36.128.168', NULL, '49256', 0, '2024-01-02 20:09:19', 0),
(670, '2024-01-02 20:12:22', 'A37FBA8D-7B0E-F83C-7497-A11B96E16C62', -1, 'sysadmin', 'Sys Admin', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/120.0.0.0 Safari/537.36', '191.36.128.168', NULL, '13902', 12, '2024-01-02 21:58:12', 19),
(671, '2024-01-03 13:19:43', '8DFB79D7-8FA9-4A57-73FF-5009DAFE8A7E', -1, 'sysadmin', 'Sys Admin', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/120.0.0.0 Safari/537.36', '191.36.128.194', NULL, '23506', 12, '2024-01-03 16:05:22', 28),
(674, '2024-01-03 13:57:06', 'FED7D254-064D-E79C-739C-EE7955D1638C', -1, 'sysadmin', 'Sys Admin', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/120.0.0.0 Safari/537.36 Edg/120.0.0.0', '191.36.128.194', NULL, '65290', 0, '2024-01-03 13:57:12', 0),
(675, '2024-01-03 17:07:27', '2C8C9787-9EBD-00C1-FB6A-EC787E36B918', -1, 'sysadmin', 'Sys Admin', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/120.0.0.0 Safari/537.36', '191.36.128.195', NULL, '29954', 9, '2024-01-04 00:20:11', 44),
(676, '2024-01-03 17:19:22', '59501388-C212-3FFD-A488-E0FE4332B81E', -1, 'sysadmin', 'Sys Admin', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/120.0.0.0 Safari/537.36 Edg/120.0.0.0', '191.36.128.194', NULL, '36442', 0, '2024-01-03 17:19:39', 0),
(677, '2024-01-03 21:32:51', '6A8F241C-7448-5142-D238-2B4FBCF40F2E', -1, 'sysadmin', 'Sys Admin', 'Mozilla/5.0 (Linux; Android 10; K) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/120.0.0.0 Mobile Safari/537.36', '191.36.128.200', NULL, '44782', 0, NULL, 0),
(678, '2024-01-03 21:32:54', '6522337D-D821-85E5-3FBE-D9B85C4DF2E0', -1, 'sysadmin', 'Sys Admin', 'Mozilla/5.0 (Linux; Android 10; K) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/120.0.0.0 Mobile Safari/537.36', '191.36.128.195', NULL, '28180', 0, '2024-01-03 21:35:39', 0),
(686, '2024-01-05 22:56:28', '19A31EB4-0665-013B-508B-B3032F2583ED', -1, 'sysadmin', 'Sys Admin', 'Mozilla/5.0 (Linux; Android 10; K) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/120.0.0.0 Mobile Safari/537.36', '191.36.128.200', NULL, '56178', 1, '2024-01-05 23:27:25', 1),
(687, '2024-01-06 00:18:05', '4654CE1B-CBB4-82A9-829F-0C59BBCCD4F8', -1, 'sysadmin', 'Sys Admin', 'Mozilla/5.0 (Linux; Android 10; K) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/120.0.0.0 Mobile Safari/537.36', '2804:7f0:b341:e5ee:6993:f127:2187:2fd6', NULL, '39970', 0, '2024-01-06 17:28:37', 2),
(697, '2024-01-06 21:42:36', '00F03A9E-1EA8-C28C-8F3C-94B3BE8CEF3A', -1, 'sysadmin', 'Sys Admin', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/120.0.0.0 Safari/537.36', '191.36.128.195', NULL, '65424', 0, NULL, 0),
(698, '2024-01-06 21:42:49', 'FF3ABE48-C5F2-93CC-8A0D-A873447B42A7', -1, 'sysadmin', 'Sys Admin', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/120.0.0.0 Safari/537.36', '191.36.128.195', NULL, '16196', 0, '2024-01-06 21:42:56', 0),
(699, '2024-01-06 21:42:59', 'CE0E437D-6185-8C5D-ACE1-6E52D116C51D', -1, 'sysadmin', 'Sys Admin', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/120.0.0.0 Safari/537.36', '191.36.128.195', NULL, '64254', 0, '2024-01-06 21:43:02', 0),
(700, '2024-01-06 21:43:14', '55BA475E-359D-207C-048E-18F363E166C2', -1, 'sysadmin', 'Sys Admin', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/120.0.0.0 Safari/537.36', '191.36.128.195', NULL, '57212', 12, '2024-01-06 23:03:19', 14),
(704, '2024-01-07 22:44:25', '39CF0360-B9D0-2E35-15B7-7A7F1BFE0FB9', -1, 'sysadmin', 'Sys Admin', 'Mozilla/5.0 (Linux; Android 10; K) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/120.0.0.0 Mobile Safari/537.36', '191.36.131.31', NULL, '48880', 1, '2024-01-07 23:29:17', 2),
(715, '2024-01-12 00:52:07', '2F95344C-C7A1-AE4F-77A2-7B421D4976C4', -1, 'sysadmin', 'Sys Admin', 'Mozilla/5.0 (Linux; Android 10; K) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/120.0.0.0 Mobile Safari/537.36', '201.13.170.25', NULL, '15464', 1, '2024-01-12 01:31:28', 1),
(721, '2024-01-12 20:19:08', '9540DA9F-3B5C-9AA6-B140-0B0E1E834CB6', -1, 'sysadmin', 'Sys Admin', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/120.0.0.0 Safari/537.36', '191.36.128.195', NULL, '54396', 12, '2024-01-12 22:03:10', 17),
(722, '2024-01-12 22:41:05', '6C44DB67-5B27-7A88-B09A-D2748859FF0F', -1, 'sysadmin', 'Sys Admin', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/120.0.0.0 Safari/537.36', '191.36.128.198', NULL, '26900', 0, '2024-01-12 22:44:45', 0),
(725, '2024-01-12 22:52:34', 'E0ED8FC4-3337-E05E-004B-094A5B1F98C1', -1, 'sysadmin', 'Sys Admin', 'Mozilla/5.0 (Linux; Android 10; K) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/120.0.0.0 Mobile Safari/537.36 EdgA/120.0.0.0', '191.36.128.195', NULL, '10772', 0, NULL, 0),
(731, '2024-01-13 04:29:25', '93B3F46F-942D-F621-0A5C-10CB93AB4C97', -1, 'sysadmin', 'Sys Admin', 'Mozilla/5.0 (Linux; Android 10; K) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/120.0.0.0 Mobile Safari/537.36', '2804:214:8116:2600:c124:4d87:2a65:b1b8', NULL, '49214', 0, NULL, 0),
(732, '2024-01-13 04:29:28', '07332481-D73E-B102-DCD0-349BC5A84359', -1, 'sysadmin', 'Sys Admin', 'Mozilla/5.0 (Linux; Android 10; K) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/120.0.0.0 Mobile Safari/537.36', '2804:214:8116:2600:c124:4d87:2a65:b1b8', NULL, '52868', 0, '2024-01-13 04:41:32', 1),
(733, '2024-01-13 06:55:25', 'A685C6D3-5D42-7790-B430-FD4575ED6A24', -1, 'sysadmin', 'Sys Admin', 'Mozilla/5.0 (Linux; Android 10; K) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/120.0.0.0 Mobile Safari/537.36', '2804:214:8116:2600:c124:4d87:2a65:b1b8', NULL, '33084', 0, '2024-01-13 06:57:48', 0),
(745, '2024-01-14 00:09:26', '120F23E2-2280-74F4-D8DE-4C75F80AB26A', -1, 'sysadmin', 'Sys Admin', 'Mozilla/5.0 (Linux; Android 10; K) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/120.0.0.0 Mobile Safari/537.36', '2804:214:8116:2600:d566:a0c3:8c82:9576', NULL, '22798', 0, NULL, 0),
(746, '2024-01-14 00:09:28', '85D797C6-BE32-C0D3-9139-2F9C9324F358', -1, 'sysadmin', 'Sys Admin', 'Mozilla/5.0 (Linux; Android 10; K) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/120.0.0.0 Mobile Safari/537.36', '2804:214:8116:2600:d566:a0c3:8c82:9576', NULL, '30840', 0, '2024-01-14 00:21:17', 0),
(748, '2024-01-14 14:33:40', '6CFAB3A5-3EA2-04AF-64FE-8727DF3F057E', -1, 'sysadmin', 'Sys Admin', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/120.0.0.0 Safari/537.36 Edg/120.0.0.0', '191.36.128.170', NULL, '37814', 0, NULL, 0),
(749, '2024-01-14 14:33:46', 'E06CEFCB-CFB6-EED0-C74E-512605A301B3', -1, 'sysadmin', 'Sys Admin', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/120.0.0.0 Safari/537.36 Edg/120.0.0.0', '191.36.128.170', NULL, '39526', 5, '2024-01-14 14:59:21', 5),
(756, '2024-01-15 16:00:23', 'B155E288-A620-9B35-F9F2-6F8D7E1CCC16', -1, 'sysadmin', 'Sys Admin', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/120.0.0.0 Safari/537.36', '191.36.128.161', NULL, '25120', 0, '2024-01-15 16:43:11', 3),
(758, '2024-01-15 18:35:47', 'B3B1D13C-7009-8D7E-62E7-583A6384CAC4', -1, 'sysadmin', 'Sys Admin', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/120.0.0.0 Safari/537.36', '191.36.128.170', NULL, '35470', 0, '2024-01-15 19:01:30', 0),
(760, '2024-01-15 19:17:22', '1CDA6B40-000A-CE4A-C1E5-30282C22740B', -1, 'sysadmin', 'Sys Admin', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/120.0.0.0 Safari/537.36', '191.36.128.170', NULL, '20702', 12, '2024-01-15 20:26:43', 13),
(765, '2024-01-16 12:11:04', '2BFCE2D4-C465-7D1A-DC6E-5706CFA9D5A5', -1, 'sysadmin', 'Sys Admin', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/120.0.0.0 Safari/537.36 Edg/120.0.0.0', '191.36.128.164', NULL, '61350', 0, '2024-01-16 12:12:53', 0),
(767, '2024-01-16 12:42:13', '1CE32919-EF25-4CB3-57F6-CADA82025E3B', -1, 'sysadmin', 'Sys Admin', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/120.0.0.0 Safari/537.36 Edg/120.0.0.0', '191.36.128.168', NULL, '26574', 0, '2024-01-16 12:42:49', 0),
(788, '2024-01-20 02:10:43', 'B687B540-78D6-C9C4-02C3-49D0F238EDBF', -1, 'sysadmin', 'Sys Admin', 'Mozilla/5.0 (Linux; Android 10; K) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/120.0.0.0 Mobile Safari/537.36', '191.36.128.194', NULL, '38162', 1, '2024-01-20 21:25:00', 3),
(796, '2024-01-21 16:07:24', '9CFC5EAD-66EC-1C9E-319E-65DFB4046601', -1, 'sysadmin', 'Sys Admin', 'Mozilla/5.0 (Linux; Android 10; K) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/120.0.0.0 Mobile Safari/537.36', '191.36.128.194', NULL, '18218', 0, '2024-01-21 16:07:54', 0),
(797, '2024-01-21 16:18:25', '69E56F76-E684-FCD0-A501-3E24EBDF3909', -1, 'sysadmin', 'Sys Admin', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/120.0.0.0 Safari/537.36', '2804:7f0:b341:8c1a:edf1:e0de:ba72:3b0', NULL, '20000', 12, '2024-01-21 17:23:02', 12),
(799, '2024-01-21 17:33:44', 'A5EEA8A1-B32E-A83E-A512-3F6FFDC02CC4', -1, 'sysadmin', 'Sys Admin', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/120.0.0.0 Safari/537.36', '201.13.20.99', NULL, '14630', 0, '2024-01-23 20:54:45', 7),
(800, '2024-01-21 19:27:01', '08F1DC65-FDD0-66E6-4BA9-48534E16BF76', -1, 'sysadmin', 'Sys Admin', 'Mozilla/5.0 (Linux; Android 10; K) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/120.0.0.0 Mobile Safari/537.36', '191.36.128.195', NULL, '33438', 0, '2024-01-21 19:40:48', 0),
(802, '2024-01-22 01:16:35', '09917210-98B6-18BE-71B4-CC2932D340C3', -1, 'sysadmin', 'Sys Admin', 'Mozilla/5.0 (Linux; Android 10; K) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/120.0.0.0 Mobile Safari/537.36', '191.36.128.196', NULL, '23426', 0, '2024-01-22 01:18:06', 0),
(803, '2024-01-22 23:31:01', '40D6036C-7145-D262-E7A3-FBD828A16CCA', -1, 'sysadmin', 'Sys Admin', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/120.0.0.0 Safari/537.36', '191.36.128.168', NULL, '33382', 0, NULL, 0),
(804, '2024-01-22 23:31:05', 'C4592EFE-0080-A4FD-F313-CB7CF3EF73E1', -1, 'sysadmin', 'Sys Admin', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/120.0.0.0 Safari/537.36', '191.36.128.168', NULL, '20766', 1, '2024-01-23 11:55:00', 5),
(805, '2024-01-23 00:21:41', '80C5BB05-03C4-DAEE-D115-B374EE2631FE', -1, 'sysadmin', 'Sys Admin', 'Mozilla/5.0 (Linux; Android 10; K) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/120.0.0.0 Mobile Safari/537.36', '191.36.128.164', NULL, '27690', 1, '2024-01-23 01:30:12', 1),
(806, '2024-01-23 20:54:58', '680A608D-2E75-637B-553E-650DD98C6243', -1, 'sysadmin', 'Sys Admin', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/120.0.0.0 Safari/537.36', '191.36.128.195', NULL, '46054', 0, '2024-01-23 21:06:39', 0),
(809, '2024-01-24 20:50:56', 'D788DA56-90E4-C167-05EE-9AAD53B94E44', -1, 'sysadmin', 'Sys Admin', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/120.0.0.0 Safari/537.36', '191.36.128.164', NULL, '15774', 12, '2024-01-24 21:53:56', 12),
(811, '2024-01-24 21:44:07', 'E0EA947F-6A5A-4715-0653-100DA89247E6', -1, 'sysadmin', 'Sys Admin', 'Mozilla/5.0 (Linux; Android 10; K) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/120.0.0.0 Mobile Safari/537.36', '191.36.128.168', NULL, '22414', 4, '2024-01-24 23:09:46', 4),
(813, '2024-01-25 22:10:09', '4E133ED1-DC70-FCC6-306E-37353103FAA3', -1, 'sysadmin', 'Sys Admin', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/120.0.0.0 Safari/537.36', '191.36.128.168', NULL, '22036', 4, '2024-01-26 02:22:38', 5),
(819, '2024-01-27 17:08:41', '9B84DD35-CFB5-534E-54CF-FC414E4BCEF3', -1, 'sysadmin', 'Sys Admin', 'Mozilla/5.0 (Linux; Android 10; K) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/120.0.0.0 Mobile Safari/537.36', '191.36.128.195', NULL, '37590', 0, '2024-01-27 19:20:18', 2),
(821, '2024-01-28 12:48:01', '0F91F438-FF4E-15A1-5361-D80FE6A2ADC0', -1, 'sysadmin', 'Sys Admin', 'Mozilla/5.0 (Linux; Android 10; K) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/120.0.0.0 Mobile Safari/537.36', '2804:388:c2af:a9d1:0:48:6e3f:8601', NULL, '30782', 1, '2024-01-28 19:51:55', 5),
(824, '2024-01-28 23:01:58', '36C2DB9D-95A4-CA5B-1DF2-B4CBDD1FE1C6', -1, 'sysadmin', 'Sys Admin', 'Mozilla/5.0 (Linux; Android 10; K) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/120.0.0.0 Mobile Safari/537.36', '191.36.131.39', NULL, '36770', 1, '2024-01-29 00:20:05', 1),
(832, '2024-01-31 22:18:20', '41739333-31CA-59A6-206E-9C897CE4BDAD', -1, 'sysadmin', 'Sys Admin', 'Mozilla/5.0 (Linux; Android 10; K) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/121.0.0.0 Mobile Safari/537.36', '191.36.131.39', NULL, '49714', 1, '2024-01-31 22:24:26', 1),
(835, '2024-01-31 22:29:24', 'FDAD34F4-5865-1863-4F61-3AD55569B080', -1, 'sysadmin', 'Sys Admin', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/120.0.0.0 Safari/537.36', '191.36.131.39', NULL, '54690', 0, NULL, 0),
(836, '2024-01-31 22:29:43', '04E0B462-5D45-7C85-1FFB-1C8CE040E088', -1, 'sysadmin', 'Sys Admin', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/120.0.0.0 Safari/537.36', '191.36.131.39', NULL, '19010', 0, '2024-01-31 22:36:12', 0),
(838, '2024-01-31 23:35:39', '243A3B03-85BF-16DD-38BD-086D8F50F3D4', -1, 'sysadmin', 'Sys Admin', 'Mozilla/5.0 (Linux; Android 10; K) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/121.0.0.0 Mobile Safari/537.36', '191.36.131.39', NULL, '32240', 2, '2024-01-31 23:50:17', 2),
(839, '2024-02-01 12:22:46', '04E7E287-050C-2940-6F02-BF9A8E399E32', -1, 'sysadmin', 'Sys Admin', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/121.0.0.0 Safari/537.36 Edg/121.0.0.0', '191.36.128.172', NULL, '28854', 0, NULL, 0),
(840, '2024-02-01 12:22:53', 'F921A9DE-8526-CAEB-9C18-8DED8E26BABC', -1, 'sysadmin', 'Sys Admin', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/121.0.0.0 Safari/537.36 Edg/121.0.0.0', '191.36.128.164', NULL, '60990', 12, '2024-02-01 13:26:56', 12),
(841, '2024-02-02 13:29:37', '18E9BC85-ABF7-49D2-3032-99A1184AABD1', -1, 'sysadmin', 'Sys Admin', 'Mozilla/5.0 (Linux; Android 10; K) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/121.0.0.0 Safari/537.36', '2804:7f0:b341:8c1a:dcbd:cbf:7ff7:af54', NULL, '61242', 0, NULL, 0),
(843, '2024-02-02 13:34:19', '45F387DD-1E0F-17E8-C62E-B13C58C70F0A', -1, 'sysadmin', 'Sys Admin', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/120.0.0.0 Safari/537.36', '191.36.128.168', NULL, '32364', 0, '2024-02-02 13:41:11', 0),
(848, '2024-02-02 16:02:38', '05D9B118-90ED-6C1F-F9B2-6327567CF215', -1, 'sysadmin', 'Sys Admin', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/120.0.0.0 Safari/537.36', '191.36.128.170', NULL, '50742', 0, '2024-02-02 16:02:57', 0),
(852, '2024-02-02 21:55:18', '60C7B73B-5256-5265-71D7-FAA8DD63293E', -1, 'sysadmin', 'Sys Admin', 'Mozilla/5.0 (Linux; Android 10; K) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/121.0.0.0 Safari/537.36', '2804:7f0:b341:8c1a:dcbd:cbf:7ff7:af54', NULL, '16644', 5, '2024-02-04 19:55:29', 9),
(854, '2024-02-02 23:48:03', '0F5835B1-33CA-B7CE-8ED5-15029E1961A5', -1, 'sysadmin', 'Sys Admin', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/121.0.0.0 Safari/537.36', '191.36.128.164', NULL, '49260', 8, '2024-02-05 09:26:24', 15),
(855, '2024-02-03 11:33:22', '0194371B-A9B8-979F-1EAB-60B7BCB61370', -1, 'sysadmin', 'Sys Admin', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/121.0.0.0 Safari/537.36', '191.36.131.39', NULL, '13254', 0, NULL, 0),
(856, '2024-02-03 11:33:27', 'B75FD89F-D196-B22C-5AB2-94683BCFD040', -1, 'sysadmin', 'Sys Admin', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/121.0.0.0 Safari/537.36', '191.36.131.39', NULL, '39364', 12, '2024-02-03 12:35:34', 12),
(858, '2024-02-03 22:47:17', '4C2C30EA-C090-BFBC-2A7E-7E695EFCB5CF', -1, 'sysadmin', 'Sys Admin', 'Mozilla/5.0 (Linux; Android 10; K) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/121.0.0.0 Mobile Safari/537.36', '2804:214:860a:f8f5:1:0:8c6d:bd7c', NULL, '40434', 0, '2024-02-04 00:33:33', 3),
(862, '2024-02-04 21:38:17', 'F3BCC5D4-394F-AC6F-2F9A-C472FFD4F680', -1, 'sysadmin', 'Sys Admin', 'Mozilla/5.0 (Linux; Android 10; K) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/121.0.0.0 Mobile Safari/537.36', '191.36.131.82', NULL, '37762', 4, '2024-02-04 22:12:03', 4),
(864, '2024-02-04 23:38:21', '99C0A32B-B6CA-288D-D250-D4D958FF04FE', -1, 'sysadmin', 'Sys Admin', 'Mozilla/5.0 (Linux; Android 10; K) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/121.0.0.0 Mobile Safari/537.36', '191.36.131.82', NULL, '29650', 0, '2024-02-04 23:38:30', 0),
(867, '2024-02-05 13:29:46', '4D39DDFD-A219-09CC-38E6-BBAD97EAB619', -1, 'sysadmin', 'Sys Admin', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/121.0.0.0 Safari/537.36 Edg/121.0.0.0', '191.36.128.196', NULL, '31516', 12, '2024-02-05 14:48:43', 13),
(868, '2024-02-05 23:35:15', '1773157C-C18C-6504-5DD0-DA159DB6DBC5', -1, 'sysadmin', 'Sys Admin', 'Mozilla/5.0 (Linux; Android 10; K) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/121.0.0.0 Safari/537.36', '2804:7f0:b341:8c1a:dcbd:cbf:7ff7:af54', NULL, '39388', 3, '2024-02-06 12:40:10', 3),
(873, '2024-02-06 00:41:15', 'ECA6BD8A-FACA-E626-714E-544CF173991E', -1, 'sysadmin', 'Sys Admin', 'Mozilla/5.0 (Linux; Android 10; K) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/121.0.0.0 Mobile Safari/537.36', '201.42.84.155', NULL, '20382', 0, '2024-02-06 01:25:01', 3),
(877, '2024-02-06 01:33:16', 'ABA995D3-8AED-18B8-13D5-0FEDC6F11B0E', -1, 'sysadmin', 'Sys Admin', 'Mozilla/5.0 (Linux; Android 10; K) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/121.0.0.0 Mobile Safari/537.36', '201.42.84.155', NULL, '54186', 0, '2024-02-06 01:33:21', 0),
(888, '2024-02-07 16:32:27', '4D0A1B42-FE19-25DD-6598-C7AD83FC58D4', -1, 'sysadmin', 'Sys Admin', 'Mozilla/5.0 (Linux; Android 10; K) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/121.0.0.0 Mobile Safari/537.36', '191.36.128.195', NULL, '52676', 1, '2024-02-07 16:38:26', 1),
(902, '2024-02-09 19:59:05', 'A15056CD-0D34-F423-E45F-6F071A4986F3', -1, 'sysadmin', 'Sys Admin', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/121.0.0.0 Safari/537.36', '191.36.128.196', NULL, '26846', 12, '2024-02-09 20:59:58', 12),
(907, '2024-02-10 10:30:31', 'DF00B626-D11B-BA12-38C0-27DE0DAD4234', -1, 'sysadmin', 'Sys Admin', 'Mozilla/5.0 (Linux; Android 10; K) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/121.0.0.0 Mobile Safari/537.36', '191.36.128.195', NULL, '62080', 4, '2024-02-10 14:17:14', 8),
(909, '2024-02-11 13:38:11', '5C0AE24F-FC76-BDCB-DC86-1A5CF7CEA026', -1, 'sysadmin', 'Sys Admin', 'Mozilla/5.0 (Linux; Android 10; K) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/121.0.0.0 Mobile Safari/537.36', '191.36.128.194', NULL, '31352', 1, '2024-02-11 13:43:43', 1),
(914, '2024-02-13 22:19:03', 'B4466B70-766D-32AE-319A-8EF524695D98', -1, 'sysadmin', 'Sys Admin', 'Mozilla/5.0 (Linux; Android 10; K) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/121.0.0.0 Mobile Safari/537.36', '177.188.190.187', NULL, '41530', 0, '2024-02-13 22:27:28', 0),
(995, '2024-02-27 18:01:34', 'F4C95E7F-3D88-148B-EA20-B47AA93C7B69', -1, 'sysadmin', 'Sys Admin', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/121.0.0.0 Safari/537.36', '191.36.128.198', NULL, '59732', 0, '2024-02-27 19:18:03', 14),
(997, '2024-02-27 20:33:37', '6E9D73E7-04A1-B0D5-77C2-B73A77351A5F', -1, 'sysadmin', 'Sys Admin', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/121.0.0.0 Safari/537.36', '191.36.128.193', NULL, '37800', 0, NULL, 0),
(998, '2024-02-27 20:33:40', '4F50B617-2C20-DE23-F721-3C00A858F6A5', -1, 'sysadmin', 'Sys Admin', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/121.0.0.0 Safari/537.36', '191.36.128.195', NULL, '48892', 0, '2024-02-27 20:41:16', 1),
(1004, '2024-02-28 12:13:50', '1F86DDF2-E7AD-6BE2-60D1-707A4EEA8862', -1, 'sysadmin', 'Sys Admin', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/121.0.0.0 Safari/537.36', '191.36.128.196', NULL, '57034', 12, '2024-02-28 14:33:58', 23),
(1009, '2024-02-29 13:18:42', 'A349E4BB-AAD7-FA21-2594-7620EDE611E8', -1, 'sysadmin', 'Sys Admin', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/121.0.0.0 Safari/537.36', '191.36.128.168', NULL, '44542', 12, '2024-02-29 14:18:47', 12),
(1017, '2024-03-01 13:28:45', '306DB8C6-4832-408A-41C5-335669CD652E', -1, 'sysadmin', 'Sys Admin', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/121.0.0.0 Safari/537.36', '191.36.128.196', NULL, '14466', 12, '2024-03-01 14:29:22', 12),
(1115, '2024-03-30 10:13:19', 'C900F643-FA8D-9CEA-497D-2666A581D284', -1, 'sysadmin', 'Sys Admin', 'Mozilla/5.0 (Linux; Android 10; K) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/123.0.0.0 Mobile Safari/537.36 EdgA/123.0.0.0', '2804:214:82d9:12fa:1:1:752b:492f', NULL, '17248', 0, '2024-03-30 11:50:19', 1),
(1125, '2024-04-01 18:14:29', '1866432B-70C7-042C-ECDE-954E3F989832', -1, 'sysadmin', 'Sys Admin', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/123.0.0.0 Safari/537.36', '191.36.128.164', NULL, '46738', 12, '2024-04-02 00:17:24', 22),
(1131, '2024-04-01 23:16:37', '2E1D4932-DAD4-DBA1-83B4-10A76BFD9CF2', -1, 'sysadmin', 'Sys Admin', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/123.0.0.0 Safari/537.36', '191.36.128.172', NULL, '30768', 0, NULL, 0),
(1186, '2024-04-11 21:02:02', 'E453B0B3-22B7-0807-7FA7-798226873DFD', -1, 'sysadmin', 'Sys Admin', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/123.0.0.0 Safari/537.36', '2804:7f0:b341:8c1a:e41a:9457:2d63:eaef', NULL, '55874', 0, NULL, 0),
(1187, '2024-04-11 21:02:04', 'D3818A86-0555-1913-AEF2-21C611310344', -1, 'sysadmin', 'Sys Admin', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/123.0.0.0 Safari/537.36', '2804:7f0:b341:8c1a:e41a:9457:2d63:eaef', NULL, '31392', 12, '2024-04-11 22:14:51', 12),
(1188, '2024-04-12 12:57:04', '9EDE61EB-EB37-E430-9E0A-1B38E0E357A3', -1, 'sysadmin', 'Sys Admin', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/123.0.0.0 Safari/537.36', '2804:7f0:b341:8c1a:405b:3906:13a4:a7f3', NULL, '15244', 12, '2024-04-12 14:10:06', 13),
(1357, '2024-05-28 23:46:38', '8463408C-2B5C-5180-D674-C56F7F6A97A7', -1, 'sysadmin', 'Sys Admin', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/125.0.0.0 Safari/537.36', '191.36.128.164', NULL, '55092', 0, '2024-05-29 12:12:34', 3),
(1377, '2024-06-04 12:27:47', '17AE016C-711C-5AE0-490E-15A736EDB43F', -1, 'sysadmin', 'Sys Admin', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/125.0.0.0 Safari/537.36 Edg/125.0.0.0', '189.47.109.246', NULL, '41144', 12, '2024-06-04 13:48:52', 15),
(1382, '2024-06-04 20:55:22', '3F07FC09-8431-48AF-067A-03A836CA4F79', -1, 'sysadmin', 'Sys Admin', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/125.0.0.0 Safari/537.36', '192.168.65.1', NULL, '61939', 0, '2024-06-04 20:55:30', 0),
(1383, '2024-06-04 20:58:16', '0F2BF1B9-0C69-8A4F-1118-F708AA83CE66', -1, 'sysadmin', 'Sys Admin', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/125.0.0.0 Safari/537.36', '192.168.65.1', NULL, '19916', 0, '2024-06-04 21:34:54', 2),
(1384, '2024-06-04 21:37:20', '3387D7EF-4DAB-FBF9-0510-79DA45687D02', -1, 'sysadmin', 'Sys Admin', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/125.0.0.0 Safari/537.36', '192.168.65.1', NULL, '52665', 0, '2024-06-04 22:06:25', 4),
(1385, '2024-06-04 22:07:12', 'E510C99A-481C-88DE-A8F9-1186B8E334A9', -1, 'sysadmin', 'Sys Admin', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/125.0.0.0 Safari/537.36', '192.168.65.1', NULL, '45478', 12, '2024-06-04 23:57:52', 12),
(1386, '2024-06-05 15:25:22', '87AC2BED-04DD-004A-C8AE-E0B1B3674070', -1, 'sysadmin', 'Sys Admin', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/125.0.0.0 Safari/537.36', '192.168.65.1', NULL, '38686', 12, '2024-06-05 16:35:27', 13),
(1387, '2024-06-05 18:28:48', 'C770A1A3-E8CE-DCF5-AB5B-105595D1B36F', -1, 'sysadmin', 'Sys Admin', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/125.0.0.0 Safari/537.36', '192.168.65.1', NULL, '64921', 12, '2024-06-05 21:18:27', 13),
(1388, '2024-06-06 15:08:18', '4F47AB9F-8287-8228-A8C4-AD8B3FE37888', -1, 'sysadmin', 'Sys Admin', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/125.0.0.0 Safari/537.36', '192.168.65.1', NULL, '47783', 12, '2024-06-06 19:29:37', 13),
(1389, '2024-06-06 19:39:05', '0F2258CA-1D7C-3AA4-911E-DDDD402BD662', -1, 'sysadmin', 'Sys Admin', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/125.0.0.0 Safari/537.36', '192.168.65.1', NULL, '45593', 12, '2024-06-06 22:17:37', 23),
(1390, '2024-06-07 01:43:51', '24281D30-49E0-D8D4-0DAF-8653DDCB9FB2', -1, 'sysadmin', 'Sys Admin', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/125.0.0.0 Safari/537.36', '192.168.65.1', NULL, '18021', 12, '2024-06-07 16:09:22', 53),
(1391, '2024-06-11 18:17:17', '2796775D-F7EA-451C-391C-80B524B9CDD3', -1, 'sysadmin', 'Sys Admin', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/125.0.0.0 Safari/537.36', '192.168.65.1', NULL, '47583', 12, '2024-06-11 20:59:41', 22),
(1392, '2024-06-11 21:11:26', '271B2BF5-59F0-8ABB-784B-0AD30548F14A', -1, 'sysadmin', 'Sys Admin', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/125.0.0.0 Safari/537.36', '192.168.65.1', NULL, '58513', 0, '2024-06-12 00:13:44', 10),
(1393, '2024-06-12 00:14:22', '853EF77A-9F51-E3B9-487C-55E6B7D4A929', 48, 'walter', 'Walter Moura', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/125.0.0.0 Safari/537.36', '192.168.65.1', NULL, '45079', 0, '2024-06-12 12:21:08', 7),
(1394, '2024-06-12 13:12:42', '7FAE63D1-38FE-9A64-8FCF-3240EC380B64', -1, 'sysadmin', 'Sys Admin', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/125.0.0.0 Safari/537.36 Edg/125.0.0.0', '192.168.65.1', NULL, '16218', 0, '2024-06-12 13:12:50', 0),
(1395, '2024-06-12 13:15:48', 'EFFF2D96-4763-2AB8-0890-E6CDB917A8AF', 48, 'walter', 'Walter Moura', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/125.0.0.0 Safari/537.36 Edg/125.0.0.0', '192.168.65.1', NULL, '26199', 0, '2024-06-12 13:15:53', 0),
(1396, '2024-06-12 13:15:55', '5922ACEE-0D1C-F1EE-4DEF-737241651BCD', 48, 'walter', 'Walter Moura', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/125.0.0.0 Safari/537.36 Edg/125.0.0.0', '192.168.65.1', NULL, '34684', 12, '2024-06-12 14:21:07', 12),
(1397, '2024-06-12 17:24:55', '3AB223A3-D73D-7E29-E242-2522F940D977', 48, 'walter', 'Walter Moura', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/125.0.0.0 Safari/537.36 Edg/125.0.0.0', '192.168.65.1', NULL, '18099', 12, '2024-06-12 19:09:07', 19),
(1398, '2024-06-17 23:33:54', 'E961629B-8FAA-39CB-794B-37162E7ACF05', -1, 'sysadmin', 'Sys Admin', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/125.0.0.0 Safari/537.36 Edg/125.0.0.0', '192.168.65.1', NULL, '22423', 12, '2024-06-18 13:09:47', 25),
(1399, '2024-06-18 20:18:45', '2E2C8963-BB47-07D5-E1BD-ECBE0AF80370', -1, 'sysadmin', 'Sys Admin', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/125.0.0.0 Safari/537.36 Edg/125.0.0.0', '192.168.65.1', NULL, '48302', 12, '2024-06-18 21:22:47', 12),
(1400, '2024-06-18 21:42:42', '3120E785-B253-81B7-D253-D586D6B05727', -1, 'sysadmin', 'Sys Admin', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/125.0.0.0 Safari/537.36 Edg/125.0.0.0', '192.168.65.1', NULL, '38137', 0, '2024-06-18 23:00:09', 9),
(1401, '2024-06-18 23:04:26', '391775B7-B8C5-DB40-7829-4717B7E97268', -1, 'sysadmin', 'Sys Admin', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/125.0.0.0 Safari/537.36 Edg/125.0.0.0', '192.168.65.1', NULL, '39850', 12, '2024-06-19 12:49:21', 12),
(1402, '2024-06-19 14:15:39', '6F78AA96-C5C5-7A80-22FC-3CDDC08466B6', -1, 'sysadmin', 'Sys Admin', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/125.0.0.0 Safari/537.36 Edg/125.0.0.0', '192.168.65.1', NULL, '24739', 12, '2024-06-19 16:35:21', 21),
(1403, '2024-06-19 18:02:45', '10403E7D-1814-4D09-129C-4EB88969D4F9', -1, 'sysadmin', 'Sys Admin', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/125.0.0.0 Safari/537.36 Edg/125.0.0.0', '192.168.65.1', NULL, '37206', 0, '2024-06-21 15:14:57', 24),
(1404, '2024-06-21 15:14:59', '6805C9B8-67EC-9185-8305-6BAF09F0B293', -1, 'sysadmin', 'Sys Admin', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/125.0.0.0 Safari/537.36 Edg/125.0.0.0', '192.168.65.1', NULL, '63725', 12, '2024-06-21 16:15:25', 12),
(1405, '2024-06-21 17:26:31', '77CDAACD-1647-FCD2-BF06-D39496601D04', -1, 'sysadmin', 'Sys Admin', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/125.0.0.0 Safari/537.36 Edg/125.0.0.0', '192.168.65.1', NULL, '32180', 12, '2024-06-21 19:14:24', 18),
(1406, '2024-06-21 20:31:20', '3E23326F-5E9B-54CD-A002-343818F92BAC', -1, 'sysadmin', 'Sys Admin', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/125.0.0.0 Safari/537.36 Edg/125.0.0.0', '192.168.65.1', NULL, '25021', 0, '2024-06-21 20:33:20', 0),
(1407, '2024-06-21 20:58:04', 'AA4E0C2B-392E-A640-8B5B-FE904E847156', -1, 'sysadmin', 'Sys Admin', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/125.0.0.0 Safari/537.36 Edg/125.0.0.0', '192.168.65.1', NULL, '43362', 0, '2024-06-21 21:07:25', 0),
(1408, '2024-06-21 20:59:00', '0FB5C28B-F582-B314-5963-673B69C51503', -1, 'sysadmin', 'Sys Admin', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/125.0.0.0 Safari/537.36', '192.168.65.1', NULL, '18156', 0, '2024-06-21 20:59:12', 0),
(1409, '2024-06-21 21:00:59', '6C52CABC-512B-5A54-B35D-323E404BABF7', -1, 'sysadmin', 'Sys Admin', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/126.0.0.0 Safari/537.36', '192.168.65.1', NULL, '24956', 0, '2024-06-21 21:13:21', 1),
(1410, '2024-06-21 21:07:27', 'AA547B7A-AF8E-B945-B453-290F06A86C9D', -1, 'sysadmin', 'Sys Admin', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/125.0.0.0 Safari/537.36 Edg/125.0.0.0', '192.168.65.1', NULL, '22231', 1, '2024-06-21 21:33:34', 1);

-- --------------------------------------------------------

--
-- Estrutura para tabela `tb_settings_smtp`
--

DROP TABLE IF EXISTS `tb_settings_smtp`;
CREATE TABLE IF NOT EXISTS `tb_settings_smtp` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `created_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `host` varchar(255) NOT NULL,
  `port` int(11) NOT NULL,
  `username` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `from_name` varchar(255) NOT NULL,
  `id_apikey` int(11) NOT NULL,
  `status_id` int(11) NOT NULL,
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id`),
  KEY `id_apikey` (`id_apikey`),
  KEY `fk_status_smtp` (`status_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Despejando dados para a tabela `tb_settings_smtp`
--

INSERT INTO `tb_settings_smtp` (`id`, `created_at`, `host`, `port`, `username`, `password`, `from_name`, `id_apikey`, `status_id`, `updated_at`) VALUES
(1, '2023-06-20 23:06:00', 'smtp.gmail.com', 587, 'monitoramento.sleyersx@gmail.com', 'a2RxQzdYWXI4RDg5M3JaWjIxZlRnaS9lOGNveERZUmRFNjdiZlhzSmlVWT06OldNC8en1RPIVqDO+GIbDRg=', 'Monitaramente Web Service', 2, 2, '2023-06-23 02:01:56'),
(2, '2023-12-21 13:52:59', 'smtp.gmail.com', 587, 'admin@iasd-pqregina.com.br', 'S09PQ3ZwQlJ5TU9JV0dLNkt0bXdZa0N3ZjZ0QzViRW83ZzJNRWxPODd2RT06Ov5QrU54dglNx23Jderaglw=', 'Administração Parque Regina', 2, 1, '2023-12-21 13:52:59');

-- --------------------------------------------------------

--
-- Estrutura para tabela `tb_status_apikey`
--

DROP TABLE IF EXISTS `tb_status_apikey`;
CREATE TABLE IF NOT EXISTS `tb_status_apikey` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `created_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `status` int(11) NOT NULL,
  `description` varchar(255) NOT NULL,
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Despejando dados para a tabela `tb_status_apikey`
--

INSERT INTO `tb_status_apikey` (`id`, `created_at`, `status`, `description`, `updated_at`) VALUES
(1, '0000-00-00 00:00:00', 1, 'ACTIVE', '2023-12-20 21:36:38'),
(2, '0000-00-00 00:00:00', 2, 'INACTIVE', '2023-12-20 21:36:38');

-- --------------------------------------------------------

--
-- Estrutura para tabela `tb_status_email`
--

DROP TABLE IF EXISTS `tb_status_email`;
CREATE TABLE IF NOT EXISTS `tb_status_email` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `status` int(11) NOT NULL,
  `description` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Despejando dados para a tabela `tb_status_email`
--

INSERT INTO `tb_status_email` (`id`, `status`, `description`) VALUES
(1, 1, 'ACTIVED'),
(2, 2, 'INACTIVED');

-- --------------------------------------------------------

--
-- Estrutura para tabela `tb_status_smtp`
--

DROP TABLE IF EXISTS `tb_status_smtp`;
CREATE TABLE IF NOT EXISTS `tb_status_smtp` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `created_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `status` int(11) NOT NULL,
  `description` varchar(255) NOT NULL,
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Despejando dados para a tabela `tb_status_smtp`
--

INSERT INTO `tb_status_smtp` (`id`, `created_at`, `status`, `description`, `updated_at`) VALUES
(1, '2023-12-21 10:57:28', 1, 'ACTIVE', '2023-12-20 21:36:38'),
(2, '2023-12-21 10:57:32', 2, 'INACTIVE', '2023-12-20 21:36:38');

-- --------------------------------------------------------

--
-- Estrutura para tabela `tb_status_token`
--

DROP TABLE IF EXISTS `tb_status_token`;
CREATE TABLE IF NOT EXISTS `tb_status_token` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `status` int(11) NOT NULL,
  `description` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Despejando dados para a tabela `tb_status_token`
--

INSERT INTO `tb_status_token` (`id`, `status`, `description`) VALUES
(1, 1, 'VERIFIED'),
(2, 2, 'PENDENTE');

-- --------------------------------------------------------

--
-- Estrutura para tabela `tb_status_users`
--

DROP TABLE IF EXISTS `tb_status_users`;
CREATE TABLE IF NOT EXISTS `tb_status_users` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `created_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `status` varchar(255) NOT NULL,
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  PRIMARY KEY (`id`),
  UNIQUE KEY `status_name` (`status`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Despejando dados para a tabela `tb_status_users`
--

INSERT INTO `tb_status_users` (`id`, `created_at`, `status`, `updated_at`) VALUES
(1, '2023-03-27 18:47:00', 'ACTIVE', '2023-03-27 21:47:20'),
(2, '2024-01-22 20:30:27', 'INACTIVE', '2024-01-22 23:30:48'),
(3, '2023-03-27 18:47:32', 'BLOCKED', '2023-03-27 21:47:52'),
(4, '2023-03-27 18:47:32', 'DELETED', '2023-03-27 21:47:52'),
(5, '2024-01-23 18:19:57', 'REPROVED', '2024-01-23 21:20:16');

-- --------------------------------------------------------

--
-- Estrutura para tabela `tb_temp_users`
--

DROP TABLE IF EXISTS `tb_temp_users`;
CREATE TABLE IF NOT EXISTS `tb_temp_users` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `login` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `department_id` int(11) NOT NULL,
  `password` varchar(255) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NULL DEFAULT NULL ON UPDATE current_timestamp(),
  `id_status` int(11) NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `status_id` (`id_status`) USING BTREE,
  KEY `fk_temp_user_department_id` (`department_id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estrutura para tabela `tb_text_color`
--

DROP TABLE IF EXISTS `tb_text_color`;
CREATE TABLE IF NOT EXISTS `tb_text_color` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `color` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Despejando dados para a tabela `tb_text_color`
--

INSERT INTO `tb_text_color` (`id`, `color`) VALUES
(1, 'yellow'),
(2, 'green'),
(3, 'red'),
(4, 'blue'),
(5, 'gray'),
(6, 'blue'),
(7, 'pink'),
(8, 'purple'),
(9, 'white'),
(10, 'black');

-- --------------------------------------------------------

--
-- Estrutura para tabela `tb_type_module`
--

DROP TABLE IF EXISTS `tb_type_module`;
CREATE TABLE IF NOT EXISTS `tb_type_module` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `created_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `type` varchar(255) NOT NULL,
  `description` varchar(255) NOT NULL,
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Despejando dados para a tabela `tb_type_module`
--

INSERT INTO `tb_type_module` (`id`, `created_at`, `type`, `description`, `updated_at`) VALUES
(1, '2023-03-27 21:02:04', 'menu', 'Menu Lateral', '2023-04-10 23:56:19'),
(2, '2023-03-27 21:02:04', 'button', 'Botão', '2023-04-10 23:56:27'),
(3, '2023-03-28 15:36:56', 'page', 'Página', '2023-04-10 23:56:31'),
(5, '2023-03-28 15:36:56', 'tab-pane-advanced-settings', 'Menu Configuração Avançada', '2023-12-20 21:20:06'),
(8, '2023-12-21 22:58:24', 'tab-pane-monitoring', 'Menus de Monitoramento', '2023-12-21 22:58:24'),
(9, '2024-06-18 00:53:08', 'tab-pane-stock-manager', 'Gestão de Estoque', '2024-06-18 00:53:08');

-- --------------------------------------------------------

--
-- Estrutura para tabela `tb_users`
--

DROP TABLE IF EXISTS `tb_users`;
CREATE TABLE IF NOT EXISTS `tb_users` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `login` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `id_nivel` int(11) NOT NULL,
  `acessos` int(11) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NULL DEFAULT NULL ON UPDATE current_timestamp(),
  `id_status` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `id_nivel` (`id_nivel`) USING BTREE,
  KEY `status_id` (`id_status`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=49 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Despejando dados para a tabela `tb_users`
--

INSERT INTO `tb_users` (`id`, `name`, `login`, `email`, `password`, `id_nivel`, `acessos`, `created_at`, `updated_at`, `id_status`) VALUES
(-1, 'Sys Admin', 'sysadmin', 'sysadmin@sleyersx.com.br', '$2y$12$sRuOdW3rXYa5.Zbh2FWtC.l9Ho3wxjLKpNK7EkYATBSLtZ/eXWwum', -1, NULL, '2023-01-31 23:10:57', '2023-12-21 19:30:36', 1),
(48, 'Walter Moura', 'walter', 'walter.moura@digibee.com', '$2y$12$bGkqgmplyZio1wLl625BQ.PUfVTlwn8OEqBmZaojSvL.V3QQmBdUm', 1, NULL, '2024-06-12 00:12:06', '2024-06-12 00:13:51', 1);

-- --------------------------------------------------------

--
-- Estrutura para tabela `tb_visitor`
--

DROP TABLE IF EXISTS `tb_visitor`;
CREATE TABLE IF NOT EXISTS `tb_visitor` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `start_date` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `end_date` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `id_user` int(11) DEFAULT NULL,
  `login` text NOT NULL,
  `name_user` text NOT NULL,
  PRIMARY KEY (`id`),
  KEY `id_user` (`id_user`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Despejando dados para a tabela `tb_visitor`
--

INSERT INTO `tb_visitor` (`id`, `start_date`, `end_date`, `id_user`, `login`, `name_user`) VALUES
(1, '2024-06-04 20:58:31', '2024-06-04 23:59:52', -1, 'sysadmin', 'Sys Admin'),
(2, '2024-06-05 00:00:52', '2024-06-05 21:23:27', -1, 'sysadmin', 'Sys Admin'),
(3, '2024-06-06 15:08:29', '2024-06-06 22:17:37', -1, 'sysadmin', 'Sys Admin'),
(4, '2024-06-07 01:44:13', '2024-06-07 16:11:21', -1, 'sysadmin', 'Sys Admin'),
(5, '2024-06-11 18:17:31', '2024-06-11 23:59:54', -1, 'sysadmin', 'Sys Admin'),
(6, '2024-06-12 00:00:04', '2024-06-12 00:13:42', -1, 'sysadmin', 'Sys Admin'),
(7, '2024-06-12 00:14:42', '2024-06-12 19:14:07', 48, 'walter', 'Walter Moura'),
(8, '2024-06-17 23:34:17', '2024-06-17 23:59:59', -1, 'sysadmin', 'Sys Admin'),
(9, '2024-06-18 00:00:09', '2024-06-18 23:10:47', -1, 'sysadmin', 'Sys Admin'),
(10, '2024-06-19 02:11:50', '2024-06-19 23:37:14', -1, 'sysadmin', 'Sys Admin'),
(11, '2024-06-20 00:38:09', '2024-06-20 12:52:21', -1, 'sysadmin', 'Sys Admin'),
(12, '2024-06-21 15:15:14', '2024-06-21 21:36:34', -1, 'sysadmin', 'Sys Admin');

-- --------------------------------------------------------

--
-- Estrutura para tabela `tb_years`
--

DROP TABLE IF EXISTS `tb_years`;
CREATE TABLE IF NOT EXISTS `tb_years` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `year` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Despejando dados para a tabela `tb_years`
--

INSERT INTO `tb_years` (`id`, `year`) VALUES
(1, '2022'),
(2, '2023'),
(3, '2024'),
(4, '2025'),
(5, '2026'),
(6, '2027'),
(7, '2028'),
(8, '2029'),
(9, '2030');

-- --------------------------------------------------------

--
-- Estrutura para view `cnt_access_modules`
--
DROP TABLE IF EXISTS `cnt_access_modules`;

DROP VIEW IF EXISTS `cnt_access_modules`;
CREATE ALGORITHM=UNDEFINED DEFINER=`u301289665_ybdownload`@`127.0.0.1` SQL SECURITY DEFINER VIEW `cnt_access_modules`  AS SELECT `tb_access_modules`.`id` AS `id`, `tb_access_modules`.`created_at` AS `created_at`, `tb_access_modules`.`module_id` AS `module_id`, `tb_modules`.`type_id` AS `type_id_module`, `tb_type_module`.`type` AS `type_module`, CASE WHEN `tb_access_modules`.`allow` = 1 THEN 'true' ELSE 'false' END AS `allow`, `tb_modules`.`module` AS `module`, `tb_modules`.`label` AS `label`, `tb_modules`.`icon` AS `icon`, `tb_modules`.`path_module` AS `path_module`, `tb_access_modules`.`updated_at` AS `updated_at`, `tb_access_modules`.`level_id` AS `level_id`, `tb_access_level`.`level` AS `level`, `tb_access_level`.`description` AS `description`, `tb_access_level`.`home_path` AS `home_path`, `tb_modules`.`current` AS `current` FROM (((`tb_access_modules` join `tb_access_level` on(`tb_access_level`.`id` = `tb_access_modules`.`level_id`)) join `tb_modules` on(`tb_modules`.`id` = `tb_access_modules`.`module_id`)) join `tb_type_module` on(`tb_type_module`.`id` = `tb_modules`.`type_id`)) ;

-- --------------------------------------------------------

--
-- Estrutura para view `cnt_access_modules_v2`
--
DROP TABLE IF EXISTS `cnt_access_modules_v2`;

DROP VIEW IF EXISTS `cnt_access_modules_v2`;
CREATE ALGORITHM=UNDEFINED DEFINER=`u301289665_ybdownload`@`127.0.0.1` SQL SECURITY DEFINER VIEW `cnt_access_modules_v2`  AS SELECT `tb_access_modules`.`id` AS `id`, `tb_access_modules`.`created_at` AS `created_at`, `tb_access_modules`.`module_id` AS `module_id`, group_concat(`tb_modules`.`module` separator ', ') AS `module`, `tb_access_modules`.`updated_at` AS `updated_at`, `tb_access_modules`.`level_id` AS `level_id`, `tb_access_level`.`level` AS `level`, `tb_access_level`.`description` AS `description`, `tb_access_level`.`home_path` AS `home_path` FROM (((`tb_access_modules` join `tb_access_level` on(`tb_access_level`.`id` = `tb_access_modules`.`level_id`)) join `tb_modules` on(`tb_modules`.`id` = `tb_access_modules`.`module_id`)) join `tb_type_module` on(`tb_type_module`.`id` = `tb_modules`.`type_id`)) GROUP BY `tb_access_level`.`level` ;

-- --------------------------------------------------------

--
-- Estrutura para view `cnt_apis`
--
DROP TABLE IF EXISTS `cnt_apis`;

DROP VIEW IF EXISTS `cnt_apis`;
CREATE ALGORITHM=UNDEFINED DEFINER=`u301289665_ybdownload`@`127.0.0.1` SQL SECURITY DEFINER VIEW `cnt_apis`  AS SELECT `u`.`id` AS `user_id`, `u`.`name` AS `user_name`, `u`.`email` AS `user_email`, `a`.`id` AS `id`, `a`.`api_key` AS `api_key`, `a`.`api_name` AS `api_name`, `a`.`api_description` AS `api_description`, `a`.`api_path` AS `api_path`, `a`.`active` AS `active`, `a`.`status_id` AS `status_id` FROM (`tb_users` `u` join `tb_apis` `a` on(`u`.`id` = `a`.`user_id`)) ;

-- --------------------------------------------------------

--
-- Estrutura para view `cnt_email_alarmes`
--
DROP TABLE IF EXISTS `cnt_email_alarmes`;

DROP VIEW IF EXISTS `cnt_email_alarmes`;
CREATE ALGORITHM=UNDEFINED DEFINER=`u301289665_ybdownload`@`127.0.0.1` SQL SECURITY DEFINER VIEW `cnt_email_alarmes`  AS SELECT `tb_email_alarmes`.`id` AS `id`, `tb_email_alarmes`.`name` AS `name`, `tb_email_alarmes`.`email` AS `email`, `tb_email_alarmes`.`email_verified` AS `email_verified`, `tb_email_alarmes`.`created_at` AS `created_at`, `tb_email_alarmes`.`updated_at` AS `updated_at`, `tb_status_email`.`id` AS `status_id`, `tb_status_email`.`status` AS `status`, `tb_status_email`.`description` AS `description`, `tb_status_token`.`id` AS `status_verified_id`, `tb_status_token`.`description` AS `status_verified` FROM ((`tb_email_alarmes` join `tb_status_email` on(`tb_email_alarmes`.`status` = `tb_status_email`.`id`)) join `tb_status_token` on(`tb_email_alarmes`.`email_verified` = `tb_status_token`.`id`)) ;

-- --------------------------------------------------------

--
-- Estrutura para view `cnt_events_status`
--
DROP TABLE IF EXISTS `cnt_events_status`;

DROP VIEW IF EXISTS `cnt_events_status`;
CREATE ALGORITHM=UNDEFINED DEFINER=`u301289665_ybdownload`@`127.0.0.1` SQL SECURITY DEFINER VIEW `cnt_events_status`  AS SELECT `tb_events_status`.`id` AS `id`, `tb_events_status`.`status` AS `status`, `tb_events_status`.`created_at` AS `created_at`, `tb_events_status`.`updated_at` AS `updated_at`, `tb_events_status`.`description` AS `description`, `tb_events_status`.`color_id` AS `color_id`, `tb_color`.`color` AS `color`, `tb_events_status`.`text_color_id` AS `text_color_id`, `tb_text_color`.`color` AS `text_color` FROM ((`tb_events_status` join `tb_text_color` on(`tb_events_status`.`text_color_id` = `tb_text_color`.`id`)) join `tb_color` on(`tb_events_status`.`color_id` = `tb_color`.`id`)) ;

-- --------------------------------------------------------

--
-- Estrutura para view `cnt_logs`
--
DROP TABLE IF EXISTS `cnt_logs`;

DROP VIEW IF EXISTS `cnt_logs`;
CREATE ALGORITHM=UNDEFINED DEFINER=`u301289665_ybdownload`@`127.0.0.1` SQL SECURITY DEFINER VIEW `cnt_logs`  AS SELECT `l`.`id` AS `id`, `l`.`id_user` AS `id_user`, `l`.`application` AS `application`, `l`.`created_at` AS `created_at`, `l`.`data` AS `data`, `l`.`token` AS `token`, `u`.`name` AS `name`, `u`.`login` AS `login` FROM (`tb_log` `l` join `tb_users` `u` on(`u`.`id` = `l`.`id_user`)) ;

-- --------------------------------------------------------

--
-- Estrutura para view `cnt_modules`
--
DROP TABLE IF EXISTS `cnt_modules`;

DROP VIEW IF EXISTS `cnt_modules`;
CREATE ALGORITHM=UNDEFINED DEFINER=`u301289665_ybdownload`@`127.0.0.1` SQL SECURITY DEFINER VIEW `cnt_modules`  AS SELECT `tb_modules`.`id` AS `id`, `tb_modules`.`created_at` AS `created_at`, `tb_modules`.`module` AS `module`, `tb_modules`.`label` AS `label`, `tb_modules`.`icon` AS `icon`, `tb_modules`.`path_module` AS `path_module`, `tb_modules`.`updated_at` AS `updated_at`, `tb_modules`.`type_id` AS `type_id`, `tb_modules`.`current` AS `current`, `tb_modules`.`allow_sysadmin` AS `allow_sysadmin`, `tb_type_module`.`type` AS `type`, `tb_type_module`.`description` AS `description` FROM (`tb_modules` join `tb_type_module` on(`tb_modules`.`type_id` = `tb_type_module`.`id`)) ;

-- --------------------------------------------------------

--
-- Estrutura para view `cnt_settings_smtp`
--
DROP TABLE IF EXISTS `cnt_settings_smtp`;

DROP VIEW IF EXISTS `cnt_settings_smtp`;
CREATE ALGORITHM=UNDEFINED DEFINER=`u301289665_ybdownload`@`127.0.0.1` SQL SECURITY DEFINER VIEW `cnt_settings_smtp`  AS SELECT `tb_settings_smtp`.`id` AS `id`, `tb_settings_smtp`.`created_at` AS `created_at`, `tb_settings_smtp`.`host` AS `host`, `tb_settings_smtp`.`port` AS `port`, `tb_settings_smtp`.`username` AS `username`, `tb_settings_smtp`.`password` AS `password`, `tb_settings_smtp`.`from_name` AS `from_name`, `tb_settings_smtp`.`id_apikey` AS `id_apikey`, `tb_settings_smtp`.`status_id` AS `status_id`, `tb_status_smtp`.`description` AS `status_description`, `tb_settings_smtp`.`updated_at` AS `updated_at`, `tb_apis`.`api_key` AS `api_key` FROM ((`tb_settings_smtp` join `tb_apis` on(`tb_settings_smtp`.`id_apikey` = `tb_apis`.`id`)) join `tb_status_smtp` on(`tb_settings_smtp`.`status_id` = `tb_status_smtp`.`id`)) ;

-- --------------------------------------------------------

--
-- Estrutura para view `cnt_temp_users`
--
DROP TABLE IF EXISTS `cnt_temp_users`;

DROP VIEW IF EXISTS `cnt_temp_users`;
CREATE ALGORITHM=UNDEFINED DEFINER=`u301289665_ybdownload`@`127.0.0.1` SQL SECURITY DEFINER VIEW `cnt_temp_users`  AS SELECT `tb_temp_users`.`id` AS `id`, `tb_temp_users`.`name` AS `name`, `tb_temp_users`.`login` AS `login`, `tb_temp_users`.`email` AS `email`, `tb_temp_users`.`user_id` AS `user_id`, `tb_temp_users`.`department_id` AS `department_id`, `tb_temp_users`.`password` AS `password`, `tb_temp_users`.`created_at` AS `created_at`, `tb_temp_users`.`updated_at` AS `updated_at`, `tb_temp_users`.`id_status` AS `id_status`, `tb_status_users`.`status` AS `status_user` FROM (`tb_temp_users` left join `tb_status_users` on(`tb_temp_users`.`id_status` = `tb_status_users`.`id`)) ;

-- --------------------------------------------------------

--
-- Estrutura para view `cnt_users`
--
DROP TABLE IF EXISTS `cnt_users`;

DROP VIEW IF EXISTS `cnt_users`;
CREATE ALGORITHM=UNDEFINED DEFINER=`u301289665_ybdownload`@`127.0.0.1` SQL SECURITY DEFINER VIEW `cnt_users`  AS SELECT `tb_users`.`id` AS `id`, `tb_users`.`name` AS `name`, `tb_users`.`login` AS `login`, `tb_users`.`email` AS `email`, `tb_users`.`password` AS `password`, `tb_users`.`id_nivel` AS `id_nivel`, `tb_users`.`acessos` AS `access`, `tb_users`.`created_at` AS `created_at`, `tb_users`.`updated_at` AS `updated_at`, `tb_access_level`.`description` AS `level_description`, `tb_access_level`.`home_path` AS `home_path`, `tb_users`.`id_status` AS `id_status`, `tb_status_users`.`status` AS `status_user` FROM ((`tb_users` join `tb_access_level` on(`tb_users`.`id_nivel` = `tb_access_level`.`id`)) join `tb_status_users` on(`tb_users`.`id_status` = `tb_status_users`.`id`)) ;

--
-- Restrições para tabelas despejadas
--

--
-- Restrições para tabelas `tb_access_modules`
--
ALTER TABLE `tb_access_modules`
  ADD CONSTRAINT `level_id` FOREIGN KEY (`level_id`) REFERENCES `tb_access_level` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `module_id` FOREIGN KEY (`module_id`) REFERENCES `tb_modules` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Restrições para tabelas `tb_active_account_users`
--
ALTER TABLE `tb_active_account_users`
  ADD CONSTRAINT `fk_id_user` FOREIGN KEY (`id_user`) REFERENCES `tb_users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `status_token` FOREIGN KEY (`status_token`) REFERENCES `tb_status_token` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Restrições para tabelas `tb_apis`
--
ALTER TABLE `tb_apis`
  ADD CONSTRAINT `fk_status_id_api` FOREIGN KEY (`status_id`) REFERENCES `tb_status_apikey` (`id`) ON UPDATE CASCADE,
  ADD CONSTRAINT `tb_apis_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `tb_users` (`id`);

--
-- Restrições para tabelas `tb_email_alarmes`
--
ALTER TABLE `tb_email_alarmes`
  ADD CONSTRAINT `id_status_email` FOREIGN KEY (`status`) REFERENCES `tb_status_email` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `id_status_verified` FOREIGN KEY (`email_verified`) REFERENCES `tb_status_token` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Restrições para tabelas `tb_events_status`
--
ALTER TABLE `tb_events_status`
  ADD CONSTRAINT `color_id` FOREIGN KEY (`color_id`) REFERENCES `tb_color` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `text_color_id` FOREIGN KEY (`text_color_id`) REFERENCES `tb_text_color` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Restrições para tabelas `tb_log`
--
ALTER TABLE `tb_log`
  ADD CONSTRAINT `fk_user_id_log` FOREIGN KEY (`id_user`) REFERENCES `tb_users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Restrições para tabelas `tb_modules`
--
ALTER TABLE `tb_modules`
  ADD CONSTRAINT `type_id` FOREIGN KEY (`type_id`) REFERENCES `tb_type_module` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Restrições para tabelas `tb_password_temp`
--
ALTER TABLE `tb_password_temp`
  ADD CONSTRAINT `id_user_` FOREIGN KEY (`id_user`) REFERENCES `tb_users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Restrições para tabelas `tb_password_temp_users`
--
ALTER TABLE `tb_password_temp_users`
  ADD CONSTRAINT `fk_password_temp_id_user` FOREIGN KEY (`id_user`) REFERENCES `tb_temp_users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Restrições para tabelas `tb_sessions_login`
--
ALTER TABLE `tb_sessions_login`
  ADD CONSTRAINT `login_session` FOREIGN KEY (`id_user`) REFERENCES `tb_users` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION;

--
-- Restrições para tabelas `tb_settings_smtp`
--
ALTER TABLE `tb_settings_smtp`
  ADD CONSTRAINT `fk_status_smtp` FOREIGN KEY (`status_id`) REFERENCES `tb_status_smtp` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `id_apikey` FOREIGN KEY (`id_apikey`) REFERENCES `tb_apis` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Restrições para tabelas `tb_users`
--
ALTER TABLE `tb_users`
  ADD CONSTRAINT `id_nivel` FOREIGN KEY (`id_nivel`) REFERENCES `tb_access_level` (`id`) ON DELETE NO ACTION ON UPDATE CASCADE,
  ADD CONSTRAINT `id_status` FOREIGN KEY (`id_status`) REFERENCES `tb_status_users` (`id`) ON DELETE NO ACTION ON UPDATE CASCADE;

--
-- Restrições para tabelas `tb_visitor`
--
ALTER TABLE `tb_visitor`
  ADD CONSTRAINT `id_user` FOREIGN KEY (`id_user`) REFERENCES `tb_users` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION;
SET FOREIGN_KEY_CHECKS=1;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
