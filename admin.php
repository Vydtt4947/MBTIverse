<?php
include_once "inc/db.php";  // kết nối DB

if ($_SERVER["REQUEST_METHOD"] === "POST") {
    $type_id = $_POST['type_id'] ?? '';
    $type_name = $_POST['type_name'] ?? '';
    $description = $_POST['description'] ?? '';
    $strengths = $_POST['strengths'] ?? null;
    $weaknesses = $_POST['weaknesses'] ?? null;

    // Câu lệnh SQL chuẩn bị
    $stmt = $conn->prepare("INSERT INTO personality_types (personality_type_id, type_name, description, strengths, weaknesses) VALUES (?, ?, ?, ?, ?)");
    $stmt->bind_param("sssss", $type_id, $type_name, $description, $strengths, $weaknesses);

    if ($stmt->execute()) {
        echo "Đã thêm thành công.";
    } else {
        echo "Lỗi: " . $stmt->error;
    }
}
?>

<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8" />
    <title>Nhập dữ liệu MBTI</title>
</head>
<body>
    <h1>Nhập dữ liệu loại tính cách MBTI</h1>
    <form method="post" action="tranadmin.php">
        <label>Mã loại tính cách (VD: ISTJ): <input type="text" name="type_id" required></label><br><br>
        <label>Tên loại tính cách: <input type="text" name="type_name" required></label><br><br>
        <label>Mô tả:<br>
            <textarea name="description" rows="6" cols="60" required></textarea>
        </label><br><br>
        <label>Điểm mạnh:<br>
            <textarea name="strengths" rows="4" cols="60"></textarea>
        </label><br><br>
        <label>Điểm yếu:<br>
            <textarea name="weaknesses" rows="4" cols="60"></textarea>
        </label><br><br>
        <input type="submit" value="Thêm loại tính cách">
    </form>
</body>
</html>
