CREATE DATABASE module02_session02_db;
USE module02_session02_db;
CREATE TABLE products (
    Ma_san_pham INT PRIMARY KEY, 
    Ten_san_pham VARCHAR(255) NOT NULL,       
    Gia_ban DECIMAL(10, 2) NOT NULL,             
    ton_kho INT
);