-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Apr 15, 2024 at 05:22 PM
-- Server version: 10.4.27-MariaDB
-- PHP Version: 8.2.0

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `foodordering`
--

-- --------------------------------------------------------

--
-- Table structure for table `customers`
--

CREATE TABLE `customers` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `phone` varchar(15) DEFAULT NULL,
  `address` text NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `isAdmin` tinyint(1) DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `customers`
--

INSERT INTO `customers` (`id`, `name`, `email`, `password`, `phone`, `address`, `created_at`, `isAdmin`) VALUES
(2, 'test new', 'testing@gmail.com', '$2y$10$vLXF6jTGtaHn11/YbzpyWOBdC/B2cBoYECZpAz6.oNedzCKZEQpAm', 'testing123', '0172804751', '2024-04-09 18:54:29', 0),
(3, 'testing new user', 'testemail@gmail.com', '$2y$10$UOmnD4OPjdPCQ8kiFlnM4.PYKMh6rxfijXrzAI/cY5M7nYswgPK5y', '0172804751', '185, Lorong Angsana 5/1, Taman Pinggiran Golf', '2024-04-09 18:59:45', 0),
(4, 'testing new picture', 'testing', '$2y$10$K4I3oSV0fBRC7EbIUI9Aie732SIzQOUAzKESJ2lcu4j68s/kagYD2', '0172804751', '185, Lorong Angsana 5/1, Taman Pinggiran Golf', '2024-04-09 19:09:37', 0),
(7, 'testalert', 'alert@gmail.com', '$2y$10$oKHDwDvhp7Lp3kpWgIWcXurGgfo/UYfeXVkq8EPmJoACTLbYhuEpi', '0172804751', '185, Lorong Angsana 5/1, Taman Pinggiran Golf', '2024-04-09 19:23:18', 0),
(13, 'Syafiq Majid', 'syafiqmajid286@gmail.com', '$2y$10$z2.OYNies8os/1qTYqq8f.5N0mwLylh.CEr/N7cdd1QzPTGhQUAUy', '0172804751', 'asdad', '2024-04-12 14:21:11', 0),
(14, 'testaccount', 'testingacc@gmail.com', '$2y$10$nfQIPStLUJggYQNo.6gOfegt1iaxvPVA9qgKWLlP3UANSVUPHN08G', '123', '123', '2024-04-14 07:22:09', 0),
(18, 'admin fiq', 'admin@gmail.com', '$2y$10$5JD5kIpre8kRGX6dWsqBs.lR0yynbF7N6AElY8NJU3uSQdMhJkpxO', '0172804751', 'asdad', '2024-04-14 15:33:08', 1);

-- --------------------------------------------------------

--
-- Table structure for table `foods`
--

CREATE TABLE `foods` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `description` text DEFAULT NULL,
  `price` decimal(10,2) NOT NULL,
  `category` varchar(255) DEFAULT NULL,
  `image` varchar(255) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `foods`
--

INSERT INTO `foods` (`id`, `name`, `description`, `price`, `category`, `image`, `created_at`) VALUES
(1, 'Margherita Pizza', 'Classic Margherita Pizza with fresh mozzarella cheese, basil, and tomato sauce.', '10.00', 'Pizza', 'margherita.jpg', '2024-04-08 18:40:06'),
(2, 'Pepperoni Pizza', 'Pepperoni Pizza with a crispy crust and a generous amount of pepperoni and cheese.', '12.00', 'Pizza', 'pepperoni.jpg', '2024-04-08 18:40:06'),
(3, 'Caesar Salad', 'Fresh romaine lettuce, croutons, and parmesan cheese tossed in Caesar dressing.', '8.00', 'Salad', 'caesar.jpg', '2024-04-08 18:40:06'),
(4, 'Veggie Burger', 'A delicious and hearty veggie burger loaded with fresh vegetables and beans.', '9.50', 'Burger', 'veggie_burger.jpg', '2024-04-08 18:40:06'),
(5, 'Spaghetti Carbonara', 'Classic Spaghetti Carbonara with eggs, cheese, pancetta, and black pepper.', '11.00', 'Pasta', 'carbonara.jpg', '2024-04-08 18:40:06'),
(6, 'Beef Taco', 'Authentic Mexican beef tacos with salsa, cilantro, onion, and lime.', '3.00', 'Tacos', 'beef_taco.jpg', '2024-04-08 18:40:06'),
(7, 'Chicken Curry', 'Rich and creamy chicken curry made with coconut milk and spices.', '10.50', 'Curry', 'chicken_curry.jpg', '2024-04-08 18:40:06'),
(8, 'Sushi Platter', 'Assorted sushi platter featuring salmon, tuna, and avocado rolls.', '15.00', 'Sushi', 'sushi_platter.jpg', '2024-04-08 18:40:06');

-- --------------------------------------------------------

--
-- Table structure for table `orders`
--

CREATE TABLE `orders` (
  `id` int(11) NOT NULL,
  `customer_id` int(11) NOT NULL,
  `quantity` int(11) DEFAULT 1,
  `order_status` enum('processing','completed') DEFAULT 'processing',
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `customer_name` varchar(255) DEFAULT NULL,
  `table_number` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `orders`
--

INSERT INTO `orders` (`id`, `customer_id`, `quantity`, `order_status`, `created_at`, `updated_at`, `customer_name`, `table_number`) VALUES
(8, 13, 1, '', '2024-04-14 05:32:31', '2024-04-14 05:32:31', 'asdsd', 123),
(9, 13, 1, '', '2024-04-14 07:48:29', '2024-04-14 07:48:29', 'admin fiq', 12),
(10, 14, 1, '', '2024-04-14 10:02:39', '2024-04-14 10:02:39', 'test test', 1),
(11, 14, 1, '', '2024-04-14 10:05:04', '2024-04-14 10:05:04', 'asds', 1),
(12, 14, 1, '', '2024-04-14 10:08:20', '2024-04-14 10:08:20', 'dad', 1),
(13, 14, 1, '', '2024-04-14 10:15:59', '2024-04-14 10:15:59', 'asdasdsad', 12),
(14, 14, 1, '', '2024-04-14 10:22:21', '2024-04-14 10:22:21', 'admin fiq', 12),
(15, 14, 1, '', '2024-04-14 10:29:44', '2024-04-14 10:29:44', 'sadasda', 12),
(16, 14, 1, 'completed', '2024-04-14 10:32:05', '2024-04-15 02:27:12', 'asdasd', 12),
(17, 13, 1, 'completed', '2024-04-15 15:08:11', '2024-04-15 15:10:35', 'admin fiq', 12);

-- --------------------------------------------------------

--
-- Table structure for table `order_items`
--

CREATE TABLE `order_items` (
  `id` int(11) NOT NULL,
  `order_id` int(11) NOT NULL,
  `food_id` int(11) NOT NULL,
  `quantity` int(11) DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `order_items`
--

INSERT INTO `order_items` (`id`, `order_id`, `food_id`, `quantity`) VALUES
(1, 8, 2, 1),
(2, 9, 1, 1),
(3, 10, 1, 1),
(4, 10, 2, 1),
(5, 10, 3, 1),
(6, 11, 1, 1),
(7, 11, 2, 1),
(8, 12, 7, 1),
(9, 13, 3, 1),
(10, 13, 6, 1),
(11, 14, 1, 1),
(12, 14, 2, 1),
(13, 15, 3, 1),
(14, 15, 4, 1),
(15, 16, 4, 1),
(16, 16, 2, 1),
(17, 17, 1, 1),
(18, 17, 2, 1),
(19, 17, 3, 3);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `customers`
--
ALTER TABLE `customers`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `email` (`email`);

--
-- Indexes for table `foods`
--
ALTER TABLE `foods`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`id`),
  ADD KEY `customer_id` (`customer_id`);

--
-- Indexes for table `order_items`
--
ALTER TABLE `order_items`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_order_id` (`order_id`),
  ADD KEY `fk_food_id` (`food_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `customers`
--
ALTER TABLE `customers`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

--
-- AUTO_INCREMENT for table `foods`
--
ALTER TABLE `foods`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `orders`
--
ALTER TABLE `orders`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- AUTO_INCREMENT for table `order_items`
--
ALTER TABLE `order_items`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `orders`
--
ALTER TABLE `orders`
  ADD CONSTRAINT `orders_ibfk_1` FOREIGN KEY (`customer_id`) REFERENCES `customers` (`id`);

--
-- Constraints for table `order_items`
--
ALTER TABLE `order_items`
  ADD CONSTRAINT `fk_food_id` FOREIGN KEY (`food_id`) REFERENCES `foods` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `fk_order_id` FOREIGN KEY (`order_id`) REFERENCES `orders` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `order_items_ibfk_1` FOREIGN KEY (`order_id`) REFERENCES `orders` (`id`),
  ADD CONSTRAINT `order_items_ibfk_2` FOREIGN KEY (`food_id`) REFERENCES `foods` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
