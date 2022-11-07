-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Nov 06, 2022 at 08:51 PM
-- Server version: 10.4.25-MariaDB
-- PHP Version: 8.1.10

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `goodday`
--

-- --------------------------------------------------------

--
-- Table structure for table `blogs`
--

CREATE TABLE `blogs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `title` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `short_description` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `text` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_create` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `blogs`
--

INSERT INTO `blogs` (`id`, `title`, `short_description`, `text`, `user_create`, `created_at`, `updated_at`) VALUES
(1, 'test 1 - edit', 'short desc', 'text', 1, '2022-11-05 20:22:35', '2022-11-05 19:59:10'),
(2, 'qwe', 'asd', 'zxc', 1, '2022-11-05 19:16:13', '2022-11-05 19:16:13'),
(4, '123', 'qwe', 'zxc', 2, '2022-11-05 19:16:57', '2022-11-05 19:16:57'),
(5, 'BLog with 5 paragraphs', 'ill show a blog with 5 paragraphs', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Quisque non ante nec orci gravida vestibulum. Curabitur vitae enim dui. Mauris et ultricies tellus. In nibh dui, mattis vel tempor vel, fermentum vitae eros. Vestibulum posuere nisi libero, sed gravida purus tempor id. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Praesent et massa at mauris mollis congue in blandit erat. Suspendisse finibus nec orci vel tempor. Fusce tempor varius neque vitae lacinia. Curabitur laoreet vitae nunc sed congue. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia curae;  Quisque id iaculis ipsum, quis luctus quam. Integer dapibus nisl eu elementum bibendum. Morbi risus nisi, sollicitudin at massa id, feugiat convallis velit. Maecenas id lectus ac eros tristique faucibus. Integer venenatis ipsum lectus, tempus venenatis magna euismod vel. Nam laoreet tellus a varius elementum. Cras eu interdum dolor. Phasellus sapien justo, dignissim ac blandit id, condimentum quis erat. Morbi aliquam felis enim, eu maximus purus mattis at. Mauris tellus urna, lobortis porta sagittis eget, consequat interdum elit. Nunc tempus, justo sed egestas luctus, nisi neque ultricies enim, eget sodales magna nisi ut eros.  In purus dui, viverra quis molestie vitae, faucibus eget eros. Phasellus scelerisque eros in metus pretium interdum. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia curae; Ut accumsan ipsum quis accumsan mollis. Suspendisse sed tortor a tellus placerat pharetra. Cras vel efficitur nisi, non dictum nisi. Proin eget malesuada ante, eu auctor purus. Vestibulum et nisl elit. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia curae; Pellentesque vitae ex et ipsum consequat dapibus sed sollicitudin sem.  Pellentesque cursus libero eget semper fringilla. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia curae; Pellentesque et augue metus. Donec sem neque, pretium sit amet tellus vel, dignissim imperdiet nibh. Morbi blandit dui vel consequat varius. Pellentesque a nisi a libero ornare pellentesque. Etiam ultricies dolor sit amet elit varius, sit amet posuere ligula commodo.  Fusce pulvinar erat vitae urna maximus sodales ac quis odio. Nulla blandit, mauris sodales ullamcorper ullamcorper, quam eros viverra orci, non egestas enim nisi luctus elit. Integer consectetur hendrerit posuere. Ut iaculis dolor a lacus dictum mattis. Ut consequat nec sapien eget placerat. Fusce metus magna, cursus non metus tincidunt, ornare dignissim lacus. Phasellus rhoncus ligula lectus, at volutpat eros commodo nec. Praesent pharetra lectus metus. Vivamus vel fringilla nunc, id tempor erat. Suspendisse interdum eros et metus mollis mollis.', 2, '2022-11-05 20:12:20', '2022-11-05 20:12:20'),
(6, 'News 1', 'News 1 Desc', 'News 1 text', 1, '2022-11-05 20:41:58', '2022-11-05 20:41:58');

-- --------------------------------------------------------

--
-- Table structure for table `failed_jobs`
--

CREATE TABLE `failed_jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `uuid` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
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
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '2014_10_12_000000_create_users_table', 1),
(2, '2014_10_12_100000_create_password_resets_table', 1),
(3, '2014_10_12_200000_add_two_factor_columns_to_users_table', 1),
(4, '2019_08_19_000000_create_failed_jobs_table', 1),
(5, '2019_12_14_000001_create_personal_access_tokens_table', 1),
(6, '2022_10_28_190930_create_sessions_table', 1),
(7, '2022_10_28_200811_create_permission_tables', 1),
(8, '2022_11_05_194104_create_blog_table', 2),
(9, '2022_11_05_195211_create_news_table', 2),
(11, '2022_11_05_222824_blog_and_news_permissions', 3);

-- --------------------------------------------------------

--
-- Table structure for table `model_has_permissions`
--

CREATE TABLE `model_has_permissions` (
  `permission_id` bigint(20) UNSIGNED NOT NULL,
  `model_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `model_id` bigint(20) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `model_has_roles`
--

CREATE TABLE `model_has_roles` (
  `role_id` bigint(20) UNSIGNED NOT NULL,
  `model_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `model_id` bigint(20) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `model_has_roles`
--

INSERT INTO `model_has_roles` (`role_id`, `model_type`, `model_id`) VALUES
(1, 'App\\Models\\User', 1),
(1, 'App\\Models\\User', 2),
(2, 'App\\Models\\User', 1);

-- --------------------------------------------------------

--
-- Table structure for table `news`
--

CREATE TABLE `news` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `title` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `short_description` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `text` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_create` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `news`
--

INSERT INTO `news` (`id`, `title`, `short_description`, `text`, `user_create`, `created_at`, `updated_at`) VALUES
(1, 'Test 2 - edit', 'Test 2 desc', 'Test 2 text', 1, '2022-11-05 20:43:25', '2022-11-05 20:45:42'),
(2, 'Test 3', 'Test 3 desc', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Cras augue augue, accumsan vel pellentesque ac, convallis a ligula. Donec sagittis viverra dolor, ut cursus ipsum finibus ac. Curabitur consequat tempor quam a euismod. Etiam a elit ante. Suspendisse aliquam nibh tortor. Etiam commodo molestie ligula, vulputate cursus tellus rhoncus et. Aliquam vulputate vehicula scelerisque. Proin ut aliquet mauris, at vehicula lorem. Ut rutrum eros euismod, volutpat odio nec, pellentesque lectus.  Sed vel risus ornare, condimentum enim convallis, venenatis mi. Ut ac laoreet lacus, nec molestie leo. Nulla vel dolor quam. Vivamus nec interdum massa, ut facilisis magna. Curabitur blandit, neque at condimentum tincidunt, lectus turpis aliquam erat, non euismod magna orci et sapien. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Donec eget urna et mi accumsan auctor non eleifend nunc. Morbi libero nulla, elementum et velit in, hendrerit porttitor ipsum. Ut posuere eros vel massa posuere, quis consectetur enim pulvinar. Praesent a ante non arcu viverra feugiat. Mauris vitae vehicula ex. Proin dignissim placerat nibh, at dictum tellus tincidunt sit amet. Nullam nisi justo, euismod vel lacus at, rutrum ultrices mi.  Mauris facilisis gravida ante, ut ornare nulla tempor euismod. Nunc ac laoreet eros, id egestas nisi. Aenean id semper risus, eget ultricies ligula. Nulla eget aliquet mauris. Pellentesque id consectetur mi. Pellentesque nec aliquet velit. Suspendisse eleifend est metus, vitae ultrices magna mollis in. Integer mattis fermentum mollis. Maecenas in imperdiet elit, a sodales velit. Aliquam sit amet ligula lorem. Praesent eleifend non sem ut vehicula. Mauris rutrum purus eget est porttitor, congue egestas leo molestie.', 1, '2022-11-05 20:52:10', '2022-11-05 20:52:10'),
(3, 'Test 4', 'Test 4 desc', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Cras augue augue, accumsan vel pellentesque ac, convallis a ligula. Donec sagittis viverra dolor, ut cursus ipsum finibus ac. Curabitur consequat tempor quam a euismod. Etiam a elit ante. Suspendisse aliquam nibh tortor. Etiam commodo molestie ligula, vulputate cursus tellus rhoncus et. Aliquam vulputate vehicula scelerisque. Proin ut aliquet mauris, at vehicula lorem. Ut rutrum eros euismod, volutpat odio nec, pellentesque lectus.', 1, '2022-11-05 20:52:31', '2022-11-05 20:52:31'),
(4, 'Test 5', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Quisque sollicitudin nulla justo, et aliquet ex mattis eu. Sed laoreet ipsum nec egestas sodales', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Cras augue augue, accumsan vel pellentesque ac, convallis a ligula. Donec sagittis viverra dolor, ut cursus ipsum finibus ac. Curabitur consequat tempor quam a euismod. Etiam a elit ante. Suspendisse aliquam nibh tortor. Etiam commodo molestie ligula, vulputate cursus tellus rhoncus et. Aliquam vulputate vehicula scelerisque. Proin ut aliquet mauris, at vehicula lorem. Ut rutrum eros euismod, volutpat odio nec, pellentesque lectus.  Sed vel risus ornare, condimentum enim convallis, venenatis mi. Ut ac laoreet lacus, nec molestie leo. Nulla vel dolor quam. Vivamus nec interdum massa, ut facilisis magna. Curabitur blandit, neque at condimentum tincidunt, lectus turpis aliquam erat, non euismod magna orci et sapien. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Donec eget urna et mi accumsan auctor non eleifend nunc. Morbi libero nulla, elementum et velit in, hendrerit porttitor ipsum. Ut posuere eros vel massa posuere, quis consectetur enim pulvinar. Praesent a ante non arcu viverra feugiat. Mauris vitae vehicula ex. Proin dignissim placerat nibh, at dictum tellus tincidunt sit amet. Nullam nisi justo, euismod vel lacus at, rutrum ultrices mi.  Mauris facilisis gravida ante, ut ornare nulla tempor euismod. Nunc ac laoreet eros, id egestas nisi. Aenean id semper risus, eget ultricies ligula. Nulla eget aliquet mauris. Pellentesque id consectetur mi. Pellentesque nec aliquet velit. Suspendisse eleifend est metus, vitae ultrices magna mollis in. Integer mattis fermentum mollis. Maecenas in imperdiet elit, a sodales velit. Aliquam sit amet ligula lorem. Praesent eleifend non sem ut vehicula. Mauris rutrum purus eget est porttitor, congue egestas leo molestie.  Praesent mattis dignissim risus nec fermentum. Aenean vestibulum hendrerit sem vel sollicitudin. Vestibulum elit sem, iaculis ac dapibus tincidunt, aliquam nec dui. Morbi facilisis nunc ut nibh commodo, id congue quam consectetur. In vitae nunc ultricies, semper enim nec, interdum leo. Donec ac fermentum lacus, sit amet congue arcu. Praesent facilisis faucibus lectus sit amet posuere.  Pellentesque fringilla bibendum lacus, ut facilisis ligula consequat eu. Nunc eget tortor turpis. Nullam ornare egestas ante quis euismod. Fusce auctor, augue at mattis convallis, leo massa imperdiet dui, non gravida ex sapien at ligula. Suspendisse sit amet libero nibh. Maecenas dignissim neque ac ante volutpat, vitae ullamcorper mi condimentum. Duis a urna quam. Ut eget purus a odio ultrices ornare. Quisque ipsum enim, ullamcorper sit amet enim ac, tincidunt efficitur ante. Aliquam a lacinia ipsum. Sed consectetur metus ornare varius congue.', 1, '2022-11-05 20:53:42', '2022-11-05 20:53:42');

-- --------------------------------------------------------

--
-- Table structure for table `password_resets`
--

CREATE TABLE `password_resets` (
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `permissions`
--

CREATE TABLE `permissions` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `guard_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `permissions`
--

INSERT INTO `permissions` (`id`, `name`, `guard_name`, `created_at`, `updated_at`) VALUES
(1, 'permission list', 'web', '2022-10-29 06:49:39', '2022-10-29 06:49:39'),
(2, 'permission create', 'web', '2022-10-29 06:49:39', '2022-10-29 06:49:39'),
(3, 'permission edit', 'web', '2022-10-29 06:49:39', '2022-10-29 06:49:39'),
(4, 'permission delete', 'web', '2022-10-29 06:49:39', '2022-10-29 06:49:39'),
(5, 'role list', 'web', '2022-10-29 06:49:39', '2022-10-29 06:49:39'),
(6, 'role create', 'web', '2022-10-29 06:49:39', '2022-10-29 06:49:39'),
(7, 'role edit', 'web', '2022-10-29 06:49:39', '2022-10-29 06:49:39'),
(8, 'role delete', 'web', '2022-10-29 06:49:39', '2022-10-29 06:49:39'),
(9, 'user list', 'web', '2022-10-29 06:49:39', '2022-10-29 06:49:39'),
(10, 'user create', 'web', '2022-10-29 06:49:39', '2022-10-29 06:49:39'),
(11, 'user edit', 'web', '2022-10-29 06:49:39', '2022-10-29 06:49:39'),
(12, 'user delete', 'web', '2022-10-29 06:49:39', '2022-10-29 06:49:39'),
(13, 'role permissions', 'web', '2022-10-29 15:45:06', '2022-10-29 15:45:06'),
(24, 'blog list', 'web', '2022-11-05 20:36:41', '2022-11-05 20:36:41'),
(25, 'blog create', 'web', '2022-11-05 20:36:41', '2022-11-05 20:36:41'),
(26, 'blog edit', 'web', '2022-11-05 20:36:41', '2022-11-05 20:36:41'),
(27, 'blog delete', 'web', '2022-11-05 20:36:41', '2022-11-05 20:36:41'),
(28, 'news list', 'web', '2022-11-05 20:36:41', '2022-11-05 20:36:41'),
(29, 'news create', 'web', '2022-11-05 20:36:41', '2022-11-05 20:36:41'),
(30, 'news edit', 'web', '2022-11-05 20:36:41', '2022-11-05 20:36:41'),
(31, 'news delete', 'web', '2022-11-05 20:36:41', '2022-11-05 20:36:41');

-- --------------------------------------------------------

--
-- Table structure for table `personal_access_tokens`
--

CREATE TABLE `personal_access_tokens` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `tokenable_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tokenable_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL,
  `abilities` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `expires_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `roles`
--

CREATE TABLE `roles` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `guard_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `roles`
--

INSERT INTO `roles` (`id`, `name`, `guard_name`, `created_at`, `updated_at`) VALUES
(1, 'user', 'web', '2022-10-29 06:49:39', '2022-10-29 06:49:39'),
(2, 'admin', 'web', '2022-10-29 06:49:39', '2022-10-29 06:49:39');

-- --------------------------------------------------------

--
-- Table structure for table `role_has_permissions`
--

CREATE TABLE `role_has_permissions` (
  `permission_id` bigint(20) UNSIGNED NOT NULL,
  `role_id` bigint(20) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `role_has_permissions`
--

INSERT INTO `role_has_permissions` (`permission_id`, `role_id`) VALUES
(1, 2),
(2, 2),
(3, 2),
(4, 2),
(5, 2),
(6, 2),
(7, 2),
(8, 2),
(9, 2),
(10, 2),
(11, 2),
(12, 2),
(13, 2),
(24, 1),
(24, 2),
(25, 1),
(25, 2),
(26, 1),
(26, 2),
(27, 1),
(27, 2),
(28, 1),
(28, 2),
(29, 2),
(30, 2),
(31, 2);

-- --------------------------------------------------------

--
-- Table structure for table `sessions`
--

CREATE TABLE `sessions` (
  `id` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` bigint(20) UNSIGNED DEFAULT NULL,
  `ip_address` varchar(45) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `user_agent` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `last_activity` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `sessions`
--

INSERT INTO `sessions` (`id`, `user_id`, `ip_address`, `user_agent`, `payload`, `last_activity`) VALUES
('8m8R5ZPhMosTluzaDF41YVpH2QTOmZlSyW7KrmTl', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/106.0.0.0 Safari/537.36 OPR/92.0.0.0', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiVEhjdUFpUlU2aWl6ZEFmNlZ0emlBVlFUdWU4dm5rNW8yUWdudWdNaSI7czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6Mjg6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMC9uZXdzLzQiO319', 1667762247),
('cG88gF6efcWj5AaTPzEJ9onrAEgUVXVQ9qP0DNSK', 1, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/106.0.0.0 Safari/537.36 OPR/92.0.0.0', 'YTo1OntzOjY6Il90b2tlbiI7czo0MDoia0E3eXpQUUJyRTg1Y3U1and1V2dtNUc5dGdEcDVuaWUxQjV2M3hobiI7czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319czozOiJ1cmwiO2E6MDp7fXM6OToiX3ByZXZpb3VzIjthOjE6e3M6MzoidXJsIjtzOjIxOiJodHRwOi8vMTI3LjAuMC4xOjgwMDAiO31zOjUwOiJsb2dpbl93ZWJfNTliYTM2YWRkYzJiMmY5NDAxNTgwZjAxNGM3ZjU4ZWE0ZTMwOTg5ZCI7aToxO30=', 1667754674),
('mZABEyJzeFoAV3rFJKjSNmZmV21NkUegaFPBqB3G', 1, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/106.0.0.0 Safari/537.36 OPR/92.0.0.0', 'YTo2OntzOjY6Il90b2tlbiI7czo0MDoiRFk0WW9aU2hHVUNpamVjcGdPUnFYa0xoOWFpVlpJZnU4amkwVVdCVyI7czozOiJ1cmwiO2E6MDp7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fXM6OToiX3ByZXZpb3VzIjthOjE6e3M6MzoidXJsIjtzOjIxOiJodHRwOi8vMTI3LjAuMC4xOjgwMDAiO31zOjUwOiJsb2dpbl93ZWJfNTliYTM2YWRkYzJiMmY5NDAxNTgwZjAxNGM3ZjU4ZWE0ZTMwOTg5ZCI7aToxO3M6MjE6InBhc3N3b3JkX2hhc2hfc2FuY3R1bSI7czo2MDoiJDJ5JDEwJDkySVhVTnBrak8wck9RNWJ5TWkuWWU0b0tvRWEzUm85bGxDLy5vZy9hdDIudWhlV0cvaWdpIjt9', 1667754727);

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `two_factor_secret` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `two_factor_recovery_codes` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `two_factor_confirmed_at` timestamp NULL DEFAULT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `current_team_id` bigint(20) UNSIGNED DEFAULT NULL,
  `profile_photo_path` varchar(2048) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `email_verified_at`, `password`, `two_factor_secret`, `two_factor_recovery_codes`, `two_factor_confirmed_at`, `remember_token`, `current_team_id`, `profile_photo_path`, `created_at`, `updated_at`) VALUES
(1, 'Admin User', 'admin@example.com', '2022-10-29 06:49:39', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', NULL, NULL, NULL, '5mH6As1g1B1ZDPUlhBQMhsnYVaPZSW2mG28kx0P2vg0tVuFos2TWLdbjD5BC', NULL, NULL, '2022-10-29 06:49:39', '2022-10-29 06:49:39'),
(2, 'Example User', 'test@example.com', '2022-10-29 06:49:39', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', NULL, NULL, NULL, 'i135PXZfHLPQJEVBmvVgINCvjJ3X7tturQzPhu71ueXEWhxM6L2FJF30TQuV', NULL, NULL, '2022-10-29 06:49:39', '2022-10-29 06:49:39');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `blogs`
--
ALTER TABLE `blogs`
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
-- Indexes for table `model_has_permissions`
--
ALTER TABLE `model_has_permissions`
  ADD PRIMARY KEY (`permission_id`,`model_id`,`model_type`),
  ADD KEY `model_has_permissions_model_id_model_type_index` (`model_id`,`model_type`);

--
-- Indexes for table `model_has_roles`
--
ALTER TABLE `model_has_roles`
  ADD PRIMARY KEY (`role_id`,`model_id`,`model_type`),
  ADD KEY `model_has_roles_model_id_model_type_index` (`model_id`,`model_type`);

--
-- Indexes for table `news`
--
ALTER TABLE `news`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `password_resets`
--
ALTER TABLE `password_resets`
  ADD KEY `password_resets_email_index` (`email`);

--
-- Indexes for table `permissions`
--
ALTER TABLE `permissions`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `permissions_name_guard_name_unique` (`name`,`guard_name`);

--
-- Indexes for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  ADD KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`);

--
-- Indexes for table `roles`
--
ALTER TABLE `roles`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `roles_name_guard_name_unique` (`name`,`guard_name`);

--
-- Indexes for table `role_has_permissions`
--
ALTER TABLE `role_has_permissions`
  ADD PRIMARY KEY (`permission_id`,`role_id`),
  ADD KEY `role_has_permissions_role_id_foreign` (`role_id`);

--
-- Indexes for table `sessions`
--
ALTER TABLE `sessions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `sessions_user_id_index` (`user_id`),
  ADD KEY `sessions_last_activity_index` (`last_activity`);

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
-- AUTO_INCREMENT for table `blogs`
--
ALTER TABLE `blogs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `news`
--
ALTER TABLE `news`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `permissions`
--
ALTER TABLE `permissions`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=32;

--
-- AUTO_INCREMENT for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `roles`
--
ALTER TABLE `roles`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `model_has_permissions`
--
ALTER TABLE `model_has_permissions`
  ADD CONSTRAINT `model_has_permissions_permission_id_foreign` FOREIGN KEY (`permission_id`) REFERENCES `permissions` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `model_has_roles`
--
ALTER TABLE `model_has_roles`
  ADD CONSTRAINT `model_has_roles_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `role_has_permissions`
--
ALTER TABLE `role_has_permissions`
  ADD CONSTRAINT `role_has_permissions_permission_id_foreign` FOREIGN KEY (`permission_id`) REFERENCES `permissions` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `role_has_permissions_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
