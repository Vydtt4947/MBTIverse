-- Tạo database
CREATE DATABASE mbti_schema;
USE mbti_schema;

-- Thông tin người dùng
CREATE TABLE users (
    id INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    username VARCHAR(50) NOT NULL UNIQUE,
    email VARCHAR(100) NOT NULL UNIQUE,
    password VARCHAR(255) NOT NULL,
    created_at DATETIME DEFAULT CURRENT_TIMESTAMP
);

-- Câu hỏi trắc nghiệm (Likert scale)
CREATE TABLE questions (
    question_id INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    question_text TEXT NOT NULL,
    category ENUM('EI', 'SN', 'TF', 'JP') NOT NULL,
    trait_positive CHAR(1) NOT NULL, -- ví dụ: E
    trait_negative CHAR(1) NOT NULL  -- ví dụ: I
);

-- Kết quả trắc nghiệm của người dùng
CREATE TABLE results (
    id INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    user_id INT UNSIGNED NOT NULL,
    personality_type CHAR(4) NOT NULL,
    taken_at DATETIME DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (user_id) REFERENCES users(id) ON DELETE CASCADE
);

-- Thư viện thông tin về các loại tính cách
CREATE TABLE personality_types (
    personality_type_id CHAR(4) PRIMARY KEY NOT NULL,
    type_name VARCHAR(50) NOT NULL,
    description TEXT NOT NULL,
    strengths TEXT NOT NULL,
    weaknesses TEXT NOT NULL
);

-- Dữ liệu nhóm ngành
CREATE TABLE majors (
    major_id INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    major_name VARCHAR(255) NOT NULL,
    description TEXT NOT NULL
);

-- Dữ liệu trường
CREATE TABLE schools (
    school_id INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    school_name VARCHAR(255) NOT NULL,
    description TEXT NOT NULL
);

-- Bảng trung gian giữa loại tính cách và nhóm ngành
CREATE TABLE personality_major (
    personality_type_id CHAR(4),
    major_id INT UNSIGNED,
    PRIMARY KEY (personality_type_id, major_id),
    FOREIGN KEY (personality_type_id) REFERENCES personality_types(personality_type_id),
    FOREIGN KEY (major_id) REFERENCES majors(major_id)
);

-- Bảng trung gian giữa nhóm ngành và trường đại học
CREATE TABLE major_school (
    major_id INT UNSIGNED,
    school_id INT UNSIGNED,
    PRIMARY KEY (major_id, school_id),
    FOREIGN KEY (major_id) REFERENCES majors(major_id),
    FOREIGN KEY (school_id) REFERENCES schools(school_id)
);

-- Lưu từng câu trả lời của người dùng (Likert scale từ -3 đến 3)
CREATE TABLE user_answers (
    id INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    result_id INT UNSIGNED NOT NULL,
    question_id INT UNSIGNED NOT NULL,
    selected_score INT CHECK (selected_score BETWEEN -3 AND 3),
    FOREIGN KEY (result_id) REFERENCES results(id) ON DELETE CASCADE,
    FOREIGN KEY (question_id) REFERENCES questions(question_id) ON DELETE CASCADE
);
