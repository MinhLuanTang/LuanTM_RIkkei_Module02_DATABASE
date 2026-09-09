CREATE DATABASE BAITAPSESSION4;
use BAITAPSESSION4;
CREATE TABLE students (
    student_id VARCHAR(10) PRIMARY KEY,
    full_name VARCHAR(100) NOT NULL,
    birth_date DATE NOT NULL,
    gender VARCHAR(10) NOT NULL,
    email VARCHAR(100)
);

INSERT INTO students (student_id, full_name, birth_date, gender, email) VALUES
('SV001', 'Nguyen Van A', '2002-05-15', 'Nam', 'nguyenvana@gmail.com'),
('SV002', 'Tran Thi B', '2003-08-20', 'Nu', 'tranthib@gmail.com'),
('SV003', 'Le Hoang C', '2002-11-02', 'Nam', 'lehoangc@gmail.com'),
('SV004', 'Pham Minh D', '2003-01-10', 'Nam', 'phamminhd@gmail.com'),
('SV005', 'Vo Thi E', '2002-09-25', 'Nu', NULL);

SELECT * FROM students;

SELECT student_id, full_name, email FROM students;