-- 建立資料庫
CREATE DATABASE IF NOT EXISTS casino CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
USE casino;

-- 使用者資料表
CREATE TABLE IF NOT EXISTS users (
    id INT AUTO_INCREMENT PRIMARY KEY,
    username VARCHAR(50) UNIQUE NOT NULL,
    password VARCHAR(255) NOT NULL,
    fullname VARCHAR(100) NOT NULL,
    wallet_balance DECIMAL(10,2) DEFAULT 1000.00,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- 21點紀錄資料表
CREATE TABLE IF NOT EXISTS blackjack_records (
    id INT AUTO_INCREMENT PRIMARY KEY,
    user_id INT NOT NULL,
    bet_amount DECIMAL(10,2) NOT NULL,
    game_result VARCHAR(10) NOT NULL,
    player_score INT NOT NULL,
    dealer_score INT NOT NULL,
    played_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (user_id) REFERENCES users(id) ON DELETE CASCADE
);

-- 假使用者資料（密碼為明碼：password123）
INSERT INTO users (username, password, fullname, wallet_balance) VALUES
('alice', 'password123', '愛麗絲', 1200.00),
('bob', 'password123', '鮑伯', 800.00),
('charlie', 'password123', '查理', 950.00);

-- 假遊戲紀錄資料
INSERT INTO blackjack_records (user_id, bet_amount, game_result, player_score, dealer_score) VALUES
(1, 100.00, 'win', 20, 17),
(1, 150.00, 'lose', 18, 21),
(2, 200.00, 'tie', 19, 19),
(3, 120.00, 'win', 21, 20),
(3, 50.00, 'lose', 16, 20);