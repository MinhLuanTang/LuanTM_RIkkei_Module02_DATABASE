CREATE DATABASE module02_session02_db;
USE module02_session02_db;
CREATE TABLE users (
    ma_nguoi_dung INT PRIMARY KEY,
    ten_dang_nhap VARCHAR(255) UNIQUE,  
    mat_khau VARCHAR(255) NOT NULL,    
    trang_thai VARCHAR(255) DEFAULT 'ACTIVE'
        CHECK (trang_thai IN ('ACTIVE', 'INACTIVE'))
);