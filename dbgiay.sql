-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Apr 06, 2023 at 12:05 PM
-- Server version: 10.4.24-MariaDB
-- PHP Version: 8.1.6

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `dbgiay`
--

-- --------------------------------------------------------

--
-- Table structure for table `carts`
--

CREATE TABLE `carts` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `product_id` int(11) NOT NULL,
  `product_qty` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `categories`
--

CREATE TABLE `categories` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `meta_title` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `meta_keyword` mediumtext COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `meta_descrip` mediumtext COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `slug` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` longtext COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` tinyint(4) NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `categories`
--

INSERT INTO `categories` (`id`, `meta_title`, `meta_keyword`, `meta_descrip`, `slug`, `name`, `description`, `status`, `created_at`, `updated_at`) VALUES
(1, 'Giày nam đẹp', 'giày', 'giày nam', 'Giày Nam', 'Giày Nam', 'giày nam', 0, '2023-02-19 01:28:22', '2023-02-27 06:36:52');

-- --------------------------------------------------------

--
-- Table structure for table `failed_jobs`
--

CREATE TABLE `failed_jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `uuid` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `connection` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '2014_10_12_000000_create_users_table', 1),
(2, '2014_10_12_100000_create_password_resets_table', 1),
(3, '2019_08_19_000000_create_failed_jobs_table', 1),
(4, '2019_12_14_000001_create_personal_access_tokens_table', 1),
(5, '2023_02_19_062257_create_categories_table', 2),
(6, '2023_02_21_095415_create_products_table', 3),
(7, '2023_02_22_073119_create_carts_table', 4),
(8, '2023_02_23_122859_create_orders_table', 5),
(9, '2023_02_23_123326_create_orderitems_table', 5);

-- --------------------------------------------------------

--
-- Table structure for table `orderitems`
--

CREATE TABLE `orderitems` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `order_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `qty` int(11) NOT NULL,
  `price` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `orderitems`
--

INSERT INTO `orderitems` (`id`, `order_id`, `product_id`, `qty`, `price`, `created_at`, `updated_at`) VALUES
(1, 1, 1, 5, 120000, '2023-02-23 07:16:10', '2023-02-23 07:16:10'),
(2, 1, 2, 3, 10000, '2023-02-23 07:16:10', '2023-02-23 07:16:10'),
(3, 2, 1, 1, 120000, '2023-02-23 07:19:44', '2023-02-23 07:19:44'),
(4, 3, 1, 4, 120000, '2023-02-23 08:07:55', '2023-02-23 08:07:55'),
(5, 5, 1, 4, 120000, '2023-02-23 08:29:14', '2023-02-23 08:29:14');

-- --------------------------------------------------------

--
-- Table structure for table `orders`
--

CREATE TABLE `orders` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` int(11) NOT NULL,
  `firstname` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `lastname` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `phone` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `address` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `city` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `state` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `zipcode` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `payment_id` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `payment_mode` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tracking_no` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` tinyint(4) NOT NULL DEFAULT 0,
  `remark` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `orders`
--

INSERT INTO `orders` (`id`, `user_id`, `firstname`, `lastname`, `phone`, `email`, `address`, `city`, `state`, `zipcode`, `payment_id`, `payment_mode`, `tracking_no`, `status`, `remark`, `created_at`, `updated_at`) VALUES
(1, 2, 'Nguyễn', 'Tín', '090909090', 'Admin1@gmail.com', 'joker', 'new city', 'california', '123445667', NULL, 'COD', 'fundaecom4027', 0, NULL, '2023-02-23 07:16:10', '2023-02-23 07:16:10'),
(2, 2, 'Nguyen', 'Tin', '89899898', 'admi', '1234', 'HCM', 'kka', '123444', NULL, 'COD', 'heloo7490', 0, NULL, '2023-02-23 07:19:44', '2023-02-23 07:19:44'),
(3, 2, 'nguyen', 'tin', '090909090', 'admin@gmail.com', 'to 6 khu pho 4 phuong trang dai', 'HCM', 'quan binh thanh', '21', NULL, 'COD', 'nguyentin3810', 0, NULL, '2023-02-23 08:07:55', '2023-02-23 08:07:55'),
(4, 2, 'nguyen', 'tin', '090909090', 'admin@gmail.com', 'to 6 khu pho 4 phuong trang dai', 'HCM', 'quan binh thanh', '21', NULL, 'COD', 'nguyentin7526', 0, NULL, '2023-02-23 08:07:55', '2023-02-23 08:07:55'),
(5, 2, 'Nguyen', 'tin', '8098090', 'admin@gmail.com', '0909021', 'HCM', 'quan binh thanh', '123456', NULL, 'COD', 'nguyentin2614', 0, NULL, '2023-02-23 08:29:14', '2023-02-23 08:29:14');

-- --------------------------------------------------------

--
-- Table structure for table `password_resets`
--

CREATE TABLE `password_resets` (
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `personal_access_tokens`
--

CREATE TABLE `personal_access_tokens` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `tokenable_type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tokenable_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL,
  `abilities` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `personal_access_tokens`
--

INSERT INTO `personal_access_tokens` (`id`, `tokenable_type`, `tokenable_id`, `name`, `token`, `abilities`, `last_used_at`, `created_at`, `updated_at`) VALUES
(139, 'App\\Models\\User', 2, 'admin@gmail.com_AdminToken', '7faed35eaa84cf699072362b5445a3f30e64c8151b8525b29f4852ea48590cdd', '[\"server:admin\"]', '2023-03-16 01:54:24', '2023-03-16 01:42:15', '2023-03-16 01:54:24');

-- --------------------------------------------------------

--
-- Table structure for table `products`
--

CREATE TABLE `products` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `category_id` int(11) NOT NULL,
  `meta_title` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `meta_keyword` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `meta_descrip` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `slug` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` mediumtext COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `brand` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `selling_price` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `original_price` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `qty` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `image` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `featured` tinyint(4) DEFAULT 0,
  `popular` tinyint(4) DEFAULT 0,
  `status` tinyint(4) NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `products`
--

INSERT INTO `products` (`id`, `category_id`, `meta_title`, `meta_keyword`, `meta_descrip`, `slug`, `name`, `description`, `brand`, `selling_price`, `original_price`, `qty`, `image`, `featured`, `popular`, `status`, `created_at`, `updated_at`) VALUES
(1, 1, 'giay-gucci-ace-floral-sneakers', 'giay-gucci-ace-floral-sneakers', 'giay-gucci-ace-floral-sneakers', 'giay-gucci-ace-floral-sneakers', 'giay-gucci-ace-floral-sneakers', 'giay-gucci-ace-floral-sneakers', 'gucci ace', '120000', '15000', '6', 'uploads/product/1677506147.jpg', 1, 1, 0, '2023-02-21 03:20:20', '2023-02-27 06:55:47'),
(2, 1, 'Samsung Mobilegiay-marcelo-burlon-county-of-milan-wings', 'giay-marcelo-burlon-county-of-milan-wings', 'giay-marcelo-burlon-county-of-milan-wings', 'giay-marcelo-burlon-county-of-milan-wings', 'giay-marcelo-burlon-county-of-milan-wings', 'giay-marcelo-burlon-county-of-milan-wings', 'marcelo', '100000', '120000', '7', 'uploads/product/1677506224.jpg', 0, 0, 0, '2023-02-21 03:59:09', '2023-02-27 07:01:50'),
(3, 1, 'giay-sneakers-dolce-gabbana-black-red-', 'giay-sneakers-dolce-gabbana-black-red-', 'giay-sneakers-dolce-gabbana-black-red-', 'giay-sneakers-dolce-gabbana-black-red-', 'giay-sneakers-dolce-gabbana-black-red-', 'giay-sneakers-dolce-gabbana-black-red-', 'dolce-gabbana', '500000', '400000', '4', 'uploads/product/1677506315.jpg', 0, 0, 0, '2023-02-27 06:58:35', '2023-02-27 06:58:35'),
(4, 1, 'giay-sneakers-dolce-gabbana-leather-portofino-with-metallic-heel', 'giay-sneakers-dolce-gabbana-leather-portofino-with-metallic-heel', 'giay-sneakers-dolce-gabbana-leather-portofino-with-metallic-heel', 'giay-sneakers-dolce-gabbana-leather-portofino-with-metallic-heel', 'giay-sneakers-dolce-gabbana-leather-portofino-with-metallic-heel', 'giay-sneakers-dolce-gabbana-leather-portofino-with-metallic-heel', 'sneakers', '500000', '400000', '5', 'uploads/product/1677506434.jpg', 0, 0, 0, '2023-02-27 07:00:34', '2023-02-27 07:00:34'),
(5, 1, 'giay-sneakers-dolce-gabbana-logo-royal', 'giay-sneakers-dolce-gabbana-logo-royal', 'giay-sneakers-dolce-gabbana-logo-royal', 'giay-sneakers-dolce-gabbana-logo-royal', 'giay-sneakers-dolce-gabbana-logo-royal', 'giay-sneakers-dolce-gabbana-logo-royal', 'sneakers', '500000', '600000', '2', 'uploads/product/1677506492.jpg', 0, 0, 0, '2023-02-27 07:01:32', '2023-02-27 07:01:32'),
(6, 1, 'giay-sneakers-dolce-gabbana-sorrento-melt', 'giay-sneakers-dolce-gabbana-sorrento-melt', 'giay-sneakers-dolce-gabbana-sorrento-melt', 'giay-sneakers-dolce-gabbana-sorrento-melt', 'giay-sneakers-dolce-gabbana-sorrento-melt', 'giay-sneakers-dolce-gabbana-sorrento-melt', 'sneakers', '500000', '700000', '3', 'uploads/product/1677506558.jpg', 0, 0, 0, '2023-02-27 07:02:38', '2023-02-27 07:02:38'),
(7, 1, 'giay-sneakers-dsquared2', 'giay-sneakers-dsquared2', 'giay-sneakers-dsquared2', 'giay-sneakers-dsquared2', 'giay-sneakers-dsquared2', 'giay-sneakers-dsquared2', 'sneakers', '500000', '800000', '5', 'uploads/product/1677506595.jpg', 0, 0, 0, '2023-02-27 07:03:15', '2023-02-27 07:03:15'),
(8, 1, 'giay-the-thao-louis-vuitton-lv', 'giay-the-thao-louis-vuitton-lv', 'giay-the-thao-louis-vuitton-lv', 'giay-the-thao-louis-vuitton-lv', 'giay-the-thao-louis-vuitton-lv', 'giay-the-thao-louis-vuitton-lv', 'vuitton', '500000', '600000', '5', 'uploads/product/1677506673.jpg', 0, 0, 0, '2023-02-27 07:04:33', '2023-02-27 07:04:33'),
(9, 1, 'giay-the-thao-nike-jordan-1-retro', 'giay-the-thao-nike-jordan-1-retro', 'giay-the-thao-nike-jordan-1-retro', 'giay-the-thao-nike-jordan-1-retro', 'giay-the-thao-nike-jordan-1-retro', 'giay-the-thao-nike-jordan-1-retro', 'nike', '500000', '650000', '5', 'uploads/product/1677506737.jpg', 0, 0, 0, '2023-02-27 07:05:12', '2023-02-27 07:05:37'),
(10, 1, 'giay-the-thao-puma-scuderia-ferrari-speed', 'giay-the-thao-puma-scuderia-ferrari-speed', 'giay-the-thao-puma-scuderia-ferrari-speed', 'giay-the-thao-puma-scuderia-ferrari-speed', 'giay-the-thao-puma-scuderia-ferrari-speed', 'giay-the-thao-puma-scuderia-ferrari-speed', 'puma', '600000', '700000', '5', 'uploads/product/1677506793.jpg', 0, 0, 0, '2023-02-27 07:06:33', '2023-02-27 07:06:33'),
(11, 2, 'giay-sneaker', 'giay-sneaker', 'giay-sneaker', 'giay-sneaker', 'giay-sneaker', 'giay-sneaker', 'sneakers', '175.000', '175.000', '5', 'uploads/product/1677506986.jpg', 0, 0, 0, '2023-02-27 07:09:46', '2023-02-27 07:09:46'),
(12, 2, 'giay-sneaker-nu', 'giay-sneaker-nu', 'giay-sneaker-nu', 'giay-sneaker-nu', 'giay-sneaker-nu', 'giay-sneaker-nu', 'sneakers', '215.000', '215.000', '5', 'uploads/product/1677507034.jpg', 0, 0, 0, '2023-02-27 07:10:34', '2023-02-27 07:10:34'),
(13, 2, 'giay-sneaker-nu-basic-de', 'giay-sneaker-nu-basic-de', 'giay-sneaker-nu-basic-de', 'giay-sneaker-nu-basic-de', 'giay-sneaker-nu-basic-de', 'giay-sneaker-nu-basic-de', 'sneaker', '230.000', '230.000', '5', 'uploads/product/1677507087.jpg', 0, 0, 0, '2023-02-27 07:11:28', '2023-02-27 07:11:28'),
(14, 2, 'giay-sneaker-nu-don-de', 'giay-sneaker-nu-don-de', 'giay-sneaker-nu-don-de', 'giay-sneaker-nu-don-de', 'giay-sneaker-nu-don-de', 'giay-sneaker-nu-don-de', 'sneakers', '230.000', '230.000', '5', 'uploads/product/1677507128.jpg', 0, 0, 0, '2023-02-27 07:12:08', '2023-02-27 07:12:08'),
(15, 2, 'giay-sneakers-converse-chuck', 'giay-sneakers-converse-chuck', 'giay-sneakers-converse-chuck', 'giay-sneakers-converse-chuck', 'giay-sneakers-converse-chuck', 'giay-sneakers-converse-chuck', 'sneakers', '230.000', '230.000', '5', 'uploads/product/1677507190.jpg', 0, 0, 0, '2023-02-27 07:13:10', '2023-02-27 07:13:10'),
(16, 2, 'giay-sneakers-dolce-gabbana-black-red', 'giay-sneakers-dolce-gabbana-black-red', 'giay-sneakers-dolce-gabbana-black-red', 'giay-sneakers-dolce-gabbana-black-red', 'giay-sneakers-dolce-gabbana-black-red', 'giay-sneakers-dolce-gabbana-black-red', 'dolce-gabbana', '9.700.000', '9.700.000', '5', 'uploads/product/1677507259.png', 0, 0, 0, '2023-02-27 07:14:19', '2023-02-27 07:14:19'),
(17, 2, 'giay-sneakers-moschino-women-s-shoes', 'giay-sneakers-moschino-women-s-shoes', 'giay-sneakers-moschino-women-s-shoes', 'giay-sneakers-moschino-women-s-shoes', 'giay-sneakers-moschino-women-s-shoes', 'giay-sneakers-moschino-women-s-shoes', 'sneakers', '4.200.000', '4.200.000', '5', 'uploads/product/1677507365.jpg', 0, 0, 0, '2023-02-27 07:16:05', '2023-02-27 07:17:17'),
(18, 2, 'giay-sneakers-moschino-women-s-shoes-love-moschino', 'giay-sneakers-moschino-women-s-shoes-love-moschino', 'giay-sneakers-moschino-women-s-shoes-love-moschino', 'giay-sneakers-moschino-women-s-shoes-love-moschino', 'giay-sneakers-moschino-women-s-shoes-love-moschino', 'giay-sneakers-moschino-women-s-shoes-love-moschino', 'sneakers', '4.700.000', '4.700.000', '5', 'uploads/product/1677507417.jpg', 0, 0, 0, '2023-02-27 07:16:57', '2023-02-27 07:16:57'),
(19, 2, 'giay-the-thao', 'giay-the-thao', 'giay-the-thao', 'giay-the-thao', 'giay-the-thao', 'giay-the-thao', 'the-thao', '215.000', '215.000', '5', 'uploads/product/1677507566.jpg', 0, 0, 0, '2023-02-27 07:19:26', '2023-02-27 07:19:26'),
(20, 2, 'giay-the-thao-nike', 'giay-the-thao-nike', 'giay-the-thao-nike', 'giay-the-thao-nike', 'giay-the-thao-nike', 'giay-the-thao-nike', 'nike', '3.648.000', '3.648.000', '5', 'uploads/product/1677507630.jpg', 0, 0, 0, '2023-02-27 07:20:30', '2023-02-27 07:20:30'),
(21, 2, 'GIÀY NIKE JOYRIDE RUN FLYKNIT PINK BLAST', 'GIÀY NIKE JOYRIDE RUN FLYKNIT PINK BLAST', 'GIÀY NIKE JOYRIDE RUN FLYKNIT PINK BLAST', 'GIÀY NIKE JOYRIDE RUN FLYKNIT PINK BLAST', 'GIÀY NIKE JOYRIDE RUN FLYKNIT PINK BLAST', 'GIÀY NIKE JOYRIDE RUN FLYKNIT PINK BLAST', 'NIKE', '2.875.000', '2.875.000', '5', 'uploads/product/1677507768.jpg', 0, 0, 0, '2023-02-27 07:22:48', '2023-02-27 07:22:48');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `role_as` int(11) DEFAULT 0 COMMENT '0=users,1=admin',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `email_verified_at`, `password`, `remember_token`, `role_as`, `created_at`, `updated_at`) VALUES
(1, 'nguyen tin', 'overcome7520@gmail.com', NULL, '$2y$10$YiVEIKGkvFHWQDHB/.g4bOz/gJ4vmSZ.o5b.z9BpuodPKYNOGzoaq', NULL, 0, '2023-02-16 22:44:55', '2023-02-16 22:44:55'),
(2, 'Admin Name', 'admin@gmail.com', NULL, '$2y$10$/DkF/CPaLqmPmNv3HC3OluBGtCzYbhINb2lFkIdxl6d.SXRWBGWbe', NULL, 1, '2023-02-17 00:14:23', '2023-02-17 00:14:23');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `carts`
--
ALTER TABLE `carts`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`);

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `orderitems`
--
ALTER TABLE `orderitems`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `password_resets`
--
ALTER TABLE `password_resets`
  ADD KEY `password_resets_email_index` (`email`);

--
-- Indexes for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  ADD KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`);

--
-- Indexes for table `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `carts`
--
ALTER TABLE `carts`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `categories`
--
ALTER TABLE `categories`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `orderitems`
--
ALTER TABLE `orderitems`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `orders`
--
ALTER TABLE `orders`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=140;

--
-- AUTO_INCREMENT for table `products`
--
ALTER TABLE `products`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
