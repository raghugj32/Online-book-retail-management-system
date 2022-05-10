-- phpMyAdmin SQL Dump
-- version 5.1.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Mar 26, 2022 at 11:00 AM
-- Server version: 10.4.18-MariaDB
-- PHP Version: 7.3.27

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `book_store`
--

-- --------------------------------------------------------

--
-- Table structure for table `cart`
--

CREATE TABLE `cart` (
  `cart_id` int(11) NOT NULL,
  `total_cost` float NOT NULL,
  `customer_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `quantity` int(5) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `feedback`
--

CREATE TABLE `feedback` (
  `feedback_id` int(11) NOT NULL,
  `feed_desc` varchar(110) NOT NULL,
  `rating` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `customer_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `feedback`
--

INSERT INTO `feedback` (`feedback_id`, `feed_desc`, `rating`, `product_id`, `customer_id`) VALUES
(1, 'nic product', 100, 2, 1),
(3, 'good', 100, 6, 1),
(4, '', 100, 6, 1),
(5, 'It was a great book,I will suggest this book to learn queries', 91, 2, 1),
(6, 'python snippets are easy to understand', 94, 4, 1),
(7, 'great book by the way, all the modules are very easy to learn', 64, 5, 1);

-- --------------------------------------------------------

--
-- Table structure for table `orders`
--

CREATE TABLE `orders` (
  `id` int(15) NOT NULL,
  `product_id` int(11) NOT NULL,
  `product_name` varchar(255) NOT NULL,
  `product_desc` varchar(255) NOT NULL,
  `price` int(10) NOT NULL,
  `units` int(5) NOT NULL,
  `total` int(15) NOT NULL,
  `date` timestamp NOT NULL DEFAULT current_timestamp(),
  `email` varchar(255) NOT NULL,
  `customer_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `orders`
--

INSERT INTO `orders` (`id`, `product_id`, `product_name`, `product_desc`, `price`, `units`, `total`, `date`, `email`, `customer_id`) VALUES
(1, 2, 'python', 'for programming', 600, 1, 600, '2022-01-15 08:57:48', '', 1),
(2, 2, 'python', 'for programming', 600, 1, 600, '2022-01-15 10:55:57', '', 1),
(3, 2, 'python', 'for programming', 600, 1, 600, '2022-01-16 17:02:11', '', 1),
(4, 2, 'dbms', 'book', 800, 1, 800, '2022-01-16 17:02:11', '', 1),
(5, 2, 'java', 'book', 500, 1, 500, '2022-01-16 17:02:11', '', 1),
(6, 2, 'python', 'for programming', 600, 1, 600, '2022-01-17 10:30:38', '', 1),
(7, 2, 'python', 'for programming', 600, 1, 600, '2022-01-18 14:22:24', '', 1),
(8, 2, 'java', 'book', 500, 1, 500, '2022-01-18 14:22:24', '', 1),
(9, 2, 'python', 'for programming', 600, 1, 600, '2022-01-22 06:11:52', '', 1),
(10, 2, 'java', 'book', 500, 1, 500, '2022-01-22 06:11:52', '', 1),
(11, 2, 'dbms', 'book', 800, 1, 800, '2022-01-29 16:48:33', '', 1),
(12, 2, 'ooc', 'give', 1000, 1, 1000, '2022-01-29 18:11:04', '', 1),
(13, 2, 'DBMS', 'sql queries\r\n', 600, 4, 2400, '2022-02-11 06:28:06', '', 1),
(14, 2, 'PHYSIOTHERAPY', 'book', 2000, 1, 2000, '2022-02-11 06:28:06', '', 1),
(15, 2, 'SOFTWARE ENGINEERING', 'book', 900, 1, 900, '2022-02-11 06:28:06', '', 1);

-- --------------------------------------------------------

--
-- Table structure for table `products`
--

CREATE TABLE `products` (
  `id` int(11) NOT NULL,
  `product_name` varchar(60) NOT NULL,
  `product_desc` tinytext NOT NULL,
  `product_img_name` varchar(60) NOT NULL,
  `qty` int(5) NOT NULL,
  `price` decimal(10,2) NOT NULL,
  `department` varchar(25) NOT NULL,
  `category` varchar(25) NOT NULL,
  `customer_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `products`
--

INSERT INTO `products` (`id`, `product_name`, `product_desc`, `product_img_name`, `qty`, `price`, `department`, `category`, `customer_id`) VALUES
(2, 'DBMS', 'sql queries\r\n', 'dbms.jpg', 6, '600.00', 'is', 'engineering', 1),
(3, 'JAVA', 'book', 'java.jpg', 10, '500.00', 'ise', 'engineering', 1),
(4, 'PYTHON', 'book', 'python.jpg', 10, '500.00', 'ise', 'engineering', 1),
(5, 'MEDICAL PHYSIOLOGY', 'book', 'md2.jpg', 10, '500.00', 'physiology', 'medical', 1),
(6, 'MEDICAL AND HEALTH CARE', 'book', 'md1.jpg', 10, '800.00', 'health care', 'medical', 1),
(7, 'PHYSIOTHERAPY', 'book', 'md4.jpg', 9, '2000.00', 'physiotherapy', 'medical', 1),
(9, 'SOFTWARE ENGINEERING', 'book', 'se.jpg', 9, '900.00', 'ise', 'engineering', 1);

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `fname` varchar(255) NOT NULL,
  `lname` varchar(255) NOT NULL,
  `address` varchar(255) NOT NULL,
  `city` varchar(100) NOT NULL,
  `pin` int(6) NOT NULL,
  `email` varchar(255) NOT NULL,
  `password` varchar(15) NOT NULL,
  `contact` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `fname`, `lname`, `address`, `city`, `pin`, `email`, `password`, `contact`) VALUES
(1, 'SAGAR ', 'GOWDA', 'THIRTHAHALLI', 'SHIMOGA', 577415, 'sagar@gmail.com', '123', 0);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `cart`
--
ALTER TABLE `cart`
  ADD PRIMARY KEY (`cart_id`),
  ADD KEY `cc_ci` (`customer_id`),
  ADD KEY `pp_pi` (`product_id`);

--
-- Indexes for table `feedback`
--
ALTER TABLE `feedback`
  ADD PRIMARY KEY (`feedback_id`),
  ADD KEY `cc_ci2` (`customer_id`),
  ADD KEY `pp_pi1` (`product_id`);

--
-- Indexes for table `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`id`),
  ADD KEY `cc_ci4` (`customer_id`),
  ADD KEY `pp_pi4` (`product_id`);

--
-- Indexes for table `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`id`),
  ADD KEY `cc_ci3` (`customer_id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `cart`
--
ALTER TABLE `cart`
  MODIFY `cart_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT for table `feedback`
--
ALTER TABLE `feedback`
  MODIFY `feedback_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `orders`
--
ALTER TABLE `orders`
  MODIFY `id` int(15) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT for table `products`
--
ALTER TABLE `products`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `cart`
--
ALTER TABLE `cart`
  ADD CONSTRAINT `cc_ci` FOREIGN KEY (`customer_id`) REFERENCES `users` (`id`),
  ADD CONSTRAINT `pp_pi` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`);

--
-- Constraints for table `feedback`
--
ALTER TABLE `feedback`
  ADD CONSTRAINT `cc_ci2` FOREIGN KEY (`customer_id`) REFERENCES `users` (`id`),
  ADD CONSTRAINT `pp_pi1` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`);

--
-- Constraints for table `orders`
--
ALTER TABLE `orders`
  ADD CONSTRAINT `cc_ci4` FOREIGN KEY (`customer_id`) REFERENCES `users` (`id`),
  ADD CONSTRAINT `pp_pi4` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`);

--
-- Constraints for table `products`
--
ALTER TABLE `products`
  ADD CONSTRAINT `cc_ci3` FOREIGN KEY (`customer_id`) REFERENCES `users` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
