<?php
$host = 'localhost';
$username = 'root';
$password = '123456'; 
$database = 'mbti_schema'; 

$conn = new mysqli($host, $username, $password, $database);

if ($conn->connect_error) {
    die("Kết nối thất bại: " . $conn->connect_error);
}
// Nếu không bị lỗi thì kết nối thành công
?>

