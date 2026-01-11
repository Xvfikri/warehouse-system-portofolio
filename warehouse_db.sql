-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Waktu pembuatan: 11 Jan 2026 pada 07.12
-- Versi server: 10.4.32-MariaDB
-- Versi PHP: 8.0.30

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `warehouse_db`
--

-- --------------------------------------------------------

--
-- Struktur dari tabel `cache`
--

CREATE TABLE `cache` (
  `key` varchar(255) NOT NULL,
  `value` mediumtext NOT NULL,
  `expiration` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `cache_locks`
--

CREATE TABLE `cache_locks` (
  `key` varchar(255) NOT NULL,
  `owner` varchar(255) NOT NULL,
  `expiration` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `categories`
--

CREATE TABLE `categories` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `description` text DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `categories`
--

INSERT INTO `categories` (`id`, `name`, `description`, `created_at`, `updated_at`) VALUES
(1, 'Electronics', 'Electronic devices and accessories', '2025-12-30 11:19:18', '2025-12-30 11:19:18'),
(2, 'Furniture', 'Office and home furniture', '2025-12-30 11:19:18', '2025-12-30 11:19:18'),
(3, 'Stationery', 'Office supplies', '2025-12-30 11:19:18', '2025-12-30 11:19:18'),
(4, 'Raw Materials', 'Materials for production', '2025-12-30 11:19:18', '2025-12-30 11:19:18'),
(5, 'Packaging', 'Boxes, tapes, and wrapping materials', '2025-12-30 11:19:18', '2025-12-30 11:19:18');

-- --------------------------------------------------------

--
-- Struktur dari tabel `failed_jobs`
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
-- Struktur dari tabel `jobs`
--

CREATE TABLE `jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `queue` varchar(255) NOT NULL,
  `payload` longtext NOT NULL,
  `attempts` tinyint(3) UNSIGNED NOT NULL,
  `reserved_at` int(10) UNSIGNED DEFAULT NULL,
  `available_at` int(10) UNSIGNED NOT NULL,
  `created_at` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `job_batches`
--

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
  `finished_at` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(255) NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '0001_01_01_000000_create_users_table', 1),
(2, '0001_01_01_000001_create_cache_table', 1),
(3, '0001_01_01_000002_create_jobs_table', 1),
(4, '2025_12_17_060620_create_categories_table', 1),
(5, '2025_12_17_060620_create_products_table', 1),
(6, '2025_12_17_060620_create_suppliers_table', 1),
(7, '2025_12_17_060620_create_transactions_table', 1),
(8, '2025_12_30_160858_update_database_for_case_study', 1),
(9, '2025_12_30_181745_add_status_to_transactions_and_adjustments', 1),
(10, '2026_01_02_230825_add_location_to_products_table', 2),
(11, '2026_01_02_231737_add_status_to_products_table', 3),
(12, '2026_01_02_231811_change_products_status_default', 4);

-- --------------------------------------------------------

--
-- Struktur dari tabel `password_reset_tokens`
--

CREATE TABLE `password_reset_tokens` (
  `email` varchar(255) NOT NULL,
  `token` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `products`
--

CREATE TABLE `products` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `category_id` bigint(20) UNSIGNED NOT NULL,
  `type` enum('raw_material','finished_good') NOT NULL DEFAULT 'raw_material',
  `sku` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `description` text DEFAULT NULL,
  `stock` int(11) NOT NULL DEFAULT 0,
  `min_stock` int(11) NOT NULL DEFAULT 10,
  `unit` varchar(255) NOT NULL DEFAULT 'pcs',
  `location` varchar(255) DEFAULT NULL,
  `status` enum('pending','approved','rejected') NOT NULL DEFAULT 'pending',
  `image` varchar(255) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `approved_by` bigint(20) UNSIGNED DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `products`
--

INSERT INTO `products` (`id`, `category_id`, `type`, `sku`, `name`, `description`, `stock`, `min_stock`, `unit`, `location`, `status`, `image`, `created_at`, `updated_at`, `approved_by`) VALUES
(1, 1, 'finished_good', 'GEB-23', 'AD', 'Adw', 3, 10, 'box', NULL, 'approved', 'products/2RwXCj6v2xcVOS0XEDinZJmI3CC8FBB4ZKHSoEWH.png', '2025-12-30 11:34:30', '2026-01-02 16:04:11', NULL),
(2, 3, 'raw_material', 'PRD-EFF02N-1', 'Product 1', 'Automated test product description for Product 1', 0, 6, 'Pcs', 'Aisle 2, Rack C', 'approved', NULL, '2026-01-02 16:10:37', '2026-01-02 16:10:37', NULL),
(3, 2, 'finished_good', 'PRD-YDV36P-2', 'Product 2', 'Automated test product description for Product 2', 0, 16, 'Pcs', 'Aisle 1, Rack B', 'approved', NULL, '2026-01-02 16:10:37', '2026-01-02 16:10:37', NULL),
(4, 3, 'raw_material', 'PRD-O71VXG-3', 'Product 3', 'Automated test product description for Product 3', 0, 17, 'Pcs', 'Aisle 2, Rack C', 'approved', NULL, '2026-01-02 16:10:37', '2026-01-02 16:10:37', NULL),
(5, 2, 'finished_good', 'PRD-BFZTBM-4', 'Product 4', 'Automated test product description for Product 4', 0, 12, 'Pcs', 'Aisle 1, Rack E', 'approved', NULL, '2026-01-02 16:10:37', '2026-01-02 16:10:37', NULL),
(6, 1, 'raw_material', 'PRD-JSKQI6-5', 'Product 5', 'Automated test product description for Product 5', 0, 7, 'Pcs', 'Aisle 1, Rack D', 'approved', NULL, '2026-01-02 16:10:37', '2026-01-02 16:10:37', NULL),
(7, 4, 'finished_good', 'PRD-VCE8YX-6', 'Product 6', 'Automated test product description for Product 6', 0, 9, 'Pcs', 'Aisle 1, Rack E', 'approved', NULL, '2026-01-02 16:10:37', '2026-01-02 16:10:37', NULL),
(8, 2, 'raw_material', 'PRD-ZCUVFB-7', 'Product 7', 'Automated test product description for Product 7', 0, 8, 'Pcs', 'Aisle 3, Rack C', 'approved', NULL, '2026-01-02 16:10:37', '2026-01-02 16:10:37', NULL),
(9, 2, 'finished_good', 'PRD-LJ3WY5-8', 'Product 8', 'Automated test product description for Product 8', 0, 19, 'Pcs', 'Aisle 1, Rack D', 'approved', NULL, '2026-01-02 16:10:37', '2026-01-02 16:10:37', NULL),
(10, 1, 'raw_material', 'PRD-PWNZGY-9', 'Product 9', 'Automated test product description for Product 9', 0, 7, 'Pcs', 'Aisle 3, Rack B', 'approved', NULL, '2026-01-02 16:10:37', '2026-01-02 16:10:37', NULL),
(11, 5, 'finished_good', 'PRD-SW7KRA-10', 'Product 10', 'Automated test product description for Product 10', 0, 19, 'Pcs', 'Aisle 5, Rack B', 'approved', NULL, '2026-01-02 16:10:37', '2026-01-02 16:10:37', NULL),
(12, 5, 'raw_material', 'PRD-K5B33I-11', 'Product 11', 'Automated test product description for Product 11', 0, 10, 'Pcs', 'Aisle 4, Rack C', 'approved', NULL, '2026-01-02 16:10:37', '2026-01-02 16:10:37', NULL),
(13, 2, 'finished_good', 'PRD-EVLZHH-12', 'Product 12', 'Automated test product description for Product 12', 0, 13, 'Pcs', 'Aisle 2, Rack E', 'approved', NULL, '2026-01-02 16:10:37', '2026-01-02 16:10:37', NULL),
(14, 4, 'raw_material', 'PRD-6CNZ2C-13', 'Product 13', 'Automated test product description for Product 13', 0, 7, 'Pcs', 'Aisle 3, Rack B', 'approved', NULL, '2026-01-02 16:10:37', '2026-01-02 16:10:37', NULL),
(15, 2, 'finished_good', 'PRD-HJHZD5-14', 'Product 14', 'Automated test product description for Product 14', 0, 13, 'Pcs', 'Aisle 5, Rack A', 'approved', NULL, '2026-01-02 16:10:37', '2026-01-02 16:10:37', NULL),
(16, 5, 'raw_material', 'PRD-TIEMKV-15', 'Product 15', 'Automated test product description for Product 15', 0, 16, 'Pcs', 'Aisle 4, Rack D', 'approved', NULL, '2026-01-02 16:10:37', '2026-01-02 16:10:37', NULL),
(17, 3, 'finished_good', 'PRD-ZJG1Q2-16', 'Product 16', 'Automated test product description for Product 16', 0, 20, 'Pcs', 'Aisle 3, Rack C', 'approved', NULL, '2026-01-02 16:10:37', '2026-01-02 16:10:37', NULL),
(18, 1, 'raw_material', 'PRD-43W0KH-17', 'Product 17', 'Automated test product description for Product 17', 0, 10, 'Pcs', 'Aisle 3, Rack B', 'approved', NULL, '2026-01-02 16:10:37', '2026-01-02 16:10:37', NULL),
(19, 2, 'finished_good', 'PRD-QW989A-18', 'Product 18', 'Automated test product description for Product 18', 0, 17, 'Pcs', 'Aisle 4, Rack E', 'approved', NULL, '2026-01-02 16:10:37', '2026-01-02 16:10:37', NULL),
(20, 5, 'raw_material', 'PRD-IVOL75-19', 'Product 19', 'Automated test product description for Product 19', 0, 8, 'Pcs', 'Aisle 1, Rack A', 'approved', NULL, '2026-01-02 16:10:37', '2026-01-02 16:10:37', NULL),
(21, 3, 'finished_good', 'PRD-JCW0VQ-20', 'Product 20', 'Automated test product description for Product 20', 0, 7, 'Pcs', 'Aisle 5, Rack E', 'approved', NULL, '2026-01-02 16:10:37', '2026-01-02 16:10:37', NULL),
(22, 2, 'raw_material', 'PRD-YWLD3R-21', 'Product 21', 'Automated test product description for Product 21', 0, 11, 'Pcs', 'Aisle 1, Rack A', 'approved', NULL, '2026-01-02 16:10:37', '2026-01-02 16:10:37', NULL),
(23, 1, 'finished_good', 'PRD-8A3FIR-22', 'Product 22', 'Automated test product description for Product 22', 0, 19, 'Pcs', 'Aisle 4, Rack A', 'approved', NULL, '2026-01-02 16:10:37', '2026-01-02 16:10:37', NULL),
(24, 5, 'raw_material', 'PRD-Z4HAG8-23', 'Product 23', 'Automated test product description for Product 23', 0, 5, 'Pcs', 'Aisle 4, Rack A', 'approved', NULL, '2026-01-02 16:10:37', '2026-01-02 16:10:37', NULL),
(25, 1, 'finished_good', 'PRD-IBS48J-24', 'Product 24', 'Automated test product description for Product 24', 0, 10, 'Pcs', 'Aisle 4, Rack A', 'approved', NULL, '2026-01-02 16:10:37', '2026-01-02 16:10:37', NULL),
(26, 2, 'raw_material', 'PRD-ZGBDLS-25', 'Product 25', 'Automated test product description for Product 25', 0, 11, 'Pcs', 'Aisle 3, Rack C', 'approved', NULL, '2026-01-02 16:10:37', '2026-01-02 16:10:37', NULL),
(27, 5, 'finished_good', 'PRD-CSUPU7-26', 'Product 26', 'Automated test product description for Product 26', 0, 16, 'Pcs', 'Aisle 5, Rack B', 'approved', NULL, '2026-01-02 16:10:37', '2026-01-02 16:10:37', NULL),
(28, 2, 'raw_material', 'PRD-C4IIMI-27', 'Product 27', 'Automated test product description for Product 27', 0, 5, 'Pcs', 'Aisle 3, Rack B', 'approved', NULL, '2026-01-02 16:10:37', '2026-01-02 16:10:37', NULL),
(29, 1, 'finished_good', 'PRD-KAISCT-28', 'Product 28', 'Automated test product description for Product 28', 0, 19, 'Pcs', 'Aisle 2, Rack B', 'approved', NULL, '2026-01-02 16:10:37', '2026-01-02 16:10:37', NULL),
(30, 3, 'raw_material', 'PRD-LTHGAT-29', 'Product 29', 'Automated test product description for Product 29', 0, 7, 'Pcs', 'Aisle 4, Rack E', 'approved', NULL, '2026-01-02 16:10:37', '2026-01-02 16:10:37', NULL),
(31, 3, 'finished_good', 'PRD-J3SXRJ-30', 'Product 30', 'Automated test product description for Product 30', 0, 5, 'Pcs', 'Aisle 1, Rack B', 'approved', NULL, '2026-01-02 16:10:37', '2026-01-02 16:10:37', NULL),
(32, 4, 'finished_good', 'GEN-3', 'COBA', 'ADW', 76, 10, 'Pcs', 'RACK B2', 'approved', 'products/AcKCZGLrWXeGduIh47iF9AujCsY2ioA88wXeQMcC.png', '2026-01-02 16:23:35', '2026-01-02 16:25:36', 1),
(33, 1, 'raw_material', 'gen5', 'kuibk', 'kuv', 0, 10, 'pcs', 'Rack 1', 'pending', 'products/rNj0M47AwRx6WAQTj1zqsGLjtNhccYTUwfshwJoK.png', '2026-01-03 03:19:38', '2026-01-03 03:19:38', NULL);

-- --------------------------------------------------------

--
-- Struktur dari tabel `product_batches`
--

CREATE TABLE `product_batches` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `product_id` bigint(20) UNSIGNED NOT NULL,
  `batch_number` varchar(255) NOT NULL,
  `quantity` int(11) NOT NULL DEFAULT 0,
  `received_date` date DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `product_batches`
--

INSERT INTO `product_batches` (`id`, `product_id`, `batch_number`, `quantity`, `received_date`, `created_at`, `updated_at`) VALUES
(1, 1, '23', 1, '2025-12-30', '2025-12-30 11:48:54', '2026-01-02 16:04:11'),
(2, 32, 'BATCH-2', 21, '2026-01-02', '2026-01-02 16:25:36', '2026-01-02 16:25:36');

-- --------------------------------------------------------

--
-- Struktur dari tabel `sessions`
--

CREATE TABLE `sessions` (
  `id` varchar(255) NOT NULL,
  `user_id` bigint(20) UNSIGNED DEFAULT NULL,
  `ip_address` varchar(45) DEFAULT NULL,
  `user_agent` text DEFAULT NULL,
  `payload` longtext NOT NULL,
  `last_activity` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `sessions`
--

INSERT INTO `sessions` (`id`, `user_id`, `ip_address`, `user_agent`, `payload`, `last_activity`) VALUES
('oN5RWaxAOHmR9hNd4916oLZ6tYTNCIWwD3Z7oBRM', 2, '127.0.0.1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36', 'YTo0OntzOjY6Il90b2tlbiI7czo0MDoiNjlub2VHM0ttRHJDa1dRTnBBZjVRcEI0NW5HWDhSR1U5Rnk4SjhHYyI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6NDc6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMC90cmFuc2FjdGlvbnM/dHlwZT1pbmJvdW5kIjtzOjU6InJvdXRlIjtzOjE4OiJ0cmFuc2FjdGlvbnMuaW5kZXgiO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX1zOjUwOiJsb2dpbl93ZWJfNTliYTM2YWRkYzJiMmY5NDAxNTgwZjAxNGM3ZjU4ZWE0ZTMwOTg5ZCI7aToyO30=', 1767435850),
('qKUezM9ANwePHJYv3W9oJpvyqFUHsjc6GezIPOzb', 1, '127.0.0.1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36', 'YTo0OntzOjY6Il90b2tlbiI7czo0MDoiRXdTQ3FPc29pSHhuQUZ1V0tiVWhzamJuMmtYTDQ2bnBTak1Fc0gzaSI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6MzE6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMC9kYXNoYm9hcmQiO3M6NToicm91dGUiO3M6OToiZGFzaGJvYXJkIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319czo1MDoibG9naW5fd2ViXzU5YmEzNmFkZGMyYjJmOTQwMTU4MGYwMTRjN2Y1OGVhNGUzMDk4OWQiO2k6MTt9', 1767436022);

-- --------------------------------------------------------

--
-- Struktur dari tabel `stock_adjustments`
--

CREATE TABLE `stock_adjustments` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `product_id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `product_batch_id` bigint(20) UNSIGNED DEFAULT NULL,
  `quantity_diff` int(11) NOT NULL,
  `reason` varchar(255) NOT NULL,
  `status` enum('pending','approved','rejected') NOT NULL DEFAULT 'pending',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `approved_by` bigint(20) UNSIGNED DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `stock_adjustments`
--

INSERT INTO `stock_adjustments` (`id`, `product_id`, `user_id`, `product_batch_id`, `quantity_diff`, `reason`, `status`, `created_at`, `updated_at`, `approved_by`) VALUES
(1, 1, 1, NULL, 2, 'AD', 'approved', '2025-12-30 11:36:28', '2025-12-30 11:36:31', 1),
(2, 1, 1, 1, 19, 'ADWhib', 'approved', '2025-12-30 11:50:21', '2025-12-30 11:51:36', 1),
(3, 1, 1, 1, -39, 'AWD', 'approved', '2026-01-02 16:04:05', '2026-01-02 16:04:11', 1),
(4, 32, 1, NULL, 55, 'AWD', 'approved', '2026-01-02 16:24:52', '2026-01-02 16:24:59', 1);

-- --------------------------------------------------------

--
-- Struktur dari tabel `suppliers`
--

CREATE TABLE `suppliers` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `contact_person` varchar(255) DEFAULT NULL,
  `phone` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `address` text DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `suppliers`
--

INSERT INTO `suppliers` (`id`, `name`, `contact_person`, `phone`, `email`, `address`, `created_at`, `updated_at`) VALUES
(1, 'MEDICNE', '0921313', '2313224', 'baru@gmail.com', 'BAndung', '2025-12-30 11:35:28', '2025-12-30 11:35:28');

-- --------------------------------------------------------

--
-- Struktur dari tabel `transactions`
--

CREATE TABLE `transactions` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `product_id` bigint(20) UNSIGNED NOT NULL,
  `product_batch_id` bigint(20) UNSIGNED DEFAULT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `supplier_id` bigint(20) UNSIGNED DEFAULT NULL,
  `type` enum('inbound','outbound') NOT NULL,
  `quantity` int(11) NOT NULL,
  `date` date NOT NULL,
  `recipient` varchar(255) DEFAULT NULL,
  `notes` text DEFAULT NULL,
  `status` enum('pending','approved','rejected') NOT NULL DEFAULT 'pending',
  `batch_number` varchar(255) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `approved_by` bigint(20) UNSIGNED DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `transactions`
--

INSERT INTO `transactions` (`id`, `product_id`, `product_batch_id`, `user_id`, `supplier_id`, `type`, `quantity`, `date`, `recipient`, `notes`, `status`, `batch_number`, `created_at`, `updated_at`, `approved_by`) VALUES
(1, 1, NULL, 1, 1, 'inbound', 21, '2025-12-30', NULL, 'AWd', 'rejected', NULL, '2025-12-30 11:35:52', '2025-12-30 11:39:41', 1),
(2, 1, NULL, 2, 1, 'inbound', 23, '2025-12-30', NULL, 'AWD', 'rejected', NULL, '2025-12-30 11:39:16', '2026-01-02 16:24:35', 1),
(3, 1, NULL, 1, 1, 'inbound', 21, '2025-12-30', NULL, 'AD', 'rejected', NULL, '2025-12-30 11:41:48', '2026-01-02 16:24:34', 1),
(4, 1, NULL, 1, 1, 'inbound', 23, '2025-12-30', NULL, 'AWD', 'rejected', NULL, '2025-12-30 11:43:02', '2026-01-02 16:24:33', 1),
(5, 1, NULL, 1, 1, 'inbound', 23, '2025-12-30', NULL, 'ADw', 'rejected', NULL, '2025-12-30 11:43:28', '2025-12-31 01:04:35', 1),
(6, 1, 1, 1, 1, 'inbound', 21, '2025-12-30', NULL, 'AWD', 'approved', '23', '2025-12-30 11:48:49', '2025-12-30 11:48:54', 1),
(7, 32, 2, 1, 1, 'inbound', 21, '2026-01-02', NULL, 'AWD', 'approved', 'BATCH-2', '2026-01-02 16:25:32', '2026-01-02 16:25:36', 1);

-- --------------------------------------------------------

--
-- Struktur dari tabel `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `role` enum('supervisor','staff') NOT NULL DEFAULT 'staff',
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) NOT NULL,
  `remember_token` varchar(100) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `role`, `email_verified_at`, `password`, `remember_token`, `created_at`, `updated_at`) VALUES
(1, 'Supervisor Gudang', 'supervisor@test.com', 'supervisor', '2025-12-30 11:19:17', '$2y$12$km67eP0nJT0/39E3cYxSPOh/IHi3/DukHpoORvK/yZY9gUR1prbvi', 'frUcPDL81IvWPkkEoGlKOOZ5JUKTn1GvrKHsnWwFLGL00Ym9jwA5v1RC4bdv', '2025-12-30 11:19:18', '2025-12-30 11:19:18'),
(2, 'Staff Gudang', 'staff@test.com', 'staff', '2025-12-30 11:19:18', '$2y$12$RyWUPV7M4eJz804/vkZo2e6K8SxgC56WYPr6AZnTRlNZt.Tmz5m5y', '0mZYhCQHFA', '2025-12-30 11:19:18', '2025-12-30 11:19:18');

--
-- Indexes for dumped tables
--

--
-- Indeks untuk tabel `cache`
--
ALTER TABLE `cache`
  ADD PRIMARY KEY (`key`);

--
-- Indeks untuk tabel `cache_locks`
--
ALTER TABLE `cache_locks`
  ADD PRIMARY KEY (`key`);

--
-- Indeks untuk tabel `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `categories_name_unique` (`name`);

--
-- Indeks untuk tabel `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`);

--
-- Indeks untuk tabel `jobs`
--
ALTER TABLE `jobs`
  ADD PRIMARY KEY (`id`),
  ADD KEY `jobs_queue_index` (`queue`);

--
-- Indeks untuk tabel `job_batches`
--
ALTER TABLE `job_batches`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `password_reset_tokens`
--
ALTER TABLE `password_reset_tokens`
  ADD PRIMARY KEY (`email`);

--
-- Indeks untuk tabel `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `products_sku_unique` (`sku`),
  ADD KEY `products_category_id_foreign` (`category_id`),
  ADD KEY `products_approved_by_foreign` (`approved_by`);

--
-- Indeks untuk tabel `product_batches`
--
ALTER TABLE `product_batches`
  ADD PRIMARY KEY (`id`),
  ADD KEY `product_batches_product_id_foreign` (`product_id`);

--
-- Indeks untuk tabel `sessions`
--
ALTER TABLE `sessions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `sessions_user_id_index` (`user_id`),
  ADD KEY `sessions_last_activity_index` (`last_activity`);

--
-- Indeks untuk tabel `stock_adjustments`
--
ALTER TABLE `stock_adjustments`
  ADD PRIMARY KEY (`id`),
  ADD KEY `stock_adjustments_product_id_foreign` (`product_id`),
  ADD KEY `stock_adjustments_user_id_foreign` (`user_id`),
  ADD KEY `stock_adjustments_product_batch_id_foreign` (`product_batch_id`),
  ADD KEY `stock_adjustments_approved_by_foreign` (`approved_by`);

--
-- Indeks untuk tabel `suppliers`
--
ALTER TABLE `suppliers`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `transactions`
--
ALTER TABLE `transactions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `transactions_product_id_foreign` (`product_id`),
  ADD KEY `transactions_user_id_foreign` (`user_id`),
  ADD KEY `transactions_supplier_id_foreign` (`supplier_id`),
  ADD KEY `transactions_product_batch_id_foreign` (`product_batch_id`),
  ADD KEY `transactions_approved_by_foreign` (`approved_by`);

--
-- Indeks untuk tabel `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`);

--
-- AUTO_INCREMENT untuk tabel yang dibuang
--

--
-- AUTO_INCREMENT untuk tabel `categories`
--
ALTER TABLE `categories`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT untuk tabel `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `jobs`
--
ALTER TABLE `jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT untuk tabel `products`
--
ALTER TABLE `products`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=34;

--
-- AUTO_INCREMENT untuk tabel `product_batches`
--
ALTER TABLE `product_batches`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT untuk tabel `stock_adjustments`
--
ALTER TABLE `stock_adjustments`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT untuk tabel `suppliers`
--
ALTER TABLE `suppliers`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT untuk tabel `transactions`
--
ALTER TABLE `transactions`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT untuk tabel `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- Ketidakleluasaan untuk tabel pelimpahan (Dumped Tables)
--

--
-- Ketidakleluasaan untuk tabel `products`
--
ALTER TABLE `products`
  ADD CONSTRAINT `products_approved_by_foreign` FOREIGN KEY (`approved_by`) REFERENCES `users` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `products_category_id_foreign` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id`) ON DELETE CASCADE;

--
-- Ketidakleluasaan untuk tabel `product_batches`
--
ALTER TABLE `product_batches`
  ADD CONSTRAINT `product_batches_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE;

--
-- Ketidakleluasaan untuk tabel `stock_adjustments`
--
ALTER TABLE `stock_adjustments`
  ADD CONSTRAINT `stock_adjustments_approved_by_foreign` FOREIGN KEY (`approved_by`) REFERENCES `users` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `stock_adjustments_product_batch_id_foreign` FOREIGN KEY (`product_batch_id`) REFERENCES `product_batches` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `stock_adjustments_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `stock_adjustments_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Ketidakleluasaan untuk tabel `transactions`
--
ALTER TABLE `transactions`
  ADD CONSTRAINT `transactions_approved_by_foreign` FOREIGN KEY (`approved_by`) REFERENCES `users` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `transactions_product_batch_id_foreign` FOREIGN KEY (`product_batch_id`) REFERENCES `product_batches` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `transactions_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `transactions_supplier_id_foreign` FOREIGN KEY (`supplier_id`) REFERENCES `suppliers` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `transactions_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
