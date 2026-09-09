CREATE DATABASE quan_ly_tai_khoan;
USE quan_ly_tai_khoan;

CREATE TABLE users (
    ma_nguoi_dung INT PRIMARY KEY,
    ten_dang_nhap VARCHAR(50) NOT NULL UNIQUE,
    mat_khau VARCHAR(255) NOT NULL,
    email VARCHAR(100) NOT NULL UNIQUE,
    trang_thai VARCHAR(20) DEFAULT 'KICH_HOAT'
);

ALTER TABLE users
ADD CHECK (trang_thai IN ('KICH_HOAT', 'KHOA'));

DROP TABLE users;