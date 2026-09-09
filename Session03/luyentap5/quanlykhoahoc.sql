CREATE DATABASE quan_ly_hoc_truc_tuyen;
USE quan_ly_hoc_truc_tuyen;

CREATE TABLE teachers (
    ma_giang_vien VARCHAR(10) PRIMARY KEY,
    ho_ten VARCHAR(100) NOT NULL,
    email VARCHAR(100) NOT NULL UNIQUE
);

CREATE TABLE courses (
    ma_khoa_hoc VARCHAR(10) PRIMARY KEY,
    ten_khoa_hoc VARCHAR(150) NOT NULL,
    mo_ta_ngan VARCHAR(255),
    gia DECIMAL(12, 2) NOT NULL,
    ma_giang_vien VARCHAR(10) NOT NULL,    
    FOREIGN KEY (ma_giang_vien) REFERENCES teachers(ma_giang_vien)
);

CREATE TABLE students (
    ma_hoc_vien VARCHAR(10) PRIMARY KEY,
    ho_ten VARCHAR(100) NOT NULL,
    email VARCHAR(100) NOT NULL UNIQUE
    );

CREATE TABLE enrollments (
    ma_dang_ky VARCHAR(10) PRIMARY KEY,
    ma_hoc_vien VARCHAR(10) NOT NULL,
    ma_khoa_hoc VARCHAR(10) NOT NULL,
    ngay_dang_ky DATE NOT NULL,
    FOREIGN KEY (ma_hoc_vien) REFERENCES students(ma_hoc_vien),
    FOREIGN KEY (ma_khoa_hoc) REFERENCES courses(ma_khoa_hoc)
);


ALTER TABLE courses
ADD CHECK (gia > 0);

DROP TABLE enrollments;