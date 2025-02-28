-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Хост: 127.0.0.1
-- Час створення: Лют 28 2025 р., 11:56
-- Версія сервера: 10.4.32-MariaDB
-- Версія PHP: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- База даних: `clothes_store`
--

-- --------------------------------------------------------

--
-- Структура таблиці `brands`
--

CREATE TABLE `brands` (
  `id` int(11) UNSIGNED NOT NULL,
  `title` varchar(200) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='brands';

--
-- Дамп даних таблиці `brands`
--

INSERT INTO `brands` (`id`, `title`) VALUES
(1, 'Zara'),
(2, 'Columbia'),
(3, 'Puma'),
(4, 'Adidas'),
(5, 'Colin\'s'),
(6, 'H&M'),
(7, 'Без бренду'),
(8, 'Nike'),
(9, 'Other');

-- --------------------------------------------------------

--
-- Структура таблиці `category`
--

CREATE TABLE `category` (
  `id` int(11) UNSIGNED NOT NULL,
  `title` varchar(200) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='category';

--
-- Дамп даних таблиці `category`
--

INSERT INTO `category` (`id`, `title`) VALUES
(1, 'women'),
(2, 'men'),
(3, 'children');

-- --------------------------------------------------------

--
-- Структура таблиці `categorysub`
--

CREATE TABLE `categorysub` (
  `id` int(11) UNSIGNED NOT NULL,
  `title` varchar(200) NOT NULL,
  `title_ua` varchar(200) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='categorysub';

--
-- Дамп даних таблиці `categorysub`
--

INSERT INTO `categorysub` (`id`, `title`, `title_ua`) VALUES
(1, 'clothes', 'Одяг'),
(2, 'accessories', 'Аксесуари'),
(3, 'shoes', 'Взуття');

-- --------------------------------------------------------

--
-- Структура таблиці `categorysubsub`
--

CREATE TABLE `categorysubsub` (
  `id` int(11) UNSIGNED NOT NULL,
  `title` varchar(200) NOT NULL,
  `pictures_path` varchar(200) NOT NULL,
  `categorysub_id` int(11) UNSIGNED NOT NULL,
  `title_ua` varchar(200) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='categorysubsub';

--
-- Дамп даних таблиці `categorysubsub`
--

INSERT INTO `categorysubsub` (`id`, `title`, `pictures_path`, `categorysub_id`, `title_ua`) VALUES
(1, 'jackets_women', '../img/women/clothes/jackets_women.png', 1, 'Куртки'),
(2, 'jackets_men', '../img/men/clothes/jackets_men.png', 1, 'Куртки'),
(3, 'jackets_children', '../img/children/clothes/jackets_children.png', 1, 'Куртки'),
(4, 'pants_women', '../img/women/clothes/pants_women.png', 1, 'Штани'),
(5, 'pants_men', '../img/men/clothes/pants_men.png', 1, 'Штани'),
(6, 'pants_children', '../img/children/clothes/pants_children.png', 1, 'Штани'),
(7, 'shorts_women', '../img/women/clothes/shorts_women.png', 1, 'Шорти'),
(8, 'downjackets_men', '../img/men/clothes/down_jackets_men.png', 1, 'Пуховики'),
(9, 'downjackets_children', '../img/children/clothes/down_jackets_children.png', 1, 'Пуховики'),
(10, 'jerseys_women', '../img/women/clothes/jerseys_women.png', 1, 'Майки'),
(11, 'jerseys_men', '../img/men/clothes/jerseys_men.png', 1, 'Майки'),
(12, 'jerseys_children', '../img/children/clothes/jerseys_children.png', 1, 'Майки'),
(13, 'shirts_women', '../img/women/clothes/shirts_women.png', 1, 'Сорочки'),
(14, 'shirts_men', '../img/men/clothes/shirts_men.png', 1, 'Сорочки'),
(15, 'shirts_children', '../img/children/clothes/shirts_children.png', 1, 'Сорочки'),
(16, 'sweatshirts_women', '../img/women/clothes/sweatshirts_women.png', 1, 'Толстовки'),
(17, 'sweatshirts_men', '../img/men/clothes/sweatshirts_men.png', 1, 'Толстовки'),
(18, 'sweatshirts_children', '../img/children/clothes/sweatshirts_children.png', 1, 'Толстовки'),
(19, 'tshirts_women', '../img/women/clothes/t_shirts_women.png', 1, 'Футболки'),
(20, 'tshirts_men', '../img/men/clothes/t_shirts_men.png', 1, 'Футболки'),
(21, 'tshirts_children', '../img/children/clothes/t_shirts_children.png', 1, 'Футболки'),
(22, 'thermalunderwear_women', '../img/women/clothes/thermal_underwear_women.png', 1, 'Термобілизна'),
(23, 'thermalunderwear_men', '../img/men/clothes/thermal_underwear_men.png', 1, 'Термобілизна'),
(25, 'thermalunderwear_children', '../img/children/clothes/thermal_underwear_children.png', 1, 'Термобілизна'),
(26, 'backpacks_women', '../img/women/accessories/backpacks_women.png\r\n', 2, 'Рюкзаки'),
(27, 'backpacks_men', '../img/men/accessories/backpacks_men.png\r\n', 2, 'Рюкзаки'),
(28, 'backpacks_children', '../img/children/accessories/backpacks_children.png\r\n', 2, 'Рюкзаки'),
(29, 'gloves_women', '../img/women/accessories/gloves_women.png', 2, 'Рукавички'),
(30, 'gloves_men', '../img/men/accessories/gloves_men.png', 2, 'Рукавички'),
(31, 'gloves_children', '../img/children/accessories/gloves_children.png', 2, 'Рукавички'),
(32, 'headwear_women', '../img/women/accessories/headwear_women.png', 2, 'Головні убори'),
(33, 'headwear_men', '../img/men/accessories/headwear_men.png', 2, 'Головні убори'),
(34, 'headwear_children', '../img/children/accessories/headwear_children.png', 2, 'Головні убори'),
(35, 'scarves_women', '../img/women/accessories/scarves_women.png', 2, 'Шарфи'),
(36, 'scarves_men', '../img/men/accessories/scarves_men.png', 2, 'Шарфи'),
(37, 'scarves_children', '../img/children/accessories/scarves_children.png', 2, 'Шарфи'),
(38, 'boots_women', '../img/women/shoes/boots_women.png', 3, 'Черевики'),
(39, 'boots_men', '../img/men/shoes/boots_men.png', 3, 'Черевики'),
(40, 'boots_children', '../img/children/shoes/boots_children.png', 3, 'Черевики'),
(41, 'flipflops_women', '../img/women/shoes/flip_flops_women.png', 3, 'Шльопки'),
(42, 'flipflops_men', '../img/men/shoes/flip_flops_men.png', 3, 'Шльопки'),
(43, 'flipflops_children', '../img/children/shoes/flip_flops_children.png', 3, 'Шльопки'),
(44, 'kedy_women', '../img/women/shoes/kedy_women.png', 3, 'Кеди'),
(45, 'kedy_men', '../img/men/shoes/kedy_men.png', 3, 'Кеди'),
(46, 'kedy_children', '../img/children/shoes/kedy_children.png', 3, 'Кеди'),
(47, 'sneakers_women', '../img/women/shoes/sneakers_women.png', 3, 'Кросівки'),
(50, 'sneakers_men', '../img/men/shoes/sneakers_men.png', 3, 'Кросівки'),
(51, 'sneakers_children', '../img/children/shoes/sneakers_children.png', 3, 'Кросівки'),
(52, 'windbreakers_women', '../img/women/clothes/windbreakers_women.png', 1, 'Вітровки'),
(53, 'costumes_women', '../img/women/clothes/costumes_women.png', 1, 'Костюми'),
(54, 'leggings_women', '../img/women/clothes/leggings_women.png', 1, 'Легінси'),
(55, 'skirts_women', '../img/women/clothes/skirts_women.png', 1, 'Спідниці');

-- --------------------------------------------------------

--
-- Структура таблиці `colors`
--

CREATE TABLE `colors` (
  `id` int(11) UNSIGNED NOT NULL,
  `title` varchar(200) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='colors';

--
-- Дамп даних таблиці `colors`
--

INSERT INTO `colors` (`id`, `title`) VALUES
(1, 'Синій'),
(2, 'Жовтий'),
(3, 'Білий'),
(4, 'Блакитний'),
(5, 'Зелений'),
(6, 'Чорний'),
(7, 'Коричневий'),
(8, 'Рожевий'),
(9, 'Помаранчевий'),
(10, 'Червоний'),
(11, 'Інші кольори'),
(12, 'Сірий'),
(13, 'Фіолетовий'),
(14, 'Бежевий'),
(15, 'Мультиколір');

-- --------------------------------------------------------

--
-- Структура таблиці `countriesproduct`
--

CREATE TABLE `countriesproduct` (
  `id` int(11) UNSIGNED NOT NULL,
  `title` varchar(200) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='CountriesProduct';

--
-- Дамп даних таблиці `countriesproduct`
--

INSERT INTO `countriesproduct` (`id`, `title`) VALUES
(1, 'Україна'),
(2, 'Бангладеш'),
(3, 'Італія');

-- --------------------------------------------------------

--
-- Структура таблиці `deliverytype`
--

CREATE TABLE `deliverytype` (
  `id` int(11) UNSIGNED NOT NULL,
  `title` varchar(200) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='deliverytype';

--
-- Дамп даних таблиці `deliverytype`
--

INSERT INTO `deliverytype` (`id`, `title`) VALUES
(1, 'self_pickup'),
(2, 'ukr_poshta'),
(3, 'nova_poshta');

-- --------------------------------------------------------

--
-- Структура таблиці `materials`
--

CREATE TABLE `materials` (
  `id` int(11) UNSIGNED NOT NULL,
  `title` varchar(200) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='materials';

--
-- Дамп даних таблиці `materials`
--

INSERT INTO `materials` (`id`, `title`) VALUES
(1, 'Бавовна'),
(2, 'Вовна'),
(3, 'Поліестер'),
(4, 'Штучна шкіра');

-- --------------------------------------------------------

--
-- Структура таблиці `orderidproductid`
--

CREATE TABLE `orderidproductid` (
  `id` int(11) UNSIGNED NOT NULL,
  `order_id` int(11) UNSIGNED NOT NULL,
  `product_id` int(11) UNSIGNED NOT NULL,
  `quantity` int(11) NOT NULL,
  `price` float(11,2) NOT NULL,
  `size_id` int(11) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='orderidproductid';

--
-- Дамп даних таблиці `orderidproductid`
--

INSERT INTO `orderidproductid` (`id`, `order_id`, `product_id`, `quantity`, `price`, `size_id`) VALUES
(81, 116, 98, 1, 1799.00, 5),
(82, 117, 96, 1, 1899.00, 1),
(83, 117, 96, 1, 1899.00, 3),
(84, 117, 97, 2, 2389.00, 2),
(85, 118, 106, 1, 2499.00, 1),
(86, 118, 108, 1, 989.00, 6),
(87, 119, 111, 1, 499.00, 3),
(88, 119, 113, 1, 999.00, 5),
(89, 119, 114, 1, 959.00, 9),
(91, 120, 122, 1, 856.00, 4),
(92, 120, 127, 1, 1234.00, 1),
(93, 120, 116, 3, 899.00, 1),
(94, 120, 117, 1, 899.00, 1);

-- --------------------------------------------------------

--
-- Структура таблиці `orders`
--

CREATE TABLE `orders` (
  `id` int(11) UNSIGNED NOT NULL,
  `user_id` int(11) UNSIGNED DEFAULT NULL,
  `date_order` datetime NOT NULL,
  `delivery_type_id` int(11) UNSIGNED NOT NULL,
  `payment_type_id` int(11) UNSIGNED NOT NULL,
  `recipient_id` int(11) UNSIGNED NOT NULL,
  `delivery_index` varchar(200) DEFAULT NULL,
  `delivery_full_address` varchar(200) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='orders';

--
-- Дамп даних таблиці `orders`
--

INSERT INTO `orders` (`id`, `user_id`, `date_order`, `delivery_type_id`, `payment_type_id`, `recipient_id`, `delivery_index`, `delivery_full_address`) VALUES
(116, NULL, '2025-02-28 11:03:23', 1, 2, 25, '', 'м. Київ, вул. Хрещатик, 300, ТРЦ \'Ocean\''),
(117, 5, '2025-02-28 11:04:43', 1, 1, 1, '', 'м. Київ, вул. Хрещатик, 300, ТРЦ \'Ocean\''),
(118, NULL, '2025-02-28 12:48:32', 1, 2, 26, '', 'м. Київ, вул. Хрещатик, 300, ТРЦ \'Ocean\''),
(119, NULL, '2025-02-28 12:49:41', 1, 2, 27, '', 'м. Київ, вул. Хрещатик, 300, ТРЦ \'Ocean\''),
(120, NULL, '2025-02-28 12:51:03', 1, 2, 28, '', 'м. Київ, вул. Хрещатик, 300, ТРЦ \'Ocean\'');

-- --------------------------------------------------------

--
-- Структура таблиці `paymenttype`
--

CREATE TABLE `paymenttype` (
  `id` int(11) UNSIGNED NOT NULL,
  `title` varchar(200) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='paymenttype';

--
-- Дамп даних таблиці `paymenttype`
--

INSERT INTO `paymenttype` (`id`, `title`) VALUES
(1, 'cash'),
(2, 'online');

-- --------------------------------------------------------

--
-- Структура таблиці `productidsizeid`
--

CREATE TABLE `productidsizeid` (
  `id` int(11) UNSIGNED NOT NULL,
  `productid` int(11) UNSIGNED NOT NULL,
  `sizeid` int(11) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='productidsizeid';

--
-- Дамп даних таблиці `productidsizeid`
--

INSERT INTO `productidsizeid` (`id`, `productid`, `sizeid`) VALUES
(1, 1, 1),
(2, 1, 2),
(3, 1, 3),
(4, 1, 4),
(5, 2, 1),
(7, 4, 1),
(13, 11, 1),
(14, 12, 4),
(15, 13, 2),
(16, 14, 1),
(17, 15, 1),
(18, 16, 1),
(19, 17, 3),
(20, 18, 1),
(21, 19, 1),
(22, 20, 1),
(23, 21, 1),
(24, 22, 1),
(25, 23, 1),
(26, 24, 1),
(27, 25, 1),
(28, 26, 1),
(29, 27, 1),
(30, 28, 1),
(31, 29, 1),
(32, 30, 1),
(33, 31, 1),
(34, 32, 1),
(35, 33, 1),
(36, 34, 1),
(37, 35, 1),
(38, 36, 1),
(39, 37, 1),
(40, 38, 1),
(41, 39, 1),
(42, 40, 1),
(43, 41, 1),
(44, 42, 1),
(45, 43, 1),
(46, 44, 14),
(47, 45, 1),
(48, 46, 14),
(49, 47, 14),
(50, 48, 14),
(51, 49, 14),
(52, 50, 1),
(53, 51, 1),
(54, 52, 14),
(55, 53, 14),
(56, 53, 14),
(57, 54, 1),
(58, 51, 14),
(59, 55, 14),
(60, 56, 14),
(61, 57, 1),
(62, 58, 14),
(63, 59, 1),
(64, 60, 1),
(65, 61, 1),
(66, 62, 1),
(67, 63, 1),
(68, 64, 1),
(69, 65, 1),
(70, 66, 1),
(71, 67, 1),
(132, 89, 1),
(141, 89, 5),
(142, 96, 1),
(143, 96, 2),
(144, 96, 3),
(145, 97, 2),
(146, 97, 1),
(147, 97, 8),
(148, 98, 5),
(149, 98, 6),
(150, 98, 8),
(151, 98, 7),
(152, 98, 9),
(153, 96, 5),
(154, 14, 5),
(156, 100, 9),
(157, 100, 13),
(158, 100, 1),
(159, 101, 1),
(160, 101, 5),
(161, 101, 9),
(162, 102, 1),
(163, 102, 5),
(164, 102, 9),
(165, 103, 2),
(166, 103, 6),
(167, 103, 10),
(168, 103, 1),
(169, 103, 5),
(170, 103, 9),
(171, 104, 3),
(172, 104, 7),
(173, 104, 11),
(174, 105, 4),
(175, 105, 8),
(176, 105, 12),
(177, 105, 1),
(178, 106, 1),
(179, 106, 5),
(180, 106, 9),
(181, 107, 1),
(182, 107, 5),
(183, 107, 9),
(184, 108, 6),
(185, 108, 2),
(186, 108, 10),
(187, 109, 1),
(188, 109, 5),
(189, 109, 3),
(191, 110, 7),
(192, 110, 11),
(193, 110, 13),
(194, 13, 1),
(195, 13, 5),
(196, 13, 9),
(197, 111, 3),
(198, 111, 7),
(199, 111, 11),
(200, 112, 4),
(201, 112, 1),
(202, 112, 3),
(203, 112, 2),
(204, 112, 9),
(205, 113, 1),
(206, 113, 5),
(207, 113, 9),
(208, 113, 3),
(209, 113, 7),
(210, 113, 11),
(211, 114, 1),
(212, 114, 5),
(213, 114, 9),
(214, 114, 10),
(215, 114, 6),
(216, 114, 2),
(217, 115, 3),
(218, 115, 7),
(219, 115, 11),
(220, 115, 4),
(221, 115, 8),
(222, 115, 12),
(223, 116, 1),
(224, 116, 5),
(225, 116, 9),
(226, 116, 2),
(227, 116, 6),
(228, 116, 10),
(229, 116, 3),
(230, 116, 7),
(231, 117, 1),
(232, 117, 5),
(233, 117, 9),
(234, 118, 1),
(235, 118, 5),
(236, 118, 4),
(237, 118, 8),
(238, 118, 12),
(239, 119, 1),
(240, 119, 5),
(242, 119, 9),
(243, 16, 9),
(244, 16, 5),
(245, 16, 2),
(246, 120, 1),
(247, 120, 7),
(248, 120, 4),
(249, 121, 1),
(250, 121, 5),
(251, 121, 9),
(252, 122, 4),
(253, 122, 8),
(254, 122, 12),
(256, 123, 3),
(257, 123, 7),
(258, 123, 11),
(259, 124, 1),
(260, 124, 5),
(261, 124, 9),
(262, 4, 5),
(263, 4, 9),
(264, 125, 2),
(265, 125, 6),
(266, 125, 10),
(267, 126, 5),
(268, 126, 9),
(269, 126, 1),
(270, 127, 1),
(271, 127, 5),
(272, 127, 9),
(273, 127, 2),
(274, 12, 1),
(275, 12, 5),
(276, 12, 9),
(277, 12, 13),
(278, 128, 4),
(279, 128, 8),
(280, 128, 12),
(281, 129, 1),
(282, 129, 5),
(283, 129, 9),
(284, 130, 2),
(285, 130, 6),
(286, 130, 10),
(287, 130, 4),
(288, 11, 5),
(289, 11, 9),
(290, 11, 10),
(291, 131, 3),
(292, 131, 7),
(293, 131, 11),
(294, 132, 4),
(295, 132, 8),
(296, 132, 12),
(297, 133, 1),
(298, 133, 5),
(299, 133, 9);

-- --------------------------------------------------------

--
-- Структура таблиці `products`
--

CREATE TABLE `products` (
  `id` int(11) UNSIGNED NOT NULL,
  `title` varchar(200) NOT NULL,
  `color_id` int(11) UNSIGNED NOT NULL,
  `brand_id` int(11) UNSIGNED NOT NULL,
  `price` float(10,2) NOT NULL,
  `material_id` int(11) UNSIGNED NOT NULL,
  `country_product_id` int(11) UNSIGNED NOT NULL,
  `part_number` varchar(200) NOT NULL,
  `pictures_path` varchar(200) DEFAULT NULL,
  `category_id` int(11) UNSIGNED NOT NULL,
  `category_sub_id` int(11) UNSIGNED NOT NULL,
  `category_sub_sub_id` int(11) UNSIGNED NOT NULL,
  `price_with_discount` float(10,2) DEFAULT NULL,
  `new_product` int(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='products';

--
-- Дамп даних таблиці `products`
--

INSERT INTO `products` (`id`, `title`, `color_id`, `brand_id`, `price`, `material_id`, `country_product_id`, `part_number`, `pictures_path`, `category_id`, `category_sub_id`, `category_sub_sub_id`, `price_with_discount`, `new_product`) VALUES
(1, 'Куртка жіноча Puma', 6, 3, 2999.00, 3, 2, 'nfv-112233', 'img/women/clothes/jackets/1740674760287.jpg', 1, 1, 1, NULL, 0),
(2, 'Пуховик чоловічий Protective Down Parka', 2, 2, 3999.00, 1, 1, '4067981263318', '', 2, 1, 8, NULL, 0),
(4, 'Футболка жіноча Adidas', 6, 4, 1007.00, 3, 2, 'nfv-893453', 'img/women/clothes/tshirts/1740738926386.jpg', 1, 1, 19, NULL, 0),
(6, 'Толстовка на флісі для хлопчика Nike', 2, 2, 1449.00, 1, 2, '197598790403', '', 3, 1, 18, NULL, 0),
(11, 'Штани жіночі Puma', 4, 3, 999.00, 1, 2, 'nfv-839453', 'img/women/clothes/pants/1740739382370.jpg', 1, 1, 4, NULL, 0),
(12, 'Шорти жіночі Puma', 3, 3, 1595.00, 1, 2, 'nfv-892353', 'img/women/clothes/shorts/1740739159094.jpg', 1, 1, 7, NULL, 0),
(13, 'Майка жіноча Puma', 14, 3, 899.00, 3, 2, 'nfv-489358', 'img/women/clothes/jerseys/1740737861048.jpg', 1, 1, 10, NULL, 0),
(14, 'Рубашка бавовняна жіноча Puma', 2, 3, 1199.00, 1, 1, '4066757286810', 'img/women/clothes/shirts/1740731598618.jpg', 1, 1, 13, NULL, 0),
(15, 'Толстовка жіноча Puma', 4, 3, 1199.00, 1, 2, 'nfv-894354', 'img/women/clothes/sweatshirts/1740738781386.jpg', 1, 1, 16, NULL, 0),
(16, 'Термобілизна жіноча Columbia', 6, 2, 999.00, 3, 2, 'nfv-345325', 'img/women/clothes/thermalunderwear/1740738578839.jpg', 1, 1, 22, NULL, 0),
(17, 'Куртка чоловіча Puma', 2, 3, 2459.00, 1, 1, '4066757286810', '', 2, 1, 2, NULL, 0),
(18, 'Штани чоловічі Puma', 2, 3, 899.00, 1, 1, '4066757286810', '', 2, 1, 5, NULL, 0),
(19, 'Майка бавовняна чоловіча Puma', 2, 3, 599.00, 1, 1, '4066757286810', '', 2, 1, 11, NULL, 0),
(20, 'Рубашка бавовняна чоловіча Puma', 2, 3, 899.00, 1, 1, '4066757286810', '', 2, 1, 14, NULL, 0),
(21, 'Толстовка чоловіча Puma', 2, 3, 1299.00, 1, 1, '4066757286810', '', 2, 1, 17, NULL, 0),
(22, 'Футболка бавовняна чоловіча Puma', 2, 3, 789.00, 1, 1, '4066757286810', '', 2, 1, 20, NULL, 0),
(23, 'Термобілизна чоловіча Puma', 2, 3, 998.00, 1, 1, '4066757286810', '', 2, 1, 23, NULL, 0),
(24, 'Куртка дитяча Puma', 2, 3, 1389.00, 1, 1, '4066757286810', '', 3, 1, 3, NULL, 0),
(25, 'Штани дитячі Puma', 2, 3, 499.00, 1, 1, '4066757286810', '', 3, 1, 6, NULL, 0),
(26, 'Пуховик дитячий Puma', 2, 3, 5999.00, 1, 1, '4066757286810', '', 3, 1, 9, NULL, 0),
(27, 'Майка дитяча Puma', 2, 3, 999.00, 1, 1, '4066757286810', '', 3, 1, 12, NULL, 0),
(28, 'Рубашка дитяча Puma', 2, 3, 999.00, 1, 1, '4066757286810', '', 3, 1, 15, NULL, 0),
(29, 'Толстовка дитяча Puma', 2, 3, 999.00, 1, 1, '4066757286810', '', 3, 1, 18, NULL, 0),
(30, 'Футболка дитяча Puma', 2, 3, 999.00, 1, 1, '4066757286810', '', 3, 1, 21, NULL, 0),
(31, 'Термобілизна дитяча Puma', 2, 3, 999.00, 1, 1, '4066757286810', '', 3, 1, 25, NULL, 0),
(32, 'Черевики жіночі Puma', 2, 3, 999.00, 1, 1, '4066757286810', '', 1, 3, 38, NULL, 0),
(33, 'Шльопки жіночі Puma', 2, 3, 999.00, 1, 1, '4066757286810', '', 1, 3, 41, NULL, 0),
(34, 'Кеди жіночі Puma', 2, 3, 999.00, 1, 1, '4066757286810', '', 1, 3, 44, NULL, 0),
(35, 'Кросівки жіночі Puma', 2, 3, 999.00, 4, 1, '4066757286810', '', 1, 3, 47, NULL, 0),
(36, 'Черевики чоловічі Puma', 2, 3, 999.00, 1, 1, '4066757286810', '', 2, 3, 39, NULL, 0),
(37, 'Шльопки чоловічі Puma', 2, 3, 999.00, 1, 1, '4066757286810', '', 2, 3, 42, NULL, 0),
(38, 'Кеди чоловічі Puma', 2, 3, 999.00, 1, 1, '4066757286810', '', 2, 3, 45, NULL, 0),
(39, 'Кросівки чоловічі Puma', 2, 3, 999.00, 4, 1, '4066757286810', '', 2, 3, 50, NULL, 0),
(40, 'Черевики дитячі Puma', 2, 3, 999.00, 1, 1, '4066757286810', '', 3, 3, 40, NULL, 0),
(41, 'Шльопки дитячі Puma', 2, 3, 999.00, 1, 1, '4066757286810', '', 3, 3, 43, NULL, 0),
(42, 'Кеди дитячі Puma', 2, 3, 999.00, 1, 1, '4066757286810', '', 3, 3, 46, NULL, 0),
(43, 'Кросівки дитячі Puma', 2, 3, 999.00, 1, 1, '4066757286810', '', 3, 3, 51, NULL, 0),
(44, 'Рюкзак жіночий Puma', 2, 3, 999.00, 1, 1, '4066757286810', '', 1, 2, 26, NULL, 0),
(45, 'Рукавички жіночі Puma', 2, 3, 999.00, 1, 1, '4066757286810', '', 1, 2, 29, NULL, 0),
(46, 'Головний убір жіночий Puma', 2, 3, 999.00, 1, 1, '4066757286810', '', 1, 2, 32, NULL, 0),
(47, 'Шарф жіночий Puma', 2, 3, 999.00, 1, 1, '4066757286810', '', 1, 2, 35, NULL, 0),
(48, 'Рюкзак чоловічий Puma', 2, 3, 999.00, 1, 1, '4066757286810', '', 2, 2, 26, NULL, 0),
(49, 'Рюкзак чоловічий Puma', 2, 3, 999.00, 1, 1, '4066757286810', '', 2, 2, 27, NULL, 0),
(50, 'Рукавички чоловічі Puma', 2, 3, 999.00, 1, 1, '4066757286810', '', 2, 2, 30, NULL, 0),
(51, 'Кепка чоловіча Puma', 2, 3, 999.00, 1, 1, '4066757286810', '', 2, 2, 33, NULL, 0),
(52, 'Шарф чоловічий Puma', 2, 3, 999.00, 1, 1, '4066757286810', '', 2, 2, 36, NULL, 0),
(53, 'Рюкзак дитячий Puma', 2, 3, 999.00, 1, 1, '4066757286810', '', 3, 2, 28, NULL, 0),
(54, 'Рукавички дитячі Puma', 2, 3, 999.00, 1, 1, '4066757286810', '', 3, 2, 31, NULL, 0),
(55, 'Шапка дитяча Puma', 2, 3, 999.00, 1, 1, '4066757286810', '', 3, 2, 34, NULL, 0),
(56, 'Шарф дитячий Puma', 2, 3, 999.00, 1, 1, '4066757286810', '', 3, 2, 37, NULL, 0),
(57, 'Рукавички чоловічі Nike ACG Dri-FIT', 2, 8, 999.00, 1, 1, '4066757286810', '', 2, 2, 30, NULL, 0),
(58, 'Кепка чоловіча Nike DriFIT Club', 6, 8, 499.00, 1, 1, '4066757286810', '', 2, 2, 33, NULL, 0),
(59, 'Куртка чоловіча Nike ACG Rope', 3, 8, 999.00, 3, 1, '4066757286810', '', 2, 1, 2, NULL, 0),
(60, 'Толстовка чоловіча Nike ACG Canwell Glacier', 2, 8, 1999.00, 1, 1, '4066757286810', '', 2, 1, 17, NULL, 0),
(61, 'Футболка бавовняна чоловіча Puma', 6, 8, 999.00, 1, 1, '4066757286810', '', 2, 1, 20, NULL, 0),
(62, 'Термобілизна чоловіча Nike ACG White Rapids', 5, 8, 999.00, 1, 1, '4066757286810', '', 2, 1, 23, NULL, 0),
(63, 'Черевики чоловічі Nike Air Max', 6, 8, 999.00, 4, 1, '4066757286810', '', 2, 3, 39, NULL, 0),
(64, 'Черевики чоловічі Nike Air Max', 3, 8, 999.00, 4, 1, '4066757286810', '', 2, 3, 39, NULL, 0),
(65, 'Кеди чоловічі Nike ACF Watercat', 4, 8, 999.00, 4, 1, '4066757286810', '', 2, 3, 45, NULL, 0),
(66, 'Кросівки чоловічі Nike ACG Mountain', 3, 8, 999.00, 4, 1, '4066757286810', '', 2, 3, 50, NULL, 0),
(67, 'Кросівки чоловічі Nike React SFB Carbon', 3, 8, 2999.00, 4, 1, '4066757286810', '', 2, 3, 50, NULL, 0),
(89, 'Куртка жіноча Columbia', 6, 2, 3499.00, 3, 2, 'nfv-223311', 'img/women/clothes/jackets/1740737576736.jpg', 1, 1, 1, NULL, 0),
(96, 'Куртка жіноча H&M', 6, 6, 1899.00, 3, 2, 'nfv-123412', 'img/women/clothes/jackets/1740726364059.jpg', 1, 1, 1, NULL, 0),
(97, 'Куртка жіноча long Puma', 6, 3, 2389.00, 3, 3, 'nfv-412342', 'img/women/clothes/jackets/1740726463770.jpg', 1, 1, 1, NULL, 0),
(98, 'Вітровка жіноча Colin\'s', 5, 5, 1799.00, 3, 1, 'nfv-435345', 'img/women/clothes/windbreakers/1740736447230.jpg', 1, 1, 52, NULL, 0),
(100, 'Вітровка жіноча Puma', 3, 3, 1399.00, 3, 1, 'nfv-324325', 'img/women/clothes/windbreakers/1740737174751.jpg', 1, 1, 52, NULL, 0),
(101, 'Куртка жіноча Columbia', 6, 2, 899.00, 3, 2, 'nfv-343584', 'img/women/clothes/windbreakers/1740737224897.jpg', 1, 1, 52, NULL, 0),
(102, 'Куртка жіноча Columbia', 15, 2, 1599.00, 3, 3, 'nfv-438543', 'img/women/clothes/windbreakers/1740737275288.jpg', 1, 1, 52, NULL, 0),
(103, 'Костюм жіночий Adidas', 6, 4, 2099.00, 3, 2, 'nfv-345344', 'img/women/clothes/costumes/1740737367677.jpg', 1, 1, 53, NULL, 0),
(104, 'Костюм жіночий Nike', 14, 8, 1799.00, 1, 1, 'nfv-875348', 'img/women/clothes/costumes/1740737429810.jpg', 1, 1, 53, NULL, 0),
(105, 'Костюм жіночий Colin\'s', 6, 5, 1899.00, 1, 1, 'nfv-594534', 'img/women/clothes/costumes/1740737497964.jpg', 1, 1, 53, NULL, 0),
(106, 'Костюм жіночий Puma', 5, 3, 2499.00, 3, 3, 'nfv-894835', 'img/women/clothes/costumes/1740737546904.jpg', 1, 1, 53, NULL, 0),
(107, 'Легінси жіночі H&M', 6, 6, 599.00, 1, 2, 'nfv-635487', 'img/women/clothes/leggings/1740737659054.jpg', 1, 1, 54, NULL, 0),
(108, 'Легінси жіночі Puma', 1, 3, 989.00, 3, 2, 'nfv-874335', 'img/women/clothes/leggings/1740737708573.jpg', 1, 1, 54, NULL, 0),
(109, 'Легінси жіночі Adidas', 14, 4, 1199.00, 3, 3, 'nfv-895432', 'img/women/clothes/leggings/1740737759543.jpg', 1, 1, 54, NULL, 0),
(110, 'Легінси жіночі Nike', 6, 8, 1099.00, 1, 1, 'nfv-843951', 'img/women/clothes/leggings/1740737797941.jpg', 1, 1, 54, NULL, 0),
(111, 'Майка жіноча other', 15, 9, 499.00, 1, 1, 'nfv-435831', 'img/women/clothes/jerseys/1740737913006.jpg', 1, 1, 10, NULL, 0),
(112, 'Майка жіноча Nike', 14, 8, 799.00, 1, 2, 'nfv-782930', 'img/women/clothes/jerseys/1740737971136.jpg', 1, 1, 10, NULL, 0),
(113, 'Сорочка жіноча Holiday', 3, 9, 999.00, 1, 1, 'nfv-893248', 'img/women/clothes/shirts/1740738071694.jpg', 1, 1, 13, NULL, 0),
(114, 'Сорочка жіноча Perfect', 14, 1, 959.00, 3, 1, 'nfv-479828', 'img/women/clothes/shirts/1740738161394.jpg', 1, 1, 13, NULL, 0),
(115, 'Сорочка жіноча Amazing', 14, 9, 759.00, 1, 3, 'nfv-843958', 'img/women/clothes/shirts/1740738239606.jpg', 1, 1, 13, NULL, 0),
(116, 'Спідниця жіноча Perfect', 6, 9, 899.00, 1, 1, 'nfv-398453', 'img/women/clothes/skirts/1740738319919.jpg', 1, 1, 55, NULL, 0),
(117, 'Спідниця жіноча Modern', 7, 9, 899.00, 1, 3, 'nfv-893543', 'img/women/clothes/skirts/1740738372103.jpg', 1, 1, 55, NULL, 0),
(118, 'Спіниця жіноча Nancy', 3, 9, 1099.00, 1, 1, 'nfv-894353', 'img/women/clothes/skirts/1740738448182.jpg', 1, 1, 55, NULL, 0),
(119, 'Спідниця жіноча Strict', 6, 6, 999.00, 1, 1, 'nfv-893453', 'img/women/clothes/skirts/1740738506343.jpg', 1, 1, 55, NULL, 0),
(120, 'Термобілизна жіноча Nice', 6, 1, 799.00, 3, 3, 'nfv-982359', 'img/women/clothes/thermalunderwear/1740738624166.jpg', 1, 1, 22, NULL, 0),
(121, 'Термобілизна жіноча Columbia', 6, 2, 1399.00, 3, 2, 'nfv-893259', 'img/women/clothes/thermalunderwear/1740738671854.jpg', 1, 1, 22, NULL, 0),
(122, 'Толстовка жіноча Columbia', 4, 2, 856.00, 1, 1, 'nfv-8943540', 'img/women/clothes/sweatshirts/1740738752914.jpg', 1, 1, 16, NULL, 0),
(123, 'Толстовка жіноча Adidas', 6, 4, 1489.00, 1, 1, 'nfv-893453', 'img/women/clothes/sweatshirts/1740738826091.jpg', 1, 1, 16, NULL, 0),
(124, 'Толстовка жіноча Nike', 5, 8, 967.00, 3, 1, 'nfv-893453', 'img/women/clothes/sweatshirts/1740738872329.jpg', 1, 1, 16, NULL, 0),
(125, 'Футболка жіноча Columbia', 6, 2, 799.00, 3, 2, 'nfv-983453', 'img/women/clothes/tshirts/1740738966296.jpg', 1, 1, 19, NULL, 0),
(126, 'Футболка жіноча Lady Life', 3, 9, 998.00, 1, 2, 'nfv-435834', 'img/women/clothes/tshirts/1740739015581.jpg', 1, 1, 19, NULL, 0),
(127, 'Футболка жіноча Nike', 14, 8, 1234.00, 3, 1, 'nfv-983462', 'img/women/clothes/tshirts/1740739081170.jpg', 1, 1, 19, NULL, 0),
(128, 'Шорти жіночі Perfect', 14, 9, 899.00, 3, 1, 'nfv-893452', 'img/women/clothes/shorts/1740739226679.jpg', 1, 1, 7, NULL, 0),
(129, 'Шорти жіночі Nike', 3, 8, 567.00, 3, 2, 'nfv-5728327', 'img/women/clothes/shorts/1740739264547.jpg', 1, 1, 7, NULL, 0),
(130, 'Шорти жіночі Adidas', 10, 4, 899.00, 1, 2, 'nfv-8935296', 'img/women/clothes/shorts/1740739321093.jpg', 1, 1, 7, NULL, 0),
(131, 'Штани жіночі Sincerely', 6, 9, 1123.00, 3, 1, 'nfv-438953', 'img/women/clothes/pants/1740739519537.jpg', 1, 1, 4, NULL, 0),
(132, 'Штани жіночі Nike', 5, 8, 899.00, 1, 2, 'nfv-932578', 'img/women/clothes/pants/1740739561966.jpg', 1, 1, 4, NULL, 0),
(133, 'Штани жіночі Adidas', 12, 4, 1599.00, 3, 2, 'nfv-893487', 'img/women/clothes/pants/1740739614069.jpg', 1, 1, 4, NULL, 0);

-- --------------------------------------------------------

--
-- Структура таблиці `recipients`
--

CREATE TABLE `recipients` (
  `id` int(11) UNSIGNED NOT NULL,
  `first_name` varchar(200) NOT NULL,
  `last_name` varchar(200) NOT NULL,
  `phone` varchar(200) NOT NULL,
  `patronymic` varchar(200) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='recipients';

--
-- Дамп даних таблиці `recipients`
--

INSERT INTO `recipients` (`id`, `first_name`, `last_name`, `phone`, `patronymic`) VALUES
(1, 'Іван', 'Шевченко', '+380961111111', ''),
(5, 'Ivan', 'Shevchenko', '+380961111112', ''),
(6, 'ASD', '', '+381232112312', ''),
(7, 'dfgdf', '', '+38435345345', ''),
(8, 'віаі', '', '+383453453453', ''),
(9, 'фіавіа', '', '+38324324234', ''),
(10, '02', '02', '+380000000000', '02'),
(11, 'пра', '', '+386767686787', ''),
(12, 'р', '', '+38797898798', ''),
(13, 'asdASD', 'asdASD', '+38345345345', 'ASDaSD'),
(14, 'asdsa', '', '+38123123123', ''),
(15, 'dsfsdf', '', '+384353453454', ''),
(16, 'root', '', '+38324234234', ''),
(17, 'asdasd', '', '+3823132123', ''),
(18, 'hjjkk', '', '+385678999878', ''),
(19, 'dfgd', '', '+38546456546', ''),
(20, 'gfd', '', '+3843534545', ''),
(21, 'fsdfsd', '', '+3832343423', ''),
(22, 'sdf', '', '+38323243423', ''),
(23, 'sdfsadfa', '', '+380671234567', ''),
(24, 'sdfasdfsd', '', '+380671231231', ''),
(25, 'Марія', '', '+380968765435', ''),
(26, 'Марія', '', '+380986574835', ''),
(27, 'Ліліан', '', '+38964563742', ''),
(28, 'Роза', '', '+380967654325', '');

-- --------------------------------------------------------

--
-- Структура таблиці `reviews`
--

CREATE TABLE `reviews` (
  `id` int(11) UNSIGNED NOT NULL,
  `comment` varchar(200) NOT NULL,
  `user_id` int(11) UNSIGNED NOT NULL,
  `product_id` int(11) UNSIGNED NOT NULL,
  `grade` int(11) UNSIGNED NOT NULL,
  `advantages` varchar(200) NOT NULL,
  `disadvantages` varchar(200) NOT NULL,
  `datereview` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='reviews';

-- --------------------------------------------------------

--
-- Структура таблиці `roles`
--

CREATE TABLE `roles` (
  `id` int(11) UNSIGNED NOT NULL,
  `title` varchar(200) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='roles';

--
-- Дамп даних таблиці `roles`
--

INSERT INTO `roles` (`id`, `title`) VALUES
(1, 'Administrator'),
(2, 'Client');

-- --------------------------------------------------------

--
-- Структура таблиці `sizes`
--

CREATE TABLE `sizes` (
  `id` int(11) UNSIGNED NOT NULL,
  `title` varchar(200) NOT NULL,
  `title_key` varchar(200) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='sizes';

--
-- Дамп даних таблиці `sizes`
--

INSERT INTO `sizes` (`id`, `title`, `title_key`) VALUES
(1, '44 / XXS', 'clothes'),
(2, '46 / XS', 'clothes'),
(3, '48 / S', 'clothes'),
(4, '50 / M', 'clothes'),
(5, '52 / L', 'clothes'),
(6, '54 / XL', 'clothes'),
(7, '56 / XXL', 'clothes'),
(8, '58 / XXXL', 'clothes'),
(9, '60 / XXXL', 'clothes'),
(10, '62 / XXXL', 'clothes'),
(11, '64 / 4XL', 'clothes'),
(12, '66 / 4XL', 'clothes'),
(13, '68 / 5XL', 'clothes'),
(14, 'б/р', 'clothes'),
(15, '40', 'headwear'),
(16, '42', 'headwear'),
(17, '44', 'headwear'),
(18, '46', 'headwear'),
(19, '48', 'headwear'),
(20, '50', 'headwear'),
(21, '52', 'headwear'),
(22, '54', 'headwear'),
(23, '56', 'headwear'),
(24, '58', 'headwear'),
(25, '60', 'headwear'),
(26, 'XS', 'gloves'),
(27, 'S', 'gloves'),
(28, 'M', 'gloves'),
(29, 'L', 'gloves'),
(30, 'XL', 'gloves'),
(31, 'XXL', 'gloves'),
(32, '35', 'shoes'),
(33, '36', 'shoes'),
(34, '37', 'shoes'),
(35, '38', 'shoes'),
(36, '39', 'shoes'),
(37, '40', 'shoes'),
(38, '41', 'shoes'),
(39, '42', 'shoes'),
(40, '43', 'shoes'),
(41, '44', 'shoes'),
(42, '45', 'shoes');

-- --------------------------------------------------------

--
-- Структура таблиці `users`
--

CREATE TABLE `users` (
  `id` int(11) UNSIGNED NOT NULL,
  `first_name` varchar(200) NOT NULL,
  `last_name` varchar(200) DEFAULT NULL,
  `phone` varchar(200) DEFAULT NULL,
  `email` varchar(200) NOT NULL,
  `password` varchar(200) NOT NULL,
  `role_id` int(11) UNSIGNED NOT NULL,
  `patronymic` varchar(200) DEFAULT NULL,
  `gender` varchar(200) DEFAULT NULL,
  `birthday` datetime DEFAULT NULL,
  `city` varchar(200) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='users';

--
-- Дамп даних таблиці `users`
--

INSERT INTO `users` (`id`, `first_name`, `last_name`, `phone`, `email`, `password`, `role_id`, `patronymic`, `gender`, `birthday`, `city`) VALUES
(1, 'root', NULL, NULL, 'root@sda.ch', '$2y$10$s2gixzBgWU.TNQ14NcdmFewSeSqHRccXlUrFEax0csyi2RQQqCYku', 1, '', 'male', '1970-01-01 16:28:09', ''),
(5, 'Іван', 'Шевченко', '+380961111111', 'ivan@gmail.com', '$2y$10$.wT1zBQ.Y0dNJhBej4t/QuL6I5uu.g0E0oZWh9fekSV7FBnGVA5me', 2, 'Петрович', 'male', '1970-02-14 00:00:00', 'Київ');

--
-- Індекси збережених таблиць
--

--
-- Індекси таблиці `brands`
--
ALTER TABLE `brands`
  ADD PRIMARY KEY (`id`);

--
-- Індекси таблиці `category`
--
ALTER TABLE `category`
  ADD PRIMARY KEY (`id`);

--
-- Індекси таблиці `categorysub`
--
ALTER TABLE `categorysub`
  ADD PRIMARY KEY (`id`);

--
-- Індекси таблиці `categorysubsub`
--
ALTER TABLE `categorysubsub`
  ADD PRIMARY KEY (`id`),
  ADD KEY `categorysub_id` (`categorysub_id`);

--
-- Індекси таблиці `colors`
--
ALTER TABLE `colors`
  ADD PRIMARY KEY (`id`);

--
-- Індекси таблиці `countriesproduct`
--
ALTER TABLE `countriesproduct`
  ADD PRIMARY KEY (`id`);

--
-- Індекси таблиці `deliverytype`
--
ALTER TABLE `deliverytype`
  ADD PRIMARY KEY (`id`);

--
-- Індекси таблиці `materials`
--
ALTER TABLE `materials`
  ADD PRIMARY KEY (`id`);

--
-- Індекси таблиці `orderidproductid`
--
ALTER TABLE `orderidproductid`
  ADD PRIMARY KEY (`id`);

--
-- Індекси таблиці `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`id`),
  ADD KEY `client_id` (`user_id`),
  ADD KEY `delivery_type_id` (`delivery_type_id`),
  ADD KEY `paymment_type_id` (`payment_type_id`),
  ADD KEY `recipient_id` (`recipient_id`);

--
-- Індекси таблиці `paymenttype`
--
ALTER TABLE `paymenttype`
  ADD PRIMARY KEY (`id`);

--
-- Індекси таблиці `productidsizeid`
--
ALTER TABLE `productidsizeid`
  ADD PRIMARY KEY (`id`),
  ADD KEY `productid` (`productid`),
  ADD KEY `sizeid` (`sizeid`);

--
-- Індекси таблиці `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`id`),
  ADD KEY `color_id` (`color_id`),
  ADD KEY `brand_id` (`brand_id`),
  ADD KEY `material_id` (`material_id`),
  ADD KEY `country_product_id` (`country_product_id`),
  ADD KEY `category_id` (`category_id`),
  ADD KEY `category_sub_id` (`category_sub_id`),
  ADD KEY `category_sub_sub_id` (`category_sub_sub_id`);

--
-- Індекси таблиці `recipients`
--
ALTER TABLE `recipients`
  ADD PRIMARY KEY (`id`);

--
-- Індекси таблиці `reviews`
--
ALTER TABLE `reviews`
  ADD PRIMARY KEY (`id`),
  ADD KEY `reviews_ibfk_1` (`user_id`),
  ADD KEY `product_id` (`product_id`);

--
-- Індекси таблиці `roles`
--
ALTER TABLE `roles`
  ADD PRIMARY KEY (`id`);

--
-- Індекси таблиці `sizes`
--
ALTER TABLE `sizes`
  ADD PRIMARY KEY (`id`);

--
-- Індекси таблиці `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD KEY `role_id` (`role_id`);

--
-- AUTO_INCREMENT для збережених таблиць
--

--
-- AUTO_INCREMENT для таблиці `brands`
--
ALTER TABLE `brands`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT для таблиці `category`
--
ALTER TABLE `category`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT для таблиці `categorysub`
--
ALTER TABLE `categorysub`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT для таблиці `categorysubsub`
--
ALTER TABLE `categorysubsub`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=56;

--
-- AUTO_INCREMENT для таблиці `colors`
--
ALTER TABLE `colors`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT для таблиці `countriesproduct`
--
ALTER TABLE `countriesproduct`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT для таблиці `deliverytype`
--
ALTER TABLE `deliverytype`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT для таблиці `materials`
--
ALTER TABLE `materials`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT для таблиці `orderidproductid`
--
ALTER TABLE `orderidproductid`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=95;

--
-- AUTO_INCREMENT для таблиці `orders`
--
ALTER TABLE `orders`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=121;

--
-- AUTO_INCREMENT для таблиці `paymenttype`
--
ALTER TABLE `paymenttype`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT для таблиці `productidsizeid`
--
ALTER TABLE `productidsizeid`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=300;

--
-- AUTO_INCREMENT для таблиці `products`
--
ALTER TABLE `products`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=134;

--
-- AUTO_INCREMENT для таблиці `recipients`
--
ALTER TABLE `recipients`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=29;

--
-- AUTO_INCREMENT для таблиці `reviews`
--
ALTER TABLE `reviews`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;

--
-- AUTO_INCREMENT для таблиці `roles`
--
ALTER TABLE `roles`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT для таблиці `sizes`
--
ALTER TABLE `sizes`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=43;

--
-- AUTO_INCREMENT для таблиці `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- Обмеження зовнішнього ключа збережених таблиць
--

--
-- Обмеження зовнішнього ключа таблиці `categorysubsub`
--
ALTER TABLE `categorysubsub`
  ADD CONSTRAINT `categorysubsub_ibfk_1` FOREIGN KEY (`categorysub_id`) REFERENCES `categorysub` (`id`);

--
-- Обмеження зовнішнього ключа таблиці `orders`
--
ALTER TABLE `orders`
  ADD CONSTRAINT `orders_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`),
  ADD CONSTRAINT `orders_ibfk_2` FOREIGN KEY (`delivery_type_id`) REFERENCES `deliverytype` (`id`),
  ADD CONSTRAINT `orders_ibfk_3` FOREIGN KEY (`payment_type_id`) REFERENCES `paymenttype` (`id`),
  ADD CONSTRAINT `orders_ibfk_4` FOREIGN KEY (`recipient_id`) REFERENCES `recipients` (`id`);

--
-- Обмеження зовнішнього ключа таблиці `productidsizeid`
--
ALTER TABLE `productidsizeid`
  ADD CONSTRAINT `productidsizeid_ibfk_1` FOREIGN KEY (`productid`) REFERENCES `products` (`id`),
  ADD CONSTRAINT `productidsizeid_ibfk_2` FOREIGN KEY (`sizeid`) REFERENCES `sizes` (`id`);

--
-- Обмеження зовнішнього ключа таблиці `products`
--
ALTER TABLE `products`
  ADD CONSTRAINT `products_ibfk_2` FOREIGN KEY (`color_id`) REFERENCES `colors` (`id`),
  ADD CONSTRAINT `products_ibfk_3` FOREIGN KEY (`brand_id`) REFERENCES `brands` (`id`),
  ADD CONSTRAINT `products_ibfk_4` FOREIGN KEY (`material_id`) REFERENCES `materials` (`id`),
  ADD CONSTRAINT `products_ibfk_5` FOREIGN KEY (`country_product_id`) REFERENCES `countriesproduct` (`id`),
  ADD CONSTRAINT `products_ibfk_6` FOREIGN KEY (`category_id`) REFERENCES `category` (`id`),
  ADD CONSTRAINT `products_ibfk_7` FOREIGN KEY (`category_sub_id`) REFERENCES `categorysub` (`id`),
  ADD CONSTRAINT `products_ibfk_8` FOREIGN KEY (`category_sub_sub_id`) REFERENCES `categorysubsub` (`id`);

--
-- Обмеження зовнішнього ключа таблиці `reviews`
--
ALTER TABLE `reviews`
  ADD CONSTRAINT `reviews_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`),
  ADD CONSTRAINT `reviews_ibfk_2` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`);

--
-- Обмеження зовнішнього ключа таблиці `users`
--
ALTER TABLE `users`
  ADD CONSTRAINT `users_ibfk_1` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
