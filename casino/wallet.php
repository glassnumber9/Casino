<?php
session_start();
require 'db.php';
if (!isset($_SESSION['user_id'])) {
    echo json_encode(['balance' => '未登入']);
    exit;
}
$stmt = $pdo->prepare("SELECT wallet_balance FROM users WHERE id=?");
$stmt->execute([$_SESSION['user_id']]);
$row = $stmt->fetch();
echo json_encode(['balance' => $row ? $row['wallet_balance'] : 0]);
