1. Tổng quan chức năng website MBTIverse
| Tính năng chính | Mô tả |
 |-----------------|-------|
 | Trang chủ   	| Giới thiệu MBTI, lợi ích khi làm bài test |
 |trang  Đăng ký/Đăng nhập | Cho phép người dùng tạo tài khoản, đăng nhập, lưu kết quả |
 | trang Làm bài trắc nghiệm |49 câu hỏi, chọn đáp án để xác định loại tính cách từ không đồng ý  -3 -> 3 đồng ý | | Hiển thị loại tính cách, mô tả, gợi ý nhóm ngành & trường đại học |
 | trang Thư viện tra cứu MBTI | Tổng hợp kiến thức 16 loại tính cách |
 | trang cá nhân| Người dùng xem lại lịch sử làm bài , các thông tin tài khoản |
2. Công cụ & Công nghệ
- IDE: Visual Studio Code (VSC)
 - Frontend: HTML, CSS , JavaScript
 - Backend: PHP
 - Database: MySQL
 - Tài khoản người dùng: PHP + Sessions + MySQL

 Cấu trúc thư mục:
 mbtiverse/
 │
 ├── index.php (trang chủ)
 ├── dangnhap_dangky.php (xử lí đăng nhập/ đăng kí)
 ├── test.php( làm bài kiểm tra mbti)
 ├── library.php (thông tin của các loại tính cách)
 ├── trangcanhan.php ( lịch sử kết quả những lần thực hiện trước)
 │—--- tranadmin.php
 ├── assets/
 │   ├── css/
 │   ├── js/
 │   └── images/
 │
 ├── inc/
 │   ├── header.php
 │   └── db.php
 │
 └── sql/
 	└── mbti_schema.sql
