-- Tạo database
CREATE DATABASE mbti_schema;
USE mbti_schema;

-- Thông tin người dùng
CREATE TABLE users (
    id INT AUTO_INCREMENT PRIMARY KEY,
    username VARCHAR(50) NOT NULL UNIQUE,
    email VARCHAR(100) NOT NULL UNIQUE,
    password VARCHAR(255) NOT NULL,
    created_at DATETIME DEFAULT CURRENT_TIMESTAMP
);
-- Câu hỏi trắc nghiệm (Likert scale)
CREATE TABLE questions (
    question_id INT AUTO_INCREMENT PRIMARY KEY,
    question_text TEXT NOT NULL,
    category ENUM('EI', 'SN', 'TF', 'JP') NOT NULL
);
-- Kết quả trắc nghiệm của người dùng
CREATE TABLE results (
    id INT AUTO_INCREMENT PRIMARY KEY,
    user_id INT NOT NULL,
    personality_type CHAR(4) NOT NULL,  -- ví dụ: 'INTJ'
    taken_at DATETIME DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (user_id) REFERENCES users(id) ON DELETE CASCADE
);
-- Thư viện thông tin về các loại tính cách
CREATE TABLE personality_types (
    personality_type_id CHAR(4) PRIMARY KEY NOT NULL,  -- ví dụ: 'INTJ'
    type_name Varchar(50) not null,
    description TEXT NOT NULL,      -- mô tả đặc điểm tính cách
    strengths text not null,
    weaknesses text not null
);
-- dữ liệu nhóm ngành 
CREATE TABLE majors (
	major_id INT AUTO_INCREMENT PRIMARY KEY,
    major_name VARCHAR(255) NOT NULL, 
    description text not null    
);

-- dữ liệu trường
CREATE TABLE schools(
	school_id INT AUTO_INCREMENT PRIMARY KEY,
    school_name VARCHAR(255) NOT NULL,
    description text not null  
);
-- bảng trung gian giữa loại tính cách và nhóm ngành
CREATE TABLE personality_major (
    personality_type_id CHAR(4),
    major_id INT,
    PRIMARY KEY (personality_type_id, major_id),
    FOREIGN KEY (personality_type_id) REFERENCES personality_types(personality_type_id),
    FOREIGN KEY (major_id) REFERENCES majors(major_id)
);
-- bảng trung gian giữa nhóm ngành và trường đại học
CREATE TABLE major_school (
    major_id INT,
    school_id INT,
    PRIMARY KEY (major_id, school_id),
    FOREIGN KEY (major_id) REFERENCES majors(major_id),
    FOREIGN KEY (school_id) REFERENCES schools(school_id)
);

-- Lưu từng câu trả lời của người dùng (Likert scale từ 1 đến 7)
CREATE TABLE user_answers (
    id INT AUTO_INCREMENT PRIMARY KEY,
    result_id INT NOT NULL,
    question_id INT NOT NULL,
    selected_score INT CHECK (selected_score BETWEEN -3 AND 3),  
    FOREIGN KEY (result_id) REFERENCES results(id) ON DELETE CASCADE,
    FOREIGN KEY (question_id) REFERENCES questions(id) ON DELETE CASCADE
);
