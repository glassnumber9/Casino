-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- 主機： 127.0.0.1
-- 產生時間： 2025-07-17 04:17:45
-- 伺服器版本： 10.4.32-MariaDB
-- PHP 版本： 8.0.30

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- 資料庫： `casino`
--

-- --------------------------------------------------------

--
-- 資料表結構 `blackjack_records`
--

CREATE TABLE `blackjack_records` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `bet_amount` decimal(10,2) NOT NULL,
  `game_result` varchar(10) NOT NULL,
  `player_score` int(11) NOT NULL,
  `dealer_score` int(11) NOT NULL,
  `played_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- 傾印資料表的資料 `blackjack_records`
--

INSERT INTO `blackjack_records` (`id`, `user_id`, `bet_amount`, `game_result`, `player_score`, `dealer_score`, `played_at`) VALUES
(1, 1, 100.00, 'win', 20, 17, '2025-07-16 14:18:24'),
(2, 1, 150.00, 'lose', 18, 21, '2025-07-16 14:18:24'),
(3, 2, 200.00, 'tie', 19, 19, '2025-07-16 14:18:24'),
(4, 3, 120.00, 'win', 21, 20, '2025-07-16 14:18:24'),
(5, 3, 50.00, 'lose', 16, 20, '2025-07-16 14:18:24'),
(6, 4, 100.00, 'lose', 26, 16, '2025-07-16 14:20:44');

-- --------------------------------------------------------

--
-- 資料表結構 `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `username` varchar(50) NOT NULL,
  `password` varchar(255) NOT NULL,
  `fullname` varchar(100) NOT NULL,
  `wallet_balance` decimal(10,2) DEFAULT 1000.00,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- 傾印資料表的資料 `users`
--

INSERT INTO `users` (`id`, `username`, `password`, `fullname`, `wallet_balance`, `created_at`) VALUES
(1, 'alice', 'password123', '愛麗絲', 1200.00, '2025-07-16 14:18:24'),
(2, 'bob', 'password123', '鮑伯', 800.00, '2025-07-16 14:18:24'),
(3, 'charlie', 'password123', '查理', 950.00, '2025-07-16 14:18:24'),
(4, 'mythlife1999', '12345678', 'mythlife1999', 900.00, '2025-07-16 14:20:11');

--
-- 已傾印資料表的索引
--

--
-- 資料表索引 `blackjack_records`
--
ALTER TABLE `blackjack_records`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`user_id`);

--
-- 資料表索引 `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `username` (`username`);

--
-- 在傾印的資料表使用自動遞增(AUTO_INCREMENT)
--

--
-- 使用資料表自動遞增(AUTO_INCREMENT) `blackjack_records`
--
ALTER TABLE `blackjack_records`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- 使用資料表自動遞增(AUTO_INCREMENT) `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- 已傾印資料表的限制式
--

--
-- 資料表的限制式 `blackjack_records`
--
ALTER TABLE `blackjack_records`
  ADD CONSTRAINT `blackjack_records_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
