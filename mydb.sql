-- phpMyAdmin SQL Dump
-- version 5.2.3
-- https://www.phpmyadmin.net/
--
-- Host: mariadb
-- Generation Time: Nov 05, 2025 at 12:55 PM
-- Server version: 12.0.2-MariaDB-ubu2404
-- PHP Version: 8.3.26

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `mydb`
--

-- --------------------------------------------------------

--
-- Table structure for table `categories`
--

CREATE TABLE `categories` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `description` text DEFAULT NULL,
  `image_url` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_uca1400_ai_ci COMMENT='Lưu trữ các nhóm sản phẩm (danh mục)';

--
-- Dumping data for table `categories`
--

INSERT INTO `categories` (`id`, `name`, `description`, `image_url`) VALUES
(1, 'Điện tử', 'Điện thoại, Laptop, Phụ kiện', 'https://picsum.photos/seed/electronics/400/300'),
(2, 'Sách', 'Sách khoa học, tiểu thuyết, truyện tranh', 'https://picsum.photos/seed/books/400/300'),
(3, 'Thời trang', 'Quần, Áo, Giày dép', 'https://picsum.photos/seed/clothing/400/300');

-- --------------------------------------------------------

--
-- Table structure for table `orders`
--

CREATE TABLE `orders` (
  `id` int(11) NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `customer_name` varchar(255) NOT NULL,
  `customer_phone` varchar(20) NOT NULL,
  `shipping_address` text NOT NULL,
  `total_amount` decimal(10,2) NOT NULL,
  `status` enum('pending','confirmed','packing','shipped','delivered','canceled') NOT NULL DEFAULT 'pending',
  `cod_code` varchar(100) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_uca1400_ai_ci COMMENT='Lưu thông tin chính của đơn hàng';

--
-- Dumping data for table `orders`
--

INSERT INTO `orders` (`id`, `user_id`, `customer_name`, `customer_phone`, `shipping_address`, `total_amount`, `status`, `cod_code`, `created_at`, `updated_at`) VALUES
(1, NULL, 'linh', '213456', 'tn', 15000000.00, 'pending', NULL, '2025-11-05 12:42:41', '2025-11-05 12:42:41'),
(2, NULL, 'linh', '0123456789', 'tn', 15000000.00, 'pending', NULL, '2025-11-05 12:42:52', '2025-11-05 12:42:52'),
(3, 2, 'Phạm Khắc Linh', '0123456789', 'tn', 15000000.00, 'pending', NULL, '2025-11-05 12:44:11', '2025-11-05 12:44:11'),
(4, NULL, 'Phạm Khắc Linh', '0123456789', 'tn', 15000000.00, 'pending', NULL, '2025-11-05 12:54:15', '2025-11-05 12:54:15');

-- --------------------------------------------------------

--
-- Table structure for table `order_items`
--

CREATE TABLE `order_items` (
  `id` int(11) NOT NULL,
  `order_id` int(11) NOT NULL,
  `product_id` int(11) DEFAULT NULL,
  `quantity` int(11) NOT NULL,
  `price_per_unit` decimal(10,2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_uca1400_ai_ci COMMENT='Lưu chi tiết các sản phẩm trong một đơn hàng';

--
-- Dumping data for table `order_items`
--

INSERT INTO `order_items` (`id`, `order_id`, `product_id`, `quantity`, `price_per_unit`) VALUES
(1, 1, 1, 1, 15000000.00),
(2, 2, 1, 1, 15000000.00),
(3, 3, 1, 1, 15000000.00),
(4, 4, 1, 1, 15000000.00);

-- --------------------------------------------------------

--
-- Table structure for table `products`
--

CREATE TABLE `products` (
  `id` int(11) NOT NULL,
  `category_id` int(11) DEFAULT NULL,
  `name` varchar(255) NOT NULL,
  `description` text DEFAULT NULL,
  `price` decimal(10,2) NOT NULL,
  `stock_quantity` int(11) NOT NULL DEFAULT 0,
  `image_url` varchar(255) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_uca1400_ai_ci COMMENT='Lưu trữ thông tin chi tiết các sản phẩm';

--
-- Dumping data for table `products`
--

INSERT INTO `products` (`id`, `category_id`, `name`, `description`, `price`, `stock_quantity`, `image_url`, `created_at`) VALUES
(1, 1, 'Smartphone X1', 'Điện thoại thông minh flagship 2025', 15000000.00, 50, '/images/smartphone.jpg', '2025-11-05 11:02:51'),
(2, 1, 'Laptop Pro 15', 'Laptop 15-inch, 32GB RAM, 1TB SSD', 32000000.00, 25, '/images/laptop-pro.jpg', '2025-11-05 11:02:51'),
(3, 1, 'Tai nghe không dây', 'Tai nghe khử ồn chủ động, pin 24h', 2500000.00, 100, '/images/tai-nghe.jpg', '2025-11-05 11:02:51'),
(4, 2, 'Sách Lập trình SQL', 'Từ cơ bản đến nâng cao về MariaDB', 220000.00, 150, '/images/sach-sql.jpg', '2025-11-05 11:02:51'),
(5, 3, 'Áo thun Trơn (Đen)', 'Áo thun cotton 100% màu đen', 180000.00, 200, '/images/ao-thun-den.jpg', '2025-11-05 11:02:51'),
(6, 3, 'Quần Jeans Xanh', 'Quần jeans nam ống đứng', 450000.00, 80, '/images/quan-jeans.jpg', '2025-11-05 11:02:51'),
(7, 2, 'Tiểu thuyết \"Nhà Giả Kim\"', 'Một cuốn sách hay', 120000.00, 300, '/images/nha-gia-kim.jpg', '2025-11-05 11:02:51');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `username` varchar(100) NOT NULL,
  `password_hash` varchar(255) NOT NULL,
  `full_name` varchar(255) DEFAULT NULL,
  `role` enum('customer','admin') NOT NULL DEFAULT 'customer',
  `created_at` timestamp NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_uca1400_ai_ci COMMENT='Lưu trữ thông tin người dùng và admin';

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `username`, `password_hash`, `full_name`, `role`, `created_at`) VALUES
(1, 'admin', 'admin123', 'Quản Trị Viên', 'admin', '2025-11-05 11:03:25'),
(2, 'customer', '123', 'Khách Hàng A', 'customer', '2025-11-05 11:03:25');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `name` (`name`);

--
-- Indexes for table `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`user_id`);

--
-- Indexes for table `order_items`
--
ALTER TABLE `order_items`
  ADD PRIMARY KEY (`id`),
  ADD KEY `order_id` (`order_id`),
  ADD KEY `product_id` (`product_id`);

--
-- Indexes for table `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`id`),
  ADD KEY `category_id` (`category_id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `username` (`username`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `categories`
--
ALTER TABLE `categories`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `orders`
--
ALTER TABLE `orders`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `order_items`
--
ALTER TABLE `order_items`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `products`
--
ALTER TABLE `products`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `orders`
--
ALTER TABLE `orders`
  ADD CONSTRAINT `orders_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE SET NULL;

--
-- Constraints for table `order_items`
--
ALTER TABLE `order_items`
  ADD CONSTRAINT `order_items_ibfk_1` FOREIGN KEY (`order_id`) REFERENCES `orders` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `order_items_ibfk_2` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE SET NULL;

--
-- Constraints for table `products`
--
ALTER TABLE `products`
  ADD CONSTRAINT `products_ibfk_1` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
