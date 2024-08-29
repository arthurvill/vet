-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jul 27, 2024 at 07:57 AM
-- Server version: 10.4.32-MariaDB
-- PHP Version: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `vet`
--

-- --------------------------------------------------------

--
-- Table structure for table `appointments`
--

CREATE TABLE `appointments` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `first_name` varchar(255) NOT NULL,
  `last_name` varchar(255) NOT NULL,
  `appointment_date` date NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `status` enum('pending','accepted','completed','canceled') NOT NULL DEFAULT 'pending',
  `branch_id` bigint(20) UNSIGNED DEFAULT NULL,
  `pet_name` varchar(255) NOT NULL,
  `animal_type` varchar(255) DEFAULT NULL,
  `breed` varchar(255) NOT NULL,
  `service_type` varchar(255) NOT NULL,
  `appointment_slot` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `appointments`
--

INSERT INTO `appointments` (`id`, `first_name`, `last_name`, `appointment_date`, `created_at`, `updated_at`, `user_id`, `status`, `branch_id`, `pet_name`, `animal_type`, `breed`, `service_type`, `appointment_slot`) VALUES
(1, 'Jon Wendell', 'Cabrera', '2024-05-19', '2024-05-18 23:51:07', '2024-05-18 23:51:39', 2, 'completed', 1, 'Chacha', 'Dog', 'Shih Tzu', 'Pet Hotel', 'Slot 1'),
(2, 'Arthur', 'Villareal', '2024-07-27', '2024-07-26 19:11:32', '2024-07-26 19:11:32', 1, 'pending', 1, 'doggie', 'Dog', 'Shih Tzu', 'Grooming', 'Slot 1'),
(3, 'test', 'test', '2024-07-27', '2024-07-26 19:26:03', '2024-07-26 19:26:03', 2, 'pending', 1, 'doggie', 'Dog', 'Shih Tzu', 'Pet Hotel', 'Slot 2');

-- --------------------------------------------------------

--
-- Table structure for table `audits`
--

CREATE TABLE `audits` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `inventory_id` bigint(20) UNSIGNED NOT NULL,
  `upc` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `description` text NOT NULL,
  `old_quantity` int(10) UNSIGNED NOT NULL,
  `quantity` int(10) UNSIGNED NOT NULL,
  `type` varchar(255) NOT NULL DEFAULT 'inbound',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `audits`
--

INSERT INTO `audits` (`id`, `inventory_id`, `upc`, `name`, `description`, `old_quantity`, `quantity`, `type`, `created_at`, `updated_at`) VALUES
(3, 2, '1720698925', 'Dog Food', 'Dog Food', 0, 500, 'inbound', '2024-07-11 03:55:25', '2024-07-11 03:55:25'),
(4, 2, '1720698925', 'Dog Food', 'Dog Food', 500, 499, 'sales', '2024-07-11 04:17:28', '2024-07-11 04:17:28'),
(5, 3, '17208470072', 'Kennel Cough', 'Medicine for cough', 0, 1000, 'inbound', '2024-07-12 21:03:27', '2024-07-12 21:03:27'),
(6, 4, '17208481563', 'Dog Food', 'Per Killo Price', 0, 1000, 'inbound', '2024-07-12 21:22:36', '2024-07-12 21:22:36'),
(7, 2, '1720698925', 'Dog Food', 'Dog Food', 499, 478, 'sales', '2024-07-18 00:47:04', '2024-07-18 00:47:04'),
(8, 5, '17218988754', 'test', 'test', 0, 1000, 'inbound', '2024-07-25 01:14:35', '2024-07-25 01:14:35'),
(9, 2, '1720698925', 'Dog Food', 'Dog Food', 478, 1, 'inbound', '2024-07-25 01:18:47', '2024-07-25 01:18:47'),
(10, 5, '17218988754', 'test', 'test', 1000, 990, 'sales', '2024-07-25 02:53:30', '2024-07-25 02:53:30'),
(11, 3, '17208470072', 'Kennel Cough', 'Medicine for cough', 1000, 979, 'sales', '2024-07-25 02:53:44', '2024-07-25 02:53:44'),
(12, 5, '17218988754', 'test', 'test', 990, 969, 'sales', '2024-07-25 02:54:28', '2024-07-25 02:54:28');

-- --------------------------------------------------------

--
-- Table structure for table `branches`
--

CREATE TABLE `branches` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `location` varchar(255) NOT NULL,
  `contact` varchar(255) NOT NULL,
  `status` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `branches`
--

INSERT INTO `branches` (`id`, `name`, `location`, `contact`, `status`, `created_at`, `updated_at`, `user_id`) VALUES
(4, 'Central Bark Veterinary Clinic', 'Tungkop, Minglanilla, Cebu', '0966 381 5639', 'Active', '2024-07-26 19:38:42', '2024-07-26 19:38:42', 1),
(5, 'Central Bark Veterinary Clinic', 'Inayagan, City of Naga, Cebu', '0966 381 5639', 'active', '2024-07-26 19:38:50', '2024-07-26 19:39:45', 1);

-- --------------------------------------------------------

--
-- Table structure for table `carts`
--

CREATE TABLE `carts` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `product_id` bigint(20) UNSIGNED NOT NULL,
  `quantity` int(11) NOT NULL,
  `total_price` decimal(8,2) NOT NULL DEFAULT 0.00,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `branch_id` bigint(20) UNSIGNED DEFAULT NULL,
  `courier` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `carts`
--

INSERT INTO `carts` (`id`, `user_id`, `product_id`, `quantity`, `total_price`, `created_at`, `updated_at`, `branch_id`, `courier`) VALUES
(157, 2, 2, 1, 300.00, '2024-07-26 19:27:05', '2024-07-26 19:27:05', 1, 'hatid');

-- --------------------------------------------------------

--
-- Table structure for table `failed_jobs`
--

CREATE TABLE `failed_jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `uuid` varchar(255) NOT NULL,
  `connection` text NOT NULL,
  `queue` text NOT NULL,
  `payload` longtext NOT NULL,
  `exception` longtext NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `inventories`
--

CREATE TABLE `inventories` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `description` text DEFAULT NULL,
  `quantity` int(11) NOT NULL DEFAULT 0,
  `image` varchar(255) DEFAULT NULL,
  `category` varchar(255) DEFAULT NULL,
  `price` decimal(10,2) DEFAULT NULL,
  `upc` varchar(255) DEFAULT NULL,
  `expiration` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `branch_id` bigint(20) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `inventories`
--

INSERT INTO `inventories` (`id`, `name`, `description`, `quantity`, `image`, `category`, `price`, `upc`, `expiration`, `created_at`, `updated_at`, `branch_id`) VALUES
(2, 'Dog Food', 'Dog Food', 476, '1720698925.jpg', 'Dog', 300.00, '1720698925', '2024-10-25 16:00:00', '2024-07-11 11:55:00', '2024-07-25 03:54:18', 1),
(3, 'Kennel Cough', 'Medicine for cough', 979, '1720847007.jpg', 'Cat', 100.00, '17208470072', '2025-03-07 16:00:00', '2024-07-13 05:03:00', '2024-07-25 02:53:44', 1),
(4, 'Dog Food', 'Per Killo Price', 1000, '1720848156.jpg', 'Dog', 200.00, '17208481563', '2025-03-07 16:00:00', '2024-07-25 05:22:00', '2024-07-25 01:18:25', 2),
(5, 'Shabu', 'test', 969, '1721898875.png', 'Cat', 20.00, '17218988754', '2024-07-30 16:00:00', '2024-07-25 09:14:00', '2024-07-26 21:21:49', 4);

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(255) NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '2019_12_14_000001_create_personal_access_tokens_table', 1),
(2, '2023_12_24_101436_rename_branches_table_to_clinics', 1),
(3, '2023_12_24_101718_rename_branch_id_to_clinics_id_in_users_table', 2),
(4, '2023_12_24_110225_remove_role_column_from_users', 3),
(5, '2023_12_24_110244_add_modified_role_column_to_users', 4),
(6, '2023_12_26_063230_create_appointments_table', 5),
(7, '2023_12_26_071104_add_status_to_appointments_table', 6),
(8, '2024_02_12_120327_add_super_admin_role_to_users', 7),
(9, '2024_02_18_113423_add_clinic_id_to_appointments_table', 8),
(10, '2024_02_19_132112_add_doctor_name_to_clinics_table', 9),
(11, '2024_03_02_154939_update_status_column_in_appointments_table', 10),
(12, '2024_03_03_134341_add_canceled_status_to_appointments_table', 11),
(13, '2024_03_12_132234_remove_clinic_id_from_inventories_table', 12),
(14, '2024_03_12_144100_create_audits_table', 13),
(15, '2024_03_12_151530_create_audits_table', 14),
(16, '2024_03_12_153646_create_audits_table', 15),
(17, '2024_04_01_144714_create_sales_table', 16),
(18, '2024_04_01_145100_rename_clinics_table_to_branches', 17),
(19, '2024_04_01_145348_update_foreign_keys_to_branch_id', 18),
(20, '2024_04_01_145714_update_user_foreign_key_to_branch_id', 19),
(21, '2024_04_01_160411_remove_doctor_name_from_branches_table', 20),
(22, '2024_04_01_162407_add_branch_id_to_sales_table', 21),
(23, '2024_04_01_172405_rename_product_id_column_in_sales_table', 22),
(24, '2024_04_03_125743_create_sales_table', 23),
(27, '2024_04_06_064202_add_contact_number_to_users_table', 26),
(28, '2024_04_06_070439_add_status_to_sales_table', 27),
(29, '2024_04_06_152708_add_address_components_to_users_table', 28),
(30, '2024_04_06_154327_add_default_value_to_address_column_in_users_table', 29),
(31, '2024_04_07_104135_add_total_price_to_carts_table', 30),
(32, '2024_04_07_104828_add_total_price_to_sales_table', 31),
(33, '2024_04_11_125241_add_additional_fields_to_appointments_table', 32),
(34, '2024_04_11_130504_update_appointments_table', 33),
(35, '2024_04_11_133903_add_animal_type_to_appointments_table', 34),
(36, '2024_04_28_135840_add_status_to_users_table', 35),
(37, '2024_05_04_120637_remove_description_from_appointments_table', 36),
(38, '2024_05_04_121304_add_number_of_days_to_appointments_table', 37),
(39, '2024_05_04_121852_remove_number_of_days_from_appointments_table', 38),
(40, '2024_05_04_121951_add_check_out_to_appointments_table', 39),
(41, '2024_05_04_123311_rename_check_out_column_in_appointments_table', 40),
(42, '2024_05_04_125053_remove_check_out_date_from_appointments_table', 41),
(43, '2024_05_04_125423_create_pet_hotels_table', 42),
(44, '2024_05_04_125957_add_check_out_date_to_pet_hotels_table', 43),
(45, '2024_05_04_131217_add_size_to_pet_hotels_table', 44),
(46, '2024_05_04_132937_add_price_to_pet_hotels_table', 45),
(47, '2024_05_05_104713_add_courier_to_carts_table', 46);

-- --------------------------------------------------------

--
-- Table structure for table `password_resets`
--

CREATE TABLE `password_resets` (
  `email` varchar(255) NOT NULL,
  `token` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `password_reset_tokens`
--

CREATE TABLE `password_reset_tokens` (
  `email` varchar(255) NOT NULL,
  `guard` varchar(255) DEFAULT NULL,
  `token` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `password_reset_tokens`
--

INSERT INTO `password_reset_tokens` (`email`, `guard`, `token`, `created_at`) VALUES
('admin@gmail.com', 'admin', 'ZFUzak9XY3k5TXlWdkRNSjZ2MExkcG5HNGdDaVg1Q0dIc3BvQWNnYnF4NXZMYXJaM0ZxZjNlMmdaQUZBU21zRA==', '2023-11-20 18:34:06');

-- --------------------------------------------------------

--
-- Table structure for table `personal_access_tokens`
--

CREATE TABLE `personal_access_tokens` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `tokenable_type` varchar(255) NOT NULL,
  `tokenable_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `token` varchar(64) NOT NULL,
  `abilities` text DEFAULT NULL,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `expires_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `pet_hotels`
--

CREATE TABLE `pet_hotels` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `appointment_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `check_out_date` date DEFAULT NULL,
  `price` decimal(8,2) DEFAULT NULL,
  `size` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `pet_hotels`
--

INSERT INTO `pet_hotels` (`id`, `appointment_id`, `created_at`, `updated_at`, `check_out_date`, `price`, `size`) VALUES
(1, 1, '2024-05-18 23:51:07', '2024-05-18 23:51:07', '2024-05-19', 250.00, 'small');

-- --------------------------------------------------------

--
-- Table structure for table `ratings`
--

CREATE TABLE `ratings` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `sale_id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `rating` int(10) UNSIGNED NOT NULL,
  `comment` text DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `sales`
--

CREATE TABLE `sales` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `product_id` bigint(20) UNSIGNED NOT NULL,
  `quantity` int(11) NOT NULL,
  `total_price` decimal(8,2) NOT NULL DEFAULT 0.00,
  `branch_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `status` varchar(255) NOT NULL DEFAULT 'pending'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `sales`
--

INSERT INTO `sales` (`id`, `user_id`, `product_id`, `quantity`, `total_price`, `branch_id`, `created_at`, `updated_at`, `status`) VALUES
(1, 2, 1, 20, 2000.00, 1, '2024-05-18 23:50:39', '2024-05-18 23:52:02', 'delivered'),
(2, 2, 2, 1, 300.00, 1, '2024-07-11 04:16:41', '2024-07-11 04:17:28', 'delivered'),
(3, 2, 2, 21, 6300.00, 1, '2024-07-18 00:45:57', '2024-07-18 00:47:04', 'delivered'),
(4, 2, 5, 10, 200.00, 1, '2024-07-25 02:14:59', '2024-07-25 02:53:30', 'delivered'),
(5, 2, 5, 21, 420.00, 1, '2024-07-25 02:24:11', '2024-07-25 02:54:28', 'delivered'),
(6, 2, 3, 21, 2100.00, 1, '2024-07-25 02:48:29', '2024-07-25 02:53:44', 'delivered'),
(7, 3, 2, 1, 300.00, 1, '2024-07-25 03:52:52', '2024-07-25 03:52:52', 'delivered'),
(8, 3, 2, 2, 600.00, 1, '2024-07-25 03:54:18', '2024-07-25 03:54:18', 'delivered');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `username` varchar(50) NOT NULL,
  `firstName` varchar(50) NOT NULL,
  `lastName` varchar(50) NOT NULL,
  `middleName` varchar(50) DEFAULT NULL,
  `region` varchar(255) DEFAULT NULL,
  `province` varchar(255) DEFAULT NULL,
  `city` varchar(255) DEFAULT NULL,
  `barangay` varchar(255) DEFAULT NULL,
  `address` varchar(255) NOT NULL DEFAULT '',
  `gender` enum('male','female','other') NOT NULL,
  `age` int(11) NOT NULL,
  `email` varchar(50) NOT NULL,
  `password` varchar(255) NOT NULL,
  `status` enum('pending','verified') NOT NULL DEFAULT 'pending',
  `created_at` timestamp NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `branch_id` int(11) DEFAULT NULL,
  `contact_number` varchar(255) DEFAULT NULL,
  `role` varchar(255) NOT NULL DEFAULT 'super_admin'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `username`, `firstName`, `lastName`, `middleName`, `region`, `province`, `city`, `barangay`, `address`, `gender`, `age`, `email`, `password`, `status`, `created_at`, `updated_at`, `branch_id`, `contact_number`, `role`) VALUES
(1, 'Admin', 'Super', 'Admin', 'Sample', '07', '0722', '072234', '072234011', 'Region VII (Central Visayas), Cebu, City Of Naga, Inayagan', 'male', 21, 'admin@gmail.com', '$2y$12$fdgOanPIhvLmMojg7CkV6uSIIT0Kw2ImD0Ac87Fat2Brqn8adbAKG', 'verified', '2024-07-26 19:07:46', '2024-07-26 19:44:56', 0, '09289802787', 'super_admin'),
(2, 'Staff', 'Staff', 'Employee', 'test', '07', '0722', '072234', '072234011', 'Region VII (Central Visayas), Cebu, City Of Naga, Inayagan', 'male', 21, 'staff@gmail.com', '$2y$12$zi5N4qkgiJyzcjPKd5m8yuwd1JsxiiOVAUvWdNtTrZSYxWB4fx0l.', 'verified', '2024-07-26 19:19:59', '2024-07-26 19:45:40', NULL, '09289802787', 'staff'),
(3, 'Patient', 'Sample', 'Patient', 'test', 'Region VII (Central Visayas)', 'Cebu', 'City Of Naga', 'Inayagan', '07, 0722, 072234, 072234011', 'male', 21, 'patient@gmail.com', '$2y$12$AewvFt1h1DnqwHXvKDoWUOXSqiDYuyXY9knQQP91dV.JXTvKqN6WS', 'verified', '2024-07-26 19:44:12', '2024-07-26 19:44:12', NULL, '09289802787', 'patient');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `appointments`
--
ALTER TABLE `appointments`
  ADD PRIMARY KEY (`id`),
  ADD KEY `appointments_clinic_id_foreign` (`branch_id`);

--
-- Indexes for table `audits`
--
ALTER TABLE `audits`
  ADD PRIMARY KEY (`id`),
  ADD KEY `audits_inventory_id_foreign` (`inventory_id`);

--
-- Indexes for table `branches`
--
ALTER TABLE `branches`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `carts`
--
ALTER TABLE `carts`
  ADD PRIMARY KEY (`id`),
  ADD KEY `carts_branch_id_foreign` (`branch_id`);

--
-- Indexes for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`);

--
-- Indexes for table `inventories`
--
ALTER TABLE `inventories`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `password_resets`
--
ALTER TABLE `password_resets`
  ADD KEY `password_resets_email_index` (`email`);

--
-- Indexes for table `password_reset_tokens`
--
ALTER TABLE `password_reset_tokens`
  ADD PRIMARY KEY (`email`);

--
-- Indexes for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  ADD KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`);

--
-- Indexes for table `pet_hotels`
--
ALTER TABLE `pet_hotels`
  ADD PRIMARY KEY (`id`),
  ADD KEY `pet_hotels_appointment_id_foreign` (`appointment_id`);

--
-- Indexes for table `ratings`
--
ALTER TABLE `ratings`
  ADD PRIMARY KEY (`id`),
  ADD KEY `ratings_sale_id_foreign` (`sale_id`);

--
-- Indexes for table `sales`
--
ALTER TABLE `sales`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `appointments`
--
ALTER TABLE `appointments`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `audits`
--
ALTER TABLE `audits`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `branches`
--
ALTER TABLE `branches`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `carts`
--
ALTER TABLE `carts`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=158;

--
-- AUTO_INCREMENT for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
