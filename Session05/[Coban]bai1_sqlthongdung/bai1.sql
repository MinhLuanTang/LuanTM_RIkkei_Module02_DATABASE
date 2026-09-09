CREATE DATABASE BTSsession5;
USE BTSsession5;

CREATE TABLE students (
    student_id VARCHAR(10) PRIMARY KEY,
    full_name VARCHAR(100) NOT NULL,
    birth_year INT NOT NULL,
    gender VARCHAR(10) NOT NULL,
    score DECIMAL(4, 2) NOT NULL
);

INSERT INTO students (student_id, full_name, birth_year, gender, score) VALUES
('SV001', 'Nguyen Van Anh', 2002, 'Nam', 8.45),
('SV002', 'Tran Thi Bich', 2003, 'Nu', 7.13),
('SV003', 'Le Hoang Cuong', 2001, 'Nam', 9.80),
('SV004', 'Pham Minh Dung', 2004, 'Nam', 5.67),
('SV005', 'Vo Thi Em', 2003, 'Nu', 6.44);

SELECT 
    student_id, 
    UPPER(full_name) AS ho_ten_in_hoa 
FROM students;


SELECT 
    full_name, 
    (2026 - birth_year) AS tuoi 
FROM students;


SELECT 
    student_id,
    full_name,
    ROUND(score, 1) AS diem_trung_binh_lam_tron 
FROM students;


SELECT 
    COUNT(*) AS tong_so_sinh_vien,
    MAX(score) AS diem_cao_nhat,
    MIN(score) AS diem_thap_nhat 
FROM students;