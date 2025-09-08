<?php
require 'db.php';
$username = $_POST['username'] ?? '';
$password = $_POST['password'] ?? '';
$email = $_POST['email'] ?? '';
$phone = $_POST['phone'] ?? '';
if (strlen($username) < 6 || strlen($username) > 20) {
    exit('帳號需6-20字元');
}
if (strlen($password) < 8) {
    exit('密碼需至少8字元');
}
$stmt = $pdo->prepare("SELECT id FROM users WHERE username=?");
$stmt->execute([$username]);
if ($stmt->fetch()) {
    exit('帳號已存在');
}
$fullname = $username;
$stmt = $pdo->prepare("INSERT INTO users (username, password, fullname) VALUES (?, ?, ?)");
$stmt->execute([$username, $password, $fullname]);
echo '註冊成功，請登入！';
