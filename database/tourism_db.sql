-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Apr 29, 2024 at 05:32 AM
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
-- Database: `tourism_db`
--

-- --------------------------------------------------------

--
-- Table structure for table `book_list`
--

CREATE TABLE `book_list` (
  `id` int(30) NOT NULL,
  `user_id` int(30) NOT NULL,
  `package_id` int(30) NOT NULL,
  `status` tinyint(4) NOT NULL DEFAULT 0 COMMENT '0=pending,1=confirm, 2=cancelled\r\n',
  `schedule` date DEFAULT NULL,
  `date_created` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `book_list`
--

INSERT INTO `book_list` (`id`, `user_id`, `package_id`, `status`, `schedule`, `date_created`) VALUES
(2, 4, 8, 3, '2021-06-21', '2021-06-19 08:37:59'),
(3, 5, 8, 3, '2021-06-18', '2021-06-19 11:51:50'),
(4, 6, 7, 0, '2024-04-30', '2024-04-29 09:01:04');

-- --------------------------------------------------------

--
-- Table structure for table `inquiry`
--

CREATE TABLE `inquiry` (
  `id` int(30) NOT NULL,
  `name` text DEFAULT NULL,
  `email` text DEFAULT NULL,
  `subject` varchar(250) NOT NULL,
  `message` text DEFAULT NULL,
  `status` tinyint(4) NOT NULL DEFAULT 0,
  `date_created` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `inquiry`
--

INSERT INTO `inquiry` (`id`, `name`, `email`, `subject`, `message`, `status`, `date_created`) VALUES
(6, 'asdasd', 'asdasd@asdasd.com', 'asdasd', 'asdasd', 1, '2021-06-19 10:19:27');

-- --------------------------------------------------------

--
-- Table structure for table `packages`
--

CREATE TABLE `packages` (
  `id` int(30) NOT NULL,
  `title` text DEFAULT NULL,
  `tour_location` text DEFAULT NULL,
  `cost` double NOT NULL,
  `description` text DEFAULT NULL,
  `upload_path` text DEFAULT NULL,
  `status` tinyint(4) NOT NULL DEFAULT 1 COMMENT '1 =active ,2 = Inactive',
  `date_created` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `packages`
--

INSERT INTO `packages` (`id`, `title`, `tour_location`, `cost`, `description`, `upload_path`, `status`, `date_created`) VALUES
(1, 'Taj Mahal, Agra, Uttar Pradesh', 'Agra, India', 6000, '&lt;p style=&quot;margin-right: 0px; margin-bottom: 15px; margin-left: 0px; padding: 0px; text-align: justify;&quot;&gt;&lt;font color=&quot;#000000&quot; face=&quot;Open Sans, Arial, sans-serif&quot;&gt;Traveling to the Taj Mahal is a journey into the heart of India&#039;s rich history and architectural splendor. This iconic monument, situated in Agra, Uttar Pradesh, is a masterpiece of Mughal architecture, commissioned by Emperor Shah Jahan in the 17th century as a tribute to his beloved wife, Mumtaz Mahal. Upon arriving at the site, visitors are immediately struck by the sheer grandeur of the white marble mausoleum, which glistens in the sunlight and takes on a magical hue during sunrise and sunset. The journey to the Taj Mahal can be made by various means, including by train, car, or air, with convenient connections from major Indian cities like Delhi. Once in Agra, a bustling city with a unique blend of modernity and tradition, travelers can explore the surrounding areas, which offer a range of hotels, markets, and other historical sites. Walking through the beautifully landscaped gardens that lead to the Taj Mahal, visitors can sense the romance and devotion that inspired its construction. The intricate carvings, calligraphy, and symmetrical design elements create a sense of harmony and balance that is unique to this site. As visitors move closer to the main structure, they can admire the detailed inlay work with precious and semi-precious stones, and the serene interior where the cenotaphs of Shah Jahan and Mumtaz Mahal rest.&lt;/font&gt;&lt;br&gt;&lt;/p&gt;', 'uploads/package_1', 1, '2021-06-18 10:31:03'),
(7, 'GateWay Of India, Mumbai, India', 'Mumbai, India', 8000, '&lt;p style=&quot;text-align: justify; &quot;&gt;&lt;font color=&quot;#000000&quot; face=&quot;Open Sans, Arial, sans-serif&quot;&gt;The Gateway of India is one of Mumbai&#039;s most iconic landmarks, located on the waterfront in the Colaba district. Built during the British colonial era, this grand structure was completed in 1924 to commemorate the visit of King George V and Queen Mary to India in 1911. The design blends Hindu and Islamic architectural styles, featuring an archway with intricate carvings and domes flanking its central structure. A tour of the Gateway of India often begins with its impressive architecture. You can explore the detailed carvings and the vast courtyard where the monument stands, overlooking the Arabian Sea. The site has a lively atmosphere, with tourists, locals, vendors, and photographers often milling around. From the Gateway of India, you can take a boat ride to Elephanta Island, known for its ancient cave temples. These caves feature rock-cut sculptures and are a UNESCO World Heritage site. The boat ride itself offers stunning views of Mumbai&#039;s skyline and the Arabian Sea. As you explore the area, you might also visit the nearby Taj Mahal Palace Hotel, another iconic structure with a rich history. It is renowned for its architectural beauty and as a symbol of Mumbai&#039;s resilience following the 2008 terror attacks. Your tour could include a visit to the surrounding Colaba district, known for its eclectic mix of shops, restaurants, and cafes. Here, you can experience the vibrant culture of Mumbai and perhaps try some local cuisine.&lt;/font&gt;&lt;br&gt;&lt;/p&gt;', 'uploads/package_7', 1, '2021-06-18 11:17:11'),
(8, 'Hawa Mahal, Jaipur, Rajasthan', 'Jaipur, India', 7000, '&lt;p style=&quot;text-align: justify; &quot;&gt;&lt;font color=&quot;#000000&quot; face=&quot;Open Sans, Arial, sans-serif&quot;&gt;Hawa Mahal, also known as the &quot;Palace of Winds,&quot; is a stunning architectural landmark located in Jaipur, Rajasthan. It is a five-story palace with an iconic fa&ccedil;ade that features 953 small windows, known as jharokhas, each with intricate latticework and delicate designs. Built in 1799 by Maharaja Sawai Pratap Singh, Hawa Mahal is a remarkable example of Rajput architecture, designed to resemble the crown of the Hindu god Krishna. The unique design of Hawa Mahal was intended to allow royal ladies to observe the lively streets of Jaipur without being seen, maintaining their privacy while following the practice of purdah. The latticework and small windows allowed cool air to flow through the structure, creating a natural air-conditioning effect, which was particularly beneficial during Jaipur&#039;s hot summers. Hawa Mahal&#039;s structure is shaped like a honeycomb and rises dramatically from the road. Its reddish-pink sandstone walls give the palace its distinctive color, contributing to Jaipur&#039;s nickname as the &quot;Pink City.&quot; Each floor has a different style, with the upper floors providing views of the city and the nearby City Palace. Visitors can climb to the top of Hawa Mahal, where they can enjoy panoramic views of Jaipur and its surrounding areas. The structure is open to the public, and the narrow passages and stairways offer a sense of exploration as you ascend through the building. Hawa Mahal is a popular tourist attraction, admired for its beauty, historical significance, and architectural innovation. It is often photographed, especially at sunrise when the pink hues of the palace glow in the morning light. As one of Jaipur&#039;s most famous landmarks, Hawa Mahal is a must-visit destination for anyone exploring the rich history and culture of Rajasthan.&lt;/font&gt;&lt;br&gt;&lt;/p&gt;', 'uploads/package_8', 1, '2021-06-18 13:34:08');

-- --------------------------------------------------------

--
-- Table structure for table `rate_review`
--

CREATE TABLE `rate_review` (
  `id` int(30) NOT NULL,
  `user_id` int(30) NOT NULL,
  `package_id` int(30) NOT NULL,
  `rate` int(11) NOT NULL,
  `review` text DEFAULT NULL,
  `date_created` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `system_info`
--

CREATE TABLE `system_info` (
  `id` int(30) NOT NULL,
  `meta_field` text NOT NULL,
  `meta_value` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `system_info`
--

INSERT INTO `system_info` (`id`, `meta_field`, `meta_value`) VALUES
(1, 'name', 'Smart Travel Hub'),
(6, 'short_name', 'Smart Travel Hub'),
(11, 'logo', 'uploads/1714360740_Screenshot 2024-04-29 001432.png'),
(13, 'user_avatar', 'uploads/user_avatar.jpg'),
(14, 'cover', 'uploads/1714360740_travel-concept-with-landmarks.jpg');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(50) NOT NULL,
  `firstname` varchar(250) NOT NULL,
  `lastname` varchar(250) NOT NULL,
  `username` text NOT NULL,
  `password` text NOT NULL,
  `avatar` text DEFAULT NULL,
  `last_login` datetime DEFAULT NULL,
  `type` tinyint(1) NOT NULL DEFAULT 0,
  `date_added` datetime NOT NULL DEFAULT current_timestamp(),
  `date_updated` datetime DEFAULT NULL ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `firstname`, `lastname`, `username`, `password`, `avatar`, `last_login`, `type`, `date_added`, `date_updated`) VALUES
(1, 'Adminstrator', 'Admin', 'admin', '0192023a7bbd73250516f069df18b500', 'uploads/1714360740_passport-photo-shubham.jpg', NULL, 1, '2021-01-20 14:02:37', '2024-04-29 08:49:08'),
(4, 'John', 'Smith', 'jsmith', '1254737c076cf867dc53d60a0364f38e', NULL, NULL, 0, '2021-06-19 08:36:09', '2021-06-19 10:53:12'),
(5, 'Claire', 'Blake', 'cblake', '4744ddea876b11dcb1d169fadf494418', NULL, NULL, 0, '2021-06-19 10:01:51', '2021-06-19 12:03:23'),
(6, 'Shubham', 'Bawankar', 'Shubham19', '42f7b431c479d33e781fb0c8968765f1', NULL, NULL, 0, '2024-04-29 09:00:43', NULL);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `book_list`
--
ALTER TABLE `book_list`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `inquiry`
--
ALTER TABLE `inquiry`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `packages`
--
ALTER TABLE `packages`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `rate_review`
--
ALTER TABLE `rate_review`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `system_info`
--
ALTER TABLE `system_info`
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
-- AUTO_INCREMENT for table `book_list`
--
ALTER TABLE `book_list`
  MODIFY `id` int(30) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `inquiry`
--
ALTER TABLE `inquiry`
  MODIFY `id` int(30) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `packages`
--
ALTER TABLE `packages`
  MODIFY `id` int(30) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `rate_review`
--
ALTER TABLE `rate_review`
  MODIFY `id` int(30) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `system_info`
--
ALTER TABLE `system_info`
  MODIFY `id` int(30) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(50) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
