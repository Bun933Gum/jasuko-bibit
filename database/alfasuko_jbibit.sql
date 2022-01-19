-- phpMyAdmin SQL Dump
-- version 4.9.7
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Dec 27, 2021 at 08:49 AM
-- Server version: 10.3.32-MariaDB-log-cll-lve
-- PHP Version: 7.3.33

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `alfasuko_jbibit`
--

-- --------------------------------------------------------

--
-- Table structure for table `adjustments`
--

CREATE TABLE `adjustments` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `date` date NOT NULL,
  `Ref` varchar(192) NOT NULL,
  `warehouse_id` int(11) NOT NULL,
  `items` double DEFAULT 0,
  `notes` text DEFAULT NULL,
  `created_at` timestamp(6) NULL DEFAULT NULL,
  `updated_at` timestamp(6) NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `adjustment_details`
--

CREATE TABLE `adjustment_details` (
  `id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `adjustment_id` int(11) NOT NULL,
  `product_variant_id` int(11) DEFAULT NULL,
  `quantity` double NOT NULL,
  `type` varchar(192) NOT NULL,
  `created_at` timestamp(6) NULL DEFAULT NULL,
  `updated_at` timestamp(6) NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `brands`
--

CREATE TABLE `brands` (
  `id` int(11) NOT NULL,
  `name` varchar(192) NOT NULL,
  `description` varchar(192) DEFAULT NULL,
  `image` varchar(192) DEFAULT NULL,
  `created_at` timestamp(6) NULL DEFAULT NULL,
  `updated_at` timestamp(6) NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `brands`
--

INSERT INTO `brands` (`id`, `name`, `description`, `image`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 'Alfasukomart', NULL, 'no-image.png', '2021-10-18 21:44:55.000000', '2021-10-18 21:44:55.000000', NULL),
(2, 'Alfasuko Mart', NULL, NULL, '2021-10-19 02:06:20.000000', '2021-12-06 21:57:00.000000', '2021-12-06 21:57:00'),
(3, 'UMKM Alfasukomart', NULL, '28063350KOYS.png', '2021-12-06 21:57:28.000000', '2021-12-06 21:57:28.000000', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `categories`
--

CREATE TABLE `categories` (
  `id` int(11) NOT NULL,
  `code` varchar(192) NOT NULL,
  `name` varchar(192) NOT NULL,
  `created_at` timestamp(6) NULL DEFAULT NULL,
  `updated_at` timestamp(6) NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `categories`
--

INSERT INTO `categories` (`id`, `code`, `name`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 'Sayur', 'Sayuran', '2021-10-18 21:43:15.000000', '2021-10-18 21:43:15.000000', NULL),
(2, 'Buah', 'Buah-buahan', '2021-10-18 21:43:36.000000', '2021-10-18 21:43:36.000000', NULL),
(3, 'Protein', 'Protein', '2021-10-18 21:43:49.000000', '2021-10-18 21:43:49.000000', NULL),
(4, 'Karbohidrat', 'Karbohidrat', '2021-10-18 21:43:59.000000', '2021-10-18 21:43:59.000000', NULL),
(5, 'Paket Lengkap', 'Paket Lengkap', '2021-10-18 21:44:23.000000', '2021-10-18 21:44:23.000000', NULL),
(6, 'Bumbu Dapur', 'Bumbu Dapur', '2021-10-18 21:44:35.000000', '2021-10-18 21:44:35.000000', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `clients`
--

CREATE TABLE `clients` (
  `id` int(11) NOT NULL,
  `name` varchar(191) NOT NULL,
  `code` int(11) NOT NULL,
  `email` varchar(192) NOT NULL,
  `country` varchar(191) NOT NULL,
  `city` varchar(191) NOT NULL,
  `phone` varchar(191) NOT NULL,
  `adresse` varchar(191) NOT NULL,
  `created_at` timestamp(6) NULL DEFAULT NULL,
  `updated_at` timestamp(6) NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `clients`
--

INSERT INTO `clients` (`id`, `name`, `code`, `email`, `country`, `city`, `phone`, `adresse`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 'walk-in-customer', 1, 'walk-in-customer@alfasuko.com', 'DKI Jakarta', 'Cakung', '123456780', 'Jl. Unknown', NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `currencies`
--

CREATE TABLE `currencies` (
  `id` int(11) NOT NULL,
  `code` varchar(192) NOT NULL,
  `name` varchar(192) NOT NULL,
  `symbol` varchar(192) NOT NULL,
  `created_at` timestamp(6) NULL DEFAULT NULL,
  `updated_at` timestamp(6) NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `currencies`
--

INSERT INTO `currencies` (`id`, `code`, `name`, `symbol`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 'IDR', 'Indonesian Rupiah', 'Rp. ', NULL, NULL, NULL),
(2, 'USD', 'US Dollar', '$', NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `expenses`
--

CREATE TABLE `expenses` (
  `id` int(11) NOT NULL,
  `date` date NOT NULL,
  `Ref` varchar(192) NOT NULL,
  `user_id` int(11) NOT NULL,
  `expense_category_id` int(11) NOT NULL,
  `warehouse_id` int(11) NOT NULL,
  `details` varchar(192) NOT NULL,
  `amount` double NOT NULL,
  `created_at` timestamp(6) NULL DEFAULT NULL,
  `updated_at` timestamp(6) NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `expenses`
--

INSERT INTO `expenses` (`id`, `date`, `Ref`, `user_id`, `expense_category_id`, `warehouse_id`, `details`, `amount`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, '2021-12-20', 'EXP_1111', 5, 4, 2, 'B3nqng', 1000, '2021-12-20 02:21:08.000000', '2021-12-20 02:21:08.000000', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `expense_categories`
--

CREATE TABLE `expense_categories` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `name` varchar(192) NOT NULL,
  `description` text DEFAULT NULL,
  `created_at` timestamp(6) NULL DEFAULT NULL,
  `updated_at` timestamp(6) NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `expense_categories`
--

INSERT INTO `expense_categories` (`id`, `user_id`, `name`, `description`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 1, 'Gaji Karyawan', 'Gaji Karyawan', '2021-12-20 01:30:11.000000', '2021-12-20 01:30:11.000000', NULL),
(2, 1, 'Ongkos Kirim', NULL, '2021-12-20 01:30:24.000000', '2021-12-20 01:30:24.000000', NULL),
(3, 1, 'Jasa Installasi', 'Jasa Installasi', '2021-12-20 01:31:00.000000', '2021-12-20 01:31:00.000000', NULL),
(4, 1, 'Pembelian Material', 'Pembelian Material', '2021-12-20 01:31:14.000000', '2021-12-20 01:31:14.000000', NULL),
(5, 1, 'Lain-lain', 'Lain-lain', '2021-12-20 01:31:24.000000', '2021-12-20 01:31:24.000000', NULL),
(6, 5, 'Pembelian Material', 'Pembelian Material', '2021-12-20 02:50:34.000000', '2021-12-20 02:50:34.000000', NULL),
(7, 5, 'Gaji Karyawan', 'Gaji Karyawan', '2021-12-20 02:50:58.000000', '2021-12-20 02:50:58.000000', NULL),
(8, 5, 'Ongkos Kirim', 'Ongkos Kirim', '2021-12-20 02:51:08.000000', '2021-12-20 02:51:08.000000', NULL),
(9, 5, 'Listrik / PDAM', 'Listrik / PDAM', '2021-12-20 02:51:23.000000', '2021-12-20 02:51:23.000000', NULL),
(10, 5, 'Bungkus / Kemasan', 'Bungkus / Kemasan', '2021-12-20 02:51:39.000000', '2021-12-20 02:51:39.000000', NULL),
(11, 5, 'Perbaikan Alat / Mesin', 'Perbaikan Alat / Mesin', '2021-12-20 02:52:08.000000', '2021-12-20 02:52:08.000000', NULL),
(12, 5, 'Iuran RT', 'Iuran RT atau sejenisnya', '2021-12-20 02:52:32.000000', '2021-12-20 02:52:54.000000', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(191) NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '2021_03_08_020247_create_adjustment_details_table', 1),
(2, '2021_03_08_020247_create_adjustments_table', 1),
(3, '2021_03_08_020247_create_brands_table', 1),
(4, '2021_03_08_020247_create_categories_table', 1),
(5, '2021_03_08_020247_create_clients_table', 1),
(6, '2021_03_08_020247_create_currencies_table', 1),
(7, '2021_03_08_020247_create_expense_categories_table', 1),
(8, '2021_03_08_020247_create_expenses_table', 1),
(9, '2021_03_08_020247_create_password_resets_table', 1),
(10, '2021_03_08_020247_create_payment_purchase_returns_table', 1),
(11, '2021_03_08_020247_create_payment_purchases_table', 1),
(12, '2021_03_08_020247_create_payment_sale_returns_table', 1),
(13, '2021_03_08_020247_create_payment_sales_table', 1),
(14, '2021_03_08_020247_create_payment_with_credit_card_table', 1),
(15, '2021_03_08_020247_create_permission_role_table', 1),
(16, '2021_03_08_020247_create_permissions_table', 1),
(17, '2021_03_08_020247_create_product_variants_table', 1),
(18, '2021_03_08_020247_create_product_warehouse_table', 1),
(19, '2021_03_08_020247_create_products_table', 1),
(20, '2021_03_08_020247_create_providers_table', 1),
(21, '2021_03_08_020247_create_purchase_details_table', 1),
(22, '2021_03_08_020247_create_purchase_return_details_table', 1),
(23, '2021_03_08_020247_create_purchase_returns_table', 1),
(24, '2021_03_08_020247_create_purchases_table', 1),
(25, '2021_03_08_020247_create_quotation_details_table', 1),
(26, '2021_03_08_020247_create_quotations_table', 1),
(27, '2021_03_08_020247_create_role_user_table', 1),
(28, '2021_03_08_020247_create_roles_table', 1),
(29, '2021_03_08_020247_create_sale_details_table', 1),
(30, '2021_03_08_020247_create_sale_return_details_table', 1),
(31, '2021_03_08_020247_create_sale_returns_table', 1),
(32, '2021_03_08_020247_create_sales_table', 1),
(33, '2021_03_08_020247_create_serveurs_table', 1),
(34, '2021_03_08_020247_create_settings_table', 1),
(35, '2021_03_08_020247_create_transfer_details_table', 1),
(36, '2021_03_08_020247_create_transfers_table', 1),
(37, '2021_03_08_020247_create_units_table', 1),
(38, '2021_03_08_020247_create_users_table', 1),
(39, '2021_03_08_020247_create_warehouses_table', 1),
(40, '2021_03_08_020248_add_status_to_roles_table', 1),
(41, '2021_03_08_020251_add_foreign_keys_to_adjustment_details_table', 1),
(42, '2021_03_08_020251_add_foreign_keys_to_adjustments_table', 1),
(43, '2021_03_08_020251_add_foreign_keys_to_expense_categories_table', 1),
(44, '2021_03_08_020251_add_foreign_keys_to_expenses_table', 1),
(45, '2021_03_08_020251_add_foreign_keys_to_payment_purchase_returns_table', 1),
(46, '2021_03_08_020251_add_foreign_keys_to_payment_purchases_table', 1),
(47, '2021_03_08_020251_add_foreign_keys_to_payment_sale_returns_table', 1),
(48, '2021_03_08_020251_add_foreign_keys_to_payment_sales_table', 1),
(49, '2021_03_08_020251_add_foreign_keys_to_permission_role_table', 1),
(50, '2021_03_08_020251_add_foreign_keys_to_product_variants_table', 1),
(51, '2021_03_08_020251_add_foreign_keys_to_product_warehouse_table', 1),
(52, '2021_03_08_020251_add_foreign_keys_to_products_table', 1),
(53, '2021_03_08_020251_add_foreign_keys_to_purchase_details_table', 1),
(54, '2021_03_08_020251_add_foreign_keys_to_purchase_return_details_table', 1),
(55, '2021_03_08_020251_add_foreign_keys_to_purchase_returns_table', 1),
(56, '2021_03_08_020251_add_foreign_keys_to_purchases_table', 1),
(57, '2021_03_08_020251_add_foreign_keys_to_quotation_details_table', 1),
(58, '2021_03_08_020251_add_foreign_keys_to_quotations_table', 1),
(59, '2021_03_08_020251_add_foreign_keys_to_role_user_table', 1),
(60, '2021_03_08_020251_add_foreign_keys_to_sale_details_table', 1),
(61, '2021_03_08_020251_add_foreign_keys_to_sale_return_details_table', 1),
(62, '2021_03_08_020251_add_foreign_keys_to_sale_returns_table', 1),
(63, '2021_03_08_020251_add_foreign_keys_to_sales_table', 1),
(64, '2021_03_08_020251_add_foreign_keys_to_settings_table', 1),
(65, '2021_03_08_020251_add_foreign_keys_to_transfer_details_table', 1),
(66, '2021_03_08_020251_add_foreign_keys_to_transfers_table', 1),
(67, '2021_03_08_020251_add_foreign_keys_to_units_table', 1),
(68, '2021_04_11_221536_add_footer_to_settings_table', 1),
(69, '2021_04_30_040505_add_devopped_by_to_settings', 1),
(70, '2021_05_07_140933_add_client_id_to_settings_table', 1),
(71, '2021_05_07_141034_add_warehouse_id_to_settings_table', 1),
(72, '2021_05_07_141303_add_foreign_keys_clients_to_settings', 1),
(73, '2021_07_19_141906_add_sale_unit_id_to_sale_details', 1),
(74, '2021_07_22_013045_add_sale_unit_id_to_quotation_details_table', 1),
(75, '2021_07_22_032512_add_purchase_unit_id_to_purchase_details_table', 1),
(76, '2021_07_22_052330_add_sale_unit_id_to_sale_return_details_table', 1),
(77, '2021_07_22_052447_add_purchase_unit_id_to_purchase_return_details_table', 1),
(78, '2021_07_22_052713_add_purchase_unit_id_to_transfer_details_table', 1),
(79, '2021_07_26_155038_change_cost_column_type_return_details', 1),
(80, '2021_07_30_142441_add_change_to_payment_sales', 1),
(81, '2021_07_31_122946_add_change_to_payment_purchases_table', 1),
(82, '2021_07_31_123105_add_change_to_payment_sale_returns_table', 1),
(83, '2021_07_31_123135_add_change_to_payment_purchase_returns_table', 1),
(84, '2021_09_23_003640_add_default_language_to_settings_table', 1),
(85, '2021_09_24_000547_create_pos_settings', 1),
(86, '2016_06_01_000001_create_oauth_auth_codes_table', 2),
(87, '2016_06_01_000002_create_oauth_access_tokens_table', 2),
(88, '2016_06_01_000003_create_oauth_refresh_tokens_table', 2),
(89, '2016_06_01_000004_create_oauth_clients_table', 2),
(90, '2016_06_01_000005_create_oauth_personal_access_clients_table', 2);

-- --------------------------------------------------------

--
-- Table structure for table `oauth_access_tokens`
--

CREATE TABLE `oauth_access_tokens` (
  `id` varchar(100) NOT NULL,
  `user_id` bigint(20) UNSIGNED DEFAULT NULL,
  `client_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(191) DEFAULT NULL,
  `scopes` text DEFAULT NULL,
  `revoked` tinyint(1) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `expires_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `oauth_auth_codes`
--

CREATE TABLE `oauth_auth_codes` (
  `id` varchar(100) NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `client_id` bigint(20) UNSIGNED NOT NULL,
  `scopes` text DEFAULT NULL,
  `revoked` tinyint(1) NOT NULL,
  `expires_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `oauth_clients`
--

CREATE TABLE `oauth_clients` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED DEFAULT NULL,
  `name` varchar(191) NOT NULL,
  `secret` varchar(100) DEFAULT NULL,
  `provider` varchar(191) DEFAULT NULL,
  `redirect` text NOT NULL,
  `personal_access_client` tinyint(1) NOT NULL,
  `password_client` tinyint(1) NOT NULL,
  `revoked` tinyint(1) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `oauth_clients`
--

INSERT INTO `oauth_clients` (`id`, `user_id`, `name`, `secret`, `provider`, `redirect`, `personal_access_client`, `password_client`, `revoked`, `created_at`, `updated_at`) VALUES
(1, NULL, 'Alfasukomart Personal Access Client', 'piscjs8ZRaUdzrkFKbk304t7aHuvgL5obiB8GqZd', NULL, 'http://localhost', 1, 0, 0, '2021-10-18 01:42:27', '2021-10-18 01:42:27'),
(2, NULL, 'Alfasukomart Password Grant Client', '5nbiAaceed5kiECbpFRNCJLUbBFcENFVScxzQ9hI', 'users', 'http://localhost', 0, 1, 0, '2021-10-18 01:42:27', '2021-10-18 01:42:27');

-- --------------------------------------------------------

--
-- Table structure for table `oauth_personal_access_clients`
--

CREATE TABLE `oauth_personal_access_clients` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `client_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `oauth_personal_access_clients`
--

INSERT INTO `oauth_personal_access_clients` (`id`, `client_id`, `created_at`, `updated_at`) VALUES
(1, 1, '2021-10-18 01:42:27', '2021-10-18 01:42:27');

-- --------------------------------------------------------

--
-- Table structure for table `oauth_refresh_tokens`
--

CREATE TABLE `oauth_refresh_tokens` (
  `id` varchar(100) NOT NULL,
  `access_token_id` varchar(100) NOT NULL,
  `revoked` tinyint(1) NOT NULL,
  `expires_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `password_resets`
--

CREATE TABLE `password_resets` (
  `id` int(11) NOT NULL,
  `email` varchar(191) NOT NULL,
  `token` varchar(191) NOT NULL,
  `created_at` timestamp(6) NULL DEFAULT NULL,
  `updated_at` timestamp(6) NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `payment_purchases`
--

CREATE TABLE `payment_purchases` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `date` date NOT NULL,
  `Ref` varchar(192) NOT NULL,
  `purchase_id` int(11) NOT NULL,
  `montant` double NOT NULL,
  `change` double NOT NULL DEFAULT 0,
  `Reglement` varchar(192) NOT NULL,
  `notes` text DEFAULT NULL,
  `created_at` timestamp(6) NULL DEFAULT NULL,
  `updated_at` timestamp(6) NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `payment_purchase_returns`
--

CREATE TABLE `payment_purchase_returns` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `date` date NOT NULL,
  `Ref` varchar(192) NOT NULL,
  `purchase_return_id` int(11) NOT NULL,
  `montant` double NOT NULL,
  `change` double NOT NULL DEFAULT 0,
  `Reglement` varchar(191) NOT NULL,
  `notes` text DEFAULT NULL,
  `created_at` timestamp(6) NULL DEFAULT NULL,
  `updated_at` timestamp(6) NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `payment_sales`
--

CREATE TABLE `payment_sales` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `date` date NOT NULL,
  `Ref` varchar(192) NOT NULL,
  `sale_id` int(11) NOT NULL,
  `montant` double NOT NULL,
  `change` double NOT NULL DEFAULT 0,
  `Reglement` varchar(192) NOT NULL,
  `notes` text DEFAULT NULL,
  `created_at` timestamp(6) NULL DEFAULT NULL,
  `updated_at` timestamp(6) NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `payment_sales`
--

INSERT INTO `payment_sales` (`id`, `user_id`, `date`, `Ref`, `sale_id`, `montant`, `change`, `Reglement`, `notes`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 1, '2021-10-19', 'INV/SL_1111', 1, 56000, 44000, 'Cash', NULL, '2021-10-19 02:12:29.000000', '2021-12-06 22:00:54.000000', '2021-12-06 22:00:54'),
(2, 1, '2021-10-19', 'INV/SL_1112', 2, 5000, 0, 'Cash', NULL, '2021-10-19 02:59:00.000000', '2021-12-06 22:00:54.000000', '2021-12-06 22:00:54'),
(3, 1, '2021-10-28', 'INV/SL_1113', 3, 46000, 0, 'Cash', NULL, '2021-10-27 18:59:56.000000', '2021-12-06 22:00:54.000000', '2021-12-06 22:00:54');

-- --------------------------------------------------------

--
-- Table structure for table `payment_sale_returns`
--

CREATE TABLE `payment_sale_returns` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `date` date NOT NULL,
  `Ref` varchar(192) NOT NULL,
  `sale_return_id` int(11) NOT NULL,
  `montant` double NOT NULL,
  `change` double NOT NULL DEFAULT 0,
  `Reglement` varchar(191) NOT NULL,
  `notes` text DEFAULT NULL,
  `created_at` timestamp(6) NULL DEFAULT NULL,
  `updated_at` timestamp(6) NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `payment_with_credit_card`
--

CREATE TABLE `payment_with_credit_card` (
  `id` int(11) NOT NULL,
  `payment_id` int(11) NOT NULL,
  `customer_id` int(11) NOT NULL,
  `customer_stripe_id` varchar(192) NOT NULL,
  `charge_id` varchar(192) NOT NULL,
  `created_at` timestamp(6) NULL DEFAULT NULL,
  `updated_at` timestamp(6) NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `permissions`
--

CREATE TABLE `permissions` (
  `id` int(11) NOT NULL,
  `name` varchar(192) NOT NULL,
  `label` varchar(192) DEFAULT NULL,
  `description` text DEFAULT NULL,
  `created_at` timestamp(6) NULL DEFAULT NULL,
  `updated_at` timestamp(6) NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `permissions`
--

INSERT INTO `permissions` (`id`, `name`, `label`, `description`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 'users_view', NULL, NULL, NULL, NULL, NULL),
(2, 'users_edit', NULL, NULL, NULL, NULL, NULL),
(3, 'record_view', NULL, NULL, NULL, NULL, NULL),
(4, 'users_delete', NULL, NULL, NULL, NULL, NULL),
(5, 'users_add', NULL, NULL, NULL, NULL, NULL),
(6, 'permissions_edit', NULL, NULL, NULL, NULL, NULL),
(7, 'permissions_view', NULL, NULL, NULL, NULL, NULL),
(8, 'permissions_delete', NULL, NULL, NULL, NULL, NULL),
(9, 'permissions_add', NULL, NULL, NULL, NULL, NULL),
(10, 'products_delete', NULL, NULL, NULL, NULL, NULL),
(11, 'products_view', NULL, NULL, NULL, NULL, NULL),
(12, 'barcode_view', NULL, NULL, NULL, NULL, NULL),
(13, 'products_edit', NULL, NULL, NULL, NULL, NULL),
(14, 'products_add', NULL, NULL, NULL, NULL, NULL),
(15, 'expense_add', NULL, NULL, NULL, NULL, NULL),
(16, 'expense_delete', NULL, NULL, NULL, NULL, NULL),
(17, 'expense_edit', NULL, NULL, NULL, NULL, NULL),
(18, 'expense_view', NULL, NULL, NULL, NULL, NULL),
(19, 'transfer_delete', NULL, NULL, NULL, NULL, NULL),
(20, 'transfer_add', NULL, NULL, NULL, NULL, NULL),
(21, 'transfer_view', NULL, NULL, NULL, NULL, NULL),
(22, 'transfer_edit', NULL, NULL, NULL, NULL, NULL),
(23, 'adjustment_delete', NULL, NULL, NULL, NULL, NULL),
(24, 'adjustment_add', NULL, NULL, NULL, NULL, NULL),
(25, 'adjustment_edit', NULL, NULL, NULL, NULL, NULL),
(26, 'adjustment_view', NULL, NULL, NULL, NULL, NULL),
(27, 'Sales_edit', NULL, NULL, NULL, NULL, NULL),
(28, 'Sales_view', NULL, NULL, NULL, NULL, NULL),
(29, 'Sales_delete', NULL, NULL, NULL, NULL, NULL),
(30, 'Sales_add', NULL, NULL, NULL, NULL, NULL),
(31, 'Purchases_edit', NULL, NULL, NULL, NULL, NULL),
(32, 'Purchases_view', NULL, NULL, NULL, NULL, NULL),
(33, 'Purchases_delete', NULL, NULL, NULL, NULL, NULL),
(34, 'Purchases_add', NULL, NULL, NULL, NULL, NULL),
(35, 'Quotations_edit', NULL, NULL, NULL, NULL, NULL),
(36, 'Quotations_delete', NULL, NULL, NULL, NULL, NULL),
(37, 'Quotations_add', NULL, NULL, NULL, NULL, NULL),
(38, 'Quotations_view', NULL, NULL, NULL, NULL, NULL),
(39, 'payment_sales_delete', NULL, NULL, NULL, NULL, NULL),
(40, 'payment_sales_add', NULL, NULL, NULL, NULL, NULL),
(41, 'payment_sales_edit', NULL, NULL, NULL, NULL, NULL),
(42, 'payment_sales_view', NULL, NULL, NULL, NULL, NULL),
(43, 'Purchase_Returns_delete', NULL, NULL, NULL, NULL, NULL),
(44, 'Purchase_Returns_add', NULL, NULL, NULL, NULL, NULL),
(45, 'Purchase_Returns_view', NULL, NULL, NULL, NULL, NULL),
(46, 'Purchase_Returns_edit', NULL, NULL, NULL, NULL, NULL),
(47, 'Sale_Returns_delete', NULL, NULL, NULL, NULL, NULL),
(48, 'Sale_Returns_add', NULL, NULL, NULL, NULL, NULL),
(49, 'Sale_Returns_edit', NULL, NULL, NULL, NULL, NULL),
(50, 'Sale_Returns_view', NULL, NULL, NULL, NULL, NULL),
(51, 'payment_purchases_edit', NULL, NULL, NULL, NULL, NULL),
(52, 'payment_purchases_view', NULL, NULL, NULL, NULL, NULL),
(53, 'payment_purchases_delete', NULL, NULL, NULL, NULL, NULL),
(54, 'payment_purchases_add', NULL, NULL, NULL, NULL, NULL),
(55, 'payment_returns_edit', NULL, NULL, NULL, NULL, NULL),
(56, 'payment_returns_view', NULL, NULL, NULL, NULL, NULL),
(57, 'payment_returns_delete', NULL, NULL, NULL, NULL, NULL),
(58, 'payment_returns_add', NULL, NULL, NULL, NULL, NULL),
(59, 'Customers_edit', NULL, NULL, NULL, NULL, NULL),
(60, 'Customers_view', NULL, NULL, NULL, NULL, NULL),
(61, 'Customers_delete', NULL, NULL, NULL, NULL, NULL),
(62, 'Customers_add', NULL, NULL, NULL, NULL, NULL),
(63, 'unit', NULL, NULL, NULL, NULL, NULL),
(64, 'currency', NULL, NULL, NULL, NULL, NULL),
(65, 'category', NULL, NULL, NULL, NULL, NULL),
(66, 'backup', NULL, NULL, NULL, NULL, NULL),
(67, 'warehouse', NULL, NULL, NULL, NULL, NULL),
(68, 'brand', NULL, NULL, NULL, NULL, NULL),
(69, 'setting_system', NULL, NULL, NULL, NULL, NULL),
(70, 'Warehouse_report', NULL, NULL, NULL, NULL, NULL),
(72, 'Reports_quantity_alerts', NULL, NULL, NULL, NULL, NULL),
(73, 'Reports_profit', NULL, NULL, NULL, NULL, NULL),
(74, 'Reports_suppliers', NULL, NULL, NULL, NULL, NULL),
(75, 'Reports_customers', NULL, NULL, NULL, NULL, NULL),
(76, 'Reports_purchase', NULL, NULL, NULL, NULL, NULL),
(77, 'Reports_sales', NULL, NULL, NULL, NULL, NULL),
(78, 'Reports_payments_purchase_Return', NULL, NULL, NULL, NULL, NULL),
(79, 'Reports_payments_Sale_Returns', NULL, NULL, NULL, NULL, NULL),
(80, 'Reports_payments_Purchases', NULL, NULL, NULL, NULL, NULL),
(81, 'Reports_payments_Sales', NULL, NULL, NULL, NULL, NULL),
(82, 'Suppliers_delete', NULL, NULL, NULL, NULL, NULL),
(83, 'Suppliers_add', NULL, NULL, NULL, NULL, NULL),
(84, 'Suppliers_edit', NULL, NULL, NULL, NULL, NULL),
(85, 'Suppliers_view', NULL, NULL, NULL, NULL, NULL),
(86, 'Pos_view', NULL, NULL, NULL, NULL, NULL),
(87, 'product_import', NULL, NULL, NULL, NULL, NULL),
(88, 'customers_import', NULL, NULL, NULL, NULL, NULL),
(89, 'Suppliers_import', NULL, NULL, NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `permission_role`
--

CREATE TABLE `permission_role` (
  `id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  `role_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `permission_role`
--

INSERT INTO `permission_role` (`id`, `permission_id`, `role_id`) VALUES
(1, 1, 1),
(2, 2, 1),
(3, 3, 1),
(4, 4, 1),
(5, 5, 1),
(6, 6, 1),
(7, 7, 1),
(8, 8, 1),
(9, 9, 1),
(10, 10, 1),
(11, 11, 1),
(12, 12, 1),
(13, 13, 1),
(14, 14, 1),
(15, 15, 1),
(16, 16, 1),
(17, 17, 1),
(18, 18, 1),
(19, 19, 1),
(20, 20, 1),
(21, 21, 1),
(22, 22, 1),
(23, 23, 1),
(24, 24, 1),
(25, 25, 1),
(26, 26, 1),
(27, 27, 1),
(28, 28, 1),
(29, 29, 1),
(30, 30, 1),
(31, 31, 1),
(32, 32, 1),
(33, 33, 1),
(34, 34, 1),
(35, 35, 1),
(36, 36, 1),
(37, 37, 1),
(38, 38, 1),
(39, 39, 1),
(40, 40, 1),
(41, 41, 1),
(42, 42, 1),
(43, 43, 1),
(44, 44, 1),
(45, 45, 1),
(46, 46, 1),
(47, 47, 1),
(48, 48, 1),
(49, 49, 1),
(50, 50, 1),
(51, 51, 1),
(52, 52, 1),
(53, 53, 1),
(54, 54, 1),
(55, 55, 1),
(56, 56, 1),
(57, 57, 1),
(58, 58, 1),
(59, 59, 1),
(60, 60, 1),
(61, 61, 1),
(62, 62, 1),
(63, 63, 1),
(64, 64, 1),
(65, 65, 1),
(66, 66, 1),
(67, 67, 1),
(68, 68, 1),
(69, 69, 1),
(70, 70, 1),
(72, 72, 1),
(73, 73, 1),
(74, 74, 1),
(75, 75, 1),
(76, 76, 1),
(77, 77, 1),
(78, 78, 1),
(79, 79, 1),
(80, 80, 1),
(81, 81, 1),
(82, 82, 1),
(83, 83, 1),
(84, 84, 1),
(85, 85, 1),
(86, 86, 1),
(87, 87, 1),
(88, 88, 1),
(89, 89, 1),
(90, 1, 2),
(91, 3, 2),
(92, 7, 2),
(93, 11, 2),
(94, 13, 2),
(95, 14, 2),
(96, 12, 2),
(97, 87, 2),
(98, 18, 2),
(99, 21, 2),
(100, 26, 2),
(101, 28, 2),
(102, 27, 2),
(103, 86, 2),
(104, 30, 2),
(105, 32, 2),
(106, 34, 2),
(107, 38, 2),
(108, 35, 2),
(109, 37, 2),
(110, 50, 2),
(111, 45, 2),
(112, 42, 2),
(113, 52, 2),
(114, 56, 2),
(115, 60, 2),
(116, 59, 2),
(117, 88, 2),
(118, 85, 2),
(119, 81, 2),
(120, 80, 2),
(121, 79, 2),
(122, 78, 2),
(123, 77, 2),
(124, 76, 2),
(125, 75, 2),
(126, 74, 2),
(127, 73, 2),
(128, 72, 2),
(129, 70, 2),
(130, 31, 2),
(192, 11, 4),
(193, 13, 4),
(194, 12, 4),
(195, 87, 4),
(196, 14, 4),
(197, 26, 4),
(198, 32, 4),
(199, 31, 4),
(200, 34, 4),
(201, 28, 4),
(202, 27, 4),
(203, 86, 4),
(204, 30, 4),
(205, 45, 4),
(206, 46, 4),
(207, 44, 4),
(208, 42, 4),
(209, 48, 4),
(210, 50, 4),
(211, 49, 4),
(212, 52, 4),
(213, 51, 4),
(214, 54, 4),
(215, 56, 4),
(216, 55, 4),
(217, 58, 4),
(218, 60, 4),
(219, 59, 4),
(220, 88, 4),
(221, 62, 4),
(222, 41, 4),
(223, 85, 4),
(224, 81, 4),
(225, 80, 4),
(226, 68, 4),
(227, 67, 4),
(228, 65, 4),
(229, 64, 4),
(230, 63, 4),
(231, 79, 4),
(232, 78, 4),
(233, 77, 4),
(234, 76, 4),
(235, 75, 4),
(236, 74, 4),
(237, 73, 4),
(238, 72, 4),
(239, 70, 4),
(358, 11, 5),
(359, 38, 5),
(360, 35, 5),
(361, 37, 5),
(362, 81, 5),
(363, 80, 5),
(364, 79, 5),
(365, 78, 5),
(366, 76, 5),
(367, 77, 5),
(368, 75, 5),
(369, 74, 5),
(370, 73, 5),
(371, 72, 5),
(372, 70, 5),
(373, 42, 5),
(374, 41, 5),
(375, 40, 5),
(376, 52, 5),
(377, 51, 5),
(378, 54, 5),
(379, 28, 5),
(380, 27, 5),
(381, 30, 5),
(382, 86, 5),
(383, 56, 5),
(384, 55, 5),
(385, 58, 5),
(457, 80, 3),
(458, 76, 3),
(459, 74, 3),
(460, 70, 3),
(461, 21, 3),
(462, 20, 3),
(463, 22, 3),
(464, 18, 3),
(465, 17, 3),
(466, 15, 3);

-- --------------------------------------------------------

--
-- Table structure for table `pos_settings`
--

CREATE TABLE `pos_settings` (
  `id` int(11) NOT NULL,
  `note_customer` varchar(192) NOT NULL DEFAULT 'Thank You For Shopping With Us . Please Come Again',
  `show_note` tinyint(1) NOT NULL DEFAULT 1,
  `show_barcode` tinyint(1) NOT NULL DEFAULT 1,
  `show_discount` tinyint(1) NOT NULL DEFAULT 1,
  `show_customer` tinyint(1) NOT NULL DEFAULT 1,
  `show_email` tinyint(1) NOT NULL DEFAULT 1,
  `show_phone` tinyint(1) NOT NULL DEFAULT 1,
  `show_address` tinyint(1) NOT NULL DEFAULT 1,
  `created_at` timestamp(6) NULL DEFAULT NULL,
  `updated_at` timestamp(6) NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `pos_settings`
--

INSERT INTO `pos_settings` (`id`, `note_customer`, `show_note`, `show_barcode`, `show_discount`, `show_customer`, `show_email`, `show_phone`, `show_address`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 'Terima kasih telah berbelanja bersama kami.', 1, 1, 1, 0, 0, 1, 1, NULL, '2021-10-19 02:15:58.000000', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `products`
--

CREATE TABLE `products` (
  `id` int(11) NOT NULL,
  `code` varchar(192) NOT NULL,
  `Type_barcode` varchar(192) NOT NULL,
  `name` varchar(192) NOT NULL,
  `cost` double NOT NULL,
  `price` double NOT NULL,
  `category_id` int(11) NOT NULL,
  `brand_id` int(11) DEFAULT NULL,
  `unit_id` int(11) DEFAULT NULL,
  `unit_sale_id` int(11) DEFAULT NULL,
  `unit_purchase_id` int(11) DEFAULT NULL,
  `TaxNet` double DEFAULT 0,
  `tax_method` varchar(192) DEFAULT '1',
  `image` text DEFAULT NULL,
  `note` text DEFAULT NULL,
  `stock_alert` double DEFAULT 0,
  `is_variant` tinyint(1) NOT NULL DEFAULT 0,
  `is_active` tinyint(1) DEFAULT 1,
  `created_at` timestamp(6) NULL DEFAULT NULL,
  `updated_at` timestamp(6) NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `products`
--

INSERT INTO `products` (`id`, `code`, `Type_barcode`, `name`, `cost`, `price`, `category_id`, `brand_id`, `unit_id`, `unit_sale_id`, `unit_purchase_id`, `TaxNet`, `tax_method`, `image`, `note`, `stock_alert`, `is_variant`, `is_active`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, '22346443', 'CODE128', 'Cabe Rawit Ijo ( 2k )', 1600, 2000, 6, 2, 1, 1, 1, 0, '1', 'no-image.png', '', 20, 0, 1, '2021-10-19 02:06:20.000000', '2021-12-06 21:59:38.000000', '2021-12-06 21:59:38'),
(2, '17404344', 'CODE128', 'Cabe Rawit Ijo ( 5k )', 4300, 5000, 6, 2, 1, 1, 1, 0, '1', 'no-image.png', '', 20, 0, 1, '2021-10-19 02:06:20.000000', '2021-12-06 21:59:38.000000', '2021-12-06 21:59:38'),
(3, '25740162', 'CODE128', 'Cabe Rawit Ijo ( 10k )', 8000, 10000, 6, 2, 1, 1, 1, 0, '1', 'no-image.png', '', 20, 0, 1, '2021-10-19 02:06:20.000000', '2021-12-06 21:59:33.000000', '2021-12-06 21:59:33'),
(4, '50858768', 'CODE128', 'Cabe Rawit Merah ( 2k )', 1600, 2000, 6, 2, 1, 1, 1, 0, '1', 'no-image.png', '', 20, 0, 1, '2021-10-19 02:06:20.000000', '2021-12-06 21:59:33.000000', '2021-12-06 21:59:33'),
(5, '22846492', 'CODE128', 'Cabe Rawit Merah ( 5k )', 4300, 5000, 6, 2, 1, 1, 1, 0, '1', 'no-image.png', '', 20, 0, 1, '2021-10-19 02:06:20.000000', '2021-12-06 21:59:33.000000', '2021-12-06 21:59:33'),
(6, '32058611', 'CODE128', 'Cabe Rawit Merah ( 10k )', 8000, 10000, 6, 2, 1, 1, 1, 0, '1', 'no-image.png', '', 20, 0, 1, '2021-10-19 02:06:20.000000', '2021-12-06 21:59:33.000000', '2021-12-06 21:59:33'),
(7, '76565566', 'CODE128', 'Cabe Keriting ( 2k )', 1600, 2000, 6, 2, 1, 1, 1, 0, '1', 'no-image.png', '', 20, 0, 1, '2021-10-19 02:06:20.000000', '2021-12-06 21:59:33.000000', '2021-12-06 21:59:33'),
(8, '19056403', 'CODE128', 'Cabe Keriting ( 5k )', 4300, 5000, 6, 2, 1, 1, 1, 0, '1', 'no-image.png', '', 20, 0, 1, '2021-10-19 02:06:20.000000', '2021-12-06 21:59:33.000000', '2021-12-06 21:59:33'),
(9, '50069850', 'CODE128', 'Cabe Keriting ( 10k )', 8000, 10000, 6, 2, 1, 1, 1, 0, '1', 'no-image.png', '', 20, 0, 1, '2021-10-19 02:06:20.000000', '2021-12-06 21:59:33.000000', '2021-12-06 21:59:33'),
(10, '31863182', 'CODE128', 'Bawang Merah ( 2k )', 1600, 2000, 6, 2, 1, 1, 1, 0, '1', 'no-image.png', '', 20, 0, 1, '2021-10-19 02:06:20.000000', '2021-12-06 21:59:33.000000', '2021-12-06 21:59:33'),
(11, '88749831', 'CODE128', 'Bawang Merah ( 5k )', 4300, 5000, 6, 2, 1, 1, 1, 0, '1', 'no-image.png', '', 20, 0, 1, '2021-10-19 02:06:20.000000', '2021-12-06 21:59:33.000000', '2021-12-06 21:59:33'),
(12, '37715947', 'CODE128', 'Bawang Merah ( 10k )', 8000, 10000, 6, 2, 1, 1, 1, 0, '1', 'no-image.png', '', 20, 0, 1, '2021-10-19 02:06:20.000000', '2021-12-06 21:59:25.000000', '2021-12-06 21:59:25'),
(13, '58862719', 'CODE128', 'Bawang Putih ( 2k )', 1600, 2000, 6, 2, 1, 1, 1, 0, '1', 'no-image.png', '', 20, 0, 1, '2021-10-19 02:06:20.000000', '2021-12-06 21:59:25.000000', '2021-12-06 21:59:25'),
(14, '75671250', 'CODE128', 'Bawang Putih ( 5k )', 4300, 5000, 6, 2, 1, 1, 1, 0, '1', 'no-image.png', '', 20, 0, 1, '2021-10-19 02:06:20.000000', '2021-12-06 21:59:25.000000', '2021-12-06 21:59:25'),
(15, '52423512', 'CODE128', 'Bawang Putih ( 10k )', 8000, 10000, 6, 2, 1, 1, 1, 0, '1', 'no-image.png', '', 20, 0, 1, '2021-10-19 02:06:20.000000', '2021-12-06 21:59:25.000000', '2021-12-06 21:59:25'),
(16, '66508770', 'CODE128', 'Bawang Bombay ( 5k )', 4300, 5000, 6, 2, 1, 1, 1, 0, '1', 'no-image.png', '', 20, 0, 1, '2021-10-19 02:06:20.000000', '2021-12-06 21:59:25.000000', '2021-12-06 21:59:25'),
(17, '69020614', 'CODE128', 'Daun Bawang ( 2k )', 1600, 2000, 6, 2, 1, 1, 1, 0, '1', 'no-image.png', '', 20, 0, 1, '2021-10-19 02:06:20.000000', '2021-12-06 21:59:25.000000', '2021-12-06 21:59:25'),
(18, '81810757', 'CODE128', 'Daun Bawang ( 5k )', 4300, 5000, 6, 2, 1, 1, 1, 0, '1', 'no-image.png', '', 20, 0, 1, '2021-10-19 02:06:20.000000', '2021-12-06 21:59:25.000000', '2021-12-06 21:59:25'),
(19, '71269430', 'CODE128', 'Daun Seledri ( 2k )', 1600, 2000, 6, 2, 1, 1, 1, 0, '1', 'no-image.png', '', 20, 0, 1, '2021-10-19 02:06:20.000000', '2021-12-06 21:59:25.000000', '2021-12-06 21:59:25'),
(20, '12293105', 'CODE128', 'Daun Seledri ( 5k )', 4300, 5000, 6, 2, 1, 1, 1, 0, '1', 'no-image.png', '', 20, 0, 1, '2021-10-19 02:06:20.000000', '2021-12-06 21:59:25.000000', '2021-12-06 21:59:25'),
(21, '22111001', 'EAN13', 'Koy\'s - Keripik Kentang (BBQ)', 5000, 6000, 5, 3, 1, 1, 1, 0, '1', '89942619kentang bbq.png', 'Keripik Kentang Koys Variant Rasa BBQ', 0, 0, 1, '2021-12-06 21:59:12.000000', '2021-12-10 02:00:36.000000', NULL),
(22, '22111002', 'EAN13', 'Koy\'s - Keripik Kentang (Keju)', 5000, 6000, 5, 3, 1, 1, 1, 0, '1', 'no-image.png', NULL, 0, 0, 1, '2021-12-06 22:03:26.000000', '2021-12-06 22:03:26.000000', NULL),
(23, '22111003', 'EAN13', 'Koy\'s - Keripik Kentang (Rumput Laut)', 5000, 6000, 5, 3, 1, 1, 1, 0, '1', 'no-image.png', NULL, 0, 0, 1, '2021-12-06 22:04:23.000000', '2021-12-06 22:04:23.000000', NULL),
(24, '22111004', 'EAN13', 'Koy\'s - Keripik Singkong (BBQ)', 5000, 6000, 5, 3, 1, 1, 1, 0, '1', 'no-image.png', NULL, 0, 0, 1, '2021-12-06 22:37:53.000000', '2021-12-06 22:37:53.000000', NULL),
(25, '22111005', 'EAN13', 'Koy\'s - Keripik Singkong (Keju)', 5000, 6000, 5, 3, 1, 1, 1, 0, '1', 'no-image.png', NULL, 0, 0, 1, '2021-12-06 22:42:30.000000', '2021-12-06 22:42:30.000000', NULL),
(26, '22111006', 'EAN13', 'Koy\'s - Keripik Singkong (Rumput Laut)', 5000, 6000, 5, 3, 1, 1, 1, 0, '1', 'no-image.png', NULL, 0, 0, 1, '2021-12-06 22:43:33.000000', '2021-12-06 22:43:33.000000', NULL),
(27, '22111007', 'EAN13', 'Koy\'s - Keripik Opak (BBQ)', 5000, 6000, 5, 3, 1, 1, 1, 0, '1', 'no-image.png', NULL, 0, 0, 1, '2021-12-06 22:44:25.000000', '2021-12-06 22:44:43.000000', NULL),
(28, '22111008', 'EAN13', 'Koy\'s - Keripik Opak (Keju)', 5000, 6000, 5, 3, 1, 1, 1, 0, '1', 'no-image.png', NULL, 0, 0, 1, '2021-12-06 22:45:52.000000', '2021-12-06 22:45:52.000000', NULL),
(29, '22112001', 'EAN13', 'Bawang Goreng', 45000, 50000, 1, 3, 2, 3, 3, 0, '1', 'no-image.png', NULL, 0, 0, 1, '2021-12-06 22:49:10.000000', '2021-12-06 22:49:10.000000', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `product_variants`
--

CREATE TABLE `product_variants` (
  `id` int(11) NOT NULL,
  `product_id` int(11) DEFAULT NULL,
  `name` varchar(192) DEFAULT NULL,
  `qty` decimal(8,2) DEFAULT 0.00,
  `created_at` timestamp(6) NULL DEFAULT NULL,
  `updated_at` timestamp(6) NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `product_warehouse`
--

CREATE TABLE `product_warehouse` (
  `id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `warehouse_id` int(11) NOT NULL,
  `product_variant_id` int(11) DEFAULT NULL,
  `qte` double NOT NULL,
  `created_at` timestamp(6) NULL DEFAULT NULL,
  `updated_at` timestamp(6) NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `product_warehouse`
--

INSERT INTO `product_warehouse` (`id`, `product_id`, `warehouse_id`, `product_variant_id`, `qte`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 1, 1, NULL, 0, NULL, '2021-12-06 21:59:38.000000', '2021-12-06 21:59:38'),
(2, 1, 2, NULL, 0, NULL, '2021-12-06 21:59:38.000000', '2021-12-06 21:59:38'),
(3, 1, 3, NULL, 0, NULL, '2021-12-06 21:59:38.000000', '2021-12-06 21:59:38'),
(4, 1, 4, NULL, 0, NULL, '2021-12-06 21:59:38.000000', '2021-12-06 21:59:38'),
(5, 1, 5, NULL, 517, NULL, '2021-12-06 21:59:38.000000', '2021-12-06 21:59:38'),
(6, 2, 1, NULL, 0, NULL, '2021-12-06 21:59:38.000000', '2021-12-06 21:59:38'),
(7, 2, 2, NULL, 0, NULL, '2021-12-06 21:59:38.000000', '2021-12-06 21:59:38'),
(8, 2, 3, NULL, 0, NULL, '2021-12-06 21:59:38.000000', '2021-12-06 21:59:38'),
(9, 2, 4, NULL, 0, NULL, '2021-12-06 21:59:38.000000', '2021-12-06 21:59:38'),
(10, 2, 5, NULL, 299, NULL, '2021-12-06 21:59:38.000000', '2021-12-06 21:59:38'),
(11, 3, 1, NULL, 0, NULL, '2021-12-06 21:59:33.000000', '2021-12-06 21:59:33'),
(12, 3, 2, NULL, 0, NULL, '2021-12-06 21:59:33.000000', '2021-12-06 21:59:33'),
(13, 3, 3, NULL, 0, NULL, '2021-12-06 21:59:33.000000', '2021-12-06 21:59:33'),
(14, 3, 4, NULL, 0, NULL, '2021-12-06 21:59:33.000000', '2021-12-06 21:59:33'),
(15, 3, 5, NULL, 122, NULL, '2021-12-06 21:59:33.000000', '2021-12-06 21:59:33'),
(16, 4, 1, NULL, 0, NULL, '2021-12-06 21:59:33.000000', '2021-12-06 21:59:33'),
(17, 4, 2, NULL, 0, NULL, '2021-12-06 21:59:33.000000', '2021-12-06 21:59:33'),
(18, 4, 3, NULL, 0, NULL, '2021-12-06 21:59:33.000000', '2021-12-06 21:59:33'),
(19, 4, 4, NULL, 0, NULL, '2021-12-06 21:59:33.000000', '2021-12-06 21:59:33'),
(20, 4, 5, NULL, 407, NULL, '2021-12-06 21:59:33.000000', '2021-12-06 21:59:33'),
(21, 5, 1, NULL, 0, NULL, '2021-12-06 21:59:33.000000', '2021-12-06 21:59:33'),
(22, 5, 2, NULL, 0, NULL, '2021-12-06 21:59:33.000000', '2021-12-06 21:59:33'),
(23, 5, 3, NULL, 0, NULL, '2021-12-06 21:59:33.000000', '2021-12-06 21:59:33'),
(24, 5, 4, NULL, 0, NULL, '2021-12-06 21:59:33.000000', '2021-12-06 21:59:33'),
(25, 5, 5, NULL, 298, NULL, '2021-12-06 21:59:33.000000', '2021-12-06 21:59:33'),
(26, 6, 1, NULL, 0, NULL, '2021-12-06 21:59:33.000000', '2021-12-06 21:59:33'),
(27, 6, 2, NULL, 0, NULL, '2021-12-06 21:59:33.000000', '2021-12-06 21:59:33'),
(28, 6, 3, NULL, 0, NULL, '2021-12-06 21:59:33.000000', '2021-12-06 21:59:33'),
(29, 6, 4, NULL, 0, NULL, '2021-12-06 21:59:33.000000', '2021-12-06 21:59:33'),
(30, 6, 5, NULL, 146, NULL, '2021-12-06 21:59:33.000000', '2021-12-06 21:59:33'),
(31, 7, 1, NULL, 0, NULL, '2021-12-06 21:59:33.000000', '2021-12-06 21:59:33'),
(32, 7, 2, NULL, 0, NULL, '2021-12-06 21:59:33.000000', '2021-12-06 21:59:33'),
(33, 7, 3, NULL, 0, NULL, '2021-12-06 21:59:33.000000', '2021-12-06 21:59:33'),
(34, 7, 4, NULL, 0, NULL, '2021-12-06 21:59:33.000000', '2021-12-06 21:59:33'),
(35, 7, 5, NULL, 0, NULL, '2021-12-06 21:59:33.000000', '2021-12-06 21:59:33'),
(36, 8, 1, NULL, 0, NULL, '2021-12-06 21:59:33.000000', '2021-12-06 21:59:33'),
(37, 8, 2, NULL, 0, NULL, '2021-12-06 21:59:33.000000', '2021-12-06 21:59:33'),
(38, 8, 3, NULL, 0, NULL, '2021-12-06 21:59:33.000000', '2021-12-06 21:59:33'),
(39, 8, 4, NULL, 0, NULL, '2021-12-06 21:59:33.000000', '2021-12-06 21:59:33'),
(40, 8, 5, NULL, 0, NULL, '2021-12-06 21:59:33.000000', '2021-12-06 21:59:33'),
(41, 9, 1, NULL, 0, NULL, '2021-12-06 21:59:33.000000', '2021-12-06 21:59:33'),
(42, 9, 2, NULL, 0, NULL, '2021-12-06 21:59:33.000000', '2021-12-06 21:59:33'),
(43, 9, 3, NULL, 0, NULL, '2021-12-06 21:59:33.000000', '2021-12-06 21:59:33'),
(44, 9, 4, NULL, 0, NULL, '2021-12-06 21:59:33.000000', '2021-12-06 21:59:33'),
(45, 9, 5, NULL, 0, NULL, '2021-12-06 21:59:33.000000', '2021-12-06 21:59:33'),
(46, 10, 1, NULL, 0, NULL, '2021-12-06 21:59:33.000000', '2021-12-06 21:59:33'),
(47, 10, 2, NULL, 0, NULL, '2021-12-06 21:59:33.000000', '2021-12-06 21:59:33'),
(48, 10, 3, NULL, 0, NULL, '2021-12-06 21:59:33.000000', '2021-12-06 21:59:33'),
(49, 10, 4, NULL, 0, NULL, '2021-12-06 21:59:33.000000', '2021-12-06 21:59:33'),
(50, 10, 5, NULL, 0, NULL, '2021-12-06 21:59:33.000000', '2021-12-06 21:59:33'),
(51, 11, 1, NULL, 0, NULL, '2021-12-06 21:59:33.000000', '2021-12-06 21:59:33'),
(52, 11, 2, NULL, 0, NULL, '2021-12-06 21:59:33.000000', '2021-12-06 21:59:33'),
(53, 11, 3, NULL, 0, NULL, '2021-12-06 21:59:33.000000', '2021-12-06 21:59:33'),
(54, 11, 4, NULL, 0, NULL, '2021-12-06 21:59:33.000000', '2021-12-06 21:59:33'),
(55, 11, 5, NULL, 0, NULL, '2021-12-06 21:59:33.000000', '2021-12-06 21:59:33'),
(56, 12, 1, NULL, 0, NULL, '2021-12-06 21:59:25.000000', '2021-12-06 21:59:25'),
(57, 12, 2, NULL, 0, NULL, '2021-12-06 21:59:25.000000', '2021-12-06 21:59:25'),
(58, 12, 3, NULL, 0, NULL, '2021-12-06 21:59:25.000000', '2021-12-06 21:59:25'),
(59, 12, 4, NULL, 0, NULL, '2021-12-06 21:59:25.000000', '2021-12-06 21:59:25'),
(60, 12, 5, NULL, 0, NULL, '2021-12-06 21:59:25.000000', '2021-12-06 21:59:25'),
(61, 13, 1, NULL, 0, NULL, '2021-12-06 21:59:25.000000', '2021-12-06 21:59:25'),
(62, 13, 2, NULL, 0, NULL, '2021-12-06 21:59:25.000000', '2021-12-06 21:59:25'),
(63, 13, 3, NULL, 0, NULL, '2021-12-06 21:59:25.000000', '2021-12-06 21:59:25'),
(64, 13, 4, NULL, 0, NULL, '2021-12-06 21:59:25.000000', '2021-12-06 21:59:25'),
(65, 13, 5, NULL, 0, NULL, '2021-12-06 21:59:25.000000', '2021-12-06 21:59:25'),
(66, 14, 1, NULL, 0, NULL, '2021-12-06 21:59:25.000000', '2021-12-06 21:59:25'),
(67, 14, 2, NULL, 0, NULL, '2021-12-06 21:59:25.000000', '2021-12-06 21:59:25'),
(68, 14, 3, NULL, 0, NULL, '2021-12-06 21:59:25.000000', '2021-12-06 21:59:25'),
(69, 14, 4, NULL, 0, NULL, '2021-12-06 21:59:25.000000', '2021-12-06 21:59:25'),
(70, 14, 5, NULL, 0, NULL, '2021-12-06 21:59:25.000000', '2021-12-06 21:59:25'),
(71, 15, 1, NULL, 0, NULL, '2021-12-06 21:59:25.000000', '2021-12-06 21:59:25'),
(72, 15, 2, NULL, 0, NULL, '2021-12-06 21:59:25.000000', '2021-12-06 21:59:25'),
(73, 15, 3, NULL, 0, NULL, '2021-12-06 21:59:25.000000', '2021-12-06 21:59:25'),
(74, 15, 4, NULL, 0, NULL, '2021-12-06 21:59:25.000000', '2021-12-06 21:59:25'),
(75, 15, 5, NULL, 0, NULL, '2021-12-06 21:59:25.000000', '2021-12-06 21:59:25'),
(76, 16, 1, NULL, 0, NULL, '2021-12-06 21:59:25.000000', '2021-12-06 21:59:25'),
(77, 16, 2, NULL, 0, NULL, '2021-12-06 21:59:25.000000', '2021-12-06 21:59:25'),
(78, 16, 3, NULL, 0, NULL, '2021-12-06 21:59:25.000000', '2021-12-06 21:59:25'),
(79, 16, 4, NULL, 0, NULL, '2021-12-06 21:59:25.000000', '2021-12-06 21:59:25'),
(80, 16, 5, NULL, 0, NULL, '2021-12-06 21:59:25.000000', '2021-12-06 21:59:25'),
(81, 17, 1, NULL, 0, NULL, '2021-12-06 21:59:25.000000', '2021-12-06 21:59:25'),
(82, 17, 2, NULL, 0, NULL, '2021-12-06 21:59:25.000000', '2021-12-06 21:59:25'),
(83, 17, 3, NULL, 0, NULL, '2021-12-06 21:59:25.000000', '2021-12-06 21:59:25'),
(84, 17, 4, NULL, 0, NULL, '2021-12-06 21:59:25.000000', '2021-12-06 21:59:25'),
(85, 17, 5, NULL, 0, NULL, '2021-12-06 21:59:25.000000', '2021-12-06 21:59:25'),
(86, 18, 1, NULL, 0, NULL, '2021-12-06 21:59:25.000000', '2021-12-06 21:59:25'),
(87, 18, 2, NULL, 0, NULL, '2021-12-06 21:59:25.000000', '2021-12-06 21:59:25'),
(88, 18, 3, NULL, 0, NULL, '2021-12-06 21:59:25.000000', '2021-12-06 21:59:25'),
(89, 18, 4, NULL, 0, NULL, '2021-12-06 21:59:25.000000', '2021-12-06 21:59:25'),
(90, 18, 5, NULL, 0, NULL, '2021-12-06 21:59:25.000000', '2021-12-06 21:59:25'),
(91, 19, 1, NULL, 0, NULL, '2021-12-06 21:59:25.000000', '2021-12-06 21:59:25'),
(92, 19, 2, NULL, 0, NULL, '2021-12-06 21:59:25.000000', '2021-12-06 21:59:25'),
(93, 19, 3, NULL, 0, NULL, '2021-12-06 21:59:25.000000', '2021-12-06 21:59:25'),
(94, 19, 4, NULL, 0, NULL, '2021-12-06 21:59:25.000000', '2021-12-06 21:59:25'),
(95, 19, 5, NULL, 0, NULL, '2021-12-06 21:59:25.000000', '2021-12-06 21:59:25'),
(96, 20, 1, NULL, 0, NULL, '2021-12-06 21:59:25.000000', '2021-12-06 21:59:25'),
(97, 20, 2, NULL, 0, NULL, '2021-12-06 21:59:25.000000', '2021-12-06 21:59:25'),
(98, 20, 3, NULL, 0, NULL, '2021-12-06 21:59:25.000000', '2021-12-06 21:59:25'),
(99, 20, 4, NULL, 0, NULL, '2021-12-06 21:59:25.000000', '2021-12-06 21:59:25'),
(100, 20, 5, NULL, 0, NULL, '2021-12-06 21:59:25.000000', '2021-12-06 21:59:25'),
(101, 21, 1, NULL, 5, NULL, '2021-12-10 01:57:35.000000', NULL),
(102, 21, 2, NULL, 0, NULL, NULL, NULL),
(103, 21, 3, NULL, 0, NULL, NULL, NULL),
(104, 21, 4, NULL, 0, NULL, NULL, NULL),
(105, 21, 5, NULL, 0, NULL, NULL, NULL),
(106, 22, 1, NULL, 0, NULL, NULL, NULL),
(107, 22, 2, NULL, 0, NULL, NULL, NULL),
(108, 22, 3, NULL, 0, NULL, NULL, NULL),
(109, 22, 4, NULL, 0, NULL, NULL, NULL),
(110, 22, 5, NULL, 0, NULL, NULL, NULL),
(111, 23, 1, NULL, 0, NULL, NULL, NULL),
(112, 23, 2, NULL, 0, NULL, NULL, NULL),
(113, 23, 3, NULL, 0, NULL, NULL, NULL),
(114, 23, 4, NULL, 0, NULL, NULL, NULL),
(115, 23, 5, NULL, 0, NULL, NULL, NULL),
(116, 24, 1, NULL, 0, NULL, NULL, NULL),
(117, 24, 2, NULL, 0, NULL, NULL, NULL),
(118, 24, 3, NULL, 0, NULL, NULL, NULL),
(119, 24, 4, NULL, 0, NULL, NULL, NULL),
(120, 24, 5, NULL, 0, NULL, NULL, NULL),
(121, 25, 1, NULL, 0, NULL, NULL, NULL),
(122, 25, 2, NULL, 0, NULL, NULL, NULL),
(123, 25, 3, NULL, 0, NULL, NULL, NULL),
(124, 25, 4, NULL, 0, NULL, NULL, NULL),
(125, 25, 5, NULL, 0, NULL, NULL, NULL),
(126, 26, 1, NULL, 0, NULL, NULL, NULL),
(127, 26, 2, NULL, 0, NULL, NULL, NULL),
(128, 26, 3, NULL, 0, NULL, NULL, NULL),
(129, 26, 4, NULL, 0, NULL, NULL, NULL),
(130, 26, 5, NULL, 0, NULL, NULL, NULL),
(131, 27, 1, NULL, 0, NULL, NULL, NULL),
(132, 27, 2, NULL, 0, NULL, NULL, NULL),
(133, 27, 3, NULL, 0, NULL, NULL, NULL),
(134, 27, 4, NULL, 0, NULL, NULL, NULL),
(135, 27, 5, NULL, 0, NULL, NULL, NULL),
(136, 28, 1, NULL, 0, NULL, NULL, NULL),
(137, 28, 2, NULL, 0, NULL, NULL, NULL),
(138, 28, 3, NULL, 0, NULL, NULL, NULL),
(139, 28, 4, NULL, 0, NULL, NULL, NULL),
(140, 28, 5, NULL, 0, NULL, NULL, NULL),
(141, 29, 1, NULL, 0, NULL, NULL, NULL),
(142, 29, 2, NULL, 0, NULL, NULL, NULL),
(143, 29, 3, NULL, 0, NULL, NULL, NULL),
(144, 29, 4, NULL, 0, NULL, NULL, NULL),
(145, 29, 5, NULL, 0, NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `providers`
--

CREATE TABLE `providers` (
  `id` int(11) NOT NULL,
  `name` varchar(191) NOT NULL,
  `code` int(11) NOT NULL,
  `email` varchar(192) NOT NULL,
  `phone` varchar(192) NOT NULL,
  `country` varchar(191) NOT NULL,
  `city` varchar(191) NOT NULL,
  `adresse` varchar(191) NOT NULL,
  `created_at` timestamp(6) NULL DEFAULT NULL,
  `updated_at` timestamp(6) NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `providers`
--

INSERT INTO `providers` (`id`, `name`, `code`, `email`, `phone`, `country`, `city`, `adresse`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 'PT. Alfasuko Rekayasa Industri', 1, 'purchasing@alfasuko.com', '62691236128', 'Cipinang', 'DKI Jakarta', 'Jl. Cipinang Indah Raya No. 1', '2021-10-19 02:07:40.000000', '2021-10-19 02:07:40.000000', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `purchases`
--

CREATE TABLE `purchases` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `Ref` varchar(192) NOT NULL,
  `date` date NOT NULL,
  `provider_id` int(11) NOT NULL,
  `warehouse_id` int(11) NOT NULL,
  `tax_rate` double DEFAULT 0,
  `TaxNet` double DEFAULT 0,
  `discount` double DEFAULT 0,
  `shipping` double DEFAULT 0,
  `GrandTotal` double NOT NULL,
  `paid_amount` double NOT NULL DEFAULT 0,
  `statut` varchar(191) NOT NULL,
  `payment_statut` varchar(192) NOT NULL,
  `notes` text DEFAULT NULL,
  `created_at` timestamp(6) NULL DEFAULT NULL,
  `updated_at` timestamp(6) NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `purchases`
--

INSERT INTO `purchases` (`id`, `user_id`, `Ref`, `date`, `provider_id`, `warehouse_id`, `tax_rate`, `TaxNet`, `discount`, `shipping`, `GrandTotal`, `paid_amount`, `statut`, `payment_statut`, `notes`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 1, 'PR_1111', '2021-10-19', 1, 5, 0, 0, 0, 500000, 6776000, 0, 'received', 'unpaid', NULL, '2021-10-19 02:11:35.000000', '2021-12-06 22:00:32.000000', '2021-12-06 22:00:32'),
(2, 1, 'PR_1112', '2021-12-10', 1, 1, 0, 0, 0, 0, 25000, 0, 'received', 'unpaid', NULL, '2021-12-10 01:57:35.000000', '2021-12-10 01:57:35.000000', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `purchase_details`
--

CREATE TABLE `purchase_details` (
  `id` int(11) NOT NULL,
  `cost` double NOT NULL,
  `purchase_unit_id` int(11) DEFAULT NULL,
  `TaxNet` double DEFAULT 0,
  `tax_method` varchar(192) DEFAULT '1',
  `discount` double DEFAULT 0,
  `discount_method` varchar(192) DEFAULT '1',
  `purchase_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `product_variant_id` int(11) DEFAULT NULL,
  `total` double NOT NULL,
  `quantity` double NOT NULL,
  `created_at` timestamp(6) NULL DEFAULT NULL,
  `updated_at` timestamp(6) NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `purchase_details`
--

INSERT INTO `purchase_details` (`id`, `cost`, `purchase_unit_id`, `TaxNet`, `tax_method`, `discount`, `discount_method`, `purchase_id`, `product_id`, `product_variant_id`, `total`, `quantity`, `created_at`, `updated_at`) VALUES
(7, 5000, 1, 0, '1', 0, '2', 2, 21, NULL, 25000, 5, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `purchase_returns`
--

CREATE TABLE `purchase_returns` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `date` date NOT NULL,
  `Ref` varchar(192) NOT NULL,
  `provider_id` int(11) NOT NULL,
  `warehouse_id` int(11) NOT NULL,
  `tax_rate` double DEFAULT 0,
  `TaxNet` double DEFAULT 0,
  `discount` double DEFAULT 0,
  `shipping` double DEFAULT 0,
  `GrandTotal` double NOT NULL,
  `paid_amount` double NOT NULL DEFAULT 0,
  `payment_statut` varchar(192) NOT NULL,
  `statut` varchar(192) NOT NULL,
  `notes` text DEFAULT NULL,
  `created_at` timestamp(6) NULL DEFAULT NULL,
  `updated_at` timestamp(6) NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `purchase_return_details`
--

CREATE TABLE `purchase_return_details` (
  `id` int(11) NOT NULL,
  `cost` decimal(16,3) NOT NULL,
  `purchase_unit_id` int(11) DEFAULT NULL,
  `TaxNet` double DEFAULT 0,
  `tax_method` varchar(192) DEFAULT '1',
  `discount` double DEFAULT 0,
  `discount_method` varchar(192) DEFAULT '1',
  `total` double NOT NULL,
  `quantity` double NOT NULL,
  `purchase_return_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `product_variant_id` int(11) DEFAULT NULL,
  `created_at` timestamp(6) NULL DEFAULT NULL,
  `updated_at` timestamp(6) NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `quotations`
--

CREATE TABLE `quotations` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `date` date NOT NULL,
  `Ref` varchar(192) NOT NULL,
  `client_id` int(11) NOT NULL,
  `warehouse_id` int(11) NOT NULL,
  `tax_rate` double DEFAULT 0,
  `TaxNet` double DEFAULT 0,
  `discount` double DEFAULT 0,
  `shipping` double DEFAULT 0,
  `GrandTotal` double NOT NULL,
  `statut` varchar(192) NOT NULL,
  `notes` text DEFAULT NULL,
  `created_at` timestamp(6) NULL DEFAULT NULL,
  `updated_at` timestamp(6) NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `quotation_details`
--

CREATE TABLE `quotation_details` (
  `id` int(11) NOT NULL,
  `price` double NOT NULL,
  `sale_unit_id` int(11) DEFAULT NULL,
  `TaxNet` double DEFAULT 0,
  `tax_method` varchar(192) DEFAULT '1',
  `discount` double DEFAULT 0,
  `discount_method` varchar(192) DEFAULT '1',
  `total` double NOT NULL,
  `quantity` double NOT NULL,
  `product_id` int(11) NOT NULL,
  `product_variant_id` int(11) DEFAULT NULL,
  `quotation_id` int(11) NOT NULL,
  `created_at` timestamp(6) NULL DEFAULT NULL,
  `updated_at` timestamp(6) NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `roles`
--

CREATE TABLE `roles` (
  `id` int(11) NOT NULL,
  `name` varchar(192) NOT NULL,
  `label` varchar(192) DEFAULT NULL,
  `description` text DEFAULT NULL,
  `created_at` timestamp(6) NULL DEFAULT NULL,
  `updated_at` timestamp(6) NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `status` int(11) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `roles`
--

INSERT INTO `roles` (`id`, `name`, `label`, `description`, `created_at`, `updated_at`, `deleted_at`, `status`) VALUES
(1, 'Owner', 'Owner', 'Owner', NULL, NULL, NULL, 1),
(2, 'Pemilik', 'Pemilik', 'Pemilik', '2021-10-18 21:33:27.000000', '2021-10-18 21:33:27.000000', NULL, 0),
(3, 'Purchasing', 'Purchasing', 'Purchasing', '2021-10-18 21:35:25.000000', '2021-12-20 02:49:15.000000', NULL, 0),
(4, 'Kasir', 'Kasir', 'Kasir', '2021-10-18 21:37:34.000000', '2021-10-18 21:37:34.000000', NULL, 0),
(5, 'Marketing', 'Marketing', 'Marketing', '2021-12-20 01:35:23.000000', '2021-12-20 01:43:59.000000', NULL, 0);

-- --------------------------------------------------------

--
-- Table structure for table `role_user`
--

CREATE TABLE `role_user` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `role_id` int(11) NOT NULL,
  `created_at` timestamp(6) NULL DEFAULT NULL,
  `updated_at` timestamp(6) NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `role_user`
--

INSERT INTO `role_user` (`id`, `user_id`, `role_id`, `created_at`, `updated_at`) VALUES
(1, 1, 1, NULL, NULL),
(2, 3, 3, '2021-10-19 02:08:30.000000', '2021-10-19 02:08:30.000000'),
(3, 4, 4, '2021-10-19 02:09:05.000000', '2021-10-19 02:09:05.000000'),
(4, 5, 3, '2021-12-20 01:33:14.000000', '2021-12-20 01:33:14.000000'),
(5, 6, 5, '2021-12-20 01:35:56.000000', '2021-12-20 01:35:56.000000'),
(6, 7, 3, '2021-12-22 22:22:53.000000', '2021-12-22 22:22:53.000000'),
(7, 8, 5, '2021-12-22 22:24:01.000000', '2021-12-22 22:24:01.000000');

-- --------------------------------------------------------

--
-- Table structure for table `sales`
--

CREATE TABLE `sales` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `date` date NOT NULL,
  `Ref` varchar(192) NOT NULL,
  `is_pos` tinyint(1) DEFAULT 0,
  `client_id` int(11) NOT NULL,
  `warehouse_id` int(11) NOT NULL,
  `tax_rate` double DEFAULT 0,
  `TaxNet` double DEFAULT 0,
  `discount` double DEFAULT 0,
  `shipping` double DEFAULT 0,
  `GrandTotal` double NOT NULL DEFAULT 0,
  `paid_amount` double NOT NULL DEFAULT 0,
  `payment_statut` varchar(192) NOT NULL,
  `statut` varchar(191) NOT NULL,
  `notes` text DEFAULT NULL,
  `created_at` timestamp(6) NULL DEFAULT NULL,
  `updated_at` timestamp(6) NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `sales`
--

INSERT INTO `sales` (`id`, `user_id`, `date`, `Ref`, `is_pos`, `client_id`, `warehouse_id`, `tax_rate`, `TaxNet`, `discount`, `shipping`, `GrandTotal`, `paid_amount`, `payment_statut`, `statut`, `notes`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 1, '2021-10-19', 'SL_1111', 1, 1, 5, 0, 0, 0, 0, 56000, 56000, 'paid', 'completed', NULL, '2021-10-19 02:12:28.000000', '2021-12-06 22:00:54.000000', '2021-12-06 22:00:54'),
(2, 1, '2021-10-19', 'SL_1112', 1, 1, 5, 0, 0, 0, 0, 5000, 5000, 'paid', 'completed', NULL, '2021-10-19 02:59:00.000000', '2021-12-06 22:00:54.000000', '2021-12-06 22:00:54'),
(3, 1, '2021-10-28', 'SL_1113', 1, 1, 5, 0, 0, 0, 0, 46000, 46000, 'paid', 'completed', NULL, '2021-10-27 18:59:56.000000', '2021-12-06 22:00:54.000000', '2021-12-06 22:00:54');

-- --------------------------------------------------------

--
-- Table structure for table `sale_details`
--

CREATE TABLE `sale_details` (
  `id` int(11) NOT NULL,
  `date` date NOT NULL,
  `sale_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `product_variant_id` int(11) DEFAULT NULL,
  `price` double NOT NULL,
  `sale_unit_id` int(11) DEFAULT NULL,
  `TaxNet` double DEFAULT NULL,
  `tax_method` varchar(192) DEFAULT '1',
  `discount` double DEFAULT NULL,
  `discount_method` varchar(192) DEFAULT '1',
  `total` double NOT NULL,
  `quantity` double NOT NULL,
  `created_at` timestamp(6) NULL DEFAULT NULL,
  `updated_at` timestamp(6) NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `sale_returns`
--

CREATE TABLE `sale_returns` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `date` date NOT NULL,
  `Ref` varchar(192) NOT NULL,
  `client_id` int(11) NOT NULL,
  `warehouse_id` int(11) NOT NULL,
  `tax_rate` double DEFAULT 0,
  `TaxNet` double DEFAULT 0,
  `discount` double DEFAULT 0,
  `shipping` double DEFAULT 0,
  `GrandTotal` double NOT NULL,
  `paid_amount` double NOT NULL DEFAULT 0,
  `payment_statut` varchar(192) NOT NULL,
  `statut` varchar(192) NOT NULL,
  `notes` text DEFAULT NULL,
  `created_at` timestamp(6) NULL DEFAULT NULL,
  `updated_at` timestamp(6) NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `sale_return_details`
--

CREATE TABLE `sale_return_details` (
  `id` int(11) NOT NULL,
  `sale_return_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `price` double NOT NULL,
  `sale_unit_id` int(11) DEFAULT NULL,
  `TaxNet` double DEFAULT 0,
  `tax_method` varchar(192) DEFAULT '1',
  `discount` double DEFAULT 0,
  `discount_method` varchar(192) DEFAULT '1',
  `product_variant_id` int(11) DEFAULT NULL,
  `quantity` double NOT NULL,
  `total` double NOT NULL,
  `created_at` timestamp(6) NULL DEFAULT NULL,
  `updated_at` timestamp(6) NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `servers`
--

CREATE TABLE `servers` (
  `id` int(11) NOT NULL,
  `host` varchar(191) NOT NULL,
  `port` int(11) NOT NULL,
  `username` varchar(191) NOT NULL,
  `password` varchar(191) NOT NULL,
  `encryption` varchar(191) NOT NULL,
  `created_at` timestamp(6) NULL DEFAULT NULL,
  `updated_at` timestamp(6) NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `servers`
--

INSERT INTO `servers` (`id`, `host`, `port`, `username`, `password`, `encryption`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 'mailtrap.io', 2525, 'test', 'test', 'tls', NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `settings`
--

CREATE TABLE `settings` (
  `id` int(11) NOT NULL,
  `email` varchar(191) NOT NULL,
  `currency_id` int(11) DEFAULT NULL,
  `CompanyName` varchar(191) NOT NULL,
  `CompanyPhone` varchar(191) NOT NULL,
  `CompanyAdress` varchar(191) NOT NULL,
  `logo` varchar(191) DEFAULT NULL,
  `created_at` timestamp(6) NULL DEFAULT NULL,
  `updated_at` timestamp(6) NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `footer` varchar(192) NOT NULL DEFAULT 'Stocky - Ultimate Inventory With POS',
  `developed_by` varchar(192) NOT NULL DEFAULT 'Stocky',
  `client_id` int(11) DEFAULT NULL,
  `warehouse_id` int(11) DEFAULT NULL,
  `default_language` varchar(192) NOT NULL DEFAULT 'en'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `settings`
--

INSERT INTO `settings` (`id`, `email`, `currency_id`, `CompanyName`, `CompanyPhone`, `CompanyAdress`, `logo`, `created_at`, `updated_at`, `deleted_at`, `footer`, `developed_by`, `client_id`, `warehouse_id`, `default_language`) VALUES
(1, 'vhanz@qq.com', 1, 'Jasuko Coffee', '6281311884336', 'Jl. Cipinang Indah Raya No. 1', '41997309jasuko200.png', NULL, '2021-12-22 23:26:13.000000', NULL, 'Jasuko Coffee - Kopi', 'Jasuko Coffee - Kopi', 1, NULL, 'Ind');

-- --------------------------------------------------------

--
-- Table structure for table `transfers`
--

CREATE TABLE `transfers` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `Ref` varchar(192) NOT NULL,
  `date` date NOT NULL,
  `from_warehouse_id` int(11) NOT NULL,
  `to_warehouse_id` int(11) NOT NULL,
  `items` double NOT NULL,
  `tax_rate` double DEFAULT 0,
  `TaxNet` double DEFAULT 0,
  `discount` double DEFAULT 0,
  `shipping` double DEFAULT 0,
  `GrandTotal` double NOT NULL DEFAULT 0,
  `statut` varchar(192) NOT NULL,
  `notes` text DEFAULT NULL,
  `created_at` timestamp(6) NULL DEFAULT NULL,
  `updated_at` timestamp(6) NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `transfer_details`
--

CREATE TABLE `transfer_details` (
  `id` int(11) NOT NULL,
  `transfer_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `product_variant_id` int(11) DEFAULT NULL,
  `cost` double NOT NULL,
  `purchase_unit_id` int(11) DEFAULT NULL,
  `TaxNet` double DEFAULT NULL,
  `tax_method` varchar(192) DEFAULT '1',
  `discount` double DEFAULT NULL,
  `discount_method` varchar(192) DEFAULT '1',
  `quantity` double NOT NULL,
  `total` double NOT NULL,
  `created_at` timestamp(6) NULL DEFAULT NULL,
  `updated_at` timestamp(6) NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `units`
--

CREATE TABLE `units` (
  `id` int(11) NOT NULL,
  `name` varchar(192) NOT NULL,
  `ShortName` varchar(192) NOT NULL,
  `base_unit` int(11) DEFAULT NULL,
  `operator` char(192) DEFAULT '*',
  `operator_value` double DEFAULT 1,
  `created_at` timestamp(6) NULL DEFAULT NULL,
  `updated_at` timestamp(6) NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `units`
--

INSERT INTO `units` (`id`, `name`, `ShortName`, `base_unit`, `operator`, `operator_value`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 'Bungkus', 'Bks', NULL, '*', 1, '2021-10-18 21:45:21.000000', '2021-10-18 21:45:21.000000', NULL),
(2, 'Gram', 'Gr', NULL, '*', 1, '2021-10-18 21:45:50.000000', '2021-10-18 21:45:50.000000', NULL),
(3, 'Kilogram', 'Kg', 2, '/', 1000, '2021-10-18 21:46:14.000000', '2021-10-18 21:46:14.000000', NULL),
(4, 'Kaleng', 'Klg', NULL, '*', 1, '2021-10-18 21:46:34.000000', '2021-10-18 21:46:34.000000', NULL),
(5, 'Box', 'Box', NULL, '*', 1, '2021-10-18 21:46:43.000000', '2021-10-18 21:46:43.000000', NULL),
(6, 'Lusin', 'Lusin', 1, '*', 12, '2021-10-18 21:47:13.000000', '2021-10-18 21:47:13.000000', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `firstname` varchar(191) NOT NULL,
  `lastname` varchar(191) NOT NULL,
  `username` varchar(192) NOT NULL,
  `email` varchar(192) NOT NULL,
  `password` varchar(191) NOT NULL,
  `avatar` varchar(191) DEFAULT NULL,
  `phone` varchar(192) NOT NULL,
  `role_id` int(11) NOT NULL,
  `statut` tinyint(1) NOT NULL DEFAULT 1,
  `created_at` timestamp(6) NULL DEFAULT NULL,
  `updated_at` timestamp(6) NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `firstname`, `lastname`, `username`, `email`, `password`, `avatar`, `phone`, `role_id`, `statut`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 'Administrator', 'Zakaria', 'Admin', 'vhanz@qq.com', '$2y$10$k06iPsJbWdY9NhNI2AwiQubzM8W068cNUeSx/Kn9HBsXppZMuZNLO', '39775214KOYS.png', '6281311884336', 1, 1, NULL, '2021-12-10 00:39:12.000000', NULL),
(2, 'Mr.', 'Sukoyo', 'Sukoyo', 'sukoyo@alfasuko.com', '$2y$10$nbo8CdyPoFxl76m.Mxe0veMg/5qrdgbauWDzCaRvL.5CkCsHA.9aG', 'no_avatar.png', '0123456789', 2, 1, NULL, '2021-12-12 18:57:16.000000', NULL),
(3, 'Setyaning', 'Wijayanti', 'Aning', 'purchasing@alfasukomart.com', '$2y$10$cqK2TfuEu.lC2QqkQHqHTOCqcJwHEhaNaXfpN2QthdA42T/Gk7Lvq', 'no_avatar.png', '62129832719', 3, 1, '2021-10-19 02:08:30.000000', '2021-10-19 02:08:30.000000', NULL),
(4, 'Kasir', '001', 'cashier1', 'kasir1@alfasukomart.com', '$2y$10$Mnyh0Y98kka8xQ2pPQSi3uMl9.N/LnFG7ozVB6OSr9MzQn7Iz5dMu', 'no_avatar.png', '6298127381', 4, 1, '2021-10-19 02:09:05.000000', '2021-10-19 02:09:05.000000', NULL),
(5, 'Tohid', 'Hidayat', 'tohid', 'tohid@alfasukomart.com', '$2y$10$BBnqAREg9ck0eruIxORzeew2oyrKl1PXbHA2JHB0EEcGmjJXYZts2', 'no_avatar.png', '0213456789', 3, 1, '2021-12-20 01:33:14.000000', '2021-12-20 01:33:14.000000', NULL),
(6, 'Dimas', 'Setyawan', 'dimas', 'dimas@alfasukomart.com', '$2y$10$/sVsW.Gs87x7QrsKySIhyu3gIUjzYxtBf1.DiTrvgT95gROCLuf.a', 'no_avatar.png', '02134567891', 5, 1, '2021-12-20 01:35:56.000000', '2021-12-20 01:35:56.000000', NULL),
(7, 'Purchasing', 'Jasuko', 'purchasing', 'purchasing@jasuko.com', '$2y$10$OTTWZqQGZZdCtHHRiQ8t3OdcngKQrFatPirFNluD2ZVNl5GmbUChi', 'no_avatar.png', '0213456789', 3, 1, '2021-12-22 22:22:53.000000', '2021-12-22 22:22:53.000000', NULL),
(8, 'Marketing', 'Jasuko', 'marketing', 'marketing@jasuko.com', '$2y$10$6FLRGgR1sfaNk9rl4SzHH.nsfDEQzs07bskbIEyrbuX2Hda/BOx02', 'no_avatar.png', '0213456789', 5, 1, '2021-12-22 22:24:01.000000', '2021-12-22 22:24:01.000000', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `warehouses`
--

CREATE TABLE `warehouses` (
  `id` int(11) NOT NULL,
  `name` varchar(192) NOT NULL,
  `city` varchar(192) DEFAULT NULL,
  `mobile` varchar(192) DEFAULT NULL,
  `zip` varchar(192) DEFAULT NULL,
  `email` varchar(192) DEFAULT NULL,
  `country` varchar(192) DEFAULT NULL,
  `created_at` timestamp(6) NULL DEFAULT NULL,
  `updated_at` timestamp(6) NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `warehouses`
--

INSERT INTO `warehouses` (`id`, `name`, `city`, `mobile`, `zip`, `email`, `country`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 'Toko Jakarta 1', 'DKI Jakarta', '62123456789', '11111', 'toko1@alfasuko,com', 'Cakung', '2021-10-18 21:38:35.000000', '2021-10-18 21:38:35.000000', NULL),
(2, 'Toko Jakarta 2', 'DKI Jakarta', '62123456789', '22222', 'toko2@alfasuko.com', 'Cipinang', '2021-10-18 21:39:39.000000', '2021-10-18 21:41:10.000000', NULL),
(3, 'Toko Jakarta 3', 'DKI Jakarta', '62123456789', '33333', 'toko3@alfasuko.com', 'Tambora', '2021-10-18 21:40:59.000000', '2021-10-18 21:40:59.000000', NULL),
(4, 'Gudang Jakarta', 'DKI Jakarta', '621212345678', '44444', 'warehouse.dki@alfasuko.com', 'Cakung', '2021-10-18 21:42:06.000000', '2021-10-18 21:42:06.000000', NULL),
(5, 'Gudang Wonosobo', 'Jawa Tengah', '621234456879', '666666', 'warehouse.wonosobo@alfasuko.com', 'Wonosobo', '2021-10-18 21:42:51.000000', '2021-10-18 21:42:51.000000', NULL);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `adjustments`
--
ALTER TABLE `adjustments`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id_adjustment` (`user_id`),
  ADD KEY `warehouse_id_adjustment` (`warehouse_id`);

--
-- Indexes for table `adjustment_details`
--
ALTER TABLE `adjustment_details`
  ADD PRIMARY KEY (`id`),
  ADD KEY `adjust_product_id` (`product_id`),
  ADD KEY `adjust_adjustment_id` (`adjustment_id`),
  ADD KEY `adjust_product_variant` (`product_variant_id`);

--
-- Indexes for table `brands`
--
ALTER TABLE `brands`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `clients`
--
ALTER TABLE `clients`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `currencies`
--
ALTER TABLE `currencies`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `expenses`
--
ALTER TABLE `expenses`
  ADD PRIMARY KEY (`id`),
  ADD KEY `expense_user_id` (`user_id`),
  ADD KEY `expense_category_id` (`expense_category_id`),
  ADD KEY `expense_warehouse_id` (`warehouse_id`);

--
-- Indexes for table `expense_categories`
--
ALTER TABLE `expense_categories`
  ADD PRIMARY KEY (`id`),
  ADD KEY `expense_category_user_id` (`user_id`);

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `oauth_access_tokens`
--
ALTER TABLE `oauth_access_tokens`
  ADD PRIMARY KEY (`id`),
  ADD KEY `oauth_access_tokens_user_id_index` (`user_id`);

--
-- Indexes for table `oauth_auth_codes`
--
ALTER TABLE `oauth_auth_codes`
  ADD PRIMARY KEY (`id`),
  ADD KEY `oauth_auth_codes_user_id_index` (`user_id`);

--
-- Indexes for table `oauth_clients`
--
ALTER TABLE `oauth_clients`
  ADD PRIMARY KEY (`id`),
  ADD KEY `oauth_clients_user_id_index` (`user_id`);

--
-- Indexes for table `oauth_personal_access_clients`
--
ALTER TABLE `oauth_personal_access_clients`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `oauth_refresh_tokens`
--
ALTER TABLE `oauth_refresh_tokens`
  ADD PRIMARY KEY (`id`),
  ADD KEY `oauth_refresh_tokens_access_token_id_index` (`access_token_id`);

--
-- Indexes for table `password_resets`
--
ALTER TABLE `password_resets`
  ADD PRIMARY KEY (`id`),
  ADD KEY `email` (`email`),
  ADD KEY `token` (`token`);

--
-- Indexes for table `payment_purchases`
--
ALTER TABLE `payment_purchases`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id_payment_purchases` (`user_id`),
  ADD KEY `payments_purchase_id` (`purchase_id`);

--
-- Indexes for table `payment_purchase_returns`
--
ALTER TABLE `payment_purchase_returns`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id_payment_return_purchase` (`user_id`),
  ADD KEY `supplier_id_payment_return_purchase` (`purchase_return_id`);

--
-- Indexes for table `payment_sales`
--
ALTER TABLE `payment_sales`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id_payments_sale` (`user_id`),
  ADD KEY `payment_sale_id` (`sale_id`);

--
-- Indexes for table `payment_sale_returns`
--
ALTER TABLE `payment_sale_returns`
  ADD PRIMARY KEY (`id`),
  ADD KEY `factures_sale_return_user_id` (`user_id`),
  ADD KEY `factures_sale_return` (`sale_return_id`);

--
-- Indexes for table `payment_with_credit_card`
--
ALTER TABLE `payment_with_credit_card`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `permissions`
--
ALTER TABLE `permissions`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `permission_role`
--
ALTER TABLE `permission_role`
  ADD PRIMARY KEY (`id`),
  ADD KEY `permission_role_permission_id` (`permission_id`),
  ADD KEY `permission_role_role_id` (`role_id`);

--
-- Indexes for table `pos_settings`
--
ALTER TABLE `pos_settings`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`id`),
  ADD KEY `category_id` (`category_id`),
  ADD KEY `brand_id_products` (`brand_id`),
  ADD KEY `unit_id_products` (`unit_id`),
  ADD KEY `unit_id_sales` (`unit_sale_id`),
  ADD KEY `unit_purchase_products` (`unit_purchase_id`);

--
-- Indexes for table `product_variants`
--
ALTER TABLE `product_variants`
  ADD PRIMARY KEY (`id`),
  ADD KEY `product_id_variant` (`product_id`);

--
-- Indexes for table `product_warehouse`
--
ALTER TABLE `product_warehouse`
  ADD PRIMARY KEY (`id`),
  ADD KEY `product_warehouse_id` (`product_id`),
  ADD KEY `warehouse_id` (`warehouse_id`),
  ADD KEY `product_variant_id` (`product_variant_id`);

--
-- Indexes for table `providers`
--
ALTER TABLE `providers`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `purchases`
--
ALTER TABLE `purchases`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id_purchases` (`user_id`),
  ADD KEY `provider_id` (`provider_id`),
  ADD KEY `warehouse_id_purchase` (`warehouse_id`);

--
-- Indexes for table `purchase_details`
--
ALTER TABLE `purchase_details`
  ADD PRIMARY KEY (`id`),
  ADD KEY `purchase_id` (`purchase_id`),
  ADD KEY `product_id` (`product_id`),
  ADD KEY `purchase_product_variant_id` (`product_variant_id`),
  ADD KEY `purchase_unit_id_purchase` (`purchase_unit_id`);

--
-- Indexes for table `purchase_returns`
--
ALTER TABLE `purchase_returns`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id_returns` (`user_id`),
  ADD KEY `provider_id_return` (`provider_id`),
  ADD KEY `purchase_return_warehouse_id` (`warehouse_id`);

--
-- Indexes for table `purchase_return_details`
--
ALTER TABLE `purchase_return_details`
  ADD PRIMARY KEY (`id`),
  ADD KEY `purchase_return_id_return` (`purchase_return_id`),
  ADD KEY `product_id_details_purchase_return` (`product_id`),
  ADD KEY `purchase_return_product_variant_id` (`product_variant_id`),
  ADD KEY `unit_id_purchase_return_details` (`purchase_unit_id`);

--
-- Indexes for table `quotations`
--
ALTER TABLE `quotations`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id_quotation` (`user_id`),
  ADD KEY `client_id_quotation` (`client_id`),
  ADD KEY `warehouse_id_quotation` (`warehouse_id`);

--
-- Indexes for table `quotation_details`
--
ALTER TABLE `quotation_details`
  ADD PRIMARY KEY (`id`),
  ADD KEY `product_id_quotation_details` (`product_id`),
  ADD KEY `quote_product_variant_id` (`product_variant_id`),
  ADD KEY `quotation_id` (`quotation_id`),
  ADD KEY `sale_unit_id_quotation` (`sale_unit_id`);

--
-- Indexes for table `roles`
--
ALTER TABLE `roles`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `role_user`
--
ALTER TABLE `role_user`
  ADD PRIMARY KEY (`id`),
  ADD KEY `role_user_user_id` (`user_id`),
  ADD KEY `role_user_role_id` (`role_id`);

--
-- Indexes for table `sales`
--
ALTER TABLE `sales`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id_sales` (`user_id`),
  ADD KEY `sale_client_id` (`client_id`),
  ADD KEY `warehouse_id_sale` (`warehouse_id`);

--
-- Indexes for table `sale_details`
--
ALTER TABLE `sale_details`
  ADD PRIMARY KEY (`id`),
  ADD KEY `Details_Sale_id` (`sale_id`),
  ADD KEY `sale_product_id` (`product_id`),
  ADD KEY `sale_product_variant_id` (`product_variant_id`),
  ADD KEY `sales_sale_unit_id` (`sale_unit_id`);

--
-- Indexes for table `sale_returns`
--
ALTER TABLE `sale_returns`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id_returns` (`user_id`),
  ADD KEY `client_id_returns` (`client_id`),
  ADD KEY `warehouse_id_sale_return_id` (`warehouse_id`);

--
-- Indexes for table `sale_return_details`
--
ALTER TABLE `sale_return_details`
  ADD PRIMARY KEY (`id`),
  ADD KEY `return_id` (`sale_return_id`),
  ADD KEY `product_id_details_returns` (`product_id`),
  ADD KEY `sale_return_id_product_variant_id` (`product_variant_id`),
  ADD KEY `sale_unit_id_return_details` (`sale_unit_id`);

--
-- Indexes for table `servers`
--
ALTER TABLE `servers`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `settings`
--
ALTER TABLE `settings`
  ADD PRIMARY KEY (`id`),
  ADD KEY `currency_id` (`currency_id`),
  ADD KEY `client_id` (`client_id`),
  ADD KEY `warehouse_id` (`warehouse_id`);

--
-- Indexes for table `transfers`
--
ALTER TABLE `transfers`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id_transfers` (`user_id`),
  ADD KEY `from_warehouse_id` (`from_warehouse_id`),
  ADD KEY `to_warehouse_id` (`to_warehouse_id`);

--
-- Indexes for table `transfer_details`
--
ALTER TABLE `transfer_details`
  ADD PRIMARY KEY (`id`),
  ADD KEY `transfer_id` (`transfer_id`),
  ADD KEY `product_id_transfers` (`product_id`),
  ADD KEY `product_variant_id_transfer` (`product_variant_id`),
  ADD KEY `unit_sale_id_transfer` (`purchase_unit_id`);

--
-- Indexes for table `units`
--
ALTER TABLE `units`
  ADD PRIMARY KEY (`id`),
  ADD KEY `base_unit` (`base_unit`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `warehouses`
--
ALTER TABLE `warehouses`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `adjustments`
--
ALTER TABLE `adjustments`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `adjustment_details`
--
ALTER TABLE `adjustment_details`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `brands`
--
ALTER TABLE `brands`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `categories`
--
ALTER TABLE `categories`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `clients`
--
ALTER TABLE `clients`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `currencies`
--
ALTER TABLE `currencies`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `expenses`
--
ALTER TABLE `expenses`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `expense_categories`
--
ALTER TABLE `expense_categories`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=91;

--
-- AUTO_INCREMENT for table `oauth_clients`
--
ALTER TABLE `oauth_clients`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `oauth_personal_access_clients`
--
ALTER TABLE `oauth_personal_access_clients`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `password_resets`
--
ALTER TABLE `password_resets`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `payment_purchases`
--
ALTER TABLE `payment_purchases`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `payment_purchase_returns`
--
ALTER TABLE `payment_purchase_returns`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `payment_sales`
--
ALTER TABLE `payment_sales`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `payment_sale_returns`
--
ALTER TABLE `payment_sale_returns`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `payment_with_credit_card`
--
ALTER TABLE `payment_with_credit_card`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `permissions`
--
ALTER TABLE `permissions`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=90;

--
-- AUTO_INCREMENT for table `permission_role`
--
ALTER TABLE `permission_role`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=467;

--
-- AUTO_INCREMENT for table `pos_settings`
--
ALTER TABLE `pos_settings`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `products`
--
ALTER TABLE `products`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=30;

--
-- AUTO_INCREMENT for table `product_variants`
--
ALTER TABLE `product_variants`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `product_warehouse`
--
ALTER TABLE `product_warehouse`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=146;

--
-- AUTO_INCREMENT for table `providers`
--
ALTER TABLE `providers`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `purchases`
--
ALTER TABLE `purchases`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `purchase_details`
--
ALTER TABLE `purchase_details`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `purchase_returns`
--
ALTER TABLE `purchase_returns`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `purchase_return_details`
--
ALTER TABLE `purchase_return_details`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `quotations`
--
ALTER TABLE `quotations`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `quotation_details`
--
ALTER TABLE `quotation_details`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `roles`
--
ALTER TABLE `roles`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `role_user`
--
ALTER TABLE `role_user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `sales`
--
ALTER TABLE `sales`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `sale_details`
--
ALTER TABLE `sale_details`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `sale_returns`
--
ALTER TABLE `sale_returns`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `sale_return_details`
--
ALTER TABLE `sale_return_details`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `servers`
--
ALTER TABLE `servers`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `settings`
--
ALTER TABLE `settings`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `transfers`
--
ALTER TABLE `transfers`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `transfer_details`
--
ALTER TABLE `transfer_details`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `units`
--
ALTER TABLE `units`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `warehouses`
--
ALTER TABLE `warehouses`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `adjustments`
--
ALTER TABLE `adjustments`
  ADD CONSTRAINT `user_id_adjustment` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`),
  ADD CONSTRAINT `warehouse_id_adjustment` FOREIGN KEY (`warehouse_id`) REFERENCES `warehouses` (`id`);

--
-- Constraints for table `adjustment_details`
--
ALTER TABLE `adjustment_details`
  ADD CONSTRAINT `adjust_adjustment_id` FOREIGN KEY (`adjustment_id`) REFERENCES `adjustments` (`id`),
  ADD CONSTRAINT `adjust_product_id` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`),
  ADD CONSTRAINT `adjust_product_variant` FOREIGN KEY (`product_variant_id`) REFERENCES `product_variants` (`id`);

--
-- Constraints for table `expenses`
--
ALTER TABLE `expenses`
  ADD CONSTRAINT `expense_category_id` FOREIGN KEY (`expense_category_id`) REFERENCES `expense_categories` (`id`),
  ADD CONSTRAINT `expense_user_id` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`),
  ADD CONSTRAINT `expense_warehouse_id` FOREIGN KEY (`warehouse_id`) REFERENCES `warehouses` (`id`);

--
-- Constraints for table `expense_categories`
--
ALTER TABLE `expense_categories`
  ADD CONSTRAINT `expense_category_user_id` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`);

--
-- Constraints for table `payment_purchases`
--
ALTER TABLE `payment_purchases`
  ADD CONSTRAINT `factures_purchase_id` FOREIGN KEY (`purchase_id`) REFERENCES `purchases` (`id`),
  ADD CONSTRAINT `user_id_factures_achat` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`);

--
-- Constraints for table `payment_purchase_returns`
--
ALTER TABLE `payment_purchase_returns`
  ADD CONSTRAINT `supplier_id_payment_return_purchase` FOREIGN KEY (`purchase_return_id`) REFERENCES `purchase_returns` (`id`),
  ADD CONSTRAINT `user_id_payment_return_purchase` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`);

--
-- Constraints for table `payment_sales`
--
ALTER TABLE `payment_sales`
  ADD CONSTRAINT `facture_sale_id` FOREIGN KEY (`sale_id`) REFERENCES `sales` (`id`),
  ADD CONSTRAINT `user_id_factures_ventes` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`);

--
-- Constraints for table `payment_sale_returns`
--
ALTER TABLE `payment_sale_returns`
  ADD CONSTRAINT `factures_sale_return` FOREIGN KEY (`sale_return_id`) REFERENCES `sale_returns` (`id`),
  ADD CONSTRAINT `factures_sale_return_user_id` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`);

--
-- Constraints for table `permission_role`
--
ALTER TABLE `permission_role`
  ADD CONSTRAINT `permission_role_permission_id` FOREIGN KEY (`permission_id`) REFERENCES `permissions` (`id`),
  ADD CONSTRAINT `permission_role_role_id` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`);

--
-- Constraints for table `products`
--
ALTER TABLE `products`
  ADD CONSTRAINT `brand_id_products` FOREIGN KEY (`brand_id`) REFERENCES `brands` (`id`),
  ADD CONSTRAINT `category_id` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id`),
  ADD CONSTRAINT `unit_id_products` FOREIGN KEY (`unit_id`) REFERENCES `units` (`id`),
  ADD CONSTRAINT `unit_id_sales` FOREIGN KEY (`unit_sale_id`) REFERENCES `units` (`id`),
  ADD CONSTRAINT `unit_purchase_products` FOREIGN KEY (`unit_purchase_id`) REFERENCES `units` (`id`);

--
-- Constraints for table `product_variants`
--
ALTER TABLE `product_variants`
  ADD CONSTRAINT `product_id_variant` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`);

--
-- Constraints for table `product_warehouse`
--
ALTER TABLE `product_warehouse`
  ADD CONSTRAINT `art_id` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`),
  ADD CONSTRAINT `mag_id` FOREIGN KEY (`warehouse_id`) REFERENCES `warehouses` (`id`),
  ADD CONSTRAINT `product_variant_id` FOREIGN KEY (`product_variant_id`) REFERENCES `product_variants` (`id`);

--
-- Constraints for table `purchases`
--
ALTER TABLE `purchases`
  ADD CONSTRAINT `provider_id` FOREIGN KEY (`provider_id`) REFERENCES `providers` (`id`),
  ADD CONSTRAINT `user_id_purchases` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`),
  ADD CONSTRAINT `warehouse_id_purchase` FOREIGN KEY (`warehouse_id`) REFERENCES `warehouses` (`id`);

--
-- Constraints for table `purchase_details`
--
ALTER TABLE `purchase_details`
  ADD CONSTRAINT `product_id` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON UPDATE CASCADE,
  ADD CONSTRAINT `purchase_id` FOREIGN KEY (`purchase_id`) REFERENCES `purchases` (`id`),
  ADD CONSTRAINT `purchase_product_variant_id` FOREIGN KEY (`product_variant_id`) REFERENCES `product_variants` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `purchase_unit_id_purchase` FOREIGN KEY (`purchase_unit_id`) REFERENCES `units` (`id`);

--
-- Constraints for table `purchase_returns`
--
ALTER TABLE `purchase_returns`
  ADD CONSTRAINT `provider_id_return` FOREIGN KEY (`provider_id`) REFERENCES `providers` (`id`),
  ADD CONSTRAINT `purchase_return_user_id` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`),
  ADD CONSTRAINT `purchase_return_warehouse_id` FOREIGN KEY (`warehouse_id`) REFERENCES `warehouses` (`id`);

--
-- Constraints for table `purchase_return_details`
--
ALTER TABLE `purchase_return_details`
  ADD CONSTRAINT `product_id_details_purchase_return` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`),
  ADD CONSTRAINT `purchase_return_id_return` FOREIGN KEY (`purchase_return_id`) REFERENCES `purchase_returns` (`id`),
  ADD CONSTRAINT `purchase_return_product_variant_id` FOREIGN KEY (`product_variant_id`) REFERENCES `product_variants` (`id`),
  ADD CONSTRAINT `unit_id_purchase_return_details` FOREIGN KEY (`purchase_unit_id`) REFERENCES `units` (`id`);

--
-- Constraints for table `quotations`
--
ALTER TABLE `quotations`
  ADD CONSTRAINT `client_id _quotation` FOREIGN KEY (`client_id`) REFERENCES `clients` (`id`),
  ADD CONSTRAINT `user_id_quotation` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`),
  ADD CONSTRAINT `warehouse_id_quotation` FOREIGN KEY (`warehouse_id`) REFERENCES `warehouses` (`id`);

--
-- Constraints for table `quotation_details`
--
ALTER TABLE `quotation_details`
  ADD CONSTRAINT `product_id_quotation_details` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`),
  ADD CONSTRAINT `quotation_id` FOREIGN KEY (`quotation_id`) REFERENCES `quotations` (`id`),
  ADD CONSTRAINT `quote_product_variant_id` FOREIGN KEY (`product_variant_id`) REFERENCES `product_variants` (`id`),
  ADD CONSTRAINT `sale_unit_id_quotation` FOREIGN KEY (`sale_unit_id`) REFERENCES `units` (`id`);

--
-- Constraints for table `role_user`
--
ALTER TABLE `role_user`
  ADD CONSTRAINT `role_user_role_id` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`),
  ADD CONSTRAINT `role_user_user_id` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`);

--
-- Constraints for table `sales`
--
ALTER TABLE `sales`
  ADD CONSTRAINT `sale_client_id` FOREIGN KEY (`client_id`) REFERENCES `clients` (`id`),
  ADD CONSTRAINT `user_id_sales` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`),
  ADD CONSTRAINT `warehouse_id_sale` FOREIGN KEY (`warehouse_id`) REFERENCES `warehouses` (`id`);

--
-- Constraints for table `sale_details`
--
ALTER TABLE `sale_details`
  ADD CONSTRAINT `Details_Sale_id` FOREIGN KEY (`sale_id`) REFERENCES `sales` (`id`),
  ADD CONSTRAINT `sale_product_id` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`),
  ADD CONSTRAINT `sale_product_variant_id` FOREIGN KEY (`product_variant_id`) REFERENCES `product_variants` (`id`),
  ADD CONSTRAINT `sales_sale_unit_id` FOREIGN KEY (`sale_unit_id`) REFERENCES `units` (`id`);

--
-- Constraints for table `sale_returns`
--
ALTER TABLE `sale_returns`
  ADD CONSTRAINT `client_id_returns` FOREIGN KEY (`client_id`) REFERENCES `clients` (`id`),
  ADD CONSTRAINT `user_id_returns` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`),
  ADD CONSTRAINT `warehouse_id_sale_return_id` FOREIGN KEY (`warehouse_id`) REFERENCES `warehouses` (`id`);

--
-- Constraints for table `sale_return_details`
--
ALTER TABLE `sale_return_details`
  ADD CONSTRAINT `product_id_details_returns` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`),
  ADD CONSTRAINT `sale_return_id` FOREIGN KEY (`sale_return_id`) REFERENCES `sale_returns` (`id`),
  ADD CONSTRAINT `sale_return_id_product_variant_id` FOREIGN KEY (`product_variant_id`) REFERENCES `product_variants` (`id`),
  ADD CONSTRAINT `sale_unit_id_return_details` FOREIGN KEY (`sale_unit_id`) REFERENCES `units` (`id`);

--
-- Constraints for table `settings`
--
ALTER TABLE `settings`
  ADD CONSTRAINT `currency_id` FOREIGN KEY (`currency_id`) REFERENCES `currencies` (`id`),
  ADD CONSTRAINT `settings_client_id` FOREIGN KEY (`client_id`) REFERENCES `clients` (`id`),
  ADD CONSTRAINT `settings_warehouse_id` FOREIGN KEY (`warehouse_id`) REFERENCES `warehouses` (`id`);

--
-- Constraints for table `transfers`
--
ALTER TABLE `transfers`
  ADD CONSTRAINT `from_warehouse_id` FOREIGN KEY (`from_warehouse_id`) REFERENCES `warehouses` (`id`),
  ADD CONSTRAINT `to_warehouse_id` FOREIGN KEY (`to_warehouse_id`) REFERENCES `warehouses` (`id`),
  ADD CONSTRAINT `user_id_transfers` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`);

--
-- Constraints for table `transfer_details`
--
ALTER TABLE `transfer_details`
  ADD CONSTRAINT `product_id_transfers` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`),
  ADD CONSTRAINT `product_variant_id_transfer` FOREIGN KEY (`product_variant_id`) REFERENCES `product_variants` (`id`),
  ADD CONSTRAINT `transfer_id` FOREIGN KEY (`transfer_id`) REFERENCES `transfers` (`id`),
  ADD CONSTRAINT `unit_sale_id_transfer` FOREIGN KEY (`purchase_unit_id`) REFERENCES `units` (`id`);

--
-- Constraints for table `units`
--
ALTER TABLE `units`
  ADD CONSTRAINT `base_unit` FOREIGN KEY (`base_unit`) REFERENCES `units` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
