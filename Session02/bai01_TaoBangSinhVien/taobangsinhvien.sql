CREATE DATABASE module02_session02_db;
USE module02_session02_db;
CREATE TABLE students (
    ma_sinh_vien INT PRIMARY KEY, 
    ho_ten VARCHAR(255) NOT NULL,  
    ngay_sinh DATE,              
    gioi_tinh VARCHAR(255)    
);