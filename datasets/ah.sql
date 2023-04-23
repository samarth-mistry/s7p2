-- phpMyAdmin SQL Dump
-- version 5.1.0
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: Apr 23, 2023 at 04:30 PM
-- Server version: 10.4.19-MariaDB
-- PHP Version: 7.4.19

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `ah`
--

-- --------------------------------------------------------

--
-- Table structure for table `auth_group`
--

CREATE TABLE `auth_group` (
  `id` int(11) NOT NULL,
  `name` varchar(150) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `auth_group_permissions`
--

CREATE TABLE `auth_group_permissions` (
  `id` bigint(20) NOT NULL,
  `group_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `auth_permission`
--

CREATE TABLE `auth_permission` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `content_type_id` int(11) NOT NULL,
  `codename` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `auth_permission`
--

INSERT INTO `auth_permission` (`id`, `name`, `content_type_id`, `codename`) VALUES
(1, 'Can add log entry', 1, 'add_logentry'),
(2, 'Can change log entry', 1, 'change_logentry'),
(3, 'Can delete log entry', 1, 'delete_logentry'),
(4, 'Can view log entry', 1, 'view_logentry'),
(5, 'Can add permission', 2, 'add_permission'),
(6, 'Can change permission', 2, 'change_permission'),
(7, 'Can delete permission', 2, 'delete_permission'),
(8, 'Can view permission', 2, 'view_permission'),
(9, 'Can add group', 3, 'add_group'),
(10, 'Can change group', 3, 'change_group'),
(11, 'Can delete group', 3, 'delete_group'),
(12, 'Can view group', 3, 'view_group'),
(13, 'Can add user', 4, 'add_user'),
(14, 'Can change user', 4, 'change_user'),
(15, 'Can delete user', 4, 'delete_user'),
(16, 'Can view user', 4, 'view_user'),
(17, 'Can add content type', 5, 'add_contenttype'),
(18, 'Can change content type', 5, 'change_contenttype'),
(19, 'Can delete content type', 5, 'delete_contenttype'),
(20, 'Can view content type', 5, 'view_contenttype'),
(21, 'Can add session', 6, 'add_session'),
(22, 'Can change session', 6, 'change_session'),
(23, 'Can delete session', 6, 'delete_session'),
(24, 'Can view session', 6, 'view_session'),
(25, 'Can add hotel owner', 7, 'add_hotelowner'),
(26, 'Can change hotel owner', 7, 'change_hotelowner'),
(27, 'Can delete hotel owner', 7, 'delete_hotelowner'),
(28, 'Can view hotel owner', 7, 'view_hotelowner'),
(29, 'Can add hotel table', 8, 'add_hoteltable'),
(30, 'Can change hotel table', 8, 'change_hoteltable'),
(31, 'Can delete hotel table', 8, 'delete_hoteltable'),
(32, 'Can view hotel table', 8, 'view_hoteltable'),
(33, 'Can add food category', 9, 'add_foodcategory'),
(34, 'Can change food category', 9, 'change_foodcategory'),
(35, 'Can delete food category', 9, 'delete_foodcategory'),
(36, 'Can view food category', 9, 'view_foodcategory'),
(37, 'Can add food item', 10, 'add_fooditem'),
(38, 'Can change food item', 10, 'change_fooditem'),
(39, 'Can delete food item', 10, 'delete_fooditem'),
(40, 'Can view food item', 10, 'view_fooditem'),
(41, 'Can add food order', 11, 'add_foodorder'),
(42, 'Can change food order', 11, 'change_foodorder'),
(43, 'Can delete food order', 11, 'delete_foodorder'),
(44, 'Can view food order', 11, 'view_foodorder'),
(45, 'Can add payment', 12, 'add_payment'),
(46, 'Can change payment', 12, 'change_payment'),
(47, 'Can delete payment', 12, 'delete_payment'),
(48, 'Can view payment', 12, 'view_payment'),
(49, 'Can add qr code', 13, 'add_qrcode'),
(50, 'Can change qr code', 13, 'change_qrcode'),
(51, 'Can delete qr code', 13, 'delete_qrcode'),
(52, 'Can view qr code', 13, 'view_qrcode');

-- --------------------------------------------------------

--
-- Table structure for table `auth_user`
--

CREATE TABLE `auth_user` (
  `id` int(11) NOT NULL,
  `password` varchar(128) NOT NULL,
  `last_login` datetime(6) DEFAULT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `username` varchar(150) NOT NULL,
  `first_name` varchar(150) NOT NULL,
  `last_name` varchar(150) NOT NULL,
  `email` varchar(254) NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `date_joined` datetime(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `auth_user`
--

INSERT INTO `auth_user` (`id`, `password`, `last_login`, `is_superuser`, `username`, `first_name`, `last_name`, `email`, `is_staff`, `is_active`, `date_joined`) VALUES
(1, 'test@123', '2023-04-08 14:10:03.812198', 0, 'Test-Hotel-Owner', 'H-', 'Owner', 'owner@test.com', 0, 1, '2022-12-01 00:02:29.000000');

-- --------------------------------------------------------

--
-- Table structure for table `auth_user_groups`
--

CREATE TABLE `auth_user_groups` (
  `id` bigint(20) NOT NULL,
  `user_id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `auth_user_user_permissions`
--

CREATE TABLE `auth_user_user_permissions` (
  `id` bigint(20) NOT NULL,
  `user_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `core_foodcategory`
--

CREATE TABLE `core_foodcategory` (
  `id` bigint(20) NOT NULL,
  `name` varchar(70) NOT NULL,
  `hotel_id` int(11) NOT NULL,
  `description` varchar(225) DEFAULT NULL,
  `status` varchar(20) DEFAULT NULL,
  `created_at` datetime(6) DEFAULT NULL,
  `updated_at` datetime(6) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `core_fooditem`
--

CREATE TABLE `core_fooditem` (
  `id` bigint(20) NOT NULL,
  `name` varchar(70) NOT NULL,
  `image` varchar(30) DEFAULT NULL,
  `description` varchar(225) DEFAULT NULL,
  `category_id` int(11) NOT NULL,
  `status` varchar(20) DEFAULT NULL,
  `hotel_id` int(11) NOT NULL,
  `price` int(11) NOT NULL,
  `created_at` datetime(6) DEFAULT NULL,
  `updated_at` datetime(6) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `core_fooditem`
--

INSERT INTO `core_fooditem` (`id`, `name`, `image`, `description`, `category_id`, `status`, `hotel_id`, `price`, `created_at`, `updated_at`) VALUES
(1, 'Balu shahi', 'pizza.jpeg', 'Maida flour, yogurt, oil, sugar', 7, 'available', 2, 250, '2022-06-04 08:09:01.000000', '2021-03-20 08:09:01.000000'),
(2, 'Boondi', 'pizza.jpeg', 'Gram flour, ghee, sugar', 4, 'available', 2, 350, '2022-05-17 10:32:50.000000', '2021-01-28 10:32:50.000000'),
(3, 'Gajar ka halwa', 'pizza.jpeg', 'Carrots, milk, sugar, ghee, cashews, raisins', 7, 'available', 2, 395, '2022-04-04 06:11:34.000000', '2021-07-06 06:11:34.000000'),
(4, 'Ghevar', 'pizza.jpeg', 'Flour, ghee, kewra, milk, clarified butter, sugar, almonds, pistachio, saffron, green cardamom', 5, 'available', 2, 111, '2022-10-07 10:02:22.000000', '2022-06-11 10:02:22.000000'),
(5, 'Gulab jamun', 'pizza.jpeg', 'Milk powder, plain flour, baking powder, ghee, milk, sugar, water, rose water', 1, 'available', 3, 370, '2022-12-25 01:19:33.000000', '2021-08-04 01:19:33.000000'),
(6, 'Imarti', 'pizza.jpeg', 'Sugar syrup, lentil flour', 3, 'available', 2, 286, '2022-01-06 07:12:56.000000', '2022-12-17 07:12:56.000000'),
(7, 'Jalebi', 'pizza.jpeg', 'Maida, corn flour, baking soda, vinegar, curd, water, turmeric, saffron, cardamom', 2, 'available', 2, 310, '2022-09-06 03:33:39.000000', '2022-08-12 03:33:39.000000'),
(8, 'Kaju katli', 'pizza.jpeg', 'Cashews, ghee, cardamom, sugar', 1, 'available', 5, 240, '2022-01-05 22:31:04.000000', '2022-03-07 22:31:04.000000'),
(9, 'Kalakand', 'pizza.jpeg', 'Milk, cottage cheese, sugar', 5, 'available', 2, 110, '2022-10-13 15:34:27.000000', '2022-05-03 15:34:27.000000'),
(10, 'Kheer', 'pizza.jpeg', 'Milk, rice, sugar, dried fruits', 5, 'available', 1, 485, '2021-06-22 15:02:47.000000', '2022-08-13 15:02:47.000000'),
(11, 'Laddu', 'pizza.jpeg', 'Gram flour, ghee, sugar', 2, 'available', 5, 318, '2021-01-24 16:14:05.000000', '2022-08-10 16:14:05.000000'),
(12, 'Lassi', 'pizza.jpeg', 'Yogurt, milk, nuts, sugar', 2, 'available', 4, 76, '2021-09-21 13:23:03.000000', '2021-08-24 13:23:03.000000'),
(13, 'Nankhatai', 'pizza.jpeg', 'Refined flour, besan, ghee, powdered sugar, yoghurt, green cardamom', 3, 'available', 2, 393, '2022-11-05 17:49:14.000000', '2022-03-11 17:49:14.000000'),
(14, 'Petha', 'pizza.jpeg', 'Firm white pumpkin, sugar, kitchen lime, alum powder', 2, 'available', 1, 187, '2021-02-13 19:33:42.000000', '2021-03-05 19:33:42.000000'),
(15, 'Phirni', 'pizza.jpeg', 'Rice, sugar, nuts', 5, 'available', 5, 364, '2021-08-23 00:06:01.000000', '2021-12-24 00:06:01.000000'),
(16, 'Rabri', 'pizza.jpeg', 'Condensed milk, sugar, spices, nuts', 5, 'available', 2, 102, '2021-05-23 19:02:25.000000', '2022-03-05 19:02:25.000000'),
(17, 'Sheera', 'pizza.jpeg', 'Semolina, ghee, nuts, milk', 3, 'available', 2, 230, '2022-07-07 14:35:13.000000', '2022-12-30 14:35:13.000000'),
(18, 'Singori', 'pizza.jpeg', 'Khoa, coconut, molu leaf', 6, 'available', 5, 497, '2022-01-06 12:37:03.000000', '2022-10-01 12:37:03.000000'),
(19, 'Sohan halwa', 'pizza.jpeg', 'Corn flour, ghee, dry fruits', 4, 'available', 5, 268, '2022-02-01 01:08:52.000000', '2021-08-03 01:08:52.000000'),
(20, 'Sohan papdi', 'pizza.jpeg', 'Gram flour, ghee, sugar, milk, cardamom', 3, 'available', 2, 417, '2021-06-29 13:10:02.000000', '2021-09-09 13:10:02.000000'),
(21, 'Chhena jalebi', 'pizza.jpeg', 'Chhena, sugar, ghee', 5, 'available', 3, 155, '2022-08-07 02:45:27.000000', '2021-02-18 02:45:27.000000'),
(22, 'Chhena kheeri', 'pizza.jpeg', 'Chhena, sugar, milk', 6, 'available', 2, 459, '2022-10-26 11:34:35.000000', '2021-10-01 11:34:35.000000'),
(23, 'Chhena poda', 'pizza.jpeg', 'Sugar, chenna cheese', 2, 'available', 2, 337, '2021-07-14 17:04:24.000000', '2022-09-29 17:04:24.000000'),
(24, 'Cham cham', 'pizza.jpeg', 'Flour, cream, sugar, saffron, lemon juice, coconut flakes', 3, 'available', 4, 107, '2022-10-28 19:43:39.000000', '2021-03-01 19:43:39.000000'),
(25, 'Kheer sagar', 'pizza.jpeg', 'Chenna, condensed milk, sugar, saffron, cardamom', 2, 'available', 4, 363, '2022-12-29 23:33:22.000000', '2022-10-25 23:33:22.000000'),
(26, 'Ledikeni', 'pizza.jpeg', 'Chhena, sugar, ghee', 2, 'available', 3, 254, '2021-05-03 06:30:34.000000', '2021-01-04 06:30:34.000000'),
(27, 'Lyangcha', 'pizza.jpeg', 'Flour, fried milk power, sugar syrup', 4, 'available', 2, 133, '2021-06-07 09:16:26.000000', '2022-12-17 09:16:26.000000'),
(28, 'Malapua', 'pizza.jpeg', 'Yoghurt, refined flour, ghee, fennel seeds', 3, 'available', 3, 487, '2022-06-05 21:49:13.000000', '2022-09-08 21:49:13.000000'),
(29, 'Mihidana', 'pizza.jpeg', 'Besan flour, sugar, ghee', 1, 'available', 2, 410, '2022-04-21 21:59:27.000000', '2021-09-25 21:59:27.000000'),
(30, 'Misti doi', 'pizza.jpeg', 'Milk, jaggery', 5, 'available', 5, 96, '2021-04-28 18:14:28.000000', '2021-07-21 18:14:28.000000'),
(31, 'Pantua', 'pizza.jpeg', 'Chhena, sugar, ghee, flour', 2, 'available', 5, 366, '2021-11-28 19:18:47.000000', '2021-12-29 19:18:47.000000'),
(32, 'Pithe', 'pizza.jpeg', 'Rice flour, wheat flour', 5, 'available', 1, 112, '2021-10-10 14:24:11.000000', '2022-11-14 14:24:11.000000'),
(33, 'Rasabali', 'pizza.jpeg', 'Chenna, sweetened milk', 2, 'available', 3, 338, '2021-09-14 14:50:18.000000', '2021-08-09 14:50:18.000000'),
(34, 'Ras malai', 'pizza.jpeg', 'Chhena, reduced milk, pistachio', 4, 'available', 4, 67, '2022-11-30 21:03:24.000000', '2022-06-21 21:03:24.000000'),
(35, 'Rasgulla', 'pizza.jpeg', 'Chhena, sugar, cardamom', 3, 'available', 2, 203, '2022-05-09 07:01:56.000000', '2021-06-17 07:01:56.000000'),
(36, 'Sandesh', 'pizza.jpeg', 'Milk, sugar, saffron, cardamom', 5, 'available', 5, 387, '2022-02-22 08:07:53.000000', '2022-08-07 08:07:53.000000'),
(37, 'Adhirasam', 'pizza.jpeg', 'Rice flour, jaggery, ghee, vegetable oil, elachi', 6, 'available', 3, 202, '2021-03-24 15:55:46.000000', '2021-02-08 15:55:46.000000'),
(38, 'Ariselu', 'pizza.jpeg', 'Rice flour, jaggery, ghee', 4, 'available', 5, 81, '2021-04-17 06:06:23.000000', '2021-10-26 06:06:23.000000'),
(39, 'Bandar laddu', 'pizza.jpeg', 'Besan, jaggery, cardamom powder, ghee, cashews and raisins, jaggery syrup, sugar', 7, 'available', 5, 141, '2022-02-28 15:43:48.000000', '2022-08-11 15:43:48.000000'),
(40, 'Chikki', 'pizza.jpeg', 'Peanuts, jaggery', 7, 'available', 1, 298, '2022-09-28 04:18:50.000000', '2021-11-05 04:18:50.000000'),
(41, 'Dharwad pedha', 'pizza.jpeg', 'Milk, Sugar, Dharwadi buffalo milk', 1, 'available', 4, 310, '2021-05-19 16:57:22.000000', '2022-03-03 16:57:22.000000'),
(42, 'Double ka meetha', 'pizza.jpeg', 'Loaf bread, milk', 3, 'available', 5, 398, '2021-05-11 22:38:17.000000', '2022-09-22 22:38:17.000000'),
(43, 'Gavvalu', 'pizza.jpeg', 'Rice flour, sugar, salt, ghee, semolina', 7, 'available', 1, 417, '2022-01-06 00:56:56.000000', '2021-11-25 00:56:56.000000'),
(44, 'Kakinada khaja', 'pizza.jpeg', 'Wheat flour, sugar', 3, 'available', 5, 447, '2022-07-24 02:38:41.000000', '2022-01-24 02:38:41.000000'),
(45, 'Kuzhi paniyaram', 'pizza.jpeg', 'Black lentils, rice', 4, 'available', 3, 402, '2021-01-26 10:03:32.000000', '2022-07-03 10:03:32.000000'),
(46, 'Mysore pak', 'pizza.jpeg', 'Besan flour, semolina, mung bean, jaggery, coconut, skimmed milk powder, sugar, ghee', 6, 'available', 4, 126, '2022-07-19 22:38:20.000000', '2022-06-11 22:38:20.000000'),
(47, 'Obbattu holige', 'pizza.jpeg', 'Maida flour, turmeric, coconut, chickpeas, jaggery, ghee, cardamom', 4, 'available', 5, 210, '2021-01-15 21:18:48.000000', '2021-09-12 21:18:48.000000'),
(48, 'Palathalikalu', 'pizza.jpeg', 'Rice flour, milk', 2, 'available', 3, 206, '2021-10-04 08:57:49.000000', '2021-10-18 08:57:49.000000'),
(49, 'Poornalu', 'pizza.jpeg', 'Chana dal, jaggery', 3, 'available', 4, 98, '2022-03-26 22:54:18.000000', '2021-06-21 22:54:18.000000'),
(50, 'Pongal', 'pizza.jpeg', 'Rice, jaggery, cashews, ghee', 2, 'available', 5, 437, '2021-07-29 21:19:15.000000', '2022-11-23 21:19:15.000000'),
(51, 'Pootharekulu', 'pizza.jpeg', 'Rice flour, powdered sugar, ghee', 4, 'available', 5, 448, '2021-10-30 18:52:03.000000', '2021-01-13 18:52:03.000000'),
(52, 'Qubani ka meetha', 'pizza.jpeg', 'Apricots, sugar syrup', 1, 'available', 1, 345, '2021-10-23 16:30:57.000000', '2021-02-18 16:30:57.000000'),
(53, 'Sheer korma', 'pizza.jpeg', 'Vermicelli pudding, milk', 5, 'available', 5, 355, '2022-01-21 16:43:30.000000', '2022-06-01 16:43:30.000000'),
(54, 'Unni Appam', 'pizza.jpeg', 'Rice flour, banana, jaggery, coconut', 4, 'available', 4, 352, '2022-01-22 09:38:09.000000', '2021-05-18 09:38:09.000000'),
(55, 'Kajjikaya', 'pizza.jpeg', 'Rice flour, jaggery, coconut', 5, 'available', 3, 472, '2022-10-19 16:21:52.000000', '2022-04-01 16:21:52.000000'),
(56, 'Anarsa', 'pizza.jpeg', 'Rice flour, jaggery, khus-khus seeds', 2, 'available', 3, 91, '2021-09-02 14:18:42.000000', '2022-11-09 14:18:42.000000'),
(57, 'Basundi', 'pizza.jpeg', 'Sugar, milk, nuts', 1, 'available', 4, 458, '2021-03-27 08:56:48.000000', '2022-08-10 08:56:48.000000'),
(58, 'Dhondas', 'pizza.jpeg', 'Cucumber, rava', 4, 'available', 2, 186, '2022-12-24 02:07:25.000000', '2021-06-25 02:07:25.000000'),
(59, 'Doodhpak', 'pizza.jpeg', 'Milk, rice, sugar, dry fruits', 3, 'available', 1, 457, '2022-11-05 22:38:58.000000', '2021-12-10 22:38:58.000000'),
(60, 'Mahim halwa', 'pizza.jpeg', 'Semolina, sugar', 1, 'available', 1, 171, '2021-02-01 22:17:33.000000', '2021-05-16 22:17:33.000000'),
(61, 'Modak', 'pizza.jpeg', 'Rice flour, coconut, jaggery', 1, 'available', 3, 214, '2022-08-13 03:20:53.000000', '2022-11-21 03:20:53.000000'),
(62, 'Shankarpali', 'pizza.jpeg', 'Sugar, ghee, maida flour, semolina', 2, 'available', 4, 237, '2021-03-08 00:09:05.000000', '2022-07-28 00:09:05.000000'),
(63, 'Shrikhand', 'pizza.jpeg', 'Curd, sugar, saffron, cardamom', 5, 'available', 2, 455, '2022-09-20 08:39:02.000000', '2022-02-14 08:39:02.000000'),
(64, 'Sutar feni', 'pizza.jpeg', 'Maida, sugar, ghee', 6, 'available', 1, 381, '2022-12-13 22:29:37.000000', '2021-06-28 22:29:37.000000'),
(65, 'Maach Jhol', 'pizza.jpeg', 'Fish, potol, tomato, chillies, ginger, garlic', 5, 'available', 3, 186, '2021-11-27 06:36:19.000000', '2022-12-13 06:36:19.000000'),
(66, 'Pork Bharta', 'pizza.jpeg', 'Boiled pork, onions, chillies, ginger and garlic', 1, 'available', 3, 444, '2022-05-14 21:21:31.000000', '2022-06-15 21:21:31.000000'),
(67, 'Chak Hao Kheer', 'pizza.jpeg', 'Rice, milk, sugar, cardamom', 2, 'available', 1, 165, '2021-01-04 02:28:42.000000', '2021-11-09 02:28:42.000000'),
(68, 'Galho', 'pizza.jpeg', 'Rice, axone, salt, water, chillies, pork', 6, 'available', 5, 435, '2022-11-11 05:39:30.000000', '2022-02-14 05:39:30.000000'),
(69, 'Aloo gobi', 'pizza.jpeg', 'Cauliflower, potato, garam masala, turmeric, curry leaves', 1, 'available', 5, 461, '2021-04-06 20:32:09.000000', '2021-03-11 20:32:09.000000'),
(70, 'Aloo tikki', 'pizza.jpeg', 'Rice flour, potato, bread crumbs, garam masala, salt', 3, 'available', 1, 294, '2021-03-02 13:53:29.000000', '2022-06-27 13:53:29.000000'),
(71, 'Aloo matar', 'pizza.jpeg', 'Potato, peas, chillies, ginger, garam masala, garlic', 3, 'available', 2, 241, '2022-10-12 11:45:32.000000', '2021-08-12 11:45:32.000000'),
(72, 'Aloo methi', 'pizza.jpeg', 'Potato, fenugreek leaves, chillies, salt, oil', 5, 'available', 2, 167, '2021-10-05 16:47:24.000000', '2021-04-08 16:47:24.000000'),
(73, 'Aloo shimla mirch', 'pizza.jpeg', 'Potato, shimla mirch, garam masala, amchur powder, salt', 1, 'available', 5, 234, '2021-09-04 14:42:44.000000', '2022-08-03 14:42:44.000000'),
(74, 'Bhatura', 'pizza.jpeg', 'Chole, rava, yogurt, plain flour, baking soda', 7, 'available', 1, 148, '2022-05-04 03:01:01.000000', '2021-11-30 03:01:01.000000'),
(75, 'Bhindi masala', 'pizza.jpeg', 'Ladies finger, garam masala, kasuri methi, tomatoes, chili powder', 5, 'available', 4, 355, '2022-11-09 00:12:24.000000', '2022-07-07 00:12:24.000000'),
(76, 'Biryani', 'pizza.jpeg', 'Chicken thighs, basmati rice, star anise, sweet, green chillies', 3, 'available', 5, 402, '2021-05-07 14:48:09.000000', '2021-06-20 14:48:09.000000'),
(77, 'Butter chicken', 'pizza.jpeg', 'Chicken, greek yogurt, cream, garam masala powder, cashew nuts, butter', 2, 'available', 5, 139, '2021-07-17 08:43:45.000000', '2021-11-11 08:43:45.000000'),
(78, 'Chana masala', 'pizza.jpeg', 'Chickpeas, tomato paste, garam masala, ginger, red onion, avocado oil', 6, 'available', 5, 375, '2021-02-09 01:10:57.000000', '2022-04-15 01:10:57.000000'),
(79, 'Chapati', 'pizza.jpeg', 'Whole wheat flour, olive oil, hot water, all purpose flour', 6, 'available', 4, 101, '2021-09-29 08:33:09.000000', '2022-07-07 08:33:09.000000'),
(80, 'Chicken razala', 'pizza.jpeg', 'Chicken, dahi, sesame seeds, garam masala powder, cashew nuts, saffron', 3, 'available', 2, 217, '2021-02-21 06:50:49.000000', '2021-11-03 06:50:49.000000'),
(81, 'Chicken Tikka masala', 'pizza.jpeg', 'Naan bread, tomato sauce, skinless chicken breasts, heavy cream, garam masala', 5, 'available', 1, 422, '2022-06-08 23:27:35.000000', '2022-12-18 23:27:35.000000'),
(82, 'Chicken Tikka', 'pizza.jpeg', 'Chicken, whole wheat bread, rice flour, garam masala powder, whole egg', 5, 'available', 1, 115, '2022-09-18 06:10:51.000000', '2021-05-19 06:10:51.000000'),
(83, 'Chole bhature', 'pizza.jpeg', 'Chole, bhatura, garam masala, bay leaf, cinnamon stick', 6, 'available', 1, 179, '2022-04-28 02:41:14.000000', '2021-11-14 02:41:14.000000'),
(84, 'Daal baati churma', 'pizza.jpeg', 'Moong dal, masoor dal, chana dal, wheat flour, almond', 1, 'available', 2, 103, '2022-02-26 07:55:36.000000', '2022-07-12 07:55:36.000000'),
(85, 'Daal puri', 'pizza.jpeg', 'Moong dal, garam masala powder, garlic, green chilli, all purpose flour', 5, 'available', 3, 409, '2022-05-05 16:01:41.000000', '2021-06-05 16:01:41.000000'),
(86, 'Dal makhani', 'pizza.jpeg', 'Red kidney beans, urad dal, cream, garam masala, chili powder', 3, 'available', 1, 314, '2022-01-15 16:17:28.000000', '2021-09-17 16:17:28.000000'),
(87, 'Dal tadka', 'pizza.jpeg', 'Pigeon peas, garam masala, ginger, red onion, kasuri methi', 4, 'available', 2, 163, '2021-02-22 18:53:34.000000', '2022-10-06 18:53:34.000000'),
(88, 'Dum aloo', 'pizza.jpeg', 'Baby potatoes, garam masala, cashew nuts, kasuri methi, tomatoes', 1, 'available', 4, 382, '2021-11-08 17:37:54.000000', '2021-10-18 17:37:54.000000'),
(89, 'Poha', 'pizza.jpeg', 'Beaten rice flakes, potato, curry leaves, green chilies, lemon juice', 7, 'available', 5, 130, '2022-10-22 18:08:03.000000', '2021-12-03 18:08:03.000000'),
(90, 'Fara', 'pizza.jpeg', 'Chana dal, whole wheat flour, arhar dal, white urad dal, garam masala powder', 5, 'available', 5, 236, '2022-04-04 18:12:12.000000', '2021-07-19 18:12:12.000000'),
(91, 'Kachori', 'pizza.jpeg', 'Moong dal, rava, garam masala, dough, fennel seeds', 4, 'available', 1, 460, '2021-06-21 05:14:38.000000', '2022-09-24 05:14:38.000000'),
(92, 'Kadai paneer', 'pizza.jpeg', 'Cottage cheese, bell peppers, gravy, garam masala, cashew nuts', 1, 'available', 4, 208, '2022-10-03 15:42:45.000000', '2022-10-09 15:42:45.000000'),
(93, 'Kadhi pakoda', 'pizza.jpeg', 'Besan, garam masala powder, gram flour, ginger, curry leaves', 4, 'available', 2, 297, '2022-08-05 02:50:38.000000', '2022-03-10 02:50:38.000000'),
(94, 'Karela bharta', 'pizza.jpeg', 'Bitter gourd, fennel, garam masala powder, chili powder, amchur powder', 6, 'available', 5, 169, '2022-06-16 01:27:46.000000', '2022-02-19 01:27:46.000000'),
(95, 'Khichdi', 'pizza.jpeg', 'Moong dal, green peas, ginger, tomato, green chili', 6, 'available', 4, 224, '2021-08-10 19:46:35.000000', '2021-06-30 19:46:35.000000'),
(96, 'Kofta', 'pizza.jpeg', 'Paneer, potato, cream, corn flour, garam masala', 7, 'available', 1, 290, '2022-03-02 01:28:25.000000', '2021-02-24 01:28:25.000000'),
(97, 'Kulfi falooda', 'pizza.jpeg', 'Rose syrup, falooda sev, mixed nuts, saffron, sugar', 7, 'available', 5, 55, '2021-04-14 09:46:36.000000', '2022-07-16 09:46:36.000000'),
(98, 'Lauki ke kofte', 'pizza.jpeg', 'Bottle gourd, garam masala powder, gram flour, ginger, chillies', 3, 'available', 5, 302, '2021-08-01 14:59:35.000000', '2021-06-13 14:59:35.000000'),
(99, 'Lauki ki subji', 'pizza.jpeg', 'Bottle gourd, coconut oil, garam masala, ginger, green chillies', 7, 'available', 4, 281, '2021-04-24 18:39:15.000000', '2021-06-16 18:39:15.000000'),
(100, 'Litti chokha', 'pizza.jpeg', 'Wheat flour, roasted gram flour, tomato, nigella seeds, chilli', 1, 'available', 1, 378, '2022-10-01 19:44:02.000000', '2022-01-23 19:44:02.000000'),
(101, 'Makki di roti sarson da saag', 'pizza.jpeg', 'Palak, makki atta, mustard green, garam masala, ginger', 3, 'available', 2, 490, '2021-08-29 04:42:37.000000', '2022-09-10 04:42:37.000000'),
(102, 'Misi roti', 'pizza.jpeg', 'Whole wheat flour, chickpea flour, green chilies', 3, 'available', 4, 138, '2021-07-13 11:26:53.000000', '2022-07-20 11:26:53.000000'),
(103, 'Mushroom do pyaza', 'pizza.jpeg', 'Mushroom, malai, garam masala, ginger, capsicum', 2, 'available', 3, 346, '2022-06-09 14:27:31.000000', '2021-08-08 14:27:31.000000'),
(104, 'Mushroom matar', 'pizza.jpeg', 'Canned coconut milk, frozen green peas, wild mushrooms, garam masala, tomatoes', 6, 'available', 1, 156, '2022-12-19 05:35:57.000000', '2021-12-05 05:35:57.000000'),
(105, 'Naan', 'pizza.jpeg', 'Whole wheat flour, honey, butter, garlic', 1, 'available', 4, 419, '2022-03-26 03:04:26.000000', '2022-04-06 03:04:26.000000'),
(106, 'Navrattan korma', 'pizza.jpeg', 'Green beans, potatoes, khus khus, low fat, garam masala powder', 5, 'available', 5, 303, '2021-01-25 23:21:26.000000', '2022-04-05 23:21:26.000000'),
(107, 'Palak paneer', 'pizza.jpeg', 'Cottage cheese, palak, cream, garam masala, butter', 2, 'available', 1, 432, '2021-07-27 14:42:37.000000', '2022-05-12 14:42:37.000000'),
(108, 'Paneer butter masala', 'pizza.jpeg', 'Paneer, whipping cream, garam masala, cashew nuts, butter', 1, 'available', 1, 422, '2022-11-15 14:58:36.000000', '2021-10-07 14:58:36.000000'),
(109, 'Paneer tikka masala', 'pizza.jpeg', 'Paneer, greek yogurt, tandoori masala, cream, bell pepper', 7, 'available', 4, 464, '2021-08-18 13:01:28.000000', '2021-12-05 13:01:28.000000'),
(110, 'Pani puri', 'pizza.jpeg', 'Kala chana, mashed potato, boondi, sev, lemon', 1, 'available', 2, 347, '2022-01-20 09:33:22.000000', '2021-02-07 09:33:22.000000'),
(111, 'Panjeeri', 'pizza.jpeg', 'Whole wheat flour, musk melon seeds, poppy seeds, edible gum, semolina', 2, 'available', 2, 306, '2022-06-21 13:38:06.000000', '2022-12-10 13:38:06.000000'),
(112, 'Papad', 'pizza.jpeg', 'Urad dal, sev, lemon juice, chopped tomatoes', 2, 'available', 4, 478, '2021-10-22 01:06:55.000000', '2022-12-13 01:06:55.000000'),
(113, 'Paratha', 'pizza.jpeg', 'Wheat flour, butter, potato, coriander', 1, 'available', 5, 138, '2021-06-16 12:07:44.000000', '2021-07-24 12:07:44.000000'),
(114, 'Pattor', 'pizza.jpeg', 'Arbi ke patte, sesame seeds, gur, bengal gram flour, imli', 4, 'available', 3, 232, '2022-03-02 05:43:59.000000', '2021-01-10 05:43:59.000000'),
(115, 'Pindi chana', 'pizza.jpeg', 'Fennel, tea bags, tomato, kasuri methi, cinnamon', 2, 'available', 2, 331, '2022-06-10 17:40:43.000000', '2022-11-06 17:40:43.000000'),
(116, 'Rajma chaval', 'pizza.jpeg', 'Red kidney beans, garam masala powder, ginger, tomato, mustard oil', 5, 'available', 4, 162, '2021-07-13 07:45:01.000000', '2022-12-04 07:45:01.000000'),
(117, 'Rongi', 'pizza.jpeg', 'Garam masala powder, tomato, kasuri methi, cinnamon, mustard oil', 6, 'available', 1, 70, '2021-07-19 17:17:08.000000', '2021-11-13 17:17:08.000000'),
(118, 'Samosa', 'pizza.jpeg', 'Potatoes, green peas, garam masala, ginger, dough', 7, 'available', 1, 362, '2022-09-25 07:36:53.000000', '2021-10-01 07:36:53.000000'),
(119, 'Sattu ki roti', 'pizza.jpeg', 'Sattu, atta, dough, filling, mustard oil', 6, 'available', 1, 149, '2022-06-03 19:16:47.000000', '2021-11-19 19:16:47.000000'),
(120, 'Shahi paneer', 'pizza.jpeg', 'Cottage cheese, malai, garam masala, ginger, tomato', 4, 'available', 3, 376, '2022-03-07 00:32:30.000000', '2022-07-28 00:32:30.000000'),
(121, 'Shahi tukra', 'pizza.jpeg', 'Rose water, milk, white bread slices, saffron, almonds', 5, 'available', 1, 250, '2021-02-03 09:55:33.000000', '2022-06-26 09:55:33.000000'),
(122, 'Vegetable jalfrezi', 'pizza.jpeg', 'Baby corn, french beans, garam masala, ginger, carrot', 3, 'available', 4, 423, '2021-09-28 05:32:47.000000', '2022-09-12 05:32:47.000000'),
(123, 'Tandoori Chicken', 'pizza.jpeg', 'Greek yogurt, garam masala, kasuri methi, marinade, mustard oil', 6, 'available', 3, 411, '2021-10-08 07:19:41.000000', '2022-12-28 07:19:41.000000'),
(124, 'Tandoori Fish Tikka', 'pizza.jpeg', 'Chickpea flour, biryani masala powder, yogurt, fish fillets, green bell pepper', 1, 'available', 4, 278, '2022-02-21 01:06:09.000000', '2022-06-04 01:06:09.000000'),
(125, 'Attu', 'pizza.jpeg', 'Whole wheat flour, arhar dal, ginger, kala jeera, green chilli', 4, 'available', 3, 117, '2021-04-25 20:24:57.000000', '2022-08-04 20:24:57.000000'),
(126, 'Avial', 'pizza.jpeg', 'Raw banana, elephant foot yam, long beans, tindora, urad dal', 2, 'available', 2, 194, '2021-12-24 21:07:09.000000', '2021-07-22 21:07:09.000000'),
(127, 'Bisi bele bath', 'pizza.jpeg', 'Split pigeon peas, chana dal, urad dal, green peas, french beans', 4, 'available', 1, 104, '2022-01-27 07:49:18.000000', '2022-07-30 07:49:18.000000'),
(128, 'Currivepillai sadam', 'pizza.jpeg', 'Chana dal, urad dal, fresh coconut, sesame seeds, curry leaves', 2, 'available', 4, 326, '2022-09-13 15:14:43.000000', '2022-06-19 15:14:43.000000'),
(129, 'Dosa', 'pizza.jpeg', 'Chana dal, urad dal, whole urad dal, blend rice, rock salt', 3, 'available', 3, 83, '2022-04-05 07:53:52.000000', '2022-08-24 07:53:52.000000'),
(130, 'Idiappam', 'pizza.jpeg', 'Rice flour, hot water, grated coconut', 4, 'available', 1, 424, '2021-08-24 07:55:32.000000', '2022-06-29 07:55:32.000000'),
(131, 'Idli', 'pizza.jpeg', 'Split urad dal, urad dal, idli rice, thick poha, rock salt', 2, 'available', 2, 424, '2022-06-28 06:48:57.000000', '2021-07-02 06:48:57.000000'),
(132, 'Kanji', 'pizza.jpeg', 'Carrot, yellow mustard, red chilli, black salt', 7, 'available', 2, 274, '2021-02-05 00:21:08.000000', '2021-03-17 00:21:08.000000'),
(133, 'Kaara kozhambu', 'pizza.jpeg', 'Sesame oil, drumstick, tamarind paste, sambar powder, tomato', 4, 'available', 4, 200, '2022-02-09 13:23:23.000000', '2022-06-04 13:23:23.000000'),
(134, 'Keerai kootu', 'pizza.jpeg', 'Moong dal, chana dal, spinach, urad dal, coconut oil', 3, 'available', 3, 174, '2022-10-07 08:40:16.000000', '2021-05-29 08:40:16.000000'),
(135, 'Keerai masiyal', 'pizza.jpeg', 'Urad dal, curry leaves, sugar, mustard seeds, spinach', 2, 'available', 2, 100, '2022-07-08 20:09:38.000000', '2021-01-30 20:09:38.000000'),
(136, 'Keerai sadam', 'pizza.jpeg', 'Greens, tomato, mustard seeds, fenugreek seeds', 1, 'available', 1, 257, '2022-04-23 00:06:32.000000', '2022-11-01 00:06:32.000000'),
(137, 'Keerai poriyal', 'pizza.jpeg', 'Amaranth leaves, split urad dal, mustard seeds, grated coconut, red chili', 5, 'available', 2, 67, '2022-09-09 08:13:01.000000', '2022-05-29 08:13:01.000000'),
(138, 'Beef Fry', 'pizza.jpeg', 'Beef, coconut, garam masala, curry leaves, green chilies, chili powder', 7, 'available', 2, 372, '2021-08-28 09:33:51.000000', '2021-02-24 09:33:51.000000'),
(139, 'Kootu', 'pizza.jpeg', 'Chana dal, urad dal, potato, beans, peas', 4, 'available', 3, 466, '2022-06-23 08:59:26.000000', '2022-07-25 08:59:26.000000'),
(140, 'Kos kootu', 'pizza.jpeg', 'Moong dal, chana dal, cabbage, tamarind, curry leaves', 7, 'available', 1, 125, '2022-11-02 15:12:35.000000', '2021-02-09 15:12:35.000000'),
(141, 'Koshambri', 'pizza.jpeg', 'Moong dal, cucumber, curry leaves, green chili, lemon juice', 6, 'available', 1, 288, '2022-04-07 16:49:33.000000', '2022-08-15 16:49:33.000000'),
(142, 'Kothamali sadam', 'pizza.jpeg', 'Chana dal, urad dal, gooseberry, raw rice, curry leaves', 2, 'available', 2, 334, '2022-11-18 06:27:04.000000', '2021-12-03 06:27:04.000000'),
(143, 'Kuzhakkattai', 'pizza.jpeg', 'Sesame oil, raw rice, jaggery, grated coconut', 4, 'available', 4, 84, '2021-04-08 21:05:01.000000', '2021-05-04 21:05:01.000000'),
(144, 'Kuzhambu', 'pizza.jpeg', 'Pearl onions, urad dal, drumsticks, tomato, curry leaves', 2, 'available', 4, 349, '2021-12-05 03:47:05.000000', '2021-06-29 03:47:05.000000'),
(145, 'Masala Dosa', 'pizza.jpeg', 'Chana dal, urad dal, potatoes, idli rice, thick poha', 1, 'available', 5, 359, '2021-05-15 19:35:36.000000', '2021-02-22 19:35:36.000000'),
(146, 'Pachadi', 'pizza.jpeg', 'Coconut oil, cucumber, curd, curry leaves, mustard seeds', 6, 'available', 1, 373, '2021-08-19 09:01:21.000000', '2021-12-26 09:01:21.000000'),
(147, 'Paniyaram', 'pizza.jpeg', 'Yogurt, ginger, curry leaves, baking soda, green chilli', 3, 'available', 5, 354, '2021-06-15 21:18:53.000000', '2021-12-13 21:18:53.000000'),
(148, 'Papadum', 'pizza.jpeg', 'Lentils, black pepper, vegetable oil', 3, 'available', 4, 152, '2022-08-21 14:34:14.000000', '2021-08-23 14:34:14.000000'),
(149, 'Paravannam', 'pizza.jpeg', 'Raw rice, jaggery, milk', 5, 'available', 2, 473, '2021-05-22 21:14:02.000000', '2021-07-27 21:14:02.000000'),
(150, 'Payasam', 'pizza.jpeg', 'Rice, cashew nuts, milk, raisins, sugar', 2, 'available', 4, 56, '2021-03-19 00:09:59.000000', '2021-04-11 00:09:59.000000'),
(151, 'Paruppu sadam', 'pizza.jpeg', 'Arhar dal, sambar powder, tomato, curry leaves, fennel seeds', 6, 'available', 3, 223, '2022-11-29 01:31:32.000000', '2021-11-19 01:31:32.000000'),
(152, 'Pesarattu', 'pizza.jpeg', 'Green moong beans, rice flour', 3, 'available', 3, 215, '2021-09-10 22:09:32.000000', '2021-11-29 22:09:32.000000'),
(153, 'Poriyal', 'pizza.jpeg', 'Chana dal, urad dal, beans, coconut, mustard', 6, 'available', 4, 362, '2022-03-14 06:11:37.000000', '2022-07-28 06:11:37.000000'),
(154, 'Puli sadam', 'pizza.jpeg', 'Urad dal, lemon, tamarind, cooked rice, curry leaves', 4, 'available', 4, 303, '2022-02-21 09:50:49.000000', '2021-10-06 09:50:49.000000'),
(155, 'Rasam', 'pizza.jpeg', 'Tomato, curry leaves, garlic, mustard seeds, hot water', 2, 'available', 1, 345, '2021-10-09 22:11:39.000000', '2021-06-19 22:11:39.000000'),
(156, 'Puttu', 'pizza.jpeg', 'Brown rice flour, sugar, grated coconut', 5, 'available', 5, 65, '2022-10-04 03:17:54.000000', '2021-05-11 03:17:54.000000'),
(157, 'Sambar', 'pizza.jpeg', 'Pigeon peas, eggplant, drumsticks, sambar powder, tamarind', 4, 'available', 4, 212, '2022-04-23 18:44:28.000000', '2022-04-18 18:44:28.000000'),
(158, 'Sandige', 'pizza.jpeg', 'Thin rice flakes, black sesame seeds, curry leaves', 7, 'available', 3, 211, '2021-11-16 01:51:34.000000', '2022-05-01 01:51:34.000000'),
(159, 'Sevai', 'pizza.jpeg', 'Sevai, parboiled rice, steamer', 1, 'available', 1, 186, '2022-01-11 15:38:28.000000', '2021-04-13 15:38:28.000000'),
(160, 'Thayir sadam', 'pizza.jpeg', 'Urad dal, curd, sesame oil, ginger, curry leaves, mustard seeds', 2, 'available', 1, 446, '2021-07-30 07:26:45.000000', '2022-12-13 07:26:45.000000'),
(161, 'Theeyal', 'pizza.jpeg', 'Coconut, whole red beans, masala, sesame oil, tamarind', 1, 'available', 1, 286, '2021-01-01 06:51:22.000000', '2021-03-19 06:51:22.000000'),
(162, 'Uttapam', 'pizza.jpeg', 'Chana dal, urad dal, thick poha, tomato, butter', 3, 'available', 1, 242, '2022-12-01 09:05:40.000000', '2021-09-30 09:05:40.000000'),
(163, 'Vada', 'pizza.jpeg', 'Urad dal, ginger, curry leaves, green chilies, black pepper', 1, 'available', 3, 384, '2021-05-17 05:37:36.000000', '2021-05-01 05:37:36.000000'),
(164, 'Chicken Varuval', 'pizza.jpeg', 'Meat curry powder, chicken chunks, ginger, tomato, cinnamon', 1, 'available', 1, 55, '2022-11-22 15:17:26.000000', '2021-06-24 15:17:26.000000'),
(165, 'Upma', 'pizza.jpeg', 'Chana dal, urad dal, ginger, curry leaves, sugar', 2, 'available', 1, 265, '2021-11-15 00:55:47.000000', '2022-05-08 00:55:47.000000'),
(166, 'Amti', 'pizza.jpeg', 'Kala masala, arhar dal, curry leaves, mustard seeds, hot water', 1, 'available', 1, 195, '2021-03-17 18:43:33.000000', '2021-11-02 18:43:33.000000'),
(167, 'Zunka', 'pizza.jpeg', 'Gram flour, mustard, garlic, turmeric, red chilli', 2, 'available', 2, 417, '2021-04-15 10:27:20.000000', '2022-09-25 10:27:20.000000'),
(168, 'Kolim Jawla', 'pizza.jpeg', 'Baingan, fish, coconut oil, fresh coconut, ginger', 3, 'available', 5, 157, '2022-11-14 14:51:58.000000', '2022-06-09 14:51:58.000000'),
(169, 'Saath', 'pizza.jpeg', 'Urad dal, potatoes, wheat flour, sooji', 6, 'available', 2, 130, '2022-10-02 05:20:19.000000', '2021-08-04 05:20:19.000000'),
(170, 'Bajri no rotlo', 'pizza.jpeg', 'Wheat flour, pearl millet flour, hot water', 2, 'available', 5, 136, '2022-08-13 13:03:02.000000', '2022-01-21 13:03:02.000000'),
(171, 'Coconut vadi', 'pizza.jpeg', 'Condensed milk, mawa, desiccated coconut, almonds, cashews', 4, 'available', 4, 207, '2021-08-24 17:28:54.000000', '2022-02-21 17:28:54.000000'),
(172, 'Bhakri', 'pizza.jpeg', 'Jowar flour, sesame seeds', 2, 'available', 2, 142, '2022-01-04 17:37:53.000000', '2021-02-04 17:37:53.000000'),
(173, 'Bombil fry', 'pizza.jpeg', 'Bombay duck, malvani masala, rice flour, bombay rava, green chilies', 7, 'available', 4, 296, '2022-11-23 20:51:32.000000', '2022-08-05 20:51:32.000000'),
(174, 'Chakali', 'pizza.jpeg', 'Rice flour, sesame, plain flour, turmeric, red chilli', 3, 'available', 3, 432, '2022-02-26 09:14:13.000000', '2022-06-06 09:14:13.000000'),
(175, 'Chevdo', 'pizza.jpeg', 'Citric acid, fry, raisins, sugar, chana daal', 6, 'available', 3, 299, '2021-03-14 04:46:16.000000', '2021-02-26 04:46:16.000000'),
(176, 'Chorafali', 'pizza.jpeg', 'Urad dal, bengal gram flour, dried mango, baking soda, black salt', 7, 'available', 2, 152, '2022-03-01 18:11:32.000000', '2022-07-08 18:11:32.000000'),
(177, 'Copra paak', 'pizza.jpeg', 'Condensed milk, nestle cream, coconut ice, red food coloring, desiccated coconut', 6, 'available', 4, 152, '2022-01-26 14:21:11.000000', '2022-01-09 14:21:11.000000'),
(178, 'Daal Dhokli', 'pizza.jpeg', 'Whole wheat flour, dal, kokum, gur, bengal gram flour', 5, 'available', 1, 481, '2021-06-12 14:47:36.000000', '2022-02-14 14:47:36.000000'),
(179, 'Kutchi dabeli', 'pizza.jpeg', 'Pav, aloo, peanut, pomegranate, star anise', 7, 'available', 2, 417, '2022-03-25 18:23:59.000000', '2021-03-02 18:23:59.000000'),
(180, 'Dahi vada', 'pizza.jpeg', 'Urad dal, bhuna chana, garam masala, dates, tamarind', 6, 'available', 2, 430, '2021-08-16 13:45:08.000000', '2021-04-08 13:45:08.000000'),
(181, 'Dalithoy', 'pizza.jpeg', 'Arhar dal, coconut oil, curry leaves, mustard seeds, red chilli', 7, 'available', 5, 100, '2021-03-01 07:18:14.000000', '2021-06-15 07:18:14.000000'),
(182, 'Dhokla', 'pizza.jpeg', 'Rava, coconut, gram flour, mustard, sesame', 7, 'available', 2, 272, '2021-03-04 00:45:28.000000', '2022-05-19 00:45:28.000000'),
(183, 'Dudhi halwa', 'pizza.jpeg', 'Bottle gourd, green, raisins, sugar, clarified butter', 4, 'available', 4, 415, '2022-08-11 10:31:39.000000', '2021-12-13 10:31:39.000000'),
(184, 'Gatta curry', 'pizza.jpeg', 'Yogurt, besan, sauce, garam masala powder, gram flour', 1, 'available', 5, 173, '2021-08-28 01:40:39.000000', '2022-05-11 01:40:39.000000'),
(185, 'Gud papdi', 'pizza.jpeg', 'Wheat flour, jaggery, clarified butter, sliced almonds', 4, 'available', 5, 240, '2021-12-05 22:23:34.000000', '2021-02-21 22:23:34.000000'),
(186, 'Ghooghra', 'pizza.jpeg', 'Dry fruits, semolina, all purpose flour', 7, 'available', 1, 134, '2022-01-05 12:16:50.000000', '2021-07-17 12:16:50.000000'),
(187, 'Handwo', 'pizza.jpeg', 'Bottle gourd, chana dal, cabbage, urad dal, toor dal', 2, 'available', 2, 309, '2022-06-21 23:45:32.000000', '2022-01-12 23:45:32.000000'),
(188, 'Halvasan', 'pizza.jpeg', 'Whole wheat rava, chia seed, lemon, edible gum, litre milk', 2, 'available', 2, 67, '2021-06-29 14:56:46.000000', '2022-04-10 14:56:46.000000'),
(189, 'Jeera Aloo', 'pizza.jpeg', 'Green chilies, lemon juice, chili powder, boiled potatoes', 7, 'available', 2, 340, '2021-02-11 09:02:59.000000', '2022-01-02 09:02:59.000000'),
(190, 'Kansar', 'pizza.jpeg', 'Wheat flour, cashews, rapeseed oil', 7, 'available', 2, 273, '2022-04-13 21:24:53.000000', '2021-03-16 21:24:53.000000'),
(191, 'Keri no ras', 'pizza.jpeg', 'Mango, sugar', 7, 'available', 4, 424, '2022-01-12 15:50:18.000000', '2022-06-27 15:50:18.000000'),
(192, 'Khakhra', 'pizza.jpeg', 'Whole wheat flour, low fat, bengal gram flour', 5, 'available', 1, 53, '2022-04-04 07:36:10.000000', '2021-06-07 07:36:10.000000'),
(193, 'Khandvi', 'pizza.jpeg', 'Green chili paste, white sesame seeds, gram flour, curry leaves, green chili', 2, 'available', 1, 235, '2021-10-24 22:27:22.000000', '2022-01-14 22:27:22.000000'),
(194, 'Kombdi vade', 'pizza.jpeg', 'Rice flour, urad dal, wheat flour, gram flour, turmeric', 1, 'available', 2, 495, '2022-10-10 20:07:43.000000', '2022-05-30 20:07:43.000000'),
(195, 'Laapsi', 'pizza.jpeg', 'Cinnamon, jaggery, clarified butter, dry roasted', 6, 'available', 4, 476, '2022-09-29 19:49:44.000000', '2021-01-18 19:49:44.000000'),
(196, 'Koshimbir', 'pizza.jpeg', 'Cucumber, carrot, tomatoes, cilantro', 3, 'available', 2, 473, '2021-12-06 09:29:03.000000', '2021-06-18 09:29:03.000000'),
(197, 'Methi na Gota', 'pizza.jpeg', 'Rava, gram flour, lemon juice, turmeric, fenugreek leaves', 6, 'available', 3, 169, '2022-07-07 12:34:37.000000', '2021-10-22 12:34:37.000000'),
(198, 'Mohanthal', 'pizza.jpeg', 'Rose water, pistachio, badam, bengal gram flour, saffron', 7, 'available', 3, 377, '2022-10-09 17:24:30.000000', '2021-06-05 17:24:30.000000'),
(199, 'Muthiya', 'pizza.jpeg', 'Bottle gourd, whole wheat flour, rava, sesame seeds, bengal gram flour', 1, 'available', 1, 431, '2021-12-03 16:08:20.000000', '2021-08-02 16:08:20.000000'),
(200, 'Patra', 'pizza.jpeg', 'Arbi ke patte, sesame seeds, gur, bengal gram flour, imli', 7, 'available', 3, 253, '2021-03-02 09:47:11.000000', '2021-10-06 09:47:11.000000'),
(201, 'Pav Bhaji', 'pizza.jpeg', 'Pav bhaji masala, gobi, potatoes, green peas, dinner rolls', 7, 'available', 5, 187, '2022-11-25 22:46:19.000000', '2022-07-17 22:46:19.000000'),
(202, 'Puri Bhaji', 'pizza.jpeg', 'Aloo, urad dal, mustard, ginger, curry leaves', 1, 'available', 5, 201, '2021-01-25 02:52:58.000000', '2022-01-10 02:52:58.000000'),
(203, 'Sabudana Khichadi', 'pizza.jpeg', 'Raw peanuts, sabudana, lemon, avocado oil, curry leaves, green chili', 6, 'available', 3, 313, '2022-06-05 05:50:07.000000', '2021-05-02 05:50:07.000000'),
(204, 'Sev khamani', 'pizza.jpeg', 'Khaman, pomegranate, sev, powdered sugar, garlic', 5, 'available', 5, 52, '2021-11-16 03:10:51.000000', '2022-03-01 03:10:51.000000'),
(205, 'Sev tameta', 'pizza.jpeg', 'Sev, ginger, tomato, sugar', 5, 'available', 4, 460, '2021-12-02 02:42:06.000000', '2022-11-28 02:42:06.000000'),
(206, 'Namakpara', 'pizza.jpeg', 'Wheat flour, baking soda, all purpose flour, black pepper, sunflower oil', 3, 'available', 2, 485, '2022-01-16 16:45:02.000000', '2022-06-11 16:45:02.000000'),
(207, 'Sukhdi', 'pizza.jpeg', 'Whole wheat flour, gur, clarified butter', 2, 'available', 2, 297, '2022-05-23 00:37:18.000000', '2021-03-17 00:37:18.000000'),
(208, 'Surnoli', 'pizza.jpeg', 'Rice flakes, yogurt, raw rice, jaggery, grated coconut', 7, 'available', 4, 84, '2021-11-04 08:21:05.000000', '2022-04-12 08:21:05.000000'),
(209, 'Thalipeeth', 'pizza.jpeg', 'Whole wheat flour, rice flour, pearl millet flour, sorghum flour, sesame seeds', 4, 'available', 5, 99, '2022-06-05 19:39:45.000000', '2021-05-01 19:39:45.000000'),
(210, 'Undhiyu', 'pizza.jpeg', 'Sweet potato, surti papdi, baby potatoes, valor papdi, green peas', 2, 'available', 5, 194, '2022-06-04 12:53:06.000000', '2021-04-11 12:53:06.000000'),
(211, 'Veg Kolhapuri', 'pizza.jpeg', 'Gobi, potato, beans, khus khus, coconut', 1, 'available', 5, 486, '2022-08-17 05:13:22.000000', '2022-01-09 05:13:22.000000'),
(212, 'Vindaloo', 'pizza.jpeg', 'Chicken, coconut oil, wine vinegar, ginger, green, cinnamon', 7, 'available', 3, 156, '2021-11-07 17:24:22.000000', '2021-05-29 17:24:22.000000'),
(213, 'Lilva Kachori', 'pizza.jpeg', 'Green garlic chutney, fresh green peas, ginger, lemon juice, plain flour', 6, 'available', 2, 331, '2021-07-02 12:36:04.000000', '2022-02-14 12:36:04.000000'),
(214, 'Mag Dhokli', 'pizza.jpeg', 'Moong beans, jaggery, red chillies, oil, salt', 1, 'available', 3, 130, '2022-07-06 19:38:15.000000', '2022-07-21 19:38:15.000000'),
(215, 'Khichu', 'pizza.jpeg', 'Rice flour, sesame seeds, baking soda, peanut oil', 6, 'available', 5, 488, '2022-04-17 13:33:01.000000', '2021-03-15 13:33:01.000000'),
(216, 'Thepla', 'pizza.jpeg', 'Chickpea flour, methi leaves, jowar flour, wheat flour', 3, 'available', 1, 153, '2021-04-04 06:26:59.000000', '2021-01-28 06:26:59.000000'),
(217, 'Farsi Puri', 'pizza.jpeg', 'Semolina, clarified butter, oil, white flour, black pepper', 6, 'available', 4, 208, '2022-11-27 00:39:20.000000', '2021-06-02 00:39:20.000000'),
(218, 'Khaman', 'pizza.jpeg', 'Yogurt, fresh coconut, sesame seeds, semolina, gram flour', 2, 'available', 2, 358, '2022-03-25 07:06:57.000000', '2021-06-10 07:06:57.000000'),
(219, 'Turiya Patra Vatana sabji', 'pizza.jpeg', 'Ridge gourd, baking soda, sugar, grated coconut, peas', 2, 'available', 1, 263, '2021-11-25 16:38:17.000000', '2021-05-03 16:38:17.000000'),
(220, 'Churma Ladoo', 'pizza.jpeg', 'Whole wheat flour, khus khus, sesame seeds, dry coconut, gur', 4, 'available', 2, 263, '2022-10-17 17:41:47.000000', '2021-05-13 17:41:47.000000'),
(221, 'Cheera Doi', 'pizza.jpeg', 'Rice, mango, curd', 4, 'available', 3, 430, '2022-06-11 03:39:45.000000', '2021-01-09 03:39:45.000000'),
(222, 'Gheela Pitha', 'pizza.jpeg', 'Sticky rice, rice flour, jaggery, orange rind', 3, 'available', 1, 367, '2021-11-13 09:43:20.000000', '2021-06-03 09:43:20.000000'),
(223, 'Khar', 'pizza.jpeg', 'Raw papaya, panch phoran masala, nigella seeds, mustard oil, fennel seeds', 6, 'available', 3, 495, '2022-12-22 16:10:28.000000', '2021-07-02 16:10:28.000000'),
(224, 'Kumol Sawul', 'pizza.jpeg', 'Rice, eggs, carrot, beetroot', 6, 'available', 3, 342, '2021-08-26 05:22:50.000000', '2022-06-19 05:22:50.000000'),
(225, 'Luchi', 'pizza.jpeg', 'Maida, vegetable oil', 1, 'available', 1, 192, '2022-05-20 22:58:02.000000', '2022-07-12 22:58:02.000000'),
(226, 'Alu Pitika', 'pizza.jpeg', 'Potatoes, mustard oil, fish, green chillies', 5, 'available', 4, 145, '2022-09-09 01:26:08.000000', '2021-12-23 01:26:08.000000'),
(227, 'Masor tenga', 'pizza.jpeg', 'Ridge gourd, fish, lemon, tomatoes, mustard oil', 7, 'available', 2, 458, '2022-01-27 06:51:34.000000', '2021-06-11 06:51:34.000000'),
(228, 'Bengena Pitika', 'pizza.jpeg', 'Brinjal, onions, salt, sesame seeds, coriander', 1, 'available', 3, 107, '2021-06-03 02:26:02.000000', '2021-02-15 02:26:02.000000'),
(229, 'Bilahi Maas', 'pizza.jpeg', 'Potatoes, garam masala, tomatoes, mustard oil, bay leaf', 1, 'available', 4, 430, '2021-07-26 10:56:32.000000', '2022-04-27 10:56:32.000000'),
(230, 'Black rice', 'pizza.jpeg', 'Forbidden black rice, chicken, olive oil, slivered almonds, garlic powder', 6, 'available', 3, 296, '2022-10-21 09:53:19.000000', '2022-09-20 09:53:19.000000'),
(231, 'Bora Sawul', 'pizza.jpeg', 'Biryani masala, mixed vegetables, yellow moong daal, whole red, mustard seeds', 7, 'available', 5, 436, '2022-10-10 19:25:35.000000', '2022-02-19 19:25:35.000000'),
(232, 'Brown Rice', 'pizza.jpeg', 'Brown rice, soy sauce, olive oil', 6, 'available', 1, 84, '2021-12-14 07:53:45.000000', '2021-06-06 07:53:45.000000'),
(233, 'Chingri malai curry', 'pizza.jpeg', 'Coconut milk, lobster, fresh green chilli, ginger, red onion', 5, 'available', 4, 398, '2021-07-11 03:39:16.000000', '2022-09-15 03:39:16.000000'),
(234, 'Goja', 'pizza.jpeg', 'Baking soda, clarified butter, oil, all purpose flour', 5, 'available', 4, 401, '2021-04-22 17:03:15.000000', '2021-03-29 17:03:15.000000'),
(235, 'Hando Guri', 'pizza.jpeg', 'Jaggery, raisins', 4, 'available', 3, 277, '2022-04-30 22:40:14.000000', '2021-12-05 22:40:14.000000'),
(236, 'Haq Maas', 'pizza.jpeg', 'Lamb, garam masala powder, curd, turmeric, bay leaf', 3, 'available', 3, 491, '2022-01-27 10:16:45.000000', '2021-03-13 10:16:45.000000'),
(237, 'Chingri Bhape', 'pizza.jpeg', 'Coconut, prawns, curd, mustard seed, green chili', 7, 'available', 3, 369, '2021-04-10 20:18:51.000000', '2022-02-25 20:18:51.000000'),
(238, 'Kabiraji', 'pizza.jpeg', 'Fish fillet, besan, lemon, mint, ginger', 3, 'available', 3, 140, '2022-04-27 23:22:17.000000', '2021-05-09 23:22:17.000000'),
(239, 'Khorisa', 'pizza.jpeg', 'Fermented bamboo shoot, potato, ginger, green, mustard oil', 3, 'available', 2, 304, '2022-04-03 20:40:42.000000', '2022-11-02 20:40:42.000000'),
(240, 'Koldil Chicken', 'pizza.jpeg', 'Banana flower, chicken, green chili, mustard oil, lemon juice', 3, 'available', 3, 134, '2022-07-20 17:13:13.000000', '2021-12-04 17:13:13.000000'),
(241, 'Konir Dom', 'pizza.jpeg', 'Aloo, tomatoes, mustard oil, bay leaf, cinnamon stick', 5, 'available', 2, 114, '2021-04-07 19:53:24.000000', '2022-12-24 19:53:24.000000'),
(242, 'Koldil Duck', 'pizza.jpeg', 'Rice flour, mutton, banana, gram flour, olive oil, baking powder', 1, 'available', 3, 98, '2022-06-19 06:53:48.000000', '2021-11-02 06:53:48.000000'),
(243, 'Masor Koni', 'pizza.jpeg', 'Fish roe, pumpkin flowers, mustard oil, turmeric, tomato', 3, 'available', 3, 429, '2021-05-12 14:58:47.000000', '2021-10-02 14:58:47.000000'),
(244, 'Mishti Chholar Dal', 'pizza.jpeg', 'Chana dal, fresh coconut, ginger, cinnamon, raisins', 1, 'available', 3, 441, '2021-01-10 15:21:43.000000', '2022-04-15 15:21:43.000000'),
(245, 'Pakhala', 'pizza.jpeg', 'Curd, cooked rice, curry leaves, dry chilli', 1, 'available', 2, 279, '2022-02-10 09:18:26.000000', '2022-04-02 09:18:26.000000'),
(246, 'Pani Pitha', 'pizza.jpeg', 'Tea leaves, white sesame seeds, dry coconut, soaked rice', 1, 'available', 4, 345, '2022-07-27 16:39:48.000000', '2021-07-01 16:39:48.000000'),
(247, 'Payokh', 'pizza.jpeg', 'Basmati rice, rose water, sugar, clarified butter, cardamom pods', 1, 'available', 5, 449, '2022-08-08 13:04:06.000000', '2021-07-23 13:04:06.000000'),
(248, 'Prawn malai curry', 'pizza.jpeg', 'Coconut milk, prawns, garlic, turmeric, sugar', 1, 'available', 4, 203, '2022-06-18 00:07:18.000000', '2021-10-23 00:07:18.000000'),
(249, 'Red Rice', 'pizza.jpeg', 'Red pepper, red onion, butter, watercress, olive oil', 6, 'available', 5, 219, '2021-01-16 09:49:05.000000', '2022-04-13 09:49:05.000000'),
(250, 'Shukto', 'pizza.jpeg', 'Green beans, bitter gourd, ridge gourd, banana, brinjal', 6, 'available', 4, 284, '2022-12-03 18:42:28.000000', '2022-04-20 18:42:28.000000');

-- --------------------------------------------------------

--
-- Table structure for table `core_foodorder`
--

CREATE TABLE `core_foodorder` (
  `id` bigint(20) NOT NULL,
  `number` varchar(70) NOT NULL,
  `item_id` varchar(30) NOT NULL,
  `h_table_id` int(11) NOT NULL,
  `hotel_id` int(11) NOT NULL,
  `quantity` int(11) NOT NULL,
  `status` varchar(20) DEFAULT NULL,
  `rate` int(11) NOT NULL,
  `description` varchar(225) DEFAULT NULL,
  `created_at` datetime(6) DEFAULT NULL,
  `updated_at` datetime(6) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `core_foodorder`
--

INSERT INTO `core_foodorder` (`id`, `number`, `item_id`, `h_table_id`, `hotel_id`, `quantity`, `status`, `rate`, `description`, `created_at`, `updated_at`) VALUES
(1, 'order-f7c96248-d918-4094-9ca7-8478d1baad31', '2', 1, 5, 1, 'served', 751, 'Gram flour, ghee, sugar', '2022-06-02 00:00:00.000000', '2022-06-02 00:00:00.000000'),
(2, 'order-f7c96248-d918-4094-9ca7-8478d1baad31', '2', 2, 2, 2, 'served', 798, 'Carrots, milk, sugar, ghee, cashews, raisins', '2022-06-12 01:00:00.000000', '2022-06-12 01:00:00.000000'),
(3, 'order-f7c96248-d918-4094-9ca7-8478d1baad31', '1', 2, 4, 2, 'served', 724, 'Flour, ghee, kewra, milk, clarified butter, sugar, almonds, pistachio, saffron, green cardamom', '2022-06-02 02:00:00.000000', '2022-06-02 02:00:00.000000'),
(4, 'order-d6e93e64-9e4d-4f61-809a-28d5febc8a14', '1', 1, 4, 2, 'served', 122, 'Milk powder, plain flour, baking powder, ghee, milk, sugar, water, rose water', '2022-06-29 03:00:00.000000', '2022-06-29 03:00:00.000000'),
(5, 'order-d6e93e64-9e4d-4f61-809a-28d5febc8a14', '5', 2, 3, 3, 'served', 588, 'Sugar syrup, lentil flour', '2022-06-26 04:00:00.000000', '2022-06-26 04:00:00.000000'),
(6, 'order-d6e93e64-9e4d-4f61-809a-28d5febc8a14', '2', 4, 5, 3, 'served', 785, 'Maida, corn flour, baking soda, vinegar, curd, water, turmeric, saffron, cardamom', '2022-06-08 05:00:00.000000', '2022-06-08 05:00:00.000000'),
(7, 'order-d6e93e64-9e4d-4f61-809a-28d5febc8a14', '3', 5, 5, 5, 'served', 425, 'Cashews, ghee, cardamom, sugar', '2022-06-07 06:00:00.000000', '2022-06-07 06:00:00.000000'),
(8, 'order-d6e93e64-9e4d-4f61-809a-28d5febc8a14', '5', 2, 3, 4, 'served', 803, 'Milk, cottage cheese, sugar', '2022-06-20 07:00:00.000000', '2022-06-20 07:00:00.000000'),
(9, 'order-a993fdee-c53e-4537-b442-9840544929a4', '2', 5, 2, 1, 'served', 987, 'Milk, rice, sugar, dried fruits', '2022-06-05 08:00:00.000000', '2022-06-05 08:00:00.000000'),
(10, 'order-a993fdee-c53e-4537-b442-9840544929a4', '5', 3, 2, 3, 'served', 60, 'Gram flour, ghee, sugar', '2022-06-21 09:00:00.000000', '2022-06-21 09:00:00.000000'),
(11, 'order-a993fdee-c53e-4537-b442-9840544929a4', '4', 2, 1, 2, 'served', 271, 'Yogurt, milk, nuts, sugar', '2022-06-18 10:00:00.000000', '2022-06-18 10:00:00.000000'),
(12, 'order-fba651b4-800a-44ba-bc01-3fba8e64446e', '1', 3, 3, 3, 'served', 465, 'Refined flour, besan, ghee, powdered sugar, yoghurt, green cardamom', '2022-06-18 11:00:00.000000', '2022-06-18 11:00:00.000000'),
(13, 'order-fba651b4-800a-44ba-bc01-3fba8e64446e', '3', 2, 3, 5, 'served', 442, 'Firm white pumpkin, sugar, kitchen lime, alum powder', '2022-06-15 12:00:00.000000', '2022-06-15 12:00:00.000000'),
(14, 'order-fba651b4-800a-44ba-bc01-3fba8e64446e', '5', 3, 2, 1, 'served', 639, 'Rice, sugar, nuts', '2022-06-05 13:00:00.000000', '2022-06-05 13:00:00.000000'),
(15, 'order-1e524df4-62be-4744-ab58-ee433c80e167', '5', 4, 5, 1, 'served', 712, 'Condensed milk, sugar, spices, nuts', '2022-06-04 14:00:00.000000', '2022-06-04 14:00:00.000000'),
(16, 'order-1e524df4-62be-4744-ab58-ee433c80e167', '2', 2, 3, 1, 'served', 461, 'Semolina, ghee, nuts, milk', '2022-06-21 15:00:00.000000', '2022-06-21 15:00:00.000000'),
(17, 'order-1e524df4-62be-4744-ab58-ee433c80e167', '4', 1, 4, 3, 'served', 668, 'Khoa, coconut, molu leaf', '2022-06-10 16:00:00.000000', '2022-06-10 16:00:00.000000'),
(18, 'order-1e524df4-62be-4744-ab58-ee433c80e167', '4', 5, 5, 4, 'served', 742, 'Corn flour, ghee, dry fruits', '2022-06-15 17:00:00.000000', '2022-06-15 17:00:00.000000'),
(19, 'order-1e524df4-62be-4744-ab58-ee433c80e167', '2', 1, 3, 3, 'served', 387, 'Gram flour, ghee, sugar, milk, cardamom', '2022-06-30 18:00:00.000000', '2022-06-30 18:00:00.000000'),
(20, 'order-1e524df4-62be-4744-ab58-ee433c80e167', '4', 3, 2, 3, 'served', 840, 'Chhena, sugar, ghee', '2022-06-26 19:00:00.000000', '2022-06-26 19:00:00.000000'),
(21, 'order-f392ad53-590f-4085-a9de-fc6dd3848f16', '1', 4, 5, 5, 'served', 252, 'Chhena, sugar, milk', '2022-06-28 20:00:00.000000', '2022-06-28 20:00:00.000000'),
(22, 'order-f392ad53-590f-4085-a9de-fc6dd3848f16', '2', 1, 3, 3, 'served', 457, 'Sugar, chenna cheese', '2022-06-13 21:00:00.000000', '2022-06-13 21:00:00.000000'),
(23, 'order-f392ad53-590f-4085-a9de-fc6dd3848f16', '3', 4, 1, 5, 'served', 349, 'Flour, cream, sugar, saffron, lemon juice, coconut flakes', '2022-06-25 22:00:00.000000', '2022-06-25 22:00:00.000000'),
(24, 'order-4da65619-859b-40fb-829b-7437c35c203f', '5', 4, 3, 5, 'served', 847, 'Chenna, condensed milk, sugar, saffron, cardamom', '2022-06-28 23:00:00.000000', '2022-06-28 23:00:00.000000'),
(25, 'order-13676bd9-8eda-4b89-877d-af8cfbe0cdaa', '1', 3, 5, 3, 'served', 318, 'Chhena, sugar, ghee', '2022-06-22 00:00:00.000000', '2022-06-22 00:00:00.000000'),
(26, 'order-13676bd9-8eda-4b89-877d-af8cfbe0cdaa', '5', 2, 2, 3, 'served', 980, 'Flour, fried milk power, sugar syrup', '2022-06-12 01:00:00.000000', '2022-06-12 01:00:00.000000'),
(27, 'order-13676bd9-8eda-4b89-877d-af8cfbe0cdaa', '1', 2, 2, 4, 'served', 899, 'Yoghurt, refined flour, ghee, fennel seeds', '2022-06-03 02:00:00.000000', '2022-06-03 02:00:00.000000'),
(28, 'order-a9e7bcbe-998e-4d8a-8b88-6205201d8cd8', '5', 3, 2, 2, 'served', 709, 'Besan flour, sugar, ghee', '2022-06-13 03:00:00.000000', '2022-06-13 03:00:00.000000'),
(29, 'order-a9e7bcbe-998e-4d8a-8b88-6205201d8cd8', '2', 2, 2, 5, 'served', 161, 'Milk, jaggery', '2022-06-15 04:00:00.000000', '2022-06-15 04:00:00.000000'),
(30, 'order-a9e7bcbe-998e-4d8a-8b88-6205201d8cd8', '4', 3, 4, 4, 'served', 821, 'Chhena, sugar, ghee, flour', '2022-06-18 05:00:00.000000', '2022-06-18 05:00:00.000000'),
(31, 'order-d681436b-4ad3-4c7a-b312-6a30ecd9348d', '2', 3, 5, 5, 'served', 903, 'Rice flour, wheat flour', '2022-06-17 06:00:00.000000', '2022-06-17 06:00:00.000000'),
(32, 'order-d681436b-4ad3-4c7a-b312-6a30ecd9348d', '5', 3, 1, 2, 'served', 783, 'Chenna, sweetened milk', '2022-06-21 07:00:00.000000', '2022-06-21 07:00:00.000000'),
(33, 'order-d681436b-4ad3-4c7a-b312-6a30ecd9348d', '2', 4, 2, 4, 'served', 488, 'Chhena, reduced milk, pistachio', '2022-06-08 08:00:00.000000', '2022-06-08 08:00:00.000000'),
(34, 'order-d681436b-4ad3-4c7a-b312-6a30ecd9348d', '4', 5, 3, 5, 'served', 403, 'Chhena, sugar, cardamom', '2022-06-08 09:00:00.000000', '2022-06-08 09:00:00.000000'),
(35, 'order-d681436b-4ad3-4c7a-b312-6a30ecd9348d', '5', 1, 3, 4, 'served', 857, 'Milk, sugar, saffron, cardamom', '2022-06-16 10:00:00.000000', '2022-06-16 10:00:00.000000'),
(36, 'order-8c4c0010-62fd-42fa-9eb4-16abc510c388', '2', 1, 1, 2, 'served', 187, 'Rice flour, jaggery, ghee, vegetable oil, elachi', '2022-06-29 11:00:00.000000', '2022-06-29 11:00:00.000000'),
(37, 'order-8c4c0010-62fd-42fa-9eb4-16abc510c388', '3', 2, 4, 2, 'served', 865, 'Rice flour, jaggery, ghee', '2022-06-06 12:00:00.000000', '2022-06-06 12:00:00.000000'),
(38, 'order-8c4c0010-62fd-42fa-9eb4-16abc510c388', '1', 5, 3, 3, 'served', 430, 'Besan, jaggery, cardamom powder, ghee, cashews and raisins, jaggery syrup, sugar', '2022-06-27 13:00:00.000000', '2022-06-27 13:00:00.000000'),
(39, 'order-8c4c0010-62fd-42fa-9eb4-16abc510c388', '1', 2, 3, 5, 'served', 677, 'Peanuts, jaggery', '2022-06-22 14:00:00.000000', '2022-06-22 14:00:00.000000'),
(40, 'order-8c4c0010-62fd-42fa-9eb4-16abc510c388', '2', 2, 3, 3, 'served', 823, 'Milk, Sugar, Dharwadi buffalo milk', '2022-06-13 15:00:00.000000', '2022-06-13 15:00:00.000000'),
(41, 'order-7a54e483-755d-490f-81e1-1261c47599fb', '3', 3, 4, 3, 'served', 117, 'Loaf bread, milk', '2022-06-20 16:00:00.000000', '2022-06-20 16:00:00.000000'),
(42, 'order-df17fcf4-586e-4bae-b6cc-22fe89d3b5ba', '4', 3, 1, 5, 'served', 824, 'Rice flour, sugar, salt, ghee, semolina', '2022-06-07 17:00:00.000000', '2022-06-07 17:00:00.000000'),
(43, 'order-df17fcf4-586e-4bae-b6cc-22fe89d3b5ba', '1', 5, 5, 2, 'served', 776, 'Wheat flour, sugar', '2022-06-23 18:00:00.000000', '2022-06-23 18:00:00.000000'),
(44, 'order-df17fcf4-586e-4bae-b6cc-22fe89d3b5ba', '3', 4, 3, 3, 'served', 266, 'Black lentils, rice', '2022-06-01 19:00:00.000000', '2022-06-01 19:00:00.000000'),
(45, 'order-22ff0863-967c-48c2-bd3b-1cff1d25320b', '2', 1, 3, 4, 'served', 773, 'Besan flour, semolina, mung bean, jaggery, coconut, skimmed milk powder, sugar, ghee', '2022-06-29 20:00:00.000000', '2022-06-29 20:00:00.000000'),
(46, 'order-22ff0863-967c-48c2-bd3b-1cff1d25320b', '3', 1, 1, 1, 'served', 962, 'Maida flour, turmeric, coconut, chickpeas, jaggery, ghee, cardamom', '2022-06-10 21:00:00.000000', '2022-06-10 21:00:00.000000'),
(47, 'order-22ff0863-967c-48c2-bd3b-1cff1d25320b', '5', 3, 3, 5, 'served', 523, 'Rice flour, milk', '2022-06-13 22:00:00.000000', '2022-06-13 22:00:00.000000'),
(48, 'order-03639f33-a151-4288-b2d6-7a127d87245d', '5', 2, 4, 4, 'served', 776, 'Chana dal, jaggery', '2022-06-03 23:00:00.000000', '2022-06-03 23:00:00.000000'),
(49, 'order-03639f33-a151-4288-b2d6-7a127d87245d', '4', 3, 2, 1, 'served', 392, 'Rice, jaggery, cashews, ghee', '2022-06-27 00:00:00.000000', '2022-06-27 00:00:00.000000'),
(50, 'order-03639f33-a151-4288-b2d6-7a127d87245d', '5', 5, 5, 5, 'served', 639, 'Rice flour, powdered sugar, ghee', '2022-06-12 01:00:00.000000', '2022-06-12 01:00:00.000000'),
(51, 'order-03639f33-a151-4288-b2d6-7a127d87245d', '2', 5, 3, 2, 'served', 554, 'Apricots, sugar syrup', '2022-06-12 02:00:00.000000', '2022-06-12 02:00:00.000000'),
(52, 'order-03639f33-a151-4288-b2d6-7a127d87245d', '4', 4, 5, 2, 'served', 348, 'Vermicelli pudding, milk', '2022-06-30 03:00:00.000000', '2022-06-30 03:00:00.000000'),
(53, 'order-03639f33-a151-4288-b2d6-7a127d87245d', '2', 5, 3, 4, 'served', 703, 'Rice flour, banana, jaggery, coconut', '2022-06-13 04:00:00.000000', '2022-06-13 04:00:00.000000'),
(54, 'order-3d27ea0c-cb97-4ba9-93fa-106cbcd19df5', '2', 4, 4, 3, 'served', 874, 'Rice flour, jaggery, coconut', '2022-06-02 05:00:00.000000', '2022-06-02 05:00:00.000000'),
(55, 'order-3d27ea0c-cb97-4ba9-93fa-106cbcd19df5', '2', 3, 5, 5, 'served', 520, 'Rice flour, jaggery, khus-khus seeds', '2022-05-31 06:00:00.000000', '2022-05-31 06:00:00.000000'),
(56, 'order-3d27ea0c-cb97-4ba9-93fa-106cbcd19df5', '4', 5, 5, 2, 'served', 241, 'Sugar, milk, nuts', '2022-06-12 07:00:00.000000', '2022-06-12 07:00:00.000000'),
(57, 'order-3d27ea0c-cb97-4ba9-93fa-106cbcd19df5', '5', 5, 4, 1, 'served', 167, 'Cucumber, rava', '2022-06-09 08:00:00.000000', '2022-06-09 08:00:00.000000'),
(58, 'order-3d27ea0c-cb97-4ba9-93fa-106cbcd19df5', '1', 2, 1, 4, 'served', 527, 'Milk, rice, sugar, dry fruits', '2022-06-11 09:00:00.000000', '2022-06-11 09:00:00.000000'),
(59, 'order-36575560-f2e0-484e-8d6e-d0df21839f30', '5', 1, 1, 2, 'served', 618, 'Semolina, sugar', '2022-06-14 10:00:00.000000', '2022-06-14 10:00:00.000000'),
(60, 'order-36575560-f2e0-484e-8d6e-d0df21839f30', '3', 1, 4, 2, 'served', 289, 'Rice flour, coconut, jaggery', '2022-06-06 11:00:00.000000', '2022-06-06 11:00:00.000000'),
(61, 'order-36575560-f2e0-484e-8d6e-d0df21839f30', '4', 1, 5, 3, 'served', 393, 'Sugar, ghee, maida flour, semolina', '2022-06-30 12:00:00.000000', '2022-06-30 12:00:00.000000'),
(62, 'order-36575560-f2e0-484e-8d6e-d0df21839f30', '1', 3, 5, 5, 'served', 593, 'Curd, sugar, saffron, cardamom', '2022-06-17 13:00:00.000000', '2022-06-17 13:00:00.000000'),
(63, 'order-36575560-f2e0-484e-8d6e-d0df21839f30', '5', 1, 2, 2, 'served', 853, 'Maida, sugar, ghee', '2022-06-02 14:00:00.000000', '2022-06-02 14:00:00.000000'),
(64, 'order-ad1a6b60-5568-4d76-afa0-f5012435bc89', '2', 4, 3, 1, 'served', 926, 'Fish, potol, tomato, chillies, ginger, garlic', '2022-06-14 15:00:00.000000', '2022-06-14 15:00:00.000000'),
(65, 'order-ad1a6b60-5568-4d76-afa0-f5012435bc89', '5', 1, 5, 1, 'served', 626, 'Boiled pork, onions, chillies, ginger and garlic', '2022-06-24 16:00:00.000000', '2022-06-24 16:00:00.000000'),
(66, 'order-ad1a6b60-5568-4d76-afa0-f5012435bc89', '3', 4, 2, 3, 'served', 262, 'Rice, milk, sugar, cardamom', '2022-05-31 17:00:00.000000', '2022-05-31 17:00:00.000000'),
(67, 'order-14b62671-d776-4c76-a722-9f4d41ec595a', '3', 1, 3, 5, 'served', 717, 'Rice, axone, salt, water, chillies, pork', '2022-06-04 18:00:00.000000', '2022-06-04 18:00:00.000000'),
(68, 'order-154875cd-d740-4bce-9066-4db64de8d24a', '1', 1, 5, 5, 'served', 125, 'Cauliflower, potato, garam masala, turmeric, curry leaves', '2022-06-09 19:00:00.000000', '2022-06-09 19:00:00.000000'),
(69, 'order-154875cd-d740-4bce-9066-4db64de8d24a', '2', 3, 4, 3, 'served', 821, 'Rice flour, potato, bread crumbs, garam masala, salt', '2022-06-20 20:00:00.000000', '2022-06-20 20:00:00.000000'),
(70, 'order-154875cd-d740-4bce-9066-4db64de8d24a', '3', 5, 5, 2, 'served', 924, 'Potato, peas, chillies, ginger, garam masala, garlic', '2022-06-22 21:00:00.000000', '2022-06-22 21:00:00.000000'),
(71, 'order-154875cd-d740-4bce-9066-4db64de8d24a', '3', 2, 5, 4, 'served', 523, 'Potato, fenugreek leaves, chillies, salt, oil', '2022-06-11 22:00:00.000000', '2022-06-11 22:00:00.000000'),
(72, 'order-154875cd-d740-4bce-9066-4db64de8d24a', '4', 5, 5, 4, 'served', 226, 'Potato, shimla mirch, garam masala, amchur powder, salt', '2022-06-10 23:00:00.000000', '2022-06-10 23:00:00.000000'),
(73, 'order-154875cd-d740-4bce-9066-4db64de8d24a', '4', 1, 3, 5, 'served', 989, 'Chole, rava, yogurt, plain flour, baking soda', '2022-06-15 00:00:00.000000', '2022-06-15 00:00:00.000000'),
(74, 'order-c7e14773-a442-40c5-b538-8bb266fa8c77', '4', 2, 2, 2, 'served', 890, 'Ladies finger, garam masala, kasuri methi, tomatoes, chili powder', '2022-06-28 01:00:00.000000', '2022-06-28 01:00:00.000000'),
(75, 'order-c7e14773-a442-40c5-b538-8bb266fa8c77', '3', 1, 3, 1, 'served', 569, 'Chicken thighs, basmati rice, star anise, sweet, green chillies', '2022-06-04 02:00:00.000000', '2022-06-04 02:00:00.000000'),
(76, 'order-c7e14773-a442-40c5-b538-8bb266fa8c77', '1', 4, 5, 2, 'served', 383, 'Chicken, greek yogurt, cream, garam masala powder, cashew nuts, butter', '2022-06-14 03:00:00.000000', '2022-06-14 03:00:00.000000'),
(77, 'order-98f954d7-238b-4ad6-8ac8-a698e7ae6d98', '3', 2, 1, 3, 'served', 915, 'Chickpeas, tomato paste, garam masala, ginger, red onion, avocado oil', '2022-06-12 04:00:00.000000', '2022-06-12 04:00:00.000000'),
(78, 'order-8897fa3d-bb6e-45da-bd9b-a31731d7eed8', '1', 1, 1, 3, 'served', 503, 'Whole wheat flour, olive oil, hot water, all purpose flour', '2022-06-17 05:00:00.000000', '2022-06-17 05:00:00.000000'),
(79, 'order-8897fa3d-bb6e-45da-bd9b-a31731d7eed8', '2', 2, 2, 5, 'served', 95, 'Chicken, dahi, sesame seeds, garam masala powder, cashew nuts, saffron', '2022-06-15 06:00:00.000000', '2022-06-15 06:00:00.000000'),
(80, 'order-8897fa3d-bb6e-45da-bd9b-a31731d7eed8', '1', 5, 2, 5, 'served', 971, 'Naan bread, tomato sauce, skinless chicken breasts, heavy cream, garam masala', '2022-06-03 07:00:00.000000', '2022-06-03 07:00:00.000000'),
(81, 'order-8897fa3d-bb6e-45da-bd9b-a31731d7eed8', '4', 4, 3, 1, 'served', 547, 'Chicken, whole wheat bread, rice flour, garam masala powder, whole egg', '2022-06-20 08:00:00.000000', '2022-06-20 08:00:00.000000'),
(82, 'order-8897fa3d-bb6e-45da-bd9b-a31731d7eed8', '1', 4, 3, 3, 'served', 158, 'Chole, bhatura, garam masala, bay leaf, cinnamon stick', '2022-06-21 09:00:00.000000', '2022-06-21 09:00:00.000000'),
(83, 'order-8897fa3d-bb6e-45da-bd9b-a31731d7eed8', '4', 3, 2, 1, 'served', 134, 'Moong dal, masoor dal, chana dal, wheat flour, almond', '2022-06-12 10:00:00.000000', '2022-06-12 10:00:00.000000'),
(84, 'order-1b0b97f6-9ed3-4585-8c2d-37435530d782', '4', 2, 3, 3, 'served', 452, 'Moong dal, garam masala powder, garlic, green chilli, all purpose flour', '2022-06-30 11:00:00.000000', '2022-06-30 11:00:00.000000'),
(85, 'order-1b0b97f6-9ed3-4585-8c2d-37435530d782', '3', 4, 5, 1, 'served', 259, 'Red kidney beans, urad dal, cream, garam masala, chili powder', '2022-06-19 12:00:00.000000', '2022-06-19 12:00:00.000000'),
(86, 'order-1b0b97f6-9ed3-4585-8c2d-37435530d782', '1', 5, 2, 5, 'served', 256, 'Pigeon peas, garam masala, ginger, red onion, kasuri methi', '2022-06-26 13:00:00.000000', '2022-06-26 13:00:00.000000'),
(87, 'order-1b0b97f6-9ed3-4585-8c2d-37435530d782', '5', 1, 5, 2, 'served', 663, 'Baby potatoes, garam masala, cashew nuts, kasuri methi, tomatoes', '2022-06-23 14:00:00.000000', '2022-06-23 14:00:00.000000'),
(88, 'order-1b0b97f6-9ed3-4585-8c2d-37435530d782', '4', 5, 1, 1, 'served', 675, 'Beaten rice flakes, potato, curry leaves, green chilies, lemon juice', '2022-06-25 15:00:00.000000', '2022-06-25 15:00:00.000000'),
(89, 'order-15539a44-3671-4614-b86d-cd266a8b78d1', '3', 4, 4, 5, 'served', 726, 'Chana dal, whole wheat flour, arhar dal, white urad dal, garam masala powder', '2022-06-20 16:00:00.000000', '2022-06-20 16:00:00.000000'),
(90, 'order-3e7211df-c541-4935-84b7-db65e04269d2', '2', 2, 4, 4, 'served', 690, 'Moong dal, rava, garam masala, dough, fennel seeds', '2022-06-15 17:00:00.000000', '2022-06-15 17:00:00.000000'),
(91, 'order-3e7211df-c541-4935-84b7-db65e04269d2', '1', 4, 1, 2, 'served', 387, 'Cottage cheese, bell peppers, gravy, garam masala, cashew nuts', '2022-06-09 18:00:00.000000', '2022-06-09 18:00:00.000000'),
(92, 'order-3e7211df-c541-4935-84b7-db65e04269d2', '5', 2, 4, 3, 'served', 272, 'Besan, garam masala powder, gram flour, ginger, curry leaves', '2022-06-26 19:00:00.000000', '2022-06-26 19:00:00.000000'),
(93, 'order-2fd476d4-0961-4697-a711-2f0814a6a37e', '2', 5, 4, 5, 'served', 641, 'Bitter gourd, fennel, garam masala powder, chili powder, amchur powder', '2022-06-07 20:00:00.000000', '2022-06-07 20:00:00.000000'),
(94, 'order-2fd476d4-0961-4697-a711-2f0814a6a37e', '5', 3, 4, 5, 'served', 259, 'Moong dal, green peas, ginger, tomato, green chili', '2022-06-28 21:00:00.000000', '2022-06-28 21:00:00.000000'),
(95, 'order-2fd476d4-0961-4697-a711-2f0814a6a37e', '5', 2, 1, 1, 'served', 988, 'Paneer, potato, cream, corn flour, garam masala', '2022-06-06 22:00:00.000000', '2022-06-06 22:00:00.000000'),
(96, 'order-2fd476d4-0961-4697-a711-2f0814a6a37e', '1', 2, 5, 1, 'served', 885, 'Rose syrup, falooda sev, mixed nuts, saffron, sugar', '2022-06-03 23:00:00.000000', '2022-06-03 23:00:00.000000'),
(97, 'order-2fd476d4-0961-4697-a711-2f0814a6a37e', '4', 5, 5, 4, 'served', 116, 'Bottle gourd, garam masala powder, gram flour, ginger, chillies', '2022-06-04 00:00:00.000000', '2022-06-04 00:00:00.000000'),
(98, 'order-2fd476d4-0961-4697-a711-2f0814a6a37e', '2', 2, 1, 5, 'served', 251, 'Bottle gourd, coconut oil, garam masala, ginger, green chillies', '2022-06-11 01:00:00.000000', '2022-06-11 01:00:00.000000'),
(99, 'order-4994e87d-1702-475e-8e0d-048ad205a01b', '3', 5, 5, 4, 'served', 919, 'Wheat flour, roasted gram flour, tomato, nigella seeds, chilli', '2022-06-06 02:00:00.000000', '2022-06-06 02:00:00.000000'),
(100, 'order-4994e87d-1702-475e-8e0d-048ad205a01b', '5', 4, 3, 4, 'served', 443, 'Palak, makki atta, mustard green, garam masala, ginger', '2022-06-09 03:00:00.000000', '2022-06-09 03:00:00.000000'),
(101, 'order-4994e87d-1702-475e-8e0d-048ad205a01b', '3', 1, 5, 3, 'served', 482, 'Whole wheat flour, chickpea flour, green chilies', '2022-06-27 04:00:00.000000', '2022-06-27 04:00:00.000000'),
(102, 'order-6b37757e-e7bd-4ab4-aa59-6492ed7200df', '2', 2, 3, 5, 'served', 281, 'Mushroom, malai, garam masala, ginger, capsicum', '2022-05-31 05:00:00.000000', '2022-05-31 05:00:00.000000'),
(103, 'order-6b37757e-e7bd-4ab4-aa59-6492ed7200df', '5', 1, 3, 4, 'served', 667, 'Canned coconut milk, frozen green peas, wild mushrooms, garam masala, tomatoes', '2022-06-23 06:00:00.000000', '2022-06-23 06:00:00.000000'),
(104, 'order-6b37757e-e7bd-4ab4-aa59-6492ed7200df', '4', 2, 1, 1, 'served', 431, 'Whole wheat flour, honey, butter, garlic', '2022-06-15 07:00:00.000000', '2022-06-15 07:00:00.000000'),
(105, 'order-6b37757e-e7bd-4ab4-aa59-6492ed7200df', '2', 1, 2, 2, 'served', 409, 'Green beans, potatoes, khus khus, low fat, garam masala powder', '2022-06-10 08:00:00.000000', '2022-06-10 08:00:00.000000'),
(106, 'order-6b37757e-e7bd-4ab4-aa59-6492ed7200df', '2', 3, 4, 3, 'served', 227, 'Cottage cheese, palak, cream, garam masala, butter', '2022-06-13 09:00:00.000000', '2022-06-13 09:00:00.000000'),
(107, 'order-6b37757e-e7bd-4ab4-aa59-6492ed7200df', '5', 5, 5, 4, 'served', 482, 'Paneer, whipping cream, garam masala, cashew nuts, butter', '2022-06-24 10:00:00.000000', '2022-06-24 10:00:00.000000'),
(108, 'order-d5224d92-73aa-466f-ab59-4294bf9efe34', '5', 3, 1, 2, 'served', 797, 'Paneer, greek yogurt, tandoori masala, cream, bell pepper', '2022-06-18 11:00:00.000000', '2022-06-18 11:00:00.000000'),
(109, 'order-d5224d92-73aa-466f-ab59-4294bf9efe34', '5', 5, 4, 3, 'served', 175, 'Kala chana, mashed potato, boondi, sev, lemon', '2022-05-31 12:00:00.000000', '2022-05-31 12:00:00.000000'),
(110, 'order-d5224d92-73aa-466f-ab59-4294bf9efe34', '2', 4, 3, 3, 'served', 338, 'Whole wheat flour, musk melon seeds, poppy seeds, edible gum, semolina', '2022-06-28 13:00:00.000000', '2022-06-28 13:00:00.000000'),
(111, 'order-d5224d92-73aa-466f-ab59-4294bf9efe34', '5', 3, 1, 2, 'served', 348, 'Urad dal, sev, lemon juice, chopped tomatoes', '2022-06-09 14:00:00.000000', '2022-06-09 14:00:00.000000'),
(112, 'order-d5224d92-73aa-466f-ab59-4294bf9efe34', '4', 1, 5, 2, 'served', 352, 'Wheat flour, butter, potato, coriander', '2022-06-05 15:00:00.000000', '2022-06-05 15:00:00.000000'),
(113, 'order-d5224d92-73aa-466f-ab59-4294bf9efe34', '5', 2, 3, 2, 'served', 500, 'Arbi ke patte, sesame seeds, gur, bengal gram flour, imli', '2022-06-03 16:00:00.000000', '2022-06-03 16:00:00.000000'),
(114, 'order-4261558e-784f-4f4b-bb53-84cebb3494b7', '4', 5, 4, 2, 'served', 246, 'Fennel, tea bags, tomato, kasuri methi, cinnamon', '2022-06-09 17:00:00.000000', '2022-06-09 17:00:00.000000'),
(115, 'order-4261558e-784f-4f4b-bb53-84cebb3494b7', '2', 2, 3, 4, 'served', 151, 'Red kidney beans, garam masala powder, ginger, tomato, mustard oil', '2022-06-09 18:00:00.000000', '2022-06-09 18:00:00.000000'),
(116, 'order-4261558e-784f-4f4b-bb53-84cebb3494b7', '1', 1, 3, 2, 'served', 595, 'Garam masala powder, tomato, kasuri methi, cinnamon, mustard oil', '2022-06-02 19:00:00.000000', '2022-06-02 19:00:00.000000'),
(117, 'order-be9414a6-fd1e-4b80-97d9-9a22ccf9b9e4', '5', 1, 4, 2, 'served', 486, 'Potatoes, green peas, garam masala, ginger, dough', '2022-06-03 20:00:00.000000', '2022-06-03 20:00:00.000000'),
(118, 'order-be9414a6-fd1e-4b80-97d9-9a22ccf9b9e4', '2', 2, 1, 1, 'served', 670, 'Sattu, atta, dough, filling, mustard oil', '2022-05-31 21:00:00.000000', '2022-05-31 21:00:00.000000'),
(119, 'order-be9414a6-fd1e-4b80-97d9-9a22ccf9b9e4', '1', 4, 5, 1, 'served', 675, 'Cottage cheese, malai, garam masala, ginger, tomato', '2022-06-13 22:00:00.000000', '2022-06-13 22:00:00.000000'),
(120, 'order-be9414a6-fd1e-4b80-97d9-9a22ccf9b9e4', '5', 3, 3, 2, 'served', 926, 'Rose water, milk, white bread slices, saffron, almonds', '2022-06-15 23:00:00.000000', '2022-06-15 23:00:00.000000'),
(121, 'order-be9414a6-fd1e-4b80-97d9-9a22ccf9b9e4', '1', 2, 5, 5, 'served', 965, 'Baby corn, french beans, garam masala, ginger, carrot', '2022-06-15 00:00:00.000000', '2022-06-15 00:00:00.000000'),
(122, 'order-43ea0335-0aee-44df-86d0-fe8d129f55d0', '2', 3, 3, 5, 'served', 326, 'Greek yogurt, garam masala, kasuri methi, marinade, mustard oil', '2022-06-21 01:00:00.000000', '2022-06-21 01:00:00.000000'),
(123, 'order-43ea0335-0aee-44df-86d0-fe8d129f55d0', '5', 5, 5, 3, 'served', 446, 'Chickpea flour, biryani masala powder, yogurt, fish fillets, green bell pepper', '2022-05-31 02:00:00.000000', '2022-05-31 02:00:00.000000'),
(124, 'order-43ea0335-0aee-44df-86d0-fe8d129f55d0', '5', 1, 5, 3, 'served', 894, 'Whole wheat flour, arhar dal, ginger, kala jeera, green chilli', '2022-06-21 03:00:00.000000', '2022-06-21 03:00:00.000000'),
(125, 'order-43ea0335-0aee-44df-86d0-fe8d129f55d0', '1', 1, 1, 2, 'served', 175, 'Raw banana, elephant foot yam, long beans, tindora, urad dal', '2022-06-30 04:00:00.000000', '2022-06-30 04:00:00.000000'),
(126, 'order-43ea0335-0aee-44df-86d0-fe8d129f55d0', '1', 1, 3, 2, 'served', 778, 'Split pigeon peas, chana dal, urad dal, green peas, french beans', '2022-06-17 05:00:00.000000', '2022-06-17 05:00:00.000000'),
(127, 'order-93f8cb6b-f85b-46da-bab7-2003b70d7e9a', '3', 5, 5, 5, 'served', 963, 'Chana dal, urad dal, fresh coconut, sesame seeds, curry leaves', '2022-06-02 06:00:00.000000', '2022-06-02 06:00:00.000000'),
(128, 'order-93f8cb6b-f85b-46da-bab7-2003b70d7e9a', '1', 4, 1, 2, 'served', 998, 'Chana dal, urad dal, whole urad dal, blend rice, rock salt', '2022-06-22 07:00:00.000000', '2022-06-22 07:00:00.000000'),
(129, 'order-93f8cb6b-f85b-46da-bab7-2003b70d7e9a', '2', 1, 5, 3, 'served', 459, 'Rice flour, hot water, grated coconut', '2022-06-09 08:00:00.000000', '2022-06-09 08:00:00.000000'),
(130, 'order-93f8cb6b-f85b-46da-bab7-2003b70d7e9a', '2', 5, 2, 5, 'served', 816, 'Split urad dal, urad dal, idli rice, thick poha, rock salt', '2022-06-02 09:00:00.000000', '2022-06-02 09:00:00.000000'),
(131, 'order-93f8cb6b-f85b-46da-bab7-2003b70d7e9a', '4', 4, 5, 2, 'served', 187, 'Carrot, yellow mustard, red chilli, black salt', '2022-06-09 10:00:00.000000', '2022-06-09 10:00:00.000000'),
(132, 'order-93f8cb6b-f85b-46da-bab7-2003b70d7e9a', '2', 5, 2, 2, 'served', 329, 'Sesame oil, drumstick, tamarind paste, sambar powder, tomato', '2022-06-09 11:00:00.000000', '2022-06-09 11:00:00.000000'),
(133, 'order-15269326-9a6e-4e66-a35d-8930a4bfdf64', '4', 5, 5, 3, 'served', 168, 'Moong dal, chana dal, spinach, urad dal, coconut oil', '2022-06-10 12:00:00.000000', '2022-06-10 12:00:00.000000'),
(134, 'order-f7b7d587-18bb-42ec-ba6e-1cca11b4bd9a', '5', 5, 5, 4, 'served', 263, 'Urad dal, curry leaves, sugar, mustard seeds, spinach', '2022-06-11 13:00:00.000000', '2022-06-11 13:00:00.000000'),
(135, 'order-a04316a6-7956-40e6-bc02-a520547850e0', '5', 5, 4, 4, 'served', 711, 'Greens, tomato, mustard seeds, fenugreek seeds', '2022-06-23 14:00:00.000000', '2022-06-23 14:00:00.000000'),
(136, 'order-a04316a6-7956-40e6-bc02-a520547850e0', '4', 4, 2, 1, 'served', 473, 'Amaranth leaves, split urad dal, mustard seeds, grated coconut, red chili', '2022-06-17 15:00:00.000000', '2022-06-17 15:00:00.000000'),
(137, 'order-a04316a6-7956-40e6-bc02-a520547850e0', '4', 5, 2, 2, 'served', 56, 'Beef, coconut, garam masala, curry leaves, green chilies, chili powder', '2022-06-16 16:00:00.000000', '2022-06-16 16:00:00.000000'),
(138, 'order-a04316a6-7956-40e6-bc02-a520547850e0', '1', 4, 3, 5, 'served', 129, 'Chana dal, urad dal, potato, beans, peas', '2022-05-31 17:00:00.000000', '2022-05-31 17:00:00.000000'),
(139, 'order-a04316a6-7956-40e6-bc02-a520547850e0', '3', 3, 5, 1, 'served', 327, 'Moong dal, chana dal, cabbage, tamarind, curry leaves', '2022-06-03 18:00:00.000000', '2022-06-03 18:00:00.000000'),
(140, 'order-a04316a6-7956-40e6-bc02-a520547850e0', '2', 2, 5, 5, 'served', 565, 'Moong dal, cucumber, curry leaves, green chili, lemon juice', '2022-06-14 19:00:00.000000', '2022-06-14 19:00:00.000000'),
(141, 'order-504abd13-9bf6-4f17-81a7-f957c22dddfb', '1', 1, 1, 4, 'served', 954, 'Chana dal, urad dal, gooseberry, raw rice, curry leaves', '2022-06-22 20:00:00.000000', '2022-06-22 20:00:00.000000'),
(142, 'order-504abd13-9bf6-4f17-81a7-f957c22dddfb', '2', 2, 2, 5, 'served', 646, 'Sesame oil, raw rice, jaggery, grated coconut', '2022-06-22 21:00:00.000000', '2022-06-22 21:00:00.000000'),
(143, 'order-504abd13-9bf6-4f17-81a7-f957c22dddfb', '2', 1, 3, 3, 'served', 671, 'Pearl onions, urad dal, drumsticks, tomato, curry leaves', '2022-06-26 22:00:00.000000', '2022-06-26 22:00:00.000000'),
(144, 'order-504abd13-9bf6-4f17-81a7-f957c22dddfb', '2', 3, 4, 2, 'served', 468, 'Chana dal, urad dal, potatoes, idli rice, thick poha', '2022-06-22 23:00:00.000000', '2022-06-22 23:00:00.000000'),
(145, 'order-504abd13-9bf6-4f17-81a7-f957c22dddfb', '4', 3, 4, 2, 'served', 407, 'Coconut oil, cucumber, curd, curry leaves, mustard seeds', '2022-06-14 00:00:00.000000', '2022-06-14 00:00:00.000000'),
(146, 'order-504abd13-9bf6-4f17-81a7-f957c22dddfb', '4', 1, 3, 4, 'served', 968, 'Yogurt, ginger, curry leaves, baking soda, green chilli', '2022-06-22 01:00:00.000000', '2022-06-22 01:00:00.000000'),
(147, 'order-25465da8-ea21-4a78-a484-01a4f0cb6ff2', '4', 4, 3, 5, 'served', 63, 'Lentils, black pepper, vegetable oil', '2022-06-29 02:00:00.000000', '2022-06-29 02:00:00.000000'),
(148, 'order-b29fc147-122f-4642-b837-d10403f42588', '2', 1, 2, 4, 'served', 785, 'Raw rice, jaggery, milk', '2022-06-25 03:00:00.000000', '2022-06-25 03:00:00.000000'),
(149, 'order-b29fc147-122f-4642-b837-d10403f42588', '3', 5, 3, 5, 'served', 74, 'Rice, cashew nuts, milk, raisins, sugar', '2022-06-11 04:00:00.000000', '2022-06-11 04:00:00.000000'),
(150, 'order-b29fc147-122f-4642-b837-d10403f42588', '5', 2, 1, 4, 'served', 911, 'Arhar dal, sambar powder, tomato, curry leaves, fennel seeds', '2022-06-12 05:00:00.000000', '2022-06-12 05:00:00.000000'),
(151, 'order-b29fc147-122f-4642-b837-d10403f42588', '4', 3, 2, 3, 'served', 405, 'Green moong beans, rice flour', '2022-06-26 06:00:00.000000', '2022-06-26 06:00:00.000000'),
(152, 'order-b29fc147-122f-4642-b837-d10403f42588', '5', 1, 5, 2, 'served', 594, 'Chana dal, urad dal, beans, coconut, mustard', '2022-06-08 07:00:00.000000', '2022-06-08 07:00:00.000000'),
(153, 'order-b29fc147-122f-4642-b837-d10403f42588', '1', 4, 1, 5, 'served', 618, 'Urad dal, lemon, tamarind, cooked rice, curry leaves', '2022-06-24 08:00:00.000000', '2022-06-24 08:00:00.000000'),
(154, 'order-b405e0d6-f1e7-448d-bfa4-2f294bbdad8d', '5', 1, 2, 3, 'served', 804, 'Tomato, curry leaves, garlic, mustard seeds, hot water', '2022-06-11 09:00:00.000000', '2022-06-11 09:00:00.000000'),
(155, 'order-b405e0d6-f1e7-448d-bfa4-2f294bbdad8d', '2', 1, 4, 1, 'served', 366, 'Brown rice flour, sugar, grated coconut', '2022-06-14 10:00:00.000000', '2022-06-14 10:00:00.000000'),
(156, 'order-b405e0d6-f1e7-448d-bfa4-2f294bbdad8d', '2', 3, 1, 5, 'served', 772, 'Pigeon peas, eggplant, drumsticks, sambar powder, tamarind', '2022-06-22 11:00:00.000000', '2022-06-22 11:00:00.000000'),
(157, 'order-b405e0d6-f1e7-448d-bfa4-2f294bbdad8d', '4', 1, 5, 4, 'served', 596, 'Thin rice flakes, black sesame seeds, curry leaves', '2022-06-02 12:00:00.000000', '2022-06-02 12:00:00.000000'),
(158, 'order-b405e0d6-f1e7-448d-bfa4-2f294bbdad8d', '5', 2, 3, 4, 'served', 684, 'Sevai, parboiled rice, steamer', '2022-06-05 13:00:00.000000', '2022-06-05 13:00:00.000000'),
(159, 'order-46c0a11a-d3d0-4b04-8e3c-77b66bb96d97', '3', 4, 2, 1, 'served', 932, 'Urad dal, curd, sesame oil, ginger, curry leaves, mustard seeds', '2022-06-04 14:00:00.000000', '2022-06-04 14:00:00.000000'),
(160, 'order-46c0a11a-d3d0-4b04-8e3c-77b66bb96d97', '1', 4, 3, 3, 'served', 667, 'Coconut, whole red beans, masala, sesame oil, tamarind', '2022-06-19 15:00:00.000000', '2022-06-19 15:00:00.000000'),
(161, 'order-46c0a11a-d3d0-4b04-8e3c-77b66bb96d97', '5', 5, 5, 3, 'served', 345, 'Chana dal, urad dal, thick poha, tomato, butter', '2022-06-24 16:00:00.000000', '2022-06-24 16:00:00.000000'),
(162, 'order-46c0a11a-d3d0-4b04-8e3c-77b66bb96d97', '3', 5, 1, 4, 'served', 604, 'Urad dal, ginger, curry leaves, green chilies, black pepper', '2022-06-27 17:00:00.000000', '2022-06-27 17:00:00.000000'),
(163, 'order-46c0a11a-d3d0-4b04-8e3c-77b66bb96d97', '5', 5, 5, 3, 'served', 821, 'Meat curry powder, chicken chunks, ginger, tomato, cinnamon', '2022-06-07 18:00:00.000000', '2022-06-07 18:00:00.000000'),
(164, 'order-93904d9d-79b8-47d9-844e-af5379dc5b06', '4', 5, 1, 4, 'served', 52, 'Chana dal, urad dal, ginger, curry leaves, sugar', '2022-06-05 19:00:00.000000', '2022-06-05 19:00:00.000000'),
(165, 'order-93904d9d-79b8-47d9-844e-af5379dc5b06', '1', 3, 3, 2, 'served', 859, 'Kala masala, arhar dal, curry leaves, mustard seeds, hot water', '2022-06-01 20:00:00.000000', '2022-06-01 20:00:00.000000'),
(166, 'order-93904d9d-79b8-47d9-844e-af5379dc5b06', '4', 2, 4, 4, 'served', 484, 'Gram flour, mustard, garlic, turmeric, red chilli', '2022-06-04 21:00:00.000000', '2022-06-04 21:00:00.000000'),
(167, 'order-27124242-90a6-4405-94c0-5cd039eddd70', '4', 4, 2, 5, 'served', 370, 'Baingan, fish, coconut oil, fresh coconut, ginger', '2022-06-16 22:00:00.000000', '2022-06-16 22:00:00.000000'),
(168, 'order-8a7f11f0-6324-495c-ba20-27b9f946b557', '4', 4, 4, 4, 'served', 145, 'Urad dal, potatoes, wheat flour, sooji', '2022-06-21 23:00:00.000000', '2022-06-21 23:00:00.000000'),
(169, 'order-f0ee5b9e-8361-4e08-8835-591966dfc385', '4', 2, 3, 5, 'served', 223, 'Wheat flour, pearl millet flour, hot water', '2022-06-27 00:00:00.000000', '2022-06-27 00:00:00.000000'),
(170, 'order-843918ff-aca5-44dc-87c4-75b09b3e32bc', '3', 5, 1, 5, 'served', 428, 'Condensed milk, mawa, desiccated coconut, almonds, cashews', '2022-06-20 01:00:00.000000', '2022-06-20 01:00:00.000000'),
(171, 'order-843918ff-aca5-44dc-87c4-75b09b3e32bc', '2', 5, 4, 2, 'served', 610, 'Jowar flour, sesame seeds', '2022-06-14 02:00:00.000000', '2022-06-14 02:00:00.000000'),
(172, 'order-843918ff-aca5-44dc-87c4-75b09b3e32bc', '4', 5, 3, 2, 'served', 768, 'Bombay duck, malvani masala, rice flour, bombay rava, green chilies', '2022-06-05 03:00:00.000000', '2022-06-05 03:00:00.000000'),
(173, 'order-843918ff-aca5-44dc-87c4-75b09b3e32bc', '3', 1, 3, 3, 'served', 622, 'Rice flour, sesame, plain flour, turmeric, red chilli', '2022-06-15 04:00:00.000000', '2022-06-15 04:00:00.000000'),
(174, 'order-843918ff-aca5-44dc-87c4-75b09b3e32bc', '1', 5, 1, 1, 'placed', 102, 'Citric acid, fry, raisins, sugar, chana daal', '2022-06-20 05:00:00.000000', '2022-06-20 05:00:00.000000'),
(175, 'order-fc8acef8-6e48-4344-bd94-0c2976c702af', '5', 2, 2, 3, 'placed', 192, 'Urad dal, bengal gram flour, dried mango, baking soda, black salt', '2022-06-04 06:00:00.000000', '2022-06-04 06:00:00.000000'),
(176, 'order-f53e9160-5005-4f98-917e-a79129131886', '3', 4, 3, 5, 'placed', 237, 'Condensed milk, nestle cream, coconut ice, red food coloring, desiccated coconut', '2022-06-10 07:00:00.000000', '2022-06-10 07:00:00.000000'),
(177, 'order-23550aa9-57f6-4b14-bbe6-adc43bb202e0', '2', 3, 5, 3, 'placed', 721, 'Whole wheat flour, dal, kokum, gur, bengal gram flour', '2022-06-27 08:00:00.000000', '2022-06-27 08:00:00.000000'),
(178, 'order-23550aa9-57f6-4b14-bbe6-adc43bb202e0', '1', 2, 5, 5, 'placed', 212, 'Pav, aloo, peanut, pomegranate, star anise', '2022-06-03 09:00:00.000000', '2022-06-03 09:00:00.000000'),
(179, 'order-23550aa9-57f6-4b14-bbe6-adc43bb202e0', '5', 2, 1, 4, 'placed', 489, 'Urad dal, bhuna chana, garam masala, dates, tamarind', '2022-06-19 10:00:00.000000', '2022-06-19 10:00:00.000000'),
(180, 'order-7c86869b-d1f7-4f3b-9126-36070291736b', '5', 4, 5, 4, 'placed', 314, 'Arhar dal, coconut oil, curry leaves, mustard seeds, red chilli', '2022-06-21 11:00:00.000000', '2022-06-21 11:00:00.000000'),
(181, 'order-7c86869b-d1f7-4f3b-9126-36070291736b', '2', 4, 2, 3, 'placed', 69, 'Rava, coconut, gram flour, mustard, sesame', '2022-06-21 12:00:00.000000', '2022-06-21 12:00:00.000000'),
(182, 'order-7c86869b-d1f7-4f3b-9126-36070291736b', '2', 2, 2, 5, 'placed', 234, 'Bottle gourd, green, raisins, sugar, clarified butter', '2022-06-23 13:00:00.000000', '2022-06-23 13:00:00.000000'),
(183, 'order-7c86869b-d1f7-4f3b-9126-36070291736b', '5', 2, 3, 5, 'placed', 983, 'Yogurt, besan, sauce, garam masala powder, gram flour', '2022-06-20 14:00:00.000000', '2022-06-20 14:00:00.000000'),
(184, 'order-7c86869b-d1f7-4f3b-9126-36070291736b', '1', 1, 5, 3, 'placed', 519, 'Wheat flour, jaggery, clarified butter, sliced almonds', '2022-06-23 15:00:00.000000', '2022-06-23 15:00:00.000000'),
(185, 'order-052ac875-e61c-4cff-af92-fb2759b82bc7', '4', 1, 3, 1, 'placed', 695, 'Dry fruits, semolina, all purpose flour', '2022-06-19 16:00:00.000000', '2022-06-19 16:00:00.000000'),
(186, 'order-052ac875-e61c-4cff-af92-fb2759b82bc7', '1', 5, 3, 4, 'placed', 500, 'Bottle gourd, chana dal, cabbage, urad dal, toor dal', '2022-06-28 17:00:00.000000', '2022-06-28 17:00:00.000000'),
(187, 'order-052ac875-e61c-4cff-af92-fb2759b82bc7', '4', 1, 2, 1, 'placed', 890, 'Whole wheat rava, chia seed, lemon, edible gum, litre milk', '2022-06-12 18:00:00.000000', '2022-06-12 18:00:00.000000'),
(188, 'order-052ac875-e61c-4cff-af92-fb2759b82bc7', '3', 2, 5, 3, 'placed', 915, 'Green chilies, lemon juice, chili powder, boiled potatoes', '2022-06-10 19:00:00.000000', '2022-06-10 19:00:00.000000'),
(189, 'order-052ac875-e61c-4cff-af92-fb2759b82bc7', '5', 5, 4, 2, 'placed', 671, 'Wheat flour, cashews, rapeseed oil', '2022-06-05 20:00:00.000000', '2022-06-05 20:00:00.000000'),
(190, 'order-a90cdac0-73e5-4e34-811a-fad85ec10995', '1', 4, 4, 5, 'placed', 361, 'Mango, sugar', '2022-06-18 21:00:00.000000', '2022-06-18 21:00:00.000000'),
(191, 'order-aa1da236-115b-4eca-8be0-22139a6259f4', '5', 2, 4, 5, 'placed', 86, 'Whole wheat flour, low fat, bengal gram flour', '2022-06-24 22:00:00.000000', '2022-06-24 22:00:00.000000'),
(192, 'order-aa1da236-115b-4eca-8be0-22139a6259f4', '1', 2, 4, 2, 'placed', 256, 'Green chili paste, white sesame seeds, gram flour, curry leaves, green chili', '2022-06-07 23:00:00.000000', '2022-06-07 23:00:00.000000'),
(193, 'order-aa1da236-115b-4eca-8be0-22139a6259f4', '1', 4, 2, 5, 'placed', 971, 'Rice flour, urad dal, wheat flour, gram flour, turmeric', '2022-05-31 00:00:00.000000', '2022-05-31 00:00:00.000000'),
(194, 'order-aa1da236-115b-4eca-8be0-22139a6259f4', '5', 3, 1, 1, 'placed', 1000, 'Cinnamon, jaggery, clarified butter, dry roasted', '2022-05-31 01:00:00.000000', '2022-05-31 01:00:00.000000'),
(195, 'order-aa1da236-115b-4eca-8be0-22139a6259f4', '4', 2, 5, 4, 'placed', 126, 'Cucumber, carrot, tomatoes, cilantro', '2022-06-02 02:00:00.000000', '2022-06-02 02:00:00.000000'),
(196, 'order-aa1da236-115b-4eca-8be0-22139a6259f4', '2', 4, 5, 3, 'placed', 762, 'Rava, gram flour, lemon juice, turmeric, fenugreek leaves', '2022-06-09 03:00:00.000000', '2022-06-09 03:00:00.000000'),
(197, 'order-c554962c-90cf-4a74-b90d-1d21adc61fed', '4', 1, 4, 5, 'placed', 995, 'Rose water, pistachio, badam, bengal gram flour, saffron', '2022-06-20 04:00:00.000000', '2022-06-20 04:00:00.000000'),
(198, 'order-c554962c-90cf-4a74-b90d-1d21adc61fed', '3', 3, 3, 2, 'placed', 358, 'Bottle gourd, whole wheat flour, rava, sesame seeds, bengal gram flour', '2022-06-25 05:00:00.000000', '2022-06-25 05:00:00.000000'),
(199, 'order-c554962c-90cf-4a74-b90d-1d21adc61fed', '4', 3, 2, 3, 'placed', 918, 'Arbi ke patte, sesame seeds, gur, bengal gram flour, imli', '2022-05-31 06:00:00.000000', '2022-05-31 06:00:00.000000'),
(200, 'order-c554962c-90cf-4a74-b90d-1d21adc61fed', '3', 4, 1, 5, 'placed', 546, 'Pav bhaji masala, gobi, potatoes, green peas, dinner rolls', '2022-06-27 07:00:00.000000', '2022-06-27 07:00:00.000000'),
(201, 'order-c554962c-90cf-4a74-b90d-1d21adc61fed', '1', 4, 5, 1, 'placed', 448, 'Aloo, urad dal, mustard, ginger, curry leaves', '2022-06-16 08:00:00.000000', '2022-06-16 08:00:00.000000'),
(202, 'order-2dfaafc1-710f-4413-ab35-b848b3610f14', '3', 2, 4, 3, 'placed', 767, 'Raw peanuts, sabudana, lemon, avocado oil, curry leaves, green chili', '2022-06-19 09:00:00.000000', '2022-06-19 09:00:00.000000'),
(203, 'order-2dfaafc1-710f-4413-ab35-b848b3610f14', '1', 2, 4, 2, 'placed', 685, 'Khaman, pomegranate, sev, powdered sugar, garlic', '2022-06-20 10:00:00.000000', '2022-06-20 10:00:00.000000'),
(204, 'order-2dfaafc1-710f-4413-ab35-b848b3610f14', '3', 3, 5, 1, 'placed', 79, 'Sev, ginger, tomato, sugar', '2022-06-22 11:00:00.000000', '2022-06-22 11:00:00.000000'),
(205, 'order-2dfaafc1-710f-4413-ab35-b848b3610f14', '1', 2, 1, 1, 'placed', 729, 'Wheat flour, baking soda, all purpose flour, black pepper, sunflower oil', '2022-06-05 12:00:00.000000', '2022-06-05 12:00:00.000000'),
(206, 'order-2dfaafc1-710f-4413-ab35-b848b3610f14', '5', 3, 4, 5, 'placed', 257, 'Whole wheat flour, gur, clarified butter', '2022-06-07 13:00:00.000000', '2022-06-07 13:00:00.000000'),
(207, 'order-978a7012-1d50-4b44-b344-a27fda00aefb', '4', 1, 5, 2, 'placed', 236, 'Rice flakes, yogurt, raw rice, jaggery, grated coconut', '2022-06-26 14:00:00.000000', '2022-06-26 14:00:00.000000'),
(208, 'order-60e75f84-551e-420c-b0d2-3541cb5bc7ab', '5', 3, 1, 4, 'placed', 819, 'Whole wheat flour, rice flour, pearl millet flour, sorghum flour, sesame seeds', '2022-06-02 15:00:00.000000', '2022-06-02 15:00:00.000000'),
(209, 'order-87043a00-38d0-406b-8287-22c67c6750dd', '3', 1, 4, 2, 'placed', 976, 'Sweet potato, surti papdi, baby potatoes, valor papdi, green peas', '2022-06-27 16:00:00.000000', '2022-06-27 16:00:00.000000'),
(210, 'order-87043a00-38d0-406b-8287-22c67c6750dd', '1', 4, 1, 5, 'placed', 249, 'Gobi, potato, beans, khus khus, coconut', '2022-06-26 17:00:00.000000', '2022-06-26 17:00:00.000000'),
(211, 'order-87043a00-38d0-406b-8287-22c67c6750dd', '1', 3, 2, 4, 'placed', 473, 'Chicken, coconut oil, wine vinegar, ginger, green, cinnamon', '2022-06-08 18:00:00.000000', '2022-06-08 18:00:00.000000'),
(212, 'order-bab7ed4c-1217-4cc6-895b-4c062e7b80e1', '1', 4, 1, 3, 'placed', 530, 'Green garlic chutney, fresh green peas, ginger, lemon juice, plain flour', '2022-06-03 19:00:00.000000', '2022-06-03 19:00:00.000000'),
(213, 'order-bab7ed4c-1217-4cc6-895b-4c062e7b80e1', '1', 5, 3, 2, 'placed', 793, 'Moong beans, jaggery, red chillies, oil, salt', '2022-06-16 20:00:00.000000', '2022-06-16 20:00:00.000000'),
(214, 'order-bab7ed4c-1217-4cc6-895b-4c062e7b80e1', '1', 1, 1, 4, 'placed', 421, 'Rice flour, sesame seeds, baking soda, peanut oil', '2022-06-05 21:00:00.000000', '2022-06-05 21:00:00.000000'),
(215, 'order-bab7ed4c-1217-4cc6-895b-4c062e7b80e1', '1', 3, 5, 2, 'placed', 686, 'Chickpea flour, methi leaves, jowar flour, wheat flour', '2022-06-22 22:00:00.000000', '2022-06-22 22:00:00.000000'),
(216, 'order-bab7ed4c-1217-4cc6-895b-4c062e7b80e1', '5', 1, 5, 1, 'placed', 581, 'Semolina, clarified butter, oil, white flour, black pepper', '2022-06-19 23:00:00.000000', '2022-06-19 23:00:00.000000'),
(217, 'order-bab7ed4c-1217-4cc6-895b-4c062e7b80e1', '1', 3, 1, 4, 'placed', 430, 'Yogurt, fresh coconut, sesame seeds, semolina, gram flour', '2022-06-04 00:00:00.000000', '2022-06-04 00:00:00.000000'),
(218, 'order-bc14806d-13c3-43df-8621-0160c1959f84', '4', 5, 4, 2, 'placed', 933, 'Ridge gourd, baking soda, sugar, grated coconut, peas', '2022-06-12 01:00:00.000000', '2022-06-12 01:00:00.000000'),
(219, 'order-c8f416b7-da43-4a12-b06a-0c2c237193f9', '1', 2, 4, 1, 'placed', 294, 'Whole wheat flour, khus khus, sesame seeds, dry coconut, gur', '2022-06-06 02:00:00.000000', '2022-06-06 02:00:00.000000'),
(220, 'order-c8f416b7-da43-4a12-b06a-0c2c237193f9', '5', 5, 3, 5, 'cancelled', 418, 'Rice, mango, curd', '2022-06-12 03:00:00.000000', '2022-06-12 03:00:00.000000'),
(221, 'order-c8f416b7-da43-4a12-b06a-0c2c237193f9', '2', 2, 1, 1, 'cancelled', 922, 'Sticky rice, rice flour, jaggery, orange rind', '2022-06-08 04:00:00.000000', '2022-06-08 04:00:00.000000'),
(222, 'order-c8f416b7-da43-4a12-b06a-0c2c237193f9', '5', 3, 5, 4, 'cancelled', 834, 'Raw papaya, panch phoran masala, nigella seeds, mustard oil, fennel seeds', '2022-06-09 05:00:00.000000', '2022-06-09 05:00:00.000000'),
(223, 'order-c8f416b7-da43-4a12-b06a-0c2c237193f9', '2', 4, 4, 1, 'cancelled', 182, 'Rice, eggs, carrot, beetroot', '2022-06-18 06:00:00.000000', '2022-06-18 06:00:00.000000'),
(224, 'order-838c6496-cba1-4655-be68-7258c998431e', '4', 4, 3, 3, 'cancelled', 384, 'Maida, vegetable oil', '2022-06-28 07:00:00.000000', '2022-06-28 07:00:00.000000'),
(225, 'order-838c6496-cba1-4655-be68-7258c998431e', '3', 4, 1, 4, 'cancelled', 205, 'Potatoes, mustard oil, fish, green chillies', '2022-06-22 08:00:00.000000', '2022-06-22 08:00:00.000000'),
(226, 'order-838c6496-cba1-4655-be68-7258c998431e', '3', 1, 4, 1, 'cancelled', 437, 'Ridge gourd, fish, lemon, tomatoes, mustard oil', '2022-06-24 09:00:00.000000', '2022-06-24 09:00:00.000000'),
(227, 'order-838c6496-cba1-4655-be68-7258c998431e', '2', 5, 3, 1, 'cancelled', 158, 'Brinjal, onions, salt, sesame seeds, coriander', '2022-06-15 10:00:00.000000', '2022-06-15 10:00:00.000000'),
(228, 'order-838c6496-cba1-4655-be68-7258c998431e', '1', 1, 5, 1, 'cancelled', 710, 'Potatoes, garam masala, tomatoes, mustard oil, bay leaf', '2022-06-13 11:00:00.000000', '2022-06-13 11:00:00.000000'),
(229, 'order-838c6496-cba1-4655-be68-7258c998431e', '2', 3, 2, 3, 'cancelled', 170, 'Forbidden black rice, chicken, olive oil, slivered almonds, garlic powder', '2022-06-29 12:00:00.000000', '2022-06-29 12:00:00.000000'),
(230, 'order-5a370a20-4c4a-48df-bcbc-0ac69f80db3a', '4', 2, 3, 1, 'cancelled', 331, 'Biryani masala, mixed vegetables, yellow moong daal, whole red, mustard seeds', '2022-06-20 13:00:00.000000', '2022-06-20 13:00:00.000000'),
(231, 'order-5a370a20-4c4a-48df-bcbc-0ac69f80db3a', '5', 3, 1, 4, 'cancelled', 224, 'Brown rice, soy sauce, olive oil', '2022-06-12 14:00:00.000000', '2022-06-12 14:00:00.000000'),
(232, 'order-5a370a20-4c4a-48df-bcbc-0ac69f80db3a', '5', 2, 5, 2, 'cancelled', 86, 'Coconut milk, lobster, fresh green chilli, ginger, red onion', '2022-06-22 15:00:00.000000', '2022-06-22 15:00:00.000000'),
(233, 'order-5a370a20-4c4a-48df-bcbc-0ac69f80db3a', '1', 5, 1, 5, 'cancelled', 384, 'Baking soda, clarified butter, oil, all purpose flour', '2022-06-27 16:00:00.000000', '2022-06-27 16:00:00.000000'),
(234, 'order-5a370a20-4c4a-48df-bcbc-0ac69f80db3a', '1', 1, 3, 3, 'cancelled', 191, 'Jaggery, raisins', '2022-06-02 17:00:00.000000', '2022-06-02 17:00:00.000000'),
(235, 'order-5a370a20-4c4a-48df-bcbc-0ac69f80db3a', '5', 3, 4, 4, 'cancelled', 945, 'Lamb, garam masala powder, curd, turmeric, bay leaf', '2022-06-30 18:00:00.000000', '2022-06-30 18:00:00.000000'),
(236, 'order-ef145c79-17ff-4dae-a1e6-0c4ed16de06c', '4', 2, 2, 1, 'cancelled', 86, 'Coconut, prawns, curd, mustard seed, green chili', '2022-06-03 19:00:00.000000', '2022-06-03 19:00:00.000000'),
(237, 'order-ef145c79-17ff-4dae-a1e6-0c4ed16de06c', '4', 4, 5, 2, 'cancelled', 306, 'Fish fillet, besan, lemon, mint, ginger', '2022-06-10 20:00:00.000000', '2022-06-10 20:00:00.000000'),
(238, 'order-ef145c79-17ff-4dae-a1e6-0c4ed16de06c', '3', 5, 3, 4, 'cancelled', 654, 'Fermented bamboo shoot, potato, ginger, green, mustard oil', '2022-06-23 21:00:00.000000', '2022-06-23 21:00:00.000000'),
(239, 'order-ef145c79-17ff-4dae-a1e6-0c4ed16de06c', '4', 1, 3, 5, 'cancelled', 369, 'Banana flower, chicken, green chili, mustard oil, lemon juice', '2022-06-20 22:00:00.000000', '2022-06-20 22:00:00.000000'),
(240, 'order-ef145c79-17ff-4dae-a1e6-0c4ed16de06c', '5', 5, 3, 4, 'cancelled', 269, 'Aloo, tomatoes, mustard oil, bay leaf, cinnamon stick', '2022-06-05 23:00:00.000000', '2022-06-05 23:00:00.000000'),
(241, 'order-373f5477-c268-4750-b4a9-9b9d87062616', '5', 1, 3, 1, 'cancelled', 723, 'Rice flour, mutton, banana, gram flour, olive oil, baking powder', '2022-06-28 00:00:00.000000', '2022-06-28 00:00:00.000000'),
(242, 'order-373f5477-c268-4750-b4a9-9b9d87062616', '5', 5, 3, 3, 'cancelled', 255, 'Fish roe, pumpkin flowers, mustard oil, turmeric, tomato', '2022-06-14 01:00:00.000000', '2022-06-14 01:00:00.000000'),
(243, 'order-373f5477-c268-4750-b4a9-9b9d87062616', '5', 4, 3, 4, 'cancelled', 680, 'Chana dal, fresh coconut, ginger, cinnamon, raisins', '2022-06-27 02:00:00.000000', '2022-06-27 02:00:00.000000'),
(244, 'order-373f5477-c268-4750-b4a9-9b9d87062616', '3', 1, 1, 1, 'cancelled', 223, 'Curd, cooked rice, curry leaves, dry chilli', '2022-06-17 03:00:00.000000', '2022-06-17 03:00:00.000000'),
(245, 'order-373f5477-c268-4750-b4a9-9b9d87062616', '5', 5, 1, 4, 'cancelled', 903, 'Tea leaves, white sesame seeds, dry coconut, soaked rice', '2022-06-24 04:00:00.000000', '2022-06-24 04:00:00.000000'),
(246, 'order-373f5477-c268-4750-b4a9-9b9d87062616', '5', 1, 2, 4, 'cancelled', 474, 'Basmati rice, rose water, sugar, clarified butter, cardamom pods', '2022-06-04 05:00:00.000000', '2022-06-04 05:00:00.000000'),
(247, 'order-2f53a212-41c0-4774-9f42-fa1c8a96d030', '3', 4, 4, 4, 'cancelled', 543, 'Coconut milk, prawns, garlic, turmeric, sugar', '2022-06-25 06:00:00.000000', '2022-06-25 06:00:00.000000'),
(248, 'order-2f53a212-41c0-4774-9f42-fa1c8a96d030', '2', 3, 4, 1, 'cancelled', 594, 'Red pepper, red onion, butter, watercress, olive oil', '2022-06-13 07:00:00.000000', '2022-06-13 07:00:00.000000'),
(249, 'order-2f53a212-41c0-4774-9f42-fa1c8a96d030', '4', 2, 3, 5, 'cancelled', 172, 'Green beans, bitter gourd, ridge gourd, banana, brinjal', '2022-06-23 08:00:00.000000', '2022-06-23 08:00:00.000000'),
(250, 'order-c93bcd96-cd3d-4cbb-a4df-0da61e808933', '2', 1, 5, 2, 'cancelled', 777, 'Green beans, bitter gourd, ridge gourd, banana, brinjal', '2022-06-04 00:00:00.000000', '2022-06-04 00:00:00.000000'),
(251, 'order-46b09b5e-d617-11ed-b13b-67c1cdeef9c6', '1', 2, 1, 1, 'placed', 250, NULL, '2023-04-08 14:11:51.416268', '2023-04-08 14:11:51.416288');

-- --------------------------------------------------------

--
-- Table structure for table `core_hotelowner`
--

CREATE TABLE `core_hotelowner` (
  `id` bigint(20) NOT NULL,
  `name` varchar(70) NOT NULL,
  `hotel_name` varchar(70) NOT NULL,
  `email` varchar(70) NOT NULL,
  `password` varchar(70) NOT NULL,
  `created_at` datetime(6) DEFAULT NULL,
  `updated_at` datetime(6) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `core_hoteltable`
--

CREATE TABLE `core_hoteltable` (
  `id` bigint(20) NOT NULL,
  `table_name` varchar(70) NOT NULL,
  `description` varchar(225) DEFAULT NULL,
  `hotel_id` int(11) NOT NULL,
  `status` int(11) DEFAULT NULL,
  `created_at` datetime(6) DEFAULT NULL,
  `updated_at` datetime(6) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `core_hoteltable`
--

INSERT INTO `core_hoteltable` (`id`, `table_name`, `description`, `hotel_id`, `status`, `created_at`, `updated_at`) VALUES
(1, 'Table #1', '1706 Sheepshead Bay Rd, Brooklyn, NY', 1, 1, '2022-06-04 08:09:01.000000', '2021-03-20 08:09:01.000000'),
(2, 'Table #2', '55 East 54th Street, Manhattan, NY', 1, 1, '2022-05-17 10:32:50.000000', '2021-01-28 10:32:50.000000'),
(3, 'Table #3', '30 West 26th, Manhattan, NY', 1, 1, '2022-04-04 06:11:34.000000', '2021-07-06 06:11:34.000000'),
(4, 'Table #4', '360 3rd Ave, Manhattan, NY', 1, 1, '2022-10-07 10:02:22.000000', '2022-06-11 10:02:22.000000'),
(5, 'Table #5', '64 Lafayette AVe, Brooklyn, NY', 1, 1, '2022-12-25 01:19:33.000000', '2021-08-04 01:19:33.000000'),
(6, 'Table #6', '579 Myrtle Avenue, Brooklyn, NY', 1, 1, '2022-01-06 07:12:56.000000', '2022-12-17 07:12:56.000000'),
(7, 'Table #7', '247-77 Jamaica Avenue, Queens, NY', 1, 1, '2022-09-06 03:33:39.000000', '2022-08-12 03:33:39.000000'),
(8, 'Table #8', '382-384 forest ave, Staten Island, NY', 1, 1, '2022-01-05 22:31:04.000000', '2022-03-07 22:31:04.000000'),
(9, 'Table #9', '1045 flushing avenue, Brooklyn, NY', 1, 1, '2022-10-13 15:34:27.000000', '2022-05-03 15:34:27.000000'),
(10, 'Table #10', '98-05 101 ave , Queens, NY', 1, 1, '2021-06-22 15:02:47.000000', '2022-08-13 15:02:47.000000'),
(11, 'Table #11', '7517 -19 amboy roaf, Staten Island, NY', 2, 1, '2021-01-24 16:14:05.000000', '2022-08-10 16:14:05.000000'),
(12, 'Table #12', '157 Duane St., Manhattan, NY', 2, 1, '2021-09-21 13:23:03.000000', '2021-08-24 13:23:03.000000'),
(13, 'Table #13', '34-10 30th Ave, Queens, NY', 2, 1, '2022-11-05 17:49:14.000000', '2022-03-11 17:49:14.000000'),
(14, 'Table #14', '517 Court Street, Brooklyn, NY', 2, 1, '2021-02-13 19:33:42.000000', '2021-03-05 19:33:42.000000'),
(15, 'Table #15', '168 5th Avenue, Brooklyn, NY', 2, 1, '2021-08-23 00:06:01.000000', '2021-12-24 00:06:01.000000'),
(16, 'Table #16', '51-53 Christopher, Manhattan, NY', 2, 1, '2021-05-23 19:02:25.000000', '2022-03-05 19:02:25.000000'),
(17, 'Table #17', '133 Mulberry Street, Manhattan, NY', 2, 1, '2022-07-07 14:35:13.000000', '2022-12-30 14:35:13.000000'),
(18, 'Table #18', '3501 Ditmara, Queens, NY', 2, 1, '2022-01-06 12:37:03.000000', '2022-10-01 12:37:03.000000'),
(19, 'Table #19', '10018 4TH AVENUE, Brooklyn, NY', 2, 1, '2022-02-01 01:08:52.000000', '2021-08-03 01:08:52.000000'),
(20, 'Table #20', '790 Grand Street, Brooklyn, NY', 2, 1, '2021-06-29 13:10:02.000000', '2021-09-09 13:10:02.000000'),
(21, 'Table #21', '3401 30th ave, Queens, NY', 2, 1, '2022-08-07 02:45:27.000000', '2021-02-18 02:45:27.000000'),
(22, 'Table #22', '103 Waverly Place, Manhattan, NY', 2, 1, '2022-10-26 11:34:35.000000', '2021-10-01 11:34:35.000000'),
(23, 'Table #23', '7222 Main Street, Queens, NY', 2, 1, '2021-07-14 17:04:24.000000', '2022-09-29 17:04:24.000000'),
(24, 'Table #24', '138 Smith Street, Brooklyn, NY', 2, 1, '2022-10-28 19:43:39.000000', '2021-03-01 19:43:39.000000'),
(25, 'Table #25', '246 West 4th Street, Manhattan, NY', 2, 1, '2022-12-29 23:33:22.000000', '2022-10-25 23:33:22.000000'),
(26, 'Table #26', '196 Elizabeth Street, Manhattan, NY', 2, 1, '2021-05-03 06:30:34.000000', '2021-01-04 06:30:34.000000'),
(27, 'Table #27', '949 Columbus avenue, Manhattan, NY', 2, 1, '2021-06-07 09:16:26.000000', '2022-12-17 09:16:26.000000'),
(28, 'Table #28', '70 West 36th , Manhattan, NY', 2, 1, '2022-06-05 21:49:13.000000', '2022-09-08 21:49:13.000000'),
(29, 'Table #29', '507 Columbus Ave, Manhattan, NY', 2, 1, '2022-04-21 21:59:27.000000', '2021-09-25 21:59:27.000000'),
(30, 'Table #30', '4701 111th Street, Queens, NY', 2, 1, '2021-04-28 18:14:28.000000', '2021-07-21 18:14:28.000000'),
(31, 'Table #31', '336 State Street, Brooklyn, NY', 3, 1, '2021-11-28 19:18:47.000000', '2021-12-29 19:18:47.000000'),
(32, 'Table #32', '36-20 ditmars blvd, Queens, NY', 3, 1, '2021-10-10 14:24:11.000000', '2022-11-14 14:24:11.000000'),
(33, 'Table #33', '204 Grand street, Brooklyn, NY', 3, 1, '2021-09-14 14:50:18.000000', '2021-08-09 14:50:18.000000'),
(34, 'Table #34', '446C Dean Street , Brooklyn, NY', 3, 1, '2022-11-30 21:03:24.000000', '2022-06-21 21:03:24.000000'),
(35, 'Table #35', '168 Driggs ave, Brooklyn, NY', 3, 1, '2022-05-09 07:01:56.000000', '2021-06-17 07:01:56.000000'),
(36, 'Table #36', '37B West 26th St., Manhattan, NY', 3, 1, '2022-02-22 08:07:53.000000', '2022-08-07 08:07:53.000000'),
(37, 'Table #37', '1343 2nd Avenue , Manhattan, NY', 3, 1, '2021-03-24 15:55:46.000000', '2021-02-08 15:55:46.000000'),
(38, 'Table #38', '7414 5th Ave, Brooklyn, NY', 3, 1, '2021-04-17 06:06:23.000000', '2021-10-26 06:06:23.000000'),
(39, 'Table #39', '1118 Cortelyou Road, Brooklyn, NY', 3, 1, '2022-02-28 15:43:48.000000', '2022-08-11 15:43:48.000000'),
(40, 'Table #40', '206 Spring st, Manhattan, NY', 3, 1, '2022-09-28 04:18:50.000000', '2021-11-05 04:18:50.000000'),
(41, 'Table #41', '168 West 4th Street, Manhattan, NY', 3, 1, '2021-05-19 16:57:22.000000', '2022-03-03 16:57:22.000000'),
(42, 'Table #42', '132 West 58th, Manhattan, NY', 3, 1, '2021-05-11 22:38:17.000000', '2022-09-22 22:38:17.000000'),
(43, 'Table #43', '733 Fulton Street, Brooklyn, NY', 3, 1, '2022-01-06 00:56:56.000000', '2021-11-25 00:56:56.000000'),
(44, 'Table #44', '947 Columbus avenue, Manhattan, NY', 3, 1, '2022-07-24 02:38:41.000000', '2022-01-24 02:38:41.000000'),
(45, 'Table #45', '3401 30th ave, Queens, NY', 3, 1, '2021-01-26 10:03:32.000000', '2022-07-03 10:03:32.000000'),
(46, 'Table #46', '1 John St, Brooklyn, NY', 3, 1, '2022-07-19 22:38:20.000000', '2022-06-11 22:38:20.000000'),
(47, 'Table #47', '33-15 33-15 Ditmars Boulevard, Queens, NY', 3, 1, '2021-01-15 21:18:48.000000', '2021-09-12 21:18:48.000000'),
(48, 'Table #48', '13 Doyers Street, Manhattan, NY', 3, 1, '2021-10-04 08:57:49.000000', '2021-10-18 08:57:49.000000'),
(49, 'Table #49', '1372 Broadway, Manhattan, NY', 3, 1, '2022-03-26 22:54:18.000000', '2021-06-21 22:54:18.000000'),
(50, 'Table #50', '129-131 MacDougal, Manhattan, NY', 3, 1, '2021-07-29 21:19:15.000000', '2022-11-23 21:19:15.000000'),
(51, 'Table #51', '406 Prospect Place, Brooklyn, NY', 3, 1, '2021-10-30 18:52:03.000000', '2021-01-13 18:52:03.000000'),
(52, 'Table #52', '43 East 7th St, Manhattan, NY', 3, 1, '2021-10-23 16:30:57.000000', '2021-02-18 16:30:57.000000'),
(53, 'Table #53', '14 Bedford Avenue, Brooklyn, NY', 3, 1, '2022-01-21 16:43:30.000000', '2022-06-01 16:43:30.000000'),
(54, 'Table #54', '558 BROADWAY, Manhattan, NY', 3, 1, '2022-01-22 09:38:09.000000', '2021-05-18 09:38:09.000000'),
(55, 'Table #55', '917 Manor Road, Staten Island, NY', 3, 1, '2022-10-19 16:21:52.000000', '2022-04-01 16:21:52.000000'),
(56, 'Table #56', '628 10th Avenue, Manhattan, NY', 3, 1, '2021-09-02 14:18:42.000000', '2022-11-09 14:18:42.000000'),
(57, 'Table #57', '9402 4th Avenue , Brooklyn, NY', 3, 1, '2021-03-27 08:56:48.000000', '2022-08-10 08:56:48.000000'),
(58, 'Table #58', '168 West 4th street, Manhattan, NY', 3, 1, '2022-12-24 02:07:25.000000', '2021-06-25 02:07:25.000000'),
(59, 'Table #59', '1765 Crosby Avenue , Bronx, NY', 3, 1, '2022-11-05 22:38:58.000000', '2021-12-10 22:38:58.000000'),
(60, 'Table #60', '136-138 West Fordham Rd , Bronx, NY', 3, 1, '2021-02-01 22:17:33.000000', '2021-05-16 22:17:33.000000'),
(61, 'Table #61', '7205 Austin Street , Queens, NY', 3, 1, '2022-08-13 03:20:53.000000', '2022-11-21 03:20:53.000000'),
(62, 'Table #62', '3401 30th ave, Queens, NY', 3, 1, '2021-03-08 00:09:05.000000', '2022-07-28 00:09:05.000000'),
(63, 'Table #63', '511 Amsterdam Ave, Manhattan, NY', 3, 1, '2022-09-20 08:39:02.000000', '2022-02-14 08:39:02.000000'),
(64, 'Table #64', '525 Grand st, Brooklyn, NY', 3, 1, '2022-12-13 22:29:37.000000', '2021-06-28 22:29:37.000000'),
(65, 'Table #65', '40-02 Bell BLVD , Queens, NY', 3, 1, '2021-11-27 06:36:19.000000', '2022-12-13 06:36:19.000000'),
(66, 'Table #66', '85 2nd AVENUE, Manhattan, NY', 3, 1, '2022-05-14 21:21:31.000000', '2022-06-15 21:21:31.000000'),
(67, 'Table #67', '46 west 46th street, Manhattan, NY', 3, 1, '2021-01-04 02:28:42.000000', '2021-11-09 02:28:42.000000'),
(68, 'Table #68', '6819 3rd Ave, Brooklyn, NY', 3, 1, '2022-11-11 05:39:30.000000', '2022-02-14 05:39:30.000000'),
(69, 'Table #69', '577 Lorimer Street, Brooklyn, NY', 3, 1, '2021-04-06 20:32:09.000000', '2021-03-11 20:32:09.000000'),
(70, 'Table #70', '29-10 Broadway, Queens, NY', 3, 1, '2021-03-02 13:53:29.000000', '2022-06-27 13:53:29.000000'),
(71, 'Table #71', '654 Amsterdam Ave, Manhattan, NY', 3, 1, '2022-10-12 11:45:32.000000', '2021-08-12 11:45:32.000000'),
(72, 'Table #72', '150 nassau street, Manhattan, NY', 4, 1, '2021-10-05 16:47:24.000000', '2021-04-08 16:47:24.000000'),
(73, 'Table #73', '57 Murray Street , Manhattan, NY', 4, 1, '2021-09-04 14:42:44.000000', '2022-08-03 14:42:44.000000'),
(74, 'Table #74', '40-56 Junction Blvd , Queens, NY', 4, 1, '2022-05-04 03:01:01.000000', '2021-11-30 03:01:01.000000'),
(75, 'Table #75', '141 Mulberry Street, Manhattan, NY', 4, 1, '2022-11-09 00:12:24.000000', '2022-07-07 00:12:24.000000'),
(76, 'Table #76', '119 23 Street , Manhattan, NY', 4, 1, '2021-05-07 14:48:09.000000', '2021-06-20 14:48:09.000000'),
(77, 'Table #77', '90 baxter street, Manhattan, NY', 4, 1, '2021-07-17 08:43:45.000000', '2021-11-11 08:43:45.000000'),
(78, 'Table #78', '931 Manhattan ave, Brooklyn, NY', 4, 1, '2021-02-09 01:10:57.000000', '2022-04-15 01:10:57.000000'),
(79, 'Table #79', '5 Mott Street, Manhattan, NY', 4, 1, '2021-09-29 08:33:09.000000', '2022-07-07 08:33:09.000000'),
(80, 'Table #80', '21 Waverly Place, Manhattan, NY', 4, 1, '2021-02-21 06:50:49.000000', '2021-11-03 06:50:49.000000'),
(81, 'Table #81', '336 3rd Avenue, Manhattan, NY', 4, 1, '2022-06-08 23:27:35.000000', '2022-12-18 23:27:35.000000'),
(82, 'Table #82', '181 Smith Street, Brooklyn, NY', 4, 1, '2022-09-18 06:10:51.000000', '2021-05-19 06:10:51.000000'),
(83, 'Table #83', '228 Front st, Manhattan, NY', 4, 1, '2022-04-28 02:41:14.000000', '2021-11-14 02:41:14.000000'),
(84, 'Table #84', '171 Ave U, Brooklyn, NY', 5, 1, '2022-02-26 07:55:36.000000', '2022-07-12 07:55:36.000000'),
(85, 'Table #85', '1701 Foster Corp, Brooklyn, NY', 5, 1, '2022-05-05 16:01:41.000000', '2021-06-05 16:01:41.000000'),
(86, 'Table #86', '12 West 23rd street , Manhattan, NY', 5, 1, '2022-01-15 16:17:28.000000', '2021-09-17 16:17:28.000000'),
(87, 'Table #87', '96 Orchard, Manhattan, NY', 5, 1, '2021-02-22 18:53:34.000000', '2022-10-06 18:53:34.000000'),
(88, 'Table #88', '201 East Tenth street, Manhattan, NY', 5, 1, '2021-11-08 17:37:54.000000', '2021-10-18 17:37:54.000000'),
(89, 'Table #89', '28 Greenwich Avenue, Manhattan, NY', 5, 1, '2022-10-22 18:08:03.000000', '2021-12-03 18:08:03.000000'),
(90, 'Table #90', '35-11 35th avenue, Queens, NY', 5, 1, '2022-04-04 18:12:12.000000', '2021-07-19 18:12:12.000000'),
(91, 'Table #91', '886 Amsterdam Ave, Manhattan, NY', 5, 1, '2021-06-21 05:14:38.000000', '2022-09-24 05:14:38.000000'),
(92, 'Table #92', '170 West 4 street, Manhattan, NY', 5, 1, '2022-10-03 15:42:45.000000', '2022-10-09 15:42:45.000000'),
(93, 'Table #93', '168 Driggs ave , Brooklyn, NY', 5, 1, '2022-08-05 02:50:38.000000', '2022-03-10 02:50:38.000000'),
(94, 'Table #94', '230 West 4th Street, Manhattan, NY', 5, 1, '2022-06-16 01:27:46.000000', '2022-02-19 01:27:46.000000'),
(95, 'Table #95', '402 East 140th Street, Bronx, NY', 5, 1, '2021-08-10 19:46:35.000000', '2021-06-30 19:46:35.000000'),
(96, 'Table #96', '239 East 53rd Street, Manhattan, NY', 5, 1, '2022-03-02 01:28:25.000000', '2021-02-24 01:28:25.000000'),
(97, 'Table #97', '158-22 Crossbay Blvd, Queens, NY', 5, 1, '2021-04-14 09:46:36.000000', '2022-07-16 09:46:36.000000'),
(98, 'Table #98', '609 vanderbilt ave, Brooklyn, NY', 5, 1, '2021-08-01 14:59:35.000000', '2021-06-13 14:59:35.000000'),
(99, 'Table #99', '10 10 downing street, Manhattan, NY', 5, 1, '2021-04-24 18:39:15.000000', '2021-06-16 18:39:15.000000'),
(100, 'Table #100', '69-46 myrtle ave, Queens, NY', 5, 1, '2022-10-01 19:44:02.000000', '2022-01-23 19:44:02.000000');

-- --------------------------------------------------------

--
-- Table structure for table `core_payment`
--

CREATE TABLE `core_payment` (
  `id` bigint(20) NOT NULL,
  `transaction_id` varchar(70) NOT NULL,
  `qr_code_data` varchar(70) DEFAULT NULL,
  `_from` varchar(30) DEFAULT NULL,
  `_to` varchar(30) DEFAULT NULL,
  `order_id` varchar(70) NOT NULL,
  `h_table_id` int(11) NOT NULL,
  `hotel_id` int(11) NOT NULL,
  `discount_amt` int(11) DEFAULT NULL,
  `tax_amt` int(11) DEFAULT NULL,
  `net_amt` int(11) NOT NULL,
  `status` varchar(20) DEFAULT NULL,
  `method` varchar(30) DEFAULT NULL,
  `ratings` int(11) NOT NULL,
  `description` varchar(225) DEFAULT NULL,
  `feedback` varchar(225) DEFAULT NULL,
  `created_at` datetime(6) DEFAULT NULL,
  `updated_at` datetime(6) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `core_qrcode`
--

CREATE TABLE `core_qrcode` (
  `id` bigint(20) NOT NULL,
  `url` varchar(200) NOT NULL,
  `transaction_id` varchar(70) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `django_admin_log`
--

CREATE TABLE `django_admin_log` (
  `id` int(11) NOT NULL,
  `action_time` datetime(6) NOT NULL,
  `object_id` longtext DEFAULT NULL,
  `object_repr` varchar(200) NOT NULL,
  `action_flag` smallint(5) UNSIGNED NOT NULL CHECK (`action_flag` >= 0),
  `change_message` longtext NOT NULL,
  `content_type_id` int(11) DEFAULT NULL,
  `user_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `django_content_type`
--

CREATE TABLE `django_content_type` (
  `id` int(11) NOT NULL,
  `app_label` varchar(100) NOT NULL,
  `model` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `django_content_type`
--

INSERT INTO `django_content_type` (`id`, `app_label`, `model`) VALUES
(1, 'admin', 'logentry'),
(3, 'auth', 'group'),
(2, 'auth', 'permission'),
(4, 'auth', 'user'),
(5, 'contenttypes', 'contenttype'),
(9, 'core', 'foodcategory'),
(10, 'core', 'fooditem'),
(11, 'core', 'foodorder'),
(7, 'core', 'hotelowner'),
(8, 'core', 'hoteltable'),
(12, 'core', 'payment'),
(13, 'core', 'qrcode'),
(6, 'sessions', 'session');

-- --------------------------------------------------------

--
-- Table structure for table `django_migrations`
--

CREATE TABLE `django_migrations` (
  `id` bigint(20) NOT NULL,
  `app` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `applied` datetime(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `django_migrations`
--

INSERT INTO `django_migrations` (`id`, `app`, `name`, `applied`) VALUES
(1, 'contenttypes', '0001_initial', '2022-12-26 18:29:00.925622'),
(2, 'auth', '0001_initial', '2022-12-26 18:29:01.229021'),
(3, 'admin', '0001_initial', '2022-12-26 18:29:01.311522'),
(4, 'admin', '0002_logentry_remove_auto_add', '2022-12-26 18:29:01.337552'),
(5, 'admin', '0003_logentry_add_action_flag_choices', '2022-12-26 18:29:01.363367'),
(6, 'contenttypes', '0002_remove_content_type_name', '2022-12-26 18:29:01.447432'),
(7, 'auth', '0002_alter_permission_name_max_length', '2022-12-26 18:29:01.495374'),
(8, 'auth', '0003_alter_user_email_max_length', '2022-12-26 18:29:01.525567'),
(9, 'auth', '0004_alter_user_username_opts', '2022-12-26 18:29:01.550283'),
(10, 'auth', '0005_alter_user_last_login_null', '2022-12-26 18:29:01.587983'),
(11, 'auth', '0006_require_contenttypes_0002', '2022-12-26 18:29:01.592163'),
(12, 'auth', '0007_alter_validators_add_error_messages', '2022-12-26 18:29:01.614666'),
(13, 'auth', '0008_alter_user_username_max_length', '2022-12-26 18:29:01.643761'),
(14, 'auth', '0009_alter_user_last_name_max_length', '2022-12-26 18:29:01.670258'),
(15, 'auth', '0010_alter_group_name_max_length', '2022-12-26 18:29:01.703201'),
(16, 'auth', '0011_update_proxy_permissions', '2022-12-26 18:29:01.741418'),
(17, 'auth', '0012_alter_user_first_name_max_length', '2022-12-26 18:29:01.767430'),
(18, 'sessions', '0001_initial', '2022-12-26 18:29:01.791601'),
(19, 'core', '0001_initial', '2022-12-26 18:36:30.896710'),
(20, 'core', '0002_alter_foodcategory_created_at_and_more', '2022-12-26 18:36:30.945851');

-- --------------------------------------------------------

--
-- Table structure for table `django_session`
--

CREATE TABLE `django_session` (
  `session_key` varchar(40) NOT NULL,
  `session_data` longtext NOT NULL,
  `expire_date` datetime(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `django_session`
--

INSERT INTO `django_session` (`session_key`, `session_data`, `expire_date`) VALUES
('287mmaxselih64u1qrcu7xke1cw1sk52', '.eJxVjjsOwyAQRO9CHRDLz5Ayfc5gsSyO85GRbFNFuXuw5SIpZ-ft07xZH-s69nXJc38ndmbATr83jOmZp62gR5xuRaQyrfMdxYaIo13EtVB-XQ72TzDGZWzfntApP2irvDSuA2tSwmi1DykQSlDBdGRdo6If5KBNDqS9t85KNFphk5aZmq_WfeYeeJCYkg6KYzSBA2TiqMByM4CSoH0GlOzzBU-iR7Q:1pYK12:WEhcOP1SoF-tSVnKQ06uNDWh5WwvW-oKjvWvjxcml4w', '2023-03-18 05:01:04.410953'),
('2fapjyds0nudhl464cki5pxlv8tuw0da', '.eJxVjjkOwjAQRe_iGlveF0p6zhB5PDZhUSwlcYW4O06UAso__83Tf5MhtnUc2pLn4Y7kTAQ5_d4gpmeetgIfcbpVluq0zndgG8KOdmHXivl1Odg_wRiXsX97BCt9UUZ6rq0TRqcE0SgfUkDgQgbt0NhORV94UToHVN4bazhoJaFL64zd19o-cw9UW-ABTKZohaNCZKQgFFDrkkiYcwnJks8XU7BIjw:1pl9I1:Ll75i0V3p7CKTRO2BiEeB4fWkitwa5JaIhrbSgomtgM', '2023-04-22 14:11:37.723607'),
('n46g04chgdf9m9ejj1h0sohzjey09tos', '.eJxVjjkOwzAMBP-iOjJ0UaJSps8bDFGU4xywAB9VkL_HNlwk5XKHg32LNi1z3y5TGds7i7PQ4vR7o5SfZdgKfqThVptch3m8U7MhzdFOzbVyeV0O9k_Qp6lfv5HJG-wsGFTOBw0uZ0pgMebIpLSJLjD4lUrYqc66EtkiggdFzhpapXXk1bcs-8w9SKeDATROIlAntS4syUQvGSgkxRhAe_H5AkEAR3U:1pA5Bo:00kv1qIFzr7zQn49vJCjv0QkNu8m8d08hWASJbv_F2I', '2023-01-10 08:20:00.309332'),
('r2jywrtrxqoini4mk2gmnbb4zzz3zhs5', '.eJxVjDsOwjAQBe_iGln-Z01JnzNYXq-NA8iR4qRC3J1ESgHtm5n3ZiFuaw1bz0uYiF2ZZJffDWN65nYAesR2n3ma27pMyA-Fn7Tzcab8up3u30GNve41EDoFRVsFwrhBWpMSRqvBJ08opPJmIOt2K0IRRZvsSQNYZwUarZB9vsiINyI:1pQLRH:DJPa1Z7QSOX1F_rY64GWZKdZ2_hK2yf2gq0oxWxUZKs', '2023-02-24 04:55:11.910185');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `auth_group`
--
ALTER TABLE `auth_group`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `name` (`name`);

--
-- Indexes for table `auth_group_permissions`
--
ALTER TABLE `auth_group_permissions`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `auth_group_permissions_group_id_permission_id_0cd325b0_uniq` (`group_id`,`permission_id`),
  ADD KEY `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` (`permission_id`);

--
-- Indexes for table `auth_permission`
--
ALTER TABLE `auth_permission`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `auth_permission_content_type_id_codename_01ab375a_uniq` (`content_type_id`,`codename`);

--
-- Indexes for table `auth_user`
--
ALTER TABLE `auth_user`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `username` (`username`);

--
-- Indexes for table `auth_user_groups`
--
ALTER TABLE `auth_user_groups`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `auth_user_groups_user_id_group_id_94350c0c_uniq` (`user_id`,`group_id`),
  ADD KEY `auth_user_groups_group_id_97559544_fk_auth_group_id` (`group_id`);

--
-- Indexes for table `auth_user_user_permissions`
--
ALTER TABLE `auth_user_user_permissions`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `auth_user_user_permissions_user_id_permission_id_14a6b632_uniq` (`user_id`,`permission_id`),
  ADD KEY `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` (`permission_id`);

--
-- Indexes for table `core_foodcategory`
--
ALTER TABLE `core_foodcategory`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `core_fooditem`
--
ALTER TABLE `core_fooditem`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `core_foodorder`
--
ALTER TABLE `core_foodorder`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `core_hotelowner`
--
ALTER TABLE `core_hotelowner`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `core_hoteltable`
--
ALTER TABLE `core_hoteltable`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `core_payment`
--
ALTER TABLE `core_payment`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `core_qrcode`
--
ALTER TABLE `core_qrcode`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `django_admin_log`
--
ALTER TABLE `django_admin_log`
  ADD PRIMARY KEY (`id`),
  ADD KEY `django_admin_log_content_type_id_c4bce8eb_fk_django_co` (`content_type_id`),
  ADD KEY `django_admin_log_user_id_c564eba6_fk_auth_user_id` (`user_id`);

--
-- Indexes for table `django_content_type`
--
ALTER TABLE `django_content_type`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `django_content_type_app_label_model_76bd3d3b_uniq` (`app_label`,`model`);

--
-- Indexes for table `django_migrations`
--
ALTER TABLE `django_migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `django_session`
--
ALTER TABLE `django_session`
  ADD PRIMARY KEY (`session_key`),
  ADD KEY `django_session_expire_date_a5c62663` (`expire_date`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `auth_group`
--
ALTER TABLE `auth_group`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `auth_group_permissions`
--
ALTER TABLE `auth_group_permissions`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `auth_permission`
--
ALTER TABLE `auth_permission`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=53;

--
-- AUTO_INCREMENT for table `auth_user`
--
ALTER TABLE `auth_user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `auth_user_groups`
--
ALTER TABLE `auth_user_groups`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `auth_user_user_permissions`
--
ALTER TABLE `auth_user_user_permissions`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `core_foodcategory`
--
ALTER TABLE `core_foodcategory`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `core_fooditem`
--
ALTER TABLE `core_fooditem`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=251;

--
-- AUTO_INCREMENT for table `core_foodorder`
--
ALTER TABLE `core_foodorder`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=252;

--
-- AUTO_INCREMENT for table `core_hotelowner`
--
ALTER TABLE `core_hotelowner`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `core_hoteltable`
--
ALTER TABLE `core_hoteltable`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=101;

--
-- AUTO_INCREMENT for table `core_payment`
--
ALTER TABLE `core_payment`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `core_qrcode`
--
ALTER TABLE `core_qrcode`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `django_admin_log`
--
ALTER TABLE `django_admin_log`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `django_content_type`
--
ALTER TABLE `django_content_type`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT for table `django_migrations`
--
ALTER TABLE `django_migrations`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `auth_group_permissions`
--
ALTER TABLE `auth_group_permissions`
  ADD CONSTRAINT `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  ADD CONSTRAINT `auth_group_permissions_group_id_b120cbf9_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`);

--
-- Constraints for table `auth_permission`
--
ALTER TABLE `auth_permission`
  ADD CONSTRAINT `auth_permission_content_type_id_2f476e4b_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`);

--
-- Constraints for table `auth_user_groups`
--
ALTER TABLE `auth_user_groups`
  ADD CONSTRAINT `auth_user_groups_group_id_97559544_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`),
  ADD CONSTRAINT `auth_user_groups_user_id_6a12ed8b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`);

--
-- Constraints for table `auth_user_user_permissions`
--
ALTER TABLE `auth_user_user_permissions`
  ADD CONSTRAINT `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  ADD CONSTRAINT `auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`);

--
-- Constraints for table `django_admin_log`
--
ALTER TABLE `django_admin_log`
  ADD CONSTRAINT `django_admin_log_content_type_id_c4bce8eb_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  ADD CONSTRAINT `django_admin_log_user_id_c564eba6_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
