CREATE DATABASE quan_ly_sinh_vien;
USE quan_ly_sinh_vien;

CREATE TABLE classes (
    ma_lop VARCHAR(10) PRIMARY KEY,
    ten_lop VARCHAR(100) NOT NULL,
    nien_khoa VARCHAR(20) NOT NULL
    
);

CREATE TABLE students (
    ma_sinh_vien VARCHAR(15) PRIMARY KEY,
    ho_ten VARCHAR(100) NOT NULL,
    ngay_sinh DATE NOT NULL,
    email VARCHAR(100) NOT NULL,
    ma_lop VARCHAR(10) NOT NULL,	
    FOREIGN KEY (ma_lop) REFERENCES classes(ma_lop)
);