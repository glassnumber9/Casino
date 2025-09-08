<?php
session_start();
require 'db.php';

if ($_SERVER['REQUEST_METHOD'] === 'POST') {
    $username = $_POST['username'] ?? '';
    $password = $_POST['password'] ?? '';

    // 檢查欄位是否有值
    if (!$username || !$password) {
        echo json_encode(['success' => false, 'message' => '請輸入帳號和密碼']);
        exit;
    }

    // 查詢資料庫
    $stmt = $pdo->prepare("SELECT id, password FROM users WHERE username=?");
    $stmt->execute([$username]);
    $user = $stmt->fetch(PDO::FETCH_ASSOC);

    // 明碼比對
    if ($user && $user['password'] === $password) {
        $_SESSION['user_id'] = $user['id'];
        $_SESSION['username'] = $username;
        echo json_encode(['success' => true]);
    } else {
        echo json_encode(['success' => false, 'message' => '帳號或密碼錯誤']);
    }
    exit;
}
