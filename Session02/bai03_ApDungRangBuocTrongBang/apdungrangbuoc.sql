CREATE DATABASE module02_session02_db;
USE module02_session02_db;
CREATE TABLE students_constraint (
    ma_sinh_vien INT PRIMARY KEY,
    ho_ten VARCHAR(255) NOT NULL,
    email VARCHAR(255) UNIQUE,
    tuoi INT CHECK (tuoi >= 18)
);