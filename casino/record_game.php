<?php
session_start();
require 'db.php';
$data = json_decode(file_get_contents('php://input'), true);
$username = $data['username'] ?? '';
$bet_amount = intval($data['bet']);
$game_result = $data['result'];
$player_score = intval($data['player']);
$dealer_score = intval($data['dealer']);
$new_balance = floatval($data['balance']);

$stmt = $pdo->prepare("SELECT id FROM users WHERE username=?");
$stmt->execute([$username]);
$user = $stmt->fetch();
if (!$user) exit('帳號不存在');
$user_id = $user['id'];

$stmt = $pdo->prepare("INSERT INTO blackjack_records (user_id, bet_amount, game_result, player_score, dealer_score) VALUES (?, ?, ?, ?, ?)");
$stmt->execute([$user_id, $bet_amount, $game_result, $player_score, $dealer_score]);

$stmt = $pdo->prepare("UPDATE users SET wallet_balance=? WHERE id=?");
$stmt->execute([$new_balance, $user_id]);

echo 'ok';
