-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Oct 21, 2023 at 06:04 PM
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
-- Database: `smartbakers`
--

-- --------------------------------------------------------

--
-- Table structure for table `active_user`
--

CREATE TABLE `active_user` (
  `user_id` int(11) NOT NULL,
  `user_name` text NOT NULL,
  `user_email` text NOT NULL,
  `user_password` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `admin_add_role`
--

CREATE TABLE `admin_add_role` (
  `id` int(11) NOT NULL,
  `name` text NOT NULL,
  `email` text NOT NULL,
  `password` text NOT NULL,
  `user-role` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `admin_add_role`
--

INSERT INTO `admin_add_role` (`id`, `name`, `email`, `password`, `user-role`) VALUES
(1, 'Abdul Rehman ', 'abdulrehman@vision-tech.co', '037865', 'PRODUCT MANAGER');

-- --------------------------------------------------------

--
-- Table structure for table `attribute`
--

CREATE TABLE `attribute` (
  `id` int(11) NOT NULL,
  `attribute_name` text NOT NULL,
  `attribute_price` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `attribute`
--

INSERT INTO `attribute` (`id`, `attribute_name`, `attribute_price`) VALUES
(1, 'small', '50'),
(2, 'medium', '90'),
(3, 'large', '140');

-- --------------------------------------------------------

--
-- Table structure for table `get_documents`
--

CREATE TABLE `get_documents` (
  `user_id` text NOT NULL,
  `user_email` varchar(255) NOT NULL,
  `user_documents_img` text NOT NULL,
  `user_document_slect` text NOT NULL,
  `id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `get_documents`
--

INSERT INTO `get_documents` (`user_id`, `user_email`, `user_documents_img`, `user_document_slect`, `id`) VALUES
('5', 'abdulrehman1@gmail.com', 'file:///data/user/0/com.smartbakers/cache/rn_image_picker_lib_temp_474709e7-d27a-41a1-8999-a35243e34b54.jpg', 'Driving Lisence', 2),
('6', 'qaimahmed@gmail.com', 'file:///data/user/0/com.smartbakers/cache/rn_image_picker_lib_temp_61880d78-f332-4c48-849c-37ec360c50d8.jpg', 'Driving Lisence', 5),
('15', 'abc@gmail.com', 'file:///Users/syednaqiraza/Library/Developer/CoreSimulator/Devices/8F63C1B3-1949-4EE7-BDC7-C5D6A8E7E301/data/Containers/Data/Application/AB55628E-F964-4188-8637-99BC4949FCD9/tmp/747F0BE5-79D7-4AA2-B675-6C2CBCA0A986.jpg', 'Passport', 6),
('22', 'test@gmail.com', 'file:///Users/syednaqiraza/Library/Developer/CoreSimulator/Devices/8F63C1B3-1949-4EE7-BDC7-C5D6A8E7E301/data/Containers/Data/Application/AB55628E-F964-4188-8637-99BC4949FCD9/tmp/7705B093-6821-44F6-B6EF-BA1A68FEB394.jpg', 'Driving Licence', 7),
('23', 'asjfhgksaf', 'file:///Users/syednaqiraza/Library/Developer/CoreSimulator/Devices/8F63C1B3-1949-4EE7-BDC7-C5D6A8E7E301/data/Containers/Data/Application/AB55628E-F964-4188-8637-99BC4949FCD9/tmp/8BB5ADA9-0DC7-485C-A96E-C6D2FEAEAAB6.jpg', 'Passport', 8),
('', '', '/Users/syednaqiraza/Library/Developer/CoreSimulator/Devices/8F63C1B3-1949-4EE7-BDC7-C5D6A8E7E301/data/Containers/Data/Application/B0036F7B-23A1-4A57-868F-EFE642619645/tmp/react-native-image-crop-picker/8FED9969-6E1D-439B-A52D-E84D12D2CDBF.jpg', 'Passport', 9);

-- --------------------------------------------------------

--
-- Table structure for table `offer`
--

CREATE TABLE `offer` (
  `id` int(11) NOT NULL,
  `product_name` text NOT NULL,
  `product_price` text NOT NULL,
  `product_imge` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `orderspage`
--

CREATE TABLE `orderspage` (
  `user_name` text NOT NULL,
  `user_email` text NOT NULL,
  `products_name` text NOT NULL,
  `product_image_url` text NOT NULL,
  `product_price` text NOT NULL,
  `paymentStatus` text NOT NULL,
  `user_location` text NOT NULL,
  `quantity` text NOT NULL,
  `user_phoneno` text NOT NULL,
  `user_id` text NOT NULL,
  `orderStatus` text NOT NULL,
  `seller_email` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `orderspage`
--

INSERT INTO `orderspage` (`user_name`, `user_email`, `products_name`, `product_image_url`, `product_price`, `paymentStatus`, `user_location`, `quantity`, `user_phoneno`, `user_id`, `orderStatus`, `seller_email`) VALUES
('Abc', 'abc@gmail.com', '\"[\\\"Diet Coke\\\"]\"', '\"[\\\"1691596391618-dietcoke.jpg\\\"]\"', '\"[\\\"100\\\"]\"', 'Paid', 'Ava ujfkshjafgoas', '\"[1]\"', '9876543', '15', 'Pending', ''),
('Abc', 'abc@gmail.com', '\"[\\\"Diet Coke\\\"]\"', '\"[\\\"1691596391618-dietcoke.jpg\\\"]\"', '\"[\\\"100\\\"]\"', 'Paid', 'Ava ujfkshjafgoas', '\"[1]\"', '9876543', '15', 'Pending', ''),
('Abc', 'abc@gmail.com', '\"[\\\"Cream Deluxe Machine\\\",\\\"Pure Cane Caster Sugar\\\"]\"', '\"[\\\"1691596568540-five.jpg\\\",\\\"1691596499324-eighte.jpg\\\"]\"', '\"[\\\"250\\\",\\\"120\\\"]\"', 'Paid', 'Ava ujfkshjafgoas', '\"[1,1]\"', '9876543', '15', 'Pending', 'arehmanaslam579@gmail.com'),
('Abc', 'abc@gmail.com', '\"[\\\"Cream Deluxe Machine\\\",\\\"Pure Cane Caster Sugar\\\",\\\"SmartWhipe silver\\\"]\"', '\"[\\\"1691596568540-five.jpg\\\",\\\"1691596499324-eighte.jpg\\\",\\\"1691596735820-one.jpg\\\"]\"', '\"[\\\"250\\\",\\\"120\\\",\\\"200\\\"]\"', 'Paid', 'Ava ujfkshjafgoas', '\"[1,1,1]\"', '9876543', '15', 'Pending', 'arehmanaslam579@gmail.com'),
('Abc', 'abc@gmail.com', '\"[\\\"Coco Cola Cane\\\"]\"', '\"[\\\"1691597206934-1.jpeg\\\"]\"', '\"[\\\"80\\\"]\"', 'Paid', 'Ava ujfkshjafgoas', '\"[1]\"', '9876543', '15', 'Pending', 'arehmanaslam579@gmail.com'),
('Abc', 'abc@gmail.com', '\"[\\\"Cream Deluxe Horse Power Spray\\\"]\"', '\"[\\\"1691597052783-three.jpg\\\"]\"', '\"[\\\"230\\\"]\"', 'Paid', 'Ava ujfkshjafgoas', '\"[1]\"', '9876543', '15', 'Pending', 'arehmanaslam579@gmail.com'),
('Abc', 'abc@gmail.com', '\"[\\\"Diet Coke\\\"]\"', '\"[\\\"1691596391618-dietcoke.jpg\\\"]\"', '\"[\\\"100\\\"]\"', 'Paid', 'Ava ujfkshjafgoas', '\"[1]\"', '9876543', '15', 'Pending', 'arehmanaslam579@gmail.com'),
('Abc', 'abc@gmail.com', '\"[\\\"Pure Cane Caster Sugar\\\"]\"', '\"[\\\"1691596499324-eighte.jpg\\\"]\"', '\"[\\\"120\\\"]\"', 'Paid', 'Ava ujfkshjafgoas', '\"[1]\"', '9876543', '15', 'Pending', 'arehmanaslam579@gmail.com'),
('Abc', 'abc@gmail.com', '\"[\\\"Cream Deluxe Gold \\\"]\"', '\"[\\\"1691596628194-four.jpg\\\"]\"', '\"[\\\"250\\\"]\"', 'Paid', 'Ava ujfkshjafgoas', '\"[1]\"', '9876543', '15', 'Pending', 'arehmanaslam579@gmail.com'),
('Abc', 'abc@gmail.com', '\"[\\\"Cream Deluxe Gold \\\"]\"', '\"[\\\"1691596628194-four.jpg\\\"]\"', '\"[\\\"250\\\"]\"', 'Paid', 'Ava ujfkshjafgoas', '\"[1]\"', '9876543', '15', 'Pending', 'arehmanaslam579@gmail.com');

-- --------------------------------------------------------

--
-- Table structure for table `orderstable`
--

CREATE TABLE `orderstable` (
  `user_id` varchar(255) NOT NULL,
  `user_name` varchar(255) NOT NULL,
  `user_email` varchar(255) NOT NULL,
  `user_phoneno` varchar(50) NOT NULL,
  `product_image` text NOT NULL,
  `product_price` varchar(50) NOT NULL,
  `user_location` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `orderstable`
--

INSERT INTO `orderstable` (`user_id`, `user_name`, `user_email`, `user_phoneno`, `product_image`, `product_price`, `user_location`) VALUES
('1', 'Abdul Rehman', 'abdulrehman@gmail.com', '03245580849', 'https://5474-39-50-151-239.ngrok-free.app/uploads/1691596568540-five.jpg', '80', 'Lyari Karachi'),
('', 'Abdul Rehman', 'abdulrehman@gmail.com', '03245580849', '1691596391618-dietcoke.jpg', '100', 'lyari karachi'),
('', 'Abdul Rehman', 'abdulrehman@gmail.com', '03245580849', '1691597206934-1.jpeg', '80', 'lyari karachi'),
('3', 'Abdul Rehman', 'abdulrehman@gmail.com', '03245580849', '1691596568540-five.jpg', '250', 'lyari karachi'),
('3', 'Abdul Rehman', 'abdulrehman@gmail.com', '03245580849', '1691596568540-five.jpg', '250', 'lyari karachi');

-- --------------------------------------------------------

--
-- Table structure for table `product`
--

CREATE TABLE `product` (
  `id` int(11) NOT NULL,
  `name` varchar(50) NOT NULL,
  `price` varchar(50) NOT NULL,
  `sell_price` varchar(50) NOT NULL,
  `productStatus` varchar(50) NOT NULL,
  `image_url` text NOT NULL,
  `stock` varchar(50) NOT NULL,
  `description` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `product`
--

INSERT INTO `product` (`id`, `name`, `price`, `sell_price`, `productStatus`, `image_url`, `stock`, `description`) VALUES
(88, 'Diet Coke', '100', '100', 'Avaliable', '1691596391618-dietcoke.jpg', 'Unlimited', 'Diet Coke (also branded as Coca-Cola Light, Coca-Cola Diet or Coca-Cola Light Taste) is a sugar-free and low-calorie soft drink produced and distributed by the Coca-Cola Company. It contains artificial sweeteners instead of sugar.\r\n'),
(89, 'Pure Cane Caster Sugar', '120', '120', 'Avaliable', '1691596499324-eighte.jpg', 'unlimited', 'Tate and Lyle Caster is a fine pure cane sugar which dissolves quickly and is ideal for all sorts of baking. It\'s perfect for adding volume to cake mixtures and creating light sponges.'),
(90, 'Elmlea cream squirty', '80', '80', 'Avaliable', '1691596529228-eleven.jpg', 'Limited', 'It has 36% less fat than fresh whipping cream† so feel free to add a touch to your favourite pudding, to top your trifle, cheer up your cheesecake or perk up a pie. A small squirt is also very scrummy on top of you coffee, hot chocolate or milkshake.'),
(91, 'Cream Deluxe Machine', '250', '250', 'Avaliable', '1691596568540-five.jpg', 'unlimited', 'The Ninja Creami Deluxe has 11 pre-programmed settings: ice cream, sorbet, lite ice cream, gelato, milkshake, smoothie bowl, mix-in, slushy, Italian ice, frozen drink, Creamiccino, and frozen yogurt. You can use the machine to make all of these frozen treats'),
(92, 'Cream Deluxe Gold ', '250', '250', 'Avaliable', '1691596628194-four.jpg', 'limited', 'Cream Deluxe Gold is the most recent addition to our ever-expanding N2O collection. With Gold, we’ve created the nitrous oxide of the future in a sleek, light-weight aluminium bottle. Never be concerned about gas quality deterioration or canister depletion over time.\r\n'),
(93, 'Sugar Stands', '60', '60', 'Avaliable', '1691596675143-foute.jpg', 'limited', 'Sugar Strands are pretty colourful sugar decorations. Use them to add colour and excitement to all types of baking from iced cupcakes to biscuits and ice cream.'),
(94, 'SmartWhipe silver', '200', '200', 'Avaliable', '1691596735820-one.jpg', 'Limited', 'Introducing the new Smartwhip Silver Cream Charger N2O Cylinder 640g with dispensing nozzle included, the same great Smartwhip you know and love, except now it comes in a larger and improved canister. It’s a bargain you can’t beat!\r\n'),
(95, 'Coco Cola', '150', '150', 'Avaliable', '1691596776597-seven.jpg', 'limited', 'Coke products were sold in over 200 countries worldwide, with consumers drinking more than 1.8 billion company beverage servings each day'),
(96, 'Rainbow Decorating Cake & Ice-Cream', '80', '80', 'Avaliable', '1691596819984-seventeen.jpg', 'Limited', 'It is a form of sugar art that uses materials such as icing, fondant, and other edible decorations. An artisan may use simple or elaborate three-dimensional shapes as a part of the decoration, or on the entire cake'),
(97, 'Smart Whip cylinder', '180', '180', 'Avaliable', '1691596857627-six.jpg', 'Limited', 'Whipped Cream dispensers manufactured by Smartwhip are dependable, aesthetically pleasing, and safe to use in any setting. If you want to produce a drink, a sauce, a marinade, or a rapid infusion, you’re in excellent hands with the Smartwhip Cream Dispenser. It can handle all of these tasks with ease.\r\n'),
(98, 'Madagascam Vanilla', '60', '60', 'Avaliable', '1691596955256-sixteen.jpg', 'Limited', 'Madagascar vanilla tastes like flowers smell.\r\nWith Bourbon vanilla beans, however, the floral notes are much more subtle, with the intensity of honeysuckle or lilac moreso than jasmine or roses.'),
(99, 'Bicarbonate of Soda', '50', '50', 'Avaliable', '1691596996739-ten.jpg', 'Limited', 'Bicarbonate of soda, or baking soda, is an alkali which is used to raise soda breads and full-flavoured cakes such as gingerbread, fruit cake, chocolate cake and carrot cake. It needs an acid (as well as moisture) to activate it so is often combined with cream of tartar, yogurt, buttermilk or milk.'),
(100, 'Self Raising Flour', '120', '120', 'Avaliable', '1691597021217-thirteen.jpg', 'Limited', 'Self-rising flour is flour with the baking powder and a bit of salt already added. It\'s a staple in many Southern recipes; it\'s traditionally made from a softer, lower protein version of all-purpose flour, which is what grows there.'),
(101, 'Cream Deluxe Horse Power Spray', '230', '230', 'Avaliable', '1691597052783-three.jpg', 'Limited', 'The icing on the cake for your culinary creations, Cream Deluxe Midnight Cream Chargers 666g create the finest whipped cream feeling. Imagine cakes, drinks, or any other dish topped with luscious, smooth, wonderfully whipped cream that has just a tinge of midnight added to it.'),
(102, 'Plastic Plate', '30', '30', 'Avaliable', '1691597104253-twelve.jpg', 'Limited', 'Disposable tableware includes all disposable tableware like. disposable cups made of paper, plastic, coated paper, plates.'),
(103, 'Gas Controller', '120', '120', 'Avaliable', '1691597148040-two.jpg', 'Limited', 'The Smartwhip pressure regulator is a game-changer for frequent cream charger users since it enables you to charge with military accuracy.'),
(104, 'Coco Cola Cane', '80', '80', 'Avaliable', '1691597206934-1.jpeg', 'unlimited', 'Coke products were sold in over 200 countries worldwide, with consumers drinking more than 1.8 billion company beverage servings each day.');

-- --------------------------------------------------------

--
-- Table structure for table `seller`
--

CREATE TABLE `seller` (
  `id` int(11) NOT NULL,
  `seller_name` text NOT NULL,
  `seller_email` text NOT NULL,
  `seller_phoneno` text NOT NULL,
  `seller_location` text NOT NULL,
  `seller_city` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `seller`
--

INSERT INTO `seller` (`id`, `seller_name`, `seller_email`, `seller_phoneno`, `seller_location`, `seller_city`) VALUES
(1, 'Azam', 'azam@gmail.com', '0123456789', 'Gulshan-e-Iqbal, Karachi, Karachi City, Sindh', 'Karachi'),
(2, 'Abdul Rehman', 'arehmanaslam579@gmail.com', '03245580849', 'Gulshan-e-Iqbal, Karachi, Karachi City, Sindh', 'Karachi'),
(3, 'Abdul', 'abdulrehman12@gmail.com', '03231269427', 'Gulshan-e-Iqbal, Karachi, Karachi City, Sindh', 'Karachi'),
(4, 'SyedNaqi', 'naqiraza@gmail.com', '03111145555', 'Gulshan-e-Iqbal, Karachi, Karachi City, Sindh', 'Karachi'),
(5, 'Meersab', 'meersab@gmail.com', '122131.0215564856', 'Gulshan-e-Iqbal, Karachi, Karachi City, Sindh', 'Karachi'),
(6, 'hadi', 'hadi@gmail.com', '123456789', 'DHA Peshawar, Sector A Park', 'Peshawar');

-- --------------------------------------------------------

--
-- Table structure for table `signup`
--

CREATE TABLE `signup` (
  `id` int(11) NOT NULL,
  `name` varchar(100) NOT NULL,
  `email` varchar(100) NOT NULL,
  `phoneno` varchar(100) NOT NULL,
  `address` varchar(100) NOT NULL,
  `password` varchar(100) NOT NULL,
  `status` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `signup`
--

INSERT INTO `signup` (`id`, `name`, `email`, `phoneno`, `address`, `password`, `status`) VALUES
(15, 'Abc', 'abc@gmail.com', '9876543', 'Ava ujfkshjafgoas', '12345678', 'verifed\r\n'),
(16, 'Abc', 'abc@gmail.com', '9876543', 'Ava ujfkshjafgoas', '12345678', ''),
(17, 'Abc', 'abc@gmail.com', '9876543', 'Ava ujfkshjafgoas', '12345678', ''),
(18, 'Abc', 'abc@gmail.com', '9876543', 'Ava ujfkshjafgoas', '12345678', ''),
(19, 'Abc', 'abc@gmail.com', '9876543', 'Ava ujfkshjafgoas', '12345678', ''),
(20, 'Abc', 'abc@gmail.com', '9876543', 'Ava ujfkshjafgoas', '12345678', ''),
(21, 'Ahfsk', 'abc@gmail.com', '987654321', 'Agysahskfjas', '12345678', ''),
(22, 'tester', 'test@gmail.com', '0987654312', 'Buzzk', '12345678', ''),
(23, 'Judiwkej', 'asjfhgksaf', '908765432', '12drt6yuihjas', '12345678', ''),
(24, '123', '23@gmail.com', '031121546', '12.3131321311', '12345678', ''),
(25, 'asfd', 'sad', '1234649674', '1231231323144', '123456', ''),
(26, 'Gsghehd', 'gdhdhdhd', '2458585858', 'Gchdhfhdhd', '123456', ''),
(27, 'Gsghehd', 'gdhdhdhd@gmail.com', '2458585858', 'Gchdhfhdhd', '123456', 'Unverified'),
(28, 'Gsghehd', 'gdhdhdhd@gmail.com', '2458585858', 'Gchdhfhdhd', '123456', 'Unverified'),
(29, 'Gsghehd', 'gdhdhdhd@gmail.com', '2458585858', 'Gchdhfhdhd', '123456', 'Unverified'),
(30, 'Gsghehd', 'gdhdhdhd@gmail.com', '2458585858', 'Gchdhfhdhd', '123456', 'Unverified'),
(31, 'Gsgs', 'dhhdhdhd', '545424613437', 'Hfjdjdjdjchc', '123456', ''),
(32, 'Ass', 'asasa@gmail.com', '12345678', 'Hsdfsabhahsassjfa', '123456', '');

-- --------------------------------------------------------

--
-- Table structure for table `verifyuser`
--

CREATE TABLE `verifyuser` (
  `id` text NOT NULL,
  `name` text NOT NULL,
  `email` text NOT NULL,
  `phoneno` text NOT NULL,
  `address` text NOT NULL,
  `password` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `admin_add_role`
--
ALTER TABLE `admin_add_role`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `attribute`
--
ALTER TABLE `attribute`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `get_documents`
--
ALTER TABLE `get_documents`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `product`
--
ALTER TABLE `product`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `seller`
--
ALTER TABLE `seller`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `signup`
--
ALTER TABLE `signup`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `admin_add_role`
--
ALTER TABLE `admin_add_role`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `attribute`
--
ALTER TABLE `attribute`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `get_documents`
--
ALTER TABLE `get_documents`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `product`
--
ALTER TABLE `product`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=110;

--
-- AUTO_INCREMENT for table `seller`
--
ALTER TABLE `seller`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `signup`
--
ALTER TABLE `signup`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=33;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
