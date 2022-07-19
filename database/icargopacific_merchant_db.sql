-- phpMyAdmin SQL Dump
-- version 5.1.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jul 19, 2022 at 05:53 AM
-- Server version: 10.4.19-MariaDB
-- PHP Version: 8.0.6

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `icargopacific_merchant_db`
--

-- --------------------------------------------------------

--
-- Table structure for table `booking`
--

CREATE TABLE `booking` (
  `order_number` int(11) NOT NULL,
  `merchant_id` int(255) NOT NULL,
  `sender_location` varchar(255) NOT NULL,
  `sender_contact` varchar(255) NOT NULL,
  `recipient_location` varchar(255) NOT NULL,
  `recipient_contact` varchar(255) NOT NULL,
  `vehicle` varchar(255) NOT NULL,
  `length` float NOT NULL,
  `width` float NOT NULL,
  `height` float NOT NULL,
  `weight` float NOT NULL,
  `cargo_type` varchar(255) NOT NULL,
  `time` varchar(255) NOT NULL,
  `distance` int(11) NOT NULL,
  `inclusions` varchar(255) NOT NULL,
  `remarks` text NOT NULL,
  `price` decimal(10,0) NOT NULL,
  `mode_of_payment` varchar(255) NOT NULL,
  `status` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `cargo`
--

CREATE TABLE `cargo` (
  `id` int(11) NOT NULL,
  `cargo_type` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `cargo`
--

INSERT INTO `cargo` (`id`, `cargo_type`) VALUES
(1, 'Box'),
(2, 'Pallet'),
(3, 'Roll'),
(4, 'Crate'),
(5, 'Bag');

-- --------------------------------------------------------

--
-- Table structure for table `customer`
--

CREATE TABLE `customer` (
  `id` int(11) NOT NULL,
  `email` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `first_name` varchar(255) NOT NULL,
  `last_name` varchar(255) NOT NULL,
  `contact_number` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `customer_forum`
--

CREATE TABLE `customer_forum` (
  `id` int(11) NOT NULL,
  `customer_id` int(255) NOT NULL,
  `post` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `driver`
--

CREATE TABLE `driver` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `company` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `merchant`
--

CREATE TABLE `merchant` (
  `id` int(11) NOT NULL,
  `email` varchar(255) NOT NULL,
  `password` varchar(100) NOT NULL,
  `first_name` varchar(255) NOT NULL,
  `last_name` varchar(255) NOT NULL,
  `contact_number` varchar(255) NOT NULL,
  `name_of_business` varchar(255) NOT NULL,
  `about` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `merchant`
--

INSERT INTO `merchant` (`id`, `email`, `password`, `first_name`, `last_name`, `contact_number`, `name_of_business`, `about`) VALUES
(4, 'quartzgerald@gmail.com', '$2y$10$tWqHSutZCZjQcVjlD86PP.k2ilpqYEaKmAWdc1hZnWwdNHeDSy76O', 'Famela', 'Barida', '09364561456', 'KGarden', NULL);

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
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `personal_access_tokens`
--

INSERT INTO `personal_access_tokens` (`id`, `tokenable_type`, `tokenable_id`, `name`, `token`, `abilities`, `last_used_at`, `created_at`, `updated_at`) VALUES
(24, 'App\\Models\\Merchant', 4, 'browser', '9e89f6fc0bed94819b5b2f1c26cfc66ff4564d254501446ce7e59dea25e7df8c', '[\"*\"]', NULL, '2022-07-14 19:50:26', '2022-07-14 19:50:26'),
(25, 'App\\Models\\Merchant', 4, 'browser', '3daaf23a659b348532f12bcb734347a7cca3a815c2ca43c5e13e595a4fef8c45', '[\"*\"]', NULL, '2022-07-14 19:50:28', '2022-07-14 19:50:28'),
(26, 'App\\Models\\Merchant', 4, 'browser', '5feedffc0ba60fa59855e08fc470f1753b5149f22593fb7daec49f2f54bd4c95', '[\"*\"]', '2022-07-14 19:52:58', '2022-07-14 19:50:29', '2022-07-14 19:52:58'),
(27, 'App\\Models\\Merchant', 4, 'browser', 'c18624eda03cc2a5b5eb4dd286e0ddf7a6880d9aa6be37defea02664853b90c6', '[\"*\"]', NULL, '2022-07-14 19:52:56', '2022-07-14 19:52:56'),
(28, 'App\\Models\\Merchant', 4, 'browser', '4eac40c1057609219311531c9a2ca2cf19948bf67e2e7fb2a61ef7c68ab33043', '[\"*\"]', '2022-07-14 19:55:32', '2022-07-14 19:52:57', '2022-07-14 19:55:32'),
(29, 'App\\Models\\Merchant', 4, 'DELL', 'd320a434936845fb1ce1b8b345d5588c5a270f5368330d7ab7701c249679f282', '[\"*\"]', NULL, '2022-07-14 19:57:48', '2022-07-14 19:57:48'),
(30, 'App\\Models\\Merchant', 4, 'browser', '355ae0b8971899c7febae292d7f092549ad021429273851317a788b6f8d56077', '[\"*\"]', NULL, '2022-07-14 19:57:59', '2022-07-14 19:57:59'),
(31, 'App\\Models\\Merchant', 4, 'browser', '3b508d8b1a24c37fd89998a63d6ec9424086766638b176bdfcdfc750d78454aa', '[\"*\"]', NULL, '2022-07-14 20:01:48', '2022-07-14 20:01:48'),
(32, 'App\\Models\\Merchant', 4, 'browser', '2e5042e7c1463def78afc595efaaf4ff12aa0b214934c4690d001f9159dd846c', '[\"*\"]', NULL, '2022-07-14 20:01:48', '2022-07-14 20:01:48'),
(33, 'App\\Models\\Merchant', 4, 'browser', 'd5cfd71f60498d6e53b2541b76ccf9c9a11ca7b5389dc15083ab8c495238efe5', '[\"*\"]', '2022-07-14 20:08:29', '2022-07-14 20:01:49', '2022-07-14 20:08:29'),
(34, 'App\\Models\\Merchant', 4, 'browser', 'd6fbdefbb69886fee832f40d629345cdaec9cbc118cf6ac488e523bba9463724', '[\"*\"]', NULL, '2022-07-14 20:01:51', '2022-07-14 20:01:51'),
(35, 'App\\Models\\Merchant', 4, 'browser', '0a1b77339c8fa28153009a6e1f5982b90d94d31b65bd4c8e0a8ee8de74eb90a4', '[\"*\"]', NULL, '2022-07-14 20:01:52', '2022-07-14 20:01:52'),
(36, 'App\\Models\\Merchant', 4, 'browser', 'eb35cbd12fd3b8bfba7df57aaf4cb2564ef084d4b2ddd470f6628f65ef463519', '[\"*\"]', NULL, '2022-07-14 20:03:40', '2022-07-14 20:03:40'),
(37, 'App\\Models\\Merchant', 4, 'browser', 'c560c071eee2f2b74e6a6fed7c81ddc3ca747ee34f775d8facb0dcc18d70105b', '[\"*\"]', NULL, '2022-07-14 20:03:43', '2022-07-14 20:03:43'),
(38, 'App\\Models\\Merchant', 4, 'browser', 'c7e08478038b32251816723e0a56c0907df01f9497b8568d2f9f13efadb6062d', '[\"*\"]', NULL, '2022-07-14 20:03:45', '2022-07-14 20:03:45'),
(39, 'App\\Models\\Merchant', 4, 'browser', '8481a3ebbcf63bdbf8c165efaadc2b328daded86cffb1ce02a69984195fbbce4', '[\"*\"]', NULL, '2022-07-14 20:03:46', '2022-07-14 20:03:46'),
(40, 'App\\Models\\Merchant', 4, 'browser', 'f0fe9bb1f7e0cb1534fe7089aeaad9b61a762bb022dd29c5593b36b6a348fcb4', '[\"*\"]', NULL, '2022-07-14 20:03:47', '2022-07-14 20:03:47'),
(41, 'App\\Models\\Merchant', 4, 'browser', '4ed3e09d9d2805a329a5ef0415319a51c644881100c6344220a30994be14ed5b', '[\"*\"]', NULL, '2022-07-14 20:03:48', '2022-07-14 20:03:48'),
(42, 'App\\Models\\Merchant', 4, 'browser', '18e54926c0863261215519497847959f478191a113680c1e89dccac53776cfac', '[\"*\"]', NULL, '2022-07-14 20:03:49', '2022-07-14 20:03:49'),
(43, 'App\\Models\\Merchant', 4, 'browser', '44530243d75ed43c507a9848d8814f6dddb67c72fe013bbbd7fdd9492b45092f', '[\"*\"]', NULL, '2022-07-14 20:03:50', '2022-07-14 20:03:50'),
(44, 'App\\Models\\Merchant', 4, 'browser', '6c730226376d073347a528e1b694565a185f756a5722cfe6cb3778123a79280c', '[\"*\"]', NULL, '2022-07-14 20:03:52', '2022-07-14 20:03:52'),
(45, 'App\\Models\\Merchant', 4, 'browser', '15b2253858bbc370540856caec8f989188867faa592e4affaa009fc5ff9251a1', '[\"*\"]', NULL, '2022-07-14 20:03:53', '2022-07-14 20:03:53'),
(46, 'App\\Models\\Merchant', 4, 'browser', '4ef33af964cd03ebac100d621c13ff5916b33ed53aecb6730d47ab4b2c57e21c', '[\"*\"]', NULL, '2022-07-14 20:03:55', '2022-07-14 20:03:55'),
(47, 'App\\Models\\Merchant', 4, 'browser', 'd09fb7160ba05ca2d41910bbb59bd1b3118859685f8cc8ab056d2190e57ee8a7', '[\"*\"]', NULL, '2022-07-14 20:03:56', '2022-07-14 20:03:56'),
(48, 'App\\Models\\Merchant', 4, 'browser', '2ee8c81478c1d64248f874f16e866a81aceb8a12d7829642ffc68c4679fc5c08', '[\"*\"]', NULL, '2022-07-14 20:03:58', '2022-07-14 20:03:58'),
(49, 'App\\Models\\Merchant', 4, 'browser', '451ff3b42c73026e1aaad7618172f4fbe1fe50dc3ad5d0d90e7cd990ccd9132f', '[\"*\"]', NULL, '2022-07-14 20:03:59', '2022-07-14 20:03:59'),
(50, 'App\\Models\\Merchant', 4, 'browser', '9f785d15f1422e9539802219de3ec55d90d5f975e10ed10ed53c69d2dfe1e2ba', '[\"*\"]', NULL, '2022-07-14 20:04:00', '2022-07-14 20:04:00'),
(51, 'App\\Models\\Merchant', 4, 'browser', 'd87391a5d6b22d8dc1a4fe67efcd35635cce479e25e2f58568cd07cd57e459c1', '[\"*\"]', NULL, '2022-07-14 20:04:01', '2022-07-14 20:04:01'),
(52, 'App\\Models\\Merchant', 4, 'browser', 'c740b795b66af4c58ae919b04d7416d8902c0edcfdb029e98814eb875f72b1ed', '[\"*\"]', NULL, '2022-07-14 20:04:03', '2022-07-14 20:04:03'),
(53, 'App\\Models\\Merchant', 4, 'browser', 'dfaa6db5f0adb76d4a29e85d34183917790fd120c57af081c5c02271f78643ea', '[\"*\"]', NULL, '2022-07-14 20:04:06', '2022-07-14 20:04:06'),
(54, 'App\\Models\\Merchant', 4, 'browser', '88f5f5b0417e27d9f1a3749039a31fcc586e4e40fc3d5743cc723f97a9f07eb3', '[\"*\"]', NULL, '2022-07-14 20:04:06', '2022-07-14 20:04:06'),
(55, 'App\\Models\\Merchant', 4, 'browser', '2d12981a9879b02a172a35f8a9e83fd1c4177986887ebc8bc5672bb1bc95efd8', '[\"*\"]', NULL, '2022-07-14 20:04:08', '2022-07-14 20:04:08'),
(56, 'App\\Models\\Merchant', 4, 'browser', '1fc6fe46b26fc1066dd331ef7fcac7780d94b3fec742c4b9b079d1309e71f125', '[\"*\"]', NULL, '2022-07-14 20:04:09', '2022-07-14 20:04:09'),
(57, 'App\\Models\\Merchant', 4, 'browser', 'a26d9b22553d5178a1f34bddb2a8be20249eb4f64d993ed53f0fdf5cc6af5d7d', '[\"*\"]', NULL, '2022-07-14 20:04:10', '2022-07-14 20:04:10'),
(58, 'App\\Models\\Merchant', 4, 'browser', '741e38963a491d5293a68a076635e6267dbd61f96cfc6da15a0872b7e96037d8', '[\"*\"]', NULL, '2022-07-14 20:04:11', '2022-07-14 20:04:11'),
(59, 'App\\Models\\Merchant', 4, 'browser', '40dd53b86bae424735d08ff4b3354ff3469ee1a3696d3e6579d17e45c6fa7155', '[\"*\"]', NULL, '2022-07-14 20:04:12', '2022-07-14 20:04:12'),
(60, 'App\\Models\\Merchant', 4, 'browser', '14a15facf0c448df138129dbd1065a7d41819ea05b425459e8a58fca1f96ebd1', '[\"*\"]', NULL, '2022-07-14 20:04:20', '2022-07-14 20:04:20'),
(61, 'App\\Models\\Merchant', 4, 'browser', 'c77e8bd9706da9f323ec5c9bbc3784df7c6510b6ca6aaa2f9d7e766c34c30a99', '[\"*\"]', NULL, '2022-07-14 20:04:22', '2022-07-14 20:04:22'),
(62, 'App\\Models\\Merchant', 4, 'browser', '2ce52d1e1e013ee6d966334d50e8d9c51786ebf7ffd7bbc25135b0f7368d3dd5', '[\"*\"]', NULL, '2022-07-14 20:05:38', '2022-07-14 20:05:38'),
(63, 'App\\Models\\Merchant', 4, 'browser', '3e3fa1ae2f8ab4cfa4134e5ebaaf2f95c0d308b34c16bb18667872f084e7a860', '[\"*\"]', NULL, '2022-07-14 20:05:39', '2022-07-14 20:05:39'),
(64, 'App\\Models\\Merchant', 4, 'browser', '90de4424d31a23acd8039a6e94e09ef42b6a27583c27bb53e8800eab8d24401b', '[\"*\"]', NULL, '2022-07-14 20:05:40', '2022-07-14 20:05:40'),
(65, 'App\\Models\\Merchant', 4, 'browser', '4c8eca775ec7dfe913151c6dfbd11c64d456ee79278b7b1680e0d06652c50dea', '[\"*\"]', NULL, '2022-07-14 20:05:44', '2022-07-14 20:05:44'),
(66, 'App\\Models\\Merchant', 4, 'browser', '8cf312cd99e728279a6864a5d7f1b68cd5e1c1f9bf1269e589afe2a28ec551ba', '[\"*\"]', NULL, '2022-07-14 20:05:47', '2022-07-14 20:05:47'),
(67, 'App\\Models\\Merchant', 4, 'browser', '2925f446cef7a8aa908ab810e3418253c02bf4fbdbdaba89ca251f7afd3273b3', '[\"*\"]', NULL, '2022-07-14 20:05:49', '2022-07-14 20:05:49'),
(68, 'App\\Models\\Merchant', 4, 'browser', '05bc018050a05cfaafe5f2eaaf8f4065332fb454d619f2c817433b984e1ca11a', '[\"*\"]', NULL, '2022-07-14 20:05:50', '2022-07-14 20:05:50'),
(69, 'App\\Models\\Merchant', 4, 'browser', '3580080c9ed9a2cb2f334234f8aca6a8c54ffcb93a1c22d188b007cf4a45424a', '[\"*\"]', NULL, '2022-07-14 20:05:51', '2022-07-14 20:05:51'),
(70, 'App\\Models\\Merchant', 4, 'browser', '1472dbe1a843cf6b35d475ac48b14d14f7179cbc6403ebd7bffb3a8871019af4', '[\"*\"]', NULL, '2022-07-14 20:05:51', '2022-07-14 20:05:51'),
(71, 'App\\Models\\Merchant', 4, 'browser', 'bfd836d57046dbd34e1055fc25a48468eca1991259620cd13b2edca9231b18df', '[\"*\"]', NULL, '2022-07-14 20:05:53', '2022-07-14 20:05:53'),
(72, 'App\\Models\\Merchant', 4, 'browser', 'f32a88befe7abf735763d5587bfabfe1ad157f5a2bcf604547591e360d3dc016', '[\"*\"]', NULL, '2022-07-14 20:05:54', '2022-07-14 20:05:54'),
(73, 'App\\Models\\Merchant', 4, 'browser', '061951e7b754d05717be5f03ccc95ec77e2f01236c4d24437e52ca1438e0905c', '[\"*\"]', NULL, '2022-07-14 20:05:55', '2022-07-14 20:05:55'),
(74, 'App\\Models\\Merchant', 4, 'browser', 'b1853b3717ff3cc7239e6354000165ae75c9fe6ab5824166c1b0f86bb6c322ef', '[\"*\"]', NULL, '2022-07-14 20:05:56', '2022-07-14 20:05:56'),
(75, 'App\\Models\\Merchant', 4, 'browser', '3567999d7f5ad07fedaec97046c76311585fce2c2a612d6433234afafef43f90', '[\"*\"]', NULL, '2022-07-14 20:05:57', '2022-07-14 20:05:57'),
(76, 'App\\Models\\Merchant', 4, 'browser', '1f8ae94274728363638599e47294822ac5830e0ec9f3956553d9c48f2ad24718', '[\"*\"]', NULL, '2022-07-14 20:05:58', '2022-07-14 20:05:58'),
(77, 'App\\Models\\Merchant', 4, 'browser', '04fd1938e363f5738fe442cf18f19567ef42c5c3c00fdc39adce21ee1e4fcc29', '[\"*\"]', NULL, '2022-07-14 20:05:59', '2022-07-14 20:05:59'),
(78, 'App\\Models\\Merchant', 4, 'browser', '8311fa3902ee1ee59cf3be0383ac6ea652ce5a82505d4270b1274994d76cc279', '[\"*\"]', NULL, '2022-07-14 20:08:17', '2022-07-14 20:08:17'),
(79, 'App\\Models\\Merchant', 4, 'browser', 'eab93d49f7eff43fd2fcb6d705fda23d8194fb96c75d1ec649290564197be501', '[\"*\"]', NULL, '2022-07-14 20:08:17', '2022-07-14 20:08:17'),
(80, 'App\\Models\\Merchant', 4, 'browser', 'b285211986dbc0721d2c0f64b936062f90b64c33aab735a41b78f3c68acaf239', '[\"*\"]', NULL, '2022-07-14 20:08:21', '2022-07-14 20:08:21'),
(81, 'App\\Models\\Merchant', 4, 'browser', '474c0fe71e35803071328434bf3755d1b8b3dac84f1e6276190d69bf23d125d0', '[\"*\"]', NULL, '2022-07-14 20:08:21', '2022-07-14 20:08:21'),
(82, 'App\\Models\\Merchant', 4, 'browser', 'a11fe156ca436596a706028330d8337da340f68cbe51ac85a92be038e4f59f47', '[\"*\"]', NULL, '2022-07-14 20:08:22', '2022-07-14 20:08:22'),
(83, 'App\\Models\\Merchant', 4, 'browser', 'ca0780b6cf2a1dfa7283adfefd8b81d481386a3eb0754d1d494139a25baec091', '[\"*\"]', NULL, '2022-07-14 20:08:23', '2022-07-14 20:08:23'),
(84, 'App\\Models\\Merchant', 4, 'browser', 'ee2e4ca820195e85a2e3e789bd158a2cb08bd64379f439123ceb5c6b5b71e767', '[\"*\"]', NULL, '2022-07-14 20:08:25', '2022-07-14 20:08:25'),
(85, 'App\\Models\\Merchant', 4, 'browser', '71fd96c5d786ebeb5ebe5360b6a6d9f6777114ffc05b8a0a293484decb815d9e', '[\"*\"]', NULL, '2022-07-14 20:08:26', '2022-07-14 20:08:26'),
(86, 'App\\Models\\Merchant', 4, 'browser', '916479ffae241a29316302055a1642d9a8f4f41d6beed0acca40f7c4546b2c66', '[\"*\"]', NULL, '2022-07-14 20:08:27', '2022-07-14 20:08:27'),
(87, 'App\\Models\\Merchant', 4, 'browser', '7fe099f6771ff2c3a6afff7e6c9ce826bf8e18b58ba69acc4efd0c0307238b08', '[\"*\"]', '2022-07-14 21:22:11', '2022-07-14 20:08:27', '2022-07-14 21:22:11'),
(91, 'App\\Models\\Merchant', 4, 'browser', 'd076a9ccddc04ae65e37ae2005b909bfb43932b59d480147ecb4e2e78473358b', '[\"*\"]', '2022-07-17 20:09:43', '2022-07-17 20:06:44', '2022-07-17 20:09:43');

-- --------------------------------------------------------

--
-- Table structure for table `vehicle`
--

CREATE TABLE `vehicle` (
  `id` int(11) NOT NULL,
  `vehicle_type` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `vehicle`
--

INSERT INTO `vehicle` (`id`, `vehicle_type`) VALUES
(1, 'Truck'),
(2, 'Minivan'),
(3, 'Bulk Transportation'),
(4, 'Tanker'),
(5, 'Container'),
(6, 'Closed Van');

-- --------------------------------------------------------

--
-- Table structure for table `verify_merchant`
--

CREATE TABLE `verify_merchant` (
  `id` int(11) NOT NULL,
  `proof_of_identification` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `verify_merchant`
--

INSERT INTO `verify_merchant` (`id`, `proof_of_identification`) VALUES
(1, 'Philippine Passport'),
(2, 'Social Security System (SSS) Card'),
(3, 'Unified Multi-Purpose Identification (UMID) Card'),
(4, 'Driver\'s License'),
(5, 'PhilHealth ID'),
(6, 'Professional Regulatory Commission (PRC) ID'),
(7, 'Philippine Postal ID'),
(8, 'Taxpayer Identification Number');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `booking`
--
ALTER TABLE `booking`
  ADD PRIMARY KEY (`order_number`);

--
-- Indexes for table `cargo`
--
ALTER TABLE `cargo`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `customer`
--
ALTER TABLE `customer`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `customer_forum`
--
ALTER TABLE `customer_forum`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `driver`
--
ALTER TABLE `driver`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `merchant`
--
ALTER TABLE `merchant`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  ADD KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`);

--
-- Indexes for table `vehicle`
--
ALTER TABLE `vehicle`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `verify_merchant`
--
ALTER TABLE `verify_merchant`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `booking`
--
ALTER TABLE `booking`
  MODIFY `order_number` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `cargo`
--
ALTER TABLE `cargo`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `customer`
--
ALTER TABLE `customer`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `customer_forum`
--
ALTER TABLE `customer_forum`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `driver`
--
ALTER TABLE `driver`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `merchant`
--
ALTER TABLE `merchant`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=92;

--
-- AUTO_INCREMENT for table `vehicle`
--
ALTER TABLE `vehicle`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `verify_merchant`
--
ALTER TABLE `verify_merchant`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
