-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Mar 17, 2026 at 06:13 AM
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
-- Database: `flavor_fusion_db`
--

-- --------------------------------------------------------

--
-- Table structure for table `admin`
--

CREATE TABLE `admin` (
  `a_id` int(11) NOT NULL,
  `a_name` varchar(255) NOT NULL,
  `a_email` varchar(255) NOT NULL,
  `a_address` varchar(500) DEFAULT NULL,
  `a_password` varchar(255) NOT NULL,
  `a_phone` varchar(20) DEFAULT NULL,
  `a_profile_pic` varchar(255) DEFAULT NULL,
  `a_role` varchar(50) DEFAULT 'admin',
  `a_created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `admin`
--

INSERT INTO `admin` (`a_id`, `a_name`, `a_email`, `a_address`, `a_password`, `a_phone`, `a_profile_pic`, `a_role`, `a_created_at`) VALUES
(1, 'foram', 'foram@gmail.com', 'shyamnagar', '$2y$10$TjF7n7wqDtf9FaZKyKiNZe8xpLMN2CSWn0Q.nIe/w/aMoUbsWs89u', '9087654324', 'admin_1_1772169298.jpeg', 'admin', '2026-02-02 05:29:43');

-- --------------------------------------------------------

--
-- Table structure for table `cart`
--

CREATE TABLE `cart` (
  `id` int(11) NOT NULL,
  `customer_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `quantity` int(11) NOT NULL DEFAULT 1,
  `added_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `size` varchar(10) DEFAULT '250g'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `cart`
--

INSERT INTO `cart` (`id`, `customer_id`, `product_id`, `quantity`, `added_at`, `size`) VALUES
(50, 2, 5, 1, '2026-03-11 08:22:04', '500g'),
(51, 4, 13, 1, '2026-03-11 09:26:12', '500g');

-- --------------------------------------------------------

--
-- Table structure for table `categories`
--

CREATE TABLE `categories` (
  `category_id` int(11) NOT NULL,
  `category_name` varchar(255) NOT NULL,
  `category_description` text DEFAULT NULL,
  `category_image` varchar(255) DEFAULT NULL,
  `category_created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `categories`
--

INSERT INTO `categories` (`category_id`, `category_name`, `category_description`, `category_image`, `category_created_at`) VALUES
(1, 'Birthday Cake', 'mack your day special', '1767843551_birthday.jpg', '2025-03-16 10:47:51'),
(2, 'Wedding Cake', 'may your low grow deeper with every sunrice', '1767843622_wedding.jpg', '2025-03-16 11:28:47'),
(3, 'Kids cake', 'a cake sweet', '1767843711_kids.jpg', '2026-01-08 03:41:51'),
(4, 'Fruit Cakes', 'a slice of fruit is a slice', '1767843781_fruit.jpg', '2026-01-08 03:43:01'),
(8, 'Baby Shower Cake', 'Sweet moments for your little miracle..', '1772016590_baby.jpg', '2026-02-25 10:42:31'),
(9, 'Cheese Cake', 'Cheesecake bliss in every layer.', '1772016577_cheese.jpg', '2026-02-25 10:49:37'),
(10, 'Pastry', 'Light, airy pastry crafted to melt in your mouth.', '1772016978_pastry.jpg', '2026-02-25 10:52:34'),
(11, 'CupCake', 'A little bite of heaven in a cup', '1772016830_cupcake.jpeg', '2026-02-25 10:53:50'),
(13, 'engagement cake', 'engage', '1773385414_1767843902_chocolate.jpg', '2026-03-13 07:03:34');

-- --------------------------------------------------------

--
-- Table structure for table `customers`
--

CREATE TABLE `customers` (
  `customer_id` int(11) NOT NULL,
  `customer_name` varchar(100) NOT NULL,
  `customer_email` varchar(100) DEFAULT NULL,
  `customer_password` varchar(225) NOT NULL,
  `customer_phone` varchar(10) NOT NULL,
  `customer_address` text DEFAULT NULL,
  `customer_profile` varchar(255) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `token` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `customers`
--

INSERT INTO `customers` (`customer_id`, `customer_name`, `customer_email`, `customer_password`, `customer_phone`, `customer_address`, `customer_profile`, `created_at`, `token`) VALUES
(1, 'neha', 'neha@gmail.com', '$2y$10$u7SQejf4fUzZ.SVS04slH./3t9QWm66/y/1l9b8w1viDB8eniKu0C', '9978059739', 'nursing, Sola Bhagwat, Ahmedabad, gujarat - 380068', 'user_1_1772166260.jpeg', '2026-01-27 05:25:15', NULL),
(2, 'ishita', 'ishita@gmail.com', '$2y$10$poSb/NaWEyugNI/3BoMpcOQhkIJc.eVTWWbS4X/S7D2P2.zp420Ky', '9904981198', 'lubi corporate, samvad samnvay, ahemdabad, gujarat - 380068', 'user_2_1772166872.jpeg', '2026-01-28 16:18:28', '128917'),
(3, 'manvar jesmi', 'jesmi@gmail.com', '$2y$10$ip72ktARKE6ZCppp3XIj8OZsyzeN7D.Yf6umNwQKvPAnR35sW8FFa', '9081151077', 'navkar palace, cg road, surat, gujarat - 367890', 'user_3_1772165501.jpeg', '2026-02-02 10:37:44', '711645'),
(4, 'roshni', 'roshni@gmail.com', '$2y$10$MnmxCnDh5CGIpqT0y2AMIOAfThzH90DOfCtPaZPVfidHTuzKnqvU6', '7654323456', 'vivanta, near rc technical, ahemdabad, gujarat - 345678', 'user_4_1772166177.jpeg', '2026-02-02 10:39:40', '659225'),
(5, 'astha', 'astha@gmail.com', '$2y$10$DcRqoe8PwsLVeSdFZ2Y6BeLoBIYzTRkcIAQd7lZHJsh4QgFKLlxjG', '6987654312', 'ambika nagar, Gota, Ahmedabad, gujarat - 380460', 'user_5_1772166590.jpeg', '2026-02-02 10:40:57', '221646'),
(6, 'tulsi', 'tulsi@gmail.com', '$2y$10$ZKyt/L.c52lB8olQkToZwO1bZImiWggeDb3Xhk98uuVbeUFsGpeYm', '9965432565', 'shyamdham, nikol, ahemdabad, gujarat - 345218', 'user_6_1772165734.jpeg', '2026-02-02 10:43:07', NULL),
(7, 'leelu', 'leelu@gmail.com', '$2y$10$Okk09VBTt/AAG.MAXXI9iu0FSxHd8HR2kLFy0rOZUVOS4MlNu83Je', '7654321678', 'triveni apartment, sela, ahemdabad, gujarat - 380060', 'user_7_1772166411.jpeg', '2026-02-02 10:46:01', NULL),
(8, 'Diya', 'diya@gmail.com', '$2y$10$AqOI.RfN3iTh/Jk8nNqc4uQ03Js824i1gWF.thEAbvQFnYJ8PeTJG', '9954332454', 'varaj society, pasodara, surat, gujarat - 367898', 'user_8_1772167489.jpeg', '2026-02-02 10:47:36', NULL),
(9, 'dhruvi', 'dhruvi@gmail.com', '$2y$10$H6EvgKPy.oYGy8ZPDvcnSuHAHVfVG8z96Q6l/jUhbbfziuraQQyC.', '8765434567', 'titodi plot, mahesh nagar, keshod, gujarat - 362220', 'user_9_1772167030.jpeg', '2026-02-02 10:49:48', NULL),
(10, 'vishva', 'vishva@gmail.com', '$2y$10$BW8/IeQGXA8WiNCy.CExoOC3rN55i2vRdLKe8hFdxygdn9vWRkUTm', '9807689765', 'ram nagar, near bus stand, ajab, gujarat - 362229', 'user_10_1772167385.jpeg', '2026-02-02 10:51:16', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `offers`
--

CREATE TABLE `offers` (
  `off_id` int(11) NOT NULL,
  `off_title` varchar(255) NOT NULL,
  `off_description` text DEFAULT NULL,
  `off_discount_percent` int(11) NOT NULL,
  `off_coupon_code` varchar(100) DEFAULT NULL,
  `off_start_date` date DEFAULT NULL,
  `off_end_date` date DEFAULT NULL,
  `off_image` varchar(255) DEFAULT NULL,
  `off_status` varchar(50) DEFAULT 'active'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `offers`
--

INSERT INTO `offers` (`off_id`, `off_title`, `off_description`, `off_discount_percent`, `off_coupon_code`, `off_start_date`, `off_end_date`, `off_image`, `off_status`) VALUES
(5, 'Holi special', 'Add sweetness to your holi with our special cake offers......', 10, 'HOLI10', '2026-02-24', '2026-03-05', 'offer_1771935213.jpg', 'active'),
(8, 'Summer Offer', 'Enjoy special discounts this summer on selected products...', 20, 'SUMMER20', '2026-03-09', '2026-04-30', 'offer_1773074185.jpeg', 'active');

-- --------------------------------------------------------

--
-- Table structure for table `orders`
--

CREATE TABLE `orders` (
  `order_id` int(11) NOT NULL,
  `customer_id` int(11) NOT NULL,
  `customer_name` varchar(100) DEFAULT NULL,
  `customer_phone` varchar(15) DEFAULT NULL,
  `price` decimal(10,2) DEFAULT NULL,
  `delivery_charge` decimal(10,2) DEFAULT NULL,
  `sub_total` decimal(10,2) DEFAULT NULL,
  `discount_amount` decimal(10,2) DEFAULT NULL,
  `total_amount` decimal(10,2) DEFAULT NULL,
  `delivery_option` enum('delivery','pickup') NOT NULL,
  `status` enum('pending','processing','completed','cancelled','out_for_delivery') NOT NULL DEFAULT 'pending',
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `order_status` enum('PENDING','PROCESSING','COMPLETED','CANCELLED') DEFAULT 'PENDING',
  `delivery_type` enum('HOME DELIVERY','PICKUP','DINE IN') DEFAULT 'HOME DELIVERY',
  `delivery_address` text DEFAULT NULL,
  `order_notes` text DEFAULT NULL,
  `payment_status` enum('PAID','UNPAID','PARTIAL') DEFAULT 'UNPAID',
  `refund_status` varchar(50) DEFAULT NULL,
  `payment_id` varchar(255) DEFAULT NULL,
  `payment_method` enum('CASH','CARD','ONLINE','UPI') DEFAULT 'CASH',
  `assigned_staff_id` int(11) DEFAULT NULL,
  `delivery_boy_id` int(11) DEFAULT NULL,
  `delivery_otp` varchar(6) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `orders`
--

INSERT INTO `orders` (`order_id`, `customer_id`, `customer_name`, `customer_phone`, `price`, `delivery_charge`, `sub_total`, `discount_amount`, `total_amount`, `delivery_option`, `status`, `created_at`, `order_status`, `delivery_type`, `delivery_address`, `order_notes`, `payment_status`, `refund_status`, `payment_id`, `payment_method`, `assigned_staff_id`, `delivery_boy_id`, `delivery_otp`) VALUES
(1, 1, 'neha', '9978059739', 400.00, 40.00, 440.00, 40.00, 400.00, 'delivery', 'out_for_delivery', '2026-02-27 15:16:22', 'PENDING', 'HOME DELIVERY', 'nursing, hostel, ahemdabad, gujarat - 380068', '', 'UNPAID', NULL, NULL, 'CASH', 3, NULL, '032235'),
(2, 1, 'neha', '9978059739', 1000.00, 0.00, 1000.00, 100.00, 900.00, 'delivery', 'completed', '2026-02-27 15:19:40', 'PENDING', 'HOME DELIVERY', 'nursing, hostel, ahemdabad, gujarat - 380068', 'happy birthday neha', 'PAID', NULL, '5114925755020', 'ONLINE', 2, NULL, NULL),
(3, 2, 'ishita', '9904981198', 600.00, 0.00, 600.00, 60.00, 540.00, 'delivery', 'pending', '2026-02-27 15:21:52', 'PENDING', 'HOME DELIVERY', 'lubi corporate, samvad samnvay, ahemdabad, gujarat - 380068', '', 'UNPAID', NULL, NULL, 'CASH', 3, NULL, NULL),
(4, 2, 'ishita', '9904981198', 199.00, 40.00, 239.00, 19.90, 219.10, 'delivery', 'completed', '2026-02-27 15:22:49', 'PENDING', 'HOME DELIVERY', 'lubi corporate, samvad samnvay, ahemdabad, gujarat - 380068', '', 'PAID', NULL, '5114925755027', 'ONLINE', 3, NULL, NULL),
(5, 2, 'ishita', '9904981198', 240.00, 40.00, 280.00, 24.00, 256.00, 'delivery', 'completed', '2026-02-27 15:23:53', 'PENDING', 'HOME DELIVERY', 'lubi corporate, samvad samnvay, ahemdabad, gujarat - 380068', '', 'PAID', NULL, '5114925755029', 'ONLINE', 1, NULL, NULL),
(6, 2, 'ishita', '9904981198', 1000.00, 0.00, 1000.00, 100.00, 900.00, 'delivery', 'pending', '2026-02-27 15:24:47', 'PENDING', 'HOME DELIVERY', 'lubi corporate, samvad samnvay, ahemdabad, gujarat - 380068', 'happy birthday ishita', 'UNPAID', NULL, NULL, 'CASH', 2, NULL, NULL),
(7, 2, 'ishita', '9904981198', 796.00, 0.00, 796.00, 79.60, 716.40, 'delivery', 'pending', '2026-02-27 15:25:33', 'PENDING', 'HOME DELIVERY', 'lubi corporate, samvad samnvay, ahemdabad, gujarat - 380068', '', 'PAID', NULL, '5114925755042', 'ONLINE', 3, NULL, NULL),
(8, 2, 'ishita', '9904981198', 400.00, 40.00, 440.00, 0.00, 440.00, 'delivery', 'pending', '2026-02-27 15:26:07', 'PENDING', 'HOME DELIVERY', 'lubi corporate, samvad samnvay, ahemdabad, gujarat - 380068', '', 'UNPAID', NULL, NULL, 'CASH', 1, NULL, NULL),
(9, 3, 'manvar jesmi', '9081151077', 135.00, 40.00, 175.00, 13.50, 161.50, 'delivery', 'out_for_delivery', '2026-02-27 15:30:20', 'PENDING', 'HOME DELIVERY', 'navkar palace, cg road, surat, gujarat - 367890', '', 'UNPAID', NULL, NULL, 'CASH', 2, NULL, '079839'),
(10, 3, 'manvar jesmi', '9081151077', 700.00, 0.00, 700.00, 70.00, 630.00, 'delivery', 'completed', '2026-02-27 15:31:36', 'PENDING', 'HOME DELIVERY', 'navkar palace, cg road, surat, gujarat - 367890', 'happy birthday krunal', 'PAID', NULL, '5114925755079', 'ONLINE', 3, NULL, NULL),
(11, 4, 'roshni', '7654323456', 1600.00, 0.00, 1600.00, 160.00, 1440.00, 'delivery', 'pending', '2026-02-27 15:33:28', 'PENDING', 'HOME DELIVERY', 'vivanta, near rc technical, ahemdabad, gujarat - 345678', '', 'UNPAID', NULL, NULL, 'CASH', 1, NULL, NULL),
(12, 4, 'roshni', '7654323456', 1100.00, 0.00, 1100.00, 0.00, 1100.00, 'delivery', 'completed', '2026-02-27 15:35:17', 'PENDING', 'HOME DELIVERY', 'vivanta, near rc technical, ahemdabad, gujarat - 345678', 'welcome baby', 'PAID', NULL, '5114925755091', 'ONLINE', 1, NULL, NULL),
(13, 5, 'astha', '6987654312', 120.00, 40.00, 160.00, 12.00, 148.00, 'delivery', 'pending', '2026-02-27 15:37:25', 'PENDING', 'HOME DELIVERY', 'ambika nagar, jamkhambhaliya, dwarka, gujarat - 380460', '', 'UNPAID', NULL, NULL, 'CASH', 2, NULL, NULL),
(14, 5, 'astha', '6987654312', 800.00, 0.00, 800.00, 80.00, 720.00, 'delivery', 'pending', '2026-02-27 15:39:42', 'PENDING', 'HOME DELIVERY', 'ambika nagar, jamkhambhaliya, dwarka, gujarat - 380460', 'happy birthday baccha......', 'PAID', NULL, '5114925755130', 'ONLINE', 3, NULL, NULL),
(15, 6, 'tulsi', '9965432565', 600.00, 0.00, 600.00, 60.00, 540.00, 'delivery', 'pending', '2026-02-27 15:41:10', 'PENDING', 'HOME DELIVERY', 'shyamdham, nikol, ahemdabad, gujarat - 345218', '', 'UNPAID', NULL, NULL, 'CASH', 1, NULL, NULL),
(16, 6, 'tulsi', '9965432565', 450.00, 40.00, 490.00, 45.00, 445.00, 'delivery', 'pending', '2026-02-27 15:41:56', 'PENDING', 'HOME DELIVERY', 'shyamdham, nikol, ahemdabad, gujarat - 345218', '', 'PAID', NULL, '5114925755145', 'ONLINE', 2, NULL, NULL),
(17, 6, 'tulsi', '9965432565', 150.00, 40.00, 190.00, 15.00, 175.00, 'delivery', 'pending', '2026-02-27 15:43:15', 'PENDING', 'HOME DELIVERY', 'shyamdham, nikol, ahemdabad, gujarat - 345218', '', 'UNPAID', NULL, NULL, 'CASH', 3, NULL, NULL),
(18, 6, 'tulsi', '9965432565', 300.00, 40.00, 340.00, 30.00, 310.00, 'delivery', 'completed', '2026-02-27 15:43:40', 'PENDING', 'HOME DELIVERY', 'shyamdham, nikol, ahemdabad, gujarat - 345218', '', 'PAID', NULL, NULL, 'CASH', 1, NULL, NULL),
(19, 7, 'leelu', '7654321678', 250.00, 40.00, 290.00, 25.00, 265.00, 'delivery', 'out_for_delivery', '2026-02-27 15:46:03', 'PENDING', 'HOME DELIVERY', 'triveni apartment, sela, ahemdabad, gujarat - 380060', '', 'UNPAID', NULL, NULL, 'CASH', 2, NULL, '376041'),
(20, 7, 'leelu', '7654321678', 300.00, 40.00, 340.00, 30.00, 310.00, 'delivery', 'completed', '2026-02-27 15:46:58', 'PENDING', 'HOME DELIVERY', 'triveni apartment, sela, ahemdabad, gujarat - 380060', '', 'PAID', NULL, '5114925755191', 'ONLINE', 3, NULL, NULL),
(21, 7, 'leelu', '7654321678', 300.00, 40.00, 340.00, 30.00, 310.00, 'delivery', 'completed', '2026-02-27 15:49:14', 'PENDING', 'HOME DELIVERY', 'triveni apartment, sela, ahemdabad, gujarat - 380060', '', 'PAID', NULL, '5114925755211', 'ONLINE', 2, NULL, NULL),
(22, 7, 'leelu', '7654321678', 600.00, 0.00, 600.00, 60.00, 540.00, 'delivery', 'pending', '2026-02-27 15:49:39', 'PENDING', 'HOME DELIVERY', 'triveni apartment, sela, ahemdabad, gujarat - 380060', '', 'UNPAID', NULL, NULL, 'CASH', 1, NULL, NULL),
(23, 8, 'Diya', '9954332454', 398.00, 40.00, 438.00, 39.80, 398.20, 'delivery', 'pending', '2026-02-27 15:51:28', 'PENDING', 'HOME DELIVERY', 'varaj society, pasodara, surat, gujarat - 367898', 'happy birthday baby.....', 'UNPAID', NULL, NULL, 'CASH', 3, NULL, NULL),
(24, 8, 'Diya', '9954332454', 400.00, 40.00, 440.00, 40.00, 400.00, 'delivery', 'pending', '2026-02-27 15:52:59', 'PENDING', 'HOME DELIVERY', 'varaj society, pasodara, surat, gujarat - 367898', 'sorry baby', 'PAID', NULL, '5114925755232', 'ONLINE', 2, NULL, NULL),
(25, 8, 'Diya', '9954332454', 1200.00, 0.00, 1200.00, 120.00, 1080.00, 'delivery', 'completed', '2026-02-27 15:53:18', 'PENDING', 'HOME DELIVERY', 'varaj society, pasodara, surat, gujarat - 367898', '', 'PAID', NULL, NULL, 'CASH', 1, NULL, NULL),
(26, 8, 'Diya', '9954332454', 398.00, 40.00, 438.00, 39.80, 398.20, 'delivery', 'out_for_delivery', '2026-02-27 15:53:45', 'PENDING', 'HOME DELIVERY', 'varaj society, pasodara, surat, gujarat - 367898', '', 'UNPAID', NULL, NULL, 'CASH', 3, NULL, '586258'),
(27, 9, 'dhruvi', '8765434567', 600.00, 0.00, 600.00, 60.00, 540.00, 'delivery', 'pending', '2026-02-27 15:55:44', 'PENDING', 'HOME DELIVERY', 'titodi plot, mahesh nagar, keshod, gujarat - 362220', '', 'UNPAID', NULL, NULL, 'CASH', 2, NULL, NULL),
(28, 9, 'dhruvi', '8765434567', 480.00, 40.00, 520.00, 48.00, 472.00, 'delivery', 'pending', '2026-02-27 15:56:15', 'PENDING', 'HOME DELIVERY', 'titodi plot, mahesh nagar, keshod, gujarat - 362220', 'hello my men..', 'UNPAID', NULL, NULL, 'CASH', 1, NULL, NULL),
(29, 9, 'dhruvi', '8765434567', 900.00, 0.00, 900.00, 90.00, 810.00, 'delivery', 'pending', '2026-02-27 15:57:46', 'PENDING', 'HOME DELIVERY', 'titodi plot, mahesh nagar, keshod, gujarat - 362220', 'congratulations...', 'PAID', NULL, '5114925755277', 'ONLINE', 3, NULL, NULL),
(30, 9, 'dhruvi', '8765434567', 150.00, 40.00, 190.00, 15.00, 175.00, 'delivery', 'completed', '2026-02-27 15:58:12', 'PENDING', 'HOME DELIVERY', 'titodi plot, mahesh nagar, keshod, gujarat - 362220', '', 'PAID', NULL, NULL, 'CASH', 2, NULL, NULL),
(31, 9, 'dhruvi', '8765434567', 1100.00, 0.00, 1100.00, 110.00, 990.00, 'delivery', 'pending', '2026-02-27 15:59:08', 'PENDING', 'HOME DELIVERY', 'titodi plot, mahesh nagar, keshod, gujarat - 362220', '', 'PAID', NULL, '5114925755279', 'ONLINE', NULL, NULL, NULL),
(32, 10, 'vishva', '9807689765', 500.00, 0.00, 500.00, 50.00, 450.00, 'delivery', 'pending', '2026-02-27 16:02:22', 'PENDING', 'HOME DELIVERY', 'ram nagar, near bus stand, ajab, gujarat - 362229', '', 'UNPAID', NULL, NULL, 'CASH', NULL, NULL, NULL),
(33, 10, 'vishva', '9807689765', 600.00, 0.00, 600.00, 60.00, 540.00, 'delivery', 'pending', '2026-02-27 16:02:50', 'PENDING', 'HOME DELIVERY', 'ram nagar, near bus stand, ajab, gujarat - 362229', 'khusi', 'UNPAID', NULL, NULL, 'CASH', NULL, NULL, NULL),
(34, 10, 'vishva', '9807689765', 199.00, 40.00, 239.00, 0.00, 239.00, 'delivery', 'pending', '2026-02-27 16:03:19', 'PENDING', 'HOME DELIVERY', 'ram nagar, near bus stand, ajab, gujarat - 362229', '', 'UNPAID', NULL, NULL, 'CASH', NULL, NULL, NULL),
(35, 10, 'vishva', '9807689765', 480.00, 40.00, 520.00, 48.00, 472.00, 'delivery', 'pending', '2026-02-27 16:04:26', 'PENDING', 'HOME DELIVERY', 'ram nagar, near bus stand, ajab, gujarat - 362229', '', 'PAID', NULL, '5114925755291', 'ONLINE', NULL, NULL, NULL),
(36, 10, 'vishva', '9807689765', 600.00, 0.00, 600.00, 60.00, 540.00, 'delivery', 'pending', '2026-02-27 16:04:59', 'PENDING', 'HOME DELIVERY', 'ram nagar, near bus stand, ajab, gujarat - 362229', '', 'UNPAID', NULL, NULL, 'CASH', NULL, NULL, NULL),
(37, 1, 'neha', '9978059739', 1655.00, 0.00, 1655.00, 165.50, 1489.50, 'delivery', 'pending', '2026-02-27 16:09:38', 'PENDING', 'HOME DELIVERY', 'nursing, hostel, ahemdabad, gujarat - 380068', 'happy birthday kisu', 'UNPAID', NULL, NULL, 'CASH', NULL, NULL, NULL),
(38, 1, 'neha', '9978059739', 160.00, 40.00, 200.00, 16.00, 184.00, 'delivery', 'pending', '2026-02-27 16:11:03', 'PENDING', 'HOME DELIVERY', 'nursing, hostel, ahemdabad, gujarat - 380068', '', 'PAID', NULL, '5114925755329', 'ONLINE', NULL, NULL, NULL),
(39, 3, 'manvar jesmi', '9081151077', 185.00, 40.00, 225.00, 18.50, 206.50, 'delivery', 'pending', '2026-02-27 16:15:22', 'PENDING', 'HOME DELIVERY', 'navkar palace, cg road, surat, gujarat - 367890', '', 'UNPAID', NULL, NULL, 'CASH', NULL, NULL, NULL),
(40, 3, 'manvar jesmi', '9081151077', 1000.00, 0.00, 1000.00, 100.00, 900.00, 'delivery', 'cancelled', '2026-02-27 16:49:50', 'PENDING', 'HOME DELIVERY', 'navkar palace, cg road, surat, gujarat - 367890', '', 'PAID', NULL, '5114925756205', 'ONLINE', 1, NULL, NULL),
(64, 3, 'manvar jesmi', '9081151077', 1800.00, 0.00, 1800.00, 360.00, 1440.00, 'delivery', 'pending', '2026-03-12 07:53:53', 'PENDING', 'HOME DELIVERY', 'navkar palace, cg road, surat, gujarat - 367890', '', 'PAID', NULL, 'TXN1773302031428', 'ONLINE', 2, NULL, NULL),
(65, 5, 'astha', '6987654312', 800.00, 0.00, 800.00, 160.00, 640.00, 'delivery', 'pending', '2026-03-13 03:27:03', 'PENDING', 'HOME DELIVERY', 'ambika nagar, jamkhambhaliya, dwarka, gujarat - 380460', '', 'PAID', NULL, 'TXN1773372420913', 'ONLINE', NULL, NULL, NULL),
(66, 5, 'astha', '6987654312', 796.00, 0.00, 796.00, 159.20, 636.80, 'delivery', 'completed', '2026-03-13 05:00:11', 'PENDING', 'HOME DELIVERY', 'ambika nagar, Gota, Ahmedabad, gujarat - 380460', '', 'PAID', NULL, 'TXN1773378009214', 'ONLINE', 4, NULL, NULL),
(67, 5, 'astha', '6987654312', 796.00, 0.00, 796.00, 159.20, 636.80, 'delivery', 'pending', '2026-03-13 06:47:24', 'PENDING', 'HOME DELIVERY', 'ambika nagar, Gota, Ahmedabad, gujarat - 380460', 'happy birthday', 'PAID', NULL, 'TXN1773384442243', 'ONLINE', NULL, NULL, NULL),
(68, 5, 'astha', '6987654312', 900.00, 0.00, 900.00, 180.00, 720.00, 'delivery', 'completed', '2026-03-13 07:01:13', 'PENDING', 'HOME DELIVERY', 'ambika nagar, Gota, Ahmedabad, gujarat - 380460', '', 'PAID', NULL, 'TXN1773385271858', 'ONLINE', 1, NULL, NULL),
(69, 5, 'astha', '6987654312', 2220.00, 0.00, 2220.00, 444.00, 1776.00, 'delivery', 'completed', '2026-03-13 07:37:53', 'PENDING', 'HOME DELIVERY', 'ambika nagar, Gota, Ahmedabad, gujarat - 380460', 'dfghjkl;', 'PAID', NULL, 'TXN1773387471457', 'ONLINE', 1, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `order_items`
--

CREATE TABLE `order_items` (
  `oi_id` int(11) NOT NULL,
  `customer_id` int(11) NOT NULL,
  `order_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `category_name` varchar(100) DEFAULT NULL,
  `product_name` varchar(255) DEFAULT NULL,
  `size` varchar(50) DEFAULT NULL,
  `price` int(11) NOT NULL,
  `quantity` int(11) NOT NULL,
  `delivery_charge` decimal(10,2) DEFAULT NULL,
  `sub_total` decimal(10,2) DEFAULT NULL,
  `discount_amount` decimal(10,2) DEFAULT NULL,
  `total_price` decimal(10,2) NOT NULL DEFAULT 0.00
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `order_items`
--

INSERT INTO `order_items` (`oi_id`, `customer_id`, `order_id`, `product_id`, `category_name`, `product_name`, `size`, `price`, `quantity`, `delivery_charge`, `sub_total`, `discount_amount`, `total_price`) VALUES
(1, 1, 1, 3, 'Birthday Cake', 'Vanila', '500g', 400, 1, 40.00, 440.00, 40.00, 400.00),
(2, 1, 2, 9, 'Birthday Cake', 'bento', '1kg', 1000, 1, 0.00, 1000.00, 100.00, 900.00),
(3, 2, 3, 13, 'Wedding Cake', 'red valvet', '500g', 600, 1, 0.00, 600.00, 60.00, 540.00),
(4, 2, 4, 8, 'Birthday Cake', 'strawberry', '250g', 199, 1, 40.00, 239.00, 19.90, 219.10),
(5, 2, 5, 15, 'Wedding Cake', 'pineapple', '500g', 240, 1, 40.00, 280.00, 24.00, 256.00),
(6, 2, 6, 18, 'Wedding Cake', 'butterscotch', '1kg', 1000, 1, 0.00, 1000.00, 100.00, 900.00),
(7, 2, 7, 26, 'Kids cake', 'butterscotch', '1kg', 796, 1, 0.00, 796.00, 79.60, 716.40),
(8, 2, 8, 29, 'Fruit Cakes', 'red valvet', '250g', 400, 1, 40.00, 440.00, 0.00, 440.00),
(9, 3, 9, 56, 'Pastry', 'red valvet', 'piece', 135, 3, 40.00, 175.00, 13.50, 161.50),
(10, 3, 10, 7, 'Birthday Cake', 'pineapple', '500g', 700, 1, 0.00, 700.00, 70.00, 630.00),
(11, 4, 11, 46, 'Cheese Cake', 'Chocolate', '500g', 1600, 1, 0.00, 1600.00, 160.00, 1440.00),
(12, 4, 12, 40, 'Baby Shower Cake', 'red valvet', '500g', 1100, 1, 0.00, 1100.00, 0.00, 1100.00),
(13, 5, 13, 68, 'CupCake', 'rich truffle', 'piece', 120, 2, 40.00, 160.00, 12.00, 148.00),
(14, 5, 14, 33, 'Fruit Cakes', 'bento', '1kg', 800, 1, 0.00, 800.00, 80.00, 720.00),
(15, 6, 15, 22, 'Kids cake', 'black forest', '500g', 600, 1, 0.00, 600.00, 60.00, 540.00),
(16, 6, 16, 5, 'Birthday Cake', 'red valvet', '250g', 450, 1, 40.00, 490.00, 45.00, 445.00),
(17, 6, 17, 1, 'Birthday Cake', 'Chocolate', '250g', 150, 1, 40.00, 190.00, 15.00, 175.00),
(18, 6, 18, 6, 'Birthday Cake', 'black forest', '250g', 300, 1, 40.00, 340.00, 30.00, 310.00),
(19, 7, 19, 9, 'Birthday Cake', 'bento', '250g', 250, 1, 40.00, 290.00, 25.00, 265.00),
(20, 7, 20, 10, 'Birthday Cake', 'butterscotch', '500g', 300, 1, 40.00, 340.00, 30.00, 310.00),
(21, 7, 21, 11, 'Wedding Cake', 'Chocolate', '500g', 300, 1, 40.00, 340.00, 30.00, 310.00),
(22, 7, 22, 12, 'Wedding Cake', 'Vanila', '1kg', 600, 1, 0.00, 600.00, 60.00, 540.00),
(23, 8, 23, 16, 'Wedding Cake', 'strawberry', '500g', 398, 1, 40.00, 438.00, 39.80, 398.20),
(24, 8, 24, 14, 'Wedding Cake', 'black forest', '500g', 400, 1, 40.00, 440.00, 40.00, 400.00),
(25, 8, 25, 6, 'Birthday Cake', 'black forest', '1kg', 1200, 1, 0.00, 1200.00, 120.00, 1080.00),
(26, 8, 26, 16, 'Wedding Cake', 'strawberry', '500g', 398, 1, 40.00, 438.00, 39.80, 398.20),
(27, 9, 27, 13, 'Wedding Cake', 'red valvet', '500g', 600, 1, 0.00, 600.00, 60.00, 540.00),
(28, 9, 28, 15, 'Wedding Cake', 'pineapple', '1kg', 480, 1, 40.00, 520.00, 48.00, 472.00),
(29, 9, 29, 17, 'Wedding Cake', 'bento', '500g', 900, 1, 0.00, 900.00, 90.00, 810.00),
(30, 9, 30, 24, 'Kids cake', 'strawberry', '250g', 150, 1, 40.00, 190.00, 15.00, 175.00),
(31, 9, 31, 21, 'Kids cake', 'red valvet', '250g', 300, 1, 0.00, 300.00, 30.00, 270.00),
(32, 9, 31, 25, 'Kids cake', 'bento', '500g', 800, 1, 0.00, 800.00, 80.00, 720.00),
(33, 10, 32, 19, 'Kids cake', 'Chocolate', '250g', 500, 1, 0.00, 500.00, 50.00, 450.00),
(34, 10, 33, 28, 'Fruit Cakes', 'Vanila', '500g', 600, 1, 0.00, 600.00, 60.00, 540.00),
(35, 10, 34, 34, 'Fruit Cakes', 'butterscotch', '250g', 199, 1, 40.00, 239.00, 0.00, 239.00),
(36, 10, 35, 27, 'Fruit Cakes', 'Chocolate', '1kg', 480, 1, 40.00, 520.00, 48.00, 472.00),
(37, 10, 36, 42, 'Baby Shower Cake', 'pineapple', '500g', 600, 1, 0.00, 600.00, 60.00, 540.00),
(38, 1, 37, 52, 'Cheese Cake', 'biscoff', '250g', 555, 1, 0.00, 555.00, 55.50, 499.50),
(39, 1, 37, 48, 'Cheese Cake', 'red valvet', '500g', 1100, 1, 0.00, 1100.00, 110.00, 990.00),
(40, 1, 38, 59, 'Pastry', 'strawberry', 'piece', 45, 1, 40.00, 85.00, 4.50, 80.50),
(41, 1, 38, 60, 'Pastry', 'rich truffle', 'piece', 60, 1, 0.00, 60.00, 6.00, 54.00),
(42, 1, 38, 61, 'Pastry', 'blueberry', 'piece', 55, 1, 0.00, 55.00, 5.50, 49.50),
(43, 3, 39, 64, 'CupCake', 'red valvet', 'piece', 55, 1, 40.00, 95.00, 5.50, 89.50),
(44, 3, 39, 69, 'CupCake', 'blueberry', 'piece', 45, 1, 0.00, 45.00, 4.50, 40.50),
(45, 3, 39, 66, 'CupCake', 'pineapple', 'piece', 35, 1, 0.00, 35.00, 3.50, 31.50),
(46, 3, 39, 63, 'CupCake', 'Vanila', 'piece', 50, 1, 0.00, 50.00, 5.00, 45.00),
(47, 3, 40, 44, 'Baby Shower Cake', 'bento', '500g', 1000, 1, 0.00, 1000.00, 100.00, 900.00),
(66, 3, 64, 5, 'Birthday Cake', 'red valvet', '1kg', 1800, 1, 0.00, 1800.00, 360.00, 1440.00),
(67, 5, 65, 46, 'Cheese Cake', 'Chocolate', '250g', 800, 1, 0.00, 800.00, 160.00, 640.00),
(68, 5, 66, 8, 'Birthday Cake', 'strawberry', '1kg', 796, 1, 0.00, 796.00, 159.20, 636.80),
(69, 5, 67, 8, 'Birthday Cake', 'strawberry', '1kg', 796, 1, 0.00, 796.00, 159.20, 636.80),
(70, 5, 68, 5, 'Birthday Cake', 'red valvet', '500g', 900, 1, 0.00, 900.00, 180.00, 720.00),
(71, 5, 69, 3, 'Birthday Cake', 'Vanila', '250g', 200, 1, 0.00, 200.00, 40.00, 160.00),
(72, 5, 69, 51, 'Cheese Cake', 'strawberry', '500g', 1120, 1, 0.00, 1120.00, 224.00, 896.00),
(73, 5, 69, 17, 'Wedding Cake', 'bento', '500g', 900, 1, 0.00, 900.00, 180.00, 720.00);

-- --------------------------------------------------------

--
-- Table structure for table `payments`
--

CREATE TABLE `payments` (
  `p_id` int(11) NOT NULL,
  `order_id` int(11) NOT NULL,
  `customer_id` int(11) NOT NULL,
  `customer_name` varchar(255) DEFAULT NULL,
  `customer_phone` varchar(20) DEFAULT NULL,
  `amount` decimal(10,2) NOT NULL,
  `payment_method` enum('credit_card','debit_card','cash','online') NOT NULL,
  `status` enum('failed','unpaid','paid') DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `payment_id` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `payments`
--

INSERT INTO `payments` (`p_id`, `order_id`, `customer_id`, `customer_name`, `customer_phone`, `amount`, `payment_method`, `status`, `created_at`, `payment_id`) VALUES
(1, 1, 1, 'neha', '9978059739', 400.00, 'cash', 'unpaid', '2026-02-27 15:16:22', NULL),
(2, 2, 1, 'neha', '9978059739', 900.00, 'online', 'paid', '2026-02-27 15:19:40', '5114925755020'),
(3, 3, 2, 'ishita', '9904981198', 540.00, 'cash', 'unpaid', '2026-02-27 15:21:52', NULL),
(4, 4, 2, 'ishita', '9904981198', 219.10, 'online', 'paid', '2026-02-27 15:22:49', '5114925755027'),
(5, 5, 2, 'ishita', '9904981198', 256.00, 'online', 'paid', '2026-02-27 15:23:53', '5114925755029'),
(6, 6, 2, 'ishita', '9904981198', 900.00, 'cash', 'unpaid', '2026-02-27 15:24:47', NULL),
(7, 7, 2, 'ishita', '9904981198', 716.40, 'online', 'paid', '2026-02-27 15:25:33', '5114925755042'),
(8, 8, 2, 'ishita', '9904981198', 440.00, 'cash', 'unpaid', '2026-02-27 15:26:07', NULL),
(9, 9, 3, 'manvar jesmi', '9081151077', 161.50, 'cash', 'unpaid', '2026-02-27 15:30:20', NULL),
(10, 10, 3, 'manvar jesmi', '9081151077', 630.00, 'online', 'paid', '2026-02-27 15:31:36', '5114925755079'),
(11, 11, 4, 'roshni', '7654323456', 1440.00, 'cash', 'unpaid', '2026-02-27 15:33:28', NULL),
(12, 12, 4, 'roshni', '7654323456', 1100.00, 'online', 'paid', '2026-02-27 15:35:17', '5114925755091'),
(13, 13, 5, 'astha', '6987654312', 148.00, 'cash', 'unpaid', '2026-02-27 15:37:25', NULL),
(14, 14, 5, 'astha', '6987654312', 720.00, 'online', 'paid', '2026-02-27 15:39:42', '5114925755130'),
(15, 15, 6, 'tulsi', '9965432565', 540.00, 'cash', 'unpaid', '2026-02-27 15:41:10', NULL),
(16, 16, 6, 'tulsi', '9965432565', 445.00, 'online', 'paid', '2026-02-27 15:41:56', '5114925755145'),
(17, 17, 6, 'tulsi', '9965432565', 175.00, 'cash', 'unpaid', '2026-02-27 15:43:15', NULL),
(18, 18, 6, 'tulsi', '9965432565', 310.00, 'cash', 'unpaid', '2026-02-27 15:43:40', NULL),
(19, 19, 7, 'leelu', '7654321678', 265.00, 'cash', 'unpaid', '2026-02-27 15:46:03', NULL),
(20, 20, 7, 'leelu', '7654321678', 310.00, 'online', 'paid', '2026-02-27 15:46:58', '5114925755191'),
(21, 21, 7, 'leelu', '7654321678', 310.00, 'online', 'paid', '2026-02-27 15:49:14', '5114925755211'),
(22, 22, 7, 'leelu', '7654321678', 540.00, 'cash', 'unpaid', '2026-02-27 15:49:39', NULL),
(23, 23, 8, 'Diya', '9954332454', 398.20, 'cash', 'unpaid', '2026-02-27 15:51:28', NULL),
(24, 24, 8, 'Diya', '9954332454', 400.00, 'online', 'paid', '2026-02-27 15:52:59', '5114925755232'),
(25, 25, 8, 'Diya', '9954332454', 1080.00, 'cash', 'unpaid', '2026-02-27 15:53:18', NULL),
(26, 26, 8, 'Diya', '9954332454', 398.20, 'cash', 'unpaid', '2026-02-27 15:53:45', NULL),
(27, 27, 9, 'dhruvi', '8765434567', 540.00, 'cash', 'unpaid', '2026-02-27 15:55:44', NULL),
(28, 28, 9, 'dhruvi', '8765434567', 472.00, 'cash', 'unpaid', '2026-02-27 15:56:15', NULL),
(29, 29, 9, 'dhruvi', '8765434567', 810.00, 'online', 'paid', '2026-02-27 15:57:46', '5114925755277'),
(30, 30, 9, 'dhruvi', '8765434567', 175.00, 'cash', 'unpaid', '2026-02-27 15:58:12', NULL),
(31, 31, 9, 'dhruvi', '8765434567', 990.00, 'online', 'paid', '2026-02-27 15:59:08', '5114925755279'),
(32, 32, 10, 'vishva', '9807689765', 450.00, 'cash', 'unpaid', '2026-02-27 16:02:22', NULL),
(33, 33, 10, 'vishva', '9807689765', 540.00, 'cash', 'unpaid', '2026-02-27 16:02:50', NULL),
(34, 34, 10, 'vishva', '9807689765', 239.00, 'cash', 'unpaid', '2026-02-27 16:03:19', NULL),
(35, 35, 10, 'vishva', '9807689765', 472.00, 'online', 'paid', '2026-02-27 16:04:26', '5114925755291'),
(36, 36, 10, 'vishva', '9807689765', 540.00, 'cash', 'unpaid', '2026-02-27 16:04:59', NULL),
(37, 37, 1, 'neha', '9978059739', 1489.50, 'cash', 'unpaid', '2026-02-27 16:09:38', NULL),
(38, 38, 1, 'neha', '9978059739', 184.00, 'online', 'paid', '2026-02-27 16:11:03', '5114925755329'),
(39, 39, 3, 'manvar jesmi', '9081151077', 206.50, 'cash', 'unpaid', '2026-02-27 16:15:22', NULL),
(40, 40, 3, 'manvar jesmi', '9081151077', 900.00, 'online', 'paid', '2026-02-27 16:49:50', '5114925756205'),
(61, 64, 3, 'manvar jesmi', '9081151077', 1440.00, 'online', 'paid', '2026-03-12 07:53:53', 'TXN1773302031428'),
(62, 65, 5, 'astha', '6987654312', 640.00, 'online', 'paid', '2026-03-13 03:27:03', 'TXN1773372420913'),
(63, 66, 5, 'astha', '6987654312', 636.80, 'online', 'paid', '2026-03-13 05:00:11', 'TXN1773378009214'),
(64, 67, 5, 'astha', '6987654312', 636.80, 'online', 'paid', '2026-03-13 06:47:24', 'TXN1773384442243'),
(65, 68, 5, 'astha', '6987654312', 720.00, 'online', 'paid', '2026-03-13 07:01:13', 'TXN1773385271858'),
(66, 69, 5, 'astha', '6987654312', 1776.00, 'online', 'paid', '2026-03-13 07:37:53', 'TXN1773387471457');

-- --------------------------------------------------------

--
-- Table structure for table `products`
--

CREATE TABLE `products` (
  `product_id` int(11) NOT NULL,
  `product_name` varchar(255) NOT NULL,
  `product_description` text DEFAULT NULL,
  `category_id` int(11) NOT NULL,
  `product_price` decimal(10,2) NOT NULL,
  `product_stock` int(11) NOT NULL DEFAULT 0,
  `product_image` varchar(255) DEFAULT NULL,
  `product_created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `products`
--

INSERT INTO `products` (`product_id`, `product_name`, `product_description`, `category_id`, `product_price`, `product_stock`, `product_image`, `product_created_at`) VALUES
(1, 'Chocolate', 'Indulge in Pure Chocolate Bliss Savor the rich, velvety taste of our signature Chocolate Cake. Baked to perfection with premium cocoa and layered with silky smooth chocolate ganache, every bite offers a melt-in-your-mouth experience. Whether it&#039;s a birthday, an anniversary, or a simple craving, this cake is the ultimate treat for every chocolate lover.', 1, 150.00, 10, '1767843902_chocolate.jpg', '2025-03-16 10:48:19'),
(3, 'Vanila', 'The Heavenly Vanilla Delight Soft, fluffy, and bursting with the sweet aroma of fresh vanilla. Our Vanilla Cake is a crowd favorite that pairs perfectly with any celebration. It’s the simple pleasure you’ve been looking for!', 1, 200.00, 5, '1767843973_Vanilla.jpg', '2025-03-16 11:32:22'),
(5, 'red valvet', 'Velvety, Rich &amp; Bold Fall in love with the smooth, velvety texture of our classic Red Velvet Cake. With its iconic crimson color and rich cream cheese layers, it’s the perfect treat for someone special—or just to spoil yourself!', 1, 450.00, 20, '1767844015_red1.jpeg', '2025-03-16 11:32:38'),
(6, 'black forest', 'Rich Chocolate. Sweet Cherries. Fresh Cream. Our Black Forest Cake is the perfect balance of fruity freshness and chocolate indulgence. Every layer is packed with flavor and topped with luscious cherries and premium chocolate flakes.', 1, 300.00, 30, '1767844063_black.jpg', '2025-03-16 11:32:38'),
(7, 'pineapple', 'Pure Pineapple Paradise Light, zesty, and incredibly moist! Our Pineapple Cake is made with real fruit and fresh cream, making it the perfect dessert for those who love a refreshing, fruity treat.', 1, 350.00, 40, '1767844105_pineapple.jpg', '2025-03-16 11:32:38'),
(8, 'strawberry', 'Sweet, Pink &amp; Perfect! Our Strawberry Cake is a fan favorite for all the right reasons. Made with real fruit extracts and light-as-air whipped cream, it’s the perfect treat for someone who loves a delicate, fruity dessert.', 1, 199.00, 25, '1767844140_strawberry.jpg', '2025-03-16 11:32:38'),
(9, 'bento', 'The Ultimate Surprise in a Box Looking for a thoughtful gift? Our Bento Cakes are the answer. Beautifully decorated with minimalist designs and aesthetic colors, they fit perfectly in a lunchbox for easy carrying. It’s the sweetest way to say &quot;Happy Birthday,&quot; &quot;I Love You,&quot; or &quot;Congratulations&quot; without any leftovers!', 1, 250.00, 9, '1767844198_bento.jpg', '2025-03-16 11:32:38'),
(10, 'butterscotch', 'Golden, Buttery, and Oh-So-Crunchy! Fall in love with the classic taste of Butterscotch. Our cake is packed with rich caramel flavor and topped with extra butterscotch chips for that perfect crunch you crave.', 1, 150.00, 15, '1767844262_butterscotch.jpg', '2026-01-08 03:51:02'),
(11, 'Chocolate', 'Indulge in Pure Chocolate Bliss Savor the rich, velvety taste of our signature Chocolate Cake. Baked to perfection with premium cocoa and layered with silky smooth chocolate ganache, every bite offers a melt-in-your-mouth experience. Whether it&#039;s a birthday, an anniversary, or a simple craving, this cake is the ultimate treat for every chocolate lover.', 2, 150.00, 10, '1767844305_c1.jpg', '2026-01-08 03:51:45'),
(12, 'Vanila', 'The Heavenly Vanilla Delight Soft, fluffy, and bursting with the sweet aroma of fresh vanilla. Our Vanilla Cake is a crowd favorite that pairs perfectly with any celebration. It’s the simple pleasure you’ve been looking for!', 2, 150.00, 20, '1767844343_Vanilla2.jpg', '2026-01-08 03:52:23'),
(13, 'red valvet', 'Velvety, Rich &amp; Bold Fall in love with the smooth, velvety texture of our classic Red Velvet Cake. With its iconic crimson color and rich cream cheese layers, it’s the perfect treat for someone special—or just to spoil yourself!', 2, 300.00, 20, '1767844375_red2.jpg', '2026-01-08 03:52:55'),
(14, 'black forest', 'Rich Chocolate. Sweet Cherries. Fresh Cream. Our Black Forest Cake is the perfect balance of fruity freshness and chocolate indulgence. Every layer is packed with flavor and topped with luscious cherries and premium chocolate flakes.', 2, 200.00, 20, '1767844415_black2.jpg', '2026-01-08 03:53:35'),
(15, 'pineapple', 'Pure Pineapple Paradise Light, zesty, and incredibly moist! Our Pineapple Cake is made with real fruit and fresh cream, making it the perfect dessert for those who love a refreshing, fruity treat.', 2, 120.00, 12, '1767844653_pineapple2.jpg', '2026-01-08 03:57:33'),
(16, 'strawberry', 'Sweet, Pink &amp; Perfect! Our Strawberry Cake is a fan favorite for all the right reasons. Made with real fruit extracts and light-as-air whipped cream, it’s the perfect treat for someone who loves a delicate, fruity dessert.', 2, 199.00, 15, '1767844802_strawberry2.jpg', '2026-01-08 04:00:02'),
(17, 'bento', 'The Ultimate Surprise in a Box Looking for a thoughtful gift? Our Bento Cakes are the answer. Beautifully decorated with minimalist designs and aesthetic colors, they fit perfectly in a lunchbox for easy carrying. It’s the sweetest way to say &quot;Happy Birthday,&quot; &quot;I Love You,&quot; or &quot;Congratulations&quot; without any leftovers!', 2, 450.00, 20, '1767844876_bento2.jpg', '2026-01-08 04:01:16'),
(18, 'butterscotch', 'Golden, Buttery, and Oh-So-Crunchy! Fall in love with the classic taste of Butterscotch. Our cake is packed with rich caramel flavor and topped with extra butterscotch chips for that perfect crunch you crave.', 2, 250.00, 10, '1767844988_butterscotch2.jpg', '2026-01-08 04:03:08'),
(19, 'Chocolate', 'Indulge in Pure Chocolate Bliss Savor the rich, velvety taste of our signature Chocolate Cake. Baked to perfection with premium cocoa and layered with silky smooth chocolate ganache, every bite offers a melt-in-your-mouth experience. Whether it&#039;s a birthday, an anniversary, or a simple craving, this cake is the ultimate treat for every chocolate lover.', 3, 500.00, 10, '1767846032_chocolate2.jpg', '2026-01-08 04:20:32'),
(20, 'Vanila', 'The Heavenly Vanilla Delight Soft, fluffy, and bursting with the sweet aroma of fresh vanilla. Our Vanilla Cake is a crowd favorite that pairs perfectly with any celebration. It’s the simple pleasure you’ve been looking for!', 3, 250.00, 10, '1767846102_Vanilla3.jpg', '2026-01-08 04:21:42'),
(21, 'red valvet', 'Velvety, Rich &amp; Bold Fall in love with the smooth, velvety texture of our classic Red Velvet Cake. With its iconic crimson color and rich cream cheese layers, it’s the perfect treat for someone special—or just to spoil yourself!', 3, 300.00, 15, '1767846140_red3.jpg', '2026-01-08 04:22:20'),
(22, 'black forest', 'Rich Chocolate. Sweet Cherries. Fresh Cream. Our Black Forest Cake is the perfect balance of fruity freshness and chocolate indulgence. Every layer is packed with flavor and topped with luscious cherries and premium chocolate flakes.', 3, 300.00, 10, '1767846181_black3.jpg', '2026-01-08 04:23:01'),
(23, 'pineapple', 'Pure Pineapple Paradise Light, zesty, and incredibly moist! Our Pineapple Cake is made with real fruit and fresh cream, making it the perfect dessert for those who love a refreshing, fruity treat.', 3, 200.00, 5, '1767846236_pineapple3.jpg', '2026-01-08 04:23:56'),
(24, 'strawberry', 'Sweet, Pink &amp; Perfect! Our Strawberry Cake is a fan favorite for all the right reasons. Made with real fruit extracts and light-as-air whipped cream, it’s the perfect treat for someone who loves a delicate, fruity dessert.', 3, 150.00, 10, '1767846274_strawberry3.jpg', '2026-01-08 04:24:34'),
(25, 'bento', 'The Ultimate Surprise in a Box Looking for a thoughtful gift? Our Bento Cakes are the answer. Beautifully decorated with minimalist designs and aesthetic colors, they fit perfectly in a lunchbox for easy carrying. It’s the sweetest way to say &quot;Happy Birthday,&quot; &quot;I Love You,&quot; or &quot;Congratulations&quot; without any leftovers!', 3, 400.00, 20, '1767846314_bento3.jpg', '2026-01-08 04:25:14'),
(26, 'butterscotch', 'Golden, Buttery, and Oh-So-Crunchy! Fall in love with the classic taste of Butterscotch. Our cake is packed with rich caramel flavor and topped with extra butterscotch chips for that perfect crunch you crave.', 3, 199.00, 5, '1767846365_butterscotch3.jpg', '2026-01-08 04:26:05'),
(27, 'Chocolate', 'Indulge in Pure Chocolate Bliss Savor the rich, velvety taste of our signature Chocolate Cake. Baked to perfection with premium cocoa and layered with silky smooth chocolate ganache, every bite offers a melt-in-your-mouth experience. Whether it&#039;s a birthday, an anniversary, or a simple craving, this cake is the ultimate treat for every chocolate lover.', 4, 120.00, 25, '1767846747_chocolate3.jpg', '2026-01-08 04:32:27'),
(28, 'Vanila', 'The Heavenly Vanilla Delight Soft, fluffy, and bursting with the sweet aroma of fresh vanilla. Our Vanilla Cake is a crowd favorite that pairs perfectly with any celebration. It’s the simple pleasure you’ve been looking for!', 4, 300.00, 20, '1767846787_Vanilla4.jpg', '2026-01-08 04:33:07'),
(29, 'red valvet', 'Velvety, Rich &amp; Bold Fall in love with the smooth, velvety texture of our classic Red Velvet Cake. With its iconic crimson color and rich cream cheese layers, it’s the perfect treat for someone special—or just to spoil yourself!', 4, 400.00, 10, '1767846823_red4.jpg', '2026-01-08 04:33:43'),
(30, 'black forest', 'Rich Chocolate. Sweet Cherries. Fresh Cream. Our Black Forest Cake is the perfect balance of fruity freshness and chocolate indulgence. Every layer is packed with flavor and topped with luscious cherries and premium chocolate flakes.', 4, 200.00, 10, '1767846920_black4.jpg', '2026-01-08 04:35:20'),
(31, 'pineapple', 'Pure Pineapple Paradise Light, zesty, and incredibly moist! Our Pineapple Cake is made with real fruit and fresh cream, making it the perfect dessert for those who love a refreshing, fruity treat.', 4, 180.00, 25, '1767846956_pinepple4.jpg', '2026-01-08 04:35:56'),
(32, 'strawberry', 'Sweet, Pink &amp; Perfect! Our Strawberry Cake is a fan favorite for all the right reasons. Made with real fruit extracts and light-as-air whipped cream, it’s the perfect treat for someone who loves a delicate, fruity dessert.', 4, 200.00, 10, '1767846995_strawberry4.jpg', '2026-01-08 04:36:35'),
(33, 'bento', 'The Ultimate Surprise in a Box Looking for a thoughtful gift? Our Bento Cakes are the answer. Beautifully decorated with minimalist designs and aesthetic colors, they fit perfectly in a lunchbox for easy carrying. It’s the sweetest way to say &quot;Happy Birthday,&quot; &quot;I Love You,&quot; or &quot;Congratulations&quot; without any leftovers!', 4, 200.00, 20, '1767847038_bento4.jpg', '2026-01-08 04:37:18'),
(34, 'butterscotch', 'Golden, Buttery, and Oh-So-Crunchy! Fall in love with the classic taste of Butterscotch. Our cake is packed with rich caramel flavor and topped with extra butterscotch chips for that perfect crunch you crave.', 4, 199.00, 5, '1767847076_butterscotch4.jpg', '2026-01-08 04:37:56'),
(38, 'Chocolate', 'Indulge in Pure Chocolate Bliss Savor the rich, velvety taste of our signature Chocolate Cake. Baked to perfection with premium cocoa and layered with silky smooth chocolate ganache, every bite offers a melt-in-your-mouth experience. Whether it&#039;s a birthday, an anniversary, or a simple craving, this cake is the ultimate treat for every chocolate lover.', 8, 600.00, 4, '1772020587_chocolate5.jpg', '2026-02-25 11:40:28'),
(39, 'Vanila', 'The Heavenly Vanilla Delight Soft, fluffy, and bursting with the sweet aroma of fresh vanilla. Our Vanilla Cake is a crowd favorite that pairs perfectly with any celebration. It’s the simple pleasure you’ve been looking for!', 8, 400.00, 3, '1772022816_Vanilla5.jpg', '2026-02-25 11:49:23'),
(40, 'red valvet', 'Velvety, Rich &amp; Bold Fall in love with the smooth, velvety texture of our classic Red Velvet Cake. With its iconic crimson color and rich cream cheese layers, it’s the perfect treat for someone special—or just to spoil yourself!', 8, 550.00, 2, '1772020369_red5.jpeg', '2026-02-25 11:52:49'),
(41, 'black forest', 'Rich Chocolate. Sweet Cherries. Fresh Cream. Our Black Forest Cake is the perfect balance of fruity freshness and chocolate indulgence. Every layer is packed with flavor and topped with luscious cherries and premium chocolate flakes.', 8, 600.00, 3, '1772020513_black5.jpg', '2026-02-25 11:55:13'),
(42, 'pineapple', 'Pure Pineapple Paradise Light, zesty, and incredibly moist! Our Pineapple Cake is made with real fruit and fresh cream, making it the perfect dessert for those who love a refreshing, fruity treat.', 8, 300.00, 4, '1772020899_pineapple5.jpeg', '2026-02-25 11:58:19'),
(43, 'strawberry', 'Sweet, Pink &amp; Perfect! Our Strawberry Cake is a fan favorite for all the right reasons. Made with real fruit extracts and light-as-air whipped cream, it’s the perfect treat for someone who loves a delicate, fruity dessert.', 8, 450.00, 2, '1772020829_strawberry5.jpg', '2026-02-25 12:00:29'),
(44, 'bento', 'The Ultimate Surprise in a Box Looking for a thoughtful gift? Our Bento Cakes are the answer. Beautifully decorated with minimalist designs and aesthetic colors, they fit perfectly in a lunchbox for easy carrying. It’s the sweetest way to say &quot;Happy Birthday,&quot; &quot;I Love You,&quot; or &quot;Congratulations&quot; without any leftovers!', 8, 500.00, 4, '1772021521_bento5.jpeg', '2026-02-25 12:04:18'),
(45, 'butterscotch', 'Golden, Buttery, and Oh-So-Crunchy! Fall in love with the classic taste of Butterscotch. Our cake is packed with rich caramel flavor and topped with extra butterscotch chips for that perfect crunch you crave.', 8, 250.00, 3, '1772021438_butterscotch5.jpeg', '2026-02-25 12:07:23'),
(46, 'Chocolate', 'Indulge in Pure Chocolate Bliss Savor the rich, velvety taste of our signature Chocolate Cake. Baked to perfection with premium cocoa and layered with silky smooth chocolate ganache, every bite offers a melt-in-your-mouth experience. Whether it&#039;s a birthday, an anniversary, or a simple craving, this cake is the ultimate treat for every chocolate lover.', 9, 800.00, 4, '1772021791_chocolate6.jpeg', '2026-02-25 12:16:31'),
(47, 'Vanila', 'The Heavenly Vanilla Delight Soft, fluffy, and bursting with the sweet aroma of fresh vanilla. Our Vanilla Cake is a crowd favorite that pairs perfectly with any celebration. It’s the simple pleasure you’ve been looking for!', 9, 700.00, 5, '1772022367_Vanilla6.jpeg', '2026-02-25 12:17:13'),
(48, 'red valvet', 'Velvety, Rich &amp; Bold Fall in love with the smooth, velvety texture of our classic Red Velvet Cake. With its iconic crimson color and rich cream cheese layers, it’s the perfect treat for someone special—or just to spoil yourself!', 9, 550.00, 4, '1772021905_red7.jpeg', '2026-02-25 12:18:25'),
(49, 'black forest', 'Rich Chocolate. Sweet Cherries. Fresh Cream. Our Black Forest Cake is the perfect balance of fruity freshness and chocolate indulgence. Every layer is packed with flavor and topped with luscious cherries and premium chocolate flakes.', 9, 550.00, 2, '1772022453_black6.jpeg', '2026-02-25 12:27:33'),
(50, 'pineapple', 'Pure Pineapple Paradise Light, zesty, and incredibly moist! Our Pineapple Cake is made with real fruit and fresh cream, making it the perfect dessert for those who love a refreshing, fruity treat.', 9, 350.00, 1, '1772022509_pineapple6.jpeg', '2026-02-25 12:28:29'),
(51, 'strawberry', 'Sweet, Pink &amp; Perfect! Our Strawberry Cake is a fan favorite for all the right reasons. Made with real fruit extracts and light-as-air whipped cream, it’s the perfect treat for someone who loves a delicate, fruity dessert.', 9, 560.00, 2, '1772022569_strawberry6.jpeg', '2026-02-25 12:29:29'),
(52, 'biscoff', 'A Biscoff cake is a rich, indulgent dessert centered around the unique, caramelized flavor of Belgian speculoos cookies...', 9, 555.00, 4, '1772022709_biscoff6.jpeg', '2026-02-25 12:31:49'),
(53, 'blueberry', 'A blueberry cake is a tender, moist, and often fluffy dessert characterized by a vibrant, fruity flavor and a bright purple-speckled crumb, filled with juicy, bursting berries.', 9, 650.00, 2, '1772022784_blueberry6.jpeg', '2026-02-25 12:33:04'),
(54, 'Chocolate', 'A chocolate pastry is a rich, indulgent dessert featuring layers of moist chocolate sponge, creamy chocolate ganache, and often topped with chocolate shavings or glaze.', 10, 50.00, 10, '1772022938_chocolate7.jpeg', '2026-02-25 12:35:38'),
(55, 'Vanila', 'Vanilla pastry is a classic, light dessert featuring soft, airy sponge cake layers (or shortcrust pastry) infused with aromatic vanilla', 10, 35.00, 5, '1772023059_Vanilla7.jpeg', '2026-02-25 12:37:39'),
(56, 'red valvet', 'A red velvet pastry is a striking dessert featuring soft, moist, and mildly cocoa-flavored cake with a distinct, bright red color.', 10, 45.00, 7, '1772023148_red8.jpeg', '2026-02-25 12:39:08'),
(57, 'black forest', 'A Black Forest pastry is a decadent, individual-sized German-inspired dessert featuring layers of rich chocolate sponge cake, light whipped cream, and tart cherries.', 10, 50.00, 10, '1772023243_black7.jpeg', '2026-02-25 12:40:43'),
(58, 'pineapple', 'Pineapple pastry is a light, airy dessert featuring layers of soft vanilla sponge soaked in sweet syrup, sandwiched with whipped cream and pineapple chunks/compote.', 10, 30.00, 25, '1772023326_pineapple7.jpeg', '2026-02-25 12:42:06'),
(59, 'strawberry', 'A strawberry pastry is a refreshing, fruity dessert characterized by its light texture, vibrant color, and sweet-tart flavor profile.', 10, 45.00, 8, '1772023421_strawberry7.jpeg', '2026-02-25 12:43:41'),
(60, 'rich truffle', 'A rich chocolate truffle pastry is an indulgent dessert featuring layers of moist, dense chocolate sponge and smooth, velvety dark chocolate ganache, finished with a glossy glaze and chocolate shavings or decor.', 10, 60.00, 9, '1772023749_rich7.jpg', '2026-02-25 12:46:01'),
(61, 'blueberry', 'A blueberry pastry is a delicate, flaky, and buttery baked treat—often using puff pastry or danish dough—filled with sweet-tart blueberry compote and creamy custard or cream cheese.', 10, 55.00, 15, '1772023647_blueberry7.jpeg', '2026-02-25 12:47:27'),
(62, 'Chocolate', 'A chocolate cupcake is a small, tender cake with a deep, rich cocoa flavor, often described as having a moist, fudgy, or velvety texture.', 11, 40.00, 10, '1772024121_cupcake1.jpeg', '2026-02-25 12:51:13'),
(63, 'Vanila', 'Vanilla cupcakes are classic, bakery-style treats featuring a soft, fluffy, and moist crumb with a rich, buttery, and distinct vanilla flavor.', 11, 50.00, 5, '1772024400_Vanilla8.jpg', '2026-02-25 12:57:52'),
(64, 'red valvet', 'A red velvet cupcake is a popular, visually striking dessert characterized by its vibrant deep red or maroon color, a soft, velvety texture, and a distinct flavor that bridges the gap between vanilla and chocolate.', 11, 55.00, 8, '1772024479_red9.jpeg', '2026-02-25 13:01:19'),
(65, 'black forest', 'Black Forest cupcakes are indulgent, individual-sized treats inspired by the German cake, featuring a moist, rich chocolate cake filled with tangy cherry compote or maraschino cherries.', 11, 45.00, 9, '1772024554_black8.jpeg', '2026-02-25 13:02:34'),
(66, 'pineapple', 'Pineapple cupcakes are moist, tropical treats featuring a light, tender crumb packed with crushed pineapple, often topped with creamy pineapple, coconut, or cream cheese frosting.', 11, 35.00, 7, '1772024620_pineapple8.jpeg', '2026-02-25 13:03:40'),
(67, 'strawberry', 'A strawberry cupcake is a light, moist, and tender cake, frequently described as a handheld version of strawberry shortcake.', 11, 50.00, 2, '1772024683_strawberry8.jpeg', '2026-02-25 13:04:43'),
(68, 'rich truffle', 'A rich truffle cupcake is an ultra-decadent, moist chocolate cake often filled with gooey, melted chocolate ganache and topped with silky, whipped truffle frosting.', 11, 60.00, 6, '1772024789_rich8.jpg', '2026-02-25 13:06:29'),
(69, 'blueberry', 'A blueberry cupcake is a moist, tender, and often buttery cake packed with fresh or frozen blueberries that create jammy, sweet, and slightly tangy pockets of fruit', 11, 45.00, 9, '1772024857_blueberry8.jpeg', '2026-02-25 13:07:37');

-- --------------------------------------------------------

--
-- Table structure for table `refunds`
--

CREATE TABLE `refunds` (
  `refund_id` int(11) NOT NULL,
  `order_id` int(11) NOT NULL,
  `customer_id` int(11) NOT NULL,
  `refund_amount` decimal(10,2) NOT NULL,
  `payment_method` varchar(50) NOT NULL,
  `refund_status` enum('pending','completed') DEFAULT 'pending',
  `requested_at` datetime DEFAULT current_timestamp(),
  `completed_at` datetime DEFAULT NULL,
  `admin_note` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `refunds`
--

INSERT INTO `refunds` (`refund_id`, `order_id`, `customer_id`, `refund_amount`, `payment_method`, `refund_status`, `requested_at`, `completed_at`, `admin_note`) VALUES
(1, 40, 3, 900.00, 'ONLINE', 'completed', '2026-02-27 22:20:34', '2026-02-27 22:22:57', '');

-- --------------------------------------------------------

--
-- Table structure for table `reviews`
--

CREATE TABLE `reviews` (
  `review_id` int(11) NOT NULL,
  `customer_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `product_name` varchar(255) NOT NULL,
  `rating` tinyint(4) DEFAULT NULL CHECK (`rating` between 1 and 5),
  `review_text` text DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `reviews`
--

INSERT INTO `reviews` (`review_id`, `customer_id`, `product_id`, `product_name`, `rating`, `review_text`, `created_at`) VALUES
(1, 1, 3, 'Vanila', 5, 'very good', '2026-02-27 15:20:10'),
(2, 2, 8, 'strawberry', 4, 'nice...!', '2026-02-27 15:26:33'),
(3, 2, 18, 'butterscotch', 5, 'very nice taste', '2026-02-27 15:26:54'),
(4, 2, 26, 'butterscotch', 5, 'nice', '2026-02-27 15:27:11'),
(6, 3, 7, 'pineapple', 4, 'testy..............', '2026-02-27 15:32:29'),
(7, 4, 46, 'Chocolate', 4, 'very cheese........', '2026-02-27 15:35:37'),
(8, 4, 40, 'red valvet', 5, 'nice test..............', '2026-02-27 15:36:04'),
(9, 5, 68, 'rich truffle', 4, 'nice......', '2026-02-27 15:39:59'),
(10, 5, 33, 'bento', 5, 'good.............', '2026-02-27 15:40:16'),
(11, 6, 22, 'black forest', 5, 'best.........', '2026-02-27 15:42:17'),
(12, 6, 5, 'red valvet', 5, 'nice..', '2026-02-27 15:42:36'),
(13, 6, 22, 'black forest', 4, 'nice test', '2026-02-27 15:44:03'),
(14, 6, 1, 'Chocolate', 5, 'good', '2026-02-27 15:44:29'),
(15, 7, 9, 'bento', 5, 'good........', '2026-02-27 15:47:20'),
(16, 7, 10, 'butterscotch', 5, 'nice...', '2026-02-27 15:47:35'),
(17, 7, 11, 'Chocolate', 5, 'best test...', '2026-02-27 15:50:03'),
(18, 7, 12, 'Vanila', 5, 'testy........', '2026-02-27 15:50:19'),
(19, 8, 16, 'strawberry', 5, 'good...', '2026-02-27 15:54:02'),
(20, 8, 14, 'black forest', 5, 'nice..', '2026-02-27 15:54:18'),
(21, 8, 6, 'black forest', 5, 'nice...', '2026-02-27 15:54:34'),
(22, 9, 13, 'red valvet', 5, 'nice..', '2026-02-27 15:59:26'),
(23, 9, 15, 'pineapple', 4, 'good', '2026-02-27 15:59:39'),
(24, 9, 17, 'bento', 5, 'testy', '2026-02-27 16:00:01'),
(25, 9, 24, 'strawberry', 4, 'nice', '2026-02-27 16:00:20'),
(26, 9, 21, 'red valvet', 5, 'good', '2026-02-27 16:00:40'),
(27, 9, 25, 'bento', 4, 'testy..', '2026-02-27 16:00:59'),
(28, 10, 19, 'Chocolate', 4, 'good', '2026-02-27 16:05:13'),
(29, 10, 28, 'Vanila', 5, 'nice', '2026-02-27 16:05:28'),
(30, 10, 34, 'butterscotch', 5, 'good', '2026-02-27 16:05:44'),
(31, 10, 27, 'Chocolate', 5, 'testy', '2026-02-27 16:06:02'),
(32, 10, 42, 'pineapple', 5, 'very testy', '2026-02-27 16:06:20'),
(33, 2, 15, 'pineapple', 5, 'good..', '2026-02-27 16:07:38'),
(34, 2, 29, 'red valvet', 5, 'nice', '2026-02-27 16:07:57'),
(35, 1, 9, 'bento', 5, 'good', '2026-02-27 16:11:16'),
(36, 1, 52, 'biscoff', 4, 'nice', '2026-02-27 16:11:31'),
(37, 1, 59, 'strawberry', 5, 'good', '2026-02-27 16:11:47'),
(38, 1, 59, 'strawberry', 5, 'good', '2026-02-27 16:12:01'),
(39, 1, 60, 'rich truffle', 4, 'nice', '2026-02-27 16:12:18'),
(40, 1, 61, 'blueberry', 4, 'good', '2026-02-27 16:12:34'),
(41, 1, 48, 'red valvet', 5, 'good', '2026-02-27 16:13:10'),
(42, 3, 64, 'red valvet', 4, 'very soft and fluffy', '2026-02-27 16:18:53'),
(43, 3, 64, 'red valvet', 4, 'very soft and fluffy', '2026-02-27 16:20:35'),
(44, 3, 69, 'blueberry', 5, 'amazing flavor and rich taste', '2026-02-27 16:21:12'),
(45, 3, 66, 'pineapple', 5, 'fresh ingredients used', '2026-02-27 16:21:37'),
(46, 3, 63, 'Vanila', 3, 'nice', '2026-02-27 16:22:00'),
(47, 5, 46, 'Chocolate', 5, 'nice', '2026-03-13 04:26:02');

-- --------------------------------------------------------

--
-- Table structure for table `staff`
--

CREATE TABLE `staff` (
  `staff_id` int(11) NOT NULL,
  `staff_name` varchar(100) NOT NULL,
  `staff_email` varchar(100) NOT NULL,
  `staff_password` varchar(255) NOT NULL,
  `staff_phone` varchar(10) DEFAULT NULL,
  `staff_address` varchar(255) NOT NULL,
  `staff_profile` varchar(255) NOT NULL,
  `staff_status` enum('active','inactive') DEFAULT 'active',
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `staff`
--

INSERT INTO `staff` (`staff_id`, `staff_name`, `staff_email`, `staff_password`, `staff_phone`, `staff_address`, `staff_profile`, `staff_status`, `created_at`, `updated_at`) VALUES
(1, 'rohit', 'rohit@gmail.com', '$2y$10$cgLufKS81cQ7Ow/D/UxKu.J2XTRb1VuSRr/XKnWFngFWQgd7EwMd.', '8907654323', 'lubi corporate ', 'staff_1_1772209836.jpeg', 'active', '2026-02-27 16:27:14', '2026-02-27 16:30:36'),
(2, 'mayur', 'mayur@gmail.com', '$2y$10$P7ZQVGbqMyv97QUt61qXqOhesxZUoe79agtQ.myVEaFh2TFi/Ct42', '6756798322', 'tapsavi society', 'staff_2_1772209907.jpeg', 'active', '2026-02-27 16:27:36', '2026-03-13 06:48:31'),
(3, 'sagar', 'sagar@gmail.com', '$2y$10$b5u1vgIKSa/xMXb5byvONOckk8yC8enZzK88a1/Vrvvi1X0tJCVCi', '9876578908', 'harmony homes sola', 'staff_3_1772209754.jpeg', 'active', '2026-02-27 16:28:13', '2026-03-13 06:48:47'),
(4, 'yash', 'yash@gmail.com', '$2y$10$pyRDSqknfdYvIsYXpPtWpOyHXOqU/6TPO4UicHQEddwHPiC3iqerq', '9632101478', '', '', 'active', '2026-03-13 03:49:59', '2026-03-13 05:03:41');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `admin`
--
ALTER TABLE `admin`
  ADD PRIMARY KEY (`a_id`),
  ADD UNIQUE KEY `email` (`a_email`);

--
-- Indexes for table `cart`
--
ALTER TABLE `cart`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`customer_id`),
  ADD KEY `product_id` (`product_id`);

--
-- Indexes for table `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`category_id`),
  ADD UNIQUE KEY `name` (`category_name`);

--
-- Indexes for table `customers`
--
ALTER TABLE `customers`
  ADD PRIMARY KEY (`customer_id`);

--
-- Indexes for table `offers`
--
ALTER TABLE `offers`
  ADD PRIMARY KEY (`off_id`);

--
-- Indexes for table `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`order_id`),
  ADD KEY `user_id` (`customer_id`);

--
-- Indexes for table `order_items`
--
ALTER TABLE `order_items`
  ADD PRIMARY KEY (`oi_id`),
  ADD KEY `order_id` (`order_id`),
  ADD KEY `product_id` (`product_id`);

--
-- Indexes for table `payments`
--
ALTER TABLE `payments`
  ADD PRIMARY KEY (`p_id`),
  ADD KEY `order_id` (`order_id`),
  ADD KEY `user_id` (`customer_id`);

--
-- Indexes for table `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`product_id`),
  ADD KEY `category_id` (`category_id`);

--
-- Indexes for table `refunds`
--
ALTER TABLE `refunds`
  ADD PRIMARY KEY (`refund_id`),
  ADD KEY `order_id` (`order_id`),
  ADD KEY `customer_id` (`customer_id`);

--
-- Indexes for table `reviews`
--
ALTER TABLE `reviews`
  ADD PRIMARY KEY (`review_id`),
  ADD KEY `user_id` (`customer_id`),
  ADD KEY `product_id` (`product_id`);

--
-- Indexes for table `staff`
--
ALTER TABLE `staff`
  ADD PRIMARY KEY (`staff_id`),
  ADD UNIQUE KEY `staff_email` (`staff_email`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `admin`
--
ALTER TABLE `admin`
  MODIFY `a_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `cart`
--
ALTER TABLE `cart`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=88;

--
-- AUTO_INCREMENT for table `categories`
--
ALTER TABLE `categories`
  MODIFY `category_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT for table `customers`
--
ALTER TABLE `customers`
  MODIFY `customer_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `offers`
--
ALTER TABLE `offers`
  MODIFY `off_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `orders`
--
ALTER TABLE `orders`
  MODIFY `order_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=70;

--
-- AUTO_INCREMENT for table `order_items`
--
ALTER TABLE `order_items`
  MODIFY `oi_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=74;

--
-- AUTO_INCREMENT for table `payments`
--
ALTER TABLE `payments`
  MODIFY `p_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=67;

--
-- AUTO_INCREMENT for table `products`
--
ALTER TABLE `products`
  MODIFY `product_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=70;

--
-- AUTO_INCREMENT for table `refunds`
--
ALTER TABLE `refunds`
  MODIFY `refund_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `reviews`
--
ALTER TABLE `reviews`
  MODIFY `review_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=48;

--
-- AUTO_INCREMENT for table `staff`
--
ALTER TABLE `staff`
  MODIFY `staff_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `cart`
--
ALTER TABLE `cart`
  ADD CONSTRAINT `cart_ibfk_1` FOREIGN KEY (`customer_id`) REFERENCES `customers` (`customer_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `cart_ibfk_2` FOREIGN KEY (`product_id`) REFERENCES `products` (`product_id`) ON DELETE CASCADE;

--
-- Constraints for table `order_items`
--
ALTER TABLE `order_items`
  ADD CONSTRAINT `order_items_ibfk_1` FOREIGN KEY (`order_id`) REFERENCES `orders` (`order_id`) ON DELETE CASCADE,
  ADD CONSTRAINT `order_items_ibfk_2` FOREIGN KEY (`product_id`) REFERENCES `products` (`product_id`) ON DELETE CASCADE;

--
-- Constraints for table `payments`
--
ALTER TABLE `payments`
  ADD CONSTRAINT `fk_payment_customer` FOREIGN KEY (`customer_id`) REFERENCES `customers` (`customer_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `payments_ibfk_1` FOREIGN KEY (`order_id`) REFERENCES `orders` (`order_id`) ON DELETE CASCADE;

--
-- Constraints for table `products`
--
ALTER TABLE `products`
  ADD CONSTRAINT `products_ibfk_1` FOREIGN KEY (`category_id`) REFERENCES `categories` (`category_id`) ON DELETE CASCADE;

--
-- Constraints for table `refunds`
--
ALTER TABLE `refunds`
  ADD CONSTRAINT `refunds_ibfk_1` FOREIGN KEY (`order_id`) REFERENCES `orders` (`order_id`) ON DELETE CASCADE,
  ADD CONSTRAINT `refunds_ibfk_2` FOREIGN KEY (`customer_id`) REFERENCES `customers` (`customer_id`) ON DELETE CASCADE;

--
-- Constraints for table `reviews`
--
ALTER TABLE `reviews`
  ADD CONSTRAINT `reviews_customer_fk` FOREIGN KEY (`customer_id`) REFERENCES `customers` (`customer_id`) ON DELETE CASCADE,
  ADD CONSTRAINT `reviews_ibfk_2` FOREIGN KEY (`product_id`) REFERENCES `products` (`product_id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
